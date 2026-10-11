# Effective arithmetic bounds and geometry of numbers, Part II

## Compact models and degree-sensitive field counts

A number field can be described by a defining polynomial, but the coefficients
of a single primitive-element polynomial need not be small enough to give useful
bounds as the degree varies. This roadmap describes the same field through a
small collection of multivariate equations. Its principal output is a family of
integer equations whose rational Jacobian-open zero locus contains the field
as one irreducible component. The field need not be the entire zero locus, and
a fixed tuple of equations can describe more than one field. Keeping those two
features visible is what makes the subsequent enumeration valid.

The starting point is the completed **EffectiveBounds** roadmap. Its
discriminants, primitive generators and Hermite–Minkowski finiteness remain the
foundation. This Part II develops the new compact-model argument of Couveignes,
*Enumerating number fields*, Annals of Mathematics 192 (2020), 487–497. It does
not rebuild those completed results. The endpoint is the following uniform
estimate. For one absolute constant Q, all n≥Q and H≥1 satisfy

\[
 N_n(H)\le n^{Qn(\log n)^3}H^{Q(\log n)^3},
\]

where Nₙ(H) counts exact-degree-n number fields up to rational isomorphism,
with absolute discriminant at most H. It is an ordinary cardinality. Embeddings
and automorphisms give no weights. The plan supplies Q=65536 as one sufficient,
unoptimized choice and retains stronger intermediate inequalities so that its
quantifiers and rounding are reproducible.

The construction uses two geometric structures in succession. First, on the
Minkowski space of K, a supremum gauge controls every conjugate of each chosen
integer. Second, in the space of polynomial coefficients, a Euclidean metric
controls every coefficient of each chosen relation. Their measures are different.
The first one has a factor 2 for each complex place; the second one makes the
monomial coefficient vectors orthonormal. Conflating either metric with the
other changes the determinant calculation and the eventual height bound.

The route has six layers. CM.0 chooses a full independent family of short
algebraic integers. CM.1 takes bounded integer linear combinations whose
embedding points impose all first-jet conditions. CM.2 estimates the lattice
of integral relations, preserving its saturation and the possible index of the
transpose image. CM.3 discards exactly n−1 of the largest relations, finds a
common nonzero Jacobian minor, and obtains a field component. CM.4 chooses the
least central-binomial parameter and makes all logarithmic estimates uniform.
CM.5 enumerates coefficient boxes and maps their field components onto the
required isomorphism classes.

## Conventions and ownership

Throughout K is a number field, O=𝓞 K is its native ring of integers,
n=[K:ℚ]≥1, and δ=NumberField.rootDiscr K=|disc K|^(1/n)≥1. The signature is
(r₁,s), so n=r₁+2s. Every embedding τ is a field embedding into ℂ. Its
restriction to ℚ is the canonical one. `house` is Mathlib's maximum of the
absolute values of all conjugates. The number r denotes the number of variables
and equations; it is independent of r₁. For degree cutoff d,

\[
 \mathcal M=\{a\in\mathbb N^r:\sum_j a_j\le d\},\qquad
 M=\binom{d+r}{d},\qquad \ell=M-n.
\]

Indices in formulas in the suggested file are zero-based. In particular the
retained relation indices satisfy i<ℓ+1−n. Coefficient heights are maximum
absolute coefficient values, not polynomial-value heights or logarithmic
heights. Polynomial total degree includes the native convention for zero.
Real powers and natural powers are distinguished: factors such as δ^(2d)
have integral exponents, whereas ℓ^(ℓ/(2n)) uses real exponentiation. All
intervals in the construction and in the coefficient boxes include both
endpoints. Real H is allowed in the discriminant cutoff, and the count uses
|disc|≤H. The coefficient count first converts a real height to its natural
floor; it does not round to a nearest integer or silently replace the floor
with an asymptotic expression.

The bounded polynomial space is the native
`MvPolynomial.restrictTotalDegree`; its monomial coordinates and transported
Euclidean pairing come from **GenericDoublePointInterpolation** (GI.0).
First jets, their value/gradient splitting, generic full-rank interpolation,
and the degree of a maximal minor are GI.1 and GI.5 inputs. This roadmap adds
the arithmetic parameter change, not a second interpolation theory.

**GeometryOfNumbersAndQuadraticArithmetic** owns all generic covolume,
primitive-orthogonal-lattice and successive-minimum theorems used here. GN.1
must give simultaneous linearly independent witnesses at the successive
minima. Its witnesses are not assumed to be an integral basis. GN.0 supplies
intrinsic covolumes, Gram determinants, the unimodular primitive complement
identity and Hermitian Hadamard. The current upstream IntegralLattices roadmap
and the current Tau Ceti library were checked for overlap: this Part II uses
the native coefficient lattice and imports generic lattice statements rather
than proposing another discriminant-lattice API.

**SchemeAndStackFoundations** owns the generic Jacobian-open finite étale
algebra comparison (SF.0). Its exact `jacobian-etale-algebra` node supplies the
localization and field-component statement; that is a mathematical dependency,
not a claim that it has been implemented. SF.5 owns isolated intersections.
The existing `isolated-plane-bezout` target handles two plane curves only. The
arbitrary-r isolated-point bound needed here is recorded as a precise SF.5
request, stated below. It is not inferred from that special case.

**ArithmeticStatistics** ST.0 supplies the embedded finite-field carrier and
its quotient by ℚ-algebra isomorphism. The present roadmap uses its exact-degree
and inclusive-discriminant family and proves the new estimate on its ordinary
cardinality. ST.3 and its counting asymptotics are not dependencies. The
completed EffectiveBounds results and Tau Ceti's native Hermite-count module
supply existing finiteness; neither is replanned here.

The output is a rational model with integer equations. It does not assert a
presentation of O as an integer quotient, a generating set for its full ideal
of relations, or a runtime for enumerating these models. Those statements would
require additional mathematics. The positive-dimensional parts of the complete
intersection can remain. Only its Jacobian-open part supplies the finite field
components used by the count.

## Reusable proof contracts

The short-integer argument needs a genuine field property. If a subspace V of
a finite field extension K/k has dimension greater than half the degree, then
its products span K. Indeed a nonzero functional f killing every product would
make the nondegenerate form f(ab) vanish on V×V. Nondegeneracy follows by
multiplying by the inverse of any nonzero a. The annihilator of V has dimension
n−dim V, contradicting dim V>n/2. This works without separability. Applying it
to the first floor(n/2)+1 independent minima witnesses produces enough short
products to choose n independent integers with house at most δ². This selection
is only an independent family: substituting it for an actual integral basis in
the discriminant matrix would lose an index.

