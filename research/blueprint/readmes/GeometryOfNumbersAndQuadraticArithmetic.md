# Geometry of numbers: minima, finite counts and convex-section volumes

Issue [#1030](https://github.com/CBirkbeck/tauceti-explorer/issues/1030). Codex — codex-a71f92, continuing the codex-hjdg0j checkpoint, 2026-09-27. **Partial blueprint; all declarations remain unchecked.**

This packet supplies sixty-three declaration plans in GN.0, GN.1 and GN.4. It includes the four lattice consequences routed from Couveignes, a native successive-minima invariant with its reusable API, independent attained minimum vectors, and the sharp lower half of Minkowski’s second theorem. It also decomposes Henk’s finite-index sublattice counting lemma and the sharp first-minimum count. The stronger Henk product count is now decomposed through compatible integral flags and diagonal-sublattice avoidance. The analytic finite-union, convex-section and complementary-dilation steps of the upper Minkowski argument are now decomposed. The lattice-box assembly, telescoping and limit, and other recorded source branches, remain explicit gaps.

The [packet](../packets/GeometryOfNumbersAndQuadraticArithmetic.json) has the dependency graph, source records, API names and tests. The [suggested Lean file](../suggested/GeometryOfNumbersAndQuadraticArithmetic.lean) checks the types of the proposed statements; its unproved declarations are not implementations.

## Reuse and source boundary

The complete seven-stage reviewed AUDIT-02 coverage was read before planning. The original lattice carrier, fundamental domains, covolume/change-of-basis and index formulas are already in Mathlib. Blichfeldt, Minkowski first (strict and compact-boundary versions), and the audited class-group/unit applications are imports. No lattice, Gram, measure or determinant carrier is created here.

Pinned libraries are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every declaration in the packet's baseline inventory was checked at that pin. In particular, `Orientation.abs_volumeForm_apply_le` already proves the real full-dimensional volume-form inequality. The missing exported interface here is its RCLike Hermitian Gram consequence, including arbitrary ambient dimension and dependent families.

The inherited source record covers the entire published [Couveignes article](https://annals.math.princeton.edu/2020/192-2/p04), pp.487–497, and visually checked pp.493–494. The publisher PDF hash is `8d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104`. The extraction, its accepted independent review and verified clean red-team result were also read. Couveignes motivates the four exported consequences; the supporting matrix, product and cube arguments below are worker derivations using the read pinned proofs. This does **not** claim a reading of Martinet's primitive-complement proof or Siegel's second-theorem proof.

Couveignes's p.493 tensor-base typo is already confirmed as [PAPER-COUVEIGNES-20/E1](../errata/PAPER-COUVEIGNES-20.md): the integral relation module extends over Z, not Q. Packet E1 preserves that provenance without adding a new review verdict. The printed “sphere” on p.494 is explicitly a set defined by norm ≤1; it means the closed ball, and is not a second erratum.

## Conventions that consumers must preserve

- Inner products are conjugate-linear in the first argument. Gram has entries ⟨v_i,v_j⟩. For a row family in the source, its displayed matrix is the conjugate/transpose convention of this Gram; the determinants agree because they are real. Establish that conversion in the consumer.
- Squared norms, not raw coordinate bounds, are the diagonal inputs. For m coefficients of modulus ≤A, the consumer first proves squared row norm ≤mA².
- Covolume and ball volume are intrinsic to the space containing the full lattice. A rank-one lattice in a plane is considered inside its real line, not with two-dimensional ambient measure.
- The ordered-product lemma needs every factor ≥1. This is not true for a general lattice. Nonzero integral coefficient vectors supply it; the number-field short-integer argument instead needs the arithmetic norm/product proof.
- Couveignes's canonical metric weights complex squared modulus by two. Mathlib's audited mixed-embedding coordinate basis is unweighted. The extraction assigns the resulting measure/discriminant conversion to proposed EffectiveBoundsCompactModels, not to a new lattice definition here.
- Fin n indices are zero-based. The tail length n−i.val is the paper's n+1−k, where k=i.val+1. The last term has exponent one.
- Empty Gram determinants/products and zero-dimensional canonical volume are one. The radius 1/√n is used only for n>0. The cube touches the unit sphere, so containment is in the closed ball.

## GN.0: Hermitian Gram and covolume consequences

The source chain is coordinate Gram identity → orthonormal-coordinate Hadamard → arbitrary-family Gram–Hadamard → uniform diagonal bound. The coordinate identity also supplies the squared-covolume adapter. All five are additional proof-local consequences, not replacements for built GN.0 foundations.

### Gram determinant in orthonormal coordinates

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/gram-det-orthonormal-coordinates` — lemma; unchecked.

For an RCLike field k, a normed k-inner-product space E, an orthonormal basis b indexed by Fin n, and any v:Fin n→E, det Gram_k(v) equals the scalar image in k of ‖det_b(v)‖².

Hypotheses: n may be zero; independence of v is not assumed. The inner product is conjugate-linear in its first argument; Gram has entries ⟨v_i,v_j⟩.

Proof plan:

1. Set A_ij=(b.repr(v_j))_i. The existing coordinate theorem identifies Gram(v) with AᴴA.
2. Take determinants using det_mul and det_conjTranspose; obtain conjugate(det A)·det A.
3. Use the RCLike norm-square identity and basis determinant definition to identify the scalar image of ‖det_b(v)‖², recording reality and nonnegativity.
4. For n=0 every determinant and empty product is one; no inverse or positive-rank assumption enters.

API: `TauCeti.GeometryOfNumbersPlan.gram_det_orthonormal_coordinates`: Exact scalar-valued norm-square identity, not merely equality of real parts.

Contract tests:

- The singleton complex family (i) has Gram determinant 1, not −1.
- Vectors (1,0),(0,i) in C² have Gram determinant 1 and squared coordinate-determinant norm 1.
- The empty family in zero-dimensional space has determinant 1.

Source use: Couveignes, p.493, transpose-evaluation lattice. The packet records the exact pinned prerequisites.

### Hadamard bound in orthonormal coordinates

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/orthonormal-coordinate-hadamard` — lemma; unchecked.

For an orthonormal basis b:Fin n→E over an RCLike field and any v:Fin n→E, ‖det_b(v)‖≤∏i ‖v_i‖.

Hypotheses: b is a full orthonormal basis; n=0 and dependent families are allowed.

Proof plan:

1. Obtain finite dimensionality from b and dimension n. Use the existing gramSchmidtOrthonormalBasis for v, indexed by Fin n; it extends nonzero orthogonalized vectors even when v is dependent.
2. In that basis c the checked formula gives det_c(v)=∏i⟨c_i,v_i⟩. Take norms and apply Cauchy–Schwarz, since ‖c_i‖=1.
3. Apply gram-det-orthonormal-coordinates with b and c. Injectivity of real scalar embedding identifies their squared determinant norms; nonnegativity identifies the norms.
4. Transfer the bound to b. Empty product is one. The existing real oriented-volume bound remains an import/provenance comparison, not a newly owned theorem.

API: `TauCeti.GeometryOfNumbersPlan.orthonormal_coordinate_hadamard`: Determinant norm bounded by product of column norms.

Contract tests:

- Orthogonal real columns (2,0),(0,3) attain determinant norm 6 and product norm 6.
- Columns (1,0),(1,1) have determinant norm 1 and product norm √2; equality fails.
- Duplicate nonzero columns have determinant 0 and positive product norms.

Source use: Couveignes, pp.493–494, Hermitian determinant estimate. The packet records the exact pinned prerequisites.

### Hermitian Gram–Hadamard inequality

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/hermitian-gram-hadamard` — theorem; unchecked.

For any v:Fin n→E in a normed RCLike inner-product space, det Gram(v) is the scalar image of its real part, and 0≤Re(det Gram(v))≤∏i ‖v_i‖². The ambient space need not be finite-dimensional.

Hypotheses: E is normed, not merely seminormed; n may be zero. No linear independence or nonsingularity assumption.

Proof plan:

1. Split on independence. If v is dependent, the pinned determinant/nonzero equivalence implies det Gram(v)=0; all conclusions follow from nonnegative squared norms.
2. For independent v take W=span(range v), with inherited inner product. The checked dimension theorem gives dim W=n; the coerced vectors remain independent. Choose orthonormal coordinates on W.
3. Submodule inclusion preserves inner products and norms, so Gram_W(v)=Gram_E(v). Apply the preceding two nodes in W, square the nonnegative bound, and distribute the square over the product.
4. The coordinate identity supplies reality and nonnegativity, not a comparison in a complex ordering. n=0 gives 1≤1.

API: `TauCeti.GeometryOfNumbersPlan.hermitian_gram_hadamard`: Reality, nonnegativity and diagonal-product upper bound in one interface.

Contract tests:

- The empty Gram determinant and diagonal product both equal 1.
- Family (1,i) in C has Gram [[1,i],[-i,1]], determinant 0 and diagonal product 1; conjugation is essential.
- Real vectors (1,0),(1,1) have Gram [[1,1],[1,2]], determinant 1 and diagonal product 2.

Source use: Couveignes, p.494, first paragraph. The packet records the exact pinned prerequisites.

### Uniform Gram determinant bound

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/gram-uniform-bound` — lemma; unchecked.

If D≥0 and every v_i in v:Fin n→E satisfies ‖v_i‖²≤D, then Re(det Gram(v))≤D^n.

Hypotheses: The bound is on squared norms, not individual coefficients; n=0 is allowed.

Proof plan:

1. Use hermitian-gram-hadamard.
2. Multiply the n pointwise inequalities using nonnegative squared norms and D≥0; the constant product is D^n.
3. No off-diagonal bound is required. For an m-column matrix with entries bounded by A in modulus, the consumer must first show row squared norm ≤m·A², then instantiate D.

API: `TauCeti.GeometryOfNumbersPlan.gram_uniform_bound`: D^n upper bound with D≥0 and squared-norm hypotheses.

Contract tests:

- n=0,D=0 gives 1≤0^0=1.
- A nonempty zero family with D=0 has determinant 0.
- Two orthogonal vectors of squared norm 5 attain determinant 25, so replacing D^n by D fails.

Source use: Couveignes, p.494, definition of D. The packet records the exact pinned prerequisites.

### Squared intrinsic covolume is a Gram determinant

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-square-gram` — lemma; unchecked.

For a discrete full Z-lattice L in a finite-dimensional real inner-product space E with canonical intrinsic volume and Z-basis b:Fin n→L, covolume(L)²=det Gram_R(i↦b_i in E).

Hypotheses: Use existing Submodule Z E, DiscreteTopology L and IsZLattice R L. The measure is canonical Euclidean volume; arbitrary Haar rescaling changes the identity. Rank equals dim E via existing basis extension. Rank zero is allowed.

Proof plan:

1. Extend b to a real basis by ofZLatticeBasis, giving dim E=n. Choose an orthonormal basis c with the same index.
2. Apply covolume_eq_det_mul_measureReal with b,c and intrinsic volume. The c-fundamental domain equals its parallelepiped almost everywhere, and the latter has volume one.
3. Thus covolume(L)=|det_c(b)|. Square and apply gram-det-orthonormal-coordinates over R.
4. Do not reconstruct covolume, index, fundamental domains or rational discriminant forms. For a proper subspace W instantiate E=W, not ambient volume on a measure-zero subset.

API: `TauCeti.GeometryOfNumbersPlan.covolume_square_gram`: Squared intrinsic covolume equals the real Gram determinant.

Contract tests:

- Basis (2,0),(0,3) has covolume 6 and Gram determinant 36.
- A unimodular shear of the standard Z² basis leaves covolume squared and Gram determinant equal to 1.
- Z(1,1) in its line has intrinsic covolume √2 and Gram determinant 2; ambient plane volume would give the wrong zero.

Source use: Couveignes, p.493, squared transpose-image covolume. The packet records the exact pinned prerequisites.

## GN.0: primitive intersections and factor lattices

The proof is sourced from [Horesh–Karasik, published Appendix A–B](https://research-explorer.ista.ac.at/download/14717/14720/2023_QuarterlyJourMath_Horesh.pdf), chiefly A.1–A.3 (pp.1284–1285) and B.1–B.6 (pp.1289–1291). These passages and their complete proofs were read. The full equidistribution paper is **not** claimed read. The appendix gives an accessible proof of the fourth Couveignes consequence without assuming Martinet's unread proof.

Fix a finite-dimensional real inner-product space E and a discrete full integral submodule Δ. For a real subspace W, use the following existing objects; these are local mathematical notation, not new carrier definitions.

| Notation | Existing object and ambient space |
| --- | --- |
| L | Integral comap of Δ along W→E, a submodule of W |
| π | Orthogonal projection E→W-perp |
| P | Integral image of Δ under π, a submodule of W-perp |
| Δ* | Integer-valued inner dual of Δ, using BilinForm.dualSubmodule in E |
| K | Integral comap of Δ along W-perp→E |

The rationality hypothesis is exactly span_R(L)=W. For Δ=Z^n this is equivalent to a rational-coordinate basis of W: clear the finitely many denominators in such a basis for one direction; for the other choose a real basis from the spanning integral intersection. This equivalence only sets the meaning of the hypothesis; no rationality or fullness of K is assumed.

The inner dual must be formed in the space containing the full lattice. The ambient dual of the zero subgroup in R is all of R, not a discrete lattice. Generic algebraic dual-submodule, dual-basis and double-dual results already exist; the new work is their **intrinsic Euclidean covolume and projection compatibility**. Completed IntegralLattices retains rational integral discriminants, duality and gluing. Its fraction-field statements are not silently identified with real metric lattice statements.

The dependency chain splits into two branches. Saturation gives an adapted integral basis, its projected last block gives P, and block Gram factorization gives covol(P)=covol(Δ)/covol(L). Independently, biorthogonal Gram determinants give covol(P*)=covol(P)^{-1}. The exact identity P*=Δ*∩W-perp then joins the branches. When Δ is self-dual, its positive covolume is one, K=P*, and covol(K)=covol(L).

Primitivity does **not** give an integral orthogonal direct sum. For L=Z(1,1) in Z², the projected lattice is Z(−1/2,1/2), whereas K=Z(−1,1). Their covolumes are 1/√2 and √2. L and K together have index two in Z². The general identity uses Δ*, not Δ: even an integral ambient lattice such as Ze₁⊕3Ze₂ is not self-dual.

### Integral basis adapted to a primitive intersection

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/saturated-adapted-basis` — lemma; unchecked.

With E, Δ, W and L as in the hypotheses, there exist natural numbers r,s, an integral basis b of Δ indexed by Fin r disjoint-union Fin s, and an integral basis c of L indexed by Fin r, such that b(inl i)=c_i in E for every i. Consequently r=dim W, s=dim W-perp and r+s=dim E; no orthogonality of the integral complement is asserted.

Hypotheses: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. Δ is a discrete full Z-submodule of E. W is a real subspace. L is the existing comap of Δ along W→E; span_R(L)=W, written intrinsically as span_R(L in W)=top. P is the existing image of Δ under orthogonal projection E→W-perp.

Proof plan:

1. Use discreteness and the pinned finite/free instances for Δ and L; comap_discreteTopology applies because W→E is continuous and injective. The span hypothesis makes L a full lattice in W. Inside Δ take N={x in Δ: x lies in W}; the obvious subtype equivalence identifies N with L.
2. Apply Submodule.exists_smith_normal_form_of_le to N≤top in the finite free Z-module Δ. It supplies bases u_j of Δ and v_i of N with v_i=a_i u_i on the initial block. Each a_i is nonzero because v_i is a nonzero basis vector.
3. Since a_i u_i lies in W and a_i is a nonzero real scalar, u_i lies in W, hence in N. Express u_i as an integral combination of the v_j and compare its u_i-coordinate: 1=a_i z_i. Thus every a_i is a unit in Z. This is the saturation step, not an assumption that N has an orthogonal integral complement.
4. Rescale the initial u_i by these units using Basis.isUnitSMul and leave other u_j unchanged. Reindex Fin(r+s) by Fin r disjoint-union Fin s; transport the N-basis to L. Existing ofZLatticeBasis extends c and b to real bases, giving r=dim W and r+s=dim E. The pinned finrank_add_finrank_orthogonal then gives s=dim W-perp. Empty/full initial blocks work unchanged.

API: `TauCeti.GeometryOfNumbersPlan.saturated_adapted_basis`. Its contract is the statement above; the packet lists the exact pinned prerequisites.

Contract tests:

- `primitive_diagonal_completion`: Columns (1,1),(0,1) form an integral basis: determinant 1.
- `nonsaturated_cannot_complete`: No matrix with first column (2,0) and an integral second column has determinant ±1.
- `zero_lattice_empty_basis`: The zero lattice in zero-dimensional Euclidean space admits the empty integral basis.

Source use: Proposition B.4, published p.1290, basis-completion step. Expands the source's primitive basis completion into a pinned Smith-normal-form argument.

### Basis of the projected lattice

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/projected-adapted-basis` — lemma; unchecked.

Let b be an integral basis of a full lattice Δ indexed by Fin r disjoint-union Fin s, c a real basis of W indexed by Fin r, and b(inl i)=c_i in E. Then the vectors q_j=π(b(inr j)), with π:E→W-perp orthogonal projection, form a real basis q of W-perp, and their integral span is exactly P=π(Δ). In particular P is discrete and full in W-perp; these properties are conclusions.

Hypotheses: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. Δ is a discrete full lattice, b and c are the displayed actual bases, and the first block equality is assumed; no image discreteness, rational coordinate matrix or orthogonal integral splitting is assumed.

Proof plan:

1. Extend b to a real basis using ofZLatticeBasis. Orthogonal projection onto W-perp has kernel W, by ker_orthogonalProjectionOnto and the closed-subspace double-complement identity.
2. If a real combination of the projected last-block vectors vanishes, the corresponding combination of last-block b-vectors lies in W. Express it with c, hence the first block of b; independence of b forces every last-block coefficient to vanish.
3. For x in W-perp, expand its ambient value in the real basis b and apply π. The first block vanishes and π(x)=x, proving spanning. These two arguments give a real basis q with the exact displayed vectors.
4. Expand each element of Δ in its integral b-coordinates: its projection is an integral combination of q. Conversely every q_j is the projection of an element of Δ. Hence span_Z(q)=P. Existing discreteTopology for the integral span of a real basis and instIsZLatticeRealSpan prove the two lattice instances. An integral basis of P is q.restrictScalars Z, transported across this equality.

API: `TauCeti.GeometryOfNumbersPlan.projected_adapted_basis`. Its contract is the statement above; the packet lists the exact pinned prerequisites.

Contract tests:

- `diagonal_projected_generator`: Projecting e₂ orthogonally off R(1,1) gives (−1/2,1/2), not (−1,1).
- `full_space_projection_zero`: Projection off the full ambient space sends every integral submodule to the zero submodule of the zero-dimensional complement.
- `diagonal_projected_span`: The projection of Z² off the diagonal is exactly the integral span of the projected e₂.

Source use: Proposition B.4, published p.1290, projected last block; Appendix introduction pp.1284–1285. Makes projection discreteness and fullness explicit instead of inferring them from an unproved quotient-lattice claim.

### Gram determinant factorization under orthogonal projection

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/gram-det-adapted-projection` — lemma; unchecked.

Let b be a real basis of E indexed by Fin r disjoint-union Fin s and c a real basis of W indexed by Fin r, with b(inl i)=c_i in E. Then det Gram(b)=det Gram(c)·det Gram(j↦π(b(inr j))), where π:E→W-perp and each Gram matrix uses the intrinsic real inner product.

Hypotheses: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. The first block spans W and is a basis of W; r or s may be zero.

Proof plan:

1. Choose orthonormal bases of W and W-perp. The pinned orthogonal complement decomposition and Basis.prod transported by prodEquivOfIsCompl give their concatenated orthonormal basis of E; orthonormality follows by the vanishing cross-inner-products.
2. In these coordinates the columns of b form an upper block-triangular matrix [A B;0 C]. A is the coordinate matrix of c; C is the coordinate matrix of its projected last block. This statement uses a real orthogonal decomposition only, not an integral decomposition.
3. Apply Matrix.det_fromBlocks_zero₂₁. Use gram-det-orthonormal-coordinates in E, W and W-perp, reindexing the finite sum type as Fin(r+s). Squaring det(A)det(C) gives the product of the two Gram determinants.
4. Finite reindexing preserves Gram determinants by simultaneous row/column permutation. Empty blocks have determinant one. Taking a positive square root must use absolute coordinate determinants, not signed determinants.

API: `TauCeti.GeometryOfNumbersPlan.gram_det_adapted_projection`. Its contract is the statement above; the packet lists the exact pinned prerequisites.

Contract tests:

- `sheared_gram_factor`: The adapted columns (1,1),(0,1) give Gram determinant 1 = 2·(1/2).
- `signed_basis_gram`: A sign-reversed coordinate basis has determinant −1 but Gram determinant 1.
- `empty_gram_factor`: Empty Gram determinants multiply as 1 = 1·1.

Source use: Proposition B.4, published p.1290, block-triangular determinant proof. Extracts the measure-free determinant step, with signs and empty blocks explicit.

### Gram determinants of biorthogonal bases

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/gram-det-biorthogonal` — lemma; unchecked.

For real bases b,d of E indexed by Fin n satisfying inner(b_i,d_j)=δ_ij, det Gram(b)·det Gram(d)=1. This includes n=0 and does not say either basis is orthonormal.

Hypotheses: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. b and d are actual real bases, with the displayed mixed inner products.

Proof plan:

1. Choose an orthonormal basis e with n indices, using finite dimension and the cardinality of b. Let A,D be the coordinate matrices of b,d.
2. OrthonormalBasis.sum_inner_mul_inner identifies the mixed-pairing matrix with transpose(A)·D. The biorthogonality hypothesis makes this matrix the identity.
3. Take determinants: det(A)det(D)=1, using det_mul and the real specialization of det_conjTranspose. Apply gram-det-orthonormal-coordinates to both bases and square the scalar identity.
4. The proof uses no inverse on a singular matrix and has no exceptional positive-rank assumption.

API: `TauCeti.GeometryOfNumbersPlan.gram_det_biorthogonal`. Its contract is the statement above; the packet lists the exact pinned prerequisites.

Contract tests:

- `reciprocal_line_grams`: The paired real bases 2 and 1/2 have Gram determinants 4 and 1/4.
- `sheared_dual_grams`: Gram matrices [[2,1],[1,1]] and [[1,−1],[−1,2]] have determinant product 1.
- `unpaired_line_rejected`: Two copies of the basis vector 2 are not a biorthogonal pair: their Gram determinant product is 16, not 1.

Source use: Corollary A.3, published p.1285, reciprocal Gram determinants; proof of A.1, p.1284, biorthogonality. Provides exactly the scalar determinant identity needed for reciprocal covolume, through the existing dual-basis API.

### Dual of a projected integral submodule

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/dual-projection-comap` — lemma; unchecked.

For any Z-submodule Δ of E and real subspace W, let π:E→W-perp be orthogonal projection. The intrinsic inner dual of π(Δ) equals the comap of the ambient inner dual Δ* along W-perp→E: (π(Δ))*=Δ*∩W-perp. Here every dual is the existing BilinForm.dualSubmodule with the real inner product. No discreteness, fullness or rationality is required for this equality of submodules.

Hypotheses: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. Dual means integer-valued pairing with every member of the submodule; the intrinsic dual is formed inside W-perp.

Proof plan:

1. Unfold membership in the existing dualSubmodule, Submodule.map and ZLattice.comap. An x in W-perp belongs to the left side precisely when inner(x,π(z)) is integral for every z in Δ.
2. Use inner_orthogonalProjectionOnto_eq_of_mem_left to replace inner(x,π(z)) with inner(x,z). This is exactly membership in Δ* pulled back to W-perp.
3. Prove both inclusions by the image membership witnesses. Do not replace Δ* by Δ unless self-duality has been supplied or proved. In particular this identity still holds when the projected subgroup is not discrete.

API: `TauCeti.GeometryOfNumbersPlan.dual_projection_comap`. Its contract is the statement above; the packet lists the exact pinned prerequisites.

Contract tests:

- `standard_lattice_selfdual`: The integral span of any finite real orthonormal basis is self-dual for the integer-valued inner pairing.
- `scaled_ambient_dual`: For Δ=2Z in R the dual is (1/2)Z, so an arbitrary ambient lattice cannot be substituted for its dual.
- `diagonal_projected_dual`: The dual of the projected Z² lattice in the diagonal's orthogonal line is exactly Z² intersected with that line.

Source use: Proposition B.5, published p.1291, corrected pairing proof. Generalizes the published standard-lattice identity correctly by retaining the ambient dual.

### Full orthogonal intersection in a self-dual lattice

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/orthogonal-intersection-basis` — lemma; unchecked.

Under the full-lattice and rational-intersection hypotheses on Δ,W,L, assume Δ*=Δ for the real inner pairing. Then there exist s and a real basis q of W-perp indexed by Fin s such that span_Z(q)=Δ∩W-perp, with s=dim W-perp. Thus the primitive orthogonal intersection is a discrete full lattice in its intrinsic space.

Hypotheses: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. Δ is a discrete full Z-submodule of E. W is a real subspace. L is the existing comap of Δ along W→E; span_R(L)=W, written intrinsically as span_R(L in W)=top. P is the existing image of Δ under orthogonal projection E→W-perp. Ambient self-duality Δ*=Δ is required, not merely covolume one or integrality.

Proof plan:

1. Use saturated-adapted-basis; turn its integral basis of L into a real basis of W via ofZLatticeBasis. Apply projected-adapted-basis to obtain a real basis p whose integral span is P=π(Δ).
2. The real inner product is nondegenerate: pairing a putative annihilator with itself gives zero norm, hence zero. Existing BilinForm.dualSubmodule_span_of_basis identifies P* with the integral span of the existing inner-dual real basis of p.
3. Apply dual-projection-comap and Δ*=Δ to identify P* with Δ∩W-perp. Transport the dual real basis across that equality; existing span-basis lattice instances give discreteness and fullness.
4. Rank is the cardinality of a real basis, including zero rank when W=E. This route proves fullness and does not assume a rational basis of the orthogonal space in advance.

API: `TauCeti.GeometryOfNumbersPlan.orthogonal_intersection_basis`. Its contract is the statement above; the packet lists the exact pinned prerequisites.

Contract tests:

- `diagonal_orthogonal_rank_one`: The orthogonal intersection for the diagonal in Z² is the integral span of a real basis indexed by one element.
- `orthogonal_full_rank_zero`: The orthogonal intersection for the full plane has an empty real basis.
- `orthogonal_zero_rank_two`: The orthogonal intersection for the zero subspace in the plane has a two-element real basis.

Source use: Corollary A.2, p.1285, and Proposition B.5, p.1291. Combines existing dual-basis fullness with the missing projection/intersection bridge.

### Covolume of a factor lattice

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-projection` — theorem; unchecked.

Under the full-lattice and rational-intersection hypotheses on Δ,W,L, the projected lattice P=π(Δ) in W-perp satisfies covol(P)=covol(Δ)/covol(L), with canonical intrinsic Euclidean volumes. No unimodularity or self-duality of Δ is assumed.

Hypotheses: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. Δ is a discrete full Z-submodule of E. W is a real subspace. L is the existing comap of Δ along W→E; span_R(L)=W, written intrinsically as span_R(L in W)=top. P is the existing image of Δ under orthogonal projection E→W-perp.

Proof plan:

1. Build the adapted integral bases using saturated-adapted-basis and extend the L-basis to a real W-basis. projected-adapted-basis supplies a real basis of P; restrict its scalars to obtain the integral P-basis and the required discrete/full instances.
2. Use covolume-square-gram for Δ,L,P, reindexing the sum-type Δ basis if necessary. Apply gram-det-adapted-projection to the real extension of the adapted Δ basis.
3. These identities give covol(Δ)^2=covol(L)^2·covol(P)^2. Each covolume is strictly positive by the pinned covolume_pos theorem, including zero-dimensional lattices. Deduce covol(Δ)=covol(L)·covol(P), then divide by covol(L).
4. Do not discard the covol(Δ) factor, and do not use a signed determinant as a volume. The proof handles W=0 and W=E with the empty determinant and zero-dimensional volume both equal to one.

API: `TauCeti.GeometryOfNumbersPlan.covolume_projection`. Its contract is the statement above; the packet lists the exact pinned prerequisites.

Contract tests:

- `diagonal_projection_covolume`: The projected Z² lattice off the diagonal has intrinsic covolume 1/√2.
- `zero_space_covolume_one`: The zero lattice in zero-dimensional Euclidean space has intrinsic covolume 1.
- `nonunimodular_factor_ratio`: For Δ=2Ze₁⊕3Ze₂ and L=2Ze₁ the projected covolume is 3=6/2, not 1/2.

Source use: Proposition B.4, published p.1290. Supplies the intrinsic metric quotient-volume formula, with the source's determinant-sign choice made explicit.

### Reciprocal covolume of the inner dual

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-dual` — theorem; unchecked.

For a discrete full Z-lattice L in a finite-dimensional real inner-product space E with canonical intrinsic Euclidean volume, covol(L*)=covol(L)^{-1}, where L* is the existing integer-valued inner dual in E. The full-lattice property of L* follows from the existing dual-basis and span-basis results and is not an additional assumption.

Hypotheses: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. L is discrete and spans E over R. A lower-rank lattice is first transported into its real span; its ambient polar is not used.

Proof plan:

1. Choose a finite integral basis b of L and extend it to a real basis c via ofZLatticeBasis. The existing ofZLatticeBasis_span identifies its integral span with L.
2. Nondegeneracy of the inner form follows by self-pairing. Let d be its existing BilinForm.dualBasis of c. Existing dualSubmodule_span_of_basis identifies L* with span_Z(d); the span-basis instances provide discreteness and fullness. The integral basis is d.restrictScalars Z.
3. Apply apply_dualBasis_right and symmetry of the real inner product to obtain inner(c_i,d_j)=δ_ij. gram-det-biorthogonal says the Gram determinant product is one.
4. Apply covolume-square-gram to the integral bases of L and L*. Positive covolumes imply covol(L)·covol(L*)=1, then division gives the inverse formula. Dimension zero yields 1=1^{-1}.

API: `TauCeti.GeometryOfNumbersPlan.covolume_dual`. Its contract is the statement above; the packet lists the exact pinned prerequisites.

Contract tests:

- `scaled_line_dual_covolume`: The inner dual of 2Z in R has covolume 1/2.
- `standard_covolume_one`: The standard integral lattice in Euclidean n-space has covolume one, including n=0.
- `ambient_polar_not_intrinsic`: The ambient inner dual of the zero subgroup in R is all of R, not a discrete full lattice; a lower-rank lattice must be dualized inside its span.

Source use: Corollary A.3, published p.1285. Adds the Euclidean volume consequence, not a replacement for the built algebraic dual or double-dual theorem.

### Equal covolumes of primitive orthogonal intersections

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.0/primitive-orthogonal-covolume` — theorem; unchecked.

Let Δ be a discrete full self-dual lattice in E for the real inner pairing, and W a real subspace such that L=Δ∩W spans W. Then K=Δ∩W-perp is a full lattice in W-perp and covol(K)=covol(L), intrinsically. In particular, for rational W in R^n and Δ=Z^n, the primitive intersections W∩Z^n and W-perp∩Z^n have equal covolumes. This includes n=0, W=0 and W=E.

Hypotheses: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. Δ is a discrete full Z-submodule of E. W is a real subspace. L is the existing comap of Δ along W→E; span_R(L)=W, written intrinsically as span_R(L in W)=top. P is the existing image of Δ under orthogonal projection E→W-perp. Self-duality Δ*=Δ is explicit. For Z^n use the integral span of the standard orthonormal basis; rational W means its integral intersection spans it.

Proof plan:

1. By covolume-dual applied to Δ and self-duality, its positive covolume equals its inverse, hence equals one. This does not follow from determinant sign or from integral splitting.
2. By saturated-adapted-basis and projected-adapted-basis, P=π(Δ) is a full lattice in W-perp. covolume-projection gives covol(P)=1/covol(L).
3. dual-projection-comap with self-duality identifies P* with K. orthogonal-intersection-basis supplies the intrinsic full-lattice conclusion independently of any covolume manipulation. Apply covolume-dual to P and simplify the two inverses to obtain covol(K)=covol(L).
4. For Δ the integral span of any finite orthonormal basis, apply dualSubmodule_span_of_basis: the basis is its own inner-dual by dualBasis_eq_iff and inner_eq_ite. This proves self-duality; the standard Euclidean basis gives Z^n. The condition on W is equivalent to having a rational coordinate basis, by clearing finitely many denominators, not by assuming the conclusion about W-perp.
5. Do not replace L by a proper finite-index sublattice with the same span: its covolume changes. Do not assert Δ=L⊕K over Z; the diagonal/antidiagonal example has index two.

API: `TauCeti.GeometryOfNumbersPlan.primitive_orthogonal_covolume`. Its contract is the statement above; the packet lists the exact pinned prerequisites.

Contract tests:

- `diagonal_equal_covolumes`: Both primitive diagonal and antidiagonal intersections in Z² have intrinsic covolume √2.
- `nonsaturation_changes_covolume`: Replacing the primitive generator (1,1) by (2,2) doubles its one-dimensional covolume while leaving its orthogonal line unchanged.
- `no_integral_orthogonal_splitting`: The primitive diagonal and antidiagonal generators form an index-two sublattice, not an integral basis of Z².

Source use: Corollary B.6, published p.1291; Couveignes2020 p.493 uses its standard-lattice case. Closes the fourth routed Couveignes input and states the reusable self-dual ambient generalization as an explicit worker deduction.

## GN.1: ordered products and intrinsic balls

These arithmetic and intrinsic-volume inputs complement the successive-minima construction below. The ordered-product estimate additionally requires a lower bound of one on every factor, which a general lattice does not supply.

### Ordered tail product inequality

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/ordered-tail-product` — lemma; unchecked.

For monotone a:Fin n→R with a_j≥1, every i:Fin n satisfies a_i^(n−i.val)≤∏j a_j.

Hypotheses: Indices are zero-based; tail length n−i.val is strictly positive. The lower bound 1 and monotonicity are both load-bearing.

Proof plan:

1. Use the temporary comparison function c_j=1 if j<i and c_j=a_i if i≤j; this is not a new packaged definition.
2. For j<i use 1≤a_j; for i≤j use monotonicity. All c_j≥0, so multiply the inequalities.
3. Split indices below i and at least i. The first product is one, the second has exactly n−i.val equal factors.
4. The consumer must supply and sort the independent nonzero lattice vectors; this arithmetic lemma does not supply minima witnesses.

API: `TauCeti.GeometryOfNumbersPlan.ordered_tail_product`: Natural-power form avoids root conventions.

Contract tests:

- For (1,2,4), the three left sides are 1,4,4 and total product is 8.
- Dropping a_j≥1 fails for (1/2,2): final term 2 exceeds total product 1.
- Dropping ordering fails for (4,1): first square 16 exceeds product 4.

Source use: Couveignes, pp.490 and494, ordered norm lists. The packet records the exact pinned prerequisites.

### Ordered-product root bound

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/ordered-product-root-bound` — theorem; unchecked.

If a:Fin n→R is monotone, a_j≥1, and ∏j a_j≤V, then a_i≤V^(1/(n−i.val)) for every i:Fin n, using Real.rpow.

Hypotheses: V≥1 follows from the hypotheses; no negative-base root. n−i.val>0 follows from i:Fin n; n=0 has no requested index.

Proof plan:

1. Combine ordered-tail-product with the upper product bound.
2. A product of terms ≥1 is ≥1, hence V≥1. Also a_i≥0 and the tail length is positive.
3. Apply the pinned positive inverse-power equivalence at exponent the real cast of n−i.val, rewriting the real power at a natural exponent as the natural power.
4. With paper index k=i.val+1 the denominator is n+1−k, not n−k.

API: `TauCeti.GeometryOfNumbersPlan.ordered_product_root_bound`: Paper's one-based denominator without last-index off-by-one.

Contract tests:

- All terms 1 and V=1 give equality.
- For (1,2,4),V=8, the final bound has exponent 1, not 1/0.
- For (2,2),V=4, the first bound 2≤√4 is exact.

Source use: Couveignes, pp.490 and494, individual norm bounds. The packet records the exact pinned prerequisites.

### Intrinsic volume of an orthonormal cube

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/orthonormal-cube-volume` — lemma; unchecked.

For a full real orthonormal basis b:Fin n→E and r≥0, volume_E{x : every |(b.repr x)_i|≤r}=ENNReal.ofReal((2r)^n).

Hypotheses: E finite-dimensional with Borel structure and canonical volume. n=0 and r=0 allowed; no new cube type.

Proof plan:

1. The coordinate map b.repr is measure preserving. Compose it with volume-preserving ofLp into the finite real function space.
2. The set becomes the interval box [−r,r]^n, by |t|≤r iff −r≤t≤r.
3. Apply Real.volume_Icc_pi. Side lengths 2r are nonnegative, so product of ofReal side lengths equals ofReal((2r)^n).
4. The empty-coordinate space has unit mass: n=0,r=0 gives 1, but n>0,r=0 gives 0.

API: `TauCeti.GeometryOfNumbersPlan.orthonormal_cube_volume`: ENNReal volume avoids an implicit finiteness assumption in toReal.

Contract tests:

- n=0,r=0 gives volume 1.
- n=1,r=0 gives volume 0.
- n=2,r=3 gives 36, not 9: r is half-side length.

Source use: Couveignes, p.494, unit-ball estimate. The packet records the exact pinned prerequisites.

### A cube inside the Euclidean unit ball

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/inscribed-cube` — lemma; unchecked.

For a real orthonormal basis b:Fin n→E and n>0, the coordinate cube |(b.repr x)_i|≤1/√n is contained in closedBall_E(0,1).

Hypotheses: The norm is Euclidean and b orthonormal; a general algebraic basis is insufficient. The normalized radius requires n>0.

Proof plan:

1. b.repr preserves norm; use the pinned Euclidean norm-square sum identity.
2. Each coordinate square is at most 1/n because n>0 and its modulus is ≤1/√n.
3. Sum n inequalities: ‖x‖²≤n/n=1. Nonnegative norm implies ‖x‖≤1, exactly closed-ball membership.
4. This is set containment, not a volume theorem. Cube vertices lie on the boundary; containment in the open ball is false.

API: `TauCeti.GeometryOfNumbersPlan.inscribed_cube`: Closed-set containment with explicit positive dimension.

Contract tests:

- n=1 gives [−1,1], whose endpoints have norm 1.
- n=4 gives half-side 1/2; the vertex with all four coordinates 1/2 has squared norm 1.
- Half-side 1 fails for n=2 at (1,1).

Source use: Couveignes, p.494, unit-ball estimate. The packet records the exact pinned prerequisites.

### Intrinsic Euclidean ball lower bound

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/intrinsic-ball-lower-bound` — theorem; unchecked.

For a finite-dimensional real inner-product space E with an orthonormal basis indexed by Fin n and n>0, ENNReal.ofReal((2/√n)^n)≤volume_E(closedBall_E(0,1)). The real lower constant equals 2^n·n^(−n/2).

Hypotheses: Intrinsic volume on E; for a proper subspace of R^M instantiate E with the subspace. This is a closed ball, not its boundary sphere. Dimension zero has unit volume and is separate from division by √0.

Proof plan:

1. Set r=1/√n≥0.
2. Apply orthonormal-cube-volume and inscribed-cube, followed by measure monotonicity.
3. Rewrite 2·(√n)⁻¹ as 2/√n. To match the paper use n>0, √n=n^(1/2), natural-power/real-power comparison and power multiplication to obtain 2^n·n^(−n/2).
4. No compactness-to-finiteness or toReal step is needed for the delivered inequality. Any real-volume corollary must explicitly use finiteness of closed-ball volume.

API: `TauCeti.GeometryOfNumbersPlan.intrinsic_ball_lower_bound`: Closed-ball lower bound for the space's own canonical volume.

Contract tests:

- n=1 gives exact lower bound 2.
- n=4 gives lower constant 1.
- n=2 gives lower constant 2, not 4; ambient volume of a ball in a proper subspace is zero and cannot satisfy this intrinsic estimate.

Source use: Couveignes, p.494, displayed lower estimate. The packet records the exact pinned prerequisites.

## GN.1: successive minima and the sharp lower product bound

The starting objects are Mathlib’s `ConvexBody`, `gauge`, integral submodule, `IsZLattice`, real span and finite rank. A `ConvexBody` is compact, convex and nonempty; it need not have interior. We therefore state **zero lies in the interior** in every geometric minimum theorem. The minimum is a scalar function, not a second notion of lattice, body or norm.

Write d=dim_R E. Index i:Fin d represents the source’s i.val+1. Let A_i be the nonnegative real numbers r for which the span of lattice points of gauge at most r has dimension at least i.val+1. The definition is λ_i=inf A_i. Under the stated hypotheses, the proof below establishes that A_i is nonempty, that its infimum is strictly positive and attained, and that A_i=[λ_i,∞). Finite indices exclude nonexistent minima. In dimension zero the index set is empty and the product is one.

The attainment argument uses only a convex compact neighborhood of zero. Symmetry is unnecessary for that argument or the comparison API, and is imposed for the cross-polytope containment and Minkowski inequality. This small generalization is justified by the explicit proof; it is not attributed as the wording of the source. In particular, an asymmetric interval can violate the symmetric lower constant even though its minimum is positive and attained.

The source proof is [Evertse’s course chapter](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, printed pp.23–27. The proof proceeds by finite minimization outside a growing span. It does not assume that an infinite discrete set has a least element under an arbitrary ordering. Compact gauge sublevels give the needed finite candidate sets. The strict-sublevel flag records the geometric reason a smaller dilation cannot have the required rank.

The central inequality is

(2^d/d!) covolume(L) ≤ (∏_i λ_i) volume(K).

Its proof uses the real basis of attained independent minimum vectors. The associated weighted cross-polytope lies in K; its volume is (2^d/d!) times the absolute determinant of that basis divided by the product of the minima. The determinant is at least covolume(L), since the vectors generate a full sublattice whose index is a positive integer. Minimum vectors are not assumed to be an integral basis. Mathlib already computes the standard l1-ball volume through its general lp formula and Gamma(n+1)=n!, so that calculation is imported.

A lattice of rank r in an ambient space of larger dimension is first viewed as a full lattice in its real span. Both the body and the volume must then be intrinsic to that r-dimensional space. No comparison with a measure-zero ambient subset is used. The zero-dimensional case has volume and covolume one, with an empty product and 0!=1.

### Successive minima on the native lattice and convex body

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum` — definition; unchecked.

For a Z-submodule L of a finite-dimensional real normed space E, K:ConvexBody E and i:Fin d, define λ_i(L,K) as the real infimum of A_i={r∈R : 0≤r and i.val+1≤dim_R span_R{x∈L : gauge K x≤r}}. This is a real-valued function on existing carriers. Its geometric laws require L discrete and full and 0∈interior K; central symmetry is needed for Minkowski’s product inequality.

Hypotheses: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof plan:

1. Use Mathlib gauge and Submodule.span/finrank verbatim. The definition introduces only the scalar invariant.
2. The finite index excludes nonexistent minima above the ambient dimension. Compactness/nonempty interior are not encoded as a new type; ConvexBody supplies compactness and convexity, and theorems state the interior hypothesis.
3. Under the geometric hypotheses, greedy-minimum-family and successive-minimum-is-least prove nonemptiness, positivity and actual attainment of the defining infimum. A real infimum of an empty set is never used as a geometric minimum.

API:

- `TauCeti.GeometryOfNumbersPlan.successiveMin_def`: λ_i is the infimum of the nonnegative gauge-rank thresholds A_i specified in the definition.
- `TauCeti.GeometryOfNumbersPlan.successiveMin_isLeast`: For every i:Fin d, λ_i(L,K) is the least element of A_i={r≥0 : dim span_R{x∈L : gauge K x≤r}≥i.val+1}.
- `TauCeti.GeometryOfNumbersPlan.successiveMin_pos`: For every i:Fin d, 0<λ_i(L,K).
- `TauCeti.GeometryOfNumbersPlan.successiveMin_monotone`: The function i↦λ_i(L,K), on Fin d, is monotone.
- `TauCeti.GeometryOfNumbersPlan.successiveMin_le_iff`: For r≥0, λ_i(L,K)≤r if and only if i.val+1≤dim_R span_R((L:Set E)∩r·(K:Set E)).
- `TauCeti.GeometryOfNumbersPlan.exists_successiveMin_witnesses`: There exists a real basis b indexed by Fin d such that b_i∈L, gauge K b_i=λ_i(L,K), and every x∈L of gauge<λ_i lies in span_R{b_j:j<i}. In particular b_i∈λ_iK and all minimum bounds are attained by one independent family.
- `TauCeti.GeometryOfNumbersPlan.successiveMin_antitone_body`: If K⊆K' and both bodies contain zero in their interior, then λ_i(L,K')≤λ_i(L,K) for every i.
- `TauCeti.GeometryOfNumbersPlan.successiveMin_monotone_lattice`: If L≤M are discrete full lattices in the same E, then λ_i(M,K)≤λ_i(L,K).
- `TauCeti.GeometryOfNumbersPlan.successiveMin_smul_body`: For c>0, λ_i(L,cK)=λ_i(L,K)/c. The scalar action on ConvexBody is the existing one.
- `TauCeti.GeometryOfNumbersPlan.successiveMin_linearEquiv`: Let e:E≃_R F, L'=e(L) as integral submodules, and K'=e(K) as convex bodies. For valid indices i,j with i.val=j.val, λ_j(L',K')=λ_i(L,K). Finite-dimensional normed real E,F and the discrete/full/interior hypotheses are understood. The equivalence need not be orthogonal or unimodular.
- `TauCeti.GeometryOfNumbersPlan.successiveMin_first_le_iff`: If d>0 and r≥0, λ_0(L,K)≤r if and only if there exists x∈L with x≠0 and x∈rK.
- `TauCeti.GeometryOfNumbersPlan.successiveMin_box`: Let b be a real basis of E indexed by Fin d, L=span_Z(range b), and a:Fin d→R positive and nondecreasing. If K is the convex body {x:∀j, a_j|b.repr(x)_j|≤1}, then λ_i(L,K)=a_i for every i.
- `TauCeti.GeometryOfNumbersPlan.successiveMin_crosspolytope`: With b,L and positive nondecreasing a as for rectangular-body-minima, let K={x:Σ_j a_j|b.repr(x)_j|≤1}. Then λ_i(L,K)=a_i. Together with weighted-crosspolytope-volume, this attains equality in minkowski-second-lower.

Definition tests (each has a corresponding typed example):

- `successive_min_interval_half` — For L=Z⊂R and K=[−2,2], λ_0(L,K)=1/2.
- `successive_min_rectangle_2_3` — For L=Z² and K={|x_0|≤1/2, |x_1|≤1/3}, (λ_0,λ_1)=(2,3).
- `successive_min_empty_product` — For the zero lattice in R^0 and its singleton convex body, the product over all minima indices is 1.
- `successive_min_scaled_lattice` — For L=2Z in R and K=[−1,1], λ_0=2, not 1.
- `successive_min_unit_ball_norm` — On K=closedBall(0,1), the defining rank condition is dim span{x∈L : norm x≤r}≥i.val+1.
- `successive_min_no_integral_basis` — In Z² with the unit square, vectors (1,1),(1,−1) independently attain both minima 1 but their integral span has index two.
- `successive_min_closed_boundary` — In Z and K=[−1,1], the attained minimum 1 has nonzero boundary witnesses; the strict sublevel {x∈Z : gauge K x<1} is {0}.

Source: §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### Finite lattice points below a gauge bound

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/finite-gauge-sublevel` — lemma; unchecked.

For every real R, the set {x∈L : gauge K x≤R} is finite.

Hypotheses: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof plan:

1. If R<0 the set is empty by gauge_nonneg. If R=0 it is {0}, because K is bounded and absorbs every vector, and gauge_eq_zero applies.
2. For R>0, positive homogeneity and gauge_le_one_iff_mem_closure identify the gauge sublevel with R·K; K is closed. This is compact, hence bounded.
3. Choose an integral basis of the full lattice, extend it to a real basis via ofZLatticeBasis and use its integral-span equality. ZSpan.setFinite_inter gives finiteness of the intersection with the bounded dilate.

API:

- `TauCeti.GeometryOfNumbersPlan.finite_gauge_sublevel`: For every real R, the set {x∈L : gauge K x≤R} is finite.

Acceptance cases:

- Negative bound gives the empty set.
- Bound zero gives precisely the zero lattice vector.
- For Z² and the unit square, bound 2 gives 25 points.

Source: §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### An attained least gauge outside a proper subspace

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minimum-outside-subspace` — lemma; unchecked.

If W<E is a proper real subspace, there is v∈L∖W with gauge K v≤gauge K x for every x∈L∖W. In particular the selected gauge is positive.

Hypotheses: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof plan:

1. Fullness of L gives y∈L∖W: otherwise span_R L≤W contradicts W≠top.
2. Set R=gauge K y. The points of L∖W with gauge≤R form a nonempty subset of finite-gauge-sublevel. Choose one minimizing gauge with Set.exists_min_image.
3. Any other point outside W either lies in this finite set or has gauge>R≥gauge v. Since 0∈W, v≠0, and gauge_pos proves strict positivity. No enumeration of an infinite set or unproved compactness of L∖W is used.

API:

- `TauCeti.GeometryOfNumbersPlan.exists_min_gauge_outside`: If W<E is a proper real subspace, there is v∈L∖W with gauge K v≤gauge K x for every x∈L∖W. In particular the selected gauge is positive.

Acceptance cases:

- For Z², the rectangle with minima 2,3, and W=Re_0, the least outside gauge is 3.
- W=top is excluded because the complement is empty.

Source: §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### A greedy independent family with a strict-sublevel flag

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/greedy-minimum-family` — lemma; unchecked.

There is a real-linearly-independent family v:Fin d→L such that a_i=gauge K v_i is positive and nondecreasing, and every x∈L with gauge K x<a_i lies in span_R{v_j:j<i}. The family has d members and thus spans E over R. No integral-basis claim is made.

Hypotheses: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof plan:

1. Inductively construct a family of length k≤d. Its span has dimension k by finrank_span_eq_card, so is proper for k<d. Choose v_k of least gauge outside this span by minimum-outside-subspace.
2. Append v_k; linearIndependent_finSucc' gives independence from nonmembership. Previously chosen least gauges are no greater than the new one, because the candidate set outside the growing span shrinks. Each new vector is nonzero, so its gauge is positive.
3. Minimality of v_k implies that every strictly shorter lattice vector is already in the old span. Preserve all earlier strict-sublevel assertions when appending.
4. At k=d, independence and the dimension count give spanning. This finite recursion also constructs the empty family when d=0 and does not claim that independent minimum vectors are a Z-basis.

API:

- `TauCeti.GeometryOfNumbersPlan.exists_greedy_gauge_family`: There is a real-linearly-independent family v:Fin d→L such that a_i=gauge K v_i is positive and nondecreasing, and every x∈L with gauge K x<a_i lies in span_R{v_j:j<i}. The family has d members and thus spans E over R. No integral-basis claim is made.

Acceptance cases:

- Repeated minima are allowed: the unit square has both values 1.
- Strict inequality in the flag is essential: e_0 has gauge equal to the first minimum and does not lie in the zero prefix.

Source: §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### Attainment of the rank threshold

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-is-least` — lemma; unchecked.

For every i:Fin d, λ_i(L,K) is the least element of A_i={r≥0 : dim span_R{x∈L : gauge K x≤r}≥i.val+1}.

Hypotheses: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof plan:

1. Use greedy-minimum-family and write a_i=gauge K v_i. Positivity and monotonicity show that v_0,…,v_i lie in the a_i-sublevel. Their span has dimension i+1, hence a_i∈A_i.
2. If r<a_i, every lattice point of gauge≤r has gauge<a_i, hence belongs to the span of the i previous vectors. Its span has dimension at most i, by Submodule.finrank_mono and finrank_span_eq_card. Such r cannot belong to A_i.
3. Thus a_i is the least element of the nonempty, bounded-below A_i. The defining real infimum equals this least element; transfer its IsLeast property and equality to λ_i. This establishes attainment before using a boundary threshold.

API:

- `TauCeti.GeometryOfNumbersPlan.successiveMin_isLeast`: For every i:Fin d, λ_i(L,K) is the least element of A_i={r≥0 : dim span_R{x∈L : gauge K x≤r}≥i.val+1}.

Acceptance cases:

- A_i contains its endpoint; replacing ≤ by < in the membership assertion is false.
- For the rectangle 2,3 the rank jumps from zero to one at 2 and from one to two at 3.

Source: §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### Positivity of each successive minimum

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-pos` — lemma; unchecked.

For every i:Fin d, 0<λ_i(L,K).

Hypotheses: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof plan:

1. By successive-minimum-is-least the value equals the gauge of the corresponding greedy vector.
2. That vector is outside a subspace containing zero; gauge_pos or the positivity part of greedy-minimum-family gives the result.

API:

- `TauCeti.GeometryOfNumbersPlan.successiveMin_pos`: For every i:Fin d, 0<λ_i(L,K).

Acceptance cases:

- For (1/2)Z and the unit interval the minimum is 1/2: positivity does not imply a lower bound of 1.

Source: §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### Ordering of successive minima

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-monotone` — lemma; unchecked.

The function i↦λ_i(L,K), on Fin d, is monotone.

Hypotheses: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof plan:

1. For i≤j, membership in A_j implies membership in A_i because i+1≤j+1.
2. Apply the least-element statement at i to the attained threshold λ_j. Equal consecutive values are permitted.

API:

- `TauCeti.GeometryOfNumbersPlan.successiveMin_monotone`: The function i↦λ_i(L,K), on Fin d, is monotone.

Acceptance cases:

- The unit cube has a constant sequence of minima; strict monotonicity is false.

Source: §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### Closed-dilate rank characterization

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-le-iff` — lemma; unchecked.

For r≥0, λ_i(L,K)≤r if and only if i.val+1≤dim_R span_R((L:Set E)∩r·(K:Set E)).

Hypotheses: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof plan:

1. Positive homogeneity and the closed unit gauge sublevel identify {x:gauge K x≤r} with rK when r>0. For r=0 both sets are {0}, using boundedness/absorbency and gauge_eq_zero.
2. The rank condition is upward closed in r because gauge sublevels are nested. The least-element result therefore identifies its truth set exactly with [λ_i,∞).
3. This is the original source definition using dilates, not just an inequality for an unrelated gauge.

API:

- `TauCeti.GeometryOfNumbersPlan.successiveMin_le_iff`: For r≥0, λ_i(L,K)≤r if and only if i.val+1≤dim_R span_R((L:Set E)∩r·(K:Set E)).

Acceptance cases:

- At r=0 the right side is false for every valid index.
- At r=λ_i the threshold holds.

Source: §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### Simultaneously attained independent minimum vectors

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-witnesses` — theorem; unchecked.

There exists a real basis b indexed by Fin d such that b_i∈L, gauge K b_i=λ_i(L,K), and every x∈L of gauge<λ_i lies in span_R{b_j:j<i}. In particular b_i∈λ_iK and all minimum bounds are attained by one independent family.

Hypotheses: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof plan:

1. Take the greedy family, convert its ambient vectors to a real basis using the full dimension count, and preserve its literal vectors.
2. Use successive-minimum-is-least to identify every greedy gauge with the corresponding minimum. Its strict-sublevel flag transfers unchanged.
3. Closed gauge sublevels at the positive λ_i give b_i∈λ_iK. This result is stronger than separate existence of unrelated rank witnesses and weaker than an integral basis.

API:

- `TauCeti.GeometryOfNumbersPlan.exists_successiveMin_witnesses`: There exists a real basis b indexed by Fin d such that b_i∈L, gauge K b_i=λ_i(L,K), and every x∈L of gauge<λ_i lies in span_R{b_j:j<i}. In particular b_i∈λ_iK and all minimum bounds are attained by one independent family.

Acceptance cases:

- The unit-square diagonal pair has determinant −2 and attains both minima, so attainment alone does not certify an integral basis.
- The zero-dimensional family is an empty real basis and has no minimum value to evaluate.

Source: §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### Larger bodies have smaller minima

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-antitone-body` — lemma; unchecked.

If K⊆K' and both bodies contain zero in their interior, then λ_i(L,K')≤λ_i(L,K) for every i.

Hypotheses: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof plan:

1. At the attained threshold of K, every lattice vector in rK also lies in rK'. Apply span/rank monotonicity.
2. Apply the closed-dilate characterization for K'.

API:

- `TauCeti.GeometryOfNumbersPlan.successiveMin_antitone_body`: If K⊆K' and both bodies contain zero in their interior, then λ_i(L,K')≤λ_i(L,K) for every i.

Acceptance cases:

- Changing [−1,1] to [−2,2] divides the only minimum by two.

Source: §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### Sublattices have larger minima

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-monotone-lattice` — lemma; unchecked.

If L≤M are discrete full lattices in the same E, then λ_i(M,K)≤λ_i(L,K).

Hypotheses: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof plan:

1. For every nonnegative r, L∩rK⊆M∩rK. Apply rank monotonicity to their spans.
2. Use the attained threshold λ_i(L,K) and the closed-dilate characterization. A finite-index equality of minima is not inferred.

API:

- `TauCeti.GeometryOfNumbersPlan.successiveMin_monotone_lattice`: If L≤M are discrete full lattices in the same E, then λ_i(M,K)≤λ_i(L,K).

Acceptance cases:

- 2Z⊂Z gives minima 2 and 1 for the unit interval.

Source: §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### Positive body scaling inverts the minima

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-smul-body` — lemma; unchecked.

For c>0, λ_i(L,cK)=λ_i(L,K)/c. The scalar action on ConvexBody is the existing one.

Hypotheses: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof plan:

1. The map x↦cx is a homeomorphism, so cK again has zero in its interior.
2. Use the pinned identity gauge(cK)=c⁻¹ gauge(K). Thus the admissible thresholds for cK are exactly 1/c times those for K.
3. Transport the least element in both directions, using c>0 for order preservation. Do not use c=0, which collapses a positive-dimensional body and violates the hypotheses.

API:

- `TauCeti.GeometryOfNumbersPlan.successiveMin_smul_body`: For c>0, λ_i(L,cK)=λ_i(L,K)/c. The scalar action on ConvexBody is the existing one.

Acceptance cases:

- Scaling the unit interval by 3 changes its minimum from 1 to 1/3.

Source: §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### Invariance under a simultaneous linear change

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-linear-equiv` — lemma; unchecked.

Let e:E≃_R F, L'=e(L) as integral submodules, and K'=e(K) as convex bodies. For valid indices i,j with i.val=j.val, λ_j(L',K')=λ_i(L,K). Finite-dimensional normed real E,F and the discrete/full/interior hypotheses are understood. The equivalence need not be orthogonal or unimodular.

Hypotheses: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof plan:

1. For r≥0, linearity and bijectivity identify L'∩rK' with e(L∩rK). Their real spans correspond under the linear equivalence, so their dimensions agree.
2. The admissible thresholds are equal, and their defining infima are equal. The identity and composition laws follow by equality of image carriers and composition of linear equivalences.
3. Use the images of both lattice and body; moving only one does not preserve minima. Restricting a lower-rank lattice to its real span is an intrinsic instance on that subspace, not an ambient full-lattice assertion.

API:

- `TauCeti.GeometryOfNumbersPlan.successiveMin_linearEquiv`: Let e:E≃_R F, L'=e(L) as integral submodules, and K'=e(K) as convex bodies. For valid indices i,j with i.val=j.val, λ_j(L',K')=λ_i(L,K). Finite-dimensional normed real E,F and the discrete/full/interior hypotheses are understood. The equivalence need not be orthogonal or unimodular.

Acceptance cases:

- Scaling both Z and [−1,1] by 2 preserves minimum 1; scaling only the lattice gives 2.
- A shear acts simultaneously on the standard lattice and unit square without changing their two minima.

Source: §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### The first minimum detects a nonzero lattice point

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-first` — lemma; unchecked.

If d>0 and r≥0, λ_0(L,K)≤r if and only if there exists x∈L with x≠0 and x∈rK.

Hypotheses: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof plan:

1. Apply successive-minimum-le-iff at the zero index: the span of L∩rK must have dimension at least one.
2. A span has positive dimension exactly when its generating set contains a nonzero vector: if every generator is zero its span is bottom; conversely a nonzero generator gives a one-dimensional independent singleton.
3. This adapter uses the existing first theorem without reproving Blichfeldt or Minkowski first.

API:

- `TauCeti.GeometryOfNumbersPlan.successiveMin_first_le_iff`: If d>0 and r≥0, λ_0(L,K)≤r if and only if there exists x∈L with x≠0 and x∈rK.

Acceptance cases:

- For Z and the unit interval, r=1 has witnesses ±1, while every 0≤r<1 has none.

Source: §2.3, definition and Lemma 2.8, pp.23–24; Henk p.2 before Theorem 1.2. The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### Volume of a weighted cross-polytope in basis coordinates

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/weighted-crosspolytope-volume` — lemma; unchecked.

Let E be a finite-dimensional real inner-product space with canonical volume, o an orthonormal basis and b any real basis, both indexed by Fin n. For positive a_i, volume{x:Σ_i a_i·|b.repr(x)_i|≤1}=ofReal((2^n/n!)·|det_o(b)|/∏_i a_i). Dimension zero is included.

Hypotheses: E has the canonical inner-product volume; o is orthonormal and b is a basis, not an arbitrary dependent family. Each a_i>0. n can be zero.

Proof plan:

1. In R^n the unit l1 ball has volume 2^n/n!: specialize the pinned volume_sum_rpow_le to p=1,r=1 and simplify Gamma(n+1)=n!. For n=0 use the singleton finite-product measure directly, since the quoted closed-ball theorem requires a nonempty index. No new standard-ball-volume theorem is planned.
2. The weighted body is the image of that unit l1 ball under the invertible map t↦Σ_i (t_i/a_i)b_i. Transport through the volume-preserving o coordinates and the existing ofLp map.
3. Its absolute determinant is |det_o(b)|/∏a_i. Apply the pinned Haar image formula and simplify ENNReal factors, using positivity of the a_i and finiteness of the volume.

API:

- `TauCeti.GeometryOfNumbersPlan.weighted_crosspolytope_volume`: Let E be a finite-dimensional real inner-product space with canonical volume, o an orthonormal basis and b any real basis, both indexed by Fin n. For positive a_i, volume{x:Σ_i a_i·|b.repr(x)_i|≤1}=ofReal((2^n/n!)·|det_o(b)|/∏_i a_i). Dimension zero is included.

Acceptance cases:

- n=0 gives volume one.
- With the standard basis and a=(2,3), the planar diamond has area 1/3.
- Replacing the basis by (2e_0,3e_1), with a=(1,1), gives area 12.

Source: §2.3, proof of the lower bound in Theorem 2.9, printed p.27 (physical p.17). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### A symmetric body contains its weighted inscribed cross-polytope

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/crosspolytope-containment` — lemma; unchecked.

Let K be symmetric about zero with zero in its interior. For a real basis b and positive a_i, if b_i∈a_iK for every i, then {x:Σ_i a_i|b.repr(x)_i|≤1}⊆K.

Hypotheses: K:ConvexBody E, 0∈interior K and x∈K implies −x∈K. b is a finite real basis. All a_i are positive. The containment is independent of any lattice or volume normalization.

Proof plan:

1. Membership b_i∈a_iK implies gauge K b_i≤a_i.
2. Expand x in the basis. The native gauge_sum_le bounds its gauge by the sum of the gauges of the coordinate multiples. Positive homogeneity and gauge_neg handle each sign, giving gauge(t b_i)=|t| gauge(b_i).
3. The weighted l1 constraint bounds this sum by 1. Since K is closed, the gauge≤1 characterization gives x∈K.
4. The coefficient index is the number of vectors, not the ambient coordinate dimension of a separate presentation; this uses the corrected convention in Evertse Lemma 2.10 (E8).

API:

- `TauCeti.GeometryOfNumbersPlan.weighted_crosspolytope_subset`: Let K be symmetric about zero with zero in its interior. For a real basis b and positive a_i, if b_i∈a_iK for every i, then {x:Σ_i a_i|b.repr(x)_i|≤1}⊆K.

Acceptance cases:

- The diamond with vertices ±e_0,±e_1 is contained in the unit square.
- Without symmetry, containing b_i/a_i does not imply containing its negative.

Source: §2.3, Lemma 2.10 and lower-bound proof, printed pp.26–27 (physical pp.16–17). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### An independent lattice family has determinant at least the covolume

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/lattice-determinant-lower-bound` — lemma; unchecked.

In a finite-dimensional real inner-product space with canonical volume, let L be a discrete full lattice, o an orthonormal basis and b a real basis with every b_i∈L. Then covolume(L)≤|det_o(b)|.

Hypotheses: Both bases have the full ambient rank, including rank zero. L is discrete and full. The measure is intrinsic canonical Euclidean volume.

Proof plan:

1. Set M=span_Z(range b). It is a discrete full lattice by the existing integral-span-of-real-basis instances, and M≤L.
2. The existing integral basis b.restrictScalars identifies covolume(M) with |det_o(b)| by covolume_eq_det_mul_measureReal and the unit volume of an orthonormal fundamental domain.
3. The pinned index formula gives covolume(M)/covolume(L)=[L:M], a natural number. Both covolumes are positive, so this integer is nonzero and hence at least one. Multiply by the positive covolume(L).
4. The independent family need not be an integral basis of L; index two in the diagonal square example is retained.

API:

- `TauCeti.GeometryOfNumbersPlan.covolume_le_abs_basis_det`: In a finite-dimensional real inner-product space with canonical volume, let L be a discrete full lattice, o an orthonormal basis and b a real basis with every b_i∈L. Then covolume(L)≤|det_o(b)|.

Acceptance cases:

- The diagonal and antidiagonal vectors in Z² have absolute determinant 2≥1.
- For 2Ze_0⊕3Ze_1 the basis determinant and covolume are both 6.

Source: §2.3, lower-bound proof, printed p.27 (physical p.17). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### Minkowski’s sharp lower product inequality

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-lower` — theorem; unchecked.

For a discrete full lattice L in a finite-dimensional real inner-product space E and a symmetric convex body K with zero in its interior, (2^d/d!)·covolume(L)≤(∏_{i:Fin d}λ_i(L,K))·volume.real(K). Here d=finrank_R E and volume is intrinsic canonical Euclidean volume. The formula holds also for d=0.

Hypotheses: E is a finite-dimensional real inner-product space with Borel structure and canonical volume. L is a discrete full integral submodule. K is compact convex, centrally symmetric about zero, and has zero in its interior. A lower-rank lattice is first considered as a full lattice in its real span with that span’s own volume. No ambient-volume inequality for a measure-zero subspace is claimed.

Proof plan:

1. Choose the simultaneously attained real basis b from successive-minimum-witnesses and write a_i=λ_i>0. Its vectors lie in a_iK.
2. By crosspolytope-containment the corresponding weighted cross-polytope D lies in K. Both are compact, so their ENNReal volumes are finite and volume monotonicity passes to real volumes.
3. Apply weighted-crosspolytope-volume and lattice-determinant-lower-bound: volume(D)≥(2^d/d!)covolume(L)/(∏a_i). Multiply by the positive product.
4. When d=0, the empty product and factorial are one, and K is the unique singleton with canonical volume one and the only lattice has covolume one. Thus equality holds; no positive-dimensional volume theorem or invalid minimum index is applied.

API:

- `TauCeti.GeometryOfNumbersPlan.minkowski_second_lower`: For a discrete full lattice L in a finite-dimensional real inner-product space E and a symmetric convex body K with zero in its interior, (2^d/d!)·covolume(L)≤(∏_{i:Fin d}λ_i(L,K))·volume.real(K). Here d=finrank_R E and volume is intrinsic canonical Euclidean volume. The formula holds also for d=0.

Acceptance cases:

- For Z² and the unit diamond, product 1 times area 2 equals 2²/2!.
- For Z² and the unit square, product 1 times area 4 is strictly larger than 2.
- For 2Z and [−3,3], minimum 2/3 times length 6 equals 4=(2/1!)·2.
- For dimension zero both sides are 1.

Source: §2.3, Theorem 2.9 and its complete lower-bound proof, printed pp.24,26–27. The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### All prescribed minima of a coordinate box

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/rectangular-body-minima` — theorem; unchecked.

Let b be a real basis of E indexed by Fin d, L=span_Z(range b), and a:Fin d→R positive and nondecreasing. If K is the convex body {x:∀j, a_j|b.repr(x)_j|≤1}, then λ_i(L,K)=a_i for every i.

Hypotheses: b:Basis (Fin d) R E where d=finrank_R E. L is exactly its integral span. All a_i>0 and a is monotone. The stated set is the carrier of K.

Proof plan:

1. Positive a_j make the set a compact convex symmetric neighborhood of zero, by its basis-coordinate box description.
2. The first i+1 basis vectors lie in a_iK, giving rank at least i+1 at r=a_i.
3. For 0≤r<a_i and x∈L∩rK, every coordinate with j≥i is an integer of absolute value at most r/a_j<1, hence zero. Thus all such points lie in the span of the first i vectors.
4. Use successive-minimum-le-iff and positivity to identify the exact endpoint. For a repeated value the rank may jump by more than one; all corresponding minima equal that value.

API:

- `TauCeti.GeometryOfNumbersPlan.successiveMin_box`: Let b be a real basis of E indexed by Fin d, L=span_Z(range b), and a:Fin d→R positive and nondecreasing. If K is the convex body {x:∀j, a_j|b.repr(x)_j|≤1}, then λ_i(L,K)=a_i for every i.

Acceptance cases:

- a=(2,3) gives minima 2,3.
- a=(1,1,4) gives a repeated first value; the two shortest lattice vectors may be opposites and still fail to be independent.

Source: §2.3, Example 2, printed pp.25–26 (physical pp.15–16). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### Sharpness via prescribed cross-polytope minima

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/crosspolytope-minima` — theorem; unchecked.

With b,L and positive nondecreasing a as for rectangular-body-minima, let K={x:Σ_j a_j|b.repr(x)_j|≤1}. Then λ_i(L,K)=a_i. Together with weighted-crosspolytope-volume, this attains equality in minkowski-second-lower.

Hypotheses: b:Basis (Fin d) R E where d=finrank_R E. L is exactly its integral span. All a_i>0 and a is monotone. The weighted l1 set is the carrier of K.

Proof plan:

1. The positive weighted l1 ball in basis coordinates is compact, convex, symmetric and a neighborhood of zero. The first i+1 basis vectors belong to a_iK.
2. If 0≤r<a_i, a lattice point in rK has each weighted absolute coordinate at most r. Its integer coordinates with j≥i must vanish, exactly as in the coordinate-box argument.
3. Hence the rank threshold is exactly a_i by successive-minimum-le-iff. The proof is supplied here for the source’s Exercise 2.9, rather than treating an exercise as a proved theorem.
4. The existing determinant/covolume identification for L=span_Z b and weighted-crosspolytope-volume show that product(a)·volume(K)=(2^d/d!)covolume(L).

API:

- `TauCeti.GeometryOfNumbersPlan.successiveMin_crosspolytope`: With b,L and positive nondecreasing a as for rectangular-body-minima, let K={x:Σ_j a_j|b.repr(x)_j|≤1}. Then λ_i(L,K)=a_i. Together with weighted-crosspolytope-volume, this attains equality in minkowski-second-lower.

Acceptance cases:

- a=(2,3), b standard in R² gives minima 2,3 and area 1/3, so the product-volume is 2.
- Empty dimension has no minimum index and still attains the volume-product equality 1.

Source: §2.3, Example 3 and Exercise 2.9, printed p.26 (physical p.16). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### Volume of a closed linear-forms parallelepiped

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/linear-forms-box-volume` — lemma; unchecked.

For n≥0, an invertible real n×n matrix A and positive a_i, the set C={x∈R^n:∀i, |(Ax)_i|≤a_i} has volume ofReal(2^n·(∏a_i)/|det A|).

Hypotheses: The matrix is square and det A≠0; all a_i>0. Lebesgue measure is the existing product volume on Fin n→R. n=0 is allowed for this volume identity.

Proof plan:

1. Write C as the inverse image of the closed coordinate box [−a,a] under the native linear map Matrix.toLin'(A).
2. Use the pinned determinant adapter and nonzero determinant to apply the Haar preimage formula. The scale factor is |det A|⁻¹.
3. Use Real.volume_Icc_pi for the target box: its volume is the product of 2a_i, or 2^n times the product of a_i. All factors are positive, so the ENNReal and real expressions agree.
4. The same inverse linear equivalence transports compactness of the box; symmetry and convexity follow from linearity and the coordinate inequalities. These are native set properties, not a new parallelepiped type. The empty-dimensional formula is 1.

API:

- `TauCeti.GeometryOfNumbersPlan.linear_forms_box_volume`: For n≥0, an invertible real n×n matrix A and positive a_i, the set C={x∈R^n:∀i, |(Ax)_i|≤a_i} has volume ofReal(2^n·(∏a_i)/|det A|).

Acceptance cases:

- For n=1, A=(−2) and a=3 the set is [−3/2,3/2] of length 3.
- For A=diag(2,3), a=(2,3), the region is the unit square of area 4.
- For n=0 the determinant, coordinate product and volume are one.

Source: §2.2, Corollary 2.6, printed p.20 (physical p.10). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

### Minkowski’s boundary linear-forms theorem

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-linear-forms` — theorem; unchecked.

For n≥1, an invertible real n×n matrix A and positive a_i with ∏a_i≥|det A|, there exists z∈Z^n, z≠0, with |Σ_j A_ij z_j|≤a_i for every i. Every coordinate inequality is non-strict, including at equality in the determinant bound.

Hypotheses: n≥1, A:Matrix(Fin n,Fin n,R), det A≠0, all a_i>0, and ∏a_i≥|det A|. No rationality of the matrix entries is required.

Proof plan:

1. Apply linear-forms-box-volume to the compact convex symmetric set C. The product hypothesis gives volume(C)≥2^n.
2. Use the standard real basis, its integral span and the native fundamental domain [0,1)^n. Its volume is one by ZSpan.volume_fundamentalDomain, and ZSpan.isAddFundamentalDomain' supplies the subgroup fundamental-domain contract.
3. The integral-span lattice is countable and discrete. Since n≥1, the ambient space is nontrivial. Instantiate the pinned compact version exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure; compactness is essential for the non-strict boundary threshold.
4. The returned nonzero real lattice vector has integer coordinates in the standard basis. Read them as z:Fin n→Z; injectivity of the integer casts preserves nonzeroness, and membership in C gives exactly the displayed inequalities.
5. The source pushes the lattice forward into the unit cube. This proof pulls the cube back and keeps the standard lattice: the invertible matrix identifies the two arguments, with the same absolute determinant and boundary convention.

API:

- `TauCeti.GeometryOfNumbersPlan.minkowski_linear_forms`: For n≥1, an invertible real n×n matrix A and positive a_i with ∏a_i≥|det A|, there exists z∈Z^n, z≠0, with |Σ_j A_ij z_j|≤a_i for every i. Every coordinate inequality is non-strict, including at equality in the determinant bound.

Acceptance cases:

- For n=1, A=(2), a=2, z=1 is a boundary witness; replacing ≤ with < would eliminate every nonzero integer witness.
- A determinant of −2 has the same threshold as 2.
- n=0 is excluded: its only integer vector is zero despite the empty-product determinant inequality.

Source: §2.2, Corollary 2.6 and complete proof, printed p.20 (physical p.10). The packet gives the exact prerequisite declarations and distinguishes source statements from their proved consequences.

## GN.4: finite-index packing and the first-minimum count

This slice reads Henk’s complete §2 proof in the seven-page [preprint](https://arxiv.org/pdf/math/0204158v1), especially Lemma 2.1 and the deduction of (1.3), p.4. All seven pages were freshly reread, and rendered pp.3–5 were checked. The source version and E9 floor correction are unchanged. The published version is not claimed read.

The proof uses ordinary sets, native finite cardinalities, integral bases and subgroup quotients. It introduces no new counting, lattice or convex-body carrier. Both the index of qL and the index/covolume ratio are already built. In particular, pinned `AddSubgroup.index_range_nsmul` supplies q^rank for a finite free integral group; Tau Ceti’s stronger finitely-generated torsion formula is not needed. The separation wrapper below imports that existing result. A separate residue-coordinate proof checks the wrapper independently in scratch.

The natural index and natural cardinal return zero on infinite arguments. Every finite target used below has an explicit reason to be finite; the value zero is never treated as such a reason. The geometric arguments retain closed boundaries and zero in the interior. The first minimum has zero-based index 0 and is only formed in positive dimension.

### Counting by differences in finite-index cosets

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.4/coset-difference-bound` — lemma; unchecked.

For an additive commutative group G, finite-index subgroup N, sets S,T⊆G with T finite, suppose x,y∈S and x−y∈N imply x−y∈T. Then S is bounded in cardinality by |S|≤[G:N]·|T|, with both cardinalities the native natural cardinal. No finiteness assumption on S is needed: the proof injects it into a finite set.

Hypotheses: N has finite index; T is finite. No topology, convexity, lattice, or prior finiteness of S is required.

Proof plan:

1. Let π:G→G/N and R=π(S). For every occupied coset c∈R choose a_c∈S with π(a_c)=c. Empty S gives an empty family, so no global representative in S is demanded.
2. Map x∈S to (π(x),x−a_{π(x)}) in (G/N)×T. QuotientAddGroup.eq_iff_sub_mem and the difference hypothesis establish membership in T.
3. Equality of first coordinates identifies the selected representative; equality of second coordinates then cancels the same representative to give x=y. Nat.card_le_card_of_injective and Nat.card_prod give the bound, using the finite quotient instance and finite T.
4. Nat.card_coe_set_eq identifies set cardinalities. The subgroup index is a genuine finite count here, not its infinite-index zero sentinel.

API: `TauCeti.GeometryOfNumbersPlan.ncard_le_index_mul`, with the contract just stated.

Acceptance tests:

- `count_empty` — The empty subset of Z has natural cardinal zero.
- `count_infinite_index_sentinel` — For N={0} in Z, N.index=0 but |{0}|=1; finite-index hypotheses are essential.

Source: §2, Lemma 2.1 proof, p.4. Worker's additive-group formulation of the source's coset-fiber difference injection, proved with the read native quotient and finite-cardinality APIs; not a newly defined carrier.

### Henk’s sublattice counting lemma

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.4/henk-sublattice-count` — theorem; unchecked.

Let E be a finite-dimensional real normed space, L a discrete full integral lattice, M≤L a submodule with nonzero finite relative index m=[L:M], and K a symmetric convex body with 0 in its interior. Then |L∩K|≤m·|M∩2K|. Counts include boundary points and the origin. In real inner-product coordinates with canonical volume and full M, the already-built index/covolume formula identifies m=covol(M)/covol(L), exactly as in Henk Lemma 2.1.

Hypotheses: L is discrete and full; M≤L; M.toAddSubgroup.relIndex(L.toAddSubgroup)≠0. K is compact convex, 0∈interior K, and x∈K implies −x∈K. Dimension zero is allowed.

Proof plan:

1. Work in the additive group L, with N the pullback of M. Its native index is exactly m by AddSubgroup.relIndex; the explicit nonzero-index assumption supplies N.FiniteIndex.
2. Take S={x∈L:x∈K} and T={x∈L:x∈M and x∈2K}. The latter is finite: it lies in the gauge≤2 sublevel of L, since membership in 2K gives gauge≤2 by gauge_le_of_mem; use finite-gauge-sublevel. This argument does not assume an unproved new lattice structure on M.
3. If x,y∈S lie in the same N-coset, x−y∈M. Symmetry puts −y in K; Convex.midpoint_mem puts (x−y)/2 in K, hence x−y∈2K. Apply coset-difference-bound.
4. The subtype inclusions L→E are injective and identify S and T with the two ambient intersections; Set.ncard_image_of_injective transfers the counts.
5. For the source's Euclidean full-sublattice presentation, covolume_div_covolume_eq_relIndex' and positivity of both covolumes supply the nonzero index and its determinant-ratio expression. This is an existing baseline identity, not a new covolume theorem.

API: `TauCeti.GeometryOfNumbersPlan.henk_sublattice_count`, with the contract just stated.

Acceptance tests:

- `henk_interval_counts` — The set {−1,0,1} has three elements, {−2,0,2} has three elements, and 3≤2·3.
- `count_rank_zero` — The singleton consisting of the zero function Fin 0→Z has cardinal one.

Source: §2, Lemma 2.1 and its complete proof, p.4. Exact counting inequality in relative-index form; the source determinant ratio is already baseline. The normed-space formulation and explicit finite-index hypothesis are justified by the supplied difference proof.

### Counting separated points in integral basis residues

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.4/residue-separation-count` — lemma; unchecked.

Let G be an additive commutative group with an integral basis b indexed by Fin n, let q≥1 be a natural number, and let S⊆G. Suppose x,y∈S and x−y=qz for some z∈G imply x=y. Then |S|≤q^n. The basis is an integral basis of all G, not merely an independent family; n=0 is included.

Hypotheses: b:Basis(Fin n,Z,G); q is a positive natural number. Separation is modulo qG. No topology or prior finiteness of S is required.

Proof plan:

1. Let N be the existing range of the multiplication-by-q homomorphism on G. The given integral basis supplies native finite/free instances and Module.finrank_eq_card_basis gives finrank(Z,G)=n.
2. Import AddSubgroup.index_range_nsmul: [G:N]=q^n. Since q>0 this is nonzero, hence N.FiniteIndex. The entire quotient-cardinality computation is already built, not a new node.
3. Apply coset-difference-bound with T={0}. If x−y∈N, its range witness gives x−y=qz (natural and integral scalar multiplication agree). Separation forces x=y, hence x−y=0.
4. The singleton has cardinal one, so the imported index identity gives |S|≤q^n. This includes n=0. A separate scratch proof reducing basis coordinates modulo q is an independent verification of this same finite-set wrapper, not a replacement plan for the baseline index theorem.

API: `TauCeti.GeometryOfNumbersPlan.ncard_le_pow_of_no_congruent`, with the contract just stated.

Acceptance tests:

- `residue_three_distinct` — The residue images of −1,0,1 in ZMod 3 have cardinal three.
- `residue_collision` — In ZMod 2 the integers 0 and 2 have equal residue, although they differ in Z.
- `residue_zero_modulus` — Nat.card(ZMod 0)=0; this does not make ZMod 0 finite.

Source: §2, p.4, inequality (1.3) deduction after Lemma 2.1. Finite-set separation wrapper for the source's q^n index step. The exact index is already AddSubgroup.index_range_nsmul and is imported; native quotient and residue carriers are not replanned.

### Excluding nonzero points in a dilated sublattice

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.4/homothetic-lattice-avoidance` — lemma; unchecked.

For a discrete full integral lattice L in finite-dimensional real normed E, a convex body K with 0 in its interior, d=dim E>0, and q≥1 natural with 2/q<λ_0(L,K), one has (qL)∩2K={0}. Here qL is the pointwise real scalar image of the native lattice set. Symmetry is not needed for this lemma.

Hypotheses: d>0, q>0, and the threshold is strict: 2/q<λ_0. L is discrete/full and K has zero in its interior.

Proof plan:

1. If v∈qL∩2K, write v=qz with z∈L. If v≠0 then z≠0 since q≠0.
2. From v∈2K divide the scalar equality by q>0 to obtain z∈(2/q)K. Apply successive-minimum-first at the nonnegative radius 2/q to infer λ_0≤2/q, contradicting the strict threshold.
3. Thus only zero remains. Conversely zero lies in L and K, hence in both dilates. The argument uses actual closed-body membership, not a switch from ≤ to < on boundary points.

API: `TauCeti.GeometryOfNumbersPlan.homothetic_lattice_avoidance`, with the contract just stated.

Acceptance tests:

- `homothetic_three_avoids` — An integer divisible by 3 with absolute value at most 2 is zero.
- `homothetic_equality_fails` — 2 is nonzero, divisible by 2, and has absolute value at most 2; also 2/2=1.

Source: §2, p.4, inequality (1.3) deduction after Lemma 2.1. Source's qL avoidance argument, expressed using the already planned closed-dilate first-minimum characterization; symmetry is explicitly unnecessary for this intermediate implication.

### Lattice-point bound from the first minimum

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.4/first-minimum-count` — theorem; unchecked.

For a discrete full integral lattice L in finite-dimensional real normed E of positive dimension d and a symmetric convex body K with 0 in its interior, |L∩K|≤(floor(2/λ_0(L,K))+1)^d. The floor is the natural floor of the positive real argument; λ_0 is the source's first minimum. Counts include closed boundary points. This is Henk (1.3), not Conjecture 1.4 and not the stronger Theorem 1.5.

Hypotheses: d>0; L discrete/full; K compact convex symmetric about zero with 0 in its interior.

Proof plan:

1. By successive-minimum-pos, λ_0>0. Put q=floor(2/λ_0)+1. Then q≥1 and Nat.lt_floor_add_one gives 2/λ_0<q; multiplying by positive λ_0 and dividing by positive q yields 2/q<λ_0, including when 2/λ_0 is an integer.
2. Use Module.finBasisOfFinrankEq and ZLattice.rank to choose an integral basis of L indexed by Fin d. This basis is unrelated to the attained real minimum-vector basis, which need not be integral.
3. For x,y∈L∩K with x−y=qz in L, symmetry and Convex.midpoint_mem put x−y∈2K. Its membership in qL and homothetic-lattice-avoidance force x−y=0, hence x=y.
4. Apply residue-separation-count in the group L and transfer its set cardinal through the injective inclusion into E. That wrapper imports Mathlib's exact qG index computation, so the source's q^d step is already baseline.
5. Do not replace floor(2/λ_0)+1 by a ceiling: at integral 2/λ_0 the extra one is necessary for strict avoidance. Positive dimension is required only to form the first-minimum index; the general residue estimate separately covers dimension zero.

API: `TauCeti.GeometryOfNumbersPlan.lattice_count_le_first_minimum`, with the contract just stated.

Acceptance tests:

- `first_min_cube_count` — The product {−1,0,1}×{−1,0,1} has cardinal nine, equal to (floor(2/1)+1)^2.
- `first_min_small_body` — For λ_0=3 the factor floor(2/λ_0)+1 is one.
- `first_min_anisotropic` — For minima 1/2 and 3, the first-minimum square bound is 25 while the last-minimum substitution gives 1<5.

Source: p.2, inequality (1.3); §2 p.4, its complete deduction after Lemma 2.1. Exact first-minimum lattice-point bound. The source floor convention is retained per E9; the finite-set wrapper imports the already-built q^d index.

The sharp first-minimum count can be an equality: the unit cube in Z^d contains 3^d points. Its factor is floor(2/λ_0)+1, not ceiling(2/λ_0), because an integer threshold requires moving strictly past it. For an anisotropic body the estimate may be loose; it cannot substitute the last minimum for the first. The source’s conjectural product of floor factors is not exported as a theorem.

Nothing in this finite slice establishes Davenport’s semialgebraic multiset/projection-volume error, the polar covering theorem requested by the Diophantine roadmap, or the upper product-volume inequality requested by the compact-model and Diophantine consumers. Those contracts and their owners are unchanged.

## Compatible integral flags and Henk's product count

The remaining finite proof of Henk Theorem 1.5 has three parts: choose one integral basis compatible with all the minimum sublevels, round the reciprocal minima so their integer factors divide one another, and use the last nonzero coordinate to exclude points of the resulting sublattice from the doubled body. Each non-routine interface below is a declaration. This gives a count with the explicit factor 2^(d−1), not the source's stronger factor-one conjecture or the sharp upper volume inequality.

Use a finite-dimensional real inner-product space, a discrete full integral lattice L, a convex body K with zero in its interior, and the existing minimum invariant. Native Basis.flag at k means the span of the first k basis vectors. No flag or sublattice carrier is introduced. The geometric endpoint assumes central symmetry and dimension at least two; the earlier dimension-one count remains non-strict.

### Complete a prescribed primitive-intersection basis

Node GN.0/prescribed-primitive-basis; proposed declaration TauCeti.GeometryOfNumbersPlan.saturated_adapted_basis_of_basis.

If W is a real subspace whose intersection with L spans W, every prescribed integral basis c:Fin r→(L∩W) extends to an integral basis b of L indexed by Fin r disjoint-union Fin s, with r+s=d and initial vectors exactly c_i in E.

L∩W means the native lattice comap along W→E. The input c is a basis of this saturated intersection, not an independent family of nontrivial index.

Proof outline:

1. Take one completion b₀ and its intersection basis c₀ from saturated-adapted-basis. Equality of integral ranks permits reindexing its first block by Fin r.
2. Use the native basis-extension map to send each initial c₀-vector to the prescribed c-vector and keep each complementary vector fixed. Construct the inverse with the inverse c-to-c₀ coordinate change on the first block and identity on the complement.
3. Check both compositions on b₀ using the two basis coordinate identities. The block change is an integral linear automorphism, not just a real invertible map. Transport b₀ along it.
4. The native lattice rank identity gives r+s=d. No orthogonality or shortness of the complementary vectors is asserted.

The API is the stated relation interface. Contract tests:

- prescribed_basis_orientation: The columns (1,1),(0,−1) have determinant −1, so orientation reversal is allowed.
- prescribed_nonprimitive_column: Every matrix with first column (2,0) has even determinant, hence cannot be an integral basis of Z².

Source: Henk, p.3, simultaneous integral-basis statement before (2.1). Worker decomposition of the source's basis-completion step, preserving a prescribed basis rather than choosing an unrelated one.

### Integral basis adapted to a rational complete flag

Node GN.0/integral-rational-flag; proposed declaration TauCeti.GeometryOfNumbersPlan.exists_integral_basis_same_flag.

For a real basis w:Fin d→E with w_i∈L, there is an integral basis b:Fin d→L whose real extension has exactly the same native basis flags as w at every k=0,…,d.

Equality concerns real prefix spans, not equality of the vectors or their integral spans. The w_i need not be an integral basis.

Proof outline:

1. Induct on d; the zero-dimensional case uses the empty basis.
2. For d>0 let W be the real span of the first d−1 vectors of w. Their restricted independent family is a real basis of W by the native basis-of-span construction. They belong to L∩W and span W, so the comap intersection is a discrete full lattice in W.
3. Apply the induction hypothesis within W to get an integral basis matching every proper prefix. Complete this particular basis by prescribed-primitive-basis; the complement has rank one.
4. Reindex the initial block followed by the final vector as Fin d. Literal preservation of the initial vectors preserves every proper prefix, and the last prefix is E. Separate incompatible one-cut choices would not establish this simultaneous assertion.

The API is the stated relation interface. Contract tests:

- flag_independent_not_integral: The columns (1,1),(1,−1) have determinant −2: an independent integral-valued real basis is not necessarily an integral basis.
- flag_standard_prefix: For the standard real basis of R³, x lies in flag 2 exactly when x_2=0.

Source: Henk, p.3, prefix-span equality and (2.1). Supplies the entire integral rational-flag step without creating a new flag carrier.

### Integral basis for the strict minimum flag

Node GN.1/integral-minimum-flag; proposed declaration TauCeti.GeometryOfNumbersPlan.exists_integral_minimum_flag.

There is an integral basis b:Fin d→L such that x∈L and gauge_K(x)<λ_i imply x belongs to the real flag of b at i, the span of its first i vectors.

No bound on the individual gauges of b_i is claimed; only the attained real basis's flag is preserved.

Proof outline:

1. Take the simultaneously attained real basis and its strict-sublevel property from successive-minimum-witnesses.
2. Apply integral-rational-flag, since all the real basis vectors lie in L. Identify the existing prefix-span notation with native Basis.flag.
3. Rewrite the strict-sublevel memberships through the flag equalities. Repeated minima are allowed; dimension zero has an empty conclusion.

The API is the stated relation interface. Contract tests:

- minimum_flag_strict_boundary: The nonzero constant vector in R² does not belong to flag zero; equality at the first minimum is not a strict sublevel.
- minimum_flag_empty: The empty standard basis of R⁰ has flag zero equal to the entire zero space.

Source: Henk, pp.3–4, (2.1)–(2.3). Transfers the already planned attained-minimum flag, without pretending the minimum vectors themselves form an integral basis.

### One step of divisibility-compatible rounding

Node GN.4/divisible-rounding-step; proposed declaration TauCeti.GeometryOfNumbersPlan.divisible_rounding_step.

For positive naturals q,m with m<2q, let n=m if q≤m and n=q+m−(q mod m) otherwise. Then q≤n<2q and m divides n.

Subtraction is natural. Even when the remainder is zero the second branch advances to the next multiple; no least-multiple claim.

Proof outline:

1. If q≤m the assertion follows from n=m and the given bound.
2. Otherwise write q=m·a+r with 0≤r<m. Then n=m(a+1), so q≤n≤q+m<2q and m divides n. Positivity of m justifies the remainder bound.

The API is the stated relation interface. Contract tests:

- rounding_keep_next: q=5,m=6 gives n=6.
- rounding_zero_remainder: q=6,m=3 gives n=9, not 6; it still satisfies the strict upper bound.

Source: Henk, p.4, two-case construction after (2.4). Exact source arithmetic step.

### Backward rounding along a divisibility chain

Node GN.4/divisible-rounding-chain; proposed declaration TauCeti.GeometryOfNumbersPlan.exists_divisible_rounding.

For any positive antitone q:Fin d→N there exists n with q_i≤n_i, n_i=q_i at the final index, n_i<2q_i at earlier indices, and n_j dividing n_i whenever i≤j.

The empty family is allowed. Antitone means q_j≤q_i for i≤j. Positivity of n follows from q_i≤n_i.

Proof outline:

1. Use the empty family at d=0. Otherwise set the final factor equal to the final positive q.
2. Recurse backward: the next factor is below twice its q, including the unchanged final factor. Antitonicity places it below twice the current q.
3. Apply divisible-rounding-step to choose the current factor divisible by the next. Transitivity gives the all-pairs divisibility direction.
4. Keep the final factor unchanged, so there are d−1 rounded positions rather than d.

The API is the stated relation interface. Contract tests:

- rounding_chain_example: q=(7,5,3) gives n=(12,6,3), with 3|6|12 and both earlier factors strictly below twice q.
- rounding_empty_product: The empty factor product is one.

Source: Henk, p.4, (2.4) and backward induction. Source's compatible factor choices with the final factor and empty case explicit.

### Strict product loss from backward rounding

Node GN.4/divisible-rounding-product; proposed declaration TauCeti.GeometryOfNumbersPlan.divisible_rounding_product.

For d≥2, positive q, n_i≥q_i, final n_i=q_i and earlier n_i<2q_i imply ∏n_i<2^(d−1)∏q_i.

Products are natural. This consequence needs no divisibility assumption.

Proof outline:

1. Separate the final positive factor. The earlier d−1 factors form a nonempty family.
2. Use the native strict product inequality to compare their positive n_i with 2q_i. Multiply by the positive final q and collect the d−1 factors of two.
3. For d=1 the products are equal; strictness must not be exported in that dimension.

The API is the stated relation interface. Contract tests:

- rounding_strict_product: 12·6·3=216<2²·7·5·3=420.
- rounding_rank_one_not_strict: For d=1,q=n=3 the strict assertion would be 3<3 and is false.

Source: Henk, pp.4–5, (2.4)–(2.5). Tracks the precise exponent and strict sign.

### Coordinate membership in a diagonal sublattice

Node GN.4/diagonal-span-coordinates; proposed declaration TauCeti.GeometryOfNumbersPlan.mem_diagonal_span_iff.

For an integral basis b:Fin d→G of an additive commutative group, x∈span_Z{n_i b_i} if and only if each n_i divides the integral coordinate b.repr(x)_i.

The n_i are arbitrary naturals, including zero; use the native Submodule.span and integral module structure.

Proof outline:

1. Induct on membership in the span for the forward implication: generator coordinates satisfy divisibility, preserved by zero, addition and integral scaling.
2. For the reverse implication choose quotients z_i with coordinate_i(x)=n_i z_i. Expand x by the native finite basis-coordinate sum and rewrite each term as z_i(n_i b_i).
3. If n_i=0, divisibility requires coordinate_i(x)=0; do not cancel a zero factor.

The API is the stated relation interface. Contract tests:

- diagonal_membership_different_factors: Coordinates (4,6) satisfy divisibility by (2,3), while 3 is not divisible by 2.
- diagonal_zero_coordinate: Zero divides an integer z exactly when z=0.

Source: Henk, pp.4–5, lattice generated by n_i e_i. Coordinate interface for the source's native diagonal span, not a replacement carrier.

### Index of a diagonal sublattice

Node GN.4/diagonal-span-index; proposed declaration TauCeti.GeometryOfNumbersPlan.diagonal_span_index.

The native additive index of span_Z{n_i b_i} in the finite free integral module with basis b is ∏n_i.

The n_i are arbitrary naturals. A zero factor gives infinite index and the native index sentinel zero; all-positive factors give nonzero finite index. The empty product is one.

Proof outline:

1. Under the native basis coordinate equivalence, the membership theorem identifies this span with the product of the coordinate subgroups n_i Z.
2. Apply the generated additive index-map and product-index theorems, then Int.index_zmultiples at each coordinate.
3. Each natural factor cast to an integer has natural absolute value n_i. The existing formulas also cover zero factors and rank zero. Positivity is checked separately before applying a finite-index count.

The API is the stated relation interface. Contract tests:

- diagonal_index_two_three: 2Z×3Z has index six.
- diagonal_index_zero_factor: 2Z×{0} has native natural index zero, not a positive finite cardinality.

Source: Henk, p.4, determinant ratio of the diagonal sublattice. Specialization of existing index formulas through the diagonal-span coordinate interface.

### Diagonal sublattice avoids the doubled body

Node GN.4/diagonal-lattice-avoidance; proposed declaration TauCeti.GeometryOfNumbersPlan.diagonal_lattice_avoidance.

Given an integral basis with the strict minimum-flag property, positive n_i with n_j|n_i for i≤j and 2/n_i<λ_i, every point of span_Z{n_i b_i}∩2K is zero.

The exact flag hypothesis is the conclusion of integral-minimum-flag. Symmetry is unnecessary here.

Proof outline:

1. The ambient diagonal span lies in L. For a nonzero point x choose the largest nonzero integral b-coordinate k; all higher coordinates vanish.
2. Write coordinate_i(x)=n_i z_i. For i≤k, n_k divides n_i, while the higher coordinates are zero. The native basis sum therefore constructs an integral y with x=n_k y. Its k-coordinate is still nonzero.
3. From x∈2K and n_k>0 get y∈(2/n_k)K, whence gauge_K(y)≤2/n_k<λ_k by the existing membership/gauge bound.
4. The flag hypothesis puts y before index k; native flag membership and the integral-to-real coordinate compatibility force its k-coordinate to be zero, contradiction.
5. In dimension zero there is no nonzero coordinate. Body membership remains closed: strictness enters only in the comparison with λ_k.

The API is the stated relation interface. Contract tests:

- diagonal_division_needs_chain: No integer equals 2/3; division by the last factor is not integral without the divisibility condition.
- diagonal_threshold_needs_strict: For Z and K=[−1,1], n=2 leaves the point 2 in nZ∩2K at the equality 2/n=λ_0=1.

Source: Henk, p.5, largest nonzero coordinate argument after (2.5). Supplies the source's avoidance argument in the original lattice basis, without a separate normalization carrier.

### Henk's successive-minima lattice-point bound

Node GN.4/henk-successive-minima-count; proposed declaration TauCeti.GeometryOfNumbersPlan.lattice_count_lt_successive_minima.

For d≥2 and centrally symmetric K, |L∩K|<2^(d−1)∏_{i<d}(floor(2/λ_i)+1). The count includes the origin and all boundary points.

Floor means the greatest integer at most the input, following the already recorded E9 correction. This is Theorem 1.5, not Conjecture 1.4.

Proof outline:

1. Choose an integral minimum-flag basis. Positivity and monotonicity of λ make q_i=floor(2/λ_i)+1 positive and antitone.
2. Backward rounding produces n_i. Since 2/λ_i<q_i≤n_i, positivity gives 2/n_i<λ_i.
3. Take the native ambient span M of n_i b_i. Its pullback to L has index ∏n_i by diagonal-span-index. The native relative-index definition identifies this with [L:M], nonzero because all factors are positive.
4. Diagonal-lattice-avoidance and membership of zero give M∩2K={0}. The existing Henk sublattice lemma yields |L∩K|≤∏n_i.
5. Apply the strict product bound. Keep the earlier non-strict first-minimum result for d=1. Neither the factor-one conjecture nor sharp upper Minkowski volume inequality is asserted.

The API is the stated relation interface. Contract tests:

- henk_cube_strict: For the standard unit square the nine points satisfy 9<2·3·3=18.
- henk_anisotropic_strict: A rectangle with minima (1,3) has three points and gives 3<2·3·1=6; its product factor 3 is below the first-minimum square factor 9.

Source: Henk, pp.3–5, Theorem 1.5 and (2.1)–(2.5). Assembles the proved source bound from the decomposed flag, rounding, native index and avoidance interfaces.

### What the factor does and does not imply

For the standard unit square, q=(3,3) and the compatible choice n=(3,3) give the stronger intermediate count at most nine; Henk's exported inequality is the valid strict 9<18. The strict product comparison has only d−1 rounded factors, since the final one is unchanged. A one-dimensional equality cannot be turned into a strict theorem.

The diagonal index uses the existing product-index and integer-multiple-index formulas. A zero factor produces the library's infinite-index sentinel zero; it does not license a finite-index counting argument. The chosen Henk factors are all positive, so that pitfall is excluded before invoking the sublattice lemma.

Completing an integral basis changes its vector lengths. The preserved property is the entire rational flag, not attainment of λ_i by each integral basis vector. This distinction is required for both this count and the still-open sharp upper Minkowski proof.

## GN.1: convex sections and partial-dilation volume

The following seven declarations isolate the analytic part of [Henk §3](https://arxiv.org/pdf/math/0204158v1), especially (3.2), (3.5) and (3.6). They do not prove the sharp upper Minkowski product bound on their own.

Use finite-dimensional real normed spaces E and F with Borel structures and additive Haar measures μ and ν. For a finite family v:I→E, write U_v(K)=⋃_i{(v_i+x,y):(x,y)∈K}, f₁,r(x,y)=(rx,y), and f₂,r(x,y)=(x,ry). These are not new definitions or carriers in the library plan: the suggested statements expand ordinary finite unions, images and native linear maps. The product measure is μ×ν. The dilation factor is r≥1 when asserting monotonicity.

The spaces may have dimension zero; the family or body may be empty; translations may repeat. Compactness is needed at the integration step, not for pointwise containment. There is no symmetry or origin condition on K.

The dependency chain is section identity → pointwise enlargement → section-volume comparison → native Tonelli comparison. Separately, the complementary-map identity and native determinant/Haar APIs give the factor r^(dim F). Disjoint-interior volume additivity will also be used by the later lattice-box assembly.

### Volume of interior-disjoint convex translates

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/finite-interior-disjoint-volume` — lemma; unchecked.

Let K⊆E be compact and convex, and v:I→E a finite family. If v_i+int(K) and v_j+int(K) are disjoint whenever i≠j, then μ(⋃_i(v_i+K))=|I|·μ(K). Equality is in the nonnegative extended reals.

Hypotheses: E is finite-dimensional real normed with Borel structure; μ is an additive Haar measure. No symmetry, origin condition or positive-dimensional interior of K is required. The index type may be empty. Repeated translation vectors are not silently deduplicated; the stated interior-disjointness hypothesis controls when the cardinal factor is valid.

Proof plan:

1. Every translated set is compact, hence closed and measurable, and convex. Native convex-frontier measure zero applies even when the body is lower-dimensional.
2. If a point lies in two translates but not both translated interiors, it lies in the frontier of at least one translate, because both sets are closed. The disjoint-interior hypothesis therefore puts their intersection inside two null frontiers.
3. Thus the finite family is pairwise a.e. disjoint. Apply native measure_iUnion₀, convert the finite-index infinite sum to a finite sum, and use translation invariance to make every summand μ(K).
4. An empty family gives zero. If K has empty interior, its whole measure is zero by the frontier theorem, so repeated labels cause no contradiction.

Prerequisites: `mathlib:Convex.addHaar_frontier`, `mathlib:Convex.translate`, `mathlib:Homeomorph.image_interior`, `mathlib:IsCompact.image`, `mathlib:IsCompact.isClosed`, `mathlib:IsClosed.measurableSet`, `mathlib:MeasureTheory.measure_iUnion₀`, `mathlib:MeasureTheory.measure_preimage_mul_right`

API: `TauCeti.GeometryOfNumbersPlan.finite_interior_disjoint_translate_volume` — Let K⊆E be compact and convex, and v:I→E a finite family. If v_i+int(K) and v_j+int(K) are disjoint whenever i≠j, then μ(⋃_i(v_i+K))=|I|·μ(K). Equality is in the nonnegative extended reals.

Acceptance checks:

- The closed intervals [0,1] and [1,2] have union of real volume 2 despite sharing an endpoint.
- Two copies of [0,1] have union volume 1, not 2; their interiors are not disjoint.

Source use: Henk2002, p.5 (3.2), and p.6 the two volume factorizations after (3.4). Supplies the measure-theoretic additivity required for lattice translates whose closed boundaries can touch.

### Sections of a finite translated union

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/finite-translate-section` — lemma; unchecked.

For every K⊆E×F, y∈F and finite v:I→E, {x:(x,y)∈U_v(K)}=⋃_i(v_i+{x:(x,y)∈K}).

Hypotheses: E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their native product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and native linear maps, not new constructors or carrier types.

Proof plan:

1. Expand membership in the finite union and in an image: (x,y)=(v_i+a,b) forces b=y and x=v_i+a.
2. Use the same witness i and a in the reverse direction. No convexity, compactness or measure hypothesis is used.

Prerequisites: Direct native image/union membership reasoning; no new supplier.

API: `TauCeti.GeometryOfNumbersPlan.finite_translate_section` — For every K⊆E×F, y∈F and finite v:I→E, {x:(x,y)∈U_v(K)}=⋃_i(v_i+{x:(x,y)∈K}).

Acceptance checks:

- The union of translates of [0,1] indexed by Fin 0 is the empty real set.

Source use: Henk2002, p.6, the section inclusion between (3.6) and the successive integrations. Keeps section formation and the finite translation family compatible; no measure of a chosen center is involved.

### Translation containment of an enlarged convex section

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/convex-section-enlargement` — lemma; unchecked.

If K⊆E×F is convex and r≥1, then for every y∈F there exists t∈E such that {x:(x,y)∈U_v(K)}⊆t+{x:(x,y)∈U_v(f₁,r(K))}.

Hypotheses: E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their native product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and native linear maps, not new constructors or carrier types.

Proof plan:

1. Fix y. Its section C={x:(x,y)∈K} is convex directly from convexity of K. The E-section of f₁,r(K) is rC by expanding the image coordinates.
2. If C is empty, the source union section is empty by finite-translate-section, so t=0 works.
3. Otherwise choose any a∈C for this fixed y and set t=(1−r)a. Since r>0 and 0≤1/r≤1, native Convex.add_smul_sub_mem puts b=a+r⁻¹(x−a) in C for every x∈C.
4. The vector identity x=rb+(1−r)a gives C⊆rC+t. Adding each unchanged v_i and taking their union yields the claimed containment.
5. This is a pointwise existential statement in y. It neither constructs nor assumes a measurable choice y↦a or y↦t.

Prerequisites: `GeometryOfNumbersAndQuadraticArithmetic:GN.1/finite-translate-section`, `mathlib:Convex.add_smul_sub_mem`

API: `TauCeti.GeometryOfNumbersPlan.convex_section_enlargement` — If K⊆E×F is convex and r≥1, then for every y∈F there exists t∈E such that {x:(x,y)∈U_v(K)}⊆t+{x:(x,y)∈U_v(f₁,r(K))}.

Acceptance checks:

- [2,3]⊆[4,6]−2, using a=2 and r=2.
- [2,3] is not a subset of its dilation [4,6] about zero; the translation cannot be omitted.
- There is no real t with {0,1,3}⊆{0,2,6}+t; arbitrary nonconvex sections do not satisfy the containment.

Source use: Henk2002, p.6, pointwise t(x) inclusion immediately after (3.6). Makes the source's elementary fiber enlargement explicit, including empty sections and the required translating vector.

### Section-volume monotonicity under partial dilation

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/section-union-volume-monotone` — lemma; unchecked.

For convex K⊆E×F, r≥1 and every y∈F, μ{x:(x,y)∈U_v(K)}≤μ{x:(x,y)∈U_v(f₁,r(K))}.

Hypotheses: E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their native product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and native linear maps, not new constructors or carrier types.

Proof plan:

1. Apply convex-section-enlargement at this fixed y to obtain one t.
2. Monotonicity of the native outer measure bounds the first section measure by that of the translated enlarged section.
3. Translation invariance removes t. This pointwise inequality does not need K compact or section measurability; those enter only for the product-measure integral.

Prerequisites: `GeometryOfNumbersAndQuadraticArithmetic:GN.1/convex-section-enlargement`, `mathlib:MeasureTheory.measure_preimage_mul_right`

API: `TauCeti.GeometryOfNumbersPlan.section_union_volume_mono` — For convex K⊆E×F, r≥1 and every y∈F, μ{x:(x,y)∈U_v(K)}≤μ{x:(x,y)∈U_v(f₁,r(K))}.

Acceptance checks:

- At r=1, f₁,r(K)=K for every subset of ℝ×ℝ, so every section inequality is equality.

Source use: Henk2002, p.6, the inequality between section-volume integrals. Separates translation invariance from the subsequent Tonelli argument.

### Volume monotonicity of partially dilated unions

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/partial-dilation-union-volume` — lemma; unchecked.

For compact convex K⊆E×F, finite v:I→E and r≥1, (μ×ν)(U_v(K))≤(μ×ν)(U_v(f₁,r(K))).

Hypotheses: E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their native product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and native linear maps, not new constructors or carrier types.

Proof plan:

1. Each partial dilation and each translation is continuous. Its image of K is compact, and native finite-union compactness makes both U_v(K) and U_v(f₁,r(K)) compact.
2. Both are Borel measurable. Native measurable_measure_prodMk_right supplies measurable section-volume functions; finite-dimensional Haar measures are s-finite.
3. Apply native prod_apply_symm to both unions. Compare their lower integrals by lintegral_mono and section-union-volume-monotone.
4. No center-selection function is integrated. Empty families, empty bodies, empty individual sections and zero-dimensional factors are handled by these same native formulas.

Prerequisites: `GeometryOfNumbersAndQuadraticArithmetic:GN.1/section-union-volume-monotone`, `mathlib:IsCompact.image`, `mathlib:isCompact_iUnion`, `mathlib:IsCompact.isClosed`, `mathlib:IsClosed.measurableSet`, `mathlib:measurable_measure_prodMk_right`, `mathlib:MeasureTheory.Measure.prod_apply_symm`, `mathlib:MeasureTheory.lintegral_mono`

API: `TauCeti.GeometryOfNumbersPlan.partial_dilation_union_volume` — For compact convex K⊆E×F, finite v:I→E and r≥1, (μ×ν)(U_v(K))≤(μ×ν)(U_v(f₁,r(K))).

Acceptance checks:

- At r=1 both measurable unions are the same, so the product-volume comparison is equality.
- For an empty index type both sides are zero, including when either factor has dimension zero.
- The integration uses only the two native measurable section-volume functions; no measurable choice of the pointwise center is permitted as an unstated premise.

Source use: Henk2002, p.6 (3.6) and the three-line successive-integration argument ending on p.7. Proves the exact finite-union volume comparison that underlies the source's consecutive-minimum ratio estimate.

### Complementary coordinate dilation of a union

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/complementary-dilation-union` — lemma; unchecked.

For any real r, any K⊆E×F and finite v:I→E, U_v(rK)=f₂,r(U_v(f₁,r(K))).

Hypotheses: E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their native product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and native linear maps, not new constructors or carrier types.

Proof plan:

1. The left side consists of (v_i+rx,ry) with (x,y)∈K. The right side consists of f₂,r(v_i+rx,y), which is the same ordered pair.
2. Use identical witnesses in both directions. This is a direct image/finite-union identity, including r=0; no invertibility or measurable-set argument is involved.

Prerequisites: Direct native image/union membership reasoning; no new supplier.

API: `TauCeti.GeometryOfNumbersPlan.complementary_dilation_union` — For any real r, any K⊆E×F and finite v:I→E, U_v(rK)=f₂,r(U_v(f₁,r(K))).

Acceptance checks:

- On ℝ×ℝ, f₁,2(3,5)=(6,5).
- On ℝ×ℝ, f₂,2(3,5)=(3,10); it must leave the translation coordinate unchanged.

Source use: Henk2002, p.6, identity M_q^i+K_{i+1}=f₂(M_q^i+f₁(K_i)). Exposes the precise order of the two native partial linear maps.

### Codimension growth for translated convex unions

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/transverse-union-volume` — theorem; unchecked.

For compact convex K⊆E×F, finite v:I→E and r≥1, r^(dim F)·(μ×ν)(U_v(K))≤(μ×ν)(U_v(rK)), interpreting the scalar factor by the native nonnegative extended-real inclusion.

Hypotheses: E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their native product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and native linear maps, not new constructors or carrier types.

Proof plan:

1. Regard f₂,r as the native product endomorphism id_E×(r·id_F). Native det_prodMap and det_smul give determinant r^(dim F).
2. The product measure is an additive Haar measure by the existing instance. Native addHaar_image_linearMap and r≥1 give the exact image-measure factor r^(dim F) on any set.
3. Apply complementary-dilation-union to identify the full dilation union with that image. Apply partial-dilation-union-volume to its preimage set and multiply the inequality by the nonnegative determinant factor.
4. No determinant is computed for a new abstract map carrier. If dim F=0 the factor is one; if r=1 both unions agree. This is not yet the global Minkowski product inequality.

Prerequisites: `GeometryOfNumbersAndQuadraticArithmetic:GN.1/partial-dilation-union-volume`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/complementary-dilation-union`, `mathlib:MeasureTheory.Measure.addHaar_image_linearMap`, `mathlib:LinearMap.det_prodMap`, `mathlib:LinearMap.det_smul`, `mathlib:MeasureTheory.Measure.prod.instIsHaarMeasure`

API: `TauCeti.GeometryOfNumbersPlan.transverse_union_volume` — For compact convex K⊆E×F, finite v:I→E and r≥1, r^(dim F)·(μ×ν)(U_v(K))≤(μ×ν)(U_v(rK)), interpreting the scalar factor by the native nonnegative extended-real inclusion.

Acceptance checks:

- For F=EuclideanSpace ℝ (Fin 0), the factor 2^(dim F) is 1, not 2 or zero.

Source use: Henk2002, p.6 (3.5), using the partial maps and (3.6). Supplies the analytic codimension factor; applying it to lattice boxes and successive minima remains a separate proof step.

### Why measurable center selection is unnecessary

For a fixed y let C be the convex section. If C is empty, there is nothing to contain. Otherwise fix any a∈C and use t=(1−r)a. For x∈C, the point b=a+r⁻¹(x−a) lies in C and x=rb+t. Thus C⊆rC+t. The same t works for every translate in this one section, since the v_i are not dilated in f₁.

Translation invariance removes t before integration. Both section-volume functions come directly from the original compact finite unions and are measurable by the native product-measure theorem. No map choosing a as a function of y needs to be measurable.

The complementary dilation is id_E×r·id_F, so its determinant is r^(dim F), not r^(dim E+dim F). Its exact image-measure identity combines with the monotonicity step to give the stated codimension growth. This does not replace the required lattice coordinate transport, grouping by transverse classes or the large-box limit.

### Upstream compatibility

At inspection, [Mathlib PR #35812](https://github.com/leanprover-community/mathlib4/pull/35812) was open at head `8423d1c878e50d8504a230ffd9b6ec76ce6a08eb`. Its proposed native successive-minimum invariant has values in the nonnegative reals and uses a natural-number index. Relevant definition, attainment, directional-basis and endpoint passages were inspected; this is not a complete audit of its proof file. The related [Lean Zulip thread](https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Minkowski.20Lattice.20Theorem.html) records the planned scope.

Before implementation, reconcile the inherited private-plan real-valued gauge and finite-index interface with that upstream design. A directional real basis is not automatically an integral lattice basis, and the PR’s second-theorem placeholder does not supply the sharp upper product inequality. The current seven auxiliaries do not redefine minima and use only existing native sets, maps and measures.

## Consumer contracts and ownership

GN.1 supplies minimum values, their attained independent witnesses, intrinsic volume conventions and the lower product inequality. It still owes the upper product inequality needed by the Couveignes compact-model consumer. The ordered-product root estimate cannot supply that missing product bound. GN.5 uses the same native lattices and minimum invariant for comparison with certified lattice reduction; a selected minimum family supplies no algorithmic runtime or verified LLL output.

ArithmeticStatistics ST.0 and DiophantineApproximationAndTranscendence DT.0 import the relevant convex-body results. The first minimum adapter makes the native first theorem usable in this vocabulary. The boundary linear-forms theorem directly supplies the existing DT.0/DT.2 request, retaining every non-strict inequality and requiring positive dimension. Its region-volume helper imports the native Haar determinant formula and closed-box volume. Blichfeldt and Minkowski first remain baseline imports. Number-field ideals, units and class groups remain with their built owners. The weighted canonical embedding and its powers of two remain the EffectiveBoundsCompactModels consumer’s responsibility.

RS-03 retains generic verified LLL in GN.5 and its arithmetic exclusion applications in ED.1/ED.2. RS-07 retains the full Davenport multiset/projection-volume contract in GN.4. IntegralLattices, QuadraticFormInvariants, GlobalQuadraticForms, AdelicAlgebraicGroups and MetaplecticAutomorphicForms retain their recorded foundations. No retired Foundations stage is used as a dependency.

## Source boundaries and corrections

The Evertse author-hosted chapter is the PDF linked by the Fall 2023 course page. Its selected preliminaries and complete successive-minima/lower-bound proof were read; its full 28 pages and the Hermite-basis proof are not claimed read. The complete seven-page [Henk preprint](https://arxiv.org/abs/math/0204158) was read. Its publisher version was not obtained. Both file hashes, access date and exact page ranges are in the packet. The preprint’s Theorem 1.5 is a proved lattice-point estimate; its Conjecture 1.4 remains a conjecture in the source and is not supplied as a theorem.

Inherited source findings E1–E7 and their version provenance are retained. E1 is the independently confirmed Couveignes tensor-base correction. E2–E7 concern the Horesh–Karasik projected quotient, determinant signs, version-specific inverse-Gram/projection arguments, Haar-measure justification and complementary orientation. Their full records remain in the packet; this continuation adds no review verdict.

Two inherited wording findings await independent review; no new finding is added in this continuation. E8 corrects the coefficient index in Evertse’s Lemma 2.10: r coefficients for r vectors, rather than n ambient coordinates. Its lower-bound application has r=n and is unaffected. E9 records that Henk’s preprint uses floor brackets while describing a ceiling; the floor convention is retained. Both page images were checked. Searches of the linked course/author pages, arXiv version history and targeted correction queries found no separate correction in the checked sources. The apparent missing invertibility in Evertse’s transformation remark is not an error: printed p.15 explicitly defines that phrase to mean an invertible linear map.

The identical seven-page Henk preprint was freshly reread for this continuation, with rendered pp.4–5 checked again. Theorem 1.5 is now decomposed. The publisher version was not obtained, and no new correction search or source-wide correctness claim is made.

## Planets and coverage

Twelve planets are selected: three in GN.0, six in GN.1 and three in GN.4. The GN.4 landmarks are Henk sublattice counting lemma, First-minimum lattice-point bound and Henk's successive-minima lattice-point bound. The added landmarks are Successive minima, Independent minimum vectors, Minkowski lower product bound, and Minkowski linear forms theorem. The upper theorem has no completed node in this packet.

- **GN.0 — partial.** Original lattice/covolume/fundamental-domain/change-of-basis target is already built (reviewed audit). Gram/Hadamard and primitive-orthogonal consequences from the four-item Couveignes routing are now source-decomposed. This remains a bounded source slice, not a declaration that the whole roadmap's source coverage is closed. Consumer-owned weighted number-field metric normalization remains in EffectiveBoundsCompactModels, not a new GN.0 carrier. A prescribed primitive-intersection basis and a complete rational flag can now be extended compatibly to an integral basis; this is an additional Henk proof-local interface, not a replacement of the built lattice foundations.
- **GN.1 — partial.** The sharp upper bound (product of minima)·volume(K)≤2^d·covolume(L) remains open. Henk §3 has now been decomposed through the compatible integral minimum flag, finite interior-disjoint translate volume, pointwise convex-section enlargement, measurable finite-union Tonelli comparison, and the exact partial-dilation codimension factor. Remaining required declarations: coordinate transport for the integral flag with its Haar normalization, finite lattice-box/coset decomposition and transverse-class disjointness, the consecutive-minimum ratio inequality, initial translate-volume identity and outer box bound, telescoping and the large-box limit. Equal consecutive minima and dimension zero need explicit branches. The analytic section argument needs no measurable choice of center. Full source coverage of the original GN.1 reading list and source-scoped applications remains to be reconciled with the reviewed built number-field owners. The attained-minima API and the complete sharp lower-bound proof are decomposed. Evertse’s Hermite-basis proof (Theorem 2.11), John’s ellipsoid theorem and their consequences have only had their statements read, and are not supplied by the lower inequality. Before implementing the inherited private-plan minimum API, reconcile its real-valued gauge/Fin convention with the NNReal-valued, Nat-indexed native successiveMin proposed in Mathlib PR #35812; the current pin remains the authoritative built baseline.
- **GN.2 — partial.** Import field invariants/Witt theory from QuadraticFormInvariants and Hasse–Minkowski/isotropy/representation from GlobalQuadraticForms; rational integral lattice duality/discriminant/gluing is completed IntegralLattices. New work: O_K/Z_p integral lattices, localization, genera/spinor genera, dyadic and quaternionic/hermitian variants, with source-specific restrictions.
- **GN.3 — partial.** AdelicAlgebraicGroups owns quotient/measure and reduction-domain foundations; MetaplecticAutomorphicForms owns theta. GN still needs local representation densities, finite stabilizers, genus classes, weighted mass, local normalization and convergence proofs.
- **GN.4 — partial.** Existing null-frontier asymptotic lattice counting is an import. GN.4 retains Davenport's bounded semialgebraic MULTISET/projection-volume estimate with uniform dimension/multiplicity/complexity dependence (accepted RS-07), plus independent mixing/nondivergence/Oppenheim/Duke branches, packing/covering, transference, star bodies, Mahler compactness and Siegel mean value. Coding Construction A is AlgebraicCodingTheory layer 6; fixed-domain Lipschitz estimates are GlobalNumberFields. Henk Lemma 2.1, inequality (1.3) and Theorem 1.5 are now decomposed through native integral flags, compatible rounding and diagonal-span avoidance. Theorem 1.5 retains d≥2 and the strict factor 2^(d−1). The dimension-one result is the separate non-strict first-minimum estimate. Conjecture 1.4 is not supplied as a theorem. These counting results do not supply the sharp upper Minkowski volume inequality or any quantitative lattice-counting error term.
- **GN.5 — partial.** GN.5 owns generic verified LLL (accepted RS-03): exact Gram–Schmidt/rational comparisons, unimodular update certificates, termination, Lovasz and size reduction, approximation guarantees and original-lattice verification. ED.1/ED.2 own their arithmetic reduction/exclusion applications. No unrestricted exact SVP/CVP follows from LLL.
- **GN.6 — partial.** GN.6 requires an exact category with duality, coherent double dual, forms/isometries, exact-category GW/W, hyperbolic/forgetful maps and higher hermitian K. Degree-zero field Witt/GW belongs to QuadraticFormInvariants. Source-scoped localization/periodicity needs precise invertibility-of-two/regularity assumptions; K.6 only the nonconnective subbranch.

## Exact remaining inputs

1. **Number-field metric comparison and integer-vector norm floor.** Consumer-owned normalization warning (not a request to duplicate it here): the Couveignes extraction routes the weighted/unweighted metric, discriminant normalization and integer-family applications to proposed EffectiveBoundsCompactModels. Couveignes uses twice the complex squared modulus; audited Mathlib mixed-embedding basis (1,i) is unweighted. The consumer must derive the 2^r2 measure factor, not identify unequal covolumes. Nonzero relation-lattice integer vectors have norm≥1; the initial number-field minima instead need the arithmetic norm/product argument. A general lattice does not have the ≥1 floor.

2. **Sharp upper Minkowski inequality and full GN.1 source coverage.** The sharp upper bound (product of minima)·volume(K)≤2^d·covolume(L) remains open. Henk §3 has now been decomposed through the compatible integral minimum flag, finite interior-disjoint translate volume, pointwise convex-section enlargement, measurable finite-union Tonelli comparison, and the exact partial-dilation codimension factor. Remaining required declarations: coordinate transport for the integral flag with its Haar normalization, finite lattice-box/coset decomposition and transverse-class disjointness, the consecutive-minimum ratio inequality, initial translate-volume identity and outer box bound, telescoping and the large-box limit. Equal consecutive minima and dimension zero need explicit branches. The analytic section argument needs no measurable choice of center. This is also the genuine product-with-witnesses input still needed by EffectiveBoundsCompactModels; attainment alone does not discharge it.

3. **GN.2 primary-source and proof decomposition.** Import field invariants/Witt theory from QuadraticFormInvariants and Hasse–Minkowski/isotropy/representation from GlobalQuadraticForms; rational integral lattice duality/discriminant/gluing is completed IntegralLattices. New work: O_K/Z_p integral lattices, localization, genera/spinor genera, dyadic and quaternionic/hermitian variants, with source-specific restrictions.

4. **GN.3 primary-source and proof decomposition.** AdelicAlgebraicGroups owns quotient/measure and reduction-domain foundations; MetaplecticAutomorphicForms owns theta. GN still needs local representation densities, finite stabilizers, genus classes, weighted mass, local normalization and convergence proofs.

5. **GN.4 primary-source and proof decomposition.** Existing null-frontier asymptotic lattice counting is an import. GN.4 retains Davenport's bounded semialgebraic MULTISET/projection-volume estimate with uniform dimension/multiplicity/complexity dependence (accepted RS-07), plus independent mixing/nondivergence/Oppenheim/Duke branches, packing/covering, transference, star bodies, Mahler compactness and Siegel mean value. Coding Construction A is AlgebraicCodingTheory layer 6; fixed-domain Lipschitz estimates are GlobalNumberFields. Henk Lemma 2.1, inequality (1.3) and Theorem 1.5 are now decomposed through native integral flags, compatible rounding and diagonal-span avoidance. Theorem 1.5 retains d≥2 and the strict factor 2^(d−1). The dimension-one result is the separate non-strict first-minimum estimate. Conjecture 1.4 is not supplied as a theorem. These counting results do not supply the sharp upper Minkowski volume inequality or any quantitative lattice-counting error term.

6. **GN.5 primary-source and proof decomposition.** GN.5 owns generic verified LLL (accepted RS-03): exact Gram–Schmidt/rational comparisons, unimodular update certificates, termination, Lovasz and size reduction, approximation guarantees and original-lattice verification. ED.1/ED.2 own their arithmetic reduction/exclusion applications. No unrestricted exact SVP/CVP follows from LLL.

7. **GN.6 primary-source and proof decomposition.** GN.6 requires an exact category with duality, coherent double dual, forms/isometries, exact-category GW/W, hyperbolic/forgetful maps and higher hermitian K. Degree-zero field Witt/GW belongs to QuadraticFormInvariants. Source-scoped localization/periodicity needs precise invertibility-of-two/regularity assumptions; K.6 only the nonconnective subbranch.

8. **Proof execution.** All 63 nodes remain unchecked planning declarations. The suggested file checks signatures and proposed tests only. This continuation proves six general scratch lemmas (convex enlargement, exact section identity, complementary dilation, its determinant, its Haar image measure, and native Tonelli comparison) and six concrete statements without placeholders or diagnostics. Exact polygon-union tests are regressions, not universal geometric proofs. Earlier scratch evidence is historical, not claimed rerun. No submitted implementation.

## Historical validation of the minimum checkpoint

The packet contains 41 nodes: one definition, 29 lemmas and eleven theorems. Its definition has 13 API items and seven discriminating unit tests; counting theorem interfaces as well gives 53 API entries and 64 packet contract tests. The suggested file contains 74 typed examples. All nineteen inherited node objects are preserved exactly.

The suggested file elaborates at the pinned baseline with 115 unproved-statement warnings and no errors or other warnings. The import closure contains 8,482 byte-verified Mathlib modules and no Tau Ceti imports. Explicit signature inspection checks that the full-lattice, discreteness, positive-interior and weight-order hypotheses are retained in the elaborated declarations. All Lean content is confined to the authorized suggested file. Elaboration is a type check, not proof completion.

Exact rational regressions check 80 body/lattice families, 382 rank thresholds, 208 greedy witness selections, 964 strict-flag conditions, 7,552 dilation/sign identities, 80 volume-product identities or inequalities, 64 independently computed planar polygon areas, and seven boundary/counterexample assertions. Additional inverse-image polygon-area checks and integer boundary witnesses test the linear-forms specialization; their counts are in the handoff. These finite checks are not proofs of the general declarations. Packet, source-version, preservation, dependency-graph and four-file intake checks are recorded in the handoff.

## Historical validation of the first-count continuation

All 41 inherited node objects, nine source findings and source-version records are preserved exactly. The five additions give 46 nodes: one definition, 32 lemmas and 13 theorems; 58 API entries, 76 packet contract tests, 86 typed examples, 11 planets and 103 baseline declarations. The existing definition still has 13 API items and seven tests. Eight gaps, no outgoing requests and seven partial stages remain.

The suggested file elaborates with 133 unproved-statement warnings and no errors or other warnings. Its inherited scalar definition now also has only an unproved signature, as required by protocol §13; the unchanged defining API lemma states its mathematical formula. This is not a change to the minimum invariant. The import closure contains 8,482 byte-verified Mathlib sources and no Tau Ceti imports. Four additive declarations are generated by the pinned source’s additive-translation annotation; the packet records their source generators and their compiled additive names, since the static index lists only the generators.

Separate scratch proofs establish the coset-difference injection, the residue-coordinate separation bound, its direct reduction to the native qG index theorem, and the floor-threshold inequality; six arithmetic examples are also proved there without placeholders. These checks do not implement the geometric packet nodes. Exact regressions cover 7,306 finite-group subsets, 19,948 coset fibers, 774 box/lattice families with strict thresholds, 338,586 doubled-box candidate points, 17,280 skew sublattices, 66,448 skew coset fibers and ten boundary assertions. The inherited minimum/volume regressions above were not rerun and remain explicitly historical evidence.

These are historical checks from the first-count checkpoint, not freshly rerun evidence. The stronger Henk count and the analytic Fubini/finite-union auxiliaries are now decomposed above. The full sharp upper Minkowski assembly remains open.

## Historical validation of the product-count checkpoint

That checkpoint had 56 nodes: one definition, 41 lemmas and fourteen theorems. There are 68 API entries and 96 packet contract tests across all node kinds, 106 suggested examples, twelve planets, 116 baseline declarations, eight gaps and no requests. The single scalar definition retains its thirteen API items and seven tests; the official checker reports those definition-only totals. All seven stages remain partial and every node unchecked.

The complete suggested file elaborates with 163 required unproved-statement warnings and no other diagnostics. All 8,482 reached Mathlib source files byte-match the pin; no Tau Ceti module is imported. Two general scratch statements, one-step divisibility rounding and diagonal-span coordinate membership, and eight concrete flag/index/arithmetic statements compile without placeholders or diagnostics. This is not a complete Lean proof of the integral-flag induction or the geometric theorem.

Exact tests cover 6,400 rounding steps, 8,008 antitone chains, 7,997 strict product comparisons, 9,261 skew/nonprimitive flag families, 37,044 prefix checks, 9,261 diagonal indices, 37,044 skew-coordinate checks, 494 rational box/minima families, 222,190 doubled-body candidates and six boundary rejections. All arithmetic is integer or rational. These are regressions, not universal geometric proofs.

All 46 inherited node objects, 103 baseline entries, nine findings and version records are preserved exactly. The Henk source gains one reading-scope entry; the other source objects are unchanged. Only the four authorized deliverables are submitted. At that checkpoint the finite-union, measurable-section and partial-scaling steps remained open. They are now decomposed above; lattice-box assembly, telescoping and the large-box limit still remain.

## Current verification and remaining boundary

The current packet has 63 nodes: one definition, 47 lemmas and fifteen theorems; 75 API entries, 106 packet contract tests, 116 suggested examples, twelve unchanged planets, 132 baseline declarations, six sources, nine findings, eight gaps and no requests. The single definition retains thirteen API items and seven tests, which are the definition-only totals reported by the checker. Every node remains unchecked and every stage partial.

The complete suggested file elaborates with exactly 180 required unproved-statement warnings and no other diagnostics. All 8,482 reached Mathlib source files byte-match the pin; no Tau Ceti module is imported. Six general scratch proofs check convex enlargement, section identity, complementary dilation, its determinant, its Haar image measure and native Tonelli comparison. Six concrete scratch statements also compile, with no placeholders or diagnostics. This is not an implementation of all seven proposed nodes.

Exact rational regressions check 2,250 polygon-union comparisons, 16,650 section-volume inequalities, 36,450 convexity witnesses, 4,500 empty sections, 12,618 exact affine integration slabs, 6,750 codimension-two extrusions, 450 unit dilations, 27 touching-interval families and six boundary rejections. Five convex polygon shapes are tested with shifts, empty or repeated translation families and five dilation factors. These are finite regressions, not proofs of the general geometric statements. Earlier regression counts remain historical and were not rerun.

All 56 inherited node objects, 116 baseline declarations, E1–E9 and their sourceVersions remain exact. The same Henk preprint was freshly read in full as text and p.6 visually; only one read-scope entry is added. There is no publisher-version, new correction-search or new erratum claim. Native product-measure measurability, Tonelli and determinant results are imported, not replanned. The four authorized deliverables alone are submitted.

The next sharp-upper step is to transport the integral flag to product coordinates with its Haar normalization, group finite lattice boxes by transverse classes, prove their disjointness and the consecutive-minimum ratio, and then telescope and take the large-box limit. Equal minima and dimension zero need explicit branches. None of the outstanding stronger consumer contracts is silently declared discharged.
