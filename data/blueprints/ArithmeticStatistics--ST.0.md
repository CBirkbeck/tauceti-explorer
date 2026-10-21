# Arithmetic statistics: concrete families and normalizations (ST.0)

This part specifies the input spaces for counting fields, polynomial discriminants,
Selmer families, finite-field moduli and marked unramified extensions. A counting
theorem needs a precise choice of object, equivalence relation, height, numerator
and denominator. The same equations can give different statistics when any of
these choices changes. The aim of ST.0 is to fix those choices before the orbit
counts, sieves and distribution theorems of the later stages use them.

The accepted parent packet already supplies the generic arithmetic family,
Northcott carriers, weighted counts, relative densities, binary-quartic invariant
height, minimal elliptic-curve carrier, squareclass heights and discriminant-ordered
number fields. This document imports that work. It adds concrete coefficient,
hypersurface, Pell, moduli, Picard and wreath-type adapters and audits every one
of the 175 source targets routed to ST.0. It makes 40 new target-level nodes;
53 routed targets are developed by these nodes and 122 retain their existing
owners. Importing a planned target records ownership and does not claim an
implementation.

The planning pass is complete. The stage is **planned**, with five recorded
supplier gaps and twelve requests; it is not closed. All implementation statuses
are unchecked. The suggested file proposes declarations with unfinished proofs,
and explicitly omits geometric statements whose supplier types are absent.
In particular, neither a candidate probability law nor a local Euler product
asserts the arithmetic convergence theorem that could identify it as a limit.

## Conventions and existing work

The library pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Statements were checked
in the source trees at those pins, as well as against the declaration index.
Tau Ceti's native Northcott finite carriers, summatory functions, wreath product
and abelian-variety category are reused. A natural set cardinality or `Nat.card`
represents a genuine count only after the appropriate finiteness has been proved.
Infinite types have a junk cardinality value of zero, so that value is never
used as an arithmetic finiteness argument. A finite ratio with zero denominator
is assigned zero; every limiting assertion must separately ensure its denominator
is eventually positive on the sequence under consideration.

Natural cutoffs are inclusive. Strict real-cutoff source asymptotics are stated
separately. Polynomial coefficient vectors retain their fixed degree even when
their leading coordinate vanishes modulo a prime. All finite-field isomorphisms
are defined over the named field. Counts of objects, isomorphism classes,
automorphism orbits and inverse-automorphism masses have separate meanings.
The proposed declaration namespace is `ArithmeticStatistics.ST0`; every short
API or test name below has that prefix. The module path in the packet is a
proposed destination, not a claim that such a module is built.

Current TauCetiRoadmap main was checked at
`81207c7f16d5abf770f13a7d2bdcdb465c030787`, including its newer roadmap directions.
ArithmeticDirichletSeries and Completed/EffectiveBounds were read in full.
ArithmeticDirichletSeries supplies ideal/norm carriers and analytic tools;
it does not supply the general ray-class squarefree-ideal denominator requested
below. AlgebraicVectorBundles supplies general locally free sheaves, duals and
line bundles; the needed Grothendieck splitting on the projective line was not
located there. JacobianChallenge remains the geometric supplier for the
hyperelliptic Picard and pushforward comparison. IntegralLattices owns the
hermitian/lattice classification of polarization fibers. PolynomialGaloisGroups
owns the normal-closure permutation action, and EllipticCurves Layer 8 owns the
minimal-pair carrier. None of those objects is planned again here.

The accepted parent ST.0 interface is imported in the following groups:

| Existing input | Nodes retained in the parent | Use in this part |
|---|---|---|
| Arithmetic families and density | `arithmetic-family`, `relative-density`, multiplicativity, positive-lower-density restriction, constant and piecewise height rescaling | Common finite carriers and denominator comparisons |
| Weighted orbit counts | `stabilizer-weighted-orbit-count`, weighted/unweighted comparison | Distinguish stack mass from class count and rigid multiplicity |
| Local families | `family-defined-by-local-conditions`, `acceptable-weight-function` | Specialize to actual residue subsets; do not embed a sieve theorem in acceptability |
| Binary quartics | Form/action, invariants, relative invariance, exact-degree polynomial-discriminant comparison, invariant height, eligible pairs and their mod-27 lattice description | Retain the invariant-height orbit family; coefficient maximum is a different height |
| Elliptic curves | Minimal-pair carrier, quartic-to-curve normalization, congruence families and largeness | No second elliptic model or minimality convention |
| Squareclasses | Height, Selmer-coset fibers, bounded-height finiteness, quadratic twists and twist multiplicity | General-number-field denominator remains a named analytic frontier |
| Positive squarefree integers | Möbius indicator, residue-class count, even-parity classes and density transfer | Rational-base normalizations and the Pell comparison |
| Number fields | Discriminant family and embedded/isomorphism-class comparison | Field-type restrictions and Wood quadratic-base averages |

The irreducible binary-quartic orbit finiteness used by the parent's invariant
height remains ST.2 fundamental-domain work. A coefficient box does not prove
that orbit finiteness. Likewise the parent's comparison with the affine quartic
discriminant assumes degree exactly four; the universal binary invariant below
retains degree across leading-zero specializations.

## The mathematical spine

### Coefficient families, projective equations and Pell ordering

A fixed integral coefficient vector is a model. Its maximum absolute coordinate
is a natural Northcott height. Monic polynomials instead use the weighted maximum
of the i-th root of the absolute value of the i-th coefficient. At nonnegative
cutoff X this gives coordinate bounds X, X², …, Xⁿ, rather than a common bound.
For example, the weighted height of x²+4 is 2 while its coefficient maximum is 4.

Projective hypersurface equations are primitive vectors modulo the two-element
sign relation. The squared Euclidean norm gives a natural finite carrier, and
the square-root adapter recovers the source height. The scalar relation is
only sign for primitive integral representatives: there is no projective-linear
coordinate quotient. The homogeneous evaluator and primitive residue carrier
come from ST.5. A primitive root modulo Q gives a finite congruence approximation
to local solubility, with modulus one handled separately.

The negative-Pell input is the set of positive squarefree radicands all of whose
odd prime divisors are 1 modulo 4. This includes 1 and the prime 2. The negative
Pell equation selects a subset of that input; previous probability bounds do
not become assertions in the definition. Radicand ordering and fundamental
discriminant ordering differ by a factor of four on one congruence piece, so
their density transfer uses the parent's piecewise-height theorem.

### Fixed-degree discriminants and finite local proportions

For binary degree n at least two, construct the integral universal polynomial
Δₙ, then evaluate it over any commutative ring. On a monic coefficient vector
it agrees with the native affine polynomial discriminant. A vanished leading
coefficient still represents a root at infinity: the quadratic xy has Δ₂=1,
whereas y² has Δ₂=0. Replacing it by the discriminant of a lower-degree affine
polynomial loses that distinction.

For prime p, αₙ(p) counts all binary coefficient tuples modulo p² with nonzero
discriminant, divided by p^(2n+2). The monic valuation-j proportion νⱼ(n,p)
uses coefficients modulo p^(j+1), requires pʲ to divide Δ and p^(j+1) not to
divide it, and divides by p^((j+1)n). The two finite proportions have different
ambient coefficient spaces.

The valuation-one generating function is

\[
rac{(p-1)t^2}{p^2}rac{1-t^2/p}{(1-t)(1+t/p)}.
\]

It comes from one repeated linear factor, a squarefree complementary factor
avoiding that root, and a first-order lift avoiding square divisibility.
Coefficient extraction gives the factor 1−(−p)^(2−n), with degree two treated
separately. This correction is needed before sorting binary coefficient tuples
by the multiplicity of the root at infinity.

| Probability | Degree/range | Correct value |
|---|---|---|
| ν₀(n,p) | n=0,1 | 1 |
| ν₀(n,p) | n≥2 | 1−1/p |
| ν₁(n,2) | all n | 0 |
| ν₁(n,p), odd p | n=0,1 | 0 |
| ν₁(2,p), odd p | n=2 | (1−1/p)/p |
| ν₁(n,p), odd p | n≥3 | (1−1/p)²(1−(−p)^(2−n))/(p+1) |
| α₂(2) | degree two | 1/2 |
| αₙ(2) | n≥3 | 3/8 |
| α₂(p), odd p | degree two | (1−1/p)(1+1/p−1/p³) |
| α₃(p), odd p | degree three | (1−1/p)²(1+1/p)² |
| αₙ(p), odd p | every n≥4 | (1−1/p)²(1+1/p)(1+1/p−1/p²) |

Stickelberger's integral congruence forces Δ to be 0 or 1 modulo 4. Therefore
weak square divisibility at 2 is empty. At odd p, root criteria distinguish a
single double root from triple or multiple repeated roots; zero reduction and
the projective root at infinity require their explicit cases. The general-rank
binary ring, its projective roots and its p-maximal-order predicate remain
ST.1 suppliers. In particular βₙ(p), the density of maximal binary-form rings,
cannot be modeled by applying the monic maximality predicate to a degree-dropped
affine polynomial.

The monic factor λₙ(p)=ν₀+ν₁ is positive and differs from one by Oₙ(p⁻²).
Its prime product converges to a positive number, with λ₂=4/π². The uniform
prime-tail bound also permits the limit in degree. Identifying these local
products with a global weighted-height or coefficient-height density needs
the ST.2 infinite-prime tail estimate; product convergence alone is insufficient.

### Abelian varieties and polarization fibers

B(k,g) counts k-isomorphism classes of dimension-g abelian varieties. A(k,g)
counts k-isomorphism classes of principally polarized pairs. Both are unweighted.
Use Tau Ceti's native category and dimension, then import finite-field
classification before interpreting their natural cardinality as a count.
An isomorphism of polarized pairs obeys f∨λ′f=λ.

For a fixed A, the forgetful fiber is the orbit set of principal polarizations
under Autₖ(A). The automorphism group can be infinite even though the orbit set
is finite. Lipnowski–Tsimerman Proposition 4.11 gives the Rosati-conjugacy
description after choosing a principal polarization; Examples 4.12–4.13 give
the integral-lattice and CM-unit specializations. Their geometry belongs to
the polarization, arithmetic-moduli and IntegralLattices owners. The typed
generic orbit adapter in the suggested file only counts a supplied action;
it does not identify an arbitrary action with polarizations.

### Bundle laws, the Picard quotient and theta events

Modulo tensoring by a line bundle, rank-two bundles on P¹ are represented by
O⊕O(n), n≥0. The natural probability comes from inverse automorphism sizes:

\[
\mu_q(0)=rac{q-1}{2q},\qquad
\mu_q(n)=rac{q^2-1}{2q^{n+1}}\quad(n\ge1).
\]

Both parity sectors have mass 1/2. The tail d+2ℕ has mass 1/(2q^(d−1))
for d≥1; the d=0 tail has mass 1/2. The special balanced-bundle term cannot
be obtained by substituting zero into the unbalanced formula.

For a smooth geometrically connected hyperelliptic C/Fq with pencil κ of
degree two, use the rational line-bundle group P and Q=P/ℤκ. Lang's theorem
and the vanishing finite-field Brauer obstruction give a degree-one line
bundle even when C has no rational point. Degree is therefore onto, and
if h=#J(Fq), Q has 2h elements. This is a two-sector extension of the
degree-zero group; it need not split as a direct product. After choosing D₀
of degree one, multiplying two odd representatives introduces the carry
−c, where c=κ−2D₀. The abstract example P=ℤ×ℤ/2 and κ=(2,1) gives Q≅ℤ/4
and detects a falsely split quotient.

Push uniform Q forward through L↦(ν(L),ν(M⊗L⁻¹)), where ν is the splitting
gap of the hyperelliptic pushforward. Geometric involution invariance relates
this to the equivalent simultaneous-twist convention; a generic function on
an additive group has no such invariance unless it is proved. Every joint
cell is counted with denominator 2h. A tail ν∈a+1+2ℕ is identified with
effective degree-(g−a) line-bundle classes. The joint tail is a theta intersection
after twisting M by the unique integral power of κ that matches its degree.
Incompatible degree parities give an empty event. The denominator becomes h
only after explicitly conditioning on the parity sector.

The parity-compatible product law assigns 2μq(i)μq(j) when i+j has the prescribed
parity and zero otherwise. It is a normalized candidate with marginals μq;
its definition contains no mixing theorem. A special Hecke correspondence
instead gives the pushforward of the normalized invariant adelic probability
through x↦(xK,xgDK). Stabilizers and correspondence multiplicities remain in
that pushforward. The normalized adelic quotient is requested from AA.2;
the generic measurable pair pushforward uses Mathlib directly.

The finite regression C/F₃: y²=2((x³−x)²+1) tests all these conventions together.
The derivative of its squarefree degree-six right side is 2x³+x, whose roots
are 0,1,−1; the right side equals 2 there. At each F₃ affine x, the right side
is the nonsquare 2, and its leading coefficient gives no rational infinity
points. Over F₉=F₃[t]/(t²+1), exhaustive affine counting plus the two infinity
points gives fourteen points. Hence the genus-two zeta numerator is
1−4T+10T²−12T³+9T⁴, whose value at one is 4. The quotient has eight classes.
The exact bundle masses are 1/2 at 0, 3/8 at 1 and 1/8 at 3. They follow
from Θ₁ having no rational points and Θ₀ being a singleton. This finite law
is distinguished from the infinite-support natural μ₃. In particular Pic¹
is inhabited although the curve is pointless, and a single-class unconditional
tail has probability 1/8 rather than 1/4.

### Wood types, infinity markings and rigid averages

Use the native W=G≀S₂. For H≤W, c(H) consists of order-two elements with
nontrivial top projection. Admissibility requires the canonical swap, generation
by c(H) and surjectivity of the first-coordinate projection of the top kernel.
Goodness adds a single H-conjugacy class of outside involutions. These are
different conditions: the diagonal C₂ times the swap gives an admissible
non-good type. Type automorphisms are those automorphisms of G whose induced
wreath map preserves H; they are not all automorphisms of H.

A rigid surjection is an actual continuous surjective homomorphism from the
supplied profinite group to G. Fixing its kernel leaves an Aut(G)-torsor;
retaining H restricts that torsor to the type-preserving subgroup. The global
binding needs the full maximal extension unramified at finite places and split
at infinity. The existing IG.4 prime-to-Δ supplier is insufficient for that
full construction. Imaginary function-field infinity uses the prescribed
completion and canonical outside involution. Real data include an additional
outside twist y, and the type is the actual image inside the wreath product.

The imaginary numerator sums rigid type-H surjections; the real numerator sums
type-H pairs (ρ,y). Their common denominator counts quadratic base fields in
the same infinity-restricted carrier. Over Q use the discriminant cutoff.
Over Fq(t), the exact discriminant q^(2n) slice used by ST.5 stays exact; it
is not silently replaced by a cumulative cutoff. Wood Lemma 2.1 gives the
good-real multiplicity |c(H)|·|Aut_H(G)|, while imaginary multiplicity is
|Aut_H(G)|. An empty finite slice has assigned average zero and contributes
no limiting positivity assertion. Root-of-unity corrections use torsion in
the imported reduced multiplier, with order 2 over Q and q−1 over Fq(t).
A tame restriction changes the base denominator as well as the numerator.

## Target definitions, APIs, tests and prerequisite chains

The following nodes are in prerequisite order. Each proof sketch records the
mathematical steps needed between the named inputs and the stated target.
Statements are authored here; source links give exact theorem, section and
page locators for comparison. Named tests are specifications for formal unit
tests, and the typed tests also appear as examples in the suggested file.

### Integral coefficient boxes

<a id="coefficient-box"></a>

**Target:** `ArithmeticStatistics:ST.0/coefficient-box`. **Declaration:** `boxHeight` (construction).

For n≥0 use integral vectors a∈Z^(n+1), representing Σ a_i x^(n−i)y^i. H_box(a)=max_i |a_i| is natural valued and Northcott. The inclusive box has (2B+1)^(n+1) elements at natural cutoff B; it counts vectors, without quotienting by a change-of-variables group.

**Sources.** [Bhargava, Shankar, Wang, Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), §1 p.1, height convention. Coefficient maximum and fixed-degree integral models.

**Inputs.** `mathlib:Northcott`, `tauceti:TauCeti.normLE`.

**Downstream use.** BSW II Theorems 1–2: Select the coefficient box before the sieve.

**Proof plan.** Bound each coordinate in the finite integer interval [−B,B]. The box is their Cartesian product. Apply the parent ofNat adapter; do not reuse weighted monic height.

**API.**

- `boxHeight_le` (characterisation): H_box(a)≤B iff every coordinate has absolute value at most B.
- `boxHeight_northcott` (instance): The maximum height on a fixed finite coefficient vector is Northcott.
- `boxHeight_count` (characterisation): The inclusive box has (2B+1)^m vectors.
- `boxHeight_neg` (characterisation): Changing all signs preserves height.

**Unit tests.**

- `box_test_three` (computation): A single integer has seven choices in the box of height 3.
- `box_test_zero` (degenerate): Only the zero vector has height 0.
- `box_test_negative_cutoff` (compatibility): The native real-cutoff carrier is empty below zero.

### Weighted height of monic polynomials

<a id="monic-weighted-height"></a>

**Target:** `ArithmeticStatistics:ST.0/monic-weighted-height`. **Declaration:** `monicPolynomial` (construction).

For a=(a₁,…,a_n) define f_a=x^n+Σ_{i=1}^n a_i x^(n−i) and H_w(a)=max_i |a_i|^(1/i), with the maximum of the empty vector 0. For X≥0, H_w≤X iff |a_i|≤X^i. Thus the inclusive count is ∏_{i=1}^n(2⌊X^i⌋+1), and the strict count for n≥1 is 2^n X^(n(n+1)/2)+O_n(X^(n(n+1)/2−1)). This ordering is not the coefficient maximum used by ABZ.

**Hypotheses.** Nonnegative X in the coordinate and floor formulas; n≥1 in the stated asymptotic.

**Sources.** [Bhargava, Shankar, Wang, Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), §1 p.1, definition of H and first counting display. Weighted coordinate box for monic polynomials.

**Inputs.** `mathlib:Northcott`, `mathlib:Polynomial.discr`, `ArithmeticStatistics:ST.0/coefficient-box`.

**Downstream use.** BSW I Theorems 1.1–1.2: Fix the anisotropic family and its denominator.

**Proof plan.** Construct f_a from the finite coefficient tuple. Real roots of the nonnegative absolute values give the height. Monotonicity of powers converts sublevel sets to anisotropic integer boxes; multiply interval counts. The strict-cutoff asymptotic follows by expanding the product.

**API.**

- `weightedHeight` (data): The maximum of |a_i|^(1/(i+1)); empty maximum 0.
- `weightedHeight_le` (characterisation): At X≥0, the height bound is equivalent to all weighted coefficient bounds.
- `weightedHeight_northcott` (instance): The weighted height is Northcott.
- `monicPolynomial_monic` (characterisation): The constructed polynomial is monic of degree n.

