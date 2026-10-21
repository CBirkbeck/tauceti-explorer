# Diophantine approximation and transcendence, Part II: arithmetic algebraization

Integral Taylor coefficients give a discrete lower bound on a nonzero coefficient. A large analytic uniformization gives an upper bound through Cauchy's formula. This roadmap makes that tension quantitative for many independent germs at once. Its central estimate bounds the number of germs by the mean positive logarithmic growth of one rational function, divided by the logarithm of the uniformizing derivative. Applying it to powers gives algebraicity. Applying it to pole-cleared holonomic germs gives finite rank.

This is a continuation of `DiophantineApproximationAndTranscendence`. Its earlier heights, Diophantine approximation, transcendence, and E- and G-function layers remain with that roadmap. The new objects are the arithmetic lattices and simultaneous analytic germ relation, the auxiliary functions and integrated rank estimates, the circle adapters used in a third proof, and the arithmetic holonomic spans. Complex ODE theory, Nevanlinna quotients, general discrepancy inequalities and logarithmic potential theory are supplied by existing owners.

The principal reference is Calegari–Dimitrov–Tang, *The unbounded denominators conjecture*, JAMS 38 (2025), 627–702, abbreviated CDT25. Locators below use the published pagination. The qualitative denominator theorem also has a public source in Bilu–Borichev, *Remarks on Eisenstein*, arXiv:1112.2290v2, abbreviated BB11. All statements and proof sketches below are in our own words.

## Conventions and the exported result

Use the native rings ℚ[[x]], ℤ[[t]] and the Laurent-series field ℚ((x)). A rational function regular at zero is identified with its Taylor germ; arbitrary rational scalar multipliers live in the Laurent-series field. The arithmetic coordinate is χ(t)=t+O(t²) with rational coefficients. It is independent of the complex analytic map φ. In particular, integrality of p(χ(t)) does not imply integrality of χ.

The parameter circle has normalized Haar mass one. Write

- λ=|φ′(0)|, with the strict hypothesis λ>1;
- log⁺|g|=log(max(1,|g|)), including the value 0 at g=0;
- J(g)=∫_𝕋 log⁺|g| dμ_Haar;
- Uniformizes(φ,f,g) for the germ relation of AA.0, which retains the Taylor coefficient convention F⁽ⁿ⁾(0)/n!.

A function holomorphic near a closed disc is defined on an open neighbourhood of that entire disc. An initial realization of a formal series need only be a germ at zero. The expression g=φ*f means analytic continuation of that germ; it never requires that the original Taylor series converge at every value φ(z).

The main theorem states that a ℚ(p)-independent family f₁,…,f_m with integral χ-pullbacks and a common analytic uniformization satisfies

> m ≤ e J(p∘φ)/log λ.

The denominator clearing, construction and limiting argument are specified below. A fixed bound for every finite list of powers forces algebraicity. The three analytic routes give the same constant and normalizations: a normalized quotient multiplier, successive Jensen averaging, and Vandermonde damping away from Haar. Each is a target; proving one does not erase the other routed targets.

## Scalar fields and source corrections

There are two different holonomic spaces. H is the arithmetic ring of AA.4. Inside ℚ((x)) put

> W=span over ℚ(p) of H, and V=span over ℚ(x) of H.

The proof controls W directly. After finite rank, W and V are fields and V=ℚ(x)W. Therefore

> dim over ℚ(p) of W ≤ B; dim over ℚ(x) of V ≤ B; dim over ℚ(p) of V ≤ [ℚ(x):ℚ(p)] B,

where B=eJ(p∘φ)/log λ. When χ is integral, x belongs to H, W contains ℚ(x), and W=V, so the sharper bound for V over ℚ(p) follows. This includes χ=t and preserves the source's original qualitative finiteness statement.

**Finding E1, independently confirmed.** CDT25 Definition 2.0.4 defines V using ℚ(x), but its Corollary 2.0.5, (2.0.7), bounds V over ℚ(p) for a general rational χ. Take p=x+x⁴/32, χ its tangent inverse, U=ℂ and φ=2z. The hypotheses hold, and V contains ℚ(x), of degree 4 over ℚ(p). On the parameter circle |p(2z)|≤5/2, so the proposed bound is at most e log(5/2)/log2<4. The corrected W statement and the degree-factor V comparison above are the exported interfaces. A consumer must identify its scalar span before invoking a rank bound. This finding does not refute the main analytic theorem or establish a failure of the paper's modular application.

**Finding E2, independently confirmed.** The arbitrary-compact formula (2.5.28), p.649, fails even when χ=t and p=x, so this is independent of E1. Take K=closedDisk(1/2,1/4), U=ℂ and φ(z)=8z exp(−20z). Then cap(K)=1/4 and the proposed denominator is log2>0. On K, |φ(z)|≤6e⁻⁵<1, so its entire positive-log integral is zero, although the rank is at least 1. The valid centred-circle/disc case is obtained by rescaling. A source-supported arbitrary-compact replacement remains G1; the false formula is not a promised theorem.

The supplier `ConformalMappingPartII:L0/quotient-representation` already incorporates the extraction's E15–E16 corrections: a missing unimodular reconstruction constant and a missing logarithm on a supremum. We use that corrected interface. Circular discrepancy relative to nonatomic Haar is weakly continuous even at atomic limit measures; AA.3 includes the finite-mesh proof.

## Existing inputs and ownership

The Mathlib pin is `082e2d37e8b0463410cdb532e111cd43d5a66174`; the Tau Ceti pin is `f790474821cf4256814db967cb154e7af3d0c369`. Each baseline declaration below was read at that pin. The current read-only TauCetiRoadmap checkout and current Tau Ceti library were also inspected, including the nine roadmaps newer than the atlas snapshot. They were never built or edited. No existing arithmetic algebraization implementation was located.

| Supplier | Exact interface consumed here |
| --- | --- |
| `DiophantineApproximationAndTranscendence:DT.5/d-finite-power-series` | D-finiteness, finite derivative spans and ring closure; we add the arithmetic and full-meromorphic-basis condition. |
| `ConformalMappingPartII:O0/initial-value-basis`, `/path-continuation`, `/global-solution-dimension` | Complex analytic linear ODE existence, uniqueness and continuation. |
| `ConformalMappingPartII:O0/meromorphic-basis-monodromy`, `/simultaneous-pole-clearing` | Full meromorphic local bases and rational simultaneous pole clearing, allowing a non-Galois-saturated finite input set. |
| `ConformalMappingPartII:U0/conformal-radius` | Radius of a connected hyperbolic pointed domain; the explicit disc-map hypothesis handles the other domains. |
| `ConformalMappingPartII:L0/quotient-representation` | For every ε>0, normalized multiplier h with logarithmic supremum at most J(g)+ε. |
| `ProbabilisticAndMetricNumberTheory:PM.2/star-discrepancy`, `/koksma`, `/erdos-turan` | The interval theory; AA.3 only changes circular coordinates and proves its specialized arithmetic determinant estimates. |
| `LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.0/energy`, `LP.1/capacity`, `/equilibrium`, `/diameter-capacity` | General extended energy, capacity and equilibrium theory. AA.3 specializes to the circle and AA.5 applies it arithmetically. |

Supplier acceptance means that the exact planned interface can be cited. It does not discharge the supplier's own gaps or claim its formal implementation. No new requests to those owners are necessary. The extraction’s routed downstream `NoncongruenceModularForms` direction must use the corrected W interface, or verify integral χ before using the sharper V statement. Its modular curves and forms are outside this roadmap's ownership.

## Building order and checks

AA.0 establishes arithmetic coordinates and germs. AA.1 constructs a nonzero auxiliary function with many vanishing coefficients and small integral coefficients. AA.2 exports the main mean rank theorem and algebraicity, together with the Jensen proof. AA.3 supplies a second branch from AA.1, rejoining at that same theorem through discrepancy damping. AA.4 applies the bound to holonomic generators after common rational pole clearing. AA.5 rescales the correct bound and isolates the false arbitrary-compact extension.

In all asymptotic statements first let the auxiliary order α tend to infinity with d and κ fixed, then d tend to infinity, then κ tend to zero. In the damping route ε tends to zero last. The auxiliary lemma is stated on a cofinal range d≥d₁(κ), on which the Siegel constant is independent of d and κ. For a fixed inverse-chart circle of radius r, the matrix bound includes the term dD log(max(1,sup|p|)); the stated dimension range bounds dD/α uniformly. This is sufficient for the successive limits and makes that uniformity check explicit. Fixed-family boundary norms enter the term negligible after division by α; they must not become a d-dependent main constant.

The blueprint is a complete target-level planning pass: AA.0–AA.4 are closed relative to their supplier interfaces; AA.5 is planned with G1 remaining. Every node has implementation status unchecked. The suggested Lean file contains only the compact subset expressible directly at the pins: arithmetic lattice predicates, the analytic germ relation, circle averaging and discrepancy, the principal rank/algebraicity milestones and elementary counterexample data. The full holonomic and capacity targets, their APIs and their tests are specified here because their imported theory interfaces are not native carriers at the pins. This follows the binding roadmap shape; those interfaces are not replaced by empty abstract predicates.


## AA.0 — Arithmetic germs and uniform denominators

**Inputs.** The pinned power-series and algebraic-integrality baseline.

### Integral coefficient lattices

**Target `AA.0/integral-scale` (definition).** For f=Σ a_n x^n in ℚ[[x]] and an integer M>0, write IntegralAtScale(M,f) when M^n a_n is an integer for every n≥0, equivalently f(Mx) lies in the image of ℤ[[x]] in ℚ[[x]]. IntegralSeries(f) means IntegralAtScale(1,f). For a field embedded in ℂ the same convention uses algebraic integers in place of rational integers. The tangent lattice for χ=t+Σ_{n≥2}a_n t^n is the stronger requirement M^(n−1)a_n∈ℤ for n≥2, equivalently χ(Mt)/M∈t+t²ℤ[[t]].

**Dependencies.** `mathlib:PowerSeries.coeff`, `mathlib:PowerSeries.coeff_rescale`.

**Uses that determine the interface.**

- CDT25 Lemma 2.1.2, pp.637–638: Clears the integer matrix of Taylor constraints before applying Siegel’s lemma.

- AA.0/inverse-denominators: Distinguishes stable inverse-coordinate denominators from the weaker scaled-series condition.

**Proof or construction.**

1. Use the existing coefficientwise map and rescale operation; the lattice is their preimage, not a competing series type.

2. Identify the tangent condition by dividing the rescaled series by the nonzero integer M.

**API targets.**

- `TauCeti.ArithmeticAlgebraization.IntegralAtScale.coeff` (characterisation): Membership is equivalent to integrality of every M^n coefficient.

- `TauCeti.ArithmeticAlgebraization.IntegralAtScale.rescale` (compatibility): Membership is equivalent to the native rescale M being in the coefficientwise image of integral power series.

- `TauCeti.ArithmeticAlgebraization.IntegralAtScale.ring` (structure): At fixed M the series form a subring; at M=1 it is the image of the native integral-series ring.

- `TauCeti.ArithmeticAlgebraization.IntegralAtScale.enlarge` (functoriality): If M divides N and both are positive, membership at M implies membership at N.