For the parameter argument, the matrix of the n embeddings on that rational
basis is invertible. Applied separately to the r parameter columns, it makes
the map from nr complex parameters to nr point coordinates a linear
isomorphism. A generic nonzero jet minor therefore remains nonzero after this
change. Its degree in each parameter is at most B=dn(r+1). A nonzero polynomial
over ℂ with those bounds cannot vanish on all of the inclusive integer grid
[0,B]^(nr), because every coordinate grid has B+1 distinct elements. The
pinned Nullstellensatz lemma applies to coefficients over any domain, so no
integer-coefficient assertion about the pulled-back determinant is needed.
Full jets include full value evaluation; after scalar descent, the bounded
rational evaluation has rank n and the tuple κ generates K over ℚ.

The lattice step separates three objects. The relation lattice L is the
saturated kernel inside ℤ^M. Its intrinsic real span W has dimension ℓ. The
integral complement L⊥ℤ=W⊥∩ℤ^M has rank n and the same intrinsic covolume as L.
The transpose image D comes from Homℤ(O,ℤ); it lies in L⊥ℤ but can have index
q>1. In an actual integral basis of O, its Gram matrix is B Bᵀ. In embedding
coordinates it is A A*, with the discriminant change of basis. Thus

\[
 q^2\operatorname{covol}(L)^2
 =\operatorname{covol}(D)^2
 =\det(BB^t)=\frac{\det(AA^*)}{|\operatorname{disc}K|}.
\]

Here A is rectangular n×M, and A* is conjugate transpose. All volumes are in
the appropriate intrinsic coefficient spaces, including the rank-zero
convention. With |Aτ,a|≤C and C=(n²d(r+1))^dδ^(2d), Hadamard yields
covol(L)≤(MC²)^(n/2)/√|disc K|. The final relation estimate may drop the
positive denominator, but it cannot drop the index in the identity.

Finally, full gradients on the whole relation space need not stay full on
an arbitrary small subspace. The retained subspace here has codimension
exactly n−1. If every embedding block were deficient, one independent
block-supported covector from each of the n blocks would annihilate its image,
forcing codimension at least n. Hence one block has rank r. A selected minor
at that embedding is the image of a single element J(κ) of K, so injectivity of
field embeddings proves nonvanishing for the *same* selected equations at all
embeddings. This propagation needs neither a Galois assumption on K nor a
separate selection at each embedding.

The following layers state all targets, APIs, examples and their direct
mathematical imports. Names are proposed library names in
`NumberField.CompactModel`. Generic suppliers retain their own namespaces.

## CM.0 — Weighted Minkowski space and short integers

### Canonical Minkowski measure

**Definition:** `NumberField.CompactModel.canonicalMeasure`.

For a number field K with signature (r₁,s), on Mathlib’s mixedEmbedding.mixedSpace K put μcan = 2^s times its native product Haar measure. It is the volume measure of the real inner product Σρ xρyρ + 2Σσ Re(xσ conjugate(yσ)). The gauge g is the native coordinate supremum norm, not the norm of that inner product.

**Proof route.** Each complex plane has metric matrix 2I₂ and volume factor 2; each real coordinate has factor 1. Transport the product Haar measure, preserving the separate supremum gauge.

**API.**

- `NumberField.CompactModel.canonicalMeasure_apply` (data): For any measurable set U, μcan(U)=2^s volume(U).

- `NumberField.CompactModel.canonicalMeasure_haar` (instance): μcan is a nonzero additive Haar measure.

- `NumberField.CompactModel.canonicalMeasure_unitBody` (compatibility): For U={x:g(x)≤1}, μcan(U)=2^r₁(2π)^s≥2^n; equality in the last comparison holds when s=0.

**Unit tests.** Each statement is an example in the suggested file.

- `NumberField.CompactModel.canonicalMeasure_totallyReal` (compatibility): If s=0, μcan equals the native product measure.

- `NumberField.CompactModel.canonicalMeasure_oneComplex` (computation): If s=1, μcan is twice product measure, not product measure.

- `NumberField.CompactModel.canonicalMeasure_rationalBody` (computation): For K=ℚ, μcan({x:g(x)≤1})=2.

**Acceptance.** Establish the stated bound or equivalence with the exact constants, ranks and inclusive inequalities.

**Inputs.** `mathlib:NumberField.mixedEmbedding.mixedSpace`.

**Source.** Couveignes, §2, p. 489. The proof route identifies the arithmetic specialization and the imported generic statement.

### Discriminant covolume

**Theorem:** `NumberField.CompactModel.canonicalCovolume`.

The mixed-embedding integer lattice has μcan-covolume √|disc K| = δ^(n/2), where n=[K:ℚ]≥1 and δ=|disc K|^(1/n)≥1.

**Proof route.** Read the native product-measure formula 2^(−s)√|disc K|, multiply the measure by 2^s, and use discr_ne_zero and the real-power laws. The result is not the unscaled product covolume.

**Acceptance.** For an imaginary quadratic field the product-measure and canonical covolumes differ by 2.

**Inputs.** `EffectiveBoundsCompactModels:CM.0/canonical-measure`; `mathlib:NumberField.mixedEmbedding.covolume_integerLattice`; `mathlib:NumberField.rootDiscr`.

**Source.** Couveignes, §2, pp. 489–490. The proof route identifies the arithmetic specialization and the imported generic statement.

### Short first-half integers

**Theorem:** `NumberField.CompactModel.firstHalfMinima`.

There are n algebraic integers ωᵢ, linearly independent over ℚ, with nondecreasing houses hᵢ≥1 and ∏hᵢ≤δ^(n/2). With m=floor(n/2)+1, every i<m satisfies hᵢ≤δ. These are simultaneous successive-minimum witnesses, not a chosen integral basis.

**Proof route.** Use the supremum unit body and canonical covolume in GN.1’s second theorem. Use its simultaneous independent minimum witnesses. Nonzero integral elements have house≥1. The ordered-product bound gives hᵢ≤δ^(n/(2(n−i))); for i<m the exponent is≤1.

**Acceptance.** Establish the stated bound or equivalence with the exact constants, ranks and inclusive inequalities.

**Inputs.** `EffectiveBoundsCompactModels:CM.0/canonical-covolume`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-witnesses`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1/ordered-product-root-bound`; `mathlib:NumberField.one_le_house_of_isIntegral`.

**Source.** Couveignes, §2, p. 490. The proof route identifies the arithmetic specialization and the imported generic statement.

### Products of a large subspace

**Theorem:** `NumberField.CompactModel.productSpan`.

For any finite-dimensional field extension K/k and k-subspace V⊆K with 2 dimₖV>[K:k], the k-span of {ab:a,b∈V} is all of K. No separability or integral-basis assumption is required.

