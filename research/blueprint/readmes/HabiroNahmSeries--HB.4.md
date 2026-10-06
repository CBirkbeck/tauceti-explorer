# Nahm sums: radial asymptotics and coefficient fields (HB.4)

This is a target-level continuation of the accepted HabiroNahmSeries plan, scoped to **HabiroNahmSeries:HB.4**. The mathematical objects and twenty HB.4 declarations in [the parent packet](../packets/HabiroNahmSeries.json) remain the foundation. This document adds the uniform estimates needed to justify its corrected formula and specifies the arithmetic descent input precisely. It is a plan, with implementation status unchecked.

The layer is **planned**. The analytic proof has a complete route through fixed-order estimates; coefficientwise Kummer invariance, rational-data arithmetic normalization and an exact Rogers supplier interface remain recorded inputs. The analytic asymptotic theorem does not assume the field descent theorem. The suggested file checks expressibility at the pinned baseline and supplies no proofs of the planned mathematics.

## Scope, conventions and ownership

Write Q(n)=½nᵀAn+B·n+C, with A symmetric positive definite and A,B,C rational. For real positive ε, τ=a/m+iε/(2πm), ζ=exp(2πia/m), and q=ζexp(−ε/m). Rational powers are exp(2πiτλ). This is a function on the upper half-plane, or a finite covering of the punctured disc; choosing the principal logarithm of q would change its branch. The general C case is obtained by multiplication by exp(2πiaC/m)exp(−Cε/m).

The positive distinguished solution satisfies 1−z_i=∏z_j^{A_ij}. Put s_i=−log z_i, θ_i=z_i^{1/m}>0 and H=A+diag(z_i/(1−z_i)). The Hessian is positive definite; √det H is positive. The growth constant is

Λ=Nπ²/6−∑Li₂(z_i)−½∑log z_i log(1−z_i).

On (0,1), this is the sum of CGZ's Rogers values π²/6−Li₂(x)−½log x log(1−x). It is the negative of the shifted Rogers function used by GZ. The circle-valued regulator has period π²/2; no division of its values by a rational denominator is implicit.

For D_ζ(w)=∏_{t=1}^{m−1}(1−ζ^tw)^t, an m-th root in the analytic formula means exp(m⁻¹∑t Log(1−ζ^tw)). Each factor uses its principal logarithm. Taking the principal logarithm of the entire product need not give the same root. In particular χ_{a,m}=m⁻¹ᐟ²exp(m⁻¹∑t Log(1−ζ^t))=exp(πi s(a,m)), where s(a,m) is the Dedekind sum. The binomial expression printed by GZ agrees at a=1 and cannot be used for arbitrary numerators.

The analytic theorem retains odd m coprime to a denominator of Q and gcd(a,m)=1. The local product, modulus and Gaussian estimates themselves work at every positive m. There is no sectorial or minor-arc assertion. A formal Nahm matrix that is not positive definite does not satisfy these analytic hypotheses.

| Input | Owner and immutable node interface |
|---|---|
| Finite and analytic q-symbols; the Nahm function | HB.4/q-pochhammer-symbols, HB.4/analytic-nahm-sum in the parent |
| Distinguished solution, coherent positive roots | HB.3/distinguished-solution; HB.3/positive-coherent-root-lift |
| Bernoulli expansion, eta factor, corrected local summand | HB.4/euler-maclaurin-with-remainder, HB.4/pochhammer-radial-asymptotics, HB.4/euler-function-at-a-root-of-unity, HB.4/summand-asymptotics |
| Formal Gaussian bracket, moments, congruence weights | HB.4/formal-gaussian-integration, HB.4/gaussian-moments, HB.4/gauss-sum-and-congruence-splitting |
| Cyclic quantum dilogarithm and near-unit map | HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm, HB.2/kummer-value-P, HB.2/the-map-R-zeta |
| Classical polylogarithm and distribution | Polylogarithms:P.1/classical-polylogarithm, P.1/classical-distribution |
| Andrews–Gordon identities and the min-matrix specialization | QSeriesPartitionsAndMockModularForms:QM.0/andrews-gordon-identities, QM.0/andrews-gordon-nahm-form |
| Topological identifications and state-integral contours | ArithmeticQuantumTopology:QT.6 |

In this table, unqualified HB ids have prefix HabiroNahmSeries:. The remaining parent radial, Kummer, simplified, unit and acceptance nodes are cited in the declaration contracts below. A reference to a parent's combined theorem selects only the stated analytic component when its arithmetic component has an outstanding gap.

The confirmed RT-AREA-topology/11 interface is respected: **HB.4 supplies Euler–Maclaurin and saddle estimates to QT.6; HB.8 supplies formal Gaussian theory to QT.6**. QT.6 owns topological identification, Faddeev integrands, contours and 2–3 invariance. There is no reverse dependency from HB.4 to QT.6. HB.10's knot matrices remain formal data unless a QT.6 identification is imported. Consumer edits are outside this part's deliverables.

## The analytic proof and its constants

A local expansion alone cannot bound the tails of a complex root-of-unity sum. First group the finite q-factorial into complete m-blocks. The identity ∏_{t=1}^m(1−ζ^tr)=1−r^m reduces its modulus to an integral of log(1−e^{−v}); radial offsets, the initial singular block and an incomplete final block cost O(1+|log ε|), uniformly in the cutoff n. This gives an all-index bound.

Strong convexity of f_A(u)=½uᵀAu+∑Li₂(e^{−u_i}) then controls the absolute value of the normalized summand by a Gaussian in x=√ε(n−s/ε), times a power of ε. The real boundary u_i=0 is included by continuity. The linear B term is absorbed by completing the square. A phase-free summand is generally complex; only its majorant is positive.

Use the fixed window max|x_i|≤ε^{−1/12}, corresponding to λ=−7/12 in GZ/VZ. The outside sum is bounded by a power times exp(−cε^{−1/6}). Inside, a guarded compact product estimate gives a finite Taylor remainder. The coefficient P_p has degree≤3p and parity p. Taking enough terms before summation gives an absolute integrated remainder at any prescribed order. This argument never divides by a leading term.

