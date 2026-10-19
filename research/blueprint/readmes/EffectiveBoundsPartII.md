# Effective arithmetic bounds and geometry of numbers, Part II

This continuation builds number fields as components of systems of small integer equations. Its endpoints are Couveignes’s explicit model theorem (Proposition 2, p. 495), the logarithmic model theorem (Theorem 1, p. 487), and the bound

\[
 N_n(H)\le n^{Qn(\log n)^3}H^{Q(\log n)^3}
\]

for the number of **Q-isomorphism classes** of exact degree n and absolute field discriminant at most H, with one absolute constant Q, n>Q and integer H≥1. The natural logarithm is used throughout. Increasing the constant also increases the degree threshold. No numerical value of Q is part of the claim.

The first prerequisite is **[Completed/EffectiveBounds](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/Completed/EffectiveBounds)**, especially its completed Layer 2. Its effective Hermite–Minkowski count, discriminant infrastructure and finiteness are inputs. The present targets add the compact multi-equation model and the degree-sensitive exponent. The scope excludes regulator bounds, integral-basis reduction, monogenicity, optimal exponents, and a terminating enumeration algorithm.

## Conventions and carriers

Fix a number field K, n=[K:Q]≥1 and its ring of integers O. Use Mathlib’s signed `NumberField.discr K` and existing `NumberField.rootDiscr K`:

\[
 \delta=|\operatorname{disc}K|^{1/n}\ge1.
\]

The field discriminant and the discriminant of an order or an independent integral family are distinct. A family of n independent integral elements is a rational basis; its integral span can have nontrivial index in O. Every field-discriminant matrix below uses a separate actual integral basis beta.

| Object | Convention |
|---|---|
| Mixed space | Existing real space R^{r₁}×C^{r₂}, n=r₁+2r₂ |
| House | Existing `NumberField.house`, the maximum of embedding moduli |
| Canonical pairing | Sum of real products plus twice the real part of the complex Hermitian pairing |
| Canonical measure | 2^{r₂} times Mathlib’s standard mixed-space product measure |
| Polynomial module | Existing `MvPolynomial.restrictTotalDegree (Fin r) R d`, denoted V_R(r,d) |
| Exponent index | A(r,d)={alpha∈N^r:sum alpha≤d}; M=choose(d+r,d) |
| Coefficient metric | Monomials orthonormal, so squared norm is the sum of squared coefficients |
| Relation covolume | Intrinsic Euclidean measure in the real span of L, of dimension ell=M−n |
| Embedding matrices | A has embedding rows and integral-basis columns; V has embedding rows and monomial columns; V=AB |
| Counted fields | The unweighted isomorphism-family quotient of ArithmeticStatistics:ST.0 |

The house gauge, the canonical Euclidean norm, and the coefficient Euclidean norm serve different roles. For a single complex coordinate at 1 they give house 1 and canonical norm sqrt(2); for the relation X²−2 the coefficient norm is sqrt(5), while its evaluated value is zero.

For the explicit model theorem assume r≥1, d≥5 and M≥n(r+1), and abbreviate

\[
\begin{aligned}
 \ell&=M-n\ge nr>0, &D&=dn(r+1),\\
 C_0&=nD\delta^2=n^2d(r+1)\delta^2,&H_0&=C_0^d,\\
 G&=M H_0^2,&
 B(n,r,d,\delta)&=\ell^{\ell/(2n)}\sqrt M\,[n^2d(r+1)]^d\delta^{2d}.
\end{aligned}
\]

The evaluation of integer polynomials at integral kappa lands in O. The surjective algebra map onto K uses **rational** polynomials. Its degree-d integral image need not be O.

## Imported contracts and ownership

- **Completed/EffectiveBounds, Layers 1–2.** Consume the pinned discriminant and effective fixed-ambient Hermite infrastructure. `NumberField.finite_of_discr_bdd` and Tau Ceti’s `NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le` establish finiteness before a field count is used. Their existing primitive-element bound is not a target here.
- **GeometryOfNumbersAndQuadraticArithmetic:GN.0.** Import `primitive-orthogonal-covolume`, `arithmetic-orthogonal-saturation` and `hermitian-gram-hadamard`. The standard coefficient lattice is self-dual and primitive intersections have equal complementary covolumes.
- **GeometryOfNumbersAndQuadraticArithmetic:GN.1.** Import `minkowski-second-upper`, `successive-minimum-witnesses` and `ordered-product-root-bound`. The first Minkowski theorem alone does not supply the required independent product bound. Also require the intrinsic ell-dimensional unit-ball estimate vol(B)≥2^ell ell^(−ell/2), with its inscribed-cube proof and orthonormal-coordinate invariance. This routed volume consequence has no finer existing node.
- **GenericDoublePointInterpolation:GI.0, GI.1, GI.5.** Import monomial counting, coefficient coordinates and metric, the first-jet/value/derivative-on-kernel maps, `jet-kernel-split`, and `generic-affine` with a nonzero maximal minor of total degree at most dn(r+1). These carriers and generic interpolation theorems are not reconstructed. The number-field parameter substitution has complex coefficients, so its bounded specialization uses the existing grid lemma over C directly. The supplier’s integer-polynomial pullback export has narrower coefficient hypotheses.
- **SchemeAndStackFoundations:SF.0/jacobian-etale-algebra.** Import the actual localized-Jacobian presentation, finite etaleness and component decomposition compatible with a surjective field-valued evaluation. This target is already in the upstream roadmap.
- **SchemeAndStackFoundations:SF.5.** Require the isolated-point consequence of the upstream general `bezout-inequality` target: r equations in r variables of degree at most d have at most d^r isolated geometric points, including when positive-dimensional components occur elsewhere. The available `isolated-plane-bezout` node covers only the plane. The arbitrary-dimensional consequence is a precise supplier interface for this proof, with no additional intersection theory owned here.
- **ArithmeticStatistics:ST.0/number-fields-ordered-by-discriminant.** Import its isomorphism-family carrier, invariant absolute discriminant and degree. A nonnormal cubic class has three embedded copies in Qbar but contributes one to N_n(H). The formula weighting by n/#Aut(K) describes a different count and is not used to count our classes.

The generic lattice, interpolation and scheme inputs are reusable independently of this continuation. Here their outputs are specialized to arithmetic generators, integer kernels, explicit coefficient bounds and field classes. The source-item name `EffectiveBoundsCompactModels` in the earlier paper route refers to this Part II’s arithmetic scope.

## Layer order

| Layer | Output | Main inputs |
|---|---|---|
| EB.0 | Independent delta²-short integral rational basis | Completed parent; GN.1 |
| EB.1 | Bounded integral generators with surjective first jets and values | EB.0; GI.5 |
| EB.2 | Saturated relation lattice and discriminant covolume bound | EB.1; GI.0; GN.0 |
| EB.3 | Small relations with one common nonzero Jacobian minor | EB.2; GI.1; GN.1 |
| EB.4 | Explicit finite-etale component model | EB.3; SF.0 |
| EB.5 | Logarithmic models and a uniform field-count bound | EB.4; SF.5; ST.0 |

The following targets use stable ids; declaration names are proposed API names. Every Check is required. Algebraic and numerical examples in a wider parameter range test the underlying definition without asserting that the final model theorem applies there.

## EB.0: Short algebraic integers

Compare the weighted canonical measure with the existing mixed-space product measure; obtain canonical covolume sqrt(|disc K|). Apply the imported second Minkowski theorem with witnesses to obtain more than half the degree in delta-short integers. Prove the field-specific product-span argument and Proposition 1: a rational basis of integral elements with all conjugates at most delta². No integral-basis assertion is made.

### Weighted canonical measure

Target `EffectiveBoundsPartII:EB.0/measure-normalization` (construction).

On the existing mixed space R^r₁ × C^r₂ use the positive definite real pairing g(x,y)=Σ_real x_i y_i+2 Re(Σ_complex x_j conjugate(y_j)). Its Euclidean Haar measure mu_can is 2^r₂ times standard product volume. The house body B={max(|real coordinates|,|complex coordinates|)≤1} has mu_can-volume 2^r₁(2π)^r₂≥2^n. The house gauge is not the norm from g.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1.

Construction and proof route:

1. Scale both real coordinates of each complex factor by sqrt(2). This is an isometry from g to the standard Euclidean metric and has real determinant 2^r₂.

2. Use change of variables for Haar volume. The sup body is a product of intervals and complex disks, giving the stated volume.

3. Identify its gauge on embedded K with the built house, since conjugate embeddings have equal modulus.

Uses: EB.0/discriminant-covolume: Converts the built product-volume covolume to the normalization of the short-integer argument. EB.0/half-small-integers; Couveignes §2 p. 490: The body-volume lower bound cancels the 2^n factor in second Minkowski.

API:

- `NumberField.CompactModel.canonicalMeasure` (constructor): mu_can is the Haar measure 2^r₂ times the existing mixed-space volume.

