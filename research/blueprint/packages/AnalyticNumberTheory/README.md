# Roadmap: analytic number theory

**Summary.** Build quantitative analytic number theory on the existing arithmetic Dirichlet-series and Tauberian framework. The central results are effective prime estimates with exceptional-zero conventions, multiplicity-sensitive explicit formulas, conductor-normalized Hecke and Artin comparisons, multiplicative mean and smooth-number estimates, Lerch and Barnes special functions, quadratic double Dirichlet and binary-cubic zeta functions, and the Bost–Connes phase transition together with compact scalar spectral determinants. Definitions carry their intended interface and concrete checks; conditional results state their hypotheses explicitly.

## Scope and ownership

This is the analytic continuation of ArithmeticDirichletSeries. It owns quantitative refinements and the analytic comparisons below. It also owns the particular Hecke algebra and operator-algebra constructions needed for Bost–Connes, the Mellin and determinant constructions for compact hyperbolic surfaces, and the analytic continuation of the selected prehomogeneous and double Dirichlet series. These objects are different: a spectral determinant is not a prime-system zeta function, and a quadratic reciprocity matrix is not the binary-cubic Fourier matrix.

### Prerequisites and boundaries

ArithmeticDirichletSeries supplies norm-indexed ideal coefficients, genuine Euler products, partial-sum continuation, Abel and Perron summation, Landau positivity, Wiener–Ikehara and the qualitative transfer from logarithmic derivatives to prime counts. Mathlib supplies arithmetic functions, ordinary Dirichlet-series continuation and functional equations, nonvanishing on the closed right half-plane, the real Dedekind residue limit, and the circle-valued real Hurwitz zeta function. None of these is constructed again here.

Integral Brauer induction and nilpotent monomiality are already in the current Tau Ceti library; their exact combination is specified under [From RepresentationTheory](#from-representationtheory). The Artin targets add arithmetic Euler-factor and continuation comparisons, rather than another representation-theoretic induction theorem.

The qualitative prime ideal theorem is `TauCeti.primeIdealTheorem`, in `TauCeti.NumberTheory.ArithmeticDirichletSeries.Prime.PrimeIdealTheorem`. Its count form is `TauCeti.primeCount_univ_isEquivalent_div_log`. Qualitative Frobenius prime counts are `NumberField.Chebotarev.tendsto_frobeniusPrimeCount`, in `TauCeti.NumberTheory.Chebotarev.PrimeCounting.FrobeniusPrimeCount`. Chebotarev Layers 13–14 supply the rational progression and total-prime specializations. Their comparison with inclusive rational Chebyshev sums uses `NumberField.Chebotarev.frobeniusVonMangoldtCoeff_galEquivZMod_symm_of_coprime`. The all-input identity `frobeniusVonMangoldtCoeff_galEquivZMod_symm` requires `q % 4 ≠ 2`; at a level congruent to 2 modulo 4, discard the finitely many prime-power contributions dividing the level instead. For example, the unramified prime 2 in the conductor-reduced cyclotomic field cannot be treated as a unit modulo 6. The quantitative results below require new error bounds, not another qualitative PNT.

The current generic weight nonvanishing theorems in `TauCeti.NumberTheory.ArithmeticDirichletSeries.Cancellation.Nonvanishing` already cover `Re s > 1`, the square-with-cancellation case on `Re s ≥ 1`, and a quadratic weight away from `s=1`: use `continuedLFunctionOfWeight_ne_zero_of_one_lt_re`, `continuedLFunctionOfWeight_ne_zero_of_hasCancellation_sq` and `continuedLFunctionOfWeight_ne_zero_of_isTrivialOnGood_sq`. The Hecke boundary comparison below adds the exact ray-character identification and the quadratic endpoint at 1. Its continuation is the canonical Tate continuation; it is not an arbitrary function with a prescribed Euler product.

Completed ContourIntegration and the current contour library supply the general residue theorem and argument principle. Use `TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous` for a cycle in an open set, a finite singularity set, meromorphic germs at the singularities, an off-singularity trace and null-homology. Use `TauCeti.Contour.argumentPrinciple_nullHomologous` with an off-divisor piecewise C¹ closed path and finite integer meromorphic orders. The contour work here consists of rectangle adapters, branch and phase bounds, safe heights and infinite-height limits.

ProfiniteArithmetic Layer 0 owns the ring of profinite integers, its product of p-adic factors, finite projections, units and compatible character lifting. RestrictedProducts owns the restricted-product carrier and topology; GlobalNumberFields owns the number-field finite adeles. AdelicAlgebraicGroups owns additive local Haar normalization. No second profinite-integer or adele object is introduced here. The Bost–Connes scaling measure is a particular normalized measure on these carriers.

The commutative representation of a positive functional by a finite inner-regular measure is `LinearMap.exists_isFiniteMeasure_integral_characterSpace_eq`, in `TauCeti.Analysis.CStarAlgebra.CharacterSpaceMeasure`. It assumes a unital commutative complex C⋆-algebra and positivity on `star a * a`; normalization of the functional gives total mass one. The work here adds uniqueness, the Bost–Connes restriction and expectation argument, and the corresponding weak topology. The positive-definite-kernel translation construction already exists as `TauCeti.IsPositiveDefiniteSub.gnsSpace`, `gnsVector` and `gnsRepresentation` in `TauCeti.Analysis.PositiveDefinite.Function.GNS`; use it for the additive-group specialization. The algebraic positive-functional construction below adds bounded left multiplication for the Bost–Connes generators and its universal C⋆-norm. The general matrix and Hilbert-space spectral theories of OperatorTheory are prerequisites. Universal semigroup C⋆-completion, dilation corners, conditional expectations, analytic KMS completion and ratio-set factor classification required below are explicit constructions here; they are not assumed to be exports of an unspecified OperatorTheory extension.

DifferentialGeometry Layer 5 supplies oriented integration of top forms, `integralTopForm_mextDeriv` for compactly supported C¹ forms on a smooth half-space manifold, and the abstract boundary version for corners. Layer 12 supplies the Laplace–Beltrami normalization and Green identities. The Nielsen-core work below must transport these statements across the finite orbifold charts, preserve boundary multiplicities, and justify the noncompact cusp limit; it does not construct general manifold Stokes again.

ArithmeticStatistics, in the same dependency bundle, owns cubic arithmetic orbit parametrizations and counting estimates, quadratic large-sieve and fourth-moment inputs. The binary-cubic integrals and analytic functional equation here consume those arithmetic data. GeometryOfNumbersAndQuadraticArithmetic owns quadratic classes and their CM/geodesic geometry; the precise normalized period comparisons belong here. The additional Nielsen-core and boundary construction needed for the negative-factor genus period is stated below, from hyperbolic geometry and its class dictionary, rather than assumed from an unnamed Fuchsian-orbifold extension.

## Conventions

All number fields have characteristic zero. A finite Galois representation is finite-dimensional over ℂ and uses **arithmetic** Frobenius. At a ramified prime its local polynomial acts on inertia invariants. Positive real powers mean `exp(s log x)` with the real logarithm and require `x>0`. A complex parameter power uses a specified logarithm branch or a specified covering-space lift. Pole values of totalized Lean functions never stand for meromorphic germs.

The functions ψ and θ use inclusive prime-power and prime cutoffs, respectively. A residue-class sum is defined for every residue, including a nonunit; asymptotics assume a unit class and positive modulus. Explicit formulas use ψ₀ with half weight at an endpoint prime power. The distance term excludes the endpoint prime power itself. Zeros carry analytic multiplicities. Every strict or inclusive height cutoff is stated at its use; changing it requires a local multiplicity bound. A low-zero estimate uses a bounded kernel such as `min(1,1/|ρ|)` and never divides by `Im ρ`.

A character modulus, its primitive conductor and an Artin conductor are distinct. A primitive quadratic character is obtained from a fundamental discriminant, including its 2-adic possibilities; the trivial discriminant 1 is allowed only where expressly stated. Standard Dirichlet and Hecke functional equations retain the conductor, the base discriminant, archimedean parities and the root number. Removing finitely many Euler factors multiplies an ordinary simple-pole residue by their values at 1; it preserves the coefficient of the logarithmic-derivative pole, not the original residue.

Write Γℝ(s)=π^(−s/2)Γ(s/2), and use the Γℂ convention of the consumed Tate integral. Haar measures and trace characters are fixed before comparing completed functions. For an imaginary quadratic discriminant D, `ω_D=|O_Kˣ|/2`; thus ω₋₄=2 and ω₋₃=3. A real quadratic geodesic is divided by the full norm-one unit group; if ε_D>1 is its least positive norm-one generator, its length is `2 log ε_D`. Ordinary and narrow classes are not interchanged without the norm-minus-one unit dichotomy.

For the quadratic genus-period formulas, write Λ_DIT(s,χ_d)=|d|^(s/2)π^(−s/2)Γ((s+α_d)/2)L(s,χ_d), with α_d=(1−sign d)/2, as a meromorphic completion (Duke–İmamoğlu–Tóth (5.13), p.964). Thus Λ_DIT=π^(α_d/2)|d|^(s/2)·DirichletCharacter.completedLFunction(χ_d,s). This differs for odd characters from the completion Λ_std=(|d|/π)^((s+α_d)/2)Γ((s+α_d)/2)L used for the imaginary quadratic endpoint values: Λ_std=(|d|/π)^(α_d/2)Λ_DIT. In particular the two completions agree for d>0; for d=−4, Λ_DIT(0)=Λ_DIT(1)=√π/2 whereas Λ_std(0)=Λ_std(1)=1; for d=−3, the corresponding values are √π/3 and 1/√3. These comparisons use canonical continued values at the endpoints.

An entire upper-order condition means that for every `b>ρ` there is `C_b>0` with `|f(z)|≤C_b exp(|z|^b)`. Hadamard factorization requires a nonzero function. Strict positivity of every derivative additionally requires nonpolynomiality and the stated parity and real-sign conditions. Barnes G is fixed by its canonical product, not by recurrence and `G(1)=1` alone. Its Gamma recurrence is pointwise only away from Gamma poles; at zero, Mathlib's totalized Gamma gives `Γ(0)G(0)=0`, whereas `G(1)=1`.

A Beurling prime system is an indexed locally finite nondecreasing sequence, with multiplicities; generalized integers are indexed finite prime multisets and can have coincident real values. Bost–Connes coefficient fields are ℚ-algebras when rational averaging is used, and positivity, C⋆-norms, states and KMS conditions use ℂ. A state-space homeomorphism uses weak evaluation topology. For a nonsingular action the ratio-set derivative is the pushforward Radon–Nikodym derivative at the target point, witnessed on `A ∩ gA`.

A compact surface below is connected, oriented, torsion-free, without boundary, and hyperbolic of curvature −1. Its scalar Laplacian is nonnegative, with one zero mode. Its area is `4π(g−1)` for genus `g≥2`; positive eigenvalues carry multiplicity. Every determinant convention distinguishes the unprimed shifted determinant from the determinant with the zero mode removed.


## Exact supplier contracts


### From ArithmeticDirichletSeries

Consume [ArithmeticDirichletSeries layer 6 abel and perron summation](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation). Truncated arithmetic Perron for the actual von Mangoldt LSeries, with uniform error, off-endpoint and half-weight endpoint forms; finite-height kernel value at1 is arctan(T/c)/π, not1/2. For Siegel–Walfisz, also use the Layer6 quantitative Abel identity converting coprime-progression θ estimates to π with the Li main term and an explicit lower-endpoint term, retaining uniform constants for q≤(log x)^B; a fixed-modulus asymptotic alone is insufficient.

Consume [ArithmeticDirichletSeries layer 3 local factors and euler products](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products). Ideal Euler-product/series identity under absolute convergence on Re(s)>1, including finite bad-prime omission and norm regrouping. General higher-dimensional Artin factors must not be put into the degree-one completely multiplicative ideal-weight carrier.

Consume [ArithmeticDirichletSeries layer 8 landau type positivity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity). Generic meromorphic nonvanishing from nonnegative logarithmic coefficients, with meromorphic order at the distinguished pole ≤0 and the 3-4-1 inequality.

Consume [ArithmeticDirichletSeries layer 1 norm fibres and mathlib lseries](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries). Finite norm fibres and norm regrouping for the restriction to an ordinary/narrow ideal class; zero coefficient set to 0. This layer alone is not the source of the Re s>1 absolute-convergence estimate.

Consume [ArithmeticDirichletSeries layer 8 landau type positivity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity). The nonnegative 3-4-1 coefficient inequality for absolutely convergent logarithmic-derivative series.

Consume [ArithmeticDirichletSeries layer 8 landau type positivity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity). For nonnegative norm-regrouped coefficients, the finite abscissa of convergence is a singular point. Supply the endpoint positivity/convergence corollary for a function holomorphic across that real abscissa.

Consume [ArithmeticDirichletSeries layer 9 wienerikehara](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-9-wienerikehara). For a nonnegative real sequence b with b(0)=0, require LSeriesHasSum b s (F s) on Re s>1 and a separately named G continuous on Re s≥1 with G=F−κ/(s−1) on Re s>1, κ≥0. Conclude the inclusive floor summatory sum divided by x tends to κ; no continuity of junk-valued subtraction at1 is assumed.

Consume [ArithmeticDirichletSeries layer 10 generic prime number theorem transfer](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-10-generic-prime-number-theorem-transfer). Inclusive ψ to θ to π transfer, including higher prime powers and Li(x)∼x/log x, specialized to ordinary primes or a fixed coprime class.

Consume [ArithmeticDirichletSeries layer 5 ideal and prime estimates](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-5-ideal-and-prime-estimates). Total ideal-count bounds implying absolute convergence on Re s>1 for each class restriction by domination; combine with Layer1 norm regrouping.

Consume [ArithmeticDirichletSeries layer 4 counting carriers and local finiteness](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-4-counting-carriers-and-local-finiteness). Canonical locally finite inclusive counts of nonzero prime ideals via HeightOneSpectrum, including norm cutoffs; supply the carrier/local finiteness only, not the degree-uniform analytic lower bound.

Consume [ArithmeticDirichletSeries layer 6 abel and perron summation](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation). Specialize the existing absolute-convergence/Perron and Abel infrastructure to the quadratic Hecke logarithmic-derivative coefficients and the smoothing1−N𝔞/Y. The kernel isY^s/(s(s+1)); zero-height contour shifts and quantitative residues are Layer 1/4 proof gaps, not an asserted generic supplier output.

Consume [ArithmeticDirichletSeries layer 5 ideal and prime estimates](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-5-ideal-and-prime-estimates). Canonical inclusive prime counts, ideal von Mangoldt coefficients, higher-prime-power and finite ramification-discard estimates for quadratic splitting. Match the exact degree/discriminant-dependent errors needed in LOW Lemma4.3; qualitative PNT asymptotics alone do not supply these errors.


### From GlobalNumberFields

Consume [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters). Canonical HeckeCharacter and unitaryPart, local components, finite conductor, finite-order/ray-class dictionary, and ideal-character coefficients with the exact arithmetic normalization used by Tate §4.5.

Consume [GlobalNumberFields layer 10 archimedean characters infinity types and cyclotomic arithmetic](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic). Match finite-order real local sign characters to the odd gamma branch for the canonical character of a CM quadratic extension; global Artin at a real place sends a negative element to conjugation.

Consume [GlobalNumberFields layer 2 moduli and ray class carriers](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers). Use ordinary/narrow ideal-class carriers and the finite partition of nonzero integral ideals into classes for the general partial ideal series. Do not create a second ideal-class group.

Consume [GlobalNumberFields layer 10 archimedean characters infinity types and cyclotomic arithmetic](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic). For every nonzero squarefree integer d≠1, export the primitive quadratic field character χ_d modulo |D(d)| with D(d)=d if d≡1 mod4 and4d otherwise. For positive n, χ_d(n)=(D(d)/n), including the Kronecker factor at2; χ_d(0)=0. Prove primitivity, parity and conductor=|D(d)|.

Consume [GlobalNumberFields layer 10 archimedean characters infinity types and cyclotomic arithmetic](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic). Import the finite cyclotomic Galois identifications and their compatible transition maps from GlobalNumberFields layer 10. Construct the inverse-limit identification Gal(Qcycl/Q)=Ẑ× by compatible finite restrictions. That layer explicitly supplies arithmetic Frobenius and no global Artin map; do not assume a class-field existence or reciprocity theorem from it.

Consume [GlobalNumberFields layer 4 finite adeles](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles). Import the current finite-adèle arithmetic contract, with the actual restricted-product carrier and the integral compact-open subgroup; normalized additive Haar is supplied by AdelicAlgebraicGroups AA.0.


### From AutomorphicLFunctionsAndLocalFactors

Consume AutomorphicLFunctionsAndLocalFactors AL.0. Fourier and Haar conventions for local/adelic functions, Poisson summation and parameter integrals. Supply an extension from Schwartz–Bruhat functions to Tate's full Z1–Z3 admissible class: uniform lattice sums over all translates and compact idele sets, both f and Fourier f, and idele weighted integrability for every σ>1.

Consume AutomorphicLFunctionsAndLocalFactors AL.1. Local and global Tate zeta integrals on the imported admissible class, Euler factorization with different and measure factors, meromorphic continuation, local gamma factors and global functional equation retaining the trivial-character residues. This does not by itself assert nonvanishing on Re(s)=1. Consume its global zeta integral, completed Hecke function, Tate functional equation, idele-class volume and global epsilon factor.

Consume AutomorphicLFunctionsAndLocalFactors AL.3. For the actual Π_alg representation carrier and its canonical completed Rankin–Selberg Λ(s,π×π′), the predicate GRH means every nontrivial zero has real part 1/2. Do not assert this predicate as a theorem.

Consume AutomorphicLFunctionsAndLocalFactors AL.0. Local/adelic Schwartz–Bruhat carriers and additive Poisson in F^4, obtained from the existing one-dimensional Tate Fourier transform by finite product/Fubini with the binary-cubic alternating pairing. Singular-orbit distributions and their residues belong to Layer 5 and are explicitly planned there; they are not asserted to follow from Tate Poisson alone. Supply the Schwartz lattice bound in Wright Lemma 1.1, pp.510–511: for fixed finite-adelic Φ0, dimension m and α>1 there is a continuous Schwartz seminorm N such that the sum over rational x with x1≠0 after positive coordinate dilations λi is bounded by N(Φinfty) product_i max(1,λi^(−1)) max(1,λ1)^(−α/[F:Q]); Lemma 1.2 drops the last decay factor for the unrestricted sum.


### From NumberFieldArithmetic

Consume [NumberFieldArithmetic layer 2 frobenius elements and the artin symbol](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol). Arithmetic Frobenius at a chosen nonzero prime, conjugacy independence across primes above an unramified base prime and uniqueness modulo inertia at ramified primes; for K/ℚ the residue action is x↦x^p on O_K/P.

Consume [NumberFieldArithmetic layer 2 frobenius elements and the artin symbol](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol). Decomposition/inertia groups at all nonzero primes, arithmetic Frobenius on residue extensions and conjugacy/tower compatibility on the inertia-invariant representation. Unramified Frobenius alone does not supply the ramified polynomial.

Consume [NumberFieldArithmetic layer 1 the splitting dictionary](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary). Use the existing1.4 doubleCosetEquiv between H\G/D and primes of F=L^H above p, with e,f and norm powers; adapt to the inertia-orbit blocks in the ramified local determinant identity.

Consume [NumberFieldArithmetic layer 7 subfields integral bases monogenicity and explicit units](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-7-subfields-integral-bases-monogenicity-and-explicit-units). For a degree-2g CM field E and its actual normal closure L/Q, identify Gal(L/Q) with its faithful permutation action on the 2g embeddings and deduce [L:Q]≤(2g)!. The stronger quantitative discriminant comparison D_L≤D_E^A_g is a required refinement, with A_g depending only on g; it is not asserted to be an existing Layer7 export. Combine it with the separately assigned general Artin-conductor comparison, not a ray-modulus bound.


### From ClassFieldTheory

Consume [ClassFieldTheory layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity). Global reciprocity identification of one-dimensional finite Galois characters with ray-class characters, compatible with the existing ideal Artin map and arithmetic-Frobenius normalization; no second reciprocity carrier.

Consume [ClassFieldTheory layer 13 norm theorems and class fields](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields). Specialize the abelian conductor–discriminant formula to a quadratic extension: f_η is its relative discriminant and D_F N(f_η)=D_E/D_F. Use the canonical character from global reciprocity, not an imprimitive modulus.

Consume [ClassFieldTheory layer 7 the absolute local artin map its normalizations and conductors](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors). Use characterConductorExp and the unramified criterion: local conductor exponent0 iff the Galois character is trivial on inertia, compatible with CFT11 globalArtinMap_local and arithmetic Frobenius. This fixes both full local factors in the linear Artin/Hecke comparison.

Consume [ClassFieldTheory layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity). Global Artin reciprocity identifying the characters of Gal(L/E) for abelian L/E with Hecke characters of E of finite order, with conductors; used to write ζ_L as a product of Hecke L-functions.


### From RepresentationTheory

Consume [RepresentationTheory/InductionRestriction layer 6 the virtual character ring artin and brauer induction](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction) for rational Artin induction. For integral Brauer induction use the current library's `TauCeti.ClassFunction.character_mem_indCharacterSpanInt_isElementary` in `TauCeti.RepresentationTheory.Induction.Brauer.Induction`: over an algebraically closed characteristic-zero field, a finite-group character is an integer combination of characters induced from irreducibles of elementary subgroups. Such subgroups are nilpotent by `TauCeti.IsElementary.isNilpotent` (`TauCeti.GroupTheory.Elementary`). Their irreducibles are induced from linear characters by `FDRep.exists_character_eq_indClassFun_of_isNilpotent` (`TauCeti.RepresentationTheory.Induction.Monomial`). Combine these existing results with `TauCeti.indClassFun_indClassFun_subgroupOf` (`TauCeti.RepresentationTheory.Induction.ClassFunction`) to obtain χ_ρ=Σ n_j Ind_{H_j}^G χ_j with n_j∈ℤ and χ_j one-dimensional. The proof of `TauCeti.virtualCharacters_eq_map_of_isPrimitiveRoot` in `TauCeti.RepresentationTheory.Induction.Cyclotomic.SplittingField` already performs this reduction. These declarations belong to the current library rather than the historical pin. No new monomiality theorem is required here; rational induction alone still gives only a meromorphic power.

For the Colmez finite-family estimates, the remaining uniformity step is finite: transport each group of order m≤(2g)! to a group law on `Fin m`. There are finitely many such laws and finitely many irreducible characters for each. Choose one integral induced-linear expression for each irreducible and take the maximum of its number of terms and sum of absolute coefficients, enlarged to at least one. This defines a bound B_g independent of the CM field. Transporting the chosen character identities along group isomorphisms preserves those bounds. The discriminant and analytic-conductor estimates are separate Layer 2 inputs.

Consume [RepresentationTheory/InductionRestriction layer 3 the mackey decomposition formula](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula). Use the existing representation-level Mackey3a isomorphism for restriction to D of Ind_H^Gσ, with exact conjugated intersection maps. Add the inertia-fixed cyclic-orbit determinant adapter in AN; do not claim character induction alone gives a ramified local determinant.


### From AutomorphicSpectralTheory

Consume AutomorphicSpectralTheory AS.2. The normalized level-one Eisenstein theory supplies the exact level-one half-sum, completion, Fourier expansion, meromorphic continuation and functional equation. Supply only the differentiated cusp bounds and critical-line boundary limit used in DIT (7.10), matching the oriented geodesic/core conventions. This refinement is required for Stokes; no second Eisenstein continuation is planned.

Consume AutomorphicSpectralTheory AS.4. Supply the scalar positive self-adjoint Laplacian, complete discrete eigenbasis, finite multiplicities, simple zero mode, Weyl counting and uniform heat-kernel asymptotics on the selected compact surface. AS.4 supplies discrete automorphic Hilbert sums; the scalar geometric Laplacian, simple zero mode, Weyl law and uniform heat asymptotics are extension requests.

Consume AutomorphicSpectralTheory AS.6. Supply the compact scalar heat trace formula, the Gaussian test-function extension and geodesic growth, with exactly the primitive-class convention and the identity/hyperbolic constants displayed here. AS.6 is stated for compactly supported smooth tests; Gaussian tests and their orbital-integral constants require an explicit limiting/decay adapter.

Consume AutomorphicSpectralTheory AS.2. Extend the GL2 spherical rank-one specialization: constant term t^(z/2)+t^((2−z)/2)Z_F(z−1)/Z_F(z), simple residue rho0 at z=2, and nonconstant Fourier bound C_l t^(2−Rez−2l)(1+|z|)^l/(Rez−1) for l≥2 on a Siegel set. Wright Lemmas 6.1, 6.3, pp.524–526. General Eisenstein continuation is imported by its existing theorem; it does not alone give these normalized quantitative bounds.


### From GeometryOfNumbersAndQuadraticArithmetic

Consume GeometryOfNumbersAndQuadraticArithmetic GN.3. Quadratic arithmetic quotient dictionary for ordinary/narrow classes, CM lattice points z_A, oriented real geodesics C_A modulo the full norm-one unit action, J and ε_D. Match stabilizer weights and arc length 2 log ε_D. This refinement is requested, not a statement already exported by the generic stage. The Nielsen-core surfaces and their boundary projections are constructed in Layer 2.


### From UniversalCovers

Consume [UniversalCovers stage 0 port the foundations into tauceti](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/UniversalCovers#stage-0-port-the-foundations-into-tauceti). Canonical based universal cover, covering projection, path/homotopy lifting and deck action for the path-connected locally path-connected semilocally simply connected punctured complex-product domains M# and N#. Preserve the loop-then-path concatenation convention. Layer 4 owns the analytic chart pullback and Lerch continuation, not a second universal-cover construction.

Consume [UniversalCovers stage 2 lifting criterion and galois correspondence](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence). Canonical regular quotient cover associated to the normal subgroup π₁(N#)″, with deck group π₁(N#)/π₁(N#)″ and based descent. The separate analytic invariance theorem is proved in Layer 4.


### From tauceti

Consume `Completed/ContourIntegration#layer-4-the-hungerbühlerwasem-generalized-residue-theorem-hw-theorem-33`. Consume the completed contour theory and its current-library corollaries: TauCeti.Contour.Cycle.classicalResidueTheorem_nullHomologous for off-pole cycles and TauCeti.Contour.argumentPrinciple_nullHomologous for the logarithmic derivative. These are proved in Analysis/Contour/Cycle/Residue and Analysis/Contour/Argument/Cycle. Match a finite zero-avoiding rectangle to the native piecewise-C1 closed curve/cycle, open neighborhood, finite singularity set, null-homology, order and winding conventions. This is an adapter request; do not plan the general residue theorem, argument principle or homological Cauchy theorem again. The zeta phase estimates and symmetric infinite-contour limits are constructed here.


### From ArithmeticStatistics

Consume ArithmeticStatistics ST.2. In the analytic-number-theory/arithmetic-statistics bundle, supply the quadratic large sieve for primitive real characters and the fourth-moment contract specified by the quadratic fourth-moment comparison below (Heath-Brown Theorem 2, p.238; proof pp.267–269).

Consume ArithmeticStatistics ST.0. Provide bounded-discriminant finiteness and inverse-automorphism-weighted coefficient sums for all locally free cubic O_F-algebras, retaining reducible and nonmaximal rings.

Consume ArithmeticStatistics ST.1. Provide the binary-cubic twisted action, discriminant, local nondegenerate orbit types, trace-divisible dual lattice and adelic parametrization including nonprincipal locally free O_F-modules. The Delone–Faddeev results are used only in their proved base-ring scope.

Consume ArithmeticStatistics ST.3. Supply LOWW Lemma3.5 cubic-extension count over F, including h2(F) and uniform discriminant powers, for the Layer 5 reducible/field coefficient estimate.


### From AdelicAlgebraicGroups

Consume AdelicAlgebraicGroups AA.2. Supply GL2 quotient Haar measures, local GL2 factors and inversion transport between quotient sides. Finite-adèle carriers come from GlobalNumberFields Layer 4 and integral/restricted-product topology from RestrictedProducts. Additive Haar normalization belongs to AA.0; RestrictedProducts does not supply measures. Also supply the GL2 rank-one compact-times-Siegel-set integration majorant of Wright Lemmas 3.1–3.2, p.515: quotient |F| integral ≤γ integral_Theta+ F0(theta)t(theta)^(−2)dtheta when |F(c theta)|≤F0(theta) for the fixed compact C, and its determinant-one specialization.

Consume AdelicAlgebraicGroups AA.0. Provide normalized additive Haar on Qp with mass(Zp)=1 and restricted-product compatibility for finite adeles. Layer 6 itself multiplies by ((1−p^(−β))/(1−p^(−1)))|x|p^(β−1), uses probability product measures on integral adeles, and extends by rational dilation. No generic restricted product is replanned.


### From ArithmeticLocallySymmetricSpaces

Consume ArithmeticLocallySymmetricSpaces ALS.0. Supply the connected compact oriented hyperbolic surface Γ\H for a torsion-free cocompact Γ, curvature−1 and area4π(g−1), and the primitive conjugacy-class/length convention used in the scalar Selberg product.


### From Chebotarev

Consume [Chebotarev layer 13 ϑ_c and π_c](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev#layer-13-ϑ_c-and-π_c). Consumed as written (Tau Ceti roadmap, done at current main): for L = ℚ(ζ_q), K = ℚ and the class of a unit a mod q, ϑ_C(x)/x → 1/φ(q) and π_C(x) ~ (1/φ(q)) x/log x, through frobeniusTheta and frobeniusPrimeCount, with the arithmetic-progression identification of the Frobenius prime set.

Consume [Chebotarev layer 14 natural density and consistency theorems](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev#layer-14-natural-density-and-consistency-theorems). Consumed as written: the all-prime denominator ψ_K(x) ~ x (prime ideal theorem) and the consistency theorems, at K = ℚ.

Consume [Chebotarev layer 11 the frobenius von mangoldt coefficient and its summatory functions](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev#layer-11-the-frobenius-von-mangoldt-coefficient-and-its-summatory-functions). Consumed as written: frobeniusVonMangoldtCoeff, frobeniusPsi and frobeniusTheta for L/F and C, with the o(x) discard estimates of 11.3, as the carriers on which the effective error terms are stated.

Consume [Chebotarev layer 8 the cyclic fixed field fibre](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev#layer-8-the-cyclic-fixed-field-fibre). Consumed as written: the cyclic fixed-field fibre count used in the Deuring reduction from L/F and C to L/L^⟨g⟩ and g.


## How to read the build

The seven layers group the mathematics by its objects. Within each layer the targets are arranged in prerequisite order. Named links specify the proof order across topics: local factorization and zero counts precede quantitative prime estimates; Gamma estimates precede period and multiple-series bounds; Barnes G precedes its moment and determinant applications. Every internal prerequisite lies in the same or an earlier layer. In particular the rational prime error follows the explicit formula, the period bounds follow Stirling, the Möbius truncation cancellation follows its multiplicative estimates, and the moment constants follow Barnes G. Quantitative constants are uniform exactly in the parameters stated. A source that states an estimate while citing another proof identifies the theorem to establish; the mathematical ingredients below remain required proof obligations.

<a id="layer-0-entire-functions-and-quantitative-prime-estimates"></a>

## Layer 0: Entire functions and quantitative prime estimates

Start with genuine entire-function factorization and the pole-cancelled ξ-function. The arithmetic results then specify the zero-free regions, exceptional-zero alternatives and numerical ranges needed for effective prime estimates. Constants described as effective must include the finite threshold certification; an ineffective Siegel constant is never silently used as an effective one.

<a id="exceptional-real-zero-exceptional-real-zero"></a>

### 0.1 Exceptional real zero

For c>0 define the c-exceptional predicate for a nontrivial primitive quadratic character χ of conductor N>1 by L(β,χ)=0 and 1−c/log N<β<1, with β real. The exceptional zero used in Proposition 7.1 is this predicate specialized to its effective absolute c_star>0; its conductor is called exceptional. The general parameter does not assert the existence of any zero. The representative predicate is `IsExceptionalRealZero`; `IsExceptionalRealZero.mono` increases the positive width parameter.

The proof proceeds as follows. Use the actual continued primitive quadratic Dirichlet L-function; this predicate does not assert existence of a zero.

The required interface consists of the following operations and identities.

- `ExceptionalRealZero.iff`: For c>0 and N>1, the predicate holds exactly when χ is primitive, nonprincipal and quadratic, L(β,χ)=0, and 1−c/log N<β<1. Equivalently, for arbitrary c,N it is the conjunction of all these conditions, including c>0 and N>1.
- `ExceptionalRealZero.bounds`: An exceptional β lies strictly below 1 and strictly above the specified logarithmic cutoff.
- `ExceptionalRealZero.mono`: For 0<c≤c′ the c-exceptional predicate implies the c′-exceptional predicate, with N>1.

**Checks.**

- β=1 is excluded even if a chosen totalized function vanishes there.
- β=1−c/log N is excluded by the strict inequality.
- The principal character and N=1 are outside the domain; log 1 is never used as a denominator.
- Given c>0, N>1, a primitive nonprincipal quadratic χ, a real β with L(β,χ)=0 and 1−c/log N<β<1, the c-exceptional predicate holds. This is conditional and makes no existence assertion.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Section 7, Proposition 7.1 and following paragraph, pp. 373-374.

*Needs:* `DirichletCharacter.LFunction`.

<a id="chebyshev-sum-in-a-residue-class-theta-ap"></a>

### 0.2 Chebyshev sum in a residue class

For q≥1 and a∈ZMod q, θ(x;a,q)=Σ_{p prime, p≤x, p≡a mod q} log p. Inclusive real cutoff, empty for x<2. This specializes the Chebyshev sum; a coprimality hypothesis is required by asymptotic theorems, not by the finite sum. The representative sums are `thetaAP`, `psiAP` and `primeCountAP`; `thetaAP_one` identifies level one and `sum_thetaAP` sums over the full residue system.

The proof proceeds as follows. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

The required interface consists of the following operations and identities.

- `theta_ap.sum`: Evaluation is the finite filtered prime sum just displayed.
- `theta_ap.level_one`: θ(x;0,1)=Chebyshev.theta x.
- `theta_ap.sum_classes`: For q≥1, summing over all residue classes modulo q gives Chebyshev.theta x. The finite sum is not specified at q=0, where ZMod 0 is infinite.

**Checks.**

- θ(1;a,q)=0.
- θ(5;3,8)=log 3 and θ(5;5,8)=log 5.
- θ(x;0,2)=log 2 for x≥2; the noncoprime class cannot satisfy x/φ(2) asymptotics.

The result must also satisfy these compatibility requirements: θ(1;a,q)=0. θ(5;3,8)=log 3 and θ(5;5,8)=log 5. θ(x;0,2)=log 2 for x≥2; the noncoprime class cannot satisfy x/φ(2) asymptotics.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §§6–9, especially p. 369.

*Needs:* `Chebyshev.theta`.

<a id="schoenfeld-explicit-chebyshev-bound-schoenfeld-theta-upper"></a>

### 0.3 Schoenfeld explicit Chebyshev bound

For x>0, theta(x)=sum_{p prime,p<=x}log p < 1.000081*x. The representative signature is `theta_lt`.

The proof proceeds as follows. Use the stated unconditional published theta upper bound, not an RH conditional table. Supply a certified finite-range check below its analytic threshold.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Equation (10), p. 362; Schoenfeld 1976, concluding note p. 360.

*Needs:* `Chebyshev.theta`.

<a id="prime-powers-do-not-erase-the-character-sum-margin-prime-power-interval-margin"></a>

### 0.4 Prime powers do not erase the character-sum margin

Put ε=0.002811. For real k≥2*10^10, the prime-power mass M=psi(k)−theta(k)−psi(k/2)+theta(k/2) is smaller than (((1−3*ε)/8)−0.1239)*k. For b:ℕ→ℂ with |b(n)|≤1 whenever k/2<n≤k, put P=Σ_{k/2<p≤k, p prime}b(p)log p and V=Σ_{k/2<n≤k}b(n)Λ(n). Then |V−P|≤M, so |P|≥(1−3*ε)*k/8 implies |V|>0.1239*k.

Assume k is real and k≥2*10^10; ε=0.002811.; b:ℕ→ℂ and |b(n)|≤1 on the summation interval k/2<n≤k; the two sums use the same b and endpoints.

The proof proceeds as follows. Bound the powers p^j with j≥2 by a sum of theta(k^(1/j)), and subtract endpoints before estimating. Insert the certified constants from the source; retain the strict inequality. On prime terms Λ(p)=log p, and on higher prime powers use |b(p^j)|≤1. The triangle inequality gives |V−P|≤M and |V|≥|P|−M.

The result must also satisfy these compatibility requirements: Check the certified strict mass bound at the minimum k and all larger k; its original numerical proof remains an open source obligation. The weighted implication requires the same coefficient sequence in both sums and the bound |b(n)|≤1 at higher prime powers, not only at primes.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §6 end of Case I, pp. 369–370; Schoenfeld Theorem 6*, (5.3*)–(5.4*).

*Needs:* `Chebyshev.psi`; `Chebyshev.theta`.

<a id="rosser-schoenfeld-explicit-prime-count-bounds-rosser-schoenfeld-pi"></a>

### 0.5 Rosser–Schoenfeld explicit prime-count bounds

For x>=59, (x/log x)*(1+1/(2 log x))<pi(x)<(x/log x)*(1+3/(2 log x)). The representative real-cutoff signature is `rosser_schoenfeld_primeCounting`.

The proof proceeds as follows. Use the original two inequalities on the exact real range x≥59. Certify the finite threshold region with rational enclosures for logarithms.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §9 proof, p. 382; Rosser–Schoenfeld Theorem 1.

*Needs:* `Nat.primeCounting`.

<a id="bounded-height-landau-page-theorem-landau-page-bounded-height"></a>

### 0.6 Bounded-height Landau–Page theorem

There is an effective absolute c>0 such that among primitive Dirichlet characters of moduli q<=T, T>=2, there is at most one zero rho=beta+i*t with |t|<=T and beta>1-c/log T. Any exception is a simple real zero of a real character.

The proof proceeds as follows. Apply the family zero-repulsion bound including complex zeros and multiplicities. Conjugation forces a unique exception to be real and attached to a real primitive character.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §12 opening, p. 386; Bombieri §5 p.39; Iwaniec–Kowalski Theorem 5.26.

*Needs:* `DirichletCharacter.LFunction`; `DirichletCharacter.conductor`.

<a id="quadratic-real-zero-separation-from-one-quadratic-effective-zero-gap"></a>

### 0.7 Quadratic real-zero separation from one

For q>=3 and a quadratic Dirichlet character modulo q, a real zero beta>0 satisfies beta<=1-40/(sqrt(q)*(log q)^2).

The proof proceeds as follows. For primitive q≥400000, Bennett–Martin–O'Bryant–Rechnitzer Lemma6.3 gives L(1,χ)≥12/√q. Lemmas6.4–6.5 give |L′(σ,χ)|<0.27356(log q)² on 1−1/(4√q)≤σ≤1. If β lies in this interval, the real mean-value theorem gives 1−β≥12/(0.27356√q(log q)²), which is stronger than the claimed constant40. If β is to its left, use (log q)²>160. The derivative estimate follows from partial summation with the explicit Pólya–Vinogradov bound and the cutoff y=q^0.655. The L-value estimate uses the quadratic class-number formula, a class-number lower bound for negative discriminants and a regulator lower bound plus finite verification for positive discriminants. The q<400000 case uses the finite zero verification cited in §6.1; a formally checked certificate for this finite range and the class-number/regulator computations remains required. For an imprimitive character of conductor q*, the extra Euler factors have no positive real zeros, and √q(log q)² increases for q≥3.

See [Michael A. Bennett, Greg Martin, Kevin O'Bryant and Andrew Rechnitzer — Explicit bounds for primes in arithmetic progressions](https://personal.math.ubc.ca/~gerg/papers/downloads/EBPAP.pdf), Proposition1.11, printed p.436; §6.1, Lemmas6.3–6.5 and proof of Proposition1.11, printed pp.491–494. Bennett–Siksek §12 p.387 uses this estimate.

*Needs:* `DirichletCharacter.LFunction`.

<a id="weighted-prime-sum-input-to-the-factorial-estimate-explicit-weighted-prime-sum"></a>

### 0.8 Weighted-prime sum input to the factorial estimate

There exists an absolute real constant E such that, for every real x≥319, log x+E−1/(2 log x)<Σ_{p≤x}(log p)/p<log x+E+1/(2 log x). The same E applies at both endpoints of every interval subtraction.

The proof proceeds as follows. Use the published two-sided estimate with a single constant E, on x≥319. The interval corollary is a separate subtraction lemma below.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §9 p.384; Rosser–Schoenfeld Theorem 6, p.70.

*Needs:* `Chebyshev.theta`.

<a id="siegel-s-theorem-black-box-siegel-quadratic-lvalue"></a>

### 0.9 Siegel's theorem (black box)

For every ε > 0 there is c(ε) > 0, not effectively computable, such that L(1,χ_D) ≥ c(ε)|D|^{−ε} for every fundamental discriminant D ≠ 1.

The proof proceeds as follows. Use the primitive fundamental-discriminant quadratic character and the original ineffective Siegel theorem. No effective positive constant is inferred from the existence theorem.

See [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §6, p.968 ('By Siegel's theorem'); proof of Proposition 1, p.968 ('Siegel's theorem (see [11])').

*Needs:* `DirichletCharacter.LFunction`; `DirichletCharacter.LFunction_ne_zero_of_one_le_re`.

<a id="prime-number-input-prime-interval-three-x"></a>

### 0.10 Prime-number input

For all sufficiently large x, the number of primes in (x,3x] lies between 4+x/log x and 3x/log x.

The proof proceeds as follows. Apply the rational PNT at x and 3x, subtract, and choose the threshold to absorb the constant 4.

See [Lior Bary-Soroker, Dimitris Koukoulopoulos and Gady Kozma — Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), §3.5, proof of Theorem2, p.25.

*Needs:* [qualitative prime asymptotics](#prerequisites-and-boundaries).

<a id="mertens-s-first-theorem-and-p-n-log-p-p-o-log-log-n-mertens-first-theorem"></a>

### 0.11 Mertens's first theorem and Σ_{p | N} log p/p = O(log log N)

For X≥2, Σ_{p<X}(log p)/p=log X+O(1), with an absolute implied constant.

The proof proceeds as follows. Sum the identity log n=Σ_{d|n}Λ(d) over 1≤n≤x and interchange the finite sums: Σlog n=Σ_{d≤x}Λ(d)floor(x/d). Chebyshev psi(x)=O(x) bounds the floor replacement error by O(x). Use the log-summatory estimate Σ_{n≤x}log n=x log x−x+O(log x); its precise Abel/integral-comparison input is retained in the Mertens first theorem gap. Divide by x to obtain Σ_{d≤x}Λ(d)/d=log x+O(1). The higher-prime-power contribution Σ_pΣ_{k≥2}log p/p^k is bounded by the convergent integer majorant Σ_{m≥2}log m/(m(m−1)). Its convergence/comparison input is also named in that gap. Remove higher prime powers and pass from p≤x to p<x; an endpoint contributes at most log x/x, uniformly bounded for x≥2.

See [Dimitris Koukoulopoulos — The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Theorem3.4(a) and proof, printed p.40.

*Needs:* `ArithmeticFunction.vonMangoldt_sum`; `Chebyshev.psi_le_const_mul_self`; `sum_mul_eq_sub_sub_integral_mul`.

<a id="effective-distance-of-a-quadratic-real-zero-from-one-effective-quadratic-zero-separation"></a>

### 0.12 Effective distance of a quadratic real zero from one

For every ε>0 there is an effectively computable c_ε>0, fixed before D and β, such that for every nonzero squarefree integer D≠1 and real zero β∈(1/2,1) of the canonical continued primitive field-character L(s,χ_D), 1−β≥c_ε |D|^(−1/2−ε). The conductor is Q_D=|Disc(Q(√D))|, with |D|≤Q_D≤4|D|; conductor/radicand conversion only changes c_ε effectively.

The proof proceeds as follows. Use the effective positive class-number/regulator lower bound for imaginary and real quadratic fields, respectively, and the analytic class-number comparison at1. This is the elementary effective exponent1/2 regime, not Siegel’s ineffective exponentε regime. Bound the real derivative between β and1 uniformly in Q_D; mean-value transfer from L(1,χ_D) gives an effective distance from1. Supply the actual derivative estimate and the fundamental-unit lower bound before treating this as proved. Use Q_D≤4|D| and absorb log factors into |D|^ε with effective constants. The original proof has not been read; KP prints the estimate without that proof.

The result must also satisfy these compatibility requirements: Only real zeros in(1/2,1) are used; trivial negative zeros are outside the interface. No ineffective Siegel constant can discharge the effective c_ε contract. At D=−1 or2 the positive conductor is4 or8, respectively; the finite small-conductor range is included effectively.

See [Peter Koymans, Carlo Pagano — On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1), §7.2 proof of Proposition7.6, p.62, immediately after(7.7).

*Needs:* `DirichletCharacter.LFunction`; `NumberField.classNumber`.

<a id="exceptional-quadratic-squareclasses-exceptional-squareclasses"></a>

### 0.13 Exceptional quadratic squareclasses

For 0<c<1/2 let S(c) consist of nonzero squarefree d≠1 such that the primitive quadratic character of Q(√d) has a real zero β∈[1−c/log(|d|+4),1]. The conductor is |d| or 4|d| as dictated by its fundamental discriminant. Enumerate any finite initial segment by nondecreasing |d|; an infinite enumeration requires infinitude, which is not asserted.

The proof proceeds as follows. Import the Q-specialization character of the quadratic field with fundamental discriminant D(d)=d for d≡1 mod4 and D(d)=4d otherwise. Its positive-integer values are the Kronecker symbol (D(d)/n); primitivity gives conductor |D(d)|. In the supplier prototype, separate the 2-primary part of n before applying the Jacobi symbol to the odd denominator. A plain Jacobi-symbol definition would mishandle even n. The admitted construction is constrained by all character values and primitivity; no arbitrary quadratic character is supplied as data. Take the canonical continued Dirichlet LFunction, not the totalized LSeries outside its convergence domain, and quantify a real zero in the closed interval [1−c/log(|d|+4),1]. Height-bounded selections are finite; no infinite enumeration or zero existence is asserted.

The required interface consists of the following operations and identities.

- `exceptional_squareclasses.membership`: Membership is the stated near-one zero condition for the primitive field character.
- `exceptional_squareclasses.mono`: If 0<c≤c′<1/2 then S(c)⊆S(c′).
- `exceptional_squareclasses.finite_height`: For each B there are finitely many d∈S(c) with |d|≤B.
- `exceptional_squareclasses.conductor`: Every estimate uses the field’s fundamental discriminant conductor, retaining the possible factor 4.

**Checks.**

- d=1 is excluded, so a principal pole cannot be called an exceptional zero.
- d=−1 has conductor 4, not conductor 1.
- d=2 has conductor 8, not 2.
- The definition permits an empty or finite S(c); it does not fabricate an infinite sequence.

The result must also satisfy these compatibility requirements: d=1 is excluded, so a principal pole cannot be called an exceptional zero. d=−1 has conductor 4, not conductor 1. d=2 has conductor 8, not 2. The definition permits an empty or finite S(c); it does not fabricate an infinite sequence.

See [Peter Koymans, Carlo Pagano — On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1), §7.2 Definition7.5 and its enumeration paragraph, p.61.

*Needs:* [GlobalNumberFields layer 10 archimedean characters infinity types and cyclotomic arithmetic](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic); `DirichletCharacter.LFunction`.

<a id="entire-order-at-most-entire-order-at-most"></a>

### 0.14 Entire order at most ρ

For a complex function f and real ρ, orderAtMost(f,ρ) means ρ≥0, f is entire, and for every b>ρ there is C_b>0 with |f(z)|≤C_b exp(|z|^b) for all z. At ρ=0 this is the same infimum-order convention, including polynomials and the zero function; the latter is excluded in factorization theorems. It is an upper-order predicate, not an exact-order or exponential-type predicate. The representative upper-order predicate is `EntireOrderAtMost`; `entireOrderAtMost_riemannXi` is its xi specialization.

The proof proceeds as follows. Use the displayed conjunction on the existing complex-function carrier. Compact continuity turns the source's large-radius bound into the global bound; conversely the global bound implies the asymptotic bound. For products at exponent b>ρ choose ρ<b′<b; absorb 2r^b′ into r^b outside a fixed ball and use compact boundedness inside it.

The required interface consists of the following operations and identities.

- `entire_order_at_most.bound`: Every exponent strictly larger than ρ has its own global multiplicative growth constant.
- `entire_order_at_most.mono`: If ρ≤ρ′ and orderAtMost(f,ρ), then orderAtMost(f,ρ′).
- `entire_order_at_most.polynomial`: Every polynomial has order at most 0.
- `entire_order_at_most.product`: Products of entire functions of order at most ρ≥0 again have order at most ρ.

**Checks.**

- exp(z) has order at most 1.
- exp(z²) does not have order at most 1.
- 1−z² has order at most 0.
- For every entire f and real C, if |f(z)|≤exp(C|z|log(2+|z|)) for every z, then orderAtMost(f,1). This upper bound alone asserts neither exact order one nor failure of finite exponential type.
- The identically zero function has order at most zero.

The result must also satisfy these compatibility requirements: exp(z) has order at most 1. exp(z²) does not have order at most 1. 1−z² has order at most 0. For every entire f and real C, if |f(z)|≤exp(C|z|log(2+|z|)) for every z, then orderAtMost(f,1). This upper bound alone asserts neither exact order one nor failure of finite exponential type.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Definition 8.1, printed p.47; extension to ρ=0 by the same growth condition.

*Needs:* `Differentiable`.

<a id="genus-one-canonical-factor-genus-one-factor"></a>

### 0.15 Genus-one canonical factor

E₁(w)=(1−w)exp(w), for every complex w.

The proof proceeds as follows. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

The required interface consists of the following operations and identities.

- `genus_one_factor.value`: The function is exactly (1−w)exp(w).
- `genus_one_factor.entire`: E₁ is entire.
- `genus_one_factor.zeros`: Its only zero is w=1 and that zero is simple.
- `genus_one_factor.pair`: E₁(w)E₁(−w)=1−w².

**Checks.**

- E₁(0)=1.
- E₁(1)=0.
- E₁′(0)=0, which excludes the uncorrected factor 1−w.

The result must also satisfy these compatibility requirements: E₁(0)=1. E₁(1)=0. E₁′(0)=0, which excludes the uncorrected factor 1−w.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7, (8.2.3), printed p.49; corrected quadratic sign in the normalization convention.

*Needs:* `Complex.exp`.

<a id="pole-cancelled-riemann-xi-riemann-xi"></a>

### 0.16 Pole-cancelled Riemann xi

ξ(s)=1/2+(1/2)s(s−1)completedRiemannZeta₀(s). This is the entire extension of (1/2)s(s−1)π^(−s/2)Γ(s/2)ζ(s) away from the completed poles, not the pointwise pole-multiplication convention at s=0,1. Use `riemannXi` for the pole-cancelled entire function, `riemannXi_eq` for the identity off 0 and 1, and `riemannXi_one_sub` for its reflection.

The proof proceeds as follows. Define xi directly as 1/2+(s*(s-1)/2)*completedRiemannZeta0 s, reusing its entire carrier. Entirety and reflection are finite algebra applied to the differentiability and reflection of completed0; at 0 and 1 the polynomial term vanishes. For s!=0,1, use completedRiemannZeta_eq and multiply the rational correction terms to obtain the comparison with the regular completed zeta; use the separate gamma nonvanishing condition before comparing to gamma times zeta.

The required interface consists of the following operations and identities.

- `riemann_xi.entire`: ξ is entire by differentiability of the pole-subtracted completion.
- `riemann_xi.reflection`: ξ(1−s)=ξ(s) for all complex s.
- `riemann_xi.comparison`: For s≠0,1, ξ(s)=(1/2)s(s−1)completedRiemannZeta(s).
- `riemann_xi.endpoints`: ξ(0)=ξ(1)=1/2.

**Checks.**

- ξ(0)=1/2, not0.
- ξ(1)=1/2, not0.
- ξ(2)=ξ(−1), checking the centre1/2.

The result must also satisfy these compatibility requirements: ξ(0)=1/2, not0. ξ(1)=1/2, not0. ξ(2)=ξ(−1), checking the centre1/2.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §5.1 (5.1.4), xi definition and reflection, printed pp.34–35; Lemma8.3 p.47.

*Needs:* `completedRiemannZeta₀`; `differentiable_completedZeta₀`; `completedRiemannZeta₀_one_sub`; `completedRiemannZeta_eq`.

<a id="weak-zeta-convexity-in-a-closed-strip-riemann-zeta-weak-convexity"></a>

### 0.17 Weak zeta convexity in a closed strip

For every ε>0 there exists C_ε>0 such that |ζ(σ+it)|≤C_ε|t|^(1−σ+ε) whenever1/2≤σ≤1 and |t|≥1/100. This is the weak convexity estimate used to bound ζ(1+z+z′) in Green–Tao (A.5).

The proof proceeds as follows. Obtain vertical-strip growth from the functional equation, gamma estimates and a strip interpolation theorem; explicitly record these analytic suppliers in the quantitative zeta gap. Enlarge the constant on bounded heights with |t|≥1/100; the exclusion of t=0 avoids the pole.

See [Ben Green and Terence Tao — The primes contain arbitrarily long arithmetic progressions](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n2-p03.pdf), AppendixA proof of LemmaA.3, (A.5), printed p.544.

*Needs:* `riemannZeta`.

<a id="elementary-canonical-factors-of-every-genus-canonical-factor"></a>

### 0.18 Elementary canonical factors of every genus

For n≥0 define E_n(w)=(1−w)exp(Σ_(j=1)^n w^j/j), with an empty sum for n=0. This is an entire function with a simple zero exactly at1. Genus1 agrees with the existing E₁.

The proof proceeds as follows. Use the finite polynomial sum and exponential. On |w|≤1/2 cancel the first n Taylor coefficients of log(1−w); the remaining series is O_n(|w|^(n+1)).

The required interface consists of the following operations and identities.

- `canonical_factor.zero_genus`: E₀(w)=1−w.
- `canonical_factor.one_genus`: E₁(w)=(1−w)e^w equals genus_one_factor.
- `canonical_factor.entire`: E_n is entire for every n.
- `canonical_factor.zeros`: E_n(w)=0 iff w=1, and its vanishing order there is1.
- `canonical_factor.log_tail`: There is C_n>0 with |log(1−w)+Σ_(j=1)^n w^j/j|≤C_n|w|^(n+1) for |w|≤1/2, using the principal analytic log.

**Checks.**

- E_n(0)=1 for every n.
- E_n(1)=0 for every n.
- E₀(w)=1−w, with no exponential factor.
- E₁(w)E₁(−w)=1−w².

See [Zhiwei Yun and Wei Zhang — Shtukas and the Taylor expansion of L-functions](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p02-p.pdf), AppendixB.1, definition preceding(B.1), printed p.901.

*Needs:* `Complex.exp`.

<a id="mod-eight-prime-mass-mod-eight-interval-mass"></a>

### 0.19 Mod-eight prime mass

With epsilon=0.002811, for a=3 or 5 and k>=2*10^10, theta(k;a,8)-theta(k/2;a,8)>=(1-3*epsilon)*k/8.

The proof proceeds as follows. Subtract the same published residue-class theta error bound at k and k/2, both within its range. Retain a=3 or 5, q=8 and k≥2·10^10.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §6, pp. 369,372, Ramaré–Rumely input.

*Needs:* [Chebyshev sum in a residue class](#chebyshev-sum-in-a-residue-class-theta-ap).

<a id="two-real-zero-inequality-two-real-zero-separation"></a>

### 0.20 Two-real-zero inequality

There is an effective absolute c_star>0 such that if distinct real primitive quadratic characters of conductors N1,N2>1 have real zeros beta1,beta2, then min(beta1,beta2)<1-3*c_star/log(N1*N2).

The proof proceeds as follows. Use the common-conductor-product zero-repulsion theorem with distinct primitive quadratic characters. Fix one effective c_star small enough for this theorem and the exceptional-zero definition simultaneously.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Proposition 7.1(i), (23), p. 373.

*Needs:* [Exceptional real zero](#exceptional-real-zero-exceptional-real-zero); `DirichletCharacter.LFunction`.

<a id="uniqueness-and-simplicity-of-an-exceptional-zero-exceptional-zero-unique"></a>

### 0.21 Uniqueness and simplicity of an exceptional zero

For that same c_star, a primitive nonprincipal quadratic character of conductor N has at most one real zero in (1-c_star/log N,1), and any such zero is simple.

The proof proceeds as follows. Apply the conductor-uniform zero-free region to the real near-one interval. Use the multiplicity version of the logarithmic-derivative inequality to force multiplicity one.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Proposition 7.1(ii), (24), pp. 373–374.

*Needs:* [Exceptional real zero](#exceptional-real-zero-exceptional-real-zero).

<a id="effective-character-prime-number-estimate-character-weighted-pnt"></a>

### 0.22 Effective character prime-number estimate

For a primitive nonprincipal character chi of conductor N>1 and X sufficiently large, sum_{m<=X}chi(m)*Lambda(m)=-X^beta/beta+O(X*exp(-c*log X/(sqrt(log X)+log N))*(log N)^4), with the beta term only when an exceptional zero exists; c>0 and the implied constant are absolute and effective.

The proof proceeds as follows. Use the character explicit formula and isolate the exceptional real zero before estimating the other zeros. Optimize the height using the conductor-uniform region; preserve log N and the effective constants.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Theorem 5, (26), p. 374; Iwaniec–Kowalski Theorem 5.27.

*Needs:* [Exceptional real zero](#exceptional-real-zero-exceptional-real-zero).

<a id="explicit-reciprocal-prime-estimate-explicit-prime-reciprocal"></a>

### 0.23 Explicit reciprocal-prime estimate

There is the prime Mertens constant B=0.26149.. such that for x>=286, |sum_{p<=x}1/p-log log x-B|<1/(2*(log x)^2).

The proof proceeds as follows. Use the original reciprocal-prime theorem and its common prime Mertens constant. Keep x≥286; the rounded decimal is a label, not the definition of B.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §9 proof, p. 382; Rosser–Schoenfeld Theorem 5.

*Needs:* [Weighted-prime sum input to the factorial estimate](#weighted-prime-sum-input-to-the-factorial-estimate-explicit-weighted-prime-sum).

<a id="weighted-prime-sum-on-an-interval-weighted-prime-interval"></a>

### 0.24 Weighted prime sum on an interval

For x≥y≥319, Σ_{y<p≤x}(log p)/p>log(x/y)−1/(2 log x)−1/(2 log y).

The proof proceeds as follows. Subtract the lower bound at x and the upper bound at y; the same E cancels. Use the log quotient identity for positive x,y.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §9 p.384; Rosser–Schoenfeld Theorem 6, p.70.

*Needs:* [Weighted-prime sum input to the factorial estimate](#weighted-prime-sum-input-to-the-factorial-estimate-explicit-weighted-prime-sum).

<a id="mertens-sum-and-product-inputs-mertens-prime-reciprocal"></a>

### 0.25 Mertens sum and product inputs

There is a real B such that Σ_{p≤x}1/p=log log x+B+O(1/log x) for real x≥2, with an absolute implied constant.

The proof proceeds as follows. Replace the strict endpoint in Mertens first theorem by the inclusive one; a possible endpoint contributes at most log x/x, hence a bounded change. Set R(t)=Σ_{p≤t}log p/p−log t, which is bounded for t≥2. Apply Abel summation with weight 1/log t and coefficient (log p)/p at primes, zero otherwise. Obtain Σ_{p≤x}1/p=log log x+B+R(x)/log x−∫_x^∞R(t)/(t(log t)^2)dt, for a single real B. The improper integral defining B converges absolutely; the remaining integral is bounded by sup|R|/log x. This yields the claimed real range x≥2.

The result must also satisfy these compatibility requirements: One B and one absolute error constant work for every real x≥2. At x=2 the prime 2 is included; changing the endpoint convention only changes the bounded remainder.

See [Dimitris Koukoulopoulos — The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Theorem3.4(b) and its proof, printed pp.40–41.

*Needs:* [Mertens's first theorem and Σ_{p | N} log p/p = O(log log N)](#mertens-s-first-theorem-and-p-n-log-p-p-o-log-log-n-mertens-first-theorem); `sum_mul_eq_sub_sub_integral_mul`.

<a id="hadamard-factorization-in-order-at-most-one-order-one-hadamard"></a>

### 0.26 Hadamard factorization in order at most one

For nonzero entire f of order at most1, f(z)=z^m exp(a+bz)∏_αE₁(z/α), with locally uniform convergence, exact zero multiplicities and finite/empty zero sets permitted.

Assume f is entire, not identically zero, and has order at most one; m is the finite analytic order at zero.

The proof proceeds as follows. Assemble the origin factor, the canonical product, its entire quotient logarithm and the affine-log theorem.

The result must also satisfy these compatibility requirements: f(z)=z²exp(z) has the empty nonzero-zero product and m=2. f(z)=1−z² has two simple nonzero zeros; the paired factors give exactly 1−z². Every zero occurrence family is locally finite, and convergence is locally uniform for the net of finite subsets, not merely pointwise.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

*Needs:* [Entire order at most ρ](#entire-order-at-most-entire-order-at-most); [Genus-one canonical factor](#genus-one-canonical-factor-genus-one-factor); `Complex.borelCaratheodory`; `Complex.exists_continuousOn_eqOn_exp_comp`; `AnalyticAt.analyticOrderAt_eq_natCast`; `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`; `AnalyticAt.analyticOrderAt_ne_top`; `TendstoLocallyUniformlyOn.differentiableOn`; `AnalyticOnNhd.sum_divisor_le`; `AnalyticOnNhd.eqOn_zero_or_eventually_ne_zero_of_preconnected`; `IsCompact.finite_sdiff_of_mem_codiscreteWithin`; `Complex.norm_log_one_add_sub_self_le`; `Complex.hasSum_taylorSeries_neg_log`; `analyticAt_clog`; `Complex.exp_eq_one_iff`; `Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le`; `is_const_of_deriv_eq_zero`; [Isolate the origin zero](#proof-origin-zero-factor); [Multiplicity count of compact zeros](#proof-compact-zero-count); [Zero count from an order bound](#proof-jensen-growth-zero-count); [Summable reciprocal squares of zeros](#proof-dyadic-zero-reciprocal-square); [Small canonical-factor logarithm](#proof-canonical-factor-log-tail); [Uniform tail bound for the canonical product](#proof-canonical-product-compact-tail); [Entire locally uniform canonical product](#proof-canonical-product-entire); [Zero divisor of the canonical product](#proof-canonical-product-zero-orders); [Analyticity of a continuous logarithm](#proof-continuous-log-analytic-upgrade); [Entire logarithm of the quotient](#proof-zero-free-entire-log); [A good radius in every long-enough interval](#proof-summable-excluded-radii); [Lower bound for P on good circles](#proof-canonical-product-lower-good-circles); [Growth of the entire quotient logarithm](#proof-hadamard-log-growth); [The quotient logarithm is affine](#proof-borel-cauchy-affine-log); [Truncated reciprocal weights of zeros](#proof-zero-reciprocal-truncation-bound); [Reciprocal-square tail of zeros](#proof-zero-reciprocal-square-tail-bound); [Lower bound for inner canonical factors](#proof-canonical-product-inner-lower-bound); [Lower bound for middle canonical factors](#proof-canonical-product-middle-lower-bound); [Lower bound for outer canonical factors](#proof-canonical-product-outer-lower-bound).

<a id="proof-origin-zero-factor"></a>

**Isolate the origin zero.** For nonzero entire f, with m=analyticOrderNatAt f 0, there is an entire g with g(0)≠0 and f(z)=z^m g(z) for all z. If f has order at most ρ≥0, so does g.

Entirety and the identity theorem exclude a locally zero germ. The finite analytic-order factorization gives a local analytic g with g(0)≠0. Define g(z)=f(z)/z^m off zero and use that local residual value at zero; equality to the analytic residual on a neighbourhood patches the quotient analytically. No unverified global removable-singularity theorem is required. For |z|≥1 division by z^m cannot increase the bound. Continuity bounds the remaining compact ball.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="proof-compact-zero-count"></a>

**Multiplicity count of compact zeros.** A nonzero entire f has finitely many zeros in each closed disk, and every zero has finite analytic multiplicity.

The nonzero entire hypothesis and the identity theorem exclude a locally zero germ at every point; hence each analytic order is finite. Apply the global isolated-zero/codiscrete theorem on C. Restrict its codiscrete nonzero set to a closed disk and apply the compact finite-complement theorem; sum the finitely many finite multiplicities.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.4 and Remark 8.6, printed p.48; Theorem 8.7 proof, printed p.49.

<a id="proof-jensen-growth-zero-count"></a>

**Zero count from an order bound.** If g is entire, g(0)≠0 and has order at most ρ, then for every b>ρ the number n_g(r) of zeros with multiplicity in |z|≤r is O_b(r^b) for r≥1.

Here ρ≥0; g entire and g(0)≠0; orderAtMost(g,ρ); r≥1; zeros are counted with analytic multiplicity.

For b>ρ, enlarge the global growth constant so M=C_b exp((2r)^b)≥1. Apply the Jensen inequality with centre 0, positive inner radius r and outer radius 2r. The exact upper bound is log(M/|g(0)|)/log 2. It is bounded by K_{g,b}r^b for r≥1. Library Jensen permits zeros on the outer circle; its stated analytic-neighbourhood hypothesis holds by entirety.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.4 and Remark 8.6, printed p.48; Theorem 8.7 proof, printed p.49.

<a id="proof-dyadic-zero-reciprocal-square"></a>

**Summable reciprocal squares of zeros.** For a nonzero entire g with g(0)≠0 and order at most one, its nonzero zero family α_i, with every index carrying one occurrence of analytic multiplicity, satisfies Σ_i|α_i|⁻²<∞. Finite and empty index sets are included.

Choose b=3/2 in the Jensen zero count. Split |α|≥1 into dyadic annuli; their contributions are bounded by C·2^(−j/2). Handle the finitely many inner zeros separately.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.4 and Remark 8.6, printed p.48; Theorem 8.7 proof, printed p.49.

<a id="proof-canonical-factor-log-tail"></a>

**Small canonical-factor logarithm.** On |w|≤1/2 set L(w)=Log(1−w)+w, using the principal logarithm. This is the analytic logarithm of E₁(w) with L(0)=0: exp L(w)=E₁(w), L(w)=−Σ_{k≥2}w^k/k, and |L(w)|≤|w|². The logarithm series and its numerical remainder estimate are imported results, not new versions of those general results.

For |w|≤1/2, 1−w lies in the slit plane. Its principal logarithm is analytic and exp(Log(1−w)+w)=(1−w)exp(w). Subtract the n=0 and n=1 terms from the HasSum logarithm expansion. Substitute z=−w in the remainder estimate and use 2(1−|w|)≥1.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="proof-canonical-product-compact-tail"></a>

**Uniform tail bound for the canonical product.** Under the stated family hypotheses, for R>0 the log-factor tails Σ_{i in S, |α_i|>2R}(Log(1−z/α_i)+z/α_i), directed by finite subsets S, converge uniformly for |z|≤R. Every omitted-tail norm is at most R² times the corresponding reciprocal-square tail.

Here An indexed family α_i of nonzero complex numbers; every bounded disk contains finitely many indices, with repeated values representing multiplicity; Σ_i|α_i|⁻²<∞.

Use the small-factor logarithm bound and dominate every tail by R²Σ_tail |α|^−2. Keep the finite inner factors outside the logarithm to allow zeros inside the disk.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="proof-canonical-product-entire"></a>

**Entire locally uniform canonical product.** Under the stated family hypotheses, finite-subset products ∏_{i∈S}E₁(z/α_i), directed by inclusion of finite subsets, converge locally uniformly on C to the unordered product P(z). P is entire and P(0)=1. Enumeration changes preserve this product; finite and empty families are included.

Here An indexed family α_i of nonzero complex numbers; every bounded disk contains finitely many indices, with repeated values representing multiplicity; Σ_i|α_i|⁻²<∞.

Exponentiate the uniformly convergent logarithmic tail and multiply by the finite inner factors. Apply the locally uniform holomorphic-limit theorem.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="proof-canonical-product-zero-orders"></a>

**Zero divisor of the canonical product.** For the preceding P, its zeros are exactly the α, with the listed multiplicities, and P is nonzero elsewhere.

Here An indexed family α_i of nonzero complex numbers; every bounded disk contains finitely many indices, with repeated values representing multiplicity; Σ_i|α_i|⁻²<∞.

At a chosen zero separate all its equal finite factors from a nonvanishing uniformly convergent tail. Use the simple zero of E₁ and the analytic-order local factorization.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="proof-continuous-log-analytic-upgrade"></a>

**Analyticity of a continuous logarithm.** If g is analytic and nonzero on open U, and a continuous L satisfies exp(L)=g on U, then L is analytic on U.

For x∈U, shrink to a neighbourhood where g(y)/g(x) lies near 1 in the slit plane. Define the analytic local lift ℓ(y)=L(x)+Log(g(y)/g(x)); then exp ℓ=g and ℓ(x)=L(x). By the exponential-kernel theorem L(y)−ℓ(y) is an integer multiple of 2πi. Continuity makes its norm <2π on a smaller neighbourhood, where it must be zero. Thus L locally equals the analytic ℓ, with no simply connected hypothesis on U.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="proof-zero-free-entire-log"></a>

**Entire logarithm of the quotient.** For nonzero entire f and its origin factor z^m P with the same zero divisor, the quotient extends to a nonvanishing entire q and q=exp(h) for an entire h.

Use the finite local zero-order factorizations for numerator and denominator. Equal multiplicities cancel, leaving an analytic nonzero quotient in each zero neighbourhood; patch this with f/(z^mP) off the zero set. The patched q is continuous and nonzero on the open simply connected set C. Apply the continuous-log existence theorem there, then continuous-log-analytic-upgrade.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="proof-summable-excluded-radii"></a>

**A good radius in every long-enough interval.** If forbidden intervals around |α| have total length at most M<∞, then every [r,r+M+1] contains a radius not in their union.

The interval has length M+1, while the union has outer length≤M. Consequently the good radii have bounded gaps, not merely a subsequence tending to infinity.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="proof-canonical-product-lower-good-circles"></a>

**Lower bound for P on good circles.** For every 0<ε<1 there is C_ε>0 such that every good radius R≥2 satisfying |R−|α_i||>|α_i|⁻² for all i obeys log|P(z)|≥−C_ε R^(1+ε) for every |z|=R. Every [r,r+M+1] with r≥2 contains such a radius, where M=2Σ_i|α_i|⁻²; thus the good radii have bounded gaps.

Here An indexed nonzero locally finite zero family α_i, counted with multiplicity, whose n_α(t) is O_b(t^b) for every b>1.; P is its genus-one unordered canonical product, including finite/empty families.

Choose b=1+ε/2, and fix its zero-count constant before R. Split factors into |α_i|<R/2, R/2≤|α_i|≤2R and |α_i|>2R. Apply the three named inner/middle/outer lower-bound lemmas. The first two factors are finite and nonzero; the outer factor is a nonzero exponential. Their product is P by finite/infinite product splitting. Use 1+log(2R)≤K_ε R^(ε/2) for R≥2 to absorb the middle range and add the bounds. Each forbidden closed interval has length 2|α_i|⁻²; summable-excluded-radii supplies a good radius in every interval of length M+1.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="proof-hadamard-log-growth"></a>

**Growth of the entire quotient logarithm.** For nonzero entire f of order at most1 and q=f/(z^mP)=exp h, for every ε>0, Re h(z)≤C_ε(1+|z|^(1+ε)) on C.

Use the f upper bound and P lower bound on good circles. Fill every bounded gap between good radii by the maximum principle for Re h.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="proof-borel-cauchy-affine-log"></a>

**The quotient logarithm is affine.** If entire h has Re h(z)≤C_ε(1+|z|^(1+ε)) for every ε>0, then h(z)=a+bz.

Fix 0<ε<1. The Borel–Carathéodory estimate on the ball of radius 2R gives |h(z)|≤K_ε(1+R^(1+ε)) for |z|≤R, including the fixed h(0) term. At an arbitrary centre c, the same global bound on radius R is at most K_{c,ε}(1+R^(1+ε)) for R≥max(1,|c|). Apply the second-derivative Cauchy estimate and let R tend to infinity. The upper bound tends to zero, so h″ vanishes everywhere and h is affine.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="proof-zero-reciprocal-truncation-bound"></a>

**Truncated reciprocal weights of zeros.** Under the family/count hypotheses there is K>0, depending on α,C,b, such that for R≥2, Σ_{|α_i|<R}|α_i|⁻¹≤K R^(b−1). The sum is finite and counts repeated zeros.

Here An indexed family α_i≠0 of complex numbers, with finitely many indices in every bounded disk; repeated indices represent multiplicity.; Fix 1<b<2 and C>0 with n_α(t)≤Ct^b for all t≥1, where n_α(t) counts indices with |α_i|≤t.

The finitely many indices |α_i|<1 contribute a fixed S, even when the minimum radius is small. On each dyadic shell 2^j≤|α_i|<2^(j+1), bound the reciprocal sum by C·2^((j+1)b−j). Summing the finite increasing geometric sequence, whose ratio is 2^(b−1)>1, gives K R^(b−1). Include S using R≥2.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, (8.2.4), printed p.49; Exercise 8.4.10, printed p.52.

<a id="proof-zero-reciprocal-square-tail-bound"></a>

**Reciprocal-square tail of zeros.** Under the family/count hypotheses there is K>0, depending only on C,b, such that for R≥1, the reciprocal-square series over |α_i|>R is summable and Σ_{|α_i|>R}|α_i|⁻²≤K R^(b−2).

Here An indexed family α_i≠0 of complex numbers, with finitely many indices in every bounded disk; repeated indices represent multiplicity.; Fix 1<b<2 and C>0 with n_α(t)≤Ct^b for all t≥1, where n_α(t) counts indices with |α_i|≤t.

Use annuli 2^jR<|α_i|≤2^(j+1)R. Their contributions are at most C·2^b R^(b−2)·2^(j(b−2)). The decreasing geometric ratio 2^(b−2)<1 gives both summability and K=C·2^b/(1−2^(b−2)); shell-boundary choices count each index once.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, (8.2.4), printed p.49; Exercise 8.4.10, printed p.52.

<a id="proof-canonical-product-inner-lower-bound"></a>

**Lower bound for inner canonical factors.** Under the family/count hypotheses there is K>0 such that for R≥2, |z|=R and every finite subset S of indices with |α_i|<R/2, Σ_{i∈S}log|E₁(z/α_i)|≥−K R^b.

Here An indexed family α_i≠0 of complex numbers, with finitely many indices in every bounded disk; repeated indices represent multiplicity.; Fix 1<b<2 and C>0 with n_α(t)≤Ct^b for all t≥1, where n_α(t) counts indices with |α_i|≤t.

The reverse triangle inequality gives |1−z/α_i|≥R/|α_i|−1>1, so its real logarithm is nonnegative. Since log|E₁(z/α_i)|=log|1−z/α_i|+Re(z/α_i), it is at least −R/|α_i|. Apply zero-reciprocal-truncation-bound to the finite inner family.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, (8.2.4), printed p.49; Exercise 8.4.10, printed p.52.

<a id="proof-canonical-product-middle-lower-bound"></a>

**Lower bound for middle canonical factors.** Under the family/count hypotheses there is K>0 such that for R≥2 satisfying |R−|α_i||>|α_i|⁻² for every index, |z|=R and every finite S with R/2≤|α_i|≤2R, Σ_{i∈S}log|E₁(z/α_i)|≥−K R^b(1+log(2R)).

Here An indexed family α_i≠0 of complex numbers, with finitely many indices in every bounded disk; repeated indices represent multiplicity.; Fix 1<b<2 and C>0 with n_α(t)≤Ct^b for all t≥1, where n_α(t) counts indices with |α_i|≤t.

For a middle index, |1−z/α_i|≥|R−|α_i||/|α_i|>|α_i|⁻³≥(2R)⁻³; in particular this factor is nonzero. Re(z/α_i)≥−2, so each logarithm is at least −3log(2R)−2. There are at most n_α(2R)≤C(2R)^b indices. Sum the lower bounds, with one constant independent of R,z,S.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, (8.2.4), printed p.49; Exercise 8.4.10, printed p.52.

<a id="proof-canonical-product-outer-lower-bound"></a>

**Lower bound for outer canonical factors.** Under the family/count hypotheses there is K>0 such that for R≥2 and |z|=R the unordered outer product P_out(z)=∏_{|α_i|>2R}E₁(z/α_i) is nonzero and log|P_out(z)|≥−K R^b.

Here An indexed family α_i≠0 of complex numbers, with finitely many indices in every bounded disk; repeated indices represent multiplicity.; Fix 1<b<2 and C>0 with n_α(t)≤Ct^b for all t≥1, where n_α(t) counts indices with |α_i|≤t.

For |α_i|>2R the normalized w=z/α_i has |w|<1/2. canonical-factor-log-tail bounds the logarithm by R²|α_i|⁻² in absolute value. The sum is absolutely convergent and has norm at most K R^b by zero-reciprocal-square-tail-bound at 2R. The outer product is the exponential of that sum by compact-tail/entire-product construction, hence nonzero; taking real parts gives the lower bound.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, (8.2.4), printed p.49; Exercise 8.4.10, printed p.52.

<a id="finite-order-hadamard-factorization-finite-order-hadamard"></a>

### 0.27 Finite-order Hadamard factorization

For nonzero entire f of finite order at most ρ≥0, set n=floor ρ. Its nonzero zeros α with multiplicity satisfy Σ|α|^(−n−1)<∞ and f(z)=z^m exp(h(z))∏E_n(z/α), where E_n(w)=(1−w)exp(Σ_{j=1}^n w^j/j), h is a polynomial of degree≤n and the product converges locally uniformly. Finite/empty zero sets are allowed.

The proof proceeds as follows. Generalize the Jensen annulus and canonical-log-tail proofs from n=1 to n=floorρ. Use a good-circle lower bound, Borel–Carathéodory and Cauchy estimates to kill derivatives of order>n.

See [Zhiwei Yun and Wei Zhang — Shtukas and the Taylor expansion of L-functions](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p02-p.pdf), Appendix B.1, (B.1)–(B.3), printed pp.901–902; cited Ahlfors §§5.2.3/5.3.2.

*Needs:* [Entire order at most ρ](#entire-order-at-most-entire-order-at-most); `AnalyticOnNhd.sum_divisor_le`; `Complex.borelCaratheodory`; [Elementary canonical factors of every genus](#elementary-canonical-factors-of-every-genus-canonical-factor).

<a id="classical-high-height-zero-free-region-classical-zero-free-region"></a>

### 0.28 Classical high-height zero-free region

There exist real c>0 and t₀>1 such that ζ(s)≠0 whenever Im(s)≥t₀ and Re(s)≥1−c/log(Im(s)). This is the high positive-height conclusion of Kedlaya's proof, not a full-height effective region or a conductor-uniform Dirichlet region. The representative positive-height signature is `classical_zero_free_region`.

Assume The constants c,t₀ are absolute existence constants, not certified numerical values.

The proof proceeds as follows. Use the nonnegative trigonometric polynomial 3+4 cos θ+cos 2θ with the absolutely convergent logarithmic derivative for Re(s)>1. The simple pole at 1 bounds the real-axis term by 1/(σ−1)+O(1). The corrected Hadamard/Gamma identity bounds the σ+2it term by O(log t). Keeping a zero β+it bounds the σ+it term by O(log t)−1/(σ−β). Combine to obtain 4/(σ−β)≤3/(σ−1)+C log t. Choose σ=1+A/log t with A sufficiently small relative to C to derive β<1−c/log t for t≥t₀. Hadamard factorization, logarithmic differentiation, Gamma estimates, zero summability and effective choices are unresolved named inputs, not hidden routine steps; see the gaps.

The result must also satisfy these compatibility requirements: t₀>1 avoids division by log 1. This estimate alone does not control negative or bounded heights. No RH or Siegel-effectivity assumption is inserted.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem8.8 and (8.3.1)–(8.3.6), printed pp.50–51; prerequisites §8.2 pp.48–49.

*Needs:* `riemannZeta_eq_mul_completedRiemannZeta₀`; `riemannZeta_residue_one`; `differentiable_completedZeta₀`; `Complex.Gamma_ne_zero_of_re_pos`; `Complex.digamma`; [ArithmeticDirichletSeries layer 8 landau type positivity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity); `ArithmeticFunction.LSeriesSummable_vonMangoldt`; `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`; `ArithmeticFunction.vonMangoldt_nonneg`; [Pole-cancelled Riemann xi](#pole-cancelled-riemann-xi-riemann-xi); `HurwitzZeta.evenKernel`; `HurwitzZeta.hasSum_int_evenKernel`; `HurwitzZeta.hurwitzEvenFEPair`; `HurwitzZeta.completedHurwitzZetaEven₀`; `WeakFEPair.f_modif`; `WeakFEPair.Λ₀`; `mellin`; `Real.GammaIntegral_convergent`; `Real.Gamma_eq_integral`; `Real.Gamma_nat_eq_factorial`; `Nat.factorial_le_pow`; [Entire order at most ρ](#entire-order-at-most-entire-order-at-most); `TendstoLocallyUniformlyOn.deriv`; [Hadamard factorization in order at most one](#hadamard-factorization-in-order-at-most-one-order-one-hadamard); `AnalyticOnNhd.sum_divisor_le`; `AnalyticAt.analyticOrderAt_eq_natCast`; `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`; `AnalyticAt.analyticOrderAt_ne_top`; `AnalyticOnNhd.eqOn_zero_or_eventually_ne_zero_of_preconnected`; `IsCompact.finite_sdiff_of_mem_codiscreteWithin`; [Genus-one canonical factor](#genus-one-canonical-factor-genus-one-factor); `Complex.norm_log_one_add_sub_self_le`; `Complex.hasSum_taylorSeries_neg_log`; `analyticAt_clog`; `logDeriv_tprod_eq_tsum`; `riemannZeta_eq_completedRiemannZeta₀`; `Complex.Gamma_ne_zero`; `riemannZeta_ne_zero_of_one_le_re`; [Isolate the origin zero](#proof-origin-zero-factor); [Multiplicity count of compact zeros](#proof-compact-zero-count); [Zero count from an order bound](#proof-jensen-growth-zero-count); [Summable reciprocal squares of zeros](#proof-dyadic-zero-reciprocal-square); [Small canonical-factor logarithm](#proof-canonical-factor-log-tail); [Logarithmic derivative of the canonical product](#proof-canonical-product-log-derivative); [Exponential decay of the theta tail](#proof-theta-tail-decay); [Entire integral representation of xi](#proof-xi-integral-comparison); [Growth bound for the theta integral](#proof-gamma-integral-growth-majorant); [Order-one growth of xi](#proof-xi-order-one-growth); [Corrected logarithmic derivative of zeta](#proof-zeta-hadamard-log-derivative); [Logarithmic gamma bound](#proof-digamma-right-half-plane); [Pole term near one](#proof-zeta-pole-log-derivative); [Zeta three-four-one inequality](#proof-zeta-three-four-one-derivative); [A near-one zero forces a positive reciprocal term](#proof-single-zero-positive-term); [Uniform selection of the zero-free constant](#proof-zero-free-region-constant-selection); [Xi is entire with nonzero endpoints](#proof-xi-entire-and-endpoints); [Every xi zero lies in the open critical strip](#proof-xi-zero-critical-strip).

<a id="proof-canonical-product-log-derivative"></a>

**Logarithmic derivative of the canonical product.** For the order-one factorization of nonzero entire f, away from zero and its zeros, f′(z)/f(z)=m/z+b+Σ_α(1/(z−α)+1/α). The corrected summands, indexed with analytic multiplicity, converge locally uniformly there. The correction equals z/(α(z−α)); at z=0 it vanishes, and the term m/z is omitted there when m=0.

Use the canonical-product compact-tail estimate to prove summability of the regularized derivative summands on each compact set avoiding the zero family. Apply logDeriv_tprod_eq_tsum on the open complement of the locally finite zero set; canonical-product-zero-orders proves that the limit is nonzero there. Every individual factor is entire and nonzero at the evaluation point. For the normalization convention(z/α), the logarithmic derivative is1/(z−α)+1/α=z/(α(z−α)); add the affine exponential and the origin factor m/z. Track the finite/empty family and, when m=0, extend the origin value using its nonsingular formula. Match local uniform sum/reindexing separately from this pointwise theorem.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="proof-theta-tail-decay"></a>

**Exponential decay of the theta tail.** For x≥1, ω(x)=(HurwitzZeta.evenKernel(0,x)−1)/2=Σ_(n≥1)exp(−πn²x) satisfies 0≤ω(x)≤exp(−πx)/(1−exp(−π)); reuse the existing theta kernel.

Pair n and -n in the integer Gaussian HasSum at a=0, retaining its n=0 term1, to identify the positive-natural theta tail. For n≥1 and x≥1, n²−1≥n−1, so exp(−πn²x)≤exp(−πx)exp(−π(n−1)). Sum the nonnegative geometric majorant. Its ratio exp(−π) lies strictly between0 and1, including the endpoint x=1.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §5.1 omega/theta definitions and (5.1.4), p.34; Lemma8.3 p.47.

<a id="proof-xi-integral-comparison"></a>

**Entire integral representation of xi.** For all s∈C, ξ(s)=1/2+(1/2)s(s−1)∫_1^∞(x^(s/2−1)+x^((1−s)/2−1))ω(x)dx, where ω(x)=(HurwitzZeta.evenKernel(0,x)−1)/2. The integrand is absolutely integrable, and finite integrals up to R converge locally uniformly in s as R→∞.

Unfold completed0 as the zero-parameter Hurwitz weak-FE Mellin transform, not as a new meromorphic continuation of zeta. Split the modified Mellin integral at1; its value at1 is measure zero. On x>1 the modified kernel is theta−1=2ω; on0<x<1 use the same weak-FE symmetry and substitution x=1/y to obtain the second x>1 integral. On a compact set of s, each complex power and each s derivative is bounded by a fixed real power of x times a logarithmic power; exponential theta decay gives integrable domination. Match the exact split/inversion, integrability and locally uniform truncated-integral declarations at the pin; these formal adapters remain in the gap ledger, not an assumed existing integral theorem.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §5.1 (5.1.4), p.34; Lemma8.3 integral display, p.47.

<a id="proof-gamma-integral-growth-majorant"></a>

**Growth bound for the theta integral.** For every real r≥2, ∫_1^∞(x^(r/2+1)+1)exp(−πx)dx≤exp(2r log(2+r)). In particular one absolute growth constant works for all r; no Stirling theorem is required.

Set k=ceil(r/2+1), a natural integer. For r≥2, r/2+1≤k≤r/2+2≤r+1. On x≥1, x^(r/2+1)≤x^k and exp(−πx)≤exp(−x). Extend both nonnegative integrals to x>0. Library gamma integrability and Gamma(k+1)=k! bound the sum by k!+1. Use Nat.factorial_le_pow and real monotonicity to get k!+1≤2(r+1)^(r+1). Taking logarithms bounds this by exp(2r log(2+r)) for r≥2. Keep integrability separate from the totalized integral value. This repairs the false uniform-in-x majorant in Lemma8.3.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Lemma8.3 p.47, corrected using the Euler gamma integral §5.1 p.33 and factorial bound.

<a id="proof-xi-order-one-growth"></a>

**Order-one growth of xi.** There are absolute C,R>0 such that |ξ(s)|≤exp(C|s|log(2+|s|)) for |s|≥R; consequently ξ has order at most1.

For r=|s|≥2 and x≥1, each complex power has norm x to its real exponent, bounded by x^(r/2+1)+1 after harmless enlargement. Use the exponential theta bound and the explicit integral majorant; |s(s−1)|≤r(r+1). Absorb this polynomial and the absolute theta constant into exp(Cr log(2+r)). For each b>1, log(2+r)=o(r^(b−1)), so the displayed growth is at most a constant times exp(r^b) for large r. Enlarge the constant on a compact disk and use xi entirety to obtain entire_order_at_most ξ1.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.1 Lemma8.3, corrected proof.

<a id="proof-zeta-hadamard-log-derivative"></a>

**Corrected logarithmic derivative of zeta.** For s≠0,1 with ζ(s)≠0 and s/2 not a nonpositive integer, there exist Hadamard constants A,B and a locally finite multiplicity-indexed family of nonzero ξ zeros ρ such that ζ′(s)/ζ(s)=B−1/s−1/(s−1)+(log π)/2−(1/2)Γ′(s/2)/Γ(s/2)+Σ_ρ(1/(s−ρ)+1/ρ). The corrected sum is locally uniformly convergent away from ξ zeros.

Apply order-one Hadamard to the nonzero entire xi; ξ(0)=1/2 implies origin order0. On the stated comparison domain, Gamma(s/2), s, s−1 and π^(−s/2) are all nonzero. Differentiate the xi product comparison and divide only there. Use the derivative-limit theorem for the multiplicity-indexed canonical product; the regularized summand is s/(ρ(s−ρ)). Equivalently combine the −1/s term with −(1/2)ψΓ(s/2) using ψΓ(z+1)=ψΓ(z)+1/z; this yields ψΓ(1+s/2), never the printed ψΓ((s+1)/2).

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.2 (8.2.5), p.49; §8.3 (8.3.3), p.50, corrected argument the normalization convention.

<a id="proof-digamma-right-half-plane"></a>

**Logarithmic gamma bound.** There is an absolute C>0 such that for every complex z with Re z≥1/2 and |z|≥2, |Complex.digamma(z)−Log(z)|≤C/|z|; the logarithm is principal. Consequently |Γ′(z)/Γ(z)|≤C′log(2+|z|) with an absolute C′.

Use the existing digamma=logDeriv Gamma carrier and Gamma nonvanishing for positive real part. DLMF5.11.2 and §5.11(ii) give the sector-uniform remainder after Log z−1/(2z); on |arg z|≤π/2 its sec(arg z/2)^3 factor is bounded. This supplies an explicit first-remainder target. An asymptotic statement alone is not a formal proof adapter. Read the underlying complex Euler–Maclaurin/Stirling remainder proof and match its constants and branch at the pin before closing the gap. Bound |Log z|≤log|z|+π/2 on the right half-plane, absorbing the remainder into log(2+|z|).

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.4 Exercise8.4.5, p.52; DLMF5.11.2 and §5.11(ii); [NIST DLMF editors and Chapter5 authors — NIST Digital Library of Mathematical Functions, Gamma asymptotic expansions](https://dlmf.nist.gov/5.11), §5.11(i), (5.11.2), and §5.11(ii) complex remainder bound.

<a id="proof-zeta-pole-log-derivative"></a>

**Pole term near one.** There are absolute δ,K>0 such that for every real1<σ<1+δ, |−ζ′(σ)/ζ(σ)−1/(σ−1)|≤K.

Use the regular-completion formula to construct the analytic pole-cleared germ g(s)=(s−1)ζ(s) off1, with g(1)=1. The punctured residue limit fixes this value; residue alone is not derivative control. The regular denominator 2π^(−s/2)Γ(s/2+1) is analytic and nonzero near1. In the formula the numerator of g simplifies to 1+s(s−1)completed0(s). Shrink the neighbourhood so g is nonzero and its logarithmic derivative is bounded on a compact disk. Off1, −ζ′/ζ=1/(s−1)−g′/g; restrict to the real right-hand interval.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.3 (8.3.2), p.50; pole-cleared regular-completion formula.

<a id="proof-zeta-three-four-one-derivative"></a>

**Zeta three-four-one inequality.** For σ>1 and real t, 3(−ζ′/ζ)(σ)+4Re(−ζ′/ζ)(σ+it)+Re(−ζ′/ζ)(σ+2it)≥0.

Import ADS8’s nonnegative3-4-1 trigonometric package, retaining that upstream ownership. Specialize the absolutely convergent von-Mangoldt logarithmic-derivative series at σ,σ+it,σ+2it. Each coefficient is Λ(n)n^−σ≥0; its bracket is3+4cos(t log n)+cos(2t log n)=2(1+cos(t log n))². Absolute summability permits taking real parts and adding the three series.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.3 (8.3.1) and preceding Λ-series, p.50.

<a id="proof-single-zero-positive-term"></a>

**A near-one zero forces a positive reciprocal term.** For a ξ zero ρ=β+it and1<σ≤2, 0<β<1 and Re(1/(σ+it−ρ))=1/(σ−β)>0. For every other ξ zero ρ′, Re(1/(σ+it−ρ′))≥0 and Re(1/ρ′)>0. The real parts of the regularized Hadamard summands may therefore be dropped or bounded below by any one retained term.

First invoke xi-zero-critical-strip; its strict boundaries follow from zeta nonvanishing and xi reflection, not from the zero-count definition. For s=σ+it and ρ′=β′+it′, Re(1/(s−ρ′))=(σ−β′)/((σ−β′)²+(t−t′)²)>0. At ρ′=ρ this is1/(σ−β). Also Re(1/ρ′)=β′/|ρ′|²>0. Reciprocal-square summability makes these nonnegative constant real parts summable, while local uniform convergence handles the full regularized sum. Finite partial sums preserve the single-term lower bound; take their convergent limit to justify dropping the remaining terms.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.3 (8.3.4)–(8.3.6), pp.50–51; Remark5.2 p.35.

<a id="proof-zero-free-region-constant-selection"></a>

**Uniform selection of the zero-free constant.** There are effective absolute c>0 and t₀>1 such that any ξ zero β+it with t≥t₀ satisfies β<1−c/log t; hence the same high-height nontrivial zeta-zero exclusion holds.

On1<σ≤min(2,1+δ), |t|≥2, combine the corrected Hadamard formula with the gamma bound. The nonzero elementary rational terms are O(1) and gamma is O(log|t|), with constants uniform in σ. Use positivity to obtain −Re ζ′/ζ(σ+2it)≤C log t and −Re ζ′/ζ(σ+it)≤C log t−1/(σ−β). Insert these and the real pole bound into the3-4-1 inequality, obtaining4/(σ−β)≤3/(σ−1)+C₀log t. Enlarge C₀ to be at least1. Choose a=1/(2C₀), c=a/10. Then4/(a+c)>3/a+C₀. If β≥1−c/log t, set σ=1+a/log t and contradict the previous inequality. Choose t₀ effectively so t₀≥2 and a/log t₀≤min(1,δ). Effective constants are conditional on an explicitly bounded gamma remainder and pole-germ radius; those outstanding adapters remain gaps.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.3 (8.3.1)–(8.3.6) and final selection, pp.50–51.

<a id="proof-xi-entire-and-endpoints"></a>

**Xi is entire with nonzero endpoints.** ξ is entire and ξ(0)=ξ(1)=1/2.

The definition is a polynomial times the entire completed0, plus1/2, hence entire. At s=0,1 the polynomial vanishes exactly, leaving1/2; consequently xi is not identically zero and its origin order is0.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §5.1 xi definition, p.35; Lemma8.3 integral display, p.47.

<a id="proof-xi-zero-critical-strip"></a>

**Every xi zero lies in the open critical strip.** For every complex ρ with ξ(ρ)=0,0<Re ρ<1.

For Re s≥1 and s!=1, the xi comparison has nonzero factors s,s−1,π^(−s/2),Gamma(s/2),zeta(s); zeta nonvanishing includes the line Re s=1. At s=1, xi=1/2. If Re s≤0, then Re(1−s)≥1 and xi(s)=xi(1−s) is nonzero by reflection. Thus any zero has strict0<Re s<1, including exclusion of both boundary lines and all trivial zeta zeros.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §5.1 Remark5.2, p.35; §8.3 p.51.

<a id="repulsion-of-exceptional-conductors-exceptional-conductor-repulsion"></a>

### 0.29 Repulsion of exceptional conductors

With c_star from Proposition 7.1, two distinct exceptional quadratic conductors N1<N2 satisfy N2>N1^2.

The proof proceeds as follows. Apply the two-real-zero inequality at the same effective c_star. If N₂≤N₁² then log(N₁N₂)≤3 log N₁, contradicting both strict exceptional cutoffs.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Proposition 7.1 and equation (25), pp. 373-374.

*Needs:* [Exceptional real zero](#exceptional-real-zero-exceptional-real-zero); [Two-real-zero inequality](#two-real-zero-inequality-two-real-zero-separation).

<a id="explicit-prime-euler-product-bound-explicit-plus-euler-product"></a>

### 0.30 Explicit prime Euler-product bound

For real x>=10^8, product_{p prime,p<=x}(1+1/p)<=2*log x.

The proof proceeds as follows. Use the source reciprocal-prime and square-power tail estimates, retaining x≥10^8. Certify the finite threshold calculations required for the literal constant 2.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §5 proof of Lemma 5.1, p.365; alternate direct input from Rosser–Schoenfeld Theorem 8 (3.29), p.70.

*Needs:* [Explicit reciprocal-prime estimate](#explicit-reciprocal-prime-estimate-explicit-prime-reciprocal).

<a id="mertens-sum-and-product-inputs-mertens-prime-product"></a>

### 0.31 Mertens sum and product inputs

For real x≥2, ∏_{p≤x}(1−1/p)^−1=e^γ log x+O(1), with γ Euler’s constant and an absolute implied constant.

The proof proceeds as follows. Use the reciprocal-prime theorem and the Taylor remainder −log(1−u)−u=O(u²), uniformly for 0≤u≤1/2. Its prime tail is O(1/x). Thus log∏_{p≤x}(1−1/p)^−1=log log x+κ+O(1/log x). Identify κ with γ using the real Euler product at s=1+ε/log x and the corrected integral in Exercise5.4(c)–(d). The uniform tilted-product/tail estimates and the Euler-constant integral comparison are explicit unresolved inputs in the Mertens constant gap. After κ=γ, exponentiate the O(1/log x) logarithmic error; multiplication by log x gives an additive O(1). This step is not supplied by a mere two-sided comparison.

See [Dimitris Koukoulopoulos — The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Theorem3.4(c), (3.6), printed pp.40–41; Exercise5.4, printed p.61.

*Needs:* [Mertens sum and product inputs](#mertens-sum-and-product-inputs-mertens-prime-reciprocal).

<a id="landau-repulsion-for-exceptional-squareclasses-squareclass-exceptional-repulsion"></a>

### 0.32 Landau repulsion for exceptional squareclasses

There is an effective absolute0<c_Landau<1/2 such that distinct d,e∈S(c_Landau) with |d|≤|e| satisfy |d|²≤|e|. This pairwise form applies to every existing finite ordered segment; no infinitude of S(c_Landau) is asserted.

The proof proceeds as follows. Let Q_d be the fundamental-discriminant conductor. For nonzero squarefree d≠1, |d|≤Q_d≤4|d| and |d|≥1. Distinct squareclasses have distinct primitive field characters even when their absolute radicands agree. If |e|<|d|², then Q_d Q_e<16|d|³. For a=|d|≥1, log(16a³)≤5log(a+4), since16a³≤(a+4)^5. Also log(|e|+4)≥log(|d|+4). Both near-one zeros are at least1−c_Landau/log(|d|+4). Since log(Q_d Q_e)≤5log(|d|+4), choose c_Landau≤3c_star/5; both are then at least1−3c_star/log(Q_d Q_e), contradicting two_real_zero_separation. Choose c_Landau effectively small enough to lie in(0,1/2). The strict two-real-zero theorem is still an unverified source input; the elementary conductor-log deduction introduces no new analytic theorem.

The result must also satisfy these compatibility requirements: The conclusion is pairwise and vacuous for an empty/singleton exceptional set. Retain Q_−1=4 and Q_2=8; replacing conductor by |d| breaks the cited analytic input. Use the explicit slack c_Landau≤3c_star/5 and log(Q_d Q_e)≤5log(|d|+4). This keeps the factor4 and the+4 height convention.

See [Peter Koymans, Carlo Pagano — On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1), §7.2 Definition7.5 and following paragraph, p.61.

*Needs:* [Exceptional quadratic squareclasses](#exceptional-quadratic-squareclasses-exceptional-squareclasses); [Two-real-zero inequality](#two-real-zero-inequality-two-real-zero-separation).

<a id="quadratic-prime-character-interval-estimate-quadratic-prime-character-interval"></a>

### 0.33 Quadratic prime-character interval estimate

There are positive absolute effective constants c,C such that for every nonzero squarefree integer D≠1, its primitive field character χ_D of conductor Q_D=|Disc(Q(√D))|, and real2≤u<v, |Σ_{u<p<v, p prime, p∤Q_D}χ_D(p)|≤C[E_D(v)+v exp(−c log v/(√log v+log Q_D))(log(vQ_D))⁴]. Here E_D(v)=v^β if the conductor-uniform zero-free region singles out a simple real exceptional zero β∈(1/2,1), and E_D(v)=0 otherwise. Equivalently extend χ_D by0 at ramified primes and sum over all primes. This is an upper bound, not an asymptotic for short intervals.

The proof proceeds as follows. Apply character_weighted_pnt to the primitive Dirichlet character of conductor Q_D, uniformly after effective constants are fixed. Remove higher prime powers and then use Abel summation to pass from ψ(x,χ) to Σ_{p<x}χ(p). The exceptional main term has absolute value bounded by a constant times x^β because β>1/2. Subtract the two initial-interval formulas. Bound the error at u by an increasing envelope evaluated at v, after decreasing c if necessary; handle the fixed bounded-height range by enlarging C. Retain both strict endpoints. Compare |D|≤Q_D≤4|D| to recover the looser printed(7.7) radicand form, with log(v|D|)≥log2 even when D=−1. The original quantitative character-PNT proof, higher-power estimate and uniform Abel/envelope deduction remain recorded obligations.

The result must also satisfy these compatibility requirements: If(u,v) contains no unramified prime the sum is0; no unproved prime-existence claim is hidden in this bound. For D=−1 use χ_−4 and conductor4; p=2 is excluded or contributes0. Both constants are independent of D,u,v; the exceptional term is omitted only under the exact same zero-free-region convention as its supplier.

See [Peter Koymans, Carlo Pagano — On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1), §7.2 proof of Proposition7.6, (7.7), p.62.

*Needs:* [Effective character prime-number estimate](#effective-character-prime-number-estimate-character-weighted-pnt).

<a id="strict-derivative-positivity-requires-nonpolynomiality-paired-product-strict-derivatives"></a>

### 0.34 Strict derivative positivity requires nonpolynomiality

Let f be a nonzero entire function of order at most 1, let m be its vanishing order at 0, and suppose f(−z)=(−1)^m f(z), every zero of f is purely imaginary, and f(x)>0 for all sufficiently large positive real x. If f is not a polynomial, every derivative f^(k)(x) with k≡m mod2 is strictly positive for x>0, and the same-parity Taylor coefficients from degree m onward are positive.

Assume f is nonzero, entire and of order at most 1; m is its finite vanishing order at 0.; f(−z)=(−1)^m f(z); all zeros are purely imaginary; f is eventually positive on the positive real axis.; f is not a polynomial.

The proof proceeds as follows. Nonpolynomiality forces infinitely many pairs, so for every coefficient beyond m choose sufficiently many positive factors. The nonnegative convergent derivative series gives strict positivity for x>0.

The result must also satisfy these compatibility requirements: cosh(z) has infinitely many purely imaginary zero pairs and strictly positive same-parity Taylor coefficients. The polynomial 1+z² satisfies the pairing hypotheses but its fourth derivative is zero; nonpolynomiality is essential. Coefficients of degree below m vanish, including same-parity ones; positivity starts at degree m. Negating cosh preserves its zero locations and parity but makes its even derivatives negative; eventual positivity is essential.

See [Zhiwei Yun and Wei Zhang — Shtukas and the Taylor expansion of L-functions](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p02-p.pdf), Appendix B.1, Proposition B.1 and its proof, printed pp.902–903.

*Needs:* `TendstoLocallyUniformlyOn.deriv`; [Hadamard factorization in order at most one](#hadamard-factorization-in-order-at-most-one-order-one-hadamard); [Genus-one canonical factor](#genus-one-canonical-factor-genus-one-factor); [Pairing imaginary zeros](#proof-paired-imaginary-factors); [Nonnegative coefficients of the paired product](#proof-paired-product-nonnegative-coefficients); [Paired genus-one factors](#proof-canonical-factor-pair).

<a id="proof-paired-imaginary-factors"></a>

**Pairing imaginary zeros.** Under these hypotheses, there is c>0 and a locally finite positive-real family λ_j, with one index per positive-imaginary zero occurrence, such that f(z)=c z^m∏_j(1+z²/λ_j²). The products converge locally uniformly over finite subsets; finite and empty families are included.

Here f entire and not identically zero; m is its finite analytic order at zero; orderAtMost(f,1); f(−z)=(−1)^m f(z); every zero is purely imaginary; f(x) is positive real for all sufficiently large positive real x.

Parity gives equal zero multiplicities at ±iλ. Pair the genus-one factors by canonical-factor-pair; reciprocal-square summability makes this reindexing valid. The paired product is even and has value 1 at zero. Comparing f(−z) and (−1)^m f(z) near zero gives exp(−2bz)=1 for all sufficiently small z, forcing b=0. For positive x every paired factor and x^m is positive, so eventual positive reality of f forces c=exp(a)>0.

See [Zhiwei Yun and Wei Zhang — Shtukas and the Taylor expansion of L-functions](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p02-p.pdf), Appendix B.1, Proposition B.1 and its proof, printed pp.902–903.

<a id="proof-paired-product-nonnegative-coefficients"></a>

**Nonnegative coefficients of the paired product.** For the preceding paired product, every Taylor coefficient of parity m is nonnegative, and all coefficients of the other parity are zero.

Finite products have nonnegative coefficients in z². Use locally uniform derivative convergence at0 to pass to every fixed coefficient.

See [Zhiwei Yun and Wei Zhang — Shtukas and the Taylor expansion of L-functions](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p02-p.pdf), Appendix B.1, Proposition B.1 and its proof, printed pp.902–903.

<a id="proof-canonical-factor-pair"></a>

**Paired genus-one factors.** E₁(w)E₁(−w)=1−w² for all w∈C.

Unfold the stated definition and apply the finite algebraic, positivity or convergent geometric-series computation.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.2, Theorem8.7 and its genus-one product, printed pp.48–49.

<a id="conductor-uniform-dirichlet-zero-free-region-dirichlet-conductor-zero-free-region"></a>

### 0.35 Conductor-uniform Dirichlet zero-free region

There is an effective absolute c>0 such that a primitive nonprincipal Dirichlet L-function of conductor q≥2 has no zero in Re s≥1−c/log(q(|Im s|+2)), except possibly one simple real zero of a real character.

The proof proceeds as follows. Read the conductor-uniform primitive completion growth, logarithmic derivative and 3–4–1 argument in the original Davenport source; its proof remains an open gap here. Kedlaya Theorem10.6 prints max(1,|t|)log q in the denominator; this cannot supply the stronger logarithmic-height statement by specialization. Import its corrected intended statement only after the original proof is checked. Separate real and nonreal primitive nonprincipal characters, counting multiplicities in the exceptional region. Do not infer the whole conductor region from the single-real-zero uniqueness result.

The result must also satisfy these compatibility requirements: At t=0 the allowed exception is a single simple real zero of a real nonprincipal character. The modulus is the primitive conductor, with q=1/principal characters excluded.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §10.4 Theorem10.6 and Remark10.8, pp.61–62; cited Davenport §14 unread.

*Needs:* [Hadamard factorization in order at most one](#hadamard-factorization-in-order-at-most-one-order-one-hadamard); [Uniqueness and simplicity of an exceptional zero](#uniqueness-and-simplicity-of-an-exceptional-zero-exceptional-zero-unique); `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`; `DirichletCharacter.differentiable_completedLFunction`; [Conductor-uniform local Dirichlet zero count](#proof-primitive-character-unit-height-zero-count).

<a id="proof-primitive-character-unit-height-zero-count"></a>

**Conductor-uniform local Dirichlet zero count.** There is an absolute C>0 such that for every primitive nonprincipal Dirichlet character χ of conductor q≥1 and every real u, the nontrivial L-zero occurrences with u≤Imρ≤u+1 number at most C log(q(2+|u|)).

Use the primitive completed L-function and its functional equation, retaining parity and conductor factor; gamma factors are nonzero on the open critical strip. A local Jensen/product argument must supply both a centre lower bound at2+iu and a relative disk growth bound with absolute constants and the explicit q power. Read the original proof behind Lemma10.3 (Davenport§16) or an equivalent public proof; neither the gamma continuation API nor the zeta-only weight lemma supplies this conductor-uniform bound. Handle |u|≤2 with the same q-dependent compact count. Character inversion/conjugation is needed when reflecting signs; do not assume a complex character has its own conjugate-zero symmetry.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §10.2 Lemma10.3 p.60, referring to Davenport§16.

<a id="mertens-product-input-mertens-product-comparison"></a>

### 0.36 Mertens product input

For y≥2, ∏_{p≤y}(1−1/p) is comparable to 1/log y, with absolute positive upper and lower constants. The application here needs the lower estimate after removing finitely many fixed primes, not an unsourced precise constant.

The proof proceeds as follows. Use the reciprocal Mertens product asymptotic and positivity. Extend the two-sided comparison over the compact starting range y≥2.

The result must also satisfy these compatibility requirements: For y=2 the product is 1/2; extend the eventual comparison to y≥2 using its finitely many values below any fixed threshold. Removing a fixed finite set of primes multiplies the product by finitely many positive inverse factors; the resulting constants may depend on that set.

See [Dimitris Koukoulopoulos — The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Theorem3.4(c), printed pp.40–41; [Alexei N. Skorobogatov and Efthymios Sofos — Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Proof of Lemma4.9 p.713 and proof of Lemma4.11 p.716.

*Needs:* [Mertens sum and product inputs](#mertens-sum-and-product-inputs-mertens-prime-product).

<a id="siegel-walfisz-theorem-siegel-walfisz"></a>

### 0.37 Siegel–Walfisz theorem

For every A,B>0, uniformly for q≤(log x)^B and gcd(a,q)=1, π(x;a,q)=Li(x)/φ(q)+O_{A,B}(x(log x)^−A) as x→∞. The constant and threshold may be ineffective. The representative inclusive ψ signature is `siegel_walfisz`.

The proof proceeds as follows. Use the conductor-uniform character estimate including its exceptional contribution, reduce imprimitive characters with their finite Euler corrections, and apply exact finite orthogonality to the progression Λ coefficient. Derive an ineffective separation 1−β≥c_ε q^(−ε) for primitive real characters from Siegel’s L(1,χ) lower bound together with a conductor-controlled derivative estimate near1. The L-value lower bound alone is not a zero-separation theorem; this adapter remains a gap. For q≤(log x)^B choose ε<1/B (for example 1/(2(B+1))). Then x^β/x≤exp(−c_ε (log x)^(1−Bε)), which absorbs any fixed power of log x. Character averaging cannot increase the uniform coefficient bound. Dominate higher prime powers by ψ−θ, then apply the generic ADS Abel transfer. The constants and threshold may be ineffective and depend on A,B before quantifying over q,a,x.

The result must also satisfy these compatibility requirements: For B=1 one may take ε=1/4; the exceptional relative term is ≤exp(−c(log x)^(3/4)). The assertion is restricted to reduced classes and logarithmic modulus growth; it is not an effective uniform theorem for every modulus.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §10.5 Theorem10.9 pp.62–63 and Theorem10.11 p.63; corrected coprimality, range and ineffectivity.

*Needs:* [Conductor-uniform Dirichlet zero-free region](#conductor-uniform-dirichlet-zero-free-region-dirichlet-conductor-zero-free-region); [Siegel's theorem (black box)](#siegel-s-theorem-black-box-siegel-quadratic-lvalue); [Effective character prime-number estimate](#effective-character-prime-number-estimate-character-weighted-pnt); `DirichletCharacter.sum_char_inv_mul_char_eq`; `DirichletCharacter.LFunctionTrivChar_eq_mul_riemannZeta`; `Chebyshev.isBigO_psi_sub_theta_sqrt`; [ArithmeticDirichletSeries layer 6 abel and perron summation](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation).

<a id="zero-free-zeta-strip-and-logarithmic-bounds-green-tao-zeta-strip"></a>

### 0.38 Zero-free zeta strip and logarithmic bounds

There exist0<β<1 and C>0 such that for Z={s:1−β/log(|Im s|+2)≤Re s≤10}, ζ is meromorphic with its only pole in Z a simple pole at1 of residue1 and no zeros away from1. The functions G(s)=ζ(s)−1/(s−1) and R(s)=1/ζ(s), initially defined off1, have analytic extensions to a neighbourhood of Z, with R(1)=0 and |G(s)|,|R(s)|≤C log(|Im s|+2) throughout Z. Values at1 refer to these extensions, not to totalized ζ(1).

The proof proceeds as follows. Combine the high-height logarithmic-derivative zero-free proof with the real-line nonvanishing and pole germ on compact bounded-height sets. Shrink β to join the regions. Prove high-height logarithmic bounds for ζ after pole subtraction and its reciprocal, and absorb the compact-region bounds into C. These are named quantitative inputs with a complete quantitative proof still required; high-height nonvanishing alone is insufficient.

See [Ben Green and Terence Tao — The primes contain arbitrarily long arithmetic progressions](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n2-p03.pdf), AppendixA LemmaA.1, printed p.541.

*Needs:* [Classical high-height zero-free region](#classical-high-height-zero-free-region-classical-zero-free-region); [Pole-cancelled Riemann xi](#pole-cancelled-riemann-xi-riemann-xi); `HurwitzZeta.evenKernel`; `HurwitzZeta.hasSum_int_evenKernel`; `HurwitzZeta.hurwitzEvenFEPair`; `HurwitzZeta.completedHurwitzZetaEven₀`; `WeakFEPair.f_modif`; `WeakFEPair.Λ₀`; `mellin`; `Real.GammaIntegral_convergent`; `Real.Gamma_eq_integral`; `Real.Gamma_nat_eq_factorial`; `Nat.factorial_le_pow`; [Entire order at most ρ](#entire-order-at-most-entire-order-at-most); `differentiable_completedZeta₀`; `TendstoLocallyUniformlyOn.deriv`; [Hadamard factorization in order at most one](#hadamard-factorization-in-order-at-most-one-order-one-hadamard); `AnalyticOnNhd.sum_divisor_le`; `AnalyticAt.analyticOrderAt_eq_natCast`; `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`; `AnalyticAt.analyticOrderAt_ne_top`; `AnalyticOnNhd.eqOn_zero_or_eventually_ne_zero_of_preconnected`; `IsCompact.finite_sdiff_of_mem_codiscreteWithin`; [Genus-one canonical factor](#genus-one-canonical-factor-genus-one-factor); `Complex.norm_log_one_add_sub_self_le`; `Complex.hasSum_taylorSeries_neg_log`; `analyticAt_clog`; `logDeriv_tprod_eq_tsum`; `riemannZeta_eq_completedRiemannZeta₀`; `Complex.Gamma_ne_zero`; `riemannZeta`; [Isolate the origin zero](#proof-origin-zero-factor); [Multiplicity count of compact zeros](#proof-compact-zero-count); [Zero count from an order bound](#proof-jensen-growth-zero-count); [Summable reciprocal squares of zeros](#proof-dyadic-zero-reciprocal-square); [Small canonical-factor logarithm](#proof-canonical-factor-log-tail); [Logarithmic derivative of the canonical product](#proof-canonical-product-log-derivative); [Exponential decay of the theta tail](#proof-theta-tail-decay); [Entire integral representation of xi](#proof-xi-integral-comparison); [Growth bound for the theta integral](#proof-gamma-integral-growth-majorant); [Order-one growth of xi](#proof-xi-order-one-growth); [Corrected logarithmic derivative of zeta](#proof-zeta-hadamard-log-derivative); [Xi is entire with nonzero endpoints](#proof-xi-entire-and-endpoints).

### Remaining analytic proof obligations

**Canonical-product analytic foundations.** For the order-one product, establish unordered exponential-sum/product convergence, finite-head/tail splitting and locally uniform derivative summability with multiplicity-preserving reindexing. The general product logarithmic-derivative theorem is an imported result; verify its factor and limit nonvanishing hypotheses. Used in [Hadamard factorization in order at most one](#hadamard-factorization-in-order-at-most-one-order-one-hadamard); [Classical high-height zero-free region](#classical-high-height-zero-free-region-classical-zero-free-region); [Zero-free zeta strip and logarithmic bounds](#zero-free-zeta-strip-and-logarithmic-bounds-green-tao-zeta-strip); [Classical PNT remainder](#classical-pnt-remainder-rational-pnt-error); [Half-interval explicit formula and low-zero-safe bound](#half-interval-explicit-formula-and-low-zero-safe-bound-character-half-interval-formula); [Riemann–von Mangoldt zero count](#riemann-von-mangoldt-zero-count-riemann-von-mangoldt-count); [Truncated von Mangoldt formula](#truncated-von-mangoldt-formula-von-mangoldt-explicit-formula-and-pnt-error).

**Canonical-product lower bound on good circles.** The three radial estimates require the finite/infinite logarithm-to-product identity, positive-power absorption and interval outer-measure subadditivity. The excluded intervals have total length 2Σ|α|^(−2), giving a good radius in every interval longer than that total. Used in [Hadamard factorization in order at most one](#hadamard-factorization-in-order-at-most-one-order-one-hadamard).

**Higher-genus factorization refinement.** For genus floor(ρ), prove reciprocal-power summability of exponent floor(ρ)+1, the compact-normal product limit and the polynomial degree bound in the entire logarithm. Yun–Zhang Appendix B.1, pp.901–902 states the needed finite-order theorem; its cited original good-circle proof remains a source boundary. Used in [Finite-order Hadamard factorization](#finite-order-hadamard-factorization-finite-order-hadamard).

**Xi Mellin and real gamma estimates.** Match the weak functional-equation Mellin split at 1, inversion x↦1/x and locally uniform truncated-integral limits to the theta kernel. The integer Gamma/factorial majorant proves the growth bound without a Stirling upper bound. Used in [Classical high-height zero-free region](#classical-high-height-zero-free-region-classical-zero-free-region); [Zero-free zeta strip and logarithmic bounds](#zero-free-zeta-strip-and-logarithmic-bounds-green-tao-zeta-strip); [Classical PNT remainder](#classical-pnt-remainder-rational-pnt-error); [Half-interval explicit formula and low-zero-safe bound](#half-interval-explicit-formula-and-low-zero-safe-bound-character-half-interval-formula); [Riemann–von Mangoldt zero count](#riemann-von-mangoldt-zero-count-riemann-von-mangoldt-count); [Truncated von Mangoldt formula](#truncated-von-mangoldt-formula-von-mangoldt-explicit-formula-and-pnt-error); [Finite zero multiset](#finite-zero-multiset-zeta-zero-multiset).

**Quantitative zeta analytic estimates.** Prove a sector-uniform first digamma remainder with an explicit branch and constant, and a bounded logarithmic derivative of the nonzero pole-cleared zeta germ. Track these constants into zero-free-region effectivity; a qualitative residue limit does not bound a derivative. Used in [Classical high-height zero-free region](#classical-high-height-zero-free-region-classical-zero-free-region); [Zero-free zeta strip and logarithmic bounds](#zero-free-zeta-strip-and-logarithmic-bounds-green-tao-zeta-strip); [Classical PNT remainder](#classical-pnt-remainder-rational-pnt-error); [Half-interval explicit formula and low-zero-safe bound](#half-interval-explicit-formula-and-low-zero-safe-bound-character-half-interval-formula); [Riemann–von Mangoldt zero count](#riemann-von-mangoldt-zero-count-riemann-von-mangoldt-count); [Truncated von Mangoldt formula](#truncated-von-mangoldt-formula-von-mangoldt-explicit-formula-and-pnt-error).

**Primitive character explicit-formula uniformity.** Prove primitive-character Jensen centre lower bounds and relative disk growth uniformly in conductor and height, including low heights and conjugate-character reflection. Combine these with safe heights, the exact finite Perron kernel and deleted Euler factors. The low-zero weight is min(1,1/|ρ|), never 1/|Imρ|. Used in [Classical PNT remainder](#classical-pnt-remainder-rational-pnt-error); [Half-interval explicit formula and low-zero-safe bound](#half-interval-explicit-formula-and-low-zero-safe-bound-character-half-interval-formula); [Conductor-uniform Dirichlet zero-free region](#conductor-uniform-dirichlet-zero-free-region-dirichlet-conductor-zero-free-region).

**Conductor-uniform region and Siegel–Walfisz proof.** Derive the logarithmic conductor-height zero-free region from the completed-character logarithmic derivative and the 3–4–1 inequality. Kedlaya Theorem 10.6 prints a different denominator and does not certify this stronger formulation. Siegel–Walfisz also needs a conductor-controlled derivative converting the ineffective L(1,χ) bound into zero separation, with imprimitive corrections. Used in [Conductor-uniform Dirichlet zero-free region](#conductor-uniform-dirichlet-zero-free-region-dirichlet-conductor-zero-free-region); [Siegel–Walfisz theorem](#siegel-walfisz-theorem-siegel-walfisz).

**Conductor-uniform zero theory.** Choose one effective exceptional-region width small enough for uniqueness, simplicity and two-character repulsion simultaneously. Include complex zeros and analytic multiplicities in the family bound. The conductor-product inequality log(N₁N₂)≤3log N₁ when N₂≤N₁² must use the same width. The zero-density count includes the exceptional zero, adding 1 if the source theorem omits it. Used in [Repulsion of exceptional conductors](#repulsion-of-exceptional-conductors-exceptional-conductor-repulsion); [Two-real-zero inequality](#two-real-zero-inequality-two-real-zero-separation); [Uniqueness and simplicity of an exceptional zero](#uniqueness-and-simplicity-of-an-exceptional-zero-exceptional-zero-unique); [Effective character prime-number estimate](#effective-character-prime-number-estimate-character-weighted-pnt); [Bounded-height Landau–Page theorem](#bounded-height-landau-page-theorem-landau-page-bounded-height); [Selberg zero-density input](#selberg-zero-density-input-selberg-zero-density).

**Certified numerical analytic inputs.** Certify every literal threshold and numerical constant by rational logarithm enclosures and analytic tails: quadratic conductors include 24; progression subtraction at k and k/2 requires k≥2·10^10; higher prime powers retain their strict bound; the reciprocal-prime and Mertens-product ranges begin at 286 and 319; the sharper tail begins at 10^8. The explicit separation constant 40 needs the class-number and derivative comparison, and unconditional theta tables must not be replaced by RH tables. Used in [Largest prime factor of a quadratic conductor](#largest-prime-factor-of-a-quadratic-conductor-quadratic-conductor-largest-prime); [Schoenfeld explicit Chebyshev bound](#schoenfeld-explicit-chebyshev-bound-schoenfeld-theta-upper); [Mod-eight prime mass](#mod-eight-prime-mass-mod-eight-interval-mass); [Prime powers do not erase the character-sum margin](#prime-powers-do-not-erase-the-character-sum-margin-prime-power-interval-margin); [Rosser–Schoenfeld explicit prime-count bounds](#rosser-schoenfeld-explicit-prime-count-bounds-rosser-schoenfeld-pi); [Explicit reciprocal-prime estimate](#explicit-reciprocal-prime-estimate-explicit-prime-reciprocal); [Quadratic real-zero separation from one](#quadratic-real-zero-separation-from-one-quadratic-effective-zero-gap); [Weighted-prime sum input to the factorial estimate](#weighted-prime-sum-input-to-the-factorial-estimate-explicit-weighted-prime-sum); [Explicit prime Euler-product bound](#explicit-prime-euler-product-bound-explicit-plus-euler-product).

**Ineffective Siegel estimates.** The original Siegel estimate requires its real primitive-character normalization and proof. Its constant remains ineffective. Used in [Siegel's theorem (black box)](#siegel-s-theorem-black-box-siegel-quadratic-lvalue).

**Mertens constant and error.** For Mertens’ constant, prove the tilted finite-product comparison, prime-tail integral estimate, positive-real Euler-product/pole adapter and Euler-constant integral. Use κ=∫(1_[0,1](u)−exp(−u))/u du; reversing the integrand reverses the constant. Used in [Mertens sum and product inputs](#mertens-sum-and-product-inputs-mertens-prime-product).

**Mertens first theorem.** Mertens’ first theorem needs the log-summatory estimate Σ_{n≤x}log n=xlog x−x+O(log x) and the convergent higher-prime-power majorant Σlog m/(m(m−1)). These elementary inputs do not require a quantitative prime theorem. Used in [Mertens's first theorem and Σ_{p | N} log p/p = O(log log N)](#mertens-s-first-theorem-and-p-n-log-p-p-o-log-log-n-mertens-first-theorem).

**Koymans–Pagano analytic suppliers.** For Koymans–Pagano, supply quantitative Selberg–Delange and reconcile the all-A coefficient range with the cited bound r<log log N. Prove conductor-aware two-real-zero repulsion using Q_d≤4|d|, log(Q_dQ_e)≤5log(|d|+4) and c_Landau≤3c_star/5. Prime-interval transfer needs higher-power, Abel and envelope estimates. Heilbronn’s argument additionally requires Aramata–Brauer entire quotients, integral zero orders, subgroup averages, cyclicity and determinant parity. Used in [Restricted squarefree Landau asymptotic](#restricted-squarefree-landau-asymptotic-restricted-squarefree-landau-count); [Restricted squarefree Sathe–Selberg bounds](#restricted-squarefree-sathe-selberg-bounds-restricted-sathe-selberg-count); [Landau repulsion for exceptional squareclasses](#landau-repulsion-for-exceptional-squareclasses-squareclass-exceptional-repulsion); [Quadratic prime-character interval estimate](#quadratic-prime-character-interval-estimate-quadratic-prime-character-interval); [Effective distance of a quadratic real zero from one](#effective-distance-of-a-quadratic-real-zero-from-one-effective-quadratic-zero-separation); [Heilbronn's theorem on real zeros of Dedekind zeta functions](#heilbronn-s-theorem-on-real-zeros-of-dedekind-zeta-functions-heilbronn-simple-real-zero).

**Green–Tao 2008 analytic contract.** The Green–Tao contract needs high-height logarithmic and reciprocal bounds, bounded-height completion and weak convexity. A consumer using a growing W(N) must prove W(N)≤(log N)^B before applying Siegel–Walfisz; a fixed-modulus prime theorem does not establish that condition. Used in [Classical high-height zero-free region](#classical-high-height-zero-free-region-classical-zero-free-region); [Conductor-uniform Dirichlet zero-free region](#conductor-uniform-dirichlet-zero-free-region-dirichlet-conductor-zero-free-region); [Siegel–Walfisz theorem](#siegel-walfisz-theorem-siegel-walfisz); [Zero-free zeta strip and logarithmic bounds](#zero-free-zeta-strip-and-logarithmic-bounds-green-tao-zeta-strip); [Weak zeta convexity in a closed strip](#weak-zeta-convexity-in-a-closed-strip-riemann-zeta-weak-convexity).

### Examples

At modulus 1 the progression sums recover the ordinary Chebyshev sums. At modulus 2 the nonunit class 0 contains the prime 2 but no other prime, so θ(x;0,2)=log 2 for x≥2. A conjectured exceptional zero is not an example of an existing zero: β=1 and the lower cutoff are excluded by definition. The constant function 1 satisfies every upper-order bound but cannot satisfy strict derivative positivity; this explains the nonpolynomiality hypothesis.

### Dependencies

Mathlib complex analysis, arithmetic functions, Chebyshev sums, Dirichlet continuation and nonvanishing; ArithmeticDirichletSeries Layers 3, 6 and 8; the canonical factor and ξ targets of this layer. Qualitative prime theorems are consumed only through the boundary contracts.

<a id="layer-1-explicit-formulas-mean-values-and-conditional-prime-estimates"></a>

## Layer 1: Explicit formulas, mean values and conditional prime estimates

Use finite analytic-order zero data and half-weight arithmetic sums to state exact contour formulas. Uniform Gamma estimates are independent analytic inputs. Primitive-character and ray-class density results retain conductor and field-degree dependence. The RH and GRH propositions form an explicit conditional interface; no unconditional proof consumes them.

<a id="reciprocal-zeta-on-the-line-one-reciprocal-zeta-line-one"></a>

### 1.1 Reciprocal zeta on the line one

Let Zinv be the meromorphic reciprocal of the continued ζ, extended at s=1 by zero. For all real t, |Zinv(1+2it)|≤C log(2+|t|), and Zinv(1+2it)→0 as t→0.

The proof proceeds as follows. Use the zero-free region and pole-cleared reciprocal estimates away from t=0. Extend 1/ζ through the pole by the removable value 0; no totalized value of 1/riemannZeta 1 is used.

See [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Proof of Proposition 2, p.969 ('standard estimates for the gamma function quotient and for ζ(2s)'); [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Proof of Proposition2, printed p.969, sentence preceding (6.7).

*Needs:* [Classical high-height zero-free region](#classical-high-height-zero-free-region-classical-zero-free-region).

<a id="davenport-uniform-m-bius-exponential-cancellation-davenport-mobius-cancellation"></a>

### 1.2 Davenport uniform Möbius exponential cancellation

For every A>0 there is C_A such that for y≥2, sup_{α∈ℝ}|Σ_{1≤r≤y}μ(r)e^{ir α}|≤C_A y(log y)^{−A}. A complete proof requires the uniform Fourier estimate in Davenport (1937) or Iwaniec–Kowalski, Theorem 13.10.

The proof proceeds as follows. Use Davenport’s original uniform exponential-sum theorem; α ranges over all real values. Retain arbitrary logarithmic power A and y≥2.

See [Alexei N. Skorobogatov and Efthymios Sofos — Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Lemma3.2 and proof reference, published p.690.

*Needs:* `ArithmeticFunction.moebius`.

<a id="admissible-weil-test-function-weil-test-function"></a>

### 1.3 Admissible Weil test function

For c≥0 and F:R→R, weil_test_function(c,F) means that some ε>0 makes G(x)=F(x)exp((1/2+c+ε)|x|) Lebesgue integrable and of bounded variation on R, that F(x)=(F(x−)+F(x+))/2 at every x, and that the difference quotient q(x)=(F(x)−F(0))/x for x≠0, set to0 at x=0, has bounded variation on R. The quotient may have distinct finite one-sided limits at0; no differentiability at0 is imposed. These symmetric-tail hypotheses are a strengthening of Mestre’s printed one-signed weight. They supply both F and its reflection in the contour proof.

The proof proceeds as follows. Use the real bounded-variation and strict one-sided-limit notions, not a replacement variation or limit carrier. Finite weighted variation implies local finite variation of F and genuine one-sided limits. Use ordinary real division at x=0 to choose q(0)=0; changing this single finite value does not affect integrability or finite variation. Bound q near0 to obtain F(x)−F(0)=O(|x|). For the transform on −c≤Re s≤1+c, dominate its norm by |G(x)|exp(−ε|x|). Reflection and real linear combinations retain the conditions after decreasing ε.

The required interface consists of the following operations and identities.

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

The result must also satisfy these compatibility requirements: F=0 is admissible and Φ=0. For c≥0, F(x)=exp(−x²) is admissible and Φ_F(1/2)=√π. F(x)=exp(−2x) on all R satisfies neither two-tail integrability nor the required Fourier transform; a one-tail test is rejected. F(x)=exp(−|x|) is admissible for c=0, although (F(x)−F(0))/x has one-sided limits1 and−1 at0. A removable-continuous-quotient requirement would wrongly reject it. F(x)=exp(x/4) for x<0 and exp(−2x) for x≥0 satisfies Mestre’s one-signed weighted integrability/BV conditions at c=0, ε=1/4 and the difference-quotient condition, but is not admissible here and its ordinary transform integral at s=0 diverges.

See [Jean-François Mestre — Formules explicites et minorations de conducteurs de variétés algébriques](https://www.numdam.org/item/CM_1986__58_2_209_0.pdf), §I.2, pp.212–214.

*Needs:* `BoundedVariationOn`; `Function.leftLim`; `Function.rightLim`; `MeasureTheory.Integrable`; `MeasureTheory.integral`.

<a id="finite-zero-multiset-zeta-zero-multiset"></a>

### 1.4 Finite zero multiset

For T≥0, Z(T) is the finite multiset of nontrivial zeros of ξ in 0≤Re ρ≤1 and |Im ρ|<T, with each ρ repeated analyticOrderNatAt ξ ρ times. The strict height cutoff and finite analytic orders are mandatory; the compact enclosing rectangle proves finiteness.

The proof proceeds as follows. Use xi entirety and nonzero endpoints, and its strict zero-strip lemma. The closed rectangle0≤Reρ≤1,|Imρ|≤T is compact, so isolated zeros and finite analytic orders give a finite support. Restrict to the strict height cutoff and use a Finsupp over complex points whose value is the analytic order; Multiset repetition is an equivalent presentation. The xi/zeta multiplicity comparison on the open strip multiplies zeta by analytic nonzero elementary/gamma factors. The Mellin comparison gives conjugation of xi; conjugation preserves analytic orders. For T≤0 the strict-height support is empty. Prove the monotonicity and endpoint tests without confusing the enclosing closed rectangle with the actual strict cutoff.

The required interface consists of the following operations and identities.

- `zeta_zero_multiset.multiplicity`: The multiplicity of ρ in Z(T) is its finite analytic order if it lies in the stated rectangle, and0 otherwise.
- `zeta_zero_multiset.mono`: If T≤U then Z(T) is a submultiset of Z(U).
- `zeta_zero_multiset.conjugation`: Conjugation preserves the zero multiset and multiplicities.
- `zeta_zero_multiset.xi_zeta`: On 0<Re ρ<1, ξ and ζ have the same zeros and analytic multiplicities.

**Checks.**

- Z(0) is empty, using the strict height inequality.
- A double analytic zero occurs twice, not once.
- A zero with |Im ρ|=T is excluded from Z(T).
- s=0 and1 are not xi zeros since ξ has value1/2 there.

The result must also satisfy these compatibility requirements: Z(0) is empty, using the strict height inequality. A double analytic zero occurs twice, not once. A zero with |Im ρ|=T is excluded from Z(T). s=0 and1 are not xi zeros since ξ has value1/2 there.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §9.2 Lemma9.2 and strict-cutoff Theorem9.9, pp.54,56–58; §5.1 xi symmetry p.35.

*Needs:* [Pole-cancelled Riemann xi](#pole-cancelled-riemann-xi-riemann-xi); `AnalyticAt.analyticOrderAt_eq_natCast`; `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`; `AnalyticOnNhd.eqOn_zero_or_eventually_ne_zero_of_preconnected`; `IsCompact.finite_sdiff_of_mem_codiscreteWithin`; `AnalyticAt.analyticOrderAt_ne_top`; `analyticOrderNatAt`; `differentiable_completedZeta₀`; `riemannZeta_ne_zero_of_one_le_re`; `riemannZeta_eq_completedRiemannZeta₀`; `Complex.Gamma_ne_zero_of_re_pos`; `HurwitzZeta.evenKernel`; `HurwitzZeta.hasSum_int_evenKernel`; `HurwitzZeta.hurwitzEvenFEPair`; `HurwitzZeta.completedHurwitzZetaEven₀`; `WeakFEPair.f_modif`; `WeakFEPair.Λ₀`; `mellin`; [Multiplicity count of compact zeros](#proof-compact-zero-count); [Exponential decay of the theta tail](#proof-theta-tail-decay); [Entire integral representation of xi](#proof-xi-integral-comparison); [Xi is entire with nonzero endpoints](#proof-xi-entire-and-endpoints); [Every xi zero lies in the open critical strip](#proof-xi-zero-critical-strip).

<a id="half-interval-explicit-formula-and-low-zero-safe-bound-character-half-interval-formula"></a>

### 1.5 Half-interval explicit formula and low-zero-safe bound

There are absolute C>0 and k₀≥2 such that for every primitive nonprincipal Dirichlet characterχ of conductor q, integer k≥k₀ and real2≤T≤k, Σ_(k/2<m≤k)χ(m)Λ(m)=−Σ_(nontrivial zeros |Imρ|≤T)mρ(k^ρ−(k/2)^ρ)/ρ+E, with |E|≤C[k log²(qk)/T+log²(qk)]. Endpoint sums are over positive integers; powers use exp(ρ log x).

The proof proceeds as follows. Establish the primitive conductor-uniform finite-height explicit formula, with its exact near-zero parity term and safe-height adjustment. KedlayaTheorem10.2 cites Davenport§19; this original proof remains required. Subtract the formulas at k and k/2 before taking absolute values. The character constant b(χ) cancels, and the even-character logarithm difference is a bounded log2 term after using the corrected parity convention. For integer k both endpoints have nearest-other-prime-power distance at least1/2. Apply the two finite Perron remainder bounds; since T≤k,log(qkT)≤2log(qk). Convert endpoint half weights to the unweighted(k/2,k] sum at cost O(log k). Adjust a safe strict cutoff to the stated inclusive |Imρ|≤T using the conductor-uniform local count and the low-zero-safe kernel. Apply the bounded-weight zero sum to consumers requiring an absolute bound. Imprimitive characters require separate deleted local Euler factors and are not included in this signature.

The result must also satisfy these compatibility requirements: For odd k, k/2 is a half integer; for even k both integer endpoint corrections are included. The constant is independent of q,k,T; nonprincipal and primitive are actual hypotheses. An arbitrarily small real zero has a bounded half-interval kernel; no absolute1/|ρ| bound is assumed.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Bennett–Siksek §12 Proposition12.2 p.387; Kedlaya §§10.1–10.2 pp.59–60, parity corrected the normalization convention; [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §10.2 Lemma10.3 p.60, uniform local count used in the explicit-formula route.

*Needs:* `DirichletCharacter.differentiable_completedLFunction`; `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`; [Pole-cancelled Riemann xi](#pole-cancelled-riemann-xi-riemann-xi); `HurwitzZeta.evenKernel`; `HurwitzZeta.hasSum_int_evenKernel`; `HurwitzZeta.hurwitzEvenFEPair`; `HurwitzZeta.completedHurwitzZetaEven₀`; `WeakFEPair.f_modif`; `WeakFEPair.Λ₀`; `mellin`; `Real.GammaIntegral_convergent`; `Real.Gamma_eq_integral`; `Real.Gamma_nat_eq_factorial`; `Nat.factorial_le_pow`; [Entire order at most ρ](#entire-order-at-most-entire-order-at-most); `differentiable_completedZeta₀`; `TendstoLocallyUniformlyOn.deriv`; [Hadamard factorization in order at most one](#hadamard-factorization-in-order-at-most-one-order-one-hadamard); `AnalyticOnNhd.sum_divisor_le`; `AnalyticAt.analyticOrderAt_eq_natCast`; `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`; `AnalyticAt.analyticOrderAt_ne_top`; `AnalyticOnNhd.eqOn_zero_or_eventually_ne_zero_of_preconnected`; `IsCompact.finite_sdiff_of_mem_codiscreteWithin`; [Genus-one canonical factor](#genus-one-canonical-factor-genus-one-factor); `Complex.norm_log_one_add_sub_self_le`; `Complex.hasSum_taylorSeries_neg_log`; `analyticAt_clog`; `logDeriv_tprod_eq_tsum`; `riemannZeta_eq_completedRiemannZeta₀`; `Complex.Gamma_ne_zero`; `ArithmeticFunction.LSeriesSummable_vonMangoldt`; `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`; `ArithmeticFunction.vonMangoldt_nonneg`; `Complex.digamma`; `Complex.Gamma_ne_zero_of_re_pos`; `riemannZeta_ne_zero_of_one_le_re`; `Complex.differentiableAt_Gamma`; [ArithmeticDirichletSeries layer 6 abel and perron summation](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation); [Isolate the origin zero](#proof-origin-zero-factor); [Multiplicity count of compact zeros](#proof-compact-zero-count); [Zero count from an order bound](#proof-jensen-growth-zero-count); [Summable reciprocal squares of zeros](#proof-dyadic-zero-reciprocal-square); [Small canonical-factor logarithm](#proof-canonical-factor-log-tail); [Logarithmic derivative of the canonical product](#proof-canonical-product-log-derivative); [Exponential decay of the theta tail](#proof-theta-tail-decay); [Entire integral representation of xi](#proof-xi-integral-comparison); [Growth bound for the theta integral](#proof-gamma-integral-growth-majorant); [Order-one growth of xi](#proof-xi-order-one-growth); [Corrected logarithmic derivative of zeta](#proof-zeta-hadamard-log-derivative); [Logarithmic gamma bound](#proof-digamma-right-half-plane); [Bounded right-edge logarithmic derivative](#proof-zeta-log-derivative-right); [Low-zero-safe interval kernel](#proof-low-zero-safe-interval-kernel); [Logarithmic-square sum of zero weights](#proof-zero-weight-sum); [Xi is entire with nonzero endpoints](#proof-xi-entire-and-endpoints); [Every xi zero lies in the open critical strip](#proof-xi-zero-critical-strip); [Uniform reciprocal-square zero weight](#proof-zeta-poisson-zero-weight); [Conductor-uniform local Dirichlet zero count](#proof-primitive-character-unit-height-zero-count).

<a id="proof-zeta-log-derivative-right"></a>

**Bounded right-edge logarithmic derivative.** For every complex s with Re s≥2, |ζ′(s)/ζ(s)|≤Σ_(n≥1)Λ(n)n^−2<∞, with the same absolute constant for every imaginary part.

Import the absolute summability and identity of the complex von-Mangoldt L-series for Re s>1. Use Λ(n)≥0 and the complex-power norm formula; for n≥1 and Re s≥2, n^(−Re s)≤n^−2. Sum the termwise norm bound. Absolute convergence at s=2 is already the summability theorem; do not re-plan its log n integral comparison.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.3 negative log-derivative series, p.50; LSeries_vonMangoldt_eq_deriv_riemannZeta_div.

<a id="proof-low-zero-safe-interval-kernel"></a>

**Low-zero-safe interval kernel.** For every real x≥2 and complex ρ with0<Reρ<1, |(x^ρ−(x/2)^ρ)/ρ|≤2x^(Reρ)min(1,1/|ρ|). Positive-real powers use exp(ρ log x); the bound remains finite as ρ approaches0.

Since Reρ>0,ρ≠0. Integrate the derivative of t↦t^ρ on[x/2,x] to write the quotient as∫ t^(ρ−1)dt. For t in that interval, t^(Reρ)≤x^(Reρ), so the integral norm is at most x^(Reρ)∫dt/t=x^(Reρ)log2. The direct numerator bound is at most2x^(Reρ)/|ρ|. If |ρ|≤1 use log2≤2; if |ρ|≥1 use the second bound, yielding the explicit constant2. The limit asρ→0 is log2, not a divergent reciprocal. The subtraction must precede absolute values.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Bennett–Siksek §12 Proposition12.2 p.387, repaired half-interval deduction.

<a id="proof-zero-weight-sum"></a>

**Logarithmic-square sum of zero weights.** There is an absolute C>0 such that for every primitive Dirichlet characterχ of conductor q≥1 and every T≥2, Σ_(nontrivial zeros |Imρ|≤T)mρ min(1,1/|ρ|)≤C log²(q(T+2)). Nontrivial means0<Reρ<1, and multiplicity is analytic order.

For a primitive nonprincipal character, invoke the new conductor-uniform local count, including |Imρ|≤1; the weight there is at most1, so an arbitrarily low exceptional zero does not introduce1/|ρ|. For each unit band m≤|Imρ|<m+1 with m≥1, the weight is at most1/m and the count is at most C0 log(q(m+2)). Sum C0 log(q(m+2))/m for1≤m≤ceil T; the harmonic/log-harmonic bound is O(log q log(T+2)+log²(T+2)), at most O(log²(q(T+2))). The primitive principal conductor1 case is the zeta-only count from zeta-poisson-zero-weight and the same band argument. The original conductor-uniform local proof remains unread; the summation deduction is explicit and does not license the false unweighted1/|ρ| estimate at tiny zeros.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Bennett–Siksek §12 Proposition12.2 p.387; Kedlaya Lemma10.3 p.60.

<a id="proof-zeta-poisson-zero-weight"></a>

**Uniform reciprocal-square zero weight.** There is an absolute C>0 such that for every real t, Σ_(ξ(ρ)=0)mρ/(1+(t−Imρ)²) is summable and at most C log(2+|t|), with mρ=analyticOrderNatAt ξρ.

Evaluate the corrected Hadamard log derivative at s=2+it; the right-edge zeta series is bounded and the gamma term is O(log(2+|t|)), using compact continuity to include bounded t. Write a=2−Reρ∈(1,2). Then Re(1/(2+it−ρ))=a/(a²+(t−Imρ)²)≥1/(4(1+(t−Imρ)²)). Also Re(1/ρ)>0. The real parts of finite regularized sums are nonnegative. Their convergent limit therefore bounds the weighted positive sum; the same finite-sum comparison proves summability. Fixed Re B contributes only an absolute constant. Absorb bounded t into log(2+|t|), which is always at least log2. This is the missing Exercise8.4.9 argument rather than an assumed Jensen centre bound.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Exercise8.4.9 p.52; Lemma9.4 and Exercise9.6.1 pp.54,58.

<a id="mean-square-of-a-dirichlet-polynomial-dirichlet-polynomial-mean-square"></a>

### 1.6 Mean square of a Dirichlet polynomial

For N≥1,T≥1 and complex a₁,…,a_N, ∫_{−T}^T|Σ_{n=1}^N a_n n^(−it)|²dt=2TΣ|a_n|²+O(Σn|a_n|²), with an absolute constant. The representative signature is `dirichlet_polynomial_mean_square`.

The proof proceeds as follows. Integrate the diagonal exactly. Bound the off-diagonal bilinear form by the logarithmic-frequency Hilbert inequality; the spacing at n is comparable to1/n.

The result must also satisfy these compatibility requirements: The quantitative proof and the normalization comparisons are required separately.

See [Andrew Granville, Adam J. Harper and K. Soundararajan — A new proof of Halász’s theorem, and its consequences](https://arxiv.org/pdf/1706.03749v1), §2.3 Lemma 2.6, p.11, is a specialized Λ-supported estimate; the arbitrary-coefficient Montgomery–Vaughan Hilbert-inequality theorem is a separate original-proof obligation.

*Needs:* `intervalIntegral`.

<a id="riemann-and-generalized-riemann-hypotheses-as-statements-generalized-riemann-hypothesis"></a>

### 1.7 Riemann and generalized Riemann hypotheses as statements

For a Dirichlet character χ modulo N ≥ 1, DirichletGRH χ is the proposition: for every s ∈ ℂ with Re s > 0, (χ ≠ 1 or s ≠ 1) and L(s,χ) = 0 imply Re s = 1/2, where L(s,χ) is DirichletCharacter.LFunction χ s. GRH is the proposition that DirichletGRH χ holds for every N ≥ 1 and every χ modulo N. The Riemann hypothesis is Mathlib’s RiemannHypothesis. These are statements, never assumptions of an unconditional theorem; a theorem that uses one carries it as an explicit hypothesis.

Assume N ≥ 1; χ : DirichletCharacter ℂ N.

The proof proceeds as follows. Definition. The restriction Re s > 0 removes the trivial zeros (Re s ≤ 0) and, for imprimitive χ, the zeros of the missing Euler factors 1 − χ*(p)p^{−s}, which lie on Re s = 0; the clause (χ ≠ 1 or s ≠ 1) removes the junk value at the pole of the principal character. By Mathlib’s nonvanishing on Re s ≥ 1 (DirichletCharacter.LFunction_ne_zero_of_one_le_re), only zeros in the open critical strip are constrained.

The required interface consists of the following operations and identities.

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

The result must also satisfy these compatibility requirements: The predicate is used only as a hypothesis: no result of this roadmap proves it or depends on it unconditionally.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §7.3, Conjecture 7.8, p. 45; §10.3, Conjecture 10.4 and Remark 10.5, pp. 60–61.

*Needs:* `RiemannHypothesis`; `DirichletCharacter.LFunction`; `DirichletCharacter.LFunction_ne_zero_of_one_le_re`; `riemannZeta`.

<a id="uniform-stirling-bounds-for-on-vertical-strips-uniform-complex-stirling"></a>

### 1.8 Uniform Stirling bounds for Γ on vertical strips

Fix real numbers a ≤ b. (i) As |y| → ∞, |Γ(x + iy)| = √(2π) |y|^{x−1/2} e^{−π|y|/2} (1 + o(1)) uniformly for x ∈ [a, b]. (ii) Consequently, for fixed real α, β there are C, c > 0 with c |t|^{α−β} ≤ |Γ(σ + α + it)/Γ(σ + β + it)| ≤ C |t|^{α−β} for σ ∈ [a, b] and |t| ≥ 1 (with σ + α + it and σ + β + it away from the poles), the exponential factors cancelling. (iii) A finite Gamma quotient with real affine arguments a_j s+b_j has polynomial vertical growth when its total exponential rate is nonpositive: the sum of |a_j| in the numerator is at least that in the denominator. In the balanced case these sums are equal. Constants depend on the closed real strip and all fixed shifts; bounded heights require a compact subset avoiding poles. For cubic functional equations the accompanying sine factors must be included in this rate calculation. The representative fixed-strip signature is `uniform_complex_stirling`.

Assume a ≤ b fixed; the implied constants depend on a, b, α, β.

The proof proceeds as follows. From the Stirling series for Ln Γ in |ph z| ≤ π − δ (DLMF 5.11.1) at z = x + iy, the real part of (z − 1/2) Ln z − z gives (x − 1/2) ln|y| − π|y|/2 + O(1/|y|) uniformly for bounded x; this is DLMF 5.11.9. For each argument use its vertical slope in the exponential factor exp(−π|a_j t|/2). Add numerator rates and subtract denominator rates before bounding the remaining real powers. On compact pole-free bounded-height sets use continuity; a lower bound also requires nonvanishing.

The result must also satisfy these compatibility requirements: x = 1/2: |Γ(1/2 + iy)| = (π / cosh(π y))^{1/2}, whose asymptotic is √(2π) e^{−π|y|/2}, matching (i). For s=1/2+it and α,β∈{0,1}, apply (i) separately to the two half-argument numerator factors and the denominator. Their exponential terms cancel and their net power is (α+β−1)/2≤1/2, giving |Γ((s+α)/2)Γ((s+β)/2)/Γ(s)|≪|s|^(1/2). Bounded heights are handled by continuity; no factor has a pole on this line. Negative control: 1/Γ(1+it) grows exponentially like exp(π|t|/2)/sqrt(2π|t|), and is not polynomially bounded. Γ(1+it)/Γ(2+it)=1/(1+it) is balanced and decays like |t|^(−1).

See [F. W. J. Olver, A. B. Olde Daalhuis, D. W. Lozier et al. (eds.); Chapter 5 by R. A. Askey and R. Roy — NIST Digital Library of Mathematical Functions, §5.11 Gamma function: asymptotic expansions](https://dlmf.nist.gov/5.11), §5.11(i), equations (5.11.1) and (5.11.9).

*Needs:* `Complex.Gamma`.

<a id="truncated-von-mangoldt-formula-von-mangoldt-explicit-formula-and-pnt-error"></a>

### 1.9 Truncated von Mangoldt formula

For x≥2 and T≥2, let ψ₀(x)=∑_{1≤n<x}Λ(n)+(1/2)∑_{1≤n=x}Λ(n), and let d(x)>0 be the distance to the nearest prime power other than x. There is an absolute C such that ψ₀(x)−x=−∑_{ρ:0≤Reρ≤1, |Imρ|<T}x^ρ/ρ−ζ′(0)/ζ(0)−(1/2)log(1−x⁻²)+R(x,T), with zeros counted with analytic multiplicity and |R(x,T)|≤C[x log²(xT)/T+(log x)min(1,x/(T d(x)))]. Powers of positive x use exp(ρ log x). The PNT-error corollary associated with this formula is a separate theorem.

Assume x≥2; T≥2; zeros counted with multiplicity; symmetric strict height cutoff; half-weight at a prime-power endpoint.

The proof proceeds as follows. Apply the ADS truncated arithmetic Perron formula to the half-weight ψ₀. Shift the contour using the residue lemma, horizontal bound and left-contour limit. Adjust from a good height to the stated strict cutoff with multiplicity-weighted local zero counting; include the nearest-prime-power error.

The result must also satisfy these compatibility requirements: At a prime power m, ψ₀(m)=Chebyshev.psi(m)−Λ(m)/2; at x=2 the value is (log2)/2, not log2. Multiplicity cannot be replaced by a set of distinct zeros. At a zero height T, a strict cutoff must agree with the height-adjustment error, not silently switch to ≤. The s=0 residue uses ζ(0), and each trivial-zero residue carries the minus sign; Kedlaya Lemma9.2 has a trivial-zero sign error and a missing logarithmic-derivative denominator, while the target retains the corrected formula.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Definition7.1/Theorem7.2, printed pp.43–44; Theorem9.9 final assembly, pp.56–58.

*Needs:* [Finite zero multiset](#finite-zero-multiset-zeta-zero-multiset); `Complex.digamma`; `Complex.Gamma_ne_zero_of_re_pos`; [Pole-cancelled Riemann xi](#pole-cancelled-riemann-xi-riemann-xi); `HurwitzZeta.evenKernel`; `HurwitzZeta.hasSum_int_evenKernel`; `HurwitzZeta.hurwitzEvenFEPair`; `HurwitzZeta.completedHurwitzZetaEven₀`; `WeakFEPair.f_modif`; `WeakFEPair.Λ₀`; `mellin`; `Real.GammaIntegral_convergent`; `Real.Gamma_eq_integral`; `Real.Gamma_nat_eq_factorial`; `Nat.factorial_le_pow`; [Entire order at most ρ](#entire-order-at-most-entire-order-at-most); `differentiable_completedZeta₀`; `TendstoLocallyUniformlyOn.deriv`; [Hadamard factorization in order at most one](#hadamard-factorization-in-order-at-most-one-order-one-hadamard); `AnalyticOnNhd.sum_divisor_le`; `AnalyticAt.analyticOrderAt_eq_natCast`; `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`; `AnalyticAt.analyticOrderAt_ne_top`; `AnalyticOnNhd.eqOn_zero_or_eventually_ne_zero_of_preconnected`; `IsCompact.finite_sdiff_of_mem_codiscreteWithin`; [Genus-one canonical factor](#genus-one-canonical-factor-genus-one-factor); `Complex.norm_log_one_add_sub_self_le`; `Complex.hasSum_taylorSeries_neg_log`; `analyticAt_clog`; `logDeriv_tprod_eq_tsum`; `riemannZeta_eq_completedRiemannZeta₀`; `Complex.Gamma_ne_zero`; `ArithmeticFunction.LSeriesSummable_vonMangoldt`; `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`; `ArithmeticFunction.vonMangoldt_nonneg`; `riemannZeta_ne_zero_of_one_le_re`; `Complex.differentiableAt_Gamma`; `riemannZeta_one_sub`; `analyticOrderNatAt`; `riemannZeta_eq_mul_completedRiemannZeta₀`; `riemannZeta_residue_one`; `Completed/ContourIntegration#layer-4-the-hungerbühlerwasem-generalized-residue-theorem-hw-theorem-33`; [ArithmeticDirichletSeries layer 6 abel and perron summation](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation); `Complex.digamma_apply_add_one`; [Isolate the origin zero](#proof-origin-zero-factor); [Multiplicity count of compact zeros](#proof-compact-zero-count); [Zero count from an order bound](#proof-jensen-growth-zero-count); [Summable reciprocal squares of zeros](#proof-dyadic-zero-reciprocal-square); [Small canonical-factor logarithm](#proof-canonical-factor-log-tail); [Logarithmic derivative of the canonical product](#proof-canonical-product-log-derivative); [Exponential decay of the theta tail](#proof-theta-tail-decay); [Entire integral representation of xi](#proof-xi-integral-comparison); [Growth bound for the theta integral](#proof-gamma-integral-growth-majorant); [Order-one growth of xi](#proof-xi-order-one-growth); [Corrected logarithmic derivative of zeta](#proof-zeta-hadamard-log-derivative); [Logarithmic gamma bound](#proof-digamma-right-half-plane); [Bounded right-edge logarithmic derivative](#proof-zeta-log-derivative-right); [Pole term near one](#proof-zeta-pole-log-derivative); [Local zero count](#proof-zeta-unit-height-zero-count); [Choosing a contour height](#proof-good-height-selection); [Local logarithmic-derivative expansion](#proof-zeta-local-log-derivative); [Left-half-plane bound away from trivial zeros](#proof-zeta-left-log-derivative); [Residues of the Perron integrand](#proof-explicit-formula-residues); [Nearest-prime-power remainder](#proof-perron-nearest-prime-power-error); [Horizontal contour bound](#proof-explicit-formula-horizontal-bound); [Left contour limit](#proof-explicit-formula-left-contour); [Xi is entire with nonzero endpoints](#proof-xi-entire-and-endpoints); [Every xi zero lies in the open critical strip](#proof-xi-zero-critical-strip); [Uniform reciprocal-square zero weight](#proof-zeta-poisson-zero-weight); [Trivial zeta zeros are simple](#proof-zeta-trivial-zero-simple).

<a id="proof-zeta-unit-height-zero-count"></a>

**Local zero count.** There is an absolute C>0 such that for every real T≥2, the number of nontrivial zeta-zero occurrences with T≤Imρ≤T+1 is at most C log(T+2).

Invoke zeta-poisson-zero-weight at t=T. Every zero in the closed unit interval has reciprocal-square weight≥1/2. The xi/zeta API identifies analytic multiplicities inside the open critical strip; sum the finite nonnegative inequality. For T≥2, log(T+2) is comparable to log T. This avoids the previously unverified shifted-Jensen centre lower bound and disk-growth estimate.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Lemma9.4 p.54 and Exercise9.6.1 p.58, via Exercise8.4.9 p.52.

<a id="proof-good-height-selection"></a>

**Choosing a contour height.** There are absolute c,C>0 such that for every T≥2 there is T′∈[T,T+1] with |T′−Imρ|≥c/log(T+2) for every ξ zeroρ. For x≥2, changing the symmetric strict cutoff from T to T′ changes Σmρ x^ρ/ρ by at most C x log(T+2)/T; arbitrary weights require their own uniform band bound.

Choose c small enough that h=c/log(T+2)≤1/4. Only ordinates in[T−1,T+2] can have excluded h-neighbourhoods meeting[T,T+1]. Cover this enlarged band by a fixed number of unit intervals; the positive-weight bound gives one C0 log(T+2) count, with multiplicity and bounded T included. The total lengths of excluded closed intervals are at most2h C0 log(T+2). Choose c with this strictly less than1; finite interval subadditivity gives a point in[T,T+1] outside every interval. Conjugation gives separation at−T′ too. Changed zero occurrences lie in the two unit bands; each |x^ρ/ρ|≤x/T. Add their finite count bound. No assertion is made for unbounded arbitrary weights.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Remark9.3 p.54 and Theorem9.9 height adjustment p.57.

<a id="proof-zeta-local-log-derivative"></a>

**Local logarithmic-derivative expansion.** There is an absolute C>0 such that for −1≤σ≤2,|t|≥2, and σ+it not a nontrivial zero, ζ′/ζ(σ+it)=Σ_(|t−Imρ|<1)mρ/(σ+it−ρ)+E(σ,t), with |E(σ,t)|≤C log(2+|t|). It also holds at a zero ordinate if the evaluation point itself is not a zero.

Subtract the corrected Hadamard formulas at s=σ+it and s0=2+it; the1/ρ corrections and B cancel. Use digamma(z+1)=digamma(z)+1/z to move s/2 to1+s/2, whose real part is at least1/2. The gamma and elementary rational differences are O(log(2+|t|)); gamma poles and s=0,1 are absent because |t|≥2. For |t−Imρ|≥1, the reciprocal difference is bounded in norm by3/|t−Imρ|²≤6/(1+(t−Imρ)²). The positive-weight lemma controls the entire tail, without an unproved separate annulus summation. For |t−Imρ|<1, subtracting the s0 reciprocal costs at most1 per zero occurrence, because2−Reρ>1. Bound this local count with the same weight lemma; the right-edge series controls ζ′/ζ(s0).

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Lemma9.6 pp.55–56 and Exercise9.6.2 p.58.

<a id="proof-zeta-left-log-derivative"></a>

**Left-half-plane bound away from trivial zeros.** For every fixed c>0 there is C_c>0 such that for every complex w with Re w≤−1 and |w+2n|≥c for every integer n≥1, ζ(w)≠0 and |ζ′(w)/ζ(w)|≤C_c log(2+|w|).

Set s=1−w, so Re s≥2. Import riemannZeta_one_sub, already in the2(2π)^(-s)Gamma(s)cos(πs/2)zeta(s) form; no separate duplication/reflection construction is needed. All factors are nonzero off the odd positive s integers, precisely the excluded negative-even w points. Differentiate the identity and divide on this regular domain. The exponential factors contribute constants; digamma(s) is O(log(2+|s|)) and the right-edge logarithmic zeta derivative is uniformly bounded. The tangent factor is uniformly O_c(1): for large |Im s| use its exponential quotient; for bounded imaginary part use periodicity on a compact real strip avoiding cosine zeros by c. Bounded |s| is absorbed by compact continuity.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Lemma9.8 p.56; full functional equation.

<a id="proof-explicit-formula-residues"></a>

**Residues of the Perron integrand.** For x>1, the integrand −(ζ′/ζ)(s)x^s/s has residue x at1, −m_ρx^ρ/ρ at a nontrivial zeroρ, x^(−2n)/(2n) at−2n, and −ζ′(0)/ζ(0) at0. Summing the trivial zeros gives −(1/2)log(1−x^−2).

At a nontrivial zeroρ of order mρ, write ζ(s)=(s−ρ)^mρ g(s), with analytic nonzero g; then −ζ′/ζ has residue−mρ. Multiplication by x^s/s evaluates the regular factor x^ρ/ρ. At1 use the nonzero pole-cleared germ from zeta-pole-log-derivative; its logarithmic derivative gives the opposite residue+1, hence residue x. Use zeta-trivial-zero-simple to obtain order1 at−2n, rather than merely importing a zero-value theorem. Its integrand residue is x^(−2n)/(2n). At0, ζ(0)=−1/2 and zeta is analytic; only1/s contributes the residue−ζ′(0)/ζ(0). Sum the positive trivial-zero series using the convergent−log(1−u) Taylor series at u=x^−2∈(0,1). Consume the completed ContourIntegration cycle residue theorem and current Tau Ceti classicalResidueTheorem_nullHomologous. Match the finite rectangle, winding numbers and local Laurent residues to its hypotheses; the zeta-specific adapter remains a gap, without re-planning the general theorem.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §9.2 Lemma9.2 p.54, proof omitted; local analytic-order factorization.

<a id="proof-perron-nearest-prime-power-error"></a>

**Nearest-prime-power remainder.** For real x≥2,T≥2,c=1+1/log x, put δ(x)=infDist(x,{m∈ℝ:m is a natural prime power and m≠x})>0. The Perron remainder for ψ₀(x), after retaining the exact endpoint kernel, is bounded by C[x log²(xT)/T+(log x)min(1,x/(Tδ(x)))], with one absolute C. A prime-power endpoint has half weight only in the infinite-height limit.

Prime powers are a nonempty locally finite subset of the positive integers. After excluding x, their distance has a positive attained minimum. The endpoint m=x is treated separately. Use ADS6’s exact finite kernel. At y=1 its value is arctan(T/c)/π, and its difference from1/2 is O(c/T), contributing O(log x/T) here. For |m/x−1|≥1/4, use the absolutely convergent Λ series and −ζ′(c)/ζ(c)=O(log x). The near-one pole estimate applies for sufficiently large x; for remaining x use positivity/summability at a fixed c>1 and compact absorption. On each of the two intervals3x/4<m<x and x<m<5x/4, isolate the closest prime power. Its contribution is at most C log x min(1,x/(Tδ(x))). For all other m in that interval use integer spacing, |log(m/x)|≥C|m−x|/x, Λ(m)≤log m and the positive harmonic sum. This contributes O(x log²x/T). The actual nearest-prime-power term remains unabsorbed. Match the infDist/local-finiteness and finite-height kernel constants rather than assuming the formal infinite Perron identity can be summed absolutely.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Lemma9.5 p.55; full Theorem9.9 proof pp.57–58; ADS6 endpoint contract.

<a id="proof-explicit-formula-horizontal-bound"></a>

**Horizontal contour bound.** For x≥2, c=1+1/log x and a height T′≥2 separated from every ξ-zero ordinate by at least c₀/log(T′+2), the two horizontal Perron integrals from Re s=−1 to c have norm at most C_(c₀) x log²(T′+2)/(T′log x).

On−1≤σ≤min(2,c), the local expansion, unit count and height separation bound |ζ′/ζ(σ±iT′)| by C_(c0)log²(T′+2). If2<c, use the bounded right-edge series on the additional interval[2,c]. This case occurs for2≤x<e and was not covered by the previous local-expansion prerequisite alone. On the entire segment |s|≥T′ and ∫_(−1)^c x^σ dσ=(x^c−x^−1)/log x≤e x/log x. Multiply the bounds and sum the two integrals. For a good height from the selection lemma, c0 is fixed absolute, making C absolute.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem9.9 proof, horizontal segments p.57.

<a id="proof-explicit-formula-left-contour"></a>

**Left contour limit.** For every fixed x≥2,T≥2, the Perron vertical integral at Re s=−U tends to0 as U→∞ through positive odd integers. Uniformly in x,T, the two horizontal tails Re s≤−1 have norm O(log(T+2)/(Tx log x)+1/(Tx(log x)²)), with an absolute constant.

For odd U, every point on the vertical segment remains distance≥1 from all negative-even trivial zeros. The left logarithmic-derivative bound gives norm at most C T log(2+U+T)/(U x^U), which tends to0 with x,T fixed. On the two horizontal tails, |s|≥T and distance to every real trivial zero≥T≥2, so the same left bound has one absolute constant. Use log(2+u+T)≤log(T+2)+u for u≥1, and integrate x^(−u) and u x^(−u) from1 to∞. Their exact values give the two displayed tail terms after absorbing1/log x in the log(T+2) term. The limit is U→∞, correcting the source’s printed U→0 slip. No uniform limit over growing T is asserted.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem9.9 proof, remaining segments p.57.

<a id="proof-zeta-trivial-zero-simple"></a>

**Trivial zeta zeros are simple.** For every natural n≥1, analyticOrderNatAt riemannZeta(−2n)=1.

Apply riemannZeta_one_sub at s=1+2n, which lies in the zero-free right half-plane. The factors2,(2π)^(-s),Gamma(s),zeta(s) are analytic and nonzero near that point. cos(πs/2) has a simple zero at the odd integer, with nonzero sine derivative. The change of variable s↦1−s has nonzero derivative, so the analytic order at−2n is1. No claim about a totalized gamma pole is used.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Remark5.2 p.35; Lemma9.2 p.54, trivial-zero residues.

<a id="selberg-zero-density-input-selberg-zero-density"></a>

### 1.10 Selberg zero-density input

For epsilon>0, Q>=2, T>=2, and 1/2<=sigma<=1, sum_{q<=Q} sum_{chi primitive mod q} N(sigma,T,chi) <<_epsilon (Q^(5+epsilon)*T^(3+epsilon))^(1-sigma), with effective constants with the right-hand side enlarged by +1, so the count includes the exceptional zero.

The proof proceeds as follows. Use the primitive-character counting function and the stated effective density theorem. Include +1 if the original theorem excludes the exceptional zero; the chosen target below always includes it.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), §12 proof of Proposition 12.1, p. 386; Bombieri §5 remark after Theorem 14, p.40.

*Needs:* [Mean square of a Dirichlet polynomial](#mean-square-of-a-dirichlet-polynomial-dirichlet-polynomial-mean-square); `DirichletCharacter.LFunction`.

<a id="critical-line-gamma-quotient-critical-line-gamma-quotient"></a>

### 1.11 Critical-line gamma quotient

For s=1/2+it, t real and α,β∈{0,1}, |Γ((s+α)/2)Γ((s+β)/2)/Γ(s)|≤C|s|^(1/2), with one absolute C.

The proof proceeds as follows. Apply the uniform complex Stirling estimate on the three gamma factors, with bounded-height continuity separately. The exponential factors cancel on s=1/2+it; the remaining power is bounded by |s|^(1/2).

See [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Proof of Proposition 2, p.969 ('standard estimates for the gamma function quotient and for ζ(2s)'); [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Proof of Proposition2, printed p.969, sentence preceding (6.7).

*Needs:* `Complex.Gamma`; [Uniform Stirling bounds for Γ on vertical strips](#uniform-stirling-bounds-for-on-vertical-strips-uniform-complex-stirling).

<a id="weil-s-explicit-formula-mestre-s-formalism-mestre-weil-explicit-formula"></a>

### 1.12 Weil's explicit formula (Mestre's formalism)

Let A, B > 0, a_i, a′_i ≥ 0 (1 ≤ i ≤ M) with Σ a_i = Σ a′_i, b_i, b′_i ∈ C with non-negative real parts, and Λ_1, Λ_2 meromorphic on C with (i) Λ_1(1 − s) = wΛ_2(s) for some w ∈ C^×; (ii) finitely many poles; (iii) Λ_i minus its singular parts bounded in every vertical strip of finite width; (iv) for some c ≥ 0 and Re s > 1 + c, Λ_1(s) = A^s Π_{i=1}^M Γ(a_i s + b_i) Π_p Π_{i=1}^{M′} (1 − α_i(p)p^{−s})^{−1} and Λ_2(s) = B^s Π_{i=1}^M Γ(a′_i s + b′_i) Π_p Π_{i=1}^{M′} (1 − β_i(p)p^{−s})^{−1} with |α_i(p)|, |β_i(p)| ≤ p^c. Let F satisfy weil_test_function(c,F). For every zero gamma slope a_i=0 (respectively a′_i=0), assume b_i≠0 (respectively b′_i≠0), so its constant gamma factor is finite and nonzero. Then Σ_ρ Φ(ρ) − Σ_μ Φ(μ) + Σ_{i=1}^M I(a_i, b_i) + Σ_{i=1}^M J(a′_i, b′_i) = F(0) log(AB) − Σ_{p,i,k≥1} (α_i(p)^k F(k log p) + β_i(p)^k F(−k log p)) log p / p^{k/2}, where ρ (resp. μ) runs over the zeros (resp. poles) of Λ_1 with −c ≤ Re ≤ 1 + c, with multiplicity, Σ_ρ Φ(ρ) = lim_{T→∞} Σ_{|Im ρ|<T} Φ(ρ), Φ(s) = ∫_R F(x) e^{(s−1/2)x} dx, I(a, b) = a ∫_0^∞ (F(ax) e^{−(a/2+b)x}/(1 − e^{−x}) − F(0) e^{−x}/x) dx and J(a, b) is the same with F(−ax). For a>0 the displayed I,J are ordinary convergent combined integrals (do not integrate the two individually divergent subtraction terms separately). For a=0 set I(0,b)=J(0,b)=0 after removing its constant gamma factor; this is not0 times an undefined integral.

The proof proceeds as follows. Remove finite nonzero constant gamma factors (zero slopes); their logarithmic derivatives are0 and rescaling the dual functions changes only w. Preserve A,B and the equal positive gamma-slope sums. Use pole-clearing and vertical-strip bounds to obtain polynomial strip growth, locally finite zeros and safe heights with a logarithmic-derivative bound. The needed general strip may be wider than the −1<σ<2 printed in Remark1.1.3. Integrate Φ_F(s)Λ′_1(s)/Λ_1(s) on a rectangle and count orders of zeros/poles. The functional equation converts the left edge to the reflected F term; symmetric-tail hypotheses justify both edges. Fourier inversion yields each prime-power term. For a>0 the combined gamma integral uses Lemma1.2.1 and the Poitou pairing Lemma1.2.2; near0 use the bounded difference quotient for cancellation before integrating. Pass to the symmetric zero-sum limit with the exact multiplicities. The original Poitou/good-height/uniform Fourier-limit inputs are recorded gaps, not routine algebra.

The result must also satisfy these compatibility requirements: For F=0 every term vanishes. For the completed Riemann zeta take c=0, a=a′=1/2, b=b′=0, A=B=π^(−1/2), α=β=1. Its two pole terms are Φ_F(0)+Φ_F(1), and the prime side has both ±k log p contributions. Adding a finite nonzero constant gamma factor with slope0 changes no explicit-formula term; a zero-slope Γ(0) is excluded. The asymmetric F in test weil_test_function.asymmetric_tail is excluded: Φ_F(0) in the Riemann pole term would diverge under the printed one-signed conditions.

See [Jean-François Mestre — Formules explicites et minorations de conducteurs de variétés algébriques](https://www.numdam.org/item/CM_1986__58_2_209_0.pdf), §I.1–I.2, pp.211–215; Remark1.1.3, Lemmas1.2.1–1.2.2; [Gaëtan Chenevier, Olivier Taïbi — Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf), §2.3 pp.275–276, (2.3.5).

*Needs:* [Admissible Weil test function](#admissible-weil-test-function-weil-test-function); `Completed/ContourIntegration#layer-4-the-hungerbühlerwasem-generalized-residue-theorem-hw-theorem-33`.

<a id="riemann-von-mangoldt-zero-count-riemann-von-mangoldt-count"></a>

### 1.13 Riemann–von Mangoldt zero count

There is an absolute C>0 such that for every real T≥2, N(T)=#{ξ-zero occurrencesρ:0<Imρ≤T} satisfies |N(T)−[(T/(2π))log(T/(2π))−T/(2π)]|≤C log(T+2).

The proof proceeds as follows. Use current TauCeti.Contour.argumentPrinciple_nullHomologous from completed ContourIntegration on a zero-avoiding rectangle symmetric about the real axis. Match its finite singularity set, null-homology and analytic-order/winding conventions; xi endpoint/strip and conjugation APIs specify the multiplicities. Choose and track continuous argument branches for the gamma, polynomial and zeta factors; the leading gamma phase requires the full complex Stirling remainder, beyond a norm bound for digamma. Bound the change of zeta argument by O(log T), with a separate Jensen/real-part-zero argument. A local zero count alone does not prove that phase bound. Read the original Davenport§15 phase argument cited by Remark9.7 or an equivalent public proof. Import the completed general argument principle; only the rectangle/order adapter and zeta/gamma phase estimates remain AN inputs. The source uses0<Imρ<T; passing to the inclusive cutoff changes the count by at most the unit-height O(log(T+2)) bound.

The result must also satisfy these compatibility requirements: N counts only positive ordinates, not both signs. The strict source cutoff and inclusive target differ by a controlled endpoint multiplicity.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Remark9.7 p.56, citing Davenport§15; original phase proof still required.

*Needs:* [Pole-cancelled Riemann xi](#pole-cancelled-riemann-xi-riemann-xi); [Finite zero multiset](#finite-zero-multiset-zeta-zero-multiset); `Complex.digamma`; `Complex.Gamma_ne_zero_of_re_pos`; `HurwitzZeta.evenKernel`; `HurwitzZeta.hasSum_int_evenKernel`; `HurwitzZeta.hurwitzEvenFEPair`; `HurwitzZeta.completedHurwitzZetaEven₀`; `WeakFEPair.f_modif`; `WeakFEPair.Λ₀`; `mellin`; `Real.GammaIntegral_convergent`; `Real.Gamma_eq_integral`; `Real.Gamma_nat_eq_factorial`; `Nat.factorial_le_pow`; [Entire order at most ρ](#entire-order-at-most-entire-order-at-most); `differentiable_completedZeta₀`; `TendstoLocallyUniformlyOn.deriv`; [Hadamard factorization in order at most one](#hadamard-factorization-in-order-at-most-one-order-one-hadamard); `AnalyticOnNhd.sum_divisor_le`; `AnalyticAt.analyticOrderAt_eq_natCast`; `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`; `AnalyticAt.analyticOrderAt_ne_top`; `AnalyticOnNhd.eqOn_zero_or_eventually_ne_zero_of_preconnected`; `IsCompact.finite_sdiff_of_mem_codiscreteWithin`; [Genus-one canonical factor](#genus-one-canonical-factor-genus-one-factor); `Complex.norm_log_one_add_sub_self_le`; `Complex.hasSum_taylorSeries_neg_log`; `analyticAt_clog`; `logDeriv_tprod_eq_tsum`; `riemannZeta_eq_completedRiemannZeta₀`; `Complex.Gamma_ne_zero`; `ArithmeticFunction.LSeriesSummable_vonMangoldt`; `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`; `ArithmeticFunction.vonMangoldt_nonneg`; `riemannZeta_ne_zero_of_one_le_re`; `Complex.differentiableAt_Gamma`; `Completed/ContourIntegration#layer-4-the-hungerbühlerwasem-generalized-residue-theorem-hw-theorem-33`; [Isolate the origin zero](#proof-origin-zero-factor); [Multiplicity count of compact zeros](#proof-compact-zero-count); [Zero count from an order bound](#proof-jensen-growth-zero-count); [Summable reciprocal squares of zeros](#proof-dyadic-zero-reciprocal-square); [Small canonical-factor logarithm](#proof-canonical-factor-log-tail); [Logarithmic derivative of the canonical product](#proof-canonical-product-log-derivative); [Exponential decay of the theta tail](#proof-theta-tail-decay); [Entire integral representation of xi](#proof-xi-integral-comparison); [Growth bound for the theta integral](#proof-gamma-integral-growth-majorant); [Order-one growth of xi](#proof-xi-order-one-growth); [Corrected logarithmic derivative of zeta](#proof-zeta-hadamard-log-derivative); [Logarithmic gamma bound](#proof-digamma-right-half-plane); [Bounded right-edge logarithmic derivative](#proof-zeta-log-derivative-right); [Local zero count](#proof-zeta-unit-height-zero-count); [Xi is entire with nonzero endpoints](#proof-xi-entire-and-endpoints); [Every xi zero lies in the open critical strip](#proof-xi-zero-critical-strip); [Uniform reciprocal-square zero weight](#proof-zeta-poisson-zero-weight).

<a id="classical-pnt-remainder-rational-pnt-error"></a>

### 1.14 Classical PNT remainder

There are absolute effective c,C>0 such that |ψ(x)−x|≤C x exp(−c√log x) for all sufficiently large x; ψ is the inclusive function. The representative ψ error is `abs_psi_sub_self_le`.

The proof proceeds as follows. Use the truncated ψ₀ formula with analytic multiplicities, conjugation of Riemann zeros and the high positive-height zero-free region. For |Imρ|≥t₀ this gives β≤1−c/log|Imρ|. The low-height critical zeros form a finite multiset. Library line-one nonvanishing and nonzero xi endpoints give a positive margin δ from β=1 and nonzero ρ; sum their finitely many |1/ρ| separately, never dividing by Imρ=0. For high zeros the dyadic zero-weight bound gives O(log²T); hence their sum is O(x exp(−c log x/log T) log²T). Choose T=exp(a sqrt(log x)) for one fixed a>0. The Perron endpoint/nearest-prime-power term is at most log x; absorb this, the finite low-zero O(x^(1−δ)) and powers of log x into a weaker exp(−c′sqrt(log x)) bound. Effectivity of the compact margin/constants remains an explicit gap.

The result must also satisfy these compatibility requirements: Inclusive ψ and half-weight ψ₀ differ by at most (1/2)log x, already absorbed. Real zeros, if treated before excluding them, are in the finite low-height sum and never divided by ordinate0.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §7.2 Theorem7.7 and its proof, printed p.45; ψ endpoint convention §7.1 p.43.

*Needs:* [Truncated von Mangoldt formula](#truncated-von-mangoldt-formula-von-mangoldt-explicit-formula-and-pnt-error); [Classical high-height zero-free region](#classical-high-height-zero-free-region-classical-zero-free-region); `DirichletCharacter.differentiable_completedLFunction`; `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`; [Pole-cancelled Riemann xi](#pole-cancelled-riemann-xi-riemann-xi); `HurwitzZeta.evenKernel`; `HurwitzZeta.hasSum_int_evenKernel`; `HurwitzZeta.hurwitzEvenFEPair`; `HurwitzZeta.completedHurwitzZetaEven₀`; `WeakFEPair.f_modif`; `WeakFEPair.Λ₀`; `mellin`; `Real.GammaIntegral_convergent`; `Real.Gamma_eq_integral`; `Real.Gamma_nat_eq_factorial`; `Nat.factorial_le_pow`; [Entire order at most ρ](#entire-order-at-most-entire-order-at-most); `differentiable_completedZeta₀`; `TendstoLocallyUniformlyOn.deriv`; [Hadamard factorization in order at most one](#hadamard-factorization-in-order-at-most-one-order-one-hadamard); `AnalyticOnNhd.sum_divisor_le`; `AnalyticAt.analyticOrderAt_eq_natCast`; `AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`; `AnalyticAt.analyticOrderAt_ne_top`; `AnalyticOnNhd.eqOn_zero_or_eventually_ne_zero_of_preconnected`; `IsCompact.finite_sdiff_of_mem_codiscreteWithin`; [Genus-one canonical factor](#genus-one-canonical-factor-genus-one-factor); `Complex.norm_log_one_add_sub_self_le`; `Complex.hasSum_taylorSeries_neg_log`; `analyticAt_clog`; `logDeriv_tprod_eq_tsum`; `riemannZeta_eq_completedRiemannZeta₀`; `Complex.Gamma_ne_zero`; `ArithmeticFunction.LSeriesSummable_vonMangoldt`; `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`; `ArithmeticFunction.vonMangoldt_nonneg`; `Complex.digamma`; `Complex.Gamma_ne_zero_of_re_pos`; `riemannZeta_ne_zero_of_one_le_re`; `Complex.differentiableAt_Gamma`; [Isolate the origin zero](#proof-origin-zero-factor); [Multiplicity count of compact zeros](#proof-compact-zero-count); [Zero count from an order bound](#proof-jensen-growth-zero-count); [Summable reciprocal squares of zeros](#proof-dyadic-zero-reciprocal-square); [Small canonical-factor logarithm](#proof-canonical-factor-log-tail); [Logarithmic derivative of the canonical product](#proof-canonical-product-log-derivative); [Exponential decay of the theta tail](#proof-theta-tail-decay); [Entire integral representation of xi](#proof-xi-integral-comparison); [Growth bound for the theta integral](#proof-gamma-integral-growth-majorant); [Order-one growth of xi](#proof-xi-order-one-growth); [Corrected logarithmic derivative of zeta](#proof-zeta-hadamard-log-derivative); [Logarithmic gamma bound](#proof-digamma-right-half-plane); [Bounded right-edge logarithmic derivative](#proof-zeta-log-derivative-right); [Logarithmic-square sum of zero weights](#proof-zero-weight-sum); [Xi is entire with nonzero endpoints](#proof-xi-entire-and-endpoints); [Every xi zero lies in the open critical strip](#proof-xi-zero-critical-strip); [Uniform reciprocal-square zero weight](#proof-zeta-poisson-zero-weight); [Conductor-uniform local Dirichlet zero count](#proof-primitive-character-unit-height-zero-count).

<a id="prime-error-terms-under-rh-and-grh-conditional-prime-error-terms"></a>

### 1.15 Prime error terms under RH and GRH

(i) If RiemannHypothesis holds, then for every ε > 0, ψ(x) − x = O_ε(x^{1/2+ε}) as x → ∞. (ii) Fix q ≥ 1. If DirichletGRH χ holds for every character χ modulo q, then for every ε > 0 and every a with gcd(a,q) = 1, ψ(x;a,q) − x/φ(q) = O_{q,ε}(x^{1/2+ε}), where ψ(x;a,q) = Σ_{n≤x, n≡a mod q} Λ(n). The hypotheses are explicit; neither conclusion is used by an unconditional target. The fixed-modulus representative signatures are `psi_sub_self_isBigO_of_riemannHypothesis` and `psiAP_isBigO_of_dirichletGRH`.

Assume (i): RiemannHypothesis.; (ii): DirichletGRH χ for every χ modulo q; gcd(a,q) = 1.

The proof proceeds as follows. (i) Insert Re ρ = 1/2 into the truncated explicit formula of this layer, bound Σ_{|γ|<T} 1/|ρ| by O(log² T) using the Riemann–von Mangoldt count, and take T = x. (ii) Expand ψ(x;a,q) by orthogonality of characters modulo q into φ(q)^{−1} Σ_χ χ̄(a) ψ(x,χ); the principal character gives ψ(x) up to O(log q · log x), and each nonprincipal χ is handled by the explicit formula for ψ(x,χ) (character-half-interval explicit formula of this layer) with its zeros on Re s = 1/2.

The result must also satisfy these compatibility requirements: The hypothesis appears in the statement; dropping it leaves only the de la Vallée Poussin error of Layer 0. (ii) fixes q: the implied constant may depend on q, and no Bombieri–Vinogradov-type average is claimed (that is SieveMethodsAndPrimePatterns:SV.3).

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §7.3, equation (7.3.1), p. 46; §10.3, equation (10.3.1), p. 61.

*Needs:* [Riemann and generalized Riemann hypotheses as statements](#riemann-and-generalized-riemann-hypotheses-as-statements-generalized-riemann-hypothesis); [Truncated von Mangoldt formula](#truncated-von-mangoldt-formula-von-mangoldt-explicit-formula-and-pnt-error); [Riemann–von Mangoldt zero count](#riemann-von-mangoldt-zero-count-riemann-von-mangoldt-count); [Half-interval explicit formula and low-zero-safe bound](#half-interval-explicit-formula-and-low-zero-safe-bound-character-half-interval-formula); `Chebyshev.psi`; `DirichletCharacter.sum_char_inv_mul_char_eq`.

### Remaining analytic proof obligations

**Explicit-formula analytic adapters.** Match multiplicity-indexed positive weighted zero sums, the tangent bound away from its poles, local Laurent residues, rectangle winding numbers and the exact finite Perron interchange. The nearest-other-prime-power distance needs its positive attained minimum. Include the right-edge segment c>2 when 2≤x<e. General contour residue theory is a boundary input. Used in [Riemann–von Mangoldt zero count](#riemann-von-mangoldt-zero-count-riemann-von-mangoldt-count); [Truncated von Mangoldt formula](#truncated-von-mangoldt-formula-von-mangoldt-explicit-formula-and-pnt-error).

**Argument principle and zero-count phase.** The sharp zero-count remainder requires continuous argument branches, the full Gamma phase and a bounded zeta argument on safe rectangles. A unit-height count and a digamma norm bound alone do not supply that phase asymptotic. Import the general argument principle and prove the rectangle adapter. Used in [Riemann–von Mangoldt zero count](#riemann-von-mangoldt-zero-count-riemann-von-mangoldt-count).

**PNT boundary adapters and quantitative remainder.** The quantitative rational remainder requires the continuous pole-cleared germ and a finite multiplicity-weighted compact zero separation, followed by explicit height optimization. The qualitative prime theorem is a boundary input and cannot supply this error or effective constants. Used in [Classical PNT remainder](#classical-pnt-remainder-rational-pnt-error).

**Dirichlet-polynomial Hilbert inequality.** Supply the Montgomery–Vaughan Hilbert inequality with logarithmic-frequency spacing. A specialized Λ-supported polynomial estimate cannot replace its arbitrary-coefficient statement. Used in [Mean square of a Dirichlet polynomial](#mean-square-of-a-dirichlet-polynomial-dirichlet-polynomial-mean-square).

**Gamma and inverse-zeta quantitative bounds.** Prove uniform complex Stirling with bounded-height control and explicit exponential-rate balance before claiming polynomial growth. The reciprocal-zeta line-one bound needs its own quantitative proof and compact-height argument; pole-cleared continuity near 1 is a different input. Used in [Critical-line gamma quotient](#critical-line-gamma-quotient-critical-line-gamma-quotient); [Reciprocal zeta on the line one](#reciprocal-zeta-on-the-line-one-reciprocal-zeta-line-one).

**Möbius and multiplicative-mean uniformity.** Prove both coprime Möbius estimates uniformly for q≤T^4. The shifted q≤sqrt(T) estimate uses U=T/q and one additional logarithmic saving. The long-divisor/bilinear Fourier argument must prove positive truncation cancellation; the separate zero term comes from ordinary Möbius cancellation and Abel summation. Used in [Davenport uniform Möbius exponential cancellation](#davenport-uniform-m-bius-exponential-cancellation-davenport-mobius-cancellation); [Coprime Möbius sums from the prime number theorem ((3.6))](#coprime-m-bius-sums-from-the-prime-number-theorem-3-6-coprime-mobius-log-sum); [Shifted coprime Möbius sum](#shifted-coprime-m-bius-sum-shifted-coprime-mobius-sum); [Uniform cancellation of the truncation error E_z (Corollary 3.3)](#uniform-cancellation-of-the-truncation-error-e-z-corollary-3-3-positive-truncation-error-cancellation); [Coprime Möbius sums from the prime number theorem ((3.6))](#coprime-m-bius-sums-from-the-prime-number-theorem-3-6-coprime-mobius-reciprocal-sum).

**Mestre source and contour formula.** Mestre’s infinite contour limit needs polynomial growth, local zero counts, safe-height logarithmic derivatives, transform decay/Fourier inversion and the Poitou pairing lemma. Combine the Gamma integrals before taking their limit. A zero Gamma slope contributes 0 only after removing its finite nonzero constant. Require both reflected tails; the even Chenevier–Taïbi specialization satisfies that restriction. Used in [Weil's explicit formula (Mestre's formalism)](#weil-s-explicit-formula-mestre-s-formalism-mestre-weil-explicit-formula).

### Examples

For ψ₀(4), the contribution at 4 is (log 2)/2, whereas ψ(4) includes log 2. The residue of −ζ′(s)/ζ(s) at a trivial zero −2n is −1; hence the summed trivial-zero contribution is −(1/2)log(1−x⁻²). Its constant term is −ζ′(0)/ζ(0), whose denominator is ζ(0)=−1/2. In the Gamma quotient with α=β=1 the remaining height exponent is 1/2; with α=β=0 it is −1/2. For the real Weil test F(x)=exp(−a|x|), a>1/2+c, the difference quotient has two different one-sided limits at zero and is still admissible.

### Dependencies

Mathlib analytic orders, bounded variation, one-sided limits and integration; completed ContourIntegration via its exact boundary contracts; Layer 0 factorization and zero-free estimates. The finite-zero explicit formula and its safe-height estimates precede the rational prime error theorem within this layer.

<a id="layer-2-hecke-and-artin-comparisons-and-quantitative-number-field-estimates"></a>

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

See Duke–İmamoğlu–Tóth, [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §2 (2.1), (2.8)–(2.10), §3 (3.1)–(3.3) and Theorem 1, pp.951–958; §7 Lemma 2, (7.10)–(7.11), p.972. The polygon theorem and the finite-orbifold-chart and cusp-limit adapters to DifferentialGeometry Layer 5 are required proofs here. General manifold Stokes is consumed through its existing oriented integration interface.

*Needs:* GeometryOfNumbersAndQuadraticArithmetic's quadratic class/continued-fraction dictionary; hyperbolic quotient geometry; DifferentialGeometry Layers 5 and 12; measure and differential-form integration; AutomorphicSpectralTheory's differentiated cusp estimates for the Eisenstein specialization.

### 2.2 Artin conductors from lower ramification

For a finite Galois extension L/F, a complex representation ρ of G of finite dimension d, and a prime v of F, restrict to its decomposition group and set

```text
a_v(ρ) = Σ_{i≥0} (|G_i|/|G_0|) · codim(V^(G_i)),
𝔣(ρ) = ∏_v v^(a_v(ρ)),       f_ρ = |Disc F|^d · Norm(𝔣(ρ)).
```

Here G_i are the lower ramification groups, G₀ is inertia, and the finite sum is independent of the prime above v. Prove that a_v is a nonnegative integer and vanishes at every unramified prime; integrality is a theorem, not rounding of the rational sum. Define `artinConductorIdeal` using these integers and `artinAnalyticConductor` as the positive real f_ρ. For irreducibles of G, prove the ideal conductor–discriminant formula `Disc(L/F)=∏_ρ 𝔣(ρ)^(dim ρ)`. Deduce the conductor bound used below for the actual normal closure of a bounded-degree CM field. The abelian conductor imported from ClassFieldTheory must agree with this definition.

The intended interface is:

- `artinConductorExp.conjugacy` and `.integral`: transport across primes above v preserves the nonnegative integral exponent.
- `artinConductorIdeal.directSum`: direct sums multiply conductor ideals; the zero representation has unit conductor.
- `artinConductorIdeal.regular`: the regular representation has conductor equal to the relative discriminant.
- `artinConductorIdeal.linear_eq`: a one-dimensional character gives the local/global conductor of ClassFieldTheory.

**Checks.**

- The trivial representation has every exponent zero and conductor ideal one, including at ramified primes.
- For a tame one-dimensional ramified character, only G₀ contributes and its exponent is one. For an unramified character it is zero.
- For ℚ(i)/ℚ the nontrivial quadratic character has conductor 4, not the tame guess 2; the ramification filtration must retain the wild contribution at 2.
- The regular representation of that quadratic group gives discriminant ideal (4), whereas its trivial summand alone gives (1).

See Tsimerman, [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), proof of Corollary 3.3, pp.383–384, for the analytic conductor application. This application does not prove general conductor integrality or the conductor–discriminant formula: their ramification-theoretic proofs are explicit source obligations, together with the normal-closure discriminant bound. The lower ramification filtration itself is consumed from LocalGaloisGroups; its construction is not repeated.

*Needs:* NumberFieldArithmetic's inertia and decomposition groups; LocalGaloisGroups' lower filtration and different; finite-dimensional character theory and representation invariants; ClassFieldTheory's abelian conductor comparison.

<a id="hecke-series-and-tate-integral-comparison-hecke-L-function-euler-product-comparison"></a>

### 2.3 Hecke series and Tate integral comparison

Let K be a number field, c a unitary idele-class character unramified outside a finite set S containing every archimedean place, and χ its ideal-character presentation from GlobalNumberFields Layer9. Choose Tate's admissible factorizable f with f_v=1_{O_v} for v∉S. For Re(s)>1, Z(f,c|·|^s)=(∏_{v∈S}Z_v(f_v,c_v|·|_v^s))(∏_{v∉S}N(d_v)^(−1/2))L_S(s,χ), where L_S(s,χ)=∑_{a integral, prime to S}χ(a)N(a)^(−s)=∏_{v∉S}(1−χ(v)N(v)^(−s))⁻¹. d_v is the local different; its product is finite because d_v is a unit at almost all places. Haar and Fourier normalizations are Tate's, not silently normalized unit volumes.

Assume K a number field; c unitary and trivial on K×; S finite containing infinity and all ramification of c; f admissible in Tate's Z1–Z3 class with the stated local factors; Re(s)>1.

The proof proceeds as follows. Import the canonical Hecke character and its local/ideal dictionary from GlobalNumberFields Layer9. At v∉S, compute the local integral as the convergent geometric series N(d_v)^(−1/2)∑_{j≥0}χ(v)^j N(v)^(−js). Import the AL.1 global zeta-integral factorization, with the AL.0 measures and Fourier convention, and multiply the local formulas. Use ADS Layer3 to identify the ideal Euler product with the absolutely convergent ideal series. Exact norm regrouping and admissibility hypotheses are required imports, not new carriers here. The completed functional equation is now the completed Hecke functional equation of Layer 2, stated as an identity of meromorphic functions from the Hecke functional equation of AutomorphicLFunctionsAndLocalFactors Layer 1; no local factor is cancelled at its zeros.

The result must also satisfy these compatibility requirements: For K=ℚ and trivial c, the unramified arithmetic series is ζ with exactly the S Euler factors removed. Ramified different factors N(d_v)^(−1/2) are retained. The character is an imported idele-class character, not an arbitrary list of local factors.

See [John Tate — Fourier analysis in number fields and Hecke's zeta-functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.5, thesis p.(4.23), scan p.57; comparison and continuation discussion scan pp.58–59.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.0; AutomorphicLFunctionsAndLocalFactors AL.1 — global-zeta-integral; AutomorphicLFunctionsAndLocalFactors AL.1 — completed-hecke-l-function; [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters); [ArithmeticDirichletSeries layer 3 local factors and euler products](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products).

<a id="hecke-boundary-adapter-for-landau-positivity-landau-nonnegative-logarithm"></a>

### 2.4 Hecke boundary adapter for Landau positivity

For a continued Hecke product F meromorphic near Re s≥1, with no poles except a pole of order at most one at 1, nonnegative norm-regrouped logarithmic coefficients on Re s>1 imply: F has no zeros at regular points of Re s≥1, and its meromorphic order at 1 is ≤0. A pole is not a nonzero finite value.

Assume Coefficients a_n real and nonnegative; the Dirichlet series may be indexed by ideals after regrouping by norm.

The proof proceeds as follows. Import the generic Landau positivity and 3-4-1 boundary theorem from ADS Layer 8, rather than constructing it again. Check that the Hecke product satisfies the imported pole-order and logarithmic-coefficient hypotheses; the separate ray-class orthogonality lemma supplies the coefficients. At a regular point interpret order zero as nonvanishing; at 1 permit a pole, and use the real positive limit when the singularity is removable.

The result must also satisfy these compatibility requirements: A simple pole at 1 is allowed; no value F(1) is asserted there. A removable value at 1 is at least 1 in the logarithmic normalization. No new generic Landau theorem is owned here.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §3.3, Lemma 3.6 and Exercise 3.6.1, printed pp. 19 and 21.

*Needs:* [ArithmeticDirichletSeries layer 8 landau type positivity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity).

<a id="dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue"></a>

### 2.5 Dedekind continuation and real-side comparison

The Dedekind function supplied by the trivial-character Tate continuation agrees with NumberField.dedekindZeta K on Re s>1. Its complex residue at 1 equals NumberField.dedekindZeta_residue K, by agreement with the real one-sided residue limit and uniqueness of a meromorphic residue. This is an agreement theorem on the convergence half-plane, not equality with the totalized LSeries everywhere.

Assume K a number field with r₁ real and r₂ complex places.

The proof proceeds as follows. Import the trivial-character continuation from AL.1 and use the ideal Euler-product comparison on Re s>1. Multiply the continued function by s−1 and remove the simple singularity. Take its real right-hand limit using the Dedekind residue theorem; uniqueness of the continuous extension identifies the complex residue.

The result must also satisfy these compatibility requirements: No evaluation of the totalized LSeries at −2 is used. For Q(i), the positive residue expression is π/4. The completed functional equation and trivial zeros are separate declarations.

See [John Tate — Fourier analysis in number fields and Hecke's zeta-functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.4 Main Theorem 4.4.1 and §4.5, physical pp. 50–58.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.1 — tate-global-functional-equation; AutomorphicLFunctionsAndLocalFactors AL.1 — global-zeta-integral; AutomorphicLFunctionsAndLocalFactors AL.1 — idele-class-volume; `NumberField.dedekindZeta`; `NumberField.dedekindZeta_residue`; `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`; `Complex.Gammaℝ`; `Complex.Gammaℂ`.

<a id="sufficient-conductor-discriminant-estimate-artin-conductor-bound"></a>

### 2.6 Sufficient conductor-discriminant estimate

Fix g≥1. Let E be any degree2g CM field, L its normal closure over Q (not an arbitrary Galois overfield), G=Gal(L/Q), and c the central complex conjugation. Let F(E) be the finite set of isomorphism classes of nontrivial irreducible complex G-representations ρ satisfying ρ(c)=−Id. Then |G|≤M_g=(2g)!, |F(E)|≤M_g and dim ρ≤M_g. All constants below are uniform in E and ρ∈F(E). The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value≤B_g; the trivial factor is separated before evaluation at1. Use the canonical positive Artin conductor f_ρ, formed from the lower-ramification codimensions of inertia invariants; it is not a ray modulus or an arbitrary positive parameter. There exists C_g>0 such that log f_ρ≤C_g(1+log D_E).

Assume E is CM of degree2g; L is its normal closure; ρ is a nontrivial odd irreducible representation.; The Artin conductor and its ramification comparison are constructed here from the inertia and lower ramification data of NumberFieldArithmetic and LocalGaloisGroups.

The proof proceeds as follows. Import general Artin-conductor integrality and the conductor–discriminant formula from the Artin-conductor construction of this layer. NumberFieldArithmetic owns the actual lower-ramification filtration and permutation discriminant formula, not this identification. Combine the finite-group dimension bound with a degree-dependent comparison D_L≤D_E^A_g. The printed stronger f_ρ≤D_E is not needed. The original comparison proof is an arithmetic proof obligation.

See [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Proof of Corollary 3.3, p. 384; [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Theorem3.2 and proof of Corollary3.3, printed pp.383–384.

*Needs:* [NumberFieldArithmetic layer 7 subfields integral bases monogenicity and explicit units](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-7-subfields-integral-bases-monogenicity-and-explicit-units); `Representation.IsIrreducible`; `NumberField.IsCMField.complexConj`.

<a id="quadratic-zeta-factorization-and-the-residue-quotient-quadratic-zeta-factorization"></a>

### 2.7 Quadratic zeta factorization and the residue quotient

For a quadratic extension E/F with its canonical nontrivial finite-order Hecke character η, ζ_E(s)=ζ_F(s)L_f(s,η) on Re s>1, including every ramified Euler factor.

The proof proceeds as follows. Verify split, inert and ramified Euler factors of ζ_E/ζ_F on Re s>1. Extend the identity to the canonical continuations; the residue quotient is a separate result.

See [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Euler-factor adapter for Tsimerman, Corollary 3.3, p.384; compare Thorner–Zaman §2.1 (2-1)–(2-7), pp.1140–1141.

*Needs:* [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters); [ClassFieldTheory layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity).

<a id="partial-ideal-zeta-series-partial-ideal-zeta"></a>

### 2.8 Partial ideal zeta series

For a number field K, choose its ordinary or narrow ideal class group, and a class A. Let a_A(n) count nonzero integral ideals of norm n in A, with a_A(0)=0. Define ζ_A(s)=LSeries a_A s on Re s>1, using the imported norm-indexed ideal arithmetic function and finite norm fibres. Quadratic period applications use narrow classes for real quadratic K and ordinary classes for imaginary quadratic K. Index ideals, not their generators. The finite class sum agrees with NumberField.dedekindZeta as an LSeries: the latter may have a different zeroth coefficient, which LSeries ignores. The representative ordinary-class series is `partialIdealZeta`; `sum_partialIdealZeta` sums its finite class partition.

The proof proceeds as follows. Choose the ordinary ClassGroup or NumberField.NarrowClassGroup carrier and its canonical nonzero-ideal monoid homomorphism. Apply normCoeff to the class indicator weight; the zero ideal is absent from the carrier and the zeroth arithmetic coefficient is zero. Use finite norm fibres and the finite class-group sum to regroup coefficients. Class characters are monoid homomorphisms to complex units; their finite order supplies unit norm. For quadratic conjugation, use the ring-of-integers equivalence and the inversion theorem on narrow classes, then the ordinary-class quotient. Norm preservation induces the coefficient bijection. The native general adapter exposes this exact class-inversion hypothesis; the canonical quadratic specialization discharges it.

The required interface consists of the following operations and identities.

- `partial_ideal_zeta.coeff`: a_A(n) is the finite cardinality of integral ideals of positive norm n in A; a_A(0)=0.
- `partial_ideal_zeta.sum_classes`: The sum of ζ_A over all ideal classes is the Dedekind series on Re s>1.
- `partial_ideal_zeta.character_sum`: For a class character χ, Σ_A χ(A)ζ_A(s) is its ideal-character LSeries on Re s>1.
- `partial_ideal_zeta.conjugation`: For a ring-of-integers automorphism τ whose induced map on the selected class group is inversion, norm preservation gives ζ_A(s)=ζ_(A⁻¹)(s) on Re s>1. The quadratic specialization uses the canonical quadratic conjugation; its narrow-class inversion is already available.

**Checks.**

- For K=Q, the unique partial series equals the Riemann series on Re s>1.
- a_A(1)=1 for the principal class and 0 otherwise.
- The unit ideal contributes once, even when the unit group is infinite.
- The zero ideal contributes to no coefficient; no norm-zero negative power occurs.

The result must also satisfy these compatibility requirements: For K=Q, the unique partial series equals the Riemann series on Re s>1. a_A(1)=1 for the principal class and 0 otherwise. The unit ideal contributes once, even when the unit group is infinite. The zero ideal contributes to no coefficient; no norm-zero negative power occurs. The ℚ test is in the domain of this general coefficient definition; a real/imaginary quadratic restriction applies only to the subsequent period identities. Class-sum coefficient agreement is required for n≥1; do not infer equality of the zeroth coefficients from equality of LSeries.

See [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §7, p970.

*Needs:* `NumberField.dedekindZeta`; [ArithmeticDirichletSeries layer 1 norm fibres and mathlib lseries](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries); [ArithmeticDirichletSeries layer 5 ideal and prime estimates](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-5-ideal-and-prime-estimates); [GlobalNumberFields layer 2 moduli and ray class carriers](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers); `TauCeti.IdealArithmeticFunction`; `TauCeti.normCoeff`; `ClassGroup.mk0`; `NumberField.NarrowClassGroup.mk0`; `NumberField.NarrowClassGroup.mk0_map_ringOfIntegersQuadraticConj_eq_inv`.

<a id="lemma-4-4-zaman-s-effective-lower-bound-for-prime-ideals-effective-prime-ideal-lower"></a>

### 2.9 Lemma 4.4 (Zaman's effective lower bound for prime ideals)

For every fixed degree n there is a positive effective c_n and an absolute effective D₀ such that π_k(Y)≥c_n D_k^(−19)Y/log Y whenever [k:Q]=n, D_k≥D₀ and Y≥D_k^35.

Assume Fix n=[k:ℚ]≥1; D_k is the absolute discriminant; one absolute effective threshold D₀≥2 and an effective c_n>0 precede all k,Y; Y≥D_k^35.; π_k counts nonzero prime ideals of norm≤Y. The caseD_k=1 is outside the discriminant threshold, not a counterexample.

The proof proceeds as follows. Apply the degree-uniform effective Zaman prime-ideal bound with β=35 and γ=19. Retain a discriminant threshold and Y≥D^35.

See [Robert Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://doi.org/10.1017/S2050508625000009), Lemma 4.4, p.22, citing [Zam17], Forum Math. Pi 13 (2025), e19; [Robert Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://doi.org/10.1017/S2050508625000009), §4, Lemma4.4 and ensuing discussion, printed p.22; [Asif Ali Zaman — Analytic estimates for the Chebotarev Density Theorem and their applications](https://www.math.toronto.edu/zaman/files/thesis.pdf), Theorem1.3.1, pp.11–12; conventions §1.5 p.26; selected §7.2.1 pp.159–160 and §7.2.4 pp.166–169.

*Needs:* [ArithmeticDirichletSeries layer 4 counting carriers and local finiteness](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-4-counting-carriers-and-local-finiteness).

<a id="imaginary-quadratic-genus-character-classification-imaginary-genus-character-dictionary"></a>

### 2.10 Imaginary quadratic genus-character classification

For an imaginary quadratic field K of fundamental discriminant D<0, genus characters are homomorphisms Cl_K→{±1}, including the trivial homomorphism. They correspond bijectively to unordered fundamental-discriminant factorizations{D₁,D₂}, D=D₁D₂, one positive and one negative; permit the trivial discriminant1 with ε_1=1. For an integral ideal a prime to D, χ_{D₁,D₂}(a)=ε_{D₁}(N a)=ε_{D₂}(N a). This comparison is the arithmetic classification/compatibility dictionary. The analytic equality L_K(s,χ)=L(s,ε_{D₁})L(s,ε_{D₂}) is supplied by the existing genus_lseries_factorization comparison, not proved again here.

The proof proceeds as follows. Use the genusCharFunNarrowClassGroupHom only with its actual hypotheses: distinct prime-discriminant data with at most one even prime discriminant, total product the fundamentalDiscriminant of the squarefree radicand, a chosen quadratic generator and subset of those prime discriminants. Transport the homomorphism via the toClassGroupEquiv under IsTotallyComplex K; this equivalence itself constructs no imaginary-quadratic instance. Match subset/complement factorizations to the unordered pair{D₁,D₂}; prove the full surjectivity/kernel classification in the existing quadratic arithmetic owner. The two constructions alone do not prove that every quadratic class character is a genus character of this form. Match the prime-to-D ideal evaluation to the Kronecker characters with ε_1=1; invoke the separately owned analytic genus-factorization theorem when an L-series product is required.

The result must also satisfy these compatibility requirements: For D=−4 only{1,−4} occurs and the genus character is trivial. For D=−15 the pairs{1,−15} and{5,−3} give the two genus characters. An ideal of norm2 (prime to15) has value ε_5(2)=ε_−3(2)=−1 in the nontrivial case. The prime-to-D condition is essential: extending a Dirichlet character by0 at ramified primes cannot define a{±1}-valued class character there.

See [Benedict H. Gross, Don B. Zagier — Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), ChapterIV introduction after(0.3), p.268.

*Needs:* `TauCeti.Multiquadratic.genusCharFunNarrowClassGroupHom`; `NumberField.NarrowClassGroup.toClassGroupEquiv`.

<a id="artin-local-polynomial-artin-local-polynomial"></a>

### 2.11 Artin local polynomial

For a finite Galois extension L/K, a finite-dimensional complex representation ρ of G=Gal(L/K), and a nonzero prime ideal p of K, choose P above p, its decomposition/inertia groups D_P,I_P and arithmetic Frobenius in D_P/I_P. On V^(I_P), Frobenius acts canonically. Define P_p(T)=det(1−T·Frob_P|V^(I_P)) in C[T]. The determinant is independent of P and of a Frobenius lift.

The proof proceeds as follows. Use the actual representation of L≃ₐ[K]L, restrict it to the ideal inertia subgroup, and form Representation.invariants. The existence theorem supplies an arithmetic Frobenius lift even at ramified primes. Restrict that lift to invariants; its reversed characteristic polynomial is det(1−T·F). Restrict the existing Representation C G V to I_P and use its invariants submodule; I_P is normal in D_P, so each decomposition-group element preserves that subspace. Any two arithmetic Frobenius lifts differ by inertia by IsArithFrobAt.mul_inv_mem_inertia, so their restrictions to V^I agree. Changing P conjugates both I and Frobenius; transport vectors through ρ(g) and apply LinearEquiv.charpoly_conj. For the induced invariant-space automorphism A, define the polynomial as A.charpoly.reverse. Matrix.reverse_charpoly identifies it with det(1−T A) in any basis. Invertibility gives degree exactly dim V^I; finite order forces all eigenvalues and reciprocal polynomial roots onto the unit circle. The carrier uses the prime-relative Frobenius coset, including ramified primes. NFA2 artinSymbol alone is available only at unramified primes and cannot define this full polynomial.

The required interface consists of the following operations and identities.

- `artin_local_polynomial.independence`: Changing P conjugates the invariant-space endomorphism and leaves P_p unchanged.
- `artin_local_polynomial.constant`: P_p(0)=1.
- `artin_local_polynomial.unramified`: For unramified p, P_p(T)=det(1−Tρ(Frob_p)) on all of V.
- `artin_local_polynomial.degree`: natDegree P_p=dim_C(V^I)≤dim_C V; the Frobenius endomorphism on V^I has eigenvalues of modulus1 and every root of P_p has modulus1. The degree-zero polynomial1 has no roots.
- `artin_local_polynomial.basis`: Changing the finite-dimensional basis does not change the polynomial.

**Checks.**

- For the one-dimensional trivial representation, P_p=1−T at every prime.
- For the zero representation, P_p=1.
- For a one-dimensional character nontrivial on inertia, V^I=0 and P_p=1; using the whole V would give a wrong factor.

The result must also satisfy these compatibility requirements: For the one-dimensional trivial representation, P_p=1−T at every prime. For the zero representation, P_p=1. For a one-dimensional character nontrivial on inertia, V^I=0 and P_p=1; using the whole V would give a wrong factor.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.2 p.128 ramified-prime paragraph.

*Needs:* [NumberFieldArithmetic layer 2 frobenius elements and the artin symbol](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol); `Representation.invariants`; `Representation.mem_invariants`; `IsArithFrobAt.mul_inv_mem_inertia`; `IsArithFrobAt.conj`; `LinearEquiv.charpoly_conj`; `Matrix.charpolyRev`; `Matrix.reverse_charpoly`; `NumberField.exists_isArithFrobAt`.

<a id="primitive-hecke-functional-equation-normalization-hecke-primitive-functional-equation"></a>

### 2.12 Primitive Hecke functional-equation normalization

For a primitive finite-order Hecke character χ with finite conductor f and the imported archimedean parity data, the canonical continued L-function, multiplied by the conductor/discriminant and the real/complex gamma factors in AL.1, satisfies Λ(s,χ)=ε(χ)Λ(1−s,χ̄) as a meromorphic identity. The principal character retains the two completed poles. Imprimitive deleted factors are a separate comparison.

Assume K a number field; 𝔪 a modulus (an integral ideal times a set of real places); χ a character of the ray class group Cl_𝔪(K) (finite order), identified with a finite-order idele-class character ω_χ by GlobalNumberFields Layer 9; L(s, χ) = Σ_{(𝔞,𝔪)=1} χ(𝔞)N𝔞^{−s} for Re s > 1.; χ primitive of conductor 𝔣 for the functional equation.

The proof proceeds as follows. Import the Hecke functional equation of AutomorphicLFunctionsAndLocalFactors Layer 1 on its canonical completed carrier. Use the Re s>1 comparison to identify the finite Euler product, retaining the different and Haar constants. Transport the identity using the identity theorem; do not claim a new Tate functional-equation proof.

The result must also satisfy these compatibility requirements: For K = ℚ and a primitive Dirichlet character χ of positive conductor N, distinguish the conductor-completed meromorphic function Λ(s,χ)=N^(s/2)·DirichletCharacter.completedLFunction χ s from Mathlib’s completedLFunction, which omits that conductor power. Mathlib states completedLFunction χ (1−s)=N^(s−1/2)·rootNumber χ·completedLFunction χ⁻¹ s. Multiplying by N^((1−s)/2) gives Λ(1−s,χ)=rootNumber χ·Λ(s,χ⁻¹); compare orientations before identifying ε(χ). At poles use meromorphic identities, not a product of totalized point values. Check that an imprimitive character's L-function acquires zeros on Re s = 0 from the removed Euler factors, which is why the functional equation is stated only for the primitive function.

See [John Tate — Fourier analysis in number fields and Hecke's zeta-functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.5, physical pp. 57–59.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.1 — hecke-l-functional-equation; AutomorphicLFunctionsAndLocalFactors AL.1 — completed-hecke-l-function; AutomorphicLFunctionsAndLocalFactors AL.1 — global-epsilon-factor; [Hecke series and Tate integral comparison](#hecke-series-and-tate-integral-comparison-hecke-L-function-euler-product-comparison); `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`.

<a id="ideal-character-hecke-l-function-class-character-lseries-comparison"></a>

### 2.13 Ideal-character Hecke L-function

For a finite narrow-class character χ, L(s,χ)=Σ_aχ(a)N(a)^(−s)=∏_p(1−χ(p)N(p)^(−s))⁻¹, Re(s)>1, and L=Σ_Aχ(A)ζ_A. The printed Euler product omits χ(p); use the corrected one.

The proof proceeds as follows. Regroup the canonical ideal-character series by its finite class values. Apply ADS Euler products with χ(p) retained in every local factor.

See [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §7, p970.

*Needs:* [Partial ideal zeta series](#partial-ideal-zeta-series-partial-ideal-zeta); [Hecke series and Tate integral comparison](#hecke-series-and-tate-integral-comparison-hecke-L-function-euler-product-comparison).

<a id="siegel-lower-bound-and-regulator-conversion-real-quadratic-class-regulator-lower"></a>

### 2.14 Siegel lower bound and regulator conversion

For every ε>0, h⁺(D)log ε_D≥c_ε D^(1/2−ε) for fundamental D>1, with an ineffective c_ε>0 and the narrow regulator convention of the quadratic regulator dictionary.

The proof proceeds as follows. Import the narrow/ordinary class-number and norm-minus-one unit dichotomy. Apply Siegel and the positive real-quadratic residue formula with the specified fundamental unit.

The result must also satisfy these compatibility requirements: The nontrivial real quadratic field has fundamental discriminant D>1; its fundamental unit and narrow regulator retain the DIT convention.

See [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §6, pp967–968.

*Needs:* [Siegel's theorem (black box)](#siegel-s-theorem-black-box-siegel-quadratic-lvalue); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue).

<a id="siegel-lower-bound-and-regulator-conversion-imaginary-quadratic-class-number-lower"></a>

### 2.15 Siegel lower bound and regulator conversion

For every ε>0, h(D)≥c_ε |D|^(1/2−ε) for negative fundamental D, with an ineffective c_ε>0.

The proof proceeds as follows. Use the imaginary-quadratic residue formula and the degree-two uniform roots-of-unity bound. Insert Siegel’s primitive quadratic L-value lower bound.

See [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §6, pp967–968.

*Needs:* [Siegel's theorem (black box)](#siegel-s-theorem-black-box-siegel-quadratic-lvalue); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue).

<a id="explicit-residue-bound-for-dedekind-zeta-functions-louboutin-louboutin-dedekind-residue-upper"></a>

### 2.16 Explicit residue bound for Dedekind zeta functions (Louboutin)

For every number field K of degree d>1 and absolute discriminant D_K, the residue κ_K of the continued Dedekind zeta function satisfies κ_K≤(e log D_K/(2(d−1)))^(d−1).

Assume K is a number field; d=[K:ℚ]>1; D_K is the positive absolute discriminant; κ_K is the residue of the complex continuation at1, matched to the real residue limit.

The proof proceeds as follows. Apply the original Louboutin upper bound to the continued Dedekind residue. Keep d>1 and the exact degree-dependent exponent; this upper bound alone does not prove a lower bound.

See [Michael Lipnowski and Jacob Tsimerman — How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1), §3.2.2 (24), [18]; used again in §5.4.2 (49); [Michael Lipnowski and Jacob Tsimerman — How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1), §3.2.2, (24), printed p.14; reference[18].

*Needs:* [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue).

<a id="imaginary-quadratic-completion-and-root-number-imaginary-quadratic-root-number-one"></a>

### 2.17 Imaginary quadratic completion and root number

For negative fundamental D, put δ=|D| and let ε_D be the canonical primitive odd Dirichlet character of Q(√D), of conductorδ. On Re s>1, Λ_std(s,ε_D)=(δ/π)^((s+1)/2)Γ((s+1)/2)L(s,ε_D). Its canonical entire continuation is δ^((s+1)/2)·DirichletCharacter.completedLFunction(ε_D,s). The new quadratic normalization assertion is that the root number is+1 and Λ_std(1−s,ε_D)=Λ_std(s,ε_D). Entire continuation of a nontrivial Dirichlet completed function is already in Mathlib; no duplicate continuation construction is planned.

The proof proceeds as follows. Import the nontrivial-character differentiability of the completedLFunction and its primitive functional equation. The library completion omits the conductor power, so multiply byδ^((s+1)/2) with the real logarithm ofδ>0. Compare ζ_K=ζ_Q L(s,ε_D), first on Re s>1 then as canonical meromorphic functions, to the number-field completed functional equation. Γ_C(s)/Γ_R(s) and the duplication identity give the oddΓ_R(s+1) branch. The canonical odd character/conductor identification is required. Cancel on a nonzero open half-plane to obtain root+1, then use analytic continuation. Do not infer the sign from |rootNumber|=1 or evaluate a totalizedΓ·L product at a cancelled pole. The existing normalization gap records this comparison proof.

The result must also satisfy these compatibility requirements: At D=−4 the conductor is4, the character is odd and Λ_std(0)=Λ_std(1)=1; at D=−3 both endpoints are1/√3. Mathlib’s unnormalized completed function alone has the conductor factorδ^(s−1/2) in its functional equation; that factor cancels only after multiplying by the specified conductor power. The completion is its canonical entire continuation. At negative odd integers, a divergent gamma factor times a vanishing L-value must not be assigned the naive product value0.

See [Benedict H. Gross, Don B. Zagier — Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), ChapterIV§4, p.282, proof of(4.1), and§5 p.290 after(5.4).

*Needs:* `DirichletCharacter.differentiable_completedLFunction`; `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`; [Quadratic zeta factorization and the residue quotient](#quadratic-zeta-factorization-and-the-residue-quotient-quadratic-zeta-factorization); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); AutomorphicLFunctionsAndLocalFactors AL.1 — tate-global-functional-equation; AutomorphicLFunctionsAndLocalFactors AL.1 — archimedean-local-theory; AutomorphicLFunctionsAndLocalFactors AL.1 — unramified-local-theory; [Dedekind completed-functional-equation comparison](#proof-dedekind-completed-functional-equation).

<a id="proof-dedekind-completed-functional-equation"></a>

**Dedekind completed-functional-equation comparison.** For a number field K with absolute discriminant D_K, r₁ real places and r₂ conjugate pairs of complex places, let Γ_R(s)=π^(−s/2)Γ(s/2) and Γ_C(s)=2(2π)^(−s)Γ(s), the Complex.Gammaℝ and Complex.Gammaℂ. The canonical continuation supplied by Tate has Λ_K(s)=|D_K|^(s/2)Γ_R(s)^r₁Γ_C(s)^r₂ζ_K^cont(s), and Λ_K(1−s)=Λ_K(s) as meromorphic functions. No equality of totalized values at poles is asserted.

Import AL.1 global Tate functional equation, archimedean local factors and unramified finite factors, using the standard trace additive character and its self-dual measure. At finite places the inverse different supplies |D_K|^(s/2); the conductor of the trivial character is the unit ideal. Compare Tate’s local constants with the displayed gamma convention; s-independent constants cancel from the functional equation. Use the Dedekind convergence-half-plane comparison to identify the continuation. The measure/different adapter is recorded as an open gap, rather than supplied by the global integral equation alone.

See [John Tate — Fourier analysis in number fields and Hecke's zeta-functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.5, scan pp.56–59, especially (4.24) on scan p.58; local factors tabulated in §2.5.

<a id="imaginary-quadratic-class-number-value-at-one-imaginary-quadratic-lvalue-one"></a>

### 2.18 Imaginary quadratic class-number value at one

For an imaginary quadratic field of fundamental discriminant D<0, δ=|D|, class number h and w=2u roots of unity, L(1,ε_D)=πh/(u√δ).

The proof proceeds as follows. Use the existing quadratic-residue quotient L(1,ε_D)=κ_K/κ_Q, where κ_Q=1 and the continued functions agree with the norm-indexed library series on Re s>1. Read the residue formula2^r₁(2π)^r₂ R_K h_K/(w_K√δ). For imaginary quadratic K, r₁=0,r₂=1,R_K=1,w_K=2u, giving πh/(u√δ). Retain the arithmetic regulator/embedding-count dictionaries and continuation adapter; the library’s one-sided real residue limit alone does not prove all these comparisons.

The result must also satisfy these compatibility requirements: D=−4 gives L(1,ε_−4)=π/4 (h=1,u=2). D=−3 gives L(1,ε_−3)=π/(3√3) (h=1,u=3). For h,u>0 this value is positive; confusing roots of unity w with half-units u loses a factor2.

See [Benedict H. Gross, Don B. Zagier — Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), ChapterIV§4 pp.283–284, Propositions(4.4)–(4.5), implicit class-number substitution.

*Needs:* [Quadratic zeta factorization and the residue quotient](#quadratic-zeta-factorization-and-the-residue-quotient-quadratic-zeta-factorization); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters); [ClassFieldTheory layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity); AutomorphicLFunctionsAndLocalFactors AL.1 — hecke-l-functional-equation; `NumberField.dedekindZeta_residue`; [Quadratic Hecke value as residue quotient](#proof-quadratic-residue-quotient).

<a id="proof-quadratic-residue-quotient"></a>

**Quadratic Hecke value as residue quotient.** For a quadratic extension E/F, L_f(1,η)=κ_E/κ_F>0, where κ_K is the positive residue of the continued Dedekind function. Here η is the canonical nontrivial primitive quadratic Hecke character attached by global Artin reciprocity. Its holomorphy at 1, the continued zeta factorization, and the two simple positive residues give the quotient; general line-one nonvanishing is not needed for this argument.

Multiply the continued quadratic factorization by s−1 and take the limit at 1. Cancel the positive κ_F and use holomorphy of the nonprincipal Hecke factor.

See [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Quadratic Euler-factor calculation; Thorner-Zaman 2017 equations (2-1)-(2-7); main Corollary 3.3 adapter.

<a id="artin-euler-series-artin-euler-series"></a>

### 2.19 Artin Euler series

For a finite Galois extension L/K of number fields and a finite-dimensional complex representation ρ of Gal(L/K), and Re s>1, L_K(s,ρ)=∏_p P_p((Np)^−s)^−1, over all nonzero prime ideals of K, with complex powers using the positive real norm logarithm. Coefficients are the norm-regrouped reciprocal local-polynomial coefficients, not a completely multiplicative degree-one ideal weight.

The proof proceeds as follows. For each prime polynomial P(T) with P(0)=1, recursively determine reciprocal coefficients a_0=1 and a_(n+1)=−Σ_(j=0)^n P_(j+1)a_(n−j). Unique ideal factorization extends these to the canonical multiplicative nonzero-ideal weight. Its normCoeff LSeries is the series compared with the all-prime unordered Euler product. Expand each reciprocal local polynomial as the formal product of m geometric series, where m=dim V^I≤d. Assign these prime-power coefficients multiplicatively to the existing ideal arithmetic-function carrier; do not assert complete multiplicativity. The absolute coefficient sum at a prime is bounded by (1−(Np)^−σ)^−d. Finite ideal-factorization products therefore admit the d-fold Dedekind-series majorant; prove the ideal-indexed absolute convergence in the proof ingredient Layer 2/artin-absolute-convergence before identifying the norm-regrouped LSeries. Use ADS1 regroupByNorm and ADS3 EulerProductData to compare the single canonical coefficient LSeries and the unordered prime product on Re s>1. The trivial representation recovers the full Dedekind series, including every ramified prime; the zero representation is the constant1.

The required interface consists of the following operations and identities.

- `artin_euler_series.local`: Every local factor is the reciprocal of the inertia-invariant polynomial.
- `artin_euler_series.series`: The absolutely convergent Euler product equals the norm-regrouped coefficient LSeries on Re s>1.
- `artin_euler_series.nonzero`: The convergent Euler product is nonzero on Re s>1.
- `artin_euler_series.direct_sum`: On Re s>1, L_K(s,ρ₁⊕ρ₂)=L_K(s,ρ₁)L_K(s,ρ₂), including all ramified local factors; see Layer 2/artin-direct-sum-factor.
- `artin_euler_series.deleted`: Omitting a finite bad-prime set multiplies L_K by exactly ∏_{p bad}P_p((Np)^−s).

**Checks.**

- The one-dimensional trivial representation gives the convergent Dedekind series, including ramified primes.
- The zero representation gives1.
- A one-dimensional character ramified at p contributes local factor1 there.

The result must also satisfy these compatibility requirements: The one-dimensional trivial representation gives the convergent Dedekind series, including ramified primes. The zero representation gives1. A one-dimensional character ramified at p contributes local factor1 there.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.2 pp.127–128 incomplete Euler product and ramified-factor prescription.

*Needs:* [Artin local polynomial](#artin-local-polynomial-artin-local-polynomial); [ArithmeticDirichletSeries layer 1 norm fibres and mathlib lseries](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries); [ArithmeticDirichletSeries layer 3 local factors and euler products](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products).

<a id="negative-even-zeros-of-the-continuation-dedekind-negative-even-zero"></a>

### 2.20 Negative even zeros of the continuation

For a number field K and every integer n≥1, the canonical holomorphic Dedekind continuation at −2n has a zero of exact order r₁+r₂, where r₁ and r₂ are its real-place and complex-pair counts. In particular ζ_K^cont(−2n)=0, since r₁+r₂≥1. This evaluates the continuation, not the totalized ideal LSeries.

The proof proceeds as follows. At 1+2n the ideal series converges to a strictly positive real number: its terms are nonnegative and the unit ideal contributes 1. Gamma factors and the discriminant factor there are finite and nonzero. Reflect via the completed meromorphic functional equation. Each Γ_R and Γ_C factor has a simple pole at −2n, with nonzero residue; the product has order −(r₁+r₂). Add meromorphic orders to get order r₁+r₂ for ζ_K^cont, using r₁+2r₂=[K:Q]≥1. Library gamma junk values at the poles cannot substitute for this germ calculation.

The result must also satisfy these compatibility requirements: For Q the order is 1, agreeing with the already implemented negative-even Riemann zeros. For a real quadratic field the order is 2, whereas for an imaginary quadratic field it is 1.

See [John Tate — Fourier analysis in number fields and Hecke's zeta-functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.5 equation on scan p.58, with §2.5 archimedean factors; derived negative-even specialization.

*Needs:* [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); AutomorphicLFunctionsAndLocalFactors AL.1 — tate-global-functional-equation; AutomorphicLFunctionsAndLocalFactors AL.1 — archimedean-local-theory; AutomorphicLFunctionsAndLocalFactors AL.1 — unramified-local-theory; [Dedekind completed-functional-equation comparison](#proof-dedekind-completed-functional-equation).

<a id="canonical-ray-character-comparison-and-the-quadratic-endpoint-hecke-nonvanishing-on-line-one"></a>

### 2.21 Canonical ray-character comparison and the quadratic endpoint

For a nonprincipal quadratic character χ of a finite ray class quotient, identify its canonical Tate continuation with the continued norm-regrouped ideal-weight function, including finite omitted Euler factors. Prove L(1,χ)≠0. Combined with the nonreal endpoint argument and the imported weight nonvanishing away from 1, this gives the full ray-character boundary comparison.

Assume K a number field; 𝔪 a modulus (an integral ideal times a set of real places); χ a character of the ray class group Cl_𝔪(K) (finite order), identified with a finite-order idele-class character ω_χ by GlobalNumberFields Layer 9; L(s, χ) = Σ_{(𝔞,𝔪)=1} χ(𝔞)N𝔞^{−s} for Re s > 1.

The proof proceeds as follows. Identify the canonical continuations on Re s>1 using their absolutely convergent ideal series, then use uniqueness on the connected holomorphy domain. For a quadratic character use the positive auxiliary function L(s,χ)ζ_K(s)/ζ_K(2s), whose hypothetical zero at 1/2 contradicts Landau positivity. The nonreal endpoint follows from the separate ray-product order argument.

The result must also satisfy these compatibility requirements: Check K = ℚ against Mathlib: DirichletCharacter.LFunction_ne_zero_of_one_le_re. Check the need for a separate argument at s = 1 for real χ: χ = χ̄ gives only one zero against the pole, so the product argument alone does not decide it.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §3.3–§3.4, Theorems 3.8, 3.10 and 3.11, printed pp. 19–20; [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.5, Theorem 22.4, printed p. 129.

*Needs:* [Hecke boundary adapter for Landau positivity](#hecke-boundary-adapter-for-landau-positivity-landau-nonnegative-logarithm); [Primitive Hecke functional-equation normalization](#primitive-hecke-functional-equation-normalization-hecke-primitive-functional-equation); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters); [ArithmeticDirichletSeries layer 3 local factors and euler products](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products); `LSeries.positive`; `DirichletCharacter.LFunction_ne_zero_of_one_le_re`; [Hecke series and Tate integral comparison](#hecke-series-and-tate-integral-comparison-hecke-L-function-euler-product-comparison); [ArithmeticDirichletSeries layer 1 norm fibres and mathlib lseries](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries); [ArithmeticDirichletSeries layer 8 landau type positivity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity); [Ray-class product has no boundary zeros](#proof-ray-class-product-nonvanishing); [Nonnegative ray-character logarithmic coefficients](#proof-ray-character-log-coefficients); [Nonreal Hecke characters are nonzero at one](#proof-nonreal-hecke-at-one); [Positive quadratic auxiliary Euler factors](#proof-quadratic-auxiliary-positive-factors); [Auxiliary holomorphy under vanishing at one](#proof-quadratic-auxiliary-holomorphy); [Landau contradiction for a quadratic character](#proof-quadratic-landau-contradiction).

<a id="proof-ray-class-product-nonvanishing"></a>

**Ray-class product has no boundary zeros.** For the finite character group of a ray class quotient, the product of the continued Hecke L-functions has no zeros at regular points of Re s≥1. At s=1 it has meromorphic order ≤0, permitting the principal-character pole. Each Euler logarithmic coefficient is nonnegative by finite-character orthogonality, with bad-prime factors treated separately.

Here K a number field; 𝔪 a modulus (an integral ideal times a set of real places); χ a character of the ray class group Cl_𝔪(K) (finite order), identified with a finite-order idele-class character ω_χ by GlobalNumberFields Layer 9; L(s, χ) = Σ_{(𝔞,𝔪)=1} χ(𝔞)N𝔞^{−s} for Re s > 1.

Expand the logarithm of the convergent Euler products on Re s>1. Use finite-character orthogonality, separately planned below, to obtain nonnegative coefficients. Apply the Hecke boundary adapter with the single principal-character pole and holomorphy of every other factor.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §3.3, Theorem 3.7 and (3.3.1), printed p. 19.

<a id="proof-ray-character-log-coefficients"></a>

**Nonnegative ray-character logarithmic coefficients.** For a finite abelian ray-class quotient H and its full complex character group Ĥ, for h∈H and an integer k≥1, Σ_{χ∈Ĥ}χ(h^k) is #H if h^k=1 and 0 otherwise. On Re s>1 the contribution of an allowed prime ideal 𝔭 to log ∏_χL(s,χ) is Σ_{k≥1}(Σ_χχ([𝔭]^k))/k · N𝔭^(−ks). Thus these logarithmic coefficients are nonnegative after norm regrouping, with bad primes omitted consistently.

Use the actual finite abelian ray quotient and its complete dual: sum χ(h^k)=#H when h^k=1 and0 otherwise. This orthogonality is an explicit GNF9 supplier requirement, not an inference from the special Dirichlet-character theorem. Choose the Euler logarithm that tends to0 as Re s→∞. Its prime-power expansion is absolutely locally uniformly convergent on Re s>1, includes1/k and may be interchanged with the finite character sum. Regroup nonnegative real coefficients by the positive integer norm (with coefficient0 at norm0); ideals sharing the same norm are added. A common finite modulus removes the same bad prime set for every character, including the principal one.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §3.3 Theorem3.7 p.19 equation(3.3.1), corrected by the normalization convention.

<a id="proof-nonreal-hecke-at-one"></a>

**Nonreal Hecke characters are nonzero at one.** For a finite-order ray character χ with χ≠χ̄, its canonical L(1,χ) is nonzero.

Match conjugation of the continued Hecke functions at real s=1; the distinct χ and χ̄ factors have the same positive zero order if either vanishes. All nonprincipal factors are holomorphic at1 and the principal incomplete factor has exactly one pole of order1 (its deleted local polynomials are nonzero at1). Thus the full ray product would have total order≥1. The existing ray-product Landau corollary prohibits a zero at1 and therefore prohibits that positive total order. This argument does not require Artin holomorphy.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §3.4 Theorem3.10 p.19 full proof.

<a id="proof-quadratic-auxiliary-positive-factors"></a>

**Positive quadratic auxiliary Euler factors.** For a nonprincipal quadratic Hecke character χ, Ψ(s)=L(s,χ)ζ_K(s)/ζ_K(2s) has, on Re s>1, local factors (1+x)/(1−x) when χ(p)=1, 1 when χ(p)=−1, and1+x at omitted character primes, x=(Np)^−s. Hence its norm-regrouped Dirichlet coefficients are nonnegative.

At every p put x=(Np)^−s. The ζ_K(s)/ζ_K(2s) factor is1+x. Multiply by1/(1−χ(p)x), taking χ(p)=0 at character-conductor primes. This gives (1+x)/(1−x),1,1+x in the split/inert/conductor cases. The respective power series have coefficients1+2Σ_{k≥1}x^k,1,1+x. Every coefficient is real nonnegative and the unit-ideal coefficient is1. Multiply finite products using unique ideal factorization, then pass to absolute convergence and sum the finite norm fibres. The construction uses the full ζ_K quotient; the source instead deletes the common level primes in its principal L-functions. Retaining1+x at omitted character primes is the correct full-zeta generalization.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §3.4 Theorem3.11 p.20 displayed quadratic auxiliary product.

<a id="proof-quadratic-auxiliary-holomorphy"></a>

**Auxiliary holomorphy under vanishing at one.** If L(1,χ)=0 for the preceding quadratic character, Ψ extends holomorphically to Re s>1/2. Indeed ζ_K(2s) is nonzero there because Re(2s)>1, and the numerator’s zero cancels ζ_K’s pole at1. At s=1/2, Ψ extends with a zero of order at least1.

L(s,χ) is entire for nonprincipal finite-order χ; ζ_K has only its simple pole at1. Under L(1,χ)=0 the numerator therefore extends holomorphically there. For Re s>1/2 the denominator ζ_K(2s) is nonzero by its convergent Euler product, so the quotient is holomorphic. The reciprocal of ζ_K(2s) has a simple zero at s=1/2 with leading coefficient2/Res_{u=1}ζ_K(u). The numerator is holomorphic at1/2, hence the quotient is holomorphic there and vanishes, with order≥1 unless it is locally identically zero. The original Euler product shows it is not identically zero. No nonzero numerator value or simple quotient zero is presumed.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §3.4 Theorem3.11 p.20 pole-cancellation paragraph.

<a id="proof-quadratic-landau-contradiction"></a>

**Landau contradiction for a quadratic character.** For a nonprincipal quadratic Hecke character χ, L(1,χ)≠0. If it vanished, the nonnegative Dirichlet series of Ψ from Layer 2/quadratic-auxiliary-positive-factors would have abscissa≤1/2 by ADS8 Landau and Layer 2/quadratic-auxiliary-holomorphy holomorphy. For every real σ>1/2 its value would then satisfy Ψ(σ)≥1, while Layer 2/quadratic-auxiliary-holomorphy gives lim_{σ↓1/2}Ψ(σ)=0, a contradiction. No convergence or sum identity at σ=1/2 is required.

The series converges for Re s>1, so its abscissa is not +∞. If its finite abscissa a were>1/2, Landau would force a singularity at the real point a, contradicting Layer 2/quadratic-auxiliary-holomorphy. An abscissa of −∞ already supplies all these real convergence points. Hence the abscissa is≤1/2. For each real σ>1/2, use the canonical continued-series identity on the connected half-plane and nonnegative coefficients with unit coefficient1 to prove Ψ(σ)≥1. Continuity of the holomorphic extension at1/2 gives its right limit0. For σ sufficiently close to1/2 this contradicts Ψ(σ)≥1. The proof never uses a boundary series sum or an unjustified boundary-convergence claim.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §3.4 Theorem3.11 p.20 complete proof and §2.1 Theorem2.4 p.12 proof.

<a id="uniform-finite-order-hecke-convexity-primitive-hecke-convexity"></a>

### 2.22 Uniform finite-order Hecke convexity

Let chi be a primitive finite-order Hecke character over a degree-n number field K, Q=D_K*N(f_chi), 0<r<=1/2, and -r<=sigma<=1+r. For s=sigma+it with chi nontrivial or s≠1, |L_f(s,chi)| << |(1+s)/(1-s)|^delta(chi) * zeta_Q(1+r)^n * (Q*(3+|t|)^n/(2*pi)^n)^((1+r-sigma)/2), with an absolute implied constant. Define the pole factor to be |(1+s)/(1-s)| for the trivial character, and 1 for every nontrivial character (including at s=1); zeta_Q means the Riemann zeta function.

The proof proceeds as follows. Use the primitive completed functional equation and the absolutely convergent right-edge bound. Apply the pole-cleared Phragmén–Lindelöf theorem with the displayed strip and height; retain the principal-character pole factor.

The result must also satisfy these compatibility requirements: The trivial character at s=1 is outside this finite-value inequality; do not interpret its meromorphic pole via totalized division. Nontrivial characters may be evaluated at s=1.

See [Jesse Thorner and Asif Zaman — An explicit bound for the least prime ideal in the Chebotarev density theorem](https://msp.org/ant/2017/11-5/ant-v11-n5-p04-p.pdf), Lemma2.3 [Rademacher 1959], unnumbered bound, printed p.1142.

*Needs:* [Primitive Hecke functional-equation normalization](#primitive-hecke-functional-equation-normalization-hecke-primitive-functional-equation).

<a id="logarithmic-functional-equation-at-zero-and-one-quadratic-hecke-log-functional-equation"></a>

### 2.23 Logarithmic functional equation at zero and one

Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For ell_j=L_f prime(j,eta)/L_f(j,eta), both denominators are nonzero and ell_0+ell_1=-log Q+g*(gamma+log(2*pi)), where gamma is Euler constant. Differentiate the completed functional equation; Gamma_R prime/Gamma_R at 1 and 2 sum to -gamma-log(2*pi). Nonvanishing at 0 follows from the functional equation and L_f(1)>0. Each real local component of η is the sign character, so the conductor-normalized completion is Q^(s/2) Γ_R(s+1)^g L_f(s,η), with Γ_R(s)=π^(−s/2)Γ(s/2). This odd archimedean formula is not asserted for a real quadratic extension of a totally real field.

Assume E/F is the CM quadratic extension specified in the statement; η is defined through global Artin reciprocity, rather than an arbitrary quadratic character.; g and ε are fixed before varying E; implied constants depend only on those stated parameters.

The proof proceeds as follows. Import AutomorphicLFunctionsAndLocalFactors Layer 1’s CM quadratic completion and cm-logarithmic-gamma-correction, rather than re-plan the CM completion. Differentiate the imported functional equation and evaluate at0 and1 after proving both endpoint values nonzero; this comparison exports the endpoint sum for the finite Hecke factor. Use the gamma logarithmic derivatives at 1 and 2; keep the conductor Q separate from D_E until their arithmetic identification.

The result must also satisfy these compatibility requirements: For E=ℚ(i), F=ℚ, Q=4: L_f(0,η)=1/2 and L_f(1,η)=π/4; the claimed sum becomes γ+log(π/2). Exclude E=ℚ(√2), F=ℚ: its even primitive character χ_8 has L_f(0,χ_8)=0, so the displayed logarithmic quotient at 0 is undefined.

See [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Derived from Thorner-Zaman (2-3)-(2-6), odd gamma factors; [Jesse Thorner and Asif Zaman — An explicit bound for the least prime ideal in the Chebotarev density theorem](https://msp.org/ant/2017/11-5/ant-v11-n5-p04-p.pdf), (2-3)–(2-7), printed pp.1140–1141; specialized using CM sign characters.

*Needs:* [Quadratic zeta factorization and the residue quotient](#quadratic-zeta-factorization-and-the-residue-quotient-quadratic-zeta-factorization); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters); [ClassFieldTheory layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity); AutomorphicLFunctionsAndLocalFactors AL.1 — hecke-l-functional-equation; [Primitive Hecke functional-equation normalization](#primitive-hecke-functional-equation-normalization-hecke-primitive-functional-equation); [ClassFieldTheory layer 13 norm theorems and class fields](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields); [GlobalNumberFields layer 10 archimedean characters infinity types and cyclotomic arithmetic](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic); AutomorphicLFunctionsAndLocalFactors AL.1 — cm-quadratic-completion; AutomorphicLFunctionsAndLocalFactors AL.1 — cm-logarithmic-gamma-correction; [Quadratic Hecke value as residue quotient](#proof-quadratic-residue-quotient).

<a id="hecke-cm-partial-zeta-identity-cm-partial-zeta-period"></a>

### 2.24 Hecke CM partial-zeta identity

For fundamental D<0, π^(−s)Γ(s)ζ_A(s)=(2^s/ω_D)|D|^(−s/2)E*(z_A,s), initially Re(s)>1 then by continuation. Here K=ℚ(√D), A is an ordinary ideal class, z_A is its associated CM lattice point in the upper half-plane, and ω_D=|O_K^×|/2 (thus ω_−4=2 and ω_−3=3). Here E(z,s)=(1/2)∑_(gcd(c,d)=1) (Im z)^s/|cz+d|^(2s) on Re s>1, and E*(z,s)=π^(−s)Γ(s)ζ(2s)E(z,s).

The proof proceeds as follows. Identify integral ideals in A with the CM lattice quotient, including the exact unit stabilizer. Match E* and the gamma/discriminant normalization on Re s>1.

The result must also satisfy these compatibility requirements: For D=−4 use ω_D=2, not the full unit count 4; for D=−3 use ω_D=3. Match the primitive Eisenstein half-sum convention before comparing constants.

See [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §7 (7.1), printed p.970; the half-unit convention is ω_D=|O_Kˣ|/2.

*Needs:* [Partial ideal zeta series](#partial-ideal-zeta-series-partial-ideal-zeta); [Ideal-character Hecke L-function](#ideal-character-hecke-l-function-class-character-lseries-comparison); GeometryOfNumbersAndQuadraticArithmetic GN.3; AutomorphicSpectralTheory AS.1 — dit-57; AutomorphicSpectralTheory AS.1 — dit-58; AutomorphicSpectralTheory AS.2 — dit-59; AutomorphicSpectralTheory AS.2 — dit-60.

<a id="hecke-positive-sign-real-quadratic-formula-real-even-partial-zeta-period"></a>

### 2.25 Hecke positive-sign real quadratic formula

For fundamental D>1, π^(−s)Γ(s/2)²D^(s/2)(ζ_A+ζ_{JA})=2∫_{C_A}E*(z,s)ds, initially Re(s)>1 and then by continuation. The proof divides by the full norm-one unit action. Here K=ℚ(√D), A∈Cl^+(K), J is the narrow class of a principal ideal generated by an element of negative norm, and C_A is the oriented quadratic geodesic modulo the full norm-one unit group. With ε_D the least norm-one unit greater than 1, its arc length is 2 log ε_D. Here E(z,s)=(1/2)∑_(gcd(c,d)=1) (Im z)^s/|cz+d|^(2s) on Re s>1, and E*(z,s)=π^(−s)Γ(s)ζ(2s)E(z,s). The integration measure denoted ds in the displayed formula is hyperbolic arc length y^(−1)|dz|, not the complex variable s.

The proof proceeds as follows. Unfold along the compact real quadratic geodesic and divide by the full norm-one unit action. Sum the A and JA branches; match arc length and the even gamma factor.

See [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (7.2), p.970 (Hecke; a cited result, 'He showed').

*Needs:* [Partial ideal zeta series](#partial-ideal-zeta-series-partial-ideal-zeta); [Ideal-character Hecke L-function](#ideal-character-hecke-l-function-class-character-lseries-comparison); GeometryOfNumbersAndQuadraticArithmetic GN.3; AutomorphicSpectralTheory AS.1 — dit-57; AutomorphicSpectralTheory AS.1 — dit-58; AutomorphicSpectralTheory AS.2 — dit-59; AutomorphicSpectralTheory AS.2 — dit-60.

<a id="genus-hecke-factorization-genus-lseries-factorization"></a>

### 2.26 Genus Hecke factorization

(p.971.) Let D = d'd ≠ 1 be a fundamental discriminant, with d' and d fundamental discriminants (hence coprime), K = Q(√D), and χ the associated genus character of Cl^+(K). Either factor may be the trivial discriminant 1. For D > 0, χ(J) = sign d = sign d'. Kronecker's decomposition holds: L(s,χ) = L(s,χ_{d'})L(s,χ_d). Equivalently Λ_DIT(s,χ) = Λ_DIT(s,χ_{d'})Λ_DIT(s,χ_d), with the genus completion as in (7.4)–(7.5) and the Dirichlet completion fixed in the conventions by (5.13).

The proof proceeds as follows. Reuse the genus character on the narrow class group and its coprime-ideal evaluation. Compare Euler factors at split, inert and every ramified prime; continue only after the convergent identity.

The result must also satisfy these compatibility requirements: The field discriminant excludes D=1; this does not exclude a factor discriminant equal to1 in a genus decomposition.

See [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §7, 'Genus characters', p.971, the unnumbered sentence between (7.7) and (7.8).

*Needs:* [Ideal-character Hecke L-function](#ideal-character-hecke-l-function-class-character-lseries-comparison); `TauCeti.Multiquadratic.genusCharFunNarrowClassGroupHom`.

<a id="hecke-negative-sign-real-quadratic-formula-real-odd-partial-zeta-period"></a>

### 2.27 Hecke negative-sign real quadratic formula

For fundamental D>1, π^(−s)Γ((s+1)/2)²D^(s/2)(ζ_A−ζ_{JA})=2∫_{C_A}i∂_zE*(z,s)dz, initially Re(s)>1 and then by continuation. This is the odd archimedean branch, with an oriented differential rather than arc length. Here K=ℚ(√D), A∈Cl^+(K), J is the narrow class of a principal ideal generated by an element of negative norm, and C_A is the oriented quadratic geodesic modulo the full norm-one unit group. With ε_D the least norm-one unit greater than 1, its arc length is 2 log ε_D. Here E(z,s)=(1/2)∑_(gcd(c,d)=1) (Im z)^s/|cz+d|^(2s) on Re s>1, and E*(z,s)=π^(−s)Γ(s)ζ(2s)E(z,s). The orientation is the quadratic-class orientation used in DIT §7; reversing it changes the sign of the differential integral.

The proof proceeds as follows. Unfold the oriented differential i∂_zE* dz over the full norm-one unit quotient. Take the A−JA difference and retain Γ((s+1)/2)^2, rather than the even gamma factor.

See [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §7 (7.3), printed p.970; full norm-one-unit geodesic convention.

*Needs:* [Partial ideal zeta series](#partial-ideal-zeta-series-partial-ideal-zeta); [Ideal-character Hecke L-function](#ideal-character-hecke-l-function-class-character-lseries-comparison); GeometryOfNumbersAndQuadraticArithmetic GN.3; AutomorphicSpectralTheory AS.1 — dit-57; AutomorphicSpectralTheory AS.1 — dit-58; AutomorphicSpectralTheory AS.2 — dit-59; AutomorphicSpectralTheory AS.2 — dit-60.

<a id="imaginary-quadratic-class-number-value-at-zero-imaginary-quadratic-lvalue-zero"></a>

### 2.28 Imaginary quadratic class-number value at zero

With the same imaginary quadratic data, the canonical continued primitive Dirichlet function satisfies L(0,ε_D)=h/u.

The proof proceeds as follows. Use the canonical root-number-one continuation from imaginary_quadratic_root_number_one, not a pointwise product at a gamma pole. At0 and1 the gamma factors are regular; Γ(1/2)=√π andΓ(1)=1 give Λ_std(0)=√δ L(0) andΛ_std(1)=(δ/π)L(1). Insert L(1)=πh/(u√δ) from imaginary_quadratic_lvalue_one, obtaining L(0)=h/u. Both gamma values are library declarations.

The result must also satisfy these compatibility requirements: D=−4 gives L(0,ε_−4)=1/2; D=−3 gives L(0,ε_−3)=1/3. For D=−15, h=2,u=1, hence L(0,ε_−15)=2. This is for odd characters from negative fundamental discriminants. An even nontrivial quadratic character has a trivial zero at0 and cannot satisfy this formula.

See [Benedict H. Gross, Don B. Zagier — Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), ChapterIV§4 pp.283–284, implicit special-value substitution.

*Needs:* [Imaginary quadratic completion and root number](#imaginary-quadratic-completion-and-root-number-imaginary-quadratic-root-number-one); [Imaginary quadratic class-number value at one](#imaginary-quadratic-class-number-value-at-one-imaginary-quadratic-lvalue-one); `Complex.Gamma_one`; `Complex.Gamma_one_half_eq`.

<a id="global-meromorphic-artin-continuation-brauer-meromorphic-continuation"></a>

### 2.29 Global meromorphic Artin continuation

Every finite-image complex Artin Euler series has a meromorphic continuation to C obtained from an integral Brauer expression as a finite product of integer powers of canonical Hecke continuations. This asserts global meromorphy, not Artin holomorphy.

The proof proceeds as follows. Use the existing integral Brauer, elementary-nilpotent, nilpotent-monomial and induction-transitivity declarations specified in [Prerequisites and boundaries](#prerequisites-and-boundaries) and [From RepresentationTheory](#from-representationtheory) to write χ_ρ=Σ_j n_j Ind_{H_j}^G χ_j with n_j∈ℤ and χ_j one-dimensional. Apply Layer 2/artin-direct-sum-factor, Layer 2/artin-induction-factor and Layer 2/artin-linear-hecke-comparison to the character identity on Re s>1, obtaining a finite product of integer powers of canonical meromorphic Hecke continuations. Nonzero right-half-plane values ensure none of the denominator factors is identically zero. Use the identity theorem to identify this meromorphic continuation independently of the chosen integral expression. Negative coefficients may introduce poles away from1, so no Artin holomorphy conclusion follows. Rational coefficients give only a meromorphic power and cannot replace this proof.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.5 boundary result; integral monomial induction is supplied by the current Tau Ceti declarations listed in the boundary section; [J.S. Milne — Class Field Theory](https://www.jmilne.org/math/CourseNotes/CFT.pdf), ChapterVIII§10 Artin L-series, pp.261–262.

*Needs:* [Artin local polynomial](#artin-local-polynomial-artin-local-polynomial); [NumberFieldArithmetic layer 1 the splitting dictionary](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary); [NumberFieldArithmetic layer 2 frobenius elements and the artin symbol](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol); [RepresentationTheory/InductionRestriction layer 3 the mackey decomposition formula](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula); [Artin Euler series](#artin-euler-series-artin-euler-series); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); [ArithmeticDirichletSeries layer 1 norm fibres and mathlib lseries](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries); [ArithmeticDirichletSeries layer 3 local factors and euler products](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products); [Hecke series and Tate integral comparison](#hecke-series-and-tate-integral-comparison-hecke-L-function-euler-product-comparison); [ClassFieldTheory layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity); [ClassFieldTheory layer 7 the absolute local artin map its normalizations and conductors](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors); [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters); [RepresentationTheory/InductionRestriction layer 6 the virtual character ring artin and brauer induction](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction); [Primitive Hecke functional-equation normalization](#primitive-hecke-functional-equation-normalization-hecke-primitive-functional-equation); [Absolute convergence of Artin factors](#proof-artin-absolute-convergence); [Induction identity including ramification](#proof-artin-induction-factor); [Linear Artin factors are Hecke factors](#proof-artin-linear-hecke-comparison); [Uniform finite Artin factor bound](#proof-artin-local-reciprocal-bound); [Ramified local Artin induction identity](#proof-artin-ramified-induction-polynomial).

<a id="proof-artin-absolute-convergence"></a>

**Absolute convergence of Artin factors.** For fixed dimension d and ε>0, uniformly on Re s≥1+ε, the local factors satisfy |P_p((Np)^−s)^−1−1|≤C_{d,ε}(Np)^−Re s. Their product converges absolutely and locally uniformly and is nonzero there.

Apply artin-local-reciprocal-bound with θ=2^(−1−ε) and t=(Np)^−Re s. Since Np≥2, all local factors and their reciprocal partial products stay nonzero and their deviations from1 have a common summable majorant C_{d,ε}(Np)^−1−ε. Prime ideals are a subset of the nonzero ideals; the full Dedekind series converges at1+ε. For the coefficient series, use the d-fold convolution majorant described in Layer 2/plan/artin-euler-series, whose ideal sum is ζ_K(1+ε)^d, including d=0. ADS3 supplies the absolute/unordered product-to-series limit after these hypotheses. Summability of deviations gives a locally uniform product and summability for the reciprocal factors; the limit is nonzero. Dependence of the global bound on K is allowed, while the displayed local constant depends only on d,ε.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.2 p.128 absolute convergence paragraph.

<a id="proof-artin-induction-factor"></a>

**Induction identity including ramification.** For H⊆G and a complex finite-dimensional representation σ of H, with F=L^H, L_K(s,Ind_H^G σ)=L_F(s,σ) on Re s>1, including all ramified local factors.

Apply the ramified local induction polynomial identity at every prime p of K. The residue norm identity Nq=(Np)^f(q/p) matches every right-hand norm variable exactly. Evaluate the finite local determinant identity at T=(Np)^−s, then rearrange the absolutely convergent prime products from Layer 2/artin-absolute-convergence. This is representation induction on H=Gal(L/F), including nonnormal F/K.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.5 Theorem22.4 sketch p.129.

<a id="proof-artin-linear-hecke-comparison"></a>

**Linear Artin factors are Hecke factors.** For L/K finite Galois and a one-dimensional finite-order character χ:Gal(L/K)→C×, composition with the arithmetic global Artin map gives the canonical primitive finite-order Hecke character η. On Re s>1, the full Artin Euler series equals its full Hecke L-function. At p where χ is trivial on inertia both factors are (1−χ(Frob_p)(Np)^−s)^−1; otherwise both are1. The conductor and archimedean signs come from the same local/global reciprocity dictionary.

Compose χ with the existing globalArtinMap, using its principal-ideles triviality and local compatibility; obtain the existing GNF9 finite-order primitive character, with its real-place sign from CFT11. CFT7 characterConductorExp and its unramified criterion identify local conductor exponent0 exactly with inertia-triviality. Compare the arithmetic Frobenius local value at those primes; at positive conductor exponent both local factors are1. Evaluate absolutely convergent products and use the existing Hecke Euler comparison. Do not use an arbitrary imprimitive modulus to erase extra primes or invert the arithmetic Artin normalization.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.5 Theorem22.4 sketch p.129.

<a id="proof-artin-local-reciprocal-bound"></a>

**Uniform finite Artin factor bound.** For d∈N,0≤m≤d,0≤t≤θ<1 and α₁,…,α_m∈C with |α_j|=1, put A(z)=∏_{j=1}^m(1−α_j z). For |z|=t, A(z)≠0, |A(z)^−1|≤(1−θ)^−d and |A(z)^−1−1|≤d t(1−θ)^−d. The assertion includes d=m=0.

Each |1−α_j z|≥1−t≥1−θ>0, so every reciprocal factor exists and has norm≤(1−θ)^−1. Telescope the reciprocal finite product: the jth term has one factor difference α_j z/(1−α_j z) and at most m−1 preceding factors. Each term is bounded by t(1−θ)^−m, and summing gives m t(1−θ)^−m≤d t(1−θ)^−d. For a finite-order invariant-space automorphism, every characteristic root satisfies α^N=1 for a positive group exponent N, so |α|=1. The polynomial splits over C. This supplies the local factor hypotheses without choosing a new representation carrier.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.2 p.128 local O(p^−s) estimate.

<a id="proof-artin-ramified-induction-polynomial"></a>

**Ramified local Artin induction identity.** For L/K finite Galois with group G,H≤G,F=L^H and σ a finite-dimensional complex representation of H, at every nonzero prime p of K, P_{p,Ind_H^Gσ}(T)=∏_{q|p in F}P_{q,σ}(T^{f(q/p)}). The right polynomials are defined from Gal(L/F)=H, their own inertia invariants and arithmetic Frobenius modulo inertia.

Fix P of L above p and its groups I⊲D. Match the primes q of F above p with H\G/D by NumberFieldArithmetic1.4, and use Mackey3a to split the induced representation restricted to D. In each Mackey summand, take I-invariants. Frobenius permutes the inertia-orbit blocks in cycles of length f(q/p). The cycle return map is the relative Frobenius on the appropriate conjugated σ-invariant space, with independence only modulo inertia at a ramified prime. The determinant of I−T times a cyclic block with return map A and cycle length f is det(I−T^f A). Multiply these blocks. The required ramified Frobenius/invariant-space and cyclic-block adapters are explicit open parts of the Artin gap; unramified automorphism equality is insufficient.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.5 Theorem22.4 sketch p.129; full ramified local identity is a required expansion.

<a id="imprimitive-hecke-deleted-factors-imprimitive-hecke-factors"></a>

### 2.30 Imprimitive Hecke deleted factors

Let χ be the ray ideal character modulo a modulus m induced from a primitive finite-order Hecke character χ₀ of conductor f₀ dividing m. If m_fin is the finite part, then L_m^cont(s,χ)=L^cont(s,χ₀)∏_{p|m_fin, p∤f₀_fin}(1−χ₀(p)exp(−s log Np)). Each prime occurs once even if its exponent in m grows; real-place conditions enter the conductor dictionary but do not delete finite Euler factors. Equality is meromorphic.

The proof proceeds as follows. Import the GlobalNumberFields ray-character/conductor dictionary and the primitive half-plane Hecke Euler-product comparison. In the absolutely convergent half-plane Re s>1, remove exactly the Euler factors for finite primes dividing m but not f₀. Finite multiplicative regrouping retains one factor per prime. Apply uniqueness of meromorphic continuation, keeping the possible trivial-character pole at 1 and removable zeros of the finite correction.

The result must also satisfy these compatibility requirements: For K=Q and primitive trivial character, agree with Mathlib’s principal-character finite Euler correction. Changing a finite modulus p to p² deletes the same single factor; an added real place creates no new finite prime factor.

See [John Tate — Fourier analysis in number fields and Hecke's zeta-functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.5, scan p.57, Euler product over finite primes outside S.

*Needs:* [Primitive Hecke functional-equation normalization](#primitive-hecke-functional-equation-normalization-hecke-primitive-functional-equation); [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters); [Hecke series and Tate integral comparison](#hecke-series-and-tate-integral-comparison-hecke-L-function-euler-product-comparison).

<a id="sign-of-the-quadratic-gauss-sum-from-the-dedekind-functional-equation-quadratic-gauss-sum-sign"></a>

### 2.31 Sign of the quadratic Gauss sum from the Dedekind functional equation

Let D ≠ 1 be a fundamental discriminant, δ = |D|, ε_D the primitive quadratic Dirichlet character of conductor δ attached to ℚ(√D), and κ(D) = 1 if D > 0, κ(D) = i if D < 0. Then (i) DirichletCharacter.rootNumber ε_D = 1; equivalently (ii) the Gauss sum Σ_{n mod δ} ε_D(n) e(n/δ) equals κ(D) δ^{1/2}, and for every integer r, Σ_{n mod δ} ε_D(n) e(rn/δ) = ε_D(r) κ(D) δ^{1/2} (zero when gcd(r,δ) > 1); (iii) if D is odd and gcd(R,δ) = 1, then Σ_{n mod δ} e(Rn²/δ) = κ(D) δ^{1/2} ε_D(R). The representative root-number signature is `rootNumber_eq_one_of_isPrimitive_of_sq_eq_one`.

Assume D a fundamental discriminant, D ≠ 1; in (iii) D odd (so δ is squarefree) and gcd(R, δ) = 1.

The proof proceeds as follows. K = ℚ(√D): ζ_K(s) = ζ(s) L(s, ε_D) on Re s > 1 (quadratic zeta factorization of this layer), and both sides continue meromorphically. The completed Dedekind function of K is invariant under s ↦ 1 − s with root number 1 (Dedekind continuation of this layer, from AL.1), and so is the completed Riemann zeta function (Mathlib completedRiemannZeta_one_sub). Their quotient is the completed L-function of ε_D with gamma factor Γ_ℝ(s + a), a = 0 or 1 by parity, so it is invariant as well; comparing with Mathlib’s functional equation IsPrimitive.completedLFunction_one_sub, whose factor is rootNumber ε_D (ε_D⁻¹ = ε_D), and using that the completed function is not identically zero, gives rootNumber ε_D = 1. The imaginary case is the root-number target of this layer. By Mathlib’s definition rootNumber χ = gaussSum χ / I^a / N^{1/2}, (i) is the first statement of (ii); the shifted sums follow from gaussSum_mulShift_of_isPrimitive, which holds for every residue, unit or not. (iii) For squarefree odd δ, the number of square roots of m modulo δ is Π_{p|δ}(1 + (m/p)); expanding over the divisors of δ, only the full product survives, and it gives the shifted Gauss sum of ε_D at R.

The result must also satisfy these compatibility requirements: D = −4: Σ_{n mod 4} ε_{−4}(n) e(n/4) = i − (−i) = 2i = κ(−4)·4^{1/2}. D = 5: the Gauss sum is √5 (positive), not −√5. D = −3, R = 1: Σ_{n mod 3} e(n²/3) = 1 + 2e(1/3) = i√3. The sign is the content: Tau Ceti and Mathlib give only the square of the Gauss sum or its modulus.

See [Benedict H. Gross, Don B. Zagier — Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), Chapter IV, §2, proof of (2.3), p. 275; §3, proof of (3.2), p. 278; [Benedict H. Gross, Don B. Zagier — Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), items Gross–Zagier and /197 and the review REV-Gross–Zagier.

*Needs:* [Quadratic zeta factorization and the residue quotient](#quadratic-zeta-factorization-and-the-residue-quotient-quadratic-zeta-factorization); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); [Imaginary quadratic completion and root number](#imaginary-quadratic-completion-and-root-number-imaginary-quadratic-root-number-one); `DirichletCharacter.rootNumber`; `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`; `gaussSum_mulShift_of_isPrimitive`; `completedRiemannZeta_one_sub`.

<a id="artin-continuation-near-the-line-one-artin-induction-versus-artin-holomorphy"></a>

### 2.32 Artin continuation near the line one

Let K/ℚ be finite Galois and ρ a finite-dimensional complex representation of Gal(K/ℚ). The incomplete Artin L-function, with precisely the ramified rational primes omitted, has a meromorphic continuation to an open neighbourhood of {Re(s)≥1}; it is holomorphic and nonzero on Re(s)=1 away from s=1, and its pole order at 1 is dim(V^G). This statement asserts neither global Artin holomorphy nor Chebotarev density.

Assume Finite Galois K/ℚ; finite-dimensional complex representation; arithmetic Frobenius at unramified primes; omitted-prime set fixed.

The proof proceeds as follows. Import arithmetic Frobenius and conjugacy independence from NumberFieldArithmetic Layer2. Layer 2 must supply determinant Euler factors and direct-sum/induction identities. Import finite-group Artin rational induction; after clearing denominators express an m-fold representation as a virtual sum of induced one-dimensional characters. Use ClassFieldTheory Layer 11 and GlobalNumberFields Layer 9 to identify one-dimensional factors with finite-order Hecke characters; their continuation is the completed Hecke functional equation of Layer 2 and their boundary nonvanishing, with the pole at 1 of the trivial character, is Layer 2/hecke-nonvanishing-on-line-one. On small discs about points of the line, take the m-th root agreeing with the Euler product on Re s > 1 and glue (Layer 2/mth-root-gluing). Separate the trivial summand to compute the pole order. Brauer integral induction can prove global meromorphy, whereas absence of extra poles is Artin holomorphy; the rational-root route here does not prove the global assertion.

The result must also satisfy these compatibility requirements: For the trivial representation recover ζ times the omitted local factors and a simple pole at1. For a nontrivial one-dimensional character recover the Hecke near-line result. At ramified primes the complete local factor would act on inertia invariants; an arbitrary Frobenius lift on the whole representation is invalid. No natural-density conclusion is included; that theorem belongs to Chebotarev.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Chapter22, §§22.2–22.5, Theorems22.3–22.4, printed pp.128–129.

*Needs:* [Canonical ray-character comparison and the quadratic endpoint](#canonical-ray-character-comparison-and-the-quadratic-endpoint-hecke-nonvanishing-on-line-one); `Complex.exp`; `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`; `analyticAt_clog`; `Complex.exp_eq_one_iff`; `Complex.exists_continuousOn_eqOn_exp_comp`; [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); [NumberFieldArithmetic layer 2 frobenius elements and the artin symbol](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol); [ClassFieldTheory layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity); [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters); [RepresentationTheory/InductionRestriction layer 6 the virtual character ring artin and brauer induction](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction); [Artin local polynomial](#artin-local-polynomial-artin-local-polynomial); [Artin Euler series](#artin-euler-series-artin-euler-series); `LinearMap.charpoly_prodMap`; [ArithmeticDirichletSeries layer 1 norm fibres and mathlib lseries](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries); [ArithmeticDirichletSeries layer 3 local factors and euler products](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products); [NumberFieldArithmetic layer 1 the splitting dictionary](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary); [RepresentationTheory/InductionRestriction layer 3 the mackey decomposition formula](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula); [Hecke series and Tate integral comparison](#hecke-series-and-tate-integral-comparison-hecke-L-function-euler-product-comparison); [ClassFieldTheory layer 7 the absolute local artin map its normalizations and conductors](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors); [Gluing m-th roots across the line Re s = 1](#proof-mth-root-gluing); [Analyticity of a continuous logarithm](#proof-continuous-log-analytic-upgrade); [Direct sums of Artin local factors](#proof-artin-direct-sum-factor); [Absolute convergence of Artin factors](#proof-artin-absolute-convergence); [Induction identity including ramification](#proof-artin-induction-factor); [Linear Artin factors are Hecke factors](#proof-artin-linear-hecke-comparison); [Analytic root on a nonvanishing disc](#proof-analytic-root-on-disc); [Overlaps of boundary-centred discs](#proof-boundary-disc-overlap); [Uniform finite Artin factor bound](#proof-artin-local-reciprocal-bound); [Ramified local Artin induction identity](#proof-artin-ramified-induction-polynomial).

<a id="proof-mth-root-gluing"></a>

**Gluing m-th roots across the line Re s = 1.** Let f be holomorphic and zero-free on {Re s > 1}, m ≥ 1, and U an open set containing {Re s = 1} ∖ {1} on which a holomorphic, zero-free g is given with g = f^m on U ∩ {Re s > 1}. Then f extends holomorphically (and zero-free) to {Re s > 1} ∪ U′ for an open U′ ⊇ {Re s = 1} ∖ {1}: on each disc D ⊆ U centred on the line there is a unique holomorphic h_D with h_D^m = g agreeing with f on the connected set D ∩ {Re s > 1}, and the h_D agree on overlaps.

Here Discs D centred at points of Re s = 1 with D ⊆ U; D ∩ {Re s > 1} is a nonempty half-disc, hence connected.

On the simply connected D, g has m holomorphic m-th roots, differing by m-th roots of unity; exactly one agrees with f at a point of D ∩ {Re s > 1}, hence on all of it (identity theorem on the connected half-disc). On D ∩ D′ ∩ {Re s > 1} ≠ ∅ both roots equal f, so they agree on the connected D ∩ D′ (a lens, connected) by the identity theorem.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.5, proof of Theorem 22.4, printed p. 129.

<a id="proof-artin-direct-sum-factor"></a>

**Direct sums of Artin local factors.** For ρ₁,ρ₂, P_p(ρ₁⊕ρ₂,T)=P_p(ρ₁,T)P_p(ρ₂,T) at every prime, including ramified primes. Hence L(ρ₁⊕ρ₂)=L(ρ₁)L(ρ₂) on Re s>1.

The inertia-fixed subspace of the direct sum is the direct sum of fixed subspaces by the existing invariants membership formula. Transport Frobenius to the block diagonal map. Apply LinearMap.charpoly_prodMap to the two finite endomorphisms and transport through polynomial reversal, or use the corresponding determinant block identity. Use Layer 2/artin-absolute-convergence absolute local uniform convergence to multiply the finite local identities in the directed limit of prime sets; no statement about arbitrary totalized products is used.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.2 p.128 displayed direct-sum identity.

<a id="proof-analytic-root-on-disc"></a>

**Analytic root on a nonvanishing disc.** Let D=Metric.ball(a,r)⊆C with r>0,F analytic on D and F(z)≠0 there,m∈N with m≥1,z₀∈D and w₀^m=F(z₀). There exists an analytic R on D with R(z)^m=F(z) for every z∈D and R(z₀)=w₀. Any analytic S with the same powers and value at z₀ equals R throughout D.

The nonempty open disc is simply connected. Apply the existing Complex.exists_continuousOn_eqOn_exp_comp to F and upgrade its continuous logarithm L to analytic using Layer 0/continuous-log-analytic-upgrade. Put R₀=exp(L/m). Since R₀ never vanishes and R₀(z₀)^m=F(z₀), c=w₀/R₀(z₀) has c^m=1. Define R=c R₀; it has the desired power and value without assuming an arbitrary principal-root branch. The quotient S/R is continuous and lies in the finite set of mth roots of unity. Connectedness of D makes it constant; its value1 at z₀ proves uniqueness. The finite-root/discrete-image adapter remains formal work, not a newly formalized canonical root carrier.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.5 Theorem22.4 p.129 root-gluing sketch.

<a id="proof-boundary-disc-overlap"></a>

**Overlaps of boundary-centred discs.** If two open complex discs centred on Re s=1 intersect, their intersection is connected and contains a point with Re s>1.

Each open disc is convex as a real subset of C; their intersection is convex, hence preconnected and connected when nonempty. Take z in the intersection. If Re z>1 it is the required point. If Re z<1, use z′=2−conj z; centres on Re=1 make both distances unchanged and Re z′>1. If Re z=1, choose a positive real shift smaller than min(r−|z−a|,q−|z−b|). The triangle inequality preserves both strict ball inequalities and puts the shifted point to the right.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.5 Theorem22.4 p.129 patching sentence; expanded geometric input.

<a id="bounded-degree-brauer-siegel-bounded-degree-brauer-siegel"></a>

### 2.33 Bounded-degree Brauer-Siegel

For number fields of bounded degree and discriminant D tending to infinity, log(h_K R_K)=(1/2+o(1)) log D. Keep fixed-degree uniformity and possible ineffectivity explicit. The representative hR comparison is `bounded_degree_brauer_siegel`.

The proof proceeds as follows. Use the bounded-degree Brauer–Siegel/Siegel theorem without adding normality. Apply the real analytic class-number formula; finite adjustment handles bounded discriminants.

See [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), 2.2, p. 382; proof of Corollary 3.3, p. 384; [4].

*Needs:* [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); [Explicit residue bound for Dedekind zeta functions (Louboutin)](#explicit-residue-bound-for-dedekind-zeta-functions-louboutin-louboutin-dedekind-residue-upper); [Global meromorphic Artin continuation](#global-meromorphic-artin-continuation-brauer-meromorphic-continuation); `NumberField.dedekindZeta_residue`; `NumberField.classNumber`; `NumberField.Units.regulator`.

<a id="two-sided-subpolynomial-values-at-one-artin-value-one-subpower"></a>

### 2.34 Two-sided subpolynomial values at one

Fix g≥1. Let E be any degree2g CM field, L its normal closure over Q (not an arbitrary Galois overfield), G=Gal(L/Q), and c the central complex conjugation. Let F(E) be the finite set of isomorphism classes of nontrivial irreducible complex G-representations ρ satisfying ρ(c)=−Id. Then |G|≤M_g=(2g)!, |F(E)|≤M_g and dim ρ≤M_g. All constants below are uniform in E and ρ∈F(E). The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value≤B_g; the trivial factor is separated before evaluation at1. For each ρ∈F(E), import an integral monomial Brauer expression χ_ρ=Σ_(j∈J)n_j Ind_(H_j)^G ψ_j with one-dimensional finite-order ψ_j, Σ_j|n_j|≤B_g, |J|≤B_g and [L^(H_j):Q]≤M_g. Bound each Hecke analytic conductor (including the base-field discriminant) by D_E^C_g, with D_E=|Disc(E)|. For δ_j=1 if ψ_j is trivial and0 otherwise, take the holomorphic, nonzero extension H_j(s) of (s−1)^δ_j L(s,ψ_j) at1. Prove Σ_j n_jδ_j=0 and the local germ identity L(s,ρ)=∏_j H_j(s)^n_j. For every ε>0 there is C_(g,ε)>0 such that |L(1,ρ)|≤C_(g,ε)D_E^ε and |L(1,ρ)|⁻¹≤C_(g,ε)D_E^ε. The constants may be ineffective. Continued L-functions are required to match the all-prime Euler series on Re s>1 and be analytic, nonzero at1.

Assume Same finite family; no general Artin-holomorphy assumption.; Import fixed-degree regularized Hecke endpoint bounds in both directions, including positive residues of trivial factors; the exact source and proof obligation is retained.

The proof proceeds as follows. For each ρ∈F(E), import an integral monomial Brauer expression χ_ρ=Σ_(j∈J)n_j Ind_(H_j)^G ψ_j with one-dimensional finite-order ψ_j, Σ_j|n_j|≤B_g, |J|≤B_g and [L^(H_j):Q]≤M_g. Bound each Hecke analytic conductor (including the base-field discriminant) by D_E^C_g, with D_E=|Disc(E)|. For δ_j=1 if ψ_j is trivial and0 otherwise, take the holomorphic, nonzero extension H_j(s) of (s−1)^δ_j L(s,ψ_j) at1. Prove Σ_j n_jδ_j=0 and the local germ identity L(s,ρ)=∏_j H_j(s)^n_j. Use fixed-degree subpower upper and reciprocal bounds for the regularized Hecke values. Apply them with exponent ε/(C_g B_g), then the finite signed product gives both inequalities. No absolute value of a separate trivial pole is used.

See [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Proof of Corollary 3.3, p. 384; [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Theorem3.2 and proof of Corollary3.3, printed pp.383–384.

*Needs:* [Artin Euler series](#artin-euler-series-artin-euler-series); [Artin local polynomial](#artin-local-polynomial-artin-local-polynomial); [NumberFieldArithmetic layer 1 the splitting dictionary](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary); [NumberFieldArithmetic layer 2 frobenius elements and the artin symbol](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol); [RepresentationTheory/InductionRestriction layer 3 the mackey decomposition formula](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); [ArithmeticDirichletSeries layer 1 norm fibres and mathlib lseries](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries); [ArithmeticDirichletSeries layer 3 local factors and euler products](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products); [Hecke series and Tate integral comparison](#hecke-series-and-tate-integral-comparison-hecke-L-function-euler-product-comparison); [ClassFieldTheory layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity); [ClassFieldTheory layer 7 the absolute local artin map its normalizations and conductors](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors); [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters); [Canonical ray-character comparison and the quadratic endpoint](#canonical-ray-character-comparison-and-the-quadratic-endpoint-hecke-nonvanishing-on-line-one); [Sufficient conductor-discriminant estimate](#sufficient-conductor-discriminant-estimate-artin-conductor-bound); [RepresentationTheory/InductionRestriction layer 6 the virtual character ring artin and brauer induction](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction); [Absolute convergence of Artin factors](#proof-artin-absolute-convergence); [Induction identity including ramification](#proof-artin-induction-factor); [Linear Artin factors are Hecke factors](#proof-artin-linear-hecke-comparison); [Uniform finite Artin factor bound](#proof-artin-local-reciprocal-bound); [Ramified local Artin induction identity](#proof-artin-ramified-induction-polynomial).

<a id="a-fixed-small-circle-gives-a-subpolynomial-derivative-quadratic-hecke-cauchy-derivative"></a>

### 2.35 A fixed small circle gives a subpolynomial derivative

Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For fixed g and every epsilon>0, |L_f prime(1,eta_E/F)| <<_(g,epsilon) D_E^epsilon. Set r=min(epsilon,1/4)>0. The closed circle |s-1|=r is in [-r,1+r] in real part, |t|<=r, and the convexity exponent is at most r. Hence its supremum is at most C_(g,r)*Q^r, and Cauchy gives |L_f prime(1)|<=C_(g,r)*Q^r/r. Holomorphy is required on the entire disk; a zero-free disk is unnecessary.

Assume E/F is the CM quadratic extension specified in the statement; η is defined through global Artin reciprocity, rather than an arbitrary quadratic character.; g and ε are fixed before varying E; implied constants depend only on those stated parameters.

The proof proceeds as follows. Choose r=min(ε,1/4), and apply the finite-order convexity bound on the complete circle |s−1|=r. Use Cauchy on the holomorphic disk, with bound Q^r/r; no zero-free disk is assumed.

See [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Cauchy-circle adapter for Tsimerman, Corollary 3.3, p.384; Thorner–Zaman Lemma 2.3, p.1142, supplies the required pole-aware convexity statement.

*Needs:* [Uniform finite-order Hecke convexity](#uniform-finite-order-hecke-convexity-primitive-hecke-convexity); [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters); [ClassFieldTheory layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity); [ClassFieldTheory layer 13 norm theorems and class fields](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields); AutomorphicLFunctionsAndLocalFactors AL.1 — hecke-l-functional-equation.

<a id="theorem3-negative-factors-negative-genus-core-period"></a>

### 2.36 Theorem3 negative factors

For s=1/2+it, coprime negative fundamental d,d′ and D=d′d>0, Λ_DIT(s,χ_d)Λ_DIT(s,χ_{d′})=(s(1−s)/2)Σ_Aχ(A)∫_{F_A}E*(z,s)dμ. First continue the compact boundary Hecke identity from Re(s)>1 to the critical line, then apply Stokes there. The raw core integral diverges when Re(s)>1 and is not its initial definition.

The proof proceeds as follows. Apply the odd compact-boundary Hecke identity and the genus Euler factorization. Continue this identity to the critical line before applying Stokes; never start from the divergent Re s>1 core integral.

See [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §5 Theorem 3, first branch, p.964; §7 (7.8), Lemma 2 (7.10)–(7.11), p.972.

*Needs:* [Hecke negative-sign real quadratic formula](#hecke-negative-sign-real-quadratic-formula-real-odd-partial-zeta-period); [Genus Hecke factorization](#genus-hecke-factorization-genus-lseries-factorization); AutomorphicSpectralTheory AS.2; GeometryOfNumbersAndQuadraticArithmetic GN.3; AutomorphicSpectralTheory AS.1 — dit-57; AutomorphicSpectralTheory AS.1 — dit-58; AutomorphicSpectralTheory AS.2 — dit-59; AutomorphicSpectralTheory AS.2 — dit-60.

<a id="theorem3-positive-factors-positive-genus-geodesic-period"></a>

### 2.37 Theorem3 positive factors

Let D > 1 be a fundamental discriminant and D = d′d a factorization into positive fundamental discriminants (equivalently, d′, d > 0 coprime fundamental discriminants with d′d > 1; then D is fundamental). Let χ be the genus character. Then Λ_DIT(s,χ_{d'})Λ_DIT(s,χ_d) = Σ_{A∈Cl^+(K)} χ(A)∫_{C_A} E*(z,s)y^{−1}|dz|, as meromorphic functions of s (7.8). On Re(s) = 1/2 this is the second case of Theorem 3, where ∫_{∂F_A} replaces ∫_{C_A}.

The proof proceeds as follows. Sum the even compact-geodesic identity against χ and use genus factorization. Identify geodesic and boundary arcs on the critical line with the imported oriented geometric conventions.

See [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Theorem 3, second case, p.964; for all s by (7.8), p.972.

*Needs:* [Hecke positive-sign real quadratic formula](#hecke-positive-sign-real-quadratic-formula-real-even-partial-zeta-period); [Genus Hecke factorization](#genus-hecke-factorization-genus-lseries-factorization); AutomorphicSpectralTheory AS.2; GeometryOfNumbersAndQuadraticArithmetic GN.3; AutomorphicSpectralTheory AS.1 — dit-57; AutomorphicSpectralTheory AS.1 — dit-58; AutomorphicSpectralTheory AS.2 — dit-59; AutomorphicSpectralTheory AS.2 — dit-60.

<a id="theorem3-cm-factors-mixed-genus-cm-period"></a>

### 2.38 Theorem3 CM factors

For coprime fundamental d,d′ of opposite sign, Λ_DIT(s,χ_d)Λ_DIT(s,χ_{d′})=(2√π/ω_D)Σ_Aχ(A)E*(z_A,s), as a meromorphic identity. Here D=dd′<0, the sum is over ordinary ideal classes of ℚ(√D), χ is the genus character, and ω_D=|O_K^×|/2 as in the CM partial-zeta comparison; use the same E* normalization.

The proof proceeds as follows. Sum the CM point partial-zeta identity against the genus character. Match the two Dirichlet gamma factors and the unit factor 2√π/ω_D.

See [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Theorem 3, third case, p.964 (Re(s) = 1/2); for all s by the display after 'By (7.6) we have when D < 0', p.971.

*Needs:* [Hecke CM partial-zeta identity](#hecke-cm-partial-zeta-identity-cm-partial-zeta-period); [Genus Hecke factorization](#genus-hecke-factorization-genus-lseries-factorization); GeometryOfNumbersAndQuadraticArithmetic GN.3; AutomorphicSpectralTheory AS.1 — dit-57; AutomorphicSpectralTheory AS.1 — dit-58; AutomorphicSpectralTheory AS.2 — dit-59; AutomorphicSpectralTheory AS.2 — dit-60.

<a id="ray-class-l-function-zero-density-estimate-ray-class-zero-density"></a>

### 2.39 Ray-class L-function zero-density estimate

There is c = c([k : ℚ]) > 0 such that for Q, T > 1, 1/2 ≤ σ < 1 and ε > 0, Σ_{Nm 𝔮≤Q}Σ*_{χ mod 𝔮}N_χ(σ, T) ≪_{[k:ℚ],ε} (Disc(k)QT)^{c(1−σ)+ε}, the inner sum over primitive ray class characters of conductor 𝔮 and N_χ(σ, T) counting zeros with ℜρ ∈ (σ, 1), |ℑρ| ≤ T.

Assume k is a number field of fixed degree n; D_k is its absolute discriminant; Q,T>1; 1/2≤σ<1; ε>0.; Count nontrivial zeros with analytic multiplicity and strict σ<Reρ<1, inclusive |Imρ|≤T. Sum once over each primitive finite-order ray class character of exact conductor ideal𝔮, including its infinity component.

The proof proceeds as follows. Use the canonical finite-order ray-class/Hecke carrier and its continued L-function; form a locally finite zero multiset with analytic multiplicities, rather than an unweighted set of zero locations. Specialize the original family-density theorem to the trivial GL1 base representation and retain the ε exponent. The degree dependence and full character/conductor family must match LOW Theorem4.2. The original Pasten appendix/Thorner–Zaman proof and zero-multiset construction remain gaps.

See [Robert Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://doi.org/10.1017/S2050508625000009), Theorem 4.2, p.20, citing Lemke Oliver–Thorner [Pas17, Proposition A.2] and Thorner–Zaman [TZ21, Theorem 1.2], Forum Math. Pi 13 (2025), e19; [Robert Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://doi.org/10.1017/S2050508625000009), §4, Theorem4.2, printed p.20.

*Needs:* [Primitive Hecke functional-equation normalization](#primitive-hecke-functional-equation-normalization-hecke-primitive-functional-equation); [Canonical ray-character comparison and the quadratic endpoint](#canonical-ray-character-comparison-and-the-quadratic-endpoint-hecke-nonvanishing-on-line-one).

<a id="heilbronn-s-theorem-on-real-zeros-of-dedekind-zeta-functions-heilbronn-simple-real-zero"></a>

### 2.40 Heilbronn's theorem on real zeros of Dedekind zeta functions

If K/Q is finite Galois and the canonical continued ζ_K has a simple real zero β with0<β<1, then a quadratic subfield k⊆K satisfies ζ_k(β)=0. The conclusion uses meromorphic Artin continuation and the Aramata–Brauer entire-quotient theorem, not Artin holomorphy.

The proof proceeds as follows. Heilbronn Theorem1 first puts the simple real zero in the compositum K₂ of all quadratic subfields. Meromorphic Artin continuation gives integral orders m_χ, possibly negative, for irreducible characters. The Aramata–Brauer theorem says ζ_K/ζ_E is entire for every intermediate E (K/E remains Galois). Thus ζ_E has zero order0 or1 at β. This stronger holomorphy-of-a-quotient input is supplied by the two local Aramata targets below; meromorphic Artin continuation alone does not give it. Form the virtual character φ=Σ m_χχ. The subgroup averages S(H) are the intermediate zeta orders. If the maximal abelian subfield’s zeta is nonzero, choose a minimal subgroup H* of the commutator subgroup with S(H*)=0; proper subgroups have average1. Möbius inversion over cyclic subgroups forces H* cyclic. Odd-prime cyclic quotients are ruled out by conjugate pairs of nonreal degree-one Hecke factors; hence H* is a nontrivial2-group. Write the real virtual character as φ_+−φ_− with real genuine characters. Every determinant character is trivial on the commutator subgroup, so the multiplicities of eigenvalue−1 on a generator are both even. The subgroup-average difference forces their difference to be1, a contradiction. In the maximal abelian extension, nonreal Hecke factors occur in conjugate pairs and cannot contribute a simple real zero. Over Q, ζ_Q is nonzero on(0,1), so the real factor is a nontrivial quadratic character; its quadratic field zeta vanishes. The positive cyclic-character decomposition and entire quotient are stated below. The finite-character/Möbius steps of the Heilbronn argument still need lemma-level decomposition.

The result must also satisfy these compatibility requirements: K=Q cannot satisfy the premise: ζ_Q has no zero on(0,1). For K quadratic over Q the conclusion is its own field, by ζ_K=ζ_Q L(s,χ_K). An Artin factor may have a pole: nonnegative m_χ are never assumed in the virtual-character argument.

See [Hans Heilbronn — On real zeros of Dedekind ζ-functions](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/C5957B0EA95C11C03686CE62D407E1DC/S0008414X00050926a.pdf/on-real-zeros-of-dedekind-z-functions.pdf), Theorem1 p.870; complete proof pp.871–873; postscript p.873; [Peter Koymans, Carlo Pagano — On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1), §8.3 p.92, proof following Theorem8.13.

*Needs:* [Aramata entire quotient](#proof-aramata-entire-quotient); [Global meromorphic Artin continuation](#global-meromorphic-artin-continuation-brauer-meromorphic-continuation); [Artin local polynomial](#artin-local-polynomial-artin-local-polynomial); [NumberFieldArithmetic layer 1 the splitting dictionary](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary); [NumberFieldArithmetic layer 2 frobenius elements and the artin symbol](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol); [RepresentationTheory/InductionRestriction layer 3 the mackey decomposition formula](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula); [Artin Euler series](#artin-euler-series-artin-euler-series); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); [ArithmeticDirichletSeries layer 1 norm fibres and mathlib lseries](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries); [ArithmeticDirichletSeries layer 3 local factors and euler products](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products); `LinearMap.charpoly_prodMap`; [Hecke series and Tate integral comparison](#hecke-series-and-tate-integral-comparison-hecke-L-function-euler-product-comparison); [ClassFieldTheory layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity); [ClassFieldTheory layer 7 the absolute local artin map its normalizations and conductors](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors); [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters); [Quadratic zeta factorization and the residue quotient](#quadratic-zeta-factorization-and-the-residue-quotient-quadratic-zeta-factorization); [Direct sums of Artin local factors](#proof-artin-direct-sum-factor); [Absolute convergence of Artin factors](#proof-artin-absolute-convergence); [Induction identity including ramification](#proof-artin-induction-factor); [Linear Artin factors are Hecke factors](#proof-artin-linear-hecke-comparison); [Uniform finite Artin factor bound](#proof-artin-local-reciprocal-bound); [Ramified local Artin induction identity](#proof-artin-ramified-induction-polynomial).

<a id="proof-aramata-positive-cyclic-decomposition"></a>

**Positive cyclic decomposition of the augmentation character.** For a finite group G, there exist a positive integer N and finitely many cyclic subgroups C_j≤G, nontrivial one-dimensional complex characters ψ_j of C_j and nonnegative integers n_j such that N(Reg_G−1_G)=Σ_j n_j Ind_(C_j)^G ψ_j. The trivial group permits the empty sum. This positive rational decomposition is stronger than the signed integral Brauer expression used for meromorphic continuation; no claim of nonnegative coefficients for arbitrary irreducible characters is made.

Group elements by conjugacy of the cyclic subgroups they generate. For each nonidentity class of this relation, Aramata's Satz5 constructs a class function supported on that class and the identity. Its expression in cyclic induced characters has coefficients proportional to φ(k)−μ(k), which vanish for k=1 and are positive for k>1. Satz6 sums these functions to Reg_G−1_G. Clear the finitely many positive rational denominators to obtain N and n_j.

See [Hideo Aramata — Über die Teilbarkeit der Dedekindschen Zetafunktionen](https://www.jstage.jst.go.jp/article/pjab1912/9/2/9_2_31/_pdf), Sätze4–6 and proof of the main theorem, printed pp.32–34; divisor identities Sätze1–3, p.31.

*Needs:* [From RepresentationTheory](#from-representationtheory), for finite-group class functions, linear characters, induction and their character formulas; finite cyclic character orthogonality and Möbius divisor inversion.

<a id="proof-aramata-entire-quotient"></a>

**Aramata entire quotient.** For a finite Galois extension K/E of number fields, the meromorphic quotient ζ_K/ζ_E extends to an entire function, agreeing with the quotient on Re s>1. For K=E this is the constant1. This assertion includes removal of the apparent singularities at zeros of ζ_E.

Apply the positive cyclic decomposition to Gal(K/E). Artin induction and the ramified local-factor identity identify the N-th power of the quotient with a product of nonnegative integer powers of finite-order Hecke L-functions attached to the nontrivial ψ_j. Each factor is entire. The quotient is already meromorphic; a pole of order m would give a pole of order Nm in its N-th power, so it has no poles. This argument does not assume general Artin holomorphy.

See [Hideo Aramata — Über die Teilbarkeit der Dedekindschen Zetafunktionen](https://www.jstage.jst.go.jp/article/pjab1912/9/2/9_2_31/_pdf), main theorem p.31 and proof p.34.

*Needs:* [Positive cyclic decomposition of the augmentation character](#proof-aramata-positive-cyclic-decomposition); [Global meromorphic Artin continuation](#global-meromorphic-artin-continuation-brauer-meromorphic-continuation); [Induction identity including ramification](#proof-artin-induction-factor); [Linear Artin factors are Hecke factors](#proof-artin-linear-hecke-comparison); [Primitive Hecke functional-equation normalization](#primitive-hecke-functional-equation-normalization-hecke-primitive-functional-equation).

<a id="eisenstein-series-at-a-cm-point-equals-a-partial-zeta-function-gross-zagier-cm-eisenstein-comparison"></a>

### 2.41 Eisenstein series at a CM point equals a partial zeta function

Let D<0 be a fundamental discriminant, K=Q(√D), u=#O_K^×/2 and A an ordinary ideal class. Choose its CM lattice point τ_A in the upper half-plane from a primitive positive-definite binary quadratic form of discriminant D. Let E(z,s)=(1/2)Σ_{gcd(c,d)=1}(Im z)^s/|cz+d|^(2s), the uncompleted level-one Eisenstein series. For Re s>1, E(τ_A,s)=2^(−s)|D|^(s/2)u ζ(2s)^(−1)ζ_K(A,s), equivalently2^s ζ(2s)E(τ_A,s)=u|D|^(s/2)ζ_K(A,s). All positive-base powers use the real logarithm. Changing A to A^(−1) leaves its partial zeta unchanged.

The proof proceeds as follows. Reuse hecke_cm_partial_zeta_identity: E*=π^(−s)Γ(s)ζ(2s)E and ω_D=u. Substitute these definitions into its completed identity. For Re s>1 cancel the nonzero π^(−s)Γ(s) factor, retaining ζ(2s), the primitive half-sum and exactly u=#units/2. This is the uncompleted normalization comparison of the existing CM identity, not a second CM-period construction. The lattice-to-ordinary-class choice is the same as that of the supplier; inverse-class ambiguity is harmless only after its conjugation/partial-zeta equality is supplied. Nonfundamental order discriminants are outside this field formula.

The result must also satisfy these compatibility requirements: For D=−4, τ=i, u=2 and the single class, ζ_Q(i)(s)=2^s ζ(2s)E(i,s)/(2·4^(s/2))=ζ(2s)E(i,s). For D=−3 the unit factor is u=3, not1. A primitive form with nonfundamental discriminant−16 represents a nonmaximal order in Q(i); it cannot be substituted into this field-discriminant formula.

See [Benedict H. Gross, Don B. Zagier — Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf), ChapterII§4, p.248, immediately after(4.1).

*Needs:* [Hecke CM partial-zeta identity](#hecke-cm-partial-zeta-identity-cm-partial-zeta-period).

<a id="artin-holomorphy-as-a-hypothesis-artin-holomorphy-hypothesis"></a>

### 2.42 Artin holomorphy as a hypothesis

For a finite Galois extension L/K of number fields and a finite-dimensional complex representation ρ of Gal(L/K), ArtinHolomorphy ρ is the proposition: the meromorphic continuation of the Artin Euler series L_K(s,ρ) of this layer (Brauer continuation) has no poles in ℂ ∖ {1}, and its order at s = 1 is minus the multiplicity of the trivial representation in ρ. The Artin conjecture is the proposition that ArtinHolomorphy ρ holds for every such ρ. Both are used only as hypotheses.

Assume L/K finite Galois; ρ : Gal(L/K) → GL_n(ℂ) a representation.

The proof proceeds as follows. Definition, on the continuation supplied by the Brauer meromorphic-continuation target; the continuation is unique, so the predicate does not depend on the Brauer expression chosen. The Euler series here keeps the inertia-invariant factors at ramified primes. Deleting finitely many Euler factors multiplies by entire functions, so holomorphy of the complete series implies holomorphy of the incomplete one, but not conversely.

The required interface consists of the following operations and identities.

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

The result must also satisfy these compatibility requirements: No unconditional target of this roadmap uses the predicate; it records the requirement that general continuation statements stay visible hypotheses.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.2–22.3, Conjecture 22.2, p. 128.

*Needs:* [Artin Euler series](#artin-euler-series-artin-euler-series); [Global meromorphic Artin continuation](#global-meromorphic-artin-continuation-brauer-meromorphic-continuation).

<a id="extended-riemann-hypothesis-for-dedekind-and-hecke-l-functions-extended-riemann-hypothesis"></a>

### 2.43 Extended Riemann hypothesis for Dedekind and Hecke L-functions

For a number field K, DedekindERH K is the proposition: every zero s of the continued Dedekind zeta function ζ_K (the Tate continuation identified with NumberField.dedekindZeta on Re s > 1 by this layer) with 0 < Re s < 1 has Re s = 1/2. For a primitive finite-order Hecke character χ of K, HeckeGRH χ is the same proposition for the continued L(s,χ). Both are hypotheses only; they extend the Layer 1 register from Dirichlet characters to number fields.

Assume K a number field; χ a primitive finite-order Hecke character of K.

The proof proceeds as follows. Definition on the continued functions of this layer. The strip condition removes the trivial zeros (Re s ≤ 0) and the pole at 1; zeros with Re s ≥ 1 are excluded by line-one nonvanishing.

The required interface consists of the following operations and identities.

- `DedekindERH`: The proposition defined above.
- `HeckeGRH`: The proposition for one primitive Hecke character.
- `dedekindERH_rat_iff`: DedekindERH ℚ is equivalent to RiemannHypothesis, since ζ_ℚ = ζ.
- `DedekindERH.of_abelian`: For K/ℚ abelian, ζ_K is the product of the Dirichlet L-functions of the primitive characters of its conductor, so GRH for those characters implies DedekindERH K.
- `HeckeGRH.trivial`: HeckeGRH of the trivial character of K is DedekindERH K.

**Checks.**

- DedekindERH ℚ ↔ RiemannHypothesis.
- For K = ℚ(i), ζ_K = ζ · L(·,χ₋₄), so DedekindERH ℚ(i) is equivalent to RiemannHypothesis together with DirichletGRH χ₋₄.
- For a real quadratic K, ζ_K vanishes at s = 0 to order 1 (r₁ + r₂ − 1 = 1); this zero is outside the strip and does not contradict the predicate.

The result must also satisfy these compatibility requirements: No unconditional target uses it; effective Chebotarev bounds under ERH are not claimed here.

See [Kiran S. Kedlaya — Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §10.3, Remark 10.5, p. 61.

*Needs:* [Riemann and generalized Riemann hypotheses as statements](#riemann-and-generalized-riemann-hypotheses-as-statements-generalized-riemann-hypothesis); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); [Primitive Hecke functional-equation normalization](#primitive-hecke-functional-equation-normalization-hecke-primitive-functional-equation); [Canonical ray-character comparison and the quadratic endpoint](#canonical-ray-character-comparison-and-the-quadratic-endpoint-hecke-nonvanishing-on-line-one).

<a id="zero-free-regions-for-dedekind-zeta-and-hecke-l-functions-dedekind-hecke-zero-free-region"></a>

### 2.44 Zero-free regions for Dedekind zeta and Hecke L-functions

(i) Let L/K be an abelian extension of number fields, Q = Q(L/K) the maximum of the norms of the conductors of the Hecke characters χ of K attached to L/K, n_K = [K:ℚ] and D_K = |disc(K/ℚ)|. If D_K Q n_K^{n_K} is sufficiently large, the product Π_χ L(s,χ,K) of these continued Hecke L-functions has at most one zero, counted with multiplicity, in σ ≥ 1 − 0.0875/log(D_K Q n_K^{n_K}), |t| ≤ 1 (s = σ + it); if it exists it is a simple real zero and its character is real. (ii) In particular, if D_K n_K^{n_K} is sufficiently large, ζ_K has at most one zero in σ ≥ 1 − 0.0875/log(D_K n_K^{n_K}), |t| ≤ 1, and such a zero is real. The possible zero is the exceptional zero β₁ of the effective Chebotarev theorem.

Assume L/K abelian; “sufficiently large” is an absolute threshold.; The L-functions are the continuations identified with the ideal series in this layer.

The proof proceeds as follows. Zaman, Theorem 4.1.1: for a congruence class group H of K and r ≥ 1, the product over characters of order at least r has at most one zero in σ ≥ 1 − c₀/(log D_K + (3/4) log Q + n_K ν(n_K)), |t| ≤ T⋆, with c₀ = 0.0875 for r = 1; the zero is real with a real character. Class field theory identifies the characters attached to L/K with those of a congruence class group. The proof is a positivity argument (a nonnegative trigonometric polynomial applied to the logarithmic derivative of the product, as in the 3-4-1 inequality) combined with the Hadamard product of each completed Hecke L-function and explicit bounds for its gamma factors. For (ii), apply (i) to the trivial extension L = K, where the product is ζ_K and Q = 1.

The result must also satisfy these compatibility requirements: K = ℚ, L = ℚ(ζ_q): (i) is the classical statement that Π_{χ mod q} L(s,χ) has at most one zero near 1, a simple real zero of a real character (compare the conductor-uniform Dirichlet region of Layer 0). The region contains at most one zero; it is not claimed zero-free, so no unconditional statement may drop β₁.

See [Asif Ali Zaman — Analytic estimates for the Chebotarev Density Theorem and their applications](https://www.math.toronto.edu/zaman/files/thesis.pdf), §1.3.2, Theorem 1.3.5 and Corollary 1.3.6, p. 16; §4.1, Theorem 4.1.1, p. 69.

*Needs:* [Primitive Hecke functional-equation normalization](#primitive-hecke-functional-equation-normalization-hecke-primitive-functional-equation); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); [Imprimitive Hecke deleted factors](#imprimitive-hecke-deleted-factors-imprimitive-hecke-factors); [Canonical ray-character comparison and the quadratic endpoint](#canonical-ray-character-comparison-and-the-quadratic-endpoint-hecke-nonvanishing-on-line-one); [Hadamard factorization in order at most one](#hadamard-factorization-in-order-at-most-one-order-one-hadamard); [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters); [ClassFieldTheory layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity).

<a id="logarithmic-functional-equation-artin-log-functional-equation"></a>

### 2.45 Logarithmic functional equation

Fix g≥1. Let E be any degree2g CM field, L its normal closure over Q (not an arbitrary Galois overfield), G=Gal(L/Q), and c the central complex conjugation. Let F(E) be the finite set of isomorphism classes of nontrivial irreducible complex G-representations ρ satisfying ρ(c)=−Id. Then |G|≤M_g=(2g)!, |F(E)|≤M_g and dim ρ≤M_g. All constants below are uniform in E and ρ∈F(E). The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value≤B_g; the trivial factor is separated before evaluation at1. Use the canonical positive Artin conductor f_ρ, formed from the lower-ramification codimensions of inertia invariants; it is not a ray modulus or an arbitrary positive parameter. Write Γ_R(s)=π^(−s/2)Γ(s/2), d=dimρ and Λ_ρ(s)=f_ρ^(s/2)Γ_R(s+1)^d L(s,ρ). Import Λ_ρ(s)=w_ρΛ_(ρ̄)(1−s), |w_ρ|=1. Odd parity makes the gamma factors finite and nonzero at0 and1; boundary nonvanishing and the equation make L_ρ(0), L_(ρ̄)(1) finite and nonzero. Then L′_ρ(0)/L_ρ(0)+L′_(ρ̄)(1)/L_(ρ̄)(1)=−log f_ρ−d((Γ_R′/Γ_R)(1)+(Γ_R′/Γ_R)(2)). A general even factor would instead require a regularized derivative at0.

Assume Same CM normal-closure/odd-irreducible family as the conductor bound.; Continuation agrees with the genuine all-prime Artin Euler series on Re s>1. Nonzero endpoint germs and conjugation are part of the contract.

The proof proceeds as follows. Use integral Brauer induction and finite-order Hecke functional equations to obtain the completed Artin equation with arithmetic conductor and odd infinity type. This supplier identity is still an exact gap. After verifying analytic nonzero endpoints, differentiate the local completed identity. The suggested calculus adapter states this identity exactly and keeps the conductor comparison as a distinct arithmetic input.

See [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Proof of Corollary 3.3, p. 384; [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Theorem3.2 and proof of Corollary3.3, printed pp.383–384.

*Needs:* [Sufficient conductor-discriminant estimate](#sufficient-conductor-discriminant-estimate-artin-conductor-bound); [Artin continuation near the line one](#artin-continuation-near-the-line-one-artin-induction-versus-artin-holomorphy); [Artin Euler series](#artin-euler-series-artin-euler-series); [Hecke series and Tate integral comparison](#hecke-series-and-tate-integral-comparison-hecke-L-function-euler-product-comparison); [ClassFieldTheory layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity); [Artin local polynomial](#artin-local-polynomial-artin-local-polynomial); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); [ArithmeticDirichletSeries layer 1 norm fibres and mathlib lseries](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries); [ArithmeticDirichletSeries layer 3 local factors and euler products](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products); [ClassFieldTheory layer 7 the absolute local artin map its normalizations and conductors](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors); [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters); `Complex.Gammaℝ`; [Absolute convergence of Artin factors](#proof-artin-absolute-convergence); [Linear Artin factors are Hecke factors](#proof-artin-linear-hecke-comparison); [Uniform finite Artin factor bound](#proof-artin-local-reciprocal-bound).

<a id="factorwise-logarithmic-derivative-at-one-artin-log-derivative-one"></a>

### 2.46 Factorwise logarithmic derivative at one

Fix g≥1. Let E be any degree2g CM field, L its normal closure over Q (not an arbitrary Galois overfield), G=Gal(L/Q), and c the central complex conjugation. Let F(E) be the finite set of isomorphism classes of nontrivial irreducible complex G-representations ρ satisfying ρ(c)=−Id. Then |G|≤M_g=(2g)!, |F(E)|≤M_g and dim ρ≤M_g. All constants below are uniform in E and ρ∈F(E). The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value≤B_g; the trivial factor is separated before evaluation at1. For each ρ∈F(E), import an integral monomial Brauer expression χ_ρ=Σ_(j∈J)n_j Ind_(H_j)^G ψ_j with one-dimensional finite-order ψ_j, Σ_j|n_j|≤B_g, |J|≤B_g and [L^(H_j):Q]≤M_g. Bound each Hecke analytic conductor (including the base-field discriminant) by D_E^C_g, with D_E=|Disc(E)|. For δ_j=1 if ψ_j is trivial and0 otherwise, take the holomorphic, nonzero extension H_j(s) of (s−1)^δ_j L(s,ψ_j) at1. Prove Σ_j n_jδ_j=0 and the local germ identity L(s,ρ)=∏_j H_j(s)^n_j. For every ε>0 there exists C_(g,ε)>0 with |L′(1,ρ)/L(1,ρ)|≤C_(g,ε)D_E^ε. Use the exact identity L′(1,ρ)/L(1,ρ)=Σ_j n_j H_j′(1)/H_j(1) and fixed-degree subpower bounds for these regularized Hecke logarithmic derivatives. This is an explicit target and source obligation; the printed fixed-radius Cauchy bound for L′ alone does not establish it.

Assume Same finite family and continuation normalization.; Hecke logarithmic-derivative bounds must be uniform in the stated analytic-conductor range; poles have been removed and their total order cancels. Constants may be ineffective.

The proof proceeds as follows. Differentiate the regularized Brauer product at1. The nonzero-factor condition permits division and removes all principal parts by Σ n_jδ_j=0. Sum the individual Hecke logarithmic-derivative estimates using Σ|n_j|≤B_g, choosing the exponent to absorb the conductor comparison. This route supplies the ratio itself; general Artin holomorphy in a fixed-radius disc is not assumed.

See [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Proof of Corollary 3.3, p. 384; [10], (5.2); [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Theorem3.2 and proof of Corollary3.3, printed pp.383–384.

*Needs:* [Two-sided subpolynomial values at one](#two-sided-subpolynomial-values-at-one-artin-value-one-subpower); [Artin local polynomial](#artin-local-polynomial-artin-local-polynomial); [NumberFieldArithmetic layer 1 the splitting dictionary](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary); [NumberFieldArithmetic layer 2 frobenius elements and the artin symbol](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol); [RepresentationTheory/InductionRestriction layer 3 the mackey decomposition formula](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula); [Artin Euler series](#artin-euler-series-artin-euler-series); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); [ArithmeticDirichletSeries layer 1 norm fibres and mathlib lseries](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries); [ArithmeticDirichletSeries layer 3 local factors and euler products](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products); [Hecke series and Tate integral comparison](#hecke-series-and-tate-integral-comparison-hecke-L-function-euler-product-comparison); [ClassFieldTheory layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity); [ClassFieldTheory layer 7 the absolute local artin map its normalizations and conductors](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors); [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters); [RepresentationTheory/InductionRestriction layer 6 the virtual character ring artin and brauer induction](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction); [Absolute convergence of Artin factors](#proof-artin-absolute-convergence); [Induction identity including ramification](#proof-artin-induction-factor); [Linear Artin factors are Hecke factors](#proof-artin-linear-hecke-comparison); [Uniform finite Artin factor bound](#proof-artin-local-reciprocal-bound); [Ramified local Artin induction identity](#proof-artin-ramified-induction-polynomial).

<a id="uniform-subpolynomial-dedekind-residues-bounded-degree-residue-bounds"></a>

### 2.47 Uniform subpolynomial Dedekind residues

For every n>=1 and epsilon>0 there are c,C>0 depending only on n,epsilon such that c*D_K^(-epsilon)<=kappa_K<=C*D_K^epsilon for every number field of degree at most n. Constants may be ineffective. Derive from bounded-degree Brauer-Siegel, the explicit residue formula, the bounded number of roots of unity, and a finite adjustment for small discriminants. Normality is not added to the bounded-degree contract.

The proof proceeds as follows. Use bounded-degree Brauer–Siegel and the explicit positive residue formula. Uniformly bound roots of unity by degree and absorb the finite small-discriminant range.

See [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Tsimerman §§2–3, pp.380–384, uses the Brauer–Siegel input; its original uniform proof remains required.

*Needs:* [Bounded-degree Brauer-Siegel](#bounded-degree-brauer-siegel-bounded-degree-brauer-siegel); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue).

<a id="eisenstein-weyl-sums-bounded-by-dirichlet-l-values-eisenstein-weyl-lvalue-bound"></a>

### 2.48 Eisenstein Weyl sums bounded by Dirichlet L-values

There is an absolute C > 0 such that, for every ε > 0, every fundamental D = d'd ≠ 1 with genus character χ, and every s with Re(s) = 1/2: Weyl(E(·,s),χ) ≪_ε |s|^C |L(s,χ_{d'})L(s,χ_d)| |D|^{1/4+ε}. The paper prints the left side as 'Weyl(s,χ)'.

Assume d,d′ are coprime fundamental discriminants with fundamental product D≠1, and s=1/2+it for t∈ℝ.; Weyl is the three-branch class sum of DIT (5.12): twice the core-area integral for negative factors, the boundary arc-length integral over ∂F_A for positive factors (compared separately to C_A), and the CM point sum weighted by 1/ω_D for mixed signs. All branches retain the genus character and multiplicities.; The implied constant depends only on ε; the height exponent C is absolute.

The proof proceeds as follows. Apply the appropriate one of the three genus-period identities. Use the precise gamma quotient and reciprocal-zeta bounds; polynomial height factors and |D|^(1/4+ε) remain visible.

The result must also satisfy these compatibility requirements: The field discriminant excludes D=1; this does not exclude a factor discriminant equal to1 in a genus decomposition.

See [W. Duke, Ö. Imamoḡlu, Á. Tóth — Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (6.7), proof of Proposition 2, p.969.

*Needs:* [Theorem3 negative factors](#theorem3-negative-factors-negative-genus-core-period); [Theorem3 positive factors](#theorem3-positive-factors-positive-genus-geodesic-period); [Theorem3 CM factors](#theorem3-cm-factors-mixed-genus-cm-period); [Critical-line gamma quotient](#critical-line-gamma-quotient-critical-line-gamma-quotient); [Reciprocal zeta on the line one](#reciprocal-zeta-on-the-line-one-reciprocal-zeta-line-one); GeometryOfNumbersAndQuadraticArithmetic GN.3; AutomorphicSpectralTheory AS.1 — dit-57; AutomorphicSpectralTheory AS.1 — dit-58; AutomorphicSpectralTheory AS.2 — dit-59; AutomorphicSpectralTheory AS.2 — dit-60.

<a id="many-split-primes-outside-a-small-quadratic-exception-set-most-quadratic-many-split-primes"></a>

### 2.49 Many split primes outside a small quadratic exception set

For ε₁ > 0 and X ≥ 2 there is E = E(k, X, ε₁) ⊂ {F/k quadratic, Disc(F/k) ≤ X} with |E| ≪_{[k:ℚ],ε₁} Disc(k)^{ε₁}X^{ε₁}, such that for F ∉ E and 4 ≤ Y ≤ X, π_k(Y; F, e) ≥ (1/8)π_k(Y/2) − C_{[k:ℚ],ε₁}Y^{σ₁}log²(X Disc(k)) with σ₁ = max(1 − ε₁/(4c), 1/2). E consists of the F whose character χ_{F/k} has a zero with ℜρ > σ₁, |ℑρ| ≤ X^{1/2}; the proof is the explicit formula with Lemma 4.1.

Assume k is a number field of fixed degree n, D_k its absolute discriminant; quadratic F/k have relative discriminant norm≤X; ε₁>0 and X≥2.; Take one positive degree-dependent c from the density theorem and σ₁=max(1−ε₁/(4c),1/2). E is fixed before Y ranges over4≤Y≤X, and a single constant C_{n,ε₁} works for all eligible k,F,X,Y. All prime-ideal counts include the norm endpoint.

The proof proceeds as follows. Use the unique primitive quadratic ray character of conductor the relative discriminant; define E by its nontrivial zeros with σ₁<Reρ<1 and |Imρ|≤√X. The density bound with Q=X,T=√X and an exponent parameter small relative toε₁ gives #E≪_{n,ε₁}D_k^ε₁X^ε₁; bound conjugate infinity types by degree. For F outside E, use the ideal von Mangoldt coefficient and the nonnegative weight (1−N𝔞/Y). Away from ramification, (1+χ(𝔭))/2 is the split-prime indicator. Ramified primes and higher powers require their separate counting estimates. The Hecke logarithmic-derivative series and smoothed Perron give the kernel Y^s/(s(s+1)). Shift at safe heights, accounting for all trivial/nontrivial zeros and double-pole residues at0 and−1; the literal source claim about every vertical line is not used as an integrability lemma. LOW Lemma4.1 supplies the required unit-height zero count and local logarithmic-derivative targets. At T=√X, high zeros contribute O_n(Y log(XD_kT)/T) and low zeros O_{n,ε₁}(Y^σ₁ log(XD_kT)); use Y≤X. Original IK estimates, good-height selection, smoothed contour and residue calculations remain an explicit gap. Use the imported inclusive counting carriers and partial summation to remove higher powers/ramification and the log norm weight, producing the stated1/8 lower bound with one uniform error constant. The exact quantitative adapter, stronger than qualitative PNT transfer, remains a gap.

The result must also satisfy these compatibility requirements: The same set E and one degree/ε₁-dependent constant work simultaneously for every4≤Y≤X; allowing Y-dependent constants would make the target empty. When X<4 there are no eligible Y, but the exceptional-set cardinality assertion is still required. The source weights all prime powers before transferring to split unramified primes; its1/8 main factor cannot be replaced by1/2 without a separate argument.

See [Robert Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://doi.org/10.1017/S2050508625000009), Lemma 4.3 and proof, pp.20–22, Forum Math. Pi 13 (2025), e19; [Robert Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://doi.org/10.1017/S2050508625000009), §4, Lemma4.3 and full proof, printed pp.20–22.

*Needs:* [Ray-class L-function zero-density estimate](#ray-class-l-function-zero-density-estimate-ray-class-zero-density); [Quadratic zeta factorization and the residue quotient](#quadratic-zeta-factorization-and-the-residue-quotient-quadratic-zeta-factorization); [Primitive Hecke functional-equation normalization](#primitive-hecke-functional-equation-normalization-hecke-primitive-functional-equation); [ArithmeticDirichletSeries layer 4 counting carriers and local finiteness](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-4-counting-carriers-and-local-finiteness); [ArithmeticDirichletSeries layer 6 abel and perron summation](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation); [ArithmeticDirichletSeries layer 5 ideal and prime estimates](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-5-ideal-and-prime-estimates); [Canonical ray-character comparison and the quadratic endpoint](#canonical-ray-character-comparison-and-the-quadratic-endpoint-hecke-nonvanishing-on-line-one).

<a id="effective-chebotarev-density-theorem-effective-chebotarev"></a>

### 2.50 Effective Chebotarev density theorem

Let L/F be a finite Galois extension, G its group, n=[L:ℚ]>1, D=|Disc L| and C one conjugacy class. Count unramified prime ideals of F with norm≤x and arithmetic Frobenius in C by π_C(x). There is at most one ζ_L zero in Re s≥1−1/(4 log D), |Im s|≤1/(4 log D); if present it is a simple real β₀. For x≥exp(10n(log D)²), prove |π_C(x)−(|C|/|G|)Li(x)|≤(|C|/|G|)Li(x^β₀)+C₁x exp(−C₂ sqrt(log x/n)), omitting the Li term when there is no exceptional zero; C₁,C₂>0 are effective absolute constants. A bound with this Li term absorbed requires a separate zero-separation estimate and an enlarged range; no field-uniform absorption at the displayed threshold is asserted. Under DedekindERH L the error is O(x^(1/2)log(Dx^n)) for x≫(log D)². Some unramified degree-one prime in C has norm≪D^B with effective absolute B>0; under DedekindERH it has norm≪(log D)². The degree-one field L=F=ℚ is covered separately by the rational prime estimates, with the conditional least-prime bound written using max(1,log D)².

Assume L/F finite Galois; C a conjugacy class of Gal(L/F).; (ii) and the conditional part of (iii) assume DedekindERH L.; Ineffective and effective constants are distinguished in (i).

The proof proceeds as follows. Deuring reduction: for g ∈ C, H = ⟨g⟩ and E = L^H, the primes of F with class C correspond, up to the contraction and the ramified and higher-degree primes already estimated in Tau Ceti Chebotarev Layers 8 and 11–12, to the degree-one primes of E with Frobenius g in the abelian extension L/E. Write the weighted count of the abelian problem as an average of −L′/L(s,χ,E) over the Hecke characters χ of Gal(L/E) (class field theory), apply the truncated Perron formula (ArithmeticDirichletSeries Layer 6) and shift the contour; the zeros are those of ζ_L = Π_χ L(s,χ,E). Bound the sum over zeros with the zero-free region of this layer (keeping the possible exceptional zero β₁ apart) and a zero count N(T) ≪ T log(D_L T^{n_L}); choose T in terms of x and n_L to obtain (i), and insert Re ρ = 1/2 for (ii). (iii) needs, besides the zero-free region, a zero-density estimate near 1 and the Deuring–Heilbronn repulsion of zeros from β₁ (Lagarias–Montgomery–Odlyzko, by power sums); this is the recorded gap of this target. Keep the exceptional contribution until a quantitative lower bound for 1−β₀ justifies absorption on its own enlarged x range. The discriminant-one case is separated before dividing by log D.

The result must also satisfy these compatibility requirements: F = ℚ, L = ℚ(ζ_q): (i) is a prime number theorem in progressions with error x exp(−c (log x/φ(q))^{1/2}) for x ≥ exp(10 φ(q) (log D_L)²), much weaker in q than Siegel–Walfisz, as Zaman notes after (1.18). Dropping the error terms recovers Tau Ceti’s tendsto_frobeniusPrimeCount; no qualitative statement is restated. The exceptional zero is named, never assumed absent.

See [Asif Ali Zaman — Analytic estimates for the Chebotarev Density Theorem and their applications](https://www.math.toronto.edu/zaman/files/thesis.pdf), §1.2, equations (1.18), (1.20), (1.21), pp. 7–8; [Lillian B. Pierce, Caroline L. Turnage-Butterbaugh and Melanie Matchett Wood — An effective Chebotarev density theorem for families of number fields, with an application to ℓ-torsion in class groups](https://arxiv.org/pdf/1709.09637), §1.1, Theorems A and B, printed p.2 of arXiv:1709.09637; Theorem B (1.3)–(1.4) retains the exceptional-zero term.

*Needs:* [Zero-free regions for Dedekind zeta and Hecke L-functions](#zero-free-regions-for-dedekind-zeta-and-hecke-l-functions-dedekind-hecke-zero-free-region); [Extended Riemann hypothesis for Dedekind and Hecke L-functions](#extended-riemann-hypothesis-for-dedekind-and-hecke-l-functions-extended-riemann-hypothesis); [Canonical ray-character comparison and the quadratic endpoint](#canonical-ray-character-comparison-and-the-quadratic-endpoint-hecke-nonvanishing-on-line-one); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); [Chebotarev layer 8 the cyclic fixed field fibre](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev#layer-8-the-cyclic-fixed-field-fibre); [Chebotarev layer 11 the frobenius von mangoldt coefficient and its summatory functions](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev#layer-11-the-frobenius-von-mangoldt-coefficient-and-its-summatory-functions); [Chebotarev layer 13 ϑ_c and π_c](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev#layer-13-ϑ_c-and-π_c); [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters); [ClassFieldTheory layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity); [ArithmeticDirichletSeries layer 6 abel and perron summation](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation).

<a id="two-sided-quadratic-hecke-value-bound-quadratic-hecke-value-one"></a>

### 2.51 Two-sided quadratic Hecke value bound

Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For every fixed g and epsilon>0, D_E^(-epsilon) <<_(g,epsilon) L_f(1,eta_E/F) <<_(g,epsilon) D_E^epsilon. Constants may be ineffective. Use kappa_E/kappa_F, the degree bounds 2g and g, and D_F<=D_E^(1/2), choosing each residue exponent at most 2*epsilon/3.

Assume E/F is the CM quadratic extension specified in the statement; η is defined through global Artin reciprocity, rather than an arbitrary quadratic character.; g and ε are fixed before varying E; implied constants depend only on those stated parameters.

The proof proceeds as follows. Apply the positive residue quotient and both residue bounds with exponent ≤2ε/3. Use D_F≤D_E^(1/2) to keep the total exponent ≤ε.

See [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Derived residue-quotient adapter for Tsimerman, Corollary 3.3, p.384; positivity and the conductor comparison are separate inputs.

*Needs:* [Quadratic zeta factorization and the residue quotient](#quadratic-zeta-factorization-and-the-residue-quotient-quadratic-zeta-factorization); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters); [ClassFieldTheory layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity); AutomorphicLFunctionsAndLocalFactors AL.1 — hecke-l-functional-equation; [Uniform subpolynomial Dedekind residues](#uniform-subpolynomial-dedekind-residues-bounded-degree-residue-bounds); [ClassFieldTheory layer 13 norm theorems and class fields](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields); [Quadratic Hecke value as residue quotient](#proof-quadratic-residue-quotient).

<a id="subpolynomial-logarithmic-derivative-at-one-quadratic-hecke-log-derivative-one"></a>

### 2.52 Subpolynomial logarithmic derivative at one

Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For every fixed g and epsilon>0, |L_f prime(1,eta)/L_f(1,eta)| <<_(g,epsilon) D_E^epsilon. Apply the derivative bound with epsilon/2 and the reciprocal value bound with epsilon/2. The latter, rather than Cauchy, is the possible ineffective input.

Assume E/F is the CM quadratic extension specified in the statement; η is defined through global Artin reciprocity, rather than an arbitrary quadratic character.; g and ε are fixed before varying E; implied constants depend only on those stated parameters.

The proof proceeds as follows. Apply the derivative estimate with ε/2. Multiply by the reciprocal positive-value estimate with ε/2.

See [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Derived quotient adapter for Tsimerman, Corollary 3.3, p.384; use both the derivative bound and the separately proved positive value lower bound.

*Needs:* [A fixed small circle gives a subpolynomial derivative](#a-fixed-small-circle-gives-a-subpolynomial-derivative-quadratic-hecke-cauchy-derivative); [Two-sided quadratic Hecke value bound](#two-sided-quadratic-hecke-value-bound-quadratic-hecke-value-one); [GlobalNumberFields layer 9 hecke and ray class characters](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters); [ClassFieldTheory layer 11 the global class formation and global artin reciprocity](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity).

### Remaining analytic proof obligations

**Artin local determinant and induction proofs.** Complete inertia-invariant conjugacy transport, finite-order spectrum, coefficient convolution convergence, ramified relative Frobenius and the Mackey cyclic-block determinant. Integral induced-linear Brauer expressions use the existing current-library reduction specified in [From RepresentationTheory](#from-representationtheory); only the local determinant and arithmetic comparison adapters remain new work. Used in [Artin local polynomial](#artin-local-polynomial-artin-local-polynomial); [Artin Euler series](#artin-euler-series-artin-euler-series); [Artin continuation near the line one](#artin-continuation-near-the-line-one-artin-induction-versus-artin-holomorphy); [Heilbronn's theorem on real zeros of Dedekind zeta functions](#heilbronn-s-theorem-on-real-zeros-of-dedekind-zeta-functions-heilbronn-simple-real-zero); [Factorwise logarithmic derivative at one](#factorwise-logarithmic-derivative-at-one-artin-log-derivative-one); [Logarithmic functional equation](#logarithmic-functional-equation-artin-log-functional-equation); [Two-sided subpolynomial values at one](#two-sided-subpolynomial-values-at-one-artin-value-one-subpower); [Global meromorphic Artin continuation](#global-meromorphic-artin-continuation-brauer-meromorphic-continuation).

**Fixed-degree arithmetic analytic estimates.** Prove bounded-degree uniformity for divisor coefficient majorants, residues, Brauer–Siegel, CM conductor comparison, regularized Brauer values and logarithmic derivatives. Separate trivial Hecke poles and prove cancellation of their orders. For a quadratic CM extension use D_F≤D_E^(1/2), positive residue quotients, pole-aware convexity on a full Cauchy circle, and the conductor Q before identifying it arithmetically with D_E/D_F. A bound for L′ alone never bounds L′/L. Used in [Bounded-degree Brauer-Siegel](#bounded-degree-brauer-siegel-bounded-degree-brauer-siegel); [Uniform bounded-norm ideal count](#uniform-bounded-norm-ideal-count-bounded-norm-ideal-count); [Sufficient conductor-discriminant estimate](#sufficient-conductor-discriminant-estimate-artin-conductor-bound); [Logarithmic functional equation](#logarithmic-functional-equation-artin-log-functional-equation); [Two-sided subpolynomial values at one](#two-sided-subpolynomial-values-at-one-artin-value-one-subpower); [Factorwise logarithmic derivative at one](#factorwise-logarithmic-derivative-at-one-artin-log-derivative-one); [Quadratic zeta factorization and the residue quotient](#quadratic-zeta-factorization-and-the-residue-quotient-quadratic-zeta-factorization); [Uniform subpolynomial Dedekind residues](#uniform-subpolynomial-dedekind-residues-bounded-degree-residue-bounds); [Two-sided quadratic Hecke value bound](#two-sided-quadratic-hecke-value-bound-quadratic-hecke-value-one); [Uniform finite-order Hecke convexity](#uniform-finite-order-hecke-convexity-primitive-hecke-convexity); [A fixed small circle gives a subpolynomial derivative](#a-fixed-small-circle-gives-a-subpolynomial-derivative-quadratic-hecke-cauchy-derivative); [Subpolynomial logarithmic derivative at one](#subpolynomial-logarithmic-derivative-at-one-quadratic-hecke-log-derivative-one); [Logarithmic functional equation at zero and one](#logarithmic-functional-equation-at-zero-and-one-quadratic-hecke-log-functional-equation); [Uniform coefficient bound by a divisor function](#uniform-coefficient-bound-by-a-divisor-function-ideal-coefficient-divisor-majorant); [Subpolynomial fixed-order divisor function](#subpolynomial-fixed-order-divisor-function-fixed-order-divisor-subpower).

**Quadratic Hecke period normalizations.** The quadratic periods require the complete prime-discriminant/genus-character dictionary, half-unit CM weights, full norm-one geodesics and differentiated Eisenstein cusp estimates. Construct the Nielsen core and multiplicity-preserving boundary projection here before the negative-factor period. Its critical-line boundary integral is not the divergent area integral on Re s>1. The Gross–Zagier normalization comparison remains a separate source boundary. Used in [Hecke CM partial-zeta identity](#hecke-cm-partial-zeta-identity-cm-partial-zeta-period); [Hecke positive-sign real quadratic formula](#hecke-positive-sign-real-quadratic-formula-real-even-partial-zeta-period); [Genus Hecke factorization](#genus-hecke-factorization-genus-lseries-factorization); [Theorem3 negative factors](#theorem3-negative-factors-negative-genus-core-period); [Theorem3 positive factors](#theorem3-positive-factors-positive-genus-geodesic-period); [Theorem3 CM factors](#theorem3-cm-factors-mixed-genus-cm-period); [Hecke negative-sign real quadratic formula](#hecke-negative-sign-real-quadratic-formula-real-odd-partial-zeta-period); [Eisenstein Weyl sums bounded by Dirichlet L-values](#eisenstein-weyl-sums-bounded-by-dirichlet-l-values-eisenstein-weyl-lvalue-bound); [Eisenstein series at a CM point equals a partial zeta function](#eisenstein-series-at-a-cm-point-equals-a-partial-zeta-function-gross-zagier-cm-eisenstein-comparison).

**Quadratic regulator dictionary.** Prove the quadratic regulator dictionary with the norm-minus-one unit dichotomy before comparing narrow and ordinary class numbers or fundamental-unit logarithms. Used in [Siegel lower bound and regulator conversion](#siegel-lower-bound-and-regulator-conversion-real-quadratic-class-regulator-lower).

**Explicit Dedekind estimates.** The explicit Dedekind residue estimate needs Louboutin’s original proof; the Lipnowski–Tsimerman application supplies the target rather than that proof. Used in [Explicit residue bound for Dedekind zeta functions (Louboutin)](#explicit-residue-bound-for-dedekind-zeta-functions-louboutin-louboutin-dedekind-residue-upper).

**Number-field density and effective prime estimates.** Supply the original primitive-Hecke family density estimate, multiplicity-indexed local zero counts and logarithmic derivative down to Re s=−3/2. Prove smoothed ideal Perron with kernel Y^s/(s(s+1)), safe contours, residues and low/high-zero bounds, then transfer to split primes after ramification and higher-power removal. Reconcile the constants 35 and 40 in the relevant Zaman theorem and intermediate weight argument before certifying the 35/19 exponent. Used in [Ray-class L-function zero-density estimate](#ray-class-l-function-zero-density-estimate-ray-class-zero-density); [Many split primes outside a small quadratic exception set](#many-split-primes-outside-a-small-quadratic-exception-set-most-quadratic-many-split-primes); [Lemma 4.4 (Zaman's effective lower bound for prime ideals)](#lemma-4-4-zaman-s-effective-lower-bound-for-prime-ideals-effective-prime-ideal-lower).

**Genus character classification.** The existing subset/prime-discriminant genus characters require a quadratic generator and squarefree radicand, and passage to ordinary classes needs total complexity. Prove the subset/complement bijection onto all quadratic ordinary-class characters and the prime-to-D norm/Kronecker dictionary before using the analytic product factorization. Used in [Imaginary quadratic genus-character classification](#imaginary-quadratic-genus-character-classification-imaginary-genus-character-dictionary).

**Quadratic completed-factor normalization.** Identify the canonical imaginary-quadratic character, odd parity and conductor, and prove root number +1 by comparison with the Dedekind completion and Gamma duplication. A root number of absolute value 1 does not fix its sign. Specialize the regulator, embeddings and unit weight before using explicit residue values. Used in [Imaginary quadratic completion and root number](#imaginary-quadratic-completion-and-root-number-imaginary-quadratic-root-number-one).

**Canonical Hecke continuation and the Artin conductor.** Match ray/idele characters and canonical Tate continuation to the imported carriers before stating Hecke comparisons. Construct the general Artin conductor from the ramification filtration in this layer; the calculus identity for an odd completion is conditional on this arithmetic identification. Used in [Sufficient conductor-discriminant estimate](#sufficient-conductor-discriminant-estimate-artin-conductor-bound); [Logarithmic functional equation](#logarithmic-functional-equation-artin-log-functional-equation); [Canonical ray-character comparison and the quadratic endpoint](#canonical-ray-character-comparison-and-the-quadratic-endpoint-hecke-nonvanishing-on-line-one); [Primitive Hecke functional-equation normalization](#primitive-hecke-functional-equation-normalization-hecke-primitive-functional-equation); [Ideal-character Hecke L-function](#ideal-character-hecke-l-function-class-character-lseries-comparison).

**CM parity and conductor adapter proof.** For the CM quadratic character, match global reciprocity at real places, finite conductor, archimedean sign and canonical entire continuation. Prove Rademacher convexity and bounded-degree Brauer–Siegel uniformity rather than inferring them from a fixed-field functional equation. Used in [Two-sided quadratic Hecke value bound](#two-sided-quadratic-hecke-value-bound-quadratic-hecke-value-one); [A fixed small circle gives a subpolynomial derivative](#a-fixed-small-circle-gives-a-subpolynomial-derivative-quadratic-hecke-cauchy-derivative); [Subpolynomial logarithmic derivative at one](#subpolynomial-logarithmic-derivative-at-one-quadratic-hecke-log-derivative-one); [Logarithmic functional equation at zero and one](#logarithmic-functional-equation-at-zero-and-one-quadratic-hecke-log-functional-equation).

**Dedekind gamma and modulus adapters.** Compare Tate’s trace character, self-dual measure and inverse different with the stated Γℂ normalization. Exact meromorphic Gamma orders and positivity on Re s>1 give the negative-even zero order r₁+r₂. Deleted Euler factors are compared on the convergence half-plane and extended by uniqueness as germs. Used in [Negative even zeros of the continuation](#negative-even-zeros-of-the-continuation-dedekind-negative-even-zero); [Imaginary quadratic completion and root number](#imaginary-quadratic-completion-and-root-number-imaginary-quadratic-root-number-one); [Imprimitive Hecke deleted factors](#imprimitive-hecke-deleted-factors-imprimitive-hecke-factors).

**Colmez finite-family and regularized Brauer suppliers.** For degree-2g CM fields E, use the actual normal closure L and M_g=(2g)!, so |Gal(L/ℚ)|, the number of odd irreducibles and their dimensions are ≤M_g. Uniformly bound the number and absolute integer coefficients of monomial Brauer factors by B_g and their analytic conductors by D_E^C_g. If δ_j marks trivial factors, regularize H_j=(s−1)^δ_j L_j and prove Σn_jδ_j=0 before evaluating ∏H_j^n_j at 1. A CM application separately proves membership and bounded coefficients in this family; no higher CM theorem is an input to these analytic estimates. Used in [Sufficient conductor-discriminant estimate](#sufficient-conductor-discriminant-estimate-artin-conductor-bound); [Logarithmic functional equation](#logarithmic-functional-equation-artin-log-functional-equation); [Two-sided subpolynomial values at one](#two-sided-subpolynomial-values-at-one-artin-value-one-subpower); [Factorwise logarithmic derivative at one](#factorwise-logarithmic-derivative-at-one-artin-log-derivative-one).

**Effective Chebotarev: explicit formula, zero count and zero repulsion for Hecke L-functions.** Effective Chebotarev needs the abelian Hecke explicit formula, a uniform Dedekind zero count and Deuring–Heilbronn repulsion for the least-prime argument. Retain the exceptional Li(x^β₀) term in the field-uniform estimate until a separate separation bound proves absorption on an enlarged range. The original Lagarias–Odlyzko and Lagarias–Montgomery–Odlyzko proofs remain source boundaries. Used in [Effective Chebotarev density theorem](#effective-chebotarev-density-theorem-effective-chebotarev).

### Examples

For ℚ(i), the Dedekind residue is π/4, the quadratic character has conductor 4, its root number is 1, and its values are L(1)=π/4 and L(0)=1/2. The corresponding CM unit factor is ω₋₄=2. For ℚ(√−3), ω₋₃=3. In a totally real field the negative-even trivial-zero order is its degree; in an imaginary quadratic field it is one. A trivial Artin representation has local polynomial 1−T and a simple pole at 1; the zero-dimensional representation has local polynomial 1 and L-function 1.

### Dependencies

AutomorphicLFunctionsAndLocalFactors Layers 0–1; GlobalNumberFields Layers 2, 9 and 10; ClassFieldTheory Layers 7, 11 and 13; NumberFieldArithmetic Layers 1, 2 and 7; InductionRestriction Layers 3 and 6; lower ramification groups from LocalGaloisGroups; DifferentialGeometry Layers 5 and 12; GeometryOfNumbersAndQuadraticArithmetic Layer 3; AutomorphicSpectralTheory Layers 1–2. Analytic inputs are the Gamma and explicit-formula targets of Layer 1 and the zero-free estimates of Layer 0.

<a id="layer-3-multiplicative-means-smooth-numbers-and-moments"></a>

## Layer 3: Multiplicative means, smooth numbers and moments

Separate arithmetic coefficient bounds from mean-value theorems. The logarithmic-derivative coefficient class is not the class of all bounded multiplicative functions. The smooth-number and Beurling theories use actual indexed counting functions. Proven second and fourth moments are distinct from the general moment conjecture and its model constants.

<a id="explicit-divisor-subpower-bound-explicit-divisor-subpower-bound"></a>

### 3.1 Explicit divisor subpower bound

For ε>0 and any natural B≥exp(1/ε), all positive integers n satisfy τ(n)≤max(1,(ε log 2)⁻¹)^B n^ε. Thus the displayed constant is at least 1 and independent of n.

Assume ε>0; B natural with exp(1/ε)≤B; n>0.

The proof proceeds as follows. Set D=max(1,(ε log 2)⁻¹). Apply the local uniform bound to each prime p≤B. For p>B, the assumed cutoff implies exp(1/ε)≤p; apply the large-prime bound. Apply divisor-bound-from-local-bounds. A certified upper integer B is a permitted input: no exact ceiling evaluation is required.

The result must also satisfy these compatibility requirements: n=1 is covered. B may be increased without invalidating the estimate. The constant depends only on ε and the chosen certified B, never on n.

See [Terence Tao — The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), Proof of (3), large-prime step, and Proof of (4), Taylor estimate and finite small-prime product.

*Needs:* `Real.log_pos`; `Real.log_le_log`; `Real.add_one_le_exp`; `Real.rpow_def_of_pos`; `Real.le_log_iff_exp_le`; `Nat.card_divisors`; `Nat.prod_primeFactors_pow_factorization`; `Nat.prime_of_mem_primeFactors`; `Finset.prod_le_prod`; `Real.mul_rpow`; `Real.rpow_mul`; `Real.rpow_natCast`; [Uniform prime-power divisor bound](#proof-prime-power-log-bound); [Large-prime divisor factor bound](#proof-large-prime-power-bound); [Divisor bounds from local factors](#proof-divisor-bound-from-local-bounds).

<a id="proof-prime-power-log-bound"></a>

**Uniform prime-power divisor bound.** For ε>0, integers p≥2 and a≥0, put D=max(1,(ε log 2)⁻¹). Then a+1≤D p^(aε). D is notation for a real expression, not a new carrier.

Here ε>0; p,a natural; p≥2.

Logarithm monotonicity gives log p≥log 2>0. Thus D≥1 and D ε log p≥1. Multiply the latter inequality by a≥0 and add 1≤D to obtain a+1≤D(1+aε log p). Use 1+t≤exp t and p^(aε)=exp(aε log p).

See [Terence Tao — The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), Proof of (3), large-prime step, and Proof of (4), Taylor estimate and finite small-prime product.

<a id="proof-large-prime-power-bound"></a>

**Large-prime divisor factor bound.** For ε>0, positive integer p and a≥0, exp(1/ε)≤p implies a+1≤p^(aε).

Here ε>0; p>0; a natural; exp(1/ε)≤p.

Apply the exponential/logarithm equivalence to get ε log p≥1. Multiply by a, add 1 and apply 1+t≤exp t; identify the real power.

See [Terence Tao — The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), Proof of (3), large-prime step, and Proof of (4), Taylor estimate and finite small-prime product.

<a id="proof-divisor-bound-from-local-bounds"></a>

**Divisor bounds from local factors.** Let ε∈ℝ, D≥1 and B∈ℕ. Suppose for every prime p and a∈ℕ that a+1≤D p^(aε) if p≤B, and a+1≤p^(aε) if p>B. For every n>0, τ(n)≤D^B n^ε, with τ(n)=card(n.divisors).

Here D≥1; B natural; two uniform prime-power hypotheses; n>0.

Use Nat.card_divisors to write τ(n)=∏p|n(a_p+1); use Nat.prod_primeFactors_pow_factorization to write n=∏p|n p^a_p. Split the finite prime-factor set at p≤B. Multiply the respective nonnegative local bounds using Finset.prod_le_prod. Repeated Real.mul_rpow and Real.rpow_mul identify the prime-power product with n^ε. At most B small prime divisors occur, since they inject into {1,…,B}. Hence τ(n)≤D^r n^ε with r≤B; D≥1 gives D^r≤D^B.

See [Terence Tao — The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), Proof of (3), large-prime step, and Proof of (4), Taylor estimate and finite small-prime product.

<a id="largest-prime-factor-of-a-quadratic-conductor-quadratic-conductor-largest-prime"></a>

### 3.2 Largest prime factor of a quadratic conductor

If N>1 is the conductor of a primitive quadratic character, then P(N)>0.94*log(N).

The proof proceeds as follows. Import the prime-discriminant description of a primitive quadratic conductor, including its 2-adic possibilities. Combine the explicit prime-product bounds with certified small-conductor cases; N=24 must be included.

See [Michael A. Bennett and Samir Siksek — A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Lemma 7.3, p. 375.

*Needs:* `DirichletCharacter.conductor`; [Schoenfeld explicit Chebyshev bound](#schoenfeld-explicit-chebyshev-bound-schoenfeld-theta-upper); `Chebyshev.theta`.

<a id="uniform-coefficient-bound-by-a-divisor-function-ideal-coefficient-divisor-majorant"></a>

### 3.3 Uniform coefficient bound by a divisor function

For a degree-n number field K, n>=1, let a_K(m) count nonzero integral ideals of norm m. For every m>=1, a_K(m)<=d_n(m), where d_n counts ordered n-tuples of positive integers with product m. At each rational prime the Euler factor product over p-adic prime ideals (1-T^f_i)^(-1) is coefficientwise bounded by (1-T)^(-n), since f_i>=1 and the number of factors is <=n; multiply over primes.

The proof proceeds as follows. For each rational prime compare ∏_j(1−T^f_j)^−1 coefficientwise with (1−T)^−n. Use f_j≥1 and the number of prime-ideal factors ≤n, then multiply the finite local coefficient comparisons.

See [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Elementary Euler-factor adapter for Tsimerman §2.2, pp.380–381; count split prime-power exponents and compare with d_n.

*Needs:* `Ideal.absNorm`; `Nat.factorization`.

<a id="subpolynomial-fixed-order-divisor-function-fixed-order-divisor-subpower"></a>

### 3.4 Subpolynomial fixed-order divisor function

For each integer n>=1 and epsilon>0 there is C_(n,epsilon) with d_n(m)<=C_(n,epsilon)*m^epsilon for every m>=1. Use d_n(p^a)=binomial(a+n-1,n-1). For large p this is <=n^a<=p^(epsilon*a); for the finitely many smaller primes the supremum of the polynomial in a divided by p^(epsilon*a) is finite. The product of those finitely many constants is independent of m.

The proof proceeds as follows. Use d_n(p^a)=binomial(a+n−1,n−1)≤n^a for a≥0. Large primes have n≤p^ε; for each smaller prime a polynomial times p^−εa is bounded. Multiply the finitely many small-prime constants, independently of m.

See [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Elementary fixed-degree adapter for Tsimerman §2.2, pp.380–381, using the small/large-prime split of the divisor bound.

*Needs:* `Nat.factorization`.

<a id="products-of-distinct-medium-primes-medium-prime-products"></a>

### 3.5 Products of distinct medium primes

For x≥2 and m≥0, N_m(x) is the finite set of natural products over m-element subsets of {p prime:x/2≤p≤x}. N_0(x)={1}; subsets are unordered and primes are distinct.

The proof proceeds as follows. Form the finite prime set P_x={p∈ℕ: p prime, x/2≤p≤x} using the inclusive floor cutoff, and take the image of its m-element subsets under their natural product. Use Nat.primeFactors_prod to recover a subset from its product, hence prove injection. Library finite-image and powersetCard cardinality theorems supply the card API; no second factorization theory is needed. The product over an empty subset is 1. The support and squarefree APIs follow from the same finite prime product and its recovered factor set.

The required interface consists of the following operations and identities.

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

The result must also satisfy these compatibility requirements: N_0(10)={1}. N_1(10)={5,7}. N_2(10)={35} and N_3(10)=∅. 25∉N_2(10), excluding repeated primes and ordered-tuple multiplicity. N_1(4)={2,3}; an open lower cutoff would omit 2 and fails this test.

See [Lior Bary-Soroker, Dimitris Koukoulopoulos and Gady Kozma — Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), §3.6, definition immediately preceding (3.4), p.26.

*Needs:* `Nat.primeFactors_prod`; `Finset.card_powersetCard`; `Finset.card_image_of_injOn`.

<a id="inverse-totient-counting-input-inverse-totient-count"></a>

### 3.6 Inverse-totient counting input

For real x≥1, #{d∈ℕ_{>0}:φ(d)≤x}=O(x), with an absolute constant.

The proof proceeds as follows. Use the original inverse-totient counting theorem, with positive integers and φ(d)≤x. No implication is made from a pointwise lower bound on φ alone.

See [A. Smati — Evaluation effective du nombre d’entiers n tels que φ(n) ≤ x](https://www.impan.pl/shop/publication/transaction/download/product/107486), Introduction pp.143–145; stated effective theorem p.145.

*Needs:* `Nat.totient`.

<a id="maximal-order-divisor-upper-bound-divisor-maximal-order"></a>

### 3.7 Maximal-order divisor upper bound

For every real ε>0 there is a natural K>e such that for every natural n≥K, τ(n)≤exp((log 2+ε)log n/log log n). This is the upper bound; no matching lower-order limit is asserted here.

Assume ε>0; n is a positive natural number beyond the displayed threshold.

The proof proceeds as follows. Choose δ=ε/(4 log 2+2ε). Then 0<δ<1 and (log 2)/(1−δ)≤log 2+ε/2. Put L=log n and y=L^(1−δ). Increase the natural threshold until L≥e, y≥2 and the small-prime loss lemma holds with η=ε/2. By Nat.card_divisors and Real.log_prod, log τ(n)=Σ_{p|n}log(v_p(n)+1). Partition the finite set at y. The small-prime logarithm is at most (ε/2)L/log L by the first and third lemmas. The large-prime logarithm is at most (log 2)L/((1−δ)log L) by the second lemma and Real.log_rpow. Add the inequalities and exponentiate to obtain the exact stated ε bound. The independently planned uniform subpower theorem is not used in this proof.

See [Dimitris Koukoulopoulos — The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Exercise2.9(b),(e),(f), printed pp.33–34, k=2; [Lior Bary-Soroker, Dimitris Koukoulopoulos and Gady Kozma — Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), arXiv v3, proof of Lemma 3.1, p. 18, citing [18, §18.1, Theorem 317] (Hardy–Wright, sixth edition); subpower use in the proof of Lemma 12.3, p. 60.

*Needs:* `Nat.prime_of_mem_primeFactors`; `Nat.prod_primeFactors_pow_factorization`; `Real.log_pow`; `Real.log_le_log`; `Real.log_prod`; `isLittleO_log_rpow_rpow_atTop`; `Real.log_rpow`; `Nat.card_divisors`; `exists_nat_ge`; [Small-prime divisor logarithm](#proof-divisor-small-prime-log-bound); [Large-prime divisor logarithm](#proof-divisor-large-prime-log-bound); [Vanishing small-prime contribution](#proof-divisor-small-prime-loss).

<a id="proof-divisor-small-prime-log-bound"></a>

**Small-prime divisor logarithm.** For a natural n≥2 and real y≥2, Σ_{p∈primeFactors(n), p≤y} log(v_p(n)+1) ≤ y log(1+log n/log 2).

Here The ranges and positivity assumptions are explicit in the statement.

For each p dividing n, p≥2 and p^v_p(n) divides n. Monotonicity of log and log_pow give v_p(n)≤log n/log 2. Bound each nonnegative summand by log(1+log n/log 2). There are at most floor y distinct positive integers ≤y; cast this cardinality bound to R and multiply.

See [Dimitris Koukoulopoulos — The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Exercise2.9(b),(e),(f), printed pp.33–34, k=2.

<a id="proof-divisor-large-prime-log-bound"></a>

**Large-prime divisor logarithm.** For a natural n≥2 and real y>1, Σ_{p∈primeFactors(n), y<p} log(v_p(n)+1) ≤ (log 2)log n/log y.

Here The ranges and positivity assumptions are explicit in the statement.

Induction on a gives a+1≤2^a, hence log(a+1)≤a log 2. The factorization identity and log_prod/log_pow give Σ_{p|n}v_p(n)log p=log n. All terms are nonnegative. On the large-prime part, log y Σ v_p(n)≤log n; divide by the positive log y and multiply by log 2.

See [Dimitris Koukoulopoulos — The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Exercise2.9(b),(e),(f), printed pp.33–34, k=2.

<a id="proof-divisor-small-prime-loss"></a>

**Vanishing small-prime contribution.** For real 0<δ<1 and η>0 there is L₀≥e such that for every real L≥L₀, L^(1−δ)log(1+L/log 2) ≤ η L/log L.

Here The ranges and positivity assumptions are explicit in the statement.

For large L, log(1+L/log 2)≤C log L for an absolute C, by monotonicity and splitting off a fixed multiplicative constant. After dividing by the positive L/log L, the ratio is at most C(log L)^2/L^δ. The isLittleO_log_rpow_rpow_atTop with r=2 and s=δ makes this eventually at most η. Increase the threshold to e.

See [Dimitris Koukoulopoulos — The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Exercise2.9(b),(e),(f), printed pp.33–34, k=2.

<a id="even-von-mangoldt-function-even-von-mangoldt"></a>

### 3.8 Even von Mangoldt function

Λ_even(n)=ArithmeticFunction.vonMangoldt(|n|) for n∈Z, including Λ_even(0)=0.

The proof proceeds as follows. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

The required interface consists of the following operations and identities.

- `even_von_mangoldt.nat`: For positive n this is the von Mangoldt value.
- `even_von_mangoldt.neg`: Λ_even(−n)=Λ_even(n).
- `even_von_mangoldt.zero`: Λ_even(0)=0.

**Checks.**

- Λ_even(0)=0.
- Λ_even(−2)=log 2.
- Λ_even(−8)=log 2; Λ_even(−6)=0.

The result must also satisfy these compatibility requirements: Λ_even(0)=0. Λ_even(−2)=log 2. Λ_even(−8)=log 2; Λ_even(−6)=0.

See [Alexei N. Skorobogatov and Efthymios Sofos — Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), §3.1, definitions preceding Corollary3.3, published p.691.

*Needs:* `ArithmeticFunction.vonMangoldt`.

<a id="coprime-m-bius-sums-from-the-prime-number-theorem-3-6-coprime-mobius-log-sum"></a>

### 3.9 Coprime Möbius sums from the prime number theorem ((3.6))

For every A>0, uniformly in positive integers q≤T^4 and real T≥2, Σ_{1≤t≤T,(t,q)=1} μ(t)log t/t=−q/φ(q)+O_A((log T)^−A).

The proof proceeds as follows. Use a coprimality Euler factor and a conductor-uniform Möbius PNT. Prove q≤T^4 uniformity with a sufficiently large logarithmic power before replacing it by A.

See [Alexei N. Skorobogatov and Efthymios Sofos — Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Equation(3.6), proof of Lemma3.11, published p.699.

*Needs:* `ArithmeticFunction.moebius`.

<a id="gamma-euler-product-truncation-gamma-prime-product-tail"></a>

### 3.10 Gamma Euler-product truncation

For fixed n∈ℕ and real x≥e², define γ_n(p)=1−1/p+(1+1/(p−1))^n/p for each rational prime p. The convergent product over p>log x is 1+O_n(1/log x), uniformly after retaining any subset of those primes. In particular γ_0(p)=1; the equivalent expression p^(n−1)/(p−1)^n uses an integer exponent n−1, never truncated natural subtraction.

The proof proceeds as follows. For p>log x≥2, use 0<1/(p−1)<1 and the finite binomial expansion to obtain 1≤γ_n(p)≤1+K_n/(p(p−1)); n=0 gives equality 1 directly. For any finite prime subset in this range, 0≤Σlog γ_n(p)≤K_nΣ_{k>log x}1/(k(k−1))≤2K_n/log x. Exponentiation bounds the finite product minus 1 by a constant depending only on n divided by log x. Pass from finite products to the convergent product using the summable nonnegative logarithms. The required infinite-product API and local bound are specified in the scoped mean gap; the finite bound is uniform in the retained subset.

The result must also satisfy these compatibility requirements: n=0 gives product 1; n=1 has local factor 1+1/(p(p−1)). For any retained subset, the product is at least 1 and obeys the same upper error bound, with no subset-dependent constant. At x=e² the tail excludes the prime 2; no strict inequality is applied at 1/(2−1)=1.

See [Alexei N. Skorobogatov and Efthymios Sofos — Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Lemma4.5 and full proof, published pp.708–709.

*Needs:* `Nat.Prime`.

<a id="size-of-1-n-and-of-the-divisor-function-3-7-totient-reciprocal-bound"></a>

### 3.11 Size of 1/φ(n) and of the divisor function (3.7)

For n≥3, 1/φ(n)≤C log log n/n, with an absolute C>0.

The proof proceeds as follows. Use Nat.totient_eq_mul_prod_factors, transfer the rational product equality to ℝ, and divide only at n≥3, where φ(n)>0. Thus n/φ(n)=∏_{p|n}(1−1/p)^−1. For sufficiently large n split at y=log n. The small-prime factor is at most the full reciprocal Mertens product through y, hence O(log log n). If r distinct prime divisors exceed y, then y^r≤n, so r≤log n/log y. Since −log(1−1/p)≤2/p for p≥2, their log product is at most 2r/y≤2/log y, hence uniformly bounded. Absorb the finitely many integers 3≤n below the chosen threshold into the positive constant C. No estimate at log log1 or log log2 is used.

See [Alexei N. Skorobogatov and Efthymios Sofos — Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Equation(3.7), published p.699; cited Montgomery–Vaughan Theorem2.9.

*Needs:* [Mertens sum and product inputs](#mertens-sum-and-product-inputs-mertens-prime-product); `Nat.totient_eq_mul_prod_factors`.

<a id="coprime-m-bius-sums-from-the-prime-number-theorem-3-6-coprime-mobius-reciprocal-sum"></a>

### 3.12 Coprime Möbius sums from the prime number theorem ((3.6))

For every A>0, uniformly in positive integers q≤T^4 and T≥2, Σ_{1≤t≤T,(t,q)=1} μ(t)/t=O_A((log T)^−A).

The proof proceeds as follows. Use the same uniform coprimality Euler factor argument as the logarithmic sum, with one extra partial summation.

See [Alexei N. Skorobogatov and Efthymios Sofos — Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Equation(3.6), proof of Lemma3.11, published p.699.

*Needs:* `ArithmeticFunction.moebius`.

<a id="landau-ramanujan-count-of-sums-of-two-squares-landau-sum-two-squares-count"></a>

### 3.13 Landau–Ramanujan count of sums of two squares

For K→∞, #{1≤k≤K:k=u²+v² for some integers u,v}∼C_L K/√log K with the positive Landau–Ramanujan constant C_L.

Assume K tends to infinity through positive real cutoffs; u,v are integers and represented integers are counted once, not by representation multiplicity.

The proof proceeds as follows. Convert integer-square witnesses to natural-square witnesses and use the Nat.eq_sq_add_sq_iff; no new arithmetic representation criterion is planned. For the 0/1 indicator b, the Euler factors are (1−p^(−s))^(−1) for p=2 or p≡1 mod4, and (1−p^(−2s))^(−1) for p≡3 mod4. Thus B(s)²=ζ(s)L(s,χ_−4)(1−2^(−s))^(−1)∏_{p≡3 mod4}(1−p^(−2s))^(−1) on Re s>1. Use fixed-modulus Siegel–Walfisz to verify the weighted-prime input (13.1) with κ=1/2; b≤1 satisfies (13.2). Apply the missing Selberg–Delange interface of Theorem13.2 and evaluate c₀/Γ(1/2). Its proof and constant/product convergence are recorded in the Landau gap.

The result must also satisfy these compatibility requirements: C_L=(1/√2)∏_{p≡3 mod4}(1−p^(−2))^(−1/2), with a convergent positive product; this explicit constant evaluation remains part of the recorded proof gap. At K=1 the count is1; at K=5 it is4 (1,2,4,5). The count at K=3 is2, so3 is excluded. 9=0²+3² is counted: the forbidden prime3 may occur to an even power. Counting only integers supported on p=2 or p≡1 mod4 would fail this test.

See [Amit Ghosh and Peter Sarnak — Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); [Dimitris Koukoulopoulos — The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Chapter13, (13.1)–(13.2), Theorem13.2 pp.130–134 and Exercise13.4 p.140; [Amit Ghosh and Peter Sarnak — Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), Introduction p.3, exceptional families; §4.1 pp.12–13.

*Needs:* `Nat.eq_sq_add_sq_iff`; [Siegel–Walfisz theorem](#siegel-walfisz-theorem-siegel-walfisz).

<a id="landau-upper-bound-for-shifted-eisenstein-norms-landau-three-square-form-count"></a>

### 3.14 Landau upper bound for shifted Eisenstein norms

For real K≥2, the count of positive integers k≤K with 4(k−1)=u²+3v² for some integers u,v is at most C K/√log K for one absolute C>0; the k=1 norm-zero case is counted once.

Assume K≥2 is a real cutoff; integer witnesses include0 and signs; count represented k, not pairs(u,v).

The proof proceeds as follows. Put m=k−1≥0. The equation forces u and v to have the same parity. The integral change a=(u+v)/2, b=v gives m=a²−ab+b², and conversely u=2a−b, v=b. For positive m use the exact Eisenstein-norm criterion: every prime p≡2 mod3 has even valuation, including p=2. That arithmetic criterion is not a consequence of the sum-of-two-squares theorem and remains a supplier gap. Apply the fixed-modulus multiplicative-mean theorem with κ=1/2, supplied prime distribution, and the positive residual Euler factor. The norm-zero case contributes1 and the shift by1 preserves the stated upper bound.

The result must also satisfy these compatibility requirements: k=1 and2 are counted (norms0,1). k=3 is excluded because2 has odd valuation at the inert prime2. k=4 is counted (u,v)=(3,1), although k−1=3 is not a sum of two integer squares. k=5 is counted (u,v)=(4,0), exercising the even exponent of2.

See [Amit Ghosh and Peter Sarnak — Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); [Amit Ghosh and Peter Sarnak — Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), Introduction p.3, exceptional families; §4.1 pp.12–13.

*Needs:* [Siegel–Walfisz theorem](#siegel-walfisz-theorem-siegel-walfisz).

<a id="elementary-shifted-square-count-shifted-square-count"></a>

### 3.15 Elementary shifted-square count

#{1≤k≤K:k−4 is an integer square}≤1+√max(K−4,0), for K≥1.

Assume K≥1 is a real cutoff; k is a positive integer and the square witness is an integer.

The proof proceeds as follows. For K<4 the set is empty. For K≥4, replace each integer square witness by its nonnegative absolute value; k↦u is inverse to the injective map u↦u²+4. For an integer cutoff N≥4, Nat.le_sqrt' identifies the witness interval 0≤u≤Nat.sqrt(N−4); Set.InjOn.ncard_image and Set.ncard_Iic_nat give its exact cardinality Nat.sqrt(N−4)+1. For a real cutoff use N=floor K and the real square-root comparison to get the displayed upper bound. The finite/real floor adapter is routine; the k=4, u=0 point must be retained.

The result must also satisfy these compatibility requirements: For integer N, the count is0 when N<4 and Nat.sqrt(N−4)+1 when N≥4. At K=3 the count is0; at K=4 it is1; at K=5 it is2; at K=13 it is4 (4,5,8,13). At K=4 the bound is exactly1, so the square-zero case is included.

See [Amit Ghosh and Peter Sarnak — Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); [Amit Ghosh and Peter Sarnak — Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), Introduction p.3, exceptional families; §4.1 pp.12–13.

*Needs:* `Nat.le_sqrt'`; `Set.InjOn.ncard_image`; `Set.ncard_Iic_nat`.

<a id="counts-supported-on-half-the-reduced-prime-classes-half-density-prime-support-count"></a>

### 3.16 Counts supported on half the reduced prime classes

Fix a positive modulus M and R⊆(ZMod M)^× with 2#R=φ(M); primes dividing M are excluded. Let H be the subgroup generated by R. For each fixed a∈H there are C₁,C₂>0 and X₀≥2, depending only on M,R,a, such that for all X≥X₀ the count of positive ν≤X with every prime factor lying in R modulo M and ν≡a mod M lies between C₁ X/√log X and C₂ X/√log X. If a∉H, that count is0. The empty factorization ofν=1 is included only in the identity class.

Assume M,R,a are fixed before X tends to infinity; the exact half-cardinality condition is2#R=φ(M), with no rounded integer division.; All prime factors are tested, including repeated factors and the primes dividing M, which are forbidden; ν≥1.

The proof proceeds as follows. Form the multiplicative 0/1 indicator with Euler factors (1−p^(−s))^(−1) only at allowed primes; do not replace it by a squarefree indicator. Use finite Dirichlet-character orthogonality to select ν≡a modM. For each twist χ the weighted prime mean is κ_χ=φ(M)^(−1)Σ_{r∈R}χ(r), supplied by fixed-modulus Siegel–Walfisz. The maximal real part is1/2 exactly for characters trivial on H. Their twists equal the untwisted indicator on every supported integer; for a∈H the leading terms therefore add rather than cancel. All other twists have a strict real-exponent gap because M and R are fixed. Apply the missing complex-κ Selberg–Delange interface of Theorem13.2, then prove positivity of the untwisted residual factor using fixed-modulus Dirichlet nonvanishing and the convergent higher-power factors. The character decomposition, branch/product estimate and positivity are recorded as gaps. Products of allowed unit classes lie in H, giving the zero count outside H, including the ν=1 identity-class convention.

The result must also satisfy these compatibility requirements: For M=4, R={1}, H={1}; class3 has count0. Allowing arbitrary reduced classes would give a false positive count. For M=4, R={3}, H={1,3}; both classes have positive asymptotic-sized counts; the identity class includesν=1 and products of an even number of3 mod4 primes. 9 is allowed when M=4,R={3}, whereas3 is forbidden for R={1}; this distinguishes the unrestricted-support and squarefree indicators. The exact half-cardinality condition has no solution for M=1 or2, sinceφ(M)=1; roundingφ(M)/2 would falsely admit the empty prime family.

See [Amit Ghosh and Peter Sarnak — Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); [Amit Ghosh and Peter Sarnak — Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), §8, Proposition8.1 and ensuing density discussion, pp.22–24; [Dimitris Koukoulopoulos — The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Chapter13 (13.1)–(13.2), Theorem13.2 pp.130–134.

*Needs:* [Siegel–Walfisz theorem](#siegel-walfisz-theorem-siegel-walfisz); `DirichletCharacter.LFunction_ne_zero_of_one_le_re`.

<a id="logarithmic-weight-of-prime-divisors-prime-divisor-log-weight"></a>

### 3.17 Logarithmic weight of prime divisors

For every integer N≥2, Σ_{p|N}(log p)/p≤log log N+C for one absolute real C.

Assume N is a natural integer≥2; sum over distinct prime divisors; one absolute C precedes allN.

The proof proceeds as follows. For N≥e² split the distinct primes at X=log N≥2. Apply Mertens’s first theorem to p<X; primes at the endpoint belong to the large-prime group. Nat.prod_primeFactors_dvd gives a positive squarefree kernel at mostN. Apply Real.log_prod and Real.log_le_log to get Σ_{p|N}log p≤log N; no divisor-product equality withN is assumed. For p≥X use1/p≤1/X, so that Σ_{p|N,p≥X}log p/p≤1. Combine the groups; for2≤N<e² absorb the finite many values intoC, retaining possible negative log logN.

The result must also satisfy these compatibility requirements: N=2 is included even though log log2<0; the constant must absorb that value. For N=2^a witha≥1, the left side islog2/2, independent ofa; primes must be counted distinctly. A prime at p=log N is assigned to the large-prime group by the half-open split, so no endpoint is lost.

See [Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou — Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields](https://doi.org/10.1017/fmp.2022.14), Proof of Proposition 5.2, p.27.

*Needs:* [Mertens's first theorem and Σ_{p | N} log p/p = O(log log N)](#mertens-s-first-theorem-and-p-n-log-p-p-o-log-log-n-mertens-first-theorem); `Nat.prod_primeFactors_dvd`; `Real.log_prod`; `Real.log_le_log`.

<a id="pretentious-distance-pretentious-distance"></a>

### 3.18 Pretentious distance

For complex-valued f,g on positive integers and x≥1, D(f,g;x)=sqrt(Σ_{p≤x}(1−Re(f(p)conj(g(p))))/p), used under |f(p)|,|g(p)|≤1. This is a distance on prime data, not a metric on all multiplicative functions: D(f,f;x) can be positive if |f(p)|<1. The representative prime-data distance is `pretentiousDist`, with multiplicative triangle inequality `pretentiousDist_mul_le` for disk-valued functions.

The proof proceeds as follows. Take the finite prime set p≤floor x and the real square root of the displayed sum. Under unit-disc prime values each summand is nonnegative. All evaluation, symmetry, prime-data and cutoff API statements follow from finite sums and the real square-root laws; use the separately promoted square-nonnegative lemma when it is a prerequisite.

The required interface consists of the following operations and identities.

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

The result must also satisfy these compatibility requirements: D(1,1;x)=0. D(1,−1;x)²=2Σ_{p≤x}1/p. D(0,0;2)²=1/2, disproving an unqualified metric diagonal axiom. D(f,g;1)=0.

See [Andrew Granville and K. Soundararajan — Pretentious multiplicative functions and an inequality for the zeta-function](https://arxiv.org/pdf/math/0608407), pp.2–4: M(x,T) on p.2 and weighted unit-disc product norm on pp.3–4.

*Needs:* `Nat.Prime`; `Real.sqrt`; [Triangle inequality for pretentious products](#proof-pretentious-product-triangle); [Squared pretentious-distance formula](#proof-pretentious-square-nonnegative); [Unit-disc product distance inequality](#proof-unit-disc-product-distance).

<a id="proof-pretentious-product-triangle"></a>

**Triangle inequality for pretentious products.** For |f_j(p)|,|g_j(p)|≤1, D(f₁f₂,g₁g₂;x)≤D(f₁,g₁;x)+D(f₂,g₂;x). If all g_j have unit modulus on the primes, this gives the usual triangle inequality for prime data.

Apply unit-disc-product-distance to z=f₁(p)conj(g₁(p)), w=f₂(p)conj(g₂(p)) for each prime p≤x. Multiply by sqrt(1/p), sum the squares, and apply finite Cauchy–Schwarz to obtain the weighted Euclidean product triangle. For D(f,h)≤D(f,g)+D(g,h), the intermediate g must have |g(p)|=1 so f(p)conj(g(p))g(p)conj(h(p))=f(p)conj(h(p)). Do not impose a zero diagonal on arbitrary unit-disc functions.

See [Andrew Granville and K. Soundararajan — Pretentious multiplicative functions and an inequality for the zeta-function](https://arxiv.org/pdf/math/0608407), pp.3–4, inequality(5) and the unit-disc weight example.

<a id="proof-pretentious-square-nonnegative"></a>

**Squared pretentious-distance formula.** Under the prime unit-disc hypotheses, D(f,g;x)²=Σ_{p≤x}(1−Re(f(p)conj(g(p))))/p≥0.

Unfold the stated definition and apply the finite algebraic, positivity or convergent geometric-series computation.

See [Andrew Granville and K. Soundararajan — Pretentious multiplicative functions and an inequality for the zeta-function](https://arxiv.org/pdf/math/0608407), Weighted norm discussion pp3–4.

<a id="proof-unit-disc-product-distance"></a>

**Unit-disc product distance inequality.** For complex z,w with |z|,|w|≤1, sqrt(1−Re(zw))≤sqrt(1−Re z)+sqrt(1−Re w).

Put a=1−Re z and b=1−Re w, so a,b≥0 and (Im z)²≤2a, (Im w)²≤2b by the unit-disc assumptions. Then 1−Re(zw)=a+b−ab+(Im z)(Im w)≤a+b+2sqrt(ab)=(sqrt a+sqrt b)². Both sides are nonnegative, so take square roots. This proves the extension from the unit circle without assuming it.

See [Andrew Granville and K. Soundararajan — Pretentious multiplicative functions and an inequality for the zeta-function](https://arxiv.org/pdf/math/0608407), p.4 first paragraph, extension of the η product inequality to the closed unit disc.

<a id="logarithmic-derivative-coefficient-class-halasz-coefficient-class"></a>

### 3.19 Logarithmic-derivative coefficient class

For κ>0, C(κ) is a predicate on the ArithmeticFunction C, with its fixed value f(0)=0 and ordinary coprime multiplicativity f(1)=1. Membership is witnessed by an ArithmeticFunction C coefficient b=Λ_f with |b(n)|≤κΛ(n) for every n, including0,1. For every Re s>1 the three series F(s)=LSeries f s, LSeries b s and H(s)=LSeries (n↦b(n)/log n) s are absolutely convergent, F(s)=exp(H(s)), and −F′(s)/F(s)=LSeries b s. Division at n=0,1 is totalized to0, since b(0)=b(1)=0. This exponential identity fixes the Euler logarithm branch; it is not an arbitrary Prop field or an unrelated logarithm. Coefficient uniqueness follows from the logarithmic derivative and LSeries uniqueness, including the normalized zero coefficient.

The proof proceeds as follows. Use the existing arithmetic-function carrier and coprime-multiplicative predicate. Require a concrete zero-extended b and the stated inequalities and three summability/analytic identities on the genuine convergence half-plane. Use choice to expose b through the data API; apply LSeries.eq_of_LSeries_eventually_eq to prove witness uniqueness at positive n and zero extension at0. The logarithmic series has coefficients b(n)/log n; no new generic Dirichlet-series theory is planned. Derive nonvanishing from F=exp(H), monotonicity in κ from the coefficient bound, and extensionality from the underlying arithmetic functions. The unit, Möbius, norm-twist and growth rejection tests compare exact coefficients.

The required interface consists of the following operations and identities.

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

The result must also satisfy these compatibility requirements: The arithmetic function with f(0)=0 and f(n)=1 for n≥1 belongs to C(1), with Λ_f=Λ. μ belongs to C(1), with Λ_f=−Λ. The arithmetic function with f(0)=0 and f(n)=n^(it) for n≥1 belongs to C(1), with Λ_f(n)=n^(it)Λ(n). f(n)=n belongs to no fixed C(κ), since |Λ_f(p)|=p log p.

See [Andrew Granville, Adam J. Harper and K. Soundararajan — A new proof of Halász’s theorem, and its consequences](https://arxiv.org/pdf/1706.03749v1), §1 p.1, first three displayed series and definition of C(κ).

*Needs:* `ArithmeticFunction.IsMultiplicative`; `LSeries.eq_of_LSeries_eventually_eq`; `LSeriesSummable`.

<a id="smooth-number-counting-function-smooth-count"></a>

### 3.20 Smooth-number counting function

For x≥1,y≥2, Ψ(x,y)=#{1≤n≤floor x:every prime factor of n is≤y}. Express the set using Nat.smoothNumbers(floor y+1); the carrier uses prime factors strictly below its cutoff. The representative inclusive count is `smoothCount`; `smoothCount_eq` compares it with the library’s strict prime cutoff.

The proof proceeds as follows. Define Ψ for all real x,y using Nat.smoothNumbersUpTo(floor x)(floor y+1), then restrict analytic statements to x≥1,y≥2. Nonnegative floor converts the strict natural-prime cutoff to p≤y on this domain. Use the membership lemma for positivity and x cutoff; monotonicity follows from floor monotonicity and finite-set inclusion. If y≥x≥2 every positive n≤floor x has all prime divisors≤n≤y. Check the two finite examples and exclusion of0 against the native finite set; the value at x<1 is0 because floor x=0.

The required interface consists of the following operations and identities.

- `smooth_count.floor`: Ψ(x,y) counts the positive naturals≤floor x in Nat.smoothNumbers(floor y+1).
- `smooth_count.mono`: Ψ is nondecreasing in each real parameter.
- `smooth_count.large_y`: For y≥x≥2, Ψ(x,y)=floor x.
- `smooth_count.unit`: The integer1 always contributes once.

**Checks.**

- Ψ(8,2)=4, counting1,2,4,8.
- Ψ(6,3)=5, counting1,2,3,4,6; the prime3 is included.
- 0 is never counted.
- Ψ(0,2)=0.

The result must also satisfy these compatibility requirements: Ψ(8,2)=4, counting1,2,4,8. Ψ(6,3)=5, counting1,2,3,4,6; the prime3 is included. 0 is never counted. Ψ(0,2)=0; the real extension has no nonpositive integers.

See [Adolf Hildebrand and Gérald Tenenbaum — Integers without large prime factors](https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf), Introduction, printed p.411 (terminology); Introduction p.412 and §1 p.414 formula(1.3).

*Needs:* `Nat.smoothNumbers`; `Nat.smoothNumbersUpTo`; `Nat.mem_smoothNumbersUpTo`.

<a id="dickman-function-dickman-function"></a>

### 3.21 Dickman function

ρ:R→R is0 for u<0, equals1 for0≤u≤1, is continuous on[0,∞), and satisfies uρ′(u)=−ρ(u−1) on u>1. Construct it recursively on intervals[k,k+1] by integration; the value at0 is1, so no continuity across negative u is claimed.

The proof proceeds as follows. Set ρ=0 on negative arguments and ρ=1 on[0,1]. Inductively define ρ(u)=ρ(k)−∫_k^u ρ(t−1)/t dt for k≥1 and k≤u≤k+1. The integrand is continuous on each step; endpoint agreement glues a continuous function on[0,∞). The fundamental theorem of calculus gives HasDerivAt ρ(−ρ(u−1)/u) u for u>1. Continuity is not differentiability at1: the left derivative is0 and the right derivative is−1. Telescoping the steps yields the global integral recursion. Two continuous integral-recursion solutions with the same initial data agree by induction on consecutive unit intervals. No uniqueness outside[0,∞) follows unless the negative convention is imposed. For all real u prove uρ(u)=∫_{u−1}^uρ(v)dv: check u≤1 directly, and for u>1 differentiate both sides and match at1. This identity supplies the first-zero contradiction; positivity implies strict decrease for u>1 and antitonicity on[0,∞). Hildebrand–Tenenbaum Lemma2.5 has this complete elementary proof.

The required interface consists of the following operations and identities.

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

The result must also satisfy these compatibility requirements: ρ(0)=ρ(1)=1. ρ(2)=1−log2. ρ(−1)=0; extending1 to negative u would violate the convention. The delay derivative holds at integers≥2, but not at1.

See [Adolf Hildebrand and Gérald Tenenbaum — Integers without large prime factors](https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf), Introduction, printed p.411 (terminology); p.414 equation(1.5); §2 Lemma2.5 and complete proof p.426.

*Needs:* `intervalIntegral`.

<a id="dirichlet-divisor-average-dirichlet-divisor-average"></a>

### 3.22 Dirichlet divisor average

For x≥2, Σ_{1≤n≤x}τ(n)=x log x+(2γ−1)x+O(√x), with an absolute constant and inclusive real cutoff.

The proof proceeds as follows. Apply the exact symmetric hyperbola identity with M=floor(sqrt x)≥1. Replace each floor(x/a) by x/a with an error of absolute value<1, for a total O(M). Use H_M=log M+γ+O(1/M). With δ=sqrt x−M∈[0,1), expand 2x log M−M² around M=sqrt x; the discrepancy from x log x−x is O(1), while x/M=O(sqrt x) for x≥2. Combine the errors with an absolute constant. This proof uses no subpower divisor bound.

The result must also satisfy these compatibility requirements: The exact divisor sums at x=1 and x=4 are1 and8; the asymptotic is asserted on x≥2 with a single absolute constant. A perfect-square endpoint is included once. The error O(sqrt x) requires the harmonic remainder rate, not merely existence of the Euler-constant limit.

See [Dimitris Koukoulopoulos — The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Theorem3.3 and complete hyperbola proof, printed pp.38–39; Theorem1.11 pp.15–16.

*Needs:* `Real.eulerMascheroniSeq_lt_eulerMascheroniConstant`; `Real.eulerMascheroniConstant_lt_eulerMascheroniSeq'`; `Real.log_le_sub_one_of_pos`; [Harmonic sum remainder](#proof-harmonic-euler-remainder); [Divisor hyperbola identity](#proof-divisor-hyperbola-identity).

<a id="proof-harmonic-euler-remainder"></a>

**Harmonic sum remainder.** For every integer N≥1, 0<H_N−log N−γ<log(1+1/N)≤1/N, where H_N=Σ_{1≤n≤N}1/n and γ is the Euler–Mascheroni constant.

Unfold the two Euler-sequence inequalities at N>0; subtract to trap H_N−log N−γ between0 and log(N+1)−log N. Use log(N+1)−log N=log(1+1/N) and the positive-real log inequality. No new Euler constant is defined.

See [Dimitris Koukoulopoulos — The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Theorem1.11 and complete proof, printed pp.15–16; Euler-sequence inequalities.

<a id="proof-divisor-hyperbola-identity"></a>

**Divisor hyperbola identity.** For real x≥1 and M=floor(sqrt x), Σ_{1≤n≤floor x}τ(n)+M²=2Σ_{1≤a≤M}floor(x/a). The equality is exact, including x at a perfect square.

Count positive ordered pairs(a,b) with ab≤x. A pair has a≤M or b≤M because (M+1)²>x. Transpose to equate the two strips; their intersection is precisely1≤a,b≤M, containing M² pairs. Regroup pairs by ab and use the existing divisor carrier.

See [Dimitris Koukoulopoulos — The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Hyperbola discussion, printed pp.38–39, (3.4)–(3.5) and Theorem3.3 proof.

<a id="second-moment-of-zeta-zeta-second-moment"></a>

### 3.23 Second moment of zeta

As T→∞, ∫_0^T|ζ(1/2+it)|²dt=T log(T/(2π))+(2γ−1)T+O(√T log T), with an absolute constant.

The proof proceeds as follows. Use a proved approximate functional equation with its uniform error. Integrate the diagonal and control off-diagonal terms using a Dirichlet-polynomial mean value theorem. A permitted modern proof route is the explicit Corollary 1 of Simonič–Starichkova: its T^(1/3)(log T)^(5/3) error is eventually bounded by sqrt(T)log T. Reconstruct its Atkinson/Voronoi and short-interval estimates rather than treating an introductory attribution as proof.

The result must also satisfy these compatibility requirements: The quantitative proof and the normalization comparisons are required separately.

See [Aleksander Simonič and Valeriia V. Starichkova — Atkinson’s formula for the mean square of ζ(s) with an explicit error term](https://arxiv.org/pdf/2105.06821), §1, equations (1)–(2), p.1; Corollary 1 (15), p.4, proves a stronger eventual error; [A. E. Ingham — Mean-value theorems in the theory of the Riemann zeta-function](https://doi.org/10.1112/plms/s2-27.1.273), pp.273–300; original proof and exact internal locator remain to verify.

*Needs:* [Mean square of a Dirichlet polynomial](#mean-square-of-a-dirichlet-polynomial-dirichlet-polynomial-mean-square); `riemannZeta`.

<a id="fourth-moment-of-zeta-zeta-fourth-moment"></a>

### 3.24 Fourth moment of zeta

As T→∞, ∫_0^T|ζ(1/2+it)|⁴dt=(1/(2π²))T(log T)^4+O(T(log T)^3), with an absolute constant.

The proof proceeds as follows. Use the original Ingham fourth-moment proof, including its approximate functional equation. Separate diagonal and off-diagonal estimates; the second-moment theorem does not imply this constant. The leading coefficient of Conrey’s displayed residue is 2/(4!ζ(2))=1/(2π²). The remaining polynomial has degree≤3; the second correction term does not alter degree four. The quoted Heath-Brown remainder O(T^(7/8+ε)), with fixed ε<1/8, is smaller than T(log T)^3. Its original proof remains required.

The result must also satisfy these compatibility requirements: The quantitative proof and the normalization comparisons are required separately.

See [J. B. Conrey — A note on the fourth power moment of the Riemann zeta-function](https://arxiv.org/pdf/math/9509224), p.1, opening fourth-moment formula and displayed theorem for the coefficient polynomial; the original Heath-Brown moment estimate is a separate proof input; [A. E. Ingham — Mean-value theorems in the theory of the Riemann zeta-function](https://doi.org/10.1112/plms/s2-27.1.273), pp.273–300; original proof and exact internal locator remain to verify.

*Needs:* [Mean square of a Dirichlet polynomial](#mean-square-of-a-dirichlet-polynomial-dirichlet-polynomial-mean-square); `riemannZeta`.

<a id="beurling-prime-system-beurling-prime-system"></a>

### 3.25 Beurling prime system

A discrete Beurling prime system is a nondecreasing sequence of real numbers1<p₁≤p₂≤… tending to∞. Generalized integers are finite-support exponent vectors a:N→N, with norm∏p_j^(a_j); coincident real values are counted with multiplicity. N(x) counts these vectors of norm≤x, and π_P(x) counts the prime indices with p_j≤x. The representative structure is `BeurlingPrimeSystem`, with indexed count `BeurlingPrimeSystem.primeCount`; `exists_beurlingPrimeSystem_nth_prime` gives the ordinary prime sequence.

The proof proceeds as follows. Use a monotone real sequence p:N→R with p(0)>1 and p→∞. Generalized integers are N→₀N, not the set of real norm values. Define their norm by the finite product and counts by finite subtype cardinality. For x≥1, only finitely many indices satisfy p(i)≤x, by escape to∞; every contributing exponent is≤log x/log p(0). Every positive exponent forces its prime≤x. Embed contributing vectors into the product of these finite exponent intervals. For x<1 there are none, since every norm≥1. Coordinatewise addition gives norm(a+b)=norm(a)norm(b); the zero vector has norm1. Unique factorization of ordinary positive naturals supplies the ordinary-prime compatibility, preserving repeated norms for a general system.

The required interface consists of the following operations and identities.

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

The result must also satisfy these compatibility requirements: The ordinary primes give N(10)=10. If p₁=p₂=2<p₃, N(2)=3, counting the unit and two distinct norm2 vectors. For1≤x<p₁, N(x)=1 and π_P(x)=0. A sequence with p₁=1 is rejected because N(x) would have infinitely many unit powers.

See [Gregory Debruyne and Jasson Vindas — On general prime number theorems with remainder](https://arxiv.org/pdf/1601.05324), Introduction p.1, definition and counting functions (1); §2.1 p.3.

*Needs:* `Nat.primeCounting`.

<a id="uniform-divisor-subpower-bound-uniform-divisor-subpower-bound"></a>

### 3.26 Uniform divisor subpower bound

For every ε>0 there exists a real C≥1 such that τ(n)≤C n^ε for every positive integer n. One choice is C=max(1,(ε log 2)⁻¹)^B for any natural B≥exp(1/ε). The representative signature is `card_divisors_le`.

Assume ε>0.

The proof proceeds as follows. Choose B by the Archimedean theorem exists_nat_ge applied to exp(1/ε). Take the explicit constant and use D≥1 to verify C≥1; invoke explicit-divisor-subpower-bound for every n>0. For an effectively presented positive ε, certified bounds for exponential and logarithm produce an effective upper constant. For an arbitrary abstract real ε, this is a mathematical existence assertion, not a uniform executable real-number algorithm.

The result must also satisfy these compatibility requirements: ε=1/(64c), c>0, supplies the exact ES.0 request for every M>0. C is retained at small inputs; setting C=1 for all n fails at n=2, ε=1/2. No squarefreeness, primitivity or coprimality hypothesis appears.

See [Terence Tao — The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), Proof of (3), large-prime step, and Proof of (4), Taylor estimate and finite small-prime product.

*Needs:* [Explicit divisor subpower bound](#explicit-divisor-subpower-bound-explicit-divisor-subpower-bound); `exists_nat_ge`.

<a id="uniform-bounded-norm-ideal-count-bounded-norm-ideal-count"></a>

### 3.27 Uniform bounded-norm ideal count

For every fixed g≥1 and ε>0 there is C(g,ε)>0 such that for every number field E of degree 2g and every integer n≥1, the number of nonzero integral ideals of norm n is at most C(g,ε)n^ε. Consequently, for every real X≥1 the number of such ideals of norm at most X is O_(g,ε)(X^(1+ε)). Both constants are uniform in E.

The proof proceeds as follows. Combine the coefficient divisor majorant and the fixed-order divisor bound. Sum m^ε for m≤X; no field-dependent constant is introduced.

See [Jacob Tsimerman — The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), 2.2, p. 382.

*Needs:* [Uniform coefficient bound by a divisor function](#uniform-coefficient-bound-by-a-divisor-function-ideal-coefficient-divisor-majorant); [Subpolynomial fixed-order divisor function](#subpolynomial-fixed-order-divisor-function-fixed-order-divisor-subpower).

<a id="cardinality-of-medium-prime-products-medium-prime-cardinality"></a>

### 3.28 Cardinality of medium-prime products

For fixed integer m≥0, #N_m(x)∼(x/log x)^m/(2^m m!) as x→∞; m is fixed, not uniform in m.

The proof proceeds as follows. Apply the rational PNT at x and x/2 to obtain k(x)=#P_x∼x/(2log x); the closed lower endpoint differs from π(x)−π(x/2) by at most one prime. In particular k(x)→∞. Use the distinct-product cardinality result and compose isEquivalent_choose(m) with k(x)→∞. This includes m=0 exactly, and yields (x/log x)^m/(2^m m!).

See [Lior Bary-Soroker, Dimitris Koukoulopoulos and Gady Kozma — Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), §3.6 (3.4), p.26.

*Needs:* [Products of distinct medium primes](#products-of-distinct-medium-primes-medium-prime-products); [qualitative prime asymptotics](#prerequisites-and-boundaries); `Nat.primeFactors_prod`; `Finset.card_powersetCard`; `Finset.card_image_of_injOn`; `isEquivalent_choose`; [Distinct-product cardinality](#proof-medium-prime-product-card).

<a id="proof-medium-prime-product-card"></a>

**Distinct-product cardinality.** For x≥2,m≥0, #N_m(x)=binomial(#{p prime:x/2≤p≤x},m).

For two m-element subsets s,t of P_x with the same product, apply Nat.primeFactors_prod to both sides to get s=t. Apply Finset.card_image_of_injOn and Finset.card_powersetCard to the image defining N_m(x).

See [Lior Bary-Soroker, Dimitris Koukoulopoulos and Gady Kozma — Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), §3.6, definition and (3.4), p.26.

<a id="truncated-von-mangoldt-function-truncated-von-mangoldt"></a>

### 3.29 Truncated von Mangoldt function

For real z≥1 and n∈Z, Λ_z(n)=−Σ_{d∈N,1≤d≤z,d|n} μ(d)log d. Divisibility of zero includes every positive d; the sum is finite by its cutoff.

The proof proceeds as follows. Take the finite sum over positive naturals d≤floor z whose integer cast divides n; retain all positive d at n=0 rather than substituting the empty native divisors(0). For n≠0 and z≥|n|, identify this finite set with Nat.divisors(n.natAbs). Apply ArithmeticFunction.sum_moebius_mul_log_eq at n.natAbs and negate. Divisibility is invariant under n↦−n. Evaluate z=1, the prime cutoff and z=2,n=0 directly; these require no analytic cancellation theorem.

The required interface consists of the following operations and identities.

- `truncated_von_mangoldt.sum`: Evaluation is the cutoff positive-divisor sum.
- `truncated_von_mangoldt.neg`: Λ_z(−n)=Λ_z(n).
- `truncated_von_mangoldt.zero`: Λ_z(0)=−Σ_{1≤d≤z} μ(d)log d.
- `truncated_von_mangoldt.large_cutoff`: For n≠0 and z≥|n|, Λ_z(n)=Λ_even(n).

**Checks.**

- Λ_2(0)=log 2, so truncation is not zero at zero.
- For a prime p, Λ_z(p)=0 when z<p and log p when p≤z.
- Λ_1(n)=0 for all n.

The result must also satisfy these compatibility requirements: Λ_2(0)=log 2, so truncation is not zero at zero. For a prime p, Λ_z(p)=0 when z<p and log p when p≤z. Λ_1(n)=0 for all n.

See [Alexei N. Skorobogatov and Efthymios Sofos — Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), §3.1, definitions preceding Corollary3.3, published p.691.

*Needs:* [Even von Mangoldt function](#even-von-mangoldt-function-even-von-mangoldt); `ArithmeticFunction.moebius`; `ArithmeticFunction.sum_moebius_mul_log_eq`.

<a id="shifted-coprime-m-bius-sum-shifted-coprime-mobius-sum"></a>

### 3.30 Shifted coprime Möbius sum

For every A>0 there are constants C_A>0 and T_A≥2 such that for every real T≥T_A and every positive integer 1≤q≤√T, |Σ_{1≤t≤T/q,(t,q)=1}μ(t)log(qt)/t+q/φ(q)|≤C_A(log T)^(−A). The constants are independent of q.

The proof proceeds as follows. Set U=T/q≥√T. Then q≤U, hence q≤U^4, so the two coprime Möbius supplier statements apply at U, with logarithmic exponent A+1. Expand log(qt)=log q+log t. Bound log q≤(log T)/2 and log U≥(log T)/2 to absorb the first sum into O_A((log T)^−A).

See [Alexei N. Skorobogatov and Efthymios Sofos — Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Lemma3.11 and proof, published p.699.

*Needs:* [Coprime Möbius sums from the prime number theorem ((3.6))](#coprime-m-bius-sums-from-the-prime-number-theorem-3-6-coprime-mobius-log-sum); [Coprime Möbius sums from the prime number theorem ((3.6))](#coprime-m-bius-sums-from-the-prime-number-theorem-3-6-coprime-mobius-reciprocal-sum).

<a id="asymptotic-count-of-the-three-exceptional-families-landau-exception-union"></a>

### 3.31 Asymptotic count of the three exceptional families

The union of k=u²+v², 4(k−1)=u²+3v² and k−4=u², with k positive and ≤K, has cardinality ∼C′ K/√log K for a positive C′.

Assume Count positive integers k≤K satisfying at least one of the three integer-representation predicates; K→∞; no representation multiplicity.

The proof proceeds as follows. Use the individual counts and the elementary shifted-square count to obtain a two-sided comparison with K/√log K. These inputs alone do not imply a limit constant. To obtain the asserted asymptotic, supply an asymptotic for the Eisenstein-norm family and an o(K/√log K) bound for its intersection with the sum-of-two-squares family. The latter is a shifted correlation of representation indicators, not a single multiplicative Euler product. Apply finite-set inclusion-exclusion and absorb the shifted-square family, which is O(√K). Ghosh–Sarnak p.3 asserts the union asymptotic, whereas §4.1 only uses the upper bound. The stronger inputs remain an explicit gap.

The result must also satisfy these compatibility requirements: The source asymptotic must be proved independently of the elementary upper/lower comparison; no positive limit is inferred solely from those bounds. At integer cutoff13, the union is {1,2,4,5,8,9,10,13}, of cardinality8; overlaps must be subtracted. Removing k=0 changes a count by at most1, with no effect on the asymptotic.

See [Amit Ghosh and Peter Sarnak — Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); [Amit Ghosh and Peter Sarnak — Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), Introduction p.3, exceptional families; §4.1 pp.12–13.

*Needs:* [Landau–Ramanujan count of sums of two squares](#landau-ramanujan-count-of-sums-of-two-squares-landau-sum-two-squares-count); [Landau upper bound for shifted Eisenstein norms](#landau-upper-bound-for-shifted-eisenstein-norms-landau-three-square-form-count); [Elementary shifted-square count](#elementary-shifted-square-count-shifted-square-count).

<a id="restricted-squarefree-landau-asymptotic-restricted-squarefree-landau-count"></a>

### 3.32 Restricted squarefree Landau asymptotic

For D(X)={n∈N:1≤n<X, n squarefree, every odd prime factor p satisfies p≡1 mod4}, there is a positive absolute C_D such that #D(X)=C_D X/√log X·(1+O(1/log X)) as X→∞. The cutoff is strict, as in KP§1. C_D=(3/(4√2))∏_{p≡1(4)}(1−p^(−2))∏_{p≡3(4)}(1−p^(−2))^(1/2), with positive convergent products.

The proof proceeds as follows. For Re s>1 the squarefree indicator has Euler series D(s)=(1+2^(−s))∏_{p≡1(4)}(1+p^(−s)). Factor D(s)=ζ(s)^(1/2)L(s,χ_−4)^(1/2)H(s), choosing the positive branch on real s>1. Here H(s)=(1+2^(−s))(1−2^(−s))^(1/2)∏_{p≡1(4)}(1−p^(−2s))∏_{p≡3(4)}(1−p^(−2s))^(1/2). Use a quantitative Selberg–Delange transfer with leading coefficient L(1,χ_−4)^(1/2)H(1)/Γ(1/2); insert L(1,χ_−4)=π/4 and Γ(1/2)=√π. The continuation/transfer is still a recorded gap. Absolute summability of p^(−2) proves positive product convergence. A strict versus inclusive height changes the count by at most1, which fits this error as X→∞.

The result must also satisfy these compatibility requirements: D(2)={1}; D(14)={1,2,5,10,13}. The integer9 is excluded despite being a sum of two squares. The p=2 Euler factor is1+2^(−s), not(1−2^(−s))^(−1); n=4 is excluded by squarefreeness. Every factor in C_D is positive; the logarithmic series is absolutely convergent.

See [Peter Koymans, Carlo Pagano — On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1), §1 pp.2–3, D(X) and classical asymptotic.

*Needs:* [Counts supported on half the reduced prime classes](#counts-supported-on-half-the-reduced-prime-classes-half-density-prime-support-count); `Squarefree`; `DirichletCharacter.LFunction`; `riemannZeta`.

<a id="pretentious-hal-sz-mean-bound-halasz-classical"></a>

### 3.33 Pretentious Halász mean bound

For multiplicative |f(n)|≤1, x≥2,T≥1, let M(x,T)=min_{|t|≤2T}D(f,n^(it);x)². Then |Σ_{n≤x}f(n)|/x≤C((1+M)e^−M+T^−1/2), with an absolute C; increasing C handles bounded x.

The proof proceeds as follows. Use the classical Halász theorem with the twist-minimum convention |t|≤2T. The phase n^(it) and its complex conjugate in the distance give Re(f(p)p^−it) in the sum.

The result must also satisfy these compatibility requirements: For f(n)=n^(it₀), |t₀|≤2T, the twist minimum M is0, so the bound allows a nonzero mean. For f identically0 on primes the distance diagonal is not assumed to vanish; no completely-multiplicative hypothesis is imposed on general f.

See [Andrew Granville and K. Soundararajan — Pretentious multiplicative functions and an inequality for the zeta-function](https://arxiv.org/pdf/math/0608407), p.2, displayed definition of M(x,T) and following mean-value bound.

*Needs:* [Pretentious distance](#pretentious-distance-pretentious-distance).

<a id="dickman-fixed-u-asymptotic-dickman-fixed-u"></a>

### 3.34 Dickman fixed-u asymptotic

For each fixed u>0, Ψ(x,x^(1/u))/x→ρ(u) as x→∞. This statement is not uniform for u tending to infinity.

The proof proceeds as follows. For0<u≤1 eventually y=x^(1/u)≥x, so Ψ=floor x and the limit is1. For u>1 use the separate largest-prime decomposition and quantitative partial summation of rational prime counts, then identify its normalized limit recursively on consecutive bounded u intervals. The moving prime-sum/Riemann-integral error, short terminal range and compact-u uniformity needed for induction must be supplied as explicit analytic lemmas before applying uniqueness of the Dickman integral solution. The survey states the fixed-u target; its original Dickman/de Bruijn proof has not been read in this run.

The result must also satisfy these compatibility requirements: The specialization u=1 has exact Ψ(x,x)=floor x for x≥2. At u=2 the limit is1−log2. Constants may depend on a fixed compact u range; this yields no growing-u uniformity.

See [Adolf Hildebrand and Gérald Tenenbaum — Integers without large prime factors](https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf), Introduction p.411 (terminology); unnumbered fixed-u limit preceding (1.5)–(1.6), p.414. Equations (1.5)–(1.6) specify the delay equation and initial data..

*Needs:* [Smooth-number counting function](#smooth-number-counting-function-smooth-count); [Dickman function](#dickman-function-dickman-function); [qualitative prime asymptotics](#prerequisites-and-boundaries); `Nat.mem_smoothNumbersUpTo`; [Largest-prime-factor smooth decomposition](#proof-smooth-largest-prime-decomposition).

<a id="proof-smooth-largest-prime-decomposition"></a>

**Largest-prime-factor smooth decomposition.** For x≥1,y≥2, Ψ(x,y)+∑_{y<p≤x, p prime}Ψ(x/p,p)=floor x. Each positive non-y-smooth integer has a unique largest prime divisor p>y, and dividing by one copy of p leaves a p-smooth integer. Repeated largest primes are permitted.

Partition the finite set of positive n≤floor x into y-smooth integers and those whose largest prime factor is p>y. The latter p satisfies p≤x. For each p use n↦n/p and m↦p*m to identify its fibre with positive p-smooth m≤floor(x/p). Repeated p in m is allowed; a p-rough or strict-p-smooth fibre would be wrong. Sum disjoint fibre cardinalities and account for1 in the smooth fibre.

See [Adolf Hildebrand and Gérald Tenenbaum — Integers without large prime factors](https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf), Introduction, printed p.411 (terminology); p.414 unnumbered fixed-u limit preceding (1.5)–(1.6); elementary largest-prime partition used for its limiting recursion.

<a id="rankin-smooth-number-upper-bound-smooth-rankin-bound"></a>

### 3.35 Rankin smooth-number upper bound

For x≥1,y≥2 and σ>0, Ψ(x,y)≤x^σ∏_{p≤y}(1−p^−σ)^−1. The finite-prime Euler product is finite and each geometric series converges.

The proof proceeds as follows. For each counted positive n≤x and σ>0,1≤(x/n)^σ. Bound the finite count by x^σ times its finite n^(−σ) sum. Enlarge to the summable nonnegative series over all positive y-smooth integers, using the separately named finite-prime Euler-series lemma. Apply the geometric factorization. For x=1, Ψ=1 and all Euler factors exceed1, so the bound includes the endpoint.

The result must also satisfy these compatibility requirements: The bound is valid for every σ>0, includingσ≤1; only finitely many primes occur. For x=1 the count is1; σ=0 is excluded because the geometric factors are not summable.

See [Adolf Hildebrand and Gérald Tenenbaum — Integers without large prime factors](https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf), Introduction, printed p.411 (terminology); p.414 equation(1.3), page image.

*Needs:* [Smooth-number counting function](#smooth-number-counting-function-smooth-count); `Nat.equivProdNatFactoredNumbers`; [Finite-prime smooth Dirichlet series](#proof-smooth-finite-euler-series).

<a id="proof-smooth-finite-euler-series"></a>

**Finite-prime smooth Dirichlet series.** For y≥2 and σ>0, the nonnegative real series ∑_{n≥1, n y-smooth}n^(−σ) is summable and equals ∏_{p≤y}(1−p^(−σ))^(−1). This is a finite-prime identity valid for every positive σ, even σ≤1.

Use Nat.equivProdNatFactoredNumbers inductively on the finite set of primes≤y to index smooth positive integers by their independent nonnegative prime exponents. Each p≥2 has0<p^(−σ)<1. Its geometric series is summable; finite products/Tonelli and rpow multiplication factor the sum. The zero integer is excluded by the existing carrier. Identify the finite prime set with primes strictly below floor y+1. No infinite-prime Euler product on Re s>1 is substituted for this stronger finite-prime statement.

See [Adolf Hildebrand and Gérald Tenenbaum — Integers without large prime factors](https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf), Introduction, printed p.411 (terminology); p.414 equation(1.3), finite-prime geometric factorization.

<a id="zeta-function-of-an-indexed-beurling-system-beurling-zeta"></a>

### 3.36 Zeta function of an indexed Beurling system

For an indexed Beurling prime system P and Re s>1 with Σ_(a∈N^(N))norm_P(a)^−σ summable for every real σ>1, define ζ_P(s)=Σ_a exp(−s log(norm_P(a))) over finitely supported exponent vectors. Repeated prime values remain different indices. The totalized sum outside this domain is not its analytic continuation.

The proof proceeds as follows. Compact subsets of Re s>1 admit a fixed summable real majorant from a smaller real exponent σ₀>1. Independent geometric sums on finite prime-index sets converge to the vector series. Summable logarithmic factors give a nonzero limit.

The required interface consists of the following operations and identities.

- `beurling_zeta.summable`: The exponent-vector complex series is absolutely summable on Re s>1 under the stated real convergence hypothesis.
- `beurling_zeta.nonzero`: ζ_P(s)≠0 on Re s>1 under the same hypothesis.
- `beurling_zeta.analytic`: ζ_P is analytic on a neighbourhood of every point of Re s>1.

**Checks.**

- For the indexed ordinary primes, ζ_P(s)=ζ(s) on Re s>1.
- On Re s>1, if every ordinary prime appears at two consecutive indices, ζ_P(s)=ζ(s)².
- The zero exponent vector contributes exactly1 for every s.

See [Gregory Debruyne and Jasson Vindas — On general prime number theorems with remainder](https://arxiv.org/pdf/1601.05324), §2.1, (5)–(7) and discrete Euler product, printed pp.2–3.

*Needs:* [Beurling prime system](#beurling-prime-system-beurling-prime-system); [Beurling counting growth from summability](#proof-beurling-count-growth).

<a id="proof-beurling-count-growth"></a>

**Beurling counting growth from summability.** For a Beurling system P, real σ>0 and S=Σ_a norm(a)^−σ with summable nonnegative summands, N(x)≤S x^σ for x≥1, and π_P(x)≤N(x). Thus convergence for every σ>1 gives N(x),π_P(x)=O_ε(x^(1+ε)) for every ε>0.

Each counted vector satisfies1≤x^σ norm(a)^−σ. Bound its finite sum by the full summable nonnegative sum. Map each counted prime index injectively to its unit exponent vector. Repeated equal real primes remain distinct vectors.

See [Gregory Debruyne and Jasson Vindas — On general prime number theorems with remainder](https://arxiv.org/pdf/1601.05324), §2.1 p.3, growth deduction after (6).

<a id="shiu-bound-for-the-hal-sz-coefficient-class-shiu-short-interval-bound"></a>

### 3.37 Shiu bound for the Halász coefficient class

For fixed κ>0 and 0<ε<1 there are C(κ,ε)>0 and X(κ,ε)>1 such that for every f∈C(κ), x≥X, x^ε≤z≤x, positive integer q≤z^(1−ε), and integer a coprime to q, the sum of |f(n)| over positive integers x−z≤n≤x with n≡a mod q is at most C z/(φ(q) log x) exp(Σ_{p≤x, p∤q}|f(p)|/p). The constants are independent of f,a,q,z. Modulus one is included.

Assume The coefficient class uses ordinary coprime multiplicativity and zero extension at n=0.

The proof proceeds as follows. Apply the Euler logarithmic coefficient majorant to obtain |f(p^j)|≤dκ(p^j). For the integer r=ceil(max(1,κ)), generalized-binomial coefficient monotonicity gives dκ(p^j)≤d_r(p^j)≤(j+1)^r and dκ(p^j)≤r^j. Multiply at coprime prime powers to obtain |f(n)|≤τ(n)^r; the existing explicit divisor bound supplies every n^δ bound, with constants depending only on κ,δ. Thus the nonnegative multiplicative function |f| satisfies Shiu’s two growth conditions with uniform constants. Follow the four classes in the proof of Theorem 1: small-prime factor b≤z^(α/10), rough cofactor, excessive prime-power factor, very smooth factor, and the remaining Rankin tail. Lemmas 1,3,4 control the smooth and reciprocal sums; the rough progression estimate is Lemma 2. The Selberg upper-bound sieve proof behind Shiu Lemma 2 remains a recorded local proof gap. The rest of §§4–5 was read in the original scan; no unread sieve roadmap is an assumed supplier. To include endpoints q≤z^(1−ε) and z≥x^ε, choose smaller positive α,β<min(ε,1/2). The proof also works for q=1; changing the lower endpoint adds at most one term, absorbed by the uniform subpower bound.

The result must also satisfy these compatibility requirements: Retain the reduced-residue hypothesis and the uniform dependence on κ,ε. For q=1 and z=x this gives the usual multiplicative mean majorant. The function n↦2^Ω(n) fails the subpower condition: its values at powers of 2 prevent applying Shiu’s theorem.

See [P. Shiu — A Brun–Titchmarsh theorem for multiplicative functions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0313/LOG_0015.pdf), Theorem 1, pp.162–163; Lemmas 1–4 and proof §§4–5, pp.164–169; [Andrew Granville, Adam J. Harper and K. Soundararajan — A new proof of Halász’s theorem, and its consequences](https://arxiv.org/pdf/1706.03749v1), Lemma 2.3 and its application, pp.9–11.

*Needs:* [Logarithmic-derivative coefficient class](#logarithmic-derivative-coefficient-class-halasz-coefficient-class); [Explicit divisor subpower bound](#explicit-divisor-subpower-bound-explicit-divisor-subpower-bound); `ArithmeticFunction.IsMultiplicative`; `Chebyshev.psi_le_const_mul_self`.

<a id="eventual-unit-constant-divisor-bound-eventual-divisor-subpower-bound"></a>

### 3.38 Eventual unit-constant divisor bound

For each δ>0 there exists a natural N≥1 such that every natural n≥N satisfies τ(n)≤n^δ. If C≥1 is the uniform constant at ε=δ/2, any natural N≥max(1,C^(2/δ)) suffices.

Assume δ>0.

The proof proceeds as follows. Use uniform-divisor-subpower-bound with ε=δ/2. Choose natural N≥max(1,C^(2/δ)) using exists_nat_ge. For n≥N, monotonicity of positive real powers and Real.rpow_mul give C≤n^(δ/2). Apply absorb-divisor-bound-constant.

The result must also satisfy these compatibility requirements: N≥1 excludes the library's totalized zero input. Replacing δ by 2ε gives the equivalent eventual form used in the divisor estimate. The result makes no universal claim at n=2.

See [Terence Tao — The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), Proof of (3), large-prime step, and Proof of (4), Taylor estimate and finite small-prime product.

*Needs:* [Uniform divisor subpower bound](#uniform-divisor-subpower-bound-uniform-divisor-subpower-bound); `Real.rpow_add`; `Real.rpow_nonneg`; `exists_nat_ge`; `Real.rpow_le_rpow`; `Real.rpow_mul`; [Absorption of the divisor-bound constant](#proof-absorb-divisor-bound-constant).

<a id="proof-absorb-divisor-bound-constant"></a>

**Absorption of the divisor-bound constant.** For n>0 and ε,δ,C∈ℝ, if τ(n)≤C n^ε and C≤n^(δ−ε), then τ(n)≤n^δ.

Here n>0; the two displayed inequalities.

Multiply C≤n^(δ−ε) by n^ε≥0 and compose with the first inequality. Apply Real.rpow_add at positive n and simplify (δ−ε)+ε=δ.

See [Terence Tao — The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), Proof of (3), large-prime step, and Proof of (4), Taylor estimate and finite small-prime product.

<a id="von-mangoldt-truncation-error-mangoldt-truncation-error"></a>

### 3.39 Von Mangoldt truncation error

E_z(n)=Λ_even(n)−Λ_z(n), for n∈Z and z≥1.

The proof proceeds as follows. Subtract the two real-valued functions on ℤ. Their evenness yields evenness of E_z. At n=0 use vonMangoldt(0)=0 and the finite cutoff sum, giving E_z(0)=Σ_{1≤d≤z}μ(d)log d. At n≠0 and z≥|n| use the divisor identity through truncated_von_mangoldt.large_cutoff, giving E_z(n)=0.

The required interface consists of the following operations and identities.

- `mangoldt_truncation_error.sub`: E_z is the displayed difference.
- `mangoldt_truncation_error.neg`: E_z(−n)=E_z(n).
- `mangoldt_truncation_error.zero`: E_z(0)=Σ_{1≤d≤z} μ(d)log d.

**Checks.**

- E_2(0)=−log 2.
- For p>z, E_z(p)=log p.
- For n≠0 and z≥|n|, E_z(n)=0.

The result must also satisfy these compatibility requirements: E_2(0)=−log 2. For p>z, E_z(p)=log p. For n≠0 and z≥|n|, E_z(n)=0.

See [Alexei N. Skorobogatov and Efthymios Sofos — Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), §3.1, definitions preceding Corollary3.3, published p.691.

*Needs:* [Even von Mangoldt function](#even-von-mangoldt-function-even-von-mangoldt); [Truncated von Mangoldt function](#truncated-von-mangoldt-function-truncated-von-mangoldt).

<a id="wintner-type-mean-over-prime-divisors-prime-divisor-product-mean"></a>

### 3.40 Wintner-type mean over prime divisors

For fixed n∈N,c>0 and f on rational primes with |f(p)|≤c/p, set a(t)=∏_{p|t}(1+f(p))^n for t≥1. Then Σ_{1≤t≤x}a(t)=Cx+O_{n,c}(√x), x≥1, where C=∏_p(1+((1+f(p))^n−1)/p); the product is absolutely convergent and f may be complex.

The proof proceeds as follows. On positive integers set g(d)=|μ(d)|∏_{p|d}((1+f(p))^n−1), with g(1)=1 and canonical zero extension. Finite expansion gives a(t)=Σ_{d|t}g(d) using the Dirichlet-convolution carrier. The binomial formula gives |g(p)|≤K_{n,c}/p with K_{n,c}≥1. For squarefree d, |g(d)|≤K_{n,c}^{ω(d)}/d≤τ(d)^α/d with a fixed α=max(1,log K_{n,c}/log2). The existing uniform divisor-subpower bound with exponent 1/(4α) gives |g(d)|≤B_{n,c}d^(−3/4). Consequently M=Σ_{d≥1}|g(d)|/sqrt d is finite, uniformly in f after n,c are fixed. The squarefree-series/Euler-product comparison needed to identify C=Σg(d)/d with the stated product is recorded precisely in the scoped mean gap. Swap finite sums to obtain Σ_{t≤x}a(t)=Σ_{d≤x}g(d)floor(x/d). The floor error is at most sqrt x M; replacing the truncated Σg(d)/d by C costs at most sqrt x M again. These finite identities avoid a new generic Wintner export from the upstream Abel layer.

The result must also satisfy these compatibility requirements: For n=0, a(t)=1 and C=1; the discrepancy is floor(x)−x, of absolute value at most 1. For n=1 with f(2)=1/2 and f(p)=0 for all odd primes, C=5/4 and the exact sum is floor(x)+(1/2)floor(x/2). For complex f(p), all error estimates use absolute values and the constant depends only on n,c, not on the particular function f.

See [Alexei N. Skorobogatov and Efthymios Sofos — Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Lemma4.3 and full proof, published pp.705–706, equations(4.2)–(4.3).

*Needs:* `ArithmeticFunction.mul_apply`; `ArithmeticFunction.moebius`; [Uniform divisor subpower bound](#uniform-divisor-subpower-bound-uniform-divisor-subpower-bound); [Integrated prime-divisor mean](#proof-prime-divisor-integrated-mean).

<a id="proof-prime-divisor-integrated-mean"></a>

**Integrated prime-divisor mean.** With a,C as in the prime-divisor mean lemma, ∫_0^T Σ_{1≤t≤x}a(t)dx=Σ_{1≤t≤T}(T−t)a(t)=CT²/2+O_{n,c}(T^(3/2)), T≥1.

For every t≥1 integrate its indicator over 0≤x≤T: the integral is T−t when t≤T and zero otherwise. Interchange only the finitely many nonzero terms. Integrate the mean estimate on [1,T]; on [0,1) the count is zero and the integral of Cx is bounded by a constant depending only on n,c. The remainder integral is at most a fixed multiple of T^(3/2).

See [Alexei N. Skorobogatov and Efthymios Sofos — Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Lemma4.3, published pp.705–706.

<a id="restricted-squarefree-sathe-selberg-bounds-restricted-sathe-selberg-count"></a>

### 3.41 Restricted squarefree Sathe–Selberg bounds

Let D_r(N)={n∈D(N):ω(n)=r}, with D(N) the strict-cutoff squarefree family defined in restricted_squarefree_landau_count and ω(n) the number of distinct prime divisors. For every fixed A>0 there are C₁,C₂>0 and N₀≥3, depending only on A, such that for every real N≥N₀ and integer1≤r≤A log log N, C₁(N/log N)(½ log log N)^(r−1)/(r−1)!≤#D_r(N)≤C₂(N/log N)(½ log log N)^(r−1)/(r−1)!. No r=0 or varying-A uniformity is asserted.

The proof proceeds as follows. Mark each distinct prime divisor by z in D(s,z)=(1+z2^(−s))∏_{p≡1(4)}(1+zp^(−s)); extract the z^r coefficient. The half-density prime set gives singular exponent z/2. A two-variable coefficient/transfer theorem, with fixed compact positive saddle-parameter range determined by A, is required to prove the uniform bounds. KP Theorem7.2 quotes all fixed A>0 from CKMP p.13, but CKMP p.13 only prints r<2μ=log log N. Reconcile or independently prove the all-A range; the cited paragraph is not an all-A proof.

The result must also satisfy these compatibility requirements: For r=1 the family counts2 and primes≡1 mod4 below N, and has size asymptotic N/(2 log N). D_0(N)={1} for N>1 and is outside the theorem; at N=14 the r=1 and r=2 counts are3 and1 respectively. Constants are fixed after A, before N and r; a fixed-r theorem alone cannot justify r of order log log N.

See [Peter Koymans, Carlo Pagano — On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1), §7.1 Theorem7.2, (7.3), p.60; proof citing[8] p.13; [Stephanie Chan, Peter Koymans, Djordjo Milovic, Carlo Pagano — On the negative Pell equation](https://arxiv.org/pdf/1908.01752), §4 opening, p.13.

*Needs:* [Restricted squarefree Landau asymptotic](#restricted-squarefree-landau-asymptotic-restricted-squarefree-landau-count).

<a id="beurling-pnt-with-all-logarithmic-remainders-beurling-all-log-remainders"></a>

### 3.42 Beurling PNT with all logarithmic remainders

For a discrete Beurling system whose ζ converges on Re s>1, π_P(x)=Li(x)+O_m(x/log^m x) for every m≥1 iff N(x)=ax+O_m(x/log^m x) for every m≥1 for some a>0. Each error constant may depend on m and the system.

The proof proceeds as follows. Replace π by Π using the separate higher-prime-power correction. Fix Li(x)=∫_2^x dt/log t for x≥2; any additive constant is swallowed by every stated error. Each m has its own constant and eventual threshold. For S(u)=N(exp u), T(u)=a exp u, use Theorem3(i)⇔(ii)⇔(iii). G(s)=ζ_P(s)−a/(s−1) is represented by its smooth closed-half-plane extension, not a junk-valued subtraction at1. Condition(ii) has one fixedε>0 controlling every derivative (with derivative-dependent constants); condition(iii) is uniform onσ>1 for eachε>0 and each derivative. Proposition1 provides the Abelian direction by integration by parts and X=|t|^(1/γ). Theorem2 gives the reverse direction from a C∞ Laplace boundary with bounds G^(n)(1+it)=O(|t|^β_n), β_n/n→0, using monotonicity and T′≤A exp u. Its normalized Δ(u)=exp(−u)(S−T)(u), one-sided bump/Fourier smoothing and n-fold integration by parts produce Δ(h)=O(h^(−n/(β_n+1))). These are named missing analytic interfaces, not routine steps. Theorem3 Lemma1 uses the3–4–1 inequality and derivative bounds to prove (s−1)ζ_P nonzero on the closed half-plane and1/ζ_P=O_ε((1+|t|)^ε). Use the Euler-series logarithm and its continuous extension, normalized on realσ>1. Apply the same Tauberian/Abelian pair to S₁(u)=Π(exp u), T₁(u)=∫_1^(exp u)(1−1/y)/log y dy. Its transform is log((s−1)ζ_P(s))−log s on the matched analytic branch. The stronger Proposition1 bound o(log|t|) controls exponentiation in the reverse implication; a=exp G₁(1)>0 and smooth division by s−1 removes the apparent pole.

The result must also satisfy these compatibility requirements: The density a>0 is quantified once, before all m. Error constants and eventual cutoffs may depend on P and m. Taking each ordinary prime twice gives N(x)∼x log x andπ_P(x)∼2Li(x), so neither side holds. Convergence alone does not force density1. The residue-subtracted boundary at1 is the extension value; no equality with the totalized series value there is asserted.

See [Gregory Debruyne and Jasson Vindas — On general prime number theorems with remainder](https://arxiv.org/pdf/1601.05324), Theorem1 p.2; entire §§3–4 pp.4–11, Theorem2, Proposition1, Theorem3, Lemma1.

*Needs:* [Beurling prime system](#beurling-prime-system-beurling-prime-system); [Zeta function of an indexed Beurling system](#zeta-function-of-an-indexed-beurling-system-beurling-zeta); [Beurling zeta and Euler product](#proof-beurling-zeta-product); [Beurling counting growth from summability](#proof-beurling-count-growth); [Beurling higher-prime-power correction](#proof-beurling-prime-power-correction).

<a id="proof-beurling-zeta-product"></a>

**Beurling zeta and Euler product.** If Σ_n n^−σ (with generalized-integer multiplicities) converges for every real σ>1, then ζ_P(s)=Σ_n n^−s=∏_j(1−p_j^−s)^−1 on Re s>1, absolutely and locally uniformly. The convergence hypothesis is additional to the prime-system axioms.

Define ζ_P(s) by the summable exponent-vector series exp(−s log norm(a)); keep the additional summability assumption for every realσ>1. For the first M indexed primes, independent geometric summation gives the finite Euler product, with ratio p_j^(−s) of norm<1. Exhaust all finite-support vectors with the first M indices. On a compact K⊂{Re s>1}, choose1<σ₀<inf_K Re s; norm(a)≥1 makes the summable norm(a)^−σ₀ series a uniform majorant. The finite-prime tails converge uniformly to the full series. For a nonzero Euler product, additionally sum the logarithmic local factors using |p_j^(−s)|≤p_j^−σ₀ and the prime-index-to-vector injection. The normalized analytic logarithm is this convergent sum, not an arbitrary pointwise principal logarithm of ζ_P.

See [Gregory Debruyne and Jasson Vindas — On general prime number theorems with remainder](https://arxiv.org/pdf/1601.05324), §2.1 pp.2–3, (5)–(7) and displayed discrete Euler product.

<a id="proof-beurling-prime-power-correction"></a>

**Beurling higher-prime-power correction.** For x≥1, J=floor(log x/log p₁) and Π_P(x)=Σ_{1≤j≤J}π_P(x^(1/j))/j, all later terms are0. For x≥p₁, 0≤Π_P(x)−π_P(x)≤π_P(sqrt x)+π_P(x^(1/3))log x/log p₁. Under convergence for every σ>1, the difference is O_ε(x^(1/2+ε)) for every ε>0.

Use p₁>1 to bound j for any prime power≤x. Isolate j=1 and j=2; for3≤j≤J use x^(1/j)≤x^(1/3) and bound1/j≤1. Apply the counting-growth lemma at exponent1+η with0<η<2ε. Absorb the logarithm in the strictly smaller exponent for the j≥3 contribution. The finite low-x range changes only the constant.

See [Gregory Debruyne and Jasson Vindas — On general prime number theorems with remainder](https://arxiv.org/pdf/1601.05324), §2.1 p.3, (7) and subsequent prime-power bounds.

<a id="mangoldt-weight-in-a-fourier-window-mangoldt-short-window-bound"></a>

### 3.43 Mangoldt weight in a Fourier window

For each fixed c₀>0 there is C(c₀)>0 such that for every real T≥1 and m≥T², Σ_{n≥1, |log(n/m)|≤c₀/T}Λ(n)≤C(c₀)m/T. The sum includes all prime powers, with Λ(1)=0.

The proof proceeds as follows. Write X=m exp(c₀/T) and H=m(exp(c₀/T)−exp(−c₀/T)); H is comparable to m/T with constants depending only on c₀. If H is comparable to X, Chebyshev’s ψ bound suffices. Handle a bounded range of m by increasing C(c₀). For large m, every prime in this window exceeds m^(1/4). The multiplicative rough-number indicator f_m(n)=1 when every prime divisor exceeds m^(1/4), and 0 otherwise, belongs to C(1): its logarithmic coefficients equal Λ on the allowed prime powers. Apply the preceding uniform Shiu bound at modulus one, with a fixed ε<1/2. Since H≥constant·sqrt(m), its range holds for sufficiently large m. Chebyshev plus partial summation bounds Σ_{m^(1/4)<p≤X}1/p by an absolute constant depending only on c₀. Hence there are O_{c₀}(H/log m) primes in the window, contributing O_{c₀}(H). For powers with exponent j≥2, enlarge to all n≤X: their total Λ weight is Σ_{j≥2}θ(X^(1/j))≤C sqrt X, by θ(u)≤Cu and Σ_{3≤j≤log₂X}X^(1/j)≤X^(1/3)log₂X=O(sqrt X). Since m≥T², sqrt X≤C(c₀)m/T. Add the prime and higher-power contributions.

The result must also satisfy these compatibility requirements: The Fourier support radius is c₀ and its contribution to C is explicit in the quantifiers. The proof includes prime squares and higher powers; a prime-count estimate alone does not establish the statement. The condition m≥T² is retained. A window with m=2^j and T arbitrarily large would contain weight log 2 while m/T tends to zero.

See [Andrew Granville, Adam J. Harper and K. Soundararajan — A new proof of Halász’s theorem, and its consequences](https://arxiv.org/pdf/1706.03749v1), Lemma 2.6, p.11, last paragraph of its proof; [P. Shiu — A Brun–Titchmarsh theorem for multiplicative functions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0313/LOG_0015.pdf), Theorem 1, pp.162–163.

*Needs:* [Shiu bound for the Halász coefficient class](#shiu-bound-for-the-hal-sz-coefficient-class-shiu-short-interval-bound); [Logarithmic-derivative coefficient class](#logarithmic-derivative-coefficient-class-halasz-coefficient-class); `Chebyshev.psi_le_const_mul_self`; [ArithmeticDirichletSeries layer 6 abel and perron summation](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation).

<a id="uniform-cancellation-of-the-truncation-error-e-z-corollary-3-3-positive-truncation-error-cancellation"></a>

### 3.44 Uniform cancellation of the truncation error E_z (Corollary 3.3)

For A>0 and y,z≥2, sup_{α∈R}|Σ_{1≤r≤y}E_z(r)e^(irα)|≤C_A y(log y)(log z)^−A.

The proof proceeds as follows. Apply the source positive-integer Fourier argument using Davenport cancellation and the finite cutoff. Keep y,z≥2 so no negative power of log1 occurs.

See [Alexei N. Skorobogatov and Efthymios Sofos — Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Corollary3.3 and proof reference, published p.691.

*Needs:* [Von Mangoldt truncation error](#von-mangoldt-truncation-error-mangoldt-truncation-error); [Davenport uniform Möbius exponential cancellation](#davenport-uniform-m-bius-exponential-cancellation-davenport-mobius-cancellation); [Two-sided error and the zero term](#proof-two-sided-truncation-error).

<a id="proof-two-sided-truncation-error"></a>

**Two-sided error and the zero term.** For y,z≥2 and A>0 the two-sided sum Σ_{|r|≤y}E_z(r)e^(irα) has absolute value ≤2C_A y(log y)(log z)^−A+|E_z(0)|. The zero term is bounded separately by O_A(z(log z)^−A).

Pair the positive and negative summands using evenness; apply the positive estimate to α and −α. Use Möbius cancellation and partial summation for the finite zero sum.

See [Alexei N. Skorobogatov and Efthymios Sofos — Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), §3.1 definitions and Corollary3.3, published p.691.

<a id="hal-sz-integral-mean-bound-halasz-integral-bound"></a>

### 3.45 Halász integral mean bound

For fixed κ>0, f∈C(κ) and sufficiently large x, |Σ_{n≤x}f(n)|≤C_κ x/log x ·∫_{1/log x}^1 max_{|t|≤(log x)^κ}|F(1+σ+it)/(1+σ+it)| dσ/σ + C_κ x(log log x)^κ/log x. The constant is uniform in f.

The proof proceeds as follows. Use the small/large-prime convolution split, the exact double-integral identity Lemma2.2, Shiu upper bound Lemma2.3, errors Lemmas2.4–2.5 and Proposition2.1. The locally owned Shiu target supplies the short-interval estimate; its Selberg-sieve proof adapter remains an explicit gap. Take T=(log x)^(κ+1), y=T²=(log x)^(2κ+2), η=1/log y; for sufficiently large x these satisfy the Proposition2.1 range1≤T≤x^(9/10),10≤y≤sqrt x. Apply the separate single-Λ weighted mean-square lemma to the two large-prime polynomials, then Cauchy–Schwarz and Chebyshev weighted summation(2.6). The ordinary unweighted mean-square result cannot replace this step. After integrating α, set σ=β+1/log x. Restrict the t maximum from T to(log x)^κ using |F(1+σ+it)|≤ζ(1+σ)^κ and its denominator; the tail contributes O_κ(x/log x). Enlarge the σ interval to1 and combine O_κ(x(log log x)^κ/log x) errors.

The result must also satisfy these compatibility requirements: Constants and the sufficiently-large-x threshold depend only on κ, before quantifying over f∈C(κ). The maximum is of |F(s)/s|, not |F(s)|; the final t range is (log x)^κ, while the proof uses the larger auxiliary T.

See [Andrew Granville, Adam J. Harper and K. Soundararajan — A new proof of Halász’s theorem, and its consequences](https://arxiv.org/pdf/1706.03749v1), Theorem1.1 p.2; §2 pp.7–12, Lemmas2.2–2.6, Proposition2.1 and final proof.

*Needs:* [Shiu bound for the Halász coefficient class](#shiu-bound-for-the-hal-sz-coefficient-class-shiu-short-interval-bound); [Mangoldt weight in a Fourier window](#mangoldt-weight-in-a-fourier-window-mangoldt-short-window-bound); [Logarithmic-derivative coefficient class](#logarithmic-derivative-coefficient-class-halasz-coefficient-class); [ArithmeticDirichletSeries layer 6 abel and perron summation](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation); `Chebyshev.psi_le_const_mul_self`; [Prime-weighted Dirichlet-polynomial mean bound](#proof-mangoldt-polynomial-mean-square).

<a id="proof-mangoldt-polynomial-mean-square"></a>

**Prime-weighted Dirichlet-polynomial mean bound.** There is an absolute C>0 such that for T≥1, x≥1 and any complex coefficients a(n), the integral from −T to T of |∑_{T²≤n≤x}a(n)Λ(n)exp(−it log n)|² is at most C∑_{T²≤n≤x}n|a(n)|²Λ(n). The finite sums use inclusive real cutoffs. If x<T² they are empty.

Use the nonnegative even majorant Φ(t)=(sin(t)/t)²/(sin1)², continuously extended at0, whose Fourier transform has fixed compact support; enlarge the integration interval and expand the finite square. The off-diagonal kernel is supported where |log(n/m)|≪1/T. Use 2|a(m)a(n)|≤|a(m)|²+|a(n)|² and symmetry. Apply the local Mangoldt short-window bound of Layer 3 to each n-centered window; use the diagonal/coefficient majorant and preserve the stated κ, T and y dependence. The Fourier normalization and coefficient-class adapters remain explicit local proof inputs.

See [Andrew Granville, Adam J. Harper and K. Soundararajan — A new proof of Halász’s theorem, and its consequences](https://arxiv.org/pdf/1706.03749v1), §2.3 Lemma2.6 and its complete proof, p.11.

### Remaining analytic proof obligations

**Halász proof decomposition.** Retain the Halász Euler-factor split, convolution and integrated Perron chain. Shiu’s upper-bound sieve requires its own Selberg weight estimate here, plus generalized-binomial/divisor domination, the rough-number coefficient witness and Fourier support/Plancherel normalization for the Mangoldt window. The classical distance form needs its complete proof. Used in [Logarithmic-derivative coefficient class](#logarithmic-derivative-coefficient-class-halasz-coefficient-class); [Halász integral mean bound](#hal-sz-integral-mean-bound-halasz-integral-bound); [Pretentious Halász mean bound](#pretentious-hal-sz-mean-bound-halasz-classical); [Shiu bound for the Halász coefficient class](#shiu-bound-for-the-hal-sz-coefficient-class-shiu-short-interval-bound); [Mangoldt weight in a Fourier window](#mangoldt-weight-in-a-fourier-window-mangoldt-short-window-bound).

**Dickman construction and limiting recursion.** Construct and glue Dickman’s consecutive intervals and prove the integral identity with its negative-argument convention. The fixed-u limit needs quantitative prime partial summation of the largest-prime recursion, terminal-range control and a compact-u limit argument. No growing-u asymptotic follows from the fixed-u statement. Used in [Dickman function](#dickman-function-dickman-function); [Dickman fixed-u asymptotic](#dickman-fixed-u-asymptotic-dickman-fixed-u); [Rankin smooth-number upper bound](#rankin-smooth-number-upper-bound-smooth-rankin-bound).

**Divisor hyperbola finite-carrier adapter.** Realize the exact divisor-pair bijection and hyperbola strip intersection using the finite divisor API. The Euler-sequence inequalities then give the harmonic error; no prime theorem is needed. Used in [Dirichlet divisor average](#dirichlet-divisor-average-dirichlet-divisor-average).

**Proved moments and conjectural model normalization.** For the second moment, the explicit Simonič–Starichkova Corollary 1 supplies a stronger eventual error, but its Voronoi, saddle-point and short-interval chain must be proved. For the fourth moment, Conrey’s coefficient formula fixes the leading constant and uses Heath-Brown’s moment estimate as an external input. The original Ingham internal locator remains unverified. The general-k normalization is a conjecture; prove only positivity and convergence of its constants and the k=1,2,3 checks. Used in [Second moment of zeta](#second-moment-of-zeta-zeta-second-moment); [Fourth moment of zeta](#fourth-moment-of-zeta-zeta-fourth-moment); [Moment model as a conditional comparison](#moment-model-as-a-conditional-comparison-moment-model-comparison); [Arithmetic and Barnes factors in the zeta moment conjecture](#arithmetic-and-barnes-factors-in-the-zeta-moment-conjecture-zeta-moment-constants).

**Beurling Tauberian remainder proof.** The Beurling all-log equivalence requires Laplace–Stieltjes integration by parts, tempered boundary/Fourier inversion, one-sided smoothing and the β_n/n→0 remainder estimate. Prove all-derivative Abelian bounds, o(log|t|), the weak-boundary upgrade, 3–4–1 reciprocal bounds and smooth pole division with matched logarithms. Ordinary Wiener–Ikehara does not include this all-remainder measure theorem; these analytic ingredients belong to this layer. Used in [Beurling PNT with all logarithmic remainders](#beurling-pnt-with-all-logarithmic-remainders-beurling-all-log-remainders).

**Inverse-totient count.** The inverse-totient O(x) count requires a complete analytic or independent elementary proof. Smati’s stated stronger asymptotic and its finite computer verification do not themselves provide that proof. Used in [Inverse-totient counting input](#inverse-totient-counting-input-inverse-totient-count).

**Landau and Selberg–Delange counts.** Establish the complex-κ Selberg–Delange transfer with weighted prime mean, divisor domination, branches and residual factor at 1. Evaluate the positive Landau constant, prove the Eisenstein-integer norm criterion and asymptotic, and control the shifted intersection by o(K/sqrt(log K)). For a fixed finite residue family prove its character expansion, maximal-exponent selection, residual positivity and outside-subgroup zero count. No varying-modulus uniformity is implicit. Used in [Landau–Ramanujan count of sums of two squares](#landau-ramanujan-count-of-sums-of-two-squares-landau-sum-two-squares-count); [Landau upper bound for shifted Eisenstein norms](#landau-upper-bound-for-shifted-eisenstein-norms-landau-three-square-form-count); [Asymptotic count of the three exceptional families](#asymptotic-count-of-the-three-exceptional-families-landau-exception-union); [Counts supported on half the reduced prime classes](#counts-supported-on-half-the-reduced-prime-classes-half-density-prime-support-count).

**Squarefree mean and positive Euler-tail interfaces.** For squarefree means, prove a=1∗g, a uniformly summable |g(d)|/sqrt(d) majorant and C=Σg(d)/d. For the Gamma prime tail, pass from finite positive subproducts to every retained infinite subset using the local binomial estimate and summable logarithms. Used in [Wintner-type mean over prime divisors](#wintner-type-mean-over-prime-divisors-prime-divisor-product-mean); [Gamma Euler-product truncation](#gamma-euler-product-truncation-gamma-prime-product-tail).

### Examples

The divisor bounds include n=1, where τ(1)=1, and exclude n=0. With the inclusive smooth cutoff, Ψ(8,2)=4, from 1,2,4,8; Ψ(6,3)=5, excluding 5. The strict-cutoff Mathlib parameter is ⌊y⌋+1. Pretentious distance from 1 to itself is zero; the completely multiplicative function taking −1 at each prime has positive distance from 1 once the range contains a prime. A finite reciprocal sum over y-smooth integers up to x is bounded by the full finite-prime Euler product, and is generally smaller: at x=y=2 the values are 3/2 and 2.

### Dependencies

Mathlib prime factorization, divisors, convolution, Möbius and von Mangoldt functions; ArithmeticDirichletSeries Euler products, Abel and Perron summation; Layer 0 prime estimates; Layer 1 Dirichlet-polynomial means and Fourier estimates. The short-interval and Mangoldt-window estimates are owned here, so no later sieve or circle-method roadmap is a prerequisite.

<a id="layer-4-lerch-continuation-complex-hurwitz-zeta-and-barnes-g"></a>

## Layer 4: Lerch continuation, complex Hurwitz zeta and Barnes G

Start with absolutely convergent Lerch and complex-Hurwitz series, then specify analytic continuation on actual covering spaces with explicit loops and logarithm conventions. The two Lerch functional equations and the boundary limits use the same continuation. The Barnes product gives the normalization needed for moments and spectral determinants.

<a id="lerch-transcendent-lerch-transcendent"></a>

### 4.1 Lerch transcendent

For |z|<1, Re c>0 and s∈C, Φ(z,s,c)=Σ_{n≥0}z^n exp(−s Log(n+c)), using the principal logarithm. This series defines a jointly holomorphic function on that domain. At z=1 the separate Hurwitz series requires Re s>1. The representative convergent series is `lerchSeries`; `expZeta_eq_lerchSeries` records the c=1 exponential-zeta comparison.

The proof proceeds as follows. Define the series with exp(−s Log(n+c)); Re c>0 makes every n+c nonzero and keeps it in the principal-log analytic half-plane. At z=0, define z⁰=1; the n=0 term is retained. Use the separate compact-series lemma to prove absolute convergence and joint holomorphy on |z|<1, Re c>0, s arbitrary. The definition itself is the initial series, so no analytic continuation is silently assigned to its totalized sum outside this domain. Reindex the absolutely convergent series to obtain the c shift and the periodic/polylog z prefactor. Compare the explicit series in a when Im a>0; no independent Lerch-zeta carrier is assumed.

The required interface consists of the following operations and identities.

- `lerch_transcendent.series`: Φ is the displayed absolutely convergent series on |z|<1, Re c>0.
- `lerch_transcendent.zero`: Φ(0,s,c)=exp(−s Log c).
- `lerch_transcendent.shift`: Φ(z,s,c)=c^−s+zΦ(z,s,c+1).
- `lerch_transcendent.exp_change`: For Im a>0, LerchZeta(s,a,c)=Φ(exp(2πia),s,c).
- `lerch_transcendent.polylog`: The periodic/polylog series is zΦ(z,s,1), not Φ(z,s,1).
- `lerch_transcendent.holomorphic`: The map(s,z,c)↦Φ(z,s,c) is jointly holomorphic on |z|<1, Re c>0, s∈C.
- `lerch_transcendent.deriv_s`: On the initial domain, ∂_sΦ(z,s,c)=−Σ_{n≥0}z^n Log(n+c)exp(−sLog(n+c)); the differentiated series is absolutely and locally uniformly convergent.

**Checks.**

- Φ(0,2,1)=1.
- Φ(z,0,c)=1/(1−z) on |z|<1, independently of c.
- Φ(z,−1,c)=c/(1−z)+z/(1−z)².
- For z=1/2 and s=0, Φ=2 while zΦ=1; omitting z fails the polylog comparison.

The result must also satisfy these compatibility requirements: Φ(0,2,1)=1. Φ(z,0,c)=1/(1−z) on |z|<1, independently of c. Φ(z,−1,c)=c/(1−z)+z/(1−z)². For z=1/2 and s=0, Φ=2 while zΦ=1; omitting z fails the polylog comparison.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), Introduction (1.1); §3.3 pp.24–25; Theorem5.1 proof p.36.

*Needs:* `Complex.cpow_def_of_ne_zero`.

<a id="complex-parameter-hurwitz-series-complex-hurwitz-series"></a>

### 4.2 Complex-parameter Hurwitz series

For Re c>0 and Re s>1, ζ_H(s,c)=Σ_{n≥0}exp(−sLog(n+c)), with the principal logarithm. It is the z=1 series, not an unqualified value of the general Lerch continuation on its omitted z=1 stratum. The representative series is `complexHurwitzSeries`; `complexHurwitzSeries_one` gives the Riemann specialization and `complexHurwitzSeries_ofReal` gives the real circle-parameter comparison.

The proof proceeds as follows. Define the principal series on Re c>0, Re s>1; every n+c is nonzero. The polynomial p-series majorant is locally uniform on compact subsets with inf Re s>1 and inf Re c>0. Reindex its absolutely convergent series to obtain the c shift; compare to existing circle Hurwitz only for real0<c≤1, preserving its endpoint representative.

The required interface consists of the following operations and identities.

- `complex_hurwitz_series.series`: The displayed series converges absolutely on Re s>1, Re c>0.
- `complex_hurwitz_series.shift`: ζ_H(s,c+1)=ζ_H(s,c)−c^−s.
- `complex_hurwitz_series.real_circle`: For real0<c≤1 it agrees with the circle Hurwitz series using the positive representative convention.
- `complex_hurwitz_series.c_one`: ζ_H(s,1)=riemannZeta(s) on Re s>1.

**Checks.**

- ζ_H(2,1)=π²/6.
- ζ_H(s,1/2)=(2^s−1)ζ(s) on Re s>1, by the odd-integer partition.
- c=0 is outside the domain and no0^−s term is assigned a junk value.
- ζ_H(2,1+i)−ζ_H(2,2+i)=−i/2; this tests the actual complex c parameter and inclusion of the n=0 term.

The result must also satisfy these compatibility requirements: ζ_H(2,1)=π²/6. ζ_H(s,1/2)=(2^s−1)ζ(s) on Re s>1, by the odd-integer partition. c=0 is outside the domain and no0^−s term is assigned a junk value.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), §1 (1.3), p.2, gives the real specialization; the complex-c absolutely convergent series and Taylor-subtracted integral are constructed here, with origin subtraction before continuation.

*Needs:* `Complex.cpow_def_of_ne_zero`.

<a id="barnes-g-function-barnes-g-function"></a>

### 4.3 Barnes G-function

The Barnes G-function is the entire function G : ℂ → ℂ given by the Weierstrass product G(z + 1) = (2π)^{z/2} exp(−z(z + 1)/2 − γ z²/2) Π_{k≥1} (1 + z/k)^k exp(−z + z²/(2k)), with γ Euler’s constant. It satisfies G(z + 1) = Γ(z) G(z) when z is not a nonpositive integer, and G(1) = 1; the recurrence is an identity of meromorphic functions before pointwise totalization. Its zeros are at z = −n (n ≥ 0) with multiplicity n + 1, and as z → ∞ in |ph z| ≤ π − δ, Ln G(z + 1) has the asymptotic expansion z²/4 + z Ln Γ(z + 1) − (z(z + 1)/2 + 1/12) ln z − ln A + Σ_{k≥1} B_{2k+2}/(2k(2k+1)(2k+2) z^{2k}), with A Glaisher’s constant.

Assume Logarithms are principal on the positive real axis and continued by continuity (DLMF §4.2(i)).; The pointwise Gamma recurrence and the formula involving ψ(z) exclude z = −n for n ∈ ℕ, because Mathlib assigns Gamma the value zero at its poles.

The proof proceeds as follows. Define G(z + 1) by the product; the k-th factor is 1 + O(|z|³/k²) on compact sets, so the product converges locally uniformly to an entire function, with the stated zeros. Compare the meromorphic logarithmic derivatives of G(z + 1)/G(z) and Γ(z) through the Weierstrass product of 1/Γ; the normalization fixes their ratio. The resulting pointwise recurrence holds off the poles of Γ. At those poles retain the meromorphic identity, rather than multiplying Mathlib’s totalized Gamma value by G(z). The integral formula Ln G(z + 1) = z ln(2π)/2 − z(z + 1)/2 + z Ln Γ(z + 1) − ∫₀^z Ln Γ(t + 1) dt (DLMF 5.17.4) and the Stirling series give the asymptotic expansion.

The required interface consists of the following operations and identities.

- `barnesG`: The entire function G defined by the Weierstrass product.
- `barnesG_add_one`: For z ∈ ℂ satisfying z ≠ −n for every n ∈ ℕ, G(z + 1) = Γ(z) G(z), with Mathlib’s Complex.Gamma.
- `barnesG_one`: G(1) = 1.
- `barnesG_natCast`: G(n) = Π_{k=1}^{n−2} k! for n ≥ 2.
- `differentiable_barnesG`: G is entire.
- `barnesG_eq_zero_iff`: G(z) = 0 iff z = −n for some n ≥ 0, and the zero there has order n + 1.
- `logDeriv_barnesG_add_one`: For z not a nonpositive integer, G′(z + 1)/G(z + 1) = ln(2π)/2 + 1/2 − z + z ψ(z), where ψ = Γ′/Γ. At z = 0 the removable extension has value G′(1)/G(1) = ln(2π)/2 − 1/2; substituting the totalized ψ(0) into the first formula is invalid.
- `barnesG_asymptotic`: The Stirling-type expansion of Ln G(z + 1) above.
- `logDeriv_barnesG_one`: G′(1)/G(1) = ln(2π)/2 − 1/2, obtained by differentiating the product at z = 0.
- `barnesG_real_pos`: For real x>0, G(x) has zero imaginary part and positive real part; the product factors and exponential prefactor are positive on z=x−1>−1.

**Checks.**

- G(1) = G(2) = G(3) = 1, G(4) = 2, G(5) = 12.
- G(0) = 0, a simple zero; G(−1) = 0 with order 2.
- G(z + 1)/G(z) = Γ(z) agrees with Mathlib’s Complex.Gamma away from the poles of Γ.
- G(z)(1 + sin²(πz)) satisfies the same recursion and the same value at 1 but has zeros off the nonpositive integers, so the recursion and G(1) = 1 alone do not define G.
- G(1) = 1 but Complex.Gamma(0) G(0) = 0. The unqualified pointwise recurrence at z = 0 fails.
- G′(1)/G(1) = ln(2π)/2 − 1/2; the formula involving totalized ψ(0) would incorrectly give ln(2π)/2 + 1/2.

The result must also satisfy these compatibility requirements: G(n) = (n − 2)! (n − 3)! ⋯ 1! for n ≥ 2 (DLMF 5.17.2).

See [F. W. J. Olver, A. B. Olde Daalhuis, D. W. Lozier et al. (eds.); Chapter 5 by R. A. Askey and R. Roy — NIST Digital Library of Mathematical Functions, §5.17 Barnes’ G-function (double gamma function)](https://dlmf.nist.gov/5.17), §5.17, equations (5.17.1)–(5.17.5); [Victor S. Adamchik — Contributions to the Theory of the Barnes Function](https://arxiv.org/pdf/math/0308086v1), canonical product p.2, (20) and Proposition3.1, pp.7–8, Lemma5.1 and proof, pp.10–11 (right-half-plane asymptotic).

*Needs:* `Complex.Gamma`; `Complex.exp`; [Uniform Stirling bounds for Γ on vertical strips](#uniform-stirling-bounds-for-on-vertical-strips-uniform-complex-stirling).

<a id="lerch-differential-equation-lerch-pde"></a>

### 4.4 Lerch differential equation

(z∂_z+c)∂_cΦ(z,s,c)=−sΦ(z,s,c) on the initial domain and each matched continued branch. The right-hand side has a minus sign.

The proof proceeds as follows. Apply the lowering relation with s+1 to the raising relation. Both derivative identities retain the same branch.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), Theorem2.3 p.13 (2.5), §4 Theorem4.1 and proof p.33.

*Needs:* [Lerch transcendent](#lerch-transcendent-lerch-transcendent); [Lerch compact convergence](#proof-lerch-compact-series-bound); [Lerch lowering relation](#proof-lerch-z-derivative); [Lerch raising relation](#proof-lerch-c-derivative).

<a id="proof-lerch-compact-series-bound"></a>

**Lerch compact convergence.** On every compact subset of |z|<1, Re c>0, s∈C, the Φ series and each fixed derivative in z,s,c converge uniformly and absolutely.

For a compact subset choose0<r₀<r<1 with |z|≤r₀, Re c≥δ>0, and |s|,|c| bounded. The principal argument of n+c stays within(−π/2,π/2). Thus |exp(−sLog(n+c))|≤C(n+1)^B uniformly, after treating finitely many small n. Each fixed mixed derivative contributes finitely many factors polynomial in n, shifted powers of n+c and powers of Log(n+c). Differentiating z^n directly treats z=0 correctly: its d-th derivative is0 for n<d and a falling factorial times z^(n−d) otherwise. Absorb every fixed polynomial/logarithmic factor and the finite index shift into C r^n using r₀<r; use a summable geometric majorant for absolute, uniform convergence and joint termwise differentiation.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), §2 p.4 (2.1) and §5 pp.20–22 termwise derivative proof.

<a id="proof-lerch-z-derivative"></a>

**Lerch lowering relation.** On the initial domain, z∂_zΦ(z,s,c)+cΦ(z,s,c)=Φ(z,s−1,c). For an already constructed continuation it transports along matching lifted paths by uniqueness.

Differentiate termwise using compact uniform convergence. Combine n+c in the numerator, then continue the identity with its s−1 path.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), Theorem2.3 p.13 (2.3), §4 Theorem4.1 and proof p.33.

<a id="proof-lerch-c-derivative"></a>

**Lerch raising relation.** On the initial domain, ∂_cΦ(z,s,c)=−sΦ(z,s+1,c), For an already constructed continuation the identity transports along the matching s+1 path by uniqueness.

Differentiate exp(−sLog(n+c)) termwise under compact convergence. Use the same branch for n+c in the s and s+1 terms.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), Theorem2.3 p.13 (2.4), §4 Theorem4.1 and proof p.33.

<a id="lerch-continuation-on-a-covering-lerch-cover-continuation"></a>

### 4.5 Lerch continuation on a covering

The initial Φ germ continues to a single-valued holomorphic function on the universal cover of N#=C_s×(C_z\{0,1})×(C_c\Z≤0), based at(s,z,c)=(1/2,−1,1/2). Fix its base germ by the principal integral and continuation from |z|<1. The separate solvable-descent lemma states the quotient-cover invariance.

The proof proceeds as follows. Use the endpoint/path-class UniversalCover of the actual open subtype N#. Holomorphy means a local analytic function on C³ represents the cover function near every point. Normalize its germ near the constant-path point by the principal integral at(1/2,−1,1/2). A positive geometric loop γ is represented in Tau Ceti by the action γ⁻¹; no orientation is inferred from a left-action name. Import the canonical based universal cover of the punctured complex-product manifold. Verify path-connectedness, local path-connectedness and semilocal simple connectedness; pull back its complex charts along the covering projection. Path composition follows the source: first traverse the based loop, then the path. In the a coordinate the integral defines the downward-cut domains for Re s>0, Re c>0. Clockwise contour detours give analytic cells covering all a∉Z; residue differences provide the local a-loop continuations. Finite c-shift separation supplies cells for c away from nonpositive integers. For Re c>0, repeatedly apply the already proved lowering relation on overlapping s half-planes to extend to every s. This is essential at positive integer c, where the four-term functional equation would contain excluded1−c. Keep the finite c-shift identity to reach all remaining c; its terms are entire in s on their lifted logarithm branches. Use analytic uniqueness on overlaps and endpoint-fixed homotopy invariance to glue local germs on the simply connected cover. The residue and finite-term monodromy germs themselves continue globally; word composition is the monodromy cocycle M_(τ₁τ₂)=M_τ₁+M_τ₂+M_τ₂(M_τ₁), with the source concatenation order. Positive c strata are filled by the actual local holomorphic extension, not merely by vanishing monodromy.

The result must also satisfy these compatibility requirements: The basepoint z=−1 lies outside the open series disc; its germ is fixed by the principal integral with Re s,Re c>0. The cover omits z=0,1; the initial principal series still extends at z=0, but other sheets may not. Holomorphy at positive integer c uses the lowering operator; zero monodromy without a removable-singularity proof would be insufficient.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), Theorems2.1–2.2 p.12; complete selected §3.2–§3.5 pp.21–32, and LerchII §§3–4/§8.

*Needs:* [Lerch transcendent](#lerch-transcendent-lerch-transcendent); [UniversalCovers stage 0 port the foundations into tauceti](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/UniversalCovers#stage-0-port-the-foundations-into-tauceti); `TauCeti.UniversalCover`; `TauCeti.UniversalCover.basepointLift`; `TauCeti.UniversalCover.inv_smul_mk`; [Lerch compact convergence](#proof-lerch-compact-series-bound); [Lerch shift identity](#proof-lerch-parameter-shift); [Lerch lowering relation](#proof-lerch-z-derivative); [Lerch integral representation](#proof-lerch-integral-representation); [Monodromy around c=−n](#proof-lerch-c-monodromy); [Monodromy around a=n](#proof-lerch-a-monodromy).

<a id="proof-lerch-parameter-shift"></a>

**Lerch shift identity.** On the initial convergence domain, Φ(z,s,c)=c^−s+zΦ(z,s,c+1). For an already constructed analytic continuation it transports along matching lifted paths, including the shifted c path, by uniqueness.

Separate n=0 and reindex n≥1 in the absolutely convergent series. Continue both sides along the same lifted c shift, keeping its branch data.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), §4 p.17, (4.30)–(4.32), specialized to N=0.

<a id="proof-lerch-integral-representation"></a>

**Lerch integral representation.** There exists a jointly holomorphic principal-sheet extension F(s,z,c) on Re s>0, Re c>0, z∈C\[1,∞), agreeing with the defining Φ series for |z|<1, such that F(s,z,c)=Γ(s)^−1∫_0^∞t^(s−1)exp(−ct)/(1−zexp(−t))dt. The integral is absolutely convergent; its formula is not asserted for the totalized series outside |z|<1.

For |z|<1, expand the denominator; the geometric bound and Re c>0 dominate the integral at∞ and Re s>0 dominates its origin. Apply the complex gamma integral and sum-integral interchange to identify the initial series. On a compact subset outside the real cut[1,∞), the denominator has a positive lower bound on any fixed finite t interval, and is uniformly close to1 for large t. At t=0 it is bounded away from0 because z≠1. These bounds permit joint differentiation with integrable power/logarithmic majorants. Define F by the absolutely convergent integral on this domain; joint holomorphy and agreement in the disc fix the principal sheet. The gamma integral for complex c and its parameter differentiation remain exact imported analytic adapters to verify.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), §2 p.5, (2.2)–(2.4), integral cut-domain paragraph; §4 (4.18)–(4.23).

<a id="proof-lerch-c-monodromy"></a>

**Monodromy around c=−n.** On the principal Lerch-zeta germ ζ(s,a,c)=Φ(exp(2πia),s,c), a positive loop around c=−n (n≥0) changes the branch by (e^(−2πis)−1)e^(2πina)(c+n)^−s, with the same logarithm lift. Loops about positive integer c have zero monodromy.

Separate the n-th term by the shift formula; the remaining shifted tail is holomorphic around c=−n. Continue (c+n)^−s once counterclockwise and subtract the original value.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), Theorem4.5 (4.15) p.14, complete finite-shift proof (4.28)–(4.34) pp.17–18.

<a id="proof-lerch-a-monodromy"></a>

**Monodromy around a=n.** For the lifted principal Lerch-zeta branch, a positive loop around a=n∈Z changes it by −(2πi)^s Γ(s)^−1(a−n)^(s−1)e^(−2πic(a−n)), with (2πi)^s defined by log(2π)+iπ/2 and the continued logarithm of a−n. On the fundamental strip0<Re a<1, the logarithm of a−n is cut along the negative imaginary axis with argument in(−π/2,3π/2). Equivalently, for n≥1 replace(a−n)^(s−1) by exp(πi(s−1))(n−a)^(s−1), whose base has positive real part; for n≤0 use the principal logarithm of a−n.

Move the integral contour across the simple pole t=2πi(a−n), retaining the clockwise residue sign. Continue the resulting residue term back to the principal polycylinder.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), Theorem4.5 (4.11) pp.13–14, negative-imaginary cut convention; complete contour/residue proof (4.18)–(4.27) pp.14–17.

<a id="nonpositive-lerch-special-values-lerch-nonpositive-special-values"></a>

### 4.6 Nonpositive Lerch special values

For m≥0, Φ(z,−m,c)=(z∂_z+c)^m(1/(1−z)), a rational function of z,c with poles only at z=1. It extends in c across all integers and has zero monodromy. For m=1 it equals c/(1−z)+z/(1−z)².

The proof proceeds as follows. Use the lowering relation repeatedly from s=0 on |z|<1. Inductively differentiate the rational function, then continue it as a single-valued function; no limit z→1 is asserted.

The result must also satisfy these compatibility requirements: At m=0 the value is1/(1−z); at m=1 it is c/(1−z)+z/(1−z)². The rational function is polynomial in c and extends through all integer c. No radial limit at z=1 is asserted. Do not use published Theorem6.1(2) at m=0: the c→0 Φ limit retains the n=0 term1, while the periodic continuation equals q₀(z)−1. See the normalization convention.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), §5 Theorem5.1 and complete recurrence proof p.36, (5.2)–(5.5).

*Needs:* [Lerch transcendent](#lerch-transcendent-lerch-transcendent); [Lerch compact convergence](#proof-lerch-compact-series-bound); [Lerch lowering relation](#proof-lerch-z-derivative); [Lerch at order zero](#proof-lerch-zero-order-value).

<a id="proof-lerch-zero-order-value"></a>

**Lerch at order zero.** Φ(z,0,c)=1/(1−z) for |z|<1, Re c>0.

Unfold the stated definition and apply the finite algebraic, positivity or convergent geometric-series computation.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), Theorem5.1, (5.3) and m=0 proof p.36.

<a id="comparison-with-the-circle-valued-hurwitz-function-circle-hurwitz-import"></a>

### 4.7 Comparison with the circle-valued Hurwitz function

For real 0<c≤1 and Re s>1, the complex Hurwitz series Σ_{n≥0}(n+c)^−s agrees with Mathlib’s circle-valued Hurwitz function at c mod 1. At c=1 the parameter is zero and the series is ζ(s). This is a comparison of series with an existing function.

The proof proceeds as follows. For0<c≤1, use the HasSum statement and cpow/exponential conversion for the positive bases n+c. At c=1 the circle parameter is0; its n=0 zero-base term is junk-valued0 in Re s>1, so the endpoint still represents the positive-integer Hurwitz series.

The result must also satisfy these compatibility requirements: The c=1 series isζ(s), notζ(s)+an extra zero-base contribution. Circle parameters c and c+1 agree as circle elements, but their ordinary unperiodized Hurwitz series differ by c^−s; the comparison is restricted to0<c≤1.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch zeta function I. Zeta integrals](https://arxiv.org/pdf/1005.4712v2), §1 p.2 Hurwitz specialization; exact Hurwitz series/residue declarations.

*Needs:* `HurwitzZeta.hurwitzZeta`; `HurwitzZeta.hasSum_hurwitzZeta_of_one_lt_re`; `HurwitzZeta.differentiableAt_hurwitzZeta`; `HurwitzZeta.hurwitzZeta_residue_one`; `HurwitzZeta.differentiableAt_hurwitzZeta_sub_one_div`; `Complex.cpow_def_of_ne_zero`; [Complex-parameter Hurwitz series](#complex-parameter-hurwitz-series-complex-hurwitz-series).

<a id="periodic-zeta-and-lerch-normalization-exp-zeta-lerch-comparison"></a>

### 4.8 Periodic zeta and Lerch normalization

For real a, z=exp(2πia) and Re s>1, expZeta(a,s)=zΣ_{n≥0}z^n exp(−sLog(n+1)), in the absolutely convergent boundary series. The totalized defining Φ sum agrees here after its boundary summability proof; at a∈Z this is the Riemann degeneration. It gives no equality of arbitrary sheets or unqualified limit for Re s≤1.

The proof proceeds as follows. Shift the n≥1 periodic sum to n≥0 and factor out z. Use the expZeta series theorem and its existing continuation.

The result must also satisfy these compatibility requirements: At a=0 the boundary series isζ(s). At a=1/2,s=2, expZeta(a,s)=−π²/12 while Φ(−1,2,1)=+π²/12; the z prefactor changes the sign.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch zeta function I. Zeta integrals](https://arxiv.org/pdf/1005.4712v2), §1 p.2 defining periodic series; LerchIII §6 Theorem6.1 pp.41–42.

*Needs:* [Lerch transcendent](#lerch-transcendent-lerch-transcendent); `HurwitzZeta.expZeta`; `HurwitzZeta.hasSum_expZeta_of_one_lt_re`; `Complex.cpow_def_of_ne_zero`.

<a id="even-lerch-functional-relation-lerch-even-functional-equation"></a>

### 4.9 Even Lerch functional relation

On the extended polycylinder s∈C,0<Re a<1,0<Re c<1, put L_+=ζ(s,a,c)+e^(−2πia)ζ(s,1−a,1−c) and Λ_+=π^(−s/2)Γ(s/2)L_+. Then Λ_+(s,a,c)=e^(−2πiac)Λ_+(1−s,1−c,a), as matched holomorphic continuations. At a gamma pole, Λ denotes the removable holomorphic extension of the product, not its pointwise totalized Gamma value.

The proof proceeds as follows. Use the real-parameter Fourier/Poisson-Mellin proof in LerchI Theorem5.1 with0<a,c<1 and0<Re s<1; its real-parameter analytic supplier remains an explicit source boundary until the entire proof is checked. The principal integral is jointly holomorphic on the fundamental polycylinder. Continue the real a identity first in a at fixed real c, then in c, using the one-variable identity theorem. Combine even and odd equations with gamma reflection/duplication to obtain the three-term transformation, defining ζ on Re s<1 from values at1−s with positive real part. Glue this with the integral Re s>0 representation on their overlap. At a gamma pole on a nonpositive s integer, the functional equation relates the completed combination to its finite positive-integer value at1−s; use meromorphic uniqueness and the removable extension. The pointwise product with totalized Gamma at a pole is not that extension.

The result must also satisfy these compatibility requirements: These strip identities precede the global cover and therefore create no cycle in its construction. The odd equation retains the i multiplier; both symmetrizations use exp(−2πia).

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), Theorem2.1 (2.7)–(2.10) p.5; complete §3 pp.8–10, Lemma3.1 and Theorem2.1 proof.

*Needs:* [Lerch transcendent](#lerch-transcendent-lerch-transcendent); [Lerch compact convergence](#proof-lerch-compact-series-bound); [Lerch integral representation](#proof-lerch-integral-representation).

<a id="odd-lerch-functional-relation-lerch-odd-functional-equation"></a>

### 4.10 Odd Lerch functional relation

On the same polycylinder, L_−=ζ(s,a,c)−e^(−2πia)ζ(s,1−a,1−c) and Λ_−=π^(−(s+1)/2)Γ((s+1)/2)L_− satisfy Λ_−(s,a,c)=i e^(−2πiac)Λ_−(1−s,1−c,a), with matched continuations; at gamma poles Λ denotes the removable holomorphic extension rather than a pointwise totalized Gamma product.

The proof proceeds as follows. Use the real-parameter Fourier/Poisson-Mellin proof in LerchI Theorem5.1 with0<a,c<1 and0<Re s<1; its real-parameter analytic supplier remains an explicit source boundary until the entire proof is checked. The principal integral is jointly holomorphic on the fundamental polycylinder. Continue the real a identity first in a at fixed real c, then in c, using the one-variable identity theorem. Combine even and odd equations with gamma reflection/duplication to obtain the three-term transformation, defining ζ on Re s<1 from values at1−s with positive real part. Glue this with the integral Re s>0 representation on their overlap. At a gamma pole on a nonpositive s integer, the functional equation relates the completed combination to its finite positive-integer value at1−s; use meromorphic uniqueness and the removable extension. The pointwise product with totalized Gamma at a pole is not that extension.

The result must also satisfy these compatibility requirements: These strip identities precede the global cover and therefore create no cycle in its construction. The odd equation retains the i multiplier; both symmetrizations use exp(−2πia).

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), Theorem2.1 (2.7)–(2.10) p.5; complete §3 pp.8–10, Lemma3.1 and Theorem2.1 proof.

*Needs:* [Lerch transcendent](#lerch-transcendent-lerch-transcendent); [Lerch compact convergence](#proof-lerch-compact-series-bound); [Lerch integral representation](#proof-lerch-integral-representation).

<a id="lerch-boundary-degeneration-lerch-boundary-degeneration"></a>

### 4.11 Lerch boundary degeneration

For Re c>0 and Re s>1, the principal radial limit Φ(r,s,c) as r↑1 equals the convergent Hurwitz series. This limit is not an analytic continuation theorem across the entire z=1 stratum for all s; for s=0, Φ(r,0,c)=1/(1−r) diverges.

The proof proceeds as follows. For Re c>0 and Re s>1, majorize |exp(−sLog(n+c))| by C(n+1)^(−Re s), using bounded principal arguments and |n+c|≥n+Re c. The Hurwitz majorant is summable. For0≤r<1 each r^n is bounded by1 and tends to1; apply dominated convergence for counting measure to get the complex-c Hurwitz series. At s=0 the initial geometric-series value1/(1−r) diverges to+∞, so no unrestricted degeneration follows.

The result must also satisfy these compatibility requirements: The limit holds for complex c with positive real part, including c=1+i. At s=0 it diverges for every allowed c, so the Re s>1 hypothesis is material.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch zeta function I. Zeta integrals](https://arxiv.org/pdf/1005.4712v2), Theorem 2.3, p.8, and §1, pp.1–3; the complex-c radial limit here is proved separately by discrete dominated convergence.

*Needs:* [Lerch transcendent](#lerch-transcendent-lerch-transcendent); [Complex-parameter Hurwitz series](#complex-parameter-hurwitz-series-complex-hurwitz-series); [Lerch at order zero](#proof-lerch-zero-order-value).

<a id="complex-hurwitz-continuation-complex-hurwitz-continuation"></a>

### 4.12 Complex Hurwitz continuation

There exist canonical joint continuations H(s,c),R(s,c) on s∈C, Re c>0, with H jointly holomorphic off s=1, R jointly holomorphic everywhere on this domain, R(1,c)=1, and R(s,c)=(s−1)H(s,c) for s≠1. H agrees with the defining Hurwitz series on Re s>1 and has a simple pole at1 of residue1. The shift holds off the pole. Neither a totalized divergent series nor the pointwise product(s−1)H at1 is claimed to be the removable extension R.

The proof proceeds as follows. Establish the separate z=1 gamma integral on Re s>1, Re c>0 by termwise integration of the absolutely convergent Hurwitz series and parameter-uniform domination. The principal-sheet integral lemma excludes z=1 and cannot simply be evaluated there. Subtract the t=0 Taylor terms to continue in s. Prove locally uniform parameter domination and cancel the reciprocal-gamma zeros. Uniqueness on the convergence half-plane fixes the continuation and the pole residue.

The result must also satisfy these compatibility requirements: R(1,c)=1 for every Re c>0; directly evaluating(1−1) times a totalized H(1,c) would give0 and is not the claim. For real0<c≤1, H matches the existing circle function away from1.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), §9 p.28 Hurwitz singular-stratum paragraph; complete separate complex-c proof remains required.

*Needs:* [Complex-parameter Hurwitz series](#complex-parameter-hurwitz-series-complex-hurwitz-series); [Lerch transcendent](#lerch-transcendent-lerch-transcendent); [Lerch compact convergence](#proof-lerch-compact-series-bound); [Lerch integral representation](#proof-lerch-integral-representation).

<a id="arithmetic-and-barnes-factors-in-the-zeta-moment-conjecture-zeta-moment-constants"></a>

### 4.13 Arithmetic and Barnes factors in the zeta moment conjecture

For real k>0 set c_k(0)=1 and c_k(j+1)=(k+j)c_k(j)/(j+1). Define a(k)=∏_p [(1−1/p)^(k²) Σ_{j≥0} c_k(j)² p^(−j)], an unordered convergent product over primes, and g(k)=Re(G(k+1)²/G(2k+1)), using the canonically normalized Barnes G from this roadmap. All local sums converge, a(k)>0, the Barnes quotient is positive real, and g(k)>0. These constants define the conjectural normalization; no general-k zeta asymptotic is proved.

The proof proceeds as follows. Use the finite-product recurrence to define c_k and compare it with Γ(k+j)/(Γ(k)j!) on k>0; this avoids Gamma values at poles. The local sum converges since c_k(j)=O_k((j+1)^(k−1)), with a harmless enlargement if k<1. Its first two terms are 1+k²/p+O_k(p^(−2)); multiplying by (1−1/p)^(k²) cancels the first-order term. The local factors are positive and 1+O_k(p^(−2)), so their unordered product converges to a positive value. Match uniform coefficient and product estimates in the base libraries before formal closure. Barnes product normalization gives positive real values on positive real arguments. Its integer recurrence supplies g(1),g(2),g(3). For k=2, Σ(j+1)²p^(−j)=(1+p^−1)/(1−p^−1)^3, so a(2)=∏(1−p^−2)=1/ζ(2).

The required interface consists of the following operations and identities.

- `momentConstants.coeff_zero`: c_k(0)=1.
- `momentConstants.coeff_succ`: c_k(j+1)=(k+j)c_k(j)/(j+1), for k>0.
- `momentConstants.coeff_gamma`: c_k(j)=Γ(k+j)/(Γ(k)j!), with positive real arguments.
- `momentConstants.localFactor_hasSum`: The displayed local series has its specified sum for every prime p and k>0.
- `momentConstants.arithmetic_hasProd`: The displayed unordered prime product has product a(k)>0.
- `momentConstants.barnes_real_positive`: G(k+1)²/G(2k+1) is a positive real complex number and has real part g(k).
- `momentConstants.integer_matrixFactor`: For positive integer k, g(k)=∏_{j=0}^{k−1}j!/(j+k)!.

**Checks.**

- a(1)=1 and g(1)=1, matching the second-moment leading constant.
- a(2)=1/ζ(2)=6/π² and g(2)=1/12, so a(2)g(2)=1/(2π²). A missing factorial or reciprocal reverses this test.
- g(3)=1/8640=42/9!, using G(4)=2 and G(7)=34560.
- At k=2 and p=2 the local arithmetic factor is 3/4; at k=1 every local factor is 1.

The result must also satisfy these compatibility requirements: The arithmetic factor and Barnes factor are separate; no factorial is absorbed into a(k). The general-k asymptotic is a named conjecture. The unitary Haar-matrix model remains a higher-tier probability target, importing these constants.

See [J. P. Keating and N. C. Snaith — Random Matrix Theory and ζ(1/2+it)](https://web.williams.edu/Mathematics/sjmiller/public_html/RH/KeatingSnaith_RandomMatrixThAndZeta%28s%2Bit%29.pdf), Equations (4)–(6), (15)–(19), pp.59–61; Barnes formula (80)–(87), pp.73–74.

*Needs:* [Barnes G-function](#barnes-g-function-barnes-g-function); `Nat.factorial`; `Complex.Gamma`; `riemannZeta`; `HasProd`.

<a id="moment-model-as-a-conditional-comparison-moment-model-comparison"></a>

### 4.14 Moment model as a conditional comparison

For each fixed k>0, the statement ∫_0^T|ζ(1/2+it)|^(2k)dt∼a(k)g(k)T(log T)^(k²) is a conjectural model with the arithmetic Euler factor a(k) and random-matrix factor g(k) defined by this roadmap’s zeta-moment-constants target. No asymptotic for general k is asserted unconditionally; k=1 and2 are checked against the proved moments.

The proof proceeds as follows. Use the locally owned arithmetic and Barnes moment factors with the published Keating–Snaith normalization. A Haar-unitary matrix model can later import these constants; it is not needed to state this analytic conjecture. Compare k=1 and2 constants with the analytic moment theorems; treat other k as a named hypothesis.

The result must also satisfy these compatibility requirements: The quantitative proof and the normalization comparisons are required separately.

See [J. P. Keating and N. C. Snaith — Random Matrix Theory and ζ(1/2+it)](https://web.williams.edu/Mathematics/sjmiller/public_html/RH/KeatingSnaith_RandomMatrixThAndZeta%28s%2Bit%29.pdf), Equations (4), (5), (15), (19), pp.59–61.

*Needs:* [Second moment of zeta](#second-moment-of-zeta-zeta-second-moment); [Fourth moment of zeta](#fourth-moment-of-zeta-zeta-fourth-moment); [Arithmetic and Barnes factors in the zeta moment conjecture](#arithmetic-and-barnes-factors-in-the-zeta-moment-conjecture-zeta-moment-constants).

<a id="dirichlet-character-hurwitz-specialization-dirichlet-hurwitz-finite-sum"></a>

### 4.15 Dirichlet character Hurwitz specialization

For a character χ modulo q≥1 and Re s>1, L(s,χ)=q^−sΣ_{a=1}^q χ(a)ζ_H(s,a/q), using the actual principal/imprimitive character values. Continue with the Dirichlet and circle-Hurwitz functions and keep the principal pole.

The proof proceeds as follows. Reuse ZMod.LFunction, which already defines the continued finite combination of circle Hurwitz functions on ZMod q. DirichletCharacter.LFunction is its specialization; q≥1 provides NeZero q. Choose representatives a=1,…,q; toAddCircle of a equals(a/q mod1), with a=q representing residue0 and positive endpoint c=1. On Re s>1 use the real-circle comparison; outside this range the statement is the existing continued finite sum, not the divergent positive-half-plane series.

The result must also satisfy these compatibility requirements: For q=1 and its unique principal character, this reduces toζ(s), with its pole at1. Principal and imprimitive characters retain their zero values on nonunits; no primitivity is silently imposed.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch zeta function I. Zeta integrals](https://arxiv.org/pdf/1005.4712v2), §1 (1.1), (1.3)–(1.4), pp.1–2; finite residue-class reindexing gives the Dirichlet comparison, with the existing ZMod.LFunction definition.

*Needs:* [Comparison with the circle-valued Hurwitz function](#comparison-with-the-circle-valued-hurwitz-function-circle-hurwitz-import); `ZMod.LFunction`; `DirichletCharacter.LFunction`; `Complex.cpow_def_of_ne_zero`.

<a id="hurwitz-bernoulli-values-complex-hurwitz-bernoulli-values"></a>

### 4.16 Hurwitz Bernoulli values

For m≥0 and Re c>0, the canonical continuation has ζ_H(−m,c)=−B_{m+1}(c)/(m+1), with Bernoulli polynomials normalized by te^(ct)/(e^t−1)=ΣB_j(c)t^j/j!. In particular ζ_H(0,c)=1/2−c. The polynomial is the Polynomial.bernoulli(m+1) evaluated at complex c after coefficient extension; B₁(c)=c−1/2, so at c=1 the order-zero value is−1/2.

The proof proceeds as follows. Use the Taylor-subtracted integral and the reciprocal-gamma zero at−m. Identify its coefficient by the stated Bernoulli generating series; pin the B₁ sign.

The result must also satisfy these compatibility requirements: At m=0,c=1 the value is−1/2; at m=0,c=1/2 it is0. The positive-half-plane series definition at s=0 is divergent and totalizes to0; use the continued H, not that totalized sum.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), §6 p.40 Bernoulli/Hurwitz discussion; full separate Taylor/generating-function proof required.

*Needs:* [Complex Hurwitz continuation](#complex-hurwitz-continuation-complex-hurwitz-continuation); `Polynomial.bernoulli`; `Polynomial.bernoulli_one`; `Polynomial.bernoulli_eval_one`.

<a id="lerch-solvable-cover-descent-lerch-solvable-descent"></a>

### 4.17 Lerch solvable-cover descent

The holomorphic Lerch continuation on the universal cover of N#=C_s×(C_z\{0,1})×(C_c\Z≤0) is invariant under π₁(N#)″. It therefore descends to the regular cover associated to that second commutator subgroup; its deck group π₁(N#)/π₁(N#)″ is solvable of derived length at most2. No descent to the maximal abelian z cover is asserted.

The proof proceeds as follows. Use the endpoint/path-class UniversalCover of the actual open subtype N#. Holomorphy means a local analytic function on C³ represents the cover function near every point. Normalize its germ near the constant-path point by the principal integral at(1/2,−1,1/2). A positive geometric loop γ is represented in Tau Ceti by the action γ⁻¹; no orientation is inferred from a left-action name. Set H₀=kernel of the exponent-sum homomorphism sending Z₀↦1, Z₁,Y_n↦0. Its generators are the Z₀-conjugates of Z₁ and Y_n; G/H₀≅Z. In particular, the Z₁ action on f₀ is the phase e^(2πis), not invariance; the abelian diagonal action of the conjugate generators, with the mixed c actions, is the required calculation. Use the z-loop shift formulas and the c-loop monodromy to verify vanishing on[H₀,H₀]. The mixed z/c actions annihilate each other; the cocycle composition identity, not just commutativity of loops, is required. Since G′⊂H₀, G″⊂[H₀,H₀]. This characteristic normal subgroup gives the regular quotient cover imported from UniversalCovers Stage2. Filling positive c strata kills their zero-monodromy loops and preserves the second-commutator conclusion.

The result must also satisfy these compatibility requirements: At a generic s the Z₀-shift of the Z₁ residue is nontrivial; vanishing of principal Z₀ monodromy alone does not imply an abelian z cover.

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), §3.4 Theorem3.5 and complete proof pp.28–31; §3.5 Theorem3.6 pp.31–32.

*Needs:* [Lerch continuation on a covering](#lerch-continuation-on-a-covering-lerch-cover-continuation); [Lerch transcendent](#lerch-transcendent-lerch-transcendent); [UniversalCovers stage 0 port the foundations into tauceti](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/UniversalCovers#stage-0-port-the-foundations-into-tauceti); [UniversalCovers stage 2 lifting criterion and galois correspondence](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence); `TauCeti.UniversalCover`; `TauCeti.UniversalCover.basepointLift`; `TauCeti.UniversalCover.inv_smul_mk`; `TauCeti.UniversalCover.SubgroupQuotient`; `TauCeti.UniversalCover.subgroupQuotientMap`; [Lerch compact convergence](#proof-lerch-compact-series-bound); [Lerch shift identity](#proof-lerch-parameter-shift); [Lerch integral representation](#proof-lerch-integral-representation); [Monodromy around c=−n](#proof-lerch-c-monodromy); [Monodromy around a=n](#proof-lerch-a-monodromy); [Lerch z-loop monodromy and shifts](#proof-lerch-z-monodromy-shift).

<a id="proof-lerch-z-monodromy-shift"></a>

**Lerch z-loop monodromy and shifts.** On D={s∈C,z∈C\[0,∞),0<Re c<1}, choose Log z with 0<Im Log z<2π and a=Log z/(2πi). Put f_p=e^(2πipc)z^−c(a−p)^(s−1) for p≤0, and f_p=e^(πi(s−1))e^(2πipc)z^−c(p−a)^(s−1) for p≥1, using principal logarithms of the positive-real-part bases. For the source upper-connector based loops Z₀,Z₁ about 0,1, the principal germ has M_Z₀Φ=0 and M_Z₁Φ=−(2πi)^s f₀/Γ(s). The residue functions analytically continue to the universal cover, and continuation along Z₀^k sends f_p to f_(p−k); positive continuation along Z₁^k multiplies f₀ by e^(2πiks) and fixes f_p for p≠0; c loops fix every f_p. This corrects the published (3.28), as recorded in the normalization convention. The vanishing Z₀ identity for Φ concerns its principal germ, not invariance on every sheet.

Lift Z₀ by the exponential cover to a path from a=1/2 to3/2 in the upper half-plane; the initial Fourier series is periodic there, so Φ has zero Z₀ monodromy. Z₁ lifts to the a=0 based loop, giving the existing a-monodromy residue. The continued Log z increases by 2πik along Z₀^k. Its factor z^−c contributes e^(−2πikc); combined with e^(2πipc) this is the phase in f_(p−k). Track the cut of a−p using the stated positive-real-part bases, including a sign change of p−k. The principal-germ identities then have unique analytic continuations on the universal cover. The Z₁ lift winds positively once around a=0, while its logarithm lift has no increment around z=0. Thus a^(s−1) gains e^(2πis) for p=0. For p≠0, the corresponding a−p factor has zero winding. Repetition gives e^(2πiks). These principal-germ relations extend analytically on the connected universal cover. The descent argument must use this corrected diagonal action, not published (3.28).

See [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), §3.2 Lemma3.1 pp.21–24; §3.3 Theorem3.4 pp.25–28, (3.24)–(3.35); [Jeffrey C. Lagarias and Wen-Ching Winnie Li — The Lerch zeta function III. Polylogarithms and special values](https://arxiv.org/pdf/1506.06161v1), Definition3.3 (3.23), (3.24), Theorem3.4 (3.25)–(3.30), arXiv v1 printed pp.26–27.

### Remaining analytic proof obligations

**Lerch continuation and functional-relation refinements.** Construct contour-detour continuation cells and prove uniqueness under homotopies; pull their analytic charts to the imported covers. Fix exponential-cover lifts, punctured-plane generators, residue branches and the monodromy cocycle. The real four-term Fourier–Mellin proof is a separate source boundary. Positive-integer-c removability uses the lowering operator. Solvable descent must use the corrected diagonal action exp(2πiks) on f₀ under the z=1 loop. Used in [Complex Hurwitz continuation](#complex-hurwitz-continuation-complex-hurwitz-continuation); [Lerch continuation on a covering](#lerch-continuation-on-a-covering-lerch-cover-continuation); [Even Lerch functional relation](#even-lerch-functional-relation-lerch-even-functional-equation); [Nonpositive Lerch special values](#nonpositive-lerch-special-values-lerch-nonpositive-special-values); [Odd Lerch functional relation](#odd-lerch-functional-relation-lerch-odd-functional-equation); [Lerch differential equation](#lerch-differential-equation-lerch-pde); [Lerch solvable-cover descent](#lerch-solvable-cover-descent-lerch-solvable-descent).

**Hurwitz and Dirichlet endpoint adapters.** Complete the finite positive-representative reindexing, c=1 endpoint and complex-power conversions in the circle Hurwitz and finite Dirichlet comparisons. Radial degeneration uses an absolutely summable complex-c Hurwitz majorant; the circle-valued real carrier cannot represent general complex c. Used in [Comparison with the circle-valued Hurwitz function](#comparison-with-the-circle-valued-hurwitz-function-circle-hurwitz-import); [Periodic zeta and Lerch normalization](#periodic-zeta-and-lerch-normalization-exp-zeta-lerch-comparison); [Dirichlet character Hurwitz specialization](#dirichlet-character-hurwitz-specialization-dirichlet-hurwitz-finite-sum); [Lerch boundary degeneration](#lerch-boundary-degeneration-lerch-boundary-degeneration).

**Complex Hurwitz Taylor-subtraction proof.** Prove the Taylor-subtracted Gamma integral with local parameter-uniform bounds and reciprocal-Gamma cancellation for complex Hurwitz continuation. Match Bernoulli polynomials and their signs. The problematic printed boundary integral and order-zero term in Lerch III cannot replace this proof. Used in [Complex Hurwitz continuation](#complex-hurwitz-continuation-complex-hurwitz-continuation); [Hurwitz Bernoulli values](#hurwitz-bernoulli-values-complex-hurwitz-bernoulli-values).

### Examples

At s=0 and |z|<1 the Lerch series is 1/(1−z). At c=1 the complex Hurwitz series is ζ(s) in Re s>1, giving π²/6 at s=2. Real circle parameters c and c+1 agree, but their unperiodized Hurwitz series differ by c^(−s); the comparison is restricted to 0<c≤1. Barnes G has G(1)=G(2)=G(3)=1, G(4)=2, G(5)=12 and G(0)=0. Multiplying a solution of its recurrence by exp(2πiz) preserves the recurrence and G(1), demonstrating why the canonical product is essential.

### Dependencies

Mathlib Hurwitz zeta, Gamma, Bernoulli polynomials and complex powers; UniversalCovers Layers 0 and 2 for the actual based and regular covering spaces; Layer 1 uniform Gamma estimates and Layer 3 classical moment normalizations. The circle-Hurwitz continuation and residue are consumed from Mathlib under the boundary contract; only the complex-series comparison is a target here.

<a id="layer-5-double-dirichlet-series-and-binary-cubic-zeta-functions"></a>

## Layer 5: Double Dirichlet series and binary-cubic zeta functions

Keep two analytic constructions separate. The selected 16-component quadratic double Dirichlet series has affine reflections, conductor-aware local factors and a three-hyperplane polar divisor. The binary-cubic theory has signature and ideal-class components, local Fourier transforms and a different global matrix equation. Pole clearing, residues and convexity refer to these canonical continuations.

<a id="the-four-real-characters-modulo-eight-characters-mod-eight"></a>

### 5.1 The four real characters modulo eight

Fix the row order ψ1,ψ−1,ψ2,ψ−2 and unit residues 1,3,5,7. Their value table is ((1,1,1,1),(1,−1,1,−1),(1,−1,−1,1),(1,1,−1,−1)); each is zero on even integers. They are genuine Dirichlet characters, with conductors 1,4,8,8 and parities 0,1,0,1. The two positive-sign descriptions and one conductor row printed on p.358 are corrected in the character table above.

The proof proceeds as follows. Verify multiplicativity on the four-element unit group modulo eight. Extend by zero away from units. Check primitive conductor and parity by restriction to levels 1,4,8.

The required interface consists of the following operations and identities.

- `TauCeti.SeveralVariableZeta.Characters8.value`: Evaluate the above row at n mod8, with zero on even n.
- `TauCeti.SeveralVariableZeta.Characters8.mul`: ψ(nm)=ψ(n)ψ(m).
- `TauCeti.SeveralVariableZeta.Characters8.unit_table`: All four rows have exactly the displayed values at 1,3,5,7. Conductor and parity compatibility are separate lemma contracts in [Primitive quadratic twist data](#primitive-quadratic-twist-data-double-primitive-twist-data) and [Quadratic conductor and root number](#proof-quadratic-primitive-adapter).

**Checks.**

- Every row takes value 1 at 1.
- ψ2(3)=−1 and ψ−2(7)=−1.
- For rows i,j, Ση ψi(η)ψj(η)=4 if i=j and 0 otherwise.

The result must also satisfy these compatibility requirements: Fix the row order ψ1,ψ−1,ψ2,ψ−2 and unit residues 1,3,5,7. Their value table is ((1,1,1,1),(1,−1,1,−1),(1,−1,−1,1),(1,1,−1,−1)); each is zero on even integers. They are genuine Dirichlet characters, with conductors 1,4,8,8 and parities 0,1,0,1. The two positive-sign descriptions and one conductor row printed on p.358 are corrected in the character table above.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, (7)–(11), p.358.

*Needs:* `DirichletCharacter`.

<a id="swap-of-double-series-variables-double-affine-swap"></a>

### 5.2 Swap of double-series variables

Define α(s,w)=(w,s). Its fixed locus is s=w; it is a complex affine involution.

The proof proceeds as follows. Exchange the two coordinates twice and solve equality with the original pair. Its linear formula also supplies continuity and analyticity.

The required interface consists of the following operations and identities.

- `TauCeti.SeveralVariableZeta.FunctionalSystem.swap_apply`: swap(s,w)=(w,s).
- `TauCeti.SeveralVariableZeta.FunctionalSystem.swap_involution`: swap∘swap=id.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.swap_fixed`: swap z=z iff z.1=z.2.

**Checks.**

- swap(0,0)=(0,0).
- swap(2,3)=(3,2).
- swap(s,s)=(s,s).

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 and (31)–(35), pp.361–363.

<a id="quadratic-reflection-of-double-series-variables-double-affine-reflection"></a>

### 5.3 Quadratic reflection of double-series variables

Define β(s,w)=(1−s,s+w−1/2). Its fixed locus is s=1/2; it is a complex affine involution.

The proof proceeds as follows. Substitute the affine formula into itself, which recovers both coordinates. Equality with the original pair forces s=1/2 and imposes no additional condition on w.

The required interface consists of the following operations and identities.

- `TauCeti.SeveralVariableZeta.FunctionalSystem.reflect_apply`: reflect(s,w)=(1−s,s+w−1/2).
- `TauCeti.SeveralVariableZeta.FunctionalSystem.reflect_involution`: reflect∘reflect=id.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.reflect_fixed`: reflect z=z iff z.1=1/2.

**Checks.**

- reflect(0,0)=(1,−1/2).
- reflect(2,3)=(−1,9/2).
- reflect(1/2,w)=(1/2,w).

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 and (31)–(35), pp.361–363.

<a id="binary-cubic-local-zeta-integrals-pvs-local-zeta"></a>

### 5.4 Binary-cubic local zeta integrals

For a local field F, take V(F)=Sym³(F²) and its twisted GL2 action and discriminant P from ST.1. For a Schwartz–Bruhat test function Φ and fixed additive Haar measure dx, define the local integral over P(x)≠0 by ∫Φ(x)|P(x)|F^s dx on its proven integrability half-plane. For a nonarchimedean place with residue cardinal q and dx(O_F^4)=1, the shell density dk(U) is the measure of {x∈U:ord P(x)=k}; for Φ=1_U with U⊆O_F⁴ the resulting shell series is Σk≥0 dk(U)q^(−ks). For general Φ use Φ-weighted shell integrals, not unweighted masses. Zero-discriminant mass is recorded separately.

The proof proceeds as follows. Import the invariant/action and local field normalization rather than redefining them. Restrict away from P=0 before forming complex powers. Decompose an integral test function into disjoint measurable valuation shells and apply dominated summation.

The required interface consists of the following operations and identities.

- `TauCeti.SeveralVariableZeta.LocalIntegral.integral`: The displayed Haar integral on the nondegenerate locus.
- `TauCeti.SeveralVariableZeta.LocalIntegral.shellDensity`: Haar measure of the kth discriminant-valuation shell.
- `TauCeti.SeveralVariableZeta.LocalIntegral.shell_sum`: For supported integral Φ with an absolutely integrable shell expansion, its integral equals the weighted shell sum.

**Checks.**

- The integral of Φ=0 is0.
- When Φ is supported where |P|=1, the integral is ∫Φ dx, independently of s.
- For prime p, the linear invariant x on Z_p⊂Q_p and additive Haar measure with μ(Z_p)=1 give the actual integral (1−p^(−1))/(1−p^(−s−1)) for Re s>−1. The valuation shells have masses (1−p^(−1))p^(−k), k≥0.

The result must also satisfy these compatibility requirements: For a local field F, take V(F)=Sym³(F²) and its twisted GL2 action and discriminant P from ST.1. For a Schwartz–Bruhat test function Φ and fixed additive Haar measure dx, define the local integral over P(x)≠0 by ∫Φ(x)|P(x)|F^s dx on its proven integrability half-plane. For a nonarchimedean place with residue cardinal q and dx(O_F^4)=1, the shell density dk(U) is the measure of {x∈U:ord P(x)=k}; for Φ=1_U with U⊆O_F⁴ the resulting shell series is Σk≥0 dk(U)q^(−ks). For general Φ use Φ-weighted shell integrals, not unweighted masses. Zero-discriminant mass is recorded separately.

See [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712), §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14; [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), §3, definition (3.1) and Proposition 3.1, pp.37–38.

*Needs:* ArithmeticStatistics ST.1; AutomorphicLFunctionsAndLocalFactors AL.0; AdelicAlgebraicGroups AA.2.

<a id="signature-refined-cubic-shintani-zeta-functions-cubic-shintani-series"></a>

### 5.5 Signature-refined cubic Shintani zeta functions

For a number field F and each archimedean cubic signature α, let ξF,α(s)=ΣR |Aut R|^(−1)|Disc R|^(−s), over isomorphism classes of locally free rank-three O_F-algebras with nonzero discriminant and signature α. Reducible rings and nonmaximal orders are retained. Define the dual series by the same weights on rings satisfying 3|tr(t) for every t. ST supplies the actual isomorphism classes, discriminants, trace and automorphism groups; Layer 5 owns the analytic series.

The proof proceeds as follows. Group the ST isomorphism classes by absolute discriminant norm, summing inverse stabilizer orders. Preserve the archimedean signature and the trace-divisible dual subset. Use absolute convergence only on Res>1 and distinguish the analytic continuation.

The required interface consists of the following operations and identities.

- `TauCeti.SeveralVariableZeta.CubicShintani.coefficient`: The coefficient at m is the sum of reciprocal automorphism orders for signature α and discriminant norm m.
- `TauCeti.SeveralVariableZeta.CubicShintani.series`: The weighted series ξF,α on Res>1.
- `TauCeti.SeveralVariableZeta.CubicShintani.dual`: The trace-divisible subseries.
- `TauCeti.SeveralVariableZeta.CubicShintani.dual_le`: For real σ>1, 0≤ξhatF,α(σ)≤ξF,α(σ).

**Checks.**

- The contribution of O_F³ is weighted by1/6, not1.
- O_F[ε]/ε³ has zero discriminant and contributes no term.
- A ring violating 3|tr(t) is omitted by the dual selector, while its ordinary coefficient is unchanged.

The result must also satisfy these compatibility requirements: For a number field F and each archimedean cubic signature α, let ξF,α(s)=ΣR |Aut R|^(−1)|Disc R|^(−s), over isomorphism classes of locally free rank-three O_F-algebras with nonzero discriminant and signature α. Reducible rings and nonmaximal orders are retained. Define the dual series by the same weights on rings satisfying 3|tr(t) for every t. ST supplies the actual isomorphism classes, discriminants, trace and automorphism groups; Layer 5 owns the analytic series.

See [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712), §3.2 definition before Proposition 3.7 and dual definition in (3), p.12.

*Needs:* ArithmeticStatistics ST.0; ArithmeticStatistics ST.1; [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); `LSeries`.

<a id="local-density-and-coefficient-conventions-agree-local-density-coefficient-comparison"></a>

### 5.6 Local density and coefficient conventions agree

For a nonarchimedean characteristic-zero local field with residue size q, additive dx normalized by dx(O⁴)=1 and dg normalized by dg(GL2(O))=1, an open orbit α with representative xα, Δ=P(xα) and stabilizer order oα satisfies ∫α Φ(x)|P(x)|^(s−1)dx = (1−q^(−1))(1−q^(−2)) |Δ|^s/oα · ∫GL2(F) |det g|^(2s)Φ(g·xα)dg, whenever either integral is absolutely convergent. The stabilizer orders are 6,2,3,1 for split, quadratic, cyclic cubic, and non-Galois cubic types. Local additive mass is not itself a global arithmetic count.

The proof proceeds as follows. Match the discriminant invariant before specializing motivic/local functions. Use the measure dx(O_F^4)=1 to identify shell masses. Record the orbit-dependent local normalizing constants and small-residue-characteristic cases as the next original-source leaves.

The result must also satisfy these compatibility requirements: For a compact-open integral local condition U, the normalized binary-cubic Haar integral uses shell masses dk(U); its arithmetic coefficient condition is the ST-local orbit selector with the same discriminant valuation and inverse stabilizer convention. LD.3 specialization is invoked only for its proved residue-characteristic range; factors at2 and3 are kept separately.

See [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Proposition 2.2 and (2.4), pp.36–38.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.0; AdelicAlgebraicGroups AA.2; ArithmeticStatistics ST.1; [Self-dual versus integral-normalized measures](#proof-local-measure-normalization); [Binary cubic orbital Jacobian](#proof-local-orbit-jacobian).

<a id="proof-local-measure-normalization"></a>

**Self-dual versus integral-normalized measures.** For the alternating binary-cubic pairing [x,y]=x1y4−x2y3/3+x3y2/3−x4y1, self-dual dx=|3|^(−1)∏dxj. If each coordinate self-dual measure gives O mass q^(−e/2), then dx(O⁴)=|3|^(−1)q^(−2e). With dg(GL2(O))=1, bF=|3|^(−1)q^(−2e)(1−q^(−1))(1−q^(−2)). Dividing by dx(O⁴) yields the integral-normalized constant; at residue characteristic 3 the |3| factor cannot be discarded before this conversion.

Compute the determinant of the alternating pairing relative to the coordinate self-dual measure. The two 1/3 entries contribute the factor |3|^(-1). Multiply four coordinate lattice masses and then the normalized GL2 integral factor, retaining the different exponent.

See [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), (2.1)–(2.4), pp.37–38.

<a id="proof-local-orbit-jacobian"></a>

**Binary cubic orbital Jacobian.** For an open orbit α and representative xα, the map g↦g·xα has covering degree oα. Its measure change satisfies dx/|P(x)|=bF dg along each sheet, with bF as in the local measure normalization. Consequently ∫αΦ dx=bF|P(xα)|/oα ∫G|det g|²Φ(g·xα)dg.

Differentiate the orbit map in four GL2 matrix coordinates and use its discriminant Jacobian. Account for the finite stabilizer covering, then evaluate the remaining Haar scalar on the Iwasawa normalization.

See [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), (2.4), p.38.

<a id="the-selected-adelic-binary-cubic-zeta-integral-cubic-adelic-zeta"></a>

### 5.7 The selected adelic binary-cubic zeta integral

With the ST binary-cubic representation and AA.2 quotient Haar measure, define Z(Φ,s)=∫GL2(A_F)/GL2(F) |det g|^(2s) Σx∈V(F),Disc x≠0 Φ(g·x) dg. Use the twisted action (g·f)(u,v)=det(g)^(−1)f((u,v)g), so Disc(g·f)=det(g)² Disc f. Fix local measures and the dual pairing before invoking Poisson. Its decomposition into signature-weighted ξF,α times local zeta factors is a separate comparison with its exact arithmetic adapter request. The theta sum is invariant under g↦gh for h∈GL2(F), by rational reindexing and the product formula. Transport AA.2 left-quotient measure by inversion; a left-quotient formulation instead uses Φ(g⁻¹·x) and |det g|^(−2s).

The proof proceeds as follows. Import the twisted action and discriminant covariance from ST. Prove right GL2(F)-invariance of the theta sum; the product formula makes |det h|_A=1. Transport the AA.2 left-quotient measure through inversion before forming the right-quotient integral. Prove convergence and orbit unfolding with exact local factors; those original-source leaves are recorded below.

The required interface consists of the following operations and identities.

- `TauCeti.SeveralVariableZeta.CubicAdelic.integral`: Integrate the supplied descended theta function against the supplied right-quotient measure with determinant exponent 2s. The requested ST.1, AL.0 and AA.2 extensions must certify the canonical GL2 adelic quotient adapter.
- `TauCeti.SeveralVariableZeta.CubicAdelic.linear`: Z(aΦ+bΨ,s)=aZ(Φ,s)+bZ(Ψ,s) when the summands are integrable.
- `TauCeti.SeveralVariableZeta.CubicAdelic.theta_right_invariant`: A supplied equivalence reindexing the rational nonsingular theta summands proves invariance under rational right translation. The canonical adapter separately uses the product formula for the determinant norm.
- `TauCeti.SeveralVariableZeta.CubicAdelic.inversion_kernel`: For positive determinant norm d with d(g⁻¹)=d(g)⁻¹, the inverted kernel is d(g)^(−2s)·theta(g⁻¹). Transporting the quotient measure by inversion changes the right-quotient convention to the left-quotient convention.

**Checks.**

- Z(0,s)=0.
- With a unit quotient carrier, Dirac measure, determinant norm 2 and theta value 3, the actual integral is 3·2^(2s). The source adapter separately certifies Disc(gx)=det(g)^2 Disc(x).
- Degenerate binary cubics are excluded from the theta sum and return only as separately analyzed singular terms after Poisson.
- Right rational translation leaves the theta integrand unchanged; inversion transports it to the left quotient with inverse action and determinant exponent −2s.

The result must also satisfy these compatibility requirements: With the ST binary-cubic representation and AA.2 quotient Haar measure, define Z(Φ,s)=∫GL2(A_F)/GL2(F) |det g|^(2s) Σx∈V(F),Disc x≠0 Φ(g·x) dg. Use the twisted action (g·f)(u,v)=det(g)^(−1)f((u,v)g), so Disc(g·f)=det(g)² Disc f. Fix local measures and the dual pairing before invoking Poisson. Its decomposition into signature-weighted ξF,α times local zeta factors is a separate comparison and original-source gap. The theta sum is invariant under g↦gh for h∈GL2(F), by rational reindexing and the product formula. Transport AA.2 left-quotient measure by inversion; a left-quotient formulation instead uses Φ(g⁻¹·x) and |det g|^(−2s).

See [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712), §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14; [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), §2, p.511; §3, pp.515–516; definition before Theorem 4.1, p.516.

*Needs:* ArithmeticStatistics ST.1; AutomorphicLFunctionsAndLocalFactors AL.0; AdelicAlgebraicGroups AA.2.

<a id="ordinary-cubic-continuation-data-cubic-continuation-data"></a>

### 5.8 Ordinary cubic continuation data

For an ordinary cubic series ξ initially defined on Res>1, continuation data consists of a meromorphic function agreeing with ξ there and an entire function C such that C(s)=(s−1)(s−5/6)ξcontinued(s) off the two poles. C(1) and C(5/6) determine the residues as 6C(1) and −6C(5/6). Existence and the order-one growth bound remain the separate original global theorems; the data constructor does not prove them.

The proof proceeds as follows. Use a meromorphic continuation and analytic pole clearance as actual function data with agreement on Re s>1 and off the poles. The values at the two removed poles give the residue limits after division by the other linear factor. The rational two-pole benchmark checks both signs.

The required interface consists of the following operations and identities.

- `TauCeti.SeveralVariableZeta.CubicContinuation.clear_spec`: The actual entire clear function agrees with the pole-cleared continued series away from 1 and 5/6.
- `TauCeti.SeveralVariableZeta.CubicContinuation.residue_one`: (s−1)ξcontinued(s) tends to 6C(1) at 1.
- `TauCeti.SeveralVariableZeta.CubicContinuation.residue_five_sixths`: (s−5/6)ξcontinued(s) tends to −6C(5/6) at 5/6.

**Checks.**

- For ξ=R/(s−1)+T/(s−5/6), its benchmark clearance at 1 is R/6.
- The benchmark clearance at 5/6 is −T/6.
- Off both poles the benchmark clearance equals (s−1)(s−5/6) times the rational series.

See [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 6.2(i)–(ii), p.71; analytic output interface refined here.

*Needs:* `MeromorphicOn`; `AnalyticOnNhd`.

<a id="orders-in-a-fixed-tale-cubic-algebra-cubic-orders-generating-series"></a>

### 5.9 Orders in a fixed étale cubic algebra

For an étale cubic F-algebra A, let an(A) count O_F-orders in O_A of relative index norm n. Then Σn≥1 an(A)n^(−2s)=ζF(4s)ζF(6s−1)ζA(2s)/ζA(4s) in a right half-plane. The exponent2s encodes discriminant multiplication by index².

The proof proceeds as follows. Use the local order enumeration supplied by Datskovsky–Wright Theorem6.1. Multiply local factors in their common convergence domain. Retain the index-squared exponent; converting to an index Dirichlet variable requires substituting s/2.

The result must also satisfy these compatibility requirements: For an étale cubic F-algebra A, let an(A) count O_F-orders in O_A of relative index norm n. Then Σn≥1 an(A)n^(−2s)=ζF(4s)ζF(6s−1)ζA(2s)/ζA(4s) in a right half-plane. The exponent2s encodes discriminant multiplication by index².

See [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712), §3.2 Lemma 3.9, p.13; explicitly cites DW86 Theorem 6.1; [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 6.1 and proof, p.68; relation (6.4), p.69.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.0; AdelicAlgebraicGroups AA.2; ArithmeticStatistics ST.1; [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); [Self-dual versus integral-normalized measures](#proof-local-measure-normalization); [Binary cubic orbital Jacobian](#proof-local-orbit-jacobian); [Split local factor](#proof-local-split-orbit-factor); [Unramified quadratic local factor](#proof-local-unramified-quadratic-factor); [Ramified quadratic local factor](#proof-local-ramified-quadratic-factor); [Unramified cubic local factor](#proof-local-unramified-cubic-factor); [Ramified cubic local factor](#proof-local-ramified-cubic-factor); [Five local orbital Euler factors](#proof-local-orbital-euler-factor).

<a id="proof-local-split-orbit-factor"></a>

**Split local factor.** For DW standard Φ1 and u=ω(π), the split auxiliary integral Iα(ω,Φ1)=(1+u)^2/(1−u). Its four disjoint valuation regions have masses 1/(1−u),u²/(1−u),u/(1−u),u/(1−u).

Divide the support of the auxiliary orbital integral into the four valuation regions of DW. Sum the two linear contributions and the constant and quadratic contributions against the geometric tail. Their numerator is (1+u)^2.

See [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 3.1 proof, pp.43–44.

<a id="proof-local-unramified-quadratic-factor"></a>

**Unramified quadratic local factor.** The standard quadratic auxiliary integral is (1+u²)/(1−u): its two regions have t unit or valuation one, with integral basis coordinates for the unramified quadratic extension.

Use an integral basis of the unramified quadratic extension to separate the unit and valuation-one support pieces. Their norm valuations contribute 1 and u^2, with a common geometric tail 1/(1-u).

See [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 3.1 proof, p.44.

<a id="proof-local-ramified-quadratic-factor"></a>

**Ramified quadratic local factor.** The ramified quadratic auxiliary integral is (1+u)/(1−u). In an integral basis 1,θ with θ a uniformizer, the field norm valuation gives the two disjoint support regions used in the integral. This formulation does not require residue characteristic odd.

Choose the uniformizer integral basis and distinguish the two support regions by its norm valuation. Their contributions are 1 and u over the common tail. The discriminant Jacobian stays outside this calculation, so residue characteristic two is retained.

See [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 3.1 proof, p.44.

<a id="proof-local-unramified-cubic-factor"></a>

**Unramified cubic local factor.** The unramified cubic auxiliary integral is (1+u²+u⁴)/(1−u³)=(1−u+u²)/(1−u), from three valuation regions t of orders 0,1,2. The numerator records all three regions rather than an unjustified geometric shell law.

The integral basis splits support according to three successive uniformizer valuations. Sum the contributions 1,u^2,u^4 against the step-three tail. Multiply the two rational expressions by their denominators to prove the simplification.

See [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 3.1 proof, p.45.

<a id="proof-local-ramified-cubic-factor"></a>

**Ramified cubic local factor.** For a ramified cubic extension with integral generator θ a uniformizer, the three support regions give (1+u+u²)/(1−u³)=1/(1−u). Norm(θ) is a uniformizer in the base field, so this valuation computation retains wild discriminant factors in the separate orbital Jacobian.

Use the cubic uniformizer integral basis; its field norm has valuation one. The three support pieces contribute 1,u,u^2 against the step-three tail, which simplifies to 1/(1-u). Keep the wild discriminant in the preceding Jacobian.

See [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 3.1 proof, p.45.

<a id="proof-local-orbital-euler-factor"></a>

**Five local orbital Euler factors.** For Φ0=1_(O⁴), an unramified quasicharacter ω and a DW standard representative, put u=ω(π). Then Zα(ω,Φ0)=ηα(u)/[(1−qu³)(1−u²)], with η=(1+u)²,1+u²,1+u,1−u+u²,1 for types split, unramified quadratic, ramified quadratic, unramified cubic, ramified cubic respectively. A ramified ω gives zero. Characteristic zero permits residue characteristics 2 and 3; their discriminant and self-dual-measure factors remain in the preceding normalization.

Use the shell-removal differential identity and its integral evaluation from Propositions 3.1–3.2, pp.39–41: Z(Φ0)=(1−u)/[(1−qu³)(1−u²)] I(Φ1). Insert the five auxiliary factors, one declaration per orbit type. Compact determinant-character integration gives zero for ramified ω.

See [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 3.1, p.42; Euler-product comparison Theorem 6.1, p.68.

<a id="the-selected-quadratic-double-dirichlet-series-quadratic-double-series"></a>

### 5.10 The selected quadratic double Dirichlet series

For odd d>0 put χd(n)=(d/n) on odd n, retaining square factors of d. Let L2(s,χdψ)=Σn positive odd χd(n)ψ(n)n^(−s), ζ2(s)=(1−2^(−s))ζ(s), and Z(s,w;ψ,ψ′)=ζ2(2s+2w−1)Σd positive odd L2(s,χdψ)ψ′(d)d^(−w). These are series on their stated convergence regions; their analytic continuations are separate functions. Row indices are (ψ,ψ′), with ψ′ varying fastest.

The proof proceeds as follows. Build odd coefficient sequences with zero at0 and use the LSeries convention. Use the outer odd-d series only after absolute convergence is proved. Keep the factor at2 deleted in both L2 and ζ2; continuation agrees on the convergence tube.

The required interface consists of the following operations and identities.

- `TauCeti.SeveralVariableZeta.DoubleSeries.oddZeta`: ζ2(s)=(1−2^(−s))ζ(s).
- `TauCeti.SeveralVariableZeta.DoubleSeries.oddL`: The LSeries of the odd Jacobi-symbol coefficients χdψ.
- `TauCeti.SeveralVariableZeta.DoubleSeries.series`: The displayed double series.
- `TauCeti.SeveralVariableZeta.DoubleSeries.continued`: The meromorphic continuation selected by Lemma2; agree with series for Res,Rew>1.

**Checks.**

- For Res>1, ζ2(s)=Σn positive odd n^(−s).
- χ9(3)=0 although the squarefree-part character χ1(3)=1; square factors must not be erased.
- The d=1 coefficient is L2(s,ψ); the ζ2 correction remains outside the d sum.

The result must also satisfy these compatibility requirements: For odd d>0 put χd(n)=(d/n) on odd n, retaining square factors of d. Let L2(s,χdψ)=Σn positive odd χd(n)ψ(n)n^(−s), ζ2(s)=(1−2^(−s))ζ(s), and Z(s,w;ψ,ψ′)=ζ2(2s+2w−1)Σd positive odd L2(s,χdψ)ψ′(d)d^(−w). These are series on their stated convergence regions; their analytic continuations are separate functions. Row indices are (ψ,ψ′), with ψ′ varying fastest.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Introduction, equation (1), p.356; §3 equation (29), p.362.

*Needs:* [The four real characters modulo eight](#the-four-real-characters-modulo-eight-characters-mod-eight); `jacobiSym`; `LSeries`; `riemannZeta`.

<a id="quadratic-reciprocity-matrix-double-functional-system"></a>

### 5.11 Quadratic reciprocity matrix

Define the 16×16 matrix A indexed by (ψ,ψ′),(ρ,ρ′) by A=1/16 Ση,ν∈{1,3,5,7} ψ(ν)ψ′(η)ρ(η)ρ′(ν)(−1)^(((η−1)/2)((ν−1)/2)). This is the odd Jacobi reciprocity transform. The affine transformations and the Gamma reflection matrix are separate constructions.

The proof proceeds as follows. Use the odd Jacobi reciprocity sign to interchange n and d in the absolutely convergent double sum. Insert finite character projections for the two residues modulo 8 to obtain the displayed matrix.

The required interface consists of the following operations and identities.

- `TauCeti.SeveralVariableZeta.FunctionalSystem.A_entry`: A has the displayed finite 16-term entry sum.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.A_involution`: A*A=I16.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.A_symmetric`: A.transpose=A.

**Checks.**

- A²=I16.
- A[(0,0),(0,0)]=1/2.
- A[(0,0),(1,1)]=−1/2.

The result must also satisfy these compatibility requirements: Let α(s,w)=(w,s), β(s,w)=(1−s,s+w−1/2). Set Hψ,η=ψ(η), H Hᵀ=4I. The reciprocity matrix has entry A(ψ,ψ′;ρ,ρ′)=1/16 Ση,ν∈{1,3,5,7} ψ(ν)ψ′(η)ρ(η)ρ′(ν)(−1)^(((η−1)/2)((ν−1)/2)). For fixed ψ put qψ,η=8 for ψ2,ψ−2; q=1 for ψ1,η≡1mod4 or ψ−1,η≡3mod4, and q=4 otherwise. Let κψ=0,1,0,1; let eψ,η=0 if q≠1 and otherwise be +1 for η=1,7 and −1 for η=3,5. Define rψ,η(s)=(q/π)^(1/2−s) Γ((1−s+κ)/2)/Γ((s+κ)/2) × (1−e·2^(−s))/(1−e·2^(s−1)). Then B(s) is block diagonal with ψ-block H diag(rψ,η(s)) Hᵀ/4. Quotients here are meromorphic germs, with removable singularities filled when proved, rather than values obtained by dividing by zero.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 (31)–(35), pp.362–363; corrected conductor convention the normalization convention.

*Needs:* [The four real characters modulo eight](#the-four-real-characters-modulo-eight-characters-mod-eight); `jacobiSym.quadratic_reciprocity`; [Mod-eight character matrix orthogonality](#proof-characters-hadamard-orthogonality).

<a id="proof-characters-hadamard-orthogonality"></a>

**Mod-eight character matrix orthogonality.** For H_i,a=ψi(2a+1), i,a∈{0,1,2,3}, H Hᵀ=HᵀH=4I. Thus Hᵀ/4 gives the exact inverse between twist coordinates and residue coordinates.

Write the four character rows on the four odd residues. Distinct rows have dot product zero and each squared norm is four. The same calculation on columns proves the inverse matrix formula.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Proof of Lemma 2, character projections in (31)–(35), pp.362–363.

<a id="primitive-quadratic-twist-data-double-primitive-twist-data"></a>

### 5.12 Primitive quadratic twist data

For i=0,1,2,3 corresponding to ψ1,ψ−1,ψ2,ψ−2 and η=1,3,5,7, define q=8 for i≥2, q=1 for (i=0,η≡1mod4) or (i=1,η≡3mod4), and q=4 otherwise. Define κ=0,1,0,1. The removed Euler value e is zero unless q=1; then e=+1 for η=1,7 and e=−1 for η=3,5. These are the conductor factor, parity and value at 2 of the primitive quadratic character.

The proof proceeds as follows. Compute the signed fundamental discriminant for the four twists and each odd residue class. Its power of two gives q, its sign gives parity, and its value at 2 gives the displayed deleted factor. Record the conductor-one cases separately.

The required interface consists of the following operations and identities.

- `TauCeti.SeveralVariableZeta.FunctionalSystem.q`: The factor multiplying odd squarefree d in the primitive conductor.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.parity`: κi=0,1,0,1.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.twoValue`: Value at 2, zero when q≠1.

**Checks.**

- q(0,η=1)=1; q(0,η=3)=4.
- q(2,η)=q(3,η)=8 and their parities are respectively 0 and 1.
- e(0,η=1)=1; e(1,η=3)=−1; e(2,η)=0.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, (7)–(13), pp.358–359; (32)–(33), p.363.

*Needs:* [The four real characters modulo eight](#the-four-real-characters-modulo-eight-characters-mod-eight); `DirichletCharacter`.

<a id="imprimitive-odd-quadratic-twist-quadratic-twist-character"></a>

### 5.13 Imprimitive odd quadratic twist

For a positive odd integer d and twist i, define the Dirichlet character of modulus 8d with natural-integer coefficient χi,d(n)=(d/n)ψi(n) for odd n and zero for even n. This character retains all deleted square-factor Euler factors. Its primitive conductor is identified by quadratic-primitive-adapter, not assumed to be 8d.

The proof proceeds as follows. Use Jacobi periodicity and multiplicativity on units modulo 8d, extend by zero off units, and check its coefficient equals the prescribed odd symbol.

The required interface consists of the following operations and identities.

- `TauCeti.SeveralVariableZeta.quadraticTwist.value`: Evaluation at a natural integer is the displayed odd Jacobi coefficient.
- `TauCeti.SeveralVariableZeta.quadraticTwist.series_agrees`: Its Mathlib LFunction agrees with the odd Jacobi LSeries on Re s>1.
- `TauCeti.SeveralVariableZeta.quadraticTwist.real_values`: Every value is −1,0 or 1.

**Checks.**

- For d=1,i=ψ1, every odd coefficient equals 1.
- For d=9,i=ψ1, the value at 3 is zero.
- For d=1,i=ψ2, the value at 3 is −1.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, definitions before (7) and formulas (7)–(13), pp.358–359.

*Needs:* [The four real characters modulo eight](#the-four-real-characters-modulo-eight-characters-mod-eight); `DirichletCharacter`; `jacobiSym`.

<a id="iterated-continuation-tubes-double-iterated-tube-bases"></a>

### 5.14 Iterated continuation tubes

Define B0={(x,y):y>1,x+y>3/2}. Recursively B(k+1)=Bk∪ak(Bk), where ak(x,y)=(y,x) for even k and ak(x,y)=(1−x,x+y−1/2) for odd k. Thus B0,..,B5 are the real bases R1,..,R6; their complex tubes allow arbitrary imaginary coordinates.

The proof proceeds as follows. Use the two affine involutions to transport the preceding open base and take its union with that base.

The required interface consists of the following operations and identities.

- `TauCeti.SeveralVariableZeta.Tubes.base_zero`: Membership in B0 is y>1 and x+y>3/2.
- `TauCeti.SeveralVariableZeta.Tubes.base_step`: Bk+1 is the stated union with the alternating affine image.
- `TauCeti.SeveralVariableZeta.Tubes.base_mono`: Bk is contained in Bk+1; every Bk is open.

**Checks.**

- (2,2) is in B0.
- (−2,−2) is in B4 but not B3.
- (0,0) is not in B5.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 proof, pp.363–364.

*Needs:* [Swap of double-series variables](#swap-of-double-series-variables-double-affine-swap); [Quadratic reflection of double-series variables](#quadratic-reflection-of-double-series-variables-double-affine-reflection).

<a id="the-binary-cubic-archimedean-functional-equation-matrix-cubic-archimedean-matrix"></a>

### 5.15 The binary-cubic archimedean functional-equation matrix

At a real place use row/column signatures F_v³ and F_v×C, with c11=c22=(1/2)sin(2πs), c12=(3/2)sin(πs), c21=(1/2)sin(πs). At a complex place the single coefficient is sin²(πs)sin(πs−π/6)sin(πs+π/6). Define cαβ(s) as the product over archimedean places. The degree is n=r1+2r2, not the number of places.

The proof proceeds as follows. Use the real two-by-two table in Proposition3.7. Use its complex scalar and tensor all archimedean local factors. Track the cubic-signature order in each coordinate.

The required interface consists of the following operations and identities.

- `TauCeti.SeveralVariableZeta.ArchMatrix.realEntry`: The specified real two-by-two sine matrix.
- `TauCeti.SeveralVariableZeta.ArchMatrix.complexEntry`: The specified complex-place sine product.
- `TauCeti.SeveralVariableZeta.ArchMatrix.entry`: Product of the archimedean entries for signatures α,β.

**Checks.**

- Each real entry vanishes at s=1.
- The complex entry vanishes to order2 at s=1.
- Every global entry vanishes to order at least r1+2r2 at s=1.

The result must also satisfy these compatibility requirements: At a real place use row/column signatures F_v³ and F_v×C, with c11=c22=(1/2)sin(2πs), c12=(3/2)sin(πs), c21=(1/2)sin(πs). At a complex place the single coefficient is sin²(πs)sin(πs−π/6)sin(πs+π/6). Define cαβ(s) as the product over archimedean places. The degree is n=r1+2r2, not the number of places.

See [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712), §3.2 equation (3.1) and preceding complex/diagonal cases, p.12.

*Needs:* `Complex.cpow`; [Signature-refined cubic Shintani zeta functions](#signature-refined-cubic-shintani-zeta-functions-cubic-shintani-series).

<a id="from-arithmetic-cubic-orbits-to-analytic-coefficients-cubic-orbit-to-coefficient"></a>

### 5.16 From arithmetic cubic orbits to analytic coefficients

ST.1 Delone–Faddeev and stabilizer identifications transport the inverse-automorphism-weighted cubic-ring count to binary-cubic orbit coefficients, preserving discriminant, signature and the trace-divisible dual lattice. Over general O_F, nonprincipal locally free modules are included by the full adelic orbit interface.

The proof proceeds as follows. Use the orbit bijection only over the base rings for which ST has proved it. Match the inverse stabilizer factors and discriminants exactly. Request the general-number-field adelic extension rather than treating all rank-three modules as free.

The result must also satisfy these compatibility requirements: ST.1 Delone–Faddeev and stabilizer identifications transport the inverse-automorphism-weighted cubic-ring count to binary-cubic orbit coefficients, preserving discriminant, signature and the trace-divisible dual lattice. Over general O_F, nonprincipal locally free modules are included by the full adelic orbit interface.

See [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712), §3.2, Proposition 3.7 and Lemmas 3.8–3.11, pp.11–14.

*Needs:* [Signature-refined cubic Shintani zeta functions](#signature-refined-cubic-shintani-zeta-functions-cubic-shintani-series); ArithmeticStatistics ST.1 — delone-faddeev-parametrization-of-cubic-rings; ArithmeticStatistics ST.1 — automorphisms-of-cubic-rings-are-stabilizers.

<a id="the-two-cubic-poles-and-their-residues-cubic-residues-and-entire-clearance"></a>

### 5.17 The two cubic poles and their residues

For each signature α, there is an entire function CF,α agreeing off the poles with (s−1)(s−5/6)ξF,α(s); it is entire of order at most 1. The two residues are specified in separate declarations. An entire cleared function retains nonzero pole limits instead of assigning totalized product values at those points.

The proof proceeds as follows. Separate the two singular-orbit contributions in the global zeta argument. Match their normalizations with AF and BF in Proposition3.7. Remove both possible simple poles and retain the order-one growth input from Wright.

The result must also satisfy these compatibility requirements: Let ρF=Res_s=1 ζF(s), rα the number of split real cubic factors, n=r1+2r2. Set AF=ζF(2)ρF/2^(r1+r2+1), BF=3^(r1+r2/2)ζF(1/3)ρF/[6·2^(r1+r2)D^(1/2)]·[Γ(1/3)^3/(2π)]^n. ξF,α has at most simple poles1 and5/6, with residues AF(1+3^(−rα−r2)) and BF 3^(−rα/2). Its product with (s−1)(s−5/6) is entire of order1.

See [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 6.2(ii), p.71; LOWW Proposition 3.7(5), p.13.

*Needs:* [The selected adelic binary-cubic zeta integral](#the-selected-adelic-binary-cubic-zeta-integral-cubic-adelic-zeta); ArithmeticStatistics ST.1; AutomorphicLFunctionsAndLocalFactors AL.0; AdelicAlgebraicGroups AA.2; [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); AutomorphicSpectralTheory AS.2 — eisenstein-continuation; [Ordinary cubic continuation data](#ordinary-cubic-continuation-data-cubic-continuation-data); [Uniform Stirling bounds for Γ on vertical strips](#uniform-stirling-bounds-for-on-vertical-strips-uniform-complex-stirling); [Self-dual versus integral-normalized measures](#proof-local-measure-normalization); [Binary cubic orbital Jacobian](#proof-local-orbit-jacobian); [Adelic binary cubic convergence](#proof-cubic-adelic-convergence); [Adelic orbital unfolding](#proof-cubic-adelic-unfolding); [All class-group components in unfolding](#proof-cubic-class-group-components); [Split local factor](#proof-local-split-orbit-factor); [Unramified quadratic local factor](#proof-local-unramified-quadratic-factor); [Ramified quadratic local factor](#proof-local-ramified-quadratic-factor); [Unramified cubic local factor](#proof-local-unramified-cubic-factor); [Ramified cubic local factor](#proof-local-ramified-cubic-factor); [Five local orbital Euler factors](#proof-local-orbital-euler-factor); [Entire truncated cubic integral](#proof-cubic-truncated-entire); [Poisson decomposition of the global integral](#proof-cubic-poisson-decomposition); [Rank-one smoothing extracts the quotient integral](#proof-cubic-smoothing-residue); [Zero-orbit contribution](#proof-cubic-zero-singular-term); [Compact averaging and Fourier](#proof-cubic-compact-average-laws); [Singular distributions from Tate integrals](#proof-cubic-singular-tate-restrictions); [Unfold the triple-root orbit](#proof-cubic-triple-root-unfolding); [Triple-root contour residues](#proof-cubic-triple-root-residue); [Unfold the double-root orbit](#proof-cubic-double-root-unfolding); [Double-root contour residues](#proof-cubic-double-root-residue); [Cancel the extra smoothing poles](#proof-cubic-singular-cancellation); [Integrate the singular radial powers](#proof-cubic-singular-rational-term); [Adelic cubic continuation and equation](#proof-cubic-adelic-meromorphic-equation); [Fourier transform of the integral lattice](#proof-local-finite-fourier-dual); [Cubic meromorphic continuation](#proof-cubic-meromorphic-continuation); [Order-one bound for cubic clearance](#proof-cubic-entire-order-bound); [Cubic residue at one](#proof-cubic-residue-one); [Cubic secondary residue](#proof-cubic-residue-five-sixths).

<a id="proof-cubic-adelic-convergence"></a>

**Adelic binary cubic convergence.** For Res>1, the right-quotient binary-cubic integral converges absolutely and locally uniformly in s and is a tempered distribution in Φ. Wright uses exponent |det|^u with Reu>2; here u=2s.

Use the compact-times-Siegel-set majorant of Lemma 3.1, p.515. Cover nonsingular rational forms by x1≠0 or x2≠0; apply the Schwartz lattice-sum bound of Lemma 1.1. Integrate its explicit torus majorant for exponent σ>2 with decay parameter α>2nσ.

See [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Theorem 4.1 and proof, pp.516–517.

<a id="proof-cubic-adelic-unfolding"></a>

**Adelic orbital unfolding.** For Res>1 and a Schwartz–Bruhat Φ, Z(Φ,s)=Σ[x]∈GL2(F)\V(F)^ns |Stab(x)|^(−1)∫GL2(A_F)|det g|^(2s)Φ(g·x)dg. All rearrangements are justified by absolute convergence. Integral lattice restrictions require all class-group components, as the S-integral comparison shows.

Partition nonsingular rational forms by rational GL2 orbits. Absolute convergence permits exchanging the orbit sum and quotient integral. Lift each orbit integral to GL2(A) and divide by its finite stabilizer; the lattice comparison must sum all ideal-class components.

See [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Theorem 4.1 and Proposition 4.1, pp.516–518.

<a id="proof-cubic-class-group-components"></a>

**All class-group components in unfolding.** The S-integral adelic zeta decomposes over the full double quotient G(A_S)\G(A)/G(F), not just the identity lattice. Each component uses its associated rank-two lattice, binary-cubic lattice and arithmetic stabilizer. This is the analytic interface needed for the ST extension to nonprincipal locally free modules.

Choose double-quotient representatives and transport the rational-orbit sum into each lattice. Unfold each component with its own stabilizer. The missing general-ring parametrization remains an ST request.

See [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Proposition 4.2, p.519; DW (6.8), p.73.

<a id="proof-cubic-truncated-entire"></a>

**Entire truncated cubic integral.** Restrict the right-quotient integral to |det g|≥1. The resulting Z+(Φ,u), with exponent u, is entire and a tempered distribution in Φ. On every compact u set its derivatives are dominated by the Siegel-set Schwartz majorant; u=2s is the arithmetic convention.

On the truncated determinant range choose a common Schwartz-decay exponent for the compact parameter set. The convergence proof majorant absorbs log powers from u derivatives. Parameter integration gives entireness; its seminorm bound gives continuity in Φ.

See [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Proposition 6.1 and proof, p.523.

<a id="proof-cubic-poisson-decomposition"></a>

**Poisson decomposition of the global integral.** On Reu>2, additive Poisson on F^4 gives Z(Φ,u)=Z+(Φ,u)+Z+(Fourier Φ,2−u)+I(Φ,u), where I is the integral over |det|≤1 of the Fourier-transformed singular theta sum minus the original singular theta sum, including the determinant Jacobian |det|^(−2). The singular locus has exactly zero, triple-root and double-root rational orbits.

Apply Poisson to the full lattice sum, subtract the singular terms, and split at |det|=1. Invert g in the small-determinant integral and use the paired contragredient action. All sums and integrals are absolutely convergent on the initial right domain.

See [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Proposition 6.2, p.523.

<a id="proof-cubic-smoothing-residue"></a>

**Rank-one smoothing extracts the quotient integral.** For rapidly vertically decreasing entire ψ with ψ(2)≠0, smooth the rank-one GL2 Eisenstein series by integral_Rez=x0 ψ(z)E(z,g)/(w−z) dz/(2πi). For quotient-integrable F dominated by C t(g)^c with c<2, (w−2) integral F(g)ℰ(ψ,w,g)dg tends as w decreases to 2 to ρ0ψ(2) integral F(g)dg. Here E has constant term t^(z/2)+t^((2−z)/2)φ_F(z), φ_F(z)=Z_F(z−1)/Z_F(z), and ρ0=Res Z_F(1)/Z_F(2).

The AS rank-one specialization must supply the displayed constant term, residue and nonconstant Fourier bound of Lemma 6.3. Shift the smoothing contour across z=2; the residue is the constant ρ0ψ(2)/(w−2). Use its uniform weighted majorant for dominated convergence.

See [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Lemmas 6.1, 6.3, 6.5–6.6, pp.524–527.

<a id="proof-cubic-zero-singular-term"></a>

**Zero-orbit contribution.** On the determinant-one quotient the smoothed singular zero contribution is I0(Φ;ψ,w)=ψ(2)Φ(0)/(w−2) for the principal character. For a nontrivial unitary character of determinant-one ideles it vanishes.

The zero theta term is constant on the quotient. Integrate the smoothed Eisenstein constant term using its residue normalization. A nontrivial unitary determinant character integrates to zero by character orthogonality.

See [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Proposition 6.3, p.528.

<a id="proof-cubic-compact-average-laws"></a>

**Compact averaging and Fourier.** For normalized Haar on the maximal compact U_A put MωΦ(x)=integral_U ω(det k)Φ(k·x)dk. This is again Schwartz–Bruhat, satisfies Mω²=Mω, transforms under k by ω(det k)^(−1), and Fourier(MωΦ)=M_(ω~ inverse)(Fourier Φ). Here ω~ is the unitary component of ω, not complex conjugation of an arbitrary power.

Compactness permits the parameter integral in each Schwartz seminorm. Change k to kh in normalized Haar for equivariance and idempotence. The determinant Jacobian is 1 on U_A; the contragredient action and Fourier change of variables give the last identity.

See [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Lemma 5.1, p.521.

<a id="proof-cubic-singular-tate-restrictions"></a>

**Singular distributions from Tate integrals.** T1Φ(t)=Φ(0,0,0,t), T2Φ(t)=integral_A Φ(0,0,t,u)du are Schwartz–Bruhat functions. Their Tate zeta integrals converge normally for Re z>1, continue with simple poles at 0,1, and have residues −Φ(0), integral Φ(0,0,0,u)du for T1 and −integral Φ(0,0,0,u)du, integral Φ(0,0,t,u)dtdu for T2. Apply this to MωΦ with twists ω~ inverse and ω~ to obtain Σ1(ω,Φ,z), Σ2(ω,Φ,z). The residue distributions used globally are Σ1 at z=2/3 and Σ2 at z=−1.

Partial evaluation and partial integration preserve the Schwartz class. Use the Tate continuation/residue supplier, rather than a new one-dimensional zeta theory. Fourier inversion on the alternating pairing supplies the two partial-transform identities of Proposition 5.2.

See [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Propositions 5.1–5.3 and Lemma 5.2, pp.520–522.

<a id="proof-cubic-triple-root-unfolding"></a>

**Unfold the triple-root orbit.** The nonzero triple-root locus is parametrized by cosets in GL2(F)/B(F) together with a nonzero scalar α on the line represented by (0,0,0,α). The Borel preserves that line but is not the stabilizer of each fixed nonzero vector. Summing over α makes the expression independent of the coset representatives. On the determinant-one quotient its smoothed integral unfolds to the idele/Tate expression in Σ1(ω,Φ,(z+1)/3) and Σ1(ω,Φ,(3−z)/3), with the factor 1/3 from the cubic torus map. Compact averaging and rational reindexing preserve the chosen measures.

Parametrize triple-root lines by GL2(F)/B(F) and sum all nonzero rational scalars on each line. Borel rescaling permutes this scalar sum; it does not fix each vector. Unfold the rational orbit, telescope the F× sum against the idele quotient and substitute the cubic torus variable. The two Eisenstein constant terms give the two displayed Tate parameters.

See [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Proposition 6.4 and proof, pp.528–530.

<a id="proof-cubic-triple-root-residue"></a>

**Triple-root contour residues.** Modulo a function holomorphic for Rew>1, the principal-character triple-root smoothed term is ρ0ψ(2)Σ1(Φ)/[3(w−2)] + φ_F(3)ψ(3) integral(MΦ)(0,0,0,t)dt/(w−3). The Σ1 symbol denotes the continued Tate restriction at 2/3. Vertical contour bounds are those of the Tate and rank-one smoothing inputs.

Move each Tate-parameter contour into the strip where its only crossed poles are known. Collect the z=2 Eisenstein residue and z=3 Tate residue; retain the cubic Jacobian 1/3.

See [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Proposition 6.4 and proof, pp.528–530.

<a id="proof-cubic-double-root-unfolding"></a>

**Unfold the double-root orbit.** The double-root orbit is represented by (0,0,α,0). After unfolding and a Schwartz lattice majorant, the nonconstant Eisenstein contribution is holomorphic for Rew>1. The remaining two contours have Tate parameters −1−z and z−3, exactly as in the last display of p.531.

Unfold the Borel orbit and its two determinant-one idele variables. Use Lemma 6.3 with decay exponent N>1 and the Schwartz bound with A>N[F:Q] to dominate the nonconstant contribution. Telescope the rational α sum and substitute the remaining additive coordinate.

See [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Proposition 6.5 and proof, pp.530–532.

<a id="proof-cubic-double-root-residue"></a>

**Double-root contour residues.** Modulo a function holomorphic for Rew>1, the principal double-root term is ρ0ψ(2)Σ2(Φ)/(w−2) − φ_F(3)ψ(3)integral(MΦ)(0,0,0,t)dt/(w−3) + φ_F(4)ψ(4)integral(MΦ)(0,0,t,u)dtdu/(w−4). Here Σ2 is evaluated at −1; these three residues use the same normalized measures as the triple-root term.

Shift the two unfolded Tate contours and collect the poles at the displayed parameters. The first residue uses Sigma2(-1); the remaining residues are the one- and two-variable restriction integrals. Preserve the signs from opposite contour shifts and the common compact average.

See [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Proposition 6.5 conclusion, p.532.

<a id="proof-cubic-singular-cancellation"></a>

**Cancel the extra smoothing poles.** Fourier inversion makes the z=3 and z=4 residues cancel in the Fourier-minus-original singular difference. Its determinant-one quotient integral is [Fourier Φ(0)−Φ(0)]/ρ0 + [Σ1(Fourier Φ)−Σ1(Φ)]/3 + Σ2(Fourier Φ)−Σ2(Φ), for the principal character.

Combine the three singular-orbit residue expressions and use the partial Fourier-inversion identities. Apply the smoothing residue limit; the cancelled w=3,4 terms cannot enter the global radial integral.

See [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Propositions 6.6–6.7, p.532.

<a id="proof-cubic-singular-rational-term"></a>

**Integrate the singular radial powers.** For the principal exponent u, I(Φ,u)=−1/2{[Fourier Φ(0)/(2−u)+Φ(0)/u]/ρ0 + [Σ1(Fourier Φ)/(5/3−u)+Σ1(Φ)/(u−1/3)]/3 + Σ2(Fourier Φ)/(2−u)+Σ2(Φ)/u}, as meromorphic germs. The factor 1/2 comes from determinant scaling, and Fourier dilation has the fourth-power Jacobian.

Apply the two dilation homogeneities of Lemma 5.3 to the three summands. Integrate the resulting real powers on (0,1); use analytic continuation for the rational expression.

See [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Lemma 5.3, p.522; Proposition 6.8, p.532.

<a id="proof-cubic-adelic-meromorphic-equation"></a>

**Adelic cubic continuation and equation.** The principal adelic Z(Φ,u) continues with only simple possible poles at u=0,1/3,5/3,2 and obeys Z(Φ,u)=Z(Fourier Φ,2−u). Its residue at 2 is [Fourier Φ(0)/ρ0+Σ2(Fourier Φ)]/2 and its residue at 5/3 is Σ1(Fourier Φ)/6. These are adelic residues in variable u; conversion to s=u/2 divides residues by 2.

The two truncated terms are entire; the rational singular expression lists the poles. Exchange Φ and Fourier Φ and replace u by 2−u; Fourier inversion removes the sign by the rational scalar −1. Read the two rational-term coefficients, including the variable-change Jacobian.

See [D. J. Wright — The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf), Theorem 6.1, pp.532–533.

<a id="proof-local-finite-fourier-dual"></a>

**Fourier transform of the integral lattice.** For self-dual binary-cubic pairing at v, Fourier(1_(O_v^4))(x)=|3|_v^(−1)q_v^(−2e_v)·1_(O_v^4)(δ_v(x1,3x2,3x3,x4)), where δ_v generates the local different in the source convention. This identifies the trace-divisible dual selector and retains the factor at v|3.

Compute the annihilator of the coordinate integral lattice under the alternating pairing and different-normalized additive character. Fourier of its indicator is its self-dual mass times the annihilator indicator. The two middle coordinates acquire 3, yielding the trace-divisible dual.

See [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Global test-function comparison before (6.4), p.69.

<a id="proof-cubic-meromorphic-continuation"></a>

**Cubic meromorphic continuation.** Each ordinary ξF,α extends meromorphically to C with at most simple poles at 1 and 5/6. Its continuation agrees with the order-weighted series on Res>1.

Unfold the adelic continuation into all ideal-class components, apply the five local factors and finite dual-lattice Fourier comparison, and compare archimedean orbital integrals. Cancel the extraneous adelic factors, leaving the two arithmetic simple poles.

See [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 6.2(i), pp.71–72; LOWW Proposition 3.7(2), p.12.

<a id="proof-cubic-entire-order-bound"></a>

**Order-one bound for cubic clearance.** For each signature α and ε>0 there is Cε>0 such that the entire cleared cubic function satisfies |CF,α(s)|≤exp(Cε(1+|s|)^(1+ε)) for all s∈C. This is order at most one, independent of the algebraic pole-clearance construction.

The cited theorem states order one for the exponent-u series; replacing u by 2s preserves that order. A quantitative proof requires the vertical estimates for the truncated adelic distribution and archimedean factors; this exact source and proof input is a recorded gap, not a consequence of merely removing two poles.

See [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), Theorem 6.2(ii), p.71; LOWW Proposition 3.7(5), p.13.

<a id="proof-cubic-residue-one"></a>

**Cubic residue at one.** With AF=ζF(2)ρF/2^(r1+r2+1), residue at 1 is AF(1+3^(−rα−r2)). Here ρF is the residue of ζF at 1 and rα counts split real cubic factors.

Compare the ordinary-series normalization with the adelic residue at u=2, including the factor one-half under u=2s and all local lattice masses. Insert the number-field zeta residue and sum the real signature weights, giving AF times the displayed factor.

See [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712), Proposition 3.7(2), p.12; DW Theorem 6.2(i), p.71.

<a id="proof-cubic-residue-five-sixths"></a>

**Cubic secondary residue.** With BF=3^(r1+r2/2)ζF(1/3)ρF/[6·2^(r1+r2)D^(1/2)]·[Γ(1/3)^3/(2π)]^n, residue at 5/6 is BF·3^(−rα/2). All discriminants are absolute norms.

Compare the adelic Sigma1 residue at u=5/3 with the arithmetic parameter s=5/6. Evaluate the archimedean orbital integrals and finite discriminant factors in the fixed self-dual normalization; their product is BF and the remaining signature weight is 3^(-r_alpha/2).

See [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712), Definition before Proposition 3.7 and Proposition 3.7(2), p.12.

<a id="continued-odd-quadratic-l-function-quadratic-L-continuation"></a>

### 5.18 Continued odd quadratic L-function

For positive odd d, put L2continued(i,d,s)=DirichletCharacter.LFunction(χi,d,s). It agrees with the odd series on Re s>1, is meromorphic on C, and is entire when χi,d is nonprincipal. All mean estimates outside Re s>1 use this continued function.

The proof proceeds as follows. Apply the imported LFunction construction to the actual coefficient character; prove the series agreement by coefficient equality.

The required interface consists of the following operations and identities.

- `TauCeti.SeveralVariableZeta.DoubleSeries.oddLContinuation_agrees`: Agreement with oddL in Re s>1.
- `TauCeti.SeveralVariableZeta.DoubleSeries.oddLContinuation_meromorphic`: Meromorphic continuation on C.
- `TauCeti.SeveralVariableZeta.DoubleSeries.oddLContinuation_entire`: Nonprincipal χ gives an entire L-function.

**Checks.**

- For i=ψ1,d=1 and s≠1, the continuation equals ζ2(s).
- For i=ψ1,d=9 and s≠1, it equals (1−3^(−s))ζ2(s).
- For i=ψ1,d=1 its value at −1 is 1/12, whereas the naive totalized LSeries there is zero.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, (7)–(16), pp.358–359.

*Needs:* [Imprimitive odd quadratic twist](#imprimitive-odd-quadratic-twist-quadratic-twist-character); `DirichletCharacter.LFunction`; `DirichletCharacter.LFunction_eq_LSeries`.

<a id="local-quadratic-reflection-ratio-double-local-reflection-ratio"></a>

### 5.19 Local quadratic reflection ratio

Define the meromorphic ratio r_i,η(s)=(q/π)^(1/2−s)Γ((1−s+κ)/2)/Γ((s+κ)/2)·(1−e2^(−s))/(1−e2^(s−1)). On Res<1 the numerator Gamma function and the Euler denominator have no poles or zeros, and reciprocal Gamma fills its denominator poles with zero. This determines an analytic function on that half-plane; the raw totalized quotient is used only where its factors are defined.

The proof proceeds as follows. Use the primitive completed functional equation with its exact conductor and parity. On Re s<1 the numerator Gamma arguments have positive real part and the Euler denominator cannot vanish. Use entire reciprocal Gamma to fill the other singular values.

The required interface consists of the following operations and identities.

- `TauCeti.SeveralVariableZeta.FunctionalSystem.localRatio_formula`: r_i,η(s)=(q/π)^(1/2−s)Γ((1−s+κ)/2)/Γ((s+κ)/2)·(1−e2^(−s))/(1−e2^(s−1)) off Gamma poles and Euler zeros.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.localRatio_analytic`: r_i,η is holomorphic on Res<1 after reciprocal-Gamma filling.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.localRatio_twist_two`: For i=2, r=(π/8)^(s−1/2)Γ((1−s)/2)/Γ(s/2), independent of η.

**Checks.**

- For i=0 or 2, r_i,η(0)=0.
- The ψ2 ratio has parity κ=0 and conductor factor 8.
- The ψ−2 ratio has Γ((2−s)/2)/Γ((s+1)/2), retaining κ=1.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), (32)–(34), pp.362–363.

*Needs:* [Primitive quadratic twist data](#primitive-quadratic-twist-data-double-primitive-twist-data); `Complex.Gamma`; `Complex.cpow`.

<a id="the-cubic-global-matrix-functional-equation-cubic-global-functional-equation"></a>

### 5.20 The cubic global matrix functional equation

Write n=[F:Q], D=|Disc F|. Then ξF,α(1−s)=[3^(6s−2)π^(−4s)Γ(s)²Γ(s−1/6)Γ(s+1/6)]^n D^(4s−2) Σβ cαβ(s) ξhatF,β(s). This is LOWW Proposition 3.7(3), obtained from the original adelic equation and the stated local Fourier comparisons; the unresolved local-distribution supplier is recorded precisely.

The proof proceeds as follows. Use the PVS Poisson and local Fourier interfaces, including singular terms. Collect the explicit archimedean coefficients, gamma factors and discriminant normalization. Identify the trace-divisible dual coefficients rather than replacing the dual series by the original.

The result must also satisfy these compatibility requirements: Write n=[F:Q], D=|Disc F|. Then ξF,α(1−s)=[3^(6s−2)π^(−4s)Γ(s)²Γ(s−1/6)Γ(s+1/6)]^n D^(4s−2) Σβ cαβ(s) ξhatF,β(s). This is the exact global theorem of LOWW Proposition3.7(3), with the original Poisson/local source proof still a recorded gap.

See [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712), §3.2 Proposition 3.7(3), pp.12–13.

*Needs:* [The selected adelic binary-cubic zeta integral](#the-selected-adelic-binary-cubic-zeta-integral-cubic-adelic-zeta); AutomorphicLFunctionsAndLocalFactors AL.0; AdelicAlgebraicGroups AA.2; ArithmeticStatistics ST.1; AutomorphicSpectralTheory AS.2 — eisenstein-continuation; [The binary-cubic archimedean functional-equation matrix](#the-binary-cubic-archimedean-functional-equation-matrix-cubic-archimedean-matrix); `Complex.Gamma`; [From arithmetic cubic orbits to analytic coefficients](#from-arithmetic-cubic-orbits-to-analytic-coefficients-cubic-orbit-to-coefficient); [Self-dual versus integral-normalized measures](#proof-local-measure-normalization); [Adelic binary cubic convergence](#proof-cubic-adelic-convergence); [Adelic orbital unfolding](#proof-cubic-adelic-unfolding); [All class-group components in unfolding](#proof-cubic-class-group-components); [Entire truncated cubic integral](#proof-cubic-truncated-entire); [Poisson decomposition of the global integral](#proof-cubic-poisson-decomposition); [Rank-one smoothing extracts the quotient integral](#proof-cubic-smoothing-residue); [Zero-orbit contribution](#proof-cubic-zero-singular-term); [Compact averaging and Fourier](#proof-cubic-compact-average-laws); [Singular distributions from Tate integrals](#proof-cubic-singular-tate-restrictions); [Unfold the triple-root orbit](#proof-cubic-triple-root-unfolding); [Triple-root contour residues](#proof-cubic-triple-root-residue); [Unfold the double-root orbit](#proof-cubic-double-root-unfolding); [Double-root contour residues](#proof-cubic-double-root-residue); [Cancel the extra smoothing poles](#proof-cubic-singular-cancellation); [Integrate the singular radial powers](#proof-cubic-singular-rational-term); [Adelic cubic continuation and equation](#proof-cubic-adelic-meromorphic-equation); [Fourier transform of the integral lattice](#proof-local-finite-fourier-dual); [Archimedean Fourier comparison](#proof-cubic-archimedean-fourier-comparison).

<a id="proof-cubic-archimedean-fourier-comparison"></a>

**Archimedean Fourier comparison.** After exponent u=2s, the real orbital Fourier matrix is the common factor 3^(6s−3)π^(−4s)Γ(s)^2Γ(s−1/6)Γ(s+1/6) times the real sine matrix; its real off-diagonal split-to-nonsplit entry carries the factor 3. The complex scalar is the squared gamma normalization times the four-sine factor. Transport these self-dual local equations to the integral-normalized arithmetic series before collecting the global D and 3 factors.

The real matrix is Theorem 4.1, whose original Shintani distribution proof remains the exact local-Fourier gap. The complex proof uses the Gaussian polynomial-differential recurrence, a period-two entire quotient and its finite Fourier support; Theorem 4.2 fixes the scalar. Use reflection and multiplication formulas to express the arithmetic-normalized sine factors.

See [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), DW Theorems 4.1–4.2, pp.48–51; LOWW (3.1) and Proposition 3.7(3), pp.12–13.

<a id="pole-cleared-quadratic-l-function-quadratic-pole-clearance"></a>

### 5.21 Pole-cleared quadratic L-function

Define H_i,d(s)=(s−1)L2continued(i,d,s) away from 1 and fill its value at 1 by the residue. If χi,d is principal that value is product_p|8d(1−p^(−1)); otherwise it is zero. The resulting H_i,d is entire. This is the function in the pole-aware strip moment.

The proof proceeds as follows. Use the nonprincipal entire continuation; for the principal character, its Euler-deleted ζ function has the stated residue. Fill the removable singularity by that residue.

The required interface consists of the following operations and identities.

- `TauCeti.SeveralVariableZeta.DoubleSeries.poleClearL_off_one`: Off 1, H_i,d(s)=(s−1)L2continued(i,d,s).
- `TauCeti.SeveralVariableZeta.DoubleSeries.poleClearL_entire`: H_i,d is entire on C.
- `TauCeti.SeveralVariableZeta.DoubleSeries.poleClearL_one`: Its value at 1 is the displayed principal residue, or zero for a nonprincipal character.

**Checks.**

- H_ψ1,1(1)=1/2.
- H_ψ1,9(1)=1/3.
- H_ψ2,1(1)=0.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, (13)–(16), pp.358–359; principal ζ2 term in (29), p.361.

*Needs:* [Continued odd quadratic L-function](#continued-odd-quadratic-l-function-quadratic-L-continuation); `DirichletCharacter.LFunction_changeLevel`.

<a id="quadratic-reflection-matrix-double-reflection-matrix"></a>

### 5.22 Quadratic reflection matrix

Define B(s) blockwise: B(s)[(i,j),(i,k)]=1/4 Ση ψj(η)r_i,η(s)ψk(η); blocks with different i vanish. The matrix is a meromorphic matrix, with removable values filled. The local ratios use the displayed primitive conductor table, not conductor 8 in every twist.

The proof proceeds as follows. Apply the Hadamard character transform, multiply in residue coordinates by the local reflection ratios, and apply the inverse transform. Separate twist blocks and fill removable singularities before evaluating matrix entries.

The required interface consists of the following operations and identities.

- `TauCeti.SeveralVariableZeta.FunctionalSystem.B_off_denominators`: The same-i block is H diag(r_i,η)Hᵀ/4 off all raw denominators.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.B_cross_block`: B(s)[(i,j),(k,l)]=0 when i≠k.
- `TauCeti.SeveralVariableZeta.FunctionalSystem.B_analytic_left`: Every entry of B is holomorphic on Res<1, including filled values.

**Checks.**

- The ψ2 block is (π/8)^(s−1/2)Γ((1−s)/2)/Γ(s/2) times I4.
- The ψ1 block at s=0 is zero.
- B(0)[(1,0),(1,0)]=4/(3π), so the odd block does not vanish.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), (32)–(35) and following paragraph, pp.362–363.

*Needs:* [Local quadratic reflection ratio](#local-quadratic-reflection-ratio-double-local-reflection-ratio); [The four real characters modulo eight](#the-four-real-characters-modulo-eight-characters-mod-eight); [Mod-eight character matrix orthogonality](#proof-characters-hadamard-orthogonality).

<a id="the-degree-dependent-zero-at-the-origin-cubic-zero-at-origin"></a>

### 5.23 The degree-dependent zero at the origin

For n≥2, ξF,α(0)=0. More precisely the functional equation gives vanishing order at least n−1 at0, since each dual series has at most a simple pole at1.

The proof proceeds as follows. Multiply the order-n archimedean zero by the possible order-one dual pole. The global prefactor is a local unit at1. Replace s by1−s; for n=1 no forced zero is claimed.

The result must also satisfy these compatibility requirements: For n≥2, ξF,α(0)=0. More precisely the functional equation gives vanishing order at least n−1 at0, since each dual series has at most a simple pole at1.

See [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712), §3.2 Lemma 3.8 and proof, p.13.

*Needs:* [The binary-cubic archimedean functional-equation matrix](#the-binary-cubic-archimedean-functional-equation-matrix-cubic-archimedean-matrix); [The selected adelic binary-cubic zeta integral](#the-selected-adelic-binary-cubic-zeta-integral-cubic-adelic-zeta); AutomorphicLFunctionsAndLocalFactors AL.0; AdelicAlgebraicGroups AA.2; ArithmeticStatistics ST.1; [From arithmetic cubic orbits to analytic coefficients](#from-arithmetic-cubic-orbits-to-analytic-coefficients-cubic-orbit-to-coefficient); `Complex.Gamma`; [The cubic global matrix functional equation](#the-cubic-global-matrix-functional-equation-cubic-global-functional-equation); [The two cubic poles and their residues](#the-two-cubic-poles-and-their-residues-cubic-residues-and-entire-clearance); [Signature-refined cubic Shintani zeta functions](#signature-refined-cubic-shintani-zeta-functions-cubic-shintani-series); [Dedekind continuation and real-side comparison](#dedekind-continuation-and-real-side-comparison-dedekind-zeta-continuation-and-residue); AutomorphicSpectralTheory AS.2 — eisenstein-continuation; [Ordinary cubic continuation data](#ordinary-cubic-continuation-data-cubic-continuation-data); [Self-dual versus integral-normalized measures](#proof-local-measure-normalization); [Binary cubic orbital Jacobian](#proof-local-orbit-jacobian); [Adelic binary cubic convergence](#proof-cubic-adelic-convergence); [Adelic orbital unfolding](#proof-cubic-adelic-unfolding); [All class-group components in unfolding](#proof-cubic-class-group-components); [Split local factor](#proof-local-split-orbit-factor); [Unramified quadratic local factor](#proof-local-unramified-quadratic-factor); [Ramified quadratic local factor](#proof-local-ramified-quadratic-factor); [Unramified cubic local factor](#proof-local-unramified-cubic-factor); [Ramified cubic local factor](#proof-local-ramified-cubic-factor); [Five local orbital Euler factors](#proof-local-orbital-euler-factor); [Absolute convergence of cubic Shintani series](#proof-cubic-absolute-convergence); [Entire truncated cubic integral](#proof-cubic-truncated-entire); [Poisson decomposition of the global integral](#proof-cubic-poisson-decomposition); [Rank-one smoothing extracts the quotient integral](#proof-cubic-smoothing-residue); [Zero-orbit contribution](#proof-cubic-zero-singular-term); [Compact averaging and Fourier](#proof-cubic-compact-average-laws); [Singular distributions from Tate integrals](#proof-cubic-singular-tate-restrictions); [Unfold the triple-root orbit](#proof-cubic-triple-root-unfolding); [Triple-root contour residues](#proof-cubic-triple-root-residue); [Unfold the double-root orbit](#proof-cubic-double-root-unfolding); [Double-root contour residues](#proof-cubic-double-root-residue); [Cancel the extra smoothing poles](#proof-cubic-singular-cancellation); [Integrate the singular radial powers](#proof-cubic-singular-rational-term); [Adelic cubic continuation and equation](#proof-cubic-adelic-meromorphic-equation); [Fourier transform of the integral lattice](#proof-local-finite-fourier-dual); [Cubic meromorphic continuation](#proof-cubic-meromorphic-continuation); [Archimedean coefficients vanish to degree order](#proof-arch-entry-vanishing-at-one); [The global prefactor is a unit at one](#proof-gamma-unit-at-one); [Simple poles of the dual cubic Shintani series](#proof-cubic-dual-simple-poles).

<a id="proof-cubic-absolute-convergence"></a>

**Absolute convergence of cubic Shintani series.** Every ξF,α(s) and dual series converges absolutely on Res>1.

Start with the absolute adelic convergence theorem for Re s>1, rather than the coarser uniform coefficient estimate which only proves convergence for Re s>3/2. Apply the absolutely convergent orbit unfolding and the all-ideal-class lattice comparison. Choose nonnegative local test functions whose archimedean orbit support isolates the required signature and whose local orbital factors are nonzero. The resulting positive orbital sum is the Shintani series times finite local factors. The dual trace-divisible lattice restricts this nonnegative sum, so it has the same convergence half-plane. This is the convergence argument of DW §6 and the LOWW statement.

See [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712), §3.2 Proposition 3.7(1), p.12; [Boris Datskovsky and David J. Wright — The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf), §6, Theorem 6.2 and preceding orbital/Euler-product comparison, pp.68–71.

<a id="proof-arch-entry-vanishing-at-one"></a>

**Archimedean coefficients vanish to degree order.** Every cαβ(s) vanishes to order at least n=r1+2r2 at s=1; each real factor has order≥1 and each complex factor has order2.

Expand sin(πs) and sin(2πs) at1. At a complex place only the squared sine vanishes; the shifted sine factors are nonzero. Add orders under the finite product.

See [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712), §3.2 equation (3.1), p.12, and proof of Lemma 3.8, p.13.

<a id="proof-gamma-unit-at-one"></a>

**The global prefactor is a unit at one.** The gamma/discriminant prefactor in the cubic functional equation is holomorphic and nonzero at s=1, since its gamma arguments are1,5/6 and7/6.

Check all three gamma arguments are positive at1. Use gamma holomorphy and nonvanishing there. Use positive-base exponential powers for the discriminant and3/π factors.

See [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712), §3.2 Proposition 3.7(3), p.12, and proof of Lemma 3.8, p.13.

<a id="proof-cubic-dual-simple-poles"></a>

**Simple poles of the dual cubic Shintani series.** For each number field F and archimedean signature α, the dual ξhatF,α has a meromorphic continuation with no poles except possible simple poles at 1 and 5/6. In particular (s−1)ξhatF,α(s) is holomorphic near 1.

Here Use the trace-divisible dual series of cubic-shintani-series, with the LOWW normalizations.

Use the original DW Theorem 6.2 decomposition with the trace-divisible finite test function identified by local-finite-fourier-dual. The same truncated-entire and singular-residue argument bounds pole orders by one; coefficient positivity alone does not imply this.

See [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712), §3.2, Proposition 3.7(4), p.13.

<a id="pole-aware-cubic-convexity-bound-cubic-pole-cleared-convexity"></a>

### 5.24 Pole-aware cubic convexity bound

For −1/2≤σ≤3/2, |t|≥1 and ε>0, ξF,α(σ+it)≪ε,n h2(F)D^(7/2−2σ+ε)(1+|t|)^(2n(3/2−σ)+ε). Apply Phragmén–Lindelöf to the pole-cleared function. The displayed inequality without pole exclusion is false at s=1 and5/6; the bound is asserted only on this pole-free range.

The proof proceeds as follows. Use the positive-half-plane estimate at σ=3/2+ε and the reflected left estimate. Clear (s−1)(s−5/6) before interpolation and divide only where bounded away from both poles. Retain the same h2 factor on both edges.

The result must also satisfy these compatibility requirements: For −1/2≤σ≤3/2, |t|≥1 and ε>0, ξF,α(σ+it)≪ε,n h2(F)D^(7/2−2σ+ε)(1+|t|)^(2n(3/2−σ)+ε). Apply Phragmén–Lindelöf to the pole-cleared function. The displayed inequality without pole exclusion is false at s=1 and5/6; the bound is asserted only on this pole-free range.

See [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712), §3.2 Lemma 3.11 and proof, p.14; restricted to |t|≥1 to avoid poles.

*Needs:* [Orders in a fixed étale cubic algebra](#orders-in-a-fixed-tale-cubic-algebra-cubic-orders-generating-series); [Signature-refined cubic Shintani zeta functions](#signature-refined-cubic-shintani-zeta-functions-cubic-shintani-series); ArithmeticStatistics ST.3; [The cubic global matrix functional equation](#the-cubic-global-matrix-functional-equation-cubic-global-functional-equation); [Uniform Stirling bounds for Γ on vertical strips](#uniform-stirling-bounds-for-on-vertical-strips-uniform-complex-stirling); [Entire order at most ρ](#entire-order-at-most-entire-order-at-most); [The two cubic poles and their residues](#the-two-cubic-poles-and-their-residues-cubic-residues-and-entire-clearance); [The weighted cubic-coefficient bound](#proof-cubic-reducible-and-field-coefficient-bound); [Reflected vertical bound from the matrix equation](#proof-cubic-reflected-bound).

<a id="proof-cubic-reducible-and-field-coefficient-bound"></a>

**The weighted cubic-coefficient bound.** For every ε>0 and real σ>3/2, ξF,α(σ)≪[F:Q],σ,ε D^(1/2+ε)h2(F). Prove the separate split/quadratic-factor and cubic-field contributions using LOWW Lemma3.5 and the orders formula; the field-count input remains with ST.

Decompose cubic étale algebras into split, quadratic-factor and cubic-field types. Use the appropriate discriminant/count bound for each. Sum the order-index factor with σ>3/2 and retain h2(F).

See [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712), §3.2 Lemma 3.10 and proof, pp.13–14.

<a id="proof-cubic-reflected-bound"></a>

**Reflected vertical bound from the matrix equation.** For σ<−1/2 and |t|≥1, the functional equation gives ξF,α(σ+it)≪ε,n,σ h2(F)D^(5/2−4σ+ε)(1+|t|)^(n(2−4σ)+ε), using the right-half-plane dual bound. Constants depend on the fixed real strip.

Bound the dual by the ordinary positive-coefficient series at1−σ>3/2. Apply Stirling to the gamma factors and combine with sine growth. Multiply the functional-equation factor D^(2−4σ) by the right-half-plane bound h2(F)D^(1/2+ε). The combined exponent is 5/2−4σ+ε; retain the stated height power.

See [Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood — The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712), §3.2 proof of Lemma 3.11, left-boundary estimate, p.14; combine Proposition 3.7(3) with Lemma 3.10.

<a id="meromorphic-continuation-and-the-three-polar-hyperplanes-double-series-continuation"></a>

### 5.25 Meromorphic continuation and the three polar hyperplanes

For each twist pair i,j there is a unique entire function Eij on C² whose value on Res>1, Rew>1 is P(s,w)Zij(s,w), where P=(s−1)(w−1)(s+w−3/2). The meromorphic continuation is represented off P=0 by Eij/P. Values of a totalized quotient on P=0 are not used. Functional equations are germ identities; polynomial vertical growth is a separate lemma.

The proof proceeds as follows. Remove the three candidate hyperplanes by multiplication. Fill the tube hole using the preceding extension. Recover the polynomial bound and use uniqueness to transport both equations.

The result must also satisfy these compatibility requirements: For each pair of twists there is a continuation agreeing with the series in the initial tube such that (s−1)(w−1)(s+w−3/2)Z(s,w) is entire on C². In every bounded real strip it has polynomial growth in (1+|Ims|)(1+|Imw|). The two matrix functional equations hold as meromorphic identities; no scalar Euler product or multiple-zeta-value identification is asserted.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 Lemma 2, equation (27), p.361; proof pp.361–364.

*Needs:* `AnalyticOnNhd`; `jacobiSym`; [The selected quadratic double Dirichlet series](#the-selected-quadratic-double-dirichlet-series-quadratic-double-series); `zeta_eq_tsum_one_div_nat_cpow`; `LSeries`; [Primitive quadratic twist data](#primitive-quadratic-twist-data-double-primitive-twist-data); `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`; `DirichletCharacter.LFunction_changeLevel`; [The four real characters modulo eight](#the-four-real-characters-modulo-eight-characters-mod-eight); [Continued odd quadratic L-function](#continued-odd-quadratic-l-function-quadratic-L-continuation); [Imprimitive odd quadratic twist](#imprimitive-odd-quadratic-twist-quadratic-twist-character); `DirichletCharacter`; ArithmeticStatistics ST.2; [Pole-cleared quadratic L-function](#pole-cleared-quadratic-l-function-quadratic-pole-clearance); [Quadratic reciprocity matrix](#quadratic-reciprocity-matrix-double-functional-system); [Swap of double-series variables](#swap-of-double-series-variables-double-affine-swap); [Quadratic reflection matrix](#quadratic-reflection-matrix-double-reflection-matrix); [Quadratic reflection of double-series variables](#quadratic-reflection-of-double-series-variables-double-affine-reflection); [Iterated continuation tubes](#iterated-continuation-tubes-double-iterated-tube-bases); [Local quadratic reflection ratio](#local-quadratic-reflection-ratio-double-local-reflection-ratio); [Uniform Stirling bounds for Γ on vertical strips](#uniform-stirling-bounds-for-on-vertical-strips-uniform-complex-stirling); [Normal convergence in the first tube](#proof-double-normal-convergence); [Absolute convergence in the initial double tube](#proof-odd-double-sum-absolute); [Unique odd squarefree factorization](#proof-odd-squarefree-factorization); [Quadratic conductor and root number](#proof-quadratic-primitive-adapter); [Nonzero squarefree-series denominator](#proof-double-denominator-unit); [Separating square factors of the discriminant index](#proof-squarefree-square-decomposition); [Quadratic fourth moment](#proof-quadratic-fourth-moment); [Primitive quadratic first moment](#proof-quadratic-holder-first-moment); [Imprimitive square-factor bound](#proof-quadratic-square-factor-sum); [The first-moment input for the wider convergence tube](#proof-quadratic-mean-bound-import); [Pole-aware strip first moment](#proof-quadratic-pole-aware-strip-moment); [Locally uniform convergence in R1](#proof-double-R1-convergence); [The swap functional equation](#proof-reciprocity-swap-equation); [The reflection functional equation](#proof-quadratic-reflection-equation); [The zero block that removes a false pole](#proof-reflect-holomorphy-and-zero); [Functional branches agree on overlaps](#proof-double-overlap-identity); [Cancellation of spurious reflected poles](#proof-double-reflected-pole-cancellation); [Gluing the four continued tubes](#proof-tube-overlap-gluing); [Bochner tube extension](#proof-tube-bochner-extension); [Bound survives tube extension](#proof-tube-reciprocal-bound); [Affine dihedral action](#proof-double-affine-dihedral); [Real shell convex hull](#proof-double-shell-hull); [Gamma reflection block growth](#proof-double-gamma-quotient-growth); [Bounded normalization on the shell tube](#proof-double-shell-normalizer); [Filling the remaining real twelve-gon](#proof-tube-hull-extension); [Polynomial growth of cleared double series](#proof-double-growth).

<a id="proof-double-normal-convergence"></a>

**Normal convergence in the first tube.** On each compact K⊂{Res>1,Rew>1}, the odd (n,d) summands have a summable majorant n^(−σ0)d^(−ν0) with σ0,ν0>1. Consequently their double sum is normally convergent on K.

Take the minima of the two real parts on the compact set; both exceed one. Bound every character by one and dominate the double sum by the product of two convergent positive Dirichlet series. The bound is independent of the point in the compact set.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Definition (1), p.356; Lemma 2 proof, p.361.

<a id="proof-odd-double-sum-absolute"></a>

**Absolute convergence in the initial double tube.** For Res>1 and Rew>1 the odd n,d double sum is absolutely convergent, locally uniformly on compact sub-tubes; hence it may be summed in either order.

Bound both characters by1. Dominate by ζ(Res)ζ(Rew); the correcting ζ2 factor has Re(2s+2w−1)>1. Use compact positive margins for locally uniform domination.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 proof of Lemma 2, initial expansion (28), pp.361–362.

<a id="proof-odd-squarefree-factorization"></a>

**Unique odd squarefree factorization.** Every positive odd d is uniquely d0k² with d0 positive odd squarefree and k positive odd. The Jacobi symbol χd equals χd0 away from prime divisors of k and vanishes at those prime divisors.

Split each prime exponent into its parity and an even part. Unique factorization gives the squarefree component and square component, retaining oddness. The Jacobi factors for even exponents are one away from their prime and zero at it.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, before (7), p.358; (29), p.361.

<a id="proof-quadratic-primitive-adapter"></a>

**Quadratic conductor and root number.** For each odd squarefree d0 and twist i identify χd0ψi with its primitive real character of conductor q_i,η d0, parity κ_i and root number +1. Removed prime-2 and square-factor Euler factors agree with L2. Here η=d0 mod8, q and κ are exactly the table defining the reflection block; principal cases use meromorphic germs.

Identify the signed fundamental-discriminant character with the primitive character. Prove the conductor, parity and positive Gauss-sum root number, then apply the completed functional equation and change-level formula. These arithmetic/Gauss-sum adapters remain the named source gap.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, (7)–(13), pp.358–359.

<a id="proof-double-denominator-unit"></a>

**Nonzero squarefree-series denominator.** For Re(s+2w)>1 the Euler product of L2(s+2w,χd0ψi) is nonzero. On any closed sub-half-plane Re(s+2w)≥1+δ, its reciprocal is bounded by ζ(1+δ), uniformly in d0 and the twist.

Use the absolutely convergent Euler product on the strict right half-plane. Each reciprocal local factor has modulus at most 1+p^(-sigma), whose product is at most zeta(sigma). This proves nonvanishing and the compact sub-half-plane uniform bound.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 proof, (29), p.361.

<a id="proof-squarefree-square-decomposition"></a>

**Separating square factors of the discriminant index.** Each odd d has a unique d=d0 d1² with d0 squarefree. In the initial tube, Z=ζ2(2s+2w−1)ζ2(2w)Σd0 odd squarefree L2(s,χd0ψ)ψ′(d0)/(d0^w L2(s+2w,χd0ψ)).

Factor d uniquely prime by prime. Removing primes dividing d1 from the inner L-series gives the finite missing Euler factors. Sum each geometric square-factor series absolutely to obtain the quotient in (29).

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 equation (29), pp.361–362.

<a id="proof-quadratic-fourth-moment"></a>

**Quadratic fourth moment.** For fixed σ∈[1/2,1] and ε>0, Σχ nonprincipal primitive real,condχ≤Q |L(σ+it,χ)|⁴ ≤ Cσ,ε [Q+(Q(1+|t|))^(2−2σ)](Q(1+|t|))^ε, for Q≥1 and t∈R. The conductor-one principal character is treated separately.

Use the quadratic large sieve on the smoothed Dirichlet polynomial for L². Bound the reflected contour using the primitive functional equation; bootstrap the dyadic fourth moment and treat σ=1/2 by σ=1/2−ε.

See [D. R. Heath-Brown — A mean value estimate for real character sums](https://ora.ox.ac.uk/objects/uuid:b188b365-d8d1-4267-8548-49f01e6cb6a7/files/m6af40476f1b860392271a2d8ecae593b), Theorem 2, p.238; §10, pp.267–269.

<a id="proof-quadratic-holder-first-moment"></a>

**Primitive quadratic first moment.** On σ=1/2, Hölder and the O(X) count of primitive real characters of conductor≤8X give Σd0≤X,d0 odd squarefree,χd0ψi nonprincipal |L(1/2+it,χd0ψi)| ≤ Cε X^(1+ε)(1+|t|)^(1/4+ε).

Apply Holder with fourth power to the primitive family. The character count contributes X^(3/4), and the fourth-moment bound contributes X^(1/4+epsilon)(1+|t|)^(1/4+epsilon), after rescaling epsilon. Remove principal terms before applying the supplied moment.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, (14)–(16), pp.358–359.

<a id="proof-quadratic-square-factor-sum"></a>

**Imprimitive square-factor bound.** For d=d0k² odd, the deleted Euler factors give |L2(s,χdψi)| ≤ |L2(s,χd0ψi)|∏p|k(1+p^(−Res)). On a fixed real strip with Res≥1/2 this product is Oε(k^ε), uniformly in Ims. Summing k≤√(X/d0) transports the primitive first moment to all odd d; the d0=1 principal term uses ζ2(s), off s=1.

Use the change-level identity to write the omitted prime factors. Bound them by the product of 1+p^(-sigma), absorb that product in k^epsilon on the fixed strip, and sum the primitive estimate over square factors. Treat the sole principal primitive term by the meromorphic odd zeta function.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1, (13)–(16), pp.358–359.

<a id="proof-quadratic-mean-bound-import"></a>

**The first-moment input for the wider convergence tube.** For every ε>0 and twist i there is Cε>0 such that, for all X≥1 and t∈R, Σ1≤d≤X,d odd |L2(1/2+it,χdψi)| ≤ Cε X^(1+ε)(1+|t|)^(1/4+ε). The principal primitive character is separated before applying the quadratic fourth-moment theorem. A pole-aware strip extension is a separate lemma. Here L2 is oddLContinuation, not the totalized naive LSeries.

Match (16) with the odd squarefree discriminants and the four twists. Keep its ε-loss and vertical-parameter dependence. Feed partial summation with the selected bound into the d0 series.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1 equation (16), p.359; application to (29), p.362.

<a id="proof-quadratic-pole-aware-strip-moment"></a>

**Pole-aware strip first moment.** Fix a compact real interval I and ε>0. There exist C,N>0 such that for σ∈I, X≥1 and t∈R, Σd≤X,d odd |(σ+it−1)L2(σ+it,χdψi)| ≤ C X^(max(1,3/2−σ)+ε)(1+|t|)^N. At s=1 the term denotes the analytic extension of (s−1)L2(s), not totalized multiplication. Constants depend on I and ε, not X,t or i. The summands are the absolute values of the entire functions H_i,d=DoubleSeries.poleClearL.

On compact right strips use the fourth moment, Hölder and square-factor decomposition, separating the principal ζ2 contribution. Reflect strips left of 1/2; the conductor factor d^(1/2−σ) gives the exponent 3/2−σ. Track the gamma and pole-clearing factors as polynomial height bounds. Uniform strip constants must be proved by the same smoothed-sum argument, not inferred from pointwise O constants.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §2.1 (16), p.359; Lemma 2 proof around (29), p.361.

<a id="proof-double-R1-convergence"></a>

**Locally uniform convergence in R1.** The pole-cleared squarefree expression is holomorphic on R1={Rew>1,Res+Rew>3/2}; its only possible polar line there is s=1, from the trivial inner twist.

Use the first-moment bound for Res≥1/2. Apply the quadratic functional equation and its conductor growth for Res<1/2. Sum on compact strict sub-tubes and separate the trivial-character pole.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 proof following (29), p.362.

<a id="proof-reciprocity-swap-equation"></a>

**The swap functional equation.** The 16-vector continuation satisfies Z(s,w)=A Z(w,s) wherever defined meromorphically.

Interchange the absolutely convergent odd sums. Expand the quadratic-reciprocity sign using the finite character table. Use identity continuation from the nonempty overlap.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 equations (31)–(32), pp.362–363.

<a id="proof-quadratic-reflection-equation"></a>

**The reflection functional equation.** The 16-vector continuation satisfies Z(s,w)=B(s)Z(1−s,s+w−1/2) as an equality of meromorphic germs.

Separate odd squarefree d0 and residue classes. Use the primitive real-character functional equation and the deleted factor at2. Observe that s+2w is invariant and that 2w and 2s+2w−1 are exchanged.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 equations (10) and (33)–(35), pp.358,362–363.

<a id="proof-reflect-holomorphy-and-zero"></a>

**The zero block that removes a false pole.** B(s) is holomorphic on Res<1 and its principal-twist block vanishes at s=0. This cancels the reflected principal w=1 pole where its image would otherwise introduce an extra pole; it does not assert that every block vanishes at zero.

Use the gamma quotient with parity and the Euler factor ratio. Cancel apparent denominators at their removable zeros. At s=0 in the first block, the reciprocal gamma zero cancels the candidate transported pole.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 proof after (35), p.363.

<a id="proof-double-overlap-identity"></a>

**Functional branches agree on overlaps.** On every connected nonempty open overlap of the R1,αR1,βR2,αR3 tube components, both branches have the same meromorphic germ: transport to the original absolute-convergence tube and use the identity theorem after clearing all encountered pole factors. Intersections used here are convex real tubes, hence connected.

Clear the finite polar factors on each overlap. The transported functional equations agree on a nonempty absolute-convergence subdomain. The identity theorem extends agreement to the connected convex tube intersection; perform each successive gluing with that same normalization.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 proof, pp.362–363.

<a id="proof-double-reflected-pole-cancellation"></a>

**Cancellation of spurious reflected poles.** During the R2→R3 gluing, the only candidate new pole beyond s=1,w=1,s+w=3/2 is the reflected principal-twist pole through s=0. The principal block B1(0)=0 cancels it. Track pole orders as germs; multiplying totalized zero values is insufficient.

Separate the principal residue term in the reflected branch. Its scalar pole has order at most one and the entire principal reflection block vanishes at zero. Multiply as analytic germs, using the order inequality to remove the candidate pole.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 proof, paragraph following (35), p.363.

<a id="proof-tube-overlap-gluing"></a>

**Gluing the four continued tubes.** R2=α(R1)∪R1; R3=β(R2)∪R2; R4=α(R3)∪R3. The functional equations agree on their nonempty open overlaps and the gluing leaves possible poles only at s=1,w=1,s+w=3/2.

Check the explicit inequalities defining each tube, as on pp.363–364. Use holomorphic uniqueness on the overlaps after multiplying by the three linear pole factors. Use B1(0)=0 to remove the candidate s=0 hyperplane.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), §3 proof of Lemma 2, tube R1 and its images (36), pp.363–364.

<a id="proof-tube-bochner-extension"></a>

**Bochner tube extension.** For connected open Ω⊆R² and f holomorphic on TΩ, there is a unique holomorphic F on Tconv(Ω) with F=f on TΩ. The imaginary directions are unrestricted. This is a theorem on tubes, not on arbitrary punctured complex domains.

The exact connected-tube convex-hull extension is the external Bochner input. DGH Proposition 4.6 states it without its primary proof, so its general proof is required here. Uniqueness on the convex tube follows from the analytic identity theorem.

See [Adrian Diaconu, Dorian Goldfeld and Jeffrey Hoffstein — Multiple Dirichlet series and moments of zeta and L-functions](https://www.math.columbia.edu/~goldfeld/GoldfeldDiaconuHoffstein.pdf), Definition 4.5 and Proposition 4.6, pp.37–38.

<a id="proof-tube-reciprocal-bound"></a>

**Bound survives tube extension.** Under the Bochner hypotheses, if M≥0 and |f(z)|≤M for all z∈TΩ, then its extension F satisfies |F(z)|≤M throughout Tconv(Ω).

For every |a|>M, extend 1/(f−a) to the convex tube. The holomorphic identity (F−a)G=1 follows from uniqueness. Thus F avoids every value outside the closed radius-M disk.

See [Adrian Diaconu, Dorian Goldfeld and Jeffrey Hoffstein — Multiple Dirichlet series and moments of zeta and L-functions](https://www.math.columbia.edu/~goldfeld/GoldfeldDiaconuHoffstein.pdf), Propositions 4.6–4.7, pp.37–38; bounded-shell application pp.43–44.

<a id="proof-double-affine-dihedral"></a>

**Affine dihedral action.** The two maps α,β satisfy α²=β²=id and (αβ)^6=id. At (2,3), the six iterates of αβ are distinct, so its order is exactly six. These transformations act on the real-part tube bases as well as on C².

Compute alpha beta as an affine map and iterate it six times symbolically. Both generators square to the identity; the six images of (2,3) are distinct and certify exact order six.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 proof, pp.362–364.

<a id="proof-double-shell-hull"></a>

**Real shell convex hull.** After R4=R3∪αR3, set R5=R4∪βR4 and R6=R5∪αR5. The complement of the real-part base of R6 is the closed twelve-gon Ω with successive vertices (1,1),(1/2,1),(0,3/2),(0,1),(−1/2,1),(0,1/2),(0,0),(1/2,0),(1,−1/2),(1,0),(3/2,0),(1,1/2). It lies in x²+y²≤3, so the connected annulus 4<x²+y²<5 lies in the glued base and its convex hull contains Ω. The earlier R4 alone does not have bounded complement.

Write each transported tube as explicit linear inequalities, using both remaining functional-equation transports R4→R5→R6. Check the complement by its twelve successive boundary segments. Bound every vertex by x²+y²≤3; convexity of the disk gives the polygon bound. The open annulus is connected and its convex hull is the disk of radius sqrt(5); use the bounded normalization on its entire imaginary tube.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 proof and Fig.1, pp.363–364.

<a id="proof-double-gamma-quotient-growth"></a>

**Gamma reflection block growth.** On each closed strip a≤Res≤b<1, the filled r_i,η(s) and hence entries of B(s) are bounded by C(1+|Ims|)^N. Stirling for the Gamma quotient gives a power of height; the Euler denominator has modulus at least 1−2^(b−1)>0 when e≠0. On a bounded height interval use holomorphy and compactness.

Separate the four conductor factors, whose moduli depend only on Res. Apply the vertical-strip Stirling ratio estimate away from bounded height; reciprocal Gamma fills the bounded-height removable points. Use the stated uniform lower bound for the restored Euler denominator.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 proof, (32)–(35), pp.362–364.

<a id="proof-double-shell-normalizer"></a>

**Bounded normalization on the shell tube.** On the annular shell 4<Res²+Rew²<5 used in the last continuation step, the cleared branch F=PZ has a bound C(1+|Ims|)^N(1+|Imw|)^N from the R1 estimate and transported reflection estimates. Choose an integer M≥N. Then F/[(3+s)^M(3+w)^M] is holomorphic and bounded on the shell tube, and its denominator has no zero on the full tube Res²+Rew²<5. Bochner bounded extension of this normalized function fills the hole; multiplying the denominator restores F.

Cover the closed real annulus 4≤Res²+Rew²≤5 by finitely many transported convergence regions, using germ agreement on overlaps. It lies inside their union because the excluded polygon has squared radius at most 9/4. Compactness supplies uniform constants for its open subannulus. Retain polynomial height estimates in both variables under the finitely many affine transformations. Since |Res|,|Rew|<√5<3, |3+s| and |3+w| are bounded below and dominate 1+|Ims| and 1+|Imw| up to a fixed positive scalar.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Final part of Lemma 2 proof, pp.363–364.

<a id="proof-tube-hull-extension"></a>

**Filling the remaining real twelve-gon.** Let Ω⊆R² be connected and open and let f be holomorphic on TΩ={z:Re z∈Ω}. It has a unique holomorphic extension to Tconv(Ω) (Bochner). If |f|≤M on TΩ, the extension has the same bound. Apply this to the pole-cleared branch on the annular real shell around the omitted twelve-gon.

Extend f by Bochner. For each complex a with |a|>M, also extend 1/(f−a). The identity (f−a)/(f−a)=1 extends by uniqueness, so the extended f never takes such an a. Apply the shell hull to each cleared component; only the local shell bound enters.

See [Adrian Diaconu, Dorian Goldfeld and Jeffrey Hoffstein — Multiple Dirichlet series and moments of zeta and L-functions](https://www.math.columbia.edu/~goldfeld/GoldfeldDiaconuHoffstein.pdf), §4.3, Proposition 4.6, pp.37–38; application pp.43–44.

<a id="proof-double-growth"></a>

**Polynomial growth of cleared double series.** For each compact real rectangle I×J there exist C,N>0 with |Eij(s,w)|≤C(1+|Ims|)^N(1+|Imw|)^N whenever Res∈I,Rew∈J. Here Eij is the entire cleared continuation.

Obtain polynomial bounds on every component of the R6 shell from the compact-uniform primitive moment and uniform Gamma ratio. Normalize by (3+s)^M(3+w)^M on a real-part ball and use bounded reciprocal tube extension. Translate the ball under the functional system to cover the requested rectangle.

See [Valentin Blomer — Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf), Lemma 2 proof, pp.363–364.

### Remaining analytic proof obligations

**Quadratic primitive-character and uniform-strip proof adapters.** Verify the fundamental-discriminant conductor/parity table, the Gauss-sum sign +1 and deleted factors including conductor one. Uniform strip moments need compact-uniform smoothed-sum constants; pointwise constants depending on σ do not suffice. Used in [Meromorphic continuation and the three polar hyperplanes](#meromorphic-continuation-and-the-three-polar-hyperplanes-double-series-continuation).

**Bochner theorem: primary proof acquisition.** Bochner’s extension is for a connected open real base with all imaginary directions. DGH Proposition 4.6 states it but cites an external proof. Prove that exact theorem here, then derive bounded extension by continuing 1/(f−a); arbitrary punctured complex domains do not satisfy this assertion. Used in [Meromorphic continuation and the three polar hyperplanes](#meromorphic-continuation-and-the-three-polar-hyperplanes-double-series-continuation).

**Cubic rings on nonprincipal modules.** The cubic orbit comparison includes every locally free O_F-module and ideal-class component, and the trace-divisible dual lattice. The arithmetic supplier must provide finite inverse-automorphism-weighted coefficients and the uniform field count. A PID-only parametrization cannot justify the global series. Used in [From arithmetic cubic orbits to analytic coefficients](#from-arithmetic-cubic-orbits-to-analytic-coefficients-cubic-orbit-to-coefficient); [The cubic global matrix functional equation](#the-cubic-global-matrix-functional-equation-cubic-global-functional-equation); [The two cubic poles and their residues](#the-two-cubic-poles-and-their-residues-cubic-residues-and-entire-clearance); [The degree-dependent zero at the origin](#the-degree-dependent-zero-at-the-origin-cubic-zero-at-origin); [Signature-refined cubic Shintani zeta functions](#signature-refined-cubic-shintani-zeta-functions-cubic-shintani-series); [Pole-aware cubic convexity bound](#pole-aware-cubic-convexity-bound-cubic-pole-cleared-convexity).

**Local distribution functional equations: external original proofs.** The five nonarchimedean orbital factors and the complex Fourier calculation still require the original local-distribution continuation and real Shintani matrix proofs. Retain residue characteristics 2 and 3, the different, discriminant and |3| in the measure comparison; no unsupported tame replacement is used. Used in [Binary-cubic local zeta integrals](#binary-cubic-local-zeta-integrals-pvs-local-zeta); [Orders in a fixed étale cubic algebra](#orders-in-a-fixed-tale-cubic-algebra-cubic-orders-generating-series); [The two cubic poles and their residues](#the-two-cubic-poles-and-their-residues-cubic-residues-and-entire-clearance); [The degree-dependent zero at the origin](#the-degree-dependent-zero-at-the-origin-cubic-zero-at-origin); [The cubic global matrix functional equation](#the-cubic-global-matrix-functional-equation-cubic-global-functional-equation).

**GL2 measures, Siegel majorants and normalized Eisenstein input.** The GL₂ quotient input must include inversion between quotient sides and the compact-times-Siegel-set majorant. Fourier–Poisson requires Wright’s uniform Schwartz lattice estimates. The rank-one Eisenstein input needs its exact constant term, residue and nonconstant Fourier bound; continuation alone is insufficient. Used in [The cubic global matrix functional equation](#the-cubic-global-matrix-functional-equation-cubic-global-functional-equation); [The two cubic poles and their residues](#the-two-cubic-poles-and-their-residues-cubic-residues-and-entire-clearance); [The degree-dependent zero at the origin](#the-degree-dependent-zero-at-the-origin-cubic-zero-at-origin).

**Cubic entire order-one quantitative estimate.** Removing the two cubic poles does not imply order at most one. Prove the ε-dependent entire-plane exponential bound from quantitative truncated adelic estimates and the normalized archimedean factors. Datskovsky–Wright Theorem 6.2(ii) states the order but leaves this quantitative proof as an input. Used in [The two cubic poles and their residues](#the-two-cubic-poles-and-their-residues-cubic-residues-and-entire-clearance); [Pole-aware cubic convexity bound](#pole-aware-cubic-convexity-bound-cubic-pole-cleared-convexity).

**Normalized Haar and canonical adelic component adapters.** Connect normalized additive Haar on each actual p-adic factor with the compact integral subgroup and restricted-product exhaustion. Then construct the local density, product probability and consistent rational-dilation Radon measure. Existing measure carriers alone do not prove these compatibilities. Used in [The finite-adele scaling measure](#the-finite-adele-scaling-measure-bc-adelic-scaling-measure); [The cubic global matrix functional equation](#the-cubic-global-matrix-functional-equation-cubic-global-functional-equation); [Orders in a fixed étale cubic algebra](#orders-in-a-fixed-tale-cubic-algebra-cubic-orders-generating-series); [The two cubic poles and their residues](#the-two-cubic-poles-and-their-residues-cubic-residues-and-entire-clearance); [The degree-dependent zero at the origin](#the-degree-dependent-zero-at-the-origin-cubic-zero-at-origin); [Local density and coefficient conventions agree](#local-density-and-coefficient-conventions-agree-local-density-coefficient-comparison).

**Canonical continuation and weak topology.** Construct actual cubic continuation functions from quotient integrals and arithmetic coefficients; unconstrained fields for ξ, its dual or the residue are insufficient. The high-β homeomorphism uses weak evaluation on states and weak probability convergence, not the operator norm of functionals. Used in [The selected adelic binary-cubic zeta integral](#the-selected-adelic-binary-cubic-zeta-integral-cubic-adelic-zeta); [The cubic global matrix functional equation](#the-cubic-global-matrix-functional-equation-cubic-global-functional-equation); [The two cubic poles and their residues](#the-two-cubic-poles-and-their-residues-cubic-residues-and-entire-clearance); [High-β extremal states and unique barycentres](#high-extremal-states-and-unique-barycentres-bc-high-beta-barycentres); [The Bost–Connes phase transition](#the-bost-connes-phase-transition-kms-classification); [The degree-dependent zero at the origin](#the-degree-dependent-zero-at-the-origin-cubic-zero-at-origin).

### Examples

The four real characters modulo 8 are separated by their values at 3, 5 and 7. Squaring a nonprimitive quadratic twist does not erase its deleted Euler factors. For the affine transformations use the two explicit variable formulas before composing them; a mistaken linear action changes the polar hyperplanes. For the cubic theory verify the rational totally real and complex signatures separately, keep the automorphism weights, and use a nonprincipal ideal-class component to test the global coefficient convention.

### Dependencies

AutomorphicLFunctionsAndLocalFactors Layer 0 for Fourier and Poisson estimates; AdelicAlgebraicGroups Layer 2 for GL₂ quotient measures and inversion; ArithmeticStatistics Layers 0–3 for cubic orbits, local densities, large sieve, fourth moments and uniform cubic counts; AutomorphicSpectralTheory Layer 2 for normalized Eisenstein residues and nonconstant bounds. Layers 0–2 supply prime estimates, uniform Gamma factors and quadratic Hecke continuation.

<a id="layer-6-the-bost-connes-system-and-compact-spectral-determinants"></a>

## Layer 6: The Bost–Connes system and compact spectral determinants

Construct the rational ax+b Hecke algebra, its complex completion and the specified time evolution before defining completed states. Derive the scaling-measure correspondence, critical uniqueness, high-β probability parametrization and cyclotomic ground-state values with their topologies. In a separate branch, build scalar spectral zeta, shifted determinants and the Selberg comparison from the compact heat trace.

<a id="the-positive-rational-ax-b-subgroup-ax-plus-b-pair"></a>

### 6.1 The positive rational ax+b subgroup

axbRat is the subgroup of GL₂(Q) consisting of matrices [1 b;0 a], with a,b rational and a>0. Its product is [1,b′+ba′;0,aa′], its inverse [1,−b/a;0,1/a]. Integral translations, the diagonal map and the two named matrix families are separate constructions.

The proof proceeds as follows. Closure: [1 b; 0 a]·[1 b′; 0 a′] = [1, b′ + b a′; 0, a a′], again with positive (2,2) entry, and the inverse of [1 b; 0 a] is [1, −b/a; 0, 1/a]. P⁺_ℤ ≤ P⁺_ℚ, and the (2,2) entry is multiplicative by the product formula. Conjugation: [1 b; 0 a][1 n; 0 1] = [1, n + b; 0, a], and multiplying by [1, −b/a; 0, 1/a] gives [1, n/a; 0, 1].

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.axbRat`: P⁺_ℚ : Subgroup (GL (Fin 2) ℚ), the matrices [1 b; 0 a] with a > 0.
- `TauCeti.BostConnes.axbInt`: P⁺_ℤ : Subgroup (GL (Fin 2) ℚ), the matrices [1 n; 0 1] with n ∈ ℤ.
- `TauCeti.BostConnes.mem_axbRat_iff`: g ∈ axbRat ↔ g 1 0 = 0 ∧ g 0 0 = 1 ∧ 0 < g 1 1.
- `TauCeti.BostConnes.axbInt_le_axbRat`: axbInt ≤ axbRat.
- `TauCeti.BostConnes.diagEntry`: The (2,2) entry as a homomorphism axbRat →* ℚˣ with positive values (diagEntry_pos), diagEntry (dilation a) = a and diagEntry (translation b) = 1.
- `TauCeti.BostConnes.translation`: translation b = [1 b; 0 1] ∈ axbRat, a homomorphism from Multiplicative ℚ.
- `TauCeti.BostConnes.dilation`: dilation a = [1 0; 0 a] ∈ axbRat for a > 0.
- `TauCeti.BostConnes.conj_translation`: g · translation n · g⁻¹ = translation (n / diagEntry g).

**Checks.**

- translation (1/2) ∈ axbRat and translation (1/2) ∉ axbInt.
- The matrix [1 0; 0 −1] is invertible but not in axbRat: the positivity of a is part of the definition.
- axbInt is not a normal subgroup of axbRat (conjugate translation 1 by dilation 2).
- diagEntry ([1 1; 0 2] · [1 1/3; 0 3]) = 6.

The result must also satisfy these compatibility requirements: P⁺_ℤ is not normal in P⁺_ℚ: conjugating [1 1; 0 1] by [1 0; 0 2] gives [1 1/2; 0 1] ∉ P⁺_ℤ.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.2, (3.61)–(3.65), p. 460; [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, notations (α), (β), p. 431 (PDF p. 21).

*Needs:* `Matrix.GeneralLinearGroup`; `Matrix.GeneralLinearGroup.mkOfDetNeZero`; `Subgroup.Normal`.

<a id="the-finite-adele-scaling-measure-bc-adelic-scaling-measure"></a>

### 6.2 The finite-adele scaling measure

For β>0, the canonical scaling measure μβ on the existing finite-adele carrier has local density (1−p^(−β))/(1−p^(−1))·|x|p^(β−1) relative to normalized additive Haar, interpreted away from x=0. Its restriction to Ẑ is the product of the local probabilities; extend it to ⋃n (1/n)Ẑ by rational scaling. This unit-invariant measure is distinct from the space of all normalized scaling measures.

The proof proceeds as follows. Sum p-adic valuation shells to normalize the local measure. Construct the product probability on Ẑ and extend consistently to rational dilates in finite adeles. Verify the rational scaling law and uniqueness among the specified unit-invariant measures.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.ScalingMeasure.local`: Given p prime, the Borel measurable Padic p carrier and normalized additive Haar μ, form μ.withDensity with density ((1−p^(−β))/(1−p^(−1)))·‖x‖^(β−1) away from 0, assigned zero at 0. The Haar normalization and canonical finite-adele component adapter are the AA.0/ProfiniteArithmetic inputs.
- `TauCeti.BostConnes.ScalingMeasure.adelic`: The restricted-product measure with μβ(Ẑ)=1.
- `TauCeti.BostConnes.ScalingMeasure.scale`: μβ(q^(−1)E)=q^β μβ(E).

**Checks.**

- Atβ=1 the local measures and restricted product are additive Haar.
- μβ,p({ordp x=k})=(1−p^(−β))p^(−kβ) for k≥0.
- μβ,p(Zp×)=1−p^(−β).

The result must also satisfy these compatibility requirements: For β>0, let μβ,p on Qp have μβ,p(Zp)=1 and density (1−p^(−β))/(1−p^(−1))·|x|p^(β−1) relative to additive Haar measure with vol(Zp)=1. Form the normalized restricted-product measure μβ on A_Q,f. It obeys μβ(q^(−1)E)=q^β μβ(E) for positive rational q. The local expression is interpreted almost everywhere away from0; it is not evaluated as0^negative at the point0.

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Local product density and Proposition, p.2; normalized scaling equation (1β), p.1.

*Needs:* [GlobalNumberFields layer 4 finite adeles](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles); `IsDedekindDomain.FiniteAdeleRing`; `MeasureTheory.Measure.infinitePi`; [Normalize the local scaling density](#proof-bc-local-density-normalization).

<a id="proof-bc-local-density-normalization"></a>

**Normalize the local scaling density.** For β>0 and every integer k, μβ,p({ordp x=k})=(1−p^(−β))p^(−kβ). Summing k≥0 gives μβ,p(Zp)=1; the singleton 0 has mass 0. Multiplication by p^j scales measurable masses by p^(−jβ).

Integrate the radial density on each additive-Haar shell. Its Haar mass is (1-p^(-1))p^(-k), so the normalization constant yields (1-p^(-beta))p^(-k beta). Sum the nonnegative shells and apply a change of variables for dilation by p^j.

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Neshveyev 2000 product-density formula, p.2.

<a id="eisenstein-recurrence-polynomials-bc-eisenstein-polynomials"></a>

### 6.3 Eisenstein recurrence polynomials

Define P0=0, P1=X and Pk+1=(X²−1/4)P′k/k for k≥1 in Q[X]. For k≥1, Pk is monic of degree k. The derivative recurrence comes from the normalized cotangent identity; Pk(0) is the prescribed value at a degenerate lattice.

The proof proceeds as follows. Define recursively in Q[X]. The leading derivative coefficient k cancels division by k, preserving monicity while increasing the degree by one.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.ArithmeticEisenstein.polynomial_recurrence`: For k≥1, P(k+1)=(X²−1/4)P′k/k.
- `TauCeti.BostConnes.ArithmeticEisenstein.polynomial_monic`: For k≥1, Pk.Monic.
- `TauCeti.BostConnes.ArithmeticEisenstein.polynomial_degree`: For k≥1, Pk.natDegree=k.

**Checks.**

- P2=X²−1/4.
- P3=X³−X/4.
- P4=X⁴−X²/3+1/48.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Lemma 3.27, (3.94)–(3.97), pp.464–465.

*Needs:* `Polynomial`.

<a id="positive-spectrum-zeta-and-heat-series-spectral-zeta-series"></a>

### 6.4 Positive-spectrum zeta and heat series

For a connected compact hyperbolic surface X=Γ\H with Γ torsion-free and cocompact, genus g≥2, use Δ=−y²(∂x²+∂y²). Import the discrete spectrum0=λ0<λ1≤… with multiplicities. Define ζΔ(s)=Σj≥1 λj^(−s) on Res>1 and H(t)=Σj≥0 exp(−tλj) for t>0. The analytic continuation of ζΔ is distinguished from the totalized infinite sum. The representative positive-spectrum series is `spectralZetaSeries`; `spectralZetaSeries_smul` records its scaling law.

The proof proceeds as follows. Import the compact quotient and positive scalar Laplacian. Index the nonzero spectrum with multiplicities and omit the zero eigenvalue in ζΔ. Use Weyl growth to justify the series on their stated domains.

The required interface consists of the following operations and identities.

- `TauCeti.SpectralZeta.SpectralData.series`: The positive-spectrum complex-power series.
- `TauCeti.SpectralZeta.SpectralData.heat`: Heat series including the single zero eigenvalue.
- `TauCeti.SpectralZeta.SpectralData.continued`: The meromorphic continuation agreeing with the positive series for Res>1.

**Checks.**

- For a finite spectrum consisting of λ>0, the series is λ^(−s).
- The zero eigenvalue contributes1 to the heat series and contributes no term to ζΔ.
- Replacing each positive λ by cλ for c>0 multiplies the convergent zeta series by c^(−s).

The result must also satisfy these compatibility requirements: For a connected compact hyperbolic surface X=Γ\H with Γ torsion-free and cocompact, genus g≥2, use Δ=−y²(∂x²+∂y²). Import the discrete spectrum0=λ0<λ1≤… with multiplicities. Define ζΔ(s)=Σj≥1 λj^(−s) on Res>1 and H(t)=Σj≥0 exp(−tλj) for t>0. The analytic continuation of ζΔ is distinguished from the totalized infinite sum.

See [Peter Sarnak — Determinants of Laplacians, heights and finiteness](https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf), §1, (1.1)–(1.5), p.603.

*Needs:* ArithmeticLocallySymmetricSpaces ALS.0; AutomorphicSpectralTheory AS.4; `Complex.cpow`; [Spectral continuation output](#proof-spectral-continuation-output).

<a id="proof-spectral-continuation-output"></a>

**Spectral continuation output.** The heat-asymptotic contract yields actual positive and shifted meromorphic functions, regular at z=0, agreeing with their convergent series on Rez>1. It also yields an analytic function F=(z−1)ζ+(z) near 1. These are the fields of SpectralContinuation; existence follows from the Mellin subtraction chain, not from an arbitrary function-valued placeholder.

Assemble the normally convergent right-half-plane series, the subtracted Mellin germs and regularity at zero into actual continuation functions. Their overlapping germs agree by the identity theorem. The pole-cleared germ near one is the data used in the genus-one prefactor.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), §4, pp.13–15; Sarnak §1, p.603.

<a id="ratio-set-of-a-nonsingular-action-bc-ratio-set"></a>

### 6.5 Ratio set of a nonsingular action

Let a countable group G act nonsingularly on a nonzero standard sigma-finite measure space (X,μ), and let ρg=d(g_*μ)/dμ with g_*μ(E)=μ(g⁻¹E). RatioSet is the set of λ≥0 such that for every measurable A of positive measure and ε>0 some g has μ({x∈A∩gA:|ρg(x)−λ|<ε})>0. The derivative is evaluated at the target x.

The proof proceeds as follows. Use the Radon-Nikodym derivative of the pushforward at its target and restrict the witness set to A intersect gA. This definition records positivity and essential approximation; its general orbit-invariance and classification API is proved in the measured operator-algebra subsection of this layer.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.RatioSet.one_mem`: The identity transformation puts 1 in the ratio set.
- `TauCeti.BostConnes.RatioSet.closed`: The ratio set is closed in nonnegative reals.
- `TauCeti.BostConnes.RatioSet.orbit_invariant`: Equivalent nonsingular orbit relations have the same ratio set. The derivative convention is pushforward at the target.

**Checks.**

- For the identity action on a one-point probability space, 1 lies in the ratio set.
- For that same action, 2 does not lie in the ratio set.
- For that same action, 0 does not lie in the ratio set.

See [Sergey Neshveyev — Von Neumann algebras arising from Bost–Connes type systems](https://arxiv.org/pdf/0907.1456v1), §1 ratio-set definition, p.2.

*Needs:* `MeasureTheory.Measure.rnDeriv`.

<a id="finite-spectral-determinant-benchmark-shifted-finite-determinant"></a>

### 6.6 Finite spectral determinant benchmark

For a finite index set and eigenvalues λj define Dfin(u)=∏j(λj+u). This is the finite-dimensional version of zeta regularization; it includes zero modes. It is a separate constructor from the infinite genus-one determinant and does not substitute for tests of that family.

The proof proceeds as follows. Multiply the finitely many affine factors, including any zero-mode factor u. Polynomial analyticity and the finite product zero criterion give the API and tests; the empty product equals one.

The required interface consists of the following operations and identities.

- `TauCeti.SpectralZeta.ShiftedDet.finite_empty`: The empty determinant is 1.
- `TauCeti.SpectralZeta.ShiftedDet.finite_zero_iff`: Dfin(u)=0 iff λj+u=0 for some j.
- `TauCeti.SpectralZeta.ShiftedDet.finite_entire`: The finite determinant is entire in u.

**Checks.**

- For the empty finite spectrum the shifted determinant is 1.
- For one finite eigenvalue λ it is λ+u.
- For one eigenvalue 1/4, its pullback u=s(s−1) is (s−1/2)², giving a double zero.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), §4 (4.2)–(4.6), pp.13–15, for heat regularization and zero-mode removal; canonical product derived in this roadmap.

*Needs:* `Polynomial`.

<a id="integral-translation-subgroup-axb-integral-translations"></a>

### 6.7 Integral translation subgroup

axbInt is the subgroup of GL₂(Q) consisting of [1 n;0 1], n∈Z, and axbInt≤axbRat.

The proof proceeds as follows. Multiply the upper triangular matrices and compute inverses. The translation coordinate remains an integer, and diagonal 1 gives positivity and inclusion in axbRat.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.mem_axbInt_iff`: Membership means lower-left=0, both diagonal entries=1 and upper-right integral.
- `TauCeti.BostConnes.axbInt_le_axbRat`: The subgroup inclusion into positive rational ax+b matrices.

**Checks.**

- Translation 2 is integral.
- Translation 1/2 is rational but not integral.
- Conjugation of translation 1 by dilation 2 leaves the integral subgroup.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

*Needs:* [The positive rational ax+b subgroup](#the-positive-rational-ax-b-subgroup-ax-plus-b-pair).

<a id="translations-and-positive-dilations-axb-named-matrices"></a>

### 6.8 Translations and positive dilations

translation:Multiplicative Q→axbRat sends b to [1 b;0 1]; dilation(a), for a>0, is [1 0;0 a]. These are the normal-form coordinate maps, with diagonal values 1 and a respectively.

The proof proceeds as follows. Insert the two matrices into the subgroup membership criterion. Matrix multiplication proves translation additivity and dilation multiplicativity; evaluate the diagonal entry directly.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.translation`: Additive rational translations written as a multiplicative homomorphism.
- `TauCeti.BostConnes.dilation`: The positive rational diagonal matrix.
- `TauCeti.BostConnes.diagEntry_translation`: Every translation has diagonal value 1.
- `TauCeti.BostConnes.diagEntry_dilation`: The diagonal value of dilation(a) is a.

**Checks.**

- Translation 0 is the identity.
- Dilation 1 is the identity.
- Translations 1/2 and 1/3 compose to translation 5/6.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

*Needs:* [The positive rational ax+b subgroup](#the-positive-rational-ax-b-subgroup-ax-plus-b-pair).

<a id="ergodicity-of-positive-rationals-on-finite-adeles-bc-critical-ergodicity"></a>

### 6.9 Ergodicity of positive rationals on finite adeles

For0<β≤1 the Q+× action on(A_Q,f,μβ) is ergodic: every invariant L² function on the compact integral slice is constant, and rational dilates cover the finite adeles.

The proof proceeds as follows. For the trivial character compute the projection constant. For every nontrivial dense character use the zero projection limit. Pass by L² density and the rational-dilate exhaustion.

The result must also satisfy these compatibility requirements: For0<β≤1 the Q+× action on(A_Q,f,μβ) is ergodic: every invariant L² function on the compact integral slice is constant, and rational dilates cover the finite adeles.

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Proposition and complete proof, pp.2–3.

*Needs:* [The finite-adele scaling measure](#the-finite-adele-scaling-measure-bc-adelic-scaling-measure); [qualitative prime asymptotics](#prerequisites-and-boundaries); `lp`; [Finite-prime orbit projection](#proof-bc-finite-prime-projection); [Local characters form a dense family](#proof-bc-local-character-density); [Reciprocal primes in progressions](#proof-bc-prime-progression-divergence); [Nontrivial characters are annihilated in the critical interval](#proof-bc-nontrivial-character-projection); [Decreasing orthogonal projections](#proof-bc-decreasing-projections).

<a id="proof-bc-finite-prime-projection"></a>

**Finite-prime orbit projection.** For a finite prime set A, NA is its generated multiplicative monoid and WA={x∈Ẑ:xp∈Zp× for p∈A}. On WA the projection to NA-invariant functions is PAf(x)=ζA(β)^(−1)Σn∈NA n^(−β)f(nx), extended along NA-orbits, where ζA(β)=∏p∈A(1−p^(−β))^(−1).

Decompose Ẑ into disjoint nWA for n∈NA up to the measure-zero zero-coordinate set. Use μβ(nE)=n^(−β)μβ(E). Check conditional expectation, invariant range and idempotence in L².

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Proposition proof, projection formula (2) and verification, p.2.

<a id="proof-bc-local-character-density"></a>

**Local characters form a dense family.** Functions depending on finitely many p-adic coordinates and valuation shells, with characters of local unit quotients, span a dense subspace of L²(Ẑ,μβ).

Approximate by finite-coordinate cylinder functions. Decompose each coordinate into its countable valuation shells. Use finite character orthogonality on the compact local unit quotients.

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Proposition proof, local characters and valuation translates, pp.2–3.

<a id="proof-bc-prime-progression-divergence"></a>

**Reciprocal primes in progressions.** Fix N≥1 and a coprime to N. The fixed-progression prime asymptotic π(X;N,a)∼Li(X)/φ(N) implies Σp≤X,p≡a(modN)1/p=(1/φ(N))log log X+o(log log X). In particular Σp≡a(modN)p^(−β) diverges for 0<β≤1.

Apply partial summation to π(t;N,a): π(X)/X+integral from 2 to X of π(t)/t² dt. Use the asymptotic with a fixed relative error on large t and squeeze the integral against (1/φ(N)) integral dt/(t log t). For β≤1, p^(−β)≥1/p.

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Proposition proof, p.3 (Dirichlet input); partial summation is the local refinement.

<a id="proof-bc-nontrivial-character-projection"></a>

**Nontrivial characters are annihilated in the critical interval.** For0<β≤1 and a nontrivial local unit characterχ, the increasing-prime projections P_Aχ tend to0: their product coefficients contain factors (1−p^(−β))/(1−χ(p)p^(−β)), and divergence of the prime reciprocal sum in a suitable character sector forces the product to0.

Compute the geometric prime-power factors in the finite-prime average. Choose a congruence sector where Reχ(p)<0. Use the fixed-progression prime theorem to obtain divergence of Σp p^(−β), not merely infinitude of primes.

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Proposition proof, nontrivial character product and progression argument, p.3.

<a id="proof-bc-decreasing-projections"></a>

**Decreasing orthogonal projections.** Let Hn be a decreasing sequence of closed subspaces of a Hilbert space and H=intersection Hn. Their orthogonal projections Pn satisfy ‖Pn v−P v‖→0 for every v. In the finite-prime exhaustion, Hn consists of functions invariant under multiplication by all primes in its first n entries.

For m≥n, orthogonality gives ‖Pn v−Pm v‖²=‖Pn v‖²−‖Pm v‖². The decreasing norm squares make Pn v Cauchy. Its limit lies in every Hn and has the defining projection orthogonality to H.

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Projection exhaustion in the Proposition proof, p.2.

<a id="all-normalized-scaling-measures-bc-scaling-measure-space"></a>

### 6.10 All normalized scaling measures

For β>0, a β-scaling measure is a positive Radon measure μ on A_f with μ(Ẑ)=1 and μ(qE)=q^(−β)μ(E) for every positive rational q and Borel set E. These two conditions force μ({0})=0. No unit invariance is assumed; the canonical product measure is one element.

The proof proceeds as follows. State Radon regularity, normalization and the rational scaling law on the existing finite-adele carrier. Apply the law with q=2 to the fixed singleton zero. Its mass is finite because {0}⊆Ẑ and μ(Ẑ)=1; since β>0, the factor 2^(−β) differs from 1, forcing that mass to vanish.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.IsScalingMeasure.normalized`: The integral-adeles mass equals 1.
- `TauCeti.BostConnes.IsScalingMeasure.scale`: Every positive rational dilation scales mass by q^(−β).
- `TauCeti.BostConnes.IsScalingMeasure.zero_atom`: The singleton 0 has zero mass.
- `TauCeti.BostConnes.IsScalingMeasure.convex`: Convex mixtures at fixed β stay in the space.

**Checks.**

- The zero measure is not normalized.
- The atom at 0 is normalized but violates scaling for q=2 and β>0. At β=0 it satisfies the scaling law and has μ({0})=1, so positivity of β is essential for `zero_atom`.
- The product-density measure satisfies the normalized scaling predicate.

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Neshveyev 2000 (1β), p.1.

*Needs:* [The finite-adele scaling measure](#the-finite-adele-scaling-measure-bc-adelic-scaling-measure).

<a id="the-scalar-selberg-primitive-geodesic-product-selberg-primitive-product"></a>

### 6.11 The scalar Selberg primitive-geodesic product

For the same compact torsion-free quotient, let PΓ be primitive hyperbolic conjugacy classes, with the orientation/conjugacy convention of Zagier(2). For each p let ℓp=log N(p)>0. Define ZΓ(s)=∏p∈PΓ ∏k≥0 (1−exp(−(s+k)ℓp)) for Res>1; its entire continuation is separate. Primitive conjugacy classes, their inverses and geometric unoriented geodesics are not interchanged without the multiplicity comparison.

The proof proceeds as follows. Import primitive hyperbolic classes and their length normalization. Use a geodesic-count growth bound to prove absolute local product convergence. Define the continuation only after the trace-formula comparison.

The required interface consists of the following operations and identities.

- `TauCeti.SpectralZeta.Selberg.product`: The displayed double Euler product in Res>1.
- `TauCeti.SpectralZeta.Selberg.continued`: The entire continuation with the same product on Res>1.
- `TauCeti.SpectralZeta.Selberg.log_derivative`: Z′/Z=Σp Σm≥1 ℓp exp(−msℓp)/(1−exp(−mℓp)) in Res>1.

**Checks.**

- One primitive class of lengthℓ contributes ∏k≥0(1−e^(−(s+k)ℓ)); its powers are counted by m in the logarithmic derivative.
- Disjoint primitive class lists multiply their products in the convergence domain.
- Replacing the source class list by two copies squares the product; it changes the theorem unless its multiplicities are corrected.

The result must also satisfy these compatibility requirements: For the same compact torsion-free quotient, let PΓ be primitive hyperbolic conjugacy classes, with the orientation/conjugacy convention of Zagier(2). For each p let ℓp=log N(p)>0. Define ZΓ(s)=∏p∈PΓ ∏k≥0 (1−exp(−(s+k)ℓp)) for Res>1; its entire continuation is separate. Primitive conjugacy classes, their inverses and geometric unoriented geodesics are not interchanged without the multiplicity comparison.

See [Don Zagier — New points of view on the Selberg zeta function](https://people.mpim-bonn.mpg.de/zagier/files/tex/NewPointsSelbergZeta/fulltext.pdf), §1, (1)–(2), pp.1–2.

*Needs:* [Positive-spectrum zeta and heat series](#positive-spectrum-zeta-and-heat-series-spectral-zeta-series); AutomorphicSpectralTheory AS.6; ArithmeticLocallySymmetricSpaces ALS.0.

<a id="spectral-zeta-is-regular-at-zero-spectral-regularity-zero"></a>

### 6.12 Spectral zeta is regular at zero

The positive spectral zeta continues meromorphically, and is analytic at0 because Γ(s)^(−1) has a simple zero there, canceling the possible simple Mellin pole. Its derivative at0 is well defined.

The proof proceeds as follows. Continue successively using finite heat subtractions. Use Γ(s+1)=sΓ(s) and Γ(1)=1 at0. Differentiate the resulting holomorphic expression, never the divergent original series.

The result must also satisfy these compatibility requirements: The positive spectral zeta continues meromorphically, and is analytic at0 because Γ(s)^(−1) has a simple zero there, canceling the possible simple Mellin pole. Its derivative at0 is well defined.

See [Peter Sarnak — Determinants of Laplacians, heights and finiteness](https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf), §1, (1.1)–(1.5), p.603.

*Needs:* [Positive-spectrum zeta and heat series](#positive-spectrum-zeta-and-heat-series-spectral-zeta-series); AutomorphicSpectralTheory AS.4; `mellin`; `Complex.Gamma`; [The compact discrete-spectrum input](#proof-compact-spectrum-and-weyl); [Weyl bounds imply spectral summability](#proof-spectral-weyl-summability); [Heat Mellin identity](#proof-heat-mellin-on-right-half-plane); [Exponential heat decay after zero subtraction](#proof-heat-large-time-tail); [Subtracting small-time heat coefficients](#proof-heat-small-time-subtraction); [Holomorphic remainder after heat subtraction](#proof-heat-subtracted-holomorphy); [Spectral continuation output](#proof-spectral-continuation-output).

<a id="proof-compact-spectrum-and-weyl"></a>

**The compact discrete-spectrum input.** AS.4 supplies a complete orthonormal scalar eigenbasis with finite multiplicities and Weyl counting N(Λ)~area(X)Λ/(4π). Connectedness gives the simple zero eigenvalue.

Specialize the compact Hilbert-sum decomposition. Identify the scalar positive Laplacian and its kernel. Use the supplied heat/Weyl asymptotics rather than treating compactness alone as a spectrum theorem.

See [Peter Sarnak — Determinants of Laplacians, heights and finiteness](https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf), §1, (1.1)–(1.5), p.603.

<a id="proof-spectral-weyl-summability"></a>

**Weyl bounds imply spectral summability.** For a nonnegative spectrum with one zero mode, finite multiplicities and counting function N(R)≤CR for R≥1, Σλj>0 λj^(−σ) converges for σ>1, locally uniformly in complex σ on Res>1. Also Σexp(−tλj) converges locally uniformly for t>0 and Σλj>0 λj^(−2)<∞.

Use dyadic blocks 2^k≤λ<2^(k+1), each of size O(2^k). For complex parameters take the real-part infimum on the compact domain. Exponential decay dominates the same dyadic counts for heat sums.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), §4 small-time/discrete-spectrum assumptions, pp.13–15; Sarnak §1 (1.2)–(1.3), p.603.

<a id="proof-heat-mellin-on-right-half-plane"></a>

**Heat Mellin identity.** For Res>1, ζΔ(s)=Γ(s)^(−1)∫0∞(H(t)−1)t^(s−1)dt.

Use positive-spectrum Weyl bounds to dominate the small-t integral. Use the positive spectral gap for exponential decay as t→∞. Apply dominated interchange and the scalar gamma integral term by term.

See [Peter Sarnak — Determinants of Laplacians, heights and finiteness](https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf), §1, (1.1)–(1.5), p.603.

<a id="proof-heat-large-time-tail"></a>

**Exponential heat decay after zero subtraction.** If λ1>0 and the Weyl bound holds, then for t≥1, |H(t)−1|≤C exp(−λ1 t/2), with C=Σj≥1 exp(−λj/2)<∞. Consequently the Mellin integral from 1 to infinity is entire in its parameter.

Monotonicity gives lambda_j>=lambda_1 for all positive modes. Split exp(-t lambda_j) into exp(-t lambda_j/2) times itself and bound one factor by exp(-t lambda_1/2). Weyl summability bounds the remaining sum at t>=1; every Mellin derivative is integrable against this exponential tail.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), §4 continuation argument, pp.13–15; Sarnak §1, p.603.

<a id="proof-heat-small-time-subtraction"></a>

**Subtracting small-time heat coefficients.** Write H(t)=Σj≥0 exp(−tλj), including its simple zero mode. The positive spectral Mellin integral uses H(t)−1. If H(t)=Σk=0.N ak t^(k−1)+O(t^N), then subtract Σk=0.N ak t^(k−1)−1. Its integral on (0,1) is Σk=0.N ak/(s+k−1)−1/s. The remainder integral is holomorphic for Re s>−N under locally uniform remainder bounds; thus the coefficient at s=0 is a1−1, not a1.

Obtain uniform heat-remainder bounds from the heat-kernel supplier. Split the Mellin integral of H(t)−1 at 1; subtract the zero mode along with the finite heat expansion. Integrate the polynomial to Σ ak/(s+k−1)−1/s and dominate the remainder locally for Re s>−N.

See [Peter Sarnak — Determinants of Laplacians, heights and finiteness](https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf), §1, (1.1)–(1.5), p.603.

<a id="proof-heat-subtracted-holomorphy"></a>

**Holomorphic remainder after heat subtraction.** If H(t)=Σk=0.N ak t^(k−1)+RN(t), with |RN(t)|≤CN t^N on (0,1], then integral_0^1 t^(z−1)RN(t)dt is holomorphic for Rez>−N, locally uniformly in z. For the positive heat trace H−1 the rational terms are Σk=0.N ak/(z+k−1)−1/z.

On a compact parameter set use the lower real-part bound −N+δ and integrable majorant t^(δ−1). Parameter derivatives introduce powers of log t, still integrable; the rational terms are separate germ identities.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), §4 (4.5)–(4.6), pp.14–15; positive-spectrum correction from Sarnak (1.3), p.603.

<a id="entire-shifted-determinant-shifted-entire-determinant"></a>

### 6.13 Entire shifted determinant

The canonical shifted determinant D is entire in u, agrees with the zeta determinant for Reu>0, has D(u)/u→det′Δ at 0, and includes all eigenvalues with their multiplicities. Its function, rather than a branch of its logarithm, is continued.

The proof proceeds as follows. The sum of inverse squared positive eigenvalues converges, so the genus-one canonical product converges normally on all compact u sets. Its exponential prefactor is entire and nonzero. Compare on Re u>0 by integrating the shifted-zeta derivative, fixing the constant at zero.

The required interface consists of the following operations and identities.

- `TauCeti.SpectralZeta.ShiftedDet.entire`: The whole shifted family is entire.
- `TauCeti.SpectralZeta.ShiftedDet.agrees`: On Reu>0 it is the exponentiated derivative of the jointly continued ζu.
- `TauCeti.SpectralZeta.ShiftedDet.zero_mode`: D(u)/u tends to det′Δ at u=0, retaining the simple zero mode.

**Checks.**

- The actual infinite-family determinant vanishes at u=0, retaining the zero eigenvalue.
- At u=1, the actual genus-one family equals exp(−ζ1′(0)).
- If eigenvalue λ1=1/4, the actual infinite determinant at −1/4 vanishes; its quadratic pullback multiplicity is governed by the exact zero-divisor lemma.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), §4 (4.2)–(4.6), pp.13–15, for heat regularization and zero-mode removal; canonical product derived in this roadmap.

*Needs:* [Positive-spectrum zeta and heat series](#positive-spectrum-zeta-and-heat-series-spectral-zeta-series); AutomorphicSpectralTheory AS.4; `mellin`; `Complex.Gamma`; [The compact discrete-spectrum input](#proof-compact-spectrum-and-weyl); [Weyl bounds imply spectral summability](#proof-spectral-weyl-summability); [Heat Mellin identity](#proof-heat-mellin-on-right-half-plane); [Exponential heat decay after zero subtraction](#proof-heat-large-time-tail); [Subtracting small-time heat coefficients](#proof-heat-small-time-subtraction); [Holomorphic remainder after heat subtraction](#proof-heat-subtracted-holomorphy); [Two-parameter shifted spectral zeta](#proof-shifted-zeta-holomorphic); [Genus-one determinant product](#proof-shifted-genus-one-product).

<a id="proof-shifted-zeta-holomorphic"></a>

**Two-parameter shifted spectral zeta.** On Reu>0, Rez>1 define ζu(z)=Σj≥0 exp(−z Log(λj+u)) with the principal logarithm. Compact-uniform Weyl bounds give joint holomorphy. Heat subtraction with exp(−ut) continues it meromorphically in z, jointly holomorphic in u, and regular at z=0. It satisfies ∂u ζu(z)=−z ζu(z+1) where both sides are initially convergent, hence as germs.

Bound lambda+u away from the principal logarithm cut on compact subsets of Re u>0. Weyl estimates dominate the series and derivatives for Re z>1. Multiply the full heat expansion by exp(-ut), subtract finitely many terms, and continue the resulting Mellin germs jointly.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), §4 Laplace–Mellin continuation, pp.13–15; Theorem 6.1 determinant argument, p.20.

<a id="proof-shifted-genus-one-product"></a>

**Genus-one determinant product.** Let ζ+ be the positive spectral continuation and F(z) its analytic pole clearance (z−1)ζ+(z) near 1. The shifted determinant extends as D(u)=u exp(−ζ+′(0)+F′(1)u)∏j≥1(1+u/λj)exp(−u/λj). The product is normally convergent on all compact u sets since Σλj^(−2)<∞. On Reu>0 it equals exp(−∂z ζu(0)).

Differentiate log(D(u)/u) twice; heat/Mellin differentiation gives −Σj≥1(λj+u)^(−2). The genus-one product has the same second derivative, so the quotient is exp(a+bu). At u=0 the constant is det′Δ; the linear coefficient is the finite part of ζ+ at 1, namely F′(1).

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), §4 (4.2)–(4.6), pp.13–15, for heat regularization and zero-mode removal; canonical product derived in this roadmap.

<a id="positive-diagonal-homomorphism-axb-diagonal-map"></a>

### 6.14 Positive diagonal homomorphism

diagEntry:axbRat→Q× takes the lower-right entry, is multiplicative and has positive rational values. It is invariant under left and right integral translations.

The proof proceeds as follows. The lower-left zero entry removes the cross term in the lower-right product. Positivity gives a nonzero rational unit; integral translations have diagonal 1, so both coset actions preserve this unit.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.diagEntry_pos`: The rational value is positive.
- `TauCeti.BostConnes.diagEntry_coset_invariant`: The value descends to an ax+b double coset.
- `TauCeti.BostConnes.diagEntry_translation`: Every translation has diagonal value one.

**Checks.**

- The identity has diagonal value 1.
- Dilation 2 has value 2.
- Values 2 and 3 multiply to 6.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

*Needs:* [The positive rational ax+b subgroup](#the-positive-rational-ax-b-subgroup-ax-plus-b-pair); [Integral translation subgroup](#integral-translation-subgroup-axb-integral-translations).

<a id="the-regularized-scalar-laplace-determinant-spectral-regularized-determinant"></a>

### 6.15 The regularized scalar Laplace determinant

If the meromorphic continuation ζΔ is analytic at0, define det′Δ=exp(−ζ′Δ(0)). For real v>0 use all eigenvalues includingλ0 in ζΔ+v(z)=Σj≥0(λj+v)^(−z), continued to z=0, and det(Δ+v)=exp(−∂z ζΔ+v(0)). A prime removes zero modes. No ordinary divergent eigenvalue product is assigned a value.

The proof proceeds as follows. Prove regularity at0 via the heat Mellin argument. Take the complex derivative of that continuation and exponentiate its negative. For the shifted determinant, use v>0 to keep all eigenvalues positive.

The required interface consists of the following operations and identities.

- `TauCeti.SpectralZeta.RegularizedDet.ofZeta`: For the analytic continuation f at0, exp(−f′(0)).
- `TauCeti.SpectralZeta.RegularizedDet.shifted`: The determinant from the shifted spectral continuation.
- `TauCeti.SpectralZeta.RegularizedDet.scale`: det′(cΔ)=c^(ζΔ(0))det′Δ for c>0.

**Checks.**

- A finite one-eigenvalue spectrum gives determinantλ.
- An empty positive spectrum gives1.
- A finite two-eigenvalue spectrum gives λ1λ2, including multiplicities.

The result must also satisfy these compatibility requirements: If the meromorphic continuation ζΔ is analytic at0, define det′Δ=exp(−ζ′Δ(0)). For real v>0 use all eigenvalues includingλ0 in ζΔ+v(z)=Σj≥0(λj+v)^(−z), continued to z=0, and det(Δ+v)=exp(−∂z ζΔ+v(0)). A prime removes zero modes. No ordinary divergent eigenvalue product is assigned a value.

See [Peter Sarnak — Determinants of Laplacians, heights and finiteness](https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf), §1, (1.1)–(1.5), p.603.

*Needs:* [Positive-spectrum zeta and heat series](#positive-spectrum-zeta-and-heat-series-spectral-zeta-series); `mellin`; `Complex.Gamma`; [Spectral zeta is regular at zero](#spectral-zeta-is-regular-at-zero-spectral-regularity-zero).

<a id="p-p-is-a-hecke-pair-ax-plus-b-hecke-triple"></a>

### 6.16 (P⁺_ℚ, P⁺_ℤ) is a Hecke pair

IsHeckeTriple (axbRat as a submonoid) axbInt axbInt: every g ∈ P⁺_ℚ commensurates P⁺_ℤ. Explicitly, for a(g) = n/m in lowest terms, P⁺_ℤ ∩ g P⁺_ℤ g⁻¹ is the translation group by mℤ, of index m in P⁺_ℤ and index n in g P⁺_ℤ g⁻¹. Equivalently (Bost–Connes' condition), the orbits of P⁺_ℤ on P⁺_ℚ/P⁺_ℤ are finite.

The proof proceeds as follows. By ax-plus-b-pair, g P⁺_ℤ g⁻¹ is translation by (m/n)ℤ, and ℤ ∩ (m/n)ℤ = mℤ because gcd(m, n) = 1. The two indices are [ℤ : mℤ] = m and [(m/n)ℤ : mℤ] = n, both finite, so g lies in the commensurator of P⁺_ℤ. IsHeckeTriple.of_diagonal applies with H = P⁺_ℤ ≤ P⁺_ℚ.

The result must also satisfy these compatibility requirements: For g = dilation 2 the two indices are 1 and 2; for g = dilation (1/2) they are 2 and 1.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.2, (3.62), p. 460.

*Needs:* [The positive rational ax+b subgroup](#the-positive-rational-ax-b-subgroup-ax-plus-b-pair); `IsHeckeTriple`; `IsHeckeTriple.of_diagonal`; `Subgroup.Commensurable`; `Subgroup.relIndex`; [Integral translation subgroup](#integral-translation-subgroup-axb-integral-translations); [Translations and positive dilations](#translations-and-positive-dilations-axb-named-matrices); [Positive diagonal homomorphism](#positive-diagonal-homomorphism-axb-diagonal-map); [Conjugation of translations](#proof-axb-conjugation).

<a id="proof-axb-conjugation"></a>

**Conjugation of translations.** For g∈axbRat and b∈Q, g translation(b) g⁻¹=translation(b/diagEntry(g)).

Use the explicit inverse matrix and multiply all three factors. The upper-right entry is b/a and the diagonal is 1.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

<a id="the-compact-selberg-determinant-comparison-selberg-determinant-comparison"></a>

### 6.17 The compact Selberg determinant comparison

For the selected scalar compact surface, det(Δ+s(s−1))=ZΓ(s)I_g(s) exp(2(g−1)[2ζ′(−1)−log√(2π)]) for real s>1, extended by the proved analytic continuation. Thus det′Δ=Z′Γ(1)(2π)^(g−1)exp(4(g−1)ζ′(−1)). The sign is the corrected v2 sign; source v1(1.3) has the opposite Euler-characteristic sign.

The proof proceeds as follows. Combine the hyperbolic and identity Laplace–Mellin derivatives. Determine the additive logarithmic constant from the prescribed large-s expansion. At s=1 remove the simple zero eigenvalue and use Γ(1)=G(2)=1.

The result must also satisfy these compatibility requirements: For the selected scalar compact surface, det(Δ+s(s−1))=ZΓ(s)I_g(s) exp(2(g−1)[2ζ′(−1)−log√(2π)]) for real s>1, extended by the proved analytic continuation. Thus det′Δ=Z′Γ(1)(2π)^(g−1)exp(4(g−1)ζ′(−1)). The sign is the corrected v2 sign; source v1(1.3) has the opposite Euler-characteristic sign.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), §6 Theorem 6.1 (6.1), pp.20–24, scalar m=0 and trivial representation; §8.3 (8.8), p.28.

*Needs:* [The regularized scalar Laplace determinant](#the-regularized-scalar-laplace-determinant-spectral-regularized-determinant); [Spectral zeta is regular at zero](#spectral-zeta-is-regular-at-zero-spectral-regularity-zero); [The scalar Selberg primitive-geodesic product](#the-scalar-selberg-primitive-geodesic-product-selberg-primitive-product); AutomorphicSpectralTheory AS.6; [Positive-spectrum zeta and heat series](#positive-spectrum-zeta-and-heat-series-spectral-zeta-series); AutomorphicSpectralTheory AS.4; `Complex.Gamma`; `mellin`; [Barnes G-function](#barnes-g-function-barnes-g-function); [Entire shifted determinant](#entire-shifted-determinant-shifted-entire-determinant); [The compact discrete-spectrum input](#proof-compact-spectrum-and-weyl); [Compact geodesic-series majorant](#proof-selberg-geodesic-majorant); [Logarithmic derivative of the primitive product](#proof-selberg-log-product); [The compact scalar heat trace input](#proof-scalar-heat-trace-formula); [Elementary half-order Laplace integral](#proof-selberg-laplace-integral); [Normal convergence of the hyperbolic transform](#proof-selberg-transform-normal-convergence); [Hyperbolic transform is the Selberg logarithm](#proof-hyperbolic-laplace-mellin); [Identity contribution and Barnes normalization](#proof-identity-barnes-transform); [Branch-independent identity factor](#proof-selberg-identity-germ).

<a id="proof-selberg-geodesic-majorant"></a>

**Compact geodesic-series majorant.** The primitive length spectrum has positive systole ℓ0, finite counts below any height and Nprim(T)≤Cexp(T). These imply compact-normal convergence of Σp,m≥1 exp(−msℓp)/(m(1−exp(−mℓp))) on Res>1, including its s derivatives. Each primitive conjugacy class uses exactly the orientation convention of the Gaussian trace supplier.

Use the positive systole to bound the geometric denominator away from zero. Sum in unit length intervals using the exponential count; on a compact right half-plane the surplus real exponent absorbs the polynomial factors produced by derivatives.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), §5 Lemma 5.1 proof, (5.9)–(5.11), pp.16–17; scalar representation.

<a id="proof-selberg-log-product"></a>

**Logarithmic derivative of the primitive product.** For Res>1, expand log(1−e^(−(s+k)ℓp)) and sum k geometrically. This gives Z′/Z=Σp,m≥1 ℓp e^(−msℓp)/(1−e^(−mℓp)), locally uniformly.

Use the geodesic-count bound with a strict real-part margin. Justify derivative and summation interchanges. Sum the k-series and preserve the primitive/power weights.

See [Don Zagier — New points of view on the Selberg zeta function](https://people.mpim-bonn.mpg.de/zagier/files/tex/NewPointsSelbergZeta/fulltext.pdf), §1, (1)–(2), pp.1–2.

<a id="proof-scalar-heat-trace-formula"></a>

**The compact scalar heat trace input.** For t>0, H(t)=area(X)/(4π)∫R r tanh(πr)e^(−t(r²+1/4))dr +Σp,m≥1 ℓp/[2sinh(mℓp/2)] · e^(−t/4−(mℓp)²/(4t))/√(4πt). Class multiplicities agree with the primitive list fixed above. There are no cusp, elliptic or continuous-spectrum terms in this selected compact torsion-free case.

Supply the heat test function and its Fourier transform with exact constants. Prove the trace formula accepts this noncompactly supported test function by approximation and convergence. Match spectral, identity and primitive hyperbolic terms.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), §5 equations (5.1)–(5.3), p.16, scalar trivial twist m=0; remove the 1/4 operator shift; no elliptic terms.

<a id="proof-selberg-laplace-integral"></a>

**Elementary half-order Laplace integral.** For a>0, Re w>0 and Re(w²)>0, the convergent integral ∫₀∞ t^(−3/2) exp(−w²t−a²/(4t)) dt equals (2√π/a) exp(−aw). This integral-defined function has a holomorphic continuation to Re w>0 given by the same exponential expression; the original integral is not asserted to converge throughout that half-plane. The elementary half-order evaluation avoids a general Bessel-function package.

For positive real w reduce by t=a²/(4v²) to a Gaussian integral and differentiate the usual Gaussian parameter identity. Use a common integrable majorant on compact subsets of Re(w²)>0, Rew>0. The resulting exponential expression extends to the right w half-plane.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), §5 (5.10), Lemma 5.3 and Proposition 5.4, pp.17–18.

<a id="proof-selberg-transform-normal-convergence"></a>

**Normal convergence of the hyperbolic transform.** For the scalar compact trace, choose Rew>0 and Re(w²)>C with w=s−1/2 and C large enough for the geodesic count. The heat transform is jointly holomorphic in z,s on this region, locally uniform for every compact z set; sum, integral and z derivative may be interchanged. Continuation, not the integral itself, is then used outside this region.

Use the exponential length bound and the systole to dominate each term uniformly for compact parameter sets. Integrable decay at 0 comes from exp(−ℓ²/(4t)); at infinity it comes from Re(w²)>C. Log powers from z derivatives retain the same exponential majorant.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), §5 Lemmas 5.1–5.3, pp.16–18, with the explicit safe region.

<a id="proof-hyperbolic-laplace-mellin"></a>

**Hyperbolic transform is the Selberg logarithm.** For real s>1, the Laplace–Mellin transform of the hyperbolic heat contribution in the shifted determinant has derivative at Mellin exponent0 equal to−log ZΓ(s). This is the scalar specialization of JSS Proposition5.4; the integral proof uses the explicit Laplace identity and the compact-uniform geodesic majorant.

Use e^(−t(s−1/2)²) after factoring e^(−t/4) from the heat trace. Evaluate the scalar Gaussian Laplace–Mellin integral term by term. Use the absolute geodesic sum and the primitive product expansion.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), §5 Lemmas 5.1–5.3 and Proposition 5.4, pp.17–18; determinant proof §6.

<a id="proof-identity-barnes-transform"></a>

**Identity contribution and Barnes normalization.** Let C=area(X)/(4π)=g−1. The scalar identity factor is I_g(s)=exp(2C[s log(2π)+s(1−s)+logΓ(s)−2logG(s+1)]), where G is the classical Barnes G-function normalized by G(1)=1, G(s+1)=Γ(s)G(s) and the source asymptotic expansion. The full normalization/asymptotic input is required; recurrence alone is insufficient.

Differentiate the identity Laplace–Mellin term in s and evaluate the contour integral as the digamma combination in JSS(6.5). Use the normalized Barnes logarithmic derivative (source(2.8)). Recover the integration constant from the large-real-s asymptotics, as in the final paragraph of the proof. Check the scalar derivative −2C(2s−1)ψ(s) using (2.8). This agrees with the identity heat transform and (8.4). Do not specialize the incompatible Gamma coefficient in (6.2); source issue the normalization convention records that discrepancy.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), §6 proof of Theorem 6.1, (6.5)–(6.7) and asymptotic constant, pp.21–24; (2.8)–(2.9), p.9; scalar (8.4), p.27.

<a id="proof-selberg-identity-germ"></a>

**Branch-independent identity factor.** For integer g≥2, the scalar identity factor has the single-valued meromorphic form I_g(s)=(2π)^(2(g−1)s) exp(2(g−1)s(1−s)) Γ(s)^(2(g−1))/G(s+1)^(4(g−1)). It equals the stated exponential logarithmic formula on a simply connected right-half-plane. Its integer exponents remove logarithm branch ambiguity.

Exponentiate the logarithmic formula on a simply connected right-half-plane. The integer genus-dependent exponents turn the Gamma and Barnes factors into a single-valued meromorphic function. Equality on the original domain identifies its continuation.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), Scalar formula (8.4), p.27, checked against §6 (6.5)–(6.7), pp.21–23; the conflicting literal specialization of (6.2), p.20, is recorded in the normalization convention.

<a id="the-bost-connes-hecke-algebra-bost-connes-hecke-algebra"></a>

### 6.18 The Bost–Connes Hecke algebra

For a field K of characteristic zero, the Bost–Connes Hecke algebra is BCHecke K = 𝕋 P⁺_ℚ P⁺_ℤ K, Tau Ceti's Hecke ring of the Hecke pair of ax-plus-b-hecke-triple with coefficients in K: finitely supported K-valued functions on double cosets, with Shimura's convolution product. Its product is the Bost–Connes convolution (f₁ ∗ f₂)(g) = Σ_{g₁ ∈ Γ/Γ₀} f₁(g₁) f₂(g₁⁻¹g) (BC (1)), because Tau Ceti's multiplicity counts pairs of left-coset representatives. K = ℚ gives the rational Hecke algebra H_ℚ(Γ, Γ₀) of ℚ-valued functions, and K = ℂ gives BC's H. The named elements are x_n = [X_n] with X_n the class of dilation n, x′_n = [X_n⁻¹] the class of dilation (1/n), and e(γ) = [class of translation γ] for γ ∈ ℚ/ℤ. For K = ℂ the involution is f*(X) = conj f(X⁻¹), which sends x_n to x′_n and e(γ) to e(−γ).

Assume K a field of characteristic zero (for the involution, K = ℂ).

The proof proceeds as follows. The ring structure is Tau Ceti's HeckeCosetModule.instRingHeckeRing for the Hecke triple of ax-plus-b-hecke-triple; the K-algebra structure is the coefficientwise scalar action. Agreement with BC's convolution: for double cosets D₁ = Γ₀gΓ₀ = ⊔ σᵢgΓ₀ and D₂ = Γ₀hΓ₀ = ⊔ τⱼhΓ₀, (1_{D₁} ∗ 1_{D₂})(d) counts the i with d ∈ σᵢ g D₂, and for each such i exactly one j has dΓ₀ = σᵢ g τⱼ h Γ₀; this is Tau Ceti's multiplicity m(g, h; d). e(γ) depends only on γ mod ℤ, since the class of translation b is b mod ℤ + 1·ℤ (double-cosets-and-degrees). The involution: Γ is a group, so X ↦ X⁻¹ is an involution of the double cosets that reverses products (the multiplicity of (h⁻¹, g⁻¹; d⁻¹) equals that of (g, h; d), with degrees exchanged as in BC (2)); with complex conjugation of coefficients it is a conjugate-linear anti-automorphism.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.BCHecke`: BCHecke K := HeckeRing axbRat.toSubmonoid axbInt K, with Ring and Algebra K instances.
- `TauCeti.BostConnes.BCHecke.x`: x n = single [X_n] for n : ℕ+, X_n the double coset of dilation n.
- `TauCeti.BostConnes.BCHecke.x'`: x' n = single [X_n⁻¹], the double coset of dilation (1/n).
- `TauCeti.BostConnes.BCHecke.e`: e : ℚ/ℤ → BCHecke K (AddCircle (1 : ℚ) as ℚ/ℤ), e γ = single [class of translation γ].
- `TauCeti.BostConnes.BCHecke.e_zero`: e 0 = 1.
- `TauCeti.BostConnes.BCHecke.e_add`: e (γ + δ) = e γ * e δ.
- `TauCeti.BostConnes.BCHecke.mul_eq_convolution`: (f₁ * f₂) evaluated at the class of d is Σ over left cosets g₁Γ₀ of f₁(g₁) f₂(g₁⁻¹d): Tau Ceti's product is Bost–Connes' convolution (1).
- `TauCeti.BostConnes.BCHecke.star`: For K = ℂ: a StarRing structure with (star f) X = conj (f X⁻¹), star (x n) = x' n, star (e γ) = e (−γ).
- `TauCeti.BostConnes.BCHecke.map`: A field homomorphism φ:K→L induces a ring homomorphism on coefficients, compatible with x, x′ and e. If an algebra structure on L induced by φ is supplied it is a K-algebra homomorphism. The rational inclusion is injective.

**Checks.**

- e (1/2) * e (1/2) = 1 in BCHecke ℚ.
- x' 2 * x 2 = 2 in BCHecke ℚ: the two left cosets of X₂⁻¹ both multiply into the identity coset.
- x 2 * x' 2 = 1 + e (1/2) in BCHecke ℚ, so x 2 is not invertible.
- e (1/2) * x 2 ≠ x 2 * e (1/2): the algebra is not commutative, unlike the GL₂ Hecke rings.
- x 1 = 1 and x' 1 = 1.

The result must also satisfy these compatibility requirements: BCHecke K is not commutative: e(1/2)·x₂ = x₂ while x₂·e(1/2) ≠ x₂ (rational-presentation, relation (e′)). So Tau Ceti's commutativity criterion (HeckeCosetModule.commSemiringOfAntiInvolution) must not apply to this pair.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.2, (3.61)–(3.65), p. 460; [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, proof of Proposition 18, formulas (1)–(2), p. 431 (PDF p. 21); [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, notations (α), (β), p. 431 (PDF p. 21).

*Needs:* [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#p-p-is-a-hecke-pair-ax-plus-b-hecke-triple); [Translations and positive dilations](#translations-and-positive-dilations-axb-named-matrices); `Rat.num_div_den`; `HeckeCoset.degree_eq_relIndex`; `HeckeRing`; `HeckeCosetModule`; `HeckeCosetModule.instRingHeckeRing`; `HeckeCosetModule.single`; `HeckeCosetModule.mul_single_single`; `AddCircle`; [Double-coset coordinate bijection](#proof-coset-coordinate-bijection); [Double cosets of the ax+b pair and their degrees](#proof-double-cosets-and-degrees).

<a id="proof-coset-coordinate-bijection"></a>

**Double-coset coordinate bijection.** For positive coprime n,m, b↦class([1,b/m;0,n/m]) factors through Q/Z. The resulting map from triples (n,m,γ), gcd(n,m)=1, to axbInt\axbRat/axbInt is bijective. Equality of two representatives with fixed n,m is exactly equality of γ in Q/Z.

Reduce the positive rational diagonal uniquely to n/m in lowest terms. Left and right integral translations change b by Z+(n/m)Z=(1/m)Z. Multiplication by m identifies the remaining coordinate with Q/Z and proves injectivity and surjectivity.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

<a id="proof-double-cosets-and-degrees"></a>

**Double cosets of the ax+b pair and their degrees.** The left-coset degree of an ax+b double coset X is den(cosetEntry X), where cosetEntry is its positive rational diagonal value.

Left multiplication by [1 k; 0 1] sends [1 b; 0 a] to [1, b + ka; 0, a] and right multiplication by [1 j; 0 1] sends it to [1, b + j; 0, a]; so the double coset is b mod ℤ + aℤ = (1/m)ℤ, with a unchanged. HeckeCoset.degree_eq_relIndex: the degree is the index of P⁺_ℤ ∩ g P⁺_ℤ g⁻¹ in P⁺_ℤ, which is m by ax-plus-b-hecke-triple; the inverse double coset has (2,2) entry 1/a = m/n, so its degree is n.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.2, (3.71)–(3.72), p. 461.

<a id="the-compact-selberg-functional-equation-selberg-functional-equation"></a>

### 6.19 The compact Selberg functional equation

With D_g(s)=I_g(s)exp(2(g−1)[2ζ′(−1)−log√(2π)]), the continued scalar Selberg function satisfies ZΓ(s)D_g(s)=ZΓ(1−s)D_g(1−s) as a meromorphic identity. This formulation fixes all Barnes branches by continuation from real s>1 and avoids an unnormalized path integral.

The proof proceeds as follows. The shifted operator Δ+s(s−1) is unchanged by s↦1−s. Use the determinant comparison on its domain and continue. Multiply by the explicit identity factors to obtain a branch-consistent equation.

The result must also satisfy these compatibility requirements: With D_g(s)=I_g(s)exp(2(g−1)[2ζ′(−1)−log√(2π)]), the continued scalar Selberg function satisfies ZΓ(s)D_g(s)=ZΓ(1−s)D_g(1−s) as a meromorphic identity. This formulation fixes all Barnes branches by continuation from real s>1 and avoids an unnormalized path integral.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), Theorem 6.1 (6.1), p.20; scalar (8.4), p.27; (8.8), p.28. Use the scalar identity factor confirmed by the heat derivative, as specified in the normalization convention.

*Needs:* [The compact Selberg determinant comparison](#the-compact-selberg-determinant-comparison-selberg-determinant-comparison); [Positive-spectrum zeta and heat series](#positive-spectrum-zeta-and-heat-series-spectral-zeta-series); AutomorphicSpectralTheory AS.4; [The scalar Selberg primitive-geodesic product](#the-scalar-selberg-primitive-geodesic-product-selberg-primitive-product); AutomorphicSpectralTheory AS.6; [Barnes G-function](#barnes-g-function-barnes-g-function); [Entire shifted determinant](#entire-shifted-determinant-shifted-entire-determinant); [The compact discrete-spectrum input](#proof-compact-spectrum-and-weyl); [The compact scalar heat trace input](#proof-scalar-heat-trace-formula); [Identity contribution and Barnes normalization](#proof-identity-barnes-transform); [Branch-independent identity factor](#proof-selberg-identity-germ).

<a id="selberg-zeros-and-scalar-spectral-parameters-selberg-spectral-zero-comparison"></a>

### 6.20 Selberg zeros and scalar spectral parameters

On 0<Res<1, zeros of the continued scalar ZΓ are exactly the solutions s(1−s)=λ>0. An eigenvalue of multiplicity m contributes order m at each root when λ≠1/4, and order 2m at s=1/2 when λ=1/4. For λ>1/4 the two roots have real part 1/2; for 0<λ<1/4 both are real in (0,1). Separately, the simple zero mode gives order 1 at s=1 and order 2g−1 at s=0 after the identity-factor pole. Other trivial zeros are not called spectral.

The proof proceeds as follows. Use the shifted determinant zeros with eigenvalue multiplicity. Separate the explicit identity-factor zeros/poles. Solve the quadratic relation and retain small positive eigenvalues.

The result must also satisfy these compatibility requirements: The spectral zeros occur at both solutions of s(1−s)=λj, with multiplicities determined by the determinant comparison and the identity factor. For λj≥1/4 they lie on Res=1/2; for 0<λj<1/4 they are real in(0,1). The zero mode gives s=0,1. Identity-factor trivial zeros are separated before calling zeros spectral; no Riemann RH consequence follows.

See [Don Zagier — New points of view on the Selberg zeta function](https://people.mpim-bonn.mpg.de/zagier/files/tex/NewPointsSelbergZeta/fulltext.pdf), §1, (1)–(2), pp.1–2.

*Needs:* [The compact Selberg determinant comparison](#the-compact-selberg-determinant-comparison-selberg-determinant-comparison); [Entire shifted determinant](#entire-shifted-determinant-shifted-entire-determinant); [Positive-spectrum zeta and heat series](#positive-spectrum-zeta-and-heat-series-spectral-zeta-series); AutomorphicSpectralTheory AS.4; [The scalar Selberg primitive-geodesic product](#the-scalar-selberg-primitive-geodesic-product-selberg-primitive-product); AutomorphicSpectralTheory AS.6; [Barnes G-function](#barnes-g-function-barnes-g-function); [The compact discrete-spectrum input](#proof-compact-spectrum-and-weyl); [The compact scalar heat trace input](#proof-scalar-heat-trace-formula); [Identity contribution and Barnes normalization](#proof-identity-barnes-transform); [Branch-independent identity factor](#proof-selberg-identity-germ); [Exact shifted determinant zero divisor](#proof-shifted-zero-divisor); [Spectral quadratic pullback multiplicity](#proof-spectral-quarter-double-root); [Identity factor at spectral points](#proof-selberg-identity-nonvanishing).

<a id="proof-shifted-zero-divisor"></a>

**Exact shifted determinant zero divisor.** D(u) vanishes exactly at u=−λj, with order equal to the eigenvalue multiplicity. Around each such u0, D(u)=(u−u0)^m h(u), with h holomorphic and nonzero at u0. The finite factors for that eigenvalue are separated from the normally convergent nonvanishing residual product.

Separate the finitely many factors for the selected eigenvalue. The other canonical factors converge normally and are nonzero locally, as is the exponential prefactor. Their product is the analytic unit multiplying the required finite power.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), §4 (4.2)–(4.6), pp.13–15, for heat regularization and zero-mode removal; canonical product derived in this roadmap.

<a id="proof-spectral-quarter-double-root"></a>

**Spectral quadratic pullback multiplicity.** For q(s)=s(s−1), if D has order m at u0=−λ and q(s0)=u0, then D∘q has order m when s0≠1/2 and order 2m when s0=1/2 (necessarily λ=1/4). This uses q(s)−q(s0)=(s−s0)(s+s0−1); at s0=1/2 it is (s−1/2)².

Factor q(s)-q(s0)=(s-s0)(s+s0-1). The second factor is a unit unless s0=1/2; at that point both factors coincide. Substitute into the local determinant factorization to obtain orders m and 2m.

See [Don Zagier — New points of view on the Selberg zeta function](https://people.mpim-bonn.mpg.de/zagier/files/tex/NewPointsSelbergZeta/fulltext.pdf), Zagier §1 spectral relation, p.2; polynomial pullback refinement.

<a id="proof-selberg-identity-nonvanishing"></a>

**Identity factor at spectral points.** I_g is holomorphic and nonzero on Res>0. At s=0 it has a pole of order 2g−2, because Γ has a simple pole there and G(1)=1; at s=1 it is finite and nonzero. Thus spectral points in 0<Res<1 are unaffected, while ZΓ has order 2g−1 at 0 and order 1 at 1.

Apply the Gamma and normalized Barnes zero/pole divisors in the open right half-plane. At zero Gamma has pole one while G(s+1) is a unit, giving pole order 2g-2. Combine with the simple determinant zero at q(0)=q(1)=0.

See [Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti — Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2), §2.5 Barnes zeros, p.9; §8.1, pp.26–27; scalar identity factor.

<a id="the-presentation-of-the-rational-bost-connes-algebra-rational-presentation"></a>

### 6.21 The presentation of the rational Bost–Connes algebra

Let K be a characteristic-zero field and B a unital K-algebra. Any families X_n,X′_n,Eγ in B satisfying the eight displayed rational relations induce a unique K-algebra homomorphism BCHecke K→B taking x_n,x′_n,eγ to these families. Thus the Hecke algebra has the stated algebraic presentation; the lift is determined on the coprime normal-form basis.

Assume K a field of characteristic zero.

The proof proceeds as follows. Define the lift on the normal-form basis by X_n Eγ X′_m. The same finite rewriting proves product compatibility in B; check 1 and scalars. Every Hecke element is a finite basis sum, so its generator values determine the homomorphism.

The result must also satisfy these compatibility requirements: (f′) with γ = 0 gives x_n x′_n = Σ_{nδ=0} e(δ), so π_n = x_n x′_n / n is an idempotent. The printed formula (7) of Bost–Connes, with upper right entry γ instead of γ/m, would make e(1/2)·x′₂ and x′₂ the same basis element, although they differ (AnalyticNumberTheory/the normalization convention).

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18, p. 431 (PDF p. 21); [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, proof of Proposition 18, formula (7), p. 433 (PDF p. 23); corrected as AnalyticNumberTheory/the normalization convention; [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4, Proposition 3.23, p. 457.

*Needs:* [The Bost–Connes Hecke algebra](#the-bost-connes-hecke-algebra-bost-connes-hecke-algebra); [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#p-p-is-a-hecke-pair-ax-plus-b-hecke-triple); [Translations and positive dilations](#translations-and-positive-dilations-axb-named-matrices); `Rat.num_div_den`; `HeckeCoset.degree_eq_relIndex`; `HeckeCosetModule.single_mul_single`; `HeckeCosetModule.mul_single_single`; `AddCircle`; `PNat`; `HeckeCosetModule.single`; [Double-coset coordinate bijection](#proof-coset-coordinate-bijection); [Double cosets of the ax+b pair and their degrees](#proof-double-cosets-and-degrees); [For n≥1, x′n xn=n·1.](#proof-bc-relation-left-inverse); [For coprime n,m≥1, xn x′m=x′m xn.](#proof-bc-relation-coprime); [For n,m≥1, x(nm)=xn xm.](#proof-bc-relation-dilations); [For n,m≥1, x′(nm)=x′n x′m.](#proof-bc-relation-inverse-dilations); [Cancellation of common dilation factors](#proof-bc-gcd-cancellation); [For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements.](#proof-bc-relation-preimage-sum); [Finite translation fibres](#proof-bc-preimage-finite); [Reduction to coprime normal forms](#proof-bc-normal-form-gcd-reduction); [For n≥1 and γ∈ℚ/ℤ, e(γ)xn=xn e(nγ).](#proof-bc-relation-transport); [For γ,δ∈ℚ/ℤ, e(γ+δ)=e(γ)e(δ).](#proof-bc-relation-translation-add); [Normal-form multiplication and common-divisor reduction](#proof-bc-normal-form-product); [Normal-form support](#proof-bc-normal-form-support); [The corrected double-coset basis is independent](#proof-bc-normal-form-independent); [e(0)=1.](#proof-bc-relation-translation-zero).

<a id="proof-bc-relation-left-inverse"></a>

**For n≥1, x′n xn=n·1..** For n≥1, x′n xn=n·1.

Here K is a characteristic-zero field; x,x′,e are the rational, unnormalized Hecke generators.

Count the n left-coset representatives of Xn inverse; each product with Xn is in the identity class. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to K.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 (a)–(f), p.431, and proof pp.432–433; unnormalized rational rescaling.

<a id="proof-bc-relation-coprime"></a>

**For coprime n,m≥1, xn x′m=x′m xn..** For coprime n,m≥1, xn x′m=x′m xn.

Here K is a characteristic-zero field; x,x′,e are the rational, unnormalized Hecke generators.

Use the finite coset decomposition and the residue bijection modulo coprime n,m. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to K.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 (a)–(f), p.431, and proof pp.432–433; unnormalized rational rescaling.

<a id="proof-bc-relation-dilations"></a>

**For n,m≥1, x(nm)=xn xm..** For n,m≥1, x(nm)=xn xm.

Here K is a characteristic-zero field; x,x′,e are the rational, unnormalized Hecke generators.

The positive integral dilation cosets have the single representative needed for this product. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to K.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 (a)–(f), p.431, and proof pp.432–433; unnormalized rational rescaling.

<a id="proof-bc-relation-inverse-dilations"></a>

**For n,m≥1, x′(nm)=x′n x′m..** For n,m≥1, x′(nm)=x′n x′m.

Here K is a characteristic-zero field; x,x′,e are the rational, unnormalized Hecke generators.

Compute the inverse dilation coset representatives and count each output once. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to K.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 (a)–(f), p.431, and proof pp.432–433; unnormalized rational rescaling.

<a id="proof-bc-gcd-cancellation"></a>

**Cancellation of common dilation factors.** For q=gcd(m,n), μ_m* μ_n=μ_(n/q) μ_(m/q)*. The rational version includes the scalar q: x′_m x_n=q x_(n/q) x′_(m/q).

Factor n and m by q=gcd(n,m), cancel the common isometry using the left-inverse relation and commute the remaining coprime factors. Rescaling back to x and x-prime contributes the scalar q.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), BC95 Proposition 18 proof, p.433.

<a id="proof-bc-relation-preimage-sum"></a>

**For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements..** For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements.

Here K is a characteristic-zero field; x,x′,e are the rational, unnormalized Hecke generators.

Enumerate the n residue representatives of the inverse dilation and match the translations to the n-element fiber. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to K.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 (a)–(f), p.431, and proof pp.432–433; unnormalized rational rescaling.

<a id="proof-bc-preimage-finite"></a>

**Finite translation fibres.** For n≥1 and γ∈Q/Z, {δ:nδ=γ} has exactly n elements. For γ represented by a∈Q, its elements are (a+j)/n modulo Z, 0≤j<n.

Choose a rational lift of gamma. The n displayed preimages are distinct modulo Z, since their differences are (j-k)/n. Every preimage differs from the chosen lift divided by n by an element of the n-torsion subgroup.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Proposition 3.23, relation (3.51), p.457; finite coset calculation pp.431–433 of BC95.

<a id="proof-bc-normal-form-gcd-reduction"></a>

**Reduction to coprime normal forms.** For q=gcd(n,m), x_n eγ x′_m=Σqδ=γ x_(n/q)eδ x′_(m/q). After the finite sum every remaining dilation pair is coprime.

Factor out the common dilation q. Apply its preimage-sum relation to e(gamma), then multiply by the remaining two dilation factors. The preimage cardinality gives a finite sum and the new dilation pair is coprime.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), BC95 Proposition 18 proof, p.433.

<a id="proof-bc-relation-transport"></a>

**For n≥1 and γ∈ℚ/ℤ, e(γ)xn=xn e(nγ)..** For n≥1 and γ∈ℚ/ℤ, e(γ)xn=xn e(nγ).

Here K is a characteristic-zero field; x,x′,e are the rational, unnormalized Hecke generators.

The corresponding triangular matrices multiply to the same representative. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to K.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 (a)–(f), p.431, and proof pp.432–433; unnormalized rational rescaling.

<a id="proof-bc-relation-translation-add"></a>

**For γ,δ∈ℚ/ℤ, e(γ+δ)=e(γ)e(δ)..** For γ,δ∈ℚ/ℤ, e(γ+δ)=e(γ)e(δ).

Here K is a characteristic-zero field; x,x′,e are the rational, unnormalized Hecke generators.

Multiply the single translation representatives, independent of their integer lifts. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to K.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 (a)–(f), p.431, and proof pp.432–433; unnormalized rational rescaling.

<a id="proof-bc-normal-form-product"></a>

**Normal-form multiplication and common-divisor reduction.** The K-linear span of the coprime normal forms x_n eγ x′_m is a subalgebra of BCHecke K; over C it is star closed. Product reduction uses the gcd cancellation and finite preimage reduction in separate lemmas.

Use the separately listed generator relations; do not reprove them inside the normal-form closure lemma. Use the displayed gcd cancellation and character-transport formulas of p.433. Reduce a noncoprime outer pair with μq eγ μq*=q^(−1)Σqδ=γ eδ.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 and complete proof, pp.431–433.

<a id="proof-bc-normal-form-support"></a>

**Normal-form support.** For positive coprime n,m and γ represented by a∈Q, x_n eγ x′_m is the single Hecke basis vector at [1,a/m;0,n/m], with coefficient 1. Over C the corresponding μ-normal form is multiplied by (nm)^(−1/2).

Apply the Hecke single-product multiplicities to the two dilations and translation. Coprimality leaves exactly the stated double coset with coefficient one; its complex normalization is the product of the two inverse square roots.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), BC95 Proposition 18 proof, (7), p.433, corrected γ/m.

<a id="proof-bc-normal-form-independent"></a>

**The corrected double-coset basis is independent.** The family (n,m,γ)↦x_n eγ x′_m indexed by positive coprime n,m and γ∈Q/Z is linearly independent over K. Together with the support bijection it is a K-basis of BCHecke K.

Compute eγ x′m using the paper convolution, obtaining upper entryγ/m. Left multiply by xn and use uniqueness of the reduced positive rational n/m. Use independence of the Tau Hecke finitely supported basis; retain the normalization convention.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 and complete proof, pp.431–433.

<a id="proof-bc-relation-translation-zero"></a>

**e(0)=1..** e(0)=1.

Here K is a characteristic-zero field; x,x′,e are the rational, unnormalized Hecke generators.

The zero translation is the identity double coset. Use the cited Tau Ceti single-product multiplicities, then extend coefficients to K.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 (a)–(f), p.431, and proof pp.432–433; unnormalized rational rescaling.

<a id="the-bost-connes-time-evolution-time-evolution"></a>

### 6.22 The Bost–Connes time evolution

For z ∈ ℂ let σ_z : BCHecke ℂ → BCHecke ℂ be σ_z(f)(X) = a(X)^{iz} f(X), where a(X) ∈ ℚ_{>0} is the (2,2) entry of the double coset (double-cosets-and-degrees) and a^{iz} = exp(iz log a). Each σ_z is a ℂ-algebra automorphism, σ_0 = id and σ_{z+w} = σ_z σ_w; for real t, σ_t is a *-automorphism. On generators σ_z(x_n) = n^{iz}x_n, σ_z(x′_n) = n^{−iz}x′_n and σ_z(e(γ)) = e(γ). For real t this is Bost–Connes' σ_t(f)(γ) = (L(γ)/R(γ))^{−it} f(γ), because L(X)/R(X) = a(X)⁻¹.

The proof proceeds as follows. a is well defined on double cosets and multiplicative on structure constants: m(g, h; d) ≠ 0 forces a(d) = a(g)a(h), since a is a homomorphism on P⁺_ℚ that is trivial on P⁺_ℤ. Hence σ_z(f₁f₂) = σ_z(f₁)σ_z(f₂) on basis elements, σ_z is invertible with inverse σ_{−z}, and σ_{z+w} = σ_zσ_w. For real t, a(X⁻¹) = a(X)⁻¹ and |a^{it}| = 1 give σ_t(f*) = σ_t(f)*. L(X)/R(X) = den a / num a = a⁻¹ (double-cosets-and-degrees), so (L/R)^{−it} = a^{it}.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.timeEvolution`: timeEvolution (z : ℂ) : BCHecke ℂ ≃ₐ[ℂ] BCHecke ℂ, with (timeEvolution z f) X = (a X : ℂ)^(I * z) * f X.
- `TauCeti.BostConnes.timeEvolution_zero`: timeEvolution 0 = AlgEquiv.refl.
- `TauCeti.BostConnes.timeEvolution_add`: timeEvolution (z + w) = (timeEvolution z).trans (timeEvolution w).
- `TauCeti.BostConnes.timeEvolution_x`: timeEvolution z (x n) = (n : ℂ)^(I * z) • x n.
- `TauCeti.BostConnes.timeEvolution_x'`: timeEvolution z (x' n) = (n : ℂ)^(−(I * z)) • x' n.
- `TauCeti.BostConnes.timeEvolution_e`: timeEvolution z (e γ) = e γ.
- `TauCeti.BostConnes.timeEvolution_star`: For real t, timeEvolution t (star f) = star (timeEvolution t f).
- `TauCeti.BostConnes.timeEvolution_eq_LR`: For real t, (timeEvolution t f) X = ((L X : ℂ) / R X)^(−(I * t)) * f X with L, R the degrees of X and X⁻¹ (Bost–Connes (3.71)).

**Checks.**

- timeEvolution t (x 2) = 2^(I t) • x 2.
- timeEvolution z (x 2 * x' 2) = x 2 * x' 2, as it must be since x 2 * x' 2 = 1 + e (1/2) has a = 1.
- f ↦ (X ↦ L(X)^(it) f(X)) is not multiplicative: it fixes x 2 * x' 2 = 1 + e(1/2) (all L = 1) but multiplies x' 2 by 2^(it) and fixes x 2.
- timeEvolution (−I/2) ((n : ℂ)^(−1/2) • x n) = x n: σ_{−i/2} takes BC's μ_n to x_n (rational-forms-comparison).

The result must also satisfy these compatibility requirements: Every element of BCHecke ℂ is entire for σ: z ↦ σ_z(f) is a finite sum of exponentials.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.1, Lemma 3.24, (3.60), p. 459; [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.2, (3.71)–(3.72), p. 461.

*Needs:* [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#p-p-is-a-hecke-pair-ax-plus-b-hecke-triple); [Translations and positive dilations](#translations-and-positive-dilations-axb-named-matrices); `Rat.num_div_den`; `HeckeCoset.degree_eq_relIndex`; [The Bost–Connes Hecke algebra](#the-bost-connes-hecke-algebra-bost-connes-hecke-algebra); `Complex.cpow`; [Double-coset coordinate bijection](#proof-coset-coordinate-bijection); [Double cosets of the ax+b pair and their degrees](#proof-double-cosets-and-degrees).

### 6.23 Operator constructions for the Bost–Connes completion

The following constructions supply the analytic infrastructure used by the Bost–Connes branch. All algebras in this subsection are complex star algebras; completed algebras carry a C⋆-norm. Use Mathlib's Hilbert completions, bounded operators and completed C⋆-GNS representation where applicable. The extra step for an algebraic positive functional is boundedness of its generators before invoking those completed interfaces.

For the rational-presentation core after complexification, prove `positive_core_gns_bounded`: every normalized positive linear functional gives a pre-Hilbert quotient with inner product ⟨[a],[b]⟩=φ(a* b), and left multiplication by every μ_n and e(γ) is bounded by one. The μ_n are isometries and e(γ) are unitaries; these algebraic relations prove the needed inequalities on the quotient. The Hilbert completion gives a star representation. For f=Σc_j μ_(n_j)e(γ_j)μ_(m_j)*, its operator norm is at most Σ|c_j|. Define `bcUniversalCompletion` using the supremum over these representations, quotienting its null ideal before completion. The faithful regular representation proves that the core's null ideal is zero. Show that normalized positive functionals extend uniquely to states and that every core star representation extends uniquely to the completion.

The intended interface is:

- `positiveCoreGNS.coeff_bound`: the displayed finite coefficient sum bounds every represented operator, independently of the representation.
- `bcUniversalCompletion.lift`: core representations extend by continuity and are unique on the dense core.
- `bcUniversalCompletion.state_extend`: normalized algebraic positive functionals extend uniquely, preserving their core values.

**Checks.**

- For a scalar multiple c·1 the universal norm is |c|, and every normalized state takes the value c.
- For μ₂, the identities μ₂*μ₂=1 and μ₂μ₂*=α₂(1) give norm one without equating the range projection with 1.
- For e(1/2), the image is a self-adjoint unitary of square one. The bound applies to 1−e(1/2) with coefficient bound two; positivity alone without generator bounds would not establish continuity for an arbitrary algebraic star algebra.

For the semigroup action on A=C(Ẑ), define α_n(f)(x)=f(x/n) on nẐ and zero elsewhere. Construct the minimal automorphic dilation B=C₀(A_f), with β_q(f)(x)=f(q⁻¹x), and embed A by extension by zero. More generally prove the injective-endomorphism dilation for an abelian cancellative Ore semigroup S, its group S⁻¹S and a unital C⋆-algebra A; endomorphisms need not preserve 1. Minimality means B is the norm closure of the union of β_s⁻¹(A). Construct the full crossed product by covariant representations and its regular reduced representation. Prove `semigroup_full_corner`: A⋊S is isomorphic to p(B⋊S⁻¹S)p for p=i(1), and this corner is full. In the present abelian group prove equality of full and reduced norms using an explicit Følner approximation; it is a separate theorem from dilation. Identify the resulting corner norm with the faithful Hecke regular norm.

The intended interface is:

- `minimalDilation.intertwine`: β_s∘i=i∘α_s, with the stated dense union and a unique intertwining isomorphism between minimal dilations.
- `crossedProduct.covariantLift`: every nondegenerate covariant pair integrates to a unique star representation.
- `semigroupCorner.generator`: μ_n corresponds to U_n p, with initial projection p and range projection β_n(p).
- `crossedProduct.abelian_norm_eq`: the regular quotient is isometric for the countable abelian positive rational group.

**Checks.**

- For n=2, α₂(1)=1_(2Ẑ) and is not 1_Ẑ; its Haar mass is 1/2.
- For the trivial semigroup, dilation and corner give A itself. For A=ℂ with the identity action of a group, its crossed product gives that group's C⋆-algebra rather than ℂ.
- In the finite-adele model, β_(1/2)(1_Ẑ)=1_((1/2)Ẑ), so the dilated support grows. Reversing β or using β_n(A) instead of β_n⁻¹(A) fails minimality.

Construct the conditional expectation on the reduced product by `E(Σ_q f_qU_q)=f_1`. It is positive, contractive and faithful, and compresses to a unital expectation from the corner to C(Ẑ). Prove `scalingMeasureState`: integrating the compressed expectation against a probability measure on Ẑ yields a completed state. For a β-scaling extension to A_f, prove the KMS identities on the finite spectral core and then on the completion. Conversely a KMS state restricts to a probability measure and satisfies the scaling law; its off-diagonal coefficients vanish by dynamics unless their spectral ratio is one. The diagonal measure is unique. Use the current commutative positive-functional measure representation at the boundary; prove its uniqueness and the weak evaluation comparison here.

The intended interface is:

- `crossedProduct.expectation_coeff`: extract precisely the identity coefficient, respecting star and positivity.
- `cornerExpectation.one`: the corner unit p maps to 1 on Ẑ.
- `scalingMeasureState.restrict`: diagonal restriction recovers the original probability measure, and equality of all core coefficients determines the state.

**Checks.**

- For a nonidentity q, E(fU_q)=0, while E(f)=f for the identity coefficient.
- E((fU_q)*(fU_q))=β_(q⁻¹)(|f|²) is nonnegative; dropping the conjugation gives the wrong coefficient when f is nonconstant.
- A normalized scaling measure gives φ(μ_nμ_n*)=n^(−β), whereas φ(μ_n*μ_n)=1. Interchanging initial and range projections breaks KMS.

Prove `kms_finite_spectral_core_iff` for a strongly continuous dynamics and a norm-dense invariant star subalgebra spanned by entire eigenvectors. A state satisfies the completed bounded-strip condition precisely when φ(ab)=φ(bσ_(iβ)(a)) on this core. Extend the identities by bounded strip estimates and norm approximation, obtaining functions continuous on the closed strip and bounded there. Separately identify weak convergence of states with convergence on a norm-dense bounded set, and show that probability barycentres yield continuous evaluation maps.

**Checks.**

- An eigenvector with σ_t(a)=r^(it)a has σ_(iβ)(a)=r^(−β)a, with positive r; the opposite sign gives the wrong projection masses.
- For trivial dynamics on M₂(ℂ), KMS states are exactly traces. The state a↦a₁₁ is a ground state but is not KMS: with a=E₁₂ and b=E₂₁ its two products have values one and zero.
- Norm convergence of finite spectral approximants gives convergence of every state value. Weak convergence of measures need not give norm convergence of their corresponding functionals; distinct point masses remain at distance two.

See Laca, [From endomorphisms to automorphisms and back: dilations and full corners](https://arxiv.org/pdf/math/9911135), Theorem 2.1.1 and Lemma 2.1.3, pp.5–7, Theorem 2.2.1, pp.7–8, and Proposition 3.2.1, p.9; Bost–Connes, [Hecke algebras, type III factors and phase transitions](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), Proposition 18 and its amenability remark, pp.431–433; Connes–Marcolli, [Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Definitions 3.4–3.6, pp.445–447, and (3.19), p.450. These locate the constructions and finite-core criterion. General algebraic GNS boundedness, the abelian full/reduced comparison and the bounded-strip extension need their own complete proofs; they are not inferred from Laca's corner theorem.

*Needs:* Hilbert completions and bounded operators; positive star functionals; ProfiniteArithmetic and GlobalNumberFields' carriers; the rational core relations below. The universal completion and corner results are used after those core relations, and the state-measure reconstruction after the scaling measure has been constructed.

<a id="the-reduced-bost-connes-c-algebra-bc-cstar-completion"></a>

### 6.24 The reduced Bost–Connes C*-algebra

Let πleft be convolution on l²(P_Q⁺/P_Z⁺), using the paper’s right-coset convention and the Tau Hecke product comparison. Define C_Q as the operator-norm closure of πleft(BCHecke C) in bounded operators, a unital star subalgebra. This is distinct from an individual πu on l²(N+), which is not the left regular carrier.

The proof proceeds as follows. Bound left convolution on each finite double-coset support using its finite degrees. Prove it is a faithful star representation, matching the coset convention. Use the existing star-subalgebra closure; norm/C*-completeness and the universal/reduced comparison are separate leaves.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.Completed.leftRegular`: Convolution on the l² right-coset carrier.
- `TauCeti.BostConnes.Completed.algebra`: The operator-norm closure of the left regular image.
- `TauCeti.BostConnes.Completed.embed`: The faithful dense star-algebra map from BCHecke C into C_Q.

**Checks.**

- The embedded unit is the identity operator.
- The embedded μn satisfies μn*μn=1.
- The embedded μ2μ2*=(1+e(1/2))/2 is a proper projection, not1.

The result must also satisfy these compatibility requirements: Let πleft be convolution on l²(P_Q⁺/P_Z⁺), using the paper’s right-coset convention and the Tau Hecke product comparison. Define C_Q as the operator-norm closure of πleft(BCHecke C) in bounded operators, a unital star subalgebra. This is distinct from an individual πu on l²(N+), which is not the left regular carrier.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 and complete proof, pp.431–433.

*Needs:* [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#p-p-is-a-hecke-pair-ax-plus-b-hecke-triple); [Translations and positive dilations](#translations-and-positive-dilations-axb-named-matrices); `Rat.num_div_den`; `HeckeCoset.degree_eq_relIndex`; [Positive diagonal homomorphism](#positive-diagonal-homomorphism-axb-diagonal-map); `lp`; [The Bost–Connes Hecke algebra](#the-bost-connes-hecke-algebra-bost-connes-hecke-algebra); `StarSubalgebra.topologicalClosure`; [Double-coset coordinate bijection](#proof-coset-coordinate-bijection); [Double cosets of the ax+b pair and their degrees](#proof-double-cosets-and-degrees); [Inverse double-coset degree](#proof-inverse-coset-degree); [Finite convolution row and column counts](#proof-bc-convolution-row-column); [Schur estimate for one double coset](#proof-bc-convolution-schur); [Bounded faithful left convolution](#proof-bc-convolution-norm-bound); [Coefficient recovery and faithfulness](#proof-bc-convolution-faithful); [Convolution preserves the adjoint](#proof-bc-convolution-adjoint).

<a id="proof-inverse-coset-degree"></a>

**Inverse double-coset degree.** The degree of X⁻¹ is num(cosetEntry X), a positive integer. Thus L(X)/R(X)=cosetEntry(X)⁻¹. The numerator is its absolute natural numerator, since the diagonal value is positive.

Invert the reduced diagonal n/m, which exchanges n and m. Apply the degree formula to the inverse class, then divide the two positive integer degrees.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

<a id="proof-bc-convolution-row-column"></a>

**Finite convolution row and column counts.** On Q=axbRat/axbInt use K_X(gH,hH)=1_X(g⁻¹h). Every row has L(X) nonzero entries and every column R(X)=L(X⁻¹). These counts are constant on quotient representatives.

Fix one quotient variable and identify the nonzero kernel entries with the appropriate left-coset decomposition of X. Interchanging variables replaces X by its inverse. Translation invariance proves independence of quotient representatives.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), Proposition 3 and proof, p.414; finite support and Schur estimate refined explicitly here.

<a id="proof-bc-convolution-schur"></a>

**Schur estimate for one double coset.** For finitely supported ξ on Q, ‖K_X ξ‖₂²≤L(X)R(X)‖ξ‖₂². Consequently K_X extends uniquely to l²(Q) with operator norm≤sqrt(L(X)R(X)).

Bound each row square by L times the sum of its entry squares using Cauchy–Schwarz. Sum the rows; every input entry occurs R times. Extend on the dense finite-support subspace with this exact bound.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), Proposition 3 and proof, p.414; finite support and Schur estimate refined explicitly here.

<a id="proof-bc-convolution-norm-bound"></a>

**Bounded faithful left convolution.** For finite-support f, its left convolution on l²(Q) satisfies ‖λ(f)‖≤ΣX∈supp f |f(X)|sqrt(L(X)R(X)). This gives the bounded algebra homomorphism λ; no C*-closure is used to obtain the estimate.

Write f as the finite sum of its single-coset basis coefficients. Use the triangle inequality and the preceding operator bound. Kernel convolution on finite-support vectors proves multiplicativity; extend by density.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 and complete proof, pp.431–433.

<a id="proof-bc-convolution-faithful"></a>

**Coefficient recovery and faithfulness.** For δ_H the unit vector at the identity coset, (λ(f)δ_H)(gH)=f(class(g⁻¹)). Thus λ(f)=0 implies f=0. Faithfulness precedes the completion.

Evaluate the operator on the identity-coset unit vector. Only the identity input coordinate survives, recovering the coefficient at the inverse class. Vanishing of the operator therefore annihilates every coefficient.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), Proposition 3 and proof, p.414; finite support and Schur estimate refined explicitly here.

<a id="proof-bc-convolution-adjoint"></a>

**Convolution preserves the adjoint.** For f in the complex Hecke algebra, λ(f*)=λ(f)*, since K_(f*)(gH,hH)=conj K_f(hH,gH). Both sides are bounded, so equality on finite-support vectors suffices.

Reverse the two quotient variables in the finite-support kernel and conjugate the coefficients. Inner products on finite-support vectors prove the adjoint equality; boundedness extends it to the Hilbert space.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), Proposition 3 and proof, p.414; finite support and Schur estimate refined explicitly here.

<a id="coefficient-state-on-the-hecke-core-bc-core-base-state"></a>

### 6.25 Coefficient state on the Hecke core

Define φbase(f)=f(identity double coset). Positivity follows from the faithful left-regular vector state at the identity coset; φbase(1)=1. It is the core KMS state at β=1. It has φbase(eγ)=1 when γ=0 and 0 otherwise.

The proof proceeds as follows. Apply the identity-coset vector functional to the faithful convolution representation. Its value is the identity coefficient, and its value on a square is a squared norm. Compare modular degrees on basis products to obtain beta=1 KMS.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.baseState_apply`: Evaluation at the identity double coset.
- `TauCeti.BostConnes.baseState_positive`: φbase(f*f)≥0, with f* denoting star.
- `TauCeti.BostConnes.baseState_e`: φbase(eγ)=if γ=0 then 1 else 0.

**Checks.**

- φbase(1)=1.
- φbase(e(1/2))=0.
- φbase(x2 x2*)=1 in rational normalization.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), Proposition 3, p.414; modular dynamics and state, pp.415–416.

*Needs:* [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#p-p-is-a-hecke-pair-ax-plus-b-hecke-triple); [Translations and positive dilations](#translations-and-positive-dilations-axb-named-matrices); `Rat.num_div_den`; `HeckeCoset.degree_eq_relIndex`; [Positive diagonal homomorphism](#positive-diagonal-homomorphism-axb-diagonal-map); `lp`; [The Bost–Connes Hecke algebra](#the-bost-connes-hecke-algebra-bost-connes-hecke-algebra); [Double-coset coordinate bijection](#proof-coset-coordinate-bijection); [Double cosets of the ax+b pair and their degrees](#proof-double-cosets-and-degrees); [Inverse double-coset degree](#proof-inverse-coset-degree); [Finite convolution row and column counts](#proof-bc-convolution-row-column); [Schur estimate for one double coset](#proof-bc-convolution-schur); [Bounded faithful left convolution](#proof-bc-convolution-norm-bound); [Coefficient recovery and faithfulness](#proof-bc-convolution-faithful); [Convolution preserves the adjoint](#proof-bc-convolution-adjoint).

<a id="first-trigonometric-eisenstein-function-bc-trigonometric-eisenstein"></a>

### 6.26 First trigonometric Eisenstein function

For a∈Q/Z and any positive N annihilating a, e1,a=Σ1≤j<N(j/N−1/2)e(ja) in the rational group algebra. The sum is independent of N. Under a torsion character with ρ(a)≠0 it evaluates to cot(πρ(a))/(2i); at ρ(a)=0 it is zero. Higher functions and their polynomial recurrence are separate constructions.

The proof proceeds as follows. Choose an annihilating level and form the finite rational Fourier sum. The finite Fourier identity proves independence under multiples of a level and hence under a common multiple. Evaluate at torsion characters, retaining the zero value at the trivial character.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.ArithmeticEisenstein.first`: The first finite rational Fourier sum.
- `TauCeti.BostConnes.ArithmeticEisenstein.finite_sum`: For every positive N annihilating a, first a is the displayed sum.
- `TauCeti.BostConnes.ArithmeticEisenstein.neg`: first (−a)=−first a.

**Checks.**

- first 0=0.
- first (1/2)=0.
- first (1/3)=−e(1/3)/6+e(2/3)/6.

The result must also satisfy these compatibility requirements: For a∈Q/Z and N>0 with Na=0, define e1,a=Σ1≤k<N(k/N−1/2)e(ka) in the rational group algebra. The expression is independent of N. On an invertible one-dimensional Q-lattice it is(1/(2i))cot(πρ(a)) away fromρ(a)=0, and it is0 on that degenerate locus. Define P1(u)=u, Pk+1=(u²−1/4)P′k(u)/k and ek,a=Pk(e1,a). This includes the degenerate normalization Pk(0).

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, §4.4, Lemmas3.27–3.28, (3.91)–(3.101), pp.464–465.

*Needs:* [The Bost–Connes Hecke algebra](#the-bost-connes-hecke-algebra-bost-connes-hecke-algebra); `Complex.exp`; `Polynomial`; [Finite cotangent Fourier identity](#proof-bc-eisenstein-finite-fourier).

<a id="proof-bc-eisenstein-finite-fourier"></a>

**Finite cotangent Fourier identity.** For N>0 and ζ^N=1, Σ1≤j<N(j/N−1/2)ζ^j equals (ζ+1)/(2(ζ−1)) when ζ≠1 and equals 0 when ζ=1. The nontrivial value is cot(πt)/(2i) for ζ=exp(2πit). Passing to a multiple of N gives the same value for every N-torsion character; finite Fourier injectivity proves level independence in Q[Q/Z].

Differentiate the finite geometric sum and evaluate at a nontrivial Nth root. At ζ=1 sum the rational coefficients directly; their sum is zero. Evaluate both levels at all characters of their common finite cyclic group and use finite Fourier injectivity.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Lemma 3.28 and its finite Abel-summation proof, pp.464–465.

<a id="the-two-rational-forms-of-the-bost-connes-algebra-rational-forms-comparison"></a>

### 6.27 The two rational forms of the Bost–Connes algebra

Inside BCHecke ℂ there are two ℚ-forms. (i) H_ℚ, the ℚ-valued functions (the image of BCHecke ℚ), spanned by the double cosets [X] = x_n e(γ) x′_m. (ii) Bost–Connes' rational algebra A_ℚ, the ℚ-span of the monomials t_{n,m,γ} = μ_n e(γ) μ*_m = (nm)^{−1/2}[X]; this is Connes–Marcolli's A_{1,ℚ}. They are different subsets (μ₂ = 2^{−1/2}x₂ ∉ H_ℚ), and the complexified time evolution at z = −i/2, σ_{−i/2}(f)(X) = a(X)^{1/2} f(X), is a ℂ-algebra automorphism of BCHecke ℂ carrying A_ℚ onto H_ℚ, with μ_n ↦ x_n and μ*_n ↦ x′_n/n. It is not a *-map. Statements about 'the rational subalgebra' are to one of the two forms.

The proof proceeds as follows. t_{n,m,γ} = (nm)^{−1/2}[X] with a(X) = n/m (rational-presentation), and σ_{−i/2} multiplies [X] by (n/m)^{1/2}; the product is m^{−1}[X], a rational multiple of a basis element, and every basis element arises. So σ_{−i/2}(A_ℚ) = H_ℚ. σ_{−i/2} is multiplicative because a is multiplicative on the structure constants (time-evolution).

The result must also satisfy these compatibility requirements: Connes–Marcolli's Proposition 3.25 ('H_Q(Γ, Γ0) is isomorphic to the Q-algebra generated by the e(r) and µn') holds through σ_{−i/2}, not through the inclusion μ_n = n^{−1/2}e_{X_n} of Proposition 18. Ground-state values agree on the two forms: φ_{∞,ρ}(t_{n,m,γ}) and φ_{∞,ρ}([X]) both vanish unless n = m = 1, where both equal ρ(ζ_γ).

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.2, Proposition 3.25, p. 461; [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, after the proof of Proposition 18, p. 433 (PDF p. 23); [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, notations (α), (β), p. 431 (PDF p. 21).

*Needs:* [The presentation of the rational Bost–Connes algebra](#the-presentation-of-the-rational-bost-connes-algebra-rational-presentation); [The Bost–Connes time evolution](#the-bost-connes-time-evolution-time-evolution).

<a id="the-representation-on-1-and-its-hamiltonian-regular-representation"></a>

### 6.28 The representation on ℓ²(ℕ≥1) and its Hamiltonian

Let ℓ² = ℓ²(ℕ≥1) (Mathlib's lp (fun _ : ℕ+ ↦ ℂ) 2) with orthonormal basis (ε_k). For u ∈ Aut(ℚ/ℤ) ≅ Ẑ^× define π_u : BCHecke ℂ → B(ℓ²) by π_u(x_n)ε_k = n^{1/2}ε_{nk}, π_u(x′_n)ε_k = n^{1/2}ε_{k/n} if n | k and 0 otherwise, π_u(e(γ))ε_k = exp(2πi k·u(γ))ε_k. Then π_u is a unital *-representation by bounded operators, with π_u(μ_n)ε_k = ε_{nk} for BC's μ_n = n^{−1/2}x_n. The Hamiltonian H is the self-adjoint operator Hε_k = log(k)ε_k, and π_u(σ_t f) = e^{itH}π_u(f)e^{−itH} for real t.

Assume u ∈ Aut(ℚ/ℤ); H is unbounded, with domain the k with Σ log(k)²|c_k|² < ∞.

The proof proceeds as follows. The operators are bounded: π_u(μ_n) is an isometry, π_u(μ*_n) its adjoint, and π_u(e(γ)) is diagonal unitary. They satisfy (a′)–(f′) of rational-presentation. For (f′): π_u(x_n e(γ) x′_n)ε_k = n·[n | k]·exp(2πi (k/n)u(γ))ε_k, and Σ_{nδ=γ} exp(2πi k u(δ)) = n·[n | k]·exp(2πi (k/n)u(γ)) by summing the n-th roots of unity. So the presentation defines π_u as an algebra map. Implementation: e^{itH}π_u(x_n)e^{−itH}ε_k = n^{1/2}k^{−it}(nk)^{it}ε_{nk} = n^{it}π_u(x_n)ε_k, matching σ_t(x_n) = n^{it}x_n; the e(γ) commute with H.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.regularRep`: regularRep (u : AddAut (ℚ/ℤ)) : BCHecke ℂ →ₐ[ℂ] (ℓ²(ℕ+) →L[ℂ] ℓ²(ℕ+)).
- `TauCeti.BostConnes.regularRep_x`: regularRep u (x n) (single k 1) = (n : ℂ)^(1/2 : ℂ) • single (n * k) 1.
- `TauCeti.BostConnes.regularRep_e`: regularRep u (e γ) (single k 1) = exp (2π I k u(γ)) • single k 1.
- `TauCeti.BostConnes.regularRep_star`: regularRep u (star f) = (regularRep u f)† (adjoint).
- `TauCeti.BostConnes.hamiltonianExp`: hamiltonianExp β hβ = e^{−βH}, the bounded diagonal operator ε_k ↦ k^{−β} ε_k for β > 0; H itself is the unbounded self-adjoint diagonal operator ε_k ↦ log(k) ε_k.
- `TauCeti.BostConnes.regularRep_timeEvolution`: π_u(σ_t f) = e^{itH} π_u(f) e^{−itH}, stated through matrix coefficients: ⟨ε_j, π_u(σ_t f) ε_k⟩ = (j/k)^{it} ⟨ε_j, π_u(f) ε_k⟩.

**Checks.**

- regularRep u (x 2 * x' 2) (single k 1) = (if 2 ∣ k then 2 else 0) • single k 1.
- regularRep u 1 = 1.
- The operator 2^(−1/2) • regularRep u (x 2) is an isometry, BC's π(μ₂).
- regularRep u (x' 2) (single 1 1) = 0: x′₂ is not injective in the representation, so it has no inverse.

The result must also satisfy these compatibility requirements: π_u(x₂ x′₂)ε_k = 2ε_k for even k and 0 for odd k, which is π_u(1 + e(1/2)). Changing u to −u gives the complex-conjugate representation on e(γ).

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.6, (3.140)–(3.141), p. 475.

*Needs:* [The presentation of the rational Bost–Connes algebra](#the-presentation-of-the-rational-bost-connes-algebra-rational-presentation); [The Bost–Connes time evolution](#the-bost-connes-time-evolution-time-evolution); `lp`; `HilbertBasis`; `Real.log`; `PNat`; [The Bost–Connes Hecke algebra](#the-bost-connes-hecke-algebra-bost-connes-hecke-algebra); [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#p-p-is-a-hecke-pair-ax-plus-b-hecke-triple); [Translations and positive dilations](#translations-and-positive-dilations-axb-named-matrices); `Rat.num_div_den`; `HeckeCoset.degree_eq_relIndex`; `HeckeCosetModule.single_mul_single`; [Double-coset coordinate bijection](#proof-coset-coordinate-bijection); [Double cosets of the ax+b pair and their degrees](#proof-double-cosets-and-degrees); [For n≥1, x′n xn=n·1.](#proof-bc-relation-left-inverse); [For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements.](#proof-bc-relation-preimage-sum); [Rational and isometric generator conventions](#proof-bc-complex-rescaling); [Isometries and phase unitaries on l²(N+)](#proof-bc-regular-shift-bounds).

<a id="proof-bc-complex-rescaling"></a>

**Rational and isometric generator conventions.** Over C put μ_n=n^(−1/2)x_n. Then μ_n*=n^(−1/2)x′_n, μ_n*μ_n=1, μ_n μ_n*=(1/n)Σnδ=0 eδ, and μ_n eγ μ_n*=(1/n)Σnδ=γ eδ. All positive scalar square roots use the real branch.

Replace x by sqrt(n) times mu in the left-inverse and preimage-sum identities. Positivity of n fixes the square-root branch and conjugation leaves that scalar unchanged.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), BC95 Proposition 18, p.431.

<a id="proof-bc-regular-shift-bounds"></a>

**Isometries and phase unitaries on l²(N+).** S_n ε_k=ε_nk is a linear isometry; S_n* ε_k is ε_(k/n) if n divides k, and 0 otherwise. D_(u,γ)ε_k=ζ_(kuγ)ε_k is unitary. Their relations realize μ_n and eγ, giving the bounded regular representation.

Compute inner products on finitely supported basis vectors. Multiplication by n is injective, so the shift preserves the squared norm; the diagonal multipliers have modulus one. Extend these maps by continuity and calculate their adjoints on the basis.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, §4.6, (3.140)–(3.141), p.475.

<a id="kms-states-on-the-bost-connes-algebra-kms-states"></a>

### 6.29 KMS_β states on the Bost–Connes algebra

For β>0, IsKMS(β,φ) on the dense complex Hecke algebra means: φ is complex linear, φ(1)=1, φ(f* f) is a nonnegative real number for every f, and φ(f σ_(iβ)(g))=φ(gf) for all f,g. This is the algebraic boundary identity. Its equivalence with the bounded strip definition on the C*-completion requires the bounded-state extension and analytic-core lemmas below. Ground states satisfy the upper-half-plane boundedness condition; KMS∞ states are weak limits of KMS states as inverse temperature tends to infinity. These notions are distinct.

Assume β > 0.

The proof proceeds as follows. A basis vector with dilation a≠1 is annihilated by the boundary identity with f=1 because a^(−β)≠1. Time invariance follows coefficientwise, since the remaining dilation-one basis vectors are fixed. For a bounded state on the completion, the analytic-core lemma proves the strip equivalence. Algebraic positivity alone is not silently identified with a completed state.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.IsKMS`: IsKMS(β,φ) includes β>0, normalization, complex-order positivity and the displayed boundary identity on the dense Hecke algebra.
- `TauCeti.BostConnes.IsKMS.timeEvolution_invariant`: IsKMS β φ → φ (timeEvolution t f) = φ f for real t.
- `TauCeti.BostConnes.IsKMS.convex`: KMS_β states form a convex set.
- `TauCeti.BostConnes.IsKMS.comp_symmetry`: IsKMS β φ → IsKMS β (φ ∘ symmetry u).

**Checks.**

- IsKMS β (gibbsState β hβ u) for β > 1 (gibbs-states-are-kms).
- The state f ↦ f(identity coset) satisfies IsKMS β exactly when β = 1.
- The Gibbs state fails the identity with σ_{−iβ} in place of σ_{iβ}: at f = x′₂, g = x₂ the two sides are 2^{1+β} and 2^{1−β}.
- Every KMS_β state has φ(x 2 * x' 2) = 2^(1−β), hence φ(e (1/2)) = 2^(1−β) − 1.

The result must also satisfy these compatibility requirements: The state φ₁(f) = f(identity coset), Bost–Connes' vector state at the base point (Connes–Marcolli (3.70)), is KMS_β only for β = 1: at f = x′₂, g = x₂ the identity reads 2^{1−β} = 1.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §2.2, Definition 3.6, p. 446.

*Needs:* [The Bost–Connes time evolution](#the-bost-connes-time-evolution-time-evolution); [The Bost–Connes Hecke algebra](#the-bost-connes-hecke-algebra-bost-connes-hecke-algebra); `Complex.cpow`.

<a id="completed-kms-states-and-the-bounded-strip-condition-bc-completed-kms"></a>

### 6.30 Completed KMS states and the bounded strip condition

For β>0, a completed state is a bounded complex-linear functional φ on C_Q with φ(1)=1 and φ(a*a) a nonnegative real. It is KMSβ when, for all a,b, there is a bounded continuous F on0≤Imz≤β, holomorphic on the interior, with F(t)=φ(aσt(b)) and F(t+iβ)=φ(σt(b)a). Dynamics is a point-norm-continuous group of star automorphisms.

The proof proceeds as follows. Extend real dynamics isometrically to the norm closure and prove point-norm continuity by dense finite supports. Use the bounded strip definition with both boundary conditions. Relate it to the algebraic identity only after the analytic-core extension lemma.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.CompletedKMS.state`: Bounded linear functional, normalization and complex-order positivity.
- `TauCeti.BostConnes.CompletedKMS.isKMS`: The bounded closed-strip predicate just specified.
- `TauCeti.BostConnes.CompletedKMS.restrict`: Restriction to the dense Hecke algebra satisfies IsKMS(β,φ).

**Checks.**

- Using σ−iβ reverses the required boundary identity and fails for x′2,x2 in a Gibbs state.
- The completed base-vector state restricts to a KMS state atβ=1.
- Every KMSβ state has φ(μnμn*)=n^(−β).

The result must also satisfy these compatibility requirements: For β>0, a completed state is a bounded complex-linear functional φ on C_Q with φ(1)=1 and φ(a*a) a nonnegative real. It is KMSβ when, for all a,b, there is a bounded continuous F on0≤Imz≤β, holomorphic on the interior, with F(t)=φ(aσt(b)) and F(t+iβ)=φ(σt(b)a). Dynamics is a point-norm-continuous group of star automorphisms.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Definitions 3.4–3.6, pp.445–447.

*Needs:* [The reduced Bost–Connes C*-algebra](#the-reduced-bost-connes-c-algebra-bc-cstar-completion); [The Bost–Connes time evolution](#the-bost-connes-time-evolution-time-evolution).

<a id="higher-trigonometric-eisenstein-functions-bc-eisenstein-higher"></a>

### 6.31 Higher trigonometric Eisenstein functions

For k≥0 and a∈Q/Z define ek,a=Pk(e1,a) in the rational group algebra. The value at a character killing a is Pk(0), including e2,0=−1/4. For k≥1, on the nondegenerate locus this agrees with the k-fold normalized cotangent series; k=1 uses the symmetric principal-value convention. The k=0 polynomial P0=0 is an algebraic convention, not a convergent weight-zero cotangent sum.

The proof proceeds as follows. Apply the rational polynomial Pk to the first function. Evaluate in characters and use the cotangent recurrence on the nondegenerate locus. The degenerate character has first value zero, hence higher value Pk(0), rather than zero in every weight.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.ArithmeticEisenstein.higher_eval`: higher k a=eval₂ (algebraMap Q _) (first a) (polynomial k).
- `TauCeti.BostConnes.ArithmeticEisenstein.higher_one`: higher 1 a=first a.
- `TauCeti.BostConnes.ArithmeticEisenstein.higher_zero_argument`: higher k 0=algebraMap Q _ ((polynomial k).eval 0).

**Checks.**

- first 0=0 and higher 2 0=−1/4.
- higher 2 (1/2)=−1/4 and higher 3 (1/2)=0.
- higher 2 (1/3)=(e(1/3)+e(2/3)−11·1)/36.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Lemma 3.27, (3.91)–(3.101), pp.464–465.

*Needs:* [First trigonometric Eisenstein function](#first-trigonometric-eisenstein-function-bc-trigonometric-eisenstein); [Eisenstein recurrence polynomials](#eisenstein-recurrence-polynomials-bc-eisenstein-polynomials).

<a id="bc-diagonal-heat-operator-bc-diagonal-heat-operator"></a>

### 6.32 BC diagonal heat operator

For β>0 define e^(−βH) on l²(N+) by multiplying the kth coordinate by k^(−β). It is a bounded positive self-adjoint operator of norm 1. Its semigroup law is addition of positive β. Trace-class membership and its trace for β>1 use the existing OperatorIdeals trace contract.

The proof proceeds as follows. For k>=1 the real multipliers k^(-beta) lie in (0,1], with equality at k=1. The diagonal operator bound follows from the l2 norm formula; coordinatewise real positivity and multiplication prove positivity, adjointness and the semigroup law.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.hamiltonianExp_apply`: hamiltonianExp β εk=k^(−β)εk.
- `TauCeti.BostConnes.hamiltonianExp_norm`: Its operator norm is 1.
- `TauCeti.BostConnes.hamiltonianExp_add`: hamiltonianExp(β+γ)=hamiltonianExp β∘hamiltonianExp γ.

**Checks.**

- The first coordinate vector is fixed.
- At β=1, ε2 is multiplied by 1/2.
- Its quadratic form is real nonnegative on every vector.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, (9)–(10), p.434; Hamiltonian description p.435.

*Needs:* [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#the-representation-on-1-and-its-hamiltonian-regular-representation); `lp`.

<a id="completed-coefficient-state-bc-completed-coefficient-state"></a>

### 6.33 Completed coefficient state

The core coefficient state extends uniquely and positively to C_Q. The completed state has norm 1, restricts to φbase, and is KMS exactly at β=1 for positive β.

The proof proceeds as follows. The identity vector functional is bounded on the operator completion and extends the core coefficient state. The dense-core KMS equivalence gives beta=1. A dilation range projection has value 1/n and forces n^(-beta)=1/n, excluding every other positive beta.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.CompletedKMS.base_restrict`: Restriction along embed is baseState.
- `TauCeti.BostConnes.CompletedKMS.base_norm`: The norm of the continuous state is 1.
- `TauCeti.BostConnes.CompletedKMS.base_kms_iff`: For β>0, the base state is KMSβ iff β=1.

**Checks.**

- base(1)=1.
- base(embed e(1/2))=0.
- base(μ2 μ2*)=1/2.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), Proposition 3, p.414; modular dynamics pp.415–416.

*Needs:* [Coefficient state on the Hecke core](#coefficient-state-on-the-hecke-core-bc-core-base-state); [The Bost–Connes Hecke algebra](#the-bost-connes-hecke-algebra-bost-connes-hecke-algebra); [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#p-p-is-a-hecke-pair-ax-plus-b-hecke-triple); [Translations and positive dilations](#translations-and-positive-dilations-axb-named-matrices); `Rat.num_div_den`; `HeckeCoset.degree_eq_relIndex`; `HeckeCosetModule.single_mul_single`; `AddCircle`; `PNat`; `HeckeCosetModule.single`; [Positive diagonal homomorphism](#positive-diagonal-homomorphism-axb-diagonal-map); `lp`; [GlobalNumberFields layer 4 finite adeles](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles); [The presentation of the rational Bost–Connes algebra](#the-presentation-of-the-rational-bost-connes-algebra-rational-presentation); [The reduced Bost–Connes C*-algebra](#the-reduced-bost-connes-c-algebra-bc-cstar-completion); [Completed KMS states and the bounded strip condition](#completed-kms-states-and-the-bounded-strip-condition-bc-completed-kms); [Double-coset coordinate bijection](#proof-coset-coordinate-bijection); [Double cosets of the ax+b pair and their degrees](#proof-double-cosets-and-degrees); [For n≥1, x′n xn=n·1.](#proof-bc-relation-left-inverse); [For coprime n,m≥1, xn x′m=x′m xn.](#proof-bc-relation-coprime); [For n,m≥1, x(nm)=xn xm.](#proof-bc-relation-dilations); [For n,m≥1, x′(nm)=x′n x′m.](#proof-bc-relation-inverse-dilations); [Cancellation of common dilation factors](#proof-bc-gcd-cancellation); [For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements.](#proof-bc-relation-preimage-sum); [Finite translation fibres](#proof-bc-preimage-finite); [Reduction to coprime normal forms](#proof-bc-normal-form-gcd-reduction); [For n≥1 and γ∈ℚ/ℤ, e(γ)xn=xn e(nγ).](#proof-bc-relation-transport); [For γ,δ∈ℚ/ℤ, e(γ+δ)=e(γ)e(δ).](#proof-bc-relation-translation-add); [Normal-form multiplication and common-divisor reduction](#proof-bc-normal-form-product); [Normal-form support](#proof-bc-normal-form-support); [The corrected double-coset basis is independent](#proof-bc-normal-form-independent); [Rational and isometric generator conventions](#proof-bc-complex-rescaling); [Algebraic GNS generator estimates](#proof-bc-gns-generator-bounds); [Inverse double-coset degree](#proof-inverse-coset-degree); [Finite convolution row and column counts](#proof-bc-convolution-row-column); [Schur estimate for one double coset](#proof-bc-convolution-schur); [Bounded faithful left convolution](#proof-bc-convolution-norm-bound); [Coefficient recovery and faithfulness](#proof-bc-convolution-faithful); [Universal C*-norm of the BC core](#proof-bc-universal-norm); [Division endomorphisms on the existing profinite ring](#proof-bc-adelic-endomorphism); [Minimal finite-adele dilation](#proof-bc-adelic-dilation); [BC algebra as a full crossed-product corner](#proof-bc-crossed-product-full-corner); [Universal and reduced BC norms agree](#proof-bc-universal-reduced); [Dense isometric core embedding](#proof-bc-completion-dense); [Positive Hecke states extend boundedly](#proof-bc-bounded-state-extension).

<a id="proof-bc-gns-generator-bounds"></a>

**Algebraic GNS generator estimates.** For every positive normalized algebraic functional φ, the GNS quotient seminorm obeys ‖μ_n[a]‖φ=‖[a]‖φ, ‖eγ[a]‖φ=‖[a]‖φ and ‖μ_n*[a]‖φ≤‖[a]‖φ. The last inequality follows from 1−μ_n μ_n* being a self-adjoint projection, hence a square.

Apply the algebraic relations inside φ(a*μ_n*μ_n a) and φ(a*eγ*eγ a). Use φ(a*(1−μ_n μ_n*)a)≥0 because the middle projection equals its own square. Bound every finite generator word, so left multiplication descends to bounded operators on the Hilbert completion.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), BC95 Proposition 18 C*-presentation, pp.431–433; CM Proposition 3.5, pp.445–446.

<a id="proof-bc-universal-norm"></a>

**Universal C*-norm of the BC core.** The supremum of ‖π(f)‖ over unital star representations of the complex BC core is finite: if f=Σc_(n,m,γ)μ_n eγ μ_m*, it is at most Σ|c_(n,m,γ)|. It is a norm, because λ is faithful. Its completion has the universal property for these representations.

Express each element in the independent normalized monomial basis. Every bounded star representation sends these monomials to contractions, giving the coefficient l1 bound. The faithful left-regular representation separates zero; the standard completion then has the stated representation property. The general completion theorem is the bounded-generator universal completion proved in this layer.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), BC95 Proposition 18 and amenability remark, pp.431–433.

<a id="proof-bc-adelic-endomorphism"></a>

**Division endomorphisms on the existing profinite ring.** On C(Ẑ), α_n(f)(x)=f(x/n) for x∈nẐ and 0 elsewhere. This is an injective star endomorphism, α_nα_m=α_nm, and α_n(1)=1_(nẐ). Import Ẑ, its p-adic product and unit subgroup from ProfiniteArithmetic; do not reconstruct these objects.

Use that n times the integral adeles is compact open. Extension by zero of the pullback is continuous; direct evaluation proves star, product and composition identities. Surjectivity onto the corner and injectivity follow by evaluating on n times each integral adele.

See [Marcelo Laca — From endomorphisms to automorphisms and back: dilations and full corners](https://arxiv.org/pdf/math/9911135), Laca §3.1, pp.8–9.

<a id="proof-bc-adelic-dilation"></a>

**Minimal finite-adele dilation.** Extension by zero i:C(Ẑ)→C0(A_f) is injective. The action β_q f(x)=f(q⁻¹x) extends α_n, and ⋃n β_(1/n)(i(C(Ẑ))) is dense in C0(A_f). Hence this is the minimal automorphic dilation.

Use the compact-open exhaustion of finite adeles by n^(-1) times the integral adeles. Functions supported on each such compact open set come from the corresponding translated integral function algebra. Compactly supported functions are dense in C0, proving minimality.

See [Marcelo Laca — From endomorphisms to automorphisms and back: dilations and full corners](https://arxiv.org/pdf/math/9911135), Laca Theorem 2.1.1, pp.5–6; Proposition 3.2.1, p.9.

<a id="proof-bc-crossed-product-full-corner"></a>

**BC algebra as a full crossed-product corner.** Let B=C0(A_f)⋊Q_+×, for β_q f(x)=f(q⁻¹x), and p=1_Ẑ. The universal BC completion is star isomorphic to pBp, sending μ_n to U_n p and eγ to its additive-character function on Ẑ. The projection p is full: the closed span of BpB is B.

Check the BC relations on U_n p and characters; use the algebraic lift. Dilate each covariant isometric representation to a unitary rational representation, as Lemma 2.1.3, pp.6–7; compression establishes the universal norm equality. The translates (1/n)Ẑ exhaust A_f, so the ideal generated by p contains a dense set of compactly supported functions and their rational translates.

See [Marcelo Laca — From endomorphisms to automorphisms and back: dilations and full corners](https://arxiv.org/pdf/math/9911135), Laca Theorem 2.2.1 and proof, pp.7–8; Proposition 3.2.1, p.9.

<a id="proof-bc-universal-reduced"></a>

**Universal and reduced BC norms agree.** Q_+× is abelian, hence amenable; its full and reduced crossed-product norms on C0(A_f) agree. The full-corner identification and the regular Hecke representation therefore give ‖f‖univ=‖λ(f)‖ for every f in the BC core.

Apply the amenable crossed-product theorem proved in this layer to the abelian positive rational group. Transport its norm equality through the full-corner maps and identify the reduced representation with the faithful Hecke representation.

See [Marcelo Laca — From endomorphisms to automorphisms and back: dilations and full corners](https://arxiv.org/pdf/math/9911135), BC95 Proposition 18 amenability remark, p.433; Laca Proposition 3.2.1 and Corollary 3.2.2, pp.9–10..

<a id="proof-bc-completion-dense"></a>

**Dense isometric core embedding.** The map ι:BCHecke C→C_Q is an injective star algebra homomorphism with dense range and ‖ι(f)‖=‖λ(f)‖. C_Q has the inherited unital C*-algebra structure of its closed star subalgebra of bounded operators.

Embed the faithful core into the operator-norm closure. Multiplication, involution and norm are inherited from bounded operators, while density is the closure property and injectivity is coefficient recovery.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

<a id="proof-bc-bounded-state-extension"></a>

**Positive Hecke states extend boundedly.** Every normalized positive complex-linear φ on the BC core has |φ(f)|≤‖λ(f)‖, and therefore a unique norm-one positive continuous extension to C_Q. Its restriction is φ; extensions agree by core density.

Use the cyclic unit vector in the bounded algebraic GNS representation to get |φ(f)|≤‖f‖univ. Replace the universal norm by the regular norm and extend continuously. Approximate a completed square by core squares to preserve positivity.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 and complete proof, pp.431–433.

<a id="kms-states-and-scaling-measures-bc-kms-scaling-correspondence"></a>

### 6.34 KMS states and scaling measures

For β>0 the maps μ↦φμ and φ↦μφ are inverse affine bijections between all normalized β-scaling Radon measures on A_f and completed KMSβ states. Restriction to Ẑ identifies the measure topology with weak convergence of its probability measures; under this topology the bijection is a homeomorphism.

The proof proceeds as follows. Expectation determines φ on rational terms; its diagonal restriction determines the normalized measure. Compare both compositions on C(Ẑ), then use scaling and density to obtain equality everywhere. Cylinder characters determine weak convergence on compact Ẑ; finite rational terms determine weak state convergence.

The result must also satisfy these compatibility requirements: Restriction to C(Ẑ) identifies completed KMSβ states with normalized measures on the finite adeles satisfying rational scaling. Off-diagonal dilation components vanish by invariance, and the KMS relation gives μ(nẐ)=n^(−β).

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Introduction, normalized scaling condition (1β) and KMS correspondence attributed to Laca, p.1.

*Needs:* [The Bost–Connes Hecke algebra](#the-bost-connes-hecke-algebra-bost-connes-hecke-algebra); [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#p-p-is-a-hecke-pair-ax-plus-b-hecke-triple); [Translations and positive dilations](#translations-and-positive-dilations-axb-named-matrices); `Rat.num_div_den`; `HeckeCoset.degree_eq_relIndex`; `HeckeCosetModule.single_mul_single`; `AddCircle`; `PNat`; `HeckeCosetModule.single`; [Positive diagonal homomorphism](#positive-diagonal-homomorphism-axb-diagonal-map); `lp`; [GlobalNumberFields layer 4 finite adeles](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles); [The presentation of the rational Bost–Connes algebra](#the-presentation-of-the-rational-bost-connes-algebra-rational-presentation); [All normalized scaling measures](#all-normalized-scaling-measures-bc-scaling-measure-space); [Completed KMS states and the bounded strip condition](#completed-kms-states-and-the-bounded-strip-condition-bc-completed-kms); [The Bost–Connes time evolution](#the-bost-connes-time-evolution-time-evolution); [The reduced Bost–Connes C*-algebra](#the-reduced-bost-connes-c-algebra-bc-cstar-completion); [KMS_β states on the Bost–Connes algebra](#kms-states-on-the-bost-connes-algebra-kms-states); [Double-coset coordinate bijection](#proof-coset-coordinate-bijection); [Double cosets of the ax+b pair and their degrees](#proof-double-cosets-and-degrees); [For n≥1, x′n xn=n·1.](#proof-bc-relation-left-inverse); [For coprime n,m≥1, xn x′m=x′m xn.](#proof-bc-relation-coprime); [For n,m≥1, x(nm)=xn xm.](#proof-bc-relation-dilations); [For n,m≥1, x′(nm)=x′n x′m.](#proof-bc-relation-inverse-dilations); [Cancellation of common dilation factors](#proof-bc-gcd-cancellation); [For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements.](#proof-bc-relation-preimage-sum); [Finite translation fibres](#proof-bc-preimage-finite); [Reduction to coprime normal forms](#proof-bc-normal-form-gcd-reduction); [For n≥1 and γ∈ℚ/ℤ, e(γ)xn=xn e(nγ).](#proof-bc-relation-transport); [For γ,δ∈ℚ/ℤ, e(γ+δ)=e(γ)e(δ).](#proof-bc-relation-translation-add); [Normal-form multiplication and common-divisor reduction](#proof-bc-normal-form-product); [Normal-form support](#proof-bc-normal-form-support); [The corrected double-coset basis is independent](#proof-bc-normal-form-independent); [Rational and isometric generator conventions](#proof-bc-complex-rescaling); [Algebraic GNS generator estimates](#proof-bc-gns-generator-bounds); [Inverse double-coset degree](#proof-inverse-coset-degree); [Finite convolution row and column counts](#proof-bc-convolution-row-column); [Schur estimate for one double coset](#proof-bc-convolution-schur); [Bounded faithful left convolution](#proof-bc-convolution-norm-bound); [Coefficient recovery and faithfulness](#proof-bc-convolution-faithful); [Universal C*-norm of the BC core](#proof-bc-universal-norm); [Division endomorphisms on the existing profinite ring](#proof-bc-adelic-endomorphism); [Minimal finite-adele dilation](#proof-bc-adelic-dilation); [BC algebra as a full crossed-product corner](#proof-bc-crossed-product-full-corner); [Universal and reduced BC norms agree](#proof-bc-universal-reduced); [Dense isometric core embedding](#proof-bc-completion-dense); [Entire Hecke orbit maps](#proof-bc-dynamics-entire-core); [Positive Hecke states extend boundedly](#proof-bc-bounded-state-extension); [Uniform correlation bound on the closed strip](#proof-bc-strip-core-bound); [Extending real dynamics to the C*-completion](#proof-bc-real-dynamics-extension); [Point-norm continuous completed dynamics](#proof-bc-dynamics-continuous); [The analytic core and the strip KMS condition](#proof-bc-analytic-core-strip-equivalence); [Diagonal expectation in the full corner](#proof-bc-corner-expectation); [Scaling measure produces a KMS state](#proof-bc-measure-to-kms); [KMS restriction reconstructs a scaling measure](#proof-bc-kms-to-measure).

<a id="proof-bc-dynamics-entire-core"></a>

**Entire Hecke orbit maps.** For each f in the finite-support Hecke core, z↦ι(σ_z f) is an entire C_Q-valued map, supported on the same finite set of double cosets. For real t it is implemented in λ by the diagonal unitary with weights a(g)^(−it).

On the support it is a finite sum of exponentials z↦exp(iz log a(X)) times fixed vectors. For the specified kernel use U_t(gH)=a(g)^(−it); conjugation multiplies K_f by a(g⁻¹h)^(it).

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

<a id="proof-bc-strip-core-bound"></a>

**Uniform correlation bound on the closed strip.** Let φ be a completed state satisfying the core KMS identity at β>0. For core a,b, F(z)=φ(ι(a σ_z b)) is entire and bounded on 0≤Imz≤β. The two boundary bounds are≤‖ι(a)‖‖ι(b)‖; the three-lines principle gives the same bound throughout the strip.

Finite spectral support bounds F on each closed strip, before invoking three-lines. The KMS identity identifies the upper boundary with φ(σ_t(b)a); both real automorphism norms are unchanged. Apply the bounded-strip maximum principle.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Definition 3.6, p.446; (3.19), p.450.

<a id="proof-bc-real-dynamics-extension"></a>

**Extending real dynamics to the C*-completion.** The real σt are isometric star automorphisms in the left representation and extend to a point-norm-continuous automorphism group on C_Q. The complex σz is retained only on the entire dense Hecke algebra.

Implement real σt by diagonal unitaries from the dilation character. Extend the norm-preserving map and inverse to the closure. Approximate by finite Hecke sums to prove point-norm continuity.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, Proposition 18 and complete proof, pp.431–433.

<a id="proof-bc-dynamics-continuous"></a>

**Point-norm continuous completed dynamics.** For every a∈C_Q, t↦σ_t(a) is continuous. Approximate a in norm by a core element, whose orbit is a finite exponential sum, and use the isometry of every σ_t to bound both approximation errors.

For each core element the orbit is a finite sum of scalar exponentials. Approximate an arbitrary completed element in norm by a core element and bound the two approximation terms using the isometric dynamics.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3 §4.2, pp.460–462.

<a id="proof-bc-analytic-core-strip-equivalence"></a>

**The analytic core and the strip KMS condition.** For β>0 a completed state is KMSβ exactly when its restriction to the dense Hecke core satisfies IsKMS β. In the core-to-strip direction, approximate both completed arguments by core arguments; the uniform strip estimate makes their correlation functions Cauchy uniformly on the closed strip.

Restrict a bounded strip correlation and use uniqueness against the entire core orbit to evaluate the upper boundary. For the converse take norm approximations a_j,b_j in the core. The bound on differences gives uniform convergence on the full closed strip. Locally uniform limits remain holomorphic, and the limits have the required two boundary values.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Definition 3.6, p.446, and entire-core identity (3.19), p.450; the externally cited general analytic-core theorem remains a source gap, while the finite-spectral-core argument is specified here.

<a id="proof-bc-corner-expectation"></a>

**Diagonal expectation in the full corner.** The reduced crossed product has the positive contractive expectation E(Σq fq Uq)=f1. Its compression to pBp maps to C(Ẑ), preserves 1 and is faithful. The dynamics multiplies the q-term by q^(it).

Import the identity-coefficient expectation of the reduced crossed product proved in this layer. Compress by the compact-open integral projection. Positivity, contractivity and faithfulness survive compression, and the compressed unit maps to the constant one function.

See [Marcelo Laca — From endomorphisms to automorphisms and back: dilations and full corners](https://arxiv.org/pdf/math/9911135), Laca §3.2, p.9; Neshveyev 2000 scaling correspondence, p.1.

<a id="proof-bc-measure-to-kms"></a>

**Scaling measure produces a KMS state.** For β>0 and a normalized β-scaling μ, the functional φμ(a)=∫Ẑ E(a) dμ is a completed KMSβ state. The rational covariance and μ(qE)=q^(−β)μ(E) prove the core KMS identity. It is positive and normalized by the expectation.

Integrate the corner expectation against the normalized measure. Check the core KMS identity on two finite crossed-product monomials using the rational scaling law and covariance. Linearity and the dense-core strip equivalence give the completed state.

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Neshveyev 2000 scaling correspondence (1β), p.1.

<a id="proof-bc-kms-to-measure"></a>

**KMS restriction reconstructs a scaling measure.** For β>0, restrict φ to C(Ẑ) and use the existing positive-functional measure representation. The KMS dilation identity implies ν(nE)=n^(−β)ν(E). This extends uniquely to a Radon μ on A_f with μ(Ẑ)=1 and μ(qE)=q^(−β)μ(E). Nonidentity rational terms have zero expectation in φ: use dynamics invariance when q≠1.

Represent the diagonal restriction by the imported positive-functional measure theorem. The KMS identity for dilations gives scaling on integral compact opens, and exhaustion extends it uniquely to finite adeles. Dynamics invariance kills all terms with rational index different from 1; diagonal uniqueness proves reconstruction.

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Neshveyev 2000 scaling correspondence, p.1.

<a id="the-symmetry-group-aut-symmetry-action"></a>

### 6.35 The symmetry group Ẑ^× = Aut(ℚ/ℤ)

For v ∈ Aut(ℚ/ℤ) (≅ Ẑ^×) there is a unique K-algebra automorphism θ_v of BCHecke K with θ_v(x_n) = x_n, θ_v(x′_n) = x′_n and θ_v(e(γ)) = e(v(γ)); on the basis, θ_v[class of [1 γ/m; 0 n/m]] = [class of [1 v(γ)/m; 0 n/m]]. It commutes with the time evolution, θ_vθ_w = θ_{vw}, and for K = ℂ it is a *-automorphism with π_u ∘ θ_v = π_{uv}, so φ_{β,u} ∘ θ_v = φ_{β,uv}.

Assume v ∈ Aut(ℚ/ℤ).

The proof proceeds as follows. The relations (a′)–(f′) are preserved: v is additive and commutes with multiplication by n on ℚ/ℤ, and permutes {δ : nδ = γ} onto {δ : nδ = v(γ)}. By the presentation (rational-presentation), θ_v is a well-defined algebra endomorphism with inverse θ_{v⁻¹}. θ_v fixes a(X), so it commutes with σ_z; it preserves the involution because v(−γ) = −v(γ). π_u(θ_v(e(γ)))ε_k = exp(2πik·u(v(γ)))ε_k.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.symmetry`: symmetry (v : AddAut (ℚ/ℤ)) : BCHecke K ≃ₐ[K] BCHecke K (AddAut is the additive twin of MulAut).
- `TauCeti.BostConnes.symmetry_e`: symmetry v (e γ) = e (v γ).
- `TauCeti.BostConnes.symmetry_x`: symmetry v (x n) = x n and symmetry v (x' n) = x' n.
- `TauCeti.BostConnes.symmetry_mul`: symmetry (v * w) = (symmetry w).trans (symmetry v).
- `TauCeti.BostConnes.symmetry_timeEvolution`: symmetry v (timeEvolution z f) = timeEvolution z (symmetry v f).

**Checks.**

- symmetry (−1) (e γ) = e (−γ).
- symmetry 1 = AlgEquiv.refl.
- gibbsState β hβ u ∘ symmetry v = gibbsState β hβ (u * v).
- Doubling on ℚ/ℤ is not bijective, and e γ ↦ e (2γ), x n ↦ x n is not an algebra map: it would send x 2 * x' 2 = 1 + e (1/2) both to itself and to 1 + e 1 = 2.

The result must also satisfy these compatibility requirements: Only v = ±1 comes from conjugating the pair (by [1 0; 0 ±1]); a general v ∈ Ẑ^× is not rational, so θ_v is defined through the presentation, not by transport of structure.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.3, (3.75), p. 461.

*Needs:* [The presentation of the rational Bost–Connes algebra](#the-presentation-of-the-rational-bost-connes-algebra-rational-presentation); [The Bost–Connes time evolution](#the-bost-connes-time-evolution-time-evolution); [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#the-representation-on-1-and-its-hamiltonian-regular-representation); `AddCircle`; `MulAut`.

<a id="kms-states-and-upper-half-plane-ground-states-bc-kms-infinity-and-ground"></a>

### 6.36 KMS∞ states and upper-half-plane ground states

For the BC system, KMS∞ means a state in the weak closure of KMSβ states along β→∞: every finite set of observables, tolerance ε>0 and threshold B is met by some β>B and KMSβ state. Ground means each correlation has a bounded holomorphic extension to the upper half-plane. These are separate predicates; the general trivial-dynamics matrix test distinguishes them.

The proof proceeds as follows. Use the finite-observable weak topology on bounded states. Use the upper-half-plane boundedness definition separately. Prove the implication by compactness/normal-family limits rather than equating the definitions.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.KMSInfinity.isLimit`: The finite-observable weak-limit criterion as β tends to infinity.
- `TauCeti.BostConnes.KMSInfinity.isGround`: The bounded holomorphic upper-half-plane correlation condition.
- `TauCeti.BostConnes.KMSInfinity.limit_isGround`: Every KMS∞ state is a ground state under the completed dynamics.

**Checks.**

- The β→∞ limit of φβ,u is the ε1 vector state.
- The extremal limit has value−1 on e(1/2).
- For trivial dynamics on M2(C), the vector state a↦a00 satisfies the same upper-half-plane ground-state predicate but fails the finite-temperature-limit predicate: a01a10 and a10a01 have state values 1 and 0. This tests the generic predicates with which the completed BC predicates are compatible.

The result must also satisfy these compatibility requirements: Define KMS∞ states as weak limits of KMSβ states as β→∞. Equivalently in this separable unital system, for every finite set of observables, ε>0 and cutoff B there is a KMSβ state with β>B approximating those values within ε. Ground states instead require φ(aσz(b)) to extend bounded holomorphically to Imz>0, continuously on the boundary. KMS∞ states are ground states; the converse is not built into either definition.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Definition 3.7 and following ground-state remark, p.447.

*Needs:* [Completed KMS states and the bounded strip condition](#completed-kms-states-and-the-bounded-strip-condition-bc-completed-kms); [The reduced Bost–Connes C*-algebra](#the-reduced-bost-connes-c-algebra-bc-cstar-completion); [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#p-p-is-a-hecke-pair-ax-plus-b-hecke-triple); [Translations and positive dilations](#translations-and-positive-dilations-axb-named-matrices); `Rat.num_div_den`; `HeckeCoset.degree_eq_relIndex`; [Positive diagonal homomorphism](#positive-diagonal-homomorphism-axb-diagonal-map); `lp`; [The Bost–Connes Hecke algebra](#the-bost-connes-hecke-algebra-bost-connes-hecke-algebra); [The Bost–Connes time evolution](#the-bost-connes-time-evolution-time-evolution); [Double-coset coordinate bijection](#proof-coset-coordinate-bijection); [Double cosets of the ax+b pair and their degrees](#proof-double-cosets-and-degrees); [Inverse double-coset degree](#proof-inverse-coset-degree); [Finite convolution row and column counts](#proof-bc-convolution-row-column); [Schur estimate for one double coset](#proof-bc-convolution-schur); [Bounded faithful left convolution](#proof-bc-convolution-norm-bound); [Coefficient recovery and faithfulness](#proof-bc-convolution-faithful); [Dense isometric core embedding](#proof-bc-completion-dense); [Entire Hecke orbit maps](#proof-bc-dynamics-entire-core); [Extending real dynamics to the C*-completion](#proof-bc-real-dynamics-extension); [Point-norm continuous completed dynamics](#proof-bc-dynamics-continuous); [KMS-infinity limits are ground states](#proof-bc-kms-limit-ground); [Ground and KMS-infinity differ for trivial dynamics](#proof-bc-trivial-dynamics-test).

<a id="proof-bc-kms-limit-ground"></a>

**KMS-infinity limits are ground states.** For a unital C*-system with point-norm continuous dynamics, each KMS∞ state is a ground state. On every finite upper strip the KMSβ correlation functions, for sufficiently large β, are bounded by ‖a‖‖b‖; use normal families and boundary convergence.

Take beta tending to infinity along the weak state limit. On each fixed upper strip the correlation functions have a common norm bound once beta exceeds its height. A diagonal normal-family limit is analytic on the upper half-plane and has the required boundary values.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Definition 3.7, p.447.

<a id="proof-bc-trivial-dynamics-test"></a>

**Ground and KMS-infinity differ for trivial dynamics.** For M₂(C) with σ_t=id, every state is a ground state, while every KMSβ state is tracial and every KMS∞ state is tracial. The vector state a↦a₀₀ is ground and is not KMS∞: on matrix units it gives φ(E₀₁E₁₀)=1 and φ(E₁₀E₀₁)=0.

With trivial dynamics every correlation function is constant and bounded on the upper half-plane. The KMS boundary condition reduces to the trace identity and traces form a weakly closed set. Evaluate the two matrix-unit products in the vector state to exclude that identity.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Definition 3.7 discussion, p.447.

<a id="the-trigonometric-arithmetic-algebra-equals-the-bc-rational-form-bc-arithmetic-algebra-generation"></a>

### 6.37 The trigonometric arithmetic algebra equals the BC rational form

The rational subalgebra generated by e1,a for all a is Q[Q/Z]. The finite Fourier formula gives containment in the group algebra, and the root-recovery lemma gives the opposite containment. This is a statement about the diagonal rational group algebra; adjoining isometries and complexification are separate results.

The proof proceeds as follows. Use the finite Fourier sum for the first inclusion. Use root recovery and the spanning basis e(a) for the reverse inclusion.

The result must also satisfy these compatibility requirements: The e1,a generate Q[Q/Z]. Together with μn,μn* they generate the arithmetic algebra A1,Q; complexification gives the dense complex algebra. This is BC’s normalized rational form and is compared to the Q-valued Hecke form only through σ−i/2, which is not a star map.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Theorem 3.30 and proof, pp.467–470.

*Needs:* [First trigonometric Eisenstein function](#first-trigonometric-eisenstein-function-bc-trigonometric-eisenstein); [Eisenstein recurrence polynomials](#eisenstein-recurrence-polynomials-bc-eisenstein-polynomials); `ArithmeticFunction.moebius`; `ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq`; [Higher trigonometric Eisenstein functions](#higher-trigonometric-eisenstein-functions-bc-eisenstein-higher); `Polynomial`; `MvPolynomial.mul_esymm_eq_sum`; `Complex.exp`; [The Bost–Connes Hecke algebra](#the-bost-connes-hecke-algebra-bost-connes-hecke-algebra); [The presentation of the rational Bost–Connes algebra](#the-presentation-of-the-rational-bost-connes-algebra-rational-presentation); [Finite cotangent Fourier identity](#proof-bc-eisenstein-finite-fourier); [Möbius divisibility identities](#proof-bc-eisenstein-mobius-divisibility); [The Eisenstein division formula](#proof-bc-eisenstein-division); [Recovering prime-power divisibility projections](#proof-bc-eisenstein-prime-projections); [Rational power sums in a prime corner](#proof-bc-eisenstein-corner-power-sums); [Newton identities in the reduced corner](#proof-bc-eisenstein-newton-rationality); [Roots of the reduced polynomial](#proof-bc-eisenstein-cotangent-roots); [Polynomial recovery of the Cayley transform](#proof-bc-eisenstein-bezout-cayley); [Eisenstein algebra is stable under semigroup endomorphisms](#proof-bc-eisenstein-semigroup-preservation); [Reassembly of the prime-power components](#proof-bc-eisenstein-prime-level-induction); [Recovering roots of unity from Eisenstein functions](#proof-bc-eisenstein-roots-recovery); [Arithmetic generation after adjoining isometries](#proof-bc-eisenstein-isometry-generation); [Complexification of the arithmetic form](#proof-bc-eisenstein-complexification).

<a id="proof-bc-eisenstein-mobius-divisibility"></a>

**Möbius divisibility identities.** For fn(j)=Σd|j μ(d)(j/d)^n, the projection sum Σd|N fn(d)πd evaluates on a Q-lattice to m^n, where m is the order of its N-torsion kernel. Keep n=1 and n=1−k, including negative exponents.

Write divisibility projections as indicator functions of divisors of m. Use finite Möbius inversion. Retain rational negative powers when deriving the k-division relation.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, equations (3.103)–(3.107), p.466.

<a id="proof-bc-eisenstein-division"></a>

**The Eisenstein division formula.** For k≥1, ΣNa=0 ek,a=γk Σd|N[(2^k−2)f1(d)+N^k f1−k(d)]πd, with γk=(2πi)^(−k)Σy∈Z\{0} y^(−k) in the source normalization (symmetric principal value for k=1; absolute convergence for k>1). For odd k the vanishing is interpreted consistently. Both the arithmetic coefficients and the degenerate-value convention are fixed by the preceding identities.

Count the m-fold fibres of the N-torsion map. Evaluate the nondegenerate trigonometric sum plus the degenerate correction. Replace powers of m by the Möbius projection sums.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Lemma 3.29, (3.108)–(3.109), p.467.

<a id="proof-bc-eisenstein-prime-projections"></a>

**Recovering prime-power divisibility projections.** All projections πp^b belong to the Q-algebra generated by e1,a. For odd p, solve the k=2 division relation inductively in b. For p=2 the leading π2^b coefficient vanishes, so use the relation at N=2^(b+1) to recover π2^b; e.g. π2=3+2Σ4a=0 e2,a.

Compute the leading coefficient−p^(b−1)(2−3p+p²). For p=2 retain the nonzero next projection coefficient at the doubled torsion level. Use coprime products to recover allπN.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, proof of Theorem 3.30, prime-power and doubled dyadic level step, pp.467–468.

<a id="proof-bc-eisenstein-corner-power-sums"></a>

**Rational power sums in a prime corner.** Let N=p^b, e=1−πp, and zj=e e1,j/N for 1≤j<N in the unital corner eQ[Q/Z]. The division formula gives Σj Pk(zj)=(N^k−1)γk e for every k≥1, where Pk is evaluated with corner unit e. Since Pk is monic of degree k, triangular induction gives Σj zj^k∈Qe. Zero roots and repeated roots are retained; there are N−1 indices.

Multiply the division identity by e and subtract the j=0 term Pk(0)e. Solve successively for each ordinary power sum using the monic polynomial Pk and previously known lower powers.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, proof of Theorem 3.30, (3.110)–(3.113), p.468.

<a id="proof-bc-eisenstein-newton-rationality"></a>

**Newton identities in the reduced corner.** For the N−1 commuting elements zj in the preceding corner, all elementary symmetric functions σh(z1,…,zN−1) belong to Qe. Hence QN(X)=∏j=1.N−1(X−zj) is a monic degree-N−1 polynomial with rational scalar coefficients in that corner and QN(z1)=0.

Use hσh=Σk=1.h(−1)^(k−1)σh−k sk over Q. Division by each positive h is permitted, so induction gives rational coefficients. The product polynomial vanishes at z1 by its first factor; its degree is N−1 regardless of zero-root multiplicity.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, proof of Theorem 3.30, (3.113)–(3.115), pp.468–469.

<a id="proof-bc-eisenstein-cotangent-roots"></a>

**Roots of the reduced polynomial.** At an invertible Q-lattice, QN has multiset of roots cot(πj/N)/(2i), 1≤j<N. A unit character permutes this multiset. These roots are purely imaginary, so 1/2 is never a root. For even N the root at j=N/2 is zero and must be retained.

Evaluate the corner polynomial in an invertible lattice and list all N-1 nontrivial torsion characters. A unit permutes this list. Each cotangent is real, so its division by 2i is purely imaginary and differs from 1/2; the even-level zero remains a root.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, proof of Theorem 3.30, (3.113)–(3.115), p.468.

<a id="proof-bc-eisenstein-bezout-cayley"></a>

**Polynomial recovery of the Cayley transform.** Since QN(1/2)≠0, gcd(QN,2X−1)=1 in Q[X]. Bézout yields U,V∈Q[X] with U(2X−1)+VQN=1. In the reduced corner, 2z1−e is invertible with inverse U(z1), and (2z1+e)U(z1)=e e(1/N). Thus this root-of-unity component lies in the Eisenstein algebra.

Evaluate the Bézout identity at z1; QN(z1)=0. Use the finite cotangent Fourier identity to identify (2z1+e)/(2z1−e) with e times the root of unity.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, proof of Theorem 3.30, (3.113)–(3.117), pp.468–469.

<a id="proof-bc-eisenstein-semigroup-preservation"></a>

**Eisenstein algebra is stable under semigroup endomorphisms.** For αn(f)=μn f μn*, αn(ek,a)=πn ek,a/n, independently of the chosen n-preimage a/n. The projections πn belong to the algebra generated by first functions, so αn preserves that algebra.

Apply dilation covariance to every term of the finite first-function Fourier expression. It produces the range projection times the selected preimage expression; different preimages agree after multiplying by that projection. Polynomial evaluation gives all higher functions.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, (3.117), p.469, and the following induction, pp.469–470; projections in Lemmas 3.27–3.28, pp.464–465.

<a id="proof-bc-eisenstein-prime-level-induction"></a>

**Reassembly of the prime-power components.** For N=p^b, the (1−πp)e(1/N) component is supplied by the Cayley lemma. The other component is πp e(1/N)=αp(e(p/N)); the induction hypothesis at p^(b−1) and semigroup preservation put it in the Eisenstein algebra. At b=1 its lower-level input is e(0)=1. Adding the complementary components recovers e(1/N).

Split e(1/N) by the complementary prime projection. The Cayley lemma recovers the complementary corner; semigroup covariance expresses the prime-projection part through the lower-level torsion element. Induct on b with e(0)=1 as the base.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, last part of Theorem 3.30 proof, pp.469–470.

<a id="proof-bc-eisenstein-roots-recovery"></a>

**Recovering roots of unity from Eisenstein functions.** Every e(a), a∈Q/Z, belongs to the Q-algebra generated by first trigonometric Eisenstein functions. Prime-power denominators follow from reduced-corner Newton identities, the Bézout Cayley inverse and the explicit lower-level induction. General denominators follow by writing a as a sum of its prime-primary components and using e(a+b)=e(a)e(b).

Apply the prime-level induction separately to each prime power in the denominator. Decompose the torsion point into prime-primary summands and multiply the recovered roots.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, proof of Theorem 3.30, (3.110)–(3.117), pp.468–469.

<a id="proof-bc-eisenstein-isometry-generation"></a>

**Arithmetic generation after adjoining isometries.** The Q-algebra generated by all first functions and μn,μn* equals the normalized arithmetic form A1,Q spanned by μn e(a) μm*. The comparison to Q-valued Hecke functions is through σ−i/2 and is not a star-algebra identification.

Recover every torsion generator from the first functions by the prime-level induction. The eight relations reduce every word with isometries and adjoints to the normalized arithmetic monomial span. The imaginary-time comparison records which rational form this is.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Theorem 3.30, pp.467–470; rational-form convention pp.460–462.

<a id="proof-bc-eisenstein-complexification"></a>

**Complexification of the arithmetic form.** The scalar-extension map C⊗Q A1,Q→H_C is an algebra isomorphism sending 1⊗μn e(a) μm* to the normalized complex normal form. Its image is dense in the completed BC algebra. Rational Hecke and arithmetic forms remain distinct subalgebras until the specified imaginary-time comparison.

Use linear independence and spanning of normalized complex normal forms to prove bijectivity of scalar extension. Use density of the Hecke core in its operator-norm completion.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Theorem 3.30 and surrounding discussion, pp.460–470.

<a id="ground-state-at-an-invertible-lattice-bc-vector-ground-state"></a>

### 6.38 Ground state at an invertible lattice

For each unit character u, the representation πu has a continuous extension to C_Q. Its vector functional at ε1 is a normalized positive state φ∞,u. It is the weak limit of Gibbsβ,u as β→∞ and hence a KMS-infinity state. Evaluation on μn eγ μm* is zero unless n=m=1, when it is exp(2πi uγ).

The proof proceeds as follows. Extend the bounded core representation to the completion. Its epsilon_1 vector functional is positive and normalized. Dominate the Gibbs tail by the zeta tail to prove pointwise convergence as beta grows, then evaluate the normalized monomial on epsilon_1.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.KMSInfinity.vectorState_one`: φ∞,u(1)=1.
- `TauCeti.BostConnes.KMSInfinity.vectorState_basis`: The normalized basis has the stated zero/character values.
- `TauCeti.BostConnes.KMSInfinity.vectorState_isLimit`: φ∞,u is KMS-infinity.

**Checks.**

- The vector state sends 1 to 1.
- It sends e(1/2) to −1.
- It sends μ2 to 0.

See [Jean-Benoît Bost and Alain Connes — Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf), §4, extremal states and zero-temperature limit, pp.434–436; CM Theorem 3.32, pp.474–476; [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Theorem 3.32, pp.474–476.

*Needs:* [The Bost–Connes Hecke algebra](#the-bost-connes-hecke-algebra-bost-connes-hecke-algebra); [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#p-p-is-a-hecke-pair-ax-plus-b-hecke-triple); [Translations and positive dilations](#translations-and-positive-dilations-axb-named-matrices); `Rat.num_div_den`; `HeckeCoset.degree_eq_relIndex`; `HeckeCosetModule.single_mul_single`; `AddCircle`; `PNat`; `HeckeCosetModule.single`; [Positive diagonal homomorphism](#positive-diagonal-homomorphism-axb-diagonal-map); `lp`; [GlobalNumberFields layer 4 finite adeles](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles); [The presentation of the rational Bost–Connes algebra](#the-presentation-of-the-rational-bost-connes-algebra-rational-presentation); [The reduced Bost–Connes C*-algebra](#the-reduced-bost-connes-c-algebra-bc-cstar-completion); [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#the-representation-on-1-and-its-hamiltonian-regular-representation); [Double-coset coordinate bijection](#proof-coset-coordinate-bijection); [Double cosets of the ax+b pair and their degrees](#proof-double-cosets-and-degrees); [For n≥1, x′n xn=n·1.](#proof-bc-relation-left-inverse); [For coprime n,m≥1, xn x′m=x′m xn.](#proof-bc-relation-coprime); [For n,m≥1, x(nm)=xn xm.](#proof-bc-relation-dilations); [For n,m≥1, x′(nm)=x′n x′m.](#proof-bc-relation-inverse-dilations); [Cancellation of common dilation factors](#proof-bc-gcd-cancellation); [For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements.](#proof-bc-relation-preimage-sum); [Finite translation fibres](#proof-bc-preimage-finite); [Reduction to coprime normal forms](#proof-bc-normal-form-gcd-reduction); [For n≥1 and γ∈ℚ/ℤ, e(γ)xn=xn e(nγ).](#proof-bc-relation-transport); [For γ,δ∈ℚ/ℤ, e(γ+δ)=e(γ)e(δ).](#proof-bc-relation-translation-add); [Normal-form multiplication and common-divisor reduction](#proof-bc-normal-form-product); [Normal-form support](#proof-bc-normal-form-support); [The corrected double-coset basis is independent](#proof-bc-normal-form-independent); [Rational and isometric generator conventions](#proof-bc-complex-rescaling); [Algebraic GNS generator estimates](#proof-bc-gns-generator-bounds); [Inverse double-coset degree](#proof-inverse-coset-degree); [Finite convolution row and column counts](#proof-bc-convolution-row-column); [Schur estimate for one double coset](#proof-bc-convolution-schur); [Bounded faithful left convolution](#proof-bc-convolution-norm-bound); [Coefficient recovery and faithfulness](#proof-bc-convolution-faithful); [Universal C*-norm of the BC core](#proof-bc-universal-norm); [Division endomorphisms on the existing profinite ring](#proof-bc-adelic-endomorphism); [Minimal finite-adele dilation](#proof-bc-adelic-dilation); [BC algebra as a full crossed-product corner](#proof-bc-crossed-product-full-corner); [Universal and reduced BC norms agree](#proof-bc-universal-reduced); [Dense isometric core embedding](#proof-bc-completion-dense); [Positive Hecke states extend boundedly](#proof-bc-bounded-state-extension).

<a id="the-partition-function-is-the-riemann-zeta-function-partition-function"></a>

### 6.39 The partition function is the Riemann zeta function

For β>1, the diagonal sum of e^(−βH) in the positive-integer basis is Σ k^(−β)=ζ(β). The positive scalar series diverges for β≤1. The state-classification theorem, rather than this scalar identity alone, establishes the phase transition at β=1.

Assume β ∈ ℝ; the trace is taken as the diagonal sum in the basis (ε_k).

The proof proceeds as follows. e^{−βH}ε_k = k^{−β}ε_k, so the diagonal sum is Σ k^{−β}. For β > 1 this is riemannZeta β (zeta_eq_tsum_one_div_nat_cpow); for β ≤ 1 the series diverges by comparison with the harmonic series.

The result must also satisfy these compatibility requirements: The value at β = 2 is π²/6 (riemannZeta_two). The diagonal sum of a positive diagonal operator is its trace in any orthonormal basis; that basis independence is the trace-class statement recorded as a gap, and nothing here uses it.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.6, (3.142), p. 476; [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.6, (3.140)–(3.141), p. 475.

*Needs:* [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#the-representation-on-1-and-its-hamiltonian-regular-representation); `riemannZeta`; `zeta_eq_tsum_one_div_nat_cpow`; [BC diagonal heat operator](#bc-diagonal-heat-operator-bc-diagonal-heat-operator).

<a id="critical-regime-kms-uniqueness-bc-low-temperature-uniqueness"></a>

### 6.40 Critical-regime KMS uniqueness

For 0<β≤1 every normalized β-scaling measure equals the canonical μβ, and therefore there is exactly one completed KMSβ state. The proof uses the explicit canonical extremality and compact-unit average rigidity, rather than assuming a general Choquet decomposition.

The proof proceeds as follows. Average an arbitrary normalized scaling measure over the compact unit group; the cylinder calculation identifies its average with the canonical measure (bc-unit-average). The canonical measure is extreme by ergodicity and the Radon–Nikodym argument (bc-canonical-extreme). Apply bc-extreme-average-rigidity to the average: an extreme barycentre forces the continuous orbit of the original measure to be constant. Use the affine KMS/scaling correspondence to transfer measure uniqueness to completed KMS-state uniqueness. The local Fourier-value computation is a separate consequence, not a Choquet premise.

The result must also satisfy these compatibility requirements: For0<β≤1 the completed Bost–Connes system has a unique KMSβ state. On e(a/b), with gcd(a,b)=1, its value is b^(−β)∏p|b(1−p^(β−1))/(1−p^(−1)).

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Corollary and proof, p.3 (p.4 contains references).

*Needs:* [Ergodicity of positive rationals on finite adeles](#ergodicity-of-positive-rationals-on-finite-adeles-bc-critical-ergodicity); [All normalized scaling measures](#all-normalized-scaling-measures-bc-scaling-measure-space); [The finite-adele scaling measure](#the-finite-adele-scaling-measure-bc-adelic-scaling-measure); [KMS states and scaling measures](#kms-states-and-scaling-measures-bc-kms-scaling-correspondence); [Ergodic scaling measure is extreme](#proof-bc-canonical-extreme); [Unit average of a scaling measure](#proof-bc-unit-average); [Extreme unit average is constant](#proof-bc-extreme-average-rigidity).

<a id="proof-bc-canonical-extreme"></a>

**Ergodic scaling measure is extreme.** For 0<β≤1, if μβ=tμ1+(1−t)μ2 for normalized β-scaling measures and 0<t<1, then μ1=μ2=μβ. The Radon–Nikodym density dμ1/dμβ is bounded by 1/t and Q+×-invariant, hence constant by ergodicity; normalization makes the constant one.

Domination by the convex combination bounds the Radon-Nikodym density. Equal scaling laws make the density invariant under every rational dilation. Ergodicity makes it constant; normalization fixes the constant and then both summands.

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Corollary proof, p.3; direct measure form of extremality.

<a id="proof-bc-unit-average"></a>

**Unit average of a scaling measure.** For any normalized β-scaling measure μ, its average over W=Ẑ× with normalized Haar measure is again normalized and β-scaling, is W-invariant, and equals the canonical product-density μβ. Equality follows from finite valuation/unit cylinders, then a countable rational-dilate exhaustion of A_f.

On every compact rational dilate, integrate the finite measures over compact W; Fubini gives normalization and scaling. W invariance makes unit residues Haar and scaling fixes each valuation-shell mass. Cylinder uniqueness yields the product measure.

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Unique W-invariant measure, p.2; Corollary argument, p.3.

<a id="proof-bc-extreme-average-rigidity"></a>

**Extreme unit average is constant.** Let μ be a normalized scaling measure whose compact-unit average is the extreme μβ. Then u_*μ=μβ for every u∈W. For any finite-measure cylinder test, a nonconstant continuous value in u would split Haar into two positive pieces and give a nontrivial convex decomposition of μβ. Cylinder tests separate measures; setting u=1 proves μ=μβ.

Evaluate the unit translates on compact-cylinder test functions. If one value varies continuously, two positive-Haar pieces yield distinct normalized averaged scaling measures whose convex combination is the canonical extreme. This contradiction makes all test integrals constant; separating tests and the identity unit recover the original measure.

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Corollary conclusion and averaging argument, p.3.

### 6.41 The measured operator algebra and factor classification

For a countable group G acting essentially freely and nonsingularly on a nonzero standard sigma-finite measure space (X,μ), construct `nonsingularGroupMeasureAlgebra` as the von Neumann algebra on ℓ²(G)⊗L²(X,μ) generated by M_f ξ(h,x)=f(x)ξ(h,x) for f∈L∞(X,μ) and U_g ξ(h,x)=sqrt(ρ_g(x)) ξ(g⁻¹h,g⁻¹x), where ρ_g is the pushforward derivative at x. Prove these operators are well-defined on almost-everywhere classes, U_g are unitary and U_gM_fU_g*=M_(f∘g⁻¹). Define its center and factor predicate, and construct the continuous core using the modular automorphism group of a faithful normal semifinite weight. The flow of weights is the dual real action on the center of that core, independent up to conjugacy of the weight. For a type III factor, type III₁ means that this center is one-dimensional. Construct the normal state GNS comparison as well. Prove that its center is the invariant part of L∞(X,μ), so ergodicity makes it a factor. Prove that the full nonnegative ratio set gives type III₁ and that every nonzero corner of a type III₁ factor has the same type. Establish the normal GNS identification for the expectation state on pMp separately from the C⋆-corner isomorphism.

The intended interface is:

- `groupMeasureAlgebra.center`: for an essentially free action the central multiplication operators are exactly the invariant functions.
- `groupMeasureAlgebra.ratioSet_typeIII1`: under ergodicity and essential freeness, ratio set [0,∞) implies type III₁.
- `groupMeasureAlgebra.corner_typeIII1`: a nonzero projection in a type III₁ factor gives a type III₁ corner.
- `groupMeasureAlgebra.expectation_gns`: the normalized expectation state on an integrable nonzero corner has the asserted von Neumann compression as its GNS algebra.

**Checks.**

- A transitive free action of a finite group on itself with counting measure gives a full finite matrix factor, with ratio set {1}; it must not be classified as type III₁.
- The trivial group acting on a two-point probability space gives a two-dimensional commutative center and fails ergodicity and the factor conclusion.
- For the positive rational action on A_f, qx=x with q≠1 forces x=0 since q−1 is an invertible adele. The scaling measure assigns {0} mass zero, so this witness verifies essential freeness.
- A zero projection yields the zero corner and is excluded. A nonzero corner of a finite matrix factor remains finite, so fullness or nonzero compression alone cannot prove type III₁.

See Neshveyev, [Ergodicity of the action of the positive rationals on the group of finite adeles](https://arxiv.org/pdf/math/0002141), corollary proof, p.3; and [Von Neumann algebras of the Bost–Connes type](https://arxiv.org/pdf/0907.1456), §1, pp.1–2 and Theorem 2.1, p.3. These sources apply the general ratio-set and group-measure classification. The general classification proofs and the flow-of-weights construction they cite remain explicit source obligations for this subsection.

*Needs:* standard measure-space quotients, Radon–Nikodym derivatives, Hilbert-space operator algebras, the ratio-set definition below, and the expectation/compression construction. Its arithmetic application follows the ergodicity and full-ratio-set proofs below.

<a id="the-critical-kms-factors-have-type-iii-bc-type-three-one"></a>

### 6.42 The critical KMS factors have type III₁

For 0<β≤1, the GNS von Neumann algebra of the unique completed Bost–Connes KMSβ state is a type III1 factor. The proof passes through the full positive ratio set, the ergodic group-measure factor and its nonzero compression by 1Ẑ.

The proof proceeds as follows. Use ergodicity for factoriality. Lift the positive ratio set through the compact quotient, as required by Neshveyev Theorem2.1. Use the nonsingular crossed-product/type classification and preserve type under a full corner.

The result must also satisfy these compatibility requirements: For0<β≤1 the GNS von Neumann algebra of the unique completed KMSβ state is a factor of type III₁. In particular this proves the requiredβ=1 type statement. Lift the valuation quotient ratio computation through the compact unit action and the full-corner crossed-product description.

See [Sergey Neshveyev — Von Neumann algebras arising from Bost–Connes type systems](https://arxiv.org/pdf/0907.1456v1), §1 and §2, Lemma 2.3 and Theorem 2.1, pp.2–5.

*Needs:* [The Bost–Connes Hecke algebra](#the-bost-connes-hecke-algebra-bost-connes-hecke-algebra); [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#p-p-is-a-hecke-pair-ax-plus-b-hecke-triple); [Translations and positive dilations](#translations-and-positive-dilations-axb-named-matrices); `Rat.num_div_den`; `HeckeCoset.degree_eq_relIndex`; `HeckeCosetModule.single_mul_single`; `AddCircle`; `PNat`; `HeckeCosetModule.single`; [Positive diagonal homomorphism](#positive-diagonal-homomorphism-axb-diagonal-map); `lp`; [GlobalNumberFields layer 4 finite adeles](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles); [The presentation of the rational Bost–Connes algebra](#the-presentation-of-the-rational-bost-connes-algebra-rational-presentation); [KMS states and scaling measures](#kms-states-and-scaling-measures-bc-kms-scaling-correspondence); [Ergodicity of positive rationals on finite adeles](#ergodicity-of-positive-rationals-on-finite-adeles-bc-critical-ergodicity); [All normalized scaling measures](#all-normalized-scaling-measures-bc-scaling-measure-space); [qualitative prime asymptotics](#prerequisites-and-boundaries); [Ratio set of a nonsingular action](#ratio-set-of-a-nonsingular-action-bc-ratio-set); [The finite-adele scaling measure](#the-finite-adele-scaling-measure-bc-adelic-scaling-measure); [Double-coset coordinate bijection](#proof-coset-coordinate-bijection); [Double cosets of the ax+b pair and their degrees](#proof-double-cosets-and-degrees); [For n≥1, x′n xn=n·1.](#proof-bc-relation-left-inverse); [For coprime n,m≥1, xn x′m=x′m xn.](#proof-bc-relation-coprime); [For n,m≥1, x(nm)=xn xm.](#proof-bc-relation-dilations); [For n,m≥1, x′(nm)=x′n x′m.](#proof-bc-relation-inverse-dilations); [Cancellation of common dilation factors](#proof-bc-gcd-cancellation); [For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements.](#proof-bc-relation-preimage-sum); [Finite translation fibres](#proof-bc-preimage-finite); [Reduction to coprime normal forms](#proof-bc-normal-form-gcd-reduction); [For n≥1 and γ∈ℚ/ℤ, e(γ)xn=xn e(nγ).](#proof-bc-relation-transport); [For γ,δ∈ℚ/ℤ, e(γ+δ)=e(γ)e(δ).](#proof-bc-relation-translation-add); [Normal-form multiplication and common-divisor reduction](#proof-bc-normal-form-product); [Normal-form support](#proof-bc-normal-form-support); [The corrected double-coset basis is independent](#proof-bc-normal-form-independent); [Rational and isometric generator conventions](#proof-bc-complex-rescaling); [Algebraic GNS generator estimates](#proof-bc-gns-generator-bounds); [Inverse double-coset degree](#proof-inverse-coset-degree); [Finite convolution row and column counts](#proof-bc-convolution-row-column); [Schur estimate for one double coset](#proof-bc-convolution-schur); [Bounded faithful left convolution](#proof-bc-convolution-norm-bound); [Coefficient recovery and faithfulness](#proof-bc-convolution-faithful); [Universal C*-norm of the BC core](#proof-bc-universal-norm); [Division endomorphisms on the existing profinite ring](#proof-bc-adelic-endomorphism); [Minimal finite-adele dilation](#proof-bc-adelic-dilation); [BC algebra as a full crossed-product corner](#proof-bc-crossed-product-full-corner); [Reciprocal primes in progressions](#proof-bc-prime-progression-divergence); [Prime pairs with prescribed ratio and divergent weights](#proof-bc-prime-pair-ratio); [Valuation-tail cylinder ratios](#proof-bc-valuation-tail-ratio); [Prime pairs with controlled unit residues](#proof-bc-prime-pairs-congruence); [Independent tail swaps give essential ratios](#proof-bc-asymptotic-ratio-inclusion); [Ratio witnesses lift through unit cylinders](#proof-bc-ratio-unit-lifting); [All positive numbers belong to the ratio set](#proof-bc-full-positive-ratio-set); [Ergodicity makes the group-measure algebra a factor](#proof-bc-ergodic-crossed-product-factor); [Full positive ratio set determines type III1](#proof-bc-ratio-factor-type); [A nonzero full corner preserves factor type](#proof-bc-full-corner-type).

<a id="proof-bc-prime-pair-ratio"></a>

**Prime pairs with prescribed ratio and divergent weights.** For0<β≤1, λ>1 and ε>0 there are disjoint prime pairs(pn,qn) with |(qn/pn)^β−λ|<ε and Σn qn^(−β)=∞.

Choose multiplicative intervals(λ^(2m)x0,(1+δ)λ^(2m)x0] and their alternating partners, adjustingλ toλ^(1/β). Use the prime number theorem to inject the smaller prime list into the partner list. The interval cardinalities divided by the upper endpoint give a divergent harmonic-m sum; β≤1 retains divergence.

See [Sergey Neshveyev — Von Neumann algebras arising from Bost–Connes type systems](https://arxiv.org/pdf/0907.1456v1), §1 and §2, Lemma 2.3 and Theorem 2.1, pp.2–5.

<a id="proof-bc-valuation-tail-ratio"></a>

**Valuation-tail cylinder ratios.** For distinct primes p,q, the valuation swap (vp,vq)=(0,1)→(1,0) has target/source cylinder mass ratio (q/p)^β. Under the pushforward-at-target convention, the derivative of this forward map x↦(p/q)x is (p/q)^β; the inverse map has derivative (q/p)^β. Both values enter the ratio-set subgroup. The factors (1−p^(−β))(1−q^(−β)) cancel.

Multiply the two local probabilities. Cancel the two(1−p^(−β)) normalizers in the ratio. Use q^(−β)(1−p^(−β))(1−q^(−β)) and the prime-pair divergence.

See [Sergey Neshveyev — Von Neumann algebras arising from Bost–Connes type systems](https://arxiv.org/pdf/0907.1456v1), Theorem 2.1 proof, pp.4–5; §1 convention, p.2.

<a id="proof-bc-prime-pairs-congruence"></a>

**Prime pairs with controlled unit residues.** For N≥1, λ>1 and ε>0, fixed-progression PNT supplies disjoint prime pairs p_n,q_n≡1(modN) with q_n/p_n→λ and Σp_n^(−1)=∞. Select primes in two disjoint proportional intervals inside successive geometric blocks, matching their counts with a fixed positive density. For 0<β≤1 the pair-swap source masses also have divergent sum.

Apply PNT in the residue class 1 mod N to paired intervals [X,(1+δ)X] and [λX,λ(1+δ)X]. Choose δ small enough for the desired ratio tolerance; matching counts are bounded below by cX/logX. Separate successive blocks geometrically; each block contributes ≥c/logX to Σ1/p, so the block sum diverges. A diagonal tolerance choice preserves this divergence.

See [Sergey Neshveyev — Von Neumann algebras arising from Bost–Connes type systems](https://arxiv.org/pdf/0907.1456v1), Lemma 2.3 and complete proof, p.4; Theorem 2.1 application p.5, with the stated fixed-progression refinement.

<a id="proof-bc-asymptotic-ratio-inclusion"></a>

**Independent tail swaps give essential ratios.** On a product of countable probability spaces, suppose mutually disjoint finite coordinate blocks have bijective swaps with cylinder mass ratios approaching λ>0 uniformly and a divergent sum of source cylinder masses. Then λ belongs to the ratio set of the finite-tail equivalence relation. The pushforward derivative of the inverse swap at its target equals the forward cylinder mass ratio.

Independent blocks and the divergent sum give arbitrarily distant successful swaps of positive total mass. Approximate any positive-measure set by a finite cylinder in relative measure, then select a tail block for which source and image both meet that set with positive mass. Apply the inverse swap so its target derivative has the stated mass ratio.

See [Sergey Neshveyev — Von Neumann algebras arising from Bost–Connes type systems](https://arxiv.org/pdf/0907.1456v1), §1 asymptotic ratio definition and inclusion, p.2.

<a id="proof-bc-ratio-unit-lifting"></a>

**Ratio witnesses lift through unit cylinders.** For any finite cylinder of integral adeles, choose its congruence level N and all its specified valuation primes. Tail pairs p,q≡1(modN), beyond those primes, act trivially on the cylinder unit residues. Their swaps therefore retain the independent-tail essential-ratio witnesses on the full adele space, rather than only on its quotient by W.

Approximate a positive-measure set by a finite valuation-and-residue cylinder. Select tail prime pairs outside those coordinates and congruent to one at its finite level. Their rational swaps preserve specified unit residues, so independent-tail witnesses lift with positive measure.

See [Sergey Neshveyev — Von Neumann algebras arising from Bost–Connes type systems](https://arxiv.org/pdf/0907.1456v1), Theorem 2.1 proof, pp.4–5; specialized congruence-cylinder lifting.

<a id="proof-bc-full-positive-ratio-set"></a>

**All positive numbers belong to the ratio set.** For 0<β≤1 the nonsingular Q+× action on (A_f,μβ) has RatioSet=[0,∞). Its pushforward density is ρq(x)=q^β. Prime pairs with fixed unit congruences give every λ>1 after the β power; inverses give λ∈(0,1), and closure gives 0.

Approximate any finite positive-measure set by a finite valuation and unit cylinder. Use congruence-controlled disjoint pairs and the independent-tail inclusion; the inverse swap fixes the derivative convention. Close the resulting multiplicative subgroup and use a rational-dilate exhaustion for arbitrary positive-measure sets.

See [Sergey Neshveyev — Von Neumann algebras arising from Bost–Connes type systems](https://arxiv.org/pdf/0907.1456v1), §1 and §2, Lemma 2.3 and Theorem 2.1, pp.2–5.

<a id="proof-bc-ergodic-crossed-product-factor"></a>

**Ergodicity makes the group-measure algebra a factor.** For the canonical μβ, the Q+× action is essentially free: qx=x with q≠1 forces x=0, a null point. For a countable essentially free nonsingular action on a standard sigma-finite measure space, the center of L∞(X,μ)⋊G equals L∞(X,μ)^G; ergodicity therefore makes it a factor.

For a nonidentity rational q, invert q-1 in the finite adeles to show its only fixed point is zero; scaling gives that point measure zero. Import the group-measure-space center theorem proved in this layer, then use the canonical ergodicity result.

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Corollary proof, p.3.

<a id="proof-bc-ratio-factor-type"></a>

**Full positive ratio set determines type III1.** For a countable essentially free ergodic nonsingular action on a standard sigma-finite measure space, RatioSet=[0,∞) implies its group-measure factor has type III1; equivalently its flow of weights is trivial. This is the operator classification input, distinct from the arithmetic ratio witnesses.

Apply the measured operator-algebra classification of this layer to the established essentially free ergodic action and its full nonnegative ratio set. The theorem identifies the Connes type from that measured ratio invariant; no arithmetic witness replaces this classification input.

See [Sergey Neshveyev — Von Neumann algebras arising from Bost–Connes type systems](https://arxiv.org/pdf/0907.1456v1), §1 flow-of-weights/type criterion, p.2; Theorem 2.1, p.3.

<a id="proof-bc-full-corner-type"></a>

**A nonzero full corner preserves factor type.** The GNS algebra of the diagonal-expectation KMS state is p(L∞(A_f,μβ)⋊Q+×)p, where p=1Ẑ and p≠0. A nonzero corner of a type III1 factor is again type III1. The C*-full corner identification and the von Neumann compression identification are separate requirements.

Use the expectation-measure construction to identify the completed state GNS algebra with the integral projection compression of the group-measure factor. Normalization makes that projection nonzero. Apply the measured operator-algebra classification of this layer nonzero-corner type invariance.

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Corollary proof, p.3; Neshveyev 2009 §1, p.2.

<a id="the-gibbs-states-u-gibbs-states"></a>

### 6.43 The Gibbs states φ_{β,u}

For real β > 1 and u ∈ Aut(ℚ/ℤ), φ_{β,u}(f) = ζ(β)⁻¹ Σ_{k≥1} k^{−β}⟨ε_k, π_u(f)ε_k⟩ is a state on BCHecke ℂ: linear, φ_{β,u}(1) = 1 and φ_{β,u}(f*f) ≥ 0. On the basis, φ_{β,u}(x_n e(γ) x′_m) = 0 unless n = m, and φ_{β,u}(e(γ)) = ζ(β)⁻¹ Σ_k k^{−β} exp(2πi k u(γ)) = Li_β(exp(2πi u(γ)))/ζ(β), with Li_β(z) = Σ_{k≥1} z^k/k^β.

Assume β > 1; u ∈ Aut(ℚ/ℤ).

The proof proceeds as follows. The series converges absolutely because |⟨ε_k, π_u(f)ε_k⟩| ≤ ‖π_u(f)‖ and Σ k^{−β} = ζ(β) < ∞ (partition-function). Positivity: each ⟨ε_k, π_u(f*f)ε_k⟩ = ‖π_u(f)ε_k‖² ≥ 0. Off-diagonal vanishing: π_u(x_n e(γ) x′_m) sends ε_k to a multiple of ε_{nk/m}, orthogonal to ε_k unless n = m.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.gibbsState`: gibbsState (β : ℝ) (hβ : 1 < β) (u : AddAut (ℚ/ℤ)) : BCHecke ℂ →ₗ[ℂ] ℂ.
- `TauCeti.BostConnes.gibbsState_one`: gibbsState β hβ u 1 = 1.
- `TauCeti.BostConnes.gibbsState_star_mul_self_nonneg`: 0 ≤ gibbsState β hβ u (star f * f) (a nonnegative real).
- `TauCeti.BostConnes.gibbsState_e`: gibbsState β hβ u (e γ) = (Σ' k : ℕ+, exp (2π I k u(γ)) / k^β) / riemannZeta β.
- `TauCeti.BostConnes.gibbsState_basis_of_ne`: gibbsState β hβ u (x n * e γ * x' m) = 0 for n ≠ m.

**Checks.**

- gibbsState β hβ u (e (1/2)) = 2^(1−β) − 1 for every u (u fixes 1/2).
- gibbsState β hβ u (x 2 * x' 2) = 2^(1−β).
- gibbsState β hβ u (e 0) = 1.
- gibbsState β hβ u (x 2) = 0 while gibbsState β hβ u (x 2 * x' 2) = 2^(1−β) ≠ 0, so the state is not multiplicative.

The result must also satisfy these compatibility requirements: φ_{β,u}(e(1/2)) = ζ(β)⁻¹ Σ (−1)^k k^{−β} = 2^{1−β} − 1, which tends to −1 = exp(2πi·1/2) as β → ∞.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.6, (3.135) and (3.139), p. 475.

*Needs:* [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#the-representation-on-1-and-its-hamiltonian-regular-representation); [The partition function is the Riemann zeta function](#the-partition-function-is-the-riemann-zeta-function-partition-function); `riemannZeta`; [The Bost–Connes Hecke algebra](#the-bost-connes-hecke-algebra-bost-connes-hecke-algebra); [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#p-p-is-a-hecke-pair-ax-plus-b-hecke-triple); [Translations and positive dilations](#translations-and-positive-dilations-axb-named-matrices); `Rat.num_div_den`; `HeckeCoset.degree_eq_relIndex`; `HeckeCosetModule.single_mul_single`; `AddCircle`; `PNat`; `HeckeCosetModule.single`; [Positive diagonal homomorphism](#positive-diagonal-homomorphism-axb-diagonal-map); `lp`; [GlobalNumberFields layer 4 finite adeles](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles); [The presentation of the rational Bost–Connes algebra](#the-presentation-of-the-rational-bost-connes-algebra-rational-presentation); [Double-coset coordinate bijection](#proof-coset-coordinate-bijection); [Double cosets of the ax+b pair and their degrees](#proof-double-cosets-and-degrees); [For n≥1, x′n xn=n·1.](#proof-bc-relation-left-inverse); [For coprime n,m≥1, xn x′m=x′m xn.](#proof-bc-relation-coprime); [For n,m≥1, x(nm)=xn xm.](#proof-bc-relation-dilations); [For n,m≥1, x′(nm)=x′n x′m.](#proof-bc-relation-inverse-dilations); [Cancellation of common dilation factors](#proof-bc-gcd-cancellation); [For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements.](#proof-bc-relation-preimage-sum); [Finite translation fibres](#proof-bc-preimage-finite); [Reduction to coprime normal forms](#proof-bc-normal-form-gcd-reduction); [For n≥1 and γ∈ℚ/ℤ, e(γ)xn=xn e(nγ).](#proof-bc-relation-transport); [For γ,δ∈ℚ/ℤ, e(γ+δ)=e(γ)e(δ).](#proof-bc-relation-translation-add); [Normal-form multiplication and common-divisor reduction](#proof-bc-normal-form-product); [Normal-form support](#proof-bc-normal-form-support); [The corrected double-coset basis is independent](#proof-bc-normal-form-independent); [Rational and isometric generator conventions](#proof-bc-complex-rescaling); [Algebraic GNS generator estimates](#proof-bc-gns-generator-bounds); [Inverse double-coset degree](#proof-inverse-coset-degree); [Finite convolution row and column counts](#proof-bc-convolution-row-column); [Schur estimate for one double coset](#proof-bc-convolution-schur); [Bounded faithful left convolution](#proof-bc-convolution-norm-bound); [Coefficient recovery and faithfulness](#proof-bc-convolution-faithful); [Universal C*-norm of the BC core](#proof-bc-universal-norm); [Division endomorphisms on the existing profinite ring](#proof-bc-adelic-endomorphism); [Minimal finite-adele dilation](#proof-bc-adelic-dilation); [BC algebra as a full crossed-product corner](#proof-bc-crossed-product-full-corner); [Universal and reduced BC norms agree](#proof-bc-universal-reduced); [Absolute Gibbs diagonal summability](#proof-bc-gibbs-absolute-convergence).

<a id="proof-bc-gibbs-absolute-convergence"></a>

**Absolute Gibbs diagonal summability.** For β>1 and bounded a∈C_Q, |⟨ε_k,π_u(a)ε_k⟩|≤‖a‖ and Σk k^(−β)<∞. Thus the diagonal Gibbs sum converges absolutely, defines a functional of norm≤1 after division by ζ(β), and is positive on squares.

Bound every diagonal coefficient by the operator norm and dominate the sum by zeta(beta). Each coefficient on a star square is a squared vector norm; normalization on 1 and positivity give the norm-one state.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Theorem 3.32 and §4.6, (3.139)–(3.141), pp.474–475.

<a id="completed-gibbs-state-bc-completed-gibbs"></a>

### 6.44 Completed Gibbs state

For β>1, define φβ,u(a)=ζ(β)⁻¹Σk≥1 k^(−β)⟨ε_k,π_u(a)ε_k⟩. This continuous normalized positive functional on C_Q restricts to the algebraic Gibbs state.

The proof proceeds as follows. Use absolute convergence to define a linear functional on the completed algebra. The preceding uniform norm bound gives continuity; compute its value on 1 and on star squares. Agreement on the core follows by inserting the regular representation formula.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.CompletedKMS.gibbs_restrict`: Restriction gives gibbsState.
- `TauCeti.BostConnes.CompletedKMS.gibbs_norm`: The norm is 1.
- `TauCeti.BostConnes.CompletedKMS.gibbs_isKMS`: The completed Gibbs state is KMSβ.

**Checks.**

- The completed Gibbs state evaluates 1 to 1.
- Its value at embedded e(1/2) is 2^(1−β)−1.
- Its value at μ₂μ₂* is 2^(−β).

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, §4.6, (3.139)–(3.141), p.475.

*Needs:* [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#the-representation-on-1-and-its-hamiltonian-regular-representation); [The partition function is the Riemann zeta function](#the-partition-function-is-the-riemann-zeta-function-partition-function); [The Bost–Connes Hecke algebra](#the-bost-connes-hecke-algebra-bost-connes-hecke-algebra); [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#p-p-is-a-hecke-pair-ax-plus-b-hecke-triple); [Translations and positive dilations](#translations-and-positive-dilations-axb-named-matrices); `Rat.num_div_den`; `HeckeCoset.degree_eq_relIndex`; `HeckeCosetModule.single_mul_single`; `AddCircle`; `PNat`; `HeckeCosetModule.single`; [Positive diagonal homomorphism](#positive-diagonal-homomorphism-axb-diagonal-map); `lp`; [GlobalNumberFields layer 4 finite adeles](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles); [The presentation of the rational Bost–Connes algebra](#the-presentation-of-the-rational-bost-connes-algebra-rational-presentation); [The reduced Bost–Connes C*-algebra](#the-reduced-bost-connes-c-algebra-bc-cstar-completion); [Completed KMS states and the bounded strip condition](#completed-kms-states-and-the-bounded-strip-condition-bc-completed-kms); [Double-coset coordinate bijection](#proof-coset-coordinate-bijection); [Double cosets of the ax+b pair and their degrees](#proof-double-cosets-and-degrees); [For n≥1, x′n xn=n·1.](#proof-bc-relation-left-inverse); [For coprime n,m≥1, xn x′m=x′m xn.](#proof-bc-relation-coprime); [For n,m≥1, x(nm)=xn xm.](#proof-bc-relation-dilations); [For n,m≥1, x′(nm)=x′n x′m.](#proof-bc-relation-inverse-dilations); [Cancellation of common dilation factors](#proof-bc-gcd-cancellation); [For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements.](#proof-bc-relation-preimage-sum); [Finite translation fibres](#proof-bc-preimage-finite); [Reduction to coprime normal forms](#proof-bc-normal-form-gcd-reduction); [For n≥1 and γ∈ℚ/ℤ, e(γ)xn=xn e(nγ).](#proof-bc-relation-transport); [For γ,δ∈ℚ/ℤ, e(γ+δ)=e(γ)e(δ).](#proof-bc-relation-translation-add); [Normal-form multiplication and common-divisor reduction](#proof-bc-normal-form-product); [Normal-form support](#proof-bc-normal-form-support); [The corrected double-coset basis is independent](#proof-bc-normal-form-independent); [Rational and isometric generator conventions](#proof-bc-complex-rescaling); [Algebraic GNS generator estimates](#proof-bc-gns-generator-bounds); [Inverse double-coset degree](#proof-inverse-coset-degree); [Finite convolution row and column counts](#proof-bc-convolution-row-column); [Schur estimate for one double coset](#proof-bc-convolution-schur); [Bounded faithful left convolution](#proof-bc-convolution-norm-bound); [Coefficient recovery and faithfulness](#proof-bc-convolution-faithful); [Universal C*-norm of the BC core](#proof-bc-universal-norm); [Division endomorphisms on the existing profinite ring](#proof-bc-adelic-endomorphism); [Minimal finite-adele dilation](#proof-bc-adelic-dilation); [BC algebra as a full crossed-product corner](#proof-bc-crossed-product-full-corner); [Universal and reduced BC norms agree](#proof-bc-universal-reduced); [Absolute Gibbs diagonal summability](#proof-bc-gibbs-absolute-convergence).

<a id="the-gibbs-states-are-kms-states-gibbs-states-are-kms"></a>

### 6.45 The Gibbs states are KMS_β states

For β > 1 and u ∈ Aut(ℚ/ℤ), φ_{β,u} is a KMS_β state.

Assume β > 1.

The proof proceeds as follows. For a normal-form basis monomial each basis vector is sent to a scalar multiple of at most one other basis vector. The Hamiltonian implements σ on these coefficients. The KMS boundary identity follows by changing the positive-integer summation index and retaining the factors n^(−β). Bound each diagonal series by the operator norm times Σ k^(−β), and extend by linearity. No cyclic rearrangement with the unbounded operator e^(βH) is used.

The result must also satisfy these compatibility requirements: The check on f = x′₂, g = x₂: φ(x′₂ σ_{iβ}(x₂)) = 2^{−β}φ(x′₂x₂) = 2^{1−β} and φ(x₂x′₂) = φ(1 + e(1/2)) = 2^{1−β}.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.6, (3.135) and (3.139), p. 475; [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §2.2, Definition 3.6, p. 446.

*Needs:* [The Gibbs states φ_{β,u}](#the-gibbs-states-u-gibbs-states); [KMS_β states on the Bost–Connes algebra](#kms-states-on-the-bost-connes-algebra-kms-states); [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#the-representation-on-1-and-its-hamiltonian-regular-representation); [The Bost–Connes Hecke algebra](#the-bost-connes-hecke-algebra-bost-connes-hecke-algebra); [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#p-p-is-a-hecke-pair-ax-plus-b-hecke-triple); [Translations and positive dilations](#translations-and-positive-dilations-axb-named-matrices); `Rat.num_div_den`; `HeckeCoset.degree_eq_relIndex`; `HeckeCosetModule.single_mul_single`; `lp`; `HilbertBasis`; [Completed Gibbs state](#completed-gibbs-state-bc-completed-gibbs); [The Bost–Connes time evolution](#the-bost-connes-time-evolution-time-evolution); [The reduced Bost–Connes C*-algebra](#the-reduced-bost-connes-c-algebra-bc-cstar-completion); [Positive diagonal homomorphism](#positive-diagonal-homomorphism-axb-diagonal-map); `AddCircle`; `PNat`; [Completed KMS states and the bounded strip condition](#completed-kms-states-and-the-bounded-strip-condition-bc-completed-kms); `HeckeCosetModule.single`; [GlobalNumberFields layer 4 finite adeles](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles); [The presentation of the rational Bost–Connes algebra](#the-presentation-of-the-rational-bost-connes-algebra-rational-presentation); [Double-coset coordinate bijection](#proof-coset-coordinate-bijection); [Double cosets of the ax+b pair and their degrees](#proof-double-cosets-and-degrees); [For n≥1, x′n xn=n·1.](#proof-bc-relation-left-inverse); [For coprime n,m≥1, xn x′m=x′m xn.](#proof-bc-relation-coprime); [For n,m≥1, x(nm)=xn xm.](#proof-bc-relation-dilations); [For n,m≥1, x′(nm)=x′n x′m.](#proof-bc-relation-inverse-dilations); [Cancellation of common dilation factors](#proof-bc-gcd-cancellation); [For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements.](#proof-bc-relation-preimage-sum); [Finite translation fibres](#proof-bc-preimage-finite); [Reduction to coprime normal forms](#proof-bc-normal-form-gcd-reduction); [For n≥1 and γ∈ℚ/ℤ, e(γ)xn=xn e(nγ).](#proof-bc-relation-transport); [For γ,δ∈ℚ/ℤ, e(γ+δ)=e(γ)e(δ).](#proof-bc-relation-translation-add); [Normal-form multiplication and common-divisor reduction](#proof-bc-normal-form-product); [Normal-form support](#proof-bc-normal-form-support); [The corrected double-coset basis is independent](#proof-bc-normal-form-independent); [Rational and isometric generator conventions](#proof-bc-complex-rescaling); [Isometries and phase unitaries on l²(N+)](#proof-bc-regular-shift-bounds); [Algebraic GNS generator estimates](#proof-bc-gns-generator-bounds); [Inverse double-coset degree](#proof-inverse-coset-degree); [Finite convolution row and column counts](#proof-bc-convolution-row-column); [Schur estimate for one double coset](#proof-bc-convolution-schur); [Bounded faithful left convolution](#proof-bc-convolution-norm-bound); [Coefficient recovery and faithfulness](#proof-bc-convolution-faithful); [Universal C*-norm of the BC core](#proof-bc-universal-norm); [Division endomorphisms on the existing profinite ring](#proof-bc-adelic-endomorphism); [Minimal finite-adele dilation](#proof-bc-adelic-dilation); [BC algebra as a full crossed-product corner](#proof-bc-crossed-product-full-corner); [Universal and reduced BC norms agree](#proof-bc-universal-reduced); [Dense isometric core embedding](#proof-bc-completion-dense); [Entire Hecke orbit maps](#proof-bc-dynamics-entire-core); [Gibbs strip correlations](#proof-bc-gibbs-strip-series); [Positive Hecke states extend boundedly](#proof-bc-bounded-state-extension); [Uniform correlation bound on the closed strip](#proof-bc-strip-core-bound); [Extending real dynamics to the C*-completion](#proof-bc-real-dynamics-extension); [Point-norm continuous completed dynamics](#proof-bc-dynamics-continuous); [The analytic core and the strip KMS condition](#proof-bc-analytic-core-strip-equivalence).

<a id="proof-bc-gibbs-strip-series"></a>

**Gibbs strip correlations.** For β>1 and core a,b, the Gibbs correlation Σk ζ(β)⁻¹k^(−β)⟨ε_k,π_u(a σ_z b)ε_k⟩ converges locally uniformly on C and uniformly on each closed real strip of bounded imaginary height. On the KMS strip 0≤Imz≤β it has the required two boundary values; finite normal-form reindexing supplies the upper boundary.

Finite support of a,b bounds all complex-time coefficients on each bounded imaginary strip. Dominate the diagonal sum by C k^(−β). Check the boundary identity on normal forms by the divisibility formula and change k to nk; the factor n^(−β) is exactly the imaginary-time scalar. Extend bilinearly to the core and then by the core strip equivalence.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Definition 3.6, p.446; §4.6, (3.139)–(3.141), p.475.

<a id="gibbs-barycentre-of-a-probability-measure-bc-completed-barycentre"></a>

### 6.46 Gibbs barycentre of a probability measure

For β>1 and a Borel probability ν on W=zHat×, define φν(a)=integral_W φβ,u(a)dν(u). The character parameter W≃AddAut(Q/Z) is continuous on every torsion evaluation. The resulting map is a positive norm-one continuous functional and a KMSβ state. It is affine in ν; bijectivity and weak topological continuity are separate results.

The proof proceeds as follows. Integrate the completed Gibbs evaluations over the probability parameter. Their uniform norm-one bound gives an integrable bounded linear functional. Positivity and normalization pass under integration, and the completed KMS strip identity passes by dominated convergence.

The required interface consists of the following operations and identities.

- `TauCeti.BostConnes.completedBarycentre_apply`: Evaluation is the stated Bochner integral.
- `TauCeti.BostConnes.completedBarycentre_norm`: The functional has norm 1.
- `TauCeti.BostConnes.completedBarycentre_isKMS`: Every probability barycentre is KMSβ.

**Checks.**

- A Dirac mass at u recovers the completed Gibbs state u.
- For every ν, φν(μ2 μ2*)=2^(−β).
- A convex combination of probabilities gives the same convex combination of functionals.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Theorem 3.32 and proof, pp.474–476.

*Needs:* [Completed Gibbs state](#completed-gibbs-state-bc-completed-gibbs); `MulAut`; `AddCircle`; [Profinite units act on rational torsion](#proof-bc-unit-qmodz-adapter).

<a id="proof-bc-unit-qmodz-adapter"></a>

**Profinite units act on rational torsion.** The imported Ẑ× maps to AddAut(Q/Z) by its compatible residues u_N acting on each N-torsion subgroup. This is bijective and continuous in the topology of finite restrictions; every torsion element belongs to one of these finite subgroups.

Restrict an additive automorphism to every cyclic N-torsion subgroup and identify it with an invertible residue modulo N. These residues are compatible under divisibility, yielding a profinite unit. Conversely compatible residues act consistently on the union of all torsion subgroups; finite evaluations prove continuity.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, §4.1, pp.457–459; Theorem 3.32, p.474.

<a id="cyclotomic-values-and-galois-action-on-extremal-kms-states-galois-action-on-ground-states"></a>

### 6.47 Cyclotomic values and Galois action on extremal KMS∞ states

For u ∈ Aut(ℚ/ℤ) the extremal KMS∞ vector state φ_{∞,u}(f) = ⟨ε₁, π_u(f)ε₁⟩ is the limit of φ_{β,u} as β → ∞. On the rational form H_ℚ (the ℚ-valued functions), φ_{∞,u}([X]) = exp(2πi u(γ)) if X is the class of translation γ and 0 otherwise; so φ_{∞,u}(H_ℚ) lies in the cyclotomic field ℚ(μ_∞) ⊂ ℂ. For every field automorphism τ of ℂ, τ ∘ φ_{∞,u} = φ_{∞,χ(τ)u} on H_ℚ, where χ(τ) ∈ Aut(ℚ/ℤ) is the automorphism with τ(exp(2πiγ)) = exp(2πi χ(τ)(γ)); that is, τ ∘ φ_{∞,u} = φ_{∞,u} ∘ θ_{χ(τ)}. This states the extremal KMS∞ result and does not classify all upper-half-plane ground states.

Assume u ∈ Aut(ℚ/ℤ); τ a ring automorphism of ℂ.

The proof proceeds as follows. π_u(x_n e(γ) x′_m)ε₁ = 0 unless m = 1, and then it is a multiple of ε_n, orthogonal to ε₁ unless n = 1; so φ_{∞,u} kills every basis element except the classes of translations, where it is exp(2πi u(γ)). Limit: φ_{β,u}(e(γ)) = ζ(β)⁻¹Σ k^{−β}exp(2πiku(γ)) → exp(2πiu(γ)) as β → ∞, since ζ(β) → 1 and the tail is O(2^{−β}). τ permutes the roots of unity in ℂ, and the induced map on ℚ/ℤ ≅ μ_∞ is additive and bijective; this defines χ(τ) (the cyclotomic character). Then τ(exp(2πiu(γ))) = exp(2πi χ(τ)(u(γ))), and symmetry-action gives the intertwining. Prove the KMS∞ limit on the completed state space and then restrict to either rational form; continuity of arbitrary complex field automorphisms is never assumed.

The result must also satisfy these compatibility requirements: On BC's form A_ℚ the same values arise (rational-forms-comparison), so the statement does not depend on the choice of rational form.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.6, Theorem 3.32, (3.136)–(3.137), p. 475.

*Needs:* [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#the-representation-on-1-and-its-hamiltonian-regular-representation); [The Gibbs states φ_{β,u}](#the-gibbs-states-u-gibbs-states); [The symmetry group Ẑ^× = Aut(ℚ/ℤ)](#the-symmetry-group-aut-symmetry-action); [The two rational forms of the Bost–Connes algebra](#the-two-rational-forms-of-the-bost-connes-algebra-rational-forms-comparison); `IsCyclotomicExtension`; [KMS∞ states and upper-half-plane ground states](#kms-states-and-upper-half-plane-ground-states-bc-kms-infinity-and-ground); [The trigonometric arithmetic algebra equals the BC rational form](#the-trigonometric-arithmetic-algebra-equals-the-bc-rational-form-bc-arithmetic-algebra-generation); [GlobalNumberFields layer 10 archimedean characters infinity types and cyclotomic arithmetic](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic); `MulAut`; `AddCircle`; [Profinite units act on rational torsion](#proof-bc-unit-qmodz-adapter); [Compatible finite cyclotomic restrictions](#proof-bc-cyclotomic-restrictions).

<a id="proof-bc-cyclotomic-restrictions"></a>

**Compatible finite cyclotomic restrictions.** For every field automorphism τ of C fixing Q, the exponents v_N∈(Z/NZ)× defined by τ(ζ_N)=ζ_N^(v_N) are compatible under divisibility. Conversely compatible exponents define an automorphism of Qcycl. The imported finite cyclotomic Galois identifications supply each v_N; the transition verification supplies their inverse-limit element v∈Ẑ×.

Import each finite cyclotomic Galois identification. Restriction to smaller cyclotomic fields equates the exponents modulo their levels. The compatible family acts on the union Qcycl and yields the profinite unit; no global Artin theorem is needed.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Theorem 3.32(4), pp.474–476.

<a id="high-extremal-states-and-unique-barycentres-bc-high-beta-barycentres"></a>

### 6.48 High-β extremal states and unique barycentres

For β>1 every completed KMSβ state has a unique barycentre ν on W, characterized by φ(a)=∫W φβ,u(a)dν(u) for each a∈C_Q. Thus the high-beta KMS set is a Bauer simplex with extreme boundary homeomorphic to W. This specialized uniqueness follows from the measure bijection; it does not require an unproved general Choquet decomposition.

The proof proceeds as follows. Use the KMS–scaling-measure affine correspondence. Identify Dirac masses with the explicit Gibbs formula. Use the probability-measure extreme-point theorem and transport unit multiplication.

The result must also satisfy these compatibility requirements: Forβ>1 the KMS simplex is affinely identified with probability measures onẐ×; its extreme points are the Dirac-unit Gibbs states. The unit symmetries act freely transitively on those extreme points. The full-measure unit-orbit decomposition holds for every scaling measure: μ{x_p∈pZ_p}=p^(−β), whose sum over primes converges. Borel–Cantelli leaves only finitely many nonunit coordinates almost everywhere; a zero p-coordinate has measure zero by repeated p-scaling. Clearing the finite valuations places the point in exactly one positive rational translate of the unit group.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Theorem 3.32, pp.474–475; Proposition 3.8, pp.447–448 supplies the general Choquet statement.

*Needs:* [KMS states and scaling measures](#kms-states-and-scaling-measures-bc-kms-scaling-correspondence); [The finite-adele scaling measure](#the-finite-adele-scaling-measure-bc-adelic-scaling-measure); [The partition function is the Riemann zeta function](#the-partition-function-is-the-riemann-zeta-function-partition-function); [All normalized scaling measures](#all-normalized-scaling-measures-bc-scaling-measure-space); [Completed Gibbs state](#completed-gibbs-state-bc-completed-gibbs); [Gibbs barycentre of a probability measure](#gibbs-barycentre-of-a-probability-measure-bc-completed-barycentre); [Unit-orbit decomposition above the critical temperature](#proof-bc-high-beta-unit-orbits); [High-beta unit-mass reconstruction](#proof-bc-high-beta-unit-measure); [Probability measures parameterize high-beta KMS states](#proof-bc-high-beta-affine-homeomorphism); [High-beta extreme states](#proof-bc-high-beta-extremes).

<a id="proof-bc-high-beta-unit-orbits"></a>

**Unit-orbit decomposition above the critical temperature.** Forβ>1, the disjoint sets nẐ× cover a μβ-full subset ofẐ, and μβ(Ẑ×)=∏p(1−p^(−β))=ζ(β)^(−1). Every scaling measure is reconstructed from a probability measure onẐ× by the weighted orbit sums.

For every normalized scaling measure, the mass of the p-divisibility cylinder is p^(−β). Their sum is finite when β>1, so Borel–Cantelli leaves finitely many nonunit coordinates almost surely. A coordinate identically zero has zero mass by arbitrary repeated p-divisibility. Clear the remaining finite valuations by one positive rational, uniquely, to reach W. On the integral slice only positive integers occur; sum their scaling masses to get μ(W)=1/ζ(β), and recover the measure from its normalized unit restriction.

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Introduction, unit-orbit decomposition after (1β), pp.1–2.

<a id="proof-bc-high-beta-unit-measure"></a>

**High-beta unit-mass reconstruction.** For β>1 any normalized scaling μ is carried by the disjoint sets qW, q∈Q_+×, W=Ẑ×, and μ(W)=1/ζ(β). Its normalized unit restriction ν=ζ(β) μ|W is a probability measure. Conversely μν=ζ(β)⁻¹Σq∈Q_+× q^(−β)(q_*ν) is the unique scaling measure with that unit restriction.

For the normalization on Ẑ, only q∈N+ contributes, giving ζ(β). On compact rational dilates the sum is finite as a measure after the same convergent bound. Recover each qW component by scaling; the complement is null by the high-beta orbit theorem.

See [Sergey Neshveyev — Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1), Neshveyev 2000, pp.1–2.

<a id="proof-bc-high-beta-affine-homeomorphism"></a>

**Probability measures parameterize high-beta KMS states.** For β>1, ν↦∫W φβ,u dν(u) is an affine homeomorphism from Radon probability measures on the existing compact group W=Ẑ× to completed KMSβ states. The inverse is the normalized unit restriction of the corresponding scaling measure.

Restrict the scaling measure to units and multiply by zeta(beta). The rational-orbit decomposition reconstructs it and yields the Gibbs barycentre. Integrals against continuous test functions give weak continuity of both maps; the state topology is pointwise weak evaluation.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch.3, Theorem 3.32, pp.474–476; Neshveyev 2000, pp.1–2.

<a id="proof-bc-high-beta-extremes"></a>

**High-beta extreme states.** For β>1 the extreme KMS states are precisely φβ,u, u∈W; equality of two such states forces equality of their unit parameters. Dirac probability measures are exactly the extremes of ProbabilityMeasure W under the preceding affine homeomorphism.

Transport extreme points through the affine probability-measure correspondence. Probability measures on a compact Hausdorff space are extreme exactly when Dirac; injectivity of the correspondence separates unit parameters.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Theorem 3.32(2), pp.474–475.

<a id="arithmetic-values-and-symmetry-intertwining-bc-arithmetic-values-and-symmetry"></a>

### 6.49 Arithmetic values and symmetry intertwining

For an extremal KMS∞ vector state, e(a) evaluates to the corresponding root of unity and every reduced normal-form monomial with(n,m)≠(1,1) evaluates to0. Its rational arithmetic values generate Qcycl. The induced cyclotomic character intertwines field automorphisms with unit symmetries on those values.

The proof proceeds as follows. Evaluate the normal form on ε1, retaining the coprime-index restriction. Use the rational generation theorem and the cyclotomic root image. Invoke the supplied cyclotomic/class-field character and verify the equality on the basis.

The result must also satisfy these compatibility requirements: For an extremal KMS∞ vector state, e(a) evaluates to the corresponding root of unity and every reduced normal-form monomial with(n,m)≠(1,1) evaluates to0. Its rational arithmetic values generate Qcycl. The induced cyclotomic character intertwines field automorphisms with unit symmetries on those values.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Theorem 3.32 (3)–(4), (3.136)–(3.137), p.475.

*Needs:* [KMS∞ states and upper-half-plane ground states](#kms-states-and-upper-half-plane-ground-states-bc-kms-infinity-and-ground); [The Gibbs states φ_{β,u}](#the-gibbs-states-u-gibbs-states); [The representation on ℓ²(ℕ≥1) and its Hamiltonian](#the-representation-on-1-and-its-hamiltonian-regular-representation); [The Bost–Connes Hecke algebra](#the-bost-connes-hecke-algebra-bost-connes-hecke-algebra); [(P⁺_ℚ, P⁺_ℤ) is a Hecke pair](#p-p-is-a-hecke-pair-ax-plus-b-hecke-triple); [Translations and positive dilations](#translations-and-positive-dilations-axb-named-matrices); `Rat.num_div_den`; `HeckeCoset.degree_eq_relIndex`; `HeckeCosetModule.single_mul_single`; `AddCircle`; `PNat`; `HeckeCosetModule.single`; [Positive diagonal homomorphism](#positive-diagonal-homomorphism-axb-diagonal-map); `lp`; [GlobalNumberFields layer 4 finite adeles](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles); [The presentation of the rational Bost–Connes algebra](#the-presentation-of-the-rational-bost-connes-algebra-rational-presentation); [The reduced Bost–Connes C*-algebra](#the-reduced-bost-connes-c-algebra-bc-cstar-completion); [Ground state at an invertible lattice](#ground-state-at-an-invertible-lattice-bc-vector-ground-state); [The trigonometric arithmetic algebra equals the BC rational form](#the-trigonometric-arithmetic-algebra-equals-the-bc-rational-form-bc-arithmetic-algebra-generation); [The symmetry group Ẑ^× = Aut(ℚ/ℤ)](#the-symmetry-group-aut-symmetry-action); [Cyclotomic values and Galois action on extremal KMS∞ states](#cyclotomic-values-and-galois-action-on-extremal-kms-states-galois-action-on-ground-states); [GlobalNumberFields layer 10 archimedean characters infinity types and cyclotomic arithmetic](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic); `MulAut`; `IsCyclotomicExtension`; [Double-coset coordinate bijection](#proof-coset-coordinate-bijection); [Double cosets of the ax+b pair and their degrees](#proof-double-cosets-and-degrees); [For n≥1, x′n xn=n·1.](#proof-bc-relation-left-inverse); [For coprime n,m≥1, xn x′m=x′m xn.](#proof-bc-relation-coprime); [For n,m≥1, x(nm)=xn xm.](#proof-bc-relation-dilations); [For n,m≥1, x′(nm)=x′n x′m.](#proof-bc-relation-inverse-dilations); [Cancellation of common dilation factors](#proof-bc-gcd-cancellation); [For n≥1 and γ∈ℚ/ℤ, xn e(γ)x′n=Σnδ=γ e(δ); the fiber has n elements.](#proof-bc-relation-preimage-sum); [Finite translation fibres](#proof-bc-preimage-finite); [Reduction to coprime normal forms](#proof-bc-normal-form-gcd-reduction); [For n≥1 and γ∈ℚ/ℤ, e(γ)xn=xn e(nγ).](#proof-bc-relation-transport); [For γ,δ∈ℚ/ℤ, e(γ+δ)=e(γ)e(δ).](#proof-bc-relation-translation-add); [Normal-form multiplication and common-divisor reduction](#proof-bc-normal-form-product); [Normal-form support](#proof-bc-normal-form-support); [The corrected double-coset basis is independent](#proof-bc-normal-form-independent); [Rational and isometric generator conventions](#proof-bc-complex-rescaling); [Algebraic GNS generator estimates](#proof-bc-gns-generator-bounds); [Inverse double-coset degree](#proof-inverse-coset-degree); [Finite convolution row and column counts](#proof-bc-convolution-row-column); [Schur estimate for one double coset](#proof-bc-convolution-schur); [Bounded faithful left convolution](#proof-bc-convolution-norm-bound); [Coefficient recovery and faithfulness](#proof-bc-convolution-faithful); [Universal C*-norm of the BC core](#proof-bc-universal-norm); [Division endomorphisms on the existing profinite ring](#proof-bc-adelic-endomorphism); [Minimal finite-adele dilation](#proof-bc-adelic-dilation); [BC algebra as a full crossed-product corner](#proof-bc-crossed-product-full-corner); [Universal and reduced BC norms agree](#proof-bc-universal-reduced); [Dense isometric core embedding](#proof-bc-completion-dense); [Positive Hecke states extend boundedly](#proof-bc-bounded-state-extension); [Profinite units act on rational torsion](#proof-bc-unit-qmodz-adapter); [Compatible finite cyclotomic restrictions](#proof-bc-cyclotomic-restrictions); [The Gibbs limit and its uniform tail bound](#proof-bc-gibbs-tail-limit).

<a id="proof-bc-gibbs-tail-limit"></a>

**The Gibbs limit and its uniform tail bound.** For β→∞ the Gibbs states converge weakly to the ε1 vector state, uniformly on each fixed norm-bounded observable set: the difference is at most2||a||(ζ(β)−1)/ζ(β), which tends to0. This supplies completed KMS∞ states.

Separate k=1 from the Gibbs diagonal sum. Bound every matrix coefficient by||a||. Use ζ(β)−1→0 and the normalization difference.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, (3.140)–(3.142), pp.475–476; weak Gibbs limit is the stated elementary consequence.

<a id="the-bost-connes-phase-transition-kms-classification"></a>

### 6.50 The Bost–Connes phase transition

For 0<β≤1 there is exactly one completed KMSβ state; for β>1 its extreme boundary is W and its states are uniquely the barycentres of the Gibbs extremes. The first regime follows from low-temperature-uniqueness, the second from high-beta-affine-homeomorphism; symmetry is a separate torsor theorem.

Assume β > 0; states and KMS condition as in kms-states.

The proof proceeds as follows. Restrict a completed KMS state to the commutative C(Ẑ) and use the KMS–scaling-measure correspondence. For 0<β≤1 use the finite-prime projection, character-annihilation and ergodicity chain; for β>1 use the unit-orbit decomposition and barycentre chain. Transport the measure classification back to states and apply the symmetry intertwining.

The result must also satisfy these compatibility requirements: The β ≤ 1 formula at e(1/2) gives 2^{−β}(1 − 2^{β−1})/(1/2) = 2^{1−β} − 1, the same value as the Gibbs formula, which is consistent at the boundary.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.6, Theorem 3.32, pp. 474–475; [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Ch. 3, §4.6, Theorem 3.32, p. 475.

*Needs:* [Critical-regime KMS uniqueness](#critical-regime-kms-uniqueness-bc-low-temperature-uniqueness); [High-β extremal states and unique barycentres](#high-extremal-states-and-unique-barycentres-bc-high-beta-barycentres); [KMS states and scaling measures](#kms-states-and-scaling-measures-bc-kms-scaling-correspondence); [The finite-adele scaling measure](#the-finite-adele-scaling-measure-bc-adelic-scaling-measure); [The partition function is the Riemann zeta function](#the-partition-function-is-the-riemann-zeta-function-partition-function); [All normalized scaling measures](#all-normalized-scaling-measures-bc-scaling-measure-space); [Completed Gibbs state](#completed-gibbs-state-bc-completed-gibbs); [The symmetry group Ẑ^× = Aut(ℚ/ℤ)](#the-symmetry-group-aut-symmetry-action); [Unit-orbit decomposition above the critical temperature](#proof-bc-high-beta-unit-orbits); [High-beta unit-mass reconstruction](#proof-bc-high-beta-unit-measure); [Probability measures parameterize high-beta KMS states](#proof-bc-high-beta-affine-homeomorphism); [High-beta extreme states](#proof-bc-high-beta-extremes); [Symmetry on the high-beta extreme boundary](#proof-bc-kms-symmetry-transitive).

<a id="proof-bc-kms-symmetry-transitive"></a>

**Symmetry on the high-beta extreme boundary.** For β>1, pullback by θ_v maps φβ,u to φβ,uv, with composition conventions fixed by the action on Q/Z. Therefore W acts freely and transitively on the high-beta extreme boundary.

Apply the symmetry to each torsion generator in the Gibbs formula. The resulting character is the product of the two unit parameters. The injective identification of extremes with units then gives freeness and transitivity.

See [Alain Connes and Matilde Marcolli — Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf), Chapter 3, Theorem 3.32(3), pp.474–475.

### Remaining analytic proof obligations

**Bounded-state and crossed-product foundations.** Prove the bounded-generator algebraic GNS estimate, universal norm completion, minimal semigroup dilation, full-corner covariance and full=reduced norm for this abelian group, using the constructions in this layer. Dense entire-core KMS equivalence and expectation/state-measure reconstruction require their own bounded-strip and continuity estimates. Laca’s dilation/corner argument does not prove the general amenability or analytic-strip theorems. Used in [Arithmetic values and symmetry intertwining](#arithmetic-values-and-symmetry-intertwining-bc-arithmetic-values-and-symmetry); [Completed coefficient state](#completed-coefficient-state-bc-completed-coefficient-state); [Completed Gibbs state](#completed-gibbs-state-bc-completed-gibbs); [KMS states and scaling measures](#kms-states-and-scaling-measures-bc-kms-scaling-correspondence); [The critical KMS factors have type III₁](#the-critical-kms-factors-have-type-iii-bc-type-three-one); [Ground state at an invertible lattice](#ground-state-at-an-invertible-lattice-bc-vector-ground-state); [The Gibbs states φ_{β,u}](#the-gibbs-states-u-gibbs-states); [The Gibbs states are KMS_β states](#the-gibbs-states-are-kms-states-gibbs-states-are-kms).

**Measured operator-algebra classification.** Construct the nonsingular group-measure von Neumann algebra and its measured-equivalence-relation interface. Prove the ergodic center/factor theorem, the ratio-set-to-type-III₁ classification and nonzero-corner type invariance, and identify the completed-state GNS compression. The arithmetic prime-pair witnesses alone do not imply the operator classification. Used in [The critical KMS factors have type III₁](#the-critical-kms-factors-have-type-iii-bc-type-three-one).

**Compact scalar geometric spectral and Gaussian trace adapters.** Identify the scalar geometric Laplacian, simple zero, multiplicities, Weyl law and uniform full heat expansion. Extend compactly supported smooth trace tests to the Gaussian, with geodesic growth and a fixed primitive orientation convention. The generic Mellin calculations do not establish these geometric inputs. Used in [The compact Selberg determinant comparison](#the-compact-selberg-determinant-comparison-selberg-determinant-comparison); [The compact Selberg functional equation](#the-compact-selberg-functional-equation-selberg-functional-equation); [Selberg zeros and scalar spectral parameters](#selberg-zeros-and-scalar-spectral-parameters-selberg-spectral-zero-comparison); [Entire shifted determinant](#entire-shifted-determinant-shifted-entire-determinant); [Spectral zeta is regular at zero](#spectral-zeta-is-regular-at-zero-spectral-regularity-zero).

**Barnes G original normalization and asymptotic proof.** The Barnes product needs its original normalization, zero divisor, logarithmic derivative and uniform asymptotic proof. Adamchik Lemma5.1, pp.10–11, proves a remainder formula for Re z>0 using an integral with kernel x/(exp(2πx)−1) and the finite Taylor remainder for log(1+x²/z²). This supplies a primary half-plane proof route. The uniform estimate on every closed sector |arg z|≤π−δ still needs a source-backed continuation/remainder argument. The asymptotic fixes the identity determinant constant; recurrence and G(1)=1 alone do not. Use the single-valued integer-power identity factor when continuing. Used in [The compact Selberg determinant comparison](#the-compact-selberg-determinant-comparison-selberg-determinant-comparison); [The compact Selberg functional equation](#the-compact-selberg-functional-equation-selberg-functional-equation); [Selberg zeros and scalar spectral parameters](#selberg-zeros-and-scalar-spectral-parameters-selberg-spectral-zero-comparison).

### Examples

On ℓ²(ℕ≥1), Hε_n=(log n)ε_n, so exp(−βH) has trace ζ(β) exactly for β>1; the n=1 eigenvalue contributes 1. The relation x₂x′₂=1+e(1/2) detects why doubling on ℚ/ℤ is not an automorphism. The high-β parameter space is the probability measures on profinite units with weak topology; the limit ground states are vector states at the first basis vector. For a finite positive spectrum, scaling λ by c multiplies the zeta function by c^(−s) and its determinant by c to the number of eigenvalues. The compact scalar Laplacian has one zero mode, so the unprimed shifted determinant has a simple zero at shift zero.

### Dependencies

Mathlib Hecke and C⋆-algebra, Hilbert-space, trace-class and measure tools where available; the exact current-library positive-functional representation in the boundary section; ProfiniteArithmetic Layer 0, RestrictedProducts, GlobalNumberFields Layer 4 and AdelicAlgebraicGroups Layer 0. The universal completion, dilation-corner, expectation, analytic-KMS and ratio-set classification theorems specified here are additional proof targets. ArithmeticLocallySymmetricSpaces Layer 0 supplies the compact surface, and AutomorphicSpectralTheory Layers 4 and 6 must supply the scalar Laplacian, multiplicities, Weyl law and full Gaussian heat trace. Layer 4 Barnes G normalizes the identity determinant factor.

## Downstream consumers

ExponentialSumsAndCircleMethod and AdditiveCombinatorics consume uniform progression estimates, divisor constants and Mangoldt-window bounds. For a growing W-trick modulus the consumer must prove W≤(log x)^B before using Siegel–Walfisz. ArithmeticStatistics consumes quadratic and cubic analytic estimates and supplies the arithmetic input of the same bundle. CM-height applications consume the fixed-degree conductor, value and logarithmic-derivative bounds with the odd normal-closure representation family stated above. Quadratic period applications consume the ordinary/narrow class and regulator dictionary. Spectral and noncommutative arithmetic applications consume the completed Bost–Connes system, its phase transition and the compact determinant comparison. These are uses of the results, not additional prerequisite roadmaps.

## References

- Hideo Aramata. [Über die Teilbarkeit der Dedekindschen Zetafunktionen](https://www.jstage.jst.go.jp/article/pjab1912/9/2/9_2_31/_pdf). Proceedings of the Imperial Academy9(1933),31–34.
- Victor S. Adamchik. [Contributions to the Theory of the Barnes Function](https://arxiv.org/pdf/math/0308086v1). arXiv math/0308086v1,2003.
- Michael A. Bennett, Greg Martin, Kevin O'Bryant and Andrew Rechnitzer. [Explicit bounds for primes in arithmetic progressions](https://personal.math.ubc.ca/~gerg/papers/downloads/EBPAP.pdf). Illinois Journal of Mathematics62(2018),427–532.

- Michael A. Bennett and Samir Siksek. [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf). Annals of Mathematics 191 (2020), no.2, published article.
- Gregory Debruyne and Jasson Vindas. [On general prime number theorems with remainder](https://arxiv.org/pdf/1601.05324). arXiv1601.05324v2.
- Lior Bary-Soroker, Dimitris Koukoulopoulos and Gady Kozma. [Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3). arXiv:2007.14567v3, final preprint, 2023.
- Valentin Blomer. [Subconvexity for a double Dirichlet series](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/318BFEE754E14DA26285D1F15B2990C1/S0010437X10004926a.pdf/subconvexity-for-a-double-dirichlet-series.pdf). Compositio Math.147 (2011),355–374.
- Jean-Benoît Bost and Alain Connes. [Hecke algebras, type III factors and phase transitions with spontaneous symmetry breaking in number theory](https://alainconnes.org/wp-content/uploads/bostconnesscan.pdf). Selecta Mathematica (N.S.) 1 (1995), no. 3, 411–457.
- Stephanie Chan, Peter Koymans, Djordjo Milovic, Carlo Pagano. [On the negative Pell equation](https://arxiv.org/pdf/1908.01752). arXiv1908.01752v1, 5 August2019 (title-page date6 August2019).
- Alain Connes and Matilde Marcolli. [Noncommutative Geometry, Quantum Fields and Motives](https://www.its.caltech.edu/~matilde/coll-55.pdf). AMS Colloquium Publications 55 (2008).
- J. B. Conrey. [A note on the fourth power moment of the Riemann zeta-function](https://arxiv.org/pdf/math/9509224). 1995 preprint.
- Gaëtan Chenevier, Olivier Taïbi. [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf). Publ. Math. IHÉS131 (2020), 261–323, publisher PDF.
- Boris Datskovsky and David J. Wright. [The adelic zeta function associated to the space of binary cubic forms. II: local theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0367/LOG_0007.pdf). Journal für die reine und angewandte Mathematik 367 (1986), 27–75.
- Adrian Diaconu, Dorian Goldfeld and Jeffrey Hoffstein. [Multiple Dirichlet series and moments of zeta and L-functions](https://www.math.columbia.edu/~goldfeld/GoldfeldDiaconuHoffstein.pdf). Public author manuscript, arXiv math.NT/0110092v1 (2001).
- W. Duke, Ö. Imamoḡlu, Á. Tóth. [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf). Published journal PDF.
- F. W. J. Olver, A. B. Olde Daalhuis, D. W. Lozier et al. (eds.); Chapter 5 by R. A. Askey and R. Roy. [NIST Digital Library of Mathematical Functions, §5.11 Gamma function: asymptotic expansions](https://dlmf.nist.gov/5.11). Online release accessed 14 October 2026.
- F. W. J. Olver, A. B. Olde Daalhuis, D. W. Lozier et al. (eds.); Chapter 5 by R. A. Askey and R. Roy. [NIST Digital Library of Mathematical Functions, §5.17 Barnes’ G-function (double gamma function)](https://dlmf.nist.gov/5.17). Online release accessed 14 October 2026.
- NIST DLMF editors and Chapter5 authors. [NIST Digital Library of Mathematical Functions, Gamma asymptotic expansions](https://dlmf.nist.gov/5.11). Web page.
- Ben Green and Terence Tao. [The primes contain arbitrarily long arithmetic progressions](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n2-p03.pdf). Annals of Mathematics167(2008),481–547.
- Amit Ghosh and Peter Sarnak. [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3). arXiv:1706.06712v3, 30 May 2022.
- Benedict H. Gross, Don B. Zagier. [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf). Inventiones mathematicae84 (1986),225–320, university-hosted published scan,96 pages.
- Andrew Granville, Adam J. Harper and K. Soundararajan. [A new proof of Halász’s theorem, and its consequences](https://arxiv.org/pdf/1706.03749v1). arXiv1706.03749v1.
- D. R. Heath-Brown. [A mean value estimate for real character sums](https://ora.ox.ac.uk/objects/uuid:b188b365-d8d1-4267-8548-49f01e6cb6a7/files/m6af40476f1b860392271a2d8ecae593b). Acta Arithmetica 72 (1995), 235–275.
- Hans Heilbronn. [On real zeros of Dedekind ζ-functions](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/C5957B0EA95C11C03686CE62D407E1DC/S0008414X00050926a.pdf/on-real-zeros-of-dedekind-z-functions.pdf). Canadian Journal of Mathematics25 (1973), 870–873, publisher PDF.
- A. E. Ingham. [Mean-value theorems in the theory of the Riemann zeta-function](https://doi.org/10.1112/plms/s2-27.1.273). Proc. London Math. Soc. (2) 27 (1928), 273–300.
- Jay Jorgenson, Lejla Smajlovic and Polyxeni Spilioti. [Determinants of twisted Laplacians and the twisted Selberg zeta function](https://arxiv.org/pdf/2512.16681v2). arXiv 2512.16681v2, 9 February 2026. The torsion-factor sign in v1 is already corrected in v2.
- J. P. Keating and N. C. Snaith. [Random Matrix Theory and ζ(1/2+it)](https://web.williams.edu/Mathematics/sjmiller/public_html/RH/KeatingSnaith_RandomMatrixThAndZeta%28s%2Bit%29.pdf). Communications in Mathematical Physics 214 (2000), pp.57–89.
- Kiran S. Kedlaya. [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf). Author PreTeXt PDF, last modified 21 December 2025, 154 PDF pages.
- Dimitris Koukoulopoulos. [The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf). Author preliminary version provided with AMS permission.
- Peter Koymans, Carlo Pagano. [On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1). arXiv2201.13424v1, 31 January2022.
- Marcelo Laca. [From endomorphisms to automorphisms and back: dilations and full corners](https://arxiv.org/pdf/math/9911135). Author preprint arXiv math/9911135v1.
- Jeffrey C. Lagarias and Wen-Ching Winnie Li. [The Lerch zeta function I. Zeta integrals](https://arxiv.org/pdf/1005.4712v2). arXiv1005.4712v2.
- Jeffrey C. Lagarias and Wen-Ching Winnie Li. [The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2). arXiv1005.4967v2.
- Jeffrey C. Lagarias and Wen-Ching Winnie Li. [The Lerch zeta function III. Polylogarithms and special values](https://arxiv.org/pdf/1506.06161v1). arXiv1506.06161v1.
- Jeffrey C. Lagarias and Wen-Ching Winnie Li. [The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf). Research in the Mathematical Sciences3:2(2016),54pp, publisher PDF.
- Robert Lemke Oliver, Jiuya Wang and Melanie Matchett Wood. [The average size of 3-torsion in class groups of 2-extensions](https://doi.org/10.1017/S2050508625000009). Forum of Mathematics, Pi13 (2025), e19, published open-access version.
- Robert J. Lemke Oliver, Jiuya Wang and Melanie Matchett Wood. [The average size of 3-torsion in class groups of 2-extensions](https://arxiv.org/pdf/2110.07712).
- Michael Lipnowski and Jacob Tsimerman. [How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1). arXiv:1511.02212v1, 6 November 2015.
- Jean-François Mestre. [Formules explicites et minorations de conducteurs de variétés algébriques](https://www.numdam.org/item/CM_1986__58_2_209_0.pdf). Compositio Mathematica 58 (1986), 209–232, Numdam publisher scan.
- J.S. Milne. [Class Field Theory](https://www.jmilne.org/math/CourseNotes/CFT.pdf). Version4.03,6 August2020, author course notes.
- Sergey Neshveyev. [Ergodicity of the action of the positive rationals on the group of finite adeles and the Bost–Connes phase transition theorem](https://arxiv.org/pdf/math/0002141v1). arXiv math/0002141v1.
- Sergey Neshveyev. [Von Neumann algebras arising from Bost–Connes type systems](https://arxiv.org/pdf/0907.1456v1). arXiv 0907.1456v1. Only the Q specialization of the number-field argument is used.
- Andrew Granville and K. Soundararajan. [Pretentious multiplicative functions and an inequality for the zeta-function](https://arxiv.org/pdf/math/0608407). arXivmath/0608407v1.
- Lillian B. Pierce, Caroline L. Turnage-Butterbaugh and Melanie Matchett Wood. [An effective Chebotarev density theorem for families of number fields, with an application to ℓ-torsion in class groups](https://arxiv.org/pdf/1709.09637). Invent. Math. 219 (2020), 701–778.
- Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou. [Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields](https://doi.org/10.1017/fmp.2022.14). Forum of Mathematics, Pi 10 (2022), e21, 49 pp.
- Peter Sarnak. [Determinants of Laplacians, heights and finiteness](https://publications.ias.edu/sites/default/files/Determinants%20of%20Laplacians.pdf). Author-hosted published scan, pp.601–622. Only the spectral definition and heat argument on p.603 are cited.
- P. Shiu. [A Brun–Titchmarsh theorem for multiplicative functions](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0313/LOG_0015.pdf). Journal für die reine und angewandte Mathematik 313 (1980), pp.161–170.
- Aleksander Simonič and Valeriia V. Starichkova. [Atkinson’s formula for the mean square of ζ(s) with an explicit error term](https://arxiv.org/pdf/2105.06821). J. Number Theory 248 (2023), 39–71.
- A. Smati. [Evaluation effective du nombre d’entiers n tels que φ(n) ≤ x](https://www.impan.pl/shop/publication/transaction/download/product/107486). Acta Arithmetica LXI.2 (1992), 143–159, publisher scan.
- Adolf Hildebrand and Gérald Tenenbaum. [Integers without large prime factors](https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf). JTNB5(1993),411–484, publisher scan.
- Alexei N. Skorobogatov and Efthymios Sofos. [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf). Inventiones Mathematicae 231 (2023), 673–739, published PDF deposited by the University of Glasgow.
- Terence Tao. [The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/). Author post, 23 September 2008, updated 24 September.
- John Tate. [Fourier analysis in number fields and Hecke's zeta-functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf). 1950 thesis, 60-page Rutgers-hosted scan.
- Jesse Thorner and Asif Zaman. [An explicit bound for the least prime ideal in the Chebotarev density theorem](https://msp.org/ant/2017/11-5/ant-v11-n5-p04-p.pdf). Published journal PDF.
- Jacob Tsimerman. [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf). Annals of Mathematics187(2018),379–390.
- D. J. Wright. [The adelic zeta function associated to the space of binary cubic forms. Part I: global theory](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0270/LOG_0046.pdf). Mathematische Annalen 270 (1985), 503–534.
- Zhiwei Yun and Wei Zhang. [Shtukas and the Taylor expansion of L-functions](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p02-p.pdf). Annals of Mathematics 186 (2017), 767–911, published PDF.
- Don Zagier. [New points of view on the Selberg zeta function](https://people.mpim-bonn.mpg.de/zagier/files/tex/NewPointsSelbergZeta/fulltext.pdf). Author-hosted survey. Supplies conventions, not a proof-closure certificate for continuation.
- Asif Ali Zaman. [Analytic estimates for the Chebotarev Density Theorem and their applications](https://www.math.toronto.edu/zaman/files/thesis.pdf). PhD thesis, University of Toronto, 2017.
