# Arithmetic statistics: integral orbit dictionaries

This part of ST.1 builds the algebraic interfaces that turn integral tensors into orders, resolvents, ideal data and arithmetic torsors. They serve two different counting problems. A field-counting argument needs to identify maximal orders and weight their integral orbits by automorphisms. A Selmer-counting argument needs to identify locally soluble rational orbits, know when they admit integral representatives, and keep the correct stabilizer. The common infrastructure consists of explicit integral covariants, basis changes and a careful distinction between rational and integral equivalence.

The basic cubic, quartic and quintic ring correspondences belong to the earlier ST.1 targets. This development supplies their coefficient-level constructions and the additional pencil dictionaries. It imports the binary quartic invariants, the PGL₂ action, the genus-one two-descent correspondence, the embedding into ternary quadratic pairs, and the maximality criteria. It does not introduce another version of those objects. In particular, quartic I and J and height conventions belong to ST.0; counting, local density evaluation and uniformity estimates belong to ST.2–ST.4. The weak-divisibility lift here is the algebraic input to a sieve, rather than the sieve estimate itself.

Generic integral lattices are owned by current TauCetiRoadmap/IntegralLattices, and orthogonal and special orthogonal groups by OrthogonalSpinGroups Layer0. PolynomialGaloisGroups Layer4 supplies universal resolvent polynomials; a sextic resolvent polynomial is distinct from the integral rank-six resolvent ring constructed here. JacobianChallenge supplies the smooth Picard and Jacobian interfaces, and EllipticCurves Layer7 supplies the genus-one Selmer interface. The generalized nodal Jacobians, higher-genus two-cover torsors and central-quotient scheme adapters needed below have their own exact input obligations.

## Conventions and prerequisites

An integral based order has a scalar-first basis: e₀=1, followed by a basis of its quotient by scalars. The coordinate carrier of a rank-r order is ℤʳ with componentwise addition; its multiplication must be specified separately. The existing multiplication on the function space is not the intended ring structure. Discriminants are determinants of the trace pairing in the displayed basis. A based resolvent retains its map and orientations, rather than merely its abstract underlying ring.

For binary forms, write f(x,y)=Σᵢ₌₀ⁿ fᵢxⁿ⁻ⁱyⁱ. A coefficient vector has n+1 entries in descending x-degree. The discriminant is the universal integral polynomial in those entries, including f₀=0. For pairs of symmetric n×n matrices the invariant is (−1)^{n(n−1)/2}det(xA−yB). This differs from the ternary polynomial-coefficient convention of the parent quartic-ring representation, which has cross terms represented without division by two and resolvent form 4det(Ax−By). Keep the two interfaces distinct. Characteristic restrictions occur in field parametrizations and geometric comparisons; an integral polynomial identity specializes in every characteristic.

Throughout the ideal dictionary, D is a Dedekind domain with fraction field K of characteristic different from2. L is a finite étale K-algebra of rank n, which may be a product of fields. The native carrier is a commutative algebra, not a field. Assume f₀ and the binary discriminant are nonzero. The order and positive-index ideal formulas use n≥3. Pencils of even degree use n=2g+2≥4. The n=2 boundary requires a negative-index ideal convention and is an explicit input obligation, not a truncated natural-number exponent.

A common isotropic r-plane means an r-dimensional vector subspace on which both bilinear forms vanish on every pair of vectors. Its projectivization has dimension r−1. Integral markings retain a saturated lattice and a unimodular completion. Rational adapted bases do not define integral Q. A locally soluble orbit has a point at every completion in its relevant Fano variety; a degree-one Picard class and an actual rational divisor are distinct until the Brauer obstruction is controlled.

The pinned baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 with Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Use the native determinant, symmetric-matrix predicate, basis, finrank, submodule span, algebra adjoin, norm, trace and exterior-power maps. Norm and trace are used with finite free algebra hypotheses; their total definitions outside that setting do not supply the intended arithmetic invariants. The suggested file uses finite coordinate matrices, native subalgebras and submodules, and a genuine norm equation in its oriented-pair structure.

The imported parent nodes include:

- `ArithmeticStatistics:ST.1/pairs-of-ternary-quadratic-forms`, `quartic-ring-and-cubic-resolvent`, `bhargava-parametrization-of-quartic-rings`, `existence-and-number-of-cubic-resolvents`, and `maximality-of-quartic-rings-at-p` for the integral quartic dictionary.
- `ArithmeticStatistics:ST.1/quadruples-of-quinary-alternating-forms`, `bhargava-parametrization-of-quintic-rings`, and `maximality-of-quintic-rings-at-p` for the quintic dictionary, including its small-prime congruences.
- `ArithmeticStatistics:ST.1/embedding-into-pairs-of-ternary-quadratic-forms` and `orbit-bijection-for-the-embedding` for the binary quartic embedding.
- `ArithmeticStatistics:ST.1/stabilizer-of-a-binary-quartic-is-two-torsion` and `comparison-with-the-cohomological-two-selmer-group` for the genus-one specialization.

Names abbreviated in that list have the same ST.1 prefix. The explicit prerequisite lists attached to the targets below use full identifiers. They give the backward construction order; proof sketches describe smaller algebraic steps without introducing a separate target for each calculation.

## Quartic invariant fibres and resolvents

The coefficient minors first recover the fixed rational rank-two plane and its integral lattice. This separates existence of a ring from the multiplicity of its based resolvents. The invariant-order index then explains why primitive quartic orders have a unique resolvent. A separate monogenization datum identifies exactly the part of the quartic correspondence reached by binary quartics. The rational étale interpretation supplies the cubic algebra used in quartic-field applications, even when that cubic algebra is reducible.

### Quartic coefficient minors

Target `ArithmeticStatistics:ST.1/refinement-quartic-minors`.

Write the coefficient rows of the parent pair of ternary integral quadratic forms in the order 11,12,13,22,23,33, using the integral polynomial coefficients, including cross terms without halving. Set λ(i,j)=a_i b_j−a_j b_i. The 15 entries with i<j give the oriented SL₂-invariant wedge of the two coefficient rows.

Hypotheses and conventions: Base Z scalar extension to any commutative ring preserves the formulas.

Construction or proof: Expand the two-by-two determinants. Row operations of determinant one preserve them; expanding four columns gives λ(i,k)λ(j,l)=λ(i,j)λ(k,l)+λ(i,l)λ(j,k). No symmetric-matrix denominators enter.

Uses: HCL III Lemmas16–17 and Corollary18, §§3.6–3.8, pp.1346–1350; integral-minor-fibres. The Plücker relation identifies the rational rank-two plane; row-change compatibility permits counting its integral lattices without changing the six labelled minors.

API:

- `ArithmeticOrbitRefinement.quarticMinors`: For a 2×6 integral coefficient matrix M, return λ(i,j)=M(0,i)M(1,j)−M(0,j)M(1,i).
- `ArithmeticOrbitRefinement.quarticMinors_swap`: Swapping i and j negates λ(i,j).
- `ArithmeticOrbitRefinement.quarticMinors_plucker`: For i<j<k<l, λ(i,k)λ(j,l)=λ(i,j)λ(k,l)+λ(i,l)λ(j,k).

Unit tests:

- `ArithmeticOrbitRefinement.minors_standard` (computation): For rows (1,0,0,0,0,0) and (0,1,0,0,0,0), λ(0,1)=1.
- `ArithmeticOrbitRefinement.minors_row_swap` (non-example): Interchanging those two rows gives λ(0,1)=−1.
- `ArithmeticOrbitRefinement.minors_dependent` (degenerate): If the second row is an integer multiple of the first, all λ(i,j)=0.

