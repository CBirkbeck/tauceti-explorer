# Finite fields, character sums, finite rings and coding interfaces — FF.4 continuation

This is the target-level continuation of the accepted FiniteFieldsAndCharacterSums packet. The definitive plan is this document together with the matching packet. The suggested file proposes names and signatures; it does not implement the plan. The scope is FF.4 alone. Its coverage is **planned**, and the pass is **complete**: all inherited remaining mathematical targets have routes, but the six precise gaps and three supplier requests below prevent closure. All declarations retain unchecked implementation status.

## Dependencies and ownership

The algebraic part starts with FiniteFieldsAndCharacterSums:FF.0 and FF.1. Galois-ring units, polynomial composition, recurrences, cyclic ideals and the elementary Hermitian point count do not need Weil II or FF.3 factorization algorithms. FF.2 enters the norm-torus and finite-upper-half-plane estimates, and any general character-sum consequences that use its bounds. The proof chains below make this division explicit. A maintainer must apply the proposed stage-edge changes and regenerate depths; this issue changes no atlas data.

The immutable parent packet retains its 91 FF.4 nodes. They own finite local rings and Galois rings; linearized and permutation polynomials; recurrence and m-sequence machinery; Singleton, primitive narrow-sense BCH, Reed–Solomon and generalized Reed–Solomon codes; general evaluation/residue AG codes; and the finite upper half-plane, Hecke algebra and Ramanujan target. This continuation imports those IDs and supplies their missing inputs. Generic tensor–Hom contraction, trace duality, normal bases, skew polynomials, quotient polynomial bases and Vandermonde determinants are native Mathlib interfaces. They are baseline citations, not a second plan.

FF.4 owns q-linearized polynomials over commutative F_q-algebras, including the comparison with the native Frobenius SkewPolynomial. DrinfeldModulesAndTModules:DM.0 imports this interface and keeps Drinfeld modules. The parent field-only predicate must be generalized at assembly. In particular Frobenius on F_q[t] is an endomorphism with no inverse, so an automorphism-only Ore construction would be too restrictive.

## Conventions that determine the mathematics

For a finite extension E/F, q is |F| and n is [E:F]. Reduced linearized polynomials have exactly n coefficients, the unit X and multiplication by composition. Their evaluation algebra is End_F(E); ordinary polynomial multiplication is not its multiplication. Trace-dual bases use the native basis indexed by the actual finite-dimensional vector space. Coefficient subalgebras for m dividing n centralize the m-th power of relative Frobenius. With t=n/m their block-circulant realization uses t blocks of size m, and its matrix-polynomial quotient is by Y^t−1.

Walsh transforms include x=0, are unnormalized, and conjugate the frequency phase. Periodic correlations are Cψ(b,a;t)=Σ_i ψ(b_i) conjugate(ψ(a_(i+t))). Thus C+ψ(B(0)) equals the Walsh coefficient. Bentness fixes the magnitude of this shifted correlation; it does not fix its phase. Prime output alphabets admit the character-independence theorem; the cyclotomic transport input is recorded as a gap.

Gold and Kasami definitions keep their field towers and coefficient domains visible. A decimation can have full minimal-polynomial degree without being primitive. The Gold representative S(0,1) has full period only under the coprimality condition. Geometric feeds have codomain F_p and can have arbitrary value at zero; the omitted cross-correlation term has the order g then conjugate f. GMW requires a positive exponent coprime to |L|−1. Binary d-form correlation requires both d and k coprime to |L|−1.

Cyclic words use right shift and the actual native quotient AdjoinRoot(X^n−1). Positive length is explicit. The ideal correspondence, monic generator, check polynomial and dimension work even when the characteristic divides n. Only the consecutive-root BCH estimate requires a primitive n-th root, hence coprime characteristic. The zero code has generator X^n−1, check polynomial 1 and dimension zero. Minimum-distance inequalities for its default-valued numerical distance must carry a nonzero-code guard. The dual generator is h(0)⁻¹ times the true polynomial reverse of the check polynomial h.

For the Hermitian example p is prime and K has p² elements. Coordinates are all actual affine solutions of y^p+y=x^(p+1), with cardinality p³. The monomial message space uses i≤p and i+j≤l. Its dimension is the sum through min(p,l); the rectangular closed formula is valid only for l≥p−1. Injectivity and designed distance require l(p+1)<p³. The elementary code is defined before the requested native Hermitian curve model.

For Soto–Andrade sums, the norm-one group is the kernel of the native unit norm in a quadratic extension. Every multiplicative character, including the trivial one, takes value zero at zero in the sum. Both trivial characters are excluded from the bound; the second exception has both characters of exact order two and t=±2. The compact-support route uses weights at most one, not an assumed purity equality.

## Native function-field assembly

The parent prototype used provisional function-field interfaces. The pinned Tau Ceti library already provides the actual places, divisors, Riemann–Roch spaces and Weil differentials. Their replacement is a binding requirement, not a newly owned theory.

At a degree-one place P, integral evaluation is residue followed by the inverse of the native constants-to-residue algebra equivalence. Its domain is P.integers and its kernel is the maximal ideal. Constants provide surjectivity. The direction of the native equivalence matters: it goes from the constant field to P.ResidueField.

For distinct rational places P_i and a divisor G with G.coeff(P_i)=0, set D=Σ_i P_i. Evaluate the native riemannRochSpace G into the native linear word space. The kernel is L(G−D), included in L(G); the image has dimension l(G)−l(G−D). IsFunctionField k H gives finite-dimensional Riemann–Roch spaces. Exact constants IsIntegrallyClosedIn k H are carried through the sharp divisor-degree, genus and designed-distance arguments. Nonzero words and positive length are guarded where needed.

The native Weil-differential filtration for G−D consists of linear forms on the native repartition space. Its residue coordinate at P_i is repartitionDualComponent(ω,P_i)(1). Orthogonality follows from the native global residue sum on f, and Riemann–Roch supplies the dimensions proving the residue image equals the Euclidean annihilator. There is no separate arbitrary differential carrier.

For RatFunc k, use the actual finite places attached to X−a and the actual infinity place, rather than labels for pretend places. Distinct constants give distinct places by the native injectivity theorem. Constants evaluate to themselves; 1/X evaluates to zero at infinity. Exact constants cannot be dropped in a general function-field comparison: over R⊂C(X), L(0) has R-dimension two, so a conclusion l(0)=1 would be false.

## Declarations, proof routes, APIs and tests

### Galois rings and principal 2-units

#### Torsion kernels in principal 2-units

**ID:** `FiniteFieldsAndCharacterSums:FF.4/principal-two-unit-torsion-count`  \
**Kind:** theorem. **Suggested name:** `principalTwoUnits_card_pow_eq_one`.

For S = GR(2^n,r), n ≥ 3 and r ≥ 1, set U = 1+2S. For 1 ≤ k ≤ n−2 the kernel of u ↦ u^(2^k) on U has 2^(rk+1) elements. At k=0 it has one element; for k ≥ n−1 it is all of U, of order 2^(r(n−1)). These counts and finite abelian classification supply the parent principal-unit decomposition.

Hypotheses: n ≥ 3, r ≥ 1; S has the parent unramified Galois-ring presentation.

Proof route:
1. Write u=1+2a with a unique modulo 2^(n−1). Squaring gives u²=1+4a(1+a). For b∈4S, squaring 1+b raises its nonzero 2-adic valuation by exactly one until it vanishes, since 2+b is 2 times a unit.
2. Thus u^(2^k)=1 iff a²+a is zero modulo 2^(n−k−1). In the residue field x²+x has exactly two roots, 0 and 1, each simple; the parent finite-local-ring Hensel property lifts them uniquely to 0 and −1. Each has 2^(rk) lifts modulo 2^(n−1).
3. Use the parent 2-adic expansion to count the two disjoint fibres. Apply the native finite abelian classification: logarithmic kernel increments are r+1 at k=1, r through k=n−2, and r−1 at k=n−1. Subtraction gives cyclic factors of orders 2, 2^(n−2) and (r−1) copies of 2^(n−1), agreeing with the parent even at n=3.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/galois-ring`, `FiniteFieldsAndCharacterSums:FF.4/finite-local-ring-is-henselian`, `FiniteFieldsAndCharacterSums:FF.4/p-adic-expansion-in-galois-ring`, `FiniteFieldsAndCharacterSums:FF.4/units-of-galois-ring`, `mathlib:CommGroup.equiv_prod_multiplicative_zmod_of_finite`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §4.5, p. 109; authored proof of the torsion-count step supplying the stated decomposition. The source states the decomposition; this node supplies its missing general-r argument without invoking a restricted book.

Acceptance:

- For n=3,r=2: 8 elements killed by 2 and 16 killed by 4, giving C4×C2×C2.
- For n=4,r=1: kernels have 4,8,8 elements, giving C4×C2.

### Linearized composition algebras

#### Frobenius Ore and linearized polynomial comparison

**ID:** `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`  \
**Kind:** construction. **Suggested name:** `oreToLinearized`.

Let F have q elements and R be a commutative F-algebra, with q ≥ 2. Give Multiplicative ℕ its action on R by iterates of φ(a)=a^q. The additive equivalence Θ:SkewPolynomial R ≃+ {P∈R[X] : every supported exponent is q^i} sends Σ a_i τ^i to Σ a_i X^(q^i). It intertwines Ore multiplication with polynomial composition, and carries 1 to X. The target uses the parent linearized-polynomial predicate; no ordinary polynomial multiplication is claimed.

Hypotheses: F finite field, q=|F|; R a commutative F-algebra, not necessarily a field or perfect.

Proof route:
1. Frobenius to the q-th power is an F-algebra endomorphism; form the native monoid action by iteration, without requesting an inverse.
2. Distinct exponents q^i give inverse coefficient extraction. Use the parent support predicate, not a new definition of additive polynomial.
3. The native monomial multiplication formula becomes (aX^(q^i))∘(bX^(q^j))=a b^(q^i) X^(q^(i+j)); distribute across finite sums.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/linearized-polynomial`, `FiniteFieldsAndCharacterSums:FF.4/linearized-polynomial-comp`, `mathlib:SkewPolynomial`, `mathlib:SkewPolynomial.monomial_mul_monomial`.

