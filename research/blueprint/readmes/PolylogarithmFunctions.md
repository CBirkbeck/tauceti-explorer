# Polylogarithm functions

This roadmap builds the analytic functions behind dilogarithmic and higher polylogarithmic formulas. Its starting point is the complex-analysis library: logarithms, integration, analytic uniqueness, Bernoulli polynomials and topology of paths. Its endpoints are functional equations with honest branch conventions, Zagier’s real single-valued functions, the Bloch–Wigner five-term identity, the interval Rogers pentagon and estimates that can be used in exact arithmetic arguments. Every classical integer weight is included. For positive weights a branch always means continuation of the specified principal germ, and the complete continuation tower is kept coherent.

The analytic construction has no arithmetic prerequisites. In particular a complex embedding of any number field can be used as an argument without a restriction to a particular field. Algebraic symbols, pre-Bloch and Bloch groups, integral torsion, K-theory, regulator descent, geometric volume comparisons and period-normalized regulator maps belong to Polylogarithms P.2 onward, K3BlochGroups and BorelRegulators. Formal power series over general rings and p-adic polylogarithms remain with ColemanIntegration. The cyclic quantum dilogarithm and its Kummer classes belong to HabiroNumberFields; the complex function here does not replace them. The analytic five-term identity is proved before it is used to descend an algebraic map.

## Conventions and existing inputs

Write Ω=ℂ∖[1,∞) and X=ℂ∖{0,1}. Log and Arg use Mathlib’s principal logarithm, with Arg in (−π,π]. Thus −Log(1−x) for real x>1 is the **lower** classical boundary value. The upper-minus-lower discontinuity and the change from a counterclockwise loop about 1 have opposite signs. The functions are total in the suggested signatures, but an assigned value at a pole never supplies an analytic theorem there. Real log|z| uses the real logarithm of the complex norm, and its derivative is Re(v/z) only for z≠0.

The Bernoulli convention is B₁=−1/2, the existing `bernoulli`, and Bₙ(t) denotes the existing Bernoulli polynomial. Put cₖ=2^kBₖ/k!. The projection πₙ:ℂ→ℝ is Re when n is odd and Im when n is even. This fixes scalar Lₙ; a map into a Tate line uses a separate period convention supplied by its arithmetic owner. For positive n, ζ(n) means the existing Riemann zeta value when n≥2, with its real value understood where a real endpoint is required. No ζ(1) value is used.

An expression containing several classical weights on a branch uses all those weights continued along the same path from b=1/2. Inversion or a five-term formula uses the corresponding argument paths and logarithms together. Independent arbitrary branch choices require the explicit monodromy corrections. All integer powers of a root-count m are interpreted in a field with m≠0; a negative weight is not truncated to a natural exponent.

For analytic projective formulas use r(a,b,c,d)=(a−c)(b−d)/((a−d)(b−c)), with cancellation limits at infinity. It satisfies r(∞,0,1,z)=z. Goncharov–Rudenko’s bracket is (a−b)(c−d)/((a−d)(c−b))=1−r(a,b,c,d)=1−1/cr(a,b,c,d); Suslin’s normalized ordering uses cr(0,∞,1,z)=z and is reciprocal to r on that ordered tuple. These coordinate dictionaries affect D by its sixfold signs. The algebraic configuration complex remains with K3BlochGroups.

The pinned baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. The library already proves the weight-one Taylor series (`Complex.hasSum_taylorSeries_neg_log'`), principal logarithm differentiation (`Complex.hasDerivAt_log`), analytic uniqueness (`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`), paired Bernoulli Fourier summation (`hasSum_one_div_nat_pow_mul_fourier`), and ζ(2)=π²/6 (`riemannZeta_two`). `HurwitzZeta.hasSum_expZeta_of_one_lt_re` already supplies the convergent unit-circle series at weights ≥2; the new target identifies its values with the z-variable polylogarithm instead of introducing a competing circle function. `MeromorphicOn.intervalIntegrable_log_norm` supplies isolated-logarithm integrability, with elementary additional control of the bounded argument and the zero endpoint. `Path.Homotopic` and Tau Ceti’s local continuous-logarithm theorem provide path and logarithm infrastructure.

