# Smith: current partial checkpoint

Codex — `codex-a71f92`, issue #1081. The following continuation is current; earlier reports are retained verbatim below as historical provenance.

## Continuation: closing the trial-measure formula gap (Codex, codex-a71f92, 22 September 2026)

This continuation supplies written proofs of the specific G8 formulas. It does not close G1–G7, general equilibrium/capacity theory, or the realization theorem, and it is not Lean formalization. All 146 earlier item IDs, statuses and statements are preserved, including the cc-fb70e5 separator repair. The current inventory is **155 items: 14 library, 2 planned, 139 missing**; four routes take every missing item exactly once. The 47 definitions/constructions retain their 141 proposed APIs and 141 proposed tests. The nine additions are theorems, not duplicate carriers.

### Fresh evidence and exact import boundary

I reread all 47 pages of [Smith v2](https://arxiv.org/pdf/2111.12660v2), with the same SHA-256 recorded above. I also read Serre's Appendix B in Aguirre–Peral, *The trace problem for totally positive algebraic integers*, printed pp14–18 and references pp18–19, in the [publisher-distributed preview](https://api.pageplace.de/preview/DT0400.9780511894121_A23680461/preview-9780511894121_A23680461.pdf), SHA-256 `a30183254a0583dd5d6c3357795e79014dd59ffb92e51cc0af0a41e22d8aed38`. Its formulas (8), (10)–(12) concern the required interval integrals. Its numerical maximization is not used as a proved optimization theorem here; other chapters were not read.

The official Annals Full Article link redirects via DOI to Project Euclid. The landing page and PDF endpoint both returned 1,161-byte HTML responses rather than the published PDF. G7 therefore remains open; no preprint/final agreement is inferred.

At the unchanged library pins, the full file `Mathlib/Analysis/SpecialFunctions/Integrals/PosLogEqCircleAverage.lean` supplies:

- Item 147, `circleAverage_log_norm_sub_const_eq_posLog`: the unit-circle average of log|ζ−r| is log⁺|r|, including |r|=1.
- Item 148, `circleIntegrable_log_norm_sub_const`: that logarithmic factor is integrable on every circle.

I read the entire file, including the unit-norm/log-sine proof. Its SHA-256 is `9b1498f882e4819fb0863f068728d3a075f27ea2c80cea3d8f3a6b24fe6590be`. Item 149 imports `TauCeti.map_cos_chebyshevAngleMeasure` from `TauCeti/Analysis/SpecialFunctions/Trigonometric/Chebyshev/Cosine/Transfer.lean`, SHA-256 `5fb25b310e341e633b2a7820f750a593b37a165d1cf0edad2ff85184b08250cb`. Its angular-measure definition, complete pushforward proof and cosine/arccos measure-preserving wrappers were read. The reviewed Orthogonal L2 Bases Part C audit and its evidence agree that this transfer is built. None of these general suppliers is replanned. Scoped searches for arcsine/Joukowski names in both library trees found no named interval-potential adapter; that is a scoped search, not a proof of global absence.

### G8-A: angular normalization and the endpoint-safe potential

Fix a<b, c=(a+b)/2, d=(b−a)/2>0 and ℓ=b−a. Let ρ be item 68's affine pushforward of (1/π)measureT. Item 149 gives

\[
\int f\,d\rho=\frac1\pi\int_0^\pi f(c+d\cos\theta)\,d\theta
=\frac1{2\pi}\int_0^{2\pi}f(c+d\cos\theta)\,d\theta.
\]

The second identity follows by reflecting the second half-circle. The adapter includes the corresponding integrability equivalence, not an assumption that f is continuous or bounded. On the open half-circle, |dt|=d sinθ dθ and √((t−a)(b−t))=d sinθ. Thus ρ has the claimed density, total mass one, no endpoint atoms and full support [a,b]. This is item 150; it only normalizes and transports the existing measure.

For z∈C put w=(z−c)/d. The roots of T²−2wT+1 are r and r⁻¹, and one can choose |r|≥1 because their product is one. For |ζ|=1,

\[
z-c-\frac d2(\zeta+\zeta^{-1})
=-\frac d2\zeta^{-1}(\zeta-r)(\zeta-r^{-1}).
\]

Take log absolute values away from the at most two exceptional angular points. Both logarithmic factors are integrable by item 148, including unit-norm roots. Using 147 and 150 gives

\[
-U_\rho(z)=\log(d/2)+\log^+|r|+\log^+|r^{-1}|
=\log(\ell/4)+\log|r|.
\]

Hence Uρ(z)≤−log(ℓ/4). Equality is equivalent to |r|=1, equivalent to w=(r+conjugate(r))/2∈[−1,1], hence to z∈[a,b]. This includes a and b: their quadratic has a repeated unit root, and each log factor remains integrable. No continuous complex-square-root branch or unjustified boundary limit is used. This is item 151.

Using `Real.log` inside the library integral is legitimate only after proving the exceptional set null. It does **not** replace the pointwise extended logarithm by `Real.log 0 = 0`. All external logarithms at zero below retain value −∞.

For an interval J of length h, split [a,b] at c. On its left half the density is bounded by √(2/ℓ)/(π√(t−a)); on the right use √(2/ℓ)/(π√(b−t)). Integrating each half and using √v−√u≤√(v−u) gives

\[
\rho(J)\le \frac{4\sqrt{2/\ell}}\pi\sqrt h.
\]

The density-weighted measure (√ab/t)ρ for a>0 has the same bound multiplied by √ab/a. This is item 152. A ball of radius e⁻ˢ meets the real line in an interval of length at most 2e⁻ˢ, so the negative-log singularity has integrable layer-cake bound K√2∫₀∞e⁻ˢᐟ²ds. The positive log part is bounded on compact support. Thus the logarithmic potentials here are finite at every complex z; their linear combinations and factorizations involve actual finite integrals.

For 0<a<b set s=√ab and A=a+2s+b. At z=0 choose r=−A/ℓ, whose modulus is >1. Item 151 now gives

\[
\int\log t\,d\rho(t)=\log(A/4).
\]

Also ∫t dρ=c since ∫₀πcosθ dθ=0. These are the elementary moment calculations in item 153. Identifying this probability as the minimizer of the general logarithmic energy, and deducing the abstract capacity formula, is still part of G1; the pointwise integral computation itself no longer requires that theorem.

### G8-B: inversion, probability and the value at zero

Let σ be arcsine probability on [1/b,1/a] and let ν be its inversion pushforward. For u=1/t,

\[
\sqrt{(1/a-u)(u-1/b)}
=\frac{\sqrt{(t-a)(b-t)}}{\sqrt{ab}\,t},
\qquad |du/dt|=t^{-2}.
\]

Consequently dν(t)=(√ab/t)dρ(t). In particular it is a probability, not merely a proportional density; inversion carries full support to [a,b]. This also proves ∫t dν=√ab and ∫t⁻¹dρ=1/√ab.

For z≠0 the identity |z−u⁻¹|=|z||z⁻¹−u|/u gives, with all terms integrable,

\[
U_\nu(z)=-\log|z|-U_\sigma(0)+U_\sigma(z^{-1}).
\]

The reciprocal interval has length ℓ/(ab), and its value of A is A/(ab). Applying G8-A shows

\[
U_\nu(z)+\log|z|\le \log(A/\ell),
\]

with equality for z∈[a,b]. At z=0 evaluate directly:
Uν(0)=∫log u dσ(u)=log(A/(4ab)). Thus the previous left side at zero is finite plus −∞. No continuity/limit interchange at zero is needed. Item 154 records the Jacobian and pullback; it supplies the proofs now attached to items 94 and 95.

### G8-C: trial-measure formulas and a nonmonic arithmetic check

For the exact γ∈(0,1) of item 119, put μ=γν+(1−γ)ρ. Probability, full support and finite potentials follow from G8-A/B. Their linear combinations give

\[
U_\mu(z)+\gamma\log|z|\le C=-\log(\ell/4)+\gamma\log(A/4),
\]

with equality on [a,b], together with

\[
L_\mu(X)=-\gamma\log(A/(4ab))+(1-\gamma)\log(A/4),
\qquad
\int t\,d\mu=\gamma\sqrt{ab}+(1-\gamma)(a+b)/2.
\]

These are items 120–122, now with proofs instead of an unresolved G8 formula import. The earlier exact-rational certificate was rerun unchanged: C<0, Lμ(X)>0 and mean<1.898304<1.89831.

There is a useful direct check that these conditions cover nonmonic integer polynomials. If Q≠X is primitive irreducible of degree n, with leading coefficient c and nonzero constant coefficient q₀, its roots αj are nonzero. Factorization and the potential inequality yield

\[
L_\mu(Q)=\log|c|-\sum_jU_\mu(\alpha_j)
\ge(1-\gamma)\log|c|+\gamma\log|q_0|-nC>0.
\]

Both |c| and |q₀| are at least one. Treat X using Lμ(X)>0, then multiply primitive irreducible factors with multiplicity and include integer content. Every nonconstant nonzero integer polynomial has strictly positive logarithmic integral; constants have nonnegative logarithmic integral. This is item 155. It proves the constraint certificate, not realization or the optimal trace constant. In particular, Serre's different numerical optimization problem is unnecessary for this conclusion.

### Ownership, tests and resume boundary

Items 150–154 go to the existing proposed PDELogarithmicPotentialPartII route (now 62 items); item 155 goes to NumberFieldConjugatesPartII (now 53). The GN and abelian routes remain at 15 and 11, including the two planned GN imports. The new library imports receive no missing-work route.

Discriminating acceptance cases are: mass one rather than π; [−1,1] endpoint potential log 2; [0,4] interval potential zero; [1,4] means 5/2 for ρ and 2 for ν; the reciprocal-interval logarithmic moment has the factor ab in its denominator; zero is allowed as an evaluation point, but not as the lower endpoint for inversion; and nonmonic Q=2X+1 must retain its leading-coefficient contribution. The numerical diagnostics below are not analytic proofs; the derivations above are the mathematical justification.

G8 is marked **paper-proof-supplied**, not formally implemented. G7 and all unrelated G1–G6 work remain open. The general equilibrium identification, full realization chain, weighted zero distribution, transference, protected-root gaps and Honda–Tate applications have not been upgraded. No self-review verdict or correction to the separate errata files is introduced. Preserve the historical text below as provenance; its earlier statement that G8 is unproved is superseded only by this continuation.


### Continuation validation and exact regression reproducer

The unchanged rational interval certificate below passes with identical bounds. In addition, the following standard-library script passes **3,205 exact rational assertions**. These finite tests target algebraic factors and Jacobians, not the all-parameter analytic theorem. Structural validation passed: all 155 item dependencies form a DAG with known endpoints; all 146 prior IDs/kinds/statuses/statements are preserved; all 139 missing items have exactly one route; API/test counts are unchanged; all 23 pinned declaration file hashes match. The paper checker and three-file intake check also passed.

```python
from fractions import Fraction as F
from itertools import product

checks = 0
def check(x):
    global checks
    assert x
    checks += 1
def add(z,w): return (z[0]+w[0],z[1]+w[1])
def neg(z): return (-z[0],-z[1])
def sub(z,w): return add(z,neg(w))
def mul(z,w): return (z[0]*w[0]-z[1]*w[1],z[0]*w[1]+z[1]*w[0])
def scale(s,z): return (s*z[0],s*z[1])
def norm2(z): return z[0]**2+z[1]**2
def inv(z):
    n=norm2(z)
    assert n
    return (z[0]/n,-z[1]/n)
roots=[(F(x),F(y)) for x,y in [(1,0),(-1,0),(0,1),(2,1),(F(1,2),0),(2,-3)]]
for a,ell,r,u in product(map(F,[-3,-1,0,F(1,2),1,2]),
                         map(F,[F(1,3),1,4,8]),roots,map(F,[0,F(1,3),1,2,-2])):
    b=a+ell;c=(a+b)/2;d=ell/2
    zeta=((1-u*u)/(1+u*u),2*u/(1+u*u))
    check(norm2(zeta)==1)
    w=scale(F(1,2),add(r,inv(r)))
    z=add((c,F(0)),scale(d,w))
    lhs=sub(sub(z,(c,F(0))),scale(d/2,add(zeta,inv(zeta))))
    rhs=scale(-d/2,mul(inv(zeta),mul(sub(zeta,r),sub(zeta,inv(r)))))
    check(lhs==rhs)
    check(norm2(lhs)==(d/2)**2*norm2(sub(zeta,r))*norm2(sub(zeta,inv(r))))
    check(mul(r,inv(r))==(1,0))
for a,ell,v in product(map(F,[F(1,100),F(1,2),1,3]),
                       map(F,[F(1,3),1,4,20]),map(F,[F(1,20),F(1,3),F(1,2),F(9,10)])):
    b=a+ell;t=a+v*ell;u=1/t
    check((1/a-u)*(u-1/b)==(t-a)*(b-t)/(a*b*t*t))
    check((1/t**4)/((1/a-u)*(u-1/b)) == (a*b/t**2)/((t-a)*(b-t)))
    # Squared norm identity for the singular logarithm pullback; avoid z=0.
    for z in [(F(2),F(1)),(F(-1),F(0)),(F(1,3),F(2))]:
        check(norm2(sub(z,(1/u,F(0))))==norm2(z)*norm2(sub(inv(z),(u,F(0))))/u**2)
check((F(1)+4)/2==F(5,2))
check(F(2)!=F(5,2))
check(F(87353,10**6)>0)
check(F(1102769,250000)-F(87353,10**6)>4)
check(0<F(43097,200000)<1)
print(f"PASS: {checks} exact rational assertions (finite algebra diagnostics, not integral proofs)")

```

## Historical checkpoints (preserved verbatim)

# Smith: prescribed distributions of algebraic conjugates

Codex, session `codex-c83e7a`; issue #1081. Status: **partial checkpoint**. The main preprint has been read completely, but the recursively used prerequisite proofs and the published-version comparison are not closed. Nothing in this extraction is claimed to be formalized.

The companion JSON contains 146 declaration-sized contracts: 11 library items, 2 planned items and 133 missing items. Every missing item has exactly one route. Its 47 definitions and constructions carry 141 proposed API statements, 141 proposed tests, and recorded consumers. The dependency graph is acyclic. These are planning contracts; the proposed Lean tests have not been executed.

**Source and version.** Alexander Smith, *Algebraic integers with conjugates in a prescribed distribution*, Annals of Mathematics 200 (2024), 71–122, [DOI 10.4007/annals.2024.200.1.2](https://annals.math.princeton.edu/2024/200-1/p02). The read text is [arXiv 2111.12660v2](https://arxiv.org/abs/2111.12660), dated 16 March 2024, with internal date 19 March: all 47 pages, including proofs and references. Its PDF SHA-256 is `99b3855a176ddb280630f50cbed23039c1348417aad31d817f34c3b60f4a35a9`. Publisher metadata and the author's publication link agree with this identification. The attempted public publisher PDF returned 404. All locators below refer to the preprint; none of the preprint corrections is asserted to occur in the final Annals text. Images of pages 1, 9, 11, 14, 33, 36 and 39 were also inspected.

**What the paper proves.** Theorem 1.5 is a precise characterization. Let Σ be a compact subset of the real line, with at most countably many connected components and logarithmic capacity strictly greater than one. A probability measure μ supported on Σ is a weak limit of the root distributions of infinitely many distinct monic irreducible integer polynomials, all of whose roots lie in Σ, exactly when

\[
\int\log|Q|\,d\mu\geq0\qquad(0\ne Q\in\mathbb Z[X]).
\]

Here logarithms at zeros take the value −∞. Replacing this by `Real.log 0 = 0` changes the condition. Nonmonic test polynomials, root multiplicities, distinct polynomials, the real ambient set, the component restriction and the strict capacity inequality are all retained in item 108. A capacity-one corollary identifies the only possible measure but does not prove realization there.

Theorem 5.11 identifies the asymptotic minimum of conjugate averages of a continuous function F with the optimal auxiliary-polynomial lower bound. On an unbounded closed Σ it requires F(x)/log|x| to tend to positive infinity. Its proof also produces a compactly supported minimizing arithmetic probability. Applying realization to Serre's trial measure gives the strict upper bound λ_SSS < 1.89831, contrary to the former expectation that this trace constant was two. The paper does not determine its exact value, and the trial measure is not optimal.

Honda–Tate then gives two separate infinite families of simple abelian varieties over each sufficiently large **square** prime-power field: normalized point counts at least q + 2√q − 0.89831, and at most q − 2√q + 2.89831. Integer translation by 2√q is why the square restriction matters. Ordinary geometric simplicity requires an additional congruence argument; it is not a consequence of irreducibility alone.

**Proof inventory and its boundaries.** Item numbers in this report abbreviate `PAPER-SMITH-24/<number>`.

| Items | Mathematical content | Remaining proof gate |
|---|---|---|
| 1–10 | Probability and root measures, extended logarithmic constraints, resultant necessity, degree growth | G3/G5 |
| 11–31 | Potentials, energy, capacity, equilibrium, domination, Hölder estimates, weighted zero distribution and Remez | G1 |
| 32–45 | Primitive gcd, fixed-size resultant, finite-grid nonvanishing, quantile estimates and nonmonic deflations | G1/G3 |
| 46–66, 139–140, 145–146 | Lattices, minima, Gaussian transference, crosspolytope flatness, weighted evaluation bodies and small squarefree integer polynomials | G2/G3 |
| 67–93 | Arcsine normalization, general compact-set Chebyshev polynomials, protected roots, complementary factors and Eisenstein approximation | G1/G4 |
| 94–108 | Inward smoothing, sweetening, finite-energy reduction and the final diagonal | G1/G5 |
| 109–126, 137–138, 144 | Compact confinement, auxiliary duality, trace bound, support obstruction and limits of the hypotheses | G5/G8 |
| 127–135, 141–143 | Honda–Tate, point-count norms, finiteness, Taylor expansion and congruence refinement | G6 |

The key construction has several distinct stages. Quantile polynomials first approximate a Hölder measure and control a weighted Vandermonde product. Minkowski's second theorem yields short independent integer polynomials. A bounded squarefree combination, followed by a gcd-degree argument, produces a small squarefree integer polynomial of prescribed degree. This intermediate polynomial is neither required to be monic nor to have its roots in Σ.

Separately, a pruned Chebyshev polynomial and triangular coefficient corrections produce a monic real polynomial whose high coefficients are even and whose roots have protected sign intervals. A complementary polynomial avoids the other factor's roots. Its last shift is a **real**, least nonnegative number; it is not an integer shift. Integer rounding of the low coefficients then gives the constant coefficient 2 modulo 4, so Eisenstein supplies irreducibility. The error must be smaller than every protected endpoint margin before the intermediate value theorem supplies root containment. Weighted norm convergence needs both the upper estimate and the weighted monic lower bound in item 28.

For a general arithmetic measure, one-sided smoothing alone can lose the logarithmic constraints. Sweetening adds a controlled equilibrium component to restore them. Finite energy removes all singleton components of Σ, including nonisolated ones, and finite unions of nondegenerate intervals retain a capacity-greater-than-one seed. A diagonal argument then gives strictly increasing degrees, rather than merely repeating an exceptional irreducible polynomial.

**Library baseline.** Statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The JSON records 20 declarations with modules, source lines, file hashes and statement excerpts. The reviewed coverage audit was read for lattices and successive minima, the Chebyshev measure, abelian-scheme ingredients and Frobenius conclusions. The full PDE and completed Orthogonal L2 Bases upstream documents were read. The NumberFieldArithmetic document was read at its boundaries, baseline supplier list and exclusions; no full read of that much longer document is claimed.

The useful existing interfaces are probability measures and their bounded-continuous weak topology; additive measure convolution; fixed-size resultants, base change and split-root products; integer lattices and determinant covolumes; Minkowski's first theorem; Eisenstein irreducibility; the Chebyshev measure of mass π; and the field-level abelian-variety carrier. Additive convolution names are generated by the inspected `to_additive` declarations. Their source provenance is explicit in the JSON.

Several near matches must not be promoted to baseline claims. Minkowski's first theorem does not give the product of successive minima. The Chebyshev orthogonality measure must be divided by π and transported affinely to produce an arcsine probability. Classical interval Chebyshev polynomials do not provide minimax polynomials on arbitrary finite unions of intervals. Finiteness of bounded integral elements in one number field does not immediately prove bounded-degree polynomial finiteness across varying fields. An abelian-variety structure does not provide Honda–Tate classification or the point-count dictionary. Gauss, valuation and compactness adapters whose precise pinned signatures remain uninspected are recorded as missing, not as invented library declarations.

**Routes.** The ownership screen used all 211 current roadmap extracts, the available new-roadmap and packet files, reserved identifiers and the reviewed audit at explorer commit `fed53d6e8f8c7e36e1c34e49e261c00c4980d23c`. The JSON retains the input hashes.

1. **Partial differential equations, Part II: logarithmic potentials and weighted approximation** — proposed ID `PDELogarithmicPotentialPartII`, 57 items. Existing PDE Lane C owns harmonic functions, maximum principles, Green/Perron theory and Newtonian potentials. The extension adds logarithmic energy and capacity, external fields, weighted polynomial asymptotics, quantile estimates, Remez division and analytic smoothing. It imports the completed Chebyshev-measure API. The generic analytic core must remain independent of arithmetic constraint preservation; the inward-smoothing statement is to be split at that boundary.
2. **Number fields …, Part II: prescribed conjugate distributions** — proposed ID `NumberFieldConjugatesPartII`, 52 items. This begins beyond the upstream number-field arithmetic and minimal-polynomial infrastructure. It owns the resultant constraints, nonmonic deflation arithmetic, integer polynomial approximation, realization theorem, auxiliary duality and trace application. It imports potential theory and geometry of numbers. Arithmetic Dynamics DY.4 concerns small points for polarized dynamics; PM.2 concerns Weyl/discrepancy methods. Neither supplies the arbitrary prescribed distribution theorem.
3. **Geometry of numbers and quadratic arithmetic**, source route to `GN.1` and `GN.4`, 15 items. The two explicitly planned items are successive minima and Minkowski's second theorem in GN.1. Evaluation bodies and their volume/minimum formulas belong there; lattice covering, width, transference and flatness belong to GN.4. The Gaussian estimates here are the body-gauge suppliers used in that proof, not a second probability roadmap. No finer reviewed supplier node was found in the inspected inputs.
4. **Abelian Schemes And Arithmetic Moduli, Part II: Honda–Tate and extreme point counts** — proposed ID `AbelianSchemesFiniteFieldsPartII`, 11 items. A3–A6 supply torsion, Tate modules and Hom/End theory. WC.3 supplies Frobenius integrality and purity, not the classification/existence converse. The extension owns that converse, the norm/dimension adapter, finite-isomorphism-class quantifiers and the point-count applications. It imports the conjugate-distribution theorem.

These are design briefs, not new roadmap files or claims that an unreviewed route is already integrated. Every routed missing item has one owner. Imports are to be placed at the appropriate stages so the analytic and arithmetic roadmap names do not introduce a circular proof dependency.

**Source checks that changed the extraction.**

- BLPS Corollary 2.5 is stated for simplices. Smith's rounding body is a crosspolytope. The needed bound follows from BLPS Proposition 2.3 and the **polytope clause** of Theorem 2.4, since the body has 2n vertices. Lemma 2.1 has μ(K,L) λ₁(H,L*) on its left side; the minimum is taken in H, not H's polar. These precise imports are in items 54–56.
- Page 9's discriminant specialization argument needs a fixed-size resultant when the leading coefficient can vanish. For a quadratic, b² − 4ac can remain nonzero at a = 0, whereas the fixed-size resultant of F and F′ vanishes. The pinned resultant already accepts the independent degree bounds needed for this repair.
- Page 1's trace-constant wording says “least real number” for a downward-closed family of finite-exception thresholds. Item 117 uses the liminf convention of Example 5.9, equivalently its greatest threshold. Page 11's polynomial/potential identity needs absolute value on the polynomial. Page 14's least scaling factor needs λ ≥ 0.
- Page 33's convolution estimate for a general finite measure omits its mass factor. Item 97 includes μ(R); the source's later subprobability applications can absorb it into the constant.
- Page 36's interval exhaustion must discard every singleton component, not just isolated points. For example, `{2} ∪ {2+1/n : n≥1} ∪ [0,1]` has a nonisolated singleton component at 2. Finite energy is what makes all these countably many components negligible.
- A derivative sup norm on Σ cannot bound differences across arbitrary gaps by the fundamental theorem of calculus alone. Item 86 separates points in the same component from points separated by a fixed positive gap.
- The separation argument in Theorem 5.11 initially yields nonnegative auxiliary coefficients. An isolated point at which only a zero-coefficient polynomial vanishes cannot be dismissed by declaring the right side −∞. Item 114 records a positive-coefficient perturbation, with a small loss of bound, as an outstanding proof step. It avoids `0 · (−∞)` and retains unbounded-tail coercivity.
- BCWLPS Proposition 5.8 gives sufficient congruences modulo a generally larger L, with L < q^23. It does not on its own prove Smith's Remark 5.14 assertion about modulo 4q. Item 135 leaves that exact adapter open. Ordinary geometric simplicity is not silently included in Corollary 1.3.

**The certified numerical example.** Use exact rationals a = 87353/10^6, b = 1102769/250000 and γ = 43097/200000. Write ρ for arcsine probability on [a,b], and ν for its inversion-derived companion with density √(ab)/(πx√((b−x)(x−a))). Smith's measure is γν + (1−γ)ρ. Here b−a > 4, so the support capacity exceeds one.

Items 120–122 state the analytic formulas. Independent exact rational interval arithmetic gives:

| Quantity | Lower endpoint | Upper endpoint |
|---|---:|---:|
| Potential constant C | −0.0000001285852310814315138 | −0.0000001285852310814315137 |
| Logarithmic moment L(X) | 0.0000014512796048201949015 | 0.0000014512796048201949016 |
| First moment | 1.8983031191782372753216558 | 1.8983031191782372753216559 |

The square root is enclosed by integer square root at scale 10^35. Each logarithm is reduced to [1,2] by powers of two. For t = (x−1)/(x+1), 48 terms of `2 Σ t^(2j+1)/(2j+1)` have positive remainder at most `2 t^97 / (97(1−t²))`. All arithmetic is rational, and decimal endpoints are rounded outwards. Thus C < 0, L(X) > 0 and the mean is below 1.898304, with no floating-point inference. This certifies the numerical inequalities conditional on the analytic formulas; it does not prove those formulas or realization. A self-contained reproducer is appended below.

**Read prerequisite sources and remaining work.** The source archive in the JSON records URLs, access dates, SHA-256 hashes, failed fetches and exact reading scopes. BLPS's author PDF pages 1–16 were read, including the polytope proof; pages 17–32 and its Banaszczyk/Talagrand suppliers remain unread. CSZ's published pages 217–239 were read, including alternation, inverse-image bands, gap mass and the finite-gap Totik–Widom proof on page 236; pages 240–245 were not read. Kadets v4 pages 1–5 were read, including the Honda–Tate norm dictionary and square-field Taylor argument; pages 6–9 were not read. BCWLPS pages 5, 8–10 and 12 were read, covering the classification statement, congruence sufficiency and coefficient adjustment; its other pages and original classification sources remain unread. Serre's Bourbaki text pages 3–6 and 25–27, and Saff's 2010 survey pages 171–175, 181–184 and 196–199 were read. A survey that points to a book proof is not recorded as closing that proof.

The next worker should begin with G7's final/preprint comparison and G1's weighted zero-distribution input, then close G2's deep transference and second-minimum suppliers. G3/G4 require further proof-sized splits and pinned algebra adapters; G5 requires the positive-separator and support arguments; G6 requires original Honda–Tate and finiteness proofs plus the congruence refinement. G8 separates the exact numerical certificate from the remaining analytic formula proofs. Preserve the existing item identifiers when extending the checkpoint.

**Validation.** `scripts/check_paper.py` and the intake check of all three existing deliverable files pass. The custom audit checks all 146 item dependencies for acyclicity and known endpoints, one route per missing item, API/test presence and roles, and all 20 pinned declaration file hashes and recorded names. There are 569 exact finite assertions: the fixed-size quadratic resultant including degree drop, sweetening's mass identity, exact parameters and a nonmonic deflation example. The rational interval certificate passes. These diagnostics do not close all-parameter theorems. No Lean file is an authorized deliverable for this paper job, and no Lean compilation is claimed.

**Reproduce the numerical certificate with Python 3 (standard library only).**

```python
from fractions import Fraction as Q
from math import isqrt
import json
class I:
 def __init__(self,a,b=None):self.a=Q(a);self.b=Q(a if b is None else b);assert self.a<=self.b
 def __add__(self,o):
  if not isinstance(o,I):o=I(o)
  return I(self.a+o.a,self.b+o.b)
 __radd__=__add__
 def __neg__(self):return I(-self.b,-self.a)
 def __sub__(self,o):return self+-o
 def __rsub__(self,o):return -self+o
 def __mul__(self,o):
  if not isinstance(o,I):o=I(o)
  v=[self.a*o.a,self.a*o.b,self.b*o.a,self.b*o.b];return I(min(v),max(v))
 __rmul__=__mul__
 def __truediv__(self,o):
  if not isinstance(o,I):o=I(o)
  assert o.a>0
  return self*I(1/o.b,1/o.a)
def sqrt_interval(x):
 s=10**35;k=isqrt(x.numerator*s*s//x.denominator);v=I(Q(k,s),Q(k+1,s));assert v.a*v.a<=x<=v.b*v.b;return v
def reduced_log(x):
 assert 1<=x<=2
 u=(x-1)/(x+1);N=48
 v=2*sum((u**(2*j+1)/Q(2*j+1) for j in range(N)),Q(0))
 error=2*u**(2*N+1)/((2*N+1)*(1-u*u))
 return I(v,v+error)
log2=reduced_log(Q(2))
def log_rational(x):
 assert x>0;k=0
 while x>=2:x/=2;k+=1
 while x<1:x*=2;k-=1
 return reduced_log(x)+k*log2
def log_interval(x):return I(log_rational(x.a).a,log_rational(x.b).b)
def show_bound(x,digits=25):
 scale=10**digits;lo=x.a.numerator*scale//x.a.denominator;hi=-((-x.b.numerator*scale)//x.b.denominator)
 def fmt(n):
  sign='-' if n<0 else '';n=abs(n);return sign+str(n//scale)+'.'+str(n%scale).zfill(digits)
 assert Q(lo,scale)<=x.a<=x.b<=Q(hi,scale)
 return [fmt(lo),fmt(hi)]
a=Q('0.087353');b=Q('4.411076');g=Q('0.215485');root=sqrt_interval(a*b);A=a+2*root+b
C=-log_interval(I((b-a)/4))+g*log_interval(A/4)
L=-g*log_interval(A/(4*a*b))+(1-g)*log_interval(A/4)
mean=g*root+(1-g)*(a+b)/2
assert C.b<0 and L.a>0
assert Q('1.898303')<mean.a<=mean.b<Q('1.898304')<Q('1.89831')
result={'method':'Exact rational interval arithmetic. Sqrt bracket by integer square root at scale 10^35. Log range reduction to [1,2], 48 positive atanh-series terms and geometric tail bound. Display endpoints rounded outward to exact 25-place decimals.','a':str(a),'b':str(b),'gamma':str(g),'potentialConstant':show_bound(C),'logMoment':show_bound(L),'mean':show_bound(mean),'claims':['potentialConstant < 0','logMoment > 0','1.898303 < mean < 1.898304 < 1.89831'],'scope':'Certifies numerical inequalities in Smith v2 Example 5.16, conditional on the proved integral/potential formulas. It does not certify those analytic formulas or the main realization theorem.'}
print(json.dumps(result,indent=2))
```

## Continuation: the separator repair of Theorem 5.11 (Claude Code, cc-fb70e5, 22 September 2026)

The separation argument yields a₀<0 and a_i≥0, but λ_Smyth needs a_i>0. The printed step "the right is −∞" also fails at roots of zero-coefficient Q_i, where the term is 0·(−∞). Item 114 now carries a proof of the repair.

Add E_ε=εΣ_{a_j=0}log|Q_j|. This is −∞ exactly at the problematic roots, so isolated points of Σ are covered automatically, and it is bounded above elsewhere:
- **Compact Σ.** The bound on E_ε costs at most ε·Σlog⁺max_Σ|Q_j| in λ.
- **Unbounded Σ.** Split F=(1−t)F+tF. The growth condition (5.11) makes tF dominate E_ε outside a compact set, and on that compact set E_ε is bounded.

All coefficients are then positive, and letting ε→0 and then t→0 recovers λ_N−1/N. The source-level gap is errata PAPER-SMITH-24/E5.