A congruence lattice has spacing m√ε, hence covolume m^Nε^{N/2}. Its leading density is m^{−N}ε^{−N/2}. The Gaussian integral contributes (2πm)^{N/2}/√det H; the local summand supplies (ε/(2π))^{N/2}. Their product is exactly m^{−N/2}/√det H. For a joint class modulo m and D the density gains D^{−N}. Subtracting this factor times the coarser subsum removes all coefficients, so the proof also works when the Gauss sum vanishes.

The corrected formal integrand is the exponential of the sum of ψ terms, with −B·x√ε/m and −Nε/(24m). The Gaussian has exponent −xᵀHx/(2m). Retaining these terms is required even at ζ=1: for A=(2), B=0, z=(√5−1)/2, the normalized first coefficient is −1/60.

## Declaration contracts

The following identifiers are new continuation nodes; their names do not replace the accepted parent's identifiers. Each exact statement, proof route and direct dependency is also in [the packet](../packets/HabiroNahmSeries--HB.4.json).

### Analytic convergence and the rational exponent covering

**HabiroNahmSeries:HB.4/analytic-convergence-and-branch-comparison** (comparison).

Use the q-symbol and analytic Nahm datum of the parent. For |q|<1, (w;q)∞=∏_{j≥0}(1−wq^j) is multipliable, locally uniformly for bounded w and |q|≤ρ<1, and nonzero exactly when no factor vanishes. For symmetric positive-definite rational A, rational B,C, the Nahm series converges normally on compact subsets of Im τ>0 with q^λ=exp(2πiτλ); it is holomorphic there. Clearing a denominator gives a Laurent-Puiseux series on a finite cover of the punctured disc, not in general a single-valued holomorphic function of q. f_{A,B,C}(τ)=exp(2πiCτ)f_{A,B,0}(τ); τ=a/m+iε/(2πm) fixes the branch.

Proof route:

1. Geometric norm summability and the listed product/nonzero declarations prove the product assertion; finite factors isolate its zeros. Euler w=q is already the pinned eta product, not a new definition.
2. For a compact upper-half-plane set, |q|≤ρ<1. The reciprocal finite q-factorials are uniformly bounded by the positive Euler product at ρ. Positive definiteness gives Q(n)≥c|n|²−b|n|−b, so the absolute series is normally convergent.
3. Apply termwise holomorphy and factor out exp(2πiCτ). A rational exponent takes its value from τ, not the principal log of q.

Direct inputs: HabiroNahmSeries:HB.4/q-pochhammer-symbols, HabiroNahmSeries:HB.4/analytic-nahm-sum, mathlib:multipliable_one_sub_of_summable, mathlib:tprod_one_add_ne_zero_of_summable, mathlib:ModularForm.multipliable_one_sub_pow, mathlib:ModularForm.differentiableOn_tprod_one_sub_pow.

Acceptance checks:

- (0;q)∞=1; (1;q)∞=0 because of its initial factor.
- For C=1/2, changing τ to τ+1 changes q^C by −1.
- In rank zero the series is exp(2πiCτ), so C cannot be discarded.