- `TauCeti.ArithmeticAlgebraization.IntegralAtScale.constant` (simp): A constant belongs exactly when its value is integral, independently of M.

- `TauCeti.ArithmeticAlgebraization.IntegralAtScale.tangent` (characterisation): For a tangent-to-identity series, χ(Mt)/M is integral exactly when M^(n−1)coeff_nχ is integral for all n≥2.

**Unit tests.**

- `TauCeti.ArithmeticAlgebraization.IntegralAtScale.geometricHalf` (example): Σ(x/2)^n belongs at scale 2 and fails at scale 1.

- `TauCeti.ArithmeticAlgebraization.IntegralAtScale.halfConstant` (counterexample): The constant series 1/2 belongs at no positive integral scale.

- `TauCeti.ArithmeticAlgebraization.IntegralAtScale.zero` (degenerate): Zero belongs at every positive scale.

- `TauCeti.ArithmeticAlgebraization.IntegralAtScale.tangentDifference` (counterexample): χ=t+t²/4 belongs at ordinary scale 2, but fails the tangent lattice at M=2; M=4 satisfies the latter.

**Checks.** Variable scaling never changes the constant coefficient. The normalized inverse lemma needs the stronger tangent lattice, not just the ordinary scaled lattice.

**Source.** CDT25, §2.1, proof of Lemma 2.1.2, pp.637–638.

**Planet.** Integral power series.

### Simultaneous analytic uniformization of formal series

**Target `AA.0/uniformized-germs` (definition).** For a formal f∈ℚ[[x]], a holomorphic φ near the closed unit disc with φ(0)=0 and φ′(0)≠0, and a holomorphic g near that disc, Uniformizes(φ,f,g) means that there is a holomorphic germ F at x=0 whose Taylor coefficients are those of f and g=F∘φ as germs at z=0. The Taylor coefficient convention is F^(n)(0)/n!. It does not mean that the original series for f converges at every φ(z). A family is simultaneously uniformized by a single φ when each member has such a g. Write J(g)=∫_𝕋 log(max(1,|g|)) dμ, with Haar mass one.

**Dependencies.** `mathlib:PowerSeries.coeff`, `mathlib:PowerSeries.substAlgHom`.

**Uses that determine the interface.**

- CDT25 Theorem 2.0.1: Connects arithmetic formal substitutions to the independently supplied analytic uniformization.

- CDT25 §§2.2,2.4,2.5: Makes the auxiliary finite sums holomorphic on a closed polydisc without assuming convergence of f at every point of φ’s image.

**Proof or construction.**

1. Use analytic germs at zero and Taylor uniqueness; φ′(0)≠0 gives a local inverse and preserves the formal information.

2. The uniformized functions live near the closed disc, while the initial realization F only lives near zero.

3. Use log(max(1,r)) to make the positive logarithm continuous even at g=0.

**API targets.**

- `TauCeti.ArithmeticAlgebraization.Uniformizes.taylor` (projection): The germ F has nth coefficient F^(n)(0)/n!, including n=0.

- `TauCeti.ArithmeticAlgebraization.Uniformizes.germUnique` (extensionality): The analytic realization F is unique as a germ; two uniformized g agree on the connected disc if their germs agree.

- `TauCeti.ArithmeticAlgebraization.Uniformizes.ring` (structure): The uniformized realizations of 0,1,f+h and fh are 0,1,g_f+g_h and g_fg_h.

- `TauCeti.ArithmeticAlgebraization.Uniformizes.shrink` (functoriality): For 0<r≤1, replacing φ(z) by φ(rz) and g by g(rz) preserves the closed-unit-disc relation; the new derivative is rφ′(0). More general radii require holomorphicity on the corresponding larger disc.

- `TauCeti.ArithmeticAlgebraization.Uniformizes.formalSubstitution` (compatibility): Its Taylor expansion is native substitution of the Taylor series of φ into f; φ(0)=0 is the substitution hypothesis.

- `TauCeti.ArithmeticAlgebraization.Uniformizes.inverseRadius` (relation): A finite simultaneous family has a common positive radius of convergence in x, obtained from an inverse chart for φ.

- `TauCeti.ArithmeticAlgebraization.positiveLogMean.constant` (simp): J(constant c)=log(max(1,|c|)), and J(0)=0.

**Unit tests.**

- `TauCeti.ArithmeticAlgebraization.Uniformizes.linear` (example): For φ(z)=2z, f=x and g(z)=2z, the relation holds and J(g)=log2.

- `TauCeti.ArithmeticAlgebraization.Uniformizes.algebraicBranch` (example): For m≥2, f=(1−m²x)^(1/m) as its branch with constant 1 and φ(z)=(1−exp(Mz))/m², g(z)=exp(Mz/m) realizes the same germ.

- `TauCeti.ArithmeticAlgebraization.Uniformizes.wrongBranch` (counterexample): For f with constant coefficient 1, the negative analytic square-root branch with value −1 at zero does not realize f.

- `TauCeti.ArithmeticAlgebraization.Uniformizes.noGlobalSeriesEvaluation` (counterexample): For f=1/(1−x), analytic continuation is interpreted as a germ identity; a map φ hitting the actual pole 1 cannot have a holomorphic uniformized realization on the closed disc.

**Checks.** Specify neighbourhoods of the closed disc, rather than just the open disc, in every finite-radius estimate. For the open-disc André criterion, obtain closed-disc hypotheses by shrinking the parameter disc.

**Source.** CDT25, §1.1.1, pp.630–631; Theorem 2.0.1, p.635; (2.1.1), p.637.

**Planet.** Simultaneous analytic uniformization.

### Integral series beyond the unit radius are polynomials

**Target `AA.0/integral-radius-polynomial` (theorem).** If f=Σ a_n x^n∈ℤ[[x]] has a complex analytic realization on a disc of radius R>1, then a_n=0 for all sufficiently large n; thus f is the image of an integer polynomial.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.0/integral-scale`, `DiophantineApproximationAndTranscendencePartII:AA.0/uniformized-germs`, `mathlib:Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le`.

**Proof or construction.**

1. Choose 1<r<R and bound the analytic realization on the compact circle of radius r.

2. Cauchy’s coefficient estimate gives |a_n|≤Cr^(−n), eventually less than 1.

3. An integer of absolute value less than 1 vanishes. This is a one-variable Cauchy consequence, not an extra algebraization hypothesis.

**Checks.** The geometric series 1/(1−x) at radius exactly 1 prevents a non-strict radius statement. Polynomials satisfy the conclusion at every finite radius.

**Source.** CDT25, Lemma 1.1.2, p.629.

**Planet.** Integral radius criterion.

### Eisenstein denominators for algebraic series

**Target `AA.0/eisenstein` (theorem).** Let y(u)=Σ a_nu^n∈ℚ̄[[u]] be algebraic over ℚ̄(u). There exist positive rational integers c,M such that c M^n a_n is an algebraic integer for every n≥0. If a_0 is an algebraic integer, some positive M′ alone suffices: (M′)^n a_n is integral for every n. The same statement applies to a nonnegative Puiseux series after putting u=x^(1/N), N>0. No variable-only claim is made for a nonintegral constant term.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.0/integral-scale`, `mathlib:IsAlgebraic.exists_integral_multiple`.

**Proof or construction.**

1. Use the elementary tail-series route described in BB11 §1, p.1, rather than planning its stronger effective p-adic estimates. Choose a square-free annihilator P(x,y) over a number field. Since P_y(x,f) is nonzero, let s be its finite order and choose N>s. Write f=b(x)+x^N g with b the truncation below N.

2. The polynomial Q(x,Y)=x^(−N−s)P(x,b(x)+x^N Y) has coefficients in a finite extension containing the finitely many coefficients of b, and Q(0,Y)=aY+b₀ with a≠0. Indeed the constant term is divisible by x^(N+s) because P(x,f)=0, the linear term has exactly that order, and each higher term has order at least 2N>N+s. Include g(0) in that finite extension. After Y=g(0)+u and division by a the equation is u+xR(x,u)=0 for a polynomial R with algebraic coefficients.

3. Choose a positive integer M clearing the finitely many algebraic coefficients of R and all nonconstant coefficients in b and g(0), using the native integral-multiple theorem. The equation for u(Mt) is u(Mt)=−Mt R(Mt,u(Mt)). Its nth coefficient is an integral polynomial in earlier coefficients, so induction shows u(Mt) has algebraic-integer coefficients. Thus all positive-degree coefficients of f(Mt) are integral after enlarging M if necessary. The same recurrence also places every coefficient in the chosen finite extension.

4. Choose c to clear the remaining constant coefficient. Equivalently, if a first argument gives cM^n a_n integral, an integral a_0 permits replacing M by cM since (cM)^n a_n=c^(n−1)(cM^n a_n) for n≥1. Apply the identical univariate argument after putting u=x^(1/N) for the Puiseux variant.

**Checks.** y=1/2 requires the scalar c; no change of variable alters its constant term. The branch of an inverse rational function used below has zero constant term, so variable-only scaling applies. This node requires no quantitative BB11 height bound or p-adic convergence constant.

**Source.** BB11, §1, p.1 (qualitative theorem and Heine tail-series route); Theorem 6.1, pp.10–11; opening of §8, p.14; application CDT25, p.637.

**Planet.** Eisenstein’s theorem.

### Uniform denominators of a normalized inverse coordinate