**Proof route.** If the product span is proper, choose a nonzero k-linear functional f annihilating it. The form (a,b)↦f(ab) is nondegenerate since K is a field: a≠0 and f(c)≠0 permit b=c/a. Thus V injects into its annihilator of dimension n−dimV, contrary to 2dimV>n.

**Acceptance.** Establish the stated bound or equivalence with the exact constants, ranks and inclusive inequalities.

**Inputs.** `mathlib:Module.Dual`.

**Source.** Couveignes, §2, p. 490, product argument (general field-extension form). The proof route identifies the arithmetic specialization and the imported generic statement.

### Short independent algebraic integers

**Theorem:** `NumberField.CompactModel.shortIntegers`.

Every degree-n number field has n ℚ-linearly independent algebraic integers αᵢ with house(αᵢ)≤δ², hence |τ(αᵢ)|≤δ² for every embedding τ:K→ℂ. This is not a claim that they form a ℤ-basis of 𝓞 K.

**Proof route.** Take the span of the first m integers from firstHalfMinima. productSpan shows its products span K; choose n independent products. Products are integral and the house is submultiplicative.

**Acceptance.** For ℚ the one-element family (1) satisfies the bound. Do not use the short family as the integral basis in the discriminant determinant. shortIntegers_nonBasis: In K=ℚ(i) the family (1,2i) is rationally independent and has houses 1,2≤δ²=4, but its integral span has index 2 in 𝓞 K; it must be accepted by the theorem without being labeled an integral basis.

**Inputs.** `EffectiveBoundsCompactModels:CM.0/first-half-minima`; `EffectiveBoundsCompactModels:CM.0/product-span`; `mathlib:NumberField.house_mul_le`.

**Source.** Couveignes, Proposition 1, p. 490. The proof route identifies the arithmetic specialization and the imported generic statement.

## CM.1 — Integral parameters and full first jets

### Integral parameter tuples

**Construction:** `NumberField.CompactModel.parameterTuple`.

For α:Fin n→𝓞 K and u:Fin n→Fin r→ℤ, define κⱼ=Σᵢ uᵢⱼαᵢ in 𝓞 K. The construction admits arbitrary signed integer parameters; the existence theorem chooses parameters in the inclusive box 0≤uᵢⱼ≤dn(r+1).

**Proof route.** Use the native ℤ-module structure of the ring of integers and finite sums.

**API.**

- `NumberField.CompactModel.parameterTuple_apply` (simp): The j-th coordinate is Σᵢ uᵢⱼαᵢ.

- `NumberField.CompactModel.parameterTuple_embedding` (functoriality): Every embedding τ sends κⱼ to Σᵢ uᵢⱼτ(αᵢ).

- `NumberField.CompactModel.parameterTuple_house` (compatibility): If |uᵢⱼ|≤B and house αᵢ≤A with A,B≥0, house κⱼ≤nBA.

**Unit tests.** Each statement is an example in the suggested file.

- `NumberField.CompactModel.parameterTuple_zero` (degenerate): All-zero parameters give all-zero κ.

- `NumberField.CompactModel.parameterTuple_coordinate` (computation): A column with a single coefficient 1 and all others 0 returns that αᵢ.

- `NumberField.CompactModel.parameterTuple_negative` (computation): A single −1 coefficient returns −αᵢ, so signed parameters are not truncated.

**Acceptance.** Establish the stated bound or equivalence with the exact constants, ranks and inclusive inequalities.

**Inputs.** `EffectiveBoundsCompactModels:CM.0/short-integers`.

**Source.** Couveignes, §3, pp. 491–492. The proof route identifies the arithmetic specialization and the imported generic statement.

### Bounded full-jet parameters

**Theorem:** `NumberField.CompactModel.parameterJetChoice`.

Let n=[K:ℚ], r≥1,d≥5 and M=choose(d+r,d)≥n(r+1). For an independent integral family α with houses≤δ² there exist parameters 0≤uᵢⱼ≤B=dn(r+1) for which the distinct embedding points Pτ=(τκⱼ) have surjective degree-≤d first-jet evaluation over ℂ. Every |τκⱼ|≤n²d(r+1)δ².

**Proof route.** The embeddings matrix of the ℚ-basis α is invertible. On each of the r columns it gives an invertible linear change from parameters to point coordinates. Pull back a nonzero generic jet minor supplied by GI.5; its polynomial is nonzero and each parameter degree≤dn(r+1). Apply the native Nullstellensatz box lemma to the B+1 distinct integer values in ℂ. This argument allows complex coefficients and does not assume that the pulled-back minor has integer coefficients. The house estimate follows from parameterTuple_house.

**Acceptance.** Establish the stated bound or equivalence with the exact constants, ranks and inclusive inequalities.

**Inputs.** `EffectiveBoundsCompactModels:CM.1/parameter-tuple`; `GenericDoublePointInterpolation:GI.5/generic-affine`; `GenericDoublePointInterpolation:GI.5/minor-degree`; `mathlib:MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`.

**Source.** Couveignes, §3, pp. 491–492. The proof route identifies the arithmetic specialization and the imported generic statement.

### Degree-bounded evaluation surjectivity

**Theorem:** `NumberField.CompactModel.evaluationSurjective`.

For κ produced by parameterJetChoice, degree-≤d evaluation ℚ[x₁,…,xᵣ]≤d→K is surjective, and the unrestricted ℚ-algebra map aeval κ is surjective. After extension to ℂ, the value-kernel gradients surject onto ⊕τℂ^r. Consequently κ generates K over ℚ; no integral-surjectivity assertion is made.

**Proof route.** Use GI.1’s first-jet/value/gradient split, the embeddings identification K⊗ℂ≃ℂ^n and faithful extension of scalars to descend the full rank of the value map. Surjectivity of the degree-bounded map implies that of the full algebra map.

**Acceptance.** K=ℚ(i), κ=2i gives rational generation although ℤ[2i]≠ℤ[i].

**Inputs.** `EffectiveBoundsCompactModels:CM.1/parameter-jet-choice`; `GenericDoublePointInterpolation:GI.1/jet-kernel-split`; `GenericDoublePointInterpolation:GI.1/first-jet-map`.

**Source.** Couveignes, §3, pp. 492–493. The proof route identifies the arithmetic specialization and the imported generic statement.

## CM.2 — Saturated relations and finite-index covolumes

### Integral bounded evaluation

**Construction:** `NumberField.CompactModel.evalIntegral`.