Source passages: [Asymptotics of Nahm sums at roots of unity](https://d-nb.info/1217648526/34), §3, (11), PDF p. 5.

### Uniform Pochhammer remainder at a radial root of unity

**HabiroNahmSeries:HB.4/compact-pochhammer-remainder** (theorem).

Fix a primitive m-th root ζ, m≥1, and 0<ρ<1. Put q=ζe^{−ε/m}. Uniformly for |w|≤ρ, real ν with |ν|ε/m≤−log(ρ)/2, and ε→0+, write log(qw e^{−νε/m};q)∞ as the sum of factorwise principal logs. Its Bernoulli expansion through r=J≥1 has remainder bounded by C_{J,ρ,m} ε^{−1}[ε(1+|ν|)]^{J+1}. Equivalently, the truncation of the parent ψ through ε^{J−1} has that same remainder after removing the r=0,1 terms and the quadratic ν² term. The displacement guard is essential: |ν|ε≤1 alone can cross a zero. The expansion is log(product)=−Li₂(w^m)/(mε)−(ν/m−1/2)Log(1−w^m)−εν²w^m/(2m(1−w^m))−m^{−1}log D_ζ(w)−Log(1−w)+ψ; log D is the weighted sum of logs, not an arbitrary principal log of its product.

Proof route:

1. Split the logarithmic series into residues t=1,…,m: −∑_{l≥1,t}(ζ^tw)^l e^{−l(t+ν)ε/m}/[l(1−e^{−lε})]. The guard bounds all deformed |w| by √ρ<1.
2. For lε(1+|ν|) small, Taylor-expand the Bernoulli generating function through J with a uniform analytic remainder. For the complementary l, use geometric decay (√ρ)^l. The weighted l-power sum is bounded independently of ν and ε; this gives the displayed bound. This is the two-variable argument of VZ Lemma 2.2, applied to each residue.
3. Use the imported classical distribution identity for r=0,1 and the removed r=2 term. The chosen factorwise logarithms make these identities exact; no global log-of-product rule is assumed.

Direct inputs: HabiroNahmSeries:HB.4/euler-maclaurin-with-remainder, HabiroNahmSeries:HB.4/pochhammer-radial-asymptotics, HabiroNahmSeries:HB.4/cyclic-dilogarithm-interface, mathlib:Polynomial.bernoulli, mathlib:IsPrimitiveRoot, Polylogarithms:P.1/classical-polylogarithm, Polylogarithms:P.1/classical-distribution, mathlib:Complex.cexp_tsum_eq_tprod.

Acceptance checks:

- w=0 gives zero logarithm and zero remainder.
- The saddle substitution ν=x/√ε, |x|≤ε^{−1/12}, has ε(1+|ν|)=O(ε^{5/12}).
- At m=1, if w is positive and ν=−m log(1/w)/ε−1, a factor can vanish: a fixed displacement bound that permits this cannot be used.

Source passages: [Asymptotics of Nahm sums at roots of unity](https://d-nb.info/1217648526/34), Lemma 2.1, (4)–(5), and §4.1; [Nahm’s conjecture: asymptotic computations and counterexamples](https://arxiv.org/pdf/1104.4008), Lemma 2.2(ii), proof (2.3)–(2.4), PDF pp. 3–4.

### A global modulus estimate for finite q-factorials

**HabiroNahmSeries:HB.4/finite-product-modulus-estimate** (theorem).

Fix ζ primitive of order m≥1. There are C>0 and ε₀>0 such that for every n≥0 and 0<ε<ε₀, with q=ζe^{−ε/m} and u=εn, | log |(q;q)_n| − [Li₂(e^{−u})−π²/6]/(mε) | ≤ C(1+|log ε|). At u=0 the numerator is zero, using Li₂(1)=π²/6. This is a modulus estimate valid for all n, not a positivity assertion about the complex summand.

Proof route:

1. Group j=mb+t, t=1,…,m. The undeformed block identity ∏_t(1−ζ^t r)=1−r^m controls its absolute logarithm. For b≥1 compare the actual radial offsets with r=e^{−bε}; the summed error is O(∑_{b≤1/ε}1/b)+O(1), uniformly in the final cutoff.
2. Treat the b=0 block separately; its ζ^m=1 factor has logarithm O(log ε), and all other factors are bounded away from zero. An incomplete final block contributes O(1+|log ε|).
3. Compare the monotone Riemann sum for log(1−e^{−v}) to its integral, including the integrable logarithmic singularity at zero. The primitive is Li₂(e^{−v}); the accumulated error has the same logarithmic bound.

Direct inputs: HabiroNahmSeries:HB.4/q-pochhammer-symbols, Polylogarithms:P.1/classical-polylogarithm, HabiroNahmSeries:HB.4/analytic-convergence-and-branch-comparison.

Acceptance checks:

- n=0 gives both main terms zero.
- m=1 is the usual finite real Euler-product estimate.
- At m=3 an individual phase-free summand can be complex, although its modulus satisfies the bound.

Source passages: [Nahm’s conjecture: asymptotic computations and counterexamples](https://arxiv.org/pdf/1104.4008), Lemma 2.2(i), PDF p. 3; [Asymptotics of Nahm sums at roots of unity](https://d-nb.info/1217648526/34), §4.3, (27), Claims 2–3.

### Global Gaussian domination of the summands

**HabiroNahmSeries:HB.4/saddlepoint-global-domination** (theorem).

Let A be symmetric positive definite, B,C real, z∈(0,1)^N the distinguished Nahm solution, s=−log z, H=A+diag(z_i/(1−z_i)), and Λ=Nπ²/6−∑Li₂(z_i)−½∑log z_i log(1−z_i). H is positive definite and det H>0. For fixed ζ of order m, there are c,M,L,ε₀>0 with |e^{−Λ/(mε)} e^{−εQ(n)/m}/∏_i(q;q)_{n_i}| ≤ M ε^{−L} exp(−c∑_i[√ε(n_i−s_i/ε)]²) for all n∈N^N and 0<ε<ε₀. Consequently the normalized sum outside max_i|√ε(n_i−s_i/ε)|≤ε^{−1/12} is O(ε^K) for every K, including each congruence subsum.

Proof route:

1. For u≥0 use f_A(u)=½uᵀAu+∑Li₂(e^{−u_i}). Its interior Hessian is A+diag(1/(e^{u_i}−1)); strong convexity extends to the boundary by continuity and gives f_A(u)−f_A(s)≥c₀|u−s|².
2. Insert the global product estimate. The exponent is [Nπ²/6−f_A(u)]/(mε)−B·u/m−εC/m. Complete the square to absorb the linear term, keeping a constant times a power of ε.
3. Compare the shifted Gaussian lattice tail to integrals/cubes uniformly in the shift. Its bound is a power of ε times exp(−c′ε^{−1/6}), smaller than every ε^K. Positivity is used for the majorant, not the complex summand.

Direct inputs: HabiroNahmSeries:HB.4/finite-product-modulus-estimate, HabiroNahmSeries:HB.3/distinguished-solution, HabiroNahmSeries:HB.4/summand-tail-bound, mathlib:Matrix.PosDef.det_pos, mathlib:integral_gaussian.

Acceptance checks:

- For A=(2), z=(√5−1)/2, H=2+z/(1−z) and the determinant branch is positive.
- The same bound holds when the Gauss sum vanishes; it never divides by the leading coefficient.
- Positive semidefiniteness alone is insufficient; the theorem retains positive definiteness.

Source passages: [Nahm’s conjecture: asymptotic computations and counterexamples](https://arxiv.org/pdf/1104.4008), Lemma 2.1 and Theorem 2.3, PDF pp. 2, 5–7; [Asymptotics of Nahm sums at roots of unity](https://d-nb.info/1217648526/34), §2, (6)–(9); §4.3, Claim 2.

### Uniform local saddle expansion and integrated remainders

**HabiroNahmSeries:HB.4/uniform-local-saddle-remainder** (theorem).

In the parent corrected summand expansion let t=√ε and write R_k(x,t)=exp[−(B·x)t/m−(C+N/24)t²/m+∑_i ψ_{ζ^{k_i}θ_i,ζ}(x_i/t,t²)]=∑_{p≥0}P_{k,p}(x)t^p, θ_i=z_i^{1/m}>0. Each P_{k,p} is a polynomial of total degree≤3p, P_{k,0}=1, and P_{k,p}(−x)=(−1)^pP_{k,p}(x). On max|x_i|≤ε^{−1/12}, for every K one can choose finite J,P so that the local error after truncation is bounded by C_K ε^K(1+|x|^{M_K})e^{−c|x|²} after multiplication by the corrected Gaussian. Thus the lattice-scaled absolute error ε^{N/2}∑|error| is O(ε^K), uniformly in the residue and shifted lattice. One safe choice is J=12(K+1), P=4(K+1), retaining all terms p<P; Gaussian parity then removes the odd terms, and only p<2K contribute to the target truncation.

Proof route:

1. Each Bernoulli term ε^{r−1}ν^j=t^{2r−2−j}x^j has positive t-order after the removed r=2,j=2 term; j≤r gives j≤3p and j≡p mod 2. Exponentiation preserves these degree/parity bounds. The C+N/24 and negative B terms must remain.
2. On the fixed window, ε(1+|ν|)=O(ε^{5/12}). The compact product bound with J=12(K+1) has order at least (5J−7)/12>K. A t^p polynomial of degree≤3p has window size O(ε^{p/4}), so P=4(K+1) controls the exponential Taylor tail.
3. Use a weaker Gaussian to dominate the small exponential perturbation and its polynomial factors. The remaining finitely many terms p≥2K are bounded after summation by their Gaussian moments. This proves an absolute, integrated remainder rather than a relative one.

Direct inputs: HabiroNahmSeries:HB.4/compact-pochhammer-remainder, HabiroNahmSeries:HB.4/saddlepoint-global-domination, HabiroNahmSeries:HB.4/summand-asymptotics, HabiroNahmSeries:HB.4/formal-gaussian-integration, HabiroNahmSeries:HB.4/gaussian-moments, mathlib:Asymptotics.IsBigO.

Acceptance checks:

- In one dimension P₁ has a cubic contribution, of order √ε, rather than order ε³.
- Odd p integrates to zero; the resulting expansion uses ε, not √ε.
- At A=(2), B=C=0, m=1 the first normalized coefficient is −1/60; the missing eta factor gives the incorrect +1/40.

Source passages: [Asymptotics of Nahm sums at roots of unity](https://d-nb.info/1217648526/34), Proposition 2.2 and §4.3, Claims 2–3, (31)–(32); [Nahm’s conjecture: asymptotic computations and counterexamples](https://arxiv.org/pdf/1104.4008), Theorem 2.3 proof, PDF pp. 5–7.

### Poisson summation with the exact lattice covolume

**HabiroNahmSeries:HB.4/poisson-covolume-comparison** (comparison).

For a real positive-definite H, m≥1, complex polynomial P and arbitrary real shift b, put h=m√ε. Uniformly in b modulo hZ^N, h^N∑_{v∈Z^N}P(b+hv)e^{−(b+hv)ᵀH(b+hv)/(2m)} differs from ∫_{R^N}P(x)e^{−xᵀHx/(2m)}dx by O(ε^K) for every K. Cutting off max|x_i|≤ε^{−1/12} preserves that conclusion. Hence the unscaled sum has factor m^{−N}ε^{−N/2}, not (mε)^{−N/2}. The Gaussian integral for P=1 is (2πm)^{N/2}/√det H, with the positive square root.

Proof route:

1. Iterate the pinned one-dimensional Schwartz Poisson identity using Fubini; polynomial times positive-definite Gaussian has the required integrability, including after partial Fourier transforms.
2. The transformed function is a polynomial times a Gaussian for H⁻¹. All nonzero dual modes are uniformly exponentially small; shift phases have modulus one. General Schwartz smoothness alone would give arbitrary-power decay, not exponential decay.
3. Use the global Gaussian window estimate to remove the cutoff. The volume of a lattice cell is h^N; combine it with the Gaussian determinant integral before simplifying powers of m.

Direct inputs: HabiroNahmSeries:HB.4/lattice-sums-by-poisson-summation, HabiroNahmSeries:HB.4/gaussian-moments, HabiroNahmSeries:HB.4/saddlepoint-global-domination, mathlib:SchwartzMap.tsum_eq_tsum_fourier, mathlib:integral_gaussian, mathlib:Matrix.PosDef.det_pos.

Acceptance checks:

- N=1,P=1,H=1 gives sum asymptotic √(2πm)/(m√ε).
- For odd P the integral is zero and the absolute error remains valid.
- Replacing the spacing by mD√ε gives exactly D^{−N} times the main coefficient.

Source passages: [Asymptotics of Nahm sums at roots of unity](https://d-nb.info/1217648526/34), §4.3, Claim 4, (33)–(35) and following display.

### Congruence splitting without nonzero leading coefficients

**HabiroNahmSeries:HB.4/cancellation-safe-congruence-remainder** (theorem).

For a rational Q with C=0, odd m coprime to a denominator d, D a strong denominator divisible by d with gcd(m,D)=1, use the parent exact CRT split into k mod m and k′ mod D. For every K, e^{−Λ/(mε)}(f^{[k,k′]}(ε)−D^{−N}f^{[k]}(ε))=O(ε^K), uniformly in the finitely many classes. This difference formulation holds whether either leading coefficient vanishes. Substituting into the exact split yields the normalized radial expansion with the finite factor G(Q,a/m)=D^{−N}∑_{k′}exp(2πi ᾱQ(k′)), ᾱ=am⁻¹ mod D. No division by G is used.

Proof route:

1. CRT identifies each joint residue class with a shifted lattice of spacing mD√ε. The local coefficient polynomials are identical for classes with the same k mod m.
2. Apply the absolute remainder and Poisson estimates to both lattice spacings. Their coefficients differ by D^{−N}; subtracting cancels every coefficient, even a zero one.
3. Sum over k′ with its phase in the exact parent splitting identity. The finite sum is the Gauss factor. This replaces GZ Claim 1’s ambiguous relative asymptotic notation by an absolute flat difference.

Direct inputs: HabiroNahmSeries:HB.4/gauss-sum-and-congruence-splitting, HabiroNahmSeries:HB.4/uniform-local-saddle-remainder, HabiroNahmSeries:HB.4/poisson-covolume-comparison, mathlib:Asymptotics.IsBigO.

Acceptance checks:

- A=(1),B=0,m=3 has strong D=2 and G=(1−1)/2=0.
- The normalized full expansion is flat in that example.
- For integer-valued Q choose D=1: G=1 and no auxiliary phase field is needed.

Source passages: [Asymptotics of Nahm sums at roots of unity](https://d-nb.info/1217648526/34), §4.3, (24)–(30), Claim 1.

### The analytic all-orders radial theorem with explicit constants

**HabiroNahmSeries:HB.4/radial-analytic-remainder-comparison** (theorem).

The analytic component of the parent radial-asymptotic-expansion holds in the strong, cancellation-safe sense: for every K≥0, e^{−Λ/(mε)}f_{A,B,0}(a/m+iε/(2πm))−∑_{j<K}a_j ε^j=O(ε^K). The coefficients are exactly those of χ_{a,m}^N m^{−N/2}c(Q)G(Q,a/m)S_{Q,ζ}(ε), with c(Q)=(det H)^{−1/2}∏θ_i^{B_i}(1−z_i)^{1/2−1/m}, S and I as in the parent corrected formula, and χ_{a,m}=m^{−1/2}exp[(1/m)∑_{t=1}^{m−1}t Log(1−ζ^t)]=exp(πi s(a,m)). The I integrand is exp[−B·x√ε/m−Nε/(24m)+∑ψ], and the Gaussian is exp(−xᵀHx/(2m)). All roots of positive real numbers and √det H are positive; cyclic-dilogarithm roots are defined by the weighted factor logarithms. For C≠0 multiply the coefficient series by exp(2πiaC/m) exp(−Cε/m). This theorem is solely radial ε→0+; it has no sectorial, minor-arc or arbitrary knot-matrix conclusion.

Proof route:

1. Use the corrected Euler reciprocal expansion, compact local expansion, global tail bound, and CRT theorem. Their bounds are uniform at each fixed order, which permits finite sums and lattice summation.
2. Combine (ε/2π)^{N/2}, the lattice factor m^{−N}ε^{−N/2}, and Gaussian integral (2πm)^{N/2}(det H)^{−1/2}. This gives exactly m^{−N/2}(det H)^{−1/2}.
3. Integrate each polynomial with the imported formal Gaussian bracket. Odd polynomial terms vanish and even terms give the ε-series. The analytic proof never invokes Kummer invariance; its field-of-definition assertion is separated below.

Direct inputs: HabiroNahmSeries:HB.4/radial-asymptotic-expansion, HabiroNahmSeries:HB.4/euler-function-at-a-root-of-unity, HabiroNahmSeries:HB.4/cyclic-dilogarithm-interface, HabiroNahmSeries:HB.4/uniform-local-saddle-remainder, HabiroNahmSeries:HB.4/cancellation-safe-congruence-remainder, HabiroNahmSeries:HB.4/poisson-covolume-comparison, HabiroNahmSeries:HB.4/formal-gaussian-integration, mathlib:Asymptotics.IsBigO.

Acceptance checks:

- For m=1,A=(2),B=0, z=(√5−1)/2, a₀=[H(1−z)]^{−1/2} and a₁=−a₀/60.
- The root a=2,m=3 uses the Dedekind phase for 2/3, not the printed phase for 1/3.
- G=0 makes every a_j zero; the strong remainder remains meaningful.

Source passages: [Asymptotics of Nahm sums at roots of unity](https://d-nb.info/1217648526/34), Theorem 3.1, (17)–(20), §4.2 (21)–(23), §4.3 (36); [Bloch groups, algebraic K-theory, units, and Nahm’s conjecture](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf), §7.1, Theorem 7.1 and Remark 7.3, p. 419.

### Coherent radical fields for the expansion coefficients

**HabiroNahmSeries:HB.4/coherent-radical-coefficient-fields** (construction).

The field definitions are total for real coordinates; their expansion uses require d,m≥1, gcd(d,m)=1, z∈(0,1)^N and ζ primitive of order m. Put y_i=z_i^{1/d}>0, η_i=z_i^{1/(dm)}>0 and θ_i=η_i^d=z_i^{1/m}. Construct E=Q(y_1,…,y_N,ζ) and H_rad=E(η_1,…,η_N) as Mathlib IntermediateField.adjoin inside C. If dA and dB are integral, every θ_i^{A_ij} means η_i^{dA_ij}, and θ_i^{B_i} means η_i^{dB_i}; this fixes the algebraic branches of the analytic positive powers. One has H_rad=E(θ_i), since Bezout dα+mβ=1 gives η_i=θ_i^αy_i^β. It is a finite Kummer extension of E; not every vector of root multipliers need define an automorphism. For the Gauss factor of rational Q also use K=E(ζ_D), D a strong denominator of Q chosen compatibly with the CRT split. Neither E=Q(z,ζ) nor K=E is asserted.

Proof route:

1. Use the imported positive root lift and Real.rpow identities for the positive embedding. Adjoin the displayed generators with the existing intermediate-field constructor.
2. Prove η_i^m=y_i and θ_i^m=z_i. All generators are nonzero; Bezout gives the equality of radical fields without a new root choice.
3. An E-automorphism sends η_i to ζ^{s_i}η_i and θ_i to ζ^{ds_i}θ_i, subject to all algebraic relations. Gaussian coefficients use H⁻¹ with entries in E; the finite congruence weights and negative-index polylogarithms are rational expressions in H_rad.

Direct inputs: HabiroNahmSeries:HB.3/positive-coherent-root-lift, mathlib:IntermediateField.adjoin, mathlib:IsPrimitiveRoot, HabiroNahmSeries:HB.4/kummer-invariance-of-the-expansion, HabiroNahmSeries:HB.4/gauss-sum-and-congruence-splitting.

This construction exports the definitions **radialBaseField** and **radialKummerField**, with the following API.

| Declaration | Role | Contract |
|---|---|---|
| radialBaseField_eq_adjoin | characterisation | radialBaseField(d,z,ζ)=IntermediateField.adjoin Q ({z_i^(1/d)}∪{ζ}), where all real powers are cast to C. |
| radialKummerField_eq_adjoin | characterisation | radialKummerField(d,m,z,ζ)=IntermediateField.adjoin Q ({z_i^(1/d)}∪{ζ}∪{z_i^(1/(dm))}). |
| radialBaseField.root_mem | projection | The positive d-th root of each z_i and ζ belong to radialBaseField(d,z,ζ). |
| radialKummerField.base_le | structure | radialBaseField(d,z,ζ)≤radialKummerField(d,m,z,ζ). |
| radialKummerField.radical_mem | projection | The positive (dm)-th root of every z_i belongs to radialKummerField(d,m,z,ζ). |
| radialKummerField.theta_mem | compatibility | For d,m>0 and positive z_i, the positive m-th roots belong to radialKummerField(d,m,z,ζ). |
| radialKummerField.eq_theta_adjoin | characterisation | If d,m>0 and coprime and z_i>0, radialKummerField equals Q(y_i,ζ,θ_i), with positive powers interpreted inside C. |

Discriminating unit tests:

- **radialFields_order_one** (degenerate): For m=1 and d>0, radialKummerField(d,1,z,1)=radialBaseField(d,z,1).
- **radialFields_integral_case** (compatibility): For d=m=1, both fields equal IntermediateField.adjoin Q {z_i}.
- **radialFields_trivial_coordinates** (computation): If z_i=1 for every i and d,m>0, both fields equal Q(ζ).
- **radialFields_nontrivial_radical** (non-example): For rank one, d=2,m=3,z=1/4 and ζ=exp(2πi/3), radialBaseField is strictly smaller than radialKummerField; the latter contains the positive cube root of 1/2.

Recorded uses: HabiroNahmSeries:HB.4/coefficientwise-kummer-descent-interface — Specifies which automorphisms fix the coefficient base and how rational powers transform.; HabiroNahmSeries:HB.4/cgz-normalization-and-field-comparison — Separates the coordinate, coherent-root, radical and Gauss-value fields for rational data..

Acceptance checks:

- At d=m=1,ζ=1 both fields are Q(z).
- At m=1 the radical extension is trivial even when d>1.
- For d=2,m=3,z=1/4, E=Q(ζ₃) while H_rad adjoins the positive cube root of 1/2 and is a genuine extension.

Source passages: [Asymptotics of Nahm sums at roots of unity](https://d-nb.info/1217648526/34), Theorem 3.1, (20); §3 rational-power convention.

### The precise all-orders Kummer descent interface

**HabiroNahmSeries:HB.4/coefficientwise-kummer-descent-interface** (theorem).

With the coherent E,H_rad above, d clearing A,B,Q and m odd coprime to d, take the parent corrected finite sum T(η,ε) and C(θ)=∏_iD_ζ(ζθ_i). Each coefficient of T lies in H_rad. The exact missing assertion is σ(C(θ)^{−1}T(η,ε)^m)=C(θ)^{−1}T(η,ε)^m coefficientwise for every σ∈Aut_E(H_rad), with σ(η_i)=ζ^{s_i}η_i and σ(θ_i)=ζ^{ds_i}θ_i. It implies S(ε)^m∈E[[ε]]. This node specifies the parent field target with coherent rational powers; a proof of the displayed automorphism identity has not been established in the sources read and remains the named gap, not an inference from its constant term.

Proof route:

1. Negative-index polylogarithms, Bernoulli coefficients and Gaussian moments show T_p∈H_rad coefficientwise, using coherent η rather than unspecified θ^(1/d).
2. The required proof must combine the cyclic-dilogarithm transformation with reindexing the finite congruence sum and a formal Gaussian translation that transforms the complete exp(∑ψ) integrand. Reindexing the constant prefactors alone does not prove an all-orders identity.
3. Once the exact identity is proved, finite Kummer Galois fixed-field descent over E puts every coefficient in E. The parent lemma’s proposed reindexing is the starting interface, not evidence that this step has already been discharged.

Direct inputs: HabiroNahmSeries:HB.4/coherent-radical-coefficient-fields, HabiroNahmSeries:HB.4/kummer-invariance-of-the-expansion, HabiroNahmSeries:HB.4/formal-gaussian-integration, HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm, mathlib:PowerSeries.coeff.

Acceptance checks:

- For m=1 no root automorphism remains, so coefficient descent follows directly from Gaussian moments.
- The first two coefficient orders are separate checks, not a replacement for the identity at arbitrary p.
- The proof must act on η_i, sending θ_i to ζ^{ds_i}θ_i; treating θ_i→ζθ_i while leaving its rational powers fixed is invalid.

Source passages: [Asymptotics of Nahm sums at roots of unity](https://d-nb.info/1217648526/34), Theorem 3.1, (20), and §4.3 entire proof.

### CGZ normalization with separated coefficient and Gauss fields

**HabiroNahmSeries:HB.4/cgz-normalization-and-field-comparison** (comparison).

Choose d clearing A,B,Q and odd m coprime to d. For the corrected radial series put ω=m^{−N/2}(det H)^{−1/2}∏(1−z_i)^{1/2}>0, μ_{a,m}=χ_{a,m}^N and Φ=G(Q,a/m)∏θ_i^{B_i}(1−z_i)^{−1/m}S. Then ω²∈Q(z)^× and f_{A,B,0}(τ)=μ_{a,m}ωe^{Λ/(mε)}(Φ_{<K}(ε)+O(ε^K)) for every K. Conditional on the exact Kummer identity, Φ^m∈K[[ε]], K=Q(z_i^{1/d},ζ,ζ_D); for integral A with even diagonal and integral B, take d=D=1 and K=Q(z,ζ). Integer-valued Q with half-integral B still requires the B-root field for this displayed normalization. The full arithmetic CGZ package additionally requires the constant Kummer class [Φ(0)^m]=[P_ζ(β)D_ζ(1)^N]^{−1}, interpreted in H_rad^×/H_rad^{×m} and only when Φ(0)≠0, and the specified χ^{−1} eigenspace statement over the coefficient base. For arbitrary rational Q the compatible Bloch class is β=∑[z_i] over Q(z_i^{1/d}), not an unverified integral class over Q(z_i). The rational-data Kummer-class/eigenspace comparison with the Gauss factor is a separate recorded gap. No root of a quotient class is presented as a chosen element.

Proof route:

1. Factor c(Q) into the positive ω and ∏θ_i^{B_i}(1−z_i)^{−1/m}. The analytic statement is purely algebraic rearrangement of the radial theorem.
2. Raise Φ to m. The rational powers become z_i^{B_i}∈Q(y), the (1−z) factors are in E and G is in Q(ζ_D). The coefficient claim follows from the separate descent identity in exactly K.
3. Import the cyclic near-unit map, coherent integral Bloch class, and the parent simplified theorem only for the arithmetic comparison under its required compatibility. The published CGZ (46) must be read as a Kummer-class statement. Its fixed μ is not used as a universal phase for all numerators a.

Direct inputs: HabiroNahmSeries:HB.4/radial-analytic-remainder-comparison, HabiroNahmSeries:HB.4/coefficientwise-kummer-descent-interface, HabiroNahmSeries:HB.4/coherent-radical-coefficient-fields, HabiroNahmSeries:HB.4/simplified-form-and-the-unit, HabiroNahmSeries:HB.3/coherent-root-exterior-boundary, HabiroNumberFields:HB.2/kummer-value-P.

Acceptance checks:

- For A=(2),B=0, d=D=1, Φ^m is targeted in Q(z,ζ).
- For A=(1),B=1/4,m=1 the leading coefficient is 2^(−1/4), whose square is not in F=Q(z)=Q. The coherent root field is necessary; for integer-valued Q with B=1/2 the displayed Φ₀ is √2 rather than rational.
- For A=(1),B=0,m=3, G=0 and Φ=0; no multiplicative class is formed.
- For rational A,B the Gauss-value extension is explicit, rather than absorbed into a scalar whose square is claimed to lie in Q(z).

Source passages: [Bloch groups, algebraic K-theory, units, and Nahm’s conjecture](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf), Theorem 7.1, (45)–(46), p. 419; [Asymptotics of Nahm sums at roots of unity](https://d-nb.info/1217648526/34), Theorem 3.1, (15), (17)–(20).

### Unit descent and the nonzero constant-term condition

**HabiroNahmSeries:HB.4/nonzero-unit-series-descent-comparison** (comparison).

Let K⊆L be characteristic-zero fields, m≥1, Φ∈L[[ε]] with Φ₀≠0 and Φ^m∈K[[ε]]. Then U=Φ/Φ₀ belongs to K[[ε]]: it is the unique series with U₀=1 and U^m=Φ^m/Φ₀^m. If a representative ε_β∈K^× of R_ζ(β) and a chosen compatible m-th root satisfy ε_β^{1/m}Φ₀∈K^×, then ε_β^{1/m}Φ∈K[[ε]]. Apply this to the radial coefficients only after the preceding arithmetic comparison and the supplier hypotheses (including gcd(m,w_K)=1 where the representative comparison uses it). If Φ₀=0, neither normalization nor this corollary is asserted; the analytic remainder theorem still applies.

Proof route:

1. Compare successive coefficients of U^m. At order p the new coefficient is mU_p plus a polynomial in preceding coefficients; characteristic zero allows division by m and inductively puts U_p in K.
2. The same recursion proves uniqueness of a root with constant term one. It does not require analytic convergence of the formal series.
3. For the near-unit corollary, multiply the descended U by the given scalar in K. The scalar membership is exactly the arithmetic constant-term comparison, not a conclusion of the recursion alone.

Direct inputs: HabiroNahmSeries:HB.4/unit-corollary-and-nonvanishing, HabiroNahmSeries:HB.4/cgz-normalization-and-field-comparison, mathlib:PowerSeries.coeff, HabiroNumberFields:HB.2/the-map-R-zeta.

Acceptance checks:

- m=1 is immediate.
- For Φ=0 the radial theorem is valid but U is not defined.
- Φ₀≠0 is required; Φ=ε with zero constant cannot be normalized by Φ₀.

Source passages: [Bloch groups, algebraic K-theory, units, and Nahm’s conjecture](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf), Corollary 7.2 and its proof; Remark 7.3, p. 419.

### Andrews–Gordon suppliers and radial acceptance cases

**HabiroNahmSeries:HB.4/andrews-gordon-owner-and-acceptance-comparison** (comparison).

Use the existing QM.0/andrews-gordon-identities and QM.0/andrews-gordon-nahm-form, not a new identity in HB.4. For odd n=2r+3, A_ij=2min(i,j), B=0, the product excludes k≡0,±(r+1) mod n (equivalently 2k≡0,±1). The distinguished solution is (X₂,…,X_{r+1}), X_j=1−[sin(π/n)/sin(πj/n)]². With the requested Rogers trigonometric identity, Λ=(n−3)π²/(6n). The parent radial constant and acceptance nodes supply the phase e(n/24−1/8+1/(12n)−1/(4n²)) at ζ=e(1/n). The general Andrews–Gordon source gap is resolved by the existing supplier; the Rogers circle-valued and trigonometric identity request remains with Polylogarithms:P.1.

Proof route:

1. Compare the quadratic form with the supplier’s min(i,j) Nahm form; its tail-sum convention and reversed coordinates account for the ±(r+1) product classes at B=0.
2. Check the trigonometric tuple against the Nahm equation; X₁=1 cannot be a coordinate of the positive distinguished solution. The ordered tuple X₂,…,X_{r+1} passes already in rank two.
3. Combine the product identity and eta-theta radial expansion as in the parent acceptance theorem. Import the Rogers dilogarithm identity from its owner to identify Λ; do not replan the real regulator here.

Direct inputs: QSeriesPartitionsAndMockModularForms:QM.0/andrews-gordon-identities, QSeriesPartitionsAndMockModularForms:QM.0/andrews-gordon-nahm-form, HabiroNahmSeries:HB.4/andrews-gordon-radial-constant, HabiroNahmSeries:HB.4/acceptance-andrews-gordon, Polylogarithms:P.1.

Acceptance checks:

- r=1,n=5 recovers the first Rogers–Ramanujan identity and Λ=π²/15.
- r=2,n=7 checks the tuple ordering for A=((2,2),(2,4)).
- r=0,n=3 gives the empty sum 1 and Λ=0.

Source passages: [Bloch groups, algebraic K-theory, units, and Nahm’s conjecture](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf), §7.2, (47) and proof of Theorem 7.4, pp. 420–422; [The Dilogarithm Function](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf), II.2C and II.3C(b), pp. 39–41, 53–54.

## Baseline and missing inputs

The reviewed audit finds no analytic Nahm sum or cyclic-dilogarithm implementation at the pins. The pinned Tau Ceti source was searched for Nahm, q-Pochhammer and cyclic-dilogarithm declarations; hits for ordinary rising/falling Pochhammer polynomials are unrelated. Mathlib already contains Euler-product convergence and holomorphy, scalar Gaussian integration, one-dimensional Schwartz Poisson summation, positive-definite determinant positivity, power-series coefficients, intermediate-field adjoining and asymptotics. These are imported, not planned again. Product and field notation uses those existing carriers.

- [mathlib:multipliable_one_sub_of_summable](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Log/Summable.lean): Norm-summability of f gives Multipliable (1−f) in a complete normed ring.
- [mathlib:tprod_one_add_ne_zero_of_summable](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Log/Summable.lean): For all 1+f_i nonzero and summable norms, the product is nonzero; CompleteSpace and NormMulClass are required.
- [mathlib:Complex.cexp_tsum_eq_tprod](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Log/Summable.lean): Exponentiating a convergent sum of principal logs equals the product when every factor is nonzero.
- [mathlib:ModularForm.multipliable_one_sub_pow](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/DedekindEta.lean): Euler factors 1−q^(n+1) are multipliable for norm q<1.
- [mathlib:ModularForm.differentiableOn_tprod_one_sub_pow](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/DedekindEta.lean): The Euler product is differentiable on the open unit disc.
- [mathlib:Matrix.PosDef.det_pos](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Matrix/PosDef.lean): Positive-definite finite matrices have positive determinant.
- [mathlib:integral_gaussian](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean): Real one-dimensional Gaussian integral sqrt(π/b), used with b>0.
- [mathlib:SchwartzMap.tsum_eq_tsum_fourier](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/PoissonSummation.lean): One-dimensional Poisson summation for Schwartz functions at a real shift.
- [mathlib:Asymptotics.IsBigO](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Asymptotics/Defs.lean): Eventual norm inequality with an existential constant at a specified filter.
- [mathlib:IntermediateField.adjoin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean): Intermediate field generated by a set in an ambient extension.
- [mathlib:PowerSeries.coeff](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Basic.lean): Linear coefficient extraction for ordinary formal power series.
- [mathlib:Polynomial.bernoulli](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/BernoulliPolynomials.lean): Bernoulli polynomials over Q, with negative Bernoulli-number convention.
- [mathlib:IsPrimitiveRoot](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean): Primitive root predicate: ζ^m=1 and m divides every exponent giving 1.

The remaining inputs are exact, not a generic request for more analysis:

- **Coefficientwise Kummer invariance is not proved in the read source**. Prove σ(C(θ)^{−1}T(η,ε)^m)=C(θ)^{−1}T(η,ε)^m for every actual E-automorphism, with η_i→ζ^{s_i}η_i and θ_i→ζ^{ds_i}θ_i. Establish the formal Gaussian translation on the full corrected exp(∑ψ) integrand, including class wraparound and coherent rational powers. GZ (20) states the result; §4.3 proves only the analytic expansion. The constant-term cyclic-dilogarithm transformation alone is insufficient.
- **Rational-data arithmetic normalization requires reconciliation**. Reconcile the parent simplified unit/eigenspace assertion with β over the coherent d-root field and with G(Q,a/m) in Q(ζ_D). Supply the precise Kummer-class transformation over K=Q(y,ζ,ζ_D), or prove an explicitly stated smaller field suffices. Do not apply CGZ’s fixed μ and F=Q(z) to arbitrary rational data. The analytic formula and its coefficient field conditional on invariance are specified independently.
- **Rogers and trigonometric dilogarithm owner input**. The exact Polylogarithms:P.1 request below is still unsupplied. The q-series identity itself now has supplier nodes and is not a remaining gap.

The sole owner request is **Polylogarithms:P.1**: Supply L_std on P¹(R) modulo (π²/2)Z, the comparison L_CGZ=π²/6−L_std, its five-term/CGZ integral-relation descent and the trigonometric identity for X_j=1−[sin(π/n)/sin(πj/n)]² giving ∑_{j=2}^{(n−1)/2}L_CGZ(X_j)=(n−3)π²/(6n). The classical Li and distribution nodes already exist and are imported. This retains the exact parent/HB.3 owner request, rather than defining a second Rogers regulator.

The former general Andrews–Gordon request is supplied by the two QM.0 nodes. Their current packet remains subject to its own independent revision; this part uses the displayed identity and min-matrix specialization, which were checked against the CGZ product classes.

## Source collation and review checks

GZ's journal formulas still contain the parent phase, integrand and lattice-normalization errors; its all-orders field assertion still lacks the required proof. The published Proposition includes exp ψ, unlike the preprint in that location, while its definition (14) still omits the exponential. The reader therefore follows the corrected parent formula and the exact factor-log branch described above. A separate finding distinguishes arbitrary-power Schwartz decay from exponential Gaussian decay. CGZ's published Theorem 7.1 retains the broad root-order/field wording and the quotient-class root notation; those are restricted explicitly in the contracts.

The six version-specific findings, their reasons and correction searches are in sourceIssues. They collate the accepted parent findings against the published text; the general Fourier-decay finding is additional. The Vlasenko–Zwegers publisher PDF was inaccessible, so only its freely readable preprint is cited. The GZ and CGZ published PDFs, both named arXiv versions and Zagier's public chapter were read; URLs, access dates and SHA-256 hashes are in the packet.

The parent has four HB.4 planets. This continuation adds **Uniform Pochhammer remainder** and **Radial remainder bounds**, for six in the combined layer. Every added definition, API item and unit test has a named counterpart in the suggested Lean file. Statements involving unavailable formal Gaussian, Bloch or near-unit types are recorded there as exact mathematical interfaces without empty substitute objects.