**Target `AA.0/inverse-denominators` (theorem).** Let p∈ℚ(x) be nonconstant and regular at zero, and χ(t)∈t+t²ℚ[[t]] satisfy p(χ(t))∈ℤ[[t]]. There is a positive integer M depending only on p such that χ(Mt)/M∈t+t²ℤ[[t]]. Its formal inverse τ has τ(Mx)/M∈x+x²ℤ[[x]]. Consequently, f(χ(t))∈ℤ[[t]] implies f(Mx)∈ℤ[[x]]. One may bound M in terms of the degree and rational coefficient height of p; it is independent of f and of the auxiliary dimension.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.0/eisenstein`, `mathlib:PowerSeries.substAlgHom`, `DiophantineApproximationAndTranscendencePartII:AA.0/integral-scale`.

**Proof or construction.**

1. Write b(p(x)−p(0))/c=x^N+O(x^(N+1)), N>0, with b a nonzero integer and c>0 integral. The normalized inverse Puiseux branch has constant zero. Apply Eisenstein and absorb its scalar.

2. Apply the coefficient estimate (1+u)^(1/N)∈ℤ[[u/N²]] to the normalized Nth root of the integral pullback. The branch with leading term t is selected by χ′(0)=1. The proof on pp.637–638 supplies M=c²N⁴M₁².

3. The rescaled series χ(Mt)/M=t+O(t²) has integral coefficients; recursive formal inversion over ℤ has integral coefficients. Rescale back to obtain the identical tangent lattice for τ.

4. Compose the integral series f∘χ with τ(Mx), which has integral coefficients and zero constant. For uniform dependence on degree and height, the displayed algebraic construction depends only on p; finitely many rational coefficient lists of bounded degree and height also give a uniform bound.

**Checks.** For p=x, the hypotheses already force χ integral, so M=1 works. For p=x+x⁴/32, its tangent inverse satisfies p∘χ=t but χ is not integral: its fourth coefficient is −1/32. Thus integrality of p∘χ must not be confused with integrality of χ. Both zero constant term and linear coefficient 1 are used to preserve the lowest integral jet.

**Source.** CDT25, Proof of Lemma 2.1.2, pp.637–638.

**Planet.** Inverse-series denominator bound.

**Layer status.** closed. No remaining target-level proof obligations beyond the cited supplier interfaces and the implementation work described by this plan.

## AA.1 — Auxiliary functions and the multiplier bound

**Inputs.** `DiophantineApproximationAndTranscendencePartII:AA.0`

### Independence in separate formal variables

**Target `AA.1/tensor-independence` (lemma).** Let p∈ℚ(x) be nonconstant and regular at zero. If f₁,…,f_m∈ℚ[[x]] are linearly independent over ℚ(p(x)), then for every d,D≥1 the (mD)^d series ∏_{s=1}^d p(x_s)^(k_s) f_(i_s)(x_s), with 1≤i_s≤m and 0≤k_s<D, are linearly independent over ℚ in ℚ[[x₁,…,x_d]]. In particular any nonzero coefficient vector gives a nonzero auxiliary function.

**Dependencies.** `mathlib:PowerSeries.coeff`.

**Proof or construction.**

1. In one variable, group the powers of p into polynomial coefficients of the f_i. Nonconstancy of p makes powers of p independent over ℚ.

2. For a finite independent family of coefficient sequences choose finitely many coefficient functionals giving an injective map to a finite-dimensional rational space.

3. In d separate variables the corresponding coefficient matrix is a tensor product of injective matrices. Its column independence proves the claim without evaluating an arbitrary formal series at a nonzero rational point.

**Checks.** For f₁=1 the assertion is the independence of separate-variable powers of a nonconstant p. The hypothesis is over ℚ(p), not merely over ℚ; the pair 1,p is a counterexample to the weaker premise.

**Source.** CDT25, Proof of Lemma 2.1.2, p.638.

### Multivariable auxiliary function with small coefficients

**Target `AA.1/auxiliary-function` (theorem).** Assume the arithmetic and analytic data of Theorem 2.0.1: nonconstant p∈ℚ(x) regular at 0; χ=t+O(t²) rational; integral p∘χ and f_i∘χ; a common uniformization φ with φ(0)=0, λ=|φ′(0)|>1, and holomorphic realizations of p and f_i near the closed unit disc; the f_i are ℚ(p)-independent, m≥1. There is C≥0 depending only on p and a fixed inverse-chart radius for φ, independent of d and κ, such that for each 0<κ<1 there is d₁(κ)≥1 and, for every fixed d≥d₁(κ), for all sufficiently large α there are D≥1 and integers a_(i,k), not all zero, for which F=Σ_(i,k) a_(i,k)∏_s p(x_s)^(k_s) f_(i_s)(x_s) is nonzero, has total vanishing order at least α, and satisfies limsup_(α→∞) D/α≤(1+1/κ)^(1/d)/(m(d!)^(1/d)) and limsup_(α→∞) (log max(1,max|a_(i,k)|))/α≤κC. The sums run over i∈{1,…,m}^d and k∈{0,…,D−1}^d.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.0/inverse-denominators`, `DiophantineApproximationAndTranscendencePartII:AA.0/uniformized-germs`, `DiophantineApproximationAndTranscendencePartII:AA.1/tensor-independence`, `mathlib:Int.Matrix.exists_ne_zero_int_vec_norm_le`, `mathlib:Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le`.

**Proof or construction.**

1. The local inverse chart for φ gives a common convergence disc of radius ρ>0 for the finitely many f_i; choose a smaller closed circle and Cauchy bounds. Inverse-coordinate denominators give M independent of this family.

2. Vanishing of all coefficients of total degree below α gives binomial(α+d−1,d) rational linear equations. Clear them using the common M. On a fixed small inverse-chart circle |x|=r≤1 put P₀=max(1,sup|p|). The integer matrix entries are bounded by exp(α log(M/r)+dD log P₀+o(α)); the fixed family norms and the number of summands contribute o(α) for fixed d. The degree ratio below satisfies dD/α≤e²+o(1) once d≥log(1+1/κ), by d/(d!)^(1/d)≤e. Thus a constant C independent of d,κ controls the matrix on this cofinal dimension range. The factorial bound follows by comparing Σ log j with the integral of log; it is a small step, not an imported new theorem.

3. Choose D just above the threshold with (mD)^d / binomial(α+d−1,d) tending to 1+1/κ; the row-to-surplus ratio tends to κ. The pinned integral Siegel lemma gives the claimed height estimate. If zero rows occur, discard them or use a coordinate vector.

4. Apply tensor independence to its nonzero kernel vector. Rounding D affects only the o(α) term. All limsups are taken with the remaining parameters fixed.

**Checks.** The number of constraints is total-degree growth α^d/d!, not a box of α^d constraints. C must remain independent of d and κ; otherwise the limiting extrapolation does not prove the stated universal constant. Do not interchange the limits α→∞, d→∞, κ→0. This cofinal-dimension version of Lemma 2.1.2 is what the plan uses: d≥d₁(κ) makes the uniform constant explicit without claiming a uniform small-κ estimate at every fixed small d.

**Source.** CDT25, Lemma 2.1.2 and proof, pp.637–638.

**Planet.** Auxiliary function lemma.

### Integrality of the lowest nonzero jet

**Target `AA.1/integral-lowest-jet` (theorem).** Let F∈ℚ[[x₁,…,x_d]] be nonzero with exact total order β and F(χ(t₁),…,χ(t_d)) integral, where χ=t+O(t²). Its homogeneous degree-β part has integer coefficients. After x_j=φ(z_j), where φ(0)=0 and φ′(0)=a≠0, this part is multiplied by a^β. Multiplication by ∏h(z_j)^D with h(0)=1 leaves this lowest homogeneous part unchanged. Thus some nonzero coefficient of the resulting series has absolute value at least |a|^β.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.0/integral-scale`, `mathlib:PowerSeries.substAlgHom`.

**Proof or construction.**

1. The degree-preserving part of a tangent-to-identity substitution is the identity. All higher substituted terms have larger total degree.

2. The degree-preserving part of φ is scalar multiplication by a in each variable. A monomial of total degree β therefore acquires a^β.

3. Choose a nonzero integer coefficient of the homogeneous part. A factor with constant term 1 cannot change that part.

**Checks.** The coefficient multiplier is a^β, with β the order of F, not the degree of an arbitrary auxiliary polynomial. If χ′(0) is merely nonzero, an extra rational scale appears and the integral lower bound must be changed.

**Source.** CDT25, §2.2, (2.2.1)–(2.2.3), pp.638–639.

**Planet.** Integral lowest jet.

### Cauchy extrapolation with a normalized multiplier

**Target `AA.1/cauchy-extrapolation` (lemma).** For the auxiliary functions above and h holomorphic near the closed unit disc with h(0)=1, put A=log(max(sup_𝕋|h|,sup_𝕋|hg|)), where g uniformizes p. Then A≥0, and for each fixed κ∈(0,1), d≥d₁(κ) in the auxiliary lemma and λ=|φ′(0)|>1, one has logλ≤[d/(m(d!)^(1/d))](1+1/κ)^(1/d) A+κC after taking α→∞. Supremum norms are finite; log of their maximum is the same as the maximum of the logarithmic suprema interpreted with log0=−∞.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.1/auxiliary-function`, `DiophantineApproximationAndTranscendencePartII:AA.1/integral-lowest-jet`, `mathlib:Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le`.

**Proof or construction.**

1. Form H(z)=∏h(z_j)^D F(φ(z₁),…,φ(z_d)), holomorphic near the closed unit polydisc. Cauchy’s coefficient formula bounds every coefficient by its boundary supremum.

2. Rewrite each factor h^D g^k as h^(D−k)(hg)^k. The product is bounded by exp(dDA), times the fixed f_i boundary norms.

3. The number of summands is (mD)^d with logarithm o(α); the fixed f_i norms contribute o(α). Compare the integral lower coefficient |a|^β, β≥α, to obtain αlogλ≤dDA+κCα+o(α). Divide and pass to the first limit.

4. The maximum principle and h(0)=1 imply sup|h|≥1, so A≥0 and no logarithm of a nonpositive bound is used.

**Checks.** For g=h=1, A=0, not 1. The estimate uses holomorphicity near a compact polydisc and no probabilistic independence assumption.

**Source.** CDT25, §2.2, (2.2.1)–(2.2.3) and the estimates following them, pp.638–639.

### Arithmetic rank bound with a holomorphic multiplier

**Target `AA.1/multiplier-bound` (theorem).** Under the full arithmetic and analytic hypotheses of AA.1/auxiliary-function, every holomorphic h near the closed unit disc with h(0)=1 satisfies m≤e A/logλ, with A=log(max(sup_𝕋|h|,sup_𝕋|hg|)) and λ=|φ′(0)|>1. Equivalently A=max(sup log|h|,sup log|hg|).

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.1/cauchy-extrapolation`, `mathlib:Stirling.factorial_isEquivalent_stirling`.

**Proof or construction.**

1. For fixed κ, let d→∞ in the Cauchy extrapolation inequality: d/(d!)^(1/d)→e and (1+1/κ)^(1/d)→1.

2. Then let κ decrease to zero, using the independence of C from d and κ. Rearrange using logλ>0.

3. Use the same bound for arbitrary finite families of powers to obtain algebraicity, as detailed in AA.2/algebraicity.

**Checks.** Use log(max of sup norms) or logarithmic suprema; replacing A by a supremum norm changes the theorem. The statement does not require h to have no zeros.

**Source.** CDT25, Lemma 2.0.8, p.636; proof §2.2, pp.638–639.

**Planet.** Holomorphic multiplier bound.

**Layer status.** closed. No remaining target-level proof obligations beyond the cited supplier interfaces and the implementation work described by this plan.

## AA.2 — Integrated growth and algebraicity

**Inputs.** `ConformalMappingPartII:L0`, `DiophantineApproximationAndTranscendencePartII:AA.0`, `DiophantineApproximationAndTranscendencePartII:AA.1`

### Integrated arithmetic rank bound

**Target `AA.2/mean-rank-bound` (theorem).** Let p∈ℚ(x)\ℚ be regular at 0; χ∈t+t²ℚ[[t]] with p∘χ∈ℤ[[t]]; φ holomorphic on a neighbourhood of the closed unit disc with φ(0)=0, λ=|φ′(0)|>1, and g the holomorphic uniformization of p there. For any m≥1, let f₁,…,f_m∈ℚ[[x]] be ℚ(p)-linearly independent, with f_i∘χ integral and holomorphic uniformized realizations on the same neighbourhood. Then m≤e J(g)/logλ, where J(g)=∫_𝕋 log(max(1,|g|)) dμ_Haar.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.0/uniformized-germs`, `DiophantineApproximationAndTranscendencePartII:AA.1/multiplier-bound`, `ConformalMappingPartII:L0/quotient-representation`.

**Proof or construction.**

1. For every ε>0 import the corrected Nevanlinna quotient representation: a holomorphic h with h(0)=1 has max(sup log|h|,sup log|hg|)≤J(g)+ε.

2. Apply the multiplier bound and let ε decrease to zero. The source’s missing constant phase in reconstruction has no effect on the norm estimates; its supremum must be logarithmic.

