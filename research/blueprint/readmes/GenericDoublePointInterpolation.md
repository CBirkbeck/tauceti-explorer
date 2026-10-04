# Generic double-point interpolation in characteristic zero

This roadmap supplies the first-jet interpolation theorem used by Jean-Marc Couveignes in *Enumerating number fields*. The target is a statement about an actual linear map, its nonempty generic locus, and integer choices of its parameters. For an algebraically closed field k of characteristic zero, r≥1, d≥5, n≥1 and n(r+1)≤choose(r+d,d), there is a nonempty Zariski-open set of ordered distinct points in (A^r_k)^n at which bounded-degree polynomials realize arbitrary values and first partial derivatives. The degree inequality is necessary; it is sufficient generically in this range. It is not sufficient at every distinct configuration.

The construction begins with the native Mathlib restricted-total-degree submodule. Its basis consists of bounded-total-degree monomials. Homogenization connects that concrete space to projective sections, and the quotient by a squared point ideal connects its first derivatives to a finite nonreduced scheme. Brambilla–Ottaviani’s residual/trace and differential Horace proofs then provide the generic projective rank, including the low-degree inputs their induction needs. An affine chart and a nonzero maximal minor make the locus and the integral specialization explicit.

The planning pass is complete in the sense of PROTOCOL0: all six layer contracts have declaration targets and their prerequisite chains end in checked library inputs, requested owner stages, or recorded gaps. Every layer is **planned**, none is **closed**, and every implementation status is **unchecked**. The geometric suppliers, native proof refinements and unbounded arithmetic scheduler remain open. The recoverable computational certificates are separate evidence, not proofs elaborated in Lean.

## Conventions and baseline

Write N(r,d)=choose(r+d,d) and A(r,d)={α:Fin r→₀N : Σα≤d}. Use V(k,r,d)=MvPolynomial.restrictTotalDegree (Fin r) k d, including d=0 and r=0 in algebraic helper statements. Geometric genericity always assumes k algebraically closed of characteristic zero. A polynomial first jet is its value and its **first** gradient; a double point discards all products of two infinitesimal directions. It therefore has length r+1, rather than the number of monomials of degree≤2. Its residue algebra contains nilpotents. Restriction to a reduced point forgets the gradient and has length1.

Affine supports are indexed by Fin n and a tuple is distinct when its map to k^r is injective. Matrix rows are Fin n×Option(Fin r), with None the value row and Some j the jth derivative row. Columns are A(r,d). The blocks are stacked vertically. There are n(r+1) rows and N(r,d) columns. In the projective argument r is the dimension, while the source writes n for that dimension and k for the number of supports; this reader uses q for a general projective count and n for the exported affine count.

The baseline is Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The library audit has no applicable GenericDoublePointInterpolation row. This is an absence of an audit entry, not an absence theorem about the libraries. The neighboring SF.0 and R09.1/R09.2 audit rows were checked before the plan. Native projective construction and scheme foundations are partly built; twisting-section and Hilbert-family interfaces are not supplied by the generic scheme carrier alone. The current supplier packets have no exact finer node for the needed projective O(d) or proper direction-limit API, so requests name their actual stage ids.

Actual statements were read in the pinned sources for the restricted submodule and basis, homogeneous submodule, algebra evaluation, partial derivations, trivial square-zero extension, CRT, matrix rank/range comparison, symmetric-power cardinality and exponent equivalence, prime-spectrum basic opens and box nonvanishing. Tau Ceti was searched as well as Mathlib for generic interpolation, Alexander–Hirschowitz and differential Horace. No matching endpoint was located in that search; the packet does not claim a machine-verified absence result. Polynomial.homogenize is an existing univariate-to-bivariate construction and does not supply the needed r-variable fixed-degree equivalence. Neither generic polynomial rings, derivations, CRT nor the box lemma is planned again here.

## Sources and ownership