In GI.0 coefficient coordinates, Vℤ=ℤ^𝓜 with 𝓜={a∈ℕ^r:Σaⱼ≤d}, define the ℤ-linear map ε(c)=Σa cₐκ^a into 𝓞 K. It is exactly native aeval on MvPolynomial.restrictTotalDegree, transported along GI.0’s coefficient equivalence.

**Proof route.** Evaluate each monomial in the native ring of integers and extend ℤ-linearly. Use the supplied coefficient equivalence, rather than define a second bounded polynomial type.

**API.**

- `NumberField.CompactModel.evalIntegral_apply` (simp): ε(c)=Σa cₐκ^a.

- `NumberField.CompactModel.evalIntegral_monomial` (simp): The coordinate unit vector at a maps to κ^a.

- `NumberField.CompactModel.evalIntegral_polynomial` (compatibility): For a native bounded polynomial p, ε(coeff p)=aeval κ p.

**Unit tests.** Each statement is an example in the suggested file.

- `NumberField.CompactModel.evalIntegral_constants` (degenerate): At d=0 evaluation sends the sole coefficient c to c·1.

- `NumberField.CompactModel.evalIntegral_zeroTuple` (computation): At κ=0 only the constant coefficient contributes.

- `NumberField.CompactModel.evalIntegral_square` (computation): For r=1,d=2,κ=2, the coefficient vector of x² evaluates to 4, not 2.

**Acceptance.** Establish the stated bound or equivalence with the exact constants, ranks and inclusive inequalities.

**Inputs.** `GenericDoublePointInterpolation:GI.0/coefficient-coordinates`; `mathlib:MvPolynomial.restrictTotalDegree`; `mathlib:MvPolynomial.aeval`.

**Source.** Couveignes, §3, p. 493. The proof route identifies the arithmetic specialization and the imported generic statement.

### Saturated relation lattice

**Definition:** `NumberField.CompactModel.relationLattice`.

Define Lκ,d=ker ε as a native ℤ-submodule of Vℤ. Give its real span W the Euclidean inner product making the admissible monomials orthonormal, and give L its intrinsic covolume in W. Once εℚ is onto, rankℤL=M−n=ℓ and W=ker εℝ. Saturated means that for a≠0 in ℤ, ac∈L implies c∈L.

**Proof route.** Use the native linear-map kernel. Saturation follows from torsion-freeness of 𝓞 K. Rational evaluation has rank n; scalar extension commutes with this kernel. Embed coefficient vectors in the Euclidean space of dimension M, restricting measure to W; never take ambient M-dimensional volume of a lower-rank lattice.

**API.**

- `NumberField.CompactModel.relationLattice_mem` (characterisation): c∈L iff ε(c)=0.

- `NumberField.CompactModel.relationLattice_saturated` (structure): a≠0 and ac∈L imply c∈L.

- `NumberField.CompactModel.relationLattice_rank` (compatibility): If bounded rational evaluation is onto, rank L=M−n and its scalar-extended span is the real evaluation kernel.

**Unit tests.** Each statement is an example in the suggested file.

- `NumberField.CompactModel.relationLattice_zeroTuple` (computation): For κ=0,d≥1, the vector of x₁ is a relation.

- `NumberField.CompactModel.relationLattice_constant` (non-example): The vector of the constant polynomial 1 is never a relation.

- `NumberField.CompactModel.relationLattice_scaledQuadratic` (non-example): If i²=−1 in K and κ=2i, x²+4 is a relation but x²+1 is not.

**Acceptance.** Establish the stated bound or equivalence with the exact constants, ranks and inclusive inequalities.

**Inputs.** `EffectiveBoundsCompactModels:CM.2/integral-evaluation`; `EffectiveBoundsCompactModels:CM.1/evaluation-surjective`; `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-square-gram`.

**Source.** Couveignes, §3, p. 493. The proof route identifies the arithmetic specialization and the imported generic statement.

### Transpose evaluation image

**Construction:** `NumberField.CompactModel.transposeImage`.

Define Dκ,d in Vℤ to be the image of Homℤ(𝓞 K,ℤ) under f↦(f(κ^a))a. This is the native dual evaluation map followed by the coefficient dot-product identification Vℤ≃Vℤ∨. It is contained in L⊥ℤ=W⊥∩Vℤ; once εℚ is onto both have rank n and D has finite index q=[L⊥ℤ:D]≥1.

**Proof route.** Use LinearMap.dualMap and GI.0’s monomial coefficient pairing. Every relation is annihilated. The rational transpose has rank n, so the two integral lattices have the same span and a finite positive relative index.

**API.**

- `NumberField.CompactModel.transposeImage_mem` (characterisation): v∈D iff there is f:Homℤ(𝓞 K,ℤ) with vₐ=f(κ^a).

- `NumberField.CompactModel.transposeImage_orthogonal` (relation): For v∈D and c∈L, Σa vₐcₐ=0.

- `NumberField.CompactModel.transposeImage_finiteIndex` (compatibility): If εℚ is onto then [L⊥ℤ:D] is a positive finite integer; equality of D with L⊥ℤ is not presumed.

**Unit tests.** Each statement is an example in the suggested file.

- `NumberField.CompactModel.transposeImage_rational` (computation): For K=ℚ,κ=2,d=1, D=ℤ(1,2) and annihilates ℤ(−2,1).

- `NumberField.CompactModel.transposeImage_strictIndex` (non-example): For K=ℚ(i),κ=2i,d=1, in the integral basis (1,i), D=ℤ(1,0)+ℤ(0,2), L=0 and [L⊥ℤ:D]=2.

- `NumberField.CompactModel.transposeImage_constant` (degenerate): For K=ℚ,d=0, D is the full one-coordinate integer lattice.

**Acceptance.** Establish the stated bound or equivalence with the exact constants, ranks and inclusive inequalities.

**Inputs.** `EffectiveBoundsCompactModels:CM.2/relation-lattice`; `mathlib:LinearMap.dualMap`.

**Source.** Couveignes, §3, p. 493. The proof route identifies the arithmetic specialization and the imported generic statement.

### Finite-index discriminant identity

**Theorem:** `NumberField.CompactModel.finiteIndexGram`.

Assume εℚ is onto. In any actual integral basis b of 𝓞 K, let B be the n×M integer coordinate matrix of ε and Aτ,a=τ(κ^a). Then q² covol(L)² = covol(D)² = det(B Bᵀ) = det(A A*)/|disc K|, where q=[L⊥ℤ:D]. All determinants on the right are real and positive, and A* is conjugate transpose. The covolumes use intrinsic coefficient Euclidean measure.

**Proof route.** GN.0’s primitive orthogonal-covolume theorem applies to the saturated kernel inside the unimodular coefficient lattice. The finite-index change-of-volume gives covol(D)=q covol(L). Gram determinants compute the transpose image volume. The genuine integral-basis embeddings matrix changes B to A and its determinant has squared modulus |disc K|.