3. All arithmetic inputs are unchanged by the choice of h. This proof only imports the quotient theorem, not the rest of punctured-plane uniformization.

**Checks.** For p=x, χ=t and φ=Rz with R>1, J=logR and the bound is m≤e. The growth term is a mean of log⁺, not the maximum of |p∘φ| and not an unnormalized arc-length integral.

**Source.** CDT25, Theorem 2.0.1 and (2.0.3), p.635; §2.3, Lemma 2.3.1, pp.640–641.

**Planet.** Arithmetic holonomicity theorem.

### Algebraicity from a uniform bound on powers

**Target `AA.2/algebraicity` (theorem).** Under the scalar hypotheses on p,χ,φ of AA.2/mean-rank-bound, every f∈ℚ[[x]] with f∘χ integral and a holomorphic uniformization by φ is algebraic over ℚ(x). In fact f is algebraic over ℚ(p(x)). The conclusion does not assert that f is rational or that its analytic continuation is single-valued on the x-plane.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.2/mean-rank-bound`, `DiophantineApproximationAndTranscendencePartII:AA.0/uniformized-germs`.

**Proof or construction.**

1. If f were transcendental over ℚ(p), every finite list 1,f,…,f^(m−1) would be independent over ℚ(p).

2. All powers retain the integral pullback and their analytic uniformizations are the corresponding powers of g. The right side of the mean rank bound depends only on p,χ,φ, hence is fixed as m increases. Contradict its bound for a sufficiently large m.

3. Since ℚ(p)⊂ℚ(x) and x is algebraic over ℚ(p) for nonconstant rational p, the two algebraicity conclusions are compatible.

**Checks.** The binomial examples yield genuine nonrational algebraic series. Do not infer rationality from algebraicity of a rational-coefficient formal power series.

**Source.** CDT25, End of §2.2, p.639; algebraicity clause of Theorem 2.0.1, p.635.

**Planet.** Arithmetic algebraization.

### André’s open-disc algebraicity criterion

**Target `AA.2/andre-criterion` (theorem).** Let f∈ℤ[[x]]. Suppose φ is holomorphic on the open unit disc, φ(0)=0 and |φ′(0)|>1, and the formal pullback has a holomorphic realization on that disc in the germ sense of AA.0/uniformized-germs. Then f is algebraic over ℚ(x).

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.2/algebraicity`, `DiophantineApproximationAndTranscendencePartII:AA.0/uniformized-germs`.

**Proof or construction.**

1. Choose r<1 so close to 1 that r|φ′(0)|>1. The maps φ(rz) and the corresponding uniformized f are holomorphic on a neighbourhood of the closed unit disc.

2. Use p=x, χ=t; the integral pullback of p is t. Apply arithmetic algebraicity.

3. This proves the case needed here directly from CDT25 and requires no reading of André’s unavailable monograph.

**Checks.** For m≥2 the series (1−m²x)^(1/m) has integral coefficients: for n≥1 the binomial coefficient times m^(2n) is integral by its prime valuations. The map φ=(1−exp(Mz))/m² has derivative modulus M/m²>1 when M>m² and uniformization exp(Mz/m). Strictness is necessary even for the identity coordinate: −log(1−x)=Σx^n/n does not supply an integral test, whereas the lacunary integral series Σ_{k≥0}x^(2^k) is analytic on the unit disc and is not algebraic (its singularities at dyadic roots of unity are dense). It has φ(z)=z with derivative 1. The numerical derivative threshold is not the radius of convergence of f in x; simultaneous uniformization can cross the original convergence circle. CDT25 (1.1.4)–(1.1.5), p.631, supplies the named boundary benchmark F(x)=Σ binomial(2n,n)²x^n: it is integral and transcendental, while φ(q)=λ(q)/16 has φ′(0)=1 and F∘φ=(Σ_(n∈ℤ)q^(n²))² on |q|<1. Thus equality at the derivative threshold cannot imply algebraicity. These modular identity data are source benchmark inputs, not a second development of modular functions here.

**Source.** CDT25, §1.1.1, pp.630–631 (case of André Théorème 5.4.3); derived from Theorem 2.0.1.

**Planet.** André’s algebraicity criterion.

### A logarithmic estimate for the first lexicographic coefficient

**Target `AA.2/lexicographic-coefficient` (theorem).** For d≥1 let G be nonzero and holomorphic on a neighbourhood of the closed unit polydisc. Let c z₁^(n₁)⋯z_d^(n_d), c≠0, be the lexicographically least monomial of its Taylor support, in the coordinate order z₁,…,z_d. Then log|G| is integrable on the unit polycircle after arbitrary finite values on its zero set, that zero set is Haar-null, and log|c|≤∫_(𝕋^d) log|G| dμ. This least monomial need not have the least total degree.

**Dependencies.** `mathlib:AnalyticOnNhd.circleAverage_log_norm`.

**Proof or construction.**

1. For d=1 factor out the exact zero order and apply Jensen to the remaining function with nonzero central value. Its isolated circle zeros are integrable logarithmic singularities.

2. For d>1 factor z₁^(n₁), and put H(0,z′) equal to the first nonzero coefficient function. Apply the one-variable Jensen inequality to almost every slice; exceptional slices on which it vanishes identically are contained in the zero set of that nonzero coefficient function.

3. Apply induction to H(0,z′). For Fubini, first use the uniform upper bound log|G|≤log sup|G| and the integrable lower bound coming from the coefficient function. This controls the negative part and justifies the iterated integral; do not assign a genuine −∞ singularity the value zero on a positive-measure set.

4. Integrate the slice inequalities. The logarithm can use the native totalized value at zeros only after their Haar-nullness has been proved.

**Checks.** For G=c z^n the inequality is equality. For G=z₂^100+z₁, the least lexicographic monomial is z₂^100 while the least total degree is 1; the proof must not confuse them.

**Source.** CDT25, Lemma 2.4.2, (2.4.3)–(2.4.5), p.642.

**Planet.** Lexicographic coefficient inequality.

### The integrated bound through logarithmic averaging

**Target `AA.2/plurisubharmonic-proof` (comparison).** The auxiliary function of AA.1 also proves the identical mean rank bound m≤eJ(g)/logλ by the lexicographic coefficient inequality, without using a quotient multiplier or the discrepancy route.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.1/auxiliary-function`, `DiophantineApproximationAndTranscendencePartII:AA.2/lexicographic-coefficient`, `mathlib:Stirling.factorial_isEquivalent_stirling`.

**Proof or construction.**

1. Separate-variable tangent substitutions preserve the least lexicographic exponent vector and its coefficient; coordinatewise higher terms cannot create a smaller vector. Hence the least coefficient after φ is a^β times a nonzero integer, β≥α.

2. The pointwise triangle inequality gives log|F(φ(z))|≤DΣ_j log⁺|g(z_j)|+κCα+o(α). Integrate and apply the lexicographic inequality to bound that coefficient above.

3. Compare αlogλ≤dDJ(g)+κCα+o(α). Pass through α→∞, d→∞ and κ→0 in that order. This recovers the same theorem with an independent analytic interior.

**Checks.** Both proof routes have the same arithmetic data and the same factor e. The lexicographically least exponent may have total degree larger than the order of F; β≥α is all the lower bound needs.

**Source.** CDT25, §2.4.6, (2.4.7)–(2.4.10), pp.642–643.

**Layer status.** closed. No remaining target-level proof obligations beyond the cited supplier interfaces and the implementation work described by this plan.

## AA.3 — Circle discrepancy and Vandermonde damping

**Inputs.** `DiophantineApproximationAndTranscendencePartII:AA.1`, `LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.0`, `LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1`, `ProbabilisticAndMetricNumberTheory:PM.2`

### Circular box discrepancy

**Target `AA.3/circle-discrepancy` (definition).** For d≥1 and an indexed tuple z₁,…,z_d on 𝕋, define D_circ(z)=sup_(a∈ℝ,0≤ℓ≤1)|d^(−1)#{j:z_j∈I(a,ℓ)}−ℓ|, where I(a,ℓ)={exp(2πit): frac(t−a)∈[0,ℓ)}; I(a,0) is empty and I(a,1)=𝕋. Points are counted with multiplicity. Equivalently take the supremum over cuts a of the existing star discrepancy of the rotated arguments frac(arg(z_j)/(2π)−a). On a Borel probability ν on 𝕋 use the same arc formula with ν(I) in place of the empirical frequency. This is an adapter to the owner’s star discrepancy, not a second general discrepancy library.

**Dependencies.** `ProbabilisticAndMetricNumberTheory:PM.2/star-discrepancy`, `tauceti:TauCeti.Probability.empiricalMeasureOfFintype`.

**Uses that determine the interface.**

- CDT25 Lemma 2.5.9: Distinguishes tuples whose empirical measures stay away from Haar.

- CDT25 (2.5.15)–(2.5.20): Splits the analytic bound into well-distributed and damped regions.

**Proof or construction.**

1. Use the native unit circle or its additive angle coordinate, with their standard exponential identification. Every proper half-open circular arc is one initial interval after a rotation of the cut.

2. Define the supremum from empirical frequencies or from the supremum of rotated star discrepancies, and prove the two agree. Arc length ℓ is normalized Haar mass.

3. Keep d>0 for a tuple; the owner’s empty-sample convention is not used in the damping theorem.

**API targets.**

- `TauCeti.ArithmeticAlgebraization.circleDiscrepancy.arcSup` (characterisation): The value is the supremum over the half-open arcs I(a,ℓ), with Haar mass ℓ.

- `TauCeti.ArithmeticAlgebraization.circleDiscrepancy.rotatedStar` (compatibility): It equals sup_a D*(frac(θ_j−a)); only the angle adapter is new.

- `TauCeti.ArithmeticAlgebraization.circleDiscrepancy.bounds` (relation): For d≥1, 1/d≤D_circ≤1; empirical equality to Haar is impossible.

- `TauCeti.ArithmeticAlgebraization.circleDiscrepancy.reindex` (functoriality): A permutation of the indices preserves the value, retaining all repeated points.

- `TauCeti.ArithmeticAlgebraization.circleDiscrepancy.rotation` (functoriality): Multiplication of every point by a common unit scalar preserves the value.

- `TauCeti.ArithmeticAlgebraization.circleDiscrepancy.replicate` (simp): Repeating every entry exactly r≥1 times leaves the discrepancy unchanged.

- `TauCeti.ArithmeticAlgebraization.circleDiscrepancy.empirical` (compatibility): The tuple value equals the measure version evaluated at the existing finite empirical probability measure.

- `TauCeti.ArithmeticAlgebraization.circleDiscrepancy.haar` (simp): The measure discrepancy of normalized Haar is zero, and zero discrepancy characterizes Haar.

**Unit tests.**

- `TauCeti.ArithmeticAlgebraization.circleDiscrepancy.onePoint` (example): A singleton has discrepancy 1.

- `TauCeti.ArithmeticAlgebraization.circleDiscrepancy.regularPolygon` (example): The dth roots of unity, once each, have discrepancy 1/d.

- `TauCeti.ArithmeticAlgebraization.circleDiscrepancy.repeatedPoint` (counterexample): Any number of identical points still has discrepancy 1, so replacing the indexed population by its set of distinct values is invalid.

- `TauCeti.ArithmeticAlgebraization.circleDiscrepancy.rotatedPair` (example): An antipodal pair has discrepancy 1/2, at every rotation.

**Checks.** The lower bound 1/d≤D_circ≤1 holds for nonempty d-tuples. Changing half-open endpoint convention leaves the supremum unchanged, although individual arc counts can change.

**Source.** CDT25, Definition 2.5.4, p.644; adaptation of the existing PM.2 star-discrepancy node.

**Planet.** Circular box discrepancy.

### Weak limits and circular discrepancy

**Target `AA.3/discrepancy-weak-limit` (lemma).** The measure discrepancy ν↦D_circ(ν) is continuous on Borel probability measures on 𝕋 for weak convergence. In particular, if empirical probabilities converge weakly to Haar, their circular discrepancies tend to zero; if their discrepancies are bounded below by ε>0, any weak limit differs from Haar.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.3/circle-discrepancy`, `mathlib:MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`, `mathlib:MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto`.