**Unit tests.**

- `weighted_test_quadratic` (computation): x²+4 has weighted height 2, though its coefficient maximum is 4.
- `weighted_test_unit_box` (computation): At cutoff 1 the degree-two monic family has nine elements.
- `weighted_test_degree_zero` (degenerate): The degree-zero polynomial is 1 and its coefficient height is 0.

### Fixed-degree binary discriminant

<a id="binary-discriminant"></a>

**Target:** `ArithmeticStatistics:ST.0/binary-discriminant`. **Declaration:** `binaryDiscriminant` (construction).

For n≥2 the universal binary discriminant D_n∈Z[a₀,…,a_n] is the integral homogeneous polynomial of degree 2n−2 agreeing with Disc(Σ a_i x^(n−i)) when a₀ is invertible and the polynomial has degree n. Evaluation defines Δ_n over every commutative ring, including a₀=0. At n=0,1 use Δ_n=1. Its covariance under γ∈GL₂ is det(γ)^(n(n−1)), and Δ_{n+1}(xf)=Δ_n(f) f(0,1)². A leading-zero vector must never be evaluated with the discriminant of its lower-degree affine polynomial.

**Sources.** [Bhargava, Shankar, Wang, Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), §1 pp.1–2 and Appendix A p.53. Binary discriminant and the root at infinity.

**Inputs.** `mathlib:Polynomial.discr`.

**Downstream use.** BSW II Proposition A.1: Retain degree when sorting roots at infinity. BGW §2: Use the fixed-degree invariant in the model family.

**Proof plan.** Construct the universal polynomial through the resultant of the universal polynomial and its derivative, cancel the leading coefficient integrally, and prove base change. The root-product identity on the generic coefficient ring gives homogeneity, covariance and the added-root formula; injectivity into its fraction field extends them across the leading-zero locus.

**API.**

- `binaryDisc` (data): Evaluate the universal integral invariant in an arbitrary coefficient ring.
- `binaryDisc_monic` (compatibility): For leading coefficient 1, binary discriminant agrees with Mathlib polynomial discriminant.
- `binaryDisc_map` (functoriality): Evaluation commutes with every ring homomorphism.
- `binaryDisc_scale` (characterisation): Scalar multiplication contributes c^(2n−2) for n≥2.
- `binaryDisc_add_root` (characterisation): Multiplication by x adds the root (0:1) and contributes the square of f(0,1).

**Unit tests.**

- `binary_test_quadratic` (computation): The quadratic vector (a,b,c) has discriminant b²−4ac.
- `binary_test_infinity` (computation): The binary quadratic xy has discriminant 1 although its leading coefficient is zero.
- `binary_test_double_root` (non-example): The binary quadratic y² has a repeated projective root and discriminant zero.

### Finite binary squarefree-discriminant proportion

<a id="binary-local-proportion"></a>

**Target:** `ArithmeticStatistics:ST.0/binary-local-proportion`. **Declaration:** `binaryLocalProportion` (definition).

For n≥2 and prime p, α_n(p) is the fraction of all (n+1)-tuples modulo p² whose fixed-degree binary discriminant is nonzero modulo p². All tuples are included, including zero and leading-zero reductions. This finite count equals normalized Haar measure on Zp^(n+1).