**Acceptance.** For κ=2i,d=1 the identity reads 4=16/4; omitting the index or treating α as an integral basis fails.

**Inputs.** `EffectiveBoundsCompactModels:CM.2/transpose-image`; `GeometryOfNumbersAndQuadraticArithmetic:GN.0/primitive-orthogonal-covolume`; `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-square-gram`; `mathlib:ZLattice.covolume_div_covolume_eq_relIndex`.

**Source.** Couveignes, §3, p. 493. The proof route identifies the arithmetic specialization and the imported generic statement.

### Relation covolume bound

**Theorem:** `NumberField.CompactModel.relationCovolume`.

For bounded full-jet κ let C=(n²d(r+1))^d δ^(2d) and D₀=M C². Then covol(L)≤D₀^(n/2)/√|disc K|≤D₀^(n/2). In particular all embedding evaluation entries are≤C in modulus. The coefficient Euclidean metric is unrelated to the supremum metric used to find α.

**Proof route.** Bound each monomial using degree≤d and n²d(r+1)δ²≥1. Every diagonal entry of A A* is≤M C². Apply Hermitian Gram Hadamard, then finiteIndexGram with q≥1 and |disc K|≥1.

**Acceptance.** Establish the stated bound or equivalence with the exact constants, ranks and inclusive inequalities.

**Inputs.** `EffectiveBoundsCompactModels:CM.2/finite-index-gram`; `EffectiveBoundsCompactModels:CM.1/parameter-jet-choice`; `GeometryOfNumbersAndQuadraticArithmetic:GN.0/hermitian-gram-hadamard`.

**Source.** Couveignes, §3, pp. 493–494. The proof route identifies the arithmetic specialization and the imported generic statement.

## CM.3 — Short equations and Jacobian-open components

### Truncated short relations

**Theorem:** `NumberField.CompactModel.shortRelations`.

Set ℓ=M−n and k=ℓ+1−n. Under d≥5,r≥1,M≥n(r+1), ℓ≥nr≥1 and k≥r. There are ℓ independent integral relations Eᵢ ordered by coefficient ℓ² norm, with each norm≥1, product≤ℓ^(ℓ/2)D₀^(n/2). Retaining exactly the first k gives norm and every coefficient≤H₀=ℓ^(ℓ/(2n))√M(n²d(r+1))^dδ^(2d). Their span has codimension n−1 in the full relation space.

**Proof route.** Apply GN.1’s intrinsic Euclidean ball lower bound and second theorem in W, then its genuine simultaneous minimum witnesses. Integral nonzero coefficient vectors have norm≥1. The ordered-product root bound has denominator ℓ−i; for zero-based i<k this is≥n. Independence gives precisely the asserted codimension.

**Acceptance.** Establish the stated bound or equivalence with the exact constants, ranks and inclusive inequalities.