**Proof or construction.**

1. For a fixed limit measure ν choose a finite circular mesh with arbitrarily small Haar length between consecutive endpoints and with all endpoints outside the at most countably many atoms of ν.

2. Weak convergence gives convergence of the finitely many mesh-arc masses, since their boundaries are ν-null. This is the usual Portmanteau consequence of the native bounded-continuous-test characterization.

3. Enclose or inscribe any arc by mesh arcs. Monotonicity of every probability measure controls its mass, while the Haar error of enlarging each endpoint is at most the mesh length. Thus both discrepancies differ from the finite mesh maximum by a uniformly small error.

4. Pass first to the weak limit and then refine the mesh. This argument works even when the limit has atoms; it does not assert uniform convergence of all distribution functions.

**Checks.** Weak convergence of two nearby point masses to one point mass leaves discrepancy tending to 1. A regular d-gon’s empirical measures converge to Haar and its discrepancy 1/d tends to zero.

**Source.** CDT25, Proof of Lemma 2.5.9, p.646, the discrepancy passage; detailed finite-mesh justification.

### Koksma’s inequality on the circle

**Target `AA.3/circle-koksma` (theorem).** Let g:𝕋→ℝ have finite native variation V(g)=eVariationOn(t↦g(exp(2πit)),[0,1]) converted to a real number. For every nonempty d-tuple on 𝕋, |d^(−1)Σ_j g(z_j)−∫_𝕋g dμ|≤V(g)D_circ(z). Values at sample discontinuities are retained. No new general bounded-variation definition is introduced.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.3/circle-discrepancy`, `ProbabilisticAndMetricNumberTheory:PM.2/koksma`, `mathlib:eVariationOn`.

**Proof or construction.**

1. Choose arguments in [0,1) and pull g back to the closed unit interval, including the common periodic endpoint.

2. Apply the existing PM.2 Koksma theorem, whose strict-cut star discrepancy and native variation have the matching pointwise conventions.

3. Use D*≤D_circ and identify normalized Lebesgue angular integration with normalized circle Haar integration.

**Checks.** A constant function has zero variation and exact quadrature. For a continuous C¹ periodic function the variation is ∫_0^1 |d/dt g(exp(2πit))|dt; an arclength derivative requires the corresponding 2π factor.

**Source.** CDT25, (2.5.6)–(2.5.7), p.645; the general Koksma theorem is imported from PM.2.

**Planet.** Koksma’s circle inequality.

### Erdős–Turán for circular arcs

**Target `AA.3/circle-erdos-turan` (theorem).** For a nonempty d-tuple z_j∈𝕋 and K≥1, D_circ(z)≤3[1/(K+1)+Σ_(k=1)^K (1/k)|d^(−1)Σ_j z_j^k|]. This target is a circular-coordinate specialization of the existing PM.2 Erdős–Turán theorem.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.3/circle-discrepancy`, `ProbabilisticAndMetricNumberTheory:PM.2/erdos-turan`.

**Proof or construction.**

1. Apply the owner’s star-discrepancy inequality to the arguments after an arbitrary rotation of the cut.

2. Every kth exponential mean changes only by a unit scalar, so the right side is independent of the cut.

3. Take the supremum over cuts using the rotated-star identity. This retains the constant 3; the rough D_circ≤2D* comparison would unnecessarily double it.

**Checks.** For a regular d-gon all Fourier means of orders 1,…,d−1 vanish. This inequality is a requested routed target, but the damping proof uses Koksma and the energy gap rather than Erdős–Turán.

**Source.** CDT25, (2.5.8), p.645; imported PM.2 Erdős–Turán followed by rotation.

**Planet.** Erdős–Turán inequality.

### Variation of a positive logarithmic norm

**Target `AA.3/positive-log-variation` (lemma).** For h:𝕋→ℂ of class C¹, the real function log(max(1,|h|)) has finite native variation in the angular parameter t∈[0,1]. For a real C¹ function g on 𝕋 that variation equals ∫_0^1 |d/dt g(exp(2πit))|dt. Boundary zeros of h cause no singularities in the positive logarithm.

**Dependencies.** `mathlib:eVariationOn`, `mathlib:LipschitzWith.comp_boundedVariationOn`.

**Proof or construction.**

1. On ℂ the function w↦log(max(1,|w|)) is 1-Lipschitz: the radial scalar map is 1-Lipschitz and the norm is 1-Lipschitz.

2. The angular pullback of h is C¹ on a compact interval, hence Lipschitz and of bounded variation. Compose using the existing variation lemma.

3. The real C¹ variation identity follows from the FTC upper bound on partition sums and approximation of the integral of |g′| by fine partitions; this is the specific calculus bridge, not a new variation carrier.

**Checks.** For h=0 the variation is 0, not infinite. For h(z)=z it is 0; for h(z)=2z it is also 0. The expression log|h| without the positive cutoff can have logarithmic singularities at boundary zeros and is not the function used in Koksma.

**Source.** CDT25, Definition 2.5.5 and (2.5.6), p.645; sentence applying it to log⁺ in §2.5.14, p.647.

### Fekete’s extremal Vandermonde on the circle

**Target `AA.3/fekete-circle` (theorem).** For d≥1 and z_j∈𝕋, let V(z)=∏_(i<j)(z_i−z_j). Then |V(z)|≤d^(d/2), with equality precisely when the tuple, up to permutation, is a rotation of all dth roots of unity. For d=1 every singleton is such a rotation; repeated points give zero when d≥2.

**Dependencies.** `mathlib:Matrix.det_vandermonde`, `mathlib:InnerProductSpace.gramSchmidtOrthonormalBasis_det`.

**Proof or construction.**

1. Use the native Vandermonde matrix, ignoring the harmless sign from the product orientation. All its row vectors have Euclidean norm √d.

2. For independent rows, use Gram–Schmidt and Cauchy–Schwarz to show the determinant norm is at most the product of row norms; dependent rows give zero. Equality means pairwise orthogonal rows. This is the finite-dimensional Hadamard argument specialized here.

3. The inner product of distinct Vandermonde rows is Σ_(k=0)^(d−1)(z_i/z_j)^k. Orthogonality forces every distinct quotient to be a nontrivial dth root of unity. Fix one point and use distinctness to obtain the entire regular d-gon. Conversely its finite geometric sums vanish.

**Checks.** d=2 gives |z₁−z₂|≤2 with equality at antipodal pairs. The determinant formula alone does not supply this norm inequality or its equality case.

**Source.** CDT25, (2.5.2), Lemma 2.5.3, p.644.

**Planet.** Fekete’s circle extremal theorem.

### Haar equilibrium and the circle energy gap

**Target `AA.3/haar-equilibrium` (theorem).** For every Borel probability ν on 𝕋 the logarithmic energy I(ν)=∫∫log(1/|z−w|)dν(z)dν(w), with value +∞ on the diagonal before integration, lies in (−∞,+∞] and satisfies I(ν)≥0. Equality holds exactly for normalized Haar measure, which has energy zero. The kernel is bounded below by −log2, so no undefined difference of infinities is involved.

**Dependencies.** `LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.0/energy`, `LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1/equilibrium`, `LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1/capacity`, `LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1/diameter-capacity`, `DiophantineApproximationAndTranscendencePartII:AA.3/fekete-circle`.

**Proof or construction.**

1. Fekete’s exact maximum gives circle transfinite diameter lim_d d^(1/(d−1))=1. Import equality of capacity and transfinite diameter and the existence and uniqueness of the equilibrium measure for positive capacity.

2. Rotation invariance of the kernel preserves energy and hence preserves the unique minimizer. Its invariance under every rotation identifies it with normalized Haar.

3. Capacity 1 gives minimum energy 0. This uses the imported extended-energy convention, including infinite energy of atomic probabilities.

**Checks.** A point mass has energy +∞. A regular finite polygon is not itself a finite-energy equilibrium probability: its self-energy is infinite even though its off-diagonal products are maximal.

**Source.** CDT25, Potential-theoretic step in proof of Lemma 2.5.9, p.646; general definitions imported from LP.0–LP.1.

### Exponential Vandermonde loss away from Haar

**Target `AA.3/vandermonde-discrepancy-gap` (theorem).** For each ε∈(0,1] there are c_ε>0 and d₀≥1 such that if d≥d₀ and z∈𝕋^d has D_circ(z)≥ε, then |V(z)|<exp(−c_ε d²). The assertion allows collisions and requires no explicit dependence of c_ε,d₀ on ε.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.3/haar-equilibrium`, `DiophantineApproximationAndTranscendencePartII:AA.3/discrepancy-weak-limit`, `tauceti:TauCeti.Probability.empiricalMeasureOfFintype`, `tauceti:TauCeti.Probability.integral_empiricalMeasureOfFintype`, `mathlib:isCompact_setOfPred_finiteMeasure_le_of_isCompact`, `mathlib:MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`, `mathlib:ProbabilityMeasure.continuous_prod`.

**Proof or construction.**

1. If no such gap exists, choose dimensions tending to infinity and tuples with discrepancy at least ε and normalized off-diagonal energy tending to a nonpositive value. Collisions already give the desired conclusion and can be excluded from the contrary sequence.

2. Compactness of probability measures supported on the compact metric circle gives a weakly convergent subsequence ν_d→ν; sequential extraction follows from metrizability. Discrepancy continuity shows ν≠Haar.

3. For A>0 use the continuous bounded kernel k_A(z,w)=min(A,log(1/|z−w|)), with k_A(z,z)=A. Product weak convergence and the empirical formula give ∫k_A dν²≤limsup[2d^(−2)Σ_(i<j)log(1/|z_i−z_j|)+A/d]≤0.

4. Let A→∞ by monotone convergence after adding log2. Obtain I(ν)≤0, contradicting uniqueness of the Haar minimizer. This treats atomic and atomless limits uniformly.

5. If the resulting uniform lower bound for normalized off-diagonal energy is non-strict, shrink c_ε to get the displayed strict exponential inequality.

**Checks.** The diagonal contribution is A/d and disappears before A→∞; dropping it at finite d would use the infinite self-energy of the empirical measure incorrectly. Finite-dimensional logarithmic factors from the Fekete maximum are negligible beside d².

**Source.** CDT25, Lemma 2.5.9 and proof, pp.645–646.

**Planet.** Vandermonde discrepancy gap.

### Vandermonde damping of the auxiliary function

**Target `AA.3/damped-cauchy` (lemma).** Fix the arithmetic data, ε∈(0,1], κ∈(0,1), and d≥max(d₀(ε),d₁(κ)). For the auxiliary F at order α and degree D set S=sup_𝕋 log⁺|g| and M=ceil(SD/(c_ε d)); take M=0 if S=0. Then H=V^M F(φ(z₁),…,φ(z_d)) is nonzero and every nonzero coefficient b_n satisfies log|b_n|≤dDJ(g)+κCα+ε dD V(log⁺|g|)+M(d/2)log d+o(α) as α→∞ with d,κ,ε fixed. Moreover some coefficient has modulus at least λ^β for a β≥α.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.1/auxiliary-function`, `DiophantineApproximationAndTranscendencePartII:AA.1/integral-lowest-jet`, `DiophantineApproximationAndTranscendencePartII:AA.3/circle-koksma`, `DiophantineApproximationAndTranscendencePartII:AA.3/positive-log-variation`, `DiophantineApproximationAndTranscendencePartII:AA.3/fekete-circle`, `DiophantineApproximationAndTranscendencePartII:AA.3/vandermonde-discrepancy-gap`, `mathlib:Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le`.