Source: [Higher composition laws III: The parametrization of quartic rings](https://annals.math.princeton.edu/wp-content/uploads/annals-v159-n3-p08.pdf), §3.7, (20),(27), pp.1347–1348.

Prerequisites: `ArithmeticStatistics:ST.1/pairs-of-ternary-quadratic-forms`, `mathlib:Matrix.det`.

### Integral fibres of quartic minors

Target `ArithmeticStatistics:ST.1/refinement-integral-minor-fibres`.

Every nonzero integral alternating 6×6 array satisfying the four-index Plücker equations is the minors array of an integral 2×6 matrix. If d>0 is the gcd of its entries, its fibre modulo SL₂(Z), with the six coefficients fixed, is in bijection with index-d sublattices of the saturated oriented rank-two coefficient lattice, and has Σ_{a|d}a elements. The zero array is excluded from this finite-count theorem. This is a based coefficient assertion, not a quotient by quartic-ring automorphisms.

Hypotheses and conventions: At least one prescribed minor is nonzero. The six coefficient labels remain fixed; only the two rows change basis.

Construction or proof: Choose a nonzero minor to reconstruct the rational rank-two plane and use the Plücker equations to check its remaining coordinates. Saturate its intersection with Z⁶. The primitive minors specify an oriented basis of this lattice; minors scaled by d specify oriented sublattices of index d. Hermite normal forms count them by the divisor sum.

Acceptance: For primitive minors the fibre is a single SL₂(Z)-orbit. For gcd 2 there are three oriented lattice classes. A zero minors array includes many dependent pairs; no finite divisor-sum formula is assigned to it.

Source: [Higher composition laws III: The parametrization of quartic rings](https://annals.math.princeton.edu/wp-content/uploads/annals-v159-n3-p08.pdf), Lemmas16–17 and their proofs, pp.1348–1349.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-quartic-minors`, `mathlib:Module.Basis`, `mathlib:Submodule.span`, `mathlib:Submodule.smithNormalForm`.

### Index of the quartic invariant order

Target `ArithmeticStatistics:ST.1/refinement-quartic-invariant-index`.

For an integral quartic order Q of nonzero discriminant with cubic resolvent R, the subring generated by the scalar element and the quadratic resolvent map image is the cubic invariant order R_inv(Q), independent of the choice of R inside the rational resolvent algebra. Its index in R equals the content of Q. Thus R_inv(Q)=R exactly when Q has content one. For Q=Z+nQ′ with primitive Q′, the invariant order is Z+n²R_inv(Q′).

Hypotheses and conventions: Use the parent based quadratic resolvent map and scalar-compatible orientation. Content is the maximal positive integer n with Q=Z+nQ′. Nonzero discriminant ensures finite positive content and a full-rank invariant order; the infinite-content boundary is a separate obligation.

Construction or proof: The gcd of coefficient minors equals content. In the primitive case the six coefficient columns generate the entire rank-two quotient of R, so the map image generates R. In general the quadratic map scales by n². The invariant-order index in the primitive resolvent is n⁴ and the given resolvent index is n³; divide to obtain n.

Acceptance: Primitive Q has invariant order equal to its unique resolvent. Scaling a primitive quartic order by n scales the rank-two invariant quotient by n², not n.

Source: [Higher composition laws III: The parametrization of quartic rings](https://annals.math.princeton.edu/wp-content/uploads/annals-v159-n3-p08.pdf), Corollary18 and proof, §3.8, p.1350.

Prerequisites: `ArithmeticStatistics:ST.1/quartic-ring-and-cubic-resolvent`, `ArithmeticStatistics:ST.1/existence-and-number-of-cubic-resolvents`, `ArithmeticStatistics:ST.1/refinement-integral-minor-fibres`.

### Cubic étale resolvent of a quartic algebra

Target `ArithmeticStatistics:ST.1/refinement-quartic-etale-resolvent`.

Let Q be a quartic étale algebra over a characteristic-zero field K. The three partitions of its four geometric embeddings into two unordered pairs form a Galois set of size three. The associated cubic étale algebra is the rationalization of any cubic resolvent order of Q when such an order is given. A quartic field does not force its cubic resolvent algebra to be a field: a cyclic quartic extension has a fixed partition and yields K times a quadratic algebra. The discriminants of an integral quartic order and its cubic resolvent order agree; this is an equality of order discriminants, not a claim that both orders are maximal.

Hypotheses and conventions: Characteristic zero; four distinct geometric embeddings. An integral order/resolvent is specified for the discriminant comparison.

Construction or proof: The S4 action on pair partitions factors through S3 with kernel the Klein four group. The quadratic resolvent expression xx′+x″x‴ takes one value for each partition. Descent identifies the resulting rank-three algebra with the invariant subalgebra in the rational S4-closure. Use the parent discriminant-preserving map to compare integral orders.

Acceptance: Split K⁴ has split cubic resolvent K³. A cyclic quartic field gives a reducible cubic étale resolvent.

Source: [Higher composition laws III: The parametrization of quartic rings](https://annals.math.princeton.edu/wp-content/uploads/annals-v159-n3-p08.pdf), §2.3, (8)–(9), pp.1337–1339.

Prerequisites: `ArithmeticStatistics:ST.1/quartic-ring-and-cubic-resolvent`, `ArithmeticStatistics:ST.1/nondegenerate-forms-and-etale-cubic-algebras`.

### Monogenized cubic resolvents

Target `ArithmeticStatistics:ST.1/refinement-monogenized-resolvent`.

A monogenization of a cubic ring C is an element ω modulo Z·1 with a lift w such that 1,w,w² is a Z-basis. Two lifts differing by an integer define the same monogenization. For a quartic ring, retain the full parent cubic-resolvent map and orientation as well as this monogenization. Isomorphisms must preserve ω, rather than merely the underlying monogenic ring.

Hypotheses and conventions: C is free of rank3 over Z; no discriminant restriction.

Construction or proof: Translate the lift and compare the three power-basis columns by a unipotent integer matrix. The same determinant-one calculation gives the subgroup N of changes fixing the first quotient basis vector.

Uses: Wood Proposition2.3 p.6, Proposition4.1 p.7, Theorem1.1 p.1 and §5 pp.8–9; wood-ring-interpretation. The binary-quartic inverse needs a generator of the cubic resolvent modulo scalars, with translation and sign controlled; the adjoin characterization separates a true generator from a proper suborder.

API:

- `ArithmeticOrbitRefinement.IsMonogenizing`: For a cubic Z-algebra C and w∈C, 1,w,w² are Z-linearly independent and span C.
- `ArithmeticOrbitRefinement.monogenizing_translate`: IsMonogenizing(w+k)=IsMonogenizing(w) for k∈Z.
- `ArithmeticOrbitRefinement.monogenizing_adjoin`: A monogenizing w satisfies Z[w]=C.

Unit tests:

- `ArithmeticOrbitRefinement.monogenizing_truncated` (computation): In Z[t]/(t³), t is monogenizing.
- `ArithmeticOrbitRefinement.monogenizing_translate_test` (compatibility): In Z[t]/(t³), t+1 is monogenizing and gives the same quotient generator class.
- `ArithmeticOrbitRefinement.monogenizing_square_fails` (non-example): In Z[t]/(t³), t² is not monogenizing: its square is zero and its power basis misses t.

Source: [Quartic rings associated to binary quartic forms](https://arxiv.org/pdf/1007.5501v2), Defining paragraph p.5, Proposition2.3 p.6 and Proposition4.1 p.7.

Prerequisites: `ArithmeticStatistics:ST.1/quartic-ring-and-cubic-resolvent`, `mathlib:Module.Basis`, `mathlib:Algebra.adjoin`, `mathlib:AdjoinRoot`, `mathlib:LinearIndependent`.

### Ring interpretation of the binary quartic embedding

Target `ArithmeticStatistics:ST.1/refinement-wood-ring-interpretation`.

The parent PGL₂(Z)-orbit embedding into pairs of ternary integral quadratic forms has the following ring interpretation: its image parametrizes quartic rings equipped with a monogenized cubic resolvent. For Wood’s ordinary GL₂(Z) action the determinant-square twist is trivial on integral unimodular matrices, and scalar −1 acts trivially on quartics. Thus Wood’s GL₂(Z)-orbit set is the parent PGL₂(Z)-orbit set. The generator, the cubic-resolvent map and the ring discriminant are preserved.

Hypotheses and conventions: Integral unimodular groups; this equivalence of action conventions is not asserted over arbitrary fields.

Construction or proof: In Wood’s coordinates A₀ has 4det A₀=−1. The associated cubic multiplication makes 1,w,w² a basis. Conversely monogenization gives a ternary quadratic form with 4det=−1; its integral equivalence to the Veronese form supplies the inverse. The stabilizer calculation in the parent turns equivalence of based pairs into GL₂ equivalence of quartics. Respect the parent corrected quartic multiplication and the minus sign in 4det(Ax−By).

Acceptance: Dropping the generator class loses information and changes the orbit problem. Wood’s A₀ and the parent Veronese A₁ are equivalent coordinate conventions, not equal matrices.

Source: [Quartic rings associated to binary quartic forms](https://arxiv.org/pdf/1007.5501v2), Theorems1.1,2.5,3.1; Lemma3.2; §5 proof, pp.1,6–8.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-monogenized-resolvent`, `ArithmeticStatistics:ST.1/embedding-into-pairs-of-ternary-quadratic-forms`, `ArithmeticStatistics:ST.1/orbit-bijection-for-the-embedding`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2`.

## Quintic and sextic multiplication

Construct multiplication before stating the integral orbit theorem. The universal tables make sense at discriminant zero, while the rational symmetric-group closure comparison requires nonzero discriminant. Their separation is essential: a trace-dual construction on the étale locus alone does not construct every degenerate quintic ring. Minimal integral models and maximal orders then use the parent local maximality criterion, with the quotient basis held fixed for the strongest uniqueness statement.

### Normalized quintic multiplication

Target `ArithmeticStatistics:ST.1/refinement-quintic-multiplication`.

For the parent integral alternating quadruple A, construct the commutative ring R(A) on Z⁵ with identity e₀ and the usual additive group. Normalize c¹₁₂=c²₁₂=c³₃₄=c⁴₃₄=0. The remaining nonconstant coefficients in e_i e_j are the unique solution of HCL IV (21), with permutation signs and bracket denominators cancelled as integral polynomials. Define c⁰_ij=Σ_{r=1}⁴(cʳ_jk cᵏ_ri−cʳ_ij cᵏ_rk), choosing k≠i; this is independent of that choice. The multiplication is associative at every A, including A=0.

Hypotheses and conventions: A has zero diagonal and opposite off-diagonal entries; characteristic two is handled by the integral polynomial specialization.

Construction or proof: Use Q(X,Y)=Q(X+Y)−Q(X)−Q(Y) from the parent Pfaffian covariant. The bracket is Q(A_i,A_j)ᵀ A_k Q(A_l,A_m). Repeated indices give divisibility by two or four before specializing. Solve (21) with the four normalization constraints, then impose the constant-coefficient associativity equation. Prove the remaining identities as universal integral polynomial identities, first on the dense nondegenerate locus and then identically.

Uses: HCL IV Theorem8 p.80, Theorem12 pp.84–88 and Lemma16 pp.88–89; integral-quintic-realization. The integral associative multiplication table constructs the order before orbit descent; coefficient homogeneity clears rational denominators and the fixed additive structure keeps the based order normalized.

API:

- `ArithmeticOrbitRefinement.quinticRing`: Return a commutative ring structure on the coordinate carrier Z⁵.
- `ArithmeticOrbitRefinement.quinticRing_add`: Its addition is componentwise and its identity is e₀.
- `ArithmeticOrbitRefinement.quinticCoeff_scale`: A↦tA scales each nonconstant normalized structure coefficient by t⁵, and each constant coefficient by t¹⁰.

Unit tests:

- `ArithmeticOrbitRefinement.quintic_zero` (degenerate): At A=0, e_i e_j=0 for all i,j>0, so R(0)=Z⊕Z⁴ with square-zero augmentation ideal.
- `ArithmeticOrbitRefinement.quintic_one` (characterisation): For every A, e₀ e_i=e_i; using the all-ones vector as identity fails this test.
- `ArithmeticOrbitRefinement.quintic_sparse` (computation): Take A₁=E₁₂−E₂₁+E₃₄−E₄₃, A₂=E₄₅−E₅₄, A₃=E₁₂−E₂₁+E₃₅−E₅₃, A₄=0. The coefficient of e₄ in e₁e₃ is 1, by (19).

Source: [Higher composition laws IV: The parametrization of quintic rings](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n1-p02.pdf), §4, (16)–(22), pp.67–69.

Prerequisites: `ArithmeticStatistics:ST.1/quadruples-of-quinary-alternating-forms`, `mathlib:Matrix.det`, `mathlib:Algebra.trace`.

### Normalized sextic multiplication

Target `ArithmeticStatistics:ST.1/refinement-sextic-multiplication`.

Construct S(A) on Z⁶ with the usual addition and identity e₀. Form the 4×4 determinants δ of the four coefficient rows of A. Use the cubic contractions D of (35), but only the integral combinations specified in (36): individual D expressions need not be integral. Normalize d¹₁₂=d²₁₂=d³₃₄=d⁴₃₄=d⁴₄₅=0 and recover constant terms from the associative equation (38), choosing k≠i. The resulting table is integral and associative for all A. Its discriminant is (16 Disc(R(A)))³.

Hypotheses and conventions: The identity and all six coordinates are retained. No nonzero-discriminant assumption is made for the polynomial table.

Construction or proof: The δ determinants are degree four. Lemma7 identifies the degree-twelve integral combinations as multiplication indices on the nondegenerate resolvent lattice. Normalization fixes translation ambiguity. Extend the table identities and discriminant identity polynomially to the zero-discriminant locus.

Uses: HCL IV Theorem8 p.80 and Definition11 p.83; based-sextic-resolvent. The same tensor must construct a rank-six integral ring with the stated trace discriminant, including degenerate tensors; the factor16 normalization identifies the correct resolvent lattice.

API:

- `ArithmeticOrbitRefinement.sexticRing`: Return the commutative ring structure on Z⁶ associated to A.
- `ArithmeticOrbitRefinement.sexticRing_add`: The addition is componentwise and the identity is e₀.
- `ArithmeticOrbitRefinement.sextic_discriminant`: Disc S(A)=4096(Disc R(A))³.

Unit tests:

- `ArithmeticOrbitRefinement.sextic_zero` (degenerate): For A=0, all products e_i e_j with i,j>0 vanish.
- `ArithmeticOrbitRefinement.sextic_one` (characterisation): The identity is e₀, and e₀ e₅=e₅.
- `ArithmeticOrbitRefinement.sextic_factor16` (non-example): If Disc R(A)=1, Disc S(A)=4096, so S(A) cannot be the split ring Z⁶ of discriminant 1.

Source: [Higher composition laws IV: The parametrization of quintic rings](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n1-p02.pdf), §6, (34)–(38), Lemma7, pp.77–79; (33), p.76.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-quintic-multiplication`, `mathlib:Matrix.det`, `mathlib:Algebra.trace`.

### Based sextic resolvent data

Target `ArithmeticStatistics:ST.1/refinement-based-sextic-resolvent`.

For based quintic and sextic rings R,S with scalar-first normalized bases, a resolvent map is a Z-linear φ:R/Z→∧²(S/Z). Its 40 coordinates form the parent quadruple A. Require that the normalized multiplication tables recovered from A equal the given tables of both R and S. Based changes use GL₄(Z)×SL₅(Z), after compatible orientations are chosen. This defines the all-discriminant resolvent data; an abstract sextic ring without φ does not suffice.

Hypotheses and conventions: Ranks 5 and 6 with primitive scalar vector in each chosen basis. Bases and orientation convention are explicit.

Construction or proof: Identify R/Z and S/Z with their free coordinate modules through the chosen bases. Use the native exterior-power wedge basis to read φ as 40 coefficients. Compare multiplication and identity, rather than requiring equality of carrier types. Independence of normalized lifts follows from the translation rules in §§4 and6.

Uses: HCL IV Theorem1 pp.54–55 and Theorem17 p.89; quintic-minimal-model. The orbit correspondence keeps the map and oriented bases along with both rings; this datum is needed to distinguish minimal integral representatives and their based resolvents.

API:

- `ArithmeticOrbitRefinement.IsBasedSexticResolvent`: For a coefficient quadruple A and normalized coordinate ring structures R,S, the condition is R=R(A) and S=S(A). This coordinate predicate represents φ through its coefficients.
- `ArithmeticOrbitRefinement.basedSexticResolvent_self`: The pair R(A),S(A), with map having coordinates A, is resolvent data.
- `ArithmeticOrbitRefinement.basedSexticResolvent_disc`: Resolvent data satisfies Disc S=4096(Disc R)³.

Unit tests:

- `ArithmeticOrbitRefinement.resolvent_zero` (degenerate): A=0 gives resolvent data between the two square-zero rings of ranks 5 and6.
- `ArithmeticOrbitRefinement.resolvent_recovers_both` (characterisation): Holding A fixed forces both given coordinate multiplications, not only the quintic one.
- `ArithmeticOrbitRefinement.resolvent_wrong_disc` (non-example): A sextic structure with discriminant different from 4096(Disc R(A))³ fails the resolvent condition.

Source: [Higher composition laws IV: The parametrization of quintic rings](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n1-p02.pdf), Definitions10–11, §9, pp.82–83.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-quintic-multiplication`, `ArithmeticStatistics:ST.1/refinement-sextic-multiplication`, `mathlib:exteriorPower.ιMulti`, `mathlib:exteriorPower.map`.

### Comparison with the nondegenerate resolvent lattice

Target `ArithmeticStatistics:ST.1/refinement-nondegenerate-resolvent-comparison`.

For Disc R≠0, compare the all-discriminant map definition with a rank-six lattice S in the M-fixed part of the rational S₅-closure, where M is the order-20 metacyclic subgroup. Require 1 primitive, Disc S=(16 Disc R)³, and integral image of the alternating trace-dual map g:∧²(ann(1)⊂S*)→ann(1)⊂R*. With compatible oriented bases, its coordinates recover R and S and the lattice is closed under multiplication. The image condition and discriminant condition are both necessary.

Hypotheses and conventions: Nonzero discriminant; the rational S₅-closure and its permutation labels are specified.

Construction or proof: The alternating trilinear determinant f of (23), divided by 16 Disc R, is integral exactly when its orientation-dual bilinear map g is integral. The trace-zero dual modules have ranks four and five. Formula (32) and compatible orientations recover the quintic table; Lemma7 recovers the sextic table and proves ring closure.

Acceptance: The sextic discriminant is a cube with the factor 16 present. The map targets the annihilator of 1 in the dual, not the quintic ring itself.

Source: [Higher composition laws IV: The parametrization of quintic rings](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n1-p02.pdf), Definition5, Proposition6, §§5.3–7, pp.73–80.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-based-sextic-resolvent`, `mathlib:Algebra.trace`, `mathlib:exteriorPower.map`.

### Integral realization of quintic multiplication invariants

Target `ArithmeticStatistics:ST.1/refinement-integral-quintic-realization`.

An integral set of normalized nonconstant quintic structure coefficients that occurs among the SL₅ invariants of a complex alternating quadruple has an integral quadruple with those same coefficients. Applied to quintic rings, this supplies the existence part imported from the parent correspondence.

Hypotheses and conventions: The integral coefficients belong to the complex invariant image; associativity alone must first be proved to imply this.

Construction or proof: Lemma13 produces coefficients multiplied by an integer through row/column scaling after finding a common isotropic pair. Lemma14 clears rational denominators up to a multiplier. Lemma15 lowers a positive multiplier at a prime through its two Pfaffian normal forms. Induction yields multiplier one. The source omits the nonétale rational classification used before Lemma14; record that proof obligation separately.

Acceptance: The chosen integral realization preserves every normalized coefficient, not merely the discriminant. Scaling all four matrices by n alone gives n⁵ coefficients and does not prove Lemma13.

Source: [Higher composition laws IV: The parametrization of quintic rings](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n1-p02.pdf), Theorem12 and Lemmas13–15, §§10–11, pp.83–88.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-quintic-multiplication`, `mathlib:Module.Basis`.

### Quintic maximal rings and minimal integral models

Target `ArithmeticStatistics:ST.1/refinement-quintic-minimal-model`.

For a nondegenerate rational alternating quadruple, minimal absolute integral discriminant in its GL₄(Q)×GL₅(Q)-orbit corresponds to the maximal quintic order. For a fixed maximal quintic ring and fixed normalized quotient basis, its integral realizations form a single SL₅(Z)-orbit. This strengthens the parent’s unbased GL₄(Z)×SL₅(Z) uniqueness with the basis fixed.

Hypotheses and conventions: Nonzero discriminant; minimality uses the full GL₅ rational action, as specified by the reviewed parent.

Construction or proof: Use the 252 maximal minors of the five Pfaffian quadrics: divisibility at a prime either exhibits content or the alternative normal form yielding an overring with quotient (Z/pZ)³. Maximality excludes both. The quadrics then span the saturated integral lattice in their common rational plane, so the transition matrix is integral unimodular.

Acceptance: The parent maximality congruences, including primes2 and3, are retained. No uniqueness claim is made for arbitrary nonmaximal rings.

Source: [Higher composition laws IV: The parametrization of quintic rings](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n1-p02.pdf), Lemma16, Theorem17 and Corollaries18–19, pp.88–89.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-quintic-multiplication`, `ArithmeticStatistics:ST.1/refinement-integral-quintic-realization`, `ArithmeticStatistics:ST.1/maximality-of-quintic-rings-at-p`.

## Symmetric pencils and oriented ideals

The signed determinant and the universal discriminant define the fibres of the representation. The order R_f and its ideals retain leading-coefficient denominators as fractional lattices. Determinant ideals encode orientation, and the scalar s must survive passage to rational norm classes. Central quotients of group schemes require their own point functor: quotienting the group of D-points need not give all points of the quotient scheme.

### Symmetric pencils and their invariant binary forms

Target `ArithmeticStatistics:ST.1/refinement-symmetric-pencil`.

Let Wₙ(R) be pairs (A,B) of symmetric n×n matrices over a commutative ring. Define f_A,B(x,y)=(−1)^{n(n−1)/2}det(xA−yB), represented by coefficients f_i of x^{n−i}y^i. SLₙ acts by simultaneous congruence. For even n the scalar μ₂ acts trivially, giving a group-scheme action of SLₙ/μ₂. Its R-points generally exceed SLₙ(R)/μ₂(R). Over C the invariant ring of SLₙ is the polynomial ring in the n+1 determinant coefficients.

Hypotheses and conventions: No halving of off-diagonal entries: these are bilinear Gram matrices. Arithmetic solubility later requires a field of characteristic not2 and nonzero discriminant.

Construction or proof: Expand the determinant universally, checking homogeneity. Congruence multiplies the invariant by det(g)². The two scalar factors cancel for the μ₂ action. The invariant-ring theorem is used over C as in the source; an integral invariant-ring theorem is not inferred from it.

Uses: BGW Theorem16 p.7, Corollary19 p.8 and Theorem24 pp.14–16; integral-pencil-orbits and pencil-existence. The signed determinant labels the integral and rational orbit fibres; congruence and scalar characters track how a change of basis or model changes that fibre.

API:

- `ArithmeticOrbitRefinement.pencilInvariant`: For any two n×n matrices, return the n+1 coefficients of the signed determinant; restrict to symmetric matrices for Wₙ.
- `ArithmeticOrbitRefinement.pencilInvariant_congr`: Replacing A,B by gAgᵀ,gBgᵀ multiplies every coefficient by det(g)².
- `ArithmeticOrbitRefinement.pencilInvariant_scalar`: For A=aIₙ and B=bIₙ the invariant is (−1)^{n(n−1)/2}(ax−by)ⁿ.

Unit tests:

- `ArithmeticOrbitRefinement.pencil_n1` (computation): For n=1, the coefficient vector is (a,−b).
- `ArithmeticOrbitRefinement.pencil_n3_identity` (non-example): For n=3 and A=I₃,B=0, f=−x³; the sign is not positive.
- `ArithmeticOrbitRefinement.pencil_zero` (degenerate): For n≥1, A=B=0 gives the zero binary form.

Source: [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), §2, (1)–(2), pp.6–7; BSWII §3.1, (1), pp.7–8.

Prerequisites: `mathlib:Matrix.IsSymm`, `mathlib:Matrix.det`.

### Universal binary-form discriminant

Target `ArithmeticStatistics:ST.1/refinement-binary-discriminant`.

For degree n≥2 and n+1 coefficient slots over a commutative ring, define the integral universal discriminant polynomial Δₙ. On the chart f₀≠0 it is (−1)^{n(n−1)/2}Res(f(t,1),∂_t f(t,1))/f₀; divisibility by the universal leading coefficient is proved before specializing. Evaluation therefore remains valid when f₀=0. It agrees with the parent cubic and ST.0 quartic discriminants and with ring discriminants in the parametrizations.

Hypotheses and conventions: The homogeneous degree n is fixed even when the dehomogenized polynomial drops degree.

Construction or proof: Define the resultant in universal coefficient variables and prove its leading-coefficient divisibility over Z. Evaluate the quotient polynomial in the coefficient ring. Compare on a splitting algebra with f₀^{2n−2} times the squared product of root differences, then specialize polynomial identities.

Uses: BGW Theorem16 pp.6–7; BSW II Theorem3.5 p.11 and Theorem3.7 p.13; q-discriminant-divisibility. Nonzero discriminant supplies the étale algebra in the orbit dictionary. Integral specialization and the degree character are required for square divisibility, including forms with zero leading coefficient.

API:

- `ArithmeticOrbitRefinement.binaryDiscriminant`: Evaluate Δₙ in a vector of n+1 coefficients.
- `ArithmeticOrbitRefinement.binaryDiscriminant_map`: Coefficient ring maps commute with Δₙ.
- `ArithmeticOrbitRefinement.binaryDiscriminant_scale`: Δₙ(tf)=t^{2n−2}Δₙ(f).

Unit tests:

- `ArithmeticOrbitRefinement.discriminant_quadratic` (computation): For ax²+bxy+cy² the value is b²−4ac.
- `ArithmeticOrbitRefinement.discriminant_infinity` (non-example): For the cubic xy(x−y), with leading coefficient zero, Δ₃=1.
- `ArithmeticOrbitRefinement.discriminant_repeated` (degenerate): For n≥2, Δₙ(xⁿ)=0.

Source: [Quartic rings associated to binary quartic forms](https://arxiv.org/pdf/1007.5501v2), §2.1, p.3; BGW §2, pp.6–7.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-symmetric-pencil`, `ArithmeticStatistics:ST.1/discriminant-of-the-cubic-ring-of-a-form`, `ArithmeticStatistics:ST.0/invariants-height-and-eligible-pairs`, `mathlib:Matrix.det`, `mathlib:MvPolynomial.eval₂`.

### Common isotropic subspaces of a pencil

Target `ArithmeticStatistics:ST.1/refinement-common-isotropic`.

For a field K of characteristic not2, a pair of symmetric n×n matrices and r≥0, define F_r(K) as the set of K-submodules U⊂Kⁿ of dimension r on which both bilinear forms vanish identically. For n=2g+1 the distinguished r=g locus is a finite torsor for norm-one μ₂; for n=2g+2 the r=g locus is the K-point set of the smooth Fano variety F. The vector-space dimension is g; the projective planes have dimension g−1.

Hypotheses and conventions: Use full bilinear restriction, not merely a test on coordinate basis vectors.

Construction or proof: The native rational-point predicate is finite rank together with ∀u,v∈U, uᵀAv=uᵀBv=0. The geometric scheme is imported from a Grassmannian closed locus; the dimensions follow the regular-pencil theory.

Uses: BGW Theorem23 pp.12–13, Theorem28 pp.18–19 and Theorem29 p.20; pencil-fano-torsor. The bilinear vanishing condition defines the Fano points used for solubility; dimension and congruence compatibility identify the correct g-dimensional vector planes in even degree.

API:

- `ArithmeticOrbitRefinement.commonIsotropic`: Return the set of rank-r submodules with both bilinear restrictions zero.
- `ArithmeticOrbitRefinement.commonIsotropic_congr`: Congruence by an invertible matrix transports common isotropic subspaces by the inverse transpose.
- `ArithmeticOrbitRefinement.commonIsotropic_zero`: For the zero pencil the set consists of every dimension-r subspace.

Unit tests:

- `ArithmeticOrbitRefinement.isotropic_zero_line` (degenerate): Every line in K³ is common isotropic for (0,0).
- `ArithmeticOrbitRefinement.isotropic_positive` (non-example): For (I₃,0) over R there is no common isotropic line.
- `ArithmeticOrbitRefinement.isotropic_block` (characterisation): If the first g×g blocks of both matrices vanish, the span of the first g coordinate vectors is common isotropic.

Source: [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), §4, pp.12–13, before Theorem23.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-symmetric-pencil`, `mathlib:Submodule.span`, `mathlib:Module.finrank`, `mathlib:Matrix.toLin'`.

### Orders and distinguished ideals of a binary form

Target `ArithmeticStatistics:ST.1/refinement-binary-form-order`.

Let D be a Dedekind domain with fraction field K, n≥3, and f a binary n-ic form with f₀≠0 and Δ≠0. In L=K[t]/(f(t,1)), with θ the image of t, set ζ_i=Σ_{j=0}^{i−1}f_j θ^{i−j}. The D-lattice R_f=⟨1,ζ₁,…,ζ_{n−1}⟩ is a ring. For 0≤k≤n−1, I_f(k)=⟨1,θ,…,θᵏ,ζ_{k+1},…,ζ_{n−1}⟩ is an R_f-stable full lattice. Disc R_f=Δ(f), and f′(θ)^{-1}I_f(n−2) is its trace dual. L can be a product of fields; it is not assumed a domain.

Hypotheses and conventions: D is a Dedekind domain; char K≠2 for the consuming pencil theorem. The quotient has degree n and is separable.

Construction or proof: Construct the lattices as native D-submodules of the quotient algebra. Check their multiplication on the displayed generators. The triangular change from power coordinates establishes full rank, the discriminant equality and the trace-dual formula. Treat general ideals as lattices in a finite étale algebra, not FractionalIdeal D L with an invalid field assumption.

Uses: BGW Theorem16 p.7 and Proposition34 pp.26–28; integral-pencil-orbits and integral-soluble-pencils. The explicit order and fractional ideals encode nonmonic integral fibres. Their trace-dual identity turns ideal products into the two symmetric forms, and their generators implement the integral representative construction.

API:

- `ArithmeticOrbitRefinement.formOrder`: The D-subalgebra generated by 1 and ζ_i; its underlying module equals their D-span under the hypotheses.
- `ArithmeticOrbitRefinement.formIdeal`: Return the displayed D-span defining I_f(k).
- `ArithmeticOrbitRefinement.formIdeal_traceDual`: Under the trace pairing, the dual order is f′(θ)^{-1}I_f(n−2).

Unit tests:

- `ArithmeticOrbitRefinement.formOrder_monic` (compatibility): If f₀=1, R_f=D[θ].
- `ArithmeticOrbitRefinement.formIdeal_zero` (characterisation): I_f(0) is the D-module of R_f.
- `ArithmeticOrbitRefinement.formOrder_nonmonic` (non-example): For f=2x⁴−y⁴ over Z, R_f has basis 1,2θ,2θ²,2θ³ and does not contain θ, even though θ lies in its rational algebra.

Source: [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), §2, pp.6–7, before Theorem16.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-binary-discriminant`, `mathlib:Submodule.span`, `mathlib:Algebra.adjoin`, `mathlib:Algebra.trace`, `mathlib:AdjoinRoot.root`, `mathlib:IsFractionRing`, `mathlib:IsDedekindDomain`, `mathlib:LinearMap.mulLeft`.

### Oriented ideal data for integral pencils

Target `ArithmeticStatistics:ST.1/refinement-oriented-ideal-triples`.

For the preceding (D,K,L,f), an oriented orbit triple is (I,α,s), with I an R_f-stable full D-lattice in L, α∈L× and s∈K×, such that I²⊂αI_f(n−3), N(I)=sD and N(α)=s²f₀^{n−3}. Here N(I) is the determinant fractional D-lattice relative to the basis 1,ζ₁,…,ζ_{n−1}: span of determinants of coordinates of n vectors of I. Equivalence for SLₙ is (I,α,s)∼(cI,c²α,N(c)s). Retain s itself; replacing it with its principal ideal forgets orientation.

Hypotheses and conventions: n≥3; n=2 needs the negative-index ideal convention and is a recorded boundary refinement. L is finite étale over K and I is full finite projective.

Construction or proof: Use Submodule D L and the determinant line, with R_f stability expressed by multiplication. For free I, N(I)=sD chooses an oriented basis; over a Dedekind domain principal determinant gives freeness. Scalar multiplication changes the determinant by N(c), making the equivalence compatible with every constraint.

Uses: BGW Theorems16–17 pp.6–8; integral-pencil-orbits. The product inclusion constructs the pencil, while the determinant ideal and retained scalar give its orientation and invariant. Rescaling records exactly which triples yield the same integral orbit.

API:

- `ArithmeticOrbitRefinement.idealNorm`: D-span of coordinate determinants relative to an explicit K-basis of L.
- `ArithmeticOrbitRefinement.IsOrbitTriple`: The lattice stability, finite/full rank, product inclusion, norm-ideal equality and scalar norm identity hold.
- `ArithmeticOrbitRefinement.orbitTriple_rescale`: Multiplication by c∈L× sends the triple to cI,c²α,N(c)s and preserves its conditions.

Unit tests:

- `ArithmeticOrbitRefinement.triple_monic` (computation): For a monic f, the triple (R_f,1,1) satisfies the conditions.
- `ArithmeticOrbitRefinement.triple_orientation` (non-example): Both s and −s satisfy the same norm and ideal constraints; their identification requires an explicit norm-minus-one square root, rather than equality of the principal ideals.
- `ArithmeticOrbitRefinement.triple_zero_lattice` (degenerate): The zero lattice fails the full-rank condition and cannot have norm ideal sD with s≠0.

Source: [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem16 and its construction, pp.7–8.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-binary-form-order`, `mathlib:Algebra.norm`, `mathlib:Module.Basis`, `mathlib:Submodule.span`, `mathlib:LinearMap.mulLeft`, `mathlib:Module.Finite`.

### Integral symmetric-pencil orbit classification

Target `ArithmeticStatistics:ST.1/refinement-integral-pencil-orbits`.

For n≥3, Theorem16 identifies SLₙ(D)-orbits with the oriented ideal triples above, preserving f. The stabilizer is the norm-one 2-torsion units of End_{R_f}(I)⊂L. For even n≥4, SLₙ/μ₂(D) uses the additional relation (I,α,s)∼(MI,tα,t^{n/2}s) where tD=M². The latter stabilizer contains End_{R_f}(I)×[2]_{N=1}/D×[2], but need not equal it; the Pic(D)[2] and unit-square extensions must be retained.

Hypotheses and conventions: f₀ and Δ(f) are nonzero; char K≠2. The acting integral group is the group scheme’s D-points.

Construction or proof: Given a triple, extract the ζ_{n−1} and ζ_{n−2} coefficients of λμ/α on I_f(n−3); these define the two Gram matrices in a basis with determinant s. Conversely A^{-1}B gives θ’s action on the rational module; the integral polynomial ζ-actions preserve the lattice. Track bases and α to prove both composites. The Kummer exact sequence explains the M,t extension.

Acceptance: A product étale algebra and a noninvertible R_f-ideal remain allowed. The central quotient is not implemented as the naive quotient of integral SLₙ points.

Source: [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorems16–17, Remark18, pp.7–8.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-symmetric-pencil`, `ArithmeticStatistics:ST.1/refinement-oriented-ideal-triples`.

### Oriented norm pairs over a field

Target `ArithmeticStatistics:ST.1/refinement-oriented-norm-pairs`.

For a degree-n finite étale K-algebra L, n≥3 and f₀∈K×, define pairs (α,s)∈L××K× with N(α)=s²f₀^{n−3}. The SLₙ relation is (α,s)∼(c²α,N(c)s). For even n≥4 the central-quotient relation also allows t∈K× and sends the pair to (c²tα,N(c)t^{n/2}s). Both signs of s are retained until the relevant equivalence identifies them.

Hypotheses and conventions: Finite free étale algebra, not an arbitrarily large algebra on which a default norm has no intended meaning.

Construction or proof: Specialize the triple classification to a field, where all full lattices are the whole algebra after choosing a generator. Use the determinant norm, and verify both rescaling formulas directly.

Uses: BGW Corollaries19–20 pp.8–9, Theorem24 pp.14–16 and Theorem28 pp.18–19; field-pencil-stabilizers and pencil-existence. Passing to the fraction field replaces lattices by norm data; the retained sign of s controls the fibre over a squareclass and the norm-one two-torsion stabilizer.

API:

- `ArithmeticOrbitRefinement.NormPair`: α∈L× and s∈K× satisfying the norm equality, with n and f₀ parameters.
- `ArithmeticOrbitRefinement.NormPair.rescale`: Rescale by c∈L× as specified above.
- `ArithmeticOrbitRefinement.normPair_sign_iff`: The pairs (α,s) and (α,−s) are SLₙ-equivalent exactly when some c∈L× satisfies c²=1 and N(c)=−1.

Unit tests:

- `ArithmeticOrbitRefinement.normPair_unit` (computation): If f₀=1, the pair (1,1) satisfies the norm equation.
- `ArithmeticOrbitRefinement.normPair_negative_orientation` (non-example): In characteristic different from2 with f₀=1, (1,−1) satisfies the norm equation and its retained orientation differs from1; the constructor must not discard the sign.
- `ArithmeticOrbitRefinement.normPair_odd_split` (compatibility): In L=K³, c=(−1,1,1) has c²=1 and N(c)=−1, so the two unit orientations are SL₃-equivalent.

Source: [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Corollaries19–20, pp.8–9.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-oriented-ideal-triples`, `mathlib:Algebra.norm`.

### Field orbits and norm-one stabilizers

Target `ArithmeticStatistics:ST.1/refinement-field-pencil-stabilizers`.

For n≥3 and f₀Δ≠0, field SLₙ-orbits with invariant f are the oriented norm-pair classes. Their stabilizer group scheme is ker(N:Res_{L/K}μ₂→μ₂). Forgetting s maps to squareclasses with norm f₀^{n−3} modulo K×² (norm f₀ in even degree) one-to-one if f has an odd degree K-factor and two-to-one otherwise. For even n≥4 use the central-quotient pair relation; the stabilizer scheme is ker(N)/μ₂, with the analogous fibre criterion involving odd factorizations, including quadratic-conjugate factors.

Hypotheses and conventions: Field characteristic not2. Do not equate quotient-scheme K-points to the quotient of K-points.

Construction or proof: Corollaries19–20 give the orbit correspondence. A square-one unit changes the orientation by its norm. The root-factor description of such units and the central quotient supply the fibre criteria and scheme stabilizers.

Acceptance: The split even degree n fibre has geometric stabilizer order 2^{n−2}. Counting squareclasses alone can undercount oriented orbits by a factor of two.

Source: [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Corollaries19–20, pp.8–9; Proposition22, pp.11–12.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-oriented-norm-pairs`, `ArithmeticStatistics:ST.1/refinement-symmetric-pencil`.

## Solubility and integral representatives

Existence of a pencil, solubility of an existing pencil, and local solubility are different predicates. The generalized Picard torsor detects existence; the smooth Fano torsor detects solubility for the central quotient. The integral construction preserves a rational orbit and does not assert that every integral fibre has one orbit. A separate discriminant restriction gives local uniqueness and equality of stabilizer point groups.

### Existence of a rational pencil

Target `ArithmeticStatistics:ST.1/refinement-pencil-existence`.

For n=2g+2≥4, char K≠2 and f₀Δ≠0, the following eight conditions are equivalent: (a) a generic pencil with invariant f exists; (b) a regular augmented pencil with invariant fy² exists; (c) f₀∈K×²N(L×); (d) the degree-one generalized Picard torsor J_m¹ is 2-divisible in H¹(K,J_m); (e) the generalized Weierstrass class W_m[2] lifts under doubling from H¹(K,J_m[4]); (f) a two-cover F_m→J_m¹ of homogeneous spaces exists; (g) the maximal unramified abelian exponent-two cover of C minus its two points at infinity descends from Kˢ to K; (h) the maximal abelian exponent-two cover of C, ramified only at those two points, descends from Kˢ to K. Both covers have degree 2^{2g+1}. The smooth J¹ being 2-divisible alone does not replace these conditions. Theorem25 identifies their common obstruction in H²(K,J_m[2]), obtained from the connecting image of f₀ in K×/(K×²N(L×)).

Hypotheses and conventions: m is the two-point divisor above infinity, with its quadratic splitting field; generalized Jacobian data is retained.

Construction or proof: The norm criterion follows from oriented norm pairs. Augment the pencil by a hyperbolic plane to obtain the regular pencil of invariant fy² and its nodal Fano torsor. Compare the generalized Picard doubling obstruction with the norm class; Theorem25 identifies the common H² obstruction.

Acceptance: For a negative definite real even-degree f, L is a product of C and the negative leading coefficient is not a norm times a square; there is no rational pencil.

Source: [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorems24–25, pp.14–16.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-field-pencil-stabilizers`, `ArithmeticStatistics:ST.1/refinement-common-isotropic`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`.

### Fano torsors and soluble rational orbits

Target `ArithmeticStatistics:ST.1/refinement-pencil-fano-torsor`.

For an even generic pencil n=2g+2≥4, the Fano scheme of common g-dimensional vector subspaces is a torsor F under the smooth hyperelliptic Jacobian J. The four-component group J⊔F⊔J¹⊔F satisfies 2[F]=[J¹]. For SLₙ, solubility uses the augmented regular-pencil Fano variety F_m and gives J_m¹(K)/2J_m(K); for SLₙ/μ₂ it uses F and gives J¹(K)/2J(K). In both cases soluble orbits exist exactly when C has a K-rational divisor of odd degree. These are torsor coset sets unless a basepoint is chosen.

Hypotheses and conventions: f₀Δ≠0, characteristic not2; rational divisor, not merely a rational geometric divisor class.

Construction or proof: Use Theorem23’s Fano group law. The regular augmentation realizes generalized doubling. The x−T Kummer map associates oriented norm pairs to actual divisors; the Brauer obstruction must vanish to pass from a rational Picard class to a divisor. The two group actions give the two distinct coset sets.

Acceptance: Vector dimension g is not g+1. For the negative definite real genus-two example, J¹(R) can be nonempty while no odd rational divisor exists, so no soluble pencil exists.

Source: [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem23, pp.12–13; Theorems28–29, pp.18–20; Proposition21, pp.10–11.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-common-isotropic`, `ArithmeticStatistics:ST.1/refinement-pencil-existence`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`.

### Locally soluble pencils and the 2-Selmer set

Target `ArithmeticStatistics:ST.1/refinement-locally-soluble-pencil-orbits`.

Over a global field K of characteristic not2, n=2g+2≥4 and f₀Δ≠0, assume Div¹(C) has a point at every completion. Locally soluble SLₙ/μ₂(K)-orbits of invariant f correspond to Sel₂(J¹), the set of locally soluble two-covers of J¹. This set is nonempty exactly when W[2] lifts under doubling from Sel₄(J). When nonempty it is a finite torsor under Sel₂(J), not canonically the group Sel₂(J).

Hypotheses and conventions: Local solubility includes every archimedean and nonarchimedean place. F(K_v)≠∅ is the pencil’s local solubility condition.

Construction or proof: The norm/generalized-Picard existence criterion gives a rational orbit after the Selmer lift. Twisting by H¹(K,J[2]) changes its Fano torsor class. The obstruction is cup product with W[2]; local Kummer classes and the Hasse principle put Sel₂(J) in its kernel. Thus twisting gives the simply transitive Selmer action and identifies the two-cover set.

Acceptance: Choosing a soluble orbit identifies the torsor with Sel₂(J); changing that choice translates the identification. A rational orbit need not be locally soluble.

Source: [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorems14,30–31, pp.5,21–24.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-pencil-fano-torsor`, `ArithmeticStatistics:ST.1/refinement-field-pencil-stabilizers`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

### Integral representatives of locally soluble pencils

Target `ArithmeticStatistics:ST.1/refinement-integral-soluble-pencils`.

Let n=2g+2≥4 and f∈Z[x,y] have f₀Δ≠0 and locally soluble Div¹. If 2^{4i} divides f₀^{i−1}f_i for 1≤i≤n, every locally soluble rational SLₙ/μ₂ orbit of invariant f has an integral representative. In particular coefficients in 16Z suffice; this gives κ=4 for the invariant 16f in Theorem15. It asserts representatives of rational orbits, not uniqueness of integral orbits.

Hypotheses and conventions: The divisibility hypothesis uses integral binary coefficients and every local place.

Construction or proof: Apply the displayed coefficient condition at p=2 and the source’s explicit local ideals at all p. A local divisor of degree one supplies an ideal I with I²⊂αI_f(n−3) and the required norm. Patch the local lattices in L; since Z is a PID the determinant orientation becomes principal. Use the integral orbit classification.

Acceptance: If 16 divides each f_i, then 16^i divides f₀^{i−1}f_i. The general statement does not demand an integral representative at the unscaled invariant f.

Source: [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Theorem15, p.5; Proposition34 and its proof, pp.26–28.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-oriented-ideal-triples`, `ArithmeticStatistics:ST.1/refinement-locally-soluble-pencil-orbits`.

### Integral uniqueness at a good or simply ramified prime

Target `ArithmeticStatistics:ST.1/refinement-good-prime-integral-pencils`.

Let p be odd, f an integral binary form of even degree n≥4 over Z_p with f₀≠0 and p² not dividing Δ(f). If the curve z²=f has an actual degree-one rational divisor over Q_p, extension of scalars gives a bijection from all SL_n/μ₂(Z_p)-orbits with invariant f to the soluble SL_n/μ₂(Q_p)-orbits with invariant f. For each integral representative, its integral and rational stabilizer point groups are equal. This is a local uniqueness theorem under the discriminant restriction, unlike the unrestricted existence theorem.

Hypotheses and conventions: p odd, p²∤Δ(f), f₀≠0. Div¹(C)(Q_p) is nonempty, rather than only a degree-one Picard class.

Construction or proof: The discriminant restriction makes R_f maximal and the projective model regular. Proposition34 supplies integral representatives because powers of2 are units. Integral ideal-pair classes are the norm-one quotient of order units. Compare this group with J(Q_p)/2J(Q_p) through the connected Néron model. Norm-one two-torsion units are integral. In the n divisible by4 case, an additional quadratic splitting field is unramified, so the central quotient adds no nonintegral stabilizer.

Acceptance: Dropping p²∤Δ removes the asserted uniqueness. The equal stabilizers are point groups for the central quotient; no equality of integral group schemes is asserted.

Source: [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2), Proposition35 and proof, §9, p.29.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-integral-soluble-pencils`, `ArithmeticStatistics:ST.1/refinement-integral-pencil-orbits`, `ArithmeticStatistics:ST.1/refinement-field-pencil-stabilizers`.

## Weak divisibility and marked invariants

The Q polynomial measures the weak-divisibility lift on an integral zero-block slice. Its relative character gives an invariant absolute value only after an integral isotropic marking is retained. Odd degree permits forgetting a marking under an irreducibility hypothesis. Even degree needs a flag and a second polynomial q; pointwise division by a block determinant does not define q on the whole flag locus.

### Weak and strong square divisibility

Target `ArithmeticStatistics:ST.1/refinement-weak-discriminant-divisibility`.

For a prime p and integral fixed-degree coefficient vector f, p² strongly divides Δ(f) if p² divides Δ(f+p h) for every integral coefficient vector h. It weakly divides if p² divides Δ(f) and some h makes Δ(f+p h) indivisible by p². For a positive squarefree m, W_m^(2) imposes weak divisibility at every prime factor of m. For binary forms the p=2 weak locus is empty.

Hypotheses and conventions: Binary homogeneous discriminant with fixed degree n≥2. Monic specialization permits only monic-family perturbations where the source specifies that family.

Construction or proof: Define perturbations in the actual coefficient lattice. Reduce the discriminant polynomial modulo p²; for odd p, the source characterizes the weak locus by a unique simple double root over F_p. Use Δ≡0 or1 modulo4 for the binary p=2 convention.

Uses: BSW II Theorem3.7 p.13 and Proposition3.9 pp.15–16; weak-lift-odd and even-weak-lift. The universal perturbation test selects the weak locus for the lift and excludes strong divisibility. Its empty prime2 case determines the odd-modulus domain of the existence theorem.

API:

- `ArithmeticOrbitRefinement.StrongSquareDivides`: Every p-multiple coefficient perturbation still has discriminant divisible by p².
- `ArithmeticOrbitRefinement.WeakSquareDivides`: The original discriminant is divisible by p² and there is a perturbation violating divisibility.
- `ArithmeticOrbitRefinement.weak_strong_exclusive`: Weak and strong square divisibility cannot both hold.

Unit tests:

- `ArithmeticOrbitRefinement.weak_simple_double` (computation): For odd p, f=x³−x²y+p²y³ is weak: changing its constant coefficient by p makes the discriminant nonzero modulo p².
- `ArithmeticOrbitRefinement.strong_triple_root` (degenerate): For f=x³, every coefficient perturbation by a prime p has discriminant divisible by p².
- `ArithmeticOrbitRefinement.weak_two_empty` (non-example): No integral binary form has weak discriminant divisibility by4.

Source: [Squarefree values of polynomial discriminants II](https://www.math.uwaterloo.ca/~x46wang/Papers/Squarefree_2.pdf), Introduction p.3 and §3.4 p.12; BSW I §1 p.4.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-binary-discriminant`.

### The Q hyperdeterminant

Target `ArithmeticStatistics:ST.1/refinement-q-hyperdeterminant`.

For g≥1 and two g×(g+1) matrices U,V, remove column i from xU−yV and form the signed maximal minor (−1)^i det((xU−yV)_without_i), indexed from zero. Put their coefficients of x^{g−j}y^j into a (g+1)×(g+1) matrix and define Q(U,V) as its determinant. For a symmetric pair with upper-left g×g blocks zero, Q means this polynomial on the top-right blocks. It has degree g(g+1), is SL₂×SL_g×SL_{g+1}-invariant, and transforms under row and column changes with weights det(h)^{g+1}det(k)^g.

Hypotheses and conventions: Coefficient and minor order are fixed, so the sign is testable.

Construction or proof: Compute signed maximal minors in the universal polynomial ring, extract their coefficient matrix, and take its determinant. Row and column transformations give the determinant weights. Binary-variable changes have determinant weight g(g+1)/2 and hence disappear for SL₂.

Uses: BSW II §3.2 (4)–(5) pp.9–10, Theorem3.5 p.11 and Theorem3.7 p.13; marked-q. The determinant of the signed-minor coefficient matrix supplies Q, whose relative character proves marking independence and whose square divides the lifted discriminant.

API:

- `ArithmeticOrbitRefinement.qHyperdeterminant`: Return the signed-minor coefficient determinant.
- `ArithmeticOrbitRefinement.qHyperdeterminant_transform`: Q(hUkᵀ,hVkᵀ)=det(h)^{g+1}det(k)^gQ(U,V).
- `ArithmeticOrbitRefinement.qHyperdeterminant_scale`: Q(tU,tV)=t^{g(g+1)}Q(U,V).

Unit tests:

- `ArithmeticOrbitRefinement.q_g1` (computation): For g=1, U=(1,0),V=(0,1), Q=−1 with the stated descending coefficient order.
- `ArithmeticOrbitRefinement.q_g2` (computation): For U=[[1,0,0],[0,1,0]],V=[[0,1,0],[0,0,1]], Q=−1.
- `ArithmeticOrbitRefinement.q_zero` (degenerate): If g≥1 and U=V=0, Q=0.

Source: [Squarefree values of polynomial discriminants II](https://www.math.uwaterloo.ca/~x46wang/Papers/Squarefree_2.pdf), §3.2, (4)–(5), pp.9–10; BSWI (6), p.7.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-symmetric-pencil`, `mathlib:Matrix.det`.

### Square of Q divides the pencil discriminant

Target `ArithmeticStatistics:ST.1/refinement-q-discriminant-divisibility`.

On the universal integral coordinate ring of pairs of symmetric (2g+1)×(2g+1) matrices with zero upper-left g×g blocks, Q² divides Δ(f_A,B). Consequently every integral evaluation satisfies Q(A,B)² | Δ(f_A,B). This polynomial divisibility is stronger than a statement at one prime.

Hypotheses and conventions: g≥1; universal integral coordinates before evaluation.

Construction or proof: The Q polynomial is irreducible and primitive. A generic point of Q=0 can be put into the special minor normal form, which forces a double root of f. Perturbing a suitable entry gives a first-order Q zero but a second-order discriminant zero. This proves divisibility by Q twice over the fraction field; primitivity and Gauss’s lemma descend it to Z.

Acceptance: The g=1 polynomial identity is valid with arbitrary lower-right blocks. The stronger printed Gram-determinant assertion in Proposition3.6 is not used.

Source: [Squarefree values of polynomial discriminants II](https://www.math.uwaterloo.ca/~x46wang/Papers/Squarefree_2.pdf), Theorem3.5 and proof, pp.11–12.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-q-hyperdeterminant`, `ArithmeticStatistics:ST.1/refinement-binary-discriminant`.

### Q for a marked primitive isotropic lattice

Target `ArithmeticStatistics:ST.1/refinement-marked-q`.

For an integral symmetric pair (A,B) in odd dimension2g+1 with nonzero discriminant, mark a common rational g-plane U and its saturated lattice Λ=U∩Z^{2g+1}. Complete a Z-basis of Λ to a unimodular ambient basis and evaluate |Q| on the transformed top-right blocks. This is independent of the integral completion and is invariant on marked SL_{2g+1}(Z)-orbits. Forget Λ only when uniqueness of the common isotropic plane has been proved, e.g. for irreducible odd-degree f.

Hypotheses and conventions: The marking is a saturated lattice; arbitrary rational bases are not permitted.

Construction or proof: Primitivity permits unimodular completion. Any two completions differ by an integral parabolic matrix whose determinant on the first block is ±1; the Q character therefore preserves the absolute value. The odd irreducible invariant has trivial rational Jacobian two-torsion, giving uniqueness of the marked plane.

Uses: BSW II Proposition3.8 p.14 and Theorem3.7 p.13; weak-lift-odd orbit separation. An integral completion converts the rational isotropic plane to the zero-block slice. The parabolic character makes absolute Q independent of that completion, allowing distinct moduli to be separated after forgetting the marking.

API:

- `ArithmeticOrbitRefinement.markedQ`: Evaluate absolute Q after an explicitly adapted unimodular matrix; retain the marking as data.
- `ArithmeticOrbitRefinement.markedQ_independent`: Two unimodular completions of the same primitive isotropic lattice give equal absolute Q.
- `ArithmeticOrbitRefinement.markedQ_equivariant`: Integral determinant-one congruence and the transported marking preserve markedQ.

Unit tests:

- `ArithmeticOrbitRefinement.markedQ_standard` (computation): In dimension3, top blocks U=(1,0),V=(0,1) give markedQ=1 for the standard coordinate line.
- `ArithmeticOrbitRefinement.markedQ_parabolic` (compatibility): An integral parabolic completion with determinant−1 on its first block changes Q’s sign and leaves markedQ unchanged.
- `ArithmeticOrbitRefinement.markedQ_rational` (non-example): In dimension3 the rational determinant-one congruence diag(2,1,1/2) changes the preceding top blocks to (2,0),(0,1), giving |Q|=2. Rational adapted bases therefore do not define the integral marked invariant.

Source: [Squarefree values of polynomial discriminants II](https://www.math.uwaterloo.ca/~x46wang/Papers/Squarefree_2.pdf), §3.4, definition after Theorem3.7 and Proposition3.8, pp.13–14.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-q-hyperdeterminant`, `ArithmeticStatistics:ST.1/refinement-common-isotropic`, `mathlib:Matrix.toLin'`, `mathlib:Submodule.smithNormalForm`.

### Odd-degree lifts of weakly divisible forms

Target `ArithmeticStatistics:ST.1/refinement-weak-lift-odd`.

Let n=2g+1≥3 and m be an odd positive squarefree integer. There is a map σ_m:W_m^(2)→W₀(Z) with f_{σ_m(f)}=f and |Q|(σ_m(f))=m. On irreducible forms it induces an injection into integral SLₙ orbit classes; images for distinct m are disjoint. Extend an even-m domain only as the empty domain, rather than using division by2 in an integral formula.

Hypotheses and conventions: The weak binary discriminant locus and zero-block target use the conventions above.

Construction or proof: Choose an SL₂(Z) variable change giving coefficients (m²b₀,mb₁,b₂,…,b_n), with gcd(m,b₀)=1. Solve m|2rb₀+b₁, then choose the other entries recursively so the determinant coefficients match. Undo the variable change. The banded maximal-minor formula gives |Q|=m. The invariant recovers f; uniqueness of the marked plane gives injectivity and separation of different m.

Acceptance: For m=1 the lift has |Q|=1. No claim is made that every integral orbit of invariant f lies in the image.

Source: [Squarefree values of polynomial discriminants II](https://www.math.uwaterloo.ca/~x46wang/Papers/Squarefree_2.pdf), Theorem3.7 and Proposition3.8, pp.12–14.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-weak-discriminant-divisibility`, `ArithmeticStatistics:ST.1/refinement-q-hyperdeterminant`, `ArithmeticStatistics:ST.1/refinement-marked-q`.

### The split orthogonal one-matrix slice

Target `ArithmeticStatistics:ST.1/refinement-one-matrix-slice`.

Fix the split anti-diagonal A₀ of size n with entries1. The signed determinant f_{A₀,B}(x,1) is monic. Congruence by the existing split SO(A₀) preserves it, and top-block Q specializes to the BSWI Q-invariant. For odd n≥3 and Δ≠0 the stabilizer is the two-torsion of the Jacobian of y²=f_B(x); the curve has its rational point at infinity. BSWI weak-divisibility lifts occupy the specified half-integral lattice for odd n and quarter-integral lattice in the even-degree construction, rather than all integral symmetric matrices.

Hypotheses and conventions: The generic orthogonal group belongs to upstream OrthogonalSpinGroups; this node is an arithmetic slice comparison.

Construction or proof: Specialize the symmetric pencil at A₀. Its determinant is (−1)^{n(n−1)/2}, proving monicity. Match the top blocks and Q character with BSWI (6)–(8); the stabilizer follows the odd-degree finite étale factor description. Read the lattice restrictions in Theorems2.3–2.4 and3.3 before using the injection.

Acceptance: For every n, the invariant’s leading coefficient is1. Only irreducible-domain orbit injections are imported from BSWI.

Source: [Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3), §2.1–2.2, pp.6–10; §3.1–3.2, pp.15–17.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-symmetric-pencil`, `ArithmeticStatistics:ST.1/refinement-q-hyperdeterminant`, `ArithmeticStatistics:ST.1/refinement-field-pencil-stabilizers`.

### Even-degree lifts and the q invariant

Target `ArithmeticStatistics:ST.1/refinement-even-weak-lift`.

For n=2g+2≥4, odd positive squarefree m and f in the weak locus with gcd(m,f(0,1))=1, lift xf by the odd-degree σ_m into pairs of size n+1. On the flag-adapted locus W₁, the first(g+1)² block of A and first(g+2)² block of B vanish; B has one-dimensional kernel nonisotropic for A. The polynomial q is Q divided by the determinant of the top-right (g+1)×(g+1) block of B. For irreducible f and any primitive isotropic flag Λ⊂Λ′, |q|=m, independently of the flag; |Q| can be m or |f(0,1)|m. Thus the even lift retains a flag until this independence is proved.

Hypotheses and conventions: The generic condition gcd(m,f(0,1))=1 and Δ(f)≠0 are retained. q is a polynomial quotient on W₁, not pointwise division at a zero denominator.

Construction or proof: Use Δ(xf)=Δ(f)f(0,1)² to preserve weak divisibility. Define W₁ by the two zero blocks and nondegenerate kernel; show the block determinant divides Q universally. Two isotropic planes are reflections across the B-kernel with respect to A. Compare integral bases of their saturated flags to obtain the two Q values and common q value. In the even-constant-term basis use e_{n+1}, correcting the source’s recorded coordinate-index misprint.

Acceptance: Distinct m give disjoint SL_{n+1}(Z)-orbit images on this irreducible generic domain. No lift to W_n(Z) of the same form f is asserted in even degree.

Source: [Squarefree values of polynomial discriminants II](https://www.math.uwaterloo.ca/~x46wang/Papers/Squarefree_2.pdf), §3.5, (10),(12), Proposition3.9, pp.14–16.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-weak-lift-odd`, `ArithmeticStatistics:ST.1/refinement-marked-q`.

## Genus-one stabilizers with descent

Field-level degree2–5 models identify the geometry underlying Selmer parametrizations. Their full linear-group stabilizers contain theta groups and automorphisms of the Jacobian. Fixing invariants and the differential changes the acting group and hence the stabilizer. This geometric comparison is separate from integral minimization and from the local conditions in an average-Selmer theorem.

### Genus-one model stabilizer schemes in degrees2–5

Target `ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes`.

Over a field of characteristic different from2,3,5, the nondegenerate binary quartic, ternary cubic, pair of quaternary quadrics and quintuple of quinary alternating matrices give the degree d=2,3,4,5 line-bundle presentations of smooth genus-one curves. Their full linear-group stabilizers are extensions of Aut(Jac(C)) by the theta group Θ_{Jac(C),d}, which extends Jac(C)[d] by G_m. For rational-divisor formulations quotient the ineffective central scalars; the stabilizer becomes the corresponding extension by Jac(C)[d]. For fixed invariants and the differential-preserving degree2 PGL₂ action, recover the parent E[2] stabilizer with Galois action. These are different acting groups and must not be conflated. The acting groups are GL₂ twisted by det⁻² times the weight-two scalar G_m for degree2; GL₃ twisted by det⁻¹ times G_m for degree3; GL₂×GL₄ for degree4; and GL₅×GL₅ for degree5. The last two act naturally on 2⊗Sym²(4) and 5⊗∧²(5); their ineffective scalar kernel is (a,b) with ab²=1.

Hypotheses and conventions: The conservative common characteristic restriction is stronger than each degree2–4 source theorem and avoids the degree5 exceptional characteristic. Degree d line bundles and rational divisor classes are distinguished where the Brauer obstruction matters.

Construction or proof: Use the complete linear system of the degree-d line bundle for the geometric inverse. For d=3 this is the plane cubic; for d=4 the two-dimensional space of quadrics cuts out the curve; for d=5 the alternating presentation comes from its codimension-three resolution. Identify the automorphism group of the framed geometric data and then remove frames. Track the scalar kernel and differential to compare to the parent stabilizer. The group-scheme comparison and its native signatures remain supplier obligations recorded below.

Acceptance: For degree5 there are five alternating matrices, while the quintic-ring representation has four. The extension need not split, particularly at special j-invariants.

Source: [Coregular spaces and genus one curves](https://arxiv.org/pdf/1306.4424v1), Theorems4.1,4.5,4.11,4.14 and Remarks4.3,4.13,4.15, §§4.1–4.4, preprint pp.24–31.

Prerequisites: `ArithmeticStatistics:ST.1/refinement-symmetric-pencil`, `ArithmeticStatistics:ST.1/refinement-common-isotropic`, `ArithmeticStatistics:ST.1/ternary-cubic-forms-and-their-invariants`, `ArithmeticStatistics:ST.1/stabilizer-of-a-binary-quartic-is-two-torsion`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

## Supplier interfaces and exact input obligations

A signature that cannot yet name its mathematical carrier is not replaced by an arbitrary predicate. The suggested file contains every new definition, its named API and its three examples, together with the concrete coefficient theorems it can express. Its omission register identifies the missing parent and geometric interfaces needed for the remaining correspondence signatures. This is a distinction between a mathematical statement and a typed supplier interface, not a claim that the omitted theorem is proved.

The smooth suppliers are `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme` and `#layer-a-line-bundles-divisors-picard-group-degree`. They provide smooth degree-one Picard torsors, line bundles and rational-divisor comparison. The genus-one Selmer supplier is `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`. The integral ternary classification needed by the Wood inverse is requested from `GeometryOfNumbersAndQuadraticArithmetic:GN.2`. Each request specifies only the needed interface; generalized Jacobians and higher-genus Selmer torsors are not inferred from these smooth/genus-one suppliers.

### Nonétale rational quintic realization omitted in HCL IV

HCL IV p.84 explicitly omits the case-by-case realization of nonétale rank-five Q-algebras. Supply an exhaustive algebra classification and quadruple for each case before deducing existence for every degenerate quintic ring. Lemma15’s complete two-case prime reduction also needs a checked universal calculation; the outline states its input/output without claiming that verification complete.

Consumers: `ArithmeticStatistics:ST.1/refinement-integral-quintic-realization`.

### Symmetric-group closures and trace-dual comparison

The parent cubic étale carrier is not an S5-closure supplier. Need the rank120 rational S5-closure and the order20 subgroup’s rank6 fixed algebra, labelled trace maps, and the equivalence between the oriented trace-dual g construction and φ. No integral closure ring theorem is inferred from PolynomialGaloisGroups’ universal sextic polynomial. The native rational S4-closure/finite-Galois-set adapter and the parent invariant-order/content carriers must also be connected before the two quartic comparison signatures can be expressed. The zero-discriminant/infinite-content boundary of the quartic invariant-index statement needs an extended-index convention; this refinement states its finite nondegenerate form.

Consumers: `ArithmeticStatistics:ST.1/refinement-nondegenerate-resolvent-comparison`, `ArithmeticStatistics:ST.1/refinement-quartic-etale-resolvent`, `ArithmeticStatistics:ST.1/refinement-quartic-invariant-index`.

### Generalized Jacobians, Fano schemes and Selmer torsors

The exact requested smooth Picard/Jacobian and genus-one Selmer suppliers do not supply nodal J_m, its degree1 component, the regular augmented-pencil Fano scheme, exponent2 covers, the cup-product obstruction/Hasse principle, or higher-genus Sel₂(J¹). These inputs need owner assignment and typed supplier interfaces. The suggested file gives the concrete rational subspace predicate and coefficient/norm interfaces, and explicitly omits geometric correspondence signatures until those carriers exist. It does not replace them with arbitrary predicates. The local uniqueness proof also needs the connected Néron-model and norm-one-unit comparison at p²∤Δ.

Consumers: `ArithmeticStatistics:ST.1/refinement-pencil-existence`, `ArithmeticStatistics:ST.1/refinement-pencil-fano-torsor`, `ArithmeticStatistics:ST.1/refinement-locally-soluble-pencil-orbits`, `ArithmeticStatistics:ST.1/refinement-integral-soluble-pencils`, `ArithmeticStatistics:ST.1/refinement-good-prime-integral-pencils`.

### Group schemes and genus-one degree3–5 integral models

Need actual restriction-of-scalars μ₂, central quotient schemes and theta groups with Galois descent. Bhargava–Ho provides the geometric field-level orbit scope. Integral minimization and the local Selmer parametrizations used by the degree3,4,5 average theorems require their own source-qualified refinement, including invariant normalization and rational/integral orbit multiplicities. They are not proved by the geometric correspondence. Their absent signature types are listed in the suggested-file omission register.

Consumers: `ArithmeticStatistics:ST.1/refinement-integral-pencil-orbits`, `ArithmeticStatistics:ST.1/refinement-field-pencil-stabilizers`, `ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes`.

### Even q polynomial and negative-index boundary

The even lift is planned as an exact theorem on its domain, but the native polynomial q/flag construction and its API tests need the universal denominator cancellation checked rather than copied from a rendered matrix. The n=2 ideal parametrization requires I_f(−1); this pass uses n≥3 and does not silently truncate a negative exponent.

Consumers: `ArithmeticStatistics:ST.1/refinement-even-weak-lift`, `ArithmeticStatistics:ST.1/refinement-oriented-ideal-triples`.

### Current upstream orthogonal and integral-lattice adapters

Generic SO over fields of characteristic not2 is already owned by current TauCetiRoadmap/OrthogonalSpinGroups Layer0. Its layer postdates the atlas catalogue, so it is cited by exact source-file/layer in upstreamNotes and not fabricated as a pinned library declaration or recreated. Packaging needs the catalogue’s new layer id and its concrete API adapter. Current IntegralLattices owns the generic integral lattice theory, and native Submodule.smithNormalForm supplies diagonal bases over a PID. For saturated integral submodules its diagonal coefficients are units. The remaining adapter converts this basis completion into an oriented coefficient matrix and relates it to the isotropic marking; neither generic lattice theory nor Smith normal form is a new target here.

Consumers: `ArithmeticStatistics:ST.1/refinement-one-matrix-slice`, `ArithmeticStatistics:ST.1/refinement-integral-minor-fibres`, `ArithmeticStatistics:ST.1/refinement-marked-q`.

## Source conventions

The source locators below name the versions actually used. Preprint page numbers are not asserted to match the published pagination. The quartic ring tables use the parent correction k≠i for constant coefficients, the reviewed sign in 4det(Ax−By), and its fixed-ring interpretation of SL₂ fibres. The Wood comparison uses the monogenized-resolvent statement and its inverse, rather than the already recorded incorrect printed multiplication entries. The sextic comparison retains the factor16 before cubing.

For integral soluble pencils the coefficient16 consequence comes directly from BGW Proposition34 with κ=4, as in the recorded correction PAPER-BHARGAVA-GROSS-WANG-17/E4. The weak p=2 locus is empty, so nonempty weak-lift statements use odd m, consistent with PAPER-BHARGAVA-SHANKAR-WANG-25/E6. The even-constant-term basis uses the final coordinate as in the recorded correction E10. The Q² divisibility statement uses BSW II Theorem3.5; it does not import Proposition3.6's Gram-determinant assertion. These conventions identify the corrected mathematical inputs without reproducing source text.

The source list is organized by the objects it supports, not as a section-by-section synopsis. Public PDFs are identified by hashes and editions in the packet; no source text is included in the roadmap.

- Manjul Bhargava, [Higher composition laws III: The parametrization of quartic rings](https://annals.math.princeton.edu/wp-content/uploads/annals-v159-n3-p08.pdf). Annals of Mathematics 159 (2004), 1329–1360.
- Manjul Bhargava, [Higher composition laws IV: The parametrization of quintic rings](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n1-p02.pdf). Annals of Mathematics 167 (2008), 53–94.
- Melanie Matchett Wood, [Quartic rings associated to binary quartic forms](https://arxiv.org/pdf/1007.5501v2). arXiv:1007.5501v2, 31 March 2011, 15 pages.
- Manjul Bhargava, Benedict H. Gross, Xiaoheng Wang, [A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension](https://arxiv.org/pdf/1310.7692v2). arXiv:1310.7692v2, 24 February 2017, 42 pages.
- Manjul Bhargava, Arul Shankar, Xiaoheng Wang, [Squarefree values of polynomial discriminants I](https://arxiv.org/pdf/1611.09806v3). arXiv:1611.09806v3, 31 December 2021, 29 pages.
- Manjul Bhargava, Arul Shankar, Xiaoheng Wang, [Squarefree values of polynomial discriminants II](https://www.math.uwaterloo.ca/~x46wang/Papers/Squarefree_2.pdf). Author-hosted PDF dated 4 April 2025, retrieved 10 October 2026; printed page numbering; distinct hash from the published receipts in the extraction.
- Manjul Bhargava, Wei Ho, [Coregular spaces and genus one curves](https://arxiv.org/pdf/1306.4424v1). arXiv:1306.4424v1, 19 June 2013, 82 pages; published text not collated.