The public source for the generic-rank proof is Maria Chiara Brambilla and Giorgio Ottaviani, [*On the Alexander-Hirschowitz Theorem*, arXiv:math/0701409v2](https://arxiv.org/pdf/math/0701409v2), dated10 September2007. Sections1–6, printed pp1–19, were read, including all cubic recursion, the numerical lemma, both cases of Theorem6.4 and the final quartic inputs. The historical/Waring discussion after the beginning of Section7 is outside this route. The affine application is Jean-Marc Couveignes, [*Enumerating number fields*, Annals192 (2020), 487–497](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf), Section3, pp491–493. URLs, dates, versions and PDF hashes are in the packet; the paper PDFs and extracted texts are not repository artifacts.

There is one scoped source finding: the r=7 base paragraph in BO5.3 says that its three ambient points lie in P⁵. The corrected ambient space is P⁷, which is the containing-form space throughout that case. The certificate here uses eight homogeneous coordinates. The finding concerns the arXiv v2 text actually read; it makes no assertion about an unread published version. The arXiv history and primary institutional listing were checked for a correction. The linked author-copy PDF returned403 and the publisher DOI was inaccessible. Those failed acquisition attempts are recorded beside the finding.

SchemeAndStackFoundations:SF.0 owns schemes, ideal sheaves, affine closed embeddings, restriction exactness and the generic scheme interfaces; its missing generic tangent/contact direction is proposed as a Part II, rather than replanned here. SF.5 supplies the plane-divisor/Bézout arguments. AlgebraicModuliForArithmeticGeometry:R09.1 owns projective space, twisting sheaves and homogeneous-form/global-section comparisons. R09.2 owns actual finite-flat/Hilbert incidence families, properness, base change and semicontinuity. This roadmap owns first jets, fat-point interpolation and the specific Veronese/Horace specialization. EffectiveBoundsCompactModels consumes the final result and proves nonzero pullback for its number-field parametrization. No existing link packet mentions the new id. The upstream AlgebraicCodingTheory and AnalyticToricGeometry readers were read for their native carrier, comparison, API and acceptance standards.

## Build order and acceptance

The order is coefficient geometry, squared ideals and jets, finite-scheme restriction and degeneration, cubic/plane bases, differential Horace and the affine open endpoint. Quartic finite witnesses are in GI.3; the dimension-by-dimension quartic induction is in GI.4, after the differential lemma it invokes. This prevents a backward stage dependency disguised as a proof outline. A parameterized induction-step lemma may assume a lower-dimensional assertion, but the global theorem must discharge that assumption in a well-founded induction.

The low-degree exceptions are quadrics with2≤q≤r and the four exceptional triples (r,d,q)=(2,4,5),(3,4,9),(4,3,7),(4,4,14). The exported d≥5 theorem encounters none of them directly, but its predecessor proofs can encounter them unless the scheduler checks its exact integer division data. The plane branch is independent and handles the d=6 ceiling case that would otherwise refer to the exceptional plane quartic. The cubic r=4 inputs use q6 andq8 only. The quartic r=5 base is a126×126 full-rank witness because its ordinary induction would invoke the exceptional r=4 quartic q14.

Acceptance requires both the mathematical boundary cases and the native interfaces. One affine point in degree1 is well poised; one point in degree0 for r≥1 is not. In one variable, every distinct tuple has the expected Hermite rank in every characteristic by CRT, although the geometric AH export stays in characteristic zero. Seven points(i,0),0≤i≤6, in A² and degree5 have rank11, despite having21 rows and21 columns. The values/tangential derivatives factor through six univariate coefficients, and the normal derivatives through five more. Thus the source’s generic hypothesis is essential.

The whole suggested file elaborates against the existing pinned Mathlib build. Its proposed definitions, lemmas and examples are admitted; the compilation receipt certifies interface elaboration only. The precise source hash, Lean revision, resource limits, warning and example counts are preserved in the handoff. The geometric omissions are listed node by node. In particular no invented proposition carrier stands in for an ideal sheaf, a twisting-section module, a proper incidence family or a flat limit.

## GI.0 — Bounded forms and coefficient geometry
Reuse the native restricted monomial basis of MvPolynomial.restrictTotalDegree. Count its finite index set as choose(r+d,d); construct fixed-degree homogenization to the native homogeneous submodule, its H⁰(P^r,O(d)) comparison, coefficient lattice and the positive coefficient Gram form whose coordinate map is an isometry for the transported Euclidean metric.
A(r,d) uses total degree, so in two variables at d=2 it has six entries, not nine. The slack exponent d−Σα gives a degree-d tuple in r+1 variables. Native Sym.equivNatSum and its built cardinality theorem already handle the multiset part. The only new counting adapter removes or restores that slack coordinate. Coefficient coordinates come from the existing restricted-support basis, rather than from a second module of polynomials.

Fixed-degree homogenization is linear. It is not multiplicative into a single fixed-degree space: the product of degree-d and degree-e outputs belongs in degree d+e. Its projective comparison uses a genuine O(d) section module and the X₀≠0 trivialization supplied by R09.1. The coefficient metric is over the real numbers. Its Gram form is positive definite because a nonzero polynomial has a nonzero coefficient. A norm/isometry statement needs an explicitly transported Euclidean structure; there is no automatic norm on the ambient multivariate polynomial ring.
Dependencies: AlgebraicModuliForArithmeticGeometry:R09.1.

### Binomial count of bounded monomials
Declaration GenericDoublePointInterpolation:GI.0/monomial-count (lemma). For r,d≥0, the finite set A(r,d)={α:Fin r→₀N | Σα≤d} has cardinality N(r,d)=choose(r+d,d).
Proof or construction:

1. Append a slack exponent d−Σα, obtaining degree-d exponent tuples on Option(Fin r).
2. Apply native Sym.equivNatSum to identify the degree-d exponent tuples with size-d multisets on r+1 symbols; deleting the slack coordinate is the inverse.
3. Apply the built stars-and-bars cardinality theorem. Only the bounded slack-coordinate adapter remains a refinement; the exponent/multiset equivalence itself is already built.

Inputs: mathlib:Sym.card_sym_eq_choose, mathlib:Sym.equivNatSum. Source: BO, §1 dimension convention; COU §3 p491.

### Dimension of bounded polynomials
Declaration GenericDoublePointInterpolation:GI.0/bounded-finrank (lemma). For any field k and r,d≥0, finrank_k(MvPolynomial.restrictTotalDegree (Fin r) k d)=N(r,d).
Proof or construction:

1. Use the actual restricted-support basis with the admissible exponent index.
2. Equip the finite index with its finite type instance; transport the basis representation to ordinary coefficient functions.
3. Compute dimension from basis cardinality and monomial-count. No second bounded-polynomial carrier is introduced.

Inputs: mathlib:MvPolynomial.restrictTotalDegree, mathlib:MvPolynomial.basisRestrictSupport, GenericDoublePointInterpolation:GI.0/monomial-count. Source: BO, COU §3 p491.

### Coefficient coordinates
Declaration GenericDoublePointInterpolation:GI.0/coefficient-coordinates (construction). For a commutative ring R, identify the native bounded submodule V(R,r,d) with functions A(r,d)→R by a linear equivalence c_d; its α-coordinate is the actual MvPolynomial coefficient.
Proof or construction:

1. Use basisRestrictSupport.repr on the existing submodule.
2. Since A(r,d) is finite, identify supported functions with coefficient tuples.
3. The inverse sums the restricted monomials; extensionality follows from coefficient extensionality.

Inputs: mathlib:MvPolynomial.basisRestrictSupport, mathlib:MvPolynomial.restrictTotalDegree, GenericDoublePointInterpolation:GI.0/monomial-count. Source: COU, COU §3 pp491,493.

API:

- coefficientCoordinates_apply (projection): c_d(f)(α)=coeff_α(f).
- coefficientCoordinates_symm (constructor): c_d⁻¹(a)=Σ_{α∈A(r,d)}a_α X^α.
- coefficientCoordinates_ext (extensionality): f=g iff c_d(f)=c_d(g).

Unit tests:

- six_not_nine: For r=2,d=2 the coordinates are 1,x,y,x²,xy,y², six in all.
- constants: For d=0 there is one coordinate and c_0(C a)=a.
- native_coefficient: For r=1,d=3 and f=2+3x², coordinates are (2,0,3,0).

Uses: COU §3 p493 — Defines the integral coefficient lattice and its Euclidean covolume.; GI.1 first-jet matrix — Supplies the column basis with no change of polynomial carrier..

Atlas planet: Bounded coefficient space.

### Fixed-degree homogenization
Declaration GenericDoublePointInterpolation:GI.0/fixed-homogenization (construction). For a commutative ring R, fixedHomogenization_d is a linear equivalence V(R,r,d)≃ homogeneousSubmodule (Option(Fin r)) R d. It sends X^α to X₀^(d−Σα)∏X_j^α_j; inverse evaluation sets X₀=1.
Proof or construction:

1. Map the restricted monomial basis to degree-d monomials by the slack-coordinate bijection.
2. Define dehomogenization using native algebra evaluation X₀↦1 and X_j↦X_j.
3. Check both composites on their native bases. This is a linear equivalence at fixed d, not an algebra equivalence.

Inputs: GenericDoublePointInterpolation:GI.0/coefficient-coordinates, mathlib:MvPolynomial.homogeneousSubmodule, mathlib:MvPolynomial.aeval. Source: COU, COU §3 p491.

API:

- fixedHomogenization_monomial (simp): X^α maps to X₀^(d−Σα)X^α.
- fixedHomogenization_dehomogenize (equivalence): Setting X₀=1 is the inverse on degree-d homogeneous forms.
- fixedHomogenization_mul (compatibility): H_{d+e}(fg)=H_d(f)H_e(g), for f∈V_d and g∈V_e; targets have different degrees.

Unit tests:

- homogenize_quadratic: At d=2, 1+x maps to X₀²+X₀X₁, not 1+X₁.
- homogenize_constant: At d=0 constants remain constants.
- dehomogenize_native: The monomial X₀X₁ in degree2 dehomogenizes to x in the native degree≤2 submodule.

Uses: COU §3 p491 — Converts projective sections to affine bounded polynomials.; GI.5 affine chart — Identifies the generic projective jet rank with the affine matrix rank..

Atlas planet: Fixed-degree homogenization.

### Homogeneous forms and twisting sections
Declaration GenericDoublePointInterpolation:GI.0/sections-comparison (comparison). For algebraically closed k and d≥0, the fixed-homogenization equivalence followed by the supplier homogeneous-form/section equivalence identifies V(k,r,d) with H⁰(P^r_k,O(d)), compatibly with restriction to the chart X₀≠0.
Proof or construction:

1. Import the genuine projective space scheme, its O(d) and its native global-section module.
2. Compose the supplier equivalence with fixedHomogenization.
3. Check the affine-chart restriction on monomials, including the O(d) trivialization. Exact native supplier signatures are absent, not encoded by proxy types.

Inputs: GenericDoublePointInterpolation:GI.0/fixed-homogenization, AlgebraicModuliForArithmeticGeometry:R09.1. Source: COU, COU §3 p491.

### Coefficient Gram form
Declaration GenericDoublePointInterpolation:GI.0/coefficient-gram (construction). Over ℝ, the bounded real polynomial space has positive definite bilinear form G(f,g)=Σ_{α∈A(r,d)}coeff_α(f)coeff_α(g). Transporting the Euclidean structure along c_d makes the monomials orthonormal; the integral lattice consists exactly of integral coordinate tuples.
Proof or construction:

1. Pull back the standard finite-coordinate real inner product along c_d.
2. Strict positivity follows because a nonzero polynomial has a nonzero coordinate; this requires real order, not arbitrary fields.
3. Transport the norm/inner-product structures explicitly and identify the Z-coefficient submodule. Do not infer an ambient polynomial-ring norm instance.

Inputs: GenericDoublePointInterpolation:GI.0/coefficient-coordinates. Source: COU, COU §3 p493.

API:

- coefficientGram_apply (projection): G(f,g)=Σ coeff_α(f)coeff_α(g).
- coefficientGram_positive (structure): For real f≠0, G(f,f)>0.
- coefficientCoordinates_isometry (compatibility): For the transported Euclidean norm, c_d is an isometry and the integral coordinates are Z^A(r,d).

Unit tests:

- orthonormal_xy: For r=2,d=2, G(x,y)=0 and G(x,x)=1.
- gram_constants: At d=0, G(C a,C b)=ab.
- integral_coordinates: The native polynomial 2+x has integral coordinates and squared norm5.

Uses: COU §3 p493 — Provides the coefficient metric for short integral relations.; EffectiveBoundsCompactModels — Supplies the exact coefficient lattice rather than a point-evaluation metric..

Atlas planet: Coefficient Euclidean metric.

Layer acceptance requires every stated target above, the displayed API/tests, and the following remaining proof/interface refinements. Coverage is planned.

- Native affine ideal and dimension API closure: The restricted submodule, basis, derivatives, square-zero algebra and CRT statements were read at the pins. Exact bounded slack-coordinate adapter to the built Sym.equivNatSum equivalence, translated constant/linear/remainder expansion, coprime-power/infimum identities, quotient algebra linearity and range-dimension lemmas still need native proof closure and exact declaration lookup. No duplicate baseline theory is planned.
- Projective section and finite-scheme interfaces: R09.1 and SF.0 describe the required directions, but their current packets do not expose the exact projective O(d), finite twisting-section and restriction-square signatures. Suggested Lean omits these geometry nodes instead of inventing opaque carriers.
- Coefficient metric transport: The native positive coefficient bilinear form is prototyped. A conflict-free transported NormedAddCommGroup/InnerProductSpace and the explicit integral-coordinate subgroup interface are still absent; no ambient MvPolynomial metric is assumed.

## GI.1 — Double points and first jets
Use squared point ideals and the existing square-zero extension and Chinese remainder theorem to compare the affine double-point quotient with n copies of k⊕k^r. Prove its length n(r+1), identify projective restriction with the bounded-polynomial first-jet linear map, and expose values, derivatives on the value kernel, the vertically stacked monomial matrix and its surjectivity/rank criterion.
The one-point algebra comparison uses the built trivial square-zero extension k⊕k^r. Translation by the support gives a constant-plus-linear expansion modulo the square of the evaluation ideal. This proof involves no division by factorials and holds for all fields. Pairwise distinctness supplies comaximality and the native CRT product. The square of the union ideal agrees with the intersection of the point-ideal squares only after that hypothesis; a repeated tuple must not be assigned length n(r+1).

The restriction target is represented in the suggested file by Option-indexed coordinates. Values and gradients are separate projections. The derivative map takes the actual kernel of the value map, which matters for the compact-model application. Its lifting criterion proves that full jets are onto exactly when values and derivatives-on-the-value-kernel are both onto. A full matrix rank predicate alone does not expose this API. The projective comparison verifies the restriction square on native monomials and retains the O(d) trivialization.
Dependencies: GenericDoublePointInterpolation:GI.0, SchemeAndStackFoundations:SF.0, AlgebraicModuliForArithmeticGeometry:R09.1.

### First-jet algebra evaluation
Declaration GenericDoublePointInterpolation:GI.1/jet-algebra (construction). For any commutative ring k and P∈k^r, jetAlgebra_P:k[x₁,…,x_r]→ₐ[k]TrivSqZeroExt k (Fin r→k) sends X_j to (P_j,e_j). Its value part is f(P) and its square-zero part is (∂_j f(P))_j.
Proof or construction:

1. Use the existing aeval universal property with X_j↦inl(P_j)+inr(e_j).
2. Expand monomials in the square-zero extension; products containing two infinitesimals vanish.
3. Compare the resulting coefficient α_jP^(α−e_j) with the native derivative formula, with no factorial division.

Inputs: mathlib:MvPolynomial.aeval, mathlib:MvPolynomial.aeval_monomial, mathlib:MvPolynomial.pderiv_monomial, mathlib:TrivSqZeroExt. Source: COU, COU §3 p491; BO §2.

API:

- jetAlgebra_fst (projection): fst(jetAlgebra_P(f))=eval P f.
- jetAlgebra_snd (projection): snd(jetAlgebra_P(f))(j)=eval P(pderiv j f).
- jetAlgebra_X (simp): jetAlgebra_P(X_j)=(P_j,e_j).

Unit tests:

- jet_variable: At the origin, jetAlgebra(X₁)=(0,e₁), not zero.
- jet_constant: jetAlgebra(C a)=(a,0).
- jet_square: At the origin, X₁² maps to zero in the native square-zero extension; an order-two jet retaining quadratics would fail.

Uses: GI.1 double-point quotient — Identifies the actual squared maximal ideal kernel.; COU §3 p491 — Explains why values and first derivatives describe restriction to 2P..

Atlas planet: First-jet algebra.

### Kernel of one first jet
Declaration GenericDoublePointInterpolation:GI.1/jet-kernel (lemma). For a field k and P∈k^r, jetAlgebra_P is surjective and its kernel is (ker(eval P))². This assertion holds in every characteristic.
Proof or construction:

1. Translate variables to X_j−P_j. Constants and translated variables hit the scalar and each infinitesimal coordinate, proving surjectivity.
2. Write each polynomial as its constant and linear terms plus a sum of monomials of degree≥2 in translated variables.
3. The remainder lies in the square of the evaluation ideal. Conversely every product of two vanishing functions has zero value and gradient by Leibniz. The translated expansion needs a declaration-sized refinement.

Inputs: GenericDoublePointInterpolation:GI.1/jet-algebra, mathlib:MvPolynomial.eval, mathlib:TrivSqZeroExt.inr_mul_inr. Source: BO, COU §3 p491; BO §2 Prop2.1.

### Distinct point ideals and their powers
Declaration GenericDoublePointInterpolation:GI.1/point-comaximal (lemma). For a field k and distinct P,Q∈k^r, the evaluation ideals m_P,m_Q and their squares are comaximal.
Proof or construction:

1. Choose a coordinate j with P_j≠Q_j; the difference between X_j−P_j and X_j−Q_j is a nonzero scalar.
2. Scale that scalar to exhibit 1 in m_P+m_Q.
3. Use the power-of-comaximal-ideals identity for the squares; its exact pinned generic lemma is still to be located, as recorded in the affine ideal gap.

Inputs: mathlib:MvPolynomial.eval, GenericDoublePointInterpolation:GI.1/jet-kernel. Source: BO, COU §3 p491.

### Squared union ideal
Declaration GenericDoublePointInterpolation:GI.1/double-ideal (construction). For a finite ordered tuple P:Fin n→k^r over a field, doubleIdeal(P)=(⋂_i m_{P_i})². Under Injective P this equals ⋂_i m_{P_i}²; Spec(k[x]/doubleIdeal(P)) is the affine double-point scheme.
Proof or construction:

1. Form the actual infimum of native evaluation ideals and square it.
2. For injective tuples use finite comaximality to identify infima and products before squaring.
3. Attach the native affine quotient scheme via SF.0; repeat points are allowed by the carrier but not the length/product theorem.

Inputs: mathlib:MvPolynomial.eval, GenericDoublePointInterpolation:GI.1/point-comaximal. Source: COU, COU §3 p491.

API:

- doubleIdeal_def (characterisation): doubleIdeal(P)=(⋂ ker(eval P_i))².
- doubleIdeal_distinct (compatibility): If P is injective, doubleIdeal(P)=⋂ (ker(eval P_i))².
- doubleIdeal_reindex (functoriality): Permuting the finite tuple leaves doubleIdeal unchanged.

Unit tests:

- double_origin: For r=1,n=1,P=0, the ideal is (x²), not (x).
- empty_double: For n=0 the ideal is top and the quotient has dimension0.
- double_vs_triple: For r=1,P=0, x² is zero modulo doubleIdeal, but is nonzero modulo (x³).

Uses: COU §3 p491 — Defines 2P from the squared ideal sheaf.; GI.1 length and projective comparison — Retains nilpotents and supports the restriction map..

Atlas planet: Double-point scheme.

### Double-point quotient comparison
Declaration GenericDoublePointInterpolation:GI.1/double-quotient (construction). For a field k and injective P:Fin n→k^r, k[x]/doubleIdeal(P)≃ₐ[k]Π_i TrivSqZeroExt k(k^r), with the class of f mapped to (jetAlgebra_{P_i}(f))_i.
Proof or construction:

1. Use the existing CRT for the pairwise comaximal squared evaluation ideals.
2. For each factor use the first isomorphism theorem and the kernel/surjectivity computation.
3. Check scalar compatibility to upgrade the ring equivalence to an algebra equivalence. This comparison preserves infinitesimal multiplication.

Inputs: GenericDoublePointInterpolation:GI.1/double-ideal, GenericDoublePointInterpolation:GI.1/jet-kernel, GenericDoublePointInterpolation:GI.1/point-comaximal, mathlib:Ideal.quotientInfRingEquivPiQuotient. Source: COU, COU §3 p491.

API:

- doubleQuotient_mk (projection): The class of f maps to its tuple of native first jets.
- doubleQuotient_mul (compatibility): Multiplication is the native square-zero multiplication in each factor.
- doubleQuotient_reindex (functoriality): A tuple permutation commutes with the induced product-factor permutation.

Unit tests:

- one_point_length: For r=2,n=1 the quotient has basis1,x−P₁,y−P₂ and dimension3.
- empty_quotient: For n=0 both sides are the zero-dimensional empty product algebra.
- nonreduced_product: For r=1,P=(0,1), the class of x(x−1) is nonzero, but its square is zero; the reduced quotient would kill the class.

Uses: COU §3 p491 — Proves length n(r+1).; GI.1 well-poised comparison — Identifies the scheme restriction target with values and gradients..

Atlas planet: Double-point quotient comparison.

### Length of distinct double points
Declaration GenericDoublePointInterpolation:GI.1/double-length (lemma). For a field k, injective P:Fin n→k^r gives finrank_k(k[x]/doubleIdeal(P))=n(r+1); the projective double-point scheme on the affine chart has the same length.
Proof or construction:

1. Compute each square-zero factor as k×k^r, of dimension r+1.
2. Sum dimensions in the finite product and transfer along the algebra equivalence.
3. Use the supplier length/affine-chart comparison for the geometric statement. Repeated points do not give n(r+1).

Inputs: GenericDoublePointInterpolation:GI.1/double-quotient, SchemeAndStackFoundations:SF.0. Source: COU, COU §3 p491.

### Bounded first-jet evaluation
Declaration GenericDoublePointInterpolation:GI.1/first-jet-map (construction). For a field k, define J_{P,d}:V(k,r,d)→ₗ[k](Fin n→Option(Fin r)→k) by J(f)_i(None)=f(P_i) and J(f)_i(Some j)=∂_j f(P_i). The row index contains n(r+1) entries.
Proof or construction:

1. Restrict the scalar and infinitesimal projections of each first-jet algebra map to the bounded submodule.
2. Assemble the linear maps using the Option-indexed product, with None first.
3. Expose monomial entries from native evaluation and pderiv. Algebraicity of the full jet map does not make its degree-bounded restriction an algebra homomorphism.

Inputs: GenericDoublePointInterpolation:GI.1/jet-algebra, mathlib:MvPolynomial.restrictTotalDegree, mathlib:MvPolynomial.pderiv. Source: COU, COU §3 p491.

API:

- firstJetMap_value (projection): J(f)_i(None)=eval P_i f.
- firstJetMap_partial (projection): J(f)_i(Some j)=eval P_i(pderiv j f).
- firstJetMap_monomial (simp): The α column is P_i^α in the value row and α_jP_i^(α−e_j) in derivative row j; zero exponent gives zero.

Unit tests:

- linear_origin_jets: For one point0 in A² and d=1, 1,x,y give the identity3×3 matrix.
- constant_jets: At d=0 gradients vanish; for r≥1,n=1 the map is not onto.
- native_derivative: For f=x² at P=3 in A¹, J(f)=(9,6), using native pderiv.

Uses: COU §3 p491 — Concrete endpoint of well-poisedness.; EffectiveBoundsCompactModels — Combines ordinary embeddings with derivative constraints..

Atlas planet: First-jet evaluation.

### Value projection
Declaration GenericDoublePointInterpolation:GI.1/value-map (construction). For a field k, valueMap_{P,d}:V(k,r,d)→ₗ[k](Fin n→k) is evaluation at P; it is the None-row projection of J.
Proof or construction:

1. Compose J with the finite product value projection.
2. Check agreement with eval on the bounded submodule.
3. Its kernel consists of bounded polynomials vanishing at all points, the exact source for derivativeOnKernel.

Inputs: GenericDoublePointInterpolation:GI.1/first-jet-map. Source: COU, COU §3 p491.

API:

- valueMap_apply (projection): valueMap(f)(i)=eval P_i f.
- valueMap_eq_jetProjection (compatibility): valueMap is the None-row projection of J.
- mem_valueKernel (characterisation): f∈ker(valueMap) iff every f(P_i)=0.

Unit tests:

- values_linear: At points0,1 in A¹, valueMap(x)=(0,1).
- empty_values: For n=0 the codomain is the zero module and the kernel is all V_d.
- values_not_gradients: At one point0, x has value0 but nonzero first derivative.

Uses: COU §3 p491 — Separates values from derivative conditions.; GI.1 derivative-on-kernel — Gives the native kernel submodule..

### Derivatives of vanishing polynomials
Declaration GenericDoublePointInterpolation:GI.1/derivative-on-kernel (construction). For a field k, derivativeOnKernel_{P,d}:ker(valueMap_{P,d})→ₗ[k](Fin n→Fin r→k) evaluates native partial derivatives.
Proof or construction:

1. Restrict the Some-row projection of J to the actual value kernel.
2. Derive coordinate and reindex formulas from the native first-jet map.
3. When values are onto, full jets are onto iff this restricted derivative map is onto; the implication is a separate lemma.

Inputs: GenericDoublePointInterpolation:GI.1/value-map, GenericDoublePointInterpolation:GI.1/first-jet-map. Source: COU, COU §3 p491.

API:

- derivativeOnKernel_apply (projection): The (i,j) coordinate is ∂_j f(P_i).
- derivativeOnKernel_eq_jet (compatibility): It equals the Some-row projection of J on ker(valueMap).
- derivativeOnKernel_reindex (functoriality): Permuting points permutes the derivative target coordinates.

Unit tests:

- simple_zero_derivative: At P=0,d=1,r=1, x lies in the value kernel and maps to1.
- constant_kernel: For one point and d=0, the value kernel is zero.
- square_zero_gradient: At P=0,d=2, x² is a nonzero element of the value kernel with zero derivative.

Uses: COU §3 p491 — Detects independent derivative conditions after imposing values.; GI.1 kernel rank decomposition — Provides a usable linear map rather than only a rank predicate..

### Surjectivity through the value kernel
Declaration GenericDoublePointInterpolation:GI.1/jet-kernel-split (lemma). For any field k and tuple P, J_{P,d} is onto iff valueMap_{P,d} is onto and derivativeOnKernel_{P,d} is onto.
Proof or construction:

1. If J is onto, lift arbitrary value tuples with zero gradient and arbitrary gradients with zero values.
2. Conversely lift desired values first; compute the remaining gradient discrepancy.
3. Lift that discrepancy from the value kernel and add it. This is an actual lifting argument, not a mere dimension equality.

Inputs: GenericDoublePointInterpolation:GI.1/first-jet-map, GenericDoublePointInterpolation:GI.1/value-map, GenericDoublePointInterpolation:GI.1/derivative-on-kernel. Source: COU, COU §3 p491.

### Monomial first-jet matrix
Declaration GenericDoublePointInterpolation:GI.1/jet-matrix (construction). For a field k, firstJetMatrix(P,d) has rows Fin n×Option(Fin r) and columns A(r,d), entry P_i^α for None and α_jP_i^(α−e_j) for Some j. Its linear map in coefficient coordinates is J.
Proof or construction:

1. Evaluate each native restricted monomial basis vector with J.
2. Use the Option-index to stack the r+1 blocks vertically, producing n(r+1) rows.
3. Compare matrix multiplication with coefficient summation; expose this as the basis representation equality.

Inputs: GenericDoublePointInterpolation:GI.0/coefficient-coordinates, GenericDoublePointInterpolation:GI.1/first-jet-map, mathlib:MvPolynomial.eval_monomial, mathlib:MvPolynomial.pderiv_monomial. Source: COU, COU §3 p491.

API:

- firstJetMatrix_value (projection): The None row at α equals P_i^α.
- firstJetMatrix_partial (projection): The Some j row equals α_jP_i^(α−e_j), with zero when α_j=0.
- firstJetMatrix_mulVec (compatibility): firstJetMatrix(P,d)·c_d(f)=J_{P,d}(f).

Unit tests:

- matrix_linear_origin: For r=1,n=1,d=1,P=0, columns1,x give the identity2×2 matrix.
- matrix_constants: For d=0 the single column has value1 and every derivative entry0.
- matrix_shape: For r=2,n=2,d=2 the native matrix is6×6, not2×18.

Uses: COU §3 p491 — Replaces sheaf restriction by a finite matrix.; GI.5 maximal minor — Produces a polynomial open-rank certificate..

Atlas planet: First-jet matrix.

### Full row rank criterion
Declaration GenericDoublePointInterpolation:GI.1/jet-rank (theorem). For a field k, J_{P,d} is onto iff rank(firstJetMatrix(P,d))=n(r+1).
Proof or construction:

1. Apply the pinned rank/range theorem in the coefficient basis and standard row basis.
2. The codomain has finrank n(r+1).
3. A finite-dimensional subspace has the full ambient dimension iff it is the whole codomain. Exact generic dimension lemmas are refinements, not a newly planned linear algebra theory.

Inputs: GenericDoublePointInterpolation:GI.1/jet-matrix, GenericDoublePointInterpolation:GI.0/bounded-finrank, mathlib:Matrix.rank_eq_finrank_range_toLin. Source: COU, COU §3 p491.

Atlas planet: First-jet rank criterion.

### Well-poised double points
Declaration GenericDoublePointInterpolation:GI.1/well-poised (definition). For a field k and an injective finite tuple P, WellPoised(P,d) means J_{P,d} is surjective. Via the projective restriction comparison this is the source’s well-poisedness of 2P in degree d.
Proof or construction:

1. Define the predicate from the actual first-jet linear map.
2. Keep injectivity as the geometric context rather than replacing it with a length axiom.
3. Connect to the scheme-theoretic restriction map in the separate comparison node.

Inputs: GenericDoublePointInterpolation:GI.1/first-jet-map. Source: COU, COU §3 p491.

API:

- wellPoised_iff_surjective (characterisation): WellPoised(P,d) iff Surjective(J_{P,d}).
- wellPoised_reindex (functoriality): WellPoised is unchanged under a permutation of points.
- wellPoised_degree_mono (relation): If d≤e and WellPoised(P,d), then WellPoised(P,e).

Unit tests:

- wellPoised_one_linear: One point in A^r is well poised in degree1.
- wellPoised_constants_fail: For r≥1 one point is not well poised in degree0.
- wellPoised_collinear_fail: Seven distinct collinear points in A² are not well poised in degree5, although21=choose(7,5).

Uses: COU §3 p491 — Names the exact surjectivity condition used in compact models.; GI.5 endpoint — Exports generic well-poisedness without an all-tuples claim..

### Restriction to projective double points
Declaration GenericDoublePointInterpolation:GI.1/projective-jet-comparison (comparison). For injective affine-chart P, the H⁰(P^r,O(d))→H⁰(2P,O(d)) restriction map is J_{P,d} under fixed homogenization and the chart’s O(d) trivialization; therefore the source restriction is onto iff WellPoised(P,d).
Proof or construction:

1. Extend the finite quotient subscheme through the open chart and square its actual ideal sheaf.
2. Use O(d) trivialization on that chart and finite-scheme global sections.
3. Check the commutative square on monomials using the quotient comparison. This is the precise missing geometric bridge, not equality of unrelated dimensions.

Inputs: GenericDoublePointInterpolation:GI.0/sections-comparison, GenericDoublePointInterpolation:GI.1/double-quotient, GenericDoublePointInterpolation:GI.1/well-poised, AlgebraicModuliForArithmeticGeometry:R09.1, SchemeAndStackFoundations:SF.0. Source: COU, COU §3 p491.

Layer acceptance requires every stated target above, the displayed API/tests, and the following remaining proof/interface refinements. Coverage is planned.

- Native affine ideal and dimension API closure: The restricted submodule, basis, derivatives, square-zero algebra and CRT statements were read at the pins. Exact bounded slack-coordinate adapter to the built Sym.equivNatSum equivalence, translated constant/linear/remainder expansion, coprime-power/infimum identities, quotient algebra linearity and range-dimension lemmas still need native proof closure and exact declaration lookup. No duplicate baseline theory is planned.
- Projective section and finite-scheme interfaces: R09.1 and SF.0 describe the required directions, but their current packets do not expose the exact projective O(d), finite twisting-section and restriction-square signatures. Suggested Lean omits these geometry nodes instead of inventing opaque carriers.

## GI.2 — Residual, trace and curvilinear degeneration
Specialize the ideal-sheaf residual/trace sequence to distinct double points and prove the dimension inequality and ordinary Horace criterion. Define restriction rank for a finite scheme and a linear system, prove the one-point and many-point curvilinear reduction, and import actual flat moving-point, proper incidence-limit and semicontinuity interfaces for the differential argument.
For u supports on H, the double-point trace has length ur and the residual has length q(r+1)−ur. The residual ideal is an ideal quotient by the hyperplane equation, not a set-theoretic complement. Global sections of the sheaf exact sequence are left exact; the final restriction arrow need not be onto. The Castelnuovo inequality follows from an image subspace and the kernel dimension, so it is valid without an unproved H¹ vanishing assertion.

For an arbitrary linear system D, independence means its genuine restriction range has dimension equal to scheme length. The disjoint-union rank identity uses the subspace of D vanishing on one component. The curvilinear reduction then proceeds by induction on length and support count. Since the ambient components are double points, each local curvilinear test has length at most2. Bad directions in a degeneration must belong to an algebraic incidence family with a proper direction parameter. Choosing a bad direction independently in each fibre does not create a flat family or justify a limit.
Dependencies: GenericDoublePointInterpolation:GI.1, SchemeAndStackFoundations:SF.0, AlgebraicModuliForArithmeticGeometry:R09.2.

### Restriction rank of a finite scheme
Declaration GenericDoublePointInterpolation:GI.2/restriction-rank (definition). For a zero-dimensional subscheme X⊂P^r_k and a finite-dimensional linear system D⊂H⁰(P^r,O(d)), h(X,D) is the rank of the actual restriction D→H⁰(X,O(d)|X). Independence means h(X,D)=length(X). Write h(X,d) for the full system.
Proof or construction:

1. Use the native section restriction map and restrict its source to D.
2. Define rank as dimension of its linear range, not a tensor product notation for an arbitrary linear system.
3. Finite-scheme length identifies the target dimension. The local carrier and the finite-scheme section interface require the stated suppliers.

Inputs: AlgebraicModuliForArithmeticGeometry:R09.1, SchemeAndStackFoundations:SF.0. Source: BO, §6 Lemma6.1 pp12–13.

API:

- restrictionRank_kernel (characterisation): h(X,D)=dim D−dim ker(D→H⁰(X,O(d)|X)).
- restrictionRank_le_length (relation): h(X,D)≤min(dim D,length X).
- restrictionRank_empty (simp): h(∅,D)=0.

Unit tests:

- simple_point_rank: For a simple point and the full degree0 constant system, h=1.
- zero_system_rank: For D=0, h(X,D)=0 even when X has positive length.
- double_linear_rank: For one affine double point and d=1, h=r+1, agreeing with the native first-jet matrix.

Uses: BO Lemma6.1 — States curvilinear independence for arbitrary linear systems.; BO Theorem6.4 — Tracks residual and trace contributions in the moving-point family..

Atlas planet: Restriction rank.

### Restriction rank on disjoint unions
Declaration GenericDoublePointInterpolation:GI.2/rank-disjoint (lemma). For disjoint finite schemes A,B and D as above, h(A∪B,D)=h(B,D)+h(A,ker(D→H⁰(B,O(d)|B))).
Proof or construction:

1. Identify sections on A∪B with the product of sections on A and B.
2. Project the restriction range to its B component; the image is the B restriction range.
3. Its kernel is the A restriction range of the B-vanishing subspace of D. Apply rank-nullity. Disjoint support is essential.

Inputs: GenericDoublePointInterpolation:GI.2/restriction-rank, SchemeAndStackFoundations:SF.0. Source: BO, §6 Lemma6.1 p13.

### Double-point residual and trace
Declaration GenericDoublePointInterpolation:GI.2/residual-trace (comparison). Let X be q distinct double points in P^r and H a hyperplane containing exactly u supports. Then Tr_H X consists of u double points in H≅P^(r−1), Res_H X consists of q−u double points off H and u reduced points on H, and 0→I_Res(d−1)→I_X(d)→I_Tr,H(d)→0 is exact as sheaves.
Proof or construction:

1. Import the generic Cartier-divisor ideal-quotient residual/trace sequence from SF.0.
2. At a support on H choose local coordinates with H=(x_r): (m²:x_r)=m and m²+(x_r) gives the squared ideal in H.
3. At an off-H support x_r is a unit and the residual is unchanged. Twisting by O(d) gives the displayed sheaf sequence, not a right-exact global-section sequence.

Inputs: GenericDoublePointInterpolation:GI.1/double-ideal, SchemeAndStackFoundations:SF.0, AlgebraicModuliForArithmeticGeometry:R09.1. Source: BO, §4 pp7–8.

### Castelnuovo dimension bound
Declaration GenericDoublePointInterpolation:GI.2/castelnuovo-bound (lemma). In the preceding situation, dim H⁰(I_X(d))≤dim H⁰(I_Res(d−1))+dim H⁰(I_Tr,H(d)). Equivalently h(X,d)≥h(Res,d−1)+h(Tr,d).
Proof or construction:

1. Apply left exactness of global sections to the ideal-sheaf sequence.
2. The kernel equals the residual section space and the image is a subspace of the trace section space.
3. Convert kernel dimensions to restriction ranks with N(r,d)=N(r,d−1)+N(r−1,d). Do not assume global-section surjectivity.

Inputs: GenericDoublePointInterpolation:GI.2/residual-trace, GenericDoublePointInterpolation:GI.2/restriction-rank, GenericDoublePointInterpolation:GI.0/bounded-finrank. Source: BO, §4 Theorem4.1; §6 Theorem6.4.

### Ordinary Horace criterion
Declaration GenericDoublePointInterpolation:GI.2/ordinary-horace (theorem). Suppose trace and residual have maximal rank. If both ur≤N(r−1,d) and q(r+1)−ur≤N(r,d−1), or both reverse inequalities hold, then X has maximal rank in degree d.
Proof or construction:

1. The trace has length ur and the residual length q(r+1)−ur.
2. Insert their maximal-rank values in the Castelnuovo lower bound.
3. In the underfilled case the bound is length X; in the overfilled case it is N(r,d). The general upper bound forces equality; openness transfers a specialized witness to generic points.

Inputs: GenericDoublePointInterpolation:GI.2/castelnuovo-bound, GenericDoublePointInterpolation:GI.1/double-ideal, GenericDoublePointInterpolation:GI.1/double-length. Source: BO, §4 Theorem4.1.

Atlas planet: Ordinary Horace criterion.

### Independent subschemes
Declaration GenericDoublePointInterpolation:GI.2/subscheme-independence (lemma). If X is D-independent and Y⊂X is a finite subscheme, then Y is D-independent. If restriction to X is injective, restriction to every finite superscheme is injective.
Proof or construction:

1. Use the surjection of finite coordinate-section modules from X to Y.
2. Compose the onto map from D to X with that quotient.
3. For the second assertion, a section vanishing on a superscheme vanishes on X. These facts propagate subcritical and supercritical counts separately.

Inputs: GenericDoublePointInterpolation:GI.2/restriction-rank, SchemeAndStackFoundations:SF.0. Source: BO, §6 Lemma6.1; §1 critical counts.

### Curvilinear criterion at one support
Declaration GenericDoublePointInterpolation:GI.2/curvilinear-one-point (lemma). For X contained in a double point, X is D-independent iff every curvilinear subscheme ξ⊂X of length≤2 is D-independent.
Proof or construction:

1. For length≤2 the assertion is immediate.
2. For larger length, choose a length2 direction and a section s∈D vanishing at the support but not on that direction.
3. Inside the square-zero coordinate algebra, the equation s=0 cuts length by exactly1. Apply induction to Y=X∩V(s), then the nonzero extra restriction gives h(X,D)=h(Y,D)+1.

Inputs: GenericDoublePointInterpolation:GI.2/restriction-rank, GenericDoublePointInterpolation:GI.2/subscheme-independence, GenericDoublePointInterpolation:GI.1/jet-kernel, SchemeAndStackFoundations:SF.0. Source: BO, §6 Lemma6.1 pp12–13.

### Curvilinear reduction
Declaration GenericDoublePointInterpolation:GI.2/curvilinear-global (theorem). If X is a finite subscheme of a union of distinct double points, then X is D-independent iff every curvilinear ξ⊂X, with at most length2 at each support, is D-independent.
Proof or construction:

1. Induct on the number of supports and split X=A⊔B with A at one support.
2. For each ξ⊂A, apply induction on B to the subspace of sections vanishing on ξ, using the disjoint rank identity.
3. Obtain independence of every ξ for the B-vanishing system; apply the one-point criterion to A and the rank identity to X. Use kernels throughout instead of unproved ideal-tensor identities.

Inputs: GenericDoublePointInterpolation:GI.2/curvilinear-one-point, GenericDoublePointInterpolation:GI.2/rank-disjoint, GenericDoublePointInterpolation:GI.2/subscheme-independence. Source: BO, §6 Lemma6.1.

Atlas planet: Curvilinear reduction.

### Rank in flat point families
Declaration GenericDoublePointInterpolation:GI.2/rank-open (lemma). In an actual flat finite family of fixed length on P^r over a reduced parameter scheme, the locus where restriction of a fixed finite-dimensional linear system has rank at least t is open. A specialization cannot increase rank.
Proof or construction:

1. Import finite-flat pushforward, base change and local trivializations for the target section bundle.
2. Write the map as a matrix on bundle trivializations; rank≥t is the union of nonzero t-minor opens.
3. Over a specialization, closed rank≤t conditions persist. In the differential proof this gives upper bounds at a limit of failing configurations, not independence merely from a generic bad limit.

Inputs: GenericDoublePointInterpolation:GI.2/restriction-rank, AlgebraicModuliForArithmeticGeometry:R09.2. Source: BO, §6 pp14–18.

### Proper limits of curvilinear failures
Declaration GenericDoublePointInterpolation:GI.2/curvilinear-limits (lemma). For the moving-point family in BO6.4, a failure of D-independence can be witnessed by length2 subschemes at the moving supports. Their projective direction-incidence parameter is proper, so after a valuative base change they have an actual flat limit with tangent/transverse classifications relative to H.
Proof or construction:

1. Parameterize each length2 subscheme of a double point by a line in its tangent space; use the native incidence family, not a pointwise arbitrary choice.
2. Apply properness and the valuative criterion to extend a generic bad incidence tuple after base change.
3. Track its finite-flat length and classify each special direction as transverse or contained in H. The supplier must provide the actual diagram and residue-field/base-change control; this is an explicit gap.

Inputs: GenericDoublePointInterpolation:GI.2/curvilinear-global, GenericDoublePointInterpolation:GI.2/rank-open, AlgebraicModuliForArithmeticGeometry:R09.2. Source: BO, §6 Theorem6.4 Steps3–4.

Layer acceptance requires every stated target above, the displayed API/tests, and the following remaining proof/interface refinements. Coverage is planned.

- Projective section and finite-scheme interfaces: R09.1 and SF.0 describe the required directions, but their current packets do not expose the exact projective O(d), finite twisting-section and restriction-square signatures. Suggested Lean omits these geometry nodes instead of inventing opaque carriers.
- Geometric curvilinear proper-limit interface: R09.2 must expose the actual proper tangent-direction incidence and finite-flat universal family. The proof needs valuative extension/base change of a bad tuple and simultaneous mixed-parameter specialization. Arbitrary pointwise choices of bad directions do not define this family.

## GI.3 — Plane, cubic and quartic inputs
Plan the Veronese/contact-locus route to plane interpolation, the elementary quadric calculation, and the codimension-three cubic recursion of BO5.2–5.4. Supply exact integer matrices with modular-rank certificates for all finite bases used here. Separate the cubic remainder scheme and the exceptional P⁴ cubic counts. Obtain the quartic dimension5 certificate and near-exception inputs for dimensions2–4; do not assert independence at the exceptional counts.
The plane proof is retained because the main differential induction uses both critical counts in every degree. The Veronese tangent annihilator connects secant geometry to squared ideals; the Terracini/contact argument yields a doubled plane curve in a defective system. That generic contact statement carries genuine generality and characteristic-zero hypotheses. Generic tangent-fibre theory remains with the scheme owner, and plane divisor calculations with SF.5. Two exact sextic rank matrices replace the source’s unique-double-cubic calculation at the plane critical boundary.

The cubic proof reduces dimension by codimension-three linear spaces. Its three-space lemma feeds the two-space lemma, which feeds the one-space lemma and the cubic critical theorem. Finite bases are exact integer constraints. Vanishing at sample points of a linear space is only a necessary condition for containing that whole space; full column rank of the enlarged constraint matrix suffices to prove no containing cubic exists. The samples are not falsely advertised as a basis for the entire ideal. The remainder η in the cubic theorem has length δ_r and lies inside a double point. In high dimensions it need not be curvilinear of length greater than2.
Dependencies: GenericDoublePointInterpolation:GI.2, SchemeAndStackFoundations:SF.5, SchemeAndStackFoundations:SF.0.

### Exact integer rank witnesses
Declaration GenericDoublePointInterpolation:GI.3/modular-rank-lift (lemma). If an integer constraint matrix has a t×t minor nonzero modulo101, its rank over every characteristic-zero field is at least t. For homogeneous degree d>0 in characteristic zero, vanishing of all r+1 partials at a nonzero vector implies vanishing of the form itself.
Proof or construction:

1. An integer determinant whose residue is nonzero is a nonzero integer; its image stays nonzero under the injective canonical map to a characteristic-zero field.
2. Use the determinant/rank criterion for the selected minor. Exact generic matrix lemmas must be located, not reproved as an independent matrix theory.
3. For homogeneous forms prove the Euler identity Σx_j∂_jF=dF on monomials and invert d. The certificates provide computational evidence only; formal replay of elimination and lifting remains open.

Inputs: mathlib:Matrix.rank_eq_finrank_range_toLin, mathlib:MvPolynomial.pderiv_monomial. Source: BO, §5 computer bases; §6 final quartic base.

### Quadrics with prescribed singular points
Declaration GenericDoublePointInterpolation:GI.3/quadric-kernel (lemma). For q general points in P^r, the space of singular quadrics has dimension choose(r+2−q,2) when 0≤q≤r+1 and is zero for q≥r+1. In particular at least r+1 general double points leave no quadrics.
Proof or construction:

1. Choose projectively independent supports until their span is all P^r.
2. Represent a quadric by its symmetric bilinear form; characteristic zero allows division by2.
3. Singularity forces the span of the supports into the radical, leaving a quadratic form on a quotient of dimension r+1−q. More supports cannot create a kernel.

Inputs: GenericDoublePointInterpolation:GI.1/projective-jet-comparison, GenericDoublePointInterpolation:GI.2/restriction-rank. Source: BO, §3 p6.

### Veronese tangents and double-point conditions
Declaration GenericDoublePointInterpolation:GI.3/veronese-tangent (comparison). For d≥1 and nonzero v∈k^(r+1), the tangent space to the affine Veronese cone at v^d is v^(d−1)k^(r+1); its annihilator in degree-d forms is the squared point ideal in degree d.
Proof or construction:

1. Differentiate the degree-d Veronese map and invert the nonzero scalar d.
2. At a coordinate point the derivative functionals are coefficients of x₀^d and x₀^(d−1)x_j.
3. Identify their annihilator with double-point vanishing and transport by an invertible coordinate change. Generic symmetric-power and tangent carriers are supplier inputs.

Inputs: GenericDoublePointInterpolation:GI.1/jet-kernel, GenericDoublePointInterpolation:GI.0/sections-comparison, SchemeAndStackFoundations:SF.0. Source: BO, §2 Proposition2.1.

### Terracini span for the Veronese family
Declaration GenericDoublePointInterpolation:GI.3/terracini-span (lemma). At general q Veronese points and a general point in their span, the tangent to their q-secant variety is the span of their tangent spaces; its affine dimension is the restriction rank of the q double points.
Proof or construction:

1. Use the incidence map from ordered points and projective span coefficients.
2. Compute its derivative by separating point directions and coefficient directions.
3. Use generic smoothness and the generic rank/dimension comparison in characteristic zero. These are requested SF.0 direction extensions, not declarations already supplied by its current packet.

Inputs: GenericDoublePointInterpolation:GI.3/veronese-tangent, SchemeAndStackFoundations:SF.0. Source: BO, §2 Terracini first lemma pp2–3.

### Contact curve in the defective plane case
Declaration GenericDoublePointInterpolation:GI.3/terracini-contact (lemma). For general q points in the Veronese plane, a defective tangent span has positive-dimensional contact through each support. For a general degree-d form singular at those supports this yields a reduced plane curve C of degree l through them with 2C contained in its divisor.
Proof or construction:

1. Apply the contact-fiber argument to the general span incidence fiber; the generality hypotheses are retained explicitly.
2. Choose a positive-dimensional component through each support and use the plane singular-divisor calculation to show double containment.
3. Obtain 2l≤d and q≤l(l+3)/2 for general supports. Native generic contact-fiber and Bézout inputs are still exact supplier/refinement gaps.

Inputs: GenericDoublePointInterpolation:GI.3/terracini-span, SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.5. Source: BO, §2 Terracini second lemma and Theorem2.4 pp3–5.

### Plane contact numerical reduction
Declaration GenericDoublePointInterpolation:GI.3/plane-numerics (lemma). In the plane critical-count argument of BO2.4, the bounds 2l≤d and q≤l(l+3)/2, with q the relevant critical floor count, reduce a possible defect to d≤4 or d=6.
Proof or construction:

1. Insert q=floor(N(2,d)/3) and l≤floor(d/2) in the general-curve incidence bound.
2. Separate even and odd d and expand the binomial N(2,d).
3. Check the small integers at the boundary rather than applying a rough asymptotic estimate; the source’s numerical scheduling is retained as a refinement gap.

Inputs: GenericDoublePointInterpolation:GI.3/terracini-contact, GenericDoublePointInterpolation:GI.0/monomial-count. Source: BO, §2 Theorem2.4 pp4–5.

### Exact sextic plane critical ranks
Declaration GenericDoublePointInterpolation:GI.3/plane-sextic-base (lemma). There exist distinct plane point configurations for which degree6 homogeneous jet ranks are27 at q=9 and28 at q=10. Thus the corresponding generic ranks are maximal.
Proof or construction:

1. Read jets-9-r2-d6 and jets-10-r2-d6 from the recoverable certificate archive; their exact modular ranks are27/28 and28/28.
2. The independent verifier reconstructs every entry from integer coordinates and checks projective distinctness.
3. Lift the nonzero minors to characteristic zero and use rank openness on the irreducible tuple parameter. The proof replaces the source’s unique-double-cubic sextic argument, without changing its target.

Inputs: GenericDoublePointInterpolation:GI.3/modular-rank-lift, GenericDoublePointInterpolation:GI.2/rank-open. Source: BO, §2 Theorem2.4 d=6.

### Plane interpolation input
Declaration GenericDoublePointInterpolation:GI.3/plane-interpolation (theorem). General double points in P² impose maximal-rank conditions in every degree, except (d,q)=(2,2) and (4,5). The endpoint needed here includes both critical counts in every d≥5.
Proof or construction:

1. Combine the contact numerical reduction with exact low-degree and sextic witnesses.
2. The double conic witnesses the quartic exception and the quadric formula gives the quadratic exception.
3. Propagate surjectivity to subsets and injectivity to supersets from the two critical counts. The contact-locus native proof chain remains unclosed.

Inputs: GenericDoublePointInterpolation:GI.3/plane-numerics, GenericDoublePointInterpolation:GI.3/plane-sextic-base, GenericDoublePointInterpolation:GI.3/quadric-kernel, GenericDoublePointInterpolation:GI.3/low-rank-bases, GenericDoublePointInterpolation:GI.2/subscheme-independence. Source: BO, §2 Theorem2.4.

Atlas planet: Plane double-point interpolation.

### Three-subspace cubic base certificates
Declaration GenericDoublePointInterpolation:GI.3/three-cubic-bases (lemma). BO5.2 holds for r=5,6,7: no cubic containing three suitably chosen codimension3 subspaces and singular at three distinct points on each. The full-column integer constraint matrices have ranks56,84,120.
Proof or construction:

1. Use the following recoverable integer matrices: three-subspaces-r5-d3.json (rank56/56), three-subspaces-r6-d3.json (rank84/84), three-subspaces-r7-d3.json (rank120/120).
2. Independently reconstruct all monomial value/derivative entries modulo101, check required subspace incidences, transverse remainder direction and projective distinctness.
3. A full-column-rank necessary-condition matrix rules out every nonzero form satisfying the exact conditions. A maximal jet-rank witness establishes the generic rank by openness. No random floating calculation is accepted and no formal certificate proof is claimed.

Inputs: GenericDoublePointInterpolation:GI.3/modular-rank-lift, GenericDoublePointInterpolation:GI.2/rank-open. Source: BO, §5 Proposition5.2 pp9–10.

### Three-subspace cubic recursion
Declaration GenericDoublePointInterpolation:GI.3/three-cubic-recursion (lemma). For r≥5, three general codimension3 subspaces and three general points on each admit no cubic containing the spaces and singular at all nine points.
Proof or construction:

1. For r≥8 choose a general hyperplane and specialize the nine supports to its intersections with the three spaces.
2. The trace is the r−1 case; the residual has degree2 and contains all three spaces.
3. Show no quadric contains these three general spaces by a coefficient calculation, then apply the dimension bound. Exact subspace restriction and no-quadric lemmas are remaining refinements.

Inputs: GenericDoublePointInterpolation:GI.3/three-cubic-bases, GenericDoublePointInterpolation:GI.2/residual-trace, GenericDoublePointInterpolation:GI.2/rank-open. Source: BO, §5 Proposition5.2.

### Two-subspace cubic base certificates
Declaration GenericDoublePointInterpolation:GI.3/two-cubic-bases (lemma). BO5.3 holds in r=5,7: two codimension3 spaces, r−2 double points on each and three outside points leave no cubic containing both spaces. Certificate ranks are56 and120.
Proof or construction:

1. Use the following recoverable integer matrices: two-subspaces-r5-d3.json (rank56/56), two-subspaces-r7-d3.json (rank120/120).
2. Independently reconstruct all monomial value/derivative entries modulo101, check required subspace incidences, transverse remainder direction and projective distinctness.
3. A full-column-rank necessary-condition matrix rules out every nonzero form satisfying the exact conditions. A maximal jet-rank witness establishes the generic rank by openness. No random floating calculation is accepted and no formal certificate proof is claimed.

Inputs: GenericDoublePointInterpolation:GI.3/modular-rank-lift, GenericDoublePointInterpolation:GI.2/rank-open. Source: BO, §5 Proposition5.3 p10, corrected P⁷ base.

### Two-subspace cubic recursion
Declaration GenericDoublePointInterpolation:GI.3/two-cubic-recursion (lemma). For r≥3,r≠4, two general codimension3 spaces L,M, r−2 general double points on each and three general ambient double points leave no cubic containing L∪M.
Proof or construction:

1. Handle r=3 directly and r=5,7 by certificates.
2. For r=6 or r≥8 choose a third codimension3 space N; specialize r−5 points from each list to its intersections and the three outside points into N.
3. The trace is the r−3 two-space assertion; the kernel consists of cubics containing L,M,N and the nine remaining double points, killed by the three-space assertion. The restriction-image dimension comparison is an explicit refinement.

Inputs: GenericDoublePointInterpolation:GI.3/two-cubic-bases, GenericDoublePointInterpolation:GI.3/three-cubic-recursion, GenericDoublePointInterpolation:GI.2/rank-open. Source: BO, §5 Proposition5.3.

### One-subspace cubic base certificates
Declaration GenericDoublePointInterpolation:GI.3/one-cubic-bases (lemma). BO5.4 holds for r=5,7: one codimension3 L, the prescribed points on L and r+1 ambient points, plus the length2 transverse scheme when r=5, leave no containing cubic. Certificate ranks are56 and120.
Proof or construction:

1. Use the following recoverable integer matrices: one-subspace-r5-d3.json (rank56/56), one-subspace-r7-d3.json (rank120/120).
2. Independently reconstruct all monomial value/derivative entries modulo101, check required subspace incidences, transverse remainder direction and projective distinctness.
3. A full-column-rank necessary-condition matrix rules out every nonzero form satisfying the exact conditions. A maximal jet-rank witness establishes the generic rank by openness. No random floating calculation is accepted and no formal certificate proof is claimed.

Inputs: GenericDoublePointInterpolation:GI.3/modular-rank-lift, GenericDoublePointInterpolation:GI.2/rank-open. Source: BO, §5 Proposition5.4 pp10–11.

### One-subspace cubic recursion
Declaration GenericDoublePointInterpolation:GI.3/one-cubic-recursion (lemma). For r≥3,r≠4, let L have codimension3. If r≠2 mod3, prescribe r(r−1)/6 double points on L and r+1 ambient double points. If r≡2 mod3, prescribe (r+1)(r−2)/6 on L, r+1 ambient, and a general η⊂2Q at Q∈L of lengthδ_r=(r+1)/3 and trace lengthδ_r−1. No cubic containing L satisfies these conditions.
Proof or construction:

1. Use bases r=3,5,7.
2. Choose a second codimension3 M. Specialize (r−3)(r−4)/6 on-L points to L∩M in the nonremainder case; in the remainder case specialize (r−2)(r−5)/6 and place η inside M with its trace condition.
3. Move r−2 ambient points to M. The trace is the r−3 one-space assertion and the kernel the two-space assertion. Native control of the η family is requested; it is not an arbitrary thick scheme.

Inputs: GenericDoublePointInterpolation:GI.3/one-cubic-bases, GenericDoublePointInterpolation:GI.3/two-cubic-recursion, GenericDoublePointInterpolation:GI.2/rank-open. Source: BO, §5 Proposition5.4.

### Low-degree near-exception certificates
Declaration GenericDoublePointInterpolation:GI.3/low-rank-bases (lemma). Generic homogeneous jet ranks at cubic(r,q)=(2,3),(2,4),(3,5),(4,6),(4,8),(7,15) and quartic(r,q)=(2,4),(2,6),(3,8),(3,10),(4,13),(4,15) are respectively9,10,20,30,35,120 and12,15,32,35,65,70.
Proof or construction:

1. Use the following recoverable integer matrices: jets-15-r7-d3.json (rank120/120), jets-6-r4-d3.json (rank30/35), jets-8-r4-d3.json (rank35/35), jets-4-r2-d4.json (rank12/15), jets-6-r2-d4.json (rank15/15), jets-8-r3-d4.json (rank32/35), jets-10-r3-d4.json (rank35/35), jets-13-r4-d4.json (rank65/70), jets-15-r4-d4.json (rank70/70), jets-5-r3-d3.json (rank20/20), jets-3-r2-d3.json (rank9/10), jets-4-r2-d3.json (rank10/10).
2. Independently reconstruct all monomial value/derivative entries modulo101, check required subspace incidences, transverse remainder direction and projective distinctness.
3. A full-column-rank necessary-condition matrix rules out every nonzero form satisfying the exact conditions. A maximal jet-rank witness establishes the generic rank by openness. No random floating calculation is accepted and no formal certificate proof is claimed.

Inputs: GenericDoublePointInterpolation:GI.3/modular-rank-lift, GenericDoublePointInterpolation:GI.2/rank-open. Source: BO, §§2–5; §6 final induction.

### Cubic critical-count remainder
Declaration GenericDoublePointInterpolation:GI.3/cubic-remainder (lemma). Put q_r=floor((r+3)(r+2)/6) and δ_r=N(r,3)−(r+1)q_r. Then δ_r=0 for r≠2 mod3 and δ_r=(r+1)/3 otherwise. For r≥2,r≠4, q_r general double points together with a general η⊂2Q of lengthδ_r impose N(r,3) independent conditions.
Proof or construction:

1. Calculate the remainder by congruence classes of r modulo3.
2. Specialize q_{r−3} double points to a codimension3 L, leaving r+1 outside.
3. For δ_r>0 put η at Q∈L with trace lengthδ_r−1=δ_{r−3}; use the one-subspace assertion on the kernel and the lower-dimensional critical assertion on the trace. For r=2 choose the three coordinate supports and η=[1:1:1]: the remaining cubic is a scalar multiple of x₀x₁x₂, killed by this simple-point value.

Inputs: GenericDoublePointInterpolation:GI.3/one-cubic-recursion, GenericDoublePointInterpolation:GI.3/low-rank-bases, GenericDoublePointInterpolation:GI.2/subscheme-independence. Source: BO, §5 Theorem5.1 pp8–12.

### Cubic maximal-rank input
Declaration GenericDoublePointInterpolation:GI.3/cubic-maximal-rank (theorem). For r≥2, general q double points in P^r have maximal rank in degree3 unless (r,q)=(4,7). In dimension4 only q≤6 or q≥8 are used in the induction.
Proof or construction:

1. The critical floor configuration is independent by the remainder assertion.
2. If δ_r>0, replace η by its containing full double point to kill the kernel at the critical ceiling count.
3. Propagate by subsets and supersets; use the exact r=4 q6 andq8 witnesses separately. Uniqueness of the exceptional seven-point cubic and Waring invariants are not needed or planned.

Inputs: GenericDoublePointInterpolation:GI.3/cubic-remainder, GenericDoublePointInterpolation:GI.3/low-rank-bases, GenericDoublePointInterpolation:GI.2/subscheme-independence. Source: BO, §5 Theorem5.1; §3 exceptional cubic.

Atlas planet: Cubic double-point interpolation.

### Quartic P⁵ critical certificate
Declaration GenericDoublePointInterpolation:GI.3/quartic-five (lemma). There is a distinct21-point configuration in P⁵ whose homogeneous quartic first-derivative constraint matrix has full rank126. Therefore21 general double points impose independent quartic conditions.
Proof or construction:

1. Use the following recoverable integer matrices: jets-21-r5-d4.json (rank126/126).
2. Independently reconstruct all monomial value/derivative entries modulo101, check required subspace incidences, transverse remainder direction and projective distinctness.
3. A full-column-rank necessary-condition matrix rules out every nonzero form satisfying the exact conditions. A maximal jet-rank witness establishes the generic rank by openness. No random floating calculation is accepted and no formal certificate proof is claimed.

Inputs: GenericDoublePointInterpolation:GI.3/modular-rank-lift, GenericDoublePointInterpolation:GI.2/rank-open. Source: BO, §6 p19 final quartic base.

Layer acceptance requires every stated target above, the displayed API/tests, and the following remaining proof/interface refinements. Coverage is planned.

- Native plane contact proof: The BO2 proof is read and inventoried. Generic tangent/contact incidence, the double-curve divisor lemma, general-point plane-curve dimension bound and the sharp numerical reduction need native declarations in the indicated supplier direction and further decomposition. No all-plane or all-characteristic proof is certified.
- Formal finite-certificate replay: All22 explicit matrices, reconstruction, incidences, distinctness and exact modular ranks passed an independent Python verifier. Gaussian elimination, integer determinant lifting, Euler/affine comparison and generic openness have not been replayed in Lean. Finite containment evaluation samples are necessary conditions, not a certified basis of the full containing-form ideal.
- Codimension-three restriction and remainder families: Need exact images/kernels for restriction to linear spaces, the no-quadric calculation for three generic spaces, and a flat η family of length δ_r with trace δ_r−1. The r=2 remainder is explicitly the triangle cubic x₀x₁x₂ evaluated at [1:1:1]; its native replay is still open. The η is a subscheme of a double point, not a long curvilinear scheme.

## GI.4 — Differential Horace and generic interpolation
Split the three inequalities of BO6.3 and every rank step of BO6.4. Handle underfilled and overfilled critical counts by proper limits of curvilinear failures; keep transverse and tangent ranks separate. Complete the quartic dimension6–9 and large-dimension induction, then prove an exception-avoiding induction and then the characteristic-zero generic maximal-rank theorem in degree at least5, including the arbitrary-distinct univariate case.
The Euclidean division identity is ru+e=q(r+1)−N(r,d−1),0≤e<r. The numerical lemma must first allow u to be an integer; a small noncritical q can make it negative. The critical-count lemma separately proves nonnegativity and q−u−e≥0. Truncating natural subtraction at the first definition would change the identity and invalidate the scheduling proof.

The residual/trace proof first creates the mixed degree d−1 system and kills it with u simple points on H. In the underfilled case, a failure of moving double-point independence has a curvilinear witness. Its directions split into transverse F and tangent G. The lower bound adds residual u+(r+1)(q−u−e)+f+2g to trace ru+f, giving (r+1)(q−e)+2e. Proper limits and rank semicontinuity provide the contrary upper bound. In the overfilled case, ν full moved doubles and e−ν restricted doubles form a subscheme of exactly N(r,d) length. This partial scheme, not the full overfilled scheme, is tested for independence.

The quartic r6,8,9 arithmetic is explicit: (r,q,u,e)=(6,30,21,0),(8,55,41,2),(9,71,54,4),(9,72,55,5). Dimension7 instead uses ordinary Horace with u30, at q41 andq42. For r≥10 the sharp numerical lemma kills the quadric residual. The native symbolic scheduler is a remaining gap; a2585-case exact integer sweep over3≤r≤60,5≤d≤40 is supporting evidence, not a proof for unbounded r,d.
Dependencies: GenericDoublePointInterpolation:GI.3, GenericDoublePointInterpolation:GI.2, AlgebraicModuliForArithmeticGeometry:R09.2.

### Quartic P⁷ ordinary Horace input
Declaration GenericDoublePointInterpolation:GI.4/quartic-seven (lemma). Assuming the quartic30-point assertion in P⁶, quartic q=41 and q=42 in P⁷ have maximal rank by specializing u=30 supports to a hyperplane; both ordinary Horace inequalities have the matching direction.
Proof or construction:

1. Compute N(7,4)=330,N(7,3)=120,N(6,4)=210.
2. For q41 the trace length210 fills the trace and the residual length118 is underfilled; for q42 the residual length126 is overfilled.
3. Build the mixed residual from cubic input plus simple points on H using the restriction-injectivity lemma. The lower-dimensional quartic input is in the increasing-dimension induction, not a circular application of the final theorem.

Inputs: GenericDoublePointInterpolation:GI.3/cubic-maximal-rank, GenericDoublePointInterpolation:GI.2/ordinary-horace, GenericDoublePointInterpolation:GI.4/residual-simple-points. Source: BO, §6 p19.

### Quartic induction inputs
Declaration GenericDoublePointInterpolation:GI.4/quartic-induction (theorem). Quartic critical counts have maximal rank for r≥5. For r=6,8,9 the differential Horace data avoid the low-degree exceptions; for r≥10 its degree2 residual is empty by q−u−e≥r+1.
Proof or construction:

1. Start at r5 with the126×126 certificate and use ordinary Horace at r7.
2. For r6,8,9 check each critical floor/ceiling pair explicitly; r9 gives(q,u,e)=(71,54,4),(72,55,5).
3. For r≥10 apply BO6.3(iii), the quadric formula and cubic maximal rank, together with the already proved smaller-dimensional quartic case. The precise arithmetic scheduler is still to be closed.

Inputs: GenericDoublePointInterpolation:GI.3/quartic-five, GenericDoublePointInterpolation:GI.4/quartic-seven, GenericDoublePointInterpolation:GI.3/quadric-kernel, GenericDoublePointInterpolation:GI.3/cubic-maximal-rank, GenericDoublePointInterpolation:GI.4/differential-horace, GenericDoublePointInterpolation:GI.4/numerical-quartic-bound. Source: BO, §6 p19 final induction.

Atlas planet: Quartic interpolation inputs.

### Horace trace-size inequality
Declaration GenericDoublePointInterpolation:GI.4/numerical-trace-bound (lemma). For r≥2,d≥4,0≤q≤ceil(N(r,d)/(r+1)), let integers u,e satisfy ru+e=q(r+1)−N(r,d−1) and 0≤e<r. Then re+u≤N(r−1,d−1).
Proof or construction:

1. Use the Euclidean division relation, retaining u as an integer because small q can give negative u.
2. Bound q(r+1) by N(r,d)+r, insert Pascal’s identity and e≤r−1.
3. The source’s rough inequality has finite boundary cases (r,d)=(3,4),(4,4),(5,4); verify those directly. No truncating natural subtraction is used in this statement.

Inputs: GenericDoublePointInterpolation:GI.0/monomial-count. Source: BO, §6 Lemma6.3(i) pp14–15.

### Horace residual-size inequality
Declaration GenericDoublePointInterpolation:GI.4/numerical-residual-bound (lemma). For the same r,d,q,u,e, N(r,d−2)≤(q−u−e)(r+1).
Proof or construction:

1. Rewrite (q−u−e)(r+1) with the division identity, eliminating q.
2. Insert the upper bound for u+re from the trace inequality.
3. Apply N(r,d−1)−N(r−1,d−1)=N(r,d−2). This also proves q−u−e≥0.

Inputs: GenericDoublePointInterpolation:GI.4/numerical-trace-bound. Source: BO, §6 Lemma6.3(ii).

### Large-dimensional quartic residual bound
Declaration GenericDoublePointInterpolation:GI.4/numerical-quartic-bound (lemma). For d=4,r≥10 and the data of BO6.3, q−u−e≥r+1.
Proof or construction:

1. The previous inequality gives (q−u−e)(r+1)≥N(r,2)=(r+1)(r+2)/2.
2. Combine the sharper floor/remainder estimate of BO6.3 with e<r to improve this to the claimed integral lower bound.
3. Check the r=10 boundary and show the resulting polynomial estimate increases with r. The sharp arithmetic derivation remains an explicit refinement.

Inputs: GenericDoublePointInterpolation:GI.4/numerical-residual-bound. Source: BO, §6 Lemma6.3(iii).

### Nonnegative critical Horace data
Declaration GenericDoublePointInterpolation:GI.4/critical-division (lemma). For r≥2,d≥4 and floor(N(r,d)/(r+1))≤q≤ceil(N(r,d)/(r+1)), the Euclidean-division data u,e above satisfy 0≤u≤q and 0≤q−u−e.
Proof or construction:

1. Bound q(r+1) below by N(r,d)−r and compare it with N(r,d−1).
2. Pascal’s identity and d≥4 give the nonnegative dividend; use Euclidean division rather than truncated subtraction.
3. The residual inequality gives q−u−e≥0, hence u≤q. Sharp small-parameter arithmetic requires native closure.

Inputs: GenericDoublePointInterpolation:GI.4/numerical-residual-bound. Source: BO, §6 Theorem6.4 hypotheses.

### Mixed residual rank in degree d−1
Declaration GenericDoublePointInterpolation:GI.4/partial-residual-rank (lemma). Let q,u,e be critical Horace data and assume AH(r,d−1,q−u). Choose Σ of q−u−e general off-H supports and Γ of e general supports on H. Their full doubles at Σ and H-restricted doubles at Γ have rank (r+1)(q−u)−e in degree d−1; their vanishing-system dimension is u.
Proof or construction:

1. Specialize e of the q−u supports to H and delete exactly their e normal derivative rows.
2. Use the induction hypothesis and the trace-size inequality to show the remaining restricted conditions are independent.
3. Subtract their length from N(r,d−1) using ru+e=q(r+1)−N(r,d−1). Row deletion alone supplies a lower bound, so the specialization/transversality argument must be proved; it is a recorded differential-Horace refinement.

Inputs: GenericDoublePointInterpolation:GI.4/numerical-trace-bound, GenericDoublePointInterpolation:GI.4/critical-division, GenericDoublePointInterpolation:GI.2/rank-disjoint, GenericDoublePointInterpolation:GI.2/rank-open. Source: BO, §6 Theorem6.4 Step1 pp16–17.

### Injective residual restriction to H
Declaration GenericDoublePointInterpolation:GI.4/residual-restrict-injective (lemma). Assume AH(r,d−2,q−u−e). By the numerical residual bound, no degree d−2 form vanishes doubly at Σ. Consequently restriction to H is injective on the degree d−1 system vanishing on Σ² and the restricted doubles Γ²|H.
Proof or construction:

1. The degree d−2 target is overfilled, so its maximal-rank hypothesis means its kernel is zero.
2. A form in the degree d−1 residual system restricting to zero on H is divisible by the equation of H.
3. Its quotient vanishes doubly at off-H Σ and hence is zero. This supplies actual restriction injectivity needed to add simple points.

Inputs: GenericDoublePointInterpolation:GI.4/numerical-residual-bound, GenericDoublePointInterpolation:GI.4/partial-residual-rank, GenericDoublePointInterpolation:GI.2/residual-trace. Source: BO, §6 Theorem6.4 Step2.

### Killing a residual system with simple points
Declaration GenericDoublePointInterpolation:GI.4/residual-simple-points (lemma). If a degree d−1 residual linear system has dimension u and restricts injectively to H, then u general reduced points Φ on H make its restriction map injective. Applied to the Horace residual system this fills N(r,d−1) conditions.
Proof or construction:

1. A nonzero restricted section on the reduced hyperplane is nonzero at some point over the algebraically closed field.
2. Choose evaluation points one by one, reducing the kernel dimension by1; prove the distinct-point choices lie in a nonempty open.
3. After u points the kernel vanishes. This point-selection lemma is also used for ordinary Horace and is independent of the quartic induction.

Inputs: GenericDoublePointInterpolation:GI.4/residual-restrict-injective, GenericDoublePointInterpolation:GI.2/rank-open, GenericDoublePointInterpolation:GI.2/rank-disjoint. Source: BO, §6 Theorem6.4 Step2.

### Underfilled trace with simple remainder
Declaration GenericDoublePointInterpolation:GI.4/trace-simple-rank (lemma). In the underfilled critical case q(r+1)≤N(r,d), assuming AH(r−1,d,u), choose Φ,Γ on H as above so h(Φ²|H∪Γ,d)=ru+e. Every subcollection of the simple Γ points preserves independence.
Proof or construction:

1. The critical data give ru+e≤N(r−1,d).
2. Apply the trace induction to u general double points and then add e general simple points by the remaining section-system dimension argument.
3. Intersect the nonempty open choices with the residual-filling locus for Φ. Irreducibility and simultaneous general choice are requested geometric inputs, not independent arbitrary choices.

Inputs: GenericDoublePointInterpolation:GI.4/residual-simple-points, GenericDoublePointInterpolation:GI.2/subscheme-independence, GenericDoublePointInterpolation:GI.2/rank-open. Source: BO, §6 Theorem6.4 Step3.

### Moving supports and hyperplanes
Declaration GenericDoublePointInterpolation:GI.4/moving-supports (construction). For fixed Γ={γ_i}⊂H, choose an actual algebraic family δ_i(t_i) with δ_i(0)=γ_i and general δ_i(t_i) off H, together with hyperplanes H_i(t_i) through δ_i(t_i) specializing to H. The corresponding full and hyperplane-restricted double-point families are finite flat over the parameter open.
Proof or construction:

1. In a chart choose δ_i(t)=γ_i+t v_i with transverse v_i; vary the hyperplane equation to contain δ_i(t).
2. Construct the actual squared-ideal finite-flat family and its restricted variant, retaining a distinct-support parameter open.
3. Use the supplier incidence/Hilbert pullback rather than treating each parameter fibre as an unrelated object. Native geometric signatures are explicitly omitted from the suggested file.

Inputs: GenericDoublePointInterpolation:GI.2/curvilinear-limits, AlgebraicModuliForArithmeticGeometry:R09.2, SchemeAndStackFoundations:SF.0. Source: BO, §6 Theorem6.4 Step4 pp17–18.

API:

- movingSupports_zero (simp): δ_i(0)=γ_i and H_i(0)=H.
- movingSupports_flat (structure): The double-point and restricted double-point families have constant ranks r+1 and r over the distinct-support open.
- movingSupports_baseChange (functoriality): Any parameter base change pulls back the same squared-ideal incidence family.

Unit tests:

- moving_affine_line: In A² with H=(y=0), δ(t)=(a,t) and H_t=(y=t) give the stated fibres.
- moving_zero_fibre: At t=0 the double point retains length3; it does not become reduced.
- moving_restricted_length: Intersecting its double scheme with H_t gives length2, agreeing with the local square-zero quotient.

Uses: BO6.4 — Carries the curvilinear counterexample limits.; GI.4 overfilled case — Builds partial double-point families of exactly the critical target length..

### Transverse curvilinear limit rank
Declaration GenericDoublePointInterpolation:GI.4/transverse-limit-rank (lemma). For f moving length2 directions whose limits are transverse to H, the special trace retains one simple support per direction and the residual contributes one reduced point per direction. The resulting trace rank is ru+f and the residual contribution is f.
Proof or construction:

1. Compute the ideal of a length2 line-direction scheme in coordinates with H=(x_r).
2. For a transverse direction its trace is reduced length1 and its residual is reduced length1.
3. Apply independent simple-point trace and residual evaluations. Proper flat limits justify these local ideals and preserve the total length.

Inputs: GenericDoublePointInterpolation:GI.4/moving-supports, GenericDoublePointInterpolation:GI.4/trace-simple-rank, GenericDoublePointInterpolation:GI.2/residual-trace, GenericDoublePointInterpolation:GI.2/curvilinear-limits. Source: BO, §6 Theorem6.4 first case p18.

### Tangent directions in the moving residual
Declaration GenericDoublePointInterpolation:GI.4/tangent-moving-rank (lemma). For g bad curvilinear directions whose limits lie in H, keep their supports at a general nonzero parameter during the residual estimate. They contribute2g independent residual conditions; combined residual rank is at least u+(r+1)(q−u−e)+f+2g.
Proof or construction:

1. Separate parameter indices into transverse F and tangent G, with f+g=e.
2. Hold F at its limit and retain general nonzero parameters for G, so their length2 conditions remain outside H in the residual.
3. Use the Step2 residual independence, subset independence and semicontinuity to obtain the displayed lower bound. This mixed-parameter incidence step is not replaced by a claim that all special fibres are independent.

Inputs: GenericDoublePointInterpolation:GI.4/residual-simple-points, GenericDoublePointInterpolation:GI.4/moving-supports, GenericDoublePointInterpolation:GI.2/rank-open, GenericDoublePointInterpolation:GI.2/curvilinear-limits. Source: BO, §6 Theorem6.4 first case p18.

### Underfilled differential Horace contradiction
Declaration GenericDoublePointInterpolation:GI.4/underfilled-contradiction (lemma). In the underfilled critical case, a curvilinear failure at the e moved supports would have rank below (r+1)(q−e)+2e, while the mixed specialization has rank at least that same number. Hence a nonempty open set of moves is independent.
Proof or construction:

1. Choose a proper incidence-limit witness to each generic failure using curvilinear reduction.
2. Add residual u+(r+1)(q−u−e)+f+2g to trace ru+f.
3. Use f+g=e to obtain (r+1)(q−e)+2e, contradicting the closed upper-rank condition of the failure family. Then apply curvilinear reduction to recover the full moving double schemes.

Inputs: GenericDoublePointInterpolation:GI.4/transverse-limit-rank, GenericDoublePointInterpolation:GI.4/tangent-moving-rank, GenericDoublePointInterpolation:GI.2/castelnuovo-bound, GenericDoublePointInterpolation:GI.2/curvilinear-global, GenericDoublePointInterpolation:GI.2/rank-open. Source: BO, §6 Theorem6.4 first case.

### Overfilled partial-length reduction
Declaration GenericDoublePointInterpolation:GI.4/overfilled-partial-scheme (lemma). In the overfilled critical case put ν=N(r−1,d)−ru. If ν<0 ordinary Horace applies. Otherwise 0≤ν<e, and replacing the moved e doubles by ν full doubles and e−ν hyperplane-restricted doubles gives a subscheme of length exactly N(r,d).
Proof or construction:

1. Use q(r+1)>N(r,d) to obtain ν<e.
2. If ν≥0 the retained partial length is (q−e)(r+1)+ν(r+1)+(e−ν)r=(r+1)q−e+ν=N(r,d).
3. The trace Φ²
4. H plus ν simple Γ points fills N(r−1,d); apply curvilinear reduction to this independent partial trace. Restricted double directions for indices>ν are forced into the tangent set G.

Inputs: GenericDoublePointInterpolation:GI.4/critical-division, GenericDoublePointInterpolation:GI.4/numerical-residual-bound, GenericDoublePointInterpolation:GI.2/ordinary-horace, GenericDoublePointInterpolation:GI.4/moving-supports. Source: BO, §6 Theorem6.4 second case p18.

### Overfilled differential Horace contradiction
Declaration GenericDoublePointInterpolation:GI.4/overfilled-contradiction (lemma). With ν≥0 as above, the same mixed-parameter transverse/tangent rank argument makes the partial-length subscheme independent, and therefore makes the full q-double-point system injective in degree d.
Proof or construction:

1. Any curvilinear failure in the partial scheme has all restricted indices in G, so F⊂{1,…,ν}.
2. The trace lower bound ru+f follows from independence of the ν-simple-point filled trace.
3. Reuse the mixed residual estimate and the same contradiction. Independence at length N means injectivity on the full source, and adding the omitted conditions preserves it.

Inputs: GenericDoublePointInterpolation:GI.4/overfilled-partial-scheme, GenericDoublePointInterpolation:GI.4/transverse-limit-rank, GenericDoublePointInterpolation:GI.4/tangent-moving-rank, GenericDoublePointInterpolation:GI.2/subscheme-independence, GenericDoublePointInterpolation:GI.2/curvilinear-global. Source: BO, §6 Theorem6.4 second case pp18–19.

### Differential Horace induction step
Declaration GenericDoublePointInterpolation:GI.4/differential-horace (theorem). For r≥2,d≥4 and a critical q, suppose AH(r−1,d,u), AH(r,d−1,q−u), and AH(r,d−2,q−u−e) for the division data. Then AH(r,d,q) holds. Here AH means generic maximal rank, not independence when the system is overfilled.
Proof or construction:

1. Construct simultaneous general residual and trace configurations using the stated hypotheses and numerical bounds.
2. Apply the underfilled contradiction when q(r+1)≤N; apply the partial-length argument otherwise, including the ordinary ν<0 branch.
3. Rank openness on the irreducible tuple space promotes the constructed witness to a nonempty generic locus. No missing base case is smuggled into the hypothesis.

Inputs: GenericDoublePointInterpolation:GI.4/partial-residual-rank, GenericDoublePointInterpolation:GI.4/residual-simple-points, GenericDoublePointInterpolation:GI.4/underfilled-contradiction, GenericDoublePointInterpolation:GI.4/overfilled-contradiction. Source: BO, §6 Theorem6.4.

Atlas planet: Differential Horace lemma.

### Univariate Hermite interpolation
Declaration GenericDoublePointInterpolation:GI.4/univariate-hermite (theorem). For any field k, every injective n-tuple in A¹ and d≥2n−1 has surjective first-jet evaluation. More generally its rank is min(d+1,2n).
Proof or construction:

1. Use the CRT for the ideals (x−P_i)² in the univariate polynomial ring.
2. Division by their monic product of degree2n gives a unique representative of degree<2n.
3. For d<2n, a polynomial in the kernel is divisible by that product and hence zero. This proof works in every characteristic and requires no AH induction.

Inputs: GenericDoublePointInterpolation:GI.1/double-quotient, GenericDoublePointInterpolation:GI.1/jet-rank. Source: BO, §1; §7.1 beginning p19.

Atlas planet: Univariate Hermite interpolation.

### Exception-avoiding induction schedule
Declaration GenericDoublePointInterpolation:GI.4/exception-scheduler (lemma). For r≥3,d≥5 and each critical q, the BO6.4 predecessor triples avoid all exceptional AH cases, once the plane and cubic inputs and the quartic bases are used. The induction is lexicographic in degree and then dimension; the r=2 case is supplied independently.
Proof or construction:

1. List the only exceptional triples: quadratic2≤q≤r; quartic(2,5),(3,9),(4,14); cubic(4,7).
2. For d=5 check degree4 and degree3 predecessors and for d=6 check degree4 residual predecessors; for d≥7 all lower degrees are at least5.
3. Use the explicit r5–9 quartic schedule and r≥10 bound. A general symbolic arithmetic proof of the finite-exception avoidance has not been completed; this is a gap, not a theorem verified by a finite sweep.

Inputs: GenericDoublePointInterpolation:GI.3/plane-interpolation, GenericDoublePointInterpolation:GI.3/cubic-maximal-rank, GenericDoublePointInterpolation:GI.4/quartic-induction, GenericDoublePointInterpolation:GI.4/critical-division. Source: BO, §6 p19 final induction.

### Generic characteristic-zero double-point rank
Declaration GenericDoublePointInterpolation:GI.4/generic-projective (theorem). Over algebraically closed characteristic-zero k, for r≥1,d≥5 and every q≥1, a nonempty Zariski-open subset of ordered distinct q-tuples in (P^r)^q has homogeneous degree-d jet rank min(N(r,d),q(r+1)).
Proof or construction:

1. Prove the critical floor and ceiling cases by the exception-avoiding induction; use the independent plane/univariate branches.
2. For smaller q project independent critical configurations to a subtuple; for larger q add generic distinct supports to an injective critical configuration.
3. Use irreducibility and rank openness to form the nonempty generic locus. The endpoint is planned but not closed while the scheduler and geometric degeneration gaps persist.

Inputs: GenericDoublePointInterpolation:GI.4/differential-horace, GenericDoublePointInterpolation:GI.4/exception-scheduler, GenericDoublePointInterpolation:GI.4/univariate-hermite, GenericDoublePointInterpolation:GI.3/plane-interpolation, GenericDoublePointInterpolation:GI.2/subscheme-independence, GenericDoublePointInterpolation:GI.2/rank-open. Source: BO, §1 Theorem1.1 and §6 conclusion.

Atlas planet: Alexander–Hirschowitz theorem.

Layer acceptance requires every stated target above, the displayed API/tests, and the following remaining proof/interface refinements. Coverage is planned.

- Geometric curvilinear proper-limit interface: R09.2 must expose the actual proper tangent-direction incidence and finite-flat universal family. The proof needs valuative extension/base change of a bad tuple and simultaneous mixed-parameter specialization. Arbitrary pointwise choices of bad directions do not define this family.
- Differential Horace rank refinements: Close Step1 independence under specialization and deletion of normal conditions, simple-point selection on an injectively restricted system, simultaneous nonempty-open choices and the F/G mixed-family rank bound. Each target is inventoried, but native signatures await the geometric suppliers and more declaration-sized refinements.
- Sharp arithmetic and exceptional-case scheduler: BO6.3 and the final induction were read. Complete symbolic inequalities, small-boundary division checks and proof that every critical predecessor avoids the four low-degree exception types. An exact finite arithmetic sweep is supplemental evidence only, not a proof of the unbounded scheduler.

## GI.5 — Affine open locus and integer specialization
Intersect the projective generic locus with the dense affine chart and ordered-distinct locus. Construct the universal first-jet matrix, a nonzero maximal-minor polynomial and its genuine principal-open comparison. Export the nonempty Zariski-open affine theorem for r,n≥1,d≥5,n(r+1)≤choose(r+d,d). Bound minor degrees and use the built box nonvanishing lemma to choose bounded integer coordinates after any polynomial parameter pullback proved nonzero.
The final affine locus is obtained by intersecting the projective generic locus with the dense chart and distinct-point locus on an irreducible parameter scheme. Polynomial coordinates encode a concrete full-rank witness, while the native Spec basic open supplies its Zariski meaning. The universal matrix has integer coefficients; at least one maximal minor is nonzero because it evaluates nonzero at the witness. Repeated points duplicate value rows, so this maximal-minor open is already contained in the distinct-point locus.

Each entry has total degree at most d and each m-row determinant at most md, where m=n(r+1). The built coordinatewise box nonvanishing theorem over Z therefore finds a point in {0,…,md} for each parameter. Characteristic-zero integer embedding preserves the nonzero determinant. For a consumer’s polynomial parametrization θ, the needed polynomial is Δ∘θ. The consumer must prove it nonzero. Nonzeroness of Δ by itself does not establish this for a restricted family, which could consist entirely of bad configurations.
Dependencies: GenericDoublePointInterpolation:GI.4, GenericDoublePointInterpolation:GI.1, SchemeAndStackFoundations:SF.0.

### Passing to the dense affine chart
Declaration GenericDoublePointInterpolation:GI.5/affine-dense (lemma). The ordered-distinct affine chart of (P^r)^n is a nonempty dense open for r,n≥1. It meets the nonempty generic projective maximal-rank locus, and fixed homogenization identifies its rank with the bounded-polynomial first-jet rank.
Proof or construction:

1. Use irreducibility of the projective product, density of X₀≠0 in every factor and openness of the complement of the diagonals.
2. Intersect these opens with the projective generic rank locus, using infinitude of the algebraically closed field for distinct points.
3. Apply the actual restriction comparison, not a pointwise topological homeomorphism invented on k^r.

Inputs: GenericDoublePointInterpolation:GI.4/generic-projective, GenericDoublePointInterpolation:GI.1/projective-jet-comparison, SchemeAndStackFoundations:SF.0. Source: COU, COU §3 p491; BO1.1.

### Universal first-jet matrix
Declaration GenericDoublePointInterpolation:GI.5/universal-jet-matrix (construction). For r,n,d≥0 define a matrix U(r,n,d) over Z[T_{ij}] with the same row and column indices as firstJetMatrix. Its entries are T_i^α and α_jT_i^(α−e_j). Evaluation in any field at a tuple P gives firstJetMatrix(P,d).
Proof or construction:

1. Use native MvPolynomial variables indexed by Fin n×Fin r and integer coefficients.
2. Copy the monomial derivative formula with its explicit zero-exponent case, making it polynomial without division or negative exponents.
3. Evaluate via the canonical integer algebra map; native algebra evaluation commutes with finite sums and determinants.

Inputs: GenericDoublePointInterpolation:GI.1/jet-matrix, mathlib:MvPolynomial.aeval, mathlib:MvPolynomial.pderiv_monomial. Source: COU, COU §3 pp491–492.

API:

- universalJetMatrix_eval (compatibility): Evaluating T_{ij}=P_ij in k gives firstJetMatrix(P,d).
- universalJetMatrix_value (projection): The value entry is the product of T_i coordinates to exponent α.
- universalJetMatrix_partial (projection): The derivative entry is α_j times the exponent-decremented monomial, zero when α_j=0.

Unit tests:

- universal_one_linear: For r=n=d=1, the matrix in columns1,x is [[1,T],[0,1]], determinant1.
- universal_zero_degree: For d=0 all derivative rows are zero.
- universal_integer_eval: Evaluating at P=3 gives the native value9 and derivative6 for x².

Uses: COU §3 pp491–492 — Produces polynomial nonvanishing conditions in integer parameters.; GI.5 affine open — Provides an actual principal-open certificate for full jets..

Atlas planet: Universal first-jet matrix.

### Nonzero maximal minor
Declaration GenericDoublePointInterpolation:GI.5/maximal-minor (lemma). In the endpoint range r,n≥1,d≥5,n(r+1)≤N(r,d), there exists a choice of n(r+1) distinct columns of U whose determinant Δ∈Z[T] evaluates nonzero at an affine distinct configuration over k. In particular Δ is nonzero.
Proof or construction:

1. Choose an affine full-row-rank witness from the dense-chart argument.
2. Choose pivot columns giving a square invertible submatrix; use existing matrix basis/normal-form theory, with exact lemma lookup retained as a refinement.
3. Take its determinant before evaluation. If Δ were zero its image at the witness would be zero; thus the integer polynomial is genuinely nonzero.

Inputs: GenericDoublePointInterpolation:GI.5/affine-dense, GenericDoublePointInterpolation:GI.5/universal-jet-matrix, GenericDoublePointInterpolation:GI.1/jet-rank. Source: COU, COU §3 p491.

### Degree of a first-jet minor
Declaration GenericDoublePointInterpolation:GI.5/minor-degree (lemma). For any m=n(r+1) chosen-column minor Δ of U, totalDegree Δ≤md and degreeOf(T_ij)≤md. The bound remains valid when Δ=0.
Proof or construction:

1. Every value entry has total degree≤d and every nonzero derivative entry has degree≤d−1.
2. Expand the determinant as the finite signed sum over permutations; each product has total degree≤md.
3. Use the native degree-of≤total-degree bound. The derivative-sensitive sharper COU bound is not required for the exported coarse box interface.

Inputs: GenericDoublePointInterpolation:GI.5/universal-jet-matrix, mathlib:MvPolynomial.degreeOf_le_totalDegree. Source: COU, COU §3 pp491–492.

### Principal-open full-jet locus
Declaration GenericDoublePointInterpolation:GI.5/principal-open (comparison). For the chosen minor mapped into k[T], D(Δ)⊂Spec(k[T]) is the native principal open. Its k-points are exactly ordered affine tuples with eval_P Δ≠0; each such tuple is injective and J_{P,d} is onto. The witness makes this open nonempty.
Proof or construction:

1. Use the actual Spec of the parameter polynomial ring and basicOpen Δ.
2. A k-valued point is the evaluation algebra homomorphism, whose maximal kernel avoids Δ iff its evaluated value is nonzero.
3. The chosen invertible submatrix gives surjectivity. Repeated supports would duplicate value rows, contradicting the minor; hence injectivity follows without adding a separate discriminant.

Inputs: GenericDoublePointInterpolation:GI.5/maximal-minor, GenericDoublePointInterpolation:GI.5/universal-jet-matrix, mathlib:PrimeSpectrum.basicOpen, mathlib:PrimeSpectrum.mem_basicOpen, SchemeAndStackFoundations:SF.0. Source: COU, COU §3 p491.

### Generic affine Hermite interpolation
Declaration GenericDoublePointInterpolation:GI.5/generic-affine (theorem). For algebraically closed characteristic-zero k, r≥1,d≥5,n≥1 and n(r+1)≤N(r,d), a nonempty Zariski-open locus of ordered distinct n-tuples in (A^r_k)^n has surjective value-and-first-derivative evaluation on the native degree≤d submodule. One nonempty principal open D(Δ) suffices.
Proof or construction:

1. Choose the nonzero minor and its native parameter-scheme principal open.
2. Transfer the full-rank conclusion to J through the universal matrix representation.
3. Package the ordered-distinct and well-poised conclusions for EffectiveBoundsCompactModels. The statement excludes all low-degree exceptional triples and makes no positive-characteristic claim.

Inputs: GenericDoublePointInterpolation:GI.5/principal-open, GenericDoublePointInterpolation:GI.1/well-poised. Source: COU, COU §3 p491; BO1.1.

Atlas planet: Generic affine Hermite interpolation.

### Bounded integer specialization
Declaration GenericDoublePointInterpolation:GI.5/integer-grid (theorem). Under the endpoint hypotheses, with a chosen Δ of degree at most B=n(r+1)d, there is an ordered integer tuple with every coordinate in {0,…,B} and Δ nonzero. Its first jets are surjective after embedding the integers into k.
Proof or construction:

1. Apply the contrapositive of the built box lemma to Δ over the domain Z; each variable degree is≤B and every coordinate set has B+1 elements.
2. Obtain an actual integer parameter assignment with nonzero integer determinant.
3. Injectivity of Z→k in characteristic zero preserves that determinant, so the principal-open result gives distinctness and first-jet surjectivity. No Schwartz–Zippel theorem is planned again.

Inputs: GenericDoublePointInterpolation:GI.5/maximal-minor, GenericDoublePointInterpolation:GI.5/minor-degree, mathlib:MvPolynomial.eq_zero_of_eval_zero_at_prod_finset, GenericDoublePointInterpolation:GI.5/principal-open. Source: COU, COU §3 pp491–492.

Atlas planet: Integer interpolation specialization.

### Polynomial parameter pullback
Declaration GenericDoublePointInterpolation:GI.5/parameter-pullback (application). Let θ=(θ_ij) be an integer-polynomial point parametrization in a finite set of parameters S. If Δ∘θ is nonzero and each parameter degree is at most B_s, there is an integer parameter vector with 0≤u_s≤B_s for which Δ(θ(u))≠0 and θ(u) is a distinct well-poised configuration after embedding into k.
Proof or construction:

1. Use native algebra evaluation/substitution to form the polynomial Δ∘θ.
2. The consumer must prove this pullback nonzero; nonzeroness of Δ alone does not imply it.
3. Use the built coordinatewise box lemma and characteristic-zero determinant lifting. The number-field embedding parametrization and its nonzero-pullback proof belong to EffectiveBoundsCompactModels, not this roadmap.

Inputs: GenericDoublePointInterpolation:GI.5/universal-jet-matrix, GenericDoublePointInterpolation:GI.5/principal-open, mathlib:MvPolynomial.eq_zero_of_eval_zero_at_prod_finset. Source: COU, COU §3 p492.

### Special collinear configurations fail
Declaration GenericDoublePointInterpolation:GI.5/collinear-boundary (lemma). For P_i=(i,0)∈Q²,0≤i≤6,d=5, the first-jet matrix has rank11 rather than21. Thus the dimension inequality alone does not imply every distinct tuple is well poised.
Proof or construction:

1. Value and x-derivative rows factor through the restriction f(x,0), of dimension6.
2. The y-derivative rows factor through a univariate polynomial of degree≤4, of dimension5, so rank≤11.
3. The independently reconstructed modular matrix has rank11, giving the characteristic-zero lower bound. Equivalently ordinary seven-point univariate evaluation separates the two coefficient slices.

Inputs: GenericDoublePointInterpolation:GI.1/jet-matrix, GenericDoublePointInterpolation:GI.1/jet-rank. Source: COU, COU §3 p491 genericity condition; authored counterexample.

Layer acceptance requires every stated target above, the displayed API/tests, and the following remaining proof/interface refinements. Coverage is planned.

- Projective section and finite-scheme interfaces: R09.1 and SF.0 describe the required directions, but their current packets do not expose the exact projective O(d), finite twisting-section and restriction-square signatures. Suggested Lean omits these geometry nodes instead of inventing opaque carriers.
- Native minor and parameter-scheme completion: Locate the exact pinned maximal-minor/rank and determinant-degree APIs, finish k-valued point/kernel comparison and formalize the integer embedding/substitution square. Integer box nonvanishing is already built. The consumer owns the nonzero pullback for its own arithmetic parametrization.

## Exact finite certificates
The handoff recovers the generator, a separate reconstruction/elimination verifier, the22 compact matrix files, their SHA256 manifest and the verification receipt. Every matrix uses prime101 and exact integer points. The verifier uses no generator functions: it reconstructs value and derivative entries from the stored monomials and points, checks all prescribed incidences and projective distinctness, and independently performs modular elimination. The generator’s deterministic seeds are stored for reproducibility. No pseudorandom argument substitutes for a nonzero determinant.

| Matrix family | Ambient dimension | Degree | Rank / columns |
|---|---:|---:|---:|
| three-subspaces | 5 | 3 | 56 / 56 |
| three-subspaces | 6 | 3 | 84 / 84 |
| three-subspaces | 7 | 3 | 120 / 120 |
| two-subspaces | 5 | 3 | 56 / 56 |
| two-subspaces | 7 | 3 | 120 / 120 |
| one-subspace | 5 | 3 | 56 / 56 |
| one-subspace | 7 | 3 | 120 / 120 |
| jets-15 | 7 | 3 | 120 / 120 |
| jets-21 | 5 | 4 | 126 / 126 |
| jets-6 | 4 | 3 | 30 / 35 |
| jets-8 | 4 | 3 | 35 / 35 |
| jets-4 | 2 | 4 | 12 / 15 |
| jets-6 | 2 | 4 | 15 / 15 |
| jets-8 | 3 | 4 | 32 / 35 |
| jets-10 | 3 | 4 | 35 / 35 |
| jets-13 | 4 | 4 | 65 / 70 |
| jets-15 | 4 | 4 | 70 / 70 |
| jets-9 | 2 | 6 | 27 / 28 |
| jets-10 | 2 | 6 | 28 / 28 |
| jets-5 | 3 | 3 | 20 / 20 |
| jets-3 | 2 | 3 | 9 / 10 |
| jets-4 | 2 | 3 | 10 / 10 |

The homogeneous derivative rows impose values by the Euler identity only when d is invertible. Here d is3,4 or6 and the final field has characteristic zero; prime101 also does not divide these degrees. The independent verifier’s separate collinear matrix is affine, with explicit value and two partial rows. Its characteristic-zero upper bound is11; its modular rank is11. Full-column finite-base matrices prove nonexistence, while underfilled jet matrices prove row independence. Generality follows from openness on the correct irreducible incidence parameter once the supplier geometry is in place.

## Unclosed interfaces and suggested signatures

- AlgebraicModuliForArithmeticGeometry:R09.1: Native projective space P^r_k, O(d), finite-dimensional global sections and their homogeneous-form equivalence, including affine-chart trivialization and restriction/base-change naturality.
- SchemeAndStackFoundations:SF.0: Native ideal sheaves, squared finite closed subschemes, finite coordinate-algebra length, Cartier-divisor residual/trace exact sequence, section left exactness, affine quotient/chart extension and actual Spec k-valued-point comparison. Also request an owner continuation for generic smoothness, irreducible parameter products and generic rank/dimension/contact-incidence fibers needed by the plane proof.
- SchemeAndStackFoundations:SF.5: Plane Cartier divisors, singular-locus double containment, Bézout and degree/incidence bounds for a reduced curve through general plane points; these are used only in the BO plane input.
- AlgebraicModuliForArithmeticGeometry:R09.2: Actual finite-flat moving-point/Hilbert incidence family and base change, locally free finite pushforward of twisting restrictions, rank semicontinuity, proper projective tangent-direction parameter and valuative extension of bad curvilinear subschemes. Supply residue-field and mixed-parameter limit control, not only a set of possible fibers.

The exact node-by-node suggested-signature ledger is in the packet and reproduced in the handoff. Omitted geometry is still planned mathematically above. In particular the rank-open assertion must use finite-flat pushforward with local bundle trivializations, and the failure-limit assertion must use a proper incidence parameter and a valuative diagram. None of these follows just by assigning a list of ranks to fibres.

No source-private absolute path, extracted paper text or machine build is needed to recover the evidence. The handoff gives the base commit, checked commands, manifest and replay instructions. This research plan does not change either supplier packet, application code or integrated atlas data.