**Proof or construction.**

1. On the region D_circ<ε, Koksma bounds Σlog⁺|g(z_j)| by dJ(g)+εdV(log⁺|g|). Bound the Vandermonde factor by d^(dM/2).

2. On its complement, |V|≤exp(−c_εd²) and the choice of M cancels the crude dDS growth term. The ceiling avoids a rounding remainder; it changes the good-region estimate by O(d log d), which is o(α) for fixed d.

3. Cauchy’s polydisc coefficient bound controls all coefficients of H by the combined boundary supremum.

4. Among the lowest total-degree terms of F choose the lexicographically greatest exponent. Multiply it by the greatest exponent of V^M. Their sum is uniquely greatest among terms of that lowest degree, so cancellation is impossible; its coefficient is a nonzero integer times φ′(0)^β, up to the sign of the Vandermonde product.

**Checks.** The derivative exponent is β, not β+M·binomial(d,2), since V is multiplied after substituting φ. Using the global Fekete upper bound on the bad region would lose the integrated growth improvement.

**Source.** CDT25, §2.5.14–§2.5.25, (2.5.15)–(2.5.26), pp.647–648.

### The mean bound through equidistribution damping

**Target `AA.3/equidistribution-proof` (comparison).** The Vandermonde-damped coefficient bounds yield the same rank bound m≤eJ(g)/logλ as AA.2/mean-rank-bound, with no use of the quotient representation or the lexicographically least coefficient inequality.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.3/damped-cauchy`, `mathlib:Stirling.factorial_isEquivalent_stirling`.

**Proof or construction.**

1. Compare the coefficient lower bound αlogλ with the damped upper bound and divide by α.

2. For fixed ε and κ let d→∞. Since D/α=O(1/d), the term M d logd/α is O_ε(logd/d) and tends to zero. The Koksma error tends to at most a constant times ε V(log⁺|g|).

3. Let κ→0, then ε→0. The Siegel constant is independent of d and κ. The order of all four limits is α, d, κ, ε.

**Checks.** The three analytic proofs agree on every normalization and on the final factor e. Erdős–Turán is a companion target and does not supply the energy gap used here.

**Source.** CDT25, End of §2.5.25, pp.648–649.

**Layer status.** closed. No remaining target-level proof obligations beyond the cited supplier interfaces and the implementation work described by this plan.

## AA.4 — Holonomic rings and the correct scalar spans

**Inputs.** `ConformalMappingPartII:O0`, `ConformalMappingPartII:U0`, `DiophantineApproximationAndTranscendence:DT.5`, `DiophantineApproximationAndTranscendencePartII:AA.0`, `DiophantineApproximationAndTranscendencePartII:AA.2`

### Integral holonomic germs with meromorphic local bases

**Target `AA.4/holonomic-ring` (definition).** Let U⊆ℂ be open with 0∈U and χ∈t+t²ℚ[[t]]. Define H(U,χ,ℤ) to be the subset of ℚ[[x]] consisting of f with f∘χ∈ℤ[[t]] for which some nonzero linear differential operator L∈ℚ̄(x)[∂] annihilates f and has a full meromorphic local solution basis at every singular point in U. At an order-n singularity this means n independent solutions meromorphic on a whole neighbourhood, spanning the punctured-neighbourhood solution space. The zero series is included. The existence of a suitable operator, rather than a chosen operator or the minimal operator, is part of membership.

**Dependencies.** `DiophantineApproximationAndTranscendence:DT.5/d-finite-power-series`, `ConformalMappingPartII:O0/meromorphic-basis-monodromy`, `DiophantineApproximationAndTranscendencePartII:AA.0/integral-scale`.

**Uses that determine the interface.**

- CDT25 Corollary 2.0.5: Supplies the arithmetic germs whose poles must be cleared before applying the analytic rank theorem.

- CDT25 §3, pp.649–651, and §7.1, pp.686–688: Supplies the holonomic ambient space for modular-function applications; this roadmap exports the corrected W rank theorem without planning modular curves again.

**Proof or construction.**

1. Intersect the integral-pullback predicate with existence of the imported differential equation and its full meromorphic-basis property.

2. Keep the local condition at every singularity in U, including the initial point when it is singular; the series f itself has no negative powers at zero.

3. Use the closure theorem below to supply the subring structure.

**API targets.**

- `TauCeti.ArithmeticAlgebraization.HolonomicGerms.mem` (characterisation): Membership is exactly integral pullback plus the existence of a algebraic-coefficient annihilator with the stated full local bases.

- `TauCeti.ArithmeticAlgebraization.HolonomicGerms.zero_one` (simp): Zero and one belong for every U and χ.

- `TauCeti.ArithmeticAlgebraization.HolonomicGerms.subring` (structure): H is closed under addition, negation and multiplication by the closure theorem.

- `TauCeti.ArithmeticAlgebraization.HolonomicGerms.restrictDomain` (functoriality): For open U′⊆U containing 0, H(U,χ,ℤ)⊆H(U′,χ,ℤ).

- `TauCeti.ArithmeticAlgebraization.HolonomicGerms.integralCoordinate` (relation): For χ=t the ring is a ℤ[x]-algebra; when p has no poles in U and p∘χ is integral it is a ℤ[p]-algebra.

- `TauCeti.ArithmeticAlgebraization.HolonomicGerms.nativeDFinite` (compatibility): Membership forgets to the parent roadmap’s D-finite predicate over ℚ̄; rationality of f also gives D-finiteness over ℚ by coefficient-linear-system descent.

**Unit tests.**

- `TauCeti.ArithmeticAlgebraization.HolonomicGerms.unit` (example): The series 1 is a member even when U=ℂ.

- `TauCeti.ArithmeticAlgebraization.HolonomicGerms.poleOutside` (example): For χ=t, 1/(1−x) belongs on ℂ and its first-order equation has a meromorphic basis at 1.

- `TauCeti.ArithmeticAlgebraization.HolonomicGerms.exponential` (counterexample): exp(x) is D-finite and entire but fails integral coefficients for χ=t, since its x² coefficient is 1/2.

- `TauCeti.ArithmeticAlgebraization.HolonomicGerms.essential` (counterexample): Put L(t)=−log(1−t), χ=L/(1+L), and f(x)=exp(x/(1−x)). Then χ=t+O(t²) is rational-coefficient and f∘χ=1/(1−t) is integral. The rational-coefficient germ f is D-finite, satisfying (1−x)²f′−f=0, but f does not belong to H(ℂ,χ,ℤ): its essential singularity at 1 precludes every full-meromorphic-basis annihilator. Thus the local condition is independent of D-finiteness and integral pullback.

**Checks.** Identity of topological monodromy alone is insufficient: exp(1/(x−α)) has identity monodromy but an essential singularity. A pole is allowed for other local solutions; it is only the chosen formal f that must be regular at zero.

**Source.** CDT25, Definition 2.0.4 and its local-basis convention, pp.635–636.

**Planet.** Integral holonomic germs.

### Ring closure and rational multipliers

**Target `AA.4/holonomic-closure` (theorem).** For U,χ as above, H(U,χ,ℤ) is a subring of ℚ[[x]]. If p∈ℚ(x) is regular throughout U and p∘χ is integral, then multiplication by p preserves H; hence it is a ℤ[p]-algebra. For χ=t, multiplication by x preserves H and it is a ℤ[x]-algebra.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-ring`, `DiophantineApproximationAndTranscendence:DT.5/d-finite-power-series`, `ConformalMappingPartII:O0/initial-value-basis`, `ConformalMappingPartII:O0/meromorphic-basis-monodromy`.

**Proof or construction.**

1. Integral pullbacks are closed under the ring operations. Use the parent D-finite closure construction on finite-dimensional ℚ̄(x) differential modules: direct sums for sums and tensor products for products.

2. On a punctured neighbourhood the input differential modules have full horizontal meromorphic bases. Their direct sums and tensors do too. The cyclic differential subquotient defining the resulting scalar equation inherits this property: a horizontal frame identifies these modules and their subquotients with constant finite-dimensional spaces. This also covers any new apparent singularities of the cyclic presentation.

3. The rational function p has a first-order meromorphic solution module (or is constant). Tensor with it; at its zeros a basis can still be meromorphic. The assumption of no poles in U ensures p itself is holomorphic at zero and that p∘χ multiplication stays within formal power series.

4. For χ=t, x has integral pullback and is regular everywhere.

**Checks.** The derivative need not preserve the arithmetic ring for arbitrary χ; no derivative-closure API is asserted. An arbitrary rational multiplier can destroy integral coefficients and is available only after taking the scalar spans.

**Source.** CDT25, Ring and module assertions following Definition 2.0.4, pp.635–636; rational differential-module closure spells out the property used there.

### Two distinct scalar spans of integral holonomic germs

