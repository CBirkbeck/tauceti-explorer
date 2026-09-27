# Geometry of numbers: Gram, intrinsic volume and orthogonal covolumes

Issue [#1030](https://github.com/CBirkbeck/tauceti-explorer/issues/1030). Codex — codex-a71f92, 2026-09-27. **Partial blueprint; nothing here is claimed formalized.**

This packet supplies nineteen theorem/lemma plans in GN.0–GN.1. All four additional consequences routed from Couveignes are decomposed: Hermitian Gram–Hadamard, the ordered-product bound, the intrinsic cube/ball estimate, and primitive orthogonal covolume equality. GN.1's genuine second theorem and all later stages remain open. Every node remains unchecked.

The [packet](../packets/GeometryOfNumbersAndQuadraticArithmetic.json) has the dependency graph, source records, API names and tests. The [suggested Lean file](../suggested/GeometryOfNumbersAndQuadraticArithmetic.lean) checks the types of the proposed statements; its unproved declarations are not implementations.

## Reuse and source boundary

The complete seven-stage reviewed AUDIT-02 coverage was read before planning. The original lattice carrier, fundamental domains, covolume/change-of-basis and index formulas are already in Mathlib. Blichfeldt, Minkowski first (strict and compact-boundary versions), and the audited class-group/unit applications are imports. No lattice, Gram, measure or determinant carrier is created here.

Pinned libraries are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every declaration in the packet's baseline inventory was checked at that pin. In particular, `Orientation.abs_volumeForm_apply_le` already proves the real full-dimensional volume-form inequality. The missing exported interface here is its RCLike Hermitian Gram consequence, including arbitrary ambient dimension and dependent families.

I read the entire published [Couveignes article](https://annals.math.princeton.edu/2020/192-2/p04), pp.487–497, and visually checked pp.493–494. The publisher PDF hash is `8d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104`. The extraction, its accepted independent review and verified clean red-team result were also read. Couveignes motivates the four exported consequences; the supporting matrix, product and cube arguments below are worker derivations using the read pinned proofs. This does **not** claim a reading of Martinet's primitive-complement proof or Siegel's second-theorem proof.

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
4. Finite reindexing preserves Gram determinants by simultaneous row/column permutation. Empty blocks have determinant one. Taking a positive square root later must use absolute coordinate determinants, not signed determinants.

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

These are elementary inputs to a future genuine second-theorem application. They do not construct successive minima or independent lattice witnesses.

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

## Planets and completion boundary

Five central results are selected as planets: Gram–Hadamard inequality, Factor-lattice covolume and Primitive orthogonal covolumes (GN.0), Ordered-product bound and Intrinsic ball bound (GN.1). Supporting identities remain ordinary lemma nodes. This is a checkpoint selection, not a claim that the later stages have no landmarks.

- **GN.0 — partial.** Original lattice/covolume/fundamental-domain/change-of-basis target is already built (reviewed audit). The Gram/Hadamard adapters and primitive-orthogonal covolume proof chain are decomposed. This bounded source slice does not assert full source coverage of the roadmap. The Couveignes weighted/unweighted number-field specialization belongs to the proposed EffectiveBoundsCompactModels Part II, not a new GN.0 carrier.
- **GN.1 — partial.** Blichfeldt and both strict and compact-boundary first-theorem versions are built (reviewed audit). Ordered-product and intrinsic-ball consequences are decomposed here. Successive-minima carrier, positivity/attainment/independent witnesses, and both sides of Minkowski's second theorem remain.
- **GN.2 — partial.** Import field invariants/Witt theory from QuadraticFormInvariants and Hasse–Minkowski/isotropy/representation from GlobalQuadraticForms; rational integral lattice duality/discriminant/gluing is completed IntegralLattices. New work: O_K/Z_p integral lattices, localization, genera/spinor genera, dyadic and quaternionic/hermitian variants, with source-specific restrictions.
- **GN.3 — partial.** AdelicAlgebraicGroups owns quotient/measure and reduction-domain foundations; MetaplecticAutomorphicForms owns theta. GN still needs local representation densities, finite stabilizers, genus classes, weighted mass, local normalization and convergence proofs.
- **GN.4 — partial.** Existing null-frontier asymptotic lattice counting is an import. GN.4 retains Davenport's bounded semialgebraic MULTISET/projection-volume estimate with uniform dimension/multiplicity/complexity dependence (accepted RS-07), plus independent mixing/nondivergence/Oppenheim/Duke branches, packing/covering, transference, star bodies, Mahler compactness and Siegel mean value. Coding Construction A is AlgebraicCodingTheory layer 6; fixed-domain Lipschitz estimates are GlobalNumberFields.
- **GN.5 — partial.** GN.5 owns generic verified LLL (accepted RS-03): exact Gram–Schmidt/rational comparisons, unimodular update certificates, termination, Lovasz and size reduction, approximation guarantees and original-lattice verification. ED.1/ED.2 own their arithmetic reduction/exclusion applications. No unrestricted exact SVP/CVP follows from LLL.
- **GN.6 — partial.** GN.6 requires an exact category with duality, coherent double dual, forms/isometries, exact-category GW/W, hyperbolic/forgetful maps and higher hermitian K. Degree-zero field Witt/GW belongs to QuadraticFormInvariants. Source-scoped localization/periodicity needs precise invertibility-of-two/regularity assumptions; K.6 only the nonconnective subbranch.

## Exact gaps and next work

1. **Number-field metric comparison and integer-vector norm floor.** Consumer-owned normalization warning (not a request to duplicate it here): the Couveignes extraction routes the weighted/unweighted metric, discriminant normalization and integer-family applications to proposed EffectiveBoundsCompactModels. Couveignes uses twice the complex squared modulus; audited Mathlib mixed-embedding basis (1,i) is unweighted. The consumer must derive the 2^r2 measure factor, not identify unequal covolumes. Nonzero relation-lattice integer vectors have norm≥1; the initial number-field minima instead need the arithmetic norm/product argument. A general lattice does not have the ≥1 floor.

2. **Minkowski second theorem and successive minima.** Blichfeldt and both strict and compact-boundary first-theorem versions are built (reviewed audit). Ordered-product and intrinsic-ball consequences are decomposed here. Successive-minima carrier, positivity/attainment/independent witnesses, and both sides of Minkowski's second theorem remain. Acquire/read an exact freely accessible full proof, distinguish symmetric convex compact bodies with nonempty interior from open/body gauges, define minima on the existing lattice carrier with API and at least three discriminating tests, prove independent attained witnesses, and retain the full two-sided constants 2^n/n! and 2^n times covolume. Lower-rank lattices require their span, and dimension zero has separate empty products.

3. **GN.2 primary-source and proof decomposition.** Import field invariants/Witt theory from QuadraticFormInvariants and Hasse–Minkowski/isotropy/representation from GlobalQuadraticForms; rational integral lattice duality/discriminant/gluing is completed IntegralLattices. New work: O_K/Z_p integral lattices, localization, genera/spinor genera, dyadic and quaternionic/hermitian variants, with source-specific restrictions.

4. **GN.3 primary-source and proof decomposition.** AdelicAlgebraicGroups owns quotient/measure and reduction-domain foundations; MetaplecticAutomorphicForms owns theta. GN still needs local representation densities, finite stabilizers, genus classes, weighted mass, local normalization and convergence proofs.

5. **GN.4 primary-source and proof decomposition.** Existing null-frontier asymptotic lattice counting is an import. GN.4 retains Davenport's bounded semialgebraic MULTISET/projection-volume estimate with uniform dimension/multiplicity/complexity dependence (accepted RS-07), plus independent mixing/nondivergence/Oppenheim/Duke branches, packing/covering, transference, star bodies, Mahler compactness and Siegel mean value. Coding Construction A is AlgebraicCodingTheory layer 6; fixed-domain Lipschitz estimates are GlobalNumberFields.

6. **GN.5 primary-source and proof decomposition.** GN.5 owns generic verified LLL (accepted RS-03): exact Gram–Schmidt/rational comparisons, unimodular update certificates, termination, Lovasz and size reduction, approximation guarantees and original-lattice verification. ED.1/ED.2 own their arithmetic reduction/exclusion applications. No unrestricted exact SVP/CVP follows from LLL.

7. **GN.6 primary-source and proof decomposition.** GN.6 requires an exact category with duality, coherent double dual, forms/isometries, exact-category GW/W, hyperbolic/forgetful maps and higher hermitian K. Degree-zero field Witt/GW belongs to QuadraticFormInvariants. Source-scoped localization/periodicity needs precise invertibility-of-two/regularity assumptions; K.6 only the nonconnective subbranch.

8. **Proof execution.** All nineteen nodes and 54 suggested contract examples remain unchecked planning statements. Signature elaboration, finite exact regressions and separate small proofs do not establish the general blueprint theorems.

The next mathematical source target is Minkowski's second theorem and the successive-minima API, with both inequalities, attainment and independent witnesses. Keep the number-field metric normalization with its consumer. Do not reopen the decomposed primitive-orthogonal route or replace its existing carriers.

Accepted ownership remains binding: RS-07 assigns GN.4 the full Davenport multiset/projection-volume estimate needed by ArithmeticStatistics ST.2; generic convex-body or fixed-domain asymptotics are insufficient. RS-03 assigns verified LLL to GN.5 and its arithmetic applications to ED.1/ED.2. QuadraticFormInvariants, GlobalQuadraticForms, completed IntegralLattices, AdelicAlgebraicGroups and MetaplecticAutomorphicForms retain their existing work. GN.6 imports ordinary exact K theory but still has to construct duality and hermitian invariants; K.6 is only needed by a nonconnective branch. Retired Foundations stages are not dependencies of this packet.

## Source versions and corrections

The published Horesh–Karasik PDF has SHA-256 `f2a508029153b8428ff428732cf91e8d9d765650fc49217e9672ff7b2e826880`. The compared [arXiv v2](https://arxiv.org/pdf/2012.04508v2), dated 28 October 2021, has SHA-256 `f52ef00f945cfec330e68be260d6f83af27fe2067ac91e361de5afba94927aa5`. The packet records each version and the selected passages actually read. Definitions 2.1–2.2 and the A.5–A.6 discussion were examined only for the orientation/version checks; their other mathematics is not added to this roadmap.

Packet E1 retains the already confirmed Couveignes tensor-base correction. E2–E7 are source findings awaiting independent review, not independent-review verdicts:

- E2: after B.3, the published text wrongly transfers quotient torsion to the projected subgroup. Z²/(2Ze₁) has torsion; its projection Ze₂ does not. This does not invalidate B.3 with its primitive hypothesis.
- E3: B.4's proof needs absolute determinants, or an explicit compatible positive-orientation choice. Arbitrary GL-bases can reverse sign; the quotient-volume theorem is unaffected.
- E4: preprint A.5 puts the adjugate on a rectangular basis matrix. Published A.4 corrects the displayed inverse-Gram formula, although its explanatory noun still mislabels the matrix.
- E5: preprint B.5 projects the first columns, which lie in W and project to zero, instead of the complementary last columns; it also mislabels a perpendicular span. The published proof replaces this with the correct inner-pairing argument used here.
- E6: preprint A.6 infers measure preservation from being an involution, which alone is insufficient. The published Haar-measure/Cartan-involution argument repairs this. No measure-space-of-lattices result is imported here.
- E7: Definition 2.2's determinant-one criterion needs determinant positivity for an arbitrary complementary full lattice. Determinant one additionally requires product covolume one. For Ze₁ and 2Ze₂ the positive determinant is two.

The correction search compared the published PDF and arXiv version history, the author's publication list, and title/DOI correction searches on 27 September 2026. Direct publisher-page access failed, but the version-of-record PDF was available through ISTA. No separate correction was found in that bounded search; absence elsewhere is not asserted.

## Validation

- Packet checker with the exact pinned declaration index: nineteen nodes (thirteen lemmas, six theorems), five planets, 49 baseline declarations, eight explicit gaps and seven partial stages. There are nineteen theorem APIs and 57 packet contract tests. No definition/construction is introduced.
- Suggested file: nineteen main declarations and 54 contract examples; elaboration must produce exactly 73 unproved-statement warnings and no errors or other warnings. This checks signatures, not proofs.
- The inherited six small actual Lean proofs and finite regressions remain recorded in the earlier checkpoint. New separate scratch Lean proofs establish inner nondegeneracy, the full dual-projection identity, orthonormal-lattice self-duality and existence of a real basis spanning the dual lattice; five further finite examples check boundary/counterexample arithmetic.
- Exact rational-matrix regressions cover unimodular and nonunimodular adapted bases, every rank cut in dimensions zero through five, Gram factorization, dual pairing, reciprocal Gram determinants, primitive equal-covolume squares and nonsaturation. Final counts are in the handoff.
- The compile helper byte-checks each reached Mathlib source against the pin before cache reuse. The closure contains 8,482 Mathlib modules and no Tau Ceti imports. No general implementation is claimed.