- `NumberField.CompactModel.canonicalMeasure_eq_scaledVolume` (compatibility): For every measurable set S, mu_can(S)=2^r₂ volume(S).

- `NumberField.CompactModel.canonicalPairing_apply` (simp): A complex coordinate contributes 2 Re(z conjugate(w)); a real coordinate contributes xy.

- `NumberField.CompactModel.canonicalMeasure_houseBody` (data): The closed house unit body has volume 2^r₁(2π)^r₂.

- `NumberField.CompactModel.houseGauge_embedding` (compatibility): For x∈K the body gauge of its mixed embedding equals NumberField.house x.

Checks:

- `NumberField.CompactModel.measure_rat` (computation): For Q, the unit body is [−1,1], of canonical volume 2.

- `NumberField.CompactModel.measure_gaussian` (computation): For Q(i), canonical measure is twice plane area and the unit disk has volume 2π.

- `NumberField.CompactModel.measure_totally_real` (compatibility): For any totally real K, canonical and standard product measures agree.

- `NumberField.CompactModel.house_not_weightedNorm` (non-example): At the complex coordinate z=1, the house gauge is 1 while the g-norm is sqrt(2).

Acceptance:

- Canonical volume and the house gauge are tracked separately in both Minkowski applications.

Needs: `mathlib:NumberField.mixedEmbedding.finrank`, `mathlib:NumberField.house`, `mathlib:NumberField.canonicalEmbedding.norm_le_iff`.

Source: Couveignes, §2, p. 489, canonical pairing and measure. The source weights complex coordinates twice in the real pairing; this target makes the comparison with the built product volume explicit.

### Canonical discriminant covolume

Target `EffectiveBoundsPartII:EB.0/discriminant-covolume` (theorem).

The mixed-embedding lattice of O_K has canonical covolume sqrt(|disc K|)=delta^(n/2). If beta is an actual integral basis and A has rows indexed by embeddings and columns beta, its canonical Gram determinant is |det A|²=|disc K|.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1.

Construction and proof route:

1. Take the existing product-volume identity 2^(−r₂) sqrt(|disc K|) on the existing lattice.

2. Apply the measure-scaling identity to the same fundamental domain, cancelling 2^r₂.

3. For the integral-basis matrix use the embedding-determinant discriminant identity and conjugation to obtain |det A|². Nonzero integer discriminant implies |disc K|≥1, and positive-real-power laws give the delta formula.

Acceptance:

- For Q(i), product covolume is 1 and canonical covolume is 2, whose square is |−4|.

- A short rational basis cannot replace beta in this discriminant formula.

Needs: `EffectiveBoundsPartII:EB.0/measure-normalization`, `mathlib:NumberField.mixedEmbedding.covolume_integerLattice`, `mathlib:NumberField.mixedEmbedding.latticeBasis`, `mathlib:NumberField.discr_ne_zero`, `mathlib:NumberField.rootDiscr`, `mathlib:Algebra.discr_eq_det_embeddingsMatrixReindex_pow_two`.

Source: Couveignes, §2, p. 490, before the first successive-minima application. The arithmetic volume is the square root of the absolute field discriminant with the weighted canonical measure.

### More than half a degree of short integers

Target `EffectiveBoundsPartII:EB.0/half-small-integers` (construction).

There exist Q-linearly independent omega_1,…,omega_n∈O_K with nondecreasing houses and product of houses at most delta^(n/2). For m=floor(n/2)+1, all omega_i with i≤m have house at most delta. The family need not be an integral basis.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1.

Construction and proof route:

1. Apply the imported second-Minkowski upper product inequality and attaining independent witnesses to the closed house body with canonical volume at least 2^n.

2. Sort the witnesses by gauge, using the built house lower bound 1 on every nonzero algebraic integer.

3. Apply the imported ordered-product root bound: house(omega_i)≤delta^(n/(2(n+1−i))). For i≤m, n≤2(n+1−i) and delta≥1 give the result.

4. Real independence of mixed images implies Q independence; no assertion about the integral span follows.

Uses: EB.0/product-span: The strict inequality 2m>n is the dimension input. EB.0/short-integers; Proposition 1 p. 490: Products of the first m elements have house at most delta².

API:

- `NumberField.CompactModel.exists_halfSmallIntegers` (constructor): Return the independent ordered family together with its product bound.

- `NumberField.CompactModel.halfSmallIntegers_independent` (structure): The coerced family is Q-linearly independent; its first m elements span an m-dimensional space.

- `NumberField.CompactModel.halfSmallIntegers_house` (data): For i≤m, every embedding modulus of omega_i is at most delta.

- `NumberField.CompactModel.halfSmallIntegers_product` (data): The product of all n houses is at most delta^(n/2).

- `NumberField.CompactModel.halfSmallIntegers_house_eq_gauge` (compatibility): The witness gauge is the existing house, not the weighted Euclidean norm.

Checks:

- `NumberField.CompactModel.half_degree_one` (degenerate): For Q, n=m=1 and omega_1=1 is a valid witness with delta=1.

- `NumberField.CompactModel.half_even_degree` (computation): For n=4 one must keep m=3; the exponent bound on the third house is delta^(4/(2·2))=delta.

- `NumberField.CompactModel.half_odd_degree` (computation): For n=5, m=3, and the third-house estimate is delta^(5/6)≤delta.

Acceptance:

- The exact m has 2m>n; choosing only floor(n/2) witnesses is insufficient.

Needs: `EffectiveBoundsPartII:EB.0/discriminant-covolume`, `mathlib:NumberField.one_le_house_of_isIntegral`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-witnesses`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/ordered-product-root-bound`.

Source: Couveignes, §2, p. 490, first Minkowski application and the choice of m. The first m witnesses are small enough for the field-multiplication argument, including the even-degree boundary.

### Products span the field

Target `EffectiveBoundsPartII:EB.0/product-span` (theorem).

For a finite field extension K/k of degree n and k-subspace V, if 2 dim_k V>n then span_k{ab:a,b∈V}=K. Neither separability nor normality is required.

Hypotheses: K/k is a finite extension of fields. V≤K and 2 dim_k V>[K:k].

Construction and proof route:

1. If the product span is proper, choose a nonzero k-linear functional f vanishing on it.

2. The map a↦(b↦f(ab)) from K to its dual is injective: for a≠0 choose c with f(c)≠0 and test b=a^(−1)c.

3. The image of V is an m-dimensional subspace of the annihilator of V, of dimension n−m. This forces 2m≤n and contradicts the hypothesis.

Acceptance:

- At equality the assertion fails: V=Q in a quadratic field has 2dim V=n but product span Q.

- A finite algebra with zero divisors is not substituted for a field.

Needs: Elementary field and finite-dimensional linear algebra.

Source: Couveignes, §2, p. 490, product-span argument before Proposition 1. The source uses multiplication to improve bounds from a large short subspace to a full short independent family.

### Independent delta-squared-short integers

Target `EffectiveBoundsPartII:EB.0/short-integers` (theorem).

For every number field K there exist alpha_1,…,alpha_n∈O_K whose images form a Q-basis of K and satisfy house(alpha_i)≤delta² for all i. In particular they are Z-linearly independent, with no claim that their Z-span is O_K.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1.

Construction and proof route:

1. Take the m small integers and apply product-span to their Q-span.

2. Select n independent products omega_i omega_j from the finite spanning set. They are integral.

3. For every embedding the modulus of each product is at most delta²; apply the built house/embedding comparison.

Acceptance:

- The existence includes Q, with alpha_1=1.

- Every later field-discriminant computation uses a separate genuine integral basis.

Needs: `EffectiveBoundsPartII:EB.0/half-small-integers`, `EffectiveBoundsPartII:EB.0/product-span`, `mathlib:NumberField.house_eq_sup'`.

Source: Couveignes, Proposition 1 and proof, §2, p. 490. The proposition supplies independent short integral elements, which are a rational basis and may have a nontrivial integral index.

## EB.1: Bounded generators with independent first jets

Parametrize r integral generators by the short rational basis. Prove the conjugate-configuration map is invertible over C, pull back a nonzero generic first-jet minor, bound its degree and choose parameters in {0,…,dn(r+1)}. Obtain house at most n²d(r+1)delta² and descend degree-d value surjectivity to Q, for r≥1,d≥5,n(r+1)≤choose(d+r,d).

### Integral generators from a short rational basis

Target `EffectiveBoundsPartII:EB.1/parameterized-generators` (construction).

Given an integral Q-basis alpha_i, define kappa_j(u)=Σ_i u_ij alpha_i for u∈Z^(n×r). Its conjugate configuration is P_tau(u)=(tau(kappa_j(u)))_j. Extending u to C makes u↦P(u) a C-linear equivalence on C^(n×r), with each column transformed by the invertible embedding matrix of alpha. For 0≤u_ij≤D and house(alpha_i)≤delta², house(kappa_j)≤nD delta².

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1. r≥1; alpha is an integral rational basis, not necessarily an integral basis. D≥0 is an integer.