**Target `AA.4/holonomic-spans` (construction).** Assume the data of H and let p∈ℚ(x) be nonconstant, regular on U, with p∘χ integral. Embed ℚ[[x]] and ℚ(x) in ℚ((x)). Set W(U,χ,p)=span_(ℚ(p)) H(U,χ,ℤ), and V(U,χ,ℤ)=span_(ℚ(x)) H(U,χ,ℤ), both inside this same Laurent-series field. Then W⊆V and V=ℚ(x)W. The space V is the source’s V; W is the smaller span to which the mean rank argument directly applies. Neither space is defined as a span over ℚ alone.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-ring`, `DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-closure`, `mathlib:RatFunc.coeToLaurentSeries`.

**Uses that determine the interface.**

- AA.4/rank-bound: Finite independent families of W generators are controlled by the analytic theorem.

- AA.4/span-comparison and the scalar-field counterexample: Distinguishes the corrected result from the printed Corollary 2.0.5 and supplies safe downstream interfaces.

**Proof or construction.**

1. Use native scalar restriction and submodule spans in the common Laurent-series field; rational functions are interpreted through their Laurent expansion at zero.

2. Expand each finite span explicitly. Closure of H under multiplication makes both spans subalgebras over their respective scalar fields, containing 1.

3. The inclusions of scalar fields and the iterated finite-span identity give W⊆V and V=ℚ(x)W.

**API targets.**

- `TauCeti.ArithmeticAlgebraization.HolonomicSpans.mem_W` (characterisation): W elements are finite ℚ(p)-linear combinations of H elements.

- `TauCeti.ArithmeticAlgebraization.HolonomicSpans.mem_V` (characterisation): V elements are finite ℚ(x)-linear combinations of H elements.

- `TauCeti.ArithmeticAlgebraization.HolonomicSpans.algebra` (structure): W and V are subalgebras over their displayed fields and contain their scalar fields via 1∈H.

- `TauCeti.ArithmeticAlgebraization.HolonomicSpans.scalarExtend` (compatibility): V=ℚ(x)W inside ℚ((x)); restriction of scalars embeds W in V.

- `TauCeti.ArithmeticAlgebraization.HolonomicSpans.integralChi` (relation): If χ is integral, x∈H, and after the finite-rank theorem W is a field containing ℚ(x), hence W=V.

- `TauCeti.ArithmeticAlgebraization.HolonomicSpans.sourceV` (relation): For χ=t, V agrees exactly with the source’s V(U,ℤ); the parent D-finite predicate is a condition on generators, not on an arbitrary chosen presentation.

**Unit tests.**

- `TauCeti.ArithmeticAlgebraization.HolonomicSpans.constants` (example): For every admissible datum, ℚ(p)⊆W and ℚ(x)⊆V, so neither space has rank zero.

- `TauCeti.ArithmeticAlgebraization.HolonomicSpans.identityCoordinate` (compatibility): For p=x and χ=t the scalar fields coincide and W=V by definition.

- `TauCeti.ArithmeticAlgebraization.HolonomicSpans.degreeFour` (counterexample): For p=x+x⁴/32 and χ its tangent inverse, V contains ℚ(x), whose degree over ℚ(p) is 4. This cannot be bounded as though V were just the span over ℚ(p).

- `TauCeti.ArithmeticAlgebraization.HolonomicSpans.laurent` (degenerate): Even though generators are power series, x⁻¹ belongs to V. The ambient space must therefore allow Laurent expansions.

**Checks.** The scalar field in a dimension statement is part of its type. The definition does not force x∈W when χ has nonintegral coefficients.

**Source.** CDT25, Definition 2.0.4, p.635; correction of the scalar-span passage in Corollary 2.0.5, p.636.

**Planet.** Holonomic scalar spans.

### Uniformization after rational simultaneous pole clearing

**Target `AA.4/pole-clearing` (lemma).** For a finite family f_i∈H(U,χ,ℤ), a nonconstant p∈ℚ(x) without poles on U with p∘χ integral, and φ holomorphic near the closed unit disc with image in U, φ(0)=0 and φ′(0)≠0, there is a nonzero q∈ℤ[t] such that every q(p)f_i has integral χ-pullback and a holomorphic uniformization on a neighbourhood of that closed disc. Multiplication by this common nonzero factor preserves ℚ(p)-linear independence.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-ring`, `DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-closure`, `ConformalMappingPartII:O0/simultaneous-pole-clearing`, `ConformalMappingPartII:O0/path-continuation`, `ConformalMappingPartII:O0/global-solution-dimension`, `DiophantineApproximationAndTranscendencePartII:AA.0/uniformized-germs`.

**Proof or construction.**

1. Each algebraic-coefficient differential operator has finitely many algebraic singularities; take their union for the chosen finite family. Import rational simultaneous pole clearing using sufficiently high powers of the minimal polynomials of p(α), at singularities α lying in U. Multiply the polynomial by an integer to make all its coefficients integral.

2. Every local solution multiplied by q(p) is holomorphic throughout U at the formerly singular points. Continue the initial germ along paths pulled back to the parameter disc. The imported uniqueness and monodromy argument on a slightly larger simply connected disc give single-valued holomorphic realizations. A sufficiently small enlargement still maps into U by compactness.

3. The factor q(p∘χ) is integral. Since p is nonconstant, q(p)≠0; multiplication is injective in the Laurent-series field and preserves independence.

4. No Galois invariance of the subset of singularities lying in U is assumed: rational minimal polynomials may add harmless conjugate zeros.

**Checks.** A polynomial with complex coefficients would not preserve the arithmetic pullback condition. Pole clearing is applied to the full local bases, rather than only a selected branch.

**Source.** CDT25, Proof of Corollary 2.0.5, p.636.

### Corrected holonomic rank bound

**Target `AA.4/rank-bound` (theorem).** Let U⊆ℂ be open with 0∈U; χ=t+O(t²)∈ℚ[[t]]; p∈ℚ(x) nonconstant without poles on U with p∘χ integral. Let φ be holomorphic near the closed unit disc, map it and a neighbourhood into U, satisfy φ(0)=0, and have λ=|φ′(0)|>1. Then W(U,χ,p) has finite dimension over ℚ(p), and dim_(ℚ(p))W≤B:=eJ(p∘φ)/logλ. This bound is for W as defined above, without adjoining all rational functions in x.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-spans`, `DiophantineApproximationAndTranscendencePartII:AA.4/pole-clearing`, `DiophantineApproximationAndTranscendencePartII:AA.2/mean-rank-bound`.

**Proof or construction.**

1. Every finite independent family in W can be replaced by an equally large independent family of H generators: choose generators in finite span presentations and perform finite-dimensional basis extraction.

2. Apply simultaneous integral pole clearing to this family. Its independence and integral pullbacks survive, and its uniformizations are holomorphic.

3. Apply the mean rank theorem. A uniform real bound on all finite independent families implies finite dimension and the dimension bound.

**Checks.** The derivative and logarithmic mean have the same normalization as in AA.2. The printed bound on dim_(ℚ(p))V is not a consequence unless W=V or another scalar-extension factor is included.

**Source.** CDT25, Corollary 2.0.5 and its proof, p.636, with the scalar span corrected as in source issue E1.

**Planet.** Holonomic rank bound.

### Field structure and safe bounds for V

**Target `AA.4/span-comparison` (theorem).** Under AA.4/rank-bound, W and V are fields in ℚ((x)), finite over ℚ(p) and ℚ(x), respectively. Write n=[ℚ(x):ℚ(p)]<∞. Then dim_(ℚ(x))V≤dim_(ℚ(p))W≤B and dim_(ℚ(p))V≤n·B. If χ∈ℤ[[t]], then W=V, so the stronger bound dim_(ℚ(p))V≤B holds. In all cases V is finite-dimensional over ℚ(x).

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.4/rank-bound`, `DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-closure`, `DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-spans`, `mathlib:RatFunc.finrank_eq_max_natDegree`.

**Proof or construction.**

1. A finite-dimensional subalgebra of a field is a field: multiplication by a nonzero element is injective and hence surjective as a linear endomorphism. Apply this first to W.

2. A ℚ(p)-basis of W spans V over ℚ(x), giving its dimension bound and then its field structure by the same argument.

3. Import the native rational-function extension-degree formula: for nonconstant p=a/b in reduced form, [ℚ(x):ℚ(p)]=max(deg a,deg b)<∞. The scalar tower formula gives the second displayed inequality.

4. If χ is integral then x∈H. The field W consequently contains ℚ(x), so V=ℚ(x)W=W.

**Checks.** Multiplication by n is indispensable in the general χ statement about dimension over ℚ(p). The printed first, qualitative finiteness claim is preserved.

**Source.** CDT25, Corrected interpretation of Corollary 2.0.5, pp.635–636; finite-field argument fills the passage from the bounded generator span to V.

### Finiteness for an integral coordinate above radius one

**Target `AA.4/integral-coordinate-finiteness` (theorem).** Let U⊆ℂ be open with 0∈U. If there is a holomorphic map φ from the open unit disc into U with φ(0)=0 and |φ′(0)|>1, then V(U,ℤ)=V(U,t,ℤ) is finite-dimensional over ℚ(x). More generally the same conclusion holds for integral χ=t+O(t²). For a connected hyperbolic U the hypothesis is equivalent to conformal radius at 0 greater than 1; for U=ℂ or ℂ∖{a} with a≠0 use the explicit disc-map hypothesis rather than a hyperbolic-radius definition outside its domain.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.4/span-comparison`, `ConformalMappingPartII:U0/conformal-radius`, `ConformalMappingPartII:U0/radius-schwarz`, `DiophantineApproximationAndTranscendencePartII:AA.0/uniformized-germs`.

**Proof or construction.**

1. Choose 1/|φ′(0)|<r<1 and restrict to φ(rz). This supplies a neighbourhood of the closed disc with derivative r|φ′(0)|>1.

2. Take p=x, whose χ-pullback is integral. The corrected rank theorem bounds W=V directly.

3. For connected hyperbolic U import the conformal-radius universal-cover characterization. For other open U the operational disc-map condition suffices and requests no new general uniformization theorem.

**Checks.** A map with derivative exactly 1 does not meet this sufficient criterion. For U=ℂ, φ(z)=2z supplies the hypothesis; the formulation does not try to evaluate a hyperbolic conformal radius at a parabolic surface.

**Source.** CDT25, First assertion of Corollary 2.0.5, p.636.

**Planet.** Holonomic finiteness above radius one.

### Counterexample to the unrestricted V rank bound

**Target `AA.4/scalar-span-counterexample` (application).** In the published Corollary 2.0.5, take U=ℂ, p=x+x⁴/32, χ the formal inverse of p tangent to the identity, and φ(z)=2z. Then p∘χ=t∈ℤ[[t]] and all printed hypotheses hold. Since 1∈H, dim_(ℚ(p))V≥[ℚ(x):ℚ(p)]=4. However J(p∘φ)≤log(5/2), so eJ(p∘φ)/log2<4. Thus the printed (2.0.7) for V is false for general rational χ.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-spans`, `DiophantineApproximationAndTranscendencePartII:AA.4/span-comparison`, `DiophantineApproximationAndTranscendencePartII:AA.2/mean-rank-bound`, `mathlib:RatFunc.finrank_eq_max_natDegree`.

**Proof or construction.**

1. Formal inversion exists because p(0)=0 and p′(0)=1; its fourth coefficient is −1/32, so χ is rational but nonintegral.

2. On |z|=1, |p(2z)|=|2z+z⁴/2|≤5/2. Hence its positive-log average is at most log(5/2).

3. The polynomial p has degree 4, giving the extension degree 4. Finally e<3 and (5/2)³=125/8<16=2⁴ show e log(5/2)/log2<4.

4. All points of U are allowed because p is a polynomial. The counterexample concerns the scalar extension in this corollary, not the validity of the main analytic theorem.

**Checks.** Taking p=x would conceal this problem because its scalar fields coincide. The corrected W bound and the integral-coordinate bound survive this example.

**Source.** CDT25, Definition 2.0.4, pp.635–636; Corollary 2.0.5, (2.0.7), p.636.

**Layer status.** closed. No remaining target-level proof obligations beyond the cited supplier interfaces and the implementation work described by this plan.

## AA.5 — Centred capacity bounds and the general-compact obstruction

**Inputs.** `DiophantineApproximationAndTranscendencePartII:AA.4`, `LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1`

### Capacity normalization on centred circles and discs

