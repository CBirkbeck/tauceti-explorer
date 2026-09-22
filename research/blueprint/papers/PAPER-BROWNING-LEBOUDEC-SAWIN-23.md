# The Hasse principle for random Fano hypersurfaces

Paper extraction checkpoint for #1095. Codex, session `codex-a71f92`, 22 September 2026. Status: **partial**.

## What is established here

The [2020 preprint](https://arxiv.org/pdf/2006.02356v1) proves a density-one Hasse principle for degree-d hypersurfaces in projective n-space when 2≤d≤n, except cubic surfaces. It also identifies the typical scale of the least rational-point height. The [journal record](https://annals.math.princeton.edu/2023/197-3/p03) has the same title, authors and main result, but its revised 89-page text has not been obtained. All locators and findings below concern the 66-page arXiv v1, **not a verified transcription of the published proof**.

All 66 preprint pages, including proofs and references, were read. The companion JSON has 122 items: 5 pinned-library substrates, 4 existing planned items, and 113 missing items, each routed exactly once. All numbered primary results are represented. Remaining unnamed constructions, external inputs and proof closure are explicitly recorded in G1–G10; this is not a complete extraction or a formalisation.

## Source ledger

- Main PDF: arXiv:2006.02356v1, 3 June 2020, retrieved 22 September 2026; SHA-256 `210c746b6b69d466d19a0a90e8f00ca57bf2d4dfb1818b0a9955fe91ae061efb`.
- Published citation: Annals of Mathematics 197 (2023), 1115–1203; DOI `10.4007/annals.2023.197.3.3`. The record identifies a revised version dated 22 July 2022. No proof-equivalence inference is made from matching metadata.
- Version/correction checks: publisher, arXiv version history, ISTA bibliographic record, [Browning's publications](https://tdbrowning.github.io/pubs.html), [Le Boudec's papers](https://pierreleboudec.github.io/works.html), and [Sawin's page](https://williamsawin.com/) with its papers list. All three authors point to the preprint. No correction was located in these checks or a title/author erratum search. Whether the published text already repairs any finding is unknown.
- Ambiguous extracted equations were checked on rendered PDF pages, particularly pp.14,18,20,23,26,44,54,60–63. The apparent missing absolute value and wrong sign in text extraction on p.63 were image-checked and are **not** findings.

The original inputs consulted were:

| Source | What was actually read | Retrieved PDF SHA-256 |
|---|---|---|
| [Poonen–Voloch, Random Diophantine equations (2004), with Colliot-Thélène and Katz appendices](https://math.mit.edu/~poonen/papers/random.pdf) | pp.1–5 through Cor.A.2 | `e4ec66ff04e6b6bf86f08bd66756e415c6e6be884cf1d49fa36d9428c4199045` |
| [Le Boudec, Height of rational points on random Fano hypersurfaces, ANT 15 (2021), 657–672](https://arxiv.org/abs/2006.02288v1) | Least-height lower bound, primitive-ball counts and determinant formula. Read Thms.1,3, Lemmas 3–5 and selected proofs; not full source closure. | `cb782025395c1c755d133328654dfbc61846389689a8dda893354c05fea882b8` |
| [Barroero–Widmer, Counting lattice points and o-minimal structures, IMRN (2014), 4932–4957](https://arxiv.org/abs/1210.5943v2) | Uniform lattice counting for changing angular bands and residue-class fibers. pp.1–5 incl. Thm.1.3 read; complete proof not yet decomposed. | `6e8dc86deab20529a74fd6a5a9b2019531167aac070620782af73c41f0304a2b` |

The remaining original sources in the JSON prerequisite list are acquisition/proof-closure tasks, not papers claimed to have been read. Where an original URL was not established, the link deliberately points to the citing paper and the note says so. Searching the paper catalogue and existing extractions did not locate dedicated extractions of these original lattice/local-density inputs. Existing broad roadmap coverage is distinguished from a source-closed proof.

## Conventions that cannot be changed silently

Write N=binomial(n+d,d). Hypersurfaces are projective coefficient classes with primitive integral representatives ±a and height ||a||. This is an embedded-equation family, not a count of isomorphism classes. Rational points also have primitive ± representatives, with anticanonical height ||x||^(n+1−d). Thus the incidence count has factor 1/2, and the off-diagonal lattice main term has factor 1/8. Both diagonal signs x=±y must be removed.

Veronese vectors list unweighted monomials. Multinomial-weighted coordinates would change the Euclidean statements. Every lattice determinant is intrinsic covolume in its real span. A quotient lattice is the image under orthogonal projection, and its denominator sublattice must be saturated in the numerator. A congruence kernel is full rank, usually not saturated in the ambient integer lattice; an exact nonzero linear kernel has codimension one.

The local factors used in the proof are finite: W(B) grows with B, and the real window has width controlled by alpha(B)=log B. Do not replace them by infinite singular factors. Point-height functions in the least-height result need not be monotone. All asymptotics fix d,n and exclude small B where log log B or its denominator is invalid.

## Main results and proof dependencies

For 2≤d≤n, (d,n)≠(3,3), the proportion of all coefficient classes with a rational point tends to the everywhere-local-solubility density. For any positive psi with psi(u)/u→infinity, the proportion with least point height at most psi(||a||) tends to that same density. Combined with Le Boudec's lower-scale theorem, this gives M(V) of order ||a|| up to any factor tending to infinity, on a density-one subset of the locally soluble family, except conics and cubic surfaces. Conics have local density zero; conditioning a density-one assertion on that zero-density family is invalid.

Corollary 1.2 includes a positive proportion of soluble cubic surfaces by a separate plane-cubic input; it does not establish the density-one Hasse principle for cubic surfaces. The quantitative exceptional density is O((log A)^(-1/(48n))) outside cubic surfaces; the conic case follows separately from Hasse–Minkowski.

The main proof has two independent quantitative branches:

```text
GN lattice counting + Veronese incidence + quartic-threefold estimates
    -> global, mixed, localized second moments (same leading term)
    -> variance cancellation -> discrepancy tail (Proposition 2.3)

finite prime-power density moments + gradient/Hensel bounds
    -> finite-place lower tail -----+
real gradient strata + real factor lower bound
    -> real-place lower tail ------+-> localized-count lower tail (2.4)

2.3 + 2.4 + local density + dyadic coefficient shells
    -> least-height theorem -> density-one Hasse principle
```

The JSON gives selected acyclic internal dependencies and proof outlines. These are not the full dependency closure. In particular G9 isolates the small-cutoff portion in the partial summation of the diagonal estimate (4.71); it is an unresolved check, not a certified source error. The quartic-threefold branch uses the first and 56th minima of rank-68 double kernels in coefficient space R^70, together with the rank-15 quartic span of a rank-three point lattice. Dropping that branch would silently omit a main parameter case.

Poonen–Voloch's original local-density theorem counts sup-norm boxes. Its primitive restriction is stated in Remark 2.1. The target paper uses Euclidean balls: prove the needed shape-sensitive real density and sieve tail transfer. Equivalence of norms alone does not identify the limiting constant for these two shapes (G2).

## Library audit and routing

Library pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Atlas/source base: `c6f6181bce51ae15717cd874543c76de34cee4b0`.

Reviewed audits read: AUDIT-02 (GN.0/GN.1/GN.4/GN.5), AUDIT-07 (ST.0/ST.2/ST.5), AUDIT-09 (RP.0/RP.2). Full relevant stage descriptions and GlobalQuadraticForms Layer 5 were inspected. Searches also covered new roadmap records, packets, reserved ids, integrated decompositions and links. The absence observations are scoped searches, not a proof that no related declaration exists anywhere.

| Existing substrate | Pinned declaration actually opened | Boundary |
|---|---|---|
| Homogeneous polynomial space | `MvPolynomial.homogeneousSubmodule` | Lexicographic coefficient isometry and evaluation bridge remain |
| Full lattice in its span | `IsZLattice` | Supply the paper's intrinsic-span bridge |
| Covolume | `ZLattice.covolume`, `covolume_eq_measure_fundamentalDomain` | Gram formula for lower-rank embedded lattices remains |
| Covolume/index | `ZLattice.covolume_div_covolume_eq_relIndex'` | Supply saturated-kernel/index computations |
| Integral bilinear-pairing module | `LinearMap.BilinForm.dualSubmodule` | Restrict to span and prove Euclidean dual geometry |

Tau Ceti's stronger fraction-field dual-module equivalence was read but is not asserted to apply directly to Z⊂R. Searches for successive minima, Banaszczyk, Veronese, Barroero and random hypersurfaces in both pinned trees found no dedicated quantitative statements used here. A quiver-theoretic “Fano” hit is unrelated. Successive minima/Minkowski's second theorem are already GN.1 plans; Hasse–Minkowski is the existing Tau Ceti roadmap's Layer 5 plan, not a new random-Fano theorem to re-plan.

| Route | Items | Why it owns them |
|---|---:|---|
| GeometryOfNumbersAndQuadraticArithmetic:GN.0 | 13 | Intrinsic-span and saturation bridges, not reimplementation of the audited full-lattice/covolume carrier. Exact kernels and orthogonal quotients belong to the existing lattice layer. |
| GeometryOfNumbersAndQuadraticArithmetic:GN.4 | 16 | Provide the existing quantitative lattice-point/transference layer with a precise source. Fixed-family uniformity, intrinsic dimensions and primitive weighted counts must be proved; GN.1 supplies successive minima. Do not duplicate ST.2's use of these tools. |
| ArithmeticStatistics:ST.0 | 4 | Embedded coefficient families, sign quotients, Euclidean orderings and finite local conditions instantiate the existing families-and-measures layer. They are not isomorphism-weighted moduli counts. |
| ArithmeticStatistics:ST.2 | 2 | The local-density product and its tail/shape transfer belong to the existing infinite-local-condition uniformity owner. |
| ArithmeticStatistics:ST.5 | 5 | Finite local density moments and gradient strata are source-scoped local statistics, already in this layer's direction. |
| HeightsRationalPointsAndObstructions:RP.2 | 1 | The optional Brauer-vacuity comparison belongs to the existing adelic/Brauer owner. It is motivation, not an assumption proving the main result. |
| Heights, rational points and obstructions, Part II: random Fano hypersurfaces and least-point heights (HeightsRationalPointsPartIIRandomFano) | 72 | RP.0–RP.6 plan height/obstruction foundations, not density-one Hasse principles or the sharp typical least-point bound. This extends their direction. The separate SS23 random-fibration proposal uses prime-polynomial specialization, not these hypersurface incidence lattices; share ST/GN inputs but do not merge proof ownership by title alone. |

The Part II imports existing height/local-obstruction foundations and GN/ST machinery. It is not a new generic geometry-of-numbers roadmap. Its finite-incidence/variance proof is also distinct from the Sawin–Shusterman random-fibration extraction's prime-polynomial specialization; shared foundations should be imported, not copied. The exact design brief, all imported roadmap ids and suggested file `TauCeti/NumberTheory/RandomFano/HassePrinciple.lean` are in the JSON. No Lean file was generated in this paper-only job.

## Preprint source findings awaiting independent review

These findings were checked by the extracting worker, not independently confirmed. They concern v1 only. Nothing was sent to authors. None is offered as a disproof of the published main theorem. Corrected statements, or explicit source-closure requirements for repairs, are used in the extracted items.

### E1 — error; affects the proof

Locator: arXiv:2006.02356v1, Lemma 3.15, p.18, degree-d spanning display; published version not compared.

Printed fragment: `Span_R{P(X)L_(i,j,k)^(x,y)(X):P∈M_(d−2,n)}={Q∈R[X]_(d):Q(x)=Q(y)=0}`.

The displayed L is linear, so the left side has degree d−1. Even replacing d−2 by d−1 would describe forms vanishing on the whole line, excluding X0^{d−1}X1 when x=e0,y=e1. The corrected quadratic ideal supplies the needed N−2 spanning vectors and retains their monomial-multiplication norm bound.

Repair: Replace the left generators by products P*Q2 with Q2 any quadratic form vanishing at x and y. Prove I_d=R[X]_(d−2) I_2; the coordinate normal form of the two-point ideal is (X2,...,Xn,X0X1).

Correction status: No correction located; whether the published revision already repairs this is unknown.

### E2 — error; affects the proof

Locator: arXiv:2006.02356v1, §5.3, p.61, (5.31); used on p.65; published version not compared.

Printed fragment: `B_N(1)∩I^loc=union_(ell≥1) B_N^(M/2^ell)`.

The unit coefficient vector of f=X0^d, d≥2, has real projective zeros but every such zero has zero gradient; it belongs to no positive-gradient stratum. The discriminant/nullity repair is an explicit prerequisite, not an assumption that the exceptional set is empty.

Repair: The equality holds for forms with at least one regular real zero. Add the null set of forms whose real zeros are all singular, and prove its nullity before the integral inequality.

Correction status: No correction located; whether the published revision already repairs this is unknown.

### E3 — error; affects a stated result

Locator: arXiv:2006.02356v1, Lemmas 3.19,3.20 pp.20–21; (3.24), Lemmas 3.21,3.22 pp.21–24; published version not compared.

Printed fragment: `log Delta`.

At Delta=1, coordinate vectors and independent coordinate pairs lie in determinant-one containing lattices, yet the printed logarithmic factors vanish (for Lemma 3.20 choose r≥3). For quartic pairs choose x=e0,y=e1 and a unit coefficient of a mixed monomial: lambda_1≤1 and d_3=1, so ell^(1)(1;1,1)>0. Changing log changes no large-parameter saving.

Repair: Use log(2Delta) in endpoint-uniform upper bounds for Delta≥1, or separately state and prove Delta in a fixed interval near 1. Propagate the replacement through the dyadic sums.

Correction status: No correction located; whether the published revision already repairs this is unknown.

### E4 — error; affects the proof

Locator: arXiv:2006.02356v1, Proof of Lemma 5.8, p.60, definition of M_a; published version not compared.

Printed fragment: `M_a=max{t∈(0,1]:a+t(b−a)∈I^loc}`.

Take d=2,n=3, f_a=X0²+X1²+X2² and f_b=f_a+epsilon X3² with 0<epsilon≤1. Then a∈U(A) for A≥sqrt(3), but every positive-time form is positive definite. The printed set is empty; a crossing at t=0 must be allowed.

Repair: Use the closed real-soluble coefficient cone, including the zero coefficient vector, and t∈[0,1]. If the crossing point is zero its gradient vanishes trivially; otherwise use the regular-zero openness argument.

Correction status: No correction located; whether the published revision already repairs this is unknown.

### E5 — error; affects the proof

Locator: arXiv:2006.02356v1, Proof of Lemma 3.21, p.23, preceding (3.31); published version not compared.

Printed fragment: `at most 4 values`.

The quartic t1²t2² is nonzero. For any chosen coordinate, setting the other coordinates appropriately to zero leaves an unrestricted fiber, so no single coordinate has at most four values on every fiber. An induction on the polynomial coefficients gives the needed grid bound without this assertion.

Repair: The claimed fixed-coordinate fiber assertion needs replacement by a bounded-degree anisotropic grid-zero bound, proved by induction including fibers on which the polynomial vanishes identically. For ordered side lengths H1≥H2≥H3≥1, a nonzero quartic has O(H1 H2) zeros in the box.

Correction status: No correction located; whether the published revision already repairs this is unknown.

### E6 — error; affects the proof

Locator: arXiv:2006.02356v1, §4.5 p.44 (4.57), p.49 second equality of (4.69); published version not compared.

Printed fragment: `1+O(1_(G(x,y) does not divide W/rad(W)))`.

Inverting (4.56) is invalid on the bad set: 1+O(1) may approach zero. For x=e0,y=e0+q e1 with prime q>w(B), q within the height ball, G=q and gcd(q,W)=1. With ell=1 the determinant divided by its printed leading factor is q, unbounded. The following moment calculation only requires the corrected reciprocals.

Repair: State these approximations for reciprocal determinants. Exact determinants are W||nu(x)||/[gcd(ell,W)gcd(G,Q)] and W²/[gcd(ell,W)²gcd(G,Q)], Q=W/gcd(ell,W). Their reciprocals have the claimed bounded relative indicator error because 0<gcd(G,Q)/G≤1.

Correction status: No correction located; whether the published revision already repairs this is unknown.

### E7 — misprint; affects nothing

Locator: arXiv:2006.02356v1, Proof of Lemma 3.24, p.26, (3.38)–(3.39); published version not compared.

Printed fragment: `V(L)* ∩ B_5(J)`.

V(L) and its Euclidean dual are lattices in R^70; rank is 15, while 5 belongs to the original point-coordinate space. The printed intersection is ill-typed.

Repair: Replace B_5 by B_70, or by the induced Euclidean ball in the 15-dimensional real span.

Correction status: No correction located; whether the published revision already repairs this is unknown.

### E8 — error; affects the proof

Locator: arXiv:2006.02356v1, Proof of Lemma 5.10, p.63, immediately after the tau identity; published version not compared.

Printed fragment: `||nu_(d,n)(u)||≥||u||^d`.

For d=2,u=(1,1,0,...), ||nu(u)||²=3 whereas ||u||^(2d)=4. The pure maximum-coordinate monomial gives the corrected lower bound, which is enough for the stated Vinogradov estimate.

Repair: Use (n+1)^(−d/2)||u||^d≤||nu(u)||≤||u||^d and adjust the fixed d,n-dependent cutoff in the following volume lower bounds.

Correction status: No correction located; whether the published revision already repairs this is unknown.

### E9 — misprint; affects nothing

Locator: arXiv:2006.02356v1, Proofs of Lemmas 3.14 and 3.15, pp.14,18; published version not compared.

Printed fragment: `Lambda_x=Ra1⊕...⊕Ra_n`.

A discrete lattice is not a real vector space. The chosen independent vectors span its real span; they are not asserted to be an integral basis. That real-span equality is all the subsequent argument needs.

Repair: Put span_R around the lattice on the left; likewise around the intersection of Veronese kernels on p.18.

Correction status: No correction located; whether the published revision already repairs this is unknown.

### E10 — gap; affects the proof

Locator: arXiv:2006.02356v1, Proof of Lemma 5.9, p.62, step before (5.33); published version not compared.

Printed fragment: `x∈D_a(lambda/2)`.

Membership in B_N^(lambda) gives a zero with gradient at most 2lambda||a||, hence membership in D_a(lambda), not D_a(lambda/2). The printed neighborhood argument uses the latter without establishing it. Enlarging the scale retains the O(lambda²) conclusion.

Repair: Starting from the stratum witness in D_a(lambda), prove its spherical neighborhood lies in D_a(C lambda), for a fixed C>1; apply Fubini at that enlarged scale and absorb the constants.

Correction status: No correction located; whether the published revision already repairs this is unknown.

### E11 — misprint; affects the proof

Locator: arXiv:2006.02356v1, Proof of Lemma 5.5, p.54, collinear/noncollinear case split; published version not compared.

Printed fragment: `g∈(Z/pZ)^×`.

The vectors b1,b2 live modulo p^r. There is no canonical scalar action of Z/pZ on Z/p^r Z for r>1. Collinearity only modulo p does not make the two modulo-p^r equations identical.

Repair: Use g∈(Z/p^r Z)^× and equality in (Z/p^r Z)^(n+1), or work throughout with determinantal ideals over Z/p^r Z and avoid this split.

Correction status: No correction located; whether the published revision already repairs this is unknown.

### E12 — misprint; affects nothing

Locator: arXiv:2006.02356v1, Proof of Lemma 3.15, p.16 (3.16) and p.18 (3.18); published version not compared.

Printed fragment: `lambda_1((Q2(x,y)^perp)*)`.

The two arguments divide vectors into those inside span Q3 and outside it. A bound for vectors in one part cannot separately bound the minimum over the whole dual lattice. The combined minimum later in the proof is the valid inference.

Repair: At these two intermediate casewise lines put ||a||, for the current nonzero dual vector a, on the left. Then take the minimum of the two lower bounds and infimum over all a to bound lambda_1.

Correction status: No correction located; whether the published revision already repairs this is unknown.

### E13 — error; affects a stated result

Locator: arXiv v1, §5.1 p.51, first paragraph; published revision not compared.

Printed fragment: `converges to the singular series`.

For the primitive form f=X0^d with d≥2, sigma(a;p^r)=p^{r−ceil(r/d)}(1−p^{−n}), which tends to infinity. Along W(B) the 2-adic factor alone diverges; for n≥2 the product of the factors (1−p^{−n}) stays bounded away from zero. Thus the claimed convergence is not generally finite on all V_{d,n}.

Repair: Qualify finite convergence by appropriate nondegeneracy hypotheses, or explicitly allow divergence to infinity; no such convergence is needed in the proof.

Correction status: No correction located; published revision unknown.

### Details of three proof repairs

For E1, choose linear coordinates carrying the two independent vectors to e0,e1. Vanishing at both means precisely that the coefficients of X0^d and X1^d vanish. Every remaining degree-d monomial either involves X_i for i≥2, or involves both X0 and X1; it therefore has a degree-two divisor vanishing at both points. This proves I_d=R[X]_(d−2)I_2 and is invariant under undoing the coordinate change. To keep the quantitative norm bound, take the short integral quadratic vectors in the **original** coordinates, multiply them by monomials (an isometry on their coefficient vectors), and select an independent spanning subfamily. Do not transfer the norm bound through an arbitrary real change of coordinates.

For E5, write a nonzero polynomial of degree at most four as a polynomial in the third variable. Fibers for which a nonzero coefficient remains have at most four roots. The fibers on which all coefficients vanish lie in the zero set of one nonzero coefficient polynomial. In a two-dimensional grid with ordered side lengths H1≥H2≥1 that zero set has O(H1) points, by the same one-variable induction. Multiplying by H3≤H2 costs O(H1 H2). This proves the asserted box bound while allowing identically zero fibers. If a side is below 1, count its actual integer-grid cardinality; do not silently substitute H for 1+H. The paper's application still needs the original-source and dyadic checks in G8.

For E10, let x be the available zero with gradient norm at most 2lambda||a||. Taylor's theorem and a uniform Hessian bound show that on a spherical cap of radius c lambda, |f_a|≤C lambda²||a|| and ||grad f_a||≤C lambda||a||. Thus the cap lies in D_a(C'lambda) for fixed enlarged C'. Fubini estimates coefficient fibers at this enlarged scale; their O(lambda^(n+2)) volume divided by the O(lambda^n) cap volume gives O(lambda²). This does not justify claiming x belonged to the smaller D_a(lambda/2).

## Exact finite certificate

The following standard-library Python certificate was run successfully. It checks 3,120 Veronese gcd identities, 585 norm comparisons, 1,918 two-point-ideal monomial divisors, 63 congruence indices, three exact local first moments, three singular prime-power counts, and the determinant-inversion counterexample. The two n=1 moment cases are algebraic regression tests beyond the paper's n≥3 theorem range, not substitutes for its hypotheses.

These finite checks are neither asymptotic proofs nor Lean elaboration. In the determinant test W=12 is an algebraic stand-in to test the exact gcd formula; the proof-level counterexample uses a prime q>w(B) within the growing point-height ball.

```python
from fractions import Fraction
from itertools import product, combinations
from math import gcd, prod, comb


def exponents(m, d):
    if m == 1:
        return [(d,)]
    return [(a,) + rest for a in range(d + 1)
            for rest in exponents(m - 1, d - a)]


def nu(x, d):
    return tuple(prod(t ** a for t, a in zip(x, e))
                 for e in exponents(len(x), d))


def minor_gcd(x, y):
    g = 0
    for i, j in combinations(range(len(x)), 2):
        g = gcd(g, x[i] * y[j] - x[j] * y[i])
    return g


vectors = [x for x in product(range(-1, 2), repeat=3) if gcd(*x) == 1]
gcd_checks = 0
for d in range(1, 6):
    for x in vectors:
        for y in vectors:
            g = minor_gcd(x, y)
            if g:
                assert minor_gcd(nu(x, d), nu(y, d)) == g
                gcd_checks += 1
print('Veronese gcd identities:', gcd_checks)

norm_checks = 0
for m in range(2, 5):
    for d in range(1, 6):
        for x in product(range(-1, 2), repeat=m):
            a = sum(v*v for v in x) ** d
            b = sum(v*v for v in nu(x, d))
            assert b <= a <= m**d * b
            norm_checks += 1
assert sum(v*v for v in nu((1, 1), 2)) == 3 < 4
print('Corrected norm comparisons:', norm_checks)

ideal_checks = 0
for m in range(2, 6):
    for d in range(2, 9):
        quadratics = [q for q in exponents(m, 2)
                      if q[0] != 2 and q[1] != 2]
        for a in exponents(m, d):
            if a[0] == d or a[1] == d:
                continue
            assert any(all(qi <= ai for qi, ai in zip(q, a))
                       for q in quadratics)
            ideal_checks += 1
print('Two-point ideal monomial divisors:', ideal_checks)

kernel_checks = 0
for q in range(2, 9):
    for c, d in [((1, 0, 0), (1, k, 0)) for k in range(1, 10)]:
        kernel = sum(all(sum(a*b for a, b in zip(v, z)) % q == 0
                         for v in (c, d))
                     for z in product(range(q), repeat=3))
        assert Fraction(q**3, kernel) == Fraction(q*q, gcd(minor_gcd(c, d), q))
        kernel_checks += 1
print('Congruence-kernel indices:', kernel_checks)

moment_checks = 0
for p, r, n, d in [(2, 1, 3, 2), (2, 2, 1, 2), (3, 1, 1, 2)]:
    q = p**r
    N = comb(n+d, d)
    points = [x for x in product(range(q), repeat=n+1)
              if any(t % p for t in x)]
    values = [nu(x, d) for x in points]
    densities = []
    for a in product(range(q), repeat=N):
        if not any(t % p for t in a):
            continue
        count = sum(sum(ai*xi for ai, xi in zip(a, x)) % q == 0
                    for x in values)
        densities.append(Fraction(count, q**n))
    average = sum(densities, Fraction()) / len(densities)
    expected = ((1-Fraction(1,p**(n+1))) * (1-Fraction(1,p**(N-1)))
                / (1-Fraction(1,p**N)))
    assert average == expected
    moment_checks += 1
    print('Exact local first moment:', (p, r, n, d), average)

for r in range(1, 4):
    p, d, n = 2, 2, 3
    q = p**r
    count = sum(x[0]**d % q == 0 and any(t % p for t in x)
                for x in product(range(q), repeat=n+1))
    expected = p**(r - (r+d-1)//d) * (1-Fraction(1,p**n))
    assert Fraction(count, q**n) == expected
print('Singular prime-power density formula: 3 cases')

for q in (7, 11, 101):
    W = 12
    exact = Fraction(W, gcd(q, W))
    printed_main = Fraction(W, q)
    assert exact / printed_main == q
    reciprocal_relative = (1/exact) / (1/printed_main)
    assert 0 < reciprocal_relative <= 1
print('Determinant inversion counterexample ratios: 7, 11, 101')
print('All exact finite checks passed; no Lean compilation or asymptotic proof claimed.')
```

Expected output:

```text
Veronese gcd identities: 3120
Corrected norm comparisons: 585
Two-point ideal monomial divisors: 1918
Congruence-kernel indices: 63
Exact local first moment: (2, 1, 3, 2) 2555/2728
Exact local first moment: (2, 2, 1, 2) 9/14
Exact local first moment: (3, 1, 1, 2) 32/39
Singular prime-power density formula: 3 cases
Determinant inversion counterexample ratios: 7, 11, 101
All exact finite checks passed; no Lean compilation or asymptotic proof claimed.
```

## Remaining gates

- **G1:** Acquire the 89-page published/revised text and compare all statements, proofs, numbering and thirteen preprint source findings. Bibliographic/abstract agreement does not close this.
- **G2:** Prove Poonen–Voloch's box-to-Euclidean-ball, primitive/sign-quotient local-density transfer, keeping the real local measure shape-dependent. Norm equivalence alone proves positivity bounds, not the same limiting constant.
- **G3:** Acquire and read original Banaszczyk Thm.2.1, Schmidt Lemmas 1,2,6, Davenport Lemma 5, Broberg–Salberger Thm.1 and Browning–Matthiesen Lemma 3.3. Their uses are identified, but original theorem/proof closure is not claimed.
- **G4:** Check Lemma 3.4's O_R claim uniformly in ambient N and number I of bands. Barroero–Widmer gives a constant depending on the definable family. This checkpoint supports fixed N,I, not the stronger uniformity without a separate proof.
- **G5:** Finish Le Boudec's primitive-count proof and the original proofs behind least-height and Poonen–Voloch; acquire Serre's plane-conic result and Bhargava's positive-proportion plane cubics for Cor.1.2, including Euclidean family transfer.
- **G6:** Finish source-qualified construction of the nonzero discriminant/nullity or incidence-nullity argument used to repair the real dyadic cover; verify all measurability and singular-family conventions.
- **G7:** Expand unnamed proof quantities (mu, Q2/Q3 bilinear sigma and coordinate maps, quartic lattice subfamilies, coefficient-gradient fibers, dyadic error pieces) and split remaining composite constructions into separate API-bearing items. The primary numbered inventory is not complete definition closure.
- **G8:** Check the quartic-threefold reducible-form O(M^40) bound and coefficient-uniform threefold estimate in original sources, together with ordered-box grid-zero repair; audit every dyadic endpoint and implicit constant.
- **G9:** Audit the partial-summation diagonal estimate (4.71): Lemma 4.7 is restricted to coefficient cutoff ≥B^(4/5), so the lower cutoff portion needs an explicit independent bound. This is an unresolved proof check, not a certified source error.
- **G10:** Complete item-by-item dependency DAG, consumers/API laws, regression suites and independent review. No Lean file was generated or compiled in this paper-only scope.

The handoff prioritizes these tasks. The schema checker cannot certify mathematical completeness, source-version equivalence, source-findings validity or library absence. Keep `status: partial` until the gates are actually closed.

## Validation performed

On 22 September 2026: `scripts/check_paper.py` passed; `research/blueprint/intake.py check-files` reported three files and zero problems. Additional structural checks confirmed 122 unique item ids, all 113 missing items routed exactly once, API/test fields on all 57 definition/construction items, and no unknown references or cycles in the selected 26-item dependency graph. The embedded arithmetic certificate passed. These checks do not close G1–G10. Lean was not compiled.