Construction and proof route:

1. Define kappa by the finite integer linear combinations in O_K; the embedding formula follows by additivity.

2. The embedding matrix of a rational basis has nonzero determinant: use nonzero basis discriminant and its square embedding-determinant formula. Apply its inverse separately in each of the r columns.

3. Bound each conjugate by the triangle inequality and n summands at most D delta².

Uses: EB.1/bounded-parameter-choice; §3 p. 492: Invertibility proves nonzeroness of the pulled-back interpolation minor. EB.2/evaluation-height: The explicit bound nD delta² controls monomial evaluation.

API:

- `NumberField.CompactModel.parameterizedGenerators` (constructor): For alpha and u return the tuple kappa∈O_K^r with the stated finite-sum formula.

- `NumberField.CompactModel.parameterizedGenerators_embedding` (simp): tau(kappa_j)=Σ_i (u_ij:C) tau(alpha_i).

- `NumberField.CompactModel.parameterConfigurationEquiv` (equivalence): The complex-linear parameter-to-conjugate-configuration map is invertible for a rational basis alpha.

- `NumberField.CompactModel.parameterizedGenerators_house_le` (data): Parameters in [0,D] give house(kappa_j)≤nD delta².

- `NumberField.CompactModel.parameterizedGenerators_reindex` (functoriality): Reindexing alpha and the first index of u together leaves kappa unchanged; an integral basis change acts by the inverse coefficient change.

Checks:

- `NumberField.CompactModel.parameter_rat` (computation): For K=Q, alpha=(1), and u_11=3, kappa_1=3.

- `NumberField.CompactModel.parameter_zero` (degenerate): The zero parameter matrix gives the zero tuple, whose first jets need not have the required rank.

- `NumberField.CompactModel.parameter_nonbasis` (non-example): The integral rational basis (1,sqrt(5)) of Q(sqrt(5)) is allowed even though its Z-span has index 2 in O_K.

- `NumberField.CompactModel.parameter_singular_family` (non-example): Repeated alpha entries are rejected by the rational-basis hypothesis; their configuration map is singular.

Acceptance:

- The inverse matrix is used over C; integrality of its entries is never asserted.

Needs: `EffectiveBoundsPartII:EB.0/short-integers`, `mathlib:Algebra.discr_not_zero_of_basis`, `mathlib:Algebra.discr_eq_det_embeddingsMatrixReindex_pow_two`.

Source: Couveignes, §3, pp. 491–492, before the bounded integer parameter choice. The basis coordinates range over a full affine parameter space, so a generic minor stays nonzero after pullback.

### Bounded arithmetic first-jet parameters

Target `EffectiveBoundsPartII:EB.1/bounded-parameter-choice` (theorem).

Under r≥1,d≥5,M≥n(r+1), there is u∈{0,…,D}^(n×r), D=dn(r+1), such that the degree-d first-jet map at the n conjugate points of kappa(u) is surjective over C. These points are distinct and house(kappa_j)≤n²d(r+1)delta².

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1. r≥1, d≥5, M=choose(d+r,d)≥n(r+1), ell=M−n≥nr>0.

Construction and proof route:

1. Import a nonzero n(r+1)-column maximal minor on the generic affine configuration space and its total-degree bound D.

2. Pull it back by the complex-linear equivalence of parameterized-generators. The pullback is nonzero; linear substitution preserves the total-degree bound D, hence bounds every variable degree by D.

3. Apply the built grid-vanishing lemma over C to the coordinate sets {0,…,D}, each of cardinality D+1. This allows the complex embedding coefficients; the integer-coefficient-only parameter export is not misapplied.

4. The resulting integer tuple has nonzero minor, so first jets are onto and repeated conjugate points are impossible. Insert D into the house bound.

Acceptance:

- The grid uses D+1 choices per parameter; D choices do not follow from a degree≤D bound.

- For seven collinear points in A² at d=5, distinctness and the dimension inequality alone do not imply full jets.

Needs: `EffectiveBoundsPartII:EB.1/parameterized-generators`, `GenericDoublePointInterpolation:GI.5/generic-affine`, `GenericDoublePointInterpolation:GI.5/maximal-minor`, `GenericDoublePointInterpolation:GI.5/minor-degree`, `mathlib:MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`.

Source: Couveignes, §3, pp. 491–492, maximal minor and integer parameter grid. A nonzero pulled-back minor admits bounded integer specialization; the generic statement alone is insufficient.

### Descent of value evaluation

Target `EffectiveBoundsPartII:EB.1/value-surjectivity` (theorem).

For the chosen tuple kappa, evaluation V_Q(r,d)→K is Q-linearly surjective, and evaluation Q[x_1,…,x_r]→K is a surjective Q-algebra map. Hence Q[kappa_1,…,kappa_r]=K. The integral bounded-degree evaluation into O_K is not asserted surjective.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1. r≥1, d≥5, M=choose(d+r,d)≥n(r+1), ell=M−n≥nr>0. The conjugate first-jet map of kappa is onto.

Construction and proof route:

1. Project the full first-jet map onto its n value rows; this is onto C^n.

2. In a rational basis of K the degree-bounded evaluation is a rational n×M matrix B_Q. After extension to C, multiplication by the invertible embedding matrix identifies it with the value matrix, which has rank n.

3. A rational matrix has the same rank after extension to C, by nonvanishing of its minors. Thus the rational bounded evaluation is onto. The full algebra map contains this image and is also onto.

Acceptance:

- Tensoring an integral image with Q can be onto while its integral index remains greater than one.

- The morphism Spec K→A^r_Q comes from the actual evaluation map.

Needs: `EffectiveBoundsPartII:EB.1/bounded-parameter-choice`, `GenericDoublePointInterpolation:GI.1/value-map`, `GenericDoublePointInterpolation:GI.1/jet-kernel-split`, `mathlib:MvPolynomial.restrictTotalDegree`, `mathlib:MvPolynomial.aeval`.

Source: Couveignes, §3, p. 492, closed immersion induced by the kappa tuple. Value surjectivity descends from the complex conjugate configuration and supplies the field-valued closed point.

## EB.2: Arithmetic relation lattices

Use the native degree-bounded polynomial module and the imported coefficient coordinates. Define the integral evaluation kernel, prove its rank M−n and saturation, and compare the transpose image of the dual ring of integers with the primitive orthogonal lattice. Relate its Gram determinant to the discriminant using an actual integral basis. Bound evaluation entries and the intrinsic relation covolume, retaining the finite index and the discriminant denominator.

### The integral relation lattice

Target `EffectiveBoundsPartII:EB.2/relation-lattice` (definition).

Let V_Z(r,d)=MvPolynomial.restrictTotalDegree(Fin r,Z,d) and ev_Z:V_Z→O_K be evaluation at the chosen integral tuple kappa. Define L=ker(ev_Z) in the existing monomial coordinate lattice Z^M. Equip its real span with the coefficient Euclidean metric imported from GI.0. Then L is saturated, rank_Z L=ell=M−n, and its complex span is precisely the kernel of value evaluation at all conjugates.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1. r≥1, d≥5, M=choose(d+r,d)≥n(r+1), ell=M−n≥nr>0. The tuple has degree-d rational value evaluation onto K.

Construction and proof route:

1. Restrict native algebra evaluation to the existing bounded polynomial submodule; use the supplied coefficient-coordinate equivalence to regard its kernel as an integer submodule of Z^M.

2. Its quotient is the integral evaluation image in the torsion-free group O_K, so L is saturated. Use a genuine integral basis to express evaluation by an integer matrix B of rational rank n.

3. Integer null vectors span the rational kernel by clearing denominators in a rational nullspace basis. Extension of this matrix kernel to R or C then gives rank M−n and the stated kernel comparison.

4. Transport the Euclidean metric from the monomial coordinates; do not use a polynomial sup norm.

Uses: EB.2/dual-image: Saturation identifies the primitive integral orthogonal. EB.3/independent-short-relations and gradient-surjectivity: The real lattice gives short integral equations; its complex span is the entire value kernel.

API:

- `NumberField.CompactModel.relationLattice` (constructor): L is the kernel of bounded-degree integral evaluation.

- `NumberField.CompactModel.mem_relationLattice` (characterisation): f∈L iff totalDegree(f)≤d and f(kappa)=0, with bounded-degree membership carried by the domain.

- `NumberField.CompactModel.relationLattice_rank` (structure): The rank is M−n when rational value evaluation is onto.

- `NumberField.CompactModel.relationLattice_saturated` (structure): If a≠0 is integral and af∈L then f∈L.

- `NumberField.CompactModel.relationLattice_complexSpan` (compatibility): In coefficient coordinates L⊗C is the kernel of conjugate value evaluation.