**Target `AA.5/centred-capacity` (theorem).** Assume U,χ,p as in AA.4/rank-bound, and let φ be holomorphic on a neighbourhood of the closed disc |z|≤r, r>0, with image there in U, φ(0)=0, and r|φ′(0)|>1. For K={|z|≤r} or K={|z|=r}, its capacity is r and its equilibrium measure is normalized arc measure on the boundary circle. Then dim_(ℚ(p))W≤e∫_K log⁺|p∘φ|dμ_K/(log|φ′(0)|+log cap(K)). The same bound holds for dim_(ℚ(x))V, and for dim_(ℚ(p))V if χ is integral. For general χ the latter bound requires the factor [ℚ(x):ℚ(p)].

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.4/rank-bound`, `DiophantineApproximationAndTranscendencePartII:AA.4/span-comparison`, `LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1/capacity`, `LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1/equilibrium`.

**Proof or construction.**

1. Apply AA.4/rank-bound to ψ(z)=φ(rz). Its derivative modulus is r|φ′(0)| and its circle integral is the displayed equilibrium integral.

2. Import capacity of the disc and circle as r and the uniqueness of their rotationally invariant equilibrium probability. This proves the formula exactly for both centred shapes, including r≠1.

3. Use the scalar-span comparison for the asserted V versions.

**Checks.** The denominator must be positive, not merely nonzero. For r=1 this recovers the corrected circle corollary. The conformal centre is fixed at 0; translation of K while leaving φ(0)=0 fixed is not a consequence.

**Source.** CDT25, Valid centred-disc and circle cases of (2.5.28), p.649; proof by rescaling Corollary 2.0.5.

**Planet.** Centred capacity rank bound.

### Failure of the arbitrary-compact capacity formula

**Target `AA.5/compact-counterexample` (theorem).** Let K be the closed disc with centre 1/2 and radius 1/4, contained in the open unit disc. Take U=ℂ, p=x, χ=t and φ(z)=8z exp(−20z). Then φ(0)=0, |φ′(0)|=8, cap(K)=1/4 and log|φ′(0)|+log cap(K)=log2>0. Yet ∫_K log⁺|p∘φ|dμ_K=0 while dim_(ℚ(x))V≥1. Thus the arbitrary-compact claim (2.5.28) fails even with integral χ and identical scalar fields.

**Dependencies.** `DiophantineApproximationAndTranscendencePartII:AA.4/holonomic-spans`, `DiophantineApproximationAndTranscendencePartII:AA.5/centred-capacity`, `LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1/capacity`, `LogarithmicPotentialTheoryAndAlgebraicIntegers:LP.1/equilibrium`.

**Proof or construction.**

1. On K, Re z≥1/4 and |z|≤3/4, hence |φ(z)|≤6exp(−5)<1. Its positive logarithm vanishes at every point of K, regardless of the equilibrium measure.

2. Capacity is invariant under translation and the capacity of a radius-1/4 disc is 1/4. The positive denominator follows from 8/4=2.

3. The constant germ 1 lies in H, so both W=V contain ℚ(x) and have rank at least one. The proposed inequality would give rank zero.

4. A general replacement would have to link the sampling compactum to the analytic base point and the admissible auxiliary functions. This plan records that missing replacement rather than assigning a false theorem a proof.

**Checks.** The compactum has positive capacity and the denominator is strictly positive, so neither degeneracy explains the failure. The map is entire and p has no poles anywhere; shrinking away from singularities cannot repair this example.

**Source.** CDT25, (2.5.28) and the paragraph introducing K, p.649.

**Planet.** General compact obstruction.

**Layer status.** planned. G1: establish a valid arbitrary-compact replacement sensitive to the fixed base point, or obtain a maintainer decision to remove the refuted general target. E2 is independently confirmed; the centred versions and the obstruction are fully planned.

## Native baseline declarations

- `mathlib:PowerSeries.coeff` in `Mathlib/RingTheory/PowerSeries/Basic.lean`: Coefficient linear maps on native univariate formal power series.

- `mathlib:PowerSeries.coeff_rescale` in `Mathlib/RingTheory/PowerSeries/Basic.lean`: The nth coefficient after rescaling by a is a^n times the original coefficient.

- `mathlib:PowerSeries.substAlgHom` in `Mathlib/RingTheory/PowerSeries/Substitution.lean`: Substitution as an algebra homomorphism when the substituted series has nilpotent constant coefficient; zero constant coefficient suffices over the coefficient fields used here.

- `mathlib:Int.Matrix.exists_ne_zero_int_vec_norm_le` in `Mathlib/NumberTheory/SiegelsLemma.lean`: For a finite integer matrix with 0<row count<column count, a nonzero integral kernel vector with the stated sup-norm bound (column count times max(1,matrix norm))^(rows/(columns−rows)).

- `mathlib:AnalyticOnNhd.circleAverage_log_norm` in `Mathlib/Analysis/Complex/JensenFormula.lean`: Jensen formula on a closed disc for an analytic function nonzero at the centre, including the zero divisor and the logarithm of the central value.

- `mathlib:Stirling.factorial_isEquivalent_stirling` in `Mathlib/Analysis/SpecialFunctions/Stirling.lean`: Asymptotic equivalence n! ~ sqrt(2πn)(n/e)^n, from which d/(d!)^(1/d) tends to e.

- `mathlib:Matrix.det_vandermonde` in `Mathlib/LinearAlgebra/Vandermonde.lean`: Determinant of the native Vandermonde matrix is the product of v_j−v_i over i<j; the sign convention differs from the reversed product but its norm agrees.

- `mathlib:InnerProductSpace.gramSchmidtOrthonormalBasis_det` in `Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean`: Determinant in the Gram–Schmidt orthonormal basis is the product of the successive diagonal inner products. This supplies the determinant estimate after Cauchy–Schwarz, not a pre-existing Hadamard inequality.

- `mathlib:eVariationOn` in `Mathlib/Topology/EMetricSpace/BoundedVariation.lean`: Extended variation is the supremum of sums of consecutive extended distances over increasing finite partitions.

- `mathlib:LipschitzWith.comp_boundedVariationOn` in `Mathlib/Topology/EMetricSpace/BoundedVariation.lean`: A Lipschitz outer map preserves bounded variation on a subset of a linear order.

- `tauceti:TauCeti.Probability.empiricalMeasureOfFintype` in `TauCeti/Probability/Process/EmpiricalMeasure.lean`: A nonempty finite population gives a probability measure with weight inverse cardinality at each indexed value, retaining multiplicities.

- `tauceti:TauCeti.Probability.integral_empiricalMeasureOfFintype` in `TauCeti/Probability/Process/EmpiricalMeasure.lean`: Integrals of strongly measurable functions against the finite empirical measure are normalized finite sums.

- `mathlib:isCompact_setOfPred_finiteMeasure_le_of_isCompact` in `Mathlib/MeasureTheory/Measure/Prokhorov.lean`: Finite measures of bounded mass supported on a fixed compact set form a compact set in the weak topology.

- `mathlib:MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto` in `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean`: Weak convergence of probability measures is convergence of integrals of bounded continuous real test functions.

- `mathlib:Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le` in `Mathlib/Analysis/Complex/Liouville.lean`: Cauchy derivative estimate n! C/R^n for a complex differentiable function continuous on the closed positive-radius disc and bounded by C on its boundary; divide by n! for Taylor coefficients and iterate in separate variables.

- `mathlib:RatFunc.finrank_eq_max_natDegree` in `Mathlib/FieldTheory/RatFunc/IntermediateField.lean`: The degree of K(X) over K(f) is the maximum of the reduced numerator and denominator degrees; finrank is zero for a constant f. Nonconstancy supplies the finite extension in the applications.

- `mathlib:RatFunc.coeToLaurentSeries` in `Mathlib/RingTheory/LaurentSeries.lean`: The rational-function to Laurent-series coercion is the field algebra map, compatible with the polynomial and power-series embeddings.

- `mathlib:IsAlgebraic.exists_integral_multiple` in `Mathlib/RingTheory/Algebraic/Integral.lean`: An element algebraic over a commutative ring has a nonzero scalar multiple integral over that ring. Apply over ℤ and take a positive common multiple for finitely many algebraic numbers.

- `mathlib:ProbabilityMeasure.continuous_prod` in `Mathlib/MeasureTheory/Measure/FiniteMeasureProd.lean`: Native full name MeasureTheory.ProbabilityMeasure.continuous_prod. On second-countable pseudometrizable spaces with measurable opens, binary product of probability measures is weakly continuous; the compact metric circle meets the hypotheses. The short reference is intentional: the supplied index mistakenly retains the preceding FiniteMeasure namespace after its commented end command, while the source closes it on line 89. This is an index discrepancy, not missing mathematics.

- `mathlib:MeasureTheory.ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto` in `Mathlib/MeasureTheory/Measure/Portmanteau.lean`: Weak convergence on a pseudometrizable space implies convergence of masses of sets whose frontier is null for the limit probability; applies to arcs with endpoints outside its atoms.

## Source provenance and remaining work

CDT25 was read in its published author offprint, §§1.1.1 and 2, with the application interface in §3, pp.649–651. The definitions and two disputed formulas were also checked on page images. BB11 was read in §§1 and 6 and the opening of §8; the qualitative denominator proof above follows its elementary tail-series route, with the coefficient induction spelled out, and does not rely on an unread proof of its stronger effective estimates. The sourceItemCoverage table in the packet accounts for all 20 routed items.

- CDT25: Frank Calegari, Vesselin Dimitrov and Yunqing Tang, [The unbounded denominators conjecture](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Journal of the American Mathematical Society 38 (2025), 627–702; published author offprint. Accessed 2026-10-18. SHA-256 `867026fbcc5592728173e5c4d6a87f58d57a55b0d0d8b0109b9774e84290ee1e`.

- BB11: Yuri Bilu and Alexander Borichev, [Remarks on Eisenstein](https://arxiv.org/pdf/1112.2290v2), arXiv:1112.2290v2, 21 December 2011. Accessed 2026-10-18. SHA-256 `31a6d216243dacc754b7040c1b1cbc20df2c4969745fdb6409346c6297bf9af1`.

The bounded correction search on 2026-10-18 checked the author publication page, the current linked published offprint, the arXiv version history (latest v4, 16 September 2024), targeted web searches, and correction/capacity keywords in the author-linked 2026 ICM survey. No applicable published correction was located. Independent review `REV-DESIGN-DiophantineApproximationAndTranscendencePartII` confirmed both findings against the published page images and repeated the bounded correction search. This establishes the stated counterexamples, not exhaustive novelty or a failure of the paper’s modular application.

G1 is the only open mathematical gap: establish an exact, source-supported arbitrary-compact replacement sensitive to the distinguished base point, or obtain a maintainer decision to remove that refuted general target. A worker must not assert the original formula, hide the gap in a hypothesis, or substitute a bound on the wrong scalar span. The centred capacity theorem and qualitative holonomic finiteness do not depend on resolving G1.

Independent review accepted all 35 nodes on 2026-10-18, relative to the cited supplier interfaces and the explicit G1 follow-up. All 20 baseline declarations were checked at the pins. The unchanged 250-line suggested Lean file elaborated with only `sorry` warnings; this checks signatures, not proofs. The review report records the source checks, supplier boundaries and the one known namespace-index warning.
