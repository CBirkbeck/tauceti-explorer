# Geometry of numbers, quadratic forms and homogeneous arithmetic — GN.3: reduction, mass and theta series

This document plans the layer GN.3 of the roadmap: reduction domains, local representation densities of quadratic and hermitian lattices, mass formulas with their Haar and Tamagawa normalizations, and theta series. It extends the accepted plan of the whole roadmap, whose sixteen GN.3 targets (hermitian counts and densities, the Siegel polynomial and the Cho–Yamauchi formula, finite stabilizers, finite class sets, the mass of a genus, the adelic mass identity, the mass formula for maximal lattices and the theta-coefficient interface) are cited here by name and not restated.

## Boundaries

- **AdelicAlgebraicGroups** (Tau Ceti roadmap) owns Haar and Tamagawa measures and the Tamagawa number τ(G) with τ(G_m) = 1 (AA.0, AA.2), and reduction theory: Siegel sets, (e,C)-reduced positive forms, class-number finiteness and finite volume (AA.3). This layer uses them through requests and plans only Minkowski reduction of real lattices and its containment in a Siegel set.
- **IntegralLattices** (Tau Ceti roadmap) owns, over ℤ and ℤ_p, finiteness of bounded-norm sets (2A), shells and representation numbers (2B), finite automorphism groups (2C), Minkowski-reduced bases of integral lattices and finiteness of classes (2G), Jordan splittings (3B–3C), binary forms with the form–ideal bijection, automorphs and reduction cycles (B2–B5), the two masses and m⁺ = 2m (7A), the automorphism density α_p(L) with stabilization and odd-p values (7C), and the archimedean volume of SO(n) (7E). It names further roadmaps (Theta Series; OrthogonalTamagawaAndLatticeMass over TamagawaMeasures, which OrthogonalSpinGroups also names as the owner of the orthogonal Tamagawa number) for the theta series, the adelic decomposition, τ(SO_Q) = 2 and the Smith–Minkowski–Siegel formula; none of them exists, so this layer plans the theta series of a definite lattice, Siegel's main theorem, Weil's Siegel formula for dimension > 4 and τ(SO_Q) = 2, for lattices over ℤ and over number rings.
- **ReductiveGroupsPartII** RG2.3 supplies smooth affine models of stabilizers of points of the building with their special fibres; 3E specializes them to maximal lattices.
- Lattices, genera and hermitian lattices over Dedekind domains are GN.2; successive minima and finiteness of bounded gauge sets are GN.1.

## Conventions

- A quadratic lattice carries its quadratic map Q; the polar form is B(x,y) = Q(x+y) − Q(x) − Q(y), and Q(x) = B(x,x)/2 is written out wherever a bilinear and a quadratic convention meet. Representations preserve Q, which is stronger than preserving B at p = 2.
- At a nonarchimedean place, q is the residue cardinality of the base field. For an unramified quadratic extension F/F_0 the residue field of F has q² elements and every hermitian density is normalized with q, and the Siegel series is evaluated at (−q)^{−k}. For a ramified extension the residue form is alternating and the series is evaluated at q^{−s}.
- Densities are eventual values of normalized finite counts, with the empty generic fibre giving 0; Haar measures give the integral coordinate lattice volume 1 before any self-dual normalization.
- The mass of a genus is Σ 1/|O(M)| over its classes; the proper mass uses SO. Siegel-type averages are mass-weighted, never uniform over classes. Theta series are indexed by B(x,x) at exp(πiτ·); with Q = B(x,x)/2 the coefficient of exp(2πiτm) counts Q(x) = m, which is the indexing of Siegel's theorem.
- The local type and the local mass factor of a quadratic space use the signed discriminant (−1)^{m(m−1)/2}det Q and the Witt invariant obtained from the Hasse invariant by the rank modulo 8.
- Zeta and L-values in mass formulas are taken at integers ≥ 2, where their Euler products converge absolutely.

## Layer overview

| Section | Content | Targets |
| --- | --- | --- |
| 3A | Reduction domains | 5 |
| 3B | Counts over finite fields | 6 |
| 3C | Quadratic local densities and Siegel's theorem | 16 |
| 3D | Hermitian local densities | 19 |
| 3E | Mass, Tamagawa numbers and orbit counts | 23 |
| 3F | Theta series | 3 |

## 3A. Reduction domains

Minkowski-reduced bases of real lattices and their place in a Siegel set, and the reduction theory of indefinite binary forms by minus continued fractions. Arithmetic quotients, Siegel sets, (e,C)-reduced forms and finiteness of class numbers are AdelicAlgebraicGroups AA.3; Minkowski reduction of integral ℤ-lattices is IntegralLattices 2G; binary form classes, ideal classes, automorphs and the finiteness of cycles are IntegralLattices B2–B5.

<a id="minkowski-reduced-basis"></a>

### Minkowski-reduced bases of a Euclidean lattice

*Definition* `minkowski-reduced-basis` — planet: **Minkowski-reduced bases**

Let E be a real inner-product space of finite dimension n and L ⊂ E a discrete full Z-submodule. An ordered Z-basis (b_1,…,b_n) of L is Minkowski-reduced when, for each i = 1,…,n, b_i has the least length ‖b_i‖ among all v ∈ L such that (b_1,…,b_{i−1},v) extends to a Z-basis of L. Equivalently, for each i, ‖b_i‖ ≤ ‖v‖ for every v ∈ L whose coefficient vector in the basis has gcd(c_i,…,c_n) = 1. The predicate depends only on the Gram matrix (⟨b_i,b_j⟩), is preserved by changing the sign of any b_i, and is invariant under linear isometries of E.

**Hypotheses and conventions.**

- E finite-dimensional real inner-product space, n = dim E (n = 0 allowed: the empty basis is reduced).
- L discrete with IsZLattice ℝ L; bases are ordered and indexed by Fin n.
- Lengths are Euclidean norms; no integrality of the Gram matrix is assumed.

**Proof outline.**

1. Define the predicate through the extension condition, phrased with the primitive coefficient condition gcd(c_i,…,c_n) = 1 so that it is decidable from coefficients.
2. Existence: choose b_1 a shortest nonzero vector (finite-gauge-sublevel gives finitely many candidates under any bound), then inductively a shortest vector among those extending the partial basis; the set of candidates is nonempty because the partial basis extends (primitive completion in the free module L) and each candidate set under a bound is finite.
3. Sign and isometry invariance are immediate from the definition, which only uses lengths and the extension property.
4. For integral lattices over Z this is the predicate of IntegralLattices milestone 2G, which proves existence and the entry bounds for integral Gram matrices; this node is the real (non-integral) version that BSW use for the lattices attached to real binary forms.

**Uses.** BSW2022 §5, proof of Lemma 5.2: fundamental domains for GL_n(Z) acting on positive forms are cut out by reducedness of the Gram matrix; BSW2025 §7: the reduced basis gives the coordinates in which the polynomial lattices are counted; GN.3 minkowski-reduced-siegel: the Gram matrix of a reduced basis lies in a Siegel set of AA.3.

**API.**

- `MinkowskiReduced` (data): The predicate on ordered bases of L described above.
- `MinkowskiReduced.exists` (constructor): Every discrete full lattice in E has a Minkowski-reduced basis.
- `MinkowskiReduced.neg` (characterisation): Changing the sign of any basis vector preserves reducedness.
- `MinkowskiReduced.map_isometry` (functoriality): A linear isometry E ≃ E' carries reduced bases of L to reduced bases of its image.
- `MinkowskiReduced.norm_le` (characterisation): ‖b_1‖ ≤ ‖b_2‖ ≤ … ≤ ‖b_n‖ and ‖b_1‖ is the first minimum of L.
- `MinkowskiReduced.gram_iff` (equivalence): Reducedness is a condition on the Gram matrix alone: two bases with the same Gram matrix are reduced together.

**Unit tests.**

- `MinkowskiReduced.std_Z2` (computation): The standard basis of Z² ⊂ ℝ² is Minkowski-reduced.
- `MinkowskiReduced.not_shear` (non-example): The basis ((1,0),(1,1)) of Z² is not Minkowski-reduced.
- `MinkowskiReduced.rank_zero` (degenerate): In dimension 0 the empty basis is Minkowski-reduced.
- `MinkowskiReduced.first_minimum` (compatibility): For a reduced basis, ‖b_1‖² equals the square of the first successive minimum of L for the unit ball (GN.1 successive-minimum at index 0).

**Checks.**

- In Z² with the standard form, (e_1, e_2) is reduced and (e_1, e_1 + e_2) is not, since ‖e_2‖ < ‖e_1 + e_2‖ and e_2 extends e_1.
- For the hexagonal lattice with basis b_1 = (1,0), b_2 = (1/2, √3/2), the basis is reduced and so are the bases obtained by sign changes.
- Reduced bases need not realise the successive minima in dimension ≥ 5 (the vectors realising the minima need not form a basis), so the predicate is not 'attains every minimum'.

**Direct prerequisites.** base packet `GN.1/finite-gauge-sublevel`; base packet `GN.1/successive-minimum`; `IsZLattice` (Mathlib); `Module.Basis` (Mathlib).

**Source.** Manjul Bhargava, Arul Shankar and Xiaoheng Wang, *Squarefree values of polynomial discriminants I*, §5, footnote 1, p.24, and proof of Lemma 5.2, p.25 (arXiv:1611.09806v3): Defines a Minkowski-reduced basis of a lattice by successive shortest extensions and uses that the normalized reduced Gram forms lie in a Siegel set. Manjul Bhargava, Arul Shankar and Xiaoheng Wang, *Squarefree values of polynomial discriminants II*, §7, p.52 (Forum Math. Pi 13 (2025), e17): Uses Minkowski-reduced bases and their uniqueness up to signs for generic lattices in the quasi-reduction of §7.

<a id="minkowski-reduced-siegel"></a>

### Reduced Gram matrices lie in a Siegel set

*Theorem* `minkowski-reduced-siegel`

For every n ≥ 1 there are constants C_n > 1 and t_n > 0 such that the Gram matrix B of any Minkowski-reduced basis of a lattice in ℝⁿ is (e, C_n)-reduced in the sense of AdelicAlgebraicGroups AA.3.2, and hence its determinant normalization det(B)^{-1/n}B lies in the image in SL_n(ℝ)/SO(n) of the standard Siegel set 𝔖_{t_n} of AA.3.2–3.3. The statement is a containment, not an equivalence: a point of the Siegel set need not be a reduced Gram matrix.

**Hypotheses and conventions.**

- n ≥ 1; rank 0 is a point and is excluded from the normalization.
- Gram matrices of arbitrary determinant are first normalized to determinant one (or the statement is made in GL_n^+(ℝ)/O(n)).

**Proof outline.**

1. Write B = Uᵀ D U with U unipotent upper triangular and D diagonal (the Gram–Schmidt/Cholesky decomposition; Tau Ceti cholesky).
2. From reducedness, ‖b_i‖² ≤ ‖b_j‖² and |2⟨b_i,b_j⟩| ≤ ‖b_i‖² for i < j, and Minkowski's product inequality ∏‖b_i‖² ≤ c_n det B for reduced bases (the comparison of ‖b_i‖ with the i-th successive minimum, then Minkowski's second theorem, GN.1 minkowski-second-upper; over Z this is the reduced-diagonal bound of IntegralLattices 2G) give the three conditions of (e, C_n)-reduced forms in AA.3.2: |B_ij| < C_n B_ii, B_ii < C_n B_jj for i < j, and ∏_i B_ii < C_n det B. Equivalently, in the Cholesky form B = UᵀDU the entries of U and the adjacent ratios d_i/d_{i+1} are bounded above in terms of n.
3. These are exactly the (e, C)-reduced conditions of AA.3.2; AA.3.2 'Reduced forms and Siegel sets' gives the Siegel-set containment and the determinant-one version.

**Checks.**

- In dimension 2 the reduced region is |2b₁₂| ≤ b₁₁ ≤ b₂₂, and its normalized image lies in the region Im τ ≥ √3/2 of the upper half-plane, a Siegel set.
- diag(1, t) is reduced exactly when t ≥ 1; the matrices diag(1, t) with 0 < t < 1, normalized, leave every fixed Siegel set as t → 0, so the containment genuinely uses reducedness.
- Rank 1: every positive 1×1 matrix is reduced and the normalized matrix is (1).