- `NumberField.CompactModel.relationLattice_degree_mono` (functoriality): For d≤e, the native degree inclusion maps L_d into L_e compatibly with coefficients and evaluation.

Checks:

- `NumberField.CompactModel.relations_zero_tuple` (computation): For one variable, kappa=0 and d=2, the kernel has integral basis X,X²; the constant coefficient must vanish.

- `NumberField.CompactModel.relations_degree_zero` (degenerate): For d=0, constant evaluation Z→O_K is injective, so the kernel is zero; the full-value-rank hypothesis then holds only for n=1.

- `NumberField.CompactModel.relations_square_root` (computation): For kappa=sqrt(2), r=1,d=3, the kernel is spanned over Z by X²−2 and X³−2X, with rank 2=(d+1)−n.

- `NumberField.CompactModel.relations_nonintegral_tuple` (non-example): The tuple 1/2∈Q does not define this map into O_Q=Z and is excluded.

Acceptance:

- L is considered as a full lattice in its ell-dimensional real span, not in all R^M.

Needs: `EffectiveBoundsPartII:EB.1/value-surjectivity`, `mathlib:MvPolynomial.restrictTotalDegree`, `mathlib:MvPolynomial.mem_restrictTotalDegree`, `mathlib:MvPolynomial.aeval`, `GenericDoublePointInterpolation:GI.0/coefficient-coordinates`, `GenericDoublePointInterpolation:GI.0/coefficient-gram`, `GenericDoublePointInterpolation:GI.0/monomial-count`.

Source: Couveignes, §3, p. 493, lattice L and coefficient inner product. The kernel is the arithmetic relation lattice in native bounded-degree polynomials, with its intrinsic coefficient metric.

### Transpose image and its integral index

Target `EffectiveBoundsPartII:EB.2/dual-image` (construction).

Let Lperp=(span_R L)^perp∩Z^M. Transpose integral evaluation gives an injection ev_Z^*:Hom_Z(O_K,Z)→Z^M, lambda↦(lambda(kappa^alpha))_alpha, with image S⊆Lperp of finite index q≥1. Both have rank n and covol(S)=q covol(Lperp). More precisely q=[O_K:im(ev_Z)]. Thus covol(L)=covol(Lperp)≤covol(S), by primitive orthogonal covolume in the standard unimodular coefficient lattice.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1. r≥1, d≥5, M=choose(d+r,d)≥n(r+1), ell=M−n≥nr>0. The integral evaluation image has rank n.

Construction and proof route:

1. A functional on O_K annihilates the kernel after composition with evaluation; therefore its coordinate row lies in the integral orthogonal. Rational surjectivity makes the transpose injective and gives rank n.

2. The saturation and kernel comparison identify Lperp with the full dual of the evaluation image, using the perfect coordinate pairing on Z^M. Restriction from O_K-dual to image-dual has index [O_K:image].

3. Apply the built intrinsic relative-index formula to S⊆Lperp in their common real span.

4. Apply the imported primitive orthogonal-covolume theorem to saturated L in standard self-dual Z^M.

Uses: EB.2/gram-discriminant-identity: The rows of the integral evaluation matrix generate S. EB.2/relation-covolume-bound: Its larger covolume is an upper bound for the relation-lattice covolume.

API:

- `NumberField.CompactModel.dualEvaluation` (constructor): Send lambda∈Hom_Z(O_K,Z) to its values on the evaluated bounded monomials.

- `NumberField.CompactModel.dualEvaluation_apply` (simp): The alpha coordinate is lambda(kappa^alpha).

- `NumberField.CompactModel.dualEvaluation_injective` (structure): Full rational evaluation rank makes the transpose map injective.

- `NumberField.CompactModel.dualEvaluation_image_le_orthogonal` (relation): S is contained in Lperp and has the same rank n.

- `NumberField.CompactModel.dualEvaluation_index` (data): [Lperp:S]=[O_K:im(ev_Z)] and covol(S) is this index times covol(Lperp).

- `NumberField.CompactModel.dualEvaluation_basis_change` (compatibility): Changing the integral basis of O_K changes the generators of S by a unimodular matrix and leaves S and its covolume unchanged.

Checks:

- `NumberField.CompactModel.dual_index_two` (computation): For K=Q(sqrt(5)), kappa=sqrt(5), d≥1, im(ev_Z)=Z[sqrt(5)] has index 2 in O_K, so S has index 2 in Lperp.

- `NumberField.CompactModel.dual_full_image` (compatibility): For kappa=sqrt(2) in Q(sqrt(2)), d≥1, evaluation contains the integral basis 1,sqrt(2); hence S=Lperp.

- `NumberField.CompactModel.dual_zero_kernel` (degenerate): For the abstract integer map Z→Z, z↦2z, the kernel is zero, its integral orthogonal is Z, and the dual image is 2Z, of covolume 2 rather than 1.

Acceptance:

- The direction of the inequality is covol(L)≤covol(S), and q is never silently set to 1.

Needs: `EffectiveBoundsPartII:EB.2/relation-lattice`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/primitive-orthogonal-covolume`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/arithmetic-orthogonal-saturation`, `mathlib:ZLattice.covolume_div_covolume_eq_relIndex'`.

Source: Couveignes, §3, p. 493, integral orthogonal and transpose evaluation. The source uses a finite-index sublattice to bound the covolume. Equality with the whole orthogonal is not needed.

### The Gram–discriminant identity

Target `EffectiveBoundsPartII:EB.2/gram-discriminant-identity` (theorem).

Choose an actual integral basis beta of O_K. Let A_tau,i=tau(beta_i), B_i,alpha the integer beta-coordinates of kappa^alpha, and V_tau,alpha=tau(kappa^alpha), so V=AB. Then B is real/integer, S=B^t Z^n, covol(S)²=det(BB^t), and det(BB^t)=det(V conjugate(V)^t)/|disc K|. Both determinants in the ratio are nonnegative reals; the denominator is nonzero.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1. r≥1, d≥5, M=choose(d+r,d)≥n(r+1), ell=M−n≥nr>0. The matrices have shapes A:n×n, B:n×M, V:n×M; B has row rank n.

Construction and proof route:

1. The basis-coordinate identity gives V=AB. Consequently V V*=A(BB^t)A*, where * is conjugate transpose and B is real.

2. Take determinants and use det(A)conjugate(det(A))=|disc K| for the genuine integral basis.

3. The rows of B are an integral basis of S because the transpose is injective. Apply the intrinsic Gram-volume formula, or an orthonormal coordinate determinant, in the row span.

Acceptance:

- Use V conjugate(V)^t, not VV^t, in the positive Hermitian Gram matrix.

- The short alpha family is not used as beta.

Needs: `EffectiveBoundsPartII:EB.2/dual-image`, `EffectiveBoundsPartII:EB.0/discriminant-covolume`, `mathlib:Algebra.discr_eq_det_embeddingsMatrixReindex_pow_two`, `mathlib:ZLattice.covolume_eq_det_mul_measureReal`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/hermitian-gram-hadamard`.

Source: Couveignes, §3, pp. 493–494, evaluation matrix and determinant computation. The determinant comparison retains the absolute field-discriminant denominator and the complex conjugation.

### Height of monomial values

Target `EffectiveBoundsPartII:EB.2/evaluation-height` (theorem).

Put C0=n²d(r+1)delta², H0=C0^d and G=M H0². Every entry of V has modulus at most H0. Thus every diagonal entry of the Hermitian Gram matrix V V* is at most G. These inequalities include the degree-zero monomial because C0≥1.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1. r≥1, d≥5, M=choose(d+r,d)≥n(r+1), ell=M−n≥nr>0. The chosen tuple has house(kappa_j)≤C0.

Construction and proof route:

1. For each bounded exponent alpha, the evaluated monomial has modulus at most C0^(sum alpha)≤C0^d.

2. Each diagonal Gram entry is a sum of M squared moduli.

3. Separate the constant monomial and note C0≥1; there are M, not (d+1)^r, monomials.

Acceptance:

- H0=[n²d(r+1)]^d delta^(2d); G=M[n²d(r+1)]^(2d)delta^(4d).

- The constant monomial contributes 1.

Needs: `EffectiveBoundsPartII:EB.1/bounded-parameter-choice`, `GenericDoublePointInterpolation:GI.0/monomial-count`, `mathlib:NumberField.house_eq_sup'`.

Source: Couveignes, §3, pp. 493–494, entrywise and diagonal Gram estimates. The evaluation bound fixes both the n²d(r+1) factor and the 2d power of the root discriminant.

### Covolume of arithmetic relations

Target `EffectiveBoundsPartII:EB.2/relation-covolume-bound` (theorem).

