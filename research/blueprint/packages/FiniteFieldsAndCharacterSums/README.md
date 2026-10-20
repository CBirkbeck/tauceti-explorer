# Roadmap: finite fields, character sums, finite rings and coding interfaces

**Summary.** Build explicit finite-field presentations, Gauss–Jacobi and Hasse–Davenport identities, finite-field Weil–Deligne estimates, certified factorisation and point counts, Galois rings, sequences and codes. Elementary finite algebra leads to the character normalisations and polynomial L-functions; geometric character sheaves supply the estimates used by the arithmetic applications. The definitive mathematical specification is this document. [Suggested.lean](Suggested.lean) records a representative selection of light definitions and milestone signatures on existing carriers.

## Scope and ownership

This roadmap owns certified relative presentations and comparison maps, explicit tensor-product coordinates, normal-element certificates, polynomial censuses, and linearized polynomial laws. It owns field-coordinate Fourier transport, lifting and product formulas, Stickelberger congruences, character-sheaf constructions and their finite-field estimates. Its algorithm layer owns mathematical correctness and verification of finite-field factorisation and point-count certificates. Its final layers build Galois-ring coordinates, specialised sequence and code families, the finite upper half-plane, integer-polynomial estimates, good-prime lifting counts and exact secret-sharing fibres.

<a id="existing-boundaries"></a>

### Prerequisites and boundaries

Mathlib supplies finite-field classification, the cardinality and Frobenius APIs, `IntermediateField`, trace and norm, `IsGalois.normalBasis`, `AddChar`, zero-extended `MulChar`, `gaussSum` and `jacobiSum`, skew polynomials, truncated Witt vectors, `LinearRecurrence`, polynomial interpolation and Hamming distance. Tau Ceti supplies places, divisors, Riemann–Roch spaces and Weil differentials on native function fields. These carriers are used throughout.

The current AlgebraicCurves roadmap, Layers 7–10, supplies Kummer and Artin–Schreier function fields, their ramification and genus, including the elementary-abelian Artin–Schreier extension. Their character-weighted extension counts and L-polynomial factorizations are the additional results here. EllipticCurves, Layers 2–3, supplies torsion, the point Frobenius, its characteristic polynomial and Hasse's bound; the algorithm layer here uses those results to certify concrete computations. PolynomialGaloisGroups, Layer 5, supplies Frobenius orbit/minimal-polynomial and factor-degree comparisons; the extension-degree gcd/lcm factorisation and explicit tensor product here require additional relative coordinates. AlgebraicCodingTheory, Layers 1–2, supplies the generic code carrier, generator/parity-check matrices, Hamming data and Euclidean/Hermitian duality; specialised RS, BCH, cyclic and AG families are developed here. LocalFieldsRamification and `TauCeti.RingTheory.Henselian.Teichmuller` supply the general Teichmüller lift; the Galois-ring coordinate and character comparisons here specialise it.

Tau Ceti's `WeierstrassCurve.pointCount`, `pointCount_def`, `pointCount_eq_card_point` and `frobeniusTrace_def` already give the point count and trace for the chosen model. Its `WeierstrassCurve.frobeniusTrace_sq_le_four_mul_card` and `WeierstrassCurve.hasse_bound` give Hasse's inequality. Below, `naivePointCount` denotes the existing point count computed by enumeration; the new claims concern certificates, character-sum formulas and the cost of particular algorithms. Mathlib `zmodMulEquivOfGenerator` and `zmodMulEquivOfGenerator_symm_apply_zpow` already supply the cyclic logarithm and its inverse identity; `dlog` denotes this inverse in the Pohlig–Hellman and explicit small-group examples.

The elementary character and dual-indexed Fourier services are consumed from Mathlib, Tau Ceti and the corresponding AnalyticNumberTheory and AdditiveCombinatorics interfaces. In particular `AddChar.complexBasis` supplies the actual additive dual: this roadmap's Fourier result transports that basis to field coordinates. The ordinary powering identity used for shared keys is Mathlib `pow_mul_comm`. General recurrence carriers and companion-matrix algebra are consumed from `LinearRecurrence` and ClassicalArithmeticCompletion. The sequence families and correlation formulas below add finite-field trace and decimation data to those carriers.

The named geometric suppliers below provide schemes, the six operations, weights, general curve zeta functions, conductors and coefficient comparisons. Their required extensions are stated as exact mathematical contracts. Character sheaves, the global Fourier–Deligne transform, their local conductors and the resulting estimates have one owner here. General local Fourier and stationary-phase theories have distinct domains. A norm-one Lang sheaf uses the nonsplit torus, with its stated descent, rather than a split multiplicative Kummer sheaf. General ray-class prime distribution belongs to FunctionFieldArithmetic; the prescribed-constant-coefficient estimate below is only its elementary modulus-\(T\) case.

Mathlib `Chebyshev.theta_ge`, `Chebyshev.theta_ge'` and `Chebyshev.theta_eq_log_primorial` supply quantitative prime-product growth. The additional Schoof interface here only removes the forbidden primes and chooses a logarithmic auxiliary-prime cutoff.

## Conventions

Write \(F\) for a finite field, \(q=\#F\ge2\), and \(p\) for its characteristic. Specify the base in every relative trace and norm. The canonical additive character is \(\psi_F(x)=\exp(2\pi i\operatorname{Tr}_{F/\mathbf F_p}(x)/p)\), with the positive exponential sign. A field extension of degree \(n\) uses the relative \(q\)-power Frobenius, not the absolute \(p\)-power map unless the base is prime.

All `MulChar` values at nonunits are zero, including those of the trivial character. The unnormalised sum is \(g(\chi,\psi)=\sum_x\chi(x)\psi(x)\). Thus \(g(1,\psi)=-1\) for a nontrivial complex additive character and \(J(1,1)=q-2\). Classical extensions with trivial value one at zero and sign-normalised sums have separate conversion definitions below. With \(F=\mathbf F_3\), \(\zeta=\exp(2\pi i/3)\), the canonical values at 1 and 2 are \(\zeta,\zeta^2\), and \(g(1,\psi)=\zeta+\zeta^2=-1\). This fixes both the sign and the trivial-character convention.

Fourier coefficients are \(C_f(a)=q^{-1}\sum_y f(y)\overline{\psi(ay)}\); inversion is \(f(x)=\sum_a C_f(a)\psi(ax)\), and Parseval puts \(q^{-1}\) on the physical side. For the delta function at 1 on \(\mathbf F_3\), \(C_f(1)=\zeta^2/3\). Over \(\mathbf F_4\) the additive dual is not indexed by the cyclic group `ZMod 4`. Projective evaluation with ambient degree \(d\) reads coefficient \(d\) at infinity: for \(d=2\), the polynomial \(X\) has value zero there, although its leading coefficient is one.

Use monic remainder `%ₘ` and normalised gcd or `IsCoprime`; a raw Euclidean gcd may be a nontrivial constant. The degree-zero monic and squarefree census contains 1, while the irreducible census is empty. In \(f=hm^2\), both factors are monic, \(h\) is squarefree, and they need not be coprime: \(X^3=X\cdot X^2\) is a required case.

Linearized polynomials have exponents \(q^i\), \(i\ge0\). Their evaluation is linear over the specified finite base field on compatible commutative coefficient and target algebras; Frobenius invertibility is unnecessary. The zero polynomial has full evaluation kernel, whereas Mathlib's `rootSet 0` is empty. Galois rings use `TruncatedWittVector p n (GaloisField p r)`, with positive length and residue degree where a nontrivial local ring is required.

Sequence correlations conjugate the shifted argument. In the bent-decimation identity the bounded quantity is \(C+\psi(B(0))\). For binary period three, \(b=(0,1,1)\) and \(a=(1,1,0)\) give \(C_{b,a}(0)=-1\) and \(C_{b,a}(2)=3\); this fixes the shift direction. GMW block counts use \(j\le[K:L]\) and a primitive driving element. Code inequalities concern nonzero words; the generic minimum distance of the zero code is zero. Hermitian message dimensions use the finite sum for every degree; the simplified expression requires \(l\ge p-1\).

Cohomological trace formulas state their geometric Frobenius convention. Correlation main terms retain its actual action on coinvariants; arithmetic semisimplicity is unnecessary. Denominators in finite-field averages use \(q>0\), and interpolation denominators use distinct evaluation points. Constant-field Chebotarev retains its arithmetic Frobenius coset. Uniform Lang–Weil constants require bounded presentations and geometric integrality, with the curve genus case distinguished from higher-dimensional Albanese arguments.

## Exact supplier contracts

The contracts below specify the precise mathematical interfaces consumed by the layers. A requested extension describes a theorem that must be supplied with the stated generality; the name of its owner alone does not supply it. The elementary factorisation and certificate-soundness chains depend only on finite algebra and computational semantics; they do not depend on the Weil–Deligne estimates. The geometric estimates and the cost theorems retain their separate assumptions.

### From Mathlib and Tau Ceti

Use Mathlib `FiniteField.frobeniusAlgHom`, `FiniteField.algebraMap_trace_eq_sum_pow`, `FiniteField.algebraMap_norm_eq_prod_pow`, `AdjoinRoot`, `Polynomial.degreeLT`, `Polynomial.degreeLTEquiv`, `MulChar.ofUnitHom`, `AddChar.complexBasis`, `gaussSum_mulShift_eq`, `star_gaussSum_eq`, `gaussSum_mul_gaussSum_eq_card`, and the Jacobi product/inverse-character identities. Tau Ceti's finite-abelian character orthogonality is consumed on the unit group. Native function-field suppliers are `TauCeti.Place`, `TauCeti.Divisor`, `TauCeti.riemannRochSpace`, `TauCeti.weilDifferentialFiltration` and their degree-one residue-field equivalences and local-component residue theorem. The generic linear code is `TauCeti.LinearCode F ι`, definitionally a submodule of `ι → F`. No new substitute carriers are needed.

<a id="contract-F2-R15"></a>

### From AbelianSchemesAndArithmeticModuli:A2

Part II extension: the rational-map universal Albanese–Weil variety of a general projective integral variety, functoriality under rational maps and purely inseparable isogeny invariance; normal-projective Picard/Tate comparison and generic-linear-section maps of Ghorpade–Lachaud 9.4/9.6. A2’s existing abelian-scheme dual/Picard functor is imported as the foundation but is not a general singular-variety Albanese. Distinguish Alb_w from Alb_s and Pic_w from Pic_s.

The required new targets are `albaneseWeil_exists`, `albaneseWeil_birational`, `albaneseWeil_linearSection_surjective`, `albaneseWeil_linearSection_radicialIsogeny` and `picardSerre_tate_H1`. They are extension requests, not existing A2 exports. Use a perfect base field and geometrically integral projective X; the pointed universal property is on a smooth locus with a chosen geometric point, with descent of the resulting abelian variety, rather than an assumed rational point on X. Without a rational base point, descend the unpointed universal map as an Albanese torsor, not an arbitrarily chosen pointed k-map. For X⊂P^N of dimension n and 1≤r≤n−1, the section-map conclusions hold on a nonempty open of the appropriate Grassmannian, not for every section; over a finite base field a member may require a finite extension. Curve-section surjectivity concerns the Jacobian of the smooth normalization; the radicial-isogeny conclusion requires section dimension n−r at least two. The Picard comparison is for normal projective X and ℓ different from the characteristic: V_ℓ(Pic_s X)(−1)≃H¹(X_k̄,Q_ℓ), equivariantly. A normal projective cone over a positive-genus smooth curve has Alb_s=0 and Alb_w equal to that curve's Jacobian; even normality does not identify the two. See [Ghorpade–Lachaud](#source-16), §9, pp.26–29, especially Example 9.2 and Propositions 9.4/9.6.

Used by: [Albanese–Weil varieties and linear curve sections](#FF2-albanese-linear-section-bound), [Bombieri–Sperber’s Albanese point-count expansion](#FF2-bombieri-sperber-albanese-expansion), [The highest odd weight and the Albanese–Weil spectrum](#FF2-top-weight-albanese-comparison).

<a id="contract-P-R11"></a>

### From ArithmeticGaloisRepresentations:R01.3

Swan conductors in equal characteristic: for a complete discretely valued field K of characteristic p with algebraically closed residue field (e.g. F̄_q((t))) and a continuous finite-dimensional E_λ-representation V of Gal(K^sep/K), with E_λ finite over Q_ℓ and ℓ≠p, Sw(V) = Σ_λ λ·dim V(λ) over the upper-numbering breaks, an integer, additive in short exact sequences and invariant under unramified extension; for the nontrivial characters of an Artin–Schreier extension T^p − T = u with v(u) = −m, p ∤ m, Sw = m. The contract includes the geometric complete discrete valuation field with algebraically closed residue field; a finite-residue-field statement alone does not cover this use.

The general representation targets are AGR §3.1 `wildImage_finite`, `absUpperRamificationGroup`, `breakDecomposition`, `swanConductor_eq_lowerSum`, `swanConductor_extendScalars` and §3.2's integrality theorem. Their missing prerequisite is an extension under the LocalFieldsRamification parent: extend the existing lower/upper filtration, Herbrand quotient compatibility and conductor integrality to complete DVRs with perfect, possibly infinite, residue field. AGR §3.1 explicitly records that prerequisite gap. The general-valued-field Part II concerns tameness, and its Kato continuation imports the classical perfect-residue Swan conductor; neither supplies this missing classical filtration. Import AGR §3.7 `artinSchreier_break` and `artinSchreier_swanConductor` for the field-level value Sw=m. The additional target in [§2.9](#FF2-geometric-artin-schreier-break) compares native places, completions and sheaf stalks with that same conductor.

Used by: [Sw_x(L(ψf)) = v*_x(f) (Sommes trig. (3.5.4))](#FF2-swan-conductor-of-artin-schreier-sheaf).

<a id="contract-F2-R10"></a>

### From ArithmeticGaloisRepresentations:R01.3

Part II equal-characteristic extension: conductors of continuous ℓ-adic representations of geometric complete DVRs k̄((t)), ℓ≠p, using finite wild inertia and break decomposition; integrality/additivity and the lower/upper finite-image conductor relation. Include Sw(V⊗W)≤rk(W)Sw(V)+rk(V)Sw(W), tame unipotent invariants, and twisting by a strictly larger rank-one break. R01.3’s arithmetic wording and finite-residue-field LocalFieldsRamification do not already export this geometric contract. Layer 2 transports AGR's rank-one Artin–Schreier calculation to the native character sheaf.

Use the AGR break/conductor API after that perfect-residue extension. Request `swanConductor_tensor_le` with the displayed tensor bound; consume AGR §3.4 `artinConductor_twist_dominant` for the dominant twist. These targets apply to a continuous representation over a finite extension of Q_ℓ, ℓ≠p, with finite wild image; finite tame image is unnecessary. In particular, if a rank-one W has break beta greater than every break of V, then Sw(V⊗W)=rk(V) beta. For V=0 both sides are zero. Integrality concerns the total Swan conductor, not each slope: an isoclinic rank-two representation can have break 1/2 and Swan 1. Neither a finite unramified extension nor the finite-residue local-field hypothesis turns a residue field into its algebraic closure. AGR §3.4's `artinConductor_unramifiedBaseChange` includes completed maximal unramified base change, but its stated setting still assumes the perfect-residue filtration. To use it as an independent bridge, prove preservation of that full upper filtration and invariant dimensions from the finite-residue case, rather than invoke the general setting circularly.

Used by: [Artin–Schreier breaks over geometric local fields](#FF2-geometric-artin-schreier-break), [Cohomology of hyper-Kloosterman fibers](#FF2-hyper-kloosterman-fiber-cohomology), [Local monodromy of hyper-Kloosterman sheaves](#FF2-hyper-kloosterman-local-monodromy), [The full main term in trace-function correlations](#FF2-trace-correlation-main-term), [Cancellation outside the geometric Möbius stabilizer](#FF2-mobius-autocorrelation-bound).

<a id="contract-F3-R01"></a>

<a id="contract-P-R21"></a>

### From ComputationalNumberTheory:CN.0

Require a Part II extension of CN.0: its existing `RAMInstruction`, `ramStep` and `PolynomialRAMMagnitude` (§§0.1–0.7) describe integer RAM/bit computation, not the generic ring/random program semantics below. The requested interfaces are `RingProgram`, `RingProgram.run`, `RingProgram.cost`, `RingProgram.uniform`, `generateAndTest_output`, `generateAndTest_tail` and `generateAndTest_expectedCost`. These names specify missing exports, not existing CN.0 declarations. Ring operations and bit operations have distinct cost functions and are compared only by an explicit simulation theorem.

The algebraic cost model over a commutative ring R, with the randomness model, as Shoup uses them in Chapter 20 (§§3.2, 9.1, 17.1): (1) an algorithm over R is a program whose primitive steps are +, −, ×, the equality test, inversion of units and, for finite R, drawing a uniformly random element of R, each of unit cost ('operations in R'); (2) a deterministic program's cost on an input is the number of primitive steps; an almost-surely terminating randomized program has an output distribution (a Mathlib PMF) and a cost random variable; prove almost-sure termination from P[more than n steps] → 0 and then state its expected cost E[cost] (Shoup §9.1.2); serial composition, conditionals and loops (Shoup Examples 9.1-9.4) and the generate-and-test theorem (Shoup Theorem 9.3: geometric number of iterations, E[Z] = E[Z₁]/P[H₁], conditional output law); (3) the dense coefficient-vector representation of R[X] with the costs of Shoup Theorem 17.1 (± in O(len g + len h), × in O(len g · len h), division with remainder by h with unit leading coefficient in O(len h · len q)), arithmetic in R[X]/(f) (+ in O(ℓ), × in O(ℓ²), α^e with O(len e) multiplications, Shoup p. 467), Euclid and extended Euclid over a field in O(len g · len h) (Theorems 17.3, 17.5), and Gaussian elimination over a field computing the reduced row echelon form, the rank and a basis of the row null space of an m × n matrix in O(mn(m + n)) operations (Shoup §14.4, pp. 390-393); (4) the translation to bit operations for the standard presentations of 𝔽_q (ℤ/p, or 𝔽_p[X]/(φ) with φ irreducible of degree w; FiniteFieldsAndCharacterSums Layer 0), where one arithmetic operation in 𝔽_q costs O(len(q)²) bit operations (Shoup Chapter 20 introduction), and for ℤ/p^kℤ, O(len(p^k)²).

Uniform draws require independent fresh randomness. Exact uniform sampling from a range not of power-of-two size uses rejection of binary samples; its bit-cost guarantee is an expectation, not a worst-case bound. Unit inversion uses a valid unit witness, or a partial operation returning failure on nonunits in an executable presentation with decidable unit testing. The output PMF is required only after almost-sure termination is proved. A general run keeps nontermination and invalid inversion separate from a returned value, and uses an extended nonnegative cost. For generate-and-test, require independent identically distributed trials, each almost surely finite, with success probability alpha>0 and finite mean trial cost c. If N is the first successful trial, P(N>k)=(1−alpha)^k for k≥0, E[N]=1/alpha and E[total cost]=c/alpha; the returned output has the single-trial law conditioned on success. A trial's own cost may correlate with its success. Independence from previous trials, not independence within a trial, justifies summing the costs. At alpha=0 there is no terminating output law; at alpha=1 exactly one trial is used. A sampler of a uniform basis vector does not replace independent uniform coefficients in the full vector space.

**Checks.**

- With success probability 1, the output is the first trial's output and the mean total cost is c; at probability 0, a terminating output PMF is unavailable.
- For equiprobable success/failure with respective trial costs 3 and 1, c=2 and the mean total cost is 4. The geometric tail at k=2 is 1/4. Assuming independence of a trial's cost and its success would be unjustified.
- A uniform vector of F_2² has four possible values, including zero; choosing uniformly between the two standard basis vectors omits half that support and cannot implement the same sampler.

Used by: [Cost of Algorithm SFD](#FF3-square-free-decomposition-algorithm-cost), [Cost of Algorithm DDF](#FF3-distinct-degree-factorization-algorithm-cost), [Cost of Algorithm IPT](#FF3-irreducibility-test-cost), [Cost of generating and of checking a Rabin certificate](#FF3-rabin-certificate-generation-cost), [Expected cost of Algorithm EDF](#FF3-equal-degree-factorization-cost), [Expected cost of the Cantor–Zassenhaus algorithm](#FF3-cantor-zassenhaus-cost), [Berlekamp's factoring algorithm](#FF3-berlekamp-algorithm), [Las Vegas correctness of Berlekamp's algorithm](#FF3-berlekamp-algorithm-correct), [Cost of Berlekamp's algorithm](#FF3-berlekamp-algorithm-cost), [Expected cost of Algorithm RIP](#FF3-random-irreducible-polynomial-cost), [Cost of linear Hensel lifting](#FF3-hensel-lifting-algorithm-cost), [Cost of naive and of certified counting](#FF3-naive-point-count-cost), [Cost of Schoof's algorithm](#FF3-schoof-algorithm-cost).

<a id="contract-F3-R02"></a>

<a id="contract-P-R22"></a>

### From ComputationalNumberTheory:CN.0

Require `DensePolynomial.decode`, `DensePolynomial.decode_add`, `_mul`, `_divMod_monic`, `_gcd`, `_xgcd` and `_powMod`, with operation counts and a bit simulation for the selected coefficient presentation. These are requested refinement targets, beyond CN.0's existing integer RAM. The total Euclidean gcd and extended-gcd refinements are over coefficient fields; over a general coefficient ring a unit-pivot routine is partial and may fail. Inversion at a nonunit returns failure; division is promised only when the leading coefficient is a unit. Constant and zero polynomial encodings must decode correctly, including zero remainder modulo a unit polynomial. No computability assertion follows merely from a noncomputable native `AdjoinRoot` equivalence.

Executable presentations with refinement lemmas: dense coefficient-list presentations of F[X] over the Layer 0 standard presentations of finite fields and of (ℤ/p^kℤ)[X], with lemmas identifying their +, ×, division by a monic polynomial and modular powering with Mathlib's Polynomial operations, and gcd/extended gcd over coefficient fields (a unit-pivot partial version over ℤ/p^kℤ), so that Layer 3's checkers (FactorizationCertificate.check, PointCountCertificate.check, Layer 0's Rabin checker) and algorithms evaluate by computation on concrete inputs. Layer 3's objects are Mathlib functions on Polynomial F; CN.0 owns their computable refinements.

**Checks.**

- In Z/4, 2 is a nonunit and 2²=0; an inversion instruction must fail there. The unit 3 has inverse 3.
- Modulo the monic unit polynomial 1, every polynomial decodes to zero in the quotient and every remainder is zero, including the remainder of 0.
- In F_3[X]/(X²+1), the square of the class of X is 2, while the unreduced dense product has coefficient 1 in degree two. Refinement must include remainder reduction rather than comparing those coefficient lists literally.

Used by: [Factorization certificate and its checker](#FF3-factorization-certificate), [Point-count certificate](#FF3-point-count-certificate), [Certified factorization over a finite field](#FF3-certified-factorization-algorithm), [The Cantor–Zassenhaus algorithm](#FF3-cantor-zassenhaus-algorithm), [Berlekamp's factoring algorithm](#FF3-berlekamp-algorithm), [Schoof's algorithm](#FF3-schoof-algorithm).

<a id="contract-P-R30"></a>

### From Lean and Mathlib: finite decision reflection

For a finite enumerated set S and a decidable predicate P, `of_decide_eq_true` turns a kernel-checked equality `decide (∀ x ∈ S, P x) = true` into the proposition itself. The enumeration must cover S; checking a list of samples proves only the assertions on that list. This is existing logical infrastructure, not a new arithmetic certificate carrier. An explicit constant instantiation of a theorem is ordinary theorem application. In Layer 5 it can verify the 65,536 inputs of the displayed fold, or the fold's correctness can be proved by induction. The operation count of either verification is a separate cost theorem under the requested CN.0 model; reflection supplies no complexity bound.

Used by: [Correctness does not imply hardness: an explicit fast discrete logarithm on F_65537](#FF5-correctness-without-hardness-example).

<a id="contract-F3-R03"></a>

### From Lean and Mathlib: verification of an arithmetic checker

Layer 3's factorization and point-count soundness theorems connect their Boolean checkers to the native mathematical conclusions. On a concrete input, supply a kernel-checked equality `check input certificate = true` and apply that soundness theorem. `of_decide_eq_true` handles the logical reflection; the executable representation must still be related to the native input by the requested CN.0 refinement equations. A checksum, an unchecked external Boolean, or a successful test of a different input is insufficient. Verification costs remain explicit arithmetic operation counts rather than consequences of kernel acceptance.

Used by: [Factorization certificate and its checker](#FF3-factorization-certificate), [Point-count certificate](#FF3-point-count-certificate).

<a id="contract-P-R05"></a>

### From DeligneWeightsAndPurity:DWP.0

q-Weil numbers of weight w: algebraic numbers all of whose complex conjugates have absolute value q^{w/2}; Galois conjugates of q-Weil numbers are q-Weil numbers of the same weight; the reciprocal roots of a polynomial in ℤ[T] satisfying the Riemann-hypothesis bound for every embedding are q-Weil numbers.

Used by: [Weil: L(f, ψ; T) has degree d − 1 and its reciprocal roots are q-Weil numbers of weight 1](#FF2-additive-l-function-purity), [Weil: for g squarefree with gcd(deg g, ord χ) = 1, Z(g, χ; T) has degree m − 1 and reciprocal roots of weight 1](#FF2-multiplicative-l-function-purity).

<a id="contract-F2-R14"></a>

### From DeligneWeightsAndPurity:DWP.1

Weil weight-one bounds for the characteristic roots of Frobenius on an abelian variety, and compatibility with its Tate-module Frobenius convention and isogeny invariance, used for Alb_w spectra.

Used by: [The highest odd weight and the Albanese–Weil spectrum](#FF2-top-weight-albanese-comparison).

<a id="contract-F2-R11"></a>

### From DeligneWeightsAndPurity:DWP.5

Weil II 1.8.12: weights of a mixed lisse sheaf are constant on a connected normal parameter scheme, for a fixed embedding, with a separate all-conjugate application for algebraic sheaves. This family-weight constancy is additional to generic local-weight terminology. Also provide the local-weight bound for inertia-invariant middle-extension stalks on a smooth curve: a punctually ι-pure weight-zero lisse sheaf has boundary Frobenius eigenvalues of ι-weight≤0 and stalk rank at most its generic rank.

Used by: [Ranks and purity in the universal polynomial family](#FF2-polynomial-family-cohomology), [The full main term in trace-function correlations](#FF2-trace-correlation-main-term).

<a id="contract-P-R04"></a>

### From DeligneWeightsAndPurity:DWP.6

Weil II Théorème 3.2.3: for C₀ a smooth projective curve over F_q, j : U₀ → C₀ a dense open and F₀ a lisse sheaf on U₀ punctually ι-pure of weight β, every eigenvalue of Frobenius on H¹(C_F̄, j_*F) is ι-pure of weight β + 1; used with β = 0 for the rank-one Artin–Schreier sheaves L(ψf) of a rational function f.

Used by: [Weil–Deligne bound for additive sums of a rational function on a curve (Sommes trig. (3.5.2))](#FF2-artin-schreier-sum-on-curve-bound).

<a id="contract-P-R03"></a>

### From DeligneWeightsAndPurity:DWP.7

Weil II Corollaries 3.3.4–3.3.6 in the supplier’s two distinct forms. For a fixed embedding ι and an ι-mixed constructible sheaf of weights ≤w, compactly supported cohomology is ι-mixed of weights ≤w+i; this alone does not assert algebraicity, integer weights or bounds at every embedding. For an algebraic sheaf mixed of integer weights at all embeddings, obtain the algebraic/all-conjugate integer-weight conclusion. The rank-one finite-order sheaves and constant sheaf used here satisfy the latter input. Roots of unity as traces imply weight zero only in rank one, where the trace is the eigenvalue; do not use that test for higher-rank sheaves. On a smooth X and a lisse punctually pure sheaf of weight w, ordinary cohomology has weights ≥w+i and the image H_c^i→H^i is pure of weight w+i, in the same chosen-embedding or algebraic convention as the hypotheses.

Used by: [Deligne's bound for sums of trace functions, with the H²_c main term subtracted](#FF2-deligne-bound-for-trace-functions), [Deligne's estimate for character sums on a variety by the Betti numbers of the character sheaf (1.17.1)](#FF2-deligne-estimate-for-character-sums), [If H_c → H is an isomorphism on a smooth affine variety, cohomology is concentrated in the middle degree and pure (Sommes trig. 1.19-1.21)](#FF2-affine-concentration-criterion), [The elementary L-function of a rank-one character sum is det(1 − T·Frob | H¹_c) when it is a polynomial](#FF2-rank-one-sheaf-l-function), [Reciprocal roots of polynomial rank-one L-functions have absolute value at most √q (Deligne route)](#FF2-rank-one-sheaf-root-bound), [Deligne's bound |Σ_{x∈F^n} ψ(Q(x))| ≤ (d − 1)^n q^{n/2} (Weil I Théorème 8.4)](#FF2-deligne-n-variable-bound), [Lang–Weil estimate #V(F_{q^r}) = q^{re} + O_V(q^{r(e−1/2)})](#FF2-lang-weil-estimate).

<a id="contract-F2-R12"></a>

### From DeligneWeightsAndPurity:DWP.7

The actual sharp direct-image bounds: H^i_c of a weight-zero algebraic sheaf has weights≤i, and ordinary cohomology on smooth varieties has the dual lower bounds. State both fixed-embedding ι versions and algebraic all-conjugate versions; purity on the clean image follows from the two bounds. Do not identify these with a numerical assertion about an arbitrary trace function.

Used by: [Ranks and purity in the universal polynomial family](#FF2-polynomial-family-cohomology), [Cohomology of hyper-Kloosterman fibers](#FF2-hyper-kloosterman-fiber-cohomology), [Bombieri–Sperber’s Albanese point-count expansion](#FF2-bombieri-sperber-albanese-expansion), [The highest odd weight and the Albanese–Weil spectrum](#FF2-top-weight-albanese-comparison), [The full main term in trace-function correlations](#FF2-trace-correlation-main-term), [Isotypic quasi-orthogonality](#FF2-isotypic-quasi-orthogonality).

<a id="contract-F2-R13"></a>

### From DeligneWeightsAndPurity:DWP.8

Geometric semisimplicity of pure lisse sheaves, weight filtration/quotients and generalized Frobenius eigenvalue conventions. Arithmetic semisimplicity is not asserted; traces of powers remain valid with Jordan blocks.

Used by: [The highest odd weight and the Albanese–Weil spectrum](#FF2-top-weight-albanese-comparison), [Isotypic quasi-orthogonality](#FF2-isotypic-quasi-orthogonality).

<a id="contract-F2-R06"></a>

### From EtaleDualityAndPerverseSheaves:EDC.0

Actual constructible E-adic derived categories and their cohomology sheaves, on scheme étale sites, with support and coefficient-extension conventions. These are the carriers of L_ψ, Rπ!, the universal family and pullback isomorphisms; no private Prop-valued carrier substitutes are planned.

Used by: [Local acyclicity of the universal polynomial sheaf](#FF2-polynomial-family-local-acyclicity), [The relative hyper-Kloosterman sheaf](#FF2-hyper-kloosterman-sheaf), [The geometric Möbius stabilizer of a sheaf](#FF2-geometric-mobius-stabilizer).

<a id="contract-P-R09"></a>

### From EtaleDualityAndPerverseSheaves:EDC.2

Poincaré duality for X₀ smooth separated of pure dimension n over F_q and F lisse: H^i_c(X_F̄, F) × H^{2n−i}(X_F̄, F^∨(n)) → E_λ perfect and Frobenius-equivariant; hence H^{2n}_c(X_F̄, F) ≅ (F_x̄)_{π₁(X_F̄)}(−n) for X connected (coinvariants, Sommes trig. 1.18 d)), H^{2n}_c(V_F̄, ℚ_ℓ) ≅ ℚ_ℓ(−n) for V geometrically irreducible of dimension n (first replace V by V_red, which preserves rational points and étale cohomology, then use a smooth dense open), and on a smooth proper curve the duality of H¹(X̄, j_*F) with H¹(X̄, j_*F^∨(1)) (SGA 4½ [Dualité] 1.3, 2.1).

Used by: [H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve), [If H_c → H is an isomorphism on a smooth affine variety, cohomology is concentrated in the middle degree and pure (Sommes trig. 1.19-1.21)](#FF2-affine-concentration-criterion), [An involution with f∘σ = −f pairs the Frobenius eigenvalues as α, q/α (Sommes trig. 3.6)](#FF2-involution-eigenvalue-pairing), [The cup product on H^n_c(A^n, L_ψ(Q)) is a perfect duality; forget-supports is an isomorphism (Weil I Lemme 8.5(ii))](#FF2-deligne-duality-for-polynomial-sheaf), [Lang–Weil estimate #V(F_{q^r}) = q^{re} + O_V(q^{r(e−1/2)})](#FF2-lang-weil-estimate), [Weil–Deligne bound for additive sums of a rational function on a curve (Sommes trig. (3.5.2))](#FF2-artin-schreier-sum-on-curve-bound).

<a id="contract-P-R10"></a>

### From EtaleDualityAndPerverseSheaves:EDC.2

The Grothendieck–Ogg–Shafarevich formula: for X̄ a smooth projective connected curve of genus g over an algebraically closed field of characteristic p ≠ ℓ, X = X̄ ∖ S with S finite, and F a lisse E_λ-sheaf on X, χ_c(X, F) = rk(F)·(2 − 2g − #S) − Σ_{s∈S} Sw_s(F) (Sommes trig. (3.2.1), citing Raynaud, Séminaire Bourbaki 286).

Used by: [dim H¹_c(U, 𝓕) ≤ C(𝓕)², with the conductor C(𝓕) = rk 𝓕 + #S + Σ Sw_x(𝓕)](#FF2-h1c-conductor-bound), [Weil–Deligne bound for additive sums of a rational function on a curve (Sommes trig. (3.5.2))](#FF2-artin-schreier-sum-on-curve-bound), [H*_c(A^n, L_ψ(Q)) is concentrated in degree n, of dimension (d − 1)^n (Weil I Lemme 8.5(i))](#FF2-deligne-cohomology-of-polynomial-sheaf).

<a id="contract-F2-R07"></a>

### From EtaleDualityAndPerverseSheaves:EDC.2

Poincaré duality and the Frobenius-equivariant H²_c=geometric-coinvariants(−1) formula on smooth affine curves; clean extension from vanishing inertia and compatibility with deck-character decomposition; Gysin and duality for the normal-surface Albanese comparison. In addition, the coefficient-compatible Euler characteristic formula is: for C/k smooth projective connected of genus g, U=C−S, F lisse E_λ with ℓ≠char k, χ_c(U,F)=rk(F)(2−2g−|S|)−Σ Sw_s(F). Its E_λ-adic form includes the finite-torsion, stable-lattice, inverse-limit and coefficient-extension comparisons.

Used by: [Ranks and purity in the universal polynomial family](#FF2-polynomial-family-cohomology), [Family transport of polynomial duality](#FF2-polynomial-boundary-clean-duality), [Gauss cohomology over a finite étale algebra](#FF2-etale-algebra-gauss-cohomology), [Cohomology of hyper-Kloosterman fibers](#FF2-hyper-kloosterman-fiber-cohomology), [Local monodromy of hyper-Kloosterman sheaves](#FF2-hyper-kloosterman-local-monodromy), [Katz’s smooth affine Betti bound](#FF2-smooth-affine-betti-bound), [Katz’s arbitrary affine Betti bound](#FF2-arbitrary-affine-betti-bound), [Bombieri–Sperber’s Albanese point-count expansion](#FF2-bombieri-sperber-albanese-expansion), [The full main term in trace-function correlations](#FF2-trace-correlation-main-term).

<a id="contract-F4-R02"></a>

### From EtaleDualityAndPerverseSheaves:EDC.2

For a tame lisse sheaf on a punctured genus-zero curve, require the Euler–Poincaré formula χ_c(U,L)=rank(L)(2−#punctures), and H⁰_c=H²_c=0 for a nonproper geometrically connected U and geometrically nontrivial rank-one L. For the quadratic norm torus the punctures over the algebraic closure are 0,∞ and two roots of z²+tz+1, or one double root at t=±2.

Used by: [Katz estimate for the quadratic norm torus](#FF4-katz-quadratic-torus-estimate).

<a id="contract-F2-R08"></a>

### From EtaleDualityAndPerverseSheaves:EDC.4

Part II extension: for smooth connected affine V⊂A^N of dimension n≥2, a dense open of affine hyperplanes gives smooth connected V∩H with H^i(V,Q_ℓ)→H^i(V∩H,Q_ℓ) isomorphism for i≤n−2 and injection for i=n−1. This affine contract supplements projective smooth weak Lefschetz.

Used by: [Katz’s smooth affine Betti bound](#FF2-smooth-affine-betti-bound).

<a id="contract-F4-I01"></a>

### Norm-one Lang character sheaves from Layer 2

Rank-one Lang character sheaf on the quadratic norm torus: rational-point trace ω, finite monodromy and tame rank-one structure. Use the [norm-one Lang character sheaf](#norm-one-lang-sheaf); its nonsplit descent is part of the construction.

Used by: [Katz estimate for the quadratic norm torus](#FF4-katz-quadratic-torus-estimate).

<a id="contract-F4-I02"></a>

### Mixed tame character-sheaf estimates from Layer 2

Compact-support trace formula and mixed Kummer bound for the actual Lang/Kummer tensor sheaves used here. For Jχ(a), the punctures are 0,∞ and the roots of δy²+(a−2δ)y+δ, with discriminant a(a−4δ)≠0; geometric nontriviality, χ_c and dim H¹_c≤2 must be checked.

Used by: [Katz estimate for the quadratic norm torus](#FF4-katz-quadratic-torus-estimate), [Character sums for Terras eigenvalues](#FF4-terras-spectral-character-transfer).

<a id="contract-P-R15"></a>

### From FunctionFieldArithmetic:FA.5

For a one-variable function field E/F_q with exact constant field F_q and genus g: Z_E(T) := Π_P (1 − T^{deg P})^{−1} = exp(Σ_ν N_ν T^ν/ν) with N_ν the number of degree-one places of the constant field extension E·F_{q^ν}, and Z_E(T) = L_E(T)/((1 − T)(1 − qT)) with L_E ∈ ℤ[T] of degree exactly 2g and L_E(0) = 1 (Riemann–Roch rationality route).

Used by: [The numerator of the zeta function of y^q − y = f(x) is Π_{a≠0} L(af, ψ; T)](#FF2-artin-schreier-zeta-factorization), [The numerator of the zeta function of y^d = g(x) is Π_{χ≠1, χ^d=1} Z(g, χ; T)](#FF2-kummer-zeta-factorization).

<a id="contract-F2-R17"></a>

### From FunctionFieldArithmetic:FA.5

The finite-cover constant-field quotient and arithmetic Frobenius coset convention, G/H≅Gal(F_{q^m}/F_q), plus curve Chebotarev with genus/conductor-controlled errors. Layer 2 extends the variety twist application to this convention and imports the one-variable theorem.

Used by: [Twists of a geometric component in the Frobenius coset](#FF2-constant-coset-twist-count), [Chebotarev with a constant-field Frobenius coset](#FF2-constant-field-coset-chebotarev).

<a id="contract-F2-R09"></a>

### From LefschetzPencilsAndVanishingCycles:LPV.0

Part II general-base extension: local acyclicity of a constructible complex pulled back from a fixed étale local product over any finite-type coefficient base, and proper pushforward then lissity with base change, as SGA 4½ [Th. finitude] 2.16/A.2 used by Weil II 3.7.3. The global-to-local comparison also requires: compare compactified global Rpr₂!(pr₁*K⊗L_ψ(xy))[1] nearby/vanishing cycles with the local R¹Φ kernels π/π′, π′/π and 1/(ππ′), including finite singularities and infinity. Fix geometric Frobenius, shift [1], inversion x↦−x and twist (−1), and Laumon 2.4.3.3’s exclusions of geometrically constant subquotients in local duality.

Used by: [Local acyclicity of the universal polynomial sheaf](#FF2-polynomial-family-local-acyclicity), [Lissity of universal exponential-sum cohomology](#FF2-polynomial-family-lissity).

<a id="contract-F1-R01"></a>

### From DirichletPadicLFunctions:L3, §4.5: scalar Dwork coefficients

Use the arithmetic scalar series `dworkSplittingSeries` and its coefficient/tail estimates. Let p be any prime, f>0, q=p^f, and K a complete ultrametric characteristic-zero normed field with a norm-preserving Q_p embedding. For pi^(p−1)=−p put r=‖pi‖ and

```text
theta(T)=rescale(pi,PowerSeries.exp K)*expand(p,rescale(−pi,PowerSeries.exp K)),
Theta_q(T)=∏_(0≤i<f)theta(T^(p^i))
          =rescale(pi,PowerSeries.exp K)*expand(q,rescale(−pi,PowerSeries.exp K)).
```

The expansions use p,q≠0. These are formal series before evaluation. For A_n=coeff_n(Theta_q), require v_p(A_n)≥n(p−1)/(p q), equivalently ‖A_n‖≤r^(n(p−1)^2/(p q)); hence the convergence radius is at least p^((p−1)/(p q))>1. The q-bound also follows from the p-bound: a convolution term of weighted degree n has ∑p^i n_i=n and therefore ∑n_i≥n/p^(f−1). The ultrametric triangle inequality bounds the finite coefficient sum. The scalar estimate is in [Robert (2001)](#source-47), proof of the tail-bound lemma, printed p.167, with the dyadic tail calculation continued on p.168. Appendix 1 on p.169 instead concerns Gamma reflection.

This is the scalar arithmetic interface of L3 §4.5, also planned as RD.1.64 in the rigid-cohomology direction; it is consumed once here. Summability at ‖z‖≤1 follows from the coefficient bound. Boundary evaluation is of this combined series, not of two separately evaluated ordinary exponentials. Factorial quotients and moving tails are L3's `robert_factorial_limit`, `robert_finiteDifference` and `robert_telescope`, not additional constructions here.

**Checks.**

- A_0=1 and A_1=pi for every q≥2. Reversing the Frobenius-factor sign changes A_1 to −pi.
- At p=q=2 and pi=−2, A_2=pi²/2−pi=4, whereas the formula for q>2 gives pi²/2=2. These coefficient identities already make sense over Q and are proved in the suggested file.
- At a Teichmüller argument 1, replacing the coefficient sum by the ordinary exponential of pi(1−1) would give 1 and contradict the nontrivial splitting value below.

Used by: [Exact Gamma route to the Hasse–Davenport product](#FF1-hasse-davenport-product-completion).

<a id="contract-F1-R02"></a>

### From DirichletPadicLFunctions:L3, §4.5: chosen roots and trace values

Consume `dworkSplittingSeries_frobenius`, `dworkSplittingSeries_traceCharacter` and `grossKoblitz_formula` in their all-prime scalar form. For a normalized complete p-adic local field K with residue field F of cardinality q=p^f, f>0, a primitive pth root zeta and the compatible pi, require

```text
pi^(p−1)=−p,     pi≡zeta−1 mod (zeta−1)²,
∑'_n A_n tau(u)^n
  = (AddChar.zmodChar p zeta.pow_eq_one)(Algebra.trace (ZMod p) F u)   (u:Fˣ).
```

Here tau is the actual native `TauCeti.teichmuller` lift, A_n are exactly the coefficients above, and the trace/additive character use the indicated prime field. Include existence and uniqueness of compatible pi and identification of Theta_p(1) with zeta from its congruence 1+pi modulo pi². The ideal in that congruence is the cyclotomic uniformizer ideal, not the ideal generated by the rational integer p. The coefficient theorem supplies convergence; the additional splitting theorem proves the pth-root value and identifies that root. An inverse Frobenius factor has the opposite series sign and requires an explicit conversion.

L3 §4.5 owns these scalar targets for every prime, including p=2 with pi=−2 and zeta=−1. Its `grossKoblitz_formula` is the source-negative Gauss sum equality with the actual trace character and Gamma orbit. It imports scalar analysis from LocallyAnalyticDistributions and does not require the higher rigid-cohomology package. RD.6.46/6.48's odd-prime splitting statements are not the supplier used by this arithmetic proof. Take K to be the completion of the cyclotomic character-value field at the chosen prime above p, retaining its coefficient embedding.

**Checks.**

- At p=q=2, tau(1)=1 and Theta_2(1)=−1, not the ordinary exponential value 1. The prime-field trace character with zeta=−1 takes 1 to −1; this native character calculation is proved in the suggested file.
- At p=2,f=2 the trace of 1 is 0 and the splitting value at tau(1) is 1. The one-factor value cannot be copied to the f-fold product.
- Changing zeta requires the matching compatible pi; choosing arbitrary roots with the right powers does not specify the same additive character.

See [Robert (2001)](#source-47), Appendix 2, printed p.169, for the splitting-value normalization, and Theorem 4, p.168, for the all-prime Gamma–Gauss comparison. Appendix 2 uses Dwork's pth-root theorem; L3 §4.5 includes that theorem among its scalar proof obligations, not as an assumption about arbitrary series values.

Used by: [Exact Gamma route to the Hasse–Davenport product](#FF1-hasse-davenport-product-completion).

<a id="contract-F1-R03"></a>

### From DirichletPadicLFunctions:L3, §4.6: exact Gamma multiplication

Use the supplier's actual unit-valued Morita Gamma function, with Γ_p(0)=1 and Γ_p(1)=−1. For p prime, f>0, M=p^f−1, m>0 prime to p and 0<k<M, put x_i=(p^i k mod M)/M in Z_p. Its `moritaMultiplicationProduct` is F_m(x)=∏_(0≤h<m)Γ_p((x+h)/m), with C_m=F_m(0)=∏_(1≤h<m)Γ_p(h/m). The consumed exact orbit identity is

```text
Q=∏_(0≤i<f) F_m(x_i)/(Γ_p(x_i) C_m) = omega(m)^k.
```

Here omega(m) is the prime-field Teichmüller unit. Require `moritaMultiplicationProduct_nat`, `_congruence`, `_orbit` and `_teichmuller`, including the comparison with the positive fractional preimages in Gross–Koblitz Theorem 3.1(2). When m divides M, reindexing those preimages gives exactly the quotient used in §1.6. No change from Γ_p(0) to Γ_p(1) is allowed at a zero exponent.

The all-prime route uses the supplier's natural-argument recurrence

```text
F_m(n) m^U_p(n)=Γ_p(n) C_m,
U_p(n)=#{0≤j<n:p∤j}.
```

At precision p^ell, for representatives r_i of x_i, the orbit carries give p^(ell−1)∣∑_i U_p(r_i). Combine the finite-precision product with Euler's unit theorem to prove Q^(p−1)=1. Work at cofinal ell≥3: the unrestricted Gamma congruence at ell=2 is false for p=2. The separately proved residue Q≡m^k modulo p then identifies this prime-to-p root uniquely. For p=2 the power equation already says Q=1. These are the L3 orbit-power and Teichmüller targets, not an inference that any root of p-power order is determined by its residue.

**Checks.**

- m=1 gives Q=1; k=0 is handled directly with Γ_p(0)=1 rather than by the positive-fraction formula.
- At p=2, Γ_2(4)=3 whereas Γ_2(0)=1 modulo 4, even though 4≡0 modulo 4. The finite natural-argument product is checked in the suggested file; precisions ell≥3 avoid this exception.
- The distinct roots −1 and 1 have the same image in ZMod 2 and different images in ZMod 4, as proved in the suggested file. A residue-only root argument fails.

See [Gross–Koblitz](#source-48), Theorem 3.1(2) and (3.2), printed pp.575–576, for the odd-prime formula. The all-prime recurrence/Euler proof is the extension specified in DirichletPadicLFunctions §4.6; the printed theorem assumes p odd.

Used by: [Distribution of digit sums and digit factorials](#FF1-digit-product-distribution), [Exact Gamma route to the Hasse–Davenport product](#FF1-hasse-davenport-product-completion).

<a id="contract-F2-R16"></a>

### From PadicDifferentialEquationsAndRigidCohomology:RD.6

Part II extension: the Adolphson–Sperber Euler characteristic degree bound |χ_c(V,Q_ℓ)|≤2^r(r+1+rδ)^N for a closed affine V⊂A^N defined by r equations of degree≤δ, including singular/nonreduced V, with rigid/exponential-sum degree computation and comparison to ℓ-adic Euler characteristic. This contract includes the explicit Newton-polytope degree computation and its comparison theorem.

Used by: [Katz’s smooth affine Betti bound](#FF2-smooth-affine-betti-bound).

<a id="contract-P-R13"></a>

### From SchemeAndStackFoundations:SF.0

For V separated of finite type over F_q: V_F̄ has finitely many irreducible components; each is the base change of a geometrically irreducible closed subscheme of V ⊗ F_{q^{r₀}} for some r₀ ≥ 1; dim V is the maximum of their dimensions; removing the other components leaves a dense open of each component.

Used by: [All-extension point bounds detect dimension (Browning–Sawin Lemma 5.6)](#FF2-dimension-from-point-counts).

<a id="contract-F2-R01"></a>

### From SchemeAndStackFoundations:SF.0

Actual affine coefficient and projective schemes, smooth loci and projective singularity incidence; normalization commuting with étale maps; geometric component and dimension conventions. Extension needed: bounded homogeneous generators after saturation/projective closure in terms of (N,r,δ), and bounded degree/number of exceptional loci in a fixed generic hyperplane pencil. The quantitative elimination bound is part of this contract. Supply the representable Weil restriction Res_{A/F_q}G_m for finite étale A, its splitting over the embeddings of A, trace morphism and descent of the split character data.

Used by: [The universal polynomial with smooth leading form](#FF2-universal-smooth-leading-polynomial-family), [Artin–Schreier local models at infinity](#FF2-polynomial-boundary-local-models), [Katz’s arbitrary affine Betti bound](#FF2-arbitrary-affine-betti-bound), [Albanese–Weil varieties and linear curve sections](#FF2-albanese-linear-section-bound), [Bombieri–Sperber’s Albanese point-count expansion](#FF2-bombieri-sperber-albanese-expansion), [Uniform Lang–Weil over a bounded family](#FF2-uniform-lang-weil-family), [Twists of a geometric component in the Frobenius coset](#FF2-constant-coset-twist-count), [Chebotarev with a constant-field Frobenius coset](#FF2-constant-field-coset-chebotarev), [Gauss cohomology over a finite étale algebra](#FF2-etale-algebra-gauss-cohomology).

<a id="contract-P-R14"></a>

### From SchemeAndStackFoundations:SF.1

Galois twisting over finite fields: for a quasi-projective Y₀ over F_q with a finite group G of F_q-automorphisms and g ∈ G, a variety Y₀^{(g)} over F_q and an isomorphism Y^{(g)} ⊗ F̄ ≅ Y ⊗ F̄ carrying the Frobenius of Y^{(g)} to g⁻¹ ∘ F (effective descent along F̄_q/F_q). Apply the contract separately over F_(q^ν) for each ν≥1, with arithmetic Frobenius g⁻¹F^ν. A fixed twist over F_q instead has ν-th Frobenius g^(−ν)F^ν and does not count this equation. The twists have common geometric cohomology, giving the uniform Betti constant needed for Chebotarev.

Used by: [Chebotarev density for finite étale Galois covers of varieties over F (Ekedahl's form)](#FF2-geometric-chebotarev).

<a id="contract-F2-R02"></a>

### From SchemeAndStackFoundations:SF.1

Effective Galois descent of each quasi-projective component under g⁻¹Frob_q^r, performed separately over F_{q^r}; descent of a finite G-stable generating linear system and its projective embedding, with equation degrees and boundary presentation unchanged by twisting. Use a finite span of generating sections and their G-orbits, not all H⁰ on a quasi-projective scheme.

Used by: [Twists of a geometric component in the Frobenius coset](#FF2-constant-coset-twist-count), [Chebotarev with a constant-field Frobenius coset](#FF2-constant-field-coset-chebotarev).

<a id="contract-P-R06"></a>

### From SchemeAndStackFoundations:SF.2

The Grothendieck–Lefschetz trace formula for E_λ-sheaves (Sommes trig. (1.1.1)), integrating the CohomologicalPointCounting TraceFormula supplier: for X₀ separated of finite type over F_q and a constructible E_λ-sheaf F₀, the H^i_c(X_F̄, F) are finite-dimensional, vanish for i outside [0, 2 dim X₀], and for every ν ≥ 1, Σ_{x∈X₀(F_{q^ν})} Tr(F_x^{*ν} | F_x̄) = Σ_i (−1)^i Tr(F^{*ν} | H^i_c(X_F̄, F)); equivalently L(X₀, F₀, T) = Π_i det(1 − T F* | H^i_c)^{(−1)^{i+1}}. With constant coefficients it counts #X₀(F_{q^ν}).

Used by: [Trace formula for products of Artin–Schreier and Kummer characters (Scholie 1.9)](#FF2-character-sheaf-trace-formula), [H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve), [Deligne's bound for sums of trace functions, with the H²_c main term subtracted](#FF2-deligne-bound-for-trace-functions), [The elementary L-function of a rank-one character sum is det(1 − T·Frob | H¹_c) when it is a polynomial](#FF2-rank-one-sheaf-l-function), [Weil–Deligne bound for additive sums of a rational function on a curve (Sommes trig. (3.5.2))](#FF2-artin-schreier-sum-on-curve-bound), [The one-variable Fourier–Deligne transform FT_ψ](#FF2-fourier-deligne-transform), [Lang–Weil estimate #V(F_{q^r}) = q^{re} + O_V(q^{r(e−1/2)})](#FF2-lang-weil-estimate).

<a id="contract-P-R07"></a>

### From SchemeAndStackFoundations:SF.2

The dictionary between lisse E_λ-sheaves on a connected X₀ and continuous representations of π₁(X₀, x̄) on finite-dimensional E_λ-spaces (Frobenius at a closed point = the Frobenius class), and the push-out ρ(T) of a torsor T under a finite abelian group A along a character ρ : A → E_λ^× as a rank-one lisse sheaf with a nowhere-vanishing map T → ρ(T), ρ(ta) = ρ(a)ρ(t) (Sommes trig. 1.2); for open subsets of A¹_{F_q}, lisse sheaves as unramified representations of Gal(F_q(X)^sep/F_q(X)) (FKMS Definition 3.1).

Used by: [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf), [The Kummer sheaf L_χ(g)](#FF2-kummer-sheaf).

<a id="contract-P-R08"></a>

### From SchemeAndStackFoundations:SF.2

For Rf_! with E_λ-coefficients over F_q or F̄_q: proper base change, the projection formula, the Künneth formula (Sommes trig. (2.4.1)*), H*_c(A¹_F̄, E) = E(−1)[−2], constancy on a connected base of R pr_{1!} pr₂^*F (Sommes trig. Lemme 2.8), Artin vanishing H^i(X, F) = 0 for i > dim X on affine X, and local constancy of R^i f_! for a proper smooth f with relative normal-crossings boundary and tame coefficients (Weil I 8.10).

Used by: [A connected family of endomorphisms acts by one endomorphism on H*_c (Sommes trig. Lemme 2.8)](#FF2-homotopy-invariance-of-endomorphism-action), [Cancellation along a free G_a-orbit direction (Browning–Sawin Lemma 3.2)](#FF2-translation-cancellation), [If H_c → H is an isomorphism on a smooth affine variety, cohomology is concentrated in the middle degree and pure (Sommes trig. 1.19-1.21)](#FF2-affine-concentration-criterion), [H*_c(A^n, L_ψ(Q)) is concentrated in degree n, of dimension (d − 1)^n (Weil I Lemme 8.5(i))](#FF2-deligne-cohomology-of-polynomial-sheaf), [The cup product on H^n_c(A^n, L_ψ(Q)) is a perfect duality; forget-supports is an isomorphism (Weil I Lemme 8.5(ii))](#FF2-deligne-duality-for-polynomial-sheaf), [Fourier–Deligne inversion FT_ψ ∘ FT_ψ ≅ [−1]^*(−1) (Laumon Théorème 1.2.2.1)](#FF2-fourier-deligne-inversion), [The Fourier input of Browning–Sawin Lemma 3.7: H^i_c(G_m × A¹, L_ψ(h f(a))) = 0 for i > 2](#FF2-fourier-input-for-one-modulus), [H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve).

<a id="contract-F2-R03"></a>

### From SchemeAndStackFoundations:SF.2

Genuine étale sites, finite-character torsor pushout and π₁ representations; constructible E-coefficients, compact direct image with base change, projection formula, Künneth (including degree signs), trace formula over every finite extension, excision/Mayer–Vietoris, affine vanishing and proper pushforward of locally acyclic complexes. Supply the specialization/local-monodromy argument of Sommes trig. 7.9–7.12 for R^(k−1)π!, not the invalid implication that constant stalk dimension alone gives lissity.

Used by: [The universal polynomial with smooth leading form](#FF2-universal-smooth-leading-polynomial-family), [Artin–Schreier local models at infinity](#FF2-polynomial-boundary-local-models), [Relative compactification of polynomial Artin–Schreier covers](#FF2-relative-artin-schreier-compactification), [Local acyclicity of the universal polynomial sheaf](#FF2-polynomial-family-local-acyclicity), [Lissity of universal exponential-sum cohomology](#FF2-polynomial-family-lissity), [Ranks and purity in the universal polynomial family](#FF2-polynomial-family-cohomology), [Family transport of polynomial duality](#FF2-polynomial-boundary-clean-duality), [Gauss cohomology over a finite étale algebra](#FF2-etale-algebra-gauss-cohomology), [The relative hyper-Kloosterman sheaf](#FF2-hyper-kloosterman-sheaf), [Cohomology of hyper-Kloosterman fibers](#FF2-hyper-kloosterman-fiber-cohomology), [Local monodromy of hyper-Kloosterman sheaves](#FF2-hyper-kloosterman-local-monodromy), [Katz’s smooth affine Betti bound](#FF2-smooth-affine-betti-bound), [Katz’s arbitrary affine Betti bound](#FF2-arbitrary-affine-betti-bound), [Explicit Betti bounds for projective varieties](#FF2-explicit-projective-betti-bound), [The highest odd weight and the Albanese–Weil spectrum](#FF2-top-weight-albanese-comparison), [Uniform Lang–Weil over a bounded family](#FF2-uniform-lang-weil-family), [Twists of a geometric component in the Frobenius coset](#FF2-constant-coset-twist-count), [The geometric Möbius stabilizer of a sheaf](#FF2-geometric-mobius-stabilizer).

<a id="contract-F2-R05"></a>

### From SchemeAndStackFoundations:SF.3

Part II extension of the smooth-curve contract: normalization genus of a possibly singular integral projective degree-d curve is at most (d−1)(d−2)/2 via generic birational plane projection and arithmetic-genus comparison. The smooth plane-curve genus formula alone does not suffice.

Used by: [Albanese–Weil varieties and linear curve sections](#FF2-albanese-linear-section-bound), [Uniform Lang–Weil over a bounded family](#FF2-uniform-lang-weil-family).

<a id="contract-F2-R04"></a>

### From SchemeAndStackFoundations:SF.4

Part II extension: equivariant resolution of the normalized Artin–Schreier surface models of Weil I 8.8–8.9, with termination, étale/smooth-product compatibility, relative gluing and relative normal-crossings boundary; also resolution of projective normal surfaces for Ghorpade–Lachaud 10.9/11.7. No general resolution in positive-characteristic dimensions≥3 is requested or assumed.

Used by: [Relative compactification of polynomial Artin–Schreier covers](#FF2-relative-artin-schreier-compactification), [Bombieri–Sperber’s Albanese point-count expansion](#FF2-bombieri-sperber-albanese-expansion).

<a id="contract-P-R12"></a>

### From WeilConjectures:WC.0

For X₀ separated of finite type over F_q and a finite extension L/F_q, #X₀(L) is finite and depends only on [L:F_q] (canonical translation between point sets over isomorphic extensions).

Used by: [Lang–Weil estimate #V(F_{q^r}) = q^{re} + O_V(q^{r(e−1/2)})](#FF2-lang-weil-estimate).

<a id="contract-P-R01"></a>

### From WeilConjectures:WC.3

The Riemann hypothesis for curves in its all-conjugates form: for a smooth projective geometrically connected curve C over F_q of genus g (in particular the curve attached, through the function-field/curve dictionary, to a one-variable function field over F_q with exact constant field F_q), Z(C, T) = P₁(T)/((1 − T)(1 − qT)) with P₁ ∈ ℤ[T] of degree 2g and P₁(0) = 1, and every reciprocal root α of P₁, counted with multiplicity, is an algebraic integer with |ι(α)| = q^{1/2} for every field embedding ι : ℚ̄ → ℂ. Layer 2 uses it only for the Artin–Schreier and Kummer curves y^q − y = f(x), y^d = g(x). In particular, for every r ≥ 1 this gives |#C(F_(q^r)) − (q^r + 1)| ≤ 2g q^(r/2), by summing the 2g reciprocal roots. Layer 3 imports this curve statement; affine-model counts still need their explicit projective-boundary comparison. For general geometrically irreducible varieties use [Lang–Weil estimate #V(F_{q^r}) = q^{re} + O_V(q^{r(e−1/2)})](#FF2-lang-weil-estimate) with its geometric compact-support Betti constant, not the genus coefficient 2g.

Used by: [Weil: L(f, ψ; T) has degree d − 1 and its reciprocal roots are q-Weil numbers of weight 1](#FF2-additive-l-function-purity), [Weil: for g squarefree with gcd(deg g, ord χ) = 1, Z(g, χ; T) has degree m − 1 and reciprocal roots of weight 1](#FF2-multiplicative-l-function-purity), [The Weil error bound for y² = f(x)](#FF3-weil-error-bound-for-hyperelliptic-counts).

<a id="contract-F3-R04"></a>

### From WeilConjectures:WC.5

For every smooth projective geometrically connected curve C/F_q of genus g and r≥1, |#C(F_{q^r})−(q^r+1)|≤2g q^{r/2}; for a smooth projective geometrically connected variety of dimension d>0, |N_r−(1+q^{dr})|≤Σ_{i=1}^{2d−1} b_i q^{ir/2}. Dimension zero is handled separately. Export the actual rational-point/cohomology comparison and geometric Frobenius sign convention. This is the supplier contract for a general point-count certificate, not a theorem inferred from the elliptic Hasse bound or an affine hyperelliptic sum. Scope this request to the general point-bound component proposed below. The existing elliptic root-table certificate uses the existing elliptic count and Hasse bound, and the affine hyperelliptic estimate uses Layer 2; neither acquires a compulsory WC.5 prerequisite from this request.

Used by: `Layer 3`.

<a id="contract-P-R02"></a>

### From WeilConjectures:WC.5:power-sum-converse

The finite-spectrum lemma: for finitely many complex numbers ω₁, …, ω_δ (with multiplicity) and constants A ≥ 0, B > 0, if |ω₁^ν + ⋯ + ω_δ^ν| ≤ A·B^ν for every integer ν ≥ 1, then |ω_j| ≤ B for every j (Kowalski, Lemma 4.15). No hypothesis of purity or rationality.

Used by: [Every reciprocal root of L(f, ψ; T) has absolute value at most √q (elementary proof)](#FF2-additive-l-function-root-bound), [Every reciprocal root of Z(g, χ; T) has absolute value at most √q when gcd(deg g, ord χ) = 1 (elementary proof)](#FF2-multiplicative-l-function-root-bound-coprime).

<a id="contract-F2-R18"></a>

### From WeilConjectures:WC.5:power-sum-converse

Import the finite-spectrum power-sum estimate stated above; extend its proof explicitly to a finite signed sum Σc_jλ_j^r, c_j∈ℤ, by grouping equal roots and using exponential-sequence independence. If it is O(B^r) for every r, all nonzero coefficients on roots of modulus>B vanish. Used with B=q^(n−1) and candidate roots of modulus q^(n−1/2).

Used by: [The highest odd weight and the Albanese–Weil spectrum](#FF2-top-weight-albanese-comparison).

<a id="contract-P-R25"></a>

### From AlgebraicCodingTheory

The linear-code carrier TauCeti.LinearCode F ι = Submodule F (ι → F) for an arbitrary finite coordinate type, with generator matrices (Matrix.generatedBy, the row space of G.vecMulLinear) and existence of generator matrices from bases; both are used through their native library declarations.

Used by: [Reed–Solomon codes](#FF4-reed-solomon-code), [The Singleton bound for linear codes](#FF4-singleton-bound).

<a id="contract-P-R26"></a>

### From AlgebraicCodingTheory

The minimum distance d(C) of a linear code with the zero-code convention d(⊥) = 0 and, for C ≠ ⊥, equality with the least weight of a nonzero codeword (hammingNorm); and the Euclidean dual C^⊥ := LinearMap.BilinForm.orthogonal (dotProductBilin F F) C with dim C + dim C^⊥ = #ι and C^⊥⊥ = C. Layer 4 states MDS and duality with these conventions.

Used by: [The dual of a GRS code is a GRS code](#FF4-dual-of-generalized-reed-solomon), [Maximum distance separable (MDS) codes](#FF4-mds-code), [Duality of evaluation and residue codes](#FF4-residue-code-is-dual).

<a id="contract-P-R16"></a>

### From AlgebraicCurves

Artin–Schreier covers y^p − y = u and their elementary abelian generalisation y^q − y = u (Stichtenoth 3.7.8, 3.7.10), and Kummer covers y^n = u (3.7.3), with the stated hypotheses: exact constant field, ramification indices, different exponents (p − 1)(m_P + 1) (resp. n/r_P − 1) and the closed genus formulas; applied to u = f ∈ F_q[X] with a single pole of order d prime to p (genus (q − 1)(d − 1)/2) and to squarefree g with gcd(n, deg g) = 1 (genus (n − 1)(deg g − 1)/2).

Used by: [The Artin–Schreier function field F(X)[Y]/(Y^q − Y − f)](#existing-boundaries), [The Kummer function field F(X)[Y]/(Y^d − g)](#existing-boundaries), [Degree-one places of E_f over F_{q^ν}: affine solutions plus one](#FF2-artin-schreier-curve-point-count), [The numerator of the zeta function of y^q − y = f(x) is Π_{a≠0} L(af, ψ; T)](#FF2-artin-schreier-zeta-factorization), [The numerator of the zeta function of y^d = g(x) is Π_{χ≠1, χ^d=1} Z(g, χ; T)](#FF2-kummer-zeta-factorization), [Sw_x(L(ψf)) = v*_x(f) (Sommes trig. (3.5.4))](#FF2-swan-conductor-of-artin-schreier-sheaf), [Degree-one places of E_g over F_{q^ν}: affine solutions of y^d = g(x) plus one](#FF2-kummer-curve-point-count).

<a id="contract-F4-R01"></a>

### From AlgebraicCurves

Provide the native Hermitian function field H/K for |K|=p², y^p+y=x^(p+1), IsFunctionField K H and exact constants IsIntegrallyClosedIn K H; a unique degree-one place P∞ with pole orders p and p+1 for x,y; affine regular-function coordinate ring free on 1,x,…,x^p over K[y]; an equivalence between the p³ affine points and all remaining degree-one places compatible with residues; genus p(p−1)/2. This specialized model and its place comparisons are an AlgebraicCurves, Part II extension.

Used by: [Hermitian code and a native Riemann–Roch space](#FF4-hermitian-riemann-roch-comparison), [Hermitian code dimension and designed distance](#FF4-hermitian-code-parameters).

<a id="contract-P-R19"></a>

### From AlgebraicCurves

The dictionary between one-variable function fields over F_q with exact constant field and smooth projective geometrically connected curves over F_q, matching degree-one places with rational points and constant field extensions with base change, so that WeilConjectures:WC.3 applies to the function fields E_f and E_g.

Used by: [The Artin–Schreier function field F(X)[Y]/(Y^q − Y − f)](#existing-boundaries), [The Kummer function field F(X)[Y]/(Y^d − g)](#existing-boundaries).

<a id="contract-P-R18"></a>

### From AlgebraicCurves

Affine models: for a regular affine model F[X, Y]/(P(Y) − g(X)) (P monic in Y), this ring is the integral closure of F[X] in the function field, and its maximal ideals with residue field F correspond bijectively to the places of degree one over finite points of the X-line.

Used by: [Degree-one places of E_f over F_{q^ν}: affine solutions plus one](#FF2-artin-schreier-curve-point-count), [The numerator of the zeta function of y^d = g(x) is Π_{χ≠1, χ^d=1} Z(g, χ; T)](#FF2-kummer-zeta-factorization), [Degree-one places of E_g over F_{q^ν}: affine solutions of y^d = g(x) plus one](#FF2-kummer-curve-point-count).

<a id="contract-P-R27"></a>

### From AlgebraicCurves

Places of a function field F/k with degrees, the residue field of a rational place identified with k (TauCeti.Place.residueFieldEquivOfDegreeEqOne), divisors with degree, the Riemann–Roch spaces L(D) with ℓ(D), L(D) = 0 for deg D < 0, the genus with Riemann's inequality ℓ(D) ≥ deg D + 1 − g, and L(n·P∞) in k(x) = polynomials of degree ≤ n; all used through their native library declarations.

Used by: [Dimension of algebraic geometry codes](#FF4-ag-code-dimension), [Algebraic geometry evaluation codes C_L(D, G)](#FF4-algebraic-geometry-evaluation-code), [Evaluation of functions at a rational place](#FF4-evaluation-at-rational-place), [The Goppa bound d ≥ n − deg G](#FF4-goppa-bound), [Reed–Solomon codes are the AG codes of the rational function field](#FF4-reed-solomon-as-ag-code).

<a id="contract-P-R28"></a>

### From AlgebraicCurves

Weil differentials Ω_F(D) (TauCeti.weilDifferentialFiltration) with dim_k Ω_F(D) = i(D) and the Riemann–Roch theorem (TauCeti.exists_isRiemannRochDivisor), for function fields with exact constant field; supplied by the native function-field API.

Used by: [Algebraic geometry residue codes C_Ω(D, G)](#FF4-algebraic-geometry-residue-code), [Duality of evaluation and residue codes](#FF4-residue-code-is-dual).

<a id="contract-P-R29"></a>

### From AlgebraicCurves

Local components ω_P of Weil differentials, the abstract residue theorem ∑ᶠ_P ω_P(x) = 0, the characterisation of Ω_F(D) by vanishing of local components, and the regime deg D ≥ 2g − 1 (ℓ(D) = deg D + 1 − g, i(D) = 0); supplied by the native function-field API.

Used by: [Dimension of algebraic geometry codes](#FF4-ag-code-dimension), [Algebraic geometry residue codes C_Ω(D, G)](#FF4-algebraic-geometry-residue-code), [Duality of evaluation and residue codes](#FF4-residue-code-is-dual).

<a id="contract-P-R17"></a>

### From AlgebraicCurves

Constant field extensions: for E/F_q with exact constant field, E·F_{q^ν} has exact constant field F_{q^ν} and the same genus, and places of degree one stay of degree one; totally ramified places of degree one over F_q(X) stay so.

Used by: [The Artin–Schreier function field F(X)[Y]/(Y^q − Y − f)](#existing-boundaries), [The Kummer function field F(X)[Y]/(Y^d − g)](#existing-boundaries), [Degree-one places of E_f over F_{q^ν}: affine solutions plus one](#FF2-artin-schreier-curve-point-count), [The numerator of the zeta function of y^d = g(x) is Π_{χ≠1, χ^d=1} Z(g, χ; T)](#FF2-kummer-zeta-factorization), [Degree-one places of E_g over F_{q^ν}: affine solutions of y^d = g(x) plus one](#FF2-kummer-curve-point-count).

<a id="contract-F2-R19"></a>

### From AlgebraicCurves

Import the existing arbitrary-residue lower ramification/completion bridge as its document states. Do not import its explicitly excluded upper-numbering theorem for infinite residue fields. Layer 2’s direct cyclic calculation and the separate AGR conductor extension supply that missing geometric case.

Used by: [Artin–Schreier breaks over geometric local fields](#FF2-geometric-artin-schreier-break).

<a id="contract-P-R24"></a>

### From EllipticCurves

For W elliptic over a field k, K ⊇ k algebraically closed and n with (n : K) ≠ 0: Nat.card {P : (W.baseChange K).toAffine.Point // (n : ℤ) • P = 0} = n², the cardinality consequence of layer 2's torsion_addEquiv_prod (E[n] ≃+ (ZMod n)²). Layer 3 uses it for n = ℓ an odd prime to show that the ℓ-division polynomial is separable (completeness of Schoof's algorithm).

Used by: [The ℓ-division polynomial is separable for ℓ ∤ q](#FF3-separability-of-division-polynomials), [Correctness of Schoof's algorithm](#FF3-schoof-algorithm-correct).

<a id="contract-P-R23"></a>

### From EllipticCurves

For W : WeierstrassCurve F elliptic over a finite field F with q elements: (a) the Hasse bound hasse_bound, (frobeniusTrace W)² ≤ 4q, with Tau Ceti's frobeniusTrace = q + 1 − pointCount; (b) the Frobenius relation on points: for every algebraically closed field K ⊇ F and every P ∈ (W.baseChange K).toAffine.Point, π(π P) − (frobeniusTrace W) • π P + q • P = 0 with π = WeierstrassCurve.Affine.Point.map (FiniteField.frobeniusAlgHom F K), i.e. the point-level form of layer 3's π_q² − [a_q]π_q + [q] = 0 through the layer-0 dictionary that π_q acts on points by (x, y) ↦ (x^q, y^q). Layer 3 imports both and does not reprove them.

Used by: [The Hasse error bound for certified counts](#existing-boundaries), [Soundness of Algorithm 8.3](#FF3-schoof-trace-modulo-prime-sound), [Completeness of Algorithm 8.3](#FF3-schoof-trace-modulo-prime-complete), [Correctness of Schoof's algorithm](#FF3-schoof-algorithm-correct).

<a id="contract-P-R20"></a>

### From LocalFieldsRamification

Use the supplier’s lower/upper ramification filtration and cyclic prime-degree break calculation only for complete nonarchimedean local fields with finite residue field. AlgebraicCurves Layer 8 explicitly excludes importing its upper-numbering supplier for arbitrary residue fields. The needed F̄_q((t)) case requires a separately proved unramified-base-change bridge or a general complete-DVR conductor calculation; as specified in the geometric conductor contract above.

Used by: [Sw_x(L(ψf)) = v*_x(f) (Sommes trig. (3.5.4))](#FF2-swan-conductor-of-artin-schreier-sheaf).

## How to read the build

Layer 0 establishes explicit algebra and the polynomial census. Layer 1 fixes the character conventions and proves lifting, Fourier and ideal-factorisation identities. Layer 2 develops the elementary L-polynomial route and the geometric character-sheaf route to estimates. Layer 3 builds certified algorithms, with elementary correctness preceding probabilistic cost and point-count bounds. Layer 4 develops finite rings, sequence families, specialised codes and finite-plane spectra. Layer 5 applies the estimates and certificates to arithmetic and exact finite-field protocols. Every definition below has a named interface and discriminating checks; every target specifies its hypotheses, sources and mathematical dependencies.

<a id="FF0"></a>

## Layer 0: Finite-field constructions

Construct explicit presentations, the intermediate-field/divisor correspondence, the elementary polynomial census and the shared linearized core on top of the existing finite-field classification. Rabin checks feed presentation certificates and Layer 3 factorization certificates. Tensor-product comparisons and normal-element criteria provide explicit coordinates without replanning the existing normal-basis existence theorem.

### 0.1 Frobenius residues and Rabin's irreducibility test

<a id="FF0-frobenius-power-residue"></a>

#### The Frobenius power residue X^(q^k) mod f

Let F be a finite field with q elements and f ∈ F[X] monic. The k-th Frobenius power residue of f is the polynomial frobResidue f k ∈ F[X] defined by frobResidue f 0 = X mod f and frobResidue f (k+1) = (frobResidue f k)^q mod f, where 'mod f' is Mathlib's remainder by a monic divisor (Polynomial.modByMonic, written %ₘ). It is the remainder of X^(q^k) on division by f, it has degree < deg f when deg f ≥ 1, and its class in F[X]/(f) is the q^k-th power of the class of X. Its role is computational: X^(q^k) has degree q^k, while frobResidue f k is obtained by k successive q-th powers modulo f and has degree < deg f.

The hypotheses are as follows. F is a finite field (Fintype F), q = Fintype.card F. f is monic; for f = 1 every residue is 0, for f = X every residue is 0. The recursion takes the q-th power of a polynomial of degree < deg f and reduces it modulo f; the cost per step is O(log q) multiplications modulo f (repeated squaring), Shoup Theorem 20.1.

A proof proceeds as follows. Define frobResidue f by recursion on k, using Polynomial.modByMonic. Congruence with the literal power: a %ₘ f ≡ a (mod f) (Polynomial.modByMonic_add_div), so by induction frobResidue f k ≡ X^(q^k) (mod f); both frobResidue f k and X^(q^k) %ₘ f are remainders of degree < deg f (Polynomial.natDegree_modByMonic_lt) of the same class, hence equal (uniqueness of the remainder, Polynomial.modByMonic_eq_zero_iff_dvd applied to their difference). Class in the quotient: AdjoinRoot.mk f (frobResidue f k) = AdjoinRoot.mk f (X^(q^k)) = (AdjoinRoot.root f)^(q^k) (AdjoinRoot.mk_eq_mk, AdjoinRoot.aeval_eq). Reduction lemma (Shoup §20.1, p. 523): since frobResidue f k − X ≡ X^(q^k) − X (mod f), the two polynomials have the same common divisors with f; hence IsCoprime (frobResidue f k − X) f ↔ IsCoprime (X^(q^k) − X) f and f ∣ frobResidue f k − X ↔ f ∣ X^(q^k) − X. Composition rule (Shoup, Exercise 20.1(b)): in F[X]/(f) the q-power map is an F-algebra endomorphism (FiniteField.frobeniusAlgHom), so root^(q^(k+l)) = σ^k(σ^l(root)) = σ^k(h_l(root)) = h_l(σ^k(root)) = h_l(h_k(root)); therefore frobResidue f (k+l) = (frobResidue f l).comp (frobResidue f k) %ₘ f. For f monic irreducible of degree n, n ∣ n gives f ∣ X^(q^n) − X (Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X), i.e. frobResidue f n = X %ₘ f.

Provide the following interface.

- `frobResidue`: frobResidue f k ∈ F[X], defined by frobResidue f 0 = X %ₘ f and frobResidue f (k+1) = (frobResidue f k)^q %ₘ f.
- `frobResidue_zero`: frobResidue f 0 = X %ₘ f.
- `frobResidue_succ`: frobResidue f (k+1) = (frobResidue f k)^q %ₘ f.
- `frobResidue_eq_modByMonic`: For monic f: frobResidue f k = X^(q^k) %ₘ f.
- `natDegree_frobResidue_lt`: For monic f ≠ 1: natDegree (frobResidue f k) < natDegree f.
- `mk_frobResidue`: AdjoinRoot.mk f (frobResidue f k) = (AdjoinRoot.root f)^(q^k).
- `isCoprime_frobResidue_sub_X_iff`: IsCoprime (frobResidue f k − X) f ↔ IsCoprime (X^(q^k) − X) f.
- `dvd_frobResidue_sub_X_iff`: f ∣ frobResidue f k − X ↔ f ∣ X^(q^k) − X.
- `frobResidue_add`: frobResidue f (k + l) = (frobResidue f l).comp (frobResidue f k) %ₘ f (Shoup, Exercise 20.1(b)).

**Checks.**

- `test_frobResidue_F2_quadratic`: Over ZMod 2: frobResidue (X^2 + X + 1) 1 = X + 1.
- `test_frobResidue_F2_quadratic_two`: Over ZMod 2: frobResidue (X^2 + X + 1) 2 = X.
- `test_frobResidue_modulus_X`: For every k: frobResidue X k = 0.
- `test_frobResidue_ne_pow`: Over ZMod 2: frobResidue (X^2 + X + 1) 1 ≠ X^2; a definition returning the literal power X^(q^k) fails.
- `test_frobResidue_irreducible`: For f monic irreducible: frobResidue f (natDegree f) = X %ₘ f (Mathlib's Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X).


In particular, verify the following values and consequences.

- Over F_2 with f = X^2 + X + 1: frobResidue f 1 = X + 1 and frobResidue f 2 = X (recomputed: X^2 ≡ X + 1 and X^4 ≡ X modulo f).
- For f monic irreducible of degree n, frobResidue f n = X %ₘ f.
- Modulo f = X every residue is 0.

*Needs:* `Polynomial.modByMonic`, `Polynomial.modByMonic_add_div`, `Polynomial.modByMonic_eq_zero_iff_dvd`, `Polynomial.natDegree_modByMonic_lt`, `AdjoinRoot.mk_eq_mk`, `AdjoinRoot.aeval_eq`, `FiniteField.frobeniusAlgHom`, `Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X`, `IsCoprime`.

See [Shoup](#source-1) — §20.1, discussion before Algorithm IPT, printed p. 523; [Shoup](#source-1) — Exercise 20.1(b), printed p. 524.

<a id="FF0-rabin-irreducibility-criterion"></a>

#### Rabin's irreducibility criterion

Let F be a finite field with q elements and f ∈ F[X] monic of degree n > 0. Then f is irreducible if and only if (i) X^(q^n) ≡ X (mod f), and (ii) gcd(X^(q^(n/s)) − X, f) = 1 (IsCoprime (X^(q^(n/s)) − X) f) for every prime s dividing n. Equivalently, on residues: frobResidue f n = X %ₘ f and IsCoprime (frobResidue f (n/s) − X) f for every prime s ∣ n.

The hypotheses are as follows. F is a finite field with q elements; f is monic with n = natDegree f > 0. n > 0 is necessary: for f = 1 (n = 0) condition (i) holds and (ii) holds vacuously for every s (all primes divide 0 but gcd(·, 1) = 1), yet 1 is not irreducible. No squarefreeness hypothesis: (i) alone forces every irreducible factor to have degree dividing n, and (ii) excludes proper divisors.

A proof proceeds as follows. (⇒) Let f be irreducible of degree n. Since n ∣ n, f ∣ X^(q^n) − X (Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X). (⇒) Let s ∣ n be prime. If f and X^(q^(n/s)) − X were not coprime, then f ∣ X^(q^(n/s)) − X (an irreducible element is coprime to every element it does not divide: Irreducible.coprime_iff_not_dvd), so n ∣ n/s by the same lemma, impossible as 0 < n/s < n. (⇐) Let g be an irreducible factor of f (Polynomial.exists_irreducible_of_degree_pos, since n > 0). By (i), g ∣ X^(q^n) − X, so k := natDegree g divides n (Irreducible.natDegree_dvd_of_dvd_X_pow_card_pow_sub_X). (⇐) If k < n, then n/k > 1 has a prime factor s (Nat.exists_prime_and_dvd); s ∣ n and k ∣ n/s, so g ∣ X^(q^(n/s)) − X (Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X). Then g is a non-unit common divisor of f and X^(q^(n/s)) − X, contradicting (ii). (⇐) Hence every irreducible factor of f has degree n = natDegree f; a monic polynomial all of whose irreducible factors have its own degree is an associate of each of them, hence irreducible (Polynomial.Monic.irreducible_iff_natDegree: in any factorisation f = a·b into monic factors one factor has degree 0). Residue form: replace X^(q^k) by frobResidue f k using [The Frobenius power residue X^(q^k) mod f](#FF0-frobenius-power-residue) (dvd_frobResidue_sub_X_iff, isCoprime_frobResidue_sub_X_iff).

In particular, verify the following values and consequences.

- Over F_2, f = X^2 + X + 1 (n = 2, s = 2): X^2 − X ≡ 1 (mod f) is coprime to f and X^4 ≡ X (mod f), so f is irreducible.
- Over F_2, f = (X^2 + X + 1)^2: condition (i) fails, since X^16 − X is squarefree (its derivative is −1) and cannot be divisible by a square; the criterion correctly rejects f.
- Over F_2, f = (X^2 + X + 1)(X^3 + X + 1) of degree 5: condition (ii) holds (X^2 − X = X(X+1) and f has no root in F_2), but (i) fails because X^2 + X + 1 ∤ X^32 − X (2 ∤ 5); (ii) alone does not certify irreducibility.
- Over F_p, X^4 + 1 fails the criterion for every prime p (it is reducible over every prime field: Shoup, Exercise 19.13).

*Needs:* `Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X`, `Irreducible.natDegree_dvd_of_dvd_X_pow_card_pow_sub_X`, `Irreducible.coprime_iff_not_dvd`, `Polynomial.exists_irreducible_of_degree_pos`, `Nat.exists_prime_and_dvd`, `Polynomial.Monic.irreducible_iff_natDegree`, `IsCoprime`, [The Frobenius power residue X^(q^k) mod f](#FF0-frobenius-power-residue).

See [Shoup](#source-1) — Exercise 20.2(a), printed p. 524; [Shoup](#source-1) — Theorem 19.10, printed p. 513; [Conrad, Finite fields](#source-2) — Theorem 3.3, p. 6.

<a id="FF0-rabin-irreducibility-certificate"></a>

#### Rabin irreducibility certificates and their checker

Let F be a finite field with decidable equality and f ∈ F[X]. A Rabin certificate for f is a family of Bézout pairs (u_s, v_s) ∈ F[X]^2 indexed by the primes s dividing n = natDegree f (a function ℕ → F[X] × F[X] whose values off the prime factors of n are ignored). The checker check f c : Bool returns true exactly when (a) f is monic, (b) n > 0, (c) frobResidue f n = X %ₘ f, and (d) for every prime s ∈ n.primeFactors, u_s·(frobResidue f (n/s) − X) + v_s·f = 1. Soundness: check f c = true implies Irreducible f. Completeness: if f is monic and irreducible then the certificate ofIrreducible f, whose pairs are the extended-Euclid cofactors (EuclideanDomain.gcdA, EuclideanDomain.gcdB) of a = frobResidue f (n/s) − X and f, each multiplied by C((leadingCoeff (EuclideanDomain.gcd a f))⁻¹), is accepted. Coprimality makes this raw gcd a nonzero constant, so this common factor normalizes the Bézout identity to 1; raw cofactors alone need not pass the checker. The checker is Bool-valued through decidability of equality in F[X]; an executable refinement on dense coefficient arrays, with bit costs, is ComputationalNumberTheory:CN.0's.

The hypotheses are as follows. F is a finite field with DecidableEq F, so equality in F[X] is decidable (Mathlib's instance for polynomials). The certificate carries only the Bézout data; the Frobenius residues are recomputed by the checker, which performs ω(n) + 1 residue computations (Shoup, Exercise 20.2(b)). Coprimality is certified by an explicit Bézout identity u·a + v·f = 1, the definition of IsCoprime.

A proof proceeds as follows. check_iff: unfold decide on the conjunction; f.Monic is leadingCoeff f = 1. Soundness: (d) gives IsCoprime (frobResidue f (n/s) − X) f for each prime s ∣ n (definition of IsCoprime), (c) gives f ∣ frobResidue f n − X, i.e. X^(q^n) ≡ X (mod f); [Rabin's irreducibility criterion](#FF0-rabin-irreducibility-criterion) (residue form) then gives Irreducible f. Completeness: for f monic irreducible, the criterion gives (c) and coprimality of frobResidue f (n/s) − X with f for every prime s ∣ n; over a Euclidean domain gcd(a, f) = 1 up to units, and gcdA·a + gcdB·f = gcd (EuclideanDomain.gcd_eq_gcd_ab); normalising the gcd to 1 (it is a unit, a nonzero constant, so multiply both cofactors by its inverse) gives accepted pairs. Rejections: if f is not irreducible, no certificate is accepted (contrapositive of soundness); if deg f = 0, check is false by (b).

Provide the following interface.

- `RabinCertificate`: The structure holding the Bézout pairs bezout : ℕ → F[X] × F[X] for a fixed f.
- `RabinCertificate.check`: The Bool checker: decide (f monic ∧ 0 < natDegree f ∧ frobResidue f n = X %ₘ f ∧ ∀ s ∈ n.primeFactors, u_s(frobResidue f (n/s) − X) + v_s f = 1).
- `RabinCertificate.check_iff`: check = true ↔ the four conditions (a)–(d).
- `RabinCertificate.irreducible_of_check`: Soundness: check = true → Irreducible f.
- `RabinCertificate.ofIrreducible`: The canonical certificate: extended-Euclid cofactors of a = frobResidue f (n/s) − X and f, both multiplied by C((leadingCoeff (EuclideanDomain.gcd a f))⁻¹). For coprime a and f the raw gcd is a nonzero constant and the normalized identity equals 1.
- `RabinCertificate.check_ofIrreducible`: For f monic irreducible, (ofIrreducible f).check = true.
- `RabinCertificate.exists_check_of_irreducible`: Completeness: f monic irreducible → ∃ c, c.check = true.

**Checks.**

- `test_rabinCertificate_F2_quadratic`: Over ZMod 2, the certificate with pairs (1, 0) for f = X^2 + X + 1 is accepted.
- `test_rabinCertificate_constant`: For f = 1 every certificate is rejected (natDegree 1 = 0).
- `test_rabinCertificate_square_rejected`: For f = (X^2 + X + 1)^2 over ZMod 2 every certificate is rejected: condition (c) fails.
- `test_rabinCertificate_product_rejected`: For f = (X^2 + X + 1)(X^3 + X + 1) over ZMod 2, X^2 − X is coprime to f (the check at s = 5 can be passed) and still every certificate is rejected, because (c) fails.
- `test_rabinCertificate_compat`: For f monic irreducible, (RabinCertificate.ofIrreducible f).check = true.
- `test_rabinCertificate_F5_normalization`: For f = X^2 − 2 over ZMod 5, the canonical normalized certificate is accepted. Here f is monic irreducible and frobResidue f 1 = 4X, so a = 3X and EuclideanDomain.gcd a f = C 3. The raw Bézout identity is 3 ≠ 1; multiplying both cofactors by C(3⁻¹) makes it 1. This tests a nontrivial unit, which the F2 example cannot detect.


In particular, verify the following values and consequences.

- X^2 + X + 1 over F_2 with pairs (1, 0) at s = 2 is accepted: frobResidue f 1 − X = 1.
- The polynomial (X^2 + X + 1)(X^3 + X + 1) over F_2 passes the Bézout part at s = 5 but every certificate is rejected by check (c).
- Soundness and completeness together: for monic f, (∃ c, check f c = true) ↔ Irreducible f ∧ 0 < natDegree f.

*Needs:* [Rabin's irreducibility criterion](#FF0-rabin-irreducibility-criterion), [The Frobenius power residue X^(q^k) mod f](#FF0-frobenius-power-residue), `EuclideanDomain.gcd`, `EuclideanDomain.gcdA`, `EuclideanDomain.gcd_eq_gcd_ab`, `IsCoprime`, `Polynomial.Monic`, `Irreducible`.

See [Shoup](#source-1) — Exercise 20.2(a)–(b), printed pp. 524–525; [Shoup](#source-1) — §20 introduction, printed p. 522.

### 0.2 Certified presentations and comparison maps

<a id="FF0-certified-presentation-of-a-finite-field"></a>

#### Certified presentation of a finite field

Let F be a finite field with decidable equality and K a field that is an F-algebra. A certified presentation P of K over F consists of a polynomial f = P.poly ∈ F[X] with an accepted Rabin certificate ([Rabin irreducibility certificates and their checker](#FF0-rabin-irreducibility-certificate)), an element α = P.root ∈ K with f(α) = 0, and the equality finrank F K = natDegree f. From P one constructs the F-algebra isomorphism P.equiv : F[X]/(f) ≃ₐ[F] K sending the class of X to α, whose inverse sends x ∈ K to the class of Σ_{i<n} c_i X^i, where (c_i) are the coordinates of x in the power basis 1, α, …, α^(n−1) (P.powerBasis). Every finite field K of finite degree over F has a certified presentation. Relative presentations are allowed (F any finite field, not only a prime field), so a tower F ⊆ E ⊆ K is presented by presenting E over F and K over E; the prime field itself is Mathlib's ZMod p.

The hypotheses are as follows. F is a finite field with DecidableEq F; K is a field with Algebra F K (finite over F by finrank_eq). The certificate is part of the data; irreducibility of f is derived from it, never assumed. Pinned convention: the isomorphism goes from the quotient F[X]/(f) = AdjoinRoot f to K and sends root f to α; its inverse is given by power-basis coordinates, not by a choice.

A proof proceeds as follows. f is irreducible by soundness of the certificate (RabinCertificate.irreducible_of_check); f is monic by check_iff. α has minimal polynomial f: f is monic, irreducible and vanishes at α (minpoly.eq_of_irreducible_of_monic). Hence F(α) has degree natDegree f = finrank F K and equals K, so α generates K and PowerBasis.ofAdjoinEqTop gives the power basis 1, α, …, α^(n−1). AdjoinRoot.equiv' with this power basis gives the F-algebra isomorphism AdjoinRoot f ≃ₐ[F] K; its forward map is AdjoinRoot.liftAlgHom (root ↦ α) and its inverse is PowerBasis.lift (α ↦ root f), both of which are explicit; equiv_symm_apply is the coordinate formula for the inverse (PowerBasis.lift applied to Σ c_i α^i). Frobenius in the presentation: α^q = aeval α (frobResidue f 1) because frobResidue f 1 ≡ X^q (mod f) ([The Frobenius power residue X^(q^k) mod f](#FF0-frobenius-power-residue)) and f(α) = 0. Trace and norm of the generator: Tr_{K/F}(α) = −nextCoeff f (PowerBasis.trace_gen_eq_nextCoeff_minpoly) and N_{K/F}(α) = (−1)^n f(0) (Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly). Existence: K is finite over F, so it has a primitive element α (Field.exists_primitive_element; a generator of Kˣ works); take f = minpoly F α, which is monic irreducible of degree finrank F K, and the certificate RabinCertificate.ofIrreducible f. Comparison with the library: Mathlib's FiniteField.algEquivOfCardEq and GaloisField.algEquivGaloisField give isomorphisms by existence only; P.equiv composed with them identifies F[X]/(f) with GaloisField, and two presentations with the same f and roots α, α^(q^i) differ by the Frobenius power ([Embeddings between presented finite fields from root certificates](#FF0-presentation-embedding-from-root), roots_eq_frobenius_orbit).

Provide the following interface.

- `CertifiedPresentation`: The structure: poly, cert, cert_check, root, aeval_root, finrank_eq.
- `CertifiedPresentation.monic`: P.poly is monic.
- `CertifiedPresentation.irreducible`: P.poly is irreducible (from the certificate).
- `CertifiedPresentation.minpoly_root`: minpoly F P.root = P.poly.
- `CertifiedPresentation.powerBasis`: The power basis 1, α, …, α^(n−1) of K over F.
- `CertifiedPresentation.equiv`: The F-algebra isomorphism AdjoinRoot P.poly ≃ₐ[F] K, root ↦ α.
- `CertifiedPresentation.equiv_root`: P.equiv (AdjoinRoot.root P.poly) = P.root.
- `CertifiedPresentation.equiv_symm_apply`: P.equiv.symm x = mk (Σ_i C (repr x i) X^i), the coordinate formula for the inverse.
- `CertifiedPresentation.card`: #K = q^(natDegree P.poly).
- `CertifiedPresentation.root_pow_card`: α^q = aeval α (frobResidue P.poly 1): the Frobenius of the generator is the first residue.
- `CertifiedPresentation.trace_root`: Tr_{K/F}(α) = −nextCoeff P.poly.
- `CertifiedPresentation.norm_root`: N_{K/F}(α) = (−1)^n · (P.poly).coeff 0.
- `CertifiedPresentation.exists_presentation`: Every finite field extension K of F has a certified presentation.

**Checks.**

- `test_certifiedPresentation_F4`: For a presentation P of GaloisField 2 2 over ZMod 2 with P.poly = X^2 + X + 1: P.equiv (mk (X + 1)) = P.root + 1.
- `test_certifiedPresentation_degree_one`: For a presentation P of F over itself (natDegree P.poly = 1): P.equiv.symm x = mk (C x).
- `test_certifiedPresentation_card`: A presentation of GaloisField p n over ZMod p (n ≠ 0) has natDegree P.poly = n, matching GaloisField.card.
- `test_certifiedPresentation_X4_plus_1`: Over ZMod p, every Rabin certificate for X^4 + 1 is rejected, so X^4 + 1 is the polynomial of no certified presentation.
- `test_certifiedPresentation_minpoly`: minpoly F P.root = P.poly: the root generates K.


In particular, verify the following values and consequences.

- F_4 presented over F_2 by X^2 + X + 1: equiv (mk (X + 1)) = α + 1, and equiv.symm (α + 1) = mk (X + 1).
- Conrad, Examples 1.2–1.3: F_2[x]/(x^3 + x + 1) and F_2[x]/(x^3 + x^2 + 1) both present fields of order 8; F_3[x]/(x^2 + 1) and F_3[x]/(x^2 + x + 2) both present fields of order 9.
- The degree-one presentation X − a of F over itself has inverse x ↦ mk (C x).
- X^4 + 1 presents no field of order p^4 over F_p, for any p: no certificate for it is accepted (Shoup, Exercise 19.13).

*Needs:* [Rabin irreducibility certificates and their checker](#FF0-rabin-irreducibility-certificate), [The Frobenius power residue X^(q^k) mod f](#FF0-frobenius-power-residue), `AdjoinRoot.equiv'`, `AdjoinRoot.liftAlgHom`, `AdjoinRoot.instField`, `PowerBasis.lift`, `PowerBasis.ofAdjoinEqTop`, `minpoly.eq_of_irreducible_of_monic`, `Field.exists_primitive_element`, `PowerBasis.trace_gen_eq_nextCoeff_minpoly`, `Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly`, `FiniteField.algEquivOfCardEq`, `GaloisField.algEquivGaloisField`.

See [Shoup](#source-1) — §19.2, printed p. 511; [Conrad, Finite fields](#source-2) — Theorem 1.10, p. 2; [Shoup](#source-1) — §20 introduction, printed p. 522.

<a id="FF0-presentation-embedding-from-root"></a>

#### Embeddings between presented finite fields from root certificates

Let F be a finite field with q elements and f, g ∈ F[X] irreducible of degrees m and n. A root certificate for an embedding F[X]/(f) → F[X]/(g) is a polynomial b ∈ F[X] with f(b) ≡ 0 (mod g), i.e. g ∣ f.comp b (checked by a remainder computation). It defines the F-algebra homomorphism embeddingOfRoot b : F[X]/(f) → F[X]/(g), [h]_f ↦ [h(b)]_g, sending the class of X to the class of b; being a homomorphism of fields it is injective. A root certificate exists exactly when m ∣ n; the roots of f in F[X]/(g) are then [b]^(q^i), 0 ≤ i < m, there are exactly m embeddings, and the image of each is the subfield {y : y^(q^m) = y} fixed by the q^m-power map.

The hypotheses are as follows. f and g are irreducible (certified by [Rabin irreducibility certificates and their checker](#FF0-rabin-irreducibility-certificate) when used in presentations). The certificate is the single polynomial b; the check is g ∣ f.comp b, equivalently (f.comp b) % g = 0 using field-polynomial Euclidean remainder. The monic remainder (f.comp b) %ₘ g may be used only after additionally checking g.Monic or explicitly normalizing g; irreducibility alone does not imply monicity.

A proof proceeds as follows. Well-definedness: AdjoinRoot.liftAlgHom needs f evaluated at [b]_g to vanish, which is g ∣ f.comp b (AdjoinRoot.mk_eq_mk). Formula on classes: the lift sends mk f h to aeval [b]_g h = mk g (h.comp b). Existence iff m ∣ n: F[X]/(f) and F[X]/(g) are fields of degrees m, n over F; an F-embedding exists iff m ∣ n (FiniteField.nonempty_algHom_iff_finrank_dvd), and an embedding is determined by the image of the class of X, a root of f. Roots and count: in the field F[X]/(g) the roots of f form one Frobenius orbit {β^(q^i) : i < m} (Tau Ceti's TauCeti.FiniteField.orbit_eq_rootSet_minpoly and TauCeti.FiniteField.mem_orbit_iff_exists_pow_card_pow), so there are m embeddings (FiniteField.natCard_algHom_of_finrank_dvd). Image: the image is a subfield with q^m elements; in a finite field it is the fixed field of the q^m-power map (Shoup, Theorem 19.13; FiniteField.pow_card on the subfield gives ⊆, and both sets have q^m elements; for the absolute case this is TauCeti.eq_frobeniusFixedSubfield_of_natCard).

Provide the following interface.

- `embeddingOfRoot`: For b with g ∣ f.comp b: the F-algebra hom AdjoinRoot f →ₐ[F] AdjoinRoot g sending root f to mk g b.
- `embeddingOfRoot_root`: embeddingOfRoot b (root f) = mk g b.
- `embeddingOfRoot_mk`: embeddingOfRoot b (mk f h) = mk g (h.comp b).
- `exists_root_iff_dvd`: For f, g irreducible: (∃ b, g ∣ f.comp b) ↔ natDegree f ∣ natDegree g.
- `mem_range_embeddingOfRoot_iff`: y is in the image iff y^(q^(natDegree f)) = y.
- `roots_eq_frobenius_orbit`: g ∣ f.comp c ↔ mk g c = (mk g b)^(q^i) for some i < natDegree f.
- `card_algHom_adjoinRoot`: There are exactly natDegree f embeddings AdjoinRoot f →ₐ[F] AdjoinRoot g when natDegree f ∣ natDegree g.

**Checks.**

- `test_embeddingOfRoot_F4_F16`: Over ZMod 2: (X^4 + X + 1) ∣ (X^2 + X + 1).comp (X^2 + X).
- `test_embeddingOfRoot_no_root`: Over ZMod 2, for every b: ¬ (X^3 + X + 1) ∣ (X^2 + X + 1).comp b.
- `test_embeddingOfRoot_identity`: With g = f and b = X, embeddingOfRoot is the identity.
- `test_embeddingOfRoot_conrad`: Over ZMod 7: (X^3 − 2) ∣ (X^3 + X^2 + 6X + 5).comp (X^2 + X + 2) (Conrad, Example 3.8).


In particular, verify the following values and consequences.

- F_4 → F_16 over F_2: b = Y^2 + Y is a root of X^2 + X + 1 modulo Y^4 + Y + 1, since (Y^2+Y)^2 + (Y^2+Y) + 1 = Y^4 + Y + 1.
- Conrad, Example 3.8: over F_7, Y^2 + Y + 2 is a root of X^3 + X^2 + 6X + 5 modulo Y^3 − 2 (verified by polynomial arithmetic modulo 7).
- No root certificate exists from X^2 + X + 1 into F_2[Y]/(Y^3 + Y + 1), since 2 ∤ 3.

*Needs:* `AdjoinRoot.liftAlgHom`, `AdjoinRoot.mk_eq_mk`, `FiniteField.nonempty_algHom_iff_finrank_dvd`, `FiniteField.natCard_algHom_of_finrank_dvd`, `FiniteField.pow_card`, `TauCeti.FiniteField.orbit_eq_rootSet_minpoly`, `TauCeti.FiniteField.mem_orbit_iff_exists_pow_card_pow`, `TauCeti.eq_frobeniusFixedSubfield_of_natCard`, [Certified presentation of a finite field](#FF0-certified-presentation-of-a-finite-field).

See [Shoup](#source-1) — Theorem 19.13, printed p. 515; [Conrad, Finite fields](#source-2) — Corollary 3.7 and Example 3.8, p. 8.

<a id="FF0-presentation-change-isomorphism"></a>

#### Change of presentation with explicit inverse

Let F be a finite field and f, g ∈ F[X] irreducible of the same degree n. A change-of-presentation certificate is a pair (b, c) ∈ F[X]^2 with g ∣ f.comp b (b is a root of f modulo g), f ∣ g.comp c (c is a root of g modulo f) and f ∣ b.comp c − X. It defines the F-algebra isomorphism presentationChange b c : F[X]/(f) ≃ₐ[F] F[X]/(g), [X]_f ↦ [b]_g, whose inverse is the embedding [Y]_g ↦ [c]_f; the reverse congruence g ∣ c.comp b − X follows. Every pair of irreducible polynomials of the same degree admits a certificate, and certificates compose.

The hypotheses are as follows. f and g irreducible over the finite field F with natDegree f = natDegree g. The certificate explicitly supplies b and c, rather than choosing a root implicitly. All three congruences are checked by Euclidean remainder computations; monic division requires monic f and g or explicit normalization. The quotient-algebra suggested prototype is noncomputable; executable dense-coefficient refinements and their comparison maps belong to ComputationalNumberTheory:CN.0.

A proof proceeds as follows. The forward map is embeddingOfRoot b and the backward map embeddingOfRoot c ([Embeddings between presented finite fields from root certificates](#FF0-presentation-embedding-from-root)). Their composite F[X]/(f) → F[X]/(g) → F[X]/(f) sends [X]_f to [b.comp c]_f = [X]_f by the third congruence; an F-algebra endomorphism of AdjoinRoot f is determined by the image of root f (AdjoinRoot.algHom_ext), so the composite is the identity. Hence embeddingOfRoot b is injective with a left inverse; both fields have q^n elements, so it is bijective and embeddingOfRoot c is its two-sided inverse; in particular [c.comp b]_g = [Y]_g, i.e. g ∣ c.comp b − X. Existence: f has a root [b]_g in the field F[X]/(g) (equal degrees: FiniteField.nonempty_algHom_iff_finrank_dvd); the resulting embedding is an isomorphism by cardinality, and c is the representative of degree < n of the preimage of [Y]_g. Composition: the composite of presentationChange (b, c) from f to g and (b', c') from g to h sends [X]_f to [b.comp b']_h, and (b.comp b' mod h, c'.comp c mod f) is a certificate from f to h.

Provide the following interface.

- `presentationChange`: From (b, c) with the three congruences: AdjoinRoot f ≃ₐ[F] AdjoinRoot g.
- `presentationChange_root`: presentationChange b c (root f) = mk g b.
- `presentationChange_symm_root`: (presentationChange b c).symm (root g) = mk f c.
- `presentationChange_comp_self`: The reverse congruence g ∣ c.comp b − X holds.
- `exists_presentationChange`: For f, g irreducible of equal degree a certificate exists.
- `presentationChange_trans`: Composition of certificates: the composite sends root f to mk h (b.comp b').

**Checks.**

- `test_presentationChange_refl`: (X, X) is a certificate from f to itself: f ∣ f.comp X and f ∣ X.comp X − X.
- `test_presentationChange_inverse_needed`: Over ZMod 7: (X^3 − 2) ∣ (X^3 − 2).comp (2X) but ¬ (X^3 − 2) ∣ (2X).comp (2X) − X.
- `test_presentationChange_F9`: Over ZMod 3: (X^2+1) ∣ (X^2+X+2).comp (X+1), (X^2+X+2) ∣ (X^2+1).comp (X+2) and (X^2+X+2) ∣ (X+1).comp (X+2) − X.
- `test_presentationChange_conrad_F343`: Over ZMod 7 with f = X^3+X^2+6X+5, g = X^3−2: g ∣ f.comp (X^2+X+2), f ∣ g.comp (X^2+2X+2), f ∣ (X^2+X+2).comp (X^2+2X+2) − X.


In particular, verify the following values and consequences.

- Conrad, Example 3.8, completed: over F_7 with f = X^3 + X^2 + 6X + 5, g = X^3 − 2, the pair b = X^2 + X + 2, c = X^2 + 2X + 2 is a certificate (recomputed modulo 7: g(c) ≡ 0 mod f and b(c) ≡ X mod f).
- Over F_7 with f = g = X^3 − 2, the pair (2X, 2X) consists of roots but is not a certificate: (2X)∘(2X) = 4X ≢ X; the inverse of X ↦ 2X is X ↦ 4X.
- Over F_3: X + 1 is a root of X^2 + X + 2 modulo X^2 + 1 and X + 2 is a root of X^2 + 1 modulo X^2 + X + 2, mutually inverse.

*Needs:* [Embeddings between presented finite fields from root certificates](#FF0-presentation-embedding-from-root), [Certified presentation of a finite field](#FF0-certified-presentation-of-a-finite-field), `FiniteField.nonempty_algHom_iff_finrank_dvd`, `AdjoinRoot.liftAlgHom`, `AdjoinRoot.mk_eq_mk`, `AdjoinRoot.algHom_ext`.

See [Shoup](#source-1) — Theorem 19.14, printed pp. 515–516; [Conrad, Finite fields](#source-2) — Example 3.8, p. 8; [Conrad, Finite fields](#source-2) — Executive summary, p. 1.

### 0.3 Tensor products of finite fields

<a id="FF0-factorization-over-extension"></a>

#### Factorisation of an irreducible polynomial over an extension

Let F be a finite field with q elements, f ∈ F[X] monic irreducible of degree k, and E ⊇ F a finite field extension of degree ℓ. Then over E, f factors as the product of d := gcd(k, ℓ) distinct monic irreducible polynomials, each of degree k/d.

The hypotheses are as follows. F finite, E a finite field with Algebra F E, ℓ = finrank F E. f monic irreducible over F.

A proof proceeds as follows. Let Ω be a finite field containing E and a root α of f (for instance a splitting field of f over E). The roots of f in Ω are α^(q^i), i ∈ ℤ/k, pairwise distinct (TauCeti.FiniteField.orbit_eq_rootSet_minpoly, TauCeti.FiniteField.natCard_orbit_eq_natDegree_minpoly, TauCeti.FiniteField.mem_orbit_iff_exists_pow_card_pow with base F). E has q^ℓ elements, so its Frobenius is the q^ℓ-power map; applying the same lemmas with base E, two roots have the same minimal polynomial over E iff they lie in one orbit of x ↦ x^(q^ℓ) (TauCeti.FiniteField.mem_orbit_iff_minpoly_eq). Under i ↦ α^(q^i), the q^ℓ-power map acts on ℤ/k as i ↦ i + ℓ; its orbits are the cosets of the subgroup generated by ℓ in ℤ/k, which has order k/gcd(k, ℓ); so there are d = gcd(k, ℓ) orbits of size k/d. Each orbit is the root set of one monic irreducible factor of f over E (map_minpoly_eq_prod_orbit over E), and f is squarefree (its k roots are distinct), so f = ∏ of the d minimal polynomials over E, each of degree k/d.

In particular, verify the following values and consequences.

- X^2 + 1 over F_3 splits over F_9 into two linear factors (k = ℓ = 2, d = 2).
- X^3 + X + 1 over F_2 stays irreducible over F_4 (gcd(3, 2) = 1).
- X^4 + X + 1 over F_2 splits over F_4 into two irreducible quadratics (d = 2, degree 2).

*Needs:* `TauCeti.FiniteField.orbit_eq_rootSet_minpoly`, `TauCeti.FiniteField.natCard_orbit_eq_natDegree_minpoly`, `TauCeti.FiniteField.mem_orbit_iff_exists_pow_card_pow`, `TauCeti.FiniteField.mem_orbit_iff_minpoly_eq`, `TauCeti.FiniteField.map_minpoly_eq_prod_orbit`, `FiniteField.pow_card`.

See [Shoup](#source-1) — Exercise 19.9, printed p. 521.

<a id="FF0-tensor-product-of-finite-fields"></a>

#### Tensor product of finite fields

Let F be a finite field with q elements, K and L finite field extensions of F of degrees m and n, d := gcd(m, n), and M a field extension of F of degree lcm(m, n) with F-embeddings ι_K : K → M and ι_L : L → M (they exist, FiniteField.nonempty_algHom_iff_finrank_dvd). Let φ(x) = x^q be the Frobenius of M over F. The F-algebra map Φ : K ⊗_F L → M^d = (Fin d → M), Φ(a ⊗ b) = (φ^i(ι_K a) · ι_L b)_{0 ≤ i < d}, is an isomorphism of F-algebras (tensorProductEquiv). In particular F_(q^m) ⊗_(F_q) F_(q^n) ≅ F_(q^lcm(m,n))^gcd(m,n), K ⊗_F L is a field iff gcd(m, n) = 1, and K ⊗_F L has exactly gcd(m, n) maximal ideals.

The hypotheses are as follows. F finite; K, L, M finite fields that are F-algebras; finrank F M = lcm(m, n). Pinned convention: the i-th coordinate twists the K-factor by φ^i and leaves the L-factor fixed; Φ is L-linear for L acting on each coordinate through ι_L.

A proof proceeds as follows. Each coordinate Φ_i is an F-algebra homomorphism K ⊗_F L → M (Algebra.TensorProduct.productMap of φ^i ∘ ι_K and ι_L). Each Φ_i is surjective: its image is a subfield of M containing subfields of orders q^m and q^n, hence of order q^c with m ∣ c and n ∣ c (Shoup, Theorem 19.13), so of order q^lcm(m,n) = #M. The kernels are pairwise distinct: if ker Φ_i = ker Φ_j, then Φ_j = τ ∘ Φ_i for an F-automorphism τ = φ^t of M (Gal(M/F) is generated by φ: FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow); on 1 ⊗ L this gives φ^t ∘ ι_L = ι_L, so n ∣ t (φ^t fixes the degree-n subfield exactly when n ∣ t); on K ⊗ 1 it gives φ^j ∘ ι_K = φ^(t+i) ∘ ι_K, so m ∣ t + i − j; hence d ∣ i − j and i = j for 0 ≤ i, j < d. The kernels are maximal (quotients are the field M) and pairwise distinct, hence pairwise coprime (Ideal.isCoprime_of_isMaximal); the Chinese remainder theorem (Ideal.quotientInfRingEquivPiQuotient) shows Φ is surjective onto ∏_i M. Dimensions: finrank F (K ⊗_F L) = mn (Module.finrank_tensorProduct) = d · lcm(m, n) = finrank F (Fin d → M) (Module.finrank_pi), so the surjection Φ is bijective. Field criterion: K ⊗_F L ≅ M^d is a field iff d = 1. Maximal ideals of M^d are the d coordinate kernels. Second description (Conrad, Tensor products II, Example 7.17; Shoup, Exercise 19.9): choose the simple presentation K ≃ₐ[F] AdjoinRoot f, f monic irreducible of degree m. First swap K ⊗[F] L to L ⊗[F] K with Algebra.TensorProduct.comm. AdjoinRoot.tensorAlgEquiv then yields a quotient over the coefficient ring L ⊗[F] F, not directly L. Transport that coefficient ring along Algebra.TensorProduct.rid F L L : L ⊗[F] F ≃ₐ[L] L; the polynomial becomes f.map (algebraMap F L). The induced quotient equivalence is obtained by AdjoinRoot.liftAlgHom in both directions, checking the generator and coefficient identities. Thus K ⊗[F] L ≃ₐ[F] L[X]/(f.map (algebraMap F L)). The mapped polynomial factors over L into d distinct monic irreducibles of degree m/d ([Factorisation of an irreducible polynomial over an extension](#FF0-factorization-over-extension)), and CRT gives d field factors, each of degree (m/d)·n = lcm(m,n) over F.

Provide the following interface.

- `tensorProductEquiv`: Given ι_K, ι_L and finrank F M = lcm(m, n): the isomorphism K ⊗[F] L ≃ₐ[F] (Fin gcd(m, n) → M).
- `tensorProductEquiv_tmul`: tensorProductEquiv (a ⊗ b) i = (ι_K a)^(q^i) · ι_L b.
- `finrank_tensorProduct_fields`: finrank F (K ⊗[F] L) = m · n.
- `isField_tensorProduct_iff`: K ⊗[F] L is a field iff gcd(m, n) = 1.
- `exists_tensorProductEquiv`: For every M of degree lcm(m, n) over F there is an F-algebra isomorphism K ⊗[F] L ≃ₐ[F] (Fin gcd(m, n) → M).
- `card_maximalIdeals_tensorProduct`: K ⊗[F] L has exactly gcd(m, n) maximal ideals.

**Checks.**

- `test_tensorProduct_F4_F4`: GaloisField 2 2 ⊗[ZMod 2] GaloisField 2 2 ≃ₐ[ZMod 2] (Fin 2 → GaloisField 2 2) exists.
- `test_tensorProduct_F4_F8_isField`: GaloisField 2 2 ⊗[ZMod 2] GaloisField 2 3 is a field.
- `test_tensorProduct_base`: K ⊗[F] F ≃ₐ[F] (Fin gcd(m, 1) → K), i.e. K.
- `test_tensorProduct_not_field`: GaloisField 2 2 ⊗[ZMod 2] GaloisField 2 2 is not a field (a definition claiming the tensor product of fields is a field fails).
- `test_tensorProduct_finrank`: finrank F (K ⊗[F] L) = gcd(m, n) · lcm(m, n), agreeing with Mathlib's Module.finrank_tensorProduct.


In particular, verify the following values and consequences.

- F_4 ⊗_(F_2) F_4 ≅ F_4 × F_4 (m = n = 2).
- F_4 ⊗_(F_2) F_8 ≅ F_64 is a field (gcd(2, 3) = 1).
- K ⊗_F F ≅ K (n = 1).
- F_4 ⊗_(F_2) F_4 is not a field: (ω ⊗ 1 − 1 ⊗ ω)(ω ⊗ 1 − 1 ⊗ ω^2) = 0 with both factors nonzero.

*Needs:* [Factorisation of an irreducible polynomial over an extension](#FF0-factorization-over-extension), `Algebra.TensorProduct.productMap`, `AdjoinRoot.tensorAlgEquiv`, `FiniteField.nonempty_algHom_iff_finrank_dvd`, `FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow`, `Ideal.isCoprime_of_isMaximal`, `Ideal.quotientInfRingEquivPiQuotient`, `Module.finrank_tensorProduct`, `Module.finrank_pi`, `Algebra.TensorProduct.comm`, `Algebra.TensorProduct.rid`, `AdjoinRoot.liftAlgHom`.

See [Conrad, Tensor products](#source-3) — Example 7.17, pp. 37–38; [Conrad, Tensor products](#source-3) — Example 7.18, p. 38; [Shoup](#source-1) — Exercise 19.9, printed p. 521.

### 0.4 Normal elements and the Frobenius normal basis

<a id="FF0-frobenius-minimal-polynomial-of-an-element"></a>

#### The minimal polynomial of an element under the Frobenius

Let K be a finite field with q elements, L a finite field extension of degree n and σ : L → L, x ↦ x^q, the Frobenius, viewed as a K-linear endomorphism (FiniteField.frobeniusAlgHom K L). For α ∈ L, the minimal polynomial of α under σ, frobeniusMinpoly α ∈ K[X], is the monic generator of the ideal {g ∈ K[X] : g(σ)(α) = 0}, where g(σ)(α) = Σ_i g_i σ^i(α) (the annihilator of α in the K[X]-module L with X acting as σ, Mathlib's Module.AEval'). It divides X^n − 1, the minimal polynomial of σ (FiniteField.minpoly_frobeniusAlgHom), and its degree is the dimension of the span of the conjugates α, σ(α), σ^2(α), …

The hypotheses are as follows. K finite with q elements, L finite over K of degree n = finrank K L. Not the minimal polynomial of α: for ω ∈ F_4 \ F_2, minpoly F_2 ω = X^2 + X + 1 while frobeniusMinpoly ω = X^2 − 1 = X^2 + 1.

A proof proceeds as follows. The ideal {g : g(σ)(α) = 0} is the kernel of g ↦ g(σ)(α), an ideal of the principal ideal domain K[X]; it contains X^n − 1 since σ^n = id (FiniteField.orderOf_frobeniusAlgHom, FiniteField.minpoly_frobeniusAlgHom), so it is nonzero and has a unique monic generator (Submodule.IsPrincipal.generator normalised). Degree: K[X]/(frobeniusMinpoly α) ≅ the cyclic K[X]-submodule generated by α, whose K-dimension is the degree (Shoup §18.6: α, τ(α), …, τ^(m−1)(α) form a basis of ⟨α⟩_τ). Values: frobeniusMinpoly 0 = 1; for a ∈ K nonzero, σ(a) = a and a ≠ 0, so frobeniusMinpoly a = X − 1.

Provide the following interface.

- `frobeniusMinpoly`: The monic generator of {g ∈ K[X] : g(σ)(α) = 0}.
- `frobeniusMinpoly_monic`: frobeniusMinpoly α is monic.
- `aeval_frobeniusMinpoly`: (frobeniusMinpoly α)(σ)(α) = 0.
- `frobeniusMinpoly_dvd_iff`: frobeniusMinpoly α ∣ g ↔ g(σ)(α) = 0.
- `frobeniusMinpoly_dvd_X_pow_sub_one`: frobeniusMinpoly α ∣ X^n − 1.
- `natDegree_frobeniusMinpoly`: deg frobeniusMinpoly α = dim_K span{σ^i(α) : i ∈ ℕ}.
- `frobeniusMinpoly_zero`: frobeniusMinpoly 0 = 1.
- `frobeniusMinpoly_algebraMap`: For a ∈ K nonzero, frobeniusMinpoly a = X − 1.

**Checks.**

- `test_frobeniusMinpoly_one`: frobeniusMinpoly (1 : L) = X − 1.
- `test_frobeniusMinpoly_zero`: frobeniusMinpoly (0 : L) = 1.
- `test_frobeniusMinpoly_F4`: For ω ∈ GaloisField 2 2 with ω^2 + ω + 1 = 0: frobeniusMinpoly ω = X^2 − 1 over ZMod 2.
- `test_frobeniusMinpoly_ne_minpoly`: For the same ω: frobeniusMinpoly ω ≠ minpoly (ZMod 2) ω (X^2 − 1 versus X^2 + X + 1).


In particular, verify the following values and consequences.

- frobeniusMinpoly 1 = X − 1 and frobeniusMinpoly 0 = 1.
- In F_4 over F_2, frobeniusMinpoly ω = X^2 − 1 for ω^2 + ω + 1 = 0.

*Needs:* `FiniteField.frobeniusAlgHom`, `FiniteField.minpoly_frobeniusAlgHom`, `FiniteField.orderOf_frobeniusAlgHom`, `Module.AEval'`, `Submodule.IsPrincipal.generator`, `Submodule.span`.

See [Shoup](#source-1) — §18.6, printed p. 504; [Shoup](#source-1) — Exercise 19.14(a), printed p. 521.

<a id="FF0-normal-element-criterion"></a>

#### Normal elements: the Frobenius criterion and its certificate form

Let K be a finite field, L a finite extension of degree n with Frobenius σ, and α ∈ L. The following are equivalent: (a) α is a normal element, i.e. α, σ(α), …, σ^(n−1)(α) is a K-basis of L; (b) frobeniusMinpoly α = X^n − 1; (c) for every monic irreducible factor h of X^n − 1 in K[X], ((X^n − 1)/h)(σ)(α) ≠ 0. Normal elements exist.

The hypotheses are as follows. K finite, L finite over K of degree n ≥ 1. (c) is a finite certificate: one evaluation of a known polynomial at σ for each irreducible factor h of X^n − 1.

A proof proceeds as follows. (a) ⇒ (b): if the n conjugates are linearly independent, no nonzero polynomial of degree < n kills α, so frobeniusMinpoly α has degree ≥ n; it divides X^n − 1 (degree n) and is monic, hence equals X^n − 1. (b) ⇒ (a): the cyclic submodule generated by α has K-dimension deg frobeniusMinpoly α = n (natDegree_frobeniusMinpoly), so α, …, σ^(n−1)(α) span L and are n vectors in an n-dimensional space, hence a basis (linearIndependent_iff_card_eq_finrank_span). (b) ⇔ (c): write φ := frobeniusMinpoly α, a monic divisor of X^n − 1. If φ ≠ X^n − 1, some irreducible factor h of (X^n − 1)/φ exists and φ ∣ (X^n − 1)/h, so ((X^n − 1)/h)(σ)(α) = 0 (frobeniusMinpoly_dvd_iff). Conversely if φ = X^n − 1 then φ ∤ (X^n − 1)/h, so the evaluation is nonzero (Shoup, Theorem 18.11: g ⊙ α has minimal polynomial φ/gcd(φ, g)). Existence (Shoup, Exercise 19.14(b), Theorem 18.12): some β has minimal polynomial under σ equal to the minimal polynomial of σ, which is X^n − 1 (FiniteField.minpoly_frobeniusAlgHom); Mathlib's exists_linearIndependent_algEquiv_apply gives the same through the Galois orbit.

In particular, verify the following values and consequences.

- In F_4 over F_2, ω is normal ({ω, ω^2} is a basis) while 1 is not ({1, 1} is dependent).
- Over K itself (n = 1) every nonzero element is normal.
- Mathlib's IsGalois.normalBasis K L 1 satisfies (b).

*Needs:* [The minimal polynomial of an element under the Frobenius](#FF0-frobenius-minimal-polynomial-of-an-element), `FiniteField.minpoly_frobeniusAlgHom`, `linearIndependent_iff_card_eq_finrank_span`, `exists_linearIndependent_algEquiv_apply`.

See [Shoup](#source-1) — Exercise 19.14(b)–(c), printed p. 521; [Shoup](#source-1) — Theorem 18.11 and proof of Theorem 18.12, printed p. 504–505.

<a id="FF0-frobenius-normal-basis"></a>

#### The Frobenius normal basis and normal-basis coordinates

Let K be a finite field with q elements, L a finite extension of degree n with Frobenius σ, and α ∈ L a normal element (frobeniusMinpoly α = X^n − 1). The Frobenius normal basis normalBasisOf α : Basis (Fin n) K L is i ↦ σ^i(α). In its coordinates the Frobenius is the cyclic shift: the coordinate of x^q at i is the coordinate of x at i − 1 (indices mod n), and Tr_{L/K}(x) = (Σ_i x_i) · Tr_{L/K}(α). It agrees with Mathlib's Galois-indexed normal basis IsGalois.normalBasis after reindexing Fin n ≃ Gal(L/K), i ↦ σ^i, and IsGalois.normalBasis K L 1 is a normal element.

The hypotheses are as follows. α normal ([Normal elements: the Frobenius criterion and its certificate form](#FF0-normal-element-criterion)). Pinned indexing: position i carries σ^i(α) = α^(q^i), i ∈ Fin n; the shift is finRotate.

A proof proceeds as follows. The family i ↦ σ^i(α) is linearly independent of size n = finrank K L (normal-element criterion (b) ⇒ (a)); basisOfLinearIndependentOfCardEqFinrank makes it a basis. Shift: σ(Σ_i x_i σ^i(α)) = Σ_i x_i σ^(i+1)(α) (σ is K-linear and σ^n = id: FiniteField.orderOf_frobeniusAlgHom), so the coordinates are rotated. Trace: Tr(σ^i(α)) = Tr(α) (the trace is Galois invariant: FiniteField.algebraMap_trace_eq_sum_pow reindexed), and Tr is K-linear. Comparison: Gal(L/K) is cyclic generated by σ (FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow), so i ↦ σ^i is a bijection Fin n ≃ Gal(L/K) along which normalBasisOf α is an orbit basis in Mathlib's sense (IsGalois.normalBasis_apply); conversely IsGalois.normalBasis K L 1 has linearly independent Frobenius conjugates, i.e. it is normal.

Provide the following interface.

- `normalBasisOf`: For α normal: the basis Fin n → L, i ↦ σ^i(α).
- `normalBasisOf_apply`: normalBasisOf α i = σ^i(α).
- `repr_frobenius`: (normalBasisOf α).repr (x^q) i = (normalBasisOf α).repr x (finRotate⁻¹ i): the Frobenius is the cyclic shift.
- `trace_eq_sum_repr`: Tr_{L/K}(x) = (Σ_i repr x i) · Tr_{L/K}(α).
- `linearIndependent_frobenius_iff`: The conjugates σ^i(α), i < n, are linearly independent iff frobeniusMinpoly α = X^n − 1.
- `frobeniusMinpoly_eq_iff_forall_irreducible_factor`: The certificate form of normality.
- `exists_frobeniusMinpoly_eq`: Normal elements exist.
- `frobeniusMinpoly_normalBasis_one`: IsGalois.normalBasis K L 1 is normal: its Frobenius minimal polynomial is X^n − 1.

**Checks.**

- `test_normalBasisOf_F4`: For ω ∈ GaloisField 2 2 with ω^2 + ω + 1 = 0, the family (ω, ω^2) is linearly independent over ZMod 2.
- `test_normalBasisOf_degree_one`: Over K itself, every nonzero a has frobeniusMinpoly a = X^1 − 1.
- `test_normalBasisOf_one_not_normal`: frobeniusMinpoly (1 : GaloisField 2 2) ≠ X^2 − 1 over ZMod 2: 1 is not normal (a test 'α ≠ 0' would wrongly accept it).
- `test_normalBasisOf_mathlib`: IsGalois.normalBasis K L σ = σ (IsGalois.normalBasis K L 1): Mathlib's normal basis is a Galois orbit, matching normalBasisOf after reindexing.


In particular, verify the following values and consequences.

- In F_4 over F_2 with ω^2 + ω + 1 = 0: the basis (ω, ω^2), with the Frobenius swapping the two coordinates; Tr(ω) = 1 so Tr(x) = x_0 + x_1.
- n = 1: every nonzero a ∈ K gives the basis (a) and the shift is the identity.

*Needs:* [Normal elements: the Frobenius criterion and its certificate form](#FF0-normal-element-criterion), `basisOfLinearIndependentOfCardEqFinrank`, `FiniteField.orderOf_frobeniusAlgHom`, `FiniteField.algebraMap_trace_eq_sum_pow`, `FiniteField.bijective_frobeniusAlgEquivOfAlgebraic_pow`, `IsGalois.normalBasis`, `IsGalois.normalBasis_apply`.

See [Shoup](#source-1) — Exercise 19.14(c), printed p. 521; [Conrad, Finite fields](#source-2) — Theorem 5.7, p. 11.

### 0.5 Intermediate fields and their degrees

<a id="FF0-intermediate-field-divisor-correspondence"></a>

#### Intermediate fields and divisors of the extension degree

Let F be a finite field of cardinality q, E/F a finite field extension of degree n, and σ its relative q-power Frobenius. The map K ↦ [K:F] is a bijection from IntermediateField F E to the positive divisors of n. Its inverse sends d ∣ n to the fixed field of the subgroup generated by σ^d, equivalently {x ∈ E : x^(q^d) = x}. This field has q^d elements. Under the bijection, K ≤ L if and only if [K:F] divides [L:F]; the divisor set is ordered by divisibility, not by the usual order on natural numbers.

The hypotheses are as follows. F and E are fields; F is finite; E is a finite-dimensional F-algebra. Set q = #F and n = Module.finrank F E > 0. Divisors are positive (equivalently d ∣ n, since n > 0). All subfields contain the specified image of F.

A proof proceeds as follows. Use the existing relative Frobenius automorphism and its order n. For d ∣ n take IntermediateField.fixedField of the subgroup generated by σ^d; its elements are precisely the roots of X^(q^d) − X. Shoup Theorem 19.4 and the splitting of X^(q^n) − X show that X^(q^d) − X splits in E with q^d distinct roots. Thus the fixed field has degree d. This is a finite-field specialization of the existing Galois fixed-field API, not a new Galois correspondence. For an intermediate K, the tower degree formula gives [K:F] ∣ n. Apply the existing Frobenius fixed-point criterion to E/K: K consists exactly of the roots of X^(#K) − X. This proves both inverse laws and uniqueness. If d ∣ e then every root of X^(q^d) − X is a root of X^(q^e) − X. Conversely K ≤ L implies degree divisibility by the tower formula.

Provide the following interface.

- `intermediateFieldDegreeEquiv`: An equivalence IntermediateField F E ≃ {d : ℕ // d ∣ n}, sending K to [K:F].
- `intermediateFieldDegreeEquiv_symm_mem`: For d ∣ n, x belongs to the inverse image field if and only if x^(q^d) = x.
- `intermediateFieldDegreeEquiv_le_iff_dvd`: K ≤ L if and only if [K:F] ∣ [L:F].
- `existsUnique_intermediateField_finrank`: For every d ∣ n there exists a unique K : IntermediateField F E with [K:F] = d.

**Checks.**

- `intermediateFields_degree_six`: If [E:F] = 6, the degree map has image {1,2,3,6}, with exactly one field for each value.
- `intermediateFields_degree_one`: If E = F as an F-algebra, IntermediateField F E has one element and its degree is 1.
- `intermediateFields_not_natural_order`: In degree 6, the degree-2 field is not contained in the degree-3 field, and no degree-4 field exists.
- `intermediateField_fixed_q`: The inverse at d = 1 is bottom and its membership condition agrees with TauCeti.FiniteField.pow_card_eq_self_iff_mem_range_algebraMap.


In particular, verify the following values and consequences.

- For an extension of degree 6, the intermediate degrees are exactly 1, 2, 3, 6; the degree-2 and degree-3 fields are incomparable.
- For degree 1 the only intermediate field is both bottom and top.
- Degree 4 in a degree-6 extension is rejected, even though 4 ≤ 6.

*Needs:* `FiniteField.frobeniusAlgEquivOfAlgebraic`, `FiniteField.orderOf_frobeniusAlgHom`, `IntermediateField.fixedField`, `IntermediateField.mem_fixedField_iff`, `IntermediateField.finrank_fixedField_eq_card`, `IntermediateField.finrank_dvd_of_le_right`, `Module.card_eq_pow_finrank`, `TauCeti.FiniteField.pow_card_eq_self_iff_mem_range_algebraMap`.

See [Shoup](#source-1) — §19.3, Theorem 19.13 and proof, printed p. 515; Theorem 19.4, p. 510.

### 0.6 Elementary polynomial census

<a id="FF2-monic-polynomials-of-degree"></a>

#### The finite set of monic polynomials of a given degree

For a finite field F with q elements and n ∈ ℕ, monicOfDegree F n ⊆ F[X] is the finite set of monic polynomials of degree exactly n, constructed as the image of the coefficient vectors v : Fin n → F under v ↦ X^n + Σ_{i<n} v_i X^i (Mathlib's degreeLTEquiv identifies vectors with polynomials of degree < n). It has q^n elements; for n = 0 it is {1}.

The hypotheses are as follows. F a finite field (Field F, Fintype F, DecidableEq F) n : ℕ

A proof proceeds as follows. Define the map v ↦ X^n + (degreeLTEquiv F n).symm v; it is injective since degreeLTEquiv is a linear equivalence. Membership: X^n + g with deg g < n is monic of degree n; conversely a monic f of degree n equals X^n + (f − X^n) with deg(f − X^n) < n. Cardinality: injectivity gives card = card (Fin n → F) = q^n.

Provide the following interface.

- `mem_monicOfDegree`: f ∈ monicOfDegree F n ↔ f.Monic ∧ f.natDegree = n.
- `card_monicOfDegree`: (monicOfDegree F n).card = q ^ n.
- `monicOfDegree_zero`: monicOfDegree F 0 = {1}.

**Checks.**

- `monicOfDegree_one_zmod_two`: monicOfDegree (ZMod 2) 1 = {X, X + 1}.
- `card_monicOfDegree_zmod_three_two`: (monicOfDegree (ZMod 3) 2).card = 9.
- `C_two_mul_X_not_mem_monicOfDegree`: 2X ∉ monicOfDegree (ZMod 3) 1: it has degree 1 but is not monic.


In particular, verify the following values and consequences.

- mem_monicOfDegree and card_monicOfDegree hold; the three unit tests pass.

*Needs:* `Polynomial.degreeLTEquiv`, `Polynomial.degreeLT`, `Polynomial.Monic`.

See [Shoup](#source-1) — §20.1, Algorithm RIP, printed p. 524; [Bary-Soroker–Koukoulopoulos–Kozma](#source-9) — §1 notation, and Proposition 8.1, p. 39.

<a id="FF3-monic-irreducible-polynomials-of-degree"></a>

#### The monic irreducible polynomials of a given degree

monicIrreducibles F n is the finite set of monic irreducible polynomials of degree n over the finite field F: the elements of monicOfDegree F n that are irreducible. It is empty for n = 0, and its elements are exactly the irreducible f with normalize f = f and natDegree f = n (Mathlib's normalized irreducibles).

The hypotheses are as follows. F a finite field n : ℕ

A proof proceeds as follows. Filter monicOfDegree F n by Irreducible (classical decidability). Characterisation from mem_monicOfDegree. For polynomials over a field, normalize f = f iff f is monic or f = 0 (Mathlib Polynomial.Monic.normalize_eq_self, leadingCoeff_normalize); irreducible f are nonzero.

Provide the following interface.

- `mem_monicIrreducibles`: f ∈ monicIrreducibles F n ↔ f.Monic ∧ Irreducible f ∧ f.natDegree = n.
- `mem_monicIrreducibles_iff_normalize`: f ∈ monicIrreducibles F n ↔ Irreducible f ∧ normalize f = f ∧ f.natDegree = n: agreement with Mathlib's normalized factors.
- `monicIrreducibles_zero`: monicIrreducibles F 0 = ∅.

**Checks.**

- `monicIrreducibles_zmod_two_two`: monicIrreducibles (ZMod 2) 2 = {X² + X + 1}.
- `monicIrreducibles_zmod_two_one`: monicIrreducibles (ZMod 2) 1 = {X, X + 1}: every monic linear polynomial is irreducible.
- `X_sq_add_one_not_mem_monicIrreducibles`: X² + 1 ∉ monicIrreducibles (ZMod 2) 2, since X² + 1 = (X + 1)² over 𝔽₂.


In particular, verify the following values and consequences.

- mem_monicIrreducibles; monicIrreducibles_zero; the unit tests.

*Needs:* [The finite set of monic polynomials of a given degree](#FF2-monic-polynomials-of-degree), `Polynomial.Monic.normalize_eq_self`, `Polynomial.leadingCoeff_normalize`.

See [Shoup](#source-1) — Theorem 19.10, printed p. 513; [Shoup](#source-1) — §19.2, Theorem 19.11, printed p. 514.

<a id="FF3-count-of-irreducible-polynomials"></a>

#### The number Π_F(n) of monic irreducible polynomials of degree n

For a finite field F with q elements and n ∈ ℕ, irreducibleCount F n = Π_F(n) is the number of monic irreducible polynomials of degree n in F[X] (Shoup's Π_F(ℓ); for F = 𝔽_p it is Bary-Soroker–Koukoulopoulos–Kozma's π_p(k)). Its package is Gauss's formula Σ_{d|n} d Π_F(d) = q^n, the Möbius formula n Π_F(n) = Σ_{d|n} μ(d) q^{n/d}, and the bounds (q^n − 2q^{n/2})/n ≤ Π_F(n) ≤ q^n/n and q^n ≤ 2n Π_F(n) (n ≥ 1).

The hypotheses are as follows. F a finite field with q elements n : ℕ

A proof proceeds as follows. Define irreducibleCount F n := (monicIrreducibles F n).card. Agreement with Nat.card of the subtype of monic irreducible polynomials of degree n is Finset-card versus Nat.card through mem_monicIrreducibles. irreducibleCount F 0 = 0 (a unit is not irreducible) and irreducibleCount F 1 = q (every monic linear polynomial is irreducible; monicOfDegree F 1 has q elements).

Provide the following interface.

- `irreducibleCount_eq_natCard`: irreducibleCount F n = Nat.card {f : F[X] // f.Monic ∧ Irreducible f ∧ f.natDegree = n}.
- `irreducibleCount_zero`: irreducibleCount F 0 = 0.
- `irreducibleCount_one`: irreducibleCount F 1 = q.
- `sum_divisors_mul_irreducibleCount`: Gauss's formula: for n ≠ 0, Σ_{d ∈ n.divisors} d · irreducibleCount F d = q ^ n (node gauss-count-formula).
- `mul_irreducibleCount_eq_sum_moebius`: The Möbius formula (node moebius-formula-for-irreducible-count).
- `mul_irreducibleCount_le`: n · Π_F(n) ≤ q^n (node irreducible-count-upper-bound).
- `card_pow_le_mul_irreducibleCount_add`: q^n ≤ n Π_F(n) + 2 q^{⌊n/2⌋} for n ≠ 0 (node irreducible-count-lower-bound).
- `prime_polynomial_theorem`: The BKK form (q^n − 2q^{n/2})/n ≤ Π_F(n) ≤ q^n/n (node prime-polynomial-theorem).

**Checks.**

- `irreducibleCount_zmod_two_four`: irreducibleCount (ZMod 2) 4 = 3 (X⁴+X+1, X⁴+X³+1, X⁴+X³+X²+X+1).
- `irreducibleCount_zmod_three_two`: irreducibleCount (ZMod 3) 2 = 3.
- `irreducibleCount_zmod_three_three`: irreducibleCount (ZMod 3) 3 = 8.
- `irreducibleCount_eq_card_normalizedFactors`: For n ≠ 0, irreducibleCount F n equals the number of elements of degree n in Mathlib's normalizedFactors (X^(q^n) − X).


In particular, verify the following values and consequences.

- The API identities and the unit tests; the Gauss formula, the Möbius formula and the bounds are proved in the theorem nodes named in the api.

*Needs:* [The monic irreducible polynomials of a given degree](#FF3-monic-irreducible-polynomials-of-degree), `Polynomial.Monic.irreducible_iff_natDegree`.

See [Shoup](#source-1) — §19.2, Theorem 19.11, printed p. 514; [Bary-Soroker–Koukoulopoulos–Kozma](#source-9) — Proposition 8.1 (Prime Polynomial Theorem), p. 39.

<a id="FF3-partition-by-minimal-polynomials"></a>

#### Counting the elements of an extension by their minimal polynomials

Let E ⊇ F be finite fields with [E : F] = n and let C be any decidable condition on F[X]. Then #{α ∈ E : C(minpoly_F α)} = Σ_{d | n} d · #{f ∈ monicIrreducibles F d : C(f)}.

The hypotheses are as follows. E a finite field extension of F with Module.finrank F E = n (so n ≥ 1) C : F[X] → Prop decidable

A proof proceeds as follows. Every α ∈ E has minimal polynomial minpoly_F α monic irreducible of degree d = [F(α) : F], which divides n (Mathlib minpoly.irreducible, IntermediateField.adjoin.finrank, tower law). Conversely, a monic irreducible f of degree d | n divides X^(q^n) − X (Mathlib Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X), which splits in E with the q^n distinct roots given by the elements of E (Mathlib FiniteField.roots_X_pow_card_sub_X); hence f has exactly d distinct roots in E, each with minimal polynomial f. Group the elements of E by their minimal polynomial: the fibre over f has d elements, and C depends only on the fibre; sum over d | n.

In particular, verify the following values and consequences.

- With C = true: q^n = Σ_{d|n} d Π_F(d) (Gauss's formula).
- With C(f)=(((-1)^deg f·f(0))^(n/deg f)=b): the norm-fibre identity. Equivalently use (-1)^n·f(0)^(n/deg f)=b; omitting the sign fails for odd n.

*Needs:* [The monic irreducible polynomials of a given degree](#FF3-monic-irreducible-polynomials-of-degree), `minpoly.irreducible`, `IntermediateField.adjoin.finrank`, `Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X`, `FiniteField.roots_X_pow_card_sub_X`, `galois_poly_separable`.

See [Shoup](#source-1) — proof of Theorem 19.10, printed p. 513.

<a id="FF3-gauss-product-formula"></a>

#### Gauss's product formula for X^(q^n) − X

For a finite field F with q elements and n ≥ 1, X^(q^n) − X = ∏_{d | n} ∏_{f ∈ monicIrreducibles F d} f in F[X].

The hypotheses are as follows. F a finite field with q elements n ≠ 0

A proof proceeds as follows. X^(q^n) − X is monic and square-free: its derivative is −1 (Shoup Theorem 19.1; Mathlib galois_poly_separable gives separability, hence square-free by Polynomial.Separable.squarefree). A monic square-free polynomial is the product of its distinct normalized irreducible factors (Mathlib prod_normalizedFactors and squarefree_iff_nodup_normalizedFactors). A monic irreducible f divides X^(q^n) − X iff deg f | n (Mathlib Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X), so the normalized factors are exactly the elements of monicIrreducibles F d for d | n, each once.

In particular, verify the following values and consequences.

- q = 2, n = 2: X⁴ − X = X (X + 1)(X² + X + 1).
- Degree comparison gives Gauss's formula.

*Needs:* [The monic irreducible polynomials of a given degree](#FF3-monic-irreducible-polynomials-of-degree), `galois_poly_separable`, `Polynomial.Separable.squarefree`, `UniqueFactorizationMonoid.prod_normalizedFactors`, `UniqueFactorizationMonoid.squarefree_iff_nodup_normalizedFactors`, `Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X`, `FiniteField.X_pow_card_pow_sub_X_ne_zero`.

See [Shoup](#source-1) — Theorem 19.10, printed p. 513.

<a id="FF3-gauss-count-formula"></a>

#### Gauss's count q^n = Σ_{d|n} d Π_F(d)

For n ≥ 1, Σ_{d ∈ n.divisors} d · irreducibleCount F d = q^n.

The hypotheses are as follows. F a finite field with q elements n ≠ 0

A proof proceeds as follows. Compare degrees on both sides of Gauss's product formula: deg(X^(q^n) − X) = q^n (Mathlib FiniteField.X_pow_card_pow_sub_X_natDegree_eq) and the right side has degree Σ_{d|n} d · #monicIrreducibles F d.

In particular, verify the following values and consequences.

- q = 2: Π(1) + 2Π(2) = 2 + 2 = 4 = 2²; Π(1) + 2Π(2) + 4Π(4) = 2 + 2 + 12 = 16 = 2⁴.

*Needs:* [Gauss's product formula for X^(q^n) − X](#FF3-gauss-product-formula), `FiniteField.X_pow_card_pow_sub_X_natDegree_eq`.

See [Shoup](#source-1) — §19.2, Theorem 19.11, printed p. 514.

<a id="FF3-moebius-formula-for-irreducible-count"></a>

#### The Möbius formula for Π_F(n)

For n ≥ 1, n · Π_F(n) = Σ_{d | n} μ(d) q^{n/d} (as integers), with μ Mathlib's ArithmeticFunction.moebius.

The hypotheses are as follows. F a finite field with q elements n ≠ 0

A proof proceeds as follows. Apply Möbius inversion (Mathlib ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq) to f(d) = d Π_F(d) and g(n) = q^n, using Gauss's count for every n > 0; rewrite the divisorsAntidiagonal sum as a sum over divisors.

In particular, verify the following values and consequences.

- q = 2, n = 4: 4 Π(4) = 2⁴ − 2² = 12, so Π(4) = 3.
- Shoup Exercise 19.2: Π_{𝔽₂}(30) = (2³⁰ − 2¹⁵ − 2¹⁰ − 2⁶ + 2⁵ + 2³ + 2² − 2)/30 = 35790267.

*Needs:* [Gauss's count q^n = Σ_{d|n} d Π_F(d)](#FF3-gauss-count-formula), `ArithmeticFunction.sum_eq_iff_sum_mul_moebius_eq`, `ArithmeticFunction.moebius`.

See [Shoup](#source-1) — Exercise 19.1, printed p. 515.

<a id="FF3-irreducible-count-upper-bound"></a>

#### The upper bound n Π_F(n) ≤ q^n

For every n ∈ ℕ, n · Π_F(n) ≤ q^n. For n≥1, equivalently Π_F(n)/q^n ≤ 1/n, which is Bary-Soroker–Koukoulopoulos–Kozma's Σ_{deg I = n} 1/‖I‖ ≤ 1/n. At n=0 use Π_F(0)=0 and the undivided inequality 0≤1.

The hypotheses are as follows. F a finite field with q elements

A proof proceeds as follows. For n = 0 both sides are trivial. For n ≥ 1 the term d = n of Gauss's count is n Π_F(n) and all terms are nonnegative.

In particular, verify the following values and consequences.

- q = 2, n = 4: 12 ≤ 16.

*Needs:* [Gauss's count q^n = Σ_{d|n} d Π_F(d)](#FF3-gauss-count-formula).

See [Shoup](#source-1) — Theorem 19.12 and its proof, printed p. 514; [Bary-Soroker–Koukoulopoulos–Kozma](#source-9) — Proposition 8.1 (Prime Polynomial Theorem), p. 39.

<a id="FF3-irreducible-count-lower-bound"></a>

#### The lower bound q^n ≤ n Π_F(n) + 2 q^{⌊n/2⌋}

For n ≥ 1, q^n ≤ n · Π_F(n) + 2 q^{⌊n/2⌋}. This is the integer form of the lower bound of Bary-Soroker–Koukoulopoulos–Kozma, Proposition 8.1.

The hypotheses are as follows. F a finite field with q elements n ≠ 0

A proof proceeds as follows. By Gauss's count, n Π_F(n) = q^n − Σ_{d|n, d<n} d Π_F(d). Each proper divisor d of n satisfies d ≤ ⌊n/2⌋ and d Π_F(d) ≤ q^d (upper bound), so the subtracted sum is at most Σ_{d=1}^{⌊n/2⌋} q^d = q(q^{⌊n/2⌋} − 1)/(q − 1) < 2 q^{⌊n/2⌋} (q ≥ 2); this is Shoup's S(q, ℓ).

In particular, verify the following values and consequences.

- q = 2, n = 4: 16 ≤ 12 + 8.
- n = 1: q ≤ q + 2.

*Needs:* [Gauss's count q^n = Σ_{d|n} d Π_F(d)](#FF3-gauss-count-formula), [The upper bound n Π_F(n) ≤ q^n](#FF3-irreducible-count-upper-bound).

See [Shoup](#source-1) — Theorem 19.12 and its proof, printed p. 514; [Bary-Soroker–Koukoulopoulos–Kozma](#source-9) — Proposition 8.1 (Prime Polynomial Theorem), p. 39.

<a id="FF3-prime-polynomial-theorem"></a>

#### The prime polynomial theorem with explicit error

For n ≥ 1, (q^n − 2 q^{n/2})/n ≤ Π_F(n) ≤ q^n/n, the exponent n/2 being real. For F = 𝔽_p this is Proposition 8.1 of Bary-Soroker–Koukoulopoulos–Kozma.

The hypotheses are as follows. F a finite field with q elements n ≠ 0

A proof proceeds as follows. Upper bound: divide the upper-bound node by n. Lower bound: from the integer lower bound and q^{⌊n/2⌋} ≤ q^{n/2} (q ≥ 1), divide by n.

In particular, verify the following values and consequences.

- For q = 2, n = 2: (4 − 4)/2 = 0 ≤ Π = 1 ≤ 2.
- For every n the bound gives Π_F(n) > 0 once q^{n/2} > 2.

*Needs:* [The upper bound n Π_F(n) ≤ q^n](#FF3-irreducible-count-upper-bound), [The lower bound q^n ≤ n Π_F(n) + 2 q^{⌊n/2⌋}](#FF3-irreducible-count-lower-bound).

See [Bary-Soroker–Koukoulopoulos–Kozma](#source-9) — Proposition 8.1 (Prime Polynomial Theorem), p. 39; [Shoup](#source-1) — Theorem 19.12 and its proof, printed p. 514.

<a id="FF3-irreducible-density-lower-bound"></a>

#### Shoup's density bound q^n ≤ 2n Π_F(n)

For n ≥ 1, q^n ≤ 2 n Π_F(n): a uniformly random monic polynomial of degree n is irreducible with probability at least 1/(2n).

The hypotheses are as follows. F a finite field with q elements n ≠ 0

A proof proceeds as follows. It suffices that S(q, n) = Σ_{k=1}^{⌊n/2⌋} q^k ≤ q^n/2, because n Π_F(n) ≥ q^n − S(q, n) (the argument of the lower bound). For n ∈ {1, 2, 3} check directly (S = 0, q, q); for n ≥ 4, S(q, n) ≤ q^{n/2+1} ≤ q^{n−1} ≤ q^n/2.

In particular, verify the following values and consequences.

- Tight at q = 2, n = 2: 4 = 2·2·1.
- At n = 1 it reads q ≤ 2q.

*Needs:* [Gauss's count q^n = Σ_{d|n} d Π_F(d)](#FF3-gauss-count-formula), [The upper bound n Π_F(n) ≤ q^n](#FF3-irreducible-count-upper-bound).

See [Shoup](#source-1) — proof of Theorem 19.12, printed p. 514.

<a id="FF3-irreducible-count-with-constant-coefficient"></a>

#### The number of monic irreducibles with prescribed constant coefficient

For a finite field F, n ∈ ℕ and b ∈ F, irreducibleCountWithConstantCoeff F n b is the number of f ∈ monicIrreducibles F n with f(0) = b (for F = 𝔽_p and b ≠ 0, the count of I_p in Bary-Soroker–Koukoulopoulos–Kozma's proof of Lemma 3.2).

The hypotheses are as follows. F a finite field with q elements n : ℕ b : F

A proof proceeds as follows. Filter monicIrreducibles F n by f.coeff 0 = b and take the cardinality. Summing over b recovers Π_F(n). b = 0: an irreducible with zero constant coefficient is divisible by X, hence equals X; so the count is 1 for n = 1 and 0 otherwise. n = 1: X − (−b) = X + b is the unique monic linear polynomial with constant coefficient b.

Provide the following interface.

- `sum_irreducibleCountWithConstantCoeff`: Σ_{b ∈ F} irreducibleCountWithConstantCoeff F n b = irreducibleCount F n.
- `irreducibleCountWithConstantCoeff_zero_right`: irreducibleCountWithConstantCoeff F n 0 = if n = 1 then 1 else 0.
- `irreducibleCountWithConstantCoeff_one`: irreducibleCountWithConstantCoeff F 1 b = 1 for every b.

**Checks.**

- `irreducibleCountWithConstantCoeff_zmod_three_two`: irreducibleCountWithConstantCoeff (ZMod 3) 2 2 = 2 (X² + X + 2 and X² + 2X + 2).
- `irreducibleCountWithConstantCoeff_zmod_three_two_one`: irreducibleCountWithConstantCoeff (ZMod 3) 2 1 = 1 (X² + 1).
- `irreducibleCountWithConstantCoeff_zmod_two_three`: irreducibleCountWithConstantCoeff (ZMod 2) 3 1 = 2 (X³ + X + 1 and X³ + X² + 1).
- `irreducibleCountWithConstantCoeff_zero_two`: irreducibleCountWithConstantCoeff (ZMod 5) 2 0 = 0.


In particular, verify the following values and consequences.

- The API identities and the unit tests.

*Needs:* [The monic irreducible polynomials of a given degree](#FF3-monic-irreducible-polynomials-of-degree).

See [Bary-Soroker–Koukoulopoulos–Kozma](#source-9) — proof of Lemma 3.2, p. 20.

<a id="FF3-norm-from-minimal-polynomial"></a>

#### The norm of an element from its minimal polynomial

Let E ⊇ F be finite fields with [E : F] = n and α ∈ E with minimal polynomial P of degree d. Then N_{E/F}(α) = (−1)^n · P(0)^{n/d}.

The hypotheses are as follows. E a finite field extension of F of degree n α ∈ E

A proof proceeds as follows. N_{E/F}(α) = N_{F(α)/F}(α)^{[E : F(α)]} (Mathlib Algebra.norm_eq_norm_adjoin), with [E : F(α)] = n/d (IntermediateField.adjoin.finrank and the tower law). N_{F(α)/F}(α) = (−1)^d P(0) (Mathlib Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly for the power basis of F(α)). Combine: ((−1)^d P(0))^{n/d} = (−1)^n P(0)^{n/d} since d · (n/d) = n.

In particular, verify the following values and consequences.

- α ∈ F: P = X − α, d = 1, N(α) = α^n = (−1)^n (−α)^n.

*Needs:* `Algebra.norm_eq_norm_adjoin`, `Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly`, `IntermediateField.adjoin.finrank`.

See [Bary-Soroker–Koukoulopoulos–Kozma](#source-9) — proof of Lemma 3.2, p. 20.

<a id="FF3-constant-coefficient-norm-fibre-identity"></a>

#### The norm-fibre identity for constant coefficients

For n ≥ 1 and b ∈ F^×: Σ_{d | n} d · #{f ∈ monicIrreducibles F d : f(0)^{n/d} = b} = (q^n − 1)/(q − 1).

The hypotheses are as follows. F a finite field with q elements n ≠ 0 b ≠ 0

A proof proceeds as follows. Let E be an extension of degree n (e.g. GaloisField). By the norm lemma, N(α) = (−1)^n b iff P(0)^{n/d} = b for P = minpoly α of degree d. By the partition lemma with C(f) = (f(0)^{n/deg f} = b), the left side is #{α ∈ E : N(α) = (−1)^n b}. The norm restricted to units is a surjective group homomorphism E^× → F^× (Mathlib FiniteField.unitsMap_norm_surjective); every fibre over a unit has |E^×|/|F^×| = (q^n − 1)/(q − 1) elements, and α = 0 has norm 0 ≠ (−1)^n b.

In particular, verify the following values and consequences.

- q = 3, n = 2, b = 2: d = 1 contributes 0 (2 is not a square mod 3) and d = 2 contributes 2·2 = 4 = (9 − 1)/2.
- q = 5, n = 2, b = 1: 2 + 2·2 = 6 = 24/4.

*Needs:* [Counting the elements of an extension by their minimal polynomials](#FF3-partition-by-minimal-polynomials), [The norm of an element from its minimal polynomial](#FF3-norm-from-minimal-polynomial), `FiniteField.unitsMap_norm_surjective`, `FiniteField.algebraMap_norm_eq_pow`, `GaloisField`.

See [Bary-Soroker–Koukoulopoulos–Kozma](#source-9) — proof of Lemma 3.2, p. 20.

<a id="FF3-constant-coefficient-count-bounds"></a>

#### Two-sided bound for irreducibles with prescribed constant coefficient

For n ≥ 1 and b ≠ 0: (q^n − 1)/(q − 1) − 2 q^{⌊n/2⌋} ≤ n · irreducibleCountWithConstantCoeff F n b ≤ (q^n − 1)/(q − 1).

The hypotheses are as follows. F a finite field with q elements n ≠ 0 b ≠ 0

A proof proceeds as follows. The term d = n of the norm-fibre identity is n · irreducibleCountWithConstantCoeff F n b; the other terms are nonnegative (upper bound). The terms with d < n are at most d Π_F(d) ≤ q^d, and d ≤ ⌊n/2⌋; so they sum to less than 2 q^{⌊n/2⌋}, as in the lower bound for Π_F.

In particular, verify the following values and consequences.

- q = 3, n = 2, b = 2: 4 − 6 ≤ 2·2 ≤ 4.

*Needs:* [The norm-fibre identity for constant coefficients](#FF3-constant-coefficient-norm-fibre-identity), [The upper bound n Π_F(n) ≤ q^n](#FF3-irreducible-count-upper-bound).

See [Bary-Soroker–Koukoulopoulos–Kozma](#source-9) — proof of Lemma 3.2, p. 20.

<a id="FF3-irreducible-polynomials-with-prescribed-constant-coefficient"></a>

#### Irreducible polynomials with prescribed constant coefficient

For n ≥ 1 and b ≠ 0, the number Π_F(n; b) of monic irreducible polynomials of degree n with constant coefficient b satisfies |n (q − 1) Π_F(n; b)/q^n − 1| ≤ 3 q^{1 − n/2}. Hence Π_F(n; b) = q^n/((q − 1) n) (1 + O(q^{1 − n/2})) with absolute implied constant 3, the statement Bary-Soroker–Koukoulopoulos–Kozma use in the proof of Lemma 3.2, citing Rosen, Theorem 4.8.

The hypotheses are as follows. F a finite field with q elements n ≠ 0 b ≠ 0

A proof proceeds as follows. From the two-sided bound: n(q − 1)Π_F(n; b) lies in [q^n − 1 − 2(q − 1) q^{⌊n/2⌋}, q^n − 1]. Divide by q^n: the relative error is at most (1 + 2(q − 1) q^{n/2})/q^n ≤ q^{−n} + 2 q^{1 − n/2} ≤ 3 q^{1 − n/2}.

In particular, verify the following values and consequences.

- q = 3, n = 2, b = 2: |2·2·2/9 − 1| = 1/9 ≤ 3.

*Needs:* [Two-sided bound for irreducibles with prescribed constant coefficient](#FF3-constant-coefficient-count-bounds).

See [Bary-Soroker–Koukoulopoulos–Kozma](#source-9) — proof of Lemma 3.2, p. 20.

### 0.7 Shared linearized polynomials and subspaces

The polynomial-law core here is independent of character-sum bounds. The [Ore/composition comparison](#FF4-frobenius-ore-polynomial-comparison) compares this common polynomial law with Mathlib `SkewPolynomial`. The finite-field function quotient, where X^(q^n)−X is killed, is a separate Layer 4 application. DrinfeldModulesAndTModules imports this common theory.

<a id="FF4-linearized-polynomial"></a>

#### q-linearized (additive) polynomials

Let K be a commutative semiring and q a natural number. A polynomial L ∈ K[X] is q-linearized (a q-polynomial), written Polynomial.IsLinearized q L, if every exponent in its support is a power of q, i.e. L = ∑_i a_i X^{q^i}. The constructor linearizedOf q a := ∑_i C (a i) · X^{q^i} turns a finitely supported coefficient sequence a : ℕ →₀ K into a q-polynomial; its q-degree is the largest i with a_i ≠ 0. Convention (pinned): exponents are q^i with i ≥ 0, so X = X^{q^0} is linearized and, for q≥2, nonzero constants are not; q ≥ 2 in every theorem.

The hypotheses are as follows. K is a commutative semiring for the support definition. Evaluation linearity uses a finite field F with #F = q and compatible commutative coefficient and target F-algebras, as in linearized-polynomial-eval-linear; fields are not required there.

A proof proceeds as follows. Define IsLinearized q L :↔ ∀ n ∈ L.support, ∃ i, n = q^i. Closure under +, under multiplication by constants and under finite sums is immediate from Polynomial.support_add ⊆ and support_C_mul ⊆. linearizedOf q a is linearized because each monomial C c · X^{q^i} has support ⊆ {q^i}; conversely every linearized L equals linearizedOf q (fun i ↦ L.coeff (q^i)) since i ↦ q^i is injective for q ≥ 2. Composition closure and linearity of evaluation are separate nodes (linearized-polynomial-comp, linearized-polynomial-eval-linear).

Provide the following interface.

- `Polynomial.IsLinearized`: IsLinearized q L :↔ ∀ n ∈ L.support, ∃ i, n = q^i.
- `Polynomial.linearizedOf`: linearizedOf q a = ∑_i C (a i) * X^(q^i) for a : ℕ →₀ K.
- `Polynomial.IsLinearized.X`: X is q-linearized.
- `Polynomial.IsLinearized.X_pow_pow`: X^(q^i) is q-linearized.
- `Polynomial.IsLinearized.add`: The sum of q-linearized polynomials is q-linearized.
- `Polynomial.IsLinearized.C_mul`: C c * L is q-linearized when L is.
- `Polynomial.IsLinearized.eq_linearizedOf`: For q ≥ 2, a q-linearized L equals linearizedOf q (fun i ↦ L.coeff (q^i)).
- `Polynomial.isLinearized_linearizedOf`: linearizedOf q a is q-linearized.

**Checks.**

- `IsLinearized.X_pow_sub_X`: Over ZMod p, X^p − X is p-linearized.
- `IsLinearized.not_X_sq_add_one`: X² + 1 ∈ (ZMod 2)[X] is not 2-linearized (exponent 0 is not a power of 2).
- `IsLinearized.not_X_cube`: X³ ∈ (ZMod 2)[X] is not 2-linearized.
- `IsLinearized.zero`: 0 is q-linearized.
- `IsLinearized.linearizedOf_single`: linearizedOf q (Finsupp.single i c) = C c * X^(q^i).


In particular, verify the following values and consequences.

- X^q − X, X and 0 are q-linearized; X² + X is 2-linearized over ZMod 2; X² + 1 and X³ are not 2-linearized.
- Over F_q, X^q − X is a nonzero q-linearized polynomial whose evaluation function is zero. Polynomial laws are not identified merely because their values on the finite base field agree.

*Needs:* `Polynomial.support`, `Polynomial.monomial`, `Finsupp`.

See [Shallue](#source-29) — Chapter 1, Section 1.4, printed p. 14; [Ben-Sasson–Etzion–Gabizon–Raviv](#source-22) — Section II, Definition 1, printed p. 3.

<a id="FF4-linearized-polynomial-eval-linear"></a>

#### Evaluation of a q-polynomial is F_q-linear

Let F be a finite field with q elements, K a commutative F-algebra, E a commutative K-algebra equipped with the compatible F-algebra structure (IsScalarTower F K E), and L in K[X] q-linearized. Then x maps to aeval x L is additive on E and satisfies L(c*x)=c*L(x) for c in F, hence defines the F-linear map IsLinearized.toLinearMap : E ->_F E. K and E need not be fields; the compatible scalar tower is required.

The hypotheses are as follows. F is a finite field, q=#F; K and E are commutative rings with Algebra F K, Algebra K E, Algebra F E and IsScalarTower F K E.

A proof proceeds as follows. (x + y)^{q^i} = x^{q^i} + y^{q^i} in a commutative ring of characteristic p (iterated frobenius, add_pow_char_pow); sum over the monomials of L. For c ∈ F, c^{q} = c (FiniteField.pow_card), so (c x)^{q^i} = c^{q^i} x^{q^i} = c x^{q^i}; multiply by the coefficient and sum.

In particular, verify the following values and consequences.

- For L = X^q − X and E = F itself, toLinearMap is the zero map.
- For L = X² + X over ZMod 2 and E = GaloisField 2 2, toLinearMap has kernel {0, 1}.

*Needs:* [q-linearized (additive) polynomials](#FF4-linearized-polynomial), `add_pow_char_pow`, `FiniteField.pow_card`, `Polynomial.aeval`.

See [Shallue](#source-29) — Chapter 1, Section 1.4, printed p. 14.

<a id="FF4-linearized-polynomial-comp"></a>

#### q-polynomials are closed under composition

Let p be prime, K a commutative ring of characteristic p, and q = p^e with e ≥ 1. If L₁ = ∑ a_i X^{q^i} and L₂ = ∑ b_j X^{q^j} are q-linearized, then L₁.comp L₂ is q-linearized with L₁ ∘ L₂ = ∑_k (∑_{i+j=k} a_i b_j^{q^i}) X^{q^k}; composition is associative and distributes over addition on both sides, so the q-polynomials form a (noncommutative) ring under + and ∘ with unit X.

The hypotheses are as follows. p prime, CharP K p, q = p^e, e ≥ 1. Primality is essential for commutative rings: in ℤ/4ℤ, (1+1)^4=0 whereas 1^4+1^4=2.

A proof proceeds as follows. (∑_j b_j X^{q^j})^{q^i} = ∑_j b_j^{q^i} X^{q^{i+j}} by additivity of the q^i-th power map in characteristic p (Polynomial.expand and frobenius on K[X]). Multiply by a_i and sum over i; collect by k = i + j. Left distributivity follows directly from the same characteristic-p Frobenius identities in K[X] used in the coefficient formula, including for a commutative coefficient ring that is not a field. Right distributivity and associativity are Polynomial.add_comp and Polynomial.comp_assoc. The field-based evaluation node is not applied to a non-field K.

In particular, verify the following values and consequences.

- (X^q) ∘ (a X) = a^q X^q and (a X) ∘ X^q = a X^q: composition is not commutative unless a^q = a.
- (X^q − X) ∘ (X^q − X) = X^{q²} − 2X^q + X.

*Needs:* [q-linearized (additive) polynomials](#FF4-linearized-polynomial), [Evaluation of a q-polynomial is F_q-linear](#FF4-linearized-polynomial-eval-linear), `Polynomial.comp`, `Polynomial.comp_assoc`, `Polynomial.add_comp`, `Polynomial.expand`.

See [Wu–Liu](#source-31) — Section 2.1, printed p. 5; [Wu–Liu](#source-31) — Section 1, printed p. 2.

<a id="FF4-roots-of-linearized-polynomial"></a>

#### The roots of a q-polynomial form an F_q-subspace

The evaluation zero locus of a q-linearized L in E is the F-linear kernel of IsLinearized.toLinearMap L. For L≠0 this also equals Polynomial.rootSet L E and is finite. For L=0 the evaluation zero locus is all of E, whereas Mathlib defines Polynomial.rootSet 0 E to be empty.

The hypotheses are as follows. F finite, Fintype.card F = q = p^e; E a field with [Algebra K E]; L q-linearized. Require L≠0 for the Polynomial.rootSet identification, exactly as in the suggested signature.

A proof proceeds as follows. The roots in E are the zeros of the F-linear map x ↦ L(x) (linearized-polynomial-eval-linear), i.e. its kernel. Finiteness for L ≠ 0: a nonzero polynomial has finitely many roots in a field (Polynomial.rootSet is finite).

In particular, verify the following values and consequences.

- The roots of X^q − X in any extension E of F are exactly the image of F.
- X² + X over ZMod 2 has root set {0, 1} in GaloisField 2 2, a 1-dimensional F₂-subspace.

*Needs:* [Evaluation of a q-polynomial is F_q-linear](#FF4-linearized-polynomial-eval-linear), `Polynomial.rootSet`, `LinearMap.ker`.

See [Ben-Sasson–Etzion–Gabizon–Raviv](#source-22) — Section II, printed p. 3; [Ben-Sasson–Etzion–Gabizon–Raviv](#source-22) — Section II, Theorem 1, printed p. 3.

<a id="FF4-linearized-polynomial-separable-iff"></a>

#### A q-polynomial is separable iff its coefficient of X is nonzero

Let K be a field of characteristic p, q = p^e (e ≥ 1) and L = ∑_{i≤m} a_i X^{q^i} ∈ K[X] q-linearized and nonzero. (a) L is separable iff a_0 ≠ 0. (b) If a_0 ≠ 0 and L splits over a field E ⊇ K, then L has exactly q^m distinct roots in E, where m is the q-degree. (c) If K is perfect and t is the least index with a_t ≠ 0, every root of L in a splitting field has multiplicity exactly q^t.

The hypotheses are as follows. CharP K p; q = p^e, e ≥ 1; L ≠ 0; (c) assumes PerfectField K.

A proof proceeds as follows. The derivative of X^{q^i} is q^i X^{q^i − 1} = 0 for i ≥ 1 in characteristic p, so L′ = a_0 (Polynomial.derivative). (a) If a_0 ≠ 0, L′ is a nonzero constant, so IsCoprime L L′ (mathlib:Polynomial.separable_def); if a_0 = 0 then L′ = 0 and L (nonconstant) is not separable. (b) A separable split polynomial has natDegree many distinct roots (mathlib:Polynomial.card_rootSet_eq_natDegree), and natDegree L = q^m. (c) Over a perfect field L = M^{q^t} with M = ∑_i a_i^{1/q^t} X^{q^{i−t}} (take q^t-th roots of the coefficients; frobenius is bijective), and M has nonzero X-coefficient, so M is separable by (a); each root of L is a simple root of M, hence of multiplicity q^t in L.

In particular, verify the following values and consequences.

- X^q − X is separable (a_0 = −1) with exactly q roots in F_q.
- X^{q²} + X^q = (X^q + X)^q over F_q is not separable and each root has multiplicity q.

*Needs:* [q-linearized (additive) polynomials](#FF4-linearized-polynomial), `Polynomial.derivative`, `Polynomial.separable_def`, `Polynomial.card_rootSet_eq_natDegree`, `PerfectField`, `frobenius`.

See [Ben-Sasson–Etzion–Gabizon–Raviv](#source-22) — Section II, Lemma 1 and proof, printed p. 3; [Ben-Sasson–Etzion–Gabizon–Raviv](#source-22) — Section II, Theorem 1, printed p. 3.

<a id="FF4-subspace-polynomial"></a>

#### The subspace polynomial of a finite F_q-subspace

Let F be a finite field with q elements, E a field with [Algebra F E], and U a finite F-subspace of E (a Submodule F E with Finite U). Its subspace polynomial is P_U := ∏_{u ∈ U} (X − C u) ∈ E[X]. It is monic of degree #U = q^{dim U}, separable, its roots in E are exactly U, and it is q-linearized (node subspace-polynomial-is-linearized).

The hypotheses are as follows. F finite, Fintype.card F = q; U a finite-dimensional F-subspace of the field E (finite since F is finite).

A proof proceeds as follows. Define P_U := ∏_{u ∈ U.toFinset} (X − C u) (Finset.prod over the finite carrier). Monic of degree #U: product of monic linear factors (Polynomial.monic_prod_of_monic, natDegree_prod). Roots = U with multiplicity one: roots of a product of distinct linear factors (Polynomial.roots_prod_X_sub_C); hence separable (Polynomial.nodup_roots converse for split polynomials). #U = q^{finrank F U} (Module.card_eq_pow_finrank).

Provide the following interface.

- `subspacePolynomial`: subspacePolynomial U = ∏_{u ∈ U} (X − C u).
- `subspacePolynomial_monic`: subspacePolynomial U is monic.
- `subspacePolynomial_natDegree`: Its natDegree is Nat.card U = q^(finrank F U).
- `mem_rootSet_subspacePolynomial`: x is a root of subspacePolynomial U iff x ∈ U.
- `subspacePolynomial_separable`: subspacePolynomial U is separable.
- `subspacePolynomial_injective`: U ↦ subspacePolynomial U is injective (BEGR Lemma 2).

**Checks.**

- `subspacePolynomial_bot`: subspacePolynomial ⊥ = X.
- `subspacePolynomial_range_algebraMap`: For U = the image of F in E, subspacePolynomial U = X^q − X.
- `subspacePolynomial_not_of_nonsubspace`: For q = 2 and a ∈ GaloisField 2 2 \ {0,1}, ∏_{u ∈ {0,1,a}} (X − u) has degree 3 and is not 2-linearized, while the subspace {0,1,a,a+1} gives X⁴ + X.
- `subspacePolynomial_natDegree`: natDegree (subspacePolynomial U) = q^(finrank F U).


In particular, verify the following values and consequences.

- P_⊥ = X.
- For U = the image of F in E, P_U = X^q − X (FiniteField.roots_X_pow_card_sub_X).

*Needs:* `Polynomial.roots_prod_X_sub_C`, `Module.card_eq_pow_finrank`, `FiniteField.roots_X_pow_card_sub_X`, `Polynomial.nodup_roots`, `Submodule`.

See [Ben-Sasson–Etzion–Gabizon–Raviv](#source-22) — Section II, Definition 2, printed p. 3; [Ben-Sasson–Etzion–Gabizon–Raviv](#source-22) — Section II, Example 1, printed p. 3.

<a id="FF4-subspace-polynomial-is-linearized"></a>

#### Subspace polynomials are q-linearized

In the setting of subspace-polynomial, P_U is q-linearized for every finite F-subspace U ⊆ E; its coefficient of X is nonzero and its q-degree is dim_F U. Conversely every monic q-linearized L ∈ E[X] with nonzero X-coefficient that splits over E is the subspace polynomial of its root space.

The hypotheses are as follows. F finite with q elements; U a finite-dimensional F-subspace of the field E.

A proof proceeds as follows. Induction on dim U. For U = ⊥, P_U = X. If U = U′ ⊕ F·w with w ∉ U′, then P_U(X) = ∏_{c ∈ F} P_{U′}(X − c w) = ∏_{c ∈ F} (P_{U′}(X) − c P_{U′}(w)), using that P_{U′} is linearized (induction) and hence additive and F-linear as a polynomial map in the K-algebra E[X] (linearized-polynomial-eval-linear). ∏_{c ∈ F}(Y − c b) = Y^q − b^{q−1} Y for b ∈ E (the roots of Y^q − b^{q−1}Y are the c b; FiniteField.roots_X_pow_card_sub_X scaled), so P_U = P_{U′}^q − P_{U′}(w)^{q−1} P_{U′}, a q-linearized polynomial by linearized-polynomial-comp. The X-coefficient is nonzero since P_U is separable (subspace-polynomial) and linearized-polynomial-separable-iff; the converse follows from roots-of-linearized-polynomial and linearized-polynomial-separable-iff (b), comparing monic polynomials with the same simple roots.

In particular, verify the following values and consequences.

- For U = F₂·1 + F₂·a ⊆ GaloisField 2 2 (a² = a + 1), P_U = X⁴ + X.
- For U = F·w of dimension one, P_U = X^q − w^{q−1} X.

*Needs:* [The subspace polynomial of a finite F_q-subspace](#FF4-subspace-polynomial), [q-polynomials are closed under composition](#FF4-linearized-polynomial-comp), [Evaluation of a q-polynomial is F_q-linear](#FF4-linearized-polynomial-eval-linear), [A q-polynomial is separable iff its coefficient of X is nonzero](#FF4-linearized-polynomial-separable-iff), [The roots of a q-polynomial form an F_q-subspace](#FF4-roots-of-linearized-polynomial), `FiniteField.roots_X_pow_card_sub_X`.

See [Ben-Sasson–Etzion–Gabizon–Raviv](#source-22) — Section II, printed p. 3; [Ben-Sasson–Etzion–Gabizon–Raviv](#source-22) — Section II, Lemma 1, printed p. 3.

<a id="FF4-frobenius-ore-polynomial-comparison"></a>

#### Frobenius Ore and linearized polynomial comparison

Let F have q elements and R be a commutative F-algebra, with q ≥ 2. Give Multiplicative ℕ its action on R by iterates of φ(a)=a^q. The additive equivalence Θ:SkewPolynomial R ≃+ {P∈R[X] : every supported exponent is q^i} sends Σ a_i τ^i to Σ a_i X^(q^i). It intertwines Ore multiplication with polynomial composition, and carries 1 to X. The target uses the support predicate above, and its product is composition.

The hypotheses are as follows. F finite field, q=|F|; R a commutative F-algebra, not necessarily a field or perfect.

A proof proceeds as follows. Frobenius to the q-th power is an F-algebra endomorphism; form the native monoid action by iteration, without requesting an inverse. Distinct exponents q^i give inverse coefficient extraction. Use the earlier support predicate, not a new definition of additive polynomial. The native monomial multiplication formula becomes (aX^(q^i))∘(bX^(q^j))=a b^(q^i) X^(q^(i+j)); distribute across finite sums.

Provide the following interface.

- `oreToLinearized`: The coefficient equivalence Θ with the supported-polynomial subtype.
- `oreToLinearized_monomial`: Θ(aτ^i)=aX^(q^i).
- `oreToLinearized_mul`: Θ(A B)=Θ(A)∘Θ(B).
- `oreToLinearized_one`: Θ(1)=X.
- `oreToLinearized_natural`: An F-algebra map R→S commutes with Θ and the induced coefficient map.
- `frobeniusAction_smul`: Under the native Multiplicative ℕ action, ofAdd(k) acts on a as a^(q^k); k=0 is the identity. No inverse Frobenius is required.

**Checks.**

- `ore_one_is_X`: Θ(1)=X.
- `ore_degree_zero`: Θ(a)=aX for a constant skew polynomial.
- `ore_noncommutation`: In F_2[t], Θ(τt) = t²X² whereas Θ(tτ)=tX²; they are distinct.


In particular, verify the following values and consequences.

- The constant skew monomial a maps to aX, not to the constant polynomial a.
- Over F_q[t], τt=t^qτ and Frobenius is not surjective.

*Needs:* [q-linearized (additive) polynomials](#FF4-linearized-polynomial), [q-polynomials are closed under composition](#FF4-linearized-polynomial-comp), `SkewPolynomial`, `SkewPolynomial.monomial_mul_monomial`, `FiniteField.frobeniusAlgHom`.

See [Wu–Liu](#source-31) — §2.1, equations (1)–(3), Theorems 2.1–2.2, pp. 5–6; §3, Theorem 3.1, pp. 8–9. The commutative-algebra generalization is derived from the native Frobenius endomorphism.

### Examples

Over F₂, X²+X+1 is irreducible: it has no root in {0,1}, and its two roots in F₄ are exchanged by squaring. Over F₄ it has two linear factors, agreeing with gcd(2,2)=2. The normal-basis test distinguishes 1 (whose Frobenius orbit is constant) from a root α of X²+X+1 (the pair α,α² is independent). The degree-two monic census has four polynomials; exactly one is irreducible. For the zero linearized polynomial the evaluation kernel is all of F₄, while for X² it is {0}.

### Dependencies

FiniteField, AdjoinRoot, IntermediateField, trace/norm, Polynomial.degreeLT and the Frobenius-orbit/minimal-polynomial comparison in PolynomialGaloisGroups Layer 5 supply the underlying carriers. The explicit coordinates, normality certificates and census formulas above provide the extra interfaces used by later layers.

<a id="FF1"></a>

## Layer 1: Characters, Fourier analysis and Gauss sums

Begin with canonical trace characters, norm/trace lifts and zero conventions. Transport the general Fourier theory to field coordinates before using multiplicative Fourier coefficients. Hasse–Davenport lifting has an elementary L-function route; its product identity uses the exact-Gamma completion with the two specified Dwork inputs. Stickelberger has its own group; the Laurent-completion targets are handed to FA.2. Projective interpolation fixes the prescribed-degree value at infinity and proves uniform two-point fibres for d≥1.

### 1.1 Additive characters, lifts and conventions

<a id="FF1-canonical-additive-character"></a>

#### The canonical additive character of a finite field

Let F be a finite field of characteristic p, with its ZMod p-algebra structure, and Tr = Algebra.trace (ZMod p) F : F → ZMod p the absolute trace. For a commutative ring R and ζ ∈ R with ζ^p = 1, the trace character with root ζ is ψ_{F,ζ} := (AddChar.zmodChar p ζ) ∘ Tr, x ↦ ζ^(val(Tr x)) (traceAddChar F p ζ). The canonical additive character of F is the complex-valued ψ_F := ZMod.stdAddChar ∘ Tr (canonicalAddChar F p), ψ_F(x) = exp(2πi·t/p) for any integer t with t ≡ Tr(x) (mod p); it is ψ_{F,ζ} with ζ = e^(2πi/p). Pinned conventions: the trace goes to the prime field ZMod p (absolute trace), the root is e^(+2πi/p), and the character is x ↦ ψ(x), not its inverse. Every additive character of F is x ↦ ψ_F(ax) for a unique a ∈ F ([Every additive character is a multiplicative shift of a primitive one](#FF1-additive-characters-are-shifts)). Mathlib's AddChar.FiniteField.primitiveChar F F' is the trace character with root the chosen primitive p-th root of unity of CyclotomicField p F'; composed with any embedding CyclotomicField p ℂ → ℂ it becomes x ↦ ψ_F(ax) for some a ∈ F_p^×.

The hypotheses are as follows. F a finite field, p = ringChar F prime, [Algebra (ZMod p) F] (the unique such structure). For traceAddChar: ζ^p = 1; it is primitive iff ζ ≠ 1 when R is a domain (then ζ is a primitive p-th root of unity). canonicalAddChar takes values in ℂ; the general version takes values in any ring containing μ_p.

A proof proceeds as follows. Additivity: Tr is ZMod p-linear and zmodChar p ζ is an additive character of ZMod p; compose with AddChar.compAddMonoidHom. Primitivity: for a ≠ 0 there is b with Tr(ab) ≠ 0 (FiniteField.trace_to_zmod_nondegenerate), and zmodChar p ζ is injective on ZMod p when ζ is a primitive p-th root of unity (AddChar.zmodChar_primitive_of_primitive_root, AddChar.IsPrimitive.zmod_char_eq_one_iff); so x ↦ ψ(ax) is nontrivial. Over a field target, nontrivial implies primitive (AddChar.IsPrimitive.of_ne_one). ZMod.stdAddChar is primitive (ZMod.isPrimitive_stdAddChar). Comparison with Mathlib's primitiveChar: unfolding AddChar.FiniteField.primitiveChar, its character is (primitiveZModChar p F').char composed with the trace, and primitiveZModChar uses zmodChar with ζ = IsCyclotomicExtension.zeta p F' (CyclotomicField p F'), a primitive p-th root of unity (IsCyclotomicExtension.zeta_spec). Over ℂ: for a ring homomorphism ι : CyclotomicField p ℂ →+* ℂ, ι(zeta) is a primitive p-th root of unity in ℂ, hence e^(2πik/p) with k ∈ (ZMod p)^×; then ι ∘ primitiveChar sends x to e^(2πik·Tr(x)/p) = ψ_F(kx) (Tr is ZMod p-linear, k ∈ ZMod p ⊆ F). Frobenius invariance: Tr(x^p) = Tr(x), since the trace is the sum over the Galois orbit (FiniteField.algebraMap_trace_eq_sum_pow) and x ↦ x^p permutes the orbit; so ψ(x^p) = ψ(x). Conjugation: ψ_F(−x) = conj ψ_F(x) (AddChar.starComp_eq_inv, values are roots of unity). On the prime field: for c ∈ ZMod p ⊆ F, Tr(c) = [F : F_p]·c (Algebra.trace_algebraMap), so ψ_F(c) = e^(2πi·[F:F_p]c/p).

Provide the following interface.

- `traceAddChar`: traceAddChar F p ζ hζ : AddChar F R, x ↦ ζ^(val(Tr x)), for ζ^p = 1.
- `traceAddChar_apply`: traceAddChar F p ζ hζ x = ζ^((Algebra.trace (ZMod p) F x).val).
- `canonicalAddChar`: canonicalAddChar F p := ZMod.stdAddChar ∘ Tr : AddChar F ℂ.
- `canonicalAddChar_apply`: canonicalAddChar F p x = ZMod.stdAddChar (Algebra.trace (ZMod p) F x).
- `canonicalAddChar_eq_exp`: For t ∈ ℤ with (t : ZMod p) = Tr x: canonicalAddChar F p x = exp(2πi t/p).
- `isPrimitive_traceAddChar`: For R a domain and ζ a primitive p-th root of unity, traceAddChar F p ζ is primitive.
- `isPrimitive_canonicalAddChar`: canonicalAddChar F p is primitive.
- `exists_primitiveChar_eq_traceAddChar`: Mathlib's (AddChar.FiniteField.primitiveChar F F' h).char is x ↦ ζ^(val Tr x) for a primitive p-th root of unity ζ of the cyclotomic field.
- `exists_mulShift_eq_comp_primitiveChar`: For ι : CyclotomicField _ ℂ →+* ℂ: ι ∘ primitiveChar = (canonicalAddChar F p).mulShift a for some a ≠ 0.
- `canonicalAddChar_frobenius`: canonicalAddChar F p (x^p) = canonicalAddChar F p x.
- `canonicalAddChar_neg`: canonicalAddChar F p (−x) = conj (canonicalAddChar F p x).
- `canonicalAddChar_zmod`: canonicalAddChar (ZMod p) p = ZMod.stdAddChar.

**Checks.**

- `test_canonicalAddChar_zmod`: canonicalAddChar (ZMod p) p = ZMod.stdAddChar (N := p).
- `test_canonicalAddChar_F4`: For ω ∈ GaloisField 2 2 with ω^2 + ω + 1 = 0: canonicalAddChar (GaloisField 2 2) 2 ω = −1.
- `test_canonicalAddChar_one_F4`: canonicalAddChar (GaloisField 2 2) 2 1 = 1 (Tr(1) = 0 in characteristic 2); a definition reading off a coordinate instead of the trace would give −1.
- `test_canonicalAddChar_nontrivial`: canonicalAddChar F p ≠ 1; the zero map or the norm in place of the trace would fail this.
- `test_canonicalAddChar_sum`: Σ_{x ∈ F} canonicalAddChar F p x = 0.


In particular, verify the following values and consequences.

- For F = ZMod p, Tr = id and ψ_F = ZMod.stdAddChar.
- In F_4 = F_2(ω) with ω^2 + ω + 1 = 0: Tr(ω) = ω + ω^2 = 1, so ψ(ω) = −1, and Tr(1) = 1 + 1 = 0, so ψ(1) = 1.
- Σ_{x ∈ F} ψ_F(ax) = q if a = 0 and 0 otherwise (AddChar.sum_mulShift).

*Needs:* `AddChar.zmodChar`, `AddChar.compAddMonoidHom`, `Algebra.trace`, `ZMod.stdAddChar`, `ZMod.stdAddChar_coe`, `ZMod.isPrimitive_stdAddChar`, `FiniteField.trace_to_zmod_nondegenerate`, `AddChar.zmodChar_primitive_of_primitive_root`, `AddChar.IsPrimitive.zmod_char_eq_one_iff`, `AddChar.IsPrimitive.of_ne_one`, `AddChar.FiniteField.primitiveChar`, `IsCyclotomicExtension.zeta_spec`, `FiniteField.algebraMap_trace_eq_sum_pow`, `AddChar.starComp_eq_inv`, `Algebra.trace_algebraMap`.

See [Kowalski](#source-4) — Proposition 1.13, printed p. 14; [Conrad, Gauss–Jacobi](#source-5) — Definition 2.1, p. 1; [Katre](#source-8) — §1, p. 75.

<a id="FF1-additive-characters-are-shifts"></a>

#### Every additive character is a multiplicative shift of a primitive one

Let F be a finite field with q elements, R a commutative ring that is a domain, and ψ : AddChar F R primitive. Then a ↦ ψ.mulShift a (x ↦ ψ(ax)) is a bijection F → AddChar F R and an isomorphism of groups (F, +) ≃ AddChar F R; in particular every additive character of F with values in R is x ↦ ψ(ax) for a unique a ∈ F, and AddChar F R has exactly q elements. For R = ℂ and ψ = ψ_F this is Kowalski's Proposition 1.13.

The hypotheses are as follows. F finite field, R a domain, ψ primitive (e.g. traceAddChar with a primitive p-th root of unity, or canonicalAddChar).

A proof proceeds as follows. Additivity: ψ.mulShift (a + b) = ψ.mulShift a · ψ.mulShift b and ψ.mulShift 0 = 1 (AddChar.mulShift_mul style identities). Injectivity: AddChar.to_mulShift_inj_of_isPrimitive. Upper bound on #AddChar F R: every φ ∈ AddChar F R takes values in the p-th roots of unity of R (AddChar.val_mem_rootsOfUnity, p = ringChar F > 0); ψ primitive gives a nontrivial p-th root of unity, so μ_p(R) is cyclic of order p (a domain has at most p roots of X^p − 1) and AddChar F R ≅ Hom((F,+), ℤ/p) = Module.Dual (ZMod p) F (additive maps between ZMod p-modules are linear), which has p^(dim) = q elements. An injective map between finite sets of the same cardinality q is bijective. For R = ℂ, the count is Mathlib's AddChar.card_eq.

In particular, verify the following values and consequences.

- For F = ZMod p and R = ℂ this is Mathlib's AddChar.zmodAddEquiv (with ψ the standard character).
- #AddChar F ℂ = q (AddChar.card_eq).
- Primitivity is needed: for ψ = 1 the map a ↦ ψ.mulShift a is constant.

*Needs:* `AddChar.to_mulShift_inj_of_isPrimitive`, `AddChar.val_mem_rootsOfUnity`, `AddChar.card_eq`, `AddChar.zmodAddEquiv`, `AddChar.mulShift`, [The canonical additive character of a finite field](#FF1-canonical-additive-character).

See [Kowalski](#source-4) — Proposition 1.13, printed p. 14; [Kowalski](#source-4) — (2.2), printed p. 17.

<a id="FF1-norm-lift-of-a-multiplicative-character"></a>

#### The norm lift of a multiplicative character to an extension

Let F ⊆ E be finite fields (E an F-algebra of degree n) and χ : MulChar F R. The norm lift χ_E := χ ∘ N_{E/F} is the multiplicative character of E with χ_E(x) = χ(N_{E/F}(x)); it vanishes at 0 because N(0) = 0 is a non-unit. The map χ ↦ χ_E is an injective group homomorphism MulChar F R →* MulChar E R (injective because N_{E/F} is surjective), it preserves order and nontriviality, it is transitive in towers F ⊆ E ⊆ E' (χ_{E'} = (χ_E)_{E'}), and it commutes with transport of values (ringHomComp).

The hypotheses are as follows. F, E finite fields with Algebra F E; R a commutative ring. Pinned convention: Mathlib's MulChar, so χ_E(0) = 0 even for χ = 1; the lift of the trivial character is the trivial character of E.

A proof proceeds as follows. Definition: for units, χ_E restricted to Eˣ is χ ∘ (Units.map N_{E/F}) (MulChar.ofUnitHom); on non-units (only 0) the value is 0 = χ(0). Multiplicativity in χ: (χφ)_E = χ_E φ_E pointwise. Injectivity and nontriviality: N_{E/F} : Eˣ → Fˣ is surjective (FiniteField.unitsMap_norm_surjective), so χ_E = φ_E forces χ = φ on Fˣ, hence χ = φ (MulChar.ext). Order: χ_E^k = 1 iff χ^k = 1 by injectivity, so orderOf χ_E = orderOf χ (Kowalski, Lemma 1.15). Towers: N_{E'/F} = N_{E/F} ∘ N_{E'/E} (Algebra.norm_norm). Values on F: for a ∈ F, N_{E/F}(a) = a^n (Algebra.norm_algebraMap), so χ_E(a) = χ(a)^n, not χ(a).

Provide the following interface.

- `liftNorm`: liftNorm E χ : MulChar E R, x ↦ χ(N_{E/F} x).
- `liftNorm_apply`: liftNorm E χ x = χ (Algebra.norm F x).
- `liftNormHom`: The group homomorphism MulChar F R →* MulChar E R.
- `liftNorm_injective`: χ ↦ liftNorm E χ is injective.
- `liftNorm_eq_one_iff`: liftNorm E χ = 1 ↔ χ = 1.
- `orderOf_liftNorm`: orderOf (liftNorm E χ) = orderOf χ.
- `liftNorm_liftNorm`: For F ⊆ E ⊆ E' (scalar tower): liftNorm E' (liftNorm E χ) = liftNorm E' χ.
- `liftNorm_algebraMap`: liftNorm E χ (algebraMap F E a) = χ a ^ finrank F E.
- `liftNorm_ringHomComp`: liftNorm E (χ.ringHomComp f) = (liftNorm E χ).ringHomComp f.

**Checks.**

- `test_liftNorm_self`: liftNorm F χ = χ for the trivial extension F/F.
- `test_liftNorm_one`: liftNorm E (1 : MulChar F R) = 1.
- `test_liftNorm_zero`: liftNorm E 1 0 = 0: the lifted trivial character vanishes at 0 (Mathlib's convention).
- `test_liftNorm_algebraMap`: For a ∈ F: liftNorm E χ (algebraMap F E a) = χ(a)^[E:F], which differs from χ(a) in general (a 'restriction' definition fails): for the quadratic character η of ZMod 3 and E = GaloisField 3 2, liftNorm E η (−1) = 1 ≠ −1 = η (−1).
- `test_liftNorm_quadratic`: For p odd and F with [F:ZMod p] finite: (quadraticChar (ZMod p)).liftNorm F = quadraticChar F.


In particular, verify the following values and consequences.

- The lift of the trivial character is trivial; the lift along the identity extension F/F is χ.
- For p odd, the norm lift of the Legendre character of F_p to F is the quadratic character of F (Kowalski, remark after Lemma 1.15).
- For the quadratic character η of F_3 and E = F_9: η_E(−1) = η(N(−1)) = η(1) = 1, whereas η(−1) = −1.

*Needs:* `MulChar`, `MulChar.ofUnitHom`, `FiniteField.unitsMap_norm_surjective`, `Algebra.norm_norm`, `Algebra.norm_algebraMap`, `MulChar.ext`.

See [Kowalski](#source-4) — Lemma 1.15, printed p. 15; [Conrad, L-functions](#source-6) — §1 (2), p. 1.

<a id="FF1-trace-lift-of-an-additive-character"></a>

#### The trace lift of an additive character to an extension

Let F ⊆ E be finite fields and ψ : AddChar F R. The trace lift ψ_E := ψ ∘ Tr_{E/F} is an additive character of E (liftTrace E ψ). The map ψ ↦ ψ_E is an injective group homomorphism (Tr_{E/F} is surjective), it preserves primitivity, it is transitive in towers, it commutes with multiplicative shifts by elements of F, and it carries canonical characters to canonical characters: (ψ_F)_E = ψ_E because Tr_{E/F_p} = Tr_{F/F_p} ∘ Tr_{E/F}.

The hypotheses are as follows. F, E finite fields with Algebra F E; R a commutative ring. For the canonical characters a scalar tower ZMod p → F → E is assumed.

A proof proceeds as follows. Definition: AddChar.compAddMonoidHom with the additive map Tr_{E/F}. Injectivity: Tr_{E/F} is surjective (Algebra.trace_surjective; finite extensions of finite fields are separable), so ψ ∘ Tr = φ ∘ Tr forces ψ = φ. Primitivity: for a ∈ E nonzero, ψ_E(a·) is nontrivial because x ↦ Tr(ax) is surjective onto F and ψ ≠ 1; over a domain target nontrivial characters of a field are primitive (AddChar.IsPrimitive.of_ne_one). Canonical characters: Algebra.trace_trace gives Tr_{E/F_p} = Tr_{F/F_p} ∘ Tr_{E/F}, so (canonicalAddChar F p)_E = canonicalAddChar E p. Shift: for a ∈ F, (ψ.mulShift a)_E = ψ_E.mulShift a because Tr_{E/F}(ax) = a·Tr_{E/F}(x). Values on F: ψ_E(a) = ψ(n·a) for a ∈ F (Algebra.trace_algebraMap), n = [E:F].

Provide the following interface.

- `liftTrace`: liftTrace E ψ : AddChar E R, x ↦ ψ(Tr_{E/F} x).
- `liftTrace_apply`: liftTrace E ψ x = ψ (Algebra.trace F E x).
- `liftTrace_injective`: ψ ↦ liftTrace E ψ is injective.
- `isPrimitive_liftTrace`: For R a domain: ψ ≠ 1 → (liftTrace E ψ).IsPrimitive.
- `liftTrace_liftTrace`: For a scalar tower F ⊆ E ⊆ E': liftTrace E' (liftTrace E ψ) = liftTrace E' ψ.
- `liftTrace_canonicalAddChar`: liftTrace E (canonicalAddChar F p) = canonicalAddChar E p.
- `liftTrace_mulShift`: For a ∈ F: liftTrace E (ψ.mulShift a) = (liftTrace E ψ).mulShift (algebraMap F E a).
- `liftTrace_algebraMap`: liftTrace E ψ (algebraMap F E a) = ψ (finrank F E • a).

**Checks.**

- `test_liftTrace_canonical`: liftTrace (GaloisField p n) (canonicalAddChar (ZMod p) p) = canonicalAddChar (GaloisField p n) p.
- `test_liftTrace_self`: liftTrace F ψ = ψ along F/F.
- `test_liftTrace_nontrivial`: ψ ≠ 1 → liftTrace E ψ ≠ 1.
- `test_liftTrace_one_F4`: For ψ the standard character of ZMod 2 and E = GaloisField 2 2: liftTrace E ψ 1 = 1 while ψ 1 = −1, so the lift is not an extension of ψ.


In particular, verify the following values and consequences.

- In F_2 ⊆ F_4: the canonical character of F_2 lifted to F_4 sends ω to ψ(Tr ω) = ψ(1) = −1 and 1 to ψ(Tr 1) = ψ(0) = 1.
- liftTrace along F/F is ψ.

*Needs:* `AddChar.compAddMonoidHom`, `Algebra.trace_surjective`, `Algebra.trace_trace`, `AddChar.IsPrimitive.of_ne_one`, `Algebra.trace_algebraMap`, [The canonical additive character of a finite field](#FF1-canonical-additive-character).

See [Kowalski](#source-4) — Proposition 1.13, printed p. 14; [Conrad, L-functions](#source-6) — §1 (2), p. 1.

<a id="FF1-trivial-character-conventions"></a>

#### Trivial-character and normalisation conventions for Gauss and Jacobi sums

Let F be a finite field with q elements and R a commutative ring. Mathlib's convention: every χ : MulChar F R vanishes on non-units, so χ(0) = 0 even for the trivial character 1; gaussSum χ ψ = Σ_x χ(x)ψ(x) and jacobiSum χ φ = Σ_x χ(x)φ(1 − x), giving jacobiSum 1 1 = q − 2; with R an integral domain, gaussSum 1 ψ = −1 (ψ ≠ 1) and jacobiSum 1 χ = −1 (χ ≠ 1). The classical convention (Ireland–Rosen p. 88, Berndt–Evans–Williams p. 9, Adhikari; used by the reciprocity sources and by Kowalski's Jacobi sums) sets ε(0) = 1 for the trivial character. Define classicalValue χ : F → R by classicalValue χ x = χ x + [χ = 1 ∧ x = 0], the classical Gauss sum classicalGaussSum χ ψ = Σ_x classicalValue χ x · ψ x and the classical Jacobi sum classicalJacobiSum χ φ = Σ_x classicalValue χ x · classicalValue φ (1 − x). Then classicalGaussSum χ ψ = gaussSum χ ψ + [χ = 1] and classicalJacobiSum χ φ = jacobiSum χ φ + [χ = 1] + [φ = 1]; so J^cl(ε, ε) = q; over an integral-domain value ring, J^cl(ε, χ) = 0 for χ ≠ 1 and g^cl(ε, ψ) = 0 for ψ ≠ 1, and the classical and Mathlib sums agree whenever the characters are nontrivial. The sign-normalised sums of Katre and Conrad (1995) are normalizedGaussSum χ ψ := −gaussSum χ ψ and, for Jacobi sums of r characters, (−1)^(r−1) times Mathlib's sum ([Jacobi sums of several multiplicative characters](#FF1-multi-jacobi-sum)); both use χ(0) = 0, so normalizedGaussSum 1 ψ = 1 for ψ ≠ 1 over an integral-domain value ring, and the normalised J(1, 1) = 2 − q.

The hypotheses are as follows. F a finite field; R a commutative ring; the case split on χ = 1 uses decidable equality of characters (classical). classicalValue is multiplicative in the argument (Kowalski (1.9)) but not in the character: classicalValue (χχ⁻¹) 0 = 1 ≠ 0 = classicalValue χ 0 · classicalValue χ⁻¹ 0 for χ ≠ 1 (Conrad, footnote 2). The definitions and the convention-comparison identities hold for a commutative value ring R. The nontrivial-character vanishing evaluations (gaussSum 1 ψ = −1 for ψ ≠ 1, jacobiSum 1 χ = −1 for χ ≠ 1, and their classical/sign-normalized counterparts) additionally require R to be an integral domain. For example, an additive character of F₂ taking 1 to 3 in Z/8Z is nontrivial but sums to 4, not 0; its gaussSum with the trivial multiplicative character is 3, not −1 = 7.

A proof proceeds as follows. Write classicalValue χ = χ + a·δ_0 with a = [χ = 1] ∈ {0, 1}. Gauss: Σ_x (χx + aδ_{x,0})ψ(x) = gaussSum χ ψ + a·ψ(0) = gaussSum χ ψ + a. Jacobi: Σ_x (χx + aδ_{x,0})(φ(1−x) + bδ_{x,1}) = jacobiSum χ φ + b·χ(1) + a·φ(1) + ab·δ_{0,1} = jacobiSum χ φ + a + b, since χ(1) = φ(1) = 1 and 0 ≠ 1 in F. For an integral-domain value ring in the nontrivial-character cases, evaluate with Mathlib: jacobiSum_one_one (q − 2), jacobiSum_one_nontrivial (−1), gaussSum_one_left (−1); hence J^cl(1,1) = q, J^cl(1,χ) = 0, g^cl(1,ψ) = 0. Multiplicativity in the argument: for χ ≠ 1 classicalValue χ = χ; for χ = 1, classicalValue 1 ≡ 1, and 1·1 = 1.

Provide the following interface.

- `classicalValue`: classicalValue χ x = χ x + (if χ = 1 ∧ x = 0 then 1 else 0).
- `classicalValue_of_ne_one`: χ ≠ 1 → classicalValue χ = χ.
- `classicalValue_one`: classicalValue 1 x = 1 for every x ∈ F.
- `classicalValue_mul`: classicalValue χ (x·y) = classicalValue χ x · classicalValue χ y.
- `classicalGaussSum`: Σ_x classicalValue χ x · ψ x.
- `classicalGaussSum_eq`: classicalGaussSum χ ψ = gaussSum χ ψ + (if χ = 1 then 1 else 0).
- `classicalJacobiSum`: Σ_x classicalValue χ x · classicalValue φ (1 − x).
- `classicalJacobiSum_eq`: classicalJacobiSum χ φ = jacobiSum χ φ + [χ = 1] + [φ = 1].
- `classicalJacobiSum_one_one`: classicalJacobiSum 1 1 = q.
- `classicalJacobiSum_one_left`: χ ≠ 1 → classicalJacobiSum 1 χ = 0 (R a domain).
- `normalizedGaussSum`: normalizedGaussSum χ ψ = −gaussSum χ ψ (Katre, Conrad 1995).
- `normalizedGaussSum_one`: ψ ≠ 1 → normalizedGaussSum 1 ψ = 1 (R a domain).

**Checks.**

- `test_classicalJacobiSum_one_one`: classicalJacobiSum (1 : MulChar F R) 1 = q, whereas jacobiSum 1 1 = q − 2.
- `test_classicalJacobiSum_one_nontrivial`: For χ ≠ 1 (R a domain): classicalJacobiSum 1 χ = 0.
- `test_classicalGaussSum_one`: For ψ ≠ 1 (R a domain): classicalGaussSum 1 ψ = 0.
- `test_classicalValue_ne_mul_at_zero`: For χ ≠ 1: classicalValue (χ * χ⁻¹) 0 ≠ classicalValue χ 0 * classicalValue χ⁻¹ 0 (1 versus 0), so the classical extension is not a character of the monoid F in the character variable.
- `test_classicalJacobiSum_eq_nontrivial`: χ ≠ 1 → φ ≠ 1 → classicalJacobiSum χ φ = jacobiSum χ φ.
- `test_nonDomainChar_sum`: The independently proved character the character on `ZMod 2` with values in `ZMod 8` sending 1 to 3 : AddChar (ZMod 2) (ZMod 8), with value 3 at 1, is nontrivial but sums to 4 ≠ 0. Thus nontrivial-character vanishing over an arbitrary commutative value ring fails; the integral-domain guard is material.


In particular, verify the following values and consequences.

- J^cl(1, 1) = q versus jacobiSum 1 1 = q − 2 (Conrad, Remark 2.7).
- J^cl(1, χ) = 0 versus jacobiSum 1 χ = −1 for χ ≠ 1.
- g^cl(1, ψ) = 0 versus gaussSum 1 ψ = −1 for ψ ≠ 1 (Kowalski, Remark 2.2: τ(1, ψ) = −1 'because of the missing term at x = 0').
- For χ, φ nontrivial: J^cl(χ, φ) = jacobiSum χ φ; in particular the cubic Jacobi sum J(χ_π, χ_π) of CA.1 is the same in both conventions.

*Needs:* `MulChar`, `MulChar.map_nonunit`, `gaussSum`, `jacobiSum`, `jacobiSum_one_one`, `jacobiSum_one_nontrivial`, `gaussSum_one_left`, `gaussSum_one_one`, `MulChar.one_apply`.

See [Conrad, Gauss–Jacobi](#source-5) — Definition 2.1 and footnote 2, p. 1; [Conrad, Gauss–Jacobi](#source-5) — Theorem 2.6 and Remark 2.7, p. 4; [Kowalski](#source-4) — (1.8)–(1.9), printed p. 15; [Katre](#source-8) — Definition 1 and footnote 1, p. 75.

<a id="FF1-gauss-sum-transport"></a>

#### Transport of Gauss sums along ring homomorphisms, and the shift identity

Let R be a finite commutative ring, S and S' commutative rings and f : S →+* S'. For χ : MulChar R S and ψ : AddChar R S: gaussSum (χ.ringHomComp f) (f ∘ ψ) = f (gaussSum χ ψ) (the Jacobi-sum analogue is Mathlib's jacobiSum_ringHomComp). For a finite field F and c ∈ F nonzero (the shift identity): gaussSum χ (ψ.mulShift c) = χ(c)⁻¹ · gaussSum χ ψ, where χ(c)⁻¹ = χ⁻¹(c) is the inverse of the root of unity χ(c). In particular, for a number field K, a character χ : MulChar F (𝓞 K) (such as a power-residue character of CA.1) and an embedding φ : 𝓞 K →+* ℂ, the complex Gauss sum g_φ(χ) := gaussSum (χ.ringHomComp φ) ψ_F = Σ_t φ(χ(t))·ψ_F(t) satisfies: if ζ ∈ 𝓞 K is a p-th root of unity with φ(ζ) = e^(2πia/p), a ∈ F_p^×, then φ(gaussSum χ (traceAddChar F p ζ)) = (χ.ringHomComp φ)⁻¹(a) · g_φ(χ).

The hypotheses are as follows. For the shift identity: F a field, c ≠ 0 (Mathlib's gaussSum_mulShift_eq is the statement for a unit c). For the last statement: F finite of characteristic p with the ZMod p-algebra structure, φ a ring homomorphism.

A proof proceeds as follows. Transport: gaussSum is a finite sum of products; f is additive and multiplicative (map_sum, map_mul), and (χ.ringHomComp f)(t) = f(χ t), (f ∘ ψ)(t) = f(ψ t). Shift identity: apply gaussSum_mulShift_eq with the unit Units.mk0 c hc; χ⁻¹(c) = χ(c⁻¹) = χ(c)⁻¹ (MulChar.inv_apply' for field-valued χ, or Ring.inverse of the unit χ(c) in general). Embedding with a root: φ ∘ traceAddChar F p ζ = t ↦ e^(2πia·Tr(t)/p) = ψ_F.mulShift a (traceAddChar_apply, canonicalAddChar_eq_exp), so by transport φ(gaussSum χ ψ_ζ) = gaussSum (χ.ringHomComp φ) (ψ_F.mulShift a) and the shift identity finishes.

In particular, verify the following values and consequences.

- Katre, Proposition 1(h): for τ_c fixing ζ_m and sending ζ_p ↦ ζ_p^c, g(χ)^(τ_c) = χ(c)^(−1) g(χ) (transport along τ_c plus the shift identity).
- For the cubic character of CA.1 pushed to ℂ, the cube of g_φ(χ) is independent of the choice of ζ up to the factor χ(a)^(−3) = 1.
- jacobiSum_ringHomComp is the Jacobi analogue (no additive character is involved).

*Needs:* `gaussSum`, `MulChar.ringHomComp`, `MonoidHom.compAddChar`, `gaussSum_mulShift_eq`, `MulChar.inv_apply'`, `jacobiSum_ringHomComp`, [The canonical additive character of a finite field](#FF1-canonical-additive-character).

See [Katre](#source-8) — Proposition 1(h) and its proof, pp. 76–77; [Kowalski](#source-4) — (2.2) and Proposition 2.4, printed pp. 17–18.

<a id="FF1-gauss-sum-galois-conjugation"></a>

#### Galois conjugation of Gauss sums of characters of order dividing m

Let F be a finite field of characteristic p with q elements, m ∣ q − 1, and L a field containing a primitive m-th root of unity ζ_m and a primitive p-th root of unity ζ_p (in the Stickelberger nodes, L = Q(ζ_{mp}) or its ring of integers). Let χ : MulChar F L have χ^m = 1 and ψ = traceAddChar F p ζ_p. For an automorphism σ of L with σ(ζ_m) = ζ_m^b and σ(ζ_p) = ζ_p^c (b prime to m, c prime to p): σ(gaussSum χ ψ) = gaussSum (χ^b) (ψ.mulShift c) = χ(c)^(−b) · gaussSum (χ^b) ψ. In particular σ_b (c = 1) sends g(χ) to g(χ^b), and τ_c (b = 1) multiplies g(χ) by χ(c)^(−1); Inside the characteristic-zero cyclotomic field L = Q(ζ_{mp}), g(χ)^m is fixed by every τ_c and lies in Q(ζ_m) (Katre, Proposition 1(h)). This rational fixed-field conclusion is not asserted for an arbitrary positive-characteristic L.

The hypotheses are as follows. χ^m = 1, so the values of χ lie in μ_m ∪ {0} (MulChar.apply_mem_rootsOfUnity_of_pow_eq_one). σ is a ring automorphism of L fixing the prime field. The conjugation formula is the algebraic field-valued identity; the final Q(ζ_m) fixed-field consequence is specifically inside Q(ζ_{mp}), with characteristic zero and its cyclotomic Q-algebra structure.

A proof proceeds as follows. σ ∘ χ = χ^b: every nonzero value of χ is a power ζ_m^j and σ(ζ_m^j) = ζ_m^(bj) = (ζ_m^j)^b; at 0 both sides vanish (MulChar.pow_apply'). σ ∘ ψ = ψ.mulShift c: σ(ζ_p^t) = ζ_p^(ct) = ψ(c·x) for t = val Tr(x) (Tr is ZMod p-linear). By [Transport of Gauss sums along ring homomorphisms, and the shift identity](#FF1-gauss-sum-transport), σ(g(χ, ψ)) = g(χ^b, ψ.mulShift c) = (χ^b)(c)^(−1) g(χ^b, ψ) = χ(c)^(−b) g(χ^b, ψ). g(χ)^m: τ_c multiplies it by χ(c)^(−m) = 1, so it lies in the fixed field of {τ_c}, which is Q(ζ_m) inside Q(ζ_{mp}).

In particular, verify the following values and consequences.

- For p odd, m = 2, χ the quadratic character: σ_b with b odd fixes g(χ), and τ_c multiplies it by χ(c), recovering that g(χ)^2 = χ(−1)q is rational.
- Katre, Proposition 1(h), with b = 1 + m: g(χ)^m ∈ Q(ζ_m).

*Needs:* [Transport of Gauss sums along ring homomorphisms, and the shift identity](#FF1-gauss-sum-transport), `MulChar.apply_mem_rootsOfUnity_of_pow_eq_one`, `MulChar.pow_apply'`, [The canonical additive character of a finite field](#FF1-canonical-additive-character).

See [Katre](#source-8) — Proposition 1(h), p. 76.

### 1.2 Absolute values, orthogonality and elementary identities

<a id="FF1-gauss-sum-absolute-value"></a>

#### The absolute value of a complex Gauss sum

Let F be a finite field with q elements, χ : MulChar F ℂ nontrivial and ψ : AddChar F ℂ nontrivial. Then gaussSum χ ψ · conj(gaussSum χ ψ) = q, i.e. ‖gaussSum χ ψ‖ = √q. Degenerate cases (Mathlib values): gaussSum 1 ψ = −1 (ψ ≠ 1), gaussSum χ 1 = 0 (χ ≠ 1), gaussSum 1 1 = q − 1. Every Galois conjugate of a Gauss sum of nontrivial characters is again such a Gauss sum, so it is a q-Weil number of weight 1.

The hypotheses are as follows. χ ≠ 1 and ψ ≠ 1, complex values.

A proof proceeds as follows. conj(gaussSum χ ψ) = gaussSum χ⁻¹ ψ⁻¹ (star_gaussSum_eq). ψ is primitive (AddChar.IsPrimitive.of_ne_one), so gaussSum χ ψ · gaussSum χ⁻¹ ψ⁻¹ = q (gaussSum_mul_gaussSum_eq_card). Hence ‖g‖^2 = g·conj g = q (Complex.mul_conj), ‖g‖ = √q. Weil number: an automorphism σ of ℂ sends g(χ, ψ) to g(σ∘χ, σ∘ψ) with both characters still nontrivial ([Transport of Gauss sums along ring homomorphisms, and the shift identity](#FF1-gauss-sum-transport)).

In particular, verify the following values and consequences.

- Quadratic Gauss sum over F_p: ‖Σ_a (a/p) e^(2πia/p)‖ = √p; Conrad's closed form √p or i√p.
- The degenerate values show the hypotheses are needed: ‖gaussSum 1 ψ‖ = 1 ≠ √q for q > 1.

*Needs:* `star_gaussSum_eq`, `gaussSum_mul_gaussSum_eq_card`, `AddChar.IsPrimitive.of_ne_one`, `gaussSum_one_left`, `gaussSum_one_right`, `gaussSum_one_one`, [Transport of Gauss sums along ring homomorphisms, and the shift identity](#FF1-gauss-sum-transport).

See [Kowalski](#source-4) — Proposition 2.4, printed p. 18; [Conrad, L-functions](#source-6) — §1 (1), p. 1.

<a id="FF1-jacobi-sum-absolute-value"></a>

#### The absolute value of a complex Jacobi sum

Let F be a finite field with q elements and χ, φ : MulChar F ℂ with χ, φ and χφ nontrivial. Then ‖jacobiSum χ φ‖ = √q. If χ, φ ≠ 1 but χφ = 1, then jacobiSum χ φ = −χ(−1) has absolute value 1; jacobiSum 1 χ = −1 (χ ≠ 1); jacobiSum 1 1 = q − 2.

The hypotheses are as follows. χ, φ, χφ nontrivial, complex values.

A proof proceeds as follows. jacobiSum χ φ = gaussSum χ ψ · gaussSum φ ψ / gaussSum (χφ) ψ for ψ = ψ_F primitive (jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum, (q : ℂ) ≠ 0). Each Gauss sum has absolute value √q ([The absolute value of a complex Gauss sum](#FF1-gauss-sum-absolute-value)), so the quotient has absolute value √q·√q/√q. Degenerate cases: jacobiSum_nontrivial_inv, jacobiSum_one_nontrivial, jacobiSum_one_one.

In particular, verify the following values and consequences.

- Fermat's two-squares theorem (Kowalski, Theorem 2.15): for p ≡ 1 (mod 4), χ of order 4 and η quadratic, J(χ, η) = a + bi with a² + b² = p.

*Needs:* [The absolute value of a complex Gauss sum](#FF1-gauss-sum-absolute-value), [The canonical additive character of a finite field](#FF1-canonical-additive-character), `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`, `jacobiSum_nontrivial_inv`, `jacobiSum_one_nontrivial`, `jacobiSum_one_one`.

See [Kowalski](#source-4) — Proposition 2.13, printed p. 23; [Conrad, Gauss–Jacobi](#source-5) — Corollary 2.5 and Theorem 2.6, pp. 3–4.

<a id="FF1-mulchar-column-orthogonality"></a>

#### Column orthogonality for multiplicative characters of a finite field

Let F be a finite field with q elements and R a domain with HasEnoughRootsOfUnity R (q − 1) (e.g. ℂ, or a ring of integers containing μ_(q−1)). For every a ∈ F: Σ_{χ : MulChar F R} χ(a) = q − 1 if a = 1 and 0 otherwise (in particular the sum is 0 at a = 0, every χ vanishing there); and for b ≠ 0, Σ_χ χ(a)·χ(b)⁻¹ = (q − 1)·[a = b].

The hypotheses are as follows. R a domain containing a primitive (q − 1)-th root of unity (the exponent of Fˣ divides q − 1). Mathlib's convention χ(0) = 0 for all χ, so the a = 0 case is not the classical one (with ε(0) = 1 the sum at 0 would be 1).

A proof proceeds as follows. Transport along MulChar.equivToUnitHom : MulChar F R ≃ (Fˣ →* Rˣ); for a = u a unit, χ(u) = (equivToUnitHom χ)(u) (MulChar.coe_equivToUnitHom). Apply Tau Ceti's CommGroup.sum_monoidHom_apply_eq_ite to G = Fˣ: Σ_{χ : Fˣ →* Rˣ} χ(g) = Nat.card G · [g = 1] = (q − 1)·[g = 1]. At a = 0: every term is χ(0) = 0 (MulChar.map_nonunit). The tagged form is TauCeti's CommGroup.sum_inv_mul_monoidHom_apply_eq_ite with σ = b.

In particular, verify the following values and consequences.

- Σ_χ χ(−1) = 0 in odd characteristic (−1 ≠ 1), and equals q − 1 in characteristic 2 (−1 = 1). In particular it is 1 for F₂ but 3 for F₄ with complex values; q > 2 alone is not a valid vanishing guard.
- Σ_χ χ(0) = 0.

*Needs:* `CommGroup.sum_monoidHom_apply_eq_ite`, `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`, `MulChar.equivToUnitHom`, `MulChar.coe_equivToUnitHom`, `MulChar.map_nonunit`.

See [Kowalski](#source-4) — (1.6), printed p. 12.

<a id="FF1-power-count-via-characters"></a>

#### Counting d-th roots with multiplicative characters

Let F be a finite field with q elements, d ∣ q − 1, and R a domain of characteristic zero with HasEnoughRootsOfUnity R (q − 1). For every x ∈ F (including x = 0): #{y ∈ F : y^d = x} = Σ_{χ : MulChar F R, χ^d = 1} classicalValue χ x. For x ≠ 0 this reads Σ_{χ^d = 1} χ(x) = d·[x is a d-th power], and in Mathlib's convention the right side at x = 0 is 0, not 1: the formula needs the classical value of the trivial character.

The hypotheses are as follows. d ∣ q − 1; characteristic zero so that the count is faithfully represented in R.

A proof proceeds as follows. x ≠ 0: the characters with χ^d = 1 are the characters of Fˣ/(Fˣ)^d (MulChar.subgroupOrderIsoSubgroupMulChar: the annihilator of the subgroup of d-th powers), a group of order d; column orthogonality on the quotient ([Column orthogonality for multiplicative characters of a finite field](#FF1-mulchar-column-orthogonality) applied to Fˣ/(Fˣ)^d) gives Σ_{χ^d=1} χ(x) = d·[x ∈ (Fˣ)^d]. x ≠ 0: the d-th power map on the cyclic group Fˣ of order q − 1 has kernel of order d (d ∣ q − 1), so x has d preimages if it is a d-th power and none otherwise. x = 0: the only y with y^d = 0 is 0, so the left side is 1; on the right only χ = 1 contributes, with classicalValue 1 0 = 1 ([Trivial-character and normalisation conventions for Gauss and Jacobi sums](#FF1-trivial-character-conventions)).

In particular, verify the following values and consequences.

- d = 2, q odd: #{y : y^2 = x} = 1 + η^cl(x) with η the quadratic character (used in the duplication formula).
- x = 0: both sides are 1; with Mathlib's MulChar values instead of classicalValue the right side would be 0.

*Needs:* [Column orthogonality for multiplicative characters of a finite field](#FF1-mulchar-column-orthogonality), [Trivial-character and normalisation conventions for Gauss and Jacobi sums](#FF1-trivial-character-conventions), `MulChar.subgroupOrderIsoSubgroupMulChar`.

See [Kowalski](#source-4) — (1.7) and (1.8), printed p. 15.

<a id="FF1-fourier-expansion-of-multiplicative-character"></a>

#### Fourier expansion of a multiplicative character and the Gauss-sum normalisation

Let F be a finite field with q elements, ψ : AddChar F ℂ nontrivial, χ : MulChar F ℂ nontrivial, and identify the dual of (F, +) with F by a ↦ ψ_a := ψ.mulShift a ([Every additive character is a multiplicative shift of a primitive one](#FF1-additive-characters-are-shifts)). With the normalised Fourier transform of AdditiveCombinatorics:AC.0, f̂(φ) = (1/|G|) Σ_x f(x)·conj φ(x), one has χ̂(ψ_a) = (1/q)·χ⁻¹(−a)·gaussSum χ ψ for every a ∈ F (0 at a = 0), and Fourier inversion gives χ(x) = (gaussSum χ ψ / q)·Σ_{a ∈ F} χ⁻¹(−a) ψ(ax) for every x ∈ F. The unnormalised coefficient Σ_x χ(x) conj ψ_a(x) = gaussSum χ (ψ.mulShift (−a)) is q times the normalised one: Gauss sums are unnormalised Fourier coefficients.

The hypotheses are as follows. χ ≠ 1, ψ ≠ 1, complex values; AC.0 supplies the normalised transform and its inversion formula for finite abelian groups.

A proof proceeds as follows. conj ψ_a(x) = ψ(−ax) (AddChar.starComp_eq_inv, AddChar.inv_mulShift), so q·χ̂(ψ_a) = Σ_x χ(x)ψ(−ax) = gaussSum χ (ψ.mulShift (−a)). For a ≠ 0 the shift identity ([Transport of Gauss sums along ring homomorphisms, and the shift identity](#FF1-gauss-sum-transport)) gives gaussSum χ (ψ.mulShift (−a)) = χ⁻¹(−a) gaussSum χ ψ; for a = 0 the sum is Σ χ = 0 (MulChar.sum_eq_zero_of_ne_one), matching χ⁻¹(0) = 0. Fourier inversion f = Σ_φ f̂(φ) φ over the dual (AdditiveCombinatorics:AC.0), reindexed by a ↦ ψ_a, gives the expansion. Check against Parseval: Σ_a |χ̂(ψ_a)|² = (q − 1)·q/q² = (q − 1)/q = (1/q)Σ_x |χ(x)|², using ‖gaussSum‖² = q ([The absolute value of a complex Gauss sum](#FF1-gauss-sum-absolute-value)).

In particular, verify the following values and consequences.

- For F = F_p, ψ = e(·/p) and χ the Legendre symbol: (x/p) = (g/p)·Σ_a (−a/p) e(ax/p), with g the quadratic Gauss sum.
- At x = 0 both sides vanish.

*Needs:* `AdditiveCombinatorics:AC.0/fourier-transform`, `AdditiveCombinatorics:AC.0/fourier-parseval`, [Fourier inversion and Parseval in field coordinates](#FF1-finite-field-fourier-transport), [Every additive character is a multiplicative shift of a primitive one](#FF1-additive-characters-are-shifts), [Transport of Gauss sums along ring homomorphisms, and the shift identity](#FF1-gauss-sum-transport), [The absolute value of a complex Gauss sum](#FF1-gauss-sum-absolute-value), `AddChar.starComp_eq_inv`, `AddChar.inv_mulShift`, `MulChar.sum_eq_zero_of_ne_one`, `gaussSum_mulShift_eq`.

See [Kowalski](#source-4) — Proposition 1.10, printed p. 12; [Kowalski](#source-4) — (2.2), printed p. 17.

<a id="FF1-gauss-sum-frobenius-invariance"></a>

#### Frobenius invariance of Gauss sums with a trace character

Let F be a finite field of characteristic p, R a commutative ring, χ : MulChar F R and ψ : AddChar F R with ψ(x^p) = ψ(x) for all x (every trace character traceAddChar F p ζ, in particular ψ_F, has this property). Then gaussSum (χ^p) ψ = gaussSum χ ψ, and hence gaussSum (χ^(p^i)) ψ = gaussSum χ ψ for all i. This is distinct from Mathlib's gaussSum_frob, which raises the Gauss sum itself to the p-th power in a target of characteristic p.

The hypotheses are as follows. ψ Frobenius-invariant; no hypothesis on χ.

A proof proceeds as follows. (χ^p)(x) = χ(x)^p = χ(x^p) (MulChar.pow_apply' with p ≠ 0, multiplicativity). x ↦ x^p is a bijection of the finite field F (frobenius is injective, F finite), so Σ_x χ(x^p)ψ(x) = Σ_y χ(y)ψ(y^(1/p)) and ψ(y^(1/p)) = ψ(y) by invariance. Trace characters are invariant: Tr(x^p) = Tr(x) ([The canonical additive character of a finite field](#FF1-canonical-additive-character), canonicalAddChar_frobenius).

In particular, verify the following values and consequences.

- If χ^(p−1) = 1 then χ^p = χ and the statement is trivial; for q = p^f with f ≥ 2 and χ of order q − 1 it identifies the Gauss sums of the distinct characters χ, χ^p, …, χ^(p^(f−1)).
- Katre, Lemma 2(d): s(pα) = s(α) for the valuations of Teichmüller Gauss sums.

*Needs:* `MulChar.pow_apply'`, `frobenius`, `gaussSum`, [The canonical additive character of a finite field](#FF1-canonical-additive-character).

See [Katre](#source-8) — Proposition 1(i), pp. 76–77; [Conrad, Stickelberger](#source-7) — Proof of Theorem 1, p. 5.

<a id="FF1-gauss-sum-duplication-formula"></a>

#### The duplication formula for Gauss sums

Let F be a finite field of odd order q, η its quadratic character and ψ a nontrivial additive character, all with values in ℂ. For every multiplicative character χ: gaussSum (χ^2) ψ · gaussSum η ψ = χ(4) · gaussSum χ ψ · gaussSum (χη) ψ. This is the case n = 2 of the Hasse–Davenport product relation ([The Hasse–Davenport product relation](#FF1-hasse-davenport-product-relation)), with an elementary proof through Jacobi sums.

The hypotheses are as follows. q odd; ψ ≠ 1; values in ℂ (any field of characteristic ≠ p containing the values works).

A proof proceeds as follows. χ = 1 and χ = η are tautologies (η(4) = η(2)^2 = 1). Otherwise χ^2 ≠ 1 and χη ≠ 1. jacobiSum_mul_nontrivial gives g(χ)^2 = g(χ^2)·J(χ, χ). J(χ, χ) = Σ_x χ(x(1 − x)) = Σ_y χ(y)·#{x : x − x² = y} = Σ_y χ(y)(1 + η^cl(1 − 4y)), since x − x² = y has as many solutions as Δ² = 1 − 4y (q odd; [Counting d-th roots with multiplicative characters](#FF1-power-count-via-characters) with d = 2). Σ_y χ(y) = 0 (MulChar.sum_eq_zero_of_ne_one), and substituting y = z/4 gives Σ_y χ(y)η(1 − 4y) = χ(4)^(−1) J(χ, η). J(χ, η) = g(χ)g(η)/g(χη) (jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum; χη ≠ 1). Combine and cancel g(χ) ≠ 0 (gaussSum_ne_zero_of_nontrivial).

In particular, verify the following values and consequences.

- χ = η: both sides equal g(1)·g(η) = −g(η) (Conrad, footnote 8).
- For χ of order 4 (q ≡ 1 mod 4): χ² = η and the formula reads g(η)² = χ(4)·g(χ)·g(χ³); both sides have absolute value q.

*Needs:* [Counting d-th roots with multiplicative characters](#FF1-power-count-via-characters), `jacobiSum_mul_nontrivial`, `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`, `gaussSum_ne_zero_of_nontrivial`, `MulChar.sum_eq_zero_of_ne_one`, `quadraticChar`.

See [Kowalski](#source-4) — Proposition 2.17, printed p. 25; [Conrad, Gauss–Jacobi](#source-5) — (A.5), p. 19.

### 1.3 Fourier analysis in field coordinates

<a id="FF1-finite-field-fourier-transport"></a>

#### Fourier inversion and Parseval in field coordinates

Put e(a)=ψ.mulShift a, so e(a)(x)=ψ(ax). With C_f(a)=(AddChar.complexBasis F).repr(f)(e(a)), for every f,g:F→ℂ and x∈F simultaneously ∑a C_f(a)ψ(ax)=f(x) and q⁻¹∑y f(y)conj(g(y))=∑a C_f(a)conj(C_g(a)). Here C_f(a)=q⁻¹∑y f(y)conj(ψ(ay)).

The hypotheses are as follows. F is a finite field with q=#F; all additive and multiplicative characters take values in ℂ. Multiplicative characters, including 1, are zero on nonunits. ψ is primitive; over a field this means ψ is nontrivial.

A proof proceeds as follows. Use the earlier additive-characters-are-shifts bijection a↦ψ_a on the actual additive group (F,+). Native shift injectivity and AddChar.card_eq verify both domain and dual cardinality q. Construct a local indexing equivalence from that bijection; do not define a second dual object. Import AC.0/fourier-transform and its fourier_eq_basis_repr and fourier_inversion_reindex APIs. Reindex the dual sum by e. The normalization is q⁻¹ on the transform only, and the inversion kernel has positive sign ψ(ax). Import AC.0/fourier-parseval and apply the same bijection to both coefficients. This proves the simultaneous identities without using a cyclic Fourier transform or an equivalence with ZMod q.

In particular, verify the following values and consequences.

- For δ_b, C(a)=q⁻¹conj(ψ(ab)); inversion gives δ_b and Parseval gives q⁻¹. For f=1 only a=0 survives with coefficient 1.
- Use F₄: its additive group is (Z/2Z)², so a cyclic ZMod 4 transform cannot satisfy this character parametrisation.
- The multiplicative-character Fourier expansion imports the exact AC.0 transform and Parseval targets through this finite-field transport.

*Needs:* [Every additive character is a multiplicative shift of a primitive one](#FF1-additive-characters-are-shifts), `AdditiveCombinatorics:AC.0/fourier-transform`, `AdditiveCombinatorics:AC.0/fourier-parseval`, `AddChar.to_mulShift_inj_of_isPrimitive`, `AddChar.card_eq`, `AddChar.complexBasis`, `AddChar.complexBasis_apply`.

See [Kowalski](#source-4) — Proposition 1.10, pp.12–13, and Proposition 1.13, p.14.

<a id="FF1-multiplicative-fourier-boundary-coefficients"></a>

#### Fourier coefficients with the trivial-character boundary

For every χ and a∈F, C_χ(a)=q⁻¹∑x χ(x)conj(ψ(ax)) equals (q−1)/q if a=0 and χ=1, equals 0 if a=0 and χ≠1, and equals q⁻¹χ⁻¹(−a)g(χ,ψ) if a≠0.

The hypotheses are as follows. F is a finite field with q=#F; all additive and multiplicative characters take values in ℂ. Multiplicative characters, including 1, are zero on nonunits. ψ is primitive.

A proof proceeds as follows. Use the owner Fourier definition and its native-basis-coordinate comparison. Complex additive character conjugation replaces ψ(ax) by ψ(−ax). For a=0 use MulChar.sum_eq_zero_of_ne_one or MulChar.sum_one_eq_card_units. A field has q−1 units; its trivial character is not the constant function 1 on F. For a≠0 use the unit −a in gaussSum_mulShift_eq. This covers χ=1 as well: g(1,ψ)=−1, hence nonzero coefficients are −1/q. For χ≠1 this specializes to the multiplicative-character Fourier expansion; the boundary API also covers χ=1.

In particular, verify the following values and consequences.

- For χ=1 and a=0 the answer is (q−1)/q, not 0.
- For χ=1 and a≠0 the answer is −1/q; inversion recovers 0 at x=0 and 1 at every unit.
- For a nontrivial χ, a=0 gives 0; the sign in χ⁻¹(−a) is tested by δ and the chosen ψ, rather than absorbed into a changed transform convention.

*Needs:* [Fourier inversion and Parseval in field coordinates](#FF1-finite-field-fourier-transport), [Trivial-character and normalisation conventions for Gauss and Jacobi sums](#FF1-trivial-character-conventions), `AdditiveCombinatorics:AC.0/fourier-transform`, `gaussSum_mulShift_eq`, `gaussSum_one_left`, `MulChar.sum_eq_zero_of_ne_one`, `MulChar.sum_one_eq_card_units`.

See [Kowalski](#source-4) — Proposition 1.10, pp.12–13; multiplicative zero convention p.15; §2.1 Gauss transport.

### 1.4 Projective polynomial evaluation and interpolation

<a id="FF1-projective-polynomial-evaluation"></a>

#### Evaluation of a prescribed-degree binary form

For d≥0 and x:Option F define an F-linear map E_d(x):Polynomial.degreeLT F(d+1)→F. E_d(some a,P)=P(a), E_d(none,P)=coeff_d(P). Option F labels the standard representatives [a:1] and [1:0]. It is the evaluation of ∑_{i≤d}coeff_i(P)X^i Z^{d−i} in these representatives, not a coordinate-independent scalar on arbitrary representatives.

The hypotheses are as follows. F is a finite field with q=#F; all additive and multiplicative characters take values in ℂ. Multiplicative characters, including 1, are zero on nonunits. The ambient degree d is part of the data, even when degree P<d.

A proof proceeds as follows. Use the existing native degreeLT submodule; compose its inclusion with Polynomial.leval a at finite points and Polynomial.lcoeff F d at infinity. These are already linear maps, so the constructor has the required algebraic structure. For the homogeneous interpretation substitute (a,1) or (1,0) in the displayed degree-d homogenization. No projective-space or binary-form carrier is introduced. The native coefficient equivalence gives the monomial formula. Addition and scalar compatibility are native linear-map laws; the degree-lowering assertion follows from coefficient vanishing. These routine API computations stay inside this target-level node.

Provide the following interface.

- `TauCeti.FiniteFieldSums.projectiveEval_some`: At some a the linear map agrees with Polynomial.leval a on the underlying polynomial: E_d(some a,P)=P.eval a.
- `TauCeti.FiniteFieldSums.projectiveEval_none`: At none the linear map agrees with Polynomial.lcoeff F d: E_d(none,P)=P.coeff d.
- `TauCeti.FiniteFieldSums.projectiveEval_monomial`: For i:Fin(d+1), E_d(x,cX^i)=c·a^i at x=some a, and equals c if i=d, otherwise 0, at x=none.
- `TauCeti.FiniteFieldSums.projectiveEval_add`: E_d(x,P+Q)=E_d(x,P)+E_d(x,Q).
- `TauCeti.FiniteFieldSums.projectiveEval_smul`: E_d(x,cP)=c E_d(x,P).
- `TauCeti.FiniteFieldSums.projectiveEval_of_degree_lt`: If degree P<d, E_d(none,P)=0, including the zero polynomial.

**Checks.**

- `projectiveEvalTests.lower_degree_infinity`: Over ZMod 3 at d=2, E₂(none,X)=0. Polynomial.leadingCoeff would give 1 and fails.
- `projectiveEvalTests.top_degree_infinity`: Over ZMod 3 at d=2, E₂(none,X²)=1; an always-zero infinity rule fails.
- `projectiveEvalTests.degree_zero_constant`: For every c∈F, E₀(none,c)=c; degree zero is supported by the definition.
- `projectiveEvalTests.finite_zero_constant`: For every d and P, E_d(some 0,P)=P.coeff 0, agreeing with native evaluation.
- `projectiveEvalTests.finite_nonzero_linear`: Over ZMod 3 at d=2, E₂(some 2,X)=2. A rule evaluating every finite point at zero fails.


In particular, verify the following values and consequences.

- Each of the five named tests is included as an example in the suggested file.
- Changing representatives by λ≠0 scales the section value by λ^d. Consequently the fixed chart is stated explicitly; no canonical scalar evaluation on P¹ is asserted.

*Needs:* `Polynomial.degreeLT`, `Polynomial.degreeLTEquiv`, `Polynomial.monomial_coe_mem_degreeLT`, `Polynomial.leval`, `Polynomial.lcoeff`.

See [Bergström–Faber–Payne](#source-34) — Lemma 5.2 proof, arXiv v2 pp.8–9, the sums over P¹(F_q) and over all polynomials of degree at most d.

<a id="FF1-projective-two-evaluation-uniform"></a>

#### Uniform two-evaluation fibres

For d≥1 and distinct x,y:Option F, the map P↦(E_d(x,P),E_d(y,P)) from Polynomial.degreeLT F(d+1) to F×F is surjective. For every u,v∈F its fibre has cardinality q^{d−1}.

The hypotheses are as follows. F is a finite field with q=#F; all additive and multiplicative characters take values in ℂ. Multiplicative characters, including 1, are zero on nonunits. d≥1 and x≠y.

A proof proceeds as follows. Use Polynomial.degreeLTEquiv to identify a polynomial with its d+1 coefficients. This provides the finite enumeration, without defining another vector-space carrier. If x=some a and y=some b, fix all coefficients except a₀,a₁. The two residual equations have determinant b−a≠0 and have a unique solution. The remaining d−1 coordinates give a bijection of each fibre with F^{d−1}. If exactly one point is infinity, fix a_d to its prescribed value. Fix all coordinates except a₀,a_d, and solve a₀ from the finite evaluation. Again there are d−1 free coordinates. If infinity comes first, swap the two target coordinates. Distinctness excludes the two-infinity case. The explicit coefficient bijections prove both existence and cardinality. No general multivariate or scheme interpolation theorem is required.

In particular, verify the following values and consequences.

- At d=1 every fibre is a singleton, including the pair (some 0,none).
- Over F₃ at d=2 the pair (some 0,none) has exactly 3 polynomials for each prescribed pair of values.
- d=0 is excluded: constants give a diagonal image. x=y is excluded even for d≥1, since unequal prescribed values cannot be interpolated.

*Needs:* [Evaluation of a prescribed-degree binary form](#FF1-projective-polynomial-evaluation), `Polynomial.degreeLTEquiv`.

See [Bergström–Faber–Payne](#source-34) — Lemma 5.2 proof, arXiv v2 pp.8–9, interpolation sentence.

<a id="FF1-projective-two-point-character-sum"></a>

#### Two-point character orthogonality for all polynomials

For d≥1, x≠y and χ≠1, ∑_{P∈Polynomial.degreeLT F(d+1)}χ(E_d(x,P))φ(E_d(y,P))=0 for every φ. The accompanying declaration projectiveEval_character_correlation_all states the stronger identity, without χ≠1: this sum is q^{d−1}(∑uχ(u))(∑vφ(v)).

The hypotheses are as follows. F is a finite field with q=#F; all additive and multiplicative characters take values in ℂ. Multiplicative characters, including 1, are zero on nonunits. d≥1 and x,y:Option F are distinct. For vanishing χ is nontrivial; φ can be trivial. No monic or squarefree restriction and no conjugation in the product.

A proof proceeds as follows. Partition the finite coefficient space by the two evaluation values. Use projective-two-evaluation-uniform to give every fibre multiplicity q^{d−1}. Factor the double finite sum to obtain the all-character identity. Then apply the existing MulChar.sum_eq_zero_of_ne_one to χ. This supplies the target from the exact native row-orthogonality owner. For the source’s odd-q quadratic character extend by zero and transport its integer values to ℂ. The sum vanishes for each ordered distinct pair, hence summing over those pairs gives the BFP interpolation total for d≥2. The squarefree induction and the hyperelliptic automorphism-weighted moment remain in the paper’s other owners.

In particular, verify the following values and consequences.

- For χ=φ=1 the all-character sum is q^{d−1}(q−1)², so a zero claim without nontriviality is false.
- For d=1, x=some 0 and y=none, coefficient pairs enumerate F² once and give (∑χ)(∑φ).
- For odd q and its nontrivial quadratic χ, the all-polynomial distinct-pair total in BFP is zero. The theorem itself remains valid in characteristic two for any available nontrivial χ; F₂ has none.
- Do not sum over squarefree or monic polynomials; those restrictions destroy the equal-fibre argument.

Additional proposed signatures: `TauCeti.FiniteFieldSums.projectiveEval_character_correlation_all`.

*Needs:* [Uniform two-evaluation fibres](#FF1-projective-two-evaluation-uniform), [Evaluation of a prescribed-degree binary form](#FF1-projective-polynomial-evaluation), `MulChar.sum_eq_zero_of_ne_one`, `MulChar.sum_one_eq_card_units`.

See [Bergström–Faber–Payne](#source-34) — Lemma 5.2 proof, arXiv v2 pp.8–9, all-polynomial interpolation total.

### 1.5 The Hasse–Davenport lifting relation

<a id="FF1-hasse-davenport-weight"></a>

#### The Gauss-sum weight on monic polynomials

Let F be a finite field, R a commutative ring, χ : MulChar F R and ψ : AddChar F R. For a monic polynomial f = X^s + a_(s−1)X^(s−1) + ⋯ + a_0 ∈ F[X] put λ_{χ,ψ}(f) := χ((−1)^s a_0)·ψ(−a_(s−1)) = χ((−1)^(natDegree f)·f.coeff 0)·ψ(−f.nextCoeff) (hdWeight χ ψ f). Then λ(1) = 1 and λ is completely multiplicative on monic polynomials: λ(fg) = λ(f)λ(g); on linear polynomials λ(X − c) = χ(c)ψ(c); λ(X) = χ(0) = 0 for every χ (Mathlib's convention); and for a monic irreducible P of degree d with a root α in an extension of degree d, λ(P) = χ(N(α))·ψ(Tr(α)), norm and trace from F(α) to F.

The hypotheses are as follows. F finite, R commutative; f monic (the formula is applied only to monic polynomials). Pinned convention: the constant term enters as (−1)^s a_0 (the product of the roots) and the next coefficient as −a_(s−1) (the sum of the roots).

A proof proceeds as follows. λ(1) = χ(1)·ψ(0) = 1 (natDegree 1 = 0, nextCoeff 1 = 0). Multiplicativity: for monic f, g of degrees s, t, (−1)^(s+t)(fg)(0) = ((−1)^s f(0))((−1)^t g(0)) and nextCoeff(fg) = nextCoeff f + nextCoeff g (Polynomial.Monic.nextCoeff_mul); χ is multiplicative and ψ turns sums into products. Linear: natDegree (X − C c) = 1, coeff 0 = −c, nextCoeff = −c (Polynomial.nextCoeff_X_sub_C), so λ = χ(c)ψ(c). Irreducible: if P is the minimal polynomial of α, then Tr(α) = −nextCoeff P and N(α) = (−1)^d P(0) (PowerBasis.trace_gen_eq_nextCoeff_minpoly, Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly; Kowalski, Lemma 1.5).

Provide the following interface.

- `hdWeight`: hdWeight χ ψ f := χ((−1)^(natDegree f) · coeff f 0) · ψ(−nextCoeff f).
- `hdWeight_one`: hdWeight χ ψ 1 = 1.
- `hdWeight_mul`: For monic f, g: hdWeight χ ψ (f * g) = hdWeight χ ψ f * hdWeight χ ψ g.
- `hdWeight_X_sub_C`: hdWeight χ ψ (X − C c) = χ c * ψ c.
- `hdWeight_X`: hdWeight χ ψ X = 0.
- `hdWeight_pow`: For monic f: hdWeight χ ψ (f^k) = (hdWeight χ ψ f)^k.
- `hdWeight_minpoly`: For α in a finite extension E of F: hdWeight χ ψ (minpoly F α) = χ(N_{F(α)/F} α) ψ(Tr_{F(α)/F} α).

**Checks.**

- `test_hdWeight_linear`: hdWeight χ ψ (X − C c) = χ c * ψ c.
- `test_hdWeight_one`: hdWeight χ ψ 1 = 1.
- `test_hdWeight_X`: hdWeight 1 ψ X = 0: the trivial character contributes 0 at the root 0 (a definition with ε(0) = 1 would give 1).
- `test_hdWeight_X2_add_one`: Over ZMod 3: hdWeight χ ψ (X^2 + 1) = 1 for all χ, ψ (constant term 1, next coefficient 0).
- `test_hdWeight_trivial`: hdWeight 1 1 f = 1 if coeff f 0 ≠ 0 and 0 otherwise.


In particular, verify the following values and consequences.

- λ(X − c) = χ(c)ψ(c), so Σ_{c ∈ F} λ(X − c) = gaussSum χ ψ.
- λ(X) = 0 for every χ, including χ = 1; under the classical convention ε(0) = 1 the weight of X would be 1 and the orbit identity would count α = 0 with the wrong weight.

*Needs:* `Polynomial.nextCoeff`, `Polynomial.Monic.nextCoeff_mul`, `Polynomial.nextCoeff_X_sub_C`, `PowerBasis.trace_gen_eq_nextCoeff_minpoly`, `Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly`, `MulChar`.

See [Kowalski](#source-4) — Lemma 1.5, printed p. 10; [Conrad, L-functions](#source-6) — Remark after Theorem 3.1, p. 4.

<a id="FF1-hasse-davenport-degree-sums"></a>

#### The degree sums of the Gauss-sum weight

Let F be a finite field with q elements, R a domain, χ : MulChar F R and ψ : AddChar F R with χ ≠ 1 or ψ ≠ 1. Let S_s := Σ_{f monic, deg f = s} λ_{χ,ψ}(f). Then S_0 = 1, S_1 = gaussSum χ ψ and S_s = 0 for every s ≥ 2.

The hypotheses are as follows. χ ≠ 1 or ψ ≠ 1; R a domain (for the vanishing of character sums). Monic polynomials of degree s are enumerated by coefficient vectors F^s (monicOfCoeffs).

A proof proceeds as follows. S_0: the only monic polynomial of degree 0 is 1, of weight 1. S_1: f = X − c, c ∈ F, weight χ(c)ψ(c); the sum is gaussSum χ ψ ([The Gauss-sum weight on monic polynomials](#FF1-hasse-davenport-weight), hdWeight_X_sub_C). s ≥ 2: writing f = X^s + Σ_{i<s} a_i X^i, the weight is χ((−1)^s a_0)·ψ(−a_(s−1)) with a_0 and a_(s−1) distinct coordinates; summing over the coordinates, S_s = q^(s−2)·(Σ_a χ((−1)^s a))·(Σ_b ψ(−b)), and one of the two sums is 0 (MulChar.sum_eq_zero_of_ne_one, AddChar.sum_eq_zero_of_ne_one; the maps a ↦ ±a, b ↦ −b are bijections).

In particular, verify the following values and consequences.

- For χ = ψ = 1 and s ≥ 1, S_s is the natural count q^(s−1)(q−1) cast into R (S_0 = 1 separately). This count is nonzero in characteristic zero, showing why the nontrivial-character hypothesis cannot be dropped in general. It can vanish in a positive-characteristic domain, so no unconditional nonzero claim is made for arbitrary R.
- S_1 = gaussSum χ ψ.

*Needs:* [The Gauss-sum weight on monic polynomials](#FF1-hasse-davenport-weight), `MulChar.sum_eq_zero_of_ne_one`, `AddChar.sum_eq_zero_of_ne_one`, `gaussSum`.

See [Conrad, L-functions](#source-6) — Theorem 2.1 and (2.1), pp. 1–2.

<a id="FF1-polynomial-euler-product-recurrence"></a>

#### The logarithmic-derivative recurrence for multiplicative weights on monic polynomials

Let F be a finite field, R a commutative ring and w a function on monic polynomials over F with values in R that is completely multiplicative (w(1) = 1, w(fg) = w(f)w(g)). Put S_s := Σ_{f monic, deg f = s} w(f) and N_k := Σ_{d ∣ k} Σ_{P monic irreducible, deg P = d} d·w(P)^(k/d). Then for every s ≥ 1: s·S_s = Σ_{k=1}^{s} N_k·S_(s−k). This is the coefficient form, with no division, of the identity u·L'(u)/L(u) = Σ_k N_k u^k for L(u) = Σ_s S_s u^s = ∏_P (1 − w(P)u^(deg P))^(−1).

The hypotheses are as follows. No hypothesis on R: the identity holds with s·S_s the natural-number multiple (nsmul).

A proof proceeds as follows. Polynomial von Mangoldt function: for monic h put Λ(h) = deg P if h = P^j with P monic irreducible and j ≥ 1, and Λ(h) = 0 otherwise. For monic f, deg f = Σ_{h monic, h ∣ f} Λ(h): by unique factorisation (UniqueFactorizationMonoid.normalizedFactors), the prime powers P^j dividing f are those with j ≤ v_P(f), and Σ_P v_P(f)·deg P = deg f. Then s·S_s = Σ_{deg f = s} w(f) Σ_{h ∣ f} Λ(h) = Σ_{deg h + deg g = s} Λ(h)w(h)w(g), writing f = h·g and using multiplicativity; grouping by k = deg h gives Σ_{k=1}^{s} (Σ_{deg h = k} Λ(h)w(h))·S_(s−k). Σ_{deg h = k} Λ(h)w(h) = Σ_{d ∣ k} Σ_{deg P = d} d·w(P^(k/d)) = N_k (the prime powers of degree k are P^(k/d) with deg P = d ∣ k). For w ≡ 1 this reads s·q^s = Σ_k N_k q^(s−k) with N_k = Σ_{d∣k} d·π_q(d) = q^k (Shoup, Theorem 19.11), a consistency check with Layer 3's count of irreducible polynomials.

In particular, verify the following values and consequences.

- w ≡ 1: N_k = q^k and the recurrence is s·q^s = Σ_{k=1}^{s} q^k q^(s−k).
- w = λ_{χ,ψ}: combined with the degree sums, N_s = (−1)^(s−1) g^s (Hasse–Davenport).

*Needs:* `UniqueFactorizationMonoid.normalizedFactors`, `Polynomial.Monic`, `Irreducible`.

See [Conrad, L-functions](#source-6) — Proof of Theorem 3.1, p. 3; [Kowalski](#source-4) — Proposition 4.5(1), printed p. 40.

<a id="FF1-hasse-davenport-orbit-sum"></a>

#### The prime-power sum of the Gauss-sum weight is a lifted Gauss sum

Let F be a finite field, E a finite extension of degree k ≥ 1, R a commutative ring, χ : MulChar F R and ψ : AddChar F R. With N_k := Σ_{d ∣ k} Σ_{P monic irreducible, deg P = d} d·λ_{χ,ψ}(P)^(k/d): N_k = gaussSum (liftNorm E χ) (liftTrace E ψ) = Σ_{α ∈ E} χ(N_{E/F}(α))·ψ(Tr_{E/F}(α)).

The hypotheses are as follows. E any extension of degree k (the identity is invariant under F-algebra isomorphisms).

A proof proceeds as follows. Every α ∈ E has a minimal polynomial P_α over F, monic irreducible of degree d = [F(α) : F] dividing k; conversely a monic irreducible P of degree d ∣ k divides X^(q^k) − X (Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X), which splits into distinct linear factors over E (FiniteField.roots_X_pow_card_sub_X), so P has exactly d roots in E, forming one Frobenius orbit (TauCeti.FiniteField.orbit_eq_rootSet_minpoly). Hence Σ_{α ∈ E} G(α) = Σ_{d ∣ k} Σ_{deg P = d} Σ_{α root of P} G(α) for G(α) = χ(N_{E/F}α)ψ(Tr_{E/F}α). For a root α of P of degree d: N_{E/F}(α) = N_{F(α)/F}(N_{E/F(α)}(α)) = N_{F(α)/F}(α)^(k/d) and Tr_{E/F}(α) = (k/d)·Tr_{F(α)/F}(α) (Algebra.norm_norm, Algebra.trace_trace, Algebra.norm_algebraMap, Algebra.trace_algebraMap); so G(α) = χ(N(α))^(k/d) ψ(Tr(α))^(k/d) = λ(P)^(k/d) ([The Gauss-sum weight on monic polynomials](#FF1-hasse-davenport-weight), hdWeight_minpoly). Each of the d roots contributes the same value, giving d·λ(P)^(k/d). α = 0 has P = X, λ(X) = 0 = χ(N(0))ψ(0): consistent. Invariance: an F-algebra isomorphism E ≃ E' preserves norms and traces (Algebra.norm_eq_of_algEquiv, Algebra.trace_eq_of_algEquiv), hence the lifted Gauss sum.

In particular, verify the following values and consequences.

- k = 1 (E = F): N_1 = Σ_{c} λ(X − c) = gaussSum χ ψ.
- For χ = 1, ψ = 1: N_k = #(Eˣ) = q^k − 1.

*Needs:* [The Gauss-sum weight on monic polynomials](#FF1-hasse-davenport-weight), [The norm lift of a multiplicative character to an extension](#FF1-norm-lift-of-a-multiplicative-character), [The trace lift of an additive character to an extension](#FF1-trace-lift-of-an-additive-character), `Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X`, `FiniteField.roots_X_pow_card_sub_X`, `TauCeti.FiniteField.orbit_eq_rootSet_minpoly`, `Algebra.norm_norm`, `Algebra.trace_trace`, `Algebra.norm_algebraMap`, `Algebra.trace_algebraMap`, `Algebra.norm_eq_of_algEquiv`, `Algebra.trace_eq_of_algEquiv`.

See [Conrad, L-functions](#source-6) — (3.1) and the computation on p. 4.

<a id="FF1-hasse-davenport-lifting"></a>

#### The Hasse–Davenport lifting relation

Let F be a finite field, E an extension of degree n ≥ 1, R a domain, χ : MulChar F R and ψ : AddChar F R with χ ≠ 1 or ψ ≠ 1. Then −gaussSum (liftNorm E χ) (liftTrace E ψ) = (−gaussSum χ ψ)^n, i.e. G(χ∘N_{E/F}, ψ∘Tr_{E/F}) = (−1)^(n−1) G(χ, ψ)^n. With the canonical characters (liftTrace E ψ_F = ψ_E): −g_E(χ∘N, ψ_E) = (−g_F(χ, ψ_F))^n. The hypothesis cannot be omitted in general: over ℂ, for χ = ψ = 1, gaussSum 1 1 = q − 1 over F and q^n − 1 over E, and −(q^2 − 1) ≠ (1 − q)^2.

The hypotheses are as follows. χ ≠ 1 or ψ ≠ 1; R a domain; Mathlib's conventions (χ(0) = 0 for all χ). E is any finite extension of degree n; the result depends only on its isomorphism class over F. The displayed failure with both characters trivial is a characteristic-zero counterexample (e.g. complex values), not a universal inequality in every positive-characteristic value field/domain. The lifting theorem itself retains its stated value-ring hypotheses.

A proof proceeds as follows. By [The degree sums of the Gauss-sum weight](#FF1-hasse-davenport-degree-sums), S_0 = 1, S_1 = g := gaussSum χ ψ and S_s = 0 for s ≥ 2. The recurrence ([The logarithmic-derivative recurrence for multiplicative weights on monic polynomials](#FF1-polynomial-euler-product-recurrence)) at s = 1 gives N_1 = S_1 = g; at s ≥ 2 it gives 0 = s·S_s = N_s + N_(s−1)·g (the other terms contain S_j = 0 with j ≥ 2), so N_s = −g·N_(s−1), hence N_s = (−1)^(s−1) g^s for all s ≥ 1. By [The prime-power sum of the Gauss-sum weight is a lifted Gauss sum](#FF1-hasse-davenport-orbit-sum), N_n = gaussSum (liftNorm E χ) (liftTrace E ψ) for the given E of degree n. So gaussSum (liftNorm E χ) (liftTrace E ψ) = (−1)^(n−1) g^n, i.e. −G_E = (−g)^n.

In particular, verify the following values and consequences.

- n = 1: trivial.
- χ = 1, ψ ≠ 1: gaussSum 1 ψ = −1 over F and over E, and −(−1) = 1 = (−(−1))^n.
- Conrad, Gauss and Jacobi sums p. 19: for q = p^f odd and η the quadratic character, −G(η) = (−Σ_{a mod p} (a/p) e^(2πia/p))^f = (−1)^f √q (p ≡ 1 mod 4) or (−1)^f i^f √q (p ≡ 3 mod 4).
- Over ℂ: χ = ψ = 1, n = 2: −(q^2 − 1) ≠ (1 − q)^2, so the hypothesis cannot be dropped.

*Needs:* [The degree sums of the Gauss-sum weight](#FF1-hasse-davenport-degree-sums), [The logarithmic-derivative recurrence for multiplicative weights on monic polynomials](#FF1-polynomial-euler-product-recurrence), [The prime-power sum of the Gauss-sum weight is a lifted Gauss sum](#FF1-hasse-davenport-orbit-sum), [The norm lift of a multiplicative character to an extension](#FF1-norm-lift-of-a-multiplicative-character), [The trace lift of an additive character to an extension](#FF1-trace-lift-of-an-additive-character), [The canonical additive character of a finite field](#FF1-canonical-additive-character).

See [Conrad, L-functions](#source-6) — Theorem 3.1, p. 3; [Conrad, Gauss–Jacobi](#source-5) — Appendix, p. 19.

<a id="FF1-hasse-davenport-lifting-for-jacobi-sums"></a>

#### The Hasse–Davenport relation for Jacobi sums

Let F be a finite field, E an extension of degree n ≥ 1, R a field whose characteristic differs from that of F, and χ_1, χ_2 : MulChar F R not both trivial. Then −jacobiSum (liftNorm E χ_1) (liftNorm E χ_2) = (−jacobiSum χ_1 χ_2)^n. For χ_1 = χ_2 = 1 it fails in general (e.g. over ℂ): jacobiSum 1 1 = q − 2 and −(q^2 − 2) ≠ (2 − q)^2.

The hypotheses are as follows. χ_1 or χ_2 nontrivial; R a field of characteristic ≠ char F (so that a primitive additive character with values in a cyclotomic extension of R exists and (q : R) ≠ 0). The displayed failure with both characters trivial is a characteristic-zero counterexample (e.g. complex values), not a universal inequality in every positive-characteristic value field/domain. The lifting theorem itself retains its stated value-ring hypotheses.

A proof proceeds as follows. Case χ_1χ_2 ≠ 1: pass to R' = CyclotomicField p R with the primitive character ψ = AddChar.FiniteField.primitiveChar (as in Mathlib's jacobiSum_mul_jacobiSum_inv; jacobiSum_ringHomComp and MulChar.ringHomComp_ne_one_iff transport along the injective R → R'). Then J = g(χ_1)g(χ_2)/g(χ_1χ_2) (jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum), and the same over E with the lifts, since liftNorm is a homomorphism with (χ_1χ_2)_E ≠ 1 ([The norm lift of a multiplicative character to an extension](#FF1-norm-lift-of-a-multiplicative-character)) and liftTrace ψ is primitive. Applying [The Hasse–Davenport lifting relation](#FF1-hasse-davenport-lifting) to the three Gauss sums: J_E = (−1)^(n−1)·(−1)^(n−1)/(−1)^(n−1) · J^n = (−1)^(n−1) J^n. Case χ_1χ_2 = 1, χ_1 ≠ 1: J(χ, χ⁻¹) = −χ(−1) (jacobiSum_nontrivial_inv); over E, J_E = −χ_E(−1) = −χ(N(−1)) = −χ((−1)^n) = −χ(−1)^n, so −J_E = χ(−1)^n = (−J)^n. Case exactly one trivial: J = −1 over F and over E (jacobiSum_one_nontrivial; the lift of 1 is 1 and the lift of a nontrivial character is nontrivial), and −(−1) = 1 = 1^n.

In particular, verify the following values and consequences.

- χ_1 = 1 ≠ χ_2: both sides equal 1.
- Over ℂ: χ_1 = χ_2 = 1, n = 2: −(q² − 2) ≠ (2 − q)².

*Needs:* [The Hasse–Davenport lifting relation](#FF1-hasse-davenport-lifting), [The norm lift of a multiplicative character to an extension](#FF1-norm-lift-of-a-multiplicative-character), [The trace lift of an additive character to an extension](#FF1-trace-lift-of-an-additive-character), `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`, `jacobiSum_nontrivial_inv`, `jacobiSum_one_nontrivial`, `jacobiSum_ringHomComp`, `MulChar.ringHomComp_ne_one_iff`, `AddChar.FiniteField.primitiveChar`.

See [Conrad, L-functions](#source-6) — §4, p. 5.

### 1.6 The Hasse–Davenport product formula

<a id="FF1-digit-product-distribution"></a>

#### Distribution of digit sums and digit factorials

Let M=p^f−1, d=M/m, s(r)=the sum of native base-p digits and h(r)=the product of their factorials (h(0)=1). For 0≤b<d, ∑_{0≤j<m}s(b+jd)=s(mb)+∑_{1≤j<m}s(jd). In ZMod p, m^{s(mb)}∏_{0≤j<m}h(b+jd)=h(mb)∏_{1≤j<m}h(jd).

The hypotheses are as follows. p is prime, f>0, m>0 and m divides M. Thus M>0, d>0 and p∤m. No odd-prime restriction.

A proof proceeds as follows. Pad each digit list to length f. Multiplication by p modulo M cycles the digits for r<M; s(r)=(p−1)∑_{i<f}{p^i r/M}. For each i, multiplication by p^i permutes j modulo m. The elementary fractional-part distribution on this grid gives the first identity after summation over i. All arguments b+jd and mb lie in [0,M). For b>0 put k=mb, so 0<k<M. Import the [exact L3 multiplication identity](#contract-F1-R03), using its actual Morita Gamma and positive fractional preimages. The numerator preimages, after permuting j for each i, are the cyclic fractions for b+jd; denominators are those for mb and jd, 1≤j<m. None is an integer here, so positive versus ordinary fractional parts agree. Reduce that exact Gamma identity modulo p using L3/morita-gamma-sharp-reduction at precision 1 and its recurrence. If r has low digit r₀, r/M≡−r₀ mod p and Γ_p(r/M)≡Γ_p(−r₀)=1/r₀!; all factorials are units since r₀<p. Multiplying over the cyclic rotations gives 1/h(r). The Teichmuller value reduces to m^k. Since k≡s(k) mod p−1, rearrangement gives the stated factorial product. For b=0 both identities are tautologies after splitting off the j=0 term; do not insert Gamma(1) for Gamma(0). At p=2 every digit factorial and m in ZMod 2 is 1; this congruence is valid but by itself cannot identify a binary root of unity.

In particular, verify the following values and consequences.

- p=5,f=1,m=2,b=1: the factorial congruence is 2²·1!·3!≡2!·2!≡4 modulo 5. This valid boundary check does not detect an inverted exponent, since 2² is self-inverse modulo 5.
- p=7,f=1,m=2,b=1: 2²·1!·4!≡2!·3!≡5 modulo 7, but 2^(−2)·1!·4!≡6. This distinguishes the multiplier from its inverse and is proved by computation in the suggested file.
- p=3,f=2,m=2,b=1: the sum identity is s(1)+s(5)=1+3= s(2)+s(4)=2+2; factorial identity gives 2²·1·2=2·1 modulo 3.
- b=0 and m=1 are exact boundary cases. The binary factorial test is tautological and is not the product-theorem proof. At p=2,f=4,m=3,b=1 the digit sums are s(1)+s(6)+s(11)=1+2+3=s(3)+s(5)+s(10)=2+2+2; this nonzero-exponent test is proved in the suggested file.

*Needs:* `Nat.digits`, `DirichletPadicLFunctions:L3/morita-gamma`, `DirichletPadicLFunctions:L3/morita-gamma-functional-equation`, `DirichletPadicLFunctions:L3/morita-gamma-sharp-reduction`, `DirichletPadicLFunctions:L3/gross-koblitz-source-multiplication-theorem`.

See [Gross–Koblitz](#source-48) — Lemma 2.11(1), p.575, for the digit/fraction identity; Theorem 3.1(2) and (3.2), pp.575–576, for the odd-prime Gamma multiplication and residue. The displayed fractional-grid argument and the all-prime [L3 contract](#contract-F1-R03) give the stated extension and the factorial congruence. Numerical Checks are controls on the signs, not a substitute for that exact theorem.

<a id="FF1-hasse-davenport-product-completion"></a>

#### Exact Gamma route to the Hasse–Davenport product

For all χ, g(χ^m,ψ)∏_{1≤j<m}g(ρ^j,ψ)=χ(m)^m∏_{0≤j<m}g(χρ^j,ψ). The proof consumes the precise scalar coefficient, splitting-value and Gamma-multiplication contracts above.

The hypotheses are as follows. F is a finite field with q=#F; all additive and multiplicative characters take values in ℂ. Multiplicative characters, including 1, are zero on nonunits. m>0 divides q−1; ρ has exact order m; ψ is primitive. In particular m is a unit in F. χ may be trivial, χ^m may be trivial, and p may be 2.

A proof proceeds as follows. For m=1 the identity is immediate. Choose a generator ω of the multiplicative character group, with the Teichmüller and prime-above-p conventions above. Write ρ=ω^{−td}, gcd(t,m)=1, d=(q−1)/m, and χ=ω^{−a}. Permuting j removes t; replacing a by its residue b mod d permutes the numerator and leaves χ^m and χ(m)^m unchanged. If b=0, χ is a power of ρ, so the numerator is a permutation of all ρ^j factors. As a is a multiple of d, χ^m=1 and χ(m)^m=1. Use g(1,ψ)=−1 to split off the j=0 factor. This case avoids the excluded exponent q−1 endpoint. For 0<b<d first use the canonical trace character. Compare all character values inside their cyclotomic coefficient field and its completion at the chosen prime above p, and then transport through an injective complex embedding. Apply L3 §4.5's `grossKoblitz_formula`, with the actual scalar coefficient bound and compatible chosen-root splitting identity. It gives the source-negative sum −g(ω^{-r},ψ)=π^{s(r)}∏_{i<f}Γ_p(e(r,i)), with compatible π^{p−1}=−p, for 0≤r<q−1. Use the compatible-root normalization of Robert (2001), Appendix 2, p.169: pi≡zeta−1 modulo the square of the cyclotomic uniformizer ideal. This concerns the prime above p, not reduction modulo the rational integer p. Apply digit-product-distribution to cancel the π powers. The exact L3 Gamma multiplication quotient, with k=mb, equals ω(m)^{mb}=χ(m)^{−m}. There are m source-negative sums on each side, so their signs cancel. Multiplication by χ(m)^m gives the target. The exact prime-to-p Teichmüller identity is stronger than a congruence modulo the cyclotomic prime. L3 identifies the Gamma quotient by proving its normalized (p−1)st power is 1 and its residue is 1; reduction is injective on these prime-to-p roots. For p=2 the exponent p−1 is 1, so the equality is exact before reduction. No claim that an arbitrary p-power root congruent to 1 must be trivial is used. For arbitrary primitive ψ, use the shift parametrisation and gaussSum_mulShift_eq. Both sides acquire the same χ^{-m}(u)∏_{1≤j<m}ρ^{-j}(u) factor. All Gauss factors are nonzero by the native nontrivial theorem or the trivial value −1. This route is arithmetic and p-adic analytic; it does not use étale cohomology or Poincare duality.

In particular, verify the following values and consequences.

- m=1 gives gχ=gχ, including χ=1.
- If χ is any power of ρ, both sides agree by permutation and g1=−1, including χ^m=1.
- At q=4,m=3 and a character ρ of order 3, χ=ρ gives −gρ gρ² on both sides. This tests characteristic two and the j=0 sign. At q=16,m=3,χ=omega^(−1), the reduced exponent is b=1<5 and χ is not a power of ρ. With the binary trace character both sides are 64; the all-prime Gamma identity is needed for this case.
- The factorial congruence alone leaves a possible p-power root; the exact Gamma quotient is the required stronger equality. The coefficient bound and chosen-root splitting identity are both needed for this route.
- This proves the product relation with the zero-extended trivial-character convention.

*Needs:* [Distribution of digit sums and digit factorials](#FF1-digit-product-distribution), [The Teichmüller character of a prime of a number field](#FF1-teichmuller-character), [The prime above p in Q(ζ_m, ζ_p)](#FF1-prime-above-p-in-cyclotomic-compositum), [The canonical additive character of a finite field](#FF1-canonical-additive-character), [Every additive character is a multiplicative shift of a primitive one](#FF1-additive-characters-are-shifts), [Transport of Gauss sums along ring homomorphisms, and the shift identity](#FF1-gauss-sum-transport), `DirichletPadicLFunctions:L3/gross-koblitz-source-multiplication-theorem`, `DirichletPadicLFunctions:L3/gross-koblitz-multiplication-teichmuller`, `DirichletPadicLFunctions:L3/morita-gamma-multiplication-orbit-power`, `DirichletPadicLFunctions:L3/grossKoblitz_formula`, [Scalar Dwork coefficients](#contract-F1-R01), [Chosen roots and trace values](#contract-F1-R02), [Exact Gamma multiplication](#contract-F1-R03), `gaussSum_one_left`, `gaussSum_ne_zero_of_nontrivial`, `gaussSum_mulShift_eq`.

See [Conrad, Gauss–Jacobi](#source-5) — Appendix p.19, (A.6), denominator convention and footnote 9, for the product identity; [Gross–Koblitz](#source-48) — Theorem 3.1(2) and (3.2)–(3.3), pp.575–576, for the odd-prime exact Gamma route; [Robert (2001)](#source-47) — Theorem 4, p.168, and Appendix 2, p.169, for the all-prime Gamma–Gauss comparison and compatible roots. The [L3 multiplication contract](#contract-F1-R03) specifies the independent recurrence/Euler extension at p=2.

### 1.7 Gauss sums over products and étale algebras

<a id="FF1-gauss-sum-finite-product-factorisation"></a>

#### Gauss sums on products of finite fields

Let ι be finite and K_i finite fields, A=∏_i K_i the native product ring. Given native characters χ:A→ℂ, ψ:A→ℂ and χ_i,ψ_i on K_i such that χ(x)=∏iχ_i(x_i) and ψ(x)=∏iψ_i(x_i) for all x, g_A(χ,ψ)=∏i g_{K_i}(χ_i,ψ_i).

The hypotheses are as follows. The hypotheses explicitly give the component factorisations; arbitrary characters are not silently declared to factor. No primitivity or nontriviality is required. All Gauss sums use Mathlib’s native definition on finite commutative rings.

A proof proceeds as follows. Unfold the native Gauss sum and insert the two character factorisations. Combine the component products to make the summand ∏i(χ_i(x_i)ψ_i(x_i)). Apply Fintype.prod_sum in reverse. This proves the comparison even with trivial component characters and with an empty index set. For a finite étale algebra already presented as a product of finite fields, norm-induced multiplicative and trace-induced additive characters have exactly these factorisations, by the component norm product and trace sum. Their component lifts are the earlier existing norm/trace-lift objects. The theorem consumes a presentation; it does not construct or classify finite étale algebras.

In particular, verify the following values and consequences.

- Two components give g_A=g_1g_2 with the native positive-sum sign.
- Two nontrivial additive components and trivial multiplicative components give g_A=(−1)²=1, whereas the source-negative convention −g_A gives −1; an étale-algebra lifting sign must count the components explicitly.
- An empty product is the singleton ring and both sides equal 1. The statement also permits zero Gauss factors.

*Needs:* `gaussSum`, `Fintype.prod_sum`.

See [Kowalski](#source-4) — Proof of Proposition 1.10, pp.12–13, product-group characters; norm and trace lift discussion pp.14–15.

### 1.8 Teichmüller characters, Stickelberger's congruence and the factorisation of Gauss sums

<a id="FF1-teichmuller-character"></a>

#### The Teichmüller character of a prime of a number field

Let L be a number field and 𝔓 a nonzero prime of 𝓞_L whose residue field k = 𝓞_L/𝔓 has q elements, and suppose 𝓞_L contains a primitive (q − 1)-th root of unity (e.g. L ⊇ Q(ζ_(q−1))). Reduction modulo 𝔓 restricts to a group isomorphism μ_(q−1)(𝓞_L) ≃ kˣ. The Teichmüller character ω_𝔓 : MulChar k 𝓞_L sends a nonzero residue x̄ to the unique (q − 1)-th root of unity congruent to x modulo 𝔓, and 0 to 0. It has order q − 1 and generates the group of characters of k with values in 𝓞_L: every such character is ω_𝔓^(−a) for a unique a mod q − 1. For m ∣ q − 1, ω_𝔓^((q−1)/m) is the m-th power residue character modulo 𝔓 (x̄ ↦ the m-th root of unity ≡ x^((q−1)/m)); its inverse is Katre's character χ = ω^(−(q−1)/m).

The hypotheses are as follows. L a number field, 𝔓 a maximal ideal of 𝓞_L with finite residue field of q elements, and a primitive (q − 1)-th root of unity in 𝓞_L. Katre and Conrad define ω on Z[ζ_(q−1)]/𝔭 with 𝔭 a prime of Q(ζ_(q−1)); working with any L ⊇ Q(ζ_(q−1)) and 𝔓 above 𝔭 gives the same character (the residue fields agree when 𝔓/𝔭 has residue degree 1, as in L = Q(ζ_(p(q−1)))).

A proof proceeds as follows. The q − 1 roots of X^(q−1) − 1 in 𝓞_L have distinct reductions modulo 𝔓: Ideal.rootsOfUnityMapQuot_injective (absNorm 𝔓 = q ≠ 1). The reductions are q − 1 distinct elements of kˣ, which has q − 1 elements, so reduction μ_(q−1)(𝓞_L) → kˣ is a bijective group homomorphism; ω_𝔓 on kˣ is its inverse followed by the inclusion into 𝓞_L, extended by 0 (MulChar.ofUnitHom). ω_𝔓(ζ̄) = ζ for ζ ∈ μ_(q−1); so ω_𝔓 takes the value ζ_(q−1) of order q − 1 and has order q − 1 (orderOf divides q − 1: MulChar.orderOf_dvd_card_sub_one). The character group of k with values in 𝓞_L has at most q − 1 elements (MulChar.card_eq_card_units_of_hasEnoughRootsOfUnity with equality), so it is cyclic generated by ω_𝔓.

Provide the following interface.

- `teichmuller`: teichmuller 𝔓 hμ : MulChar (𝓞 L ⧸ 𝔓) (𝓞 L).
- `teichmuller_mk_sub_mem`: For x ∉ 𝔓: teichmuller (mk x) − x ∈ 𝔓.
- `teichmuller_pow_card_sub_one`: For y ≠ 0: (teichmuller y)^(q − 1) = 1.
- `teichmuller_mk_of_pow_eq_one`: If ζ^(q−1) = 1 then teichmuller (mk ζ) = ζ.
- `orderOf_teichmuller`: orderOf (teichmuller 𝔓 hμ) = q − 1.
- `exists_eq_teichmuller_zpow`: Every χ : MulChar (𝓞 L ⧸ 𝔓) (𝓞 L) is teichmuller^k for some k.
- `teichmuller_zero`: teichmuller 0 = 0.

**Checks.**

- `test_teichmuller_gaussian`: For L = ℚ(i), 𝔓 = (2 + i): teichmuller (mk 3) = i.
- `test_teichmuller_one`: teichmuller (1 : 𝓞 L ⧸ 𝔓) = 1 and teichmuller 0 = 0.
- `test_teichmuller_not_lift`: teichmuller (mk x) ≠ x in general: for L = ℚ(i), 𝔓 = (2 + i), teichmuller (mk 3) = i ≠ 3 (a 'lift the residue' definition fails).
- `test_teichmuller_root_of_unity`: For every nonzero y, teichmuller y is a (q − 1)-th root of unity reducing to y: Ideal.Quotient.mk 𝔓 (teichmuller y) = y.


In particular, verify the following values and consequences.

- For L = Q(i), 𝔓 = (2 + i), k = Z[i]/(2 + i) ≅ F_5 and i ≡ −2 ≡ 3: ω_𝔓(3̄) = i.
- ω_𝔓(1̄) = 1 and ω_𝔓(0) = 0.

*Needs:* `Ideal.rootsOfUnityMapQuot_injective`, `MulChar.ofUnitHom`, `MulChar.orderOf_dvd_card_sub_one`, `MulChar.card_eq_card_units_of_hasEnoughRootsOfUnity`, `IsPrimitiveRoot`, `NumberField.RingOfIntegers`.

See [Katre](#source-8) — §3, p. 79; [Conrad, Stickelberger](#source-7) — Introduction, p. 1.

<a id="FF1-prime-above-p-in-cyclotomic-compositum"></a>

#### The prime above p in Q(ζ_m, ζ_p)

Let p be a prime, m ≥ 1 with p ∤ m, f the order of p modulo m, q = p^f, K = Q(ζ_m) ⊆ L = Q(ζ_(mp)) = Q(ζ_m, ζ_p), and 𝔭 a prime of 𝓞_K above p. Then: (a) 𝓞_K/𝔭 has q elements (inertia degree f, ramification index 1 over p); (b) there is a unique prime 𝔓 of 𝓞_L above 𝔭, with 𝔭𝓞_L = 𝔓^(p−1), e(𝔓/𝔭) = p − 1 and residue degree 1, so 𝓞_L/𝔓 ≅ 𝓞_K/𝔭 has q elements; (c) v_𝔓(ζ_p − 1) = 1 and v_𝔓(p) = p − 1; (d) (ζ_p − 1)^(p−1) = −p·u with u a unit congruent to 1 modulo ζ_p − 1. For m = q − 1, 𝓞_L contains μ_(q−1), so the Teichmüller character of 𝔓 is defined ([The Teichmüller character of a prime of a number field](#FF1-teichmuller-character)).

The hypotheses are as follows. p ∤ m; L and K cyclotomic over ℚ with K ⊆ L. For p = 2: ζ_2 = −1, L = K, 𝔓 = 𝔭 and all statements hold with p − 1 = 1.

A proof proceeds as follows. (a): IsCyclotomicExtension.Rat.inertiaDeg_eq_of_not_dvd (f = orderOf (p : ZMod m)) and IsCyclotomicExtension.Rat.ramificationIdx_eq_of_not_dvd (= 1). (b): for n = p^1·m every prime of 𝓞_L above p has ramification index p − 1 and inertia degree f over ℤ (IsCyclotomicExtension.Rat.ramificationIdx_eq, IsCyclotomicExtension.Rat.inertiaDeg_eq); by multiplicativity in the tower ℤ ⊆ 𝓞_K ⊆ 𝓞_L (Ideal.ramificationIdx_tower, Ideal.inertiaDeg_tower), e(𝔓/𝔭) = p − 1 and f(𝔓/𝔭) = 1 for every 𝔓 above 𝔭; the fundamental identity Σ e·f = [L : K] = p − 1 (Ideal.sum_ramification_inertia) forces a unique 𝔓. (c): (ζ_p − 1) is the unique prime of Q(ζ_p) above p, with p = unit·(ζ_p − 1)^(p−1) (IsCyclotomicExtension.Rat.ramificationIdx_span_zeta_sub_one'); 𝔓 lies over it with ramification index (p − 1)/(p − 1) = 1 (towers again), so v_𝔓(ζ_p − 1) = 1, v_𝔓(p) = p − 1. (d): p = ∏_{c=1}^{p−1}(1 − ζ_p^c) and (1 − ζ_p^c)/(1 − ζ_p) = 1 + ζ_p + ⋯ + ζ_p^(c−1) ≡ c (mod ζ_p − 1), so p/(1 − ζ_p)^(p−1) ≡ (p − 1)! ≡ −1 (ZMod.wilsons_lemma), i.e. (ζ_p − 1)^(p−1) = (−1)^(p−1)(1 − ζ_p)^(p−1) = −p·u with u ≡ 1. For p = 2 handle the sign separately: ζ₂ − 1 = −2 and u = 1; the congruence −1 = 1 in characteristic two gives the same result.

In particular, verify the following values and consequences.

- p = 3, m = 2: f = 1, q = 3, K = Q(ζ_2) = Q, L = Q(ζ_3), 𝔓 = (1 − ζ_3) and 3 = −ζ_3²(1 − ζ_3)².
- p = 5, m = 4: f = 1, K = Q(i), 𝔭 = (2 ± i), L = Q(ζ_20), e(𝔓/𝔭) = 4.

*Needs:* `IsCyclotomicExtension.Rat.inertiaDeg_eq_of_not_dvd`, `IsCyclotomicExtension.Rat.ramificationIdx_eq_of_not_dvd`, `IsCyclotomicExtension.Rat.ramificationIdx_eq`, `IsCyclotomicExtension.Rat.inertiaDeg_eq`, `Ideal.ramificationIdx_tower`, `Ideal.inertiaDeg_tower`, `Ideal.sum_ramification_inertia`, `IsCyclotomicExtension.Rat.ramificationIdx_span_zeta_sub_one'`, `ZMod.wilsons_lemma`.

See [Katre](#source-8) — §3, p. 79; [Conrad, Stickelberger](#source-7) — Proof that Theorem 1 implies Theorem 2, p. 8.

<a id="FF1-multi-jacobi-sum"></a>

#### Jacobi sums of several multiplicative characters

Let F be a finite field and χ_1, …, χ_r : MulChar F R (r ≥ 1). The Jacobi sum is J(χ_1, …, χ_r) := Σ_{x ∈ F^r, x_1 + ⋯ + x_r = 1} χ_1(x_1)⋯χ_r(x_r) (multiJacobiSum), with Mathlib's convention χ(0) = 0 for every character; J_0(χ_1, …, χ_r) is the same sum over x_1 + ⋯ + x_r = 0. For r = 2 it is Mathlib's jacobiSum, for r = 1 it is χ_1(1) = 1. Conrad's normalised Jacobi sum is (−1)^(r−1)·J (Conrad 1995, p. 2).

The hypotheses are as follows. r ≥ 1; characters indexed by Fin r; R a commutative ring.

A proof proceeds as follows. Definition as a finite sum over {x : Fin r → F | Σ x_i = 1}. r = 2: the fibre {x_1 + x_2 = 1} is parametrised by x_1, giving Σ_x χ_1(x)χ_2(1 − x) = jacobiSum. Symmetry: permuting the characters permutes the coordinates of the fibre. All trivial: the number of (x_1, …, x_r) ∈ (Fˣ)^r with Σ x_i = 1 is ((q − 1)^r − (−1)^r)/q (inclusion–exclusion on the coordinates that vanish).

Provide the following interface.

- `multiJacobiSum`: multiJacobiSum χ = Σ_{x : Fin r → F, Σ x = 1} ∏ χ_i(x_i).
- `multiJacobiSum_two`: multiJacobiSum ![χ, φ] = jacobiSum χ φ.
- `multiJacobiSum_one`: multiJacobiSum ![χ] = 1.
- `multiJacobiSum_perm`: multiJacobiSum (χ ∘ σ) = multiJacobiSum χ for a permutation σ.
- `multiJacobiSum_ringHomComp`: multiJacobiSum (fun i ↦ (χ i).ringHomComp f) = f (multiJacobiSum χ).
- `multiJacobiSumZero`: The sum over x_1 + ⋯ + x_r = 0.
- `normalizedMultiJacobiSum`: (−1)^(r−1) · multiJacobiSum χ (Conrad's normalisation).

**Checks.**

- `test_multiJacobiSum_two`: multiJacobiSum ![χ, φ] = jacobiSum χ φ.
- `test_multiJacobiSum_one`: multiJacobiSum ![χ] = 1.
- `test_multiJacobiSum_trivial_three`: multiJacobiSum ![1, 1, 1] = q² − 3q + 3 (as an element of R).
- `test_multiJacobiSum_not_iterated`: For χ ≠ 1: multiJacobiSum ![χ, χ⁻¹, φ] ≠ jacobiSum χ χ⁻¹ · jacobiSum (χ * χ⁻¹) φ in general (Conrad's Remark 2: the iterated formula needs χ_1χ_2 ≠ 1); over F_5 with χ of order 4 and φ = χ the two sides differ.


In particular, verify the following values and consequences.

- r = 2, all trivial: q − 2 (jacobiSum_one_one).
- r = 3, all trivial: ((q−1)^3 + 1)/q = q² − 3q + 3.

*Needs:* `jacobiSum`, `jacobiSum_one_one`, `jacobiSum_ringHomComp`.

See [Conrad, Stickelberger](#source-7) — Introduction, p. 2; [Conrad, Stickelberger](#source-7) — Remarks after Theorem 2, p. 4.

<a id="FF1-gauss-sum-product-and-multi-jacobi-sum"></a>

#### Products of Gauss sums and Jacobi sums of several characters

Let F be a finite field with q elements, R a domain, ψ : AddChar F R primitive and χ_1, …, χ_r : MulChar F R. (a) If χ_1⋯χ_r ≠ 1, then ∏_i gaussSum χ_i ψ = gaussSum (χ_1⋯χ_r) ψ · J(χ_1, …, χ_r). (b) If χ_1⋯χ_r = 1 but some χ_i ≠ 1, then ∏_i gaussSum χ_i ψ = −q·J(χ_1, …, χ_r). Over a value field in which q is nonzero (in particular ℂ), in Conrad's normalisation G = −gaussSum, J_C = (−1)^(r−1)J these read G(χ_1⋯χ_r) = G(χ_1)⋯G(χ_r)/J_C and J_C = (1/q)G(χ_1)⋯G(χ_r).

The hypotheses are as follows. ψ primitive; R a domain (orthogonality). The displayed product identities hold over the stated integral domain; the quotient reformulations additionally require a value field with q ≠ 0 and, in (a), J_C ≠ 0 (which follows from nonzero Gauss sums in this characteristic). Never divide by q in an arbitrary domain or in characteristic p.

A proof proceeds as follows. Expand: ∏_i gaussSum χ_i ψ = Σ_{t ∈ F} ψ(t)·Σ_{x_1+⋯+x_r = t} ∏χ_i(x_i). For t ≠ 0 substitute x_i = t·y_i: the inner sum is (χ_1⋯χ_r)(t)·J(χ_1, …, χ_r). For t = 0 the inner sum is J_0. In case (a), J_0 = (χ_1⋯χ_r)(t)·J_0 for every t ≠ 0 (same substitution), so J_0 = 0; the total is J·Σ_{t≠0}(χ_1⋯χ_r)(t)ψ(t) = J·gaussSum (χ_1⋯χ_r) ψ. In case (b), the inner sums for t ≠ 0 all equal J (the product character is trivial) and Σ_{t≠0} ψ(t) = −1 (AddChar.sum_eq_zero_of_ne_one), so the total is −J + J_0. Summing the inner sums over all t gives ∏_i Σ_x χ_i(x) = 0 (some χ_i ≠ 1: MulChar.sum_eq_zero_of_ne_one), i.e. (q − 1)J + J_0 = 0; hence the total is −J − (q − 1)J = −q·J. r = 2: (a) is Mathlib's jacobiSum_mul_nontrivial and (b) is gaussSum χ ψ·gaussSum χ⁻¹ ψ = χ(−1)q with J(χ, χ⁻¹) = −χ(−1) (jacobiSum_nontrivial_inv).

In particular, verify the following values and consequences.

- r = 2, χ_2 = χ_1⁻¹ ≠ 1: g(χ)g(χ⁻¹) = χ(−1)q = −q·(−χ(−1)).
- r = 1: (a) is g(χ) = g(χ)·1.

*Needs:* [Jacobi sums of several multiplicative characters](#FF1-multi-jacobi-sum), `jacobiSum_mul_nontrivial`, `jacobiSum_nontrivial_inv`, `gaussSum_mul_gaussSum_eq_card`, `gaussSum_mulShift`, `AddChar.sum_eq_zero_of_ne_one`, `MulChar.sum_eq_zero_of_ne_one`.

See [Conrad, Stickelberger](#source-7) — Lemma 1, p. 2; [Conrad, Stickelberger](#source-7) — Lemma 3, p. 7; [Katre](#source-8) — Proposition 1(f), p. 76.

<a id="FF1-multinomial-coefficient-congruences"></a>

#### Multinomial coefficient congruences modulo p

Let p be a prime. For integers b and n_1, …, n_t ≥ 0 write (b; n_1, …, n_t) := b(b − 1)⋯(b − n_1 − ⋯ − n_t + 1)/(n_1!⋯n_t!) ∈ ℤ (the coefficient of X_1^(n_1)⋯X_t^(n_t) in (1 + X_1 + ⋯ + X_t)^b). (C1) If every n_i < p^d then (b + p^d; n_1, …, n_t) ≡ (b; n_1, …, n_t) (mod p). (C2, Lucas–Dickson) If m_0 = Σ_{i<d} c_i p^i + c_d p^d and m_j = Σ_{i<d} c_(ij) p^i + c_(dj) p^d with 0 ≤ c_i, c_(ij) ≤ p − 1 for i < d, then (m_0; m_1, …, m_t) ≡ ∏_{i=0}^{d} (c_i; c_(i1), …, c_(it)) (mod p). In particular, for 0 ≤ a < q = p^f with base-p digits a_i, (a; a_0, a_1p, …, a_(f−2)p^(f−2)) ≡ 1 (mod p).

The hypotheses are as follows. b ∈ ℤ may be negative in (C1) (used with b = k_1 + ⋯ + k_r − q); the multinomial with integer top is a product of generalised binomial coefficients (Ring.choose on ℤ). In (C2), m₀, m_j and the top coefficients c_d, c_(dj) are nonnegative integers; the lower coefficients are digits 0,…,p−1. Only (C1) permits an arbitrary integer top b.

A proof proceeds as follows. (C1): in F_p[[X_1, …, X_t]], (1 + ΣX_j)^(b+p^d) = (1 + ΣX_j)^b·(1 + ΣX_j^(p^d)) (Frobenius in characteristic p); monomials with all exponents < p^d receive only the term 1 of the second factor. (C2): induct on d using (1 + ΣX_j)^(m_0) = (1 + ΣX_j)^(c_0)·((1 + ΣX_j)^p)^((m_0 − c_0)/p) = (1 + ΣX_j)^(c_0)·(1 + ΣX_j^p)^((m_0−c_0)/p) in F_p[X_1, …, X_t] and compare coefficients; t = 1 is Lucas's theorem (Choose.lucas_theorem). The digit corollary: with m_0 = a and m_j = a_(j−1)p^(j−1) every factor on the right is (c_i; 0, …, c_i, …, 0) = 1.

In particular, verify the following values and consequences.

- Lucas (t = 1, p = 5): 7 = 1·5 + 2 and 3 = 0·5 + 3, so (7 choose 3) = 35 ≡ (2 choose 3)(1 choose 0) = 0 (mod 5).
- The binomial case t = 1 is Mathlib's Choose.lucas_theorem.

*Needs:* `Choose.lucas_theorem`, `Nat.multinomial`, `Nat.multinomial_spec`, `Ring.choose`.

See [Conrad, Stickelberger](#source-7) — C1 and C2 with proofs, p. 3.

<a id="FF1-jacobi-sum-teichmuller-congruence"></a>

#### The Jacobi-sum congruence for Teichmüller characters

Let p be prime, q = p^f, and 𝔭 a prime of Q(ζ_(q−1)) above p (or 𝔓 as in [The prime above p in Q(ζ_m, ζ_p)](#FF1-prime-above-p-in-cyclotomic-compositum)), with Teichmüller character ω = ω_𝔭. For r ≥ 1 and 0 ≤ k_1, …, k_r < q − 1 with some k_j > 0: (−1)^(r−1) J(ω^(−k_1), …, ω^(−k_r)) ≡ (k_1 + ⋯ + k_r)!/(k_1!⋯k_r!) (mod 𝔭). If all k_j = 0 it does not hold in general: the left side is ≡ r (mod p), and agrees with the multinomial 1 exactly when r ≡ 1 (mod p).

The hypotheses are as follows. 0 ≤ k_j < q − 1, not all zero; J is [Jacobi sums of several multiplicative characters](#FF1-multi-jacobi-sum); the right side is Nat.multinomial.

A proof proceeds as follows. By symmetry assume k_r > 0. Modulo 𝔭, ω^(−k)(α) ≡ α^(−k) for α ≢ 0 and ω(1 − Σα)^(q−1−k_r) ≡ (1 − Σα)^(q−1−k_r), the latter also for 1 − Σα ≡ 0 since q − 1 − k_r ≥ 1. Expand (1 − α_1 − ⋯ − α_(r−1))^(q−1−k_r) multinomially and use Σ_{α ∈ F_q^×} α^j = −1 if (q − 1) ∣ j and 0 otherwise: only the terms with n_i = k_i survive (the exponents n_i − k_i lie in (−(q−1), q − 1)). If k_1 + ⋯ + k_(r−1) > q − 1 − k_r the sum is 0; otherwise the value is (q − 1 − k_r; k_1, …, k_(r−1))·(−1)^(k_1+⋯+k_(r−1)) = (k_1 + ⋯ + k_r − q; k_1, …, k_(r−1)) (upper negation), which is 0 in the first case as well. (C1) with p^d = q ([Multinomial coefficient congruences modulo p](#FF1-multinomial-coefficient-congruences)) replaces k_1 + ⋯ + k_r − q by k_1 + ⋯ + k_r, giving the multinomial (k_1 + ⋯ + k_r)!/(k_1!⋯k_r!).

In particular, verify the following values and consequences.

- r = 2, k_2 = 1: (−1)·J(ω^(−a), ω^(−1)) ≡ a + 1 (mod 𝔭) (the classical case used in the base induction of Stickelberger's congruence).
- All k_j = 0: the normalised Jacobi sum of r trivial characters is (1 − (1 − q)^r)/q ≡ r (mod p); this differs from 1 when r ≢ 1 (mod p), but agrees when r ≡ 1 (mod p), including r = 1.

*Needs:* [The Teichmüller character of a prime of a number field](#FF1-teichmuller-character), [Jacobi sums of several multiplicative characters](#FF1-multi-jacobi-sum), [Multinomial coefficient congruences modulo p](#FF1-multinomial-coefficient-congruences), `Nat.multinomial`, `FiniteField.sum_pow_units`.

See [Conrad, Stickelberger](#source-7) — Theorem 2 and its proof, pp. 3–4.

<a id="FF1-gauss-sum-teichmuller-base-congruence"></a>

#### The Gauss sum of the inverse Teichmüller character modulo 𝔓²

In the setting of [The prime above p in Q(ζ_m, ζ_p)](#FF1-prime-above-p-in-cyclotomic-compositum) with m = q − 1 and q > 2, let ω = ω_𝔓 be the Teichmüller character and ψ = traceAddChar with ζ_p ∈ 𝓞_L. Then gaussSum ω⁻¹ ψ ≡ −(ζ_p − 1) (mod 𝔓²); in Katre's and Conrad's normalisation, g(ω^(−1)) = −gaussSum ω⁻¹ ψ ≡ ζ_p − 1 (mod 𝔓²). Consequently v_𝔓(gaussSum ω⁻¹ ψ) = 1.

The hypotheses are as follows. q > 2, so ω has order q − 1 > 1 and ω⁻¹ is nontrivial; this is the hypothesis needed to kill the constant term. Katre assumes p odd; the same computation also works for p = 2 and q > 2, but not for q = 2.

A proof proceeds as follows. Write π = ζ_p − 1 ∈ 𝔓 and ζ_p^t = (1 + π)^t ≡ 1 + tπ (mod π²) for an integer representative t ∈ {0, …, p − 1} of Tr(a). So −gaussSum ω⁻¹ ψ ≡ −Σ_a ω⁻¹(a)(1 + Tr(a)π) ≡ −π Σ_a ω⁻¹(a)Tr(a) (mod 𝔓²), since Σ_a ω⁻¹(a) = 0 (MulChar.sum_eq_zero_of_ne_one). The vanishing uses q > 2, not just the primality of p. Modulo 𝔓 (∩ Z[ζ_(q−1)] = 𝔭), ω⁻¹(a) ≡ a^(−1) and Tr(a) = a + a^p + ⋯ + a^(p^(f−1)), so Σ_a ω⁻¹(a)Tr(a) ≡ Σ_{a ≠ 0} Σ_b a^(p^b − 1) ≡ −1: the term b = 0 contributes q − 1 ≡ −1 and 0 < p^b − 1 < q − 1 for 0 < b < f (FiniteField.sum_pow_units). π·𝔓 ⊆ 𝔓², so −gaussSum ω⁻¹ ψ ≡ π (mod 𝔓²), and v_𝔓(π) = 1 (part (c) of the setup lemma) gives valuation 1.

In particular, verify the following values and consequences.

- q = p = 3: ω is the character of order 2 of F_3 (ω(1) = 1, ω(2) = −1), ψ(x) = ζ_3^x, and −gaussSum ω⁻¹ ψ = −(ζ_3 − ζ_3²) = ζ_3(ζ_3 − 1) ≡ ζ_3 − 1 (mod (ζ_3 − 1)²) since ζ_3 ≡ 1.
- Excluded q = p = 2: ω = 1, ζ₂ = −1 and gaussSum 1 ψ = −1, so G = 1 is not congruent to −2 modulo (4); its valuation is 0, not 1. The suggested file contains an admission-free integer-character regression.

*Needs:* [The Teichmüller character of a prime of a number field](#FF1-teichmuller-character), [The prime above p in Q(ζ_m, ζ_p)](#FF1-prime-above-p-in-cyclotomic-compositum), [The canonical additive character of a finite field](#FF1-canonical-additive-character), `MulChar.sum_eq_zero_of_ne_one`, `FiniteField.sum_pow_units`, `FiniteField.algebraMap_trace_eq_sum_pow`.

See [Katre](#source-8) — Lemma 3 and its proof, p. 80.

<a id="FF1-stickelberger-congruence"></a>

#### Stickelberger's congruence for Gauss sums

Let p be a prime, q = p^f, L = Q(ζ_(p(q−1))), 𝔓 a prime of 𝓞_L above p, ω = ω_𝔓 the Teichmüller character of its residue field F_q and ψ(x) = ζ_p^(Tr x) (traceAddChar with ζ_p ∈ 𝓞_L). For 0 ≤ a < q − 1 with base-p digits a = a_0 + a_1p + ⋯ + a_(f−1)p^(f−1), put s(a) = a_0 + ⋯ + a_(f−1) and h(a) = a_0!⋯a_(f−1)!. Then G(ω^(−a)) := −gaussSum (ω^(−a)) ψ satisfies h(a)·G(ω^(−a)) ≡ (ζ_p − 1)^(s(a)) (mod 𝔓^(s(a)+1)); equivalently G(ω^(−a))/(ζ_p − 1)^(s(a)) ≡ 1/h(a) (mod 𝔓), h(a) being prime to p.

The hypotheses are as follows. p any prime (Conrad's theorem has no parity hypothesis); 0 ≤ a < q − 1. The sign normalisation G = −gaussSum is Conrad's (Katre's g); with Mathlib's sign the right side is (−1)·(ζ_p − 1)^(s(a)).

A proof proceeds as follows. a = 0: G(1) = −gaussSum 1 ψ = 1 (gaussSum_one_left), and s(0) = 0, h(0) = 1. a = 1 can occur only when 1 < q − 1, hence q > 2: apply [The Gauss sum of the inverse Teichmüller character modulo 𝔓²](#FF1-gauss-sum-teichmuller-base-congruence). When q = 2 only a = 0 is allowed, already treated. Induction for 1 ≤ a ≤ p − 1 (a < q − 2 at each step): by [Products of Gauss sums and Jacobi sums of several characters](#FF1-gauss-sum-product-and-multi-jacobi-sum) (a), G(ω^(−(a+1))) = G(ω^(−a))G(ω^(−1))/J_C(ω^(−a), ω^(−1)), and J_C(ω^(−a), ω^(−1)) ≡ a + 1 (mod 𝔓) ([The Jacobi-sum congruence for Teichmüller characters](#FF1-jacobi-sum-teichmuller-congruence)), a unit for a + 1 < p; with v_𝔓(ζ_p − 1) = 1 this gives G(ω^(−a)) ≡ (ζ_p − 1)^a/a! (mod 𝔓^(a+1)) for 0 ≤ a ≤ p − 1 (a < p − 1 if q = p). General a (q > p): some digit is positive, so the product ω^(−a) is nontrivial and at least one factor ω^(−a_i p^i) is nontrivial (zero digits give trivial factors, which are permitted); Lemma (a) with the f characters ω^(−a_i p^i) gives G(ω^(−a)) = ∏_i G(ω^(−a_i p^i))/J_C(ω^(−a_0), …, ω^(−a_(f−1)p^(f−1))), and G(ω^(−a_i p^i)) = G(ω^(−a_i)) ([Frobenius invariance of Gauss sums with a trace character](#FF1-gauss-sum-frobenius-invariance)). The numerator is ≡ (ζ_p − 1)^(s(a))/h(a) (mod 𝔓^(s(a)+1)) by the previous step (each a_i ≤ p − 1); the Jacobi sum is ≡ (a; a_0, a_1p, …, a_(f−2)p^(f−2)) ≡ 1 (mod 𝔓) by the Jacobi congruence and (C2) ([Multinomial coefficient congruences modulo p](#FF1-multinomial-coefficient-congruences)), so it is a 𝔓-unit ≡ 1 and the quotient satisfies the congruence.

In particular, verify the following values and consequences.

- q = p: G(ω^(−a)) ≡ (ζ_p − 1)^a/a! (mod 𝔓^(a+1)) for 0 ≤ a < p − 1.
- v_𝔓(G(ω^(−a))) = s(a) ([The valuation of a Teichmüller Gauss sum is a digit sum](#FF1-gauss-sum-valuation-digit-sum)).
- q = 4, a = 2 (digits 0, 1): s = 1, h = 1, G(ω^(−2)) ≡ ζ_2 − 1 = −2 (mod 𝔓²), consistent with G(ω^(−2)) = G(ω^(−1)) by Frobenius invariance.

*Needs:* [The Gauss sum of the inverse Teichmüller character modulo 𝔓²](#FF1-gauss-sum-teichmuller-base-congruence), [Products of Gauss sums and Jacobi sums of several characters](#FF1-gauss-sum-product-and-multi-jacobi-sum), [The Jacobi-sum congruence for Teichmüller characters](#FF1-jacobi-sum-teichmuller-congruence), [Frobenius invariance of Gauss sums with a trace character](#FF1-gauss-sum-frobenius-invariance), [Multinomial coefficient congruences modulo p](#FF1-multinomial-coefficient-congruences), [The prime above p in Q(ζ_m, ζ_p)](#FF1-prime-above-p-in-cyclotomic-compositum), [The Teichmüller character of a prime of a number field](#FF1-teichmuller-character), `gaussSum_one_left`, `Nat.digits`.

See [Conrad, Stickelberger](#source-7) — Theorem 1, p. 2; [Conrad, Stickelberger](#source-7) — Proof of Theorem 1, p. 5.

<a id="FF1-gauss-sum-valuation-digit-sum"></a>

#### The valuation of a Teichmüller Gauss sum is a digit sum

In the setting of [Stickelberger's congruence for Gauss sums](#FF1-stickelberger-congruence), for 0 ≤ a < q − 1: v_𝔓(gaussSum (ω^(−a)) ψ) = s(a), the sum of the base-p digits of a. The function s(α) := v_𝔓(gaussSum (ω^(−α)) ψ) (α mod q − 1) satisfies s(0) = 0, s(α + β) ≤ s(α) + s(β), s(α + β) ≡ s(α) + s(β) (mod p − 1), s(pα) = s(α), s(α) + s(q − 1 − α) = f(p − 1) for α ≢ 0, and s(α) = (p − 1)Σ_{i<f} {p^i α/(q − 1)} for 0 ≤ α < q − 1.

The hypotheses are as follows. p any prime; 𝔓, ω, ψ as in the Stickelberger congruence. The valuation-one conclusion uses v_𝔓(ζ_p − 1) = 1 from the cyclotomic setup. In an arbitrary further ramified number field the valuation is instead scaled by its ramification index; the suggested count declarations must retain an explicit uniformizer hypothesis.

A proof proceeds as follows. Direct route: h(a) is prime to p, so the Stickelberger congruence gives G(ω^(−a)) = (ζ_p − 1)^(s(a))·(unit), and v_𝔓(ζ_p − 1) = 1. Katre's route (independent of the congruence): s(0) = 0 (g(1) = ±1); subadditivity and the congruence mod p − 1 because g(ω^(−α))g(ω^(−β))/g(ω^(−α−β)) is a Jacobi sum, an algebraic integer of Q(ζ_(q−1)), whose 𝔓-valuations are multiples of p − 1 = e(𝔓/𝔭); s(pα) = s(α) by Frobenius invariance; s(α) + s(q − 1 − α) = v_𝔓(q) = f(p − 1) from g(χ)g(χ⁻¹) = ±q; s(1) = 1 (base congruence); these force s(α) = α for α ≤ p − 2, s(p − 1) = p − 1, s(α) ≤ digit sum, and equality by comparing Σ_α s(α) = (q − 2)f(p − 1)/2 with the sum of digit sums. The fractional-part formula: p^i α ≡ a_0p^i + ⋯ + a_(f−1)p^(i−1) (mod q − 1) with the right side < q − 1, so Σ_i {p^iα/(q−1)} = (Σ a_i)(1 + p + ⋯ + p^(f−1))/(q − 1) = s(α)/(p − 1) (Katre, Lemma 4).

In particular, verify the following values and consequences.

- For q > 2: s(1) = s(p) = 1 and s(q − 2) = f(p − 1) − 1. For q = 2 the only exponent in the theorem range is a = 0 and s(0) = 0; do not assert s(1) = 1 for its trivial character.
- For q = p, s(a) = a.

*Needs:* [Stickelberger's congruence for Gauss sums](#FF1-stickelberger-congruence), [The Gauss sum of the inverse Teichmüller character modulo 𝔓²](#FF1-gauss-sum-teichmuller-base-congruence), [The prime above p in Q(ζ_m, ζ_p)](#FF1-prime-above-p-in-cyclotomic-compositum), `Ideal.count_normalizedFactors_eq`, `Nat.digits`, `Nat.modEq_digits_sum`.

See [Katre](#source-8) — Proposition 2, p. 81; [Katre](#source-8) — Lemma 2, pp. 79–80, and Lemma 4, p. 83.

<a id="FF1-prime-factorisation-of-gauss-sums"></a>

#### The prime factorisation of Gauss sums

Let m ≥ 2, p a prime not dividing m, f the order of p modulo m, q = p^f; ℘_0 a prime of Q(ζ_m) above p and ℘̃_0 the prime of Q(ζ_m, ζ_p) above it; P_0 a prime of Q(ζ_(q−1)) above ℘_0 with Teichmüller character ω = ω_(P_0) and χ := ω^(−(q−1)/m), a character of order m of F_q ≅ Z[ζ_m]/℘_0 with values in μ_m (the inverse of the m-th power residue character at ℘_0). For a prime to m let σ_a ∈ Gal(Q(ζ_m, ζ_p)/Q) be ζ_m ↦ ζ_m^a, ζ_p ↦ ζ_p, and let R be a set of representatives of (ℤ/m)ˣ modulo the subgroup generated by p. Then for k ≢ 0 (mod m), with g(χ^k) = −gaussSum (χ^k) ψ (ψ = ζ_p^Tr), the principal ideal (g(χ^k)) of Q(ζ_m, ζ_p) equals ∏_{a ∈ R} (σ_a^(−1) ℘̃_0)^(s(k·a·(q−1)/m)), s being the base-p digit sum of the least nonnegative residue modulo q − 1.

The hypotheses are as follows. p ∤ m (p = 2 allowed); k ≢ 0 (mod m). The primes σ_a^(−1)℘̃_0, a ∈ R, are the distinct primes of Q(ζ_m, ζ_p) above p.

A proof proceeds as follows. Only primes above p divide g(χ^k): g(χ^k)·g(χ^(−k)) = ±q (gaussSum_mul_gaussSum_eq_card, [The absolute value of a complex Gauss sum](#FF1-gauss-sum-absolute-value)). The primes above p in Q(ζ_m, ζ_p) are the conjugates σ^(−1)℘̃_0; σ ranges over Gal, the stabiliser of ℘_0 in Gal(Q(ζ_m)/Q) is ⟨σ_p⟩ (the decomposition group of the unramified p is generated by Frobenius), and ℘̃_0 is the only prime above ℘_0 ([The prime above p in Q(ζ_m, ζ_p)](#FF1-prime-above-p-in-cyclotomic-compositum)); so they are σ_a^(−1)℘̃_0, a ∈ R (Ideal.exists_smul_eq_of_isGaloisGroup for transitivity). v_(σ_a^(−1)℘̃_0)(g(χ^k)) = v_(℘̃_0)(σ_a g(χ^k)) = v_(℘̃_0)(g(χ^(ka))) by [Galois conjugation of Gauss sums of characters of order dividing m](#FF1-gauss-sum-galois-conjugation) (σ_a fixes ζ_p). v_(℘̃_0) = v_(P̃_0) on Q(ζ_m, ζ_p) because P̃_0/℘̃_0 is unramified, and χ^(ka) = ω^(−ka(q−1)/m), so the valuation is s(ka(q−1)/m) ([The valuation of a Teichmüller Gauss sum is a digit sum](#FF1-gauss-sum-valuation-digit-sum)).

In particular, verify the following values and consequences.

- m = 2, p odd (f = 1, q = p): χ is the Legendre character and (g(χ)) = ℘̃_0^(s((p−1)/2)) = ℘̃_0^((p−1)/2), consistent with g(χ)² = ±p and v_(℘̃_0)(p) = p − 1.
- The exponents over all conjugates add up to v(q) = f(p − 1) on (g(χ^k)g(χ^(−k))).

*Needs:* [The valuation of a Teichmüller Gauss sum is a digit sum](#FF1-gauss-sum-valuation-digit-sum), [Galois conjugation of Gauss sums of characters of order dividing m](#FF1-gauss-sum-galois-conjugation), [The prime above p in Q(ζ_m, ζ_p)](#FF1-prime-above-p-in-cyclotomic-compositum), [The absolute value of a complex Gauss sum](#FF1-gauss-sum-absolute-value), [The Teichmüller character of a prime of a number field](#FF1-teichmuller-character), `gaussSum_mul_gaussSum_eq_card`, `Ideal.exists_smul_eq_of_isGaloisGroup`, `IsCyclotomicExtension.autEquivPow`.

See [Katre](#source-8) — Propositions 3 and 3′, pp. 81–82.

<a id="FF1-stickelberger-relation"></a>

#### Stickelberger's theorem on the factorisation of Gauss sums

With m, p, f, q, ℘_0, χ = χ_(℘_0) (the inverse of the m-th power residue character at ℘_0) as in [The prime factorisation of Gauss sums](#FF1-prime-factorisation-of-gauss-sums), and θ := Σ_{1 ≤ a ≤ m, (a, m) = 1} (a/m)·σ_a^(−1) ∈ Q[Gal(Q(ζ_m)/Q)] the Stickelberger element: g(χ)^m lies in Q(ζ_m), and as ideals of Q(ζ_m), (g(χ)^m) = ℘_0^(mθ) = ∏_{1 ≤ a ≤ m, (a,m)=1} (σ_a^(−1)℘_0)^a. This is the relation (Φ(P)) = P^γ, γ = Σ t·σ_t^(−1), used in the proof of Eisenstein reciprocity.

The hypotheses are as follows. p ∤ m, p any prime; ℘^(Σ x_σ σ) := ∏ σ(℘)^(x_σ). The sign of g is irrelevant for the ideal.

A proof proceeds as follows. g(χ)^m ∈ Q(ζ_m): every τ_c (ζ_m fixed, ζ_p ↦ ζ_p^c) multiplies g(χ) by χ(c)^(−1), an m-th root of unity ([Galois conjugation of Gauss sums of characters of order dividing m](#FF1-gauss-sum-galois-conjugation)). By the prime factorisation (k = 1), (g(χ)^m) = ℘̃_0^(m Σ_{a∈R} s(a(q−1)/m) σ_a^(−1)); with s(ad) = (p − 1)Σ_{i<f}{p^i a/m} (Katre, Lemma 4; [The valuation of a Teichmüller Gauss sum is a digit sum](#FF1-gauss-sum-valuation-digit-sum)) the exponent is m(p − 1)Σ_{i<f}Σ_{a∈R}{p^i a/m}σ_a^(−1). ℘̃_0^(p−1) = ℘_0 and σ_(p^i) fixes ℘_0, so ℘̃_0^(m(p−1)Σ_iΣ_R{p^ia/m}σ_a^(−1)) = ℘_0^(m Σ_{b mod m, (b,m)=1} {b/m} σ_b^(−1)) = ℘_0^(mθ) in Q(ζ_m, ζ_p) (b = p^i a runs once over (ℤ/m)ˣ). Extension of ideals from Q(ζ_m) to Q(ζ_m, ζ_p) is injective (unique factorisation of ideals in Dedekind domains), so the equality holds in Q(ζ_m).

In particular, verify the following values and consequences.

- m = 3, p ≡ 1 (mod 3) (f = 1), ℘_0 = (π): mθ = σ_1 + 2σ_2^(−1), so (g(χ)^3) = (π·π̄²); this matches g(χ)^3 = p·J(χ, χ) with J(χ, χ) = conj J(χ_π, χ_π) = π̄, since χ = χ_π^(−1) and CA.1 proves J(χ_π, χ_π) = π.
- m = 2 (K = Q, ℘_0 = pℤ): (g(χ)^2) = (p), i.e. g(χ)^2 = ±p.

*Needs:* [The prime factorisation of Gauss sums](#FF1-prime-factorisation-of-gauss-sums), [Galois conjugation of Gauss sums of characters of order dividing m](#FF1-gauss-sum-galois-conjugation), [The valuation of a Teichmüller Gauss sum is a digit sum](#FF1-gauss-sum-valuation-digit-sum), [The prime above p in Q(ζ_m, ζ_p)](#FF1-prime-above-p-in-cyclotomic-compositum), `IsCyclotomicExtension.autEquivPow`, `Ideal.count_normalizedFactors_eq`.

See [Katre](#source-8) — Proposition 4(i) and its proof, pp. 83–84; [Katre](#source-8) — Lemma 4, p. 83.

<a id="FF1-prime-factorisation-of-jacobi-sums"></a>

#### The prime factorisation of Jacobi sums

With the notation of [Stickelberger's theorem on the factorisation of Gauss sums](#FF1-stickelberger-relation), let j, k be integers with jk(j + k) ≢ 0 (mod m). Then, as ideals of Q(ζ_m), (J(χ^j, χ^k)) = ℘_0^(θ_(j,k)) with θ_(j,k) = Σ_{a mod m, (a,m)=1} (⌊(j + k)a/m⌋ − ⌊ja/m⌋ − ⌊ka/m⌋)·σ_a^(−1) ∈ ℤ[G], whose coefficients are 0 or 1.

The hypotheses are as follows. jk(j + k) ≢ 0 (mod m), so χ^j, χ^k and χ^(j+k) are nontrivial.

A proof proceeds as follows. J(χ^j, χ^k) = g(χ^j)g(χ^k)/g(χ^(j+k)) (jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum; signs cancel in ideals). Raise to the m-th power and use (g(χ^j)^m) = ℘_0^(mθ_j), θ_j = Σ_a {ja/m}σ_a^(−1) (the argument of the Stickelberger relation with χ^j): (J^m) = ℘_0^(m(θ_j + θ_k − θ_(j+k))). {x} + {y} − {x + y} = ⌊x + y⌋ − ⌊x⌋ − ⌊y⌋ ∈ {0, 1}, so θ_j + θ_k − θ_(j+k) = θ_(j,k) ∈ ℤ[G]; unique factorisation in Q(ζ_m) takes the m-th root of the ideal equation.

In particular, verify the following values and consequences.

- m = 3, j = k = 1, p ≡ 1 (mod 3), ℘_0 = (π): the coefficient at a = 1 is ⌊2/3⌋ − 0 − 0 = 0 and at a = 2 it is ⌊4/3⌋ − ⌊2/3⌋ − ⌊2/3⌋ = 1, so θ_(1,1) = σ_2^(−1) and (J(χ, χ)) = (π̄), matching J(χ, χ) = π̄ for χ = χ_π^(−1).

*Needs:* [Stickelberger's theorem on the factorisation of Gauss sums](#FF1-stickelberger-relation), `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`, `Int.fract`.

See [Katre](#source-8) — Proposition 4(ii), p. 83.

<a id="FF1-hasse-davenport-product-relation"></a>

#### The Hasse–Davenport product relation

Let F be a finite field with q elements, n ∣ q − 1, λ a multiplicative character of F of order exactly n (values in ℂ), ψ a nontrivial additive character and χ any multiplicative character. Then gaussSum (χ^n) ψ · ∏_{j=1}^{n−1} gaussSum (λ^j) ψ = χ(n)^n · ∏_{j=0}^{n−1} gaussSum (χλ^j) ψ, where χ(n) is χ evaluated at the image of the integer n in F. Equivalently ∏_{j=0}^{n−1} g(χλ^j) = −χ(n)^(−n) g(χ^n) ∏_{j=0}^{n−1} g(λ^j) (the j = 0 factor g(1) = −1). For n = 2 this is the duplication formula ([The duplication formula for Gauss sums](#FF1-gauss-sum-duplication-formula)).

The hypotheses are as follows. n ∣ q − 1 (so n is prime to p and χ(n) ≠ 0); λ of order n; ψ ≠ 1.

A proof proceeds as follows. Use [Completion of the Hasse–Davenport product plan](#FF1-hasse-davenport-product-completion) for the exact product identity, with its chosen-root Gross–Koblitz comparison and exact Morita Gamma multiplication input. The completion is the single proof route for this target, not a second independent product theorem. The completion consumes L3 §4.5's all-prime scalar Dwork/Gross–Koblitz targets and §4.6's exact Gamma orbit multiplication. Use the three precise arithmetic contracts above, including compatible pi, zeta and native Teichmüller lifts at p=2. Do not conclude from a root-of-unity ratio and its residue alone: reduction does not detect a p-power root of unity. Exact Gamma multiplication is what removes that ambiguity. Recover n=2 from the duplication formula and check the trivial-character factors using g(1)=-1.

In particular, verify the following values and consequences.

- n = 2: the duplication formula.
- χ = λ: in the divided form G(χⁿ) = G(1) = −1, the numerator product has the extra trivial Gauss factor and λ(n)ⁿ = 1. In the displayed undivided identity the common value is −∏_{j=1}^{n−1} G(λʲ), not generally −1.

*Needs:* [The duplication formula for Gauss sums](#FF1-gauss-sum-duplication-formula), [Stickelberger's congruence for Gauss sums](#FF1-stickelberger-congruence), [The valuation of a Teichmüller Gauss sum is a digit sum](#FF1-gauss-sum-valuation-digit-sum), [The prime factorisation of Gauss sums](#FF1-prime-factorisation-of-gauss-sums), [The absolute value of a complex Gauss sum](#FF1-gauss-sum-absolute-value), [Transport of Gauss sums along ring homomorphisms, and the shift identity](#FF1-gauss-sum-transport), [The Teichmüller character of a prime of a number field](#FF1-teichmuller-character), [Exact Gamma route to the Hasse–Davenport product](#FF1-hasse-davenport-product-completion).

See [Conrad, Gauss–Jacobi](#source-5) — (A.6), p. 19.

### Examples

For F₃ and ζ=exp(2πi/3), the quadratic character η gives g(η)=ζ−ζ²=i√3 and g(η)²=−3; the zero-extended trivial character gives −1. For an extension of degree two the lifted quadratic Gauss sum is −g(η)²=3, which tests the lifting sign. With ambient projective degree two, the polynomial X has value zero at infinity. A delta function at 1 has Fourier coefficient ζ²/3 at frequency 1 and total squared Fourier mass 1/3.

### Dependencies

Layer 0 supplies finite-field coordinates and trace/norm compatibility. Mathlib supplies character carriers, gaussSum/jacobiSum and the character-indexed Fourier basis; the additions here transport those operations to explicit field coordinates. The product formula’s Gamma route additionally uses the exact p-adic Gamma, coefficient-bound and compatible splitting-value contracts stated above.

<a id="FF2"></a>

## Layer 2: Weil–Deligne estimates and character sheaves

Keep the elementary, curve and cohomological routes to one-variable bounds distinct. The polynomial census and quotient-ring pairing are elementary inputs even though their stable identifiers lie in Layer 2. Build the global Artin–Schreier/Kummer sheaves and trace formula before conductor/weight estimates. Universal polynomial families and hyper-Kloosterman sheaves then supply the several-variable and higher-rank milestones. Betti/Albanese, constant-field twists and correlation targets state the uniformity and main-term hypotheses explicitly.

### 2.1 Companion sums and their L-functions

<a id="FF2-additive-companion-sum"></a>

#### Additive character sums over the finite extensions of F (companion sums)

Let F be a finite field with q elements and characteristic p, ψ : F → ℂ^× an additive character (Mathlib's AddChar F ℂ), f ∈ F[X], and L/F a finite field extension (a finite field L with an F-algebra structure). The companion sum is S_L(f, ψ) := Σ_{x∈L} ψ(Tr_{L/F}(f(x))) ∈ ℂ, where f(x) is the evaluation aeval x f and Tr_{L/F} = Algebra.trace F L. For L = F it is the classical sum Σ_{x∈F} ψ(f(x)). S_L depends on L only through its F-isomorphism class, hence only on ν = [L:F]; one writes S_ν(f, ψ).

The hypotheses are as follows. F a finite field; L a finite field with an F-algebra structure (no chosen embedding into an algebraic closure). ψ an arbitrary additive character (the trivial character is allowed in the definition; every estimate assumes ψ ≠ 1). Convention pinned: the argument of ψ is the trace down to F, not the trace down to the prime field; composing ψ with Tr_{L/F} is how a character of F becomes a character of L.

A proof proceeds as follows. Definition as a finite sum over the Fintype L. Independence of L: an F-algebra isomorphism e : L ≃ L' preserves traces (mathlib:Algebra.trace_eq_of_algEquiv) and commutes with evaluation of f, so reindexing the sum by e gives S_L = S_{L'}; finite extensions of the same degree are isomorphic (mathlib:FiniteField.algEquivOfCardEq). Constant shift: Tr_{L/F}(c) = [L:F]·c for c ∈ F (mathlib:Algebra.trace_algebraMap), so S_L(f + c, ψ) = ψ(c)^{[L:F]} S_L(f, ψ).

Provide the following interface.

- `additiveCompanionSum`: S_L(f, ψ) = Σ_{x∈L} ψ(Tr_{L/F}(f(x))).
- `additiveCompanionSum_self`: For L = F (Algebra F F the identity): S_F(f, ψ) = Σ_{x∈F} ψ(f(x)).
- `additiveCompanionSum_congr`: An F-algebra isomorphism L ≃ₐ[F] L' gives S_L(f, ψ) = S_{L'}(f, ψ).
- `additiveCompanionSum_add_C`: S_L(f + C c, ψ) = ψ(c)^{[L:F]} · S_L(f, ψ) for c ∈ F.
- `additiveCompanionSum_mulShift`: S_L(f, ψ.mulShift a) = S_L(a·f, ψ): changing the character is the same as scaling the phase.
- `norm_additiveCompanionSum_le`: ‖S_L(f, ψ)‖ ≤ |L| (trivial bound; ψ takes values in the unit circle).

**Checks.**

- `additiveCompanionSum_test_zero`: S_L(0, ψ) = |L|.
- `additiveCompanionSum_test_X`: If ψ ≠ 1 then S_L(X, ψ) = 0.
- `additiveCompanionSum_test_const`: For c ∈ F: S_L(C c, ψ) = |L| · ψ(c)^{[L:F]}; a definition that restricts ψ to F without the trace would give |L|·ψ(c).
- `additiveCompanionSum_test_trivialChar`: S_L(f, 1) = |L| for every f.


In particular, verify the following values and consequences.

- For ψ ≠ 1: S_L(X, ψ) = 0, by surjectivity of the trace and orthogonality.
- S_L(0, ψ) = |L|, the degenerate value.
- For F = F_3, L = F_9 and c = 1: S_L(c, ψ) = 9ψ(2), not 9ψ(1); the trace, not the naive restriction of ψ, is what is summed.

*Needs:* `AddChar`, `Algebra.trace`, `Algebra.trace_eq_of_algEquiv`, `FiniteField.algEquivOfCardEq`, `Algebra.trace_algebraMap`.

See [Kowalski](#source-4) — Chapter 5, section 5.1, display (5.1), printed p. 66; [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Scholie 1.9, (1.9.2), volume p. 174.

<a id="FF2-multiplicative-companion-sum"></a>

#### Multiplicative character sums over the finite extensions of F

For F finite with q elements, χ : F → ℂ a multiplicative character (Mathlib's MulChar F ℂ, which vanishes at 0 — also the trivial character, by Mathlib's convention), g ∈ F[X] and L/F finite: S̃_L(g, χ) := Σ_{x∈L} χ(N_{L/F}(g(x))), N_{L/F} = Algebra.norm F. For L = F it is Σ_{x∈F} χ(g(x)). It depends only on [L:F].

The hypotheses are as follows. F finite; L a finite extension; χ arbitrary (trivial allowed; then the sum counts the x with g(x) ≠ 0, by Mathlib's convention χ(0) = 0). Pinned convention: characters of L are obtained as χ ∘ N_{L/F} (Kowalski (4.9)); the norm, not the trace.

A proof proceeds as follows. Definition as a finite sum. Independence of L via mathlib:Algebra.norm (norm transported along F-algebra isomorphisms) and mathlib:FiniteField.algEquivOfCardEq. Scaling: N_{L/F}(c) = c^{[L:F]} for c ∈ F, so S̃_L(c·g, χ) = χ(c)^{[L:F]} S̃_L(g, χ).

Provide the following interface.

- `multiplicativeCompanionSum`: S̃_L(g, χ) = Σ_{x∈L} χ(N_{L/F}(g(x))).
- `multiplicativeCompanionSum_self`: S̃_F(g, χ) = Σ_{x∈F} χ(g(x)).
- `multiplicativeCompanionSum_congr`: Invariance under F-algebra isomorphisms of L.
- `multiplicativeCompanionSum_C_mul`: S̃_L(C c * g, χ) = χ(c)^{[L:F]} · S̃_L(g, χ).
- `norm_multiplicativeCompanionSum_le`: ‖S̃_L(g, χ)‖ ≤ |L|.

**Checks.**

- `multiplicativeCompanionSum_test_one`: S̃_L(1, χ) = |L|.
- `multiplicativeCompanionSum_test_X`: If χ ≠ 1 then S̃_L(X, χ) = 0.
- `multiplicativeCompanionSum_test_trivialChar`: For Mathlib's trivial character: S̃_L(X, 1) = |L| − 1 (the value at 0 is 0).


In particular, verify the following values and consequences.

- For χ ≠ 1: S̃_L(X, χ) = 0, since N_{L/F} maps L^× onto F^× with fibres of equal size (mathlib:FiniteField.norm_surjective).
- S̃_L(1, χ) = |L|.
- With Mathlib's trivial character 1: S̃_L(X, 1) = |L| − 1, not |L| as under the classical convention ε(0) = 1 ([Trivial-character and normalisation conventions for Gauss and Jacobi sums](#FF1-trivial-character-conventions)).

*Needs:* `MulChar`, `Algebra.norm`, `FiniteField.norm_surjective`, `FiniteField.algEquivOfCardEq`, [Trivial-character and normalisation conventions for Gauss and Jacobi sums](#FF1-trivial-character-conventions).

See [Kowalski](#source-4) — Chapter 4, Proposition 4.7 and display (4.10), printed pp. 41-42.

<a id="FF2-monic-l-series"></a>

#### The L-series of a function on monic polynomials over F

For F finite with q elements and Λ : F[X] → ℂ (only its values on monic polynomials matter), L(Λ; T) := Σ_{n≥0} c_n(Λ) T^n ∈ ℂ⟦T⟧ with c_n(Λ) := Σ_{h monic, deg h = n} Λ(h), a finite sum (there are q^n monic polynomials of degree n, indexed through Mathlib's monicEquivDegreeLT). This is Kowalski's L(η, T) = Σ_f η(f) T^{deg f} (Definition 4.4) and the same device for additive sums (§5.3), written for an arbitrary Λ so that additive, multiplicative, mixed and Kloosterman sums share one API.

The hypotheses are as follows. F finite; Λ arbitrary (no multiplicativity is assumed in the definition; the Euler-product and log-derivative statements assume it). The formal variable T is PowerSeries.X over ℂ; no analytic convergence is used.

A proof proceeds as follows. c_n is a finite sum indexed by the finset of monic polynomials of degree n (the image of degreeLT F n under monicEquivDegreeLT, mathlib:Polynomial.monicEquivDegreeLT). L(Λ; T) := PowerSeries.mk c.

Provide the following interface.

- `monicLSeries`: L(Λ; T) = Σ_n c_n(Λ) T^n.
- `monicLSeries_coeff`: coeff n L(Λ; T) = Σ_{h ∈ monicOfDegree n} Λ(h).
- `monicLSeries_constantCoeff`: The constant coefficient is Λ(1).
- `monicLSeries_coeff_one`: coeff 1 L(Λ; T) = Σ_{a∈F} Λ(X + C a).
- `monicLSeries_isPolynomial`: If c_n(Λ) = 0 for all n ≥ N, then L(Λ; T) is the image of a polynomial whose WithBot degree is < N. If the conclusion uses natDegree < N instead, require 0 < N (the zero polynomial has natDegree 0).
- `monicLSeriesPowerSum`: W_ν(Λ) = Σ_{e ∣ ν} Σ_{π monic irreducible of degree e} e·Λ(π)^{ν/e}, the coefficients of the logarithmic derivative T L′/L for multiplicative Λ ([Euler product and logarithmic derivative of a multiplicative monic L-series](#FF2-monic-l-series-log-derivative)).

**Checks.**

- `monicLSeries_test_one`: For Λ ≡ 1: coeff n L(Λ; T) = q^n.
- `monicLSeries_test_units`: For Λ(h) = [h(0) ≠ 0] and n ≥ 1: coeff n L(Λ; T) = q^n − q^{n−1}.
- `monicLSeries_test_constantCoeff`: For arbitrary Λ, the constant coefficient of monicLSeries Λ is Λ(1), not a hard-coded 0 or 1.


In particular, verify the following values and consequences.

- Λ ≡ 1 gives c_n = q^n, i.e. L = 1/(1 − qT), the zeta function of the affine line.
- Λ(h) = [h(0) ≠ 0] gives c_n = q^n − q^{n−1} (n ≥ 1): the zeta function (1 − T)/(1 − qT) of the multiplicative group.
- The constant coefficient is Λ(1), including Λ(1) = 0 and Λ(1) = 2.

*Needs:* `PowerSeries`, `Polynomial.monicEquivDegreeLT`, [The finite set of monic polynomials of a given degree](#FF2-monic-polynomials-of-degree).

See [Kowalski](#source-4) — Chapter 4, Definition 4.4, printed p. 39; [Kowalski](#source-4) — Chapter 5, section 5.3, after Lemma 5.10, printed p. 71.

<a id="FF2-monic-l-series-log-derivative"></a>

#### Euler product and logarithmic derivative of a multiplicative monic L-series

Let Λ be completely multiplicative on monic polynomials (Λ(1) = 1 and Λ(h₁h₂) = Λ(h₁)Λ(h₂) for monic h₁, h₂). Then L(Λ; T) = Π_π (1 − Λ(π)T^{deg π})^{−1} over monic irreducible π (coefficientwise), and T·L′(Λ; T) = L(Λ; T) · Σ_{ν≥1} W_ν T^ν with W_ν := Σ_{π monic irreducible, deg π | ν} deg π · Λ(π)^{ν/deg π}. If moreover, for each finite extension L of degree ν and each x ∈ L, a value w_L(x) is given with w_L(x) = Λ(minpoly_F x)^{ν/deg minpoly_F x}, then W_ν = Σ_{x∈L} w_L(x). Equivalently L(Λ; T) = exp(Σ_ν W_ν T^ν/ν) in ℂ⟦T⟧.

The hypotheses are as follows. Λ completely multiplicative on monic polynomials; Λ(1) = 1. L any finite extension of F of degree ν (the value of W_ν does not depend on the choice).

A proof proceeds as follows. Unique factorisation of monic polynomials into monic irreducibles (mathlib:UniqueFactorizationMonoid.normalizedFactors_prod_eq) turns the coefficientwise product Π_π Σ_k Λ(π)^k T^{k deg π} into Σ_h Λ(h)T^{deg h} (Kowalski, proof of Proposition 4.5(1)). Take the logarithmic derivative of the product: T L′/L = Σ_π deg π Σ_{r≥1} Λ(π)^r T^{r deg π} (proof of Proposition 4.7); collect the coefficient of T^ν. Regrouping over x ∈ L (proof of Lemma 5.10): an irreducible monic π of degree e has exactly e roots in L when e | ν and none otherwise (π divides X^{q^ν} − X iff e | ν, whose roots are exactly L: mathlib:FiniteField.roots_X_pow_card_sub_X; the roots are simple: mathlib:Polynomial.card_rootSet_eq_natDegree), and every x ∈ L has a unique minimal polynomial (mathlib:minpoly). Hence Σ_{deg π | ν} deg π Λ(π)^{ν/deg π} = Σ_{x∈L} w_L(x). The exp form follows by comparing coefficients of the formal logarithmic derivative (mathlib:PowerSeries.derivative).

In particular, verify the following values and consequences.

- Λ ≡ 1: W_ν = q^ν = |L| and L = 1/(1 − qT).
- Λ = root-sum character of f = X with ψ ≠ 1: W_ν = Σ_{x∈L} ψ(Tr x) = 0 and L = 1.

*Needs:* [The L-series of a function on monic polynomials over F](#FF2-monic-l-series), `UniqueFactorizationMonoid.normalizedFactors_prod_eq`, `FiniteField.roots_X_pow_card_sub_X`, `Polynomial.card_rootSet_eq_natDegree`, `minpoly`, `PowerSeries.derivative`.

See [Kowalski](#source-4) — Chapter 5, Lemma 5.10 and its proof, printed pp. 71-72; [Kowalski](#source-4) — Chapter 4, proof of Proposition 4.7, printed p. 42.

<a id="FF2-root-sum-additive-character"></a>

#### The root-sum character h ↦ ψ(Σ_{h(α)=0} f(α)) of an additive character and a polynomial

For F finite, ψ an additive character of F and f ∈ F[X], define on polynomials λ_{f,ψ}(h) := ψ(Tr_{(F[X]/(h))/F}(f mod h)), the trace of multiplication by f on the F-algebra F[X]/(h) = AdjoinRoot h (free of rank deg h when h is monic). For monic h splitting in an extension K, Tr(f mod h) = Σ_{α} f(α) over the roots of h counted with multiplicity, so λ(h) = ψ(Σ_{h(α)=0} f(α)); this sum lies in F. λ is completely multiplicative on monic polynomials, λ(X − a) = ψ(f(a)), and for x in a finite extension L of degree ν with minimal polynomial π: λ(π)^{ν/deg π} = ψ(Tr_{L/F}(f(x))).

The hypotheses are as follows. F finite; ψ arbitrary; f arbitrary (constant, and Artin–Schreier trivial, f allowed). λ is used only on monic h; on the zero polynomial the trace is taken on F[X] (not finite), and the value is irrelevant.

A proof proceeds as follows. Trace of multiplication by X^k on F[X]/(h) is the k-th power sum of the roots: the characteristic polynomial of multiplication by X is h (mathlib:AdjoinRoot.powerBasis'), and the trace of a power of an endomorphism is the power sum of the roots of its characteristic polynomial (mathlib:Module.End.trace_eq_sum_roots_charpoly_of_splits after scalar extension to a splitting field); linearity gives Σ_α f(α). Multiplicativity: F[X]/(h₁h₂) has F[X]/(h₂) as the sub-F[X]-module h₁F[X]/(h₁h₂) with quotient F[X]/(h₁), and traces are additive along such exact sequences; equivalently the root multiset of h₁h₂ is the sum of the two root multisets. Value at X − a: F[X]/(X − a) = F with X ↦ a. Minimal polynomials: F[X]/(π) ≅ F(x); Tr_{L/F}(f(x)) = [L:F(x)] · Tr_{F(x)/F}(f(x)) (mathlib:Algebra.trace_trace with the trace of a scalar), and ψ(k t) = ψ(t)^k.

Provide the following interface.

- `rootSumAddChar`: λ_{f,ψ}(h) = ψ(Tr_{(F[X]/(h))/F}(f mod h)).
- `rootSumAddChar_one`: λ(1) = 1.
- `rootSumAddChar_mul`: For monic h₁, h₂: λ(h₁h₂) = λ(h₁)λ(h₂).
- `rootSumAddChar_X_sub_C`: λ(X − C a) = ψ(f(a)).
- `rootSumAddChar_eq_sum_roots`: If h is monic and splits over a field K ⊇ F then λ(h) = ψ(t) where t ∈ F maps to Σ_{α ∈ roots of h in K} f(α).
- `rootSumAddChar_minpoly_pow`: For x in a finite extension L: λ(minpoly_F x)^{[L:F]/deg} = ψ(Tr_{L/F}(f(x))).
- `rootSumAddChar_add`: λ_{f+g,ψ} = λ_{f,ψ}·λ_{g,ψ} on monic polynomials.

**Checks.**

- `rootSumAddChar_test_zero`: For f = 0 and h monic: λ(h) = 1.
- `rootSumAddChar_test_X_quadratic`: For f = X: λ(X² + C a·X + C b) = ψ(−a).
- `rootSumAddChar_test_const`: For f = C c and h monic of degree n: λ(h) = ψ(c)^n.


In particular, verify the following values and consequences.

- f = 0 gives λ ≡ 1 on monic polynomials.
- f = X, h = X² + aX + b gives λ(h) = ψ(−a) (sum of the roots).
- f = c constant, h monic of degree n gives λ(h) = ψ(c)^n.

*Needs:* `AdjoinRoot`, `AdjoinRoot.powerBasis'`, `Algebra.trace`, `Module.End.trace_eq_sum_roots_charpoly_of_splits`, `Algebra.trace_trace`, `minpoly`, `AddChar`.

See [Kowalski](#source-4) — Chapter 5, Lemma 5.11, proof of (2), printed p. 74; [Kowalski](#source-4) — Chapter 5, Lemma 5.10, printed p. 71.

<a id="FF2-root-sum-multiplicative-character"></a>

#### The root-product character h ↦ χ(Res(h, g)) of a multiplicative character and a polynomial

For F finite, χ a multiplicative character (MulChar F ℂ) and g ∈ F[X], define μ_{g,χ}(h) := χ(Res(h, g)) with Mathlib's resultant Polynomial.resultant h g (default degrees). For monic h splitting over K, Res(h, g) = Π_{h(α)=0} g(α) (roots with multiplicity), so μ(h) = χ(Π_{h(α)=0} g(α)) = χ(N_{(F[X]/(h))/F}(g mod h)). μ is completely multiplicative on monic polynomials, μ(X − a) = χ(g(a)), μ(h) = 0 when h and g have a common root (by Mathlib's convention χ(0) = 0, also for the trivial character), and for x in a finite extension L of degree ν with minimal polynomial π: μ(π)^{ν/deg π} = χ(N_{L/F}(g(x))).

The hypotheses are as follows. F finite; χ arbitrary; g arbitrary (constant and perfect-power g allowed). Used on monic h. The resultant, not a Dirichlet character modulo g, is the definition: this removes Kowalski's sign χ(−1)^{deg g · deg h} from the generating identity.

A proof proceeds as follows. Res(h, g) = Π_{h(α)=0} g(α) for monic h (mathlib:Polynomial.resultant_eq_prod_eval with leading coefficient 1). Multiplicativity in h: mathlib:Polynomial.resultant_mul_left, with degrees natDegree(h₁h₂) = natDegree h₁ + natDegree h₂ for monic polynomials. Value at X − a: Res(X − a, g) = g(a). Minimal polynomials: Res(π, g) = N_{F(x)/F}(g(x)) and N_{L/F}(g(x)) = N_{F(x)/F}(g(x))^{[L:F(x)]} (mathlib:Algebra.norm_norm).

Provide the following interface.

- `rootSumMulChar`: μ_{g,χ}(h) = χ(Res(h, g)).
- `rootSumMulChar_one`: μ(1) = 1.
- `rootSumMulChar_mul`: For monic h₁, h₂: μ(h₁h₂) = μ(h₁)μ(h₂).
- `rootSumMulChar_X_sub_C`: μ(X − C a) = χ(g(a)).
- `rootSumMulChar_eq_prod_roots`: For monic h splitting over K: μ(h) = χ(t) where t ∈ F maps to Π_{α} g(α).
- `rootSumMulChar_minpoly_pow`: For x in a finite extension L: μ(minpoly_F x)^{[L:F]/deg} = χ(N_{L/F}(g(x))).
- `rootSumMulChar_mul_right`: μ_{g₁g₂,χ} = μ_{g₁,χ}·μ_{g₂,χ} on monic polynomials.

**Checks.**

- `rootSumMulChar_test_one`: For g = 1 and h monic: μ(h) = 1.
- `rootSumMulChar_test_X`: For g = X and h monic: μ(h) = χ((−1)^{deg h} · h(0)).
- `rootSumMulChar_test_trivialChar`: For Mathlib's trivial character and g = X: μ(X) = 0 (not 1, as the classical convention ε(0) = 1 would give).


In particular, verify the following values and consequences.

- g = 1 gives μ ≡ 1 on monic polynomials.
- g = X gives μ(h) = χ((−1)^{deg h} h(0)).
- Mathlib's trivial character: μ(h) = 1 if gcd(h, g) = 1 and 0 otherwise.

*Needs:* `Polynomial.resultant`, `Polynomial.resultant_eq_prod_eval`, `Polynomial.resultant_mul_left`, `Algebra.norm_norm`, `MulChar`, [Trivial-character and normalisation conventions for Gauss and Jacobi sums](#FF1-trivial-character-conventions).

See [Kowalski](#source-4) — Chapter 4, Proposition 4.1 and formula (4.5), printed pp. 36-38.

<a id="FF2-additive-l-function"></a>

#### The L-function L(f, ψ; T) of a one-variable additive character sum

L(f, ψ; T) := L(λ_{f,ψ}; T) = Σ_{h monic} ψ(Tr_{F[X]/(h)}(f)) T^{deg h} ∈ ℂ⟦T⟧. By the Euler product lemma it satisfies T·L′ = L·Σ_{ν≥1} S_ν(f, ψ)T^ν, i.e. L(f, ψ; T) = exp(Σ_ν S_ν(f, ψ)T^ν/ν) — Kowalski's Z(g, ψ; T) of (5.3).

The hypotheses are as follows. F finite, ψ an additive character, f ∈ F[X]. S_ν is the companion sum over any extension of degree ν.

A proof proceeds as follows. Definition: monicLSeries (rootSumAddChar f ψ). Logarithmic derivative: [Euler product and logarithmic derivative of a multiplicative monic L-series](#FF2-monic-l-series-log-derivative) with w_L(x) = ψ(Tr_{L/F}(f(x))), justified by rootSumAddChar_minpoly_pow. Constant shift: λ_{f+c}(h) = ψ(c)^{deg h} λ_f(h), so L(f + c, ψ; T) = L(f, ψ; ψ(c)T).

Provide the following interface.

- `additiveLFunction`: L(f, ψ; T) = monicLSeries (rootSumAddChar f ψ).
- `additiveLFunction_coeff_one`: coeff 1 L(f, ψ; T) = Σ_{x∈F} ψ(f(x)).
- `additiveLFunction_logDeriv`: T·L′ = L·Σ_{ν≥1} S_ν(f, ψ)T^ν (companion sums over extensions of degree ν).
- `additiveLFunction_add_C`: coeff n L(f + C c, ψ; T) = ψ(c)^n · coeff n L(f, ψ; T).
- `additiveLFunction_mulShift`: L(f, ψ.mulShift a; T) = L(a·f, ψ; T).

**Checks.**

- `additiveLFunction_test_zero`: For f = 0: coeff n L = q^n.
- `additiveLFunction_test_X`: For f = X and ψ ≠ 1: coeff n L = 0 for every n ≥ 1.
- `additiveLFunction_test_artinSchreier`: For ψ the primitive character through the trace to the prime field and f = X^p − X: coeff n L = q^n for all n, so L is not a polynomial although deg f = p ≥ 1.


In particular, verify the following values and consequences.

- f = X, ψ ≠ 1: L = 1.
- f = 0: L = 1/(1 − qT).
- f = X^p − X with ψ the canonical character: L = 1/(1 − qT), not a polynomial.

*Needs:* [The L-series of a function on monic polynomials over F](#FF2-monic-l-series), [Euler product and logarithmic derivative of a multiplicative monic L-series](#FF2-monic-l-series-log-derivative), [The root-sum character h ↦ ψ(Σ_{h(α)=0} f(α)) of an additive character and a polynomial](#FF2-root-sum-additive-character), [Additive character sums over the finite extensions of F (companion sums)](#FF2-additive-companion-sum).

See [Kowalski](#source-4) — Chapter 5, section 5.3, display (5.3), printed p. 70.

<a id="FF2-multiplicative-l-function"></a>

#### The L-function Z(g, χ; T) of a one-variable multiplicative character sum

Z(g, χ; T) := L(μ_{g,χ}; T) = Σ_{h monic} χ(Res(h, g)) T^{deg h}. It satisfies Z(g, χ; T) = exp(Σ_ν S̃_ν(g, χ)T^ν/ν) — Kowalski's zeta function Z(g, χ; T) of (4.10), equal to L(η, χ(−1)^{deg g}T) for the Dirichlet character η modulo g.

The hypotheses are as follows. F finite, χ a multiplicative character, g ∈ F[X].

A proof proceeds as follows. Definition: monicLSeries (rootSumMulChar g χ). Exponential identity: [Euler product and logarithmic derivative of a multiplicative monic L-series](#FF2-monic-l-series-log-derivative) with w_L(x) = χ(N_{L/F}(g(x))), justified by rootSumMulChar_minpoly_pow. Comparison with Kowalski's L(η, T): μ(h) = χ(−1)^{deg g · deg h} η(h) (resultant symmetry, mathlib:Polynomial.resultant_comm), which is (4.10).

Provide the following interface.

- `multiplicativeLFunction`: Z(g, χ; T) = monicLSeries (rootSumMulChar g χ).
- `multiplicativeLFunction_coeff_one`: coeff 1 Z(g, χ; T) = Σ_{x∈F} χ(g(x)).
- `multiplicativeLFunction_logDeriv`: T·Z′ = Z·Σ_{ν≥1} S̃_ν(g, χ)T^ν.
- `multiplicativeLFunction_C_mul`: coeff n Z(C c * g, χ; T) = χ(c)^n · coeff n Z(g, χ; T).

**Checks.**

- `multiplicativeLFunction_test_one`: For g = 1: coeff n Z = q^n.
- `multiplicativeLFunction_test_X`: For g = X and χ ≠ 1: coeff n Z = 0 for n ≥ 1.
- `multiplicativeLFunction_test_perfectPower`: For g = X^e with e = orderOf χ ≥ 2: coeff n Z = q^n − q^{n−1} for n ≥ 1, so Z is not a polynomial.


In particular, verify the following values and consequences.

- g = X, χ ≠ 1: Z = 1.
- g = 1: Z = 1/(1 − qT).
- g = X^e with e the order of χ: Z = (1 − T)/(1 − qT), not a polynomial.

*Needs:* [The L-series of a function on monic polynomials over F](#FF2-monic-l-series), [Euler product and logarithmic derivative of a multiplicative monic L-series](#FF2-monic-l-series-log-derivative), [The root-product character h ↦ χ(Res(h, g)) of a multiplicative character and a polynomial](#FF2-root-sum-multiplicative-character), [Multiplicative character sums over the finite extensions of F](#FF2-multiplicative-companion-sum), `Polynomial.resultant_comm`.

See [Kowalski](#source-4) — Chapter 4, Proposition 4.7 and (4.10), printed pp. 41-42.

<a id="FF2-l-function-reciprocal-roots"></a>

#### Companion sums are minus the power sums of the reciprocal roots of a polynomial L-function

Let Λ be completely multiplicative on monic polynomials with L(Λ; T) = exp(Σ_ν W_ν T^ν/ν) ([Euler product and logarithmic derivative of a multiplicative monic L-series](#FF2-monic-l-series-log-derivative)), and suppose L(Λ; T) is a polynomial P(T) ∈ ℂ[T] of degree ≤ δ. Write P(T) = Π_{j=1}^{δ}(1 − ω_j T) with ω_j ∈ ℂ (the roots of the reversed polynomial T^δ P(1/T), padded by zeros). Then W_ν = −Σ_{j=1}^{δ} ω_j^ν for every ν ≥ 1, and If B ≥ 0 and |ω_j| ≤ B for every j, then |W_ν| ≤ δ·B^ν, including δ = 0 (empty reciprocal-root list and W_ν = 0).

The hypotheses are as follows. P(0) = 1 (automatic: Λ(1) = 1). The ω_j are counted with multiplicity.

A proof proceeds as follows. P splits over ℂ (mathlib:IsAlgClosed) and, since P(0) = 1, P(T) = Π(1 − ω_j T) where the ω_j are the roots of the reverse polynomial (mathlib:Polynomial.reverse). Formal logarithmic derivative: T P′/P = Σ_j −ω_j T/(1 − ω_j T) = −Σ_ν (Σ_j ω_j^ν) T^ν; compare with Σ_ν W_ν T^ν (Kowalski, proof of Corollary 4.9(2)).

In particular, verify the following values and consequences.

- L = 1 + cT gives W_ν = (−c)^ν·(−1) = −(−c)^ν.
- Kloosterman: 1 + K T + qT² gives K_ν = −(α^ν + β^ν) with αβ = q.

*Needs:* [Euler product and logarithmic derivative of a multiplicative monic L-series](#FF2-monic-l-series-log-derivative), `IsAlgClosed`, `Polynomial.reverse`, `PowerSeries.derivative`.

See [Kowalski](#source-4) — Chapter 4, Corollary 4.9(2), printed p. 45; [Kowalski](#source-4) — Chapter 4, Remark 4.10(3), printed p. 46.

### 2.2 Polynomiality, degree and the functional equation

<a id="FF2-root-sum-additive-top-coefficients"></a>

#### For deg h ≥ deg f, λ_{f,ψ}(h) is linear in the d-th coefficient of h

Let f = Σ_{k=0}^{d} f_k X^k ∈ F[X] with d ≥ 1, f_d ≠ 0, and let h = X^n + a₁X^{n−1} + ⋯ + a_n be monic with n ≥ d. Then Tr_{F[X]/(h)}(f) = n·f₀ + Σ_{k=1}^{d} f_k P_k(a₁, …, a_k), where P_k ∈ ℤ[a₁, …, a_k] is the Newton polynomial expressing the k-th power sum of the roots of h through the elementary symmetric functions e_i = (−1)^i a_i, and P_d = −d·a_d + R_d(a₁, …, a_{d−1}). Consequently λ_{f,ψ}(h) = ψ(n f₀) · ψ(Φ_f(a₁, …, a_{d−1})) · ψ(−d f_d a_d) with Φ_f ∈ F[a₁, …, a_{d−1}] depending only on f.

The hypotheses are as follows. n ≥ d ≥ 1 (for n < d the formula holds with a_i := 0 for i > n but the a_d-term is absent). No hypothesis on p here; the coefficient −d f_d of a_d vanishes when p | d.

A proof proceeds as follows. The trace of X^k on F[X]/(h) is the power sum p_k of the roots (as in [The root-sum character h ↦ ψ(Σ_{h(α)=0} f(α)) of an additive character and a polynomial](#FF2-root-sum-additive-character)). Newton's identities (mathlib:MvPolynomial.psum_eq_mul_esymm_sub_sum) express p_k through e₁, …, e_k; p_k involves e_k linearly with coefficient (−1)^{k−1}k and no e_j with j > k. Substitute e_i = (−1)^i a_i: the only occurrence of a_d in Σ_{k≤d} f_k p_k is (−1)^{d−1} d f_d e_d = −d f_d a_d.

In particular, verify the following values and consequences.

- f = X³ + aX, as in Kowalski's Example 5.12: λ(h) = ψ(−a₁³ − 3a₃ + 3a₁a₂ − a a₁), linear in a₃ with coefficient −3.
- f = X^d with p | d: the a_d-coefficient vanishes, consistent with the Artin–Schreier degeneracy.

*Needs:* [The root-sum character h ↦ ψ(Σ_{h(α)=0} f(α)) of an additive character and a polynomial](#FF2-root-sum-additive-character), `MvPolynomial.psum_eq_mul_esymm_sub_sum`.

See [Kowalski](#source-4) — Chapter 5, Lemma 5.11, proof of (2), printed p. 74; [Kowalski](#source-4) — Chapter 5, Example 5.13, printed p. 76.

<a id="FF2-additive-l-function-is-polynomial"></a>

#### L(f, ψ; T) is a polynomial of degree at most deg f − 1 (p ∤ deg f)

Let ψ ≠ 1 and f ∈ F[X] of degree d ≥ 1 with p ∤ d. Then coeff_n L(f, ψ; T) = 0 for every n ≥ d. Hence L(f, ψ; T) is (the image of) a polynomial of degree ≤ d − 1 with constant term 1.

The hypotheses are as follows. ψ nontrivial (hence primitive, F being a field). d = deg f ≥ 1 and p ∤ d. No hypothesis d < q (Kowalski's Lemma 5.10 assumes it; the proof below does not use it).

A proof proceeds as follows. For n ≥ d, index the monic polynomials of degree n by (a₁, …, a_n) ∈ F^n. By [For deg h ≥ deg f, λ_{f,ψ}(h) is linear in the d-th coefficient of h](#FF2-root-sum-additive-top-coefficients), λ(h) = ψ(n f₀) ψ(Φ_f(a₁, …, a_{d−1})) ψ(−d f_d a_d). Sum over a_d ∈ F first: Σ_{a∈F} ψ(−d f_d · a) = 0 because −d f_d ≠ 0 (p ∤ d, f_d ≠ 0) and ψ is primitive (mathlib:AddChar.IsPrimitive.of_ne_one, mathlib:AddChar.sum_mulShift). Hence c_n = 0. This replaces the source's route through the quotient group P(F_q)/P_∞(d+1) (Lemma 5.11), whose proof assumes g(0) = 0 without the reduction.

In particular, verify the following values and consequences.

- f = X (d = 1): L = 1.
- p = 3 and f = X³ with the canonical character: Tr(x³) = Tr(x), so L(X³, ψ; T) = L(X, ψ; T) = 1 has degree 0, not d − 1 = 2; when p | d the degree of f is not the right invariant ([The Artin–Schreier reduced form f* of a polynomial](#FF2-artin-schreier-reduced-form)).
- q = 5, f = X²: L = 1 + g T with g the quadratic Gauss sum, |g| = √5.

*Needs:* [The L-function L(f, ψ; T) of a one-variable additive character sum](#FF2-additive-l-function), [For deg h ≥ deg f, λ_{f,ψ}(h) is linear in the d-th coefficient of h](#FF2-root-sum-additive-top-coefficients), `AddChar.IsPrimitive.of_ne_one`, `AddChar.sum_mulShift`.

See [Kowalski](#source-4) — Chapter 5, Proposition 5.9, printed p. 70; [Kowalski](#source-4) — Chapter 5, end of the proof of Proposition 5.9, printed p. 76.

<a id="FF2-root-sum-multiplicative-periodicity"></a>

#### μ_{g,χ}(h) depends only on deg h and on h modulo the radical of g

Let g = c·Π_{i=1}^{r} π_i^{k_i} with c ∈ F^× and distinct monic irreducible π_i, and g♭ := Π π_i (deg g♭ = m, the number of distinct roots of g in F̄). For monic h: μ_{g,χ}(h) = χ(c)^{deg h} · χ(−1)^{deg g·deg h} · Φ(h mod g♭), where Φ(r) := Π_i χ(N_{(F[X]/(π_i))/F}(r mod π_i))^{k_i} for r ∈ F[X]/(g♭). Φ is multiplicative, vanishes exactly on the non-units of F[X]/(g♭), and restricts to a character of (F[X]/(g♭))^×.

The hypotheses are as follows. g ≠ 0 with the factorisation above; χ any multiplicative character.

A proof proceeds as follows. Res(h, g) = (−1)^{deg g deg h} Res(g, h) (mathlib:Polynomial.resultant_comm) and Res(g, h) = c^{deg h} Π_i Res(π_i, h)^{k_i} (multiplicativity). For monic irreducible π: Res(π, h) = Π_{π(α)=0} h(α) = N_{(F[X]/(π))/F}(h mod π) (mathlib:Polynomial.resultant_eq_prod_eval, mathlib:Algebra.norm). Chinese remainder theorem F[X]/(g♭) ≅ Π F[X]/(π_i) (mathlib:Ideal.quotientInfRingEquivPiQuotient) shows Φ is well defined on F[X]/(g♭) and multiplicative.

In particular, verify the following values and consequences.

- g = X²: Φ(r) = χ(r(0))² — for χ quadratic this is the indicator of r(0) ≠ 0.
- g = X(X − 1): Φ(r) = χ(r(0))χ(r(1)).

*Needs:* [The root-product character h ↦ χ(Res(h, g)) of a multiplicative character and a polynomial](#FF2-root-sum-multiplicative-character), `Polynomial.resultant_comm`, `Polynomial.resultant_eq_prod_eval`, `Algebra.norm`, `Ideal.quotientInfRingEquivPiQuotient`.

See [Kowalski](#source-4) — Chapter 4, proof of Proposition 4.1, formula (4.5), and Corollary 4.3(1), printed pp. 38-39.

<a id="FF2-multiplicative-l-function-is-polynomial"></a>

#### Z(g, χ; T) is a polynomial of degree at most m − 1 when g is not a constant times an e-th power

Let χ have order e ≥ 2 and let g ∈ F[X] be nonzero and not of the form c·h^e with c ∈ F̄ and h ∈ F̄[X] (equivalently: some root of g in F̄ has multiplicity not divisible by e). Let m be the number of distinct roots of g in F̄. Then coeff_n Z(g, χ; T) = 0 for every n ≥ m, so Z(g, χ; T) is a polynomial of degree ≤ m − 1 with constant term 1.

The hypotheses are as follows. χ of exact order e ≥ 2 (e | q − 1). g not of the form c·h^e over F̄; g may be non-squarefree.

A proof proceeds as follows. For n ≥ m every residue class modulo g♭ contains exactly q^{n−m} monic polynomials of degree n (division by g♭; Kowalski, proof of Proposition 4.5(2)). By [μ_{g,χ}(h) depends only on deg h and on h modulo the radical of g](#FF2-root-sum-multiplicative-periodicity): c_n = q^{n−m} χ(c)^n χ(−1)^{n deg g} Σ_{r∈F[X]/(g♭)} Φ(r). Φ is a nontrivial character of (F[X]/(g♭))^×: choose π₀ with e ∤ k_{π₀}; the norm N : (F[X]/(π₀))^× → F^× is onto (mathlib:FiniteField.norm_surjective), so χ^{k_{π₀}} ∘ N ≠ 1; use the Chinese remainder theorem to put 1 in the other components (Kowalski, Corollary 4.3(2)). Σ Φ = 0 by orthogonality (mathlib:MulChar.sum_eq_zero_of_ne_one applied to Φ as a multiplicative character of the finite ring).

In particular, verify the following values and consequences.

- g = X, χ ≠ 1: m = 1, Z = 1.
- χ cubic, g = X²: m = 1 and g is not c·h³, so Z = 1 and Σ_x χ(x²) = 0 — a perfect square that is not degenerate for a cubic character.
- χ quadratic, g = X³ + aX + b squarefree, p odd: Z = 1 + c₁T + c₂T² with |c₂| = q (Kowalski Example 4.12).

*Needs:* [The L-function Z(g, χ; T) of a one-variable multiplicative character sum](#FF2-multiplicative-l-function), [μ_{g,χ}(h) depends only on deg h and on h modulo the radical of g](#FF2-root-sum-multiplicative-periodicity), `FiniteField.norm_surjective`, `MulChar.sum_eq_zero_of_ne_one`.

See [Kowalski](#source-4) — Chapter 4, Proposition 4.5(2) and Corollary 4.3(2), printed pp. 39-40; [Kowalski](#source-4) — Chapter 4, after Proposition 4.7, printed p. 42.

<a id="FF2-primitive-ring-gauss-sum-norm"></a>

#### Gauss sums of primitive characters of F[X]/(g) have absolute value q^{deg g / 2}

Let g ∈ F[X] be monic squarefree of degree m, R := F[X]/(g), ℓ_{m−1}(r) the coefficient of X^{m−1} of the reduced representative of r, and ψ₁ := ψ ∘ ℓ_{m−1} for a nontrivial ψ. If η is a multiplicative character of R whose restriction to each factor (F[X]/(π))^× (π | g irreducible) is nontrivial (η primitive), then gaussSum η ψ₁ · gaussSum η⁻¹ ψ₁⁻¹ = |R| = q^m; for complex values |τ(η, ψ₁)|² = q^m.

The hypotheses are as follows. g squarefree (Kowalski proves (4.12) in this case, which is the case used). ψ ≠ 1; η primitive. m = deg g ≥ 1, so the coefficient ℓ_(m−1) is a genuine basis coordinate (as in the suggested signature).

A proof proceeds as follows. Chinese remainder: R ≅ Π_{π|g} F[X]/(π) (mathlib:Ideal.quotientInfRingEquivPiQuotient); η = Π η_π and ψ₁ = Π ψ_π with ψ_π additive characters of the finite fields F[X]/(π). Each ψ_π is nontrivial: for f = (g/π)·h with deg h = deg π − 1, ψ₁(xf) = ψ(x) (Kowalski's argument), and ψ ≠ 1. The Gauss sum factorises over the product, and on each finite-field factor gaussSum η_π ψ_π · gaussSum η_π⁻¹ ψ_π⁻¹ = |F[X]/(π)| (mathlib:gaussSum_mul_gaussSum_eq_card).

In particular, verify the following values and consequences.

- m = 1: the classical |τ(χ, ψ)|² = q.
- η trivial on a factor: the factor Gauss sum is −1 and the identity fails; primitivity is needed.

*Needs:* `gaussSum`, `gaussSum_mul_gaussSum_eq_card`, `Ideal.quotientInfRingEquivPiQuotient`.

See [Kowalski](#source-4) — Chapter 4, proof of Proposition 4.8, claim (4.12), printed pp. 44-45.

<a id="FF2-multiplicative-l-function-leading-coefficient"></a>

#### Exact degree and leading coefficient of Z(g, χ; T)

Let χ have order e, let g ∈ F[X] be non-constant with e ∤ deg g and with no irreducible factor of multiplicity divisible by e, and let m be the number of distinct roots of g in F̄. Then Z(g, χ; T) is a polynomial of degree exactly m − 1 whose leading coefficient has absolute value q^{(m−1)/2}; writing Z = Π_{j=1}^{m−1}(1 − Ω_j T), |Ω₁ ⋯ Ω_{m−1}| = q^{(m−1)/2}.

The hypotheses are as follows. e ∤ deg g and no multiplicity k_π divisible by e (Corollary 4.9's hypotheses); χ of order e ≥ 2.

A proof proceeds as follows. The attached character η is primitive modulo g♭ and nontrivial on constants (η|F^× = χ^{deg g}, formula (4.7)) — Kowalski, proof of Corollary 4.9(1), using [μ_{g,χ}(h) depends only on deg h and on h modulo the radical of g](#FF2-root-sum-multiplicative-periodicity). Leading coefficient formula (4.11): c_{m−1}(η) = τ(η, ψ₁) τ(η̄|F^×, ψ̄)/q, obtained by detecting the monic condition with additive characters. |τ(η, ψ₁)|² = q^m ([Gauss sums of primitive characters of F[X]/(g) have absolute value q^{deg g / 2}](#FF2-primitive-ring-gauss-sum-norm)) and |τ(η̄|F^×, ψ̄)|² = q (mathlib:gaussSum_mul_gaussSum_eq_card with complex conjugation), so |c_{m−1}| = q^{(m−1)/2}. Transfer to Z(g, χ; T) = L(η, χ(−1)^{deg g}T) changes the leading coefficient by a root of unity.

In particular, verify the following values and consequences.

- χ quadratic, g = X³ + aX + b squarefree: |c₂| = q, and c₂ = ±q is an integer (Kowalski Example 4.12).
- χ quadratic, g = X² − a with a ≠ 0 (so e | deg g): Σ_x χ(x² − a) = −1, so the leading coefficient has absolute value 1, not q^{1/2}; the hypothesis e ∤ deg g cannot be dropped.

*Needs:* [Z(g, χ; T) is a polynomial of degree at most m − 1 when g is not a constant times an e-th power](#FF2-multiplicative-l-function-is-polynomial), [μ_{g,χ}(h) depends only on deg h and on h modulo the radical of g](#FF2-root-sum-multiplicative-periodicity), [Gauss sums of primitive characters of F[X]/(g) have absolute value q^{deg g / 2}](#FF2-primitive-ring-gauss-sum-norm), `gaussSum_mul_gaussSum_eq_card`.

See [Kowalski](#source-4) — Chapter 4, Corollary 4.9(1), printed p. 45; [Kowalski](#source-4) — Chapter 4, Proposition 4.8, formula (4.11), printed p. 44.

<a id="FF2-multiplicative-l-function-functional-equation"></a>

#### Functional equation of the L-function of a primitive character modulo a square-free g

Let g ∈ F[X] be monic squarefree of degree d ≥ 1 and η a primitive Dirichlet character modulo g (Kowalski's sense) with η|F^× ≠ 1. Then L(η, T) = W(η) T^{d−1} L(η̄, (qT)^{−1}) with W(η) = τ(η, ψ₁)τ(η̄|F^×, ψ̄)/q; |W(η)| = q^{(d−1)/2}. For Z(g, χ; T) under the hypotheses of [Exact degree and leading coefficient of Z(g, χ; T)](#FF2-multiplicative-l-function-leading-coefficient) with g squarefree, this reads Z(g, χ; T) = W′ T^{m−1} Z(g, χ̄; (qT)^{−1}) with W′ = χ(−1)^{(m−1)deg g} W(η).

The hypotheses are as follows. η primitive modulo g and nontrivial on the constants. The comparison with Z(g, χ; T) uses (4.10). g is squarefree. The [primitive nonreduced-modulus functional equation](#FF2-primitive-modulus-functional-equation) below supplies the general case by a different nonunit-vanishing argument.

A proof proceeds as follows. For R = F[X]/(g), let ℓ pick the coefficient of X^(d−1) in the reduced representative and B(r,h) = ℓ(rh). This pairing is nondegenerate: for a nonzero representative of degree k, multiply by X^(d−1−k), obtaining its nonzero leading coefficient without reduction. This gives all additive characters as ψ(B(·,h)). The top-coefficient product pairing, rather than a reversed-coefficient dot product, gives the required annihilator. For 0 ≤ j ≤ d−1, the annihilator of the subspace of representatives of degree < j is exactly the polynomials of degree < d−j: containment follows from product degree < d−1, and equality from nondegeneracy and complementary dimensions. Detect the affine space of monic degree-j representatives using this annihilator. This yields c_j(η) = q^(j−d) Σ_(deg h ≤ d−1−j) τ(η,ψ_h) ψ(−coeff_(d−1−j)(h)). The sum includes h = 0. For unit h, substitution gives τ(η,ψ_h) = η⁻¹(h)τ(η,ψ₁). For nonunit h, a CRT component is a trivial additive character while its multiplicative component is nontrivial by primitivity; its Gauss sum is zero. This is the square-free case of (4.16). Split h by its top coefficient. Lower-degree h contribute zero by the nontrivial constant-field restriction of η⁻¹. For a nonzero top coefficient α, write h = α h₀ with h₀ monic; summing α yields τ(η⁻¹|F×,ψ⁻¹). Hence c_j(η) = q^(j−d) τ(η,ψ₁) τ(η⁻¹|F×,ψ⁻¹) c_(d−1−j)(η⁻¹). This is the functional equation coefficientwise, including j = 0. |W| follows from the square-free primitive-ring Gauss-sum norm and the finite-field Gauss-sum norm. The comparison to Z uses its resultant sign, and the suggested signature retains this same square-free scope.

In particular, verify the following values and consequences.

- d = 1: L = 1 and W(η) has absolute value 1.
- The functional equation and |c_{m−1}| = q^{(m−1)/2} are consistent: comparing leading and constant coefficients gives Proposition 4.8.

*Needs:* [Exact degree and leading coefficient of Z(g, χ; T)](#FF2-multiplicative-l-function-leading-coefficient), [Gauss sums of primitive characters of F[X]/(g) have absolute value q^{deg g / 2}](#FF2-primitive-ring-gauss-sum-norm).

See [Kowalski](#source-4) — Chapter 4, Proposition 4.11, printed pp. 46-47.

<a id="FF2-mixed-l-function-is-polynomial"></a>

#### The L-function of a mixed sum χ(g(x))ψ(f(x)) is a polynomial of degree at most m + n − 1

Let ψ ≠ 1, f ∈ F[X] of degree n ≥ 1 with p ∤ n, χ any multiplicative character and g ∈ F[X] nonzero with m distinct roots in F̄. For Λ := λ_{f,ψ}·μ_{g,χ} (completely multiplicative on monic polynomials), coeff_N L(Λ; T) = 0 for all N ≥ n + m, so L(Λ; T) is a polynomial of degree ≤ n + m − 1; its companion sums are W_ν = Σ_{x∈L} χ(N_{L/F}(g(x))) ψ(Tr_{L/F}(f(x))).

The hypotheses are as follows. p ∤ n = deg f ≥ 1; χ may be trivial (Mathlib's convention: χ(0) = 0, so the sum runs over g(x) ≠ 0).

A proof proceeds as follows. For N ≥ n + m, parametrise monic h of degree N by its top n coefficients (a₁, …, a_n) and its residue modulo g♭; since N − n ≥ m = deg g♭, the lower coefficients reach every residue class, each exactly q^{N−n−m} times for fixed (a₁, …, a_n). λ depends only on (a₁, …, a_n) ([For deg h ≥ deg f, λ_{f,ψ}(h) is linear in the d-th coefficient of h](#FF2-root-sum-additive-top-coefficients)) and μ only on N and the residue ([μ_{g,χ}(h) depends only on deg h and on h modulo the radical of g](#FF2-root-sum-multiplicative-periodicity)), so c_N factors as a multiple of Σ_{a_n∈F} ψ(−n f_n a_n) = 0. The companion sums: [Euler product and logarithmic derivative of a multiplicative monic L-series](#FF2-monic-l-series-log-derivative) with the product weights.

In particular, verify the following values and consequences.

- g = 1: reduces to [L(f, ψ; T) is a polynomial of degree at most deg f − 1 (p ∤ deg f)](#FF2-additive-l-function-is-polynomial) (m = 0).
- f = X, g = X, χ ≠ 1: degree ≤ 1 and W₁ = Σ χ(x)ψ(x) is a Gauss sum ([Gauss sums as the Frobenius eigenvalue on H¹_c(G_m, L_ψ ⊗ L_χ)](#FF2-gauss-sum-frobenius-eigenvalue)).

*Needs:* [Euler product and logarithmic derivative of a multiplicative monic L-series](#FF2-monic-l-series-log-derivative), [For deg h ≥ deg f, λ_{f,ψ}(h) is linear in the d-th coefficient of h](#FF2-root-sum-additive-top-coefficients), [μ_{g,χ}(h) depends only on deg h and on h modulo the radical of g](#FF2-root-sum-multiplicative-periodicity), `AddChar.sum_mulShift`.

See [Kowalski](#source-4) — Chapter 5, Remark 5.14(2), printed p. 77; [Fouvry–Kowalski–Michel–Sawin](#source-13) — section 4.2.2-4.2.3, pp. 11-12.

### 2.3 Primitive quotient-ring Gauss sums and functional equations

<a id="FF2-primitive-multiplicative-ring-character"></a>

#### Primitive multiplicative characters of finite rings

For a finite nontrivial commutative ring R and χ : MulChar(R,ℂ), χ is primitive if for every nonzero ideal I of R there is u∈R× with u−1∈I and χ(u)≠1. The top ideal is included. Equivalently χ on units does not factor through the unit group of any proper quotient R/I with I nonzero and proper, and χ is nontrivial. Values on nonunits are the existing MulChar values, hence zero.

The hypotheses are as follows. R finite, commutative and nontrivial. Characters use the zero-on-nonunits convention.

A proof proceeds as follows. Use the predicate on the existing MulChar carrier, not a second character type. For a finite ring, reduction on units is surjective without a reducedness assumption. Lift a quotient unit to b with bc≡1 modulo I. By eventual periodicity of powers of a=bc, choose N≥1 with e=a^N idempotent. Since e≡1 modulo I, u=be+(1−e) lifts b; its inverse is ce·a^(N−1)e+(1−e), because a^Ne=e. This proves the required surjection directly. Kernel containment is equivalent to factorization through this surjection. The I=R clause supplies nontriviality, which quotient-only phrasing misses for fields.

Provide the following interface.

- `TauCeti.FiniteFieldSums.FF2.IsPrimitiveMulChar.field_iff`: For a finite field, primitivity is equivalent to χ≠1.
- `TauCeti.FiniteFieldSums.FF2.IsPrimitiveMulChar.quotient_iff`: For finite R, the stated kernel condition is equivalent to nontriviality plus absence of factorization through proper quotient unit groups.
- `TauCeti.FiniteFieldSums.FF2.IsPrimitiveMulChar.ringEquiv`: Transport by a ring isomorphism preserves primitivity and commutes with the existing extension of unit characters.
- `TauCeti.FiniteFieldSums.FF2.IsPrimitiveMulChar.prod_iff`: A character of a nonempty finite product of nontrivial finite rings is primitive exactly when each factor character is primitive.

**Checks.**

- `TauCeti.FiniteFieldSums.FF2.primitive_field_three`: The nontrivial character of F₃× is primitive.
- `TauCeti.FiniteFieldSums.FF2.primitive_zmod_four`: On ℤ/4ℤ, χ(1)=1, χ(3)=−1, χ(0)=χ(2)=0 is primitive.
- `TauCeti.FiniteFieldSums.FF2.primitive_product_control`: On F₃×F₃, a character nontrivial only on the first factor is not primitive: I=0×F₃ detects the failure.
- `TauCeti.FiniteFieldSums.FF2.primitive_trivial_field`: The trivial MulChar on a field fails the top-ideal clause.


In particular, verify the following values and consequences.

- Nontrivial characters over a field are primitive; the trivial character is not.
- Over a product of fields this agrees with the nontrivial-on-every-factor condition.

*Needs:* `MulChar`, `MulChar.ofUnitHom`.

See [Kowalski](#source-4) — Chapter 4, Proposition 4.8 and primitive Dirichlet characters, pp. 41–43.

<a id="FF2-primitive-finite-ring-gauss-norm"></a>

#### Primitive Gauss sums over finite commutative rings

Let R be a finite nontrivial commutative ring, χ primitive in the preceding sense and ψ a primitive additive character R→ℂ. For every a∈R, τ(χ,ψ(a·))=χ⁻¹(a)τ(χ,ψ), including nonunits where both sides are zero. Moreover |τ(χ,ψ)|²=|R| and τ(χ,ψ)τ(χ⁻¹,ψ⁻¹)=|R|.

The hypotheses are as follows. χ multiplicatively primitive; ψ primitive as AddChar.IsPrimitive. Neither reducedness nor a field hypothesis is imposed.

A proof proceeds as follows. For units use Mathlib gaussSum_mulShift_eq. If a is a nonunit, multiplication by a on finite R is not injective (injectivity would imply surjectivity and an inverse), so Ann(a)≠0. Choose u with u−1∈Ann(a) and χ(u)≠1. Substitution x↦ux leaves ψ(ax) unchanged and multiplies the sum by χ(u); hence the sum is zero. Expand Σ_a|τ(χ,ψ(a·))|². Orthogonality AddChar.sum_mulShift leaves only x=y and gives |R|Σ_x|χ(x)|²=|R||R×|. Finite character values on units have modulus one. The first formula identifies the left side with |R×||τ|²; cancel the positive unit-group cardinality. The product identity follows from star_gaussSum_eq.

In particular, verify the following values and consequences.

- Over ℤ/4ℤ with ψ(1)=i and χ(3)=−1, τ=2i and |τ|²=4.
- A nonprimitive character can have a nonzero nonunit Fourier coefficient, so the primitive guard is essential.

**Compatibility**

- Current Tau Ceti already supplies DirichletCharacter.gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive for ZMod n and primitive Dirichlet characters. The new theorem extends this to arbitrary finite commutative rings; the ZMod specialization must agree with that existing result.

*Needs:* [Primitive multiplicative characters of finite rings](#FF2-primitive-multiplicative-ring-character), `gaussSum`, `gaussSum_mulShift_eq`, `AddChar.sum_mulShift`, `star_gaussSum_eq`.

See [Kowalski](#source-4) — Chapter 4, (4.12), pp. 44–45, and (4.16), pp. 48–49.

<a id="FF2-polynomial-quotient-frobenius-pairing"></a>

#### The coefficient pairing on a polynomial quotient

For a finite field F, monic g∈F[X] of degree d≥1, let R=AdjoinRoot(g) and define quotientTopCoefficient g hg r, denoted ℓ(r), to be coefficient d−1 of its unique representative of degree<d. The F-bilinear pairing B(r,h)=ℓ(rh) is nondegenerate, including when g has repeated factors. For 0≤j≤d, the annihilator of the subspace degree<j is the subspace degree<d−j. For nontrivial ψ:F→ℂ, ψ∘ℓ is a primitive additive character of R.

The hypotheses are as follows. g monic and d≥1; no squarefree hypothesis.

A proof proceeds as follows. For a nonzero representative r of degree k, multiply by X^(d−1−k): no reduction occurs and ℓ is its nonzero leading coefficient. Scaling by F proves nondegeneracy. Products of degrees<j and <d−j have degree<d−1, so the second subspace lies in the annihilator. The perfect pairing gives dimension d−j and hence equality. If a≠0, B(a,·) surjects onto F; composition with a nontrivial ψ cannot be trivial. This is Mathlib’s AddChar.IsPrimitive condition.

Provide `quotientTopCoefficient_mk`, identifying ℓ(mk g f) with coefficient d−1 of f %ₘ g; `quotientTopCoefficient_linear`, bundling its F-linearity; and `polynomialQuotientFrobeniusPairing`, giving the nondegeneracy and primitive-character assertions. The annihilator theorem includes j=0 and j=d.

**Checks.**

- For g=X², ℓ(mk g X)=1, whereas ℓ(mk g 1)=0. Reading the constant coefficient reverses these values.
- For g=X³, ℓ(mk g X)=0 and ℓ(mk g X²)=1. Reading the leading coefficient of the representative gives the wrong first value.
- For g=X²+1, ℓ(mk g X²)=0 after reduction to −1; the pairing B(X,X) is zero although B(X,1)=1. This distinguishes multiplication followed by reduction from a coordinate dot product.

In particular, verify the following values and consequences.

- g=X², r=X: pair with h=1 to obtain ℓ(rh)=1 despite nilpotents.
- For g=X²+1, B(X,X)=0, disproving a reversed-coordinate formula; nondegeneracy still holds.

*Needs:* `AdjoinRoot`, `AddChar.IsPrimitive`, `AdjoinRoot.modByMonicHom`, `AdjoinRoot.powerBasisAux'`.

See [Kowalski](#source-4) — Proof of Proposition 4.11, pp. 46–47, corrected coefficient argument.

<a id="FF2-primitive-modulus-functional-equation"></a>

#### Functional equation for primitive nonreduced moduli

Let F have q elements, g monic of degree d≥1, χ a primitive multiplicative character of R=F[X]/(g), with χ restricted to F× nontrivial. Extend χ to polynomials by reduction and by zero on nonunits. Put c_j=Σ_{h monic,deg h=j}χ(h), L(χ,T)=Σ_{j≥0}c_jT^j, and ψ₁=ψ∘ℓ for nontrivial ψ of F. Then c_j=0 for j≥d, c_j=q^(j−d)τ(χ,ψ₁)τ(χ⁻¹|F×,ψ⁻¹)c_{d−1−j}(χ⁻¹) for 0≤j<d, and L(χ,T)=W T^(d−1)L(χ⁻¹,(qT)⁻¹), W=τ(χ,ψ₁)τ(χ⁻¹|F×,ψ⁻¹)/q, |W|=q^((d−1)/2). This is an identity of Laurent polynomials and yields exact degree d−1.

The hypotheses are as follows. Primitivity on the full possibly nonreduced R. χ|F×≠1; the even-character factor 1−T is outside this statement.

A proof proceeds as follows. Detect the monic degree-j affine subspace using the coefficient pairing and its annihilator, obtaining the coefficient formula above with all h of degree≤d−1−j, including h=0. Apply primitive-finite-ring-gauss-norm: nonunits contribute zero without CRT; units contribute χ⁻¹(h)τ. Group h by their top coefficient. Lower-degree terms cancel under scalar F× because χ|F× is nontrivial. Top coefficients give the finite-field Gauss sum and the displayed coefficient identity. For j≥d, equidistribution of representatives modulo g and the nontriviality of χ give c_j=0. Norms of the two Gauss sums give |W|; c_0=1 gives exact degree.

In particular, verify the following values and consequences.

- For d=1, L=1 and W=1.
- For g=X² over F₃, a primitive character nontrivial on constants has degree-one L; repeated factors do not reduce the modulus degree to its radical degree.

*Needs:* [Primitive Gauss sums over finite commutative rings](#FF2-primitive-finite-ring-gauss-norm), [The coefficient pairing on a polynomial quotient](#FF2-polynomial-quotient-frobenius-pairing), [The finite set of monic polynomials of a given degree](#FF2-monic-polynomials-of-degree), `gaussSum_mul_gaussSum_eq_card`.

See [Kowalski](#source-4) — Proposition 4.11 and its proof, pp. 46–49.

### 2.4 Point counts on Artin–Schreier and Kummer curves

<a id="FF2-trace-kernel-artin-schreier"></a>

#### The kernel of Tr_{L/F} is the image of y ↦ y^q − y (additive Hilbert 90 for finite fields)

Let L/F be an extension of finite fields, q = |F|. For z ∈ L: Tr_{L/F}(z) = 0 if and only if z = y^q − y for some y ∈ L; in that case there are exactly q such y (a coset of F). In particular Tr_{L/F} is onto F.

The hypotheses are as follows. L/F finite extension of finite fields; q = |F|.

A proof proceeds as follows. δ(y) := y^q − y is F-linear on L with kernel F (the roots of X^q − X in L are exactly F: mathlib:FiniteField.roots_X_pow_card_sub_X), so dim_F im δ = [L:F] − 1. im δ ⊆ ker Tr: Tr(y^q) = Tr(y), the trace being the sum over the Frobenius orbit (mathlib:FiniteField.algebraMap_trace_eq_sum_pow). ker Tr is the zero set of the polynomial X + X^q + ⋯ + X^{q^{ν−1}} of degree q^{ν−1}, so |ker Tr| ≤ q^{ν−1} = |im δ|; hence equality, and Tr is onto.

In particular, verify the following values and consequences.

- L = F: Tr = id and y^q − y = 0 for all y ∈ F, so both sides are {0}.
- F = F_2, L = F_4: ker Tr = {0, 1} = {y² − y : y ∈ F_4}.

*Needs:* `FiniteField.roots_X_pow_card_sub_X`, `FiniteField.algebraMap_trace_eq_sum_pow`, `Algebra.trace`.

See [Kowalski](#source-4) — Chapter 1, Lemma 1.3(1), printed p. 9.

<a id="FF2-artin-schreier-point-count-average"></a>

#### Averaging additive sums over the characters of F counts points of y^q − y = f(x)

Let ψ ≠ 1, f ∈ F[X], q = |F|, and L/F finite. Then Σ_{a∈F^×} S_L(a·f, ψ) = #{(x, y) ∈ L × L : y^q − y = f(x)} − |L|.

The hypotheses are as follows. ψ nontrivial; f arbitrary (constant f allowed). The equation uses the q-power, q = |F|, not the p-power.

A proof proceeds as follows. The characters of F are exactly the a ↦ ψ(a·) (ψ primitive: mathlib:AddChar.IsPrimitive.of_ne_one; there are q of them), and Σ_{a∈F} ψ(a t) = q·[t = 0] (mathlib:AddChar.sum_mulShift). Hence Σ_{a∈F} S_L(af, ψ) = q·#{x ∈ L : Tr_{L/F}(f(x)) = 0}. By [The kernel of Tr_{L/F} is the image of y ↦ y^q − y (additive Hilbert 90 for finite fields)](#FF2-trace-kernel-artin-schreier) each such x has exactly q solutions y of y^q − y = f(x), and no other x has any; subtract the a = 0 term |L|.

In particular, verify the following values and consequences.

- f = 0: the left side is (q − 1)|L| and the right side q|L| − |L|.
- f = X: every x with Tr(x) = 0 contributes q solutions, and the left side is 0.

*Needs:* [Additive character sums over the finite extensions of F (companion sums)](#FF2-additive-companion-sum), [The kernel of Tr_{L/F} is the image of y ↦ y^q − y (additive Hilbert 90 for finite fields)](#FF2-trace-kernel-artin-schreier), `AddChar.IsPrimitive.of_ne_one`, `AddChar.sum_mulShift`.

See [Kowalski](#source-4) — Chapter 5, Lemma 5.1, printed pp. 66-67.

<a id="FF2-kummer-point-count-average"></a>

#### Averaging multiplicative sums over the characters of order dividing d counts points of y^d = g(x)

Let d | q − 1, g ∈ F[X] and L/F finite. Then Σ_{χ ≠ 1, χ^d = 1} S̃_L(g, χ) = #{(x, y) ∈ L × L : y^d = g(x)} − |L|, the sum over the nontrivial multiplicative characters of F (MulChar F ℂ) of order dividing d.

The hypotheses are as follows. d | q − 1 (so d | |L| − 1 and F contains the d-th roots of unity). Mathlib's convention χ(0) = 0 for every χ: the identity holds as stated; only the proof step at points with g(x) = 0 depends on the convention.

A proof proceeds as follows. The characters of L of order dividing d are exactly χ ∘ N_{L/F} with χ a character of F of order dividing d: the map χ ↦ χ ∘ N is injective because N is onto F^× (mathlib:FiniteField.norm_surjective), and both groups are cyclic of order d. For t ∈ L^×: #{y ∈ L : y^d = t} = Σ_{χ′^d = 1} χ′(t) (column orthogonality on L^×/(L^×)^d: tauceti:CommGroup.sum_monoidHom_apply_eq_ite). For t = 0 there is one solution y = 0, and every character (trivial included, with Mathlib's convention [Trivial-character and normalisation conventions for Gauss and Jacobi sums](#FF1-trivial-character-conventions)) vanishes at 0; the trivial character contributes #{x : g(x) ≠ 0}, and together with the x where g(x) = 0 this gives |L|.

In particular, verify the following values and consequences.

- d = 1: both sides are 0.
- g = 0: every nontrivial χ gives 0 and the curve y^d = 0 has |L| points.

*Needs:* [Multiplicative character sums over the finite extensions of F](#FF2-multiplicative-companion-sum), `FiniteField.norm_surjective`, `CommGroup.sum_monoidHom_apply_eq_ite`, [Trivial-character and normalisation conventions for Gauss and Jacobi sums](#FF1-trivial-character-conventions).

See [Kowalski](#source-4) — Chapter 4, Lemma 4.16, printed p. 51.

<a id="FF2-upper-to-lower-bound-kummer"></a>

#### From an upper bound for all twists εg to a lower bound for y^d = g(x)

Let F be finite with Q elements, 1 ≤ d and d | Q − 1, g ∈ F[X], and a(h) := #{(x, y) ∈ F² : y^d = h(x)} − Q. If a(εg) ≤ A for every ε ∈ F^×, then #C_g(F) ≥ Q − (d − 1)A. In particular, taking A = max_{ε∈F^×} |a(εg)| gives the displayed source bound.

The hypotheses are as follows. d | Q − 1 (the source also assumes gcd(deg g, d) = 1, which the counting does not use). d ≥ 1. The stronger upper-only hypothesis is the input actually supplied by Stepanov; no lower or absolute bound is assumed in its derivation.

A proof proceeds as follows. Fix representatives ε₁ = 1, …, ε_d of F^×/(F^×)^d; each x with g(x) ≠ 0 has g(x) = ε y^d for exactly one representative ε and exactly d values of y. Counting points with y ≠ 0 on the curves y^d = ε⁻¹g(x): Σ_ε (Q + a(ε⁻¹g) − z) = d(Q − z) with z the number of zeros of g in F, so Σ_ε a(ε⁻¹g) = 0 and a(g) ≥ −(d − 1) max |a(ε⁻¹g)|. More generally, bound each of the other d − 1 (respectively q − 1) summands above by A and solve the zero-sum identity for the untwisted summand. This proves the upper-only version before the absolute-max corollary.

In particular, verify the following values and consequences.

- d = 1: the bound is an equality #C = Q.

*Needs:* `Fintype.card`.

See [Kowalski](#source-4) — Chapter 4, Lemma 4.18, printed p. 52.

<a id="FF2-upper-to-lower-bound-artin-schreier"></a>

#### From an upper bound for all translates g + α to a lower bound for y^q − y = g(x)

Let F_q ⊆ F with |F| = Q and a(h) := #{(x, y) ∈ F² : y^q − y = h(x)} − Q. If a(g + α) ≤ A for every α ∈ F, then #C_g(F) ≥ Q − (q − 1)A. In particular A = max_{α∈F} |a(g + α)| gives the source formulation.

The hypotheses are as follows. F_q ⊆ F finite. Only upper bounds on all translates are needed; do not assume the absolute bound being proved.

A proof proceeds as follows. The group AS := F/{y^q − y} has order q ([The kernel of Tr_{L/F} is the image of y ↦ y^q − y (additive Hilbert 90 for finite fields)](#FF2-trace-kernel-artin-schreier)); with representatives α₁ = 0, …, α_q, every value g(x) is y^q − y + α for exactly one α and q values of y. Hence Σ_α #C_{g−α}(F) = qQ, i.e. Σ_α a(g − α) = 0, and a(g) ≥ −(q − 1) max|a(g + α)|. More generally, bound each of the other d − 1 (respectively q − 1) summands above by A and solve the zero-sum identity for the untwisted summand. This proves the upper-only version before the absolute-max corollary.

In particular, verify the following values and consequences.

- F = F_q: y ↦ y^q − y vanishes on F, so AS = F and the curve y^q − y = g(x) − α has q·#{x ∈ F : g(x) = α} points; the identity Σ_α a(g − α) = 0 reduces to Σ_α #{g(x) = α} = q.

*Needs:* [The kernel of Tr_{L/F} is the image of y ↦ y^q − y (additive Hilbert 90 for finite fields)](#FF2-trace-kernel-artin-schreier), `Fintype.card`.

See [Kowalski](#source-4) — Chapter 5, Lemma 5.3, printed pp. 67-68.

### 2.5 Stepanov's method in Bombieri's form

<a id="FF2-stepanov-curve-ring"></a>

#### The coordinate ring F[X][Y]/(P(Y) − g(X)) of a Stepanov curve

Let F be a field, P ∈ F[Y] monic of degree n ≥ 1 and g ∈ F[X] of degree m ≥ 1 with gcd(n, m) = 1. The Stepanov ring is O(P, g) := F[X][Y]/(P(Y) − g(X)) = AdjoinRoot over F[X] of the monic polynomial P(Y) − g(X) in Y. It is a free F[X]-module with basis 1, Y, …, Y^{n−1}, and its points with values in a field K ⊇ F are the pairs (x, y) ∈ K² with P(y) = g(x). The two instances used are the Kummer ring (P = Y^d, d | |F| − 1, gcd(d, m) = 1) and the Artin–Schreier ring (P = Y^q − Y with F_q ⊆ F, p ∤ m). Its integral-domain property is proved later in [The pole degree is additive on products; Stepanov rings are integral domains](#FF2-pole-degree-mul), after defining the pole degree; it is not an input to this carrier construction.

The hypotheses are as follows. P monic of degree n ≥ 1; deg g = m ≥ 1; gcd(n, m) = 1 (Kowalski assumes it throughout §4.3 and §5.2).

A proof proceeds as follows. P(Y) − C g is monic in Y over F[X]; AdjoinRoot of a monic polynomial is free with the power basis 1, …, Y^{n−1} (mathlib:AdjoinRoot.powerBasis'). Points: F-algebra maps O(P, g) → K correspond to pairs (x, y) with P(y) = g(x) (universal property of AdjoinRoot over F[X]). The domain instance is a later consequence of [The pole degree is additive on products; Stepanov rings are integral domains](#FF2-pole-degree-mul). Construct the quotient, its free basis and its points without assuming that consequence, avoiding a circular dependency.

Provide the following interface.

- `stepanovRing`: O(P, g) = AdjoinRoot (P.map C − C g) over F[X].
- `stepanovRing.basis`: The F[X]-basis 1, Y, …, Y^{n−1}.
- `stepanovRing.pointsEquiv`: F-algebra maps O(P, g) → K correspond to {(x, y) ∈ K × K : P(y) = g(x)}.
- `stepanovRing.finrank`: finrank F[X] O(P, g) = n.
- `stepanovRing.frobeniusTwist`: The F-algebra endomorphism f ↦ f ∘ Fr of O(P, g) raising X and Y to the Q-th power, Q = |F| (coefficients unchanged).
- `stepanovRing.frobenius_pow`: If F is finite with Q elements then for f ∈ O(P, g) the Frobenius twist f ∘ Fr (coefficients unchanged, variables raised to the Q-th power) equals f^Q.
- `stepanovRing.kummerRotate`: For P = Y^d and ξ ∈ F with ξ^d = 1: the F[X]-algebra automorphism Y ↦ ξY.
- `stepanovRing.artinSchreierShift`: For P = Y^q − Y and a ∈ F with a^q = a: the F[X]-algebra automorphism Y ↦ Y + a. Here q is a power of the characteristic, so translation preserves Y^q − Y.
- `IsStepanovInstance`: The two instances treated: P = Y^d with 2 ≤ d, d ∣ |F| − 1, g squarefree, gcd(d, deg g) = 1; or P = Y^q − Y with q a power of p, F_q ⊆ F (exactly q solutions of a^q = a in F) and p ∤ deg g; in both, deg g ≥ 1.

**Checks.**

- `stepanovRing_test_finrank`: For P = Y² and g = X³ + 1: finrank F[X] O = 2.
- `stepanovRing_test_points`: Over ZMod 5: #{(x, y) : y² = x³ + 1} = 5.
- `stepanovRing_test_not_coprime`: For P = Y², g = X² over a field of characteristic ≠ 2 (gcd(n, m) = 2): Y − X is a zero divisor in O(P, g).


In particular, verify the following values and consequences.

- Y² = X³ + 1 over F_5 has 5 affine points.
- rank n over F[X].
- gcd(n, m) ≠ 1 fails: Y² − X² is not a domain in characteristic ≠ 2.

*Needs:* `AdjoinRoot`, `AdjoinRoot.powerBasis'`.

See [Kowalski](#source-4) — Chapter 4, section 4.3, before Definition 4.19, printed p. 54; [Kowalski](#source-4) — Chapter 5, Definition 5.4, printed p. 68.

<a id="FF2-pole-degree"></a>

#### The pole degree at infinity on a Stepanov ring

On O(P, g) (P of degree n, g of degree m, gcd(n, m) = 1) define, for f = Σ_{i<n} g_i(X) Y^i written in the basis of [The coordinate ring F[X][Y]/(P(Y) − g(X)) of a Stepanov curve](#FF2-stepanov-curve-ring), deg f := max{n·deg g_i + i·m : g_i ≠ 0} ∈ ℕ, and deg 0 := ⊥. It is the order of the pole of f at the unique place at infinity: deg X = n, deg Y = m.

The hypotheses are as follows. gcd(n, m) = 1; P monic of degree n; deg g = m. P is monic of degree n ≥ 1, deg g = m ≥ 1, and gcd(n, m) = 1, as in the coordinate-ring construction.

A proof proceeds as follows. Definition through the basis coordinates (a Finsupp over Fin n) and natDegree of the coefficients. Ultrametric inequality: termwise. Multiplicativity is [The pole degree is additive on products; Stepanov rings are integral domains](#FF2-pole-degree-mul).

Provide the following interface.

- `poleDegree`: deg f = max{n·deg g_i + i·m} ∈ WithBot ℕ.
- `poleDegree_X`: deg X = n.
- `poleDegree_Y`: deg Y = m.
- `poleDegree_C`: For a ∈ F[X] nonzero: deg (a as an element of O) = n·natDegree a.
- `poleDegree_add_le`: deg(f₁ + f₂) ≤ max(deg f₁, deg f₂).
- `poleDegree_mul`: deg(f₁f₂) = deg f₁ + deg f₂ ([The pole degree is additive on products; Stepanov rings are integral domains](#FF2-pole-degree-mul)).
- `poleDegree_eq_bot_iff`: deg f = ⊥ iff f = 0.
- `riemannRochSpace`: H(k) = {f ∈ O(P, g) : deg f ≤ k}, the coordinate-ring pole-degree F-subspace. It identifies with L(k·∞) on the smooth projective normalization only when O(P, g) is the ring of all functions regular away from that place (in particular for the smooth Kummer and Artin–Schreier instances). Coprime degrees alone do not make a singular affine ring normal.

**Checks.**

- `poleDegree_test_one`: deg 1 = 0.
- `poleDegree_test_Y_pow`: deg (Y^n) = n·m.
- `poleDegree_test_not_Ydegree`: For P = Y², g = X³: deg(Y²) = 6 = deg(X³), whereas the Y-degree of Y² is 2; the pole degree is not the degree in Y.


In particular, verify the following values and consequences.

- deg 1 = 0.
- deg(Y^n) = n·m: Y^n = g(X) + (lower terms in Y) has leading term of degree n·m.
- deg(C a·X^k) = n·k.

*Needs:* [The coordinate ring F[X][Y]/(P(Y) − g(X)) of a Stepanov curve](#FF2-stepanov-curve-ring).

See [Kowalski](#source-4) — Chapter 4, Definition 4.19, printed p. 54.

<a id="FF2-coprime-semigroup-representation"></a>

#### Representations k = nδ + i m with 0 ≤ i < n are unique, and exist for k ≥ (n − 1)(m − 1)

Let n, m ≥ 1 be coprime. For k ∈ ℕ there is at most one pair (δ, i) ∈ ℕ² with 0 ≤ i < n and k = nδ + i m; such a pair exists whenever k ≥ (n − 1)(m − 1).

The hypotheses are as follows. gcd(n, m) = 1.

A proof proceeds as follows. Uniqueness: reduce modulo n; i m ≡ i′ m forces i ≡ i′ mod n, hence i = i′. Existence for k > nm − n − m: the Frobenius number of {n, m} is nm − n − m (mathlib:frobeniusNumber_pair, for n, m > 1); then reduce the coefficient of m modulo n. The cases n = 1 or m = 1 are immediate. Note (n − 1)(m − 1) = nm − n − m + 1.

In particular, verify the following values and consequences.

- n = 2, m = 3: 1 is not representable, every k ≥ 2 is.
- n = 3, m = 4: the gaps are 1, 2, 5.

*Needs:* `frobeniusNumber_pair`.

See [Kowalski](#source-4) — Chapter 4, Lemma 4.25, printed p. 58.

<a id="FF2-pole-degree-mul"></a>

#### The pole degree is additive on products; Stepanov rings are integral domains

On O(P, g) with gcd(n, m) = 1: for nonzero f₁, f₂, deg(f₁f₂) = deg f₁ + deg f₂. Consequently O(P, g) is an integral domain.

The hypotheses are as follows. gcd(n, m) = 1; P monic of degree n, deg g = m. P is monic of degree n ≥ 1, deg g = m ≥ 1, and gcd(n, m) = 1, as in the coordinate-ring construction.

A proof proceeds as follows. Let the top terms of f₁, f₂ be g_{i₁}Y^{i₁}, g_{i₂}Y^{i₂}, unique by [Representations k = nδ + i m with 0 ≤ i < n are unique, and exist for k ≥ (n − 1)(m − 1)](#FF2-coprime-semigroup-representation) (distinct terms have distinct degrees). If i₁ + i₂ < n their product is a basis term of degree deg f₁ + deg f₂; otherwise rewrite Y^{i₁+i₂} = Y^{i₁+i₂−n}(g(X) + R(Y)) with deg_Y R < n, and the leading contribution g·g_{i₁}g_{i₂}Y^{i₁+i₂−n} again has degree deg f₁ + deg f₂. All other products of terms have strictly smaller degree, again by uniqueness of representations; so the top term survives and the degrees add. Additivity with ⊥ absorbing gives no zero divisors.

In particular, verify the following values and consequences.

- deg(X·Y) = n + m.
- Kummer case P = Y^d is Kowalski's (4.22); Artin–Schreier case P = Y^q − Y is Proposition 5.6(1).

*Needs:* [The coordinate ring F[X][Y]/(P(Y) − g(X)) of a Stepanov curve](#FF2-stepanov-curve-ring), [The pole degree at infinity on a Stepanov ring](#FF2-pole-degree), [Representations k = nδ + i m with 0 ≤ i < n are unique, and exist for k ≥ (n − 1)(m − 1)](#FF2-coprime-semigroup-representation).

See [Kowalski](#source-4) — Chapter 4, Proposition 4.20(1) and its proof, printed pp. 54-57; [Kowalski](#source-4) — Chapter 5, Proposition 5.6(1), printed p. 69.

<a id="FF2-riemann-roch-space-dimension"></a>

#### Dimensions of the spaces H(k) = {deg ≤ k}

On O(P, g) with gcd(n, m) = 1, H(k) := {f : deg f ≤ k} ∪ {0} is an F-subspace with basis {X^δ Y^i : 0 ≤ i < n, nδ + i m ≤ k}. Hence dim H(0) = 1, dim H(k) ≤ dim H(k + 1) ≤ dim H(k) + 1, and, with γ := #(ℕ ∖ (nℕ + mℕ)) the number of gaps of the semigroup generated by n and m, dim H(k) = k + 1 − γ for every k ≥ k₀ := (n − 1)(m − 1); moreover k + 1 − (n − 1)(m − 1) ≤ dim H(k) ≤ k + 1 for all k.

The hypotheses are as follows. gcd(n, m) = 1. γ = (n − 1)(m − 1)/2 is the number of numerical-semigroup gaps. It equals the normalization genus when the affine ring is regular away from its unique infinity place, not for arbitrary singular P/g. For Y² = X³ over F₅, γ = 1 but the normalization is a rational curve of genus 0. P is monic of degree n ≥ 1, deg g = m ≥ 1, and gcd(n, m) = 1, as in the coordinate-ring construction.

A proof proceeds as follows. The monomials X^δY^i (i < n) have pairwise distinct pole degrees nδ + im ([Representations k = nδ + i m with 0 ≤ i < n are unique, and exist for k ≥ (n − 1)(m − 1)](#FF2-coprime-semigroup-representation)), so a combination has the degree of its top monomial ([The pole degree is additive on products; Stepanov rings are integral domains](#FF2-pole-degree-mul), ultrametric inequality): they form a basis of H(k). dim H(k) = #{j ≤ k : j ∈ nℕ + mℕ}; every j ≥ k₀ lies in the semigroup ([Representations k = nδ + i m with 0 ≤ i < n are unique, and exist for k ≥ (n − 1)(m − 1)](#FF2-coprime-semigroup-representation)), so dim H(k) = k + 1 − γ for k ≥ k₀. This corrects the printed lower bound of Kowalski's Lemma 5.7(2).

In particular, verify the following values and consequences.

- n = 2, m = 3: γ = 1 and dim H(k) = k for k ≥ 1; this is a coordinate-ring statement even for the cusp Y² = X³. It is the elliptic Riemann–Roch case only for a smooth cubic model.
- n = 1: γ = 0 and H(k) is the polynomials of degree ≤ k.

*Needs:* [The pole degree at infinity on a Stepanov ring](#FF2-pole-degree), [The pole degree is additive on products; Stepanov rings are integral domains](#FF2-pole-degree-mul), [Representations k = nδ + i m with 0 ≤ i < n are unique, and exist for k ≥ (n − 1)(m − 1)](#FF2-coprime-semigroup-representation).

See [Kowalski](#source-4) — Chapter 4, Lemma 4.24, printed p. 58; [Kowalski](#source-4) — Chapter 5, Lemma 5.7, printed p. 70.

<a id="FF2-stepanov-norm"></a>

#### The norm O(P, g) → F[X] and its degree

N : O(P, g) → F[X], N(f) := Algebra.norm F[X] f (the determinant of multiplication by f on the free F[X]-module O(P, g)). For the Kummer ring (P = Y^d, d | |F| − 1) N(f)(X) = Π_{ξ^d=1} f(X, ξY) and for the Artin–Schreier ring (P = Y^q − Y, F_q ⊆ F) N(f)(X) = Π_{a∈F_q} f(X, Y + a); the specialized product counts conjugates with repetition at a ramified fibre; it is not a product over distinct points without multiplicities. N is multiplicative and natDegree N(f) = deg f for f ≠ 0.

The hypotheses are as follows. The product formulas are for Kummer (n divides |F|−1) and Artin–Schreier (q a positive power of the characteristic, exactly q elements satisfying a^q=a in F). The automorphism group acts simply transitively on the generic separable fibre, not on every Kummer fibre: at g(x)=0 all rotations give the same point. P is monic of degree n ≥ 1, deg g = m ≥ 1, and gcd(n, m) = 1, as in the coordinate-ring construction.

A proof proceeds as follows. N = Algebra.norm F[X] on the free module O(P, g) (mathlib:Algebra.norm). Product formula: over F(X), O ⊗ F(X) is Galois over F(X) with group μ_d (resp. F_q) acting on Y, and the norm is the product of the conjugates. For arbitrary monic P, prove the degree through the multiplication matrix in the basis Y^j, not by assuming that the general extension is Galois. If the unique top monomial of nonzero f is c X^δ Y^i with D = nδ+im, column j has unique weighted top entry in row (i+j) mod n, with coefficient c times the appropriate power of lc(g). For every entry M_(r,j), n deg_X M_(r,j)+rm ≤ D+jm. Every determinant summand has degree ≤ D; equality can occur only for the cyclic permutation r=(i+j) mod n. Its leading coefficient is ±c^n lc(g)^i ≠ 0. Thus natDegree(det M)=D. Lower terms of P and of f have strictly smaller weights. In the two Galois instances the product formula gives the same conclusion.

Provide the following interface.

- `stepanovNorm`: N(f) = Algebra.norm F[X] f.
- `stepanovNorm_mul`: N(f₁f₂) = N(f₁)N(f₂).
- `natDegree_stepanovNorm`: For f ≠ 0: natDegree N(f) = deg f.
- `stepanovNorm_eq_prod_kummer`: For P = Y^d with d | |F| − 1: N(f) = Π_{ξ ∈ μ_d(F)} σ_ξ(f), σ_ξ(Y) = ξY.
- `stepanovNorm_eq_prod_artinSchreier`: For P = Y^q − Y with F_q ⊆ F: N(f) = Π_{a∈F_q} τ_a(f), τ_a(Y) = Y + a.

**Checks.**

- `stepanovNorm_test_X`: N(X) = X^n.
- `stepanovNorm_test_Y_quadratic`: For P = Y²: N(Y) = −g.
- `stepanovNorm_test_C`: N(C a) = a^n for a ∈ F.


In particular, verify the following values and consequences.

- N(X) = X^n.
- Kummer, n = 2: N(Y) = −g(X).
- N(C a) = a^n for a ∈ F.

*Needs:* [The coordinate ring F[X][Y]/(P(Y) − g(X)) of a Stepanov curve](#FF2-stepanov-curve-ring), [The pole degree is additive on products; Stepanov rings are integral domains](#FF2-pole-degree-mul), `Algebra.norm`, [The pole degree at infinity on a Stepanov ring](#FF2-pole-degree).

See [Kowalski](#source-4) — Chapter 4, proof of Proposition 4.20(2), (4.26), printed p. 57; [Kowalski](#source-4) — Chapter 5, proof of Proposition 5.6(2), printed p. 69.

<a id="FF2-stepanov-zero-count"></a>

#### A nonzero M-th power in O(P, g) vanishing on a set S of points satisfies M·|S| ≤ deg f

In the Kummer instance (P = Y^d, d | |F| − 1, g squarefree, gcd(d, deg g) = 1) and in the Artin–Schreier instance (P = Y^q − Y, F_q ⊆ F, p ∤ deg g): if 0 ≠ f ∈ O(P, g) is an M-th power in O(P, g) and vanishes at every point of a finite set S of points of the curve with coordinates in F̄, then M·|S| ≤ deg f.

The hypotheses are as follows. g squarefree in the Kummer case (for the points with y = 0; Kowalski, Remark 4.23).

A proof proceeds as follows. Multiplicity (Kowalski Definition 4.21): at a point with y ≠ 0 (all points in the Artin–Schreier case) X − x is a uniformiser, at y = 0 (Kummer) Y is; a zero has multiplicity ≥ 1 (Lemma 4.22, using d y^{d−1} ≠ 0, resp. ∂(Y^q − Y)/∂Y = −1, resp. g′(x) ≠ 0 for g squarefree). If f = h^M, h vanishes on S, so f has multiplicity ≥ M at each point of S. For an unramified fibre (Kummer y ≠ 0, and every Artin–Schreier fibre), X−x is a local parameter and the norm product gives ord_x N(f) equal to the sum of the orders at the distinct points above x. At a Kummer branch point g(x)=0, squarefreeness gives X−x = Y^d/u with u a local unit. If f has Y-order t, each conjugate has Y-order t, hence their product has Y-order dt and X−x order t, not dt. Thus this single point contributes t once. Sum over distinct points in all fibres to obtain M|S| ≤ natDegree N(f) = deg f. Polynomial root counting now applies with each branch point counted once.

In particular, verify the following values and consequences.

- For f = X−x (M=1), an unramified fibre has n distinct geometric points and n = deg f. A Kummer branch fibre has one point, of multiplicity n for this function.
- Without squarefreeness discard the Kummer points with y=0; their number is at most deg g, not d. This changes only the degree-dependent constant in the resulting bound.

*Needs:* [The norm O(P, g) → F[X] and its degree](#FF2-stepanov-norm), [The pole degree is additive on products; Stepanov rings are integral domains](#FF2-pole-degree-mul), `Polynomial.card_roots'`.

See [Kowalski](#source-4) — Chapter 4, Proposition 4.20(2), printed pp. 54-55; [Kowalski](#source-4) — Chapter 4, Lemma 4.22, printed p. 55.

<a id="FF2-auxiliary-function-uniqueness"></a>

#### Uniqueness of the representation Σ f_j^M s_j^Q when kM < Q

Let F be finite with Q elements, M = p^a dividing Q, and (s_j) a basis of H(κ) with strictly increasing pole degrees d_j (s_j ∈ H(d_j) ∖ H(d_j − 1)); put S_j := s_j^Q (= s_j ∘ Fr). If kM < Q, f_j ∈ H(k) and Σ_j f_j^M S_j = 0, then all f_j = 0. The set H̃(M, k, κ) of such sums is an F-subspace, spanned by the products f₁^M·(f₂ ∘ Fr) with f₁ ∈ H(k), f₂ ∈ H(κ), and dim_F H̃(M, k, κ) = dim H(k)·dim H(κ).

The hypotheses are as follows. kM < Q; M a power of p dividing Q. P is monic of degree n ≥ 1, deg g = m ≥ 1, and gcd(n, m) = 1, as in the coordinate-ring construction.

A proof proceeds as follows. Subspace: α = (α^{Q/M})^M for α ∈ F and (u + v)^M = u^M + v^M (Kowalski Lemma 4.26). If i is the largest index with f_i ≠ 0 and i>0, deg(f_i^M S_i)=M deg f_i+Q d_i exceeds M k+Q d_(i−1)≥deg(Σ_(j<i) f_j^M S_j), since Q(d_i−d_(i−1))≥Q>Mk. If i=0, the lone product is nonzero by the domain property. This degree argument proves uniqueness without comparing adjacent zero coefficients. The map from the tuple (f_j) to its sum is a bijection onto H̃ by uniqueness and definition, and is Frobenius-semilinear rather than F-linear. Over finite F it follows that |H̃| = |H(k)|^(dim H(κ)); comparing powers of |F| gives dim H̃ = dim H(k) dim H(κ). Alternatively untwist the scalar structure by the Frobenius automorphism.

In particular, verify the following values and consequences.

- κ = 0: H̃ = {f^M : f ∈ H(k)}.
- The bound kM < Q is sharp for the argument: with kM = Q, f₁^M S₀ and f₀^M S₁ can have equal degree.

*Needs:* [Dimensions of the spaces H(k) = {deg ≤ k}](#FF2-riemann-roch-space-dimension), [The pole degree is additive on products; Stepanov rings are integral domains](#FF2-pole-degree-mul), [The coordinate ring F[X][Y]/(P(Y) − g(X)) of a Stepanov curve](#FF2-stepanov-curve-ring).

See [Kowalski](#source-4) — Chapter 4, Lemma 4.28, printed p. 61; [Kowalski](#source-4) — Chapter 4, Lemma 4.26, printed p. 60.

<a id="FF2-auxiliary-function-vanishing"></a>

#### If Σ f_j^M s_j = 0 then Σ f_j^M s_j^Q vanishes on all F-points and is an M-th power

With the notation of [Uniqueness of the representation Σ f_j^M s_j^Q when kM < Q](#FF2-auxiliary-function-uniqueness): if Σ_j f_j^M s_j = 0 in O(P, g), then f := Σ_j f_j^M S_j vanishes at every point (x, y) ∈ F² of the curve, and f = (Σ_j f_j · s_j^{Q/M})^M is an M-th power in O(P, g).

The hypotheses are as follows. F finite with Q elements; M | Q a power of p.

A proof proceeds as follows. At a point (x, y) with coordinates in F, s_j^Q(x, y) = s_j(x^Q, y^Q) = s_j(x, y) (Fr fixes F-points), so f(x, y) = Σ f_j(x, y)^M s_j(x, y) = 0. S_j = s_j^Q = (s_j^{Q/M})^M and the M-th power map is additive in characteristic p (stepanovRing.frobenius_pow).

In particular, verify the following values and consequences.

- All f_j = 0 gives f = 0 (the lemma is used with f ≠ 0, which [Uniqueness of the representation Σ f_j^M s_j^Q when kM < Q](#FF2-auxiliary-function-uniqueness) guarantees).

*Needs:* [The coordinate ring F[X][Y]/(P(Y) − g(X)) of a Stepanov curve](#FF2-stepanov-curve-ring), [Uniqueness of the representation Σ f_j^M s_j^Q when kM < Q](#FF2-auxiliary-function-uniqueness).

See [Kowalski](#source-4) — Chapter 4, Lemma 4.27, printed p. 61.

<a id="FF2-auxiliary-function-existence"></a>

#### Existence of a nonzero auxiliary function of controlled pole degree

Let F be finite with Q elements, M = p^a | Q, k₀ = (n − 1)(m − 1) and γ as in [Dimensions of the spaces H(k) = {deg ≤ k}](#FF2-riemann-roch-space-dimension). If kM < Q, k ≥ k₀, κ ≥ k₀ and (k + 1 − γ)(κ + 1 − γ) > kM + κ + 1 − γ, then there are f_j ∈ H(k), not all zero, with Σ_j f_j^M s_j = 0; the auxiliary function f = Σ_j f_j^M s_j^Q is nonzero, vanishes on all F-points of the curve, is an M-th power, and deg f ≤ kM + Qκ.

The hypotheses are as follows. The inequalities as stated (Kowalski (4.31)). P is monic of degree n ≥ 1, deg g = m ≥ 1, and gcd(n, m) = 1, as in the coordinate-ring construction.

A proof proceeds as follows. Δ : H̃(M, k, κ) → H(kM + κ), Σ f_j^M S_j ↦ Σ f_j^M s_j is well defined by uniqueness ([Uniqueness of the representation Σ f_j^M s_j^Q when kM < Q](#FF2-auxiliary-function-uniqueness)) and F_p-linear. dim_{F_p} ker Δ ≥ [F : F_p]((k + 1 − γ)(κ + 1 − γ) − (kM + κ + 1 − γ)) > 0 by [Dimensions of the spaces H(k) = {deg ≤ k}](#FF2-riemann-roch-space-dimension) (all three indices are ≥ k₀). A nonzero element of ker Δ is a nonzero f (uniqueness again); [If Σ f_j^M s_j = 0 then Σ f_j^M s_j^Q vanishes on all F-points and is an M-th power](#FF2-auxiliary-function-vanishing) gives vanishing and the M-th power property; deg f ≤ max_j(M deg f_j + Q d_j) ≤ kM + Qκ.

In particular, verify the following values and consequences.

- γ = 0 (n = 1, the affine line): the construction produces a polynomial vanishing on F of degree ≥ Q, the trivial case.

*Needs:* [Uniqueness of the representation Σ f_j^M s_j^Q when kM < Q](#FF2-auxiliary-function-uniqueness), [If Σ f_j^M s_j = 0 then Σ f_j^M s_j^Q vanishes on all F-points and is an M-th power](#FF2-auxiliary-function-vanishing), [Dimensions of the spaces H(k) = {deg ≤ k}](#FF2-riemann-roch-space-dimension).

See [Kowalski](#source-4) — Chapter 4, section 4.3, the map Δ and (4.31), printed p. 62.

<a id="FF2-stepanov-upper-bound"></a>

#### Stepanov–Bombieri upper bound #C(F_Q) ≤ Q + (2γ + 1)√Q for Q a square

In the Kummer instance (P = Y^d, d | Q − 1, g squarefree, gcd(d, deg g) = 1) and the Artin–Schreier instance (P = Y^q − Y, F_q ⊆ F, p ∤ deg g, deg g < q) over F with Q = p^{2a} elements: if Q > Q₀ := max((γ + 1)⁴, (2k₀)²) then #C(F) ≤ Q + (2γ + 1)√Q, where C(F) = {(x, y) ∈ F² : P(y) = g(x)}. Consequently #C(F) ≤ Q + C₁√Q for every such Q, with C₁ := max(2γ + 1, n·√Q₀) depending only on n and m.

The hypotheses are as follows. Q an even power of p; the hypotheses of [A nonzero M-th power in O(P, g) vanishing on a set S of points satisfies M·|S| ≤ deg f](#FF2-stepanov-zero-count).

A proof proceeds as follows. Take M = √Q = p^a, κ = M + 2γ, k = ⌊γM/(γ + 1)⌋ + γ + 1; then (4.31) holds, Q > (γ + 1)⁴ is sufficient for kM < Q (not an equivalence for the floored k), and k, κ ≥ k₀ for Q > (2k₀)² (Kowalski, pp. 62-63; use (2k₀)² rather than the printed k₀² to ensure k≥k₀). [Existence of a nonzero auxiliary function of controlled pole degree](#FF2-auxiliary-function-existence) gives f ≠ 0, an M-th power vanishing on C(F), with deg f ≤ kM + Qκ. [A nonzero M-th power in O(P, g) vanishing on a set S of points satisfies M·|S| ≤ deg f](#FF2-stepanov-zero-count): M·#C(F) ≤ deg f, so #C(F) ≤ k + Qκ/M = k + Q + 2γ√Q ≤ Q + (2γ + 1)√Q since k < √Q. For Q ≤ Q₀ use the trivial bound #C(F) ≤ nQ ≤ n√Q₀√Q (at most n values of y for each x).

In particular, verify the following values and consequences.

- Kummer with d = 2, deg g = 3 (γ = 1): #C(F_Q) ≤ Q + 3√Q for Q > 16 — Hasse's bound up to the constant.
- The square hypothesis is essential for the choice M = √Q.

*Needs:* [Existence of a nonzero auxiliary function of controlled pole degree](#FF2-auxiliary-function-existence), [A nonzero M-th power in O(P, g) vanishing on a set S of points satisfies M·|S| ≤ deg f](#FF2-stepanov-zero-count), [Dimensions of the spaces H(k) = {deg ≤ k}](#FF2-riemann-roch-space-dimension).

See [Kowalski](#source-4) — Chapter 4, section 4.3, end of the proof, printed p. 63; [Bombieri](#source-17) — section I, p. 235.

<a id="FF2-stepanov-bound-kummer-curve"></a>

#### Stepanov–Bombieri: |#{y^d = g(x)} − Q| ≤ C√Q over fields with Q = p^{2a} elements

Let F be finite with Q = p^{2a} elements, g ∈ F[X] non-constant, d | Q − 1 with gcd(deg g, d) = 1. Then |#{(x, y) ∈ F² : y^d = g(x)} − Q| ≤ C·√Q with C depending only on d and deg g.

The hypotheses are as follows. gcd(deg g, d) = 1; Q a square. g need not be squarefree (the points with y = 0 contribute at most deg g ≤ C′√Q extra, Kowalski Remark 4.23).

A proof proceeds as follows. Upper bound for every εg (same degree): [Stepanov–Bombieri upper bound #C(F_Q) ≤ Q + (2γ + 1)√Q for Q a square](#FF2-stepanov-upper-bound), plus the y = 0 correction when g is not squarefree. Lower bound: [From an upper bound for all twists εg to a lower bound for y^d = g(x)](#FF2-upper-to-lower-bound-kummer) applied with that uniform upper bound.

In particular, verify the following values and consequences.

- For d = 2 and a squarefree cubic g over an odd field, this route gives a degree-dependent C√Q bound. It does not by itself produce the optimal Hasse constant 2; that sharper result comes from the later inverse-root argument and is not claimed here.

*Needs:* [Stepanov–Bombieri upper bound #C(F_Q) ≤ Q + (2γ + 1)√Q for Q a square](#FF2-stepanov-upper-bound), [From an upper bound for all twists εg to a lower bound for y^d = g(x)](#FF2-upper-to-lower-bound-kummer).

See [Kowalski](#source-4) — Chapter 4, Theorem 4.17, printed p. 52.

<a id="FF2-stepanov-bound-artin-schreier-curve"></a>

#### Stepanov–Bombieri: |#{y^q − y = g(x)} − q^{2ν}| ≤ C q^ν over F_{q^{2ν}}

Let g ∈ F_q[X] be non-constant of degree d with p ∤ d and d < q. There is C ≥ 0 depending only on d and q such that for every ν ≥ 1 and every field L ⊇ F_q with q^{2ν} elements: |#{(x, y) ∈ L² : y^q − y = g(x)} − q^{2ν}| ≤ C q^ν.

The hypotheses are as follows. p ∤ d, d < q (as in the source); the base field F_q fixed, the extension L of even degree varying.

A proof proceeds as follows. Upper bound for every translate g + α (α ∈ L; same degree, p ∤ d): [Stepanov–Bombieri upper bound #C(F_Q) ≤ Q + (2γ + 1)√Q for Q a square](#FF2-stepanov-upper-bound) with P = Y^q − Y (n = q, m = d, γ ≤ (q − 1)(d − 1)). Lower bound: [From an upper bound for all translates g + α to a lower bound for y^q − y = g(x)](#FF2-upper-to-lower-bound-artin-schreier).

In particular, verify the following values and consequences.

- q = 4, g = X³ satisfies 3 < 4 and characteristic 2 does not divide 3; y⁴ − y = x³ has genus 3 on its smooth projective model. This route supplies a degree-dependent C√Q bound, not an asserted optimal genus constant. The source-ineligible q = 2, g = X³ test is removed.

*Needs:* [Stepanov–Bombieri upper bound #C(F_Q) ≤ Q + (2γ + 1)√Q for Q a square](#FF2-stepanov-upper-bound), [From an upper bound for all translates g + α to a lower bound for y^q − y = g(x)](#FF2-upper-to-lower-bound-artin-schreier).

See [Kowalski](#source-4) — Chapter 5, Theorem 5.2, printed p. 67.

### 2.6 The one-variable Weil bounds, elementary route

<a id="FF2-additive-l-function-root-bound"></a>

#### Every reciprocal root of L(f, ψ; T) has absolute value at most √q (elementary proof)

Let ψ ≠ 1 and f ∈ F[X] of degree d ≥ 1 with p ∤ d. Write L(f, ψ; T) = Π_j(1 − ω_j T). Then |ω_j| ≤ √q for every j.

The hypotheses are as follows. ψ ≠ 1; p ∤ d; no hypothesis d < q (it is removed by base change).

A proof proceeds as follows. First assume d < q. For every a ∈ F^×, L(af, ψ; T) is a polynomial of degree ≤ d − 1 ([L(f, ψ; T) is a polynomial of degree at most deg f − 1 (p ∤ deg f)](#FF2-additive-l-function-is-polynomial)) with reciprocal roots ω_{a,j}, and S_ν(af, ψ) = −Σ_j ω_{a,j}^ν ([Companion sums are minus the power sums of the reciprocal roots of a polynomial L-function](#FF2-l-function-reciprocal-roots)). Over the extension L of degree 2ν: Σ_{a∈F^×} S_{2ν}(af, ψ) = #{y^q − y = f(x) over L} − q^{2ν} ([Averaging additive sums over the characters of F counts points of y^q − y = f(x)](#FF2-artin-schreier-point-count-average)), of absolute value ≤ C q^ν ([Stepanov–Bombieri: |#{y^q − y = g(x)} − q^{2ν}| ≤ C q^ν over F_{q^{2ν}}](#FF2-stepanov-bound-artin-schreier-curve)). So the finite family (ω_{a,j}²) satisfies |Σ (ω_{a,j}²)^ν| ≤ C q^ν for all ν ≥ 1, and the power-sum converse (request to WeilConjectures:WC.5:power-sum-converse) gives |ω_{a,j}|² ≤ q. If d ≥ q, pass to F′ ⊇ F of degree r with q^r > d: the companion sums of f over F′ with ψ ∘ Tr_{F′/F} are S_{rν}(f, ψ), so the reciprocal roots over F′ are the ω_j^r ([Companion sums are minus the power sums of the reciprocal roots of a polynomial L-function](#FF2-l-function-reciprocal-roots)), and |ω_j^r| ≤ q^{r/2}.

In particular, verify the following values and consequences.

- f = X: there are no reciprocal roots.
- q = 5, f = X²: the single reciprocal root is minus the quadratic Gauss sum, of absolute value exactly √5.

*Needs:* [L(f, ψ; T) is a polynomial of degree at most deg f − 1 (p ∤ deg f)](#FF2-additive-l-function-is-polynomial), [Companion sums are minus the power sums of the reciprocal roots of a polynomial L-function](#FF2-l-function-reciprocal-roots), [Averaging additive sums over the characters of F counts points of y^q − y = f(x)](#FF2-artin-schreier-point-count-average), [Stepanov–Bombieri: |#{y^q − y = g(x)} − q^{2ν}| ≤ C q^ν over F_{q^{2ν}}](#FF2-stepanov-bound-artin-schreier-curve), `WeilConjectures:WC.5:power-sum-converse`.

See [Kowalski](#source-4) — Chapter 4, Lemma 4.15, printed p. 51; [Kowalski](#source-4) — Chapter 5, introduction, printed p. 66.

<a id="FF2-multiplicative-l-function-root-bound-coprime"></a>

#### Every reciprocal root of Z(g, χ; T) has absolute value at most √q when gcd(deg g, ord χ) = 1 (elementary proof)

Let χ have order e ≥ 2 and g ∈ F[X] non-constant with gcd(deg g, e) = 1. Then every reciprocal root Ω of Z(g, χ; T) satisfies |Ω| ≤ √q.

The hypotheses are as follows. gcd(deg g, e) = 1 (the case Kowalski's §4.2-4.3 proves; the general case is [Weil's bound |Σ χ(g(x))| ≤ (m − 1)√q when g is not a constant times an ord(χ)-th power](#FF2-weil-bound-multiplicative)).

A proof proceeds as follows. For every nontrivial χ′ of order dividing e, gcd(deg g, ord χ′) = 1, so g is not c·h^{ord χ′} and Z(g, χ′; T) is a polynomial ([Z(g, χ; T) is a polynomial of degree at most m − 1 when g is not a constant times an e-th power](#FF2-multiplicative-l-function-is-polynomial)) whose companion sums are minus power sums of its reciprocal roots ([Companion sums are minus the power sums of the reciprocal roots of a polynomial L-function](#FF2-l-function-reciprocal-roots)). Over the extension of degree 2ν (which has q^{2ν} elements, a square with e | q^{2ν} − 1): Σ_{χ′≠1, χ′^e=1} S̃_{2ν}(g, χ′) = #{y^e = g(x)} − q^{2ν} ([Averaging multiplicative sums over the characters of order dividing d counts points of y^d = g(x)](#FF2-kummer-point-count-average)), bounded by C q^ν ([Stepanov–Bombieri: |#{y^d = g(x)} − Q| ≤ C√Q over fields with Q = p^{2a} elements](#FF2-stepanov-bound-kummer-curve)). Power-sum converse (WeilConjectures:WC.5:power-sum-converse) on the family of squares of all these reciprocal roots gives |Ω|² ≤ q.

In particular, verify the following values and consequences.

- χ quadratic, g = X³ + aX + b squarefree: the two reciprocal roots have absolute value ≤ √q, hence exactly √q since their product has absolute value q.

*Needs:* [Z(g, χ; T) is a polynomial of degree at most m − 1 when g is not a constant times an e-th power](#FF2-multiplicative-l-function-is-polynomial), [Companion sums are minus the power sums of the reciprocal roots of a polynomial L-function](#FF2-l-function-reciprocal-roots), [Averaging multiplicative sums over the characters of order dividing d counts points of y^d = g(x)](#FF2-kummer-point-count-average), [Stepanov–Bombieri: |#{y^d = g(x)} − Q| ≤ C√Q over fields with Q = p^{2a} elements](#FF2-stepanov-bound-kummer-curve), `WeilConjectures:WC.5:power-sum-converse`.

See [Kowalski](#source-4) — Chapter 4, section 4.2, after Theorem 4.17, printed p. 52.

<a id="FF2-weil-bound-additive"></a>

#### Weil's bound |Σ ψ(f(x))| ≤ (deg f − 1)√q for p ∤ deg f

Let F be a finite field with q elements and characteristic p, ψ a nontrivial additive character of F, and f ∈ F[X] of degree d ≥ 1 with p ∤ d. Then |Σ_{x∈F} ψ(f(x))| ≤ (d − 1)√q, and more generally |S_L(f, ψ)| ≤ (d − 1)|L|^{1/2} for every finite extension L/F.

The hypotheses are as follows. ψ ≠ 1. p ∤ d = deg f, d ≥ 1. The hypothesis cannot be dropped: see [Degenerate case: Artin–Schreier trivial phases have no cancellation](#FF2-artin-schreier-trivial-sum); for polynomials with p | deg f see [Weil's bound for an arbitrary polynomial phase, through the Artin–Schreier reduced form](#FF2-weil-bound-additive-reduced).

A proof proceeds as follows. L(f, ψ; T) = Π_{j=1}^{δ}(1 − ω_jT) with δ ≤ d − 1 ([L(f, ψ; T) is a polynomial of degree at most deg f − 1 (p ∤ deg f)](#FF2-additive-l-function-is-polynomial)). S_ν(f, ψ) = −Σ_j ω_j^ν ([Companion sums are minus the power sums of the reciprocal roots of a polynomial L-function](#FF2-l-function-reciprocal-roots)), and |ω_j| ≤ √q ([Every reciprocal root of L(f, ψ; T) has absolute value at most √q (elementary proof)](#FF2-additive-l-function-root-bound)). Hence |S_ν| ≤ δ q^{ν/2} ≤ (d − 1)q^{ν/2}.

In particular, verify the following values and consequences.

- d = 1: the sum is 0.
- q = 5, f = X²: |Σ ψ(x²)| = √5, equality in the bound.
- F = F_9 (p = 3), f = X³ − X: the sum is 9 > (3 − 1)·3; p | d, and the bound fails — the degenerate case.
- Consumers: ExponentialSumsAndCircleMethod:ES.0 (complete sums modulo a prime), AdditiveCombinatorics AC.5b (Kai, Lemma 7.1).

*Needs:* [L(f, ψ; T) is a polynomial of degree at most deg f − 1 (p ∤ deg f)](#FF2-additive-l-function-is-polynomial), [Companion sums are minus the power sums of the reciprocal roots of a polynomial L-function](#FF2-l-function-reciprocal-roots), [Every reciprocal root of L(f, ψ; T) has absolute value at most √q (elementary proof)](#FF2-additive-l-function-root-bound), [Additive character sums over the finite extensions of F (companion sums)](#FF2-additive-companion-sum).

See [Kowalski](#source-4) — Chapter 3, Theorem 3.2, printed p. 31; [Deligne, Sommes trig.](#source-10) — [Sommes trig.] 3.8, Cas 1, volume pp. 193-194.

<a id="FF2-weil-bound-multiplicative-coprime-degree"></a>

#### Weil's multiplicative bound when gcd(deg g, ord χ) = 1, by Stepanov's method

Let χ have order e ≥ 2 and g ∈ F[X] non-constant with gcd(deg g, e) = 1, with m distinct roots in F̄. Then |Σ_{x∈F} χ(g(x))| ≤ (m − 1)√q, and |S̃_L(g, χ)| ≤ (m − 1)|L|^{1/2} for every finite extension L.

The hypotheses are as follows. gcd(deg g, e) = 1; this is the elementary, unconditional case. The general statement is [Weil's bound |Σ χ(g(x))| ≤ (m − 1)√q when g is not a constant times an ord(χ)-th power](#FF2-weil-bound-multiplicative).

A proof proceeds as follows. Z(g, χ; T) has degree ≤ m − 1 ([Z(g, χ; T) is a polynomial of degree at most m − 1 when g is not a constant times an e-th power](#FF2-multiplicative-l-function-is-polynomial); g is not c·h^e since gcd(deg g, e) = 1). S̃_ν = −Σ Ω_j^ν ([Companion sums are minus the power sums of the reciprocal roots of a polynomial L-function](#FF2-l-function-reciprocal-roots)) and |Ω_j| ≤ √q ([Every reciprocal root of Z(g, χ; T) has absolute value at most √q when gcd(deg g, ord χ) = 1 (elementary proof)](#FF2-multiplicative-l-function-root-bound-coprime)).

In particular, verify the following values and consequences.

- χ quadratic, g = X³ + aX + b squarefree: |Σ χ(g(x))| ≤ 2√q, the Hasse bound for y² = g(x).

*Needs:* [Z(g, χ; T) is a polynomial of degree at most m − 1 when g is not a constant times an e-th power](#FF2-multiplicative-l-function-is-polynomial), [Companion sums are minus the power sums of the reciprocal roots of a polynomial L-function](#FF2-l-function-reciprocal-roots), [Every reciprocal root of Z(g, χ; T) has absolute value at most √q when gcd(deg g, ord χ) = 1 (elementary proof)](#FF2-multiplicative-l-function-root-bound-coprime), [Multiplicative character sums over the finite extensions of F](#FF2-multiplicative-companion-sum).

See [Kowalski](#source-4) — Chapter 3, Theorem 3.1, printed p. 31.

### 2.7 Degenerate cases

<a id="FF2-artin-schreier-reduced-form"></a>

#### The Artin–Schreier reduced form f* of a polynomial

Let F be finite of characteristic p. For f ∈ F[X], the Artin–Schreier reduced form f* is the unique polynomial such that (i) f* − f = h^p − h for some h ∈ X·F[X] (h without constant term) and (ii) f* has no monomial X^j with j ≥ 1 and p | j. It is computed by repeatedly replacing a term c X^{pk} (k ≥ 1) by c^{1/p} X^k, which leaves the constant term unchanged. For the canonical character ψ_can = ψ₀ ∘ Tr_{F/F_p} one has S_L(f, ψ_can) = S_L(f*, ψ_can); for ψ = ψ_can(b ·) the relevant form is (b f)*. The modified degree of f at ∞ is deg f* if f* is non-constant and 0 otherwise; f is Artin–Schreier trivial exactly when f* is constant.

The hypotheses are as follows. F finite of characteristic p (p-th roots exist in F: Frobenius is bijective). The normalisation h(0) = 0 makes f* unique (not merely unique up to ℘(F)).

A proof proceeds as follows. Existence: induction on the largest j ≥ 1 with p | j carrying a nonzero coefficient c; subtracting h^p − h with h = c^{1/p}X^{j/p} removes that monomial and adds c^{1/p}X^{j/p} of smaller degree. Uniqueness: if f₁*, f₂* both satisfy (i)-(ii), their difference is h^p − h with h(0) = 0 and has no monomial of positive degree divisible by p; if h ≠ 0 its term (lead h)^p X^{p deg h} survives, so h = 0. Additivity (f + g)* = f* + g*, by uniqueness.

Provide the following interface.

- `artinSchreierReduced`: f ↦ f*.
- `artinSchreierReduced_sub`: f* − f = h^p − h for some h ∈ F[X] with h(0) = 0.
- `coeff_artinSchreierReduced`: For j ≥ 1 with p | j the coefficient of X^j in f* is 0.
- `artinSchreierReduced_unique`: Any polynomial satisfying the two properties equals f*.
- `artinSchreierReduced_eq_self`: If f has no monomial X^j, j ≥ 1, p | j, then f* = f.
- `artinSchreierReduced_add`: (f + g)* = f* + g*.
- `natDegree_artinSchreierReduced_le`: deg f* ≤ deg f, with equality when p ∤ deg f.

**Checks.**

- `artinSchreierReduced_test_X_pow_p`: (X^p)* = X.
- `artinSchreierReduced_test_trivial`: (X^p − X)* = 0.
- `artinSchreierReduced_test_char_two`: Over a field of characteristic 2: (X² + X)* = 0 although X² + X has degree 2.


In particular, verify the following values and consequences.

- (X^p)* = X; (X^p − X)* = 0; (X^{p²})* = X.
- p = 2: (X² + X)* = 0 — an Artin–Schreier trivial polynomial of degree 2.
- If p ∤ deg f then deg f* = deg f.

*Needs:* `FiniteField.pow_card`.

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Exemple 3.5 a), volume p. 190; [Deligne, Sommes trig.](#source-10) — [Sommes trig.] 3.8, Cas 2, volume p. 194.

<a id="FF2-artin-schreier-invariance"></a>

#### Additive sums with the canonical character are invariant under f ↦ f + h^p − h

Let ψ_can = ψ₀ ∘ Tr_{F/F_p} with ψ₀ a nontrivial character of F_p ([The canonical additive character of a finite field](#FF1-canonical-additive-character)). For h ∈ F[X] and every finite extension L: S_L(f + h^p − h, ψ_can) = S_L(f, ψ_can). Hence S_L(f, ψ_can) = S_L(f*, ψ_can) and L(f, ψ_can; T) = L(f*, ψ_can; T). For a general nontrivial ψ = ψ_can(b ·) (every nontrivial ψ has this form), S_L(f, ψ) = S_L((b f)*, ψ_can).

The hypotheses are as follows. ψ_can the character through the trace to the prime field; p = char F.

A proof proceeds as follows. Tr_{L/F_p}(y^p − y) = 0 for y ∈ L: the absolute trace is invariant under the p-power Frobenius (mathlib:FiniteField.algebraMap_trace_eq_sum_pow over F_p), and Tr_{L/F_p} = Tr_{F/F_p} ∘ Tr_{L/F} (mathlib:Algebra.trace_trace). Every nontrivial ψ is ψ_can.mulShift b for a unique b ∈ F^× ([The canonical additive character of a finite field](#FF1-canonical-additive-character)), and S_L(f, ψ_can.mulShift b) = S_L(b f, ψ_can). Apply to h(x) with x ∈ L and use [The Artin–Schreier reduced form f* of a polynomial](#FF2-artin-schreier-reduced-form).

In particular, verify the following values and consequences.

- f = X^p, p = 3, F = F_9: S(X³) = S(X) = 0.
- The multiplier matters: for b ∈ F ∖ F_p, (b(X^p − X))* = (b^{1/p} − b)X is non-constant, so S_F(b(X^p − X), ψ_can) = 0 while S_F(X^p − X, ψ_can) = q.

*Needs:* [Additive character sums over the finite extensions of F (companion sums)](#FF2-additive-companion-sum), [The Artin–Schreier reduced form f* of a polynomial](#FF2-artin-schreier-reduced-form), [The canonical additive character of a finite field](#FF1-canonical-additive-character), `FiniteField.algebraMap_trace_eq_sum_pow`, `Algebra.trace_trace`.

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Exemple 3.5, (3.5.1) and the line after it, volume p. 191; [Deligne, Sommes trig.](#source-10) — [Sommes trig.] 1.3, (1.3.1), volume pp. 170-171.

<a id="FF2-artin-schreier-trivial-sum"></a>

#### Degenerate case: Artin–Schreier trivial phases have no cancellation

Let ψ = ψ_can(b ·) be nontrivial and f ∈ F[X] with (b f)* = c constant, i.e. b f = h^p − h + c with h ∈ F[X]. Then for every finite extension L: S_L(f, ψ) = |L| · ψ_can(c)^{[L:F]}; in particular |Σ_{x∈F} ψ(f(x))| = q, and L(f, ψ; T) = 1/(1 − ψ_can(c) q T) is not a polynomial.

The hypotheses are as follows. Artin–Schreier triviality relative to ψ (the multiplier b matters: X^p − X is trivial for ψ_can but b(X^p − X) need not be for b ∉ F_p).

A proof proceeds as follows. [Additive sums with the canonical character are invariant under f ↦ f + h^p − h](#FF2-artin-schreier-invariance) reduces to the constant phase c; S_L(c, ψ_can) = |L| ψ_can(Tr_{L/F} c) = |L| ψ_can(c)^{[L:F]}. The L-function: all companion sums are |L|ψ_can(c)^ν, so L = exp(Σ (qψ_can(c)T)^ν/ν) = 1/(1 − ψ_can(c)qT) ([The L-function L(f, ψ; T) of a one-variable additive character sum](#FF2-additive-l-function)).

In particular, verify the following values and consequences.

- F = F_9 (p = 3), f = X³ − X, ψ = ψ_can: Σ ψ(f(x)) = 9 > (3 − 1)·√9 = 6, so no bound (deg f − 1)√q can hold without p ∤ deg f.
- Degenerate acceptance for the stage: this case is tested, not given a square-root bound.

*Needs:* [Additive sums with the canonical character are invariant under f ↦ f + h^p − h](#FF2-artin-schreier-invariance), [The Artin–Schreier reduced form f* of a polynomial](#FF2-artin-schreier-reduced-form), [The L-function L(f, ψ; T) of a one-variable additive character sum](#FF2-additive-l-function).

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Exemple 3.5, volume pp. 190-191.

<a id="FF2-weil-bound-additive-reduced"></a>

#### Weil's bound for an arbitrary polynomial phase, through the Artin–Schreier reduced form

Let ψ = ψ_can(b ·) be nontrivial and f ∈ F[X] arbitrary; let f* := (b f)*. Exactly one of the following holds. (a) f* is a constant c: S_L(f, ψ) = |L|ψ_can(c)^{[L:F]} for every L. (b) f* is non-constant of degree d* (then p ∤ d* automatically): |S_L(f, ψ)| ≤ (d* − 1)|L|^{1/2} for every L.

The hypotheses are as follows. ψ ≠ 1; f arbitrary.

A proof proceeds as follows. S_L(f, ψ) = S_L(f*, ψ_can) ([Additive sums with the canonical character are invariant under f ↦ f + h^p − h](#FF2-artin-schreier-invariance)). Case (a) is [Degenerate case: Artin–Schreier trivial phases have no cancellation](#FF2-artin-schreier-trivial-sum). Case (b): f* has no monomial of positive degree divisible by p, so p ∤ d*; apply [Weil's bound |Σ ψ(f(x))| ≤ (deg f − 1)√q for p ∤ deg f](#FF2-weil-bound-additive) to f* and ψ_can.

In particular, verify the following values and consequences.

- p = 2, F = F_4, f = X⁴ + X: f* = X + X = 0, case (a), and |S| = 4.
- f = X^p + X² with p odd: f* = X + X², d* = 2, bound √q.

*Needs:* [The Artin–Schreier reduced form f* of a polynomial](#FF2-artin-schreier-reduced-form), [Additive sums with the canonical character are invariant under f ↦ f + h^p − h](#FF2-artin-schreier-invariance), [Degenerate case: Artin–Schreier trivial phases have no cancellation](#FF2-artin-schreier-trivial-sum), [Weil's bound |Σ ψ(f(x))| ≤ (deg f − 1)√q for p ∤ deg f](#FF2-weil-bound-additive), [The canonical additive character of a finite field](#FF1-canonical-additive-character).

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] (3.5.2), volume p. 191.

<a id="FF2-multiplicative-perfect-power-sum"></a>

#### Degenerate case: g = c·h^e gives no cancellation for a character of order e

Let χ have order e ≥ 2, c ∈ F^× and h ∈ F[X] nonzero, g = c·h^e. Then for every finite extension L: S̃_L(g, χ) = χ(c)^{[L:F]}·(|L| − #{x ∈ L : h(x) = 0}); in particular |Σ_{x∈F} χ(g(x))| ≥ q − deg h. Z(g, χ; T) = Π_{π | h}(1 − (χ(c)T)^{deg π}) / (1 − χ(c)qT), not a polynomial. Conversely a nonzero polynomial g ∈ F[X] of the form c′·k^e with c′ ∈ F̄ and k ∈ F̄[X] can be written c·h^e with c ∈ F^×, h ∈ F[X] monic.

The hypotheses are as follows. χ of exact order e; the degeneracy condition is 'constant times an e-th power', not 'perfect power': g = X² is not degenerate for a cubic χ, and g = c·h^e with c not an e-th power is degenerate. The converse excludes g = 0; nonzero constants are included by h = 1.

A proof proceeds as follows. χ(h(x)^e) = χ(h(x))^e = 1 when h(x) ≠ 0 and 0 otherwise; N_{L/F}(c h(x)^e) = c^{[L:F]} N(h(x))^e. Descent of h: if g = c′k^e with k monic over F̄ then k^e = g/lc(g) ∈ F[X]; the roots of k and their multiplicities are Frobenius-stable (p ∤ e since e | q − 1), so k ∈ F[X]. The L-function: μ_{g,χ}(π) = χ(c)^{deg π} for π ∤ h and 0 for π | h, and the Euler product ([Euler product and logarithmic derivative of a multiplicative monic L-series](#FF2-monic-l-series-log-derivative)).

In particular, verify the following values and consequences.

- χ cubic, g = X²: not of the form c·h³, and Σ χ(x²) = Σ χ²(x) = 0 — a perfect square is not degenerate for a cubic character.
- χ quadratic, c a non-square, g = c(X² + 1)²: degenerate although not a perfect power.
- χ quadratic, g = X²: Σ χ(x²) = q − 1.

*Needs:* [Multiplicative character sums over the finite extensions of F](#FF2-multiplicative-companion-sum), [The L-function Z(g, χ; T) of a one-variable multiplicative character sum](#FF2-multiplicative-l-function), [Euler product and logarithmic derivative of a multiplicative monic L-series](#FF2-monic-l-series-log-derivative), [Trivial-character and normalisation conventions for Gauss and Jacobi sums](#FF1-trivial-character-conventions).

See [Kowalski](#source-4) — Chapter 4, Remark 4.6(1)-(2), printed p. 41; [Kowalski](#source-4) — Chapter 3, Theorem 3.1, printed p. 31.

### 2.8 The curve route: purity from the Riemann hypothesis for curves


<a id="FF2-artin-schreier-curve-point-count"></a>

#### Degree-one places of E_f over F_{q^ν}: affine solutions plus one

For p ∤ d = deg f and every ν ≥ 1: the number N_ν(E_f) of degree-one places of the constant field extension E_f·F_{q^ν} equals #{(x, y) ∈ F_{q^ν}² : y^q − y = f(x)} + 1.

The hypotheses are as follows. p ∤ deg f.

A proof proceeds as follows. The affine model is regular: ∂(Y^q − Y − f)/∂Y = −1, so F_{q^ν}[X, Y]/(Y^q − Y − f) is the integral closure of F_{q^ν}[X] in E_f F_{q^ν} and its degree-one places over finite x are its F_{q^ν}-points (AlgebraicCurves layer 2, Dedekind bridge). The unique place over ∞ is totally ramified, hence of degree one (AlgebraicCurves Layer 10), and stays so after constant field extension (AlgebraicCurves layer 8).

In particular, verify the following values and consequences.

- q = 2, f = X³: the affine points over F_2 are (0, 0) and (0, 1); with the place at ∞, N₁ = 3 = q + 1, as for the supersingular curve y² + y = x³.

*Needs:* [The Artin–Schreier function field F(X)[Y]/(Y^q − Y − f)](#existing-boundaries).

**Native roadmap interfaces:** `TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`, `TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-`, `TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves`.

See [Kowalski](#source-4) — Chapter 5, Remark 5.5, printed p. 69.

<a id="FF2-artin-schreier-zeta-factorization"></a>

#### The numerator of the zeta function of y^q − y = f(x) is Π_{a≠0} L(af, ψ; T)

Let ψ ≠ 1 and p ∤ d = deg f. With Z_{E_f}(T) = L_{E_f}(T)/((1 − T)(1 − qT)) the zeta function of E_f (L_{E_f} ∈ ℤ[T] of degree 2g, constant term 1): L_{E_f}(T) = Π_{a∈F^×} L(af, ψ; T). Consequently each L(af, ψ; T) has degree exactly d − 1.

The hypotheses are as follows. p ∤ d; ψ nontrivial.

A proof proceeds as follows. log Z_{E_f} = Σ_ν N_ν T^ν/ν (FunctionFieldArithmetic:FA.5, requested), with N_ν = #affine + 1 ([Degree-one places of E_f over F_{q^ν}: affine solutions plus one](#FF2-artin-schreier-curve-point-count)). #affine − q^ν = Σ_{a≠0} S_ν(af, ψ) ([Averaging additive sums over the characters of F counts points of y^q − y = f(x)](#FF2-artin-schreier-point-count-average)) and exp(Σ S_ν(af)T^ν/ν) = L(af, ψ; T) ([The L-function L(f, ψ; T) of a one-variable additive character sum](#FF2-additive-l-function)). Comparing: exp(Σ (N_ν − 1 − q^ν)T^ν/ν) = L_{E_f}(T) = Π_a L(af, ψ; T). Degrees: deg L_{E_f} = 2g = (q − 1)(d − 1) (AlgebraicCurves Layer 10) while each factor has degree ≤ d − 1 ([L(f, ψ; T) is a polynomial of degree at most deg f − 1 (p ∤ deg f)](#FF2-additive-l-function-is-polynomial)); so every factor has degree d − 1.

In particular, verify the following values and consequences.

- q = 2, f = X³: F^× = {1} and L(X³, ψ; T) = L_E(T) = 1 + 2T² (the supersingular curve y² + y = x³), of degree d − 1 = 2.

*Needs:* [The Artin–Schreier function field F(X)[Y]/(Y^q − Y − f)](#existing-boundaries), [Degree-one places of E_f over F_{q^ν}: affine solutions plus one](#FF2-artin-schreier-curve-point-count), [Averaging additive sums over the characters of F counts points of y^q − y = f(x)](#FF2-artin-schreier-point-count-average), [The L-function L(f, ψ; T) of a one-variable additive character sum](#FF2-additive-l-function), [L(f, ψ; T) is a polynomial of degree at most deg f − 1 (p ∤ deg f)](#FF2-additive-l-function-is-polynomial), `FunctionFieldArithmetic:FA.5`.

**Native roadmap interfaces:** `TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves`.

See [Kowalski](#source-4) — Chapter 5, Lemma 5.1, printed pp. 66-67; [Deligne, Sommes trig.](#source-10) — [Sommes trig.] 3.4, volume p. 190.

<a id="FF2-additive-l-function-purity"></a>

#### Weil: L(f, ψ; T) has degree d − 1 and its reciprocal roots are q-Weil numbers of weight 1

Let ψ ≠ 1 and f ∈ F[X] of degree d ≥ 1 with p ∤ d. Then L(f, ψ; T) = Π_{j=1}^{d−1}(1 − ω_jT) with every ω_j an algebraic integer all of whose complex conjugates have absolute value √q.

The hypotheses are as follows. p ∤ d; ψ nontrivial (values in ℚ(μ_p) ⊂ ℂ).

A proof proceeds as follows. By [The numerator of the zeta function of y^q − y = f(x) is Π_{a≠0} L(af, ψ; T)](#FF2-artin-schreier-zeta-factorization) every ω_j is a reciprocal root of L_{E_f}(T) ∈ ℤ[T], and deg L(f, ψ; T) = d − 1. L_{E_f} is the numerator of the zeta function of the smooth projective geometrically connected curve with function field E_f; all its reciprocal roots are algebraic integers with |ι(α)| = √q for every embedding ι (Riemann hypothesis for curves, requested from WeilConjectures:WC.3 in its all-conjugates form, with DeligneWeightsAndPurity:DWP.0's q-Weil numbers). Galois conjugates of ω_j are reciprocal roots of the same integer polynomial L_{E_f}, so the absolute value statement holds for every conjugate.

In particular, verify the following values and consequences.

- q = 5, f = X²: the reciprocal root is minus the quadratic Gauss sum, of absolute value √5; its conjugate by ζ₅ ↦ ζ₅² is the other Gauss sum, also of absolute value √5.

*Needs:* [The numerator of the zeta function of y^q − y = f(x) is Π_{a≠0} L(af, ψ; T)](#FF2-artin-schreier-zeta-factorization), `WeilConjectures:WC.3`, `DeligneWeightsAndPurity:DWP.0`.

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] (3.5.5) and the sentence after it, volume p. 192; [Kowalski](#source-4) — Chapter 4, Proposition 4.14(1), printed p. 50.


<a id="FF2-kummer-curve-point-count"></a>

#### Degree-one places of E_g over F_{q^ν}: affine solutions of y^d = g(x) plus one

Under the hypotheses of AlgebraicCurves Layer 10 (d | q − 1, g squarefree, gcd(d, deg g) = 1), for every ν ≥ 1 the number of degree-one places of E_g·F_{q^ν} is #{(x, y) ∈ F_{q^ν}² : y^d = g(x)} + 1.

The hypotheses are as follows. d | q − 1; g squarefree; gcd(d, deg g) = 1.

A proof proceeds as follows. The affine model y^d = g(x) is regular: at a point with y ≠ 0, ∂/∂Y = d y^{d−1} ≠ 0; at y = 0, g(x) = 0 is a simple root, so ∂/∂X = −g′(x) ≠ 0 (Kowalski Lemma 4.22 and Remark 4.23). Hence its F_{q^ν}-points are the degree-one places over finite points (AlgebraicCurves layer 2). The unique place over ∞ is totally ramified (gcd(d, deg g) = 1), hence of degree one, also after constant field extension (AlgebraicCurves layers 8 and 10).

In particular, verify the following values and consequences.

- d = 2, g = X³ + 1 over F_5: 5 affine points and N₁ = 6 = #E(F_5) for this supersingular elliptic curve.

*Needs:* [The Kummer function field F(X)[Y]/(Y^d − g)](#existing-boundaries).

**Native roadmap interfaces:** `TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`, `TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-`, `TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves`.

See [Kowalski](#source-4) — Chapter 4, Remark 4.23, printed p. 56.

<a id="FF2-kummer-zeta-factorization"></a>

#### The numerator of the zeta function of y^d = g(x) is Π_{χ≠1, χ^d=1} Z(g, χ; T)

Under the hypotheses of AlgebraicCurves Layer 10: L_{E_g}(T) = Π_{χ ≠ 1, χ^d = 1} Z(g, χ; T); each factor has degree exactly m − 1.

The hypotheses are as follows. d | q − 1, g squarefree, gcd(d, deg g) = 1.

A proof proceeds as follows. Degree-one places over F_{q^ν}: [Degree-one places of E_g over F_{q^ν}: affine solutions of y^d = g(x) plus one](#FF2-kummer-curve-point-count). #affine − q^ν = Σ_{χ≠1} S̃_ν(g, χ) ([Averaging multiplicative sums over the characters of order dividing d counts points of y^d = g(x)](#FF2-kummer-point-count-average)); zeta function from FunctionFieldArithmetic:FA.5. Degrees: 2g = (d − 1)(m − 1) and each factor has degree ≤ m − 1 ([Z(g, χ; T) is a polynomial of degree at most m − 1 when g is not a constant times an e-th power](#FF2-multiplicative-l-function-is-polynomial); g is not c·h^{ord χ} since g is squarefree).

In particular, verify the following values and consequences.

- d = 2, g = X³ + aX + b: L_E(T) = Z(g, χ₂; T) = 1 − a_q T + qT², a_q = q − #E_aff(F_q).

*Needs:* [The Kummer function field F(X)[Y]/(Y^d − g)](#existing-boundaries), [Degree-one places of E_g over F_{q^ν}: affine solutions of y^d = g(x) plus one](#FF2-kummer-curve-point-count), [Averaging multiplicative sums over the characters of order dividing d counts points of y^d = g(x)](#FF2-kummer-point-count-average), [The L-function Z(g, χ; T) of a one-variable multiplicative character sum](#FF2-multiplicative-l-function), [Z(g, χ; T) is a polynomial of degree at most m − 1 when g is not a constant times an e-th power](#FF2-multiplicative-l-function-is-polynomial), `FunctionFieldArithmetic:FA.5`.

**Native roadmap interfaces:** `TauCetiRoadmap/AlgebraicCurves#layer-2-affine-models--the-dedekind-bridge`, `TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-`, `TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves`.

See [Kowalski](#source-4) — Chapter 4, Lemma 4.16, printed p. 51.

<a id="FF2-multiplicative-l-function-purity"></a>

#### Weil: for g squarefree with gcd(deg g, ord χ) = 1, Z(g, χ; T) has degree m − 1 and reciprocal roots of weight 1

Let χ have order e ≥ 2 and g ∈ F[X] squarefree of degree m with gcd(m, e) = 1. Then Z(g, χ; T) = Π_{j=1}^{m−1}(1 − Ω_jT) with every Ω_j an algebraic integer all of whose complex conjugates have absolute value √q.

The hypotheses are as follows. g squarefree, gcd(deg g, e) = 1 (the hypotheses of AlgebraicCurves Layer 10 with d = e).

A proof proceeds as follows. [The numerator of the zeta function of y^d = g(x) is Π_{χ≠1, χ^d=1} Z(g, χ; T)](#FF2-kummer-zeta-factorization) with d = e puts every Ω_j among the reciprocal roots of L_{E_g} ∈ ℤ[T] and gives the degree. Riemann hypothesis for the curve of E_g (WeilConjectures:WC.3, all conjugates; DeligneWeightsAndPurity:DWP.0). Alternative elementary proof of |Ω_j| = √q in this case: the product of the Ω_j has absolute value q^{(m−1)/2} ([Exact degree and leading coefficient of Z(g, χ; T)](#FF2-multiplicative-l-function-leading-coefficient)) and each is at most √q ([Every reciprocal root of Z(g, χ; T) has absolute value at most √q when gcd(deg g, ord χ) = 1 (elementary proof)](#FF2-multiplicative-l-function-root-bound-coprime)) — Kowalski's argument after Proposition 4.14.

In particular, verify the following values and consequences.

- χ quadratic, g = X³ + aX + b: Ω₁Ω₂ = ±q and |Ω_i| = √q, the Hasse–Weil statement for elliptic curves (compare Tau Ceti EllipticCurves layer 3).

*Needs:* [The numerator of the zeta function of y^d = g(x) is Π_{χ≠1, χ^d=1} Z(g, χ; T)](#FF2-kummer-zeta-factorization), `WeilConjectures:WC.3`, `DeligneWeightsAndPurity:DWP.0`.

See [Kowalski](#source-4) — Chapter 4, Proposition 4.14(1) and the argument after it, printed p. 50.

### 2.9 Character sheaves, trace functions and Deligne's bound

<a id="FF2-artin-schreier-sheaf"></a>

#### The Artin–Schreier sheaf L_ψ(f)

Fix a prime ℓ ≠ p and a finite extension E of ℚ_ℓ containing the p-th roots of unity; let ψ : F → E^× be a nontrivial additive character. For a separated F-scheme X₀ of finite type and f ∈ Γ(X₀, O) (a morphism X₀ → G_a), L_ψ(f) := ψ^{−1}(f^*𝓛) is the rank-one lisse E-sheaf obtained by pushing the pull-back of the Lang torsor 0 → F → G_a → G_a → 0 (x ↦ x^q − x) along ψ^{−1} (Sommes trig. 1.2, 1.4, Définition 1.7 with G₀ = G_a). Its Frobenius trace at x ∈ X₀(F_{q^ν}) is ψ(Tr_{F_{q^ν}/F}(f(x))) (geometric Frobenius; (1.7.6)-(1.7.7)). On an open U ⊆ A¹_F with function field K = F(X) it is the character of Gal(K^sep/K), σ ↦ ψ^{−1}(σ(t) − t) for any root t of T^q − T − f, unramified on U (FKMS Definition 3.1). It is pure of weight 0, lisse on the open where f is regular, and satisfies L_ψ(f + g) ≅ L_ψ(f) ⊗ L_ψ(g), L_ψ(−f) ≅ L_ψ(f)^∨, L_ψ(h^q − h) ≅ E, L_{ψ(a·)}(f) ≅ L_ψ(af), and u^*L_ψ(f) ≅ L_ψ(f ∘ u).

The hypotheses are as follows. ℓ ≠ p and E contains μ_p. Over ℚ every additive character of F_p with odd p is trivial, as the suggested test says. Over ℚ_ℓ, however, nontrivial p-th roots may already exist (for example μ₃⊂ℚ₇); no blanket impossibility over ℚ_ℓ is asserted. Layer 2 constructs the explicit Lang-torsor sheaves for G_a and G_m and, for the norm-one sums, the quadratic norm torus. Their Lang maps are explicit, so these constructions do not require a general Lang theorem. Pinned conventions: geometric Frobenius; the inverse ψ^{−1} in the definition makes the trace ψ(f(x)) and not its inverse (Sommes trig. 1.7).

A proof proceeds as follows. The Lang torsor of G_a: x ↦ x^q − x is finite étale with kernel F (Sommes trig. (1.4.2)); its fibre at a rational point y carries the Frobenius g ↦ g − y ((1.5.1), additively). Pushing an F-torsor along a character gives a rank-one lisse E-sheaf (Sommes trig. 1.2); the lisse sheaves on a connected X₀ are the continuous representations of π₁(X₀) (requested from SchemeAndStackFoundations:SF.2, the integration owner of the constructible étale and fundamental-group suppliers). Bimultiplicativity and pull-back compatibility from (1.3.1) (sum of torsors) and (1.7.1)-(1.7.4); triviality on h^q − h because f factors through the Lang isogeny. Trace: (1.7.6) at rational points and the norm/trace compatibility (1.6.2), (1.7.7) over F_{q^ν}.

Provide the following interface.

- `artinSchreierSheaf`: On K = a field containing F, the rank-one Galois character σ ↦ ψ⁻¹(σ(t) − t) of the absolute Galois group, t a root of T^q − T − f (the sheaf L_ψ(f) on the open where f is regular, in the Galois-representation language of FKMS Definition 3.1).
- `artinSchreierSheaf_add`: L_ψ(f + g) = L_ψ(f) ⊗ L_ψ(g) (product of characters).
- `artinSchreierSheaf_neg`: L_ψ(−f) = L_ψ(f)^∨ (inverse character).
- `artinSchreierSheaf_sub_self`: L_ψ(h^q − h) is trivial.
- `artinSchreierSheaf_mulShift`: L_{ψ.mulShift a}(f) = L_ψ(a f).
- `artinSchreierSheaf_map`: For a field embedding K → K′ over F, the restriction of L_ψ(f) along Gal(K′^sep/K′) → Gal(K^sep/K) is L_ψ of the image of f (pull-back).
- `artinSchreierCharacter`: The Artin–Schreier character σ ↦ σ(t) − t ∈ F of the absolute Galois group of K (t^q − t = f), with values in F written multiplicatively; artinSchreierSheaf ψ f is ψ⁻¹ composed with it.
- `absoluteGaloisGroupRestrict`: For an F-embedding φ : K → K′ of fields, the restriction Gal(K′^al/K′) → Gal(K^al/K) (through an extension of φ to algebraic closures); the pull-back of sheaves along the generic points.

**Checks.**

- `artinSchreierSheaf_test_trivialChar`: For ψ = 1: artinSchreierSheaf 1 f = 1 (the constant sheaf).
- `artinSchreierSheaf_test_artinSchreier`: For f = h^q − h: artinSchreierSheaf ψ f = 1.
- `artinSchreierSheaf_test_X_nontrivial`: Over K = RatFunc F with ψ ≠ 1: artinSchreierSheaf ψ X ≠ 1.
- `artinSchreierSheaf_test_no_rational_character`: Every additive character of ZMod 3 with values in ℚ is trivial: a nontrivial L_ψ needs coefficients containing μ_p.


In particular, verify the following values and consequences.

- ψ = 1 gives the constant sheaf E (not an acyclic sheaf).
- f = h^q − h gives a trivial sheaf; f = X on A¹ gives a geometrically nontrivial sheaf with H*_c(A¹, L_ψ) = 0 ([H*_c(G, L(χ)) = 0 for a nontrivial character of G₀(F) (Sommes trig. Théorème 2.7*)](#FF2-character-sheaf-cohomology-vanishes)).
- Trace function at x ∈ F of L_ψ(f): ψ(f(x)) ([Trace functions of lisse ℓ-adic sheaves on open subsets of the line](#FF2-trace-function)).

*Needs:* `SchemeAndStackFoundations:SF.2`, `Field.absoluteGaloisGroup`, `AddChar`.

See [Browning–Sawin](#source-15) — section 2, p. 900 (arXiv v3 p. 8); [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Définition 1.7 and (1.7.6), volume pp. 172-173; [Fouvry–Kowalski–Michel–Sawin](#source-13) — section 4.2.3, p. 12.

<a id="FF2-kummer-sheaf"></a>

#### The Kummer sheaf L_χ(g)

With ℓ, E as in [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf) (E ⊇ μ_{q−1}) and χ : F^× → E^× a multiplicative character, for g ∈ Γ(X₀, O)^× (a morphism X₀ → G_m) L_χ(g) := χ^{−1}(g^*𝓛) with 𝓛 the Lang torsor 1 → F^× → G_m → G_m → 1 (x ↦ x^{q−1}). Its trace at x ∈ X₀(F_{q^ν}) is χ(N_{F_{q^ν}/F}(g(x))). On U ⊆ A¹ it is the character σ ↦ χ^{−1}(σ(t)/t) of Gal(K^sep/K), t^{q−1} = g. It is pure of weight 0, tamely ramified at the zeros and poles of g, and L_χ(g₁g₂) ≅ L_χ(g₁) ⊗ L_χ(g₂), L_{χχ′}(g) ≅ L_χ(g) ⊗ L_{χ′}(g), L_χ(h^{e}) ≅ E for e the order of χ.

The hypotheses are as follows. χ a character of F^× (a Mathlib MulChar restricted to units); ℓ ≠ p; E ⊇ values of χ.

A proof proceeds as follows. Lang torsor of G_m: (1.4.3), Frobenius on fibres (1.5.1). Push-out along χ^{−1} (Sommes trig. 1.2) and the dictionary with π₁-representations (SchemeAndStackFoundations:SF.2). (1.7.1)-(1.7.7) as for L_ψ.

Provide the following interface.

- `kummerSheaf`: The Galois character σ ↦ χ⁻¹(σ(t)/t), t^{q−1} = g, for g a unit of K.
- `kummerSheaf_mul`: L_χ(g₁g₂) = L_χ(g₁) ⊗ L_χ(g₂).
- `kummerSheaf_mul_char`: L_{χχ′}(g) = L_χ(g) ⊗ L_{χ′}(g).
- `kummerSheaf_pow_orderOf`: L_χ(h^{orderOf χ}) is trivial.
- `kummerSheaf_map`: Compatibility with field embeddings K → K′ over F (pull-back).

**Checks.**

- `kummerSheaf_test_trivialChar`: For χ = 1: kummerSheaf 1 g = 1.
- `kummerSheaf_test_power`: kummerSheaf χ (h ^ orderOf χ) = 1.
- `kummerSheaf_test_X_nontrivial`: Over K = RatFunc F with χ ≠ 1: kummerSheaf χ X ≠ 1.


In particular, verify the following values and consequences.

- χ = 1: the constant sheaf.
- g = h^e (e = ord χ): trivial.
- g = X on G_m with χ ≠ 1: nontrivial, tame at 0 and ∞, H*_c(G_m, L_χ) = 0.

*Needs:* `SchemeAndStackFoundations:SF.2`, `Field.absoluteGaloisGroup`, `MulChar`.

See [Fouvry–Kowalski–Michel–Sawin](#source-13) — section 4.2.2, p. 11; [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Exemples (1.4.3), volume p. 172.

<a id="FF2-character-sheaf-trace-formula"></a>

#### Trace formula for products of Artin–Schreier and Kummer characters (Scholie 1.9)

Let S₀ be a separated F-scheme of finite type, f¹, …, f^r ∈ Γ(S₀, O) and g¹, …, g^s ∈ Γ(S₀, O)^×, ψ_i additive and χ_j multiplicative characters, and 𝓕 := ⊗_i L_{ψ_i}(f^i) ⊗ ⊗_j L_{χ_j}(g^j). For every ν ≥ 1: Σ_{s∈S₀(F_{q^ν})} Π_i ψ_i(Tr_{F_{q^ν}/F} f^i(s)) Π_j χ_j(N_{F_{q^ν}/F} g^j(s)) = Σ_k (−1)^k Tr(F^{*ν} | H^k_c(S_F̄, 𝓕)), and the H^k_c are finite-dimensional, zero for k ∉ [0, 2 dim S₀].

The hypotheses are as follows. S₀ separated of finite type; the Grothendieck–Lefschetz trace formula for E-sheaves is imported (Sommes trig. 1.1, (1.1.1)).

A proof proceeds as follows. The trace of F^ν at s on 𝓕 is the product of the character values ((1.7.5)-(1.7.7), [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf), [The Kummer sheaf L_χ(g)](#FF2-kummer-sheaf)). Apply the Grothendieck–Lefschetz trace formula over F_{q^ν} (requested from SchemeAndStackFoundations:SF.2, the integration owner of the TraceFormula supplier), with finiteness and the vanishing range.

In particular, verify the following values and consequences.

- S₀ = Spec F, trivial characters: 1 = Tr(F* | H⁰).
- S₀ = A¹, f = X: 0 = Σ(−1)^k Tr(F* | H^k_c(A¹, L_ψ)) with all H^k_c = 0.

*Needs:* [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf), [The Kummer sheaf L_χ(g)](#FF2-kummer-sheaf), `SchemeAndStackFoundations:SF.2`.

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Scholie 1.9, volume p. 174.

<a id="FF2-homotopy-invariance-of-endomorphism-action"></a>

#### A connected family of endomorphisms acts by one endomorphism on H*_c (Sommes trig. Lemme 2.8)

Let k be algebraically closed, X a separated k-scheme of finite type, Y a connected k-scheme, 𝓕 a sheaf on X, and (p, c) a family of endomorphisms of (X, 𝓕) parametrised by Y: p : Y × X → Y × X a proper Y-morphism and c : p^*pr₂^*𝓕 → pr₂^*𝓕. Then the endomorphism ρ_H(y) of H*_c(X, 𝓕) induced by (p_y, c_y) is independent of y ∈ Y(k).

The hypotheses are as follows. p proper over Y; Y connected.

A proof proceeds as follows. (p, c) induces an endomorphism of R pr_{1!} pr₂^*𝓕, which is the constant sheaf on Y with value H*_c(X, 𝓕) (proper base change); an endomorphism of a constant sheaf on a connected Y is constant (proper base change and constancy requested from SchemeAndStackFoundations:SF.2).

In particular, verify the following values and consequences.

- Y = a point: nothing to prove.
- Translations t_x on a connected group G: all act on H*_c(G, E) as the identity.

*Needs:* `SchemeAndStackFoundations:SF.2`.

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Lemme 2.8, volume pp. 187-188.

<a id="FF2-character-sheaf-cohomology-vanishes"></a>

#### H*_c(G, L(χ)) = 0 for a nontrivial character of G₀(F) (Sommes trig. Théorème 2.7*)

Let G₀ ∈ {G_a, G_m} over F (or a product of copies of them) and χ a nontrivial character of G₀(F). Then H^i_c(G_F̄, L(χ)) = 0 for all i. In particular H*_c(A¹_F̄, L_ψ) = 0 for ψ ≠ 1 and H*_c(G_{m,F̄}, L_χ) = 0 for χ ≠ 1.

The hypotheses are as follows. χ nontrivial. (Sommes trig. states it for any connected commutative G₀; Layer 2 needs G_a, G_m and products.)

A proof proceeds as follows. For g on the upstairs Lang torsor G→G, translation t_g covers the downstairs translation t_Lang(g) and induces an automorphism ρ(g) of (G,L(χ)). When g belongs to its kernel G₀(F), the downstairs map is the identity and the induced sheaf map is scalar multiplication by χ(g)⁻¹. Do not identify this with translation by g on the downstairs base. This family of lifted automorphisms is parametrised by the connected upstairs group G. Homotopy invariance of the endomorphism action makes its cohomological action independent of g and equal to the identity at e. Choosing x ∈ G₀(F) with χ(x) ≠ 1, (χ(x)^{−1} − 1) kills H*_c, so H*_c = 0 — the cohomological analogue of Σ_a χ(a) = 0.

In particular, verify the following values and consequences.

- χ = 1: H²_c(A¹, E) = E(−1) ≠ 0; the hypothesis is needed.
- The trace formula then gives Σ_{x∈F_{q^ν}} ψ(Tr x) = 0 for all ν.

*Needs:* [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf), [The Kummer sheaf L_χ(g)](#FF2-kummer-sheaf), [A connected family of endomorphisms acts by one endomorphism on H*_c (Sommes trig. Lemme 2.8)](#FF2-homotopy-invariance-of-endomorphism-action).

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Théorème 2.7*, volume p. 187; [Browning–Sawin](#source-15) — proof of Lemma 3.2, p. 910 (arXiv v3 p. 17).

<a id="FF2-translation-cancellation"></a>

#### Cancellation along a free G_a-orbit direction (Browning–Sawin Lemma 3.2)

Let Y be a variety over a separably closed field k of characteristic p, φ : Y → A¹, u ∈ O(Y)^×, and a : Y × G_a → Y an action of G_a with φ(a(y, λ)) = φ(y) + u(y)λ. Then H^i_c(Y, φ^*L_ψ) = 0 for all i (ψ ≠ 1).

The hypotheses are as follows. a a genuine G_a-action; u a unit; ψ nontrivial.

A proof proceeds as follows. u is invariant along orbits: comparing φ(a(y, λ₁ + λ₂)) computed two ways gives u(a(y, λ₁)) = u(y). a′(y, λ) := (a(y, λ/u(y)), λ) is an automorphism of Y × A¹ (inverse (y, λ) ↦ (a(y, −λ/u(y)), λ)) with a′^*(φ^*L_ψ ⊠ E) ≅ φ^*L_ψ ⊠ L_ψ (additivity of L_ψ, [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf)). Künneth with H*_c(A¹, E) = E(−1)[−2]: H^i_c(Y, φ^*L_ψ) ≅ H^{i+2}_c(Y × A¹, φ^*L_ψ ⊠ E)(1) (the compact-support shift is i+2 with twist (1)), and the right side is H*_c(Y, φ^*L_ψ) ⊗ H*_c(A¹, L_ψ) = 0 by [H*_c(G, L(χ)) = 0 for a nontrivial character of G₀(F) (Sommes trig. Théorème 2.7*)](#FF2-character-sheaf-cohomology-vanishes) (Künneth and the cohomology of A¹ requested from SchemeAndStackFoundations:SF.2).

In particular, verify the following values and consequences.

- Y = A¹, φ = id, a = translation, u = 1: recovers H*_c(A¹, L_ψ) = 0.
- u = 0 (not a unit): φ constant along orbits and no cancellation.

*Needs:* [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf), [H*_c(G, L(χ)) = 0 for a nontrivial character of G₀(F) (Sommes trig. Théorème 2.7*)](#FF2-character-sheaf-cohomology-vanishes), `SchemeAndStackFoundations:SF.2`.

See [Browning–Sawin](#source-15) — Lemma 3.2, p. 910 (arXiv v3 p. 16).

<a id="norm-one-lang-sheaf"></a>

#### Lang character sheaf on the quadratic norm torus

Let E/F be the quadratic extension of a finite field, T=ker(N:Res_{E/F}G_m→G_m), and ω:T(F)→E_λ× a character, where ℓ≠p and E_λ contains its values. Construct the rank-one sheaf L_ω as the appropriate character summand of the pushforward of the constant sheaf along the Lang torsor u↦Frob_F(u)u⁻¹. Choose the deck-character convention so the geometric-Frobenius trace at u∈T(F) is ω(u). After base change to F̄, T is G_m and L_ω is a Kummer sheaf with finite tame monodromy. It is geometrically constant exactly when ω=1.

The construction uses the representable norm torus, the Lang finite étale torsor, and the six operations. Over F̄ the Lang map is z↦z^{−(q+1)}, so its degree is q+1 and is prime to p. Taking the ω-character summand gives a line and descends the split Kummer construction; a choice of splitting is not part of the final sheaf.

Provide the following interface.

- `normTorusLangSheaf`: the descended rank-one E_λ-sheaf on the actual norm torus.
- `normTorusLangSheaf_trace`: its rational-point trace is ω with the stated Frobenius and deck conventions.
- `normTorusLangSheaf_baseChange`: identify its split pullback with the Kummer character indexed by ω.
- `normTorusLangSheaf_tensor`: character multiplication corresponds to tensor product.
- `normTorusLangSheaf_tame`: finite monodromy, tameness at zero and infinity, and geometric constancy iff ω=1.

**Checks.**

- For ω=1 the sheaf is constant and every rational-point trace is 1.
- For nontrivial ω the split monodromy character is nontrivial; a constant-sheaf replacement fails this test.
- For q=3 the torsor has degree 4 and kernel T(F) of order 4; a generator character has a primitive fourth-root trace at a generator of T(F).
- Changing the splitting of E/F exchanges z with z⁻¹ and inverts the displayed split character, while leaving the descended trace function unchanged.

*Needs:* the norm torus from the scheme contract, finite étale descent and the six operations; the character-sheaf construction and trace formula in this layer.

See [Deligne, Sommes trig.](#source-10), §1.4–1.8, volume pp. 171–174, for the Lang-torsor character construction; [Katz, Soto–Andrade](#source-42), proof of Theorem 1, pp. 145–147, for its norm-torus application.

<a id="FF2-trace-function"></a>

#### Trace functions of lisse ℓ-adic sheaves on open subsets of the line

Let U ⊆ A¹_F be a dense open subset defined over F, K = F(X), and 𝓕 a lisse E-sheaf on U, i.e. a continuous representation ρ : Gal(K^sep/K) → GL(V) on a finite-dimensional E-space, unramified at every closed point of U (FKMS Definition 3.1). The trace function of 𝓕 is t_𝓕(x) := Tr(ρ(Frob_x) | V) for x ∈ U(F), Frob_x a geometric Frobenius element at the place X − x; over F_{q^ν}, t_{𝓕,ν}(x) = Tr(ρ(Frob_π)^{ν/deg π}) for x ∈ U(F_{q^ν}) with minimal polynomial π (FKMS (3.3)). Extended by zero off U(F) (FKMS Remark 3.7; the middle extension differs by at most rk(𝓕)·#(A¹ ∖ U)(F), Remark 3.12). It is additive in direct sums, multiplicative in tensor products, the dual has trace equal to the sum of inverse eigenvalues (the reciprocal of the original trace only in rank one), and pull-back composes with the map. Direct-sum and tensor identities use a fixed common lisse open U and the same zero-extension convention; they do not assert tensor compatibility of arbitrary middle extensions.

The hypotheses are as follows. U dense open in A¹ over F; ρ continuous and unramified on U; ι : E → ℂ a fixed embedding when complex values are needed.

A proof proceeds as follows. Unramified at x: the inertia group at a place above X − x acts trivially, so the Frobenius coset acts by a well-defined conjugacy class (FKMS Definition 3.4, Remark 3.3). Trace is a class function; tensor products and duals of representations give products and inverse-transpose traces.

Provide the following interface.

- `traceFunctionRankOne`: The suggested partial API evaluates a rank-one Galois character at one fixed chosen geometric Frobenius lift at X−x. This is intrinsic only where the character is unramified. It neither implements zero extension nor middle extension outside a specified lisse open; those sheaf APIs remain upstream-dependent.
- `traceFunctionRankOne_mul`: t_{ρ₁ρ₂} = t_{ρ₁}·t_{ρ₂} (tensor product).
- `traceFunctionRankOne_one`: The trivial character has trace function 1.
- `traceFunctionRankOne_inv`: t_{ρ⁻¹}(x) = t_ρ(x)⁻¹ (dual).
- `traceFunctionRankOne_artinSchreierSheaf`: For f ∈ F[X]: t_{L_ψ(f)}(x) = ψ(f(x)).
- `traceFunctionRankOne_kummerSheaf`: For g ∈ F[X] with g(x) ≠ 0: t_{L_χ(g)}(x) = χ(g(x)).

**Checks.**

- `traceFunctionRankOne_test_one`: t_1(x) = 1 for all x.
- `traceFunctionRankOne_test_artinSchreier_X`: For f = X: t_{L_ψ(X)}(x) = ψ(x).
- `traceFunctionRankOne_test_artinSchreier_trivial`: For f = X^q − X the trace function is identically 1, although f is non-constant.


In particular, verify the following values and consequences.

- Constant sheaf: t ≡ 1.
- Artin–Schreier sheaf L_ψ(f), f ∈ F[X]: t(x) = ψ(f(x)).
- Kummer sheaf L_χ(g): t(x) = χ(g(x)) where g(x) ≠ 0.

*Needs:* [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf), [The Kummer sheaf L_χ(g)](#FF2-kummer-sheaf), `Field.absoluteGaloisGroup`, `IsArithFrobAt`, `RatFunc`.

See [Fouvry–Kowalski–Michel–Sawin](#source-13) — Definition 3.5, p. 6; [Fouvry–Kowalski–Michel–Sawin](#source-13) — Remark 3.8, (3.3), p. 7.

<a id="FF2-lisse-sheaf-extremal-cohomology-on-curve"></a>

#### H⁰_c and H²_c of a lisse sheaf on an affine curve

Let U₀ be a smooth geometrically connected curve over F which is not proper (e.g. a dense open of A¹), and 𝓕 a lisse E-sheaf on U₀ with geometric monodromy G_geom = π₁(U_F̄). Then H⁰_c(U_F̄, 𝓕) = 0, H^i_c(U_F̄, 𝓕) = 0 for i > 2, and H²_c(U_F̄, 𝓕) ≅ (V_𝓕)_{G_geom}(−1), Frobenius-equivariantly (coinvariants, Tate twist). Hence H²_c = 0 when 𝓕 has no nonzero geometrically trivial quotient (e.g. 𝓕 geometrically irreducible and nontrivial); for 𝓕 of rank one, H²_c ≠ 0 exactly when 𝓕 is geometrically trivial, and then Frobenius acts on H²_c by q times a scalar of absolute value 1 (for 𝓕 pure of weight 0).

The hypotheses are as follows. U₀ smooth, geometrically connected, not proper; 𝓕 lisse.

A proof proceeds as follows. H⁰_c(U, 𝓕) consists of global sections with proper support, zero on a non-proper connected curve (Sommes trig. 1.18 b)). Vanishing above 2 dim U (Sommes trig. 1.18 a); requested from SchemeAndStackFoundations:SF.2). H²_c via Poincaré duality with H⁰(U, 𝓕^∨(1)) = ((V^∨)^{G_geom})(1) (Sommes trig. 1.18 d), requested from EtaleDualityAndPerverseSheaves:EDC.2). The correct dimension-one twist is (1); duality uses (n), not (2n), in dimension n.

In particular, verify the following values and consequences.

- Constant sheaf on A¹: H²_c = E(−1), Frobenius acts by q.
- L_ψ(X) on A¹: all H^i_c = 0.

*Needs:* `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`.

See [Fouvry–Kowalski–Michel–Sawin](#source-13) — section 4.1, (4.2), p. 11; [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Remarques 1.18 b)–d), volume pp.178–179, for H⁰_c, duality and the H²_c coinvariant description respectively.

<a id="FF2-modified-pole-order"></a>

#### The modified pole order v*_x(f) of a rational function (Sommes trig. Exemple 3.5)

Let X₀ be a smooth projective absolutely irreducible curve over F, f a rational function on X₀ and x a closed point. v_x(f) := order of the pole of f at x (0 if f is regular at x) and v*_x(f) := min_g v_x(f + g^p − g), the minimum over rational functions g. If p ∤ v_x(f) > 0 then v*_x(f) = v_x(f); v*_x(f + g^p − g) = v*_x(f); v*_x(f) = 0 iff f + g^p − g is regular at x for some g; If f=g^p−g+c, then every modified pole order is zero. The converse holds on P¹, but is not claimed for arbitrary positive-genus curves: nontrivial unramified Artin–Schreier covers can have all local modified pole orders zero. On X₀ = P¹ with f a polynomial, v*_∞(f) is the degree of the Artin–Schreier reduced form when that is non-constant.

The hypotheses are as follows. X₀ smooth projective absolutely irreducible; the minimum exists since v_x ≥ 0 values are natural numbers.

A proof proceeds as follows. Invariance: the set {f + g^p − g} is unchanged. p ∤ v_x(f): v_x(g^p − g) is either ≤ 0 or divisible by p, so it cannot cancel the pole of order v_x(f). For polynomials on P¹: [The Artin–Schreier reduced form f* of a polynomial](#FF2-artin-schreier-reduced-form) lowers the pole order at ∞ to deg f*, and no further reduction is possible.

Provide the following interface.

- `modifiedPoleOrderInfty`: For f ∈ RatFunc F: v*_∞(f) = min over g of the pole order at ∞ of f + g^p − g.
- `modifiedPoleOrderInfty_add_artinSchreier`: v*_∞(f + g^p − g) = v*_∞(f).
- `modifiedPoleOrderInfty_le`: v*_∞(f) ≤ v_∞(f).
- `modifiedPoleOrderInfty_eq_of_not_dvd`: If the pole order m of f at ∞ is positive and p ∤ m then v*_∞(f) = m.
- `modifiedPoleOrderInfty_polynomial`: For a polynomial f with non-constant reduced form: v*_∞(f) = deg f*.

**Checks.**

- `modifiedPoleOrderInfty_test_X_pow_p`: v*_∞(X^p) = 1.
- `modifiedPoleOrderInfty_test_artinSchreier`: v*_∞(X^p − X) = 0.
- `modifiedPoleOrderInfty_test_not_poleOrder`: v*_∞(X^p) = 1 ≠ p = v_∞(X^p).


In particular, verify the following values and consequences.

- v*_∞(X^p) = 1 on P¹.
- v*_∞(X^p − X) = 0.
- v*_0(X^{−1}) = 1.

*Needs:* [The Artin–Schreier reduced form f* of a polynomial](#FF2-artin-schreier-reduced-form), `RatFunc`.

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Exemple 3.5 a), b), volume p. 190.

<a id="FF2-swan-conductor-of-artin-schreier-sheaf"></a>

#### Sw_x(L(ψf)) = v*_x(f) (Sommes trig. (3.5.4))

Let X₀, f be as in [The modified pole order v*_x(f) of a rational function (Sommes trig. Exemple 3.5)](#FF2-modified-pole-order) and the canonical nontrivial character ψ_can(a)=exp(2πi Tr(a)/p). At a closed point x with v*_x(f) = 0, L(ψf) extends to a lisse sheaf near x (after replacing f by f + g^p − g). At x with v*_x(f) > 0 it is wildly ramified with Swan conductor Sw_x(L(ψf)) = v*_x(f), and (j_*L(ψf))_x = 0. For a general nontrivial ψ(a)=ψ_can(ba), b≠0, replace f by bf throughout: the Swan order is v*_x(bf), not necessarily v*_x(f).

The hypotheses are as follows. ψ is the canonical trace character, as in Sommes trig. Exemple 3.5. For another character ψ_can(b·), reduce bf rather than f. The Swan conductor is the equal-characteristic local conductor after extending residues to F̄, with the complete-DVR and unramified-base-change contract above.

A proof proceeds as follows. Reduce to v_x(f) = v*_x(f) =: m with p ∤ m ([The modified pole order v*_x(f) of a rational function (Sommes trig. Exemple 3.5)](#FF2-modified-pole-order)). The character of L(ψf) at x factors through the Artin–Schreier extension T^p − T = f of the completed local field; its unique upper ramification break is m (AlgebraicCurves layer 10: different exponent (p − 1)(m + 1); a cyclic group of order p has equal lower and upper breaks; the ramification filtration from Tau Ceti LocalFieldsRamification layer 3), so the Swan conductor of the nontrivial rank-one character is m (Weil I Lemma 8.13, citing Serre). To pass from arithmetic local fields to the geometric local field, use the complete-DVR conductor calculation and unramified scalar-extension invariance in the supplier contract. At a ramified point of a rank-one sheaf the inertia invariants vanish, so (j_*L)_x = 0.

In particular, verify the following values and consequences.

- f = X on P¹: Sw_∞ = 1, the conductor of L_ψ is 3 (FKMS 4.2.3).
- f = X^p: Sw_∞ = v*_∞ = 1, not p.
- f = x + a/x: Sw_0 = Sw_∞ = 1 (Kloosterman).
- Over F₉, f=X³−X has v*_∞(f)=0. For b∉F₃, the reduced form of bf is (b^(1/3)−b)X, nonzero, so the corresponding general-character Swan conductor is 1. The canonical-character guard is essential.

*Needs:* [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf), [The modified pole order v*_x(f) of a rational function (Sommes trig. Exemple 3.5)](#FF2-modified-pole-order), `ArithmeticGaloisRepresentations:R01.3`, [Artin–Schreier breaks over geometric local fields](#FF2-geometric-artin-schreier-break).

**Native roadmap interfaces:** `TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves`, `TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] (3.5.4), volume p. 191; [Deligne, Weil I](#source-11) — Lemme 8.13, p. 306.

<a id="FF2-h1c-conductor-bound"></a>

#### dim H¹_c(U, 𝓕) ≤ C(𝓕)², with the conductor C(𝓕) = rk 𝓕 + #S + Σ Sw_x(𝓕)

Let U ⊊ P¹_F be a dense open, S := P¹(F̄) ∖ U(F̄), and 𝓕 lisse on U with Swan conductors Sw_x(𝓕) at x ∈ S. Put C(𝓕) := rk 𝓕 + #S + Σ_{x∈S} Sw_x(𝓕) (FKMS Definition 4.3). Then dim H¹_c(U_F̄, 𝓕) = dim H²_c − χ_c = dim H²_c − rk 𝓕·(2 − #S) + Σ_x Sw_x(𝓕) ≤ rk 𝓕·(#S − 1) + Σ_x Sw_x(𝓕) ≤ C(𝓕)².

The hypotheses are as follows. U not all of P¹ (so H⁰_c = 0); 𝓕 lisse on U.

A proof proceeds as follows. H⁰_c = 0 and dim H²_c ≤ rk 𝓕 ([H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve)). Grothendieck–Ogg–Shafarevich formula χ_c(U, 𝓕) = rk 𝓕 · χ_c(U) − Σ_x Sw_x(𝓕) with χ_c(U) = 2 − #S (requested from EtaleDualityAndPerverseSheaves:EDC.2; including the E_λ-adic coefficient comparison). Arithmetic.

In particular, verify the following values and consequences.

- L_ψ on A¹: C = 3, h¹_c = 0 ≤ 9.
- L_ψ(aX + b/X) on G_m: C = 1 + 2 + 2 = 5, h¹_c = 2.
- Constant sheaf on A¹: h¹_c = 0 and h²_c = 1.

*Needs:* [H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve), `EtaleDualityAndPerverseSheaves:EDC.2`.

See [Fouvry–Kowalski–Michel–Sawin](#source-13) — Theorem 4.2 and Definition 4.3, p. 11; [Fouvry–Kowalski–Michel–Sawin](#source-13) — Definition 4.3, (4.3), p. 11.

<a id="FF2-deligne-bound-for-trace-functions"></a>

#### Deligne's bound for sums of trace functions, with the H²_c main term subtracted

Let U ⊆ A¹_F be a dense open, 𝓕 a lisse E-sheaf on U, ι-mixed of weights ≤ 0 (e.g. punctually pure of weight 0), and ι : E → ℂ. For every ν ≥ 1: |Σ_{x∈U(F_{q^ν})} ι t_{𝓕,ν}(x) − ι Tr(Frob^ν | H²_c(U_F̄, 𝓕))| ≤ dim H¹_c(U_F̄, 𝓕) · q^{ν/2} ≤ C(𝓕)² q^{ν/2}. The main term Tr(Frob^ν | (V_𝓕)_{G_geom}(−1)) has absolute value ≤ rk 𝓕 · q^ν and vanishes when 𝓕 has no nonzero geometrically trivial quotient; it is not zero in general (the constant sheaf gives q^ν).

The hypotheses are as follows. U ≠ P¹; 𝓕 lisse on U, ι-mixed of weights ≤ 0. H²_c is not assumed to vanish: the main term is subtracted, not discarded.

A proof proceeds as follows. Trace formula (requested from SchemeAndStackFoundations:SF.2): Σ t_{𝓕,ν} = Σ_i (−1)^i Tr(Frob^ν | H^i_c), with H⁰_c = 0 and H^i_c = 0 for i > 2 ([H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve)). Weights: every eigenvalue of Frobenius on H¹_c has ι-absolute value ≤ q^{1/2} (Weil II Corollaire 3.3.4, requested from DeligneWeightsAndPurity:DWP.7). Hence |Σ t − Tr(H²_c)| = |Tr(H¹_c)| ≤ h¹_c q^{ν/2}, and h¹_c ≤ C(𝓕)² ([dim H¹_c(U, 𝓕) ≤ C(𝓕)², with the conductor C(𝓕) = rk 𝓕 + #S + Σ Sw_x(𝓕)](#FF2-h1c-conductor-bound)). The main term: H²_c = coinvariants(−1), eigenvalues of absolute value ≤ q^ν on the weight ≤ 0 coinvariants twisted by (−1).

In particular, verify the following values and consequences.

- 𝓕 = E constant on U = A¹: Σ 1 = q^ν = Tr(H²_c) and H¹_c = 0 — the main term is everything.
- 𝓕 = L_ψ(f), f ∈ F[X], p ∤ deg f: H²_c = 0, h¹_c = deg f − 1, giving [Weil's bound |Σ ψ(f(x))| ≤ (deg f − 1)√q for p ∤ deg f](#FF2-weil-bound-additive).
- 𝓕 geometrically irreducible nontrivial: |Σ t| ≤ C(𝓕)² q^{ν/2} (FKMS Corollary 4.7).

*Needs:* [Trace functions of lisse ℓ-adic sheaves on open subsets of the line](#FF2-trace-function), [H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve), [dim H¹_c(U, 𝓕) ≤ C(𝓕)², with the conductor C(𝓕) = rk 𝓕 + #S + Σ Sw_x(𝓕)](#FF2-h1c-conductor-bound), `SchemeAndStackFoundations:SF.2`, `DeligneWeightsAndPurity:DWP.7`.

See [Fouvry–Kowalski–Michel–Sawin](#source-13) — Theorem 4.6 and Corollary 4.7, p. 13; [Deligne, Weil II](#source-12) — Corollaire 3.3.4, p. 206.

<a id="FF2-deligne-estimate-for-character-sums"></a>

#### Deligne's estimate for character sums on a variety by the Betti numbers of the character sheaf (1.17.1)

In the setting of [Trace formula for products of Artin–Schreier and Kummer characters (Scholie 1.9)](#FF2-character-sheaf-trace-formula) (S₀ separated of finite type, 𝓕 = ⊗ L_{ψ_i}(f^i) ⊗ ⊗ L_{χ_j}(g^j)): for every ν ≥ 1, |Σ_{s∈S₀(F_{q^ν})} Π_i ψ_i(Tr f^i(s)) Π_j χ_j(N g^j(s))| ≤ Σ_k dim H^k_c(S_F̄, 𝓕) · q^{νk/2}.

The hypotheses are as follows. The character sheaves are pure of weight 0 (Frobenius traces are roots of unity).

A proof proceeds as follows. [Trace formula for products of Artin–Schreier and Kummer characters (Scholie 1.9)](#FF2-character-sheaf-trace-formula). Every eigenvalue of Frobenius on H^k_c has all complex conjugates of absolute value q^{m/2} with m ≤ k (Weil II Corollaire 3.3.4 / Sommes trig. Théorème 1.17; requested from DeligneWeightsAndPurity:DWP.7).

In particular, verify the following values and consequences.

- S₀ = A¹, 𝓕 = L_ψ(f), p ∤ deg f: only H¹_c, of dimension deg f − 1.
- Sommes trig. 1.18 e): the bound can be worse than the trivial bound when b_{2n} = 0 is not known.

*Needs:* [Trace formula for products of Artin–Schreier and Kummer characters (Scholie 1.9)](#FF2-character-sheaf-trace-formula), `DeligneWeightsAndPurity:DWP.7`.

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Théorème 1.17 and (1.17.1), volume p. 178.

<a id="FF2-affine-concentration-criterion"></a>

#### If H_c → H is an isomorphism on a smooth affine variety, cohomology is concentrated in the middle degree and pure (Sommes trig. 1.19-1.21)

(a) Let X̄ be proper over an algebraically closed field, j : X → X̄ open, 𝓕 on X with (j_*𝓕)_x = 0 for x ∈ X̄ ∖ X and R^i j_*𝓕 = 0 for i > 0; then H^i_c(X, 𝓕) → H^i(X, 𝓕) is an isomorphism for all i. (b) Let X₀ be smooth affine of pure dimension n over F and 𝓕₀ lisse punctually pure of weight m with H^i_c(X, 𝓕) → H^i(X, 𝓕) an isomorphism for all i; then H^i_c(X, 𝓕) = 0 for i ≠ n and H^n_c(X, 𝓕) is pure of weight m + n. (c) If X₀ is smooth separated and H^i_c(X, 𝓕) → H^i(X, 𝓕) is injective, then H^i_c(X, 𝓕) is pure of weight m + i.

The hypotheses are as follows. As stated in each part; X₀ affine in (b) (Artin vanishing).

A proof proceeds as follows. (a): the hypotheses mean j_!𝓕 ≅ Rj_*𝓕 (Proposition 1.19). (b): Poincaré duality pairs H^i_c(𝓕) with H^{2n−i}(𝓕^∨(n)) (EtaleDualityAndPerverseSheaves:EDC.2); Artin vanishing H^i = 0 for i > n on affine X (requested from SchemeAndStackFoundations:SF.2); so H^i_c = 0 for i < n and, via the isomorphism, for i > n; purity from the upper bounds on H^n_c(𝓕) and H^n_c(𝓕^∨(n)) (Weil II 3.3.4, DeligneWeightsAndPurity:DWP.7). (c): injectivity plus the two weight bounds (Remark 1.21).

In particular, verify the following values and consequences.

- X = A¹, 𝓕 = L_ψ(f), p ∤ deg f: the hypothesis of (a) holds at ∞ (totally wild, no inertia invariants), giving H¹_c pure of weight 1.

*Needs:* `EtaleDualityAndPerverseSheaves:EDC.2`, `SchemeAndStackFoundations:SF.2`, `DeligneWeightsAndPurity:DWP.7`.

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Proposition 1.20, volume p. 180; [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Proposition 1.19, volume p. 179.

<a id="FF2-geometric-artin-schreier-break"></a>

#### Artin–Schreier breaks over geometric local fields

Let k be perfect of characteristic p and K=k((t)). If u∈K has valuation −m<0 with p∤m, the extension L/K defined by y^p−y=u is cyclic of degree p, totally ramified, and has lower and upper break m. Over algebraically closed k a nontrivial character of its group has Swan conductor m and no inertia invariants. Applied after Artin–Schreier reduction and after scaling the phase for a general additive character, this supplies the local computation in the earlier Swan node.

The hypotheses are as follows. m>0, p∤m; geometric conductors are computed after extending residues to the algebraic closure. A general ψ=ψ_can(b·) uses u=bf, not f.

A proof proceeds as follows. Import AGR §3.7 `artinSchreier_break` and `artinSchreier_swanConductor` for the general complete-DVR calculation, after the perfect-residue filtration contract is supplied. Here identify the native Artin–Schreier function-field extension, its completed place and the local character-sheaf representation with that input. In the function-field Place presentation, reuse `TauCeti.Place.exists_uniformizer_ord_aut_sub_of_artinSchreier_pole`. Transport its normalized order and automorphism action through the AlgebraicCurves completion bridge and identify the action y↦y+c on the completed local extension. The displacement calculation chooses 1≤a<p and b∈ℤ with bp−am=1: pi=t^b y^a has valuation 1, and for c≠0 the ratio (1+c/y)^a differs from 1 in valuation m. Thus v_L(σ_c pi−pi)=m+1. The comparison must identify this native lower group with the supplied complete-DVR lower group, hence its upper break and Swan conductor with m. Establish the corresponding Laurent-series specialization over every perfect k; identify the character sheaf's local representation with the nontrivial character of this extension, so its inertia invariants vanish. This is a comparison with the existing field-level target, not another general break theorem or a use of finite-residue upper numbering over k̄((t)).

In particular, verify the following values and consequences.

- u=t^(−m) gives Sw=m.
- u=t^(−p) is reduced to t^(−1); its Swan conductor is 1, so the raw-pole statement without p∤m fails.
- At p=2,u=t^(−1) the extension is quadratic with break 1. The phase u=0 gives a split torsor and Swan 0; it is excluded by the pole hypothesis.

**Compatibility**

- The TauCeti.Place displacement theorem concerns a generated integral function-field extension. This target adds the geometric ℓ-adic conductor and the k((t)) completion comparison.

*Needs:* [The modified pole order v*_x(f) of a rational function (Sommes trig. Exemple 3.5)](#FF2-modified-pole-order), [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf), `ArithmeticGaloisRepresentations:R01.3/artin-schreier-break`, `ArithmeticGaloisRepresentations:R01.3/artin-schreier-swan-conductor`, `TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-`.

See [Serre](#source-37) — §4.4, Lemma 4′, pp. 144–145; [Deligne, Sommes trig.](#source-10) — Exemple 3.5, (3.5.4), volume p. 191.

### 2.10 The ℓ-adic route to the multiplicative and mixed bounds

<a id="FF2-rank-one-sheaf-l-function"></a>

#### The elementary L-function of a rank-one character sum is det(1 − T·Frob | H¹_c) when it is a polynomial

Let g ∈ F[X] be nonzero, U = A¹ ∖ {g = 0}, f ∈ F[X][1/g] (regular on U), ψ additive, χ multiplicative characters, 𝓕 = L_ψ(f) ⊗ L_χ(g) on U, and Λ(h) := ψ(Tr_{F[X]/(h)}(f))·χ(Res(h, g)) for monic h coprime to g, Λ(h) := 0 otherwise. If the monic L-series L(Λ; T) is a polynomial, then H²_c(U_F̄, 𝓕) = 0 and L(Λ; T) = det(1 − T·Frob | H¹_c(U_F̄, 𝓕)); in particular dim H¹_c(U_F̄, 𝓕) = deg L(Λ; T).

The hypotheses are as follows. f regular on U; L(Λ; T) a polynomial (as proved elementarily in [L(f, ψ; T) is a polynomial of degree at most deg f − 1 (p ∤ deg f)](#FF2-additive-l-function-is-polynomial), [Z(g, χ; T) is a polynomial of degree at most m − 1 when g is not a constant times an e-th power](#FF2-multiplicative-l-function-is-polynomial), [The L-function of a mixed sum χ(g(x))ψ(f(x)) is a polynomial of degree at most m + n − 1](#FF2-mixed-l-function-is-polynomial), [The L-function of Kloosterman sums is 1 + K T + qT² (Carlitz)](#FF2-kloosterman-l-function)).

A proof proceeds as follows. Λ(π) is the Frobenius trace of 𝓕 at the closed point π of U ([The root-sum character h ↦ ψ(Σ_{h(α)=0} f(α)) of an additive character and a polynomial](#FF2-root-sum-additive-character), [The root-product character h ↦ χ(Res(h, g)) of a multiplicative character and a polynomial](#FF2-root-sum-multiplicative-character), (1.7.6)), so L(Λ; T) is the L-function of 𝓕 on U, which the trace formula writes as Π_i det(1 − T Frob | H^i_c)^{(−1)^{i+1}} (SchemeAndStackFoundations:SF.2). H⁰_c = 0 ([H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve)), so L(Λ; T) = det(1 − T Frob | H¹_c)/det(1 − T Frob | H²_c). Eigenvalues on H²_c have absolute value q (weight 2: coinvariants of a weight-0 sheaf twisted by (−1)); eigenvalues on H¹_c have absolute value ≤ √q (DeligneWeightsAndPurity:DWP.7). No cancellation is possible, so a polynomial L(Λ; T) forces H²_c = 0.

In particular, verify the following values and consequences.

- f = X, g = 1: L = 1 and H¹_c(A¹, L_ψ) = 0.
- f = aX + bX^{−1}, g = X, χ trivial: L = 1 + K T + qT², dim H¹_c(G_m, L_ψ(aX + b/X)) = 2.

*Needs:* [Euler product and logarithmic derivative of a multiplicative monic L-series](#FF2-monic-l-series-log-derivative), [The root-sum character h ↦ ψ(Σ_{h(α)=0} f(α)) of an additive character and a polynomial](#FF2-root-sum-additive-character), [The root-product character h ↦ χ(Res(h, g)) of a multiplicative character and a polynomial](#FF2-root-sum-multiplicative-character), [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf), [The Kummer sheaf L_χ(g)](#FF2-kummer-sheaf), [H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve), `SchemeAndStackFoundations:SF.2`, `DeligneWeightsAndPurity:DWP.7`.

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Théorème 1.15 proof, volume p. 177; [Kowalski](#source-4) — Chapter 5, section 5.3, printed p. 70.

<a id="FF2-rank-one-sheaf-root-bound"></a>

#### Reciprocal roots of polynomial rank-one L-functions have absolute value at most √q (Deligne route)

In the setting of [The elementary L-function of a rank-one character sum is det(1 − T·Frob | H¹_c) when it is a polynomial](#FF2-rank-one-sheaf-l-function), if L(Λ; T) = Π_j(1 − ω_jT) is a polynomial, then |ι(ω_j)| ≤ √q for every j and every embedding ι of the coefficient field into ℂ.

The hypotheses are as follows. L(Λ; T) a polynomial.

A proof proceeds as follows. The ω_j are the Frobenius eigenvalues on H¹_c(U_F̄, 𝓕) ([The elementary L-function of a rank-one character sum is det(1 − T·Frob | H¹_c) when it is a polynomial](#FF2-rank-one-sheaf-l-function)); 𝓕 is pure of weight 0 (its Frobenius traces at closed points are roots of unity); H¹_c is mixed of weights ≤ 1 (Weil II 3.3.4, DeligneWeightsAndPurity:DWP.7).

In particular, verify the following values and consequences.

- f = X², q = 5: ω = −g with |g| = √5.
- Kloosterman: ω₁ω₂ = q forces |ω_i| = √q.

*Needs:* [The elementary L-function of a rank-one character sum is det(1 − T·Frob | H¹_c) when it is a polynomial](#FF2-rank-one-sheaf-l-function), `DeligneWeightsAndPurity:DWP.7`.

See [Deligne, Weil II](#source-12) — Corollaire 3.3.4, p. 206.

<a id="FF2-weil-bound-multiplicative"></a>

#### Weil's bound |Σ χ(g(x))| ≤ (m − 1)√q when g is not a constant times an ord(χ)-th power

Let χ be a multiplicative character of F of order e ≥ 2 and nonzero g ∈ F[X] not of the form c·h^e with c ∈ F̄, h ∈ F̄[X]; let m be the number of distinct roots of g in F̄. Then |Σ_{x∈F} χ(g(x))| ≤ (m − 1)√q, and |S̃_L(g, χ)| ≤ (m − 1)|L|^{1/2} for every finite extension L.

The hypotheses are as follows. χ of exact order e ≥ 2 (the trivial character is excluded: Mathlib's trivial MulChar would count the non-roots of g). The degenerate polynomials are the c·h^e, including c not an e-th power ([Degenerate case: g = c·h^e gives no cancellation for a character of order e](#FF2-multiplicative-perfect-power-sum)); being a power h^k with e ∤ k does not by itself decide degeneracy; X² is nondegenerate for a cubic character, whereas (X³)² is degenerate. g ≠ 0; geometric degeneracy is tested after mapping to F̄[X]. χ(0) = 0, including the trivial MulChar convention.

A proof proceeds as follows. Z(g, χ; T) is a polynomial of degree ≤ m − 1 ([Z(g, χ; T) is a polynomial of degree at most m − 1 when g is not a constant times an e-th power](#FF2-multiplicative-l-function-is-polynomial)). Its reciprocal roots have |ω| ≤ √q ([Reciprocal roots of polynomial rank-one L-functions have absolute value at most √q (Deligne route)](#FF2-rank-one-sheaf-root-bound) with f = 0, applied to the Kummer sheaf L_χ(g) on {g ≠ 0}). S̃_ν = −Σ ω_j^ν ([Companion sums are minus the power sums of the reciprocal roots of a polynomial L-function](#FF2-l-function-reciprocal-roots)).

In particular, verify the following values and consequences.

- χ quadratic, g = X³ + aX + b squarefree: |Σ χ(g(x))| ≤ 2√q (Hasse).
- χ cubic, g = X²: m = 1, the bound gives 0, and indeed Σ χ(x²) = 0.
- χ quadratic, g = c(X² + 1)² with c a non-square: degenerate, |Σ| = q − #{x² + 1 = 0} (not bounded by (m − 1)√q).
- Over F_7 choose χ(3)=exp(2πi/3), an exact cubic character. The six nonzero values of χ(x²) have each cubic root of unity twice, so the sum is zero: X² is not geometrically a cube.
- For the same χ, Σ_x χ(3x³) = 6χ(3), of modulus 6. The scalar 3 is not a cube in F_7, but 3X³ is geometrically a scalar times a cube and must be excluded.

*Needs:* [Z(g, χ; T) is a polynomial of degree at most m − 1 when g is not a constant times an e-th power](#FF2-multiplicative-l-function-is-polynomial), [Reciprocal roots of polynomial rank-one L-functions have absolute value at most √q (Deligne route)](#FF2-rank-one-sheaf-root-bound), [Companion sums are minus the power sums of the reciprocal roots of a polynomial L-function](#FF2-l-function-reciprocal-roots), [Multiplicative character sums over the finite extensions of F](#FF2-multiplicative-companion-sum).

See [Kowalski](#source-4) — Chapter 3, Theorem 3.1, printed p. 31; [Deligne, Sommes trig.](#source-10) — [Sommes trig.] (1.17.1), volume p. 178.

<a id="FF2-weil-bound-mixed"></a>

#### Weil's bound for mixed sums |Σ χ(g(x))ψ(f(x))| ≤ (m + n − 1)√q

Let ψ ≠ 1, f ∈ F[X] of degree n ≥ 1 with p ∤ n, χ any multiplicative character and g ∈ F[X] nonzero with m distinct roots in F̄. Then |Σ_{x∈F} χ(g(x))ψ(f(x))| ≤ (m + n − 1)√q, and likewise over every finite extension.

The hypotheses are as follows. p ∤ n = deg f ≥ 1; χ may be trivial (then the sum is over g(x) ≠ 0).

A proof proceeds as follows. The L-function of Λ = λ_{f,ψ}μ_{g,χ} is a polynomial of degree ≤ m + n − 1 ([The L-function of a mixed sum χ(g(x))ψ(f(x)) is a polynomial of degree at most m + n − 1](#FF2-mixed-l-function-is-polynomial)). Its reciprocal roots have |ω| ≤ √q ([Reciprocal roots of polynomial rank-one L-functions have absolute value at most √q (Deligne route)](#FF2-rank-one-sheaf-root-bound) for L_ψ(f) ⊗ L_χ(g) on {g ≠ 0}). Companion sums are −Σ ω^ν ([Companion sums are minus the power sums of the reciprocal roots of a polynomial L-function](#FF2-l-function-reciprocal-roots)).

In particular, verify the following values and consequences.

- g = 1: recovers [Weil's bound |Σ ψ(f(x))| ≤ (deg f − 1)√q for p ∤ deg f](#FF2-weil-bound-additive) (m = 0).
- f = X, g = X, χ ≠ 1: a Gauss sum, bound √q, attained.

*Needs:* [The L-function of a mixed sum χ(g(x))ψ(f(x)) is a polynomial of degree at most m + n − 1](#FF2-mixed-l-function-is-polynomial), [Reciprocal roots of polynomial rank-one L-functions have absolute value at most √q (Deligne route)](#FF2-rank-one-sheaf-root-bound), [Companion sums are minus the power sums of the reciprocal roots of a polynomial L-function](#FF2-l-function-reciprocal-roots).

See [Kowalski](#source-4) — Chapter 3, introduction, printed p. 31.

<a id="FF2-artin-schreier-sum-on-curve-bound"></a>

#### Weil–Deligne bound for additive sums of a rational function on a curve (Sommes trig. (3.5.2))

Let X₀ be a smooth projective absolutely irreducible curve of genus g over F, f a rational function on X₀ not of the form h^p − h + c (h rational, c ∈ F), ψ(x) = exp(2πi Tr_{F/F_p}(x)/p), and S_f := Σ′_{x∈X₀(F)} ψ(f(x)), the sum over the rational points with v*_x(f) = 0, where ψ(f(x)) := ψ((f + h^p − h)(x)) for any h making f + h^p − h regular at x. Then H^i(X̄, j_*L(ψf)) = 0 for i ≠ 1, S_f = −Tr(F* | H¹(X̄, j_*L(ψf))), this H¹ has dimension 2g − 2 + Σ_{v*_x(f)>0}[k(x):F](1 + v*_x(f)), every eigenvalue has all complex conjugates of absolute value q^{1/2}, and |S_f| ≤ (2g − 2 + Σ_{v*_x(f)≠0}[k(x):F](1 + v*_x(f))) q^{1/2}.

The hypotheses are as follows. f not Artin–Schreier trivial; j : U₀ → X₀ the open where f is regular.

A proof proceeds as follows. Trace formula for j_*L(ψf) on the proper X₀ (SchemeAndStackFoundations:SF.2) with the local computation: F*_x = ψ(f(x)) where v*_x = 0 and (j_*L)_x = 0 where v*_x > 0 ([Sw_x(L(ψf)) = v*_x(f) (Sommes trig. (3.5.4))](#FF2-swan-conductor-of-artin-schreier-sheaf), (1.7.6)). L(ψf) is geometrically non-constant (else f = h^p − h + λ); so H⁰ = 0 and, by duality, H² = 0 ([H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve), EtaleDualityAndPerverseSheaves:EDC.2). Dimension by the Grothendieck–Ogg–Shafarevich formula (3.2.1) with Sw_x = v*_x(f) (requested from EtaleDualityAndPerverseSheaves:EDC.2, with the stated coefficient comparison). Purity of H¹(X̄, j_*𝓕) for 𝓕 punctually pure of weight 0: Weil II Théorème 3.2.3 (requested from DeligneWeightsAndPurity:DWP.6); Sommes trig. 3.4 attributes the case of sheaves trivialised by a finite cover to Weil.

In particular, verify the following values and consequences.

- X₀ = P¹, f polynomial with p ∤ deg f: g = 0, one point ∞ with v* = deg f, dimension deg f − 1 ([Weil's bound |Σ ψ(f(x))| ≤ (deg f − 1)√q for p ∤ deg f](#FF2-weil-bound-additive)).
- X₀ = P¹, f = x + a/x: dimension −2 + 2 + 2 = 2 (Kloosterman).
- f = h^p − h + c: S_f counts points and the bound fails; the hypothesis is necessary.

*Needs:* [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf), [The modified pole order v*_x(f) of a rational function (Sommes trig. Exemple 3.5)](#FF2-modified-pole-order), [Sw_x(L(ψf)) = v*_x(f) (Sommes trig. (3.5.4))](#FF2-swan-conductor-of-artin-schreier-sheaf), [H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `DeligneWeightsAndPurity:DWP.6`.

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Exemple 3.5, (3.5.2) and (3.5.5), volume pp. 191-192; [Deligne, Weil II](#source-12) — Théorème 3.2.3, p. 200.

<a id="FF2-involution-eigenvalue-pairing"></a>

#### An involution with f∘σ = −f pairs the Frobenius eigenvalues as α, q/α (Sommes trig. 3.6)

In the setting of [Weil–Deligne bound for additive sums of a rational function on a curve (Sommes trig. (3.5.2))](#FF2-artin-schreier-sum-on-curve-bound), suppose σ is an automorphism of X₀ with f(σx) = −f(x). Then S_f is real. If σ is an involution, H¹(X̄, j_*L(ψf)) carries an alternating perfect pairing with values in E(−1), so it has even dimension, and the eigenvalues of F* are grouped in pairs α, q/α.

The hypotheses are as follows. σ an involution with f ∘ σ = −f.

A proof proceeds as follows. 𝓕₀ = j_*L(ψf) and 𝒢₀ = j_*L(ψ(−f)) are dual; σ^*𝓕₀ ≅ 𝒢₀ with (σ²)^* the identity; the pairing satisfies σ^*(f·g) = σ^*f·σ^*g. Poincaré duality on the proper curve (EtaleDualityAndPerverseSheaves:EDC.2) makes H¹(𝓕) × H¹(𝒢) → E(−1) perfect; composing with σ^* gives an alternating form on H¹(𝓕), since σ acts trivially on E(−1). Geometric Frobenius acts on this target by q, so its similitude multiplier pairs α with q/α.

In particular, verify the following values and consequences.

- Kloosterman: X₀ = P¹, f = x + a/x, σx = −x: H¹ of dimension 2, eigenvalues α, q/α.
- On P¹/F₅, f=X²−X⁻² and σ(X)=1/X satisfy f∘σ=−f. The two poles have modified order 2, not odd; they are exchanged by σ. The cohomology has even dimension 4, and the pairing conclusion survives.

*Needs:* [Weil–Deligne bound for additive sums of a rational function on a curve (Sommes trig. (3.5.2))](#FF2-artin-schreier-sum-on-curve-bound), `EtaleDualityAndPerverseSheaves:EDC.2`.

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] 3.6, volume p. 192.

### 2.11 Kloosterman sums and Gauss sums

<a id="FF2-kloosterman-sum"></a>

#### Kloosterman sums over F and its extensions

For ψ an additive character, a, b ∈ F and L/F finite: K(ψ; a, b; L) := Σ_{x∈L^×} ψ(Tr_{L/F}(a x + b x^{−1})). For L = F this is Σ_{x∈F^×} ψ(ax + b/x); with F = F_p and ψ = e(·/p) it is the classical S(a, b; p).

The hypotheses are as follows. ψ arbitrary in the definition; a, b arbitrary (the bound needs ab ≠ 0).

A proof proceeds as follows. Finite sum over the units of L.

Provide the following interface.

- `kloostermanSum`: K(ψ; a, b; L) = Σ_{x∈L^×} ψ(Tr_{L/F}(a x + b x⁻¹)).
- `kloostermanSum_comm`: K(a, b) = K(b, a).
- `kloostermanSum_eq_one_mul`: For a ≠ 0: K(a, b) = K(1, ab).
- `kloostermanSum_conj`: For complex-valued ψ: the complex conjugate of K(a, b) is K(−a, −b) = K(a, b), so K is real.
- `kloostermanSum_zero_right`: K(a, 0; L) = −1 for a ≠ 0 and ψ ≠ 1.

**Checks.**

- `kloostermanSum_test_zero_zero`: K(0, 0; L) = |L| − 1.
- `kloostermanSum_test_zero_right`: For ψ ≠ 1 and a ≠ 0: K(a, 0; F) = −1.
- `kloostermanSum_test_F3`: Over ZMod 3 with ψ ≠ 1: K(1, 1) = −1.


In particular, verify the following values and consequences.

- K(a, 0) = −1 for a ≠ 0 and ψ ≠ 1.
- K(0, 0) = |L| − 1.
- K(1, 1) = −1 over F_3.

*Needs:* `AddChar`, `Algebra.trace`.

See [Kowalski](#source-4) — Introduction, Definition 7, printed p. 4; [Fouvry–Kowalski–Michel–Sawin](#source-13) — section 2.2, p. 3.

<a id="FF2-kloosterman-l-function"></a>

#### The L-function of Kloosterman sums is 1 + K T + qT² (Carlitz)

Let ψ ≠ 1 and a, b ∈ F^×. For L_ν the extension of degree ν, exp(Σ_{ν≥1} K(a, b; L_ν)T^ν/ν) = 1 + K(a, b; F)T + qT². Equivalently there are α, β ∈ ℂ with α + β = −K(a, b; F), αβ = q and K(a, b; L_ν) = −(α^ν + β^ν) for all ν ≥ 1.

The hypotheses are as follows. ψ ≠ 1; a ≠ 0 and b ≠ 0.

A proof proceeds as follows. Take Λ(h) := [h(0) ≠ 0]·ψ(Tr_{F[X]/(h)}(aX + bX^{−1})); it is completely multiplicative, and for h = X^n + c_{n−1}X^{n−1} + ⋯ + c₀ with c₀ ≠ 0, Tr(aX + bX^{−1}) = −a c_{n−1} − b c₁/c₀ (sum of the roots and of their inverses). Its companion sums are the Kloosterman sums ([Euler product and logarithmic derivative of a multiplicative monic L-series](#FF2-monic-l-series-log-derivative)). c₁ = Σ_{c₀≠0} ψ(−a c₀ − b/c₀) = K(a, b); c₂ = Σ_{c₀≠0} Σ_{c₁} ψ(−c₁(a + b/c₀)) = q (only c₀ = −b/a survives); for n ≥ 3 the free sum over c_{n−1} gives 0 because a ≠ 0 (mathlib:AddChar.sum_mulShift). Reciprocal roots from [Companion sums are minus the power sums of the reciprocal roots of a polynomial L-function](#FF2-l-function-reciprocal-roots).

In particular, verify the following values and consequences.

- F = ZMod 3, a = b = 1: L = 1 − T + 3T².
- b = 0 is excluded: then c₂ = 0 and L = 1 − T (K(a, 0) = −1).

*Needs:* [Kloosterman sums over F and its extensions](#FF2-kloosterman-sum), [The L-series of a function on monic polynomials over F](#FF2-monic-l-series), [Euler product and logarithmic derivative of a multiplicative monic L-series](#FF2-monic-l-series-log-derivative), [Companion sums are minus the power sums of the reciprocal roots of a polynomial L-function](#FF2-l-function-reciprocal-roots), `AddChar.sum_mulShift`.

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Exemple 3.7, volume p. 193; [Kowalski](#source-4) — Chapter 2, Remark 2.11, printed p. 23.

<a id="FF2-kloosterman-bound"></a>

#### Weil's bound |K(a, b)| ≤ 2√q for Kloosterman sums

Let ψ ≠ 1 and a, b ∈ F^×. The numbers α, β of [The L-function of Kloosterman sums is 1 + K T + qT² (Carlitz)](#FF2-kloosterman-l-function) satisfy |ι(α)| = |ι(β)| = √q for every embedding ι, so |K(a, b; L)| ≤ 2|L|^{1/2} for every finite extension L; in particular |Σ_{x∈F^×} ψ(ax + b/x)| ≤ 2√q, and |S(m, n; p)| ≤ 2√p for p ∤ mn.

The hypotheses are as follows. ψ ≠ 1; ab ≠ 0.

A proof proceeds as follows. 1 + KT + qT² = (1 − αT)(1 − βT) is a polynomial L-series of Λ = λ_{aX+b/X,ψ}·[X ∤ h] ([The L-function of Kloosterman sums is 1 + K T + qT² (Carlitz)](#FF2-kloosterman-l-function)), so [Reciprocal roots of polynomial rank-one L-functions have absolute value at most √q (Deligne route)](#FF2-rank-one-sheaf-root-bound) applies to L_ψ(aX + b/X) on G_m: |α|, |β| ≤ √q. αβ = q forces |α| = |β| = √q; the same for all conjugates (applying the argument to σ ∘ ψ). K(a, b; L_ν) = −(α^ν + β^ν).

In particular, verify the following values and consequences.

- F = ZMod 3, K(1, 1) = −1: α, β = (1 ± i√11)/2, |α|² = 3.
- Kloosterman's elementary bound |S| ≤ 2p^{3/4} (Kowalski Theorem 9) is weaker; the constant 2 is sharp in the sense that |S(m, n; p)|² > 2p − 2 for some m, n (Kowalski (7)).

*Needs:* [The L-function of Kloosterman sums is 1 + K T + qT² (Carlitz)](#FF2-kloosterman-l-function), [Reciprocal roots of polynomial rank-one L-functions have absolute value at most √q (Deligne route)](#FF2-rank-one-sheaf-root-bound), [Kloosterman sums over F and its extensions](#FF2-kloosterman-sum).

See [Kowalski](#source-4) — Introduction, Theorem 10, printed p. 5; [Fouvry–Kowalski–Michel–Sawin](#source-13) — section 2.2, p. 3.

<a id="FF2-gauss-sum-frobenius-eigenvalue"></a>

#### Gauss sums as the Frobenius eigenvalue on H¹_c(G_m, L_ψ ⊗ L_χ)

For χ ≠ 1 and ψ ≠ 1: H^i_c(G_{m,F̄}, L_ψ ⊗ L_{χ^{−1}}) = 0 for i ≠ 1, dim H¹_c = 1, and Frobenius acts on it by τ(χ, ψ) := −Σ_{x∈F^×} ψ(x)χ^{−1}(x) = −gaussSum χ⁻¹ ψ (Mathlib's gaussSum). Consequently |τ(χ, ψ)| = √q, compatible with mathlib:gaussSum_mul_gaussSum_eq_card, and the Frobenius of F_{q^ν} acts by τ(χ, ψ)^ν, which is the Hasse–Davenport relation τ(χ ∘ N, ψ ∘ Tr) = τ(χ, ψ)^ν of [The Hasse–Davenport lifting relation](#FF1-hasse-davenport-lifting) (Deligne's sign convention τ = −gaussSum).

The hypotheses are as follows. χ ≠ 1, ψ ≠ 1; Deligne's normalisation (1.14.1).

A proof proceeds as follows. H⁰_c vanishes because G_m is not proper; H²_c vanishes because the additive factor is wildly ramified at infinity, so the rank-one product is geometrically nontrivial. Then the monic L-series of Λ(h)=[h(0)≠0]ψ(−c_(n−1))χ⁻¹((−1)^n c₀) is 1−τT: coefficients of T^n vanish for n≥2 by the free nontrivial additive-character sum. Its cohomological determinant is det(1−T Frob|H¹_c); Frobenius is invertible, so its degree is dim H¹_c=1. Weight: |τ| ≤ √q ([Reciprocal roots of polynomial rank-one L-functions have absolute value at most √q (Deligne route)](#FF2-rank-one-sheaf-root-bound)) and |τ|² = q (Mathlib's gaussSum identity with complex conjugation). Over F_{q^ν}: the eigenvalue of Frob^ν is τ^ν, and the trace formula over F_{q^ν} ([Trace formula for products of Artin–Schreier and Kummer characters (Scholie 1.9)](#FF2-character-sheaf-trace-formula)) gives Hasse–Davenport — the cohomological proof of Sommes trig. Théorème 1.15, compared here with Layer 1's statement.

In particular, verify the following values and consequences.

- q = 5, χ quadratic: τ² = χ(−1)·5 (mathlib gaussSum_sq).
- The sign: Deligne's τ(χ, ψ) is minus Mathlib's gaussSum χ⁻¹ ψ; forgetting it breaks Hasse–Davenport for even ν.

*Needs:* [The elementary L-function of a rank-one character sum is det(1 − T·Frob | H¹_c) when it is a polynomial](#FF2-rank-one-sheaf-l-function), [Reciprocal roots of polynomial rank-one L-functions have absolute value at most √q (Deligne route)](#FF2-rank-one-sheaf-root-bound), [Trace formula for products of Artin–Schreier and Kummer characters (Scholie 1.9)](#FF2-character-sheaf-trace-formula), `gaussSum`, `gaussSum_mul_gaussSum_eq_card`, [The Hasse–Davenport lifting relation](#FF1-hasse-davenport-lifting).

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] 1.14-1.15, volume p. 177.

### 2.12 Étale Gauss cohomology and hyper-Kloosterman sheaves

<a id="FF2-hyper-kloosterman-sum"></a>

#### Hyper-Kloosterman sums

For k≥1, a∈F_{q^r}, ψ_r=ψ∘Tr_{F_{q^r}/F_q}, define HKl_k(a;q^r)=Σ_{x∈F_{q^r}^k, Πx_i=a}ψ_r(Σx_i). All coordinates are allowed; if a≠0 they are automatically units. For a≠0 the analytic normalized trace is (q^r)^(-(k−1)/2)HKl_k(a;q^r). At a=0 the unnormalized value is (−1)^(k−1). The geometric sheaf below has trace (−1)^(k−1)HKl_k, not HKl_k in every rank.

The hypotheses are as follows. Nontrivial ψ; k positive; finite-field extensions use trace lifts.

A proof proceeds as follows. Use the finite fiber of the product map on the existing finite field, and sum the existing additive character over it. For a≠0 eliminate one coordinate, obtaining the usual unit-coordinate hyper-Kloosterman expression. At zero, stratify by the zero coordinates. Each nonempty zero set contributes products of Σ_{x≠0}ψ_r(x)=−1, and inclusion-exclusion yields (−1)^(k−1). For extension-model independence, use Algebra.trace_eq_of_algEquiv to identify the lifted additive characters, then reindex the finite fiber sum along the algebra equivalence. A ring isomorphism without base-field compatibility is not the claimed trace-lift API.

Provide the following interface.

- `TauCeti.FiniteFieldSums.FF2.hyperKloosterman.rank_one`: HKl₁(a;q^r)=ψ_r(a).
- `TauCeti.FiniteFieldSums.FF2.hyperKloosterman.zero`: HKl_k(0;q^r)=(−1)^(k−1).
- `TauCeti.FiniteFieldSums.FF2.hyperKloosterman.unit_fiber`: For a≠0 the fiber is parametrized by k−1 units with last coordinate a/(Πx_i).
- `TauCeti.FiniteFieldSums.FF2.hyperKloosterman.rank_two`: HKl₂(a;q^r)=K(1,a;q^r) for the earlier Kloosterman convention.
- `TauCeti.FiniteFieldSums.FF2.hyperKloosterman.extension`: For finite extensions K/F_q and L/F_q and an F_q-algebra isomorphism e:K≃L, HKl_k(e(a);L,ψ∘Tr_{L/F_q})=HKl_k(a;K,ψ∘Tr_{K/F_q}).

**Checks.**

- `TauCeti.FiniteFieldSums.FF2.hyper_kloosterman_one`: HKl₁(a)=ψ(a).
- `TauCeti.FiniteFieldSums.FF2.hyper_kloosterman_zero`: HKl₂(0)=−1, while a sum over units only at zero would give 0.
- `TauCeti.FiniteFieldSums.FF2.hyper_kloosterman_two`: For a≠0, HKl₂(a)=Σ_{x≠0}ψ(x+a/x).
- `TauCeti.FiniteFieldSums.FF2.hyper_kloosterman_five`: Over F₅ with ψ(x)=exp(2πix/5), HKl₂(1)=2+2cos(4π/5).


In particular, verify the following values and consequences.

- k=1: HKl₁(a)=ψ_r(a), including a=0.
- k=2,a≠0 agrees with the earlier Kloosterman sum K(1,a).

*Needs:* `AddChar`, [The trace lift of an additive character to an extension](#FF1-trace-lift-of-an-additive-character), [Kloosterman sums over F and its extensions](#FF2-kloosterman-sum), `Algebra.trace`, `Algebra.trace_eq_of_algEquiv`.

See [Deligne, Sommes trig.](#source-10) — §7.1, (7.1.1)–(7.1.4), pp. 218–219; [Fouvry–Kowalski–Michel–Sawin](#source-13) — §4.2.4, Theorem 4.4, p. 12.

<a id="FF2-etale-algebra-gauss-cohomology"></a>

#### Gauss cohomology over a finite étale algebra

Let A be a finite étale F_q-algebra of degree N≥1, ψ nontrivial and χ a multiplicative character of A×. On V=Res_{A/F_q}G_m, put L=L_χ⊗L_ψ(Tr_{A/F_q}). Then H^i_c(V_k̄,L)=0 for i≠N and dim H^N_c=1. If χ is nontrivial on each field factor of A, H^N_c→H^N is an isomorphism. A permutation of split factors preserving their Kummer-character data acts on H^N_c by its Koszul sign. A general permutation instead identifies the cohomology with that of the permuted character tuple; it need not act on the fixed sheaf.

The hypotheses are as follows. Finite étale algebra, not a nonreduced finite ring. No nontriviality assumption for the concentration claim; it is needed for clean extension. For an automorphism of the fixed split sheaf, the permutation must preserve the character tuple.

A proof proceeds as follows. Construct the finite étale unit torus by Weil restriction and split A over k̄. The trace phase and Kummer character decompose as external tensor products of one-variable Gauss sheaves; descend using the permutation action on the embeddings of A. For a nontrivial Kummer factor use the earlier Gauss eigenvalue/cohomology result. For a trivial factor use the localization sequence for G_m⊂A¹ and the earlier vanishing of H*_c(A¹,L_ψ): H¹_c(G_m,L_ψ)=E with trivial Frobenius and all other degrees vanish. Künneth then concentrates the tensor in degree N with dimension one. Each nontrivial Kummer factor has zero tame boundary invariants at 0 and the additive factor is wild at infinity, giving clean extension. Interchanging degree-one factors gives the Koszul sign in Sommes trig. 4.12. This is a scalar action on the fixed cohomology only when the permutation preserves the character tuple; otherwise it is the corresponding signed comparison with the permuted tuple.

In particular, verify the following values and consequences.

- N=1 recovers the earlier Gauss cohomology.
- A trivial Kummer factor has compact cohomology in degree one but its forget-supports map is not an isomorphism.

*Needs:* [Gauss sums as the Frobenius eigenvalue on H¹_c(G_m, L_ψ ⊗ L_χ)](#FF2-gauss-sum-frobenius-eigenvalue), [The Kummer sheaf L_χ(g)](#FF2-kummer-sheaf), [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, [H*_c(G, L(χ)) = 0 for a nontrivial character of G₀(F) (Sommes trig. Théorème 2.7*)](#FF2-character-sheaf-cohomology-vanishes), `SchemeAndStackFoundations:SF.0`.

See [Deligne, Sommes trig.](#source-10) — §§4.3–4.4, pp. 196–197; §§4.6–4.8, pp. 198–199; Proposition 4.11 and §4.12, pp. 201–202.

<a id="FF2-hyper-kloosterman-sheaf"></a>

#### The relative hyper-Kloosterman sheaf

Let π:A^k→A¹ be product and σ:A^k→A¹ be sum. Define Kl_k=R^(k−1)π!L_ψ(σ), an E-sheaf on A¹, and restrict it to G_m for its lisse local system. On G_m its rank is k and its Frobenius trace over F_{q^r} is (−1)^(k−1)HKl_k(a;q^r). Its zero stalk is the canonically trivial rank-one E-space. Extend the A¹ sheaf by zero at infinity to P¹; this equals the ordinary direct-image extension of its restriction to G_m. It is not zero extension across 0.

The hypotheses are as follows. k≥1, ψ nontrivial, E finite over Q_ℓ containing character values. The construction uses genuine Rπ! and its cohomology sheaf, not a record containing unproved rank and purity fields.

A proof proceeds as follows. Pull back the earlier Artin–Schreier sheaf along σ and form the actual compactly supported direct image. Proper-base-change-for-! gives each stalk as compact cohomology of the product fiber; the following simultaneous fiber/monodromy theorem supplies the rank and extension comparisons. The trace formula in degree k−1 gives the sign. At zero the hyperplane-cover calculation gives a trivial rank-one stalk; at infinity wild inertia has no invariants.

Provide the following interface.

- `TauCeti.FiniteFieldSums.FF2.HyperKloostermanSheaf.stalk`: The geometric stalk at a is H^(k−1)_c(Πx_i=a,L_ψ(Σx_i)).
- `TauCeti.FiniteFieldSums.FF2.HyperKloostermanSheaf.baseChange`: The construction commutes with extension of the finite field and trace lift of ψ.
- `TauCeti.FiniteFieldSums.FF2.HyperKloostermanSheaf.trace`: Trace at a∈F_{q^r} is (−1)^(k−1)HKl_k(a;q^r).
- `TauCeti.FiniteFieldSums.FF2.HyperKloostermanSheaf.rank_one`: For k=1 it is the earlier L_ψ on A¹.
- `TauCeti.FiniteFieldSums.FF2.HyperKloostermanSheaf.zero_stalk`: At zero the stalk is E with trivial Frobenius, consistent with the trace sign.

**Checks.**

- `TauCeti.FiniteFieldSums.FF2.kl_sheaf_one`: For k=1, π=σ=id and the sheaf is L_ψ.
- `TauCeti.FiniteFieldSums.FF2.kl_sheaf_zero`: For k=2 its zero stalk has trace 1, while HKl₂(0)=−1.
- `TauCeti.FiniteFieldSums.FF2.kl_sheaf_sign`: For k=2,a≠0, its trace is −Σ_{x≠0}ψ(x+a/x).
- `TauCeti.FiniteFieldSums.FF2.kl_sheaf_extension_control`: The extension across 0 cannot be j!: its stalk there is nonzero.


In particular, verify the following values and consequences.

- k=1 is L_ψ on A¹.
- k=2 has sheaf trace minus the earlier positive Kloosterman sum.

*Needs:* [Hyper-Kloosterman sums](#FF2-hyper-kloosterman-sum), [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.0`.

See [Deligne, Sommes trig.](#source-10) — Theorem 7.8(i)–(iv), pp. 221–222; [Fouvry–Kowalski–Michel–Sawin](#source-13) — §4.2.4, Theorem 4.4, p. 12.

<a id="FF2-hyper-kloosterman-fiber-cohomology"></a>

#### Cohomology of hyper-Kloosterman fibers

For V_a={Πx_i=a}⊂A^k and L=L_ψ(Σx_i), H^i_c(V_a,L)=0 for i≠k−1 and H^(k−1)_c→H^(k−1) is an isomorphism. For a≠0 its dimension is k and it is pure of weight k−1; for a=0 it is canonically E with trivial Frobenius. These hold over k̄ with all-conjugate weight conventions.

The hypotheses are as follows. k≥1; ψ nontrivial. The a=0 statement uses the singular union of coordinate hyperplanes; smooth duality is used only on a≠0.

A proof proceeds as follows. At a=0, the closed-cover spectral sequence for the coordinate hyperplanes has only the origin term: all positive-dimensional additive-character factors are acyclic. Its Čech shift places E in degree k−1. For a≠0 use induction simultaneous with hyper-kloosterman-local-monodromy. The k=1 fiber is one point. Project V_a in rank k+1 onto its first unit coordinate x; the remaining coefficient sheaf is L_ψ(x)⊗[a/x]*Kl_k. The local monodromy induction gives Swan 1 at 0 and k at infinity, with no invariants there. GOS on G_m yields χ_c=−(k+1), and curve-extremal vanishing gives concentration and dimension k+1. Clean extension and duality supply the compact/ordinary comparison; the earlier affine-concentration criterion and DWP.7 supply purity. The simultaneous induction is within the proof, not a cyclic node prerequisite.

In particular, verify the following values and consequences.

- k=2,a≠0 gives dimension two and weight one, recovering the constant 2.
- The zero fiber has dimension one and weight zero, not k and weight k−1.

*Needs:* [The relative hyper-Kloosterman sheaf](#FF2-hyper-kloosterman-sheaf), [Gauss cohomology over a finite étale algebra](#FF2-etale-algebra-gauss-cohomology), [H*_c(G, L(χ)) = 0 for a nontrivial character of G₀(F) (Sommes trig. Théorème 2.7*)](#FF2-character-sheaf-cohomology-vanishes), [If H_c → H is an isomorphism on a smooth affine variety, cohomology is concentrated in the middle degree and pure (Sommes trig. 1.19-1.21)](#FF2-affine-concentration-criterion), [Artin–Schreier breaks over geometric local fields](#FF2-geometric-artin-schreier-break), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `DeligneWeightsAndPurity:DWP.7`, `ArithmeticGaloisRepresentations:R01.3`.

See [Deligne, Sommes trig.](#source-10) — Theorem 7.4; §§7.7, 7.13–7.14, pp. 220–225.

<a id="FF2-hyper-kloosterman-local-monodromy"></a>

#### Local monodromy of hyper-Kloosterman sheaves

The restriction of Kl_k to G_m is lisse of rank k. At 0 it is tame with unipotent inertia consisting of one Jordan block; at infinity its Swan conductor is 1 and wild inertia has no nonzero invariants. Its ordinary direct-image extension across 0 has a one-dimensional invariant stalk; the extension at infinity is zero. For k=1, inertia at 0 is trivial, a one-by-one Jordan block.

The hypotheses are as follows. k≥1; coefficients as in the sheaf construction.

A proof proceeds as follows. In the simultaneous induction, the rank-k fiber theorem gives one nonzero compact direct-image cohomology sheaf. Leray and the acyclicity of L_ψ(Σx_i) on A^k give vanishing of its H⁰_c and H¹_c on A¹. Hence it has no punctual sections, embeds into the ordinary direct image of its generic restriction, and the quotient supported at 0 vanishes. Together with the fiber ranks, the precise specialization argument of §7.10 gives lissity on G_m and the direct-image extension at 0. These sheaf-theoretic steps are requested from SF.2; rank constancy alone is insufficient. The Fourier interpretation and Euler characteristic of π imply total Swan 1 at 0 and infinity. The coordinate-permutation and Gauss clean-extension argument of §§7.9–7.12 forces the wild part to lie at infinity and to have no invariant vectors. The zero-fiber dimension one and tame local classification give one unipotent Jordan block at 0. This supplies exactly the local input needed for the rank-(k+1) fiber step of §7.14.

In particular, verify the following values and consequences.

- Tame unipotent invariants at zero have dimension one in every rank.
- Swan 1 at infinity does not imply rank one.

*Needs:* [Cohomology of hyper-Kloosterman fibers](#FF2-hyper-kloosterman-fiber-cohomology), [Gauss cohomology over a finite étale algebra](#FF2-etale-algebra-gauss-cohomology), [The one-variable Fourier–Deligne transform FT_ψ](#FF2-fourier-deligne-transform), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `ArithmeticGaloisRepresentations:R01.3`, [H*_c(G, L(χ)) = 0 for a nontrivial character of G₀(F) (Sommes trig. Théorème 2.7*)](#FF2-character-sheaf-cohomology-vanishes).

See [Deligne, Sommes trig.](#source-10) — Theorem 7.8 and proof §§7.9–7.12, pp. 221–224.

<a id="FF2-hyper-kloosterman-bound"></a>

#### Deligne’s hyper-Kloosterman bound

For k≥1, a∈F_{q^r}× and a nontrivial ψ of F_q, |HKl_k(a;q^r)|≤k(q^r)^((k−1)/2) at every embedding of the cyclotomic character values in ℂ. The normalized unit-fiber sum has absolute value≤k. At a=0 its exact value is (−1)^(k−1), separately.

The hypotheses are as follows. The square-root-in-dimension exponent uses a≠0. Extension degree r≥1; traces are lifted to the extension.

A proof proceeds as follows. Use the fiber theorem and the trace formula: the sum is (−1)^(k−1) times the trace on k eigenvalues of weight k−1. Apply the triangle inequality at each embedding. The zero-fiber evaluation follows from the definition API rather than from a false rank-k purity claim there.

In particular, verify the following values and consequences.

- k=1 gives absolute value 1.
- k=2 gives 2√(q^r), agreeing with the earlier Kloosterman bound.

*Needs:* [Cohomology of hyper-Kloosterman fibers](#FF2-hyper-kloosterman-fiber-cohomology), [Hyper-Kloosterman sums](#FF2-hyper-kloosterman-sum), [Trace formula for products of Artin–Schreier and Kummer characters (Scholie 1.9)](#FF2-character-sheaf-trace-formula).

See [Deligne, Sommes trig.](#source-10) — §7.1(7.1.3) and §7.5, pp. 219–221; [Fouvry–Kowalski–Michel–Sawin](#source-13) — §4.2.4, Theorem 4.4, p. 12.

### 2.13 Several variables

<a id="FF2-hypersurface-through-all-rational-points"></a>

#### A hypersurface of degree d in P^r through all F-rational points has d ≥ q + 1 (Sommes trig. Lemme 3.9)

Let r ≥ 1 and H ∈ F[X₀, …, X_r] a nonzero homogeneous polynomial of degree d vanishing at every point of P^r(F). Then d ≥ q + 1.

The hypotheses are as follows. r ≥ 1; H nonzero homogeneous.

A proof proceeds as follows. Induction on r (Deligne). If some F-rational hyperplane Π is not contained in {H = 0} (possible only for r ≥ 2, since for r = 1 the hyperplanes are the rational points), H restricted to Π ≅ P^{r−1} is a nonzero form of degree d vanishing on all rational points, and d ≥ q + 1 by induction. Otherwise every F-rational hyperplane is a component of {H = 0}, so H is divisible by the product of the q^r + ⋯ + 1 ≥ q + 1 distinct linear forms, and d ≥ q + 1.

In particular, verify the following values and consequences.

- r = 1, H = X₀^q X₁ − X₀X₁^q vanishes on P¹(F) and has degree q + 1: the bound is sharp.
- Degree q is not enough: X₀^q − X₀X₁^{q−1} (the quotient of the previous form by X₁) does not vanish at (1 : 0).

*Needs:* .

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Lemme 3.9, volume p. 193.

<a id="FF2-elementary-n-variable-bound"></a>

#### Deligne's elementary n-variable bound (d − 1)q^{n−1/2} (Sommes trig. Proposition 3.8)

Let P ∈ F[X₁, …, X_n] have degree d and not be of the form Q^p − Q + c (Q ∈ F[X₁, …, X_n], c ∈ F), and ψ(x) = exp(2πi Tr_{F/F_p}(x)/p). Then |Σ_{x∈F^n} ψ(P(x))| ≤ (d − 1) q^{n−1/2}.

The hypotheses are as follows. ψ the canonical character; P not Artin–Schreier trivial.

A proof proceeds as follows. It suffices to treat d − 1 < q^{1/2} (otherwise the trivial bound q^n is smaller), so d < q + 1. Case p ∤ d: by [A hypersurface of degree d in P^r through all F-rational points has d ≥ q + 1 (Sommes trig. Lemme 3.9)](#FF2-hypersurface-through-all-rational-points) applied to P_d, after a linear change of variables P_d(1, 0, …, 0) ≠ 0; for fixed x₂, …, x_n the polynomial in x₁ has degree d prime to p, so each inner sum is ≤ (d − 1)q^{1/2} ([Weil's bound |Σ ψ(f(x))| ≤ (deg f − 1)√q for p ∤ deg f](#FF2-weil-bound-additive)); sum over q^{n−1} fibres. Case p | d: if P_d is a p-th power, replace P by P − (P_d − P_d^{1/p}) (same sum, [Additive sums with the canonical character are invariant under f ↦ f + h^p − h](#FF2-artin-schreier-invariance)) and induct on d; otherwise choose a direction with nonzero derivative of P_d, arrange S₁ ≠ 0 in P_d = Σ X₁^{d−i}S_i, and remove the pure S₀X₁^d term by an Artin–Schreier correction (possible because p|d and F is perfect), making S₀=0; on the q^{n−1} − q^{n−2} points where S₁ ≠ λ the inner polynomial has degree d − 1 prime to p, giving (d − 2)q^{1/2}; the hyperplane S₁ = λ has q^{n−2} points, each trivially ≤ q; total < (d − 2)q^{n−1/2} + q^{n−1} < (d − 1)q^{n−1/2}.

In particular, verify the following values and consequences.

- n = 1: the classical one-variable bound.
- P = Q^p − Q: the sum is q^n; the exclusion is necessary.

*Needs:* [A hypersurface of degree d in P^r through all F-rational points has d ≥ q + 1 (Sommes trig. Lemme 3.9)](#FF2-hypersurface-through-all-rational-points), [Weil's bound |Σ ψ(f(x))| ≤ (deg f − 1)√q for p ∤ deg f](#FF2-weil-bound-additive), [Additive sums with the canonical character are invariant under f ↦ f + h^p − h](#FF2-artin-schreier-invariance).

See [Deligne, Sommes trig.](#source-10) — [Sommes trig.] Proposition 3.8, volume p. 193.

<a id="FF2-deligne-cohomology-of-polynomial-sheaf"></a>

#### H*_c(A^n, L_ψ(Q)) is concentrated in degree n, of dimension (d − 1)^n (Weil I Lemme 8.5(i))

Let Q ∈ F[x₁, …, x_n] have degree d with p ∤ d, and let its homogeneous part Q_d of degree d define a smooth hypersurface in P^{n−1}. For ψ ≠ 1: H^i_c(A^n_F̄, L_ψ(Q)) = 0 for i ≠ n and dim H^n_c(A^n_F̄, L_ψ(Q)) = (d − 1)^n.

The hypotheses are as follows. p ∤ d; Q_d smooth (nonzero discriminant); ψ ≠ 1. For arbitrary ψ=ψ_can(b·), absorb b≠0 into Q first. This preserves its degree and smooth leading hypersurface, and allows the canonical-character Swan/local-cover calculations to be used correctly.

A proof proceeds as follows. Family argument (Weil I 8.10): over the space S of polynomials with smooth leading form, a relative compactification Z_S/S of the Artin–Schreier cover X_S with relative normal-crossings boundary (8.6-8.9, via Zariski's normalisation-blow-up resolution of the surface singularity of 8.8) makes the R^i f_!(L_ψ(Q_S)) locally constant; S is connected, so it suffices to treat Q = Σ x_i^d. Künneth (Sommes trig. (2.4.1)*, requested from SchemeAndStackFoundations:SF.2) reduces to n = 1, Q = x^d. n = 1: H⁰_c = H²_c = 0 ([H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve): rank one and geometrically nontrivial), and χ_c(A¹, L_ψ(x^d)) = 1 − d by the Euler–Poincaré formula with Sw_∞ = d ([Sw_x(L(ψf)) = v*_x(f) (Sommes trig. (3.5.4))](#FF2-swan-conductor-of-artin-schreier-sheaf); formula requested from EtaleDualityAndPerverseSheaves:EDC.2).

In particular, verify the following values and consequences.

- n = 1: dim H¹_c(A¹, L_ψ(x^d)) = d − 1, matching [L(f, ψ; T) is a polynomial of degree at most deg f − 1 (p ∤ deg f)](#FF2-additive-l-function-is-polynomial) and [The numerator of the zeta function of y^q − y = f(x) is Π_{a≠0} L(af, ψ; T)](#FF2-artin-schreier-zeta-factorization).
- n = 2, Q = x₁x₂ with p odd (Q_d defines two distinct points of P¹, a smooth hypersurface): Σ ψ(x₁x₂) = q, and dim H²_c = 1 = (d − 1)².

*Needs:* [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf), [H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve), [Sw_x(L(ψf)) = v*_x(f) (Sommes trig. (3.5.4))](#FF2-swan-conductor-of-artin-schreier-sheaf), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, [Ranks and purity in the universal polynomial family](#FF2-polynomial-family-cohomology).

See [Deligne, Weil I](#source-11) — Lemme 8.5 and 8.10-8.12, pp. 303-306.

<a id="FF2-deligne-duality-for-polynomial-sheaf"></a>

#### The cup product on H^n_c(A^n, L_ψ(Q)) is a perfect duality; forget-supports is an isomorphism (Weil I Lemme 8.5(ii))

Under the hypotheses of [H*_c(A^n, L_ψ(Q)) is concentrated in degree n, of dimension (d − 1)^n (Weil I Lemme 8.5(i))](#FF2-deligne-cohomology-of-polynomial-sheaf): the cup product H^n_c(A^n, L_ψ(Q)) ⊗ H^n_c(A^n, L_{ψ^{−1}}(Q)) → H^{2n}_c(A^n, E) ≅ E(−n) is a perfect pairing; equivalently H^n_c(A^n, L_ψ(Q)) → H^n(A^n, L_ψ(Q)) is an isomorphism.

The hypotheses are as follows. As in [H*_c(A^n, L_ψ(Q)) is concentrated in degree n, of dimension (d − 1)^n (Weil I Lemme 8.5(i))](#FF2-deligne-cohomology-of-polynomial-sheaf). For arbitrary ψ=ψ_can(b·), absorb b≠0 into Q first. This preserves its degree and smooth leading hypersurface, and allows the canonical-character Swan/local-cover calculations to be used correctly.

A proof proceeds as follows. Local constancy in the family (as in the preceding result) reduces to Q = Σ x_i^d and, by Künneth, to n = 1. n = 1: the perfectness is Poincaré duality for L_ψ(x^d) on A¹ together with j_! = j_* at ∞ (no inertia invariants), SGA 4½ [Dualité] (2.8)/(2.12) (requested from EtaleDualityAndPerverseSheaves:EDC.2). Equivalence with forget-supports: Poincaré duality identifies H^n(L_ψ(Q)) with the dual of H^n_c(L_{ψ^{−1}}(Q))(−n).

In particular, verify the following values and consequences.

- n = 1, Q = x: both groups vanish (d − 1 = 0).

*Needs:* [H*_c(A^n, L_ψ(Q)) is concentrated in degree n, of dimension (d − 1)^n (Weil I Lemme 8.5(i))](#FF2-deligne-cohomology-of-polynomial-sheaf), `EtaleDualityAndPerverseSheaves:EDC.2`, `SchemeAndStackFoundations:SF.2`, [Ranks and purity in the universal polynomial family](#FF2-polynomial-family-cohomology).

See [Deligne, Weil I](#source-11) — Lemme 8.5(ii) and 8.11, pp. 303, 305.

<a id="FF2-deligne-n-variable-bound"></a>

#### Deligne's bound |Σ_{x∈F^n} ψ(Q(x))| ≤ (d − 1)^n q^{n/2} (Weil I Théorème 8.4)

Let Q ∈ F[x₁, …, x_n] of degree d with p ∤ d and leading form Q_d defining a smooth hypersurface in P^{n−1}, and ψ ≠ 1. Then |Σ_{x∈F^n} ψ(Q(x))| ≤ (d − 1)^n q^{n/2}, and over every finite extension L: |Σ_{x∈L^n} ψ(Tr_{L/F} Q(x))| ≤ (d − 1)^n |L|^{n/2}.

The hypotheses are as follows. p ∤ d; Q_d smooth; ψ ≠ 1. For arbitrary ψ=ψ_can(b·), absorb b≠0 into Q first. This preserves its degree and smooth leading hypersurface, and allows the canonical-character Swan/local-cover calculations to be used correctly.

A proof proceeds as follows. Trace formula ([Trace formula for products of Artin–Schreier and Kummer characters (Scholie 1.9)](#FF2-character-sheaf-trace-formula)): the sum is (−1)^n Tr(F* | H^n_c(A^n, L_ψ(Q))) since the other H^i_c vanish ([H*_c(A^n, L_ψ(Q)) is concentrated in degree n, of dimension (d − 1)^n (Weil I Lemme 8.5(i))](#FF2-deligne-cohomology-of-polynomial-sheaf)). H^n_c → H^n is an isomorphism ([The cup product on H^n_c(A^n, L_ψ(Q)) is a perfect duality; forget-supports is an isomorphism (Weil I Lemme 8.5(ii))](#FF2-deligne-duality-for-polynomial-sheaf)), so H^n_c is pure of weight n ([If H_c → H is an isomorphism on a smooth affine variety, cohomology is concentrated in the middle degree and pure (Sommes trig. 1.19-1.21)](#FF2-affine-concentration-criterion) (b), with the weight bounds of DeligneWeightsAndPurity:DWP.7). Hence |sum| ≤ (d − 1)^n q^{n/2}. (Deligne's original route: injectivity into H^n of the smooth projective compactification Z of the Artin–Schreier cover, then the Riemann hypothesis for Z, Weil I (1.7).)

In particular, verify the following values and consequences.

- n = 1: the Weil bound (d − 1)√q.
- Q = Σ x_i^d: the sum is the n-th power of a one-variable sum, and the bound is the n-th power of Weil's.
- For n=2, p odd and Q=x₁², the leading form is singular and the sum is q times a nonzero quadratic Gauss sum, of absolute value q^(3/2). The claimed q bound with (d−1)^n=1 fails; smoothness is essential. No assertion that every x₁^d example attains q^(3/2) is made.

*Needs:* [Trace formula for products of Artin–Schreier and Kummer characters (Scholie 1.9)](#FF2-character-sheaf-trace-formula), [H*_c(A^n, L_ψ(Q)) is concentrated in degree n, of dimension (d − 1)^n (Weil I Lemme 8.5(i))](#FF2-deligne-cohomology-of-polynomial-sheaf), [The cup product on H^n_c(A^n, L_ψ(Q)) is a perfect duality; forget-supports is an isomorphism (Weil I Lemme 8.5(ii))](#FF2-deligne-duality-for-polynomial-sheaf), [If H_c → H is an isomorphism on a smooth affine variety, cohomology is concentrated in the middle degree and pure (Sommes trig. 1.19-1.21)](#FF2-affine-concentration-criterion), `DeligneWeightsAndPurity:DWP.7`.

See [Deligne, Weil I](#source-11) — Théorème 8.4, pp. 302-303.

### 2.14 Universal polynomial families and their cohomology

<a id="FF2-universal-smooth-leading-polynomial-family"></a>

#### The universal polynomial with smooth leading form

Fix n≥1, d≥1, p∤d, and k=F_q. In affine coefficient space with coordinates c_α for |α|≤d, let S be the open locus where the degree-d part Q_d defines a smooth hypersurface in P^(n−1) and is nonzero; for n=1 its zero locus is empty. On S×A^n put Q_univ=Σ c_αX^α, f the projection, and L=L_ψ(Q_univ), using the earlier Artin–Schreier construction. S is geometrically connected and contains the Fermat polynomial ΣX_i^d. This is the actual open coefficient scheme, not a set of polynomials declared smooth by an uninterpreted predicate.

The hypotheses are as follows. n,d positive; p∤d; ψ nontrivial. Coefficients E contain the p-th roots of unity, ℓ≠p.

A proof proceeds as follows. Form the finite-dimensional coefficient affine space from the degree-bounded MvPolynomial coordinates. The projective Jacobian singularity incidence is closed after projection by properness, so its complement is open. The Fermat point is smooth because p∤d, giving nonemptiness. A nonempty open in geometrically integral affine space is geometrically integral. Evaluate the universal polynomial and pull back the earlier L_ψ along this morphism; base change to a coefficient point recovers its polynomial sheaf.

Provide the following interface.

- `TauCeti.FiniteFieldSums.FF2.UniversalPolynomialFamily.coefficient`: The α-th coordinate is the coefficient of X^α, for |α|≤d.
- `TauCeti.FiniteFieldSums.FF2.UniversalPolynomialFamily.fiber`: At a coefficient point Q, Q_univ specializes to Q and L specializes to L_ψ(Q).
- `TauCeti.FiniteFieldSums.FF2.UniversalPolynomialFamily.baseChange`: Extension of the finite field commutes with S, Q_univ, f and L.
- `TauCeti.FiniteFieldSums.FF2.UniversalPolynomialFamily.fermat`: The coefficient vector of ΣX_i^d defines a point of S when p∤d.
- `TauCeti.FiniteFieldSums.FF2.UniversalPolynomialFamily.connected`: S over k̄ is nonempty and geometrically integral, hence connected.

**Checks.**

- `TauCeti.FiniteFieldSums.FF2.universal_one_variable`: For n=1,d≥1, membership in S is equivalent to c_d≠0.
- `TauCeti.FiniteFieldSums.FF2.universal_fermat`: The fiber at Fermat is ΣX_i^d and its partial derivatives are dX_i^(d−1).
- `TauCeti.FiniteFieldSums.FF2.universal_bad_characteristic`: For d=p, the Fermat derivative test vanishes and the stated smooth family theorem does not apply.
- `TauCeti.FiniteFieldSums.FF2.universal_evaluation`: Coefficient evaluation agrees with Mathlib MvPolynomial.eval at every affine point.


In particular, verify the following values and consequences.

- The n=1 locus is exactly nonzero leading coefficient.
- For d=1 the Fermat fiber is a nonconstant linear polynomial, with zero compact cohomology.

*Needs:* `MvPolynomial`, `MvPolynomial.eval`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf).

See [Deligne, Weil II](#source-12) — §3.7.2, p. 215; [Deligne, Weil I](#source-11) — §8.10, p. 305.

<a id="FF2-polynomial-boundary-local-models"></a>

#### Artin–Schreier local models at infinity

For Q in the universal smooth-leading family, normalize P^n in the Artin–Schreier cover T^p−T=jQ, j∈F_p×. Off Q_d=0 at infinity, the pair is étale locally the normalization of T^p−T=t₁^(−d), times a smooth factor. At a point of Q_d=0 at infinity it is étale locally the normalization of T^p−T=t₂t₁^(−d), times a smooth factor. These descriptions hold relatively over S; the second locus is empty for n=1.

The hypotheses are as follows. Geometric points; n≥1, d≥1, p∤d; leading hypersurface smooth. The harmless nonzero scalar j is absorbed in an étale coordinate.

A proof proceeds as follows. Homogenize Q and let t₁ cut out infinity. Where Q_d is nonzero, the unit in Q=t₁^(−d)u has an étale d-th root since d is invertible. At a zero of Q_d, smoothness makes its dehomogenization a transverse coordinate t₂ after including the lower-degree t₁ terms. Then Q=t₂t₁^(−d). Normalization commutes with these étale localizations; the remaining coordinates are smooth product factors. The same Jacobian argument works in the coefficient family.

In particular, verify the following values and consequences.

- n=1 requires only the first local model.
- If Q_d is singular, t₂ need not be a coordinate and the second model is unjustified.

*Needs:* [The universal polynomial with smooth leading form](#FF2-universal-smooth-leading-polynomial-family), `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`.

See [Deligne, Weil I](#source-11) — §§8.7–8.8, pp. 304–305; [Deligne, Weil II](#source-12) — §3.7.3, p. 216.

<a id="FF2-relative-artin-schreier-compactification"></a>

#### Relative compactification of polynomial Artin–Schreier covers

For the universal family and a fixed j∈F_p×, its Artin–Schreier cover admits an equivariant relative smooth projective compactification over S whose reduced boundary is a relative divisor with normal crossings. The compactification restricts to the given affine cover. This is the special surface-product compactification of Weil I 8.5(iii), not resolution of arbitrary varieties in positive characteristic.

The hypotheses are as follows. Same family hypotheses; finite Artin–Schreier deck group acts. Use the surface-resolution and relative gluing contract stated above.

A proof proceeds as follows. Normalize S×P^n in the finite cover. The previous local models reduce all singularities to a fixed normalized surface germ times a smooth factor. Use the requested equivariant surface procedure: normalize and blow up the reduced singular locus repeatedly, then blow up boundary points until the boundary has normal crossings. Termination and compatibility with étale maps and smooth products are needed, not assumed. Glue the local resolutions using that compatibility to obtain a global relative smooth compactification and extend the deck action. Relative smoothness of all boundary strata is required for the cohomological base-change argument.

In particular, verify the following values and consequences.

- No characteristic-p resolution theorem in dimensions n is imported under a surface-resolution name.
- The construction must be equivariant and relative, not merely a collection of individually resolved fibers.

*Needs:* [Artin–Schreier local models at infinity](#FF2-polynomial-boundary-local-models), `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.2`.

See [Deligne, Weil I](#source-11) — §§8.5(iii), 8.6, 8.9–8.10, pp. 303–305.

<a id="FF2-polynomial-family-local-acyclicity"></a>

#### Local acyclicity of the universal polynomial sheaf

Let j:S×A^n→S×P^n and π:S×P^n→S. The sheaf j!L_ψ(Q_univ) is locally acyclic relative to π. On the affine chart this follows from lissity; at infinity its étale local descriptions are constant products relative to S. Thus the universal family admits the locally acyclic compactification of Weil II 3.7.3 without first resolving its cover.

The hypotheses are as follows. Universal smooth-leading family; geometric local acyclicity with the actual étale-site definition. The coefficient E contains the chosen additive character.

A proof proceeds as follows. At a finite point, the projection is smooth and L is lisse, so apply smooth local acyclicity. At infinity use the first or second local polynomial model. j!L is pulled back from the fixed local pair in the transverse coordinates; local acyclicity of a product follows from the general-base supplier contract. The property is étale local, so these charts prove it globally. The use of local acyclicity over all of S exceeds a trait-only contract and is an explicit LPV.0 extension request.

In particular, verify the following values and consequences.

- A statement only about pointwise fiber cohomology does not imply this lemma.
- Both finite and infinity charts must be checked, including d=1.

*Needs:* [Artin–Schreier local models at infinity](#FF2-polynomial-boundary-local-models), `LefschetzPencilsAndVanishingCycles:LPV.0`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.0`.

See [Deligne, Weil II](#source-12) — §3.7.3, p. 216.

<a id="FF2-polynomial-family-lissity"></a>

#### Lissity of universal exponential-sum cohomology

For every i, R^if!L_ψ(Q_univ) is lisse on S and its geometric stalk at Q is H^i_c(A^n_k̄,L_ψ(Q)). Formation commutes with extension of the finite field. The family ranks are constant on geometrically connected S.

The hypotheses are as follows. Same universal family; no properness is assumed for f:S×A^n→S.

A proof proceeds as follows. Write Rf!L=Rπ* j!L using the proper compactification S×P^n. Apply proper pushforward of local acyclicity to the previous lemma to obtain lisse cohomology sheaves, then proper base change gives the stalk formula. The original Weil I route instead uses the relative resolved compactification and smooth proper base change with normal-crossings boundary. This alternative is recorded but is not a prerequisite of the Weil II route.

In particular, verify the following values and consequences.

- For n=1,d=1 all these sheaves are zero.
- The stalk formula uses compact supports, rather than ordinary cohomology of a nonproper family.

*Needs:* [Local acyclicity of the universal polynomial sheaf](#FF2-polynomial-family-local-acyclicity), `SchemeAndStackFoundations:SF.2`, `LefschetzPencilsAndVanishingCycles:LPV.0`.

See [Deligne, Weil II](#source-12) — Lemma 3.7.3, pp. 215–216; [Deligne, Weil I](#source-11) — §8.10, p. 305.

<a id="FF2-polynomial-family-cohomology"></a>

#### Ranks and purity in the universal polynomial family

For the universal family, R^if!L=0 for i≠n, and R^nf!L is lisse of rank (d−1)^n, punctually pure of weight n at every complex embedding of its algebraic eigenvalues. In particular the geometric fiber at Q has precisely that dimension and weight, giving the relative form of individual-fiber concentration.

The hypotheses are as follows. n,d≥1, p∤d, ψ nontrivial; smooth leading part. The all-conjugate purity convention is used, not just purity for an unspecified fixed embedding.

A proof proceeds as follows. On the one-variable Fermat factors, H⁰_c and H²_c vanish by the earlier curve-extremal result and nontrivial wild inertia. GOS and the local break d give dim H¹_c=d−1; clean extension and duality make it pure of weight 1. Künneth gives concentration in degree n and dimension (d−1)^n at the Fermat point. Alternatively import the earlier additive-l-function-purity and its determinant comparison for this same one-variable fiber. Lissity and connectedness transfer vanishing and rank to every fiber. Use the requested Weil II 1.8.12 constancy of weights of a mixed lisse sheaf on a connected normal base to transfer weight n; repeat for every embedding. Apply the earlier trace formula to recover its Deligne several-variable bound. The family theorem is a new declaration; the numerical bound is imported, not duplicated.

In particular, verify the following values and consequences.

- n=1 agrees with the earlier degree d−1 additive L-function.
- d=1 gives rank zero, rather than an artificial one-dimensional weight-n term.

*Needs:* [Lissity of universal exponential-sum cohomology](#FF2-polynomial-family-lissity), [Artin–Schreier breaks over geometric local fields](#FF2-geometric-artin-schreier-break), [H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve), [Weil: L(f, ψ; T) has degree d − 1 and its reciprocal roots are q-Weil numbers of weight 1](#FF2-additive-l-function-purity), [The elementary L-function of a rank-one character sum is det(1 − T·Frob | H¹_c) when it is a polynomial](#FF2-rank-one-sheaf-l-function), `EtaleDualityAndPerverseSheaves:EDC.2`, `SchemeAndStackFoundations:SF.2`, `DeligneWeightsAndPurity:DWP.5`, `DeligneWeightsAndPurity:DWP.7`.

See [Deligne, Weil II](#source-12) — §3.7.4, p. 216; [Deligne, Weil I](#source-11) — §§8.10–8.12, pp. 305–306.

<a id="FF2-polynomial-boundary-clean-duality"></a>

#### Family transport of polynomial duality

For an individual Q in the universal family, the forget-supports map H^n_c(A^n,L_ψ(Q))→H^n(A^n,L_ψ(Q)) is an isomorphism; the pairing with H^n_c(A^n,L_ψ(−Q)) to E(−n) is perfect and Frobenius equivariant. This supplies a compactification proof of the earlier duality node, not a new general Poincaré duality theorem.

The hypotheses are as follows. Same polynomial hypotheses. Uses the historical compactification route, with the relative surface compactification and gluing contract above.

A proof proceeds as follows. Normalize ψ=ψ_can(b·), b≠0, by the coefficient-space automorphism Q↦bQ, which preserves S. For this normalized Artin–Schreier cover, the relative smooth compactification with relative normal-crossings boundary makes both ordinary and compact cohomology locally constant over S. Pass to the nontrivial deck-character summands; the cup-product pairing is a morphism of these lisse sheaves. At the Fermat point, Künneth reduces the pairing to the one-variable phase X^d. Its nontrivial character has nonzero wild break at infinity, so this curve summand has clean extension. Imported Poincaré duality gives a perfect compact-support pairing there. Connectedness and local constancy imply that this pairing is perfect on every fiber. Comparing with Poincaré duality between compact and ordinary cohomology forces the forget-supports map to be an isomorphism. No separate assertion of vanishing inertia on every exceptional boundary component is made.

In particular, verify the following values and consequences.

- Dual phase is −Q and the target twist is −n.
- Purity and dimension alone do not prove that the forget-supports map is an isomorphism.

*Needs:* [Relative compactification of polynomial Artin–Schreier covers](#FF2-relative-artin-schreier-compactification), [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf), [If H_c → H is an isomorphism on a smooth affine variety, cohomology is concentrated in the middle degree and pure (Sommes trig. 1.19-1.21)](#FF2-affine-concentration-criterion), `EtaleDualityAndPerverseSheaves:EDC.2`, `SchemeAndStackFoundations:SF.2`, [The universal polynomial with smooth leading form](#FF2-universal-smooth-leading-polynomial-family), [Artin–Schreier breaks over geometric local fields](#FF2-geometric-artin-schreier-break).

See [Deligne, Weil I](#source-11) — Lemma 8.5(ii) and reduction at §8.5, pp. 303–304.

### 2.15 Fourier–Deligne transform, Lang–Weil and Chebotarev

<a id="FF2-fourier-deligne-transform"></a>

#### The one-variable Fourier–Deligne transform FT_ψ

For ψ ≠ 1 and K in the bounded constructible derived category D^b_c(A¹_F, E) (EtaleDualityAndPerverseSheaves:EDC.0 / SchemeAndStackFoundations:SF.2), FT_ψ(K) := R pr_{2!}(pr₁^*K ⊗ L_ψ(xy))[1] ∈ D^b_c(A¹_F, E), with pr₁, pr₂ : A¹ × A¹ → A¹ and L_ψ(xy) the Artin–Schreier sheaf of the pairing (Laumon Définition 1.2.1.1 with S = Spec F, E = A¹, r = 1). Its trace function over F_{q^ν} is the finite Fourier transform with the sign of the shift: t_{FT_ψ(K),ν}(y) = −Σ_{x∈F_{q^ν}} t_{K,ν}(x) ψ(Tr(xy)) (Laumon Théorème 1.2.1.2). It is a triangulated functor, compatible with extension of scalars, and FT_ψ ∘ FT_ψ ≅ [−1]^*(−1) ([Fourier–Deligne inversion FT_ψ ∘ FT_ψ ≅ [−1]^*(−1) (Laumon Théorème 1.2.2.1)](#FF2-fourier-deligne-inversion)).

The hypotheses are as follows. ψ nontrivial; K bounded constructible; the vector bundle is A¹ over Spec F (rank r = 1, whence the shift [1] and the sign −1).

A proof proceeds as follows. Definition by the six operations on D^b_c (the carrier and Rf_!, f^*, ⊗ are requested from SchemeAndStackFoundations:SF.2, used through EtaleDualityAndPerverseSheaves:EDC.0). Kernel: L_ψ(xy) = m^*L_ψ for m(x, y) = xy ([The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf), pull-back). Trace dictionary: the trace formula for R pr_{2!} fibrewise (proper base change and SF.2's trace formula) gives t(y) = (−1)^1 Σ_x t_K(x)ψ(xy).

Provide the following interface.

- `fourierDeligneTrace`: The trace-function dictionary of FT_ψ: t ↦ (y ↦ −Σ_{x∈F} t(x)ψ(xy)) (Laumon 1.2.1.2). The sheaf-level functor is not declared in the prototype: its carrier D^b_c is supplied by SF.2/EDC.0 and absent from Mathlib.
- `fourierDeligneTrace_fourierDeligneTrace`: Trace shadow of inversion: FT(FT t)(x) = q·t(−x), the trace of [−1]^*K(−1).
- `fourierDeligneTrace_one`: FT(1) = −q·δ₀: the trace of FT_ψ(E) = δ₀(−1)[−1].
- `fourierDeligneTrace_single`: FT(δ_a)(y) = −ψ(ay).
- `fourierDeligneTrace_mulShift`: FT_{ψ.mulShift a}(t)(y) = FT_ψ(t)(a y) (dilation).

**Checks.**

- `fourierDeligneTrace_test_one`: fourierDeligneTrace ψ 1 0 = −q and fourierDeligneTrace ψ 1 y = 0 for y ≠ 0.
- `fourierDeligneTrace_test_delta`: fourierDeligneTrace ψ (Pi.single 0 1) y = −1 for every y.
- `fourierDeligneTrace_test_sign`: The transform of the constant function at 0 is −q, not q: the shift [1] contributes the sign.


In particular, verify the following values and consequences.

- FT_ψ(E_{A¹}) ≅ δ₀(−1)[−1]: trace function −q·[y = 0] (Browning–Sawin's unit test: the constant sheaf transforms to a point-supported object).
- FT_ψ(δ₀) ≅ E_{A¹}[1]: trace function −1.
- The trace of FT∘FT is q·t(−x), the trace of [−1]^*K(−1).

*Needs:* [The Artin–Schreier sheaf L_ψ(f)](#FF2-artin-schreier-sheaf), `SchemeAndStackFoundations:SF.2`.

See [Laumon](#source-14) — Définition 1.2.1.1 and Théorème 1.2.1.2, p. 141; [Browning–Sawin](#source-15) — section 2, p. 900 (arXiv v3 p. 8).

<a id="FF2-fourier-deligne-inversion"></a>

#### Fourier–Deligne inversion FT_ψ ∘ FT_ψ ≅ [−1]^*(−1) (Laumon Théorème 1.2.2.1)

For K ∈ D^b_c(A¹_F, E): FT_ψ(FT_ψ(K)) ≅ [−1]^*K(−1), functorially in K. In particular FT_ψ is an auto-equivalence of D^b_c(A¹, E).

The hypotheses are as follows. ψ ≠ 1; the rank-one case of Laumon's theorem (for a vector bundle of rank r the twist is (−r) and a(e) = −e).

A proof proceeds as follows. By proper base change and the projection formula (SchemeAndStackFoundations:SF.2), FT∘FT(K) = R pr_{3!}(pr₁^*K ⊗ R pr_{13!}L_ψ(x₁x₂ + x₂x₃))[2] = R pr_{3!}(pr₁^*K ⊗ R pr_{13!}L_ψ(x₂(x₁ + x₃)))[2]. R pr_{13!} L_ψ(x₂(x₁ + x₃)) vanishes off the antidiagonal x₁ + x₃ = 0 (stalks are H*_c(A¹, L_ψ(c x₂)) = 0 for c ≠ 0, [H*_c(G, L(χ)) = 0 for a nontrivial character of G₀(F) (Sommes trig. Théorème 2.7*)](#FF2-character-sheaf-cohomology-vanishes)) and is E(−1)[−2] on it (H²_c(A¹, E) = E(−1)). Hence FT∘FT(K) ≅ [−1]^*K(−1).

In particular, verify the following values and consequences.

- K = E: FT(E) = δ₀(−1)[−1] and FT(δ₀(−1)[−1]) = E(−1) = [−1]^*E(−1).
- Trace level: FT(FT t)(x) = q t(−x) (fourierDeligneTrace_fourierDeligneTrace).

*Needs:* [The one-variable Fourier–Deligne transform FT_ψ](#FF2-fourier-deligne-transform), [H*_c(G, L(χ)) = 0 for a nontrivial character of G₀(F) (Sommes trig. Théorème 2.7*)](#FF2-character-sheaf-cohomology-vanishes), `SchemeAndStackFoundations:SF.2`.

See [Laumon](#source-14) — Théorème 1.2.2.1, p. 141.

<a id="FF2-fourier-input-for-one-modulus"></a>

#### The Fourier input of Browning–Sawin Lemma 3.7: H^i_c(G_m × A¹, L_ψ(h f(a))) = 0 for i > 2

Let f ∈ F[a] be non-constant of degree D with 1 ≤ D < p, and ψ ≠ 1. Then H^i_c((G_m × A¹)_F̄, L_ψ(h f(a))) = 0 for i > 2 (coordinates h on G_m and a on A¹).

The hypotheses are as follows. 1 ≤ D < p (Browning–Sawin assume char F > k ≥ D); ψ ≠ 1.

A proof proceeds as follows. For h ≠ 0, RΓ_c(A¹_a, L_ψ(h f(a))) is concentrated in degree 1 (a one-variable Artin–Schreier sheaf with pole order D prime to p at ∞: H⁰_c = H²_c = 0, [H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve)); so the total complex is RΓ_c(G_m, 𝒢[−1]) with 𝒢 = R¹pr_{h!}, and only H² _c(G_m, 𝒢) (total degree 3) can survive above 2. Split f_*E = E ⊕ 𝓕₀ by the trace; 𝓕₀ has no geometric invariants or coinvariants (the cover f is connected with finite monodromy). Put P = FT_ψ(𝓕₀[1]); then P|_{G_m} = 𝒢[1] ([The one-variable Fourier–Deligne transform FT_ψ](#FF2-fourier-deligne-transform), proper base change). Inversion ([Fourier–Deligne inversion FT_ψ ∘ FT_ψ ≅ [−1]^*(−1) (Laumon Théorème 1.2.2.1)](#FF2-fourier-deligne-inversion)): RΓ_c(A¹, P) = FT(P)₀[−1] = (𝓕₀)₀(−1) in degree 0, and P₀ = RΓ_c(A¹, 𝓕₀)[2] in degree −1 since H²_c(A¹, 𝓕₀) is coinvariants, zero. The triangle RΓ_c(G_m, 𝒢[1]) → RΓ_c(A¹, P) → P₀ forces H²_c(G_m, 𝒢) = 0. Use this excision argument for the stated vanishing; Katz 8.2.5(2) alone does not give it.

In particular, verify the following values and consequences.

- D = 1, f = a: for h ≠ 0, H*_c(A¹, L_ψ(ha)) = 0, so all the cohomology vanishes, matching Σ_{h∈F^×} Σ_{a∈F} ψ(ha) = 0.
- The excision sequence gives dim H² = #roots − 1.

*Needs:* [The one-variable Fourier–Deligne transform FT_ψ](#FF2-fourier-deligne-transform), [Fourier–Deligne inversion FT_ψ ∘ FT_ψ ≅ [−1]^*(−1) (Laumon Théorème 1.2.2.1)](#FF2-fourier-deligne-inversion), [H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve), [H*_c(G, L(χ)) = 0 for a nontrivial character of G₀(F) (Sommes trig. Théorème 2.7*)](#FF2-character-sheaf-cohomology-vanishes), `SchemeAndStackFoundations:SF.2`.

See [Browning–Sawin](#source-15) — proof of Lemma 3.7, p. 917 (arXiv v3 p. 23).

<a id="FF2-lang-weil-estimate"></a>

#### Lang–Weil estimate #V(F_{q^r}) = q^{re} + O_V(q^{r(e−1/2)})

Let V be a separated F-scheme of finite type, geometrically irreducible of dimension e. Then for every r ≥ 1, |#V(F_{q^r}) − q^{re}| ≤ C_V q^{r(e−1/2)}, where C_V := Σ_{i<2e} dim H^i_c(V_F̄, ℚ_ℓ) depends only on V_F̄ (for e = 0, the reduced underlying V is a rational point and #V(F_{q^r}) = 1).

The hypotheses are as follows. V geometrically irreducible (not merely irreducible); ℓ ≠ p. The constant depends on V; the uniform version is [Uniform Lang–Weil: |#V(F) − π_n| ≤ (d − 1)(d − 2)q^{n−1/2} + C₊(V)q^{n−1}](#FF2-uniform-lang-weil-estimate).

A proof proceeds as follows. Trace formula with constant coefficients: #V(F_{q^r}) = Σ_i (−1)^i Tr(F^{*r} | H^i_c(V_F̄, ℚ_ℓ)), the H^i_c finite-dimensional and zero for i > 2e (requested from SchemeAndStackFoundations:SF.2); #V(F_{q^r}) is independent of the chosen extension of degree r (WeilConjectures:WC.0). Pass first to V_red, which has the same rational points and étale cohomology. Its geometric irreducibility and dimension are unchanged. Remove a smaller-dimensional closed subset to obtain a smooth geometrically connected dense open U. The excision sequence gives H_c^(2e)(U)≅H_c^(2e)(V), and Poincaré duality gives this group as ℚ_ℓ(−e), on which geometric Frobenius acts by q^e. This uses the correct (−e), not the erroneous twist (−2e), and the comparison supplier EDC.2. For i < 2e every eigenvalue on H^i_c has absolute value ≤ q^{i/2} ≤ q^{(2e−1)/2} (Weil II 3.3.4, requested from DeligneWeightsAndPurity:DWP.7). Hence |#V(F_{q^r}) − q^{re}| ≤ Σ_{i<2e} h^i_c q^{r(2e−1)/2}.

In particular, verify the following values and consequences.

- V = A^e: #V(F_{q^r}) = q^{re} exactly (C = 0).
- V = a smooth projective curve of genus g: C_V = 2g + 1 (H⁰ and H¹), consistent with |N_r − q^r − 1| ≤ 2g q^{r/2}.
- V = two conjugate lines over F_{q²} viewed over F_q (irreducible, not geometrically irreducible): #V(F_q) = 1 while q^1 is predicted — geometric irreducibility is needed.

*Needs:* `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `DeligneWeightsAndPurity:DWP.7`, `WeilConjectures:WC.0`.

See [Browning–Sawin](#source-15) — proof of Lemma 5.6, p. 932 (arXiv v3 p. 36); [Ghorpade–Lachaud](#source-16) — §11, Proposition 11.2 and its proof, printed pp. 35–36.

<a id="FF2-uniform-lang-weil-estimate"></a>

#### Uniform Lang–Weil: |#V(F) − π_n| ≤ (d − 1)(d − 2)q^{n−1/2} + C₊(V)q^{n−1}

Let V ⊆ P^N_F be a closed geometrically irreducible subvariety of dimension n and degree d, and π_n := #P^n(F). Then |#V(F) − π_n| ≤ (d − 1)(d − 2) q^{n−1/2} + C₊(V) q^{n−1}, where C₊(V) depends only on V_F̄ and, when V is cut out by m equations of degree ≤ δ, C₊(V) ≤ 9·2^m·(mδ + 3)^{N+1}; for affine V ⊆ A^N of dimension n and degree d, |#V(F) − q^n| ≤ (d − 1)(d − 2)q^{n−1/2} + C q^{n−1} with C bounded in terms of (m, N, δ). This is Lang–Weil's Theorem 1 with an explicit constant (Ghorpade–Lachaud Theorem 11.1, Remark 11.3).

The hypotheses are as follows. V geometrically irreducible, projective (resp. affine) of dimension n and degree d.

A proof proceeds as follows. Trace formula and weights as in [Lang–Weil estimate #V(F_{q^r}) = q^{re} + O_V(q^{r(e−1/2)})](#FF2-lang-weil-estimate): the H^{2n} term gives q^n, and the weight-(2n − 1) part of H^{2n−1}_c has dimension b₊_{2n−1} = 2 dim Alb_w(V) ≤ 2g(Ỹ) ≤ (d − 1)(d − 2) for a general linear curve section Y with normalisation Ỹ (Ghorpade–Lachaud Theorem 10.7 and Proposition 9.4(iii); the genus bound of plane curves of degree d). All other contributions are bounded by the sum of Betti numbers, controlled by Katz's bound on sums of Betti numbers in terms of (m, N, δ) (Ghorpade–Lachaud [24]). Inputs in the exact supplier contracts are: Katz's Betti-number bound, the Albanese–Weil comparison of b_{2n−1}, and the geometric-genus bound for singular plane sections.

In particular, verify the following values and consequences.

- V a plane curve of degree d: |#V(F) − (q + 1)| ≤ (d − 1)(d − 2)√q + C, the Weil bound with 2g ≤ (d − 1)(d − 2).
- d = 1 (a linear subspace): the error term q^{n−1/2} vanishes.

*Needs:* [Lang–Weil estimate #V(F_{q^r}) = q^{re} + O_V(q^{r(e−1/2)})](#FF2-lang-weil-estimate), [Explicit Betti bounds for projective varieties](#FF2-explicit-projective-betti-bound), [The highest odd weight and the Albanese–Weil spectrum](#FF2-top-weight-albanese-comparison).

See [Ghorpade–Lachaud](#source-16) — section 11, Theorem 11.1, p. 35.

<a id="FF2-dimension-from-point-counts"></a>

#### All-extension point bounds detect dimension (Browning–Sawin Lemma 5.6)

Let V be a separated F-scheme of finite type. If there is a constant C with #V(F_{q^r}) ≤ C q^{rD} for every r ≥ 1, then dim V ≤ D. A bound over F alone is insufficient.

The hypotheses are as follows. The bound for all r ≥ 1 with one constant C.

A proof proceeds as follows. Let W be a geometrically irreducible component of V_F̄ of dimension e = dim V; it is defined over F_{q^{r₀}} for some r₀ (requested from SchemeAndStackFoundations:SF.0: finitely many geometric irreducible components, each defined over a finite extension). W′ := W minus the other components is a dense open of W, geometrically irreducible of dimension e, defined over F_{q^{r₀}}. [Lang–Weil estimate #V(F_{q^r}) = q^{re} + O_V(q^{r(e−1/2)})](#FF2-lang-weil-estimate) over F_{q^{r₀}}: #W′(F_{q^{r₀r}}) ≥ q^{r₀re} − C_{W′}q^{r₀r(e−1/2)}, and #V(F_{q^{r₀r}}) ≥ #W′(F_{q^{r₀r}}); letting r → ∞ in q^{r₀re}(1 − o(1)) ≤ C q^{r₀rD} gives e ≤ D.

In particular, verify the following values and consequences.

- V = A¹ ⊔ (a point): C = 2, D = 1 works and dim V = 1.
- V = Spec F_{q²} over F_q: #V(F_q) = 0 but #V(F_{q²}) = 2; the all-r hypothesis is what sees dimension 0.

*Needs:* [Lang–Weil estimate #V(F_{q^r}) = q^{re} + O_V(q^{r(e−1/2)})](#FF2-lang-weil-estimate), `SchemeAndStackFoundations:SF.0`.

See [Browning–Sawin](#source-15) — Lemma 5.6, p. 932 (arXiv v3 p. 36).

<a id="FF2-geometric-chebotarev"></a>

#### Chebotarev density for finite étale Galois covers of varieties over F (Ekedahl's form)

Let π : Y₀ → X₀ be a finite étale Galois cover of quasi-projective F-varieties with group G acting by F-automorphisms of Y₀ over X₀, Y₀ geometrically irreducible of dimension r, and C ⊆ G a union of conjugacy classes. For x ∈ X₀(F_{q^ν}) let Frob_x ⊆ G be its Frobenius conjugacy class. Then #{x ∈ X₀(F_{q^ν}) : Frob_x ⊆ C} = (|C|/|G|) q^{νr} + O_Y(q^{ν(r−1/2)}).

The hypotheses are as follows. Y₀ geometrically irreducible, so the geometric and arithmetic monodromy groups coincide (no constant-field coset condition). X₀ and Y₀ are quasi-projective varieties, so the finite-group descent twists used here exist as schemes. Extension to arbitrary separated finite-type schemes would require a more general descent/point-counting contract and is not asserted by this proof.

A proof proceeds as follows. For each ν≥1 and g∈G, form the twist Y_(ν,g) over F_(q^ν), with its arithmetic Frobenius equal to g⁻¹∘F^ν. It is a quasi-projective geometrically irreducible variety whose base change is Y_F̄. A fixed twist over F_q instead has ν-th Frobenius g^(−ν)F^ν and does not count the desired fixed-point equation. Then #{y∈Y(F̄):F^ν(y)=gy}=#Y_(ν,g)(F_(q^ν))=q^(νr)+O_Y(q^(ν(r−1/2))). Uniformity follows because every such twist has the same geometric cohomology and Betti numbers, and its weight-zero constant sheaf has the same weight bounds. Apply [Lang–Weil estimate #V(F_{q^r}) = q^{re} + O_V(q^{r(e−1/2)})](#FF2-lang-weil-estimate) with this common geometric constant, not with separately uncontrolled constants. Counting fibres: an x with Frob_x = class(g) has exactly |C_G(g)| points y above it with F^ν(y) = g y; summing over g ∈ C gives the claim ('untwisting').

In particular, verify the following values and consequences.

- G trivial: the Lang–Weil estimate itself.
- X₀ = G_m, Y₀ = G_m with y ↦ y^d (d | q − 1), G = μ_d: #{x : x is a d-th power} = q/d + O(1).

*Needs:* [Lang–Weil estimate #V(F_{q^r}) = q^{re} + O_V(q^{r(e−1/2)})](#FF2-lang-weil-estimate), `SchemeAndStackFoundations:SF.1`.

See [Tomašić](#source-18) — Introduction, pp. 1-2.

### 2.16 Betti bounds, Albanese spectra and uniform Lang–Weil

<a id="FF2-smooth-affine-betti-bound"></a>

#### Katz’s smooth affine Betti bound

Over an algebraically closed field of characteristic different from ℓ, let V⊂A^N be cut out by r≥1 equations of degree≤δ, N≥1,δ≥1. If V has dimension zero, or is smooth and connected, then β_c(V)=Σ_i dim H^i_c(V,Q_ℓ)≤A(N,r,δ), where E(N,r,δ)=2^r(r+1+rδ)^N and A(N,r,δ)=E(N,r,δ)+2+2Σ_{j=1}^{N−1}E(j,r,δ). For smooth V, β_c(V)=β(V).

The hypotheses are as follows. Dimension-zero or smooth connected affine V. The proof uses the explicit Euler bound and generic affine weak Lefschetz in the supplier contracts.

A proof proceeds as follows. For dimension zero, β_c=χ_c≤E. For a connected smooth affine curve, β=2−χ≤E+2. For dimension n≥2 choose a generic affine hyperplane section W, smooth connected of dimension n−1. Affine weak Lefschetz identifies cohomology below n−1 and injects in n−1; affine vanishing eliminates degrees>n. The resulting inequality β(V)≤|χ(V)|+|χ(W)|+β(W) gives E(N,r,δ)+E(N−1,r,δ)+A(N−1,r,δ)=A(N,r,δ). Duality identifies ordinary and compact Betti sums for smooth V.

In particular, verify the following values and consequences.

- A point has β_c=1.
- An affine curve of genus g with s punctures has β_c=2g+s, compatible with the Euler step.

*Needs:* `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.4`, `SchemeAndStackFoundations:SF.2`, `PadicDifferentialEquationsAndRigidCohomology:RD.6`.

See [Katz, Betti numbers](#source-36) — Part I, Theorem 2 and proof, manuscript pp. 2–4.

<a id="FF2-arbitrary-affine-betti-bound"></a>

#### Katz’s arbitrary affine Betti bound

For any closed subscheme V⊂A^N over an algebraically closed field, N≥1, defined by r≥1 equations of degree≤δ≥1, β_c(V)≤B(N,r,δ)=1+Σ_{∅≠J⊂{1,…,r}} A(N+1,1,1+δ|J|). Nilpotents and singularities are allowed. Here A is the constant in smooth-affine-betti-bound.

The hypotheses are as follows. ℓ invertible in the ground field. The N=1 case, not stated in Katz’s Theorem 1 header, is supplied by its same complement argument and the curve base case.

A proof proceeds as follows. Excision in A^N gives β_c(V)≤1+β_c(A^N−V)=1+β(A^N−V), since the complement is smooth. Cover the complement by D(F_i). Mayer–Vietoris bounds β by the sum over nonempty intersections. Each intersection is the smooth hypersurface zΠ_{i∈J}F_i=1 in A^(N+1), of degree≤1+δ|J|. It can be empty; a nonempty such principal open is connected. Apply the preceding smooth bound to obtain B. Étale cohomology is unchanged by reduction; no smoothness of V is used.

In particular, verify the following values and consequences.

- The empty closed subscheme has zero cohomology.
- A union of axes is permitted; no ordinary/compact duality is applied to the singular union itself.

*Needs:* [Katz’s smooth affine Betti bound](#FF2-smooth-affine-betti-bound), `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `SchemeAndStackFoundations:SF.0`.

See [Katz, Betti numbers](#source-36) — Part I, Theorem 1 and proof, manuscript pp. 2–3.

<a id="FF2-explicit-projective-betti-bound"></a>

#### Explicit Betti bounds for projective varieties

If X⊂P^N, N≥1, is defined by r≥1 homogeneous equations of degree≤δ≥1, then β(X)=β_c(X)≤1+Σ_{j=1}^N B(j,r,δ)≤8·2^r(rδ+3)^(N+1). This holds in arbitrary characteristic with ℓ invertible, for singular and nonreduced X. For a nonempty finite-field model of X, the total reduced numerator/denominator degree τ(X) of Z(X,T)/Z(P^n,T), n=dim X, is at most β(X)+n≤9·2^r(rδ+3)^(N+1).

The hypotheses are as follows. Projective X, N≥1, r,δ≥1. τ counts degrees after cancellations and is nonnegative; the n=0 counting case is handled directly. The zeta-quotient assertion assumes X nonempty so that n=dim X is a nonnegative integer; the Betti assertion also covers the empty scheme.

A proof proceeds as follows. Filter projective space by affine coordinate strata. Excision and the preceding arbitrary-affine bound give 1+Σ B(j,r,δ), with the point stratum contributing at most 1. For b=3+sδ≥3, insert E(j,1,1+sδ)=2b^j into A: A(j+1,1,1+sδ)=2b^(j+1)+2+4Σ_{t=1}^j b^t≤4b^(j+1)−4. For b_max=3+rδ, B(j,r,δ)≤1+(2^r−1)(4b_max^(j+1)−4). Summing a geometric series gives at most N+1+6·2^r b_max^(N+1)≤8·2^r b_max^(N+1). This derives the factor 8 used by Ghorpade–Lachaud, rather than misquoting Katz’s looser displayed factor 9. The trace formula bounds the total degree of Z by β. Cancel its common top Tate factor with Z(P^n); the remaining projective-space factors add at most n, yielding τ≤β+n and the factor 9.

In particular, verify the following values and consequences.

- A linear projective space has β=n+1 and τ=0.
- The bound controls compact cohomology of every affine stratum, not ordinary Betti numbers of a singular affine variety.

*Needs:* [Katz’s arbitrary affine Betti bound](#FF2-arbitrary-affine-betti-bound), `SchemeAndStackFoundations:SF.2`.

See [Katz, Betti numbers](#source-36) — Part I, Theorem 3, manuscript p. 4; [Ghorpade–Lachaud](#source-16) — §5, explicit Betti-number bound and §11.1–11.2.

<a id="FF2-albanese-linear-section-bound"></a>

#### Albanese–Weil varieties and linear curve sections

Let X⊂P^N be geometrically integral projective of dimension n≥2 and degree d over a perfect field. A geometric generic linear curve section Y is integral, and its smooth projective normalization Ỹ induces a surjection Jac(Ỹ)→Alb_w(X). Thus 2 dim Alb_w(X)≤2g(Ỹ)≤(d−1)(d−2). For generic sections of dimension≥2 the induced Albanese–Weil homomorphism is a purely inseparable isogeny. Alb_w uses the universal rational-map Albanese; it is not the Albanese for everywhere regular maps on a singular X.

The hypotheses are as follows. Geometric generic or nonempty-open general linear sections. Use the rational Albanese, its section functoriality and the singular-section genus inequality from the exact supplier contracts.

A proof proceeds as follows. Use the requested rational Albanese universal property and section theorem from its single abelian/Picard supplier. For a curve section pass to its smooth normalization, whose rational Albanese is its Jacobian, to obtain surjectivity. Use generic birational plane projection of the integral degree-d curve and the arithmetic-genus bound (d−1)(d−2)/2; normalization can only lower that genus. This singular-curve comparison exceeds the supplier’s smooth-plane-curve formula and is included in the SF.3 contract.

In particular, verify the following values and consequences.

- For X=P^n, Alb_w=0 and d=1 gives zero right side.
- Replacing Alb_w by Alb_s on a singular projective variety is not justified.

*Needs:* `AbelianSchemesAndArithmeticModuli:A2`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.0`.

See [Ghorpade–Lachaud](#source-16) — Proposition 9.4(i)–(iii), pp. 28–29.

<a id="FF2-bombieri-sperber-albanese-expansion"></a>

#### Bombieri–Sperber’s Albanese point-count expansion

For a projective geometrically integral X/F_q of dimension n≥2, A=Alb_w(X), and arithmetic Frobenius endomorphism ϕ of A, for every r≥1 one has #X(F_{q^r})=π_n(q^r)−(q^r)^(n−1)Tr(ϕ^r)+O_X((q^r)^(n−1)). The constant is independent of r. This is the fixed-variety all-extension expansion used to identify the highest nontrivial weight; it does not yet assert a bound uniform over arbitrary X.

The hypotheses are as follows. Projective X; exact rational-Albanese convention. The normal-surface/resolution comparison and uniformly bounded generic-pencil bad locus are included in the exact supplier contracts.

A proof proceeds as follows. In dimension two, use normalization and a projective smooth surface resolution, birational invariance of rational Albanese, Picard/Tate comparison and Gysin/duality to identify the weight-three trace with qTr(ϕ). Lower-weight and boundary terms are O(q). For n≥3 select a generic codimension-two pencil center meeting X in dimension n−2. The requested bounded-pencil contract bounds the center and exceptional fibers by O((q^r)^(n−1)). On each good hyperplane section, the previous dimension expansion applies; its rational Albanese is purely inseparably isogenous to A, so their Frobenius traces agree. Sum over q^r+1 good parameters, controlling the finitely many bad parameters and the overcounted center. The induction must be uniform over the fibers of this fixed pencil, using a fixed finite-type family and bounded exceptional locus. Finitely many small extension fields can be absorbed into one X-dependent constant.

In particular, verify the following values and consequences.

- X=P^n has ϕ trace zero and exact count π_n.
- This estimate is insufficient to claim the explicit uniform equation-degree constant before the Betti theorem.

*Needs:* [Albanese–Weil varieties and linear curve sections](#FF2-albanese-linear-section-bound), `AbelianSchemesAndArithmeticModuli:A2`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.0`, `EtaleDualityAndPerverseSheaves:EDC.2`, `DeligneWeightsAndPurity:DWP.7`, [Lang–Weil estimate #V(F_{q^r}) = q^{re} + O_V(q^{r(e−1/2)})](#FF2-lang-weil-estimate), [Explicit Betti bounds for projective varieties](#FF2-explicit-projective-betti-bound).

See [Ghorpade–Lachaud](#source-16) — Lemma 11.7 and proof, pp. 37–38.

<a id="FF2-top-weight-albanese-comparison"></a>

#### The highest odd weight and the Albanese–Weil spectrum

For projective geometrically integral X/F_q of dimension n≥2, the multiset of eigenvalues of geometric cohomological Frobenius on the weight-(2n−1) quotient of H^(2n−1)(X_k̄,Q_ℓ) equals {q^(n−1)α_j}, where α_j are the characteristic roots of the Frobenius endomorphism of Alb_w(X), with multiplicity. Hence its dimension is 2 dim Alb_w(X) and the traces over extensions are (q^r)^(n−1)Tr(ϕ^r). Equality of spectra is asserted, without an unjustified canonical isomorphism of representations.

The hypotheses are as follows. Weight quotient in the algebraic all-conjugate sense. Abelian Frobenius roots are pure of weight one; its Tate-module convention is fixed by the supplier.

A proof proceeds as follows. The trace formula and weight bounds separate the q^(rn) top Tate term and the possible weight-(2n−1) term; all other terms are O_X(q^(r(n−1))). Compare with the all-extension Bombieri–Sperber expansion. The difference of the two candidate power sums is O_X(q^(r(n−1))). Both spectra have exact absolute value q^(n−1/2). Apply the finite-spectrum converse and linear independence of distinct exponential sequences to force the signed multiplicities of every such root to vanish. This is the signed version of Ghorpade–Lachaud Lemma 8.2, not an application of an unsigned positive-multiplicity bound without cancellation control.

In particular, verify the following values and consequences.

- The rank bound follows from the generic curve-section node.
- A bound on one point count, rather than all extensions, cannot determine this spectrum.

*Needs:* [Bombieri–Sperber’s Albanese point-count expansion](#FF2-bombieri-sperber-albanese-expansion), `AbelianSchemesAndArithmeticModuli:A2`, `DeligneWeightsAndPurity:DWP.1`, `DeligneWeightsAndPurity:DWP.7`, `DeligneWeightsAndPurity:DWP.8`, `SchemeAndStackFoundations:SF.2`, `WeilConjectures:WC.5:power-sum-converse`.

See [Ghorpade–Lachaud](#source-16) — Theorem 10.7; proof after Lemma 11.7, pp. 34, 38.

<a id="FF2-uniform-lang-weil-family"></a>

#### Uniform Lang–Weil over a bounded family

Fix N,r,δ≥1. There is a constant C(N,r,δ) such that for every finite field F_Q and geometrically integral affine V⊂A^N_F_Q defined by r equations of degree≤δ, dimension e≥1, |#V(F_Q)−Q^e|≤C(N,r,δ)Q^(e−1/2). For geometrically integral projective fibers X⊂P^N, defined by r homogeneous equations of degree≤δ, of degree d and dimension e≥1, the sharper projective form holds with (d−1)(d−2)Q^(e−1/2)+9·2^r(rδ+3)^(N+1)Q^(e−1). For a fixed finite-type presentation these constants are uniform over all finite-field fibers and extensions that are geometrically integral.

The hypotheses are as follows. Uniformity is in specified embedding/equation data or a fixed finite-type presentation. Dimension-zero geometrically integral fibers are single rational reduced points and are treated separately.

A proof proceeds as follows. The new projective Betti bound and top-weight Albanese comparison provide the missing inputs of the imported earlier uniform theorem; the curve-section bound yields its degree coefficient. For dimension one use normalization, the singular-curve genus bound and the earlier curve estimate; the Albanese comparison above is used only in dimensions at least two. For affine varieties use excision with the projective closure. Homogenizing only the listed generators can create infinity components: obtain a bound for generators of the homogenized saturated ideal using the requested bounded-presentation elimination contract, then bound the boundary as well. For fixed finite-type presentations choose finite affine charts and bounded generators once. Apply the bounds to geometrically integral fibers; dimension and degree bounds are controlled by this presentation. This supplies a bound uniform in all geometrically integral fibres of the fixed presentation.

In particular, verify the following values and consequences.

- Linear projective fibers have exact count π_e.
- Geometric integrality cannot be replaced by connectedness: two irreducible components contribute two leading terms.

*Needs:* [Uniform Lang–Weil: |#V(F) − π_n| ≤ (d − 1)(d − 2)q^{n−1/2} + C₊(V)q^{n−1}](#FF2-uniform-lang-weil-estimate), [Explicit Betti bounds for projective varieties](#FF2-explicit-projective-betti-bound), [The highest odd weight and the Albanese–Weil spectrum](#FF2-top-weight-albanese-comparison), [Albanese–Weil varieties and linear curve sections](#FF2-albanese-linear-section-bound), `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.3`.

See [Ghorpade–Lachaud](#source-16) — Theorem 11.1 and Remark 11.3, pp. 35–36.

### 2.17 Constant-field cosets and Chebotarev

<a id="FF2-constant-coset-twist-count"></a>

#### Twists of a geometric component in the Frobenius coset

Let X/F_q be smooth geometrically connected of dimension e≥1 and Y→X a connected finite étale Galois cover with group G of F_q-automorphisms. Let H⊲G be the geometric subgroup, G/H≅Gal(F_{q^m}/F_q), and Γ_r the inverse image of arithmetic Frob_q^r. For g∈Γ_r, the semilinear action g⁻¹Frob_q^r preserves every geometric component D of Y, giving a descended twist D_{r,g}/F_{q^r}. If C_G(g) is its conjugacy class, N_r(C_G(g))=|Z_G(g)|⁻¹Σ_D #D_{r,g}(F_{q^r}), the sum being over all m geometric components. Individual component-twist counts need not agree.

The hypotheses are as follows. Arithmetic Frobenius conventions for the torsor; cohomological geometric Frobenius is its inverse in the representation dictionary. The twist is formed separately over F_{q^r}; it is not the r-th power of a fixed F_q twist.

A proof proceeds as follows. Arithmetic Frobenius permutes the m components through its image in G/H. Exactly g∈Γ_r makes g⁻¹Frob^r preserve each component. Use effective descent on D. For a rational base point, the number of lifts satisfying Frob^r(y)=gy is |Z_G(g)| when its class is C_G(g), otherwise zero. Count the solutions of Frob^r(y)=gy over all components, each descended separately under g⁻¹Frob^r. Their total is the sum of their twist point counts; do not replace this sum by m times one chosen component. Use |G|=m|H| and |C_G(g)|=|G|/|Z_G(g)| for the leading term after applying Lang–Weil separately to all m twists.

In particular, verify the following values and consequences.

- For a pure constant extension, H=1 and every point has the unique admissible Frobenius coset class.
- If g∉Γ_r there are no such points; assigning density |C|/|G| in every extension is false.

*Needs:* `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, `FunctionFieldArithmetic:FA.5`.

See [Meagher](#source-39) — Proof of Theorem 1.1, pp. 198–200.

<a id="FF2-constant-field-coset-chebotarev"></a>

#### Chebotarev with a constant-field Frobenius coset

In the preceding setting, for a conjugacy-stable subset C⊂G and r≥1, let N_r(C) count x∈X(F_{q^r}) whose arithmetic Frobenius class lies in C. Then N_r(C)=|C∩Γ_r|/|H|·q^(re)+O(q^(r(e−1/2))). For a fixed cover the constant is independent of r. It is uniform over covers and twists with specified bounded projective embedding and boundary-equation data (including the finite G-action); it is not asserted to depend only on the base degree or |G|.

The hypotheses are as follows. X smooth geometrically connected; cover connected finite étale Galois. For a dense open étale locus of a generically finite cover, the excluded boundary contributes O(q^(r(e−1))) under the same bounded-data hypotheses.

A proof proceeds as follows. For each G-conjugacy class in C∩Γ_r use constant-coset-twist-count and Lang–Weil on every component twist D_{r,g}. There are m such components, each with leading term q^(re), giving m/|Z_G(g)|=|C_G(g)|/|H|. Fix a finite G-stable linear system giving an equivariant projective embedding, and equivariant boundary equations. Descent twists its finite-dimensional vector space and equations; dimensions and degrees stay bounded. The SF.1 equivariant-presentation request is needed for uniformity across twists. Apply uniform-lang-weil-family to the twists and sum |class|/|H| over the permitted classes. There are finitely many classes, and the specified data control their errors for every r. In dimension one, import FA.5’s genus/conductor error and its coset convention, rather than building a second function-field Chebotarev theorem.

In particular, verify the following values and consequences.

- When m=1, H=G and Γ_r=G, recovering the earlier density |C|/|G|.
- For a constant extension of degree m, counts vanish on incompatible extension degrees and equal #X on the unique compatible class.

*Needs:* [Twists of a geometric component in the Frobenius coset](#FF2-constant-coset-twist-count), [Uniform Lang–Weil over a bounded family](#FF2-uniform-lang-weil-family), `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.0`, `FunctionFieldArithmetic:FA.5`.

See [Meagher](#source-39) — Theorem 1.1 and Appendix A, pp. 196–202.

### 2.18 Correlations, isotypic main terms and Möbius stabilizers

<a id="FF2-trace-correlation-main-term"></a>

#### The full main term in trace-function correlations

Let U⊂A¹_F_q be a nonempty open and F,G lisse algebraic E-sheaves on U, punctually pure of weight zero at the fixed embedding ι:Ē→ℂ. For Q=q^r, put C_r=Q⁻¹Σ_{x∈U(F_Q)}t_F,r(x)conj(t_G,r(x)). If W=(V_F⊗V_G^∨)_{π₁(U_k̄)} with its induced Frobenius, then |C_r−Tr(Frob_q^r|W)|≤b₁Q^(−1/2), where b₁=dim H¹_c(U_k̄,F⊗G^∨). On middle-extension traces on all A¹ add at most |A¹−U|rk(F)rk(G)/Q to the error. The main term is not discarded when geometric invariants are present.

The hypotheses are as follows. Lisse pure weight-zero sheaves on common affine U. Use coinvariants, not an unproved identification with invariants for arbitrary representations.

A proof proceeds as follows. On U purity gives the dual trace equal to complex conjugation. Apply the earlier trace formula to F⊗G^∨. H⁰_c vanishes on a connected nonproper curve; imported duality identifies H²_c=W(−1). Dividing by Q gives Tr(Frob^r|W). DWP.7 bounds H¹_c eigenvalues by √Q, giving the exact Betti error. The DWP.5 local-weight theorem gives boundary middle-extension stalks that have eigenvalues of weight≤0 and rank≤the generic rank, yielding the stated finite boundary correction. The earlier conductor bound, together with GOS and local tensor Swan inequalities from AGR, converts b₁ into a constant depending only on the two conductors and the common singular set.

In particular, verify the following values and consequences.

- F=G=constant rank one on A¹ gives C_r=1 and W=E; cancellation is absent.
- Distinct additive characters on A¹ give W=0 and the usual exact orthogonality.

*Needs:* [Trace functions of lisse ℓ-adic sheaves on open subsets of the line](#FF2-trace-function), [Trace formula for products of Artin–Schreier and Kummer characters (Scholie 1.9)](#FF2-character-sheaf-trace-formula), [H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve), [dim H¹_c(U, 𝓕) ≤ C(𝓕)², with the conductor C(𝓕) = rk 𝓕 + #S + Σ Sw_x(𝓕)](#FF2-h1c-conductor-bound), `EtaleDualityAndPerverseSheaves:EDC.2`, `DeligneWeightsAndPurity:DWP.7`, `ArithmeticGaloisRepresentations:R01.3`, `DeligneWeightsAndPurity:DWP.5`.

See [Fouvry–Kowalski–Michel–Sawin](#source-13) — §5, (5.1)–(5.2), pp. 13–14.

<a id="FF2-isotypic-quasi-orthogonality"></a>

#### Isotypic quasi-orthogonality

If F,G in trace-correlation-main-term are geometrically isotypic, with multiplicities m_F,m_G of irreducible geometric constituents L_F,L_G, then the main term is zero when L_F is not isomorphic to L_G. If they are isomorphic, dim W=m_Fm_G and its Frobenius eigenvalues α_1,…,α_{m_Fm_G} have modulus one; C_r=Σα_i^r+O(q^(−r/2)). For geometrically irreducible F,G the nonzero main term is a single α^r. The constants are independent of r, controlled by the preceding Betti/conductor data.

The hypotheses are as follows. Geometric isotypicity, not arithmetic isotypicity alone. No arithmetic semisimplicity or Frobenius diagonalizability is assumed.

A proof proceeds as follows. Use DWP.8 geometric semisimplicity of pure lisse sheaves and Schur’s lemma to identify the dimension of the coinvariant Hom space. DWP.7 applied to H²_c gives weights≤2, so the Frobenius eigenvalues of W have modulus≤1 after removing the Tate twist. Apply the same argument with F and G exchanged. DWP.8 geometric semisimplicity identifies the exchanged coinvariant space with W∨, so the reciprocal eigenvalues also have modulus≤1. Therefore every eigenvalue of W has modulus one. Traces of powers count these eigenvalues with multiplicity even with arithmetic Jordan blocks. Insert this description of W into trace-correlation-main-term.

In particular, verify the following values and consequences.

- For F=G geometrically irreducible the main term is 1.
- An arithmetic unipotent extension of the constant sheaf need not split; traces still obey the eigenvalue formula.

*Needs:* [The full main term in trace-function correlations](#FF2-trace-correlation-main-term), `DeligneWeightsAndPurity:DWP.8`, `DeligneWeightsAndPurity:DWP.7`.

See [Fouvry–Kowalski–Michel–Sawin](#source-13) — Theorem 5.2, (5.3)–(5.4), p. 14.

<a id="FF2-geometric-mobius-stabilizer"></a>

#### The geometric Möbius stabilizer of a sheaf

For a middle-extension E-sheaf F on P¹_k̄, define Aut_geom(F) as the subgroup of PGL₂(k̄) consisting of γ for which γ*F is isomorphic to F. For F defined over F_q the rational stabilizer is its intersection with PGL₂(F_q). The definition asserts a subgroup of transformations; algebraic-group representability and classification are not part of it.

The hypotheses are as follows. Use middle extension from the maximal lisse locus and genuine sheaf isomorphism. A chosen finite-field model defines the rational intersection.

A proof proceeds as follows. Use actual pullback on the constructible sheaf category and equality of geometric isomorphism classes. Identity, composition and inverse follow from pullback functoriality; composition reverses pullback order but preserves membership. A pullback isomorphism preserves the singular set and local inertia representations; conductor is invariant under a Möbius automorphism.

Provide the following interface.

- `TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer.one`: Identity lies in Aut_geom(F).
- `TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer.mul`: Membership is closed under composition.
- `TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer.inv`: Membership is closed under inverse.
- `TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer.conjugate`: For γ*F the stabilizer is γ⁻¹Aut_geom(F)γ.
- `TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer.singularSet`: Every member preserves the intrinsic singular locus and matches local inertia data.
- `TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer.iso`: An isomorphism F≅G of middle-extension sheaves induces equality Aut_geom(F)=Aut_geom(G); the subgroup depends only on the geometric isomorphism class.
- `TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer.rational`: For γ∈PGL₂(F_q), membership in the rational stabilizer is equivalent to γ*F_k̄≅F_k̄; an isomorphism over F_q is not required.

**Checks.**

- `TauCeti.FiniteFieldSums.FF2.mobius_trivial`: For the constant sheaf the stabilizer is all PGL₂(k̄).
- `TauCeti.FiniteFieldSums.FF2.mobius_additive_translation`: Every translation stabilizes L_ψ(X) geometrically: the added constant gives a geometrically trivial rank-one factor.
- `TauCeti.FiniteFieldSums.FF2.mobius_kummer_inverse`: Inversion stabilizes the nontrivial Kummer sheaf exactly for a quadratic character.
- `TauCeti.FiniteFieldSums.FF2.mobius_kummer_nonexample`: A nontrivial translation does not preserve the two singular points 0 and ∞ of a nontrivial Kummer sheaf.


In particular, verify the following values and consequences.

- The trivial sheaf has full PGL₂ stabilizer.
- The inversion stabilizes L_χ on G_m exactly when χ=χ⁻¹.

*Needs:* `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.0`, [Trace functions of lisse ℓ-adic sheaves on open subsets of the line](#FF2-trace-function).

See [Fouvry–Kowalski–Michel–Sawin](#source-13) — Definition 7.1 and Examples 7.3, pp. 19–20.

<a id="FF2-mobius-autocorrelation-bound"></a>

#### Cancellation outside the geometric Möbius stabilizer

For a geometrically irreducible, punctually weight-zero middle-extension sheaf F on P¹_F_q and γ∈PGL₂(F_q), sum over the common affine lisse domain U∩γ⁻¹U. If γ∉Aut_geom(F), the normalized autocorrelation Q⁻¹Σt_F(x)conj(t_F(γx)) is O_F(Q⁻¹/2) for Q=q^r, uniformly in r and in γ with fixed conductor data. On the full projective line use the middle-extension boundary correction. If γ belongs to the stabilizer the rank-one Hom main term must be retained.

The hypotheses are as follows. Geometrically irreducible F; γ defined over the base field. The sum excludes a pole of γ when written in affine coordinates.

A proof proceeds as follows. Pull back F along γ; its conductor and weight are unchanged. Apply isotypic-quasi-orthogonality to F and γ*F on their common domain. Stabilizer nonmembership means the geometric constituents are nonisomorphic, so W=0. Bound the common singular set and tensor Swan terms by the conductor inputs; apply the explicit boundary correction where needed.

In particular, verify the following values and consequences.

- For the identity, F=γ*F and the correlation has a main term; a cancellation-only theorem would fail.
- For a Kummer sheaf and a nontrivial translation, singular-set mismatch gives cancellation.

*Needs:* [The geometric Möbius stabilizer of a sheaf](#FF2-geometric-mobius-stabilizer), [Isotypic quasi-orthogonality](#FF2-isotypic-quasi-orthogonality), `ArithmeticGaloisRepresentations:R01.3`.

See [Fouvry–Kowalski–Michel–Sawin](#source-13) — Proposition 7.2, p. 20.

### Examples

For f=X on F₃, every nontrivial additive companion sum is zero and L(f,ψ;T)=1. For f=X² the first sum is 1+2ζ=i√3, of norm √3, and the degree bound is one. For y²=x over any odd finite field, each y determines one x, so the affine point count is q and the quadratic-character sum is zero. For the rank-two Kloosterman sum over F₃ at a=1, the two unit terms give ζ²+ζ=−1. A constant sheaf retains its top compact-support cohomology; geometric nontriviality is therefore indispensable in the square-root error statements.

### Dependencies

Layer 1 supplies explicit character normalizations and lifting. Polynomial L-series and finite-field point averaging use finite algebra; geometric bounds use the exact scheme, six-operation, duality, Swan-conductor, weights and curve-zeta contracts. The global Fourier transform uses those same sheaves and operations. Uniform family and Chebotarev statements additionally require the bounded-presentation, Albanese and constant-field-coset comparisons spelled out above.

<a id="FF3"></a>

## Layer 3: Certified algorithms and point counts

Separate counting, elementary factorization/Hensel algorithms and point-counting components. Randomized algorithms specify output support, failure probability and expected cost separately. The requested CN.0 extensions supply program and representation semantics. Concrete checker acceptance uses Lean's existing decision reflection and the checker soundness theorems. Exact squarefree and hyperelliptic presentation counts reuse the census and factorization theory; smooth projective curve zeta reconstruction additionally imports WC.5 and its concrete-model comparison.

### 3.1 Square-free decomposition

<a id="FF3-pth-root-of-a-polynomial-with-zero-derivative"></a>

#### The p-th root of a polynomial with zero derivative

Let F be a finite field of characteristic p. For f ∈ F[X], pthRootOfDerivZero p f := map (Frob⁻¹) (contract p f), where contract p keeps the coefficients of the exponents divisible by p and Frob⁻¹ = (frobeniusEquiv F p).symm is the inverse of x ↦ x^p. If f' = 0 then (pthRootOfDerivZero p f)^p = f.

The hypotheses are as follows. F a finite (hence perfect) field of characteristic p, p prime f ∈ F[X]

A proof proceeds as follows. If f' = 0 then expand p (contract p f) = f (Mathlib Polynomial.expand_contract). For any g, expand p g = (map Frob⁻¹ g)^p (Mathlib polynomial_expand_eq, for a perfect ring); apply it with g = contract p f. Degree: natDegree (contract p f) · p = natDegree f when f' = 0, and map by a ring automorphism preserves degree and leading coefficient 1.

Provide the following interface.

- `pthRootOfDerivZero_pow`: derivative f = 0 → (pthRootOfDerivZero p f) ^ p = f.
- `natDegree_pthRootOfDerivZero`: derivative f = 0 → natDegree (pthRootOfDerivZero p f) · p = natDegree f.
- `pthRootOfDerivZero_monic`: derivative f = 0 → f monic → pthRootOfDerivZero p f monic.

**Checks.**

- `pthRootOfDerivZero_X_pow`: pthRootOfDerivZero p (X ^ p) = X.
- `pthRootOfDerivZero_X_sq_add_one`: Over 𝔽₂, pthRootOfDerivZero 2 (X² + 1) = X + 1.
- `pthRootOfDerivZero_X_not_root`: Over 𝔽₂, (pthRootOfDerivZero 2 X)² ≠ X: the hypothesis f' = 0 is needed (X has derivative 1).


In particular, verify the following values and consequences.

- The three API lemmas and the unit tests; used in Algorithm SFD when gcd(f, f') = f.

*Needs:* `Polynomial.contract`, `Polynomial.expand_contract`, `polynomial_expand_eq`, `frobeniusEquiv`.

See [Shoup](#source-1) — Theorem 20.3, printed p. 527.

<a id="FF3-derivative-gcd-radical"></a>

#### f/gcd(f, f') is the radical of the part with exponents prime to p

For a monic f over a finite field of characteristic p with factorization f = ∏ fi^ei, f/gcd(f, f') = ∏_{p ∤ ei} fi (gcd the normalized gcd, the product over the distinct normalized irreducible factors whose multiplicity is prime to p).

The hypotheses are as follows. F a finite field of characteristic p f monic

A proof proceeds as follows. By the product rule, f' = Σ_j ej fj^(ej−1) fj' ∏_{k≠j} fk^ek. If p | ei the j = i term vanishes and fi^ei divides every term; if p ∤ ei then fi' ≠ 0 (fi is irreducible and not a p-th power: Theorem 20.3), deg fi' < deg fi, so fi^(ei−1) exactly divides f'. Hence the fi-adic valuation of gcd(f, f') is ei − 1 or ei according as p ∤ ei or p | ei; divide.

In particular, verify the following values and consequences.

- f = X²(X + 1) over 𝔽₂: f' = X², gcd = X², f/gcd = X + 1.

*Needs:* [The p-th root of a polynomial with zero derivative](#FF3-pth-root-of-a-polynomial-with-zero-derivative), `UniqueFactorizationMonoid.normalizedFactors`, `Polynomial.derivative`.

See [Shoup](#source-1) — Theorem 20.4, printed pp. 527-528.

<a id="FF3-square-free-decomposition"></a>

#### Square-free decomposition

A list L = ((g1, s1), …, (gt, st)) is a square-free decomposition of f ∈ F[X] (IsSquarefreeDecomposition f L) if each gi is monic, of positive degree and square-free, each si ≥ 1, the gi are pairwise coprime, the si are pairwise distinct, and f = ∏ gi^si. For monic f this holds exactly when L lists, for each multiplicity s occurring in the factorization of f, the pair (∏_{h : v_h(f) = s} h, s) once; in particular it is unique up to order.

The hypotheses are as follows. F a field f ∈ F[X] L : List (F[X] × ℕ)

A proof proceeds as follows. Define the predicate as a structure with the seven fields. Characterisation: given the fields, each irreducible factor h of f divides exactly one gi (pairwise coprime, square-free) and v_h(f) = si; conversely the canonical list satisfies the fields. Uniqueness: two decompositions have the same multiset of pairs by the characterisation, hence are permutations of each other.

Provide the following interface.

- `IsSquarefreeDecomposition.prod_eq`: IsSquarefreeDecomposition f L → ∏ (g, s) ∈ L, g ^ s = f.
- `isSquarefreeDecomposition_iff`: For monic f: IsSquarefreeDecomposition f L ↔ the multiplicities in L are distinct, positive, cover every multiplicity occurring in f, and each g equals the product of the normalized factors of f with multiplicity exactly s.
- `IsSquarefreeDecomposition.perm`: Two square-free decompositions of f are permutations of each other.
- `isSquarefreeDecomposition_one`: IsSquarefreeDecomposition 1 [].

**Checks.**

- `isSquarefreeDecomposition_X_sq_mul_X_add_one`: Over 𝔽₂, IsSquarefreeDecomposition (X²(X + 1)) [(X + 1, 1), (X, 2)].
- `isSquarefreeDecomposition_one_iff`: IsSquarefreeDecomposition 1 L ↔ L = [].
- `not_isSquarefreeDecomposition_repeated`: [(X, 1), (X, 1)] multiplies to X² but is not a square-free decomposition of X² (repeated, non-coprime entries).


In particular, verify the following values and consequences.

- The API and unit tests.

*Needs:* `Squarefree`, `IsCoprime`, `UniqueFactorizationMonoid.normalizedFactors`, `Polynomial.Monic`.

See [Shoup](#source-1) — §20.3, definition of a square-free decomposition, printed p. 527.

<a id="FF3-square-free-decomposition-algorithm"></a>

#### Algorithm SFD

squarefreeDecomposition f : List (F[X] × ℕ) is Shoup's Algorithm SFD on a monic f over the finite field F of characteristic p: with s = 1, repeat { j ← 1, g ← f/gcd(f, f'); while g ≠ 1 { f ← f/g, h ← gcd(f, g), m ← g/h; if m ≠ 1 append (m, j s); g ← h, j ← j + 1 }; if f ≠ 1 { f ← pthRootOfDerivZero p f, s ← p s } } until f = 1. It is defined by well-founded recursion on the degree (each pass removes the factors with exponent prime to p, and a p-th root divides the degree by p).

The hypotheses are as follows. F a finite field of characteristic p f ∈ F[X]; the specification is for monic f

A proof proceeds as follows. Define the inner loop by recursion on j with fuel deg f and the outer loop by recursion on natDegree f (strictly decreasing by the p-th root). Termination: the inner loop runs at most max multiplicity ≤ ℓ times per pass; there are at most log_p ℓ + 1 passes. Correctness is the node square-free-decomposition-algorithm-correct.

Provide the following interface.

- `isSquarefreeDecomposition_squarefreeDecomposition`: For monic f, IsSquarefreeDecomposition f (squarefreeDecomposition f) (the correctness theorem node).
- `squarefreeDecomposition_of_squarefree`: For monic square-free f of positive degree, squarefreeDecomposition f = [(f, 1)].
- `squarefreeDecomposition_one`: squarefreeDecomposition 1 = [].
- `length_squarefreeDecomposition_le`: (squarefreeDecomposition f).length ≤ natDegree f.

**Checks.**

- `squarefreeDecomposition_X_sq_mul_X_add_one`: Over 𝔽₂, squarefreeDecomposition (X²(X + 1)) = [(X + 1, 1), (X, 2)].
- `squarefreeDecomposition_X_sq_add_one`: Over 𝔽₂, squarefreeDecomposition (X² + 1) = [(X + 1, 2)]: the inseparable case goes through the p-th root.
- `squarefreeDecomposition_X_pow_three`: Over 𝔽₃, squarefreeDecomposition X³ = [(X, 3)]: gcd(f, f') = f at the first step.


In particular, verify the following values and consequences.

- The API and unit tests; the output on X²(X + 1) over 𝔽₂ is [(X + 1, 1), (X, 2)] in this order.

*Needs:* [Square-free decomposition](#FF3-square-free-decomposition), [f/gcd(f, f') is the radical of the part with exponents prime to p](#FF3-derivative-gcd-radical), [The p-th root of a polynomial with zero derivative](#FF3-pth-root-of-a-polynomial-with-zero-derivative), `Polynomial.derivative`.

See [Shoup](#source-1) — §20.3, Algorithm SFD, printed p. 528; [Shoup](#source-1) — Theorem 20.5 and its proof, printed pp. 528-530.

<a id="FF3-square-free-decomposition-algorithm-correct"></a>

#### Correctness of Algorithm SFD

For every monic f over a finite field, squarefreeDecomposition f is a square-free decomposition of f.

The hypotheses are as follows. F a finite field of characteristic p f monic

A proof proceeds as follows. Let S (resp. S′) index the irreducible factors fi of f with p ∤ ei (resp. p | ei). By the derivative-gcd lemma the first value of g is ∏_{i∈S} fi. Induction on j: at the start of the j-th inner iteration g = ∏_{i∈S, ei≥j} fi and f = ∏_{i∈S, ei≥j} fi^(ei−j+1) · ∏_{i∈S′} fi^ei; the appended m is ∏_{i∈S, ei=j} fi with multiplicity j s. At the end of the inner loop f = ∏_{i∈S′} fi^ei, a p-th power; its p-th root has exponents ei/p, and induction on the degree finishes, the multiplicities being multiplied by p each pass. Distinctness of the multiplicities: each appended multiplicity is the exact exponent ei of the factors of m.

In particular, verify the following values and consequences.

- Output on X²(X + 1) and X² + 1 over 𝔽₂ as in the unit tests.

*Needs:* [Algorithm SFD](#FF3-square-free-decomposition-algorithm), [Square-free decomposition](#FF3-square-free-decomposition), [f/gcd(f, f') is the radical of the part with exponents prime to p](#FF3-derivative-gcd-radical), [The p-th root of a polynomial with zero derivative](#FF3-pth-root-of-a-polynomial-with-zero-derivative).

See [Shoup](#source-1) — Theorem 20.5 and its proof, printed pp. 528-530.

### 3.2 Squarefree and hyperelliptic polynomial counts

<a id="FF3-monic-squarefree-polynomial-set"></a>

#### Monic squarefree polynomials of degree n

monicSquarefreeOfDegree F n is the finite subset of monicOfDegree F n consisting of the polynomials satisfying Mathlib Squarefree. Write s_n for its cardinality. In particular 1 is included at n=0, while 0 is never included. Squarefree is the factor-multiplicity condition, not a nonzero-derivative shortcut.

The hypotheses are as follows. F is a finite field with q = #F; n,g ∈ ℕ. All polynomials use Mathlib Polynomial F.

A proof proceeds as follows. Filter the accepted monicOfDegree census by Squarefree, using classical decidability. Membership is exactly monicity, degree n and Squarefree; over a finite field use PerfectField.separable_iff_squarefree to compare with separability.

Provide the following interface.

- `mem_monicSquarefreeOfDegree`: f ∈ monicSquarefreeOfDegree F n iff f is monic, natDegree f=n and Squarefree f.
- `monicSquarefreeOfDegree_subset`: monicSquarefreeOfDegree F n ⊆ monicOfDegree F n.
- `mem_monicSquarefreeOfDegree_iff_separable`: Membership is equivalently monic f, natDegree f=n and Polynomial.Separable f, since F is perfect.
- `monicSquarefreeOfDegree_zero`: monicSquarefreeOfDegree F 0 = {1}.
- `monicSquarefreeOfDegree_one`: monicSquarefreeOfDegree F 1 = monicOfDegree F 1.

**Checks.**

- `monicSquarefree_degree_zero`: monicSquarefreeOfDegree F 0 = {1}.
- `monicSquarefree_quadratics_f2`: monicSquarefreeOfDegree F_2 2 = {X²+X, X²+X+1}.
- `monicSquarefree_repeated_root_f2`: X²+1 ∉ monicSquarefreeOfDegree F_2 2, since X²+1=(X+1)².
- `monicSquarefree_separable`: For monic f of degree n, f ∈ monicSquarefreeOfDegree F n iff f.Separable.


In particular, verify the following values and consequences.

- The unit 1 is squarefree, so s_0=1.
- Over F_2 the monic squarefree quadratics are X²+X and X²+X+1; X²+1 is excluded.

*Needs:* [The finite set of monic polynomials of a given degree](#FF2-monic-polynomials-of-degree), `Squarefree`, `PerfectField.separable_iff_squarefree`.

See [Bergström–Faber–Payne](#source-34) — §5, arXiv v2, printed p. 8.

<a id="FF3-unique-monic-squarefree-square-decomposition"></a>

#### Unique normalized squarefree-square decomposition

For every monic f over F, there is exactly one pair (h,m) of monic polynomials such that Squarefree h and f=h m². For this pair, natDegree f = natDegree h + 2 natDegree m. This includes f=1 with (h,m)=(1,1). Scaling this theorem by the nonzero leading coefficient yields the source decomposition for nonmonic nonzero inputs; that consequence is used inside the P_g proof rather than introduced as another declaration.

The hypotheses are as follows. F is a finite field with q = #F; n,g ∈ ℕ. All polynomials use Mathlib Polynomial F.

A proof proceeds as follows. Existence starts from Mathlib exists_sq_mul_squarefree, or from the earlier canonical square-free decomposition: retain each monic irreducible once when its exponent is odd and use half its exponent in m. Normalize the square factor to be monic and absorb its unit squared into h. For monic f the remaining h is monic. Use normalizedFactors_mul and normalizedFactors_pow: for each monic irreducible π, v_π(f)=v_π(h)+2v_π(m), with v_π(h)∈{0,1} by squarefree_iff_nodup_normalizedFactors. Parity fixes both multiplicities. Products reconstruct the normalized polynomials, so both components are equal. Monic.natDegree_mul and Monic.natDegree_pow give the degree equation.

In particular, verify the following values and consequences.

- Over F_2: X²(X+1) has pair (X+1,X).
- In every characteristic (X+1)^4 has pair (1,(X+1)²).
- h and m need not be coprime: X³ has pair (X,X).

*Needs:* [Square-free decomposition](#FF3-square-free-decomposition), `exists_sq_mul_squarefree`, `UniqueFactorizationMonoid.normalizedFactors_mul`, `UniqueFactorizationMonoid.normalizedFactors_pow`, `UniqueFactorizationMonoid.squarefree_iff_nodup_normalizedFactors`, `UniqueFactorizationMonoid.prod_normalizedFactors_eq`, `Polynomial.monic_normalize`, `Polynomial.eq_of_monic_of_associated`, `Polynomial.Monic.natDegree_mul`, `Polynomial.Monic.natDegree_pow`.

See [Bergström–Faber–Payne](#source-34) — §5, arXiv v2, printed p. 8.

<a id="FF3-squarefree-square-degree-equivalence"></a>

#### Degree-indexed squarefree-square equivalence

There is an equivalence from the disjoint union over 0≤j≤⌊n/2⌋ of monicSquarefreeOfDegree F (n−2j) × monicOfDegree F j to monicOfDegree F n. It sends (j,h,m) to h m²; its inverse uses the unique normalized decomposition, with j=deg m. Each finite set is read as its subtype. The subtraction n−2j is valid because the index enforces 2j≤n.

The hypotheses are as follows. F is a finite field with q = #F; n,g ∈ ℕ. All polynomials use Mathlib Polynomial F.

A proof proceeds as follows. Use the normalized uniqueness theorem to recover h,m and j from f. Use the degree formula to show j≤n/2 and deg h=n−2j. The map and inverse cancel by normalized uniqueness; all finite indexing choices are explicit.

Provide the following interface.

- `squarefreeSquareEquiv_apply`: The image of (j,h,m) is h m².
- `squarefreeSquareEquiv_symm_degree`: If the inverse of f has index j and square factor m, then j=natDegree m.
- `squarefreeSquareEquiv_symm_squarefree`: The inverse squarefree factor h satisfies Squarefree h and natDegree h=n−2j.
- `squarefreeSquareEquiv_symm_eq`: The inverse of f is (j,h,m) iff h,m belong to the indicated factors and f=h m²; both inverse laws hold.

**Checks.**

- `squarefreeSquareEquiv_zero`: At n=0, (0,1,1) maps to 1.
- `squarefreeSquareEquiv_repeated_linear_f2`: At n=2 over F_2, (1,1,X+1) maps to X²+1.
- `squarefreeSquareEquiv_shared_factor`: At n=3 over F_2, (1,X,X) maps to X³; a false extra coprimality condition would omit this polynomial.


In particular, verify the following values and consequences.

- At n=0 the source is a singleton (j=0,h=1,m=1).
- At n=2 over F_2 the source has two squarefree quadratics at j=0 and two monic linear square factors at j=1, giving all four monic quadratics.

*Needs:* [Monic squarefree polynomials of degree n](#FF3-monic-squarefree-polynomial-set), [Unique normalized squarefree-square decomposition](#FF3-unique-monic-squarefree-square-decomposition), [The finite set of monic polynomials of a given degree](#FF2-monic-polynomials-of-degree).

See [Bergström–Faber–Payne](#source-34) — §5, arXiv v2, printed p. 8.

<a id="FF3-monic-squarefree-convolution"></a>

#### Squarefree census convolution

For every n≥0, q^n = Σ_{j=0}^{⌊n/2⌋} s_{n−2j} q^j, where s_k=#monicSquarefreeOfDegree F k. This counts all monic degree-n polynomials, not only squarefree inputs.

The hypotheses are as follows. F is a finite field with q = #F; n,g ∈ ℕ. All polynomials use Mathlib Polynomial F.

A proof proceeds as follows. Take finite cardinalities of squarefreeSquareEquiv. Cardinality of the j-th product is s_{n−2j} times #monicOfDegree F j=s_{n−2j}q^j; cardinality of the target is q^n.

In particular, verify the following values and consequences.

- For n=0: 1=s_0.
- For n=1: q=s_1.
- For n=2 over F_2: 4=2+2, including both monic squares.

*Needs:* [Degree-indexed squarefree-square equivalence](#FF3-squarefree-square-degree-equivalence), [The finite set of monic polynomials of a given degree](#FF2-monic-polynomials-of-degree).

See [Bergström–Faber–Payne](#source-34) — §5, arXiv v2, printed p. 8.

<a id="FF3-monic-squarefree-count-formula"></a>

#### Exact squarefree polynomial count

For a finite field F of cardinality q, s_0=1, s_1=q, and s_n=q^n−q^(n−1) for n≥2. In natural numbers the difference is nonnegative, since q≥2. This is valid for all finite fields, including characteristic 2; only the hyperelliptic-curve interpretation in BFP §5 uses odd q.

The hypotheses are as follows. F is a finite field with q = #F; n,g ∈ ℕ. All polynomials use Mathlib Polynomial F.

A proof proceeds as follows. The convolution at n=0,1 gives s_0=1,s_1=q. For n≥2, the j≥1 terms of the convolution are q times the convolution at n−2. Thus q^n=s_n+q·q^(n−2)=s_n+q^(n−1). Deduce the natural-number difference; q≥2 ensures no truncation changes the integer identity.

In particular, verify the following values and consequences.

- Over F_2, degrees 0 through 5 give 1,2,2,4,8,16.
- Over F_3, degrees 0 through 4 give 1,3,6,18,54.
- The generic expression q^n−q^(n−1) must not be used at n=1.

*Needs:* [Squarefree census convolution](#FF3-monic-squarefree-convolution).

See [Bergström–Faber–Payne](#source-34) — §5, arXiv v2, printed p. 8.

<a id="FF3-hyperelliptic-presentation-polynomial-set"></a>

#### Squarefree polynomials of adjacent odd and even degree

hyperellipticPolynomials F g (P_g) is the finite set of all squarefree polynomials of degree 2g+1 or 2g+2 with nonzero leading coefficient, without requiring monicity. Construct it as the image of F× times the disjoint union of the two monic squarefree sets under (a,h)↦C(a)h. Every element has a unique leading-coefficient/monic-factor representation. The definition is a polynomial presentation space, not a set of isomorphism classes of curves; no automorphism quotient is taken.

The hypotheses are as follows. F is a finite field with q = #F; n,g ∈ ℕ. All polynomials use Mathlib Polynomial F.

A proof proceeds as follows. Form the finite union of monic squarefree sets of degrees 2g+1 and 2g+2; different degrees make it disjoint. Scale by nonzero a∈F. Multiplication by a unit preserves Squarefree, degree and roots. Recover a as the leading coefficient and h as normalize f to prove uniqueness. The scalar action of F× preserves P_g; a field isomorphism transports P_g coefficientwise.

Provide the following interface.

- `mem_hyperellipticPolynomials`: f ∈ P_g iff Squarefree f and (natDegree f=2g+1 or natDegree f=2g+2).
- `hyperellipticPolynomials_leadingCoeff_ne_zero`: Every f∈P_g has nonzero leading coefficient.
- `hyperellipticPolynomials_normalize`: For f∈P_g, normalize f lies in the degree-pair monic squarefree union and f=C(leadingCoeff f)·normalize f.
- `hyperellipticPolynomials_scalar_iff`: For a≠0, C(a)f∈P_g iff f∈P_g; the action obeys the multiplication and identity laws.
- `hyperellipticPolynomials_map`: For a field isomorphism e:F≃K, coefficientwise Polynomial.map e gives a bijection P_g(F)≃P_g(K); identity and composition agree with Polynomial.map laws.

**Checks.**

- `hyperellipticPolynomials_f2_zero`: P_0(F_2)={X,X+1,X²+X,X²+X+1}.
- `hyperellipticPolynomials_nonmonic_f3`: 2X∈P_0(F_3), although 2X is not monic.
- `hyperellipticPolynomials_square_excluded`: X²∉P_0(F_3), although it has an allowed degree.
- `hyperellipticPolynomials_zero_excluded`: 0∉P_g for every g.


In particular, verify the following values and consequences.

- At g=0 over F_2, P_0 has four elements.
- At g=0 over F_3, P_0 has 18 elements; the monic-only version has 9.

*Needs:* [Monic squarefree polynomials of degree n](#FF3-monic-squarefree-polynomial-set), `Polynomial.monic_normalize`, `Squarefree`.

See [Bergström–Faber–Payne](#source-34) — §5, arXiv v2, printed p. 8.

<a id="FF3-hyperelliptic-presentation-count"></a>

#### Count of the squarefree hyperelliptic presentation space

#P_g=(q−1)(s_{2g+1}+s_{2g+2}). Consequently #P_0=q²(q−1), and #P_g=(q−1)(q^(2g+2)−q^(2g)) for g≥1. Both degrees and all nonzero leading coefficients are counted. These polynomial counts hold in characteristic 2 as well; they do not assert the same y²=f curve parametrization there.

The hypotheses are as follows. F is a finite field with q = #F; n,g ∈ ℕ. All polynomials use Mathlib Polynomial F.

A proof proceeds as follows. The unique scalar/monic representation in P_g makes its cardinality (#F×) times the sum of the two monic counts; #F×=q−1. At g=0 insert s_1=q and s_2=q²−q. At g≥1 insert the formula at both degrees: the q^(2g+1) terms cancel, leaving q^(2g+2)−q^(2g).

In particular, verify the following values and consequences.

- q=3,g=0: 18.
- q=3,g=1: 144.
- q=2,g=1: 12.
- Replacing the g=0 count by the g≥1 expression gives 16 over F_3, so the boundary test detects the error.

*Needs:* [Squarefree polynomials of adjacent odd and even degree](#FF3-hyperelliptic-presentation-polynomial-set), [Exact squarefree polynomial count](#FF3-monic-squarefree-count-formula).

See [Bergström–Faber–Payne](#source-34) — §5, arXiv v2, printed p. 8.

<a id="FF3-monic-prescribed-constant-count-boundary"></a>

#### Monic coefficient fiber including degree zero

For n≥0 and b∈F, #{f∈monicOfDegree F n : f(0)=b} equals 1 if n=0 and b=1, equals 0 if n=0 and b≠1, and equals q^(n−1) if n≥1. This is a count of all monic polynomials, not of irreducible polynomials. For BKK Lemma 3.2, use the exceptional indicator when its auxiliary factor degree m=0; the irreducible-factor count still uses the distinct earlier fixed-constant theorem and requires nonzero prescribed constant.

The hypotheses are as follows. F is a finite field with q = #F; n,g ∈ ℕ. All polynomials use Mathlib Polynomial F.

A proof proceeds as follows. At degree zero the earlier monic set is {1}. At degree n≥1, the constant coefficient is fixed and the other n−1 lower coefficients are arbitrary. Restrict the earlier coefficient-vector parametrization and take cardinalities.

In particular, verify the following values and consequences.

- Over F_3 and n=0 the count is 1 at b=1 and 0 at b=0,2.
- For n=1 each b occurs exactly once, including b=0.
- For n=2 over F_3 every constant coefficient occurs 3 times.

*Needs:* [The finite set of monic polynomials of a given degree](#FF2-monic-polynomials-of-degree), `Polynomial.degreeLTEquiv`.

See [Bary-Soroker–Koukoulopoulos–Kozma](#source-9) — Lemma 3.2 proof, arXiv v3, printed p. 20.

### 3.3 Distinct-degree factorization and irreducibility testing

<a id="FF3-gcd-with-frobenius-power"></a>

#### gcd(X^(q^k) − X, f) collects the factors of degree k

Let f be monic and square-free over the finite field F and k ≥ 1, and suppose every irreducible factor of f has degree ≥ k. Then gcd(X^(q^k) − X, f) is the product of the irreducible factors of f of degree exactly k. Moreover, for any h ≡ X^(q^k) (mod f), gcd(h − X, f) = gcd(X^(q^k) − X, f).

The hypotheses are as follows. F a finite field with q elements f monic, square-free k ≥ 1 every normalized factor of f has degree ≥ k

A proof proceeds as follows. For square-free f, gcd(g, f) is the product of the irreducible factors of f dividing g (node gcd-with-square-free-modulus, applied with g = X^(q^k) − X). An irreducible factor h of f divides X^(q^k) − X iff deg h | k (Mathlib Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X); with deg h ≥ k this means deg h = k. gcd is invariant under reducing the first argument modulo f.

In particular, verify the following values and consequences.

- f = X⁴ + X over 𝔽₂, k = 1: gcd(X² − X, f) = X² + X.

*Needs:* [gcd with a square-free modulus](#FF3-gcd-with-square-free-modulus), `Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X`.

See [Shoup](#source-1) — §20.4.1, printed pp. 530-531; [Shoup](#source-1) — Theorem 19.10, printed p. 513.

<a id="FF3-distinct-degree-factorization"></a>

#### Distinct-degree factorization

A list L = ((g1, k1), …, (gt, kt)) is a distinct-degree factorization of f (IsDistinctDegreeFactorization f L) if each gi ≠ 1 is monic and square-free, every irreducible factor of gi has degree ki, k1 < … < kt, and f = ∏ gi. For monic square-free f this holds exactly when gi = ∏ {h ∈ normalizedFactors f : deg h = ki} and the ki are the distinct degrees of the irreducible factors of f, in increasing order.

The hypotheses are as follows. F a field f ∈ F[X] L : List (F[X] × ℕ)

A proof proceeds as follows. Define the predicate as a structure. Characterisation: unique factorization, since the blocks gi have disjoint sets of irreducible factors (different degrees). natDegree gi = ki · (number of irreducible factors of gi).

Provide the following interface.

- `IsDistinctDegreeFactorization.natDegree_eq`: (g, k) ∈ L → natDegree g = k · #(normalizedFactors g).
- `isDistinctDegreeFactorization_iff`: For monic square-free f: the degrees are increasing, cover every factor degree of f, and each block is the product of the normalized factors of that degree.
- `isDistinctDegreeFactorization_one`: IsDistinctDegreeFactorization 1 [].

**Checks.**

- `isDistinctDegreeFactorization_X_pow_four_add_X`: Over 𝔽₂, X⁴ + X = X(X + 1)(X² + X + 1) has the distinct-degree factorization [(X² + X, 1), (X² + X + 1, 2)].
- `not_isDistinctDegreeFactorization_trivial`: [(X⁴ + X, 1)] is not a distinct-degree factorization: the block has a quadratic factor.
- `isDistinctDegreeFactorization_of_irreducible`: An irreducible monic f has the single block [(f, deg f)].


In particular, verify the following values and consequences.

- The API and unit tests.

*Needs:* `UniqueFactorizationMonoid.normalizedFactors`, `Squarefree`, `Polynomial.Monic`.

See [Shoup](#source-1) — §20.4.1, printed p. 530.

<a id="FF3-distinct-degree-factorization-algorithm"></a>

#### Algorithm DDF

distinctDegreeFactorization f is Shoup's Algorithm DDF on a monic square-free f: h ← X mod f, k ← 0; while f ≠ 1 { h ← h^q mod f, k ← k + 1, g ← gcd(h − X, f); if g ≠ 1 { append (g, k); f ← f/g; h ← h mod f } }. (Exercise 20.6's early exit when 2k > deg f appends the remaining f as its own block.)

The hypotheses are as follows. F a finite field with q elements f ∈ F[X]; the specification is for monic square-free f

A proof proceeds as follows. Define by recursion on k with fuel deg f: the loop runs at most deg f times since each iteration either removes a factor or increases k ≤ deg f. Correctness is the node distinct-degree-factorization-algorithm-correct.

Provide the following interface.

- `isDistinctDegreeFactorization_distinctDegreeFactorization`: For monic square-free f, IsDistinctDegreeFactorization f (distinctDegreeFactorization f) (correctness node).
- `length_distinctDegreeFactorization_le`: (distinctDegreeFactorization f).length ≤ natDegree f.
- `distinctDegreeFactorization_of_irreducible`: For monic irreducible f, distinctDegreeFactorization f = [(f, natDegree f)].
- `distinctDegreeFactorization_one`: distinctDegreeFactorization 1 = [].

**Checks.**

- `distinctDegreeFactorization_X_pow_four_add_X`: Over 𝔽₂, distinctDegreeFactorization (X⁴ + X) = [(X² + X, 1), (X² + X + 1, 2)].
- `distinctDegreeFactorization_X_sq_add_X_add_one`: Over 𝔽₂, distinctDegreeFactorization (X² + X + 1) = [(X² + X + 1, 2)].
- `distinctDegreeFactorization_X_pow_five_sub_X_sub_one`: Over 𝔽₂, distinctDegreeFactorization (X⁵ − X − 1) = [(X² + X + 1, 2), (X³ + X² + 1, 3)], agreeing with Tau Ceti's factor degrees {3, 2} of X⁵ − X − 1 modulo 2.


In particular, verify the following values and consequences.

- The unit tests; on X⁵ − X − 1 over 𝔽₂ the output [(X² + X + 1, 2), (X³ + X² + 1, 3)] reproduces Tau Ceti's factor degrees {3, 2} (Polynomial.factorDegrees_X_pow_five_sub_X_sub_one_two).

*Needs:* [Distinct-degree factorization](#FF3-distinct-degree-factorization), [gcd(X^(q^k) − X, f) collects the factors of degree k](#FF3-gcd-with-frobenius-power).

See [Shoup](#source-1) — §20.4.1, Algorithm DDF, printed p. 531; [Shoup](#source-1) — Theorem 20.6 and its proof, printed p. 531.

<a id="FF3-distinct-degree-factorization-algorithm-correct"></a>

#### Correctness of Algorithm DDF

For monic square-free f, distinctDegreeFactorization f is a distinct-degree factorization of f.

The hypotheses are as follows. F a finite field f monic and square-free

A proof proceeds as follows. Loop invariant: at the start of iteration k, f has no irreducible factor of degree < k and h ≡ X^(q^(k−1)) (mod f). By the gcd lemma the computed g is the product of the factors of degree k; removing it preserves the invariant. The loop ends when f = 1, so the blocks multiply to the input.

In particular, verify the following values and consequences.

- The unit tests of the algorithm node.

*Needs:* [Algorithm DDF](#FF3-distinct-degree-factorization-algorithm), [Distinct-degree factorization](#FF3-distinct-degree-factorization), [gcd(X^(q^k) − X, f) collects the factors of degree k](#FF3-gcd-with-frobenius-power).

See [Shoup](#source-1) — §20.4.1, printed pp. 530-531.

<a id="FF3-irreducibility-test"></a>

#### Algorithm IPT, the irreducibility test

irreducibilityTest f : Bool is Shoup's Algorithm IPT: h ← X mod f; for k = 1, …, ⌊deg f/2⌋ { h ← h^q mod f; if gcd(h − X, f) ≠ 1 return false }; return true. Mathematically it returns true iff gcd(X^(q^k) mod f − X, f) = 1 for every 1 ≤ k ≤ ⌊deg f/2⌋.

The hypotheses are as follows. F a finite field with q elements f ∈ F[X]; the specification is for monic f of positive degree

A proof proceeds as follows. Define as the decision of the finite conjunction (the loop computes the same h = X^(q^k) mod f). Correctness is the node irreducibility-test-correct.

Provide the following interface.

- `irreducibilityTest_eq_true_iff`: For monic f of positive degree, irreducibilityTest f = true ↔ Irreducible f (correctness node).
- `irreducibilityTest_of_natDegree_le_one`: natDegree f ≤ 1 → irreducibilityTest f = true (the loop is empty).
- `irreducibilityTest_eq_false_of_dvd`: If f has a monic factor g with 0 < deg g ≤ deg f / 2, then irreducibilityTest f = false (the witness found by the loop at k = deg of a smallest factor).

**Checks.**

- `irreducibilityTest_X_sq_add_X_add_one`: Over 𝔽₂, irreducibilityTest (X² + X + 1) = true.
- `irreducibilityTest_X_sq_add_one`: Over 𝔽₂, irreducibilityTest (X² + 1) = false, since X² + 1 = (X + 1)².
- `irreducibilityTest_X_pow_five_sub_X_sub_one`: Over 𝔽₅, irreducibilityTest (X⁵ − X − 1) = true, agreeing with Tau Ceti's Polynomial.irreducible_X_pow_five_sub_X_sub_one_zmod_five.


In particular, verify the following values and consequences.

- The unit tests; on X⁵ − X − 1 over 𝔽₅ it returns true, the statement Tau Ceti proves by hand (Polynomial.irreducible_X_pow_five_sub_X_sub_one_zmod_five).

*Needs:* [gcd(X^(q^k) − X, f) collects the factors of degree k](#FF3-gcd-with-frobenius-power).

See [Shoup](#source-1) — §20.1, Algorithm IPT, printed pp. 522-523; [Shoup](#source-1) — Theorem 20.1, printed p. 523.

<a id="FF3-irreducibility-test-correct"></a>

#### Correctness of Algorithm IPT

For monic f of positive degree over a finite field, irreducibilityTest f = true ↔ Irreducible f.

The hypotheses are as follows. F a finite field f monic, 0 < deg f

A proof proceeds as follows. If f is reducible, it has an irreducible factor g of minimal degree k ≤ deg f/2; then g | X^(q^k) − X, so gcd ≠ 1. If f is irreducible of degree ℓ and 1 ≤ k ≤ ℓ/2, then ℓ ∤ k, so f ∤ X^(q^k) − X (Mathlib Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X) and gcd = 1 since f is irreducible.

In particular, verify the following values and consequences.

- The unit tests of the construction.

*Needs:* [Algorithm IPT, the irreducibility test](#FF3-irreducibility-test), [gcd(X^(q^k) − X, f) collects the factors of degree k](#FF3-gcd-with-frobenius-power), `Irreducible.natDegree_dvd_iff_dvd_X_pow_card_pow_sub_X`.

See [Shoup](#source-1) — §20.1, Algorithm IPT, printed pp. 522-523.

<a id="FF3-rabin-certificate-generation"></a>

#### Generating a Rabin irreducibility certificate

rabinCertificateOf f produces Layer 0's Rabin certificate for f: for each prime s | deg f it runs the extended Euclidean algorithm on X^(q^(deg f/s)) mod f − X and f, and records the Bézout pair (u_s, v_s); for s not a prime divisor it records (0, 0).

The hypotheses are as follows. F a finite field with q elements f ∈ F[X]

A proof proceeds as follows. Compute X^(q^i) mod f for i = 1, …, deg f by successive q-th powering; read off i = deg f/s. Extended Euclid (Shoup Theorem 17.4) gives u, v with u·(X^(q^(ℓ/s)) mod f − X) + v f = gcd, which is 1 when f is irreducible. Normalize the raw EuclideanDomain Bézout pair by multiplying both entries by C((gcd a f).leadingCoeff⁻¹). Mathlib’s raw Euclidean gcd can be a constant other than 1 even on coprime inputs; Layer 0’s corrected certificate constructor uses this normalization.

Provide the following interface.

- `rabinCertificateOf_check`: For monic irreducible f, (rabinCertificateOf f).check f = true (correctness node).
- `rabinCertificateOf_bezout_of_not_prime`: For s not prime, (rabinCertificateOf f).bezout s = (0, 0).
- `rabinCertificateOf_bezout`: For monic irreducible f and a prime s | deg f, the pair (u, v) = (rabinCertificateOf f).bezout s satisfies u (X^(q^(deg f/s)) mod f − X) + v f = 1.

**Checks.**

- `rabinCertificateOf_X_sq_add_X_add_one`: Over 𝔽₂, the certificate generated for X² + X + 1 checks.
- `rabinCertificateOf_reducible_fails`: Over 𝔽₂, no Rabin certificate checks for the reducible X² + 1.
- `rabinCertificateOf_linear`: A monic linear polynomial has no prime divisor of its degree; its certificate is empty and checks.


In particular, verify the following values and consequences.

- For irreducible monic f the certificate checks (node rabin-certificate-generation-correct).

*Needs:* [Rabin irreducibility certificates and their checker](#FF0-rabin-irreducibility-certificate), `EuclideanDomain.gcd_eq_gcd_ab`, `Nat.primeFactors`.

See [Shoup](#source-1) — Exercise 20.2, printed pp. 524-525.

<a id="FF3-rabin-certificate-generation-correct"></a>

#### The generated Rabin certificate checks

For monic irreducible f over a finite field, (rabinCertificateOf f).check f = true.

The hypotheses are as follows. F a finite field f monic, irreducible

A proof proceeds as follows. X^(q^ℓ) ≡ X (mod f) and gcd(X^(q^(ℓ/s)) − X, f) = 1 for primes s | ℓ by Rabin's criterion (Layer 0). The extended Euclidean algorithm returns Bézout coefficients for gcd = 1 (Mathlib EuclideanDomain.gcd_eq_gcd_ab, normalized). Normalize the raw EuclideanDomain Bézout pair by multiplying both entries by C((gcd a f).leadingCoeff⁻¹). Mathlib’s raw Euclidean gcd can be a constant other than 1 even on coprime inputs; Layer 0’s corrected certificate constructor uses this normalization.

In particular, verify the following values and consequences.

- X² + X + 1 over 𝔽₂: s = 2, X² mod f − X = 1, Bézout pair (1, 0).

*Needs:* [Generating a Rabin irreducibility certificate](#FF3-rabin-certificate-generation), [Rabin's irreducibility criterion](#FF0-rabin-irreducibility-criterion), [Rabin irreducibility certificates and their checker](#FF0-rabin-irreducibility-certificate), `EuclideanDomain.gcd_eq_gcd_ab`.

See [Shoup](#source-1) — Exercise 20.2, printed pp. 524-525.

### 3.4 Equal-degree factorization and the Cantor–Zassenhaus algorithm

<a id="FF3-gcd-with-square-free-modulus"></a>

#### gcd with a square-free modulus

For f monic and square-free over a field and any g, gcd(g mod f, f) = ∏ {h ∈ normalizedFactors f : h | g} (normalized gcd).

The hypotheses are as follows. F a field f monic, square-free g ∈ F[X]

A proof proceeds as follows. gcd(g mod f, f) = gcd(g, f) (Euclid). f = ∏ of its distinct normalized irreducible factors (square-free); gcd with g keeps exactly those dividing g, each to the first power (unique factorization).

In particular, verify the following values and consequences.

- f = X² + X over 𝔽₂, g = X: the gcd is X.

*Needs:* `UniqueFactorizationMonoid.normalizedFactors`, `UniqueFactorizationMonoid.squarefree_iff_nodup_normalizedFactors`, `UniqueFactorizationMonoid.prod_normalizedFactors`, `Polynomial.modByMonic_add_div`.

See [Shoup](#source-1) — §20.4.2, (20.4) and the splitting argument, printed pp. 532-533.

<a id="FF3-equal-degree-splitting-polynomial"></a>

#### The splitting polynomial M_k

For a finite field F with q elements and k ≥ 1, edfSplittingPolynomial F k = M_k is Σ_{j < wk} X^(2^j) when q = 2^w (so that M_k(α) = Tr_{E/𝔽₂}(α) for α in a field E of degree k over F) and X^((q^k − 1)/2) − 1 when q is odd (so that M_k(α) = χ_E(α) − 1 for α ∈ E^×, χ_E the quadratic character of E).

The hypotheses are as follows. F a finite field with q elements k : ℕ

A proof proceeds as follows. Define by cases on ringChar F = 2; wk = log₂(q^k). q even: α ↦ Σ_{j<wk} α^(2^j) is the trace E → 𝔽₂, a surjective 𝔽₂-linear map (Mathlib Algebra.trace_surjective), so its values are 0 or 1 and each is taken on q^k/2 elements. q odd: E^× is cyclic of even order q^k − 1, so α^((q^k−1)/2) = ±1 (Mathlib FiniteField.pow_dichotomy), each value on (q^k − 1)/2 elements; M_k(0) = −1.

Provide the following interface.

- `edfSplittingPolynomial_of_ringChar_ne_two`: ringChar F ≠ 2 → edfSplittingPolynomial F k = X^((q^k − 1)/2) − 1.
- `card_aeval_edfSplittingPolynomial_eq_zero`: For E ⊇ F of degree k ≥ 1: #{α ∈ E : M_k(α) = 0} = q^k/2 if q is even and (q^k − 1)/2 if q is odd.
- `aeval_edfSplittingPolynomial_sq_eq_self`: For q even and E of degree k: M_k(α)² = M_k(α), i.e. M_k(α) ∈ 𝔽₂.

**Checks.**

- `edfSplittingPolynomial_zmod_three_one`: edfSplittingPolynomial (ZMod 3) 1 = X − 1.
- `edfSplittingPolynomial_zmod_two_two`: edfSplittingPolynomial (ZMod 2) 2 = X + X², the trace of 𝔽₄/𝔽₂.
- `aeval_edfSplittingPolynomial_eq_quadraticChar`: For q odd and a ∈ F^×, M_1(a) + 1 = quadraticChar F a (cast to F): agreement with Mathlib's quadratic character.


In particular, verify the following values and consequences.

- The API and unit tests.

*Needs:* `Algebra.trace_surjective`, `FiniteField.pow_dichotomy`, `quadraticChar_eq_pow_of_char_ne_two'`.

See [Shoup](#source-1) — §20.4.2, (20.4) and the splitting argument, printed pp. 532-533; [Shoup](#source-1) — §20.4.2, (20.5) and the failure probability, printed pp. 535-536.

<a id="FF3-zeros-of-the-splitting-polynomial"></a>

#### The number of zeros of M_k in a field of degree k

For a finite field E ⊇ F with [E : F] = k ≥ 1: #{α ∈ E : M_k(α) = 0} = q^k/2 if q is even and (q^k − 1)/2 if q is odd.

The hypotheses are as follows. E a finite field extension of F of degree k ≥ 1

A proof proceeds as follows. q even: M_k(α) = Tr_{E/𝔽₂}(α); the trace is surjective and 𝔽₂-linear, so its kernel has index 2. q odd: the squares of E^× form the subgroup of index 2, which is the kernel of α ↦ α^((q^k−1)/2) (Euler's criterion, Mathlib FiniteField.isSquare_iff / pow_dichotomy); 0 is not a zero of M_k.

In particular, verify the following values and consequences.

- q = 3, k = 1: the zeros of X − 1 in 𝔽₃ are {1}, and (3 − 1)/2 = 1.

*Needs:* [The splitting polynomial M_k](#FF3-equal-degree-splitting-polynomial), `Algebra.trace_surjective`, `FiniteField.isSquare_iff`, `FiniteField.pow_dichotomy`.

See [Shoup](#source-1) — §20.4.2, (20.4) and the splitting argument, printed pp. 532-533; [Shoup](#source-1) — §20.4.2, (20.5) and the failure probability, printed pp. 535-536.

<a id="FF3-equal-degree-pair-separation"></a>

#### The pair-separation probability of equal-degree splitting

Let f be monic and square-free with all irreducible factors of degree k, and f1 ≠ f2 two of them. For a uniform in F[X]/(f) (uniform coefficient vector of length deg f), the probability that f1 | M_k(a) ↔ f2 | M_k(a) (the pair is not separated) is exactly 1/2 for q even and (1 + q^(−2k))/2 ≤ 5/9 for q odd.

The hypotheses are as follows. F a finite field with q elements f monic, square-free, every irreducible factor of degree k f1 ≠ f2 irreducible factors of f

A proof proceeds as follows. By the Chinese remainder theorem (Mathlib Ideal.quotientInfRingEquivPiQuotient), a ↦ (a mod f1, a mod f2, a mod rest) is a bijection, so (a mod f1, a mod f2) is uniform on E1 × E2 with Ei = F[X]/(fi) of degree k. fi | M_k(a) iff M_k(a mod fi) = 0 in Ei; count with the zeros lemma: for q even both events have probability 1/2 and are independent; for q odd P = z² + (1 − z)² with z = (q^k − 1)/(2q^k), which equals (1 + q^(−2k))/2. (1 + q^(−2k))/2 ≤ (1 + 1/9)/2 = 5/9 since q^k ≥ 3.

In particular, verify the following values and consequences.

- q = 3, k = 1: (1 + 1/9)/2 = 5/9, the worst case.
- q = 2, k = 1, f = X² + X: 2 of the 4 residues do not separate.

*Needs:* [The number of zeros of M_k in a field of degree k](#FF3-zeros-of-the-splitting-polynomial), `Ideal.quotientInfRingEquivPiQuotient`, `Polynomial.degreeLTEquiv`.

See [Shoup](#source-1) — §20.4.2, printed pp. 532-533; [Shoup](#source-1) — §20.4.2, (20.5) and the failure probability, printed pp. 535-536; [Shoup](#source-1) — §20.4.2, printed p. 532.

<a id="FF3-equal-degree-refinement-step"></a>

#### One refinement step of equal-degree splitting

For k ≥ 1, a ∈ F[X] and a finite set H of polynomials, edfRefine k a H replaces every h ∈ H by the pair {d, h/d} where d = gcd(M_k(a) mod h, h), unless d = 1 or d = h, in which case h is kept.

The hypotheses are as follows. F a finite field k : ℕ a : F[X] H : Finset F[X]

A proof proceeds as follows. Define as a union over H of the one- or two-element sets. If f is monic square-free and the elements of H are monic, pairwise coprime and multiply to f, the same holds after the step (d and h/d are monic coprime factors of the square-free h).

Provide the following interface.

- `edfRefine`: edfRefine k a H : Finset F[X], the refined set of factors.
- `prod_edfRefine`: If f is monic square-free and H is a set of monic factors with ∏ H = f, then ∏ (edfRefine k a H) = f and its elements are monic.
- `card_edfRefine_le`: (edfRefine k a H).card ≤ 2 · H.card.

**Checks.**

- `edfRefine_X_sq_add_X`: Over 𝔽₂, edfRefine 1 X {X² + X} = {X, X + 1} (M₁ = X and gcd(X, X² + X) = X).
- `edfRefine_empty`: edfRefine k a ∅ = ∅.
- `edfRefine_trivial`: If f | M_k(a) then edfRefine k a {f} = {f}: a residue with M_k(a) ≡ 0 does not split.


In particular, verify the following values and consequences.

- The unit tests; used by Algorithm EDF and Algorithm B2.

*Needs:* [The splitting polynomial M_k](#FF3-equal-degree-splitting-polynomial), [gcd with a square-free modulus](#FF3-gcd-with-square-free-modulus).

See [Shoup](#source-1) — §20.4.2, Algorithm EDF, printed p. 533.

<a id="FF3-equal-degree-factorization-algorithm"></a>

#### Algorithm EDF (equal-degree factorization) as a round distribution

For f monic square-free with all irreducible factors of degree k, equalDegreeFactorization f k n : PMF (Finset F[X]) is the distribution of the set of factors after n rounds of Shoup's Algorithm EDF, starting from {f}; each round draws a uniform coefficient vector v : Fin (deg f) → F, i.e. a uniform a ∈ F[X]/(f), and applies edfRefine k a. The algorithm stops when the set has r = deg f/k elements; 'Las Vegas' means every outcome is correct, only the number of rounds is random.

The hypotheses are as follows. F a finite field with q elements f ∈ F[X] k, n : ℕ The EDF specification is for 0<deg f and k≥1; f=1 is handled by the surrounding full factorization algorithm, not by the singleton-initialized EDF round law.

A proof proceeds as follows. Define by recursion on n with PMF.pure, PMF.bind, PMF.map and PMF.uniformOfFintype (Mathlib's discrete probability monad). Using one a per round is Shoup's model: by the Chinese remainder theorem the residues a mod h, h ∈ H, are independent and uniform (Shoup p. 532).

Provide the following interface.

- `equalDegreeFactorization_zero`: equalDegreeFactorization f k 0 = PMF.pure {f}.
- `equalDegreeFactorization_support`: Las Vegas correctness (theorem node equal-degree-factorization-correct).
- `equalDegreeFactorization_failure_le`: Failure bound (theorem node equal-degree-factorization-failure-bound).
- `tsum_equalDegreeFactorization_unfinished_le`: Expected number of rounds for q even (theorem node equal-degree-factorization-expected-rounds).

**Checks.**

- `equalDegreeFactorization_irreducible`: An irreducible monic f of degree k is returned unchanged by every number of rounds.
- `equalDegreeFactorization_X_sq_add_X`: Over 𝔽₂, k = 1: after one round the outcome {X, X + 1} has probability 1/2.
- `equalDegreeFactorization_card_le`: For monic square-free f of positive degree, k≥1, and every factor of degree k, every outcome has at most deg f/k elements. The positive-degree guard excludes the initial singleton {1}, which would have 1>0 elements.


In particular, verify the following values and consequences.

- Correctness, failure bound and expected rounds are theorem nodes; the unit tests are those of the refinement step.

*Needs:* [One refinement step of equal-degree splitting](#FF3-equal-degree-refinement-step), `PMF.pure`, `PMF.bind`, `PMF.map`, `PMF.uniformOfFintype`, `Polynomial.degreeLTEquiv`.

See [Shoup](#source-1) — §20.4.2, Algorithm EDF, printed p. 533; [Shoup](#source-1) — §20.4.2, printed p. 532.

<a id="FF3-equal-degree-factorization-correct"></a>

#### Las Vegas correctness of Algorithm EDF

Let f be monic and square-free with all irreducible factors of degree k. For every n and every H in the support of equalDegreeFactorization f k n: ∏_{h∈H} h = f, every h ∈ H is monic, and if #H = deg f/k then H is the set of irreducible factors of f (H.val = normalizedFactors f).

The hypotheses are as follows. F a finite field f monic, square-free, all irreducible factors of degree k The EDF specification is for 0<deg f and k≥1; f=1 is handled by the surrounding full factorization algorithm, not by the singleton-initialized EDF round law.

A proof proceeds as follows. Invariant: the elements of H are monic, pairwise coprime, and multiply to f; it holds for {f} and is preserved by edfRefine (gcd-with-square-free-modulus). Each element of H is a nonempty product of distinct irreducible factors of degree k; with r = deg f/k elements each is a single irreducible factor.

In particular, verify the following values and consequences.

- Every outcome for X² + X over 𝔽₂ is {X² + X} or {X, X + 1}.

*Needs:* [Algorithm EDF (equal-degree factorization) as a round distribution](#FF3-equal-degree-factorization-algorithm), [One refinement step of equal-degree splitting](#FF3-equal-degree-refinement-step), [gcd with a square-free modulus](#FF3-gcd-with-square-free-modulus).

See [Shoup](#source-1) — §20.4.2, Algorithm EDF, printed p. 533; [Shoup](#source-1) — §20.4.2, (20.4) and the splitting argument, printed pp. 532-533.

<a id="FF3-equal-degree-factorization-failure-bound"></a>

#### Failure probability of Algorithm EDF

With f as above and r = deg f/k, the probability that equalDegreeFactorization f k n has fewer than r elements is at most C(r, 2) · (5/9)^n; for q even at most C(r, 2) · 2^(−n).

The hypotheses are as follows. F a finite field f monic, square-free, all irreducible factors of degree k The EDF specification is for 0<deg f and k≥1; f=1 is handled by the surrounding full factorization algorithm, not by the singleton-initialized EDF round law.

A proof proceeds as follows. The outcome is incomplete iff some pair fi ≠ fj of irreducible factors has not been separated. For a fixed pair, each round separates it with probability ≥ 4/9 (≥ 1/2 for q even) independently of the past, by the pair-separation theorem applied to the current factor containing both; so P[not separated after n rounds] ≤ (5/9)^n. Union bound over the C(r, 2) pairs.

In particular, verify the following values and consequences.

- It tends to 0: the algorithm halts with probability 1.

*Needs:* [Algorithm EDF (equal-degree factorization) as a round distribution](#FF3-equal-degree-factorization-algorithm), [The pair-separation probability of equal-degree splitting](#FF3-equal-degree-pair-separation), [Las Vegas correctness of Algorithm EDF](#FF3-equal-degree-factorization-correct), `PMF.toOuterMeasure`.

See [Shoup](#source-1) — Theorem 20.7 and its proof, printed pp. 534-535; [Shoup](#source-1) — Theorem 20.8, printed p. 536.

<a id="FF3-equal-degree-factorization-expected-rounds"></a>

#### Expected number of rounds of Algorithm EDF

With f as above and r = deg f/k: for q even, Σ_{n≥0} P[unfinished after n rounds] ≤ 2 log₂ r + 2; for q odd, ≤ 2 log_{9/5} r + 4. The sum is the expected number of rounds E[L] (Shoup's L, the number of loop iterations).

The hypotheses are as follows. F a finite field f monic, square-free, all irreducible factors of degree k The EDF specification is for 0<deg f and k≥1; f=1 is handled by the surrounding full factorization algorithm, not by the singleton-initialized EDF round law.

A proof proceeds as follows. E[L] = Σ_{n≥1} P[L ≥ n] = Σ_{n≥0} P[unfinished after n rounds]. q even: P[L ≥ n] ≤ min(1, r² 2^(−n)); split the sum at n = 2 log₂ r (Shoup's computation). q odd: P[unfinished after n] ≤ min(1, C(r, 2)(5/9)^n); split at m = ⌈log_{9/5} C(r, 2)⌉: the sum is at most m + 1/(1 − 5/9) ≤ 2 log_{9/5} r + 1 + 9/4.

In particular, verify the following values and consequences.

- r = 1: the sum is 0.

*Needs:* [Failure probability of Algorithm EDF](#FF3-equal-degree-factorization-failure-bound).

See [Shoup](#source-1) — Theorem 20.7 and its proof, printed pp. 534-535; [Shoup](#source-1) — Theorem 20.8, printed p. 536.

<a id="FF3-cantor-zassenhaus-algorithm"></a>

#### The Cantor–Zassenhaus algorithm

cantorZassenhaus f n : PMF (Option (Multiset F[X])) runs Algorithm SFD on monic f, Algorithm DDF on each square-free part g_i, and n rounds of Algorithm EDF on each block (g_ij, k_ij); the outcome is some m, m the multiset of irreducible factors with multiplicity (each factor of g_i repeated s_i times), when every block is finished, and none otherwise.

The hypotheses are as follows. F a finite field with q elements f ∈ F[X]; the specification is for monic f n : ℕ, the number of EDF rounds per block

A proof proceeds as follows. Compose the deterministic stages with the product of the EDF round distributions of the blocks (PMF.bind), and map the result. Blocks with a single factor finish at n = 0.

Provide the following interface.

- `cantorZassenhaus_support`: Every completed outcome equals normalizedFactors f (theorem node cantor-zassenhaus-correct).
- `cantorZassenhaus_none_le`: P[none] ≤ (deg f)² (5/9)^n (theorem node cantor-zassenhaus-failure-bound).
- `cantorZassenhaus_zero_of_irreducible`: For monic irreducible f, cantorZassenhaus f 0 = pure (some {f}).

**Checks.**

- `cantorZassenhaus_one`: cantorZassenhaus 1 n = pure (some 0).
- `cantorZassenhaus_X_sq_mul_X_add_one`: Over 𝔽₂, cantorZassenhaus (X²(X + 1)) n = pure (some {X, X, X + 1}) for every n (all blocks are single factors).
- `cantorZassenhaus_not_product_only`: Over 𝔽₂, some {X² + X} is never an outcome for X² + X: an unsplit product is never reported as a factorization.


In particular, verify the following values and consequences.

- Correctness and failure bound are theorem nodes; the unit tests below.

*Needs:* [Algorithm SFD](#FF3-square-free-decomposition-algorithm), [Algorithm DDF](#FF3-distinct-degree-factorization-algorithm), [Algorithm EDF (equal-degree factorization) as a round distribution](#FF3-equal-degree-factorization-algorithm), `PMF.bind`, `PMF.map`.

See [Shoup](#source-1) — §20.4, printed p. 530; [Shoup](#source-1) — §20.4.3, Theorem 20.9, printed pp. 536-537.

<a id="FF3-cantor-zassenhaus-correct"></a>

#### Las Vegas correctness of the Cantor–Zassenhaus algorithm

For monic f and every n: if some m lies in the support of cantorZassenhaus f n then m = normalizedFactors f.

The hypotheses are as follows. F a finite field f monic

A proof proceeds as follows. SFD is correct (square-free parts with exact multiplicities); DDF is correct on each part; a completed EDF outcome on each block is its set of irreducible factors. Unique factorization: the multiset assembled from the blocks, with multiplicities s_i, is normalizedFactors f.

In particular, verify the following values and consequences.

- X⁵ − X − 1 over 𝔽₂: every completed outcome is {X² + X + 1, X³ + X² + 1}.

*Needs:* [The Cantor–Zassenhaus algorithm](#FF3-cantor-zassenhaus-algorithm), [Correctness of Algorithm SFD](#FF3-square-free-decomposition-algorithm-correct), [Correctness of Algorithm DDF](#FF3-distinct-degree-factorization-algorithm-correct), [Las Vegas correctness of Algorithm EDF](#FF3-equal-degree-factorization-correct).

See [Shoup](#source-1) — §20.4.3, Theorem 20.9, printed pp. 536-537.

<a id="FF3-cantor-zassenhaus-failure-bound"></a>

#### Failure probability of the Cantor–Zassenhaus algorithm

For monic f of degree ℓ, P[cantorZassenhaus f n = none] ≤ ℓ² · (5/9)^n.

The hypotheses are as follows. F a finite field f monic of degree ℓ

A proof proceeds as follows. Union bound over the blocks: block (g, k) fails with probability ≤ C(r_g, 2)(5/9)^n and Σ C(r_g, 2) ≤ ℓ².

In particular, verify the following values and consequences.

- For irreducible f the probability is 0.

*Needs:* [The Cantor–Zassenhaus algorithm](#FF3-cantor-zassenhaus-algorithm), [Failure probability of Algorithm EDF](#FF3-equal-degree-factorization-failure-bound).

See [Shoup](#source-1) — §20.4.3, Theorem 20.9, printed pp. 536-537.

### 3.5 Berlekamp's algorithm

<a id="FF3-berlekamp-subalgebra"></a>

#### The Berlekamp subalgebra

For f ∈ F[X] over a finite field F with q elements, berlekampSubalgebra f ⊆ F[X]/(f) is the F-subalgebra B = {α : α^q = α}, the equalizer of the q-power Frobenius F-algebra endomorphism (Mathlib FiniteField.frobeniusAlgHom) and the identity. For f monic square-free with r irreducible factors, the Chinese remainder isomorphism identifies B with F^r.

The hypotheses are as follows. F a finite field with q elements f ∈ F[X] (the quotient is Mathlib's AdjoinRoot f)

A proof proceeds as follows. Define as AlgHom.equalizer (frobeniusAlgHom F (AdjoinRoot f)) (AlgHom.id). It contains the image of F (elements of F satisfy c^q = c, FiniteField.pow_card).

Provide the following interface.

- `mem_berlekampSubalgebra`: α ∈ berlekampSubalgebra f ↔ α ^ q = α.
- `algebraMap_mem_berlekampSubalgebra`: algebraMap F (AdjoinRoot f) c ∈ berlekampSubalgebra f.
- `finrank_berlekampSubalgebra`: For monic square-free f, finrank F B = #normalizedFactors f (theorem node berlekamp-dimension-theorem).

**Checks.**

- `finrank_berlekampSubalgebra_X_sq_add_X`: Over 𝔽₂, finrank of B for X² + X = X(X + 1) is 2.
- `berlekampSubalgebra_eq_bot_of_irreducible`: For irreducible f, berlekampSubalgebra f = ⊥ (the image of F).
- `finrank_berlekampSubalgebra_X_sq`: Over 𝔽₂, B for X² has dimension 1 although X² has two irreducible factors counted with multiplicity: square-freeness is needed.


In particular, verify the following values and consequences.

- The API and unit tests; dimension theorem is a theorem node.

*Needs:* `FiniteField.frobeniusAlgHom`, `AlgHom.equalizer`, `FiniteField.pow_card`.

See [Shoup](#source-1) — §20.5, printed pp. 538-539.

<a id="FF3-berlekamp-dimension-theorem"></a>

#### Berlekamp's theorem: dim B = r

For f monic and square-free over a finite field F, the Berlekamp subalgebra of F[X]/(f) has dimension over F equal to the number r of irreducible factors of f.

The hypotheses are as follows. F a finite field f monic, square-free

A proof proceeds as follows. Chinese remainder theorem: F[X]/(f) ≅ ∏ F[X]/(f_i) as F-algebras, compatible with the Frobenius endomorphisms (Mathlib Ideal.quotientInfRingEquivPiQuotient; the ideals (f_i) are pairwise coprime). In each field E_i = F[X]/(f_i), α^q = α iff α ∈ F (the roots of X^q − X in E_i are the q elements of F, FiniteField.roots_X_pow_card_sub_X). Hence B ≅ F^r and finrank F B = r.

In particular, verify the following values and consequences.

- X² + X over 𝔽₂: r = 2.

*Needs:* [The Berlekamp subalgebra](#FF3-berlekamp-subalgebra), `Ideal.quotientInfRingEquivPiQuotient`, `FiniteField.roots_X_pow_card_sub_X`.

See [Shoup](#source-1) — §20.5, printed p. 539.

<a id="FF3-berlekamp-irreducibility-criterion"></a>

#### Berlekamp's irreducibility criterion

A monic square-free f of positive degree over a finite field is irreducible iff its Berlekamp subalgebra has dimension 1.

The hypotheses are as follows. F a finite field f monic, square-free, 0 < deg f

A proof proceeds as follows. By the dimension theorem, dim B = r; r = 1 iff f is irreducible (f monic of positive degree).

In particular, verify the following values and consequences.

- X² + X + 1 over 𝔽₂: dim B = 1.

*Needs:* [Berlekamp's theorem: dim B = r](#FF3-berlekamp-dimension-theorem).

See [Shoup](#source-1) — Exercise 20.12, printed p. 543.

<a id="FF3-berlekamp-matrix"></a>

#### The Berlekamp matrix

For f of degree ℓ over F with q elements, berlekampMatrix f is the ℓ × ℓ matrix Q over F whose i-th row (0 ≤ i < ℓ) is the coefficient vector of X^(q i) mod f minus the i-th unit vector: the matrix of ρ(α) = α^q − α on F[X]/(f) in the basis 1, X, …, X^(ℓ−1), acting on row vectors.

The hypotheses are as follows. F a finite field with q elements f ∈ F[X] of degree ℓ The interpretation as the matrix on the quotient in the displayed power basis assumes f is monic; modByMonic is not a remainder algorithm for arbitrary nonmonic f.

A proof proceeds as follows. Define entrywise: Q i j = coeff (X^(q i) mod f) j − [i = j]. For monic f the row vector v satisfies v Q = 0 iff the element with coordinates v lies in B (ρ is F-linear since the Frobenius is, and (X^i)^q = (X^q)^i).

Provide the following interface.

- `rank_berlekampMatrix`: For monic square-free f: rank Q = ℓ − r (theorem node berlekamp-matrix-rank).
- `vecMul_berlekampMatrix_eq_zero_iff`: For monic f: v Q = 0 ↔ the class of Σ v_i X^i lies in berlekampSubalgebra f.
- `berlekampMatrix_apply`: berlekampMatrix f i j = coeff (X^(q i) mod f) j − (if i = j then 1 else 0).

**Checks.**

- `berlekampMatrix_X_sq_add_X`: Over 𝔽₂, berlekampMatrix (X² + X) = 0.
- `rank_berlekampMatrix_X_sq_add_X_add_one`: Over 𝔽₂, the Berlekamp matrix of X² + X + 1 has rank 1.
- `rank_berlekampMatrix_X_sq`: Over 𝔽₂, the Berlekamp matrix of X² has rank 1, not 2 − 2 = 0: the rank formula needs square-freeness.


In particular, verify the following values and consequences.

- The API and unit tests.

*Needs:* [The Berlekamp subalgebra](#FF3-berlekamp-subalgebra), `Polynomial.modByMonic`, `Matrix.vecMul`, `Matrix.rank`.

See [Shoup](#source-1) — §20.5, Stage 1 and Theorem 20.10, printed pp. 539-540.

<a id="FF3-berlekamp-matrix-rank"></a>

#### The rank of the Berlekamp matrix

For f monic and square-free of degree ℓ with r irreducible factors, rank(berlekampMatrix f) = ℓ − r, and the row null space of Q corresponds to B under the coordinate map.

The hypotheses are as follows. F a finite field f monic, square-free

A proof proceeds as follows. Row null space of Q = coordinates of ker ρ = B (vecMul lemma); dim = r by Berlekamp's theorem. Rank–nullity for the linear map v ↦ v Q on F^ℓ (Mathlib Matrix.rank, rank of the transpose).

In particular, verify the following values and consequences.

- X² + X + 1 over 𝔽₂: rank 1 = 2 − 1.

*Needs:* [The Berlekamp matrix](#FF3-berlekamp-matrix), [Berlekamp's theorem: dim B = r](#FF3-berlekamp-dimension-theorem), `Matrix.rank`.

See [Shoup](#source-1) — §20.5, Stage 1 and Theorem 20.10, printed pp. 539-540.

<a id="FF3-berlekamp-splitting-algorithm"></a>

#### Algorithm B2 (splitting with a basis of B) as a round distribution

Given monic f and a basis β = (β_i)_{i∈ι} of the Berlekamp subalgebra of F[X]/(f), berlekampSplit hf β n : PMF (Finset F[X]) is the distribution of the set of factors after n rounds: each round draws c : ι → F uniformly, forms g = rep(Σ c_i β_i) (the representative of degree < deg f, Mathlib AdjoinRoot.modByMonicHom) and applies edfRefine 1 g (splitting polynomial M_1).

The hypotheses are as follows. F a finite field f monic β a basis of berlekampSubalgebra f n : ℕ Algorithm B2’s specification assumes square-free f of positive degree. The constant 1 is handled by the surrounding full factorization algorithm.

A proof proceeds as follows. Define by recursion on n as for Algorithm EDF. By the Chinese remainder theorem, a uniform element of B has independent uniform components in F modulo the factors (Shoup p. 541).

Provide the following interface.

- `berlekampSplit_support`: Las Vegas correctness (theorem node berlekamp-splitting-correct).
- `berlekampSplit_failure_le`: P[fewer than #ι factors after n rounds] ≤ C(#ι, 2)(5/9)^n (theorem node).
- `berlekampSplit_zero`: berlekampSplit hf β 0 = pure {f}.

**Checks.**

- `berlekampSplit_irreducible`: For irreducible f with a one-element basis, berlekampSplit hf β n = pure {f}.
- `berlekampSplit_support_card_le`: For monic square-free f of positive degree, every outcome has at most #ι=dim B elements. At f=1 the initial singleton {1} would violate 1≤0.
- `berlekampSplit_X_sq_add_X`: Over 𝔽₂, for X² + X and any basis of the two-dimensional B, one round gives {X, X + 1} with probability 1/2.


In particular, verify the following values and consequences.

- The unit tests; correctness and failure bound are theorem nodes.

*Needs:* [The Berlekamp subalgebra](#FF3-berlekamp-subalgebra), [One refinement step of equal-degree splitting](#FF3-equal-degree-refinement-step), `AdjoinRoot.modByMonicHom`, `PMF.uniformOfFintype`, `PMF.bind`, `PMF.map`.

See [Shoup](#source-1) — §20.5, Algorithm B2, printed p. 541; [Shoup](#source-1) — §20.5, Stage 2, printed p. 541.

<a id="FF3-berlekamp-splitting-correct"></a>

#### Las Vegas correctness of Algorithm B2

For f monic square-free and β a basis of B: every outcome H of berlekampSplit hf β n multiplies to f, and if #H = #ι (= r) then H is the set of irreducible factors of f.

The hypotheses are as follows. F a finite field f monic, square-free β a basis of berlekampSubalgebra f Algorithm B2’s specification assumes square-free f of positive degree. The constant 1 is handled by the surrounding full factorization algorithm.

A proof proceeds as follows. Same invariant as for EDF (refinement preserves monic, coprime factors multiplying to f). #ι = r by Berlekamp's theorem, so r factors are the irreducible factors.

In particular, verify the following values and consequences.

- X² + X over 𝔽₂: outcomes {X² + X} and {X, X + 1}.

*Needs:* [Algorithm B2 (splitting with a basis of B) as a round distribution](#FF3-berlekamp-splitting-algorithm), [Berlekamp's theorem: dim B = r](#FF3-berlekamp-dimension-theorem), [One refinement step of equal-degree splitting](#FF3-equal-degree-refinement-step), [gcd with a square-free modulus](#FF3-gcd-with-square-free-modulus).

See [Shoup](#source-1) — §20.5, Stage 2, printed p. 541.

<a id="FF3-berlekamp-splitting-failure-bound"></a>

#### Failure probability of Algorithm B2

For f monic square-free with r factors and β a basis of B: P[fewer than r factors after n rounds] ≤ C(r, 2) · (5/9)^n.

The hypotheses are as follows. F a finite field f monic, square-free Algorithm B2’s specification assumes square-free f of positive degree. The constant 1 is handled by the surrounding full factorization algorithm.

A proof proceeds as follows. For a pair of factors, the components (c_i, c_j) ∈ F² of a uniform element of B are independent uniform; M_1 separates them unless M_1(c_i) and M_1(c_j) are both zero or both nonzero: probability 1/2 (q even) or (1 + q^(−2))/2 ≤ 5/9 (q odd), the case k = 1 of the pair-separation computation. Union bound over pairs, rounds independent.

In particular, verify the following values and consequences.

- Tends to 0.

*Needs:* [Algorithm B2 (splitting with a basis of B) as a round distribution](#FF3-berlekamp-splitting-algorithm), [The pair-separation probability of equal-degree splitting](#FF3-equal-degree-pair-separation), [Las Vegas correctness of Algorithm B2](#FF3-berlekamp-splitting-correct).

See [Shoup](#source-1) — §20.5, Stage 2, printed p. 541.

<a id="FF3-berlekamp-algorithm"></a>

#### Berlekamp's factoring algorithm

berlekampFactor f n : PMF (Option (Multiset F[X])) runs Algorithm SFD on monic f, then on each square-free part g: builds the Berlekamp matrix of g, a basis of its row null space (Gaussian elimination, CN.0), hence a basis of B, and n rounds of Algorithm B2; the outcome is the multiset of irreducible factors with multiplicity, or none if some part is unfinished.

The hypotheses are as follows. F a finite field f ∈ F[X]; the specification is for monic f n : ℕ

A proof proceeds as follows. Compose SFD, the deterministic Stage 1 (basis of the null space; its correctness is the rank theorem and CN.0's Gaussian elimination contract) and Stage 2 distributions.

Provide the following interface.

- `berlekampFactor_support`: Every completed outcome equals normalizedFactors f (theorem node berlekamp-algorithm-correct).
- `berlekampFactor_none_le`: P[none] ≤ (deg f)² (5/9)^n.
- `berlekampFactor_of_irreducible`: For monic irreducible f, berlekampFactor f n = pure (some {f}).

**Checks.**

- `berlekampFactor_one`: berlekampFactor 1 n = pure (some 0).
- `berlekampFactor_X_pow_five_sub_X_sub_one_zmod_two`: Over 𝔽₂, every completed outcome for X⁵ − X − 1 is {X² + X + 1, X³ + X² + 1}.
- `berlekampFactor_agrees_cantorZassenhaus`: Completed outcomes of berlekampFactor and cantorZassenhaus coincide (both equal normalizedFactors f).


In particular, verify the following values and consequences.

- The unit tests; correctness is a theorem node.

*Needs:* [Algorithm SFD](#FF3-square-free-decomposition-algorithm), [The Berlekamp matrix](#FF3-berlekamp-matrix), [The rank of the Berlekamp matrix](#FF3-berlekamp-matrix-rank), [Algorithm B2 (splitting with a basis of B) as a round distribution](#FF3-berlekamp-splitting-algorithm), `ComputationalNumberTheory:CN.0`.

See [Shoup](#source-1) — §20.5, printed p. 542; [Shoup](#source-1) — Theorems 20.11 and 20.12, printed p. 542.

<a id="FF3-berlekamp-algorithm-correct"></a>

#### Las Vegas correctness of Berlekamp's algorithm

For monic f and every n, a completed outcome some m of berlekampFactor f n satisfies m = normalizedFactors f; and P[none] ≤ (deg f)² (5/9)^n.

The hypotheses are as follows. F a finite field f monic

A proof proceeds as follows. SFD correctness; Stage 1 returns a basis of B (rank theorem and CN.0's Gaussian elimination contract); Stage 2 correctness and failure bound; unique factorization to assemble multiplicities.

In particular, verify the following values and consequences.

- X⁵ − X − 1 over 𝔽₂.

*Needs:* [Berlekamp's factoring algorithm](#FF3-berlekamp-algorithm), [Correctness of Algorithm SFD](#FF3-square-free-decomposition-algorithm-correct), [The rank of the Berlekamp matrix](#FF3-berlekamp-matrix-rank), [Las Vegas correctness of Algorithm B2](#FF3-berlekamp-splitting-correct), [Failure probability of Algorithm B2](#FF3-berlekamp-splitting-failure-bound), `ComputationalNumberTheory:CN.0`.

See [Shoup](#source-1) — Theorems 20.11 and 20.12, printed p. 542.

### 3.6 Constructing irreducible polynomials

<a id="FF3-random-irreducible-polynomial-algorithm"></a>

#### Algorithm RIP (random irreducible polynomial) as an attempt distribution

randomIrreducible F ℓ n : PMF (Option F[X]) is n attempts of Shoup's Algorithm RIP: each attempt draws a uniform monic f of degree ℓ (X^ℓ plus a uniform coefficient vector) and returns some f if irreducibilityTest f = true; after n failures it returns none.

The hypotheses are as follows. F a finite field with q elements ℓ, n : ℕ

A proof proceeds as follows. Define by recursion on n with PMF.uniformOfFintype, PMF.bind and PMF.pure.

Provide the following interface.

- `randomIrreducible_apply_some`: Output law (theorem node random-irreducible-polynomial-output-law).
- `randomIrreducible_none`: P[none after n attempts] = (1 − Π_F(ℓ)/q^ℓ)^n.
- `tsum_randomIrreducible_none_le`: Expected number of attempts ≤ 2ℓ (theorem node).

**Checks.**

- `randomIrreducible_zero`: randomIrreducible F ℓ 0 = pure none.
- `randomIrreducible_one_one`: Over 𝔽₂, one attempt at degree 1 returns X with probability 1/2.
- `randomIrreducible_two_one`: Over 𝔽₂, one attempt at degree 2 fails with probability 3/4.


In particular, verify the following values and consequences.

- Output law and number of attempts are theorem nodes; unit tests below.

*Needs:* [The finite set of monic polynomials of a given degree](#FF2-monic-polynomials-of-degree), [Algorithm IPT, the irreducibility test](#FF3-irreducibility-test), `PMF.uniformOfFintype`, `PMF.bind`, `PMF.pure`.

See [Shoup](#source-1) — §20.1, Algorithm RIP and Theorem 20.2, printed pp. 523-524.

<a id="FF3-random-irreducible-polynomial-output-law"></a>

#### Output law of Algorithm RIP

For ℓ ≥ 1, n attempts of Algorithm RIP return some f with probability (1 − (1 − Π_F(ℓ)/q^ℓ)^n)/Π_F(ℓ) if f is monic irreducible of degree ℓ, and 0 otherwise; none has probability (1 − Π_F(ℓ)/q^ℓ)^n. In particular, conditioned on success the output is uniform on monicIrreducibles F ℓ.

The hypotheses are as follows. F a finite field with q elements ℓ ≠ 0

A proof proceeds as follows. Induction on n: an attempt succeeds with f with probability 1/q^ℓ if f is irreducible (IPT correctness), and fails with probability 1 − Π_F(ℓ)/q^ℓ; sum the geometric series. This is Shoup's Theorem 9.3 (iii) for the generate-and-test loop, computed directly.

In particular, verify the following values and consequences.

- Over 𝔽₂, ℓ = 2, n = 1: P[some (X² + X + 1)] = 1/4.

*Needs:* [Algorithm RIP (random irreducible polynomial) as an attempt distribution](#FF3-random-irreducible-polynomial-algorithm), [Correctness of Algorithm IPT](#FF3-irreducibility-test-correct), [The number Π_F(n) of monic irreducible polynomials of degree n](#FF3-count-of-irreducible-polynomials), `PMF.toOuterMeasure`.

See [Shoup](#source-1) — §20.1, Algorithm RIP and Theorem 20.2, printed pp. 523-524; [Shoup](#source-1) — Theorem 9.3 and Example 9.10, printed pp. 288-289.

<a id="FF3-random-irreducible-polynomial-attempts"></a>

#### Expected number of attempts of Algorithm RIP

For ℓ ≥ 1, Σ_{n≥0} P[randomIrreducible F ℓ n = none] = q^ℓ/Π_F(ℓ) ≤ 2ℓ: the number of attempts is geometric with success probability Π_F(ℓ)/q^ℓ ≥ 1/(2ℓ), and RIP halts with probability 1.

The hypotheses are as follows. F a finite field with q elements ℓ ≠ 0

A proof proceeds as follows. Σ_n (1 − ρ)^n = 1/ρ (ENNReal.tsum_geometric) with ρ = Π_F(ℓ)/q^ℓ; ρ ≥ 1/(2ℓ) by Shoup's density bound.

In particular, verify the following values and consequences.

- ℓ = 1: every attempt succeeds, the sum is 1.

*Needs:* [Output law of Algorithm RIP](#FF3-random-irreducible-polynomial-output-law), [Shoup's density bound q^n ≤ 2n Π_F(n)](#FF3-irreducible-density-lower-bound), `ENNReal.tsum_geometric`.

See [Shoup](#source-1) — §20.1, Algorithm RIP and Theorem 20.2, printed pp. 523-524; [Shoup](#source-1) — Theorem 9.3 and Example 9.10, printed pp. 288-289.

### 3.7 Certified factorizations

<a id="FF3-factorization-certificate"></a>

#### Factorization certificate and its checker

A FactorizationCertificate over F is a leading coefficient c ∈ F and a list of triples (g_i, e_i, w_i) with w_i an Layer 0 Rabin certificate. c.check f is true iff c≠0, C c · ∏ g_i^e_i = f, every e_i ≥ 1, the g_i are pairwise distinct, and every w_i checks for g_i (in particular g_i is monic of positive degree). A product identity alone is not a certificate: every factor must carry an irreducibility witness.

The hypotheses are as follows. F a finite field f ∈ F[X]

A proof proceeds as follows. Define the structure and the Boolean checker (a conjunction of decidable conditions). Reject a zero leading coefficient: otherwise any list of checked irreducibles would certify 0 via 0·product=0 and invalidate the normalized-factor soundness and uniqueness theorems. Soundness and completeness are theorem nodes.

Provide the following interface.

- `FactorizationCertificate.check`: The Boolean checker c.check f.
- `FactorizationCertificate.check_sound`: Soundness (theorem node factorization-certificate-sound).
- `FactorizationCertificate.exists_check`: Completeness (theorem node factorization-certificate-complete).
- `FactorizationCertificate.check_eq_true_iff_perm`: Two checking certificates of f have the same (factor, exponent) list up to permutation.

**Checks.**

- `factorizationCertificate_X_sq_add_X`: Over 𝔽₂, ⟨1, [(X, 1, w_X), (X + 1, 1, w_{X+1})]⟩ with generated Rabin certificates checks for X² + X.
- `factorizationCertificate_product_only_fails`: Over 𝔽₂, ⟨1, [(X² + X, 1, w)]⟩ never checks for X² + X, whatever w is.
- `factorizationCertificate_constant`: Over 𝔽₅, ⟨3, []⟩ checks for the constant 3.
- `factorizationCertificate_zero_rejected`: For every certificate c, c.check 0=false: zero has no finite irreducible factorization certificate.


In particular, verify the following values and consequences.

- The unit tests; the checker is executable on concrete inputs through CN.0's presentations.

*Needs:* [Rabin irreducibility certificates and their checker](#FF0-rabin-irreducibility-certificate), `Polynomial.C`.

See [Shoup](#source-1) — Exercise 20.2, printed pp. 524-525; [Shoup](#source-1) — §20.3, printed p. 527.

<a id="FF3-factorization-certificate-sound"></a>

#### Soundness of factorization certificates

If c.check f = true then c.leadingCoeff = leadingCoeff f and Σ_i e_i • {g_i} = normalizedFactors f.

The hypotheses are as follows. F a finite field c a factorization certificate c.check f = true

A proof proceeds as follows. Each g_i is monic irreducible (soundness of Layer 0's Rabin certificate). The checker also gives c.leadingCoeff≠0, so f≠0 and leadingCoeff f=c.leadingCoeff. Expand the exponents into the multiset of monic irreducible factors and apply UniqueFactorizationMonoid.normalizedFactors_prod_eq. Normalize fixes each monic factor. The nonzero constant leading coefficient is a unit and contributes no normalized factors. Do not use normalizedFactors_prod_of_prime, which requires subsingleton units and does not apply to general F[X].

In particular, verify the following values and consequences.

- X² + X over 𝔽₂: {X, X + 1}.

*Needs:* [Factorization certificate and its checker](#FF3-factorization-certificate), [Rabin irreducibility certificates and their checker](#FF0-rabin-irreducibility-certificate), `UniqueFactorizationMonoid.normalizedFactors_prod_eq`.

See [Shoup](#source-1) — Exercise 20.2, printed pp. 524-525.

<a id="FF3-factorization-certificate-complete"></a>

#### Completeness of factorization certificates

Every nonzero f over a finite field has a factorization certificate that checks.

The hypotheses are as follows. F a finite field f ≠ 0

A proof proceeds as follows. Take c = leadingCoeff f and the distinct normalized factors with their multiplicities; attach rabinCertificateOf to each (it checks, by rabin-certificate-generation-correct).

In particular, verify the following values and consequences.

- f constant: the empty list.

*Needs:* [Factorization certificate and its checker](#FF3-factorization-certificate), [The generated Rabin certificate checks](#FF3-rabin-certificate-generation-correct), `UniqueFactorizationMonoid.prod_normalizedFactors`.

See [Shoup](#source-1) — Exercise 20.2, printed pp. 524-525.

<a id="FF3-certified-factorization-algorithm"></a>

#### Certified factorization over a finite field

certifiedFactorization f n : PMF (Option (FactorizationCertificate F)) runs cantorZassenhaus on f / leadingCoeff f with n rounds per block and attaches rabinCertificateOf to each factor; a completed outcome is a certificate that checks.

The hypotheses are as follows. F a finite field f ≠ 0 n : ℕ

A proof proceeds as follows. Map the Cantor–Zassenhaus distribution through the certificate constructor.

Provide the following interface.

- `certifiedFactorization_support`: Every completed outcome checks (theorem node certified-factorization-correct).
- `certifiedFactorization_none_le`: P[none] ≤ (deg f)² (5/9)^n.
- `certifiedFactorization_constant`: For c ≠ 0, certifiedFactorization (C c) n = pure (some ⟨c, []⟩).

**Checks.**

- `certifiedFactorization_X_sq_add_X_check`: Every certificate produced for X² + X over 𝔽₂ checks.
- `certifiedFactorization_factors_X_sq_add_X`: Its factor list is a permutation of [(X, 1), (X + 1, 1)].
- `certifiedFactorization_irreducible`: For X² + X + 1 over 𝔽₂ the output with 0 rounds is the one-factor certificate.


In particular, verify the following values and consequences.

- Correctness is a theorem node; unit tests below.

*Needs:* [The Cantor–Zassenhaus algorithm](#FF3-cantor-zassenhaus-algorithm), [Generating a Rabin irreducibility certificate](#FF3-rabin-certificate-generation), [Factorization certificate and its checker](#FF3-factorization-certificate), `PMF.map`.

See [Shoup](#source-1) — §20.4.3, Theorem 20.9, printed pp. 536-537; [Shoup](#source-1) — Exercise 20.2, printed pp. 524-525.

<a id="FF3-certified-factorization-correct"></a>

#### Correctness of certified factorization

For f ≠ 0, every completed outcome of certifiedFactorization f n is a certificate c with c.check f = true; P[none] ≤ (deg f)² (5/9)^n.

The hypotheses are as follows. F a finite field f ≠ 0

A proof proceeds as follows. Cantor–Zassenhaus correctness gives the normalized factors; each carries a generated certificate that checks; the product identity holds with c = leadingCoeff f. Failure bound from the Cantor–Zassenhaus failure bound.

In particular, verify the following values and consequences.

- X² + X over 𝔽₂.

*Needs:* [Certified factorization over a finite field](#FF3-certified-factorization-algorithm), [Las Vegas correctness of the Cantor–Zassenhaus algorithm](#FF3-cantor-zassenhaus-correct), [Failure probability of the Cantor–Zassenhaus algorithm](#FF3-cantor-zassenhaus-failure-bound), [The generated Rabin certificate checks](#FF3-rabin-certificate-generation-correct), [Factorization certificate and its checker](#FF3-factorization-certificate).

See [Shoup](#source-1) — §20.4.3, Theorem 20.9, printed pp. 536-537.

### 3.8 Hensel lifting of coprime factorizations

<a id="FF3-strict-coprimality-lifts"></a>

#### Coprimality lifts along an ideal in the Jacobson radical

Let R be a commutative ring and I ⊆ Jac(R) an ideal. If g ∈ R[X] is monic and the reductions ḡ, h̄ are coprime in (R/I)[X], then there are u, v ∈ R[X] with u g + v h = 1 and either v=0 or natDegree v<natDegree g (equivalently degree v<degree g in a nontrivial ring); in particular g and h are coprime in R[X].

The hypotheses are as follows. R a commutative ring I ≤ Jac(R) g monic IsCoprime ḡ h̄ in (R ⧸ I)[X]

A proof proceeds as follows. M = R[X]/(g, h) is a finitely generated R-module since g is monic (division by g). (ḡ, h̄) = (R/I)[X] gives (g, h) + I R[X] = R[X], so M = I M. Nakayama's lemma (Mathlib Submodule.eq_bot_of_le_smul_of_le_jacobson_bot) gives M = 0, i.e. u g + v h = 1. Reduce v modulo g (division by the monic g) and correct u, keeping u g + v h = 1 with deg v < deg g. In Lean use v=0∨v.natDegree<g.natDegree, so g=1 and v=0 are not turned into the false natural-number comparison 0<0.

In particular, verify the following values and consequences.

- R = ℤ/25, I = (5): X − 2 and X + 2 are coprime modulo 5, hence coprime over ℤ/25.

*Needs:* `Submodule.eq_bot_of_le_smul_of_le_jacobson_bot`, `Ideal.jacobson`, `Polynomial.modByMonic_add_div`, `IsCoprime`.

See [Milne](#source-19) — Lemma 7.34, p. 121.

<a id="FF3-uniqueness-of-monic-lifts"></a>

#### Uniqueness of monic lifts of a coprime factorization

Let I ⊆ Jac(R). If g h = g′ h′ with g, h, g′, h′ ∈ R[X] monic, ḡ = ḡ′, h̄ = h̄′ modulo I, and ḡ, h̄ coprime in (R/I)[X], then g = g′ and h = h′.

The hypotheses are as follows. R a commutative ring I ≤ Jac(R) g, h, g′, h′ monic with g h = g′ h′, equal reductions, ḡ and h̄ coprime

A proof proceeds as follows. By strict coprimality (ḡ, h̄′) = (ḡ, h̄) coprime gives r g + s h′ = 1 in R[X]. g′ = g′ r g + g′ h′ s = g (g′ r + h s), so g | g′; both are monic of the same degree, hence equal; cancel g (monic, a non-zero-divisor) to get h = h′.

In particular, verify the following values and consequences.

- Over ℤ/8, X² + 4 = (X − 2)(X − 6) = (X − 6)(X − 2): the reductions X, X are not coprime, and uniqueness fails.

*Needs:* [Coprimality lifts along an ideal in the Jacobson radical](#FF3-strict-coprimality-lifts).

See [Milne](#source-19) — Lemma 7.35 and its proof, pp. 121-122. This is the local-ring prototype; the stated general-ring version uses the Jacobson-radical argument above, rather than assuming R/I is a field.

<a id="FF3-hensel-step"></a>

#### One linear Hensel step

Let I be an ideal of a commutative ring R, m ≥ 1, g monic, f − g h ∈ I^m R[X] and s g + t h − 1 ∈ I R[X]. With e = f − g h, δg = (t e) mod g and δh = s e + ((t e) div g) h, the pair g′ = g + δg, h′ = h + δh satisfies: g′ monic of degree deg g, g′ − g and h′ − h ∈ I^m R[X], and f − g′ h′ ∈ I^(m+1) R[X].

The hypotheses are as follows. R a commutative ring, I an ideal m ≥ 1 g monic f − g h ∈ I^m R[X] s g + t h − 1 ∈ I R[X]

A proof proceeds as follows. Division by the monic g keeps coefficients in I^m: t e = Q g + δg with δg, Q ∈ I^m R[X] and deg δg < deg g, so g′ is monic of the same degree. g δh + h δg = (s g + t h) e ≡ e (mod I^(m+1)), since (s g + t h − 1) e ∈ I · I^m. f − g′ h′ = e − (g δh + h δg) − δg δh ∈ I^(m+1) R[X], as δg δh ∈ I^(2m) ⊆ I^(m+1).

In particular, verify the following values and consequences.

- ℤ with I = (5), f = X² + 1, g = X − 2, h = X + 2, s = 1, t = −1 (s g + t h = −4 ≡ 1 mod 5): e = 5, δg = −5, δh = 5, giving X − 7 and X + 7 with f − g′h′ = 50 ∈ (25).

*Needs:* `Polynomial.modByMonic_add_div`, `Polynomial.degree_modByMonic_lt`, `Ideal.map`, `Polynomial.C`.

See [Milne](#source-19) — proof of Theorem 7.33 (existence), p. 122.

<a id="FF3-hensel-lifting-of-factorizations"></a>

#### Hensel lifting of a coprime factorization modulo I^k

Let I be an ideal of a commutative ring R, f ∈ R[X] monic, and g0, h0 monic with f ≡ g0 h0 (mod I) and ḡ0, h̄0 coprime in (R/I)[X]. Then for every k ≥ 1 there are monic g, h ∈ R[X] with deg g = deg g0, g ≡ g0 and h ≡ h0 (mod I), and f ≡ g h (mod I^k R[X]).

The hypotheses are as follows. R a commutative ring, I an ideal f, g0, h0 monic f − g0 h0 ∈ I R[X] ḡ0, h̄0 coprime in (R ⧸ I)[X] k ≥ 1

A proof proceeds as follows. Lift a Bézout identity of ḡ0, h̄0 to s, t ∈ R[X] with s g0 + t h0 − 1 ∈ I R[X]. Iterate the Hensel step k − 1 times (the step's hypothesis s g + t h ≡ 1 mod I persists because g ≡ g0, h ≡ h0 mod I). First handle I=⊤ by taking g=g0 and h=h0; all congruences modulo I^k are then vacuous. For I≠⊤, monic reduction preserves degree, so deg f=deg g0+deg h0. Replace the second factor by f div g: it is monic, congruent to h0 mod I, and the remainder is in I^k because division by monic g preserves coefficient ideals.

In particular, verify the following values and consequences.

- X² + 1 = (X − 2)(X + 2) mod 5 lifts to (X − 7)(X + 7) mod 25.
- k = 1: (g0, h0) itself.

*Needs:* [One linear Hensel step](#FF3-hensel-step), `Polynomial.modByMonic_add_div`, `Ideal.Quotient.mk`.

See [Milne](#source-19) — Theorem 7.33 (Hensel's lemma), p. 121; [Milne](#source-19) — proof of Theorem 7.33 (existence), p. 122.

<a id="FF3-hensel-lifting-uniqueness-mod-power"></a>

#### Uniqueness of Hensel lifts modulo I^k

In (R/I^k)[X] (k ≥ 1), two factorizations g h = g′ h′ into monic polynomials with the same reductions modulo I, the reductions of g and h being coprime in (R/I)[X], coincide.

The hypotheses are as follows. R a commutative ring, I an ideal, k ≥ 1 g, h, g′, h′ ∈ (R/I^k)[X] monic with g h = g′ h′ and equal coprime reductions modulo I

A proof proceeds as follows. The image of I in R/I^k is nilpotent, hence contained in the Jacobson radical; (R/I^k)/(I/I^k) ≅ R/I (Mathlib Ideal.Quotient.factor). Apply the uniqueness of monic lifts.

In particular, verify the following values and consequences.

- Over ℤ/25, the monic lift of X − 2 in a factorization of X² + 1 lifting (X − 2)(X + 2) is X − 7.

*Needs:* [Uniqueness of monic lifts of a coprime factorization](#FF3-uniqueness-of-monic-lifts), `Ideal.Quotient.factor`, `Ideal.jacobson`.

See [Milne](#source-19) — Lemma 7.35 and its proof, pp. 121-122. This is the local-ring prototype; the stated general-ring version uses the Jacobson-radical argument above, rather than assuming R/I is a field.

<a id="FF3-hensel-lifting-over-complete-rings"></a>

#### Hensel lifting over an I-adically complete ring

Let R be I-adically complete (Mathlib IsAdicComplete I R), f ∈ R[X] monic, and f̄ = g0 h0 in (R/I)[X] with g0, h0 monic and coprime. Then there is a unique pair (g, h) of monic polynomials in R[X] with ḡ = g0, h̄ = h0 and f = g h. (For R = ℤ_p, I = (p) this is Milne's Theorem 7.33 over ℤ_p; for R = 𝔽_q⟦t⟧ over the power series ring.)

The hypotheses are as follows. R a commutative ring, I-adically complete f monic g0, h0 ∈ (R/I)[X] monic, coprime, with f̄ = g0 h0

A proof proceeds as follows. Lift g0, h0 to monic polynomials of the same degrees; the Hensel steps give a sequence g_m with g_{m+1} − g_m ∈ I^(m+1) R[X] coefficientwise, a Cauchy sequence in each coefficient of bounded degree. Completeness (Mathlib IsPrecomplete.prec, IsHausdorff) gives limits g, h, monic of the right degrees, with f − g h ∈ ⋂_m I^m R[X] = 0. Uniqueness: I ⊆ Jac(R) for adically complete R (Mathlib IsAdicComplete.le_jacobson_bot), then uniqueness of monic lifts. Milne's proof stops after the inductive step; the passage to the limit is supplied here.

In particular, verify the following values and consequences.

- X^(p−1) − 1 over ℤ_p splits into p − 1 linear factors lifting those modulo p (Milne Remark 7.36).

*Needs:* [Hensel lifting of a coprime factorization modulo I^k](#FF3-hensel-lifting-of-factorizations), [Uniqueness of monic lifts of a coprime factorization](#FF3-uniqueness-of-monic-lifts), `IsAdicComplete`, `IsPrecomplete.prec`, `IsAdicComplete.le_jacobson_bot`.

See [Milne](#source-19) — Theorem 7.33 (Hensel's lemma), p. 121; [Milne](#source-19) — proof of Theorem 7.33 (existence), p. 122.

<a id="FF3-hensel-lifting-several-factors"></a>

#### Hensel lifting of several pairwise coprime factors

Let f ∈ R[X] be monic and f ≡ ∏_{i∈ι} g_{0,i} (mod I) with g_{0,i} monic and pairwise coprime modulo I (ι finite). Then for every k ≥ 1 there are monic g_i ≡ g_{0,i} (mod I) with f ≡ ∏ g_i (mod I^k); they are unique in (R/I^k)[X].

The hypotheses are as follows. R a commutative ring, I an ideal, k ≥ 1 f monic g_{0,i} monic, pairwise coprime modulo I, product ≡ f mod I

A proof proceeds as follows. Induction on #ι: split off one factor g_{0,j}; it is coprime to ∏_{i≠j} g_{0,i} modulo I (a factor coprime to each is coprime to the product); apply the two-factor theorem, then induct on the cofactor. Uniqueness factor by factor from the two-factor uniqueness.

In particular, verify the following values and consequences.

- X^(p−1) − 1 modulo p^k splits into p − 1 monic linear factors (the Teichmüller roots modulo p^k).

*Needs:* [Hensel lifting of a coprime factorization modulo I^k](#FF3-hensel-lifting-of-factorizations), [Uniqueness of Hensel lifts modulo I^k](#FF3-hensel-lifting-uniqueness-mod-power).

See [Milne](#source-19) — Remark 7.36, p. 122.

<a id="FF3-hensel-lifting-modulo-prime-powers"></a>

#### Hensel lifting modulo p^k

Let p be prime, k ≥ 1, f ∈ ℤ[X] monic and f mod p = g0 h0 in 𝔽_p[X] with g0, h0 monic and coprime. Then there is a unique pair (g, h) of monic polynomials in (ℤ/p^kℤ)[X] reducing to (g0, h0) modulo p with f mod p^k = g h. This is the form used by factoring algorithms over ℤ.

The hypotheses are as follows. p prime, k ≥ 1 f ∈ ℤ[X] monic f̄ = g0 h0 in (ZMod p)[X], g0, h0 monic, coprime

A proof proceeds as follows. Existence: the lifting theorem for R = ℤ, I = (p), mapped to ℤ/p^k (Mathlib ZMod.castHom for the reduction ℤ/p^k → ℤ/p). Uniqueness: the uniqueness theorem modulo I^k with ℤ/p^k = ℤ/(p)^k.

In particular, verify the following values and consequences.

- p = 5, k = 2: X² + 1 = (X − 7)(X + 7) in (ℤ/25)[X], and this lift of (X − 2)(X + 2) is unique.

*Needs:* [Hensel lifting of a coprime factorization modulo I^k](#FF3-hensel-lifting-of-factorizations), [Uniqueness of Hensel lifts modulo I^k](#FF3-hensel-lifting-uniqueness-mod-power), `ZMod.castHom`.

See [Milne](#source-19) — Theorem 7.33 (Hensel's lemma), p. 121; [Milne](#source-19) — Remark 7.37, p. 123.

<a id="FF3-hensel-lifting-algorithm"></a>

#### The linear Hensel lifting algorithm

henselLift f g0 h0 s t m ∈ R[X] × R[X] is the m-th iterate of the Hensel step from (g0, h0) with fixed Bézout coefficients (s, t) modulo I: (g, h) ↦ (g + (t e) mod g, h + s e + ((t e) div g) h), e = f − g h. Under g0 monic and the initial factorization/Bézout congruences, after m steps the first component is monic of degree deg g0 and f ≡ g (f div g) (mod I^(m+1)).

The hypotheses are as follows. R a commutative ring f, g0, h0, s, t ∈ R[X] m : ℕ

A proof proceeds as follows. Define by recursion on m. The invariants are those of the Hensel step (induction on m).

Provide the following interface.

- `henselLift_zero`: henselLift f g0 h0 s t 0 = (g0, h0).
- `henselLift_spec`: If g0 is monic, f ≡ g0 h0 and s g0 + t h0 ≡ 1 modulo I, then after m steps g is monic of degree deg g0, g ≡ g0 and h ≡ h0 modulo I, and f ≡ g h modulo I^(m+1).
- `henselLift_divByMonic`: For monic f and natDegree g0≤natDegree f, f div g is monic and f≡g(f div g) modulo I^(m+1), under the same Hensel invariants. Without the degree guard, I=⊤ and f=1,g0=X give the nonmonic quotient 0.
- `henselLift_succ_sub_mem`: Consecutive first components differ by an element of I^(m+1) R[X] (the Cauchy property).

**Checks.**

- `henselLift_one_mod_twenty_five`: With s = 1, t = −1, one step on X² + 1, X − 2, X + 2 over ℤ gives a first factor ≡ X − 7 modulo 25.
- `hensel_lift_X_sq_add_one_mod_twenty_five`: In (ℤ/25)[X], X² + 1 = (X − 7)(X + 7).
- `hensel_lift_unique_X_sq_add_one`: In (ℤ/25)[X], a monic g with g h = X² + 1, g ≡ X − 2 and h ≡ X + 2 mod 5 equals X − 7.
- `not_unique_lift_of_not_coprime`: Without coprimality lifts are not unique: over ℤ/8, X² + 4 = (X − 2)(X − 6) with X − 2 ≠ X − 6, both ≡ X mod 2.


In particular, verify the following values and consequences.

- The unit tests; the specification lemmas are its API.

*Needs:* [One linear Hensel step](#FF3-hensel-step), `Polynomial.modByMonic`, `Polynomial.divByMonic`.

See [Milne](#source-19) — proof of Theorem 7.33 (existence), p. 122; [Milne](#source-19) — Remark 7.37, p. 123.

### 3.9 Certified point counting

<a id="FF3-weierstrass-cubic"></a>

#### The cubic of a model in characteristic-not-two normal form

For W : WeierstrassCurve F, weierstrassCubic W = X³ + a₂X² + a₄X + a₆ ∈ F[X]; when a₁ = a₃ = 0 (Mathlib's IsCharNeTwoNF) the equation of W is y² = weierstrassCubic W (x), and 4 · weierstrassCubic W = Ψ₂Sq (Mathlib's 2-division polynomial square).

The hypotheses are as follows. F a field W : WeierstrassCurve F

A proof proceeds as follows. Define the polynomial. With a₁ = a₃ = 0, W.Equation x y ⟺ y² = x³ + a₂x² + a₄x + a₆ (Mathlib WeierstrassCurve.Affine.equation_iff). Ψ₂Sq = 4X³ + b₂X² + 2b₄X + b₆ with b₂ = 4a₂, b₄ = 2a₄, b₆ = 4a₆ when a₁ = a₃ = 0.

Provide the following interface.

- `four_mul_weierstrassCubic`: For a₁ = a₃ = 0: 4 · weierstrassCubic W = W.Ψ₂Sq.
- `equation_iff_weierstrassCubic`: For a₁ = a₃ = 0: W.Equation x y ↔ y² = (weierstrassCubic W).eval x.
- `natDegree_weierstrassCubic`: natDegree (weierstrassCubic W) = 3.

**Checks.**

- `weierstrassCubic_x_cubed_add_x`: For y² = x³ + x over 𝔽₃ the cubic is X³ + X.
- `weierstrassCubic_monic`: weierstrassCubic W is monic.
- `weierstrassCubic_ignores_a₁`: The cubic does not see a₁: the models with a₁ = 1 and a₁ = 0 (other coefficients 0) have the same cubic, so it describes the curve only in the normal form a₁ = a₃ = 0.


In particular, verify the following values and consequences.

- The API and unit tests.

*Needs:* `WeierstrassCurve.IsCharNeTwoNF`, `WeierstrassCurve.Affine.equation_iff`, `WeierstrassCurve.Ψ₂Sq`.

See [Sutherland](#source-20) — Lecture 7 §7.2, equation (1), p. 2; [Sutherland](#source-20) — Lecture 8 §8.1, pp. 1-2.

<a id="FF3-point-count-as-character-sum"></a>

#### The point count as a character sum

For q odd and W with a₁ = a₃ = 0: naivePointCount W = q + 1 + Σ_{x∈F} χ(f(x)), χ = quadraticChar F (Mathlib's quadratic character, χ(0) = 0) and f = weierstrassCubic W.

The hypotheses are as follows. F a finite field of odd characteristic W with a₁ = a₃ = 0 (any model: singular models included)

A proof proceeds as follows. For each x, #{y : y² = f(x)} = 1 + χ(f(x)) (Mathlib quadraticChar_card_sqrts). Sum over x and add the point at infinity.

In particular, verify the following values and consequences.

- y² = x³ + x + 1 over 𝔽₅: χ-values 1, −1, 1, 1, 1, so 5 + 1 + 3 = 9.

*Needs:* [Naive point count by enumeration](#existing-boundaries), [The cubic of a model in characteristic-not-two normal form](#FF3-weierstrass-cubic), `quadraticChar_card_sqrts`, `quadraticChar`.

See [Sutherland](#source-20) — Lecture 7 §7.2, equation (1), p. 2.

<a id="FF3-trace-as-character-sum"></a>

#### The Frobenius trace as a character sum

For q odd and a₁ = a₃ = 0: a_q = q + 1 − naivePointCount W = −Σ_{x∈F} χ(f(x)); by Tau Ceti's frobeniusTrace_def and naivePointCount_eq_natCard this is Tau Ceti's frobeniusTrace W.

The hypotheses are as follows. F a finite field of odd characteristic W with a₁ = a₃ = 0

A proof proceeds as follows. Rearrange the character-sum formula.

In particular, verify the following values and consequences.

- y² = x³ + x + 1 over 𝔽₅: a₅ = −3.

*Needs:* [The point count as a character sum](#FF3-point-count-as-character-sum), `WeierstrassCurve.frobeniusTrace_def`.

See [Sutherland](#source-20) — Lecture 7 §7.2, equation (1), p. 2.

<a id="FF3-point-count-certificate"></a>

#### Point-count certificate

For q odd and W with a₁ = a₃ = 0, a PointCountCertificate is a non-square c ∈ F and a function root : F → F. It checks (c.check W) when c^((q−1)/2) = −1 (Euler's criterion) and, for every x, root(x)² = f(x) or root(x)² = c f(x). The count it asserts is q + 1 + Σ_x ε_x with ε_x = 0 if f(x) = 0, 1 if root(x)² = f(x) ≠ 0, and −1 otherwise.

The hypotheses are as follows. F a finite field of odd characteristic W with a₁ = a₃ = 0 f = weierstrassCubic W

A proof proceeds as follows. Define the structure, the checker and the count. Checking costs q squarings, q comparisons and one exponentiation (O(q + len(q)) operations in F), against q exponentiations for computing the symbols.

Provide the following interface.

- `PointCountCertificate.check`: The Boolean checker c.check W.
- `PointCountCertificate.count`: The asserted count c.count W : ℤ.
- `PointCountCertificate.count_eq_of_check`: Soundness (theorem node point-count-certificate-sound).
- `PointCountCertificate.exists_check`: Completeness (theorem node point-count-certificate-complete).
- `PointCountCertificate.check_nonsquare`: A checking certificate's c is not a square.

**Checks.**

- `pointCountCertificate_check_zmod_five`: For y² = x³ + x + 1 over 𝔽₅, c = 2 and roots (1, 1, 1, 1, 2) check.
- `pointCountCertificate_count_zmod_five`: That certificate asserts 9 points.
- `pointCountCertificate_square_fails`: c = 1 (a square) is rejected whatever the roots.
- `pointCountCertificate_cusp`: On the cusp y² = x³ over 𝔽₅ a certificate asserts 6, the convention that counts the singular point.


In particular, verify the following values and consequences.

- Soundness and completeness are theorem nodes; unit tests below.

*Needs:* [The cubic of a model in characteristic-not-two normal form](#FF3-weierstrass-cubic), `FiniteField.isSquare_iff`, `FiniteField.exists_nonsquare`, `quadraticChar_neg_one_iff_not_isSquare`.

See [Sutherland](#source-20) — Lecture 7 §7.3, p. 3; [Sutherland](#source-20) — Lecture 7 §7.2, equation (1), p. 2.

<a id="FF3-point-count-certificate-sound"></a>

#### Soundness of point-count certificates

If c.check W = true (q odd, a₁ = a₃ = 0) then c.count W = naivePointCount W.

The hypotheses are as follows. F a finite field of odd characteristic W with a₁ = a₃ = 0 c.check W = true

A proof proceeds as follows. c^((q−1)/2) = −1 makes c a non-square (Euler's criterion, Mathlib FiniteField.isSquare_iff). If root(x)² = f(x) then χ(f(x)) = 0 or 1 according as f(x) = 0; if root(x)² = c f(x) ≠ f(x) then f(x) ≠ 0 and c f(x) is a square, so f(x) is a non-square and χ(f(x)) = −1 (Mathlib quadraticChar_neg_one_iff_not_isSquare). So ε_x = χ(f(x)) for every x; conclude by the character-sum formula.

In particular, verify the following values and consequences.

- The 𝔽₅ example: count 9 = naivePointCount.

*Needs:* [Point-count certificate](#FF3-point-count-certificate), [The point count as a character sum](#FF3-point-count-as-character-sum), `FiniteField.isSquare_iff`, `quadraticChar_neg_one_iff_not_isSquare`.

See [Sutherland](#source-20) — Lecture 7 §7.2, equation (1), p. 2.

<a id="FF3-point-count-certificate-complete"></a>

#### Completeness of point-count certificates

For q odd every W with a₁ = a₃ = 0 has a point-count certificate that checks.

The hypotheses are as follows. F a finite field of odd characteristic

A proof proceeds as follows. Choose a non-square c (Mathlib FiniteField.exists_nonsquare); for each x, f(x) or c f(x) is a square (the squares have index 2 in F^×; 0 is a square).

In particular, verify the following values and consequences.

- 𝔽₅: c = 2.

*Needs:* [Point-count certificate](#FF3-point-count-certificate), `FiniteField.exists_nonsquare`, `FiniteField.isSquare_iff`.

See [Sutherland](#source-20) — Lecture 7 §7.2, equation (1), p. 2.

<a id="FF3-weil-error-bound-for-hyperelliptic-counts"></a>

#### The Weil error bound for y² = f(x)

For q odd and f ∈ F[X] square-free of degree d ≥ 1: |#{(x, y) ∈ F² : y² = f(x)} − q| ≤ (d − 1)√q.

The hypotheses are as follows. F a finite field of odd characteristic f square-free, 1 ≤ deg f = d

A proof proceeds as follows. #{(x, y) : y² = f(x)} = q + Σ_x χ(f(x)) (Mathlib quadraticChar_card_sqrts, summed over x). f square-free of positive degree is not a constant times a square, so the Weil bound for the quadratic character ([Weil's bound |Σ χ(g(x))| ≤ (m − 1)√q when g is not a constant times an ord(χ)-th power](#FF2-weil-bound-multiplicative), with m = 2 and d distinct roots) gives |Σ_x χ(f(x))| ≤ (d − 1)√q.

In particular, verify the following values and consequences.

- d = 1: the count is exactly q.
- d = 3 recovers the affine form of Hasse's bound for elliptic curves.

*Needs:* [Weil's bound |Σ χ(g(x))| ≤ (m − 1)√q when g is not a constant times an ord(χ)-th power](#FF2-weil-bound-multiplicative), `quadraticChar_card_sqrts`.

See [Sutherland](#source-20) — Lecture 7 §7.2, equation (1), p. 2; [Sutherland](#source-20) — Lecture 7 §7.2, p. 2.

### 3.10 Schoof's algorithm


<a id="FF3-trace-modulo-two"></a>

#### The trace modulo 2

For q odd and W elliptic with a₁ = a₃ = 0: a_q = q + 1 − naivePointCount W is even iff f = weierstrassCubic W has a root in F iff gcd(X^q − X, f) ≠ 1.

The hypotheses are as follows. F a finite field of odd characteristic W elliptic, a₁ = a₃ = 0

A proof proceeds as follows. q + 1 is even, so 2 | a_q iff #W(F) is even. #W(F) even iff the finite abelian group W(F) has an element of order 2 (Cauchy, Mathlib exists_prime_orderOf_dvd_card for the additive group), iff some (x0, 0) is a point, iff f(x0) = 0 (a point has order 2 iff y = 0 when a₁ = a₃ = 0). f has a root in F iff gcd(X^q − X, f) ≠ 1 (gcd-with-frobenius-power with k = 1, f square-free as W is elliptic).

In particular, verify the following values and consequences.

- y² = x³ + x over 𝔽₃: f = X(X² + 1) has the root 0, #E = 4 and a₃ = 0 is even.

*Needs:* [Naive point count by enumeration](#existing-boundaries), [The cubic of a model in characteristic-not-two normal form](#FF3-weierstrass-cubic), [gcd(X^(q^k) − X, f) collects the factors of degree k](#FF3-gcd-with-frobenius-power), `exists_prime_orderOf_dvd_card`, `WeierstrassCurve.pointCount_eq_card_point`.

See [Sutherland](#source-20) — Lecture 8 §8.1, pp. 1-2; [Schoof](#source-21) — §5, p. 233.

<a id="FF3-trace-from-one-torsion-point"></a>

#### The trace modulo ℓ is read off one nonzero ℓ-torsion point

Let K ⊇ F be a field, t ∈ ℤ with π(π P) − t π(P) + q P = 0 for all P ∈ W(K) (π = frobeniusPointMap W K), ℓ prime, P ≠ 0 with ℓ P = 0, and c ∈ ℤ with π(π P) − c π(P) + q P = 0. Then c ≡ t (mod ℓ).

The hypotheses are as follows. F a finite field with q elements, K ⊇ F the Frobenius relation with trace t on all points ℓ prime P ≠ 0, ℓ P = 0 π² P − c π P + q P = 0

A proof proceeds as follows. Subtract the two relations: (c − t) π(P) = 0. π(P) ≠ 0 (π injective) and ℓ π(P) = π(ℓ P) = 0, so π(P) has order ℓ, which divides c − t.

In particular, verify the following values and consequences.

- With t = a_q from layer 3's relation, c ≡ a_q (mod ℓ).

*Needs:* [The q-power Frobenius on the points of a Weierstrass curve](#existing-boundaries).

See [Sutherland](#source-20) — Lecture 8, Lemma 8.2, p. 2.

<a id="FF3-schoof-representatives"></a>

#### Schoof's representatives of maps on ℓ-torsion points

For g ∈ F[X], a representative is r ∈ Option (F[X]/(g) × F[X]/(g)) (the abbreviation SchoofRep g): none stands for the zero map and some (a, b) for (x, y) ↦ (a(x), b(x) y). r represents α : W(K) → W(K) (SchoofRep.Represents W K r α) if for every nonsingular affine point (x, y) of W over K with g(x) = 0: α(x, y) = 0 when r = none, and α(x, y) is the affine point (a(x), b(x) y) when r = some (a, b), where a(x) is the evaluation of a at the root x of g (Mathlib AdjoinRoot.liftAlgHom).

The hypotheses are as follows. F a finite field g ∈ F[X] K a field extension of F W : WeierstrassCurve F

A proof proceeds as follows. Define the predicate by cases on r; evaluation at a root of g is the F-algebra map F[X]/(g) → K, [h] ↦ h(x).

Provide the following interface.

- `SchoofRep.represents_none_zero`: none represents the zero map.
- `SchoofRep.represents_id`: some (X, 1) represents the identity.
- `SchoofRep.represents_frobenius`: The Frobenius representative represents π (lemma node schoof-frobenius-representative-represents).
- `SchoofRep.Represents.add_of_isUnit`: Chord rule (lemma node schoof-chord-rule-represents-sum).
- `SchoofRep.Represents.add_neg`: Opposite representatives sum to the zero map (lemma node schoof-opposite-representatives).
- `SchoofRep.Represents.comp_frobenius`: Composition with π is the q-th power (lemma node schoof-composition-with-frobenius).

**Checks.**

- `schoofRep_none_represents_zero_only`: If some root of g is the x-coordinate of a point, none does not represent the identity.
- `schoofRep_represents_id_one`: (X, 1) represents the identity for g = X³ + X (and for every g).
- `schoofRep_represents_none_iff`: none represents α iff α vanishes at every point whose x-coordinate is a root of g.


In particular, verify the following values and consequences.

- The API items (promoted to lemma nodes where the algorithm needs them) and the unit tests.

*Needs:* `AdjoinRoot.liftAlgHom`, `WeierstrassCurve.Affine.Point`.

See [Sutherland](#source-20) — Lecture 8 §8.3, p. 3.

<a id="FF3-schoof-frobenius-representative"></a>

#### The representative of Frobenius

schoofFrobeniusRep W g = some (X^q mod g, f^((q−1)/2) mod g), f = weierstrassCubic W.

The hypotheses are as follows. F a finite field of odd characteristic W with a₁ = a₃ = 0 g ∈ F[X]

A proof proceeds as follows. Define the pair of classes in F[X]/(g).

Provide the following interface.

- `schoofFrobeniusRep`: schoofFrobeniusRep W g : SchoofRep g.
- `SchoofRep.represents_frobenius`: It represents frobeniusPointMap W K (lemma node).
- `schoofFrobeniusRep_eq_modByMonic`: For monic g, schoofFrobeniusRep W g = some ([X^q mod g], [f^((q−1)/2) mod g]): it depends only on the reductions modulo g.

**Checks.**

- `schoofFrobeniusRep_zmod_three`: For y² = x³ + x over 𝔽₃, g = X³ + X: (X³ mod g, (X³ + X) mod g) = (−X, 0).
- `schoofFrobeniusRep_one`: For g = 1 the quotient is trivial and schoofFrobeniusRep W 1 = some (0, 0).
- `schoofFrobeniusRep_ne_id`: For y² = x³ + x over 𝔽₃ and g = X² + 1, the Frobenius representative (−X, 0) is not the identity's (X, 1): Frobenius moves the points with x² = −1.


In particular, verify the following values and consequences.

- The unit tests; its representation property is a lemma node.

*Needs:* [Schoof's representatives of maps on ℓ-torsion points](#FF3-schoof-representatives), [The cubic of a model in characteristic-not-two normal form](#FF3-weierstrass-cubic), `AdjoinRoot.mk`.

See [Sutherland](#source-20) — Lecture 8 §8.3, equation (2), p. 3.

<a id="FF3-schoof-frobenius-representative-represents"></a>

#### The Frobenius representative represents Frobenius

For q odd, a₁ = a₃ = 0, any g and any K ⊇ F: schoofFrobeniusRep W g represents frobeniusPointMap W K.

The hypotheses are as follows. F of odd characteristic W with a₁ = a₃ = 0

A proof proceeds as follows. At a point (x, y) with g(x) = 0: π(x, y) = (x^q, y^q) (Mathlib Point.map_some along the q-power map). y^q = y (y²)^((q−1)/2) = y f(x)^((q−1)/2), and the class of X^q evaluates to x^q.

In particular, verify the following values and consequences.

- (x, y) = (0, 0) on y² = x³ + x: π fixes it and the representative gives (0^3, 0).

*Needs:* [The representative of Frobenius](#FF3-schoof-frobenius-representative), [The q-power Frobenius on the points of a Weierstrass curve](#existing-boundaries), `WeierstrassCurve.Affine.Point.map`.

See [Sutherland](#source-20) — Lecture 8 §8.3, equation (2), p. 3.

<a id="FF3-schoof-composition-with-frobenius"></a>

#### Composition with Frobenius is the q-th power

If some (a, b) represents α, then some (a^q, b^q · f^((q−1)/2)) represents α ∘ π (powers in F[X]/(g)).

The hypotheses are as follows. F of odd characteristic W with a₁ = a₃ = 0 some (a, b) represents α

A proof proceeds as follows. For a = [h], h(x^q) = h(x)^q since the coefficients lie in F (FiniteField.frobeniusAlgHom is an F-algebra map), so [h(X^q)] = [h]^q in F[X]/(g). π maps the points with g(x) = 0 to points with g(x^q) = g(x)^q = 0, so the representation hypothesis applies at π(P); combine with the Frobenius representative (Sutherland's composition rule).

In particular, verify the following values and consequences.

- π ∘ π is represented by (X^(q²), f^((q²−1)/2)).

*Needs:* [The Frobenius representative represents Frobenius](#FF3-schoof-frobenius-representative-represents), `FiniteField.frobeniusAlgHom`.

See [Sutherland](#source-20) — Lecture 8 §8.3.1, p. 3.

<a id="FF3-schoof-chord-rule"></a>

#### The chord rule on Schoof representatives

For p1 = (a1, b1), p2 = (a2, b2) in (F[X]/(g))², schoofChordRep W p1 p2 = (a3, r (a1 − a3) − b1) with r = (b1 − b2)(a1 − a2)⁻¹ and a3 = r² f − a₂ − a1 − a2 (a₂ the curve coefficient); it is Mathlib's addX/addY with slope r y when a₁ = a₃ = 0, meaningful when a1 − a2 is a unit.

The hypotheses are as follows. F a field W with a₁ = a₃ = 0 g ∈ F[X]

A proof proceeds as follows. Define with Ring.inverse; when a1 − a2 is not a unit the algorithm instead splits g by gcd (Sutherland §8.3.2).

Provide the following interface.

- `schoofChordRep`: schoofChordRep W p1 p2 : (F[X]/(g))².
- `SchoofRep.Represents.add_of_isUnit`: If a1 − a2 is a unit it represents the sum (lemma node).
- `schoofChordRep_fst`: (schoofChordRep W p1 p2).1 = r² f − a₂ − a1 − a2 with r = (b1 − b2)(a1 − a2)⁻¹.

**Checks.**

- `schoofChordRep_comm`: When a1 − a2 is a unit, schoofChordRep W p1 p2 and schoofChordRep W p2 p1 have the same first component (the chord through two points is symmetric).
- `schoofChordRep_not_unit`: If a1=a2 the total inverse is zero and the chord formula degenerates. It need not represent the sum: on E/F5:y²=x³+x+1, P=(0,1) doubles to (4,2), whereas the chord expression gives (0,4). Tangent/opposite branches must be used instead.
- `schoofChordRep_zero_g`: For g = 1 the ring F[X]/(1) is trivial and every representative is zero.


In particular, verify the following values and consequences.

- Its representation property is a lemma node.

*Needs:* [Schoof's representatives of maps on ℓ-torsion points](#FF3-schoof-representatives), [The cubic of a model in characteristic-not-two normal form](#FF3-weierstrass-cubic), `Ring.inverse`, `WeierstrassCurve.Affine.addX`, `WeierstrassCurve.Affine.addY`.

See [Sutherland](#source-20) — Lecture 8 §8.3.2, pp. 3-4.

<a id="FF3-schoof-chord-rule-represents-sum"></a>

#### The chord rule represents the sum

If some p1 represents α1, some p2 represents α2, and a1 − a2 is a unit in F[X]/(g), then some (schoofChordRep W p1 p2) represents P ↦ α1(P) + α2(P).

The hypotheses are as follows. W with a₁ = a₃ = 0 p1, p2 represent α1, α2 IsUnit (a1 − a2)

A proof proceeds as follows. At a point with g(x) = 0, a1(x) − a2(x) ≠ 0 (a unit evaluates to a unit), so α1(P) and α2(P) have different x-coordinates and Mathlib's add_of_X_ne gives the sum by the chord formula with slope (b1(x) − b2(x)) y/(a1(x) − a2(x)). Its square is r(x)² y² = r(x)² f(x), giving the representative's x-coordinate; the y-coordinate likewise.

In particular, verify the following values and consequences.

- Used for π² + q̄ and for c π in Algorithm 8.3.

*Needs:* [The chord rule on Schoof representatives](#FF3-schoof-chord-rule), `WeierstrassCurve.Affine.Point.add_of_X_ne`, `WeierstrassCurve.Affine.slope`.

See [Sutherland](#source-20) — Lecture 8 §8.3.2, pp. 3-4.

<a id="FF3-schoof-opposite-representatives"></a>

#### Opposite representatives sum to zero

If some (a, b) represents α1 and some (a, −b) represents α2 (a₁ = a₃ = 0), then none represents P ↦ α1(P) + α2(P).

The hypotheses are as follows. W with a₁ = a₃ = 0

A proof proceeds as follows. At each point the two values are (x′, y′) and (x′, −y′), opposite points (negY = −y when a₁ = a₃ = 0), whose sum is 0 (Mathlib add_of_Y_eq).

In particular, verify the following values and consequences.

- Detects c π = −(π² + q̄), i.e. the zero map in the search.

*Needs:* [Schoof's representatives of maps on ℓ-torsion points](#FF3-schoof-representatives), `WeierstrassCurve.Affine.Point.add_of_Y_eq`.

See [Sutherland](#source-20) — Lecture 8 §8.3.2, pp. 3-4.

<a id="FF3-separability-of-division-polynomials"></a>

#### The ℓ-division polynomial is separable for ℓ ∤ q

Let W be elliptic over F, K ⊇ F algebraically closed, ℓ an odd prime with ℓ ≠ char F. If #W(K)[ℓ] = ℓ² (EllipticCurves layer 2: W(K)[ℓ] ≃ (ℤ/ℓ)²), then preΨ_ℓ (Mathlib's ℓ-division polynomial, a polynomial in x for odd ℓ) is separable.

The hypotheses are as follows. W elliptic over F K algebraically closed containing F ℓ odd prime, (ℓ : F) ≠ 0 #W(K)[ℓ] = ℓ²

A proof proceeds as follows. For odd ℓ, Mathlib's Ψ_ℓ = C preΨ_ℓ, and on the curve ψ_ℓ(x, y) = Ψ_ℓ(x, y) = preΨ_ℓ(x) (Tau Ceti evalEval_ψ_eq_evalEval_Ψ); a nonzero affine point P = (x, y) satisfies ℓ P = 0 iff preΨ_ℓ(x) = 0 (Tau Ceti zsmul_eq_zero_of_evalEval_ψ_eq_zero and evalEval_ψ_eq_zero_of_zsmul_eq_zero). The ℓ² − 1 nonzero ℓ-torsion points come in pairs ±P with distinct y (y ≠ 0 since 2 ∤ ℓ), giving (ℓ² − 1)/2 distinct roots of preΨ_ℓ in K. deg preΨ_ℓ = (ℓ² − 1)/2 with leading coefficient ℓ ≠ 0 (Mathlib natDegree_preΨ, leadingCoeff_preΨ), so all roots are simple.

In particular, verify the following values and consequences.

- ℓ = 3: preΨ_3 = Ψ₃ = 3x⁴ + b₂x³ + 3b₄x² + 3b₆x + b₈ has 4 distinct roots.

*Needs:* `WeierstrassCurve.Ψ`, `WeierstrassCurve.evalEval_ψ_eq_evalEval_Ψ`, `WeierstrassCurve.natDegree_preΨ`, `WeierstrassCurve.leadingCoeff_preΨ`, `WeierstrassCurve.zsmul_eq_zero_of_evalEval_ψ_eq_zero`, `WeierstrassCurve.evalEval_ψ_eq_zero_of_zsmul_eq_zero`.

**Native roadmap interfaces:** `TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`.

See [Sutherland](#source-20) — Lecture 8, Algorithm 8.3 and its correctness, pp. 4-5; [Sutherland](#source-20) — Lecture 8 §8.5, p. 5.

<a id="FF3-schoof-trace-modulo-prime-algorithm"></a>

#### Algorithm 8.3: the trace modulo an odd prime ℓ

schoofTraceModPrime W ℓ : Option (ZMod ℓ) is Sutherland's Algorithm 8.3 for q odd, a₁ = a₃ = 0 and an odd prime ℓ ∤ q: with h = preΨ_ℓ, compute the representatives π_ℓ, π_ℓ² and π_ℓ² + q̄ (q̄ = q mod ℓ, by double-and-add with the chord and tangent rules), then 0, π_ℓ, 2π_ℓ, …, until c π_ℓ = π_ℓ² + q̄ for some c < ℓ, and return c; whenever a denominator is not a unit, replace h by the factor gcd(v, h) or h/gcd(v, h) of smaller degree and restart; return none if no c < ℓ is found.

The hypotheses are as follows. F a finite field of odd characteristic W with a₁ = a₃ = 0 ℓ : ℕ

A proof proceeds as follows. Define by recursion on deg h (each restart at least halves deg h) with an inner search over c < ℓ. Specify every addition branch within this target-level algorithm: none is the zero map; opposite representatives sum to none; use the chord when x-coordinates differ and the denominator is a unit. For equal non-opposite representatives use r=(3a²+2W.a₂a+W.a₄)/(2b f) and output (r²f−W.a₂−2a, r(a−a3)−b). Split by a proper gcd if coefficients/denominators have mixed zero/nonzero behavior on the roots; choose the smaller positive-degree factor and restart. Since odd ℓ-torsion contains no nonzero 2-torsion, h is coprime to f. Thus the tangent denominator is nonzero for nonzero affine branches. This is Sutherland’s tangent rule with the extra a₂ term of the pinned general characteristic-not-two normal form. Soundness and completeness are theorem nodes.

Provide the following interface.

- `schoofTraceModPrime_sound`: A returned value is a_q mod ℓ (theorem node).
- `schoofTraceModPrime_isSome`: It returns a value when preΨ_ℓ is separable (theorem node).
- `schoofTraceModPrime`: schoofTraceModPrime W ℓ : Option (ZMod ℓ).

**Checks.**

- `schoofTraceModPrime_x_cubed_add_x_add_one_three`: For y² = x³ + x + 1 over 𝔽₅ (a₅ = −3), schoofTraceModPrime W 3 = some 0.
- `schoofTraceModPrime_x_cubed_add_x_add_one_seven`: For y² = x³ + x + 1 over 𝔽₅, schoofTraceModPrime W 7 = some 4 (−3 ≡ 4 mod 7).
- `schoofTraceModPrime_char`: Over 𝔽₅ the 5-division polynomial of y² = x³ + x + 1 has degree < 12 = (5² − 1)/2: for ℓ = char F the degree formula fails, which is why Algorithm 8.3 requires ℓ ∤ q.


In particular, verify the following values and consequences.

- Unit tests below.

*Needs:* [Schoof's representatives of maps on ℓ-torsion points](#FF3-schoof-representatives), [The representative of Frobenius](#FF3-schoof-frobenius-representative), [The chord rule on Schoof representatives](#FF3-schoof-chord-rule), [The ℓ-division polynomial is separable for ℓ ∤ q](#FF3-separability-of-division-polynomials), `WeierstrassCurve.preΨ`.

See [Sutherland](#source-20) — Lecture 8, Algorithm 8.3, p. 4; [Sutherland](#source-20) — Lecture 8, Algorithm 8.3 and its correctness, pp. 4-5.

<a id="FF3-schoof-trace-modulo-prime-sound"></a>

#### Soundness of Algorithm 8.3

For q odd, W elliptic with a₁ = a₃ = 0, ℓ an odd prime with ℓ ∤ q, and K ⊇ F algebraically closed: if schoofTraceModPrime W ℓ = some c then c = a_q mod ℓ.

The hypotheses are as follows. F of odd characteristic W elliptic, a₁ = a₃ = 0 ℓ odd prime, (ℓ : F) ≠ 0 the Frobenius relation of layer 3 on W(K)

A proof proceeds as follows. Every computed representative represents the intended map on the points with h(x) = 0 (Frobenius, composition, chord, opposite and tangent lemmas; restarting with a factor of h restricts the set of points). Tangency is the explicit equal-point branch in the algorithm node, justified by Point.add_self_of_Y_ne and Affine.slope_of_Y_ne at the pin, not by an unstated tangent lemma. The final h has positive degree, so it has a root x0 ∈ K; with y0² = f(x0) the point P = (x0, y0) is nonsingular (W elliptic) and nonzero with ℓP = 0 (h | preΨ_ℓ and Tau Ceti's zsmul_eq_zero_of_evalEval_ψ_eq_zero). The returned c satisfies π²(P) − c π(P) + q P = 0 (q̄ P = q P as ℓ P = 0); by the torsion-point lemma and layer 3's relation with trace a_q, c ≡ a_q (mod ℓ).

In particular, verify the following values and consequences.

- y² = x³ + x + 1 over 𝔽₅, ℓ = 3: c = 0 ≡ −3.

*Needs:* [Algorithm 8.3: the trace modulo an odd prime ℓ](#FF3-schoof-trace-modulo-prime-algorithm), [The trace modulo ℓ is read off one nonzero ℓ-torsion point](#FF3-trace-from-one-torsion-point), [The Frobenius representative represents Frobenius](#FF3-schoof-frobenius-representative-represents), [Composition with Frobenius is the q-th power](#FF3-schoof-composition-with-frobenius), [The chord rule represents the sum](#FF3-schoof-chord-rule-represents-sum), [Opposite representatives sum to zero](#FF3-schoof-opposite-representatives), `WeierstrassCurve.zsmul_eq_zero_of_evalEval_ψ_eq_zero`, `WeierstrassCurve.evalEval_ψ_eq_evalEval_Ψ`, `WeierstrassCurve.Affine.equation_iff_nonsingular`, `WeierstrassCurve.Affine.Point.add_self_of_Y_ne`, `WeierstrassCurve.Affine.slope_of_Y_ne`.

**Native roadmap interfaces:** `TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

See [Sutherland](#source-20) — Lecture 8, Algorithm 8.3 and its correctness, pp. 4-5; [Sutherland](#source-20) — Lecture 8, Lemma 8.2, p. 2.

<a id="FF3-schoof-trace-modulo-prime-complete"></a>

#### Completeness of Algorithm 8.3

Under the hypotheses of soundness, if preΨ_ℓ is separable then schoofTraceModPrime W ℓ returns a value.

The hypotheses are as follows. as for soundness preΨ_ℓ separable (a consequence of layer 2, node separability-of-division-polynomials)

A proof proceeds as follows. For c = a_q mod ℓ the two maps c π and π² + q̄ agree on every point with h(x) = 0 (layer 3's relation). Two representatives that agree at every root of a separable h (in K) are equal modulo h (a polynomial vanishing at all the distinct roots of the square-free h is divisible by h); hence the equality test succeeds at c = a_q mod ℓ < ℓ. This requires cancellation of y0 in the second coordinate: every root is the x-coordinate of a nonzero odd-ℓ torsion point, so y0≠0 (otherwise it is 2-torsion, hence zero by coprimality of 2 and ℓ). Thus h and the cubic f are coprime. The claim is not made for an arbitrary square-free h intersecting 2-torsion. An affine representative and none cannot agree at such a root.

In particular, verify the following values and consequences.

- y² = x³ + x + 1 over 𝔽₅, ℓ = 3.

*Needs:* [Algorithm 8.3: the trace modulo an odd prime ℓ](#FF3-schoof-trace-modulo-prime-algorithm), [Soundness of Algorithm 8.3](#FF3-schoof-trace-modulo-prime-sound), [The ℓ-division polynomial is separable for ℓ ∤ q](#FF3-separability-of-division-polynomials).

**Native roadmap interfaces:** `TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`.

See [Sutherland](#source-20) — Lecture 8, Algorithm 8.3 and its correctness, pp. 4-5.

<a id="FF3-trace-reconstruction-from-residues"></a>

#### Reconstruction of the trace from its residues

If t, t′ ∈ ℤ satisfy t² ≤ 4q, t′² ≤ 4q, t ≡ t′ (mod M) and M² > 16q, then t = t′. Hence the symmetric residue of a_q modulo M = ∏ ℓ > 4√q is a_q.

The hypotheses are as follows. q, M ∈ ℕ t² ≤ 4q, t′² ≤ 4q 16q < M² t ≡ t′ (mod M)

A proof proceeds as follows. |t − t′| ≤ 4√q < M and M | t − t′, so t = t′.

In particular, verify the following values and consequences.

- For q=5, M=6<4√5≈8.9 does not satisfy the sufficient reconstruction guard; M=30 does.

*Needs:* `Int.eq_of_mod_eq_of_natAbs_sub_lt_natAbs`, `Int.ModEq.eq`.

See [Sutherland](#source-20) — Lecture 8, after Algorithm 8.1, p. 1.

<a id="FF3-schoof-algorithm"></a>

#### Schoof's algorithm

schoofPointCount W : ℤ is Sutherland's Algorithm 8.1 for q odd and a₁ = a₃ = 0: t₂ from gcd(X^q − X, f); for odd primes ℓ ∤ q in increasing order, t_ℓ = schoofTraceModPrime W ℓ, combined by the Chinese remainder theorem into t mod M until M = ∏ ℓ > 4√q; t is the symmetric residue; the output is q + 1 − t.

The hypotheses are as follows. F a finite field of odd characteristic W with a₁ = a₃ = 0

A proof proceeds as follows. Define by iterating over primes (Mathlib's Nat.primeFactors/Nat.Prime search) with the CRT update of Sutherland step 2b. Correctness is the node schoof-algorithm-correct.

Provide the following interface.

- `schoofPointCount`: schoofPointCount W : ℤ.
- `schoofPointCount_eq`: schoofPointCount W = naivePointCount W (theorem node schoof-algorithm-correct).
- `schoofPointCount_eq_card_point`: Under the same hypotheses, schoofPointCount W = Nat.card W.toAffine.Point (Mathlib's point type), and q + 1 − schoofPointCount W = Tau Ceti's frobeniusTrace W.

**Checks.**

- `schoofPointCount_x_cubed_add_x_add_one_zmod_five`: For y² = x³ + x + 1 over 𝔽₅, schoofPointCount = 9.
- `schoofPointCount_zmod_seven`: For y² = x³ + 2x + 3 over 𝔽₇, schoofPointCount = 6.
- `schoofPointCount_in_hasse_interval`: For elliptic W, (q + 1 − schoofPointCount W)² ≤ 4q.


In particular, verify the following values and consequences.

- The unit tests.

*Needs:* [The trace modulo 2](#FF3-trace-modulo-two), [Algorithm 8.3: the trace modulo an odd prime ℓ](#FF3-schoof-trace-modulo-prime-algorithm), [Reconstruction of the trace from its residues](#FF3-trace-reconstruction-from-residues), `Nat.Prime`.

See [Sutherland](#source-20) — Lecture 8, Algorithm 8.1, p. 1; [Schoof](#source-21) — §5, pp. 233-235.

<a id="FF3-schoof-algorithm-correct"></a>

#### Correctness of Schoof's algorithm

For q odd and W elliptic with a₁ = a₃ = 0: schoofPointCount W = naivePointCount W (= pointCount W); equivalently the algorithm returns a_q = frobeniusTrace W exactly.

The hypotheses are as follows. F of odd characteristic W elliptic, a₁ = a₃ = 0

A proof proceeds as follows. t₂ correct (trace modulo 2); each t_ℓ returned and correct (soundness and completeness, with separability from layer 2 and the Frobenius relation from layer 3). The CRT invariant t ≡ a_q (mod M) holds throughout (Sutherland step 2b). With M > 4√q and a_q² ≤ 4q (Hasse, layer 3), the reconstruction lemma gives t = a_q.

In particular, verify the following values and consequences.

- y² = x³ + x + 1 over 𝔽₅: 9.

*Needs:* [Schoof's algorithm](#FF3-schoof-algorithm), [The trace modulo 2](#FF3-trace-modulo-two), [Soundness of Algorithm 8.3](#FF3-schoof-trace-modulo-prime-sound), [Completeness of Algorithm 8.3](#FF3-schoof-trace-modulo-prime-complete), [Reconstruction of the trace from its residues](#FF3-trace-reconstruction-from-residues), [The ℓ-division polynomial is separable for ℓ ∤ q](#FF3-separability-of-division-polynomials).

**Native roadmap interfaces:** `TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`.

See [Sutherland](#source-20) — Lecture 8, Algorithm 8.1, p. 1; [Sutherland](#source-20) — Lecture 8, after Algorithm 8.1, p. 1; [Schoof](#source-21) — §5, pp. 233-235.

### 3.11 Costs

<a id="FF3-square-free-decomposition-algorithm-cost"></a>

#### Cost of Algorithm SFD

On a monic input of degree ℓ over F with q = p^w, Algorithm SFD performs O(ℓ² + ℓ(w − 1) len(p)/p) operations in F, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction); every loop terminates, the outer loop after at most ⌊log_p ℓ⌋ + 1 passes.

The hypotheses are as follows. F a finite field with q = p^w elements f monic of degree ℓ ≥ 1

A proof proceeds as follows. First pass: computing f/gcd(f, f') costs O(ℓ²) (Euclid, Shoup Theorem 17.3); the j-th inner iteration costs O(ℓ Σ_{i∈S, ei≥j} deg fi), and summing over j gives O(ℓ Σ ei deg fi) = O(ℓ²). A p-th root costs O(ℓ(w − 1) len(p)/p): the coefficient a ↦ a^(p^(w−1)) by repeated squaring, for the ℓ/p coefficients. Pass t works on a polynomial of degree ≤ ℓ/p^(t−1); sum the geometric series. Polynomial arithmetic costs are CN.0's (requested).

In particular, verify the following values and consequences.

- Statement in the CN.0 model; no Lean prototype until CN.0 fixes the model.

*Needs:* [Algorithm SFD](#FF3-square-free-decomposition-algorithm), [Correctness of Algorithm SFD](#FF3-square-free-decomposition-algorithm-correct), `ComputationalNumberTheory:CN.0`.

See [Shoup](#source-1) — Theorem 20.5 and its proof, printed pp. 528-530.

<a id="FF3-distinct-degree-factorization-algorithm-cost"></a>

#### Cost of Algorithm DDF

On a monic square-free input of degree ℓ, Algorithm DDF performs O(ℓ³ len(q)) operations in F, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction); its main loop runs at most ℓ times.

The hypotheses are as follows. F a finite field with q elements f monic, square-free, of degree ℓ ≥ 1

A proof proceeds as follows. At most ℓ iterations; each q-th powering costs O(len(q)) multiplications modulo f, i.e. O(ℓ² len(q)) operations (Shoup §17.1); each gcd and division costs O(ℓ²) (Theorem 17.3). Polynomial arithmetic costs are CN.0's (requested).

In particular, verify the following values and consequences.

- Statement in the CN.0 model.

*Needs:* [Algorithm DDF](#FF3-distinct-degree-factorization-algorithm), [Correctness of Algorithm DDF](#FF3-distinct-degree-factorization-algorithm-correct), `ComputationalNumberTheory:CN.0`.

See [Shoup](#source-1) — Theorem 20.6 and its proof, printed p. 531.

<a id="FF3-irreducibility-test-cost"></a>

#### Cost of Algorithm IPT

On a monic input of degree ℓ, Algorithm IPT performs O(ℓ³ len(q)) operations in F, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction); with the standard presentations of Layer 0 this is O(ℓ³ len(q)³) bit operations.

The hypotheses are as follows. F a finite field with q elements f monic of degree ℓ ≥ 1

A proof proceeds as follows. ⌊ℓ/2⌋ iterations, each a q-th powering modulo f (O(ℓ² len(q))) and a gcd (O(ℓ²)). Each operation in F costs O(len(q)²) bit operations for the Layer 0 presentations (CN.0).

In particular, verify the following values and consequences.

- Statement in the CN.0 model.

*Needs:* [Algorithm IPT, the irreducibility test](#FF3-irreducibility-test), [Correctness of Algorithm IPT](#FF3-irreducibility-test-correct), `ComputationalNumberTheory:CN.0`, [Certified presentation of a finite field](#FF0-certified-presentation-of-a-finite-field).

See [Shoup](#source-1) — Theorem 20.1, printed p. 523.

<a id="FF3-rabin-certificate-generation-cost"></a>

#### Cost of generating and of checking a Rabin certificate

For f monic of degree ℓ, generating the certificate costs O(ℓ³ len(q)) operations in F and checking the generated degree-bounded certificate costs O(ℓ³ len(q)) operations, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction); checking replaces the ω(ℓ) gcd computations of the test by ω(ℓ) products and one comparison each.

The hypotheses are as follows. F a finite field with q elements f monic of degree ℓ ≥ 1 The checking bound is for generated certificates (or explicitly degree-bounded witnesses of degree O(ℓ)); arbitrary equivalent Bézout witnesses can be arbitrarily long and require a certificate-size-dependent bound.

A proof proceeds as follows. ℓ successive q-th powerings modulo f cost O(ℓ³ len(q)) (Shoup Theorem 20.1's count); ω(ℓ) ≤ log₂ ℓ extended Euclid calls cost O(ℓ²) each (Theorem 17.5). Checking recomputes the same powers and ω(ℓ) products of degree < 2ℓ, O(ℓ²) each.

In particular, verify the following values and consequences.

- Statement in the CN.0 model.

*Needs:* [Generating a Rabin irreducibility certificate](#FF3-rabin-certificate-generation), [The generated Rabin certificate checks](#FF3-rabin-certificate-generation-correct), `ComputationalNumberTheory:CN.0`.

See [Shoup](#source-1) — Theorem 20.1, printed p. 523; [Shoup](#source-1) — Exercise 20.2, printed pp. 524-525.

<a id="FF3-equal-degree-factorization-cost"></a>

#### Expected cost of Algorithm EDF

Algorithm EDF on f of degree ℓ with r = ℓ/k factors of degree k uses an expected number of O(k ℓ² len(q)) operations in F, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction); each round costs O(k ℓ² len(q)).

The hypotheses are as follows. F a finite field with q elements f monic, square-free, all irreducible factors of degree k The EDF specification is for 0<deg f and k≥1; f=1 is handled by the surrounding full factorization algorithm, not by the singleton-initialized EDF round law.

A proof proceeds as follows. A round computes M_k(a mod h) for every h ∈ H by repeated squaring: O(k deg(h)² len(q)) each, O(k ℓ² len(q)) in total. Finer count (Shoup, proof of Theorem 20.7): with S = Σ_n Σ_{h∈H_n} ω(h)², the cost is O(S k³ len(q)) and E[S] = Σ_{i≠j} E[L_ij] + r E[L] = O(r²), using E[L_ij] ≤ 2 (q even) or ≤ 9/4 (q odd) and the expected-rounds node. Polynomial arithmetic costs and the expected-cost semantics are CN.0's (requested).

In particular, verify the following values and consequences.

- Statement in the CN.0 model.

*Needs:* [Algorithm EDF (equal-degree factorization) as a round distribution](#FF3-equal-degree-factorization-algorithm), [Expected number of rounds of Algorithm EDF](#FF3-equal-degree-factorization-expected-rounds), [Failure probability of Algorithm EDF](#FF3-equal-degree-factorization-failure-bound), `ComputationalNumberTheory:CN.0`.

See [Shoup](#source-1) — Theorem 20.7 and its proof, printed pp. 534-535; [Shoup](#source-1) — Theorem 20.8, printed p. 536.

<a id="FF3-cantor-zassenhaus-cost"></a>

#### Expected cost of the Cantor–Zassenhaus algorithm

The Cantor–Zassenhaus algorithm (run until every block is finished) on a monic input of degree ℓ over F uses an expected number of O(ℓ³ len(q)) operations in F, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction); with the standard presentations of Layer 0, O(ℓ³ len(q)³) expected bit operations.

The hypotheses are as follows. F a finite field with q elements f monic of degree ℓ ≥ 1

A proof proceeds as follows. SFD O(ℓ² + ℓ(w − 1)len(p)/p), DDF O(ℓ³ len(q)), and EDF on blocks of degrees ℓ_i with Σ ℓ_i ≤ ℓ: O(Σ ℓ_i³ len(q)) = O(ℓ³ len(q)). Each operation in F is O(len(q)²) bit operations for the Layer 0 presentations (CN.0).

In particular, verify the following values and consequences.

- Statement in the CN.0 model.

*Needs:* [The Cantor–Zassenhaus algorithm](#FF3-cantor-zassenhaus-algorithm), [Cost of Algorithm SFD](#FF3-square-free-decomposition-algorithm-cost), [Cost of Algorithm DDF](#FF3-distinct-degree-factorization-algorithm-cost), [Expected cost of Algorithm EDF](#FF3-equal-degree-factorization-cost), `ComputationalNumberTheory:CN.0`, [Certified presentation of a finite field](#FF0-certified-presentation-of-a-finite-field).

See [Shoup](#source-1) — §20.4.3, Theorem 20.9, printed pp. 536-537.

<a id="FF3-berlekamp-algorithm-cost"></a>

#### Cost of Berlekamp's algorithm

Algorithm B1 uses O(ℓ³ + ℓ² len(q)) operations in F; Algorithm B2 uses an expected O(len(r) ℓ² len(q)); Berlekamp's algorithm uses an expected O(ℓ³ + ℓ² len(ℓ) len(q)) operations in F, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction).

The hypotheses are as follows. F a finite field with q elements f monic of degree ℓ

A proof proceeds as follows. B1: X^q mod f by repeated squaring O(ℓ² len(q)); ℓ further multiplications for the rows O(ℓ³); Gaussian elimination O(ℓ³) (CN.0, Shoup §14.4). B2: each round O(ℓ² len(q)); expected rounds O(len(r)) as for EDF (pair failure ≤ 5/9). Add SFD; costs in CN.0's model (requested).

In particular, verify the following values and consequences.

- Statement in the CN.0 model.

*Needs:* [Berlekamp's factoring algorithm](#FF3-berlekamp-algorithm), [Las Vegas correctness of Berlekamp's algorithm](#FF3-berlekamp-algorithm-correct), [Failure probability of Algorithm B2](#FF3-berlekamp-splitting-failure-bound), [Cost of Algorithm SFD](#FF3-square-free-decomposition-algorithm-cost), `ComputationalNumberTheory:CN.0`.

See [Shoup](#source-1) — Theorem 20.10, printed p. 540; [Shoup](#source-1) — Theorems 20.11 and 20.12, printed p. 542.

<a id="FF3-random-irreducible-polynomial-cost"></a>

#### Expected cost of Algorithm RIP

Algorithm RIP uses an expected number of O(ℓ⁴ len(q)) operations in F, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction).

The hypotheses are as follows. F a finite field with q elements ℓ ≥ 1

A proof proceeds as follows. Generate-and-test (Shoup Theorem 9.3 (ii), requested from CN.0): expected cost = cost of one attempt × expected attempts = O(ℓ³ len(q)) · O(ℓ).

In particular, verify the following values and consequences.

- Statement in the CN.0 model.

*Needs:* [Algorithm RIP (random irreducible polynomial) as an attempt distribution](#FF3-random-irreducible-polynomial-algorithm), [Expected number of attempts of Algorithm RIP](#FF3-random-irreducible-polynomial-attempts), [Cost of Algorithm IPT](#FF3-irreducibility-test-cost), `ComputationalNumberTheory:CN.0`.

See [Shoup](#source-1) — §20.1, Algorithm RIP and Theorem 20.2, printed pp. 523-524; [Shoup](#source-1) — Theorem 9.3 and Example 9.10, printed pp. 288-289.

<a id="FF3-hensel-lifting-algorithm-cost"></a>

#### Cost of linear Hensel lifting

Lifting a factorization f ≡ g0 h0 (mod p) with deg f = n from p to p^k by the linear algorithm uses one extended Euclidean computation in 𝔽_p[X] (O(n²) operations in 𝔽_p) and O(k n²) operations in ℤ/p^kℤ, in the algebraic cost model of ComputationalNumberTheory CN.0 over ℤ/p^kℤ; hence O(k n² len(p^k)²) bit operations.

The hypotheses are as follows. p prime, k ≥ 1 f monic of degree n over ℤ/p^k The initial monic factors g0,h0 have coprime reductions and product f mod p, and their degrees sum to n; Bézout inputs and intermediate representatives are reduced to the stated degree bounds.

A proof proceeds as follows. Bézout coefficients modulo p: extended Euclid (Shoup Theorem 17.5). Each of the k − 1 steps: one product g h, products t e and s e, one division by the monic g, all of degrees ≤ 2n: O(n²) ring operations (Shoup Theorem 17.1). Each ring operation in ℤ/p^k costs O(len(p^k)²) bit operations (Shoup §3.4).

In particular, verify the following values and consequences.

- Statement in the CN.0 model; Milne gives no cost, the count is the direct count of the construction's operations.

*Needs:* [The linear Hensel lifting algorithm](#FF3-hensel-lifting-algorithm), `ComputationalNumberTheory:CN.0`.

See [Milne](#source-19) — Remark 7.37, p. 123; [Shoup](#source-1) — Theorem 17.1, printed p. 466.

<a id="FF3-naive-point-count-cost"></a>

#### Cost of naive and of certified counting

naivePointCount by enumeration uses O(q²) operations in F; with a table of squares, O(q) operations in F; checking a point-count certificate uses O(q + len(q)) operations in F, in the algebraic cost model of ComputationalNumberTheory CN.0 over F (unit cost for each of +, -, x, inversion of a nonzero element, the equality test, and drawing a uniformly random element of F; Shoup's 'operations in F', Chapter 20 introduction).

The hypotheses are as follows. F a finite field with q elements W with a₁ = a₃ = 0 for the certificate

A proof proceeds as follows. q² evaluations of the equation (Sutherland §7.3). A table of the q squares, then q look-ups (Sutherland §7.3). Checker: one exponentiation c^((q−1)/2) by repeated squaring (O(len(q))) and 2q multiplications.

In particular, verify the following values and consequences.

- Statement in the CN.0 model.

*Needs:* [Naive point count by enumeration](#existing-boundaries), [Point-count certificate](#FF3-point-count-certificate), `ComputationalNumberTheory:CN.0`.

See [Sutherland](#source-20) — Lecture 7 §7.3, p. 3; [Sutherland](#source-20) — Lecture 7 §7.3, p. 3.

<a id="schoof-auxiliary-prime-cutoff"></a>

#### A logarithmic auxiliary-prime cutoff for Schoof

There is an absolute C>0 such that, for every integer q≥2 and prime p≤q, some integer L≤C log q has P(L,p)²>16q, where P(L,p) is the product of all primes ℓ≤L with ℓ≠2,p. Consequently these O(log q) permitted primes suffice for the uniqueness interval |t|≤2√q. The constant is independent of p and q; empty products use value 1.

Use Mathlib's existing Chebyshev lower bound θ(L)≥L log2−log(L+1)−2√L log L and θ(L)=log(primorial L). Their error is o(L), so θ(L)≥cL for some c>0 and all sufficiently large L. Removing 2 and p subtracts at most log2+log q, even if p exceeds L. Choose L to be the ceiling of A log q with cA>2. This makes log P(L,p)>log4+(log q)/2 for large q; enlarge the absolute constant to cover the finitely many smaller q. Only the cutoff consequence, including its exclusions, is new here.

**Checks.** For q=2,p=2, L=5 gives P=15 and P²=225>32. For q=3,p=3, L=7 gives P=35 and P²=1225>48. For q=5,p=5, L=7 gives P=21 and P²=441>80. Omitting p is essential for the torsion-coordinate computation, and using all primes up to q would lose the required logarithmic cutoff.

*Needs:* Mathlib `Chebyshev.theta_ge`, `Chebyshev.theta_eq_log_primorial`, `Nat.primorial`, finite prime products and elementary logarithmic asymptotics.

See [Shoup](#source-1), §5.1, Theorems 5.4–5.7, pp. 106–108, for the elementary prime-growth proof; [Schoof](#source-21), §5, pp. 233–235, for the auxiliary-prime use. The passage excluding two primes is the calculation above.

<a id="FF3-schoof-algorithm-cost"></a>

#### Cost of Schoof's algorithm

Over a prime field 𝔽_p, Schoof's algorithm uses O(log⁸ p) bit operations with schoolbook multiplication (Schoof 1995, §5); over 𝔽_q with q odd its running time is bounded by a polynomial in log q (Sutherland Lecture 8 §8.4): O(log q) primes ℓ = O(log q) are used, and Algorithm 8.3 works with polynomials of degree < ℓ² over F; costs in the model of ComputationalNumberTheory CN.0.

The hypotheses are as follows. q odd W elliptic, a₁ = a₃ = 0

A proof proceeds as follows. Number of primes: Π_{ℓ ≤ L, ℓ prime, ℓ≠2,char(F)} ℓ > 4√q for L = O(log q) (Chebyshev's bound, a weak prime number theorem). Use the auxiliary-prime consequence below of Mathlib Chebyshev.theta_ge and theta_eq_log_primorial; its exclusions are ℓ=2 and ℓ=char(F). The operational bit-cost contract must count the actual field arithmetic and restarts. Per ℓ: x^q modulo h costs O(log q) multiplications of polynomials of degree < ℓ², each O(ℓ⁴) operations in F; ℓ chord additions; O(log ℓ) restarts. Per operation in F, O(log² q) bit operations (Layer 0 presentations); multiply out.

In particular, verify the following values and consequences.

- Statement in the CN.0 model.

*Needs:* [Schoof's algorithm](#FF3-schoof-algorithm), [Correctness of Schoof's algorithm](#FF3-schoof-algorithm-correct), `ComputationalNumberTheory:CN.0`, [Certified presentation of a finite field](#FF0-certified-presentation-of-a-finite-field).

See [Schoof](#source-21) — §5, pp. 233-235; [Sutherland](#source-20) — Lecture 8, Algorithm 8.3 and its correctness, pp. 4-5.

### Examples

Over F₂, X⁴+X+1 has no degree-one factor and gcd(X⁴+X,X⁴+X+1)=1 and X¹⁶≡X modulo X⁴+X+1, so the degree-four Rabin certificate accepts it. X⁴+X²+1=(X²+X+1)² is rejected by squarefree factorization before equal-degree splitting. The degree-zero monic squarefree set is {1}; in degree two over F₂ its cardinality is 4−2=2. An elliptic point-count certificate records the point at infinity as well as affine solutions, and a CRT reconstruction is accepted only after the accumulated modulus exceeds 4√q.

### Dependencies

Elementary correctness uses Layers 0–1, polynomial arithmetic and the explicit computational semantics contract. Probabilistic termination also uses finite PMFs and the stated collision probabilities. Elliptic point counts consume EllipticCurves Layers 2–3; zeta reconstruction consumes general curve-zeta comparisons. Bit-cost bounds additionally use the instantiated bit-operation semantics and the auxiliary-prime growth estimate.

<a id="FF4"></a>

## Layer 4: Finite rings, linearized polynomials, sequences and codes

The algebraic chain starts from finite fields, truncated Witt vectors and character conventions. Linearized/Ore comparison, sequence algebra, cyclic ideals and code evaluation require no blanket Layer 2 hypothesis. Character-sum estimates enter only the correlation, distance or spectral consequences that use them. Native AG evaluation and residue maps use actual Tau Ceti places and Riemann–Roch/differential spaces. The polynomial Hermitian code has a concrete finite point carrier; its native AG comparison requires the exact Hermitian model export.

### 4.1 Galois rings

<a id="FF4-finite-local-ring-is-henselian"></a>

#### A finite commutative local ring is Henselian

Let R be a finite commutative local ring. Then R is a Henselian local ring (Mathlib's HenselianLocalRing R): for every monic f ∈ R[X] and a₀ ∈ R with f(a₀) ∈ 𝔪_R and f′(a₀) a unit there is a ∈ R with f(a) = 0 and a − a₀ ∈ 𝔪_R. In particular (Goresky–Klapper, Lemma 4.1.1), if the reduction of a monic f has a simple root ā in the residue field, f has exactly one root in R reducing to ā (uniqueness: two roots reducing to ā differ by an element of 𝔪_R, and f′ is a unit at them).

The hypotheses are as follows. R is a commutative ring with Finite R and IsLocalRing R. Only monic f are treated (the source's 'regular polynomial' case reduces to it after dividing by the unit leading coefficient).

A proof proceeds as follows. R is finite, hence Artinian; the Jacobson radical of an Artinian ring is nilpotent (mathlib:IsArtinianRing.isNilpotent_jacobson_bot), and for a local ring it is 𝔪_R, so 𝔪_R^N = 0 for some N. An ideal I with I^N = 0 makes R I-adically complete: the filtration I^n • ⊤ is eventually 0, so R is Hausdorff and every I-adic Cauchy sequence is eventually constant (IsAdicComplete I R, proved directly from the definitions of IsHausdorff and IsPrecomplete). Mathlib's instance IsAdicComplete.henselianRing (found by instance inference; it is not in the declaration index) gives HenselianRing R 𝔪_R, and mathlib:HenselianLocalRing.TFAE turns this into HenselianLocalRing R. Uniqueness of the lift: if a, b are roots reducing to ā and f′(a) is a unit then a − b is a unit or zero; it lies in 𝔪_R, so a = b (mathlib:IsLocalRing.eq_of_eval_eq_zero_of_not_isUnit_sub).

In particular, verify the following values and consequences.

- In ZMod 9, X² − 7 (reduction X² − 1 over F₃, with the simple roots 1 and 2) has exactly the roots 4 and 5, lifting 1 and 2 respectively.
- Without the simple-root hypothesis uniqueness fails: X² − 1 over ZMod 8 reduces to (X − 1)² over F₂ and has the four roots 1, 3, 5, 7.

*Needs:* `IsArtinianRing.isNilpotent_jacobson_bot`, `HenselianLocalRing.TFAE`, `HenselianLocalRing`, `HenselianRing`, `IsLocalRing.eq_of_eval_eq_zero_of_not_isUnit_sub`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.1, Lemma 4.1.1, printed p. 96.

<a id="FF4-basic-irreducible-polynomial"></a>

#### Basic irreducible polynomials over a local ring

Let R be a commutative local ring with residue map μ : R → k = R/𝔪_R. A polynomial f ∈ R[X] is basic irreducible, written IsBasicIrreducible f, if f is monic and its reduction map μ f ∈ k[X] is irreducible. Convention (pinned): only monic polynomials are called basic irreducible here, so deg μ(f) = deg f.

The hypotheses are as follows. R is a commutative local ring (IsLocalRing R); no finiteness is needed for the definition. The source also allows non-monic f whose reduction is irreducible; the monic restriction is a pinned convention (the source itself says it will 'often consider monic basic irreducible polynomials').

A proof proceeds as follows. Define IsBasicIrreducible f := f.Monic ∧ Irreducible (f.map (IsLocalRing.residue R)). degree: for monic f, (f.map μ).natDegree = f.natDegree (Polynomial.Monic.natDegree_map). For the irreducibility API retain the source’s finite-local-ring hypothesis. If f=gh and the reduction of g is a nonzero constant, g has a unit constant coefficient and all positive-degree coefficients in the nilpotent maximal ideal. Its nonconstant part is nilpotent, so g is a unit in R[X] by a finite geometric series. Irreducibility of the reduction forces this case for one factor; hence f is irreducible. Reduction to a constant does not itself imply g has degree zero.

Provide the following interface.

- `IsBasicIrreducible`: IsBasicIrreducible f :↔ f.Monic ∧ Irreducible (f.map (IsLocalRing.residue R)).
- `IsBasicIrreducible.monic`: A basic irreducible polynomial is monic.
- `IsBasicIrreducible.irreducible_map`: Its reduction to the residue field is irreducible.
- `IsBasicIrreducible.natDegree_map`: (f.map μ).natDegree = f.natDegree.
- `IsBasicIrreducible.irreducible`: Over a finite commutative local ring R, a basic irreducible polynomial is irreducible in R[X]. The definition itself still needs no finiteness.
- `IsBasicIrreducible.map_ringEquiv`: Basic irreducibility is preserved by ring isomorphisms of local rings.

**Checks.**

- `IsBasicIrreducible.x_sq_add_x_add_one_zmod_four`: X² + X + 1 ∈ (ZMod 4)[X] is basic irreducible (its reduction X² + X + 1 is irreducible over ZMod 2).
- `IsBasicIrreducible.not_x_sq_add_one_zmod_twentyfive`: X² + 1 ∈ (ZMod 25)[X] is monic but not basic irreducible, since X² + 1 = (X − 2)(X + 2) over ZMod 5.
- `IsBasicIrreducible.iff_of_field`: For a field K, IsBasicIrreducible f ↔ f.Monic ∧ Irreducible f.
- `IsBasicIrreducible.x_sub_c`: X − C a is basic irreducible for every a ∈ R.


In particular, verify the following values and consequences.

- Over a field (𝔪 = 0) IsBasicIrreducible f ↔ f monic and irreducible.
- X² + X + 1 ∈ (ZMod 4)[X] is basic irreducible; X² + 1 ∈ (ZMod 25)[X] is monic but not basic irreducible.

*Needs:* `IsLocalRing.residue`, `Polynomial.Monic`, `Polynomial.map`, `Irreducible`, `IsLocalRing.ResidueField`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.1, 'Basic irreducible polynomials', printed p. 95; [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.1, printed p. 96.

<a id="FF4-galois-ring"></a>

#### The Galois ring GR(p^n, r)

For a prime p and natural numbers n, r, the Galois ring is GaloisRing p n r := TruncatedWittVector p n (GaloisField p r), the ring of length-n truncated p-typical Witt vectors over the field with p^r elements. Conventions (pinned): GaloisRing p n r is a ZMod (p^n)-algebra through the unique ring map; GaloisRing p 1 r is identified with GaloisField p r and GaloisRing p n 1 with ZMod (p^n); the reduction GaloisRing p n r → GaloisRing p m r for m ≤ n is truncation of Witt vectors. For n, r ≥ 1 it is the unique unramified extension of ZMod (p^n) of degree r (nodes galois-ring-presentation, galois-ring-uniqueness).

The hypotheses are as follows. p is prime ([Fact p.Prime]). n = 0 gives the zero ring and r = 0 the degenerate field GaloisField p 0; theorems carry 1 ≤ n and 1 ≤ r where they need them.

A proof proceeds as follows. Define GaloisRing p n r as the abbreviation TruncatedWittVector p n (GaloisField p r); its commutative ring structure is Mathlib's TruncatedWittVector.instCommRing (instance inference). Cardinality: Nat.card = (p^r)^n = p^(n r) from mathlib:TruncatedWittVector.card and mathlib:GaloisField.card (r ≠ 0). GaloisRing p n 1 ≃+* ZMod (p^n): GaloisField p 1 ≃+* ZMod p (mathlib:GaloisField.equivZmodP), functoriality of truncated Witt vectors along ring isomorphisms (WittVector.map composed with truncation), and mathlib:TruncatedWittVector.zmodEquivTrunc. GaloisRing p 1 r ≃+* GaloisField p r: a length-1 truncated Witt vector is its 0-th coordinate, and the Witt ring laws in coordinate 0 are the ring laws of the base (TruncatedWittVector.coeff with the ghost-component identities). Characteristic p^n: the composite ZMod (p^n) → GaloisRing p n 1 → GaloisRing p n r is injective since GaloisRing p n 1 → GaloisRing p n r is injective (functoriality along the injective field embedding ZMod p → GaloisField p r preserves injectivity coordinatewise).

Provide the following interface.

- `GaloisRing`: GaloisRing p n r := TruncatedWittVector p n (GaloisField p r), a commutative ring.
- `GaloisRing.instFinite`: GaloisRing p n r is finite.
- `GaloisRing.algebraZMod`: GaloisRing p n r is a ZMod (p^n)-algebra through the unique ring map (injective for r ≥ 1).
- `GaloisRing.card_eq`: For r ≠ 0, Nat.card (GaloisRing p n r) = p^(n·r).
- `GaloisRing.charP`: For r ≠ 0, GaloisRing p n r has characteristic p^n.
- `GaloisRing.zmodEquiv`: GaloisRing p n 1 ≃+* ZMod (p^n), compatible with truncation and zmodEquivTrunc.
- `GaloisRing.oneEquiv`: GaloisRing p 1 r ≃+* GaloisField p r.
- `GaloisRing.reduction`: For m ≤ n the truncation GaloisRing p n r →+* GaloisRing p m r; it is surjective with kernel p^m · GaloisRing p n r, and reduction ∘ reduction = reduction.
- `GaloisRing.residue`: The reduction to GaloisRing p 1 r = GaloisField p r (the residue map).
- `GaloisRing.isLocalRing`: For n, r ≥ 1, GaloisRing p n r is a local ring (node galois-ring-is-local).
- `GaloisRing.isUnit_iff_coeff_zero_ne_zero`: For n≥1, x is a unit iff its 0-th Witt coordinate is nonzero; at n=0 the ring is the zero ring and the residue-coordinate assertion is inapplicable.
- `GaloisRing.ker_residue`: The kernel of the residue map is the ideal (p).

**Checks.**

- `GaloisRing.card_two_two_two`: Nat.card (GaloisRing 2 2 2) = 16.
- `GaloisRing.zmodEquiv_two_two`: GaloisRing 2 2 1 ≃+* ZMod 4 (the degree-one Galois ring is ZMod (p^n)).
- `GaloisRing.one_equiv_galoisField`: GaloisRing p 1 r ≃+* GaloisField p r for every r.
- `GaloisRing.not_isField_two_two_one`: GaloisRing 2 2 1 is not a field (it has the nonzero nilpotent 2), so it is not the field with four elements.


In particular, verify the following values and consequences.

- Nat.card (GaloisRing 2 2 2) = 16 and GaloisRing 2 2 1 ≃+* ZMod 4.
- GaloisRing 2 2 1 ≅ ZMod 4 is not isomorphic to GaloisField 2 2 although both have four elements: its characteristic is 4, not 2.

*Needs:* `TruncatedWittVector`, `GaloisField`, `TruncatedWittVector.card`, `GaloisField.card`, `TruncatedWittVector.zmodEquivTrunc`, `GaloisField.equivZmodP`, `WittVector.map`, `WittVector.truncate`, `TruncatedWittVector.truncate`, `TruncatedWittVector.coeff`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.5, printed p. 109; [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.5, printed p. 109.

<a id="FF4-galois-ring-is-local"></a>

#### GR(p^n, r) is local with maximal ideal (p) and residue field F_{p^r}

Let p be prime, n ≥ 1, r ≥ 1. Then GaloisRing p n r is a local ring; x is a unit iff its 0-th Witt coordinate is nonzero; the maximal ideal equals p · GaloisRing p n r, which is the kernel of the residue map GaloisRing p n r → GaloisField p r (truncation to length 1); consequently IsLocalRing.ResidueField (GaloisRing p n r) ≃+* GaloisField p r and 𝔪^n = 0.

The hypotheses are as follows. p prime, 1 ≤ n, 1 ≤ r.

A proof proceeds as follows. Units: lift x to a Witt vector x̃ with the same first n coordinates (WittVector.truncate is surjective); if x̃.coeff 0 ≠ 0 then x̃ is a unit (mathlib:WittVector.isUnit_of_coeff_zero_ne_zero), hence so is its truncation. Conversely the 0-th coordinate is a ring map to the field, so units have nonzero 0-th coordinate. Hence the non-units form the kernel of the 0-th coordinate map, an ideal, so the ring is local (IsLocalRing.of_nonunits_add). Kernel = p·GR: p = V∘F on W(k) for k of characteristic p (WittVector.verschiebung_frobenius) and F is bijective on W(k) for perfect k, so the Witt vectors with vanishing 0-th coordinate are exactly the multiples of p; truncate (mathlib:WittVector.coeff_p_pow shows p^i has its first nonzero coordinate at i). 𝔪^n = (p^n) = 0 because p^n has zero coordinates below n (mathlib:WittVector.coeff_p_pow_eq_zero).

In particular, verify the following values and consequences.

- In GaloisRing 3 2 1 ≅ ZMod 9 the maximal ideal is {0, 3, 6}.
- In GaloisRing 2 2 2 exactly 12 of the 16 elements are units.

*Needs:* [The Galois ring GR(p^n, r)](#FF4-galois-ring), `WittVector.isUnit_of_coeff_zero_ne_zero`, `WittVector.coeff_p_pow`, `WittVector.coeff_p_pow_eq_zero`, `WittVector.verschiebung_frobenius`, `WittVector.frobenius_bijective`, `IsLocalRing.of_nonunits_add`, `WittVector.truncate`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.5, printed p. 109; [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.1.a, printed p. 96.

<a id="FF4-teichmuller-section-of-galois-ring"></a>

#### The Teichmüller section F_{p^r} → GR(p^n, r)

For p prime and n, r ≥ 1, the Teichmüller map τ : GaloisField p r →* GaloisRing p n r is the composite of Mathlib's Teichmüller lift WittVector.teichmuller with truncation to length n. It is multiplicative with τ(0) = 0 and τ(1) = 1, the residue of τ(a) is a, and its image is the set T = {x ∈ GR : x^{p^r} = x}; τ restricted to the units is the unique group homomorphism F_{p^r}^× → GR^× splitting the residue map.

The hypotheses are as follows. p prime; n, r ≥ 1. τ is multiplicative but not additive when n ≥ 2.

A proof proceeds as follows. Define τ := (WittVector.truncate n).toMonoidHom.comp (WittVector.teichmuller p (GaloisField p r)) (Mathlib's teichmuller is a monoid hom k →* W k; this is instance- and name-level composition). residue ∘ τ = id: the 0-th coordinate of teichmuller a is a (WittVector.teichmuller_coeff_zero). Image = T: a^{p^r} = a in GaloisField p r (FiniteField.pow_card) gives τ(a)^{p^r} = τ(a^{p^r}) = τ(a). Conversely, x^{p^r} = x and x ↦ x^{p^r} has, for each residue class, exactly one fixed point: the polynomial X^{p^r} − X has simple roots modulo p, so by finite-local-ring-is-henselian each residue class contains exactly one root, which is τ of its residue. Uniqueness of the splitting: any multiplicative section σ satisfies σ(a)^{p^r−1} = 1 for a ≠ 0, so σ(a) ∈ T with residue a, hence σ(a) = τ(a) by the previous step (Goresky–Klapper Lemma 4.1.4).

Provide the following interface.

- `GaloisRing.teichmuller`: τ : GaloisField p r →* GaloisRing p n r.
- `GaloisRing.teichmuller_zero`: τ 0 = 0.
- `GaloisRing.residue_teichmuller`: residue (τ a) = a.
- `GaloisRing.teichmuller_pow_card`: τ a ^ (p^r) = τ a.
- `GaloisRing.mem_range_teichmuller_iff`: x ∈ range τ ↔ x^(p^r) = x.
- `GaloisRing.teichmuller_unique`: Any monoid hom σ : F_{p^r} →* GR with residue ∘ σ = id equals τ.
- `GaloisRing.reduction_teichmuller`: Truncation to length m ≤ n commutes with τ.

**Checks.**

- `teichmuller.zmod_nine_two`: Under GaloisRing 3 2 1 ≃+* ZMod 9, τ(2) corresponds to 8.
- `teichmuller.residue`: residue (τ a) = a for all a.
- `teichmuller.not_additive`: In GaloisRing 2 2 1, τ 1 + τ 1 ≠ τ (1 + 1).
- `teichmuller.length_one`: For n = 1, τ is the identification GaloisField p r ≃ GaloisRing p 1 r.


In particular, verify the following values and consequences.

- For GaloisRing 3 2 1 ≅ ZMod 9, τ(2) = 8 = −1.
- τ(1) + τ(1) = 2 ≠ 0 = τ(1 + 1) in GaloisRing 2 2 1 ≅ ZMod 4, so τ is not additive.

*Needs:* [The Galois ring GR(p^n, r)](#FF4-galois-ring), [GR(p^n, r) is local with maximal ideal (p) and residue field F_{p^r}](#FF4-galois-ring-is-local), [A finite commutative local ring is Henselian](#FF4-finite-local-ring-is-henselian), `WittVector.teichmuller`, `WittVector.teichmuller_coeff_zero`, `WittVector.truncate`, `FiniteField.pow_card`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.1.a, Lemma 4.1.4, printed p. 97; [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.5, printed p. 109.

<a id="FF4-p-adic-expansion-in-galois-ring"></a>

#### Teichmüller (p-adic) expansion in GR(p^n, r)

Let p be prime and n, r ≥ 1. Every x ∈ GaloisRing p n r has a unique expansion x = ∑_{i<n} τ(a_i) p^i with a_0, …, a_{n−1} ∈ GaloisField p r; the a_i are the Witt coordinates of x raised to the powers p^{−i} (a_i = (x.coeff i)^{1/p^i}), and multiplication by τ(b) acts coordinatewise: τ(b)x = ∑ τ(b a_i) p^i.

The hypotheses are as follows. p prime; n, r ≥ 1.

A proof proceeds as follows. Existence and uniqueness by induction on n, as in the source: (p^i GR)/(p^{i+1} GR) has p^r elements and the classes of τ(a) p^i, a ∈ F_{p^r}, are pairwise distinct (if τ(a)p^i ≡ τ(b)p^i then 1 − τ(b)τ(a)^{−1} ∈ 𝔪, forcing a = b since a Teichmüller element t with 1 − t non-unit is 1). Handle a=0 or b=0 before using a⁻¹; otherwise both Teichmüller lifts are units. Alternatively the Witt-coordinate identity in the next step directly gives existence and uniqueness, avoiding cancellation by a nonunit. Coordinate description: in W(k) with k perfect, ∑ τ(a_i) p^i has i-th coordinate a_i^{p^i} (p^i = V^i F^i; WittVector.coeff_p_pow and the Teichmüller series identity WittVector.dvd_sub_sum_teichmuller_iterateFrobeniusEquiv_coeff); truncate. Coordinatewise action of τ(b): multiply the expansion termwise, τ multiplicative.

In particular, verify the following values and consequences.

- In ZMod 9 = GaloisRing 3 2 1, with τ(1) = 1, τ(2) = 8: 5 = τ(2) + τ(2)·3 (8 + 24 = 32 ≡ 5).
- The number of expansions is (p^r)^n = Nat.card (GaloisRing p n r).

*Needs:* [The Galois ring GR(p^n, r)](#FF4-galois-ring), [GR(p^n, r) is local with maximal ideal (p) and residue field F_{p^r}](#FF4-galois-ring-is-local), [The Teichmüller section F_{p^r} → GR(p^n, r)](#FF4-teichmuller-section-of-galois-ring), `WittVector.coeff_p_pow`, `WittVector.dvd_sub_sum_teichmuller_iterateFrobeniusEquiv_coeff`, `WittVector.truncate`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.5, Lemma 4.5.1, printed p. 110; [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.5, printed p. 110.

<a id="FF4-units-of-galois-ring"></a>

#### Units of GR(p^n, r): Teichmüller part times principal units

Let p be prime and n, r ≥ 1, S = GaloisRing p n r, 𝔪 = pS. The map τ(F_{p^r}^×) × (1 + 𝔪) → S^×, (t, u) ↦ tu, is a group isomorphism; τ(F_{p^r}^×) is cyclic of order p^r − 1, 1 + 𝔪 has order p^{r(n−1)}, and Nat.card S^× = (p^r − 1) p^{r(n−1)}.

The hypotheses are as follows. p prime; n, r ≥ 1.

A proof proceeds as follows. 1 + 𝔪 is a subgroup of S^× (elements of 1 + 𝔪 are units since 𝔪 is the set of non-units of a local ring). The residue map S^× → F_{p^r}^× is surjective with kernel 1 + 𝔪; τ restricted to units is a splitting (teichmuller-section-of-galois-ring), so S^× is the internal direct product. Cardinalities: |𝔪| = p^{r(n−1)} (S/𝔪 ≅ F_{p^r} and |S| = p^{rn}), τ is injective, and F_{p^r}^× is cyclic of order p^r − 1.

In particular, verify the following values and consequences.

- (ZMod 9)^× ≅ {±1} × (1 + 3ZMod 9) has 6 = (3 − 1)·3 elements.
- Nat.card (GaloisRing 2 2 2)^× = 3 · 4 = 12.

*Needs:* [GR(p^n, r) is local with maximal ideal (p) and residue field F_{p^r}](#FF4-galois-ring-is-local), [The Teichmüller section F_{p^r} → GR(p^n, r)](#FF4-teichmuller-section-of-galois-ring), [The Galois ring GR(p^n, r)](#FF4-galois-ring), `IsCyclic`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 4, Proposition 4.1.3, printed pp. 96–97; [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.5, printed pp. 109–110.

<a id="FF4-principal-units-of-galois-ring-odd"></a>

#### Structure of 1 + pGR(p^n, r) for odd p

Let p be an odd prime and n, r ≥ 1, S = GaloisRing p n r. Then 1 + pS ≅ (ZMod p^{n−1})^r as abelian groups; explicitly, the truncated exponential E(a) = ∑_{k≥0} (p^k/k!)a^k (a finite sum in S, with p^k/k! first viewed as a p-integral coefficient and then reduced to S) is a group isomorphism from the additive group S/p^{n−1}S onto 1 + pS, and S/p^{n−1}S ≅ (ZMod p^{n−1})^r because S is free of rank r over ZMod p^n.

The hypotheses are as follows. p odd prime; n, r ≥ 1 (for n = 1 both sides are trivial).

A proof proceeds as follows. The p-adic valuation of p^k/k! is at least k(p−2)/(p−1) > 0 for k ≥ 1, so p^k a^k/k! makes sense in S (the denominator's prime-to-p part is a unit, the power of p cancels) and vanishes for k large (Goresky–Klapper Proposition 4.2.1 for r = 1; the same coefficient argument applies to S). E(a + b) = E(a)E(b) (binomial identity for truncated exponentials, all terms integral), so E is a homomorphism (S, +) → (1 + pS, ×). Kernel: E(a) ≡ 1 + pa mod p²S, so E(a) = 1 forces a ∈ pS, and inductively a ∈ p^{n−1}S; conversely E vanishes on p^{n−1}S since then pa = 0. Counting: |S/p^{n−1}S| = p^{r(n−1)} = |1 + pS|, so the induced map is bijective; S ≅ (ZMod p^n)^r as a ZMod p^n-module (galois-ring-presentation, power basis) gives S/p^{n−1}S ≅ (ZMod p^{n−1})^r.

In particular, verify the following values and consequences.

- For p = 3, n = 2, r = 1: 1 + 3ZMod 9 = {1, 4, 7} ≅ ZMod 3.
- For p = 3, n = 2, r = 2 the group 1 + 3S has 9 elements and exponent 3.

*Needs:* [The Galois ring GR(p^n, r)](#FF4-galois-ring), [GR(p^n, r) is local with maximal ideal (p) and residue field F_{p^r}](#FF4-galois-ring-is-local), [GR(p^n, r) ≅ (ℤ/p^n)[X]/(f) for a monic basic irreducible f of degree r](#FF4-galois-ring-presentation), [Units of GR(p^n, r): Teichmüller part times principal units](#FF4-units-of-galois-ring).

See [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.5, printed p. 109; [Goresky–Klapper (2009)](#source-26) — Chapter 4, Proposition 4.2.1 and proof, printed pp. 97–98.

<a id="FF4-principal-units-of-galois-ring-two"></a>

#### Structure of 1 + 2GR(2^n, r)

Let n ≥ 3 and r ≥ 1, S = GaloisRing 2 n r. Then 1 + 2S ≅ (ZMod 2^{n−1})^{r−1} × ZMod 2^{n−2} × ZMod 2 as abelian groups (for r = 1: (ZMod 2^n)^× ≅ ZMod 2 × ZMod 2^{n−2}, generated by −1 and 5).

The hypotheses are as follows. n≥3 and r≥1. Separately, n=1 has trivial principal units, and n=2 has principal units (ZMod 2)^r; do not extend the n≥3 formula merely by dropping factors with nonpositive exponents.

A proof proceeds as follows. Use [Torsion kernels in principal 2-units](#FF4-principal-two-unit-torsion-count). For 1<=k<=n-2, the kernel of raising principal units to 2^k has order 2^(r*k+1); the k=0 and k>=n-1 boundary counts are part of that result. Apply the existing finite abelian classification and subtract consecutive logarithmic kernel sizes. The resulting cyclic factors have orders 2, 2^(n-2), and r-1 copies of 2^(n-1). For r=1 this agrees with the direct generators -1 and 5. The general-r counting argument uses finite-local-ring Hensel lifting and the existing p-adic digit expansion; the resulting argument is uniform in the residue degree.

In particular, verify the following values and consequences.

- (ZMod 8)^× ≅ ZMod 2 × ZMod 2 (r = 1, n = 3): it has no element of order 4.
- For r = 2, n = 3 the group 1 + 2S has order 2^4 and invariants (4, 2, 2).

*Needs:* [The Galois ring GR(p^n, r)](#FF4-galois-ring), [GR(p^n, r) is local with maximal ideal (p) and residue field F_{p^r}](#FF4-galois-ring-is-local), [Units of GR(p^n, r): Teichmüller part times principal units](#FF4-units-of-galois-ring), [Torsion kernels in principal 2-units](#FF4-principal-two-unit-torsion-count).

See [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.5, printed p. 109; [Goresky–Klapper (2009)](#source-26) — Chapter 4, Proposition 4.2.1, printed p. 97.

<a id="FF4-frobenius-of-galois-ring"></a>

#### The Frobenius automorphism of GR(p^n, r)

For p prime and n, r ≥ 1, the Frobenius σ : GaloisRing p n r ≃+* GaloisRing p n r is the automorphism induced, by functoriality of truncated Witt vectors, from the Frobenius automorphism x ↦ x^p of GaloisField p r; equivalently it is the truncation of the Witt vector Frobenius (mathlib:WittVector.frobenius_eq_map_frobenius). It satisfies σ(τ(a)) = τ(a^p), acts on Teichmüller expansions by a_i ↦ a_i^p, reduces to the field Frobenius, fixes exactly the image of ZMod (p^n), and σ^r = id.

The hypotheses are as follows. p prime; n, r ≥ 1.

A proof proceeds as follows. Define σ by applying the Witt functor to frobeniusAlgEquivOfAlgebraic / frobenius of GaloisField p r (a ring automorphism of a finite field) and truncating; its inverse comes from the inverse field automorphism. σ ∘ τ = τ ∘ (·)^p: teichmuller is natural (WittVector.map_teichmuller). σ^r = id: the field Frobenius has order r on GaloisField p r (FiniteField.frobenius_pow with card p^r). Fixed ring: by p-adic-expansion-in-galois-ring, σ(x) = x iff every coordinate satisfies a^p = a, i.e. a ∈ ZMod p, iff x lies in the image of ZMod (p^n).

Provide the following interface.

- `GaloisRing.frobenius`: σ : GaloisRing p n r ≃+* GaloisRing p n r.
- `GaloisRing.frobenius_teichmuller`: σ (τ a) = τ (a^p).
- `GaloisRing.residue_frobenius`: residue (σ x) = (residue x)^p.
- `GaloisRing.frobenius_pow_r`: σ^r = id.
- `GaloisRing.frobenius_eq_self_iff`: σ x = x ↔ x ∈ range (algebraMap (ZMod (p^n)) (GaloisRing p n r)).
- `GaloisRing.reduction_frobenius`: Truncation to length m commutes with σ.

**Checks.**

- `frobenius.eq_refl_of_r_one`: For r = 1, σ = RingEquiv.refl.
- `frobenius.teichmuller`: σ (τ a) = τ (a ^ p).
- `frobenius.pow_r`: σ ^ r = 1 in the automorphism group, and σ ≠ 1 for GaloisRing 2 2 2.
- `frobenius.ne_pow_p`: σ is not the p-th power map when n ≥ 2: in GaloisRing 3 2 1 ≅ ZMod 9, σ = id but 2^3 = 8 ≠ 2.


In particular, verify the following values and consequences.

- σ = id when r = 1.
- In GaloisRing 2 2 2, σ has order exactly 2.

*Needs:* [The Galois ring GR(p^n, r)](#FF4-galois-ring), [The Teichmüller section F_{p^r} → GR(p^n, r)](#FF4-teichmuller-section-of-galois-ring), [Teichmüller (p-adic) expansion in GR(p^n, r)](#FF4-p-adic-expansion-in-galois-ring), `WittVector.map`, `WittVector.map_teichmuller`, `WittVector.frobenius_eq_map_frobenius`, `FiniteField.frobenius_pow`, `frobenius`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 4, Theorem 4.4.1, printed p. 105; [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.4.b, printed p. 106.

<a id="FF4-galois-group-of-galois-ring"></a>

#### The automorphism group of GR(p^n, r) is cyclic of order r

Let p be prime and n, r ≥ 1. Reduction to the residue field is a group isomorphism (GaloisRing p n r ≃+* GaloisRing p n r) ≃* (GaloisField p r ≃+* GaloisField p r); hence the ring automorphism group of GaloisRing p n r (all of which are ZMod p^n-algebra automorphisms) is cyclic of order r, generated by the Frobenius σ.

The hypotheses are as follows. p prime; n, r ≥ 1.

A proof proceeds as follows. Every ring automorphism φ preserves 𝔪 (the non-units) and the Teichmüller set T = {x : x^{p^r} = x}, and commutes with p-adic expansions, so φ(∑ τ(a_i)p^i) = ∑ τ(φ̄(a_i))p^i where φ̄ is the residue automorphism; hence reduction is injective. Surjectivity: the residue automorphisms are the powers of the field Frobenius (Gal(F_{p^r}/F_p) cyclic of order r), realised by σ^k (frobenius-of-galois-ring). A ring automorphism fixes the image of ℤ, hence of ZMod p^n, so it is a ZMod p^n-algebra automorphism.

In particular, verify the following values and consequences.

- Aut(ZMod p^n) is trivial (r = 1).
- Aut(GaloisRing 2 2 2) has exactly two elements.

*Needs:* [The Frobenius automorphism of GR(p^n, r)](#FF4-frobenius-of-galois-ring), [Teichmüller (p-adic) expansion in GR(p^n, r)](#FF4-p-adic-expansion-in-galois-ring), [The Teichmüller section F_{p^r} → GR(p^n, r)](#FF4-teichmuller-section-of-galois-ring), [GR(p^n, r) is local with maximal ideal (p) and residue field F_{p^r}](#FF4-galois-ring-is-local), `FiniteField.frobenius_pow`, `GaloisField`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 4, Theorem 4.4.1, printed pp. 104–105.

<a id="FF4-galois-ring-presentation"></a>

#### GR(p^n, r) ≅ (ℤ/p^n)[X]/(f) for a monic basic irreducible f of degree r

Let p be prime, n, r ≥ 1 and f ∈ (ZMod (p^n))[X] monic basic irreducible of degree r. Then there is a ZMod (p^n)-algebra isomorphism AdjoinRoot f ≃ₐ GaloisRing p n r; in particular GaloisRing p n r is free of rank r over ZMod (p^n) with basis 1, α, …, α^{r−1} for any root α of f, and α is a unit when its residue is nonzero (in particular when r≥2, or when f̄≠X in degree one).

The hypotheses are as follows. p prime; n, r ≥ 1; f monic, basic irreducible (basic-irreducible-polynomial), natDegree f = r.

A proof proceeds as follows. The reduction f̄ ∈ F_p[X] is irreducible of degree r, so it divides X^{p^r} − X and splits with distinct roots in GaloisField p r (GaloisField is the splitting field of X^{p^r} − X; irreducible polynomials over a finite field are separable). Choose a root ā of f̄; f′(ã) is a unit for any lift ã, so finite-local-ring-is-henselian (with galois-ring-is-local) gives a root α ∈ GaloisRing p n r of f lifting ā. AdjoinRoot.lift sends the class of X to α: a ZMod (p^n)-algebra map φ : AdjoinRoot f → GaloisRing p n r. Surjective: the image contains α, and 1, ā, …, ā^{r−1} span GaloisField p r over F_p, so image + 𝔪 = everything; 𝔪 = p·GR is nilpotent, so image = GR (Nakayama for a nilpotent ideal). Both sides have p^{nr} elements (AdjoinRoot.powerBasis' for monic f over ZMod p^n: free of rank r; galois-ring card), so φ is bijective. The unconditional invertible-root clause of the cited Corollary 4.4.2 is false: f=X presents the degree-one Galois ring with root α=0. For a nonzero residue root, α is a unit by the local-ring criterion; the basis and presentation do not require α to be a unit.

In particular, verify the following values and consequences.

- X² + X + 1 over ZMod 4 presents GaloisRing 2 2 2.
- X − 1 over ZMod p^n presents GaloisRing p n 1 ≅ ZMod p^n.

*Needs:* [Basic irreducible polynomials over a local ring](#FF4-basic-irreducible-polynomial), [The Galois ring GR(p^n, r)](#FF4-galois-ring), [GR(p^n, r) is local with maximal ideal (p) and residue field F_{p^r}](#FF4-galois-ring-is-local), [A finite commutative local ring is Henselian](#FF4-finite-local-ring-is-henselian), `AdjoinRoot.lift`, `AdjoinRoot.powerBasis'`, `GaloisField`, `FiniteField.roots_X_pow_card_sub_X`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.5, printed p. 109; [Goresky–Klapper (2009)](#source-26) — Chapter 4, Corollary 4.4.2, printed p. 105.

<a id="FF4-galois-ring-uniqueness"></a>

#### Uniqueness of the unramified extension of ℤ/p^n of degree r

Let p be prime, n, r ≥ 1 and S a finite commutative local ring containing ZMod (p^n) (an injective ring map), whose maximal ideal is p·S and whose residue field has p^r elements. Then S ≃+* GaloisRing p n r (as ZMod (p^n)-algebras).

The hypotheses are as follows. p prime; n, r ≥ 1; S finite local, ZMod (p^n) → S injective, 𝔪_S = p·S, #(S/𝔪_S) = p^r.

A proof proceeds as follows. Lift the monic minimal polynomial of a primitive residue generator to g∈ZMod(p^n)[X], then lift that simple residue root to h∈S by finite-local Hensel. Do not define g by an orbit under automorphisms not yet constructed. The map AdjoinRoot g→S is surjective: its image M is an R-submodule, its reduction spans the residue field, and pS is nilpotent, so iterating S=M+pS gives S=M. To count S without assuming freeness, for 0≤i<n the map k→p^iS/p^(i+1)S is surjective and injective: a nonzero residue is a unit, and p^i u∈p^(i+1)S would imply p^i(1−pv)=0 after scaling by u⁻¹, contradicting p^i≠0 and 1−pv a unit. Hence every layer has p^r elements and |S|=p^(nr). Injectivity of R→S supplies the exact characteristic and p^i≠0. Count against the free monic AdjoinRoot presentation to get bijectivity. Hence S ≅ AdjoinRoot g ≅ GaloisRing p n r by galois-ring-presentation.

In particular, verify the following values and consequences.

- ZMod 2 [X]/(X² + X + 1) lifted: (ZMod 4)[X]/(X² + 3X + 1) is also GaloisRing 2 2 2.
- (ZMod 4)[X]/(X²) is local with residue field F_2 but maximal ideal (2, X) ≠ 2·S, so the theorem does not apply — it is not a Galois ring.

*Needs:* [GR(p^n, r) ≅ (ℤ/p^n)[X]/(f) for a monic basic irreducible f of degree r](#FF4-galois-ring-presentation), [Basic irreducible polynomials over a local ring](#FF4-basic-irreducible-polynomial), [A finite commutative local ring is Henselian](#FF4-finite-local-ring-is-henselian), `AdjoinRoot.lift`, `minpoly`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 4, Theorem 4.4.1, printed p. 105; [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.5, printed p. 109.

<a id="FF4-ideals-of-galois-ring"></a>

#### The ideals of GR(p^n, r) form the chain (p^i)

Let p be prime and n, r ≥ 1. Every ideal of GaloisRing p n r equals p^i · GaloisRing p n r for a unique 0 ≤ i ≤ n, and GaloisRing p n r ⧸ (p^m) ≃+* GaloisRing p m r for m ≤ n (via truncation).

The hypotheses are as follows. p prime; n, r ≥ 1.

A proof proceeds as follows. A nonzero x has a first nonzero Teichmüller coordinate a_i (p-adic-expansion-in-galois-ring), so x = p^i u with u a unit (u has nonzero 0-th coordinate; galois-ring-is-local); hence every ideal is generated by p^{i} for i the least such index among its elements. The kernel of truncation to length m is (p^m) (coordinates of p^m: WittVector.coeff_p_pow_eq_zero and coeff_p_pow).

In particular, verify the following values and consequences.

- The ideals of ZMod 8 are (1) ⊃ (2) ⊃ (4) ⊃ (0).
- GaloisRing 2 3 2 has exactly four ideals.

*Needs:* [Teichmüller (p-adic) expansion in GR(p^n, r)](#FF4-p-adic-expansion-in-galois-ring), [GR(p^n, r) is local with maximal ideal (p) and residue field F_{p^r}](#FF4-galois-ring-is-local), `WittVector.coeff_p_pow_eq_zero`, `WittVector.coeff_p_pow`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.5, printed p. 109.

<a id="FF4-galois-subrings-of-galois-ring"></a>

#### Galois subrings of GR(p^n, r) are the GR(p^n, e), e ∣ r

Let p be prime and n, r ≥ 1, S = GaloisRing p n r with Frobenius σ. For each e ∣ r the fixed subring S^{σ^e} is isomorphic to GaloisRing p n e, and e ↦ S^{σ^e} is an inclusion-preserving bijection (ordered by divisibility) from the divisors of r to the subrings R' ⊆ S that are local with maximal ideal p·R' (equivalently, the subrings that are Galois extensions of ZMod p^n). Not every subring is of this form: for r = 2, n = 2 the subring ZMod 4 + 2S has 8 elements.

The hypotheses are as follows. p prime; n, r ≥ 1; e ∣ r.

A proof proceeds as follows. S^{σ^e} is a finite local ring with maximal ideal p·S^{σ^e} (fixed points of an automorphism of a local ring whose Teichmüller coordinates are fixed coordinatewise) and residue field F_{p^e}; by galois-ring-uniqueness it is GaloisRing p n e. Conversely a subring R' local with 𝔪 = pR' has residue field the unique subfield F_{p^e} of F_{p^r} for some e ∣ r, by the Layer 0 intermediate-field/divisor correspondence; R' contains the Teichmüller lifts of that subfield (they are the roots of X^{p^e} − X lifting it, unique by finite-local-ring-is-henselian) and is generated by them over ZMod p^n, so R' = S^{σ^e}. The counterexample: ZMod 4 + 2·GaloisRing 2 2 2 is closed under multiplication, contains 1 and has 4·4/2 = 8 elements, while GaloisRing 2 2 e has 4 or 16 elements.

In particular, verify the following values and consequences.

- The Galois subrings of GaloisRing 3 2 6 are GaloisRing 3 2 e for e ∈ {1, 2, 3, 6}.
- ZMod 4 + 2·GaloisRing 2 2 2 is a subring that is not a Galois ring (see the source issue on this claim).

*Needs:* [The Frobenius automorphism of GR(p^n, r)](#FF4-frobenius-of-galois-ring), [Uniqueness of the unramified extension of ℤ/p^n of degree r](#FF4-galois-ring-uniqueness), [The automorphism group of GR(p^n, r) is cyclic of order r](#FF4-galois-group-of-galois-ring), [A finite commutative local ring is Henselian](#FF4-finite-local-ring-is-henselian), [Intermediate fields and divisors of the extension degree](#FF0-intermediate-field-divisor-correspondence).

See [Goresky–Klapper (2009)](#source-26) — Chapter 4, Section 4.5, printed p. 109; [Goresky–Klapper (2009)](#source-26) — Chapter 4, Theorem 4.4.1, printed p. 105.

<a id="FF4-trace-of-galois-ring"></a>

#### Trace of GR(p^n, r) over ℤ/p^n: Galois sum, surjectivity, duality

Let p be prime, n, r ≥ 1, S = GaloisRing p n r, R = ZMod (p^n). (a) Algebra.trace R S x = ∑_{k<r} σ^k(x), and residue ∘ Tr_{S/R} = Tr_{F_{p^r}/F_p} ∘ residue. (b) Tr_{S/R} is surjective. (c) For every R-linear L : S → R there is a unique b ∈ S with L(x) = Tr_{S/R}(bx) for all x; b is a unit iff L is surjective.

The hypotheses are as follows. p prime; n, r ≥ 1; S is free of rank r over R (galois-ring-presentation), so Algebra.trace is defined as a matrix trace.

A proof proceeds as follows. (a) Choose a lifted root α of a monic basic irreducible degree-r polynomial (presentation node), with distinct residue conjugates σ^i(α). Over S, the evaluation/Vandermonde matrix V=(σ^i(α)^j) is invertible: all pairwise differences have nonzero residue, hence are units. If Mx is the R-matrix of multiplication by x in the power basis, V Mx V⁻¹ is diagonal with entries σ^i(x). Trace invariance under conjugacy and the injective R→S map give the exact Galois sum formula; reducing the multiplication matrix or the sum gives residue compatibility. Agreement modulo the maximal ideal alone does not imply equality, and the source’s assertion N+𝔪S=S for the equality locus is not justified. (b) The residue of the trace is the field trace, which is surjective; pick c with Tr(c) a unit and scale (Corollary 4.4.4). (c) b ↦ (x ↦ Tr(bx)) is R-linear and injective (if Tr(bx) = 0 for all x and b = p^m u with u a unit, m < n, then p^m Tr(x) = 0 for all x, contradicting surjectivity); both sides have |R|^r elements (Theorem 4.4.6(4)). For the last clause, if b is a unit then Tr(b·) is surjective by trace surjectivity and multiplication by b; if b is a nonunit it lies in pS and every value lies in pR, so the map is not surjective.

In particular, verify the following values and consequences.

- For r = 1, Tr is the identity of ZMod p^n.
- In GaloisRing 2 2 2 = (ZMod 4)[X]/(X² + X + 1), Tr(X) = −1 = 3.

*Needs:* [The Frobenius automorphism of GR(p^n, r)](#FF4-frobenius-of-galois-ring), [GR(p^n, r) ≅ (ℤ/p^n)[X]/(f) for a monic basic irreducible f of degree r](#FF4-galois-ring-presentation), [GR(p^n, r) is local with maximal ideal (p) and residue field F_{p^r}](#FF4-galois-ring-is-local), `Algebra.trace`, `FiniteField.algebraMap_trace_eq_sum_pow`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 4, Lemma 4.4.3, printed p. 106; [Goresky–Klapper (2009)](#source-26) — Chapter 4, Corollary 4.4.4 and Theorem 4.4.6(4), printed pp. 107–108.

<a id="FF4-principal-two-unit-torsion-count"></a>

#### Torsion kernels in principal 2-units

For S = GR(2^n,r), n ≥ 3 and r ≥ 1, set U = 1+2S. For 1 ≤ k ≤ n−2 the kernel of u ↦ u^(2^k) on U has 2^(rk+1) elements. At k=0 it has one element; for k ≥ n−1 it is all of U, of order 2^(r(n−1)). These counts and finite abelian classification supply the earlier principal-unit decomposition.

The hypotheses are as follows. n ≥ 3, r ≥ 1; S has the earlier unramified Galois-ring presentation.

A proof proceeds as follows. Write u=1+2a with a unique modulo 2^(n−1). Squaring gives u²=1+4a(1+a). For b∈4S, squaring 1+b raises its nonzero 2-adic valuation by exactly one until it vanishes, since 2+b is 2 times a unit. Thus u^(2^k)=1 iff a²+a is zero modulo 2^(n−k−1). In the residue field x²+x has exactly two roots, 0 and 1, each simple; the earlier finite-local-ring Hensel property lifts them uniquely to 0 and −1. Each has 2^(rk) lifts modulo 2^(n−1). Use the earlier 2-adic expansion to count the two disjoint fibres. Apply the native finite abelian classification: logarithmic kernel increments are r+1 at k=1, r through k=n−2, and r−1 at k=n−1. Subtraction gives cyclic factors of orders 2, 2^(n−2) and (r−1) copies of 2^(n−1), agreeing with the earlier even at n=3.

In particular, verify the following values and consequences.

- For n=3,r=2: 8 elements killed by 2 and 16 killed by 4, giving C4×C2×C2.
- For n=4,r=1: kernels have 4,8,8 elements, giving C4×C2.

*Needs:* [The Galois ring GR(p^n, r)](#FF4-galois-ring), [A finite commutative local ring is Henselian](#FF4-finite-local-ring-is-henselian), [Teichmüller (p-adic) expansion in GR(p^n, r)](#FF4-p-adic-expansion-in-galois-ring), [Units of GR(p^n, r): Teichmüller part times principal units](#FF4-units-of-galois-ring), `CommGroup.equiv_prod_multiplicative_zmod_of_finite`.

See [Goresky–Klapper (2009)](#source-26) — §4.5, p. 109; authored proof of the torsion-count step supplying the stated decomposition.

### 4.2 Specialized linearized and permutation criteria

<a id="FF4-linearized-q-associate"></a>

#### The linearized q-associate of a polynomial

Let K be a commutative semiring and q ∈ ℕ. The linearized q-associate of l = ∑_i a_i X^i ∈ K[X] is linearizedAssociate q l := ∑_i a_i X^{q^i} (Lidl–Niederreiter call l the conventional q-associate of this linearized polynomial). The map l ↦ linearizedAssociate q l is additive and injective for q ≥ 2, and when K = F is a finite field with q elements it turns multiplication into composition: linearizedAssociate q (l * m) = (linearizedAssociate q l).comp (linearizedAssociate q m); hence (F[X], +, ·) ≅ (q-polynomials over F, +, ∘) and, modulo X^n − 1 ↦ X^{q^n} − X, F[X]/(X^n − 1) ≅ L_n(F).

The hypotheses are as follows. q ≥ 2; the multiplicativity statement requires the coefficients to lie in a finite field F with exactly q elements (so a^q = a).

A proof proceeds as follows. Define linearizedAssociate q := Polynomial.sum with C a * X^(q^i) (an additive map K[X] →+ K[X]); its image is the set of q-linearized polynomials (linearized-polynomial, eq_linearizedOf). Multiplicativity on monomials: (a X^{q^i}) ∘ (b X^{q^j}) = a b^{q^i} X^{q^{i+j}} = a b X^{q^{i+j}} for b ∈ F (linearized-polynomial-comp and FiniteField.pow_card); extend biadditively. linearizedAssociate q (X^n − 1) = X^{q^n} − X, giving the quotient statement.

Provide the following interface.

- `linearizedAssociate`: linearizedAssociate q l = ∑_i C (l.coeff i) * X^(q^i), an additive map K[X] →+ K[X].
- `linearizedAssociate_X_pow`: linearizedAssociate q (X^i) = X^(q^i).
- `linearizedAssociate_injective`: For q ≥ 2 the map is injective.
- `linearizedAssociate_mul`: For F finite with q elements: linearizedAssociate q (l * m) = (linearizedAssociate q l).comp (linearizedAssociate q m).
- `linearizedAssociate_X_pow_sub_one`: linearizedAssociate q (X^n − 1) = X^(q^n) − X.

**Checks.**

- `linearizedAssociate_X_sub_one`: linearizedAssociate q (X − 1) = X^q − X.
- `linearizedAssociate_one`: linearizedAssociate q 1 = X.
- `linearizedAssociate_mul_noncomm`: With q = 2, F = GaloisField 2 2 and a ∉ range (algebraMap (ZMod 2) F): (C a * X).comp (X^2) ≠ (X^2).comp (C a * X).
- `linearizedAssociate_isLinearized`: linearizedAssociate q l is q-linearized, and equals linearizedOf q (l.toFinsupp).


In particular, verify the following values and consequences.

- linearizedAssociate q (X − 1) = X^q − X and linearizedAssociate q 1 = X.
- Over F₄ ⊋ F₂ (q = 2) and a ∉ F₂, (C a * X).comp (X^2) ≠ (X^2).comp (C a * X): multiplicativity needs coefficients in F_q.

*Needs:* [q-linearized (additive) polynomials](#FF4-linearized-polynomial), [q-polynomials are closed under composition](#FF4-linearized-polynomial-comp), `FiniteField.pow_card`, `Polynomial.sum`.

See [Wu–Liu](#source-31) — Section 1, printed p. 4; [Shallue](#source-29) — Chapter 1, Theorem 1.16, printed p. 15.

<a id="FF4-linearized-permutation-root-criterion"></a>

#### A q-polynomial permutes F_{q^m} iff 0 is its only root there

Let F be a finite field with q elements, E a finite field extension of F, and L ∈ E[X] q-linearized. Then x ↦ L(x) is a bijection of E iff the only root of L in E is 0.

The hypotheses are as follows. F finite with q elements; E a finite field with [Algebra F E].

A proof proceeds as follows. x ↦ L(x) is F-linear (linearized-polynomial-eval-linear); an injective endomorphism of a finite set is bijective, and a linear map is injective iff its kernel is 0 (roots-of-linearized-polynomial).

In particular, verify the following values and consequences.

- X^q − X does not permute E (every element of F is a root).
- Over F₄ = GaloisField 2 2 the 2-polynomial X² + X has the nonzero root 1, so it does not permute F₄, while X² (Frobenius) does.

*Needs:* [Evaluation of a q-polynomial is F_q-linear](#FF4-linearized-polynomial-eval-linear), [The roots of a q-polynomial form an F_q-subspace](#FF4-roots-of-linearized-polynomial), [Permutation polynomials of a finite field](#FF4-permutation-polynomial), `LinearMap.ker_eq_bot`, `Finite.injective_iff_bijective`.

See [Shallue](#source-29) — Chapter 1, Theorem 1.15, printed p. 14.

<a id="FF4-linearized-permutation-associate-criterion"></a>

#### The associate gcd criterion for q-polynomials with coefficients in F_q

Let F be a finite field with q elements, m ≥ 1, E a field extension of F of degree m, and l = ∑_{i<m} a_i X^i ∈ F[X]. Then linearizedAssociate q l permutes E iff IsCoprime l (X^m − 1), equivalently the monic normalization of their gcd is 1.

The hypotheses are as follows. F finite with q elements; [E : F] = m ≥ 1; natDegree l < m.

A proof proceeds as follows. Use the monic normalized gcd g of l and X^m−1, with Bézout coefficients obtained by scaling the raw Euclidean gcd relation by its leading-coefficient inverse (Layer 0). The raw Mathlib EuclideanDomain.gcd need not equal 1 even for coprime polynomials. Associate the scaled relation and evaluate on E, using #E=q^m, to identify the kernels of assoc(g) and assoc(l). Conversely g ∣ l gives L = assoc(l/g) ∘ assoc(g), so every root of assoc(g) is a root of L. Thus the roots of L in E are the roots of assoc(g) in E. If g = 1 then assoc(g) = X, whose only root is 0, and L permutes E by linearized-permutation-root-criterion. If deg g ≥ 1: g(0) ≠ 0 since g ∣ X^m − 1, so assoc(g) is separable (linearized-polynomial-separable-iff) with q^{deg g} > 1 roots in its splitting field; each root y satisfies y^{q^m} = y (because X^{q^m} − X = assoc(h) ∘ assoc(g) with g·h = X^m − 1), so all lie in E, and L has a nonzero root in E: not a permutation.

In particular, verify the following values and consequences.

- For l = 1 + X (q = 2, m = 2): gcd(1 + X, X² − 1) = X + 1 ≠ 1, and indeed X² + X kills F₂ ⊂ F₄.
- For l=X^k with k<m, X^(q^k) is an automorphism and IsCoprime l (X^m−1). For the constant l=2 over F5, the linearized map 2X is a permutation even though the raw Euclidean gcd is 2, not 1.

*Needs:* [The linearized q-associate of a polynomial](#FF4-linearized-q-associate), [A q-polynomial permutes F_{q^m} iff 0 is its only root there](#FF4-linearized-permutation-root-criterion), [A q-polynomial is separable iff its coefficient of X is nonzero](#FF4-linearized-polynomial-separable-iff), `EuclideanDomain.gcd`, `FiniteField.pow_card`.

See [Shallue](#source-29) — Chapter 1, Theorem 1.16, printed p. 15.

<a id="FF4-dickson-matrix-criterion"></a>

#### Dickson's matrix criterion for linearized permutation polynomials

Let F be a finite field with q elements, E ⊇ F of degree m, and L = ∑_{i<m} a_i X^{q^i} ∈ E[X]. Let D_L ∈ M_m(E) be the Dickson matrix with entries (D_L)_{i,j} = a_{(j−i) mod m}^{q^i}. Then the F-linear map x ↦ L(x) of E has rank equal to rank D_L and determinant equal to det D_L (which lies in F); in particular L permutes E iff det D_L ≠ 0.

The hypotheses are as follows. F finite with q elements; [E : F] = m ≥ 1; indices of a read modulo m.

A proof proceeds as follows. For an F-basis (β_j) of E and its trace-dual basis, the matrix M_L of x ↦ L(x) satisfies M_L = B^{−1} D_L B with B = (β_j^{q^i}) (Wu–Liu Lemma 4.2): from (L(x)^{q^i})_i = D_L (x^{q^j})_j, since L(x)^{q^i} = ∑_j a_{j−i}^{q^i} x^{q^j}. Let (β_i*) be the trace-dual basis, available from the perfect finite-field trace pairing. The matrix C with C_ij=(β_i*)^(q^j) satisfies (CB)_ij=Σ_k (β_i* β_j)^(q^k)=Tr(β_i* β_j)=δ_ij. Thus B is invertible without assuming a separately unplanned Moore determinant theorem. Conjugation preserves determinant and rank over E. The matrix M_L initially has entries in F; its rank is unchanged on base extension F→E, as row reduction over F gives the same pivot positions over E. The determinant over E is the image of its determinant in F. Hence rank D_L is dim_F(im L), and det D_L is the image of det_F L.

In particular, verify the following values and consequences.

- For L = X (a_0 = 1, other a_i = 0), D_L is the identity.
- For L = X^q − X on E of degree m = 2, D_L = [[−1, 1], [1, −1]] is singular.

*Needs:* [Evaluation of a q-polynomial is F_q-linear](#FF4-linearized-polynomial-eval-linear), [A q-polynomial permutes F_{q^m} iff 0 is its only root there](#FF4-linearized-permutation-root-criterion), `LinearMap.toMatrix`, `Matrix.det`, `Matrix.rank`, `traceForm_nondegenerate`.

See [Wu–Liu](#source-31) — Section 4, Proposition 4.3, printed p. 11; [Wu–Liu](#source-31) — Section 4, printed p. 12.

### 4.3 Linearized composition, trace coordinates and coefficient algebras

<a id="FF4-reduced-linearized-algebra"></a>

#### Reduced linearized composition algebra

For the finite extension E/F of degree n>0, |F|=q, ReducedLinearized(F,E,n) has carrier Fin n→E, coordinatewise addition and F-scalars, unit (1,0,…,0), and multiplication (a⋆b)_k=Σ_{i,j<n,(i+j) mod n=k} a_i b_j^(q^i). It represents Σ_{i<n}a_i X^(q^i) modulo the composition relation X^(q^n)=X. Its multiplication is not pointwise multiplication.

The hypotheses are as follows. F,E finite fields, Algebra F E; n=[E:F]>0.

A proof proceeds as follows. Reduce earlier linearized composition modulo X^(q^n)−X using x^(q^n)=x on E. The twisted cyclic convolution is the Ore product modulo τ^n−1, whose centrality follows because φ^n=id on E. Check associativity by the Frobenius action and cyclic indexing. Give the coefficient carrier its actual F-algebra structure; retain coefficients as data for the evaluation equivalence.

Provide the following interface.

- `ReducedLinearized.coeff`: The coefficient a_i for i<n.
- `ReducedLinearized.ext`: Equal coefficients imply equal elements.
- `ReducedLinearized.single`: single(i,a) has coefficient a at i and zero elsewhere.
- `ReducedLinearized.coeff_mul`: The product coefficient is the stated twisted cyclic convolution.
- `ReducedLinearized.polynomial`: The ordinary polynomial representative Σ a_i X^(q^i).

**Checks.**

- `reduced_zero_coeff`: Every coefficient of zero is zero.
- `reduced_unit`: The unit has coefficient 1 at 0, all others zero.
- `reduced_frobenius_order`: For n>1, single(1,1)^n=1, agreeing with the n-th power of relative Frobenius.


In particular, verify the following values and consequences.

- n=1 recovers E=F with ordinary scalar multiplication; n>1 usually gives a noncommutative ring.

*Needs:* [q-linearized (additive) polynomials](#FF4-linearized-polynomial), [Frobenius Ore and linearized polynomial comparison](#FF4-frobenius-ore-polynomial-comparison).

See [Wu–Liu](#source-31) — §2.1, pp. 5–6; §3, Theorem 3.1 and finite composition algebra, pp. 8–9.

<a id="FF4-reduced-evaluation-equivalence"></a>

#### Reduced evaluation and endomorphisms

Evaluation sends a to the F-linear map x ↦ Σ_{i<n} a_i x^(q^i) and gives an F-algebra equivalence ReducedLinearized(F,E,n) ≃ₐ[F] Module.End F E, with composition as multiplication.

The hypotheses are as follows. The finite extension hypotheses of reduced-linearized-algebra.

A proof proceeds as follows. The earlier evaluation-linearity theorem supplies each F-linear map; the explicit product formula supplies multiplicativity. If a nonzero representative vanished on every x∈E, its degree at most q^(n−1) would contradict the root bound |E|=q^n. Thus evaluation is injective. Both F-vector spaces have dimension n². Finite-dimensional injectivity gives surjectivity and hence the native algebra equivalence.

Provide the following interface.

- `reducedEvalEquiv`: The F-algebra equivalence a↦eval a.
- `reducedEvalEquiv_apply`: Its value at x is Σ a_i x^(q^i).
- `reducedEvalEquiv_mul`: eval(a⋆b)=eval(a)∘eval(b).
- `reducedEvalEquiv_surjective`: Every F-linear map E→E has unique reduced coefficients.

**Checks.**

- `eval_zero`: eval(0)=0.
- `eval_one`: eval(1)=LinearMap.id.
- `eval_single`: eval(single(i,a))(x)=a*x^(q^i).


In particular, verify the following values and consequences.

- The coefficients of Frobenius give the usual relative Frobenius linear map.

*Needs:* [Reduced linearized composition algebra](#FF4-reduced-linearized-algebra), [Evaluation of a q-polynomial is F_q-linear](#FF4-linearized-polynomial-eval-linear), `Polynomial.card_roots'`, `Module.card_eq_pow_finrank`.

See [Wu–Liu](#source-31) — §3, Theorem 3.1 and preceding evaluation identification, pp. 8–9.

<a id="FF4-trace-tensor-coordinate-formula"></a>

#### Trace tensors in linearized coordinates

For α,β∈E let T_α(x)=Tr_{E/F}(αx). Under reducedEvalEquiv and the native dualTensorHomEquiv, T_α⊗β corresponds to the coefficients c_i=β α^(q^i). The contraction law is composition: (T_γ⊗δ)∘(T_α⊗β)=Tr(γβ)·(T_α⊗δ).

The hypotheses are as follows. F,E finite fields and n=[E:F]>0.

A proof proceeds as follows. Use the native pure-tensor evaluation f⊗β↦(x↦f(x)•β). Expand Tr(αx)=Σ(αx)^(q^i) with the earlier finite-field trace theorem; uniqueness of reduced evaluation identifies coefficients. Use native comp_dualTensorHom for the contraction, pinning the order of the middle pair. This is a coordinate compatibility, not a new generic tensor algebra.

In particular, verify the following values and consequences.

- α=0 or β=0 gives the zero coefficient vector.
- A trace rank-one map has rank 1 precisely when αβ≠0.

*Needs:* [Reduced evaluation and endomorphisms](#FF4-reduced-evaluation-equivalence), `dualTensorHomEquiv`, `dualTensorHomEquiv_tmul`, `comp_dualTensorHom`, `FiniteField.algebraMap_trace_eq_sum_pow`.

See [Wu–Liu](#source-31) — §3, Theorem 3.1, pp. 8–9; §5.1, proof of Theorem 5.1, pp. 19–21.

<a id="FF4-basis-trace-representations"></a>

#### Basis trace representations

For an F-basis b_0,…,b_{n−1} of E and any F-linear L, L(x)=Σ_i Tr(b_i x)·L(b_i*) where b* is the trace-dual basis. Dually L(x)=Σ_i Tr(c_i x)·b_i with uniquely determined c_i. Rank_F L equals the dimension of the F-span of the output coefficients L(b_i*) and also that of the c_i.

The hypotheses are as follows. Finite fields F⊂E; b an actual Module.Basis; b* native traceDual.

A proof proceeds as follows. Trace nondegeneracy and the native traceDual basis give x=Σ Tr(b_i x)b_i*. Apply L to obtain the first expansion. Expand L in the output basis and identify each coordinate functional using the trace pairing; uniqueness gives c_i. The first output family spans im L. The rank of the dual coordinate map equals rank L, so the c_i have the same span dimension.

In particular, verify the following values and consequences.

- For L=id, L(b_i*)=b_i* and both ranks are n.

*Needs:* [Trace tensors in linearized coordinates](#FF4-trace-tensor-coordinate-formula), `traceForm_nondegenerate`, `Module.Basis.traceDual`.

See [Wu–Liu](#source-31) — §5, Theorem 5.1(1)–(2), p. 18; §5.1 proof, pp. 19–21.

<a id="FF4-minimal-trace-rank-decomposition"></a>

#### Minimal trace rank decomposition

An F-linear map L:E→E has rank k iff it can be written L(x)=Σ_{j<k}Tr(ω_j x) θ_j with both (ω_j) and (θ_j) F-linearly independent. Such a k-term expression is minimal among trace rank-one decompositions.

The hypotheses are as follows. Finite fields F⊂E; k a natural; k≤n; allow k=0.

A proof proceeds as follows. Choose a basis θ of im L. The coordinate functionals of L are independent; trace nondegeneracy represents them by an independent family ω. Conversely independent ω give a surjective map E→F^k, and independent θ give an injective map F^k→E. Their composite has rank k. Any s-term expression factors through F^s, hence rank≤s.

In particular, verify the following values and consequences.

- k=0 occurs exactly for L=0; rank-one nonzero maps require both parameters nonzero.

*Needs:* [Basis trace representations](#FF4-basis-trace-representations), `traceForm_nondegenerate`.

See [Wu–Liu](#source-31) — Theorem 5.1(3), p. 18; §5.1 proof, pp. 19–21.

<a id="FF4-trace-basis-inverse"></a>

#### Inverse from trace-dual bases

For bases b,a of E/F, the map L(x)=Σ_i Tr(b_i x)a_i is invertible, and L⁻¹(x)=Σ_i Tr(a_i* x)b_i*, using the native trace-dual bases.

The hypotheses are as follows. b and a indexed by the same finite n-element type.

A proof proceeds as follows. L carries b_i* to a_i by the trace-dual identity. The displayed inverse carries a_i to b_i*. Check both composites on these bases, then transfer to reduced coefficients using reducedEvalEquiv.

In particular, verify the following values and consequences.

- Taking a=b* gives id, whose inverse formula is the same identity.

*Needs:* [Basis trace representations](#FF4-basis-trace-representations), `Module.Basis.traceDual`.

See [Wu–Liu](#source-31) — §5.3, Proposition 5.5(1), p. 25.

<a id="FF4-intermediate-coefficient-subalgebra"></a>

#### Intermediate-field coefficient subalgebra

For m>0 dividing n=[E:F], let E_m={a∈E : a^(q^m)=a}, the unique intermediate field of size q^m. CoeffSubalgebra m is the F-subalgebra of ReducedLinearized(F,E,n) whose coefficients all lie in E_m. Under reducedEvalEquiv it is exactly the centralizer of x↦x^(q^m) in End_F(E). Its F-dimension is nm.

The hypotheses are as follows. Finite fields F⊂E; m>0 and m∣n.

A proof proceeds as follows. Use native fixedField of the subgroup generated by φ^m in the cyclic Gal(E/F). Its order is n/m. Native finrank_fixedField_eq_card and the tower law give the fixed field F-degree m and cardinality q^m; its elements satisfy a^(q^m)=a. The twisted cyclic convolution preserves fixed coefficients, since all Frobenius powers commute; make an actual Subalgebra rather than an unrelated carrier. Compare eval(L)∘φ^m and φ^m∘eval(L); uniqueness of reduced coefficients makes equality equivalent to a_i^(q^m)=a_i. Each of the n coefficients has m F-dimensions.

Provide the following interface.

- `coeffSubalgebra`: The F-subalgebra defined by fixed coefficients.
- `mem_coeffSubalgebra`: Membership iff every coefficient satisfies a_i^(q^m)=a_i.
- `coeffSubalgebra_centralizer`: Evaluation identifies it with the centralizer of φ^m.
- `coeffSubalgebra_finrank`: Its F-finrank is n*m.

**Checks.**

- `coeff_subalgebra_full`: At m=n, coeffSubalgebra n=⊤.
- `coeff_subalgebra_base`: At m=1, a coefficient lies in the algebra iff it is in the image of F.
- `coeff_subalgebra_wrong_scalar`: For m<n and a∉E_m, the reduced scalar map aX is not in coeffSubalgebra m.


In particular, verify the following values and consequences.

- m=n gives the whole algebra; m=1 has dimension n, not n².

*Needs:* [Reduced evaluation and endomorphisms](#FF4-reduced-evaluation-equivalence), `IntermediateField.fixedField`, `IntermediateField.finrank_fixedField_eq_card`, `FiniteField.frobeniusAlgHom`.

See [Wu–Liu](#source-31) — §6, Theorems 6.1–6.2, pp. 26–27.

<a id="FF4-coefficient-skew-quotient"></a>

#### Coefficient algebra as a cyclic skew quotient

For m∣n, the coefficient algebra is F-algebra isomorphic to SkewPolynomial(E_m)/⟨τ^n−1⟩, where φ(a)=a^q and the quotient uses the native TwoSidedIdeal generated by τ^n−1. This element is central since φ^n=id on E_m. The isomorphism sends τ to X^q and a to aX.

The hypotheses are as follows. m>0, n>0, m∣n; do not require char(F)∤n.

A proof proceeds as follows. Use the native Frobenius skew ring and prove τ^n−1 central from m∣n. Division by its monic central polynomial leaves a unique coefficient normal form of length n; multiplication reduces by cyclic twisting. Identify that normal form with coeffSubalgebra m. No ideal of an ordinary commutative polynomial ring can replace the two-sided ideal here.

In particular, verify the following values and consequences.

- m=1 gives the commutative algebra F[Y]/(Y^n−1), including nonsemisimple cases when char(F)∣n.

*Needs:* [Intermediate-field coefficient subalgebra](#FF4-intermediate-coefficient-subalgebra), [Frobenius Ore and linearized polynomial comparison](#FF4-frobenius-ore-polynomial-comparison), `TwoSidedIdeal`, `RingQuot`.

See [Wu–Liu](#source-31) — §6, Theorem 6.1, p. 26.

<a id="FF4-normal-trace-coefficient-pattern"></a>

#### Normal trace coefficients for a subalgebra

Choose a normal basis b_i=β^(q^i) with trace-dual b_i*=β*^(q^i). Writing L(x)=Σ_i Tr(b_i x)α_i, one has L∈CoeffSubalgebra m iff α_{jm+k}=α_k^(q^(jm)) for j<n/m and k<m.

The hypotheses are as follows. m>0, m∣n; b is a normal basis reindexed by Fin n.

A proof proceeds as follows. Use the basis trace representation α_i=L(b_i*). The centralizer characterization gives L(φ^(jm)b_k*)=φ^(jm)L(b_k*), proving the pattern. Conversely the pattern verifies commutation on every basis element. The trace-dual basis is normal because trace is invariant under relative Frobenius.

In particular, verify the following values and consequences.

- m=n imposes no restriction; m=1 gives a single Frobenius orbit of output coefficients.

*Needs:* [Basis trace representations](#FF4-basis-trace-representations), [Intermediate-field coefficient subalgebra](#FF4-intermediate-coefficient-subalgebra), `IsGalois.normalBasis`, `Module.Basis.traceDual`.

See [Wu–Liu](#source-31) — §6, (14)–(15) and Theorem 6.2, pp. 26–27.

<a id="FF4-block-circulant-coefficient-algebra"></a>

#### Block circulant realization

Set t=n/m. In the ordered normal trace-dual basis (b*_{jm+k}) with j<t,k<m, the matrix of an element of CoeffSubalgebra m has blocks M_{ij}=B_{(j−i) mod t}, B_j∈Matrix_m(F). Every such block circulant matrix occurs, giving an F-algebra equivalence with this subalgebra of Matrix_n(F).

The hypotheses are as follows. m>0, m∣n; a specified normal trace-dual basis fixes the row/column and Frobenius orientation.

A proof proceeds as follows. Use normal-trace-coefficient-pattern to compare matrix columns related by φ^m. In this basis φ^m is the block cyclic permutation. Its centralizer consists exactly of the displayed block matrices; extract the top block row for the inverse. The native matrix map of an endomorphism preserves composition. Restrict the evaluation equivalence to the two centralizers.

In particular, verify the following values and consequences.

- t=1 gives arbitrary m×m matrices; m=1 gives ordinary circulants.

*Needs:* [Normal trace coefficients for a subalgebra](#FF4-normal-trace-coefficient-pattern), [Reduced evaluation and endomorphisms](#FF4-reduced-evaluation-equivalence).

See [Wu–Liu](#source-31) — §6, displayed block matrix and Theorem 6.3, p. 27.

<a id="FF4-matrix-polynomial-coefficient-algebra"></a>

#### Matrix polynomial quotient realization

CoeffSubalgebra m ≃ₐ[F] Matrix (Fin m) (Fin m) (AdjoinRoot(Y^t−1)), where t=n/m. For blocks B_j in the fixed orientation M_{ij}=B_{j−i}, the correspondence is M↦Σ_j B_j Y^j, entry by entry. The quotient exponent is t, not n.

The hypotheses are as follows. m>0,m∣n; t=n/m≥1; no separability assumption on Y^t−1.

A proof proceeds as follows. Multiply two block circulants; their first block rows convolve modulo t with matrix coefficients in the given order. AdjoinRoot of the monic polynomial Y^t−1 has the unique length-t coefficient normal form. Entrywise extraction gives the inverse, hence an algebra equivalence. Compose with block-circulant-coefficient-algebra. This route needs no false semisimplicity assumption when the characteristic divides t.

In particular, verify the following values and consequences.

- m=n gives Matrix_n(F), since t=1. m=1 gives F[Y]/(Y^n−1).

*Needs:* [Block circulant realization](#FF4-block-circulant-coefficient-algebra), `AdjoinRoot`, `AdjoinRoot.modByMonicHom`.

See [Wu–Liu](#source-31) — §6, paragraph preceding Corollary 6.4 and the corollary, p. 28.

### 4.4 Permutation polynomials and Dickson polynomials

<a id="FF4-permutation-polynomial"></a>

#### Permutation polynomials of a finite field

Let F be a finite field with q elements. A polynomial f ∈ F[X] is a permutation polynomial of F, written IsPermutationPolynomial f, if the evaluation map x ↦ f.eval x is a bijection F → F. Equivalent forms (Shallue Lemma 1.3): injective; surjective; f(x) = a solvable for every a. The property depends only on f mod (X^q − X) (Shallue Lemma 1.2), and there are exactly q! permutation polynomials of degree < q.

The hypotheses are as follows. F is a finite field; Fintype.card F = q.

A proof proceeds as follows. Define IsPermutationPolynomial f := Function.Bijective (fun x : F ↦ f.eval x). Injective ↔ surjective ↔ bijective for self-maps of a finite type (mathlib:Finite.injective_iff_bijective, Finite.surjective_iff_bijective). f and f %ₘ (X^q − X) agree on F since X^q − X vanishes on F (FiniteField.pow_card), so the property depends only on the reduction. Counting: evaluation is a bijection from polynomials of degree < q to functions F → F (Lagrange interpolation, Lagrange.interpolate; uniqueness from Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero'); the bijections number q!.

Provide the following interface.

- `IsPermutationPolynomial`: IsPermutationPolynomial f :↔ Function.Bijective (fun x ↦ f.eval x).
- `IsPermutationPolynomial.iff_injective`: For F finite: IsPermutationPolynomial f ↔ injective evaluation.
- `IsPermutationPolynomial.iff_surjective`: For F finite: IsPermutationPolynomial f ↔ surjective evaluation.
- `IsPermutationPolynomial.comp`: Permutation polynomials are closed under composition.
- `IsPermutationPolynomial.linear`: C a * X + C b is a permutation polynomial iff a ≠ 0.
- `IsPermutationPolynomial.toEquiv`: A permutation polynomial defines an Equiv.Perm F.
- `card_permutationPolynomial_degree_lt`: The number of permutation polynomials of degree < q is q!.

**Checks.**

- `IsPermutationPolynomial.X_cube_add_one_zmod_eleven`: X³ + 1 is a permutation polynomial of ZMod 11.
- `IsPermutationPolynomial.not_quadratic_zmod_eleven`: X² + 3X + 5 = (X + 7)² is not a permutation polynomial of ZMod 11.
- `IsPermutationPolynomial.X`: X is a permutation polynomial; a constant is not when q ≥ 2.
- `IsPermutationPolynomial.iff_modByMonic`: IsPermutationPolynomial f ↔ IsPermutationPolynomial (f %ₘ (X^q − X)).


In particular, verify the following values and consequences.

- x³ + 1 permutes ZMod 11 (Shallue Example 1.2); x² + 3x + 5 does not (Example 1.3).
- Composition of permutation polynomials is a permutation polynomial.

*Needs:* `Finite.injective_iff_bijective`, `FiniteField.pow_card`, `Lagrange.interpolate`, `Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero'`, `Polynomial.modByMonic`.

See [Shallue](#source-29) — Chapter 1, Definition 1.1, printed p. 6; [Shallue](#source-29) — Chapter 1, Lemma 1.2, printed p. 6; [Shallue](#source-29) — Chapter 1, Section 1.5, printed p. 18.

<a id="FF4-power-sums-detect-enumerations"></a>

#### Power sums detect enumerations of F_q

Let F be a finite field with q elements and a : Fin q → F. Then a is a bijection iff ∑_i a_i^t = 0 for 0 ≤ t ≤ q − 2 and ∑_i a_i^{q−1} = −1.

The hypotheses are as follows. F finite, q = Fintype.card F; 0^0 = 1 (Mathlib's convention), so t = 0 gives ∑ 1 = q = 0 in F.

A proof proceeds as follows. ⇒: reindex by the bijection and use ∑_{x∈F} x^t = 0 for t < q − 1 (mathlib:FiniteField.sum_pow_lt_card_sub_one) and ∑_{x∈F} x^{q−1} = q − 1 = −1 (every nonzero x has x^{q−1} = 1, mathlib:FiniteField.pow_card_sub_one_eq_one). For each i the polynomial g_i(X)=1−(X−a_i)^(q−1) evaluates to 1 at a_i and 0 elsewhere. Expanding with the characteristic-p binomial identity gives g=Σ_i g_i=−Σ_{t<q}(Σ_i a_i^t)X^(q−1−t). Its value at c is the multiplicity of c modulo p, not the indicator of the value set. The hypotheses give g=1, hence every c occurs a number congruent to 1 modulo p and therefore occurs at least once. Since there are q slots and q values, each occurs exactly once. Counting multiplicities modulo p, followed by the cardinality argument, is essential.

In particular, verify the following values and consequences.

- Any enumeration of ZMod 5 has ∑ a_i² = 0 and ∑ a_i⁴ = −1.
- The constant sequence a_i = 0 fails at t = q − 1 (sum 0 ≠ −1).

*Needs:* `FiniteField.sum_pow_lt_card_sub_one`, `FiniteField.pow_card_sub_one_eq_one`, `Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero'`.

See [Shallue](#source-29) — Chapter 1, Lemma 1.4, printed p. 9.

<a id="FF4-top-coefficient-of-reduction"></a>

#### The X^{q−1}-coefficient of a reduction mod X^q − X is minus the value sum

Let F be a finite field with q elements and g ∈ F[X]. The coefficient of X^{q−1} in g %ₘ (X^q − X) equals −∑_{c∈F} g(c).

The hypotheses are as follows. F finite, q = Fintype.card F ≥ 2.

A proof proceeds as follows. g and its reduction r agree on F (Shallue Lemma 1.2) and deg r ≤ q − 1; by the Carlitz interpolation formula r = ∑_c g(c)(1 − (X − c)^{q−1}) (both sides have degree ≤ q − 1 and agree on F), whose X^{q−1}-coefficient is −∑_c g(c). Uniqueness of the interpolant: mathlib:Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero'.

In particular, verify the following values and consequences.

- For g = X^{q−1}: the reduction is X^{q−1} with coefficient 1 = −(q − 1).
- For g = 1 the coefficient is 0 = −q.

*Needs:* [Permutation polynomials of a finite field](#FF4-permutation-polynomial), `Polynomial.modByMonic`, `Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero'`, `FiniteField.pow_card`.

See [Shallue](#source-29) — Chapter 1, proof of Theorem 1.5, printed p. 10; [Shallue](#source-29) — Chapter 1, Lemma 1.1 and (1.1), printed pp. 5–6.

<a id="FF4-hermite-criterion"></a>

#### Hermite's criterion

Let F be a finite field with q = p^r elements and f ∈ F[X]. Then f is a permutation polynomial of F iff (1) the reduction f^{q−1} %ₘ (X^q − X) has degree q − 1 (under condition (2), equivalently monic of degree q−1; these are not standalone equivalent conditions), and (2) for every t with 1 ≤ t ≤ q − 2 and p ∤ t, the reduction f^t %ₘ (X^q − X) has degree ≤ q − 2.

The hypotheses are as follows. F finite of characteristic p with q elements, q ≥ 2.

A proof proceeds as follows. By top-coefficient-of-reduction the X^{q−1}-coefficient of f^t %ₘ (X^q − X) is −∑_c f(c)^t. ⇒: power-sums-detect-enumerations applied to (f(c))_c gives the coefficient conditions. Condition (2) and Frobenius give all power sums for 1≤t≤q−2 equal to zero; t=0 is automatic. Condition (1) gives top coefficient c≠0, not immediately c=1. In the multiplicity polynomial of power-sums-detect-enumerations, all other coefficients vanish, so it is the nonzero constant c. Every field value therefore has a nonzero multiplicity modulo p and must occur. Equality of the total number of slots and values forces each multiplicity to be exactly 1, so c=1 and the enumeration is bijective.

In particular, verify the following values and consequences.

- q = 5, f = X³: condition (2) at t = 1, 2, 3 and (1) hold (X³ permutes F₅ since gcd(3, 4) = 1).
- q = 5, f = X²: t = 2 gives X⁴ of degree 4 = q − 1, violating (2).

*Needs:* [The X^{q−1}-coefficient of a reduction mod X^q − X is minus the value sum](#FF4-top-coefficient-of-reduction), [Power sums detect enumerations of F_q](#FF4-power-sums-detect-enumerations), [Permutation polynomials of a finite field](#FF4-permutation-polynomial), `frobenius`.

See [Shallue](#source-29) — Chapter 1, Theorem 1.5, printed p. 10.

<a id="FF4-hermite-criterion-one-root"></a>

#### Hermite's criterion with exactly one root

Let F be a finite field with q = p^r elements and f ∈ F[X]. Then f is a permutation polynomial of F iff (1) f has exactly one root in F, and (2) for every t with 1 ≤ t ≤ q − 2 and p ∤ t, the reduction f^t %ₘ (X^q − X) has degree ≤ q − 2.

The hypotheses are as follows. F finite of characteristic p with q elements, q ≥ 2.

A proof proceeds as follows. ⇒: a bijection has exactly one root; (2) holds by hermite-criterion. ⇐: if f has exactly j = 1 root then ∑_c f(c)^{q−1} = q − 1 = −1, so the X^{q−1}-coefficient of f^{q−1} %ₘ (X^q − X) is 1 (top-coefficient-of-reduction) and hermite-criterion applies. Only this implication is needed: the converse 'coefficient 1 ⇒ exactly one root' asserted in the source's proof is false for non-prime q.

In particular, verify the following values and consequences.

- X^4 − 1 over GaloisField 3 2 (q = 9) has four roots, yet the X⁸-coefficient of (X⁴ − 1)⁸ mod X⁹ − X is −(9 − 4) = 1 in F₉: the step 'coefficient 1 iff exactly one root' fails, while the theorem is unaffected.
- Every linear polynomial aX + b with a ≠ 0 satisfies (1) and (2).

*Needs:* [Hermite's criterion](#FF4-hermite-criterion), [The X^{q−1}-coefficient of a reduction mod X^q − X is minus the value sum](#FF4-top-coefficient-of-reduction).

See [Shallue](#source-29) — Chapter 1, Theorem 1.6 and proof, printed pp. 10–11.

<a id="FF4-permutation-character-criterion"></a>

#### Character-sum criterion for permutation polynomials

Let F be a finite field and f ∈ F[X]. Then f is a permutation polynomial of F iff ∑_{c∈F} ψ(f(c)) = 0 for every nontrivial additive character ψ : AddChar F ℂ.

The hypotheses are as follows. F finite; characters with values in ℂ.

A proof proceeds as follows. ⇒: reindex the sum by the bijection f and use ∑_x ψ(x) = 0 for ψ ≠ 1 (mathlib:AddChar.sum_eq_zero_of_ne_one). ⇐: for a ∈ F, the number of c with f(c) = a is (1/q) ∑_ψ ∑_c ψ(f(c) − a) (orthogonality, mathlib:AddChar.sum_eq_ite applied to the dual group, which has q elements for a finite field); the hypothesis leaves only the trivial character's contribution q/q = 1.

In particular, verify the following values and consequences.

- For f = X² on F₅ and ψ(x) = e(x/5), ∑_c ψ(c²) is the quadratic Gauss sum √5 ≠ 0.
- For f=X+1 every nontrivial character sum vanishes; the trivial-character sum is q, not zero.

*Needs:* [Permutation polynomials of a finite field](#FF4-permutation-polynomial), `AddChar.sum_eq_zero_of_ne_one`, `AddChar.sum_eq_ite`, [Every additive character is a multiplicative shift of a primitive one](#FF1-additive-characters-are-shifts).

See [Shallue](#source-29) — Chapter 1, Theorem 1.9, printed p. 11.

<a id="FF4-monomial-permutation-criterion"></a>

#### X^n permutes F_q iff gcd(n, q − 1) = 1

Let F be a finite field with q elements and n ≥ 1. Then X^n is a permutation polynomial of F iff Nat.Coprime n (q − 1).

The hypotheses are as follows. F finite; n ≥ 1 (for n = 0, X^0 = 1 is not a permutation when q ≥ 2).

A proof proceeds as follows. 0^n = 0, so X^n permutes F iff x ↦ x^n permutes Fˣ. Fˣ is cyclic of order q − 1; the n-th power map on a finite group of order N is bijective when gcd(n, N) = 1 (mathlib:powCoprime), and when g = gcd(n, q − 1) > 1 its kernel contains a nontrivial g-th root of unity (a generator raised to (q − 1)/g).

In particular, verify the following values and consequences.

- X³ permutes ZMod 11 (gcd(3, 10) = 1); X² does not.
- X^q permutes F (gcd(q, q − 1) = 1): it is the identity map.

*Needs:* [Permutation polynomials of a finite field](#FF4-permutation-polynomial), `powCoprime`, `IsCyclic.exists_generator`, `FiniteField.pow_card_sub_one_eq_one`.

See [Shallue](#source-29) — Chapter 1, Theorem 1.14(2) and proof, printed p. 14.

<a id="FF4-no-permutation-polynomial-of-degree-dividing"></a>

#### No permutation polynomial of degree n > 1 with n ∣ q − 1

Let F be a finite field with q elements and n ≥ 2 with n ∣ q − 1. Then no polynomial of natDegree n is a permutation polynomial of F.

The hypotheses are as follows. n ≥ 2 (the source omits this hypothesis; for n = 1 the claim is false).

A proof proceeds as follows. Write q − 1 = n m; n ≥ 2 gives 1 ≤ m ≤ q − 2, and p ∤ m since m ∣ q − 1. f^m has degree nm = q − 1 < q, so it is its own reduction, of degree q − 1 > q − 2, violating condition (2) of hermite-criterion at t = m.

In particular, verify the following values and consequences.

- No quadratic polynomial permutes a finite field of odd order.
- Linear polynomials are permutation polynomials although 1 ∣ q − 1, which is why n ≥ 2 is required.

*Needs:* [Hermite's criterion](#FF4-hermite-criterion).

See [Shallue](#source-29) — Chapter 1, Corollary 1.8 and proof, printed p. 11.

<a id="FF4-dickson-functional-equation"></a>

#### Dickson polynomials of the first kind: D_n(u + a/u, a) = u^n + (a/u)^n

Let R be a commutative ring, a ∈ R and x, y ∈ R with x·y = a. Then for every n, (dickson 1 a n).eval (x + y) = x^n + y^n, where dickson 1 a n is Mathlib's n-th Dickson polynomial of the first kind with parameter a (dickson 1 a 0 = 2, dickson 1 a 1 = X, D_{n+2} = X D_{n+1} − a D_n). In particular D_n(x, 0) = x^n for n ≥ 1.

The hypotheses are as follows. R commutative; no invertibility is needed (the form u + a/u is recovered with x = u, y = a/u when u is a unit).

A proof proceeds as follows. Two-step induction on n with the recurrence (mathlib:Polynomial.dickson_add_two): x^{n+2} + y^{n+2} = (x + y)(x^{n+1} + y^{n+1}) − xy(x^n + y^n) and xy = a. Base cases: dickson 1 a 0 = 3 − 1 = 2 = x^0 + y^0 (mathlib:Polynomial.dickson_zero) and dickson 1 a 1 = X (mathlib:Polynomial.dickson_one). This generalises mathlib:Polynomial.dickson_one_one_eval_add_inv (the case a = 1).

In particular, verify the following values and consequences.

- D_2(x, a) = x² − 2a: with x·y = a, (x + y)² − 2a = x² + y².
- a = 0, y = 0: D_n(x, 0) = x^n for n ≥ 1.

*Needs:* `Polynomial.dickson`, `Polynomial.dickson_add_two`, `Polynomial.dickson_zero`, `Polynomial.dickson_one`, `Polynomial.dickson_one_one_eval_add_inv`.

See [Bluher](#source-23) — Section 1, footnote 1, printed p. 1; [Shallue](#source-29) — Chapter 1, Definition 1.2, printed p. 17.

<a id="FF4-dickson-parametrisation"></a>

#### Every x ∈ F_q is u + a/u with u ∈ F_q^× or u^{q+1} = a

Let F be a finite field with q elements, a ∈ F^× and L a quadratic extension of F (e.g. GaloisField p (2r) when q = p^r). For every x ∈ F there is u ∈ L^× with x = u + a/u, and then either u ∈ F^× (u^{q−1} = 1) or u^{q+1} = a; conversely u + a/u ∈ F whenever u^{q−1} = 1 or u^{q+1} = a. Moreover u + a/u = v + a/v iff v ∈ {u, a/u}.

The hypotheses are as follows. F finite with q elements; a ≠ 0; L ⊇ F with [L : F] = 2.

A proof proceeds as follows. x = u + a/u iff u² − xu + a = 0; this quadratic splits in L, and its roots are nonzero since their product is a. x ∈ F iff x^q = x iff u^q + a/u^q = u + a/u iff (u^q − u)(1 − a/u^{q+1}) = 0, i.e. u^q = u or u^{q+1} = a (computation with the Frobenius of L/F). u + a/u = v + a/v ⟺ (uv − a)(u − v) = 0 (clear denominators).

In particular, verify the following values and consequences.

- For q = 5, a = 1, x = 0: u² + 1 = 0 has u = 2 ∈ F₅ (u^{q−1} = 1).
- For q = 3, a = 1, x = 0: u² + 1 = 0 has no root in F₃ (−1 is a nonsquare there); its roots in F₉ have order 4, so u^{q+1} = u⁴ = 1 = a.

*Needs:* `GaloisField`, `FiniteField.pow_card`.

See [Bluher](#source-23) — Section 2, Lemma 2.1 and proof, printed p. 5; [Bluher](#source-23) — Section 2, (10), printed p. 5.

<a id="FF4-dickson-permutation-criterion"></a>

#### Dickson's theorem: D_n(x, a) permutes F_q iff gcd(n, q² − 1) = 1

Let F be a finite field with q elements, a ∈ F^× and n ≥ 1. Then the Dickson polynomial dickson 1 a n is a permutation polynomial of F iff Nat.Coprime n (q² − 1). For a = 0, dickson 1 0 n = X^n permutes F iff Nat.Coprime n (q − 1) (monomial-permutation-criterion).

The hypotheses are as follows. F finite with q elements; n ≥ 1; the main statement needs a ≠ 0.

A proof proceeds as follows. Parametrise F by dickson-parametrisation: F = {u + a/u : u ∈ μ_{q−1}} ∪ {u + a/u : u ∈ A}, A = {u ∈ L : u^{q+1} = a}. By dickson-functional-equation D_n(u + a/u) = u^n + (a/u)^n = u^n + a^n/u^n; D_n maps the first part via u ↦ u^n on μ_{q−1} (parameter a^n, still in F) and the second via u ↦ u^n on the coset A (u^{n(q+1)} = a^n). If gcd(n, q² − 1) = 1 then u ↦ u^n is injective on L^× (order q² − 1, mathlib:powCoprime) and, with the fibre description of dickson-parametrisation (u + a/u = v + a/v iff v ∈ {u, a/u}, and a^n/u^n=(a/u)^n), D_n is injective on F; injective on a finite set means bijective. For necessity pick a prime ℓ dividing both n and q²−1. If ℓ=2, q is odd and n even; recurrence gives D_n(−x,a)=D_n(x,a), so x=1 and −1 collide. If ℓ is odd, it divides q−1 or q+1. In the first case take an orbit u·μ_ℓ in F×; in the second take such an orbit in the nonempty quadratic-extension norm coset A={u:u^(q+1)=a}, nonempty by finite-field norm surjectivity. Each orbit has ℓ≥3 elements and all u^n, hence all D_n(u+a/u,a), agree. The parametrization map has fibres of size at most two, so at least two distinct inputs in F collide. This gives a complete general-a proof without assuming the a=1 value-set count extends unchanged.

In particular, verify the following values and consequences.

- D_5(x, 1) = x⁵ − 5x³ + 5x permutes F₇ (gcd(5, 48) = 1): its values at 0, …, 6 are 0, 1, 2, 4, 3, 5, 6.
- D_3(x, 1) = x³ − 3x does not permute F₅ since 3 ∣ 24 = 5² − 1, although gcd(3, 5 − 1) = 1 (so X³ does permute F₅): the parameter a ≠ 0 changes the criterion.

*Needs:* [Dickson polynomials of the first kind: D_n(u + a/u, a) = u^n + (a/u)^n](#FF4-dickson-functional-equation), [Every x ∈ F_q is u + a/u with u ∈ F_q^× or u^{q+1} = a](#FF4-dickson-parametrisation), [X^n permutes F_q iff gcd(n, q − 1) = 1](#FF4-monomial-permutation-criterion), [Permutation polynomials of a finite field](#FF4-permutation-polynomial), `powCoprime`, `Polynomial.dickson`, `FiniteField.unitsMap_norm_surjective`.

See [Shallue](#source-29) — Chapter 1, Theorem 1.22, printed p. 17; [Bluher](#source-23) — Section 2, Proposition 2.4 and following remark, printed p. 6.

### 4.5 Linear recurring sequences, m-sequences and correlation

<a id="FF4-least-period-of-sequence"></a>

#### The least period of a purely periodic sequence

For a type α let seqShift : (ℕ → α) → (ℕ → α), (seqShift s) n = s (n + 1). The least period of s : ℕ → α is seqLeastPeriod s := Function.minimalPeriod seqShift s: the least T ≥ 1 with s (n + T) = s n for all n, and 0 (Mathlib's junk value) when s is not purely periodic. A sequence is eventually periodic if some shift seqShift^[k] s is purely periodic; its preperiod is the least such k.

The hypotheses are as follows. α arbitrary; no finiteness needed for the definition.

A proof proceeds as follows. seqShift^[T] s = s ↔ ∀ n, s (n + T) = s n (Function.iterate_succ_apply and funext), so Function.IsPeriodicPt seqShift T s is the usual periodicity. Divisibility: every period is a multiple of the least period (mathlib:Function.IsPeriodicPt.minimalPeriod_dvd); the least period is a period (mathlib:Function.isPeriodicPt_minimalPeriod). Positivity iff purely periodic: mathlib:Function.minimalPeriod_pos_iff_mem_periodicPts.

Provide the following interface.

- `seqShift`: (seqShift s) n = s (n + 1).
- `seqLeastPeriod`: seqLeastPeriod s = Function.minimalPeriod seqShift s.
- `isPeriodicPt_seqShift_iff`: Function.IsPeriodicPt seqShift T s ↔ ∀ n, s (n + T) = s n.
- `seqLeastPeriod_dvd_of_periodic`: If s (n + T) = s n for all n, then seqLeastPeriod s ∣ T.
- `periodic_seqLeastPeriod`: s (n + seqLeastPeriod s) = s n for all n.
- `seqLeastPeriod_pos_iff`: 0 < seqLeastPeriod s ↔ ∃ T > 0, ∀ n, s (n + T) = s n.
- `seqLeastPeriod_seqShift`: seqLeastPeriod (seqShift s) = seqLeastPeriod s for purely periodic s.

**Checks.**

- `seqLeastPeriod_fibonacci_zmod_two`: The Fibonacci sequence mod 2 (0, 1, 1, 0, …) has seqLeastPeriod 3.
- `seqLeastPeriod_const`: A constant sequence has seqLeastPeriod 1.
- `seqLeastPeriod_not_purely_periodic`: The sequence 1, 0, 0, 0, … has seqLeastPeriod 0, although it is eventually periodic.
- `seqLeastPeriod_eq_minimalPeriod`: seqLeastPeriod s = Function.minimalPeriod seqShift s, and s (n + T) = s n for all n iff Function.IsPeriodicPt seqShift T s.


In particular, verify the following values and consequences.

- The sequence 0, 1, 1, 0, 1, 1, … over ZMod 2 has least period 3.
- 1, 0, 0, 0, … is eventually periodic with preperiod 1 but has seqLeastPeriod 0.

*Needs:* `Function.minimalPeriod`, `Function.IsPeriodicPt`, `Function.IsPeriodicPt.minimalPeriod_dvd`, `Function.isPeriodicPt_minimalPeriod`, `Function.minimalPeriod_pos_iff_mem_periodicPts`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 5, Section 5.1.a 'Periodicity', printed p. 112; [Goresky–Klapper (2009)](#source-26) — Chapter 6, proof of Corollary 6.2.2, printed p. 159.

<a id="FF4-order-of-polynomial"></a>

#### The order (period, exponent) of a polynomial over a finite field

Let F be a field and f ∈ F[X]. The order of f is polyOrder f := orderOf (AdjoinRoot.root f), the multiplicative order of the class of X in F[X]/(f). For f with f(0) ≠ 0 over a finite field it is the least e ≥ 1 with f ∣ X^e − 1; if f(0) = 0 (or f = 0 over an infinite field) the value is the junk 0. Pinned: the order of a constant nonzero polynomial is 1.

The hypotheses are as follows. F a field; the positivity and divisibility statements assume F finite.

A proof proceeds as follows. Define polyOrder f := orderOf (AdjoinRoot.root f) in the monoid AdjoinRoot f. root^e = 1 in AdjoinRoot f ↔ f ∣ X^e − 1 (AdjoinRoot.mk_eq_mk / AdjoinRoot.mk_eq_zero); hence f ∣ X^e − 1 ↔ polyOrder f ∣ e (orderOf_dvd_iff_pow_eq_one). For F finite and f(0) ≠ 0 the root is a unit of the finite ring AdjoinRoot f (X is invertible modulo f since gcd(X, f) = 1), so its order is positive and divides #(AdjoinRoot f)ˣ (orderOf_dvd_card); for f irreducible of degree m, AdjoinRoot f is a field with q^m elements and polyOrder f ∣ q^m − 1. The irreducible divisibility clause also requires f.coeff 0≠0; for the irreducible f=X the order is zero and does not divide q−1. For irreducible f and a root α in any field extension L, F[X]/(f) ≅ F(α) sends root to α, so polyOrder f = orderOf α. The reverse polynomial X^m f(1/X) has the same order (Goresky–Klapper Lemma 6.1.5: f g = X^N − 1 gives f* g* = ±(X^N − 1)).

Provide the following interface.

- `polyOrder`: polyOrder f = orderOf (AdjoinRoot.root f).
- `dvd_X_pow_polyOrder_sub_one`: f ∣ X^(polyOrder f) − 1.
- `dvd_X_pow_sub_one_iff_polyOrder_dvd`: f ∣ X^e − 1 ↔ polyOrder f ∣ e.
- `polyOrder_pos_iff`: For F finite and f ≠ 0: 0 < polyOrder f ↔ f.coeff 0 ≠ 0.
- `polyOrder_dvd_card_pow_sub_one`: For F finite, f irreducible, and f.coeff 0≠0: polyOrder f divides q^(natDegree f)−1.
- `polyOrder_eq_orderOf`: For f irreducible and α a root of f in a field L ⊇ F: polyOrder f = orderOf α.
- `polyOrder_reverse`: For f.coeff 0 ≠ 0: polyOrder f.reverse = polyOrder f.

**Checks.**

- `polyOrder_X_pow_four_add_X_add_one`: polyOrder (X^4 + X + 1 : (ZMod 2)[X]) = 15.
- `polyOrder_X_sq_add_X_add_one`: polyOrder (X^2 + X + 1 : (ZMod 2)[X]) = 3.
- `polyOrder_X`: polyOrder (X : F[X]) = 0: X is not invertible modulo X.
- `polyOrder_X_add_one_sq`: polyOrder ((X + 1)^2 : (ZMod 2)[X]) = 2 (a reducible polynomial whose order is not q^m − 1).


In particular, verify the following values and consequences.

- polyOrder (X⁴ + X + 1) = 15 and polyOrder (X⁴ + X³ + X² + X + 1) = 5 over ZMod 2.
- polyOrder ((X + 1)²) = 2 over ZMod 2, since (X + 1)² = X² + 1.

*Needs:* `AdjoinRoot.root`, `orderOf`, `orderOf_dvd_card`, `AdjoinRoot`, `Polynomial.reverse`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 3, Section 3.2, proof of Theorem 3.2.1, printed p. 65; [Goresky–Klapper (2009)](#source-26) — Chapter 6, Lemma 6.1.5, printed p. 156.

<a id="FF4-primitive-polynomial"></a>

#### Primitive polynomials over a finite field

Let F be a finite field with q elements. A polynomial f ∈ F[X] is a primitive polynomial, IsPrimitivePoly f, if f is monic and irreducible of degree m ≥ 1 and the class of X generates the cyclic group (F[X]/(f))ˣ, i.e. polyOrder f = q^m − 1. Equivalently: f is the minimal polynomial over F of a generator of the multiplicative group of the field with q^m elements. Name pinned as IsPrimitivePoly because Mathlib's Polynomial.IsPrimitive means content 1.

The hypotheses are as follows. F finite with q elements; m = natDegree f ≥ 1.

A proof proceeds as follows. Define IsPrimitivePoly f := f.Monic ∧ Irreducible f ∧ 1 ≤ f.natDegree ∧ polyOrder f = q^(f.natDegree) − 1. Characterisation (Goresky–Klapper Lemma 3.2.10): for monic f with f(0) ≠ 0, polyOrder f = q^m − 1 already forces irreducibility, because for a reducible f the order of X modulo f is bounded by the lcm of the orders modulo the factors, which is < q^m − 1 (the unit group of F[X]/(f) then has order < q^m − 1). Minimal polynomials of generators: if γ generates (GaloisField p (r m))ˣ, minpoly F γ is monic irreducible of degree m with polyOrder = orderOf γ = q^m − 1 (order-of-polynomial). Count: generators of a cyclic group of order q^m − 1 number φ(q^m − 1), each primitive polynomial has m roots, all generators (the Frobenius conjugates), so there are φ(q^m − 1)/m primitive polynomials of degree m.

Provide the following interface.

- `IsPrimitivePoly`: IsPrimitivePoly f :↔ f.Monic ∧ Irreducible f ∧ 1 ≤ f.natDegree ∧ polyOrder f = q^(natDegree f) − 1.
- `IsPrimitivePoly.irreducible`: A primitive polynomial is irreducible.
- `isPrimitivePoly_iff_polyOrder`: For monic f with 1 ≤ natDegree f and f.coeff 0 ≠ 0: IsPrimitivePoly f ↔ polyOrder f = q^(natDegree f) − 1.
- `IsPrimitivePoly.root_zpowers`: The class of X generates (AdjoinRoot f)ˣ.
- `isPrimitivePoly_minpoly`: If γ generates the units of a finite field L ⊇ F of degree m, minpoly F γ is primitive of degree m.
- `card_isPrimitivePoly`: The number of primitive polynomials of degree m ≥ 1 is φ(q^m − 1)/m.
- `IsPrimitivePoly.reverse`: The monic normalisation of the reverse of a primitive polynomial is primitive.

**Checks.**

- `IsPrimitivePoly.X_pow_four_add_X_add_one`: IsPrimitivePoly (X^4 + X + 1 : (ZMod 2)[X]).
- `IsPrimitivePoly.not_cyclotomic_five`: X^4 + X^3 + X^2 + X + 1 ∈ (ZMod 2)[X] is irreducible but not IsPrimitivePoly (its order is 5).
- `IsPrimitivePoly.X_sub_two_zmod_five`: For m = 1: IsPrimitivePoly (X − 2 : (ZMod 5)[X]) and ¬ IsPrimitivePoly (X − 4 : (ZMod 5)[X]).
- `IsPrimitivePoly.content_primitive_not`: Every monic polynomial is Polynomial.IsPrimitive (content 1), but X^4 + X^3 + X^2 + X + 1 ∈ (ZMod 2)[X] is monic and not IsPrimitivePoly: the two notions differ.


In particular, verify the following values and consequences.

- X⁴ + X + 1 is primitive over ZMod 2; X⁴ + X³ + X² + X + 1 is irreducible but not primitive.
- Over ZMod 5, X − 2 is primitive (2 generates F₅ˣ) and X − 4 is not.

*Needs:* [The order (period, exponent) of a polynomial over a finite field](#FF4-order-of-polynomial), `minpoly`, `IsCyclic.exists_generator`, `Nat.totient`, `Polynomial.IsPrimitive`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 3, Section 3.2.c, printed p. 67; [Goresky–Klapper (2009)](#source-26) — Chapter 3, Lemma 3.2.10, printed p. 67; [Goresky–Klapper (2009)](#source-26) — Chapter 13, Proposition 13.2.1(4), printed p. 314.

<a id="FF4-lrs-eventually-periodic"></a>

#### Linear recurring sequences over a finite ring are eventually periodic

Let R be a finite commutative ring and E : LinearRecurrence R of order m (Mathlib: u(n + m) = ∑_{i<m} c_i u(n + i)). Every solution u is eventually periodic. For m≥1, if the coefficient c_0 is a unit (equivalently the characteristic polynomial E.charPoly has unit constant coefficient), every solution is purely periodic: 0 < seqLeastPeriod u.

The hypotheses are as follows. R finite commutative; m ≥ 0 (for m = 0 the only solution is 0).

A proof proceeds as follows. The state vector s_n = (u(n), …, u(n + m − 1)) ∈ R^m determines the future (s_{n+1} = A s_n with A the transposed companion matrix; ClassicalArithmeticCompletion:CA.2/linear-recurrence-as-a-matrix-power), and R^m is finite, so s_i = s_j for some i < j; then u(n + j − i) = u(n) for n ≥ i. If c_0 is a unit, the state map is invertible (det of the companion matrix is ± c_0; CA.2/companion-matrix), so s_i = s_j implies s_0 = s_{j−i}: purely periodic; conclude with least-period-of-sequence. Handle order m=0 first: the recurrence forces u=0, with least period 1; the c_0 condition is used only when m≥1.

In particular, verify the following values and consequences.

- Over ZMod 2 the recurrence u(n + 2) = u(n + 1) + u(n) has purely periodic solutions of period dividing 3.
- The recurrence u(n + 1) = 0·u(n) (c_0 = 0) has the eventually periodic, not purely periodic, solution 1, 0, 0, ….

*Needs:* [The least period of a purely periodic sequence](#FF4-least-period-of-sequence), `ClassicalArithmeticCompletion:CA.2/linear-recurrence-as-a-matrix-power`, `ClassicalArithmeticCompletion:CA.2/companion-matrix`, `LinearRecurrence`, `LinearRecurrence.IsSolution`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 6, Section 6.1, printed p. 154; [Goresky–Klapper (2009)](#source-26) — Chapter 6, Section 6.1, printed p. 154.

<a id="FF4-period-divides-polynomial-order"></a>

#### The period of a linear recurring sequence divides the order of its characteristic polynomial

Let F be a finite field, E : LinearRecurrence F of order m ≥ 1 with charPoly f := E.charPoly satisfying f.coeff 0 ≠ 0, and u a solution. Then u is purely periodic and seqLeastPeriod u ∣ polyOrder f.

The hypotheses are as follows. F finite field; f(0) ≠ 0 (so polyOrder f > 0).

A proof proceeds as follows. Let T = polyOrder f, so f ∣ X^T − 1 (order-of-polynomial). The companion matrix A satisfies f(A) = 0 (CA.2/companion-matrix: minpoly of the companion matrix is f), hence A^T = I. s_T = A^T s_0 = s_0 (CA.2/linear-recurrence-as-a-matrix-power), so T is a period of u, and seqLeastPeriod u ∣ T (least-period-of-sequence).

In particular, verify the following values and consequences.

- For f = X² + X + 1 over ZMod 2 (order 3) every solution has period 1 or 3.
- The zero solution has period 1, which divides every order.

*Needs:* [The order (period, exponent) of a polynomial over a finite field](#FF4-order-of-polynomial), [The least period of a purely periodic sequence](#FF4-least-period-of-sequence), `ClassicalArithmeticCompletion:CA.2/companion-matrix`, `ClassicalArithmeticCompletion:CA.2/linear-recurrence-as-a-matrix-power`, `LinearRecurrence.charPoly`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 6, Corollary 6.2.2 and proof, printed p. 159.

<a id="FF4-impulse-response-period"></a>

#### The impulse response has period exactly the order

In the setting of period-divides-polynomial-order, the impulse-response solution (initial values u(0) = 1, u(1) = ⋯ = u(m − 1) = 0; Mathlib's E.mkSol) has seqLeastPeriod equal to polyOrder E.charPoly.

The hypotheses are as follows. F finite field; m ≥ 1; E.charPoly has nonzero constant coefficient.

A proof proceeds as follows. The states s_0 = e_0, s_1, …, s_{m−1} of the impulse response form a basis of F^m (triangular with nonzero diagonal c_0; Goresky–Klapper's argument with the invertible coefficient). If r is a period of u, A^r fixes s_0 and hence every s_k = A^k s_0, so A^r = I and f ∣ X^r − 1 (f is the minimal polynomial of A, CA.2/companion-matrix); so polyOrder f ∣ r. Combine with period-divides-polynomial-order.

In particular, verify the following values and consequences.

- Over ZMod 2 with u(n + 4) = u(n + 1) + u(n) (charPoly X⁴ + X + 1, order 15) the impulse response has period 15.
- For charPoly X⁴ + X³ + X² + X + 1 the impulse response has period 5.

*Needs:* [The period of a linear recurring sequence divides the order of its characteristic polynomial](#FF4-period-divides-polynomial-order), [The order (period, exponent) of a polynomial over a finite field](#FF4-order-of-polynomial), `ClassicalArithmeticCompletion:CA.2/companion-matrix`, `ClassicalArithmeticCompletion:CA.2/linear-recurrence-as-a-matrix-power`, `LinearRecurrence.mkSol`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 6, Corollary 6.2.2 and proof, printed p. 159.

<a id="FF4-trace-representation-of-lrs"></a>

#### Trace representation of linear recurring sequences with irreducible characteristic polynomial

Let F be a finite field, E : LinearRecurrence F of order m ≥ 1 whose charPoly f is irreducible, L a field extension of F of degree m and β ∈ L a root of f. Then for every solution u there is a unique A ∈ L with u(n) = Tr_{L/F}(A β^n) for all n; conversely each such sequence is a solution. (When f.coeff 0≠0, so β≠0: in Goresky–Klapper's connection-polynomial convention a_n = T(α^{−n}A) with α = β^{−1} a root of the connection polynomial.)

The hypotheses are as follows. F finite; f = E.charPoly irreducible of degree m; [L : F] = m; β a root of f in L.

A proof proceeds as follows. n ↦ Tr(A β^n) solves the recurrence: A β^n f(β) = 0 and Tr is F-linear (Goresky–Klapper Theorem 6.6.4). The map L → F^m, A ↦ (Tr(A β^i))_{i<m} is injective: if Tr(Aβ^i) = 0 for i < m then Tr(A x) = 0 for all x (1, β, …, β^{m−1} is a basis of L = F(β)), and the trace form is nondegenerate for the separable extension L/F (mathlib:traceForm_nondegenerate), so A = 0. Both sides have q^m elements, so the map is onto the space of initial values; solutions are determined by initial values (mathlib:LinearRecurrence.eq_mk_of_is_sol_of_eq_init).

In particular, verify the following values and consequences.

- Fibonacci mod 2 (charPoly X² + X + 1): u(n) = Tr_{F₄/F₂}(A ω^n) with ω² = ω + 1; the solution 0, 1, 1, … has A = 1 (Tr(1) = 0, Tr(ω) = Tr(ω²) = 1).
- The zero sequence corresponds to A = 0.
- The irreducible degree-one characteristic polynomial X gives β=0 and sequences (A,0,0,…); the trace representation still holds, but its reciprocal-root reformulation is not available.

*Needs:* `ClassicalArithmeticCompletion:CA.2/linear-recurrence-of-a-monic-polynomial`, `Algebra.trace`, `traceForm_nondegenerate`, `LinearRecurrence.eq_mk_of_is_sol_of_eq_init`, `LinearRecurrence.charPoly`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 6, Theorem 6.6.4, printed p. 170; [Goresky–Klapper (2009)](#source-26) — Chapter 6, Proposition 6.6.5(2), printed p. 171.

<a id="FF4-period-of-irreducible-recurrence"></a>

#### A nonzero solution with irreducible characteristic polynomial has period equal to the order

Let F be a finite field and E : LinearRecurrence F with irreducible charPoly f, f ≠ X. Every nonzero solution u has seqLeastPeriod u = polyOrder f; it divides q^m − 1, m = deg f.

The hypotheses are as follows. F finite; f irreducible, f ≠ X (so f(0) ≠ 0).

A proof proceeds as follows. By trace-representation-of-lrs, u(n) = Tr(Aβ^n) with A ≠ 0. If T is a period then Tr(A(β^T − 1)β^n) = 0 for all n, hence A(β^T − 1) = 0 by nondegeneracy of the trace form (as in trace-representation-of-lrs), so β^T = 1 and polyOrder f = orderOf β ∣ T (order-of-polynomial, polyOrder_eq_orderOf). Conversely polyOrder f is a period (period-divides-polynomial-order).

In particular, verify the following values and consequences.

- Every nonzero solution of u(n + 4) = u(n + 3) + u(n + 2) + u(n + 1) + u(n) over ZMod 2 (charPoly X⁴ + X³ + X² + X + 1) has period 5.
- For the reducible charPoly (X + 1)² over ZMod 2 the solution 1, 1, 1, … has period 1 ≠ 2 = polyOrder: irreducibility is needed.

*Needs:* [Trace representation of linear recurring sequences with irreducible characteristic polynomial](#FF4-trace-representation-of-lrs), [The order (period, exponent) of a polynomial over a finite field](#FF4-order-of-polynomial), [The period of a linear recurring sequence divides the order of its characteristic polynomial](#FF4-period-divides-polynomial-order).

See [Goresky–Klapper (2009)](#source-26) — Chapter 6, Corollary 6.2.2 and Proposition 6.6.5, printed pp. 159, 171.

<a id="FF4-m-sequence"></a>

#### m-sequences (maximal-length linear recurring sequences)

Let F be a finite field with q elements and m ≥ 1. A sequence u : ℕ → F is an m-sequence of degree m, IsMSequence m u, if u ≠ 0 and u solves a linear recurrence E : LinearRecurrence F of order m whose characteristic polynomial E.charPoly is a primitive polynomial (primitive-polynomial). Equivalent (Goresky–Klapper Definition 13.1.1): u is generated by a length-m recurrence and every nonzero block of length m occurs exactly once in each period (node m-sequence-state-cycle).

The hypotheses are as follows. F finite with q elements; m ≥ 1.

A proof proceeds as follows. Define IsMSequence m u := u ≠ 0 ∧ ∃ E : LinearRecurrence F, E.order = m ∧ IsPrimitivePoly E.charPoly ∧ E.IsSolution u. Period: seqLeastPeriod u = polyOrder E.charPoly = q^m − 1 (period-of-irreducible-recurrence and primitive-polynomial). Trace form: u(n) = Tr(A α^n) with α a generator of the units of the degree-m extension (trace-representation-of-lrs). Shifts and decimations: seqShift u is an m-sequence (same recurrence); the d-fold decimation n ↦ u(dn) with gcd(d, q^m − 1) = 1 is an m-sequence, with characteristic polynomial the minimal polynomial of α^d (Goresky–Klapper Proposition 13.2.1(2)).

Provide the following interface.

- `IsMSequence`: IsMSequence m u :↔ u ≠ 0 ∧ ∃ E : LinearRecurrence F, E.order = m ∧ IsPrimitivePoly E.charPoly ∧ E.IsSolution u.
- `IsMSequence.seqLeastPeriod_eq`: seqLeastPeriod u = q^m − 1.
- `IsMSequence.exists_trace`: u(n) = Tr_{L/F}(A α^n) for some A ≠ 0 and α generating Lˣ, [L : F] = m.
- `IsMSequence.seqShift`: Shifts of m-sequences are m-sequences.
- `IsMSequence.decimate`: If gcd(d, q^m − 1) = 1 then n ↦ u(d n) is an m-sequence of degree m.
- `IsMSequence.decimate_eq_shift_iff`: n ↦ u(d n) is a shift of u iff d ≡ q^j (mod q^m − 1) for some j (Goresky–Klapper Proposition 13.2.1(3), with the congruence made explicit).

**Checks.**

- `IsMSequence.fibonacci_zmod_two`: The Fibonacci sequence mod 2 is IsMSequence 2, with seqLeastPeriod 3.
- `IsMSequence.goresky_klapper_example`: The solution of u(n + 4) = u(n + 1) + u(n) over ZMod 2 with initial values 1, 1, 1, 1 is IsMSequence 4 with seqLeastPeriod 15.
- `IsMSequence.not_period_five`: The solution of u(n + 4) = u(n + 3) + u(n + 2) + u(n + 1) + u(n) with initial values 1, 0, 0, 0 is not IsMSequence 4.
- `IsMSequence.degree_one`: For m = 1: u(n) = c·g^n with c ≠ 0 and g a generator of Fˣ is IsMSequence 1.
- `IsMSequence.zero`: The zero sequence is not an m-sequence.


In particular, verify the following values and consequences.

- The Fibonacci sequence mod 2 is an m-sequence of degree 2 with period 3.
- A nonzero solution for X⁴ + X³ + X² + X + 1 over ZMod 2 is not an m-sequence (period 5 < 15).

*Needs:* [Primitive polynomials over a finite field](#FF4-primitive-polynomial), [A nonzero solution with irreducible characteristic polynomial has period equal to the order](#FF4-period-of-irreducible-recurrence), [Trace representation of linear recurring sequences with irreducible characteristic polynomial](#FF4-trace-representation-of-lrs), [The least period of a purely periodic sequence](#FF4-least-period-of-sequence), `LinearRecurrence`, `LinearRecurrence.charPoly`, `ClassicalArithmeticCompletion:CA.2/linear-recurrence-of-a-monic-polynomial`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 13, Definition 13.1.1, printed p. 312; [Goresky–Klapper (2009)](#source-26) — Chapter 13, Proposition 13.1.2(1)–(2), printed p. 312.

<a id="FF4-m-sequence-state-cycle"></a>

#### The states of an m-sequence run through all nonzero vectors

Let u be an m-sequence of degree m over F (q elements). Then the map n ↦ (u(n), …, u(n + m − 1)), 0 ≤ n < q^m − 1, is a bijection onto F^m \ {0}. Conversely, a sequence generated by a length-m linear recurrence whose states in one period are exactly the nonzero vectors is an m-sequence.

The hypotheses are as follows. F finite; m ≥ 1.

A proof proceeds as follows. The state map is conjugate to multiplication by α on L = F_{q^m} via the trace model (trace-representation-of-lrs: A ↦ (Tr(Aα^i))_{i<m} is an F-linear bijection L → F^m), and α generates Lˣ, so the orbit of A ≠ 0 is Lˣ. Converse (Goresky–Klapper Proposition 13.1.2(1)): the state change is multiplication by x^{−1} on F[x]/(q) (Theorem 6.6.2); cycling through all nonzero states forces every nonzero element to be a power of this element, so F[x]/(q) is a field and the characteristic polynomial is primitive.

In particular, verify the following values and consequences.

- For the Fibonacci sequence mod 2 the states (0,1), (1,1), (1,0) are the three nonzero vectors of F₂².
- For X⁴ + X³ + X² + X + 1 only 5 of the 15 nonzero states occur in a period.

*Needs:* [m-sequences (maximal-length linear recurring sequences)](#FF4-m-sequence), [Trace representation of linear recurring sequences with irreducible characteristic polynomial](#FF4-trace-representation-of-lrs), [Primitive polynomials over a finite field](#FF4-primitive-polynomial).

See [Goresky–Klapper (2009)](#source-26) — Chapter 13, Definition 13.1.1 and proof of Proposition 13.1.2, printed pp. 312–313; [Goresky–Klapper (2009)](#source-26) — Chapter 13, proof of Proposition 13.1.2, printed p. 313.

<a id="FF4-m-sequence-balance"></a>

#### Balance of m-sequences

Let u be an m-sequence of degree m over F with q elements, period N = q^m − 1. In one period each nonzero c ∈ F occurs exactly q^{m−1} times and 0 occurs exactly q^{m−1} − 1 times. More generally each block b ∈ F^k (1 ≤ k ≤ m) occurs q^{m−k} times, except the zero block, which occurs q^{m−k} − 1 times.

The hypotheses are as follows. F finite; m ≥ 1; 1 ≤ k ≤ m.

A proof proceeds as follows. By m-sequence-state-cycle the length-m states in one period are the nonzero vectors, each once; a block of length k is the prefix of q^{m−k} vectors of F^m, all nonzero unless the block is zero, when the zero vector must be removed.

In particular, verify the following values and consequences.

- The binary m-sequence of period 15 has eight 1s and seven 0s.
- Fibonacci mod 2 (period 3): two 1s and one 0.

*Needs:* [The states of an m-sequence run through all nonzero vectors](#FF4-m-sequence-state-cycle).

See [Goresky–Klapper (2009)](#source-26) — Chapter 11, Section 11.2.d, printed p. 278; [Goresky–Klapper (2009)](#source-26) — Chapter 13, Proposition 13.1.2(3), printed p. 312.

<a id="FF4-m-sequence-shift-and-add"></a>

#### The shift-and-add property of m-sequences

Let u be an m-sequence of degree m over F with period N = q^m − 1, c ∈ F and τ ∈ ℕ. Then the sequence n ↦ u(n) + c·u(n + τ) is either identically zero (exactly when 1 + cα^τ = 0 in the trace model; for c = 1 this means α^τ = −1, i.e. τ ≡ 0 mod N when q is even and τ ≡ N/2 mod N when q is odd) or a shift of u: there is s with u(n) + c·u(n + τ) = u(n + s) for all n.

The hypotheses are as follows. F finite; m ≥ 1.

A proof proceeds as follows. With u(n) = Tr(Aα^n), u(n) + c u(n + τ) = Tr(A(1 + cα^τ)α^n); if 1 + cα^τ ≠ 0 it equals α^s for some s since α generates Lˣ, giving u(n + s).

In particular, verify the following values and consequences.

- For the binary m-sequence of period 15 and τ = 1, u + seqShift u = seqShift^[s] u for a unique s mod 15.
- For q = 2, τ = 0: u + u = 0.

*Needs:* [m-sequences (maximal-length linear recurring sequences)](#FF4-m-sequence), [Trace representation of linear recurring sequences with irreducible characteristic polynomial](#FF4-trace-representation-of-lrs).

See [Goresky–Klapper (2009)](#source-26) — Chapter 13, Proposition 13.1.2(4), printed p. 312; [Goresky–Klapper (2009)](#source-26) — Chapter 14, §14.6, printed p. 338.

<a id="FF4-periodic-correlation"></a>

#### Periodic cross-correlation and autocorrelation

For T ∈ ℕ and complex sequences u v : ℕ → ℂ, periodicCorrelation T u v τ := ∑_{i<T} u(i)·conj(v(i + τ)). For sequences a b : ℕ → G in a finite abelian group G and a character χ : AddChar G ℂ, the correlation with respect to χ is charCorrelation χ T a b τ := periodicCorrelation T (χ ∘ a) (χ ∘ b) τ = ∑_{i<T} χ(a_i − b_{i+τ}), and the autocorrelation is charCorrelation χ T a a. Conventions (pinned): the conjugate is on the second (shifted) argument; the sum runs over one period T supplied explicitly.

The hypotheses are as follows. T is a period of the sequences in the theorems (the definition does not require it).

A proof proceeds as follows. Define periodicCorrelation by Finset.sum over Finset.range T. χ(a) conj χ(b) = χ(a − b) for characters into the unit circle (AddChar.map_neg_eq_conj / AddChar.map_sub_eq_div), giving the character form. Shift invariance: if u, v have period T then periodicCorrelation T u v (τ + T) = periodicCorrelation T u v τ, and the sum may be taken over any T consecutive indices. Autocorrelation at 0: periodicCorrelation T u u 0 = ∑ |u i|² = T for unimodular u.

Provide the following interface.

- `periodicCorrelation`: periodicCorrelation T u v τ = ∑_{i<T} u i * conj (v (i + τ)).
- `charCorrelation`: charCorrelation χ T a b τ = periodicCorrelation T (χ ∘ a) (χ ∘ b) τ.
- `charCorrelation_eq_sum_sub`: charCorrelation χ T a b τ = ∑_{i<T} χ (a i − b (i + τ)).
- `periodicCorrelation_add_period`: If u, v are T-periodic, periodicCorrelation T u v (τ + T) = periodicCorrelation T u v τ.
- `periodicCorrelation_self_zero`: For ‖u i‖ = 1: periodicCorrelation T u u 0 = T.
- `periodicCorrelation_conj`: conj (periodicCorrelation T u v τ) = periodicCorrelation T v u (T − τ) for T-periodic u, v and τ ≤ T.

**Checks.**

- `periodicCorrelation_const_one`: periodicCorrelation T 1 1 τ = T.
- `periodicCorrelation_alternating`: For u n = (−1)^n: periodicCorrelation 2 u u 1 = −2.
- `periodicCorrelation_needs_conj`: For u n = I (the imaginary unit): periodicCorrelation 1 u u 0 = 1, whereas ∑ u i * u i = −1: the conjugate is essential.
- `charCorrelation_eq_sum_sub`: charCorrelation χ T a b τ = ∑_{i<T} χ (a i − b (i + τ)).


In particular, verify the following values and consequences.

- For the constant sequence u = 1: periodicCorrelation T u u τ = T for all τ.
- For u = (1, −1, 1, −1, …) and T = 2: the autocorrelation at τ = 1 is −2.

*Needs:* `AddChar`, `starRingEnd`, `AddChar.map_neg_eq_conj`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 11, Definition 11.3.1, printed p. 280; [Goresky–Klapper (2009)](#source-26) — Chapter 14, Proposition 14.8.1, printed p. 339.

<a id="FF4-m-sequence-two-level-autocorrelation"></a>

#### Two-level autocorrelation of m-sequences

Let u be an m-sequence of degree m over F with q elements, N = q^m − 1, and χ : AddChar F ℂ nontrivial. Then charCorrelation χ N u u τ = N if N ∣ τ and = −1 otherwise.

The hypotheses are as follows. F finite; χ ≠ 1.

A proof proceeds as follows. N ∣ τ: every term is χ(0) = 1. Otherwise u(i) − u(i + τ) = Tr(A(1 − α^τ)α^i) with c := A(1 − α^τ) ≠ 0, and i ↦ cα^i runs over Lˣ once per period; so the sum is ∑_{x ∈ Lˣ} χ(Tr x) = ∑_{x∈L} χ(Tr x) − 1 = −1, since χ ∘ Tr is a nontrivial character of L (Tr surjective) and mathlib:AddChar.sum_eq_zero_of_ne_one.

In particular, verify the following values and consequences.

- Binary m-sequence of period 15, χ(x) = (−1)^x: the autocorrelation is 15, −1, −1, …, −1 (Golomb's third postulate).
- For m = 1, q = 5: u(n) = 2^n mod 5 has autocorrelation −1 at τ = 1, 2, 3.

*Needs:* [m-sequences (maximal-length linear recurring sequences)](#FF4-m-sequence), [The states of an m-sequence run through all nonzero vectors](#FF4-m-sequence-state-cycle), [Periodic cross-correlation and autocorrelation](#FF4-periodic-correlation), [Trace representation of linear recurring sequences with irreducible characteristic polynomial](#FF4-trace-representation-of-lrs), `AddChar.sum_eq_zero_of_ne_one`, `Algebra.trace`, `Algebra.trace_surjective`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 11, Section 11.3.a, printed p. 280; [Goresky–Klapper (2009)](#source-26) — Chapter 13, Proposition 13.1.2(4) and Proposition 13.4.1, printed pp. 312, 315.

<a id="FF4-dirichlet-sequence"></a>

#### Dirichlet and Legendre sequences

Let p be a prime, ψ : MulChar (ZMod p) ℂ and c ∈ ℂ. The Dirichlet sequence is dirichletSeq ψ c : ℕ → ℂ, n ↦ c if p ∣ n and ψ(n) otherwise; it has period p. The Legendre sequence of an odd prime p is legendreSeq p := dirichletSeq (quadratic character) 1, with values ±1. Convention (pinned): the value at multiples of p is the explicit parameter c (the source uses c = 0 for Dirichlet sequences and c = 1 for Legendre sequences), never Mathlib's MulChar value ψ(0) = 0 silently.

The hypotheses are as follows. p prime (odd for Legendre sequences).

A proof proceeds as follows. Define dirichletSeq ψ c n := if (n : ZMod p) = 0 then c else ψ n. Periodicity: (n + p : ZMod p) = n. Legendre values: for n ≢ 0, the quadratic character (quadraticChar (ZMod p), or legendreSym) is ±1.

Provide the following interface.

- `dirichletSeq`: dirichletSeq ψ c n = if (n : ZMod p) = 0 then c else ψ n.
- `legendreSeq`: legendreSeq p = dirichletSeq (quadratic character of ZMod p) 1.
- `dirichletSeq_add_p`: dirichletSeq ψ c (n + p) = dirichletSeq ψ c n.
- `dirichletSeq_of_not_dvd`: ¬ p ∣ n → dirichletSeq ψ c n = ψ n.
- `legendreSeq_sq_eq_one`: For an odd prime p: (legendreSeq p n)^2=1 for every n.

**Checks.**

- `legendreSeq_three`: legendreSeq 3 0 = 1, legendreSeq 3 1 = 1, legendreSeq 3 2 = −1.
- `legendreSeq_five`: (legendreSeq 5 n)_{n<5} = (1, 1, −1, −1, 1).
- `dirichletSeq_zero_eq`: dirichletSeq ψ 0 n = ψ n for all n (Mathlib's MulChar vanishes at 0).
- `legendreSeq_ne_quadraticChar`: legendreSeq p 0 = 1 ≠ 0 = quadraticChar (ZMod p) 0: the Legendre sequence is not the extended character.


In particular, verify the following values and consequences.

- legendreSeq 3 = (1, 1, −1, 1, 1, −1, …) and legendreSeq 5 = (1, 1, −1, −1, 1, …).
- dirichletSeq ψ 0 agrees with n ↦ ψ n everywhere (Mathlib's convention ψ(0) = 0).

*Needs:* `MulChar`, `quadraticChar`, `MulChar.map_zero`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 14, Section 14.8, printed pp. 338–339.

<a id="FF4-dirichlet-sequence-autocorrelation"></a>

#### Autocorrelation of Dirichlet and Legendre sequences

Let p be prime, ψ a nontrivial multiplicative character of ZMod p with values in ℂ, c ∈ {0, 1}, s = dirichletSeq ψ c and τ with p ∤ τ. Then ∑_{x<p} s(x)·conj(s(x + τ)) = −1 + c·(conj ψ(τ) + ψ(−τ)). For the Legendre sequence (p odd): the autocorrelation at τ ≢ 0 is −1 if p ≡ 3 (mod 4) and −1 + 2·legendre(τ/p) ∈ {1, −3} if p ≡ 1 (mod 4); at τ ≡ 0 it is p (and p − 1 for c = 0).

The hypotheses are as follows. p prime; ψ ≠ 1; c ∈ {0, 1} (real); p ∤ τ.

A proof proceeds as follows. Split off x = 0 and x = −τ: the remaining terms are conj(ψ((x + τ)x^{−1})) = conj(ψ(1 + τx^{−1})) for x ∉ {0, −τ}. As x runs over (ZMod p)ˣ \ {−τ}, y = 1 + τx^{−1} runs over ZMod p \ {0, 1}, so their sum is conj(∑_{y≠0} ψ(y) − ψ(1)) = −1 (character orthogonality, MulChar.sum_eq_zero_of_ne_one). The boundary terms are c·conj ψ(τ) + ψ(−τ)conj(c). For the quadratic character ψ(−1) = (−1)^{(p−1)/2} (quadraticChar_neg_one / FiniteField.isSquare_neg_one_iff), giving the two Legendre cases. At τ ≡ 0: ∑ |s(x)|² = (p − 1) + |c|².

In particular, verify the following values and consequences.

- legendreSeq 7 has autocorrelation −1 at every τ ≢ 0 (7 ≡ 3 mod 4).
- legendreSeq 5 at τ = 1: −1 + 2·(1/5) = 1; at τ = 2: −1 + 2·(2/5) = −3.

*Needs:* [Dirichlet and Legendre sequences](#FF4-dirichlet-sequence), [Periodic cross-correlation and autocorrelation](#FF4-periodic-correlation), `MulChar.sum_eq_zero_of_ne_one`, `quadraticChar_neg_one`, `FiniteField.isSquare_neg_one_iff`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 14, Proposition 14.8.1, printed p. 339; [Goresky–Klapper (2009)](#source-26) — Chapter 14, Section 14.8, printed p. 339.

<a id="FF4-decimation-cross-correlation-character-sum"></a>

#### Cross-correlation of an m-sequence with its decimation is a character sum

Let F be a finite field with q elements, L ⊇ F of degree m, α a generator of Lˣ, a(n) = Tr_{L/F}(α^n) and b(n) = a(dn) its d-fold decimation (d ≥ 1), N = q^m − 1 and χ : AddChar F ℂ. Then for every t, charCorrelation χ N b a t = ∑_{x ∈ L} χ(Tr_{L/F}(x^d − α^t x)) − 1.

The hypotheses are as follows. F finite; α generates Lˣ; d ≥ 1.

A proof proceeds as follows. Write the sum over i < N with x = α^i ranging over Lˣ once: χ(b_i) conj χ(a_{i+t}) = χ(Tr(x^d) − Tr(α^t x)) = χ(Tr(x^d − α^t x)) (periodic-correlation, character form). Add and subtract the x = 0 term, which is χ(0) = 1.

In particular, verify the following values and consequences.

- For χ≠1: d = 1: charCorrelation χ N a a t = ∑_x χ(Tr((1 − α^t)x)) − 1, which is N at t ≡ 0 and −1 otherwise (m-sequence-two-level-autocorrelation).
- For χ≠1: d = q (a linear decimation): Tr(x^q) = Tr(x), so again −1 for t ≢ 0 (Goresky–Klapper Proposition 13.5.3).

*Needs:* [Periodic cross-correlation and autocorrelation](#FF4-periodic-correlation), [m-sequences (maximal-length linear recurring sequences)](#FF4-m-sequence), `Algebra.trace`, `FiniteField.algebraMap_trace_eq_sum_pow`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 13, Proposition 13.5.1 and proof (13.4)–(13.7), printed pp. 318–319.

### 4.6 Bent functions and Gold/Kasami correlation families

<a id="FF4-m-sequence-interleaving"></a>

#### Interleaved structure of m-sequences

Let F⊂E⊂K have |F|=q,[E:F]=m,[K:F]=n,m∣n; α primitive in K, ω≠0 and d=(q^n−1)/(q^m−1), β=α^d. Reshape a_i=Tr_{K/F}(ωα^i) into A_{s,t}=a_{sd+t}, 0≤s<q^m−1,0≤t<d. Then A_{s,t}=Tr_{E/F}(h_t β^s), h_t=Tr_{K/E}(ωα^t). Exactly (q^(n−m)−1)/(q^m−1) columns are zero; every other column is a cyclic shift of the E/F m-sequence.

The hypotheses are as follows. m,n positive; compatible scalar towers; primitive α; ω≠0.

A proof proceeds as follows. Use trace transitivity and E-linearity with α^d=β∈E; primitive-root order gives β order q^m−1. The nonzero h_t columns are scalar shifts because β enumerates E×. The nonzero trace-zero elements of K number q^(n−m)−1. Trace-zero is stable under multiplication by E×, whose d cosets are α^tE×; divide by q^m−1.

In particular, verify the following values and consequences.

- K=E gives d=1 and zero zero-columns. For q=2,m=2,n=4 there are five columns, exactly one zero.

*Needs:* [m-sequences (maximal-length linear recurring sequences)](#FF4-m-sequence), [The states of an m-sequence run through all nonzero vectors](#FF4-m-sequence-state-cycle), `Algebra.trace_trace`, `Algebra.trace_surjective`, `Module.card_eq_pow_finrank`.

See [Goresky–Klapper (2009)](#source-26) — §13.3, Proposition 13.3.1 and its proof, pp. 314–315.

<a id="FF4-trace-walsh-transform"></a>

#### Trace Walsh transform

For finite fields F⊂E, a nontrivial additive character ψ:F→ℂ× and B:E→F, define Wψ(B,y)=Σ_{x∈E} ψ(B(x)) overline(ψ(Tr_{E/F}(yx))). This is unnormalized, includes x=0, and uses a minus sign in the phase.

The hypotheses are as follows. Finite fields with an F-algebra structure; ψ a genuine AddChar F ℂ, ψ≠1 in Mathlib’s multiplicative character notation.

A proof proceeds as follows. Use the native finite sum of character values; trace pairing parametrizes all additive frequencies nondegenerately. Keep the character and trace orientation visible; this transform applies to nonlinear B as well as trace-linear functions.

Provide the following interface.

- `traceWalsh`: The stated complex finite sum.
- `traceWalsh_zero_phase`: Wψ(0,y)=|E| if y=0, and 0 otherwise.
- `traceWalsh_linear_phase`: Wψ(Tr(cx),y)=|E| if y=c, and 0 otherwise.
- `traceWalsh_parseval`: Σ_y |Wψ(B,y)|²=|E|².
- `traceWalsh_add_linear`: Wψ(B+Tr(cx),y)=Wψ(B,y−c).

**Checks.**

- `walsh_zero_at_zero`: Wψ(0,0)=|E|.
- `walsh_zero_nonzero_frequency`: For y≠0, Wψ(0,y)=0.
- `walsh_linear_peak`: For B=Tr(cx), its only nonzero frequency is y=c, with value |E|.
- `walsh_binary_quadratic`: In a two-dimensional F_2-space underlying E, B(x)=x0*x1 has frequencies 2,2,2,−2 in the dual coordinate order 00,01,10,11.


In particular, verify the following values and consequences.

- Linear phase B(x)=Tr(cx) has transform |E| at y=c and zero elsewhere.

*Needs:* `Algebra.trace`, `traceForm_nondegenerate`, `AddChar.expect_eq_ite`.

See [Goresky–Klapper (2009)](#source-26) — §13.4, transform definition and Proposition 13.4.1, pp. 315–316; Corollary 13.4.2, p. 316.

<a id="FF4-trace-bent-function"></a>

#### Bent functions for the trace transform

B:E→F is ψ-bent iff for every y∈E, |Wψ(B,y)|=√|E|. The character is an explicit parameter. For the prime alphabet F=F_p this property is independent of the chosen nontrivial ψ; that independence is a theorem, not a condition in the definition.

The hypotheses are as follows. The finite-field and nontrivial-character hypotheses of trace-walsh-transform.

A proof proceeds as follows. Use the exact norm predicate on all frequencies, including y=0. Parseval makes √|E| the unique constant magnitude, so this normalization agrees with the source.

Provide the following interface.

- `IsTraceBent`: Bentness is ∀y, |Wψ(B,y)|=√|E|.
- `isTraceBent_iff_norm_sq`: Equivalently every squared magnitude equals |E|.
- `isTraceBent_add_linear`: Adding Tr(cx) preserves bentness by frequency translation.
- `isTraceBent_add_constant`: Adding a constant preserves bentness by multiplication by a unit complex phase.

**Checks.**

- `bent_binary_product`: The function B(x0,x1)=x0*x1 on F_2² is bent.
- `bent_zero_nonexample`: The zero function is not bent on a nontrivial finite field E.
- `bent_linear_shift`: B is bent iff B+Tr(cx) is bent, for every c.


In particular, verify the following values and consequences.

- A trace-linear phase is not bent when |E|>1.

*Needs:* [Trace Walsh transform](#FF4-trace-walsh-transform).

See [Goresky–Klapper (2009)](#source-26) — §13.4, Definition 13.4.3, p. 317.

<a id="FF4-correlation-walsh-identity"></a>

#### Walsh coefficients and periodic correlation

Let α generate E×, N=|E|−1, b_i=B(α^i), a_i=Tr(α^i), and Cψ(b,a;t)=Σ_{i mod N}ψ(b_i) overline(ψ(a_{i+t})). Then Cψ(b,a;t)+ψ(B(0))=Wψ(B,α^t). Consequently Σ_t |Cψ(b,a;t)+ψ(B(0))|²=|E|²−|Wψ(B,0)|². If B is ψ-bent, every zero-corrected shifted magnitude |Cψ(b,a;t)+ψ(B(0))| is √|E|.

The hypotheses are as follows. α primitive; B arbitrary; ψ nontrivial; periodic sequences indexed modulo N.

A proof proceeds as follows. Replace the index i by x=α^i∈E× using the primitive-root bijection. The summand at x=0 is exactly ψ(B(0)). Apply traceWalsh_parseval and remove frequency zero; E× parametrizes exactly all nonzero frequencies. Apply the bent predicate to the equality. Keep the absolute value around C+ψ(B(0)); the source’s unmodulated complex equality is false.

In particular, verify the following values and consequences.

- For B=0 and t any, C=−1 and Wψ(0,α^t)=0, so C+1=0.

*Needs:* [Trace Walsh transform](#FF4-trace-walsh-transform), [Bent functions for the trace transform](#FF4-trace-bent-function), [Periodic cross-correlation and autocorrelation](#FF4-periodic-correlation), [m-sequences (maximal-length linear recurring sequences)](#FF4-m-sequence).

See [Goresky–Klapper (2009)](#source-26) — §13.4, Proposition 13.4.1, pp. 315–316; Corollary 13.4.2, p. 316; erroneous bent-correlation paragraph, p. 317.

<a id="FF4-bent-prime-character-independence"></a>

#### Prime-alphabet character independence

For F=F_p and any finite E/F, IsTraceBent ψ B is equivalent to IsTraceBent ψ′ B for all nontrivial additive characters ψ,ψ′ of F.

The hypotheses are as follows. p prime; E finite; do not assert this for a composite prime-power alphabet.

A proof proceeds as follows. Write ψ′(u)=ψ(au), a∈F×. The cyclotomic automorphism ζ_p↦ζ_p^a carries Wψ(B,y) to Wψ′(B,ay). Squared magnitude is the product with its complex conjugate, and cyclotomic automorphisms commute with conjugation. If it equals the rational integer |E|, every automorphism fixes it. Reindex y by a. Construct the indicated automorphism of the p-th cyclotomic field from its primitive-root universal property, and then use its injective complex embedding.

In particular, verify the following values and consequences.

- For p=2 there is a unique nontrivial character, making the assertion immediate.

*Needs:* [Bent functions for the trace transform](#FF4-trace-bent-function).

See [Goresky–Klapper (2009)](#source-26) — §13.4, Proposition 13.4.4, p. 317, using §3.2, Lemma 3.2.12, p. 68.

<a id="FF4-welch-signal-bound"></a>

#### Welch bound

For N≥2 and T≥1, let v_1,…,v_N∈ℂ^T have every coordinate of norm one. If M bounds |Σ_k v_u(k)overline(v_v(k))| for u≠v, then (N−1)M²≥T(N−T), with all products and subtraction in ℝ. For phase vectors of all shifts of n shift-distinct exact-period-T sequences, take N=nT.

The hypotheses are as follows. M≥0; N≥2; T≥1; vectors need not be distinct for the basic inequality. The signal-set specialization requires exact periods and shift distinctness.

A proof proceeds as follows. Use the Gram matrix and sum all squared correlations. Dropping the off-diagonal coordinate pairs gives Σ_{u,v}|Cuv|²≥TN². The diagonal contributes NT² and the remaining terms are bounded by N(N−1)M². Divide by positive N and rearrange. Do not perform N−T in natural numbers or divide by N−1 at N=1.

In particular, verify the following values and consequences.

- At N=T an orthogonal signal set has M=0 and equality. At N>T the lower bound is positive.

*Needs:* [Periodic cross-correlation and autocorrelation](#FF4-periodic-correlation).

See [Goresky–Klapper (2009)](#source-26) — §14.1, Theorem 14.1.1 with proof, pp. 329–330.

<a id="FF4-trace-decimation-family"></a>

#### Trace decimation families

For F⊂E, primitive α∈E, N=|E|−1 and d≥1, set S_d(A,B)_i=Tr_{E/F}(Aα^i+Bα^(di)) on ZMod N. The shift by t carries (A,B) to (Aα^t,Bα^(dt)). Gold families are the specialization d=1+q^s.

The hypotheses are as follows. Finite fields F⊂E; primitive α; |F|=q.

A proof proceeds as follows. Use the earlier trace m-sequence construction and pointwise addition on the actual finite word type. Primitive-root powers descend to ZMod N; trace linearity supplies the parameter map, and exponent addition supplies the shift law.

Provide the following interface.

- `traceDecimation`: The finite periodic word S_d(A,B).
- `traceDecimation_apply`: Its i-th value is Tr(Aα^i+Bα^(di)).
- `traceDecimation_shift`: shift_t S_d(A,B)=S_d(Aα^t,Bα^(dt)).
- `traceDecimation_add`: The parameter map (A,B)↦S_d(A,B) is F-linear.

**Checks.**

- `decimation_zero`: S_d(0,0)=0.
- `decimation_one`: S_1(A,B)=S_1(A+B,0), so the parameter map need not be injective.
- `decimation_trace`: S_d(A,0) is the earlier trace m-sequence, independent of d.


In particular, verify the following values and consequences.

- d=1 collapses to the single trace sequence of A+B.

*Needs:* [m-sequences (maximal-length linear recurring sequences)](#FF4-m-sequence), [Periodic cross-correlation and autocorrelation](#FF4-periodic-correlation), `Algebra.trace`.

See [Goresky–Klapper (2009)](#source-26) — §14.2, equation (14.1), p. 330; second trace exponent and degree/primitivity assertion corrected.

<a id="FF4-gold-polar-radical"></a>

#### Gold quadratic forms and radicals

Let Q_H(x)=Tr_{E/F}(H x^(1+q^s)), 0<s<n=[E:F]. Its polar form is Tr(R_H(x)y), where R_H(x)=H x^(q^s)+(Hx)^(q^(n−s)). For H≠0 and g=gcd(n,2s), its radical has q^g elements iff c^((q^n−1)/(q^g−1))=1 with c=−H/H^(q^s); otherwise it has one element. For H=0 the radical is E.

The hypotheses are as follows. Finite fields F⊂E, |F|=q; 0<s<n. This includes the boundary 2s=n.

A proof proceeds as follows. Expand Q(x+y)−Q(x)−Q(y) using Frobenius additivity. Move the q^s-power on y across trace by applying φ^(n−s), obtaining R_H. Trace nondegeneracy identifies the radical with ker R_H. Raising the equation R_H(x)=0 to q^s gives x^(q^(2s)−1)=c for x≠0. The cyclic group E× has order q^n−1. The power-map kernel has order gcd(q^(2s)−1,q^n−1)=q^g−1, and its image is characterized by the displayed power condition. Add the root zero.

In particular, verify the following values and consequences.

- For F_2⊂F_(2^n), n odd and gcd(s,n)=1, every H≠0 gives a radical of size 2.
- For 2s=n the form may vanish identically in characteristic 2; no general-rank claim excludes that boundary silently.

*Needs:* [Trace decimation families](#FF4-trace-decimation-family), `traceForm_nondegenerate`, `isCyclic_of_injective_ringHom`.

See [Goresky–Klapper (2009)](#source-26) — §14.3, Theorem 14.3.2 and Table 14.1, pp. 332–333; quadratic-form reduction (14.4).

<a id="FF4-quadratic-character-sum-magnitude"></a>

#### Quadratic Fourier magnitude

Let V be a finite F-vector space, Q:V→F a quadratic map (Q(ax)=a²Q(x), polar form bilinear), ℓ:V→F linear and ψ nontrivial. Let R be the radical of the polar form. For Z=Σ_x ψ(Q(x)+ℓ(x)), one has |Z|²=|V|Σ_{r∈R}ψ(Q(r)+ℓ(r)). Thus |Z| is zero or √(|V||R|), with the latter precisely when ψ(Q(r)+ℓ(r))=1 for every r∈R.

The hypotheses are as follows. F finite field; V finite-dimensional and finite; allow characteristic 2 and a nonzero additive restriction Q|R.

A proof proceeds as follows. Expand Z times its conjugate and set x=y+r. The phase is Q(r)+ℓ(r)+polar(y,r). Orthogonality kills the inner y-sum unless r is in the radical; then it is |V|. On R, Q+ℓ is additive, so ψ∘(Q+ℓ) is an additive character. Native finite character orthogonality gives either zero or |R|; take the nonnegative square root.

In particular, verify the following values and consequences.

- A nondegenerate polar form gives |Z|=√|V| for every linear perturbation.
- The zero quadratic and zero linear forms give |Z|=|V|, not √|V|.

*Needs:* `AddChar.expect_eq_ite`.

See [Goresky–Klapper (2009)](#source-26) — §3.3, Theorem 3.3.2, Proposition 3.3.3 and Theorem 3.3.4, pp. 79–80; applied in §14.3, equation (14.4), p. 332 and Table 14.1, p. 333. The magnitude statement follows directly by orthogonality.

<a id="FF4-gold-shift-classes"></a>

#### Shift-distinct Gold representatives

For d=1+q^s with 0<s<n and 2s≠n, the |E|+1 words {S_d(1,B):B∈E}∪{S_d(0,1)} are pairwise shift distinct. Each S_d(1,B) has exact period N=|E|−1. The final representative has exact period N only when gcd(d,N)=1; no full-period claim for it is made otherwise.

The hypotheses are as follows. Finite fields F⊂E, primitive α; 0<s<n; 2s≠n.

A proof proceeds as follows. If a shifted equality holds, its difference is Tr(Ux+Hx^d)=0 on E. The quadratic polar form is zero, so gold-polar-radical and 2s≠n force H=0; trace nondegeneracy forces U=0. For two first representatives U=1−α^t, hence t=0 and their parameters agree; for a comparison with S_d(0,1), U is nonzero. The same calculation gives the exact period of each first representative. For the final word, gcd(d,N)=1 makes its decimation a permutation of the nonzero powers; use earlier exact period.

In particular, verify the following values and consequences.

- For q=2,n=3,s=1 there are nine representatives of period seven.
- For q=3,n=3,s=1,d=4 the last representative’s period divides 13, although N=26.

*Needs:* [Trace decimation families](#FF4-trace-decimation-family), [Gold quadratic forms and radicals](#FF4-gold-polar-radical), [The states of an m-sequence run through all nonzero vectors](#FF4-m-sequence-state-cycle), `traceForm_nondegenerate`.

See [Goresky–Klapper (2009)](#source-26) — §14.3, Lemma 14.3.1 with proof, pp. 331–332.

<a id="FF4-gold-binary-three-correlation-values"></a>

#### Binary Gold three-valued correlation

For F=F_2, n odd≥3, gcd(s,n)=1 and 0<s<n, put d=1+2^s. Between any two Gold representatives, excluding the same word at zero shift, binary periodic correlation belongs to {−1,−1+2^((n+1)/2),−1−2^((n+1)/2)}.

The hypotheses are as follows. Primitive α∈F_(2^n); canonical nontrivial binary additive character; include the pure decimated representative S_d(0,1).

A proof proceeds as follows. The earlier decimation correlation identity changes C+1 to the full sum of ψ(Tr(Ux+Hx^d)). When H≠0, gold-polar-radical gives |R|=2 and quadratic-character-sum-magnitude gives zero or 2^((n+1)/2). Binary character values make the sum a real integer with the two possible signs. When H=0, U is nonzero by gold-shift-classes unless the excluded trivial comparison occurs; orthogonality gives zero. For two final representatives at nonzero shift, gcd(d,N)=1 guarantees H≠0.

In particular, verify the following values and consequences.

- n=3 gives possible correlations −5,−1,3; the excluded diagonal at zero shift is 7.

*Needs:* [Shift-distinct Gold representatives](#FF4-gold-shift-classes), [Gold quadratic forms and radicals](#FF4-gold-polar-radical), [Quadratic Fourier magnitude](#FF4-quadratic-character-sum-magnitude), [Cross-correlation of an m-sequence with its decimation is a character sum](#FF4-decimation-cross-correlation-character-sum).

See [Goresky–Klapper (2009)](#source-26) — §14.3, Theorem 14.3.2, binary odd-n row of Table 14.1, pp. 332–333.

<a id="FF4-small-kasami-family"></a>

#### Small Kasami family

For F⊂E⊂L with |F|=q,[E:F]=m>0,[L:E]=2, primitive α∈L and N=|L|−1, define K(A)_i=Tr_{L/F}(α^i)+Tr_{E/F}(A Norm_{L/E}(α^i)) for A∈E. The parameter belongs to E and the primitive element to L.

The hypotheses are as follows. Compatible field tower; α primitive in L; A∈E.

A proof proceeds as follows. Use actual native trace and norm maps and the finite periodic word type. The norm of α^i equals α^((1+q^m)i), identifying this with a Gold trace expression after choosing a trace lift of A from E to L. Independence of that lift follows from trace transitivity.

Provide the following interface.

- `kasamiSequence`: The periodic word K(A).
- `kasamiSequence_apply`: The stated trace–norm formula.
- `kasamiSequence_zero`: K(0) is the earlier L/F trace m-sequence.
- `kasamiSequence_traceLift`: For Tr_{L/E}(Â)=A, K(A)=S_(1+q^m)(1,Â) over L/F.

**Checks.**

- `kasami_zero`: K(0)_i=Tr_{L/F}(α^i).
- `kasami_lift_independent`: Two lifts Â with the same trace yield identical words.
- `kasami_parameter_domain`: For m=1,q=2 there are two members, rather than |L|=4.


In particular, verify the following values and consequences.

- The family has q^m shift-distinct members, and all have exact period N.

*Needs:* [Trace decimation families](#FF4-trace-decimation-family), `Algebra.trace_trace`, `FiniteField.algebraMap_norm_eq_pow`, `Algebra.trace_surjective`.

See [Goresky–Klapper (2009)](#source-26) — §14.4, pp. 332–334, definition and Lemma 14.4.1.

<a id="FF4-kasami-quadratic-correlation"></a>

#### Kasami correlation and shift distinctness

The K(A), A∈E, are pairwise shift distinct and have exact period N. For C=α^t, set H=A−B Norm(C). Their correlation plus one is Σ_{x∈L}ψ(Tr_{L/F}((1−C)x)+Tr_{E/F}(H Norm(x))). If H≠0 its magnitude is q^m; if H=0 and C≠1 it is zero. The remaining C=1,H=0 case is the trivial diagonal, giving |L|. In the binary case every nontrivial correlation is −1 or −1±2^m.

The hypotheses are as follows. The small-kasami-family hypotheses; ψ nontrivial on F.

A proof proceeds as follows. Expand the word difference and add x=0 as in the earlier decimation identity. For H≠0 the norm quadratic has polar form Tr_{L/F}(H x^(q^m)y); multiplication by H and conjugate Frobenius are invertible, and trace nondegeneracy gives zero radical. Apply quadratic-character-sum-magnitude. For H=0 use trace orthogonality. A word equality would make the full sum |L|, contradicting the other cases; therefore C=1 and A=B, giving both period and shift distinctness.

In particular, verify the following values and consequences.

- q=2,m=1: nontrivial correlations are −3,−1,1; trivial diagonal is 3.

*Needs:* [Small Kasami family](#FF4-small-kasami-family), [Quadratic Fourier magnitude](#FF4-quadratic-character-sum-magnitude), `traceForm_nondegenerate`.

See [Goresky–Klapper (2009)](#source-26) — §14.4, Lemma 14.4.1 and its proof, pp. 333–334.

### 4.7 Geometric feeds, GMW sequences and d-forms

<a id="FF4-geometric-feed-sequence"></a>

#### Geometric feed sequences

For F=F_p⊂L⊂K, |L|=q,[K:L]=m>0, primitive α∈K and a feed f:L→F, define geometricSequence(f)_i=f(Tr_{K/L}(α^i)) on ZMod(|K|−1). The feed is an arbitrary function, not required to be linear.

The hypotheses are as follows. p prime; compatible finite-field tower; α primitive.

A proof proceeds as follows. Compose the earlier L-valued trace m-sequence with f, retaining its period as a period bound. Expose the actual feed and trace maps. Equality of feeds implies equality of words; m=1 reduces to f(α^i).

Provide the following interface.

- `geometricSequence`: The finite periodic word f∘Tr evaluated on primitive powers.
- `geometricSequence_apply`: The i-th value is f(Tr(α^i)).
- `geometricSequence_traceFeed`: For f=Tr_{L/F}, the word equals the earlier K/F trace m-sequence.
- `geometricSequence_frobeniusDecimation`: Decimating by q^s preserves the word, since Tr_{K/L}(x^(q^s))=Tr_{K/L}(x).

**Checks.**

- `geometric_zero`: The zero feed gives the zero word.
- `geometric_trace`: The trace feed equals the K/F m-sequence by trace transitivity.
- `geometric_constant`: A constant nonzero feed has least period one, even when |K|−1>1.


In particular, verify the following values and consequences.

- A constant feed gives a constant word, so full period is not automatic.

*Needs:* [m-sequences (maximal-length linear recurring sequences)](#FF4-m-sequence), `Algebra.trace`.

See [Goresky–Klapper (2009)](#source-26) — §14.5, (14.5) and Figure 14.2, pp. 334–335.

<a id="FF4-geometric-trace-pair-fibres"></a>

#### Trace-pair fibres in geometric correlation

For C∈K×, the L-linear map x↦(Tr_{K/L}x,Tr_{K/L}(Cx)) has rank two if C∉L, and each fibre has q^(m−2) elements. If C∈L, the second coordinate is C times the first; fibres on that graph have q^(m−1) elements and all other fibres are empty.

The hypotheses are as follows. Finite fields L⊂K; m=[K:L]>0; C≠0. C∉L implies m≥2.

A proof proceeds as follows. Trace nondegeneracy makes the functionals represented by 1 and C independent exactly when C∉L. A surjective rank-two linear map has kernel dimension m−2 and fibres of that cardinality. When C∈L use trace linearity and trace surjectivity.

In particular, verify the following values and consequences.

- At m=1 only the C∈L case can occur.

*Needs:* `traceForm_nondegenerate`, `Algebra.trace_surjective`, `Module.card_eq_pow_finrank`.

See [Goresky–Klapper (2009)](#source-26) — §14.5, proof of Theorem 14.5.1, pp. 335–336; reference to Lemma 13.5.2.

<a id="FF4-geometric-correlation-formula"></a>

#### Geometric feed correlation

Write Z_f=Σ_{u∈L}ψ(f(u)), C_{g,f}(C)=Σ_u ψ(g(u))overline(ψ(f(Cu))), and c0=ψ(g(0))overline(ψ(f(0))). For a=geometricSequence(f), b=geometricSequence(g), and C=α^t, periodicCorrψ(b,a;t)=q^(m−2)Z_g overline(Z_f)−c0 if C∉L, and q^(m−1)C_{g,f}(C)−c0 if C∈L. A q^s-decimation of b gives the same formula.

The hypotheses are as follows. The geometric-feed-sequence hypotheses; ψ a nontrivial character of F; no assumptions on f(0),g(0).

A proof proceeds as follows. Parametrize K× by α^i and add the omitted x=0 term c0. Group the full sum by the two trace coordinates and use geometric-trace-pair-fibres. Independent fibres give the product of imbalances; dependent fibres give the base-field feed correlation. Use relative Frobenius invariance of trace for q-power decimations. The autocorrelation specialization subtracts 1 only when f(0)=0; otherwise it still subtracts |ψ(f(0))|²=1, but cross-correlation retains c0.

In particular, verify the following values and consequences.

- For constant feeds f=g=1, both cases give |K|−1, including the x=0 subtraction.

*Needs:* [Geometric feed sequences](#FF4-geometric-feed-sequence), [Trace-pair fibres in geometric correlation](#FF4-geometric-trace-pair-fibres), [Periodic cross-correlation and autocorrelation](#FF4-periodic-correlation).

See [Goresky–Klapper (2009)](#source-26) — §14.5, Theorem 14.5.1 and proof, pp. 335–336.

<a id="FF4-gmw-feed-sequence"></a>

#### Gordon–Mills–Welch sequences

In the geometric tower F_p⊂L⊂K, choose h≥1 with gcd(h,|L|−1)=1. Define gmwSequence(h)=geometricSequence(u↦Tr_{L/F_p}(u^h)). Its accepted parameter data include the power-permutation hypothesis.

The hypotheses are as follows. p prime; compatible finite fields; primitive α∈K; h positive and coprime to |L|−1.

A proof proceeds as follows. Use the geometric construction and the native power and trace maps. Power h is a permutation of L including zero; combine this with the trace feed API. No assumption that h is a power of p is made in the construction.

Provide the following interface.

- `gmwSequence`: The GMW word with its admissible h.
- `gmwSequence_apply`: Its i-th value is Tr_{L/F_p}((Tr_{K/L}(α^i))^h).
- `gmwSequence_frobeniusExponent`: For h=p^s it equals the earlier K/F_p trace m-sequence.
- `gmwFeed_zero`: The feed takes 0 to 0.

**Checks.**

- `gmw_exponent_one`: h=1 gives the K/F_p m-sequence.
- `gmw_feed_zero`: Tr(0^h)=0 for admissible h≥1.
- `gmw_bad_exponent`: For L=F_4 and h=3, u↦Tr_{F_4/F_2}(u³) is zero everywhere, so omitting coprimality gives a constant zero word.


In particular, verify the following values and consequences.

- When h=p^s, the feed is simply Tr(u), hence this is the ordinary K/F_p m-sequence.

*Needs:* [Geometric feed sequences](#FF4-geometric-feed-sequence), `Algebra.trace`.

See [Goresky–Klapper (2009)](#source-26) — §14.6, (14.6), p. 336.

<a id="FF4-gmw-period-autocorrelation"></a>

#### GMW perfect autocorrelation and period

For every nontrivial additive character ψ of F_p, GMW autocorrelation is |K|−1 at zero shift and −1 at every nonzero shift. Its exact period is |K|−1. Each symbol a∈F_p occurs |K|/p−1 times if a=0, and |K|/p times otherwise.

The hypotheses are as follows. The admissible GMW data; q=|L|; m=[K:L].

A proof proceeds as follows. Change variables v=u^h in the base feed: imbalance is zero by trace surjectivity and character orthogonality. For C∈L×\{1}, f(Cu)=Tr(C^h v) after the substitution, and C^h≠1. The feed autocorrelation is zero by trace nondegeneracy. Apply geometric-correlation-formula; outside L the imbalances are zero as well. A proper period would have autocorrelation |K|−1 at a nonzero shift, a contradiction. Count fibres of trace and the power permutation, then remove x=0 for symbol zero.

In particular, verify the following values and consequences.

- For L=K=F_4,p=2,h=1, the binary word has one zero and two ones, with autocorrelation −1 off zero.

*Needs:* [Gordon–Mills–Welch sequences](#FF4-gmw-feed-sequence), [Geometric feed correlation](#FF4-geometric-correlation-formula), `AddChar.expect_eq_ite`, `Algebra.trace_surjective`.

See [Goresky–Klapper (2009)](#source-26) — §14.6, Theorem 14.6.1 and proof, pp. 336–338.

<a id="FF4-gmw-block-distribution"></a>

#### GMW block distribution

For 1≤j≤m=[K:L], any length-j word w over F_p occurs p^(em−j)−1 times if w is all zero, and p^(em−j) times otherwise, in one GMW period, where |L|=p^e.

The hypotheses are as follows. Admissible GMW data include a primitive α∈K× with order |K|−1, h≥1 and gcd(h,|L|−1)=1; 1≤j≤m, not arbitrary j≤em.

A proof proceeds as follows. The consecutive L-valued trace state of length m is the earlier m-sequence state bijection K×→L^m\{0}. Its first j coordinates therefore have q^(m−j) fibres, minus one for zero. Apply the coordinatewise permutation u↦u^h. Each F_p trace symbol has p^(e−1) preimages in L; multiply the j counts. The only excluded state is all zero, mapping to the all-zero word.

In particular, verify the following values and consequences.

- At j=m the count is p^(m(e−1)), with one removed for zero, matching the source.

*Needs:* [Gordon–Mills–Welch sequences](#FF4-gmw-feed-sequence), [The states of an m-sequence run through all nonzero vectors](#FF4-m-sequence-state-cycle), `Algebra.trace_surjective`, `Module.card_eq_pow_finrank`.

See [Goresky–Klapper (2009)](#source-26) — §14.6, block-distribution proof of Theorem 14.6.1, p. 337.

<a id="FF4-gmw-frobenius-feed-comparison"></a>

#### GMW Frobenius feed comparison

If h=p^s, the GMW word is exactly Tr_{K/F_p}(α^i), and hence has the earlier shift-and-add property. No shift-and-add assertion is made for arbitrary h coprime to |L|−1.

The hypotheses are as follows. The GMW tower; s≥0, h=p^s.

A proof proceeds as follows. Trace to the prime field is invariant under absolute p-Frobenius, so Tr(u^(p^s))=Tr(u). Apply trace transitivity to identify the actual words, then import the earlier m-sequence shift-and-add theorem.

In particular, verify the following values and consequences.

- h=1 is the usual trace word; h=p gives the same word, not merely a shift.

*Needs:* [Gordon–Mills–Welch sequences](#FF4-gmw-feed-sequence), [The shift-and-add property of m-sequences](#FF4-m-sequence-shift-and-add), `Algebra.trace_trace`.

See [Goresky–Klapper (2009)](#source-26) — §14.6, last paragraph of the proof of Theorem 14.6.1, pp. 337–338.

<a id="FF4-homogeneous-d-form"></a>

#### Homogeneous d-forms

For finite fields L⊂K and d≥1, IsDForm(L,H,d) for H:K→L means H(ax)=a^dH(x) for every a∈L and x∈K. In particular H(0)=0. In characteristic two, d-form sequences use the feed Tr_{L/F_2}(H(α^i)^k); the correlation theorem additionally requires gcd(d,|L|−1)=gcd(k,|L|−1)=1.

The hypotheses are as follows. L,K finite fields with their actual algebra structure; d positive.

A proof proceeds as follows. State the genuine scalar-homogeneity predicate, including a=0. Trace of x^d is an example by L-linearity of trace. The source’s sequence is an ordinary function on the primitive powers, with no invented structure field for the desired correlation.

Provide the following interface.

- `IsDForm`: The scalar homogeneity predicate with every scalar, including zero.
- `IsDForm.map_zero`: Every positive-degree d-form vanishes at zero.
- `isDForm_trace_pow`: H(x)=Tr_{K/L}(x^d) is a d-form.
- `IsDForm.add`: The sum of two degree-d forms is degree d.
- `IsDForm.mul`: The product of forms of degrees d and e has degree d+e.

**Checks.**

- `dform_zero`: The zero function is a d-form for every d≥1.
- `dform_trace_linear`: Tr_{K/L} is a 1-form, agreeing with its native L-linearity.
- `dform_constant_nonexample`: The constant function 1 is not a d-form when d≥1, by setting a=0.
- `dform_nonpermutation_degree`: On F_4 over itself, H(0)=0 and H(x)=1 for x≠0 is a 3-form; it exhibits why a d-form alone does not guarantee the correlation theorem.


In particular, verify the following values and consequences.

- A nonzero constant function is not a positive-degree d-form.

*Needs:* `Algebra.trace`, [Geometric feed sequences](#FF4-geometric-feed-sequence).

See [Klapper](#source-43) — §1, Definition 1.1, p. 3; [Goresky–Klapper (2009)](#source-26) — §14.7, p. 338.

<a id="FF4-d-form-correlation-zero-count"></a>

#### d-form correlation by zero counts

Let F_2⊂L⊂K, |L|=q, [K:L]=m, α primitive, d,k≥1 with gcd(d,q−1)=gcd(k,q−1)=1, and H1,H2 degree-d forms. Set a_j(i)=Tr_{L/F_2}(H_j(α^i)^k), and z_t=#{x∈K×:H1(x)+H2(α^t x)=0}. Then binary periodic correlation equals (q z_t−(|K|−1))/(q−1), with the quotient in ℚ or ℝ.

The hypotheses are as follows. Characteristic two, all scalar towers; both explicit coprimality assumptions; d,k positive.

A proof proceeds as follows. Partition K× into L×-orbits of size q−1. The phase on a scalar line scales by a^(dk), which permutes L×. The sum on that line is q−1 when H1(x)^k+H2(Cx)^k=0, and −1 otherwise by nontrivial additive character orthogonality. Since k is a power-permutation exponent, the zero condition is equivalent to H1(x)+H2(Cx)=0. There are z_t/(q−1) zero lines and (|K|−1−z_t)/(q−1) other lines. Count their contributions. Both divisibilities follow from homogeneity.

In particular, verify the following values and consequences.

- For L=K=F_4,d=3,k=1, H1=1 off zero and H2=0, the printed unguarded formula would give −1 whereas correlation is 3.
- For L=K=F_4,d=1,k=3,H1=id,H2=0, the same failure shows the second assumption is necessary.

*Needs:* [Homogeneous d-forms](#FF4-homogeneous-d-form), [Periodic cross-correlation and autocorrelation](#FF4-periodic-correlation), `AddChar.expect_eq_ite`, `isCyclic_of_injective_ringHom`.

See [Klapper](#source-43) — §2, Theorem 2.1 with proof, pp. 4–5; [Goresky–Klapper (2009)](#source-26) — §14.7, Theorem 14.7.1 and §14.11 Exercise 1, pp. 338,345.

### 4.8 Evaluation, BCH and algebraic geometry codes

<a id="FF4-singleton-bound"></a>

#### The Singleton bound for linear codes

Let F be a field, ι a finite type with n = #ι, and C ≤ F^ι a linear code (TauCeti.LinearCode F ι = Submodule F (ι → F)) with k = finrank F C ≥ 1. Then some nonzero c ∈ C has hammingNorm c ≤ n − k + 1; equivalently, if every nonzero codeword has weight ≥ d then k ≤ n − d + 1.

The hypotheses are as follows. F a field (finite in the source; not needed); ι finite; k ≥ 1 (for the zero code the statement is vacuous).

A proof proceeds as follows. Choose any set S ⊆ ι of k − 1 coordinates. The restriction C → F^S has kernel of dimension ≥ k − (k − 1) = 1 (rank–nullity, LinearMap.finrank_range_add_finrank_ker), so some nonzero c ∈ C vanishes on S. hammingNorm c ≤ n − (k − 1) since c vanishes on the k − 1 coordinates of S (hammingNorm counts nonzero coordinates, mathlib:hammingNorm).

In particular, verify the following values and consequences.

- The repetition code {(a, …, a)} ≤ F^n (k = 1) meets the bound with weight n.
- The binary [7, 4, 3] Hamming code has 3 < 7 − 4 + 1 = 4: the bound is not attained.

*Needs:* `hammingNorm`, `LinearMap.finrank_range_add_finrank_ker`, `TauCeti.LinearCode`.

**Native roadmap interfaces:** `TauCetiRoadmap/AlgebraicCodingTheory#layer-1-finite-codes-matrices-and-elementary-constructions`.

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Chapter 4, Theorem 4.3.1, printed p. 75; [Couvreur–Randriambololona](#source-24) — Section 3.2.1, printed p. 14.

<a id="FF4-mds-code"></a>

#### Maximum distance separable (MDS) codes

Let F be a field with decidable equality, ι finite with n = #ι. A linear code C ≤ F^ι is MDS, IsMDS C, if every nonzero codeword c ∈ C has hammingNorm c ≥ n − finrank F C + 1, i.e. its minimum distance equals the Singleton value n − k + 1 (singleton-bound gives the reverse inequality when k ≥ 1). The predicate is stated with Mathlib's hammingNorm so it does not depend on a bundled minimum-distance invariant; with AlgebraicCodingTheory Layer 2's minimum distance d(C) (zero-code convention d(⊥) = 0), a nonzero code is MDS iff d(C) = n − k + 1.

The hypotheses are as follows. F a field; ι finite; decidable equality on F for hammingNorm.

A proof proceeds as follows. Define IsMDS C :↔ ∀ c ∈ C, c ≠ 0 → n + 1 ≤ hammingNorm c + finrank F C. Projection property (ECT Proposition 5.3.3): for S ⊆ ι with #S = k, the restriction C → F^S is injective (a nonzero codeword vanishing on S has weight ≤ n − k), hence bijective by dimension count. Compatibility with the minimum distance of AlgebraicCodingTheory Layer 2: for C ≠ ⊥ the least weight of a nonzero codeword equals the minimum distance (ACT Layer 2), so IsMDS C ↔ d(C) = n − k + 1 by singleton-bound.

Provide the following interface.

- `IsMDS`: IsMDS C :↔ ∀ c ∈ C, c ≠ 0 → Fintype.card ι + 1 ≤ hammingNorm c + finrank F C.
- `IsMDS.restrict_bijective`: For S : Finset ι with #S = finrank F C, restriction C → (S → F) is bijective.
- `isMDS_iff_restrict_injective`: IsMDS C ↔ restriction to every set of finrank F C coordinates is injective.
- `IsMDS.exists_weight_eq`: If C ≠ ⊥ is MDS, some codeword has weight exactly n − k + 1 (with singleton-bound).
- `IsMDS.map_diagonal`: Scaling coordinates by nonzero constants preserves MDS.

**Checks.**

- `IsMDS.repetition`: The repetition code span {1} ≤ F^n (n ≥ 1) is MDS.
- `IsMDS.top`: ⊤ ≤ F^ι is MDS (k = n, every nonzero word has weight ≥ 1).
- `IsMDS.bot`: ⊥ is MDS vacuously (it has no nonzero codeword).
- `IsMDS.not_two_by_two_repetition`: The binary code spanned by (1,1,0,0) and (0,0,1,1) is not MDS.


In particular, verify the following values and consequences.

- Reed–Solomon codes are MDS (reed-solomon-is-mds).
- The binary code spanned by (1,1,0,0) and (0,0,1,1) is [4, 2, 2], not MDS.

*Needs:* [The Singleton bound for linear codes](#FF4-singleton-bound), `hammingNorm`, `Module.finrank`, `TauCeti.LinearCode`.

**Native roadmap interfaces:** `TauCetiRoadmap/AlgebraicCodingTheory#layer-2-hamming-data-and-dual-codes`.

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Chapter 5, Definition 5.3.1, printed p. 99; [Guruswami–Rudra–Sudan (2026)](#source-46) — Chapter 5, Proposition 5.3.3, printed p. 100.

<a id="FF4-reed-solomon-code"></a>

#### Reed–Solomon codes

Let F be a field, ι finite, α : ι → F (the evaluation points) and k ∈ ℕ. The Reed–Solomon code is reedSolomon α k := the image of the evaluation map reedSolomonEncode α k : Polynomial.degreeLT F k →ₗ[F] (ι → F), p ↦ (p.eval (α i))_i. Pinned: messages are polynomials of degree < k identified with F^k by the coefficient basis 1, X, …, X^{k−1} (the Vandermonde generator matrix); the theorems about dimension and distance assume α injective and k ≤ #ι, which forces #ι ≤ #F (the field-size restriction n ≤ q).

The hypotheses are as follows. F a field; ι a finite coordinate type; α injective and k ≤ #ι in the theorems (not in the definition).

A proof proceeds as follows. Define reedSolomonEncode α k := (LinearMap.pi fun i ↦ Polynomial.leval (α i)) ∘ₗ (degreeLT F k).subtype and reedSolomon α k := LinearMap.range of it. Linearity is built in (ECT Claim 5.2.2). Injectivity for α injective and k ≤ #ι: a polynomial of degree < k vanishing at #ι ≥ k distinct points is zero (mathlib:Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero'). Dimension k: injective linear map from degreeLT F k, which has dimension k (mathlib:Polynomial.degreeLTEquiv). Generator matrix: the k × ι Vandermonde matrix V_{j,i} = α_i^j generates the code (reedSolomon = range V.vecMulLinear), matching TauCeti's Matrix.generatedBy. Field-size restriction: α injective gives #ι ≤ #F (Fintype.card_le_of_injective).

Provide the following interface.

- `reedSolomonEncode`: reedSolomonEncode α k : degreeLT F k →ₗ[F] (ι → F), p ↦ fun i ↦ p.eval (α i).
- `reedSolomon`: reedSolomon α k = LinearMap.range (reedSolomonEncode α k).
- `mem_reedSolomon_iff`: c ∈ reedSolomon α k ↔ ∃ p, p.degree < k ∧ ∀ i, c i = p.eval (α i).
- `reedSolomonEncode_injective`: α injective and k ≤ #ι ⇒ the encoding map is injective.
- `finrank_reedSolomon`: α injective and k ≤ #ι ⇒ finrank F (reedSolomon α k) = k.
- `card_le_card_of_reedSolomon`: α injective ⇒ #ι ≤ #F (length at most the field size).
- `reedSolomon_mono`: k ≤ k′ ⇒ reedSolomon α k ≤ reedSolomon α k′.
- `reedSolomon_eq_top`: α injective and #ι ≤ k ⇒ reedSolomon α k = ⊤ (Lagrange interpolation).
- `reedSolomon_eq_range_vandermonde`: reedSolomon α k = LinearMap.range (V.vecMulLinear) for V : Matrix (Fin k) ι F, V j i = α i ^ j.

**Checks.**

- `reedSolomon_zmod_three_two`: For α = id : ZMod 3 → ZMod 3, Nat.card (reedSolomon α 2) = 9 and (0, 1, 2) ∈ reedSolomon α 2.
- `reedSolomon_zero`: reedSolomon α 0 = ⊥.
- `reedSolomon_one`: reedSolomon α 1 = span {fun _ ↦ 1} (the repetition code).
- `reedSolomon_repeated_points`: For α = ![0, 0] : Fin 2 → F, finrank F (reedSolomon α 2) = 1 < 2: injectivity of α is needed for dimension k.


In particular, verify the following values and consequences.

- Over F₃ with α enumerating F₃ and k = 2 the code has the nine codewords listed in ECT §5.2.
- k = 0 gives ⊥ and k = 1 the repetition code.

*Needs:* `Polynomial.degreeLT`, `Polynomial.degreeLTEquiv`, `Polynomial.leval`, `LinearMap.pi`, `Polynomial.eq_zero_of_natDegree_lt_card_of_eval_eq_zero'`, `Matrix.vecMulLinear`, `Matrix.generatedBy`, `TauCeti.LinearCode`.

**Native roadmap interfaces:** `TauCetiRoadmap/AlgebraicCodingTheory#layer-1-finite-codes-matrices-and-elementary-constructions`.

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Chapter 5, Definition 5.2.1, printed p. 97; [Guruswami–Rudra–Sudan (2026)](#source-46) — Chapter 5, printed p. 98; [Couvreur–Randriambololona](#source-24) — Definition 28, printed p. 13.

<a id="FF4-reed-solomon-min-weight"></a>

#### Nonzero Reed–Solomon codewords have weight at least n − k + 1

Let α : ι → F be injective and k ≤ n = #ι. Every nonzero c ∈ reedSolomon α k has hammingNorm c ≥ n − k + 1.

The hypotheses are as follows. α injective; k ≤ #ι.

A proof proceeds as follows. c = (p(α_i))_i with p ≠ 0 of degree < k; the zero coordinates are the α_i that are roots of p, at most k − 1 of them since α is injective and p has at most natDegree p ≤ k − 1 roots (mathlib:Polynomial.card_roots').

In particular, verify the following values and consequences.

- reedSolomon (id : ZMod 3 → ZMod 3) 2 has minimum weight 2 = 3 − 2 + 1, attained by (0, 1, 2).
- For k = n the bound is 1 (every nonzero vector).

*Needs:* [Reed–Solomon codes](#FF4-reed-solomon-code), `Polynomial.card_roots'`, `hammingNorm`.

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Chapter 5, Claim 5.2.3 and proof, printed p. 98.

<a id="FF4-reed-solomon-is-mds"></a>

#### Reed–Solomon codes are MDS, with minimum distance exactly n − k + 1

Let α : ι → F be injective and 1 ≤ k ≤ n = #ι. Then reedSolomon α k is an [n, k, n − k + 1] code: finrank = k, IsMDS, and some codeword has weight exactly n − k + 1.

The hypotheses are as follows. α injective; 1 ≤ k ≤ #ι (for k = 0 the code is ⊥ and has minimum distance 0 by the zero-code convention, not n + 1).

A proof proceeds as follows. Dimension: finrank_reedSolomon (reed-solomon-code). IsMDS: reed-solomon-min-weight. A codeword of weight exactly n − k + 1: evaluate ∏_{j<k−1}(X − α_{i_j}) for k − 1 distinct points (ECT Exercise 5.2); or combine singleton-bound.

In particular, verify the following values and consequences.

- reedSolomon (id : ZMod 5 → ZMod 5) 3 is a [5, 3, 3] code.
- k = n: the code is ⊤ with distance 1.

*Needs:* [Reed–Solomon codes](#FF4-reed-solomon-code), [Nonzero Reed–Solomon codewords have weight at least n − k + 1](#FF4-reed-solomon-min-weight), [Maximum distance separable (MDS) codes](#FF4-mds-code), [The Singleton bound for linear codes](#FF4-singleton-bound).

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Chapter 5, Theorem 5.2.4, printed p. 99.

<a id="FF4-generalized-reed-solomon-code"></a>

#### Generalized Reed–Solomon codes

For α : ι → F, k ∈ ℕ and a multiplier vector v : ι → F with all v i ≠ 0, the generalized Reed–Solomon code is GRS(α, k, v) := {(v_i p(α_i))_i : deg p < k}, the image of reedSolomon α k under the diagonal scaling c ↦ (v_i c_i)_i. GRS(α, k, 1) = reedSolomon α k.

The hypotheses are as follows. All v i ≠ 0; α injective and k ≤ #ι in the theorems.

A proof proceeds as follows. Define generalizedReedSolomon α k v := Submodule.map (diagonal scaling by v) (reedSolomon α k). Diagonal scaling by a vector of units is a linear isomorphism preserving hammingNorm, so dimension, minimum weight and MDS transfer from reed-solomon-code, reed-solomon-is-mds.

Provide the following interface.

- `generalizedReedSolomon`: generalizedReedSolomon α k v = map (diagonal scaling by v) (reedSolomon α k).
- `mem_generalizedReedSolomon_iff`: c ∈ GRS(α, k, v) ↔ ∃ p, p.degree < k ∧ ∀ i, c i = v i * p.eval (α i).
- `finrank_generalizedReedSolomon`: α injective, k ≤ #ι, all v i ≠ 0 ⇒ finrank = k.
- `isMDS_generalizedReedSolomon`: α injective, k ≤ #ι, all v i ≠ 0 ⇒ IsMDS.

**Checks.**

- `generalizedReedSolomon_one`: generalizedReedSolomon α k 1 = reedSolomon α k.
- `generalizedReedSolomon_zero`: generalizedReedSolomon α 0 v = ⊥.
- `generalizedReedSolomon_ne_reedSolomon`: Over ZMod 3 with α = id, k = 1, v = ![1, 1, 2]: generalizedReedSolomon α 1 v ≠ reedSolomon α 1 (the codeword (1, 1, 2) is not constant).
- `finrank_generalizedReedSolomon_test`: Over ZMod 5 with α = id, k = 2 and v = ![1, 2, 3, 4, 1]: finrank = 2.


In particular, verify the following values and consequences.

- GRS(α, k, 1) = RS(α, k).
- GRS codes are MDS.

*Needs:* [Reed–Solomon codes](#FF4-reed-solomon-code), [Reed–Solomon codes are MDS, with minimum distance exactly n − k + 1](#FF4-reed-solomon-is-mds), `hammingNorm`, `LinearMap.pi`.

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Chapter 5, Exercise 5.10, printed p. 103; [Couvreur–Randriambololona](#source-24) — Remark 29, printed p. 13.

<a id="FF4-dual-of-generalized-reed-solomon"></a>

#### The dual of a GRS code is a GRS code

Let α : ι → F be injective, n = #ι, k ≤ n and v : ι → F with all v i ≠ 0. Put u_i = (v_i ∏_{j≠i}(α_i − α_j))^{−1}. Then the Euclidean dual (the orthogonal of the dot-product form, AlgebraicCodingTheory Layer 2's C^⊥) of GRS(α, k, v) is GRS(α, n − k, u).

The hypotheses are as follows. α injective; k ≤ n; v i ≠ 0; the dual is taken for the bilinear form ⟨x, y⟩ = ∑ x_i y_i (no conjugation).

A proof proceeds as follows. It suffices to show ∑_i u_i v_i p(α_i) q(α_i) = 0 for deg p < k, deg q < n − k, then compare dimensions k + (n − k) = n (the dual has dimension n − k). h = pq has degree ≤ n − 2; by Lagrange interpolation h = ∑_i h(α_i) L_i with L_i = ∏_{j≠i}(X − α_j)/∏_{j≠i}(α_i − α_j) (mathlib:Lagrange.basis), and the X^{n−1}-coefficient of h, which is 0, equals ∑_i h(α_i)/∏_{j≠i}(α_i − α_j) = ∑_i u_i v_i h(α_i).

In particular, verify the following values and consequences.

- For α enumerating F_q, ∏_{j≠i}(α_i − α_j) = −1 for every i (the derivative of X^q − X is −1), so the dual of RS(α, k) is RS(α, q − k) (full-length-reed-solomon-dual).
- k = 0: the dual of ⊥ is ⊤ = GRS(α, n, u).

*Needs:* [Generalized Reed–Solomon codes](#FF4-generalized-reed-solomon-code), [Reed–Solomon codes](#FF4-reed-solomon-code), `Lagrange.basis`, `Lagrange.interpolate`, `dotProductBilin`, `LinearMap.BilinForm.orthogonal`.

**Native roadmap interfaces:** `TauCetiRoadmap/AlgebraicCodingTheory#layer-2-hamming-data-and-dual-codes`.

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Chapter 5, Exercise 5.10(2), printed p. 103.

<a id="FF4-full-length-reed-solomon-dual"></a>

#### Full-length Reed–Solomon codes are dual to each other

Let F be a finite field with q elements and α an enumeration of F (α : F → F the identity, ι = F). Then the Euclidean dual of reedSolomon α k is reedSolomon α (q − k) for 0 ≤ k ≤ q; in particular RS(α, q/2) is self-dual when q is even.

The hypotheses are as follows. F finite; α bijective onto F.

A proof proceeds as follows. ∏_{j≠i}(α_i − α_j) = f′(α_i) for f = ∏_j (X − α_j) = X^q − X, whose derivative is qX^{q−1} − 1 = −1; so u_i = −1/v_i = −1 for v = 1 and dual-of-generalized-reed-solomon gives GRS(α, q − k, −1) = RS(α, q − k). Alternative: ∑_{x∈F} x^j = 0 for 0 ≤ j < q − 1 (mathlib:FiniteField.sum_pow_lt_card_sub_one) applied to products of monomials of degree < k and < q − k.

In particular, verify the following values and consequences.

- Over F₂ (q = 2): RS(α, 1) (repetition) is self-dual.
- Over F₃: RS(α, 1)^⊥ = RS(α, 2), the sum-zero code.

*Needs:* [The dual of a GRS code is a GRS code](#FF4-dual-of-generalized-reed-solomon), `FiniteField.sum_pow_lt_card_sub_one`, `Polynomial.derivative_X_pow`.

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Chapter 5, Exercise 5.8, printed p. 102.

<a id="FF4-reed-solomon-check-characterisation"></a>

#### Reed–Solomon codes on the multiplicative group are cut out by power-sum checks

Let F be a finite field with q elements, n = q − 1, γ a generator of Fˣ, α_i = γ^i (i < n) and 1 ≤ k ≤ n. Then reedSolomon α k = {c ∈ F^n : ∑_{i<n} c_i γ^{iℓ} = 0 for 1 ≤ ℓ ≤ n − k}.

The hypotheses are as follows. F finite; γ generates Fˣ; α_i = γ^i.

A proof proceeds as follows. ⊆: for c_i = p(γ^i) with p = ∑_{j<k} p_j X^j, ∑_i c_i γ^{iℓ} = ∑_j p_j ∑_i γ^{i(j+ℓ)}, and ∑_{i<n} γ^{is} = 0 unless n ∣ s; here 1 ≤ j + ℓ ≤ n − 1. Equality by dimension: the n − k check equations are linearly independent (Vandermonde in the distinct γ^ℓ), so the right side has dimension k = finrank of the left (reed-solomon-code).

In particular, verify the following values and consequences.

- q = 5, γ = 2, k = 3: RS = {c : ∑ c_i 2^i = 0}.
- k = n: no check equations, the code is ⊤.

*Needs:* [Reed–Solomon codes](#FF4-reed-solomon-code), `FiniteField.sum_pow_units`, `Matrix.vandermonde`.

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Chapter 5, Exercise 5.9, printed pp. 102–103.

<a id="FF4-subfield-subcode"></a>

#### Subfield subcodes

Let F ⊆ E be fields ([Algebra F E]) and C ≤ E^ι a linear code over E. Its subfield subcode is subfieldSubcode F C := {x ∈ F^ι : (algebraMap F E ∘ x) ∈ C}, an F-linear code (the comap of C, viewed as an F-subspace by restriction of scalars, under the coordinatewise inclusion F^ι → E^ι).

The hypotheses are as follows. F ⊆ E fields; ι finite; the dimension bound assumes [E : F] = m finite.

A proof proceeds as follows. Define subfieldSubcode F C := Submodule.comap (coordinatewise algebraMap as an F-linear map) (C.restrictScalars F). Weight: hammingNorm (algebraMap ∘ x) = hammingNorm x (algebraMap injective), so nonzero codewords of the subfield subcode have weight ≥ the minimum weight of C (ECT Exercise 5.12(1)). Dimension: C is cut out by n − k E-linear equations; each E-linear equation restricted to F^ι is m F-linear equations (expand in an F-basis of E), so dim_F subfieldSubcode ≥ n − m(n − k) (ECT Exercise 5.12(2)).

Provide the following interface.

- `subfieldSubcode`: subfieldSubcode F C = comap (coordinatewise algebraMap) (C.restrictScalars F).
- `mem_subfieldSubcode_iff`: x ∈ subfieldSubcode F C ↔ (fun i ↦ algebraMap F E (x i)) ∈ C.
- `hammingNorm_le_of_mem_subfieldSubcode`: Weights are preserved by the inclusion, so the minimum weight does not decrease.
- `finrank_subfieldSubcode_ge`: If [E : F] = m then finrank F (subfieldSubcode F C) + m (n − finrank E C) ≥ n.
- `subfieldSubcode_mono`: C ≤ D ⇒ subfieldSubcode F C ≤ subfieldSubcode F D.

**Checks.**

- `subfieldSubcode_top`: subfieldSubcode F (⊤ : Submodule E (ι → E)) = ⊤.
- `subfieldSubcode_self`: subfieldSubcode F C over E = F (Algebra.id) is C.
- `subfieldSubcode_ne_trace_code`: For E = GaloisField 2 2, γ ∉ range (algebraMap (ZMod 2) E) and C = span_E {![1, γ]}: subfieldSubcode (ZMod 2) C = ⊥ although C ≠ ⊥ — the subfield subcode is an intersection, not the (nonzero) trace image of C.
- `finrank_subfieldSubcode_rs`: For E = GaloisField 2 2, γ a generator of Eˣ, α i = γ^i (i < 3) and k = 2: finrank (ZMod 2) (subfieldSubcode (ZMod 2) (reedSolomon α 2)) = 1 (the binary repetition code).


In particular, verify the following values and consequences.

- subfieldSubcode F ⊤ = ⊤ and subfieldSubcode F C = C when E = F.
- For E = GaloisField 2 2 and C = span_E {(1, γ)} with γ ∉ F₂ the subfield subcode is ⊥ although C ≠ ⊥.

*Needs:* `Submodule.comap`, `Submodule.restrictScalars`, `Algebra.linearMap`, `hammingNorm`.

See [Couvreur–Randriambololona](#source-24) — Definition 31, printed p. 14; [Guruswami–Rudra–Sudan (2026)](#source-46) — Chapter 5, Exercise 5.12(1)–(2), printed p. 104.

<a id="FF4-bch-code"></a>

#### Primitive narrow-sense BCH codes

Let F be a finite field with q elements, E a finite extension of degree m, N = #E − 1 = q^m − 1, γ a generator of Eˣ and 2 ≤ δ ≤ N. The (primitive, narrow-sense) BCH code of designed distance δ is bchCode F γ δ := subfieldSubcode F (reedSolomon α (N − δ + 1)) with α_i = γ^i (i < N); equivalently (reed-solomon-check-characterisation) the words c ∈ F^N with ∑_{i<N} c_i γ^{iℓ} = 0 for 1 ≤ ℓ ≤ δ − 1. Length restriction (pinned): n = q^m − 1.

The hypotheses are as follows. F finite with q elements; E ⊇ F of degree m; γ generates Eˣ; 2 ≤ δ ≤ N.

A proof proceeds as follows. Define via subfield-subcode and reed-solomon-code. Check-equation form: reed-solomon-check-characterisation with n − k = δ − 1. Cyclicity: the check equations are invariant under the cyclic shift c ↦ (c_{i−1 mod N}) (multiplying the ℓ-th check by γ^ℓ).

Provide the following interface.

- `bchCode`: bchCode F γ δ = subfieldSubcode F (reedSolomon (fun i ↦ γ^i) (N − δ + 1)).
- `mem_bchCode_iff`: Membership by the δ − 1 check equations.
- `bchCode_cyclic`: bchCode is invariant under the cyclic shift of coordinates.
- `bchCode_antitone`: δ ≤ δ′ ⇒ bchCode F γ δ′ ≤ bchCode F γ δ.

**Checks.**

- `bchCode_hamming`: For F = ZMod 2, E = GaloisField 2 3 and δ = 3: finrank = 4 and the minimum weight is 3 (the Hamming code).
- `bchCode_fifteen_seven`: For F = ZMod 2, E = GaloisField 2 4 and δ = 5: finrank (bchCode) = 7 (the [15, 7, 5] code).
- `bchCode_degree_one`: For E = F (m = 1), bchCode F γ δ = reedSolomon α (N − δ + 1).
- `bchCode_mem_iff_check`: c ∈ bchCode F γ δ ↔ ∀ ℓ, 1 ≤ ℓ → ℓ ≤ δ − 1 → ∑_i algebraMap F E (c i) * γ^(i ℓ) = 0.


In particular, verify the following values and consequences.

- q = 2, m = 3, δ = 3: the binary [7, 4, 3] Hamming code (ECT Exercise 5.11(3)).
- m = 1: BCH = RS over F itself with k = N − δ + 1.

*Needs:* [Subfield subcodes](#FF4-subfield-subcode), [Reed–Solomon codes](#FF4-reed-solomon-code), [Reed–Solomon codes on the multiplicative group are cut out by power-sum checks](#FF4-reed-solomon-check-characterisation), `IsCyclic.exists_generator`.

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Chapter 5, Exercise 5.11, printed pp. 103–104; [Guruswami–Rudra–Sudan (2026)](#source-46) — Chapter 5, Bibliographic notes, printed p. 111.

<a id="FF4-bch-bound"></a>

#### The BCH bound

Every nonzero codeword of bchCode F γ δ has hammingNorm ≥ δ.

The hypotheses are as follows. As in bch-code.

A proof proceeds as follows. By subfield-subcode weights are preserved, and the ambient Reed–Solomon code has minimum weight N − (N − δ + 1) + 1 = δ (reed-solomon-min-weight, γ^i distinct since γ has order N).

In particular, verify the following values and consequences.

- The binary BCH code with δ = 3 and m = 3 has minimum weight exactly 3.
- The bound can be exceeded: the true minimum distance of a BCH code may be larger than δ (e.g. δ = 2 over F₂ gives the same code as δ = 3, since c(γ²) = c(γ)²).

*Needs:* [Primitive narrow-sense BCH codes](#FF4-bch-code), [Subfield subcodes](#FF4-subfield-subcode), [Nonzero Reed–Solomon codewords have weight at least n − k + 1](#FF4-reed-solomon-min-weight).

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Chapter 5, Exercise 5.11(1), printed p. 104.

<a id="FF4-bch-dimension-bound"></a>

#### Dimension bound for BCH codes

finrank F (bchCode F γ δ) ≥ N − m(δ − 1), where m = [E : F].

The hypotheses are as follows. As in bch-code.

A proof proceeds as follows. subfield-subcode dimension bound with n − k = δ − 1.

In particular, verify the following values and consequences.

- q = 2, m = 3, δ = 3: finrank ≥ 7 − 6 = 1 (the true value is 4, see binary-bch-dimension-bound).
- δ = 2: finrank ≥ N − m.

*Needs:* [Primitive narrow-sense BCH codes](#FF4-bch-code), [Subfield subcodes](#FF4-subfield-subcode).

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Chapter 5, Exercise 5.11(1), printed p. 104.

<a id="FF4-binary-bch-dimension-bound"></a>

#### The improved dimension bound for binary BCH codes

For F = ZMod 2: finrank (bchCode (ZMod 2) γ δ) ≥ N − m⌈(δ − 1)/2⌉.

The hypotheses are as follows. q = 2; as in bch-code.

A proof proceeds as follows. For c ∈ F₂^N, C(γ^{2ℓ}) = C(γ^ℓ)² where C(X) = ∑ c_i X^i (Frobenius, coefficients in F₂); so the checks at even ℓ follow from those at ℓ/2 and only the ⌈(δ − 1)/2⌉ odd ℓ in [1, δ − 1] are needed; each is m binary equations.

In particular, verify the following values and consequences.

- m = 3, δ = 3: ≥ 7 − 3 = 4, attained by the Hamming code.
- m = 4, δ = 5: ≥ 15 − 8 = 7, attained by the [15, 7, 5] BCH code.

*Needs:* [Primitive narrow-sense BCH codes](#FF4-bch-code), [Dimension bound for BCH codes](#FF4-bch-dimension-bound), `frobenius`.

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Chapter 5, Exercise 5.11(2), printed p. 104.

<a id="FF4-evaluation-at-rational-place"></a>

#### Evaluation of functions at a rational place

Let F/k be a function field (TauCeti.IsFunctionField k F) and P a rational place (P.degree = 1, TauCeti.Place.degree). For f in the valuation ring 𝒪_P (TauCeti.Place.integers P) its value is f(P) := (Place.residueFieldEquivOfDegreeEqOne P h).symm (residue f) ∈ k. Pinned: evalAtRational P h : P.integers →ₐ[k] k is a k-algebra map with kernel the maximal ideal; for functions outside 𝒪_P no value is assigned.

The hypotheses are as follows. F/k a function field; P a place of degree 1.

A proof proceeds as follows. Compose the residue map 𝒪_P → F_P (IsLocalRing.residue) with the inverse of the k-algebra isomorphism k ≃ F_P of a rational place (tauceti:TauCeti.Place.residueFieldEquivOfDegreeEqOne). Kernel = maximal ideal: the residue map has that kernel and the second map is an isomorphism. evalAtRational (algebraMap k F c) = c: residueFieldEquivOfDegreeEqOne_apply.

Provide the following interface.

- `evalAtRational`: evalAtRational P h : P.integers →ₐ[k] k, the composite of the residue map with the inverse of residueFieldEquivOfDegreeEqOne.
- `evalAtRational_algebraMap`: evalAtRational P h (algebraMap k _ c) = c.
- `evalAtRational_eq_zero_iff`: evalAtRational P h f=0 iff f lies in IsLocalRing.maximalIdeal of 𝒪_P; for nonzero f this is equivalent to positive order.
- `evalAtRational_apply_ker`: ker(evalAtRational P h) is the maximal ideal and algebraMap k P.ResidueField (evalAtRational P h f)=residue f; in particular the kernel is proper.

**Checks.**

- `evalAtRational_algebraMap`: evalAtRational P h (algebraMap k F c) = c.
- `evalAtRational_X_ratFunc`: In RatFunc k at the place of X − C a, the value of X is a. Its principal-ideal condition quantifies multiples by elements of 𝒪_P, not by arbitrary elements of the fraction field.
- `evalAtRational_ker`: evalAtRational P h f = 0 ↔ f ∈ the maximal ideal of 𝒪_P.
- `evalAtRational_not_defined_at_pole`: 1/(X − a) ∉ 𝒪_{P_{X−a}}: there is no value at a pole (the map is defined on 𝒪_P only).


In particular, verify the following values and consequences.

- In k(x), at the place P_{x−a} of the monic irreducible x − a, the value of x is a.
- The value of a constant c is c.

*Needs:* `TauCeti.Place`, `TauCeti.Place.degree`, `TauCeti.Place.integers`, `TauCeti.Place.ResidueField`, `TauCeti.Place.residueFieldEquivOfDegreeEqOne`, `IsLocalRing.residue`, `TauCeti.IsFunctionField`.

**Native roadmap interfaces:** `TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus`.

See [Couvreur–Randriambololona](#source-24) — Definition 10, printed p. 9.

<a id="FF4-algebraic-geometry-evaluation-code"></a>

#### Algebraic geometry evaluation codes C_L(D, G)

Let k be a finite field, F/k a function field with exact constant field k (IsFunctionField k F and IsIntegrallyClosedIn k F), G a divisor, and P_1, …, P_n pairwise distinct rational places not in the support of G; put D = P_1 + ⋯ + P_n. The evaluation code is C_L(D, G) := the image of the k-linear map ev : L(G) → k^n, f ↦ (f(P_1), …, f(P_n)), where L(G) = TauCeti.riemannRochSpace G and f(P_i) is evalAtRational (f ∈ 𝒪_{P_i} because P_i ∉ supp G).

The hypotheses are as follows. k finite; F/k a function field with exact constants; P_i distinct, of degree 1, G.coeff P_i = 0.

A proof proceeds as follows. ev is well defined: f ∈ L(G) and G(P_i) = 0 give v_{P_i}(f) ≥ 0 (tauceti:TauCeti.mem_riemannRochSpace_iff), so f ∈ 𝒪_{P_i}; evaluation is k-linear (evaluation-at-rational-place). Define agEvaluationCode as LinearMap.range ev. The kernel equality uses distinct evaluation places. Repeating a place does not impose a higher-order zero or pole condition; include injectivity in the suggested kernel signature.

Provide the following interface.

- `agEvaluationMap`: The k-linear map L(G) → (Fin n → k), f ↦ (f(P_i))_i.
- `agEvaluationCode`: agEvaluationCode P G = LinearMap.range (agEvaluationMap P G).
- `ker_agEvaluationMap`: ker ev = L(G − D) (as a subspace of L(G)).
- `agEvaluationCode_mono`: G ≤ G′ with the same support condition ⇒ C_L(D, G) ≤ C_L(D, G′).

**Checks.**

- `agEvaluationCode_eq_bot_of_degree_neg`: Divisor.degree G < 0 ⇒ agEvaluationCode P G = ⊥.
- `agEvaluationCode_ratFunc`: Over RatFunc k with G = (k − 1)·P∞ and P_i the places of X − α_i: agEvaluationCode P G = reedSolomon α k (node reed-solomon-as-ag-code).
- `agEvaluationCode_zero_divisor`: For G = 0 (exact constants): agEvaluationCode P 0 = span {1} (the repetition code), since L(0) = k.
- `agEvaluationCode_needs_disjoint_support`: In RatFunc k, at the actual finite place P₀ of X, 1/X belongs to L(P₀) but not to its valuation ring. Thus evaluation there is undefined. This is a concrete non-example, not the desired conclusion assumed as a premise.


In particular, verify the following values and consequences.

- For the rational function field and G = (k − 1)P∞ the code is a Reed–Solomon code (reed-solomon-as-ag-code).
- If deg G < 0 then L(G) = 0 and C_L = ⊥.

*Needs:* [Evaluation of functions at a rational place](#FF4-evaluation-at-rational-place), `TauCeti.riemannRochSpace`, `TauCeti.mem_riemannRochSpace_iff`, `TauCeti.Divisor`, `TauCeti.IsFunctionField`.

**Native roadmap interfaces:** `TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus`.

See [Couvreur–Randriambololona](#source-24) — Section 3.1 and Definition 10, printed p. 9.

<a id="FF4-ag-code-dimension"></a>

#### Dimension of algebraic geometry codes

In the setting of algebraic-geometry-evaluation-code with g the genus (TauCeti.genus k F): finrank k C_L(D, G) = ℓ(G) − ℓ(G − D). If deg G < n then finrank C_L = ℓ(G) ≥ deg G + 1 − g, and if moreover 2g − 2 < deg G < n then finrank C_L = deg G + 1 − g.

The hypotheses are as follows. As in algebraic-geometry-evaluation-code; ℓ = TauCeti.Divisor.dim.

A proof proceeds as follows. ker ev = L(G − D): f(P_i) = 0 means v_{P_i}(f) ≥ 1 = −(G − D)(P_i) (G(P_i) = 0), and the conditions at other places are those of L(G). Rank–nullity gives the first formula. deg (G − D) = deg G − n < 0 ⇒ L(G − D) = 0 (tauceti:TauCeti.riemannRochSpace_eq_bot_of_lt_zero via degree, or riemannRochSpace_eq_bot_of_degree_neg), and Riemann's inequality ℓ(G) ≥ deg G + 1 − g (tauceti:TauCeti.Divisor.degree_add_one_sub_genus_le_dim). deg G ≥ 2g − 1 ⇒ ℓ(G) = deg G + 1 − g (tauceti:TauCeti.Divisor.dim_eq_degree_add_one_sub_genus_of_two_mul_genus_sub_one_le_degree).

In particular, verify the following values and consequences.

- Rational function field (g = 0), G = (k − 1)P∞, n ≥ k: dimension k.
- Elliptic function field (g = 1), deg G = r with 0 < r < n: dimension r.

*Needs:* [Algebraic geometry evaluation codes C_L(D, G)](#FF4-algebraic-geometry-evaluation-code), `TauCeti.Divisor.dim`, `TauCeti.genus`, `TauCeti.riemannRochSpace_eq_bot_of_degree_neg`, `TauCeti.Divisor.degree_add_one_sub_genus_le_dim`, `TauCeti.Divisor.dim_eq_degree_add_one_sub_genus_of_two_mul_genus_sub_one_le_degree`, `TauCeti.Divisor.degree`, `LinearMap.finrank_range_add_finrank_ker`.

**Native roadmap interfaces:** `TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus`, `TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`.

See [Couvreur–Randriambololona](#source-24) — Theorem 21, printed p. 11.

<a id="FF4-goppa-bound"></a>

#### The Goppa bound d ≥ n − deg G

In the setting of algebraic-geometry-evaluation-code, every nonzero c ∈ C_L(D, G) has hammingNorm c ≥ n − deg G.

The hypotheses are as follows. As in algebraic-geometry-evaluation-code.

A proof proceeds as follows. c = ev(f) with f ≠ 0; if c vanishes at the places P_i, i ∈ S, then f ∈ L(G − ∑_{i∈S} P_i) ≠ 0, so deg G − #S ≥ 0 (a nonzero L(A) forces deg A ≥ 0: tauceti:TauCeti.riemannRochSpace_eq_bot_of_degree_neg). hammingNorm c = n − #S ≥ n − deg G.

In particular, verify the following values and consequences.

- Rational function field, G = (k − 1)P∞: bound n − k + 1, the Reed–Solomon distance.
- If deg G ≥ n the bound is vacuous.

*Needs:* [Algebraic geometry evaluation codes C_L(D, G)](#FF4-algebraic-geometry-evaluation-code), `TauCeti.riemannRochSpace_eq_bot_of_degree_neg`, `TauCeti.mem_riemannRochSpace_iff`, `hammingNorm`.

**Native roadmap interfaces:** `TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus`.

See [Couvreur–Randriambololona](#source-24) — Theorem 21, printed p. 11.

<a id="FF4-ag-code-singleton-defect"></a>

#### The Singleton defect of an AG code is at most the genus

If deg G < n then every nonzero codeword of C_L(D, G) has weight ≥ n + 1 − g − finrank C_L; i.e. k + d ≥ n + 1 − g.

The hypotheses are as follows. As in algebraic-geometry-evaluation-code, with deg G < n.

A proof proceeds as follows. Combine ag-code-dimension (k ≥ deg G + 1 − g) with goppa-bound (d ≥ n − deg G).

In particular, verify the following values and consequences.

- g = 0: k + d ≥ n + 1, so with singleton-bound the code is MDS.
- The Hermitian-curve codes of ECT Exercise 5.23 have defect ≤ p(p − 1)/2 = g.

*Needs:* [Dimension of algebraic geometry codes](#FF4-ag-code-dimension), [The Goppa bound d ≥ n − deg G](#FF4-goppa-bound).

See [Couvreur–Randriambololona](#source-24) — Corollary 23, printed p. 12.

<a id="FF4-reed-solomon-as-ag-code"></a>

#### Reed–Solomon codes are the AG codes of the rational function field

Let k be a finite field, x_1, …, x_n distinct elements of k and 1 ≤ k₀ ≤ n. In F = RatFunc k with P_i the place of X − x_i and G = (k₀ − 1)·P∞ (TauCeti.Place.infty), C_L(D, G) = reedSolomon x k₀.

The hypotheses are as follows. Distinct x_i; 1 ≤ k₀ ≤ n (so deg G < n).

A proof proceeds as follows. L((k₀ − 1)P∞) is the space of polynomials of degree ≤ k₀ − 1 (tauceti:TauCeti.riemannRochSpace_zsmul_ofPoint_infty). The value of a polynomial p at the place of X − x_i is p(x_i) (evaluation-at-rational-place, residue of p modulo X − x_i). The supports are disjoint since the P_i are finite places. The RatFunc comparison uses the actual finite places adicOfIrreducible(X−C α_i) and Place.infty, not arbitrary degree-one places. The suggested test binds these identities explicitly.

In particular, verify the following values and consequences.

- k₀ = 1: G = 0 and both sides are the repetition code.
- n = #k and x an enumeration of k: the full-length Reed–Solomon code.

*Needs:* [Algebraic geometry evaluation codes C_L(D, G)](#FF4-algebraic-geometry-evaluation-code), [Reed–Solomon codes](#FF4-reed-solomon-code), [Evaluation of functions at a rational place](#FF4-evaluation-at-rational-place), `TauCeti.riemannRochSpace_zsmul_ofPoint_infty`, `TauCeti.Place.infty`.

**Native roadmap interfaces:** `TauCetiRoadmap/AlgebraicCurves#layer-3-divisors-ld-riemanns-theorem-and-the-genus`.

See [Couvreur–Randriambololona](#source-24) — Proposition 32 and proof, printed p. 14.

<a id="FF4-algebraic-geometry-residue-code"></a>

#### Algebraic geometry residue codes C_Ω(D, G)

In the setting of algebraic-geometry-evaluation-code, the residue (differential) code is C_Ω(D, G) := the image of the k-linear map Ω_F(G − D) → k^n, ω ↦ (ω_{P_1}(1), …, ω_{P_n}(1)), where Ω_F(A) = TauCeti.weilDifferentialFiltration A and ω_P = TauCeti.repartitionDualComponent ω P is the local component (Stichtenoth's definition; for a simple pole ω_P(1) is the residue of ω at P).

The hypotheses are as follows. As in algebraic-geometry-evaluation-code.

A proof proceeds as follows. The map ω ↦ (repartitionDualComponent ω P_i 1)_i is k-linear in ω (repartitionDualComponent is composition with a fixed linear map). Define agResidueCode as the range of its restriction to Ω_F(G − D). The kernel equality uses distinct evaluation places. Repeating a place does not impose a higher-order zero or pole condition; include injectivity in the suggested kernel signature.

Provide the following interface.

- `agResidueMap`: ω ↦ (repartitionDualComponent ω (P i) 1)_i on Ω_F(G − D).
- `agResidueCode`: agResidueCode P G = LinearMap.range (agResidueMap P G).
- `ker_agResidueMap`: ker = Ω_F(G) (differentials without pole at the P_i).
- `agResidueCode_antitone`: G ≤ G′ ⇒ agResidueCode P G′ ≤ agResidueCode P G.

**Checks.**

- `agResidueCode_eq_dual`: agResidueCode P G = Euclidean dual of agEvaluationCode P G (residue-code-is-dual).
- `agResidueCode_eq_bot_of_large_degree`: If Divisor.degree G > n + 2·genus − 2 then agResidueCode P G = ⊥.
- `agResidueCode_ratFunc`: Over RatFunc k with G = (k₀ − 1)P∞ and n = #k points: agResidueCode = reedSolomon x (n − k₀) (full-length Reed–Solomon duality).
- `agResidueCode_ne_evaluation`: In general agResidueCode P G ≠ agEvaluationCode P G: over RatFunc k with n = 3, G = 0 the residue code is the sum-zero code of dimension 2 while C_L is the repetition code.


In particular, verify the following values and consequences.

- C_Ω(D, G) = C_L(D, G)^⊥ (residue-code-is-dual).
- For G with deg G > n + 2g − 2, Ω_F(G − D) = 0 and C_Ω = ⊥.

*Needs:* `TauCeti.weilDifferentialFiltration`, `TauCeti.repartitionDualComponent`, `TauCeti.Divisor`, [Algebraic geometry evaluation codes C_L(D, G)](#FF4-algebraic-geometry-evaluation-code).

**Native roadmap interfaces:** `TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch`, `TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`.

See [Couvreur–Randriambololona](#source-24) — Definition 11, printed p. 9.

<a id="FF4-residue-code-is-dual"></a>

#### Duality of evaluation and residue codes

In the setting of algebraic-geometry-evaluation-code (k finite, exact constants): C_Ω(D, G) is the Euclidean dual of C_L(D, G), and finrank C_Ω = n − finrank C_L.

The hypotheses are as follows. As in algebraic-geometry-evaluation-code.

A proof proceeds as follows. Orthogonality: for f ∈ L(G) and ω ∈ Ω_F(G − D), the abstract residue theorem gives ∑ᶠ_P ω_P(f) = 0 (tauceti:TauCeti.finsum_repartitionDualComponent_eq_zero). For P ∉ {P_i}: v_P(f) ≥ −G(P) = −(G − D)(P), so ω_P(f) = 0 (tauceti:TauCeti.repartitionDualComponent_apply_eq_zero_of_le). At P_i: (G − D)(P_i) = −1 and f − f(P_i) vanishes at P_i, so ω_{P_i}(f − f(P_i)) = 0 and ω_{P_i}(f) = f(P_i)·ω_{P_i}(1) (evaluation-at-rational-place); hence ∑_i f(P_i) ω_{P_i}(1) = 0. Dimension: the kernel of ω ↦ (ω_{P_i}(1))_i on Ω_F(G − D) is Ω_F(G) (tauceti:TauCeti.mem_weilDifferentialFiltration_iff_repartitionDualComponent_eq_zero, checking the local condition at each P_i), so finrank C_Ω = i(G − D) − i(G) (tauceti:TauCeti.finrank_weilDifferentialFiltration); Riemann–Roch (tauceti:TauCeti.exists_isRiemannRochDivisor with TauCeti.Divisor.indexOfSpecialty) turns this into n − (ℓ(G) − ℓ(G − D)) = n − finrank C_L (ag-code-dimension). An orthogonal subspace of dimension n − dim C_L is the whole dual.

In particular, verify the following values and consequences.

- Rational function field with G = (k₀ − 1)P∞ and all q places: the theorem recovers full-length-reed-solomon-dual.
- G = 0 over RatFunc k with n points: C_L is the repetition code and C_Ω the sum-zero code.

*Needs:* [Algebraic geometry residue codes C_Ω(D, G)](#FF4-algebraic-geometry-residue-code), [Algebraic geometry evaluation codes C_L(D, G)](#FF4-algebraic-geometry-evaluation-code), [Dimension of algebraic geometry codes](#FF4-ag-code-dimension), [Evaluation of functions at a rational place](#FF4-evaluation-at-rational-place), `TauCeti.finsum_repartitionDualComponent_eq_zero`, `TauCeti.repartitionDualComponent_apply_eq_zero_of_le`, `TauCeti.mem_weilDifferentialFiltration_iff_repartitionDualComponent_eq_zero`, `TauCeti.finrank_weilDifferentialFiltration`, `TauCeti.exists_isRiemannRochDivisor`, `TauCeti.Divisor.indexOfSpecialty`, `TauCeti.Divisor.IsRiemannRochDivisor`, `dotProductBilin`, `LinearMap.BilinForm.orthogonal`.

**Native roadmap interfaces:** `TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch`, `TauCetiRoadmap/AlgebraicCurves#layer-5-consequences-of-riemannroch-and-local-components`, `TauCetiRoadmap/AlgebraicCodingTheory#layer-2-hamming-data-and-dual-codes`.

See [Couvreur–Randriambololona](#source-24) — Theorem 12, printed p. 9.

<a id="FF4-residue-code-parameters"></a>

#### Parameters of residue codes

If 2g − 2 < deg G < n then finrank C_Ω(D, G) = n + g − 1 − deg G and every nonzero codeword of C_Ω(D, G) has weight ≥ deg G − (2g − 2).

The hypotheses are as follows. As in algebraic-geometry-evaluation-code; 2g − 2 < deg G < n.

A proof proceeds as follows. Dimension: residue-code-is-dual and ag-code-dimension (finrank C_L = deg G + 1 − g). Distance: let ω ∈ Ω_F(G − D) be nonzero with residue vector c, and S = {i : c_i = 0}. For i ∈ S, ω_{P_i} kills 1 and (as (G − D)(P_i) = −1) every function vanishing at P_i, hence all of 𝒪_{P_i} = k + 𝔪_{P_i}; by tauceti:TauCeti.mem_weilDifferentialFiltration_iff_repartitionDualComponent_eq_zero, ω ∈ Ω_F(B) with B = G − D + ∑_{i∈S} P_i. Ω_F(B) = 0 when deg B ≥ 2g − 1, since finrank Ω_F(B) = i(B) (tauceti:TauCeti.finrank_weilDifferentialFiltration) and i(B) = 0 in that range (tauceti:TauCeti.Divisor.indexOfSpecialty_eq_zero_of_two_mul_genus_sub_one_le_degree). Hence deg G − n + #S ≤ 2g − 2, i.e. hammingNorm c = n − #S ≥ deg G − 2g + 2.

In particular, verify the following values and consequences.

- g = 0, deg G = k₀ − 1 < n: finrank C_Ω = n − k₀ and distance ≥ k₀ + 1, the MDS parameters.
- The bound k + d ≥ n + 1 − g also holds for C_Ω when deg G > 2g − 2.

*Needs:* [Duality of evaluation and residue codes](#FF4-residue-code-is-dual), [Dimension of algebraic geometry codes](#FF4-ag-code-dimension), [Algebraic geometry residue codes C_Ω(D, G)](#FF4-algebraic-geometry-residue-code), `TauCeti.mem_weilDifferentialFiltration_iff_repartitionDualComponent_eq_zero`, `TauCeti.finrank_weilDifferentialFiltration`, `TauCeti.Divisor.indexOfSpecialty_eq_zero_of_two_mul_genus_sub_one_le_degree`.

See [Couvreur–Randriambololona](#source-24) — Corollary 22, printed p. 12; [Couvreur–Randriambololona](#source-24) — Lemma 19, printed p. 11.

### 4.9 Cyclic ideals and BCH bounds

<a id="FF4-cyclic-word-quotient-equivalence"></a>

#### Words and the cyclic polynomial quotient

For a field F and n≥1 let R_n=AdjoinRoot(X^n−1). The map c↦class(Σ_{i<n}c_i X^i) is an F-linear equivalence (Fin n→F) ≃ₗ[F] R_n. Multiplication by the class of X corresponds to right cyclic shift s(c)_i=c_{i−1 mod n}.

The hypotheses are as follows. F any field; n≥1; no gcd(n,char F) assumption.

A proof proceeds as follows. Use the native AdjoinRoot quotient and its monic normal form; X^n−1 has degree n. The native degreeLT coefficient equivalence identifies the unique remainder with words. Reduce X times the representative: the last coordinate wraps because X^n=1.

Provide the following interface.

- `cyclicWordEquiv`: The F-linear word-to-quotient equivalence.
- `wordPolynomial`: The representative Σ c_iX^i of degree <n.
- `wordPolynomial_coeff`: For i<n its coefficient i is c_i.
- `cyclicWordEquiv_shift`: e(s c)=root*e(c).
- `cyclicWordEquiv_const`: The constant-coordinate basis word at i maps to root^i.

**Checks.**

- `cyclic_word_zero`: The zero word maps to zero.
- `cyclic_word_wrap`: The shift of the word supported at n−1 maps to 1.
- `cyclic_word_n_one`: At n=1, R_1≃ₐ[F]F and the word maps to its only coordinate.
- `cyclic_word_repeated_root`: For F_2,n=2, the class of X+1 is nonzero and has square zero; no product-of-fields identification is allowed.


In particular, verify the following values and consequences.

- Repeated-root length-two binary quotient still has dimension two.

*Needs:* `AdjoinRoot`, `AdjoinRoot.modByMonicHom`, `Polynomial.degreeLTEquiv`.

See [Bazlov](#source-45) — Week 9, vector/polynomial convention, printed p. 99; proof of Theorem 9.3, printed pp. 101–102 (PDF pp. 2,4–5).

<a id="FF4-cyclic-code-predicate"></a>

#### Cyclic linear codes

For C:TauCeti.LinearCode F (Fin n), n≥1, IsCyclicCode C means s(c)∈C whenever c∈C, where s is the right shift fixed by cyclic-word-quotient-equivalence. It is equivalent to s(C)=C because s^n=id.

The hypotheses are as follows. F field; n≥1; use the native Submodule carrier, not a new code structure.

A proof proceeds as follows. State closure under the actual word-space linear automorphism s. Iterating s gives its inverse s^(n−1), so inclusion implies equality. Submodule lattice operations preserve shift closure.

Provide the following interface.

- `IsCyclicCode`: The right-shift closure predicate.
- `isCyclicCode_iff_shift_eq`: Closure iff the image under shift equals the code.
- `IsCyclicCode.inf`: The intersection of cyclic codes is cyclic.
- `IsCyclicCode.sup`: The sum of cyclic codes is cyclic.

**Checks.**

- `cyclic_zero_code`: The zero code is cyclic.
- `cyclic_whole_code`: The whole native word submodule is cyclic.
- `cyclic_coordinate_nonexample`: At F_2,n=3, span{(1,0,0)} is not cyclic.
- `cyclic_even_three`: At F_2,n=3, the kernel c0+c1+c2=0 is cyclic.


In particular, verify the following values and consequences.

- The zero and whole codes are cyclic; a general one-dimensional coordinate code is not.

*Needs:* [Words and the cyclic polynomial quotient](#FF4-cyclic-word-quotient-equivalence), `TauCeti.LinearCode`.

See [Bazlov](#source-45) — Week 9, opening cyclic-code definition and E3 example, printed pp. 98–99 (PDF pp. 1–2).

<a id="FF4-cyclic-code-ideal-correspondence"></a>

#### Cyclic-code ideal correspondence

The assignment C↦cyclicWordEquiv(C) is an order isomorphism between {C:LinearCode F (Fin n) // IsCyclicCode C} and Ideal R_n. The inverse takes the underlying F-submodule of an ideal back through cyclicWordEquiv.

The hypotheses are as follows. F field,n≥1; repeated-root cases are included.

A proof proceeds as follows. Shift closure gives closure under X, its powers and their F-linear combinations; every quotient element has a polynomial representative. This proves multiplication closure by arbitrary R_n elements. An ideal is closed under multiplication by X, giving shift closure. The native linear equivalence makes both composites identities. Inclusion is preserved in both directions, supplying a genuine OrderIso and its lattice laws.

Provide the following interface.

- `cyclicIdealEquiv`: The stated order isomorphism.
- `cyclicIdealEquiv_mem`: e(c) lies in the assigned ideal iff c∈C.
- `cyclicIdealEquiv_inf`: The correspondence preserves intersection.
- `cyclicIdealEquiv_sup`: The correspondence preserves sums.

**Checks.**

- `cyclic_ideal_zero`: The zero code corresponds to the zero ideal.
- `cyclic_ideal_top`: The whole code corresponds to the unit ideal.
- `cyclic_ideal_even_three`: The binary length-three even-weight code corresponds to the ideal generated by class(X+1).


In particular, verify the following values and consequences.

- There are four binary cyclic codes at n=3, matching the four ideals generated by monic divisors of X³−1.

*Needs:* [Cyclic linear codes](#FF4-cyclic-code-predicate), [Words and the cyclic polynomial quotient](#FF4-cyclic-word-quotient-equivalence).

See [Szőnyi](#source-44) — p. 2, first Proposition and its preceding argument.

<a id="FF4-cyclic-generator-polynomial"></a>

#### Generator polynomial of a cyclic code

Every cyclic C has a unique monic g∈F[X] dividing X^n−1 such that C consists of words whose representative polynomials are divisible by g. Equivalently its quotient ideal is generated by class g. Set generatorPolynomial C=g, including g=X^n−1 for C=0 and g=1 for C=⊤.

The hypotheses are as follows. F field,n≥1,C native linear code with IsCyclicCode C.

A proof proceeds as follows. Pull its quotient ideal back along F[X]→R_n; this ideal contains X^n−1. The polynomial PID makes it principal. Normalize the nonzero generator to monic; divisibility of X^n−1 follows from membership. Uniqueness holds for monic generators of the same ideal. Reduction modulo X^n−1 preserves multiples of g. For degree<n representatives, membership is equivalent to g divisibility.

Provide the following interface.

- `generatorPolynomial`: The unique monic divisor associated to C.
- `generatorPolynomial_monic`: g is monic.
- `generatorPolynomial_dvd`: g divides X^n−1.
- `mem_code_iff_generator_dvd`: c∈C iff g divides wordPolynomial c.
- `generatorPolynomial_unique`: Any monic divisor with that code-membership characterization equals g.

**Checks.**

- `generator_zero`: generatorPolynomial(0)=X^n−1.
- `generator_full`: generatorPolynomial(⊤)=1.
- `generator_even_three`: For binary E3, generatorPolynomial=X+1.
- `generator_repetition_three`: For binary Rep3, generatorPolynomial=X²+X+1.


In particular, verify the following values and consequences.

- Binary even-weight length three: g=X+1. Binary repetition length three: g=X²+X+1.

*Needs:* [Cyclic-code ideal correspondence](#FF4-cyclic-code-ideal-correspondence).

See [Bazlov](#source-45) — Lemma 9.2 and Theorem 9.3 with proof, printed pp. 100–102 (PDF pp. 3–5).

<a id="FF4-cyclic-check-polynomial"></a>

#### Check polynomial of a cyclic code

Set checkPolynomial C=h=(X^n−1)/g, the unique monic h with gh=X^n−1. A word c lies in C iff class(h)*cyclicWordEquiv(c)=0 in R_n. The constant coefficients of g and h are nonzero.

The hypotheses are as follows. The generator-polynomial hypotheses; n≥1.

A proof proceeds as follows. Divisibility supplies exact Euclidean division and gh=X^n−1; monicity of g and the dividend gives monicity of h. The vanishing test means X^n−1 divides h p_c, equivalently gh divides h p_c. Cancel the nonzero h in the polynomial domain to get g divides p_c. Evaluate gh at zero: g(0)h(0)=−1, which proves both constants nonzero and enables reciprocal normalization.

Provide the following interface.

- `checkPolynomial`: The monic quotient h.
- `generator_mul_check`: g*h=X^n−1.
- `checkPolynomial_monic`: h is monic.
- `mem_code_iff_check_annihilates`: c∈C iff class(h)*e(c)=0.
- `checkPolynomial_coeff_zero_ne`: h(0)≠0.

**Checks.**

- `check_zero`: The zero code has h=1.
- `check_full`: The whole code has h=X^n−1.
- `check_even_three`: For binary E3, h=X²+X+1.
- `check_wrong_annihilator`: For binary E3, class(g)*class(g)=class(X²+1)≠0, so g cannot replace h in the annihilator test.


In particular, verify the following values and consequences.

- Do not substitute g in the annihilator test: it is h that annihilates the code ideal.

*Needs:* [Generator polynomial of a cyclic code](#FF4-cyclic-generator-polynomial), [Words and the cyclic polynomial quotient](#FF4-cyclic-word-quotient-equivalence).

See [Bazlov](#source-45) — Check-polynomial definition, printed p. 102; Theorem 9.4 and proof, printed pp. 103–104 (PDF pp. 5–7).

<a id="FF4-cyclic-code-dimension"></a>

#### Dimension and polynomial basis of a cyclic code

A cyclic code with monic generator g has dimension n−natDegree(g). The word representatives of g,Xg,…,X^(n−deg g−1)g form an F-basis. The zero code has the empty basis.

The hypotheses are as follows. F field,n≥1; no squarefreeness assumption.

A proof proceeds as follows. Every degree<n multiple of g is g times a polynomial of degree<n−deg g, by degree additivity. Multiplication by nonzero g is an injective F-linear map from this degree-bounded space onto C. Its monomial basis maps to the listed basis. Use the native degreeLT coefficient equivalence to calculate the dimension.

In particular, verify the following values and consequences.

- Binary E3 has dimension two, Rep3 dimension one, and the zero code dimension zero.

*Needs:* [Generator polynomial of a cyclic code](#FF4-cyclic-generator-polynomial), `Polynomial.degreeLTEquiv`.

See [Bazlov](#source-45) — Theorem 9.3, printed pp. 101–102; Theorem 9.4, printed pp. 103–104 (PDF pp. 4–7).

<a id="FF4-cyclic-dual-generator"></a>

#### Normalized reciprocal generator of the dual

The Euclidean dual C⊥ of a cyclic code is cyclic, and its monic generator is h(0)⁻¹*h.reverse, where h=checkPolynomial C. The reversal has its genuine polynomial degree deg h; no fixed-length word reversal is substituted.

The hypotheses are as follows. F field,n≥1; native dot-product annihilator of C; h(0)≠0 follows from generator_mul_check.

A proof proceeds as follows. Right shift is an orthogonal coordinate permutation; the dual is shift invariant. Dot products with the generator basis become coefficients of products with reversed h, and gh=X^n−1 makes them zero. The reciprocal-generated code has dimension deg g, matching dim C⊥ by native LinearMap.BilinForm.finrank_orthogonal, after checking dot-product nondegeneracy against coordinate vectors. Scale by h(0)⁻¹ to make its leading coefficient one; generator uniqueness identifies it.

In particular, verify the following values and consequences.

- The dual of binary E3 is Rep3; the dual of the whole code is the zero code.

*Needs:* [Check polynomial of a cyclic code](#FF4-cyclic-check-polynomial), [Dimension and polynomial basis of a cyclic code](#FF4-cyclic-code-dimension), `dotProductBilin`, `LinearMap.BilinForm.finrank_orthogonal`.

See [Bazlov](#source-45) — Theorem 9.4 and Corollary 9.5, printed pp. 103–104 (PDF pp. 6–7).

<a id="FF4-general-cyclic-bch-bound"></a>

#### General consecutive-root BCH bound

Let C be a cyclic length-n code over F, and ζ in a field extension E/F have exact multiplicative order n. Suppose its generator has roots ζ^b,…,ζ^(b+δ−2), where 2≤δ≤n+1. Every nonzero word of C has Hamming weight at least δ. The numerical minimum-distance statement requires C≠0; at δ=n+1 this hypothesis is impossible and the word statement correctly forces C=0.

The hypotheses are as follows. n≥1; F,E fields; ζ primitive n-th root, hence char(F)∤n; b≥0; 2≤δ≤n+1.

A proof proceeds as follows. If a nonzero word had t<δ nonzero coordinates e_j, its vanishing at the first t consecutive roots gives a square linear system on the nonzero coefficients times ζ^(b e_j). The system matrix has entries (ζ^e_j)^i. Distinct exponents modulo n and exact root order give distinct entries. Native det_vandermonde_ne_zero_iff makes this matrix invertible, contradicting nonzero coefficients. Import the earlier primitive narrow-sense BCH construction as a specialization, instead of adding a second BCH definition. Guard any default-valued minimum-distance invariant by C≠0.

In particular, verify the following values and consequences.

- The binary length-seven code with g=X³+X+1 and primitive ζ satisfying g(ζ)=0 has ζ,ζ² as roots, giving distance≥3; it has dimension four.
- At δ=n+1, C is zero; a convention assigning distance zero to the zero code cannot satisfy a numerical d≥δ statement.

*Needs:* [Generator polynomial of a cyclic code](#FF4-cyclic-generator-polynomial), `Matrix.det_vandermonde_ne_zero_iff`, `hammingNorm`.

See [Szőnyi](#source-44) — p. 3, Proposition (BCH bound).

### 4.10 Hermitian codes and the native curve comparison

<a id="FF4-hermitian-monomial-code"></a>

#### Hermitian monomial evaluation code

Let p be prime and K have p² elements. Let HermitianPoints={ (x,y)∈K² : y^p+y=x^(p+1) }. For l≥0 let V_l be the K-span in MvPolynomial(Fin 2,K) of X^iY^j with i≤p and i+j≤l. Let HermitianCode p l be the native LinearCode K HermitianPoints given by the image of f↦(f(x,y)) on V_l. The coordinate type is the actual point set; no arbitrary choice of a point ordering enters the definition.

The hypotheses are as follows. p prime; K finite field of cardinality p²; l≥0.

A proof proceeds as follows. Use the native two-variable polynomial algebra, distinct monomial basis and Submodule.span to define V_l. Evaluation at each point is K-linear; its restriction to V_l has an actual Submodule image in the word space. The point carrier is a finite subtype of K×K, and therefore supplies an intrinsic finite coordinate type.

Provide the following interface.

- `HermitianPoints`: The finite subtype defined by the affine Hermitian equation.
- `hermitianMessageSpace`: V_l is the span of the stated distinct monomials.
- `hermitianEval`: The K-linear evaluation map on V_l to the actual point word space.
- `hermitianCode`: Its native linear-code image.
- `mem_hermitianCode`: c lies in the code iff c=ev(f) for some f∈V_l.
- `hermitianCode_mono`: If l≤l′ then HermitianCode p l≤HermitianCode p l′.

**Checks.**

- `hermitian_degree_zero`: V_0 is the one-dimensional constants and the code is the repetition code on the point set.
- `hermitian_p_two_l_one`: For p=2,l=1, the message basis is 1,X,Y and the code has length eight and dimension three.
- `hermitian_p_two_l_two`: For p=2,l=2 the message basis is 1,X,Y,X²,XY,Y² and the code has length eight and dimension six.
- `hermitian_noninjective_boundary`: For p=2,l=3, the nonzero polynomial XY²+XY+X belongs to V_3 and vanishes at all eight points; evaluation is not injective.


In particular, verify the following values and consequences.

- At p=2, l=0,1,2 the message dimensions are 1,3,6; the lengths are eight.

*Needs:* `Submodule.span`, `TauCeti.LinearCode`.

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Exercise 5.23(1),(4),(5), p. 110; exercise begins on p. 109.

<a id="FF4-hermitian-affine-point-count"></a>

#### Hermitian affine point count

For K of size p², the equation y^p+y=x^(p+1) has exactly p³ solutions in K².

The hypotheses are as follows. p prime; char K=p; |K|=p².

A proof proceeds as follows. Over the prime subfield, y^p+y is the trace K/F_p, and x^(p+1) is the norm, hence belongs to F_p. Trace is surjective with kernel size p. Thus every x∈K has exactly p corresponding y values. Multiply |K|*p=p³; no Weil point-count estimate is involved.

In particular, verify the following values and consequences.

- p=2 has eight affine points, plus one projective place at infinity in the curve-model supplier.

*Needs:* [Hermitian monomial evaluation code](#FF4-hermitian-monomial-code), `Algebra.trace_surjective`, `FiniteField.algebraMap_norm_eq_pow`, `Module.card_eq_pow_finrank`.

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Exercise 5.23(1), p. 110; exercise begins on p. 109.

<a id="FF4-hermitian-message-dimension"></a>

#### Hermitian message-space dimension

The dimension of V_l is Σ_{i=0}^{min(p,l)}(l−i+1). For l≤p this is (l+1)(l+2)/2. For l≥p−1 it is (l+1)(p+1)−p(p+1)/2, with the equality interpreted in ℤ or after proving natural nonnegativity. The formulas agree at their overlap.

The hypotheses are as follows. p prime; l≥0; the last formula requires l≥p−1.

A proof proceeds as follows. Distinct monomials form the native polynomial basis. For each allowed X-exponent i there are l−i+1 allowed Y-exponents. Count the triangular sum when l≤p. For l≥p−1, extend through i=p; the extra term at l=p−1 is zero and gives the rectangular-minus-triangle formula. The printed closed formula for all l≥1 is false; the sum is the primary statement.

In particular, verify the following values and consequences.

- p=5,l=1 gives dimension 3, whereas the printed formula gives −3.
- p=2,l=2 gives dimension 6.

*Needs:* [Hermitian monomial evaluation code](#FF4-hermitian-monomial-code).

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Exercise 5.23(4), p. 110; exercise begins on p. 109.

<a id="FF4-hermitian-riemann-roch-comparison"></a>

#### Hermitian code and a native Riemann–Roch space

For the supplier’s native Hermitian function field H/K with coordinate functions x,y, unique rational P∞, and all affine rational places identified with HermitianPoints, the map X^iY^j↦x^iy^j identifies V_l with riemannRochSpace(l(p+1)P∞). Under this equivalence hermitianEval is the earlier rational-place evaluation map, so HermitianCode p l equals C_L(D,l(p+1)P∞) after the point–place coordinate equivalence.

The hypotheses are as follows. Supplier gives IsFunctionField K H, exact constants IsIntegrallyClosedIn K H, the affine coordinate-ring model with basis 1,x,…,x^p over K[y], P∞ unique at infinity, ord∞x=−p, ord∞y=−(p+1), and genus p(p−1)/2. The comparison uses these native function-field statements, including the exact constant field.

A proof proceeds as follows. Import the native model, affine regular-functions/coordinate-ring bridge and pole-order basis theorem from AlgebraicCurves layers 2 and 10. The weights pi+(p+1)j for 0≤i≤p are distinct: equality implies i−i′ is a multiple of p+1 and hence zero. Thus pole orders do not cancel in a nonzero normal-form sum. For 0≤i≤p, pi+(p+1)j≤l(p+1) iff i+j≤l, since pi+(p+1)j=(p+1)(i+j)−i. This proves exactly the V_l basis, even at small l. The supplier’s residue-field equivalences send x,y to affine coordinates. Native rational evaluation then agrees pointwise, identifying the code images.

In particular, verify the following values and consequences.

- For p=2,l=1 the weighted bound is 3 and includes 1,x,y; for l=2 it includes the six monomials listed in the construction.

*Needs:* [Hermitian monomial evaluation code](#FF4-hermitian-monomial-code), `TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves`, `TauCeti.riemannRochSpace`, [Algebraic geometry evaluation codes C_L(D, G)](#FF4-algebraic-geometry-evaluation-code).

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Exercise 5.23(2)–(6), p. 110; exercise begins on p. 109.

<a id="FF4-hermitian-code-parameters"></a>

#### Hermitian code dimension and designed distance

If l(p+1)<p³, HermitianCode p l has length p³, dimension Σ_{i=0}^{min(p,l)}(l−i+1), and minimum distance at least p³−l(p+1). If also l≥p−1, this lower bound equals n−k+1−p(p−1)/2. The positive designed-distance condition makes evaluation injective and the code nonzero.

The hypotheses are as follows. p prime, K of size p², l≥0; l(p+1)<p³; use the supplier’s exact-constant Hermitian model.

A proof proceeds as follows. Use hermitian-affine-point-count for n. Apply the earlier evaluation-code kernel and Goppa bound to G=l(p+1)P∞. Since deg G<n, the kernel L(G−D) is zero by negative degree; dimension is dim V_l. Use hermitian-message-dimension, and only in its valid range rewrite the designed distance in n,k,genus form. The restriction excludes the concrete noninjective p=2,l=3 case.

In particular, verify the following values and consequences.

- p=2,l=0: [8,1,8]; l=1: [8,3,d≥5]; l=2: [8,6,d≥2].
- The dimension claim is not extended to l=3,p=2, where a nine-dimensional message space maps to eight coordinates with a nonzero kernel.

*Needs:* [Hermitian affine point count](#FF4-hermitian-affine-point-count), [Hermitian message-space dimension](#FF4-hermitian-message-dimension), [Hermitian code and a native Riemann–Roch space](#FF4-hermitian-riemann-roch-comparison), [Dimension of algebraic geometry codes](#FF4-ag-code-dimension), [The Goppa bound d ≥ n − deg G](#FF4-goppa-bound).

See [Guruswami–Rudra–Sudan (2026)](#source-46) — Exercise 5.23(5)–(6), p. 110; exercise begins on p. 109.

### 4.11 The finite upper half-plane and Hecke operators

<a id="FF4-finite-upper-half-plane"></a>

#### Terras's finite upper half-plane H_q

Let F be a finite field with q elements, q odd, E a field with [Algebra F E] and [E : F] = 2, and s ∈ E with s ∉ F and δ := s² ∈ F (so δ is a nonsquare of F and E = F(s)). The finite upper half-plane is H := {z ∈ E : z ∉ range (algebraMap F E)}; every z ∈ H is uniquely z = x + y s with x ∈ F, y ∈ Fˣ, and Re z := x, Im z := y. Conventions (pinned): 'upper' means y ≠ 0 (Terras's H_q is a double cover of an upper half-plane); Im depends on the chosen s, and replacing s by c s rescales Im by c^{−1}.

The hypotheses are as follows. F finite, q = #F odd; [E : F] = 2; s ∉ F with s² ∈ F.

A proof proceeds as follows. Define FiniteUpperHalfPlane F E := {z : E // z ∉ Set.range (algebraMap F E)}. (1, s) is an F-basis of E (s ∉ F, dimension 2), giving the coordinates x, y; y ≠ 0 iff z ∉ F. Hence H ≃ F × Fˣ and Nat.card H = q(q − 1).

Provide the following interface.

- `FiniteUpperHalfPlane`: FiniteUpperHalfPlane F E := {z : E // z ∉ Set.range (algebraMap F E)}.
- `FiniteUpperHalfPlane.re`: Re z ∈ F, the first coordinate in the basis (1, s).
- `FiniteUpperHalfPlane.im`: Im z ∈ F, the second coordinate; Im z ≠ 0.
- `FiniteUpperHalfPlane.mk`: x + y s for y ≠ 0.
- `FiniteUpperHalfPlane.equivProd`: FiniteUpperHalfPlane F E ≃ F × Fˣ.
- `FiniteUpperHalfPlane.card`: Nat.card = q(q − 1).

**Checks.**

- `card_finiteUpperHalfPlane_three`: For F = ZMod 3 and E = GaloisField 3 2: Nat.card (FiniteUpperHalfPlane F E) = 6.
- `card_finiteUpperHalfPlane`: Nat.card (FiniteUpperHalfPlane F E) = q * (q − 1).
- `not_mem_finiteUpperHalfPlane_algebraMap`: algebraMap F E x is never in the upper half-plane.
- `finiteUpperHalfPlane_equiv`: FiniteUpperHalfPlane F E ≃ F × Fˣ via z ↦ (Re z, Im z) for the chosen s.


In particular, verify the following values and consequences.

- q = 3, δ = −1: H has 6 elements x + y i, y = ±1.
- s itself (x = 0, y = 1) and −s lie in H; elements of F do not.

*Needs:* `Algebra.norm`, `Module.finrank`, `FiniteField.isSquare_iff`.

See [Kuang](#source-28) — Section 1, printed p. 1; [Vinh–Dung](#source-30) — Section 1, printed p. 2; [DeDeo–Velasquez](#source-25) — Section 2, printed pp. 2–3.

<a id="FF4-mobius-action-on-finite-upper-half-plane"></a>

#### The fractional linear action of GL(2, F_q) on H_q

In the setting of finite-upper-half-plane, GL(2, F) acts on H by g · z = (a z + b)/(c z + d) for g = [[a, b], [c, d]]. It is well defined (cz + d ≠ 0 since z ∉ F and (c, d) ≠ (0, 0)), lands in H because Im(g z) = det(g)·Im(z)/N(cz + d) with N = Algebra.norm F, and is a MulAction; scalar matrices act trivially.

The hypotheses are as follows. As in finite-upper-half-plane.

A proof proceeds as follows. cz + d = 0 with (c, d) ≠ 0 would put z = −d/c ∈ F (or c = 0 = d). Im formula: (az + b)/(cz + d) = (az + b)(c z̄ + d)/N(cz + d) and the s-coordinate of (az + b)(cz̄ + d) is (ad − bc)·Im z (z̄ = the Galois conjugate, s ↦ −s). Action axioms: the usual composition of fractional linear transformations (matrix multiplication), 1 acts trivially.

Provide the following interface.

- `FiniteUpperHalfPlane.instMulAction`: MulAction (GL (Fin 2) F) (FiniteUpperHalfPlane F E).
- `FiniteUpperHalfPlane.coe_smul`: ((g • z : H) : E) = (a z + b)/(c z + d).
- `FiniteUpperHalfPlane.im_smul`: Im (g • z) = det g · Im z / N(c z + d).
- `FiniteUpperHalfPlane.smul_scalar`: Scalar matrices act trivially.

**Checks.**

- `finiteUpperHalfPlane_smul_translation`: [[1, 1], [0, 1]] • z = z + 1 (as elements of E).
- `finiteUpperHalfPlane_smul_scalar`: Scalar matrices c·I act trivially.
- `finiteUpperHalfPlane_smul_affine`: [[y, x], [0, 1]] • s = x + y s for y ≠ 0.
- `finiteUpperHalfPlane_action_not_faithful`: −1 ≠ 1 in GL(2, F) (q odd) but (−1) • z = z for all z.


In particular, verify the following values and consequences.

- [[1, 1], [0, 1]] · z = z + 1 and [[y, x], [0, 1]] · s = x + y s.
- −1 ∈ GL(2, F) acts trivially: the action is not faithful.

*Needs:* [Terras's finite upper half-plane H_q](#FF4-finite-upper-half-plane), `Matrix.GeneralLinearGroup`, `Algebra.norm`, `MulAction.stabilizer`.

See [Kuang](#source-28) — Section 1, fact 1, printed p. 1.

<a id="FF4-finite-upper-half-plane-is-homogeneous"></a>

#### H_q = GL(2, F_q)/K is a homogeneous space

In the setting of finite-upper-half-plane: (a) GL(2, F) acts transitively on H; (b) the stabilizer of s is K = {[[a, bδ], [b, a]] : a² − δb² ≠ 0}, a subgroup isomorphic to Eˣ (via a + b s), of order q² − 1; (c) the affine subgroup {[[y, x], [0, 1]] : y ≠ 0} acts simply transitively, so H ≃ GL(2, F)/K ≃ Aff(F).

The hypotheses are as follows. As in finite-upper-half-plane.

A proof proceeds as follows. (c): [[y, x], [0, 1]] · s = x + y s (mobius-action-on-finite-upper-half-plane), a bijection from the affine group onto H; this gives (a). (b): g · s = s ⟺ a s + b = s(c s + d) = c δ + d s ⟺ b = cδ and a = d; det = a² − δ c² ≠ 0 for (a, c) ≠ 0 since δ is a nonsquare; the map a + c s ↦ [[a, cδ], [c, a]] is the regular representation of E on the basis (1, s), a group isomorphism Eˣ ≅ K. Orbit–stabilizer: |GL(2, F)| = (q² − 1)(q² − q) = |K|·|H| (mathlib:MulAction.card_orbit_mul_card_stabilizer_eq_card_group).

In particular, verify the following values and consequences.

- q = 3: |GL(2, F₃)| = 48 = 8 · 6.
- K contains the scalar matrices (b = 0).

*Needs:* [The fractional linear action of GL(2, F_q) on H_q](#FF4-mobius-action-on-finite-upper-half-plane), [Terras's finite upper half-plane H_q](#FF4-finite-upper-half-plane), `MulAction.card_orbit_mul_card_stabilizer_eq_card_group`, `MulAction.IsPretransitive`.

See [Kuang](#source-28) — Section 1, fact 1, printed p. 1; [DeDeo–Velasquez](#source-25) — Section 3, printed p. 4.

<a id="FF4-terras-distance"></a>

#### Terras's invariant pseudo-distance on H_q

For z, w ∈ H put d(z, w) := N(z − w)/(Im z · Im w) ∈ F, where N = Algebra.norm F : E → F. Pinned: d takes values in F (it is not a metric); the normalisation uses the Im attached to the chosen s. It is symmetric, d(z, w) = 0 iff z = w, and d(s, x + y s) = (x² − δ(y − 1)²)/y; in particular d(s, −s) = 4δ.

The hypotheses are as follows. As in finite-upper-half-plane.

A proof proceeds as follows. Define terrasDistance z w := Algebra.norm F ((z : E) − w) / (im z * im w). Symmetry: N(w − z) = N(−1)N(z − w) = N(z − w) since N(−1) = 1 in a degree-2 extension. N(z − w) = 0 iff z = w (the norm of a nonzero element of a field extension is nonzero). N(x + y s − s) = x² − δ(y − 1)² (N(u + v s) = u² − δ v²).

Provide the following interface.

- `FiniteUpperHalfPlane.terrasDistance`: terrasDistance z w = N(z − w) / (Im z · Im w).
- `FiniteUpperHalfPlane.terrasDistance_comm`: Symmetry.
- `FiniteUpperHalfPlane.terrasDistance_eq_zero_iff`: terrasDistance z w = 0 ↔ z = w.
- `FiniteUpperHalfPlane.terrasDistance_s`: terrasDistance s (x + y s) = (x² − δ (y − 1)²) / y.
- `FiniteUpperHalfPlane.terrasDistance_smul`: terrasDistance (g • z) (g • w) = terrasDistance z w (node terras-distance-invariant).

**Checks.**

- `terrasDistance_self`: terrasDistance z z = 0.
- `terrasDistance_s_neg_s`: terrasDistance s (−s) = 4δ.
- `terrasDistance_comm`: terrasDistance z w = terrasDistance w z.
- `terrasDistance_not_metric`: For q = 3, δ = −1: terrasDistance s (−s) = −4 = 2 ∈ F₃ although s ≠ −s, and the values lie in F, not in an ordered set: no triangle inequality is claimed.


In particular, verify the following values and consequences.

- d(s, s + 1) = 1.
- d(s, −s) = N(2s)/(1·(−1)) = 4δ.

*Needs:* [Terras's finite upper half-plane H_q](#FF4-finite-upper-half-plane), `Algebra.norm`.

See [Kuang](#source-28) — Section 1, fact 2, printed p. 1; [Vinh–Dung](#source-30) — Section 1, (3), printed p. 2.

<a id="FF4-terras-distance-invariant"></a>

#### GL(2, F_q)-invariance of Terras's distance

For g ∈ GL(2, F) and z, w ∈ H: d(g · z, g · w) = d(z, w).

The hypotheses are as follows. As in finite-upper-half-plane.

A proof proceeds as follows. g·z − g·w = det(g)(z − w)/((cz + d)(cw + d)), so N(gz − gw) = det(g)² N(z − w)/(N(cz + d)N(cw + d)) (N multiplicative, N(det g) = det(g)²). Im(gz) Im(gw) = det(g)² Im z Im w /(N(cz + d)N(cw + d)) (mobius-action-on-finite-upper-half-plane); divide.

In particular, verify the following values and consequences.

- Translations z ↦ z + 1 preserve d (N and Im unchanged).
- The inversion [[0, −1], [1, 0]] preserves d(s, −s) = 4δ.

*Needs:* [Terras's invariant pseudo-distance on H_q](#FF4-terras-distance), [The fractional linear action of GL(2, F_q) on H_q](#FF4-mobius-action-on-finite-upper-half-plane), `Algebra.norm`.

See [Kuang](#source-28) — Section 1, fact 2, printed p. 1; [Vinh–Dung](#source-30) — Section 1, printed p. 2.

<a id="FF4-terras-distance-classifies-pairs"></a>

#### Two-point homogeneity: the distance classifies pairs up to GL(2, F_q)

In the setting of finite-upper-half-plane: for z, w, z′, w′ ∈ H, d(z, w) = d(z′, w′) iff there is g ∈ GL(2, F) with g·z = z′ and g·w = w′. Equivalently, the K-orbits on H (K the stabilizer of s) are the level sets {w : d(s, w) = a}, a ∈ F, and there are exactly q double cosets K\GL(2, F)/K.

The hypotheses are as follows. As in finite-upper-half-plane.

A proof proceeds as follows. The reverse direction is distance invariance. For the forward direction move z and z′ to s by the affine transitive action. Put t=(w−s)/(w+s) for w≠−s. Since conjugation sends s to −s, direct calculation gives N(t)=a/(a−4δ) on the level d(s,w)=a, and w=s(1+t)/(1−t) is the inverse Cayley coordinate. For a≠0,4δ, λ=a/(a−4δ) is neither zero nor one. Norm surjectivity makes its norm coset nonempty. A t in this coset is not 1; the inverse Cayley expression has nonzero imaginary part because N(t)≠1, hence gives a point of H. Conversely every point on that level lies in this coset. An element of K is represented by v=A+Bs∈E× and the matrix [[A,Bδ],[B,A]]. Its action sends t to (v̄/v)t. On the cyclic E× of order q²−1, the map v↦v̄/v=v^(q−1) has image exactly ker N of order q+1. Thus K acts transitively on each nonzero-norm coset. The exceptional levels 0 and 4δ are the singletons s and −s. These are exactly q nonempty orbits, so the q double-coset count is a conclusion, not an unproved input.

In particular, verify the following values and consequences.

- The level set d(s, ·) = 0 is {s}; the level set 4δ is {−s}.
- q = 3: the level sets have sizes 1, 1, 4 (6 points).

*Needs:* [GL(2, F_q)-invariance of Terras's distance](#FF4-terras-distance-invariant), [H_q = GL(2, F_q)/K is a homogeneous space](#FF4-finite-upper-half-plane-is-homogeneous), `MulAction.card_orbit_mul_card_stabilizer_eq_card_group`, `FiniteField.unitsMap_norm_surjective`, `IsCyclic.exists_generator`.

See [Kuang](#source-28) — Section 8, printed p. 4; [Kuang](#source-28) — Section 2, printed p. 1.

<a id="FF4-quadratic-character-sum-of-quadratic"></a>

#### Quadratic character sums of quadratic polynomials

Let F be a finite field of odd order q with quadratic character η = quadraticChar F (η(0) = 0) and A, B, C ∈ F with A ≠ 0. Then ∑_{y ∈ F} η(A y² + B y + C) = −η(A) if B² − 4AC ≠ 0, and = (q − 1)·η(A) if B² − 4AC = 0.

The hypotheses are as follows. q odd; A ≠ 0.

A proof proceeds as follows. Complete the square: A y² + B y + C = A((y + B/(2A))² − D/(4A²)) with D = B² − 4AC; η is multiplicative, so the sum is η(A)·∑_t η(t² − D′) with D′ = D/(4A²). D′ = 0: ∑_t η(t²) = q − 1. D′ ≠ 0: count N = #{(t, u) : u² = t² − D′} in two ways: N = ∑_t (1 + η(t² − D′)) (mathlib:quadraticChar_card_sqrts) and N = q − 1 since (t − u)(t + u) = D′ has q − 1 solutions (t − u ranges over Fˣ). Hence ∑_t η(t² − D′) = −1 (Kowalski Lemma 4.16 with d = 2 is the same count).

In particular, verify the following values and consequences.

- F₃: ∑_y η(y² + 1) = η(1) + η(2) + η(2) = 1 − 1 − 1 = −1 (D = −4 ≠ 0).
- F₅: ∑_y η(y²) = 4.

*Needs:* `quadraticChar`, `quadraticChar_card_sqrts`, `quadraticChar_sq_one'`, `MulChar`.

See [Kowalski](#source-4) — Chapter 4, Lemma 4.16, printed p. 51.

<a id="FF4-terras-graph"></a>

#### The finite upper half-plane graphs X_q(δ, a)

In the setting of finite-upper-half-plane and a ∈ F, the Terras graph X_q(δ, a) is the simple graph on H with z ∼ w iff z ≠ w and d(z, w) = a. For a ≠ 0 the condition z ≠ w is automatic.

The hypotheses are as follows. As in finite-upper-half-plane; a ∈ F.

A proof proceeds as follows. Define terrasGraph a : SimpleGraph (FiniteUpperHalfPlane F E) with Adj z w := z ≠ w ∧ terrasDistance z w = a; symmetry from terrasDistance_comm, irreflexivity from z ≠ w. GL(2, F) acts by graph automorphisms (terras-distance-invariant).

Provide the following interface.

- `FiniteUpperHalfPlane.terrasGraph`: terrasGraph a : SimpleGraph (FiniteUpperHalfPlane F E), Adj z w ↔ z ≠ w ∧ terrasDistance z w = a.
- `FiniteUpperHalfPlane.terrasGraph_adj`: Adjacency unfolds to the distance condition.
- `FiniteUpperHalfPlane.terrasGraph_adj_smul`: Adj (g • z) (g • w) ↔ Adj z w.
- `FiniteUpperHalfPlane.terrasGraph_degree`: For a ∉ {0, 4δ} every vertex has degree q + 1 (node terras-graph-regular).

**Checks.**

- `terrasGraph_zero`: terrasGraph 0 = ⊥ (no edges). The adjacency operator must also exclude z=w: for every z, its value on the delta word at z, evaluated at z, is zero, including a=0. The distance-only matrix would instead have diagonal 1 at a=0.
- `terrasGraph_four_delta_matching`: Every vertex of terrasGraph (4δ) has degree 1.
- `terrasGraph_adj_s`: (terrasGraph a).Adj s (x + y s) ↔ x² − δ(y − 1)² = a y and (x, y) ≠ (0, 1).
- `terrasGraph_not_complete`: For q ≥ 5 and a ∉ {0, 4δ}, terrasGraph a ≠ ⊤ (degree q + 1 < q(q − 1) − 1).


In particular, verify the following values and consequences.

- X_q(δ, 0) has no edges; X_q(δ, 4δ) is a perfect matching z ↔ the unique w with d(z, w) = 4δ.
- For a ∉ {0, 4δ} the graph is (q + 1)-regular (terras-graph-regular).

*Needs:* [Terras's invariant pseudo-distance on H_q](#FF4-terras-distance), [GL(2, F_q)-invariance of Terras's distance](#FF4-terras-distance-invariant), `SimpleGraph`.

See [Kuang](#source-28) — Section 1, fact 3, printed p. 1; [Vinh–Dung](#source-30) — Definition 3, printed p. 2.

<a id="FF4-terras-graph-regular"></a>

#### The Terras graphs are (q + 1)-regular

For a ∈ F with a ∉ {0, 4δ}, every z ∈ H has exactly q + 1 neighbours w with d(z, w) = a; so terrasGraph a is (q + 1)-regular. For a = 4δ each z has exactly one such w, and for a = 0 none besides z itself.

The hypotheses are as follows. As in finite-upper-half-plane.

A proof proceeds as follows. By homogeneity (finite-upper-half-plane-is-homogeneous, terras-distance-invariant) take z = s. d(s, x + ys) = a ⟺ x² = δ(y − 1)² + a y (terras-distance). For fixed y ≠ 0 the number of x is 1 + η(Q(y)), Q(y) = δy² + (a − 2δ)y + δ (mathlib:quadraticChar_card_sqrts). ∑_{y≠0}(1 + η(Q(y))) = (q − 1) + ∑_y η(Q(y)) − η(Q(0)) = (q − 1) − η(δ) − η(δ) = q + 1, using quadratic-character-sum-of-quadratic (discriminant a(a − 4δ) ≠ 0) and η(δ) = −1. a = 4δ: Q(y) = δ(y + 1)², so ∑_{y≠0}(1 + η(Q(y))) = (q − 1) − #{y ∉ {0, −1}} = 1, the single point −s; a = 0: Q(y) = δ(y − 1)² and the same count gives only w = s itself, which is excluded by z ≠ w.

In particular, verify the following values and consequences.

- q = 3, δ = −1: for a ∉ {0, −4 = 2} = {1}, each vertex has 4 neighbours; 1 + 1 + 4 = 6 = |H| accounts for all vertices.
- q = 5: degrees 6 for the three admissible values of a, and 1 + 1 + 3·6 = 20 = |H|.

*Needs:* [The finite upper half-plane graphs X_q(δ, a)](#FF4-terras-graph), [Quadratic character sums of quadratic polynomials](#FF4-quadratic-character-sum-of-quadratic), [H_q = GL(2, F_q)/K is a homogeneous space](#FF4-finite-upper-half-plane-is-homogeneous), [GL(2, F_q)-invariance of Terras's distance](#FF4-terras-distance-invariant), `quadraticChar_card_sqrts`, `SimpleGraph.IsRegularOfDegree`.

See [Vinh–Dung](#source-30) — Section 1, printed p. 2.

<a id="FF4-hecke-operator-on-homogeneous-space"></a>

#### Hecke operators of a finite homogeneous space, with pinned measures

Let G be a finite group acting transitively on a finite set X, x₀ ∈ X with stabilizer K, and φ : G → ℂ bi-invariant under K (φ(k g k′) = φ(g)). For f : X → ℂ put (T_φ f)(x) := ∑_{y ∈ X} φ(g_y^{−1} g_x) f(y), where g_x ∈ G is any element with g_x · x₀ = x (well defined by bi-invariance). Pinned measures: X carries counting measure and the inner product ⟨f, f′⟩ = ∑_x f(x) conj f′(x); G carries counting measure divided by |K|, so that T_φ f corresponds to (1/|K|)·(f̃ ⋆ φ) for the right-K-invariant lift f̃ = f ∘ (g ↦ g·x₀) and ordinary convolution on G. The Hecke algebra is the space of K-bi-invariant functions with the convolution (φ ⋆_K ψ)(g) = |K|^{−1} ∑_{h∈G} φ(h) ψ(h^{−1}g).

The hypotheses are as follows. G finite, acting transitively on the finite X; φ K-bi-invariant.

A proof proceeds as follows. Well-definedness: g_x is determined up to right multiplication by K, and φ is bi-invariant. T_φ is ℂ-linear and G-equivariant: T_φ(f ∘ (h⁻¹ ·)) = (T_φ f) ∘ (h⁻¹ ·). Composition: T_φ ∘ T_ψ = T_{ψ ⋆_K φ} (expand and use the |K|-to-one map G → X). Adjoint for the pinned inner product: (T_φ)† = T_{φ̌} with φ̌(g) = conj φ(g⁻¹).

Provide the following interface.

- `heckeOperator`: heckeOperator φ : (X → ℂ) →ₗ[ℂ] (X → ℂ), defined with any choice of g_x (a chosen section of G → X).
- `heckeOperator_apply`: (heckeOperator φ f) x = ∑_y φ ((g y)⁻¹ * g x) * f y.
- `heckeOperator_comp`: heckeOperator φ ∘ heckeOperator ψ = heckeOperator (ψ ⋆_K φ).
- `heckeOperator_adjoint`: ∑_x (T_φ f) x · conj (f′ x) = ∑_x f x · conj ((T_{φ̌} f′) x).
- `heckeOperator_smul_comm`: T_φ commutes with the G-action on functions.

**Checks.**

- `heckeOperator_indicator_stabilizer`: For φ = indicator of K, heckeOperator φ = LinearMap.id.
- `heckeOperator_const`: For φ = 1 (constant), (heckeOperator φ f) x = ∑_y f y for every x.
- `heckeOperator_equivariant`: heckeOperator φ commutes with translation by every h ∈ G.
- `heckeOperator_needs_biinvariance`: For G = S₃ acting on {0,1,2}, K = stabilizer of 0 and φ = indicator of a transposition not in K and not bi-invariant, the formula ∑_y φ(g_y⁻¹ g_x) f(y) depends on the choice of the g_x.


In particular, verify the following values and consequences.

- φ = the indicator of K gives the identity operator.
- For X = H_q, G = GL(2, F_q) and φ the indicator of the double coset D_a, T_φ is the adjacency operator of terrasGraph a (a ≠ 0).

*Needs:* `MulAction.stabilizer`, `MulAction.IsPretransitive`, `starRingEnd`, `MeasureTheory.Measure.count`.

See [Kuang](#source-28) — Section 4, printed p. 1; [Kuang](#source-28) — Section 2, printed p. 1.

<a id="FF4-gelfand-trick"></a>

#### Gelfand's trick: symmetric double cosets give a commutative Hecke algebra

In the setting of hecke-operator-on-homogeneous-space, if K g K = K g⁻¹ K for every g ∈ G, then the Hecke operators commute: T_φ ∘ T_ψ = T_ψ ∘ T_φ for all K-bi-invariant φ, ψ.

The hypotheses are as follows. As in hecke-operator-on-homogeneous-space.

A proof proceeds as follows. Write ιφ(g)=φ(g⁻¹), without complex conjugation; this is distinct from the adjoint φ̌(g)=conj(φ(g⁻¹)). Inversion reverses normalized convolution: ι(φ⋆_Kψ)=ιψ⋆_Kιφ. The double-coset hypothesis gives ιφ=φ for every bi-invariant φ, hence φ⋆_Kψ=ψ⋆_Kφ. No assertion that every complex Hecke operator is self-adjoint is needed. Conclude with heckeOperator_comp.

In particular, verify the following values and consequences.

- For the Terras graphs the adjacency operators commute (finite-upper-half-plane-gelfand-pair).
- For G abelian and K = 1 the hypothesis fails for g of order > 2, but the Hecke algebra is commutative anyway: the criterion is sufficient, not necessary.

*Needs:* [Hecke operators of a finite homogeneous space, with pinned measures](#FF4-hecke-operator-on-homogeneous-space).

See [Kuang](#source-28) — Section 2, printed p. 1.

<a id="FF4-finite-upper-half-plane-gelfand-pair"></a>

#### (GL(2, F_q), K) is a Gelfand pair; the Terras graph adjacency operators commute

In the setting of finite-upper-half-plane with G = GL(2, F) and K the stabilizer of s: K g K = K g⁻¹ K for all g. Consequently the adjacency operators A_a of terrasGraph a (a ∈ F) pairwise commute, are self-adjoint for the counting inner product on H, and ∑_{a∈F} A_a + I = J (the all-ones operator) when A_0 is taken to be 0.

The hypotheses are as follows. As in finite-upper-half-plane.

A proof proceeds as follows. d(g s, s) = d(s, g⁻¹ s) = d(g⁻¹ s, s) (terras-distance-invariant with g⁻¹, and symmetry), so g and g⁻¹ lie in the same double coset by terras-distance-classifies-pairs. For a≠0, A_a is the coset-sum Hecke operator of the distance-level indicator, with the |K|⁻¹ normalization already included when expressed as a sum over G. For a=0 that indicator gives I, while the loopless graph has A_0=0. Apply Gelfand’s trick to all nonzero-a indicators and handle A_0 separately. Self-adjointness: the indicator is invariant under g ↦ g⁻¹ and real (heckeOperator_adjoint). Every pair (z, w) has exactly one value d(z, w), which gives ∑_a A_a + I = J.

In particular, verify the following values and consequences.

- q = 3: the operators A_1 and A_2 (the latter the matching) commute.
- A_a has constant row sums q + 1 for a ∉ {0, 4δ} (terras-graph-regular), so the constant function is a common eigenvector.

*Needs:* [Gelfand's trick: symmetric double cosets give a commutative Hecke algebra](#FF4-gelfand-trick), [Hecke operators of a finite homogeneous space, with pinned measures](#FF4-hecke-operator-on-homogeneous-space), [Two-point homogeneity: the distance classifies pairs up to GL(2, F_q)](#FF4-terras-distance-classifies-pairs), [GL(2, F_q)-invariance of Terras's distance](#FF4-terras-distance-invariant), [The finite upper half-plane graphs X_q(δ, a)](#FF4-terras-graph).

See [Kuang](#source-28) — Sections 2 and 8, printed pp. 1, 4; [Kuang](#source-28) — Section 4, printed p.2.

<a id="FF4-terras-graph-ramanujan"></a>

#### The Terras graphs are Ramanujan (Katz, Li)

For a ∈ F \ {0, 4δ}, every eigenvalue λ of the adjacency operator of terrasGraph a other than the trivial eigenvalue q + 1 satisfies |λ| ≤ 2√q.

The hypotheses are as follows. As in finite-upper-half-plane; a ∉ {0, 4δ}.

A proof proceeds as follows. Apply [Character sums for Terras eigenvalues](#FF4-terras-spectral-character-transfer) after the earlier Gelfand-pair diagonalization. Its principal-series mixed Kummer sums and cuspidal quadratic norm-one sums cover the nontrivial spectrum under the chosen normalization. The principal-series route uses the exact Layer 2 trace/weight/conductor targets; the cuspidal route uses [Katz estimate for the quadratic norm torus](#FF4-katz-quadratic-torus-estimate). The latter imports weights at most one from DWP.7/cohomological-bounds-3-3-2-3-3-6. The spectral normalization and exhaustiveness theorem, the norm-one Lang-sheaf trace formula and the tame Euler-characteristic formula are essential inputs. The excluded parameters a=0,4delta are exactly where the graph and character geometry degenerate.

In particular, verify the following values and consequences.

- q = 3: the nontrivial eigenvalues of the 4-regular graph X₃(−1, 1) have absolute value ≤ 2√3.
- The trivial eigenvalue q + 1 exceeds 2√q, so it must be excluded.

*Needs:* [(GL(2, F_q), K) is a Gelfand pair; the Terras graph adjacency operators commute](#FF4-finite-upper-half-plane-gelfand-pair), [The Terras graphs are (q + 1)-regular](#FF4-terras-graph-regular), [Character sums for Terras eigenvalues](#FF4-terras-spectral-character-transfer).

See [Kuang](#source-28) — Section 8, printed p. 4; [Vinh–Dung](#source-30) — Lemma 4, printed p. 4.

### 4.12 Norm-one character sums and finite-plane spectra

<a id="FF4-soto-andrade-norm-one-sum"></a>

#### Soto–Andrade norm-one sums

For an odd finite field F of size q, a quadratic extension K/F, U={u∈K×:Norm_{K/F}(u)=1}, a multiplicative character ε:F×→ℂ×, a character ω:U→ℂ× and t∈F, set S(ε,ω,t)=Σ_{u∈U} ε₀(Tr_{K/F}(u)+t)ω(u), where ε₀(0)=0 even for the trivial character.

The hypotheses are as follows. K/F degree two, F finite and odd; actual norm-one subgroup of units; complex unit-valued characters.

A proof proceeds as follows. Take the kernel of the native norm homomorphism on K× and a finite sum of character values. Define zero extension explicitly, then compose trace plus t with ε₀. Keep ω on U rather than on all K×.

Provide the following interface.

- `NormOneUnits`: The subgroup ker(Norm:K×→F×).
- `sotoAndradeSum`: The complex finite sum with ε₀(0)=0.
- `normOneUnits_card`: The cardinality is q+1.
- `sotoAndradeSum_trivial`: With both characters trivial, S=q+1−#{u∈U:Tr(u)+t=0}.
- `sotoAndradeSum_inversion`: S(ε,ω,t)=S(ε,ω⁻¹,t), since trace is invariant under u↦u⁻¹ on U.

**Checks.**

- `soto_trivial_zero_extension`: With both characters trivial, a term with Tr(u)+t=0 contributes zero, not one.
- `soto_q_three_trivial`: For F_3⊂F_9 and t=0, both trivial characters give S=2, since exactly two U-elements have trace zero.
- `soto_q_three_quadratic`: For F_3⊂F_9,t=0, ε quadratic and ω of order four, S=−2.
- `soto_inverse_character`: Replacing ω by its inverse leaves S unchanged.


In particular, verify the following values and consequences.

- |U|=q+1. Tr(u)+t vanishes at at most two U-elements.

*Needs:* `Algebra.trace`, `FiniteField.unitsMap_norm_surjective`.

See [Katz, Soto–Andrade](#source-42) — Theorem 1, pp. 143–144, specialized to n=2.

<a id="FF4-katz-quadratic-torus-estimate"></a>

#### Katz estimate for the quadratic norm torus

For the norm-one sum above, |S(ε,ω,t)|≤2√q unless (ε=1 and ω=1), or (ε and ω both have exact order two and t∈{2,−2}). If t=±2 outside these exceptions, the stronger |S|≤√q follows from a one-dimensional H¹_c.

The hypotheses are as follows. q odd; K/F degree two; characters finite order; exclusions are exact orders, not merely orders dividing two.

A proof proceeds as follows. Compactify the norm-one torus to a genus-zero curve; over the algebraic closure the coordinate z gives Tr(u)=z+z⁻¹. Remove the zeros of z²+tz+1. There are two distinct roots unless t=±2, when there is one double root. Use the Layer 2 norm-one Lang-torsor character sheaf for ω and the Layer 2 Kummer sheaf for ε composed with trace+t. These have rank one, finite monodromy, weight zero and tame ramification. Their Frobenius trace is the summand, including its zero extension on removed points. Geometric triviality occurs exactly in the two excluded cases: for a simple root ε is visible in inertia; for a double root the conditions are ε²=1 and the remaining torus monodromy compatible with ε. Nontriviality kills H²_c; nonproperness kills H⁰_c. The genus-zero tame Euler characteristic is −2 or −1, so dim H¹_c is two or one. Transfer the earlier compact-support trace formula to the Lang character sheaf. DWP.7/cohomological-bounds-3-3-2-3-3-6, clause (i) (or fixed-embedding clause (iv)), applies to the weight-zero sheaf and gives weights ≤1 on H¹_c. Each eigenvalue has complex norm ≤√q; sum them. Use the norm-one Lang construction and trace formula above, and the exact tame Euler-characteristic contract; the mixed-weight bound suffices.

In particular, verify the following values and consequences.

- q=3, ε quadratic and ω of order four, t=0 gives |S|=2≤2√3.
- At q=5, ε and ω quadratic and t=2, |S|=5>2√5, so the exceptional hypothesis is necessary.

*Needs:* [Soto–Andrade norm-one sums](#FF4-soto-andrade-norm-one-sum), [The Kummer sheaf L_χ(g)](#FF2-kummer-sheaf), [H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve), [dim H¹_c(U, 𝓕) ≤ C(𝓕)², with the conductor C(𝓕) = rk 𝓕 + #S + Σ Sw_x(𝓕)](#FF2-h1c-conductor-bound), `DeligneWeightsAndPurity:DWP.7/cohomological-bounds-3-3-2-3-3-6`, `EtaleDualityAndPerverseSheaves:EDC.2`.

See [Katz, Soto–Andrade](#source-42) — Theorem 1, p. 143; proof for n=2, pp. 145–149.

<a id="FF4-terras-spectral-character-transfer"></a>

#### Character sums for Terras eigenvalues

In the earlier finite upper half-plane over F_q, q odd, δ nonsquare, and a∉{0,4δ}, each nontrivial adjacency eigenvalue is, up to a sign, either Jχ(a)=Σ_{y∈F×}χ(y)χ₂(a y+δ(y−1)²) for a nontrivial multiplicative χ of F×, or S(χ₂,ω,a/δ−2) for a nontrivial character ω of the quadratic norm-one group. Here χ₂(0)=0. Hence every such eigenvalue has norm≤2√q, supplying the earlier terras-graph-ramanujan target.

The hypotheses are as follows. The earlier graph and Gelfand-pair conventions; q odd; a≠0,4δ; χ₂ is the quadratic character.

A proof proceeds as follows. Import the earlier Gelfand-pair simultaneous diagonalization. Induced principal-series eigenvalues are obtained by counting x²=a y+δ(y−1)²: the 1 term vanishes after summing a nontrivial χ, leaving Jχ. The quadratic twist of Steinberg is included by χ=χ₂. Cuspidal spherical functions reduce to the quadratic norm-one sum with t=a/δ−2. Prove normalization and coverage of every spherical representation with the odd-characteristic spherical-function formulas; commutativity alone does not supply either assertion. For Jχ, its rank-one mixed Kummer sheaf on P¹ minus 0,∞ and the two roots has geometric nontriviality, tame conductor and dim H¹_c≤2. The discriminant a(a−4δ) is nonzero, so roots are distinct. Import the corresponding Layer 2 mixed-character Weil bound. For the cuspidal sum t≠±2 and ω≠1, apply katz-quadratic-torus-estimate; neither exception survives. Both routes give 2√q. No second Ramanujan theorem node duplicates the earlier target.

In particular, verify the following values and consequences.

- For q=3,δ=−1,a=1, the six-vertex 4-regular graph has spectrum 4,0,0,0,−2,−2, within the bound off the trivial eigenvalue.
- At a=0 or4δ the graph/character geometry degenerates; the theorem excludes both.

*Needs:* [(GL(2, F_q), K) is a Gelfand pair; the Terras graph adjacency operators commute](#FF4-finite-upper-half-plane-gelfand-pair), [The Terras graphs are (q + 1)-regular](#FF4-terras-graph-regular), [Katz estimate for the quadratic norm torus](#FF4-katz-quadratic-torus-estimate), [Trace formula for products of Artin–Schreier and Kummer characters (Scholie 1.9)](#FF2-character-sheaf-trace-formula), [Deligne's estimate for character sums on a variety by the Betti numbers of the character sheaf (1.17.1)](#FF2-deligne-estimate-for-character-sums), [H⁰_c and H²_c of a lisse sheaf on an affine curve](#FF2-lisse-sheaf-extremal-cohomology-on-curve), [dim H¹_c(U, 𝓕) ≤ C(𝓕)², with the conductor C(𝓕) = rk 𝓕 + #S + Σ Sw_x(𝓕)](#FF2-h1c-conductor-bound).

See [Kuang](#source-28) — §§3–5 and §8, pp. 1–4; comparison theorem proof on p. 3; [Katz, Soto–Andrade](#source-42) — Theorem 1 and n=2 proof, pp. 143–149.

### Examples

In GR(4,2)=(Z/4Z)[X]/(X²+X+1), trace(X)=−1=3. For GR(8,2), the principal 2-units have 8 elements killed by squaring and 16 killed by the fourth power. A binary period-three trace word has autocorrelation 3 at zero shift and −1 otherwise; with b=(0,1,1), a=(1,1,0), the chosen cross-correlation is −1 at shift zero and 3 at shift two. A degree-less-than-two RS code on three distinct F₅ points has dimension two and minimum nonzero weight two. For p=2 the Hermitian affine curve has eight F₄ points; at message degree one the dimension is three.

### Dependencies

Linearized polynomial laws come from Layer 0. Character and correlation identities use Layer 1, and their bounds use Layer 2. Galois rings specialise truncated Witt vectors and native Teichmüller lifts; generic codes and duals come from AlgebraicCodingTheory. AG codes use native places, Riemann–Roch spaces and Weil differentials. The Hermitian comparison consumes AlgebraicCurves Layer 10. The finite-plane estimate uses explicit spherical normalization and the norm-one Lang-sheaf estimate, not merely a commuting adjacency algebra.

<a id="FF5"></a>

## Layer 5: Arithmetic applications

Transport Layer 2 estimates to integer polynomials, prime-modulus Kloosterman sums and good-prime local densities with explicit normalizations. Apply Layer 4 sequence estimates and give algebraic correctness and exact fibre-count privacy statements for the cryptographic examples. Discrete-logarithm hardness is not inferred from group-theoretic correctness.

### 5.1 Weil bounds in the integer normalisation

<a id="FF5-weil-bound-integer-polynomial-mod-p"></a>

#### Weil's bound for complete exponential sums of integer polynomials modulo p

Let f ∈ ℤ[X] have degree d ≥ 1 and let p be a prime with p ∤ lead(f) and p > d. Then |∑_{x ∈ ZMod p} e(f(x)/p)| ≤ (d − 1)√p, where e(x/p) is Mathlib's ZMod.stdAddChar (exp(2πi x̃/p) for any lift x̃) and f is reduced modulo p. The exact constants handed to consumers: degree d − 1, modulus √p, hypotheses p ∤ lead(f) and p > d (which give p ∤ deg and exclude Artin–Schreier-trivial f).

The hypotheses are as follows. f ∈ ℤ[X], d = natDegree f ≥ 1; p prime, p ∤ leadingCoeff f, d < p.

A proof proceeds as follows. The reduction f̄ ∈ F_p[X] has degree d (p ∤ lead f). Over F_p the trace is the identity, so the canonical additive character ψ(x) = e(Tr(x)/p) of [The canonical additive character of a finite field](#FF1-canonical-additive-character) is ZMod.stdAddChar. d < p gives p ∤ d, and f̄ is not of the form g^p − g + c (such polynomials have degree divisible by p or are constant), so [Weil's bound |Σ ψ(f(x))| ≤ (deg f − 1)√q for p ∤ deg f](#FF2-weil-bound-additive) applies with q = p.

In particular, verify the following values and consequences.

- For odd p, f = X²: the quadratic Gauss sum has absolute value √p = (2 − 1)√p (equality).
- f = X^p is excluded by p > d; indeed ∑_x e(x^p/p) = ∑_x e(x/p) = 0 but X^p − X is Artin–Schreier trivial over F_p.

*Needs:* [Weil's bound |Σ ψ(f(x))| ≤ (deg f − 1)√q for p ∤ deg f](#FF2-weil-bound-additive), [The canonical additive character of a finite field](#FF1-canonical-additive-character), `ZMod.stdAddChar`, `Polynomial.map`.

See [Kowalski](#source-4) — Chapter 3, Theorem 3.2, printed p. 31; [Kowalski](#source-4) — Chapter 3, Corollary 3.4 and proof, printed p. 32.

<a id="FF5-weil-bound-integer-polynomial-uniform"></a>

#### A uniform explicit constant for all primes

Let f ∈ ℤ[X] have degree d ≥ 1 and put P₀ := max(d, |lead f|). Then for every prime p, |∑_{x ∈ ZMod p} e(f(x)/p)| ≤ max(d − 1, √P₀)·√p.

The hypotheses are as follows. f ∈ ℤ[X] with natDegree f = d ≥ 1.

A proof proceeds as follows. If p > P₀ then p > d and p ∤ lead f (0 < |lead f| < p), so weil-bound-integer-polynomial-mod-p gives (d − 1)√p. If p ≤ P₀ then the trivial bound |S| ≤ p = √p·√p ≤ √P₀·√p.

In particular, verify the following values and consequences.

- f = X² + X: P₀ = 2 and the bound is max(1, √2)√p.
- For f = 7X³ the bound is max(2, √7)√p.

*Needs:* [Weil's bound for complete exponential sums of integer polynomials modulo p](#FF5-weil-bound-integer-polynomial-mod-p).

See [Kowalski](#source-4) — Chapter 3, Corollary 3.4 and proof, printed p. 32.

<a id="FF5-legendre-sum-squarefree-integer-polynomial"></a>

#### Legendre-symbol sums of squarefree integer polynomials

Let g ∈ ℤ[X] have degree n ≥ 1 and nonzero discriminant (Polynomial.discr g ≠ 0). For every odd prime p with p ∤ lead(g)·discr(g), |∑_{x ∈ ZMod p} η(g(x))| ≤ (n − 1)√p, where η = quadraticChar (ZMod p) (η(0) = 0). For n = 3 and g = X³ + aX + b the discriminant is −4a³ − 27b².

The hypotheses are as follows. n ≥ 1; discr g ≠ 0; p odd, p ∤ lead(g)·discr(g).

A proof proceeds as follows. Modulo p, g has degree n and n distinct roots in F̄_p (discr ḡ ≠ 0), so ḡ is not a constant times a square (n ≥ 1, simple roots) and the number m of distinct roots is n. Apply [Weil's bound |Σ χ(g(x))| ≤ (m − 1)√q when g is not a constant times an ord(χ)-th power](#FF2-weil-bound-multiplicative) with χ = η of order 2.

In particular, verify the following values and consequences.

- g = X³ + X + 1 (discr −31): |∑ η(g(x))| ≤ 2√p for odd p ≠ 31.
- g = X³ − 3X + 2 = (X − 1)²(X + 2) has discriminant 0 and is excluded.

*Needs:* [Weil's bound |Σ χ(g(x))| ≤ (m − 1)√q when g is not a constant times an ord(χ)-th power](#FF2-weil-bound-multiplicative), `quadraticChar`, `Polynomial.discr`.

See [Kowalski](#source-4) — Chapter 3, Theorem 3.1, printed p. 31; [Kowalski](#source-4) — Chapter 3, Corollary 3.3 and proof, printed p. 32.

<a id="FF5-kloosterman-sum-mod-p"></a>

#### Kloosterman sums modulo a prime

For a prime p and m, n ∈ ZMod p, the Kloosterman sum is kloostermanModP p m n := ∑_{x ∈ (ZMod p)ˣ} e((m x + n x⁻¹)/p) with e(·/p) = ZMod.stdAddChar. Pinned: the sum runs over units only (x = 0 excluded); it equals the finite-field Kloosterman sum of Layer 2 over F_p with the canonical character (trace = identity).

The hypotheses are as follows. p prime.

A proof proceeds as follows. Define kloostermanModP p m n := ∑ x : (ZMod p)ˣ, ZMod.stdAddChar (m * x + n * x⁻¹). Symmetry m ↔ n: substitute x ↦ x⁻¹. Twisting: kloostermanModP p (a m) n = kloostermanModP p m (a n) for a a unit (substitute x ↦ a⁻¹x). Real: complex conjugation corresponds to x ↦ −x. m = n = 0: p − 1; n = 0, m ≠ 0: the Ramanujan sum ∑_{x≠0} e(mx/p) = −1.

Provide the following interface.

- `kloostermanModP`: kloostermanModP p m n = ∑ x : (ZMod p)ˣ, ZMod.stdAddChar (m * x + n * x⁻¹).
- `kloostermanModP_comm`: Symmetric in m and n.
- `kloostermanModP_mul_left`: kloostermanModP p (a * m) n = kloostermanModP p m (a * n) for a a unit.
- `kloostermanModP_conj`: conj (kloostermanModP p m n) = kloostermanModP p m n.
- `kloostermanModP_zero_right`: kloostermanModP p m 0 = −1 for m ≠ 0.

**Checks.**

- `kloostermanModP_three_one_one`: kloostermanModP 3 1 1 = −1.
- `kloostermanModP_zero_zero`: kloostermanModP p 0 0 = p − 1.
- `kloostermanModP_comm`: kloostermanModP p m n = kloostermanModP p n m.
- `kloostermanModP_ne_sum_all`: Summing over all x ∈ ZMod p with the junk value 0⁻¹ = 0 adds the term e(0) = 1: kloostermanModP p m n ≠ ∑_x e((m x + n x⁻¹)/p).


In particular, verify the following values and consequences.

- p = 3, m = n = 1: e(2/3) + e(4/3) = −1.
- kloostermanModP p 0 0 = p − 1.

*Needs:* `ZMod.stdAddChar`, `ZMod.toCircle`, [The canonical additive character of a finite field](#FF1-canonical-additive-character).

See [Kowalski](#source-4) — Introduction, Definition 7, printed p. 4.

<a id="FF5-kloosterman-bound-mod-p"></a>

#### Weil's bound for Kloosterman sums modulo p

For a prime p and m, n ∈ ZMod p with m n ≠ 0: ‖kloostermanModP p m n‖ ≤ 2√p.

The hypotheses are as follows. p prime; m, n nonzero mod p.

A proof proceeds as follows. kloostermanModP p m n is the Layer 2 Kloosterman sum over F_p with the canonical additive character (kloosterman-sum-mod-p, trace = identity), and [Weil's bound |K(a, b)| ≤ 2√q for Kloosterman sums](#FF2-kloosterman-bound) gives 2√q with q = p.

In particular, verify the following values and consequences.

- p = 3: |−1| ≤ 2√3.
- For m = 0 the sum is −1 (the hypothesis m n ≠ 0 is not needed for this bound but is for the general theory).
- For m=0,n≠0 the sum is −1; for m=n=0 it is p−1 and the nondegenerate Weil bound is not asserted.

*Needs:* [Kloosterman sums modulo a prime](#FF5-kloosterman-sum-mod-p), [Weil's bound |K(a, b)| ≤ 2√q for Kloosterman sums](#FF2-kloosterman-bound).

See [Kowalski](#source-4) — Introduction, Theorem 10, printed p. 5.

### 5.2 Point counts and local densities

<a id="FF5-double-cover-point-count"></a>

#### Points on y² = g(x) over F_q

Let F be a finite field of odd order q, η = quadraticChar F and g ∈ F[X]. Then #{(x, y) ∈ F² : y² = g(x)} = q + ∑_{x∈F} η(g(x)).

The hypotheses are as follows. q odd; g arbitrary (possibly constant or zero).

A proof proceeds as follows. For fixed x, #{y : y² = g(x)} = 1 + η(g(x)) (mathlib:quadraticChar_card_sqrts; the value η(0) = 0 counts the single root y = 0); sum over x.

In particular, verify the following values and consequences.

- g = 0: q points (y = 0 for every x) and the sum is 0.
- g = X over F₅: #{y² = x} = 5 + ∑ η(x) = 5.

*Needs:* `quadraticChar_card_sqrts`, `quadraticChar`.

See [Kowalski](#source-4) — Chapter 4, Lemma 4.16, printed p. 51.

<a id="FF5-double-cover-point-count-bound"></a>

#### Local density of y² = g(x): the Weil error term

In the setting of double-cover-point-count, if g is not of the form c·h² with c ∈ F and h ∈ F̄[X] (equivalently, some root of g in F̄ has odd multiplicity) and g has m distinct roots in an algebraic closure, then |#{(x, y) : y² = g(x)} − q| ≤ (m − 1)√q. Hence, for g ∈ ℤ[X] squarefree of degree n ≥ 1 and p ∤ 2·lead(g)·discr(g), the normalised local count N_p/p = 1 + O((n − 1)p^{−1/2}).

The hypotheses are as follows. q odd; g not a constant times a square in F̄[X].

A proof proceeds as follows. Combine double-cover-point-count with [Weil's bound |Σ χ(g(x))| ≤ (m − 1)√q when g is not a constant times an ord(χ)-th power](#FF2-weil-bound-multiplicative) (χ = η of order 2). The integer version reduces modulo p as in legendre-sum-squarefree-integer-polynomial.

In particular, verify the following values and consequences.

- g = X³ + aX + b squarefree: |N − q| ≤ 2√q (Hasse's bound for the affine part of the elliptic curve).
- g = X²: g is a square and N = 2q − 1 (the lines y = ±x meet at the origin), far from q: the hypothesis is necessary.

*Needs:* [Points on y² = g(x) over F_q](#FF5-double-cover-point-count), [Weil's bound |Σ χ(g(x))| ≤ (m − 1)√q when g is not a constant times an ord(χ)-th power](#FF2-weil-bound-multiplicative), [Legendre-symbol sums of squarefree integer polynomials](#FF5-legendre-sum-squarefree-integer-polynomial).

See [Kowalski](#source-4) — Chapter 4, Remark 4.29, printed p. 65; [Kowalski](#source-4) — Chapter 3, Theorem 3.1, printed p. 31.

<a id="FF5-hensel-lift-count"></a>

#### Counting lifts of a nonsingular zero modulo p^m

Let F ∈ ℤ[x_1, …, x_n] (n ≥ 1), p prime, m ≥ 1 and x̄ ∈ (ℤ/p^m)^n with F(x̄) ≡ 0 (mod p^m) and ∇F(x̄) ≢ 0 (mod p). Among the p^n lifts of x̄ to (ℤ/p^{m+1})^n, exactly p^{n−1} satisfy F ≡ 0 (mod p^{m+1}).

The hypotheses are as follows. n ≥ 1; m ≥ 1; the gradient is nonzero modulo p at x̄.

A proof proceeds as follows. Write a lift as x + p^m h with h ∈ F_p^n. Taylor expansion: F(x + p^m h) ≡ F(x) + p^m ∇F(x)·h (mod p^{m+1}) since 2m ≥ m + 1 (MvPolynomial.pderiv and the binomial expansion of monomials). The condition becomes ∇F(x̄)·h ≡ −F(x)/p^m (mod p), an affine hyperplane in F_p^n because ∇F(x̄) ≢ 0: p^{n−1} solutions.

In particular, verify the following values and consequences.

- F = x₁² + x₂² − 1, p = 3, the zero (1, 0) mod 3: exactly 3 of its 9 lifts mod 9 are zeros.
- F = x₁², the zero 0 mod p: the gradient vanishes and all p lifts x₁ ∈ pℤ/p² are zeros — the hypothesis is needed.

*Needs:* `MvPolynomial.pderiv`, `MvPolynomial.eval`, `ZMod.castHom`.

See [Griffiths](#source-32) — Section 1, printed p. 1.

<a id="FF5-local-density-at-good-prime"></a>

#### Local densities at good primes are normalised finite-field point counts

Let F ∈ ℤ[x_1, …, x_n] (n ≥ 1) and p a prime such that every zero of F̄ in F_p^n is nonsingular (∇F̄ ≠ 0 there). Then for every m ≥ 1, #{x ∈ (ℤ/p^m)^n : F(x) ≡ 0} = p^{(m−1)(n−1)}·N_p, where N_p = #{x ∈ F_p^n : F̄(x) = 0}; hence the p-adic local density σ_p := lim_m p^{−m(n−1)} #{x mod p^m : F(x) ≡ 0} exists and equals N_p/p^{n−1}.

The hypotheses are as follows. n ≥ 1; every F_p-zero of F̄ nonsingular.

A proof proceeds as follows. Induction on m with hensel-lift-count: each zero mod p^m reduces to a nonsingular zero mod p (the gradient condition only depends on x mod p), so it has exactly p^{n−1} lifting zeros mod p^{m+1}. The sequence p^{−m(n−1)}·count is constant from m = 1 on.

In particular, verify the following values and consequences.

- F = x₁² + x₂² − 1 at odd p: N_p = p − η(−1), so σ_p = 1 − η(−1)/p.
- F = x₁ (a hyperplane): σ_p = 1 for every p.

*Needs:* [Counting lifts of a nonsingular zero modulo p^m](#FF5-hensel-lift-count).

See [Griffiths](#source-32) — Section 1, printed p. 1; [Griffiths](#source-32) — Section 2.1, (2)–(3), printed p. 4.

### 5.3 A sequence example

<a id="FF5-m-sequence-decimation-correlation-bound"></a>

#### Weil's bound for cross-correlations of m-sequences and their decimations

Let F be a finite field of characteristic p with q elements, L ⊇ F of degree m, α a generator of Lˣ, a(n) = Tr(α^n), b(n) = a(dn) with 2 ≤ d < q^m and p ∤ d, χ a nontrivial additive character of F and N = q^m − 1. Then for every t, |charCorrelation χ N b a t + 1| ≤ (d − 1)·q^{m/2}.

The hypotheses are as follows. 2 ≤ d < q^m; p ∤ d; χ ≠ 1.

A proof proceeds as follows. By [Cross-correlation of an m-sequence with its decimation is a character sum](#FF4-decimation-cross-correlation-character-sum), C(t) + 1 = ∑_{x∈L} ψ(x^d − α^t x) with ψ = χ ∘ Tr_{L/F}, a nontrivial additive character of L (the trace is surjective). The polynomial x^d − α^t x has degree d prime to the characteristic and d < q^m, so it is not Artin–Schreier trivial; [Weil's bound |Σ ψ(f(x))| ≤ (deg f − 1)√q for p ∤ deg f](#FF2-weil-bound-additive) over L (q^m elements) gives the bound.

In particular, verify the following values and consequences.

- Gold decimations d = 2^k + 1 over F₂ (p = 2 ∤ d): |C(t) + 1| ≤ 2^k·2^{m/2}.
- d = q (a linear decimation) is excluded (p ∣ q); there the correlation is exactly −1 or N.

*Needs:* [Cross-correlation of an m-sequence with its decimation is a character sum](#FF4-decimation-cross-correlation-character-sum), [Weil's bound |Σ ψ(f(x))| ≤ (deg f − 1)√q for p ∤ deg f](#FF2-weil-bound-additive), `Algebra.trace`.

See [Goresky–Klapper (2009)](#source-26) — Chapter 13, Proposition 13.5.1, printed p. 318; [Kowalski](#source-4) — Chapter 3, Theorem 3.2, printed p. 31.

### 5.4 Cryptographic and coding examples

<a id="FF5-pohlig-hellman-reduction"></a>

#### Reduction of discrete logarithms to prime-power order (Pohlig–Hellman)

Let γ generate a finite cyclic group G of order N = ∏_i q_i^{e_i} and α = γ^x. (a) For each i, α^{N/q_i^{e_i}} = (γ^{N/q_i^{e_i}})^x and γ^{N/q_i^{e_i}} has order q_i^{e_i}, so its discrete logarithm determines x mod q_i^{e_i}; x mod N is recovered from these residues by the Chinese remainder theorem. (b) If γ has order q^e and x = q^f v + u with 0 ≤ u < q^f, then α^{q^{e−f}} = (γ^{q^{e−f}})^u and α γ^{−u} = (γ^{q^f})^v, reducing to orders q^f and q^{e−f}; iterating with f = 1 reduces to e discrete logarithms in the subgroup of order q.

The hypotheses are as follows. G finite cyclic of order N; γ a generator; the factorisation of N is given.

A proof proceeds as follows. (a) (γ^x)^{N/q^e} = (γ^{N/q^e})^x; orderOf (γ^{N/q^e}) = q^e (mathlib:orderOf_pow_orderOf_div); x ≡ x_i (mod q_i^{e_i}) for the logarithm x_i; CRT (mathlib:ZMod.chineseRemainder) recovers x mod N. (b) γ^{q^{e−f}} has order q^f, and α^{q^{e−f}} = γ^{q^{e−f}(q^f v + u)} = (γ^{q^{e−f}})^u since γ^{q^e} = 1; α γ^{−u} = γ^{q^f v}.

In particular, verify the following values and consequences.

- G = (ZMod 13)ˣ (N = 12 = 4·3), γ = 2: logarithms are computed from one logarithm in the subgroup of order 4 and one in the subgroup of order 3.
- For N = 2^16 (G = F_65537ˣ) part (b) reduces to 16 logarithms in {±1} (correctness-without-hardness-example).

*Needs:* [Discrete logarithms in a finite cyclic group](#existing-boundaries), `orderOf_pow_orderOf_div`, `ZMod.chineseRemainder`, `orderOf_dvd_iff_pow_eq_one`.

See [Shoup](#source-1) — Chapter 11, §11.2.4, printed p. 333; [Shoup](#source-1) — Chapter 11, §11.2.3, printed p. 331.

<a id="FF5-correctness-without-hardness-example"></a>

#### Correctness does not imply hardness: an explicit fast discrete logarithm on F_65537

Let p = 65537 = 2^16 + 1 (prime) and γ = 3, a generator of F_pˣ (3^{2^15} = −1). The Diffie–Hellman protocol in F_pˣ with base 3 is correct (diffie-hellman-correctness), and the explicit procedure dlogFermat, which determines the binary digits x_0, …, x_15 of log_3 α one at a time by testing (α·3^{−(x_0 + ⋯ + x_{i−1}2^{i−1})})^{2^{15−i}} = −1, satisfies 3^{dlogFermat α} = α for every α ∈ F_pˣ, using 16 digit tests (at most 15 squarings per test), with generator powers precomputed and one residual update per digit; the full operational cost remains a CN.0 contract. Hence the correctness of the protocol over F_p does not imply that computing discrete logarithms (or Diffie–Hellman keys) in F_pˣ is hard; hardness is a separate hypothesis, never a consequence of the finite-field theorems.

The hypotheses are as follows. p = 65537; γ = 3.

A proof proceeds as follows. 3 generates F_pˣ: p − 1 = 2^16, so the order of 3 is a power of 2, and 3^{2^15} = −1 ≠ 1 (a finite computation; Pépin's criterion shows the same). pohlig-hellman-reduction (b) with q = 2, e = 16, f = 1 iterated: at step i the element (α·3^{−x_{<i}})^{2^{15−i}} lies in {±1} and equals (−1)^{x_i}. Validate the 16-step dlogFermat fold on all 65,536 nonzero residues: every output must satisfy 0≤x<65,536 and 3^x=α. Use the displayed finite domain and the actual fold in a kernel-checked decision, then apply `of_decide_eq_true`, or prove the same equality by induction on the 16 digits. Record the arithmetic trace and prove its operation count in the requested CN.0 model; kernel acceptance alone supplies no such cost bound. The non-implication is witnessed by this pair (correct protocol, explicitly computable logarithm): no theorem of this roadmap has computational hardness as a conclusion.

In particular, verify the following values and consequences.

- dlogFermat 2 = 55296, and 3^{55296} ≡ 2 (mod 65537).
- dlogFermat 1 = 0 and dlogFermat 3 = 1.

*Needs:* [Correctness of the Diffie–Hellman key exchange](#existing-boundaries), [Reduction of discrete logarithms to prime-power order (Pohlig–Hellman)](#FF5-pohlig-hellman-reduction), [Discrete logarithms in a finite cyclic group](#existing-boundaries), `of_decide_eq_true`.

See [Shoup](#source-1) — Chapter 11, §11.2.4, printed p. 333; [Shoup](#source-1) — Chapter 11, §11.3, printed p. 335.

<a id="FF5-shamir-secret-sharing"></a>

#### Shamir's secret sharing scheme

Let F be a finite field, t ≥ 1 the threshold, n players labelled by distinct nonzero x_1, …, x_n ∈ F (so n ≤ #F − 1). Dealing a secret s ∈ F with randomness c = (c_1, …, c_{t−1}) ∈ F^{t−1} gives the shares shamirShares s c := (P(x_i))_i with P = s + c_1 X + ⋯ + c_{t−1} X^{t−1}. The share map (s, c) ↦ shares is F-linear, and the share vectors are exactly the Reed–Solomon codewords reedSolomon x t (the secret is P(0), the evaluation at the extra point 0).

The hypotheses are as follows. F finite; t ≥ 1; the x_i distinct and nonzero.

A proof proceeds as follows. Define shamirShares x s c i := (C s + ∑_{j<t−1} C (c j) X^{j+1}).eval (x i). Linearity in (s, c) is linearity of evaluation. Share vectors = RS codewords: every polynomial of degree < t arises as s + ∑ c_j X^{j+1} ([Reed–Solomon codes](#FF4-reed-solomon-code)).

Provide the following interface.

- `shamirShares`: shamirShares x s c = fun i ↦ (C s + ∑_j C (c j) * X^(j+1)).eval (x i).
- `shamirShares_add`: shamirShares x (s + s′) (c + c′) = shamirShares x s c + shamirShares x s′ c′ (linearity).
- `shamirShares_mem_reedSolomon`: Share vectors are the codewords of reedSolomon x t; for distinct labels and 1≤t≤n its dimension is t (for t>n it is n).
- `shamirShares_mul`: Pointwise products of shares are shares of the product secret for the product polynomial of degree ≤ 2t − 2.

**Checks.**

- `shamirShares_zmod_five`: For F = ZMod 5, x = ![1, 2, 3], t = 2, s = 3, c = ![1]: shamirShares x s c = ![4, 0, 1].
- `shamirShares_threshold_one`: For t = 1 every share equals s.
- `shamirShares_mem_reedSolomon`: shamirShares x s c ∈ reedSolomon x t.
- `shamirShares_zero_label_leaks`: If some label x_i = 0 were allowed, that player's share would be the secret s itself: the labels must be nonzero.


In particular, verify the following values and consequences.

- t = 1: every share equals s (no secrecy).
- t = 2, F = ZMod 5, x = (1, 2, 3), s = 3, c₁ = 1: shares (4, 0, 1).

*Needs:* [Reed–Solomon codes](#FF4-reed-solomon-code), `Polynomial.eval`, `Lagrange.interpolate`.

See [Couvreur–Randriambololona](#source-24) — Section 8.4, printed pp. 47–48; [Couvreur–Randriambololona](#source-24) — Section 8.4, printed p. 48.

<a id="FF5-shamir-reconstruction"></a>

#### Reconstruction from any t shares

In the setting of shamir-secret-sharing, for any set S of t players, the secret s is determined by the shares (y_i)_{i∈S}: s = ∑_{i∈S} y_i ∏_{j∈S, j≠i} x_j/(x_j − x_i) (Lagrange interpolation at 0).

The hypotheses are as follows. #S = t; the x_i distinct.

A proof proceeds as follows. P has degree < t and is determined by its values at t distinct points (mathlib:Lagrange.eq_interpolate_of_eval_eq); evaluate the Lagrange interpolant at 0.

In particular, verify the following values and consequences.

- t = 2, x = (1, 2), shares (4, 0) over ZMod 5: s = 4·(2/(2 − 1)) + 0 = 8 = 3.
- t = 1: s = y_i.

*Needs:* [Shamir's secret sharing scheme](#FF5-shamir-secret-sharing), `Lagrange.eq_interpolate_of_eval_eq`, `Lagrange.interpolate`.

See [Couvreur–Randriambololona](#source-24) — Section 8.4, (i), printed p. 48.

<a id="FF5-shamir-perfect-privacy"></a>

#### Perfect privacy against t − 1 players

In the setting of shamir-secret-sharing, for any set S of at most t − 1 players, any secret s and any share values v ∈ F^S, the number of randomness vectors c ∈ F^{t−1} with shamirShares x s c|_S = v equals #F^{t−1−#S}, independently of s. Hence, with c uniform, the distribution of the shares seen by S does not depend on the secret. This is an unconditional (information-theoretic) theorem, in contrast with computational hardness assumptions.

The hypotheses are as follows. #S ≤ t − 1; the x_i distinct and nonzero.

A proof proceeds as follows. For fixed s, c ↦ (P(x_i))_{i∈S} is an affine map F^{t−1} → F^S whose linear part is c ↦ (∑_j c_j x_i^{j+1})_{i∈S}; this has full rank #S because the x_i are distinct and nonzero (a Vandermonde matrix times diag(x_i)). Each fibre of a surjective affine map is a coset of the kernel, of size #F^{t−1−#S}, independent of s.

In particular, verify the following values and consequences.

- t = 2, one player: for every secret s and share v there is exactly one c₁ = (v − s)/x₁.
- With S of size t the count depends on s (it is 1 or 0): privacy fails, as reconstruction shows.

*Needs:* [Shamir's secret sharing scheme](#FF5-shamir-secret-sharing), `Matrix.vandermonde`, `LinearMap.finrank_range_add_finrank_ker`.

See [Couvreur–Randriambololona](#source-24) — Section 8.4, (ii), printed p. 48.

### Examples

With f=X² and p=3, the complete exponential sum is i√3, attaining the degree-two bound. For y²=x over F₅ the count is five, so the normalized good-prime density is one. For Shamir threshold two over F₅ at points 1,2,3, secret 3 and slope 1 give shares (4,0,1); any pair reconstructs 3. At any single nonzero point every requested share has exactly one slope for each fixed secret. The nonzero-point condition is necessary: evaluation at zero reveals the secret.

### Dependencies

The arithmetic estimates use Layer 2 with the Layer 1 sign conventions. Good-prime lift counts use multivariate Taylor expansion and the nonsingular-gradient condition, while exact secret-sharing fibres use finite-field interpolation and rank-nullity. Pohlig–Hellman correctness uses cyclic group algebra; the ordinary shared-power identity is already Mathlib pow_mul_comm.

## Native code and curve comparisons

For degree-one P, evaluation on P.integers is residue followed by the inverse of k≃ₐ[k]P.ResidueField. Its kernel is the native maximal ideal and it is surjective on constants. Do not define evaluation as an arbitrary supplied map.

Targets: [Evaluation of functions at a rational place](#FF4-evaluation-at-rational-place).

Existing interfaces: `TauCeti.Place.integers`, `TauCeti.Place.ResidueField`, `TauCeti.Place.residueFieldEquivOfDegreeEqOne`.

Use actual places P:Fin n→Place k H, injective P, degree one and G.coeff(P i)=0. Write D=Σi (the native point divisor at P i). Under IsFunctionField k H and exact constants IsIntegrallyClosedIn k H, evaluate the native riemannRochSpace G; code=image. Kernel is L(G−D) viewed inside L(G) by the natural inclusion. Dimension is l(G)−l(G−D); the positive-distance/nonzero-code guards in the earlier apply.

Targets: [Algebraic geometry evaluation codes C_L(D, G)](#FF4-algebraic-geometry-evaluation-code), [Dimension of algebraic geometry codes](#FF4-ag-code-dimension), [The Goppa bound d ≥ n − deg G](#FF4-goppa-bound).

Existing interfaces: `TauCeti.Place`, `TauCeti.Divisor`, `TauCeti.riemannRochSpace`.

Use native weilDifferentialFiltration(G−D), a submodule of the dual of the repartition space. The residue coordinate is the native repartitionDualComponent ω (P i) evaluated at 1. The global residue sum and Riemann–Roch give its image as the Euclidean annihilator of the evaluation code; no new differential type is invented.

Targets: [Algebraic geometry residue codes C_Ω(D, G)](#FF4-algebraic-geometry-residue-code), [Duality of evaluation and residue codes](#FF4-residue-code-is-dual), [Parameters of residue codes](#FF4-residue-code-parameters).

Existing interfaces: `TauCeti.weilDifferentialFiltration`.

Use actual RatFunc places: finite place X−a from the native degree-one equivalence and the actual infinity place. Distinct a give distinct places; evaluate constants by their value, and 1/X at infinity by zero. Carry IsFunctionField and exact-constant guards through every comparison.

Targets: [Reed–Solomon codes are the AG codes of the rational function field](#FF4-reed-solomon-as-ag-code).

Existing interfaces: `TauCeti.Place.ratFuncDegreeOneEquiv`, `TauCeti.Place.adicOfIrreducible_X_sub_C_injective`.

## Downstream consumers

The finite-field presentations and factorisation certificates support ComputationalNumberTheory and FunctionFieldArithmetic. AnalyticNumberTheory uses the field-coordinate Fourier and Gauss–Jacobi transport; DrinfeldModulesAndTModules uses the common linearized-polynomial law and Ore comparison. WeilConjectures and DeligneWeightsAndPurity provide the general geometric estimates, while their arithmetic applications consume the explicit conductor and trace comparisons here. ArithmeticStatistics and SieveMethodsAndPrimePatterns use uniform sums and constant-field cosets. AlgebraicCodingTheory imports the specialised code families, while cryptographic applications use exact algebraic correctness and fibre counts without a hardness assertion.

## References

Locators use the editions listed below. Preprint and draft page numbers refer to that version; journal page numbers are stated separately.

<a id="source-1"></a>

### Victor Shoup — A Computational Introduction to Number Theory and Algebra (Version 2)

Version 2, the author's freely distributable PDF (598 pages); printed page = PDF page − 18.

[Source location](https://shoup.net/ntb/ntb-v2.pdf).

<a id="source-2"></a>

### Keith Conrad — Finite fields

Expository handout, the author's PDF (13 pages).

[Source location](https://kconrad.math.uconn.edu/blurbs/galoistheory/finitefields.pdf).

<a id="source-3"></a>

### Keith Conrad — Tensor products II

Expository handout, the author's PDF (43 pages).

[Source location](https://kconrad.math.uconn.edu/blurbs/linmultialg/tensorprod2.pdf).

<a id="source-4"></a>

### Emmanuel Kowalski — Exponential sums over finite fields: elementary methods

Lecture notes, version of September 14, 2021, the author's PDF; printed page = PDF page − 2.

[Source location](https://people.math.ethz.ch/~kowalski/exponential-sums-elementary.pdf).

<a id="source-5"></a>

### Keith Conrad — Gauss and Jacobi sums on finite fields and Z/mZ

Expository handout, the author's PDF (19 pages).

[Source location](https://kconrad.math.uconn.edu/blurbs/gradnumthy/Gauss-Jacobi-sums.pdf).

<a id="source-6"></a>

### Keith Conrad — L-functions for Gauss and Jacobi sums

Expository handout, the author's PDF (5 pages).

[Source location](https://kconrad.math.uconn.edu/blurbs/gradnumthy/LfunctionGaussJacobi.pdf).

<a id="source-7"></a>

### Keith Conrad — Jacobi sums and Stickelberger's congruence

The author's preprint of L'Enseignement Mathématique (2) 41 (1995), 141–153 (9 pages); locators below use the author's preprint pagination.

[Source location](https://kconrad.math.uconn.edu/articles/jacobistick.pdf).

<a id="source-8"></a>

### S. A. Katre — Gauss–Jacobi sums and Stickelberger's theorem

In: Cyclotomic Fields and Related Topics (Pune, 1999), eds. S. D. Adhikari, S. A. Katre, D. Thakur, Bhaskaracharya Pratishthana, 2000, pp. 75–92; the publisher's free PDF.

[Source location](https://www.bprim.org/sites/default/files/jacn.pdf).

<a id="source-9"></a>

### Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma — Irreducibility of random polynomials: general measures

Invent. Math. 233 (2023), 1041–1120; read as arXiv:2007.14567v3 (marked final version; printed page = PDF page).

[Source location](https://arxiv.org/pdf/2007.14567v3).

<a id="source-10"></a>

### Pierre Deligne — Cohomologie etale (SGA 4 1/2), expose 'Application de la formule des traces aux sommes trigonometriques' [Sommes trig.]

Lecture Notes in Mathematics 569, Springer 1977, pp. 168-232; scan served by the Institute for Advanced Study (publications.ias.edu, file Number32.pdf, 351 pages).

[Source location](https://publications.ias.edu/sites/default/files/Number32.pdf).

<a id="source-11"></a>

### Pierre Deligne — La conjecture de Weil. I

Publications mathematiques de l'IHES 43 (1974), 273-307; Numdam scan PMIHES_1974__43__273_0.

[Source location](http://www.numdam.org/article/PMIHES_1974__43__273_0.pdf).

<a id="source-12"></a>

### Pierre Deligne — La conjecture de Weil. II

Publications mathematiques de l'IHES 52 (1980), 137-252; Numdam scan PMIHES_1980__52__137_0.

[Source location](http://www.numdam.org/article/PMIHES_1980__52__137_0.pdf).

<a id="source-13"></a>

### Etienne Fouvry, Emmanuel Kowalski, Philippe Michel, Will Sawin — Lectures on Applied l-adic Cohomology

arXiv:1712.03173v3 (16 April 2019), 68 pages; published in Contemporary Mathematics 740 (2019).

[Source location](https://arxiv.org/abs/1712.03173v3).

<a id="source-14"></a>

### Gerard Laumon — Transformation de Fourier, constantes d'equations fonctionnelles et conjecture de Weil

Publications mathematiques de l'IHES 65 (1987), 131-210; Numdam scan PMIHES_1987__65__131_0.

[Source location](http://www.numdam.org/article/PMIHES_1987__65__131_0.pdf).

<a id="source-15"></a>

### Tim Browning and Will Sawin — A geometric version of the circle method

arXiv:1711.10451v3 (19 February 2020; published Ann. of Math. 191 (2020), 893-948); arXiv v3 pagination and published pagination are distinguished in the locators.

[Source location](https://arxiv.org/abs/1711.10451v3).

<a id="source-16"></a>

### Sudhir R. Ghorpade and Gilles Lachaud — Etale cohomology, Lefschetz theorems and number of points of singular varieties over finite fields

arXiv:0808.2169v1 (15 August 2008), corrected version of Moscow Math. J. 2 (2002), 589-631.

[Source location](https://arxiv.org/abs/0808.2169v1).

<a id="source-17"></a>

### Enrico Bombieri — Counting points on curves over finite fields (d'apres S. A. Stepanov)

Seminaire Bourbaki 25e annee (1972/73), expose 430, pp. 234-241; Numdam scan SB_1972-1973__15__234_0.

[Source location](http://www.numdam.org/article/SB_1972-1973__15__234_0.pdf).

<a id="source-18"></a>

### Ivan Tomasic — A twisted theorem of Chebotarev

arXiv:1210.3571v1 (12 October 2012).

[Source location](https://arxiv.org/abs/1210.3571v1).

<a id="source-19"></a>

### J. S. Milne — Algebraic Number Theory (course notes)

Version 3.08, 19 July 2020.

[Source location](https://www.jmilne.org/math/CourseNotes/ANT.pdf).

<a id="source-20"></a>

### Andrew V. Sutherland — 18.783 Elliptic Curves, lecture notes

MIT, Fall 2023: Lecture 3 (14 Sept 2023), Lecture 7 (3 Oct 2023), Lecture 8 (5 Oct 2023).

[Source location](https://math.mit.edu/classes/18.783/2023/LectureNotes8.pdf).

<a id="source-21"></a>

### René Schoof — Counting points on elliptic curves over finite fields

Journal de Théorie des Nombres de Bordeaux 7 (1995), 219-254 (Numdam).

[Source location](http://www.numdam.org/item/JTNB_1995__7_1_219_0.pdf).

<a id="source-22"></a>

### Eli Ben-Sasson, Tuvi Etzion, Ariel Gabizon and Netanel Raviv — Subspace Polynomials and Cyclic Subspace Codes

arXiv:1404.7739v3 (12 April 2015).

[Source location](https://arxiv.org/abs/1404.7739).

<a id="source-23"></a>

### Antonia W. Bluher — Permutation properties of Dickson and Chebyshev polynomials with connections to number theory

arXiv:1707.06877v3 (1 May 2021).

[Source location](https://arxiv.org/abs/1707.06877).

<a id="source-24"></a>

### Alain Couvreur and Hugues Randriambololona — Algebraic geometry codes and some applications

arXiv:2009.01281v1 (2 September 2020).

[Source location](https://arxiv.org/abs/2009.01281).

<a id="source-25"></a>

### M. R. DeDeo and Elinor Velasquez — The Heat Equation on the Finite Poincaré Upper Half-Plane

arXiv:2001.10555v1 (28 January 2020).

[Source location](https://arxiv.org/abs/2001.10555).

<a id="source-26"></a>

### Mark Goresky and Andrew Klapper — Algebraic Shift Register Sequences

Public draft of October 14, 2009 (the book appeared with Cambridge University Press, 2012).

[Source location](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf).

<a id="source-28"></a>

### Jinghua Kuang — Eigenfunctions on the Finite Poincaré Plane

arXiv:math/9411217v1 (29 November 1994).

[Source location](https://arxiv.org/abs/math/9411217).

<a id="source-29"></a>

### Christopher J. Shallue — Permutation polynomials of finite fields

arXiv:1211.6044v1 (23 November 2012).

[Source location](https://arxiv.org/abs/1211.6044).

<a id="source-30"></a>

### Le Anh Vinh and Dang Phuong Dung — Explicit tough Ramsey graphs

arXiv:0807.2692v1 (17 July 2008).

[Source location](https://arxiv.org/abs/0807.2692).

<a id="source-31"></a>

### Baofeng Wu and Zhuojun Liu — Linearized polynomials over finite fields revisited

arXiv:1211.5475v2 (1 January 2013).

[Source location](https://arxiv.org/abs/1211.5475).

<a id="source-32"></a>

### Samuel Griffiths — Elementary local representation densities at all primes via lifting recursions

arXiv:2602.21070v1 (24 February 2026).

[Source location](https://arxiv.org/abs/2602.21070).

<a id="source-33"></a>

### Henri Cohen — Number Theory, Volume II: Analytic and Modern Tools

Springer GTM 240 (2007), ISBN 978-0-387-49893-5. The indicated book locators are unverified; the elementary Gauss and Jacobi sum statements also have the public Conrad sources above.

[Source location](https://doi.org/10.1007/978-0-387-49894-2).

<a id="source-34"></a>

### Jonas Bergström, Carel Faber and Sam Payne — Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves

arXiv:2206.07759v2 (17 October 2023); published Annals of Mathematics 199 (2024).

[Source location](https://arxiv.org/pdf/2206.07759v2).

<a id="source-35"></a>

### Henri Cohen — Errata, Changes, and Addenda for the Books Number Theory, Volumes I and II

Last modified 30 November 2008.

[Source location](https://www.math.u-bordeaux.fr/~cohen/deabookerrata.pdf).

<a id="source-36"></a>

### Nicholas M. Katz — Sums of Betti numbers in arbitrary characteristic

Author manuscript; published Finite Fields Appl. 7 (2001), 29–44.

[Source location](https://web.math.princeton.edu/~nmk/BettiSum14.pdf).

<a id="source-37"></a>

### Jean-Pierre Serre — Sur les corps locaux à corps résiduel algébriquement clos

Bull. Soc. Math. France 89 (1961), 105–154.

[Source location](https://www.numdam.org/item/BSMF_1961__89__105_0.pdf).

<a id="source-38"></a>

### Michel Raynaud — Caractéristique d’Euler–Poincaré d’un faisceau et cohomologie des variétés abéliennes

Séminaire Bourbaki 1964/65, exposé 286; torsion-coefficient formulation.

[Source location](https://www.numdam.org/item/SB_1964-1966__9__129_0.pdf).

<a id="source-39"></a>

### Steve Meagher — A simple proof of Chebotarev’s density theorem over finite fields

Bull. Aust. Math. Soc. 98 (2018), 196–202.

[Source location](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/72DECC8EB5E120B1218B4A3AC4129C62/S0004972718000448a.pdf/a-simple-proof-of-chebotarevs-density-theorem-over-finite-fields.pdf).

<a id="source-40"></a>

### Alan Adolphson; Steven Sperber — On the degree of the L-function associated with an exponential sum

Compositio Math. 68 (1988), 125–159.

[Source location](https://www.numdam.org/item/CM_1988__68_2_125_0.pdf).

<a id="source-41"></a>

### Mark Goresky and Andrew Klapper — Algebraic Shift Register Sequences

April 2, 2011 public draft; chapter numbers differ from the 2009 draft.

[Source location](https://www.math.ias.edu/~goresky/pdf/algebraic0.pdf).

<a id="source-42"></a>

### Nicholas M. Katz — Estimates for Soto-Andrade sums

J. reine angew. Math. 438 (1993), 143–161; public scan of the published article.

[Source location](https://web.math.princeton.edu/~nmk/old/sotosums.pdf).

<a id="source-43"></a>

### Andrew Klapper — d-Form Sequences: Families of Sequences with Low Correlation Values and Large Linear Span

Public author copy of the d-form paper, cited as [93] in GK09.

[Source location](https://www.cs.uky.edu/~klapper/pdf/TN.pdf).

<a id="source-44"></a>

### Tamás Szőnyi — Cyclic codes

Four-page public course handout.

[Source location](https://szonyitamas.web.elte.hu/cyclic.pdf).

<a id="source-45"></a>

### Yuri Bazlov — Coding theory, Week 9: Cyclic codes

Public University of Manchester course notes, version November 12, 2023.

[Source location](https://personalpages.manchester.ac.uk/staff/yuri.bazlov/code/notes/ch9.pdf).

<a id="source-46"></a>

### Venkatesan Guruswami, Atri Rudra and Madhu Sudan — Essential Coding Theory

Accessibility revision dated April 19, 2026; Exercise 5.23, pp. 109–110.

[Source location](https://cse.buffalo.edu/faculty/atri/courses/coding-theory/book/ada-coding-book.pdf).

<a id="source-47"></a>

### Alain M. Robert — The Gross–Koblitz formula revisited

Rendiconti del Seminario Matematico della Università di Padova 105 (2001), 157–170. The tail-bound lemma and its proof, printed pp.166–168, give the coefficient estimate and binary tail calculation; Theorem 4, p.168, is the all-prime Gross–Koblitz formula. Appendix 1 on p.169 gives Gamma reflection, and Appendix 2 there identifies the compatible-root splitting values.

[Source location](https://www.numdam.org/article/RSMUP_2001__105__157_0.pdf).


<a id="source-48"></a>

### Benedict H. Gross and Neal Koblitz — Gauss sums and the p-adic Gamma-function

Annals of Mathematics 109 (1979), 569–581. Theorem 3.1 assumes p odd; its binary extension here is supplied by the arithmetic recurrence argument in DirichletPadicLFunctions §4.6.

[Source location](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf).
