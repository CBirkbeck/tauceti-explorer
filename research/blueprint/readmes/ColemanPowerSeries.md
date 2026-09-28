# Continuous arithmetic norms and the evaluation square

**Current checkpoint:** 208 unchecked nodes: 2 definitions, 21 constructions,
146 lemmas, 26 theorems and 13 comparisons; 112 API items (105 on definitions
and constructions), 159 packet tests (77 on definitions and constructions),
161 typed examples, 12 planets and 263 baseline citations. Six gaps, twelve
requests, thirteen inherited source findings and zero closed stages remain.
Earlier numerical checkpoint summaries below are historical.

Fix any prime p, including 2. Use the actual cyclotomic fields K_n inside
the p-adic algebraic closure, their native integral closures O_n over ℤ_p,
the compatible roots ζ_n and ϖ_n=ζ_n−1. The paper's level is n+1. All
fields, rings and units keep their native topologies. The relative scalar
map is the existing inclusion K_n→K_(n+1), and the relative basis consists
of the first p powers of ζ_(n+1).

Each relative coordinate K_(n+1)→K_n is continuous. Restrict its scalars
to ℚ_p, then apply the native continuity theorem for linear maps from a
finite-dimensional Hausdorff space over a complete nontrivially normed field.
This requires no new normed K_n-module instance. The relative field norm
is the determinant of the multiplication matrix in this basis. Each entry
is a continuous relative coordinate after multiplication by a fixed basis
vector, so the finite determinant expansion proves continuity.

Native preservation of integrality corestricts this field norm to
`ColemanCyclotomic.integralNorm`, a monoid homomorphism O_(n+1)→O_n.
It is continuous for the inherited subtype topologies and agrees exactly
with the field norm after inclusion. On scalars a∈ℤ_p it gives a^p; on the
uniformizer it gives (−1)^(p+1)ϖ_n. This specializes the specified field
norm on the existing integral closures. The general native Algebra.intNorm
construction is already available for its integral-algebra setup and is
not rebuilt here.

Native Units.map and its continuity theorem now give
`ColemanCyclotomic.unitsNorm`, a continuous monoid homomorphism between
actual unit groups. Its value is the integral norm, its inverse law is the
native group-homomorphism law, and scalar units again map to their pth powers.
Full units are treated as topological groups. A ℤ_p-module structure is not
asserted for them.

Write B=ℤ_p[[T]], Y=1+T, φ(T)=Y^p−1, and ε_n for the existing convergent
seriesEvaluation at ϖ_n. Equation (10-1) becomes an equality in K_(n+1):

ε_(n+1)(φF)=ι(ε_n(F)).

First prove it on polynomials using ζ_(n+1)^p=ι(ζ_n). Both maps are
continuous in the coefficient topology, so native polynomial truncation
convergence proves it for every integral series. Frobenius continuity follows
from the existing coordinate assembly on the zeroth single-coordinate family.

Apply this equation to the formal basis expansion F=Σ_i φ(c_i)Y^i.
The upper evaluation is Σ_i ι(ε_n(c_i))ζ_(n+1)^i. Uniqueness in the existing
relative basis identifies its coordinates with those lower evaluations.
Applying the coordinate formula to F Y^j identifies the entire multiplication
matrix of ε_(n+1)(F) with the formal Frobenius multiplication matrix of F,
entrywise evaluated by ε_n. The formal matrix retains the explicit Frobenius
scalar algebra; replacing it with the ordinary self-algebra gives the wrong
matrix and norm.

Taking determinants and using native commutation of determinants with ring
homomorphisms proves the actual integral arithmetic square:

integralNorm_n(ε_(n+1)(F))=ε_n(colemanNorm(F)).

This holds for every integral series, including zero and nonunits. Native
unit maps and units extensionality give the square of actual unit groups in
Lemma 10.9. The determinant proof needs no claim that the formal extension
has already split over its original coefficient ring.

Reduction of ε_n(F) is the reduction modulo p of the constant coefficient of
F. Use the native decomposition into the constant term and T times the shifted
series; the residue of ϖ_n is zero. Given any upper unit, use its existing
unit polynomial-series lift. The arithmetic square and colemanNorm(F)≡F
modulo p then show that unitsNorm preserves its residue in ZMod p. In
particular it preserves residue-one units. A norm-fixed unit series therefore
has adjacent norm-compatible actual evaluations. The inverse-limit carrier
and interpolation bijection remain to be constructed.

The full published RJW pages 161–164 and 166–170 were freshly read,
including equation (10-1), all of Lemma 10.9 and the interpolation argument.
The source assumes p odd. Here the dyadic signs are explicit: at p=2,n=0,
the norm of ζ_1−1 is +2 while ζ_0−1=−2, and the root itself has norm −ζ_0.
No unqualified norm compatibility of the dyadic root sequence is inferred.
The thirteen inherited source findings retain their version and review status.
The named local-field, normalized valuation and ramification interfaces remain
with LocalFieldsRamification; general coefficient variants stay explicit.

## Declarations, dependencies and acceptance cases

Each entry uses the actual-carrier conventions above and remains unchecked.

### Continuity of the actual relative coordinates

`ColemanCyclotomic.continuous_relative_coordinate` (lemma). Each coordinate of the existing relative cyclotomic power basis K_(n+1)→K_n is continuous.

A coordinate is K_n-linear. Restrict scalars through the already supplied ℚ_p/K_n/K_(n+1) tower, obtaining a ℚ_p-linear map. The domain is finite-dimensional over ℚ_p and has its Hausdorff native norm topology. The native finite-dimensional linear continuity theorem applies over the complete field ℚ_p. No separately installed normed K_n-module structure is required.

Prerequisites: `ColemanPowerSeries:L0/local-cyclotomic-level`, `ColemanPowerSeries:L0/relative-cyclotomic-basis`, `mathlib:LinearMap.continuous_of_finiteDimensional`.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

### Continuity of the relative field norm

`ColemanCyclotomic.continuous_relative_norm` (lemma). The actual native map Algebra.norm(K_n):K_(n+1)→K_n is continuous.

Use native norm_eq_matrix_det with the existing relative basis. Its (i,j) entry is the ith coordinate of x times the jth fixed basis vector. Multiplication by a fixed field element is continuous, and the preceding coordinate theorem gives continuity of every matrix entry. The native finite determinant expansion is a finite sum of products of these continuous functions.

Prerequisites: `ColemanPowerSeries:L0/relative-coordinate-continuity`, `mathlib:Algebra.norm_eq_matrix_det`, `mathlib:Algebra.leftMulMatrix_eq_repr_mul`, `mathlib:Matrix.det_apply`.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

### Relative norm on the actual integral closures

`ColemanCyclotomic.integralNorm` (construction). Corestrict the native field norm to a monoid homomorphism integralNorm_n:O_(n+1)→O_n, using native preservation of integrality.

For x in the actual integral closure, its field value is integral over ℤ_p. Native Algebra.isIntegral_norm over the existing scalar tower proves that its relative norm is again integral over ℤ_p. Use this witness in the existing integral-closure subtype, and restrict the native field-norm monoid homomorphism. No second general norm construction or integral-ring carrier is introduced. Zero follows from the finite nonzero-rank field norm. On a scalar from ℤ_p, the native basis-cardinality norm formula gives the pth power. The existing relative difference norm and injectivity of the integral inclusion give the signed difference formula.

Prerequisites: `ColemanPowerSeries:L0/relative-cyclotomic-degree`, `ColemanPowerSeries:L0/relative-cyclotomic-basis`, `ColemanPowerSeries:L0/relative-cyclotomic-basis-dimension`, `ColemanPowerSeries:L0/relative-cyclotomic-difference-norm`, `mathlib:Algebra.isIntegral_norm`, `mathlib:Algebra.norm_algebraMap_of_basis`.

API:

- `integralNorm_zero`: The zero integral element maps to0.
- `integralNorm_scalar`: A scalar a∈ℤ_p maps to the scalar a^p.
- `integralNorm_difference`: The norm of ϖ_(n+1) is (−1)^(p+1)ϖ_n.

Typed acceptance cases:

- `RelativeNormTests.integral_zero`: The actual integral norm sends0 to0.
- `RelativeNormTests.integral_prime`: The rational prime maps to p^p, not to p.
- `RelativeNormTests.dyadic_difference`: At p=2,n=0, the norm of ζ_1−1 is+2 although ζ_0−1=−2.

Acceptance: Native Algebra.intNorm is already available for its integral-algebra setup; it is not replanned. This adapter corestricts the specified field norm to these actual subtypes without assuming that additional relative integral-algebra setup.

### The integral norm agrees with the native field norm

`ColemanCyclotomic.integralNorm_field` (lemma). Including integralNorm_n(x) into K_n gives Algebra.norm(K_n) of the field value of x.

Unfold the preceding corestriction. The integral-closure inclusion forgets only the integrality proof, leaving the original field norm.

Prerequisites: `ColemanPowerSeries:L0/integral-relative-norm`.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

### Continuity of the integral norm transition

`ColemanCyclotomic.continuous_integralNorm` (lemma). The map integralNorm_n:O_(n+1)→O_n is continuous in the inherited norm topologies.

The domain inclusion into K_(n+1) is continuous. Compose it with the preceding continuous field norm. The codomain O_n has its native subtype topology; the corestriction continuity criterion and the field-value identity give the result.

Prerequisites: `ColemanPowerSeries:L0/relative-field-norm-continuity`, `ColemanPowerSeries:L0/integral-relative-norm-field`.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

### Continuous norm transitions on actual units

`ColemanCyclotomic.unitsNorm` (construction). Bundle Units.map(integralNorm_n) as a native ContinuousMonoidHom from O_(n+1)ˣ to O_nˣ.

Apply native Units.map to the existing integral norm monoid homomorphism. Inverse values are automatically the norms of the inverse units. Native Continuous.units_map transfers the preceding continuity to the genuine units topologies, controlling both the element and its inverse. Bundle in the existing ContinuousMonoidHom carrier. The value formula is the native Units.map value. Its inverse law is monoid-hom functoriality on groups; the scalar-unit formula follows by units extensionality and the integral scalar formula.

Prerequisites: `ColemanPowerSeries:L0/integral-relative-norm`, `ColemanPowerSeries:L0/integral-relative-norm-continuity`, `mathlib:Continuous.units_map`.

API:

- `unitsNorm_coe`: The underlying integral element is integralNorm_n of the underlying input.
- `unitsNorm_inv`: The norm of an inverse unit is the inverse norm.
- `unitsNorm_scalar`: A unit a from ℤ_p maps to its pth power at the lower level.

Typed acceptance cases:

- `RelativeNormTests.unit_identity`: The identity unit maps to the identity.
- `RelativeNormTests.unit_minus_one`: The unit−1 maps to(−1)^p, including+1 at p=2.
- `RelativeNormTests.unit_root`: A unit whose value is ζ_(n+1) maps to the unit with value(−1)^(p+1)ζ_n.

Acceptance: Full units have a topological group structure. No ℤ_p-module or pro-p hypothesis is asserted for them.

### Frobenius substitution and the actual tower evaluation

`ColemanCyclotomic.seriesEvaluation_phi_field` (lemma). In K_(n+1), the value of ε_(n+1)(φF) equals the inclusion of ε_n(F).

For polynomial F, use the existing evaluation comparison and ζ_(n+1)^p=ι(ζ_n). Substitution T↦(1+T)^p−1 therefore evaluates at ϖ_n under the lower field inclusion. Both maps on B are continuous: write φ as the existing continuous coordinate assembly on the zeroth single-coordinate family, and use evaluation continuity and the actual field inclusion. Native polynomial truncations converge in the coefficient topology. Pass the polynomial identity through these limits in the Hausdorff upper field. There is no evaluation at a noncontracting point.

Prerequisites: `ColemanPowerSeries:L0/cyclotomic-evaluation-polynomial`, `ColemanPowerSeries:L0/cyclotomic-series-evaluation`, `ColemanPowerSeries:L0/local-cyclotomic-level`, `ColemanPowerSeries:L0/cyclotomic-root-compatibility`, `ColemanPowerSeries:L1/frobenius-scalar-map`, `ColemanPowerSeries:L1/frobenius-coordinate-continuity`, `mathlib:PowerSeries.WithPiTopology.tendsto_trunc_atTop`.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

### Specialization of Frobenius coordinates to the relative basis

`ColemanCyclotomic.seriesEvaluation_phiBasis_coordinates` (comparison). Reindex the existing relative power basis to Fin p. The ith relative coordinate of ε_(n+1)(F) is the field value of ε_n of the ith formal Frobenius coordinate of F.

Apply ε_(n+1) to the existing formal expansion F=Σ_i φ(c_i)Y^i. It preserves the finite sum and product. The preceding evaluation lemma sends each φ(c_i) to the inclusion of ε_n(c_i), while Y evaluates to ζ_(n+1). These are exactly the existing relative basis powers. Use uniqueness of coordinates in that basis. Reindex only along the established dimension equality; no new basis choice or splitting field is introduced.

Prerequisites: `ColemanPowerSeries:L1/arithmetic-frobenius-evaluation`, `ColemanPowerSeries:L1/frobenius-basis-expansion`, `ColemanPowerSeries:L0/relative-cyclotomic-basis`, `ColemanPowerSeries:L0/relative-cyclotomic-basis-generator`, `ColemanPowerSeries:L0/relative-cyclotomic-basis-dimension`.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

### Specialization of the actual multiplication matrix

`ColemanCyclotomic.seriesEvaluation_mulMatrix` (comparison). In the reindexed relative basis, the left multiplication matrix of ε_(n+1)(F) is the formal Frobenius multiplication matrix of F with each coefficient evaluated by ε_n and included into K_n.

The native entry formula is coordinate_i(x times basis_j). Take x to be the upper evaluation of F. The jth relative basis vector is ε_(n+1)(Y^j). Multiplicativity of evaluation identifies the product with ε_(n+1)(F Y^j). Apply the preceding coordinate-specialization theorem to F Y^j. The native entry formula in the explicitly selected Frobenius scalar algebra identifies its formal coordinate with the corresponding formal multiplication entry.

Prerequisites: `ColemanPowerSeries:L1/arithmetic-frobenius-coordinates`, `ColemanPowerSeries:L1/frobenius-basis-values`, `mathlib:Algebra.leftMulMatrix_eq_repr_mul`.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

### The arithmetic Coleman norm and evaluation square

`ColemanCyclotomic.integralNorm_seriesEvaluation` (theorem). For every F∈ℤ_p[[T]], integralNorm_n(ε_(n+1)(F))=ε_n(colemanNorm(F)) in O_n.

Include both sides into K_n. The integral norm field-value lemma identifies the left side with the native field norm. Use the existing relative basis determinant formula and the preceding multiplication-matrix specialization. Native RingHom.map_det commutes the lower evaluation with this finite determinant. The existing Coleman determinant formula identifies that evaluated determinant with ε_n(colemanNorm(F)). The actual integral inclusion is injective, giving equality in O_n.

Prerequisites: `ColemanPowerSeries:L0/integral-relative-norm-field`, `ColemanPowerSeries:L1/arithmetic-multiplication-matrix`, `ColemanPowerSeries:L1/coleman-norm-matrix`, `mathlib:Algebra.norm_eq_matrix_det`, `mathlib:RingHom.map_det`.

Typed acceptance cases:

- `RelativeNormTests.evaluate_constant`: A constant a evaluates through the norm square to the scalar a^p.
- `RelativeNormTests.dyadic_variable`: At p=2,n=0, the norm of the upper evaluation of T is minus its lower evaluation.

Acceptance: The equality holds for all integral power series, including nonunits and zero. No extension of a character across an unrelated total quotient is involved.

### The norm square in actual unit groups

`ColemanCyclotomic.unitsNorm_seriesEvaluation` (lemma). For F∈Bˣ, applying unitsNorm_n after upper evaluation equals lower evaluation after Units.map(colemanNorm).

All horizontal maps are the native Units.map of the existing evaluation ring homomorphisms. Hence their inverses are evaluations of the inverse series. Apply units extensionality, unfold the units lift, and use the preceding equality for the underlying power series.

Prerequisites: `ColemanPowerSeries:L0/continuous-unit-norm`, `ColemanPowerSeries:L1/arithmetic-norm-evaluation`.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

### Reduction of finite-level series evaluation

`ColemanCyclotomic.reduction_seriesEvaluation` (lemma). The residue of ε_n(F) is the reduction modulo p of constantCoeff(F).

Use the native formal identity F=T times its shifted series plus its constant series. Evaluation and reduction are ring homomorphisms. The residue of ϖ_n is0 by the existing root reduction, while scalar reduction agrees with PadicInt.toZMod. The shifted term therefore vanishes. No interchange of an infinite sum with reduction is needed.

Prerequisites: `ColemanPowerSeries:L0/cyclotomic-series-evaluation`, `ColemanPowerSeries:L0/cyclotomic-reduction-root`, `ColemanPowerSeries:L0/cyclotomic-reduction-scalars`, `mathlib:PowerSeries.eq_X_mul_shift_add_const`.

Acceptance: Use the actual carrier, topology and relative scalar inclusion, including p=2.

### The unit norm preserves the actual residue

`ColemanCyclotomic.reduction_unitsNorm` (lemma). For u∈O_(n+1)ˣ, the residue of unitsNorm_n(u) equals the residue of u under the fixed identifications with ZMod p.

Choose the existing unit polynomial-series lift F of u at the upper level. The arithmetic norm square identifies its norm with the lower evaluation of colemanNorm(F). The preceding evaluation-reduction lemma makes both residues constant-coefficient reductions. The existing Coleman congruence colemanNorm(F)≡F modulo p makes these reductions equal. This argument avoids assuming that the relative integer ring already has a separately constructed free basis. In particular, residue1 is preserved.

Prerequisites: `ColemanPowerSeries:L0/cyclotomic-unit-series-evaluation-lift`, `ColemanPowerSeries:L1/arithmetic-unit-norm-evaluation`, `ColemanPowerSeries:L0/arithmetic-evaluation-reduction`, `ColemanPowerSeries:L1/coleman-norm-residue-identity`.

Typed acceptance cases:

- `RelativeNormTests.principal_unit`: A unit with residue1 has norm with residue1.

Acceptance: This supplies preservation of the principal-unit condition, not its pro-p proof or a new module structure.

### Norm-fixed units give compatible finite-level evaluations

`ColemanCyclotomic.normFixedUnits_evaluation_compatible` (lemma). For a unit series F in the existing normFixedUnits subgroup, unitsNorm_n(ε_(n+1)(F))=ε_n(F) as actual units.

The preceding unit-group norm square identifies the left side with the lower evaluation of Units.map(colemanNorm)(F). The existing subgroup membership theorem says that the underlying series is fixed by colemanNorm. Units extensionality identifies the units, giving the required adjacent compatibility.

Prerequisites: `ColemanPowerSeries:L1/arithmetic-unit-norm-evaluation`, `ColemanPowerSeries:L1/coleman-norm-fixed-membership`.

Acceptance: This is the compatibility portion of Proposition10.10. The actual inverse-limit carrier, interpolation injectivity and surjectivity remain explicit work.

## Earlier cyclotomic, norm and Coleman-map developments

> Current checkpoint: the final “Cyclotomic norm valuation and ideal topology”
> section identifies the actual integral closure with the native norm valuation
> ring, its maximal ideal and reduction kernel, and its ideal-power topology.
> Earlier counts and open boundaries retain their historical scope. The owning
> normalized local-field comparison and infinite interpolation remain open.

**Historical packet:** 194 unchecked nodes (2 definitions, 19 constructions,
137 lemmas, 25 theorems and 11 comparisons), 106 API items (99 on definitions
and constructions), 150 packet tests (71 on those objects), 152 typed examples,
12 planets and 258 baseline declarations. Six gaps, twelve requests, thirteen
preserved source findings and zero closed stages remain.

> Historical checkpoint: “Spectral norm and finite-level cyclotomic evaluation”
> specifies the inherited norm, compactness and linear topology on the actual
> cyclotomic integral closure, and its native convergent power-series evaluation.
> Earlier checkpoint counts and boundaries below retain their historical scope.
> General valuation-ring identification, ramification and entire-tower
> interpolation remain open.

**Spectral-evaluation checkpoint:** 183 unchecked nodes (2 definitions, 19 constructions, 131 lemmas,
22 theorems and 9 comparisons), 106 API items (99 on definitions/constructions),
140 packet tests (71 on those objects), 142 typed examples, 12 planets and 246
baseline declarations. Six gaps, twelve requests, thirteen source findings and
zero closed stages remain.

> Historical checkpoint: the final “Algebraic cyclotomic local rings and unit lifts”
> section supplies local/DVR structure and the canonical algebraic residue field.
> Earlier statements that these algebraic structures remain open describe the
> preceding checkpoints. Their comparison with topological local-field data,
> norm compatibility and infinite interpolation remain open.

**Integral-closure checkpoint:** 158 unchecked nodes (2 definition, 110 lemma, 20 theorem, 9 comparison, 17 construction), 94 API items, 121 packet tests (63 on definitions/constructions), 123 typed examples, 12 planets and 203 baseline records. Six gaps, twelve requests, thirteen findings and zero closed stages remain.

Fifteen new L0 entries specify the algebraic integral closure, its integral power basis and quotient by the cyclotomic difference. Earlier checkpoint counts and checks below are historical; current evidence and the precise remaining local-field boundary are recorded at the end.

**Previous algebraic-tower checkpoint:** 143 unchecked nodes (2 definition, 101 lemma, 18 theorem, 9 comparison, 13 construction), 79 API items, 108 packet tests (51 on definitions/constructions), 110 typed examples, 11 planets and 181 baseline records. Six gaps, twelve requests, thirteen findings and zero closed stages remain.

Seventeen L0 entries now specify the local cyclotomic algebraic tower. Earlier validation below is historical; the current evidence is recorded at the end.

**Norm/root-product checkpoint, 27 September 2026.** The packet has 126 unchecked
nodes (2 definitions, 88 lemmas, 17 theorems, 9 comparisons, 10 constructions), 60 API items, 97 packet tests,
99 typed examples, nine planets and 145 baseline references. All 119 predecessor
nodes, 135 baseline objects and 13 source findings are preserved whole. Seven L1
nodes include one promotion of an existing API signature; six new signatures and
five typed examples are appended. Six gaps, 12 requests and zero closed stages
remain. Earlier checkpoint counts and checks below retain their historical scope.

## L1 continuation: determinant norm and root product

Let p be any prime, Z=Z_p, B=Z[[T]] and Y=1+T. The existing scalar algebra of
phi(F)=F(Y^p-1) makes B free of rank p with basis 1,Y,...,Y^(p-1). Write N for its
existing base-valued determinant norm. Let O be the native valuation integer ring
of C_p, j:Z→O the actual PMIA coefficient map, and iota its coefficientwise
power-series extension. In O[[T]] write Y_O=1+T. For a primitive pth root zeta,
tau_i is the actual PMIA continuous ring homomorphism evaluating F at
C(zeta^i)Y_O-1. These translations are not endomorphisms of Z_p[[T]].

The goal is the precise identity

iota(phi(N(F))) = product_(i in Fin p) tau_i(F).

First compare the Frobenius scalars. The maps tau_i and iota are continuous
Z-algebra maps to O[[T]] with structural coefficient map C composed with j.
Their continuity and coefficient behavior come from PMIA and native coefficient
projections. On b=Y^p-1 they agree: both send it to Y_O^p-1, using zeta^p=1.
That common image has zero constant coefficient and is topologically nilpotent
in the native coefficientwise topology. The pinned Tau Ceti theorem
PowerSeries.aeval_subst therefore identifies their values on subst(b,a) for
every a. It applies with nondiscrete p-adic coefficients; the Mathlib theorem
requiring DiscreteUniformity does not apply. Native uniform, complete and
Hausdorff power-series instances and PMIA's integer-ring linear topology supply
the target hypotheses. The existing scalar-map API is promoted to a node to
connect this fact to the actual selected Coleman algebra structure.

Apply a translation to the existing basis expansion of F. If a_k are its actual
phiBasis coordinates, the result is sum_k iota(phi(a_k))(C(zeta^i)Y_O)^k.
Define E to be the native Vandermonde matrix of the elements C(zeta^i)Y_O.
The native left-multiplication matrix M_F consequently satisfies

E map(iota composed with phi, M_F) = diag(tau_i(F)) E.

The tuple defining E is injective: taking constant coefficients reduces equality
to zeta^i=zeta^j, and primitivity gives i=j for indices below p. The native
Vandermonde theorem then gives det(E)≠0 in the domain O[[T]]. Taking determinants
of the matrix equality and cancelling this nonzero factor proves the product
formula. There is no assertion that det(E) is a unit. Inverting root differences
inside O or dividing by p would not justify this integral comparison.

Injectivity of j gives injectivity of iota by the native coefficient-map theorem.
The existing integral PMIA relation psi composed with phi equals identity makes
phi injective. Thus an element G has the displayed root product as iota(phi(G))
if and only if G=N(F). This proves the exact formal uniqueness in Lemma10.8.
It also shows that the product is independent of the chosen primitive root.
For F=T the formula is (-1)^(p-1)(Y_O^p-1); for F=Y it is
(-1)^(p-1)Y_O^p. The distinction and the dyadic minus sign are retained in typed
tests. For F=C(c), the product is C(j(c^p)), and the product at F=1 is one.

### Ownership, sources and boundary

Accepted RS-16 leaves the finite-free Coleman Frobenius/norm comparison in L1.
PMIA L2 owns the actual root translations, integral coefficient maps and bounded
psi; none is reconstructed. Native Mathlib supplies the basis/matrix/determinant
and primitive-root identities, and pinned Tau Ceti supplies nondiscrete
substitution/evaluation. The reviewed AUDIT-24 rows and all five stage contracts
were read. The packet and native-library screen found no existing exact formal
Coleman product comparison; field-only norm formulas and the power-basis formula
for a generator are not substitutes for this integral statement about every F.
Bounded open-PR and community-archive searches found no competing exact interface;
this is not an assertion of global absence.

Fresh reading covered the whole published RJW printed166–168/PDF67–69. The newly
downloaded publication bytes match SHA256
78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6.
Previous arXiv and book readings retain their recorded historical scopes. Existing
ColemanPowerSeries/E2 records the source proof's coefficient-ring/topology gap;
all 13 findings remain unchanged and await independent review. No new finding or
review verdict is added. These nodes give a corrected route to the formal norm
characterization. Arithmetic finite-level norm/evaluation compatibility,
finite-level lifting and interpolation still require the stated continuation.
The all-prime formal algebra does not establish arithmetic interpolation at p=2.

### Structural map of the Frobenius scalar algebra

`ColemanPowerSeries:L1/frobenius-scalar-map` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiScalarAlgebra_map` (lemma).

For every a in B, the structural algebra map of phiScalarAlgebra sends a to phi(a).

Hypotheses:

- p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra.
- O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]].

Proof outline:

1. Unfold the existing scalar algebra selected by the substitution ring homomorphism; its structural map is that same homomorphism. This promotes the existing API signature to an explicit prerequisite node without redeclaring it.

Prerequisites: `ColemanPowerSeries:L1/frobenius-scalar-algebra`.

Acceptance:

- Retain the explicitly selected Frobenius algebra; the ordinary identity self-algebra is not used.

Sources: RJW-published, Lemma10.8 and its proof, printed167/PDF68; full surrounding printed166–168/PDF67–69 freshly read. Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

### Root translations on Frobenius scalars

`ColemanPowerSeries:L1/root-translation-frobenius-scalars` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.rootTranslation_phiScalar` (comparison).

If zeta^p=1 in O, then for every natural i and a in B, tau_i(algebraMap_phi(a))=iota(phi(a)).

Hypotheses:

- p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra.
- O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]].
- zeta is an element of O satisfying zeta^p=1; i is any natural number.

Proof outline:

1. Equip O[[T]] with its native Z-algebra induced by C composed with j. The imported evaluation formula and native evaluation on constants show tau_i preserves this coefficient map; native map_C does the same for iota. Thus each is a Z-algebra homomorphism. Use the imported continuity of tau_i. Coefficientwise continuity of iota follows from continuous j, coeff_map and the native coefficientwise convergence criterion.
2. Set b=Y^p-1. Its constant coefficient is zero, so formal substitution by b has the existing HasSubst proof. The polynomial/natural-power translation formulas and zeta^p=1 give tau_i(b)=Y_O^p-1=iota(b). This common image has constant coefficient zero and hence native HasEval.
3. Use pinned Tau Ceti PowerSeries.aeval_subst on each of the two continuous Z-algebra maps. Native complete, Hausdorff and uniform power-series instances and the imported linear topology of O provide its topological hypotheses. Both right sides are evaluation at the same argument with the same structural coefficient map. Replace algebraMap_phi by phi using the preceding node.
4. This uses the nondiscrete-coefficient Tau Ceti theorem. The similarly named Mathlib substitution-continuity result requiring DiscreteUniformity is not applicable to Z_p or O.

Prerequisites: `ColemanPowerSeries:L1/frobenius-scalar-map`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-continuous`, `PadicMeasuresIwasawaAlgebras:L2/integer-ring-linear-topology`, `PadicMeasuresIwasawaAlgebras:L2/root-translation-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/root-translation-continuous`, `PadicMeasuresIwasawaAlgebras:L2/root-translation-polynomial`, `PadicMeasuresIwasawaAlgebras:L2/root-translation-natural-powers`, `tauceti:PowerSeries.aeval_subst`, `mathlib:PowerSeries.eval₂_C`, `mathlib:PowerSeries.map_C`, `mathlib:PowerSeries.coeff_map`, `mathlib:PowerSeries.WithPiTopology.continuous_coeff`, `mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`, `mathlib:PowerSeries.WithPiTopology.isTopologicallyNilpotent_of_constantCoeff_zero`.

Acceptance:

- The conclusion holds for any pth root, before primitivity is needed. It concerns the Coleman scalar action on the existing PMIA map and introduces no replacement root translation.

Sources: RJW-published, Lemma10.8 and its proof, printed167/PDF68; full surrounding printed166–168/PDF67–69 freshly read. Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

### Root translation of the Frobenius basis expansion

`ColemanPowerSeries:L1/root-translated-frobenius-coordinates` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.rootTranslation_phiBasis_repr` (lemma).

For zeta^p=1 and F in B, tau_i(F)=sum_(k in Fin p) iota(phi((phiBasis.repr F)_k)) (C(zeta^i)Y_O)^k.

Hypotheses:

- p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra.
- O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]].
- zeta^p=1; i is any natural number.

Proof outline:

1. Apply the existing ring homomorphism tau_i to the actual finite Frobenius basis expansion of F. Distribute it over the finite sum and multiplication.
2. The scalar comparison identifies each translated coefficient. The imported natural-power formula identifies tau_i(Y^k) with (C(zeta^i)Y_O)^k. Collect the factors in the receiving commutative ring.

Prerequisites: `ColemanPowerSeries:L1/root-translation-frobenius-scalars`, `ColemanPowerSeries:L1/frobenius-basis-expansion`, `PadicMeasuresIwasawaAlgebras:L2/root-translation-natural-powers`.

Acceptance:

- Use the actual phiBasis coordinates, not coefficients of F in the ordinary monomial basis.

Sources: RJW-published, Lemma10.8 and its proof, printed167/PDF68; full surrounding printed166–168/PDF67–69 freshly read. Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

### Nonvanishing of the root evaluation determinant

`ColemanPowerSeries:L1/root-evaluation-vandermonde-nonzero` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_root_vandermonde_det_ne_zero` (lemma).

For a primitive pth root zeta in O, the native Vandermonde matrix E with E_(i,k)=(C(zeta^i)Y_O)^k, i,k in Fin p, has nonzero determinant.

Hypotheses:

- p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra.
- O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]].
- zeta is primitive of order p.

Proof outline:

1. O is the native integer subring of the field C_p; native instances make O and O[[T]] domains.
2. If C(zeta^i)Y_O=C(zeta^j)Y_O, taking constant coefficients gives zeta^i=zeta^j. Native primitive-root injectivity with i,j<p gives i=j.
3. Apply the native nonzero Vandermonde determinant criterion to this injective tuple.

Prerequisites: `ColemanPowerSeries:L1/frobenius-basis-values`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map`, `mathlib:Matrix.vandermonde`, `mathlib:Matrix.det_vandermonde_ne_zero_iff`, `mathlib:IsPrimitiveRoot.pow_inj`.

Acceptance:

- The determinant is only asserted nonzero. Differences of p-power roots are generally nonunits in O; no inverse determinant or division by p is introduced.

Sources: RJW-published, Lemma10.8 and its proof, printed167/PDF68; full surrounding printed166–168/PDF67–69 freshly read. Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

### Root evaluations intertwine the multiplication matrix

`ColemanPowerSeries:L1/root-translation-multiplication-matrix` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_root_matrix_intertwines` (lemma).

Let M_F be the existing left-multiplication matrix in phiBasis and alpha=iota composed with phi. For primitive zeta, E times map(alpha,M_F)=diag(tau_i(F)) times E in matrices over O[[T]].

Hypotheses:

- p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra.
- O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]].
- zeta is primitive of order p.

Proof outline:

1. For column k, apply the translated basis-expansion formula to F times phiBasis(k). Native leftMulMatrix_eq_repr_mul identifies its coordinates with column k of M_F.
2. The ring-homomorphism law gives tau_i(F times phiBasis(k))=tau_i(F) times tau_i(phiBasis(k)). The imported basis values and root power formula identify the latter factor with E_(i,k).
3. Native matrix multiplication and diagonal multiplication now give the equality entry by entry. The scalar map is alpha=iota composed with phi, so the base variable is embedded before comparing determinants.

Prerequisites: `ColemanPowerSeries:L1/root-translated-frobenius-coordinates`, `ColemanPowerSeries:L1/frobenius-basis-values`, `ColemanPowerSeries:L1/frobenius-multiplication-matrix`, `PadicMeasuresIwasawaAlgebras:L2/root-translation-natural-powers`, `mathlib:Algebra.leftMulMatrix_eq_repr_mul`, `mathlib:Matrix.vandermonde`.

Acceptance:

- This is an intertwining equality, not a conjugacy over the integral ring. The actual basis and actual multiplication matrix are retained.

Sources: RJW-published, Lemma10.8 and its proof, printed167/PDF68; full surrounding printed166–168/PDF67–69 freshly read. Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

### Coleman norm as the product of root translations

`ColemanPowerSeries:L1/coleman-norm-root-product` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_root_product` (comparison).

For every F in B and primitive pth root zeta in O, iota(phi(N(F)))=product_(i in Fin p) tau_i(F) in O[[T]].

Hypotheses:

- p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra.
- O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]].
- zeta is primitive of order p.

Proof outline:

1. Take determinants of the preceding intertwining equality. The native determinant laws give det(E) times alpha(det M_F)=(product_i tau_i(F)) times det(E).
2. Cancel the nonzero det(E) in the domain O[[T]]. Identify det M_F with the actual base-valued N(F) using the existing norm/matrix comparison.
3. The result proves both that the product lies in the embedded Frobenius image and that its preimage is the previously constructed determinant norm. It does not define a second norm.

Prerequisites: `ColemanPowerSeries:L1/coleman-determinant-norm`, `ColemanPowerSeries:L1/coleman-norm-matrix`, `ColemanPowerSeries:L1/root-translation-multiplication-matrix`, `ColemanPowerSeries:L1/root-evaluation-vandermonde-nonzero`, `mathlib:RingHom.map_det`, `mathlib:Matrix.det_mul`, `mathlib:Matrix.det_diagonal`.

Acceptance:

- Retain iota and phi on the left. Omitting phi confuses the base-valued norm with its embedded product. All primes, including p=2, are included.

Typed tests:

- `NormRootTests.one`: The product of root translations of 1 is 1.
- `NormRootTests.constant`: For c in Z_p, the product of root translations of C(c) is C(j(c^p)).
- `NormRootTests.variable`: The product of root translations of T is (-1)^(p-1)(Y_O^p-1), including the minus sign at p=2.
- `NormRootTests.translated_power`: The product of root translations of Y is (-1)^(p-1)Y_O^p, distinguishing the translated variable from T.
- `NormRootTests.root_choice`: For two primitive pth roots zeta and xi in O, the products of their root translations of every F agree.

Sources: RJW-published, Lemma10.8 and its proof, printed167/PDF68; full surrounding printed166–168/PDF67–69 freshly read. Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

### Uniqueness of the root-product norm

`ColemanPowerSeries:L1/coleman-norm-root-product-unique` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanNorm_root_product_iff` (theorem).

For F,G in B and primitive zeta, iota(phi(G))=product_(i in Fin p) tau_i(F) if and only if G=N(F).

Hypotheses:

- p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The existing phiScalarAlgebra has structural map phi, and phiBasis has entries Y^k for k in Fin p. N is the existing base-valued determinant Coleman norm for this scalar algebra.
- O is the existing valuation integer ring of C_p with its induced p-adic topology; j:Z→O is the actual PMIA integralCoefficientMap and iota=PowerSeries.map(j). Power series use the coefficientwise topology. tau_i is the actual PMIA rootTranslation for the explicitly specified root zeta. Write Y_O=1+T in O[[T]].
- zeta is primitive of order p.

Proof outline:

1. Replace the product by iota(phi(N(F))). Native injectivity of coefficientwise PowerSeries.map follows from the imported injectivity of j, giving phi(G)=phi(N(F)).
2. Apply the imported actual bounded integral psi to both sides and use psi composed with phi equals identity. This yields G=N(F). The converse follows by substitution in the product formula.

Prerequisites: `ColemanPowerSeries:L1/coleman-norm-root-product`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map-injective`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-phi`, `mathlib:PowerSeries.map_injective`.

Acceptance:

- This supplies the uniqueness in Lemma10.8 over Z_p. It does not assert finite-level arithmetic norm compatibility, interpolation, or a ramified-coefficient extension.

Sources: RJW-published, Lemma10.8 and its proof, printed167/PDF68; full surrounding printed166–168/PDF67–69 freshly read. Worker decomposition of the determinant/product characterization, correcting the receiving-ring/topology gap recorded as ColemanPowerSeries/E2. The native basis, determinant and root translations are reused; the source does not state these individual matrix or topology bridges.

### Current validation boundary

The entire suggested file compiled with zero errors and 254 proof-placeholder
warnings only; its actual 209-node PMIA supplier compiled with zero errors and
442 such warnings. The import audit byte-checks 2,808 pinned Mathlib modules,
one pinned Tau Ceti module and the actual supplier. The Tau Ceti substitution
module was compiled from its exact pinned source with no errors or warnings.
All planning implementation statuses remain unchecked.

Six separate scratch lemmas compile with no errors, warnings or placeholders,
reaching 1,886 pinned Mathlib modules and the one Tau Ceti module. Three are
unconditional native checks: root Vandermonde nonvanishing, determinant
cancellation, and coefficient-map injectivity. Two adapters prove the matrix
and actual Algebra.norm product identities from explicitly compatible scalar
and evaluation maps and a nonzero determinant. The sixth proves equality after
substitution from explicit continuity, HasEval and agreement hypotheses using
the native Tau Ceti theorem. These do not implement the planned specialization
of the PMIA translations to the Coleman scalar action.

Independent exact finite polynomial arithmetic passes 408 assertions across
81 systems for primes2,3,5,7 in receiving prime fields13,19,31,29 containing
primitive roots of the required orders. Carry matrices for Y^p=1+S, their
embedded determinants, independent root products, Frobenius support and recovery
of the base-valued norm agree. Constant/variable signs, root choice and the
failure with a nonprimitive root are checked. These finite computations do not
prove convergence or the arbitrary infinite-series statement.

### Remaining L1 obligations

- The integral trace/PMIA bounded-psi comparison, zeroth Frobenius coordinate and embedded root-sum formula are supplied. The determinant/root-product comparison and uniqueness now have exact nodes using the actual PMIA translations and native Tau Ceti evaluation/substitution. Arithmetic norm/evaluation compatibility remains required; general coefficient extensions remain supplier work.
- The four RJW Lemma10.11 congruences, inverse-coordinate/norm/trace continuity, and the norm-fixed invertible limit with uniform precision and continuity are supplied. Prove the arithmetic norm/evaluation compatibility and the actual finite-level lifts before using this limit in tower interpolation. The series construction does not itself supply an arithmetic interpolation map.
- Import pinned Weierstrass through PMIA L4 with its nonzero hypothesis; prove interpolation uniqueness, finite-level lifting, compact successive approximation and surjectivity onto the entire norm-compatible tower. Recover Theorems10.2 and10.13, and specify the unramified coefficient/Frobenius variants exactly. The present algebraic basis proof is over ℤ_p only.

## Earlier checkpoint material

**Residue-image checkpoint, 27 September 2026.** This packet has 119 unchecked
nodes, 60 API items, 92 packet tests, 94 typed examples, nine planets and 135
baseline references. Six gaps, 12 requests, 13 source findings and no closed
stages remain. Twelve new declarations complete the proof plan for the
characteristic-p logarithmic image and unconditional surjectivity on norm-fixed
integral units. Earlier validation sections describe historical checkpoints;
the final section gives the current checks and continuation boundary.

# Coleman power series, local units, and cyclotomic-unit quotients

This roadmap connects actual norm-compatible local units with norm-fixed power
series, then with bounded measures and the local cyclotomic-unit quotient. It
builds on the local-field and profinite-group roadmaps and on the bounded
Iwasawa-algebra interfaces. It does not rebuild global cyclotomic-unit subgroups
or turn the local quotient into the Galois main conjecture.

## Conventions and extent

The arithmetic prime p is odd unless a separate dyadic statement is proved.
The field index is n≥1, with K_n=ℚ_p(μ_(p^n)); write G=Gal(ℚ(μ_(p^∞))/ℚ),
Γ for its pro-p factor, and G⁺=G/{±1}. These are different groups.
The source sometimes calls the full group Γ; translate that notation explicitly.

For the natural and signed-integer L2 algebra, R is any commutative ring, B=R[[T]],
Y=1+T and D is the existing formal derivative. No prime or topology is needed
for those declarations. The two p-adic-exponent lemmas explicitly take R=ℤ_p. Write Δ(f)=Y D(f)f⁻¹ for f∈Bˣ. Inverses here are
inverses of actual units; T is not a unit. Additive torsion-freeness, not just
a characteristic-zero label, is required by the kernel theorem. For example,
ℤ×ℤ/3ℤ has characteristic zero but has additive torsion.

The L1 algebra below instead takes B=ℤ_p[[T]] and every prime p, including 2.
The scalar action of B on B is through φ(f)=f(Y^p−1); the norm has the sign
(−1)^(p−1) on Y and T. This wider algebraic statement does not extend the
arithmetic interpolation or quotient theorems to p=2.

The packet has **119 local nodes**: two definitions, ten constructions, 84 lemmas,
16 theorems and seven comparisons. There are 53 nodes in L1, 30 in L2 and 36 in L3. All remain implementation-unchecked; no layer is closed. In particular,
the comparison with the smoothed series F has a concrete denominator-cleared
hypothesis and does not construct a Coleman measure.

The named Lean signatures use `TauCetiRoadmap.Campaign.ColemanPowerSeries`;
names below are relative to it. All 60 API items, 42 definition/construction
tests, 50 other node tests and two additional boundary controls have typed
signatures/examples. The three finite-algebra adapter signatures select existing baseline
constructions; all mathematical proofs and new data are placeholders. The suggested file is a specification, not a formalization.

## Ownership and baseline

The accepted RS-16 assignment is retained. PMIA abbreviates
`PadicMeasuresIwasawaAlgebras`.

| Interface | Owner | Coleman responsibility |
| --- | --- | --- |
| Finite local extensions, units, ramification, unramified Frobenius | LocalFieldsRamification L0–L3 | Construct the particular cyclotomic tower and norm-compatible structures |
| ℤ_p-module structure on abelian pro-p groups | ProfiniteProPGroups L4 | Prove that the principal-unit limit meets the hypotheses |
| Completed action | PMIA L1 | Verify its continuity and module hypotheses |
| Bounded ∂, φ, ψ, restriction, inverse derivative | PMIA L2 | Δ, finite-free norm/trace comparison, and the Coleman composite |
| Weierstrass adapter | PMIA L4, using pinned Mathlib preparation | Interpolation uniqueness and approximation |
| Compact exactness and tensor comparison | PMIA L5 | Prove the arithmetic sequence and its topology |
| Integral denominator q_a, smoothed F_a and normalized ζ_p | DirichletPadicLFunctions L1 | Import the exact denominator/basic-law nodes, prove the finite-sum comparison and Δ comparison, and retain the raw minus sign |
| Global cyclotomic groups and finite index | IntegralIwasawaTheory L0 | Local closure, compatible generator, inverse limit and local quotient |

The reviewed AUDIT-24 entries for all five stages guide this boundary. Norm
transitivity and the ℤ_p Amice equivalence already exist; neither is a new
declaration here. The algebraic nodes directly use the pinned power-series
carrier, derivative, coefficient map, substitution homomorphism, inverse/unit
criterion and multiplication-by-T injectivity, together with exact Dirichlet L1 denominator nodes. In particular the kernel proof
uses `PowerSeries.derivative.ext` with its actual
`IsAddTorsionFree` hypothesis.

The pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The packet lists 109 statement-read
baseline declarations, including the existing determinant norm, trace, finite-basis
and p-adic compactness APIs. No Tau Ceti result is reintroduced under a private
carrier. The search found analytic logarithmic derivatives but no formal
power-series unit Δ at these pins.

## L0. Towers and genuine modules

Construct K_n, its integers and residue fields from the existing local-field
interface. Choose compatible primitive roots and prove the cyclotomic
Eisenstein and relative norm facts; do not insert degree or ramification as
unconstrained fields of a structure. The inverse-limit elements are compatible
families of genuine units, with the norm transition maps.

The principal-unit tower is a closed compact abelian pro-p group. Only after
proving this may one apply the generic ℤ_p-module construction. The full group
has prime-to-p torsion and must not be called a ℤ_p-module. The finite-level
Teichmüller splitting must commute with the norms before passing to the limit:
for an element of μ_(p−1), the relative degree-p norm is its p-th power, hence
the element itself. This is an arithmetic compatibility to prove, not a
consequence of an abstract product decomposition alone. Identify the Tate
module with its actual compatible-root subgroup.

The unramified/semilocal coefficient version includes the coefficient
Frobenius and norm data. Ramified coefficients require their own sourced
statement. All these construction and topology nodes remain to be decomposed;
the L0 continuation record enumerates the precise tasks.

**Acceptance.** Field degrees and ramification agree with the local-field
supplier, norm maps compose, compatible roots give the specified Tate module,
and the torsion/principal splitting is continuous and norm-compatible.

## L1. The Coleman norm operator

Take B=ℤ_p[[T]], Y=1+T and φ(f)=f(Y^p−1), without any coefficient
Frobenius. The source and target of φ have the same carrier but different
roles: the source ring acts on the target by a·x=φ(a)x. The ordinary
self-module has rank one and cannot be used for these constructions.
The Lean prototype passes this scalar structure explicitly to the basis,
its coordinate map, the multiplication matrix, norm and trace.

The coordinate proof does not assume finite freeness. Modulo p, split
coefficients into the p residue classes of their degrees. Changing the
polynomial factors T^j to Y^i uses a unitriangular binomial matrix. This
gives unique residue coordinates. Lift the residual coefficients and divide
by p repeatedly to solve to every finite p-adic precision. Uniqueness modulo
all p powers follows from the same residue calculation and cancellation.
For existence, use nested nonempty closed solution sets in the compact
product of p copies of B with the p-adic coefficient topology. Their
intersection supplies one exact coordinate tuple; no unjustified choice of
compatible finite-level solutions is used.

The matrix formula below fixes rows as output coordinates and columns as
input basis vectors. In the base ring, write Y_base=1+T. Multiplication by Y
is the cyclic shift, with final-column entry Y_base in row zero. At p=2 its
matrix is [[0,Y_base],[1,0]], so its determinant is −Y_base. Subtracting the
identity gives the matrix for T and determinant −T at p=2; at odd p both
signs are positive. Trace is p times coordinate zero. A normalized trace
therefore exists integrally and uniquely, but the bounded ψ operator and its
operator is supplied by PMIA L2. Its comparison with the integral trace is supplied by Coleman L1/coleman-trace-psi below.

The stable node prefix for this tranche is `ColemanPowerSeries:L1/`.
Each declaration below uses the explicit B, Y, φ and prime-p convention above.
The statements extracted from the norm passage include auxiliary coordinate
lemmas supplied here to justify its finite-free input; the source does not
state every helper separately.

### Frobenius scalar algebra

**Node:** `ColemanPowerSeries:L1/frobenius-scalar-algebra`. **Declaration:** `phiScalarAlgebra`. **Kind:** construction.

Equip the existing ring B with its B-algebra structure through φ. Explicitly a·x=φ(a)x and the structural ring map is φ. The source copy of B is the coefficient ring for this algebra; its ordinary self-module structure is a different structure.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. The constant coefficient of Y^p−1 is zero, so the pinned HasSubst criterion applies.
2. Apply RingHom.toAlgebra to the existing substitution homomorphism. This packages the scalar action only; it does not define another bounded Frobenius operator.
3. Use explicit instance arguments for the basis, norm and trace. Installing an implicit self-algebra instance can select the identity homomorphism and is not an acceptable prototype.

**Prerequisites.** `mathlib:PowerSeries.substAlgHom`, `mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'`, `mathlib:RingHom.toAlgebra`.

**Uses.** ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

**API.**

- `phiScalarAlgebra_map` (data): The structural map sends f to f(Y^p−1).
- `phiScalarAlgebra_smul` (characterisation): The induced scalar action is a·x=φ(a)x.
- `phiScalarAlgebra_constant` (compatibility): A scalar constant C(c) acts by ordinary multiplication by C(c).

**Unit tests.**

- `phiScalar_zero` (degenerate): At p=2 the zero scalar sends 1 to 0.
- `phiScalar_X_two` (computation): At p=2 the scalar T sends 1 to 2T+T².
- `phiScalar_not_self` (non-example): At p=2 the action of scalar T on 1 is not T; the coefficient of T is 2 instead of 1.

**Acceptance.** At p=2, T acting on 1 gives 2T+T².

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Coordinates modulo p

**Node:** `ColemanPowerSeries:L1/residue-coordinate-uniqueness`. **Declaration:** `residueCoordinates_unique`. **Kind:** theorem.

For every h∈𝔽_p[[T]], there is a unique tuple (g_i)_(0≤i<p) of 𝔽_p[[T]] such that h=Σ_(i<p)(1+T)^i g_i(T^p).

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Group coefficient indices uniquely as pq+j with 0≤j<p. This writes h=Σ_j T^j h_j(T^p), where coefficient_q(h_j)=coefficient_(pq+j)(h). Use the pinned expand coefficient formula.
2. Change the finite basis T^j to (1+T)^i. The binomial matrix has entries choose(i,j), zeros for j>i and diagonal 1; its inverse is obtained by T^j=((1+T)−1)^j.
3. Existence is the finite binomial expansion on each coefficient block. Uniqueness follows by the inverse change and the disjoint residue supports. No division by p occurs.

**Prerequisites.** `mathlib:PowerSeries.expand`, `mathlib:PowerSeries.coeff_expand`.

**Acceptance.** At p=2, T=(1+T)−1 gives coordinates (−1,1); replacing Y^i by T^i would give (0,1).

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Frobenius coordinate assembly

**Node:** `ColemanPowerSeries:L1/frobenius-coordinate-assembly`. **Declaration:** `phiAssemble`. **Kind:** construction.

Define the ℤ_p-linear map Ξ:B^p→B by Ξ(a)=Σ_(i<p)Y^i φ(a_i). This is a map between existing finite product modules; linearity here is over ℤ_p.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Use the formula with the existing finite sum and substitution homomorphism.
2. Additivity and ℤ_p-linearity follow because substitution fixes constant series and distributes through finite sums.
3. Do not equip the target with the ordinary B-module when asserting B-linearity: the corresponding B-linear formulation uses the scalar algebra above.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-scalar-algebra`.

**Uses.** ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

**API.**

- `phiAssemble_apply` (data): Ξ(a)=Σ_i Y^i φ(a_i).
- `phiAssemble_single` (simp): For i<p, Ξ of the tuple with a in coordinate i and zero elsewhere is Y^i φ(a).
- `phiAssemble_phi_mul` (compatibility): Ξ((a·v_i)_i)=φ(a)Ξ(v), where the input products are ordinary products in B.
- `phiAssemble_continuous` (structure): Ξ is continuous for the coefficientwise p-adic topologies; promoted to a lemma.

**Unit tests.**

- `phiAssemble_zero` (degenerate): At p=3 the zero tuple assembles to zero.
- `phiAssemble_Y_three` (computation): At p=3 the tuple (0,1,0) assembles to Y.
- `phiAssemble_not_ordinary` (non-example): At p=2 the tuple (T,0) assembles to 2T+T² and not T.

**Acceptance.** The tuple supported at coordinate zero with value T assembles to Y^p−1, not T.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Formula for coordinate assembly

**Node:** `ColemanPowerSeries:L1/frobenius-coordinate-formula`. **Declaration:** `phiAssemble_apply`. **Kind:** lemma.

For a∈B^p, Ξ(a)=Σ_(i<p)Y^i φ(a_i).

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Unfold the finite-sum constructor.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-coordinate-assembly`.

**Acceptance.** The coordinate zero contributes φ(a_0), not a_0.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Continuity of coordinate assembly

**Node:** `ColemanPowerSeries:L1/frobenius-coordinate-continuity`. **Declaration:** `phiAssemble_continuous`. **Kind:** lemma.

The map Ξ:B^p→B is continuous for the coefficientwise p-adic topology.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Each coefficient of f(Y^p−1) is a finite sum of coefficients of f, since the substituted polynomial has zero constant coefficient.
2. The pinned substitution coefficient formula expresses that coefficient as a continuous polynomial in finitely many input coefficients.
3. Multiply by Y^i and sum over Fin p. Apply coefficientwise continuity for PowerSeries.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-coordinate-assembly`, `mathlib:PowerSeries.coeff_subst'`, `mathlib:PowerSeries.WithPiTopology.continuous_coeff`, `ColemanPowerSeries:L1/frobenius-coordinate-formula`.

**Acceptance.** Continuity uses the p-adic coefficient topology; no discrete coefficient topology is installed.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Lifting coordinates modulo p powers

**Node:** `ColemanPowerSeries:L1/frobenius-coordinate-congruence-lift`. **Declaration:** `phiAssemble_lift_mod`. **Kind:** lemma.

For every r≥0 and f∈B, there are a∈B^p and h∈B with f=Ξ(a)+p^r h.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. At r=0 choose a=0,h=f. For r=1 reduce f coefficientwise using PadicInt.toZMod, then apply residue-coordinate-uniqueness. Lift each coefficient using its residue representative.
2. Reduction of Y^p−1 is T^p by the binomial theorem in characteristic p. Coefficient-map/substitution compatibility therefore identifies the reduction of Ξ with the residue assembly.
3. The residual f−Ξ(a) has each coefficient in the kernel of toZMod, namely (p). Choose the divided coefficients to form h in B.
4. For the induction step write f=Ξ(a)+p^r h and h=Ξ(b)+p k. Replace a by a+p^r b; ℤ_p-linearity yields the new residual p^(r+1)k.

**Prerequisites.** `ColemanPowerSeries:L1/residue-coordinate-uniqueness`, `ColemanPowerSeries:L1/frobenius-coordinate-assembly`, `mathlib:PadicInt.toZMod`, `mathlib:PadicInt.ker_toZMod`, `mathlib:PadicInt.maximalIdeal_eq_span_p`, `mathlib:PowerSeries.map_subst`, `ColemanPowerSeries:L1/frobenius-coordinate-formula`.

**Acceptance.** The r=0 case is included; no p-adic limit is used for finite-level solvability.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Reflection of coordinate divisibility

**Node:** `ColemanPowerSeries:L1/frobenius-coordinate-congruence-reflection`. **Declaration:** `phiAssemble_dvd_iff`. **Kind:** lemma.

For a∈B^p and r≥0, p^r divides Ξ(a) in B if and only if p^r divides every a_i in B.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. For r=0 both sides hold. For r=1, reduce the equation modulo p and use uniqueness of the residue-coordinate expansion of zero. Each coefficient of every a_i is in (p), so coefficientwise division gives a_i=p b_i.
2. For r+1, the r=1 case gives a=p b and Ξ(a)=p Ξ(b). Cancel the nonzero p in the domain B to reduce divisibility to r; apply induction.
3. Conversely factor p^r out of all a_i and use ℤ_p-linearity.

**Prerequisites.** `ColemanPowerSeries:L1/residue-coordinate-uniqueness`, `ColemanPowerSeries:L1/frobenius-coordinate-assembly`, `mathlib:PadicInt.ker_toZMod`, `mathlib:PadicInt.maximalIdeal_eq_span_p`, `mathlib:PowerSeries.map_subst`, `ColemanPowerSeries:L1/frobenius-coordinate-formula`.

**Acceptance.** A nonzero residue in any one component cannot disappear by cancellation among the Y-basis terms.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Uniqueness of integral coordinates

**Node:** `ColemanPowerSeries:L1/frobenius-coordinate-injectivity`. **Declaration:** `phiAssemble_injective`. **Kind:** lemma.

The map Ξ is injective.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. If Ξ(a)=Ξ(b), linearity gives Ξ(a−b)=0.
2. Reflection of divisibility implies every coefficient of each a_i−b_i is divisible by every p^r. Apply ker_toZModPow and ext_of_toZModPow to make each coefficient zero.
3. Use PowerSeries and finite-function extensionality.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-coordinate-congruence-reflection`, `mathlib:PadicInt.ker_toZModPow`, `mathlib:PadicInt.ext_of_toZModPow`.

**Acceptance.** This is uniqueness of all p components, stronger than injectivity of φ alone.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Existence of integral coordinates

**Node:** `ColemanPowerSeries:L1/frobenius-coordinate-surjectivity`. **Declaration:** `phiAssemble_surjective`. **Kind:** theorem.

The map Ξ is surjective.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. For f fixed, let C_r={a∈B^p : p^r divides f−Ξ(a)}. The finite-level lifting lemma makes every C_r nonempty.
2. Each C_r is closed: it is the intersection over all coefficient indices of inverse images of the closed ideal p^rℤ_p under continuous coefficient maps. The ideal is compact as the image of compact ℤ_p under multiplication by p^r, hence closed in the Hausdorff coefficient ring.
3. The coefficientwise product B^p is compact by PadicInt.compactSpace and Pi.compactSpace. C_0 is the whole space and C_(r+1)⊆C_r.
4. Apply the pinned Cantor-intersection theorem. A point in every C_r gives f=Ξ(a), since every coefficient of the difference has zero reduction modulo all p^r.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-coordinate-congruence-lift`, `ColemanPowerSeries:L1/frobenius-coordinate-continuity`, `mathlib:PadicInt.compactSpace`, `mathlib:Pi.compactSpace`, `mathlib:IsCompact.nonempty_iInter_of_sequence_nonempty_isCompact_isClosed`, `mathlib:PadicInt.ker_toZModPow`, `mathlib:PadicInt.ext_of_toZModPow`.

**Acceptance.** The finite-level tuples are not presumed compatible; nested compact solution sets supply an exact tuple.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Frobenius power basis

**Node:** `ColemanPowerSeries:L1/frobenius-power-basis`. **Declaration:** `phiBasis`. **Kind:** construction.

Construct the basis (1,Y,…,Y^(p−1)) of B over B with scalar algebra φ. Equivalently every f has a unique expansion Σ_i Y^i φ(a_i). Its rank is exactly p.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. The assembly injectivity says the p specified vectors are linearly independent for the φ scalar action.
2. Surjectivity says they span. Apply the existing Basis.mk construction, converting the finite coefficient function to Finsupp.
3. Use the actual scalar algebra argument explicitly, so this cannot elaborate as a basis of the ordinary rank-one self-module.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-scalar-algebra`, `ColemanPowerSeries:L1/frobenius-coordinate-injectivity`, `ColemanPowerSeries:L1/frobenius-coordinate-surjectivity`, `mathlib:Module.Basis.mk`, `ColemanPowerSeries:L1/frobenius-coordinate-formula`, `mathlib:Module.finrank_eq_card_basis`.

**Uses.** ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

**API.**

- `phiBasis_apply` (data): The basis vector with index i<p is Y^i; promoted to a lemma.
- `phiBasis_repr_sum` (characterisation): For every f, f=Σ_i φ((phiBasis.repr f)_i)Y^i; promoted to a lemma.
- `phiBasis_repr_phi_mul` (compatibility): Coordinates of φ(a)f are a times the coordinates of f.
- `phiBasis_rank` (structure): The finrank of B with its explicitly chosen Frobenius module structure is p; finite freeness is already supplied by the actual finite basis.

**Unit tests.**

- `phiBasis_zero_two` (degenerate): At p=2 the zeroth basis vector is 1.
- `phiBasis_one_three` (computation): At p=3 the vector with index 1 is Y.
- `phiBasis_carry_two` (compatibility): At p=2, Y² has coordinates (Y,0), not (0,Y); this tests the structural map.

**Acceptance.** The scalar T multiplies Y^(p−1) to (Y^p−1)Y^(p−1), not T Y^(p−1) with an ordinary action.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

**Planet:** Frobenius power basis.

### Values of the Frobenius basis

**Node:** `ColemanPowerSeries:L1/frobenius-basis-values`. **Declaration:** `phiBasis_apply`. **Kind:** lemma.

For every i∈Fin p, the i-th vector of phiBasis is Y^i.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Apply Basis.mk_apply to the family used by the basis constructor.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-power-basis`, `mathlib:Module.Basis.mk_apply`.

**Acceptance.** The index zero gives 1.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Coleman determinant norm

**Node:** `ColemanPowerSeries:L1/coleman-determinant-norm`. **Declaration:** `colemanNorm`. **Kind:** construction.

Define N:B→*B to be the existing Algebra.norm for B with its explicitly chosen Frobenius scalar algebra. The output belongs to the source copy of B, so no separately defined inverse of φ on a range subtype is required.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Apply the pinned Algebra.norm to the exact Frobenius algebra. The basis theorem makes this the determinant of a genuine rank-p multiplication matrix.
2. Use norm_eq_matrix_det to expose its value in the Frobenius basis. The norm’s existing multiplicative structure gives the monoid homomorphism and its induced map on units.
3. The product over p-th roots of unity is a comparison to prove after completed coefficient extension; it is not used as an ill-typed definition over ℤ_p.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-power-basis`, `mathlib:Algebra.norm`, `mathlib:Algebra.norm_eq_matrix_det`.

**Uses.** ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

**API.**

- `colemanNorm_def` (compatibility): N is Algebra.norm with the explicit Frobenius algebra structure.
- `colemanNorm_matrix` (characterisation): N(f)=det(leftMulMatrix(phiBasis,f)).
- `colemanNorm_one` (simp): N(1)=1.
- `colemanNorm_mul` (structure): N(fg)=N(f)N(g).
- `colemanNorm_phi` (relation): N(φ(a))=a^p; promoted to a lemma.
- `colemanNorm_constant` (simp): N(C(c))=C(c^p); promoted to a lemma.
- `colemanNorm_Y` (relation): N(Y)=(−1)^(p−1)Y; promoted to a lemma.

**Unit tests.**

- `colemanNorm_one_three` (degenerate): At p=3, N(1)=1.
- `colemanNorm_two_three` (computation): At p=3, N(2)=8, not 2.
- `colemanNorm_Y_two` (non-example): At p=2, N(Y)=−Y and N(Y)≠Y.
- `colemanNorm_X_three` (compatibility): At p=3, N(T)=T; this matches the source’s odd-prime normalization.

**Acceptance.** At p=2, N(Y)=−Y; at odd p, N(Y)=Y.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

**Planet:** Coleman norm.

### Integral Coleman trace

**Node:** `ColemanPowerSeries:L1/coleman-integral-trace`. **Declaration:** `colemanTrace`. **Kind:** construction.

Define τ:B→+B to be the existing Algebra.trace for the Frobenius scalar algebra, with its additive homomorphism retained. It satisfies τ(φ(a)f)=aτ(f). The codomain carries ordinary base-ring multiplication; it is not the Frobenius self-module.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Apply the pinned trace definition with the explicit algebra argument and forget to its additive homomorphism for the standalone prototype.
2. Use the basis and trace_eq_matrix_trace for computations. Its B-linearity is stated as the explicit semilinear formula on ordinary series, which avoids confusing the two self-actions.
3. Divisibility by p is proved from the diagonal calculation; the operator is not defined by dividing an arbitrary series by p.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-power-basis`, `mathlib:Algebra.trace`, `mathlib:Algebra.trace_eq_matrix_trace`.

**Uses.** ColemanPowerSeries:L1, RJW Lemma 10.8 and Coates–Sujatha Proposition 2.2.3: Supply the actual finite-free algebra, its computational coordinates and determinant/trace; interpolation consumes these maps after the still-required evaluation comparison.

**API.**

- `colemanTrace_def` (compatibility): τ is Algebra.trace with the explicit Frobenius scalar algebra, viewed additively.
- `colemanTrace_add` (structure): τ(f+g)=τ(f)+τ(g).
- `colemanTrace_phi_mul` (compatibility): τ(φ(a)f)=aτ(f).
- `colemanTrace_coordinates` (characterisation): τ(f)=p times the zeroth Frobenius-basis coordinate of f; promoted to a lemma.
- `colemanTrace_divisible` (relation): For every f, there is a unique g∈B with τ(f)=pg; promoted to a lemma. The preceding coordinate formula identifies g without constructing another bounded ψ.

**Unit tests.**

- `colemanTrace_zero_three` (degenerate): At p=3, τ(0)=0.
- `colemanTrace_one_three` (computation): At p=3, τ(1)=3; omitting the rank factor gives the wrong answer.
- `colemanTrace_Y_three` (non-example): At p=3, τ(Y)=0, despite the constant coefficient of Y being 1.
- `colemanTrace_phi_three` (compatibility): At p=3, τ(Y³)=3Y, since Y³=φ(Y).

**Acceptance.** τ(1)=p whereas τ(Y)=0.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

**Planet:** Integral Coleman trace.

### Expansion in the Frobenius basis

**Node:** `ColemanPowerSeries:L1/frobenius-basis-expansion`. **Declaration:** `phiBasis_repr_sum`. **Kind:** lemma.

For every f∈B, f=Σ_(i<p)φ((phiBasis.repr f)_i)Y^i.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Apply the existing basis reconstruction formula to f.
2. Replace the basis vectors by their value theorem and the scalar multiplication by φ(a)x.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-basis-values`, `ColemanPowerSeries:L1/frobenius-scalar-algebra`, `mathlib:Module.Basis.sum_repr`.

**Acceptance.** Coordinates are series in the base variable; coefficients pass through φ before multiplying the vectors.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Norm of a Frobenius scalar

**Node:** `ColemanPowerSeries:L1/coleman-norm-base-scalars`. **Declaration:** `colemanNorm_phi`. **Kind:** lemma.

For every a∈B, N(φ(a))=a^p.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Apply norm_algebraMap_of_basis to the rank-p Frobenius basis.
2. Its structural map is φ and Fin p has cardinal p.

**Prerequisites.** `ColemanPowerSeries:L1/coleman-determinant-norm`, `mathlib:Algebra.norm_algebraMap_of_basis`.

**Acceptance.** For a=T, this gives N(Y^p−1)=T^p.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Norm-fixed power-series units

**Node:** `ColemanPowerSeries:L1/coleman-norm-fixed-units`. **Declaration:** `normFixedUnits`. **Kind:** definition.

Define the subgroup B_Nˣ={u∈Bˣ : N(u)=u}, using the existing Units carrier and the norm-induced unit homomorphism. Membership is equality of the underlying series.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. The norm is a monoid homomorphism, so 1 is fixed and the product of two fixed units is fixed.
2. For a fixed unit u, apply N to uu⁻¹=1 and cancel the fixed N(u)=u to see the inverse is fixed.
3. Use Subgroup on Bˣ. No unit tower, evaluation map or interpolation isomorphism is postulated.

**Prerequisites.** `ColemanPowerSeries:L1/coleman-determinant-norm`, `mathlib:Subgroup`.

**Uses.** RJW Proposition 10.10 and Theorem 10.13; ColemanPowerSeries:L3: The interpolation map has this exact domain; the logarithmic-derivative exact sequence in L3 restricts to it. Membership, subgroup extensionality and the constant-unit criterion are needed before identifying the kernel.

**API.**

- `mem_normFixedUnits` (characterisation): u∈B_Nˣ iff N(u)=u as underlying series.
- `normFixedUnits_mk` (constructor): A unit u with N(u)=u gives an element of the subgroup.
- `normFixedUnits_ext` (extensionality): Two subgroup elements are equal iff their underlying power series are equal.
- `normFixedUnits_constant` (characterisation): A constant unit c is norm-fixed iff c^(p−1)=1; promoted to a lemma.

**Unit tests.**

- `normFixedUnits_one_three` (degenerate): At p=3, 1 belongs to the subgroup.
- `normFixedUnits_Y_three` (computation): At p=3, a unit whose value is Y belongs to the subgroup.
- `normFixedUnits_Y_two` (non-example): At p=2, a unit whose value is Y does not belong to the subgroup.
- `normFixedUnits_constant_two_three` (non-example): At p=3 the constant unit 2 is not norm-fixed, since 8≠2 in ℤ_3.

**Acceptance.** The odd-prime unit with value Y is fixed, but its dyadic analogue is not.

**Source.** RJW-published, Lemma 10.8 and Proposition 10.10, printed p.167 / PDF68: multiplicativity and the norm-fixed unit domain. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

**Planet:** Norm-fixed units.

### Matrix formula for the Coleman norm

**Node:** `ColemanPowerSeries:L1/coleman-norm-matrix`. **Declaration:** `colemanNorm_matrix`. **Kind:** lemma.

For every f∈B, N(f) is the determinant of the multiplication-by-f matrix in the Frobenius basis.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Unfold the specialization of Algebra.norm and apply norm_eq_matrix_det to the explicit Frobenius basis.

**Prerequisites.** `ColemanPowerSeries:L1/coleman-determinant-norm`, `mathlib:Algebra.norm_eq_matrix_det`.

**Acceptance.** This formula uses the rank-p Frobenius module.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Multiplication matrix in Frobenius coordinates

**Node:** `ColemanPowerSeries:L1/frobenius-multiplication-matrix`. **Declaration:** `phiBasis_leftMulMatrix`. **Kind:** lemma.

Write c_k=(phiBasis.repr f)_k. In the Frobenius basis, the (i,j) entry of multiplication by f is Σ_(k<p, i≡k+j mod p) c_k Y^⌊(k+j)/p⌋, where the Y on the right is in the base ring. Since 0≤k,j<p, the exponent is zero or one.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Expand f with the basis-expansion node and multiply by the j-th vector Y^j.
2. For each k, write k+j=pq+r. The identity Y^p=φ(Y) rewrites Y^(k+j) as φ(Y^q)Y^r.
3. Uniqueness of basis coordinates gives the entry formula. Cite the pinned leftMulMatrix definition; rows are output coordinates and columns are input vectors.

**Prerequisites.** `ColemanPowerSeries:L1/frobenius-basis-expansion`, `mathlib:Algebra.leftMulMatrix`.

**Acceptance.** At p=2, multiplication by Y is the matrix [[0,Y],[1,0]], not its transpose.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Norm of a constant

**Node:** `ColemanPowerSeries:L1/coleman-norm-constants`. **Declaration:** `colemanNorm_constant`. **Kind:** lemma.

For every c∈ℤ_p, N(C(c))=C(c^p).

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Substitution fixes constant series. Apply the base-scalar norm formula to C(c).

**Prerequisites.** `ColemanPowerSeries:L1/coleman-norm-base-scalars`.

**Acceptance.** At p=3, the norm of the constant 2 is 8, so the norm is not an additive ring endomorphism.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Membership in norm-fixed units

**Node:** `ColemanPowerSeries:L1/coleman-norm-fixed-membership`. **Declaration:** `mem_normFixedUnits`. **Kind:** lemma.

For a power-series unit u, u∈B_Nˣ if and only if N(u)=u as underlying series.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Unfold the subgroup constructor; equality of units is equivalent to equality of their underlying series.

**Prerequisites.** `ColemanPowerSeries:L1/coleman-norm-fixed-units`.

**Acceptance.** The norm is evaluated on the underlying series, with no implicit arithmetic interpolation map.

**Source.** RJW-published, Proposition 10.10, printed p.167 / PDF68: norm-fixed unit domain. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Norm of one plus the variable

**Node:** `ColemanPowerSeries:L1/coleman-norm-Y`. **Declaration:** `colemanNorm_Y`. **Kind:** lemma.

N(Y)=(−1)^(p−1)Y.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. The multiplication-matrix formula for f=Y is the cyclic shift: column j<p−1 has its only nonzero entry 1 in row j+1; the last column has Y in row 0.
2. In the determinant expansion there is exactly one nonzero permutation term, the p-cycle. Its sign is (−1)^(p−1).

**Prerequisites.** `ColemanPowerSeries:L1/coleman-determinant-norm`, `ColemanPowerSeries:L1/frobenius-multiplication-matrix`, `mathlib:Matrix.det_apply`, `ColemanPowerSeries:L1/coleman-norm-matrix`.

**Acceptance.** At p=2 the sign is negative; p odd makes it positive.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Norm of the variable

**Node:** `ColemanPowerSeries:L1/coleman-norm-variable`. **Declaration:** `colemanNorm_X`. **Kind:** lemma.

N(T)=(−1)^(p−1)T.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. Multiplication by T=Y−1 has the cyclic-shift matrix from the multiplication formula minus the identity.
2. A nonzero determinant term either uses every diagonal entry or every shift entry: choosing one shift forces the next at each column around the cycle. The two terms are (−1)^p and (−1)^(p−1)Y.
3. Their sum is (−1)^(p−1)(Y−1).

**Prerequisites.** `ColemanPowerSeries:L1/coleman-determinant-norm`, `ColemanPowerSeries:L1/frobenius-multiplication-matrix`, `mathlib:Matrix.det_apply`, `ColemanPowerSeries:L1/coleman-norm-matrix`.

**Acceptance.** The source’s N(T)=T is recovered for odd p; at p=2 it is −T.

**Source.** CS-2006, Lemma 2.2.5, printed p.17 / PDF27; odd-prime assumption at §1.1, p.1. The dyadic correction here is the direct determinant computation. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Trace in Frobenius coordinates

**Node:** `ColemanPowerSeries:L1/coleman-trace-coordinates`. **Declaration:** `colemanTrace_coordinates`. **Kind:** lemma.

For f∈B, τ(f)=p·(phiBasis.repr f)_0.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. In the multiplication-matrix formula, a diagonal entry has i=j. The congruence k+j≡j mod p with 0≤k<p forces k=0.
2. For k=0 and j<p there is no wrap, so every diagonal entry is c_0. Sum the p diagonal entries using trace_eq_matrix_trace.

**Prerequisites.** `ColemanPowerSeries:L1/coleman-integral-trace`, `ColemanPowerSeries:L1/frobenius-multiplication-matrix`, `mathlib:Algebra.trace_eq_matrix_trace`.

**Acceptance.** If f=Y^i with 0<i<p, the trace is zero; f=1 gives p.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Norm-fixed constant units

**Node:** `ColemanPowerSeries:L1/coleman-fixed-constant-units`. **Declaration:** `normFixedUnits_constant`. **Kind:** lemma.

For c∈ℤ_pˣ, the constant unit C(c) is norm-fixed iff c^(p−1)=1.

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. The norm-of-constants formula reduces fixedness to c^p=c in the unit group.
2. Since p≥2 and c is invertible, cancel c to obtain c^(p−1)=1; multiply by c for the converse.

**Prerequisites.** `ColemanPowerSeries:L1/coleman-norm-fixed-units`, `ColemanPowerSeries:L1/coleman-norm-constants`, `ColemanPowerSeries:L1/coleman-norm-fixed-membership`.

**Acceptance.** At p=2 only the constant 1 is fixed; at odd p, −1 is fixed. This is not yet the full kernel of the Coleman map.

**Source.** RJW-published, Lemma 10.8 and Proposition 10.10, printed p.167 / PDF68: multiplicativity and the norm-fixed unit domain. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Divisibility of the integral trace

**Node:** `ColemanPowerSeries:L1/coleman-trace-divisibility`. **Declaration:** `colemanTrace_divisible`. **Kind:** lemma.

For every f∈B there is a unique g∈B with τ(f)=pg. It equals the zeroth Frobenius coordinate by the preceding coordinate formula; in particular p divides τ(f).

**Hypotheses.** p is a prime, including p=2 for this algebraic part. B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1), using the existing formal substitution homomorphism. The coefficientwise topology uses the usual p-adic topology on ℤ_p. No coefficient Frobenius is applied.

**Proof outline.**

1. The coordinate formula provides g and the equality.
2. Uniqueness follows coefficientwise from cancellation of the nonzero p in ℤ_p, hence in its power-series ring.

**Prerequisites.** `ColemanPowerSeries:L1/coleman-trace-coordinates`.

**Acceptance.** The proof works integrally; p is not inverted in B.

**Source.** RJW-published, Lemma 10.8 and its proof, printed p.167 / PDF 68; finite-free algebra implicit in the degree-p assertion. The stated basis/coordinate calculation is the explicit proof of the finite-free input used here, or a determinant/trace consequence of it. The source does not state every helper separately. The dyadic signs follow from the displayed multiplication matrix, independently of the sources’ odd-prime arithmetic convention.

### Integral norm congruences

All congruences in this section are divisibility statements in B=ℤ_p[[T]].
Write ρ for the existing coefficient reduction to 𝔽_p[[T]], and N^[r] for
r-fold function iteration, with N^[0] the identity. It is essential to
distinguish N^[r](f) from the ordinary power N(f)^r. For a constant c,
the former is c^(p^r), whereas the latter is c^(pr).

The target is exactly the four parts of Rodrigues Jacinto–Williams,
Lemma 10.11, printed p.168. Coates–Sujatha supplies the corresponding
Lemma 2.3.1, Lemma 2.3.2 and Corollary 2.3.3 on pp.18–19. Their unit
iteration argument is retained. The determinant proof below gives the
residue identity for every series and works at every prime, including 2.
These are local algebraic statements; the arithmetic roadmap still uses
its stated odd-prime convention.

Two separate mechanisms enter the proof. Reduction of the determinant
modulo a principal ideal shows that N preserves congruences. The exact
first-order determinant expansion and divisibility of the integral trace
then improve congruences near 1 by one p-power. These mechanisms must not
be confused: preservation alone does not give the improved exponent.

The Frobenius reduction used here is already a composite of pinned
Mathlib facts: coefficient maps commute with valid formal substitution;
in characteristic p the substituted polynomial becomes T^p; expansion
followed by coefficient Frobenius is the p-th power; and Frobenius on
𝔽_p is the identity. This calculation is part of the norm proof. It
introduces no second cyclotomic Frobenius construction: the general
Witt-coefficient action on period rings belongs to
`PadicHodgeTheory:P7:annulus-foundations/cyclotomic-frobenius`.
That node uses W(k), its Frobenius and A_F/p=k((π)); no identification
of those coefficient/topological carriers with B is silently assumed.
The current proof only uses the existing native substitution on B.

#### Coefficient reduction and divisibility

`ColemanPowerSeries:L1/residue-series-congruence` · `map_toZMod_eq_iff`

For f,g∈B, their images under the existing coefficient map ρ=PowerSeries.map(PadicInt.toZMod) are equal if and only if p divides f−g in B.

**Proof.** Equality after ρ is coefficientwise equality in 𝔽_p. By PadicInt.ker_toZMod and maximalIdeal_eq_span_p, it is equivalent to p dividing every coefficient of f−g. Choose one quotient coefficient at each index and assemble the resulting existing power series h. The coefficient formula for multiplication by the constant p gives f−g=p h. Conversely apply ρ to this equality. No boundedness condition on the quotient coefficients beyond membership in ℤ_p is needed.

**Inputs.** `mathlib:PowerSeries.map`, `mathlib:PowerSeries.coeff_map`, `mathlib:PowerSeries.coeff_C_mul`, `mathlib:PadicInt.toZMod`, `mathlib:PadicInt.ker_toZMod`, `mathlib:PadicInt.maximalIdeal_eq_span_p`, `mathlib:Ideal.mem_span_singleton`.

**Source.** Lemma 10.11(i)–(ii), printed p.168 / PDF69; coefficientwise meaning of its congruences. An explicit coefficient-kernel helper for the source congruences, proved from the existing residue homomorphism. It is not a new quotient-ring or reduction-map construction.

**Acceptance.** The condition controls all coefficients, not just the constant coefficient.

The suggested example `residue_series_three_control` checks: In ℤ₃[[T]], ρ(1+3T)=ρ(1), but ρ(1+T)≠ρ(1), despite all three series having constant coefficient 1.

#### Frobenius congruence reflection

`ColemanPowerSeries:L1/frobenius-congruence-reflection` · `phi_sub_one_dvd_iff`

For every f∈B and k≥0, p^k divides φ(f)−1 if and only if p^k divides f−1.

**Proof.** Place f−1 in coordinate 0 and zero in all other coordinates of the existing assembly Ξ. The explicit finite-sum assembly formula reduces to φ(f−1)=φ(f)−1, since Y⁰=1. Apply phiAssemble_dvd_iff to this tuple. All zero coordinates satisfy divisibility automatically, and coordinate 0 gives the desired equivalence. The prime assumption ensures coordinate 0 exists. This includes f=1 and k=0 without choosing a finite valuation.

**Inputs.** `ColemanPowerSeries:L1/frobenius-coordinate-formula`, `ColemanPowerSeries:L1/frobenius-coordinate-congruence-reflection`, `mathlib:PowerSeries.substAlgHom`.

**Source.** Lemma 10.11(i), printed p.168 / PDF69; compare Coates–Sujatha Lemma 2.3.1, printed p.18 / PDF28. The source implication is strengthened to an equivalence using the already planned integral coordinate reflection; the reverse implication is also immediate from φ fixing p.

**Acceptance.** At k=0 both sides are automatic. At p=3, f=1+T satisfies neither side for k=1: φ(f)−1 has a unit coefficient at degree 3.

The suggested example `phi_congruence_three_control` checks: For p=3, 3 does not divide (1+T)³−1 in B, although its coefficients of T and T² are divisible by 3.

#### Norm preservation of congruences

`ColemanPowerSeries:L1/coleman-norm-preserves-congruence` · `colemanNorm_sub_dvd`

For f,g∈B and k≥0, if p^k divides f−g then p^k divides N(f)−N(g). No unit hypothesis is imposed.

**Proof.** Write f−g=p^k h. The native Algebra.leftMulMatrix is an algebra homomorphism, hence a ring homomorphism. Its matrix difference is p^k M_h, because a ring homomorphism sends the natural scalar p to p times the identity. Reduce every entry modulo the principal ideal (p^k) in the base B. The reduced matrices of f and g agree. Apply RingHom.map_det to this quotient map, then the inherited colemanNorm_matrix formula. Ideal.Quotient.mk_eq_mk_iff_sub_mem and Ideal.mem_span_singleton translate equality of the reduced determinants into divisibility. The argument also covers k=0, when the quotient is the zero ring.

**Inputs.** `ColemanPowerSeries:L1/coleman-norm-matrix`, `mathlib:Algebra.leftMulMatrix`, `mathlib:RingHom.map_det`, `mathlib:Ideal.Quotient.mk_eq_mk_iff_sub_mem`, `mathlib:Ideal.mem_span_singleton`.

**Source.** Lemma 10.11(ii)–(iii), printed p.168 / PDF69; norm from Lemma 10.8, p.167 / PDF68. A determinant-polynomial helper for the source congruences. The generic matrix reduction and determinant functoriality already belong to Mathlib and are imported.

**Acceptance.** No additive-homomorphism property of N is asserted. For p=3, the inputs 1 and 1+9 are congruent modulo 9, and their norms are 1 and 1000.

The suggested example `colemanNorm_constant_congruence_nine` checks: For p=3, N(10)−N(1)=999, which is divisible by 9 in ℤ₃[[T]].

#### Coleman norm modulo p

`ColemanPowerSeries:L1/coleman-norm-residue-identity` · `colemanNorm_sub_self_dvd`

For every f∈B, p divides N(f)−f. No unit hypothesis is imposed.

**Proof.** First reduce φ(f) coefficientwise using PowerSeries.map_subst. The native add_pow_char gives ρ(Y^p−1)=T^p; PowerSeries.expand_apply, map_frobenius_expand and ZMod.frobenius_zmod then give ρ(φ(f))=ρ(f)^p=ρ(f^p). Use map_toZMod_eq_iff. These are substitutions into existing identities, not a second construction of P7 cyclotomic Frobenius. Apply preservation of congruences to φ(f) and f^p, using this reduced equality. The inherited base-scalar formula gives N(φ(f))=f^p, and the monoid-homomorphism law gives N(f^p)=N(f)^p. After coefficient reduction, ρ(f)^p=ρ(N(f))^p. Frobenius is injective on the reduced ring 𝔽_p[[T]] by the native frobenius_inj theorem (the power-series ring is a domain). Cancel Frobenius and use map_toZMod_eq_iff to return to divisibility in B. This proof works for nonunits and does not identify the determinant with a product of completed substitutions.

**Inputs.** `ColemanPowerSeries:L1/coleman-norm-preserves-congruence`, `ColemanPowerSeries:L1/coleman-norm-base-scalars`, `ColemanPowerSeries:L1/coleman-determinant-norm`, `ColemanPowerSeries:L1/residue-series-congruence`, `mathlib:frobenius_inj`, `mathlib:PowerSeries.map_subst`, `mathlib:PowerSeries.expand_apply`, `mathlib:PowerSeries.map_frobenius_expand`, `mathlib:ZMod.frobenius_zmod`, `mathlib:add_pow_char`.

**Source.** Lemma 10.11(ii), printed p.168 / PDF69; compare Coates–Sujatha Lemma 2.3.2, pp.18–19 / PDF28–29. Exactly the RJW assertion for all series. Coates–Sujatha states its norm congruence for units. The finite-free determinant proof supplies the stronger all-series statement without using the unfinished completed-substitution comparison.

**Acceptance.** For p=3, N(2)=8 and N(2)−2=6 is divisible by 3 but not by 9.

The suggested example `colemanNorm_mod_three_sharp` checks: In ℤ₃[[T]], 3 divides N(2)−2, but 9 does not.

The suggested example `phi_freshman_two_difference` checks: For p=2, (1+T)²−1−T²=2T≠0 in ℤ₂[[T]].

#### Coleman norm improvement at one

`ColemanPowerSeries:L1/coleman-norm-improves-one-congruence` · `colemanNorm_sub_one_dvd`

For f∈B and k≥1, if p^k divides f−1 then p^(k+1) divides N(f)−1. The assertion is stated for all f satisfying this condition.

**Proof.** Write f=1+p^k h. For M=M_h, the native multiplication-matrix homomorphism gives M_f=I+p^k M. Apply the existing Matrix.det_one_add_smul with scalar p^k. It gives det(I+p^k M)=1+p^k trace(M)+p^(2k) Q for an explicit polynomial evaluation Q∈B; this exact expansion requires no division. Identify trace(M)=τ(h) by the native Algebra.trace_eq_matrix_trace and the inherited trace definition. The existing colemanTrace_divisible gives τ(h)=p b. Both terms p^(k+1)b and p^(2k)Q are divisible by p^(k+1), because k≥1 implies 2k≥k+1. Use the inherited norm-matrix formula.

**Inputs.** `ColemanPowerSeries:L1/coleman-norm-matrix`, `ColemanPowerSeries:L1/coleman-integral-trace`, `ColemanPowerSeries:L1/coleman-trace-divisibility`, `mathlib:Algebra.leftMulMatrix`, `mathlib:Algebra.trace_eq_matrix_trace`, `mathlib:Matrix.det_one_add_smul`.

**Source.** Lemma 10.11(iii), printed p.168 / PDF69; compare Coates–Sujatha Lemma 2.3.2, pp.18–19 / PDF28–29. The source conclusion is proved integrally from norm and trace. Its separate unit hypothesis is unnecessary once the hypothesis f≡1 mod p^k, k≥1, is imposed. The argument covers p=2 and avoids the extended-ideal notation issues E4/E11.

**Acceptance.** The bound k≥1 is essential to this statement: at k=0 the premise holds for f=0, while N(0)−1=−1 is not divisible by p. At p=3, f=4 gives N(f)−1=63, divisible by 9 but not by 27. At p=2, f=3 gives N(f)−1=8, consistent with the required bound 4.

The suggested example `colemanNorm_improvement_three_sharp` checks: In ℤ₃[[T]], N(4)−1=63, 9 divides this difference, and 27 does not.

The suggested example `colemanNorm_improvement_two` checks: In ℤ₂[[T]], N(3)−1=8 and 4 divides it.

The suggested example `colemanNorm_improvement_zero_precision` checks: In ℤ₃[[T]], 1 divides 0−1, while 3 does not divide N(0)−1.

#### Iterated norm improvement at one

`ColemanPowerSeries:L1/coleman-norm-iterated-improvement` · `colemanNorm_iterate_sub_one_dvd`

For f∈B, k≥1 and r≥0, if p^k divides f−1 then p^(k+r) divides N^[r](f)−1.

**Proof.** Induct on r. At r=0 the iterate is f and the exponent is k. Apply colemanNorm_sub_one_dvd to N^[r](f) at precision k+r≥1. The new exponent is k+r+1=k+(r+1). No division or new topology is used.

**Inputs.** `ColemanPowerSeries:L1/coleman-norm-improves-one-congruence`.

**Source.** Proof of Lemma 10.11(iv), printed p.168 / PDF69: iterate part (iii). This makes the induction used in the source proof a reusable declaration, with the initial precision and zero-iterate case explicit.

**Acceptance.** For p=3, f=4, k=1 and r=2, N^[2](4)=4⁹=262144, and 27 divides 262143.

The suggested example `colemanNorm_twice_four` checks: In ℤ₃[[T]], N(N(4))=262144 and 27 divides N(N(4))−1.

#### Coleman norm iteration congruence

`ColemanPowerSeries:L1/coleman-norm-iterate-congruence` · `colemanNorm_iterate_sub_dvd`

For an actual unit u∈Bˣ and integers k₂≥k₁≥0, p^(k₁+1) divides N^[k₂](u)−N^[k₁](u), viewing u in B.

**Proof.** Put r=k₁ and d=k₂−k₁. By induction on d, colemanNorm_sub_self_dvd implies N^[d](u)≡u mod p: add the consecutive differences, each divisible by p. Form h=N^[d](u)·u⁻¹ in B, using the actual inverse of u. Then h−1=(N^[d](u)−u)u⁻¹ is divisible by p. Apply colemanNorm_iterate_sub_one_dvd with initial precision 1 and r iterations to obtain N^[r](h)−1 divisible by p^(r+1). Every iterate of N is a monoid homomorphism. Therefore N^[r](h)·N^[r](u)=N^[r+d](u); multiply the divisibility relation by N^[r](u), and use r+d=k₂. This avoids division by a possibly nonunit series introduced as an untyped quotient.

**Inputs.** `ColemanPowerSeries:L1/coleman-norm-residue-identity`, `ColemanPowerSeries:L1/coleman-norm-iterated-improvement`, `ColemanPowerSeries:L1/coleman-determinant-norm`.

**Source.** Lemma 10.11(iv) and its proof, printed p.168 / PDF69; Coates–Sujatha Corollary 2.3.3, printed p.19 / PDF29. The source statement with explicit iteration and actual units. It is the uniform p-adic estimate used in interpolation, not yet a continuity, convergence or arithmetic-evaluation theorem.

**Acceptance.** At equal indices the difference is zero. For p=3 and the unit 2, k₁=1 and k₂=2 give 512−8=504, divisible by 9 but not by 27. At p=2, N(Y)=−Y and N²(Y)=−Y. The estimate holds despite Y itself not being norm-fixed.

The suggested example `colemanNorm_iteration_three_sharp` checks: For p=3, N(N(2))−N(2)=504; 9 divides it, but 27 does not.

The suggested example `colemanNorm_iteration_dyadic_sign` checks: For p=2 and Y=1+T, N(N(Y))=N(Y)=−Y, while N(Y)−Y=−2Y.

#### Exponent and topology checks

For the improvement theorem, write f=1+p^k h and M for multiplication by h
in the inherited Frobenius basis. Mathlib gives the exact identity

det(I+p^k M) − 1 = p^k trace(M) + p^(2k) Q,

where Q is the evaluation of the polynomial obtained by removing the first
two coefficients of det(I+ZM). Both Q and the trace are integral. The trace
is p times the zeroth Frobenius coordinate of h, and k≥1 gives 2k≥k+1.
This checks the power precisely, including k=1 and p=2. At k=0 the term
p^(2k) has no forced factor p; the zero-series example disproves an
extension to that boundary. No division by p occurs in the proof.

The iteration estimate uses u⁻¹ only for an actual unit u. After applying
the estimate at 1 to h=N^[d](u)u⁻¹, multiply back by N^[r](u).
The monoid-homomorphism law gives

(N^[r](h)−1)N^[r](u) = N^[r+d](u)−N^[r](u).

This is the source's quotient argument with all carriers and iteration
indices explicit. At equal indices the right side is zero; the statement
includes this case. No inverse of T or inverse on all power series appears.

The divisibility bound is uniform in the coefficient index. It is stronger
than any one finite set of coefficient estimates, but its existence is not
itself a continuity proof for N in the coefficientwise p-adic topology.
The next component must prove that the inverse coordinate map is continuous
(the existing assembly is a continuous bijection from a compact space to a
Hausdorff space), then deduce continuity of N from its finite matrix formula.
Combine the estimates with completeness or compactness to construct the
limit and prove it is a unit and fixed by N. These steps realize
Coates–Sujatha Corollary 2.3.4; they do not replace the finite-level
evaluation and lifting arguments of Lemma 2.3.5 and Coleman interpolation.

### Required interpolation and comparison work

The root-of-unity substitutions T↦ηY−1 require coefficients in
O_(ℚ_p(μ_p)) and the completed coefficient topology. Their constant term
is topologically nilpotent, not generally nilpotent, so the formal substitution
criterion used to define φ does not supply them. The product-over-roots formula
for the determinant norm, the analogous trace formula, their descent and the
norm/evaluation comparison remain to be proved. The current determinant
definition avoids treating these substitutions as ℤ_p[[T]] automorphisms.

The seven norm-congruence declarations above now cover all four parts of RJW
Lemma10.11. They supply the uniform p-adic estimate needed for interpolation.
Continuity of the coordinate inverse and norm, convergence of the norm
iterates to a fixed unit, and arithmetic norm/evaluation compatibility remain
separate obligations. The determinant argument proves these congruences
integrally without presupposing the completed product formula.

Interpolation requires finite-zero uniqueness for **nonzero** power series,
finite-level arithmetic lifts, norm iteration and compactness. The compact
coordinate argument above only proves the finite-free basis; it does not
supply the arithmetic interpolation map. The Iwasawa Weierstrass adapter is
imported from PMIA L4, with the nonzero hypothesis recorded in source finding
E10. Identify the actual norm-fixed subgroup with the whole norm-compatible
unit tower, prove surjectivity, and specify the unramified coefficient/Frobenius
variants. The original Coleman source still needs reading.

**Acceptance.** Recover U_∞≃B_Nˣ with its arithmetic and topological
properties and the evaluation/norm identities. The four congruences have
explicit plans; the arithmetic and convergence statements still need their
own declarations and proofs.

## L2. The Coleman map and its sign

### Algebraic declarations

The stable node prefix for the following declarations is
`ColemanPowerSeries:L2/`. Each proof uses only the listed node prerequisites,
the exact Dirichlet denominator nodes, the named pinned baseline, and elementary ring/unit manipulations. The
arithmetic and measure constructions are not hidden prerequisites of these
algebraic statements.

### One denominator owner

Write f_a for the imported `DirichletPadic.smoothingDenominator R a`, whose coefficient in degree n
is choose(a,n+1). Its owner is `DirichletPadicLFunctions:L1/smoothing-denominator`. The concurrently
submitted Dirichlet and Coleman checkpoints had described this same arithmetic object by binomial
coefficients and by a finite geometric sum. This correction makes those descriptions a comparison,
not two definitions.

The following basic laws are imported without local duplicate nodes:

| Law | Exact owner node |
| --- | --- |
| T f_a=(1+T)^a−1 | `DirichletPadicLFunctions:L1/denominator-factorization` |
| constant coefficient a | `DirichletPadicLFunctions:L1/denominator-constant` |
| unit a implies unit f_a | `DirichletPadicLFunctions:L1/denominator-unit` |
| coefficient-map compatibility | `DirichletPadicLFunctions:L1/denominator-coefficient-map` |

The old local factorization, constant, unit-criterion and coefficient-change node IDs are superseded
by these owner nodes. Every consuming edge is redirected. The retained local
`cyclotomic-series` ID now denotes only the finite-sum comparison. Its four tests remain;
they are comparison tests, not evidence for a second definition.

The suggested file uses local notation expanding the exact transparent binomial-coefficient body
of the imported proposed definition. This introduces no Lean declaration or alternate constructor.
The proposed supplier is not falsely imported as an existing compiled library module. On implementation,
replace that notation by the supplier's name and import its module. All mathematical prerequisites
already point to the supplier's exact blueprint nodes.

### Logarithmic derivative

Node `ColemanPowerSeries:L2/logarithmic-derivative`; declaration `logDeriv`.

For f∈Bˣ define Δ_R(f)=Y·D(f)·f⁻¹ in B. This is the weighted formal logarithmic derivative, not an analytic logarithm.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** Use the existing PowerSeries.derivative and the inverse already carried by the unit f. Multiply in B; no convergence or rational coefficients are required.

**Dependencies.** `mathlib:PowerSeries.derivative`

**Acceptance.** Δ(1+T)=1; omitting the factor Y would instead give Y⁻¹.

**Uses.** RJW §12.2.1, Theorem 12.9 and Lemma 12.10: Product, integer powers and chain rule control the norm-fixed logarithmic derivative; kernel constants are the first kernel calculation. ColemanPowerSeries:L2 and L3: The Coleman composite and its kernel use Δ, coefficient change and the twist factor. This checkpoint does not construct the full composite.

**API.**

- `logDeriv_def` — Δ(f)=Y D(f) f⁻¹, with the existing formal derivative and the unit's inverse.
- `logDeriv_one` — Δ(1)=0.
- `logDeriv_mul` — Δ(fg)=Δ(f)+Δ(g); promoted to the product node.
- `logDeriv_inv` — Δ(f⁻¹)=−Δ(f); promoted to the inverse node.
- `logDeriv_zpow` — Δ(fⁿ)=nΔ(f) for n∈ℤ; promoted to integer powers.
- `logDeriv_const` — Δ(C(c))=0 for c∈Rˣ.
- `logDeriv_eq_zero_iff` — With IsAddTorsionFree R, Δ(f)=0 precisely for constant f.
- `logDeriv_map` — Coefficient change commutes with Δ; identity and composition follow from the existing PowerSeries.map laws.
- `logDeriv_subst` — (1+g)Δ(f[g])=Y Dg (Δf)[g] whenever HasSubst g.
- `logDeriv_power_subst` — For natural m, Δ(f[Yᵐ−1])=m(Δf)[Yᵐ−1]; not full p-adic equivariance.

**Tests.**

- `logDeriv_identity` — Over ℚ, Δ(1)=0.
- `logDeriv_one_add_X` — Over ℚ, a unit with value 1+T has Δ=1; detects omission of the weight.
- `logDeriv_inverse_one_add_X` — Over ℚ, the inverse of that unit has Δ=−1; detects the inverse sign.
- `logDeriv_characteristic_three` — Over ℤ/3ℤ, the unit 1+T³ has Δ=0 but is not constant; forbids dropping the additive-torsion-free kernel hypothesis.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Logarithmic derivative of a product

Node `ColemanPowerSeries:L2/logarithmic-derivative-product`; declaration `logDeriv_mul`.

For f,g∈Bˣ, Δ(fg)=Δ(f)+Δ(g).

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** Apply Derivation.leibniz to D(fg). Use (fg)⁻¹=f⁻¹g⁻¹ and commutativity; distribute Y and cancel units.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative`, `mathlib:Derivation.leibniz`

**Acceptance.** The target group is additive: the output is a sum, not a product.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Logarithmic derivative of an inverse

Node `ColemanPowerSeries:L2/logarithmic-derivative-inverse`; declaration `logDeriv_inv`.

For f∈Bˣ, Δ(f⁻¹)=−Δ(f).

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** Use PowerSeries.derivative_inv for the inverse of a unit. Multiply by Yf and cancel f; alternatively use the product lemma at ff⁻¹=1.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative-product`, `mathlib:PowerSeries.derivative_inv`

**Acceptance.** For f=Y, the answer is −1.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Integer powers

Node `ColemanPowerSeries:L2/logarithmic-derivative-integer-powers`; declaration `logDeriv_zpow`.

For f∈Bˣ and n∈ℤ, Δ(fⁿ)=n·Δ(f), where the right side is integer scalar multiplication on the additive group B.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** Induct on nonnegative n with the product lemma. For negative n use the inverse lemma and additive negation; no division by n.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative-product`, `ColemanPowerSeries:L2/logarithmic-derivative-inverse`

**Acceptance.** n=0 gives zero and n=−1 gives the inverse formula.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Constant units

Node `ColemanPowerSeries:L2/logarithmic-derivative-constants`; declaration `logDeriv_const`.

For c∈Rˣ, Δ(C(c))=0, where the constant unit is Units.map of PowerSeries.C.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** PowerSeries.derivative_C makes D(C(c))=0. Substitute in the definition of Δ.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative`, `mathlib:PowerSeries.derivative_C`

**Acceptance.** All constant units, including −1, are killed; this does not assert they are norm-fixed.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Kernel of the logarithmic derivative

Node `ColemanPowerSeries:L2/logarithmic-derivative-kernel`; declaration `logDeriv_eq_zero_iff`.

If the additive group of R is torsion-free, then Δ(f)=0 iff f=C(constantCoeff f), for every f∈Bˣ.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. IsAddTorsionFree R; mere characteristic zero is not substituted for this hypothesis in a ring with additive torsion.

**Construction or proof.** The constant coefficient of Y is 1, so Y is a unit by PowerSeries.isUnit_iff_constantCoeff. Cancel Y and f⁻¹ to deduce D(f)=0. PowerSeries.derivative.ext applied to f and its constant series proves equality; its additive-torsion-free assumption is explicit. The converse is the constant-unit calculation (or derivative_C).

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative-constants`, `mathlib:PowerSeries.derivative.ext`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`

**Acceptance.** In characteristic 3, f=1+T³ is a nonconstant unit with Δ(f)=0; the omitted-hypothesis variant fails.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Coefficient change

Node `ColemanPowerSeries:L2/logarithmic-derivative-coefficient-change`; declaration `logDeriv_map`.

For a commutative-ring homomorphism ρ:R→S, mapping the coefficients of Δ_R(f) gives Δ_S of the mapped unit.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. S is a commutative ring and ρ is a unital ring homomorphism; no injectivity or flatness is required.

**Construction or proof.** Compare coefficient n of D(map ρ f) and map ρ(Df), using coeff_derivative and that ρ preserves natural-number multiplication. The coefficient map preserves Y, products and the inverse of a unit. Apply the definition of Δ.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative`, `mathlib:PowerSeries.map`, `mathlib:PowerSeries.coeff_derivative`

**Acceptance.** Reduction mod 3 commutes with Δ, but the torsion-free kernel theorem need not survive that reduction.

**Source.** Definition 12.8, printed p.180 / PDF 81; Proposition 12.1, pp.177–178, and Remark 12.4, p.179. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Weighted chain rule

Node `ColemanPowerSeries:L2/logarithmic-derivative-substitution`; declaration `logDeriv_subst`.

For g∈B with nilpotent constant coefficient and f∈Bˣ, let f[g] be the unit mapped by the existing substitution homomorphism. Then (1+g)Δ(f[g])=Y·D(g)·(Δ(f))[g].

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. PowerSeries.HasSubst g: the constant coefficient of g is nilpotent. This formal substitution condition does not cover ζ(1+T)−1 over ℤ_p[ζ].

**Construction or proof.** Use PowerSeries.derivative_subst and the substitution homomorphism's preservation of unit inverses. On substituting into Δ(f), the weight Y becomes 1+g. Multiply the two expressions out. No division by g or by 1+g is used.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative`, `mathlib:PowerSeries.derivative_subst`, `mathlib:PowerSeries.substAlgHom`

**Acceptance.** g=T recovers the identity and g=0 makes the left side zero.

**Source.** Proposition 12.5, equation (12-2), printed p.179 / PDF 80; the cross-multiplied general chain rule is the algebraic calculation underlying it. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Cyclotomic substitution

Node `ColemanPowerSeries:L2/logarithmic-derivative-natural-power-substitution`; declaration `logDeriv_power_subst`.

For m∈ℕ and g_m=Yᵐ−1, Δ(f[g_m])=m·(Δ(f))[g_m]. This is a natural-power identity, not a theorem about the full ℤ_pˣ-action.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T.

**Construction or proof.** constantCoeff(g_m)=0, so HasSubst.of_constantCoeff_zero' supplies substitution. D(g_m)=mY^(m−1) for m>0 by derivative_pow and D(Y)=1. Use the weighted chain rule; cancel the unit Yᵐ. For m=0, substitution is constant evaluation and both sides are zero.

**Dependencies.** `ColemanPowerSeries:L2/logarithmic-derivative-substitution`, `mathlib:PowerSeries.derivative_pow`, `mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`, `mathlib:PowerSeries.derivative_X`

**Acceptance.** m=0 and m=1 are required; m=p is the formal Frobenius chain factor p.

**Source.** Proposition 12.5, equation (12-2), printed p.179 / PDF 80; natural-exponent specialization. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Cyclotomic finite-sum comparison

Node `ColemanPowerSeries:L2/cyclotomic-series`; declaration `cyclotomicSeries_def`.

Let f_a be the imported DirichletPadic.smoothingDenominator R a. For every a∈ℕ, f_a(T)=Σ_(0≤i<a)(1+T)ⁱ. This identifies RJW's local cyclotomic formula with the existing planned arithmetic denominator; it is not a second definition.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** Multiply the proposed equality by T. The imported DirichletPadicLFunctions:L1/denominator-factorization identifies the left side with (1+T)^a−1. For the right side, induct on the finite sum (or telescope using T=(1+T)−1) to get the same polynomial. The base a=0 gives zero; the successor step adds T(1+T)^a. Cancel T with the baseline PowerSeries.X_mul_injective, valid even with zero divisors. The identification includes f_0=0 and f_1=1, and introduces no new carrier or inverse of T.

**Dependencies.** `DirichletPadicLFunctions:L1/smoothing-denominator`, `DirichletPadicLFunctions:L1/denominator-factorization`, `mathlib:PowerSeries.X_mul_injective`

**Acceptance.** f_3=3+3T+T², not (1+T)³−1 and not its logarithm.

**Uses.** RJW §10.2, Proposition 10.4: Identify the imported arithmetic smoothing denominator with RJW's local cyclotomic expression, so the unit lift and logarithmic derivative use the identical series. ColemanPowerSeries:L1 and L2: Arithmetic interpolation must identify this explicit series with the series of the genuine norm-compatible unit c(a); that arithmetic identification remains a gap.

**Tests.**

- `cyclotomicSeries_empty` — Over ℤ, f_0=0.
- `cyclotomicSeries_three` — Over ℤ, f_3=3+3T+T².
- `cyclotomicSeries_nonunit_at_three` — Over ℤ/3ℤ, f_3 is not a unit.
- `cyclotomicSeries_coefficient_reduction` — The existing coefficient map ℤ→ℤ/3ℤ sends f_3 to T².

**Source.** §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality. The shared series is imported from DirichletPadicLFunctions:L1; this node only proves its finite geometric-sum formula.

### Multiplication of parameters

Node `ColemanPowerSeries:L2/cyclotomic-series-parameter-product`; declaration `cyclotomicSeries_mul`.

For a,b∈ℕ, f_(ab)(T)=f_a(T)·f_b(Yᵃ−1).

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** The substituted argument has constant coefficient zero, so substitution is a ring homomorphism. Multiply by T and use T f_a=Yᵃ−1 and the substituted geometric factorization for f_b. Both sides multiplied by T become Y^(ab)−1. Cancel T by PowerSeries.X_mul_injective, valid without a domain assumption.

**Dependencies.** `DirichletPadicLFunctions:L1/denominator-factorization`, `mathlib:PowerSeries.substAlgHom`, `mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'`, `mathlib:PowerSeries.X_mul_injective`

**Acceptance.** Either a=0 or b=0 gives zero; a=1 or b=1 gives f of the other parameter.

**Source.** §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Cyclotomic unit series

Node `ColemanPowerSeries:L2/cyclotomic-series-unit`; declaration `cyclotomicSeriesUnit`.

For a∈ℕ whose image in R is a unit, construct the unique element u_a∈Bˣ with value f_a. Its inverse is the formal inverse of f_a, never 1/T.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. ha: IsUnit(a in R). Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** The imported DirichletPadicLFunctions:L1/denominator-unit supplies IsUnit f_a from IsUnit a. Use the existing IsUnit.unit/Units carrier. Uniqueness follows from Units extensionality. For the unit API, coefficient-map compatibility imports denominator-coefficient-map and uses Units extensionality; constant/inverse tests import denominator-constant and the unit inverse laws. These basic denominator facts are not re-planned here.

**Dependencies.** `DirichletPadicLFunctions:L1/denominator-unit`, `DirichletPadicLFunctions:L1/denominator-coefficient-map`, `DirichletPadicLFunctions:L1/denominator-constant`

**Acceptance.** The inverse at a=3 over ℚ has constant coefficient 1/3.

**Uses.** RJW Proposition 10.4 and Definition 12.8: Δ is defined on actual units, so the explicit series requires the proven unit criterion. ColemanPowerSeries:L2: The sign computation uses the same series and its actual inverse, not a private abstract unit type.

**API.**

- `cyclotomicSeriesUnit_val` — The unit has underlying series f_a; promoted to the value node.
- `cyclotomicSeriesUnit_ext` — Every unit with value f_a equals u_a, independently of its proof of invertibility.
- `cyclotomicSeriesUnit_map` — A coefficient homomorphism takes u_a to u_a over the target, with any proof that a is a unit there.
- `cyclotomicSeriesUnit_inv` — f_a times the value of u_a⁻¹ is 1, using the existing Units inverse.

**Tests.**

- `cyclotomicSeriesUnit_one` — Over ℚ, u_1=1.
- `cyclotomicSeriesUnit_three_value` — Over ℚ, u_3 has value 3+3T+T².
- `cyclotomicSeriesUnit_three_inverse` — The constant coefficient of u_3⁻¹ is 1/3.
- `cyclotomicSeriesUnit_three_logDeriv` — For u_3 over ℚ, coefficients zero and one of Δ are 1 and 2/3; detects the wrong logarithmic derivative weight.

**Source.** §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Underlying cyclotomic series

Node `ColemanPowerSeries:L2/cyclotomic-unit-value`; declaration `cyclotomicSeriesUnit_val`.

For ha: IsUnit(a in R), the underlying series of u_a is f_a.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. ha: IsUnit(a in R). Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** The unit constructor chooses a witness to IsUnit f_a; its value is f_a by construction.

**Dependencies.** `ColemanPowerSeries:L2/cyclotomic-series-unit`

**Acceptance.** Changing the proof ha does not change the unit.

**Source.** §10.2 between Lemma 10.3 and Proposition 10.4, printed p.165 / PDF 66. The polynomial claim is restricted to natural a; see E3. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Cyclotomic logarithmic derivative

Node `ColemanPowerSeries:L2/cyclotomic-logarithmic-derivative-cleared`; declaration `cyclotomicSeries_logDeriv_cleared`.

For ha: IsUnit(a in R), T f_a Δ(u_a)=aYᵃ−Y f_a.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. a∈ℕ and its image in R is a unit. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** Differentiate T f_a=Yᵃ−1 using the product rule and derivative_pow; obtain f_a+T D(f_a)=aY^(a−1) when a>0. Multiply by Y and substitute the definition of Δ(u_a), using the unit-value node to cancel f_a. Handle a=0 by the same polynomial identity (only the zero ring can supply its unit hypothesis).

**Dependencies.** `DirichletPadicLFunctions:L1/denominator-factorization`, `ColemanPowerSeries:L2/cyclotomic-unit-value`, `ColemanPowerSeries:L2/logarithmic-derivative`, `mathlib:Derivation.leibniz`, `mathlib:PowerSeries.derivative_pow`, `mathlib:PowerSeries.derivative_X`

**Acceptance.** No illegal division by the nonunit T occurs.

**Source.** Proposition 10.4 and Lemma 10.5, printed p.165 / PDF 66; compare Lemma 4.3, p.136 / PDF 37. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Smoothed logarithmic derivative

Node `ColemanPowerSeries:L2/cyclotomic-smoothed-comparison`; declaration `cyclotomicSeries_logDeriv_smoothed`.

Let a∈ℕ be a unit in R. If F∈B satisfies T f_a F=f_a−C(a), then Δ(u_a)=C(a−1)−F. The equation for F is a denominator-cleared characterization of the independent smoothed series, not an assumption of the conclusion.

**Hypotheses.** R is a commutative ring. Put B=R[[T]], Y=1+T and D=PowerSeries.derivative R. Inverses of elements of Bˣ mean units' inverses, not inversion of T. a∈ℕ and ha: IsUnit(a in R). F is an actual power series satisfying T f_a F=f_a−C(a). This node is conditional algebra; the Dirichlet supplier must construct F for its measure application. Throughout, f_a is the imported DirichletPadicLFunctions:L1/smoothing-denominator, not a separately defined Coleman family.

**Construction or proof.** Use the cleared logarithmic derivative formula and the equation for F to compare T f_a times both sides. The discrepancy is a multiple of T f_a−(Yᵃ−1), so it vanishes by geometric factorization. Cancel the unit f_a and then T by X_mul_injective. This proof needs neither a field nor analytic logarithms.

**Dependencies.** `ColemanPowerSeries:L2/cyclotomic-logarithmic-derivative-cleared`, `DirichletPadicLFunctions:L1/denominator-factorization`, `ColemanPowerSeries:L2/cyclotomic-unit-value`, `mathlib:PowerSeries.X_mul_injective`

**Acceptance.** For a=3 over ℚ, F=1−(2/3)T+… and Δ(u_3)=1+(2/3)T+…; reversing the sign fails already in degree one.

**Tests.**

- `smoothed_three_sign` — Over ℚ with a=3, the defining equation for F forces coefficients 1 and −2/3, and Δ(u_3)=2−F.

**Source.** Proposition 10.4 and Lemma 10.5, printed p.165 / PDF 66; compare Lemma 4.3, p.136 / PDF 37. The source gives the ℤ_p formula or argument; the stated arbitrary-commutative-ring algebraic form and the declaration-sized splitting are derived here. No claim that the source states this generality.

### Realization in the Coleman composite

For positive a>1 prime to p, import the already planned Dirichlet L1 smoothed-series,
series-cleared-equation and smoothed-measure nodes. They supply the independently constructed F_a
and T f_a F_a=f_a−a for this same denominator. Only ψ/restriction/pseudomeasure results remain
in the Dirichlet stage-level request. The comparison theorem above then gives
Δ(u_a)=a−1−F_a without taking an inverse of T. To use this as a Coleman
calculation, L0/L1 must identify u_a with the interpolating series of the
actual norm-compatible units c_n(a)=(ζ_(p^n)^a−1)/(ζ_(p^n)−1).

Unit restriction kills the constant series. Consequently the raw composite

Col₀=A⁻¹ ∘ ∂⁻¹ ∘ (1−φψ) ∘ Δ ∘ Coleman

has Col₀(c(a))=−([a]−1)ζ_p once those genuine interfaces are constructed.
Define the normalized Col to be −Col₀ and prove that equality of maps.
This does not change ζ_p, the cyclotomic-moment quotient map, or the first
kernel inclusion. An equality of principal ideals would not determine this
sign and is not an adequate acceptance test.

For a=3, f_a=3+3T+T², Δ(u_a)=1+(2/3)T+… and F_a=1−(2/3)T+….
The coefficient of T detects both an omitted Y in Δ and the reversed sign.
These rational coefficients are p-integral for p≠3. The characteristic-3
test instead checks that f_3 is not a unit, so this parameter is excluded
exactly where it should be.

The first algebraic specialization of G-equivariance gives
Δ(f[Y^m−1])=m(Δf)[Y^m−1] for m∈ℕ. Full p-adic equivariance also needs the
p-adic power/substitution construction and continuity. The inverse derivative
on ψ=0 is multiplication by x⁻¹ on measures supported on units; this yields
the inverse twist factor a⁻¹. It is not an arbitrary antiderivative on B.
Both factors must be shown to cancel.

Negative integer parameters are not polynomials. The boundary control
`negative_parameter_boundary` checks Δ(−Y⁻¹)=−1; the full negative-parameter
family and its arithmetic compatibility remain in the continuation list.
The additional `power_subst_zero` control checks that substitution by zero
kills Δ. Together with the comparison example, the suggested file has
fifteen examples.


### Exact integral measure suppliers

The PMIA packet at main 85cad46b3d86f72afb4f43b9a52f9d9148508442 has
the following exact interfaces. Their common integral carrier is the existing
ℤ_p-valued continuous dual on ℤ_p, and A is the existing integral Amice
equivalence. The exact L0 nodes `clopen-restriction`,
`clopen-restriction-section` and `clopen-support-characterization` supply the
algebraic clopen-subtype comparison. The L2 nodes `intrinsic-unit-restriction`,
`intrinsic-unit-restriction-section` and `intrinsic-unit-extension-projector`
identify intrinsic measures on ℤ_pˣ and the ambient unit projector.
Their weak and field-valued strong comparisons are now supplied by the exact
PMIA topology nodes listed in the current supplier note below. The integral-lattice
operator-norm comparison remains requested from PMIA L0.

| Supplier node in PadicMeasuresIwasawaAlgebras:L2 | Input to Coleman |
| --- | --- |
| `mahler-derivation-value` | ∂F=(1+T)D(F), so the local logarithmic derivative is ∂f/f. |
| `amice-phi` | A(φμ)=(Aμ)[(1+T)^p−1] on integral measures. |
| `psi-series` | The linear operator ψSeries=AψA⁻¹ whose comparison with the zeroth Frobenius coordinate belongs here. |
| `series-unit-restriction` | Unit restriction has series Aμ−φψSeries(Aμ). |
| `inverse-weight` and `inverse-weight-unique` | Integral division by x on unit support, using the existing p-adic unit inverse extended by zero. |
| `inverse-weight-dilation` | For a∈ℤ_pˣ, inverse weighting after dilation by a is a⁻¹ times dilation after inverse weighting. |
| `inverse-mahler` and `inverse-mahler-intertwining` | H=AJA⁻¹ and H(Aμ)=A(Jμ). |
| `inverse-mahler-unique` | For ψSeries F=0 there is a unique G with ψSeries G=0 and ∂G=F, namely HF. |

These node ids all have the exact prefix `PadicMeasuresIwasawaAlgebras:L2/`.
Coleman consumes these operators; it does not reconstruct them. The new
inverse-factor identity cancels the factor a in Δ after the separate action
comparisons. It does not, by itself, prove arithmetic G-equivariance. The
PMIA L2 request now asks for remaining topology, coefficient extension,
completed averaging and the dilation/substitution comparison. The PMIA L0
request now asks only for the integral-lattice operator-norm comparison
for the supplied clopen restriction and extension maps.

## L3. Kernel and cokernel

The torsion-free kernel theorem above concerns Δ on all formal units.
It does not prove the kernel of the Coleman map. The continuous restriction to genuine
norm-fixed units is now specified below. Its image lies in ψ-fixed series,
and its kernel consists precisely of constant units c with c^(p−1)=1.
Surjectivity is the separate mod-p argument, lifting and compactness proof
of RJW Lemmas 12.11–12.14.

The fixed-space sequence for 1−φ is specified below, including the
convergence of the series of iterates and its constant-term obstruction.
Its native maps give 0→ℤ_p→B^(ψ=1)→B^(ψ=0)→ℤ_p→0.
Combine the two sequences with the unit-supported inverse derivative.
Identify the full kernel μ_(p−1)×ℤ_p(1) and the cyclotomic-moment cokernel.
On principal units the required sequence is

0 → ℤ_p(1) → U_(∞,1) → ℤ_p[[G]] → ℤ_p(1) → 0.

Exactness is both algebraic and topological. For finite-flat coefficient
extension, tensor the two endpoint lattices and the unit module as well as
the Iwasawa algebra. The O(1) endpoints and completed-tensor comparison are
part of the assertion. They do not follow by changing the middle ring's
notation. The PMIA L5 request fixes the generic algebra supplier; the
arithmetic maps and hypotheses remain here.

**Acceptance.** Recover RJW Theorems 12.9 and 12.17 with actual continuous
maps, not assumed image/kernel predicates. Check the cyclotomic moment and
both endpoint identifications.

## L4. Cyclotomic units and inverse-limit generators

Import the global groups and finite-conductor real generators from
IntegralIwasawaTheory L0. Embed them in the local principal-unit tower and
prove the Teichmüller adjustment, retaining finite-level −1 where necessary.
Show that the closure of the relevant finitely generated subgroup is its
ℤ_p-span in the principal-unit module.

Prove norm compatibility of the chosen generator. Finite-level cyclicity
does not itself give a cyclic inverse limit with that generator: use the
compatible finite-level solution sets and compactness to prove surjectivity.
Apply the continuous Coleman map to the closed tower, determine its image
ideal and derive the odd-prime plus quotient

U_(∞,1)⁺/C_(∞,1)⁺ ≃ ℤ_p[[G⁺]]/(I(G⁺)ζ_p).

The O-coefficient assertion tensors the unit quotient too. This stage has
not yet been source-decomposed in the packet. Its acceptance includes
Theorems 11.9 and 12.23, actual finite-level units and all closure/comparison
maps. It is a local-unit theorem, distinct from the global Galois main
conjecture.

## Sources and corrections

The principal source is [Rodrigues Jacinto–Williams, published 2025](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf),
collated at the indicated passages with [arXiv v2](https://arxiv.org/pdf/2309.15692v2).
The packet records their exact hashes, read passages, locators and the bounded
search for corrections. This is not an exhaustive reading of either text.

The first nine findings below were recorded by the predecessor against the
version of record and collated with v2; this continuation preserves their records
without claiming an independent review. The two Coates–Sujatha findings concern
the exact publisher-layout copy described below. All await independent review. Existing programme corrections are
credited rather than claimed as new discoveries.

- **ColemanPowerSeries/E1.** Definition 10.14/Theorem 10.15, published p.170 / PDF 71; arXiv v2 p.52; compare published Proposition 10.4/Lemma 10.5 p.165 and Definition 4.10 p.138. With the displayed composite call the map Col₀ and write Col₀(c(a))=−θ_a ζ_p. Define Col=−Col₀ for the positive formula; do not renormalize ζ_p. Δ(f_a)=a−1−F_a. Unit restriction kills constants, so the subsequent linear inverse derivative and Amice inverse give −x⁻¹ Res μ_a=−θ_a ζ_p. The positive formula contradicts these independently fixed definitions. The a=3 expansion checks the algebraic sign; it is not a proof of the measure comparison.
- **ColemanPowerSeries/E2.** Proof of Lemma 10.8, published p.167 / PDF 68; arXiv v2 p.49. Construct the finite-free extension and its determinant norm over ℤ_p first. Identify the product only after adjoining μ_p and using the completed coefficient topology; descend the equality. For nontrivial η∈μ_p with odd p, η−1 is not a coefficient in ℤ_p, so T↦η(1+T)−1 is not an endomorphism of ℤ_p[[T]]. Moreover its constant coefficient is topologically nilpotent but not nilpotent; the pinned formal subst API is insufficient even after extending coefficients. The product formula remains a target with the correct base-change and convergence proof.
- **ColemanPowerSeries/E3.** §10.2 after Lemma 10.3, published p.165 / PDF 66; arXiv v2 p.48. For a>0 the series is the finite geometric sum. For negative integer parameters it is an invertible infinite formal series, with f_(−a)=−Y^(−a)f_a. The source allows any integer a prime to p. At a=−1, f_(−1)=−(1+T)⁻¹ has infinitely many nonzero coefficients over ℤ_p, so is not a polynomial. The finite-sum construction in this packet is explicitly restricted to natural parameters.
- **ColemanPowerSeries/E4.** Proof of Lemma 10.11(iii), published p.168 / PDF 69; arXiv v2 p.50. Perform the congruences in O_(K₁)[[T]], modulo p₁ p^k O_(K₁)[[T]], then intersect coefficientwise with ℤ_p[[T]]. The ideal p₁ and η−1 belong to the ring of integers of K₁=ℚ_p(μ_p), not ℤ_p. For the descended difference, p₁p^k O_(K₁)∩ℤ_p=p^(k+1)ℤ_p. This repairs the ambient ring without changing the asserted congruence.
- **ColemanPowerSeries/E5.** Last displayed geometric-series equality in Proposition 4.4 proof, published p.137 / PDF 38 (rendered); arXiv v2 p.27. Insert a minus sign before the sum over n≥1, or use Σ_(n≥1)(−1)^(n+1)T^(n−1)g(T)^n. Since F=(1−(1+Tg)⁻¹)/T, the geometric tail is subtracted, not added. For a=3, g=1+T/3 and F has constant coefficient +1; the printed series has constant coefficient −1. Integrality remains correct, but the formula cannot define the source's F_a.
- **ColemanPowerSeries/E6.** §4.1 before Lemma 4.2, published p.136 / PDF 37; arXiv v2 p.26. Use a positive integer a (in the analytic Mellin argument) and retain a>1 prime to p in the smoothing supplier. Negative parameters require an independent algebraic power-series argument. The phrase integer coprime to p allows a=−1. Then 1/(e^t−1)+1/(e^(−t)−1)=−1 for positive t, which does not decay. The Mellin-transform hypothesis fails; this does not obstruct the positive-parameter p-adic construction.
- **ColemanPowerSeries/E7.** Final sentence in proof of Proposition 4.11, published p.139 / PDF 40; arXiv v2 p.28. Handle k=1 separately: ζ(0)=−1/2, but the Euler factor 1−p^(k−1) is zero. For odd k>1 the negative-even zeta value is zero; even k has positive sign. The printed iff between nonvanishing of ζ(1−k) and even k misses k=1. The interpolation conclusion remains unchanged because its Euler factor kills that exceptional case.
- **ColemanPowerSeries/E8.** Proof of Lemma 4.7, published p.137 / PDF 38; arXiv v2 pp.27–28. Either define and compare an extension of the trace operator to a suitable localization, or prove the rational partial-fraction identity after clearing denominators and apply it to the already-integral F_a. Do not apply the bounded-series ψ to 1/T directly. The ψ constructed from bounded measures acts on ℤ_p[[T]], which does not contain T⁻¹. The displayed calculation is a useful rational-function identity, but the asserted domain extension and agreement with bounded ψ are missing. The Dirichlet supplier must discharge this proof interface.
- **ColemanPowerSeries/E9.** Proof of Proposition 12.1, series immediately preceding (12-1), published p.178 / PDF 79; arXiv v2 p.57. The expansion of f_u starts at k=0; retain a₀(u). The next line requires a₀(u)≡1 mod p, and a unit series must have a unit constant coefficient. Starting the displayed expansion at k=1 contradicts that. The subsequent separated constant-term calculation uses the intended expansion.

The supplementary source is [Coates–Sujatha, *Cyclotomic Fields and Zeta Values*](https://www.math.mcgill.ca/darmon/courses/16-17/gs/Coates-Sujatha.pdf),
Springer2006, SHA-256 `38178a8a147169c3750b7693c46c7453954790b101b37c2690f8e8cda91b0789`.
Printed pp.13–19 were read, with p.15 rendered to verify its statement; the
proof of Lemma2.3.5 continues on unread p.20. The opening paragraph of the
publisher’s sample chapter confirms the book’s odd-prime convention. The
publisher book/extras pages and a bounded correction search yielded no erratum
for the following items; the extras are a sample chapter and contents. This
records the exact copy read and makes no claim of exhaustive novelty.

- **ColemanPowerSeries/E10.** Theorem2.1.3 and the finite-zero sentence immediately following it, printed p.15 / PDF25; definition of distinguished polynomial on p.14. Require f≠0 in the preparation statement and in the finite-zero assertion; handle the zero series separately. A distinguished polynomial is monic and hence nonzero. In the domain ℤ_p[[T]], a finite power of p times that polynomial times a unit cannot equal zero. The zero series also vanishes at every point of the infinite maximal ideal. The rendered publisher-layout page contains no nonzero qualification. No specific published correction located in the bounded search; this records an elementary omitted hypothesis, not a claim of novelty.
- **ColemanPowerSeries/E11.** Proof of Proposition2.2.3, printed p.16 / PDF26; proof of Lemma2.3.2, printed p.18 / PDF28. Read the congruences in O[[T]], where O is the ring of integers of ℚ_p(μ_p), with ideals p₀O[[T]] or p₀p^kO[[T]]. Descend coefficients using p₀∩ℤ_p=pℤ_p (and its p^k multiple). The book defines R=ℤ_p[[T]], while p₀ and ξ−1 live in the coefficient extension O. The substitution values already belong to O[[T]], as correctly stated on p.15. Intersecting the extended ideal with ℤ_p yields the intended conclusion, without changing the norm or trace congruence. This is the same ambient-ring notation issue as the retained RJW finding ColemanPowerSeries/E4, now located in the cited Coates–Sujatha copy. No separate published erratum located.

The source's pseudomeasure localization/evaluation problems are already
recorded in PMIA's E1–E3. They are not new findings of this packet and are
not fixed by changing the sign of Col₀. Consumers must use the supplier's
admissible-evaluation interface.

## Signed integer parameters

The natural denominator q_a belongs to DirichletPadicLFunctions:L1 and is imported unchanged. The existing binomial series B_n=(1+T)^n, for n∈ℤ, supplies the negative powers. Its exponent ring is ℤ; the coefficient ring R may be any commutative ring. In particular, the construction neither assumes that R itself is a binomial ring nor inverts T.

For a natural a write f_(−a)=−B_(−a)q_a as a mathematical abbreviation for this expression on existing carriers. It is not a second series definition or a second Dirichlet denominator. The factorization below characterizes it uniquely as the integral quotient of B_(−a)−1 by T. The a=0 expression is0, so positive and negative conventions meet consistently.

RJW§10.2 permits signed integer parameters but describes every cyclotomic series as polynomial. At parameter−1 the series is−(1+T)⁻¹ and has infinitely many nonzero coefficients over ℤ. Finding ColemanPowerSeries/E3 already records this error. The negative formulas below supply the formal-series interpretation while retaining the source’s actual cyclotomic quotient and the independently fixed sign of the Coleman map.

### Integer binomial weighted derivative

`ColemanPowerSeries:L2/integer-binomial-weighted-derivative` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.integerBinomial_weighted_derivative`.

For every integer n, Y·D(B_n)=n·B_n, where D is the pinned formal derivative and the right side is multiplication by the image of n in R.

For n≥0, identify B_n with Yⁿ using PowerSeries.binomialSeries_nat and apply derivative_pow, derivative_X and derivative_one. The case n=0 is included. For a natural a, binomialSeries_add and binomialSeries_zero give B_aB_(−a)=1. Differentiate this equality using Derivation.leibniz, multiply by Y and use the nonnegative formula. Multiply by B_(−a) and use the same inverse identity to isolate Y D(B_(−a))=−a B_(−a). This uses no denominators or additive-torsion-free assumption.

Prerequisites: `mathlib:PowerSeries.binomialSeries`, `mathlib:PowerSeries.binomialSeries_nat`, `mathlib:PowerSeries.binomialSeries_add`, `mathlib:PowerSeries.binomialSeries_zero`, `mathlib:PowerSeries.derivative_pow`, `mathlib:PowerSeries.derivative_X`, `mathlib:PowerSeries.derivative_one`, `mathlib:Derivation.leibniz`.

Acceptance: At n=−1 the derivative has the negative sign; at n=0 both sides vanish. The identity remains valid in positive characteristic.

### Signed integer substitution and logarithmic derivative

`ColemanPowerSeries:L2/logarithmic-derivative-integer-substitution` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_integer_subst`.

For an integer n and f∈R[[T]]ˣ, put g_n=B_n−1. Its constant coefficient is zero, so formal substitution is defined. Then Δ(f[g_n])=n·(Δf)[g_n], where f[g_n] is the actual unit obtained through the pinned substitution homomorphism.

PowerSeries.binomialSeries_constantCoeff and HasSubst.of_constantCoeff_zero' supply formal substitutability for g_n. The displayed signature permits this canonical proof as an explicit argument. Apply the preceding logarithmic-derivative-substitution node: B_n Δ(f[g_n])=Y D(g_n)(Δf)[g_n]. The integer weighted derivative formula and D(1)=0 give Y D(g_n)=n B_n. Cancel B_n by multiplying by B_(−n), using binomialSeries_add and binomialSeries_zero.

Prerequisites: `ColemanPowerSeries:L2/integer-binomial-weighted-derivative`, `ColemanPowerSeries:L2/logarithmic-derivative-substitution`, `mathlib:PowerSeries.binomialSeries_constantCoeff`, `mathlib:PowerSeries.HasSubst.of_constantCoeff_zero'`, `mathlib:PowerSeries.substAlgHom`, `mathlib:PowerSeries.binomialSeries_add`, `mathlib:PowerSeries.binomialSeries_zero`, `mathlib:PowerSeries.derivative_one`.

Acceptance: This is the signed-integer algebraic identity. It does not construct the full p-adic-exponent action or prove its continuity.

Named tests:

- `integer_substitution_minus_one`: Over ℚ, substitute B_(−1)−1 into a unit with value Y. Its weighted logarithmic derivative is −1.

### Negative cyclotomic quotient formula

`ColemanPowerSeries:L2/negative-cyclotomic-factorization` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_factorization`.

For a natural a, the existing expression f_(−a)=−B_(−a)q_a satisfies T f_(−a)=B_(−a)−1. Consequently it is the unique formal series whose product with T is Y^(−a)−1, with Y^(−a) interpreted by the pinned binomial series. This is an identity on existing series, not a new denominator definition.

Import Tq_a=Yᵃ−1 from DirichletPadicLFunctions:L1/denominator-factorization. Multiply by −B_(−a), identify Yᵃ=B_a by binomialSeries_nat, and use B_(−a)B_a=1 from binomialSeries_add/zero. Rearrangement gives the asserted identity. PowerSeries.X_mul_injective proves the stated uniqueness. For the coefficient tests, the pinned rescale_neg_one_invOneSubPow, coeff_rescale and invOneSubPow definition give the expansion of B_(−a).

Prerequisites: `DirichletPadicLFunctions:L1/denominator-factorization`, `mathlib:PowerSeries.binomialSeries_nat`, `mathlib:PowerSeries.binomialSeries_add`, `mathlib:PowerSeries.binomialSeries_zero`, `mathlib:PowerSeries.X_mul_injective`, `mathlib:PowerSeries.rescale_neg_one_invOneSubPow`, `mathlib:PowerSeries.coeff_rescale`, `mathlib:PowerSeries.invOneSubPow`.

Acceptance: The a=0 expression is zero. At a=1, the infinitely many nonzero coefficients over ℤ refute the source’s unrestricted polynomial sentence; the existing finding ColemanPowerSeries/E3 already records that sentence.

Named tests:

- `negative_one_coefficients`: For every k≥0 over ℤ, coefficient_k(−B_(−1))=(−1)^(k+1). This negative cyclotomic series is not a polynomial.
- `negative_three_coefficients`: Over ℤ, −B_(−3)q_3 has constant coefficient −3 and coefficient of T equal to 6.

### Negative cyclotomic constant coefficient

`ColemanPowerSeries:L2/negative-cyclotomic-constant` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_constant`.

For every natural a, the constant coefficient of −B_(−a)q_a is −a in R.

Use binomialSeries_constantCoeff=1 and the imported denominator-constant value a. The existing constant-coefficient ring homomorphism preserves multiplication and negation.

Prerequisites: `mathlib:PowerSeries.binomialSeries_constantCoeff`, `DirichletPadicLFunctions:L1/denominator-constant`.

Acceptance: At a=0 this gives zero; at a=3 over ℤ it gives −3.

### Negative cyclotomic invertibility criterion

`ColemanPowerSeries:L2/negative-cyclotomic-unit` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_isUnit`.

For every natural a, the series −B_(−a)q_a is a unit of R[[T]] if and only if the image of a is a unit of R.

Apply PowerSeries.isUnit_iff_constantCoeff and negative-cyclotomic-constant. An element and its negative have equivalent unit conditions. This proves both directions and uses the existing Units carrier for any chosen unit representative.

Prerequisites: `ColemanPowerSeries:L2/negative-cyclotomic-constant`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`.

Acceptance: Over ℤ/3ℤ the a=3 expression is not a unit. No field or characteristic-zero assumption is introduced.

### Negative cyclotomic logarithmic derivative

`ColemanPowerSeries:L2/negative-cyclotomic-logarithmic-derivative` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_logDeriv`.

Let a be natural with unit image in R, let u_a be the preceding natural cyclotomic unit, and let v be any unit whose value is −B_(−a)q_a. Then Δ(v)=−C(a)+Δ(u_a). The preceding unit criterion guarantees that such a v exists, and the formula is independent of the unit witness.

Differentiate v=−B_(−a)q_a using Derivation.leibniz and multiply by Y. Use integer-binomial-weighted-derivative at −a and the defining equation Δ(u_a)=Y D(q_a)u_a⁻¹, using the existing cyclotomic-unit-value node. The result is Y D(v)=v(−C(a)+Δ(u_a)). Cancel the unit v in the definition of Δ(v). The numerical logarithmic-derivative test follows from the same definition, binomial coefficients and inversion of a unit series.

Prerequisites: `ColemanPowerSeries:L2/negative-cyclotomic-unit`, `ColemanPowerSeries:L2/integer-binomial-weighted-derivative`, `ColemanPowerSeries:L2/logarithmic-derivative`, `ColemanPowerSeries:L2/cyclotomic-unit-value`, `mathlib:Derivation.leibniz`.

Acceptance: For a=1 the natural unit is 1 and the negative unit has Δ=−1. The source’s negative parameter requires the shift −a, not just negating the positive logarithmic derivative.

Named tests:

- `negative_three_logDeriv`: Over ℚ, for a unit with value −B_(−3)q_3, the constant coefficient of Δ is −2 and the coefficient of T is 2/3.

### Transport of the cleared smoothing equation

`ColemanPowerSeries:L2/negative-smoothed-equation` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_smoothed_equation`.

Let a be natural and let F∈R[[T]] satisfy Tq_aF=q_a−C(a). Then T(−B_(−a)q_a)(F−C(a))=−B_(−a)q_a+C(a). Thus the expression F−C(a) satisfies the correct cleared equation for parameter −a. This algebraic identity does not require a to be a unit.

Multiply Tq_aF=q_a−C(a) by −B_(−a). For the correction term use Tq_a=Yᵃ−1 and B_(−a)Yᵃ=1. The two terms involving aB_(−a) cancel, leaving −B_(−a)q_a+C(a).

Prerequisites: `DirichletPadicLFunctions:L1/denominator-factorization`, `mathlib:PowerSeries.binomialSeries_add`, `mathlib:PowerSeries.binomialSeries_nat`, `mathlib:PowerSeries.binomialSeries_zero`.

Acceptance: For a=3 over ℚ, F=1−(2/3)T+⋯ becomes F−3=−2−(2/3)T+⋯. The sign of the constant correction is fixed by the displayed equation.

### Negative smoothed logarithmic derivative comparison

`ColemanPowerSeries:L2/negative-smoothed-comparison` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.negativeCyclotomicSeries_logDeriv_smoothed`.

Let a be natural with unit image in R, let v have value −B_(−a)q_a, and let F satisfy Tq_aF=q_a−C(a). Then Δ(v)=−1−F. Equivalently, writing F_(−a)=F−C(a), the same parameter formula is Δ(v)=C(−a−1)−F_(−a).

Apply negative-cyclotomic-logarithmic-derivative to express Δ(v)=−C(a)+Δ(u_a). Apply the existing cyclotomic-smoothed-comparison to Δ(u_a)=C(a−1)−F. Combine constants. The preceding negative-smoothed-equation identifies F−C(a) by the appropriate cleared equation, independently of the logarithmic-derivative conclusion.

Prerequisites: `ColemanPowerSeries:L2/negative-cyclotomic-logarithmic-derivative`, `ColemanPowerSeries:L2/cyclotomic-smoothed-comparison`, `ColemanPowerSeries:L2/negative-smoothed-equation`.

Acceptance: At a=3 the formula gives Δ(v)=−2+(2/3)T+⋯. It preserves the raw Col₀ versus normalized Col sign convention while making no measure or norm-tower identification.

### Scope and source boundary

The signed-integer algebra is specified on the existing binomial-series carrier and imported natural denominator: weighted derivative/substitution, the negative cyclotomic expression, its factorization and unit criterion, and its logarithmic-derivative and cleared-smoothing identities. Prove full p-adic-exponent substitution and continuity, and identify these explicit series with the actual norm-compatible arithmetic tower. The algebraic identities alone do not construct a measure, a p-adic group action, or the Coleman map.

The integer substitution formula is the exact algebraic specialization of the transformation law in RJW(12-2). A full p-adic exponent varies continuously in a coefficient topology and requires further work. In particular, integer exponents alone do not discharge the G-equivariance contract for the completed Coleman map. The original natural-parameter statements remain available with unchanged node identifiers.

The source for the negative quotient and smoothing calculation is RJW§10.2, printed p.165 / PDF 66. The source for the weighted transformation law is Proposition 12.5, equation (12-2), printed pp.179–180/PDF 80–81; Definition 12.8 gives Δ. These passages were read in the published version and p.165/p.179 were visually checked. The formulas here are derived over arbitrary commutative rings from the pinned binomial identities and the existing positive denominator, so the source is not claimed to state that generality. No analytic logarithm, localization by T or new measure carrier enters the argument.

## P-adic exponents and the derivative twist

Use the pinned binomial series over the actual p-adic integers. For a∈ℤ_p, write B_a=(1+T)^a as a formal binomial series; its coefficients are the existing integral functions Ring.choose a n. This uses PadicInt.instBinomialRing and makes no division inside ℤ_p.

The parameter topology in the density argument is the p-adic topology on ℤ_p. The power-series topology is the scoped product topology on its coefficients. No identification with uniform divisibility by pⁿ is asserted. Coefficientwise continuity of binomial coefficients and of the formal derivative is enough for the density argument.

### P-adic binomial weighted derivative

**ColemanPowerSeries:L2/padic-binomial-weighted-derivative** — TauCetiRoadmap.Campaign.ColemanPowerSeries.padicBinomial_weighted_derivative

For every a∈ℤ_p, Y·D(B_a)=a·B_a, where D is the pinned formal derivative. This includes a=0 and nonunit exponents; it is an equality of integral formal series.

Proof: The pinned PadicInt.instBinomialRing and binomialSeries_coeff identify coefficient n of B_a with Ring.choose a n. PadicInt.continuous_choose and the coefficientwise topology criterion make a↦B_a continuous. The derivative coefficient formula is coefficient_n(D(B_a))=(n+1)choose(a,n+1). Thus a↦D(B_a) is continuous coefficientwise. Multiplication and the constant-series map give continuity of both sides of the proposed identity. For a natural n, binomialSeries_nat identifies B_n with Yⁿ. Apply derivative_pow, derivative_X and derivative_one, handling n=0 separately; multiply by Y and combine powers. Apply PadicInt.denseRange_natCast and DenseRange.equalizer to the two continuous maps into the Hausdorff power-series space. The coefficientwise topology is used only for this proof, not asserted equal to a uniform p-adic topology.

Prerequisites: mathlib:PadicInt.instBinomialRing, mathlib:PadicInt.continuous_choose, mathlib:PadicInt.denseRange_natCast, mathlib:DenseRange.equalizer, mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto, mathlib:PowerSeries.WithPiTopology.continuous_C, mathlib:PowerSeries.binomialSeries_coeff, mathlib:PowerSeries.coeff_derivative, mathlib:PowerSeries.binomialSeries_nat, mathlib:PowerSeries.derivative_pow, mathlib:PowerSeries.derivative_X, mathlib:PowerSeries.derivative_one.

Test **padic_weighted_half**: At p=3 and 2a=1, four times coefficient 1 of YD(B_a) equals 1. This tests a nonintegral rational p-adic exponent.

### P-adic substitution and logarithmic derivative

**ColemanPowerSeries:L2/logarithmic-derivative-padic-substitution** — TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_padic_subst

For every a∈ℤ_p and f∈ℤ_p[[T]]ˣ, put g_a=B_a−1. Its constant coefficient is zero. Then Δ(f[g_a])=a·(Δf)[g_a], where Δ is the existing weighted logarithmic derivative and f[g_a] is the actual unit transported through the substitution algebra homomorphism. In particular the identity holds for p-adic unit exponents, with the twist a of equation (12-2).

Proof: binomialSeries_constantCoeff and HasSubst.of_constantCoeff_zero' give the canonical substitution hypothesis. Apply Units.map to the pinned substAlgHom to transport f without introducing a second unit carrier. The preceding logarithmic-derivative-substitution node gives B_a·Δ(f[g_a])=Y D(g_a)·(Δf)[g_a]. The p-adic weighted derivative identity and D(1)=0 identify YD(g_a)=aB_a. Since B_aB_(−a)=1 by binomialSeries_add and binomialSeries_zero, multiplication by B_(−a) cancels B_a. For the tests, a=0 gives zero. If f has value Y, its logarithmic derivative is 1 by the existing definition, hence the substituted logarithmic derivative is the constant a; at p=3 and 2a=1, twice that series is 1.

Prerequisites: ColemanPowerSeries:L2/padic-binomial-weighted-derivative, ColemanPowerSeries:L2/logarithmic-derivative-substitution, ColemanPowerSeries:L2/logarithmic-derivative, mathlib:PowerSeries.binomialSeries_constantCoeff, mathlib:PowerSeries.HasSubst.of_constantCoeff_zero', mathlib:PowerSeries.substAlgHom, mathlib:PowerSeries.binomialSeries_add, mathlib:PowerSeries.binomialSeries_zero, mathlib:PowerSeries.derivative_one.

Test **padic_logDeriv_zero_exponent**: For every formal unit f, substitution with exponent zero has logarithmic derivative zero.

Test **padic_logDeriv_half**: At p=3 and 2a=1, substituting B_a−1 into a unit with value Y gives a unit whose logarithmic derivative, multiplied by 2, is the constant series 1.

### Sources, ownership and remaining comparison

Rodrigues Jacinto–Williams, Proposition 12.5, equation (12-2), printed p.179, gives Δ(σ_a f)=aσ_a(Δf) for a∈ℤ_pˣ. The formal calculation above works for every a∈ℤ_p. This extension does not assert that substitution by a nonunit exponent is an automorphism. The source’s next equation (12-3) has the inverse factor a⁻¹ for the inverse derivative on measures; PMIA now supplies that inverse factor for the existing unit-dilation pushforward. Its identification with the arithmetic action and formal substitution is still essential to final equivariance.

PadicHodgeTheory:P7:annulus-foundations/cyclotomic-gamma-action already supplies the unit-exponent cyclotomic action, its group law, inverses and continuity on its coefficient rings. Its overconvergent-cyclotomic-rings node specifies A_F^+=O_F[[π]]. Consume these nodes after checking the k=𝔽_p coefficient and topology identifications; do not create a second action in Coleman. The two new lemmas are formal weighted-derivative identities, including nonunit exponents, and assert no arithmetic-tower or Galois-action comparison.

The signed-integer and p-adic logarithmic derivative identities are specified. Import the P7 cyclotomic unit-exponent action with its exact coefficient/topology identification. The PMIA inverse-weight-dilation node now supplies the a⁻¹ factor for the existing unit pushforward. Establish the actual tower action, interpolation compatibility, norm-fixed restriction and the measure-action/substitution comparison before combining it with the factor a in the logarithmic derivative.

## Continuity and the norm-fixed limit

This continuation resolves the series-topology and norm-iteration gap identified by the
preceding handoff. It preserves all 57 earlier node objects and eleven source findings.
Write B=ℤ_p[[T]], Y=1+T and φ(F)=F(Y^p−1). The existing finite-free basis uses the
explicit Frobenius scalar algebra, not the ordinary self-module. Both B and its finite
coordinate tuples carry the coefficientwise p-adic product topology.

The assembly map is already a continuous bijection from compact B^p to Hausdorff B.
Its inverse is continuous by the pinned compact-to-Hausdorff theorem, and uniqueness
identifies that inverse with the actual Frobenius coordinates. The multiplication matrix
then makes the norm a finite determinant polynomial in continuous coordinates. The trace
is p times the zeroth coordinate. Thus both actual operators are continuous.

For each actual series unit u, the inherited two-index congruence gives

    N^[m](u) − N^[k](u) ∈ p^(k+1) B   for m≥k.

Every coefficient is Cauchy in ℤ_p, uniformly over u, so its limit defines a series L(u).
The ideal p^(k+1)B is closed: it is the continuous image of compact B and B is Hausdorff.
Passing to the limit gives the same precision for L(u)−N^[k](u). Continuity of N and
uniqueness of limits prove N(L(u))=L(u). Multiplication passes through the limit, and
fixed units are unchanged. In particular L(u)L(u⁻¹)=L(1)=1, proving invertibility with
an explicit inverse. Finally the uniform coefficient estimates prove continuity of L.
This argument does not infer invertibility merely from convergence of units.

The construction covers p=2 by the existing determinant congruences. At p=2 the sequence
starting at Y is Y,−Y,−Y,…, and the sequence starting at −1 becomes 1 after one step.
At odd p, Y is already fixed. These examples distinguish the actual norm iteration from
an identity map or a sign-free convention. L takes values in existing formal series;
its fixedness and unit theorem permit passage to the existing norm-fixed subgroup.
No arithmetic tower, interpolation isomorphism or new unit carrier is assumed.

The source is [Coates–Sujatha, Corollary 2.3.4](https://www.math.mcgill.ca/darmon/courses/16-17/gs/Coates-Sujatha.pdf),
printed19/PDF29, with printed17–19 read in full. The norm and surrounding approximation
argument were also read in [RJW, printed167–169/PDF68–70](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf).
The continuity and inverse-witness details are explicit library-level elaborations.
Coates–Sujatha fixes an odd prime; the dyadic extension uses the preceding independent
determinant argument. No new source finding is asserted.

PMIA's merged integral averaging checkpoint now supplies exact root-translation,
root-average, integral-descent and rational-root-average-descent nodes. Its generic
coefficient and topology request is narrowed accordingly. The trace comparison below identifies the actual bounded ψ; the
determinant/product comparison remains a separate obligation. The new planet “Norm-fixed limit” is the sixth L1 planet.

### Continuity of Frobenius coordinates

`ColemanPowerSeries:L1/frobenius-coordinates-continuous` — lemma.

The map sending f∈B to its tuple of Frobenius-basis coordinates ((phiBasis.repr f)_i)_(i<p) is continuous for the coefficientwise p-adic topologies.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof outline:

1. The existing assembly Ξ:B^p→B is continuous and bijective. Its source is compact, since ℤ_p is compact and both series and finite tuples carry product topologies; B is Hausdorff.
2. Package the established bijection as an existing equivalence and apply the pinned compact-to-Hausdorff inverse-continuity theorem. No new topological carrier or topology is defined.
3. The inverse tuple is exactly the basis coordinate function: assembly of those coordinates is f by the explicit basis expansion, and assembly is injective. Use this equality to transfer continuity. The Frobenius scalar module is passed explicitly; ordinary self-module coordinates would be wrong.

Prerequisites: `ColemanPowerSeries:L1/frobenius-coordinate-continuity`, `ColemanPowerSeries:L1/frobenius-coordinate-injectivity`, `ColemanPowerSeries:L1/frobenius-coordinate-surjectivity`, `ColemanPowerSeries:L1/frobenius-basis-expansion`, `mathlib:PadicInt.compactSpace`, `mathlib:Pi.compactSpace`, `mathlib:Continuous.continuous_symm_of_equiv_compact_to_t2`.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Source: RJW-published, Lemma 10.8, printed167/PDF68; continuity needed in the limiting argument around Proposition10.12, printed168–169/PDF69–70; all three pages read. Library-level continuity for the existing finite-free algebra. The compact inverse and finite determinant proof make the topology explicit; no root-product comparison is assumed. This is a worker decomposition, not a claim that the paper separately states these helper lemmas.

### Continuity of the Coleman norm

`ColemanPowerSeries:L1/coleman-norm-continuous` — lemma.

The actual determinant norm N:B→B is continuous for the coefficientwise p-adic topology.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof outline:

1. Each entry of the existing multiplication matrix is a finite sum of continuous coordinate functions multiplied by fixed powers of Y. Apply frobenius-coordinates-continuous and the explicit matrix-entry formula.
2. The determinant is a finite sum of finite products of entries by Matrix.det_apply. Addition and multiplication are continuous in the coefficientwise power-series topology.
3. Use the exact norm-matrix equality to identify this continuous polynomial with N. This proves continuity of the constructed determinant norm, without assuming a root-product formula or a norm on B.

Prerequisites: `ColemanPowerSeries:L1/frobenius-coordinates-continuous`, `ColemanPowerSeries:L1/frobenius-multiplication-matrix`, `ColemanPowerSeries:L1/coleman-norm-matrix`, `mathlib:Matrix.det_apply`.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Source: RJW-published, Lemma 10.8, printed167/PDF68; continuity needed in the limiting argument around Proposition10.12, printed168–169/PDF69–70; all three pages read. Library-level continuity for the existing finite-free algebra. The compact inverse and finite determinant proof make the topology explicit; no root-product comparison is assumed. This is a worker decomposition, not a claim that the paper separately states these helper lemmas.

### Continuity of the integral Coleman trace

`ColemanPowerSeries:L1/coleman-trace-continuous` — lemma.

The existing integral trace τ:B→B is continuous for the coefficientwise p-adic topology.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof outline:

1. The trace-coordinate formula is τ(f)=p·c_0(f). Coordinate projection is continuous by frobenius-coordinates-continuous.
2. Multiplication by the fixed integral scalar p is continuous. This is continuity of the actual integral trace; the identification of c_0 with bounded ψ remains a separate comparison.

Prerequisites: `ColemanPowerSeries:L1/frobenius-coordinates-continuous`, `ColemanPowerSeries:L1/coleman-trace-coordinates`.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Source: RJW-published, Lemma 10.8, printed167/PDF68; continuity needed in the limiting argument around Proposition10.12, printed168–169/PDF69–70; all three pages read. Library-level continuity for the existing finite-free algebra. The compact inverse and finite determinant proof make the topology explicit; no root-product comparison is assumed. This is a worker decomposition, not a claim that the paper separately states these helper lemmas.

### Cauchy coefficients of iterated norms

`ColemanPowerSeries:L1/coleman-norm-iterate-coefficient-cauchy` — lemma.

For an actual unit u∈Bˣ and every coefficient index n, the sequence coeff_n(N^[k](u)) is Cauchy in ℤ_p as k tends to infinity.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof outline:

1. For k₂≥k₁, the existing iterate congruence writes N^[k₂](u)−N^[k₁](u)=p^(k₁+1)h for an integral series h.
2. Taking coefficient n yields a difference with norm at most p^(−k₁−1), because every coefficient of h has norm at most one. The bound is independent of u, n and k₂.
3. For two arbitrary indices beyond K, order them and use symmetry of the norm of the difference. Since p≥2, the geometric bound tends to zero as K grows, proving the metric Cauchy condition. The unit hypothesis is retained.

Prerequisites: `ColemanPowerSeries:L1/coleman-norm-iterate-congruence`, `mathlib:PadicInt.norm_p_pow`, `mathlib:PadicInt.norm_le_one`, `mathlib:PowerSeries.coeff_C_mul`.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Source: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

### Norm-fixed limit

`ColemanPowerSeries:L1/coleman-norm-limit` — construction.

For u∈Bˣ, define L(u)∈B to be the series whose nth coefficient is the unique limit in ℤ_p of coeff_n(N^[k](u)).

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof outline:

1. Every coefficient sequence is Cauchy by coleman-norm-iterate-coefficient-cauchy. Completeness of ℤ_p supplies its limit, and Hausdorffness gives uniqueness.
2. Use the existing power-series constructor on this coefficient function. This is a map on the existing unit carrier to the existing series carrier, not an assumed arithmetic interpolation map.
3. The convergence, norm-fixedness, multiplicativity and unit property are proved separately below; none is hidden in the definition.

Prerequisites: `ColemanPowerSeries:L1/coleman-norm-iterate-coefficient-cauchy`, `mathlib:cauchySeq_tendsto_of_complete`, `mathlib:PowerSeries`.

API:

- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_tendsto` (characterisation): For each u∈Bˣ, N^[k](u) tends to L(u) in the coefficientwise p-adic topology. Promoted to coleman-norm-limit-convergence.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_sub_iterate_dvd` (compatibility): For every u∈Bˣ and k≥0, p^(k+1) divides L(u)−N^[k](u) in B. Promoted to coleman-norm-limit-precision.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_fixed` (relation): For every u∈Bˣ, N(L(u))=L(u). Promoted to coleman-norm-limit-fixed.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_mul` (structure): For u,v∈Bˣ, L(uv)=L(u)L(v). Promoted to coleman-norm-limit-multiplication.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_of_fixed` (simp): If u∈Bˣ satisfies N(u)=u, then L(u)=u as series. Promoted to coleman-norm-limit-fixed-input.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_isUnit` (compatibility): For every u∈Bˣ, L(u) is a unit of B; an explicit inverse is L(u⁻¹). Promoted to coleman-norm-limit-unit.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normLimitSeries_continuous` (compatibility): The map L:Bˣ→B is continuous, with the existing unit topology on the source and coefficientwise p-adic topology on the target. Promoted to coleman-norm-limit-continuity.

Uses:

- Coates–Sujatha Corollary2.3.4; ColemanPowerSeries:L1 interpolation: Produce actual norm-fixed invertible series by iterating the already constructed norm, with quantitative precision for compact approximation. Arithmetic norm/evaluation compatibility remains required.
- ColemanPowerSeries:L3 norm-fixed logarithmic-derivative sequence: Provide convergence and fixedness in the actual series space; the map fixes preexisting norm-fixed inputs and retains their inverse. It is not the missing arithmetic tower isomorphism.

Tests:

- `normLimit_identity` (degenerate): For every prime p, L(1)=1.
- `normLimit_minus_one_two` (computation): At p=2, L(−1)=1, since N(−1)=1; this rejects defining L as the input unit.
- `normLimit_Y_two` (non-example): At p=2, for a unit u with value Y, L(u)=−Y. The sequence is Y,−Y,−Y,…; the odd-prime answer Y is wrong.
- `normLimit_Y_three` (compatibility): At p=3, for a unit u with value Y, L(u)=Y because N(Y)=Y.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Source: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

### Convergence to the norm limit

`ColemanPowerSeries:L1/coleman-norm-limit-convergence` — lemma.

For each u∈Bˣ, N^[k](u) tends to L(u) in the coefficientwise p-adic topology.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof outline:

1. The defining coefficient limits are exactly the required convergence statements for every coefficient.
2. Apply the pinned coefficientwise convergence criterion for power series. This states convergence in the product topology; a topology of uniform coefficient bounds is not introduced.

Prerequisites: `ColemanPowerSeries:L1/coleman-norm-limit`, `mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Source: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

### Uniform precision of the norm limit

`ColemanPowerSeries:L1/coleman-norm-limit-precision` — lemma.

For every u∈Bˣ and k≥0, p^(k+1) divides L(u)−N^[k](u) in B.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof outline:

1. Fix k. The set p^(k+1)B is the range of the continuous map h↦p^(k+1)h on compact B, so it is compact and therefore closed in Hausdorff B.
2. For every m≥k, the existing iterate congruence places N^[m](u)−N^[k](u) in that closed set.
3. Pass to the coefficientwise limit using coleman-norm-limit-convergence and closed-set stability under limits. This gives the entire-series divisibility statement, not merely a fixed finite coefficient window. At k=0 it gives L(u)≡u mod p.

Prerequisites: `ColemanPowerSeries:L1/coleman-norm-limit-convergence`, `ColemanPowerSeries:L1/coleman-norm-iterate-congruence`, `mathlib:PadicInt.compactSpace`, `mathlib:Pi.compactSpace`, `mathlib:isCompact_range`, `mathlib:IsCompact.isClosed`, `mathlib:IsClosed.mem_of_tendsto`.

Acceptance: At iteration zero, L(u)≡u mod p. At iteration k the exponent is k+1, uniformly over all coefficients and all input units.

Source: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

### Norm-fixedness of the limit

`ColemanPowerSeries:L1/coleman-norm-limit-fixed` — theorem.

For every u∈Bˣ, N(L(u))=L(u).

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof outline:

1. Continuity of N sends the convergent sequence N^[k](u) to a sequence converging to N(L(u)).
2. The image sequence is N^[k+1](u), the shifted sequence of iterates. It has the same limit L(u).
3. Uniqueness of limits in the Hausdorff series space gives equality. Completeness or the congruence estimate alone does not replace the continuity argument.

Prerequisites: `ColemanPowerSeries:L1/coleman-norm-continuous`, `ColemanPowerSeries:L1/coleman-norm-limit-convergence`.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Source: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

### Multiplicativity of the norm limit

`ColemanPowerSeries:L1/coleman-norm-limit-multiplication` — lemma.

For u,v∈Bˣ, L(uv)=L(u)L(v).

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof outline:

1. Every iterate of the actual monoid homomorphism N preserves multiplication. Thus N^[k](uv)=N^[k](u)N^[k](v).
2. The two factor sequences converge. Continuity of multiplication and uniqueness of the limit identify the product limit with L(uv).

Prerequisites: `ColemanPowerSeries:L1/coleman-determinant-norm`, `ColemanPowerSeries:L1/coleman-norm-limit-convergence`.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Source: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

### The norm limit on a fixed unit

`ColemanPowerSeries:L1/coleman-norm-limit-fixed-input` — lemma.

If u∈Bˣ satisfies N(u)=u, then L(u)=u as series.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof outline:

1. Inductively every norm iterate is u. The constant sequence converges to u.
2. Compare this limit with coleman-norm-limit-convergence and use Hausdorff uniqueness. In particular L(1)=1.

Prerequisites: `ColemanPowerSeries:L1/coleman-norm-limit-convergence`, `ColemanPowerSeries:L1/coleman-determinant-norm`.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Source: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

### Invertibility of the norm limit

`ColemanPowerSeries:L1/coleman-norm-limit-unit` — lemma.

For every u∈Bˣ, L(u) is a unit of B; an explicit inverse is L(u⁻¹).

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof outline:

1. Apply multiplicativity to u and its actual inverse to obtain L(u)L(u⁻¹)=L(1).
2. The fixed-input identity at 1 gives L(1)=1. Commutativity supplies both inverse identities, so the existing unit criterion yields IsUnit(L(u)).
3. This proves invertibility rather than inferring it from convergence of units. Equivalently the precision result at k=0 preserves the nonzero residue of the constant coefficient.

Prerequisites: `ColemanPowerSeries:L1/coleman-norm-limit-multiplication`, `ColemanPowerSeries:L1/coleman-norm-limit-fixed-input`.

Acceptance: The inverse witness is L(u⁻¹), supplied by multiplicativity and L(1)=1; convergence of units alone is not used to claim that the limit is a unit.

Source: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

### Continuity of the norm limit

`ColemanPowerSeries:L1/coleman-norm-limit-continuity` — lemma.

The map L:Bˣ→B is continuous, with the existing unit topology on the source and coefficientwise p-adic topology on the target.

Hypotheses: p is any prime, including 2; B=ℤ_p[[T]], Y=1+T, and φ(f)=f(Y^p−1). The existing basis and scalar module use the Frobenius algebra explicitly. N is the actual determinant norm and τ the actual integral trace from the preceding nodes. B and finite tuples of B have the coefficientwise p-adic product topology. N^[k] is k-fold function iteration, with N^[0]=id. Every input u of the norm-limit construction is an actual element of the existing Bˣ. No arithmetic tower or interpolation map is assumed.

Proof outline:

1. For each coefficient n and finite iteration k, u↦coeff_n(N^[k](u)) is continuous by coleman-norm-continuous and the continuous unit-value map.
2. The precision lemma gives a uniform-in-u error bound p^(−k−1) for that coefficient. Hence the continuous finite-iterate coefficient maps converge uniformly to u↦coeff_n(L(u)).
3. Apply the pinned uniform-limit continuity theorem coefficient by coefficient, then the product-topology criterion. This proves continuity without asserting that the coefficientwise topology equals a uniform norm topology.

Prerequisites: `ColemanPowerSeries:L1/coleman-norm-continuous`, `ColemanPowerSeries:L1/coleman-norm-limit-precision`, `mathlib:PadicInt.norm_p_pow`, `mathlib:PadicInt.norm_le_one`, `mathlib:TendstoUniformly.continuous`, `mathlib:PowerSeries.WithPiTopology.continuous_coeff`, `mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`.

Acceptance: The exact Frobenius scalar structure and coefficientwise topology are retained; the statement includes p=2 and does not imply arithmetic interpolation.

Source: CS-2006, Corollary 2.3.4 and its proof, printed p.19 / PDF29, using Corollary 2.3.3 on the same page; surrounding §2.3 printed17–19 / PDF27–29 read in full. Explicit decomposition of the norm-fixed limit of integral unit series. Continuity of the actual determinant norm and its coordinate inverse, the unit witness, uniform precision and continuity of the limit map are worker elaborations of the source proof. The book fixes odd p; the p=2 extension here follows the preceding independently justified determinant congruences and keeps the dyadic norm sign.

## Exact continuation boundary

### ColemanPowerSeries:L0 — partial

- Decompose RJW §9 fully: actual cyclotomic fields K_n=ℚ_p(μ_(p^n)), n≥1, compatible roots, integral rings, degrees, residue fields, total ramification and relative norm formulas. Generic local-field structure and Eisenstein theory are imports, not fresh carriers here.
- Construct the full and principal norm-compatible unit inverse limits, continuity of transitions, closedness/compactness, G-action, Tate-module inclusion, and the norm-compatible Teichmüller splitting. Prove principal-unit pro-p hypotheses before importing the ℤ_p-module construction; full units are not a ℤ_p-module.
- Verify completed action hypotheses and source the explicitly unramified/semilocal coefficient extension with Frobenius and norm data. No arbitrary ramified coefficient extension is justified by this checkpoint.

### ColemanPowerSeries:L1 — partial

- The integral trace/PMIA bounded-ψ comparison, zeroth Frobenius coordinate and embedded root-sum formula are supplied. Prove the determinant/root-product comparison and arithmetic norm/evaluation compatibility using the existing PMIA root translations; general coefficient extensions remain supplier work.
- The four RJW Lemma10.11 congruences, inverse-coordinate/norm/trace continuity, and the norm-fixed invertible limit with uniform precision and continuity are supplied. Prove the arithmetic norm/evaluation compatibility and the actual finite-level lifts before using this limit in tower interpolation. The series construction does not itself supply an arithmetic interpolation map.
- Import pinned Weierstrass through PMIA L4 with its nonzero hypothesis; prove interpolation uniqueness, finite-level lifting, compact successive approximation and surjectivity onto the entire norm-compatible tower. Recover Theorems10.2 and10.13, and specify the unramified coefficient/Frobenius variants exactly. The present algebraic basis proof is over ℤ_p only.

### ColemanPowerSeries:L2 — partial

- Identify the explicit f_a with the Coleman series of the actual unit tower c(a), proving membership, relative norm compatibility and interpolation; the local algebraic nodes do not construct the tower.
- The signed-integer and p-adic logarithmic derivative identities are specified. Import the P7 cyclotomic unit-exponent action with its exact coefficient/topology identification. The PMIA inverse-weight-dilation node now supplies the a⁻¹ factor for the existing unit pushforward. Establish the actual tower action, interpolation compatibility, norm-fixed restriction and the measure-action/substitution comparison before combining it with the factor a in the logarithmic derivative.
- Consume the exact PMIA nodes mahler-derivation-value, amice-phi, psi-series, series-unit-restriction, inverse-weight, inverse-weight-unique, inverse-mahler-intertwining and inverse-mahler-unique. They supply the integral operators and the unique inverse on kerψ; PMIA L0/clopen-restriction, L0/clopen-restriction-section and L0/clopen-support-characterization supply the generic algebraic clopen comparison; L2/intrinsic-unit-restriction, L2/intrinsic-unit-restriction-section and L2/intrinsic-unit-extension-projector identify the actual unit-domain maps and ambient projector. The exact PMIA L0 weak clopen homeomorphism and field-valued strong-topology nodes and L2 unit-measure-kernel-weak-homeomorphism, integral-amice-weak-homeomorphism and unit-measure-amice-weak-homeomorphism now supply these topology comparisons under their stated hypotheses. Only the integral-lattice/operator-norm comparison remains requested from PMIA L0. Dirichlet now supplies exact series-psi-fixed, measure-psi-fixed, unit-smoothed-measure, unit-smoothed-difference, smoothed-numerator and numerator-amice nodes. The ψ-invariance chain now imports the exact generic root-average and rational-descent supplier nodes. Import these nodes; the Coleman normalized-trace and logarithmic-derivative/norm comparisons are now supplied, including the actual continuous map on norm-fixed units. Pseudomeasure normalization and the remaining Coleman composite are still required. Then prove equality of actual measures for raw Col₀ and normalized Col=−Col₀ using the existing Dirichlet denominator and series-cleared-equation. No new measure carrier or Col map is defined in this checkpoint.
- Establish additivity, continuity, principal-unit ℤ_p-linearity and full G-equivariance of the actual Coleman map. The formal Δ identity supplies the factor a; identify it with the imported cyclotomic action and combine it with the inverse-derivative factor a⁻¹ on the actual measures.

### ColemanPowerSeries:L3 — partial

- The actual continuous logarithmic-derivative map on norm-fixed units, its image containment in psi-fixed series and its constant-root kernel are supplied. Decompose the mod-p image calculation and lifting/compactness proof in Lemmas 12.11–12.14; derive the exact logarithmic-derivative sequence of Theorem 12.9 on actual norm-fixed units.
- The fixed-space five-term sequence 0→Z_p→B^(psi=1)→B^(psi=0)→Z_p→0 is now decomposed, including the coefficientwise convergent Frobenius sum, constant kernel, evaluation obstruction and quotient topologies. Combine it with the still-required logarithmic-derivative surjectivity and actual arithmetic interpolation to obtain the full Coleman sequence.
- Construct the kernel μ_(p−1)×ℤ_p(1), cyclotomic-moment cokernel, and Theorem 12.17 for principal units as both topological and algebraic modules. Tensor every term in a finite-flat coefficient extension and prove the completed-tensor comparison.

### ColemanPowerSeries:L4 — not_read

- Read and decompose RJW §11 and §12.3 through Theorem 12.23 with their cited sources. Import actual global cyclotomic subgroups, finite-conductor real generators and their finite index from IntegralIwasawaTheory:L0.
- Prove local embeddings, the Teichmüller-adjusted compatible generator, closure equals ℤ_p-span, finite-level generation and the compactness argument for inverse-limit cyclicity. Retain −1 at finite real level where required.
- Compute the closed cyclotomic tower's Coleman image and U_(∞,1)^+/C_(∞,1)^+ ≃ Λ(G^+)/(I(G^+)ζ_p) for odd p; transport the unit quotient itself under coefficient extension. This is not the Galois main conjecture.

The six gap records and twelve supplier requests remain open. The stage-level
requests concern the undecomposed arithmetic/comparison statements; they are
not hidden hypotheses of the local nodes. Every new internal edge
terminates in another local node or an exact pinned declaration. The existing
L2 chain also imports the precise Dirichlet denominator nodes. A passing packet
checker does not close the five stage targets.

Nine planets are proposed: **Frobenius power basis**, **Coleman norm**,
**Integral Coleman trace**, **Norm-fixed units**, **Coleman norm congruences** and **Norm-fixed limit** in L1; **Logarithmic
derivative** and **Cyclotomic unit series** in L2. No planet is a completion
claim. All implementation statuses remain unchecked.

### Pinned finite-algebra inputs

These supplement the existing derivative, unit and substitution inputs.
Each statement and its hypotheses were read at the pinned Mathlib commit;
none is replanned as a new generic construction.

| Baseline declaration | Exact role |
| --- | --- |
| `mathlib:Algebra.leftMulMatrix` | The actual multiplication matrix in a specified basis; entry (i,j) is the i-th coordinate of f times the j-th basis vector. |
| `mathlib:Algebra.norm` | Existing determinant norm as a monoid homomorphism, specialized with the explicit Frobenius algebra. |
| `mathlib:Algebra.norm_algebraMap_of_basis` | The norm of a base scalar is its power by the finite basis cardinality. |
| `mathlib:Algebra.norm_eq_matrix_det` | A finite basis computes the norm as the determinant of left multiplication. |
| `mathlib:Algebra.trace` | Existing linear trace of left multiplication, specialized with the explicit Frobenius algebra. |
| `mathlib:Algebra.trace_eq_matrix_trace` | A finite basis computes the trace as the trace of the multiplication matrix. |
| `mathlib:IsCompact.nonempty_iInter_of_sequence_nonempty_isCompact_isClosed` | A decreasing sequence of nonempty closed sets with compact first set has nonempty intersection. |
| `mathlib:Matrix.det_apply` | Leibniz determinant formula, using output row σ(i) and input column i. |
| `mathlib:Module.Basis.mk` | A basis from a linearly independent spanning family in the specified module. |
| `mathlib:Module.Basis.mk_apply` | The constructed basis has the supplied vectors. |
| `mathlib:Module.Basis.sum_repr` | Finite reconstruction as the sum of coordinate-scaled basis vectors. |
| `mathlib:Module.finrank_eq_card_basis` | Over a nontrivial commutative ring, a finite basis identifies finrank with its index cardinality. |
| `mathlib:PadicInt.compactSpace` | Compactness of ℤ_p in its p-adic topology for prime p. |
| `mathlib:PadicInt.ext_of_toZModPow` | All finite residue maps together detect equality in ℤ_p. |
| `mathlib:PadicInt.ker_toZMod` | The residue map kernel is the maximal ideal. |
| `mathlib:PadicInt.ker_toZModPow` | The kernel of reduction modulo p^r is the ideal generated by p^r. |
| `mathlib:PadicInt.maximalIdeal_eq_span_p` | The maximal ideal of ℤ_p is generated by p. |
| `mathlib:PadicInt.toZMod` | The residue ring homomorphism ℤ_p→ZMod p. |
| `mathlib:Pi.compactSpace` | Products of compact spaces are compact, including series coefficients and finite coordinate tuples. |
| `mathlib:PowerSeries.WithPiTopology.continuous_coeff` | Every coefficient map is continuous in the explicitly scoped coefficientwise topology. |
| `mathlib:PowerSeries.coeff_expand` | The coefficient at n is zero unless p divides n, then the coefficient at n/p. |
| `mathlib:PowerSeries.coeff_subst'` | Coefficient formula for substitution; here zero constant term makes the relevant sum finite for each coefficient. |
| `mathlib:PowerSeries.expand` | Substitution by T^p for nonzero p, with the actual coefficient ring retained. |
| `mathlib:PowerSeries.map_subst` | Coefficient homomorphisms commute with valid formal substitution. |
| `mathlib:RingHom.toAlgebra` | Algebra structure with a·x=i(a)x from a ring homomorphism; explicitly handles the warned self-action diamond. |
| `mathlib:Subgroup` | Existing subgroup structure on the actual unit group; no new unit carrier. |

### Source scope of the norm-congruence continuation

Codex — codex-hjdg0j read the published Rodrigues Jacinto–Williams PDF at
physical pages 67–69 (printed 166–168), and visually checked printed 168.
The same worker read Coates–Sujatha physical pages 26–31 (printed 16–21)
in batches of at most three pages. Thus the continuation of Lemma 2.3.5
on printed 20 has now been read. The preceding workers' larger reading
scopes and source collation remain attributed to them. Neither source is
claimed to have been completely read or decomposed here.

The eleven inherited source findings are unchanged. In particular E4 and
E11 record the coefficient-extension ideals used by the source norm proof.
The new determinant argument supplies an integral route to the congruences;
it does not discharge E2's completed root-of-unity substitution comparison.
The opening of the additive exact-sequence argument on Coates–Sujatha
pp.20–21 supplies leads for L3; no conclusion about its remaining proof is
drawn without reading the continuation. The original Coleman paper and
the coefficient variants remain outside this continuation's reading scope.

The new native inputs are the coefficient and constant-multiplication
formulas for power series; expansion and coefficient Frobenius; injectivity
of Frobenius in reduced rings; reduction of determinants along ring maps;
the principal-ideal quotient criterion; and Matrix.det_one_add_smul. Each
statement and its ambient hypotheses were read at the pinned Mathlib commit,
and each read source blob was checked against the pinned tree. These generic
results are consumed, not replanned. The packet lists their exact names,
modules and roles, alongside the preserved 57 baseline references.

### Arithmetic numerator supplier

The Dirichlet packet at main 3fa3504bfe0aa38e8c6f1934daa440b2e6756999
supplies `DirichletPadicLFunctions:L1/series-psi-fixed`,
`DirichletPadicLFunctions:L1/measure-psi-fixed`,
`DirichletPadicLFunctions:L1/unit-smoothed-measure`,
`DirichletPadicLFunctions:L1/unit-smoothed-difference`,
`DirichletPadicLFunctions:L1/smoothed-numerator` and
`DirichletPadicLFunctions:L1/numerator-amice`. In particular ν_a=Jμ_a
is an actual integral ambient measure and Aν_a=H(F_a). These targets use
natural a prime to p, with a=1 a zero boundary; the nondegenerate
pseudomeasure comparison takes a>1. The ψ-invariance chain has an explicit
generic averaging gap in its `series-phi-psi-fixed` prerequisite. Importing
the node does not discharge that gap. The numerator construction and its
Amice comparison themselves do not require ψ-invariance.

Coleman must compare its raw map with −ν_a using the existing logarithmic
derivative identity and operator comparisons. Dirichlet retains the
independent identification ν_a=([a]−1)ζ_p, with its actual denominator and
regularity conditions. This narrows the aggregate supplier request without
changing the inherited denominator dependencies or declaring L2 closed.

## Norm-limit validation

The preceding norm-limit seed elaborated with zero errors and 147 proof-placeholder warnings.
It contained 58 typed examples, using 2,252 pinned Mathlib source modules. The current
combined validation is recorded in the trace-comparison section below. The compactness argument uses an explicit specialization of the native
product compactness instance to the underlying coefficient function type; ordinary instance
inference alone does not expose this through the power-series definition.

Six independent scratch examples check compact inverse continuity in these actual spaces,
closedness of the p-power multiples, completeness of coefficient limits, an explicit unit
witness, the dyadic determinant sign and uniform-limit continuity. Their proofs are complete,
and the compact-product adapter and three sensitive baseline telescopes were also checked.
The proposed roadmap declarations remain unchecked mathematical plans.

An exact determinant harness passes 1,847 assertions modulo p^8 for p=2,3,5. It uses seventeen
input polynomials per prime, six norm iterations, independent finite Frobenius matrices,
and tests iteration precision, finite-limit fixedness, multiplicativity, input perturbations,
nonzero unit residues and the dyadic boundary. A negative control rejects an extra power of
p in the zero-iterate error bound. Nonunit constants converge toward zero in these finite
approximations and are excluded from the unit-valued conclusion. The controls do not prove
infinite convergence or continuity.

Continue with the determinant/root-product comparison, arithmetic
norm/evaluation compatibility, actual finite-level lifts and interpolation. The series limit
does not identify a norm-compatible field-unit tower. All six gaps and twelve requests remain
explicit, and no stage is closed.

The Dirichlet supplier was refreshed at main 797977d5a6a116d94aca5543f14d411cf3215d1b. Its six changed inherited L1 records retain their mathematical statements and now use exact PMIA averaging suppliers. The obsolete averaging-gap wording in the L2 continuation and Dirichlet request is removed. Its new positive Eisenstein coefficient nodes are outside this comparison.

## The integral trace and bounded psi

The source writes the finite-free trace with values in the subring φ(B), then
applies φ inverse and divides by p. The existing scalar-algebra trace already
has the ordinary base B as its codomain. Its comparison is therefore τ(F)=pψ(F).
After embedding into the extension ring it becomes φτ(F)=pφψ(F). These are
different formulas, and the suggested tests distinguish them on Y^p.

No division by a nonunit is introduced in the integral ring. The coordinate
formula τ(F)=pc₀(F), combined with the comparison and cancellation of the nonzero
element p, identifies the existing zeroth coordinate with the existing bounded ψ.
The two independently constructed operators are compared by their polynomial
values and continuity. The trace’s scalar law is promoted from its existing API
to a lemma node because the polynomial comparison uses it as a prerequisite.

The power calculation writes n=pq+r, expresses Y^n as φ(Y^q)Y^r, and reads the
zeroth coordinate in the existing basis. For ψ the natural-power projector and
left-inverse theorems are exact PMIA imports. Translation by 1 in the polynomial
ring gives spanning by powers of Y. The pinned polynomial density theorem then
extends the equality to every integral series. This uses the coefficientwise
p-adic topology; it asserts no continuity for the supremum coefficient norm.

The root-sum statement is a consumer comparison with the exact PMIA root-average
node. It uses its actual coefficient embedding into the valuation integer ring
of ℂ_p and its continuous integral root translations. The root substitutions are
not asserted to be automorphisms of ℤ_p[[T]]. The already recorded source finding
about their ambient ring is preserved.

The statements include p=2 by this algebraic argument. Arithmetic interpolation,
and the determinant/root-product formula remain in the continuation boundary.
The logarithmic-derivative/norm comparison is specified in the following continuation. No new layer is closed.

### Trace and Frobenius scalars

`ColemanPowerSeries:L1/coleman-trace-frobenius-scalars` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_phi_mul` (lemma).

For every a,F∈B, τ(φ(a)F)=aτ(F). This promotes the existing trace compatibility API to a prerequisite declaration.

Hypotheses: p is any prime, including 2. Z=ℤ_p, B=Z[[T]], Y=1+T and φ(F)=F(Y^p−1). B carries the coefficientwise p-adic topology. The existing phiScalarAlgebra uses φ for its scalar map; τ=colemanTrace is its Algebra.trace with values in the base B, and c_i(F) are the existing phiBasis coordinates. ψ is the actual PMIA AbstractMeasure.psiSeries, transported from the bounded integral measure operator by the pinned Amice equivalence. Its continuity and left-inverse formula are imported from PMIA. No normalized-trace definition of ψ, division by p inside B, or additional coefficient Frobenius is assumed.

Proof outline:

1. Unfold the existing trace construction to Algebra.trace for the explicitly chosen Frobenius scalar algebra.
2. Apply the scalar-map law of this B-linear map. Its source scalar action is φ(a)F, while its target scalar action is ordinary multiplication aτ(F). This is the existing linear-map law, not an extra property of ψ.

Prerequisites: `ColemanPowerSeries:L1/coleman-integral-trace`, `ColemanPowerSeries:L1/frobenius-scalar-algebra`, `mathlib:Algebra.trace`.

Acceptance: With a=Y and F=1, the identity gives τ(Y^p)=pY. Constants a=C(z) give the Z-linearity needed for the polynomial comparison. The suggested signature already exists in the inherited trace API and is reused.

Sources:

- RJW, Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21. Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

### Trace on natural powers of one plus T

`ColemanPowerSeries:L1/coleman-trace-natural-powers` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_one_add_X_pow` (lemma).

For every n∈ℕ, τ(Y^n)=p·Y^(n/p) if p divides n, and τ(Y^n)=0 otherwise; n/p is natural quotient.

Hypotheses: p is any prime, including 2. Z=ℤ_p, B=Z[[T]], Y=1+T and φ(F)=F(Y^p−1). B carries the coefficientwise p-adic topology. The existing phiScalarAlgebra uses φ for its scalar map; τ=colemanTrace is its Algebra.trace with values in the base B, and c_i(F) are the existing phiBasis coordinates. ψ is the actual PMIA AbstractMeasure.psiSeries, transported from the bounded integral measure operator by the pinned Amice equivalence. Its continuity and left-inverse formula are imported from PMIA. No normalized-trace definition of ψ, division by p inside B, or additional coefficient Frobenius is assumed.

Proof outline:

1. Write n=pq+r with 0≤r<p. The formal substitution homomorphism fixes constants and sends Y to Y^p, so Y^n=φ(Y^q)Y^r.
2. Use the Frobenius basis values and the scalar action to identify its coordinate vector as Y^q times the r-th coordinate vector. Basis.repr_self_apply computes the zeroth coordinate.
3. Apply coleman-trace-coordinates. The zeroth coordinate is Y^q exactly when r=0, equivalently p divides n, and zero otherwise. This is a finite calculation in the existing scalar algebra.

Prerequisites: `ColemanPowerSeries:L1/frobenius-scalar-algebra`, `ColemanPowerSeries:L1/frobenius-basis-values`, `ColemanPowerSeries:L1/coleman-trace-coordinates`, `mathlib:Module.Basis.repr_self_apply`, `mathlib:PowerSeries.substAlgHom`.

Tests:

- `TraceComparisonTests.cube_three` (computation): For p=3, τ((1+T)³)=3(1+T).
- `TraceComparisonTests.square_two` (computation): For p=2, τ((1+T)²)=2(1+T).

Acceptance: The n=0 value is p. For p=2, τ(Y²)=2Y; for p=3, τ(Y³)=3Y. The output exponent is n/p, not n.

Sources:

- RJW, Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21. Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

### Trace and bounded psi on polynomials

`ColemanPowerSeries:L1/coleman-trace-psi-polynomials` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_eq_mul_psi_polynomial` (lemma).

For every polynomial P∈Z[T], τ(P)=p·ψ(P), where both occurrences of P use the existing polynomial-to-power-series map.

Hypotheses: p is any prime, including 2. Z=ℤ_p, B=Z[[T]], Y=1+T and φ(F)=F(Y^p−1). B carries the coefficientwise p-adic topology. The existing phiScalarAlgebra uses φ for its scalar map; τ=colemanTrace is its Algebra.trace with values in the base B, and c_i(F) are the existing phiBasis coordinates. ψ is the actual PMIA AbstractMeasure.psiSeries, transported from the bounded integral measure operator by the pinned Amice equivalence. Its continuity and left-inverse formula are imported from PMIA. No normalized-trace definition of ψ, division by p inside B, or additional coefficient Frobenius is assumed.

Proof outline:

1. First compare on Y^n. PMIA phi-psi-natural-powers gives φψ(Y^n). If n=pq, φ(Y^q)=Y^n; applying ψ and its left-inverse identity gives ψ(Y^n)=Y^q. If p does not divide n, applying ψ gives zero. Compare with coleman-trace-natural-powers. No new generic psi-on-powers node is introduced here.
2. The trace is Z-linear: its existing φ-semilinearity applied to the constant series C(a), together with φ(C(a))=C(a), gives τ(aF)=aτ(F). Psi is already a Z-linear map. Multiplication by p is Z-linear.
3. Use the surjective pinned Polynomial.taylorEquiv at 1 to write P as a polynomial in Y. Polynomial.induction_on' and taylor_monomial reduce the equality to the preceding powers and scalar compatibility. PowerSeries.smul_eq_C_mul identifies the coefficient action.

Prerequisites: `ColemanPowerSeries:L1/coleman-trace-natural-powers`, `ColemanPowerSeries:L1/coleman-trace-frobenius-scalars`, `ColemanPowerSeries:L1/frobenius-scalar-algebra`, `PadicMeasuresIwasawaAlgebras:L2/psi-series`, `PadicMeasuresIwasawaAlgebras:L2/phi-psi-natural-powers`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-phi`, `mathlib:Polynomial.taylorEquiv`, `mathlib:Polynomial.taylor_monomial`, `mathlib:Polynomial.induction_on'`, `mathlib:PowerSeries.smul_eq_C_mul`, `mathlib:Polynomial.toPowerSeries`.

Acceptance: For p=2, τ(T)=−2 while ψ(T)=−1; the formula also includes the zero polynomial.

Sources:

- RJW, Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21. Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

### Integral trace and bounded psi

`ColemanPowerSeries:L1/coleman-trace-psi` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_eq_mul_psi` (comparison).

For every F∈B, colemanTrace(F)=p·AbstractMeasure.psiSeries(F) in the base B. This compares the existing finite-free Algebra.trace with the independently constructed bounded integral operator.

Hypotheses: p is any prime, including 2. Z=ℤ_p, B=Z[[T]], Y=1+T and φ(F)=F(Y^p−1). B carries the coefficientwise p-adic topology. The existing phiScalarAlgebra uses φ for its scalar map; τ=colemanTrace is its Algebra.trace with values in the base B, and c_i(F) are the existing phiBasis coordinates. ψ is the actual PMIA AbstractMeasure.psiSeries, transported from the bounded integral measure operator by the pinned Amice equivalence. Its continuity and left-inverse formula are imported from PMIA. No normalized-trace definition of ψ, division by p inside B, or additional coefficient Frobenius is assumed.

Proof outline:

1. The existing Coleman trace is coefficientwise continuous. The existing PMIA psi-series-continuous theorem and multiplication by the constant p make the right side continuous.
2. The maps agree on polynomial series by coleman-trace-psi-polynomials. The pinned polynomial inclusion has dense range and B is Hausdorff for the coefficientwise p-adic topology.
3. Apply DenseRange.equalizer to those two actual functions. No continuity for a coefficient supremum norm is needed; no field-valued formal-series inverse or root translation in Z[[T]] is asserted.

Prerequisites: `ColemanPowerSeries:L1/coleman-trace-psi-polynomials`, `ColemanPowerSeries:L1/coleman-trace-continuous`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-continuous`, `mathlib:PowerSeries.WithPiTopology.denseRange_toPowerSeries`, `mathlib:DenseRange.equalizer`.

Tests:

- `TraceComparisonTests.zero_three` (degenerate): For p=3, τ(0)=3ψ(0).
- `TraceComparisonTests.one_three` (computation): For p=3, τ(1)=3 and ψ(1)=1.
- `TraceComparisonTests.variable_two` (computation): For p=2, τ(T)=−2 and ψ(T)=−1.
- `TraceComparisonTests.no_extra_frobenius_three` (non-example): For p=3, τ((1+T)³) is not 3(1+T)³.
- `TraceComparisonTests.no_missing_prime_three` (non-example): For p=3, τ(1) is not ψ(1).

Acceptance: For p=3, τ(1)=3 and ψ(1)=1 reject a missing factor p. At F=Y³, τ(F)=3Y differs from 3Y³ and rejects an extra Frobenius. The theorem includes p=2.

Sources:

- RJW, Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21. Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

### The zeroth Frobenius coordinate is psi

`ColemanPowerSeries:L1/frobenius-zeroth-coordinate-psi` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_repr_zero_eq_psi` (comparison).

For every F∈B, the zeroth coordinate in the actual Frobenius basis equals the bounded operator: c₀(F)=AbstractMeasure.psiSeries(F).

Hypotheses: p is any prime, including 2. Z=ℤ_p, B=Z[[T]], Y=1+T and φ(F)=F(Y^p−1). B carries the coefficientwise p-adic topology. The existing phiScalarAlgebra uses φ for its scalar map; τ=colemanTrace is its Algebra.trace with values in the base B, and c_i(F) are the existing phiBasis coordinates. ψ is the actual PMIA AbstractMeasure.psiSeries, transported from the bounded integral measure operator by the pinned Amice equivalence. Its continuity and left-inverse formula are imported from PMIA. No normalized-trace definition of ψ, division by p inside B, or additional coefficient Frobenius is assumed.

Proof outline:

1. Combine coleman-trace-coordinates with coleman-trace-psi to obtain p·c₀(F)=p·ψ(F).
2. B is a characteristic-zero integral domain, so the natural prime p is nonzero and multiplication by p is injective. Cancel p. This is cancellation of a nonzero element, not inversion of p in the integral ring.

Prerequisites: `ColemanPowerSeries:L1/coleman-trace-coordinates`, `ColemanPowerSeries:L1/coleman-trace-psi`.

Tests:

- `TraceComparisonTests.coordinate_three` (compatibility): For p=3, the zeroth coordinate of (1+T)³ in phiBasis is 1+T.

Acceptance: For p=3, c₀(Y³)=Y, while for 0<i<p the zeroth coordinate of Y^i is zero. Together with the existing divisibility theorem, this specifies the unique integral normalized trace.

Sources:

- RJW, Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21. Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

### The embedded trace as a root sum

`ColemanPowerSeries:L1/coleman-trace-root-sum` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_root_sum` (comparison).

Let O be the existing valuation integer ring of ℂ_p, j:Z→O the existing PMIA integralCoefficientMap, and ζ∈O primitive of order p. For every F∈B, map(j,φ(colemanTrace(F)))=Σ_{i<p}rootTranslation(ζ,i,F) in O[[T]], using the actual PMIA integral root translations.

Hypotheses: p is any prime, including 2. Z=ℤ_p, B=Z[[T]], Y=1+T and φ(F)=F(Y^p−1). B carries the coefficientwise p-adic topology. The existing phiScalarAlgebra uses φ for its scalar map; τ=colemanTrace is its Algebra.trace with values in the base B, and c_i(F) are the existing phiBasis coordinates. ψ is the actual PMIA AbstractMeasure.psiSeries, transported from the bounded integral measure operator by the pinned Amice equivalence. Its continuity and left-inverse formula are imported from PMIA. No normalized-trace definition of ψ, division by p inside B, or additional coefficient Frobenius is assumed. O carries its inherited p-adic topology. Root translations are the existing topological integral-series evaluations from PMIA; roots need not lie in ℤ_p.

Proof outline:

1. Substitute the integral comparison τ(F)=pψ(F). Formal Frobenius substitution and coefficient mapping preserve multiplication and the natural constant p.
2. The left side becomes p·map(j,φψ(F)), which equals the displayed root sum by the exact PMIA root-average theorem.
3. The translated inputs are evaluated in the existing receiving integer ring, not treated as automorphisms of Z[[T]]. No new root-averaging theorem or coefficient-extension construction is planned.

Prerequisites: `ColemanPowerSeries:L1/coleman-trace-psi`, `PadicMeasuresIwasawaAlgebras:L2/root-average`, `PadicMeasuresIwasawaAlgebras:L2/integral-coefficient-map`, `mathlib:PowerSeries.substAlgHom`.

Tests:

- `TraceComparisonTests.root_sum_one` (computation): For any prime p and primitive ζ∈O of order p, the root sum of 1 is p.
- `TraceComparisonTests.root_sum_phi` (compatibility): For any prime p and primitive ζ∈O of order p, the root sum of (1+T)^p is p(1+T)^p.

Acceptance: At F=1 the root sum is p. At F=Y^p it is pY^p; this is the embedded trace, whereas the base-valued trace is pY.

Sources:

- RJW, Sentence immediately following Lemma 10.8, printed p.167 / PDF68, compared with §3.5.5 equation (3-9), printed pp.128–129; arXiv v2 §3.5.5 PDF21. Worker decomposition of the source’s normalized-trace comparison. The paper writes the trace into the embedded subring φ(B) and applies φ inverse. The existing Coleman trace is already base-valued, so its integral comparison is τ=pψ. Polynomial values and coefficientwise continuity prove the comparison with the independently constructed bounded operator. The dyadic case is proved algebraically; no odd-prime arithmetic theorem is extended by assertion.

## Integral norm and logarithmic differentiation

For the Frobenius scalar algebra, weighted differentiation of a basis expansion
introduces a factor p on each base coordinate and a term from the basis exponent.
Writing H=diag(0,…,p−1) therefore gives the connection identity
M_(∂F)=p∂M_F+HM_F−M_FH. Native matrix trace kills the commutator after multiplying
by M_F inverse. A formal-derivation adapter to Mathlib's first-order determinant
formula then gives τ(Δu)=pΔ(Nu). Combining this integral identity with the existing
τ=pψ comparison, and cancelling the nonzero p, gives Δ(Nu)=ψ(Δu).

This argument uses the actual determinant norm and the independently constructed
PMIA bounded operator. The derivative, power-series carrier, square-zero
extension, matrix trace and units are native library objects. The fixed target
is the native kernel of ψ−id, with the Multiplicative type tag recording that
multiplication of units becomes addition of series. Its topology is the induced
coefficientwise topology. The following declarations include p=2; arithmetic
tower interpolation retains its separate hypotheses.

### Formal derivation and the determinant

`ColemanPowerSeries:L1/derivation-determinant-unit` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.derivation_det_unit` (comparison).

Let R and A be commutative rings, A an R-algebra, d an R-derivation of A into itself, and M a unit in the ring of n-by-n matrices over A for a finite index type n. Then d(det M)=det M times trace(M inverse times the matrix obtained by applying d entrywise).

**Hypotheses:** R and A are commutative rings, A is an R-algebra, d is a native derivation into A, and n is a finite index type with decidable equality. M is a native matrix unit.

**Prerequisites:** `mathlib:Derivation`, `mathlib:Derivation.leibniz`, `mathlib:DualNumber`, `mathlib:DualNumber.eps_pow_two`, `mathlib:TrivSqZeroExt.inlHom`, `mathlib:Matrix.det_one_add_smul`, `mathlib:Matrix.det_mul`, `mathlib:RingHom.map_det`.

**Proof outline:**

1. Use the native dual-number ring A[epsilon] and the proof-local ring homomorphism a maps to a+epsilon d(a). Its multiplicativity is exactly Leibniz and epsilon squared equals zero. This is an adapter to the existing first-order determinant formula, not a new determinant or tangent carrier.
2. Let i:A to A[epsilon] be the existing inclusion. Entrywise first jets of M factor as i(M) times (1+epsilon i(M inverse times d(M))). The matrix inverse exists because M is an actual unit, not because any entry is invertible.
3. Apply determinant multiplicativity and map_det. The existing det_one_add_smul formula has a remainder divisible by epsilon squared, so it gives 1+epsilon trace(M inverse times d(M)). Compare second components to obtain the claimed formula. This proof also admits empty matrices and zero rings.

**Tests:**

- `NormLogDerivTests.empty_determinant` (degenerate): For the empty matrix unit its determinant is one, so every derivation sends it to zero.

**Acceptance:** No field, characteristic-zero, analytic derivative, factorial denominator or nonempty index assumption is used. Tau Ceti already has the tangent-at-identity trace theorem; this adapter uses Mathlib first-order determinants directly.

**Sources:** RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.; CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

### Weighted differentiation of Frobenius coordinates

`ColemanPowerSeries:L1/frobenius-coordinate-mahler-derivation` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_repr_mahlerDerivation` (lemma).

If c_i(F) is the i-th coordinate of F in the existing Frobenius basis, then c_i(partial F)=p partial(c_i(F))+i c_i(F), for every i with 0<=i<p.

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

**Prerequisites:** `ColemanPowerSeries:L1/frobenius-basis-expansion`, `ColemanPowerSeries:L1/frobenius-basis-values`, `ColemanPowerSeries:L1/frobenius-scalar-algebra`, `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation`, `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-value`, `mathlib:PowerSeries.derivative_subst`, `mathlib:PowerSeries.derivative_pow`.

**Proof outline:**

1. Differentiate F=sum_i phi(c_i(F))Y^i using the native derivation laws. The pinned formal chain rule applies because the constant coefficient of Y^p-1 is zero.
2. The chain rule gives partial(phi(a))=p phi(partial a), and differentiation of the finite power gives partial(Y^i)=iY^i. Constants p and i are fixed by phi.
3. Collect each term as phi(p partial(c_i(F))+i c_i(F))Y^i. Uniqueness of the existing Frobenius-basis coordinates gives the formula. There is no assertion that partial is B-linear for the Frobenius scalar action.

**Acceptance:** The p factor multiplies the derivative of the base coordinate; the basis index i contributes a separate term.

**Sources:** RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.; CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

### Differentiating the Frobenius multiplication matrix

`ColemanPowerSeries:L1/frobenius-matrix-mahler-derivation` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.phiBasis_mulMatrix_mahlerDerivation` (lemma).

Let M_F be the multiplication-by-F matrix in the Frobenius basis and H=diag(0,1,...,p-1). Then M_(partial F)=p partial(M_F)+H M_F-M_F H, where partial on a matrix means entrywise differentiation in the ordinary base ring.

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

**Prerequisites:** `ColemanPowerSeries:L1/frobenius-coordinate-mahler-derivation`, `ColemanPowerSeries:L1/frobenius-multiplication-matrix`, `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation`, `mathlib:Derivation.leibniz`.

**Proof outline:**

1. The j-th column of M_F consists of the coordinates of F Y^j. Differentiate that product: partial(F Y^j)=(partial F)Y^j+jF Y^j.
2. Compute its i-th coordinate also by the preceding coordinate lemma, obtaining p partial((M_F)_(i,j))+i(M_F)_(i,j). Move the term j(M_F)_(i,j) to the other side.
3. Left multiplication by H multiplies row i by i, and right multiplication by H multiplies column j by j. Matrix extensionality gives the stated connection identity.

**Tests:**

- `NormLogDerivTests.matrix_connection` (computation): For M=[[0,Y],[1,0]] and J=diag(0,1), 2 partial(M)+JM-MJ=M. This ring identity holds for the weighted derivative over every Z_p.

**Acceptance:** Rows are output coordinates and columns are input basis vectors. Reversing the commutator sign fails on multiplication by Y at p=2.

**Sources:** RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.; CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

### Integral trace of a logarithmic derivative

`ColemanPowerSeries:L2/coleman-trace-logarithmic-derivative` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.colemanTrace_logDeriv` (lemma).

For every actual unit u of B, tau(Delta u)=p Delta(N_units u), where N_units is the native unit map induced by the existing Coleman norm.

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

**Prerequisites:** `ColemanPowerSeries:L2/logarithmic-derivative`, `ColemanPowerSeries:L1/coleman-integral-trace`, `ColemanPowerSeries:L1/coleman-norm-matrix`, `ColemanPowerSeries:L1/frobenius-matrix-mahler-derivation`, `ColemanPowerSeries:L1/derivation-determinant-unit`, `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-value`, `mathlib:Units.map`, `mathlib:Algebra.trace_eq_matrix_trace`, `mathlib:Matrix.trace_mul_comm`, `mathlib:Matrix.trace_mul_cycle`.

**Proof outline:**

1. Map the actual unit u through the native left-multiplication matrix ring homomorphism to obtain an invertible matrix M. Multiplication by u inverse is exactly M inverse. The matrix of Delta u is M inverse times M_(partial u), because multiplication in B is commutative.
2. Insert the connection identity. The integral trace becomes p trace(M inverse partial M)+trace(M inverse H M)-trace(H). Cyclicity of matrix trace cancels the last two terms, with no division or separability argument.
3. Apply the formal-derivation determinant adapter to partial. The norm matrix formula identifies det M=N(u). Since N_units u is an actual unit, multiply by its inverse to obtain trace(M inverse partial M)=Delta(N_units u). This proves the integral equality with its factor p.

**Tests:**

- `NormLogDerivTests.trace_factor` (computation): For a unit u with underlying series Y, Delta u=1, so tau(Delta u)=p, not one.

**Acceptance:** Keep tau base-valued. An extra phi on the right would change the identity. The prime is multiplied, never inverted in B.

**Sources:** RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.; CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

### Coleman norm and bounded psi under logarithmic differentiation

`ColemanPowerSeries:L2/logarithmic-derivative-norm-psi` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_colemanNorm` (comparison).

For every unit u of B, Delta(N_units u)=psi(Delta u), with psi the actual PMIA bounded integral operator.

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

**Prerequisites:** `ColemanPowerSeries:L2/coleman-trace-logarithmic-derivative`, `ColemanPowerSeries:L1/coleman-trace-psi`.

**Proof outline:**

1. The new integral trace identity and the existing independent tau=p psi comparison give p Delta(N_units u)=p psi(Delta u).
2. B=Z_p[[T]] is an integral domain of characteristic zero and p is a nonzero natural prime. Cancel multiplication by p. This is cancellation in B, not a definition of psi by division.

**Acceptance:** This algebraic result includes p=2. It establishes no arithmetic interpolation or general ramified coefficient variant.

**Sources:** RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.; CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

### Norm-fixed units have psi-fixed logarithmic derivatives

`ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-psi-fixed` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.psi_logDeriv_normFixed` (lemma).

For every element u of the existing normFixedUnits subgroup, psi(Delta u)=Delta u.

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

**Prerequisites:** `ColemanPowerSeries:L2/logarithmic-derivative-norm-psi`, `ColemanPowerSeries:L1/coleman-norm-fixed-membership`, `mathlib:Units.map`.

**Proof outline:**

1. Membership gives N(u)=u as underlying series. Native unit extensionality identifies N_units u with u.
2. Substitute this equality into the norm/psi logarithmic-derivative comparison. This proves image containment without assuming surjectivity.

**Acceptance:** At p=2 the unit -Y is norm-fixed and maps to the series one. The source theorem about arithmetic towers is not used.

**Sources:** RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.; CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

### Logarithmic derivative on norm-fixed units

`ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv` (construction).

Construct the group homomorphism from the existing normFixedUnits subgroup to the additive psi-fixed submodule ker(psi-id), sending u to Delta u. Use the native Multiplicative type tag on that additive submodule to express the group homomorphism.

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

**Prerequisites:** `ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-psi-fixed`, `ColemanPowerSeries:L2/logarithmic-derivative-product`, `ColemanPowerSeries:L1/coleman-norm-fixed-units`, `PadicMeasuresIwasawaAlgebras:L2/psi-series`, `mathlib:LinearMap.ker`, `mathlib:Multiplicative`.

**Proof outline:**

1. The psi-fixed condition is exactly membership in the native kernel of the difference of two Z_p-linear maps. Package Delta u with the membership proof just established.
2. The existing logarithmic-derivative product formula says that multiplication of units becomes addition. Subtype extensionality and the native type tag give the homomorphism laws. No new fixed-series carrier, operator or measure is defined.

**Uses:** ColemanPowerSeries:L3/norm-fixed-logarithmic-derivative-kernel: The actual map whose kernel is computed. RJW Theorem12.9; ColemanPowerSeries:L3: The image-surjectivity and ensuing exact-sequence proof must use this map, with its native topologies.

**API:**

- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_val` (characterisation): The underlying series of the output is the existing Delta u.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_one` (simp): The unit identity maps to the additive zero, represented by one after the Multiplicative type tag.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_mul` (structure): The map sends multiplication to the tagged addition in the fixed submodule.

**Tests:**

- `NormLogDerivTests.identity` (degenerate): The unit identity maps to the additive zero of the fixed submodule.
- `NormLogDerivTests.constant` (compatibility): For c in Z_p units with c^(p-1)=1, the constant unit is norm-fixed and maps to zero.
- `NormLogDerivTests.dyadic_Y` (computation): At p=2, a unit with underlying series -(1+T) is norm-fixed and maps to the fixed series one.

**Acceptance:** The codomain is psi=1, not ker psi. The neutral element of its Multiplicative type tag is the zero series.

**Sources:** RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.; CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

### Continuity of the restricted logarithmic derivative

`ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-continuous` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.continuous_normFixedLogDeriv` (lemma).

The homomorphism normFixedLogDeriv is continuous for the native subgroup-of-units topology and the coefficientwise topology on ker(psi-id).

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

**Prerequisites:** `ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map`, `ColemanPowerSeries:L2/logarithmic-derivative`, `PadicMeasuresIwasawaAlgebras:L2/mahler-derivation-coefficients`, `mathlib:PowerSeries.WithPiTopology.continuous_coeff`, `mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`, `mathlib:Units.continuous_val`, `mathlib:Units.continuous_coe_inv`.

**Proof outline:**

1. The coefficient formula for partial F is (n+1)F_(n+1)+nF_n. Every coefficient is a finite continuous expression, so the existing coefficientwise topology makes partial continuous.
2. The unit value and inverse-value maps are continuous by the native Units topology. Multiplication is continuous in the power-series ring; hence Delta u=partial(u) times u inverse is continuous.
3. Restrict along the subgroup inclusion and package the existing membership proof in the submodule. The induced subtype topology and the native Multiplicative tag preserve continuity.

**Acceptance:** No continuity of ring inversion on all of B is asserted, and no coefficient supremum norm is substituted for the topology.

**Sources:** RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.; CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

### Kernel on norm-fixed units

`ColemanPowerSeries:L3/norm-fixed-logarithmic-derivative-kernel` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_eq_one_iff` (theorem).

For u in normFixedUnits, its image under normFixedLogDeriv is zero if and only if u is the constant unit associated with a c in Z_p units satisfying c^(p-1)=1.

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p-1). The explicit Frobenius scalar algebra and its basis Y^i, 0<=i<p, are the existing Coleman constructions. partial is the existing PMIA Mahler derivation Y D, psi is the independently constructed PMIA bounded integral operator, and Delta is the existing Coleman weighted logarithmic derivative on actual units. N and tau are base-valued determinant norm and trace. No coefficient Frobenius or division by p in B is introduced.

**Prerequisites:** `ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map`, `ColemanPowerSeries:L2/logarithmic-derivative-kernel`, `ColemanPowerSeries:L1/coleman-fixed-constant-units`, `mathlib:Units.map`.

**Proof outline:**

1. The native subtype and type tag identify zero output with Delta u=0. Z_p is additively torsion-free, so the existing formal logarithmic-derivative kernel theorem makes u constant.
2. Apply the constant-coefficient ring homomorphism to the actual unit u to obtain a unit c of Z_p. Equality of underlying series and unit extensionality identify u with the native constant-series image of c.
3. The existing norm-fixed constant-unit theorem is precisely c^(p-1)=1. Conversely such a c supplies a norm-fixed constant unit whose logarithmic derivative is zero.

**Tests:**

- `NormLogDerivTests.dyadic_minus_one` (non-example): The unit -1 in Z_2[[T]] is not norm-fixed, although its logarithmic derivative vanishes.

**Acceptance:** This is the kernel of the restricted logarithmic derivative, not the full Coleman-map kernel. The image-surjectivity and topological exactness parts of Theorem12.9 remain required. At p=2, the kernel constant is only one; -1 has zero logarithmic derivative on all units but is not norm-fixed.

**Sources:** RJW-published, Definition 12.8 and Lemma 12.10, printed pp.180-181 / PDF81-82; finite-free norm in Lemma10.8, printed p.167 / PDF68. The source proves the norm-fixed image assertion using root products. This checkpoint gives an independent integral matrix derivation from the already constructed Frobenius algebra, exposing the prime factor and basis commutator. The source does not state these matrix helpers separately.; CS-2006, Section 2.4, Definition 2.4.4 and Lemma 2.4.5, printed p.22 / PDF32. The image and constant-root kernel targets; the source fixes odd p. The all-prime algebraic statements here are independently derived and do not extend the arithmetic tower theorem.

### Preceding norm checkpoint validation

Before the fixed-space continuation below, the packet had 84 unchecked nodes, 51 API items, 73 packet tests
(36 for definitions and constructions), 75 typed examples, eight planets and
95 statement-read baseline references. All 75 predecessor node objects and
eleven source findings are preserved. Six gaps and twelve requests remain;
no stage is closed. The PMIA clopen request is narrowed to topology comparisons.

The full suggested file compiles at the pin with zero errors and 181 expected
placeholder warnings. Its actual PMIA supplier compiles with 317 placeholder
warnings. All 2,756 reached Mathlib source modules match the pin. A separate
complete Lean calculation proves the formal-derivation determinant adapter
and trace cancellation: one first-jet ring-homomorphism construction and six
lemmas, with zero errors, warnings or placeholders. These scratch proofs
validate the matrix argument; all roadmap nodes remain unchecked.

There are 2,427 passing exact arithmetic assertions over ℤ/p^k for p=2,3,5
and k=2,3,4. Coordinates are obtained by changing T=Y−1 and imposing Y^p=U;
determinants are computed by permutations. For units a+pG the geometric inverse
is an exact polynomial modulo p^k. This independently tests the connection,
Jacobi, integral trace, norm/ψ comparison, unit inverse and dyadic signs.
Eighteen controls reject a missing factor p and a reversed commutator.
Finite computations do not establish infinite-series identities or continuity.

That norm checkpoint freshly read the full published RJW PDF80–82 / printed179–181,
including Definition12.8, Theorem12.9 and Lemma12.10, and full Coates–Sujatha
PDF30–32 / printed20–22, including Definition2.4.4 and Lemma2.4.5. Both downloaded
files match the hashes recorded in the packet. The matrix proof and its
generality are independent worker derivations; the source instead uses root
products for image containment. Earlier source reading remains recorded in the
preceding sections, without a claim to have reread those entire sources here.

Continue with the image-surjectivity argument of Lemmas12.11–12.14 on the
actual norm-fixed units and actual ψ-fixed series, and combine it with the
fixed-space sequence supplied below. The constant-root kernel here
is only the kernel of the restricted logarithmic derivative. The complete
Coleman-map kernel, arithmetic interpolation and norm/evaluation compatibility,
coefficient extensions and local cyclotomic-unit quotient remain as specified
in the exact continuation boundary. No new carrier replaces a supplier's object.

## The fixed-space Frobenius sequence

Let B=ℤ_p[[T]], Y=1+T, φ(F)=F(Y^p−1), W=ker(ψ−id), and U=ker ψ.
The operator ψ is the existing bounded PMIA operator. Both kernels are native
submodules. All topologies here are coefficientwise p-adic, with the induced
topologies on submodules. This section proves the mathematical plan for

0 → ℤ_p → W → U → ℤ_p → 0,

whose maps are constant inclusion, 1−φ, and evaluation at T=0. The image of
1−φ consists precisely of the elements of U with zero evaluation. In
particular, Y belongs to U but cannot lie in that image. The **Frobenius exact
sequence** is the L3 planet; its kernel, range and topology are separate nodes.

The essential convergence argument is coefficientwise. The parameters
q_n=Y^(p^n)−1 tend to zero because each binomial coefficient is a continuous
function of p^n in ℤ_p. If F(0)=0, every coefficient of F(q_n) is a finite sum
of terms that tend to zero. Completeness and the nonarchimedean summability
criterion give the sum S(F)=Σ_n φ^n(F). Then (1−φ)S(F)=F; if ψ(F)=0, the
identity ψφ=id also gives ψS(F)=S(F). These facts supply exactness without
assuming surjectivity of the restricted logarithmic derivative.

This topology cannot be replaced with the T-adic topology: the coefficient of
T in q_n is p^n, always nonzero in ℤ_p. Nor is it the coefficient supremum
norm topology. The native product topology makes B compact Hausdorff, so
continuity and closedness of the fixed spaces identify the exact sequence's
quotient and subspace topologies.

### Source correction at the constants kernel

Finding **ColemanPowerSeries/E12** records a misprint in the proof of published
Lemma12.15, printed p.184 / PDF85, also present in arXiv v2 p.62. If r>0 is the
first nonzero positive coefficient of F, then coeff_r(φF)=p^r coeff_r(F).
The source prints p in place of p^r. For F=T² the coefficient is already p².
The corrected factor still implies that the fixed series are exactly constants:
1−p^r is nonzero, indeed a unit, in ℤ_p. The theorem is unchanged.

The published page was checked visually, the publisher's article and issue
pages were fetched, and the latest arXiv version was compared. Searches for an
erratum and an atlas-registry match found no identified correction. The author
publications page returned 404 and was not read. The finding's “new” marker
reports this bounded search, not a claim of priority; independent confirmation
remains the reviewer's task.

### Iterated cyclotomic substitution

`ColemanPowerSeries:L3/frobenius-iterate-substitution` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_iterate_substitution` (lemma).

For F in B and n≥0, phi iterated n times at F is F(Y^(p^n)−1).

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

**Prerequisites:** `mathlib:PowerSeries.substAlgHom`, `mathlib:PowerSeries.subst_comp_subst_apply`.

**Proof outline:**

1. The n=0 parameter is T, so substitution is the identity.
2. If q_n=Y^(p^n)−1, the substitution algebra homomorphism sends q_n to (Y^p)^(p^n)−1=q_(n+1). Apply the pinned substitution composition theorem and induction.

**Acceptance:** The zeroth iterate is F; the first parameter is Y^p−1. The exponent is p^n, not pn.

**Sources:** RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

### Decay of zero-constant Frobenius iterates

`ColemanPowerSeries:L3/frobenius-iterate-decay` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_iterate_tendsto_zero` (lemma).

For F in B with F(0)=0, the sequence phi^n(F) tends to zero in the coefficientwise p-adic topology.

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

**Prerequisites:** `ColemanPowerSeries:L3/frobenius-iterate-substitution`, `mathlib:PadicInt.norm_p`, `mathlib:tendsto_pow_atTop_nhds_zero_of_norm_lt_one`, `mathlib:PadicInt.continuous_choose`, `mathlib:PowerSeries.binomialSeries_coeff`, `mathlib:PowerSeries.binomialSeries_nat`, `mathlib:PowerSeries.binomialSeries_zero`, `mathlib:PowerSeries.coeff_subst'`, `mathlib:PowerSeries.le_order_pow_of_constantCoeff_eq_zero`, `mathlib:PowerSeries.coeff_of_lt_order`, `mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`.

**Proof outline:**

1. The norm of p in Z is p inverse, strictly less than one. Thus p^n tends to zero. Continuity of each p-adic binomial coefficient gives Y^(p^n)−1 tending coefficientwise to zero, using the existing binomial-series natural-parameter and zero-parameter formulas.
2. For any zero-constant b, coeff_d(F(b)) is the finite sum over 0≤k≤d of coeff_k(F) coeff_d(b^k). The pinned order bound makes every term k>d vanish in the existing substitution coefficient formula. This is a proof-local specialization of baseline substitution, not a second substitution constructor.
3. The k=0 term vanishes because F(0)=0. For each of the finitely many k>0, continuity of power, multiplication and coefficient extraction sends the term to zero. Apply the coefficientwise convergence criterion.

**Tests:**

- `frobenius_nonzero_constant` (non-example): The constant-one iterate sequence is not summable; its constant coefficient never tends to zero.

**Acceptance:** The assumption F(0)=0 is essential: phi fixes every constant. This is not T-adic convergence; the linear coefficient of phi^n(T) is the nonzero p^n.

**Sources:** RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

### Summability of Frobenius iterates

`ColemanPowerSeries:L3/frobenius-iterate-summability` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_iterate_summable` (lemma).

For F in B with F(0)=0, the family (phi^n(F)) indexed by natural numbers is summable in B.

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

**Prerequisites:** `ColemanPowerSeries:L3/frobenius-iterate-decay`, `mathlib:PowerSeries.WithPiTopology.summable_iff_summable_coeff`, `mathlib:NonarchimedeanGroup.multipliable_iff_tendsto_cofinite_one`, `mathlib:Nat.cofinite_eq_atTop`, `mathlib:PowerSeries.WithPiTopology.continuous_coeff`.

**Proof outline:**

1. Project the decay statement to each coefficient in the complete nonarchimedean additive group Z.
2. Apply the generated additive form of the pinned nonarchimedean summability criterion; on the natural numbers cofinite equals atTop. Each coefficient family is summable.
3. The native power-series summability criterion assembles these coefficient sums into a summable B-valued family. This proves unconditional summability, not merely convergence of one chosen subsequence.

**Acceptance:** No norm on all coefficient sequences, division by p or analytic radius is assumed.

**Sources:** RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

### The Frobenius-iterate sum

`ColemanPowerSeries:L3/frobenius-sum` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum` (construction).

For F in B together with F(0)=0, define frobeniusSum(F) to be the native topological sum of phi^n(F) over n≥0.

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

**Prerequisites:** `ColemanPowerSeries:L3/frobenius-iterate-summability`, `mathlib:Multipliable.hasProd`.

**Proof outline:**

1. Use the existing topological sum on B. Summability supplies its convergence, so the default value attached to a nonsummable family never enters this domain.
2. Its constant coefficient is zero because every summand has zero constant coefficient. Addition and scalar multiplication commute with the convergent sums by continuity.

**Uses:** RJW Lemma12.15; ColemanPowerSeries:L3/psi-fixed-boundary-range: Produces a preimage of every psi-zero series of zero constant term. ColemanPowerSeries:L3/frobenius-sum-telescoping: The defining sum solves the 1−phi equation.

**API:**

- `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_hasSum` (characterisation): The iterate family has sum frobeniusSum(F); promoted to frobenius-sum-has-sum.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_eq_tsum` (compatibility): frobeniusSum(F) is the existing topological sum of the actual Frobenius iterates.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_constantCoeff` (simp): The constant coefficient of frobeniusSum(F) is zero.
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_add` (structure): For F(0)=G(0)=0, frobeniusSum(F+G)=frobeniusSum(F)+frobeniusSum(G).
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_smul` (structure): For c in Z and F(0)=0, frobeniusSum(cF)=c frobeniusSum(F).

**Tests:**

- `frobenius_sum_zero` (degenerate): frobeniusSum(0)=0.
- `frobenius_sum_telescope` (compatibility): frobeniusSum(T−phi(T))=T, recovering the zero-constant solution.
- `frobenius_sum_dyadic` (computation): At p=2 and F=Y−Y^3, coeff_1(frobeniusSum(F))=2 and 3 coeff_2(frobeniusSum(F))=1 in Z_2.

**Acceptance:** This is a source-specific convergent-sum adapter on the stated domain. It does not claim a right inverse on series of arbitrary constant term.

**Sources:** RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

### Convergence to the Frobenius sum

`ColemanPowerSeries:L3/frobenius-sum-has-sum` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_hasSum` (lemma).

For F in B with F(0)=0, the iterate family has sum frobeniusSum(F).

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

**Prerequisites:** `ColemanPowerSeries:L3/frobenius-sum`, `ColemanPowerSeries:L3/frobenius-iterate-summability`, `mathlib:Multipliable.hasProd`.

**Proof outline:**

1. Unfold the source-specific sum adapter and apply the generated additive Summable.hasSum theorem at the established summability proof.

**Acceptance:** The target is the actual sum in B, with its existing Hausdorff coefficientwise topology.

**Sources:** RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

### The Frobenius sum solves the difference equation

`ColemanPowerSeries:L3/frobenius-sum-telescoping` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobeniusSum_sub_phi` (lemma).

For F in B with F(0)=0, frobeniusSum(F)−phi(frobeniusSum(F))=F.

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

**Prerequisites:** `ColemanPowerSeries:L3/frobenius-sum-has-sum`, `mathlib:HasProd.map`, `mathlib:hasProd_nat_add_iff`, `mathlib:PowerSeries.coeff_subst'`, `mathlib:PowerSeries.le_order_pow_of_constantCoeff_eq_zero`, `mathlib:PowerSeries.coeff_of_lt_order`, `mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`.

**Proof outline:**

1. For the fixed zero-constant substitution parameter Y^p−1, every output coefficient depends on finitely many input coefficients by the pinned substitution and order formulas. Therefore phi is continuous.
2. The generated additive HasSum.map theorem applies to the substitution homomorphism. It maps the defining sum to the shifted family phi^(n+1)(F).
3. The additive natural-index shift formula identifies this sum with frobeniusSum(F)−F. Hausdorff uniqueness gives the displayed difference equation.

**Acceptance:** The boundary is 1−phi; reversing its sign changes the result to −F.

**Sources:** RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

### Psi invariance of the Frobenius sum

`ColemanPowerSeries:L3/frobenius-sum-psi-fixed` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.psi_frobeniusSum` (lemma).

If F(0)=0 and psi(F)=0, then psi(frobeniusSum(F))=frobeniusSum(F).

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

**Prerequisites:** `ColemanPowerSeries:L3/frobenius-sum-has-sum`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-phi`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-continuous`, `mathlib:HasProd.map`, `mathlib:hasProd_nat_add_iff`.

**Proof outline:**

1. Map the convergent sum through the actual continuous linear operator psi.
2. Its zeroth term is psi(F)=0. For every n≥0 the next term satisfies psi(phi^(n+1)(F))=phi^n(F) by the supplied power-series left-inverse theorem.
3. Remove the zero first term with the additive shift formula and use uniqueness of the sum.

**Acceptance:** The psi-zero hypothesis is independent of the constant-term hypothesis; both are required for this construction.

**Sources:** RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

### The leading coefficient under Frobenius

`ColemanPowerSeries:L3/frobenius-leading-coefficient` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_leading_coefficient` (lemma).

Let r>0 and suppose coeff_k(F)=0 for 0<k<r. Then coeff_r(phi(F))=p^r coeff_r(F). The constant coefficient of F is unrestricted.

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

**Prerequisites:** `mathlib:PowerSeries.coeff_subst'`, `mathlib:PowerSeries.le_order_pow_of_constantCoeff_eq_zero`, `mathlib:PowerSeries.coeff_of_lt_order`.

**Proof outline:**

1. In the coefficient-r substitution formula, terms k>r vanish by the order bound, terms 0<k<r vanish by assumption, and the k=0 constant contributes no positive-degree coefficient.
2. The parameter Y^p−1 has zero constant coefficient and linear coefficient p. In its r-th power, the only contribution to degree r selects the linear term in all r factors, giving p^r.

**Tests:**

- `frobenius_leading_square` (non-example): For p=2 and F=T^2, coeff_2(phi(F))=4 and is not 2 in Z_2.

**Acceptance:** Source finding E12 corrects the printed p to p^r. The conclusion does not assume the coefficient at r is nonzero.

**Sources:** RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

### Frobenius fixes exactly the constants

`ColemanPowerSeries:L3/frobenius-fixed-constants` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_fixed_iff_constant` (theorem).

For F in B, phi(F)=F if and only if F is the native constant series C(F(0)).

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

**Prerequisites:** `ColemanPowerSeries:L3/frobenius-leading-coefficient`, `mathlib:PowerSeries.substAlgHom`.

**Proof outline:**

1. Substitution fixes every scalar constant. Conversely, if F has a nonzero positive coefficient, choose its least positive index r.
2. The corrected leading-coefficient formula gives (1−p^r) coeff_r(F)=0. The integer 1−p^r is nonzero since p≥2 and r>0; the characteristic-zero domain Z therefore forces coeff_r(F)=0, a contradiction.
3. All positive coefficients vanish, so coefficient extensionality identifies F with C(F(0)).

**Acceptance:** The argument includes p=2. No division by r or by p is used.

**Sources:** RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

### The fixed-space Frobenius boundary

`ColemanPowerSeries:L3/psi-fixed-boundary` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary` (construction).

Define psiFixedBoundary:W→U to be the native Z-linear map F↦F−phi(F), with its codomain restricted to U.

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/psi-series-phi`, `PadicMeasuresIwasawaAlgebras:L2/series-unit-restriction`, `mathlib:LinearMap.ker`, `mathlib:PowerSeries.substAlgHom`.

**Proof outline:**

1. For F in W, psi(F−phi(F))=psi(F)−F=0 by the existing left-inverse theorem. This supplies membership in the actual kernel U.
2. The difference of the identity and the native substitution linear map is Z-linear. Restrict its domain to W and codomain to U with the membership proof.
3. On W one has F−phi(F)=F−phi(psi(F)); the supplied series-unit-restriction comparison therefore identifies the boundary with the existing unit-support projector on these inputs.

**Uses:** RJW Lemma12.15: This is the middle map of the five-term fixed-space sequence. RJW Theorems12.9 and12.17; ColemanPowerSeries:L3: Combines with the separate restricted logarithmic derivative and unit-supported inverse derivative once the remaining arithmetic comparisons are established.

**API:**

- `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_val` (characterisation): The underlying series of psiFixedBoundary(F) is F−phi(F).
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_add` (structure): psiFixedBoundary(F+G)=psiFixedBoundary(F)+psiFixedBoundary(G).
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_smul` (structure): psiFixedBoundary(cF)=c psiFixedBoundary(F).
- `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_unitRestriction` (compatibility): For F in W, the underlying output is F−phi(psi(F)), the imported unit-restriction projector.

**Tests:**

- `psi_fixed_boundary_zero` (degenerate): psiFixedBoundary(0)=0.
- `psi_fixed_boundary_constant` (computation): Every constant series C(c) in W is killed by psiFixedBoundary.
- `psi_fixed_boundary_projection` (compatibility): On every F in W, the underlying boundary agrees with F−phi(psi(F)).

**Acceptance:** The domain is psi-fixed series; on arbitrary B the map 1−phi does not land in ker psi.

**Sources:** RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

### Kernel of the fixed-space boundary

`ColemanPowerSeries:L3/psi-fixed-boundary-kernel` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_eq_zero_iff` (theorem).

For F in W, psiFixedBoundary(F)=0 if and only if there exists c in Z with underlying series F=C(c).

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

**Prerequisites:** `ColemanPowerSeries:L3/psi-fixed-boundary`, `ColemanPowerSeries:L3/frobenius-fixed-constants`, `PadicMeasuresIwasawaAlgebras:L2/psi-series`, `mathlib:PowerSeries.C_injective`.

**Proof outline:**

1. Unpack zero in the native subtype: the boundary vanishes precisely when phi(F)=F. Apply the Frobenius-fixed constants theorem.
2. The supplied psi(1)=1 and Z-linearity give psi(C(c))=C(c), so every constant lies in W and is killed. Native C is injective; its constant coefficient recovers c.

**Acceptance:** This is exactness at W for the constant inclusion Z→W. It is distinct from the constant-root kernel of the logarithmic derivative on units.

**Sources:** RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

### The evaluation obstruction to the Frobenius boundary

`ColemanPowerSeries:L3/psi-fixed-boundary-range` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_range` (theorem).

The range of psiFixedBoundary equals the kernel of the native coefficient-zero linear map restricted to U.

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

**Prerequisites:** `ColemanPowerSeries:L3/psi-fixed-boundary`, `ColemanPowerSeries:L3/frobenius-sum-telescoping`, `ColemanPowerSeries:L3/frobenius-sum-psi-fixed`, `mathlib:LinearMap.ker`.

**Proof outline:**

1. The constant coefficient of F−phi(F) is zero because substitution at Y^p−1 preserves the constant coefficient. Thus every boundary is in the stated evaluation kernel.
2. If G is in U with G(0)=0, the Frobenius sum has psi-fixed underlying series by the preceding lemma. Package that series as an element of W.
3. The telescoping equation says its boundary is G. This proves the reverse inclusion as an equality of native submodules, with no assumed image-surjectivity result for logarithmic differentiation.

**Tests:**

- `boundary_evaluation_obstruction` (non-example): The series Y has psi(Y)=0 and evaluation one, so it is not a boundary.

**Acceptance:** The target is the zero-evaluation submodule of U; psiFixedBoundary is not surjective onto all U.

**Sources:** RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

### Surjectivity of evaluation on the psi kernel

`ColemanPowerSeries:L3/psi-kernel-evaluation-surjective` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiKernel_eval_surjective` (lemma).

The native coefficient-zero map U→Z is surjective; a section on values is c↦cY.

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/psi-series`, `mathlib:LinearMap.ker`.

**Proof outline:**

1. The supplied psi(Y)=0 and linearity put cY in U for every c in Z.
2. Its constant coefficient is c because Y(0)=1. This proves surjectivity without choosing a lift through psiFixedBoundary.

**Acceptance:** Evaluation on U is nonzero, so the final Z in the five-term sequence cannot be omitted.

**Sources:** RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

### Topology of the fixed-space sequence

`ColemanPowerSeries:L3/psi-fixed-boundary-topology` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.psiFixedBoundary_topology` (theorem).

The native constant inclusion Z→B is a closed embedding. The boundary W→U is continuous with closed image and its map onto that image is a quotient map. The native evaluation U→Z is continuous and a quotient map. Together with the preceding algebraic kernel, range and surjectivity statements, this gives the five-term topological exact sequence 0→Z→W→U→Z→0.

**Hypotheses:** p is any prime, including 2; Z=Z_p, B=Z[[T]], Y=1+T and phi(F)=F(Y^p−1), implemented by the native substitution algebra homomorphism. B carries the coefficientwise p-adic topology. psi is the actual PMIA bounded integral linear operator. W=ker(psi−id) and U=ker(psi) are native Z-submodules of B with their induced topologies. There is no new measure, power-series carrier or Frobenius operator.

**Prerequisites:** `ColemanPowerSeries:L3/psi-fixed-boundary`, `ColemanPowerSeries:L3/psi-fixed-boundary-kernel`, `ColemanPowerSeries:L3/psi-fixed-boundary-range`, `ColemanPowerSeries:L3/psi-kernel-evaluation-surjective`, `PadicMeasuresIwasawaAlgebras:L2/psi-series-continuous`, `PadicMeasuresIwasawaAlgebras:L2/phi-psi-series-continuous`, `mathlib:PadicInt.compactSpace`, `mathlib:Pi.compactSpace`, `mathlib:PowerSeries.WithPiTopology.continuous_C`, `mathlib:PowerSeries.C_injective`, `mathlib:PowerSeries.WithPiTopology.continuous_coeff`, `mathlib:Continuous.isClosedEmbedding`, `mathlib:Topology.IsQuotientMap.of_surjective_continuous`, `mathlib:isCompact_range`, `mathlib:IsCompact.isClosed`.

**Proof outline:**

1. The native coefficient topology identifies B with a product of compact Hausdorff copies of Z. Continuity of psi makes U and W closed submodules, hence compact Hausdorff.
2. Constant inclusion is continuous and injective, so the compact-to-Hausdorff closed-embedding theorem applies; its image lies in W. On W the boundary agrees with id−phi psi, continuous by the exact supplied averaging-projector node. Coefficient-zero evaluation is a native continuous coefficient map restricted to U.
3. The boundary has compact, hence closed, image. Its range restriction is continuously surjective from compact W to its Hausdorff image; apply the native quotient-map theorem. Apply the same theorem to surjective evaluation from compact U. These identify the subspace and quotient topologies in the algebraically exact sequence.

**Acceptance:** Only the fixed-series sequence is asserted here. The logarithmic-derivative surjectivity, arithmetic Coleman sequence, G-action and finite-flat completed-tensor comparisons remain separate gaps.

**Sources:** RJW-published, Lemma12.15 and its proof, printed pp.183–184 / PDF84–85; the preceding Lemmas12.12–12.14 were also read in PDF83–84.. Declaration-sized decomposition of the fixed-space exact sequence. The source proof is expanded using coefficientwise binomial continuity and finite substitution coefficients. The independent integral proof includes p=2; it does not extend the arithmetic tower theorems to p=2. The leading-coefficient misprint is recorded as E12.

### Fixed-space validation and continuation

The current packet contains 98 unchecked nodes, 60 API items, 82 packet tests
(42 for definitions and constructions), 84 typed examples, nine planets,
109 baseline references, six gaps and twelve requests. All 84 preceding node
objects, 95 preceding baseline records and eleven preceding source findings
are retained. Finding E12 is added without an independent-review verdict.
No whole stage is closed.

The complete suggested file compiles with zero errors and 212 expected
placeholder warnings only. Its actual imported PMIA file compiles with 339
placeholder warnings. All 2,759 reached Mathlib modules match the pin; no
Tau Ceti source module is reached. The nine complete scratch lemmas for the
convergence chain compile with zero errors, warnings or placeholders, using
2,036 pinned Mathlib modules. They check the iterated substitution formula,
parameter decay, the finite coefficient bound, summability and continuity
of zero-constant substitution; the packet and suggested file remain plans.

The finite harness passes 1,216,524 exact assertions for p=2,3,5 and precisions
p², p³ and p⁴. Truncated coefficients test iterates, finite telescoping and
preimages; sparse Y-polynomials compute ψ before truncation, since ψ does not
descend to a naive T-adic truncation. Exhaustive degree-three checks of the
fixed kernel modulo p² are run within each precision batch. Integer controls
reject the missing exponent and T-adic decay. Finite computations do not
prove continuity, summability or the infinite sequence.

This follow-up freshly read the full published PDF83–85 / printed182–184,
the full preprint v2 p.62 and the rendered published p.184. Prior source
reading and determinant verification remain attributed to their checkpoints.
Continue with RJW Lemmas12.11–12.14: prove logarithmic-derivative image
surjectivity on the actual norm-fixed subgroup. Combine that sequence with
the present fixed-space sequence only after proving the actual tower,
interpolation and action comparisons. The arithmetic Coleman kernel,
cyclotomic-moment cokernel, coefficient extensions and local cyclotomic-unit
quotient retain the packet's explicit continuation requirements.

### Current supplier topology interfaces

The updated PMIA packet has 157 nodes and preserves every earlier operator
interface. Its L0 clopen weak restriction, closed embedding and decomposition
homeomorphism are supplied. The field-valued operator-norm bounds, inclusion
isometry and strong homeomorphisms require a nontrivially normed field.
L2 `unit-measure-kernel-weak-homeomorphism`,
`integral-amice-weak-homeomorphism` and `unit-measure-amice-weak-homeomorphism`
identify the actual weak unit measures with the coefficientwise psi kernel.
These are imported interfaces, not Coleman constructions. The existing L0
request is narrowed to the remaining integral-lattice/field-valued norm-model
comparison, including finite-flat coefficient lattices required by Coleman.
The full fifteen new supplier interfaces and suggested-file diff were read;
no independent review is claimed. The fixed-space nodes themselves are unchanged.


## Closed image and lifting from characteristic p

Write S for the existing group of norm-fixed units and W for the native
psi-fixed submodule. The compact coefficient ring makes the native units
compact. Continuity of the actual determinant norm then makes S a closed,
compact subgroup. The existing continuous logarithmic derivative consequently
has closed image in B. This is the topological input to the lifting argument.

The algebraic input is saturation: if p^n H is psi-fixed, coefficientwise
cancellation and Z_p-linearity show that H is psi-fixed. In particular a
divided error remains in the domain of the residual image hypothesis. Start
with any fixed target F and an approximation satisfying Delta(u)−F=p^n H.
Choose a norm-fixed unit v with Delta(v) congruent to H modulo p. The corrected
unit u v^(−p^n) has error −p^n(Delta(v)−H), divisible by p^(n+1). The sign
comes from the stated error convention. Multiplication by v^(+p^n) would fail.

Induction gives arbitrary precision if every fixed series has a residual
logarithmic-derivative preimage. Choose one approximant at each precision.
The logarithmic derivatives converge coefficientwise to F because the integral
quotients have coefficient norms at most one. The units themselves need not
form a convergent sequence. Closedness of the image produces an actual preimage
of F, which proves the conditional surjectivity theorem.

Finally the residual preimage may be sought among all units of F_p[[T]]. The
pinned local-ring theorem lifts any such unit to an integral power-series
unit. The already constructed norm limit turns that lift into a norm-fixed
unit without changing its residue. Coefficient change for Delta then gives
the exact equivalence with the characteristic-p image condition. The residue-image continuation below proves this condition by decomposing
Lemmas12.13–12.14. Their rational
expression must be replaced by a legitimate integral identity or accompanied
by a separately justified localization; the earlier E8 domain issue remains.

All nine declarations include p=2 using integral arguments. They supply no
arithmetic tower at that prime, no new compactness theorem for generic units,
and no second measure, psi operator or norm-limit construction.

### Compactness of norm-fixed units

`ColemanPowerSeries:L3/norm-fixed-units-compact` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.compactSpace_normFixedUnits` (lemma).

The existing normFixedUnits subgroup S is a compact space.

**Hypotheses:** p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod.

**Proof outline:**

1. The native coefficient topology makes B a compact Hausdorff ring. Use the native compactness instance on B units, supplied by its closed embedding into B times its opposite; no new compact-units theorem is planned.
2. The defining equality N(u)=u is an equalizer of continuous maps on B units, by norm continuity and continuous unit coercion. It is therefore closed in that compact space.
3. A closed subset of a compact space is compact. Transport this compactness to the existing subgroup carrier using isCompact_iff_compactSpace.

**Prerequisites:** `ColemanPowerSeries:L1/coleman-norm-fixed-units`, `ColemanPowerSeries:L1/coleman-norm-continuous`, `mathlib:PadicInt.compactSpace`, `mathlib:Pi.compactSpace`, `mathlib:Units.isClosedEmbedding_embedProduct`, `mathlib:Units.continuous_val`, `mathlib:isClosed_eq`, `mathlib:isCompact_iff_compactSpace`.

**Acceptance:** Compactness uses both coefficientwise topology and the proven continuity of the actual norm. It does not follow merely from the subgroup laws.

**Sources:** RJW-published, Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83; surrounding PDF80–85 freshly read in full. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

### Closed logarithmic-derivative image

`ColemanPowerSeries:L3/logarithmic-derivative-image-closed` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.isClosed_range_normFixedLogDeriv` (lemma).

The set {Delta(u) : u∈S} is closed in the coefficientwise topology of B.

**Hypotheses:** p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod.

**Proof outline:**

1. Compose the existing continuous restricted logarithmic derivative with the native submodule inclusion into B.
2. Its domain S is compact by norm-fixed-units-compact, so its image in B is compact. Since B is Hausdorff, that image is closed.

**Prerequisites:** `ColemanPowerSeries:L3/norm-fixed-units-compact`, `ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-continuous`, `mathlib:isCompact_range`, `mathlib:IsCompact.isClosed`.

**Acceptance:** The ambient closed image is precisely the image of the actual Delta map on S. No surjectivity or choice of a continuous inverse is assumed.

**Sources:** RJW-published, Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83; surrounding PDF80–85 freshly read in full. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

### Division by powers of p in fixed series

`ColemanPowerSeries:L3/psi-fixed-p-saturation` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.psi_p_pow_fixed_iff` (lemma).

For every n≥0 and F∈B, psi(p^n F)=p^n F if and only if psi(F)=F.

**Hypotheses:** p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod.

**Proof outline:**

1. Z-linearity moves the constant scalar p^n through psi. Rewrite constant multiplication as the native Z-scalar action.
2. In each coefficient, cancel the nonzero element p^n of the characteristic-zero domain Z_p. Equality of all coefficients yields psi(F)=F. Conversely, scalar linearity preserves any fixed series. No torsion-freeness instance for an unspecified module is presumed.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2/psi-series`, `mathlib:PowerSeries.smul_eq_C_mul`, `mathlib:PowerSeries.coeff_C_mul`, `mathlib:PadicInt.norm_p`.

**Unit tests:**

- `LogImageTests.p_saturation` (characterisation): For F∈B, psi(pF)=pF if and only if psi(F)=F.

**Acceptance:** At n=0 this is the original fixed condition. Cancellation is integral and does not introduce 1/p in B.

**Sources:** RJW-published, Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83; surrounding PDF80–85 freshly read in full. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

### Coefficientwise convergence from integral precision

`ColemanPowerSeries:L3/p-power-precision-limit` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.tendsto_of_p_pow_dvd_sub` (lemma).

For any sequence f:N→B and target F∈B, if p^n divides f(n)−F for every n≥0, then f(n) tends coefficientwise to F.

**Hypotheses:** p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod.

**Proof outline:**

1. Choose integral quotients q_n with f(n)−F=p^n q_n. For every coefficient j the difference is p^n coeff_j(q_n).
2. All coefficients of every q_n have p-adic norm at most one; hence each error coefficient has norm at most p^(−n), independent of n and j. Squeeze against the geometric sequence tending to zero.
3. Use the native coefficientwise convergence criterion for power series. No uniform bound on the degree, no stabilization of the q_n, and no T-adic convergence assertion are required.

**Prerequisites:** `mathlib:PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`, `mathlib:PowerSeries.coeff_C_mul`, `mathlib:PadicInt.norm_p_pow`, `mathlib:PadicInt.norm_le_one`, `mathlib:tendsto_pow_atTop_nhds_zero_of_norm_lt_one`, `mathlib:squeeze_zero`.

**Unit tests:**

- `LogImageTests.varying_quotient_decay` (compatibility): For any q:N→B, the sequence p^n q(n) converges coefficientwise to zero.

**Acceptance:** Even an arbitrary varying integral quotient q_n satisfies p^n q_n→0 coefficientwise.

**Sources:** RJW-published, Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83; surrounding PDF80–85 freshly read in full. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

### The signed precision correction

`ColemanPowerSeries:L3/logarithmic-derivative-precision-step` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_precision_step` (lemma).

Let u,v∈S, F,H∈B and n≥0. If Delta(u)−F=p^n H and p divides Delta(v)−H, then p^(n+1) divides Delta(u v^(−p^n))−F.

**Hypotheses:** p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod.

**Proof outline:**

1. The subgroup S is closed under signed integer powers and multiplication, so u v^(−p^n) remains an actual norm-fixed unit.
2. The product and signed-power formulas give Delta(u v^(−p^n))−F=(Delta(u)−F)−p^n Delta(v).
3. Write Delta(v)−H=pQ. The new error is −p^n(Delta(v)−H)=p^(n+1)(−Q), which gives the explicit integral quotient.

**Prerequisites:** `ColemanPowerSeries:L1/coleman-norm-fixed-units`, `ColemanPowerSeries:L2/logarithmic-derivative-product`, `ColemanPowerSeries:L2/logarithmic-derivative-integer-powers`.

**Acceptance:** The error convention is Delta(u)−F. With that convention the exponent must be −p^n. At odd p a positive exponent fails for residual error H=1 and Delta(v)=1.

**Sources:** RJW-published, Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83; surrounding PDF80–85 freshly read in full. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

### Approximation at every p-adic precision

`ColemanPowerSeries:L3/logarithmic-derivative-precision-approximation` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.logDeriv_approximate_mod_p_pow` (lemma).

Under the residual image hypothesis, for every F∈W and n≥0 there exists u∈S with p^n dividing Delta(u)−F.

**Hypotheses:** p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod. Residual image hypothesis: for every F∈B with psi(F)=F, some u∈S satisfies rho(Delta(u))=rho(F). This is a hypothesis, not a supplied image theorem.

**Proof outline:**

1. At n=0 choose u=1; divisibility by one is automatic.
2. At precision n choose H with Delta(u)−F=p^n H. Both Delta(u) and F are psi-fixed; Z-linearity and psi-fixed-p-saturation show that H is psi-fixed.
3. Apply the residual image hypothesis to H. The existing residue-series-congruence criterion converts equality of reductions into p-divisibility of Delta(v)−H.
4. Apply logarithmic-derivative-precision-step to u and v to obtain precision n+1. This induction does not use a logarithmic derivative on a nonunit or divide inside B.

**Prerequisites:** `ColemanPowerSeries:L3/psi-fixed-p-saturation`, `ColemanPowerSeries:L3/logarithmic-derivative-precision-step`, `ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-psi-fixed`, `ColemanPowerSeries:L1/residue-series-congruence`, `PadicMeasuresIwasawaAlgebras:L2/psi-series`, `ColemanPowerSeries:L2/logarithmic-derivative-constants`.

**Unit tests:**

- `LogImageTests.zero_precision` (degenerate): For every F∈B, p^0 divides Delta(1)−F.

**Acceptance:** All n≥0 are included. The hypothesis quantifies over every fixed residual target, including the divided errors arising during induction.

**Sources:** RJW-published, Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83; surrounding PDF80–85 freshly read in full. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

### Surjectivity from the residual image condition

`ColemanPowerSeries:L3/logarithmic-derivative-surjective-mod-p` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_surjective_of_mod_p` (theorem).

Under the residual image hypothesis, the existing group homomorphism normFixedLogDeriv:S→Multiplicative(W) is surjective.

**Hypotheses:** p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod. Residual image hypothesis: for every F∈B with psi(F)=F, some u∈S satisfies rho(Delta(u))=rho(F). This is a hypothesis, not a supplied image theorem.

**Proof outline:**

1. For F∈W choose u_n∈S whose logarithmic derivatives agree with F modulo p^n, using the precision-approximation lemma.
2. The precision-limit lemma shows Delta(u_n)→F in B. Each term is in the actual logarithmic-derivative image, which is closed; therefore F is also in that image.
3. Convert the ambient equality Delta(u)=F into equality in the native psi-fixed submodule and its Multiplicative tag. No convergence of the chosen u_n themselves is needed.

**Prerequisites:** `ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map`, `ColemanPowerSeries:L3/logarithmic-derivative-precision-approximation`, `ColemanPowerSeries:L3/p-power-precision-limit`, `ColemanPowerSeries:L3/logarithmic-derivative-image-closed`, `mathlib:IsClosed.mem_of_tendsto`.

**Acceptance:** This is a conditional lifting theorem. Full Theorem12.9 still requires the characteristic-p image condition; the word surjective does not discharge that separate gap.

**Sources:** RJW-published, Lemmas12.11–12.12 and their proofs, printed181–182 / PDF82–83; surrounding PDF80–85 freshly read in full. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

### Norm-fixed lifts of residue-series units

`ColemanPowerSeries:L3/norm-fixed-unit-residue-surjective` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.residue_normFixedUnits_surjective` (theorem).

Every v∈B_0 units is the reduction of some u∈S. Equivalently, the native units map induced by rho, restricted to S, is surjective.

**Hypotheses:** p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod.

**Proof outline:**

1. The reduction Z→F_p is onto by ZMod.ringHom_surjective, so its native power-series map rho is onto. B is a local ring and B_0 is nontrivial; the native surjective-local-hom theorem makes rho a local homomorphism.
2. Apply the existing generic theorem that a surjective local ring homomorphism induces a surjection on units. Choose an actual integral series unit w lifting v. This generic unit-lifting theorem is cited, not duplicated as a new roadmap node.
3. Apply the already constructed norm limit L to w. Its value is an actual unit, is fixed by N, and satisfies L(w)−w∈pB by precision at iteration zero.
4. The residue congruence criterion gives rho(L(w))=rho(w). Native unit extensionality upgrades that equality of series to equality of the reduced units, producing the required member of S.

**Prerequisites:** `ColemanPowerSeries:L1/coleman-norm-fixed-units`, `ColemanPowerSeries:L1/coleman-norm-limit`, `ColemanPowerSeries:L1/coleman-norm-limit-precision`, `ColemanPowerSeries:L1/coleman-norm-limit-fixed`, `ColemanPowerSeries:L1/coleman-norm-limit-unit`, `ColemanPowerSeries:L1/residue-series-congruence`, `mathlib:PowerSeries.map_surjective`, `mathlib:ZMod.ringHom_surjective`, `mathlib:IsLocalHom.of_surjective`, `mathlib:IsLocalRing.surjective_units_map_of_local_ringHom`, `mathlib:Units.map`.

**Unit tests:**

- `LogImageTests.dyadic_unit_lift` (compatibility): Every unit of F_2[[T]] is the reduction of an actual norm-fixed unit of Z_2[[T]].

**Acceptance:** This is surjectivity onto all residue-series units, not just those with constant coefficient one. It includes p=2 using the preceding all-prime norm-limit construction.

**Sources:** RJW-published, Lemma12.12, printed182 / PDF83; the norm-limit input is already decomposed in L1. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

### Reduction to the characteristic-p image calculation

`ColemanPowerSeries:L3/logarithmic-derivative-residue-image-equivalence` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_surjective_iff_residue_logDeriv` (theorem).

The actual map normFixedLogDeriv is surjective if and only if, for every F∈B with psi(F)=F, there exists v∈B_0 units such that Delta(v)=rho(F), where the right-hand Delta is the existing logarithmic derivative over F_p.

**Hypotheses:** p is any prime, including 2. Put Z=Z_p, B=Z[[T]], B_0=F_p[[T]] and Y=1+T. The topology on B is coefficientwise p-adic convergence; B units and all subgroups have their native induced topologies. N is the existing determinant Coleman norm, S is its existing norm-fixed subgroup of B units, Delta(u)=Y D(u) u^(-1) is the existing logarithmic derivative, and psi is the actual PMIA Z-linear bounded integral operator. W=ker(psi-id). Reduction rho:B→B_0 is the native coefficient map induced by PadicInt.toZMod.

**Proof outline:**

1. If the actual map is onto, lift F to u∈S and reduce that unit. The existing coefficient-change identity carries Delta(u)=F to Delta(rho(u))=rho(F).
2. Conversely, choose the asserted residue unit v for F. Norm-fixed-unit-residue-surjective lifts v to u∈S. Coefficient change gives rho(Delta(u))=Delta(v)=rho(F), establishing the exact residual image hypothesis.
3. Apply logarithmic-derivative-surjective-mod-p. The remaining task is exactly the explicit characteristic-p image assertion in Lemmas12.13–12.14; it has not been assumed as a hidden property of a new object.

**Prerequisites:** `ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-map`, `ColemanPowerSeries:L2/logarithmic-derivative-coefficient-change`, `ColemanPowerSeries:L3/logarithmic-derivative-surjective-mod-p`, `ColemanPowerSeries:L3/norm-fixed-unit-residue-surjective`, `ColemanPowerSeries:L3/norm-fixed-logarithmic-derivative-kernel`, `ColemanPowerSeries:L1/coleman-fixed-constant-units`.

**Unit tests:**

- `LogImageTests.odd_constant_kernel` (non-example): At p=3, the constant series unit −1 is norm-fixed and has logarithmic derivative zero, but (−1)^3≠1 in Z_3.

**Acceptance:** Retain the existing kernel of constant (p−1)-st roots. The proof of Theorem12.9 prints mu_p where mu_(p−1) is required; E13 records that slip. At p=3, the constant unit −1 detects it. The remaining characteristic-p proof must use a well-defined integral polynomial identity or a separately justified localization. The earlier E8 bounded-psi domain issue is not resolved by applying psi to a pole.

**Sources:** RJW-published, Lemmas12.11–12.14 and proof of Theorem12.9, printed181–183 / PDF82–84; the kernel label on printed183 was checked in the page image. Declaration-sized expansion of the integral compactness and successive-precision argument. The residue-unit lift is specialized from pinned generic local-ring theorems and the existing Coleman norm limit. All-prime algebra here is independently justified and makes no assertion about arithmetic interpolation at p=2.

### Version-of-record finding E13

The proof of Theorem12.9 on published printed183 / PDF84 labels the kernel
mu_p. The theorem statement and Remark12.4 correctly give mu_(p−1). A constant
unit c has norm c^p, so being norm-fixed means c^(p−1)=1. At p=3 the constant
−1 has zero logarithmic derivative and is norm-fixed, but is not a cube root
of one. This corrects the proof's label, leaving the theorem statement intact.
The published page image and arXivv2 printed61 both contain the slip.

The article page and issue contents, exact-title/author correction searches,
and atlas source register yielded no identified correction. The attempted
author research URL returned404. E13's new marker reports that bounded search,
not a priority claim. All12 earlier findings are preserved without changing
their review state; the packet now contains13 findings.

### Current validation and continuation

The full suggested file compiles with zero errors and226 expected placeholder
warnings only. Its actual168-node PMIA supplier is freshly compiled, with zero
errors and367 expected placeholder warnings. The import audit reaches2,759
byte-verified pinned Mathlib source modules, one actual research supplier and
no Tau Ceti module. All98 predecessor nodes and all previous suggested-file
bytes are preserved. No roadmap result is claimed formalized.

Seven complete scratch lemmas compile against1,864 verified pinned Mathlib
modules with zero errors, warnings or placeholders. They prove the native
residue-unit lift, decay of arbitrary varying integral scalar quotients,
coefficientwise power-series convergence from p^n divisibility, psi-saturation
for any actual Z_p-linear series map, compactness of continuous norm-fixed
units, closedness of a continuous image of that group and the signed precision
identity. These proofs use no substitute assumptions for proposed suppliers.

Exact arithmetic passes38,727 assertions across2,160 power-series systems over
Z/p^k, for p=2,3,5,7, k=2,3,4 and tested degrees1–5. The input keeps one extra
coefficient when differentiating. Checks cover actual logarithmic derivatives,
signed powers, coefficient reduction, precision improvement and explicit
quotients. Controls reject the positive exponent and an invalid inference
from nonintegral quotients. Constant-unit computations detect E13. These
finite checks do not prove compactness or the infinite image calculation.

The published RJW PDF80–85 / printed179–184 and arXivv2 PDF60–62 were freshly
read in full. The published183 page image was inspected. The source hashes
match the recorded versions. Eight added baseline declarations were read at
the pin. Earlier broader readings retain their existing provenance.

Historical resumption point, now supplied by the residue-image continuation: prove the exact characteristic-p image condition
in logarithmic-derivative-residue-image-equivalence, respecting the domain of
psi. Then combine it with the existing constant-root kernel and fixed-space
sequence. Arithmetic interpolation, local cyclotomic towers and quotients,
G-actions and finite-flat coefficient comparisons remain in their exact gaps.

The current PMIA supplier now supplies the ambient Z_p-domain/Q_p-dual norm,
integral closed unit-ball image and common denominators. The12 requests remain,
with the two lattice requests narrowed to finite-flat coefficient generality,
the unit clopen domain and compatibility. No supplier declaration is duplicated.


## Characteristic-p logarithmic image

Let k=F_p, B_0=k[[T]] and Y=1+T. The existing logarithmic derivative is
Delta(u)=Y D(u)u^{-1}. Use eta(u)=T D(u)u^{-1} as notation within the argument.
Multiplication by T retains coefficient precision after differentiation; this
is why the Euler correction works through the same degree as the unit itself.

For a series a with zero constant coefficient, copy its prime-to-p coefficients
along their p-power rays. The resulting h satisfies h_{pn}=h_n, and a-h is
T^p H(T^p). Construct a primitive of h by successive factors 1-alpha_m T^m.
At degree m prime to p, choose alpha_m=-h_m/m for the current residual
coefficient. At a multiple of p, invariance forces that coefficient to vanish,
so choose zero. The correction retains coefficient invariance. The native
Mathlib product theorem supplies convergence, and the constant coefficient
one supplies an actual unit. Coefficient stabilization and the precision lemma
then identify its radial logarithmic derivative with h.

Apply this to a=T Y^{-1}g. Multiplication by Y and cancellation of T give
g=Delta(u)+Y T^{p-1}H(T^p), entirely in the ordinary power-series ring. Every
residue-unit logarithmic derivative is fixed by the actual PMIA averaging
operator: lift the unit to an integral norm-fixed unit and reduce the existing
fixedness identity. When g is itself fixed, PMIA's fixed-error theorem forces
H=0. This proves the residue image assertion for all fixed residue series.
The previous compact lifting argument now gives unconditional surjectivity of
the actual norm-fixed logarithmic derivative. Together with its existing
mu_(p-1) kernel, this supplies the assertions of Theorem 12.9.

PMIA owns residue averaging, its reduction comparison and the pole-cancelled
fixed-error calculation. ClassicalArithmeticCompletion owns the Cartier
coefficient interface used by PMIA with positive prime degree and indices
below that degree. No generic Cartier claim outside those hypotheses is
needed here. Mathlib owns convergence of products with increasing orders.
The Atlas search found existing analytic Euler products and fixed-ratio
q-products; this argument only adds the variable-coefficient logarithmic
correction and its coefficient consequences.

### Residue logarithmic derivatives are fixed by averaging

`ColemanPowerSeries:L3/residue-logarithmic-derivative-psi-fixed` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.residuePsi_logDeriv` (lemma).

For every u∈B_0 units, the actual PMIA residue operator satisfies ψ_0(Δ(u))=Δ(u).

**Hypotheses:** p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

**Proof outline:**

1. Use norm-fixed-unit-residue-surjective to lift u to an actual norm-fixed integral unit v.
2. The existing norm-fixed logarithmic-derivative theorem gives ψ(Δ(v))=Δ(v). Reduce coefficients and use the PMIA residue-psi comparison and the existing logarithmic-derivative coefficient-change identity.
3. The reduced unit is u, so the resulting equality is exactly the asserted fixedness. No lift of an arbitrary ψ_0-fixed series is assumed.

**Prerequisites:** `ColemanPowerSeries:L3/norm-fixed-unit-residue-surjective`, `ColemanPowerSeries:L2/norm-fixed-logarithmic-derivative-psi-fixed`, `ColemanPowerSeries:L2/logarithmic-derivative-coefficient-change`, `PadicMeasuresIwasawaAlgebras:L2/residue-psi-comparison`.

**Acceptance:** This is fixedness of Δ for every residue unit, obtained using the already proved norm-fixed unit lift.

**Sources:** RJW-published, Lemma12.13, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

### Completion of coefficients along p-power rays

`ColemanPowerSeries:L3/frobenius-coefficient-completion` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_coefficient_completion` (lemma).

For a∈B_0 with constant coefficient zero, there exist h,H∈B_0 such that h_0=0, h_(pn)=h_n for all n, h_n=a_n when p does not divide n, and a−h=T^p H(T^p).

**Hypotheses:** p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

**Proof outline:**

1. Define h_n=a_m where m is the native p-free part of n. At n=0 the p-free part is zero, so h_0=0. The two native p-free-part identities give h_(pn)=h_n and h_n=a_n away from multiples of p.
2. Thus a−h has zero constant coefficient and is supported on positive multiples of p. Define H_n=(a−h)_(p(n+1)) using the native coefficient constructor.
3. Check coefficients of T^p H(T^p) with the native expansion and shift formulas. They recover a−h at every degree.

**Prerequisites:** `mathlib:Nat.ordCompl_self_pow_mul`, `mathlib:Nat.ordCompl_eq_self_iff_zero_or_not_dvd`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`, `mathlib:PowerSeries.ext`, `mathlib:PowerSeries.coeff_expand`, `mathlib:PowerSeries.coeff_mul_X_pow'`.

**Acceptance:** The zero coefficient is fixed to zero separately. The error is divisible by T^p, not merely supported at arbitrary multiples including degree zero.

**Sources:** RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

### Logarithmic coefficients of one Euler factor

`ColemanPowerSeries:L3/euler-factor-logarithmic-coefficients` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.euler_factor_logarithmic_coeff` (lemma).

For m≥1, a∈k and an actual unit u with value 1−aT^m, the coefficient of η(u) at n is −m a^(n/m) when n>0 and m divides n, and zero otherwise.

**Hypotheses:** p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

**Proof outline:**

1. The constant coefficient of 1−aT^m is one, so the native unit criterion supplies the unit when needed. Its inverse coefficients, from coeff_invOfUnit and mul_invOfUnit, are a^r in degrees mr and zero in all other degrees.
2. Differentiate the polynomial expression using the native monomial and power formulas. Multiplication by T gives −m aT^m.
3. Multiply by the actual unit inverse and shift coefficients. Handle n=0 separately; all formulas remain valid if a=0 or p divides m.

**Prerequisites:** `mathlib:PowerSeries.isUnit_iff_constantCoeff`, `mathlib:PowerSeries.coeff_invOfUnit`, `mathlib:PowerSeries.mul_invOfUnit`, `mathlib:PowerSeries.monomial_eq_C_mul_X_pow`, `mathlib:PowerSeries.derivative_pow`, `mathlib:PowerSeries.derivative_C`, `mathlib:PowerSeries.derivative_X`, `mathlib:PowerSeries.coeff_mul_X_pow'`.

**Unit tests:**

- `ResidueImageTests.ternary_first_factor` (computation): For a unit u with value 1−2T over F_3, coefficient one of T D(u)u⁻¹ is 1.
- `ResidueImageTests.characteristic_kernel` (non-example): A unit with value 1−T^p over F_p has Δ(u)=0; the characteristic-p logarithmic kernel is not just constants.

**Acceptance:** For m=1,a=2 in F_3, the coefficient at degree one is 1. If p divides m, every logarithmic coefficient vanishes although the factor may be nonconstant.

**Sources:** RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

### Frobenius invariance of Euler logarithmic coefficients

`ColemanPowerSeries:L3/euler-factor-frobenius-invariance` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.euler_factor_frobenius_coeff` (lemma).

For m≥1, a∈k and u with value 1−aT^m, coefficient pn of η(u) equals coefficient n for every n≥0.

**Hypotheses:** p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

**Proof outline:**

1. If p divides m, its scalar image is zero, so both coefficients vanish by euler-factor-logarithmic-coefficients.
2. Otherwise m is coprime to p, and m divides pn exactly when it divides n. In the nonzero-degree divisible case, the exponents differ by multiplication by p.
3. Apply the native finite-field identity a^p=a. Degree zero is zero on both sides.

**Prerequisites:** `ColemanPowerSeries:L3/euler-factor-logarithmic-coefficients`, `mathlib:ZMod.natCast_eq_zero_iff`, `mathlib:ZMod.pow_card`.

**Acceptance:** The equality uses F_p coefficients; the same unmodified equality is not asserted over an arbitrary characteristic-p coefficient field.

**Sources:** RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

### One coefficient correction by an Euler factor

`ColemanPowerSeries:L3/euler-correction-step` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.euler_correction_step` (lemma).

Let m≥1 and h∈B_0 have h_(pn)=h_n and h_n=0 for n<m. There are a∈k and an actual unit u with value 1−aT^m such that h−η(u) vanishes through degree m and still has p-invariant coefficients. If p divides m, choose a=0.

**Hypotheses:** p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

**Proof outline:**

1. If p divides m, then h_m=h_(m/p)=0 because m/p<m. Choose a=0 and u=1.
2. If p does not divide m, its image in k is invertible. Set a=−h_m/m and use the native unit criterion to obtain u.
3. The Euler coefficient formula gives η(u)_m=−ma=h_m and vanishing below m. Subtract to improve the vanishing range.
4. Subtract the two coefficient-invariance identities to preserve p-invariance. The minus sign in a is essential.

**Prerequisites:** `ColemanPowerSeries:L3/euler-factor-logarithmic-coefficients`, `ColemanPowerSeries:L3/euler-factor-frobenius-invariance`, `mathlib:ZMod.natCast_eq_zero_iff`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`.

**Acceptance:** Never divide by m when p divides it. At the initial step m=1 the input has zero constant coefficient.

**Sources:** RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

### Compatible finite Euler corrections

`ColemanPowerSeries:L3/euler-correction-sequence` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.euler_correction_sequence` (lemma).

For h∈B_0 with h_0=0 and h_(pn)=h_n, there exist coefficients a_m and actual units u_N such that a_0=0, a_m=0 when p divides m, u_N has value product_(1≤m≤N)(1−a_mT^m), and coefficients of η(u_N) agree with h through degree N.

**Hypotheses:** p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

**Proof outline:**

1. Start with the empty product u_0=1 and a_0=0. The constant coefficient of η(u_0) and of h is zero.
2. At step m, subtract η(u_(m−1)) from h. Additivity of the existing logarithmic derivative, and Yη(u)=TΔ(u), identify this as subtraction of the previous Euler-factor contributions.
3. Each contribution has p-invariant coefficients by euler-factor-frobenius-invariance. Apply euler-correction-step to the residual series; multiply the actual previous unit by the new factor unit.
4. Natural-number recursion gives one compatible sequence, not a separate choice of a product for each precision. Its zero choices at multiples of p are retained.

**Prerequisites:** `ColemanPowerSeries:L3/euler-correction-step`, `ColemanPowerSeries:L3/euler-factor-frobenius-invariance`, `ColemanPowerSeries:L2/logarithmic-derivative`, `ColemanPowerSeries:L2/logarithmic-derivative-product`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`.

**Acceptance:** The Nth product uses precisely factors of degrees 1 through N. Later choices do not change already corrected coefficients.

**Sources:** RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

### Normalized unit determined by the Euler product

`ColemanPowerSeries:L3/euler-product-unit-limit` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.euler_product_unit_limit` (lemma).

For any coefficients a_m∈k, the native product product_(m≥1)(1−a_mT^m) is the value of an actual unit u with constant coefficient one. For every N and n≤N, its nth coefficient equals that of the finite product through m=N.

**Hypotheses:** p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative. Give k its discrete topology and B_0 the native coefficientwise topology.

**Proof outline:**

1. Write each factor as 1+monomial(m,−a_m). Its added term has order at least m, including infinite order when a_m=0. Apply the native multipliability theorem; this convergence theorem is already in Mathlib.
2. Map the product by continuous constant-coefficient evaluation. Every factor has constant coefficient one, so the product does too. Use the native unit criterion to obtain u.
3. Every factor of degree greater than n preserves coefficient n by the native shift formula. Finite induction gives eventual stabilization of coefficient n of the partial products.
4. The native partial-product convergence and continuity of coefficient evaluation identify the stabilized coefficient with that of u in the Hausdorff coefficient topology.

**Prerequisites:** `mathlib:PowerSeries.WithPiTopology.multipliable_one_add_of_tendsto_order_atTop_nhds_top`, `mathlib:PowerSeries.order_monomial`, `mathlib:Multipliable.map_tprod`, `mathlib:PowerSeries.WithPiTopology.continuous_constantCoeff`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`, `mathlib:HasProd.tendsto_prod_nat`, `mathlib:PowerSeries.WithPiTopology.continuous_coeff`, `mathlib:PowerSeries.monomial_eq_C_mul_X_pow`, `mathlib:PowerSeries.coeff_mul_X_pow'`.

**Unit tests:**

- `ResidueImageTests.empty_product` (degenerate): The constant coefficient of the actual infinite Euler product is one, for every coefficient sequence.

**Acceptance:** The constant coefficient is one, so the limiting series is a unit rather than merely a nonzero series. No norm on all power series is introduced.

**Sources:** RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

### Precision of the radial logarithmic derivative

`ColemanPowerSeries:L3/radial-logarithmic-coefficient-congruence` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.radial_logarithmic_coeff_congr` (lemma).

If actual units u,v of B_0 have equal coefficients through degree N, then η(u) and η(v) have equal coefficients through degree N.

**Hypotheses:** p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

**Proof outline:**

1. The native divisibility criterion makes u−v divisible by T^(N+1). The unit-inverse difference identity makes u⁻¹−v⁻¹ divisible by the same power.
2. The derivative coefficient formula shows that T D(u−v) is divisible by T^(N+1): multiplication by T restores the degree lost by differentiation.
3. Expand η(u)−η(v)=T D(u−v)u⁻¹+T D(v)(u⁻¹−v⁻¹). Each term is divisible by T^(N+1); translate back to coefficient equality.

**Prerequisites:** `mathlib:PowerSeries.X_pow_dvd_iff`, `mathlib:PowerSeries.coeff_derivative`, `mathlib:PowerSeries.coeff_mul_X_pow'`.

**Acceptance:** The factor T is necessary for a precision statement with no lost degree. For the existing weighted Δ, one extra input coefficient is needed.

**Sources:** RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

### Logarithmic primitive of a coefficient-invariant series

`ColemanPowerSeries:L3/frobenius-invariant-logarithmic-primitive` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.frobenius_fixed_logarithmic_primitive` (theorem).

If h∈B_0 has h_0=0 and h_(pn)=h_n for all n, there exists an actual unit u with constant coefficient one and η(u)=h.

**Hypotheses:** p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

**Proof outline:**

1. Take the compatible Euler corrections from euler-correction-sequence and their actual limiting unit from euler-product-unit-limit.
2. For each degree n choose N≥n. The limiting unit and the Nth finite product agree through degree N; radial-logarithmic-coefficient-congruence gives agreement of their radial logarithmic derivatives through that degree.
3. The finite correction identity identifies this coefficient with h_n. Native power-series extensionality gives η(u)=h. Normalization of the constant coefficient does not assert uniqueness modulo the characteristic-p kernel.

**Prerequisites:** `ColemanPowerSeries:L3/euler-correction-sequence`, `ColemanPowerSeries:L3/euler-product-unit-limit`, `ColemanPowerSeries:L3/radial-logarithmic-coefficient-congruence`, `mathlib:PowerSeries.ext`.

**Unit tests:**

- `ResidueImageTests.zero_primitive` (degenerate): The unit one has constant coefficient one and radial logarithmic derivative zero.

**Acceptance:** For h=0 the unit one is a valid normalized primitive. Do not impose a torsion-free derivative-kernel theorem over F_p.

**Sources:** RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

### Logarithmic decomposition with a pole-free remainder

`ColemanPowerSeries:L3/residue-logarithmic-decomposition` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.residue_logarithmic_decomposition` (lemma).

For every g∈B_0 there are an actual unit u and H∈B_0 with g=Δ(u)+Y T^(p−1)H(T^p).

**Hypotheses:** p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

**Proof outline:**

1. Y has unit constant coefficient, hence an inverse in B_0. Form a=T Y⁻¹g, an actual power series with zero constant coefficient.
2. Apply frobenius-coefficient-completion to obtain a−h=T^p H(T^p). Apply frobenius-invariant-logarithmic-primitive to obtain u with η(u)=h.
3. Multiply the displayed equality by Y and use Yη(u)=TΔ(u), which follows by unfolding the existing logarithmic derivative.
4. Cancel the common factor T using native injectivity of multiplication by X. Since p>1, T^p=T T^(p−1). Every expression stays inside B_0.

**Prerequisites:** `ColemanPowerSeries:L3/frobenius-coefficient-completion`, `ColemanPowerSeries:L3/frobenius-invariant-logarithmic-primitive`, `ColemanPowerSeries:L2/logarithmic-derivative`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`, `mathlib:PowerSeries.X_mul_injective`.

**Acceptance:** This is Lemma12.14 with the source remainder rewritten as Y T^(p−1)H(T^p); it does not ask the bounded averaging operator to act on Y/T.

**Sources:** RJW-published, Lemma12.14, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

### Logarithmic image of residue averaging invariants

`ColemanPowerSeries:L3/residue-psi-fixed-logarithmic-image` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.residuePsi_fixed_logarithmic_image` (theorem).

Every g∈B_0 satisfying ψ_0(g)=g equals Δ(u) for some actual unit u∈B_0 units.

**Hypotheses:** p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

**Proof outline:**

1. Write g=Δ(u)+Y T^(p−1)H(T^p) by residue-logarithmic-decomposition.
2. The first term is ψ_0-fixed by residue-logarithmic-derivative-psi-fixed. Subtract its equality from the fixedness of g, using the actual linear residue operator.
3. The PMIA residue-psi-fixed-error-zero theorem forces H=0. Substitute back to obtain g=Δ(u). This also applies to every reduction of an integral ψ-fixed series by the PMIA reduction comparison.

**Prerequisites:** `ColemanPowerSeries:L3/residue-logarithmic-decomposition`, `ColemanPowerSeries:L3/residue-logarithmic-derivative-psi-fixed`, `PadicMeasuresIwasawaAlgebras:L2/residue-psi`, `PadicMeasuresIwasawaAlgebras:L2/residue-psi-fixed-error-zero`.

**Unit tests:**

- `ResidueImageTests.dyadic_image` (compatibility): Every series fixed by the actual residue averaging operator at p=2 is the logarithmic derivative of an actual unit of F_2[[T]].

**Acceptance:** This derives the stronger statement for all actual residue ψ_0-fixed series; the source only needs reductions of integral fixed series. No lifting of arbitrary residue fixed series is assumed in the argument.

**Sources:** RJW-published, Lemma12.13, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

### Surjectivity on norm-fixed integral units

`ColemanPowerSeries:L3/norm-fixed-logarithmic-derivative-surjective` — `TauCetiRoadmap.Campaign.ColemanPowerSeries.normFixedLogDeriv_surjective` (theorem).

The actual existing group homomorphism normFixedLogDeriv from norm-fixed units in Z_p[[T]] to the additive ψ-fixed integral series, with the native Multiplicative tag, is surjective.

**Hypotheses:** p is prime, including p=2; k=F_p and B_0=k[[T]] are the native ZMod and PowerSeries carriers. Put Y=1+T. Write η(u)=T D(u) u⁻¹ only as notation; Δ(u)=Y D(u) u⁻¹ is the existing logarithmic derivative.

**Proof outline:**

1. For an integral ψ-fixed F, use the actual PMIA coefficient-reduction comparison to prove that its reduction is ψ_0-fixed.
2. Apply residue-psi-fixed-logarithmic-image to obtain a residue unit with logarithmic derivative equal to that reduction.
3. Apply the existing logarithmic-derivative-residue-image-equivalence, which already contains the norm-fixed lift, p-adic precision corrections and compact-image argument. No residual image hypothesis remains.
4. Together with the existing norm-fixed-logarithmic-derivative-kernel theorem, this supplies the kernel and surjectivity assertions of Theorem12.9; its kernel is μ_(p−1), as in existing finding E13.

**Prerequisites:** `ColemanPowerSeries:L3/residue-psi-fixed-logarithmic-image`, `PadicMeasuresIwasawaAlgebras:L2/residue-psi-comparison`, `ColemanPowerSeries:L3/logarithmic-derivative-residue-image-equivalence`, `ColemanPowerSeries:L3/norm-fixed-logarithmic-derivative-kernel`.

**Acceptance:** The conclusion concerns the actual previously constructed norm and logarithmic derivative. It does not assert the arithmetic Coleman interpolation or Theorem12.17.

**Sources:** RJW-published, Lemma12.13–12.14 and completion of Theorem12.9, published printed182–183/PDF83–84; full fresh reading, including the Euler-product proof; arXiv2309.15692v2 pp.60–61 collated. Declaration-sized worker decomposition of the source argument with explicit native carriers and hypotheses. The residue averaging and fixed-error calculation are imported from PMIA; no bounded operator is applied to a pole.

### Current validation and continuation boundary

All 107 predecessor node objects, 117 baseline records, 13 findings, nine
planets and previous suggested-file content are preserved. E8's domain issue
is handled inside ordinary power series; E13's kernel correction remains.
The two PMIA lattice requests now ask only for finite-flat generality beyond
the supplied actual unit-domain comparisons. No stage is marked closed.

The full suggested file compiles with zero errors and 243 expected placeholder
warnings only. Its actual 209-node PMIA supplier compiles with zero errors and
442 such warnings. The import audit byte-checks 2,797 pinned Mathlib modules
and the actual suggested supplier. No Tau Ceti module is reached.

Nine complete scratch lemmas compile with zero errors, warnings or placeholders
against 1,711 pinned Mathlib modules. They prove native Euler multipliability,
constant coefficient one, unit status, partial-product convergence, preservation
of low coefficients, the three coefficient-completion identities, and radial
derivative divisibility. Exact finite arithmetic passes 412,089 assertions
across 960 systems over F_p, for p=2,3,5,7 and tested degrees 3,7,15,25.
It checks the actual unit inverses, correction recursion, logarithmic identities,
pole-free remainders and fixed-error controls. Finite checks do not prove the
infinite theorem or arithmetic interpolation.

Fresh source reading covers complete published RJW printed 182–183 / PDF 83–84
and arXiv v2 pages 60–61, with their source hashes checked. Eighteen new baseline
statements were read at the pins. The current actual PMIA residue supplier
and the restricted Cartier interface were read. Earlier broader readings
retain their historical provenance; this is not a new full-source audit.

Continue with the actual arithmetic Coleman interpolation and composite, the
full G-action, its kernel mu_(p-1) times Z_p(1), cyclotomic-moment cokernel,
and the principal-unit exact sequence of Theorem 12.17. The tower, quotient
and finite-flat completed-tensor obligations remain in the six gaps and twelve
requests. Every implementation status remains unchecked.


## The algebraic local cyclotomic tower

Fix a prime p and one native algebraic closure Ω of ℚ_p. Index the local
sequence by n≥0, so its nth level corresponds to the paper's K_(n+1).
Choose one primitive pth root and successively choose pth roots of the
preceding root. A native order calculation proves every lift primitive of
order p^(n+2). The resulting coherent roots ρ_n generate actual nested
intermediate fields K_n=ℚ_p(ρ_n) in Ω. Independent primitive-root choices in
separate splitting fields would not specify the needed inclusion maps.

The degree proof needs irreducibility over ℚ_p. Native irreducibility over ℚ
does not provide it. Map the integer shifted-cyclotomic Eisenstein result to
ℤ_p for coefficient divisibility, and check the remaining strong Eisenstein
condition there: the constant term is p and p does not belong to (p)^2.
Native monic Gauss descent to the fraction field and the polynomial translation
equivalence give irreducibility of Φ_(p^(n+1)) over ℚ_p. Native cyclotomic
finrank gives p^n(p−1), and the dimension tower law gives relative degree p.
The initial dyadic field has degree one, followed by relative degree two.

The included next root generates the relative extension, so native PowerBasis
provides a basis with dimension p. The power relation and the degree identify
the minimal polynomial as X^p−ζ_n. Its constant coefficient gives the root
norm (−1)^(p+1)ζ_n. Translating the generator by one gives minimal polynomial
(X+1)^p−ζ_n and norm (−1)^(p+1)(ζ_n−1). At p=2,n=0 the latter norm is +2,
whereas ζ_0−1 is −2. The paper assumes p odd; the sign in the more general
statement is a worker deduction, not a new source error.

These are algebraic results on the actual native fields. To identify ζ_n−1
as a uniformizer, construct their rings of integers, or form topological unit
inverse limits, import the outstanding general local-field and ramification
interfaces and prove the cyclotomic specializations. The twelve supplier
requests remain unchanged. Completed module actions remain PMIA imports;
the full unit group is still not asserted to be a ℤ_p-module.

### The local cyclotomic constant coefficient

`ColemanPowerSeries:L0/shifted-cyclotomic-constant` — `ColemanCyclotomic.shifted_const` (lemma).

The constant coefficient of Φ_(p^(n+1))(X+1) over ℤ_p equals p.

**Hypotheses:** Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

**Proof outline:**

1. Evaluate the native prime-power cyclotomic geometric sum at one. Each of its p summands is one; polynomial composition identifies this value with the required constant coefficient.

**Prerequisites:** `mathlib:Polynomial.cyclotomic_prime_pow_eq_geom_sum`.

**Acceptance:** The value is p at every level, including n=0 and p=2.

**Sources:** RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

### Local cyclotomic Eisenstein criterion

`ColemanPowerSeries:L0/shifted-cyclotomic-eisenstein` — `ColemanCyclotomic.shifted_eisenstein` (lemma).

The polynomial Φ_(p^(n+1))(X+1) over ℤ_p is Eisenstein at the ideal (p).

**Hypotheses:** Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

**Proof outline:**

1. Map the native integer Eisenstein result along ℤ→ℤ_p to obtain weak Eisenstein divisibility. Use the native cyclotomic monicity to preserve the leading coefficient.
2. The ideal (p) is the native maximal ideal of ℤ_p. Its constant coefficient is p, which is not in (p)^2: a relation p=p²a would cancel to 1=pa and contradict native primality of p. Apply the monic Eisenstein constructor.

**Prerequisites:** `ColemanPowerSeries:L0/shifted-cyclotomic-constant`, `mathlib:cyclotomic_prime_pow_comp_X_add_one_isEisensteinAt`, `mathlib:Polynomial.IsWeaklyEisensteinAt.map`, `mathlib:Polynomial.Monic.isEisensteinAt_of_mem_of_notMem`, `mathlib:Polynomial.cyclotomic.monic`, `mathlib:PadicInt.maximalIdeal_eq_span_p`, `mathlib:PadicInt.prime_p`.

**Acceptance:** Strong Eisenstein does not follow merely by mapping an ideal: the constant coefficient must still avoid the square in ℤ_p.

**Sources:** RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

### Local cyclotomic irreducibility

`ColemanPowerSeries:L0/local-cyclotomic-irreducible` — `ColemanCyclotomic.local_cyclotomic_irreducible` (theorem).

The polynomial Φ_(p^(n+1)) is irreducible over ℚ_p.

**Hypotheses:** Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

**Proof outline:**

1. The shifted polynomial is monic, hence primitive, and has positive degree. Apply the native Eisenstein irreducibility criterion over ℤ_p.
2. Use native monic Gauss descent for the integrally closed domain ℤ_p and its fraction field ℚ_p. The mapped shifted polynomial is irreducible over ℚ_p.
3. The native polynomial algebra equivalence X↦X+1 preserves irreducibility. Apply its inverse implication to remove the shift.

**Prerequisites:** `ColemanPowerSeries:L0/shifted-cyclotomic-eisenstein`, `mathlib:Polynomial.IsEisensteinAt.irreducible`, `mathlib:Polynomial.cyclotomic.monic`, `mathlib:Polynomial.Monic.irreducible_iff_irreducible_map_fraction_map`, `mathlib:Polynomial.algEquivAevalXAddC`, `mathlib:MulEquiv.irreducible_iff`.

**Acceptance:** Irreducibility over ℚ alone would not imply this conclusion over ℚ_p.

**Sources:** RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

### Lifting primitive prime-power roots

`ColemanPowerSeries:L0/primitive-root-lift` — `ColemanCyclotomic.primitive_lift` (lemma).

In any field, if z is primitive of order p^(n+1) and w^p=z, then w is primitive of order p^(n+2).

**Hypotheses:** Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

**Proof outline:**

1. Compute w^(p^(n+2))=1 from the order of z. If w^(p^(n+1))=1, then z^(p^n)=1, contradicting native primitivity since 0<p^n<p^(n+1).
2. Apply the native prime-power order criterion and the native primitive-root statement for an element of its exact order.

**Prerequisites:** `mathlib:IsPrimitiveRoot.pow_ne_one_of_pos_of_lt`, `mathlib:orderOf_eq_prime_pow`, `mathlib:IsPrimitiveRoot.orderOf`.

**Acceptance:** Any pth-root lift works. Nonprimitive starting roots would not satisfy the conclusion.

**Sources:** RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

### A compatible system of cyclotomic roots

`ColemanPowerSeries:L0/compatible-cyclotomic-roots` — `ColemanCyclotomic.roots` (construction).

Choose ρ_0 primitive of order p in Ω. Recursively choose ρ_(n+1) as a pth root of ρ_n using native algebraic closedness. This defines a single sequence ρ:ℕ→Ω.

**Hypotheses:** Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

**Proof outline:**

1. Use native existence of a primitive pth root in the characteristic-zero algebraic closure. Iterate the choice function z↦a chosen solution of w^p=z, whose existence follows from algebraic closedness and p>0.
2. The following two nodes prove compatibility and primitivity of every chosen root; individual independent primitive-root choices are insufficient.

**Prerequisites:** `mathlib:HasEnoughRootsOfUnity.exists_primitiveRoot`, `mathlib:IsAlgClosed.exists_pow_nat_eq`.

**Uses:**

- RJW §9 cyclotomic tower: Coherent roots define nested fields and norm-compatible arithmetic generators.
- RJW Lemma10.9: The pth-power relation is the relative polynomial evaluated at the next root.

**API:**

- `roots_def` (data): ρ_n is the nth iterate of the native pth-root choice function on the chosen primitive pth root.
- `roots_primitive` (characterisation): ρ_n is primitive of exact order p^(n+1); promoted below.
- `roots_succ` (compatibility): ρ_(n+1)^p=ρ_n; promoted below.

**Tests:**

- `SuggestedCyclotomicTests.root_initial_order` (degenerate): ρ_0 is primitive of order p.
- `SuggestedCyclotomicTests.root_first_transition` (compatibility): ρ_1^p=ρ_0.
- `SuggestedCyclotomicTests.dyadic_initial_root` (computation): For p=2, ρ_0=−1.

**Acceptance:** The sequence depends on choices. No equality between independently chosen sequences or unrelated native zeta constants is asserted.

**Sources:** RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

### Cyclotomic root compatibility

`ColemanPowerSeries:L0/cyclotomic-root-compatibility` — `ColemanCyclotomic.roots_succ` (lemma).

For every n≥0, ρ_(n+1)^p=ρ_n.

**Hypotheses:** Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

**Proof outline:**

1. Unfold one iteration of the chosen root function and use its native existential witness equation.

**Prerequisites:** `ColemanPowerSeries:L0/compatible-cyclotomic-roots`, `mathlib:IsAlgClosed.exists_pow_nat_eq`.

**Acceptance:** Compatibility uses the actual chosen sequence, not an existence claim for each level separately.

**Sources:** RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

### Exact orders of cyclotomic roots

`ColemanPowerSeries:L0/cyclotomic-root-primitivity` — `ColemanCyclotomic.roots_primitive` (lemma).

For every n≥0, ρ_n is primitive of order p^(n+1).

**Hypotheses:** Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

**Proof outline:**

1. The initial native primitive-root choice supplies n=0. Induct using cyclotomic-root-compatibility and primitive-root-lift.

**Prerequisites:** `ColemanPowerSeries:L0/compatible-cyclotomic-roots`, `ColemanPowerSeries:L0/cyclotomic-root-compatibility`, `ColemanPowerSeries:L0/primitive-root-lift`.

**Acceptance:** The level n=0 has order p, not one.

**Sources:** RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

### The local cyclotomic fields

`ColemanPowerSeries:L0/local-cyclotomic-level` — `ColemanCyclotomic.level` (construction).

Define K_n as native IntermediateField.adjoin ℚ_p {ρ_n} inside Ω. Give it the inherited field and ℚ_p-algebra structures, the native IsCyclotomicExtension {p^(n+1)} instance and finite dimensionality. Let ζ_n be its distinguished generator.

**Hypotheses:** Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

**Proof outline:**

1. Adjoin the actual chosen root as an intermediate field. Native primitivity gives the cyclotomic-extension instance and native finiteness gives the finite-dimensional instance.
2. The element ζ_n is the subtype pair of ρ_n and its membership in the adjoin. Transfer primitivity through the injective subtype map. Its membership and coercion use native adjoin/subtype API.

**Prerequisites:** `ColemanPowerSeries:L0/compatible-cyclotomic-roots`, `ColemanPowerSeries:L0/cyclotomic-root-primitivity`, `mathlib:IsPrimitiveRoot.intermediateField_adjoin_isCyclotomicExtension`, `mathlib:IsCyclotomicExtension.finite`, `mathlib:IsPrimitiveRoot.of_map_of_injective`.

**Uses:**

- RJW §9: Actual finite fields are the carriers for rings of integers, full/principal units and arithmetic norms.
- RJW10.9 and ColemanPowerSeries:L1: The same included fields must receive evaluated series and their relative arithmetic norms.

**API:**

- `level_def` (data): K_n is the native intermediate field generated by ρ_n.
- `root_mem` (constructor): ρ_n belongs to K_n.
- `level_cyclotomic` (instance): K_n is a native p^(n+1)-cyclotomic extension of ℚ_p.
- `level_finite` (instance): K_n is finite-dimensional over ℚ_p.
- `zeta` (coercion): ζ_n is ρ_n viewed in K_n.
- `zeta_val` (simp): The inclusion of ζ_n into Ω equals ρ_n.
- `zeta_primitive` (compatibility): ζ_n is primitive of order p^(n+1).
- `level_mono` (functoriality): K_n≤K_(n+1); promoted below.
- `level_degree` (characterisation): The absolute degree is p^n(p−1); promoted below.

**Tests:**

- `SuggestedCyclotomicTests.initial_degree` (degenerate): [K_0:ℚ_p]=p−1.
- `SuggestedCyclotomicTests.dyadic_initial_degree` (computation): For p=2, [K_0:ℚ_2]=1.
- `SuggestedCyclotomicTests.distinguished_generator` (compatibility): The inclusion of ζ_n into Ω is ρ_n.

**Acceptance:** This is a concrete native field in a common algebraic closure. Separate splitting fields with unrelated roots would not provide these inclusions.

**Sources:** RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

### Inclusions in the local cyclotomic tower

`ColemanPowerSeries:L0/local-cyclotomic-inclusion` — `ColemanCyclotomic.level_mono` (lemma).

For every n≥0, K_n≤K_(n+1). Use native inclusion for the consecutive algebra; it makes a scalar tower over ℚ_p and carries ζ_n to ζ_(n+1)^p.

**Hypotheses:** Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

**Proof outline:**

1. By the native adjoin universal property, it suffices to show ρ_n belongs to K_(n+1). Rewrite it as ρ_(n+1)^p and use closure under powers.
2. The native inclusion supplies the relative algebra and its scalar-tower identity; injectivity of the subtype map transfers the root compatibility equation. Native restriction of finite scalars supplies relative finite dimensionality.

**Prerequisites:** `ColemanPowerSeries:L0/local-cyclotomic-level`, `ColemanPowerSeries:L0/cyclotomic-root-compatibility`, `mathlib:IntermediateField.inclusion`, `mathlib:Module.Finite.right`.

**API:**

- `level_step_algebra` (instance): Consecutive levels carry the algebra induced by native inclusion.
- `level_step_tower` (instance): ℚ_p→K_n→K_(n+1) is a native scalar tower.
- `level_step_finite` (instance): K_(n+1) is finite-dimensional over K_n.
- `zeta_step` (compatibility): ζ_(n+1)^p is the included ζ_n.

**Acceptance:** The relative algebra is the specified inclusion, so norms and minimal polynomials use the intended map.

**Sources:** RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

### Absolute degrees of the cyclotomic levels

`ColemanPowerSeries:L0/local-cyclotomic-degree` — `ColemanCyclotomic.level_degree` (lemma).

For every n≥0, [K_n:ℚ_p]=p^n(p−1).

**Hypotheses:** Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

**Proof outline:**

1. Instantiate native cyclotomic finrank with local-cyclotomic-irreducible. Evaluate the native totient of p^(n+1).

**Prerequisites:** `ColemanPowerSeries:L0/local-cyclotomic-level`, `ColemanPowerSeries:L0/local-cyclotomic-irreducible`, `mathlib:IsCyclotomicExtension.finrank`, `mathlib:Nat.totient_prime_pow`.

**Acceptance:** The formula is valid for p=2; the initial dyadic field has degree one.

**Sources:** RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

### Relative degrees of consecutive levels

`ColemanPowerSeries:L0/relative-cyclotomic-degree` — `ColemanCyclotomic.level_relative_degree` (lemma).

For every n≥0, [K_(n+1):K_n]=p.

**Hypotheses:** Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

**Proof outline:**

1. Apply the native dimension tower law to the inclusion algebra. Substitute the two absolute degrees and cancel the positive integer p^n(p−1).

**Prerequisites:** `ColemanPowerSeries:L0/local-cyclotomic-inclusion`, `ColemanPowerSeries:L0/local-cyclotomic-degree`, `mathlib:Module.finrank_mul_finrank`.

**Acceptance:** This includes the first dyadic transition K_0→K_1.

**Sources:** RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

### The relative cyclotomic power basis

`ColemanPowerSeries:L0/relative-cyclotomic-basis` — `ColemanCyclotomic.relativeBasis` (construction).

Construct a native PowerBasis of K_(n+1) over K_n with generator ζ_(n+1) and dimension p.

**Hypotheses:** Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

**Proof outline:**

1. The primitive root generates K_(n+1) as an algebra over ℚ_p by its native cyclotomic instance. Convert to intermediate-field generation and enlarge the base to K_n.
2. Convert back to algebra generation, use integrality from relative finite dimensionality, and apply native PowerBasis.ofAdjoinEqTop. Its dimension is the relative finrank, already p.

**Prerequisites:** `ColemanPowerSeries:L0/local-cyclotomic-level`, `ColemanPowerSeries:L0/local-cyclotomic-inclusion`, `ColemanPowerSeries:L0/relative-cyclotomic-degree`, `mathlib:IsCyclotomicExtension.adjoin_primitive_root_eq_top`, `mathlib:IntermediateField.adjoin_eq_top_of_algebra`, `mathlib:IntermediateField.adjoin_eq_top_of_adjoin_eq_top`, `mathlib:PowerBasis.ofAdjoinEqTop`, `mathlib:PowerBasis.finrank`.

**Uses:**

- RJW Lemma10.9: Identifies the exact relative minimal polynomial and arithmetic norm.
- ColemanPowerSeries:L0/L1: Supplies native field norm calculations for cyclotomic units and series evaluation.

**API:**

- `relativeBasis_gen` (simp): The relative power-basis generator is ζ_(n+1).
- `relativeBasis_dim` (characterisation): The dimension of the relative power basis is p.
- `relativeBasis_entry` (data): Its ith basis vector is ζ_(n+1)^i for i:Fin(dim).

**Tests:**

- `SuggestedCyclotomicTests.basis_generator` (compatibility): The basis generator is the actual chosen next root.
- `SuggestedCyclotomicTests.basis_initial_dimension` (degenerate): The first relative basis has dimension p.
- `SuggestedCyclotomicTests.basis_zero` (computation): The zeroth basis vector is one.

**Acceptance:** Use the native PowerBasis carrier and norm API. No second field or matrix representation is introduced.

**Sources:** RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

### The relative power-basis generator

`ColemanPowerSeries:L0/relative-cyclotomic-basis-generator` — `ColemanCyclotomic.relativeBasis_gen` (lemma).

The generator of relativeBasis(n) is ζ_(n+1).

**Hypotheses:** Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

**Proof outline:**

1. Unfold the native PowerBasis.ofAdjoinEqTop construction; its generator is the specified primitive root.

**Prerequisites:** `ColemanPowerSeries:L0/relative-cyclotomic-basis`, `mathlib:PowerBasis.ofAdjoinEqTop`.

**Acceptance:** The generator is the actual chosen next root, not an independently chosen primitive root.

**Sources:** RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

### The relative power-basis dimension

`ColemanPowerSeries:L0/relative-cyclotomic-basis-dimension` — `ColemanCyclotomic.relativeBasis_dim` (lemma).

The dimension of relativeBasis(n) is p.

**Hypotheses:** Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

**Proof outline:**

1. Native PowerBasis.finrank identifies the dimension with [K_(n+1):K_n]. Substitute the relative degree formula.

**Prerequisites:** `ColemanPowerSeries:L0/relative-cyclotomic-basis`, `ColemanPowerSeries:L0/relative-cyclotomic-degree`, `mathlib:PowerBasis.finrank`.

**Acceptance:** The exponent in the native norm sign is the relative degree p.

**Sources:** RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

### The relative cyclotomic minimal polynomial

`ColemanPowerSeries:L0/relative-cyclotomic-minpoly` — `ColemanCyclotomic.relative_minpoly` (lemma).

The minimal polynomial of ζ_(n+1) over K_n is X^p−ζ_n.

**Hypotheses:** Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

**Proof outline:**

1. Root compatibility makes X^p−ζ_n vanish at ζ_(n+1), so the native minimal polynomial divides it.
2. The relative power basis shows that the minimal polynomial has degree p. Both polynomials are monic of the same degree; native monic-divisibility uniqueness gives equality.

**Prerequisites:** `ColemanPowerSeries:L0/relative-cyclotomic-basis`, `ColemanPowerSeries:L0/relative-cyclotomic-basis-generator`, `ColemanPowerSeries:L0/relative-cyclotomic-basis-dimension`, `ColemanPowerSeries:L0/local-cyclotomic-inclusion`, `mathlib:PowerBasis.natDegree_minpoly`, `mathlib:minpoly.dvd`, `mathlib:minpoly.monic`, `mathlib:Polynomial.eq_of_monic_of_dvd_of_natDegree_le`.

**Acceptance:** The coefficient ζ_n is in the lower field. The relation alone without the degree argument would not identify a minimal polynomial.

**Sources:** RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

### Relative norms of the cyclotomic roots

`ColemanPowerSeries:L0/relative-cyclotomic-root-norm` — `ColemanCyclotomic.relative_norm_root` (lemma).

The native field norm N_(K_(n+1)/K_n)(ζ_(n+1)) equals (−1)^(p+1)ζ_n.

**Hypotheses:** Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

**Proof outline:**

1. Use the native power-basis norm formula: norm of the generator is (−1)^dimension times the constant coefficient of its minimal polynomial.
2. Substitute dimension p and minimal polynomial X^p−ζ_n. Its constant coefficient is −ζ_n because p>0.

**Prerequisites:** `ColemanPowerSeries:L0/relative-cyclotomic-basis`, `ColemanPowerSeries:L0/relative-cyclotomic-basis-generator`, `ColemanPowerSeries:L0/relative-cyclotomic-basis-dimension`, `ColemanPowerSeries:L0/relative-cyclotomic-minpoly`, `mathlib:Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly`.

**Acceptance:** For odd p this is ζ_n; for p=2 it is −ζ_n.

**Sources:** RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

### Relative norms of cyclotomic differences

`ColemanPowerSeries:L0/relative-cyclotomic-difference-norm` — `ColemanCyclotomic.relative_norm_difference` (lemma).

The native field norm N_(K_(n+1)/K_n)(ζ_(n+1)−1) equals (−1)^(p+1)(ζ_n−1).

**Hypotheses:** Let p be prime, including p=2, and n≥0. Work in the native algebraic closure Ω of ℚ_p. The index n denotes source level K_(n+1), generated by a primitive p^(n+1)st root; no negative exponent or source level K_0 is used. Write ρ_n for the chosen root, K_n=ℚ_p(ρ_n) for the native intermediate field, and ζ_n for ρ_n regarded as an element of K_n. Consecutive algebras use native field inclusions. No valuation, ring of integers or topology on K_n is asserted here.

**Proof outline:**

1. The element ζ_(n+1)−1 still generates the same relative field: add one to recover the original generator and use native generation by a power-basis element. Construct its native power basis.
2. Native translation of a minimal polynomial gives (X+1)^p−ζ_n, with constant coefficient 1−ζ_n. The shifted basis has dimension p by relative finrank.
3. Apply the native power-basis norm formula and simplify (−1)^p(1−ζ_n).

**Prerequisites:** `ColemanPowerSeries:L0/relative-cyclotomic-basis`, `ColemanPowerSeries:L0/relative-cyclotomic-minpoly`, `ColemanPowerSeries:L0/relative-cyclotomic-degree`, `mathlib:PowerBasis.adjoin_eq_top_of_gen_mem_adjoin`, `mathlib:PowerBasis.ofAdjoinEqTop`, `mathlib:PowerBasis.finrank`, `mathlib:minpoly.add_algebraMap`, `mathlib:Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly`, `mathlib:IsPrimitiveRoot.eq_neg_one_of_two_right`.

**Tests:**

- `SuggestedCyclotomicTests.dyadic_difference_norm` (computation): At p=2,n=0, the norm of ζ_1−1 is 2.
- `SuggestedCyclotomicTests.odd_difference_norm` (compatibility): For odd p the difference norm equals ζ_n−1.

**Acceptance:** Calling ζ_n−1 a uniformizer requires the outstanding ramification result. For p=2,n=0 the norm is +2 while ζ_0−1=−2. The paper assumes odd p, so this extension creates no source finding.

**Sources:** RJW-published, §9 printed161–162 and Lemma10.9 printed167–168; complete printed161–164/PDF62–65 and166–170/PDF67–71 freshly read27 September2026. The source fixes compatible roots and states the cyclotomic degree; Lemma10.9 uses the relative polynomial X^p−ζ. The explicit local Eisenstein descent, native field construction and dyadic sign extension are worker deductions. The source assumes p odd.

### Current validation and continuation

All126 preceding nodes,145 baseline objects,13 findings and all prior suggested
Lean bytes are preserved. The current reviewed AUDIT24 rows, accepted RS16
boundaries and full handoff were read. Complete published RJW161–164/PDF62–65
and166–170/PDF67–71 were freshly read from the hash-identical source. Thirty-seven
exact native declarations and their applicable hypotheses were read;36 new
baseline records are added. Native generic Eisenstein, algebraic closure,
cyclotomic extension, order, dimension, power-basis and norm APIs are reused.
Binding protocols and two upstream models retain their continuous reading
provenance; current captured blobs are checked at publication.

A bounded open-Mathlib-PR and Zulip search screened30 open hits and the bodies
of PR26913 (number-field instance generality), PR37031 (global cyclotomic
inertia fields), and PR43427 (valuations on adic completions). These guide reuse
of native types and the general local-field supplier boundary. The search did
not identify this exact local compatible-tower interface; it is not an
exhaustive absence claim. The older primitive-root discussion explicitly
warns that independently chosen zeta constants need not coincide.

The full suggested file compiles with zero errors and294 expected proof-placeholder
warnings only; the actual232-node PMIA supplier compiles with zero errors and484
such warnings. The import audit reaches2,826 byte-verified pinned Mathlib sources,
one pinned Tau Ceti module rebuilt without warnings and one actual supplier.
The relative finite-dimensional instance explicitly uses the inclusion algebra's
module structure, avoiding ambiguous typeclass search in the combined seed.

Complete scratch proofs contain six constructions,five native instances and25
proved lemmas, with zero errors,warnings or placeholders against2,802 pinned
Mathlib modules. They prove the whole local Eisenstein/irreducibility argument,
compatible roots, included fields,degrees,power bases,minimal polynomial and
both signed norms, including the first dyadic difference norm. These validate
the plan; every public implementation status remains unchecked.

Indexed blueprint: zero errors/warnings. Four-file intake: zero problems.
All preservation, reader/signature/test parity and scoped-mutation checks pass.
The901-edge dependency graph is acyclic, reaches214 nodes and249 baseline
leaves, and has no unresolved stage leaf. Versioned errata validation preserves
all13 findings unchanged. Six gaps,twelve requests and zero closed stages remain.

Suggested-file SHA256: `e2a99d28f4206058651f0ef46568fe264acd1bad4ebee686e708365643da3dfa`.
Complete scratch-proof SHA256: `b59838890d077b2fa58f72e8e46f59aa7ea455759c63e60bf059781a1559cee7`.

The Dirichlet input was refreshed from98 to115 nodes: twelve own Bernoulli-origin
entries plus five Mellin/zeta comparisons. All prior nodes remain whole; the
five new statements,hypotheses and prerequisites were screened. No consumed
Coleman interface changes. Registry additions Diophantine E217–E224 and their
REGISTER changes were read fully; all7,555 prior registry records remain whole.
The actual PMIA supplier retains232 nodes. No supplier is replaced by assumptions.


Resume by specializing general local-field ramification and integer-ring
interfaces to these actual fields, including residue field, total ramification
and ζ_n−1 as uniformizer. Then construct the full and principal unit norm limits,
continuity and compactness, Teichmüller splitting and Tate-module inclusion.
The arithmetic norm/series-evaluation comparison of Lemma10.9 must use these
fields and the previously supplied determinant/root-product formula. The actual
finite-level unit lifts, interpolation uniqueness/surjectivity, Coleman map,
exact sequence and cyclotomic-unit quotient remain in the preserved gaps.


## L0 continuation: the algebraic integral closure and its difference quotient

The primitive roots and included fields of the preceding checkpoint give actual
algebraic carriers. At level n write K_n=ℚ_p(ρ_n), ζ_n for the root in K_n,
π_n=ζ_n−1 and d_n=p^n(p−1). The scalar map ℤ_p→K_n is the composite through ℚ_p.
The native integral closure O_n consists precisely of the elements integral over
ℤ_p. This continuation gives its explicit description O_n=ℤ_p[π_n] and a native
PowerBasis with generator ϖ_n, the element π_n viewed in O_n. It also constructs
the canonical algebraic quotient map red_n sending ζ_n to one and inducing
O_n/(ϖ_n)≃ZMod p.

Two different uses of integrality must be kept apart. Finite-dimensionality over
ℚ_p alone supplies a field power basis but does not put every element in the
integral closure. First clear a p-power denominator in the finite field basis.
Only for an integral element may the pinned Eisenstein denominator theorem
remove that denominator. The shifted minimal polynomial is Eisenstein over ℤ_p,
not merely over ℤ; this was established in the preceding checkpoint. It is this
combination that identifies the entire integral closure with the polynomial
adjoin. The ordinary native integral power-basis constructor then applies.

The reduction map uses native PowerBasis.lift into ZMod p, with the target
ℤ_p-algebra explicitly induced by PadicInt.toZMod. Its root condition is the
constant coefficient E_n(0)=p reducing to zero. To identify its kernel, use the
native power-basis scalar congruence modulo ϖ_n. A scalar killed by reduction is
a multiple of p, and p belongs to (ϖ_n) by the minimal-polynomial relation.
Native surjectivity into ZMod p and the quotient-by-kernel equivalence finish
the algebraic comparison. This separates the kernel proof from the weaker fact
that the proposed generator maps to zero.

The first dyadic level is useful: K_0=ℚ_2, ζ_0=−1, π_0=−2, and the integral
basis has dimension one. Its sole basis vector is one; the distinguished
power-basis generator is still −2. The quotient by that generator has two
elements. At the first ternary level the basis has dimension two. These tests
detect a wrong bottom-level index, a shifted generator confused with the root,
and a quotient accidentally made into the zero ring.

These declarations are cyclotomic applications of native algebra, not a second
local-field theory. The owning LocalFieldsRamification roadmap supplies canonical
finite-extension structures, integerRing_eq_integralClosure, the Eisenstein
uniformizer theorem and total ramification. The present map has a maximal kernel;
this alone is not a proof that O_n is local, complete, or a DVR, and it does not
identify the algebraic quotient with the canonical valuative residue field.
Those comparisons remain explicit requests. In particular Lemma10.1's actual
power-series evaluation and unit interpolation have not yet been constructed.
The native TauCeti.Place Eisenstein criterion read during this check concerns
function-field places trivial on their constant field. It was not substituted
for the missing mixed-characteristic local-field interface.

The reviewed AUDIT24 entries for all five layers and accepted RS16 ownership
boundaries were checked. The source is the hash-identical published RJW text,
printed161–164 (PDF62–65), read freshly on27 September2026. The explicit integral
closure and quotient arguments are library deductions motivated by §9 and
Lemma10.1, and the dyadic cases extend the source's odd-prime range. No new source
finding or independent review verdict is added.

### Integrality of the cyclotomic root

**Node:** ColemanPowerSeries:L0/cyclotomic-root-integral; lemma. **Suggested declaration:** ColemanCyclotomic.zeta_integral.

The chosen root ζ_n is integral over ℤ_p.

**Hypotheses.** Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

**Proof outline.**

1. Use ζ_n^(p^(n+1))=1 and positive exponent. Native IsIntegral.of_pow applied to the integral element one proves integrality. Subtraction of one also makes π_n integral.

**Dependencies:** ColemanPowerSeries:L0/local-cyclotomic-level, mathlib:IsIntegral.of_pow, mathlib:IsIntegral.sub.

**Acceptance.** The proof uses integrality over ℤ_p, not merely algebraicity over ℚ_p.

**API.**

- level_integer_algebra (instance): Use the composite scalar map ℤ_p→ℚ_p→K_n.
- level_integer_tower (compatibility): These scalar maps form a native scalar tower. No independent ℤ_p-algebra structure is chosen.

**Source:** §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

### The integral cyclotomic difference polynomial

**Node:** ColemanPowerSeries:L0/cyclotomic-integral-minpoly; lemma. **Suggested declaration:** ColemanCyclotomic.difference_minpoly.

The minimal polynomial of π_n over ℤ_p equals E_n.

**Hypotheses.** Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

**Proof outline.**

1. Native IsPrimitiveRoot.minpoly_sub_one_eq_cyclotomic_comp, applied over ℚ_p with the established local irreducibility, identifies the field minimal polynomial.
2. By integrality of π_n and native integral-closure/fraction-field comparison, this is the image of its ℤ_p minimal polynomial. Injectivity of polynomial coefficient mapping ℤ_p→ℚ_p gives the equality over ℤ_p.

**Dependencies:** ColemanPowerSeries:L0/cyclotomic-root-integral, ColemanPowerSeries:L0/local-cyclotomic-irreducible, ColemanPowerSeries:L0/local-cyclotomic-level, mathlib:IsPrimitiveRoot.minpoly_sub_one_eq_cyclotomic_comp, mathlib:minpoly.isIntegrallyClosed_eq_field_fractions'.

**Acceptance.** At p=2,n=0 the polynomial is X+2 and π_0=−2.

**Source:** §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

### Cyclotomic power-basis denominators

**Node:** ColemanPowerSeries:L0/cyclotomic-denominator-clearing; lemma. **Suggested declaration:** ColemanCyclotomic.p_power_denominator.

For every x∈K_n there is k≥0 with p^k x∈ℤ_p[π_n].

**Hypotheses.** Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

**Proof outline.**

1. Use the native subOnePowerBasis of the actual primitive root over ℚ_p. Its finite coordinate expansion expresses x as a finite sum c_i π_n^i.
2. For each nonzero coefficient use the native DVR fraction-field description c_i=u_i p^(a_i), with u_i∈ℤ_p× and integer a_i. Choose k at least every −a_i and zero; then p^k c_i belongs to ℤ_p. Zero coordinates need no denominator.
3. Multiply the finite basis expansion by p^k and use closure of ℤ_p[π_n] under sums, multiplication and scalars.

**Dependencies:** ColemanPowerSeries:L0/local-cyclotomic-level, mathlib:IsPrimitiveRoot.subOnePowerBasis, mathlib:IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible, mathlib:PadicInt.prime_p, mathlib:Module.Basis.sum_repr.

**Acceptance.** The assertion includes nonintegral x; the exponent is allowed to depend on x. It does not assert that every field element is integral.

**Source:** §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

### The cyclotomic integral closure

**Node:** ColemanPowerSeries:L0/cyclotomic-integral-closure; theorem. **Suggested declaration:** ColemanCyclotomic.integralClosure_eq_adjoin.

Inside K_n, integralClosure ℤ_p K_n equals ℤ_p[π_n].

**Hypotheses.** Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

**Proof outline.**

1. Integrality of π_n gives the inclusion of its adjoin into the native integral closure.
2. For x in the integral closure, clear a p-power denominator using the preceding node. Apply native mem_adjoin_of_smul_prime_pow_smul_of_minpoly_isEisensteinAt to the native subOnePowerBasis over ℚ_p. The generator is π_n, its ℤ_p minimal polynomial is E_n, and the previous checkpoint proves E_n Eisenstein at (p).
3. The native theorem cancels all p-power denominators for integral x; this proves the reverse inclusion without constructing a valuation on K_n.

**Dependencies:** ColemanPowerSeries:L0/cyclotomic-root-integral, ColemanPowerSeries:L0/cyclotomic-integral-minpoly, ColemanPowerSeries:L0/cyclotomic-denominator-clearing, ColemanPowerSeries:L0/shifted-cyclotomic-eisenstein, mathlib:IsPrimitiveRoot.subOnePowerBasis, mathlib:mem_adjoin_of_smul_prime_pow_smul_of_minpoly_isEisensteinAt, mathlib:adjoin_le_integralClosure, mathlib:PadicInt.prime_p.

**Acceptance.** This is an algebraic equality in the actual included field. A separate supplier identifies it with the valuation ring.

**Source:** §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

### The root in the integral closure

**Node:** ColemanPowerSeries:L0/integral-cyclotomic-root; construction. **Suggested declaration:** ColemanCyclotomic.integralZeta.

Let integralZeta(n) be ζ_n viewed in the native O_n; write ϖ_n=integralZeta(n)−1 in O_n.

**Hypotheses.** Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

**Proof outline.**

1. Use the cyclotomic-root-integral proof as the membership witness in native integralClosure. The subtype inclusion is injective; it transports the primitive-root statement and the difference formula.

**Dependencies:** ColemanPowerSeries:L0/cyclotomic-root-integral, mathlib:integralClosure, mathlib:IsPrimitiveRoot.of_map_of_injective.

**Acceptance.** The carrier is native integralClosure and the element is the chosen compatible root, not a new abstract integer ring or an independently chosen root.

**Uses.**

- RJW §9 and Lemma10.1: The algebraic integral ring and its explicit generator precede the local-field identification and finite-level lifting.
- ColemanPowerSeries:L1 arithmetic interpolation: Integral polynomial coordinates and their quotient supply the algebraic part of choosing coefficients at a fixed cyclotomic level.

**API.**

- integralZeta_val (coercion): The inclusion of integralZeta(n) into K_n is ζ_n.
- integralZeta_primitive (characterisation): integralZeta(n) is primitive of order p^(n+1).
- integralZeta_difference_val (simp): The inclusion of ϖ_n into K_n is π_n.

**Tests.**

- IntegralTowerTests.root_order (characterisation): integralZeta(n)^(p^(n+1))=1.
- IntegralTowerTests.dyadic_root (computation): For p=2,n=0, integralZeta(0)=−1.
- IntegralTowerTests.root_inclusion (compatibility): The inclusion of integralZeta(n) into Ω is the previously chosen ρ_n.

**Source:** §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

### The integral cyclotomic power basis

**Node:** ColemanPowerSeries:L0/integral-cyclotomic-basis; construction. **Suggested declaration:** ColemanCyclotomic.integralBasis.

Construct integralBasis(n): a native PowerBasis of O_n over ℤ_p with generator ϖ_n.

**Hypotheses.** Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

**Proof outline.**

1. Transport the equality integralClosure=ℤ_p[π_n] through the injective integral-closure inclusion to show that ϖ_n generates O_n over ℤ_p.
2. The generator is integral and ℤ_p is integrally closed. Use native PowerBasis.ofAdjoinEqTop′, the version over an integrally closed domain rather than a field.

**Dependencies:** ColemanPowerSeries:L0/cyclotomic-integral-closure, ColemanPowerSeries:L0/integral-cyclotomic-root, mathlib:PowerBasis.ofAdjoinEqTop'.

**Acceptance.** Native power-basis finite freeness and coordinate expansion are inherited. No second basis carrier or integral monogenicity theorem for arbitrary local fields is planned.

**Uses.**

- RJW §9 and Lemma10.1: The algebraic integral ring and its explicit generator precede the local-field identification and finite-level lifting.
- ColemanPowerSeries:L1 arithmetic interpolation: Integral polynomial coordinates and their quotient supply the algebraic part of choosing coefficients at a fixed cyclotomic level.

**API.**

- integralBasis_gen (simp): The basis generator is ϖ_n; promoted to its own node.
- integralBasis_dim (characterisation): The basis dimension is d_n; promoted to its own node.
- integralBasis_entry (data): For i:Fin(dim), the ith integral basis vector is ϖ_n^i.

**Tests.**

- IntegralTowerTests.basis_zero (degenerate): The zeroth integral basis vector equals one.
- IntegralTowerTests.dyadic_basis_dimension (computation): For p=2,n=0, the integral basis has dimension one.
- IntegralTowerTests.ternary_basis_dimension (computation): For p=3,n=0, the integral basis has dimension two.

**Source:** §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

### The integral basis generator

**Node:** ColemanPowerSeries:L0/integral-cyclotomic-basis-generator; lemma. **Suggested declaration:** ColemanCyclotomic.integralBasis_gen.

The generator of integralBasis(n) equals ϖ_n.

**Hypotheses.** Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

**Proof outline.**

1. The native PowerBasis.ofAdjoinEqTop′ generator equation identifies the selected generator.

**Dependencies:** ColemanPowerSeries:L0/integral-cyclotomic-basis, mathlib:PowerBasis.ofAdjoinEqTop'_gen.

**Acceptance.** For p=2,n=0 this generator is −2, although the one-element basis itself consists of one.

**Tests.**

- IntegralTowerTests.dyadic_difference (computation): For p=2,n=0, ϖ_0=−2.

**Source:** §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

### The minimal polynomial inside the integral closure

**Node:** ColemanPowerSeries:L0/integral-difference-minpoly; lemma. **Suggested declaration:** ColemanCyclotomic.integral_difference_minpoly.

The minimal polynomial of ϖ_n∈O_n over ℤ_p is E_n.

**Hypotheses.** Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

**Proof outline.**

1. Apply native minpoly.algebraMap_eq to the injective map O_n→K_n. The image of ϖ_n is π_n; use cyclotomic-integral-minpoly.

**Dependencies:** ColemanPowerSeries:L0/integral-cyclotomic-root, ColemanPowerSeries:L0/cyclotomic-integral-minpoly, mathlib:minpoly.algebraMap_eq.

**Acceptance.** The same polynomial is used in the algebraic integral ring and in the field; no assumption that O_n is a field enters.

**Source:** §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

### The integral basis dimension

**Node:** ColemanPowerSeries:L0/integral-cyclotomic-basis-dimension; lemma. **Suggested declaration:** ColemanCyclotomic.integralBasis_dim.

The dimension of integralBasis(n) equals d_n=p^n(p−1).

**Hypotheses.** Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

**Proof outline.**

1. Native PowerBasis.natDegree_minpoly identifies the basis dimension with the degree of its generator’s minimal polynomial.
2. Use the generator and integral minimal-polynomial nodes, then cyclotomic natDegree, preservation of degree by X+1 composition and the prime-power totient formula.

**Dependencies:** ColemanPowerSeries:L0/integral-cyclotomic-basis-generator, ColemanPowerSeries:L0/integral-difference-minpoly, mathlib:PowerBasis.natDegree_minpoly, mathlib:Polynomial.natDegree_cyclotomic, mathlib:Polynomial.natDegree_comp, mathlib:Nat.totient_prime_pow.

**Acceptance.** There is no n−1 indexing at the bottom level.

**Source:** §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

### The rational prime in the difference ideal

**Node:** ColemanPowerSeries:L0/prime-in-cyclotomic-difference-ideal; lemma. **Suggested declaration:** ColemanCyclotomic.prime_mem_differenceIdeal.

In O_n, p belongs to the ideal (ϖ_n).

**Hypotheses.** Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

**Proof outline.**

1. The minimal polynomial E_n vanishes at ϖ_n and has constant coefficient p. Write E_n=C(p)+XQ by the polynomial constant-term decomposition.
2. Evaluate: p=−ϖ_n Q(ϖ_n). This places p in the principal ideal, without assuming ϖ_n is a uniformizer.

**Dependencies:** ColemanPowerSeries:L0/integral-difference-minpoly, ColemanPowerSeries:L0/shifted-cyclotomic-constant, mathlib:minpoly.aeval, mathlib:Polynomial.X_dvd_iff.

**Acceptance.** This does not identify the exponent of ramification or show every nonunit is divisible by ϖ_n.

**Source:** §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

### Cyclotomic integral reduction

**Node:** ColemanPowerSeries:L0/cyclotomic-integral-reduction; construction. **Suggested declaration:** ColemanCyclotomic.reduction.

Define red_n:O_n→𝔽_p as the unique ring homomorphism extending the native ℤ_p→ZMod p map and sending integralZeta(n) to one.

**Hypotheses.** Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

**Proof outline.**

1. Give ZMod p the ℤ_p-algebra induced by PadicInt.toZMod. The image of E_n at zero equals the reduction of its constant coefficient p, hence zero.
2. Apply native PowerBasis.lift to integralBasis(n), sending its generator ϖ_n to zero, and forget to a ring homomorphism. Scalar compatibility and the generator equation follow from the native algebra-homomorphism and lift APIs.
3. For uniqueness, promote any other ring map with the specified scalar condition to the same ℤ_p-algebra homomorphism. Use native PowerBasis.algHom_ext at the generator. Native lift_aeval gives reduction of a polynomial in ϖ_n by its constant coefficient.

**Dependencies:** ColemanPowerSeries:L0/integral-cyclotomic-basis-generator, ColemanPowerSeries:L0/integral-difference-minpoly, ColemanPowerSeries:L0/shifted-cyclotomic-constant, mathlib:PadicInt.toZMod, mathlib:PowerBasis.lift, mathlib:PowerBasis.lift_gen, mathlib:PowerBasis.lift_aeval, mathlib:PowerBasis.algHom_ext.

**Acceptance.** Every ring map into ZMod p is surjective by the native theorem. This quotient map is defined algebraically; the canonical valuation residue map is not assumed.

**Uses.**

- RJW §9 and Lemma10.1: The algebraic integral ring and its explicit generator precede the local-field identification and finite-level lifting.
- ColemanPowerSeries:L1 arithmetic interpolation: Integral polynomial coordinates and their quotient supply the algebraic part of choosing coefficients at a fixed cyclotomic level.

**API.**

- reduction_scalar (compatibility): red_n(a)=toZMod(a) for a∈ℤ_p, included into O_n; promoted below.
- reduction_zeta (simp): red_n(integralZeta(n))=1; promoted below.
- reduction_aeval (simp): For f∈ℤ_p[X], red_n(f(ϖ_n))=toZMod(f(0)).
- reduction_unique (universal-property): Any ring homomorphism O_n→ZMod p agreeing on ℤ_p and sending integralZeta(n) to one equals red_n.

**Tests.**

- IntegralTowerTests.reduction_polynomial (computation): red_n(ϖ_n²+2ϖ_n+3)=3 in ZMod p.
- IntegralTowerTests.reduction_prime (non-example): red_n(p)=0, so this map is not an embedding of the characteristic-zero integral ring.
- IntegralTowerTests.reduction_root (compatibility): red_n(integralZeta(n))=1.

**Source:** §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

### Reduction of integral scalars

**Node:** ColemanPowerSeries:L0/cyclotomic-reduction-scalars; lemma. **Suggested declaration:** ColemanCyclotomic.reduction_scalar.

For a∈ℤ_p, red_n(algebraMap(a))=PadicInt.toZMod(a).

**Hypotheses.** Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

**Proof outline.**

1. Use the commutes equation of the native PowerBasis.lift algebra homomorphism with the explicitly chosen target algebra.

**Dependencies:** ColemanPowerSeries:L0/cyclotomic-integral-reduction, mathlib:PowerBasis.lift.

**Acceptance.** The map on constants is fixed; an unspecified residue-field isomorphism would not state this compatibility.

**Source:** §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

### Reduction of the cyclotomic root

**Node:** ColemanPowerSeries:L0/cyclotomic-reduction-root; lemma. **Suggested declaration:** ColemanCyclotomic.reduction_zeta.

red_n(integralZeta(n))=1.

**Hypotheses.** Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

**Proof outline.**

1. The native lift sends its generator ϖ_n to zero. Rewrite integralZeta(n)=ϖ_n+1 and use preservation of addition and one.

**Dependencies:** ColemanPowerSeries:L0/cyclotomic-integral-reduction, ColemanPowerSeries:L0/integral-cyclotomic-basis-generator, mathlib:PowerBasis.lift_gen.

**Acceptance.** For every n and every prime, including the bottom dyadic level, the primitive p-power root reduces to one.

**Source:** §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

### The kernel of cyclotomic reduction

**Node:** ColemanPowerSeries:L0/cyclotomic-reduction-kernel; theorem. **Suggested declaration:** ColemanCyclotomic.reduction_ker.

The kernel of red_n is exactly the principal ideal (ϖ_n).

**Hypotheses.** Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

**Proof outline.**

1. The root reduction equation puts ϖ_n in the kernel and proves one inclusion.
2. For x in the kernel, native PowerBasis.exists_smodEq expresses x modulo (ϖ_n) as an included a∈ℤ_p. Apply red_n and scalar compatibility: toZMod(a)=0.
3. Native PadicInt.ker_toZMod and maximalIdeal_eq_span_p imply a∈pℤ_p. Since p∈(ϖ_n), its image is in (ϖ_n); the congruence then places x there too.

**Dependencies:** ColemanPowerSeries:L0/integral-cyclotomic-basis-generator, ColemanPowerSeries:L0/prime-in-cyclotomic-difference-ideal, ColemanPowerSeries:L0/cyclotomic-reduction-scalars, ColemanPowerSeries:L0/cyclotomic-reduction-root, mathlib:PowerBasis.exists_smodEq, mathlib:PadicInt.ker_toZMod, mathlib:PadicInt.maximalIdeal_eq_span_p.

**Acceptance.** The proof establishes the full kernel, not just vanishing on the generator. Together with surjectivity it shows this ideal is maximal; it does not yet prove uniqueness of the maximal ideal.

**Source:** §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

### The cyclotomic difference quotient

**Node:** ColemanPowerSeries:L0/cyclotomic-difference-quotient; construction. **Suggested declaration:** ColemanCyclotomic.differenceQuotientEquiv.

Construct the native ring equivalence O_n/(ϖ_n)≃ZMod p induced by red_n.

**Hypotheses.** Let p be prime, including p=2, and n≥0. Use the already constructed native intermediate field K_n=ℚ_p(ρ_n), where ρ_n has order p^(n+1), and its element ζ_n. Scalars ℤ_p→K_n are restricted through the specified ℚ_p-algebra. Write π_n=ζ_n−1, d_n=p^n(p−1), E_n=Φ_(p^(n+1))(X+1) over ℤ_p, and O_n=integralClosure ℤ_p K_n, the native algebraic integral closure. No topology or valuation on K_n is installed. The comparison O_n=𝒪[K_n], the canonical residue field and the uniformizer assertion remain the local-field interface boundary.

**Proof outline.**

1. Native ZMod.ringHom_surjective proves red_n is onto. Apply native RingHom.quotientKerEquivOfSurjective.
2. Transport its source along reduction_ker to the quotient by the specified difference ideal. Its value on a quotient class is red_n; scalar and inverse-on-natural-number equations follow.

**Dependencies:** ColemanPowerSeries:L0/cyclotomic-reduction-kernel, ColemanPowerSeries:L0/cyclotomic-reduction-scalars, mathlib:ZMod.ringHom_surjective, mathlib:RingHom.quotientKerEquivOfSurjective.

**Acceptance.** This is a specific quotient of the native algebraic integral closure. Identifying it with 𝓀[K_n] and proving inertia degree one remain supplier-dependent.

**Uses.**

- RJW §9 and Lemma10.1: The algebraic integral ring and its explicit generator precede the local-field identification and finite-level lifting.
- ColemanPowerSeries:L1 arithmetic interpolation: Integral polynomial coordinates and their quotient supply the algebraic part of choosing coefficients at a fixed cyclotomic level.

**API.**

- differenceQuotientEquiv_mk (simp): The equivalence sends the class of x∈O_n to red_n(x).
- differenceQuotientEquiv_scalar (compatibility): The class of the included a∈ℤ_p maps to toZMod(a).
- differenceQuotientEquiv_symm_nat (simp): The inverse sends the natural-number class a∈ZMod p to the class of a∈O_n.

**Tests.**

- IntegralTowerTests.quotient_difference (degenerate): The class of ϖ_n maps to zero.
- IntegralTowerTests.quotient_one (computation): The class of one maps to one.
- IntegralTowerTests.dyadic_quotient (computation): For p=2,n=0 the quotient has exactly two elements; it is not the zero ring.

**Source:** §9 printed161–163 and §10.1/Lemma10.1 printed163–164; complete printed161–164 freshly reread27 September2026 from the published PDF62–65. The source uses total ramification, a uniformizer and residue lifting in the finite-level interpolation argument. These algebraic integral-closure, power-basis and quotient adapters are worker deductions from the pinned library. They do not yet establish the source’s valuative assertions. The dyadic tests extend the source’s odd-prime range.

## Integral-tower continuation checks and next steps

Validation results are recorded in the accompanying handoff and packet checks. All143 predecessor node objects,181 baseline records,13 source findings and predecessor Lean bytes remain unchanged; the former current counts above are explicitly historical. The request for a general Eisenstein interface is narrowed to the remaining valuative comparison.

The existing PMIA supplier is the actual276-node packet. Its newer finite-quotient and unit-test descent additions are preserved; no supplier is replaced by assumed signatures. The Dirichlet packet grew184→190 at publication: the six new L2 finite-residue/psi/unit-moment records were read in full and preserve every existing object and consumed arithmetic interface. The input hash record contains53 binding inputs at the start of the job.

Resume with The algebraic cyclotomic tower, signed relative norms, integralClosure ℤ_p K_n=ℤ_p[ζ_n−1], its native integral power basis and the explicit quotient by ζ_n−1 equal to ZMod p now have nodes. Import the general local-field structures, integerRing_eq_integralClosure and Eisenstein uniformizer/total-ramification interfaces, then prove their cyclotomic specializations and identify the algebraic quotient with the canonical residue field. No topology, localness, DVR instance or ramification index on the new integral closure is asserted here. Construct the full and principal norm-compatible unit inverse limits, continuity of transitions, closedness/compactness, G-action, Tate-module inclusion, and the norm-compatible Teichmüller splitting. Prove principal-unit pro-p hypotheses before importing the ℤ_p-module construction; full units are not a ℤ_p-module. Verify completed action hypotheses and source the explicitly unramified/semilocal coefficient extension with Frobenius and norm data. No arbitrary ramified coefficient extension is justified by this checkpoint.

All other L1–L4 continuation boundaries remain as recorded above and in the packet. This is a partial planning checkpoint, with no claim that any declaration has been implemented.

The full suggested file compiles with zero errors and332 expected proof-placeholder warnings only. The actual276-node PMIA supplier compiles with zero errors and584 such warnings. The transitive import audit reaches2,844 byte-verified pinned Mathlib modules, three pinned Tau Ceti modules reused from existing artifacts, and one actual supplier. No library was rebuilt. Suggested-file SHA256: `928066a24440b06d68646743ee905c9baabe962294b7e5f4a5ced27f2b5c06ab`.

Indexed blueprint: zero errors/warnings. Four-file intake, versioned errata, preservation and parity checks pass. The graph has229 reachable nodes,967 acyclic edges and271 native leaves, with no unresolved stage leaf. These are planning/signature checks; no complete proof implementation is claimed.


## Algebraic cyclotomic local rings and unit lifts

The new algebraic statements apply to every prime, including2. The chosen
level K_n is generated by a primitive p^(n+1)st root; our n is the source’s
level n+1. O_n remains the native integral closure of ℤ_p in that included
field. The element ϖ_n is the already chosen integral root minus1, and its
power-basis degree is d_n=p^n(p−1). No root or integer-ring carrier is replaced.

The existing reduction map has kernel(ϖ_n) and target ZMod p. This shows that
(ϖ_n) is maximal, but uniqueness needs an additional argument. Every maximal
ideal of O_n contracts to the maximal ideal(p) of ℤ_p because the extension
is integral. The Eisenstein polynomial implies ϖ_n^(d_n)∈pO_n, so primality
forces ϖ_n into every maximal ideal. Every maximal ideal therefore equals
(ϖ_n). The native unique-maximal-ideal criterion installs the local-ring
instance. The native integral power basis makes O_n finite over ℤ_p and hence
Noetherian. The generator is nonzero by primitivity, so the maximal ideal is
nonzero. Native DVR equivalences now give the discrete valuation ring instance,
and the native nonzero-generator criterion proves ϖ_n irreducible.

The native residue field of this algebraic local ring is its quotient by the
canonical maximal ideal. The new equivalence with ZMod p is obtained from the
previous quotient equivalence using the exact ideal equality. Its composite
with the canonical residue map is red_n, including the specified map on ℤ_p.
This is more information than an unnamed isomorphism between finite fields.
It identifies units by nonzero reduction and therefore gives the exact rule:
f(ϖ_n) is a unit precisely when f(0) is a unit in ℤ_p.

A native power-basis representative of a unit u has degree less than d_n.
The unit rule forces its constant coefficient to be a unit, so its native
polynomial-to-power-series image is a unit too. Thus the algebraic finite-level
lifting step can use a finite polynomial; no successive infinite expansion is
needed for that assertion. The equality to u here is polynomial algebra
evaluation. The comparison with topological series evaluation is still required
when interpreting RJW Lemma10.1 in its local-field setting.

General local-field structures, normalized valuations, ramification and their
compatibility with this algebraic ring remain owned by LocalFieldsRamification.
Its existing request is narrowed to these comparisons. Neither the field norm
topology, norm-compatible inverse limits nor the Coleman interpolating series
follows from the algebraic DVR argument alone. The native DVR has its algebraic
valuation API; this does not claim that K_n has been equipped with its intended
topological local-field structure.

### A cyclotomic power lies in the prime ideal

`ColemanPowerSeries:L0/cyclotomic-difference-power` — `ColemanCyclotomic.difference_pow_mem_primeIdeal` (lemma).

The power ϖ_n^(d_n) belongs to pO_n.

**Hypotheses:** Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

**Proof outline:**

1. The established integral minimal polynomial of ϖ_n is the shifted cyclotomic polynomial E_n, which is monic and Eisenstein at(p). Its evaluation at ϖ_n is zero.
2. Apply native IsWeaklyEisensteinAt.pow_natDegree_le_of_aeval_zero_of_monic_mem_map to E_n over ℤ_p and its root in O_n. The mapped coefficient ideal is exactly the ideal generated by the included p.
3. Monicity preserves the degree after coefficient mapping. The native power-basis minimal-polynomial degree and the integral-basis dimension identify this degree with d_n. No valuation on the field is used.

**Prerequisites:** `ColemanPowerSeries:L0/shifted-cyclotomic-eisenstein`, `ColemanPowerSeries:L0/integral-difference-minpoly`, `ColemanPowerSeries:L0/integral-cyclotomic-basis-generator`, `ColemanPowerSeries:L0/integral-cyclotomic-basis-dimension`, `mathlib:Polynomial.IsWeaklyEisensteinAt.pow_natDegree_le_of_aeval_zero_of_monic_mem_map`, `mathlib:Polynomial.Monic.natDegree_map`, `mathlib:PowerBasis.natDegree_minpoly`, `mathlib:minpoly.aeval`.

**Acceptance:** The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

**Source:** RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

### Maximality of the difference ideal

`ColemanPowerSeries:L0/cyclotomic-difference-maximal` — `ColemanCyclotomic.differenceIdeal_isMaximal` (lemma).

The principal ideal(ϖ_n) of O_n is maximal.

**Hypotheses:** Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

**Proof outline:**

1. The existing reduction map red_n:O_n→ZMod p is surjective by native ZMod.ringHom_surjective.
2. Its kernel is(ϖ_n) by the preceding checkpoint. Since ZMod p is a field, native ker_isMaximal_of_surjective identifies this kernel as a maximal ideal.

**Prerequisites:** `ColemanPowerSeries:L0/cyclotomic-integral-reduction`, `ColemanPowerSeries:L0/cyclotomic-reduction-kernel`, `mathlib:ZMod.ringHom_surjective`, `mathlib:RingHom.ker_isMaximal_of_surjective`.

**Acceptance:** The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

**Source:** RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

### Uniqueness of the cyclotomic maximal ideal

`ColemanPowerSeries:L0/cyclotomic-unique-maximal` — `ColemanCyclotomic.maximal_ideal_eq_differenceIdeal` (lemma).

Every maximal ideal M of O_n equals(ϖ_n).

**Hypotheses:** Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

**Proof outline:**

1. The extension ℤ_p→O_n is integral by the defining membership in integralClosure. Native integral going-up theory makes the contraction of M maximal in ℤ_p. Native local-ring uniqueness and maximalIdeal_eq_span_p identify it with(p). Thus the included p belongs to M.
2. The previous power relation places ϖ_n^(d_n) in M. A maximal ideal is prime; native mem_of_pow_mem puts ϖ_n in M, hence(ϖ_n)≤M.
3. Both ideals are proper and(ϖ_n) is already maximal. The inclusion forces equality. Existence of some maximal ideal is not used as an unexplained uniqueness assumption.

**Prerequisites:** `ColemanPowerSeries:L0/cyclotomic-difference-power`, `ColemanPowerSeries:L0/cyclotomic-difference-maximal`, `mathlib:integralClosure`, `mathlib:Ideal.isMaximal_comap_of_isIntegral_of_isMaximal`, `mathlib:IsLocalRing.eq_maximalIdeal`, `mathlib:PadicInt.maximalIdeal_eq_span_p`, `mathlib:Ideal.IsPrime.mem_of_pow_mem`.

**Acceptance:** The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

**Source:** RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

### The cyclotomic integral ring is local

`ColemanPowerSeries:L0/cyclotomic-integers-local` — `ColemanCyclotomic.integers_local` (lemma).

Install the native IsLocalRing instance on O_n.

**Hypotheses:** Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

**Proof outline:**

1. Use(ϖ_n) as the maximal ideal supplied by cyclotomic-difference-maximal.
2. The preceding uniqueness lemma supplies the unique-maximal-ideal hypothesis of native IsLocalRing.of_unique_max_ideal. Install that resulting proposition as the instance on the existing ring.

**Prerequisites:** `ColemanPowerSeries:L0/cyclotomic-difference-maximal`, `ColemanPowerSeries:L0/cyclotomic-unique-maximal`, `mathlib:IsLocalRing.of_unique_max_ideal`.

**Acceptance:** The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

**Source:** RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

### The canonical cyclotomic maximal ideal

`ColemanPowerSeries:L0/cyclotomic-maximal-ideal` — `ColemanCyclotomic.integers_maximalIdeal` (lemma).

The native IsLocalRing.maximalIdeal of O_n equals(ϖ_n).

**Hypotheses:** Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

**Proof outline:**

1. Apply the explicit uniqueness theorem to the native maximal ideal, or native eq_maximalIdeal to the already proved maximality of(ϖ_n).
2. The equality connects the canonical local-ring residue map to the previously defined algebraic reduction; it is not merely an abstract field isomorphism.

**Prerequisites:** `ColemanPowerSeries:L0/cyclotomic-integers-local`, `ColemanPowerSeries:L0/cyclotomic-difference-maximal`, `mathlib:IsLocalRing.eq_maximalIdeal`.

**Acceptance:** The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

**Source:** RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

### Finite Noetherian cyclotomic integers

`ColemanPowerSeries:L0/cyclotomic-integers-noetherian` — `ColemanCyclotomic.integers_noetherian` (lemma).

The ring O_n is Noetherian, with its finite ℤ_p-module structure supplied by the existing integral power basis.

**Hypotheses:** Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

**Proof outline:**

1. Install native PowerBasis.finite using integralBasis(n); this gives Module.Finite ℤ_p O_n without making a new basis or finite-module carrier.
2. The base ℤ_p is Noetherian through its native DVR instance. Native IsNoetherianRing.of_finite applied along the specified algebra makes O_n Noetherian.

**Prerequisites:** `ColemanPowerSeries:L0/integral-cyclotomic-basis`, `mathlib:PowerBasis.finite`, `mathlib:IsNoetherianRing.of_finite`.

**API:**

- `integers_finite` (instance): Install the native finite ℤ_p-module instance from integralBasis(n).

**Acceptance:** The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

**Source:** RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

### Cyclotomic integral discrete valuation ring

`ColemanPowerSeries:L0/cyclotomic-integers-dvr` — `ColemanCyclotomic.integers_dvr` (theorem).

Install the native IsDiscreteValuationRing instance on O_n.

**Hypotheses:** Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

**Proof outline:**

1. O_n is a domain as a subring of K_n and is now local and Noetherian. Its maximal ideal is principal by integers_maximalIdeal.
2. The generator ϖ_n is nonzero: integralZeta(n) is primitive of order p^(n+1)>1, so native IsPrimitiveRoot.sub_one_ne_zero applies. Since ϖ_n lies in the maximal ideal, that ideal is nonzero; native isField_iff_maximalIdeal_eq shows O_n is not a field.
3. Apply the native DVR equivalences for a Noetherian local domain that is not a field, using principality of the maximal ideal. This supplies the native DVR instance on the actual integral closure.

**Prerequisites:** `ColemanPowerSeries:L0/cyclotomic-integers-local`, `ColemanPowerSeries:L0/cyclotomic-maximal-ideal`, `ColemanPowerSeries:L0/cyclotomic-integers-noetherian`, `ColemanPowerSeries:L0/integral-cyclotomic-root`, `mathlib:IsPrimitiveRoot.sub_one_ne_zero`, `mathlib:IsLocalRing.isField_iff_maximalIdeal_eq`, `mathlib:IsDiscreteValuationRing.TFAE`.

**Acceptance:** The algebraic DVR has its native algebraic valuation API. This does not install a topological local-field structure on K_n or identify the normalized field valuation.

**Source:** RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

### The cyclotomic difference is a prime element

`ColemanPowerSeries:L0/cyclotomic-difference-irreducible` — `ColemanCyclotomic.integral_difference_irreducible` (lemma).

The element ϖ_n is irreducible in O_n, hence is a uniformizer of this algebraic DVR.

**Hypotheses:** Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

**Proof outline:**

1. Use primitivity of integralZeta(n) and native sub_one_ne_zero to prove ϖ_n≠0, including the bottom dyadic value−2.
2. Combine the canonical maximal-ideal equality with native irreducible_of_span_eq_maximalIdeal. The native lemma needs only a local domain and the indicated nonzero generator; no total-ramification theorem is hidden in the argument.

**Prerequisites:** `ColemanPowerSeries:L0/cyclotomic-maximal-ideal`, `ColemanPowerSeries:L0/cyclotomic-integers-dvr`, `ColemanPowerSeries:L0/integral-cyclotomic-root`, `mathlib:IsPrimitiveRoot.sub_one_ne_zero`, `mathlib:IsDiscreteValuationRing.irreducible_of_span_eq_maximalIdeal`.

**Tests:**

- `LocalCyclotomicTests.dyadic_uniformizer` (computation): At p=2,n=0 the element−2 is irreducible in O_0.
- `LocalCyclotomicTests.nonunit_difference` (non-example): For every n and p, ϖ_n is not a unit.

**Acceptance:** The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

**Source:** RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

### The canonical cyclotomic residue field

`ColemanPowerSeries:L0/cyclotomic-residue-field` — `ColemanCyclotomic.residueFieldEquiv` (construction).

Construct a ring equivalence from native IsLocalRing.ResidueField(O_n) to ZMod p that sends the canonical residue class of x to red_n(x).

**Hypotheses:** Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

**Proof outline:**

1. The native residue field is O_n modulo its canonical maximal ideal. Transport that quotient along integers_maximalIdeal using native Ideal.quotEquivOfEq.
2. Compose with the existing differenceQuotientEquiv. The native quotient-on-representatives formula and differenceQuotientEquiv_mk show that the composite sends residue(x) to red_n(x).
3. Scalar compatibility follows from the existing reduction_scalar statement. Surjectivity of the native residue map proves uniqueness among ring maps whose composite with the residue map equals red_n.

**Prerequisites:** `ColemanPowerSeries:L0/cyclotomic-maximal-ideal`, `ColemanPowerSeries:L0/cyclotomic-difference-quotient`, `ColemanPowerSeries:L0/cyclotomic-reduction-scalars`, `mathlib:IsLocalRing.ResidueField`, `mathlib:IsLocalRing.residue`, `mathlib:Ideal.quotEquivOfEq`, `mathlib:Ideal.quotEquivOfEq_mk`, `mathlib:IsLocalRing.residue_surjective`.

**API:**

- `residueFieldEquiv_residue` (compatibility): The equivalence sends the canonical residue of x to red_n(x).
- `residueFieldEquiv_scalar` (compatibility): On an included a∈ℤ_p the result is PadicInt.toZMod(a).
- `residueFieldEquiv_unique` (universal-property): A ring map from the native residue field to ZMod p with this composite equals the underlying map of residueFieldEquiv.

**Tests:**

- `LocalCyclotomicTests.residue_difference` (degenerate): The canonical residue of ϖ_n maps to0.
- `LocalCyclotomicTests.residue_root` (computation): The canonical residue of integralZeta(n) maps to1.
- `LocalCyclotomicTests.residue_scalar` (compatibility): The canonical residue of any included a∈ℤ_p maps to its native mod-p reduction.
- `LocalCyclotomicTests.dyadic_residue` (computation): For p=2,n=0 the native residue field of O_0 has cardinality2.

**Uses:**

- RJW §9 and Lemma10.1: Identifies residues of local integral elements with residues of the base scalars, with the exact reduction map.
- ColemanPowerSeries:L0 unit towers and L1 arithmetic interpolation: The exact residue comparison supplies the algebraic unit and coefficient-lifting tests before topological norm compatibility.

**Acceptance:** This is the canonical residue field of the algebraic local ring O_n. Its identification with the residue field of the requested topological local-field structure remains a separate compatibility statement.

**Source:** RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

### Cyclotomic units detected by reduction

`ColemanPowerSeries:L0/cyclotomic-unit-reduction` — `ColemanCyclotomic.integers_isUnit_iff_reduction_ne_zero` (lemma).

For x∈O_n, x is a unit if and only if red_n(x)≠0.

**Hypotheses:** Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

**Proof outline:**

1. By native mem_maximalIdeal, the nonunits of O_n are exactly its canonical maximal ideal.
2. Replace this ideal by(ϖ_n), then by the kernel of red_n using the two existing equalities. Kernel membership means red_n(x)=0. Negating gives the displayed unit criterion.

**Prerequisites:** `ColemanPowerSeries:L0/cyclotomic-integers-local`, `ColemanPowerSeries:L0/cyclotomic-maximal-ideal`, `ColemanPowerSeries:L0/cyclotomic-reduction-kernel`, `mathlib:IsLocalRing.mem_maximalIdeal`.

**Acceptance:** The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

**Source:** RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

### Units in cyclotomic polynomial coordinates

`ColemanPowerSeries:L0/cyclotomic-polynomial-unit` — `ColemanCyclotomic.isUnit_aeval_difference_iff` (lemma).

For every polynomial f∈ℤ_p[X], f(ϖ_n) is a unit in O_n if and only if its constant coefficient f(0) is a unit in ℤ_p.

**Hypotheses:** Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

**Proof outline:**

1. Apply the preceding unit criterion to f(ϖ_n) and the existing reduction_aeval formula; the residue is PadicInt.toZMod(f(0)).
2. Native ker_toZMod identifies the kernel with the native maximal ideal of ℤ_p. Native mem_maximalIdeal therefore equates nonzero reduction with being a unit in ℤ_p.
3. This holds for all polynomials, not only a preferred representative of degree less than d_n. Adding a multiple of E_n does not change this unit criterion because E_n(0)=p.

**Prerequisites:** `ColemanPowerSeries:L0/cyclotomic-unit-reduction`, `ColemanPowerSeries:L0/cyclotomic-integral-reduction`, `mathlib:PadicInt.ker_toZMod`, `mathlib:IsLocalRing.mem_maximalIdeal`.

**Tests:**

- `LocalCyclotomicTests.unit_root_polynomial` (computation): The polynomial X+1 evaluates to the unit integralZeta(n).
- `LocalCyclotomicTests.nonunit_constant_prime` (non-example): The polynomial X+p evaluates to a nonunit for every n and p.
- `LocalCyclotomicTests.ternary_unit_constant` (computation): For p=3,n=0, X+2 evaluates to a unit.
- `LocalCyclotomicTests.dyadic_linear_zero` (degenerate): For p=2,n=0, X+2 evaluates to0, and its constant coefficient2 is a nonunit.

**Acceptance:** The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

**Source:** RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

### A bounded polynomial lift of a cyclotomic unit

`ColemanPowerSeries:L0/cyclotomic-unit-polynomial-lift` — `ColemanCyclotomic.exists_unit_polynomial_lift` (lemma).

Every u∈O_n× admits a polynomial f∈ℤ_p[X] of natural degree less than d_n with f(ϖ_n)=u and unit constant coefficient.

**Hypotheses:** Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

**Proof outline:**

1. Native PowerBasis.exists_eq_aeval applied to integralBasis(n) gives a polynomial representative of u with natural degree less than its dimension. The established generator and dimension formulas replace these by ϖ_n and d_n.
2. The representative evaluates to a unit. The preceding polynomial unit criterion makes its constant coefficient a unit in ℤ_p. No infinite expansion, completeness or choice of successive residue representatives is needed for this finite polynomial assertion.

**Prerequisites:** `ColemanPowerSeries:L0/integral-cyclotomic-basis-generator`, `ColemanPowerSeries:L0/integral-cyclotomic-basis-dimension`, `ColemanPowerSeries:L0/cyclotomic-polynomial-unit`, `mathlib:PowerBasis.exists_eq_aeval`.

**Tests:**

- `LocalCyclotomicTests.dyadic_constant_lift` (computation): At p=2,n=0 every unit has a constant lift by a unit of ℤ_2, since d_0=1.

**Acceptance:** The statement concerns the native algebraic cyclotomic integral ring; no general local-field construction is duplicated.

**Source:** RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

### A unit series with a finite polynomial representative

`ColemanPowerSeries:L0/cyclotomic-unit-series-polynomial-lift` — `ColemanCyclotomic.exists_unit_series_polynomial_lift` (lemma).

Every u∈O_n× admits f∈ℤ_p[X] of natural degree less than d_n such that f(ϖ_n)=u and the native polynomial-to-power-series image of f is a unit in ℤ_p[[X]].

**Hypotheses:** Let p be any prime, including2, and n≥0. Use the actual native intermediate field K_n from the preceding nodes, generated by the compatible root of order p^(n+1), with ζ_n its chosen root. Put O_n=integralClosure ℤ_p K_n, ϖ_n=integralZeta(n)−1 and d_n=p^n(p−1)>0. The index n corresponds to the source’s level n+1. All algebraic structures use the specified composite scalar maps. No topology on K_n or comparison with a valuation ring is assumed.

**Proof outline:**

1. Take the polynomial lift with unit constant coefficient from the preceding node.
2. The native polynomial-to-power-series inclusion preserves the constant coefficient. Apply the native PowerSeries.isUnit_iff_constantCoeff theorem to obtain the series-unit assertion.
3. The equality to u in this statement is finite polynomial algebra evaluation. To identify it with the topological evaluation of that same series in K_n, use the owning local-field topology and the native polynomial/evaluation comparison after its hypotheses are supplied.

**Prerequisites:** `ColemanPowerSeries:L0/cyclotomic-unit-polynomial-lift`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`.

**Acceptance:** This is the algebraic part of the finite-level series lift. It neither chooses the norm-compatible Coleman interpolant nor proves analytic evaluation for arbitrary infinite power series.

**Source:** RJW-published, §9 printed161–163 and §10.1, Lemma10.1 printed164/PDF65; complete published printed161–164 freshly read27 September2026. Worker algebraic decomposition of the source’s cyclotomic local ring, uniformizer and finite-level lift. The local/DVR structure is on native algebraic integralClosure. The bounded polynomial lift strengthens the algebraic part of Lemma10.1 using the previously constructed integral power basis. The topological local-field comparison and analytic evaluation of arbitrary infinite series are separate. The dyadic statements extend the source’s odd-prime range.

### Reading, validation and remaining interfaces

All158 preceding whole nodes,203 baseline records,13 source findings and all
preceding suggested-file bytes are preserved. There are no new source findings
or planets, and the other11 requests are unchanged. The third request narrows
the remaining valuation-ring and ramification comparison without rebuilding
the general local-field theorem.

The complete current handoff and all5 reviewed AUDIT24 rows were read afresh.
The accepted RS16 boundaries, binding protocols and LocalFieldsRamification
and Multiquadratic model documents retain continuous-read provenance. The53
captured inputs differ from the preceding Coleman starting manifest only in
DirichletPadicLFunctions:184→198 nodes. Its first6 additions were fully screened
before PR3270; its next8 were freshly read here, with all190 prior nodes
unchanged. The latter give finite Bernoulli generating functions, formal tame
moments, coefficient transport, complex special values and actual measure
comparisons conditional on a new PMIA coefficient-field moment request. They
change no consumed Coleman declaration and add no reverse Coleman dependency.
PMIA remains276 nodes, with its actual suggested module reused unchanged.

Published RJW printed161–164/PDF62–65 was read in full on27 September2026,
including the definitions of full and principal units and the complete proof
of Lemma10.1. The source is
[Rodrigues Jacinto–Williams](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf),
SHA25678d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6.
The native algebraic adapters are worker deductions; the source assumes p odd,
and the retained dyadic tests check the stated extension. Twenty newly cited
baseline declarations and their ambient hypotheses were read. Integral
contraction of maximal ideals, local-ring criteria, DVR equivalences, power-basis
representatives and formal-series unit tests are all reused from the pin.
No theorem about arbitrary finite local-field extensions is restated as new work.

The indexed blueprint checker reports zero errors and warnings. Four-file
intake and the versioned errata wrapper pass. Preservation, declaration/API/test
parity and allowed-file checks pass. The recursively checked graph has 242
reachable nodes, 1,029 edges, 291 native leaves, no unresolved stage leaves
and no cycle. All 158 preceding whole nodes, 203 baseline objects and 13
findings are unchanged. The third supplier request is narrowed; the other
11 requests are unchanged.

The full suggested file elaborates with Lean 4.34.0-rc2 at the pinned baseline:
zero errors and 360 required proof-placeholder warnings only. The import audit
covers 2,844 byte-verified pinned Mathlib modules, 3 existing pinned TauCeti
modules and the actual PMIA276 supplier. Its source hash exactly matches the
previously compiled supplier artifact. No native library or supplier was built,
no Lake project was created, and only one Lean process was run at a time.
Suggested-file SHA256:62bc750416b1094fd84b0fa1405f6a434766d1d8f23815bb2461b1496d3a3544.

Independent finite quotient checks passed 370 comparisons of multiplication-matrix
determinant invertibility with nonzero constant reduction and 100 reduction
multiplicativity checks. They cover p=2,3,5, including the shifted polynomials
X+2, X²+2X+2 and X²+3X+3, the higher ternary degree6 example and the bottom
dyadic value ϖ_0=−2. These finite computations test conventions and unit
criteria; they do not prove the infinite integral ring is a DVR or supply a
local-field topology. All 13 new nodes remain unchecked proof plans.


The algebraic integral closure O_n is now planned as a native local DVR, with maximal ideal(ϖ_n), irreducible generator ϖ_n, canonical algebraic residue field ZMod p and exact unit detection. Every unit has a polynomial lift of degree less than d_n with unit constant coefficient, whose image in the native power-series ring is a unit. Import the general topological local-field structures and identify O_n, its maximal ideal, residue map and algebraic uniformizer with the canonical valuation-ring data; establish normalized valuation, total ramification and the native polynomial/series evaluation comparison. Then build continuous norm transitions, the actual full/principal inverse limits, compatible unit actions and arithmetic norm/evaluation compatibility. The present algebraic structures do not provide those topology or interpolation claims.


## Spectral norm and finite-level cyclotomic evaluation

Fix any prime p, including2. The already chosen compatible root ρ_n has order
p^(n+1); K_n is its native intermediate field in PadicAlgCl p. Set
O_n=integralClosure ℤ_p K_n and ϖ_n=integralZeta(n)−1. The preceding integral
power basis has degree d_n=p^n(p−1)>0. All scalar maps are the previously fixed
composites through ℚ_p. This indexing starts at source level n+1.

The native algebraic closure already carries the spectral norm extending the
p-adic norm on ℚ_p. Its subfield K_n and subring O_n inherit that norm. This
specific norm gives the topology used in this section. General finite-extension
local fields and their canonical valuation-ring comparisons remain owned by
LocalFieldsRamification. In particular, the assertion that O_n equals the full
norm-unit ball is not needed or established here.

Every integral element has norm at most1: the root has finite order and hence
norm1, its difference has norm at most1, and the finite integral power-basis
expansion has coefficients in ℤ_p. The ultrametric inequality bounds the finite
sum. Units and their inverses both satisfy this bound, so units have norm1.
Compactness follows from the continuous surjective finite-coordinate map from
a product of copies of ℤ_p. This argument does not assume that the algebraic
closure is complete.

Write E_n=Φ_(p^(n+1))(X+1). Monicity, the exact constant coefficient p and
Eisenstein coefficient divisibility give E_n=X^(d_n)+p(1+XB) for some integral
polynomial B. Evaluation at ϖ_n gives

ϖ_n^(d_n)=p·u, u=−(1+ϖ_n B(ϖ_n))∈O_nˣ.

The preceding polynomial unit criterion proves that this factor is a unit.
Consequently ‖ϖ_n‖^(d_n)=p⁻¹, and ϖ_n is strictly contracting. At the dyadic
bottom level it is−2 with norm1/2; at the ternary bottom level its norm squared
is1/3. The equation is stated in the actual spectral norm, without installing
a second normalized valuation.

Every positive-radius norm ball at0 in O_n is an ideal. Addition uses the
ultrametric inequality, and multiplication uses the bound on every integral
element. These balls supply the native linear-topology class. Compactness gives
completeness, and strict contraction gives native topological nilpotence.
These are exactly the target hypotheses for PowerSeries.eval₂Hom. They are
verified on O_n; the nondiscrete field K_n does not have a ring-linear topology
as a module over itself.

The evaluation map is the native continuous ring homomorphism ℤ_p⟦T⟧→O_n at
ϖ_n. Its source uses the coefficientwise topology with p-adic coefficient
topology. It sends a series to the sum of its evaluated monomials and agrees
with polynomial algebra evaluation. Thus every unit of O_n is its value on
a unit polynomial of degree less than d_n. This realizes the fixed-level
assertion in RJW Lemma10.1. It supplies no single interpolating series for an
entire norm-compatible tower.

### The scalar map preserves the p-adic norm

Node **ColemanPowerSeries:L0/cyclotomic-scalar-norm**; suggested declaration **ColemanCyclotomic.integers_scalar_norm**.

For every a∈ℤ_p, the norm of its image in O_n equals ‖a‖. The standing hypotheses above apply.

Unfold the inherited subring and subfield norms: both are the norm of the same element in PadicAlgCl p. The previously specified scalar tower identifies this element with the image of a through ℚ_p. Apply native PadicAlgCl.norm_extends and the defining p-adic-integer subtype norm. Applied to a difference this also makes the scalar map an isometry, hence continuous.

Dependencies: ColemanPowerSeries:L0/local-cyclotomic-level, ColemanPowerSeries:L0/integral-cyclotomic-root, mathlib:PadicAlgCl.normedField, mathlib:PadicAlgCl.norm_extends, mathlib:SubfieldClass.toNormedField, mathlib:SubringClass.toNormedCommRing.

The norm is the inherited spectral norm, with no rescaling by the cyclotomic degree.

### Primitivity of the integral cyclotomic root

Node **ColemanPowerSeries:L0/integral-cyclotomic-root-primitivity**; suggested declaration **ColemanCyclotomic.integralZeta_primitive**.

The chosen integral root integralZeta(n) is a primitive p^(n+1)st root of unity in O_n. The standing hypotheses above apply.

The composite inclusion O_n→K_n→PadicAlgCl p is injective and carries the chosen integral root to the already fixed root ρ_n. Apply the established primitivity of ρ_n and native IsPrimitiveRoot.of_map_of_injective. This promotes the existing integral-root API to a dependency node; its suggested signature is already present.

Dependencies: ColemanPowerSeries:L0/integral-cyclotomic-root, ColemanPowerSeries:L0/cyclotomic-root-primitivity, mathlib:IsPrimitiveRoot.of_map_of_injective.

Primitivity is for the specified compatible root, including the dyadic bottom level.

### Cyclotomic integers have norm at most one

Node **ColemanPowerSeries:L0/cyclotomic-integers-norm-bound**; suggested declaration **ColemanCyclotomic.integers_norm_le_one**.

For every x∈O_n, ‖x‖≤1. The standing hypotheses above apply.

The chosen root is primitive of nonzero order. Native IsPrimitiveRoot.isOfFinOrder and IsOfFinOrder.norm_eq_one give norm one. The native nonarchimedean inequality gives ‖ϖ_n‖≤1. Expand x in the existing integral power basis. Its generator is ϖ_n, so native power-basis entries are its powers. Every ℤ_p coordinate has norm≤1, and scalar norm preservation bounds each term by1. Induct over the finite sum using the native nonarchimedean inequality in PadicAlgCl p; the inherited norms transfer the bound back to O_n.

Dependencies: ColemanPowerSeries:L0/cyclotomic-scalar-norm, ColemanPowerSeries:L0/integral-cyclotomic-root-primitivity, ColemanPowerSeries:L0/integral-cyclotomic-basis, ColemanPowerSeries:L0/integral-cyclotomic-basis-generator, mathlib:PowerBasis, mathlib:Module.Basis.sum_repr, mathlib:IsPrimitiveRoot.isOfFinOrder, mathlib:IsOfFinOrder.norm_eq_one, mathlib:PadicInt.norm_le_one, mathlib:PadicAlgCl.isNonarchimedean.

Acceptance examples:

- **CyclotomicTopologyTests.root_norm**: The chosen integral root has norm1 at every level.

This proves the inclusion of O_n in the norm-unit ball only; the converse remains part of the local-field comparison.

### Compact cyclotomic integer rings

Node **ColemanPowerSeries:L0/cyclotomic-integers-compact**; suggested declaration **ColemanCyclotomic.integers_compact**.

The inherited norm topology on O_n is compact. The standing hypotheses above apply.

Use the existing finite integral power basis to map the product of d_n copies of ℤ_p to O_n by the finite sum of coefficient-scaled basis vectors. Scalar norm preservation makes the coefficient map continuous. Ring multiplication, coordinate projections and finite addition are continuous in the inherited norm topology, so this parametrization is continuous. Native basis reconstruction makes the map surjective. The product is compact by native p-adic-integer and product compactness; its continuous image is all of O_n. The native compact-universe criterion gives CompactSpace O_n.

Dependencies: ColemanPowerSeries:L0/cyclotomic-scalar-norm, ColemanPowerSeries:L0/integral-cyclotomic-basis, mathlib:Module.Basis.sum_repr, mathlib:PadicInt.compactSpace, mathlib:Pi.compactSpace, mathlib:IsCompact.image, mathlib:isCompact_univ_iff.

No completeness of the ambient algebraic closure is assumed; compactness comes from finite integral coordinates.

### Cyclotomic units have norm one

Node **ColemanPowerSeries:L0/cyclotomic-unit-norm**; suggested declaration **ColemanCyclotomic.integers_unit_norm**.

For every u∈O_nˣ, ‖u‖=1. The standing hypotheses above apply.

Apply the integer norm bound both to u and its inverse. In the containing field their product has norm1 and the norm is multiplicative. The product of two nonnegative numbers at most1 equals1 only if each equals1. Transfer through the inherited subtype norm.

Dependencies: ColemanPowerSeries:L0/cyclotomic-integers-norm-bound, mathlib:PadicAlgCl.normedField.

Algebraic invertibility is used here; the converse norm-one criterion is not assumed.

### The cyclotomic power relation up to a unit

Node **ColemanPowerSeries:L0/cyclotomic-difference-power-unit**; suggested declaration **ColemanCyclotomic.difference_pow_eq_prime_mul_unit**.

There exists u∈O_nˣ such that ϖ_n^(d_n)=p·u. The standing hypotheses above apply.

The integral minimal polynomial E_n of ϖ_n is monic of degree d_n, is Eisenstein at(p), and has constant coefficient exactly p. The degree follows from the existing power-basis generator and dimension and native minimal-polynomial degree. For each coefficient with 1≤i<d_n, choose its quotient by p using Eisenstein ideal membership. Finite coefficient assembly gives E_n=X^(d_n)+p(1+XB) for a polynomial B over ℤ_p. For d_n=1 this uses B=0; no negative index is used. Evaluate at ϖ_n. The vanishing minimal polynomial gives ϖ_n^(d_n)=p·[−(1+ϖ_n B(ϖ_n))]. The polynomial −(1+XB) has unit constant coefficient −1, so the preceding exact polynomial-unit criterion supplies a unit with this value.

Dependencies: ColemanPowerSeries:L0/shifted-cyclotomic-constant, ColemanPowerSeries:L0/shifted-cyclotomic-eisenstein, ColemanPowerSeries:L0/integral-difference-minpoly, ColemanPowerSeries:L0/integral-cyclotomic-basis-generator, ColemanPowerSeries:L0/integral-cyclotomic-basis-dimension, ColemanPowerSeries:L0/cyclotomic-polynomial-unit, mathlib:Polynomial.IsEisensteinAt.coeff_mem, mathlib:PowerBasis.natDegree_minpoly, mathlib:minpoly.aeval.

The sign is retained: at p=2,n=0, ϖ_0=−2 and the unit factor is−1.

### The cyclotomic difference norm

Node **ColemanPowerSeries:L0/cyclotomic-difference-norm-power**; suggested declaration **ColemanCyclotomic.difference_norm_pow**.

The exact inherited norm satisfies ‖ϖ_n‖^(d_n)=(p:ℝ)⁻¹. The standing hypotheses above apply.

Take norms of the preceding equality ϖ_n^(d_n)=p·u in the containing normed field. Multiplicativity gives the power and product norms. The unit has norm1. Scalar norm preservation and native PadicInt.norm_p identify the remaining factor with p⁻¹.

Dependencies: ColemanPowerSeries:L0/cyclotomic-difference-power-unit, ColemanPowerSeries:L0/cyclotomic-unit-norm, ColemanPowerSeries:L0/cyclotomic-scalar-norm, mathlib:PadicInt.norm_p.

Acceptance examples:

- **CyclotomicTopologyTests.dyadic_difference_norm**: For p=2,n=0, ‖ϖ_0‖=1/2.
- **CyclotomicTopologyTests.ternary_difference_norm_square**: For p=3,n=0, ‖ϖ_0‖²=1/3.

Keep the power equation, without introducing a normalization-dependent integer-valued valuation.

### Strict contraction of the cyclotomic difference

Node **ColemanPowerSeries:L0/cyclotomic-difference-contraction**; suggested declaration **ColemanCyclotomic.difference_norm_lt_one**.

The chosen cyclotomic difference satisfies ‖ϖ_n‖<1. The standing hypotheses above apply.

Primality gives p>1 and d_n>0, hence p⁻¹<1. If ‖ϖ_n‖≥1, its d_nth power is at least1, contradicting the exact norm-power equation.

Dependencies: ColemanPowerSeries:L0/cyclotomic-difference-norm-power.

The assertion includes p=2,n=0; there is no odd-prime restriction.

### The cyclotomic integer-ring linear topology

Node **ColemanPowerSeries:L0/cyclotomic-integers-linear-topology**; suggested declaration **ColemanCyclotomic.integers_linearTopology**.

The inherited norm topology on O_n is a native O_n-linear topology. The standing hypotheses above apply.

For every positive real ε, the open norm ball at0 of radius ε is an ideal: zero lies in it; the nonarchimedean inequality preserves it under addition; and multiplication by any integral element preserves it because that element has norm≤1. Additive inverses preserve the norm. Use the native metric ball basis at0 and native IsLinearTopology.mk_of_hasBasis with these ideals. This installs the class for the existing topology, without replacing the metric or creating a general valuation-ring theory.

Dependencies: ColemanPowerSeries:L0/cyclotomic-integers-norm-bound, mathlib:PadicAlgCl.isNonarchimedean, mathlib:Metric.nhds_basis_ball, mathlib:IsLinearTopology.mk_of_hasBasis.

This ring-linear topology is on O_n. The nondiscrete field K_n does not have this property as a module over itself.

### Finite-level cyclotomic series evaluation

Node **ColemanPowerSeries:L0/cyclotomic-series-evaluation**; suggested declaration **ColemanCyclotomic.seriesEvaluation**.

Construct seriesEvaluation(n): ℤ_p⟦T⟧→O_n as a ring homomorphism, using native PowerSeries.eval₂Hom at ϖ_n with the specified scalar map and inherited norm topology. The standing hypotheses above apply.

The coefficient map is continuous by scalar norm preservation. The compact uniform target is complete by the native compact-completeness theorem; it is Hausdorff and a topological ring by its inherited norm. Its linear topology is the preceding node. Strict contraction and the native theorem on powers in a seminormed ring show that ϖ_n is topologically nilpotent, exactly native PowerSeries.HasEval. Apply native PowerSeries.eval₂Hom. Use the native coe, continuity, series-sum and uniqueness theorems for its API. The source topology is the existing coefficientwise topology induced by the p-adic topology on ℤ_p. Units are preserved by the ring homomorphism.

Dependencies: ColemanPowerSeries:L0/cyclotomic-scalar-norm, ColemanPowerSeries:L0/cyclotomic-integers-compact, ColemanPowerSeries:L0/cyclotomic-integers-linear-topology, ColemanPowerSeries:L0/cyclotomic-difference-contraction, mathlib:IsCompact.isComplete, mathlib:completeSpace_of_isComplete_univ, mathlib:tendsto_pow_atTop_nhds_zero_of_norm_lt_one, mathlib:PowerSeries.HasEval, mathlib:PowerSeries.eval₂Hom, mathlib:PowerSeries.coe_eval₂Hom, mathlib:PowerSeries.eval₂_C, mathlib:PowerSeries.eval₂_X, mathlib:PowerSeries.continuous_eval₂, mathlib:PowerSeries.hasSum_eval₂, mathlib:PowerSeries.eval₂_unique.

The public API is:

- **seriesEvaluation_eq_eval₂** (compatibility): The underlying function is native eval₂ for ℤ_p→O_n at ϖ_n.
- **seriesEvaluation_C** (simp): A constant series a evaluates to the specified scalar image of a.
- **seriesEvaluation_X** (simp): T evaluates to ϖ_n.
- **seriesEvaluation_polynomial** (compatibility): The native image of a polynomial f evaluates to its polynomial algebra evaluation at ϖ_n; promoted to its own node.
- **continuous_seriesEvaluation** (structure): The evaluation homomorphism is continuous for the native coefficientwise p-adic source topology and inherited target norm topology.
- **hasSum_seriesEvaluation** (characterisation): For every F, the series with kth term the scalar image of coeff_k(F) times ϖ_n^k has sum seriesEvaluation(n)(F).
- **seriesEvaluation_unique** (universal-property): Every continuous ring homomorphism ℤ_p⟦T⟧→O_n agreeing with polynomial algebra evaluation on all native polynomial images equals seriesEvaluation(n).
- **isUnit_seriesEvaluation** (functoriality): A unit integral power series has a unit image under seriesEvaluation(n).

Acceptance examples:

- **CyclotomicTopologyTests.eval_root**: The series T+1 evaluates to integralZeta(n).
- **CyclotomicTopologyTests.eval_dyadic_zero**: At p=2,n=0, T+2 evaluates to0.
- **CyclotomicTopologyTests.eval_prime_nonunit**: The constant series p evaluates to a nonunit at every level.
- **CyclotomicTopologyTests.eval_geometric**: The genuinely infinite series Σ_(k≥0)T^k evaluates to an element whose product with 2−integralZeta(n) is1.

The map is a specialization of native evaluation, with all convergence hypotheses discharged. No field-linear-topology instance or independent summation carrier is introduced.

### Polynomial and convergent cyclotomic evaluation agree

Node **ColemanPowerSeries:L0/cyclotomic-evaluation-polynomial**; suggested declaration **ColemanCyclotomic.seriesEvaluation_polynomial**.

For every f∈ℤ_p[T], seriesEvaluation(n) of its native power-series image equals Polynomial.aeval(ϖ_n)(f). The standing hypotheses above apply.

Unfold only the specified native eval₂Hom adapter and apply native PowerSeries.eval₂_coe. Native polynomial algebra evaluation is the same polynomial eval₂ with the specified algebraMap.

Dependencies: ColemanPowerSeries:L0/cyclotomic-series-evaluation, mathlib:PowerSeries.eval₂_coe.

The comparison uses the native polynomial-to-series coercion; no auxiliary lift of coefficients is chosen.

### Finite-level unit lifting under convergent evaluation

Node **ColemanPowerSeries:L0/cyclotomic-unit-series-evaluation-lift**; suggested declaration **ColemanCyclotomic.exists_unit_series_evaluation_lift**.

For every u∈O_nˣ there exists f∈ℤ_p[T] with degree less than d_n such that its native power-series image is a unit and seriesEvaluation(n)(f)=u. The standing hypotheses above apply.

Choose the bounded polynomial lift from cyclotomic-unit-series-polynomial-lift. It already has degree<d_n, is a unit as a power series, and its polynomial evaluation is u. Apply the exact polynomial/convergent-evaluation comparison. No additional series coefficients, infinite successive expansion or compact inverse-limit argument is needed for this fixed-level lift.

Dependencies: ColemanPowerSeries:L0/cyclotomic-unit-series-polynomial-lift, ColemanPowerSeries:L0/cyclotomic-evaluation-polynomial.

Acceptance examples:

- **CyclotomicTopologyTests.dyadic_constant_evaluation_lift**: At p=2,n=0 every unit is the evaluation of a constant unit in ℤ_2.

This establishes the native finite-level interpolation assertion of Lemma10.1, including a bounded polynomial representative. It does not prove a single series interpolates an entire norm-compatible tower.

### Source and ownership boundary

The motivating passage is Rodrigues Jacinto–Williams, *An introduction to
p-adic L-functions*, published §9 and Lemma10.1, printed161–164. The complete
passage was freshly read in the hash-verified
[published source](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf).
The norm adapters, finite-coordinate compactness proof and dyadic extension
are worker deductions from the existing integral basis and the pinned native
APIs. The source assumes p odd. No new source finding is recorded.

Native evaluation is reused with its full hypotheses. The open Mathlib
[semiring evaluation refactor](https://github.com/leanprover-community/mathlib4/pull/30631)
was inspected as a design lead; its broader coefficient generality is not
required here, and it is not treated as part of the pinned baseline.
Searches of current open PRs and indexed Zulip discussions found no specific
replacement for this cyclotomic specialization. That search is not a claim
of exhaustive upstream coverage.

The native integral closure O_n now has its inherited spectral norm, compactness, linear topology and convergent power-series evaluation; every unit is the evaluation of a unit polynomial of degree<d_n. Identify this ring with the canonical local-field valuation ring, its maximal ideal and residue map, and interpret the exact equation ‖ϖ_n‖^(d_n)=p⁻¹ in the owner’s normalized valuation and total ramification conventions. Establish continuous relative norm transitions and arithmetic norm/evaluation compatibility before building the actual norm-compatible inverse limits. No converse characterization of integral elements by norm≤1 is asserted here. Construct the full and principal norm-compatible unit inverse limits, continuity of transitions, closedness/compactness, G-action, Tate-module inclusion, and the norm-compatible Teichmüller splitting. Prove principal-unit pro-p hypotheses before importing the ℤ_p-module construction; full units are not a ℤ_p-module. Verify completed action hypotheses and source the explicitly unramified/semilocal coefficient extension with Frobenius and norm data. No arbitrary ramified coefficient extension is justified by this checkpoint.

L1 still requires the arithmetic norm/evaluation square, interpolation uniqueness and compact successive approximation. General unramified or semilocal coefficient variants need their own exact Frobenius and norm interfaces. The actual full and principal unit inverse limits and their actions are not supplied by fixed-level evaluation.


### Validation of the spectral-norm checkpoint

The full suggested file elaborates at the pinned baseline with zero errors
and386 expected proof-placeholder warnings. Its source audit covers2846
Mathlib modules,3 existing pinned TauCeti modules and the freshly compiled
actual PMIA294 supplier. The indexed packet, intake, errata, preservation and
acyclic dependency checks pass. The finite quotient checks cover seven
cyclotomic levels at four precisions. All declarations remain unchecked
mathematical plans; elaboration and finite examples do not establish proofs.


## Cyclotomic norm valuation and ideal topology

Fix any prime p and n≥0. Let K_n be the existing intermediate field of
PadicAlgCl p generated by the selected root ζ_n of order p^(n+1). The actual
integral closure is O_n=integralClosure ℤ_p K_n, with its existing local DVR
structure, integral root and uniformizer ϖ_n=integralZeta(n)−1. Both K_n and
O_n retain the inherited spectral norm. Write d_n=p^n(p−1), q_n=‖ϖ_n‖ and
m_n=IsLocalRing.maximalIdeal O_n. Scalars use the specified composite through
ℚ_p. The norm equation q_n^(d_n)=p⁻¹, strict contraction and integral-unit
norm one are already available.

Native integral-closure localization gives K_n as the fraction field of O_n.
The native DVR signed factorization expresses each nonzero field element as
ι(u)(ζ_n−1)^k, where u is an integral unit and k is an integer. Its norm is
q_n^k. Since 0<q_n<1, the exponent is unique, and a norm at most one forces
k≥0. The resulting expression lies in O_n. This proves exactly

x integral over ℤ_p ⇔ ‖x‖≤1.

The forward direction is the existing integral-basis norm bound. Zero is
handled separately, and the inverse of the uniformizer is a non-example.
No completeness of PadicAlgCl p, general extension valuation theorem or new
additive valuation is needed for this argument.

The native norm valuation takes values in ℝ≥0 and sends x to its nonnegative
norm. The comparison supplies its existing Valuation.Integers certificate
on the actual O_n, and equality of the two subrings of K_n. The native
certificate’s unit and divisibility API then gives the cyclotomic statements

IsUnit(x) ⇔ ‖x‖=1, x∈m_n ⇔ ‖x‖<1,

reduction_n(x)=0 ⇔ ‖x‖<1, x∈m_n^r ⇔ ‖x‖≤q_n^r.

These formulas preserve the existing reduction map and its algebraic residue
field comparison with ZMod p. In particular, reduction_n(x)=reduction_n(y)
exactly when ‖x−y‖<1. The closed inequality for powers is essential:
ϖ_n^r lies on the boundary of m_n^r and is excluded from m_n^(r+1).
At r=0 the ideal is all of O_n.

The established identity ϖ_n^(d_n)=p·u with u a unit gives (p)=m_n^(d_n).
Native geometric-radius closed balls form a metric neighborhood basis, so
these same powers are a neighborhood basis in the existing spectral topology.
This is a topology comparison on the actual carrier. The normalized valuation,
its positive generator, and the owner’s intrinsic ramification e and f still
use the LocalFieldsRamification interfaces. The prime-ideal equation, field
degree and residue comparison supply concrete inputs for that specialization.

### Norm of a unit times a signed uniformizer power

Node **ColemanPowerSeries:L0/cyclotomic-norm-unit-zpow**; suggested declaration **ColemanCyclotomic.norm_unit_mul_zpow**.

For u∈O_nˣ and k∈ℤ, ‖ι(u)(ζ_n−1)^k‖=q_n^k, where ι:O_n→K_n is the native inclusion. The standing hypotheses above apply.

The inclusion preserves the inherited subtype norm. The preceding unit-norm theorem gives ‖ι(u)‖=1. Use multiplicativity of the field norm and native norm_zpow, then the preceding equality ι(ϖ_n)=ζ_n−1. This works for all signed powers; no integral inverse of ϖ_n is asserted.

Dependencies: ColemanPowerSeries:L0/cyclotomic-unit-norm, ColemanPowerSeries:L0/integral-cyclotomic-root, mathlib:norm_zpow.

Acceptance examples:

- **CyclotomicValuationTests.dyadic_signed_norm**: For every integer k, ‖(ζ_0−1)^k‖=(1/2)^k at p=2,n=0.

For p=2,n=0 the base of the norm powers is 1/2, even though the algebraic uniformizer is −2.

### The cyclotomic spectral norm value group

Node **ColemanPowerSeries:L0/cyclotomic-norm-value-group**; suggested declaration **ColemanCyclotomic.norm_value_group**.

Every nonzero x∈K_n has a unique integer k with ‖x‖=q_n^k. The standing hypotheses above apply.

Apply native integralClosure.isFractionRing_of_finite_extension with A=ℤ_p, K=ℚ_p and L=K_n. The existing finite-dimensional level and scalar tower and the native fraction-field structure of ℤ_p supply every hypothesis. Use this theorem locally; do not construct another fraction field. Apply native IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible to the existing DVR O_n and irreducible ϖ_n. Its unit action on K_n is multiplication through the algebra map. The preceding norm formula gives existence. Irreducibility gives ϖ_n≠0 and hence q_n>0; the preceding contraction gives q_n<1. Native strict antitonicity of k↦q_n^k gives uniqueness.

Dependencies: ColemanPowerSeries:L0/local-cyclotomic-level, ColemanPowerSeries:L0/integral-cyclotomic-root, ColemanPowerSeries:L0/cyclotomic-integers-dvr, ColemanPowerSeries:L0/cyclotomic-difference-irreducible, ColemanPowerSeries:L0/cyclotomic-difference-contraction, ColemanPowerSeries:L0/cyclotomic-norm-unit-zpow, mathlib:integralClosure.isFractionRing_of_finite_extension, mathlib:IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible, mathlib:zpow_right_strictAnti₀.

Zero is excluded because it has no finite integer exponent. This theorem does not define an additive valuation or install local-field instances.

### Integrality and the cyclotomic norm unit ball

Node **ColemanPowerSeries:L0/cyclotomic-integral-iff-norm**; suggested declaration **ColemanCyclotomic.isIntegral_iff_norm_le_one**.

For every x∈K_n, x is integral over ℤ_p if and only if ‖x‖≤1. The standing hypotheses above apply.

For the forward implication regard the integral element as an element of the native integral closure and use the previously established norm bound. For the converse handle x=0 directly. Otherwise use the same native fraction-field and DVR signed factorization as in cyclotomic-norm-value-group: x=ι(u)(ζ_n−1)^k. The norm calculation gives q_n^k≤1. Positivity and strict contraction imply k≥0 by the native signed-power inequality. Write k as a natural number r. Then uϖ_n^r lies in O_n and maps to x. Membership of the native integral closure is exactly integrality over ℤ_p. No completeness or general local-field extension theorem is used.

Dependencies: ColemanPowerSeries:L0/cyclotomic-integers-norm-bound, ColemanPowerSeries:L0/cyclotomic-norm-value-group, ColemanPowerSeries:L0/cyclotomic-norm-unit-zpow, ColemanPowerSeries:L0/cyclotomic-difference-contraction, ColemanPowerSeries:L0/cyclotomic-difference-irreducible, mathlib:integralClosure.isFractionRing_of_finite_extension, mathlib:IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible, mathlib:zpow_le_one_iff_right_of_lt_one₀.

Acceptance examples:

- **CyclotomicValuationTests.zero_integral**: Zero in every K_n is integral over ℤ_p.
- **CyclotomicValuationTests.inverse_difference_nonintegral**: The inverse of ζ_n−1 is not integral over ℤ_p.
- **CyclotomicValuationTests.ternary_inverse_prime**: The inverse of 3 in K_0 at p=3 is not integral over ℤ_3.

Do not reverse the signed exponent inequality: q_n<1, so negative powers have norm greater than one. The zero case is integral.

### The native valuation-integers certificate

Node **ColemanPowerSeries:L0/cyclotomic-norm-integers-certificate**; suggested declaration **ColemanCyclotomic.integers_norm_valuation**.

The native norm valuation v_n satisfies Valuation.Integers v_n O_n for the existing inclusion O_n→K_n. The standing hypotheses above apply.

NormedField.valuation uses the nonnegative spectral norm; the existing inherited norm is ultrametric. Its value is exactly the nonnegative norm. The native inclusion is injective, and its values are ≤1 by the earlier norm bound. For an element of valuation≤1 use cyclotomic-integral-iff-norm to regard it as an element of O_n. These are exactly the three fields of the existing native certificate. This certificate makes the already available native unit and divisibility valuation API applicable directly to O_n. It is a proved proposition about the existing carrier, not an assumed hypothesis or a second valuation ring.

Dependencies: ColemanPowerSeries:L0/cyclotomic-integral-iff-norm, ColemanPowerSeries:L0/cyclotomic-integers-norm-bound, mathlib:NormedField.valuation, mathlib:Valuation.Integers.

General unit and divisibility facts remain native baseline results. Only the cyclotomic certificate is new.

### Equality with the native norm valuation ring

Node **ColemanPowerSeries:L0/cyclotomic-norm-integer-equality**; suggested declaration **ColemanCyclotomic.integralClosure_eq_norm_integer**.

As subrings of K_n, the underlying subring of O_n equals v_n.integer. The standing hypotheses above apply.

Apply subring extensionality. Native integral-closure membership is integrality over ℤ_p; native valuation-integer membership is valuation≤1. Rewrite the valuation as nonnegative norm, and apply cyclotomic-integral-iff-norm. Both inclusions use the same ambient K_n. No transport to a newly selected carrier or topology is required.

Dependencies: ColemanPowerSeries:L0/cyclotomic-integral-iff-norm, mathlib:NormedField.valuation, mathlib:Valuation.mem_integer_iff.

Acceptance examples:

- **CyclotomicValuationTests.native_valuation_root**: The actual ζ_n belongs to the native norm valuation ring.

This equality identifies the norm valuation ring. The owning LocalFieldsRamification comparison with its named normalized local-field structures is still required.

### Unit detection by the inherited norm

Node **ColemanPowerSeries:L0/cyclotomic-norm-unit-criterion**; suggested declaration **ColemanCyclotomic.integers_isUnit_iff_norm_eq_one**.

For x∈O_n, x is a unit if and only if ‖x‖=1. The standing hypotheses above apply.

Instantiate native Valuation.Integers.isUnit_iff_valuation_eq_one with the preceding certificate. Rewrite valuation and subtype coercions as the existing norm. The native theorem already constructs the integral inverse from the unit valuation. Do not replan its general field argument.

Dependencies: ColemanPowerSeries:L0/cyclotomic-norm-integers-certificate, mathlib:Valuation.Integers.isUnit_iff_valuation_eq_one.

The forward direction recovers the earlier integral-unit norm theorem; the new content is the converse for this actual carrier.

### The maximal ideal and the open unit ball

Node **ColemanPowerSeries:L0/cyclotomic-maximal-ideal-norm**; suggested declaration **ColemanCyclotomic.mem_maximalIdeal_iff_norm_lt_one**.

For x∈O_n, x∈m_n if and only if ‖x‖<1. The standing hypotheses above apply.

Native membership in the maximal ideal of a local ring is nonunit membership. Substitute the preceding unit criterion. All elements of O_n have norm≤1. Thus norm not equal to one is equivalent to norm strictly below one.

Dependencies: ColemanPowerSeries:L0/cyclotomic-norm-unit-criterion, ColemanPowerSeries:L0/cyclotomic-integers-norm-bound, mathlib:IsLocalRing.mem_maximalIdeal.

This is an open ball in O_n; equality of norm to one characterizes its complementary unit group.

### Reduction and strict norm inequalities

Node **ColemanPowerSeries:L0/cyclotomic-reduction-norm-kernel**; suggested declaration **ColemanCyclotomic.reduction_eq_zero_iff_norm_lt_one**.

For x∈O_n, reduction_n(x)=0 if and only if ‖x‖<1. The standing hypotheses above apply.

The existing reduction kernel is the ideal generated by ϖ_n, and the existing maximal-ideal theorem identifies that ideal with m_n. Apply the preceding open-ball criterion. Applying this to x−y gives equality of reductions if and only if ‖x−y‖<1. The actual residueFieldEquiv already factors this same reduction map.

Dependencies: ColemanPowerSeries:L0/cyclotomic-reduction-kernel, ColemanPowerSeries:L0/cyclotomic-maximal-ideal, ColemanPowerSeries:L0/cyclotomic-maximal-ideal-norm, ColemanPowerSeries:L0/cyclotomic-residue-field.

Acceptance examples:

- **CyclotomicValuationTests.residue_difference**: For x,y∈O_n, reduction_n(x)=reduction_n(y) if and only if ‖x−y‖<1.

The existing algebraic residue map and its ZMod p comparison are preserved; no second reduction map is defined.

### Maximal-ideal powers as closed norm balls

Node **ColemanPowerSeries:L0/cyclotomic-ideal-powers-norm**; suggested declaration **ColemanCyclotomic.mem_maximalIdeal_pow_iff_norm_le**.

For every natural r and x∈O_n, x∈m_n^r if and only if ‖x‖≤q_n^r. The standing hypotheses above apply.

Rewrite m_n as the principal ideal generated by ϖ_n. Native span_singleton_pow identifies its rth power with the principal ideal of ϖ_n^r, so membership is divisibility by that element. Instantiate native Valuation.Integers.dvd_iff_le with the norm-integers certificate. Rewrite the two values as norms and use multiplicativity on the natural power. For r=0 this says all of O_n has norm≤1; the ideal power is the unit ideal. For r>0 the boundary element ϖ_n^r has equality, so the inequality must be non-strict.

Dependencies: ColemanPowerSeries:L0/cyclotomic-maximal-ideal, ColemanPowerSeries:L0/cyclotomic-norm-integers-certificate, mathlib:Ideal.span_singleton_pow, mathlib:Valuation.Integers.dvd_iff_le.

Acceptance examples:

- **CyclotomicValuationTests.power_zero**: Every x∈O_n belongs to m_n^0.
- **CyclotomicValuationTests.uniformizer_boundary**: For every r≥0, ϖ_n^r belongs to m_n^r but does not belong to m_n^(r+1).

This is a specialization of the native divisibility API to the actual cyclotomic maximal ideal, not a new generic classification of valuation-ring ideals.

### The rational prime ideal in the cyclotomic integers

Node **ColemanPowerSeries:L0/cyclotomic-prime-ideal-power**; suggested declaration **ColemanCyclotomic.primeIdeal_eq_maximalIdeal_pow**.

The principal ideal generated by p in O_n equals m_n^(d_n). The standing hypotheses above apply.

Use the preceding exact equation ϖ_n^(d_n)=p·u with u∈O_nˣ. Native span_singleton_mul_right_unit cancels u at the level of principal ideals. Rewrite m_n as the principal ideal of ϖ_n, and use native span_singleton_pow. This proves the ideal equality without assuming a normalized valuation or invoking the owner’s intrinsic ramification index.

Dependencies: ColemanPowerSeries:L0/cyclotomic-difference-power-unit, ColemanPowerSeries:L0/cyclotomic-maximal-ideal, mathlib:Ideal.span_singleton_mul_right_unit, mathlib:Ideal.span_singleton_pow.

Acceptance examples:

- **CyclotomicValuationTests.dyadic_primeIdeal**: At p=2,n=0 the prime ideal (2) equals m_0.
- **CyclotomicValuationTests.ternary_primeIdeal**: At p=3,n=0 the prime ideal (3) equals m_0 squared.

Together with the existing residue field ZMod p and field degree d_n this supplies concrete input for the owning ramification comparison; it is not itself a construction of that owner’s e and f.

### The maximal-ideal neighborhood basis

Node **ColemanPowerSeries:L0/cyclotomic-maximal-ideal-topology**; suggested declaration **ColemanCyclotomic.maximalIdeal_pow_nhds_basis**.

In the existing norm topology of O_n, the family (m_n^r) indexed by all r≥0 is a neighborhood basis of zero. The standing hypotheses above apply.

Irreducibility of ϖ_n gives q_n>0, and the established contraction gives q_n<1. Native Metric.nhds_basis_closedBall_pow supplies the zero-neighborhood basis of closed balls of radii q_n^r. The preceding ideal-power criterion identifies each closed ball with m_n^r, because distance from zero is the inherited norm. Substitute those equal sets in the native basis theorem. This compares the existing spectral topology with the actual maximal-ideal filtration; it neither replaces the norm topology nor derives it from an assumed adic topology.

Dependencies: ColemanPowerSeries:L0/cyclotomic-ideal-powers-norm, ColemanPowerSeries:L0/cyclotomic-difference-irreducible, ColemanPowerSeries:L0/cyclotomic-difference-contraction, mathlib:Metric.nhds_basis_closedBall_pow.

The basis includes r=0, and its positive powers shrink to zero. The ambient algebraic closure need not be complete.

### Native design and source boundary

The full Rodrigues Jacinto–Williams passage, published161–164 (§9 and
Lemma10.1), was read afresh from the hash-verified
[published paper](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf).
These explicit norm-valuation comparisons and the extension to p=2 are worker
deductions supplying the local arithmetic used by its finite-level unit lift.
The paper assumes p odd. Its thirteen recorded findings remain unchanged.

The native Valuation.Integers certificate and its general API are reused.
The open [Mathlib rename proposal](https://github.com/leanprover-community/mathlib4/pull/43250)
proposes Valuation.IsIntegers for this same characteristic predicate. The
suggested file uses the exact pinned name; adoption of a changed native name
requires only the corresponding import/name adjustment. The open
[norm-to-valuative-topology proposal](https://github.com/leanprover-community/mathlib4/pull/40309)
concerns broader ValuativeRel and topology adapters. That work informs the
owner’s general interface; it is not treated as pinned or rebuilt here.
Current open-PR and indexed Zulip searches found no replacement for these
specific cyclotomic comparisons; search coverage is not exhaustive.

The actual O_n is now identified with the native norm valuation ring, including its units, maximal ideal, reduction kernel and maximal-ideal neighborhood basis; (p)=m_n^(d_n). Compare this concrete norm-valuation data with the owning LocalFieldsRamification named local-field structures, normalized valuation and intrinsic ramification invariants. Establish continuous relative norm transitions and arithmetic norm/evaluation compatibility before constructing the full and principal norm-compatible inverse limits. Construct the full and principal norm-compatible unit inverse limits, continuity of transitions, closedness/compactness, G-action, Tate-module inclusion, and the norm-compatible Teichmüller splitting. Prove principal-unit pro-p hypotheses before importing the ℤ_p-module construction; full units are not a ℤ_p-module. Verify completed action hypotheses and source the explicitly unramified/semilocal coefficient extension with Frobenius and norm data. No arbitrary ramified coefficient extension is justified by this checkpoint.

L1 still requires arithmetic norm/evaluation compatibility, interpolation uniqueness and compact successive approximation. The other stage boundaries retain their precise packet requests and gaps. No stage is closed.