For G=M[n²d(r+1)]^(2d)delta^(4d), the intrinsic relation covolume satisfies covol(L)≤G^(n/2)/sqrt(|disc K|)≤G^(n/2). The ambient standard monomial lattice is unimodular; all covolumes of L use its ell-dimensional real span.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1. r≥1, d≥5, M=choose(d+r,d)≥n(r+1), ell=M−n≥nr>0.

Construction and proof route:

1. Use primitive orthogonal equality and S⊆Lperp to bound covol(L) by covol(S).

2. Use the Gram–discriminant identity and imported Hermitian Hadamard inequality to bound det(VV*) by G^n.

3. Take positive square roots, retaining sqrt(|disc K|) in the denominator; use |disc K|≥1 only for the second inequality.

Acceptance:

- The coefficient space uses its unweighted monomial Euclidean measure, independently of the earlier canonical measure.

Needs: `EffectiveBoundsPartII:EB.2/dual-image`, `EffectiveBoundsPartII:EB.2/gram-discriminant-identity`, `EffectiveBoundsPartII:EB.2/evaluation-height`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/hermitian-gram-hadamard`, `mathlib:NumberField.discr_ne_zero`.

Source: Couveignes, §3, p. 494, covolume bound before second Minkowski. This is the arithmetic specialization of the generic Gram bound and the finite-index comparison.

## EB.3: Short equations and a common Jacobian minor

Apply second Minkowski to the coefficient Euclidean lattice to obtain independent relations, retain ell+1−n of them with coefficient bound ell^(ell/(2n)) sqrt(M) [n²d(r+1)]^d delta^(2d), and use first jets to obtain full gradient rank at some conjugate. Select one r-row minor and show it is nonzero at every conjugate by injectivity of embeddings.

### Independent short relation witnesses

Target `EffectiveBoundsPartII:EB.3/independent-short-relations` (construction).

There exist ell linearly independent integral relations E_1,…,E_ell∈L, sorted by coefficient Euclidean norm, with each norm≥1 and product at most ell^(ell/2) covol(L)≤ell^(ell/2)G^(n/2). They form a real basis of span_R L but need not be an integral basis of L.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1. r≥1, d≥5, M=choose(d+r,d)≥n(r+1), ell=M−n≥nr>0.

Construction and proof route:

1. Use the intrinsic ell-dimensional coefficient Euclidean space and the closed unit ball. Its volume is at least 2^ell ell^(−ell/2), by the supplied inscribed-cube inequality.

2. Apply second Minkowski and its attaining independent witnesses to L in that space, then sort them.

3. Each nonzero integer coefficient vector has norm at least one. Substitute the relation-covolume upper bound.

Uses: EB.3/truncate-relations: Sorted norms and the product bound control the retained initial segment. EB.3/one-full-gradient-block: The full ell-family spans the relation kernel over C.

API:

- `NumberField.CompactModel.exists_shortRelations` (constructor): Return ell independent integral equations, their sorted norms, and the product bound.

- `NumberField.CompactModel.shortRelations_mem` (projection): Every witness vanishes at kappa and has total degree at most d.

- `NumberField.CompactModel.shortRelations_independent` (structure): The coefficient vectors form a real basis of span_R L, and a complex basis after extension.

- `NumberField.CompactModel.shortRelations_norm_lower` (data): Every witness has coefficient Euclidean norm at least 1.

- `NumberField.CompactModel.shortRelations_coefficient_le` (compatibility): Every absolute coefficient is at most the coefficient Euclidean norm, since monomials are orthonormal.

Checks:

- `NumberField.CompactModel.relation_norm_single` (computation): The coefficient Euclidean norm of X²−2 is sqrt(5), not max coefficient 2 or house of its value 0.

- `NumberField.CompactModel.relation_norm_integral` (non-example): Every nonzero integer coefficient vector has norm≥1; replacing the lattice by rational coefficients would make this false.

- `NumberField.CompactModel.relation_witness_not_basis` (non-example): Independent full-rank vectors can have nontrivial integral index: (2,0),(0,1) span R² but not Z²; no integral-basis conclusion is exported.

Acceptance:

- No step uses the two different archimedean and coefficient measures interchangeably.

Needs: `EffectiveBoundsPartII:EB.2/relation-covolume-bound`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-witnesses`, `GenericDoublePointInterpolation:GI.0/coefficient-gram`.

Source: Couveignes, §3, p. 494, second Minkowski application to equations. The second independent family lives in the relation space and uses the coefficient Euclidean ball.

### Dropping exactly n minus one relations

Target `EffectiveBoundsPartII:EB.3/truncate-relations` (theorem).

Keep k=ell+1−n of the sorted relations, discarding exactly n−1. The number k is positive, and every retained relation has Euclidean norm and hence each coefficient modulus at most ell^(ell/(2n)) sqrt(G). Their complex span W has codimension n−1 in L_C.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1. r≥1, d≥5, M=choose(d+r,d)≥n(r+1), ell=M−n≥nr>0. E_1,…,E_ell are the sorted independent witnesses.

Construction and proof route:

1. For one-based i≤k, ell+1−i≥n. Apply the imported ordered-product root bound to the witness norms.

2. The product bound gives norm(E_i)≤[ell^(ell/2)G^(n/2)]^(1/n)=ell^(ell/(2n))sqrt(G), since both factors are at least one.

3. Full independence gives dim W=k, so its codimension in the ell-dimensional relation space is n−1. The rank inequality ell≥nr gives k≥n(r−1)+1≥1.

Acceptance:

- Keeping ell−n instead loses the strict codimension inequality needed for a full gradient block.

- The output bound is ell^(ell/(2n))sqrt(M)[n²d(r+1)]^d delta^(2d).