**Sources.** [Bhargava, Shankar, Wang, Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Appendix A, Proposition A.1 pp.53–54. Coefficient-space local density for all binary forms.

**Inputs.** `ArithmeticStatistics:ST.0/binary-discriminant`, `mathlib:ZMod`, `mathlib:Fintype.card`.

**Downstream use.** BSW II squarefree sieve: Supply the local factor; this definition does not prove an infinite-prime sieve.

**Proof plan.** Evaluate the universal discriminant directly in Z/p²Z. Count its nonzero locus and divide by p^(2n+2). Modulus invariance identifies this with the p-adic cylinder.

**API.**

- `binaryLocalProportion_nonneg` (characterisation): The proportion is nonnegative.
- `binaryLocalProportion_le_one` (characterisation): For p positive the proportion is at most one.
- `binaryLocalProportion_lift` (compatibility): The numerator agrees with integer representatives satisfying p²∤Δ.

**Unit tests.**

- `alpha_test_two_two` (computation): Binary quadratics at 2 have density 1/2.
- `alpha_test_three_two` (computation): Binary cubics at 2 have density 3/8.
- `alpha_test_four_three` (computation): Binary quartics at 3 have density 176/243.

### Finite monic discriminant probabilities

<a id="monic-local-proportions"></a>

**Target:** `ArithmeticStatistics:ST.0/monic-local-proportions`. **Declaration:** `monicValuationProportion` (definition).

For n≥0, prime p and j≥0, ν_j(n,p) is the fraction of monic coefficient vectors modulo p^(j+1) for which p^j divides the integral discriminant and p^(j+1) does not. Compute the discriminant using any integer lifts; congruence makes this independent of lifts. For j=0 reduction modulo p suffices, for j=1 use p². Degree zero and one have Δ=1.

**Sources.** [Ash, Brakenhoff, Zarrabi, Equality of Polynomial and Field Discriminants](https://drive.google.com/uc?export=download&id=1lZ2HQrPDEugaMn1J3ERpqDp9g6C-t6Vd), §2 p.368; §6 Propositions 6.4,6.7 and Theorem 6.8 pp.371–372. Finite residue proportions and modulus required to detect a valuation.

**Inputs.** `ArithmeticStatistics:ST.0/monic-weighted-height`, `mathlib:ZMod`, `mathlib:Fintype.card`.

**Downstream use.** BSW II Appendix A: Separate unit and valuation-one strata before adding the infinity strata.

**Proof plan.** Choose canonical integer representatives, evaluate the integral polynomial discriminant, and filter the finite tuple space. Change of lifts alters the invariant by a multiple of the modulus. Uniform residue measure agrees with normalized p-adic Haar measure.

**API.**

- `monicProportion_nonneg` (characterisation): A finite discriminant proportion is nonnegative.
- `monicProportion_le_one` (characterisation): At a positive modulus the proportion is at most one.
- `monicDisc_lift` (compatibility): Discriminants of congruent monic coefficient tuples are congruent.

**Unit tests.**

- `nu_test_linear_unit` (computation): Every monic linear discriminant is a unit.
- `nu_test_linear_one` (degenerate): No monic linear discriminant has valuation one.
- `nu_test_two` (non-example): A quadratic discriminant at 2 has zero valuation-one probability.
- `nu_test_quartic_three` (computation): The valuation-one probability for monic quartics at 3 is 8/81, not 80/729.

### Strong and weak square divisibility

<a id="strong-weak-discriminant"></a>

**Target:** `ArithmeticStatistics:ST.0/strong-weak-discriminant`. **Declaration:** `StrongSquareDiv` (definition).

For an integral polynomial invariant D on a fixed coefficient vector, D(a) is strongly p²-divisible when every vector congruent to a modulo p still has p²|D. It is weakly p²-divisible when p²|D(a) but strong divisibility fails. For squarefree m, W_m^(i)=intersection over p|m of the corresponding strong or weak loci. These notions are coefficient-space notions; they are not defined by first factoring the affine polynomial.

**Hypotheses.** p is prime for the arithmetic interpretation; the predicates themselves make sense for every natural p.

**Sources.** [Bhargava, Shankar, Wang, Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), §1.1 pp.4–5. Strong perturbation condition and complementary weak locus. [Bhargava, Shankar, Wang, Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), §1 pp.2–3. The same condition for binary coefficient vectors.

**Inputs.** `ArithmeticStatistics:ST.0/binary-discriminant`, `ArithmeticStatistics:ST.0/family-defined-by-local-conditions`.

**Downstream use.** BSW I/II switching constructions: Identify the weak locus before changing representation.

**Proof plan.** Express all same-residue vectors as a+pb. Strong is residue-class stable. Weak is the difference between the full square-divisibility set and the strong locus. Form intersections for squarefree m.

**API.**

- `WeakSquareDiv` (data): Square divisibility without strong divisibility.
- `squareDiv_partition` (characterisation): Every square-divisible vector lies in exactly one of the two loci.
- `strongSquareDiv_residue` (characterisation): Strong divisibility is unchanged by adding p times a vector.
- `SquarefreeDivLocus` (data): The m-locus is the intersection of the selected prime loci.

**Unit tests.**

- `div_test_odd_weak` (computation): x²+9 is weakly 3²-divisible.
- `div_test_triple_strong` (computation): x³ is strongly 3²-divisible.
- `div_test_two_strong` (computation): x² is strongly 2²-divisible; adding 2 to its constant coefficient keeps 4|Δ.

### Stickelberger congruence for binary forms

<a id="stickelberger-binary"></a>

**Target:** `ArithmeticStatistics:ST.0/stickelberger-binary`. **Declaration:** `binaryDisc_mod_four` (theorem).

For every integral binary n-ic form with n≥2, Δ_n is congruent to 0 or 1 modulo 4. In particular 2|Δ_n implies 4|Δ_n, so weak square divisibility at 2 is empty. The theorem includes leading-zero forms.

**Sources.** [Bhargava, Shankar, Wang, Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), §1 p.2 and Appendix A p.54. Prime-2 discriminant restriction, including nonmonic forms.

**Inputs.** `ArithmeticStatistics:ST.0/binary-discriminant`, `ArithmeticStatistics:ST.1`, `ArithmeticStatistics:ST.0/strong-weak-discriminant`.

**Proof plan.** Use the ST.1 discriminant-preserving rank-n ring of a binary form. The integral trace Gram matrix of a based ring has determinant congruent to a square modulo 4 (Stickelberger); alternatively establish the universal binary polynomial congruence before specialization. Deduce invariance for all coefficient vectors congruent modulo 2.

**API.**

- `binary_no_weak_two` (characterisation): The binary weak 2²-locus is empty.

**Acceptance check.** Quadratic discriminants b²−4ac are 0 or 1 mod4; xy has Δ=1, and y² has Δ=0.

### Correct monic local density formulas

<a id="monic-density-formulas"></a>

**Target:** `ArithmeticStatistics:ST.0/monic-density-formulas`. **Declaration:** `monic_nu_zero` (theorem).

For prime p, ν₀(0,p)=ν₀(1,p)=1 and ν₀(n,p)=1−1/p for n≥2. At p=2, ν₁(n,2)=0. For odd p, ν₁(0,p)=ν₁(1,p)=0, ν₁(2,p)=p^−1(1−p^−1), and for n≥3, ν₁(n,p)=(1−p^−1)²(1−(−p)^(2−n))/(p+1). Thus λ_n(p)=ν₀+ν₁ equals 1 for n≤1, 1/2 at p=2,n≥2, 1−1/p² for n=2, odd p, and 1−[3p^(n−1)−p^(n−2)+(−1)^n(p−1)²]/[p^n(p+1)] for n≥3, odd p. The exponent 2−n is essential.

**Sources.** [Ash, Brakenhoff, Zarrabi, Equality of Polynomial and Field Discriminants](https://drive.google.com/uc?export=download&id=1lZ2HQrPDEugaMn1J3ERpqDp9g6C-t6Vd), Proposition 6.4 p.371; Proposition 6.7 and Theorem 6.8 with proof pp.372–373. Correct the table using its generating function and the subsequent combined formula. [Bhargava, Shankar, Wang, Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), §1 pp.1–2, formulas for λ_n(p). The correctly simplified squarefree-discriminant local factor.

**Inputs.** `ArithmeticStatistics:ST.0/monic-local-proportions`, `ArithmeticStatistics:ST.0/stickelberger-binary`.

**Proof plan.** Squarefree residue polynomials give generating series (1−t²/p)/(1−t). A single repeated linear factor, a squarefree complementary factor avoiding it, and a nonvanishing first-order lift give H(t)=(p−1)t²/p² · (1−t²/p)/((1−t)(1+t/p)). Extract coefficients; this yields exponent 2−n, also at n=3. Combine the two strata algebraically.

**API.**

- `nuOneFormula` (data): The corrected valuation-one closed formula.
- `monic_nu_one` (characterisation): The finite count equals the corrected formula.

**Acceptance check.** The monic quartic at p=3 has ν₀=2/3, ν₁=8/81 and λ=62/81; these counts disagree with exponent −n.

### Local monic maximality

<a id="local-maximality"></a>

**Target:** `ArithmeticStatistics:ST.0/local-maximality`. **Declaration:** `MonicPMaximal` (definition).

A monic integral f is p-maximal exactly when it is not contained in the ideal (p², pu, u²) for any monic integral u whose reduction is irreducible over Fp. Equivalently use Dedekind’s gcd(f_corr,g,h)=1 criterion, where g,h lift the distinct-factor product and its complementary multiplicity product. The ideal condition is determined modulo p² and extends to separable products. Its finite coefficient proportion is 1−p^−2 for every n≥2, and 1 for n=0,1. Global independence in ABZ is a heuristic, whereas BSW’s global result uses its tail theorem.

**Sources.** [Ash, Brakenhoff, Zarrabi, Equality of Polynomial and Field Discriminants](https://drive.google.com/uc?export=download&id=1lZ2HQrPDEugaMn1J3ERpqDp9g6C-t6Vd), Lemma 3.1, Corollary 3.2 pp.368–369; Proposition 3.5 pp.369–370. Ideal avoidance and its exact local counting proof.

**Inputs.** `ArithmeticStatistics:ST.0/monic-weighted-height`, `ArithmeticStatistics:ST.1`.

**Downstream use.** BSW I Theorem 1.2 and BSW II Proposition A.2: Use the locally maximal predicate without imposing squarefree discriminant.

**Proof plan.** Define the explicit polynomial ideal obstruction. Count intersections indexed by distinct irreducible factors of total degree d: zero if 2d>n, otherwise p^−3d (Proposition 3.4). Inclusion–exclusion and the polynomial zeta Euler product give (1−t²/p²)/(1−t). Import the order-theoretic interpretation from ST.1.

**API.**

- `pMaximal_modulus` (characterisation): The local predicate depends only on coefficients modulo p².
- `pMaximal_unit_disc` (characterisation): A discriminant not divisible by p forces local maximality.
- `pMaximal_proportion` (characterisation): The exact degree-n local proportion is 1−1/p² for n≥2.

**Unit tests.**

- `pMax_test_linear` (computation): Every linear monic polynomial is p-maximal.
- `pMax_test_nonmaximal` (non-example): x² is not p-maximal.
- `pMax_test_eisenstein` (computation): x²−3 is 3-maximal despite its discriminant being divisible by 3.

### Binary local density formulas

<a id="binary-density-formulas"></a>

**Target:** `ArithmeticStatistics:ST.0/binary-density-formulas`. **Declaration:** `binary_alpha_odd` (theorem).

For n≥2, α₂(2)=1/2 and α_n(2)=3/8 for n≥3. For odd p, α₂(p)=(1−p^−1)(1+p^−1−p^−3), α₃(p)=(1−p^−1)²(1+p^−1)², and α_n(p)=(1−p^−1)²(1+p^−1)(1+p^−1−p^−2) for every n≥4. The density of p-maximal rank-n binary-form rings is β₂(p)=(1−p^−1)(1+p^−1−p^−3) and β_n(p)=(1−p^−2)(1−p^−3) for n≥3, at every prime. The special printed degree-four α formula is replaced by the n≥4 formula.

**Sources.** [Bhargava, Shankar, Wang, Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), Appendix A Propositions A.1–A.2 pp.53–55. Partition of coefficients by the root multiplicity at infinity, with corrected degree-four factor.

**Inputs.** `ArithmeticStatistics:ST.0/binary-local-proportion`, `ArithmeticStatistics:ST.0/monic-density-formulas`, `ArithmeticStatistics:ST.0/local-maximality`, `ArithmeticStatistics:ST.1`.

**Proof plan.** Partition into a₀ unit; a₀∈p,a₁ unit; and a₀,a₁∈p. For odd p their contributions are (1−p^−1)λ_n, p^−1(1−p^−1)λ_{n−1}, and p^−2(1−p^−1)²ν₀(n−2,p). Substitute corrected ν₁; degree zero has ν₀=1. At 2 use the mod-4 restriction and squarefree projective root count. For β, the local order criterion at a root of infinity of multiplicity ≥2 is failure of p²|a₀; sum over its multiplicity.

**API.**

- `binary_alpha_two` (characterisation): The prime-2 density has separate degree-two and degree≥3 cases.

**Acceptance check.** At (n,p)=(4,3), α=176/243; at (4,2), α=3/8. The degree-four odd factor agrees with n≥5 after correction.

**Suggested-file boundary.** The β_n(p) assertion additionally needs ST.1’s rank-n binary-form ring and p-maximal-order predicate; these are not replaced by monic maximality on a leading-zero affine polynomial.

### Acceptable monic local specifications

<a id="kappa-acceptable-specifications"></a>

**Target:** `ArithmeticStatistics:ST.0/kappa-acceptable-specifications`. **Declaration:** `KappaAcceptable` (definition).

Fix n≥1 and κ≥2. A specification consists of a real root stratum and for each prime p a set of monic coefficient residues modulo p^κ. Its p-adic condition is the inverse image of that residue set. It is κ-acceptable when, for all sufficiently large primes, it contains every coefficient tuple with p²∤Δ. Local conditions are imposed by intersection, and the real stratum selects the number of real roots. Finite modification preserves acceptability. Existence of an Euler-product asymptotic requires the ST.2 tail estimate.

**Hypotheses.** κ≥2 so squarefree-discriminant safety is visible in the modulus. Real root strata are supplied by the polynomial root-count API.

**Sources.** [Bhargava, Shankar, Wang, Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), §4 local specifications pp.20–21. Finite-modulus conditions and eventual containment of the squarefree-discriminant locus.

**Inputs.** `ArithmeticStatistics:ST.0/monic-weighted-height`, `ArithmeticStatistics:ST.0/family-defined-by-local-conditions`.

**Downstream use.** BSW I local-specification counting theorem: State local eligibility without embedding the tail theorem in the definition.

**Proof plan.** Use actual residue subsets at each prime. Pull them back along coefficient reduction. The exceptional primes are finite; outside their union both specifications contain the safe locus.

**API.**

- `localSpecificationFamily` (data): The integral family satisfying every local residue condition.
- `kappaAcceptable_univ` (characterisation): The unconstrained specification is acceptable whenever κ≥2.
- `kappaAcceptable_inter` (characterisation): Intersecting two acceptable specifications preserves acceptability.
- `localSpecificationFamily_mono` (characterisation): Enlarging each local specification enlarges the global family.

**Unit tests.**

- `kappa_test_all` (computation): The full degree-two residue family is 2-acceptable.
- `kappa_test_empty` (non-example): An empty specification at every prime is not acceptable, even for linear polynomials.
- `kappa_test_finite_exception` (computation): Imposing an empty condition only at 2 still gives an acceptable specification, although the resulting global family is empty.

### Primitive projective coefficient family

<a id="primitive-hypersurface-family"></a>

**Target:** `ArithmeticStatistics:ST.0/primitive-hypersurface-family`. **Declaration:** `PrimitiveCoefficients` (construction).

Let M=binomial(n+d,d), with the monomial ordering of ST.5. Take nonzero primitive vectors in Z^M (the gcd of all coefficients is 1), modulo a∼−a, and order classes by the Euclidean norm (Σ a_i²)^(1/2). They parametrize equations of degree-d hypersurfaces in fixed P^n. There is no quotient by PGL_(n+1), and singular equations remain in the ambient family. Each class has precisely two primitive vectors; the Euclidean norm descends and is Northcott.

**Sources.** [Browning, Le Boudec, Sawin, The Hasse principle for random Fano hypersurfaces](https://arxiv.org/pdf/2006.02356v1), §1 pp.1–3. Projective coefficient classes, primitive representatives and Euclidean height.

**Inputs.** `ArithmeticStatistics:ST.0/coefficient-box`, `ArithmeticStatistics:ST.5/coefficient-vector-form`, `ArithmeticStatistics:ST.0/arithmetic-family`.

**Downstream use.** BLS Theorems 1.1–1.2: Use the same projective coefficient denominator for both global and local ratios.

**Proof plan.** Use primitive gcd and a nonzero condition, then the two-element sign action. The squared Euclidean norm is a natural Northcott height; taking square roots gives the specified real height. Coordinate bounds prove finiteness; a=−a over Z forces a=0, excluded by primitivity.

**API.**

- `coefficientSignSetoid` (data): Two primitive vectors are equivalent exactly when equal or opposite.
- `HypersurfaceCoefficients` (constructor): The coefficient carrier is the sign quotient.
- `euclideanHeightSq` (data): The squared Euclidean height on integer vectors.
- `euclideanHeightSq_neg` (characterisation): The squared norm is invariant under the sign relation.
- `hypersurfaceHeightSq` (data): The squared height descends to the quotient.
- `hypersurfaceHeight_northcott` (instance): The squared height on classes is Northcott.
- `primitiveSign_fiber` (characterisation): Every coefficient class has two primitive representatives.

**Unit tests.**

- `hypersurface_test_zero` (non-example): The zero vector is not primitive in any dimension.
- `hypersurface_test_norm` (computation): The vector (1,1) has squared Euclidean height 2 and box height 1.
- `hypersurface_test_sign` (computation): Primitive vectors (1,2) and (−1,−2) define one class; (1,2) and (2,1) need not.

### Finite local-solubility coefficient set

<a id="finite-local-hypersurface-set"></a>

**Target:** `ArithmeticStatistics:ST.0/finite-local-hypersurface-set`. **Declaration:** `FiniteLocalCoefficients` (definition).

For Q≥1, let R_M(Q) be ST.5’s primitive coefficient residue vectors. F_loc(Q) consists of a∈R_M(Q) such that for each prime power p^r exactly dividing Q the homogeneous equation f_a has a primitive zero modulo p^r. By CRT this is equivalent to having a primitive zero modulo Q and to ST.5’s σ(a;Q)>0. It is a finite-level condition; it does not alone assert a Qp-point. At Q=1 the primitive condition is vacuous and F_loc is the singleton residue vector.

**Sources.** [Browning, Le Boudec, Sawin, The Hasse principle for random Fano hypersurfaces](https://arxiv.org/pdf/2006.02356v1), Local coefficient set and primitive residue conventions p.55. Finite local sieve uses a positive primitive-root count.

**Inputs.** `ArithmeticStatistics:ST.5/local-density-of-a-form-modulo-q`, `ArithmeticStatistics:ST.5/coefficient-vector-form`.

**Downstream use.** BLS local denominator: Approximate everywhere-local solubility by finite congruence conditions.

**Proof plan.** Import the primitive residue vectors and coefficient-to-form evaluator. Apply CRT to both coefficient and root vectors and to the gcd conditions. Record Q=1 separately.

**API.**

- `finiteLocal_mem` (characterisation): Membership requires both a primitive coefficient vector and a primitive root.
- `finiteLocal_finite` (characterisation): The finite-level family is a finite coefficient set.
- `finiteLocal_positive_count` (characterisation): A primitive-root count is positive exactly on this coefficient set, for primitive a.

**Unit tests.**

- `finiteLocal_test_one` (degenerate): Modulo 1 every tuple is primitive and the equation has a primitive root.
- `finiteLocal_test_no_root` (non-example): The constant polynomial 1 has no root modulo 2.
- `finiteLocal_test_zero_coeff` (computation): The zero coefficient vector modulo 2 is excluded even for an identically zero evaluator.

### Hyperelliptic equation models

<a id="hyperelliptic-model-family"></a>

**Target:** `ArithmeticStatistics:ST.0/hyperelliptic-model-family`. **Declaration:** `HyperellipticModels` (construction).

For g≥1 let the carrier be integral coefficient vectors of degree 2g+2 with Δ≠0, representing z²=f(x,y), ordered by the coefficient maximum. They are models in fixed coordinates, each counted once; there is no quotient by GL₂(Z), rational curve isomorphism or scalar multiplication. Bounded-height finiteness is inherited from the coefficient box. Geometric smoothness and genus g are imported from the hyperelliptic owner.

**Sources.** [Bhargava, Gross, Wang, A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), §1 pp.1–2; §3 p.9. The statistics use integral equations ordered by coefficient maximum.

**Inputs.** `ArithmeticStatistics:ST.0/coefficient-box`, `ArithmeticStatistics:ST.0/binary-discriminant`, `ArithmeticStatistics:ST.1`.

**Downstream use.** BGW Theorems 1–3: Count models when transferring the orbit statistic to equations.

**Proof plan.** Take the nonzero-discriminant subtype. Restrict the box Northcott proof. A coordinate transformation may preserve the curve without identifying elements of this carrier.

**API.**

- `modelHeight` (data): Height is the maximum of the model coefficients.
- `modelHeight_northcott` (instance): Each fixed-genus model family has Northcott height.
- `model_count_le_box` (characterisation): The model count is bounded by its ambient coefficient box.

**Unit tests.**

- `model_test_zero_excluded` (non-example): The zero coefficient vector is excluded.
- `model_test_two_equations` (computation): x⁴+y⁴ and 4x⁴+4y⁴ are distinct integral models of isomorphic curves over Q (z↦2z).
- `model_test_height` (computation): The two models have heights 1 and 4.

### Odd-prime root criterion

<a id="odd-root-criterion"></a>

**Target:** `ArithmeticStatistics:ST.0/odd-root-criterion`. **Declaration:** `odd_root_criterion` (theorem).

For odd p and a monic degree-n integral polynomial, strong p²-divisibility is equivalent to its reduction having either at least two distinct repeated roots over Fp-bar or a root of multiplicity at least three. Among p²-divisible polynomials, weak divisibility means exactly one repeated root, which is an Fp-rational double root. For binary forms use projective roots, including infinity. The zero reduction is handled separately as strongly divisible for degree at least two. At p=2 this root criterion is not asserted.

**Hypotheses.** p odd; monic case has full degree. Nonzero binary reduction for the projective factorization statement.

**Sources.** [Bhargava, Shankar, Wang, Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), §1.1 p.4 and Proposition 2.2 p.5. Odd-prime factorization criterion and weak-locus coordinate shape. [Bhargava, Shankar, Wang, Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf), §1 pp.2–3. Binary analogue uses projective roots.

**Inputs.** `ArithmeticStatistics:ST.0/strong-weak-discriminant`, `ArithmeticStatistics:ST.1`.

**Proof plan.** Factor over the residue algebraic closure and apply the discriminant-product formula. The codimension-two singular locus is the two-double-root/triple-root locus. The unique double root is Frobenius fixed. Translation to that root makes the last two coefficients divisible by p and p², respectively.

**Acceptance check.** x²+9 is weak at 3, x³ is strong at 3, and x² is strong at 2 despite its single double root; this detects the odd-prime restriction.

**Suggested-file boundary.** Requires the ST.1 fixed-degree projective root-multiplicity and representation API, absent from the pinned library. No affine substitute is proposed.

### Source-specific density denominators

<a id="density-denominator-comparisons"></a>

**Target:** `ArithmeticStatistics:ST.0/density-denominator-comparisons`. **Declaration:** `ratio_denominator_test` (comparison).

Skorobogatov–Sofos relative coefficient density is computed inside the stated degree-pattern ambient coefficient family, with both numerator and denominator intersected with that family and the same box cutoff. BLS global and everywhere-local ratios both divide by all projective coefficient classes, so the conditional ratio global/local is their quotient only when the local density is positive. A density-one statement inside a positive-density subfamily transfers by the parent density tower; no conclusion is justified from a zero-density denominator.

**Hypotheses.** No transfer across a zero-density denominator.

**Sources.** [Skorobogatov, Sofos, Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Published §1, height conventions and Theorems 1.1–1.2 pp.674–675. Relative density uses the constrained coefficient family. [Browning, Le Boudec, Sawin, The Hasse principle for random Fano hypersurfaces](https://arxiv.org/pdf/2006.02356v1), §1 pp.1–3. Global and local fractions use the same full denominator.

**Inputs.** `ArithmeticStatistics:ST.0/relative-density`, `ArithmeticStatistics:ST.0/relative-density-is-multiplicative-in-towers`, `ArithmeticStatistics:ST.0/density-one-restricts-to-subfamilies-of-positive-lower-density`, `ArithmeticStatistics:ST.0/primitive-hypersurface-family`.

**Proof plan.** Identify both finite counting carriers with the parent family. Write the finite identity N(S∩T)/N(U)=[N(S∩T)/N(T)]·[N(T)/N(U)] when N(T)>0. Positivity of its limiting relative density makes this denominator eventually nonzero.

**Unit tests.**

- `density_test_relative` (computation): A numerator of 30 inside a constrained family of 40 has relative density 3/4, rather than 3/10 in a larger family of 100.
- `density_test_local` (computation): If global and local counts are 3 and 4 among 10 ambient classes, the conditional global fraction is 3/4.
- `density_test_empty` (degenerate): Finite ratios with an empty denominator are assigned zero, never one.

### Stevenhagen radicand family

<a id="negative-pell-radicands"></a>

**Target:** `ArithmeticStatistics:ST.0/negative-pell-radicands`. **Declaration:** `PellRadicand` (construction).

Let D be the positive squarefree integers all of whose prime factors are either 2 or 1 modulo 4. D(X) uses d≤X. The unit 1 belongs to this radicand carrier; a quadratic-field subfamily excludes it explicitly. The negative-Pell subset consists of d with integers x,y solving x²−dy²=−1. A radicand and its quadratic-field discriminant are not one constant multiple throughout D: disc=d for d≡1 mod4 and 4d otherwise.

**Sources.** [Koymans, Pagano, On Stevenhagen's conjecture](https://arxiv.org/pdf/2201.13424v1), §1 pp.1–2. The radicand family, truncation and soluble negative-Pell subfamily.

**Inputs.** `ArithmeticStatistics:ST.0/positive-squarefree-family-over-q`, `ArithmeticStatistics:ST.0/piecewise-rescaling-of-a-height`.

**Downstream use.** KP Theorem 1.1: Choose the radicand denominator; prior bounds and the density theorem stay in ST.5.

**Proof plan.** Restrict the squarefree Northcott carrier by the prime-factor condition. Define the soluble subset by the integral equation. Partition into odd and even radicands before converting to discriminant order; invoke the parent piecewise-rescaling theorem only with its sector-density hypotheses.

**API.**

- `NegativePellSoluble` (data): The soluble subset uses an actual integral solution.
- `pellRadicand_finite` (characterisation): At every cutoff only finitely many radicands occur.
- `quadraticRadicandDisc` (data): The positive fundamental discriminant on this squarefree family.
- `pell_no_three_mod_four` (characterisation): No prime 3 modulo 4 divides an admitted radicand.

**Unit tests.**

- `pell_test_admitted` (computation): 1,2,5,10 all belong to the radicand family.
- `pell_test_rejected` (non-example): 3 and 6 are excluded.
- `pell_test_ordering` (computation): Radicands 2 and 5 have discriminants 8 and 5.

### Number-field permutation-type adapter

<a id="field-permutation-type"></a>

**Target:** `ArithmeticStatistics:ST.0/field-permutation-type`. **Declaration:** `HasPermutationType` (construction).

For a degree-n number field K, the normal closure acts on Hom_Q(K,Qbar), an n-element set. Choose a labeling with Fin n and compare the image subgroup to Γ≤S_n up to conjugation. This predicate descends to Q-isomorphism classes and is independent of the labeling. It supplies the missing Galois restriction in the parent field-counting function. The restriction on a fixed resolvent F is an additional ST.3 predicate, not equality of abstract groups.

**Sources.** [Melanie Matchett Wood, Nonabelian Cohen–Lenstra moments](https://par.nsf.gov/servlets/purl/10152050), §2 pp.383–384. Normal-closure actions must retain the embedding and its image. [Bhargava, Shankar, Wang, Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), §1 pp.2–3. S_n field families use the action on embeddings. [Bhargava, Shankar, Taniguchi, Thorne, Tsimerman, Zhao, Bounds on 2-torsion in class groups of number fields and integral points on elliptic curves](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf), §1 pp.1–3, N_n(G,X) and fixed-resolvent notation. The restriction uses the normal-closure permutation group.

**Inputs.** `ArithmeticStatistics:ST.0/number-fields-ordered-by-discriminant`, `ArithmeticStatistics:ST.3/number-field-counting-function`, `tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-2-the-dictionary-between-galois-theory-and-permutations`.

**Downstream use.** BSTTTZ §1 N_n(G,X) and N_n(G,F,X): Attach a conjugacy-invariant predicate to the existing discriminant family.

**Proof plan.** Import the normal-closure permutation representation; compare its image under a labeling via subgroup conjugacy. Changing the labeling conjugates the image. An isomorphism of fields induces an equivariant bijection of embedding sets. Restrict the existing Hermite-finite carrier.

**API.**

- `permutationType_self` (characterisation): Every representation has its own image type.
- `permutationType_relabel` (characterisation): Conjugating a representation preserves its permutation type.
- `permutationType_card` (characterisation): The conjugate image and target subgroup have the same cardinality.

**Unit tests.**

- `type_test_full_two` (computation): The identity permutation representation has full S₂ type.
- `type_test_trivial_not_full` (non-example): The trivial permutation representation does not have full S₂ type.
- `type_test_one` (degenerate): In degree one the full and trivial subgroups coincide.

**Binding still needed.** HasPermutationType is fully typed; binding ρ to the degree-n normal-closure action awaits the imported PolynomialGaloisGroups layer. No new generic Galois representation is planned.

### General number-field twist denominator

<a id="twist-denominator-frontier"></a>

**Target:** `ArithmeticStatistics:ST.0/twist-denominator-frontier`. **Declaration:** `twist_denominator_frontier` (theorem).

For a number field F, the parent squareclass height H(t)=product of norms of finite primes with odd valuation has finite fibers. For a nonempty admissible finite set of local conditions Σ, one needs #Σ(X)=c_(F,Σ) X+o(X), c_(F,Σ)>0, where each squareclass is counted once. Admissible means local conditions are compatible with global squareclasses, not merely that each local set is individually nonempty. Its ideal-counting proof must distinguish classes modulo Cl(F)² and the finite unit/Selmer fibers. This precise input is an open supplier frontier; it is not obtained from Northcott finiteness.

**Sources.** [Bhargava, Klagsbrun, Lemke Oliver, Shnidman, 3-isogeny Selmer groups and ranks of abelian varieties in quadratic twist families over a number field](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf), §2 p.2, squareclass height and Σ(X). General-number-field twist ordering and its denominator.

**Inputs.** `ArithmeticStatistics:ST.0/squareclass-height`, `ArithmeticStatistics:ST.0/finiteness-of-squareclasses-of-bounded-height`, `AnalyticNumberTheory:AN.4`.

**Proof plan.** Expand squarefree ideals in each ray class and use finite-order Hecke characters to select compatible classes. Count unit/Selmer fibers and local squareclass conditions explicitly. Analytic continuation and a Tauberian/ideal equidistribution theorem must produce the residue and its strict positivity. These analytic statements are requested from AN.4, rather than asserted as already supplied.

**Acceptance check.** Over Q with no local restriction the positive squarefree denominator is (6/π²)X+o(X). Compatibility and residue positivity, rather than mere local nonemptiness, must be established for general F.

**Suggested-file boundary.** The global squareclass family and local-condition supplier types are not yet library declarations; the exact asymptotic is a recorded gap, not a dummy Lean proposition.

### Unweighted finite-field abelian-variety count

<a id="unpolarized-abelian-count"></a>

**Target:** `ArithmeticStatistics:ST.0/unpolarized-abelian-count`. **Declaration:** `abelianIsoSetoid` (construction).

For a finite field k and g≥0, B(k,g) counts k-isomorphism classes of dimension-g abelian varieties, once per class. Use the native Tau Ceti category and dimension; do not count geometric classes, isogeny classes or 1/Aut stack mass. Finiteness is imported from the finite-field arithmetic-moduli classification.

**Sources.** [Lipnowski, Tsimerman, How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1), §1 pp.1–3. B(p,g) is the unweighted class count.

**Inputs.** `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`, `AbelianSchemesAndArithmeticModuliPartII:F3`.

**Downstream use.** LT Theorem 0.1; arithmetic-moduli Part II F.6: Supply the unpolarized denominator without a mass weighting.

**Proof plan.** Restrict the native category by dimension and quotient by categorical isomorphism. Import finite-field classification to obtain finiteness before interpreting Nat.card as a counting function. The dimension-zero variety is the identity object.

**API.**

- `UnpolarizedClasses` (constructor): Native dimension-g abelian varieties modulo k-isomorphism.
- `unpolarizedCount` (data): The unweighted number of classes, used only with the finite-field finiteness theorem.
- `unpolarizedClasses_finite` (instance): Over a finite field the class carrier is finite.
- `unpolarized_iso` (characterisation): Two representatives have the same class precisely when k-isomorphic.

**Unit tests.**

- `abelian_test_zero_dim` (degenerate): There is one dimension-zero abelian-variety class over a finite field.
- `abelian_test_iso` (compatibility): Isomorphic representatives contribute one class.
- `abelian_test_mass_distinction` (non-example): An object with two automorphisms contributes 1 to the class count but 1/2 to the mass.

### Principally polarized class count

<a id="principally-polarized-count"></a>

**Target:** `ArithmeticStatistics:ST.0/principally-polarized-count`. **Declaration:** `principally_polarized_count` (construction).

A(k,g) is the number of k-isomorphism classes of pairs (A,λ), with A a dimension-g abelian variety and λ a principal polarization defined over k. An isomorphism f identifies the pairs when f∨ λ′ f=λ. Polarization means the ample line-bundle-induced symmetric isogeny, with the descent convention of AbelianSchemes; its native type is imported. This is an unweighted count, not the coarse moduli space k-point count or inverse-automorphism mass.

**Sources.** [Lipnowski, Tsimerman, How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1), §1 pp.1–3; Proposition 4.11 p.20. The statistic counts polarized pairs, not polarizations without the automorphism quotient.

**Inputs.** `AbelianSchemesAndArithmeticModuli:A2`, `PELModuli:M6`, `ArithmeticStatistics:ST.0/unpolarized-abelian-count`.

**Downstream use.** LT polarized-growth comparison: Compare A(k,g) with B(k,g) without changing weights.

**Proof plan.** Use the imported principal-polarization type and pair-isomorphism relation. Prove the forgetful fiber is the Aut(A)-orbit set of principal polarizations. Import finiteness from the arithmetic-moduli classification, then count.

**API.**

- `ppavClasses` (characterisation): The type of k-isomorphism classes of dimension-g principally polarized pairs.
- `ppavCount` (characterisation): Nat.card of ppavClasses, after the finite-field finiteness input.
- `ppav_forget` (characterisation): Forget λ to the unpolarized class.
- `ppavCount_fiber_sum` (characterisation): A(k,g)=Σ_[A] # (principal polarizations of A modulo Aut_k(A)).

**Unit tests.**

- `ppav_test_zero_dim` (degenerate): A(k,0)=1.
- `ppav_test_elliptic` (compatibility): A(k,1)=B(k,1): elliptic curves have a canonical principal polarization.
- `ppav_test_mass` (non-example): For a principally polarized elliptic curve with automorphism group of order 2, its class contributes 1 and its mass contributes 1/2.

**Suggested-file boundary.** The pinned abelian-variety category has no native dual/principal-polarization type. Every name below is explicitly omitted until A.2/M.6 supplies that geometric type; no opaque Prop polarization predicate is declared.

### Principal-polarization fiber

<a id="polarization-fiber-count"></a>

**Target:** `ArithmeticStatistics:ST.0/polarization-fiber-count`. **Declaration:** `polarizationOrbitCount` (construction).

For a fixed abelian variety A/k, the fiber of the forgetful class map consists of Aut_k(A)-orbits of principal polarizations, acting by λ↦u∨λu. The orbit set may be finite although Aut_k(A) is infinite. Given λ₀, Proposition 4.11 identifies it with Rosati-conjugacy orbits of integral symmetric ample automorphisms. The geometry belongs to AbelianSchemes/PELModuli; hermitian or integral-lattice classifications are imported from IntegralLattices, never redeveloped here.

**Sources.** [Lipnowski, Tsimerman, How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1), Proposition 4.11, Examples 4.12–4.13 p.20. Polarization fiber is an orbit set, with automorphism action rather than raw polarization count.

**Inputs.** `ArithmeticStatistics:ST.0/principally-polarized-count`, `AbelianSchemesAndArithmeticModuliPartII:F5`, `AbelianSchemesAndArithmeticModuli:A2`, `mathlib:MulAction.orbitRel`.

**Downstream use.** LT comparison of polarizations on A: Make the fiber multiplicity explicit instead of using 1/Nat.card Aut(A).

**Proof plan.** Use transport of λ along an isomorphism from a fixed representative. Two transports differ by Aut_k(A), giving the fiber-orbit bijection. The finite orbit-set cardinality is appropriate even if the acting group is infinite.

**API.**

- `polarizationOrbitCount_empty` (characterisation): An empty polarization type has zero orbits.
- `polarizationOrbitCount_single` (characterisation): A singleton polarization type has one orbit.
- `polarizationOrbitCount_finite` (characterisation): For a finite polarization carrier, orbit count is at most its cardinality.

**Unit tests.**

- `pol_test_empty` (degenerate): An abelian variety with no principal polarization has empty fiber.
- `pol_test_unique` (computation): A single canonical principal polarization gives one orbit.
- `pol_test_infinite_group` (non-example): The orbit-set count is meaningful for an infinite automorphism group with a singleton carrier; no inverse group cardinal is involved.

**Binding still needed.** Pol and its actual Aut(A) action are inputs supplied by A.2/F.5. The generic orbit adapter elaborates; it makes no claim that arbitrary actions are polarizations.

### Natural bundle probability law

<a id="natural-bundle-law"></a>

**Target:** `ArithmeticStatistics:ST.0/natural-bundle-law`. **Declaration:** `bundleMass` (definition).

Over F_q, q>1, normalized rank-two bundle classes on P¹ modulo tensoring by line bundles are indexed by ν=|a−b|. Their natural inverse-automorphism probability is μ_q(0)=(q−1)/(2q), and μ_q(n)=(q²−1)/(2q^(n+1)) for n≥1. Each parity has mass 1/2. The GL₂ automorphism orders are (q²−1)(q²−q) at n=0 and (q−1)²q^(n+1) at n>0; their inverse masses have total 2/((q−1)³(q+1)), while the PGL₂ weights have total 2/((q−1)²(q+1)). Scalar automorphisms cancel in the passage to PGL₂.

**Hypotheses.** q>1; the geometric interpretation requires q the order of a finite field.

**Sources.** [Shende, Tsimerman, Equidistribution in Bun₂(P¹)](https://arxiv.org/pdf/1307.8237v1), §4, bundle measure display pp.29–30. Normalized bundle weights and automorphism convention.

**Inputs.** `ArithmeticStatistics:ST.0/stabilizer-weighted-orbit-count`, `ArithmeticStatistics:ST.0/weighted-and-unweighted-orbit-counts`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`.

**Downstream use.** ST joint equidistribution formulation: Provide the marginal target law with its correct normalization.

**Proof plan.** Import Grothendieck splitting of bundles on P¹ and compute upper-triangular bundle automorphisms: n+1 global sections in the off-diagonal entry for n>0. Sum the geometric series, retaining the exceptional balanced bundle. The scalar quotient rescales all inverse masses by one common factor.

**API.**

- `bundleLaw` (constructor): The mass function defines a probability mass function for q>1.
- `bundleMass_nonneg` (characterisation): All masses are nonnegative.
- `bundleMass_sum` (characterisation): The total mass is one.
- `bundleMass_parity` (characterisation): Even and odd classes each carry half the mass.
- `bundleAutOrder` (data): The natural automorphism order has a separate balanced-bundle case.
- `bundleAutOrder_inverse_sum` (characterisation): For q>1, the GL₂ inverse-automorphism weights sum to 2/((q−1)³(q+1)); the PGL₂ sum has one fewer factor q−1.
- `bundleMass_from_aut` (compatibility): Dividing the GL₂ inverse-automorphism weight by its total gives the stated probability.

**Unit tests.**

- `bundle_test_zero` (computation): At q=3 the balanced bundle has mass 1/3.
- `bundle_test_one` (computation): At q=3 the next two masses are 4/9 and 4/27.
- `bundle_test_aut` (computation): At q=3 the balanced and first unbalanced GL₂ automorphism orders are 48 and 36.
- `bundle_test_normalization` (computation): At q=3, the total GL₂ inverse-automorphism weight is 1/16.

### Exact bundle parity tails

<a id="bundle-parity-tails"></a>

**Target:** `ArithmeticStatistics:ST.0/bundle-parity-tails`. **Declaration:** `bundle_parity_tail` (theorem).

For d≥1, μ_q({d,d+2,d+4,…})=1/(2q^(d−1)); the even tail starting at d=0 has mass 1/2. Consequently μ_q({a+1,a+3,…})=1/(2q^a) for a≥0. The d=0 exception is required by the balanced-bundle weight.

**Sources.** [Shende, Tsimerman, Equidistribution in Bun₂(P¹)](https://arxiv.org/pdf/1307.8237v1), §4 tail display pp.29–30. Parity-tail geometric series, with the balanced term separated.

**Inputs.** `ArithmeticStatistics:ST.0/natural-bundle-law`.

**Proof plan.** Sum the unbalanced geometric series with common ratio q^−2. At d=0 add the exceptional n=0 term to the positive even tail.

**Acceptance check.** At q=3 the tail {1,3,…} has mass 1/2, the tail {2,4,…} has mass 1/6, and the even tail starting at 0 has mass 1/2.

### Picard quotient by the hyperelliptic pencil

<a id="finite-picard-quotient"></a>

**Target:** `ArithmeticStatistics:ST.0/finite-picard-quotient`. **Declaration:** `PicQuotient` (construction).

For a smooth geometrically connected hyperelliptic C/F_q, let κ be its degree-two pencil and P=Pic(C) of rational line bundles. Q=P/Zκ has two parity sectors. Over a finite field Pic¹(C)(F_q) is nonempty by Lang’s theorem on its Jacobian torsor and Brauer obstruction vanishing, even when C(F_q) is empty. Thus deg:P→Z is onto, Pic⁰(C)=J(F_q) is finite of size h, and Q is finite of size 2h. Uniform probability on Q assigns 1/(2h) per class; conditioning on either parity assigns 1/h.

**Sources.** [Shende, Tsimerman, Equidistribution in Bun₂(P¹)](https://arxiv.org/pdf/1307.8237v1), §4 Picard quotient and probability discussion pp.30–32. Finite quotient, parity and the Jacobian denominator.

**Inputs.** `SchemeAndStackFoundations:SF.3/picard-brauer-sequence`, `SchemeAndStackFoundations:SF.3/degree-zero-class-comparison`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `mathlib:QuotientGroup.lift`.

**Downstream use.** ST joint pushforward: The probability space for one or two bundle invariants is Q, with both parities.

**Proof plan.** Use the rational Picard-to-line-bundle comparison over a finite field. Apply Lang to Pic¹, not existence of a rational curve point. Abstractly, for an additive group P with onto degree map and deg κ=2, each parity sector is a Pic⁰ torsor, giving the cardinality 2h.

**API.**

- `picClass` (constructor): The canonical class map into the quotient.
- `picParity` (data): Degree modulo 2 descends to the quotient.
- `picQuotient_finite` (instance): Surjective degree and finite degree-zero kernel make Q finite.
- `picQuotient_card` (characterisation): The quotient has twice the degree-zero cardinality.
- `picParity_class` (characterisation): The parity of a class is degree modulo 2.

**Unit tests.**

- `pic_test_degree_two` (computation): For P=Z, degree=id and κ=2 the quotient has two elements.
- `pic_test_parity` (computation): Degree 0 and degree 1 remain distinct in the quotient.
- `pic_test_tensor` (compatibility): Tensoring by the pencil preserves a class.

### Picard parity representatives and carry

<a id="picard-representatives-and-carry"></a>

**Target:** `ArithmeticStatistics:ST.0/picard-representatives-and-carry`. **Declaration:** `pic_unique_representative` (theorem).

Each class of Q has a unique representative of degree r∈{0,1}: L−((deg L−r)/2)κ. Choosing D₀ of degree one identifies Q as a set with Pic⁰×{0,1}. If c=κ−2D₀, addition is (x,r)+(y,s)=(x+y−floor((r+s)/2)c,(r+s) mod2). This need not be a direct-product group decomposition; c must be divisible by 2 in Pic⁰ for such a split after changing D₀.

**Sources.** [Shende, Tsimerman, Equidistribution in Bun₂(P¹)](https://arxiv.org/pdf/1307.8237v1), §4 pp.30–32, Picard quotient construction. Degree normalization supplies representatives; carry follows from the same quotient.

**Inputs.** `ArithmeticStatistics:ST.0/finite-picard-quotient`.

**Proof plan.** Subtract an integer multiple of κ to normalize degree. Uniqueness follows by comparing degrees of two representatives differing by mκ. Express their sum in normalized coordinates: replace 2D₀ with κ−c. The resulting carry has a minus sign.

**API.**

- `pic_carry` (characterisation): Two odd representatives create the carry −c.

**Unit tests.**

- `carry_test_nonsplit` (non-example): In P=Z×Z/2 with κ=(2,1), the parity-one class has order four: Q is not the direct product of its two order-two sectors.

### Joint bundle pushforward from the Picard quotient

<a id="finite-joint-bundle-mass"></a>

**Target:** `ArithmeticStatistics:ST.0/finite-joint-bundle-mass`. **Declaration:** `jointFiberMass` (definition).

Given the two quotient-invariant bundle indices ν(L⊗M₁) and ν(L⊗M₂), push the uniform law on Q to N×N. Its mass at (i,j) is the fiber cardinality divided by 2h, not h. Uniform translation makes it depend on M₂−M₁. The ratio and inverse-line-bundle conventions used in theta intersections must be compared using the hyperelliptic involution identity σL=(deg L)κ−L and invariance of the pushforward under σ; replacing only the second factor by inversion is not a general property of joint measures.

**Sources.** [Shende, Tsimerman, Equidistribution in Bun₂(P¹)](https://arxiv.org/pdf/1307.8237v1), §4 joint distribution and theta intersection formulas pp.30–33. Joint pushforward, its parity support and normalization.

**Inputs.** `ArithmeticStatistics:ST.0/finite-picard-quotient`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`.

**Downstream use.** ST mixing conjecture: State the finite measure before its asymptotics.

**Proof plan.** Use finite uniform counting on Q. Translate the common variable by M₁. Import the involution relation and bundle-index invariance for the ratio/inverse convention comparison. Each marginal is the corresponding uniform bundle pushforward.

**API.**

- `jointFiberMass_nonneg` (characterisation): Joint masses are nonnegative.
- `jointFiberMass_equiv` (functoriality): Relabeling the uniform source by a bijection preserves the joint law.
- `jointFiberMass_no_fiber` (characterisation): An empty fiber has zero mass.
- `jointFiberMass_total` (characterisation): For a nonempty finite source the sum of the masses is one.

**Unit tests.**

- `joint_test_diagonal` (computation): Uniform Fin 2 pushed forward diagonally gives mass 1/2 at (0,0).
- `joint_test_empty_cell` (non-example): The same diagonal law has zero mass at (0,1).
- `joint_test_not_half_changed` (computation): A constant pair pushed from two source classes has mass 1, not 2; the denominator includes both classes.

### Theta tail event bijections

<a id="theta-tail-normalization"></a>

**Target:** `ArithmeticStatistics:ST.0/theta-tail-normalization`. **Declaration:** `theta_tail_normalization` (theorem).

Let h=#J(F_q). For a≥0, the event ν(L)∈a+1+2N in uniform Q has probability #Θ_(g−a)(F_q)/(2h), with Θ_d empty for d<0. For a,b≥0, write d₁=g−a,d₂=g−b. If deg M and d₁+d₂ have different parity the joint event for ν(L),ν(M⊗L^−1) is empty. Otherwise set M′=M⊗κ^((d₁+d₂−deg M)/2); the event is in bijection with Θ_d₁ ∩ (M′−Θ_d₂), and its probability is that intersection count divided by 2h. Conditional on its parity sector the denominator is h.

**Sources.** [Shende, Tsimerman, Equidistribution in Bun₂(P¹)](https://arxiv.org/pdf/1307.8237v1), §4 pp.30–33, single and joint theta-tail displays. Tail events correspond to effective divisor classes of the required degrees; unconditional probability requires both parity sectors.

**Inputs.** `ArithmeticStatistics:ST.0/finite-joint-bundle-mass`, `ArithmeticStatistics:ST.0/picard-representatives-and-carry`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`.

**Proof plan.** For a split pushforward O(u)⊕O(v), use u+v=deg L−g−1 and h⁰(C,L)=h⁰(P¹,π_*L). Normalize the degree by κ to d=g−a. A nonzero section is equivalent to membership in Θ_d. Repeat for M⊗L^−1; degree parity determines whether simultaneous normalization is possible. Count distinct rational line-bundle classes, not individual divisors or sections.

**Acceptance check.** In the pointless genus-two F₃ example, Θ₀ contributes 1/8 to the unconditional ν≥3 odd tail, while its conditional odd-sector probability is 1/4.

**Suggested-file boundary.** The theta loci, geometric pushforward and splitting index are absent at the pin. Both event bijections remain typed geometric supplier work; the finite jointFiberMass denominator is already stated without any substitute cohomology predicates.

### Parity-compatible product probability

<a id="parity-product-candidate"></a>

**Target:** `ArithmeticStatistics:ST.0/parity-product-candidate`. **Declaration:** `parityProductMass` (definition).

Let δ be the parity of deg(M₂−M₁). Define μ_r(n)=2μ_q(n) when n≡r mod2 and 0 otherwise. The candidate joint law is 1/2[μ₀⊗μ_δ+μ₁⊗μ_(1+δ)]. Equivalently its mass is 2μ_q(i)μ_q(j) when i+j≡δ and zero otherwise. It has both marginals μ_q and total mass 1. This construction states the candidate only; equidistribution and its hypotheses are ST.5/geometry results, not part of its definition.

**Sources.** [Shende, Tsimerman, Equidistribution in Bun₂(P¹)](https://arxiv.org/pdf/1307.8237v1), §4 pp.31–33, parity-conditioned limit alternatives. Product law conditioned on the allowed parity pairs.

**Inputs.** `ArithmeticStatistics:ST.0/natural-bundle-law`, `ArithmeticStatistics:ST.0/bundle-parity-tails`.

**Downstream use.** ST mixing conjecture: Fix the proposed limiting measure before proving or assuming convergence.

**Proof plan.** Use the half-mass parity sectors. Normalize each conditional marginal by 2, and average the two allowed sector products with coefficient 1/2.

**API.**

- `parityProduct_support` (characterisation): Incompatible parity has zero mass.
- `parityProduct_marginal` (characterisation): Each first-coordinate marginal is the natural bundle law.
- `parityProduct_total` (characterisation): The joint mass sums to one.

**Unit tests.**

- `parity_test_same` (computation): At q=3 and δ=0 the (0,0) mass is 2/9.
- `parity_test_opposite` (computation): At q=3 and δ=1 the (0,1) mass is 8/27.
- `parity_test_forbidden` (non-example): The (0,0) mass vanishes for δ=1.

### Hecke probability as a weighted pushforward

<a id="hecke-pushforward"></a>

**Target:** `ArithmeticStatistics:ST.0/hecke-pushforward`. **Declaration:** `heckePairPushforward` (construction).

For effective D on P¹ let g_D be the corresponding adelic diagonal translation. Push the normalized invariant finite-volume probability on X=PGL₂(F)\PGL₂(A) through x↦(xK,xg_DK). This is μ_D on the pair of bundle classes. Its marginals are the natural inverse-automorphism law. Uniformly choosing neighboring isomorphism classes does not generally give this law: multiplicities and stabilizers must remain in the pushforward.

**Sources.** [Shende, Tsimerman, Equidistribution in Bun₂(P¹)](https://arxiv.org/pdf/1307.8237v1), §5 Hecke correspondence and measure discussion pp.38,40. The Hecke measure is induced by invariant adelic probability.

**Inputs.** `ArithmeticStatistics:ST.0/natural-bundle-law`, `ArithmeticStatistics:ST.0/stabilizer-weighted-orbit-count`, `AdelicAlgebraicGroups:AA.2`, `mathlib:MeasureTheory.Measure.map`.

**Downstream use.** ST special-correspondence alternative: Distinguish a correspondence law from a product law.

**Proof plan.** Use the actual adelic quotient and its normalized Haar-derived measure from the geometric/adelic supplier. Measurable quotient maps define the pushforward; right-translation invariance gives the second marginal.

**API.**

- `heckePairPushforward_marginal` (characterisation): The first marginal of a measurable pair map is its first pushforward.
- `heckePairPushforward_probability` (instance): A measurable pair pushforward of a probability is a probability.
- `heckePairPushforward_dirac` (characterisation): A point mass maps to the corresponding pair point mass.

**Unit tests.**

- `hecke_test_diagonal` (degenerate): Identity translation gives a diagonal measure.
- `hecke_test_one_point` (computation): A constant correspondence pushes every point to its constant pair.
- `hecke_test_asymmetric` (non-example): Different constant coordinate maps produce an off-diagonal point, not an independent product assumption.

**Binding still needed.** The generic measurable pushforward is typed against Mathlib. The normalized adelic source, g_D and bundle quotient maps are geometric inputs, not freshly planned adelic objects.

### Pointless genus-two bundle regression

<a id="pointless-curve-regression"></a>

**Target:** `ArithmeticStatistics:ST.0/pointless-curve-regression`. **Declaration:** `pointless_curve_regression` (theorem).

For C/F₃ given by y²=2((x³−x)²+1), the smooth projective curve has genus 2, no F₃-points, fourteen F₉-points and #J(F₃)=4. Consequently Q has eight elements. Its exact bundle pushforward has μ_C(0)=1/2, μ_C(1)=3/8, μ_C(3)=1/8 and all other masses zero. This is a finite regression example, not the limiting natural μ₃. It detects both a spurious rational-point assumption on Pic¹ and a denominator h in place of 2h.

**Sources.** [Shende, Tsimerman, Equidistribution in Bun₂(P¹)](https://arxiv.org/pdf/1307.8237v1), §4 Picard and theta normalization pp.30–33. Finite test of the quotient and tail formulas; this example is derived here, rather than asserted in the paper.

**Inputs.** `ArithmeticStatistics:ST.0/theta-tail-normalization`, `ArithmeticStatistics:ST.0/finite-picard-quotient`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`.

**Proof plan.** For the convention P(t)=1+a₁t+a₂t²+3a₁t³+9t⁴, a₁=N₁−4=−4 and a₂=(a₁²+N₂−10)/2=10. Thus P(t)=1−4t+10t²−12t³+9t⁴ and P(1)=4. Θ₀ is a singleton and Θ₁ has no rational points; the one-tail formula and parity masses give ν=0,1,3.

**Acceptance check.** A finite F₃/F₉ enumeration gives N₁=0,N₂=14 and the genus-two zeta arithmetic gives h=4,Q=8. The exact bundle masses sum to one.

**Suggested-file boundary.** The concrete smooth-projective curve, its Jacobian and bundle pushforward are not native at the pin. The source-independent finite-field count and derived zeta arithmetic are recorded in the reader and verified separately.

### Outside involutions in a wreath type

<a id="wood-outside-involutions"></a>

**Target:** `ArithmeticStatistics:ST.0/wood-outside-involutions`. **Declaration:** `OutsideInvolution` (definition).

Use the already built Tau Ceti wreath product W=G≀S₂ with its coordinate-permutation action. For H≤W define c(H)={w∈H : w²=1 and its top permutation is nontrivial}. These elements have exact order two. The canonical swap is (1,swap). Conjugacy means conjugacy by H, not by the ambient W.

**Sources.** [Melanie Matchett Wood, Nonabelian Cohen–Lenstra moments](https://par.nsf.gov/servlets/purl/10152050), §1 p.378; §2 p.383. Outside order-two elements and the top projection.

**Inputs.** `tauceti:TauCeti.WreathProduct`, `tauceti:TauCeti.WreathProduct.map`.

**Downstream use.** Wood admissibility and real twists: Select the possible quadratic inertia images without constructing another wreath product.

**Proof plan.** Reuse WreathProduct and its projections, multiplication and functorial map. Nontrivial top projection excludes the identity. The canonical swap has order two.

**API.**

- `canonicalSwap` (constructor): The wreath element with trivial base and transposed coordinates.
- `outside_ne_one` (characterisation): An outside involution is not the identity.
- `outside_conjugate` (characterisation): Conjugating by H preserves the outside-involution set.
- `outside_finite` (instance): For finite G the outside set is finite.

**Unit tests.**

- `outside_test_swap` (computation): The canonical swap is an outside involution in the full wreath group.
- `outside_test_identity` (non-example): The identity is excluded even though its square is one.
- `outside_test_trivial_G` (degenerate): When G is trivial, the full wreath group has one outside involution.

### Admissible wreath subgroup

<a id="wood-admissible-type"></a>

**Target:** `ArithmeticStatistics:ST.0/wood-admissible-type`. **Declaration:** `AdmissibleType` (definition).

For a finite G, H≤G≀S₂ is admissible if it contains the canonical swap, is generated by its outside involutions, and the first-coordinate projection of ker(H→S₂) is onto G. All three conditions are required. Types are embedded subgroups, not abstract isomorphism classes.

**Sources.** [Melanie Matchett Wood, Nonabelian Cohen–Lenstra moments](https://par.nsf.gov/servlets/purl/10152050), §1 p.378; §2.2 Proposition 2.2 pp.386–387. The admissibility conditions forced by an unramified extension over a quadratic base.

**Inputs.** `ArithmeticStatistics:ST.0/wood-outside-involutions`.

**Downstream use.** Wood Theorems 1.1–1.2: Restrict the allowable embedded normal-closure types.

**Proof plan.** Express generation as subgroup closure of the outside set, and the coordinate condition by elements of the top kernel. This definition uses the existing wreath structure.

**API.**

- `admissible_outside_nonempty` (characterisation): Admissibility guarantees at least one outside involution.
- `admissible_coordinate_surjective` (characterisation): The top-kernel first coordinate is onto G.
- `admissible_generated` (characterisation): The outside involutions generate exactly H.

**Unit tests.**

- `admissible_test_trivial` (computation): For trivial G, the full S₂ wreath group is admissible.
- `admissible_test_bottom` (non-example): The identity subgroup is not admissible.
- `admissible_test_swap_only` (non-example): For nontrivial G the subgroup generated only by the canonical swap fails the coordinate condition.

### Good embedded type

<a id="wood-good-type"></a>

**Target:** `ArithmeticStatistics:ST.0/wood-good-type`. **Declaration:** `GoodType` (definition).

An admissible H is good when c(H) is one H-conjugacy class. This permits the common rigidification multiplicity |c(H)|·|Aut_H(G)|. Ambient conjugacy is insufficient, and the condition on the outside class is additional to admissibility.

**Sources.** [Melanie Matchett Wood, Nonabelian Cohen–Lenstra moments](https://par.nsf.gov/servlets/purl/10152050), §1 p.378; Lemma 2.1 pp.385–386. Goodness is the single outside conjugacy-class hypothesis.

**Inputs.** `ArithmeticStatistics:ST.0/wood-admissible-type`.

**Downstream use.** Wood Lemma 2.1: Make the real rigid/unrigid multiplicity uniform.

**Proof plan.** Use conjugation by elements of the subgroup itself. Admissibility supplies nonemptiness of the outside set, preventing a vacuous empty-class definition.

**API.**

- `good_admissible` (characterisation): Good types are admissible.
- `good_conjugate` (characterisation): Any two outside involutions are conjugate inside H.
- `good_single_outside` (characterisation): An admissible subgroup with at most one outside element is good.

**Unit tests.**

- `good_test_trivial` (computation): The full wreath group for trivial G is good.
- `good_test_bottom` (non-example): The empty outside set in the identity subgroup is not good.
- `good_test_diagonal_c2` (non-example): For G=C₂, the diagonal G times swap subgroup is admissible but not good: its two outside involutions are distinct central elements.

### Type-preserving automorphisms

<a id="wood-type-automorphisms"></a>

**Target:** `ArithmeticStatistics:ST.0/wood-type-automorphisms`. **Declaration:** `typeAutomorphisms` (definition).

Aut_H(G) is the subgroup of Aut(G) whose diagonal functorial action on G≀S₂ fixes H as an embedded subgroup. It is not Aut(H). For an imaginary unrigid extension of type H, exactly |Aut_H(G)| rigid markings have the same embedded type.

**Sources.** [Melanie Matchett Wood, Nonabelian Cohen–Lenstra moments](https://par.nsf.gov/servlets/purl/10152050), §2.1.1 printed pp.383–385. Setwise preservation of the actual wreath image defines the marking multiplicity.

**Inputs.** `ArithmeticStatistics:ST.0/wood-admissible-type`, `tauceti:TauCeti.WreathProduct.map`.

**Downstream use.** Wood imaginary rigid average: Convert marked surjections to unmarked field extensions.

**Proof plan.** Use the already built wreath map induced by α:G≃*G on both base coordinates and identity on the top permutation. Identity, composition and inverse preserve the setwise stabilizer.

**API.**

- `typeAutomorphisms_mem` (characterisation): Membership is setwise preservation under the induced wreath map.
- `typeAutomorphisms_finite` (instance): The type-preserving automorphism group is finite for finite G.
- `typeAutomorphisms_full` (characterisation): Every automorphism preserves the full wreath subgroup.

**Unit tests.**

- `typeAut_test_trivial` (computation): For G=1, the type automorphism count is one.
- `typeAut_test_c2` (non-example): For G=C₂ the type automorphism count is one, although the full wreath group has eight elements.
- `typeAut_test_identity` (degenerate): Identity always preserves the type.

### Continuous marked surjections

<a id="wood-continuous-surjections"></a>

**Target:** `ArithmeticStatistics:ST.0/wood-continuous-surjections`. **Declaration:** `ContinuousSurjections` (construction).

For a profinite Γ and finite discrete G, Sur_c(Γ,G) is the type of continuous surjective group homomorphisms. A kernel specifies an unmarked finite G-extension; the identifications of its quotient with G form an Aut(G)-torsor. A type-preserving fiber has Aut_H(G)-torsor size. Finiteness in the arithmetic application is a separate Hermite/Hurwitz theorem, not a consequence of G being finite.

**Sources.** [Melanie Matchett Wood, Nonabelian Cohen–Lenstra moments](https://par.nsf.gov/servlets/purl/10152050), §2.1 printed pp.383–385. Rigid extensions are continuous surjections, including a quotient marking.

**Inputs.** `mathlib:ContinuousMonoidHom`, `ArithmeticStatistics:ST.0/wood-type-automorphisms`.

**Downstream use.** Wood rigid moments: Count markings rather than only extension fields.

**Proof plan.** Take the surjective subtype of Mathlib’s continuous monoid homomorphisms; group domains make these group homomorphisms. Two maps with equal kernels differ by exactly one automorphism of the finite quotient. Use the type automorphism subgroup when preserving the embedded image.

**API.**

- `continuousSurjectionKernel` (projection): The kernel is a subgroup; normality is inherited from the homomorphism.
- `continuousSurjection_aut_action` (functoriality): Postcomposition by an automorphism preserves surjectivity, and continuity when G is discrete.
- `continuousSurjection_same_kernel` (characterisation): Maps with the same kernel differ by a unique automorphism of G.

**Unit tests.**

- `sur_test_trivial_target` (computation): There is one continuous surjection to the trivial group.
- `sur_test_trivial_source` (non-example): There is no surjection from the trivial group to a nontrivial finite group.
- `sur_test_not_injective` (computation): A surjection may have nontrivial kernel; this is not an embedding carrier.

### Marked global extensions and infinity conventions

<a id="wood-infinity-and-type-adapter"></a>

**Target:** `ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter`. **Declaration:** `wood_infinity_and_type_adapter` (construction).

For Q or F_q(t), fix a separable closure and the specified infinity embedding. K^(un,∞) is the maximal extension unramified at every finite place and split at all places above infinity; it is the full extension, without a prime-to quotient. Imaginary number fields have nonsplit archimedean infinity; in the function-field case choose specifically the completion F_q((t^−1))(sqrt(t)), excluding the other nonsplit squareclass. Real means infinity splits. An imaginary marked surjection obtains a canonical outside involution from infinity and hence an actual embedded wreath image H. In the real case one instead chooses an outside order-two twist y; the rigid object is the pair (ρ,y).

**Sources.** [Melanie Matchett Wood, Nonabelian Cohen–Lenstra moments](https://par.nsf.gov/servlets/purl/10152050), §2 printed pp.383–385. Full unramified/split-infinity group and the pointed imaginary/real embeddings.

**Inputs.** `ArithmeticStatistics:ST.0/wood-continuous-surjections`, `ArithmeticStatistics:ST.0/wood-outside-involutions`, `InverseGaloisAndArithmeticFundamentalGroups:IG.4/marked-arithmetic-extensions`, `InverseGaloisAndArithmeticFundamentalGroups:IG.4/unramified-gamma-groups`, `InverseGaloisAndArithmeticFundamentalGroups:IG.4`.

**Downstream use.** Wood §2 rigid family definitions: Retain the infinity marking and actual wreath image, avoiding abstract-group type counts.

**Proof plan.** Import the marked arithmetic extension and normal-closure embedding. Verify the full universal extension has the continuous finite-quotient classification. The existing prime-to-Δ unramified group in IG.4 does not supply this full object; request its extension. For an index-two kernel and chosen y²=1 outside it, the two base coordinates are restriction to L and its y-conjugate; y maps to the canonical swap.

**API.**

- `woodFullUnramifiedInfinityGroup` (characterisation): Full profinite Galois group of K^(un,∞)/K, with its finite-quotient classification.
- `woodImaginaryType` (characterisation): Image of the infinity-marked normal-closure embedding in the built wreath product.
- `woodRealTwistType` (characterisation): Image of the normal-closure embedding attached to a real pair (ρ,y).
- `woodType_admissible` (characterisation): Every resulting embedded type is admissible (Wood Proposition 2.2).

**Unit tests.**

- `woodInfinity_test_full` (non-example): A quotient with order divisible by Δ must not be excluded merely by the prime-to-Δ group supplier.
- `woodInfinity_test_function_field` (non-example): Only the chosen sqrt(t) completion is in the imaginary function-field family, not every nonsplit completion.
- `woodInfinity_test_real` (compatibility): A split-infinity real field has no canonical outside inertia involution; its rigid data include a twist y.

**Suggested-file boundary.** Native global-field places, the full split-infinity maximal extension and its marked normal-closure representation are not simultaneously available at the pin. This exact construction is a supplier request, not a structure of unspecified proposition fields.

### Rigid finite-height and exact-slice averages

<a id="wood-average-normalizations"></a>

**Target:** `ArithmeticStatistics:ST.0/wood-average-normalizations`. **Declaration:** `wood_finite_multiplicity_transfer` (comparison).

Use the parent discriminant family, restricting its base to the prescribed imaginary or real infinity type. The imaginary rigid numerator sums type-H continuous surjections; the real numerator sums type-H pairs (ρ,y). Divide both by the number of quadratic base fields in the same carrier. Over Q use |Disc(K)|≤X for a height average; over F_q(t) use exact |Disc(K)|=q^(2n) slices when applying ST.5’s parametrizations. A genuinely empty slice is assigned zero at the finite level; a claimed limiting statement must specify a sequence of inhabited slices. For fixed unmarked extensions the imaginary multiplicity is |Aut_H(G)|; in the good real case it is |c(H)|·|Aut_H(G)|.

**Sources.** [Melanie Matchett Wood, Nonabelian Cohen–Lenstra moments](https://par.nsf.gov/servlets/purl/10152050), §2.1.1–2.1.2 pp.383–386, Lemma 2.1. Different rigid numerators, common base-field denominators and real multiplicity.

**Inputs.** `ArithmeticStatistics:ST.0/number-fields-ordered-by-discriminant`, `ArithmeticStatistics:ST.5/imaginary-exact-slice-parametrization`, `ArithmeticStatistics:ST.5/real-exact-slice-parametrization`, `ArithmeticStatistics:ST.0/wood-good-type`, `ArithmeticStatistics:ST.0/wood-type-automorphisms`, `ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter`, `InverseGaloisAndArithmeticFundamentalGroups:IG.4`.

**Proof plan.** Restrict the base carrier, then use the parent weighted count with the exact rigid fiber count as weight. Kernel fibers give the imaginary torsor factor. For real good H, Wood Lemma 2.1 conjugates twists inside the top kernel and counts c(H) choices, each with the same type-preserving automorphism fiber. Do not identify exact and cumulative slices. The function-field imaginary monic family is one leading-coefficient squareclass, not all odd-degree squarefree equations.

**Unit tests.**

- `wood_average_test_trivial` (degenerate): For G=1 on an inhabited imaginary slice each base contributes one surjection and the average is one.
- `wood_average_test_empty` (computation): An empty finite slice has assigned average zero.
- `wood_average_test_markings` (computation): Two markings per extension multiply the numerator but not the base denominator.

**Binding still needed.** The finite multiplicity transfer is fully typed. The arithmetic identification of its rigid and unrigid weights, including Lemma 2.1’s |c||Aut_H| factor, awaits the preceding marked-extension supplier.

### Root-of-unity and tame refinement comparisons

<a id="wood-root-unity-and-tame-comparison"></a>

**Target:** `ArithmeticStatistics:ST.0/wood-root-unity-and-tame-comparison`. **Declaration:** `root_unity_test_torsion` (comparison).

Wood’s correction is the |μ_K|-torsion subgroup of the reduced multiplier H₂(H,c), where μ_K is the roots-of-unity group of the base global field K. Over Q use 2; over F_q(t) use q−1. The reduced multiplier and global lifting invariant are imported from InductionRestrictionPartII RS.1 and InverseGalois IG.4. Restricting the quadratic base to the tame subfamily changes the denominator too. Moment counts refined by invariant value partition the rigid numerator; summing them does not by itself prove the arithmetic distribution law.

**Hypotheses.** Tame ramification and the lifting invariant’s hypotheses remain those of its owner.

**Sources.** [Melanie Matchett Wood, Nonabelian Cohen–Lenstra moments](https://par.nsf.gov/servlets/purl/10152050), §1 p.378 and §3 arithmetic invariant pp.388–393. The correction is base-field root-of-unity torsion; tame marking is an additional arithmetic restriction.

**Inputs.** `InductionRestrictionPartII:RS.1/reduced-multiplier`, `InverseGaloisAndArithmeticFundamentalGroups:IG.4/global-arithmetic-invariant`, `ArithmeticStatistics:ST.0/wood-average-normalizations`.

**Proof plan.** Reuse the reduced multiplier and its torsion subgroup. Check root-of-unity orders for the two bases. Apply finite partition identities to the already defined rigid fibers and the same tame base slice.

**Acceptance check.** For a reduced multiplier C₃, 2-torsion has size 1 while 6-torsion has size 3; the q−1 correction can depend on q.

### Monic squarefree Euler constants

<a id="monic-euler-products"></a>

**Target:** `ArithmeticStatistics:ST.0/monic-euler-products`. **Declaration:** `monicSquarefreeFactor` (construction).

For n≥2 set λ_n=product over all primes of λ_n(p), with λ_n(p)=ν₀(n,p)+ν₁(n,p). The product converges to a strictly positive real number because its factors are positive and 1−λ_n(p)=O_n(p^−2). As n→∞ it tends to (1/2) times the product over odd primes of [1−(3p−1)/(p²(p+1))]. For degree two λ₂=4/π². These are local Euler constants; identifying them with global family densities still requires the infinite-prime tail theorem in ST.2.

**Sources.** [Bhargava, Shankar, Wang, Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), §1 pp.1–2, constants λ_n and limiting λ. Positive Euler products and the limit in degree.

**Inputs.** `ArithmeticStatistics:ST.0/monic-density-formulas`, `ArithmeticStatistics:ST.2`.

**Downstream use.** BSW I global asymptotic: Supply the candidate product without replacing the sieve proof.

**Proof plan.** Separate the factor at 2. Bound the defect at odd p by a summable constant times p^−2 uniformly for n≥2. Establish nonzero convergence from positivity and the defect bound. Pointwise convergence plus the uniform product tail permits exchanging the degree limit and the product.

**API.**

- `monicEulerProduct` (data): The product over prime local factors.
- `monicEulerProduct_pos` (characterisation): The degree-n product is strictly positive.
- `monicEulerProduct_limit` (characterisation): The products tend to the limiting odd-prime product.

**Unit tests.**

- `lambda_test_two` (computation): At 2 every degree≥2 monic factor is 1/2.
- `lambda_test_quartic` (computation): The corrected monic quartic factor at 3 is 62/81.
- `lambda_test_quadratic_global` (compatibility): The quadratic global local-product constant is 4/π².

## Supplier boundaries and closure

The following requests name the precise mathematical interface needed. They
are part of the prerequisite graph. No stage is called closed while these
frontiers remain. The requests refine existing owners, so they do not introduce
duplicate generic arithmetic-family, polarization, Picard, Galois or bundle
objects.

### ArithmeticStatistics:ST.1

Fixed-degree binary-form ring R_f, discriminant preservation over Z and arbitrary residue rings, p-maximality criterion at infinity, projective root multiplicities, and the routed BGW/BSW general-rank representation and orbit targets listed in targetCoverage. The current parent ST.1 plans the low-degree/core orbit dictionary; these general-rank source routes remain that stage’s work.

Consumers: `ArithmeticStatistics:ST.0/odd-root-criterion`, `ArithmeticStatistics:ST.0/binary-density-formulas`, `ArithmeticStatistics:ST.0/stickelberger-binary`.

### ArithmeticStatistics:ST.2

Northcott finiteness for irreducible GL₂(Z)-classes of integral binary quartics at bounded invariant height, proved by the accepted fundamental-domain/cusp plan (the t≤Cλ cutoff bounds every coefficient). Also the BSW monic/binary infinite-prime tail estimates, needed before local products become global densities.

Consumers: `ArithmeticStatistics:ST.0/monic-euler-products`, `ArithmeticStatistics:ST.0/stabilizer-weighted-orbit-count`.

### AnalyticNumberTheory:AN.4

For each compatible finite local squareclass specification over a number field, count squarefree ideals in the relevant ray classes modulo Cl(F)² with the necessary finite-order Hecke-character estimates, compute the unit/Selmer multiplicities, and deduce #Σ(X)=c_(F,Σ)X+o(X) with c_(F,Σ)>0. Tau Ceti ArithmeticDirichletSeries supplies ideal/norm carriers and Tauberian tools, not this already-completed equidistribution theorem.

Consumers: `ArithmeticStatistics:ST.0/twist-denominator-frontier`.

### AbelianSchemesAndArithmeticModuliPartII:F3

Finiteness of dimension-g k-isomorphism classes over a fixed finite field and compatibility of the rational-orbit classification with the native Tau Ceti abelian-variety category.

Consumers: `ArithmeticStatistics:ST.0/unpolarized-abelian-count`.

### AbelianSchemesAndArithmeticModuli:A2

Native principal polarizations on an abelian variety, duality, the transport equation f∨λ′f=λ and the Aut(A) action. ST.0 imports these geometric objects and only forms their class count and forgetful fiber.

Consumers: `ArithmeticStatistics:ST.0/principally-polarized-count`, `ArithmeticStatistics:ST.0/polarization-fiber-count`.

### PELModuli:M6

Finite-field polarized-pair isomorphism classes, their finite carrier, and comparison with the Siegel stack. Counting rational objects is not identified with the coarse-space rational-point count.

Consumers: `ArithmeticStatistics:ST.0/principally-polarized-count`.

### AbelianSchemesAndArithmeticModuliPartII:F5

Identify the fixed-A polarized forgetful fiber with the Aut_k(A)-orbits of principal polarizations, using the existing polarization/line-bundle descent convention. Hermitian and lattice classifications remain imported geometry.

Consumers: `ArithmeticStatistics:ST.0/polarization-fiber-count`.

### tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-2-the-dictionary-between-galois-theory-and-permutations

Normal-closure action on Hom_Q(K,Qbar), cardinality n for a degree-n number field, and its equivariance under field isomorphism; specialize the existing representation instead of defining another polynomial Galois group.

Consumers: `ArithmeticStatistics:ST.0/field-permutation-type`.

### tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme

Over a finite field, rational Pic^d is represented by actual line bundles (Brauer obstruction vanishes), Pic¹ is a nonempty Jacobian torsor by Lang, degree is surjective, and Pic⁰=J(k) is finite. No rational curve point is assumed.

Consumers: `ArithmeticStatistics:ST.0/finite-picard-quotient`.

### tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality

Hyperelliptic finite-flat pushforward to P¹, Grothendieck splitting, degree and section formulas, theta loci as line-bundle classes with nonzero sections, and σL=(deg L)κ−L with invariant splitting index. The current AlgebraicVectorBundles roadmap supplies general locally free sheaves but not this P¹ splitting theorem; extend the geometric owner rather than adding a second bundle theory in ST.0.

Consumers: `ArithmeticStatistics:ST.0/natural-bundle-law`, `ArithmeticStatistics:ST.0/theta-tail-normalization`, `ArithmeticStatistics:ST.0/finite-joint-bundle-mass`, `ArithmeticStatistics:ST.0/pointless-curve-regression`.

### AdelicAlgebraicGroups:AA.2

The finite-volume normalized invariant measure on PGL₂(F)\PGL₂(A), measurable K-double-quotient maps, the adelic g_D Hecke translation, and the bundle double-coset dictionary. Specialize the generic Mathlib pair pushforward.

Consumers: `ArithmeticStatistics:ST.0/hecke-pushforward`.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4

Extend the current prime-to-Δ unramified-Gamma supplier to the full maximal finite-place-unramified extension split at infinity, with all continuous finite quotients. Bind its existing marked-arithmetic-extension data to Wood’s chosen imaginary infinity completion, canonical outside involution and real twists; prove finite type-H rigid fibers in fixed discriminant slices and the actual-image wreath embedding.

Consumers: `ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter`, `ArithmeticStatistics:ST.0/wood-average-normalizations`.

The five recorded gaps are:

- **Positive general-number-field squareclass denominator.** For each compatible finite local squareclass specification over a number field, count squarefree ideals in the relevant ray classes modulo Cl(F)² with the necessary finite-order Hecke-character estimates, compute the unit/Selmer multiplicities, and deduce #Σ(X)=c_(F,Σ)X+o(X) with c_(F,Σ)>0. Tau Ceti ArithmeticDirichletSeries supplies ideal/norm carriers and Tauberian tools, not this already-completed equidistribution theorem.
- **General-rank binary discriminant, root and ring binding.** ST.1 must implement the fixed-degree binary ring and projective-root interfaces, including leading-zero and zero-reduction cases. The typed universal discriminant and numerical formulas are stated here, but the beta maximality and root-criterion geometric signatures are explicitly omitted.
- **Polarized geometry and finite class counts.** The pin has abelian varieties and categorical isomorphisms, but lacks the native dual/principal-polarization type. A.2/M6/F5 supplies it. The generic orbit adapter is typed and does not assert that arbitrary actions are polarizations.
- **Picard, theta and adelic geometric specialization.** The abstract degree-two quotient, uniform fiber probabilities and candidate masses are fully typed. Rational Picard, P¹ splitting, theta event bijections and the normalized adelic double-coset dictionary require the named geometric suppliers; these are not proved by a generic pushforward signature.
- **Full Wood split-infinity arithmetic binding.** The IG.4 prime-to group is insufficient. Its full extension, chosen infinity marking, actual normal-closure image and finite rigid fibers must be supplied before the arithmetic averages specialize the typed finite multiplicity transfer.

The four EVW targets routed to the ST.5 stage rather than an existing individual
parent node are Katz–Lang abelian covers, the pointwise class-mass conclusion,
the arithmetic monodromy target and the relevant finite-level geometric input
(item suffixes `katz-lang-abelian-covers`, `114`, `137`, `125`). They remain
specific ST.5 source frontiers in the ledger below, not implemented imports.
General-rank BGW/BSW representation and switching targets remain ST.1, and
the six BSTTTZ field-counting estimates remain ST.3. Their source locators
and exact target identities are conserved in the same ledger.

## Source corrections and finite verification

The corrected formulas above follow primary calculations and independent
finite enumeration. They are recorded as source issues for the plan's
independent reviewer. This worker supplies no self-review verdict and does
not open a separate errata job.

### ArithmeticStatistics/E8001

**Text checked:** Published Experimental Mathematics 16 (2007), Theorem 6.8 table p.372; its generating-function coefficient calculation and combined squarefree table pp.372–373.

**Issue, in our words:** The n≥4 valuation-one table uses (1−(−p)^(-n)); the later combined ν₀+ν₁ table uses exponent 2−n.

**Correction:** The valuation-one formula is (p−1)²(1−(−p)^(2−n))/(p²(p+1)) for n≥3 and odd p, with the separately stated n=2 case.

**Evidence:** The source’s own generating series (p−1)t²(1−t²/p)/(p²(1−t)(1+t/p)) gives ν₁(4,3)=8/81. The printed first table gives 80/729; direct enumeration of all 9⁴ monic quartic residue vectors gives 8/81. The combined table is already correct.

**Existing status:** No published correction located in the limited search; the propagation into BSW II is already PAPER-BHARGAVA-SHANKAR-WANG-25/E1.

**Search scope.** 2026-10-10: public author copy linked from Avner Ash’s publication page; full §§3,6 including the internally inconsistent tables. 2026-10-10: publisher DOI 10.1080/10586458.2007.10129001 and title plus erratum/correction searches; no applicable correction located. Repository source-issues and BSW II extraction: its E1 explicitly did not attribute the error to unread ABZ; this run acquired ABZ itself.

### ArithmeticStatistics/E8002

**Text checked:** Published Forum of Mathematics Pi 13 (2025), e11, Appendix A, Proposition A.1 and ν₁ calculation, pp.53–54; Theorem 1 degree-four specialization.

**Issue, in our words:** The appendix uses exponent −n in ν₁ for n≥4 and gives α₄=(1−1/p)²(1+2/p−2/p⁴+1/p⁵).

**Correction:** Use exponent 2−n in ν₁ and α₄=(1−1/p)²(1+1/p)(1+1/p−1/p²), agreeing with every n≥4. Consequently the degree-four global squarefree factor uses this corrected Euler product.

**Evidence:** At p=3 exhaustive enumeration of 9⁵ binary quartic tuples gives 176/243, whereas the displayed special α₄ gives 1600/2187. The corrected monic strata and the three leading-coefficient strata independently give 176/243.

**Existing status:** PAPER-BHARGAVA-SHANKAR-WANG-25/E1, independently confirmed by REV-PAPER-BHARGAVA-SHANKAR-WANG-25.

**Search scope.** 2026-10-10: Cambridge version of record and its Appendix A; public April 4,2025 author copy has the same expressions. 2026-10-10: arXiv 2207.05592 and title/erratum/corrigendum searches; no applicable later correction located. Repository accepted extraction and review: E1 already records the quartic error. This packet adds no independent-review verdict.

### ArithmeticStatistics/E8003

**Text checked:** arXiv:1307.8237v1 only, §4 p.33 joint-tail display; final Duke version was not acquired in this run.

**Issue, in our words:** The joint-tail display assigns the raw rational-point count of the theta intersection as a probability.

**Correction:** Divide the intersection count by 2#J(F_q) for the uniform two-parity quotient, or by #J(F_q) for an explicitly conditioned parity sector.

**Evidence:** Q has 2#J elements. The pointless F₃ genus-two regression has a one-point tail and quotient size 8, hence unconditional probability 1/8.

**Existing status:** PAPER-SHENDE-TSIMERMAN-17/E12, confirmed for v1 by its independent review; no claim about the unmatched final publication.

**Search scope.** Repository extraction E12 and its review, which document the unmatched Duke version. 2026-10-10: arXiv v1 pp.30–33 freshly read. Scope is limited to that text; no new publication-persistence claim.


Exact rational computations independently checked the local regression values.
For each binary degree two, three and four, the explicit integral discriminant
polynomial was first compared with a signed Sylvester determinant on 81
deterministically sampled tuples with nonzero leading coefficient (243 checks).
The coefficient polynomials were then evaluated on every tuple modulo four,
including leading-zero tuples, and on every binary quartic tuple modulo nine.
There are respectively 64, 256, 1024 and 59049 tuples. The squarefree counts
give α₂(2)=1/2, α₃(2)=α₄(2)=3/8 and α₄(3)=176/243. Enumeration of all 6561
monic quartic tuples modulo nine separates ν₀=2/3, ν₁=8/81 and λ₄(3)=62/81.
All calculations use exact integers and fractions, without numerical rounding.

These checks can be reproduced using the signed resultant discriminant
formula and nested finite loops over the named residue rings. For the curve
regression, represent F₉ as pairs (a,b) with multiplication
(a,b)(c,d)=(ac−bd,ad+bc) modulo three. Enumerate x and y, then add the
solutions of y²=2 at infinity; this gives N₃=0 and N₉=14. The genus-two
functional equation determines the remaining zeta coefficients from those
counts. These finite computations verify the stated regression values;
they are not implementations of the general sieve or geometry theorems.

## Planets

This part selects six landmarks:

- **Coefficient-height families**: `ArithmeticStatistics:ST.0/coefficient-box`.
- **Binary discriminant**: `ArithmeticStatistics:ST.0/binary-discriminant`.
- **Monic discriminant densities**: `ArithmeticStatistics:ST.0/monic-density-formulas`.
- **Natural bundle measure**: `ArithmeticStatistics:ST.0/natural-bundle-law`.
- **Finite Picard quotient**: `ArithmeticStatistics:ST.0/finite-picard-quotient`.
- **Wood extension types**: `ArithmeticStatistics:ST.0/wood-outside-involutions`.

The parent already selects six ST.0 planets. The packet therefore records a
rescope proposal with complete node assignments: General arithmetic families
and density contains the 37 parent nodes and their six landmarks; Concrete
local and moduli families contains the 40 nodes above and these six landmarks.
Current node ids and stage ownership are preserved pending the maintainer’s
decision. Assembly must apply that split or select at most six planets across
both packets; it must never draw twelve planets on one layer.

## Conservation ledger for the routed source targets

Every target in the accepted parent's routed ST.0 inventory appears exactly
once below. A developed route points to a node of this part. An imported
route points to an existing node or a requested owner stage, with its status
left to that owner. Titles identify mathematical targets; the ledger is not
a source excerpt or a sequential summary of the papers.

| Source target | Locator | Disposition and owner |
|---|---|---|
| `PAPER-BHARGAVA-GROSS-WANG-17/1`: Hyperelliptic curves z² = f(x, y) ordered by height | §1, (1)–(2), p.1; §3, p.9, arXiv:1310.7692v2 | developed: `ArithmeticStatistics:ST.0/hyperelliptic-model-family` |
| `PAPER-BHARGAVA-GROSS-WANG-17/16`: The representation 2 ⊗ Sym²(n) over a Dedekind domain | §2, pp.6–8, arXiv:1310.7692v2 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/17`: The order R_f and the ideals I(k) | §2, pp.6–7, arXiv:1310.7692v2 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/18`: Theorem 16 (SL_n(D)-orbits and triples (I, α, s); after Wood) | Theorem 16, p.7, citing [40], arXiv:1310.7692v2 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/19`: Theorem 17 and Remark 18 ((SL_n/μ_2)(D)-orbits) | Theorem 17, Remark 18, (3), pp.7–8, arXiv:1310.7692v2 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/20`: Corollaries 19–20 (orbits over a field) | Corollaries 19–20 and the following paragraphs, pp.8–9, citing [6], arXiv:1310.7692v2 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/25`: Generic pencils and their Fano schemes | §1, p.4; §4, p.12, citing [16], [19], [29], [37], arXiv:1310.7692v2 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/26`: Theorem 23 (Wang: the group J ⊔ F ⊔ J¹ ⊔ F) | Theorem 23 and the following paragraphs, pp.12–13, citing [37], arXiv:1310.7692v2 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/27`: Regular pencils: (A′, B′) = (A ⊕ ⟨aa′⟩, B ⊕ ⟨ab′ + a′b⟩) | §5, (7), pp.13–14, citing [37, §3], arXiv:1310.7692v2 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/28`: Theorem 24 and Theorem 13 (when is f the discriminant of a pencil?) | Theorem 13, p.5; Theorem 24 and proof, pp.14–15, arXiv:1310.7692v2 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/29`: Theorem 25, Proposition 26 and Lemma 27 (the obstruction classes coincide) | Theorem 25, Proposition 26, Lemma 27 and proofs, pp.15–17, citing [6, §2.4, Theorem 9], [33, Lemma 2.4.5], [36, Lemma 2.8.2], arXiv:1310.7692v2 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/30`: Cassels' descent map x − T | Proof of Theorem 28, pp.18–19, citing [12], arXiv:1310.7692v2 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/31`: Theorem 28 (soluble SL_n(K)-orbits) | Theorem 28 and proof, pp.18–19, arXiv:1310.7692v2 (error E1) | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/32`: Theorem 29 (soluble (SL_n/μ_2)(K)-orbits) | Theorem 29 and the preceding paragraph, pp.19–20, arXiv:1310.7692v2 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/33`: Orbits over finite fields (§7.1) | §7.1, p.20, arXiv:1310.7692v2 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/34`: Orbits over R and C (§7.2) | §7.2, pp.20–21, arXiv:1310.7692v2 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/35`: Theorem 30 (existence of rational orbits over a global field) | Theorem 30 and proof, pp.21–23, arXiv:1310.7692v2 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/36`: Theorems 31 and 14 and Lemma 32 (locally soluble orbits and Sel_2(J¹)) | Theorem 14, p.5; Theorem 31, Lemma 32 and proofs, pp.23–25, citing [4, Proposition 1], [28, Proposition 10.3], arXiv:1310.7692v2 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/38`: Examples: locally soluble orbits without soluble orbits, and conversely | §8, p.23, arXiv:1310.7692v2 (misprint E2) | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/39`: Theorems 15 and 33 and Proposition 34 (integral representatives, κ = 4) | Theorem 15, p.5; Theorem 33, Proposition 34 and proofs, pp.25–28, citing [1, §2], [5, Proposition 8.2], [31, Proposition 2.9], [38, Lemma 3.8], arXiv:1310.7692v2 (misprints E4, E5) | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-GROSS-WANG-17/40`: Proposition 35 (uniqueness of integral representatives at good odd primes) | Proposition 35 and proof, p.29, citing [10, §9.5 Theorem 1], [31], arXiv:1310.7692v2 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/baily-weighted-count`: Weighted quartic-to-cubic counting estimate | §6 equation (5), citing Baily Theorems 2 and 4 | imported: `ArithmeticStatistics:ST.3` |
| `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/cyclic-cubic-count`: Cyclic cubic discriminant asymptotic | §6 p.10, Cohn | imported: `ArithmeticStatistics:ST.3` |
| `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/fixed-resolvent-cubic-count`: Cubic count with fixed quadratic resolvent | §6 equation (10), Bhargava–Shnidman Theorem 7 and Cohen–Morra Theorem 1.1(2), Corollary 7.6 | imported: `ArithmeticStatistics:ST.3` |
| `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/weighted-partial-summation`: Converting the weighted cubic sum | §6 p.10 proof of equations (8) and (9) | imported: `ArithmeticStatistics:ST.3` |
| `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/a4-quartic-count`: A₄ quartic field bound | Theorem 1.4 and §6 equation (8) | imported: `ArithmeticStatistics:ST.3` |
| `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/fixed-resolvent-quartic-count`: S₄ quartic bound with fixed quadratic resolvent | §6 Remark 6.1 equation (9) | imported: `ArithmeticStatistics:ST.3` |
| `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/field-count-carrier`: Discriminant-ordered field counts | §6 p.10 | developed: `ArithmeticStatistics:ST.0/field-permutation-type` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/1`: Monic polynomials ordered by height | §1, pp.1–2; §4, pp.20–21, arXiv:1611.09806v3 | developed: `ArithmeticStatistics:ST.0/monic-weighted-height` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/3`: Yamamura's density λ_n(p) of p² ∤ Δ | §1, (1), p.1, citing [26], arXiv:1611.09806v3 | developed: `ArithmeticStatistics:ST.0/monic-density-formulas` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/4`: The constants λ_n and their limit λ | §1, (2), p.2, arXiv:1611.09806v3 | developed: `ArithmeticStatistics:ST.0/monic-euler-products` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/5`: Lenstra's density ρ_n(p) = 1 − 1/p² of p-maximality | §1, (3), p.2, citing [1], arXiv:1611.09806v3 | developed: `ArithmeticStatistics:ST.0/local-maximality` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/11`: Strong and weak divisibility of the discriminant by p² | §1, p.4, arXiv:1611.09806v3 | developed: `ArithmeticStatistics:ST.0/strong-weak-discriminant` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/12`: Root-theoretic criterion for strong and weak divisibility (p odd) | §1, p.4, arXiv:1611.09806v3 (error E1: stated for all p) | developed: `ArithmeticStatistics:ST.0/odd-root-criterion` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/13`: Collections of local specifications and κ-acceptability | §4, pp.20–21, arXiv:1611.09806v3 | developed: `ArithmeticStatistics:ST.0/kappa-acceptable-specifications` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/14`: Proposition 2.2 (the shape of a weakly divisible polynomial) | Proposition 2.2 and proof, pp.8–9; remark after Theorem 2.3, p.10, arXiv:1611.09806v3 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/15`: The representation of SO_n on symmetric matrices | §1, pp.4–5; §2.1, pp.6–7; §3.1, pp.14–15, arXiv:1611.09806v3 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/16`: The invariant ring of W | §1, p.4; §2.1, p.6; §3.1, p.15, citing [3], [23], arXiv:1611.09806v3 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/17`: Stabilizers are the 2-torsion of the Jacobian | §2.1, p.7; §3.1, p.15, citing [4], [24], arXiv:1611.09806v3; even-case supplier corrected to Wang, Thesis, Proposition 1.29 and Corollary 1.33, pp.29–30 (not its Theorem 2.33) | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/18`: Distinguished elements and orbits | §1, p.5; §2.1, p.7; §3.1, p.15, arXiv:1611.09806v3; corrected using Wang Thesis §§1.2.2, 2.6–2.7, pp.28–30,85–87; E17 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/19`: Isotropic subspaces of a distinguished element | §2.1, p.7; §3.1, p.15, citing [4], [24], arXiv:1611.09806v3; even-case supplier Wang Thesis Corollary 1.33 and §2.7; E17 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/20`: J_f[2](k) and factorizations of f | §2.1, p.7; §3.1, p.15, citing [4], [5], arXiv:1611.09806v3 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/21`: The subspace W_0 and its parabolic G_0 | §2.1, (5), p.7; §3.1, (24), p.15, arXiv:1611.09806v3 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/22`: The Q-invariant of 2 ⊗ g ⊗ (g + 1) | §2.1, (6), pp.7–8, arXiv:1611.09806v3 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/23`: The Q-invariant on W_0 | §2.1, (7)–(8), p.8; §3.1, (25)–(26), p.15, arXiv:1611.09806v3 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/24`: Q² divides the discriminant on W_0 | §1, p.5; remark after Theorem 2.3, p.10, arXiv:1611.09806v3 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/25`: Proposition 2.1 (\|Q\| is well defined, n odd) | Proposition 2.1 and proof, p.8, arXiv:1611.09806v3 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/26`: Proposition 3.1 (\|Q\| is well defined, n even) | Proposition 3.1 and proof, p.16, arXiv:1611.09806v3 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/27`: The \|Q\|-invariant and the sets L | §2.1, p.8; §2.2, pp.10–11; §3.1, p.16; §3.2, p.17, arXiv:1611.09806v3 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/28`: The matrices B_m(c_1, …, c_n) for odd n (11) | §2.2, (11)–(13), pp.9–10, arXiv:1611.09806v3 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/29`: Theorem 2.3 (the embedding σ_m, n odd) | Theorem 2.3 and proof, p.10, arXiv:1611.09806v3 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/30`: Theorem 2.4 (orbits of \|Q\|-invariant m, n odd) | Theorem 2.4, p.11, arXiv:1611.09806v3 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/31`: The matrices B_m(c_1, …, c_n) for even n (27) | §3.2, (27), pp.16–17, arXiv:1611.09806v3 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/32`: Theorem 3.2 (the embedding σ_m, n even) | Theorem 3.2, p.17, arXiv:1611.09806v3 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-22/33`: Theorem 3.3 (orbits of \|Q\|-invariant m, n even) | Theorem 3.3, p.17, arXiv:1611.09806v3 (misprint E4) | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/1`: Binary n-ic forms ordered by height | §1, p.2; §3, p.7; Theorem 6, p.4, Forum Math. Pi 13 (2025), e17 | developed: `ArithmeticStatistics:ST.0/coefficient-box` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/2`: The discriminant of a binary form | §1, p.2; §3.5, p.13, Forum Math. Pi 13 (2025), e17 | developed: `ArithmeticStatistics:ST.0/binary-discriminant` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/3`: Stickelberger for binary forms: 2 \| Δ implies 4 \| Δ | Proof of Proposition A.1, subset 3, pp.54–55 ("if p = 2, then since 2 \| Δ(f), we have 4 \| Δ(f)"), Forum Math. Pi 13 (2025), e17 (gap E6) | developed: `ArithmeticStatistics:ST.0/stickelberger-binary` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/4`: The rank-n ring R_f of a binary form (Birch–Merriman, Nakagawa, Wood) | §1, pp.2–3; §7, p.52, citing [12], [24], [38], Forum Math. Pi 13 (2025), e17 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/5`: Strong and weak divisibility for binary forms; W^{(1)}_m, W^{(2)}_m | §1, p.3; Appendix, p.54; §6.5, p.50, Forum Math. Pi 13 (2025), e17 | developed: `ArithmeticStatistics:ST.0/strong-weak-discriminant` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/6`: Densities ν_0(n, p), ν_1(n, p) of v_p(Δ) = 0, 1 for monic polynomials (corrected) | Proof of Proposition A.1, p.53, citing [2, Proposition 6.4 and Theorem 6.8], Forum Math. Pi 13 (2025), e17 (error E1) | developed: `ArithmeticStatistics:ST.0/monic-density-formulas` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/7`: Proposition A.1 (density α_n(p) of p² ∤ Δ for binary forms; corrected) | Proposition A.1 and proof, pp.53–55, Forum Math. Pi 13 (2025), e17 (error E1) | developed: `ArithmeticStatistics:ST.0/binary-density-formulas` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/8`: Proposition A.2 (density β_n(p) of p-maximal R_f) | Proposition A.2 and proof, p.55, citing [2, Proposition 3.5], Forum Math. Pi 13 (2025), e17 | developed: `ArithmeticStatistics:ST.0/binary-density-formulas` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/9`: Lenstra: monic polynomials are p-maximal with density 1 − p^{−2} | Proof of Proposition A.2, p.55, citing [2], Forum Math. Pi 13 (2025), e17 | developed: `ArithmeticStatistics:ST.0/local-maximality` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/10`: The representation W_n = 2 ⊗ Sym²(n) of SL_2 × SL_n | §2, pp.4–5; §3, (1), p.7, Forum Math. Pi 13 (2025), e17 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/11`: The SL_n-invariant ring of W_n | §2, p.5; §3, p.7, citing [7], [39], Forum Math. Pi 13 (2025), e17 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/12`: Arithmetic invariant theory of W_n for odd n (Bhargava–Gross–Wang) | §3.1, p.7, citing [7], Forum Math. Pi 13 (2025), e17 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/13`: The subspace W_0, its parabolic G_0 and the space U_g | §3.1, (2)–(3), pp.7–8, Forum Math. Pi 13 (2025), e17 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/14`: Existence and number of orbits for even n | §3.1, p.8, citing [8, Theorem 7], Forum Math. Pi 13 (2025), e17 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/15`: Proposition 3.1 (U_g is prehomogeneous) | Proposition 3.1 and proof, p.8, citing [30, §2], Forum Math. Pi 13 (2025), e17 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/16`: The Q-invariant (hyperdeterminant of format 2 × g × (g + 1)) | §3.2, (4)–(5), pp.8–9, Forum Math. Pi 13 (2025), e17 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/17`: Proposition 3.2, Lemma 3.3 and Proposition 3.4 (the locus Q = 0) | Proposition 3.2, Lemma 3.3, Proposition 3.4 and proofs, pp.9–11, Forum Math. Pi 13 (2025), e17 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/18`: Theorem 3.5 (Q² divides Δ on W_0) | Theorem 3.5 and proof, p.11, Forum Math. Pi 13 (2025), e17 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/19`: Proposition 3.6 (corrected: Δ lies in the ideal of maximal minors of B^top and of A^top) | Proposition 3.6 and proof, pp.11–12, Forum Math. Pi 13 (2025), e17 (error E2) | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/20`: The embedding σ_m for odd n: normal form (8) and matrices (9) | §3.4, (8)–(9), p.12, Forum Math. Pi 13 (2025), e17 (gap E9) | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/21`: Theorem 3.7 (σ_m for odd n) | Theorem 3.7, p.12, published 2025 version; even-m convention E6 (not a missing-hypothesis error). | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/22`: \|Q\| on distinguished pairs with an isotropic lattice | §3.4, pp.12–13; §4, p.16, Forum Math. Pi 13 (2025), e17 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/23`: Proposition 3.8 (uniqueness of the isotropic lattice) | Proposition 3.8 and proof, p.13, Forum Math. Pi 13 (2025), e17 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/24`: The embedding for even n via xf, and the set W^{(2),gen}_{m,n} | §3.5, p.13, Forum Math. Pi 13 (2025), e17 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/25`: The q-invariant on W_1 | §3.5, (10)–(12), pp.13–14, Forum Math. Pi 13 (2025), e17 | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BHARGAVA-SHANKAR-WANG-25/26`: Proposition 3.9 (\|Q\| and \|q\| of σ_m(f), n even) | Proposition 3.9 and proof, pp.14–15, Forum Math. Pi 13 (2025), e17 (misprint E10) | imported: `ArithmeticStatistics:ST.1` |
| `PAPER-BROWNING-LEBOUDEC-SAWIN-23/family`: Coefficient family and Euclidean height | arXiv v1, §1 p.1 | developed: `ArithmeticStatistics:ST.0/primitive-hypersurface-family` |
| `PAPER-BROWNING-LEBOUDEC-SAWIN-23/density`: Global and local density ratios | arXiv v1, §1 pp.1–2 | developed: `ArithmeticStatistics:ST.0/density-denominator-comparisons` |
| `PAPER-BROWNING-LEBOUDEC-SAWIN-23/primitive-residue`: Primitive residue vectors | arXiv v1, §5.1 p.50 (5.2) | imported: `ArithmeticStatistics:ST.5/local-density-of-a-form-modulo-q` |
| `PAPER-BROWNING-LEBOUDEC-SAWIN-23/Floc`: Finite-level locally soluble coefficient set | arXiv v1, §5.2 p.55 (5.16) | developed: `ArithmeticStatistics:ST.0/finite-local-hypersurface-set` |
| `PAPER-BURUNGALE-TIAN-26/squarefree-density`: Relative density in the even-parity congruent-number family | Theorem 1.2, p.2; Theorem 3.3, p.6 | imported: `ArithmeticStatistics:ST.0/relative-density` |
| `PAPER-BURUNGALE-TIAN-26/number-field-twist-height`: Height ordering on number-field squareclasses | Proposition 1.3, p.2; Theorem 3.5, p.7; BKLOS §2, p.2 | imported: `ArithmeticStatistics:ST.0/quadratic-twist-squareclass-family` |
| `PAPER-BURUNGALE-TIAN-26/squarefree-half`: The three even-parity residue classes occupy half the squarefree family | Theorem 1.2, p.2 and its abstract formulation; counting comparison used in §3.2.1 | imported: `ArithmeticStatistics:ST.0/even-parity-classes-have-half-density` |
| `PAPER-BURUNGALE-TIAN-26/bklos-density`: BKLOS 3∞-Selmer density input for CM twists | Theorem 3.5, p.7; BKLOS Theorem 2.7 with §§9.2,11 | imported: `ArithmeticStatistics:ST.5/cm-twists-have-corank-zero-at-least-half` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/71`: Cohen–Lenstra measure | §8.1 | imported: `ArithmeticStatistics:ST.5/cohen-lenstra-measure` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/72`: Haar-cokernel normalization and moments | §8.1, citing Cohen–Lenstra and Friedman–Washington | imported: `ArithmeticStatistics:ST.5/haar-matrix-cokernel-surjection-moments` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/73`: Surjection moment of a measure | §8.1 | imported: `ArithmeticStatistics:ST.5/surjection-moment` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/74`: Uniqueness from all surjection moments | Lemma 8.2 | imported: `ArithmeticStatistics:ST.5/moments-determine-the-cohen-lenstra-measure` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/75`: Finite moment control of finitely many masses | Proposition 8.3 | imported: `ArithmeticStatistics:ST.5/finite-moment-control-of-masses` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/76`: Enlargement and iterated enlargement | Lemma 8.4 proof | imported: `ArithmeticStatistics:ST.5/enlargement-of-finite-abelian-p-groups` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/77`: Exact surjection-count formula | Replacement for the failed lifting step of Lemma 8.4; report proof | imported: `ArithmeticStatistics:ST.5/exact-surjection-count-formula` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/78`: Aggregate enlargement inequality | Equation 8.4.1; repaired proof, E6 | imported: `ArithmeticStatistics:ST.5/aggregate-enlargement-inequality` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/79`: Partition tail domination | Lemma 8.4 last paragraph; elementary proof supplied in report | imported: `ArithmeticStatistics:ST.5/partition-tail-domination` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/80`: Finite enlargement domination of tails | Lemma 8.4, with repaired equation 8.4.1 proof | imported: `ArithmeticStatistics:ST.5/finite-enlargement-domination-of-tails` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/81`: Surjection moments imply distribution convergence | §8.5, corrected E7 | imported: `ArithmeticStatistics:ST.5/moment-convergence-implies-distribution-convergence` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/82`: Generalized dihedral cover datum | §8.6 | imported: `ArithmeticStatistics:ST.5/generalized-dihedral-cover-datum` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/83`: Imaginary quadratic function-field family | §8.7 | imported: `ArithmeticStatistics:ST.5/odd-degree-quadratic-function-field-family` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/84`: Surjective class-group pair and its isomorphisms | Proposition 8.7 and equation 8.7.4 | imported: `ArithmeticStatistics:ST.5/class-group-surjection-pair` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/86`: Involution quotient of unramified pro-ell group | Proposition 8.7 proof | imported: `ArithmeticStatistics:ST.5/involution-quotient-of-the-unramified-pro-l-group` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/87`: Hurwitz points classify class-group surjections modulo sign | Proposition 8.7 | imported: `ArithmeticStatistics:ST.5/hurwitz-points-classify-class-group-surjections` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/88`: Factor-two point-count identity | Equation 8.7.4 and Theorem 8.8 proof | imported: `ArithmeticStatistics:ST.5/factor-two-point-count-identity` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/89`: Size of the odd-degree quadratic family | Equation 8.7.5, corrected E8 | imported: `ArithmeticStatistics:ST.5/size-of-the-odd-degree-quadratic-family` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/90`: Empirical ell-primary class-group law | After Theorem 8.8 statement, corrected E9 | imported: `ArithmeticStatistics:ST.5/empirical-l-primary-class-group-law` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/94`: Top cohomology counts Frobenius-fixed components | Theorem 8.8 proof, pp.778–779 | imported: `ArithmeticStatistics:ST.5/top-cohomology-counts-rational-components` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/95`: Uniform trace-error estimate | Theorem 8.8 proof | imported: `ArithmeticStatistics:ST.5/uniform-trace-error-estimate` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/96`: Hyperelliptic torsion local system | Theorem 8.8 proof, p.779 | imported: `ArithmeticStatistics:ST.5/hyperelliptic-torsion-local-system` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/katz-lang-abelian-covers`: Abelian étale covers of a curve and the torsion of its Jacobian | Theorem 8.8 proof, p. 779, citing Katz–Lang [37, (2.4)] ('in the case at hand, this is just Kummer theory') | imported: `ArithmeticStatistics:ST.5` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/97`: Geometric generic fibre of the unmarked Hurwitz cover | Theorem 8.8 proof, p.779, corrected E10 | imported: `ArithmeticStatistics:ST.5/geometric-generic-fibre-of-the-unmarked-hurwitz-cover` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/98`: Integral hyperelliptic monodromy input | Theorem 8.8 proof; Achter–Pries §§3.1–3.3 | imported: `ArithmeticStatistics:ST.5/integral-hyperelliptic-monodromy` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/99`: Monodromy orbits and arithmetic components | Theorem 8.8 proof, pp.779–780 | imported: `ArithmeticStatistics:ST.5/monodromy-orbits-and-rational-components` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/100`: Symplectic similitudes on an ell-adic lattice | §8.9 | imported: `ArithmeticStatistics:ST.5/symplectic-similitude-group` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/101`: Primary decomposition for a multiplier-q automorphism | Lemma 8.9 proof, equations 8.9.2–8.9.3 | imported: `ArithmeticStatistics:ST.5/primary-decomposition-for-a-multiplier-q-similitude` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/102`: Orthogonality and a killed Lagrangian | Lemma 8.9 proof | imported: `ArithmeticStatistics:ST.5/orthogonality-and-a-killed-lagrangian` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/103`: Symplectic integral normal forms | Lemma 8.9 proof, inputs (i)–(iv) | imported: `ArithmeticStatistics:ST.5/symplectic-normal-forms-over-z-l` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/104`: Linear group acts transitively on lattice surjections | End of Lemma 8.9 proof; corrected E12 | imported: `ArithmeticStatistics:ST.5/linear-group-transitive-on-lattice-surjections` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/105`: Unique similitude-stable symplectic orbit | Lemma 8.9 | imported: `ArithmeticStatistics:ST.5/unique-similitude-stable-symplectic-orbit` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/106`: One rational geometric Hurwitz component eventually | Theorem 8.8 proof | imported: `ArithmeticStatistics:ST.5/one-rational-geometric-component` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/107`: Uniform function-field surjection-moment estimate | Theorem 8.8, retaining standing abelian and characteristic hypotheses | imported: `ArithmeticStatistics:ST.5/uniform-function-field-surjection-moment-estimate` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/108`: Lower and upper degree densities | Theorem 1.2; deduction after Theorem 8.8 | imported: `ArithmeticStatistics:ST.5/lower-and-upper-degree-densities` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/109`: Large-q Cohen–Lenstra density theorem | Theorem 1.2 as supported by §8; domain qualification E11 | imported: `ArithmeticStatistics:ST.5/large-q-cohen-lenstra-theorem` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/110`: Positive proportions of divisible and indivisible class numbers | After Theorem 1.2 | imported: `ArithmeticStatistics:ST.5/positive-proportions-of-l-divisible-and-indivisible-class-numbers` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/113`: Cohen–Lenstra contraction constant | Lemma 8.2 proof; explicit auxiliary verification | imported: `ArithmeticStatistics:ST.5/cohen-lenstra-contraction-constant` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/114`: Failure of arbitrary pointwise lifting | Lemma 8.4, E6; exact witness in report | imported: `ArithmeticStatistics:ST.5` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/115`: Distribution convergence alone does not force moment convergence | §8.5, E7; explicit witness in report | imported: `ArithmeticStatistics:ST.5/distribution-convergence-does-not-force-moment-convergence` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/116`: Monodromy adapter to the EVW family | Theorem 8.8 monodromy invocation | imported: `ArithmeticStatistics:ST.5/monodromy-of-the-odd-degree-polynomial-family` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/137`: Arithmetic monodromy quotient and the cyclotomic multiplier | AP§3.1, PDF p.10; corrected input for EVW8.8 and AP Corollary3.6 | imported: `ArithmeticStatistics:ST.5` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/121`: Hyperelliptic boundary degeneration input | Achter–Pries §§2.1–2.5, Lemma2.5 and Lemma3.1; Theorem3.4 proof | imported: `ArithmeticStatistics:ST.5/hyperelliptic-boundary-degeneration` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/122`: Overlapping symplectic subgroups generate | Achter–Pries §3.2, Lemma3.2(b)(i), and Theorem3.4 | imported: `ArithmeticStatistics:ST.5/overlapping-symplectic-subgroups-generate` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/123`: Integral lift of full mod-ell monodromy | Achter–Pries Corollary3.5; Vasiu arXiv:math/0209237v2, Theorem1.3(a,b), §§3.7.1,4.1.2,4.5,4.7 | imported: `ArithmeticStatistics:ST.5/integral-lift-of-full-mod-l-symplectic-image` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/125`: Lift histogram for the enlargement counterexample | Finite verification supporting E6 | imported: `ArithmeticStatistics:ST.5` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/134`: Full monodromy for the labelled hyperelliptic stack modulo ell | AP Theorem3.4, PDF pp.13–14; Lemmas2.5,3.1,3.2,3.3 | imported: `ArithmeticStatistics:ST.5/mod-l-hyperelliptic-monodromy-is-symplectic` |
| `PAPER-ELLENBERG-VENKATESH-WESTERLAND-16/135`: Finite torsion-level monodromy in the exact polynomial family | EVW8.8, pp.779–780 | imported: `ArithmeticStatistics:ST.5/finite-level-monodromy-of-the-polynomial-family` |
| `PAPER-KOYMANS-PAGANO/1`: The family 𝒟 and its truncation 𝒟(X) | §1, running text before Theorem 1.1, p. 2 (arXiv v1) | developed: `ArithmeticStatistics:ST.0/negative-pell-radicands` |
| `PAPER-KOYMANS-PAGANO/6`: Prior bounds towards Stevenhagen's conjecture (cited) | §1, running text, p. 2 (arXiv v1) | imported: `ArithmeticStatistics:ST.5` |
| `PAPER-KOYMANS-PAGANO/205`: D_{2,n} and P_Sym(r, n) | §7.3, running text before Theorem 7.13, p. 74 (arXiv v1) | imported: `ArithmeticStatistics:ST.5/symmetric-matrix-kernel-law` |
| `PAPER-KOYMANS-PAGANO/207`: MacWilliams' count of symmetric matrices over 𝔽₂ and the limit of P_Sym | §7.3, proof of Theorem 7.13, p. 74 (arXiv v1) | imported: `ArithmeticStatistics:ST.5/macwilliams-symmetric-rank-count` |
| `PAPER-KOYMANS-PAGANO/218`: The identity [KP3, (A.2)] | §8, proof that Theorem 8.1 implies Theorem 1.1, p. 76 (arXiv v1) | imported: `ArithmeticStatistics:ST.5/koymans-pagano-rank-identity` |
| `PAPER-KOYMANS-PAGANO/265`: P(m, n, j): the kernel law of uniformly random m × n matrices over 𝔽₂ | §8, p. 75 (arXiv v1) | imported: `ArithmeticStatistics:ST.5/matrix-kernel-law-over-a-finite-field` |
| `PAPER-LIPNOWSKI-TSIMERMAN-18/unpolarized-count`: Unweighted abelian-variety count | §0 p.1 | developed: `ArithmeticStatistics:ST.0/unpolarized-abelian-count` |
| `PAPER-LIPNOWSKI-TSIMERMAN-18/ppav-count`: Unweighted principally polarized count | §0 pp.1–2 | developed: `ArithmeticStatistics:ST.0/principally-polarized-count` |
| `PAPER-LIPNOWSKI-TSIMERMAN-18/polarization-fiber`: Number of polarizations on a fixed variety | §4.4; Conjecture 5.2 | developed: `ArithmeticStatistics:ST.0/polarization-fiber-count` |
| `PAPER-SHENDE-TSIMERMAN-17/natural-measure`: Normalized inverse-automorphism bundle measure | §1 p.2 | developed: `ArithmeticStatistics:ST.0/natural-bundle-law` |
| `PAPER-SHENDE-TSIMERMAN-17/tail-mass`: Bundle-measure parity tails | §1 p.2 | developed: `ArithmeticStatistics:ST.0/bundle-parity-tails` |
| `PAPER-SHENDE-TSIMERMAN-17/pic-quotient`: Finite Picard quotient and uniform law | §1; §4.1 | developed: `ArithmeticStatistics:ST.0/finite-picard-quotient` |
| `PAPER-SHENDE-TSIMERMAN-17/joint-measure`: Joint bundle pushforward | Conjecture 1.2; Theorem 4.4 | developed: `ArithmeticStatistics:ST.0/finite-joint-bundle-mass` |
| `PAPER-SHENDE-TSIMERMAN-17/joint-normalization`: Correct joint tail normalization | Theorem 4.4 proof, p.33 | developed: `ArithmeticStatistics:ST.0/theta-tail-normalization` |
| `PAPER-SHENDE-TSIMERMAN-17/parity-limit`: Parity-conditioned product law | Theorem 4.4; Sawin Theorem 1.7 | developed: `ArithmeticStatistics:ST.0/parity-product-candidate` |
| `PAPER-SHENDE-TSIMERMAN-17/hecke-measure`: Hecke measure with automorphism weights | Appendix A.4 | developed: `ArithmeticStatistics:ST.0/hecke-pushforward` |
| `PAPER-SHENDE-TSIMERMAN-17/picard-degree-representative`: Unique degree representative of a Picard parity class | N3; degree bookkeeping for §4 tail probabilities | developed: `ArithmeticStatistics:ST.0/picard-representatives-and-carry` |
| `PAPER-SHENDE-TSIMERMAN-17/picard-parity-carry`: Carry term in the Picard quotient coordinates | N3; quotient acceptance contract | developed: `ArithmeticStatistics:ST.0/picard-representatives-and-carry` |
| `PAPER-SHENDE-TSIMERMAN-17/one-tail-event-bijection`: Single bundle tails count rational theta points | N4; v1 Theorem 4.2 finite counting input | developed: `ArithmeticStatistics:ST.0/theta-tail-normalization` |
| `PAPER-SHENDE-TSIMERMAN-17/joint-tail-event-bijection`: Typed joint-tail intersection and normalization | N4; v1 p.33 repaired count | developed: `ArithmeticStatistics:ST.0/theta-tail-normalization` |
| `PAPER-SHENDE-TSIMERMAN-17/pointless-finite-bundle-law`: Exact bundle law on the pointless genus-two curve over F₃ | N5; finite counting regression | developed: `ArithmeticStatistics:ST.0/pointless-curve-regression` |
| `PAPER-SKOROBOGATOV-SOFOS-23/2`: Relative coefficient-height density | Published §1; Theorems 5.3,5.8,6.1 | developed: `ArithmeticStatistics:ST.0/density-denominator-comparisons` |
| `PAPER-WOOD-19/2`: Outside involutions | §1 pp.1–2 | developed: `ArithmeticStatistics:ST.0/wood-outside-involutions` |
| `PAPER-WOOD-19/3`: Admissible wreath subgroup | §1 p.2 | developed: `ArithmeticStatistics:ST.0/wood-admissible-type` |
| `PAPER-WOOD-19/4`: Good subgroup | §1 p.2; §6 p.27 | developed: `ArithmeticStatistics:ST.0/wood-good-type` |
| `PAPER-WOOD-19/5`: Type-preserving automorphisms | §1 p.2 | developed: `ArithmeticStatistics:ST.0/wood-type-automorphisms` |
| `PAPER-WOOD-19/6`: Global-field and infinity conventions | §2 pp.5–6 | developed: `ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter` |
| `PAPER-WOOD-19/7`: Maximal unramified extension split at infinity | §2 pp.5–6 | developed: `ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter` |
| `PAPER-WOOD-19/8`: Continuous surjection moment input | §2 pp.5–6 | developed: `ArithmeticStatistics:ST.0/wood-continuous-surjections` |
| `PAPER-WOOD-19/9`: Imaginary wreath embedding | §2 p.5 | developed: `ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter` |
| `PAPER-WOOD-19/10`: Imaginary extension type | §2 p.5 | developed: `ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter` |
| `PAPER-WOOD-19/11`: Discriminant slices | §2 pp.5–6 | developed: `ArithmeticStatistics:ST.0/wood-average-normalizations` |
| `PAPER-WOOD-19/12`: Imaginary rigid finite-height average | §2 p.5, (2.1)–(2.3) | developed: `ArithmeticStatistics:ST.0/wood-average-normalizations` |
| `PAPER-WOOD-19/14`: Real twist | §2 p.6 | developed: `ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter` |
| `PAPER-WOOD-19/15`: Real rigid average | §2 p.6 | developed: `ArithmeticStatistics:ST.0/wood-average-normalizations` |
| `PAPER-WOOD-19/16`: Real rigidification multiplicity | §2 pp.6–7 | developed: `ArithmeticStatistics:ST.0/wood-average-normalizations` |
| `PAPER-WOOD-19/28`: Root-of-unity correction subgroup | §1 pp.2–3; §3 p.9 | developed: `ArithmeticStatistics:ST.0/wood-root-unity-and-tame-comparison` |
| `PAPER-WOOD-19/98`: Restriction to tame quadratic extensions | §5 p.26 | developed: `ArithmeticStatistics:ST.0/wood-root-unity-and-tame-comparison` |

## Sources actually read for this part

The packet records URL, edition, access date and SHA-256 for each acquired text.
Read ranges below describe this worker's primary-source reading, independently
of the accepted extraction's earlier full-paper reading. Unchanged imported
targets retain their accepted source routes. The original Cohen–Lenstra text
was not cleared or acquired; the accessible EVW probability passages support
the imported model, with no claim to have read the original proof. No private
library file or source passage is reproduced.

- **[Bhargava, Gross, Wang, A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2)**. arXiv:1310.7692v2. Read: §1 pp.1–2; §3 coefficient and discriminant conventions p.9. SHA-256: `8833a226eea99eab7e48b90de7d747fa535eafe032d5c62fd50812d38ad4c4f2`.
- **[Bhargava, Shankar, Wang, Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3)**. arXiv:1611.09806v3. Read: §1 pp.1–4; strong/weak divisibility pp.4–5; local specifications pp.20–21; monic density formulas pp.27–29. SHA-256: `6a7252706b283de3f1ee254fe6b56fd76e215f789550346aba12861dfd02af83`.
- **[Bhargava, Shankar, Wang, Squarefree values of polynomial discriminants II](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf)**. published Forum of Mathematics Pi 13 (2025), e11. Read: §1 coefficient height and binary discriminant; Appendix A, pp.53–55, including Propositions A.1–A.2. SHA-256: `b6e5d1701f487b813e9d6a0b26f9b8671c02c414996298cbba71fe5060e90740`.
- **[Ash, Brakenhoff, Zarrabi, Equality of Polynomial and Field Discriminants](https://drive.google.com/uc?export=download&id=1lZ2HQrPDEugaMn1J3ERpqDp9g6C-t6Vd)**. published Experimental Mathematics 16 (2007), 367–374; public author link. Read: §§2–3 pp.368–370 (local proportions, Dedekind and Proposition 3.5); §6 pp.370–373 (Propositions 6.4,6.7, Theorem 6.8 and generating-function proof). SHA-256: `b82ee8c71656e034511a5d0d618d359b2dbf13a7f0a5a3e743f9fa12c7de7386`.
- **[Browning, Le Boudec, Sawin, The Hasse principle for random Fano hypersurfaces](https://arxiv.org/pdf/2006.02356v1)**. arXiv:2006.02356v1. Read: §1 pp.1–3; finite primitive coefficient and local-solubility conventions, p.55. SHA-256: `210c746b6b69d466d19a0a90e8f00ca57bf2d4dfb1818b0a9955fe91ae061efb`.
- **[Koymans, Pagano, On Stevenhagen's conjecture](https://arxiv.org/pdf/2201.13424v1)**. arXiv:2201.13424v1. Read: §1 pp.1–2: radicand family and negative Pell subset; prior bounds and their status. SHA-256: `c7a93ffea06491d824d900fe067f6768246e84555fa8da8282833caac7850cbd`.
- **[Lipnowski, Tsimerman, How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1)**. arXiv:1511.02212v1. Read: §1 pp.1–3 (unweighted counts); §4.4 Proposition 4.11 and Examples 4.12–4.13, p.20. SHA-256: `5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a`.
- **[Shende, Tsimerman, Equidistribution in Bun₂(P¹)](https://arxiv.org/pdf/1307.8237v1)**. arXiv:1307.8237v1. Read: Introduction pp.3–5; §4 pp.29–33 (bundle law, Picard quotient, theta tails); §5 pp.38,40 (Hecke conventions). SHA-256: `542a52a2a04b65901a6d753266ef5f44aa73a8bde4dfdf7935ae27d489a5cf29`.
- **[Melanie Matchett Wood, Nonabelian Cohen–Lenstra moments](https://par.nsf.gov/servlets/purl/10152050)**. published Duke Mathematical Journal 168 (2019), 377–427; NSF author manuscript. Read: §1 printed pp.378–379; §2 printed pp.383–387 (types, infinity, rigid averages and Lemma 2.1); §3 definition of arithmetic invariant, imported only. SHA-256: `154e700c1b634b9e9bde4334a19678d05ff98ca18efb6b07cb5b809f2da9c03d`.
- **[Ellenberg, Venkatesh, Westerland, Homological stability for Hurwitz spaces and the Cohen–Lenstra conjecture over function fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf)**. published Annals of Mathematics 183 (2016),729–786. Read: §8 probability/family normalization and surjection moments; these targets retain the accepted ST.5 owner. SHA-256: `6c10d770348c625ad9fe80d2c47093cde2a2ba05f39a28d547743f0f4993a7f6`.
- **[Skorobogatov, Sofos, Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf)**. published Inventiones Mathematicae 231 (2023),673–739. Read: Published §1, coefficient-height and relative-family conventions surrounding Theorems 1.1–1.2, pp.674–675. SHA-256: `8499680e907e06bf0b1eeae0c1bc7d46e5cbe93411388b17e843f3b8c6a0e9b1`.
- **[Bhargava, Klagsbrun, Lemke Oliver, Shnidman, 3-isogeny Selmer groups and ranks of abelian varieties in quadratic twist families over a number field](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf)**. public author copy (2019). Read: §1–2, height and local conditions, pp.1–3. SHA-256: `af4e5ab9b250700c95c09946509e88b8a3f4a4f7efedf6ddc882a5f742478880`.
- **[Bhargava, Shankar, Taniguchi, Thorne, Tsimerman, Zhao, Bounds on 2-torsion in class groups of number fields and integral points on elliptic curves](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf)**. public author copy (2020). Read: §1 introduction and N_n(G,X), N_n(G,F,X) conventions pp.1–3. SHA-256: `bba54fd02aadec75b51f2cdbb312c702c06f44384e45a7ec57832704e4e106ec`.

## Suggested-file interpretation

The file imports individual modules at the stated pins. Every typed construction,
API lemma and unit test has the packet's exact name, and typed tests also appear
as examples. Proofs remain unfinished. The seven nodes with `leanOmission`
state their missing native types in the packet and above; the file reserves
their exact declaration/API/test names in an explicit omission comment. The
β part of the binary-density theorem is one of those boundaries, while its
α assertions are typed. The Hecke and polarization-orbit adapters and the
finite multiplicity transfer are typed generic statements, with their geometric
or arithmetic specialization requested separately. Successful elaboration checks
the proposed types, not the mathematical proofs or supplier implementations.