**Direct prerequisites.** [Minkowski-reduced bases of a Euclidean lattice](#minkowski-reduced-basis); base packet `GN.1/minkowski-second-upper`; `AdelicAlgebraicGroups:AA.3`; `Matrix.PosDef` (Mathlib).

**Source.** Manjul Bhargava, Arul Shankar and Xiaoheng Wang, *Squarefree values of polynomial discriminants I*, §5, footnote 1, p.24, and proof of Lemma 5.2, p.25 (arXiv:1611.09806v3): Footnote 1 defines Minkowski-reduced bases. The proof of Lemma 5.2 writes a positive form as γI_nγᵀ with γ = ντκ and asserts, without proof, that Minkowski reduction is equivalent to γ lying in a fundamental domain whose torus part satisfies t_i ≤ c·t_{i+1}, a Siegel-type set; the containment planned here is the half of that assertion that the paper uses. Manjul Bhargava, Arul Shankar and Xiaoheng Wang, *Squarefree values of polynomial discriminants II*, §7, p.52: Same use for the quasi-reduced bases.

<a id="minus-continued-fraction"></a>

### Minus continued fractions and reduced quadratic irrationals

*Definition* `minus-continued-fraction`

For an integer n_0 and integers n_1, n_2, … ≥ 2, the minus continued fraction ⟦n_0, n_1, n_2, …⟧ is the limit of n_0 − 1/(n_1 − 1/(n_2 − ⋯)). Every real irrational w has a unique such expansion, obtained by the digit n_0 = ⌊w⌋ + 1 and the remainder map w ↦ 1/(n_0 − w). A real quadratic irrational w with Galois conjugate w^σ is reduced when 0 < w^σ < 1 < w. For an eventually periodic expansion, its primitive cycle ((n_1,…,n_ℓ)) is the least period up to cyclic rotation; a cycle with all n_j = 2 does not occur for irrational w.

**Hypotheses and conventions.**

- w real and irrational; for the cycle notions w is a real quadratic irrational.
- The step uses the digit n_0 = ⌊w⌋ + 1, so that n_0 − w ∈ (0,1) and every subsequent digit is ≥ 2.

**Proof outline.**

1. Define the digit map and the remainder map w ↦ 1/(⌊w⌋ + 1 − w) on irrationals.
2. Convergence: the convergents p_k/q_k satisfy p_k q_{k−1} − p_{k−1} q_k = −1 with increasing q_k, so the continued fraction converges and equals w; uniqueness follows from the digit constraints.
3. Eventual periodicity for quadratic irrationals follows by Lagrange's argument for this expansion: the remainders lie in a finite set of reduced irrationals of the same discriminant.

**Uses.** DIT2016 §2, Theorem 1 and (2.2): the cycle of a narrow ideal class is the period of the minus continued fraction of a reduced representative; GN.3 reduced-cycle-class-invariant: reduction theory of indefinite binary forms.

**API.**

- `MinusCF.digit` (data): The digit ⌊w⌋ + 1 of an irrational real w.
- `MinusCF.next` (data): The remainder map w ↦ 1/(⌊w⌋ + 1 − w).
- `MinusCF.tendsto_convergents` (characterisation): The convergents of the digit sequence converge to w.
- `MinusCF.digit_ge_two` (simp): Every digit after the first is at least 2.
- `IsMinusReduced` (data): 0 < w^σ < 1 < w for a real quadratic irrational w.
- `MinusCF.periodic_iff_reduced` (characterisation): The expansion of a quadratic irrational is purely periodic iff w is reduced.

**Unit tests.**

- `MinusCF.digit_sqrt_two` (computation): The first digit of √2 is 2 and the second remainder is 1/(2 − √2) = 1 + √2/2.
- `IsMinusReduced.golden_succ` (computation): w = (3 + √5)/2 is reduced: w^σ = (3 − √5)/2 ∈ (0,1).
- `IsMinusReduced.not_sqrt_two` (non-example): √2 is not reduced, since its conjugate −√2 is negative.
- `MinusCF.digit_ge_two_test` (characterisation): For w = √3 the digits after the first are ≥ 2; an ordinary (plus) continued fraction digit 1 never occurs.

**Checks.**

- √2 = ⟦2, 2, 4, 2, 4, …⟧: the remainders after the first digit are 1 + √2/2 and 2 + √2, both reduced, and the primitive cycle is ((2, 4)).
- w = (3 + √5)/2 is reduced (its conjugate (3 − √5)/2 ≈ 0.382 lies in (0,1)), and its expansion is purely periodic with cycle ((3)): 1/(3 − w) = w.
- No irrational w has a period consisting of 2's only: ⟦2, 2, 2, …⟧ = 1 is rational.

**Direct prerequisites.** `Real.sqrt` (Mathlib); `Int.floor` (Mathlib).

**Source.** W. Duke, Ö. Imamoḡlu and Á. Tóth, *Geometric invariants for real quadratic fields*, §2, p.951, the unnumbered display defining ⟦a_0,a_1,…⟧ and (2.1) (Ann. of Math. 184 (2016)): Defines the minus continued fraction with digits ≥ 2, reduced numbers 0 < w^σ < 1 < w, and primitive cycles up to rotation.

<a id="reduced-cycle-class-invariant"></a>

### Reduction cycles of narrow ideal classes

*Theorem* `reduced-cycle-class-invariant`

Let K be a real quadratic field of fundamental discriminant D > 0 with conjugation σ and narrow class group Cl⁺(K). (1) Every narrow class A contains ideals wZ + Z with w ∈ K, w > w^σ, and the minus continued fraction of each such w is eventually periodic with primitive cycle independent of the choice; the expansion is purely periodic iff w is reduced. (2) The cycle is a complete invariant of A, and its length ℓ_A equals the number of reduced w with wZ + Z ∈ A. (3) If w is reduced and represents A, then 1/w^σ represents A^{−1}, and its cycle is the reverse of that of w. (4) For a reduced primitive cycle (w_1,…,w_ℓ) representing A, ∏ w_j = ε_D, the least unit > 1 of norm 1 (equivalently the least totally positive unit > 1), each w_j < √D + 1, and ℓ_A > log ε_D / log(√D + 1).

**Hypotheses and conventions.**

- D a positive fundamental discriminant; classes are narrow (strict) classes.
- Cycles are counted with cyclic positions, not distinct values.

**Proof outline.**

1. Use the form–ideal bijection of IntegralLattices B2 and the cycle finiteness of B5 for the class-group side.
2. Show that the remainder map preserves the class of wZ + Z and that reduced numbers are closed under it, with the reduced representatives forming one orbit (Zagier's reduction theory as summarized in DIT §2).
3. Reversal: the map w ↦ 1/w^σ sends reduced to reduced and reverses the digit sequence, using (2.2) of DIT.
4. The product of the remainders around a cycle is the unit by which the cycle's matrix acts on w; it is totally positive and generates the norm-one units, giving ε_D. The bounds w_j < √D + 1 give the length bound.

**Checks.**

- For D = 5, the class number is 1 and the reduced numbers of the trivial class form one cycle whose product is ε_5 = (3 + √5)/2.
- For D = 12 (K = Q(√3)) the narrow class group has order 2 and there are two cycles, exchanged by A ↦ JA (multiplication by the class of √3).
- Without primitivity of the cycle (repeating a period twice) the product would be ε_D², so the cycle is taken primitive.

**Direct prerequisites.** [Minus continued fractions and reduced quadratic irrationals](#minus-continued-fraction); [Automorphs of indefinite binary forms and the fundamental unit](#pell-automorph); `NumberField.RingOfIntegers` (Mathlib).

**Source.** W. Duke, Ö. Imamoḡlu and Á. Tóth, *Geometric invariants for real quadratic fields*, §2, p.951, (2.2), and p.954 (after (2.11)), Ann. of Math. 184 (2016): Defines minus continued fractions with digits ≥ 2 and reduced numbers 0 < w^σ < 1 < w, and states (citing Zagier) that the primitive cycle is a complete invariant of the narrow class, that its length is the number of reduced w, and the reversal (2.2) for A^{−1}; (2.9)–(2.11) give the automorph of w and ε_D = (t + u√D)/2. W. Duke, Ö. Imamoḡlu and Á. Tóth, *Geometric invariants for real quadratic fields*, §6, (6.3)–(6.4), p.967: The product of the reduced w of a class is ε_D, cited to Zagier (6.3); every reduced w is < √D + 1, which gives the length bound (6.4).

<a id="pell-automorph"></a>

### Automorphs of indefinite binary forms and the fundamental unit

*Theorem* `pell-automorph`

Let Q = [a,b,c] be a primitive integral binary form of nonsquare discriminant d = b² − 4ac > 0, and (t,u) the solution of t² − du² = 4 with t,u ≥ 1 and u least. Then the proper automorph group of Q in PSL_2(Z) is infinite cyclic, generated by γ_Q = ±[[(t − bu)/2, −cu],[au, (t + bu)/2]]. The attracting fixed point of γ_Q is (−b + √d)/(2a). If Q comes from a narrow class of the fundamental discriminant D = d via Q(x,y) = N(x − wy)/N(𝔞), then ε_D = (t + u√D)/2 is the least totally positive unit > 1 (equivalently the least unit > 1 of norm 1), and γ_Q is the matrix of multiplication by ε_D in the basis (w,1).

**Hypotheses and conventions.**

- d > 0 nonsquare; Q primitive (gcd(a,b,c) = 1), which holds automatically when d is fundamental.

**Proof outline.**

1. Solve the automorph equation: g fixes Q iff g = [[(t − bu)/2, −cu],[au, (t + bu)/2]] with t² − du² = 4 (direct computation with the adjoint of the Gram matrix).
2. The solutions form a group isomorphic to the norm-one units of the order of discriminant d, which is infinite cyclic generated by (t + u√d)/2 for the least u (IntegralLattices B4 gives SO(L) ≅ norm-one units).
3. Mathlib's Pell.Solution₁ d′ parametrizes x² − d′y² = 1. For d = 4d′ the solutions of t² − du² = 4 are (t, u) = (2x, y); for d ≡ 1 mod 4 they contain the (2x, 2y) with (x, y) a solution for d, with index 1 or 3: t and u are even when d ≡ 1 mod 8, and the cube of (t + u√d)/2 lies in ℤ[√d] when d ≡ 5 mod 8.
4. Fixed points: the eigenvector computation gives (−b ± √d)/(2a), the attracting one for the eigenvalue (t + u√d)/2 > 1 being (−b + √d)/(2a).

**Checks.**

- Q = x² − 2y² (a=1, b=0, c=−2, d=8): (t,u) = (6,2), γ_Q = ±[[3,4],[2,3]], and (t + u√8)/2 = 3 + 2√2.
- Q = x² + xy − y² (d = 5): (t,u) = (3,1) and ε_5 = (3 + √5)/2.
- For a positive definite form (d < 0) the automorph group is finite, so the hypothesis d > 0 is essential.

**Direct prerequisites.** `Pell.Solution₁` (Mathlib); `Matrix.SpecialLinearGroup` (Mathlib).

**Source.** W. Duke, Ö. Imamoḡlu and Á. Tóth, *Geometric invariants for real quadratic fields*, (2.11), p.954, and §9, p.978 with footnote 8: Gives γ_Q with the least solution of t² − du² = 4, its fixed point and orientation, and ε_D = (t + u√D)/2. W. Duke, Ö. Imamoḡlu and Á. Tóth, *Geometric invariants for real quadratic fields*, §2, p.950: Definition of ε_D as the least unit > 1 of norm 1 for the full ring of integers.

## 3B. Counts over finite fields

The finite counts that every local density reduces to: Gaussian binomials, orders of finite orthogonal groups, isometry and isotropic-subspace counts in the quadratic, hermitian and symplectic cases. The hermitian representation and embedding counts and the hermitian isometry formula are the base packet's 3.1.

<a id="gaussian-binomial"></a>

### Gaussian binomial coefficients

*Definition* `gaussian-binomial`

For an integer q and natural numbers n, k, the Gaussian binomial [n choose k]_q ∈ Z is ∏_{i=0}^{k−1} (q^{n−i} − 1)/(q^{i+1} − 1) when k ≤ n, interpreted through the recursion [n+1 choose k+1]_q = [n choose k]_q + q^{k+1}[n choose k+1]_q with [n choose 0]_q = 1 and [0 choose k+1]_q = 0. For a prime power q it counts the k-dimensional subspaces of F_qⁿ. It satisfies the q-binomial theorem ∏_{i=0}^{n−1}(1 + q^i X) = Σ_k q^{k(k−1)/2}[n choose k]_q X^k, and for every polynomial f of degree ≤ n − 1, Σ_{i=0}^n (−1)^i q^{i(i−1)/2}[n choose i]_q f(q^{−i}) = 0.

**Hypotheses and conventions.**

- q any integer for the recursion (the subspace count needs q a prime power).
- k > n gives 0.

**Proof outline.**

1. Define by the Pascal-type recursion on (n, k) in Z, so no division is needed.
2. Subspace count: count ordered bases of k-dimensional subspaces and divide by |GL_k(F_q)|; the recursion follows by splitting on whether the subspace lies in a fixed hyperplane.
3. The q-binomial theorem is proved by induction on n from the recursion. Evaluating it at X = −q^{−s} for 0 ≤ s ≤ n − 1 kills the product (its factor i = s vanishes), which is the alternating identity for f = x^s, and linearity gives every f of degree ≤ n − 1 (HLSY Corollary 5.25); HLSY Lemma 5.26 is the companion expansion of (−X)^n in the basis ∏_{ℓ<i}(1 + q^{−ℓ}X).

**Uses.** HLSY2023 §§5–7: subspace counts, the primitive-density decomposition and the alternating sums in the proof of Theorem 7.1; GN.3 orthogonal-isometry-count: counts of totally isotropic subspaces are q-binomial expressions.

**API.**

- `gaussianBinomial` (data): [n choose k]_q ∈ Z by the recursion.
- `gaussianBinomial_zero_right` (simp): [n choose 0]_q = 1.
- `gaussianBinomial_succ_succ` (simp): [n+1 choose k+1]_q = [n choose k]_q + q^{k+1}[n choose k+1]_q.
- `gaussianBinomial_symm` (relation): [n choose k]_q = [n choose n − k]_q for k ≤ n.
- `card_subspaces_eq_gaussianBinomial` (compatibility): For a finite field of cardinality q, the number of k-dimensional subspaces of an n-dimensional space is [n choose k]_q.
- `gaussianBinomial_alternating_sum` (relation): Σ_i (−1)^i q^{i(i−1)/2}[n choose i]_q f(q^{−i}) = 0 for deg f ≤ n − 1 (in ℚ).
- `qBinomial_theorem` (relation): ∏_{i<n}(1 + q^i X) = Σ_k q^{k(k−1)/2}[n choose k]_q X^k.

**Unit tests.**

- `gaussianBinomial_one` (compatibility): gaussianBinomial 1 n k = Nat.choose n k.
- `gaussianBinomial_two_four_two` (computation): gaussianBinomial 2 4 2 = 35.
- `gaussianBinomial_gt` (degenerate): gaussianBinomial q 2 3 = 0.
- `gaussianBinomial_three_two_one` (computation): gaussianBinomial 3 2 1 = 4 (the four lines of F_3²), not 2.

**Checks.**

- [n choose k]_1 is the ordinary binomial coefficient.
- [4 choose 2]_2 = 35, the number of planes in F_2⁴.
- [n choose k]_q = [n choose n − k]_q.

**Direct prerequisites.** `Nat.choose` (Mathlib); `Polynomial` (Mathlib).

**Source.** Qiao He, Chao Li, Yousheng Shi and Tonghai Yang, *A proof of the Kudla–Rapoport conjecture for Krämer models*, Corollary 5.25 and Lemma 5.26, (5.14), p.40 (arXiv:2208.07988, authors' final version): Uses the q-binomial coefficients and proves the alternating-sum vanishing and the evaluation Σ (−1)^i q^{i(i−1)/2}[n choose i]_q ∏_{ℓ<i}(1 + q^{−ℓ}X) = (−X)^n. Qiao He, Chao Li, Yousheng Shi and Tonghai Yang, *A proof of the Kudla–Rapoport conjecture for Krämer models*, Lemma 7.8, (7.12), p.51: A lattice-path identity between Gaussian binomials used in the derivative computation.

<a id="finite-orthogonal-group-order"></a>

### Orders of finite orthogonal groups

*Theorem* `finite-orthogonal-group-order`

Let q be an odd prime power and V a nondegenerate quadratic space of dimension m over F_q. Then |O(V)| = 2 q^{m(m−1)/2} (1 − sgn(V) q^{−m/2}) ∏_{1 ≤ i < m/2} (1 − q^{−2i}), where for even m, sgn(V) = ±1 according as V is split or not (χ((−1)^{m/2} det V)), and for odd m the factor (1 − sgn(V)q^{−m/2}) is omitted (sgn = 0). Equivalently |SO^±_{2r}(F_q)| = q^{r(r−1)}(q^r ∓ 1)∏_{i=1}^{r−1}(q^{2i} − 1) and |SO_{2r+1}(F_q)| = q^{r²}∏_{i=1}^r(q^{2i} − 1). For q a power of 2 the same formulas give the orders of the corresponding reductive (Chevalley and Steinberg) groups of types D_r, ²D_r and B_r, the last realized as the reductive quotient of the orthogonal group of an odd-dimensional form.

**Hypotheses and conventions.**

- m ≥ 0; |O(0)| = 1 by convention (the product formula's 2 is replaced by 1 in dimension 0).
- The split type is read from the signed determinant (−1)^{m/2} det V, not the plain determinant.

**Proof outline.**

1. Induction on m by orbit–stabilizer for the action on vectors of a fixed nonzero norm (Witt's theorem), counting such vectors by Gauss sums: an m-dimensional nondegenerate form takes each nonzero value q^{m−1} − sgn·q^{(m−2)/2} times (m even) or q^{m−1} + χ(…)q^{(m−1)/2} times (m odd).
2. Collect the factors into the displayed product; the index [O:SO] = 2 in dimension ≥ 1.
3. For q a power of 2 the same orbit–stabilizer induction applies to the quadratic form itself (Witt's theorem holds for nondefective quadratic spaces, and the numbers of vectors of a given nonzero value are the same). In odd dimension 2r + 1 the polar form has a one-dimensional radical and the orthogonal group maps isomorphically onto Sp_{2r}(F_q), so |SO_{2r+1}(F_q)| = q^{r²}∏_{i=1}^r(q^{2i} − 1); in even dimension SO is the kernel of the Dickson invariant. No roadmap supplies Steinberg's general order formula (ReductiveGroups Layer 9 constructs the pinned Chevalley groups only), so the counts are made directly.

**Checks.**

- |O_2^+(F_3)| = 4 and |O_2^−(F_3)| = 8; the hyperbolic plane over F_3 has determinant −1, a nonsquare, yet is split: the signed determinant (−1)·(−1) = 1 is a square.
- |SO_4^+(F_2)| = 36 and |SO_4^−(F_2)| = 60.
- |SO_3(F_q)| = q(q² − 1), e.g. 24 for q = 3; |O(0)| = 1.

**Direct prerequisites.** `QuadraticMap` (Mathlib); `Matrix.orthogonalGroup` (Mathlib); `GaloisField` (Mathlib).

**Source.** Chao Li and Wei Zhang, *On the arithmetic Siegel–Weil formula for GSpin Shimura varieties*, §3.2, (3.2.0.1)–(3.2.0.2), p.11 (arXiv:2106.15038, authors' final version of 2 March 2022): States the order of O(V) over a finite field of odd characteristic with the sign of V and the boundary convention in dimension 0. Wee Teck Gan, Jonathan Hanke and Jiu-Kang Yu, *On an exact mass formula of Shimura*, Tables 3–4, pp.115–116 (Duke Math. J. 107 (2001), authors' copy): Lists the orders of the reductive quotients, including the dyadic cases, used for the local mass factors. Qiao He, Chao Li, Yousheng Shi and Tonghai Yang, *A proof of the Kudla–Rapoport conjecture for Krämer models*, Corollary 5.17, p.37: Records Den(I_n, I_n) = 2q^{n(n−1)/2}∏(1 − q^{−2s}) (with the factor (1 + ϵq^{−n/2}) for even n), the order of the orthogonal group of the residue quadratic space, in agreement with these orders.

<a id="orthogonal-isometry-count"></a>

### Isometries and isotropic subspaces of finite quadratic spaces

*Theorem* `orthogonal-isometry-count`

Let q be odd, U a quadratic space of dimension n over F_q whose radical has dimension t, and V nondegenerate of dimension m ≥ n. The number #O(U,V) of injective isometries U → V is given by orbit–stabilizer from Witt's theorem: it is zero when U does not embed in V and otherwise equals, in the form of Li–Zhang Lemma 3.2.1, q^{n(2m−n−1)/2}(1 − sgn(V)q^{−m/2})(1 − χ(V)sgn_m(U)q^{−(m−n−t)/2})^{−1}∏_{(m−n−t)/2 ≤ i < m/2}(1 − q^{−2i}), and for U = 0 with m even the count is 1: the displayed expression then reduces to 1 (it is 0/0 only at m = 0, read as 1), while the simplified 'Namely' form of the lemma gives 1 − q^{−m} (GN/E302). The number S_b(V) of totally isotropic b-dimensional subspaces of V and the numbers m(U,V) of subspaces of V isometric to U are given by the same orbit–stabilizer argument (Li–Zhang Lemma 3.2.2; HLSY Lemmas 5.18–5.22).

**Hypotheses and conventions.**

- q odd; injective isometries (embeddings) are counted, not all form-preserving maps.
- The boundary case U = 0 has exactly one embedding; S_0(V) = 1.

**Proof outline.**

1. Witt's theorem makes O(V) act transitively on embeddings of U with a given image type; the stabilizer of an embedding of U = U_0 ⊥ rad is computed from the orthogonal complement of the nondegenerate part and the parabolic fixing the isotropic radical.
2. Insert the orders of finite-orthogonal-group-order and the count of totally isotropic frames; simplify.
3. Subspace counts m(U,V) = #O(U,V)/(q^{jk}|O(U_0)|·|GL_j(F_q)|) (HLSY Lemma 5.18), and the flag identity of HLSY Lemma 5.22 from counting pairs of nested subspaces in two ways.

**Checks.**

- Isotropic vectors: for the split plane over F_q the number of nonzero isotropic vectors is 2(q − 1).
- For U = 0 and m even the count is 1; the first display of Li–Zhang Lemma 3.2.1 gives (1 − sgn(V)q^{−m/2})/(1 − sgn(V)q^{−m/2}) = 1 (0/0 at m = 0), while its simplified 'Namely' form gives 1 − q^{−m} (erratum E302).
- For m = n = t = 1 (U a degenerate line, V a line) there is no embedding: a nondegenerate line has no isotropic vector.

**Direct prerequisites.** [Orders of finite orthogonal groups](#finite-orthogonal-group-order); [Gaussian binomial coefficients](#gaussian-binomial).

**Source.** Chao Li and Wei Zhang, *On the arithmetic Siegel–Weil formula for GSpin Shimura varieties*, Lemma 3.2.1, Lemma 3.2.2 and Corollary 3.2.3, pp.11–13: Counts isometries from a possibly degenerate U into a nondegenerate V, totally isotropic subspaces and isotropic vectors over a finite field of odd characteristic. Qiao He, Chao Li, Yousheng Shi and Tonghai Yang, *A proof of the Kudla–Rapoport conjecture for Krämer models*, Definitions 5.14–5.15, Lemmas 5.16, 5.18–5.22, Corollary 5.20, pp.37–39: Counts subspaces isometric to a given space, with the recursion and flag identities used in the density computations.

<a id="unitary-isotropic-subspace-count"></a>

### Totally isotropic subspaces of a finite hermitian space

*Theorem* `unitary-isotropic-subspace-count`

For a nondegenerate F_{q²}/F_q-hermitian space V of dimension m, the number of totally isotropic F_{q²}-subspaces of dimension b is S_{m,b} = ∏_{i=m−2b+1}^{m}(1 − (−q)^i) / ∏_{i=1}^{b}(1 − q^{2i}).

**Hypotheses and conventions.**

- 0 ≤ 2b ≤ m; S_{m,0} = 1.
- The involution is the q-power Frobenius of F_{q²}.

**Proof outline.**

1. Orbit–stabilizer for U_m(F_q) acting transitively on totally isotropic b-subspaces (Witt), with stabilizer the Siegel-type parabolic P_b.
2. |U_m(F_q)| = q^{m(m−1)/2}∏_{j=1}^m(q^j − (−1)^j) and the Levi/unipotent orders of P_b give the ratio.

**Checks.**

- S_{2,1} = q + 1.
- S_{3,1} = q³ + 1.
- S_{4,2} = (q + 1)(q³ + 1).

**Direct prerequisites.** base packet `GN.3/finite-hermitian-isometry-formula`; `GaloisField` (Mathlib).

**Source.** Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, Lemma 1.9.1, p.10 (arXiv:1908.01701v3): Gives the number of totally isotropic b-dimensional subspaces of an m-dimensional nondegenerate hermitian space over the residue field.

<a id="symplectic-isometry-count"></a>

### Isometries into a finite symplectic space

*Theorem* `symplectic-isometry-count`

Let k = F_q, H_{s} the nondegenerate symplectic space of dimension 2s over k, and U a symplectic (alternating) space of dimension m whose radical has dimension t, with m − t even. The number of injective isometries U → H_s is q^{m(4s−m+1)/2}∏_{s−(m+t)/2 < i ≤ s}(1 − q^{−2i}) when m + t ≤ 2s, and 0 otherwise.

**Hypotheses and conventions.**

- Alternating forms; injective isometries.
- The case t = 0, m = 2s gives |Sp_{2s}(F_q)|.

**Proof outline.**

1. Witt's theorem for alternating forms gives transitivity on embeddings; split U as a nondegenerate part plus radical and count symplectic frames and isotropic extensions.
2. Multiply the frame counts and simplify to the displayed product.

**Checks.**

- m = 2s, t = 0: the count is |Sp_{2s}(F_q)| = q^{s²}∏_{i=1}^s(q^{2i} − 1).
- m = t = 1: the count is q^{2s} − 1, the nonzero vectors.
- m + t > 2s gives 0.

**Direct prerequisites.** [Gaussian binomial coefficients](#gaussian-binomial).

**Source.** Chao Li and Yifeng Liu, *Chow groups and L-derivatives of automorphic motives for unitary groups, II*, Lemma 2.15 and its proof, (2.2), pp.12–13 (Forum Math. Pi 10 (2022), e5): Counts isometries of the symplectic residue space of a ramified hermitian lattice into H_{s,k}.

<a id="finite-hermitian-norm-fiber"></a>

### Norm fibres of F_{q²}/F_q

*Lemma* `finite-hermitian-norm-fiber`

For a prime power q, the norm map N: F_{q²}^× → F_q^×, x ↦ x^{q+1}, is surjective and each fibre has q + 1 elements; the zero fibre {0} has one. Consequently the number of vectors of hermitian norm c in a nondegenerate hermitian space of dimension r over F_{q²} is q^{2r−1} − (−1)^r q^{r−1} for c ≠ 0 and q^{2r−1} + (−1)^r(q^r − q^{r−1}) for c = 0.

**Hypotheses and conventions.**

- q a prime power, any characteristic.

**Proof outline.**

1. The multiplicative group of F_{q²} is cyclic of order q² − 1, and x ↦ x^{q+1} has kernel of order q + 1 and image of order q − 1.
2. Diagonalize the hermitian form (every nondegenerate hermitian form over a finite field is isometric to the unit form) and count by induction on r.

**Checks.**

- q = 2: the norm fibres over 1 and 0 in F_4 have 3 and 1 elements.
- r = 1: the norm-c count is q + 1 for c ≠ 0.
- r = 2, c = 0: q³ + q² − q nonzero-or-zero vectors: (q² − 1)(q + 1) + 1 = q³ + q² − q.

**Direct prerequisites.** `GaloisField` (Mathlib); `IsCyclic` (Mathlib).

**Source.** Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, Proof of Theorem 3.5.1, pp.17–18: Uses the count of hermitian isometries over the residue field, which rests on these norm-fibre counts.

## 3C. Quadratic local densities and Siegel's theorem

Local representation densities of quadratic lattices over the integers of a p-adic field, their stabilization, Hanke's reduction maps and closed forms, the uniform bounds used in counting problems, Li–Zhang's Cho–Yamauchi formula and local Siegel series with Ikeda's functional equations, and Siegel's main theorem. Over ℤ_p, the automorphism density α_p(L) with its stabilization and odd-p values is IntegralLattices 7C, and is the case M = L of the density here.

<a id="quadratic-local-density"></a>

### Local representation densities of quadratic lattices

*Construction* `quadratic-local-density` — planet: **Quadratic local densities**

Let F be a nonarchimedean local field of characteristic 0 with ring of integers O_F, uniformizer ϖ and residue cardinality q, and let M, L be nondegenerate quadratic O_F-lattices (integral quadratic lattices of GN.2 localized) of ranks m and n. The representation functor Rep_{M,L}(R) is the set of R-linear maps φ: L ⊗ R → M ⊗ R with Q_M ∘ φ = Q_L, for O_F-algebras R; it is represented by an affine O_F-scheme of finite type. When its generic fibre is nonempty (then n ≤ m), the generic fibre has dimension d = n(2m − n − 1)/2, and the local density is Den(M,L) = lim_N #Rep_{M,L}(O_F/ϖ^N)/q^{N d}. When the generic fibre is empty, Den(M,L) = 0. The representation density of an element t ∈ O_F by M is the case L = ⟨t⟩ (rank one, Q_L(x) = t x²): β(M,t) = lim_N q^{−N(m−1)}#{v ∈ M/ϖ^N M : Q_M(v) ≡ t mod ϖ^N}.

**Hypotheses and conventions.**

- Quadratic maps are primary: Q_M ∘ φ = Q_L, which for p = 2 is stronger than equality of the polar bilinear forms.
- The density is the eventual value of the normalized counts (density-stabilization), not a chosen limit.
- Basis changes of M and L act on Rep_{M,L} by isomorphisms.

**Proof outline.**

1. Write Rep_{M,L} in bases: X ∈ M_{m×n} with the n(n+1)/2 equations Q_M(Xe_i) = Q_L(e_i) and polar equations for i < j; this is a closed subscheme of affine space.
2. Generic dimension: over F, Rep is a torsor-type fibration O_m → O_m/O_{m−n}, giving dim O_m − dim O_{m−n}.
3. Define the density as the eventual value of the normalized sequence (quadratic-density-stabilization), with the empty generic fibre giving 0 by the eventual-emptiness argument of the parent node empty-generic-density-zero transported to the quadratic case.
4. Compatibility: for F = Q_p, p odd, and M = L, Den(L,L) is the automorphism density α_p(L) of IntegralLattices 7C (same count and same exponent n(n−1)/2).

**Uses.** HankeAWS Theorem 2.5.1: the Fourier coefficients of the genus Eisenstein series are products of these densities; LiZhangGSpin Lemma 3.3.2 and §§3.4–3.6: densities against self-dual targets H^ε_m define the local Siegel series; SSTT2022 §4 and Lemma 7.9: uniform bounds for the local terms in counting Picard-rank jumps; MST2022 Theorem 7.15: local factors of the Siegel mass formula for the auxiliary lattices.

**API.**

- `quadraticRepCount` (data): #Rep_{M,L}(O_F/ϖ^N), a finite count.
- `quadraticLocalDensity` (data): Den(M,L) as the eventual normalized count, in ℚ.
- `quadraticLocalDensity_basisChange` (functoriality): Den depends only on the isometry classes of M and L.
- `quadraticLocalDensity_emptyGeneric` (characterisation): If L ⊗ F does not embed isometrically in M ⊗ F then Den(M,L) = 0.
- `representationDensity` (data): β(M,t) = Den(M,⟨t⟩).
- `quadraticLocalDensity_self_eq_alpha` (compatibility): For F = Q_p with p odd, Den(L,L) equals IntegralLattices' α_p(L).

**Unit tests.**

- `representationDensity_one_one` (computation): Over Z_p, p odd: β(⟨1⟩, 1) = 2.
- `representationDensity_one_p` (non-example): Over Z_p, p odd: β(⟨1⟩, p) = 0, although the congruence modulo p has the solution 0.
- `quadraticLocalDensity_rank_zero` (degenerate): Den(M, 0) = 1.
- `quadraticLocalDensity_hyperbolic_three` (compatibility): For the hyperbolic plane over Z_3, Den(H,H) = 4/3 = α_3(H) of IntegralLattices 7C (split, not read off the raw determinant).

**Checks.**

- For M = ⟨1⟩ over Z_p, p odd, and t = 1: β = 2 (the solutions ±1 of x² ≡ 1 lift uniquely).
- For M = ⟨1⟩ and t = p: β = 0 for p odd, although x = 0 solves x² ≡ p mod p.
- For n = 0, Den(M, 0) = 1.

**Direct prerequisites.** base packet `GN.2/integral-quadratic-lattice`; base packet `GN.3/empty-generic-density-zero`; `QuadraticMap` (Mathlib); `IsDiscreteValuationRing` (Mathlib).

**Source.** Chao Li and Wei Zhang, *On the arithmetic Siegel–Weil formula for GSpin Shimura varieties*, Definition 3.1.1, (3.1.1.1)–(3.1.1.2), p.10: Defines Rep_{M,L} through quadratic-module homomorphisms, the density as the limit of normalized counts and the generic dimension n(2m − n − 1)/2. Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou, *Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields*, §4.1, (4.1), p.15 (arXiv:1909.07473): Defines N_m(p^n), μ_p(m,n) = p^{−n(r−1)}N_m(p^n) and the local density μ_p(Q,m) as its stable value. Davesh Maulik, Ananth N. Shankar and Yunqing Tang, *Picard ranks of K3 surfaces over function fields and the Hecke orbit conjecture*, §7.3 (accepted version, 25 December 2021): Uses δ(ℓ,L,m) = lim ℓ^{a(1−rk L)}#{v ∈ L/ℓ^a : Q(v) ≡ m mod ℓ^a}. Jonathan Hanke, *Quadratic forms and automorphic forms (notes from the 2009 Arizona Winter School)*, Theorem 2.5.1, (2.7), p.33, and Lemma 2.7.2, p.37: Defines the local representation density β_{Q,p}(m) as a volume ratio and identifies it with the limit of normalized congruence counts.

<a id="quadratic-density-stabilization"></a>

### Stabilization of quadratic representation counts

*Theorem* `quadratic-density-stabilization`

In the setting of quadratic-local-density with nonempty generic fibre, there is N_0, depending on n, m and the valuations of the discriminants of M and L and of 2, such that #Rep_{M,L}(O_F/ϖ^{N+1}) = q^d #Rep_{M,L}(O_F/ϖ^N) for all N ≥ N_0; when the generic fibre is empty the counts vanish for N ≥ N_0. For representation numbers of a maximal Z_p-lattice of rank r ≥ 5, the normalized counts μ_p(m,n) are constant for n ≥ w_p(m), where w_p(m) = 1 + v_p(m) for p odd and w_2(m) = 1 + 2v_2(2m), and |μ_p(m,n) − μ_p(m,w_p(m))| ≪ p^{−(3⌊n/2⌋−2)} for 2 + v_2(p) ≤ n < w_p(m), with an absolute implied constant.

**Hypotheses and conventions.**

- F of characteristic 0; for the quantitative part, L a maximal Z_p-lattice of rank r ≥ 5 and m ≠ 0.

**Proof outline.**

1. The integral solution set of Q_M∘X = Q_L is compact; near each solution the Jacobian of the Gram map has a right inverse with denominators bounded by the valuations of 2 det, so a quadratic Hensel lemma gives finitely many residue charts on which the map is a submersion after fixed scalings (the quadratic analogue of the parent node's hermitian stabilization argument).
2. On each chart every additional level adds exactly q^d points; compactness shows all sufficiently accurate approximate solutions lie in the charts.
3. Empty generic fibre: a convergent subsequence of approximate solutions would give an exact solution, so the counts vanish eventually.
4. Quantitative part: SSTT Corollary 4.3 expresses μ_p(m,n) through good-type densities at level 1 and the reduction maps, which gives the stated decay (SSTT Lemma 4.4).

**Checks.**

- For M = ⟨1⟩ over Z_3 and t = 1 the normalized counts are 2 from N = 1 on.
- For M = ⟨1⟩ and t = 9 over Z_3 (rank one, so the normalizing exponent is 0): the counts modulo 3, 9, 27, 81 are 1, 3, 6, 6, stabilizing from N = 3 = 1 + v_3(9).
- Empty generic fibre: x² = 3 over Z_3 has a solution modulo 3 but none modulo 9.

**Direct prerequisites.** [Local representation densities of quadratic lattices](#quadratic-local-density); [Hanke's reduction maps for local densities](#hanke-reduction-maps).

**Source.** Chao Li and Wei Zhang, *On the arithmetic Siegel–Weil formula for GSpin Shimura varieties*, Definition 3.1.1, p.10: Defines the density as a limit of normalized counts (stabilization is asserted there through the cited references). Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou, *Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields*, §4.1, p.15, and Lemma 4.4, p.17: States that the normalized counts stabilize and proves the decay bound for n below w_p(m).

<a id="hanke-solution-types"></a>

### Jordan splitting and Hanke's solution types

*Construction* `hanke-solution-types`

Let L_p be a maximal quadratic Z_p-lattice of rank r. Fix a Jordan splitting L_p = ⊕_j (L_j, p^{ν_j}Q_j) with each (L_j,Q_j) unimodular of rank 1 (p odd) or rank 1 or 2 (p = 2); maximality forces ν_j ∈ {0,1}. Put S_i = {j : ν_j = i} and s_i = Σ_{j∈S_i} rank L_j (total rank, not the number of blocks), and let Q′ be the form with each ν_j replaced by 1 − ν_j. A solution v of Q(v) ≡ m mod p^n is of zero type if v ≡ 0 mod p, of good type if v_j ≢ 0 mod p for some j with ν_j = 0, and of bad type otherwise. This splits the count N_m(p^n) = N_m^good + N_m^bad + N_m^zero and the densities μ_p = μ^good + μ^bad + μ^zero accordingly.

**Hypotheses and conventions.**

- L maximal (for ν_j ≤ 1); r ≥ 1.
- The types depend on the chosen splitting only through the decomposition into the ν = 0 and ν = 1 parts.

**Proof outline.**

1. Existence of the Jordan splitting with blocks of rank ≤ 2 is IntegralLattices 3B–3C over Z_p (and GN.2 dyadic-atomic-form in general).
2. Maximality: a block with ν_j ≥ 2 would allow the overlattice p^{−1}L_j, contradicting maximality.
3. The three types partition the solution set; the densities are the normalized counts of each type.

**Uses.** SSTT2022 Lemma 4.2 and Corollary 4.3: the reduction maps relate the three types to densities of Q and Q′ at lower levels; SSTT2022 Lemma 7.9: bounds each type separately.

**API.**

- `JordanTypeData` (structure): A Jordan splitting with exponents ν_j ∈ {0,1} and the ranks s_0, s_1.
- `goodTypeCount` (data): N_m^good(p^n).
- `badTypeCount` (data): N_m^bad(p^n).
- `zeroTypeCount` (data): N_m^zero(p^n).
- `count_eq_good_add_bad_add_zero` (characterisation): N_m(p^n) = N_m^good + N_m^bad + N_m^zero.
- `dualSwap` (data): The form Q′ obtained by ν_j ↦ 1 − ν_j.

**Unit tests.**

- `goodTypeCount_of_not_dvd` (characterisation): If p ∤ m then N_m(p^n) = N_m^good(p^n).
- `zeroTypeCount_eq_zero` (degenerate): If p² ∤ m and n ≥ 2 then N_m^zero(p^n) = 0.
- `badTypeCount_unimodular` (computation): For x² + y² + z² + w² + t² over Z_3 (unimodular), N_m^bad(3^n) = 0 for all m, n.
- `rank_convention_dyadic` (non-example): For Q = ab + cd + 2t² at p = 2, s_0 = 4 (two rank-two blocks), not 2; using the block count changes the reduction factor.

**Checks.**

- For p ∤ m every solution modulo p is of good type, so N_m = N_m^good.
- If p² ∤ m and n ≥ 2 there are no zero-type solutions.
- If p ∤ 2 det L there are no bad-type solutions (all ν_j = 0).

**Direct prerequisites.** [Local representation densities of quadratic lattices](#quadratic-local-density); base packet `GN.2/dyadic-atomic-form`.

**Source.** Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou, *Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields*, §4.1, (4.2), pp.15–16: States Hanke's Jordan splitting for maximal lattices, the integers s_i, the solution types and Q′, with the total-rank convention corrected by the paper's erratum E7 from Hanke p.360.

<a id="hanke-reduction-maps"></a>

### Hanke's reduction maps for local densities

*Theorem* `hanke-reduction-maps`

Let L be a maximal Z_p-lattice of rank r with the data of hanke-solution-types and δ = 2v_2(p) + 1. (1) For n ≥ δ and all m, μ^good_p(m,n) = μ^good_p(m,δ). (2) If p | m, then N^bad_{m,Q}(p^{n+1}) = p^{r−s_0}N^good_{m/p,Q′}(p^n), equivalently μ^bad_{p,Q}(m,n+1) = p^{1−s_0}μ^good_{p,Q′}(m/p,n). (3) If p² | m, then N^zero_m(p^{n+2}) = p^r N_{m/p²}(p^n), equivalently μ^zero_p(m,n+2) = p^{2−r}μ_p(m/p², n). Here n ≥ 1 and s_0 is a total rank, also at p = 2.

**Hypotheses and conventions.**

- L maximal; n ≥ 1.

**Proof outline.**

1. (1) Good-type solutions are smooth points of the quadric modulo p (a coordinate in a unimodular block is a unit), so Hensel's lemma lifts each solution modulo p^n to exactly p^{r−1} solutions modulo p^{n+1} once n ≥ δ.
2. (2) A bad-type v has its ν = 0 coordinates divisible by p; substituting v = (pw_0, w_1) gives p·Q′(w) ≡ m mod p^{n+1}, and the free choices of the ν = 0 coordinates modulo p^{n+1} contribute p^{r − s_0}.
3. (3) Zero-type v = pw gives p²Q(w) ≡ m mod p^{n+2}, with p^r choices of w modulo p^{n+1} over each w modulo p^n.

**Checks.**

- For Q = ab + cd + 2t² and m = 2 at p = 2: bad counts modulo 4 and 8 are 32 and 640, good Q′ norm-one counts modulo 2 and 4 are 16 and 320, and the factor 2^{5−4} = 2 matches both (s_0 = 4).
- For a unimodular L and p odd, (2) is vacuous: there are no bad solutions.
- (3) with r = 1, Q = x² over Z_3, m = 9: N_9(27) = 6 = 3·N_1(3) = 3·2.

**Direct prerequisites.** [Jordan splitting and Hanke's solution types](#hanke-solution-types).

**Source.** Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou, *Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields*, Lemma 4.2, p.16: States the three reduction identities, attributed to Hanke, with the rank convention corrected (E7). Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou, *Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields*, Corollary 4.3, pp.16–17: Uses them to compute the densities at odd p.

<a id="odd-prime-density-formula"></a>

### Closed formulas for densities at odd primes

*Theorem* `odd-prime-density-formula`

Let p be odd, L a maximal Z_p-lattice of rank r, and δ_{p,det L} = 1 if p | det L and 0 otherwise. (1) If n ≥ v_p(m) + 1, then μ_{p,Q}(m,n) = Σ_{u=0}^{⌊v_p(m)/2⌋} p^{(2−r)u} μ^good_{p,Q}(m/p^{2u},1) + δ_{p,det L} p^{1−s_0} Σ_{u=0}^{⌊(v_p(m)−1)/2⌋} p^{(2−r)u} μ^good_{p,Q′}(m/p^{2u+1},1). (2) If 1 ≤ n ≤ v_p(m) and n is odd, μ_{p,Q}(m,n) = p^{(2−r)(n−1)/2}μ_{p,Q}(mp^{1−n},1) + Σ_{u=0}^{(n−3)/2} p^{(2−r)u}μ^good_{p,Q}(m/p^{2u},1) + δ_{p,det L}p^{1−s_0}Σ_{u=0}^{(n−3)/2}p^{(2−r)u}μ^good_{p,Q′}(m/p^{2u+1},1), and (3) the analogous formula holds for n even. The level-one good densities are explicit point counts of nondegenerate quadrics over F_p.

**Hypotheses and conventions.**

- p odd; L maximal; m ≠ 0.

**Proof outline.**

1. Iterate hanke-reduction-maps, splitting each count into its three types, until the level is one or the remaining part of m is prime to p.
2. Use (1) of the reduction maps to replace good densities at higher level by level one (δ = 1 for odd p).
3. The level-one good densities are counts of smooth points of a quadric over F_p (finite-orthogonal-group-order and its Gauss-sum vector counts).

**Checks.**

- Q = x_1x_2 + x_3x_4 + 3x_5² at p = 3, n = 3: formula (1) agrees with direct counts for every m < 27.
- For L unimodular (δ = 0) and p ∤ m, μ_p(m,n) = μ^good_p(m,1) for all n ≥ 1.
- At m with v_p(m) = 1 the second sum in (1) has the single term u = 0.

**Direct prerequisites.** [Hanke's reduction maps for local densities](#hanke-reduction-maps); [Orders of finite orthogonal groups](#finite-orthogonal-group-order).

**Source.** Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou, *Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields*, Corollary 4.3, pp.16–17: Gives the closed formulas for μ_p(m,n) at odd p in terms of level-one good densities of Q and Q′.

<a id="density-good-prime-bounds"></a>

### Densities near one at good primes and a uniform lower bound

*Theorem* `density-good-prime-bounds`

Let L be a positive definite maximal Z-lattice of rank r ≥ 5. (1) There is C > 0 such that |μ_p(m,n) − 1| ≤ C/p for all m, n ≥ 1 and all primes p ∤ 2 det L. (2) μ_p(m,n) ≥ 1/2 for all m, n ≥ 1 and all primes p.

**Hypotheses and conventions.**

- Both parts are proved under the standing hypotheses of SSTT §4: L maximal of rank r ≥ 5; part (1) concerns the primes p ∤ 2 det L. The rank hypothesis matters in (1): for Q = x² and p ∤ 2m, μ_p(m,1) is 0 or 2.

**Proof outline.**

1. (1) By odd-prime-density-formula, μ_p(m,n) is a short combination of level-one densities; for a nondegenerate quadric in r ≥ 5 variables over F_p, the number of solutions of Q(x) = c is p^{r−1} + O(p^{r/2}), by Gauss sums, so each level-one density is 1 + O(p^{−3/2}) (or 1 + O(1/p) at the zero class), and the extra terms carry factors p^{2−r}.
2. (2) A maximal lattice of rank ≥ 5 has a hyperbolic plane over Z_p: Q = x_1x_2 + Q_1 in a suitable basis. Solutions with x_1 a unit are good and number at least (p−1)/p of the maximum, giving μ^good ≥ (p−1)/p ≥ 1/2.

**Checks.**

- For a unimodular form of rank 5, p odd and p ∤ m, μ_p(m,1) = p^{−4}#{x ∈ F_p^5 : Q(x) = m} = 1 + χ(m det Q)p^{−2}.
- Without the rank and maximality hypotheses the lower bound fails: for ⟨1⟩ and p odd, μ_p(p,n) = 0 for n ≥ 2.
- At p = 2 the bound (2) still holds for maximal lattices of rank ≥ 5.

**Direct prerequisites.** [Closed formulas for densities at odd primes](#odd-prime-density-formula); [Jordan splitting and Hanke's solution types](#hanke-solution-types).

**Source.** Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou, *Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields*, Lemma 4.5, pp.17–18: Proves |μ_p(m,n) − 1| ≤ C_2/p at primes not dividing 2 det L. Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou, *Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields*, Lemma 4.6, pp.18–19: Proves μ_p(m,n) ≥ 1/2 for maximal lattices of rank ≥ 5 from a hyperbolic splitting.

<a id="density-local-term-bounds"></a>

### Bounds for the local terms in Bruinier–Kühn and for discriminant-sensitive densities

*Theorem* `density-local-term-bounds`

Let L be a positive definite maximal Z-lattice of rank r ≥ 5. (1) If m is represented by L over Z, then |w_p(m) − Σ_{n=0}^{w_p(m)−1} μ_p(m,n)/μ_p(m,w_p(m))| ≪ 1/p with an implied constant independent of p and m. (2) For every positive definite integral quadratic form Q of rank r ≥ 5, m ≥ 1 and prime p, μ_∞(Q,1)μ_p(Q,m) ≪_r p^r/|Disc Q|^{3/20}, where μ_∞(Q,1) ≍_r Disc(Q)^{−1/2} is the archimedean density.

**Hypotheses and conventions.**

- r ≥ 5; (1) for maximal L, (2) for arbitrary positive definite integral Q.

**Proof outline.**

1. (1) For p ∤ 2 det L, combine density-good-prime-bounds (1) at every level n < w_p(m); for p | 2 det L, use quadratic-density-stabilization's decay and the lower bound 1/2.
2. (2) Decompose μ_p into good, two bad and zero parts (Hanke); bound μ^good ≤ p³, the first bad part ≤ p⁴, and the second bad and zero parts by p^{2−r} times densities of forms of smaller discriminant at level n − 2, then induct on n using Disc(Q″) ≥ Disc(Q)/p^{2r}.

**Checks.**

- For p ∤ 2 det L and p ∤ m, w_p(m) = 1 and the term in (1) is |1 − μ_p(m,0)/μ_p(m,1)| = |1 − 1/μ_p(m,1)| = O(1/p).
- (2) is vacuous in rank < 5: the proof uses the archimedean factor's exponent and r ≥ 5.
- The exponent 3/20 is the paper's; no sharper exponent is claimed.

**Direct prerequisites.** [Densities near one at good primes and a uniform lower bound](#density-good-prime-bounds); [Stabilization of quadratic representation counts](#quadratic-density-stabilization); [Hanke's reduction maps for local densities](#hanke-reduction-maps).

**Source.** Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou, *Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields*, Proposition 4.1, p.15, proof p.19: Bounds the local term of the Bruinier–Kühn formula by O(1/p). Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou, *Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields*, Lemma 7.9 and proof, p.39: Proves the discriminant-sensitive bound by induction on the level using Hanke's decomposition.

<a id="orthogonal-cho-yamauchi"></a>

### Cho–Yamauchi formula for quadratic densities

*Theorem* `orthogonal-cho-yamauchi`

Let F be a nonarchimedean local field with odd residue characteristic, L a nondegenerate quadratic O_F-lattice of rank n, and H^ε_m the self-dual quadratic O_F-lattice of rank m ≥ n whose reduction has χ = ε (for odd m, ε is the sign of the discriminant class). For an integral overlattice L′ ⊇ L let t(L′) = dim_k(L′^∨/L′ ⊗ k) be its type and sgn_m(L′) the sign of the nondegenerate part of the reduction of L′ (LZ (3.2.0.6)). Then Den(H^ε_m, L) = Σ_{L ⊆ L′ ⊆ L′^∨} q^{(n+1−m)ℓ(L′/L)}(1 − sgn(H^ε_m)q^{−m/2})(1 + ε sgn_m(L′)q^{−(m−n−t(L′))/2})∏_{(m−n−t(L′))/2 < i < m/2}(1 − q^{−2i}) (Li–Zhang (3.3.2.1)); the summand indexed by L′ is the normalized number of isometries of the reduction of L′ into that of H^ε_m, times the volume factor q^{(n+1−m)ℓ(L′/L)}.

**Hypotheses and conventions.**

- Odd residue characteristic; the sum is over integral lattices L′ with L ⊆ L′ ⊆ L′^∨, finite because L′ ⊆ L^∨.

**Proof outline.**

1. Every representation of L extends uniquely to a primitive representation of its saturation L′ (an integral overlattice); this partitions Rep(H^ε_m, L) by L′.
2. Primitive representations of L′ are smooth points; their density is q^{−d} times the finite-field isometry count of the reductions (orthogonal-isometry-count).
3. The change of variables from L to L′ contributes q^{(n+1−m)ℓ(L′/L)}.

**Checks.**

- For n = 0 the sum has one term and Den(H^ε_m, 0) = 1.
- For L = H^ε_n self-dual and m = n, the sum has the single term L′ = L and Den(H^ε_n, H^ε_n) = q^{−n(n−1)/2}|O(H^ε_n ⊗ k)|, the normalized finite orthogonal group order.
- The rank-one case L = ⟨ϖ^a⟩ gives a finite sum over the overlattices ⟨ϖ^{a−2j}⟩.

**Direct prerequisites.** [Local representation densities of quadratic lattices](#quadratic-local-density); [Isometries and isotropic subspaces of finite quadratic spaces](#orthogonal-isometry-count); base packet `GN.2/integral-quadratic-lattice`.

**Source.** Chao Li and Wei Zhang, *On the arithmetic Siegel–Weil formula for GSpin Shimura varieties*, Lemma 3.3.2, (3.3.2.1), and Lemma 3.3.3, pp.14–15: Proves the weighted lattice-count formula for Den(H^ε_m, L) from Cho–Yamauchi's method and Lemma 3.2.1, and the induction formula of Lemma 3.3.3. Chao Li and Wei Zhang, *On the arithmetic Siegel–Weil formula for GSpin Shimura varieties*, Lemma 3.2.1, p.11: The finite-field isometry count that gives each summand.

<a id="orthogonal-siegel-series"></a>

### Normalized local Siegel series of quadratic lattices

*Construction* `orthogonal-siegel-series` — planet: **Orthogonal local Siegel series**

For a quadratic O_F-lattice L of rank n (odd residue characteristic) and ε = ±1: (odd corank) Den^ε(X,L) ∈ Z[X] is the unique polynomial with Den^ε(q^{−k},L) = Den(H^ε_{n+1+2k},L)/Den(H^ε_{n+1+2k},H^ε_n) for all k ≥ 0; it equals Σ_{L⊆L′⊆L′^∨} X^{2ℓ(L′/L)} m^ε(t(L′), sgn_{n+1}(L′); X) with m(t,s;X) = (1 + s q^{(t−1)/2}X)∏_{0≤i<(t−1)/2}(1 − q^{2i}X²) and m^ε(t,s;X) = m(t,s;εX). (Even corank) Den^{♭ε}(X,L) is defined by Den^{♭ε}(q^{−k},L) = Den(H^ε_{n+2k},L)/Nor^{♭ε}(q^{−k},L) and equals Σ_{L′}(q^{1/2}X)^{2ℓ(L′/L)}m^{♭ε}(t(L′),sgn_n(L′),χ(L);X), with m^♭(t,s,χ;X) = (1 + s q^{t/2}X)(1 − χX)∏_{0<i<t/2}(1 − q^{2i}X²) for t > 0 and m^♭ = 1 for t = 0. The central derivative ∂Den^ε(L) = −(d/dX)Den^ε(X,L)|_{X=1} is defined when Den^ε(1,L) = 0.

**Hypotheses and conventions.**

- Odd residue characteristic; L nondegenerate; the normalizing polynomials Nor^ε, Nor^{♭ε} depend only on n (and χ(L) for the even case).

**Proof outline.**

1. Apply orthogonal-cho-yamauchi with m = n + 1 + 2k (resp. n + 2k) and divide by the self-dual value; each summand becomes the stated weight polynomial evaluated at q^{−k}.
2. The finite sum defines the polynomial; agreement at infinitely many points gives uniqueness.

**Uses.** LiZhangGSpin §§4–9: ∂Den^ε is the analytic side of the arithmetic Siegel–Weil formula for GSpin Shimura varieties; GN.3 ikeda-functional-equation: functional equations of both series; GN.3 orthogonal-induction-formula: induction on the last invariant.

**API.**

- `orthogonalSiegelSeries` (data): Den^ε(X,L) ∈ Z[X] (odd corank).
- `orthogonalSiegelSeriesFlat` (data): Den^{♭ε}(X,L) (even corank).
- `orthogonalSiegelSeries_eval` (characterisation): Evaluation at q^{−k} recovers the normalized density ratio.
- `orthogonalSiegelSeries_weightSum` (characterisation): The weighted overlattice-sum formula.
- `orthogonalSiegelSeries_selfDual` (simp): Self-dual L has series 1.
- `orthogonalSiegelSeries_cancel` (relation): Den^ε(X, L ⊥ M) = Den^{ε′}(X, L) for M self-dual, with the induced sign ε′.
- `orthogonalCentralDerivative` (data): ∂Den^ε(L).

**Unit tests.**

- `orthogonalSiegelSeries_selfDual_one` (degenerate): For L self-dual, Den^ε(X,L) = 1.
- `orthogonalSiegelSeries_example_111` (computation): For invariants (1,1,1), ε = −1: Den^−(X,L) = 1 − qX + qX² − X³ and ∂Den^−(L) = 3 − q.
- `weightFlat_zero` (non-example): m^♭(0,s,χ;X) = 1 for every s and χ.
- `orthogonalSiegelSeries_eval_zero` (compatibility): Den^ε(1,L)·Nor^ε(1) equals Den(H^ε_{n+1},L) (k = 0).

**Checks.**

- For L self-dual of rank n, Den^ε(X,L) = 1 (only L′ = L, type 0).
- For the lattice with invariants (1,1,1) in the case m = 4, ε = −1: Den^−(X,L) = 1 − qX + qX² − X³ and ∂Den^−(L) = 3 − q.
- The weight m^♭(0,s,χ;X) is 1, not (1 + sX)(1 − χX).

**Direct prerequisites.** [Cho–Yamauchi formula for quadratic densities](#orthogonal-cho-yamauchi); [Local representation densities of quadratic lattices](#quadratic-local-density).

**Source.** Chao Li and Wei Zhang, *On the arithmetic Siegel–Weil formula for GSpin Shimura varieties*, §3.4, Definitions 3.4.1–3.4.4 and Theorem 3.4.5, pp.16–17: Defines Nor^ε, the normalized Siegel series Den^ε(X,L), the weight polynomials and proves the weighted lattice-count formula in odd corank. Chao Li and Wei Zhang, *On the arithmetic Siegel–Weil formula for GSpin Shimura varieties*, §3.5, Definitions 3.5.1–3.5.3 and Theorem 3.5.4, p.18: The even-corank series Den^{♭ε} with its weight polynomials; the proof's H^ε_{n+1+2k} is a misprint for H^ε_{n+2k} (paper erratum E2). Chao Li and Wei Zhang, *On the arithmetic Siegel–Weil formula for GSpin Shimura varieties*, Example 4.15.3: The worked case with invariants (1,1,1) and the value ∂Den^− = 3 − q.

<a id="ikeda-functional-equation"></a>

### Functional equations of the orthogonal Siegel series (Ikeda)

*Theorem* `ikeda-functional-equation`

For a quadratic O_F-lattice L of rank n (odd residue characteristic): Den^ε(X,L) = w^ε(L)X^{val(L)}Den^ε(1/X,L) with w^ε(L) = (det L, −(−1)^{n(n+1)/2}u)_F ϵ(L_F) (a Hilbert symbol times the Hasse invariant), and Den^{♭ε}(X,L) = (q^{1/2}X)^{2⌊val(L)/2⌋}Den^{♭ε}(1/(qX),L). In particular, if w^ε(L) = −1 then Den^ε(1,L) = 0 and ∂Den^ε(L) = Σ_{L ⊆ L′ ⊆ L′^∨} m^ε(t(L′), sgn_{n+1}(L′)), where m^ε(t,s) = −(d/dX)m^ε(t,s;X)|_{X=1}.

**Hypotheses and conventions.**

- Odd residue characteristic; val(L) is the valuation of the determinant; u ∈ O_F^× is a unit with χ(u) = ε (a square for ε = +1, a nonsquare for ε = −1), as in Li–Zhang (3.4.6.1).

**Proof outline.**

1. Ikeda's theorem [Ike17, Thm 4.1(2)] in the case n odd, ε = +1; the same proof gives the general case (Li–Zhang Theorem 3.4.6).
2. The vanishing and derivative formula follow by setting X = 1 and differentiating the weighted sum of orthogonal-siegel-series.

**Checks.**

- Rank one L = ⟨ϖ^a u_0⟩: the functional equation can be checked from the explicit finite sum.
- The worked case (1,1,1), ε = −1: 1 − qX + qX² − X³ = −X³(1 − q/X + q/X² − 1/X³), so w = −1 and Den^−(1,L) = 0.
- If w^ε(L) = +1, Den^ε(1,L) need not vanish (e.g. L self-dual).

**Direct prerequisites.** [Normalized local Siegel series of quadratic lattices](#orthogonal-siegel-series).

**Source.** Chao Li and Wei Zhang, *On the arithmetic Siegel–Weil formula for GSpin Shimura varieties*, Theorem 3.4.6 and Corollary 3.4.7, p.17; Theorem 3.5.5, p.19: States Ikeda's functional equations for Den^ε and Den^{♭ε} and the derivative formula when w^ε(L) = −1.

<a id="orthogonal-induction-formula"></a>

### Induction formula for the orthogonal Siegel series

*Theorem* `orthogonal-induction-formula`

Let L^♭ be an integral quadratic lattice of rank n − 1 with last fundamental invariant a_{n−1}, x ⊥ L^♭ with val(x) > a_{n−1}, L = L^♭ ⊥ ⟨x⟩ and L̃ = L^♭ ⊥ ⟨ϖ^{−1}x⟩. With A = Den^ε(X,L), B = Den^ε(X,L̃), D = Den^{♭ε}(X,L^♭) and c = εχ(L^♭): A(X) = X²B(X) + (1 − X²)D(X)/(1 − cX). If w^ε(L) = −1, then ∂Den^ε(L) − ∂Den^ε(L̃) = 2D(1) when c = 0, D(1) when c = −1, and −2D′(1) when c = +1 (in which case D(1) = 0).

**Hypotheses and conventions.**

- Odd residue characteristic; L^♭ integral and nondegenerate.

**Proof outline.**

1. Partition the overlattices of L in the weighted sum of orthogonal-siegel-series by their intersection with L^♭_F and compare with those of L̃ (Li–Zhang Theorem 3.6.1, generalizing Katsurada's induction).
2. Differentiate at X = 1 using A(1) = B(1) = 0; the three cases come from the factor (1 − X²)/(1 − cX).
3. The printed Corollary 3.6.2 omits the derivative term when c = +1; the corrected statement is the one above (recorded as GN/E301).

**Checks.**

- For c = 0: (1 − X²) has derivative −2 at X = 1, giving 2D(1).
- For c = −1: (1 − X²)/(1 + X) = 1 − X, giving D(1).
- For c = +1: (1 − X²)/(1 − X) = 1 + X and D(1) = 0, giving −2D′(1); the printed formula's D(1)-term is 0 here and misses this.

**Direct prerequisites.** [Normalized local Siegel series of quadratic lattices](#orthogonal-siegel-series); [Functional equations of the orthogonal Siegel series (Ikeda)](#ikeda-functional-equation).

**Source.** Chao Li and Wei Zhang, *On the arithmetic Siegel–Weil formula for GSpin Shimura varieties*, §3.6, Theorem 3.6.1 and Corollary 3.6.2, p.20: Proves the induction formula and states the derivative difference; the c = +1 case of the corollary needs the correction above.

<a id="horizontal-lattice"></a>

### Co-isotropic and horizontal lattices

*Definition* `horizontal-lattice`

Let V^ε_m be the quadratic space of dimension m = n + 1 attached to ε and L^♭ ⊆ V^ε_m an O_F-lattice of rank n − 1. L^♭ is co-isotropic if the orthogonal complement (L^♭_F)^⊥ is isotropic, equivalently χ(L^♭) = ε; otherwise co-anisotropic. L^♭ is horizontal if it is integral and either t(L^♭) ≤ 1, or t(L^♭) = 2 and ε·sgn_{n−1}(L^♭) = +1. Hor^ε(L^♭) is the set of horizontal M^♭ ⊇ L^♭ in L^♭_F.

**Hypotheses and conventions.**

- Odd residue characteristic; rank n − 1 lattices in an n + 1-dimensional space.

**Proof outline.**

1. Define the predicates from the invariants χ, t and sgn of the reduction.
2. Corollary 3.8.3 of Li–Zhang: for co-isotropic L^♭, Den^{♭ε}(1,L^♭) = 0 and Hor^ε(L^♭) = ∅; for co-anisotropic L^♭ the derivative difference of orthogonal-induction-formula is a weighted count of Hor^ε(L^♭), with weights q^{⌊val(M^♭)/2⌋}·(1, 1 + q^{−1}, 2(1 + q^{−1})) by type 0, 1, 2 when χ(L^♭) ≠ 0, and 2q^{⌊val(M^♭)/2⌋}·(1, 2) by type 1, 2 when χ(L^♭) = 0 (then L^♭_F has no self-dual lattice).
3. Lemma 3.8.4: a lattice embedding in both V^ε_m and H^ε_m with M^♭ = M^♭_F ∩ H^ε_m is horizontal.

**Uses.** LiZhangGSpin §3.8 and §9: horizontal lattices index the horizontal part of the special cycles; their weighted count is the derivative difference; GN.3 orthogonal-valuation-reduction: the induction on val(L^♭).

**API.**

- `IsCoIsotropic` (data): χ(L^♭) = ε.
- `IsHorizontal` (data): Integral and t ≤ 1, or t = 2 with ε·sgn = +1.
- `horizontalOverlattices` (data): Hor^ε(L^♭), a finite set.
- `derivative_difference_eq_horizontal_count` (characterisation): For co-anisotropic L^♭ the derivative difference equals the weighted count of Hor^ε(L^♭).
- `horizontalOverlattices_coIsotropic` (simp): Hor^ε(L^♭) = ∅ for co-isotropic L^♭.

**Unit tests.**

- `isHorizontal_selfDual` (computation): A self-dual L^♭ is horizontal.
- `not_isHorizontal_type_three` (non-example): A lattice of type 3 is not horizontal.
- `horizontalOverlattices_coIsotropic_empty` (degenerate): For co-isotropic L^♭, Hor^ε(L^♭) is empty.
- `isHorizontal_type_two_sign` (characterisation): For t(L^♭) = 2, L^♭ is horizontal for ε iff ε·sgn_{n−1}(L^♭) = +1.

**Checks.**

- A self-dual L^♭ (t = 0) is horizontal.
- A lattice of type 3 is never horizontal.
- A type-2 lattice is horizontal for exactly one of the two signs ε.

**Direct prerequisites.** [Normalized local Siegel series of quadratic lattices](#orthogonal-siegel-series); [Induction formula for the orthogonal Siegel series](#orthogonal-induction-formula).

**Source.** Chao Li and Wei Zhang, *On the arithmetic Siegel–Weil formula for GSpin Shimura varieties*, §3.8, Definitions 3.8.1–3.8.2, Corollary 3.8.3 and Lemma 3.8.4, pp.21–23: Defines co-isotropic and horizontal lattices, computes the derivative difference as a weighted count of horizontal overlattices, and shows the horizontal criterion for lattices in both spaces.

<a id="orthogonal-valuation-reduction"></a>

### Reducing the valuation of L^♭

*Lemma* `orthogonal-valuation-reduction`

Let L^♭ be an integral quadratic lattice of rank n − 1 with fundamental invariants (a_1,…,a_{n−1}) and x ∈ Ω(L^♭) (the vectors with L^♭ + ⟨x⟩ nondegenerate of rank n). (i) If x ∉ L^♭ ⊥ W^{≥a_{n−1}}, then L^♭ + ⟨x⟩ = L′^♭ + ⟨x′⟩ for some L′^♭ of rank n − 1 with val(L′^♭) < val(L^♭). (ii) If x ∈ L^♭ ⊥ W^{=a_{n−1}} and L^♭ is co-isotropic, then L^♭ + ⟨x⟩ = L′^♭ + ⟨x′⟩ with L′^♭ co-anisotropic and val(L′^♭) = val(L^♭).

**Hypotheses and conventions.**

- Odd residue characteristic; W^{≥a} denotes the vectors of the orthogonal complement of valuation ≥ a.

**Proof outline.**

1. Smith normal form of the fundamental (moment) matrix of L^♭ + ⟨x⟩: the minimal valuation of (n−1)-minors drops when x leaves the stated set.
2. Choose L′^♭ spanned by a basis realizing the smaller invariants; for (ii) adjust within the isotropic complement.

**Checks.**

- n − 1 = 1: L^♭ = ⟨ϖ^a⟩ and x of valuation < a: the new rank-one sublattice has smaller valuation.
- If x ∈ L^♭ (degenerate), x ∉ Ω(L^♭) and the lemma does not apply.
- The hermitian analogue is hermitian-lattice-extension-lemmas (Li–Zhang Lemma 8.2.2).

**Direct prerequisites.** [Co-isotropic and horizontal lattices](#horizontal-lattice).

**Source.** Chao Li and Wei Zhang, *On the arithmetic Siegel–Weil formula for GSpin Shimura varieties*, Lemma 9.3.1 and proof, pp.65–66: Proves the two reductions by the Smith normal form of the fundamental matrix.

<a id="full-type-weighted-identities"></a>

### Weighted counting identities for full-type lattices

*Theorem* `full-type-weighted-identities`

Let L be a quadratic O_F-lattice of rank t and full type t > 1 (t(L) = t, i.e. every fundamental invariant is positive), and μ_+(L) = #(ϖL^∨)°°/L, μ_0(L) = #((ϖL^∨)° ∖ (ϖL^∨)°°)/L, μ_−(L) = #((L^∨)° ∖ (ϖL^∨)°)/L, where X° = {x : val(x) ≥ 0} and X°° = {x : val(x) > 0}; μ_{0,s} refines μ_0 by the sign s of χ(⟨x⟩_F) (χ(L) = 0) or of χ(⟨x⟩^⊥_F) (χ(L) ≠ 0). Then μ_+ + μ_0 + μ_− = q^{t−1}μ_+ for the relative counts μ_?(L,M) = μ_?(L) − [M:L]μ_?(M) over L ⊆ M ⊆ ϖ^{−1}L (Li–Zhang Lemma 8.2.3), and, for t odd, (1 − q^{t−1})μ_+ + (1 − sq^{(t−1)/2})μ_{0,+} + (1 + sq^{(t−1)/2})μ_{0,−} + μ_− = 0 when χ(L) = 0 (s = ±1) or χ(L) ≠ 0 and s = +1; for t even, (1 − sq^{t/2})(1 + sq^{t/2−1})μ_+ + (1 + sq^{t/2−1})μ_0 + μ_− = 0 when χ(L) = 0 (s = ±1) or χ(L) = s. The helper existence statements of Lemmas 8.2.4 and 8.2.6 are used only under the additional hypothesis a_t ≥ 3.

**Hypotheses and conventions.**

- Odd residue characteristic; full type t > 1.
- The unrestricted existence claims of Lemmas 8.2.4/8.2.6 are false in general (paper erratum E10, failures for diag(3,3,9), diag(3,3), diag(9,9) over Z_3).

**Proof outline.**

1. Lemma 8.2.3 by counting vectors of each valuation class modulo L.
2. Propositions 8.2.5 and 8.2.7 by induction on val(L) from the maximal (type-t self-dual-up-to-scaling) lattices, using an index-q overlattice M with the stated relative identity; the induction step uses the helper lemmas, available when a_t ≥ 3, and the base cases directly.
3. The full induction in the cases excluded by E10 is a recorded gap of this node.

**Checks.**

- Base cases (Li–Zhang Propositions 8.2.5 and 8.2.7): a vertex lattice of type t (val(L) = t) has μ_+ = 1 and μ_0 = 0; for t even and invariants (1,…,1,2), μ_+ = 1, μ_0 = q − 1 and μ_− = q^{t−1} − q (the source prints q^t − q, E311), and the identity reads (1 − qa)(1 + a) + (1 + a)(q − 1) + q^{t−1} − q = 0 with a = sq^{t/2−1}.
- For t = 2, χ(L) = 0 and s = ±1 both identities hold, checked by brute force over Z_3.
- The relative identity holds for every L ⊆ M ⊆ ϖ^{−1}L, but the existence of an M with μ_{0,+}(L,M) = μ_{0,−}(L,M) fails for diag(3,3,9) over Z_3.

**Direct prerequisites.** [Normalized local Siegel series of quadratic lattices](#orthogonal-siegel-series); [Isometries and isotropic subspaces of finite quadratic spaces](#orthogonal-isometry-count).

**Source.** Chao Li and Wei Zhang, *On the arithmetic Siegel–Weil formula for GSpin Shimura varieties*, §8.2, Definitions 8.2.1–8.2.2, Lemmas 8.2.3–8.2.6, Propositions 8.2.5 and 8.2.7, pp.54–60: Defines the μ-invariants and proves the weighted identities by induction; the existence parts of Lemmas 8.2.4 and 8.2.6 need a_t ≥ 3 (erratum E10).

<a id="siegel-main-theorem"></a>

### Siegel's main theorem for positive definite forms

*Theorem* `siegel-main-theorem` — planet: **Siegel's main theorem**

Let L be a positive definite integral Z-lattice of rank n ≥ 5 whose bilinear form B is even, so that Q(x) = B(x,x)/2 is integral. For an integer m ≥ 1 write r_gen,Q(L,m) for the coefficient of exp(2πiτm) in the genus theta average of genus-theta-average, that is r_gen(L, 2m) in its exp(πiτ·) indexing: the mass-weighted average over the classes L_j of the genus of #{x ∈ L_j : Q(x) = m}. Then r_gen,Q(L,m) = β_∞(L,m)·∏_p β(L ⊗ Z_p, m), where β(L ⊗ Z_p, m) are the local representation densities of Q from quadratic-local-density and β_∞(L,m) = (π^{n/2}/Γ(n/2)) m^{n/2−1} det(A)^{−1/2}, with A the Gram matrix of B divided by 2 (so that Q(x) = xᵀAx), is the archimedean density. The Euler product converges absolutely. Equivalently, the genus theta average is the Eisenstein part of Θ_L.

**Hypotheses and conventions.**

- n ≥ 5 (absolute convergence of the Euler product and of the Eisenstein series); positive definite.
- The left side is the mass-weighted genus average, not the representation number of L itself.
- Indexing: definite-lattice-theta-series and genus-theta-average count B(x,x) = 2Q(x) at exp(πiτ·), so the coefficient of exp(2πiτm) counts Q(x) = m, as in Hanke's Θ_Q(z) = Σ_x e^{2πiQ(x)z}.

**Proof outline.**

1. Proved by Siegel (1935) through the circle method and, in the representation-theoretic form, by Weil's Siegel–Weil formula; here the route is rank-one-siegel-weil applied to the characteristic function of the adelic closure of L, unfolded over the finite class set (adelic-mass-identity of the parent packet).
2. The Fourier coefficient of the Eisenstein distribution at m is the product of the local fibre integrals, which are the densities β_p and β_∞.
3. Absolute convergence: for p ∤ 2m det L the lattice L ⊗ Z_p is unimodular, so odd-prime-density-formula gives β_p = μ^good_p(m,1), the normalized number of solutions of Q(x) = m over F_p, and the Gauss-sum counts behind finite-orthogonal-group-order make it 1 + O(p^{1−n/2}) = 1 + O(p^{−3/2}) for n ≥ 5. The O(1/p) of density-good-prime-bounds (1) alone would not give absolute convergence.

**Checks.**

- For Q = x² + y² + z² + w² + t² (n = 5, one class) the formula gives r_{Z^5}(m) exactly.
- For the sum of four squares (n = 4, outside the hypothesis) Jacobi's formula r(m) = 8Σ_{4∤d|m} d agrees with the product of local densities computed in Hanke's §2.7.
- For a two-class genus in rank ≥ 5 the identity holds for the weighted average and generally fails for each class separately.

**Direct prerequisites.** [Mass-weighted genus average of theta series](#genus-theta-average); [Local representation densities of quadratic lattices](#quadratic-local-density); [Closed formulas for densities at odd primes](#odd-prime-density-formula); [Orders of finite orthogonal groups](#finite-orthogonal-group-order); [Siegel–Weil formula for quadratic spaces of dimension > 4](#rank-one-siegel-weil); base packet `GN.3/adelic-mass-identity`.

**Source.** Jonathan Hanke, *Quadratic forms and automorphic forms (notes from the 2009 Arizona Winter School)*, Theorem 2.5.1 with (2.5)–(2.7), p.33, and §2.7, pp.35–39: States Siegel's theorem for positive definite forms in n ≥ 5 variables: the Eisenstein part is the mass-weighted genus average and its coefficients are products of local densities; §2.7 works the sum of four squares. Davesh Maulik, Ananth N. Shankar and Yunqing Tang, *Picard ranks of K3 surfaces over function fields and the Hecke orbit conjecture*, Theorem 7.15 (accepted version, 25 December 2021): Applies the formula to the auxiliary lattices with explicit L-values; see mst-auxiliary-mass-formula.

<a id="mst-auxiliary-mass-formula"></a>

### Siegel's formula for the Maulik–Shankar–Tang auxiliary lattices

*Application* `mst-auxiliary-mass-formula`

Let L′_1 be the positive definite auxiliary lattice of rank b + 2 of Maulik–Shankar–Tang, maximal away from p, and L′ ⊆ L′_1 with the same Z_ℓ-localizations for ℓ ≠ p; put d′ = |L′^∨/L′|, Δ_1 = det L′_1 and C_b(m) the archimedean factor. For even b, with χ′ = χ_{(−1)^{1+b/2}4Δ_1}, the genus representation number is q_{L′}(m) = C_b(m)σ_{−b/2}(m,χ′)/(√d′ L(1 + b/2, χ′))·∏_{ℓ|2Δ_1}δ(ℓ,L′,m). For odd b, writing m = m_0 f² with (f, 2Δ_1) = 1 and v_ℓ(m_0) ∈ {0,1} for ℓ ∤ 2Δ_1, and D′ = (−1)^{(b−1)/2}2m_0Δ_1: q_{L′}(m) = C_b(m)L((b+1)/2, χ_{D′})/(√d′ ζ(b+1))·[Σ_{a|f}μ(a)χ_{D′}(a)a^{−(b+1)/2}σ_{−b}(f/a)]·∏_{ℓ|2Δ_1}δ(ℓ,L′,m)/(1 − ℓ^{−1−b}).

**Hypotheses and conventions.**

- b ≥ 3 (rank ≥ 5); the character D′ is used in both the L-value and the divisor sum.

**Proof outline.**

1. Apply siegel-main-theorem and evaluate the good-prime densities by odd-prime-density-formula: for ℓ ∤ 2Δ_1 they are Euler factors of the displayed divisor sums and L-values.
2. Collect the factors at ℓ | 2Δ_1 as the remaining densities δ(ℓ,L′,m).

**Checks.**

- For even b and m = 1 the divisor sum is 1 and q_{L′}(1) = C_b(1)/(√d′L(1 + b/2,χ′))·∏_{ℓ|2Δ_1}δ(ℓ,L′,1).
- χ_{D} and χ_{D′} agree on the divisors of f allowed in the sum, so the printed χ_D is not an error.
- Comparing with the same formula for L (Theorem 7.4) term by term gives MST Lemma 7.16.

**Direct prerequisites.** [Siegel's main theorem for positive definite forms](#siegel-main-theorem); [Closed formulas for densities at odd primes](#odd-prime-density-formula).

**Source.** Davesh Maulik, Ananth N. Shankar and Yunqing Tang, *Picard ranks of K3 surfaces over function fields and the Hecke orbit conjecture*, Theorem 7.15 (accepted version of 25 December 2021): States the Siegel mass formula for the auxiliary lattices in the two parities, with the local densities at primes dividing 2Δ_1.

## 3D. Hermitian local densities

The base packet defines hermitian representation counts, the local density, the normalized Siegel polynomial, the Cho–Yamauchi formula and the functional equation for an unramified quadratic extension. This section supplies the representation scheme and the stabilization, primitive and saturation steps those nodes rest on, the derivative and special values, Terstiege's induction, almost self-dual targets, the split case, Hironaka's analytic proof of the functional equation, and the ramified densities with He–Li–Shi–Yang's primitive derivative formula.

<a id="hermitian-representation-scheme"></a>

### The hermitian representation scheme and its primitive open

*Construction* `hermitian-representation-scheme`

For hermitian O_F-lattices L (rank n) and M (rank m), Rep_{M,L} is the O_{F_0}-scheme with Rep_{M,L}(S) = {O_F ⊗ S-linear φ : L ⊗ S → M ⊗ S preserving the hermitian forms} for O_{F_0}-algebras S. In bases it is cut out of affine space of dimension 2mn over O_{F_0} by the n² real equations of XᴴGX = B. Its primitive open Rep^prim_{M,L} is the locus where some n × n minor of X is a unit. If the generic fibre is nonempty then n ≤ m and it is smooth of dimension n(2m − n). Points over O_{F_0}/ϖ^N are counted by the parent node hermitian-representation-count applied to the reductions of the Gram matrices.

**Hypotheses and conventions.**

- F/F_0 an unramified quadratic extension of nonarchimedean local fields of characteristic ≠ 2, q = #k_{F_0} (residue characteristic 2 allowed for the analytic statements).
- Hermitian lattices are integral hermitian O_F-lattices of the parent node GN.2 integral-hermitian-lattice; ⟨1⟩^k is the self-dual lattice of rank k.

**Proof outline.**

1. Write the functor in coordinates of O_F ⊗ S ≅ S² (unramified basis), giving polynomial equations in 2mn variables.
2. Generic dimension: over F_0 the scheme is a U_m-torsor quotient U_m/U_{m−n}, of dimension m² − (m − n)² = n(2m − n).
3. Smoothness on the generic fibre: the derivative Y ↦ XᴴGY + YᴴGX is onto the hermitian matrices, since Y = XB^{−1}H/2 maps to H (division by 2 over the characteristic-0 field).
4. The primitive open is defined by the nonvanishing of an n × n minor modulo ϖ.

**Uses.** LiZhangDensity §3.1: the local density is the stabilized normalized point count of this scheme; GN.3 primitive-hermitian-smooth-count: the primitive open is smooth over O_{F_0}; GN.3 hermitian-count-stabilizes: chart description near integral solutions.

**API.**

- `hermitianRepresentationScheme` (data): Rep_{M,L} as an affine O_{F_0}-scheme of finite type.
- `primitiveHermitianRepresentationScheme` (data): The open subscheme defined by a unit n × n minor.
- `hermitianRepresentationScheme_points` (characterisation): Its points over O_{F_0}/ϖ^N are the solutions counted by hermitianRepresentationCount.
- `hermitianRepresentationScheme_basisChange` (functoriality): Integral changes of basis of L and M induce isomorphisms.
- `hermitianRepresentationScheme_genericDim` (characterisation): A nonempty generic fibre is smooth of dimension n(2m − n).

**Unit tests.**

- `hermitianRepresentationScheme_rankZero` (degenerate): For n = 0 the scheme is Spec O_{F_0} and the primitive open is everything.
- `primitive_excludes_zero` (non-example): For a rank-one source with zero Gram matrix, the zero map is a point of Rep but not of the primitive open.
- `primitive_count_F4` (computation): Over F_4/F_2 with unit rank-one Gram matrices there are exactly 3 primitive points.
- `genericDim_one_one` (compatibility): For m = n = 1 the generic dimension is 1, matching the exponent N in normalizedHermitianCount (parent node).

**Checks.**

- Rank-zero source: the terminal scheme, with one primitive point at every level.
- A rank-one zero Gram source has the zero representation, which lies outside the primitive open.
- Over F_4/F_2 the rank-one unit Gram matrices have three primitive points (the norm-one elements).

**Direct prerequisites.** base packet `GN.3/hermitian-representation-count`; base packet `GN.2/integral-hermitian-lattice`; `Matrix.conjTranspose` (Mathlib).

**Source.** Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, §3.1, pp.15–16 (arXiv:1908.01701v3): Defines Rep_{M,L} by hermitian homomorphisms, the density through its O_{F_0}/ϖ^N points and the generic dimension n(2m − n) (3.1.0.2).

<a id="hermitian-count-stabilizes"></a>

### Stabilization of hermitian representation counts

*Theorem* `hermitian-count-stabilizes`

For integral nondegenerate hermitian lattices L, M of ranks n ≤ m over an unramified F/F_0 with nonempty generic representation fibre, there is N_0 such that #Rep_{M,L}(O_{F_0}/ϖ^{N+1}) = q^{n(2m−n)}#Rep_{M,L}(O_{F_0}/ϖ^N) for all N ≥ N_0. Consequently the normalized counts of the parent node normalized-hermitian-count are eventually constant, and their eventual value is the density of the parent node hermitian-local-density.

**Hypotheses and conventions.**

- F/F_0 an unramified quadratic extension of nonarchimedean local fields of characteristic ≠ 2, q = #k_{F_0} (residue characteristic 2 allowed for the analytic statements).
- Hermitian lattices are integral hermitian O_F-lattices of the parent node GN.2 integral-hermitian-lattice; ⟨1⟩^k is the self-dual lattice of rank k.

**Proof outline.**

1. The set of exact integral solutions is compact.
2. At every exact solution the Jacobian of the Gram map has a right inverse with denominators bounded in terms of v(2) and v(det B); a multivariate quadratic Hensel lemma gives finitely many residue charts on which the map is a submersion after fixed scalings.
3. Each chart contributes exactly q^{n(2m−n)} more points per level; compactness shows that all sufficiently accurate approximate solutions lie in the charts.
4. The empty-generic case is the parent node empty-generic-density-zero.

**Checks.**

- m = n = 1, M = L = ⟨1⟩: the counts are q + 1 at every level N ≥ 1 multiplied by q^{N−1}, so the normalized count is (q+1)/q from N = 1.
- For n = 0 the count is 1 at every level.
- Generic smoothness alone does not give the count identity at small N: for M = ⟨1⟩, L = ⟨ϖ²⟩ the normalized counts at N = 1, 2, 3 are not all equal.

**Direct prerequisites.** [The hermitian representation scheme and its primitive open](#hermitian-representation-scheme); base packet `GN.3/normalized-hermitian-count`; base packet `GN.3/empty-generic-density-zero`.

**Source.** Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, §3.1, p.15: Defines the density as a limit and records the generic dimension; stabilization is the input that makes the limit an eventual value. Sungmun Cho and Takuya Yamauchi, *A reformulation of the Siegel series and intersection numbers*, §3.1, pp.11–13, with Corollary 3.5 and Proposition 3.7, (3.2), p.13 (arXiv:1805.01666v2): Defines the local and primitive densities by integration over the representation scheme (§3.1), characterizes when a primitive isometry exists (Corollary 3.5) and decomposes the density over integral overlattices (Proposition 3.7); this node adapts the lattice-coordinate argument to the hermitian functor and to the stabilization of counts.

<a id="primitive-hermitian-smooth-count"></a>

### Primitive representations into a self-dual lattice

*Theorem* `primitive-hermitian-smooth-count`

For the self-dual target I_m = ⟨1⟩^m and an integral hermitian lattice L of rank n ≤ m over an unramified F/F_0 (residue characteristic 2 included), the primitive representation scheme Rep^prim_{I_m,L} is smooth over O_{F_0} of relative dimension d = n(2m − n). Hence #Rep^prim(O_{F_0}/ϖ^N) = q^{(N−1)d}·#Emb(L ⊗ k, I_m ⊗ k), and the primitive density Den_prim(I_m, L) equals q^{−d} times the finite-field embedding count of the parent node hermitian-embedding-count.

**Hypotheses and conventions.**

- F/F_0 an unramified quadratic extension of nonarchimedean local fields of characteristic ≠ 2, q = #k_{F_0} (residue characteristic 2 allowed for the analytic statements).
- Hermitian lattices are integral hermitian O_F-lattices of the parent node GN.2 integral-hermitian-lattice; ⟨1⟩^k is the self-dual lattice of rank k.

**Proof outline.**

1. On the special fibre, injectivity of X and nondegeneracy of the target make Y ↦ XᴴY onto all n × n matrices.
2. A ↦ A + Aᴴ is onto the hermitian matrices over k_F, the diagonal being supplied by the surjective trace k_F → k_{F_0} of the unramified extension (this replaces division by 2 and works at p = 2).
3. Lift the surjectivity over O_{F_0} and apply the Jacobian criterion; smoothness gives the point count by Hensel.

**Checks.**

- n = 0: one point at every level.
- m = n = 1 over F_4/F_2: 3 primitive points at level one.
- Over a ramified extension the trace map on residue fields is zero, so this argument fails; the ramified case needs ramified-primitive-density.

**Direct prerequisites.** [The hermitian representation scheme and its primitive open](#hermitian-representation-scheme); base packet `GN.3/hermitian-embedding-count`; base packet `GN.3/finite-hermitian-isometry-formula`.

**Source.** Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, Proof of Theorem 3.5.1, pp.17–18: Computes the primitive local density by the finite-field isometry count. Sungmun Cho and Takuya Yamauchi, *A reformulation of the Siegel series and intersection numbers*, Theorem 3.9, Lemma 3.10, Corollary 3.11 and Theorem 3.12, p.15 (arXiv:1805.01666v2): In the quadratic case: the morphism defining primitive representations is smooth (Theorem 3.9, through Lemma 3.10 and Gan–Yu Lemmas 5.5.1–5.5.2), the primitive scheme is open and smooth over o (Corollary 3.11), and the primitive density is f^{−dim} times the residual primitive isometry count (Theorem 3.12).

<a id="hermitian-saturation-density-sum"></a>

### Saturation decomposition of hermitian densities

*Theorem* `hermitian-saturation-density-sum`

For the self-dual target I_m and an integral hermitian lattice L of rank n ≤ m over an unramified F/F_0: every representation of L extends uniquely to a primitive representation of its saturation L′, an integral overlattice L ⊆ L′ ⊆ L′^∨, and Den(I_m, L) = Σ_{L ⊆ L′ ⊆ L′^∨} q^{−2(m−n)ℓ(L′/L)}Den_prim(I_m, L′), where ℓ is the O_F-length. The sum is finite because L′ ⊆ L^∨.

**Hypotheses and conventions.**

- F/F_0 an unramified quadratic extension of nonarchimedean local fields of characteristic ≠ 2, q = #k_{F_0} (residue characteristic 2 allowed for the analytic statements).
- Hermitian lattices are integral hermitian O_F-lattices of the parent node GN.2 integral-hermitian-lattice; ⟨1⟩^k is the self-dual lattice of rank k.

**Proof outline.**

1. Saturation: the image of L under φ is contained in a unique primitive sublattice of rank n; its preimage is L′ and φ is primitive on L′.
2. Change of variables: on Hom coordinates passing from L to L′ multiplies volume by q^{−2mℓ}, on hermitian-form coordinates by q^{2nℓ}.
3. Interchange the finite sum with the stabilized counts (hermitian-count-stabilizes).

**Checks.**

- For L self-dual, only L′ = L occurs.
- For L = ⟨ϖ^a⟩ of rank one, the overlattices are ⟨ϖ^{a−2j}⟩ for 0 ≤ 2j ≤ a.
- Combining with primitive-hermitian-smooth-count gives the Cho–Yamauchi formula of the parent node.

**Direct prerequisites.** [Primitive representations into a self-dual lattice](#primitive-hermitian-smooth-count); [Stabilization of hermitian representation counts](#hermitian-count-stabilizes); base packet `GN.2/hermitian-dual-lattice`.

**Source.** Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, Theorem 3.5.1 and proof, pp.17–18: Proves the Cho–Yamauchi formula by this decomposition (referring to Cho–Yamauchi Corollary 3.11 and to Gan–Yu §9 at p = 2).

<a id="hermitian-cancellation-law"></a>

### Cancellation law for hermitian densities

*Theorem* `hermitian-cancellation-law`

For a self-dual hermitian lattice M of rank m and an integral hermitian lattice L^♭ of rank n over an unramified F/F_0: Den(⟨1⟩^{n+m+k}, L^♭ ⊕ M) = Den(⟨1⟩^{n+m+k}, M)·Den(⟨1⟩^{n+k}, L^♭) and Den(⟨1⟩^{n+m+k}, ⟨1⟩^{n+m}) = Den(⟨1⟩^{n+m+k}, M)·Den(⟨1⟩^{n+k}, ⟨1⟩^n) for all k ≥ 0, hence the normalized Siegel polynomials agree: D_{L^♭ ⊕ M}(X) = D_{L^♭}(X). The unnormalized equality Den(⟨1⟩^{n+m+k}, L^♭ ⊕ M) = Den(⟨1⟩^{n+k}, L^♭) stated before Li–Zhang (3.2.1.1) is false (GN/E312).

**Hypotheses and conventions.**

- F/F_0 an unramified quadratic extension of nonarchimedean local fields of characteristic ≠ 2, q = #k_{F_0} (residue characteristic 2 allowed for the analytic statements).
- Hermitian lattices are integral hermitian O_F-lattices of the parent node GN.2 integral-hermitian-lattice; ⟨1⟩^k is the self-dual lattice of rank k.

**Proof outline.**

1. Representations of M into a self-dual target split off: the orthogonal complement of the image of M is self-dual of rank n + k, so restriction to M has fibres of constant size, the representations of L^♭ into that complement, and the counts multiply (the argument of Li–Zhang Lemma 9.1.1 with a self-dual line); the factor Den(⟨1⟩^{n+m+k}, M) cancels against the same factor of the self-dual normalization.
2. Alternatively, the overlattices of L^♭ ⊕ M are L′ ⊕ M (M self-dual), with the same type and length, so the Cho–Yamauchi sums agree.

**Checks.**

- L^♭ = 0: D_M(X) = 1 for every self-dual M.
- L^♭ = ⟨ϖ⟩: D_{⟨ϖ⟩ ⊕ ⟨1⟩}(X) = 1 − X.
- The cancellation fails for a non-self-dual M: D_{⟨ϖ⟩⊕⟨ϖ⟩}(X) ≠ D_{⟨ϖ⟩}(X).
- n = 0, M = ⟨1⟩, k = 0: Den(⟨1⟩, ⟨1⟩) = 1 + q^{−1} while Den(⟨1⟩^0, 0) = 1, so the densities themselves do not cancel; only the normalized series do.

**Direct prerequisites.** base packet `GN.3/cho-yamauchi-overlattice-formula`; base packet `GN.3/normalized-siegel-polynomial`.

**Source.** Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, §3.2, (3.2.1.1), p.16: States the cancellation law (3.2.1.1) for the normalized Siegel series; the sentence before it states the equality of the unnormalized densities without the factor Den(⟨1⟩^{n+m+k}, M) (E312).

<a id="hermitian-central-derivative"></a>

### Central derivative of the hermitian Siegel series

*Definition* `hermitian-central-derivative`

For an integral nondegenerate hermitian lattice L over an unramified F/F_0 with normalized Siegel polynomial D_L(X) (parent node normalized-siegel-polynomial), put Den(L) = D_L(1) and, when val(L) is odd (so that D_L(1) = 0 by the functional equation), ∂Den(L) = −(d/dX)D_L(X)|_{X=1}. Then ∂Den(L) = Σ_{L ⊆ L′ ⊆ L′^∨} m(t(L′)) with m(a) = ∏_{i=1}^{a−1}(1 − (−q)^i) for a ≥ 1 and m(0) = 0, every L′ in the sum having t(L′) > 0 and val(L′) ≡ val(L) mod 2. For rank one, D_L(X) = Σ_{i=0}^{val L}(−X)^i, and ∂Den(L) = (val(L) + 1)/2 for odd val(L).

**Hypotheses and conventions.**

- F/F_0 an unramified quadratic extension of nonarchimedean local fields of characteristic ≠ 2, q = #k_{F_0} (residue characteristic 2 allowed for the analytic statements).
- Hermitian lattices are integral hermitian O_F-lattices of the parent node GN.2 integral-hermitian-lattice; ⟨1⟩^k is the self-dual lattice of rank k.
- ∂Den is defined only for odd val(L).

**Proof outline.**

1. Differentiate the Cho–Yamauchi formula of the parent node at X = 1: the factor X^{2ℓ} contributes nothing because m(t;1) = 0 for t ≥ 1, and m(0;X) = 1 is constant.
2. If val(L) is odd, every integral overlattice has odd valuation and hence positive type.
3. Rank one: the overlattices of ⟨ϖ^a⟩ are ⟨ϖ^{a−2j}⟩, of type 1 when a − 2j > 0, giving (a + 1)/2.

**Uses.** LiZhangDensity Theorem 1.2.1: ∂Den(L) is the analytic side of the Kudla–Rapoport conjecture; HLSY2023 Theorem 1.6: the ramified analogue ∂Pden; GN.3 hermitian-special-values: values of D_L at other points.

**API.**

- `hermitianCentralDerivative` (data): ∂Den(L) ∈ Z for odd val(L).
- `hermitianCentralDerivative_eq_sum` (characterisation): ∂Den(L) = Σ_{L ⊆ L′ ⊆ L′^∨} m(t(L′)).
- `hermitianCentralDerivative_rankOne` (simp): For rank one and odd val, ∂Den = (val + 1)/2.
- `hermitianCentralDerivative_cancel` (relation): ∂Den(L ⊕ M) = ∂Den(L) for M self-dual.
- `hermitianDensityAtOne` (data): Den(L) = D_L(1).

**Unit tests.**

- `hermitianCentralDerivative_pi` (computation): ∂Den(⟨ϖ⟩) = 1.
- `hermitianCentralDerivative_pi_cubed` (computation): ∂Den(⟨ϖ³⟩) = 2.
- `hermitianDensityAtOne_selfDual` (degenerate): Den(L) = 1 for L self-dual.
- `hermitianCentralDerivative_not_q` (non-example): With the base q in place of −q, the weight m(2) would be 1 − q instead of 1 + q.

**Checks.**

- ⟨ϖ⟩: D = 1 − X, ∂Den = 1.
- ⟨ϖ³⟩: D = 1 − X + X² − X³, ∂Den = 2.
- For val(L) even ∂Den is not defined by this node (D_L(1) need not vanish).

**Direct prerequisites.** base packet `GN.3/normalized-siegel-polynomial`; base packet `GN.3/cho-yamauchi-overlattice-formula`; base packet `GN.3/cho-yamauchi-weight`; base packet `GN.3/siegel-polynomial-functional-equation`.

**Source.** Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, §1.2, pp.3–4, Definition 3.2.1, p.16, Example 3.5.2 and Corollary 3.5.3, p.18: Defines Den(L) and ∂Den(L), computes the rank-one case and proves the weighted lattice count for ∂Den when val(L) is odd (the example prints val(L^♭) for val(L), paper erratum E4).

<a id="hermitian-special-values"></a>

### Special values of the hermitian Siegel series

*Theorem* `hermitian-special-values`

For an integral nondegenerate hermitian lattice L over an unramified F/F_0 and k ≥ 0: D_L((−q)^{−k}) = Σ_{L ⊆ L′ ⊆ L′^∨, t(L′) ≤ k} q^{−2ℓ(L′/L)k}m(t(L′);(−q)^{−k}). In particular Den(L) = D_L(1) is the number of self-dual lattices containing L, and D_L(−q) = Σ_{L ⊆ L′ ⊆ L′^∨}[L′:L]·m(t(L′) + 1) = vol(L)^{−1}D_L((−q)^{−1}). For T = xx^τ and the lattice L = x^τΛ_n with moment matrix T (Λ_n self-dual), Leslie's orbital-integral constant m_0(T) equals Den(L), the number of self-dual lattices L′ with L ⊆ L′ ⊆ L^∨; it vanishes unless T is integral.

**Hypotheses and conventions.**

- F/F_0 an unramified quadratic extension of nonarchimedean local fields of characteristic ≠ 2, q = #k_{F_0} (residue characteristic 2 allowed for the analytic statements).
- Hermitian lattices are integral hermitian O_F-lattices of the parent node GN.2 integral-hermitian-lattice; ⟨1⟩^k is the self-dual lattice of rank k.

**Proof outline.**

1. m(a;(−q)^{−k}) = ∏_{i<a}(1 − (−q)^{i−k}) vanishes when 0 ≤ k ≤ a − 1 (the factor i = k), so only overlattices of type t(L′) ≤ k contribute; substitute into the Cho–Yamauchi formula.
2. At X = 1 only self-dual L′ (type 0) contribute.
3. At X = −q use m(t;−q) = m(t + 1) and the functional equation for the second identity.
4. Leslie: the self-dual lattices containing L are exactly the conjugates in the formula for m_0.

**Checks.**

- For L self-dual, D_L(1) = 1 and D_L(−q) = 1·m(1) = 1.
- For L = ⟨ϖ²⟩, Den(L) = 1 (only ⟨1⟩ is self-dual above it).
- For L = ⟨ϖ⟩ there is no self-dual overlattice and Den(L) = 0.

**Direct prerequisites.** base packet `GN.3/cho-yamauchi-overlattice-formula`; [Central derivative of the hermitian Siegel series](#hermitian-central-derivative); base packet `GN.3/siegel-polynomial-functional-equation`.

**Source.** Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, Corollaries 3.6.1–3.6.2, (3.6.1.1)–(3.6.2.2), pp.18–19: Evaluates the Siegel series at (−q)^{−k}, at 1 (self-dual overlattice count) and at −q. Spencer Leslie, *The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods*, §3.3, p.28, and Remark 3.9, p.29 (arXiv:1911.07907v3): Identifies the constant m_0(T) with Den(L), the number of self-dual overlattices, citing Li–Zhang (3.6.1.1).

<a id="hermitian-induction-formula"></a>

### Induction formula for the hermitian Siegel series (Terstiege)

*Theorem* `hermitian-induction-formula`

Let L^♭ be an integral hermitian lattice of rank n − 1 with fundamental invariants (a_1,…,a_{n−1}), x ⊥ L^♭ with val(x) > a_{n−1}, L = L^♭ + ⟨x⟩ and L′ = L^♭ + ⟨ϖ^{−1}x⟩, over an unramified F/F_0. Then D_L(X) = X²D_{L′}(X) + (1 − X)D_{L^♭}(−qX).

**Hypotheses and conventions.**

- F/F_0 an unramified quadratic extension of nonarchimedean local fields of characteristic ≠ 2, q = #k_{F_0} (residue characteristic 2 allowed for the analytic statements).
- Hermitian lattices are integral hermitian O_F-lattices of the parent node GN.2 integral-hermitian-lattice; ⟨1⟩^k is the self-dual lattice of rank k.

**Proof outline.**

1. Partition the integral overlattices of L in the Cho–Yamauchi sum by whether they contain ϖ^{−1}x; those that do are overlattices of L′ and contribute X²D_{L′}.
2. The others are classified by their intersection with L^♭_F (hermitian-lattice-extension-lemmas) and sum to (1 − X)D_{L^♭}(−qX).

**Checks.**

- n = 1 (L^♭ = 0): Σ_{i=0}^a(−X)^i = X²Σ_{i=0}^{a−2}(−X)^i + (1 − X).
- Evaluated at X = 1 both sides give Den(L) = Den(L′).
- The hypothesis val(x) > a_{n−1} is needed: for val(x) ≤ a_{n−1} the overlattice partition is different.

**Direct prerequisites.** base packet `GN.3/cho-yamauchi-overlattice-formula`; [Lattices with prescribed intersection and invariant drop](#hermitian-lattice-extension-lemmas).

**Source.** Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, Proposition 3.7.1, p.19: States the induction formula, attributed to Terstiege, with Katsurada's orthogonal analogue.

<a id="almost-self-dual-density"></a>

### Densities against almost self-dual lattices

*Theorem* `almost-self-dual-density`

Let Λ = ⟨1⟩^{n−1} ⊕ ⟨ϖ⟩ over an unramified F/F_0, L a hermitian lattice of rank n, ℓ = ⟨u_0⟩ with (u_0,u_0) = ϖ and L^♯ = L ⊕ ℓ. Then for k ≥ 0: (cancellation) Den(⟨1⟩^{n−1+k} ⊕ ⟨ϖ⟩, L) = Den(⟨1⟩^{n+1+k}, L^♯)/Den(⟨1⟩^{n+1+k}, ℓ); and Den(Λ ⊕ ⟨1⟩^k, L)/Den(⟨1⟩^{n−1+k},⟨1⟩^{n−1}) = D_{L^♯}((−q)^{−k}). Thus the Siegel series relative to Λ, Den_Λ(X,L) = D_{L^♯}(X), is a polynomial in Z[X]; if val(L) is even then Den_Λ(1,L) = 0 and ∂Den_Λ(L) = −(d/dX)Den_Λ(X,L)|_{X=1}.

**Hypotheses and conventions.**

- F/F_0 an unramified quadratic extension of nonarchimedean local fields of characteristic ≠ 2, q = #k_{F_0} (residue characteristic 2 allowed for the analytic statements).
- Hermitian lattices are integral hermitian O_F-lattices of the parent node GN.2 integral-hermitian-lattice; ⟨1⟩^k is the self-dual lattice of rank k.

**Proof outline.**

1. Restriction to ℓ: for i ≥ 2 the orthogonal complement in ⟨1⟩^{n+1+k} ⊗ O/ϖ^i of the image of ℓ is isometric to the reduction of ⟨1⟩^{n−1+k} ⊕ ⟨ϖ⟩, so restriction has fibres of constant size.
2. Combine with D_ℓ(X) = 1 − X and the self-dual denominator ∏(1 − (−q)^{−i}X).

**Checks.**

- For n = 1 and L = ⟨1⟩, Den_Λ(X,L) = D_{⟨1⟩⊕⟨ϖ⟩}(X) = 1 − X.
- If val(L) is even, val(L^♯) is odd and Den_Λ(1,L) = 0.
- For L = ⟨ϖ^a⟩ ⊕ ⟨ϖ^b⟩ with a + b even, the value agrees with Sankaran's and Terstiege's formulas (checked symbolically for a ≤ b ≤ 7).

**Direct prerequisites.** base packet `GN.3/normalized-siegel-polynomial`; [Cancellation law for hermitian densities](#hermitian-cancellation-law).

**Source.** Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, Lemma 9.1.1, Theorem 9.1.2, Example 9.1.3 and Definition 9.1.4, pp.60–63: Proves the cancellation for the almost self-dual target, the identification with the Siegel series of L^♯, the rank-two comparison with Sankaran and Terstiege, and defines Den_Λ.

<a id="hermitian-lattice-extension-lemmas"></a>

### Lattices with prescribed intersection and invariant drop

*Lemma* `hermitian-lattice-extension-lemmas`

Let V be a nondegenerate hermitian space of dimension n over an unramified F/F_0 and L^♭ ⊂ V an O_F-lattice of rank n − 1. (1) For a lattice L′^♭ ⊂ L^♭_F, u ↦ L′^♭ + ⟨u⟩ is a bijection from [(V/L′^♭) ∖ (L′^♭_F/L′^♭)]/O_F^× onto the rank-n lattices L′ with L′ ∩ L^♭_F = L′^♭. (2) For V = L^♭_F ⊕ ⟨x⟩_F and a lattice L′, the projections give isomorphisms of cyclic O_F-modules π^♭(L′)/L′^♭ ≅ L′/(L′^♭ ⊕ L′_x) ≅ π_x(L′)/L′_x, and if x ⊥ L^♭ then vol(L′) = vol(L′^♭)vol(π_⊥(L′)). (3) With M(L^♭) = L^♭ ⊕ ⟨u⟩, ⟨u⟩ = {x ⊥ L^♭ : val(x) ≥ a_{n−1}}, and x ∈ V ∖ L^♭_F, the invariants (a′_i) of L^♭ + ⟨x⟩ satisfy a′_1 + … + a′_{n−1} ≥ a_1 + … + a_{n−1} iff x ∈ M(L^♭).

**Hypotheses and conventions.**

- F/F_0 an unramified quadratic extension of nonarchimedean local fields of characteristic ≠ 2, q = #k_{F_0} (residue characteristic 2 allowed for the analytic statements).
- Hermitian lattices are integral hermitian O_F-lattices of the parent node GN.2 integral-hermitian-lattice; ⟨1⟩^k is the self-dual lattice of rank k.

**Proof outline.**

1. (1)–(2): elementary module theory of a lattice and its rank-(n−1) intersection; the volume formula from the block-triangular Gram matrix.
2. (3): the sum a′_1 + … + a′_{n−1} is the minimal valuation of the (n−1)-minors of the moment matrix (Smith normal form; no shift by n − 1 in the unramified case, unlike ramified-lattice-lemmas (1)); compute these minors for x inside and outside M(L^♭) (Li–Zhang Lemma 8.2.2).

**Checks.**

- n = 1: L^♭ = 0, M(L^♭) = ⟨u⟩ is the lattice of vectors of nonnegative valuation, and (1) parametrizes rank-one lattices by their generators up to units.
- If L′^♭ ⊆ L″^♭ then e_max decreases and M(L′^♭) ⊆ M(L″^♭).
- (3) is the hermitian analogue of orthogonal-valuation-reduction.

**Direct prerequisites.** base packet `GN.2/integral-hermitian-lattice`; base packet `GN.2/hermitian-lattice-invariants`.

**Source.** Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, §7.1, (7.1.0.1)–(7.1.0.4), p.43; Lemmas 7.2.1–7.2.2 and (7.2.2.1), p.44; Lemma 8.2.2, pp.58–59: Defines M(L^♭) and e_max, proves the bijection, the projection isomorphisms and volume formula, and the minor criterion for the drop of the first invariants.

<a id="split-hermitian-density"></a>

### Hermitian densities and the Cho–Yamauchi formula in the split case

*Theorem* `split-hermitian-density`

Let F′/F be an unramified quadratic extension or the split algebra F × F, η the associated quadratic character (η(ϖ) = −1 inert, +1 split), and for a split hermitian lattice take L = (L_1, L_2) with the induced perfect pairing. With ℓ′ and t′ the O_{F′}-length and type (ℓ = 2ℓ′, t = 2t′ in the inert case) and m(a;T) = ∏_{i=0}^{a−1}(1 − (η(ϖ)q)^iT): (1) Den(⟨1⟩_{n+j},⟨1⟩_n) = ∏_{i=1}^n(1 − (η(ϖ)q)^{−i}T) at T = (η(ϖ)q)^{−j}; (2) there is a unique Den(T,L) ∈ Z[T] with Den((η(ϖ)q)^{−j},L) = Den(⟨1⟩_{n+j},L)/Den(⟨1⟩_{n+j},⟨1⟩_n) for j ≥ 0; (3) Den(T,L) = Σ_{L ⊆ L′ ⊆ L′^∨} T^{2ℓ′(L′/L)}m(t′(L′);T), so Den(T,L) depends only on the torsion hermitian module L^∨/L; (4) Den(T,L) = (η(ϖ)T)^{ℓ′(L^∨/L)}Den(1/T,L) and deg Den(T,L) = ℓ′(L^∨/L).

**Hypotheses and conventions.**

- F′/F unramified or split; residue characteristic arbitrary in (1)–(3).
- In the torsion-module form the weight is m(t′(Q′^⊥/Q′);T), not m(t′(Q′);T) as printed (paper erratum E4).

**Proof outline.**

1. Inert case: the parent nodes (normalized-siegel-polynomial, cho-yamauchi-overlattice-formula, siegel-polynomial-functional-equation) with −q = η(ϖ)q.
2. Split case: a hermitian lattice is a pair of O_F-lattices in dual position; representation counts become counts of pairs of matrices, and the finite-field isometry count is |GL_n(F_q)|-type, giving the weight with +q.
3. The functional equation in the split case is checked from (3) directly: the overlattice sum is symmetric under L′ ↦ the dual configuration.

**Checks.**

- Inert, rank one, L = ⟨ϖ^a⟩: Den(T,L) = Σ_{i=0}^a(−T)^i.
- Split, rank one, L = (O, ϖ^aO): Den(T,L) = Σ_{i=0}^a T^i.
- L self-dual in either case: Den(T,L) = 1.

**Direct prerequisites.** base packet `GN.3/normalized-siegel-polynomial`; base packet `GN.3/cho-yamauchi-overlattice-formula`; base packet `GN.3/siegel-polynomial-functional-equation`.

**Source.** Tony Feng, Zhiwei Yun and Wei Zhang, *Higher Siegel–Weil formula for unitary groups: the non-singular terms*, §§2.3–2.4, Definition 2.2, Theorem 2.3 and Remarks 2.4–2.6, pp.579–583 (Invent. Math. 236 (2024)): Defines the densities and normalized Siegel series for inert and split F′/F, proves the Cho–Yamauchi formula in both cases, the dependence on L^∨/L and states the functional equation (citing Hironaka in the inert case).

<a id="hironaka-siegel-integral"></a>

### Hermitian Siegel integrals and spherical functions (Hironaka)

*Construction* `hironaka-siegel-integral`

For a nonsingular hermitian T ∈ Herm_n(F) over an unramified F/F_0, the hermitian Siegel integral is b_T(t) = ∫_{Herm_n(F)} ν(R)^{−t}ψ(tr(TR))dR, where ψ is an additive character of F_0 of conductor O_{F_0}, dR gives Herm_n(O_F) volume 1 and ν(R) = q^{Σ e_j} for the negative elementary divisors ϖ^{−e_j} of R; it converges for Re t > 2n and continues to a rational function of q^{−t}. Hironaka's spherical function ω_T(X;s) on X_T = {X ∈ M_{2n,n}(F) : XᴴH_nX = T} (H_n = [[0,I],[I,0]]) is the K-average of ∏_i|f_i(kX)|^{s_i+ε_i} with the relative invariants f_i, with the shifts ε_i of Hironaka §1; it is K-invariant, right U(T)-invariant and rational in q^{s_i}.

**Hypotheses and conventions.**

- F/F_0 an unramified quadratic extension of nonarchimedean local fields of characteristic ≠ 2, q = #k_{F_0} (residue characteristic 2 allowed for the analytic statements).
- Hermitian lattices are integral hermitian O_F-lattices of the parent node GN.2 integral-hermitian-lattice; ⟨1⟩^k is the self-dual lattice of rank k.
- Haar measures normalized by volume 1 on the integral lattices; the conductor of ψ is O_{F_0}.

**Proof outline.**

1. Define b_T as an absolutely convergent integral for Re t > 2n and prove rationality by decomposing Herm_n(F) into K-orbits of elementary divisors.
2. Define ω_T(X;s) as a K-average over the nonvanishing locus, absolutely convergent in the stated domain, and prove the invariances.
3. Relate b_T to ω_T by Fourier inversion on Herm_n(F) (Hironaka Lemma 5.1, Theorem 5.2, Proposition 5.3).

**Uses.** Hironaka2009 Theorem 5.6: the functional equation of the hermitian Siegel series; GN.3 hermitian-siegel-functional-equation-proof: the analytic proof of the parent node's functional equation.

**API.**

- `hermitianSiegelIntegral` (data): b_T(t), defined for Re t > 2n and continued rationally.
- `hermitianSphericalFunction` (data): ω_T(X;s).
- `hermitianSphericalFunction_invariant` (characterisation): K- and right U(T)-invariance.
- `hermitianSiegelIntegral_rational` (characterisation): b_T is a rational function of q^{−t}.
- `hermitianSiegelIntegral_basisChange` (functoriality): b_{gTgᴴ} = b_T for g ∈ GL_n(O_F).

**Unit tests.**

- `hermitianSiegelIntegral_rankZero` (degenerate): For n = 0, b_T = 1.
- `hermitianSiegelIntegral_unit` (computation): For n = 1 and T = 1 the normalized integral g_T equals 1.
- `hermitianSiegelIntegral_conductor` (non-example): With ψ of conductor ϖO_{F_0} and the same measures, b_1 changes.
- `hermitianSiegelIntegral_density` (compatibility): For n = 1, val(T) = 1: g_T(Y) = 1 + qY and D_L(X) = g_T(−q^{−1}X) = 1 − X.

**Checks.**

- n = 0: the matrix spaces are points and b_T = 1.
- n = 1, T = 1: b_T(t) = 1 − q^{−t} = f_1(q^{−t}), so g_T = 1.
- Changing the conductor of ψ without changing the Haar normalization changes b_T.

**Direct prerequisites.** [The hermitian representation scheme and its primitive open](#hermitian-representation-scheme); `MeasureTheory.Measure.haar` (Mathlib).

**Source.** Yumiko Hironaka, *Spherical functions on U(2n)/(U(n)×U(n)) and hermitian Siegel series*, §§1 and 5, equations (1.2), (1.4), (5.1)–(5.3), pp.2–5 and 27–29 (arXiv:0904.4304v3): Defines the spherical functions on U(2n)/(U(n)×U(n)) and the hermitian Siegel series with their normalizations.

<a id="hermitian-siegel-functional-equation-proof"></a>

### Hironaka's functional equation and the density transform

*Theorem* `hermitian-siegel-functional-equation-proof`

With a = val(det T), f_n(Y) = ∏_{i=0}^{n−1}(1 − (−q)^iY) and g_T(q^{−t}) = b_T(t)/f_n(q^{−t}): (1) g_T(Y) = (−1)^{a(n−1)}q^{an}Y^a g_T(q^{−2n}Y^{−1}) (Hironaka Theorem 5.6); (2) for the hermitian lattice L with Gram matrix T, D_L(X) = g_T((−q)^{−n}X). Together these give the parent node's functional equation D_L(X) = (−X)^{val L}D_L(1/X).

**Hypotheses and conventions.**

- F/F_0 an unramified quadratic extension of nonarchimedean local fields of characteristic ≠ 2, q = #k_{F_0} (residue characteristic 2 allowed for the analytic statements).
- Hermitian lattices are integral hermitian O_F-lattices of the parent node GN.2 integral-hermitian-lattice; ⟨1⟩^k is the self-dual lattice of rank k.

**Proof outline.**

1. (1): the spherical functions satisfy ω_T(X;z) = Γ_σ(z)ω_T(X;σz) for the Weyl group W = S_n ⋉ {±1}^n, proved for simple reflections from rank-one hermitian integrals and extended by the cocycle relation; the long element gives t ↦ 2n − t for b_T.
2. (2): finite Fourier orthogonality on Herm_n(O_F/ϖ^N) writes the representation count of T by I_{n+k} as an integral over R of a product of one-row Gaussian integrals ∫_{O_F}ψ(uϖ^{−e}N(x))dx = (−q)^{−e} (hermitian-finite-fourier-count); stabilization (hermitian-count-stabilizes) gives g_T((−q)^{−(n+k)}) as the density ratio, and polynomial interpolation at infinitely many points gives the identity.
3. Substituting Y = (−q)^{−n}X into (1) gives (−X)^a.

**Checks.**

- n = 1, a = 1: g_T(Y) = 1 + qY and D_L(X) = 1 − X; substituting q^{−n}X instead of (−q)^{−n}X fails this check.
- n = 1, a = 2: g_T(Y) = 1 + qY + q²Y², D_L(X) = 1 − X + X², and the functional equation has sign +.
- a = 0: g_T = D_L = 1.

**Direct prerequisites.** [Hermitian Siegel integrals and spherical functions (Hironaka)](#hironaka-siegel-integral); [Finite Fourier expression of hermitian representation counts](#hermitian-finite-fourier-count); [Stabilization of hermitian representation counts](#hermitian-count-stabilizes); base packet `GN.3/normalized-siegel-polynomial`.

**Source.** Yumiko Hironaka, *Spherical functions on U(2n)/(U(n)×U(n)) and hermitian Siegel series*, Theorem 2.3, p.10 and proof to p.14; Theorem 2.6, p.15; Corollary 2.7, p.16; Lemma 5.1, Theorem 5.2, Proposition 5.3, pp.28–29; Theorem 5.6 and Remark 5.7, pp.31–32: Proves the Weyl-group functional equations of the spherical functions and the functional equation of the hermitian Siegel series (numbered 5.6 in this preprint; Li–Zhang cite it as Theorem 5.3). Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, §3.2, (3.2.0.2), p.16: States the functional equation of the normalized Siegel series, citing Hironaka.

<a id="hermitian-finite-fourier-count"></a>

### Finite Fourier expression of hermitian representation counts

*Theorem* `hermitian-finite-fourier-count`

Over an unramified F/F_0 with additive character ψ of conductor O_{F_0}: (1) for a unit u ∈ O_{F_0}^× and e ≥ 0, ∫_{O_F}ψ(uϖ^{−e}N_{F/F_0}(x))dx = (−q)^{−e} (Haar(O_F) = 1); (2) for m = n + k, A = I_m and T integral hermitian of rank n, the count C_N of X ∈ M_{m,n}(O_F/ϖ^N) with XᴴX ≡ T satisfies q^{−N(2mn−n²)}C_N = ∫_{ϖ^{−N}Herm_n(O_F)}ψ(−tr(TR))(∫_{M_{m,n}(O_F)}ψ(tr(RXᴴX))dX)dR, and the inner integral equals (−1)^{mΣe_j}ν(R)^{−m}.

**Hypotheses and conventions.**

- F/F_0 an unramified quadratic extension of nonarchimedean local fields of characteristic ≠ 2, q = #k_{F_0} (residue characteristic 2 allowed for the analytic statements).
- Hermitian lattices are integral hermitian O_F-lattices of the parent node GN.2 integral-hermitian-lattice; ⟨1⟩^k is the self-dual lattice of rank k.

**Proof outline.**

1. (1): e = 0 trivial; e = 1 by norm fibres (finite-hermitian-norm-fiber): Σ_{x∈F_{q²}} ψ(uN(x)/ϖ) = 1 + (q + 1)Σ_{c∈F_q^×}ψ(uc/ϖ) = −q, divided by q² gives −q^{−1}; e ≥ 2 by splitting residue classes: nonzero classes contribute 0 (the norm's derivative is the surjective trace), the zero class gives q^{−2} times the case e − 2.
2. (2): orthogonality of characters on the self-dual lattice Herm_n(O_F) (the trace pairing is self-dual because the different of F/F_0 is trivial); diagonalize R by integral congruence and apply (1) row by row.

**Checks.**

- q = 2: the one-row integral at e = 0, 1, 2 is 1, −1/2, 1/4.
- n = m = 1 over F_4: N(x) = 1 has 3 solutions mod ϖ, and the formula gives 1 + (−1)(−1/2) = 3/2, which is 2^{−1}·3.
- Ramified extensions are excluded: their different changes the self-dual lattice.

**Direct prerequisites.** [Norm fibres of F_{q²}/F_q](#finite-hermitian-norm-fiber); [The hermitian representation scheme and its primitive open](#hermitian-representation-scheme).

**Source.** Yumiko Hironaka, *Spherical functions on U(2n)/(U(n)×U(n)) and hermitian Siegel series*, §5, Lemma 5.1 and Theorem 5.2, pp.27–29: The Fourier-analytic normalization of the hermitian Siegel series that these finite identities make explicit. Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*, §3.1, p.15: The counting normalization of the density.

<a id="ramified-hermitian-density"></a>

### Hermitian densities and Siegel series over a ramified extension

*Construction* `ramified-hermitian-density`

Let E/F be a ramified quadratic extension of p-adic fields (p odd) with uniformizer u, H the hyperbolic hermitian plane with matrix [[0,u^{−1}],[−u^{−1},0]] and H_s = H^{⊕s} (self-dual of rank 2s). For hermitian O_E-lattices M, L, Den(M,L) = lim_N #Herm_{L,M}(O_E/u^{2N})/q^{N·d_{L,M}} with d_{L,M} the generic dimension. Then (Cho–Yamauchi, ramified) Den(H_s,L) = Σ_{L ⊆ L′ ⊆ L′^∨}|L′/L|^{m−2s}∏_{s−(m+t(L′))/2 < i ≤ s}(1 − q^{−2i}) for L of rank m ≤ s. For an O_E-lattice 𝐋 of the nonsplit hermitian space 𝐕 of dimension n = 2r, the normalized Siegel series Den(X,𝐋) ∈ Z[X] is defined by Den(q^{−s},𝐋) = Den(H_{r+s},𝐋)/∏_{i=s+1}^{r+s}(1 − q^{−2i}) for s ≥ 0; it satisfies Den(X,𝐋) = Σ_{𝐋⊆L⊆L^∨}X^{2 length(L/𝐋)}∏_{i=0}^{t(L)/2−1}(1 − q^{2i}X²), Den(1,𝐋) = 0, and ∂Den(𝐋) = −(d/dX)Den(X,𝐋)|_{X=1} = 2Σ_{𝐋⊆L⊆L^∨}∏_{i=1}^{t(L)/2−1}(1 − q^{2i}).

**Hypotheses and conventions.**

- E/F ramified, p odd.
- The overlattice sum is typeset with L′ ⊆ L′vee in the source (paper erratum E3); it runs over integral lattices L ⊆ L′ ⊆ L′^∨.

**Proof outline.**

1. The residue space of L′ is symplectic (the hermitian form reduces to an alternating form over k for a ramified extension); count primitive representations by symplectic-isometry-count and use the saturation decomposition as in the unramified case.
2. Normalize by the self-dual value and interpolate in q^{−s} to define Den(X,𝐋); the weighted sum follows term by term.
3. Den(1,𝐋) = Den(H_r,𝐋) = 0 because 𝐕 is nonsplit and does not embed in H_r ⊗ E; differentiate the sum for ∂Den.

**Uses.** LiLiu2022 §§2–3: ∂Den is the analytic side of the Kudla–Rapoport formula at ramified places; HLSY2023 §5: the Krämer-model densities against I_n and duals of vertex lattices.

**API.**

- `ramifiedHermitianDensity` (data): Den(M,L) over a ramified E/F.
- `ramifiedChoYamauchi` (characterisation): The weighted overlattice formula for Den(H_s,L).
- `ramifiedSiegelSeries` (data): Den(X,𝐋) ∈ Z[X] for 𝐋 in the nonsplit space.
- `ramifiedSiegelSeries_one` (simp): Den(1,𝐋) = 0.
- `ramifiedCentralDerivative` (data): ∂Den(𝐋) = 2Σ∏_{i=1}^{t(L)/2−1}(1 − q^{2i}).

**Unit tests.**

- `ramifiedSiegelSeries_one_eq_zero` (characterisation): Den(1,𝐋) = 0 for every lattice of the nonsplit space.
- `ramifiedCentralDerivative_rankTwo` (computation): For invariants (1,1) (b_1 = b_2 = 0), ∂Den(𝐋) = 2·1 = 2.
- `ramifiedChoYamauchi_rankZero` (degenerate): Den(H_s, 0) = 1.
- `ramified_type_parity` (non-example): For a lattice of rank m, m − t(L) is the rank of a nondegenerate alternating residue form, so t(L) ≡ m mod 2; a lattice of even rank never has odd type, unlike the unramified case.

**Checks.**

- In rank 2 with fundamental invariants (2b_1+1, 2b_2+1): ∂Den(𝐋) = 2Σ_{j=0}^{b_1}(1 + q + … + q^j + (b_2 − j)q^j).
- s ≥ m is needed for the symplectic counts to be nonzero for every type.
- Den(1,𝐋) = 0 for every 𝐋 in the nonsplit space.

**Direct prerequisites.** [Isometries into a finite symplectic space](#symplectic-isometry-count); [Saturation decomposition of hermitian densities](#hermitian-saturation-density-sum).

**Source.** Chao Li and Yifeng Liu, *Chow groups and L-derivatives of automorphic motives for unitary groups, II*, Definition 2.14, Lemma 2.15 with (2.2), Definition 2.16, Remark 2.17 and Lemma 2.19 with (2.3)–(2.4), pp.12–14 (Forum Math. Pi 10 (2022), e5): Defines the ramified densities against H_s, proves the ramified Cho–Yamauchi formula via symplectic isometry counts, defines the normalized Siegel series of a lattice in the nonsplit space and its weighted lattice counts. Chao Li and Yifeng Liu, *Chow groups and L-derivatives of automorphic motives for unitary groups, II*, Lemma 2.43, p.27: The rank-two computation of ∂Den.

<a id="ramified-primitive-density"></a>

### Primitive local densities and their derivatives (Krämer case)

*Construction* `ramified-primitive-density`

In the setting of He–Li–Shi–Yang (E/F ramified quadratic, p odd, V an n-dimensional hermitian space), for lattices M, L of ranks m, n: Den(M,L,X) ∈ Q[X] with Den(M,L,q^{−2k}) = Den(M ⊥ H^k, L); Den′(M,L) = −2(d/dX)Den(M,L,X)|_{X=1}; the primitive density Pden(M,L,X) counts representations φ whose image of L in (M ⊥ H^k)/π(M ⊥ H^k) has dimension n; Pden′(L) and Pden_t(L) are its derivative and values against Λ^♯_t; and ∂Pden(L) = Pden′(L) + Σ_j c_{2j}Pden_{2j}(L), with ∂Den(L) = Σ_{L ⊆ L′ ⊆ L_F}∂Pden(L′). The decompositions Den(M,L,X) = Σ_{L ⊆ L′ ⊆ L_F}(q^{n−m}X)^{ℓ(L′/L)}Pden(M,L′,X) and its Möbius inversion Pden(M,L,X) = Σ_{i=0}^n(−1)^iq^{i(i−1)/2+i(n−m)}X^iΣ_{L ⊆ L′ ⊆ π^{−1}L, ℓ(L′/L)=i}Den(M,L′,X) hold, both finite sums.

**Hypotheses and conventions.**

- E/F ramified, p odd; the coefficients c_t = −Pden′(Λ^♯_t) are fixed by Corollary 5.10 of the source.
- The closed formula (5.8) for c_t in the branch n even, ϵ = −1 printed in the source is false (paper erratum E22); c_t is defined by Corollary 5.10.

**Proof outline.**

1. Define the primitive counts and their normalized limits as in ramified-hermitian-density.
2. Decomposition by saturation (as in hermitian-saturation-density-sum) and its inversion by the q-binomial alternating sums (gaussian-binomial).
3. For M, L of equal rank, Pden(M,L) = Den(M,L) if M ≅ L and 0 otherwise, and Den(M,L) = n(M,L)Den(M,M); hence Den_t(L) ∈ Z and the c_t are determined.

**Uses.** HLSY2023 Theorem 1.6: ∂Pden is the analytic side matched with the primitive intersection numbers; GN.3 hlsy-primitive-derivative-formula: the closed formula for ∂Pden.

**API.**

- `ramifiedPrimitiveDensity` (data): Pden(M,L,X).
- `ramifiedPrimitiveDerivative` (data): ∂Pden(L).
- `ramifiedDensity_eq_sum_primitive` (characterisation): Den(M,L,X) = Σ_{L′}(q^{n−m}X)^{ℓ(L′/L)}Pden(M,L′,X).
- `ramifiedPrimitiveDensity_inversion` (characterisation): The Möbius inversion formula.
- `ramifiedDerivative_eq_sum` (characterisation): ∂Den(L) = Σ_{L′ ⊇ L}∂Pden(L′).
- `ramifiedPrimitiveDensity_hyperbolic` (simp): Pden(H^k,L) = ∏_{ℓ<n}(1 − q^{−2k+2ℓ}) for integral L of rank n.

**Unit tests.**

- `ramifiedPrimitiveDensity_nonIntegral` (degenerate): If L contains a vector of valuation ≤ −1, ∂Pden(L) = 0.
- `ramifiedPrimitiveDensity_equalRank` (non-example): For M, L of the same rank with M ≇ L, Pden(M,L) = 0 although Den(M,L) may be nonzero.
- `ramifiedPrimitiveDensity_hyperbolic_rankOne` (computation): For an integral lattice L of rank one, Pden(H^k, L) = 1 − q^{−2k}.
- `ramifiedDensity_inversion_roundtrip` (characterisation): Applying the decomposition and then the inversion returns Pden(M,L,X).

**Checks.**

- If some x ∈ L has val(x) ≤ −1 then ∂Den(L) = Den′(L) = ∂Pden(L) = Pden′(L) = 0.
- For equal ranks, Pden(M,L) = 0 unless M ≅ L.
- For integral L of rank n, Pden(H^k, L) = ∏_{ℓ=0}^{n−1}(1 − q^{−2k+2ℓ}) (He–Li–Shi–Yang Lemma 5.12, from Li–Liu Lemma 2.15); for non-integral L it is 0.

**Direct prerequisites.** [Hermitian densities and Siegel series over a ramified extension](#ramified-hermitian-density); [Gaussian binomial coefficients](#gaussian-binomial); [Isometries and isotropic subspaces of finite quadratic spaces](#orthogonal-isometry-count).

**Source.** Qiao He, Chao Li, Yousheng Shi and Tonghai Yang, *A proof of the Kudla–Rapoport conjecture for Krämer models*, Definition 5.1, (5.1)–(5.5), p.33; Lemma 5.2, p.33; Lemma 5.3, Corollary 5.4, Theorem 5.5, Corollary 5.6, p.34; Lemma 5.7, Corollaries 5.8–5.10, Example 5.11, pp.34–36 (arXiv:2208.07988, authors' final version of 21 July 2023): Defines the densities, primitive densities, their derivatives and ∂Pden, proves the vanishing for very non-integral lattices, the primitive decomposition and its inversion, and determines the coefficients c_t. Qiao He, Chao Li, Yousheng Shi and Tonghai Yang, *A proof of the Kudla–Rapoport conjecture for Krämer models*, Lemmas 5.12–5.13, (5.9)–(5.10), pp.36–37: The values against hyperbolic summands.

<a id="hlsy-primitive-derivative-formula"></a>

### Closed formula for the primitive derivative (He–Li–Shi–Yang)

*Theorem* `hlsy-primitive-derivative-formula`

In the Krämer setting of ramified-primitive-density, let L ⊂ V be a lattice of rank n. (1) If L is not integral, ∂Pden(L) = 0. (2) If L is unimodular, ∂Pden(L) = Pden′(L) = 1 for n odd and 0 for n even. (3) If L = I_{n−t} ⊥ L_2 with L_2 of full type t > 0, then ∂Pden(L) = Pden′(L) = ∏_{ℓ=1}^{(t−1)/2}(1 − q^{2ℓ}) for t odd and (1 − χ(L_2)q^{t/2})∏_{ℓ=1}^{t/2−1}(1 − q^{2ℓ}) for t even. Consequently ∂Den(L) ∈ Z for every L, ∂Den(L) = 0 for non-integral L, and for L = L_1 ⊥ L_2 with L_1 unimodular of rank n_1: ∂Den(L) − ∂Den(L_2) = n(I_{n_2},L_2)(δ_odd(n) − δ_odd(n_2)).

**Hypotheses and conventions.**

- E/F ramified, p odd; full type means every invariant of L_2 positive; in (3) t > 0 is required.

**Proof outline.**

1. Theorem 6.1 of the source decomposes Pden(I_m,L,X) by the rank of the projection to H^k into finite-field isometry counts over the reduction (orthogonal-isometry-count, gaussian-binomial).
2. Differentiate at X = 1 and reduce the resulting alternating sums with the polynomials f_ϵ, g_ϵ, h_ϵ of §7 (Lemmas 7.7–7.16) to the product formulas; Propositions 7.5–7.6 are the full-type cases.
3. Integrality and the cancellation law follow by summing ∂Pden over overlattices (Corollaries 7.2–7.3, Lemma 7.4).

**Checks.**

- n = 1, L unimodular: ∂Pden(L) = 1.
- n = 2, L unimodular: ∂Pden(L) = 0.
- t = 1: ∂Pden(L) = 1 (empty product); t = 2: ∂Pden = 1 − χ(L_2)q.

**Direct prerequisites.** [Primitive local densities and their derivatives (Krämer case)](#ramified-primitive-density); [Isometries and isotropic subspaces of finite quadratic spaces](#orthogonal-isometry-count); [Gaussian binomial coefficients](#gaussian-binomial).

**Source.** Qiao He, Chao Li, Yousheng Shi and Tonghai Yang, *A proof of the Kudla–Rapoport conjecture for Krämer models*, Theorem 1.6 = Theorem 7.1 with proof §7.6, pp.8, 46, 62–64; Corollaries 7.2–7.3 and Lemma 7.4, pp.46–47: Proves the closed formula for ∂Pden and the integrality and cancellation consequences. Qiao He, Chao Li, Yousheng Shi and Tonghai Yang, *A proof of the Kudla–Rapoport conjecture for Krämer models*, Theorem 6.1, Corollaries 6.2–6.3, Lemmas 6.4–6.6, pp.41–45; Propositions 7.5–7.6 and Lemmas 7.7–7.16, pp.48–62: The primitive decomposition by projection rank and the polynomial identities that collapse the derivative.

<a id="full-type-mu-invariants"></a>

### μ-invariants of full-type hermitian lattices (ramified)

*Theorem* `full-type-mu-invariants`

In the Krämer setting, for L of full type t with L° = {val ≥ 0}, L°° = {val > 0}: μ_+(L) = |(πL^♯)°°/L|, μ_0(L) = |((πL^♯)° ∖ (πL^♯)°°)/L|, μ_−(L) = |((L^♯)° ∖ (πL^♯)°)/L|, and μ_{0,ν} by the sign of (u,u). Then μ_+ + μ_0 + μ_− = q^tμ_+; for t odd (1 − χq^{(t+1)/2})(1 + χq^{(t−1)/2})μ_+(L) + (1 + χq^{(t−1)/2})μ_0(L) + μ_−(L) = 0, and for t even (1 − q^t)μ_+(L) + (1 − χq^{t/2})μ_{0,+1}(L) + (1 + χq^{t/2})μ_{0,−1}(L) + μ_−(L) = 0, for either sign χ ∈ {±1}.

**Hypotheses and conventions.**

- E/F ramified, p odd; L of full type t.

**Proof outline.**

1. Count vectors in each valuation class modulo L (Lemma 8.4).
2. Induction on val(L) from the maximal lattices, using an index-q overlattice with the relative identities of Lemmas 8.6 and 8.8 (Propositions 8.7 and 8.9).

**Checks.**

- At maximal lattices of odd type t (He–Li–Shi–Yang Proposition 8.7): μ_+ = 1, μ_0 = q − 1, μ_− = q^t − q, and (1 − qa)(1 + a) + (1 + a)(q − 1) + q^t − q = 0 with a = χq^{(t−1)/2}; at maximal lattices of even type in case (i) of Proposition 8.9: μ_+ = 1, μ_{0,±1} = (q² − 1)/2 and μ_− = q^t − q² ((8.9)–(8.10)).
- The identities were checked by brute force at q = 3, 5 for both signs χ.
- The orthogonal analogue is full-type-weighted-identities.

**Direct prerequisites.** [Primitive local densities and their derivatives (Krämer case)](#ramified-primitive-density).

**Source.** Qiao He, Chao Li, Yousheng Shi and Tonghai Yang, *A proof of the Kudla–Rapoport conjecture for Krämer models*, (8.3)–(8.10), Definitions 8.3, 8.5, Lemmas 8.4, 8.6, 8.8 and Propositions 8.7, 8.9, pp.65–73: Defines the μ-invariants and proves the linear identities by induction from maximal lattices.

<a id="ramified-lattice-lemmas"></a>

### Lattice lemmas for ramified hermitian densities

*Lemma* `ramified-lattice-lemmas`

Over a ramified E/F (p odd): (1) for any basis with moment matrix T, a_1 + … + a_i − i is the minimal E-valuation of the i × i minors of T; (2) if L = L′ + ⟨x⟩ with L′ of rank m − 1 and x′ ∈ L′^∨ representing (x,−)|_{L′}, then t(L) = t(L′) + 1 if x′ ∈ uL′^∨ + L′ and t(L′) − 1 otherwise; (3) for integral L of rank 2m + 1 and type 2m + 1, |(L^∨)^int/L| = q^{2m}|(uL^∨)^int/L|; (4) special lattices: for r ≥ 2 and integral L^♭ in the nonsplit space with a_{n−2} < a_{n−1}, the number of integral lattices containing L^♭ with invariants (a_1,…,a_{n−2},a_{n−1} − 1,a_{n−1} − 1) is 0 or 2, and off the resulting set S_{L^♭} adding x lowers the valuation: L^♭ + ⟨x⟩ = L^{♭′} + ⟨x′⟩ with val(L^{♭′}) < val(L^♭). The Krämer analogue of (4) (He–Li–Shi–Yang Lemma 9.6) holds when the top invariant a′_n is even and fails when it is odd and a′_1 + … + a′_{n−1} = val(L^♭) − 1.

**Hypotheses and conventions.**

- E/F ramified, p odd.

**Proof outline.**

1. (1)–(2): Smith normal form of moment matrices over O_E.
2. (3): induction on val(L) starting from the q^{2m} isotropic vectors of a (2m+1)-dimensional quadratic space over k.
3. (4): the two special lattices are distinguished by the two isotropic lines of a residue plane; the reduction step chooses a basis realizing smaller invariants. The proof prints u^{e_i−1} for u^{a_i−1} (Li–Liu erratum E2).

**Checks.**

- (1) with i = 1: a_1 − 1 is the minimal valuation of an entry of T.
- (3) with m = 0: |(L^∨)^int/L| = |(uL^∨)^int/L| for rank one.
- (4) fails as printed in the Krämer case when a′_n is odd sitting in a hyperbolic block (He–Li–Shi–Yang erratum E7).

**Direct prerequisites.** [Hermitian densities and Siegel series over a ramified extension](#ramified-hermitian-density).

**Source.** Chao Li and Yifeng Liu, *Chow groups and L-derivatives of automorphic motives for unitary groups, II*, Lemma 2.23, p.15; Lemma 2.25, p.19; Lemma 2.43, p.27; Lemmas 2.57–2.58 and the sets S_{L^♭}, pp.33–35: The invariant/minor lemma, the type-change rule, the isotropic count, the rank-two count and the special-lattice reduction. Qiao He, Chao Li, Yousheng Shi and Tonghai Yang, *A proof of the Kudla–Rapoport conjecture for Krämer models*, Lemma 9.6 and proof, pp.74–75: The Krämer valuation reduction, which needs the parity restriction recorded above.

## 3E. Mass, Tamagawa numbers and orbit counts

Masses of definite genera over totally real fields: trace lattices, the proper/ordinary comparison, Kirschmer's local types and factors with the Gan–Hanke–Yu smooth models and canonical volumes, archimedean constants, Euler products at integers ≥ 2, Weil's Siegel formula and τ(SO_Q) = 2; hermitian masses with the unitary mass formula, Lipnowski–Tsimerman's asymptotics and the local orbit counts they use. The base packet's 3.3 (finite stabilizers, finite class sets, the genus mass, the adelic mass identity and the maximal-lattice mass formula) is cited, not repeated.

<a id="number-ring-trace-lattice"></a>

### The trace Z-lattice of a lattice over a totally real field

*Construction* `number-ring-trace-lattice`

For an integral quadratic O_K-lattice L in a totally positive (V,Q), the trace form Q_Z(x) = Tr_{K/Q}(Q(x)) makes L a positive definite integral quadratic Z-lattice of rank [K:Q]·rank_{O_K}L. Its real scalar extension L ⊗ ℝ is isometric to ⊕_{σ:K→ℝ}(V_σ, Q_σ), and the diagonal image of L is a discrete full lattice there. Multiplication by a ∈ O_K is self-adjoint for the trace metric with operator norm max_σ|σ(a)|.

**Hypotheses and conventions.**

- K a totally real number field of degree d (d = 1 allowed) with ring of integers O_K.
- (V,Q) a totally positive definite quadratic space of dimension m over K; lattices are integral quadratic O_K-lattices of GN.2, projective and possibly non-free.

**Proof outline.**

1. L is finite projective over O_K, hence free of rank [K:Q]·rank L over Z; use a pseudo-basis (coefficient ideals kept) and the embedding lattice of each fractional ideal to prove discreteness and fullness.
2. Q_Z is integral since Tr(O_K) ⊆ Z and positive since every Q_σ is positive definite.
3. The adjointness and operator-norm statements are checked on each real place.

**Uses.** GN.3 definite-genus-class-finite and definite-integral-isometry-finite (parent packet): reduce finiteness over O_K to IntegralLattices 2C and 2G over Z; GN.3 finite-bounded-integral-endomorphisms: the O_K-action is by bounded operators.

**API.**

- `numberRingTraceForm` (data): Q_Z = Tr_{K/Q} ∘ Q on the underlying Z-module of L.
- `numberRingTraceForm_posDef` (characterisation): Q_Z is positive definite when every Q_σ is.
- `numberRingTraceForm_rank` (characterisation): rank_Z L = [K:Q]·rank_{O_K} L.
- `traceLatticeRealComparison` (equivalence): L ⊗ ℝ ≅ ⊕_σ V_σ isometrically for Q_Z and Σ_σ Q_σ.
- `numberRingTraceForm_isometry` (functoriality): O_K-isometries of L are Z-isometries of (L, Q_Z).
- `trace_scalar_operator_bound` (other): Multiplication by a ∈ O_K satisfies Q_Z(ax) ≤ (max_σ|σ(a)|)²Q_Z(x).

**Unit tests.**

- `numberRingTraceForm_rat` (compatibility): For K = Q, Q_Z = Q.
- `numberRingTraceForm_sqrt5` (computation): For K = Q(√5), L = O_K, Q = x²: Q_Z(a + bω) = 2a² + 2ab + 3b².
- `numberRingTraceForm_rankZero` (degenerate): The zero lattice has trace lattice of rank 0.
- `numberRingTraceForm_one_place` (non-example): The image of Z[ω] under a single real embedding is not discrete.

**Checks.**

- For K = Q this is the original lattice.
- For K = Q(√5), L = O_K, Q(x) = x²: in the basis (1, ω), ω = (1+√5)/2, Q_Z = 2a² + 2ab + 3b², with Gram matrix of the polar form [[4,2],[2,6]] of determinant 20.
- Using one real embedding of Z[ω] gives a non-discrete subgroup of ℝ; both embeddings are needed.

**Direct prerequisites.** base packet `GN.2/integral-quadratic-lattice`; `Algebra.trace` (Mathlib); `NumberField.InfinitePlace` (Mathlib); `IsZLattice` (Mathlib).

**Source.** Rainer Schulze-Pillot, *Lecture notes on quadratic forms and their arithmetic*, Theorem 6.10 and Remarks 6.11, 6.13, pp.77–78 (arXiv:2008.12847v2): Theorem 6.10 (p.77) proves that there are finitely many classes of integral Z-lattices of given rank and determinant; Remarks 6.11 and 6.13 (pp.77–78) extend this and the finiteness of classes in a genus to lattices over rings of integers of number fields, citing Humbert. The restriction of scalars to Z is this node's own route. Markus Kirschmer, *One-class genera of maximal integral quadratic forms*, §2, p.3 (author preprint, June 2013): Defines lattices, isometry, the automorphism group and the mass over a totally real field.

<a id="finite-bounded-integral-endomorphisms"></a>

### Finitely many bounded integral endomorphisms

*Theorem* `finite-bounded-integral-endomorphisms`

Let (M, Q_Z) be a positive definite integral quadratic Z-lattice of finite rank and C ≥ 0. Then the set of Z-linear endomorphisms T of M with Q_Z(Tx) ≤ C²Q_Z(x) for all x is finite. Consequently, on a fixed trace lattice there are only finitely many O_K-module structures compatible with the trace form, and the O_K-isometry class of an integral lattice over a totally real field is determined by its trace lattice together with its O_K-action.

**Hypotheses and conventions.**

- Positive definiteness is essential.

**Proof outline.**

1. T is determined by the images of a Z-basis, each of bounded norm, and IntegralLattices 2A gives finitely many vectors of bounded norm.
2. Apply to multiplication by a finite set of ring generators of O_K, bounded by trace_scalar_operator_bound.
3. The K-valued polar form is recovered from the Z-valued one by nondegeneracy of the trace pairing: B_Z(ax,y) = Tr(aB(x,y)) for all a determines B(x,y).

**Checks.**

- On Z with Q_Z = x² and C = 1 the endomorphisms are multiplication by −1, 0, 1.
- C = 0 leaves only T = 0.
- For the zero form every integer multiple is allowed, so the conclusion fails without positivity.

**Direct prerequisites.** [The trace Z-lattice of a lattice over a totally real field](#number-ring-trace-lattice); `TauCeti.IntegralLattice` (Tau Ceti).

**Source.** Rainer Schulze-Pillot, *Lecture notes on quadratic forms and their arithmetic*, Remarks 6.11 and 6.13, pp.77–78: Remarks 6.11 and 6.13 state finiteness of classes over rings of integers (Humbert), which this node recovers by restriction of scalars and bounded endomorphisms.

<a id="proper-ordinary-mass-doubling"></a>

### Proper and ordinary masses over a totally real field

*Theorem* `proper-ordinary-mass-doubling`

Let L be a totally positive definite integral lattice of positive rank over a totally real K. The sum of the proper masses Σ 1/|SO(M)| over the proper classes in the genus of L is twice the ordinary mass Σ 1/|O(M)| over the ordinary classes: an ordinary class with an improper automorphism is one proper class with |SO(M)| = |O(M)|/2, and otherwise it splits into two proper classes with SO(M) = O(M).

**Hypotheses and conventions.**

- K a totally real number field of degree d (d = 1 allowed) with ring of integers O_K.
- (V,Q) a totally positive definite quadratic space of dimension m over K; lattices are integral quadratic O_K-lattices of GN.2, projective and possibly non-free.
- Rank ≥ 1; in rank 0 both masses are 1.

**Proof outline.**

1. O(Q)(K) has a reflection, so it has elements of determinant −1; partition the proper classes of each ordinary class by orbit–stabilizer for the action of O(Q)(K)/SO(Q)(K).
2. Each case contributes 2/|O(M)| to the proper sum.
3. Over Z this is IntegralLattices 7A; the argument is identical over O_K.

**Checks.**

- Rank one ⟨1⟩: O = {±1}, mass 1/2; SO trivial, proper mass 1.
- An ordinary class with |O(M)| = 4 and no improper automorphism splits into two proper classes contributing 1/4 + 1/4 = 1/2.
- Rank 0: O = SO trivial, both masses 1, and the doubling fails.

**Direct prerequisites.** base packet `GN.3/genus-mass`; base packet `GN.3/definite-integral-isometry-finite`; base packet `GN.3/definite-genus-class-finite`.

**Source.** Markus Kirschmer, *One-class genera of maximal integral quadratic forms*, §2, p.3: Defines the ordinary mass; the proper/ordinary comparison is the orbit–stabilizer deduction stated here. Wee Teck Gan, Jonathan Hanke and Jiu-Kang Yu, *On an exact mass formula of Shimura*, §7, pp.118–119: Works with proper classes and SO in the double-coset integration.

<a id="maximal-mass-local-type"></a>

### Local type of a quadratic space for the maximal-lattice mass

*Definition* `maximal-mass-local-type`

For a nondegenerate quadratic space (V,Q) of dimension m ≥ 3 over a nonarchimedean local field K_p of characteristic 0, with signed discriminant d = (−1)^{m(m−1)/2}det Q and Hasse invariant c_p(Q), define the Witt invariant ω_p(Q) = c_p(Q) for m ≡ 1,2 mod 8, c_p(Q)(−1,−1)_p for m ≡ 5,6, c_p(Q)(−1,d)_p for m ≡ 0,3, and c_p(Q)(−1,−d)_p for m ≡ 4,7. The local type t_p(Q) ∈ {0, I, II+, II−, II, III+, III−} is: for m odd, I if v_p(d) is even and ω = −1; II± if v_p(d) is odd and ω = ±1; for m even, I if d is a square and ω = −1; II if d is a nonsquare, K_p(√d)/K_p unramified and ω = −1; III± if K_p(√d)/K_p is ramified and ω = ±1; and 0 in every other case.

**Hypotheses and conventions.**

- m ≥ 3; dyadic places included; characteristic 0.

**Proof outline.**

1. Compute d and c_p from a diagonalization (GN.2 field invariants, QuadraticFormInvariants Layers 3 and 5).
2. Read the type off the table; independence of the diagonalization follows from the invariance of d and c_p.

**Uses.** Kirschmer2013 Definition 3.1: the local mass factor λ_p is a function of the type; GN.3 maximal-local-mass-factor: the rational table.

**API.**

- `MaximalMassLocalType` (data): The inductive type with cases zero, I, IIPlus, IIMinus, II, IIIPlus, IIIMinus.
- `maximalMassWittSign` (data): ω_p(Q) by the rank modulo 8.
- `maximalMassLocalType` (data): The type of (V,Q) at p.
- `maximalMassLocalType_basisChange` (functoriality): Isometric spaces have the same type.
- `maximalMassLocalType_eq_zero_of_unimodular` (characterisation): At an odd place where Q has a unimodular diagonalization and m is odd, the type is 0.

**Unit tests.**

- `maximalMassWittSign_rank_three` (computation): For m = 3, ω_p(Q) = c_p(Q)(−1, d)_p.
- `maximalMassLocalType_odd_signs` (characterisation): For m odd and v_p(d) odd, ω = +1 gives IIPlus and ω = −1 gives IIMinus.
- `maximalMassLocalType_signed_disc` (non-example): ⟨1,1⟩ has determinant 1 but signed discriminant −1; using the determinant changes the even-rank square test.
- `maximalMassLocalType_ramified` (degenerate): For m even and K_p(√d)/K_p ramified the type is never 0.

**Checks.**

- ⟨1,1⟩ ⊕ ⟨1⟩ = ⟨1,1,1⟩ over Q_p, p odd: d = −1 is a unit, c_p = 1, m = 3 so ω = c_p(−1,d) = (−1,−1)_p = 1 and the type is 0.
- At m odd and v_p(d) odd, ω = +1 and ω = −1 give different types II+ and II−.
- At m even with K_p(√d)/K_p ramified the type is III± for either sign, also at p = 2.

**Direct prerequisites.** base packet `GN.2/field-discriminant-comparison`; base packet `GN.2/field-hasse-comparison`.

**Source.** Markus Kirschmer, *One-class genera of maximal integral quadratic forms*, §2, equation (1) and Table 1, pp.2–3: Defines ω_p(Q) from the Hasse invariant by the rank modulo 8 and the local type t_p(Q) by the stated table.

<a id="maximal-local-mass-factor"></a>

### Local mass factors of maximal lattices

*Definition* `maximal-local-mass-factor` — planet: **Local mass factors of maximal lattices**

For residue cardinality q ≥ 2, r ≥ 1 and a local type t: λ = 1 for t = 0; for m = 2r + 1, λ = (q^{2r} − 1)/(2(q + 1)) for t = I and λ = (q^r + ω)/2 for t = II±, ω = ±1; for m = 2r ≥ 4, λ = (q^{r−1} − 1)(q^r − 1)/(2(q + 1)) for t = I, λ = (q^{r−1} + 1)(q^r + 1)/(2(q + 1)) for t = II, and λ = 1/2 for t = III±. The local factor of the maximal lattices of (V,Q) at p is λ_p(Q) = λ(N(p), ⌊m/2⌋, t_p(Q)); it is 1 at all but finitely many p, and it equals the ratio of the canonical stabilizer volume of the quasi-split good model to that of the maximal lattice (orthogonal-canonical-local-volume).

**Hypotheses and conventions.**

- m ≥ 3; the types are those compatible with the parity of m.

**Proof outline.**

1. Define the rational table; positivity holds because q ≥ 2.
2. The identification with stabilizer volumes is orthogonal-canonical-local-volume, through the reductive quotient orders of finite-orthogonal-group-order.

**Uses.** Kirschmer2013 Theorem 3.3: the local factors in the exact mass of the maximal genus; GN.3 maximal-integral-mass-formula (parent packet): the product ∏_p λ_p(Q).

**API.**

- `maximalLocalMassFactor` (data): λ(q, r, t) ∈ ℚ.
- `maximalLocalMassFactor_zero` (simp): λ(q, r, 0) = 1.
- `maximalLocalMassFactor_odd_I` (simp): λ(q, r, I) = (q^{2r} − 1)/(2(q+1)) in odd rank.
- `maximalLocalMassFactor_even_II` (simp): λ(q, r, II) = (q^{r−1}+1)(q^r+1)/(2(q+1)).
- `maximalLocalMassFactor_even_III` (simp): λ(q, r, III±) = 1/2.
- `maximalLocalMassFactor_pos` (characterisation): λ > 0 for q ≥ 2 and admissible types.

**Unit tests.**

- `maximalLocalMassFactor_q2_odd` (computation): At q = 2, r = 1: I, II+, II− give 1/2, 3/2, 1/2.
- `maximalLocalMassFactor_q3_even` (computation): At q = 3, r = 2: I, II, III+ give 2, 5, 1/2.
- `maximalLocalMassFactor_good` (degenerate): Type 0 gives 1.
- `maximalLocalMassFactor_dyadic_III` (non-example): At q = 2 the type III− factor is 1/2, so dyadic factors cannot be set to 1.

**Checks.**

- q = 2, r = 1, odd types I, II+, II−: 1/2, 3/2, 1/2.
- q = 3, r = 2, even types I, II, III+: 2, 5, 1/2.
- Type 0 gives 1 at every q; the dyadic III factors are 1/2, not 1.

**Direct prerequisites.** [Local type of a quadratic space for the maximal-lattice mass](#maximal-mass-local-type).

**Source.** Markus Kirschmer, *One-class genera of maximal integral quadratic forms*, Definition 3.1, p.4: Defines λ_p(Q) by the stated table. Wee Teck Gan, Jonathan Hanke and Jiu-Kang Yu, *On an exact mass formula of Shimura*, Tables 3–4, pp.115–116, and Proposition 2.13, p.105: Derives the factors from the reductive quotients of the smooth stabilizer models.

<a id="smooth-maximal-orthogonal-model"></a>

### Smooth integral models of maximal-lattice stabilizers

*Construction* `smooth-maximal-orthogonal-model`

Let F be a characteristic-0 nonarchimedean local field with ring of integers A, residue field k of cardinality q, (V,Q) nondegenerate of dimension m ≥ 3 and Λ ⊂ V a maximal integral lattice. There is a smooth affine group scheme 𝒢_Λ over A with generic fibre SO(V,Q) and 𝒢_Λ(A) the stabilizer of Λ in SO(V)(F). Except when the residue characteristic is 2, m is even and the discriminant extension is ramified, 𝒢_Λ is the schematic closure of SO(V) in GL(Λ); in that exceptional case its identity component is the closure in GL(A² ⊕ Λ) of the enlarged representation g ↦ [[I_2,0,0],[M_{12}N, M_{11}, M_{12}],[(M_{22} − I_2)N, M_{21}, M_{22}]] built from the polar-dual lattice Λ̃ = H_A^{r−1} ⊕ Aϖ^{−h}e_r ⊕ Aϖ^{−h′}f_r, N = diag(ϖ^{−h},ϖ^{−h′}), h + h′ the different exponent and h − h′ ∈ {0,1}. Its special fibre has a unipotent radical and a reductive quotient Ḡ_Λ whose type is given by the local type t_p(Q), with the component group retained; the congruence kernels are {g : (g − 1)Λ̃ ⊆ ϖ^aΛ} in the exceptional case and {g : (g − 1)Λ ⊆ ϖ^aΛ} otherwise.

**Hypotheses and conventions.**

- Characteristic 0; m ≥ 3.
- The naive determinant-one equations and the smooth model have the same A-points but need not have the same points modulo ϖ.

**Proof outline.**

1. Bruhat–Tits theory gives the smooth model of the stabilizer of a point of the building (ReductiveGroupsPartII RG2.3 supplies the general smooth affine model and its special fibre); identify it with the schematic closure by Gan–Hanke–Yu's lattice computation.
2. In the exceptional dyadic case construct the enlarged representation, verify faithfulness and that its closure is smooth with the stated congruence kernels.
3. Compute the reductive quotient for each local type (GHY Tables 3–4).

**Uses.** GN.3 orthogonal-canonical-local-volume: the stabilizer volume is computed by counting points of the special fibre; GHY2001 §6: the local factors of the exact mass formula.

**API.**

- `smoothMaximalOrthogonalModel` (data): The smooth affine A-group scheme 𝒢_Λ.
- `smoothMaximalOrthogonalModel_integralPoints` (characterisation): 𝒢_Λ(A) = Stab_{SO(V)(F)}(Λ).
- `smoothMaximalOrthogonalModel_smooth` (characterisation): 𝒢_Λ is smooth over A.
- `maximalOrthogonalReductiveQuotient` (data): The reductive quotient of the special fibre, with its component group.
- `dyadicEnlargedRepresentation` (data): The faithful representation in GL(A² ⊕ Λ) of the exceptional case.
- `smoothOrthogonalCongruenceKernel` (characterisation): The reduction kernels modulo ϖ^a are given by the stated lattice conditions.

**Unit tests.**

- `reductiveQuotient_rank3_q2` (computation): For split rank 3 at q = 2 the reductive quotient has 6 rational points.
- `dyadicEnlargedRepresentation_one` (degenerate): The enlarged representation sends 1 to the identity of size m + 2.
- `congruence_conditions_differ` (non-example): On A = Z_2, Λ = A and Λ̃ = (1/2)A, g − 1 = 2 maps Λ into 2Λ but not Λ̃ into 2Λ.
- `enlarged_exponents` (computation): For different exponent 3 the exponents are (h,h′) = (2,1), and at ϖ = 2 the diagonal of N is (1/4, 1/2).

**Checks.**

- Odd rank 3, split good reduction: reductive quotient SO_3, of order 6 at q = 2, and local factor 1.
- Even rank 4, ramified discriminant at a dyadic place: quotient (Z/2) × SO_3; discarding the component group doubles the factor from 1/2 to 1.
- At g = 1 the enlarged matrix is the identity of size m + 2; with different exponent 3, (h, h′) = (2, 1).

**Direct prerequisites.** [Orders of finite orthogonal groups](#finite-orthogonal-group-order); [Local type of a quadratic space for the maximal-lattice mass](#maximal-mass-local-type); `ReductiveGroupsPartII:RG2.3`.

**Source.** Wee Teck Gan, Jonathan Hanke and Jiu-Kang Yu, *On an exact mass formula of Shimura*, Proposition 6.12 and Remarks, p.116; (6.13)–(6.16) and Propositions 6.15, 6.17, pp.117–118; Tables 3–4, pp.115–116: Constructs the smooth models of maximal-lattice stabilizers, the dyadic enlarged representation, the congruence kernels and the reductive quotients. François Bruhat and Jacques Tits, *Groupes réductifs sur un corps local. II*, §§4.6.2 and 4.6.7, pp.124–127 (Publ. Math. IHÉS 60, 1984): Smooth models of stabilizers of facets and their integral points and reduction.

<a id="orthogonal-canonical-local-volume"></a>

### Canonical local volumes of maximal-lattice stabilizers

*Theorem* `orthogonal-canonical-local-volume`

In the setting of smooth-maximal-orthogonal-model, let H be the quasi-split inner form of SO(V) with its good special model and reductive quotient H̄⁰, ω_v a top differential on that model nonzero modulo ϖ, transported to the canonical gauge on SO(V), and μ_v = L_v(M^∨_G(1))|ω_v| with L_v(M^∨_G(1))^{−1} = q^{−dim H̄⁰}|H̄⁰(k)|. Then μ_v(K_v) = 1/λ_v for the stabilizer K_v of the maximal lattice, where λ_v = maximal-local-mass-factor of the local type, and λ_v = q^{−N(H̄⁰)}|H̄⁰(k)| / (q^{−N(Ḡ)}|Ḡ(k)|) with N the number of positive roots of the identity component and Ḡ the reductive quotient of 𝒢_Λ (component group included).

**Hypotheses and conventions.**

- Characteristic 0; m ≥ 3; the canonical gauge is the one of Gross used by Gan–Hanke–Yu §2.

**Proof outline.**

1. Count points of the special fibre of 𝒢_Λ: |𝒢_Λ(k)| = q^{dim U}|Ḡ(k)| and smoothness gives vol(K_v) = q^{−dim G}|𝒢_Λ(k)| for the measure of a differential nonzero on 𝒢_Λ.
2. Compare the differential on 𝒢_Λ with the transported ω_v through the Iwahori model (factor q^{−N}), and cancel the unipotent dimensions.
3. Insert the reductive quotient orders (finite-orthogonal-group-order, GHY Tables 3–4) to obtain λ_v.

**Checks.**

- Good split rank 3 at q = 3: N = 1 and order 24 on both sides, ratio 1.
- Type II+ in rank 3 at q = 3 (v_p(d) odd, ω = +1): the reductive quotient is the split O_2, of order 2(q − 1) = 4 with N = 0, against H̄⁰ = SO_3 of order 24 with N = 1, so λ = (24/3)/4 = 2 and μ_v(K_v) = 1/2; the anisotropic quotient ²O_2 of types I and II− gives λ = 1 at q = 3 (GHY Table 4).
- A local volume can exceed 1: at q = 2, r = 1, odd type II− gives λ = 1/2 and μ_v(K_v) = 2.

**Direct prerequisites.** [Smooth integral models of maximal-lattice stabilizers](#smooth-maximal-orthogonal-model); [Local mass factors of maximal lattices](#maximal-local-mass-factor); [Orders of finite orthogonal groups](#finite-orthogonal-group-order); `AdelicAlgebraicGroups:AA.2`.

**Source.** Wee Teck Gan, Jonathan Hanke and Jiu-Kang Yu, *On an exact mass formula of Shimura*, §2, equations (2.6)–(2.13), pp.104–105, and Proposition 2.13: Defines the canonical local measures through the motive of G and computes the stabilizer volumes as ratios of reductive-quotient point counts. Markus Kirschmer, *One-class genera of maximal integral quadratic forms*, Theorem 3.3, p.4: Cites GHY Proposition 2.13 for the local factors λ_p.

<a id="orthogonal-archimedean-gauge"></a>

### Archimedean constants of the orthogonal mass formula

*Theorem* `orthogonal-archimedean-gauge`

For m ≥ 3, r = ⌊m/2⌋ and G = SO(m): dim G = r(2r − (−1)^m), and the archimedean constant γ_G = ∏_{i=1}^r(2i − 1)!/(2π)^{r(r+1)} for m odd and (r − 1)!∏_{i=1}^{r−1}(2i − 1)!/(2π)^{r²} for m even equals the reciprocal of the volume of the compact group SO(m)(ℝ) for the real Tamagawa gauge of the pinned split form transported to the definite form. Concretely, with V_n = vol(SO(n)) = ∏_{j=2}^n 2π^{j/2}/Γ(j/2) for the metric in which E_ij − E_ji (i < j) are orthonormal (IntegralLattices 7E), the gauge measure is 2^{−⌊n/2⌋}V_n for n odd and V_n for n even, and V_{2r+1} = 2^r/γ_odd(r), V_{2r} = 1/γ_even(r).

**Hypotheses and conventions.**

- m ≥ 3 (for the comparison with the mass formula); the volumes V_n are defined for all n ≥ 1 with V_1 = 1.

**Proof outline.**

1. V_n by the fibration SO(n) → S^{n−1} and the sphere volumes (IntegralLattices 7E).
2. Compare the skew-orthonormal metric with the pinned Chevalley basis of the split form: toral directions contribute 1, each pair of short-root generators 2 (odd rank only), long roots 1; transport u_i = (e_{2i−1} + ie_{2i})/2, v_i = (e_{2i−1} − ie_{2i})/2.
3. Simplify with Γ recurrence and Γ(1/2) = √π to the factorial products.

**Checks.**

- V_2 = 2π, V_3 = 8π², V_4 = 16π⁴; the gauge volume in rank 3 is 4π² = 1/γ_odd(1).
- γ_odd(1) = 1/(4π²), γ_odd(2) = 6/(2π)⁶, γ_even(2) = 1/(2π)⁴.
- dim SO(3) = 3, dim SO(4) = 6, dim SO(5) = 10.

**Direct prerequisites.** `Real.Gamma` (Mathlib); `EuclideanSpace.volume_ball` (Mathlib).

**Source.** Markus Kirschmer, *One-class genera of maximal integral quadratic forms*, Theorem 3.3, p.4: Defines dim G and γ_G in the two parities. Wee Teck Gan, Jonathan Hanke and Jiu-Kang Yu, *On an exact mass formula of Shimura*, §2, pp.102–105, and §7, pp.118–120: The archimedean factor of the canonical measure and its relation to the compact volume.

<a id="good-place-volume-euler-product"></a>

### Euler products of the good local volumes

*Theorem* `good-place-volume-euler-product`

For a totally positive (V,Q) of dimension m ≥ 3 over a totally real K and a maximal lattice Λ, at every finite place p of type 0 the stabilizer volume for the unnormalized Tamagawa gauge is vol(K_p) = q^{−dim G}|Ḡ(k_p)| = ∏_{i=1}^r(1 − q^{−2i}) for m = 2r + 1, and (1 − χ(p)q^{−r})∏_{i=1}^{r−1}(1 − q^{−2i}) for m = 2r, where χ is the quadratic character of K(√disc Q)/K (χ = 1 when disc Q is a square). The products over p converge absolutely. The Euler products of the reciprocal type-0 volumes, completed by the same Euler factors at the finitely many places of nonzero type (whose actual volumes the factors λ_p correct), are ∏_{i=1}^r ζ_K(2i) (m odd), ζ_K(r)∏_{i=1}^{r−1}ζ_K(2i) (m even, square discriminant) and (ζ_E(r)/ζ_K(r))∏_{i=1}^{r−1}ζ_K(2i) (otherwise, E = K(√disc Q)), all at integers ≥ 2, so no analytic continuation is needed. In the last case Kirschmer's L(G) also carries the factor N_{K/Q}(d_{E/K})^{r−1/2}; it is not produced by this Euler product and enters, with d_K^{dim G/2}, through the comparison of the global Tamagawa measure with the local gauges (orthogonal-canonical-local-volume, AdelicAlgebraicGroups AA.2).

**Hypotheses and conventions.**

- m ≥ 3, so every zeta and L-value is at an integer ≥ 2 and lies in the region of absolute convergence.

**Proof outline.**

1. Count points of the reductive quotient at good places (finite-orthogonal-group-order).
2. Euler products: Tau Ceti dedekindZeta_eulerProduct_hasProd for Re s > 1 gives ζ_K(s) = ∏_p(1 − N(p)^{−s})^{−1}; ζ_E/ζ_K = ∏_p(1 − χ(p)N(p)^{−s})^{−1} by the splitting of primes in E/K.
3. Absolute convergence because each factor is 1 + O(N(p)^{−2}).

**Checks.**

- m = 3, K = Q: ∏_p(1 − p^{−2})^{−1} = ζ(2) = π²/6.
- m = 4 with square discriminant: r = 2 and L(G) = ζ_K(2)·ζ_K(2) = ζ_K(2)².
- The binary case m = 2 would need ζ-type values at 1 and is excluded.

**Direct prerequisites.** [Orders of finite orthogonal groups](#finite-orthogonal-group-order); [Local mass factors of maximal lattices](#maximal-local-mass-factor); `TauCeti.dedekindZeta_eulerProduct_hasProd` (Tau Ceti).

**Source.** Markus Kirschmer, *One-class genera of maximal integral quadratic forms*, Theorem 3.3, p.4, and the remark after it: States L(G) with zeta values at positive integers and notes the GHY form at negative integers. Wee Teck Gan, Jonathan Hanke and Jiu-Kang Yu, *On an exact mass formula of Shimura*, §7, (7.2)–(7.3) and Propositions 7.4–7.5, pp.118–119: Expresses the mass of the maximal lattices through Proposition 2.13, with L(M) given by zeta and L-values at negative integers (7.2), τ(G) = 2 (7.3) and the local factors λ_v (Propositions 7.4 for odd and 7.5 for even rank); Kirschmer's Theorem 3.3 restates the formula with values at integers ≥ 2.

<a id="quadratic-weil-operators"></a>

### Weil operators of a quadratic space (rank one)

*Construction* `quadratic-weil-operators`

For a nondegenerate quadratic space (V,Q) of dimension m over a number field K, a nontrivial character ψ of 𝔸_K/K and the self-dual measures, the adelic Schwartz–Bruhat space 𝒮(V(𝔸_K)) carries the operators: multiplication by ψ(bQ(x)) (b ∈ 𝔸), normalized dilation φ ↦ |a|^{m/2}φ(ax) (a ∈ 𝔸^×), and Fourier transform for the polar pairing of Q. They generate a central extension of SL_2(𝔸_K) (the metaplectic group when m is odd) acting on 𝒮(V(𝔸)); it splits over SL_2(K), and the theta distribution Θ(φ) = Σ_{x∈V(K)}φ(x) is invariant under the rational elements. Orthogonal transformations commute with the action.

**Hypotheses and conventions.**

- m ≥ 1; the action is projective (a genuine representation of the central extension), not a representation of SL_2(𝔸) for odd m.

**Proof outline.**

1. Define the three families of operators locally and check the Weil relations at each place (Gaussian integrals give the Weil index).
2. The global splitting over SL_2(K) follows from Poisson summation for the lattice V(K) ⊂ V(𝔸) and the product formula for the Weil indices.
3. Θ-invariance: invariance under multiplication operators with b ∈ K and dilations with a ∈ K^× is direct; invariance under Fourier transform is Poisson summation.

**Uses.** GN.3 rank-one-siegel-weil: the theta distribution integrated over the orthogonal quotient; HankeAWS §4.3: the Weil representation as the source of theta lifts.

**API.**

- `adelicSchwartzBruhat` (data): 𝒮(V(𝔸_K)) as the restricted tensor product of local Schwartz spaces.
- `quadraticWeilOperators` (data): The operators of multiplication, dilation and Fourier transform.
- `quadraticWeilOperators_relations` (relation): The Weil relations of SL_2 up to the central extension.
- `quadraticWeilOperators_rationalSplitting` (characterisation): The extension splits over SL_2(K).
- `thetaDistribution_invariant` (characterisation): Θ(ωφ) = Θ(φ) for the rational elements ω.
- `quadraticWeilOperators_orthogonal` (functoriality): Orthogonal transformations commute with the operators.

**Unit tests.**

- `weilMultiplication_zero` (degenerate): Multiplication by ψ(0·Q) is the identity.
- `weilFourier_sq` (characterisation): The square of the Fourier operator is φ ↦ φ(−·).
- `thetaDistribution_dilation` (non-example): Θ is invariant under x ↦ ax for a ∈ K^×, not for general a ∈ 𝔸^×.
- `weilFourier_two_point` (computation): On the two-point group with pairing (x,y) ↦ (−1)^{xy}, the Fourier matrix is 2^{−1/2}[[1,1],[1,−1]], whose square is the identity.

**Checks.**

- At b = 0 the multiplication operator and at a = 1 the dilation are the identity.
- Applying the self-dual Fourier transform twice gives φ(−x).
- Θ is invariant under dilation by a ∈ K^× but not by general a ∈ 𝔸^×.

**Direct prerequisites.** `QuadraticMap` (Mathlib); `AdelicAlgebraicGroups:AA.0`.

**Source.** André Weil, *Sur certains groupes d'opérateurs unitaires*, §13, p.160; Theorem 2 with Corollaries 1–2, §14, pp.161–162; §40 (38), pp.191–193; Theorem 6, §41, pp.193–194; Proposition 9, §51, p.210 (Acta Math. 111, 1964); re-read in this review in the scanned journal pages: Constructs the operators of multiplication, dilation and Fourier transform and the metaplectic extension for a vector space over a local field and over the adeles (§§13–14, Theorem 2 with its corollaries), and proves (Theorem 6) that the theta function Σ_{ξ∈X_k}(SΦ)(ξ) is continuous on the adelic metaplectic group and invariant under the rational elements; the operators of this node are the restriction to SL_2 × O(Q).

<a id="quadratic-fiber-distribution"></a>

### Fibre measures of a quadratic form

*Construction* `quadratic-fiber-distribution`

For a nondegenerate quadratic space of dimension m > 4 over a local field (or the adeles), and t in the field, the fibre measure dx/dQ on {x ≠ 0 : Q(x) = t} defines a distribution φ ↦ F_φ(t); F_φ is continuous in t (including t = 0 on the nonsingular locus) and its Fourier transform in t is b ↦ ∫φ(x)ψ(bQ(x))dx. It is invariant under O(Q), scales as F_{φ∘a}(t) = |a|^{2−m}F_φ(a²t), and its adelic product converges, with the good-place factors deviating from 1 by O(q^{−2}) for m > 4.

**Hypotheses and conventions.**

- m > 4.
- No atom at x = 0 is included.

**Proof outline.**

1. Push forward the measure dx by Q and apply Fourier inversion; integrability of b ↦ ∫φψ(bQ) follows after diagonalization from the one-dimensional Gaussian estimates with decay |b|^{−m/2}, m/2 > 2.
2. Scaling and invariance from the change of variables.
3. Good places: the fibre volume of the integral lattice is a normalized point count of the smooth quadric over the residue field.

**Uses.** GN.3 rank-one-siegel-weil: the Fourier coefficients of the Eisenstein distribution; GN.3 siegel-main-theorem: the local fibre integrals are the local representation densities.

**API.**

- `quadraticFiberDistribution` (data): φ ↦ F_φ(t).
- `quadraticFiberDistribution_fourier` (characterisation): Its Fourier transform in t is b ↦ ∫φψ(bQ).
- `quadraticFiberDistribution_scale` (relation): F_{φ∘a}(t) = |a|^{2−m}F_φ(a²t).
- `quadraticFiberDistribution_invariant` (functoriality): Invariance under O(Q).
- `quadraticFiberDistribution_density` (compatibility): At a finite place and φ the characteristic function of an integral lattice, F_φ(t) is the representation density of t.

**Unit tests.**

- `fiber_negative_definite_empty` (degenerate): For Q positive definite over ℝ and t < 0, F_φ(t) = 0.
- `fiber_zero_no_atom` (non-example): For Q positive definite over ℝ, F_φ(0) = 0, so the distribution is not δ_0-weighted.
- `fiber_scale_five` (computation): For m = 5, scaling by a gives the factor |a|^{−3}.
- `fiber_density_compat` (compatibility): For φ = 1_{Z_p^m} and Q unimodular, F_φ(t) = β(Z_p^m, t) of quadratic-local-density.

**Checks.**

- For a positive definite real form the fibre over t < 0 is empty and F_φ(t) = 0.
- At t = 0 over the reals with positive definite Q the nonsingular fibre is empty and F_φ(0) = 0, although the delta at 0 is not zero.
- Scaling five coordinates by a gives |a|^{−3}, not |a|^{−5}.

**Direct prerequisites.** [Weil operators of a quadratic space (rank one)](#quadratic-weil-operators); [Local representation densities of quadratic lattices](#quadratic-local-density).

**Source.** André Weil, *Sur la formule de Siegel dans la théorie des groupes classiques*, Proposition 1, §2, pp.6–7; Proposition 6, §37, p.54; §§42–43, pp.60–62; Theorem 2, §44, pp.62–63 (Acta Math. 113, 1965); locator carried from the GN package Layer 3, not re-read in this job: Defines the fibre distributions, proves continuity and the Fourier description, and the convergence of their adelic products for m > 4.

<a id="rank-one-siegel-weil"></a>

### Siegel–Weil formula for quadratic spaces of dimension > 4

*Theorem* `rank-one-siegel-weil`

For a nondegenerate quadratic space (V,Q) of dimension m > 4 over a number field K and φ ∈ 𝒮(V(𝔸)), the theta integral ∫_{SO(Q)(K)\SO(Q)(𝔸)} Θ(g·φ) dg, with the invariant probability measure, equals the Eisenstein distribution E(φ) = φ(0) + Σ_{t∈K}F_φ(t) evaluated through the rational Weil operators, both sides being absolutely convergent and continuous in φ.

**Hypotheses and conventions.**

- m > 4 (absolute convergence; the parabolic exponent m/4 > 1).

**Proof outline.**

1. Absolute convergence of the theta integral by reduction theory (AdelicAlgebraicGroups AA.3) and of the Eisenstein series by the lattice height count.
2. Both sides are SL_2(K)-invariant distributions with the same constant term; the difference is a scalar multiple of the canonical fibre measure on each fibre, by orthogonal transitivity at a good place.
3. Dilation towards 0 shows the scalar vanishes (exponent −m/2 + 2 < 0 against boundedness on the reduced domain).

**Checks.**

- For a positive definite form over Q and φ = 1_{L̂}·(Gaussian), the m-th Fourier coefficient of both sides is the genus representation number, giving siegel-main-theorem.
- The zero coefficient matches because the measure has total mass 1.
- In dimension ≤ 4 the identity requires regularization and is not claimed here.

**Direct prerequisites.** [Weil operators of a quadratic space (rank one)](#quadratic-weil-operators); [Fibre measures of a quadratic form](#quadratic-fiber-distribution); `AdelicAlgebraicGroups:AA.3`.

**Source.** André Weil, *Sur la formule de Siegel dans la théorie des groupes classiques*, Theorems 1–3, §§40–44, pp.57–63; Theorem 4, §50, pp.72–74; Proposition 8, §51, pp.75–76; Theorem 5 and proof, §52, pp.76–80; locator carried from the GN package Layer 3, not re-read in this job: Proves the Siegel formula in Weil's adelic form for m > 4. Jonathan Hanke, *Quadratic forms and automorphic forms (notes from the 2009 Arizona Winter School)*, §2.5, pp.32–34: States the classical Siegel formulas and that Weil's representation-theoretic proof covers positive definite forms in n ≥ 5 variables.

<a id="orthogonal-tamagawa-stabilizer"></a>

### Tamagawa numbers of SO(Q) and of vector stabilizers

*Theorem* `orthogonal-tamagawa-stabilizer`

For a nonzero vector in a quadratic space of dimension m > 4 over a number field, the group SO(Q) and the connected stabilizer of the vector have the same Tamagawa number for compatible gauges: a nonisotropic stabilizer is SO of the orthogonal complement, an isotropic stabilizer is SO of the rank m − 2 residual form extended by a unipotent group of Tamagawa number 1.

**Hypotheses and conventions.**

- m > 4.

**Proof outline.**

1. Unfold the rational orbit of the vector in the Siegel–Weil identity of rank-one-siegel-weil and compare the quotient gauge with dx/dQ.
2. The unipotent radical has Tamagawa number 1 (AdelicAlgebraicGroups AA.2.4 conventions).

**Checks.**

- For Q_5 = ⟨1,1,1,1,−1⟩ over Q the vector (0,0,0,1,1) is isotropic and the residual form is ⟨1,1,1⟩.
- A nonisotropic vector of ⟨1,1,1,1,1⟩ has stabilizer SO(⟨1,1,1,1⟩).
- The convergence factors on both sides are the same, so no correction term appears.

**Direct prerequisites.** [Siegel–Weil formula for quadratic spaces of dimension > 4](#rank-one-siegel-weil); `AdelicAlgebraicGroups:AA.2`.

**Source.** André Weil, *Sur la formule de Siegel dans la théorie des groupes classiques*, §§53–54, pp.80–82, especially (43); locator carried from the GN package Layer 3, not re-read in this job: Compares Tamagawa numbers of the orthogonal group and of the stabilizers by unfolding.

<a id="quaternion-adjoint-tamagawa"></a>

### Tamagawa number of PGL_1 of a quaternion algebra

*Theorem* `quaternion-adjoint-tamagawa`

For a quaternion algebra D over a number field, τ(SL_1(D)) = 1 and τ(PGL_1(D)) = 2.

**Hypotheses and conventions.**

- Tamagawa measures as in AdelicAlgebraicGroups AA.2.4.

**Proof outline.**

1. τ(SL_1(D)) = 1 from the residue of the zeta function of D and Poisson summation (Voight 29.10).
2. The reduced norm maps D^× onto the elements positive at ramified real places (Hasse–Schilling, Voight Main Theorem 14.7.4); Hilbert 90 removes lifting obstructions in 1 → G_m → GL_1(D) → PGL_1(D) → 1.
3. The character index of the reduced norm on the centre is 2, which gives τ(PGL_1(D)) = 2τ(GL_1(D))/τ(G_m) = 2.

**Checks.**

- D = M_2(Q): τ(PGL_2) = 2 and τ(SL_2) = 1.
- The factor 2 is a character index, not the order of the kernel μ_2.
- τ(G_m) = 1 (AA.2.4).

**Direct prerequisites.** base packet `GN.2/quaternionic-integral-hermitian-data`; `AdelicAlgebraicGroups:AA.2`.

**Source.** John Voight, *Quaternion algebras*, Main Theorem 29.10.1, p.516; Theorem 29.10.20, p.520; Theorem 29.11.3 and proof, pp.524–525; Main Theorem 14.7.4, pp.226–227: Main Theorem 29.10.1 and Theorem 29.10.20 give the residues of the idelic zeta functions of a division algebra and of M_2(F); Theorem 29.11.3 deduces τ^{(1)}(B^×\B^{(1)}) = ζ*_F(1) and τ(SL_1(B)) = 1; Main Theorem 14.7.4 is the Hasse–Schilling norm theorem. The value τ(PGL_1(B)) = 2 is not stated there; it is the deduction of the proof outline (open input).

<a id="orthogonal-tamagawa-two"></a>

### τ(SO(Q)) = 2

*Theorem* `orthogonal-tamagawa-two` — planet: **Tamagawa number of SO(Q)**

For every nondegenerate quadratic space of dimension m ≥ 3 over a number field, the Tamagawa number of SO(Q) is 2.

**Hypotheses and conventions.**

- m ≥ 3; for m ≤ 2 the group is a torus or trivial and the value differs.

**Proof outline.**

1. m = 3: SO(Q) is the adjoint group of the quaternion algebra C_0(Q): Spin(Q) = SL_1(C_0(Q)) (OrthogonalSpinGroups 1F identifies Spin(Q) with the unitary group of C_0(Q) for its canonical involution in dimension ≤ 5) and SO(Q) = Spin(Q)/μ_2 ≅ PGL_1(C_0(Q)), so quaternion-adjoint-tamagawa gives 2.
2. m = 4: for Q = Q_3 ⊕ ⟨a⟩, the rank-5 form Q ⊕ ⟨−a⟩ ≅ Q_3 ⊕ H has a nonisotropic vector with complement Q and an isotropic one with residual form Q_3; orthogonal-tamagawa-stabilizer identifies both Tamagawa numbers with the rank-5 value.
3. m ≥ 5: descend by nonisotropic vectors with orthogonal-tamagawa-stabilizer.

**Checks.**

- Anisotropic and split rank-3 forms both give 2.
- SO_1 is trivial with τ = 1, so m ≥ 3 is essential.
- For Q_4 = ⟨1,1,1,1⟩ over Q, Q_5 = ⟨1,1,1,1,−1⟩ has the isotropic vector (0,0,0,1,1); Q_4 itself has none.

**Direct prerequisites.** [Tamagawa number of PGL_1 of a quaternion algebra](#quaternion-adjoint-tamagawa); [Tamagawa numbers of SO(Q) and of vector stabilizers](#orthogonal-tamagawa-stabilizer).

**Source.** André Weil, *Sur la formule de Siegel dans la théorie des groupes classiques*, §§53–54, pp.80–82; locator carried from the GN package Layer 3, not re-read in this job: Deduces τ(SO) from the Siegel formula and the stabilizer comparison. Markus Kirschmer, *One-class genera of maximal integral quadratic forms*, Theorem 3.3, p.4: Uses τ(G) = 2 in the exact mass formula.

<a id="hermitian-genus-mass"></a>

### Genus double cosets and the mass of a hermitian genus

*Definition* `hermitian-genus-mass`

Let L/K be a CM extension with K totally real and (W, h) a totally positive definite hermitian space over L. For a projective hermitian O_L-lattice M in W with integral stabilizer Stab(M) ⊂ U(𝔸_{K,f}), the isometry classes of lattices in the genus of M are in bijection with U(K)\U(𝔸_{K,f})/Stab(M); the class set is finite and each automorphism group is finite. The mass of the genus is mass(C) = Σ_{[M′] ∈ C}1/|Aut(M′)|, a positive rational number.

**Hypotheses and conventions.**

- Lattices are projective, not necessarily free; the bijection is with all projective lattices of the genus, not with free Gram matrices unless the Steinitz obstruction vanishes.

**Proof outline.**

1. The adelic stabilizer action on the genus is transitive by definition of the genus (local isometries); rational orbits are global isometry classes.
2. Finiteness of the class set and of Aut(M′): restrict scalars to a positive definite Z-lattice (number-ring-trace-lattice applied to the trace of the hermitian form) and use IntegralLattices 2C, 2G, or AA.3.4 class number finiteness.
3. Define the mass as a finite sum.

**Uses.** LT2018 §5.4: the mass of unimodular hermitian lattices bounds the number of principally polarized abelian varieties in an isogeny class; GN.3 unitary-tamagawa-mass-formula: the mass is computed by Tamagawa measures.

**API.**

- `hermitianGenusMass` (data): mass(C) = Σ 1/|Aut(M′)|.
- `hermitianGenus_doubleCoset` (equivalence): Classes in the genus ↔ U(K)\U(𝔸_f)/Stab(M).
- `hermitianGenusMass_pos` (characterisation): The mass is positive.
- `hermitianGenus_finite` (characterisation): The class set is finite.
- `hermitianGenusMass_le_card` (relation): mass(C) ≤ |C|.

**Unit tests.**

- `hermitianGenusMass_one_class` (computation): A one-class genus with |Aut| = 2 has mass 1/2.
- `hermitianGenusMass_gaussian` (computation): For Q(i) and the unit form on O_L, the mass is 1/4.
- `hermitianGenus_projective` (non-example): The double-coset count includes projective nonfree lattices, so it can exceed the number of free Gram classes.
- `hermitianGenusMass_rankZero` (degenerate): The rank-zero genus has one class with trivial automorphism group and mass 1.

**Checks.**

- One class with two automorphisms gives mass 1/2.
- For L = Q(i), W = L with h = x x̄ and M = O_L: Aut(M) = μ_4, mass 1/4.
- The mass counts nonfree projective lattices as well.

**Direct prerequisites.** [The trace Z-lattice of a lattice over a totally real field](#number-ring-trace-lattice); `AdelicAlgebraicGroups:AA.3`; base packet `GN.2/integral-hermitian-lattice`.

**Source.** Michael Lipnowski and Jacob Tsimerman, *How large is A_g(F_q)?*, §5.3, (37), p.26, and §5.4, (38) and Remark 5.7, p.27 (arXiv:1511.02212v1): Identifies the genus of a hermitian lattice with the unitary double coset space and defines its mass; Remark 5.7 notes that projective nonfree lattices are included.

<a id="unitary-tamagawa-mass-formula"></a>

### Mass of a definite hermitian genus via Tamagawa measures

*Theorem* `unitary-tamagawa-mass-formula`

For a definite unitary group U of a nondegenerate hermitian space over a CM extension L/K and a lattice M with stabilizer K_M (archimedean compact factors included), mass(genus of M) = τ(U)/vol_Tam(K_M) with τ(U) = 2. For self-dual M, the inverse stabilizer volume is c(M)·|D_{K/Q}|^{n²/2}·∏_{v finite}β_{M_v}^{−1}-type local factors with c(M) = (∏_{d=1}^n (d−1)!/(2π)^d)^{[K:Q]}·|N_{K/Q}(D_{L/K})|^{n(n+1)/4}, the local factors β_{M_v} being the normalized unitary (L_v/K_v unramified) or orthogonal (ramified) reductive-quotient orders (Lipnowski–Tsimerman (39), from Gan–Yu Theorem 10.20).

**Hypotheses and conventions.**

- Definite U; Tamagawa measure of AA.2.4; n = rank of M.
- The dyadic and ramified local factors of (39) are not used without Gan–Yu's §10.9 analysis; this node records that analysis as a gap.

**Proof outline.**

1. Unfold the volume of U(K)\U(𝔸) over the finite double coset space of hermitian-genus-mass: each class contributes vol(K_M)/|Aut|.
2. τ(U) = 2 for the unitary group of a hermitian space over a CM extension (its centre is the anisotropic norm-one torus, of Tamagawa number 2, and the derived group is simply connected of Tamagawa number 1).
3. Local volumes of self-dual stabilizers from smooth models (Gan–Yu); at unramified places they are normalized |U_n(k_v)|.

**Checks.**

- n = 1, L = Q(i), M = O_L: mass 1/4, and τ/vol gives 1/4 with the class number formula for Q(i).
- The archimedean factor for n = 1 is (0!/(2π))^{[K:Q]}.
- The local product converges only conditionally (anisotropic centre), so the order of the product over v is the natural one.

**Direct prerequisites.** [Genus double cosets and the mass of a hermitian genus](#hermitian-genus-mass); `AdelicAlgebraicGroups:AA.2`; `AdelicAlgebraicGroups:AA.3`.

**Source.** Michael Lipnowski and Jacob Tsimerman, *How large is A_g(F_q)?*, §5.4, (38)–(39), p.27: States the unitary Tamagawa mass formula with τ = 2 and the stabilizer volume of a self-dual hermitian lattice, citing Gan–Yu Theorem 10.20 and §10.9.

<a id="finite-subgroup-gln-bound"></a>

### Minkowski's bound for finite subgroups of GL_N(Z)

*Theorem* `finite-subgroup-gln-bound`

The largest order of a finite subgroup of GL_N(Z) is exp(N log N + O(N)) as N → ∞. Consequently, for a definite hermitian or quadratic lattice M of Z-rank N, log|Aut(M)| ≤ N log N + O(N).

**Hypotheses and conventions.**

- N ≥ 1.

**Proof outline.**

1. Upper bound: a finite subgroup injects into GL_N(F_p) for odd p (Minkowski's lemma); combining primes in suitable residue classes bounds the p-adic valuation of the order, and summing with Σ_{p≤N}log p/p = log N + O(1) gives N log N + O(N).
2. Lower bound: the signed permutation matrices have order 2^N N!.

**Checks.**

- N = 1: the maximal finite subgroup is {±1}, of order 2.
- N = 2: the maximal order is 12 (the hexagonal lattice).
- Signed permutations give 2^N N!, which is exp(N log N + O(N)).

**Direct prerequisites.** `Matrix.GeneralLinearGroup` (Mathlib).

**Source.** Michael Lipnowski and Jacob Tsimerman, *How large is A_g(F_q)?*, Lemma 5.8 and proof, p.30: States and proves the Minkowski–Schur–Serre bound.

<a id="mass-class-count-comparison"></a>

### From masses to class numbers

*Theorem* `mass-class-count-comparison`

For a finite nonempty genus C of definite lattices with 1 ≤ |Aut(M)| ≤ H for every class, mass(C) ≤ |C| ≤ H·mass(C). For rank-n hermitian O_L-lattices, H ≤ exp(N log N + O(N)) with N = n[L:Q], so log|C| = log mass(C) + O(N log N).

**Hypotheses and conventions.**

- C finite and nonempty.

**Proof outline.**

1. Each summand 1/|Aut| lies in [1/H, 1].
2. Forget the O_L-structure to embed Aut(M) in GL_N(Z) and apply finite-subgroup-gln-bound.

**Checks.**

- A genus of one class with |Aut| = 2: mass 1/2 ≤ 1 ≤ 2·(1/2).
- A bound on the mass alone does not bound |C| above without H.
- If all |Aut| = 2 then |C| = 2·mass(C).

**Direct prerequisites.** [Genus double cosets and the mass of a hermitian genus](#hermitian-genus-mass); [Minkowski's bound for finite subgroups of GL_N(Z)](#finite-subgroup-gln-bound).

**Source.** Michael Lipnowski and Jacob Tsimerman, *How large is A_g(F_q)?*, §5.4.4, (52)–(53), pp.30–31: Passes from the mass to the class number with the automorphism bound.

<a id="unimodular-hermitian-mass-asymptotic"></a>

### Growth of the mass of unimodular hermitian lattices

*Theorem* `unimodular-hermitian-mass-asymptotic`

Let p be a prime, L a CM field generated by a p-Weil number with totally real subfield K, n ≥ 1, and C_σ a genus of unimodular hermitian O_L-lattices of rank n. Then log mass(C_σ) = (1/2)[K:Q]n² log n + O_p([K:Q]²n²), and log|C_σ| satisfies the same estimate. The coefficient is (1/2)[K:Q], not the printed [K:Q]: Σ_{d=1}^n log((d−1)!) = (1/2)n² log n − (3/4)n² + O(n log n).

**Hypotheses and conventions.**

- p-Weil numbers have all conjugates of absolute value √p; the discriminant bound N_{K/Q}(D_{L/K}) ≤ (4p)^{[K:Q]} (corrected factor 4) and the count of ramified primes ≤ [K:Q]log(4p)/log 2 enter the error term.

**Proof outline.**

1. Take logarithms in unitary-tamagawa-mass-formula: the archimedean factor contributes [K:Q]Σ_d log((d−1)!) and the discriminant and local factors O_p([K:Q]²n²).
2. Evaluate Σ_d log((d−1)!) by comparison with integrals.
3. Pass to class numbers with mass-class-count-comparison.

**Checks.**

- n = 1: the main term vanishes and log mass = O_p([K:Q]²).
- Σ_{d=1}^n log((d−1)!) at n = 3 is log 1 + log 1 + log 2 = log 2.
- The printed coefficient [K:Q] contradicts the factorial product displayed in the same paper (paper erratum E13).

**Direct prerequisites.** [Mass of a definite hermitian genus via Tamagawa measures](#unitary-tamagawa-mass-formula); [From masses to class numbers](#mass-class-count-comparison).

**Source.** Michael Lipnowski and Jacob Tsimerman, *How large is A_g(F_q)?*, §§5.4.1–5.4.4, (40)–(53), pp.27–31: Bounds the discriminants and local factors and states the mass asymptotic (with the printed leading coefficient corrected to 1/2).

<a id="model-ring-orbit-count"></a>

### Positive unit orbit counts on model rings

*Definition* `model-ring-orbit-count`

For CM fields L_1,…,L_k with totally real subfields K_i and positive integers n_i with Σ_i n_i[K_i:Q] = g, the model ring is R_{L,n} = ∏_i M_{n_i}(O_{L_i}) with conjugate-transpose involution ∗. The orbit count n_{L,n} is the number of R_{L,n}^×-orbits on positive self-adjoint units a ∈ R_{L,n}^× under a ↦ g∗ag. If every L_i is generated by a p-Weil number for one fixed p, then log n_{L,n} ≤ (1/2)Σ_i[K_i:Q]n_i² log n_i + O_p(g²), with equality up to O_p(g²) when every class group Cl(O_{L_i}) is trivial.

**Hypotheses and conventions.**

- Positive means totally positive definite at every archimedean place; the action is congruence g∗ag, not conjugation.
- The printed (55) has leading coefficient 1 and bounds n_{L,n} instead of log n_{L,n} (paper erratum E13).

**Proof outline.**

1. Orbits of positive units correspond to isometry classes of free unimodular hermitian lattices of the factors; bound by the masses of unimodular genera (unimodular-hermitian-mass-asymptotic) and the number of genera.
2. Equality when class groups are trivial: every unimodular lattice is free.

**Uses.** LT2018 §5: the number of principal polarizations on an abelian variety with given endomorphism data; GN.3 unimodular-hermitian-mass-asymptotic: the orbit count is controlled by the mass.

**API.**

- `modelRing` (data): R_{L,n} with its involution.
- `positiveUnitOrbitCount` (data): n_{L,n}.
- `positiveUnitOrbitCount_finite` (characterisation): The set of orbits is finite.
- `positiveUnitOrbitCount_prod` (relation): n_{L,n} is the product of the counts of the factors.
- `log_positiveUnitOrbitCount_le` (relation): The upper bound with leading coefficient 1/2.

**Unit tests.**

- `modelRing_one_positive` (computation): 1 is a positive self-adjoint unit.
- `modelRing_singular_excluded` (non-example): diag(1, 0) is positive semidefinite but not a unit, so it is not counted.
- `positiveUnitOrbitCount_gaussian` (degenerate): For Q(i) and n = 1 the count is 1.
- `positiveUnitOrbitCount_congruence` (characterisation): The orbit of a is {g∗ag}, which for scalars a, g ∈ O_L^× is a·N(g); conjugation g a g^{−1} would fix a.

**Checks.**

- The identity of R_{L,n} is a positive unit.
- A singular positive semidefinite matrix is not a unit and is excluded.
- For k = 1, n_1 = 1, L_1 = Q(i): positive units are 1, one orbit.

**Direct prerequisites.** [Genus double cosets and the mass of a hermitian genus](#hermitian-genus-mass); [Growth of the mass of unimodular hermitian lattices](#unimodular-hermitian-mass-asymptotic).

**Source.** Michael Lipnowski and Jacob Tsimerman, *How large is A_g(F_q)?*, Definition 5.1 and Conjecture 5.2, p.24; §5.4.5, (55), p.31: Defines n_{L,n} and bounds it through the unitary mass formula.

<a id="punctual-hilbert-count"></a>

### Finite-colength ideals of a power series ring (Yun)

*Definition* `punctual-hilbert-count`

For a complete discrete valuation ring O with residue field F_q, Hilb^j(O[[X]]) is the set of ideals I ⊂ O[[X]] with O-length(O[[X]]/I) = j. Then #Hilb^j = Σ_{λ ⊢ j} q^{j − length(λ)}; in particular #Hilb^j ≤ (2q)^j, H_Q(j) = Σ_{λ⊢j}Q^{j−length λ} ≤ (Q + 1)^{j−1} for j ≥ 1 and Σ_{j=0}^a H_Q(j) ≤ (Q + 1)^a.

**Hypotheses and conventions.**

- O complete DVR with finite residue field; j ≥ 0.

**Proof outline.**

1. Initial ideals: each I has an initial monomial ideal indexed by a partition μ of j with the same colength; the lifts of I_μ number q^{|μ|−μ_0}; transpose partitions to obtain the formula (Yun Proposition 4.13).
2. Bounds: inject partitions into compositions and sum the weights with the binomial theorem; j = 0 separately.

**Uses.** LT2018 §3.1: counting lattices stable under a semisimple endomorphism over Z_ℓ; GN.3 local-lattice-orbit-bounds: the rank-one local class bound.

**API.**

- `punctualHilbertCount` (data): #Hilb^j(O[[X]]).
- `punctualHilbertCount_eq` (characterisation): #Hilb^j = Σ_{λ⊢j} q^{j − length λ}.
- `punctualHilbertCount_le` (relation): #Hilb^j ≤ (2q)^j.
- `weightedPartitionSum_le` (relation): Σ_{j≤a}H_Q(j) ≤ (Q+1)^a.

**Unit tests.**

- `punctualHilbertCount_zero` (degenerate): #Hilb^0 = 1 (the whole ring).
- `punctualHilbertCount_two` (computation): #Hilb^2 = q + 1.
- `punctualHilbertCount_length_over_O` (non-example): The ideal (X, ϖ²) has O-colength 2 although its F_q-colength in the special fibre is 1.
- `punctualHilbertCount_one` (computation): #Hilb^1 = 1, the ideal (ϖ, X).

**Checks.**

- j = 0, 1, 2 give 1, 1, q + 1.
- The length is measured over O, not over F_q.
- A residue-field extension of degree f replaces q by q^f.

**Direct prerequisites.** `IsDiscreteValuationRing` (Mathlib); `PowerSeries` (Mathlib); `Module.length` (Mathlib).

**Source.** Michael Lipnowski and Jacob Tsimerman, *How large is A_g(F_q)?*, §3.1.5, pp.9–10 (arXiv:1511.02212v1): Bounds the number of local orders/ideals through Yun's partition formula; the weak-composition estimate (13) there is replaced by the bound above. Zhiwei Yun, *Orbital integrals and Dedekind zeta functions*, Lemma 4.9, p.15; §4.12 and Proposition 4.13 with proof, pp.16–17 (arXiv:1303.2420v2), checked in this review: Proves #Hilb^j(O_F[[X]]) = Σ_{|λ|=j} q^{j−ℓ(λ)} through initial ideals (Proposition 4.13) and uses #Hilb^j_R ≤ #Hilb^j(O_F[[X]]) for the quotient R (§4.12), after reducing to elliptic γ with residue field that of O_F.

<a id="local-lattice-orbit-bounds"></a>

### Local orbit counts of lattices stable under a semisimple endomorphism

*Theorem* `local-lattice-orbit-bounds`

Let ℓ be prime, O = Z_ℓ, γ an integral semisimple endomorphism of K^N (K = Q_ℓ) with characteristic polynomial ∏_i f_i^{n_i} (distinct monic irreducible f_i), δ_i = v_ℓ(disc f_i), ρ_ij = v_ℓ(Res(f_i,f_j)) and Δ = Σ_i n_i²δ_i + 2Σ_{i<j}n_in_jρ_ij. (1) The number of F^×-orbits of full R-lattices in F = K[X]/f is at most ℓ^{2δ}, for R = O[X]/f with δ = v_ℓ disc f. (2) The number of GL_n(F)-orbits of full R-lattices in F^n is at most ℓ^{(n(n−1)/2+2n)δ}. (3) The number of orbits under the centralizer of γ of full γ-stable lattices is at most ℓ^{Σ_i[n_i(n_i−1)/2+2n_i]δ_i + Σ_{i<j}n_in_jρ_ij} ≤ ℓ^{2Δ}. (4) For a monic integral polynomial of degree m with complex roots of absolute value √p and semisimple local realizations, the product over ℓ of these local orbit counts is at most D_*² ≤ (2√p)^{2m(m−1)}, with D_* the product of differences of ordered unequal root occurrences. (5) For every full γ-stable lattice M there is a conjugate H_M of ∏_iGL_{n_i}(O_{F_i}) containing Stab(M) with [H_M : Stab(M)] ≤ ℓ^{Σn_i²δ_i + Σ_{i<j}n_in_jρ_ij}.

**Hypotheses and conventions.**

- Semisimple γ; ℓ arbitrary.
- These bound local orbit counts, not rational adelic class sets.

**Proof outline.**

1. (1) Normalize SM = S for the maximal order S, divide by an S-unit to get R ⊆ M ⊆ S, and dualize to ideals of colength ≤ δ (punctual-hilbert-count).
2. (2) Induct with a coordinate flag, normalizing prefix and quotient by block-diagonal centralizers and shears; count parabolic orbits.
3. (3) The disjoint-spectrum Sylvester operator X ↦ γ_2X − Xγ_1 is invertible with determinant valuation n_in_jρ_ij (Yun Lemma 4.9), which bounds the extension fibres.
4. (4) D_* is a nonzero rational integer whose ℓ-valuation is Δ_ℓ; almost all local factors are 1.
5. (5) Build H_M from the saturations of the successive quotients pr_i(M ∩ V_{≤i}) (not from M ∩ V_i).

**Checks.**

- δ = 0 (étale R): every count is 1.
- N = 1, γ = a scalar: one orbit.
- For f = X² + ℓ² with ℓ ≡ 3 mod 4 (f irreducible, δ = v_ℓ(−4ℓ²) = 2), R = Z_ℓ[ℓi] has exactly two overorders, Z_ℓ[i] and R itself (Z_ℓ[ℓ²i] is not an R-module), and every R-lattice is principal for its multiplier ring, so there are two F^×-orbits, within the bound ℓ^4.

**Direct prerequisites.** [Finite-colength ideals of a power series ring (Yun)](#punctual-hilbert-count).

**Source.** Michael Lipnowski and Jacob Tsimerman, *How large is A_g(F_q)?*, §§3.1.1–3.1.6 and §3.2.1, (13)–(20), pp.5–12: Counts local orbits of lattices stable under a semisimple endomorphism and bounds integral stabilizers; the literal estimates are replaced by the corrected ones above. Zhiwei Yun, *Orbital integrals and Dedekind zeta functions*, Lemma 4.9, p.15 (arXiv:1303.2420v2), checked in this review: The fibres of the map from γ-stable lattices to their graded pieces along a flag have cardinality q^{ρ}, the resultant exponent of the disjoint spectra.

## 3F. Theta series

The theta series of a positive definite lattice with its coefficients, the mass-weighted genus average, and the Hecke Eisenstein average over a totally real field. Modularity of theta series is not part of this layer.

<a id="definite-lattice-theta-series"></a>

### Theta series of a positive definite lattice

*Construction* `definite-lattice-theta-series`

Let L be a positive definite integral Z-lattice (a TauCeti.IntegralLattice whose rational form B is positive definite). Its theta series is Θ_L(τ) = Σ_{x∈L} exp(πiτ B(x,x)) for τ in the upper half-plane. The sum converges absolutely and locally uniformly, Θ_L is holomorphic, and Θ_L(τ) = Σ_{m≥0} r_L(m) exp(πiτm) with r_L(m) = #{x ∈ L : B(x,x) = m} finite. For even L this is a power series in exp(2πiτ) with coefficients #{x : B(x,x)/2 = m}.

**Hypotheses and conventions.**

- B positive definite and integral on L.
- Modularity of Θ_L is not part of this construction.

**Proof outline.**

1. Realize L in Euclidean space by the positive Gram form; finite-gauge-sublevel gives finiteness of each shell.
2. Bound #{x : B(x,x) ≤ T} ≤ C(1 + T)^{n/2} by a packing argument, so the series is dominated on Im τ ≥ y_0 > 0 by Σ_m C(1+m)^{n/2} e^{−π y_0 m}.
3. Weierstrass M-test gives local uniform convergence and holomorphy; regrouping the absolutely convergent sum by shells gives the coefficient formula.

**Uses.** HankeAWS Theorem 2.5.1: the genus average of theta series is the Eisenstein part, whose coefficients are local density products; GN.3 theta-lattice-coefficient-interface (parent packet): the coefficient interface is this construction's coefficient theorem; Li2023 (3.23)–(3.24): theta series of definite lattices over totally real fields are averaged over a genus.

**API.**

- `latticeThetaSeries` (data): Θ_L(τ) = Σ_{x∈L} exp(πiτB(x,x)) as a function on the upper half-plane.
- `latticeThetaSeries_summable` (characterisation): Absolute and locally uniform summability on the upper half-plane.
- `latticeThetaSeries_differentiable` (characterisation): Θ_L is holomorphic.
- `latticeThetaSeries_coeff` (characterisation): Θ_L(τ) = Σ_m r_L(m)exp(πiτm) with r_L(m) the finite shell counts.
- `latticeThetaSeries_directSum` (relation): Θ_{L⊕M} = Θ_L·Θ_M.
- `latticeThetaSeries_rescale` (relation): Θ_{L(a)}(τ) = Θ_L(aτ) for an integer a > 0.
- `latticeThetaSeries_isometry` (functoriality): Isometric lattices have equal theta series.

**Unit tests.**

- `latticeThetaSeries_Z_coeff` (computation): For Z with B(x,y) = xy, r(1) = 2, r(2) = r(3) = 0, r(4) = 2.
- `latticeThetaSeries_Z2_coeff` (computation): For Z², r(1) = 4 and r(2) = 4.
- `latticeThetaSeries_rankZero` (degenerate): The zero lattice has Θ = 1.
- `latticeThetaSeries_jacobi` (compatibility): For Z with B(x,y) = xy, Θ_L(τ) = jacobiTheta τ (Mathlib's jacobiTheta τ = Σ_n exp(πi n² τ)).

**Checks.**

- For L = Z with B(x,y) = xy, the coefficients of q⁰, q¹, q², q³, q⁴ (q = e^{πiτ}) are 1, 2, 0, 0, 2.
- For L = Z² with the standard form, the coefficients of q and q² are 4 and 4.
- The rank-zero lattice has Θ = 1.

**Direct prerequisites.** base packet `GN.1/finite-gauge-sublevel`; `UpperHalfPlane` (Mathlib); `TauCeti.IntegralLattice` (Tau Ceti).

**Source.** Jonathan Hanke, *Quadratic forms and automorphic forms (notes from the 2009 Arizona Winter School)*, §2.1, Lemma 2.1.1 and Theorem 2.1.2, pp.25–26 (arXiv:1105.5759v3): Defines the theta series of a positive definite integer-valued form and proves absolute and locally uniform convergence to a holomorphic function on the upper half-plane from polynomial growth of the representation numbers. William Duke, *Hyperbolic distribution problems and half-integral weight Maass forms*, Introduction, p.74: Uses the theta series of a definite ternary lattice with its representation-number coefficients.

<a id="genus-theta-average"></a>

### Mass-weighted genus average of theta series

*Definition* `genus-theta-average`

For a positive definite integral Z-lattice L with genus classes [L_1],…,[L_h] (finite by IntegralLattices 2G), the genus theta series is Θ_gen(L) = (Σ_j Θ_{L_j}/|O(L_j)|)/(Σ_j 1/|O(L_j)|), and the genus representation number r_gen(L,m) is its m-th coefficient, the mass-weighted average of r_{L_j}(m). Both depend only on the genus.

**Hypotheses and conventions.**

- L positive definite; weights are reciprocal orders of the finite groups O(L_j) (IntegralLattices 2C).
- The average is weighted by 1/|O|, not uniform over classes.

**Proof outline.**

1. Sum over a finite set of class representatives; independence of the representatives because isometric lattices have equal theta series and equal automorphism orders.
2. The denominator is the mass of 7A of IntegralLattices (over Z) and is positive.

**Uses.** HankeAWS Theorem 2.5.1: the first of Siegel's two expressions of the Eisenstein part; GN.3 siegel-main-theorem: the left side of Siegel's formula.

**API.**

- `genusThetaAverage` (data): The weighted average of the theta series of the classes of the genus.
- `genusRepresentationNumber` (data): Its m-th coefficient r_gen(L,m).
- `genusThetaAverage_of_genus` (characterisation): Lattices in the same genus have the same genus theta average.
- `genusThetaAverage_oneClass` (simp): For a one-class genus the average is Θ_L.
- `genusRepresentationNumber_zero` (simp): r_gen(L,0) = 1.

**Unit tests.**

- `genusThetaAverage_Z3` (computation): For Z³ (one class) the coefficient of q¹ is 6.
- `genusRepresentationNumber_zero_test` (degenerate): r_gen(L, 0) = 1 for every L, including rank 0.
- `genusThetaAverage_not_uniform` (non-example): For a two-class genus whose classes have automorphism groups of different orders, the uniform average of the r_{L_j}(m) differs from r_gen(L,m) for some m.
- `genusThetaAverage_mass_compat` (compatibility): The denominator equals the mass Σ_j 1/|O(L_j)| of IntegralLattices 7A.

**Checks.**

- For a one-class genus (e.g. Z³, or E_8) Θ_gen(L) = Θ_L.
- For a genus with two classes whose automorphism groups have different orders, the weights 1/|O(L_j)| differ, so the uniform average of the two theta series is a different function.
- r_gen(L, 0) = 1.

**Direct prerequisites.** [Theta series of a positive definite lattice](#definite-lattice-theta-series); `TauCeti.IntegralLattice` (Tau Ceti).

**Source.** Jonathan Hanke, *Quadratic forms and automorphic forms (notes from the 2009 Arizona Winter School)*, Theorem 2.5.1, (2.5), p.33, and §2.6, p.34: Writes the Eisenstein part of Θ_Q as the mass-weighted genus average of theta series and defines the mass.

<a id="definite-unimodular-theta-average"></a>

### Siegel–Weil for definite unimodular lattices over a totally real field

*Theorem* `definite-unimodular-theta-average`

Let F be a totally real field and P a totally positive even Z-unimodular O_F-lattice of rank 2k with k even and k ≥ 4 (absolute convergence). With the invariant probability measure on the compact orthogonal adelic quotient, the theta integral of P is the normalized Hecke Eisenstein series E_{F,k}(τ) = Σ_{β ∈ P¹(F)}c(β,τ)^{−k} on ℍ^{[F:Q]}, where c(∞,τ) = 1 and c(β,τ) = A_β·Nm(τ + β) with A_β = Nm(c)/Nm(a) for β = d/c, Oc + Od = a; its constant coefficient is 1. On the finite genus class set the theta integral is Σ_h w_hθ_{P_h}/Σ_h w_h with w_h = 1/|O(P_h)|.

**Hypotheses and conventions.**

- F totally real; P totally positive, even and unimodular over Z (trace form); rank ≥ 8, or a direct-sum power, for absolute convergence.
- θ_{P^ℓ} = θ_P^ℓ, but E_{P^ℓ} ≠ E_P^ℓ in general.

**Proof outline.**

1. Apply rank-one-siegel-weil over F with φ the characteristic function of the adelic closure of P times the archimedean Gaussian.
2. Compute the Eisenstein side: unramified local factors at every finite place since P is unimodular, giving the Hecke series.
3. Unfold the theta integral over the finite class set with mass weights (parent node adelic-mass-identity).

**Checks.**

- F = Q, P = E_8, k = 4: the genus has one class and θ_{E_8} = E_4.
- The constant coefficient is 1 on both sides.
- Without mass weights the uniform class average is a different function whenever the automorphism orders differ.

**Direct prerequisites.** [Siegel–Weil formula for quadratic spaces of dimension > 4](#rank-one-siegel-weil); [Theta series of a positive definite lattice](#definite-lattice-theta-series); [Mass-weighted genus average of theta series](#genus-theta-average); base packet `GN.3/adelic-mass-identity`.

**Source.** Yingkun Li, *Algebraicity of higher Green functions at a CM point*, §3.2, (3.23)–(3.24), pp.399–400 (Invent. Math. 2023); (3.2.7)–(3.2.8), p.25 of arXiv:2106.13653v2: States the Siegel–Weil formula for a totally positive definite lattice P as E_P = c_K^{−1}Σ_h θ_P(·,h) over H(Q)\H(Q̂)/K with H = GSpin(V), printed with c_K the number of double cosets rather than with mass weights, and identifies E_P with the Hecke Eisenstein series of parallel weight r for P of rank 2r in U_F^+, citing Bogo–Li §2; the mass weights of this node come from rank-one-siegel-weil.

## Dependencies on other roadmaps

- `AdelicAlgebraicGroups:AA.3`: Real Siegel sets for GL_n(ℝ)/O(n) and SL_n(ℝ)/SO(n) with the (e,C)-reduced positive forms of AA.3.2 ('Reduced forms and Siegel sets'), and finiteness of class numbers and finite volume (AA.3.4) for SO(Q) and U(h) over number fields. Used by [Reduced Gram matrices lie in a Siegel set](#minkowski-reduced-siegel), [Siegel–Weil formula for quadratic spaces of dimension > 4](#rank-one-siegel-weil), [Genus double cosets and the mass of a hermitian genus](#hermitian-genus-mass), [Mass of a definite hermitian genus via Tamagawa measures](#unitary-tamagawa-mass-formula).
- `AdelicAlgebraicGroups:AA.2`: Gauge forms, Tamagawa measures and the Tamagawa number τ(G) = vol(G(F)\G(𝔸)^1) with τ(G_m) = 1 (AA.2.4), used for SO(Q), PGL_1(D) and unitary groups. Used by [Canonical local volumes of maximal-lattice stabilizers](#orthogonal-canonical-local-volume), [Tamagawa numbers of SO(Q) and of vector stabilizers](#orthogonal-tamagawa-stabilizer), [Tamagawa number of PGL_1 of a quaternion algebra](#quaternion-adjoint-tamagawa), [Mass of a definite hermitian genus via Tamagawa measures](#unitary-tamagawa-mass-formula).
- `AdelicAlgebraicGroups:AA.0`: Normalized local and adelic Haar measures and restricted products of Haar measures, for the adelic Schwartz–Bruhat space and the self-dual measures. Used by [Weil operators of a quadratic space (rank one)](#quadratic-weil-operators).
- `ReductiveGroupsPartII:RG2.3`: Smooth affine (parahoric) models of stabilizers of points of the building, their special fibres, unipotent radicals and reductive quotients, and schematic closure. Used by [Smooth integral models of maximal-lattice stabilizers](#smooth-maximal-orthogonal-model).

## Open inputs

- **Full induction for the full-type weighted identities without a_t ≥ 3.** Li–Zhang's Propositions 8.2.5 and 8.2.7 rely on existence lemmas (8.2.4, 8.2.6) that fail without a_t ≥ 3 (E303). A complete induction covering a_t ≤ 2 is not available from the source; the identities themselves were checked by brute force in small cases.
- **Dyadic and ramified local factors of the unitary mass formula.** Lipnowski–Tsimerman's (39) quotes Gan–Yu, Theorem 10.20 and §10.9, for the stabilizer volume of self-dual hermitian lattices at dyadic and ramified places. Gan–Yu's 'Group schemes and local densities' (Duke 2000) was not acquired in this job; the local factors at those places are taken from that theorem, unverified here.
- **Weil's Siegel formula and the Tamagawa chain not re-read in Weil 1965.** The locators in Weil 1965 are carried from the GN package Layer 3 (2026-10-09 fix pass); the publisher refuses scripted access and the paper was not re-read. The Weil 1964 locators (§13, p.160; §14, Theorem 2 with Corollaries 1–2, pp.161–162; §§40–41, (38) and Theorem 6, pp.191–194; §51, Proposition 9, p.210) were checked in the review. A follow-up must check the numbered statements of Weil 1965 and the m > 4 hypotheses at those locators.
- **Generic uniqueness of Minkowski-reduced bases.** Bhargava–Shankar–Wang use that a Minkowski-reduced basis of a generic lattice is unique up to signs. No primary proof was acquired; the node plans existence, sign invariance and the Siegel containment only, and the uniqueness statement is not a target until a source is fixed.
- **Minkowski's product inequality for reduced bases of real lattices.** The third condition of (e,C)-reduced forms needs ∏‖b_i‖² ≤ c_n det B for a Minkowski-reduced basis of a real lattice: the comparison of ‖b_i‖ with the i-th successive minimum (Minkowski, van der Waerden), followed by Minkowski's second theorem (GN.1 minkowski-second-upper). IntegralLattices 2G proves the bound for integral lattices; no node plans the real comparison and no primary source for it was read (Bhargava–Shankar–Wang assert the Siegel-set containment without proof).
- **The Tamagawa number of PGL_1 of a quaternion algebra is not sourced.** Voight Theorem 29.11.3 gives τ(SL_1(D)) = 1 and the volume of D^×\D^{(1)}; the passage to the adjoint group, τ(PGL_1(D)) = 2 (Ono's formula, or Weil's computation in Adeles and algebraic groups), is sketched in the proof outline and was not checked against a source.

## Misprints and errors in the sources

- **E301** (error; Chao Li and Wei Zhang, Corollary 3.6.2, p.20, authors' final version (arXiv:2106.15038)). The source asserts: The derivative difference ∂Den^ε(L) − ∂Den^ε(L̃) is given by a multiple of Den^{♭ε}(1,L^♭) in each case of χ(L^♭), including c = εχ(L^♭) = +1. Correction: For c = +1 the difference is −2(Den^{♭ε})′(1,L^♭); for c = 0 it is 2Den^{♭ε}(1,L^♭) and for c = −1 it is Den^{♭ε}(1,L^♭). Reason: Differentiating A(X) = X²B(X) + (1 − X²)D(X)/(1 − cX) at X = 1 with A(1) = B(1) = 0: for c = +1 the quotient is (1 + X)D(X) with D(1) = 0, whose derivative at 1 is 2D′(1), so the printed term (a multiple of D(1) = 0) loses it. (Recorded in the extraction of this paper as PAPER-LI-ZHANG-22/E8; no published correction found.)
- **E302** (error; Chao Li and Wei Zhang, Lemma 3.2.1, p.11 (simplified form)). The source asserts: The simplified closed formula for #O(U,V) is asserted for all U of dimension n ≤ m. Correction: Use the orbit–stabilizer count; the simplified expression fails for U = 0 with m even, where the count is 1. Reason: Brute force over F_3 (m ≤ 4) and F_5 (m ≤ 3): 160 of 166 configurations agree, the six exceptions being U = 0 with m even. (Recorded as PAPER-LI-ZHANG-22/E1; no published correction found.)
- **E303** (error; Chao Li and Wei Zhang, Lemmas 8.2.4 and 8.2.6, pp.56–59). The source asserts: For every non-maximal full-type L there is an index-q overlattice M with the relative identity μ_{0,+}(L,M) = μ_{0,−}(L,M) (t odd) or μ_+(L,M) + μ_0(L,M) = qμ_+(L,M) (t even). Correction: The existence holds when a_t ≥ 3 (case (i) of the proofs); case (ii), a_t = a_{t−1} = 2, needs the invariant-2 binary block to be isotropic modulo ϖ and fails otherwise; in general the claim fails. Reason: Counterexamples over Z_3: diag(3,3,9), diag(3,3) and diag(9,9) have no such index-3 full-type overlattice. (Recorded as PAPER-LI-ZHANG-22/E10; no published correction found.)
- **E304** (error; Michael Lipnowski and Jacob Tsimerman, §5.4.3, (51), p.30, and §5.4.5, (55), p.31 (arXiv:1511.02212v1)). The source asserts: The logarithm of the mass of unimodular hermitian lattices grows like [K:Q]n² log n, and n_{L,n} is bounded with leading coefficient 1. Correction: The leading coefficient is (1/2)[K:Q], and (55) bounds log n_{L,n}. Reason: The factorial product displayed in (39) gives Σ_{d=1}^n log((d−1)!) = (1/2)n² log n − (3/4)n² + O(n log n). (Recorded as PAPER-LIPNOWSKI-TSIMERMAN-18/E13; the published version was not collated.)
- **E305** (misprint; Michael Lipnowski and Jacob Tsimerman, §5.4.1, (41), p.27). The source asserts: The real absolute values of the discriminant of (1, π) are p sin²θ. Correction: They are 4p sin²θ, so N_{K/Q}(D_{L/K}) ≤ (4p)^{[K:Q]}. Reason: disc(1,π) = (π − π̄)² and |π − π̄| = 2√p|sin θ|. (Recorded in PAPER-LIPNOWSKI-TSIMERMAN-18 (relative-discriminant item); no published correction found.)
- **E306** (error; Qiao He, Chao Li, Yousheng Shi and Tonghai Yang, Lemma 9.6, pp.74–75, authors' final version). The source asserts: For L^♭ of rank n − 1 and x ∉ L^♭ ⊥ W there are L′^♭ and x′ with smaller val(L′^♭) and the same span. Correction: True when the top invariant a′_n of L^♭ + ⟨x⟩ is even; when a′_n is odd and a′_1 + … + a′_{n−1} = val(L^♭) − 1 every rank-(n−1) summand has even valuation ≥ val(L^♭). Reason: The proof shows a′_1 + … + a′_{n−1} < val(L^♭) via minors, which does not produce a summand of smaller valuation in a hyperbolic block of odd invariant. (Recorded as PAPER-HE-LI-SHI-ETAL-23/E7; no published correction found.)
- **E307** (error; Qiao He, Chao Li, Yousheng Shi and Tonghai Yang, (5.8), p.36, branch n even and ϵ = −1). The source asserts: A closed formula for c_{t_max} in both signs ϵ. Correction: Only the ϵ = +1 branch holds; c_t is defined by Corollary 5.10. Reason: The table of Example 5.11 covers χ(V) = +1 only; recomputation from Corollary 6.2 contradicts the other branch. (Recorded as PAPER-HE-LI-SHI-ETAL-23/E22; the paper presents (5.8) as observed, not proved.)
- **E308** (misprint; Tony Feng, Zhiwei Yun and Wei Zhang, Remark 2.4, p.581 (published version)). The source asserts: In the torsion-module form of the Cho–Yamauchi formula the weight is m(t′(Q′);T). Correction: The weight is m(t′(Q′^⊥/Q′);T). Reason: Q′ corresponds to L′/L and the type is that of the dual quotient L′^∨/L′ = Q′^⊥/Q′. (Recorded as PAPER-FENG-YUN-ZHANG-24/E4; no published correction found.)
- **E309** (error; Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou, §4.1, (4.2), pp.15–16, and Lemma 4.2, p.16 (arXiv:1909.07473)). The source asserts: s_i is the number of Jordan blocks with ν_j = i. Correction: s_i is the total rank Σ_{j:ν_j=i} rank L_j, as in Hanke p.360; at p = 2 rank-two blocks count twice. Reason: For Q = ab + cd + 2t² and m = 2 at p = 2, the reduction factor 2^{5−s_0} matches the counts 32/16 and 640/320 only with s_0 = 4. (Recorded as PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/E7; odd-prime formulas unaffected.)
- **E310** (misprint; Chao Li and Wei Zhang, Example 3.5.2, p.18 (arXiv:1908.01701v3)). The source asserts: The rank-one derivative formula is conditioned on val(L^♭) being odd. Correction: The condition is that val(L) is odd. Reason: In rank one there is no L^♭; the formula ∂Den(L) = (val(L) + 1)/2 follows from Theorem 3.5.1 for odd val(L). (Recorded as PAPER-LI-ZHANG-22-B/E4.)
- **E311** (misprint; Chao Li and Wei Zhang, Proof of Proposition 8.2.7, base case (2), p.60, authors' final version (arXiv:2106.15038)). The source asserts: For t even and fundamental invariants (1,…,1,2) the proof concludes μ_−(L) = q^t − q. Correction: μ_−(L) = q^{t−1} − q, the value the displayed identity of the same paragraph uses. Reason: The proof computes #(L^∨)°/L = q^{t−1} and #(ϖL^∨)°/L = q, so μ_− = q^{t−1} − q; with μ_+ = 1 and μ_0 = q − 1 the identity (1 − sq^{t/2})(1 + sq^{t/2−1}) + (1 + sq^{t/2−1})(q − 1) + μ_− = 0 holds exactly for this value. (Recorded as PAPER-LI-ZHANG-22/E6; no published correction found.)
- **E312** (error; Chao Li and Wei Zhang, §3.2, the sentence before (3.2.1.1), p.16 (arXiv:1908.01701v3)). The source asserts: For a self-dual M of rank m and an integral L^♭ of rank n, the density of L^♭ ⊕ M in ⟨1⟩^{n+m+k} is asserted to equal the density of L^♭ in ⟨1⟩^{n+k}. Correction: Den(⟨1⟩^{n+m+k}, L^♭ ⊕ M) = Den(⟨1⟩^{n+m+k}, M)·Den(⟨1⟩^{n+k}, L^♭); the extra factor cancels in the normalized series, so (3.2.1.1) is correct. Reason: For n = 0, M = ⟨1⟩ and k = 0 the left side is Den(⟨1⟩, ⟨1⟩) = 1 + q^{−1} by (3.2.0.1) and the right side is 1. In general the orthogonal complement of the image of M in a self-dual target is self-dual, so restriction to M has fibres of constant size and the densities multiply, as in the proof of Lemma 9.1.1. (new.)
- **E313** (error; Michael Lipnowski and Jacob Tsimerman, §3.1.5, (13), p.10 (arXiv:1511.02212v1)). The source asserts: The number of tuples (a_1,…,a_n) of nonnegative integers with a_1 + … + a_n ≤ δn is bounded by (nδ)^n/n!, and the chain continues with 2^{nδ}e^{nδ} ≤ 2^{2nδ}. Correction: The number of tuples is C(δn + n, n) ≤ 2^{δn+n}, and e^{nδ} ≤ 2^{nδ} is false, so the bound ℓ^{4nδ} of (13) is not justified as written; the packet replaces the chain by the weighted-partition bound of punctual-hilbert-count in local-lattice-orbit-bounds. Reason: For n = 1 the tuples are a_1 = 0, …, δ, which are δ + 1 > δ = (1·δ)^1/1!; and e > 2. (Recorded as PAPER-LIPNOWSKI-TSIMERMAN-18/E1; the published version was not collated.)

## Acceptance tests of the layer

- A genus mass is a weighted class sum: `familyMass` and the base packet's genus mass sum 1/|O(M)|, the rank-one unimodular genus has mass 1/2 and proper mass 1, and the class count lies between the mass and H times the mass.
- Its equality with an Euler product uses proved convergence and fixed local normalizations: the maximal-lattice mass formula rests on τ(SO_Q) = 2, the canonical local volumes 1/λ_p, the archimedean constants γ_G, and Euler products at integers ≥ 2.
- Densities: β(⟨1⟩,1) = 2 and β(⟨1⟩,p) = 0 over ℤ_p for p odd; Den(H,H) = 4/3 for the hyperbolic plane over ℤ_3; the rank-one hermitian Siegel series is Σ_{i≤a}(−X)^i with ∂Den = (a+1)/2 for odd a.
- Theta series: the coefficients of Θ_ℤ are 1, 2, 0, 0, 2 and Θ_ℤ is Mathlib's `jacobiTheta`; Siegel's main theorem holds for the mass-weighted genus average in rank ≥ 5.

## References

- **LiZhangDensity** — Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives of local densities*. arXiv:1908.01701v3 (J. Amer. Math. Soc. 35 (2022)); arXiv pages. https://arxiv.org/pdf/1908.01701v3
- **LiZhangGSpin** — Chao Li and Wei Zhang, *On the arithmetic Siegel–Weil formula for GSpin Shimura varieties*. arXiv:2106.15038 (authors' final version of 2 March 2022; Invent. Math. 228 (2022)). https://arxiv.org/pdf/2106.15038
- **HLSY2023** — Qiao He, Chao Li, Yousheng Shi and Tonghai Yang, *A proof of the Kudla–Rapoport conjecture for Krämer models*. arXiv:2208.07988, authors' final version of 21 July 2023 (Invent. Math. 2023). https://arxiv.org/pdf/2208.07988
- **LiLiu2022** — Chao Li and Yifeng Liu, *Chow groups and L-derivatives of automorphic motives for unitary groups, II*. Forum Math. Pi 10 (2022), e5, open access; the packet cites the numbering and pages of this published version (arXiv:2101.09485v2 numbers its statements one higher from Lemma 2.12 on). https://doi.org/10.1017/fmp.2022.2
- **FYZ2024** — Tony Feng, Zhiwei Yun and Wei Zhang, *Higher Siegel–Weil formula for unitary groups: the non-singular terms*. Invent. Math. 236 (2024); arXiv:2103.11514. https://arxiv.org/pdf/2103.11514
- **SSTT2022** — Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou, *Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields*. Forum Math. Pi 10 (2022), e21; arXiv:1909.07473 (pages of the arXiv version). https://arxiv.org/pdf/1909.07473
- **MST2022** — Davesh Maulik, Ananth N. Shankar and Yunqing Tang, *Picard ranks of K3 surfaces over function fields and the Hecke orbit conjecture*. Invent. Math. 228 (2022); accepted version of 25 December 2021 from the author's page. https://math.berkeley.edu/~ytang/GSpincharp.pdf
- **HankeAWS** — Jonathan Hanke, *Quadratic forms and automorphic forms (notes from the 2009 Arizona Winter School)*. arXiv:1105.5759v3, 27 June 2012, 73 pages. https://arxiv.org/pdf/1105.5759v3
- **Duke1988** — William Duke, *Hyperbolic distribution problems and half-integral weight Maass forms*. Invent. Math. 92 (1988), 73–90; author copy. https://www.math.ucla.edu/~wdduke/preprints/hyperbolic.pdf
- **Hironaka2009** — Yumiko Hironaka, *Spherical functions on U(2n)/(U(n)×U(n)) and hermitian Siegel series*. arXiv:0904.4304v3, 3 March 2011. https://arxiv.org/pdf/0904.4304v3
- **ChoYamauchi** — Sungmun Cho and Takuya Yamauchi, *A reformulation of the Siegel series and intersection numbers*. arXiv:1805.01666v2, 18 April 2020 (Math. Ann. 377 (2020)). https://arxiv.org/pdf/1805.01666v2
- **Leslie2019** — Spencer Leslie, *The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods*. arXiv:1911.07907v3. https://arxiv.org/abs/1911.07907v3
- **Kirschmer2013** — Markus Kirschmer, *One-class genera of maximal integral quadratic forms*. Author preprint, June 2013 (J. Number Theory 136 (2014)). https://www.math.rwth-aachen.de/~Markus.Kirschmer/papers/maxgen.pdf
- **GHY2001** — Wee Teck Gan, Jonathan Hanke and Jiu-Kang Yu, *On an exact mass formula of Shimura*. Duke Math. J. 107 (2001), 103–133; authors' published-layout copy. https://web.math.princeton.edu/~jonhanke/Web-02/Mass-Formula-of-Shimura/shimura-mass.pdf
- **SchulzePillot2020** — Rainer Schulze-Pillot, *Lecture notes on quadratic forms and their arithmetic*. arXiv:2008.12847v2. https://arxiv.org/pdf/2008.12847
- **BruhatTitsII** — François Bruhat and Jacques Tits, *Groupes réductifs sur un corps local. II*. Publ. Math. IHÉS 60 (1984), 5–184 (Numdam). https://www.numdam.org/item/PMIHES_1984__60__5_0/
- **Weil1964** — André Weil, *Sur certains groupes d'opérateurs unitaires*. Acta Math. 111 (1964), 143–211. https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf
- **Weil1965** — André Weil, *Sur la formule de Siegel dans la théorie des groupes classiques*. Acta Math. 113 (1965), 1–87. https://doi.org/10.1007/BF02391774
- **Voight2026** — John Voight, *Quaternion algebras*. Author post-publication v.1.0.7u, 5 August 2026. https://jvoight.github.io/quat-book.pdf
- **LT2018** — Michael Lipnowski and Jacob Tsimerman, *How large is A_g(F_q)?*. arXiv:1511.02212v1 (Duke Math. J. 167 (2018)). https://arxiv.org/pdf/1511.02212v1
- **Yun2013** — Zhiwei Yun, *Orbital integrals and Dedekind zeta functions*. In: The legacy of Srinivasa Ramanujan (2013); arXiv:1303.2420v2. https://arxiv.org/abs/1303.2420v2
- **Li2023** — Yingkun Li, *Algebraicity of higher Green functions at a CM point*. Invent. Math. 234 (2023); arXiv:2106.13653v2. https://arxiv.org/pdf/2106.13653v2
- **BSW2022** — Manjul Bhargava, Arul Shankar and Xiaoheng Wang, *Squarefree values of polynomial discriminants I*. arXiv:1611.09806v3 (Invent. Math. 228 (2022)). https://arxiv.org/abs/1611.09806v3
- **BSW2025** — Manjul Bhargava, Arul Shankar and Xiaoheng Wang, *Squarefree values of polynomial discriminants II*. Forum Math. Pi 13 (2025), e17; arXiv:2207.05592. https://doi.org/10.1017/fmp.2025.9
- **DIT2016** — W. Duke, Ö. Imamoḡlu and Á. Tóth, *Geometric invariants for real quadratic fields*. Ann. of Math. 184 (2016), 949–990. https://annals.math.princeton.edu/2016/184-3/p08