Source: [WU12](https://arxiv.org/pdf/1211.5475v2), §2.1, equations (1)–(3), and §3. The source’s skew-polynomial model, generalized from fields to commutative F-algebras using the native noninvertible Frobenius action.

Uses: WU12 §§2–3; DrinfeldModulesAndTModules:DM.0 — One reusable Frobenius Ore/linearized interface; DM.0 imports it to define Drinfeld-module actions..

| API name | Role | Contract |
| --- | --- | --- |
| `oreToLinearized` | equivalence | The coefficient equivalence Θ with the supported-polynomial subtype. |
| `oreToLinearized_monomial` | simp | Θ(aτ^i)=aX^(q^i). |
| `oreToLinearized_mul` | compatibility | Θ(A B)=Θ(A)∘Θ(B). |
| `oreToLinearized_one` | simp | Θ(1)=X. |
| `oreToLinearized_natural` | functoriality | An F-algebra map R→S commutes with Θ and the induced coefficient map. |

Unit tests:

- `ore_one_is_X` (computation): Θ(1)=X.
- `ore_degree_zero` (degenerate): Θ(a)=aX for a constant skew polynomial.
- `ore_noncommutation` (non-example): In F_2[t], Θ(τt) = t²X² whereas Θ(tτ)=tX²; they are distinct.

Acceptance:

- The constant skew monomial a maps to aX, not to the constant polynomial a.
- Over F_q[t], τt=t^qτ and Frobenius is not surjective.

Atlas planet: **Linearized composition algebra**.

#### Reduced linearized composition algebra

**ID:** `FiniteFieldsAndCharacterSums:FF.4/reduced-linearized-algebra`  \
**Kind:** definition. **Suggested name:** `ReducedLinearized`.

For the finite extension E/F of degree n>0, |F|=q, ReducedLinearized(F,E,n) has carrier Fin n→E, coordinatewise addition and F-scalars, unit (1,0,…,0), and multiplication (a⋆b)_k=Σ_{i,j<n,(i+j) mod n=k} a_i b_j^(q^i). It represents Σ_{i<n}a_i X^(q^i) modulo the composition relation X^(q^n)=X. Its multiplication is not pointwise multiplication.

Hypotheses: F,E finite fields, Algebra F E; n=[E:F]>0.

Proof route:
1. Reduce parent linearized composition modulo X^(q^n)−X using x^(q^n)=x on E.
2. The twisted cyclic convolution is the Ore product modulo τ^n−1, whose centrality follows because φ^n=id on E. Check associativity by the Frobenius action and cyclic indexing.
3. Give the coefficient carrier its actual F-algebra structure; retain coefficients as data for the evaluation equivalence.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/linearized-polynomial`, `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`.

Source: [WU12](https://arxiv.org/pdf/1211.5475v2), §2.1 and §3, pp. 4–10. The finite composition algebra, with explicit multiplication and reduction convention.

Uses: WU12 Theorems 3.1,5.1,6.1 — Carrier for maps, rank decompositions and intermediate-coefficient subalgebras..

| API name | Role | Contract |
| --- | --- | --- |
| `ReducedLinearized.coeff` | projection | The coefficient a_i for i<n. |
| `ReducedLinearized.ext` | extensionality | Equal coefficients imply equal elements. |
| `ReducedLinearized.single` | constructor | single(i,a) has coefficient a at i and zero elsewhere. |
| `ReducedLinearized.coeff_mul` | relation | The product coefficient is the stated twisted cyclic convolution. |
| `ReducedLinearized.polynomial` | data | The ordinary polynomial representative Σ a_i X^(q^i). |

Unit tests:

- `reduced_zero_coeff` (degenerate): Every coefficient of zero is zero.
- `reduced_unit` (computation): The unit has coefficient 1 at 0, all others zero.
- `reduced_frobenius_order` (compatibility): For n>1, single(1,1)^n=1, agreeing with the n-th power of relative Frobenius.

Acceptance:

- n=1 recovers E=F with ordinary scalar multiplication; n>1 usually gives a noncommutative ring.

#### Reduced evaluation and endomorphisms

**ID:** `FiniteFieldsAndCharacterSums:FF.4/reduced-evaluation-equivalence`  \
**Kind:** construction. **Suggested name:** `reducedEvalEquiv`.

Evaluation sends a to the F-linear map x ↦ Σ_{i<n} a_i x^(q^i) and gives an F-algebra equivalence ReducedLinearized(F,E,n) ≃ₐ[F] Module.End F E, with composition as multiplication.

Hypotheses: The finite extension hypotheses of reduced-linearized-algebra.

Proof route:
1. The parent evaluation-linearity theorem supplies each F-linear map; the explicit product formula supplies multiplicativity.
2. If a nonzero representative vanished on every x∈E, its degree at most q^(n−1) would contradict the root bound |E|=q^n. Thus evaluation is injective.
3. Both F-vector spaces have dimension n². Finite-dimensional injectivity gives surjectivity and hence the native algebra equivalence.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/reduced-linearized-algebra`, `FiniteFieldsAndCharacterSums:FF.4/linearized-polynomial-eval-linear`.

Source: [WU12](https://arxiv.org/pdf/1211.5475v2), §3, Theorem 3.1 with the evaluation identification preceding it. Uses actual F-linear endomorphisms, not an abstract supplied multiplication table.

Uses: WU12 §§3,5–6 — Transfers native rank, trace-dual tensors and matrix coordinate maps to reduced polynomials..

| API name | Role | Contract |
| --- | --- | --- |
| `reducedEvalEquiv` | equivalence | The F-algebra equivalence a↦eval a. |
| `reducedEvalEquiv_apply` | simp | Its value at x is Σ a_i x^(q^i). |
| `reducedEvalEquiv_mul` | compatibility | eval(a⋆b)=eval(a)∘eval(b). |
| `reducedEvalEquiv_surjective` | universal-property | Every F-linear map E→E has unique reduced coefficients. |

Unit tests:

- `eval_zero` (degenerate): eval(0)=0.
- `eval_one` (compatibility): eval(1)=LinearMap.id.
- `eval_single` (computation): eval(single(i,a))(x)=a*x^(q^i).

Acceptance:

- The coefficients of Frobenius give the usual relative Frobenius linear map.

#### Trace tensors in linearized coordinates

**ID:** `FiniteFieldsAndCharacterSums:FF.4/trace-tensor-coordinate-formula`  \
**Kind:** theorem. **Suggested name:** `traceTensor_coeff`.

For α,β∈E let T_α(x)=Tr_{E/F}(αx). Under reducedEvalEquiv and the native dualTensorHomEquiv, T_α⊗β corresponds to the coefficients c_i=β α^(q^i). The contraction law is composition: (T_γ⊗δ)∘(T_α⊗β)=Tr(γβ)·(T_α⊗δ).

Hypotheses: F,E finite fields and n=[E:F]>0.

Proof route:
1. Use the native pure-tensor evaluation f⊗β↦(x↦f(x)•β).
2. Expand Tr(αx)=Σ(αx)^(q^i) with the parent finite-field trace theorem; uniqueness of reduced evaluation identifies coefficients.
3. Use native comp_dualTensorHom for the contraction, pinning the order of the middle pair. This is a coordinate compatibility, not a new generic tensor algebra.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/reduced-evaluation-equivalence`, `mathlib:dualTensorHomEquiv`, `mathlib:dualTensorHomEquiv_tmul`, `mathlib:comp_dualTensorHom`, `mathlib:FiniteField.algebraMap_trace_eq_sum_pow`.

Source: [WU12](https://arxiv.org/pdf/1211.5475v2), §3, Theorem 3.1, and §5.1. Finite-field coordinates for the generic tensor–Hom equivalence already in Mathlib.

Acceptance:

- α=0 or β=0 gives the zero coefficient vector.
- A trace rank-one map has rank 1 precisely when αβ≠0.

#### Basis trace representations

**ID:** `FiniteFieldsAndCharacterSums:FF.4/basis-trace-representations`  \
**Kind:** theorem. **Suggested name:** `linearMap_trace_basis`.

For an F-basis b_0,…,b_{n−1} of E and any F-linear L, L(x)=Σ_i Tr(b_i x)·L(b_i*) where b* is the trace-dual basis. Dually L(x)=Σ_i Tr(c_i x)·b_i with uniquely determined c_i. Rank_F L equals the dimension of the F-span of the output coefficients L(b_i*) and also that of the c_i.

Hypotheses: Finite fields F⊂E; b an actual Module.Basis; b* native traceDual.

Proof route:
1. Trace nondegeneracy and the native traceDual basis give x=Σ Tr(b_i x)b_i*. Apply L to obtain the first expansion.
2. Expand L in the output basis and identify each coordinate functional using the trace pairing; uniqueness gives c_i.
3. The first output family spans im L. The rank of the dual coordinate map equals rank L, so the c_i have the same span dimension.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/trace-tensor-coordinate-formula`, `mathlib:traceForm_nondegenerate`, `mathlib:Module.Basis.traceDual`.

Source: [WU12](https://arxiv.org/pdf/1211.5475v2), §5, Theorem 5.1(1)–(2), pp. 17–18 and §5.1 proof. The basis-dependent trace formulas and their rank statements, using the native trace-dual basis.

Acceptance:

- For L=id, L(b_i*)=b_i* and both ranks are n.

#### Minimal trace rank decomposition

**ID:** `FiniteFieldsAndCharacterSums:FF.4/minimal-trace-rank-decomposition`  \
**Kind:** theorem. **Suggested name:** `linearMap_rank_iff_trace_sum`.

An F-linear map L:E→E has rank k iff it can be written L(x)=Σ_{j<k}Tr(ω_j x) θ_j with both (ω_j) and (θ_j) F-linearly independent. Such a k-term expression is minimal among trace rank-one decompositions.

Hypotheses: Finite fields F⊂E; k a natural; k≤n; allow k=0.

Proof route:
1. Choose a basis θ of im L. The coordinate functionals of L are independent; trace nondegeneracy represents them by an independent family ω.
2. Conversely independent ω give a surjective map E→F^k, and independent θ give an injective map F^k→E. Their composite has rank k.
3. Any s-term expression factors through F^s, hence rank≤s.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/basis-trace-representations`, `mathlib:traceForm_nondegenerate`.

Source: [WU12](https://arxiv.org/pdf/1211.5475v2), Theorem 5.1(3) and §5.1 proof, pp. 18–20. The minimal number of pure trace tensors equals map rank.

Acceptance:

- k=0 occurs exactly for L=0; rank-one nonzero maps require both parameters nonzero.

#### Inverse from trace-dual bases

**ID:** `FiniteFieldsAndCharacterSums:FF.4/trace-basis-inverse`  \
**Kind:** theorem. **Suggested name:** `traceBasis_inverse`.

For bases b,a of E/F, the map L(x)=Σ_i Tr(b_i x)a_i is invertible, and L⁻¹(x)=Σ_i Tr(a_i* x)b_i*, using the native trace-dual bases.

Hypotheses: b and a indexed by the same finite n-element type.

Proof route:
1. L carries b_i* to a_i by the trace-dual identity.
2. The displayed inverse carries a_i to b_i*. Check both composites on these bases, then transfer to reduced coefficients using reducedEvalEquiv.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/basis-trace-representations`, `mathlib:Module.Basis.traceDual`.

Source: [WU12](https://arxiv.org/pdf/1211.5475v2), §5.3, Proposition 5.5(1), p. 26. The inverse expression with both trace-dual bases and its orientation fixed.

Acceptance:

- Taking a=b* gives id, whose inverse formula is the same identity.

#### Intermediate-field coefficient subalgebra

**ID:** `FiniteFieldsAndCharacterSums:FF.4/intermediate-coefficient-subalgebra`  \
**Kind:** construction. **Suggested name:** `coeffSubalgebra`.

For m>0 dividing n=[E:F], let E_m={a∈E : a^(q^m)=a}, the unique intermediate field of size q^m. CoeffSubalgebra m is the F-subalgebra of ReducedLinearized(F,E,n) whose coefficients all lie in E_m. Under reducedEvalEquiv it is exactly the centralizer of x↦x^(q^m) in End_F(E). Its F-dimension is nm.

Hypotheses: Finite fields F⊂E; m>0 and m∣n.

Proof route:
1. Use native fixedField of the subgroup generated by φ^m in the cyclic Gal(E/F). Its order is n/m. Native finrank_fixedField_eq_card and the tower law give the fixed field F-degree m and cardinality q^m; its elements satisfy a^(q^m)=a.
2. The twisted cyclic convolution preserves fixed coefficients, since all Frobenius powers commute; make an actual Subalgebra rather than an unrelated carrier.
3. Compare eval(L)∘φ^m and φ^m∘eval(L); uniqueness of reduced coefficients makes equality equivalent to a_i^(q^m)=a_i. Each of the n coefficients has m F-dimensions.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/reduced-evaluation-equivalence`, `mathlib:IntermediateField.fixedField`, `mathlib:IntermediateField.finrank_fixedField_eq_card`, `mathlib:FiniteField.frobeniusAlgHom`.

Source: [WU12](https://arxiv.org/pdf/1211.5475v2), §6, Theorems 6.1–6.2, pp. 26–27. The intermediate coefficient algebra, with its intrinsic centralizer characterization.

Uses: WU12 Theorems 6.1–6.4 — Supplies the exact coefficient restriction for all three algebra descriptions..

| API name | Role | Contract |
| --- | --- | --- |
| `coeffSubalgebra` | constructor | The F-subalgebra defined by fixed coefficients. |
| `mem_coeffSubalgebra` | characterisation | Membership iff every coefficient satisfies a_i^(q^m)=a_i. |
| `coeffSubalgebra_centralizer` | compatibility | Evaluation identifies it with the centralizer of φ^m. |
| `coeffSubalgebra_finrank` | data | Its F-finrank is n*m. |

Unit tests:

- `coeff_subalgebra_full` (degenerate): At m=n, coeffSubalgebra n=⊤.
- `coeff_subalgebra_base` (compatibility): At m=1, a coefficient lies in the algebra iff it is in the image of F.
- `coeff_subalgebra_wrong_scalar` (non-example): For m<n and a∉E_m, the reduced scalar map aX is not in coeffSubalgebra m.

Acceptance:

- m=n gives the whole algebra; m=1 has dimension n, not n².

#### Coefficient algebra as a cyclic skew quotient

**ID:** `FiniteFieldsAndCharacterSums:FF.4/coefficient-skew-quotient`  \
**Kind:** comparison. **Suggested name:** `coeffSubalgebra_skewQuotient`.

For m∣n, the coefficient algebra is F-algebra isomorphic to SkewPolynomial(E_m)/⟨τ^n−1⟩, where φ(a)=a^q and the quotient uses the native TwoSidedIdeal generated by τ^n−1. This element is central since φ^n=id on E_m. The isomorphism sends τ to X^q and a to aX.

Hypotheses: m>0, n>0, m∣n; do not require char(F)∤n.

Proof route:
1. Use the native Frobenius skew ring and prove τ^n−1 central from m∣n.
2. Division by its monic central polynomial leaves a unique coefficient normal form of length n; multiplication reduces by cyclic twisting.
3. Identify that normal form with coeffSubalgebra m. No ideal of an ordinary commutative polynomial ring can replace the two-sided ideal here.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/intermediate-coefficient-subalgebra`, `FiniteFieldsAndCharacterSums:FF.4/frobenius-ore-polynomial-comparison`, `mathlib:TwoSidedIdeal`.

Source: [WU12](https://arxiv.org/pdf/1211.5475v2), §6, Theorem 6.1, p. 26. Uses the actual skew relation and the central cyclic quotient.

Acceptance:

- m=1 gives the commutative algebra F[Y]/(Y^n−1), including nonsemisimple cases when char(F)∣n.

#### Normal trace coefficients for a subalgebra

**ID:** `FiniteFieldsAndCharacterSums:FF.4/normal-trace-coefficient-pattern`  \
**Kind:** theorem. **Suggested name:** `normalTrace_coeff_pattern`.

Choose a normal basis b_i=β^(q^i) with trace-dual b_i*=β*^(q^i). Writing L(x)=Σ_i Tr(b_i x)α_i, one has L∈CoeffSubalgebra m iff α_{jm+k}=α_k^(q^(jm)) for j<n/m and k<m.

Hypotheses: m>0, m∣n; b is a normal basis reindexed by Fin n.

Proof route:
1. Use the basis trace representation α_i=L(b_i*).
2. The centralizer characterization gives L(φ^(jm)b_k*)=φ^(jm)L(b_k*), proving the pattern. Conversely the pattern verifies commutation on every basis element.
3. The trace-dual basis is normal because trace is invariant under relative Frobenius.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/basis-trace-representations`, `FiniteFieldsAndCharacterSums:FF.4/intermediate-coefficient-subalgebra`, `mathlib:IsGalois.normalBasis`, `mathlib:Module.Basis.traceDual`.

Source: [WU12](https://arxiv.org/pdf/1211.5475v2), §6, (14)–(15) and Theorem 6.2, pp. 26–27. Fixes the final index in (15): the last entry is α_(m−1)^(q^((t−1)m)), not α_(n−1) with the same exponent.

Acceptance:

- m=n imposes no restriction; m=1 gives a single Frobenius orbit of output coefficients.

#### Block circulant realization

**ID:** `FiniteFieldsAndCharacterSums:FF.4/block-circulant-coefficient-algebra`  \
**Kind:** comparison. **Suggested name:** `coeffSubalgebra_blockCirculant`.

Set t=n/m. In the ordered normal trace-dual basis (b*_{jm+k}) with j<t,k<m, the matrix of an element of CoeffSubalgebra m has blocks M_{ij}=B_{(j−i) mod t}, B_j∈Matrix_m(F). Every such block circulant matrix occurs, giving an F-algebra equivalence with this subalgebra of Matrix_n(F).

Hypotheses: m>0, m∣n; a specified normal trace-dual basis fixes the row/column and Frobenius orientation.

Proof route:
1. Use normal-trace-coefficient-pattern to compare matrix columns related by φ^m. In this basis φ^m is the block cyclic permutation.
2. Its centralizer consists exactly of the displayed block matrices; extract the top block row for the inverse.
3. The native matrix map of an endomorphism preserves composition. Restrict the evaluation equivalence to the two centralizers.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/normal-trace-coefficient-pattern`, `FiniteFieldsAndCharacterSums:FF.4/reduced-evaluation-equivalence`.

Source: [WU12](https://arxiv.org/pdf/1211.5475v2), §6, displayed block matrix and Theorem 6.3, p. 27. Coordinate comparison, with first block row B0,…,B_(t−1) and indices j−i.

Acceptance:

- t=1 gives arbitrary m×m matrices; m=1 gives ordinary circulants.

#### Matrix polynomial quotient realization

**ID:** `FiniteFieldsAndCharacterSums:FF.4/matrix-polynomial-coefficient-algebra`  \
**Kind:** comparison. **Suggested name:** `coeffSubalgebra_matrixQuotient`.

CoeffSubalgebra m ≃ₐ[F] Matrix (Fin m) (Fin m) (AdjoinRoot(Y^t−1)), where t=n/m. For blocks B_j in the fixed orientation M_{ij}=B_{j−i}, the correspondence is M↦Σ_j B_j Y^j, entry by entry. The quotient exponent is t, not n.

Hypotheses: m>0,m∣n; t=n/m≥1; no separability assumption on Y^t−1.

Proof route:
1. Multiply two block circulants; their first block rows convolve modulo t with matrix coefficients in the given order.
2. AdjoinRoot of the monic polynomial Y^t−1 has the unique length-t coefficient normal form. Entrywise extraction gives the inverse, hence an algebra equivalence.
3. Compose with block-circulant-coefficient-algebra. This route needs no false semisimplicity assumption when the characteristic divides t.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/block-circulant-coefficient-algebra`, `mathlib:AdjoinRoot`, `mathlib:AdjoinRoot.modByMonicHom`.

Source: [WU12](https://arxiv.org/pdf/1211.5475v2), §6, passage before and statement of Corollary 6.4, pp. 27–28. The corollary has exponent t; the preceding sentence’s exponent n is corrected.

Acceptance:

- m=n gives Matrix_n(F), since t=1. m=1 gives F[Y]/(Y^n−1).

### Interleaving, Walsh transforms and bent functions

#### Interleaved structure of m-sequences

**ID:** `FiniteFieldsAndCharacterSums:FF.4/m-sequence-interleaving`  \
**Kind:** theorem. **Suggested name:** `mSequence_interleaving`.

Let F⊂E⊂K have |F|=q,[E:F]=m,[K:F]=n,m∣n; α primitive in K, ω≠0 and d=(q^n−1)/(q^m−1), β=α^d. Reshape a_i=Tr_{K/F}(ωα^i) into A_{s,t}=a_{sd+t}, 0≤s<q^m−1,0≤t<d. Then A_{s,t}=Tr_{E/F}(h_t β^s), h_t=Tr_{K/E}(ωα^t). Exactly (q^(n−m)−1)/(q^m−1) columns are zero; every other column is a cyclic shift of the E/F m-sequence.

Hypotheses: m,n positive; compatible scalar towers; primitive α; ω≠0.

Proof route:
1. Use trace transitivity and E-linearity with α^d=β∈E; primitive-root order gives β order q^m−1.
2. The nonzero h_t columns are scalar shifts because β enumerates E×.
3. The nonzero trace-zero elements of K number q^(n−m)−1. Trace-zero is stable under multiplication by E×, whose d cosets are α^tE×; divide by q^m−1.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/m-sequence`, `FiniteFieldsAndCharacterSums:FF.4/m-sequence-state-cycle`, `mathlib:Algebra.trace_trace`, `mathlib:Algebra.trace_surjective`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §13.3, pp. 315–316. The matrix layout and corrected zero-column count; inherited E512 already records the denominator correction.

Acceptance:

- K=E gives d=1 and zero zero-columns. For q=2,m=2,n=4 there are five columns, exactly one zero.

#### Trace Walsh transform

**ID:** `FiniteFieldsAndCharacterSums:FF.4/trace-walsh-transform`  \
**Kind:** definition. **Suggested name:** `traceWalsh`.

For finite fields F⊂E, a nontrivial additive character ψ:F→ℂ× and B:E→F, define Wψ(B,y)=Σ_{x∈E} ψ(B(x)) overline(ψ(Tr_{E/F}(yx))). This is unnormalized, includes x=0, and uses a minus sign in the phase.

Hypotheses: Finite fields with an F-algebra structure; ψ a genuine AddChar F ℂ, ψ≠0 in Mathlib’s additive notation.

Proof route:
1. Use the native finite sum of character values; trace pairing parametrizes all additive frequencies nondegenerately.
2. Keep the character and trace orientation visible; this transform applies to nonlinear B as well as trace-linear functions.

Direct prerequisites: `mathlib:Algebra.trace`, `mathlib:traceForm_nondegenerate`, `mathlib:AddChar.expect_eq_ite`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §13.4, pp. 316–317. The finite trace-frequency Fourier transform, with its normalization pinned.

Uses: GK09 §13.4; §§14.3–14.4 — Correlation conversion, bent definition and quadratic Gold/Kasami magnitude calculations..

| API name | Role | Contract |
| --- | --- | --- |
| `traceWalsh` | data | The stated complex finite sum. |
| `traceWalsh_zero_phase` | simp | Wψ(0,y)=∣E∣ if y=0, and 0 otherwise. |
| `traceWalsh_linear_phase` | compatibility | Wψ(Tr(cx),y)=∣E∣ if y=c, and 0 otherwise. |
| `traceWalsh_parseval` | relation | Σ_y ∣Wψ(B,y)∣²=∣E∣². |
| `traceWalsh_add_linear` | functoriality | Wψ(B+Tr(cx),y)=Wψ(B,y−c). |

Unit tests:

- `walsh_zero_at_zero` (degenerate): Wψ(0,0)=|E|.
- `walsh_zero_nonzero_frequency` (computation): For y≠0, Wψ(0,y)=0.
- `walsh_linear_peak` (compatibility): For B=Tr(cx), its only nonzero frequency is y=c, with value |E|.
- `walsh_binary_quadratic` (computation): In a two-dimensional F_2-space underlying E, B(x)=x0*x1 has frequencies 2,2,2,−2 in the dual coordinate order 00,01,10,11.

Acceptance:

- Linear phase B(x)=Tr(cx) has transform |E| at y=c and zero elsewhere.

#### Bent functions for the trace transform

**ID:** `FiniteFieldsAndCharacterSums:FF.4/trace-bent-function`  \
**Kind:** definition. **Suggested name:** `IsTraceBent`.

B:E→F is ψ-bent iff for every y∈E, |Wψ(B,y)|=√|E|. The character is an explicit parameter. For the prime alphabet F=F_p this property is independent of the chosen nontrivial ψ; that independence is a theorem, not a condition in the definition.

Hypotheses: The finite-field and nontrivial-character hypotheses of trace-walsh-transform.

Proof route:
1. Use the exact norm predicate on all frequencies, including y=0.
2. Parseval makes √|E| the unique constant magnitude, so this normalization agrees with the source.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/trace-walsh-transform`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §13.4, p. 317. Correctly requires the magnitude of the Fourier coefficients, rather than equality of complex numbers to a positive real.

Uses: GK09 §13.4, correlation optimum — Flat spectra give constant magnitudes of correlations shifted by the missing zero contribution..

| API name | Role | Contract |
| --- | --- | --- |
| `IsTraceBent` | characterisation | Bentness is ∀y, ∣Wψ(B,y)∣=√∣E∣. |
| `isTraceBent_iff_norm_sq` | characterisation | Equivalently every squared magnitude equals ∣E∣. |
| `isTraceBent_add_linear` | functoriality | Adding Tr(cx) preserves bentness by frequency translation. |
| `isTraceBent_add_constant` | functoriality | Adding a constant preserves bentness by multiplication by a unit complex phase. |

Unit tests:

- `bent_binary_product` (computation): The function B(x0,x1)=x0*x1 on F_2² is bent.
- `bent_zero_nonexample` (non-example): The zero function is not bent on a nontrivial finite field E.
- `bent_linear_shift` (compatibility): B is bent iff B+Tr(cx) is bent, for every c.

Acceptance:

- A trace-linear phase is not bent when |E|>1.

#### Walsh coefficients and periodic correlation

**ID:** `FiniteFieldsAndCharacterSums:FF.4/correlation-walsh-identity`  \
**Kind:** theorem. **Suggested name:** `periodicCorr_traceWalsh`.

Let α generate E×, N=|E|−1, b_i=B(α^i), a_i=Tr(α^i), and Cψ(b,a;t)=Σ_{i mod N}ψ(b_i) overline(ψ(a_{i+t})). Then Cψ(b,a;t)+ψ(B(0))=Wψ(B,α^t). Consequently Σ_t |Cψ(b,a;t)+ψ(B(0))|²=|E|²−|Wψ(B,0)|². If B is ψ-bent, every shifted correlation magnitude is √|E|.

Hypotheses: α primitive; B arbitrary; ψ nontrivial; periodic sequences indexed modulo N.

Proof route:
1. Replace the index i by x=α^i∈E× using the primitive-root bijection. The summand at x=0 is exactly ψ(B(0)).
2. Apply traceWalsh_parseval and remove frequency zero; E× parametrizes exactly all nonzero frequencies.
3. Apply the bent predicate to the equality. Keep the absolute value around C+ψ(B(0)); the source’s unmodulated complex equality is false.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/trace-walsh-transform`, `FiniteFieldsAndCharacterSums:FF.4/trace-bent-function`, `FiniteFieldsAndCharacterSums:FF.4/periodic-correlation`, `FiniteFieldsAndCharacterSums:FF.4/m-sequence`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §13.4, p. 317. The all-elements versus nonzero-elements correction and Parseval restriction.

Acceptance:

- For B=0 and t any, C=−1 and Wψ(0,α^t)=0, so C+1=0.

#### Prime-alphabet character independence

**ID:** `FiniteFieldsAndCharacterSums:FF.4/bent-prime-character-independence`  \
**Kind:** theorem. **Suggested name:** `isTraceBent_prime_character`.

For F=F_p and any finite E/F, IsTraceBent ψ B is equivalent to IsTraceBent ψ′ B for all nontrivial additive characters ψ,ψ′ of F.

Hypotheses: p prime; E finite; do not assert this for a composite prime-power alphabet.

Proof route:
1. Write ψ′(u)=ψ(au), a∈F×. The cyclotomic automorphism ζ_p↦ζ_p^a carries Wψ(B,y) to Wψ′(B,ay).
2. Squared magnitude is the product with its complex conjugate, and cyclotomic automorphisms commute with conjugation. If it equals the rational integer |E|, every automorphism fixes it. Reindex y by a.
3. The exact cyclotomic-automorphism export must be verified against the pinned library; it is recorded as a gap rather than supplied as a predicate field.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/trace-bent-function`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §13.4, p. 317. The dependence-on-character warning and prime-field exception.

Acceptance:

- For p=2 there is a unique nontrivial character, making the assertion immediate.

### Welch bound and correlation families

#### Welch bound

**ID:** `FiniteFieldsAndCharacterSums:FF.4/welch-signal-bound`  \
**Kind:** theorem. **Suggested name:** `welch_bound`.

For N≥2 and T≥1, let v_1,…,v_N∈ℂ^T have every coordinate of norm one. If M bounds |Σ_k v_u(k)overline(v_v(k))| for u≠v, then (N−1)M²≥T(N−T), with all products and subtraction in ℝ. For phase vectors of all shifts of n shift-distinct exact-period-T sequences, take N=nT.

Hypotheses: M≥0; N≥2; T≥1; vectors need not be distinct for the basic inequality. The signal-set specialization requires exact periods and shift distinctness.

Proof route:
1. Use the Gram matrix and sum all squared correlations. Dropping the off-diagonal coordinate pairs gives Σ_{u,v}|Cuv|²≥TN².
2. The diagonal contributes NT² and the remaining terms are bounded by N(N−1)M². Divide by positive N and rearrange.
3. Do not perform N−T in natural numbers or divide by N−1 at N=1.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/periodic-correlation`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §14.1, Theorem 14.1.1 with proof, pp. 329–330. The source’s Gram-sum proof, extended to arbitrary unit-modulus complex vectors.

Acceptance:

- At N=T an orthogonal signal set has M=0 and equality. At N>T the lower bound is positive.

#### Trace decimation families

**ID:** `FiniteFieldsAndCharacterSums:FF.4/trace-decimation-family`  \
**Kind:** construction. **Suggested name:** `traceDecimation`.

For F⊂E, primitive α∈E, N=|E|−1 and d≥1, set S_d(A,B)_i=Tr_{E/F}(Aα^i+Bα^(di)) on ZMod N. The shift by t carries (A,B) to (Aα^t,Bα^(dt)). Gold families are the specialization d=1+q^s.

Hypotheses: Finite fields F⊂E; primitive α; |F|=q.

Proof route:
1. Use the parent trace m-sequence construction and pointwise addition on the actual finite word type.
2. Primitive-root powers descend to ZMod N; trace linearity supplies the parameter map, and exponent addition supplies the shift law.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/m-sequence`, `FiniteFieldsAndCharacterSums:FF.4/periodic-correlation`, `mathlib:Algebra.trace`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §14.2, (14.1), pp. 330–331. The two-parameter family; no false equivalence between full minimal-polynomial degree and a primitive element is assumed.

Uses: GK09 §§14.2–14.3 — Gold shift classes and reduction of correlations to linear-plus-quadratic sums..

| API name | Role | Contract |
| --- | --- | --- |
| `traceDecimation` | constructor | The finite periodic word S_d(A,B). |
| `traceDecimation_apply` | simp | Its i-th value is Tr(Aα^i+Bα^(di)). |
| `traceDecimation_shift` | functoriality | shift_t S_d(A,B)=S_d(Aα^t,Bα^(dt)). |
| `traceDecimation_add` | structure | The parameter map (A,B)↦S_d(A,B) is F-linear. |

Unit tests:

- `decimation_zero` (degenerate): S_d(0,0)=0.
- `decimation_one` (non-example): S_1(A,B)=S_1(A+B,0), so the parameter map need not be injective.
- `decimation_trace` (compatibility): S_d(A,0) is the parent trace m-sequence, independent of d.

Acceptance:

- d=1 collapses to the single trace sequence of A+B.

#### Gold quadratic forms and radicals

**ID:** `FiniteFieldsAndCharacterSums:FF.4/gold-polar-radical`  \
**Kind:** theorem. **Suggested name:** `gold_radical_card`.

Let Q_H(x)=Tr_{E/F}(H x^(1+q^s)), 0<s<n=[E:F]. Its polar form is Tr(R_H(x)y), where R_H(x)=H x^(q^s)+(Hx)^(q^(n−s)). For H≠0 and g=gcd(n,2s), its radical has q^g elements iff c^((q^n−1)/(q^g−1))=1 with c=−H/H^(q^s); otherwise it has one element. For H=0 the radical is E.

Hypotheses: Finite fields F⊂E, |F|=q; 0<s<n. This includes the boundary 2s=n.

Proof route:
1. Expand Q(x+y)−Q(x)−Q(y) using Frobenius additivity. Move the q^s-power on y across trace by applying φ^(n−s), obtaining R_H.
2. Trace nondegeneracy identifies the radical with ker R_H. Raising the equation R_H(x)=0 to q^s gives x^(q^(2s)−1)=c for x≠0.
3. The cyclic group E× has order q^n−1. The power-map kernel has order gcd(q^(2s)−1,q^n−1)=q^g−1, and its image is characterized by the displayed power condition. Add the root zero.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/trace-decimation-family`, `mathlib:traceForm_nondegenerate`, `mathlib:isCyclic_of_injective_ringHom`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §14.3, Theorem 14.3.2 and Table 14.1, pp. 332–333; quadratic-form reduction (14.4). Replaces the draft’s defective magnitude table by an intrinsic radical test derived directly from the trace polynomial.

Acceptance:

- For F_2⊂F_(2^n), n odd and gcd(s,n)=1, every H≠0 gives a radical of size 2.
- For 2s=n the form may vanish identically in characteristic 2; no general-rank claim excludes that boundary silently.

#### Quadratic Fourier magnitude

**ID:** `FiniteFieldsAndCharacterSums:FF.4/quadratic-character-sum-magnitude`  \
**Kind:** theorem. **Suggested name:** `quadratic_sum_norm_sq`.

Let V be a finite F-vector space, Q:V→F a quadratic map (Q(ax)=a²Q(x), polar form bilinear), ℓ:V→F linear and ψ nontrivial. Let R be the radical of the polar form. For Z=Σ_x ψ(Q(x)+ℓ(x)), one has |Z|²=|V|Σ_{r∈R}ψ(Q(r)+ℓ(r)). Thus |Z| is zero or √(|V||R|), with the latter precisely when ψ(Q(r)+ℓ(r))=1 for every r∈R.

Hypotheses: F finite field; V finite-dimensional and finite; allow characteristic 2 and a nonzero additive restriction Q|R.

Proof route:
1. Expand Z times its conjugate and set x=y+r. The phase is Q(r)+ℓ(r)+polar(y,r).
2. Orthogonality kills the inner y-sum unless r is in the radical; then it is |V|.
3. On R, Q+ℓ is additive, so ψ∘(Q+ℓ) is an additive character. Native finite character orthogonality gives either zero or |R|; take the nonnegative square root.

Direct prerequisites: `mathlib:AddChar.expect_eq_ite`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §3.3 on quadratic forms, as used in §14.3 (14.4) and Table 14.1. A direct character-orthogonality proof avoids relying on the misprinted table of magnitudes.

Acceptance:

- A nondegenerate polar form gives |Z|=√|V| for every linear perturbation.
- The zero quadratic and zero linear forms give |Z|=|V|, not √|V|.

#### Shift-distinct Gold representatives

**ID:** `FiniteFieldsAndCharacterSums:FF.4/gold-shift-classes`  \
**Kind:** theorem. **Suggested name:** `gold_shift_distinct`.

For d=1+q^s with 0<s<n and 2s≠n, the |E|+1 words {S_d(1,B):B∈E}∪{S_d(0,1)} are pairwise shift distinct. Each S_d(1,B) has exact period N=|E|−1. The final representative has exact period N only when gcd(d,N)=1; no full-period claim for it is made otherwise.

Hypotheses: Finite fields F⊂E, primitive α; 0<s<n; 2s≠n.

Proof route:
1. If a shifted equality holds, its difference is Tr(Ux+Hx^d)=0 on E. The quadratic polar form is zero, so gold-polar-radical and 2s≠n force H=0; trace nondegeneracy forces U=0.
2. For two first representatives U=1−α^t, hence t=0 and their parameters agree; for a comparison with S_d(0,1), U is nonzero.
3. The same calculation gives the exact period of each first representative. For the final word, gcd(d,N)=1 makes its decimation a permutation of the nonzero powers; use parent exact period.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/trace-decimation-family`, `FiniteFieldsAndCharacterSums:FF.4/gold-polar-radical`, `FiniteFieldsAndCharacterSums:FF.4/m-sequence-state-cycle`, `mathlib:traceForm_nondegenerate`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §14.3, Lemma 14.3.1 with proof, pp. 331–332. Preserves the source’s hypothesis 2s≠n and distinguishes shift classes from exact periods.

Acceptance:

- For q=2,n=3,s=1 there are nine representatives of period seven.
- For q=3,n=3,s=1,d=4 the last representative’s period divides 13, although N=26.

#### Binary Gold three-valued correlation

**ID:** `FiniteFieldsAndCharacterSums:FF.4/gold-binary-three-correlation-values`  \
**Kind:** theorem. **Suggested name:** `gold_binary_corr_values`.

For F=F_2, n odd≥3, gcd(s,n)=1 and 0<s<n, put d=1+2^s. Between any two Gold representatives, excluding the same word at zero shift, binary periodic correlation belongs to {−1,−1+2^((n+1)/2),−1−2^((n+1)/2)}.

Hypotheses: Primitive α∈F_(2^n); canonical nontrivial binary additive character; include the pure decimated representative S_d(0,1).

Proof route:
1. The parent decimation correlation identity changes C+1 to the full sum of ψ(Tr(Ux+Hx^d)).
2. When H≠0, gold-polar-radical gives |R|=2 and quadratic-character-sum-magnitude gives zero or 2^((n+1)/2). Binary character values make the sum a real integer with the two possible signs.
3. When H=0, U is nonzero by gold-shift-classes unless the excluded trivial comparison occurs; orthogonality gives zero. For two final representatives at nonzero shift, gcd(d,N)=1 guarantees H≠0.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/gold-shift-classes`, `FiniteFieldsAndCharacterSums:FF.4/gold-polar-radical`, `FiniteFieldsAndCharacterSums:FF.4/quadratic-character-sum-magnitude`, `FiniteFieldsAndCharacterSums:FF.4/decimation-cross-correlation-character-sum`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §14.3, Theorem 14.3.2, binary odd-n row of Table 14.1, pp. 332–333. The classical binary Gold case; general alphabets retain the intrinsic radical formula instead of a false table.

Acceptance:

- n=3 gives possible correlations −5,−1,3; the excluded diagonal at zero shift is 7.

Atlas planet: **Gold sequences**.

#### Small Kasami family

**ID:** `FiniteFieldsAndCharacterSums:FF.4/small-kasami-family`  \
**Kind:** construction. **Suggested name:** `kasamiSequence`.

For F⊂E⊂L with |F|=q,[E:F]=m>0,[L:E]=2, primitive α∈L and N=|L|−1, define K(A)_i=Tr_{L/F}(α^i)+Tr_{E/F}(A Norm_{L/E}(α^i)) for A∈E. The parameter belongs to E and the primitive element to L.

Hypotheses: Compatible field tower; α primitive in L; A∈E.

Proof route:
1. Use actual native trace and norm maps and the finite periodic word type.
2. The norm of α^i equals α^((1+q^m)i), identifying this with a Gold trace expression after choosing a trace lift of A from E to L. Independence of that lift follows from trace transitivity.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/trace-decimation-family`, `mathlib:Algebra.trace_trace`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §14.4, pp. 332–334, definition and Lemma 14.4.1. Corrects α∈F to α∈L and A∈L to A∈E, as required by the displayed formula and lemma.

Uses: GK09 §14.4, Lemma 14.4.1 and correlation calculation — Uses the norm’s base-field values to avoid redundant or ill-typed parameters..

| API name | Role | Contract |
| --- | --- | --- |
| `kasamiSequence` | constructor | The periodic word K(A). |
| `kasamiSequence_apply` | simp | The stated trace–norm formula. |
| `kasamiSequence_zero` | simp | K(0) is the parent L/F trace m-sequence. |
| `kasamiSequence_traceLift` | compatibility | For Tr_{L/E}(Â)=A, K(A)=S_(1+q^m)(1,Â) over L/F. |

Unit tests:

- `kasami_zero` (degenerate): K(0)_i=Tr_{L/F}(α^i).
- `kasami_lift_independent` (compatibility): Two lifts Â with the same trace yield identical words.
- `kasami_parameter_domain` (non-example): For m=1,q=2 there are two members, rather than |L|=4.

Acceptance:

- The family has q^m shift-distinct members, and all have exact period N.

Atlas planet: **Kasami sequences**.

#### Kasami correlation and shift distinctness

**ID:** `FiniteFieldsAndCharacterSums:FF.4/kasami-quadratic-correlation`  \
**Kind:** theorem. **Suggested name:** `kasami_corr_norm`.

The K(A), A∈E, are pairwise shift distinct and have exact period N. For C=α^t, set H=A−B Norm(C). Their correlation plus one is Σ_{x∈L}ψ(Tr_{L/F}((1−C)x)+Tr_{E/F}(H Norm(x))). If H≠0 its magnitude is q^m; if H=0 and C≠1 it is zero. The remaining C=1,H=0 case is the trivial diagonal, giving |L|. In the binary case every nontrivial correlation is −1 or −1±2^m.

Hypotheses: The small-kasami-family hypotheses; ψ nontrivial on F.

Proof route:
1. Expand the word difference and add x=0 as in the parent decimation identity.
2. For H≠0 the norm quadratic has polar form Tr_{L/F}(H x^(q^m)y); multiplication by H and conjugate Frobenius are invertible, and trace nondegeneracy gives zero radical. Apply quadratic-character-sum-magnitude.
3. For H=0 use trace orthogonality. A word equality would make the full sum |L|, contradicting the other cases; therefore C=1 and A=B, giving both period and shift distinctness.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/small-kasami-family`, `FiniteFieldsAndCharacterSums:FF.4/quadratic-character-sum-magnitude`, `mathlib:traceForm_nondegenerate`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §14.4, Lemma 14.4.1 and its proof, pp. 333–334. Supplies a direct nondegenerate trace–norm proof of the correlation values, without the defective odd-q Gold-table row.

Acceptance:

- q=2,m=1: nontrivial correlations are −3,−1,1; trivial diagonal is 3.

#### Geometric feed sequences

**ID:** `FiniteFieldsAndCharacterSums:FF.4/geometric-feed-sequence`  \
**Kind:** construction. **Suggested name:** `geometricSequence`.

For F=F_p⊂L⊂K, |L|=q,[K:L]=m>0, primitive α∈K and a feed f:L→F, define geometricSequence(f)_i=f(Tr_{K/L}(α^i)) on ZMod(|K|−1). The feed is an arbitrary function, not required to be linear.

Hypotheses: p prime; compatible finite-field tower; α primitive.

Proof route:
1. Compose the parent L-valued trace m-sequence with f, retaining its period as a period bound.
2. Expose the actual feed and trace maps. Equality of feeds implies equality of words; m=1 reduces to f(α^i).

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/m-sequence`, `mathlib:Algebra.trace`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §14.5, (14.5) and Figure 14.2, pp. 334–335. The surrounding formula and figure determine the correct feed codomain F, correcting one occurrence of K.

Uses: GK09 §§14.5–14.6 — The feed-level correlation formula produces GMW autocorrelation and can be iterated for cascaded feeds..

| API name | Role | Contract |
| --- | --- | --- |
| `geometricSequence` | constructor | The finite periodic word f∘Tr evaluated on primitive powers. |
| `geometricSequence_apply` | simp | The i-th value is f(Tr(α^i)). |
| `geometricSequence_traceFeed` | compatibility | For f=Tr_{L/F}, the word equals the parent K/F trace m-sequence. |
| `geometricSequence_frobeniusDecimation` | relation | Decimating by q^s preserves the word, since Tr_{K/L}(x^(q^s))=Tr_{K/L}(x). |

Unit tests:

- `geometric_zero` (degenerate): The zero feed gives the zero word.
- `geometric_trace` (compatibility): The trace feed equals the K/F m-sequence by trace transitivity.
- `geometric_constant` (non-example): A constant nonzero feed has least period one, even when |K|−1>1.

Acceptance:

- A constant feed gives a constant word, so full period is not automatic.

#### Trace-pair fibres in geometric correlation

**ID:** `FiniteFieldsAndCharacterSums:FF.4/geometric-trace-pair-fibres`  \
**Kind:** theorem. **Suggested name:** `tracePair_fibre_card`.

For C∈K×, the L-linear map x↦(Tr_{K/L}x,Tr_{K/L}(Cx)) has rank two if C∉L, and each fibre has q^(m−2) elements. If C∈L, the second coordinate is C times the first; fibres on that graph have q^(m−1) elements and all other fibres are empty.

Hypotheses: Finite fields L⊂K; m=[K:L]>0; C≠0. C∉L implies m≥2.

Proof route:
1. Trace nondegeneracy makes the functionals represented by 1 and C independent exactly when C∉L.
2. A surjective rank-two linear map has kernel dimension m−2 and fibres of that cardinality.
3. When C∈L use trace linearity and trace surjectivity.

Direct prerequisites: `mathlib:traceForm_nondegenerate`, `mathlib:Algebra.trace_surjective`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §14.5, proof of Theorem 14.5.1, pp. 335–336; reference to Lemma 13.5.2. The precise finite-field linear-algebra input behind the correlation formula.

Acceptance:

- At m=1 only the C∈L case can occur.

#### Geometric feed correlation

**ID:** `FiniteFieldsAndCharacterSums:FF.4/geometric-correlation-formula`  \
**Kind:** theorem. **Suggested name:** `geometric_corr`.

Write Z_f=Σ_{u∈L}ψ(f(u)), C_{g,f}(C)=Σ_u ψ(g(u))overline(ψ(f(Cu))), and c0=ψ(g(0))overline(ψ(f(0))). For a=geometricSequence(f), b=geometricSequence(g), and C=α^t, periodicCorrψ(b,a;t)=q^(m−2)Z_g overline(Z_f)−c0 if C∉L, and q^(m−1)C_{g,f}(C)−c0 if C∈L. A q^s-decimation of b gives the same formula.

Hypotheses: The geometric-feed-sequence hypotheses; ψ a nontrivial character of F; no assumptions on f(0),g(0).

Proof route:
1. Parametrize K× by α^i and add the omitted x=0 term c0.
2. Group the full sum by the two trace coordinates and use geometric-trace-pair-fibres. Independent fibres give the product of imbalances; dependent fibres give the base-field feed correlation.
3. Use relative Frobenius invariance of trace for q-power decimations. The autocorrelation specialization subtracts 1 only when f(0)=0; otherwise it still subtracts |ψ(f(0))|²=1, but cross-correlation retains c0.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/geometric-feed-sequence`, `FiniteFieldsAndCharacterSums:FF.4/geometric-trace-pair-fibres`, `FiniteFieldsAndCharacterSums:FF.4/periodic-correlation`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §14.5, Theorem 14.5.1 and proof, pp. 335–336. Pins the conjugation order and repairs the feed-zero and scalar-domain ambiguities in the printed passage.

Acceptance:

- For constant feeds f=g=1, both cases give |K|−1, including the x=0 subtraction.

#### Gordon–Mills–Welch sequences

**ID:** `FiniteFieldsAndCharacterSums:FF.4/gmw-feed-sequence`  \
**Kind:** construction. **Suggested name:** `gmwSequence`.

In the geometric tower F_p⊂L⊂K, choose h≥1 with gcd(h,|L|−1)=1. Define gmwSequence(h)=geometricSequence(u↦Tr_{L/F_p}(u^h)). Its accepted parameter data include the power-permutation hypothesis.

Hypotheses: p prime; compatible finite fields; primitive α∈K; h positive and coprime to |L|−1.

Proof route:
1. Use the geometric construction and the native power and trace maps.
2. Power h is a permutation of L including zero; combine this with the trace feed API. No assumption that h is a power of p is made in the construction.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/geometric-feed-sequence`, `mathlib:Algebra.trace`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §14.6, (14.6), p. 336. The exact nonlinear feed and its coprimality hypothesis.

Uses: GK09 Theorem 14.6.1 — Power permutation proves symbol/block balance and the base-feed autocorrelation; trace transitivity identifies the linear-feed case..

| API name | Role | Contract |
| --- | --- | --- |
| `gmwSequence` | constructor | The GMW word with its admissible h. |
| `gmwSequence_apply` | simp | Its i-th value is Tr_{L/F_p}((Tr_{K/L}(α^i))^h). |
| `gmwSequence_frobeniusExponent` | compatibility | For h=p^s it equals the parent K/F_p trace m-sequence. |
| `gmwFeed_zero` | simp | The feed takes 0 to 0. |

Unit tests:

- `gmw_exponent_one` (compatibility): h=1 gives the K/F_p m-sequence.
- `gmw_feed_zero` (degenerate): Tr(0^h)=0 for admissible h≥1.
- `gmw_bad_exponent` (non-example): For L=F_4 and h=3, u↦Tr_{F_4/F_2}(u³) is zero everywhere, so omitting coprimality gives a constant zero word.

Acceptance:

- When h=p^s, the feed is simply Tr(u), hence this is the ordinary K/F_p m-sequence.

Atlas planet: **Gordon–Mills–Welch sequences**.

#### GMW perfect autocorrelation and period

**ID:** `FiniteFieldsAndCharacterSums:FF.4/gmw-period-autocorrelation`  \
**Kind:** theorem. **Suggested name:** `gmw_autocorrelation`.

For every nontrivial additive character ψ of F_p, GMW autocorrelation is |K|−1 at zero shift and −1 at every nonzero shift. Its exact period is |K|−1. Each symbol a∈F_p occurs |K|/p−1 times if a=0, and |K|/p times otherwise.

Hypotheses: The admissible GMW data; q=|L|; m=[K:L].

Proof route:
1. Change variables v=u^h in the base feed: imbalance is zero by trace surjectivity and character orthogonality.
2. For C∈L×\{1}, f(Cu)=Tr(C^h v) after the substitution, and C^h≠1. The feed autocorrelation is zero by trace nondegeneracy. Apply geometric-correlation-formula; outside L the imbalances are zero as well.
3. A proper period would have autocorrelation |K|−1 at a nonzero shift, a contradiction. Count fibres of trace and the power permutation, then remove x=0 for symbol zero.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/gmw-feed-sequence`, `FiniteFieldsAndCharacterSums:FF.4/geometric-correlation-formula`, `mathlib:AddChar.expect_eq_ite`, `mathlib:Algebra.trace_surjective`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §14.6, Theorem 14.6.1 and proof, pp. 336–338. The proof must retain the h-power in feed hyperplanes; substitute v=u^h and C^h before applying trace orthogonality.

Acceptance:

- For L=K=F_4,p=2,h=1, the binary word has one zero and two ones, with autocorrelation −1 off zero.

#### GMW block distribution

**ID:** `FiniteFieldsAndCharacterSums:FF.4/gmw-block-distribution`  \
**Kind:** theorem. **Suggested name:** `gmw_block_count`.

For 1≤j≤m=[K:L], any length-j word w over F_p occurs p^(em−j)−1 times if w is all zero, and p^(em−j) times otherwise, in one GMW period, where |L|=p^e.

Hypotheses: The admissible GMW data; 1≤j≤m, not arbitrary j≤em.

Proof route:
1. The consecutive L-valued trace state of length m is the parent m-sequence state bijection K×→L^m\{0}. Its first j coordinates therefore have q^(m−j) fibres, minus one for zero.
2. Apply the coordinatewise permutation u↦u^h. Each F_p trace symbol has p^(e−1) preimages in L; multiply the j counts.
3. The only excluded state is all zero, mapping to the all-zero word.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/gmw-feed-sequence`, `FiniteFieldsAndCharacterSums:FF.4/m-sequence-state-cycle`, `mathlib:Algebra.trace_surjective`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §14.6, block-distribution proof of Theorem 14.6.1, p. 337. The exact count, generalized from the displayed j=m case to every j≤m.

Acceptance:

- At j=m the count is p^(m(e−1)), with one removed for zero, matching the source.

#### GMW Frobenius feed comparison

**ID:** `FiniteFieldsAndCharacterSums:FF.4/gmw-frobenius-feed-comparison`  \
**Kind:** comparison. **Suggested name:** `gmw_frobenius_eq_trace`.

If h=p^s, the GMW word is exactly Tr_{K/F_p}(α^i), and hence has the parent shift-and-add property. No shift-and-add assertion is made for arbitrary h coprime to |L|−1.

Hypotheses: The GMW tower; s≥0, h=p^s.

Proof route:
1. Trace to the prime field is invariant under absolute p-Frobenius, so Tr(u^(p^s))=Tr(u).
2. Apply trace transitivity to identify the actual words, then import the parent m-sequence shift-and-add theorem.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/gmw-feed-sequence`, `FiniteFieldsAndCharacterSums:FF.4/m-sequence-shift-and-add`, `mathlib:Algebra.trace_trace`.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §14.6, last paragraph of the proof of Theorem 14.6.1, pp. 337–338. The comparison is stronger than a freshly proved shift-and-add special case and reuses the parent ownership.

Acceptance:

- h=1 is the usual trace word; h=p gives the same word, not merely a shift.

#### Homogeneous d-forms

**ID:** `FiniteFieldsAndCharacterSums:FF.4/homogeneous-d-form`  \
**Kind:** definition. **Suggested name:** `IsDForm`.

For finite fields L⊂K and d≥1, IsDForm(L,H,d) for H:K→L means H(ax)=a^dH(x) for every a∈L and x∈K. In particular H(0)=0. In characteristic two, d-form sequences use the feed Tr_{L/F_2}(H(α^i)^k); the correlation theorem additionally requires gcd(d,|L|−1)=gcd(k,|L|−1)=1.

Hypotheses: L,K finite fields with their actual algebra structure; d positive.

Proof route:
1. State the genuine scalar-homogeneity predicate, including a=0.
2. Trace of x^d is an example by L-linearity of trace. The source’s sequence is an ordinary function on the primitive powers, with no invented structure field for the desired correlation.

Direct prerequisites: `mathlib:Algebra.trace`, `FiniteFieldsAndCharacterSums:FF.4/geometric-feed-sequence`.

Source: [KLAPPER-TN](https://www.cs.uky.edu/~klapper/pdf/TN.pdf), §1, Definition 1.1, pp. 2–3. Original d-form convention and the coprimality data needed by the correlation theorem.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §14.7, p. 338. The definition itself does not require coprimality; its theorem does.

Uses: KLAPPER-TN Theorem 2.1; GK09 §14.7 — Scalar lines reduce correlation to phase-zero orbit counts; both exponents must permute L×..

| API name | Role | Contract |
| --- | --- | --- |
| `IsDForm` | characterisation | The scalar homogeneity predicate with every scalar, including zero. |
| `IsDForm.map_zero` | simp | Every positive-degree d-form vanishes at zero. |
| `isDForm_trace_pow` | constructor | H(x)=Tr_{K/L}(x^d) is a d-form. |
| `IsDForm.add` | structure | The sum of two degree-d forms is degree d. |
| `IsDForm.mul` | relation | The product of forms of degrees d and e has degree d+e. |

Unit tests:

- `dform_zero` (degenerate): The zero function is a d-form for every d≥1.
- `dform_trace_linear` (compatibility): Tr_{K/L} is a 1-form, agreeing with its native L-linearity.
- `dform_constant_nonexample` (non-example): The constant function 1 is not a d-form when d≥1, by setting a=0.
- `dform_nonpermutation_degree` (computation): On F_4 over itself, H(0)=0 and H(x)=1 for x≠0 is a 3-form; it exhibits why a d-form alone does not guarantee the correlation theorem.

Acceptance:

- A nonzero constant function is not a positive-degree d-form.

#### d-form correlation by zero counts

**ID:** `FiniteFieldsAndCharacterSums:FF.4/d-form-correlation-zero-count`  \
**Kind:** theorem. **Suggested name:** `dForm_corr_zero_count`.

Let F_2⊂L⊂K, |L|=q, [K:L]=m, α primitive, d,k≥1 with gcd(d,q−1)=gcd(k,q−1)=1, and H1,H2 degree-d forms. Set a_j(i)=Tr_{L/F_2}(H_j(α^i)^k), and z_t=#{x∈K×:H1(x)+H2(α^t x)=0}. Then binary periodic correlation equals (q z_t−(|K|−1))/(q−1), with the quotient in ℚ or ℝ.

Hypotheses: Characteristic two, all scalar towers; both explicit coprimality assumptions; d,k positive.

Proof route:
1. Partition K× into L×-orbits of size q−1. The phase on a scalar line scales by a^(dk), which permutes L×.
2. The sum on that line is q−1 when H1(x)^k+H2(Cx)^k=0, and −1 otherwise by nontrivial additive character orthogonality. Since k is a power-permutation exponent, the zero condition is equivalent to H1(x)+H2(Cx)=0.
3. There are z_t/(q−1) zero lines and (|K|−1−z_t)/(q−1) other lines. Count their contributions. Both divisibilities follow from homogeneity.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/homogeneous-d-form`, `FiniteFieldsAndCharacterSums:FF.4/periodic-correlation`, `mathlib:AddChar.expect_eq_ite`.

Source: [KLAPPER-TN](https://www.cs.uky.edu/~klapper/pdf/TN.pdf), Theorem 2.1 with proof, pp. 3–5. Uses the original paper’s hypotheses absent from the GK09 statement.

Source: [GK09](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf), §14.7, Theorem 14.7.1 and §14.11 Exercise 1, pp. 338,345. The formula is retained with the missing necessary coprimality assumptions restored.

Acceptance:

- For L=K=F_4,d=3,k=1, H1=1 off zero and H2=0, the printed unguarded formula would give −1 whereas correlation is 3.
- For L=K=F_4,d=1,k=3,H1=id,H2=0, the same failure shows the second assumption is necessary.

### Cyclic codes and the BCH bound

#### Words and the cyclic polynomial quotient

**ID:** `FiniteFieldsAndCharacterSums:FF.4/cyclic-word-quotient-equivalence`  \
**Kind:** construction. **Suggested name:** `cyclicWordEquiv`.

For a field F and n≥1 let R_n=AdjoinRoot(X^n−1). The map c↦class(Σ_{i<n}c_i X^i) is an F-linear equivalence (Fin n→F) ≃ₗ[F] R_n. Multiplication by the class of X corresponds to right cyclic shift s(c)_i=c_{i−1 mod n}.

Hypotheses: F any field; n≥1; no gcd(n,char F) assumption.

Proof route:
1. Use the native AdjoinRoot quotient and its monic normal form; X^n−1 has degree n.
2. The native degreeLT coefficient equivalence identifies the unique remainder with words.
3. Reduce X times the representative: the last coordinate wraps because X^n=1.

Direct prerequisites: `mathlib:AdjoinRoot`, `mathlib:AdjoinRoot.modByMonicHom`, `mathlib:Polynomial.degreeLTEquiv`.

Source: [BAZLOV23](https://personalpages.manchester.ac.uk/staff/yuri.bazlov/code/notes/ch9.pdf), Week 9, Vectors as polynomials and proof of Theorem 9.3, pp. 1–5. The word–polynomial conversion, strengthened to the native quotient linear equivalence.

Uses: SZONYI pp. 2–3; BAZLOV23 Theorem 9.3 — Supplies the precise shift direction for the ideal correspondence and polynomial checks..

| API name | Role | Contract |
| --- | --- | --- |
| `cyclicWordEquiv` | equivalence | The F-linear word-to-quotient equivalence. |
| `wordPolynomial` | data | The representative Σ c_iX^i of degree <n. |
| `wordPolynomial_coeff` | simp | For i<n its coefficient i is c_i. |
| `cyclicWordEquiv_shift` | compatibility | e(s c)=root*e(c). |
| `cyclicWordEquiv_const` | simp | The constant-coordinate basis word at i maps to root^i. |

Unit tests:

- `cyclic_word_zero` (degenerate): The zero word maps to zero.
- `cyclic_word_wrap` (computation): The shift of the word supported at n−1 maps to 1.
- `cyclic_word_n_one` (compatibility): At n=1, R_1≃ₐ[F]F and the word maps to its only coordinate.
- `cyclic_word_repeated_root` (non-example): For F_2,n=2, the class of X+1 is nonzero and has square zero; no product-of-fields identification is allowed.

Acceptance:

- Repeated-root length-two binary quotient still has dimension two.

#### Cyclic linear codes

**ID:** `FiniteFieldsAndCharacterSums:FF.4/cyclic-code-predicate`  \
**Kind:** definition. **Suggested name:** `IsCyclicCode`.

For C:TauCeti.LinearCode F (Fin n), n≥1, IsCyclicCode C means s(c)∈C whenever c∈C, where s is the right shift fixed by cyclic-word-quotient-equivalence. It is equivalent to s(C)=C because s^n=id.

Hypotheses: F field; n≥1; use the native Submodule carrier, not a new code structure.

Proof route:
1. State closure under the actual word-space linear automorphism s.
2. Iterating s gives its inverse s^(n−1), so inclusion implies equality. Submodule lattice operations preserve shift closure.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/cyclic-word-quotient-equivalence`, `tauceti:TauCeti.LinearCode`.

Source: [BAZLOV23](https://personalpages.manchester.ac.uk/staff/yuri.bazlov/code/notes/ch9.pdf), Week 9, opening Definition and E3 example, pp. 1–2. A predicate on existing linear codes, with the source’s right-shift convention.

Uses: SZONYI ideal correspondence; BAZLOV23 Lemma 9.2 — The domain of the ideal correspondence and generator/check polynomial constructions..

| API name | Role | Contract |
| --- | --- | --- |
| `IsCyclicCode` | characterisation | The right-shift closure predicate. |
| `isCyclicCode_iff_shift_eq` | characterisation | Closure iff the image under shift equals the code. |
| `IsCyclicCode.inf` | structure | The intersection of cyclic codes is cyclic. |
| `IsCyclicCode.sup` | structure | The sum of cyclic codes is cyclic. |

Unit tests:

- `cyclic_zero_code` (degenerate): The zero code is cyclic.
- `cyclic_whole_code` (compatibility): The whole native word submodule is cyclic.
- `cyclic_coordinate_nonexample` (non-example): At F_2,n=3, span{(1,0,0)} is not cyclic.
- `cyclic_even_three` (computation): At F_2,n=3, the kernel c0+c1+c2=0 is cyclic.

Acceptance:

- The zero and whole codes are cyclic; a general one-dimensional coordinate code is not.

#### Cyclic-code ideal correspondence

**ID:** `FiniteFieldsAndCharacterSums:FF.4/cyclic-code-ideal-correspondence`  \
**Kind:** construction. **Suggested name:** `cyclicIdealEquiv`.

The assignment C↦cyclicWordEquiv(C) is an order isomorphism between {C:LinearCode F (Fin n) // IsCyclicCode C} and Ideal R_n. The inverse takes the underlying F-submodule of an ideal back through cyclicWordEquiv.

Hypotheses: F field,n≥1; repeated-root cases are included.

Proof route:
1. Shift closure gives closure under X, its powers and their F-linear combinations; every quotient element has a polynomial representative. This proves multiplication closure by arbitrary R_n elements.
2. An ideal is closed under multiplication by X, giving shift closure. The native linear equivalence makes both composites identities.
3. Inclusion is preserved in both directions, supplying a genuine OrderIso and its lattice laws.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/cyclic-code-predicate`, `FiniteFieldsAndCharacterSums:FF.4/cyclic-word-quotient-equivalence`.

Source: [SZONYI](https://szonyitamas.web.elte.hu/cyclic.pdf), p. 2, first Proposition and its preceding argument. The gcd restriction is unnecessary for this algebraic correspondence; it is retained only for the roots used by BCH.

Uses: SZONYI generator proposition, p. 2 — Pull ideals back to F[X] to obtain the unique monic divisor and the membership test..

| API name | Role | Contract |
| --- | --- | --- |
| `cyclicIdealEquiv` | equivalence | The stated order isomorphism. |
| `cyclicIdealEquiv_mem` | characterisation | e(c) lies in the assigned ideal iff c∈C. |
| `cyclicIdealEquiv_inf` | structure | The correspondence preserves intersection. |
| `cyclicIdealEquiv_sup` | structure | The correspondence preserves sums. |

Unit tests:

- `cyclic_ideal_zero` (degenerate): The zero code corresponds to the zero ideal.
- `cyclic_ideal_top` (compatibility): The whole code corresponds to the unit ideal.
- `cyclic_ideal_even_three` (computation): The binary length-three even-weight code corresponds to the ideal generated by class(X+1).

Acceptance:

- There are four binary cyclic codes at n=3, matching the four ideals generated by monic divisors of X³−1.

Atlas planet: **Cyclic codes**.

#### Generator polynomial of a cyclic code

**ID:** `FiniteFieldsAndCharacterSums:FF.4/cyclic-generator-polynomial`  \
**Kind:** construction. **Suggested name:** `generatorPolynomial`.

Every cyclic C has a unique monic g∈F[X] dividing X^n−1 such that C consists of words whose representative polynomials are divisible by g. Equivalently its quotient ideal is generated by class g. Set generatorPolynomial C=g, including g=X^n−1 for C=0 and g=1 for C=⊤.

Hypotheses: F field,n≥1,C native linear code with IsCyclicCode C.

Proof route:
1. Pull its quotient ideal back along F[X]→R_n; this ideal contains X^n−1. The polynomial PID makes it principal.
2. Normalize the nonzero generator to monic; divisibility of X^n−1 follows from membership. Uniqueness holds for monic generators of the same ideal.
3. Reduction modulo X^n−1 preserves multiples of g. For degree<n representatives, membership is equivalent to g divisibility.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/cyclic-code-ideal-correspondence`.

Source: [BAZLOV23](https://personalpages.manchester.ac.uk/staff/yuri.bazlov/code/notes/ch9.pdf), Lemma 9.2 and Theorem 9.3, pp. 3–5. The null-code convention is explicit; no least-degree nonzero-word choice is attempted there.

Uses: BAZLOV23 Theorems 9.3–9.4; general BCH bound — Generates the code basis, check polynomial and root constraints..

| API name | Role | Contract |
| --- | --- | --- |
| `generatorPolynomial` | constructor | The unique monic divisor associated to C. |
| `generatorPolynomial_monic` | characterisation | g is monic. |
| `generatorPolynomial_dvd` | relation | g divides X^n−1. |
| `mem_code_iff_generator_dvd` | characterisation | c∈C iff g divides wordPolynomial c. |
| `generatorPolynomial_unique` | universal-property | Any monic divisor with that code-membership characterization equals g. |

Unit tests:

- `generator_zero` (degenerate): generatorPolynomial(0)=X^n−1.
- `generator_full` (degenerate): generatorPolynomial(⊤)=1.
- `generator_even_three` (computation): For binary E3, generatorPolynomial=X+1.
- `generator_repetition_three` (computation): For binary Rep3, generatorPolynomial=X²+X+1.

Acceptance:

- Binary even-weight length three: g=X+1. Binary repetition length three: g=X²+X+1.

#### Check polynomial of a cyclic code

**ID:** `FiniteFieldsAndCharacterSums:FF.4/cyclic-check-polynomial`  \
**Kind:** construction. **Suggested name:** `checkPolynomial`.

Set checkPolynomial C=h=(X^n−1)/g, the unique monic h with gh=X^n−1. A word c lies in C iff class(h)*cyclicWordEquiv(c)=0 in R_n. The constant coefficients of g and h are nonzero.

Hypotheses: The generator-polynomial hypotheses; n≥1.

Proof route:
1. Divisibility supplies exact Euclidean division and gh=X^n−1; monicity of g and the dividend gives monicity of h.
2. The vanishing test means X^n−1 divides h p_c, equivalently gh divides h p_c. Cancel the nonzero h in the polynomial domain to get g divides p_c.
3. Evaluate gh at zero: g(0)h(0)=−1, which proves both constants nonzero and enables reciprocal normalization.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/cyclic-generator-polynomial`, `FiniteFieldsAndCharacterSums:FF.4/cyclic-word-quotient-equivalence`.

Source: [BAZLOV23](https://personalpages.manchester.ac.uk/staff/yuri.bazlov/code/notes/ch9.pdf), Definition: check polynomial and Theorem 9.4, pp. 5–7. The annihilator test is an actual quotient-ring condition, with nonzero constants explicit.

Uses: BAZLOV23 Theorem 9.4 and Corollary 9.5 — Computes parity checks and the normalized reciprocal generator of the dual..

| API name | Role | Contract |
| --- | --- | --- |
| `checkPolynomial` | constructor | The monic quotient h. |
| `generator_mul_check` | relation | g*h=X^n−1. |
| `checkPolynomial_monic` | characterisation | h is monic. |
| `mem_code_iff_check_annihilates` | characterisation | c∈C iff class(h)*e(c)=0. |
| `checkPolynomial_coeff_zero_ne` | data | h(0)≠0. |

Unit tests:

- `check_zero` (degenerate): The zero code has h=1.
- `check_full` (degenerate): The whole code has h=X^n−1.
- `check_even_three` (computation): For binary E3, h=X²+X+1.
- `check_wrong_annihilator` (non-example): For binary E3, class(g)*class(g)=class(X²+1)≠0, so g cannot replace h in the annihilator test.

Acceptance:

- Do not substitute g in the annihilator test: it is h that annihilates the code ideal.

#### Dimension and polynomial basis of a cyclic code

**ID:** `FiniteFieldsAndCharacterSums:FF.4/cyclic-code-dimension`  \
**Kind:** theorem. **Suggested name:** `cyclicCode_finrank`.

A cyclic code with monic generator g has dimension n−natDegree(g). The word representatives of g,Xg,…,X^(n−deg g−1)g form an F-basis. The zero code has the empty basis.

Hypotheses: F field,n≥1; no squarefreeness assumption.

Proof route:
1. Every degree<n multiple of g is g times a polynomial of degree<n−deg g, by degree additivity.
2. Multiplication by nonzero g is an injective F-linear map from this degree-bounded space onto C. Its monomial basis maps to the listed basis.
3. Use the native degreeLT coefficient equivalence to calculate the dimension.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/cyclic-generator-polynomial`, `mathlib:Polynomial.degreeLTEquiv`.

Source: [BAZLOV23](https://personalpages.manchester.ac.uk/staff/yuri.bazlov/code/notes/ch9.pdf), Theorem 9.3 and generator matrix in Theorem 9.4, pp. 4–7. The basis proof and dimension n−deg g, with zero-code boundary.

Acceptance:

- Binary E3 has dimension two, Rep3 dimension one, and the zero code dimension zero.

#### Normalized reciprocal generator of the dual

**ID:** `FiniteFieldsAndCharacterSums:FF.4/cyclic-dual-generator`  \
**Kind:** theorem. **Suggested name:** `cyclicCode_dual_generator`.

The Euclidean dual C⊥ of a cyclic code is cyclic, and its monic generator is h(0)⁻¹*h.reverse, where h=checkPolynomial C. The reversal has its genuine polynomial degree deg h; no fixed-length word reversal is substituted.

Hypotheses: F field,n≥1; native dot-product annihilator of C; h(0)≠0 follows from generator_mul_check.

Proof route:
1. Right shift is an orthogonal coordinate permutation; the dual is shift invariant.
2. Dot products with the generator basis become coefficients of products with reversed h, and gh=X^n−1 makes them zero.
3. The reciprocal-generated code has dimension deg g, matching dim C⊥ by native LinearMap.BilinForm.finrank_orthogonal, after checking dot-product nondegeneracy against coordinate vectors. Scale by h(0)⁻¹ to make its leading coefficient one; generator uniqueness identifies it.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/cyclic-check-polynomial`, `FiniteFieldsAndCharacterSums:FF.4/cyclic-code-dimension`, `mathlib:dotProductBilin`, `mathlib:LinearMap.BilinForm.finrank_orthogonal`.

Source: [BAZLOV23](https://personalpages.manchester.ac.uk/staff/yuri.bazlov/code/notes/ch9.pdf), Theorem 9.4 and Corollary 9.5, pp. 6–7. The source explicitly requires monic normalization; the unscaled version in SZONYI is interpreted only as an ideal generator.

Acceptance:

- The dual of binary E3 is Rep3; the dual of the whole code is the zero code.

#### General consecutive-root BCH bound

**ID:** `FiniteFieldsAndCharacterSums:FF.4/general-cyclic-bch-bound`  \
**Kind:** theorem. **Suggested name:** `cyclic_bch_bound`.

Let C be a cyclic length-n code over F, and ζ in a field extension E/F have exact multiplicative order n. Suppose its generator has roots ζ^b,…,ζ^(b+δ−2), where 2≤δ≤n+1. Every nonzero word of C has Hamming weight at least δ. The numerical minimum-distance statement requires C≠0; at δ=n+1 this hypothesis is impossible and the word statement correctly forces C=0.

Hypotheses: n≥1; F,E fields; ζ primitive n-th root, hence char(F)∤n; b≥0; 2≤δ≤n+1.

Proof route:
1. If a nonzero word had t<δ nonzero coordinates e_j, its vanishing at the first t consecutive roots gives a square linear system on the nonzero coefficients times ζ^(b e_j).
2. The system matrix has entries (ζ^e_j)^i. Distinct exponents modulo n and exact root order give distinct entries. Native det_vandermonde_ne_zero_iff makes this matrix invertible, contradicting nonzero coefficients.
3. Import the parent primitive narrow-sense BCH construction as a specialization, instead of adding a second BCH definition. Guard any default-valued minimum-distance invariant by C≠0.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/cyclic-generator-polynomial`, `mathlib:Matrix.det_vandermonde_ne_zero_iff`, `mathlib:hammingNorm`.

Source: [SZONYI](https://szonyitamas.web.elte.hu/cyclic.pdf), p. 3, Proposition (BCH bound). The general cyclic-code consecutive-root form, with explicit primitive-root and nonzero-code conventions.

Acceptance:

- The binary length-seven code with g=X³+X+1 and primitive ζ satisfying g(ζ)=0 has ζ,ζ² as roots, giving distance≥3; it has dimension four.
- At δ=n+1, C is zero; a convention assigning distance zero to the zero code cannot satisfy a numerical d≥δ statement.

### Hermitian evaluation codes

#### Hermitian monomial evaluation code

**ID:** `FiniteFieldsAndCharacterSums:FF.4/hermitian-monomial-code`  \
**Kind:** construction. **Suggested name:** `hermitianCode`.

Let p be prime and K have p² elements. Let HermitianPoints={ (x,y)∈K² : y^p+y=x^(p+1) }. For l≥0 let V_l be the K-span in MvPolynomial(Fin 2,K) of X^iY^j with i≤p and i+j≤l. Let HermitianCode p l be the native LinearCode K HermitianPoints given by the image of f↦(f(x,y)) on V_l. The coordinate type is the actual point set; no arbitrary choice of a point ordering enters the definition.

Hypotheses: p prime; K finite field of cardinality p²; l≥0.

Proof route:
1. Use the native two-variable polynomial algebra, distinct monomial basis and Submodule.span to define V_l.
2. Evaluation at each point is K-linear; its restriction to V_l has an actual Submodule image in the word space.
3. The point carrier is a finite subtype of K×K, and therefore supplies an intrinsic finite coordinate type.

Direct prerequisites: `mathlib:Submodule.span`, `tauceti:TauCeti.LinearCode`.

Source: [ECT25](https://cse.buffalo.edu/faculty/atri/courses/coding-theory/book/web-coding-book.pdf), Exercise 5.23(1),(4),(5), p. 111. The explicit code, extended to l=0 and corrected for the small-l dimensional range.

Source: [ECT26](https://cse.buffalo.edu/faculty/atri/courses/coding-theory/book/ada-coding-book.pdf), Exercise 5.23, pp. 109–110, corresponding item(s) in the recorded 2025 locator. The corresponding 2026 accessibility revision was collated; the dimension formula still needs the corrected lower-range guard.

Uses: ECT25 Exercise 5.23; parent AG-code parameter targets — A concrete long code whose native curve comparison makes its dimension and designed distance computable..

| API name | Role | Contract |
| --- | --- | --- |
| `HermitianPoints` | data | The finite subtype defined by the affine Hermitian equation. |
| `hermitianMessageSpace` | constructor | V_l is the span of the stated distinct monomials. |
| `hermitianEval` | data | The K-linear evaluation map on V_l to the actual point word space. |
| `hermitianCode` | constructor | Its native linear-code image. |
| `mem_hermitianCode` | characterisation | c lies in the code iff c=ev(f) for some f∈V_l. |
| `hermitianCode_mono` | functoriality | If l≤l′ then HermitianCode p l≤HermitianCode p l′. |

Unit tests:

- `hermitian_degree_zero` (degenerate): V_0 is the one-dimensional constants and the code is the repetition code on the point set.
- `hermitian_p_two_l_one` (computation): For p=2,l=1, the message basis is 1,X,Y and the code has length eight and dimension three.
- `hermitian_p_two_l_two` (computation): For p=2,l=2 the message basis is 1,X,Y,X²,XY,Y² and the code has length eight and dimension six.
- `hermitian_noninjective_boundary` (non-example): For p=2,l=3, the nonzero polynomial XY²+XY+X belongs to V_3 and vanishes at all eight points; evaluation is not injective.

Acceptance:

- At p=2, l=0,1,2 the message dimensions are 1,3,6; the lengths are eight.

#### Hermitian affine point count

**ID:** `FiniteFieldsAndCharacterSums:FF.4/hermitian-affine-point-count`  \
**Kind:** theorem. **Suggested name:** `hermitianPoints_card`.

For K of size p², the equation y^p+y=x^(p+1) has exactly p³ solutions in K².

Hypotheses: p prime; char K=p; |K|=p².

Proof route:
1. Over the prime subfield, y^p+y is the trace K/F_p, and x^(p+1) is the norm, hence belongs to F_p.
2. Trace is surjective with kernel size p. Thus every x∈K has exactly p corresponding y values.
3. Multiply |K|*p=p³; no Weil point-count estimate is involved.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/hermitian-monomial-code`, `mathlib:Algebra.trace_surjective`, `mathlib:FiniteField.algebraMap_norm_eq_pow`.

Source: [ECT25](https://cse.buffalo.edu/faculty/atri/courses/coding-theory/book/web-coding-book.pdf), Exercise 5.23(1), p. 111. Elementary trace–norm point count, independent of FF.2.

Source: [ECT26](https://cse.buffalo.edu/faculty/atri/courses/coding-theory/book/ada-coding-book.pdf), Exercise 5.23, pp. 109–110, corresponding item(s) in the recorded 2025 locator. The corresponding 2026 accessibility revision was collated; the dimension formula still needs the corrected lower-range guard.

Acceptance:

- p=2 has eight affine points, plus one projective place at infinity in the curve-model supplier.

#### Hermitian message-space dimension

**ID:** `FiniteFieldsAndCharacterSums:FF.4/hermitian-message-dimension`  \
**Kind:** theorem. **Suggested name:** `hermitianMessage_finrank`.

The dimension of V_l is Σ_{i=0}^{min(p,l)}(l−i+1). For l≤p this is (l+1)(l+2)/2. For l≥p−1 it is (l+1)(p+1)−p(p+1)/2, with the equality interpreted in ℤ or after proving natural nonnegativity. The formulas agree at their overlap.

Hypotheses: p prime; l≥0; the last formula requires l≥p−1.

Proof route:
1. Distinct monomials form the native polynomial basis. For each allowed X-exponent i there are l−i+1 allowed Y-exponents.
2. Count the triangular sum when l≤p. For l≥p−1, extend through i=p; the extra term at l=p−1 is zero and gives the rectangular-minus-triangle formula.
3. The printed closed formula for all l≥1 is false; the sum is the primary statement.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/hermitian-monomial-code`.

Source: [ECT25](https://cse.buffalo.edu/faculty/atri/courses/coding-theory/book/web-coding-book.pdf), Exercise 5.23(4), p. 111. Corrects the range of the rectangular monomial count.

Source: [ECT26](https://cse.buffalo.edu/faculty/atri/courses/coding-theory/book/ada-coding-book.pdf), Exercise 5.23, pp. 109–110, corresponding item(s) in the recorded 2025 locator. The corresponding 2026 accessibility revision was collated; the dimension formula still needs the corrected lower-range guard.

Acceptance:

- p=5,l=1 gives dimension 3, whereas the printed formula gives −3.
- p=2,l=2 gives dimension 6.

#### Hermitian code and a native Riemann–Roch space

**ID:** `FiniteFieldsAndCharacterSums:FF.4/hermitian-riemann-roch-comparison`  \
**Kind:** comparison. **Suggested name:** `hermitianCode_eq_agCode`.

For the supplier’s native Hermitian function field H/K with coordinate functions x,y, unique rational P∞, and all affine rational places identified with HermitianPoints, the map X^iY^j↦x^iy^j identifies V_l with riemannRochSpace(l(p+1)P∞). Under this equivalence hermitianEval is the parent rational-place evaluation map, so HermitianCode p l equals C_L(D,l(p+1)P∞) after the point–place coordinate equivalence.

Hypotheses: Supplier gives IsFunctionField K H, exact constants IsIntegrallyClosedIn K H, the affine coordinate-ring model with basis 1,x,…,x^p over K[y], P∞ unique at infinity, ord∞x=−p, ord∞y=−(p+1), and genus p(p−1)/2. These are an explicit requested contract, not extra fields of a fabricated structure.

Proof route:
1. Import the native model, affine regular-functions/coordinate-ring bridge and pole-order basis theorem from AlgebraicCurves layers 2 and 10.
2. The weights pi+(p+1)j for 0≤i≤p are distinct: equality implies i−i′ is a multiple of p+1 and hence zero. Thus pole orders do not cancel in a nonzero normal-form sum.
3. For 0≤i≤p, pi+(p+1)j≤l(p+1) iff i+j≤l, since pi+(p+1)j=(p+1)(i+j)−i. This proves exactly the V_l basis, even at small l.
4. The supplier’s residue-field equivalences send x,y to affine coordinates. Native rational evaluation then agrees pointwise, identifying the code images.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/hermitian-monomial-code`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves`, `tauceti:TauCeti.riemannRochSpace`, `FiniteFieldsAndCharacterSums:FF.4/algebraic-geometry-evaluation-code`.

Source: [ECT25](https://cse.buffalo.edu/faculty/atri/courses/coding-theory/book/web-coding-book.pdf), Exercise 5.23(2)–(6), p. 111. The explicit monomial code is compared with the parent AG construction through the native curve model; ECT’s Bezout hint is not rebuilt here.

Source: [ECT26](https://cse.buffalo.edu/faculty/atri/courses/coding-theory/book/ada-coding-book.pdf), Exercise 5.23, pp. 109–110, corresponding item(s) in the recorded 2025 locator. The corresponding 2026 accessibility revision was collated; the dimension formula still needs the corrected lower-range guard.

Acceptance:

- For p=2,l=1 the weighted bound is 3 and includes 1,x,y; for l=2 it includes the six monomials listed in the construction.

#### Hermitian code dimension and designed distance

**ID:** `FiniteFieldsAndCharacterSums:FF.4/hermitian-code-parameters`  \
**Kind:** theorem. **Suggested name:** `hermitianCode_parameters`.

If l(p+1)<p³, HermitianCode p l has length p³, dimension Σ_{i=0}^{min(p,l)}(l−i+1), and minimum distance at least p³−l(p+1). If also l≥p−1, this lower bound equals n−k+1−p(p−1)/2. The positive designed-distance condition makes evaluation injective and the code nonzero.

Hypotheses: p prime, K of size p², l≥0; l(p+1)<p³; use the supplier’s exact-constant Hermitian model.

Proof route:
1. Use hermitian-affine-point-count for n.
2. Apply the parent evaluation-code kernel and Goppa bound to G=l(p+1)P∞. Since deg G<n, the kernel L(G−D) is zero by negative degree; dimension is dim V_l.
3. Use hermitian-message-dimension, and only in its valid range rewrite the designed distance in n,k,genus form. The restriction excludes the concrete noninjective p=2,l=3 case.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/hermitian-affine-point-count`, `FiniteFieldsAndCharacterSums:FF.4/hermitian-message-dimension`, `FiniteFieldsAndCharacterSums:FF.4/hermitian-riemann-roch-comparison`, `FiniteFieldsAndCharacterSums:FF.4/ag-code-dimension`, `FiniteFieldsAndCharacterSums:FF.4/goppa-bound`.

Source: [ECT25](https://cse.buffalo.edu/faculty/atri/courses/coding-theory/book/web-coding-book.pdf), Exercise 5.23(5)–(6), p. 111. Uses the corrected dimension and a positive designed distance; general Bezout is not claimed as a library baseline.

Source: [ECT26](https://cse.buffalo.edu/faculty/atri/courses/coding-theory/book/ada-coding-book.pdf), Exercise 5.23, pp. 109–110, corresponding item(s) in the recorded 2025 locator. The corresponding 2026 accessibility revision was collated; the dimension formula still needs the corrected lower-range guard.

Acceptance:

- p=2,l=0: [8,1,8]; l=1: [8,3,d≥5]; l=2: [8,6,d≥2].
- The dimension claim is not extended to l=3,p=2, where a nine-dimensional message space maps to eight coordinates with a nonzero kernel.

### Norm-one sums and finite upper half-plane spectra

#### Soto–Andrade norm-one sums

**ID:** `FiniteFieldsAndCharacterSums:FF.4/soto-andrade-norm-one-sum`  \
**Kind:** definition. **Suggested name:** `sotoAndradeSum`.

For an odd finite field F of size q, a quadratic extension K/F, U={u∈K×:Norm_{K/F}(u)=1}, a multiplicative character ε:F×→ℂ×, a character ω:U→ℂ× and t∈F, set S(ε,ω,t)=Σ_{u∈U} ε₀(Tr_{K/F}(u)+t)ω(u), where ε₀(0)=0 even for the trivial character.

Hypotheses: K/F degree two, F finite and odd; actual norm-one subgroup of units; complex unit-valued characters.

Proof route:
1. Take the kernel of the native norm homomorphism on K× and a finite sum of character values.
2. Define zero extension explicitly, then compose trace plus t with ε₀. Keep ω on U rather than on all K×.

Direct prerequisites: `mathlib:Algebra.trace`, `mathlib:FiniteField.unitsMap_norm_surjective`.

Source: [KATZ93](https://web.math.princeton.edu/~nmk/old/sotosums.pdf), Theorem 1, pp. 143–144, specialized to n=2. The published definition with zero extension even for trivial ε; no engineering value at zero is used.

Uses: KATZ93 Theorem 1; KUANG94 spherical cuspidal eigenvalues — The cuspidal spectral sum uses ε quadratic and t=a/δ−2, away from both degeneracies..

| API name | Role | Contract |
| --- | --- | --- |
| `NormOneUnits` | data | The subgroup ker(Norm:K×→F×). |
| `sotoAndradeSum` | data | The complex finite sum with ε₀(0)=0. |
| `normOneUnits_card` | data | The cardinality is q+1. |
| `sotoAndradeSum_trivial` | characterisation | With both characters trivial, S=q+1−#{u∈U:Tr(u)+t=0}. |
| `sotoAndradeSum_inversion` | relation | S(ε,ω,t)=S(ε,ω⁻¹,t), since trace is invariant under u↦u⁻¹ on U. |

Unit tests:

- `soto_trivial_zero_extension` (non-example): With both characters trivial, a term with Tr(u)+t=0 contributes zero, not one.
- `soto_q_three_trivial` (computation): For F_3⊂F_9 and t=0, both trivial characters give S=2, since exactly two U-elements have trace zero.
- `soto_q_three_quadratic` (computation): For F_3⊂F_9,t=0, ε quadratic and ω of order four, S=−2.
- `soto_inverse_character` (compatibility): Replacing ω by its inverse leaves S unchanged.

Acceptance:

- |U|=q+1. Tr(u)+t vanishes at at most two U-elements.

#### Katz estimate for the quadratic norm torus

**ID:** `FiniteFieldsAndCharacterSums:FF.4/katz-quadratic-torus-estimate`  \
**Kind:** theorem. **Suggested name:** `sotoAndrade_norm_le`.

For the norm-one sum above, |S(ε,ω,t)|≤2√q unless (ε=1 and ω=1), or (ε and ω both have exact order two and t∈{2,−2}). If t=±2 outside these exceptions, the stronger |S|≤√q follows from a one-dimensional H¹_c.

Hypotheses: q odd; K/F degree two; characters finite order; exclusions are exact orders, not merely orders dividing two.

Proof route:
1. Compactify the norm-one torus to a genus-zero curve; over the algebraic closure the coordinate z gives Tr(u)=z+z⁻¹. Remove the zeros of z²+tz+1. There are two distinct roots unless t=±2, when there is one double root.
2. Use the FF.1 Lang-torsor character sheaf for ω and the FF.2 Kummer sheaf for ε composed with trace+t. These have rank one, finite monodromy, weight zero and tame ramification. Their Frobenius trace is the summand, including its zero extension on removed points.
3. Geometric triviality occurs exactly in the two excluded cases: for a simple root ε is visible in inertia; for a double root the conditions are ε²=1 and the remaining torus monodromy compatible with ε. Nontriviality kills H²_c; nonproperness kills H⁰_c.
4. The genus-zero tame Euler characteristic is −2 or −1, so dim H¹_c is two or one. Transfer the parent compact-support trace formula to the Lang character sheaf and use DWP.7’s weight ≤1 bound. Each Frobenius eigenvalue has complex norm≤√q. Sum them. The supplier contracts and their still-open Euler-characteristic/weight gaps are explicitly retained.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/soto-andrade-norm-one-sum`, `FiniteFieldsAndCharacterSums:FF.1`, `FiniteFieldsAndCharacterSums:FF.2/kummer-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/lisse-sheaf-extremal-cohomology-on-curve`, `FiniteFieldsAndCharacterSums:FF.2/h1c-conductor-bound`, `DeligneWeightsAndPurity:DWP.7`, `EtaleDualityAndPerverseSheaves:EDC.2`.

Source: [KATZ93](https://web.math.princeton.edu/~nmk/old/sotosums.pdf), Theorem 1, p. 143; proof for n=2, pp. 145–149. Published proof decomposed through the actual norm-one Lang character sheaf, tameness, cohomology dimension and weights.

Acceptance:

- q=3, ε quadratic and ω of order four, t=0 gives |S|=2≤2√3.
- At q=5, ε and ω quadratic and t=2, |S|=5>2√5, so the exceptional hypothesis is necessary.

Atlas planet: **Soto–Andrade estimate**.

#### Character sums for Terras eigenvalues

**ID:** `FiniteFieldsAndCharacterSums:FF.4/terras-spectral-character-transfer`  \
**Kind:** theorem. **Suggested name:** `terras_eigenvalue_character_sum`.

In the parent finite upper half-plane over F_q, q odd, δ nonsquare, and a∉{0,4δ}, each nontrivial adjacency eigenvalue is, up to a sign, either Jχ(a)=Σ_{y∈F×}χ(y)χ₂(a y+δ(y−1)²) for a nontrivial multiplicative χ of F×, or S(χ₂,ω,a/δ−2) for a nontrivial character ω of the quadratic norm-one group. Here χ₂(0)=0. Hence every such eigenvalue has norm≤2√q, supplying the parent terras-graph-ramanujan target.

Hypotheses: The parent graph and Gelfand-pair conventions; q odd; a≠0,4δ; χ₂ is the quadratic character.

Proof route:
1. Import the parent Gelfand-pair simultaneous diagonalization. Induced principal-series eigenvalues are obtained by counting x²=a y+δ(y−1)²: the 1 term vanishes after summing a nontrivial χ, leaving Jχ. The quadratic twist of Steinberg is included by χ=χ₂.
2. Cuspidal spherical functions reduce to the quadratic norm-one sum with t=a/δ−2. Exact normalization and coverage of every spherical representation are not inferred from the brief preprint: the odd-characteristic Evans/Kuang derivation is a recorded gap requiring verification.
3. For Jχ, its rank-one mixed Kummer sheaf on P¹ minus 0,∞ and the two roots has geometric nontriviality, tame conductor and dim H¹_c≤2. The discriminant a(a−4δ) is nonzero, so roots are distinct. Import the corresponding FF.2 mixed-character Weil bound.
4. For the cuspidal sum t≠±2 and ω≠1, apply katz-quadratic-torus-estimate; neither exception survives. Both routes give 2√q. No second Ramanujan theorem node duplicates the parent target.

Direct prerequisites: `FiniteFieldsAndCharacterSums:FF.4/finite-upper-half-plane-gelfand-pair`, `FiniteFieldsAndCharacterSums:FF.4/terras-graph-regular`, `FiniteFieldsAndCharacterSums:FF.4/katz-quadratic-torus-estimate`, `FiniteFieldsAndCharacterSums:FF.2`.

Source: [KUANG94](https://arxiv.org/pdf/math/9411217), §§3–5 and §8, pp. 1–4; comparison theorem proof on p. 3. Source for the spherical-to-character transfer; normalization and exhaustiveness remain a bounded gap, rather than an unverified library claim.

Source: [KATZ93](https://web.math.princeton.edu/~nmk/old/sotosums.pdf), Theorem 1 and n=2 proof, pp. 143–149. Bounds the cuspidal character sums after the nondegenerate graph parameter substitution.

Acceptance:

- For q=3,δ=−1,a=1, the six-vertex 4-regular graph has spectrum 4,0,0,0,−2,−2, within the bound off the trivial eigenvalue.
- At a=0 or4δ the graph/character geometry degenerates; the theorem excludes both.

## Supplier contracts and precise gaps

### tauceti:TauCetiRoadmap/AlgebraicCurves#layer-10-model-classes--elliptic-hyperelliptic-plane-curves

Provide the native Hermitian function field H/K for |K|=p², y^p+y=x^(p+1), IsFunctionField K H and exact constants IsIntegrallyClosedIn K H; a unique degree-one place P∞ with pole orders p and p+1 for x,y; affine regular-function coordinate ring free on 1,x,…,x^p over K[y]; an equivalence between the p³ affine points and all remaining degree-one places compatible with residues; genus p(p−1)/2. No Hermitian model with these theorems was found at the pin. Import the existing curve roadmap and route its missing model as AlgebraicCurves, Part II.

Consumers: `FiniteFieldsAndCharacterSums:FF.4/hermitian-riemann-roch-comparison`, `FiniteFieldsAndCharacterSums:FF.4/hermitian-code-parameters`.

### DeligneWeightsAndPurity:DWP.7

For a geometrically nontrivial, finite-monodromy, tame rank-one sheaf of weight zero on the punctured quadratic norm torus, supply the Frobenius weights ≤1 on H¹_c (mixed compact-support form). Identify any duality/affine bridge from the weight statement actually supplied. A pure weight-one assertion is not assumed. The exceptional t=±2 has one-dimensional H¹_c; otherwise it has dimension two.

Consumers: `FiniteFieldsAndCharacterSums:FF.4/katz-quadratic-torus-estimate`, `FiniteFieldsAndCharacterSums:FF.4/terras-spectral-character-transfer`.

### EtaleDualityAndPerverseSheaves:EDC.2

Owner decision required for the genus-zero tame Euler–Poincaré formula χ_c(U,L)=rank(L)(2−#punctures), and H⁰_c=H²_c=0 for a nonproper geometrically connected U and geometrically nontrivial rank-one L. EDC.2 is a proposed route inherited from the parent gap, not a claim that this theorem is already in its stated scope. For the quadratic norm torus the punctures over the algebraic closure are 0,∞ and two roots of z²+tz+1, or one double root at t=±2.

Consumers: `FiniteFieldsAndCharacterSums:FF.4/katz-quadratic-torus-estimate`.

### FiniteFieldsAndCharacterSums:FF.1 assembly input

Rank-one Lang character sheaf on the quadratic norm torus: rational-point trace ω, finite monodromy and tame rank-one structure. Import/promote the accepted EXT-08 supplier when assembled; do not create a second generic character-sheaf definition in FF.4.

Consumers: `FiniteFieldsAndCharacterSums:FF.4/katz-quadratic-torus-estimate`.

### FiniteFieldsAndCharacterSums:FF.2 assembly input

Compact-support trace formula and mixed Kummer bound for the actual Lang/Kummer tensor sheaves used here. For Jχ(a), the punctures are 0,∞ and the roots of δy²+(a−2δ)y+δ, with discriminant a(a−4δ)≠0; geometric nontriviality, χ_c and dim H¹_c≤2 must be checked.

Consumers: `FiniteFieldsAndCharacterSums:FF.4/katz-quadratic-torus-estimate`, `FiniteFieldsAndCharacterSums:FF.4/terras-spectral-character-transfer`.

### Norm-one Lang character sheaf and trace formula

FF.1 must add or import the rank-one Lang-torsor sheaf for a character of the quadratic norm-one torus, including its rational-point Frobenius trace, finite monodromy and tameness. The accepted EXT-08 external packet has a Lang-torsor node, but it was not integrated and is not a resolvable parent ID. FF.2 must extend its AS/Kummer trace formula to this sheaf; the ordinary G_m Kummer sheaf alone does not provide ω on the nonsplit torus. Supplier contract recorded under sameRoadmapNeeds.

Consumers: `FiniteFieldsAndCharacterSums:FF.4/katz-quadratic-torus-estimate`.

### Euler characteristic owner and compact-support weights

The precise EDC.2 and DWP.7 requests above remain open. Resolve the EXT-08 reviewer’s Euler–Poincaré owner and weight-input questions before claiming the Katz estimate closed. The theorem node decomposes the published proof; no absent cohomology theorem is declared proved.

Consumers: `FiniteFieldsAndCharacterSums:FF.4/katz-quadratic-torus-estimate`, `FiniteFieldsAndCharacterSums:FF.4/terras-spectral-character-transfer`.

### Odd-characteristic spherical normalization and exhaustiveness

Read the complete odd-q Evans/Kuang representation-theoretic derivation, match adjacency to the parent distance a and root δ, and establish that every nontrivial spherical summand is exactly, up to sign, Jχ or the stated Soto–Andrade sum, including the quadratic twist of Steinberg. Kuang’s brief preprint and the q=3 computation do not certify this exhaustive transfer. The inherited Kuang normalization source issue E748 remains owned by the parent.

Consumers: `FiniteFieldsAndCharacterSums:FF.4/terras-spectral-character-transfer`.

### Native Hermitian model export

The AC layer-10 request requires actual coordinate functions, places and pole orders on a native function field, rather than a structure with asserted curve facts. The affine polynomial code and its elementary length/message dimension are independently defined. The Riemann–Roch comparison and distance route consume the requested geometric export.

Consumers: `FiniteFieldsAndCharacterSums:FF.4/hermitian-riemann-roch-comparison`, `FiniteFieldsAndCharacterSums:FF.4/hermitian-code-parameters`.

### Bent-character cyclotomic transport

For a prime output field, export the native cyclotomic automorphism sending ζ_p to ζ_p^a, prove that it commutes with complex conjugation on character sums, and transports an integral squared norm. This is the exact use of GK09 Lemma 3.2.12. The suggested prime-character signature is stated; a compiled transport API was not established. No claim is made for an arbitrary extension output field.

Consumers: `FiniteFieldsAndCharacterSums:FF.4/bent-prime-character-independence`.

### Source collation at the versions of record

Public GK09/GK11 drafts and WU12 v2 were read and compared at the locators recorded in sourceIssues. The Cambridge 2012 text and Wu–Liu version of record were not served in the bounded publisher search; do not promote draft findings to published errata. Parent Shallue/Bluher and other preprint collation remains owned by its earlier coverage. The ECT25 finding is scoped to the recorded 2025 draft; the 2026 accessibility revision was read and the same formula persists; neither is a publisher version of record.

Consumers: `FiniteFieldsAndCharacterSums:FF.4/normal-trace-coefficient-pattern`, `FiniteFieldsAndCharacterSums:FF.4/matrix-polynomial-coefficient-algebra`, `FiniteFieldsAndCharacterSums:FF.4/bent-prime-character-independence`, `FiniteFieldsAndCharacterSums:FF.4/gold-binary-three-correlation-values`, `FiniteFieldsAndCharacterSums:FF.4/hermitian-message-dimension`.

## Source corrections and version boundaries

These findings await independent review. New means no existing correction was located in the recorded bounded search, not that publication collation has succeeded. Findings in GK09/GK11 remain scoped to those public drafts; the Cambridge 2012 version of record was unavailable. WU12 findings concern arXiv v2; its publisher text was unavailable. The original d-form paper supplies the known corrected hypotheses. The 2025 ECT draft and its 2026 accessibility revision were both read; the dimension formula persists in the revision.

### FiniteFieldsAndCharacterSums/E801 — misprint

WU12, arXiv v2, §6, equation (15), p. 27.

The final entry is α_(m−1)^(q^((t−1)m)), with t=n/m.

The displayed coefficient pattern has m entries per Frobenius block. The final entry in block t−1 is indexed (t−1)m+(m−1)=n−1, so its initial parameter is α_(m−1).

Effect: nothing. Existing correction: new.

### FiniteFieldsAndCharacterSums/E802 — misprint

WU12, arXiv v2, paragraph immediately before Theorem 6.4, p. 28.

The matrix-polynomial quotient is F_q[x]/(x^t−1), t=n/m.

There are t block coefficients and t cyclic blocks; Matrix_m(F_q[x]/(x^t−1)) has F_q-dimension m²t=nm. Using exponent n would give m²n, wrong for m>1. Theorem 6.4 itself uses the intended t.

Effect: nothing. Existing correction: new.

### FiniteFieldsAndCharacterSums/E803 — error

GK09, 2009 draft §13.4, paragraph after Proposition 13.4.4, p. 317; persists in GK11 §10.5, p. 218.

Only |Cb,a(t)+ϕ(B(0))|=√|E| follows from bentness. The phase of the Fourier coefficient cannot be removed.

On F_2², B(x0,x1)=x0x1 has Walsh values 2,2,2,−2 and B(0)=0. At the negative peak correlation is −3, whereas the printed right side is 1. The predecessor Proposition 13.4.1 gives the corrected identity.

Effect: a stated result. Existing correction: new.

### FiniteFieldsAndCharacterSums/E804 — error

GK09, 2009 draft §14.2, p. 322; persists in GK11 §11.2, p. 232.

Coprime decimation implies degree n; the converse is false. Degree r is the Frobenius orbit size of α^d, and primitivity is a separate property.

For F_2⊂F_16 and d=3, α^3 has order 5, hence degree 4 (the order of 2 mod 5), while gcd(3,15)=3. An exhaustive finite-field check reproduced this counterexample.

Effect: a stated result. Existing correction: new.

### FiniteFieldsAndCharacterSums/E805 — error

GK09, 2009 draft Table 14.1, p. 333, q odd and rank n−2g rows; persists in GK11 Table 11.1, p. 235.

The possible nonzero magnitude is q^(n/2+g).

For polar rank r=n−2g, the standard quadratic character-sum square is q^(2n−r)=q^(n+2g). In F_81/F_3, s=1,H=1 has radical size 9; with zero linear phase the norm is 27 rather than the printed 3. This is exactly the radical identity used in this packet.

Effect: a stated result. Existing correction: new.

### FiniteFieldsAndCharacterSums/E806 — misprint

GK09, 2009 draft §14.4 opening paragraph, p. 333; corresponding GK11 §11.4.

The primitive element belongs to the largest field L=F_(q^(2m)), not to F.

The construction immediately takes Tr_{L/E}(α^i) and requires period |L|−1; a primitive element of F cannot supply that period.

Effect: nothing. Existing correction: new.

### FiniteFieldsAndCharacterSums/E807 — misprint

GK09, 2009 draft §14.4 after the K(A) formula, p. 333; persists GK11 §11.4, p. 235.

The parameter belongs to E=F_(q^m); a trace lift Â belongs to L.

Norm(α^i) belongs to E and the outer trace has domain E. Lemma 14.4.1 itself correctly quantifies A,A′∈E.

Effect: nothing. Existing correction: new.

### FiniteFieldsAndCharacterSums/E808 — misprint

GK09, 2009 draft §14.5 opening paragraph, p. 335; persists GK11 §11.5, p. 236.

The feed codomain is F=F_p.

The output correlation uses an additive character of F on f(u), and the next GMW section writes f:L→F.

Effect: nothing. Existing correction: new.

### FiniteFieldsAndCharacterSums/E809 — misprint

GK09, 2009 draft §14.5 definition of feed correlation and proof endpoint, pp. 335–336.

The feed correlation parameter is A∈L× and the fibre factor is q^(m−1), where |L|=q.

The inside-L branch of the theorem applies to any A∈L×, and a nonzero L-linear trace fibre has q^(m−1) elements. No r is defined in that proof.

Effect: nothing. Existing correction: new.

### FiniteFieldsAndCharacterSums/E810 — misprint

GK09, 2009 draft §14.5, definition of C0 just before Theorem 14.5.1, p. 335.

With C_{g,f}=Σχ(g(u))·overline(χ(f(Au))), subtract χ(g(0))·overline(χ(f(0))).

The omitted x=0 term has that orientation. For unequal feeds over an odd prime alphabet the printed reversed constant is its conjugate and can differ; for autocorrelation both equal 1.

Effect: nothing. Existing correction: new.

### FiniteFieldsAndCharacterSums/E811 — gap

GK09, 2009 draft Theorem 14.6.1 proof, p. 337.

Change variables v=u^h first. The second trace hyperplane is Tr(A^h v)=y, so replace A by A^h in the hyperplane argument.

The displayed hyperplanes describe f(u)=Tr(u), whereas the theorem defines f(u)=Tr(u^h). Coprimality makes u↦u^h a permutation and A↦A^h preserves A≠1; the repaired proof gives perfect autocorrelation.

Effect: the proof. Existing correction: new.

### FiniteFieldsAndCharacterSums/E812 — error

GK09, 2009 draft §14.7, Proposition 14.7.1, p. 338; corresponding GK11 §11.7.

Require d,k≥1 and gcd(d,q−1)=gcd(k,q−1)=1.

The line-orbit proof sums the phase over a^(dk); only a permutation power supplies −1 on a nonzero line. For q=4,m=1,d=3,k=1,H1(x)=1 for x≠0,H2=0, the binary trace of 1 is zero, so C=3 and z=0, while the unguarded formula gives −1. A k=3,d=1 example similarly fails.

Effect: a stated result. Existing correction: The original Klapper d-form paper (KLAPPER-TN), Definition 1.1 and Theorem 2.1, explicitly includes both coprimality assumptions..

### FiniteFieldsAndCharacterSums/E813 — error

ECT25, August 26, 2025 author draft Exercise 5.23(4), p. 111; unchanged in April 19, 2026 accessibility revision Exercise 5.23(4), p. 110.

The universal formula is Σ_{i=0}^{min(p,l)}(l−i+1). The printed closed expression requires l≥p−1, or the exercise should restrict its range accordingly.

For p=5,l=1 the monomials are 1,X,Y, hence dimension 3; the printed expression is −3. At p=2,l=0,1,2,3 the correct counts are 1,3,6,9.

Effect: a stated result. Existing correction: new.

## Sources and pinned baseline

- **WU12**: Baofeng Wu and Zhuojun Liu, [Linearized polynomials over finite fields revisited](https://arxiv.org/pdf/1211.5475v2). arXiv:1211.5475v2, January 1, 2013; publication metadata points to Finite Fields and Their Applications 22 (2013), 16–34, DOI 10.1016/j.ffa.2013.03.003. The text read is v2, not a publisher copy. Read 2026-10-05. SHA-256 `d12dc047c1dd936a5453a07089c3a7e4d1d485e522ac3dae95772a1bffd626b2`. Passages: §3, pp. 8–10: composition algebra; §5, pp. 17–26: Theorem 5.1 and Proposition 5.5; §6, pp. 26–30: coefficient subalgebras, Theorems 6.1–6.4.
- **GK09**: Mark Goresky and Andrew Klapper, [Algebraic Shift Register Sequences](https://www.cs.uky.edu/~klapper/pdf/algebraic.pdf). October 14, 2009 public draft; distinct from the 2012 Cambridge book. Read 2026-10-05. SHA-256 `95da92a94ea7f39ab3c743437bd72e7013eaf5508be42541073b4151fa7db3ce`. Passages: §4.5, pp. 108–110 (Galois-ring units); §§13.3–13.4, pp. 315–317; §§14.1–14.7, pp. 321–339, including exercises proving d-form correlation.
- **GK11**: Mark Goresky and Andrew Klapper, [Algebraic Shift Register Sequences](https://www.math.ias.edu/~goresky/pdf/algebraic0.pdf). April 2, 2011 public draft; chapter numbers differ from the 2009 draft. Read 2026-10-05. SHA-256 `2f130ecff3ffaeabd5d66f7402a30880c817640745d3d692599f32e6d7923019`. Passages: Corresponding interleaving, Fourier/bent and correlation-family passages, Chapters 10–11, pp. 216–242; d-form statement and hypotheses. Quoted errors remain scoped to the 2009 text unless the collation below explicitly says otherwise.
- **KATZ93**: Nicholas M. Katz, [Estimates for Soto-Andrade sums](https://web.math.princeton.edu/~nmk/old/sotosums.pdf). J. reine angew. Math. 438 (1993), 143–161; public scan of the published article. Read 2026-10-05. SHA-256 `95baed6d51008a201eea0aff81566dd8dd2543d4ff1433347699ba70ca3e01fb`. Passages: Theorem 1, pp. 143–144, and its proof, pp. 145–149 (especially n=2, torus parametrisation, punctures and geometric triviality).
- **KUANG94**: Jingshi Kuang, [Eigenfunctions of the Laplacian on finite upper half planes](https://arxiv.org/pdf/math/9411217). arXiv:math/9411217; five-page preprint. Read 2026-10-05. SHA-256 `71d4aa35c771bb951bd5ac45b4d63dbebb28626bcf094d33c7a184c312526e3a`. Passages: Entire paper: spherical functions, eigenvalue formula, Theorem 4 proof and §8 Ramanujan graphs. Normalizations are audited rather than copied.
- **KLAPPER-TN**: Andrew Klapper, [d-Form Sequences: Families of Sequences with Low Correlation Values and Large Linear Span](https://www.cs.uky.edu/~klapper/pdf/TN.pdf). Public author copy of the d-form paper, cited as [93] in GK09; pp. 1–5 read. Read 2026-10-05. SHA-256 `3b20b283688f21f1742717330a7e9ee69dd69c9aac041546af28cfcf33c73b45`. Passages: §§1–2, pp. 1–5: Definition 1.1 and Theorem 2.1 with proof; both coprimality assumptions.
- **ECT25**: Venkatesan Guruswami, Atri Rudra and Madhu Sudan, [Essential Coding Theory](https://cse.buffalo.edu/faculty/atri/courses/coding-theory/book/web-coding-book.pdf). Public book draft dated August 26, 2025. Read 2026-10-05. SHA-256 `4777d44223362430b0e2c0097633158879875c47928b40d764cab0daf1e1904c`. Passages: Exercise 5.23, Hermitian curve and monomial evaluation construction; dimensional and distance claims checked with their parameter ranges.
- **SZONYI**: Tamás Szőnyi, [Cyclic codes](https://szonyitamas.web.elte.hu/cyclic.pdf). Four-page public course handout, accessed 2026-10-05. Read 2026-10-05. SHA-256 `6485648be4871f07a31f4482fcb40b325f3feae93c80915dfdaf4ba0ae25581c`. Passages: All four pages; ideal correspondence, generator/check polynomials, dimension, reciprocal dual and BCH bound. Normalize the reciprocal to make it monic.
- **BAZLOV23**: Yuri Bazlov, [Coding theory, Week 9: Cyclic codes](https://personalpages.manchester.ac.uk/staff/yuri.bazlov/code/notes/ch9.pdf). Public University of Manchester course notes, version November 12, 2023. Read 2026-10-05. SHA-256 `c802bada8f693b6d57a241a926b0e2038d0f556e6f23c720e79c109355ef5181`. Passages: Entire week: definitions, Lemma 9.2, Theorems 9.3–9.4, Corollary 9.5 and all binary length-three examples.
- **ECT26**: Venkatesan Guruswami, Atri Rudra and Madhu Sudan, [Essential Coding Theory](https://cse.buffalo.edu/faculty/atri/courses/coding-theory/book/ada-coding-book.pdf). Accessibility revision dated April 19, 2026; Exercise 5.23 on pp. 109–110 was freshly read. Read 2026-10-05. SHA-256 `7251cb8e4bc5048cfd6ad113f14bc6d6d3c5a079e5dc33430b1cf36df5c21005`. Passages: Title/version page and Exercise 5.23(1)–(6), pp. 109–110. The unguarded dimension expression in item (4) persists.

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. All entries below were checked in source at the appropriate pin. No full suggested-file elaboration was run: an existing build at both pins was not found, and building a library is outside this worker’s instructions.

| Native declaration | Module | Provides |
| --- | --- | --- |
| `mathlib:AdjoinRoot` | `Mathlib/RingTheory/AdjoinRoot.lean` | The quotient R[X]/(f); the carrier of F[X]/(h) and of the Stepanov and function-field constructions. |
| `mathlib:AdjoinRoot.mk` | `Mathlib/RingTheory/AdjoinRoot.lean` | The quotient map F[X] → F[X]/(g). |
| `mathlib:AdjoinRoot.modByMonicHom` | `Mathlib/RingTheory/AdjoinRoot.lean` | For monic g, the linear map F[X]/(g) → F[X] to the representative of degree < deg g (Shoup's rep). |
| `mathlib:Algebra.trace` | `Mathlib/RingTheory/Trace/Defs.lean` | The trace S →ₗ[R] R of a finite free algebra. |
| `mathlib:Algebra.trace_surjective` | `Mathlib/RingTheory/Trace/Basic.lean` | The trace of a finite separable field extension is surjective. |
| `mathlib:Algebra.trace_trace` | `Mathlib/RingTheory/Trace/Defs.lean` | Transitivity of the trace in a tower R ⊆ S ⊆ T. |
| `mathlib:FiniteField.algebraMap_trace_eq_sum_pow` | `Mathlib/FieldTheory/Finite/Trace.lean` | Tr_{L/K}(x) = Σ_{i < [L:K]} x^(q^i). |
| `mathlib:Polynomial.degreeLTEquiv` | `Mathlib/RingTheory/Polynomial/Basic.lean` | The linear equivalence between polynomials of degree < n and coefficient vectors Fin n → R. |
| `mathlib:Submodule.comap` | `Mathlib/Algebra/Module/Submodule/Map.lean` | The pullback of a submodule `p ⊆ M₂` along `f : M → M₂` |
| `mathlib:Submodule.span` | `Mathlib/LinearAlgebra/Span/Defs.lean` | The span of a set. |
| `mathlib:hammingNorm` | `Mathlib/InformationTheory/Hamming.lean` | The Hamming weight function to the naturals. |
| `mathlib:traceForm_nondegenerate` | `Mathlib/RingTheory/Trace/Basic.lean` | Let $L/K$ be a finite extension of fields. If $L/K$ is separable, then `traceForm` is nondegenerate. |
| `tauceti:TauCeti.Divisor` | `TauCeti/FieldTheory/FunctionField/Divisor/Basic.lean` | A divisor of `F / k` is a finite formal integer combination of its normalized places. |
| `tauceti:TauCeti.Divisor.degree` | `TauCeti/FieldTheory/FunctionField/Divisor/Basic.lean` | The degree of a function-field divisor, weighted by the degrees of its residue fields. |
| `tauceti:TauCeti.Divisor.dim` | `TauCeti/FieldTheory/FunctionField/RiemannRoch/Basic.lean` | `ℓ(D) = dim_k L(D)` (Stichtenoth, Definition 1.4.10).  Its finiteness, which guards the junk value of `Module.finrank`, is `TauCeti.finiteDimensional_riemannRochSpace`. |
| `tauceti:TauCeti.LinearCode` | `TauCeti/InformationTheory/Coding/Basic.lean` | A linear code over `F` with coordinate set `ι` is a linear subspace of the word space `ι → F`. |
| `tauceti:TauCeti.Place` | `TauCeti/FieldTheory/FunctionField/Place/Basic.lean` | A **place** of the field extension `F/k` is a normalized discrete valuation of `F` that is trivial on the constants: a `ℤᵐ⁰`-valued valuation which is surjective — so that its value group is exactly `ℤ` — and which takes the value `1` on every nonzero element of `k`.  Normalization removes the need to quotient by valuation equivalence: two places are equal as soon as their valuations are equivalen |
| `tauceti:TauCeti.Place.ResidueField` | `TauCeti/FieldTheory/FunctionField/Place/Basic.lean` | The residue field `F_P = 𝒪_P / 𝔪_P` of a place (Stichtenoth, Definition 1.1.14). The evaluation map `f ↦ f(P)` is `IsLocalRing.residue P.integers`. |
| `tauceti:TauCeti.Place.degree` | `TauCeti/FieldTheory/FunctionField/Place/Basic.lean` | The **degree** `deg P = [F_P : k]` of a place (Stichtenoth, Definition 1.1.14). Its finiteness, which guards the junk value of `Module.finrank`, holds whenever `F/k` is a function field: see `TauCeti.Place.finiteDimensional_residueField` (Stichtenoth, Proposition 1.1.15). |
| `tauceti:TauCeti.Place.integers` | `TauCeti/FieldTheory/FunctionField/Place/Basic.lean` | The valuation ring `𝒪_P = {f : F ∣ v_P f ≤ 1}` of a place (Stichtenoth, Definition 1.1.4). |
| `tauceti:TauCeti.Place.residueFieldEquivOfDegreeEqOne` | `TauCeti/FieldTheory/FunctionField/Place/Basic.lean` | **A rational place has residue field `k`**: at a place of degree one the constants map isomorphically onto the residue field, so `f(P)` really is an element of `k`. |
| `tauceti:TauCeti.riemannRochSpace` | `TauCeti/FieldTheory/FunctionField/RiemannRoch/Basic.lean` | The **Riemann–Roch space** `L(D)` of a divisor `D` of `F / k` (Stichtenoth, Definition 1.4.4): the `k`-subspace of functions whose poles are bounded by `D`, that is `div f + D ≥ 0`.  The membership condition is stated multiplicatively as `v_P f ≤ exp (D P)`.  This is junk-free at `f = 0`, where the valuation is `0` and the condition holds at every place, so no separate `∪ {0}` clause is needed; th |
| `tauceti:TauCeti.weilDifferentialFiltration` | `TauCeti/FieldTheory/FunctionField/Differential/Weil.lean` | The space `Ω_F(D)` of **Weil differentials bounded by `D`** (Stichtenoth, Definition 1.5.6): the `k`-linear forms on the repartition space that vanish on `A_F(D) + F`. |
| `mathlib:CommGroup.equiv_prod_multiplicative_zmod_of_finite` | `Mathlib/GroupTheory/FiniteAbelian/Basic.lean` | A finite commutative group is a product of Multiplicative (ZMod n_i), with n_i > 1; torsion kernel counts determine the 2-primary exponents. |
| `mathlib:SkewPolynomial` | `Mathlib/Algebra/SkewPolynomial/Basic.lean` | Native skew-polynomial ring for an action of Multiplicative naturals; the action may be a noninvertible endomorphism. |
| `mathlib:SkewPolynomial.monomial_mul_monomial` | `Mathlib/Algebra/SkewPolynomial/Basic.lean` | monomial n r times monomial m s = monomial (n+m) (r * (φ^[n]) s). |
| `mathlib:dualTensorHomEquiv` | `Mathlib/LinearAlgebra/Contraction.lean` | For finite projective M, Dual R M tensor N is linearly equivalent to Hom R M N. |
| `mathlib:dualTensorHomEquiv_tmul` | `Mathlib/LinearAlgebra/Contraction.lean` | The pure tensor f tensor n sends m to f(m) scalar-multiplied by n. |
| `mathlib:comp_dualTensorHom` | `Mathlib/LinearAlgebra/Contraction.lean` | Composition of rank-one tensor maps contracts the middle dual/vector pair; multiplication order is fixed. |
| `mathlib:Module.Basis.traceDual` | `Mathlib/RingTheory/Trace/Basic.lean` | The trace-dual basis of a finite separable field extension. |
| `mathlib:IsGalois.normalBasis` | `Mathlib/FieldTheory/Galois/NormalBasis.lean` | A basis indexed by the actual Galois group; reindexing by powers of Frobenius is needed. |
| `mathlib:Matrix.det_vandermonde_ne_zero_iff` | `Mathlib/LinearAlgebra/Vandermonde.lean` | The determinant of the square Vandermonde matrix is nonzero iff its entries are pairwise distinct. |
| `mathlib:AddChar.expect_eq_ite` | `Mathlib/Analysis/Fourier/FiniteAbelian/Orthogonality.lean` | Normalized character sum is 1 for the trivial additive character (written 0), and 0 otherwise. |
| `mathlib:TwoSidedIdeal` | `Mathlib/RingTheory/TwoSidedIdeal/Basic.lean` | Native two-sided ideals for a possibly noncommutative ring; no ordinary commutative Ideal is used for the Ore quotient. |
| `mathlib:FiniteField.frobeniusAlgHom` | `Mathlib/FieldTheory/Finite/Basic.lean` | For any commutative F-algebra R with F finite, the F-algebra endomorphism a↦a^(card F). |
| `mathlib:Module.card_eq_pow_finrank` | `Mathlib/FieldTheory/Finiteness.lean` | The cardinality of a finite-dimensional vector space over a finite field is card(F)^finrank. |
| `mathlib:FiniteField.algebraMap_norm_eq_pow` | `Mathlib/FieldTheory/Finite/GaloisField.lean` | For finite E/F, the norm mapped into E is x^((card E−1)/(card F−1)). |
| `mathlib:FiniteField.unitsMap_norm_surjective` | `Mathlib/FieldTheory/Finite/GaloisField.lean` | The norm homomorphism E×→F× is surjective; its kernel has cardinality (card E−1)/(card F−1). |
| `mathlib:FiniteField.norm_surjective` | `Mathlib/FieldTheory/Finite/GaloisField.lean` | The native norm E→F is surjective for finite field extensions. |
| `mathlib:isCyclic_of_injective_ringHom` | `Mathlib/RingTheory/IntegralDomain.lean` | A finite group injecting multiplicatively into an integral domain is cyclic; the native instance gives IsCyclic E×. |
| `mathlib:IntermediateField.fixedField` | `Mathlib/FieldTheory/Galois/Basic.lean` | The actual intermediate field fixed by a subgroup of Gal(E/F). |
| `mathlib:IntermediateField.finrank_fixedField_eq_card` | `Mathlib/FieldTheory/Galois/Basic.lean` | finrank(fixedField H,E)=card H; combined with cyclic relative Frobenius and the tower law, the field fixed by φ^m has F-degree m when m divides n. |
| `tauceti:TauCeti.finsum_repartitionDualComponent_eq_zero` | `TauCeti/FieldTheory/FunctionField/Differential/LocalComponent.lean` | **The abstract residue theorem** (Stichtenoth, (1.45)): the local components of a Weil differential sum to zero on every function of `F`.  The constant repartition of `x` lies in the diagonal copy of `F` inside `A_F`, on which every Weil differential vanishes, and its entry at every place is `x`.  Stichtenoth states the case `x = 1`; no hypothesis on the constant field `k` is needed, and no residu |
| `tauceti:TauCeti.repartitionDualComponent` | `TauCeti/FieldTheory/FunctionField/Differential/LocalComponent.lean` | The **local component** `ω_P` at a place `P` of a `k`-linear form `ω` on the repartition space (Stichtenoth, Definition 1.7.1): the `k`-linear form `x ↦ ω (ι_P x)` on `F`. |
| `tauceti:TauCeti.mem_riemannRochSpace_iff` | `TauCeti/FieldTheory/FunctionField/RiemannRoch/Basic.lean` | Membership in `L(D)`, unfolded: the poles of `f` are bounded by `D` at every place. |
| `tauceti:TauCeti.mem_weilDifferentialFiltration_iff_repartitionDualComponent_eq_zero` | `TauCeti/FieldTheory/FunctionField/Differential/LocalComponent.lean` | **A Weil differential is bounded by `D` exactly when its local components are**: the pole order of `ω` at each place is a local condition, read off from `ω_P` alone.  This is the half of Stichtenoth, Proposition 1.7.3(a) that does not mention the divisor `(ω)`: the bound at `P` restricts `ω_P` to vanish on the functions whose pole at `P` is bounded by `D`, and conversely those vanishings force `ω` |
| `tauceti:TauCeti.riemannRochSpace_eq_bot_of_degree_neg` | `TauCeti/FieldTheory/FunctionField/Divisor/ProductFormula.lean` | A divisor of negative degree has no nonzero functions in its Riemann–Roch space (Stichtenoth, Corollary 1.4.12(b)). |
| `tauceti:TauCeti.Place.infty` | `TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean` | The **place at infinity** of the rational function field: the normalized valuation with `v_∞ f = exp (f.intDegree)` for `f ≠ 0`, for which `x⁻¹` is a prime element (Stichtenoth, Proposition 1.2.1(c)). |
| `mathlib:RingQuot` | `Mathlib/Algebra/RingQuot.lean` | Native quotient of a possibly noncommutative ring by a generating relation; its algebra instance descends central scalars. |
| `mathlib:dotProductBilin` | `Mathlib/LinearAlgebra/Matrix/ToLin.lean` | Native finite-coordinate dot product as a bilinear form. |
| `mathlib:LinearMap.BilinForm.finrank_orthogonal` | `Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean` | For a nondegenerate bilinear form on a finite-dimensional space, finrank of the orthogonal submodule is ambient finrank minus submodule finrank. |

## Structure and acceptance

RT-AREA-finitefields/1: algebra and algorithms do not require Weil II; this packet’s direct dependency chains reflect that distinction. Replace FF.3←FF.2 by FF.3←FF.0 and CA.3; use EllipticCurves Layer 3 and WC.5 for point-counting errors. FF.4 has algebraic inputs FF.0 and FF.1, with FF.2 only for analytic character-sum and spectral consequences. FF.5 imports each layer it packages directly. The maintainer applies stage-edge changes and regenerates depths outside this issue’s deliverable paths.

RT-AREA-finitefields/13: native SkewPolynomial already exists; a second Ore carrier in DM.0 is unnecessary. FF.4 is the single owner of q-linearized polynomials over any commutative F_q-algebra, their linearity, separable root spaces, subspace polynomials and composition/Ore comparison. Generalize the parent field-only signatures at assembly. DM.0 imports FF.4 and retains Drinfeld modules, using native SkewPolynomial. Add FF.4→DM.0; this supersedes the parent proposal that kept a separately owned DM.0 Ore/linearized comparison.

The parent 91 FF.4 nodes and this continuation’s 51 nodes span largely independent topics. Keep IDs unchanged until accepted; expose sub-layers Galois rings, linearized composition algebras, sequences and correlation, cyclic/evaluation/AG codes, and finite upper half-plane spectra. The spectral sub-layer alone imports the norm-torus Weil/Deligne machinery.

The accepted EXT-08 Euler–Poincaré owner question was never delivered; EDC.2 is a candidate rather than a resolved owner. Maintainer decides the owner of genus-zero tame Euler characteristics and promotes the accepted EXT-08 FF/ExponentialSums packets with their corrections; set integrated_partial and copy REVIEW-EXT-08-EXT-16 §§7–8 to DECISIONS. FF.3 versus CN.1 factorization placement and the FF.2 weight input remain explicit decisions.

No native Hermitian-model export with the required pole orders and point–place bijection was found. AlgebraicCurves, Part II supplies the Hermitian function-field model beyond the existing layer-10 plan; FF.4 imports it and owns the code comparison and parameters.

The packet contains 51 fresh nodes: 28 theorems, 12 constructions, six definitions and five comparisons, with 82 API items and 62 unit tests. Its six planets are the linearized composition algebra, Gold sequences, small Kasami family, GMW sequences, cyclic codes and Soto–Andrade estimate. Every construction and definition has at least three discriminating tests. The checker reports zero errors and zero warnings.

Finite computations tested the r=2 principal-unit torsion counts for n=3,4,5; all shifts of the binary n=3 Gold and q=2,m=2 small Kasami families; the nonprimitive full-degree F_16 decimation; the complete p=2 Hermitian point/code spaces at l=0,1,2,3; all character pairs and parameters in the quadratic norm-one bounds at q=3,5; the odd-q quadratic radical and sum at F_81/F_3; and the exact six-vertex Terras adjacency characteristic polynomial at q=3. The finite calculations are evidence for stated examples, not proofs of the general theorem signatures.

Independent review must check the exact source locators, corrected hypotheses, supplier sufficiency and suggested types. Follow-up work is confined to the recorded gaps, supplier exports, version collation and elaboration/assembly. The maintainer owns the proposed atlas integration, source registration and stage-edge changes.
