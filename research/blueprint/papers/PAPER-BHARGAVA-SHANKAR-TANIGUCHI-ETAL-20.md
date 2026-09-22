# BSTTTZ: torsion feedback, determinant methods and finite-field sections

> **Fourth-checkpoint notice — 22 September 2026.** ChatGPT Pro, session
> `cgp-0922-6e8b41`, adds the final section “Fourth checkpoint: primitive bases
> and quadratic towers”. It supplies direct replacement arguments for G1 and
> the main-theorem use of G2, together with nine proposed extraction entries.
> **Status remains partial.** The 110-item result JSON is deliberately unchanged;
> synchronization of these new entries, routes and gap descriptions remains in
> the handoff. The third-checkpoint report below is preserved as historical
> work, including its source-reading and validation claims, which belong to
> that earlier worker. No fresh byte hashes, full rereading of all its sources,
> repository-checker success, Lean elaboration or independent review are claimed
> by the fourth checkpoint. Its new proofs require independent checking.

## Third-checkpoint report (preserved)

**Partial third checkpoint; not ready for acceptance.** Issue #1420. Codex,
session `codex-c83e7a`, 21 September 2026. Continues Codex's PR #1636 and
GPT-6 Astra Pro's PR #1641. All **35 inherited item IDs remain**. The expanded
inventory contains **110 items: 22 library, 7 planned and 81 missing**.
Five proposed routes cover **73 missing items and one planned item**; eight
unresolved claims have explicit gaps instead of executable routes. All 31
definitions/constructions have an API outline and at least three discriminating
acceptance tests. No Lean implementation or independent review is claimed.

This continuation adds the selected original Bombieri–Pila proof chain, cubic
feedback and elliptic consequences, quartic resolvents and counting targets,
and the finite-field section-count proof. It replaces several previously
unexamined prerequisites with actual pinned library imports. Original source
closure and the final published-version comparison remain incomplete.

## Source identity and reading boundary