The proposed Mathlib API in [PR 44531](https://github.com/leanprover-community/mathlib4/pull/44531) uses `Complex.polylog s z` with complex order s, the derivative recursion, the disc series and the same lower boundary convention. Adopt that API shape: the integer family below is its integer-weight restriction, and the logarithmic radial integral is a compatible realization. At the recorded pins that declaration is absent, so the suggested file uses its own roadmap namespace for this realization. The PR is design evidence, not an assumed theorem supplier. An external [LeanPolyLog development](https://reservoir.lean-lang.org/@rainrzk/LeanPolyLog) also addresses integral identities; no code integration is specified here. Reusing code from a separate development requires coordination with its authors and the appropriate license review.

For positivity the generic minimum principles already exist: `TauCeti.ge_of_laplacian_nonpos_ge_frontier` has compact-domain, frontier, continuity, C² and Laplacian hypotheses, and `TauCeti.eqOn_const_of_laplacian_nonpos_of_isMinOn` has open, preconnected-domain hypotheses. Their application to D is a target below. No generic PDE principle is reconstructed. A search of the pinned and current libraries and of the current upstream roadmaps finds no analytic polylogarithm or Bloch–Wigner implementation to replace these targets. The existing analytic substrate is used throughout.

Each layer below names its targets with their full mathematical statements. A proposed declaration name identifies an API contract rather than an implementation claim. The document is definitive; the compact suggested file retains only light definitions and milestones that can be stated over the pinned carriers. Branch-cover construction and the remaining API contracts are mathematical targets here.

## Layer 1: Principal polylogarithms

Construct Liₙ for every integer n, using rational Euler derivatives at n≤0, the principal logarithm at n=1 and the logarithmic interval integral at n≥2. Establish integrability, the disc series, the derivative recursion including the removable derivative at zero, holomorphy off [1,∞), conjugation there, closed-disc continuity and positive-weight endpoint values.

**Inputs:** the pinned analytic libraries. No layer takes an input from an arithmetic consumer.

### Classical polylogarithms in every integer weight

Define a total complex-valued family Liₙ, n∈ℤ. For n≤0 use (z d/dz)^(−n) applied to z/(1−z). Set Li₁(z)=−Log(1−z). For n≥2 use ((n−2)!)⁻¹∫₀¹(−log t)^(n−2)[−Log(1−tz)]dt/t, with real t and Mathlib’s Bochner integral. Values at isolated integrand singularities are its totalized values and are irrelevant almost everywhere. This chooses the lower boundary value for real z>1. No analytic assertion is made at 1 for n≤1.

**Construction or proof.** Use the rational Euler-derivative formula for nonpositive weights and the actual logarithmic interval integral for n≥2; no choice of a function satisfying desired laws replaces these definitions. Separate the natural-index integral realization from the integer-index extension, with a compatibility API. Integrability is the next target.

**API.**

- `polylog_natCast` (compatibility): The integer-index family agrees with the displayed natural-index realization for every n∈ℕ.
- `polylog_zero` (simp): Liₙ(0)=0 for every n∈ℤ.
- `polylog_one_weight` (characterisation): Li₁(z)=−Log(1−z) for every z, including the explicitly totalized value at z=1.
- `polylog_nonpos` (characterisation): For r≥0 and z≠1, Li₋ᵣ(z) is the r-fold Euler derivative of z/(1−z).
- `polylog_radial_integral` (characterisation): For n≥1 and z off [1,∞), Liₙ₊₁(z)=∫₀¹Liₙ(tz)dt/t.
- `polylog_congr_index` (extensionality): Equal integer indices give the same function.

**Uses.** Polylogarithms P.2 and HabiroNahmSeries HB.3: Evaluations of the dilogarithm under arbitrary complex embeddings require this precise analytic function. Oesterlé §3, pp. 57–58: All positive weights enter the Bernoulli single-valued combination.

**Definition checks.**

- `polylog_zero_all` (degenerate): Liₙ(0)=0 for every integer n.
- `polylog_log_compat` (compatibility): For |z|<1, the Li₁ series is exactly Complex.hasSum_taylorSeries_neg_log'.
- `polylog_zero_half` (computation): Li₀(1/2)=1.
- `polylog_neg_one` (computation): For z≠1, Li₋₁(z)=z/(1−z)².
- `polylog_not_analytic_one` (non-example): Li₀ has a pole at 1; its assigned total value cannot make it holomorphic there.

**Checks.** Every index evaluates to zero at zero. The principal convention agrees with the lower limit on the cut, rather than an artificial holomorphic continuation across it.

**Source.** [O93], §1.1–1.4, equations (1)–(7), pp. 50–51. Supplies the disc germ, differential recursion, principal continuation and endpoint conventions; the displayed logarithmic integral is the repeated radial integral evaluated by Fubini. [G95], §1.0, equation (1.1), p. 201. Fixes Li₁ and the positive-weight differential recursion.

### The logarithmic radial integral

For each natural n≥2 and each z∈ℂ, the defining integrand is interval integrable on [0,1]. For z off [1,∞), its value equals the iterated radial integral of Li₁. For z=1 and real z>1 the same integral is respectively the finite endpoint value and the lower boundary limit; a change at t=0 or t=1/z does not change it.

**Construction or proof.** Near zero, −Log(1−tz)=O(t); dominate by a constant times |log t|^(n−2), whose integral is (n−2)!. Near an interior t=1/z or the endpoint t=1, split off a bounded factor and dominate by 1+|log|t−1/z||; use the pinned meromorphic-log integrability theorem and boundedness of the argument. On compact slit subsets use the same majorants for parameter limits and Fubini. At a real cut point split a small interval around the moving logarithmic singularity and bound its integral uniformly by Cε(1+|log ε|); take the lower limit on its complement.

**Checks.** The n=2 integral at z=1 converges even though Log(1−t) is unbounded. The interior singularity for z=3 contributes an integrable logarithm, never a divergent ordinary integral.

**Source.** [O93], §1.1 and §1.4, pp. 50–51. The recursive integral and finite positive-weight endpoint give the analytic representation; this node supplies its required integrability details.

**Prerequisite targets:** principal.

### The disc series and its analytic germ

For every n∈ℤ and |z|<1, Liₙ(z)=∑_{k≥1}z^k/k^n, with complex integer powers of the nonzero natural k. The series converges absolutely and locally uniformly on the disc, and defines the analytic germ used in continuation. Its value and derivative at zero are respectively 0 and 1.

**Construction or proof.** For n≥2 expand Li₁ by the existing Taylor theorem and integrate termwise using the radial majorant and ∫₀¹t^(k−1)(−log t)^(n−2)dt=(n−2)!/k^(n−1), proved by integration by parts. For n≤0 differentiate the geometric series locally uniformly; polynomial growth of k^(−n) is dominated by any slightly larger geometric ratio. Read the constant and linear coefficients to obtain zero and the removable derivative 1.

**Checks.** The weight-one specialization is a compatibility with an existing theorem, not a replacement Taylor-series development. Li₀(1/2)=1 and Li₋₁(1/2)=2.

**Source.** [O93], §1.1, equations (1)–(3), p. 50. Gives the convergent power series and differential recursion. [Z07], Part I §1, pp. 3–6. The dilogarithm series fixes the normalization and special values.

**Prerequisite targets:** principal, integrability.

### Nonpositive weights are rational

For r≥0, Li₋ᵣ is rational on ℂ∖{1}, with Li₀=z/(1−z) and Li₋₁=z/(1−z)². Euler differentiation gives the whole family and the differential recursion. All continuation monodromy is trivial in these weights, and 1 is a genuine pole.

**Construction or proof.** Induct on r, differentiating the rational expression away from its denominator zero. For r≥1 the leading singularity is r!/(1−z)^(r+1); this proves a genuine pole and rules out using field totalization to assert analyticity at 1. The rational expressions agree with the disc germ and continue uniquely away from 1.

**Checks.** The first Euler derivative has a positive numerator z. No independent nonpositive-weight branch choices are introduced.

**Source.** [O93], §1.1, differential recursion (2), p. 50. Euler differentiation of the disc series extends the positive-index recursion to all nonpositive integer indices; the rationality assertion is its elementary consequence.

**Prerequisite targets:** principal, disc-series.

### Holomorphy and the derivative recursion

For every integer n, Liₙ is complex analytic on Ω=ℂ∖[1,∞). For z∈Ω, z·Liₙ′(z)=Liₙ₋₁(z); for z≠0 this is Liₙ′=Liₙ₋₁/z. At z=0 the derivative is 1, so the quotient formula is not asserted there. For n≥1 the radial integral recursion holds on Ω.

**Construction or proof.** Differentiate the parameter integral on compact slit neighborhoods using the local majorants from integrability; establish the recursion by integration by parts. The initial logarithm derivative comes from the pinned Log theorem; rational weights use Euler differentiation. The disc coefficient calculation handles zero, and analytic uniqueness glues the slit continuation with that germ.

**Checks.** At weight three z·Li₃′=Li₂ on Ω. For every n the derivative at zero is 1, including nonpositive n.

**Source.** [O93], §1.1, equations (2)–(3), p. 50. The recursive derivative and radial integration characterize the slit-domain continuation.

**Prerequisite targets:** integrability, disc-series, rational-weights.

### Conjugation on the slit domain

For all n∈ℤ and z∈Ω, Liₙ(conj z)=conj(Liₙ(z)). For n≥2 this extends to the closed unit disc. At real x>1 the upper and lower boundary values are conjugate, but the lower-valued total principal function need not equal its own conjugate.

**Construction or proof.** Conjugate the locally uniformly convergent disc series. Use uniqueness on the conjugation-invariant slit domain; extend to finite boundary points by one-sided limits.

**Checks.** Li₂(−1) is real. Do not state this identity for the total principal function at x=3.

**Source.** [O93], §1.1–1.3, pp. 50–51. Real series coefficients and slit continuation give conjugation; the cut convention is essential.

**Prerequisite targets:** disc-series, analytic-recursion.

### Closed-disc continuity and zeta endpoints

For every natural n≥2, the series extends uniformly to |z|≤1, equals the principal integral there, and is continuous on that closed disc. Liₙ(1)=ζ(n), where ζ is the existing Riemann zeta function. For every real a, Liₙ(exp(2πia))=HurwitzZeta.expZeta a n. The n=1 endpoint at 1 is logarithmically divergent, regardless of its totalized value.

**Construction or proof.** Apply the uniform bound ∑k^(−n)<∞ to the disc series. Abel limiting and the radial integral identify the same boundary value. Compare the unit-circle series with the pinned expZeta summation theorem, observing that its n=0 summand vanishes for positive weights. Use the existing ζ(2) evaluation rather than re-proving Euler’s value.

**Checks.** Li₂(1)=π²/6. At a=0 the exponential-zeta comparison recovers Liₙ(1)=ζ(n).

**Source.** [O93], §1.4, p. 51. Finite limits at 1 are zeta values for weights at least two. [Z07], Part I §1, pp. 5–6. The boundary values include ζ(2) and alternating-series values.

**Prerequisite targets:** integrability, disc-series.

## Layer 2: Branches and monodromy

Construct coherent analytic continuations of the positive-weight tower and Log z along every path in ℂ∖{0,1}, based at 1/2. Prove fixed-endpoint homotopy invariance, generation of loop classes by the two counterclockwise puncture loops, their noncommuting action on the tower, and the signed upper-minus-lower jump. Nonpositive weights have rational, single-valued continuation.

**Inputs:** PF.1. No layer takes an input from an arithmetic consumer.

### The tower of continuation branches

Let X=ℂ∖{0,1}, b=1/2. Construct the analytic continuation tower (L,Li₁,Li₂,…) over homotopy classes of paths from b to a varying endpoint in X, initially the real principal germs at b, with exp L=z, dL=dz/z, dLi₁=dz/(1−z), and dLiₙ=Liₙ₋₁ dz/z for n≥2. Give endpoint charts, restriction to simply connected neighborhoods and fixed-endpoint homotopy invariance. A branch means the coherent whole tower pulled back by a local section; weights cannot be independently reset inside a formula. Nonpositive weights pull back their rational functions.

**Construction or proof.** On a disc avoiding 0 and 1 use local logarithms and analytic primitives to solve the triangular recursion successively; constants are fixed by the starting germs. A finite chain of such discs continues along each compact path. On a grid subordinate to a fixed-endpoint homotopy, local uniqueness makes continuation invariant under replacing successive edges. Give the path-homotopy quotient its standard endpoint charts; the tower is holomorphic in these charts. This is a specific analytic construction, not a duplicate development of a general covering-space library.

**API.**

- `polylogBranch_at_base` (simp): The constant path evaluates to Log b and the principal Liₙ(b).
- `polylogBranch_homotopy` (extensionality): Homotopic paths with fixed endpoints give the same tower germ.
- `polylogBranch_concat` (functoriality): Continuation along γ followed by δ equals continuation of the terminal germ along δ; constant paths act as identity.
- `polylogBranch_restrict` (functoriality): Restricting a branch to a smaller chart preserves its tower and derivatives.
- `polylogBranch_principal` (compatibility): On Ω∩X the continuation of the principal germ agrees with the principal Liₙ; a Log z branch also needs a simply connected neighborhood.
- `polylogBranch_derivative` (structure): Each local branch satisfies dLiₙ=Liₙ₋₁dz/z, and dLi₁=dz/(1−z).
- `polylogBranch_nonpos` (compatibility): Every nonpositive-weight determination is the same rational function.

**Uses.** Oesterlé Proposition 1, p. 53: Monodromy is an action on this path-based coherent tower. Zagier §7, pp. 413–414: Branch-independent Bernoulli combinations must use classical functions continued along the same path.

**Definition checks.**

- `polylogBranch_constant` (degenerate): At b, the constant path gives Li₁(b)=log 2 and L(b)=−log 2.
- `polylogBranch_slit` (compatibility): A path from b to −1 within Ω∩X returns Li₂(−1)=−π²/12.
- `polylogBranch_one_loop` (non-example): A counterclockwise loop about 1 changes Li₁(b) by −2πi.
- `polylogBranch_zero_loop` (computation): A counterclockwise loop about 0 changes L(b) by +2πi while fixing the initial Liₙ germs.

**Checks.** The constant path returns the principal values at b. Every branch under consideration is an actual analytic continuation of the fixed germ.

**Source.** [O93], §2.1, p. 52. The universal path-cover interpretation defines every determination from the principal germ at 1/2.

**Prerequisite targets:** analytic-recursion.

### The two puncture loops

For X=ℂ∖{0,1} based at b=1/2, every based loop class is a word in the standard counterclockwise simple loops c₀,c₁ and their inverses. In particular their action determines every continuation branch. This target is the generation statement; no classification of arbitrary coefficient systems is part of it.

**Construction or proof.** Choose the rays (−∞,0] and [1,∞) and polygonally perturb a compact loop to finitely many transverse crossings; their complement is star shaped about 1/2, hence contracts explicitly. Record crossings as c₀,c₁ or their inverses and contract each remaining segment in the cut plane. The construction is invariant under path homotopy; only surjectivity of words is needed.

**Checks.** Both generators are counterclockwise; the sign is fixed by ∫dz/z=2πi about 0.

**Source.** [O93], §2.2, p. 52, puncture-loop diagram. Identifies the two pictured loops as free generators of the twice-punctured plane.

### Monodromy of the full tower

Use left prefixing: Tⱼ[γ]=[cⱼ followed by γ]. For n≥1, Liₙ(T₀γ)=Liₙ(γ), L(T₀γ)=L(γ)+2πi; Liₙ(T₁γ)=Liₙ(γ)−2πi L(γ)^(n−1)/(n−1)!, L(T₁γ)=L(γ). Inverses and arbitrary words act by repeated substitution in this entire tower. These statements describe prefixing the initial germ; appending a loop at the endpoint of an already changed branch is the conjugate action and need not fix Liₙ around 0.

**Construction or proof.** Compute Li₁ monodromy by the logarithm around 1; around 0 the initial polylogarithm germs are holomorphic. Differentiate the proposed correction at each higher weight, using the same continued L, and fix its constant at the base germ. Use loop generation and substitution, rather than multiplying independent winding-number corrections; the two transformations do not commute.

**Checks.** For n=1, T₁ changes Li₁ by −2πi. With function composition read right to left, Li₂(T₁(T₀γ))−Li₂(T₀(T₁γ))=−(2πi)². All nonpositive weights remain unchanged.

**Source.** [O93], §2.2, Proposition 1, equations (8)–(9), p. 53. Gives the exact action on the Li tower and the continued logarithm, with this prefix convention.

**Prerequisite targets:** continuation, loop-generators, analytic-recursion.

### The principal branch jump

For n≥1 and x>1, both one-sided limits exist and Liₙ(x+i0)−Liₙ(x−i0)=2πi(log x)^(n−1)/(n−1)!. The total principal integral at x is the lower value. Counterclockwise monodromy about 1 of the initial germ is the negative of this jump continued with Log z.

**Construction or proof.** For n=1 use Arg(1−x∓i0)=∓π. Integrate the derivative recursion from 1 to x; for n≥2 the difference tends to zero at 1 and fixes the integration constant. The integral’s negative imaginary logarithm on t>1/x selects the lower value.

**Checks.** At x=3 the Li₁ jump is +2πi, so no globally continuous principal Li₁ on X exists. At weight two the imaginary jump is +2π log x; the argument correction has jump −2π log x.

**Source.** [O93], §1.3, equation (6), p. 51; §2.2, equation (8), p. 53. Distinguishes the upper-minus-lower jump from the negative counterclockwise monodromy.

**Prerequisite targets:** integrability, monodromy, analytic-recursion.

## Layer 3: Classical functional equations

Prove all-integer distribution on the disc, its principal star-domain continuation in positive weights and rational continuation in nonpositive weights. Prove positive-weight Bernoulli inversion off the nonnegative real axis, principal dilogarithm reflection and Abel five-term on specified domains. Continue these equalities along common argument paths with coherent logarithms and provide monodromy corrections for independently chosen branches. Evaluate the standard dilogarithm constants.

**Inputs:** PF.1, PF.2. No layer takes an input from an arithmetic consumer.

### Distribution in every integer weight

Let m≥1 be an integer, n∈ℤ, and μ_m the set of complex mth roots of unity. On |z|<1, Liₙ(z^m)=m^(n−1)∑_{ζ∈μ_m}Liₙ(ζz). For n>0 the same principal identity holds on the star domain Ω_m={z: every ζz∈Ω}, equivalently the plane minus the m rays {rζ⁻¹:r≥1}; z^m then belongs to Ω too. For n≤0 it holds wherever z^m≠1. Negative exponents of m mean its nonzero rational/complex inverse powers.

**Construction or proof.** Interchange the finite root sum with the absolutely convergent series and use ∑ζ^k=m when m divides k and zero otherwise. The displayed Ω_m is star shaped about zero, so analytic uniqueness extends the positive-weight identity there. For nonpositive weights compare rational functions using the disc identity and their possible poles.

**Checks.** Li₂(1/4)=2(Li₂(1/2)+Li₂(−1/2)). For n=0 the factor is 1/m, not m; m=1 is the identity.

**Source.** [O93], §1.2, equation (4), p. 50. The roots-of-unity filter gives the distribution constant. [Z07], Part I §1, p. 8, duplication formula. Its m=2 dilogarithm instance fixes the factor and argument.

**Prerequisite targets:** disc-series, analytic-recursion, rational-weights.

### Bernoulli inversion

For n≥1 and z∉[0,∞), Liₙ(z)+(−1)^n Liₙ(1/z)=−(2πi)^n Bₙ(1/2+Log(−z)/(2πi))/n!, with the existing Bernoulli polynomials and B₁=−1/2. The logarithm is principal; this common domain is part of the theorem.

**Construction or proof.** Verify n=1 directly using the two logarithms on the slit complement of the nonnegative axis. Differentiate the n-th identity and reduce to n−1 using the pinned Bernoulli derivative theorem. For n≥2 fix the constant at z=−1 with the paired Bernoulli Fourier theorem at 1/2 and the circle series. Thus the required off-circle continuation is proved as well.

**Checks.** At n=2,z=−1 the equality is 2Li₂(−1)=−π²/6. Do not specialize this principal formula at positive z by ignoring its domain.

**Source.** [O93], §1.2, equation (5), p. 51. The inversion formula uses the logarithm with imaginary part in (0,2π); substituting Log(−z)+πi gives this version. [Z07], Part I §1, pp. 8–9, inversion equations. Supplies the weight-two inversion normalization.

**Prerequisite targets:** analytic-recursion, closed-disc.

### Euler’s reflection identity

For z in U=ℂ∖((−∞,0]∪[1,∞)), Li₂(z)+Li₂(1−z)=π²/6−Log z·Log(1−z), all logarithms and polylogarithms principal. On (0,1) the formula is real.

**Construction or proof.** Differentiate the corrected sum on U and show its derivative vanishes. U is connected; take z→0 through (0,1) and use the finite ζ(2) endpoint and z log z→0.

**Checks.** At z=1/2, 2Li₂(1/2)=π²/6−(log 2)².

**Source.** [O93], §4.1, equation (29), p. 59. States reflection with the logarithmic correction on the common principal domain. [Z07], Part I §1, pp. 8–9. Uses reflection to compute the midpoint value.

**Prerequisite targets:** analytic-recursion, closed-disc.

### Abel’s classical five-term identity

If x,y∈ℂ and |x|+|y|<1, put a=x/(1−y), b=y/(1−x), c=xy/((1−x)(1−y)). Then Li₂(c)=Li₂(a)+Li₂(b)−Li₂(x)−Li₂(y)−Log(1−x)Log(1−y), using principal values. The strict norm inequality ensures every polylogarithm argument lies in the open unit disc.

**Construction or proof.** For fixed y differentiate the two sides in x using the recursion; the principal logarithm product identities hold on the stated disc domain. Set x=0 to fix the constant, then extend over the connected norm domain. All boundary cases with x=0 or y=0 are included by continuity.

**Checks.** At x=0 or y=0 both sides reduce to zero after cancellation. At x=y=1/4 the c-argument is 1/9, while a=b=1/3.

**Source.** [O93], §4.1, equation (30), p. 59. Gives Abel’s five-term identity on this explicit common branch domain. [Z07], Part I §1, pp. 8–9. The elementary dilogarithm functional equations include this five-term form.

**Prerequisite targets:** analytic-recursion, reflection.

### Functional equations on coherent branches

Each distribution, inversion, reflection and Abel equality continues along every path in its nonsingular common argument space from a point of its stated principal domain. Every Li and Log in the equality is pulled back along its own argument path from those initial germs. For Abel one may take M={(x,y):xy(1−x)(1−y)(1−x−y)≠0}, based at (1/4,1/4). For inversion use z∈X and the paired paths z and 1/z, starting at −1; for reflection use z and 1−z starting at 1/2; for distribution use z^m and ζz on z≠0,z^m≠1 from a small nonzero basepoint. Independently changing any branch adds exactly the correction obtained from the full tower’s monodromy words, including the continued logarithms in the polynomial or product term.

**Construction or proof.** Pull each germ in the known equality back to the same parameter neighborhood. Continue the zero germ through a finite chain of charts along the common path. Path homotopy invariance gives an equality on the common covering space. Apply the monodromy substitutions to compute any separate change of branch. Retain the norm domain for an uncorrected principal Abel assertion; no arbitrary independent-branch identity is inferred from it.

**Checks.** Moving Li₁ once counterclockwise around 1 alone changes an uncorrected principal equality by −2πi. A loop with the same winding totals can have a different effect on Li₂ because the tower action is noncommutative.

**Source.** [O93], §2.1–2.2, pp. 52–53; §4.1, p. 59. Continuation on the path cover and the explicit monodromy turn local functional equations into coherent multivalued identities.

**Prerequisite targets:** continuation, monodromy, distribution, inversion, reflection, abel.

### Exact dilogarithm values

For the principal normalization, Li₂(1)=π²/6, Li₂(−1)=−π²/12 and Li₂(1/2)=π²/12−(log 2)²/2. These are complex equalities with zero imaginary part.

**Construction or proof.** Use the existing ζ(2) value at 1. Duplication at z=1 follows by closed-disc continuity and solves the value at −1. Reflection at 1/2 yields the midpoint.

**Checks.** The negative-real value is finite and real; a wrong branch fails this test.

**Source.** [Z07], Part I §1, pp. 5–9. These exact values follow from the series, duplication and reflection.

**Prerequisite targets:** closed-disc, distribution, reflection.

## Layer 4: Single-valued polylogarithms

Construct Zagier’s real Lₙ for every n≥2 using B₁=−1/2 and parity projection. Establish cancellation of all monodromy, real analyticity on ℂ∖{0,1}, the branch-independent real differential in every weight, inversion, conjugation, distribution and the continuous extension to the Riemann sphere. Fix the weight-three differential and its zero derivative at one, and distinguish the weight-one expression from the unit logarithm.

**Inputs:** PF.1, PF.2, PF.3. No layer takes an input from an arithmetic consumer.

### The even Bernoulli generating identity

With cₖ=2^kBₖ/k!, the formal generating series β(s)=∑cₖs^k satisfies β(s)(exp(2s)−1)=2s. The series exp(s)β(s) is even and equals s/sinh s as a formal quotient with invertible constant term after cancelling s. In particular c₀=1,c₁=−1,c₂=1/3 and cₖ=0 for odd k>1. Only this coefficient system is asserted.

**Construction or proof.** Scale the variable by 2 in the existing Bernoulli-series identity and multiply by exp(s). Use exp(s)(exp(2s)−1)⁻¹=1/(2sinh s) after factoring the linear term, so no division by a nonunit formal variable is used. Compare s and −s coefficientwise.

**Checks.** Using B₁=+1/2 changes c₁ to +1 and destroys the required cancellation.

**Source.** [Z90], §7, equations (33)–(35), pp. 413–414. Identifies the Bernoulli generating function and its even transform, which removes projected monodromy.

### Zagier’s real single-valued family

For n≥2 and z≠0,1 define Lₙ(z)=πₙ(∑_{k=0}^{n−1}cₖ Liₙ₋ₖ(z) log^k|z|), where cₖ=2^kBₖ/k! and πₙ is real part for odd n and imaginary part for even n. Set Lₙ(0)=0; set Lₙ(1)=ζ(n) for odd n and 0 for even n. For the sphere set Lₙ(∞)=0. The formula at n=1 would give −log|1−z| on X; it is distinct from log|z|. This is Zagier’s Pₙ normalization with scalar real values, not his earlier Dₙ or D̃ₙ.

**Construction or proof.** Use the finite Bernoulli sum of the actual principal functions, with explicit endpoint assignments. Use OnePoint ℂ as the analytic sphere carrier and its finite-value equivalence with ℙ¹(ℂ); no arithmetic Tate-period factor enters this definition.

**API.**

- `singleValued_formula` (characterisation): On X the family is the displayed Bernoulli sum with the specified parity projection.
- `singleValued_zero` (simp): Lₙ(0)=0 for every n≥2.
- `singleValued_one` (simp): At 1, Lₙ is ζ(n) for odd n and zero for even n.
- `singleValued_infinity` (simp): The sphere extension has value zero at ∞.
- `singleValued_unitCircle` (compatibility): When |z|=1, Lₙ(z)=πₙLiₙ(z); equivalently use the pinned expZeta circle values.
- `singleValued_parity_projection` (projection): The scalar normalization is Re in odd weight and Im in even weight; the corresponding Tate line is obtained by a separate period convention.

**Uses.** Polylogarithms P.2, P.3 and P.4: Supplies analytic embedding values, differential identities and endpoint conventions before algebraic regulator constructions. BorelRegulators and HabiroNahmSeries HB.3: Provides parity-compatible scalar values at every complex embedding; arithmetic interpretation remains in those consumers.

**Definition checks.**

- `singleValued_two_formula` (compatibility): L₂(z)=Im Li₂(z)+Arg(1−z)log|z| on X.
- `singleValued_three_one` (computation): L₃(1)=ζ(3)>0.
- `singleValued_three_neg_one` (computation): L₃(−1)=−3ζ(3)/4.
- `singleValued_weight_one_distinction` (non-example): At z=1/2 the weight-one Bernoulli expression is +log 2, whereas log|z|=−log 2.
- `singleValued_unit_circle_parity` (compatibility): L₃(e^(it))=Re Li₃(e^(it)), while L₂(e^(it))=Im Li₂(e^(it)).

**Checks.** c₁=−1 is part of the definition, not an adjustable normalization. No restriction to a number field or to a special embedding is present.

**Source.** [Z90], §7, equation (33), pp. 413–414. Defines the Bernoulli normalization; its parity projection makes the weight-n endpoint and inversion signs explicit. [O93], §3, equation (18), p. 57. Uses the same Bernoulli sum, valued in i^(n−1)ℝ; remove that target-line phase to get the scalar convention here. [GR], §1.1, pp. 2–3. Specifies real part in odd weights and imaginary part in even weights.

**Prerequisite targets:** principal, closed-disc.

### Cancellation of every monodromy word

For n≥2, the projected finite sum defining Lₙ is unchanged when the coherent Li tower is continued along any loop in X. Thus any local branch of the whole tower yields the same real function. The unprojected complex sum need not be branch independent.

**Construction or proof.** T₀ fixes every Li term and does not change log|z|. For T₁ insert the monodromy polynomial in L=log|z|+iθ. Its weight-n coefficient is the parity component of exp(iθs)exp(ℓs)β(ℓs); exp(ℓs)β(ℓs) is even with real coefficients. The selected projection of −2πi times its degree n−1 coefficient is zero. The same calculation holds for every continued L, including θ shifted by 2π; generation by the two loops proves cancellation of arbitrary words and inverses.

**Checks.** The n=2 jump +2π log x is cancelled by the −2π argument jump times log x. Testing only the cut jump is insufficient to replace the all-word proof.

**Source.** [Z90], §7, equations (33)–(35), pp. 413–414. The even transformed generating series supplies single-valuedness of the Bernoulli projection. [O93], §3, pp. 57–58. Establishes the projected function independently of the determination chosen along a path.

**Prerequisite targets:** single-valued, bernoulli-parity, monodromy, loop-generators.

### Real analyticity across the classical cut

For every n≥2, Lₙ is real analytic at every z∈X, including real z>1. Locally it equals the projected expression in any coherent holomorphic branch of the classical tower and the real-analytic function log|z|. In particular it is C^r for every r on X.

**Construction or proof.** Choose a small disc avoiding 0 and 1 and a local coherent tower there. A nonvanishing holomorphic coordinate gives the real-analytic log norm. Branch independence identifies the actual global function with this local analytic expression even when the disc crosses the principal cut.

**Checks.** At z=2 every Lₙ has a genuine real derivative, even though principal Liₙ has a jump there.

**Source.** [O93], §3, pp. 57–58. The globally single-valued function is real analytic off 0 and 1. [GR], §1.1, pp. 2–3. The all-weight single-valued family has the stated analytic regularity.

**Prerequisite targets:** single-valued, branch-independence, continuation.

### The real differential in every weight

Let n≥2,z∈X,v∈ℂ, ℓ=log|z| and cₖ=2^kBₖ/k!. On any coherent local branch, dLₙ(z)[v]=πₙ(∑_{k=0}^{n−1}cₖLiₙ₋ₖ₋₁(z)ℓ^k v/z + ∑_{k=1}^{n−1}k cₖLiₙ₋ₖ(z)ℓ^(k−1)Re(v/z)). Here Li₀=z/(1−z). This expression is branch independent and is the actual real Fréchet derivative at every point of X, including the classical cut.

**Construction or proof.** Differentiate the finite expression on a local branch using dLi_j=Li_(j−1)v/z and dlog|z|=Re(v/z). Differentiate the established local branch-independence equality to prove independence of the resulting linear map, instead of inferring derivatives from continuity across a cut.

**Checks.** Both sums have nonnegative logarithm exponents; the second begins at k=1. Weight two gives the Bloch–Wigner one-form; weight three gives the explicit formula in the next diagnostic target.

**Source.** [G00], §4.1, Proposition 4.1 and Lemma 4.2, equations (28)–(32), pp. 17–20. Provides all-weight real differential identities for the Bernoulli normalization; the displayed local-branch form is obtained by differentiating the finite sum. [O93], §3, equations (27)–(28), p. 58. Supplies the equivalent Wirtinger differential formulas.

**Prerequisite targets:** real-analytic, analytic-recursion, branch-independence.

### Inversion, conjugation and distribution

For n≥2 and z≠0, Lₙ(z)+(−1)^nLₙ(1/z)=0, with the assigned endpoint values at 1. For every z, Lₙ(conj z)=(−1)^(n−1)Lₙ(z). For m≥1 and every z∈ℂ, Lₙ(z^m)=m^(n−1)∑_{ζ^m=1}Lₙ(ζz); at punctures use continuous extensions.

**Construction or proof.** Insert the classical inversion into the finite Bernoulli sum; its polynomial correction has zero selected projection by the even-series identity. Conjugate termwise on Ω and extend by branch independence. For distribution note log|z^m|=m log|z|, so the k-th term gets exactly m^k m^(n−k−1)=m^(n−1); extend by continuity at the punctures once the endpoint target is proved.

**Checks.** L₂(1/z)=−L₂(z), L₃(1/z)=L₃(z). Conjugation negates L₂ and fixes L₃; it is a different operation from inversion.

**Source.** [O93], §3, equations (20)–(22), pp. 57–58. Lists conjugation, distribution and inversion for the same Bernoulli family. [Z90], §7, pp. 413–414. Fixes the parity normalization used to interpret these formulas as real scalar equalities.

**Prerequisite targets:** single-valued, branch-independence, inversion, distribution, conjugation, bernoulli-parity, sphere-endpoints.

### Continuous extension to the sphere

For n≥2 the assigned values make Lₙ continuous on ℂ and its extension continuous on OnePoint ℂ, hence on the Riemann sphere. Its limits at 0 and ∞ are zero. Its limit at 1 is ζ(n) in odd weights and zero in even weights. These limits do not depend on the approach direction or classical branch.

**Construction or proof.** Near zero use Li_j(z)=O(z) for every j≥1, multiplied by at most |log|z||^(n−1). Insert classical inversion into the finite Bernoulli sum and use the even-series identity to derive inversion for z∈X without invoking endpoint continuity; obtain the limit at infinity. Near 1, Li_j→ζ(j) for j≥2, while the Li₁ logarithmic singularity is multiplied by log^(n−1)|z|=O(|z−1|^(n−1)); cut boundary corrections cancel. Prove the resulting estimates on both half-neighborhoods and use branch independence.

**Checks.** L₃(1) is nonzero; dropping it changes every odd-weight regulator convention. L₂(0)=L₂(1)=L₂(∞)=0.

**Source.** [Z90], §7, discussion after (35), p. 414. Gives the continuous endpoints 0,∞ and the parity-dependent value at 1. [O93], §3, equations (23)–(24), p. 58. Records endpoint limits for every weight.

**Prerequisite targets:** single-valued, branch-independence, closed-disc, inversion, bernoulli-parity, disc-series, real-analytic.

### The trilogarithm differential and endpoint

On X, with ℓ=log|z|, dL₃(z)[v]=−L₂(z)Im(v/z)+(ℓ log|1−z|/3)Re(v/z)+(ℓ²/3)Re(v/(1−z)). At z=1, the continuous extension L₃ has real Fréchet derivative zero. Also L₃(1)=ζ(3)>0 and L₃(−1)=−3ζ(3)/4.

**Construction or proof.** Expand the n=3 Bernoulli sum and combine the imaginary Li₂ and Li₁ terms into L₂. Near 1, L₂=O(ρ(1+|log ρ|)), ℓ=O(ρ), so the displayed differential is O(ρ(1+|log ρ|)). Integrate along short segments split at 1 to get L₃(1+h)−L₃(1)=o(|h|). At −1 use the boundary series or distribution at z=1; ζ(3)>0 follows from its positive convergent series.

**Checks.** Do not extrapolate weight-two nondifferentiability to every higher weight. On the circle L₃ is the real, not the imaginary, part of Li₃.

**Source.** [G00], §4.1, equations (28)–(29), pp. 17–18. Specializing the all-weight differential gives the weight-three identity. [Z90], §7, equations (33)–(35), pp. 413–414. The finite Bernoulli formula and endpoint determine the derivative limit and real special values.

**Prerequisite targets:** differential, sphere-endpoints, closed-disc, distribution.

## Layer 5: Bloch–Wigner and the five-term identity

Construct D from the principal dilogarithm and argument correction, identify it with L₂, and prove sixfold symmetry, its actual real derivative across the classical cut and its Laplacian. Apply the pinned minimum principles on bounded half-discs to prove strict upper-half-plane positivity. Prove the analytic five-term relation and its projective and cyclic forms before any descent to an algebraic group.

**Inputs:** PF.1, PF.3, PF.4. No layer takes an input from an arithmetic consumer.

### The Bloch–Wigner dilogarithm

Define D(z)=Im Li₂(z)+Arg(1−z)log|z| for z≠0,1, and D(0)=D(1)=0. The logarithm and argument are the same principal ones used above. Set D(∞)=0 for its sphere extension. This real analytic object is defined before, and independently of, any Bloch group or hyperbolic volume interpretation.

**Construction or proof.** Use the actual principal dilogarithm and elementary argument correction with explicit endpoint assignments. The comparison with L₂ proves global continuity and removes all branch ambiguity.

**API.**

- `blochWigner_formula` (characterisation): On X, D is Im Li₂+Arg(1−z)log|z|.
- `blochWigner_zero` (simp): D(0)=0.
- `blochWigner_one` (simp): D(1)=0.
- `blochWigner_infinity` (simp): D(∞)=0 in the sphere extension.
- `blochWigner_real` (simp): D(x)=0 for every real x.
- `blochWigner_circle` (compatibility): D(e^(it))=∑_{k≥1}sin(kt)/k², using the existing circle series realization.

**Uses.** Polylogarithms P.2: Requires the signed analytic five-term relation and estimates before defining any regulator descent. HabiroNahmSeries HB.3 and ArithmeticQuantumTopology QT.5: Uses values at all complex embeddings and orientation-sensitive sign; volume equality is proved by the consumer.

**Definition checks.**

- `blochWigner_real_axis` (degenerate): D(0)=D(1)=D(2)=0.
- `blochWigner_i_positive` (non-example): D(i)>0; the identically zero function fails this test.
- `blochWigner_minus_i` (computation): D(−i)=−D(i)<0.
- `blochWigner_unit_circle` (compatibility): D(e^(it)) is the imaginary part of the pinned expZeta circle value at weight 2.

**Checks.** D is not merely the imaginary part of the total principal Li₂ off the unit circle.

**Source.** [Z07], Part I §3, p. 10. Defines the argument correction to Im Li₂ and its continuous zero endpoints. [G95], §1.0, equation (1.2), p. 201. Fixes the Bloch–Wigner normalization on the sphere.

**Prerequisite targets:** principal.

### Weight two is Bloch–Wigner

For every z∈ℂ and on the sphere, L₂(z)=D(z). Hence D is continuous everywhere and real analytic on X, including across (1,∞). On the unit circle D is the imaginary part of the absolutely convergent Li₂ Fourier series.

**Construction or proof.** Use c₀=1,c₁=−1 and Im Li₁=−Arg(1−z); this fixes the plus sign in the argument correction. Check endpoint assignments and then invoke the already proved single-valued regularity.

**Checks.** At x>1 the two imaginary jumps cancel exactly.

**Source.** [O93], §3, equation (19), p. 57. Its phase-valued P₂=iD is exactly the scalar equality here. [Z07], Part I §3, pp. 10–11. The Bloch–Wigner definition and unit-circle series agree with this specialization.

**Prerequisite targets:** bloch-wigner, single-valued, real-analytic, sphere-endpoints.

### Sixfold symmetry and the real axis

For z∈X, D(z)=D(1−1/z)=D(1/(1−z))=−D(1/z)=−D(1−z)=−D(z/(z−1)). For every complex z, D(conj z)=−D(z). Consequently D is zero on the entire real axis, including its continuous endpoints.

**Construction or proof.** Use single-valued inversion and conjugation; take imaginary parts of Euler reflection with the logarithmic corrections to prove D(1−z)=−D(z). The two generators z↦1−z and z↦1/z give the six identities by composition; conjugation fixes real inputs.

**Checks.** D(1/2)=D(−1)=D(2)=0. D(−i)=−D(i), while D(1−1/i)=D(i).

**Source.** [Z07], Part I §3, p. 11, equation (1). Gives the six cross-ratio symmetries and conjugation sign.

**Prerequisite targets:** single-valued-two, symmetries, reflection, branch-independence.

### The Bloch–Wigner one-form

For every z∈X, D has real Fréchet derivative dD(z)[v]=−log|z|Im(v/(1−z))−log|1−z|Im(v/z), for all v∈ℂ. Equivalently dD=log|z|dArg(1−z)−log|1−z|dArg z on any local branches. The assertion includes classical cut points x>1.

**Construction or proof.** Specialize the all-weight real differential to n=2 and use Li₀=z/(1−z), Li₁=−Log(1−z). A local coherent branch gives the actual smooth formula on a neighborhood of every cut point; no derivative is extended from equality of continuous boundary values alone.

**Checks.** At z=i,v=1 the value is log 2/2; at z=i,v=i it is zero. At z=2 the derivative is log 2·Im(v).

**Source.** [G00], §4.1, equation (29), p. 18. The weight-two differential is the logarithmic argument one-form. [Z07], Part I §3, pp. 10–11. The single-valued definition supplies the normalization whose derivative is used.

**Prerequisite targets:** single-valued-two, differential, real-analytic.

### The Bloch–Wigner Laplacian

For z∈X, ΔD(z)=−2 Im(z)/(|z|²|1−z|²), with the Euclidean real Laplacian ∂²/∂x²+∂²/∂y² on ℂ. In particular D is strictly superharmonic in the upper half-plane and strictly subharmonic in the lower half-plane.

**Construction or proof.** Write the real coefficients of dD in x,y; differentiate using grad log|z|=(x,y)/|z|² and grad log|1−z|=(x−1,y)/|1−z|². The mixed numerator simplifies to −2y. The real analyticity target legitimizes the second derivatives even across the principal cut.

**Checks.** ΔD(i)=−1. At real x≠0,1 the Laplacian is zero, while the transverse first derivative can be nonzero.

**Source.** [G00], §4.1, equation (29), p. 18. Differentiating the stated logarithmic one-form gives the displayed Euclidean Laplacian; this is a derived analytic consequence, not a separately numbered source theorem.

**Prerequisite targets:** differential, real-analytic.

### Strict positivity in the upper half-plane

For Im z>0, D(z)>0; for Im z<0, D(z)<0. Prove the analytic minimum-principle argument on compact closed upper half-discs and its passage to the unbounded half-plane, independently of any hyperbolic-volume theorem. The generic weak and strong minimum principles are cited from the pinned library, not planned again.

**Construction or proof.** For ε>0 the sphere limit gives |D|≤ε on a sufficiently large semicircle; D=0 on its real diameter. Continuity holds even at 0 and 1, while C² regularity and ΔD≤0 hold on the half-disc interior. Apply TauCeti.ge_of_laplacian_nonpos_ge_frontier on the compact half-disc to obtain D≥−ε at the chosen interior point; send ε to zero. If an interior value were zero, the pinned strong principle on the connected open upper half-plane would make D constant there; its strictly negative Laplacian excludes this. Conjugation gives the lower sign.

**Checks.** D(i)>0 and D(−i)<0. The argument checks frontier continuity and bounded-domain hypotheses before passing to the unbounded domain.

**Source.** [Z07], Part I §3, pp. 10–11. Its analytic Bloch–Wigner function and zero boundary values fix the object; positivity here is derived using the displayed Laplacian and pinned minimum principles.

**Prerequisite targets:** laplacian, real-analytic, sphere-endpoints, single-valued-two, sixfold.

### The analytic five-term relation

For x,y∈ℂ∖{0,1} with x≠y, D(x)−D(y)+D(y/x)−D((1−x⁻¹)/(1−y⁻¹))+D((1−x)/(1−y))=0. All five arguments then avoid 0 and 1. The proof is analytic and precedes any construction of a pre-Bloch quotient.

**Construction or proof.** For cyclic brackets xᵢ, clear denominators to prove 1−xᵢ=−xᵢ/(xᵢ₊₂xᵢ₊₃), with indices modulo five. Put η(f,g)=log|f|dArg g−log|g|dArg f. Its bilinearity for products and inverses turns the sum of dD(xᵢ) into cancelling terms. Fix one variable; the finite-complement theorem and zero-derivative constancy give a constant on its admissible plane domain. Let a configuration degenerate toward a collision and use continuity to fix the constant at zero; apply the sixfold dictionary to obtain the stated alternating form.

**Checks.** For x=i,y=−1, the result is 2D(i)−2D((1+i)/2)=0. For x=i/2,y=(1+i)/2 the arguments are i/2,(1+i)/2,1−i,2−i,(3+i)/2, with the displayed alternating signs. A collision x=y is a continuous limiting statement; it is excluded from the admissible algebraic formula.

**Source.** [Z07], Part I §3, equation (4), p. 11. The alternating five-term identity has this ordered cross-ratio form. [GR], §1.1, equations (3)–(4), pp. 3–4. The cyclic cross-ratio equation and its elementary differential proof fix the convention.

**Prerequisite targets:** differential, sixfold, sphere-endpoints, single-valued-two.

### Projective and cyclic cross-ratio forms

For five pairwise distinct points s₀,…,s₄ of ℙ¹(ℂ), use r(a,b,c,d)=(a−c)(b−d)/((a−d)(b−c)) on finite coordinates and its cancellation limits when one point is ∞. Then ∑_{j=0}⁴(−1)^jD(r(s₀,…,ŝⱼ,…,s₄))=0; r(∞,0,1,z)=z. For cyclic Goncharov–Rudenko brackets [a,b,c,d]=(a−b)(c−d)/((a−d)(c−b)) the corresponding cyclic sum of five D-values is zero. These are coordinate formulas for analytic values, not a construction of an algebraic configuration complex.

**Construction or proof.** Prove the rational coordinate formulas and Möbius invariance by clearing denominators, with explicit one-infinity cancellation cases. Normalize three points to ∞,0,1 and apply the affine five-term theorem. Translate between r and the GR bracket using [a,b,c,d]=1−r(a,b,c,d)=1−1/cr(a,b,c,d); use the appropriate sixfold symmetry before rearranging the cyclic order. The Suslin ordering cr(0,∞,1,z)=z is reciprocal to r on the same ordered tuple; record that sign rather than identifying their raw functions.

**Checks.** r(∞,0,1,z)=z whereas the GR bracket on that tuple is 1−z. No regulator or group-descent statement is inferred from a coordinate identity.

**Source.** [Z07], Part I §3, equations (3)–(4), p. 11. Gives the invariant five-point relation. [GR], §1.1, equations (3)–(4), pp. 3–4. Uses the cyclic bracket normalized by [∞,1,0,z]=z.

**Prerequisite targets:** five-term, sixfold.

## Layer 6: Rogers dilogarithm

Construct the real Rogers function on [0,1] with endpoints 0 and π²/6. Prove continuity, real analyticity and its derivative on (0,1), reflection and the exact interval pentagon. Compute the midpoint and golden-ratio values with their correct constants.

**Inputs:** PF.1, PF.3. No layer takes an input from an arithmetic consumer.

### The interval Rogers dilogarithm

For 0<x<1 define R(x)=Re Li₂(x)+(1/2)log x log(1−x). Assign R(0)=0 and R(1)=π²/6. Use the restriction to [0,1] as the object; a total real expression away from that interval carries no extended-Rogers theorem in this roadmap.

**Construction or proof.** Take the displayed elementary correction of the principal analytic Li₂ on the real interval and assign its two finite limits. The interval is essential for exact real logarithmic identities without modulo-period corrections.

**API.**

- `rogers_formula` (characterisation): For 0<x<1, R(x)=Re Li₂(x)+(log x log(1−x))/2.
- `rogers_zero` (simp): R(0)=0.
- `rogers_one` (simp): R(1)=π²/6.
- `rogers_continuous` (structure): R is continuous on [0,1] and real analytic on (0,1).
- `rogers_polylog_compat` (compatibility): The underlying real dilogarithm agrees with the complex principal one on (0,1), whose imaginary part is zero.
- `rogers_monotone` (other): R is strictly increasing on [0,1], since its open-interval derivative is positive.

**Uses.** Zagier Part II §1.A, pp. 23–24: The interval normalization removes logarithmic errors in the Rogers pentagon. HabiroNahmSeries positive real Nahm solutions and quantum-modularity consumers: Supplies exact real identities and positive derivatives for inputs in (0,1); any arithmetic or asymptotic interpretation stays with the consumer.

**Definition checks.**

- `rogers_endpoints` (degenerate): R(0)=0 and R(1)=π²/6.
- `rogers_half` (computation): R(1/2)=π²/12, so it differs from Li₂(1/2).
- `rogers_golden` (computation): For ρ=(√5−1)/2, R(ρ)=π²/10 and R(ρ²)=π²/15.
- `rogers_derivative_half` (characterisation): R′(1/2)=2log 2>0.

**Checks.** This normalization has R(1)=π²/6, rather than a shifted or unit-normalized endpoint.

**Source.** [Z07], Part II §1.A, pp. 23–24. Defines the Rogers correction and explains the clean interval functional equation.

**Prerequisite targets:** principal, dilog-values.

### Rogers regularity and derivative

R is continuous on [0,1] and real analytic on (0,1). For 0<x<1, R′(x)=−(1/2)(log(1−x)/x+log x/(1−x))>0. Consequently R is strictly increasing on [0,1].

**Construction or proof.** Differentiate the expression using Li₂′(x)=−log(1−x)/x and the ordinary real logarithm derivative. The two logarithms are negative on (0,1), giving positivity; their endpoint products tend to zero, so the assigned endpoints are continuous. Apply the real mean-value theorem and pass to endpoint limits.

**Checks.** R′(1/2)=2log 2. The nontrivial logarithmic correction prevents confusing R with Re Li₂.

**Source.** [Z07], Part II §1.A, pp. 23–24. The corrected real dilogarithm has the symmetric differential used for its identities.

**Prerequisite targets:** rogers, analytic-recursion, closed-disc, dilog-values.

### Rogers reflection

For every x∈[0,1], R(x)+R(1−x)=π²/6.

**Construction or proof.** Add the two Rogers corrections to Euler reflection on (0,1); the logarithmic products cancel exactly. Use continuity to include x=0 and x=1.

**Checks.** R(1/2)=π²/12.

**Source.** [Z07], Part II §1.A, p. 23. The normalization converts Euler reflection into a constant-sum identity.

**Prerequisite targets:** rogers, reflection, rogers-calculus.

### The exact interval pentagon

For 0<x,y<1, R(x)+R(y)=R(xy)+R(x(1−y)/(1−xy))+R(y(1−x)/(1−xy)). Every argument on the right lies in (0,1). The equality is exact in ℝ, with no quotient by π² or omitted additive constant.

**Construction or proof.** Derive the equality first on a nonempty open subregion using Abel, reflection and the explicit logarithmic corrections. Alternatively differentiate the claimed difference in x and y on the connected square (0,1)² using the already proved Rogers derivative; each derivative cancels by real log product identities. Let y→0 to fix its constant at zero. Check denominator positivity and the right-hand argument bounds before using any derivative or logarithm identity.

**Checks.** At x=y=ρ with ρ²=1−ρ, all three right-hand arguments are ρ², so 2R(ρ)=3R(ρ²).

**Source.** [Z07], Part II §1.A, pp. 23–24. The Rogers version of the five-term equation has no logarithmic remainder on the interval. [O93], §4.1, equation (30), p. 59. The classical Abel identity supplies the local dilogarithm equality from which the interval form follows.

**Prerequisite targets:** rogers, abel, reflection, rogers-calculus.

### Midpoint and golden-ratio values

Let ρ=(√5−1)/2, so 0<ρ<1 and ρ²=1−ρ. Then R(1/2)=π²/12, R(ρ)=π²/10 and R(ρ²)=π²/15.

**Construction or proof.** Reflection fixes the midpoint. At x=y=ρ the pentagon gives 2R(ρ)=3R(ρ²); reflection gives their sum π²/6. Solve the two real linear equations.

**Checks.** The value at ρ is larger than the midpoint, as strict monotonicity requires.

**Source.** [Z07], Part II §1.A, pp. 23–24; Part I §1, p. 6. The Rogers reflection and pentagon determine these values; the classical golden-ratio values give the same normalization.

**Prerequisite targets:** rogers-reflection, rogers-pentagon.

## Layer 7: Analytic estimates

Prove uniform disc truncation and closed-disc positive-weight tail bounds, sectorial growth for every classical continuation branch, endpoint moduli for all Lₙ, compact bounds for every real derivative away from the punctures, and boundedness on the sphere. Prove the logarithmic imaginary-axis asymptotic that detects the failure of differentiability of D at zero. Export analytic error inequalities without constructing arithmetic certificate machinery.

**Inputs:** PF.1, PF.2, PF.4, PF.5, PF.6. No layer takes an input from an arithmetic consumer.

### Uniform disc truncation bounds

Let n≥1,N≥0 be integers, 0≤r<1, |z|≤r, and S_N=∑_{k=1}^N z^k/k^n. Then |Liₙ(z)−S_N|≤r^(N+1)/((N+1)^n(1−r)). For each n≤0 and each fixed r<1, the rational tail has the explicit bound ∑_{k>N}k^(−n)r^k; bound this polynomially weighted geometric tail by applying (r d/dr)^(−n) to r^(N+1)/(1−r). The latter equality and bound are asserted for 0≤r<1 with its continuous interpretation at r=0.

**Construction or proof.** For n≥1 bound k^(−n) by (N+1)^(−n) and sum the remaining geometric progression. For n≤0 use the Euler-derivative rational tail formula for the nonnegative summands k^(−n)r^k. This makes the nonpositive-weight estimate computable without a false decreasing-denominator argument.

**Checks.** For n=2,z=1/2,N=1 the error is at most 1/8. The positive-weight bound cannot be reused unchanged for n=−1.

**Source.** [O93], §1.1, equation (1), p. 50. The absolutely convergent defining series gives these estimates by termwise absolute values; the quantitative inequalities are derived here.

**Prerequisite targets:** disc-series, rational-weights.

### Closed-disc and Fourier tail bounds

For n≥2,N≥1 and |z|≤1, |Liₙ(z)−∑_{k=1}^N z^k/k^n|≤N^(1−n)/(n−1). On the unit circle the same bound holds for Lₙ after parity projection. In particular |D(e^(it))−∑_{k=1}^Nsin(kt)/k²|≤1/N, uniformly in real t.

**Construction or proof.** Bound the tail norm by ∑_{k>N}k^(−n)≤∫_N^∞t^(−n)dt. The parity projections have operator norm one and log|z|=0 on the circle.

**Checks.** At n=2 the exponent is N⁻¹, with no claim of a uniform absolute n=1 boundary series.

**Source.** [Z07], Part I §3, p. 11, Fourier formula for D. The circle series yields the stated uniform error by the integral comparison for ∑k^(−n). [O93], §1.4, p. 51. Positive weights at least two have finite closed-disc boundary values.

**Prerequisite targets:** closed-disc, single-valued-two, single-valued.

### Sectorial growth of every classical branch

Fix n≥1 and a continued branch on a sector of bounded argument near 0, 1 or ∞ in X. Near 0, every such Liₙ is O(1+|log|z||^(n−1)); the principal branch improves to O(|z|). Near ∞ every branch is O(1+log^n|z|). For n≥2 each branch near 1 has a finite limit, differing from ζ(n) by an integer multiple of (2πi)^n/(n−1)!; weight one has its logarithmic singularity. Constants depend on the branch, sector and n. Nonpositive weights have the exact rational pole/growth behavior from PF.1.

**Construction or proof.** Expand any fixed loop word using the tower monodromy; its corrections are polynomials of degree at most n−1 in a continued Log z, with coefficients in the period lattice. Combine the principal small-disc series estimate with the inversion polynomial for large z. Near 1 use Log z=2πij+O(z−1) on the chosen sector; the monodromy constants lie in the displayed lattice because the binomial/factorial coefficients are integral multiples after the common (n−1)! denominator. For n=1 keep the logarithmic divergence at 1 separate; no finite ζ(1) limit is asserted.

**Checks.** After a loop about 1, Li₂ near zero has a logarithmic term, so “all branches are O(z)” is false. The principal Liₙ still has zero limit at zero.

**Source.** [O93], §2.2, Corollaries 1–2, p. 53; §1.3, equation (7), p. 51. States branchwise sector growth and the possible positive-weight limits at 1.

**Prerequisite targets:** monodromy, loop-generators, inversion, closed-disc, rational-weights, disc-tail.

### Quantitative single-valued endpoints

For each n≥2 there is Cₙ>0 such that, for 0<|z|≤1/2, |Lₙ(z)|≤Cₙ|z|(1+|log|z||^(n−1)); for |z|≥2, |Lₙ(z)|≤Cₙ|z|⁻¹(1+log^(n−1)|z|). There is Aₙ>0 such that for 0<|z−1|≤1/2, |Lₙ(z)−Lₙ(1)|≤Aₙ|z−1|(1+|log|z−1|||). These are uniform in direction, including crossing the classical cut.

**Construction or proof.** Use |Li_j(z)|≤2|z| on the half-disc for j≥1 and sum the finite |cₖ| factors. Invert for large z using the endpoint-free functional equation. Near 1 the local branch expressions have Li₁=O(1+|log ρ|), bounded Li_j for j≥2 and ℓ=O(ρ). The n=2 differential is O(1+|log ρ|); higher weights satisfy the same coarse upper bound. Integrate along radial segments from 1 in the upper/lower half-neighborhood, using cancellation for the real cut. The integral of 1+|log t| is O(ρ(1+|log ρ|)); continuity supplies the endpoint.

**Checks.** The estimates force zero at both 0 and ∞, but retain ζ(3) at 1. The weight-three derivative-zero statement is stronger than the common coarse modulus.

**Source.** [Z90], §7, endpoint discussion after (35), p. 414. The Bernoulli formula and inversion imply continuous endpoint behavior; these uniform rates are quantitative consequences. [O93], §1.3–1.4, pp. 51; §3, pp. 57–58. Classical logarithmic behavior and the all-weight single-valued differential give the required estimates.

**Prerequisite targets:** sphere-endpoints, symmetries, disc-tail, differential, branch-independence.

### Compact bounds for every real derivative

For n≥2, every compact K⊂X and every r≥0, the r-th real derivative of Lₙ is bounded on K; the same holds for D. On each compact convex K⊂X the first-derivative bound gives a Lipschitz bound |Lₙ(z)−Lₙ(w)|≤C|z−w|. For a fixed local classical branch the same statements hold on compact subsets of its chart. No single global Lipschitz constant across the punctures is asserted.

**Construction or proof.** Real analyticity implies continuity of each iterated derivative; take its norm maximum on K. For the Lipschitz statement integrate the derivative along the contained segment; a nonconvex compact set needs local charts or a path-length bound instead.

**Checks.** A compact set may cross the principal cut and still be a valid set for Lₙ or D. An arbitrarily small neighborhood of 0 has no uniform derivative bound for D.

**Source.** [O93], §2.1, p. 52; §3, pp. 57–58. Holomorphic branch charts and real analyticity of the single-valued family imply continuous derivatives, hence compact bounds.

**Prerequisite targets:** real-analytic, single-valued-two, differential, continuation.

### The logarithmic endpoint test

As real t→0, t≠0, D(it)=t(1−log|t|)+O(|t|³(1+|log|t||)). In particular D is continuous but has no real Fréchet derivative at 0. Sixfold symmetry transfers the corresponding failure to 1 and to infinity in the reciprocal coordinate; no such failure is asserted for every higher Lₙ.

**Construction or proof.** From the Li₂ series, Im Li₂(it)=t+O(t³); from the argument Taylor expansion, Arg(1−it)=−t+O(t³). Multiply by log|t| with the correct sign. The quotient D(it)/t=1−log|t|+o(1) diverges to +∞, excluding a finite real derivative. Use D(1−z)=−D(z) and D(1/z)=−D(z) to transfer the endpoint behavior.

**Checks.** The expansion is odd in t to its leading order. L₃ has derivative zero at 1, so this check is specific to D.

**Source.** [Z07], Part I §3, p. 10. The Bloch–Wigner function is continuous and logarithmically nonsmooth at its three sphere endpoints; the displayed imaginary-axis expansion is derived from its defining formula. [G95], §1.0, equation (1.2), p. 201. Describes the logarithmic type of the Bloch–Wigner endpoint singularities.

**Prerequisite targets:** differential, sixfold, disc-series, disc-tail.

### Global analytic bounds for consumers

For each n≥2 there exists Mₙ<∞ with |Lₙ(z)|≤Mₙ on the sphere, hence D is bounded. R takes values in [0,π²/6] on [0,1]. Export the explicit disc/circle tail inequalities and endpoint bounds for finite weighted sums of evaluations at arbitrary complex numbers; triangle inequalities multiply each analytic error by the absolute value of its coefficient. Such bounds apply under every embedding F→ℂ for every number field F; they impose no arithmetic condition on F and construct no rational-certificate data type.

**Construction or proof.** Take the maximum norm of the continuous sphere function on its compact domain, or combine the three endpoint estimates with a compact remainder. Use monotonicity and endpoints to bound R. Apply the triangle inequality to weighted finite sums; retain each embedding as an argument of the analytic function.

**Checks.** A finite arithmetic certificate belongs to Polylogarithms P.2; the exported analytic inequalities are sufficient input without reversing that dependency.

**Source.** [Z90], §7, p. 414. Continuity on the compact sphere yields boundedness. [Z07], Part I §3, pp. 10–11; Part II §1.A, pp. 23–24. The Bloch–Wigner and interval Rogers normalizations determine the corresponding bounds; finite-sum error transport is the triangle inequality.

**Prerequisite targets:** sphere-endpoints, endpoint-estimates, circle-tail, disc-tail, rogers-calculus.

## How the analytic output is used

Polylogarithms P.2 takes D, its signed five-term identity, positivity and quantitative bounds to construct its regulator and certified evaluation. Its higher layers take all-weight Lₙ, the general real differential, conjugation parity and the odd-weight endpoint convention. K3BlochGroups takes analytic identities only where an embedding-valued comparison needs them; it retains the algebraic cross-ratio configurations and exact integral torsion. HabiroNumberFields keeps cyclic dilogarithms in Kummer extensions. HabiroNahmSeries HB.3 uses complex evaluations of algebraic Nahm solutions, while its formal Gaussian/product calculations use formal series from their own supplier. PeriodsAndSpecialValues PS.9 uses the classical analytic realization alongside its separate multiple-zeta and motivic objects. Quantum-modularity and Borel-regulator consumers take precisely these analytic identities and estimates; neither supplies an input used to prove them.

The endpoint checks are deliberately weight sensitive. D vanishes on the real axis and is logarithmically nonsmooth at 0, whereas L₃(1)=ζ(3) and its derivative there is zero. The all-weight differential is available independently of any cycle constancy or regulator comparison. The Bloch–Wigner five-term proof uses elementary coordinate algebra, logarithmic one-forms and connectedness, so it cannot appeal to a descent map whose well-definedness depends on that very identity. Bounds on finite analytic sums remain valid after every complex embedding, without creating a field-specific notion of the functions.

## References

The locators above concern only the analytic results needed for these targets. Source formulas are translated into the conventions fixed here; no algebraic K-theory assertion is imported from a title or a neighboring section.

- **[Z07]** Don Zagier, *The dilogarithm function*, Frontiers in Number Theory, Physics, and Geometry II (2007), pp. 3–65. [Author/public copy](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf). Read Part I §§1–3, pp. 3–12; Part II §1.A, pp. 23–24; Part II §4, p. 59. Accessed 2026-10-20.

- **[Z90]** Don Zagier, *Polylogarithms, Dedekind zeta functions and the algebraic K-theory of fields*, Arithmetic Algebraic Geometry, Progress in Mathematics 89 (1991), pp. 391–430. [Author/public copy](https://people.mpim-bonn.mpg.de/zagier/files/scanned/PolylogsDedekindZetaAndKTheory/fulltext.pdf). Read §7, equations (33)–(36), Proposition 3, pp. 413–414. Accessed 2026-10-20.

- **[O93]** Joseph Oesterlé, *Polylogarithmes*, Astérisque 216 (1993), Séminaire Bourbaki, exposé 762, pp. 49–67. [Author/public copy](https://www.numdam.org/item/SB_1992-1993__35__49_0.pdf). Read §§1.1–1.4, pp. 50–51; §§2.1–2.2, pp. 52–53; §3, equations (18)–(28), pp. 57–58; §4.1, equations (29)–(32), p. 59. Accessed 2026-10-20.

- **[G95]** Alexander B. Goncharov, *Geometry of configurations, polylogarithms, and motivic cohomology*, Advances in Mathematics 114 (1995), pp. 197–318. [Author/public copy](https://sasha-goncharov.github.io/Advances1995.pdf). Read §1.0, p. 201; only the classical differential recursion and Bloch–Wigner definition are used. Accessed 2026-10-20.

- **[G00]** Alexander B. Goncharov, *Explicit regulator maps on polylogarithmic motivic complexes*, arXiv:math/0003086v1 (2000). [Author/public copy](https://arxiv.org/pdf/math/0003086v1). Read §4.1, Proposition 4.1 and Lemma 4.2, printed pp. 17–20; analytic differential formulas only. Accessed 2026-10-20.

- **[GR]** Alexander Goncharov and Daniil Rudenko, *Motivic correlators, cluster varieties and Zagier’s conjecture on ζ_F(4)*, arXiv:1803.08585v5 (15 July 2026). [Author/public copy](https://arxiv.org/pdf/1803.08585v5). Read §1.1, equations (1)–(4), pp. 2–4; analytic normalization and cyclic five-term identity only. Accessed 2026-10-20.

Lewin, *Polylogarithms and Associated Functions* (North-Holland, 1981), is supplementary historical bibliography. All mathematical locators used for the targets above refer instead to the freely readable primary texts listed here.