Needs: `EffectiveBoundsPartII:EB.3/independent-short-relations`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/ordered-product-root-bound`.

Source: Couveignes, §3, p. 494, removing the last n−1 equations. The truncation trades a small codimension for a uniform coefficient bound.

### All conjugate gradient blocks are onto

Target `EffectiveBoundsPartII:EB.3/gradient-surjectivity` (theorem).

The derivative map L_C→Π_tau C^r, f↦((partial_j f)(P_tau))_(tau,j), is surjective. Here L_C is the complex span of the integral relation lattice, equal to the full degree-d value kernel; no reduction to the retained subspace is made yet.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1. r≥1, d≥5, M=choose(d+r,d)≥n(r+1), ell=M−n≥nr>0. The chosen conjugate first-jet map is surjective.

Construction and proof route:

1. Use the relation-lattice scalar-extension identification with the value kernel.

2. Apply the imported first-jet kernel splitting theorem: surjectivity of values and first derivatives together gives derivative surjectivity on the value kernel.

3. Record all n blocks at once, so their independent codimension contributions can be used after truncation.

Acceptance:

- Value surjectivity by itself does not imply this derivative statement.

Needs: `EffectiveBoundsPartII:EB.2/relation-lattice`, `EffectiveBoundsPartII:EB.1/bounded-parameter-choice`, `GenericDoublePointInterpolation:GI.1/jet-kernel-split`, `GenericDoublePointInterpolation:GI.1/derivative-on-kernel`.

Source: Couveignes, §3, p. 494, well-poisedness and the cotangent-space argument. First jets control the derivative map on the complete relation kernel.

### A retained family spans one gradient block

Target `EffectiveBoundsPartII:EB.3/one-full-gradient-block` (theorem).

For W spanned by the retained k relations, at least one embedding tau has surjective gradient map W→C^r. Equivalently the k×r gradient matrix has rank r at that conjugate. The strict codimension n−1<n is essential.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1. r≥1, d≥5, M=choose(d+r,d)≥n(r+1), ell=M−n≥nr>0. W has codimension n−1 in L_C. The full gradient map L_C→Π_tau C^r is onto.

Construction and proof route:

1. Let Y be the image of W in the product of gradient blocks. A surjection sends a subspace to a subspace of codimension at most its original codimension, so codim(Y)≤n−1.

2. If all block projections of Y were proper, choose a nonzero functional on each C^r vanishing on that projected image.

3. The n functionals on disjoint blocks are independent and vanish on Y, forcing codim(Y)≥n, a contradiction.

Acceptance:

- At codimension n this can fail: in (C^r)^n, the product of n fixed hyperplanes has codimension n and every block is proper.

Needs: `EffectiveBoundsPartII:EB.3/truncate-relations`, `EffectiveBoundsPartII:EB.3/gradient-surjectivity`.

Source: Couveignes, §3, p. 494, existence of a full-rank embedding block. The paper’s dimension step is made explicit as an independent-block annihilator argument.

### One minor at every conjugate

Target `EffectiveBoundsPartII:EB.3/common-jacobian-minor` (theorem).

Choose r retained equations whose r×r gradient minor is nonzero at the full-rank embedding. Their Jacobian determinant evaluated at kappa is a nonzero element of K; hence that same chosen minor is nonzero under every embedding K→C. The equations retain degree≤d and the truncation coefficient bound.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1. r≥1, d≥5, M=choose(d+r,d)≥n(r+1), ell=M−n≥nr>0.

Construction and proof route:

1. Full rank supplies r distinct retained rows and a nonzero determinant at one embedding.

2. Form J(kappa)=det((partial_j E_i)(kappa)) in K. Evaluation and determinants commute with field embeddings.

3. Nonzero image implies J(kappa)≠0; every field embedding is injective, so all its conjugates are nonzero. This does not assume K/Q normal.

Acceptance:

- A tuple in a nonnormal cubic field is still covered by injectivity of its embeddings.

- All selected equations are integral relations, not merely complex linear combinations.

Needs: `EffectiveBoundsPartII:EB.3/one-full-gradient-block`, `EffectiveBoundsPartII:EB.3/truncate-relations`, `mathlib:MvPolynomial.pderiv`.

Source: Couveignes, §3, pp. 494–495, the minor preceding Proposition 2. A single rationally defined determinant works at every conjugate point; rows are not chosen separately for each point.

## EB.4: Compact component models

Apply the existing Jacobian-open finite-etale theorem to the selected integer equations. Construct the actual surjective evaluation from the localized Q-algebra onto K, compatible with its polynomial evaluation. Prove Proposition 2 with the explicit coefficient bound and Spec K as an open and closed irreducible component; do not claim the selected equations generate the full relation ideal.

### The arithmetic component map

Target `EffectiveBoundsPartII:EB.4/jacobian-open` (construction).

For the selected integer equations E and J=det(partial_j E_i), form A_E=(Q[x_1,…,x_r]/(E_1,…,E_r)) localized away from the class of J. Use the supplier’s existing Jacobian-open algebra. Since E_i(kappa)=0 and J(kappa)≠0, polynomial evaluation extends uniquely to a surjective Q-algebra map phi:A_E→K. It exhibits Spec K as one open and closed irreducible component of Spec A_E. A_E itself may have other field factors.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1. r≥1, d≥5, M=choose(d+r,d)≥n(r+1), ell=M−n≥nr>0. E is the selected r-tuple from common-jacobian-minor.

Construction and proof route:

1. Factor native Q-polynomial evaluation through the ideal generated by the E_i using their vanishing.

2. Send the inverted Jacobian to J(kappa)^(−1); localization’s universal property gives the actual map, compatible with evaluation. Its image contains the surjective polynomial evaluation image.

3. Invoke SchemeAndStackFoundations:SF.0/jacobian-etale-algebra for finite etaleness and the decomposition compatible with the surjection. Do not reprove its generic presentation theorem.

Uses: EB.4/explicit-small-model; Proposition 2 p. 495: Combines the arithmetic bounds with the correct geometric component statement. EB.5/components-to-classes: Several field components per model are permitted and must be counted.

API:

- `NumberField.CompactModel.jacobianAt` (constructor): For an ordered r-tuple E of integer polynomials and a tuple kappa in a commutative ring R, evaluate the determinant of the r by r matrix of native partial derivatives. This equals evaluation of the polynomial Jacobian determinant.

- `NumberField.CompactModel.jacobianAt_map` (functoriality): For a ring homomorphism f:R→S, f(jacobianAt(kappa,E))=jacobianAt(f∘kappa,E); hence injective field embeddings preserve its nonvanishing.

- `NumberField.CompactModel.componentEvaluation` (constructor): Extend the specific evaluation map to A_E by inverting J(kappa).

- `NumberField.CompactModel.componentEvaluation_polynomial` (simp): On the image of f∈Q[x], phi equals f(kappa).

- `NumberField.CompactModel.componentEvaluation_inverseJacobian` (simp): The image of the inverse Jacobian is J(kappa)^(−1).

- `NumberField.CompactModel.componentEvaluation_unique` (universal-property): It is the unique algebra map agreeing with polynomial evaluation.

- `NumberField.CompactModel.componentEvaluation_surjective` (structure): phi is onto K because bounded-degree rational values already span K.

- `NumberField.CompactModel.componentEvaluation_factor` (compatibility): The supplier’s finite-product equivalence can be chosen with phi the projection to its K factor.

Checks:

- `NumberField.CompactModel.component_irreducible_quadric` (computation): For E=X²−2 over Q and kappa=sqrt(2), J=2X is invertible and A_E≃Q(sqrt(2)).

- `NumberField.CompactModel.component_two_fields` (non-example): For E=(X²−2)(X²−3), the Jacobian-open algebra is Q(sqrt(2))×Q(sqrt(3)); either projection is a component map, not an isomorphism from all A_E.

- `NumberField.CompactModel.component_repeated_root` (non-example): For E=X² at kappa=0, J(kappa)=0 and the Jacobian-open algebra is zero; no map of this construction onto Q exists.

- `NumberField.CompactModel.jacobian_quadratic` (computation): For r=1, E=X²−2 and kappa=3 in Q, jacobianAt is 6, the evaluated derivative.

- `NumberField.CompactModel.jacobian_singular` (non-example): For r=1, E=X² and kappa=0 in Q, jacobianAt is zero; this point cannot define the localization evaluation.

- `NumberField.CompactModel.jacobian_empty` (degenerate): For r=0, the determinant of the empty Jacobian is 1 in every commutative ring; the operation is defined outside the model theorem’s r≥1 range.

Acceptance:

- The universal property fixes phi, not merely an abstract isomorphic field somewhere in A_E.

Needs: `EffectiveBoundsPartII:EB.3/common-jacobian-minor`, `EffectiveBoundsPartII:EB.1/value-surjectivity`, `SchemeAndStackFoundations:SF.0/jacobian-etale-algebra`, `mathlib:Algebra.Etale.iff_exists_algEquiv_prod`, `mathlib:MvPolynomial.pderiv`.

Source: Couveignes, Proposition 2, p. 495, and §3 pp. 492, 494. The nonvanishing minor supplies the localization point; the quotient field is a component of the finite-etale algebra.

### Explicit small field models

Target `EffectiveBoundsPartII:EB.4/explicit-small-model` (theorem).

For every number field K and integers r≥1,d≥5 with M=choose(d+r,d)≥n(r+1), there are integral kappa_1,…,kappa_r and integer polynomials E_1,…,E_r of total degree≤d, all coefficients of modulus at most B(n,r,d,delta)=ell^(ell/(2n))sqrt(M)[n²d(r+1)]^d delta^(2d), where ell=M−n. They vanish at kappa, generate K as a Q-algebra by evaluation, and have J(kappa)≠0. Thus Spec K is an open and closed irreducible component of the finite-etale Jacobian-open model A_E.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1. r≥1, d≥5, M=choose(d+r,d)≥n(r+1), ell=M−n≥nr>0.

Construction and proof route:

1. Use bounded arithmetic first jets and the descended value evaluation to construct the relation lattice.

2. Apply the covolume estimate, short independent witnesses, truncation and the full-block argument.

3. Retain the same selected r equations and substitute G into the coefficient bound. Apply the arithmetic component map.

Acceptance:

- The theorem allows n=1 and r=1 when the other inequalities hold.

- It never asserts that r short equations generate the full relation ideal or that the whole zero locus is zero-dimensional.

Needs: `EffectiveBoundsPartII:EB.1/bounded-parameter-choice`, `EffectiveBoundsPartII:EB.3/truncate-relations`, `EffectiveBoundsPartII:EB.3/common-jacobian-minor`, `EffectiveBoundsPartII:EB.4/jacobian-open`.

Source: Couveignes, Proposition 2, §3, p. 495. The explicit polynomial coefficient bound and the field-as-component conclusion are the arithmetic model theorem.

## EB.5: Degree-sensitive field counts

Choose the least positive r with n(r+1)≤choose(2r,r), set d=r in the eventual r≥5 range, and prove Theorem 1 with logarithmic r,d and M≤Qn log n. Count ordered integer equation systems in their coefficient box. Bound the field classes represented by each model using isolated-point Bezout in arbitrary dimension, and deduce Theorem 2: N_n(H)≤n^(Qn(log n)^3) H^(Q(log n)^3) for n>Q,H≥1, counting Q-isomorphism classes without automorphism weights.

### The least central-binomial rank

Target `EffectiveBoundsPartII:EB.5/central-binomial-choice` (construction).

For each n≥1 define r(n) as the least positive integer r with n(r+1)≤choose(2r,r). Write F_r=choose(2r,r)/(r+1). Then F_(r+1)/F_r=2(2r+1)/(r+2)<4, r(n) exists, and n(r+1)≤choose(2r,r)≤4n(r+1). Eventually r≥5 and r≤3 log n, for natural logarithm.

Hypotheses: n≥1 is an integer. The estimate r≤3 log n is eventual, not asserted at n=1.

Construction and proof route:

1. The central binomial coefficient is at least 2^r, so F_r grows without bound; for example 2^r/(r+1) suffices. Thus least positive r exists.

2. For r>1, minimality gives F_(r−1)<n and the exact consecutive ratio gives F_r<4n. At r=1 the bound holds directly.

3. Since F_4=14 and F_r is increasing, n>14 forces r≥5. To get r≤3 log n eventually, use choose(2r,r)≥4^r/(2r+1), as the largest summand in the binomial sum 4^r. For r=floor(3 log n) the ratio 4^r/((2r+1)(r+1)n) tends to infinity, so F_r≥n for large n.

Uses: EB.5/asymptotic-small-model; §4 pp. 495–496: Set d=r to get logarithmic equation count, degree and coefficient height. EB.5/discriminant-count-bound: The same r depends only on n and controls the common finite coefficient box.

API:

- `NumberField.CompactModel.centralBinomialRank` (constructor): Return the least positive admissible r for n≥1.

- `NumberField.CompactModel.centralBinomialRank_spec` (characterisation): r>0, n(r+1)≤choose(2r,r), and each positive s<r is inadmissible.

- `NumberField.CompactModel.centralBinomialRank_size` (data): The monomial count lies between n(r+1) and 4n(r+1).

- `NumberField.CompactModel.centralBinomialRank_log` (data): There exists an absolute n0 such that n≥n0 implies 5≤r≤3 log n.

- `NumberField.CompactModel.centralBinomialRank_mono` (functoriality): For 1≤n≤m, r(n)≤r(m).

Checks:

- `NumberField.CompactModel.rank_one_two` (computation): r(1)=1 and r(2)=2, because choose(2,1)=2 and choose(4,2)=6.

- `NumberField.CompactModel.rank_degree_threshold` (computation): r(14)=4 and r(15)=5, since F_4=14 and F_5=42.

- `NumberField.CompactModel.rank_no_log_at_one` (non-example): r(1)=1>3 log 1=0, so an all-n logarithmic bound is rejected.

Acceptance:

- The chosen d=r is inserted into Proposition 2 only in the eventual r≥5 range.

Needs: Elementary binomial identities and real asymptotic estimates.

Source: Couveignes, §4, p. 495, equation (1) and the parameter choice. The normalized central binomial coefficient grows exponentially while its consecutive ratio is less than four.

### Logarithmic small models

Target `EffectiveBoundsPartII:EB.5/asymptotic-small-model` (theorem).

There is one absolute real Q≥3 such that for every number field K of degree n>Q one can take r=d=r(n)≤Q log n and M=choose(2r,r)≤Q n log n in the explicit small-model theorem, with every coefficient at most (n delta)^(Q log n). The resulting Jacobian-open model contains Spec K as an irreducible component.

Hypotheses: K is a number field, n=[K:Q]≥1, delta=NumberField.rootDiscr K, and delta≥1. n is larger than the single absolute threshold Q.

Construction and proof route:

1. Choose n above the central-binomial threshold and take d=r(n)≥5. We have ell≤M≤4n(r+1)=O(n log n).

2. Taking logarithms, log(ell^(ell/(2n)))=(ell/(2n))log ell=O((log n)²). Also log(sqrt(M))=O(log n).

3. For the remaining factors, d log(n²d(r+1))=O((log n)²) and 2d log delta=O(log n log delta). Combine into Q log n (log n+log delta).

4. Enlarge one absolute Q to dominate every threshold and constant, then exponentiate and apply the explicit model theorem.

Acceptance:

- The r used in counting is a function only of n, not of K or its discriminant.

- No numerical value of the absolute constant is claimed.

Needs: `EffectiveBoundsPartII:EB.4/explicit-small-model`, `EffectiveBoundsPartII:EB.5/central-binomial-choice`.

Source: Couveignes, Theorem 1, p. 487, proved in §4 pp. 495–496. A single sufficiently large absolute constant controls the eventual degree range and each bound.

### Bounded integer equation systems

Target `EffectiveBoundsPartII:EB.5/bounded-equation-systems` (definition).

For naturals r,d,C, let Box(r,d,C) be the set of ordered r-tuples E of native integer polynomials in r variables such that totalDegree(E_i)≤d and |coeff_alpha(E_i)|≤C for every i and exponent alpha. In the supplied monomial coordinates this is exactly rM independent integer slots in [−C,C], M=choose(d+r,d). This coefficient-box carrier is separate from any field-isomorphism carrier.

Hypotheses: r,d,C≥0 are integers. All equations have exactly the same variable index Fin r, and the tuple is ordered.

Construction and proof route:

1. Take the subset of (Z[x_1,…,x_r])^r specified by the degree and coefficient inequalities.

2. Apply the imported coefficient-coordinate equivalence to the bounded-degree submodule. Coefficients outside the bounded exponent set vanish.

3. This identifies the set with the product over Fin r×A(r,d) of the finite integer interval [−C,C].

Uses: EB.5/coefficient-box: The finite product equivalence gives the exact box cardinality. EB.5/components-to-classes: These finite ordered systems form the domain of the model-to-component counting relation.

API:

- `NumberField.CompactModel.boundedEquationSystems` (constructor): The subset of ordered r-tuples cut out by total degree≤d and absolute coefficient≤C.

- `NumberField.CompactModel.mem_boundedEquationSystems` (characterisation): Membership is exactly the degree and coefficient conjunction, including the zero polynomial.

- `NumberField.CompactModel.boundedEquationSystems_coeffEquiv` (equivalence): Coefficient coordinates identify Box with rM copies of the integer interval [−C,C].

- `NumberField.CompactModel.boundedEquationSystems_finite` (structure): Box is finite for all natural r,d,C.

- `NumberField.CompactModel.boundedEquationSystems_mono` (functoriality): For fixed r, increasing d and C gives inclusion of the corresponding boxes.

- `NumberField.CompactModel.boundedEquationSystems_native` (compatibility): The projection onto each equation lands in the built MvPolynomial.restrictTotalDegree submodule; no new polynomial type is defined.

Checks:

- `NumberField.CompactModel.box_no_equations` (degenerate): For r=0 the unique tuple is the empty tuple and the box has cardinality 1 for every d,C.

- `NumberField.CompactModel.box_constants` (computation): For d=0 there are r constant equations and (2C+1)^r choices.

- `NumberField.CompactModel.box_zero_height` (degenerate): For C=0 the only tuple is the zero tuple, independently of d.

- `NumberField.CompactModel.box_total_degree` (non-example): For r=2,d=2 there are six monomials per equation and twelve slots overall; using separate variable degree bounds would incorrectly give eighteen slots.

Acceptance:

- Ordering equations counts every possible tuple and only overcounts models.

Needs: `mathlib:MvPolynomial.restrictTotalDegree`, `mathlib:MvPolynomial.mem_restrictTotalDegree`, `GenericDoublePointInterpolation:GI.0/coefficient-coordinates`, `GenericDoublePointInterpolation:GI.0/monomial-count`.

Source: Couveignes, §4, p. 496, the number of coefficients to be specified. The proof’s finite coefficient choices are recorded as an actual subset of the existing polynomial carrier.

### The coefficient-box cardinality

Target `EffectiveBoundsPartII:EB.5/coefficient-box` (theorem).

The finite set Box(r,d,C) has cardinality exactly (2C+1)^(r choose(d+r,d)), for all natural r,d,C. If a real coefficient bound B≥0 is used, put C=floor(B); all integer coefficients with modulus≤B lie in this box.

Hypotheses: r,d,C≥0 are integers. For the floor version B is a nonnegative real number.

Construction and proof route:

1. Use the coefficient-coordinate product equivalence and the exact count 2C+1 for the integer interval [−C,C].

2. The number of coordinates is rM by the imported monomial count.

3. For the real bound, integer absolute values satisfy |a|≤B iff |a|≤floor(B), so rounding does not introduce infinitely many choices.

Acceptance:

- At r=1 this recovers the familiar (2C+1)^(d+1) count for degree≤d integer polynomials.

Needs: `EffectiveBoundsPartII:EB.5/bounded-equation-systems`, `GenericDoublePointInterpolation:GI.0/monomial-count`.

Source: Couveignes, §4, p. 496, counting r choose(2r,r) coefficients. The finite coefficient count is made explicit before estimating its logarithm.

### From finite models to field classes

Target `EffectiveBoundsPartII:EB.5/components-to-classes` (theorem).

For r,d≥1 and C≥0, the number of Q-isomorphism classes of fields that occur as residue fields of components of Jacobian-open algebras A_E for E∈Box(r,d,C) is at most (2C+1)^(rM) d^r. The same bound holds after restriction to exact degree n and |disc|≤H. This uses a surjection from pairs (equation tuple, field factor) onto the represented classes, not an injection from fields to tuples.

Hypotheses: The isolated-point Bezout bound for arbitrary r is supplied by SF.5: at most d^r isolated geometric points of r equations of total degree≤d over an algebraically closed field, even with positive-dimensional components elsewhere. Count Q-algebra-isomorphism classes using ArithmeticStatistics:ST.0.

Construction and proof route:

1. For each E use the imported finite-etale classification of A_E. Its factors give a finite set of residue-field classes; repeated isomorphic factors contribute just one class but can be overcounted.

2. After base change to Qbar, the number of geometric points is the sum of the factor degrees and is at most d^r by the requested isolated-point inequality. Each factor has positive degree, so its number of factors is also at most d^r.

3. Form the finite disjoint union of these factor sets over the coefficient box and map each pair to its field-isomorphism class. Its image is precisely the represented set.

4. Apply the coefficient-box count. Restricting degree or discriminant can only decrease the image size.

Acceptance:

- For (X²−2)(X²−3) one equation represents two distinct quadratic classes, so a one-model-one-field argument fails.

- The existing SF.5 isolated-plane statement is not substituted for arbitrary dimension.

- No factor n/#Aut(K) appears in the unweighted class count.

Needs: `EffectiveBoundsPartII:EB.5/coefficient-box`, `EffectiveBoundsPartII:EB.4/jacobian-open`, `SchemeAndStackFoundations:SF.5`, `ArithmeticStatistics:ST.0/number-fields-ordered-by-discriminant`, `mathlib:Algebra.Etale.iff_exists_algEquiv_prod`, `mathlib:NumberField.discr_eq_discr_of_algEquiv`.

Source: Couveignes, §4, p. 496, final isolated-point intersection argument; Theorem 2 p. 488. Several fields can occur in one model; intersection degree bounds this multiplicity without imposing properness on the whole intersection.

### A cubic-logarithmic discriminant exponent

Target `EffectiveBoundsPartII:EB.5/discriminant-count-bound` (theorem).

There exists an absolute real Q≥3 such that, for all integers n>Q and H≥1, the number N_n(H) of Q-isomorphism classes of number fields of exact degree n and |disc K|≤H satisfies N_n(H)≤n^(Q n (log n)^3) H^(Q (log n)^3). All logarithms are natural; the same Q is uniform in n and H.

Hypotheses: Use the ST.0 isomorphism-family carrier, with its degree and absolute field-discriminant height. n is above the single absolute threshold Q, H is an integer≥1.

Construction and proof route:

1. Finiteness is inherited from the completed Hermite–Minkowski infrastructure in a fixed Qbar and the isomorphism-family quotient, rather than defining an unsupported finite count.

2. For each class use the logarithmic model with the same r=d=r(n) and M depending only on n. From delta≤H^(1/n), take the common height B=(n H^(1/n))^(Q0 log n), C=floor(B).

3. All these classes lie in the image counted by components-to-classes, so N_n(H)≤(2C+1)^(rM) r^r. Since B≥1, 2C+1≤3B.

4. Use rM=O(n(log n)²). The logarithm of the bound is O(n(log n)^3 log n)+O((log n)^3 log H)+O(log n log log n). Absorb the last term and constants into Q n(log n)^3 log n and Q(log n)^3 log H.

5. Choose one Q≥3 dominating Q0, every degree threshold and both constants, then exponentiate. H=1 is included by the same bound; the proof never divides by log H.

Acceptance:

- This is an upper bound for exact-degree unweighted isomorphism classes, not a density or an asymptotic equality.

- The constant is independent of H; the n=1 case is outside the eventual theorem.

Needs: `EffectiveBoundsPartII:EB.5/asymptotic-small-model`, `EffectiveBoundsPartII:EB.5/components-to-classes`, `EffectiveBoundsPartII:EB.5/central-binomial-choice`, `ArithmeticStatistics:ST.0/number-fields-ordered-by-discriminant`, `mathlib:NumberField.finite_of_discr_bdd`, `tauceti:NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le`.

Source: Couveignes, Theorem 2, p. 488, and §4 pp. 495–496. The discriminant exponent is O((log n)^3), with an explicit displayed dependence on the field degree.

## Worked routes and boundary checks

**An integral index survives rational surjectivity.** For K=Q(sqrt(5)) and kappa=sqrt(5), the monomials span K over Q in degree at least one. Their integral span is Z[sqrt(5)], of index 2 in O=Z[(1+sqrt(5))/2]. In the latter basis the first two evaluation columns are (1,0) and (−1,2). Consequently the transpose image S has index 2 in Lperp. This accounts for the inequality covol(L)≤covol(S). It refutes an equality between the transpose image and the entire integral orthogonal without an integral-surjectivity hypothesis.

**The minor selection uses all n blocks.** Gradient surjectivity for L_C concerns the direct product of n cotangent blocks. Truncation loses n−1 dimensions. If every retained block were deficient, n independent block functionals would annihilate its image. Once one block is full, the selected integer equations give one determinant in K. Injectivity of embeddings makes that same determinant nonzero everywhere; normality is unnecessary.

**A model can represent several classes.** The univariate equation (X²−2)(X²−3) has nonzero derivative at every root and its rational algebra is the product of two distinct quadratic fields. For E=X², the Jacobian-open part is empty. These examples test the map to field factors and the use of a finite product that may be empty. A counting proof uses the image of a finite set of pairs, allowing repetitions of a class across equations and across factors.

**The logarithmic estimate has an eventual degree range.** The least central-binomial rank has r(14)=4 and r(15)=5. Using d=r in Proposition 2 therefore requires passing the d≥5 boundary. The subsequent estimates use one common r for every field of degree n. With rM=O(n(log n)²), the coefficient logarithm is O((log n)²+(log n/n)log H), producing the stated cubic logarithmic discriminant exponent. The factor d^r is absorbed in the degree-dependent term. The argument works at H=1 without taking its reciprocal logarithm.

## Suggested signatures and completion criterion

[EffectiveBoundsPartII.lean](../suggested/EffectiveBoundsPartII.lean) contains a compact selection of signatures that can be expressed using the pinned polynomial, number-field and matrix carriers. Its light definitions describe finite sums, the evaluation kernel, an evaluated Jacobian and the coefficient-box subset. The full mathematical targets, APIs, Checks and imported contracts are the document above. Heavy measure transports, witness selection, finite-etale component comparisons and the ST.0 isomorphism-family interface stay as mathematical targets here.

Completing the roadmap requires every target, API and Check in EB.0–EB.5, together with the exact imported supplier contracts. Elaborating selected signatures verifies their types; it does not establish these results.

## References and pinned library evidence

- J.-M. Couveignes, [*Enumerating number fields*](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf), Annals of Mathematics 192 (2020), 487–497. The version of record was read in full on 19 October 2026. Proposition 1 is on p. 490, Proposition 2 on p. 495, Theorems 1–2 on pp. 487–488, and their quantitative proof on pp. 495–496. Statements and proof routes above are written in our own words. No source errors were identified in this read.
- Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`: `NumberTheory/NumberField/Discriminant/{Defs,Basic}.lean`, `NumberTheory/NumberField/{House,CanonicalEmbedding/Basic}.lean`, `RingTheory/MvPolynomial/Basic.lean`, `Algebra/MvPolynomial/{Eval,PDeriv}.lean`, `Combinatorics/Nullstellensatz.lean`, `RingTheory/Discriminant.lean`, `Algebra/Module/ZLattice/Covolume.lean`, and `RingTheory/Etale/Field.lean`. The exact declarations named above were read at this pin.
- Tau Ceti commit `f790474821cf4256814db967cb154e7af3d0c369`: `NumberTheory/EffectiveBounds/HermiteCount/Basic.lean`. The explicit fixed-ambient count and `hermiteCountBound` are already available.
- Current upstream **Completed/EffectiveBounds**, **GlobalNumberFields**, and the relevant **IntegralLattices** suggested covolume statement were checked for the arithmetic and metric boundaries. The current Tau Ceti effective-bounds implementation was also read. None of these existing targets is planned again.
- The auxiliary Minkowski, interpolation, Jacobian-open and intersection proofs are imported from the named owner roadmaps. In particular this document does not claim an independent read of Siegel’s book, Martinet’s book or Fulton’s refined-intersection proof. Their precise consequences used here are stated at the supplier boundaries above; the two missing finer interfaces are recorded explicitly.


## Independent review

The [independent review](../reviews/REV-DESIGN-EffectiveBoundsPartII.md), completed on 19 October 2026, accepts this target-level planning pass. All 26 targets and 25 pinned baseline declarations were checked. The finite-product baseline uses an essentially finite-type algebra and formal etaleness; the imported Jacobian-open algebra over Q is finitely presented and etale, so these hypotheses hold.

EB.0–EB.2 remain closed at target level. EB.3–EB.5 remain planned, with the intrinsic unit-ball estimate and arbitrary-dimensional isolated-point Bézout interface still requested from their existing owners. Acceptance establishes the plan's consistency and coverage; the selected Lean signatures elaborate with only proof placeholders. Every implementation status remains unchecked.