The target is Bhargava–Shankar–Taniguchi–Thorne–Tsimerman–Zhao,
*Bounds on 2-torsion in class groups of number fields and integral points on
elliptic curves*, JAMS 33 (2020), 1087–1099,
[DOI 10.1090/jams/945](https://doi.org/10.1090/jams/945).
The mathematical source used here is Taniguchi's author copy dated
18 February 2017. Every page, including references, was read afresh; its
pages 5, 6, 8, 11 and 12 were visually inspected after local rendering.
Locators below are **author-copy page numbers**.

Freshly measured bytes, all acquired on 21 September 2026:

| Source | PDF pages | SHA-256 |
| --- | ---: | --- |
| [taniguchi](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf) | 13 | `bba54fd02aadec75b51f2cdbb312c702c06f44384e45a7ec57832704e4e106ec` |
| [arxiv](https://arxiv.org/pdf/1701.02458) | 12 | `99ee35275ecb42c52cd8bbc615538dbe6094326fb72894e88ef82c0b89286871` |
| [bombieri-pila](https://people.maths.ox.ac.uk/pila/Ovals.pdf) | 22 | `a46f75e55ddc055050f7924dbea2e5c5655aee32e5c5655aee32e5c5655aee32e5c5655` |
| [helfgott-venkatesh](https://arxiv.org/pdf/math/0405180) | 23 | `bfb29584474ac4a580da9a1fa1b0279faa283f301c0481f43a0919cbaa102255` |
| [tsimerman](https://arxiv.org/pdf/1103.5619v3) | 32 | `4cd8527c28b94f98df53738c9805a8ff5c84a94d3754c873b804d33dbdea7aed` |
| [sedunova](https://arxiv.org/pdf/1506.08757v1) | 8 | `7b7117e414c126f41cb3b5fe22044034652e0b97d2e12660b0afdc7b5228b3f0` |

The arXiv v1 hash was remeasured, but its full reading is inherited from #1636.
The February copy includes §5.4, absent from arXiv v1. The earlier MPG
preprint hash `04e4e52e2e7d2902cfe6ef7c37793650b5a7c3128554cdc3a7a577fb176deb9d`
is retained as an inherited measurement, not a newly downloaded version.
Fresh [MPG item metadata](https://pure.mpg.de/rest/items/item_3277755)
identifies file_3277756 as a public preprint and file_3277757 as the restricted
publisher version. Thus the public deposit's 2020 recompilation date does not
make it the final article. Public AMS and author-page retrieval still did not
produce the revised publisher text. Bibliographic identity is not a
mathematical version comparison; **G0 remains**.

Additional reading was bounded and is not represented as a complete reading
of every prerequisite paper:

- Bombieri–Pila: §2 pp.1–6, giving determinant/interpolation foundations, and
  the complete §3 pp.10–17 leading to Theorem 5. Later analytic-curve material
  of §2 and smooth-curve §4 are not claimed fully read.
- Helfgott–Venkatesh: Theorem 3.8 and proof, Definition 1, Corollaries 3.9 and
  3.11, Proposition 3.10 and adjacent remarks. Earlier repulsion, sphere-packing
  and positive-height proof interiors remain to audit.
- Tsimerman v3: the negligible-factor definition and Theorem 4.7; §5 Theorem
  5.1 through Corollary 5.7 with their proofs; §6's quartic/cubic module argument.
  The preceding analytic/class-formation closure remains open.
- Sedunova v1: the entire eight-page source, especially Theorem 1 and its
  determinant proof. The arXiv stamp is June 2015, while the downloaded body
  says August 2018. This is recorded rather than silently treated as a later
  arXiv revision.

## Baseline and ownership corrections

Pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. This continuation reread the
actual statements for all ten inherited Mathlib library items: class groups,
class number, infinite places, discriminant, mixed embedding, covolumes,
both Minkowski forms and the small-norm ideal-class representative.
The covolume formula takes an invertible fractional ideal; the compact
Minkowski theorem needs a discrete lattice and a nontrivial real vector space.
Complex places use ordinary modulus with multiplicity two in the norm product.

New exact imports, with their source files at the pins:

| Imported interface | Actual declaration and scope |
| --- | --- |
| Norm tower | `Algebra.norm_norm`, `Algebra.norm_eq_norm_adjoin`, Mathlib `RingTheory/Norm/Transitivity.lean`; finite/free scalar-tower machinery, not a newly defined norm |
| Projective cardinality | `Projectivization.card_of_finrank`, `Projectivization.card''`, Mathlib `LinearAlgebra/Projectivization/Cardinality.lean`; quotient by every nonzero scalar |
| Explicit 2-descent | `WeierstrassCurve.Affine.selmerGroup₂`, `mem_selmerGroup₂_iff`, `range_μ_le_selmerGroup₂`, Tau Ceti `AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean` |
| Rank inequality | `WeierstrassCurve.Affine.pow_rank_le_card_of_range_μ_le`, same file; requires a finite subgroup containing the descent image |
| Mordell–Weil | `WeierstrassCurve.Affine.fg_point_of_numberField`, `MordellWeil/FinitelyGenerated.lean` |
| Canonical height | `WeierstrassCurve.Affine.Point.canonicalHeight`, its convergence and bounded-difference theorem, `AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean` |
| Function-field divisors | `TauCeti.Divisor`, `TauCeti.Divisor.degree`, `TauCeti.Divisor.principal`, under `FieldTheory/FunctionField/Divisor/` |
| Degree-zero classes | `TauCeti.Divisor.degreeClass`, `degreeClass_divisorClass`, `divisorClass_eq_zero_iff`; use the existing quotient and degree kernel |
| Finite class group | `TauCeti.Divisor.finite_ker_degreeClass`, `RiemannRoch/ClassNumber.lean`; no exact-constants hypothesis for this finiteness theorem |
| Sections and effective representatives | `TauCeti.riemannRochSpace`, `TauCeti.Divisor.dim`, `degree_add_one_sub_genus_le_dim`, `exists_isEffective_linearlyEquivalent_add_nsmul` |
| High-degree RR | `TauCeti.Divisor.dim_eq_degree_add_one_sub_genus_of_two_mul_genus_sub_one_le_degree`, `Consequences/HighDegree.lean`; exact constants, integer inequality `deg D≥2g−1` |

Reviewed audit entries read: AUDIT-01 (AlgebraicCurves Layers 3–5 and
JacobianChallenge E), AUDIT-02 (GN), AUDIT-03 (completed EffectiveBounds),
AUDIT-11 (EllipticCurves Layers 6–7), AUDIT-20 (FA.1). They distinguish
implemented divisor RR from the missing scheme Picard comparison, and the
built explicit Selmer carrier from still-missing general cohomological Selmer
machinery. The rank-cardinality lemma does **not** establish finiteness of
the Selmer subgroup by itself.

Full owner documents read: GN, completed EffectiveBounds, ED, RP, ST, FA
and JacobianChallenge. Complete relevant sections read: upstream
AlgebraicCurves Layer 5 and EllipticCurves Layers 6–7. The 211 atlas records,
new-roadmap catalogue, reserved IDs and available packet were screened.
The earlier full LD reading is retained from #1641; LD.6 excludes the algebraic
part and does not supply this Bombieri–Pila theorem. Remaining proof-interior
supplier checks for HV and arithmetic tori are explicitly G3/G4.

The [Couveignes result](PAPER-COUVEIGNES-20.result.json) already proposes
`EffectiveBoundsCompactModels`, with the same completed parent. Its route was
read in full: it concerns short multi-equation field models and degree-sensitive
field counts. Share measure/reduction imports and any compatible short-integer
lemma; do not treat an unreviewed proposal as an installed supplier. Its target
is different from the present torsion power saving. Neither candidate may own
a duplicate general reduced-basis theory.

## Lattice boundary retained from the previous checkpoint

For the §2 weighted body, each complex disc contributes `pi R_v²`; hence
the volume is `2^r pi^s sqrt(D_K)/N(I)`. It is at least
`2^n covol(I^(-1))`. Equality in the all-real case requires the compact,
non-strict Minkowski theorem. The proof uses only `c^m=1`, so it includes
the identity class and every class whose order divides m.

The literal reduced-basis item remains **unrouted G1**: the source compares
through index n−2 and uses the last index n−1 in its proof. Original Siegel
verification must include extending primitive 1, the metric and product
constants, and n=2. The general reduction supplier stays GN.1/GN.3.
Likewise, the printed relative-genus bound with only one base factor h₂(F)
remains **unrouted G2**, requiring capitulation, ambiguous-class and unit
terms. The restricted proof below consumes these recorded lattice inputs;
it does not settle either gap.

## Preserved no-index-two proof: no subfield of index two

Here `K` has degree `n ≥ 3`, `D=|Disc(K)| ≥ 1`, and `R=D^(1/n)`. Define

```text
B_K(T) = {β ∈ O_K : |β|_v ≤ T at every infinite place v}.
```

All implicit constants depend only on the displayed degree, scale or epsilon,
not on the field. The following preserves the detailed proof expansion from PR #1641. Statements described as repairs or expansions are not attributed to
the source as verbatim named lemmas.

### 3.1 All 2-torsion classes, including the identity

The proof of Theorem 2.1 uses only that the chosen class is killed by `m`:
it starts with `I^m=(α)` and then takes `J=κI`, `β=ακ^m`. It therefore gives
the same balanced generator when the exact order divides `m`. In particular
for every `c ∈ Cl(K)[2]`, choose `J_c` and a nonzero `β_c ∈ B_K(R)` with
`J_c²=(β_c)`.

If `β_c=β_d`, then `J_c²=J_d²`. Unique factorization of nonzero integral
ideals gives `J_c=J_d`, hence `c=d`. Thus this choice is an injection into
the nonzero balanced elements of **absolute square norm**. Indeed,
`|N(β_c)|=N(J_c)²`; there is no reason for the signed field norm itself to
be nonnegative. Both signs must be retained in the curve count below.

### 3.2 Variable-radius counts and exceptional subfields

The lattice argument also gives a useful form with a varying radius. For a
degree-`d` field `F` and `T ≥ D_F^(1/d)`,

```text
#B_F(T) ≪_d T^d / sqrt(D_F).
```

The controlled-basis lemma and largest-minimum estimate put a fundamental
parallelepiped in `B_F(C_d T)`. Its translates by the points of `B_F(T)`
are disjoint up to boundaries and lie in `B_F((C_d+1)T)`. Divide the latter
volume by `2^(-s_F)sqrt(D_F)`. For `F=Q`, count the integers directly.
This argument is uniform in `T/D_F^(1/d)`; it is not a fixed-field
asymptotic with an uncontrolled error term.

Suppose now that `K` has no `F` with `[K:F]=2`, and consider `β` for which
`e=[K:Q(β)]` is even. Then `e≥4`. Put `F=Q(β)` and `d=n/e`. The
relative-discriminant identity gives `D_F^e ≤ D`, so
`D_F^(1/d) ≤ D^(1/n)=R`. An embedding of `F` extends to one of `K`, so
a balanced `β` is in `B_F(R)`. The displayed estimate gives

```text
#B_F(R) ≪_n D^(1/e) / sqrt(D_F) ≤ C_n D^(1/4).
```

There are only a degree-bounded number of subfields: the normal closure has
Galois group of order at most `n!`, and its subgroups are at most `2^(n!)`.
Summing therefore gives `O_n(D^(1/4))` for the entire even-index locus.
In odd degree it is empty. Neither the discriminant tower nor the subfield
count is proposed as a new foundational owner; import the genuine supplier
when completing the library audit.

### 3.3 Keep the unreduced norm curve

For each `β ∈ O_K`, use the **monic** convention

```text
P_β(X) = N_K/Q(X−β) = q_β(X)^e,
q_β = minpoly_Q(β),             e=[K:Q(β)].
```

The characteristic polynomial of multiplication on `O_K` defines the
integral polynomial. Restriction of scalars from `Q(β)`, or the norm tower,
gives the power identity. Since `q_β` is separable, each root has multiplicity
`e`. Consequently `P_β` is a square over `C[X]` precisely when `e` is even;
in that case its monic square root is in `Z[X]`.

If `e` is odd, then `P_β` is not a square in `C(X)`. For either sign `s`,
the monic quadratic `Y²−sP_β(X)` is irreducible over `C(X)`. Gauss's lemma
then makes it irreducible in `C[X,Y]`. Its total plane degree is **n**, even
when it is singular because `e>1`.

This resolves the squarefree-degree problem without changing the cited
input. The squarefree part has degree `[Q(β):Q]`, which can be smaller than
`n`; it cannot be assigned degree `n` in Bombieri–Pila. Instead apply the
original theorem to the **unreduced norm curve**, which really has degree
`n` and is absolutely irreducible. The theorem permits singularities. For
example, for rational `β=a` and odd `n≥3`, `Y²=(X−a)^n` is a singular
irreducible degree-`n` curve, while its squarefree part is linear. The two
models must not be confused for a coefficient-uniform plane-degree bound.

### 3.4 Count translation classes without assuming long boundary fibers

A direct division of `#B_K(R)` by `R` is unjustified: some fibers of the
original box can be very short. Instead choose one `β_L ∈ B_K(R)` for
each coset `L ∈ O_K/Z` that meets it. The map

```text
(L,m) ↦ β_L+m,                  |m| ≤ floor(R),
```

is injective and lands in `B_K(2R)`. Distinct cosets are disjoint, and within
one coset distinct integers give distinct elements. The inherited coarse
box estimate, applied at scale two, yields

```text
# {L : L meets B_K(R)}
 ≤ #B_K(2R)/(2 floor(R)+1)
 ≪_n D^(1/2)/R
 = D^(1/2−1/n).
```

All these sets are finite by the lattice discreteness and boundedness
already used in the box count. This proof deals with boundary fibers without
requiring a new projection-lattice estimate.

### 3.5 The rectangle, both signs, and the final exponent

Fix a representative `β_0 ∈ B_K(R)` in a coset of odd generated-field
index. That index is constant on the coset because
`Q(β_0+m)=Q(β_0)`. Write a counted element as `α=β_0−m`, with
`α ∈ B_K(R)`, `α≠0`. Any embedding gives `|m|≤2R`. Set
`y=sqrt(|N(α)|)`, a positive integer. The product formula with the correct
complex multiplicities gives `y≤sqrt(D)`.

Since `P_β0(m)=(-1)^nN(α)`, one of the two equations

```text
y² = P_β0(m),       y² = −P_β0(m)
```

holds. This maps the counted elements injectively into the disjoint union
of the two signed curves in the rectangle `|m|≤2R`, `0<y≤sqrt(D)`.
For `n≥3` and `D≥1`, the rectangle lies in an integer-translated square
of side `O_n(sqrt(D))`. Both curves are absolutely irreducible of total
degree `n`. The original Bombieri–Pila epsilon bound therefore yields
`O_(n,ε)(D^(1/(2n)+ε))` points in this coset (rescale epsilon if necessary).

Multiply by the translation-class bound and add the even-index exception:

```text
# {0 ≠ β ∈ B_K(R) : |N(β)| is a square}
 ≪_(n,ε) D^(1/2−1/n) D^(1/(2n)+ε) + D^(1/4)
 ≪_(n,ε) D^(1/2−1/(2n)+ε).
```

The last inequality uses `n≥3`. Combining with the injection of §3.1 gives

```text
|Cl(K)[2]| ≪_(n,ε) D_K^(1/2−1/(2n)+ε)
```

**when K has no subfield of index two**. This includes all odd degrees.
It is not a proof of the omitted index-two reduction, nor of the sharper
cubic/quartic exponent. The full extraction must still read the original
relative-genus estimate with its dependence on base class groups, units
and ramified primes. A quadratic-over-Q API is not that relative theorem.


## Original determinant-method proof now extracted

The selected chain is evaluation rank deficiency → nonzero integer minor →
Vandermonde/derivative bound → separation of successive blocks → auxiliary
curves → proper Bézout intersections. Restrict monomials to avoid the leading
degree-d term of the original polynomial. For integer δ≥2d, their number is
`D=d(δ−d+1)` and degree sum is
`p=d(δ(δ+1)−d(d−1))/2`. The exponent `2p/(D(D−1))` approaches 1/d.
Derivative level-set bounds partition the graph; intervals with a large
derivative are short. Iterating the resulting recurrence gives Theorem 4;
decomposition into bounded-slope graph pieces gives Theorem 5, including
singular curves.

Two literal proof typos are now visible. In Lemma 7 the dimensionless length
must be `|I| A^(1/k)/N`, not `|I| A^(-1/k)/N`. In the final estimate the
monomial sums satisfy **q≤p**, whereas the preprint prints the reverse.
The final choice of δ must also be an integer. These are **G7**: the exact
constants 11 and 12 require a checked rounding argument; the theorem is a
source target, not a completed formal proof. The selected API and test cases
now give the next worker concrete proof obligations.

## Cubic feedback and elliptic consequences

For cubic K, the translation count gives O(D_K^(1/6)) signed norm curves.
Their integral coefficients satisfy `|A|≪D^(1/3)`, `|B|≪D^(2/3)`,
`|C|≪D`, and their model discriminants are O(D²). A nonrational element
of a cubic field is primitive, so its cubic norm polynomial is separable.
The rational-generator case is singular and must be removed: if J²=(a),
a is rational and |N(a)| is square, then |a|=m² and J=(m), so this contributes
only the identity class. For the negative sign, X=−x turns the equation
into a monic cubic with the signs of A and C changed.

With natural logarithms, the constants are

```
u = sqrt(3)/2
b = ((1+u)/(2u)) log((1+u)/(2u))
  - ((1-u)/(2u)) log((1-u)/(2u))
a = 1 / (6(1-b/log 2))
c = a*b/log 2
```

Numerical checks give b≈0.2782386677, a≈0.2784337427 and
c≈0.1117670760. In particular b/log 2<1 and a=1/6+c.
The inequality
`H≤C_eta D^(1/6+eta) exp((b+eta)log₂ H)` therefore yields
`H≪epsilon D^(a+epsilon)` by choosing eta small enough and dividing
by `1−(b+eta)/log 2`. Rounded decimals are not theorem constants.

HV Theorem 3.8 includes both height and rank, with S containing every
infinite place and every prime dividing the chosen integral-model
discriminant. At t=0 it gives the packing endpoint. Corollary 3.11 plus
prime-support absorption gives the all-integral-point theorem quoted as
BSTTTZ Theorem 5.1. `A^omega(m)≪epsilon m^epsilon` follows by splitting
small and large primes, and absorbs the prefactors only **after** choosing S.
The explicit b-dependent feedback then uses Brumer–Kramer. Its original
Proposition 7.1 and following remark are still **G3**; the quotation in
BSTTTZ is not a claimed original-source reading.

Tau Ceti's implemented height is `lim h_x(2^nP)/(2·4^n)`, matching HV.
The upstream roadmap prose requests twice this normalization. Moreover,
the existing bounded-difference theorem has a constant depending on the
curve. It does not supply the uniform leading coefficient for a varying
family needed by §5.4. Thus the del Pezzo exponent remains **G6**, alongside
singular fibers and primitive weighted representatives.

The main elliptic conclusions are now separate items: Selmer cardinality
exponent a, rank at most `C_epsilon+(a+epsilon)log₂|Delta|`, and integral-point
exponent c. All use the chosen integral-model discriminant. Hyperelliptic
Theorem 1.3(a) and (b) are separate but **unrouted G5**: the printed bound
uses the étale algebra discriminant while model bad primes can also come
from the polynomial-order index and twists. A split cubic algebra can stay
fixed while the curve model's bad primes change. This observation identifies
an omitted dependency, not a claimed counterexample to the final article.

## Quartic transfer and field counts

Tsimerman's selected argument compares the F₂ permutation modules on four
embeddings and three pair partitions. Quotienting the four-dimensional
module by its sum line and then taking its even-weight image gives a
two-dimensional module, isomorphic to the three-partition module modulo
its sum line. Other factors are trivial. The isomorphism was checked on all
24 permutations and all eight representatives of the latter quotient.
Restricting this construction to a transitive subgroup of S₄ explains why
reducible cubic resolvents require étale product algebras, not an assumption
that the resolvent is a field.

This finite check does not prove the arithmetic transfer. Tsimerman's class
quantity is only defined up to discriminant-negligible factors, relative to
the splitting field. Its torus exact-sequence theorem, Brauer–Siegel inputs,
conversion to D_K and discriminant-preserving resolvent order still need
full closure and owner screening (**G4**). A composite acquisition node is
left unrouted and explicitly awaits splitting; it is not presented as a
completed atomic extraction.

The counting targets are routed to existing ST.0/ST.1/ST.3. Baily's weighted
quartic sum uses `h₂(K)(log D_K)²(X/D_K)^(1/2)`. A cubic family count
O_F(T^(1/2)), together with the pointwise cubic torsion bound, gives
O_(F,epsilon)(X^(1/2+a+epsilon)) by dyadic summation. Cohn supplies the cyclic
cubic input for A₄ quartics; the fixed-quadratic-resolvent cubic asymptotic
supplies the S₄ variant. The latter constant depends on the quadratic field
F. A favorable leading constant does not make convergence uniform in F.
Baily, Cohn and the two fixed-resolvent originals remain to acquire (**G8**).

## Finite-field proof and the gonality boundary

Let C/k be smooth, projective and geometrically integral, k finite of order
q, with genus g. Use the planned degree-one-divisor theorem to obtain a
divisor E of degree g; this does not assume C(k) nonempty. The divisor-class
interpretation of Pic⁰(C)(k) additionally uses the existing Picard comparison
target and Br(k)=0. These planned inputs are not falsely marked implemented.

For V=L(2E), take the subset of nonzero f whose principal divisor has every
coefficient even. It is stable under **all** k×, not only square constants.
It need not be a vector subspace and does not mean that f is a square in k(C).
The projective class of f maps to the class of half its principal divisor.
This has degree zero and is killed by two.

For c=[D] in 2-torsion, Riemann's inequality produces an effective divisor
D₊ linearly equivalent to E−D. Since 2D is principal, choose f with
`div(f)=2D₊−2E`. Then f lies in the chosen subset and its half-divisor class
is −c=c. This proves **surjectivity**. Uniqueness up to scalars holds for a
fixed principal divisor, not for all choices of D₊ in one class; no unjustified
canonical injection is used.

Implemented high-degree RR gives `dim L(2E)=g+1`, including g=0. The
implemented projective-space formula then proves the target
`#Pic⁰(C)(k)[2]≤(q^(g+1)−1)/(q−1)`. This argument has no characteristic
restriction. In characteristic two the geometric 2-torsion point group has
size 2^f for p-rank f≤g, not invariably 2^g; the group-scheme rank is 2^(2g).
Those general abelian-variety results belong to the existing Jacobian Layer E.

The stronger gonality assertion remains **unrouted G9**. Sedunova's theorem
has an epsilon loss absent from the displayed claim in BSTTTZ. Its literal
q-independent constant also fails a simple test: with I the polynomials of
degree at most two, |I|=q³, and the absolutely irreducible smooth parabola
Y²=X, every linear Y gives a pair in I². There are exactly q² such pairs,
whereas `|I|^(1/2+epsilon)=q^(3/2+3epsilon)`. For epsilon<1/6 a constant
independent of q cannot hold as q varies. This does not exclude an estimate
for fixed q or with additional q factors/thresholds. Resolve the correct
uniformity, epsilon handling, degree convention, bad-reduction exclusions
and coordinate-change cost; then separately treat inseparable maps and
characteristic two. The one-line analogy in the main paper is not a proof.

## Proposed ownership and acyclic dependencies

1. **EffectiveBoundsClassGroupTorsion**, Part II of the completed EffectiveBounds
   roadmap: balanced representatives, the norm-curve bound, cubic feedback,
   quartic transfer and the resulting elliptic discriminant applications.
2. **IntegralPointDeterminantMethods**, new direction: original coefficient-uniform
   plane-curve bound, importing generic polynomial, analysis and SF.5 intersection
   theory. Pila–Wilkie and pointwise finiteness do not supply it.
3. **EllipticCurvesPartIIIntegralPointBounds**, Part II of upstream EllipticCurves:
   HV and Brumer–Kramer tools. It does not depend on the improved torsion theorem;
   those final applications live in the consuming EffectiveBounds extension.
4. **ArithmeticStatistics**, source for ST.0/ST.1/ST.3: resolvent-weighted counts
   and the A₄/fixed-resolvent S₄ consequences, importing pointwise torsion.
5. **FunctionFieldArithmeticPartIITorsionBounds**, Part II of FA: quantitative
   Picard 2-torsion by projective sections, importing its already-built RR
   foundation and the existing degree-one/Picard suppliers.

These are proposals, not accepted designs. The result's briefs specify
endpoints, suppliers, tests and suggested Lean homes. They exclude G1/G2/G4's
unresolved acquisition nodes and G5/G6/G9's unverified claims. The complete
G0–G10 register and the handoff are part of the checkpoint, not optional caveats.

## Validation

The unmodified paper checker and intake file checks are run against the full
available atlas catalogue before submission. Custom structural checks preserve
all 35 old IDs, verify unique routing, ensure every unrouted missing item is
listed in a gap, and require an API plus three tests for all 31 definitions.
Meaningful finite checks cover the S₄ quotient-module map, projective scalar
orbits over F₂/F₃/F₅ in dimensions zero through four, the Sedunova parabola
example over F₂/F₃/F₅/F₇, and restricted-monomial counts/exponents for degrees
two through eight. Floating-point calculations check the displayed constants
and feedback identities; they are not certified real inequalities in Lean.
No Lean artifact was requested, produced or compiled.

---

## Fourth checkpoint: primitive bases and quadratic towers

**Author:** ChatGPT Pro, `cgp-0922-6e8b41`, 22 September 2026.
**Status:** proof/extraction supplement; machine synchronization pending.
The following replaces two missing steps in the proposed main-theorem route.
It is not a claim that every proof input of the paper has now been extracted,
that the published revision has been checked, or that anything is formalized.

### A. Source and baseline boundary for this supplement

The main source passages are §§3–4, printed pp.5–6 of the February 2017
[Taniguchi author copy](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf).
The basis paragraph on p.5 was visually checked. The direct argument in B
below is our replacement proof, not a transcription or verification of
Siegel, *Lectures on the Geometry of Numbers*, Lecture X §6.

The new arithmetic source is Jürgen Klüners and Jiuya Wang,
*ℓ-torsion bounds for the class group of number fields with an ℓ-group as
Galois group*, [arXiv:2003.12161v2](https://arxiv.org/abs/2003.12161v2),
13 October 2020, Theorem 2.1 and proof, PDF pp.3–4. Those pages were read
and visually checked. It is a **later auxiliary source**, not a source
silently attributed to the original 2017 proof. No fresh PDF byte hash was
measured in this session. The article's eventual publication is
Proc. Amer. Math. Soc. 150 (2022), 2793–2805, DOI 10.1090/proc/15882.

The actual pinned statement `NumberField.mixedEmbedding.covolume_integerLattice`
was read in Mathlib `NumberTheory/NumberField/Discriminant/Basic.lean`,
lines 124–132 at `082e2d37e8b0463410cdb532e111cd43d5a66174`. It says
`covol(O_K)=2^(-s) sqrt(D_K)` for the ordinary mixed-space measure. The
adjacent ideal-covolume statement was also read. Other library imports in
this report retain their earlier workers' provenance, rather than a new
claim that this session reread all of them.

Reviewed AUDIT-02 distinguishes the existing covolume/first-Minkowski API
from the **missing** successive-minimum/second-Minkowski and higher-rank
reduced-basis theory. The GN atlas extract was read. For generic primitive
basis reduction use GN.5, importing GN.0/GN.1; do not force this elementary
argument through GN.3's mass formulas or higher-rank adelic reduction.

The complete completed-EffectiveBounds document and the relevant upstream
ClassFieldTheory purpose, ownership, Layers 12–13 and regression-test
passages were read. Hilbert class fields, their ordinary-class-group
quotients, maximal-unramified properties and conjugation/uniqueness remain
**planned imports** from
`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.
The accepted REV-AUDIT-03 confirms that Hilbert/ray/ring class fields are
not implemented at the pins. The large combined library-coverage file could
not be read through the browser; the split reviewed audit records were used.
This is not a new class-field-theory roadmap.

### B. G1: a direct primitive-prefix basis proof

#### B1. Fix the metric before declaring that 1 is shortest

For signature `(r,s)`, put `n=r+2s` and define on the existing mixed space

```text
||x||_tr² = Σ_real |x_v|² + 2 Σ_complex |x_v|².
```

This is the ordinary Euclidean norm after multiplying both real coordinates
of every complex factor by `sqrt(2)`. If `||·||_0` is the unweighted mixed
Euclidean norm, then

```text
||x||_0 ≤ ||x||_tr ≤ sqrt(2) ||x||_0.
```

The linear change of coordinates has determinant `2^s`. Consequently the
covolume of the integer lattice for the **metric-induced Euclidean volume**
is `sqrt(D_K)`. For the unchanged ordinary product measure it is still
`2^(-s)sqrt(D_K)`; these are different normalizations, not conflicting formulas.

For `0 ≠ α ∈ O_K`, its nonzero integral norm has absolute value at least
one. AM–GM applied to the squared absolute values at all `n` embeddings,
with each complex pair counted twice, gives

```text
||α||_tr² / n ≥ |N_K/Q(α)|^(2/n) ≥ 1.
```

Thus `||1||_tr=sqrt(n)` is a shortest nonzero lattice length. Also 1 is
primitive: an algebraic integer lying in Q is an integer, so
`O_K ∩ Q·1 = Z·1`. Neither of these assertions should be justified by
silently using the product sup norm or omitting the complex multiplicity.

#### B2. Primitive-prefix extension in a general lattice

Let Λ be a full lattice in a positive-dimensional Euclidean space of
real dimension n. Let u be a primitive lattice vector and suppose
`||u|| ≤ A λ_1`, with `A≥1`. There is a Z-basis `b_0,...,b_(n−1)` with
`b_0=u` and, for every `i` and every lattice vector w outside the preceding
rational span,

```text
||b_i|| ≤ c_i ||w||,
c_0=A,
c_i=1+(1/2)Σ_(j<i)c_j   (i≥1).
```

For `i≥1`, `c_i=((A+2)/2)(3/2)^(i−1)`. In particular when u is shortest,
`c_i=(3/2)^i` at **every** index, including `i=n−1`.

Here is the construction and proof. Maintain a saturated prefix
`L_i=Z b_0+...+Z b_(i−1)` of Λ. The quotient Λ/L_i is free. Choose b_i
of minimal Euclidean length among the vectors whose nonzero image in that
quotient is primitive. Candidates exist by choosing a quotient basis and
lifting one vector. A minimum exists because a bounded ball has only
finitely many lattice points: first fix any candidate and minimize in the
finite set of candidates no longer than it. The enlarged prefix remains
saturated. At rank n the quotient is both finite and torsion-free, hence
zero; the resulting vectors form a basis.

Given w outside the preceding span, write its nonzero image in the free
quotient as `d u_bar`, where `d≥1` and `u_bar` is primitive. Lift `u_bar`
and adjust the lift by integer multiples of the prefix vectors. Rounding
the resulting rational coefficients to nearest integers gives a candidate
of the form

```text
u' = w/d + Σ_(j<i) t_j b_j,       |t_j|≤1/2.
```

Minimality and the triangle inequality give

```text
||b_i|| ≤ ||w||/d + (1/2)Σ_(j<i)||b_j||
        ≤ (1+(1/2)Σ_(j<i)c_j)||w||.
```

The inductive comparisons apply to the same w because it is outside each
earlier span. The initial comparison follows from `λ_1≤||w||`. This proves
the recurrence without needing the independent short vectors to generate
a saturated subgroup themselves.

Every later basis vector is a valid primitive-extension candidate at every
earlier stage. Therefore the selected lengths from `b_1` onwards are
nondecreasing. When u is shortest, the entire basis, including b_0, is
nondecreasing. No such order claim is needed for a merely A-short u.

#### B3. Product bound and the last minimum

Choose `i+1` independent lattice vectors realizing `λ_(i+1)`. One is
outside the i-dimensional preceding span, so

```text
||b_i|| ≤ c_i λ_(i+1).
```

Use the existing planned GN.1 second-Minkowski theorem, with v_n the
Euclidean volume of the unit ball, and Hadamard's determinant inequality:

```text
covol(Λ) ≤ Π_i ||b_i||
         ≤ (Π_i c_i)(2^n/v_n)covol(Λ).
```

Attainment of the successive minima and the lattice/basis determinant
identification belong to the GN.0/GN.1 supplier contract, not a second
private lattice library. The primitive-prefix API itself belongs to GN.5.

Apply B1–B3 with `u=1`, `A=1`. Writing the other basis vectors as
`v_1,...,v_(n−1)` gives

```text
Π_(i=1)^(n−1)||v_i||_tr ≍_n sqrt(D_K),
||v_i||_tr ≤ (3/2)^i ||w||_tr
  whenever w lies outside span_Q(1,v_1,...,v_(i−1)).
```

This includes the comparison at the last index that the previous checkpoint
could not certify. For n=2 it directly bounds the only nonconstant basis
vector by `C_2 sqrt(D_K)`.

For n≥3, use the already extracted nondegeneracy of the top-coordinate
multiplication matrix and select a nonzero permutation term. Every product
`v_i v_π(i)` in this term is outside the penultimate rational span. The
last-index comparison and submultiplicativity of the trace norm give,
with `L=||v_(n−1)||_tr`,

```text
L^(n−2) ≪_n Π_(i=1)^(n−2)||v_i||_tr².
```

Multiplying by L² and using the product bound yields `L^n≪_n D_K`.
The whole basis therefore has trace lengths at most `C_n D_K^(1/n)`.
There are n independent such vectors, giving the same upper bound for
`λ_n`. The norm comparison in B1 transports the result to the ordinary
mixed Euclidean metric. It does **not** claim that the basis is sorted
simultaneously in both metrics.

The top-coordinate matrix argument itself remains the earlier one: a
nonzero kernel vector r would make the codimension-one rational span
invariant under multiplication by the nonrational r; then `[Q(r):Q]`
would divide both n and n−1. No trace-form/nondegeneracy substitution is
being made.

### C. G2: replace the unverified genus assertion, rather than hide it

For a number field F let
`r_2(F)=dim_F2(Cl(F)/2Cl(F))=log_2 #Cl(F)[2]`.
These cardinalities agree for a finite abelian group. Their Galois modules
are **not** thereby canonically or equivariantly identified.

For a quadratic extension E/F, let t be the number of ramified places of
F, **including real places that become complex**, and let `e=max(t,1)`.
The quadratic specialization of Klüners–Wang Theorem 2.1 is

```text
r_2(E) ≤ 2(r_2(F)+e−1),
h_2(E) ≤ 4^(e−1) h_2(F)^2.
```

The squared base factor is essential to what is actually being used here.
This does not certify the author's earlier displayed one-factor formula,
or its advertised `D_E^(1/4+epsilon)` conclusion in arbitrary even degree.

#### C1. The equivariance issue and the correct class-field quotient

Put `A=Cl(E)/2Cl(E)` and let σ be the nontrivial automorphism of E/F.
Set `T=σ−1` and `V=A/TA`. In characteristic two, `T²=0`. If
`s=dim_F2 V`, rank-nullity and `im T⊆ker T` give

```text
r_2(E)=dim A ≤ 2(dim A−rank T)=2s.
```

The use of A rather than the torsion subgroup matters. For a concrete test,
on `B=Z/4 × Z/2` the involution

```text
σ(x,y)=(x,y+x mod 2)
```

fixes B[2] pointwise, whereas on B/2B it has a nontrivial unipotent block.
Both groups have four elements, but the numbers of fixed points are four
and two. This rules out a generally valid equivariant replacement based
only on their equal orders.

Use the ordinary Hilbert class field correspondence to let H/E be the
maximal everywhere-unramified elementary abelian 2-extension, with
`Gal(H/E)=A`. The characteristic quotient by `2Cl(E)` and functoriality
under conjugation make H/F Galois. Let M be the fixed field of TA. The
subspace TA is stable, so M/F is Galois and

```text
1 → V → G=Gal(M/F) → C2 → 1.
```

The conjugation action on V is trivial by construction. Since the quotient
is cyclic, this central extension is abelian: G is generated by V and one
lift of the quotient generator. Thus `|G|=2^(s+1)`, V has exponent two,
and the subgroup `2G` has order at most two. This last assertion follows
by squaring that one lift; it does not assume the extension splits.

These field constructions use the existing ordinary Hilbert class field,
not a narrow-class-field surrogate. In particular M/E is unramified at
finite places and split at real places.

#### C2. Ramified and unramified branches

If `t>0`, choose one ramified place of F. Its inertia group in M/F
maps isomorphically onto the order-two inertia group in E/F, because
M/E is everywhere unramified. It supplies an order-two lift outside V.
Consequently G splits as `V × C2` and is elementary abelian of rank s+1.
For each ramified place of F its inertia subgroup has order two; as G is
abelian, choosing a place above it does not change that subgroup. Let I
be the subgroup generated by these at most t inertia generators. Then
`dim I≤t` and `M^I/F` is everywhere unramified. Ordinary class field theory
makes `G/I` a quotient of Cl(F), so

```text
s+1−t ≤ dim(G/I) ≤ r_2(F).
```

This proves `s≤r_2(F)+t−1`, including when only an infinite place ramifies.

If `t=0`, M/F itself is everywhere unramified. G need not be elementary
abelian: a cyclic order-four factor is possible. Nevertheless G is a
quotient of Cl(F), and `|2G|≤2` gives

```text
s ≤ log_2 |G/2G| ≤ r_2(F).
```

Combining the two branches with `r_2(E)≤2s` proves the displayed relative
rank bound. This treatment does not drop capitulation or unit factors
from an ambiguous-class formula; it uses the full ordinary class-field
correspondence instead.

#### C3. Uniformity as the base field varies

Let `m=[F:Q]`. Every finite ramified prime of F divides the relative
discriminant Δ_(E/F); over each rational prime there are at most m primes
of F. There are at most m infinite places that can ramify. Therefore

```text
t ≤ m ω(N_F/Q Δ_(E/F)) + m ≤ m ω(D_E)+m,
D_E = D_F² N_F/Q Δ_(E/F).
```

The already extracted prime-support estimate, with its constant allowed
to depend on m and η, gives for every η>0

```text
h_2(E) ≪_(m,η) D_E^η h_2(F)^2.
```

This statement is uniform over all quadratic E/F with `[F:Q]=m`.
The real-place contribution is a degree-dependent constant. The norm of
the relative discriminant, the absolute field discriminant, and the
number of prime ideals of F are distinct quantities and must stay so
in the API.

#### C4. Why the squared factor still suffices

Start with `h_2(Q)=1`. Applying C3 to a quadratic field over Q gives
`h_2(K)≪_η D_K^η`, a weaker-than-optimal genus estimate that is enough
as the quadratic base case.

Write `α_d=1/2−1/(2d)` for `d≥2`. Proceed by strong induction on the
absolute degree. If a degree-n field K has no index-two subfield, the
preserved norm-curve argument gives `h_2(K)≪_(n,ε)D_K^(α_n+ε)`.
If it has a subfield F with `[K:F]=2`, put `m=n/2<n`. For m≥2 the
inductive bound and C3 yield

```text
h_2(K) ≪_(n,η) D_K^η D_F^(2α_m+2η)
       ≤ C_(n,η) D_K^(α_m+2η),
α_n−α_m=1/(2n)>0.
```

Here `D_F²≤D_K`, and all relevant exponents are nonnegative. Choose η
small enough relative to the final ε; for example η=ε/4 already leaves
the positive degree gain unused. The case m=1 is the quadratic base case.
This proves the required degree-dependent main bound, without using the
unverified one-factor genus assertion. For a quartic field with a quadratic
subfield, use the stronger quadratic base estimate in C3 to obtain
`h_2(K)≪_εD_K^ε`; the remaining quartic branch still needs the separate
resolvent transfer recorded under G4.

The generic `h_2(Q)=1`, quotient/finite-rank identities, primitive-submodule
extension, inertia-in-towers and discriminant-tower interfaces must still
be matched to exact pinned declarations or supplier requests during machine
synchronization/blueprint closure. They are not falsely marked newly
implemented by this proof note.

### D. Proposed extraction entries and ownership

These entries are **not yet in the result JSON**. Each suffix below means
`PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/<suffix>`. Their locator is the
named subsection of this supplement, together with the original source
locator where supplied. Retain all inherited IDs when integrating them.

**`trace-metric-normalization` — construction, missing; B1.**
On the existing mixed embedding, construct the trace-weighted Euclidean
metric by the explicit diagonal real linear equivalence. Its squared norm
counts complex coordinates twice, its integer-lattice covolume for the
induced Euclidean measure is `sqrt(D_K)`, and 1 is a primitive shortest
vector of length `sqrt(n)`.
API: `traceNorm_sq`, `traceNorm_eq_norm_scaled`, `norm_le_traceNorm`,
`traceNorm_le_sqrtTwo_mul_norm`, `traceCovolume_integerLattice`,
`traceNorm_one`, `sqrt_degree_le_traceNorm_of_integral_ne_zero`, and the
primitive-vector statement. These are planning names, not existing Lean
citations. Tests: Q has length/covolume one; Q(i) has trace basis lengths
`sqrt(2)` and trace covolume two, but ordinary covolume one; metric
comparison remains valid for a mixed signature and explicitly changes
both real coordinates of each complex factor. Suggested owner:
EffectiveBoundsClassGroupTorsion, importing existing covolume and GN APIs.

**`primitive-prefix-extension` — theorem, missing; B2.**
A full rank-n Euclidean lattice and primitive A-short initial vector admit
a basis with the all-index comparison and constants c_i in B2. The proof
is shortest primitive extension, quotient-coordinate rounding, induction.
Test the last index; reject a nonprimitive initial vector such as 2 in Z;
for a shortest initial vector verify all c_i equal `(3/2)^i`.
Suggested owner: source within GN.5; no new roadmap.

**`reduced-basis-product` — theorem, missing; B3.**
The basis just constructed satisfies
`covol Λ≤Π||b_i||≤(Πc_i)(2^n/v_n)covol Λ`. Proof: compare to each
successive minimum, then second Minkowski and Hadamard. The rank-one
case and positive n are explicit; no unproved equality of a merely
independent set with an integral basis. Suggested owner: GN.5, importing
GN.0/GN.1.

**`hilbert-class-field-input` — theorem, planned; C1–C2.**
The ordinary Hilbert class field correspondence identifies finite abelian
everywhere-unramified extensions with quotients of the ordinary class group,
compatibly with conjugation. Import its elementary-2 quotient and
maximal-unramified property from upstream ClassFieldTheory Layer 13.
A narrow class group instead permits real-place ramification and is not
an interchangeable carrier. The layer's named Hilbert-class-group
isomorphism is planned, not a declaration asserted present at the pins.

**`quadratic-coinvariant-extension` — construction, missing; C1.**
For quadratic E/F construct A, T, H, and M as above, using the ordinary
Hilbert class field supplier. Export the finite extension G with kernel
`V=A/TA`, trivial conjugation on V and `|2G|≤2`.
API: the induced involution on `Cl(E)/2Cl(E)`; `T_sq_zero`; the stable
subgroup TA; fixed-field and restriction maps; the exact sequence;
`commutative_G`; `card_G`; and `card_twoG_le_two`. These are planning
interfaces, not new public class-field carriers. Tests: the Z/4×Z/2
involution must distinguish torsion and quotient actions; the unramified
branch must allow nonsplit C4; a ramified place must furnish an actual
order-two inertia lift, not an arbitrary lift. Suggested owner:
EffectiveBoundsClassGroupTorsion, consuming the existing CFT supplier.

**`quadratic-relative-rank` — theorem, missing; C2.**
For every quadratic E/F, with t counting finite and infinite ramified
places, `r_2(E)≤2(r_2(F)+max(t,1)−1)`. Source: Klüners–Wang v2,
Theorem 2.1, pp.3–4; quotient-module proof expanded in C1–C2. Keep the
`t=0` branch rather than replacing max(t,1) by t. Suggested owner:
EffectiveBoundsClassGroupTorsion.

**`ramified-place-support` — theorem, missing; C3.**
For `[F:Q]=m` and quadratic E/F,
`t≤m ω(N Δ_(E/F))+m≤m ω(D_E)+m`.
Proof: support of the relative discriminant, at most m primes above a
rational prime, and at most m real places. Suggested owner:
EffectiveBoundsClassGroupTorsion, importing ramification/discriminant
suppliers rather than defining them again.

**`quadratic-relative-torsion` — theorem, missing; C3.**
For every m≥1 and η>0 there is a constant C_(m,η) such that
`h_2(E)≤C_(m,η)D_E^η h_2(F)^2` for all quadratic E/F of base degree m.
Proof: exponentiate the relative-rank bound, use ramified-place support
and the already extracted prime-support loss. Suggested owner:
EffectiveBoundsClassGroupTorsion. Uniformity includes varying F.

**`all-degree-torsion-induction` — theorem, missing; C4.**
Given the no-index-two norm-curve bound and the preceding quadratic
estimate, derive for each n≥3 and ε>0 the uniform bound
`h_2(K)≪_(n,ε)D_K^(1/2−1/(2n)+ε)`, using the quadratic `D^ε` base case.
The induction is on absolute degree, not on a presumed tower down to Q.
Suggested owner: EffectiveBoundsClassGroupTorsion. It does not by itself
prove the sharper cubic or nonquadratic-subfield quartic exponent.

The existing `reduced-integral-basis` ID should now state its sorted basis
in the **trace metric**, cite B1–B3 as a replacement argument and receive
an EffectiveBounds Part-II route. Its original-source locator remains
recorded as motivation, with Siegel unread. Update `largest-minimum`,
`two-torsion-general` and the route brief accordingly. Keep the literal
`relative-genus-source-claim` unrouted and diagnostic; it is no longer a
premise of the replacement main-bound route.

Suggested homes for the later design: generic primitive-prefix reduction
under `TauCeti/NumberTheory/GeometryOfNumbers/`; number-field metric and
torsion bounds under `TauCeti/NumberTheory/EffectiveBounds/`. No Suggested.lean
is produced by this paper checkpoint. Exact generic declaration audits and
any additional sublemma nodes remain part of the machine/blueprint work.

After the nine additions and routing the old basis node, expected totals
are 119 items (22 library, 8 planned, 89 missing), six routes and 33
construction/definition entries. Recompute rather than copy these counts.
The present unchanged JSON still contains the earlier 110 items.

### E. Regression tests and remaining verification

The following local script was actually executed in this session. Its
finite tests do not certify the infinite lattice or class-field arguments,
and are not a substitute for Lean proofs or the repository checker.

```python
from fractions import Fraction
from itertools import product

c = [Fraction(1)]
for i in range(1, 31):
    c.append(1 + sum(c) / 2)
    assert c[i] == Fraction(3, 2) ** i

B = list(product(range(4), range(2)))
sigma = lambda a: (a[0], (a[1] + a[0]) % 2)
assert all(sigma(sigma(a)) == a for a in B)
torsion = [a for a in B if (2 * a[0]) % 4 == 0]
assert all(sigma(a) == a for a in torsion)
Q = list(product(range(2), range(2)))
sigma_q = lambda a: (a[0], (a[1] + a[0]) % 2)
assert len(torsion) == len(Q) == 4
assert sum(sigma_q(a) == a for a in Q) == 2

def rank(cols):
    basis = {}
    for x in cols:
        while x:
            k = x.bit_length() - 1
            if k in basis:
                x ^= basis[k]
            else:
                basis[k] = x
                break
    return len(basis)

def apply(cols, x):
    y = 0
    for i, col in enumerate(cols):
        if (x >> i) & 1:
            y ^= col
    return y

counts = []
for n in range(5):
    seen = 0
    for cols in product(range(1 << n), repeat=n):
        if all(apply(cols, col) == 0 for col in cols):
            assert n <= 2 * (n - rank(cols))
            seen += 1
    counts.append(seen)
assert counts == [1, 1, 4, 22, 316]

alpha = lambda d: Fraction(1, 2) - Fraction(1, 2 * d)
for m in range(2, 101):
    assert alpha(2 * m) - alpha(m) == Fraction(1, 4 * m)
print('PASS: recurrence, inequivalent actions, square-zero matrices, exponents')
```

The source-version problem G0 remains: attempted AMS reads did not return
the revised article, and publication metadata alone does not establish
mathematical agreement. G3–G10 retain the substantive source/closure
obligations recorded in the handoff. G1 now has a direct proof candidate;
G2 has a later-source replacement for the main theorem, not verification
of the literal stronger claim. Neither repair has an independent review.

Only the finite regression checks above ran locally. A local clone was
not obtainable in this environment, so `scripts/check_paper.py` and the
full-catalogue intake checks were **not run locally by this session**.
This report and the handoff are the submitted checkpoint; the unchanged
machine extraction must be synchronized and validated before these new
entries can be regarded as integrated. No Lean file was compiled.