**Inputs.** `EffectiveBoundsCompactModels:CM.2/relation-covolume`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1/intrinsic-ball-lower-bound`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-witnesses`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1/ordered-product-root-bound`.

**Source.** Couveignes, §3, p. 494. The proof route identifies the arithmetic specialization and the imported generic statement.

### A full-rank gradient block

**Theorem:** `NumberField.CompactModel.fullRankBlock`.

Let J:Lℂ→⊕τℂ^r be the surjective gradient map and U the span of the k retained relations, of codimension n−1. There is one embedding τ for which the projection J(U)→ℂ^r is onto. This assertion does not say that every block is automatically onto by dimension alone.

**Proof route.** The image J(U) has codimension at most n−1. If every block projection were deficient, choose a nonzero covector on each of the n blocks vanishing on that projection. These block-supported covectors are independent and annihilate J(U), forcing codimension≥n.

**Acceptance.** Establish the stated bound or equivalence with the exact constants, ranks and inclusive inequalities.

**Inputs.** `EffectiveBoundsCompactModels:CM.3/short-relations`; `EffectiveBoundsCompactModels:CM.1/evaluation-surjective`.

**Source.** Couveignes, §3, p. 494, cotangent-space argument. The proof route identifies the arithmetic specialization and the imported generic statement.

### A common nonzero Jacobian minor

**Theorem:** `NumberField.CompactModel.commonMinor`.

Choose r of the retained integral relations whose gradient determinant is nonzero at the full-rank embedding point. For these same r equations, J(κ)=det(∂Eᵢ/∂xⱼ(κ)) is a nonzero element of K and τ(J(κ))≠0 for every embedding τ. Their degrees are≤d and their coefficients are≤H₀.

**Proof route.** Select an r×r minor of the one full-rank block. Evaluation and formal partial derivatives commute with embeddings, so it equals the image of one element of K. Injectivity of any field embedding propagates nonvanishing of that same determinant. No assumption that K is Galois and no independent choices of minors at different embeddings are needed.

**Acceptance.** Establish the stated bound or equivalence with the exact constants, ranks and inclusive inequalities.

**Inputs.** `EffectiveBoundsCompactModels:CM.3/full-rank-block`; `mathlib:MvPolynomial.pderiv`.

**Source.** Couveignes, §3, pp. 494–495. The proof route identifies the arithmetic specialization and the imported generic statement.

### Jacobian-open arithmetic models

**Construction:** `NumberField.CompactModel.modelAlgebra`.

For an ordered r-tuple E of integer polynomials in r variables, base change coefficients to ℚ, form R=ℚ[x]/(E₁,…,Eᵣ), and define A_E=R[J_E^−1] using native Ideal.Quotient and Localization.Away. J_E is the determinant of the formal derivative matrix. This is the coordinate algebra of the Jacobian-open part, and can be the zero ring.

**Proof route.** Specialize SF.0’s native Jacobian localization; quotient by the actual ideal of equations and localize at the actual determinant. It is finite étale over ℚ. For a generating κ annihilating E with J_E(κ)≠0, the quotient and localization universal properties give a unique surjective ℚ-algebra map A_E→K.

**API.**

- `NumberField.CompactModel.modelAlgebra_finiteEtale` (structure): A_E is finite-dimensional and étale over ℚ, allowing the zero algebra.

- `NumberField.CompactModel.modelAlgebra_lift` (universal-property): A tuple in a ℚ-algebra annihilating E whose evaluated J is a unit induces a unique algebra map A_E→the algebra; it sends each variable to the tuple.

- `NumberField.CompactModel.modelAlgebra_fieldFactor` (compatibility): If that map to a field K is onto, its kernel is maximal and K is a direct factor, hence Spec K is an open-and-closed irreducible component of Spec A_E.

**Unit tests.** Each statement is an example in the suggested file.

- `NumberField.CompactModel.modelAlgebra_repeatedRoot` (degenerate): For r=1,E=x², J=2x and A_E is the zero algebra; the repeated root contributes no component.

- `NumberField.CompactModel.modelAlgebra_twoRational` (computation): For E=x²−1, A_E≃ℚ×ℚ as ℚ-algebras, with two components.

- `NumberField.CompactModel.modelAlgebra_extraDimension` (non-example): For r=2,E=(xy,x(y−1)), V(E) is a line but its Jacobian-open algebra is zero; the whole zero locus need not be zero-dimensional.

**Acceptance.** Establish the stated bound or equivalence with the exact constants, ranks and inclusive inequalities.

**Inputs.** `EffectiveBoundsCompactModels:CM.3/common-minor`; `SchemeAndStackFoundations:SF.0/jacobian-etale-algebra`; `mathlib:Localization.Away`.

**Source.** Couveignes, §3, Proposition 2, p. 495. The proof route identifies the arithmetic specialization and the imported generic statement.

### Explicit compact model bound

**Theorem:** `NumberField.CompactModel.explicitModel`.

For every degree-n number field K, r≥1,d≥5,M=choose(d+r,d)≥n(r+1), and ℓ=M−n, there exist r integer polynomials of total degree≤d and coefficient absolute value≤ℓ^(ℓ/(2n))√M(n²d(r+1))^dδ^(2d), and a surjective ℚ-algebra map A_E→K. Thus Spec K is one irreducible component of the finite étale Jacobian-open model.

**Proof route.** Combine shortIntegers, parameterJetChoice, saturated relations, the truncated minima bound and commonMinor. Use evaluationSurjective and modelAlgebra_lift to get the quotient map to K; constants and the generating tuple ensure surjectivity. Apply the field-factor API from SF.0.

**Acceptance.** The coefficient bound is the exact Proposition 2 expression, not an asymptotic replacement. The presentation describes K as a component over ℚ, not 𝓞 K as an integral quotient.

**Inputs.** `EffectiveBoundsCompactModels:CM.0/short-integers`; `EffectiveBoundsCompactModels:CM.1/parameter-jet-choice`; `EffectiveBoundsCompactModels:CM.3/model-algebra`; `EffectiveBoundsCompactModels:CM.3/common-minor`.

**Source.** Couveignes, Proposition 2, p. 495. The proof route identifies the arithmetic specialization and the imported generic statement.

## CM.4 — Central-binomial parameters and uniform models

### Least central-binomial parameter

**Definition:** `NumberField.CompactModel.centralParameter`.

For n≥1 define r(n) as the least positive integer r satisfying n(r+1)≤choose(2r,r), and put d(n)=r(n). For a total natural-number API set r(0)=1. Existence follows from exponential growth; the eventual model theorem still requires n large enough that r(n)≥5.

**Proof route.** The lower bound choose(2r,r)≥2^r implies that choose(2r,r)/(r+1) tends to infinity. Choose the least positive witness, not an arbitrary large parameter.

**API.**

- `NumberField.CompactModel.centralParameter_spec` (characterisation): r(n)>0 and n(r(n)+1)≤choose(2r(n),r(n)).

- `NumberField.CompactModel.centralParameter_minimal` (characterisation): If 0<s<r(n), then choose(2s,s)<n(s+1).

- `NumberField.CompactModel.centralParameter_mono` (relation): n≤m implies r(n)≤r(m).

**Unit tests.** Each statement is an example in the suggested file.

- `NumberField.CompactModel.centralParameter_one` (computation): r(1)=1, which lies outside d≥5.

- `NumberField.CompactModel.centralParameter_two` (computation): r(2)=2: choose(4,2)=6=2·3.

- `NumberField.CompactModel.centralParameter_three` (computation): r(3)=3: at r=2 the capacity is 6<9; at r=3 it is 20≥12.

**Acceptance.** Establish the stated bound or equivalence with the exact constants, ranks and inclusive inequalities.

**Inputs.** Elementary natural-number inequalities and finite minimization..

**Source.** Couveignes, §4, p. 495. The proof route identifies the arithmetic specialization and the imported generic statement.

### Effective central-binomial estimates

**Theorem:** `NumberField.CompactModel.centralEstimates`.

With n≥65536, L=log n, r=r(n), M=choose(2r,r), ℓ=M−n, we have 5≤r≤3L, n(r+1)≤M<4n(r+1)≤16nL, ℓ/(2n)≤8L, log M and log ℓ≤3L, and log(r(r+1))≤2L. For δ≥1, the explicit coefficient bound with d=r is≤(nδ)^(40L).

**Proof route.** Take r₀=ceil(2L/log2). Since r₀≥6 and r₀+1≤2^(r₀/2), choose(2r₀,r₀)≥2^r₀≥n(r₀+1); hence r≤r₀≤3L. Minimality and the ratio of consecutive choose(2r,r)/(r+1), strictly below 4, give M<4n(r+1). Elementary logarithmic inequalities at L≥log65536 give the displayed estimates. The four logarithmic contributions to the height are at most 24L², 1.5L, 12L² and 6L logδ, absorbed by 40L²+40L logδ.

**Acceptance.** r(1)=1 prevents claiming d≥5 uniformly in all degrees. Verify the strict minimality step at r−1 and retain the inclusive capacity inequality.

**Inputs.** `EffectiveBoundsCompactModels:CM.4/central-parameter`; `EffectiveBoundsCompactModels:CM.3/explicit-model`.

**Source.** Couveignes, §4, equation (1), pp. 495–496 (explicit threshold and constants supplied by this proof). The proof route identifies the arithmetic specialization and the imported generic statement.

### Uniform logarithmic-size models

**Theorem:** `NumberField.CompactModel.uniformModel`.

There is one absolute constant Q=65536 such that every degree n≥Q number field admits r,d≤Q log n, M≤Qn log n and r integer equations of degree≤d with all coefficients≤(nδ)^(Q log n), whose Jacobian-open model contains Spec K as an irreducible component. The stronger choices d=r=r(n) and height≤(nδ)^(40 log n) are retained for counting.

**Proof route.** Apply explicitModel with the least central parameter and use centralEstimates. Increasing the exponent from 40 to Q is valid since nδ≥1. The same constant Q is used for threshold, parameter and height bounds.

**Acceptance.** Establish the stated bound or equivalence with the exact constants, ranks and inclusive inequalities.

**Inputs.** `EffectiveBoundsCompactModels:CM.4/central-estimates`; `EffectiveBoundsCompactModels:CM.3/explicit-model`.

**Source.** Couveignes, Theorem 1, p. 487; §4, pp. 495–496. The proof route identifies the arithmetic specialization and the imported generic statement.

## CM.5 — Coefficient enumeration and unweighted field counts

### Finite equation coefficient boxes

**Definition:** `NumberField.CompactModel.coefficientBox`.

For natural r,d,B, define the set ℬ(r,d,B) of ordered r-tuples of native integer polynomials whose total degrees are≤d and every coefficient has absolute value≤B. Equivalently it is the product of rM copies of the integer interval [−B,B], using GI.0’s coefficient coordinates. Zero polynomials and zero equations are included.

**Proof route.** Use the native bounded-degree submodule and the supplied coefficient equivalence. The interval is inclusive and B is a natural number.

**API.**

- `NumberField.CompactModel.coefficientBox_mem` (characterisation): Membership is exactly degree≤d and |coeff|≤B, for every equation and exponent.

- `NumberField.CompactModel.coefficientBox_finite` (structure): ℬ(r,d,B) is finite, including r=0,d=0,B=0.

- `NumberField.CompactModel.coefficientBox_mono` (relation): Increasing B or d gives an inclusion of boxes for fixed r.

**Unit tests.** Each statement is an example in the suggested file.

- `NumberField.CompactModel.coefficientBox_zeroHeight` (degenerate): With B=0 the unique tuple has every equation zero.

- `NumberField.CompactModel.coefficientBox_constants` (computation): For r=1,d=0,B=1 the box has exactly three elements: −1,0,1.

- `NumberField.CompactModel.coefficientBox_endpoint` (computation): For r=1,d=1,B=2, 2x−2 belongs to the box but 3x does not.

**Acceptance.** Establish the stated bound or equivalence with the exact constants, ranks and inclusive inequalities.

**Inputs.** `GenericDoublePointInterpolation:GI.0/coefficient-coordinates`; `mathlib:MvPolynomial.restrictTotalDegree`.

**Source.** Couveignes, §4, p. 496. The proof route identifies the arithmetic specialization and the imported generic statement.

### Exact coefficient enumeration

**Theorem:** `NumberField.CompactModel.coefficientBoxCard`.

The unweighted cardinality of ℬ(r,d,B) is (2B+1)^(r·choose(d+r,d)). If a real height bound F≥0 bounds integer coefficients, membership is exactly the bound B=⌊F⌋₊; the floor must be preserved before counting.

**Proof route.** The coefficient equivalence makes the box a finite product of rM copies of [−B,B], each of size 2B+1. Integer absolute values≤F iff they are≤floor₊F. No sparsity, monicity or nonsingularity filter is assumed.

**Acceptance.** At r=1,d=0,B=1 the exact count is 3; replacing 2B+1 by 2B loses the zero choice.

**Inputs.** `EffectiveBoundsCompactModels:CM.5/coefficient-box`.

**Source.** Couveignes, §4, p. 496. The proof route identifies the arithmetic specialization and the imported generic statement.

### Isomorphism classes of model components

**Construction:** `NumberField.CompactModel.componentClass`.

Use ST.0’s embedded finite extensions in ℚbar and its quotient by ℚ-algebra isomorphism. For a finite-dimensional commutative ℚ-algebra A and a maximal ideal p, send p to the class of the residue field A/p, embedded in ℚbar by any ℚ-embedding. This class is independent of that embedding. Apply it to A_E; no weight by automorphisms or embeddings is attached.

**Proof route.** A maximal quotient of a finite-dimensional ℚ-algebra is a finite number field and embeds in ℚbar. The chosen embedded copy has a well-defined ST.0 quotient class because any two copies are ℚ-isomorphic. Characterize the class through any surjective algebra map with kernel p.

**API.**

- `NumberField.CompactModel.componentClass_quotient` (characterisation): For any surjective φ:A→ₐℚK with kernel p, componentClass(p) equals the class of K.

- `NumberField.CompactModel.componentClass_embedding` (functoriality): Changing the embedding A/p→ℚbar leaves its quotient class unchanged.

- `NumberField.CompactModel.componentClass_finiteImage` (structure): The image of the component-class map is finite; distinct components may have the same class.

**Unit tests.** Each statement is an example in the suggested file.

- `NumberField.CompactModel.componentClass_repeatedRoot` (degenerate): For E=x² the component domain and its image are empty.

- `NumberField.CompactModel.componentClass_twoRational` (non-example): For E=x²−1 the domain has two components but its class image is the singleton [ℚ].

- `NumberField.CompactModel.componentClass_twoQuadratics` (computation): For E=(x²−2)(x²−3), the class image consists of the two distinct classes [ℚ(√2)] and [ℚ(√3)].

**Acceptance.** Establish the stated bound or equivalence with the exact constants, ranks and inclusive inequalities.

**Inputs.** `ArithmeticStatistics:ST.0/number-fields-ordered-by-discriminant`; `EffectiveBoundsCompactModels:CM.3/model-algebra`.

**Source.** Couveignes, §4, p. 496, multiple-field-component observation. The proof route identifies the arithmetic specialization and the imported generic statement.

### Isolated-component Bézout bound

**Theorem:** `NumberField.CompactModel.isolatedComponents`.

For r≥1 and r equations of degrees≤d over ℚ, the number of maximal ideals of their Jacobian-open algebra is finite and≤d^r. More precisely after extension to an algebraic closure its isolated local lengths sum to≤the product of positive equation degrees≤d^r; each Jacobian-open geometric point is simple. Other components of the whole zero locus may have positive dimension. A zero equation or constant nonzero equation yields an empty Jacobian-open part.

**Proof route.** Use the requested SF.5 arbitrary-dimensional isolated-intersection bound after homogenizing in projective r-space. Restrict to affine isolated points and use the nonzero determinant to give local length 1. Finite étale factors each contribute at least one geometric point, so the component count is no larger. Handle zero or constant equations separately before using positive degrees.

**Acceptance.** Do not replace this by SF.5’s two-plane-curve result when r>2. The line-only example (xy,x(y−1)) has zero Jacobian-open components.

**Inputs.** `EffectiveBoundsCompactModels:CM.3/model-algebra`; `SchemeAndStackFoundations:SF.5`.

**Source.** Couveignes, §4, p. 496, intersection-number argument. The proof route identifies the arithmetic specialization and the imported generic statement.

### Bounded models cover field classes

**Theorem:** `NumberField.CompactModel.finiteSurjection`.

For n≥65536 and real H≥1, put r=d=r(n), M=choose(2r,r), F=(n H^(1/n))^(40 log n), B=⌊F⌋₊. The disjoint union, over E∈ℬ(r,d,B), of maximal ideals of A_E maps by componentClass onto ST.0’s unweighted set of exact-degree-n ℚ-isomorphism classes with |disc|≤H, after restricting the domain to components satisfying that cutoff. Its domain cardinality is at most (2B+1)^(rM)d^r.

**Proof route.** For every field in the cutoff, δ≤H^(1/n); uniformModel in its stronger 40-exponent form supplies a tuple in the box and a surjective map A_E→K. Its kernel maps to the required class. Bound all components in the full finite union by isolatedComponents and coefficientBoxCard. Do not select an injective map from field classes to equation tuples.

**Acceptance.** Multiple fields can share an equation tuple; the factor d^r accounts for this. Different embedded copies or multiple equal residue factors count a class once.

**Inputs.** `EffectiveBoundsCompactModels:CM.4/uniform-model`; `EffectiveBoundsCompactModels:CM.5/coefficient-box-card`; `EffectiveBoundsCompactModels:CM.5/component-class`; `EffectiveBoundsCompactModels:CM.5/isolated-components`; `ArithmeticStatistics:ST.0/number-fields-ordered-by-discriminant`.

**Source.** Couveignes, Theorem 2, p. 487; §4, p. 496. The proof route identifies the arithmetic specialization and the imported generic statement.

### Degree-sensitive field count

**Theorem:** `NumberField.CompactModel.fieldCount`.

For the same absolute Q=65536, every integer n≥Q and real H≥1 satisfy Nₙ(H)≤n^(Q n (log n)^3) H^(Q (log n)^3), where Nₙ(H) is the ordinary cardinality of exact-degree-n number fields up to ℚ-isomorphism with |disc|≤H. The bound is inclusive, unweighted and uniform in both variables.

**Proof route.** Retain the finite bound (2floor₊F+1)^(rM)d^r. With L=log n use rM≤48nL², logF=40L²+(40L/n)logH, log(2floor₊F+1)≤log3+logF, and log(d^r)≤3L². The logarithm of the finite bound is≤2000nL⁴+1920L³logH, which is≤QnL⁴+QL³logH. Exponentiate; the n-power has exponent QnL³. ST.0 supplies the carrier and baseline Hermite finiteness, not this asymptotic estimate. For the finiteness bridge, ST.0’s isoFamily is the quotient image of the finite fixed-ambient embedded family. For real H≥1 use the integer cutoff floor₊H, then restrict to degree n and take the quotient image. This imports ST.0’s Northcott argument and the existing explicit Hermite infrastructure rather than defining another arithmetic family.

**Acceptance.** At H=1 the H-factor is 1; no logH division occurs. n=1 is outside the asserted threshold; no false r≥5 claim follows. No dependence on ArithmeticStatistics:ST.3, nor any algorithmic runtime claim.

**Inputs.** `EffectiveBoundsCompactModels:CM.5/finite-surjection`; `EffectiveBoundsCompactModels:CM.4/central-estimates`; `mathlib:NumberField.finite_of_discr_bdd`; `tauceti:NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le`.

**Source.** Couveignes, Theorem 2, p. 487; §4, p. 496. The proof route identifies the arithmetic specialization and the imported generic statement.

## Final enumeration and the SF.5 boundary

The exact finite expression precedes every logarithmic estimate. For
n≥65536, r=d=r(n), and H≥1, put

\[
 F=(nH^{1/n})^{40\log n},\qquad B=\lfloor F\rfloor_{\mathbb N}.
\]

Each field in the cutoff has root discriminant at most H^(1/n) and therefore
comes from one equation tuple in the inclusive box. The finite union of model
components maps onto the cutoff classes. A tuple can contribute several
classes, and distinct components can contribute one class. The bound is

\[
 N_n(H)\le (2B+1)^{r\binom{2r}{r}}r^r.
\]

The isolated-point input is precisely this: for r≥1 positive-degree homogeneous
forms f₁,…,fᵣ in projective r-space over an algebraically closed field of
characteristic zero, the sum of the local intersection lengths at their
isolated common points is at most ∏deg(fᵢ), even if the common zero locus has
other components of positive dimension. Homogenization places the affine
Jacobian-open points among those isolated points. Their Jacobian criterion
makes their local lengths one. Every rational finite étale field factor
contributes its positive degree many geometric points, so the number of factors
is bounded too. Zero equations have a zero derivative row and hence empty
Jacobian-open locus. A nonzero constant equation has empty zero locus. Those
cases are dealt with before appealing to positive-degree projective forms.
This is the exact extension requested of SF.5. It is the only open supplier
request in this plan, and is part of the dependency contract for CM.5.

For clarity, the explicit constants can be checked without Big-O notation.
Write L=log n. The least-parameter inequalities give rM≤48nL² and
log(r^r)≤3L². Since F≥1 and B≤F,

\[
 \log(2B+1)\le\log 3+40L^2+(40L/n)\log H.
\]

Thus the logarithm of the finite expression is at most
2000nL⁴+1920L³log H. It is no larger than
65536nL⁴+65536L³log H. Exponentiating gives the stated n-power and H-power.
The threshold applies to n only, and H=1 is permitted. No division by log H
is used. For n=1, the least parameter is 1 and the degree-five interpolation
hypothesis fails; the uniform theorem does not claim otherwise.

## Baseline and source record

The checked baseline is Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Native root discriminants, mixed
embeddings, houses, bounded multivariate polynomial spaces, algebra evaluation,
partial derivatives, dual maps, localizations and finite-index covolume ratios
were read in those sources. The product-grid input is
`MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`, whose domain hypothesis and
strict degree-versus-grid-cardinality inequality are exactly what CM.1 uses.
Existing `NumberField.finite_of_discr_bdd` and Tau Ceti's
`NumberTheory.EffectiveBounds.HermiteCount.Basic` are retained as library
finiteness inputs. The current upstream Completed/EffectiveBounds and
GlobalNumberFields documents were read as the neighboring roadmap models;
IntegralLattices and the current Tau Ceti library were checked for duplicate
ownership. The newer current source is used for that overlap audit, not as
proof of availability at the pinned commits.

The mathematical source is the published Annals version of Couveignes’s paper,
read in full, including the references, on 11 October 2026:
[Enumerating number fields](https://annals.math.princeton.edu/2020/192-2/p04),
DOI 10.4007/annals.2020.192.2.4. The accessible publisher PDF has SHA-256
`8d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104`.
The model target is Proposition 2, p. 495; the short integers are Proposition 1,
p. 490; the two final estimates are Theorems 1–2, p. 487, proved in §4,
pp. 495–496. The fixed numeric threshold and constants in CM.4–CM.5 are
explicit elementary refinements of that argument. No verbatim source text or
source-by-source synopsis forms part of this roadmap.
