# Geometry of numbers and quadratic arithmetic: complete target-planning pass

All seven stages now have target-to-declaration chains. There are 157 planned
declarations, of which 77 are preserved from the incoming packet. “Complete”
means that this breadth pass is ready for independent review; it does not mean
that the mathematics is formalised, that original proofs have all been read,
or that the remaining gaps have disappeared. Every declaration remains
unchecked. The inherited reader below remains the detailed foundation for
Gram, covolume, primitive-orthogonal lattices, Henk counting and both sharp
Minkowski inequalities. The subsequent sections add the missing stage targets.

The reviewed audit already supplies the ordinary real lattice and covolume
foundations. Field quadratic invariants and Hasse–Minkowski remain with their
existing Tau Ceti owners, ordinary integral lattice duality with IntegralLattices,
adelic Haar/reduction foundations with AdelicAlgebraicGroups, theta with
MetaplecticAutomorphicForms, and Construction A with AlgebraicCodingTheory.
The accepted RS-03 decision leaves generic certified LLL here; its arithmetic
exclusion and height applications belong to their consumers. These are
contracts to import, not permission to create replacement carriers.

Integral lattices use finitely generated full native submodules over a Dedekind
domain and its fraction field. They are projective and need not have a global
basis. A quadratic map taking integral values is distinct from a perfect polar
pairing: over the integers, x² is integral but its polar pairing is 2xy.
Localization at a prime is distinct from completion. Rational equivalence,
integral isometry, genus and proper spinor genus are kept separate, with the
actual image of Spin on adelic points rather than an assumed surjective cover.

The local-density branch uses the base residue cardinality q; an unramified
quadratic residue extension has q² elements. Finite representation counts
include all form-preserving maps. The finite-field formula quoted by Li–Zhang
counts injective isometries, including when the source has a radical. This
difference matters: a zero rank-one source can have one representation and
zero embeddings into an anisotropic rank-one target. The Cho–Yamauchi weight
has its negative-q sign and its rank-zero derivative convention. Its original
Kitaoka/Hironaka/Gan–Yu smooth-density inputs remain named proof gaps.

Mass is a sum of reciprocal finite stabilizer orders. The proper SO adelic
volume identity and the ordinary O mass are distinguished. A separate maximal
integral mass endpoint records the source’s degree/dimension restrictions,
positive-integer zeta factors, archimedean normalization and dyadic local factors.
The theorem is not transferred to arbitrary nonmaximal or indefinite lattices.
The original mass theorem, local-model factors and convergence proof remain
explicit refinements; the hermitian density polynomial is not an orthogonal
mass factor.

The dynamics branch specifies connected groups, finite-volume quotients and
invariant probability measures. Howe–Moore mixing, unipotent nondivergence,
Ratner orbit closure, measure classification and time averages have separate
endpoints and proof gaps. Oppenheim retains nondegeneracy, indefiniteness,
dimension at least three and failure to be proportional to a rational form.
Duke’s spherical application retains square-free three-square restrictions.
Neither qualitative endpoint supplies a quantitative error term. Euclidean
packing, covering, nonconvex star bodies and transference are independent
contracts. The chosen covering transference endpoint uses the weaker uniform
constant n of Regev’s stated theorem; an asymptotic improved constant is not
silently used in small dimension.

LLL reduction uses the native ordered Gram–Schmidt construction, exact size
and Lovász inequalities, and integer two-sided change-of-basis certificates.
An integer prefix-Gram potential decreases under a failing adjacent swap.
The short-vector guarantee is checked in the original lattice, with squared
factor 2^(n−1); it supplies neither exact shortest-vector nor closest-vector
solutions. Finite scratch regressions cover 496 nonsingular two-dimensional
integer bases with entries between −2 and 2, their certificates, 256 swaps and
48 original-lattice vectors per basis. Eight finite-field embedding cases and
18 polynomial-weight cases were checked exactly. These are finite evidence,
not universal proofs or a Lean implementation.

The exact-category hermitian branch starts from strong coherent contravariant
duality and the native intrinsic exact structure, not a private exact-category
type. Symmetric spaces have pairing isomorphisms; separating integral forms
need not be perfect. Lagrangians are admissible exact sequences. The exact GW
presentation imposes the metabolic-to-hyperbolic relation, while Witt kills
metabolic classes. The forgetful–hyperbolic composite is 1+D, not automatically
twice the identity. Higher GW is a homotopy fibre, not the ordinary K space.

Hermitian suspension and its idempotent completion give a separate
nonconnective spectrum. The Qʰ-space sequence alone is generally not an
Ω-spectrum. Schlichting’s exact-category construction does not assume that two
is invertible; his classical dg Bott comparison does. Period four refers to
duality shifts, not all higher homotopy degrees. For Dedekind localization the
canonical residue duality line is (p⁻¹M/M)[−1]; its M/p identification depends
on a chosen uniformizer and is not naturally valid under arbitrary ramification.
Symmetric devissage at dyadic places does not imply quadratic devissage.
Number-ring comparison retains 2-completion, while inversion of two supplies
2-local connected covers and injectivity in degree zero, not an unrestricted
degree-zero isomorphism.

The stable Poincaré framework from Calmes et al. belongs to the separately
routed HermitianKTheoryOfPoincareCategories owner. Its exact supplier stages
are not yet available here and remain gaps. The generic framework is not
defined again in GN.6. The 295 routed item IDs from 31 papers and 36 routes
are a source-routing inventory, not a full proof-coverage certificate. Source
receipts below distinguish freshly read passages from inherited extraction
evidence and from original proofs still to acquire.

## Inherited detailed foundation

# Geometry of numbers: minima, finite counts and sharp product bounds

Issue [#1030](https://github.com/CBirkbeck/tauceti-explorer/issues/1030). Codex — codex-a71f92, continuing the codex-hjdg0j checkpoint, 2026-09-27. **Partial blueprint; all declarations remain unchecked.**

This packet supplies seventy-seven declaration plans in GN.0, GN.1 and GN.4. It includes the four lattice consequences routed from Couveignes, a native successive-minima invariant with its reusable API, independent attained minimum vectors, and both sharp halves of Minkowski’s second theorem. Henk’s finite-index, first-minimum and successive-minima counts are also decomposed. The upper volume argument now includes its integral strict flag, convex-section and codimension estimates, cross-row null intersections, finite box factorization, weighted telescoping, large-box limit and native covolume transport. Broader source coverage and the other recorded branches remain partial.

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

The dependency chain is section identity → pointwise enlargement → section-volume comparison → native Tonelli comparison. Separately, the complementary-map identity and native determinant/Haar APIs give the factor r^(dim F). Disjoint-interior volume additivity is also used by the lattice-box assembly.

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

The complementary dilation is id_E×r·id_F, so its determinant is r^(dim F), not r^(dim E+dim F). Its exact image-measure identity combines with the monotonicity step to give the stated codimension growth. The separate coordinate transport, transverse-row grouping and large-box limit are supplied in the upper-proof assembly below.

### Upstream compatibility

At inspection, [Mathlib PR #35812](https://github.com/leanprover-community/mathlib4/pull/35812) was open at head `8423d1c878e50d8504a230ffd9b6ec76ce6a08eb`. Its proposed native successive-minimum invariant has values in the nonnegative reals and uses a natural-number index. Relevant definition, attainment, directional-basis and endpoint passages were inspected; this is not a complete audit of its proof file. The related [Lean Zulip thread](https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Minkowski.20Lattice.20Theorem.html) records the planned scope.

Before implementation, reconcile the inherited private-plan real-valued gauge and finite-index interface with that upstream design. A directional real basis is not automatically an integral lattice basis, and the PR’s second-theorem placeholder does not supply the sharp upper product inequality. The analytic auxiliaries and the new upper-proof assembly do not redefine minima and use only native sets, maps and measures. The upper product inequality is supplied by this packet's Henk proof chain, not by the inspected upstream placeholder.

## GN.1: complete sharp upper product proof

The analytic section argument is joined to the integral minimum flag by fourteen declaration plans. For d,q∈N let M_q be the native finite interval of integer vectors with −q≤z_j≤q. Let M_q^k be its subset with z_j=0 for j≥k, and write U_q(S)=⋃_{z∈M_q}(c(z)+S), U_q^k(S)=⋃_{z∈M_q^k}(c(z)+S), where c is coordinatewise integer inclusion. These symbols are abbreviations for existing sets, not new definitions or carrier structures.

For d>0, write a_i=λ_i and K_i=(a_i/2)K in integral-basis coordinates. The exact chain is

```text
volume U_q(K_0) = (2q+1)^d (a_0/2)^d volume K
volume U_q(K_{i+1}) ≥ (a_{i+1}/a_i)^(d−i−1) volume U_q(K_i)
volume U_q(K_{d−1}) ≤ (2q+2R)^d, with R independent of q
⇒ (product a_i) volume K ≤ 2^d.
```

The last inequality is normalized coordinate volume. Native integral-basis volume transport restores covolume(L). The crucial row-volume step adds a.e.-disjoint row unions, not every individual translate: translates inside a row can overlap. Cross-row null intersections follow from null frontiers of the original convex pieces, without asserting that a row union is convex.

### Gauge under an invertible linear change

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/gauge-linear-equiv` — lemma; unchecked.

For real modules E,F, a linear equivalence e:E≃_R F, K⊆E and x∈E, gauge_{e(K)}(e(x))=gauge_K(x). No convexity, boundedness, symmetry or nonempty-interior hypothesis is needed.

Hypotheses: E,F are real modules with additive commutative group structure. Both the set and the evaluation point are transformed; this is an adapter for the existing gauge, not another gauge definition.

Proof plan:

1. Use the native inverse-scaling formula for gauge: its defining thresholds are the positive r with r⁻¹x∈K.
2. Linearity and injectivity identify r⁻¹e(x)∈e(K) exactly with r⁻¹x∈K for every positive r. The two threshold sets, hence their real infima, coincide.
3. The equality remains valid for an empty or nonabsorbing set because it identifies the native infimum sets exactly, including the native empty-set convention.

Prerequisites: `mathlib:gauge_def'`

API: `TauCeti.GeometryOfNumbersPlan.gauge_linearEquiv` — For real modules E,F, a linear equivalence e:E≃_R F, K⊆E and x∈E, gauge_{e(K)}(e(x))=gauge_K(x). No convexity, boundedness, symmetry or nonempty-interior hypothesis is needed.

Acceptance checks:

- For K=[−1,1], transforming K and x=1 by multiplication by 2 gives gauge_[−2,2](2)=1.
- Keeping K=[−1,1] while replacing x=1 by x=2 gives gauge 2, not 1.

Source use: [Henk2002](https://arxiv.org/abs/math/0204158), p.5, reduction to the standard lattice at the start of §3. Worker-derived normalization adapter for Henk's simultaneous coordinate change. The gauge language is the pinned library's, not a quotation of the paper.

### Null intersection of separated convex clusters

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/convex-cluster-intersection-null` — lemma; unchecked.

For finite families A:I→Set(E), B:J→Set(E) of convex sets, if int(A_i) and int(B_j) are disjoint for every i,j, then μ((⋃_i A_i)∩(⋃_j B_j))=0.

Hypotheses: E is finite-dimensional real normed, with Borel structure and an additive Haar measure μ. The families may be empty; the individual convex sets need not be closed or bounded. The unions need not be convex.

Proof plan:

1. For a point belonging to A_i∩B_j, the cross-interior hypothesis says it is outside at least one of the two interiors.
2. Native mem_frontier_iff_notMem_interior puts that point in frontier(A_i) or frontier(B_j). Thus the cluster intersection is contained in the union of all those frontiers.
3. Each frontier is Haar-null by the existing convex-frontier theorem; finite unions are null by native measure_iUnion_null_iff and measure_union_null. Apply measure_mono_null.
4. No assertion that either cluster is convex is used, and no restriction is imposed on overlaps within A or within B.

Prerequisites: `mathlib:mem_frontier_iff_notMem_interior`, `mathlib:Convex.addHaar_frontier`, `mathlib:MeasureTheory.measure_iUnion_null_iff`, `mathlib:MeasureTheory.measure_union_null`, `mathlib:MeasureTheory.measure_mono_null`

API: `TauCeti.GeometryOfNumbersPlan.convex_cluster_intersection_null` — For finite families A:I→Set(E), B:J→Set(E) of convex sets, if int(A_i) and int(B_j) are disjoint for every i,j, then μ((⋃_i A_i)∩(⋃_j B_j))=0.

Acceptance checks:

- ([0,2]∪[1,3])∩([3,5]∪[4,6]) has real volume zero.
- [0,2]∩[1,3] has volume one: dropping cross-interior disjointness is false.

Source use: [Henk2002](https://arxiv.org/abs/math/0204158), p.6, the volume factorizations immediately after (3.4). Worker-expanded null-overlap step needed because the paper's row blocks are generally nonconvex finite unions.

### Additive volume of transverse translate clusters

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/clustered-translate-volume` — lemma; unchecked.

For compact convex K⊆E, finite u:I→E and v:J→E, suppose int(u_i+v_j+K) and int(u_i′+v_j′+K) are disjoint whenever j≠j′, for all i,i′. Then μ(⋃_j⋃_i(u_i+v_j+K))=|J|·μ(⋃_i(u_i+K)).

Hypotheses: E is finite-dimensional real normed and Borel; μ is additive Haar measure. Both index types may be empty. Within each row j, the sets may overlap and the labels i may repeat.

Proof plan:

1. The intersection of any two different row blocks has measure zero by convex-cluster-intersection-null applied to their individual convex translates.
2. Every block is a finite union of compact translates, hence measurable. Apply native measure_iUnion₀ to the row blocks, not to all individual translates.
3. Associativity and distribution of translation through a union identify each row block as v_j plus the same prefix union ⋃_i(u_i+K). Translation invariance makes its measure independent of j.
4. The finite sum of identical row volumes is |J| times that volume. Do not replace the prefix-union volume by |I|·μ(K), which can be strictly larger.

Prerequisites: `GeometryOfNumbersAndQuadraticArithmetic:GN.1/convex-cluster-intersection-null`, `mathlib:Convex.translate`, `mathlib:Homeomorph.image_interior`, `mathlib:IsCompact.image`, `mathlib:isCompact_iUnion`, `mathlib:IsCompact.isClosed`, `mathlib:IsClosed.measurableSet`, `mathlib:MeasureTheory.measure_iUnion₀`, `mathlib:MeasureTheory.measure_preimage_mul_right`

API: `TauCeti.GeometryOfNumbersPlan.clustered_translate_volume` — For compact convex K⊆E, finite u:I→E and v:J→E, suppose int(u_i+v_j+K) and int(u_i′+v_j′+K) are disjoint whenever j≠j′, for all i,i′. Then μ(⋃_j⋃_i(u_i+v_j+K))=|J|·μ(⋃_i(u_i+K)).

Acceptance checks:

- The union of [0,2],[1,3],[3,5],[4,6] has volume 6=2·3, not 4·2=8.
- Repeating [0,1] within a row does not double that row's volume; two touching translated rows still have total volume 2.

Source use: [Henk2002](https://arxiv.org/abs/math/0204158), p.6, the two factorizations following (3.4). Declares precisely the clustered additivity used in Henk's proof, preserving within-row overlaps and allowing touching cross-row boundaries.

### Separation outside a strict gauge flag

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/strict-flag-translate-separation` — lemma; unchecked.

Let K⊆R^d be a symmetric convex body with 0 in its interior, t>0 and 0≤k≤d. Suppose every z∈Z^d with gauge_K(c(z))<t has z_j=0 for j≥k. If x,y∈Z^d differ in some coordinate j≥k, then c(x)+int((t/2)K) and c(y)+int((t/2)K) are disjoint.

Hypotheses: These are native sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a native finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the native zero-dimensional convention. The flag condition is strict. No assertion about gauge=t points is made. A minimum vector need not be a basis vector, and no equality between a real and integral basis is assumed.

Proof plan:

1. Suppose a point is c(x)+a=c(y)+b with a,b in int((t/2)K). Native interior_subset_gauge_lt_one and gauge_smul_left_of_nonneg give gauge_K(a)<t/2 and gauge_K(b)<t/2.
2. By convexity, zero-interior absorbency, gauge_add_le and symmetry gauge_K(b−a)≤gauge_K(b)+gauge_K(a)<t.
3. The equality of translated points gives c(x−y)=b−a. The strict flag hypothesis forces x_j−y_j=0 for every j≥k, contradicting the chosen unequal coordinate.
4. The argument uses no strict inequality between two consecutive minima; it therefore remains valid when minima repeat. For k=d the unequal-coordinate premise is impossible.

Prerequisites: `mathlib:interior_subset_gauge_lt_one`, `mathlib:gauge_smul_left_of_nonneg`, `mathlib:gauge_add_le`, `mathlib:gauge_neg`, `mathlib:absorbent_nhds_zero`

API: `TauCeti.GeometryOfNumbersPlan.strict_flag_translate_separation` — Let K⊆R^d be a symmetric convex body with 0 in its interior, t>0 and 0≤k≤d. Suppose every z∈Z^d with gauge_K(c(z))<t has z_j=0 for j≥k. If x,y∈Z^d differ in some coordinate j≥k, then c(x)+int((t/2)K) and c(y)+int((t/2)K) are disjoint.

Acceptance checks:

- The open intervals (−1/2,1/2) and (1/2,3/2) are disjoint, even though the corresponding closed intervals touch.
- Replacing the half-body by the whole unit interval makes translates centered at 0 and 1 overlap on (0,1).

Source use: [Henk2002](https://arxiv.org/abs/math/0204158), pp.5–6, (3.2) and (3.4), using the strict flag from (2.3). Expands Henk's nonintersection argument using the stronger inherited strict-sublevel flag, which also handles repeated minima.

### Volume factorization by lattice-box rows

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/lattice-box-row-volume` — lemma; unchecked.

For compact convex S⊆R^d, q∈N and k≤d, assume c(x)+int(S) and c(y)+int(S) are disjoint for all x,y∈M_q whose tails (coordinates j≥k) differ. Then volume(U_q(S))=(2q+1)^(d−k)·volume(U_q^k(S)).

Hypotheses: These are native sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a native finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the native zero-dimensional convention. Lebesgue volume is the native product volume on R^d. The statement is in the nonnegative extended reals, with the natural cardinal factor cast into that space.

Proof plan:

1. Split each z∈M_q uniquely into u+v: u_j=z_j for j<k and zero otherwise; v_j=0 for j<k and z_j otherwise. Conversely every such bounded prefix/tail pair sums to an element of M_q. This coordinatewise bijection gives the exact union decomposition.
2. Take the prefix and tail finite interval subtypes as the indexing types in clustered-translate-volume. Different tails satisfy the stated cross-interior condition for every pair of prefix coordinates.
3. Each of the d−k tail coordinates ranges independently over the integer interval [−q,q]. Native Pi.card_Icc and Int.card_Icc give precisely (2q+1)^(d−k), including q=0 and k=d.
4. The common row is exactly U_q^k(S); no convexity of that row is claimed and no individual-translate cardinal sum replaces its volume.

Prerequisites: `GeometryOfNumbersAndQuadraticArithmetic:GN.1/clustered-translate-volume`, `mathlib:Equiv.piEquivPiSubtypeProd`, `mathlib:Pi.card_Icc`, `mathlib:Int.card_Icc`

API: `TauCeti.GeometryOfNumbersPlan.lattice_box_row_volume` — For compact convex S⊆R^d, q∈N and k≤d, assume c(x)+int(S) and c(y)+int(S) are disjoint for all x,y∈M_q whose tails (coordinates j≥k) differ. Then volume(U_q(S))=(2q+1)^(d−k)·volume(U_q^k(S)).

Acceptance checks:

- For q=1,k=1,d=2 and S=[−1,1]×[−1/2,1/2], the prefix union has area 4 and the full union area 12=3·4; summing nine individual areas would incorrectly give 18.
- M_0 consists only of zero in every dimension, so every row-volume factor at q=0 is one.

Source use: [Henk2002](https://arxiv.org/abs/math/0204158), p.6, the two displayed volume factorizations after (3.4). Uses native finite intervals and exact coordinate splitting to make Henk's row multiplicity explicit.

### Codimension growth in prefix coordinates

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/coordinate-transverse-union-volume` — lemma; unchecked.

For k≤d, compact convex S⊆R^d, a finite family v:I→R^d with (v_i)_j=0 whenever j≥k, and r≥1, r^(d−k)·volume(⋃_i(v_i+S))≤volume(⋃_i(v_i+rS)).

Hypotheses: These are native sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a native finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the native zero-dimensional convention. No symmetry or origin condition is required for S. The family may be empty or have repeated labels. This is the existing product-space inequality expressed in native coordinate space, not a new geometric carrier.

Proof plan:

1. Use the native equivalence splitting Fin d by j.val<k into prefix and tail functions. Its homeomorphism preserves compactness; its coordinate formulas preserve convex combinations, translations and scalar multiplication.
2. Native volume_preserving_piEquivPiSubtypeProd identifies the original product volume with prefix-volume times tail-volume, with no extra determinant or normalization factor.
3. The tail restriction of every v_i is zero, so the transformed union has the exact form used by transverse-union-volume. Apply that theorem with prefix space R^{j<k} and tail space R^{j≥k}.
4. The tail index set is in bijection with Fin(d−k), hence its real dimension is d−k. Transport the measure inequality back through the native volume-preserving equivalence. The k=0 and k=d cases use the same empty-product measure convention.

Prerequisites: `GeometryOfNumbersAndQuadraticArithmetic:GN.1/transverse-union-volume`, `mathlib:Equiv.piEquivPiSubtypeProd`, `mathlib:Homeomorph.piEquivPiSubtypeProd`, `mathlib:MeasureTheory.volume_preserving_piEquivPiSubtypeProd`, `mathlib:Module.finrank_fintype_fun_eq_card`

API: `TauCeti.GeometryOfNumbersPlan.coordinate_transverse_union_volume` — For k≤d, compact convex S⊆R^d, a finite family v:I→R^d with (v_i)_j=0 whenever j≥k, and r≥1, r^(d−k)·volume(⋃_i(v_i+S))≤volume(⋃_i(v_i+rS)).

Acceptance checks:

- For d=3,k=1,r=2 the multiplier is 4, not the ambient factor 8.
- For k=d the multiplier is r^0=1; for k=0 it is r^d.

Source use: [Henk2002](https://arxiv.org/abs/math/0204158), p.6, (3.5) and the coordinate maps f₁,f₂. Native coordinate adapter for the previously planned product-Haar theorem; neither coordinate volume nor change-of-variables infrastructure is replanned.

### Consecutive-threshold lattice-box volume inequality

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-box-volume-ratio` — lemma; unchecked.

For K⊆R^d symmetric convex with 0 in its interior, 0<s≤t, q∈N and k≤d, assume gauge_K(c(z))<t implies z_j=0 for all j≥k. Then (t/s)^(d−k)·volume.real(U_q((s/2)K))≤volume.real(U_q((t/2)K)).

Hypotheses: These are native sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a native finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the native zero-dimensional convention.

Proof plan:

1. Strict-flag-translate-separation at t proves that different transverse rows have disjoint interiors for the larger half-body. The same strict-flag premise holds at s because s≤t, so the smaller half-body has the same row separation.
2. Apply lattice-box-row-volume to both scales, obtaining the identical positive finite multiplicity (2q+1)^(d−k).
3. The prefix union contains translations only in the first k coordinates. Apply coordinate-transverse-union-volume with r=t/s≥1 and S=(s/2)K; positivity of s identifies rS exactly with (t/2)K.
4. Multiply by the common row multiplicity and substitute the two exact factorizations. All finite translated unions are compact, hence have finite measure, so conversion to real volume is legitimate.
5. When s=t, the multiplier is one and the two sets agree. The proof does not discard this branch or require distinct minima.

Prerequisites: `GeometryOfNumbersAndQuadraticArithmetic:GN.1/strict-flag-translate-separation`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/lattice-box-row-volume`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/coordinate-transverse-union-volume`, `mathlib:IsCompact.measure_lt_top`, `mathlib:isCompact_iUnion`, `mathlib:IsCompact.image`

API: `TauCeti.GeometryOfNumbersPlan.flag_box_volume_ratio` — For K⊆R^d symmetric convex with 0 in its interior, 0<s≤t, q∈N and k≤d, assume gauge_K(c(z))<t implies z_j=0 for all j≥k. Then (t/s)^(d−k)·volume.real(U_q((s/2)K))≤volume.real(U_q((t/2)K)).

Acceptance checks:

- If s=t>0, the ratio inequality is equality, including every q and cutoff.
- For q=1, K=[−1,1]×[−1/3,1/3], s=1,t=3,k=1, the smaller and larger union areas are 3 and 15. The required factor gives 9≤15; the incorrect ambient exponent gives 27≤15, which is false.

Source use: [Henk2002](https://arxiv.org/abs/math/0204158), pp.5–6, (3.3)–(3.5). Supplies Henk's consecutive-minimum ratio after substituting s=λ_i, t=λ_{i+1}, k=i+1 in zero-based indexing; the more general threshold formulation isolates the exact flag assumption.

### Initial lattice-box translate volume

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/first-box-volume` — lemma; unchecked.

For K⊆R^d symmetric convex with 0 in its interior and s>0, suppose gauge_K(c(z))<s for an integer vector z implies z=0. Then for every q∈N, volume.real(U_q((s/2)K))=(2q+1)^d·(s/2)^d·volume.real(K).

Hypotheses: These are native sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a native finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the native zero-dimensional convention.

Proof plan:

1. Use strict-flag-translate-separation at cutoff zero: any two distinct integer vectors differ in some coordinate, so the interiors of their half-body translates are disjoint.
2. Apply finite-interior-disjoint-volume to the finite interval M_q and the compact convex body (s/2)K.
3. Native Pi.card_Icc and Int.card_Icc give |M_q|=(2q+1)^d. Native addHaar_smul_of_nonneg gives volume((s/2)K)=(s/2)^d volume(K).
4. Compactness makes all measures finite, so taking real parts yields the displayed identity. At d=0 there is one integer vector and all exponents are zero; no first-minimum index is evaluated.

Prerequisites: `GeometryOfNumbersAndQuadraticArithmetic:GN.1/strict-flag-translate-separation`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/finite-interior-disjoint-volume`, `mathlib:Pi.card_Icc`, `mathlib:Int.card_Icc`, `mathlib:MeasureTheory.Measure.addHaar_smul_of_nonneg`, `mathlib:IsCompact.measure_lt_top`

API: `TauCeti.GeometryOfNumbersPlan.first_box_volume` — For K⊆R^d symmetric convex with 0 in its interior and s>0, suppose gauge_K(c(z))<s for an integer vector z implies z=0. Then for every q∈N, volume.real(U_q((s/2)K))=(2q+1)^d·(s/2)^d·volume.real(K).

Acceptance checks:

- For q=1 and K=[−1,1]^2 with s=1, the union area is 9=3²·(1/2)²·4.
- For q=1, K=[−2,2]×[−1,1] and s=1/2, the union area is 9/2=3²·(1/4)²·8.

Source use: [Henk2002](https://arxiv.org/abs/math/0204158), p.5, (3.2). Exact starting value for the volume recurrence; the cardinality and scalar-volume laws are already built.

### Uniform enclosing box for lattice translates

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/outer-lattice-box-volume` — lemma; unchecked.

For any compact S⊆R^d there is R≥0 such that, for every q∈N, volume.real(U_q(S))≤(2q+2R)^d.

Hypotheses: These are native sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a native finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the native zero-dimensional convention. S need not be convex, symmetric or nonempty. R depends on S and d but is chosen once, independently of q.

Proof plan:

1. Native compact-implies-bounded and the norm bound give R≥0 with |x_j|≤R for every x∈S and coordinate j; take the maximum of zero and a norm bound.
2. If z∈M_q and x∈S, each coordinate of c(z)+x lies in [−q−R,q+R] by the triangle inequality. Thus the whole finite union lies in that coordinate box.
3. Use native measureReal_mono and volume_Icc_pi. The enclosing box has volume (2q+2R)^d and finite measure; there is no asymptotic error term being assumed.
4. For d=0 the enclosing box has volume one, even when q=R=0. If S is empty the left side is zero.

Prerequisites: `mathlib:IsCompact.isBounded`, `mathlib:isBounded_iff_forall_norm_le'`, `mathlib:MeasureTheory.measureReal_mono`, `mathlib:Real.volume_Icc_pi`

API: `TauCeti.GeometryOfNumbersPlan.outer_lattice_box_volume` — For any compact S⊆R^d there is R≥0 such that, for every q∈N, volume.real(U_q(S))≤(2q+2R)^d.

Acceptance checks:

- For q=1 and R=3/2 in dimension two, the enclosing area is (2+3)²=25, bounding the anisotropic row example of area 15.
- In dimension zero the right side is one, including q=R=0; the empty union's volume is zero.

Source use: [Henk2002](https://arxiv.org/abs/math/0204158), p.5, (3.1). Expands Henk's boundedness constant into a native coordinate enclosure uniform over all q.

### Telescoping product with descending exponents

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/weighted-ratio-product` — lemma; unchecked.

For n∈N and positive a:Fin(n+1)→R, a_0^(n+1)·∏_{i:Fin n}(a_{i+1}/a_i)^(n−i)=∏_{j:Fin(n+1)}a_j.

Hypotheses: All a_j are strictly positive, so every denominator is nonzero. No monotonicity is needed for this algebraic identity. With n=0 the ratio product is empty and both sides are a_0.

Proof plan:

1. Split the finite product at its first factor using native Fin.prod_univ_succ and induct on n.
2. For the induction step, factor a_0^(n+1)(a_1/a_0)^n=a_0·a_1^n, using positivity to cancel a_0. The remaining ratio product is the same expression for the tail sequence, with exponents n−1,…,1.
3. Apply the induction hypothesis to the tail and reassemble ∏a_j by Fin.prod_univ_succ. This explicitly accounts for the exponent decrease; an unweighted ratio product would only retain the endpoints.
4. Equal adjacent a_j contribute exactly one; no limit or cancellation of a zero threshold is used.

Prerequisites: `mathlib:Fin.prod_univ_succ`

API: `TauCeti.GeometryOfNumbersPlan.weighted_ratio_product` — For n∈N and positive a:Fin(n+1)→R, a_0^(n+1)·∏_{i:Fin n}(a_{i+1}/a_i)^(n−i)=∏_{j:Fin(n+1)}a_j.

Acceptance checks:

- For a=(2,3,5), 2³·(3/2)²·(5/3)=30=2·3·5.
- For a=(2,2,5), the repeated ratio is one and the identity gives 20.
- For n=0, the empty ratio product gives a_0^1=a_0.

Source use: [Henk2002](https://arxiv.org/abs/math/0204158), p.7, the final product expansion. Worker-expanded finite algebra behind Henk's cancellation of successive-minimum ratios.

### Accumulate the consecutive volume inequalities

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/weighted-volume-chain` — lemma; unchecked.

For positive a:Fin(n+1)→R, nonnegative V:Fin(n+1)→R and B≥0, assume a_0^(n+1)B≤V_0 and (a_{i+1}/a_i)^(n−i)V_i≤V_{i+1} for every i:Fin n. Then (∏_j a_j)B≤V_n.

Hypotheses: All sequence entries and endpoints use Fin(n+1). The recurrence has exactly n inequalities, so for n=0 the conclusion is the initial inequality.

Proof plan:

1. Induct along the n consecutive inequalities, multiplying the previous lower bound by the next nonnegative ratio power at each step.
2. This gives V_n≥(∏_{i:Fin n}(a_{i+1}/a_i)^(n−i))·V_0. Substitute the initial lower bound and rearrange the finite real product.
3. Use weighted-ratio-product to replace a_0^(n+1) times the weighted ratio product by ∏a_j.
4. No division by V_i, B or body volume occurs. Thus zero volumes are allowed in this algebraic interface, and equality or repeated thresholds remain valid.

Prerequisites: `GeometryOfNumbersAndQuadraticArithmetic:GN.1/weighted-ratio-product`

API: `TauCeti.GeometryOfNumbersPlan.weighted_volume_chain` — For positive a:Fin(n+1)→R, nonnegative V:Fin(n+1)→R and B≥0, assume a_0^(n+1)B≤V_0 and (a_{i+1}/a_i)^(n−i)V_i≤V_{i+1} for every i:Fin n. Then (∏_j a_j)B≤V_n.

Acceptance checks:

- For a=(2,3,5), B=1 and V=(8,18,30), the two recurrence steps are equalities and the endpoint is 30.
- With B=0 and V identically zero the conclusion holds; a proof that divides by a volume would be invalid.

Source use: [Henk2002](https://arxiv.org/abs/math/0204158), p.7, the chain of inequalities after (3.6). Isolates the finite recurrence before applying the enclosing box and the limit.

### Pass a uniform box comparison to the limit

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/large-box-comparison-limit` — lemma; unchecked.

For d∈N and real R,B, if (2q+1)^d B≤(2q+2R)^d for every q∈N, then B≤1.

Hypotheses: The scalar statement does not require R≥0 or B≥0; the geometric application supplies both. The denominator 2q+1 is always strictly positive. Dimension zero is allowed.

Proof plan:

1. Divide each inequality by the strictly positive (2q+1)^d to obtain B≤((2q+2R)/(2q+1))^d.
2. Use native tendsto_add_mul_div_add_mul_atTop_nhds with numerator constant 2R, denominator constant 1 and both linear coefficients 2. The ratio tends to one.
3. Continuity of natural powers gives limit one for its d-th power. Apply the native closed-order limit comparison (the generated dual of le_of_tendsto') to the pointwise lower bound by B.
4. This is a limit of explicit box ratios, not a lattice-point asymptotic theorem. In dimension zero the hypothesis already says B≤1.

Prerequisites: `mathlib:tendsto_add_mul_div_add_mul_atTop_nhds`, `mathlib:le_of_tendsto'`

API: `TauCeti.GeometryOfNumbersPlan.large_box_comparison_limit` — For d∈N and real R,B, if (2q+1)^d B≤(2q+2R)^d for every q∈N, then B≤1.

Acceptance checks:

- For R=1/2 the ratio (2q+2R)/(2q+1) is identically one.
- For d=0 both powers are one even when the numerator vanishes.

Source use: [Henk2002](https://arxiv.org/abs/math/0204158), p.7, the last display and its conclusion for all q. Expands the last limiting step without importing a stronger lattice-counting estimate.

### Sharp product bound from a coordinate flag

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/coordinate-flag-upper` — theorem; unchecked.

Let K be a symmetric convex body in R^d with 0 in its interior, and let a:Fin d→R be positive and nondecreasing. Suppose for every i and z∈Z^d, gauge_K(c(z))<a_i implies z_j=0 for all j≥i. Then (∏_i a_i)·volume.real(K)≤2^d.

Hypotheses: These are native sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a native finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the native zero-dimensional convention. The a_i are threshold data satisfying the explicit flag condition; the statement does not define a new successive-minimum invariant. The conclusion includes d=0.

Proof plan:

1. If d=0, K is nonempty in the one-point function space. Native volume_pi_eq_dirac gives volume(K)=1, and the empty product and 2^0 are one.
2. For d=n+1>0, set S_i=(a_i/2)K and V_i=volume.real(U_q(S_i)). Positivity and monotonicity supply 0<a_i≤a_{i+1}. Apply flag_box_volume_ratio with cutoff k=i+1 and threshold t=a_{i+1}; its exponent is n−i.
3. At index zero the flag says every integer vector with gauge<a_0 has all coordinates zero. Apply first-box-volume to obtain V_0=(2q+1)^d(a_0/2)^d volume.real(K).
4. Use weighted-volume-chain with B_q=(2q+1)^d volume.real(K)/2^d. This yields (2q+1)^d·[(∏a_i)volume.real(K)/2^d]≤V_n.
5. Apply outer-lattice-box-volume to the fixed compact final body (a_n/2)K. The resulting R is independent of q, so large-box-comparison-limit gives (∏a_i)volume.real(K)/2^d≤1. Multiply by 2^d>0.
6. The n=0 recurrence is empty; equal adjacent thresholds use the equality branch of the ratio lemma. No strict floor-count estimate or conjectural factor-one lattice count is used.

Prerequisites: `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-box-volume-ratio`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/first-box-volume`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/weighted-volume-chain`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/outer-lattice-box-volume`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/large-box-comparison-limit`, `mathlib:MeasureTheory.Measure.volume_pi_eq_dirac`, `mathlib:ConvexBody.isCompact`

API: `TauCeti.GeometryOfNumbersPlan.coordinate_flag_upper` — Let K be a symmetric convex body in R^d with 0 in its interior, and let a:Fin d→R be positive and nondecreasing. Suppose for every i and z∈Z^d, gauge_K(c(z))<a_i implies z_j=0 for all j≥i. Then (∏_i a_i)·volume.real(K)≤2^d.

Acceptance checks:

- For Z² and K=[−3,3]×[−1,1], thresholds (1/3,1) give product-volume 4, exactly 2².
- For the unit diamond and thresholds (1,1), product-volume is 2<4.
- For d=0 the product-volume and the bound are both one.

Source use: [Henk2002](https://arxiv.org/abs/math/0204158), §3, pp.5–7, (3.1)–(3.6) and final display. Complete declaration-sized coordinate proof of Henk's upper bound; the strict flag is supplied separately and need not be renamed as minima.

### Minkowski’s sharp upper product inequality

- [ ] `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper` — theorem; unchecked.

For a discrete full Z-lattice L in a finite-dimensional real inner-product space E and a centrally symmetric convex body K with 0 in its interior, (∏_{i:Fin d}λ_i(L,K))·volume.real(K)≤2^d·covolume(L), where d=dim_R E and λ_i is the inherited zero-based successive minimum. The formula includes d=0.

Hypotheses: E carries its native Borel structure and canonical intrinsic Euclidean volume. L uses native Submodule Z E, DiscreteTopology and IsZLattice. K uses native ConvexBody. The inherited real-valued gauge minimum interface is a plan, not a new completed library implementation. Lower-rank lattices are first regarded as full lattices in their real spans, with intrinsic measure. No ambient-volume conclusion for a lower-dimensional body is substituted.

Proof plan:

1. Choose an integral basis b adapted to the strict minimum flag by integral-minimum-flag; its real extension is native b.ofZLatticeBasis. This need not be the attained minimum family.
2. Let e=(b.ofZLatticeBasis).equivFunL and K'=e(K), using the native compact convex image. Continuity, bijectivity and linearity preserve the zero-interior and central-symmetry hypotheses.
3. For z∈Z^d take x=b.equivFun⁻¹(z)∈L. Native ofZLatticeBasis_repr_apply identifies e(x)=c(z), and gauge-linear-equiv identifies its gauge. Native mem_flag_iff_repr_eq_zero turns the inherited strict flag into the coordinate-flag hypothesis for a_i=λ_i. Native coordinate/basis bijectivity supplies every integer vector, not just an inclusion of a sublattice.
4. Use successive-minimum-pos and successive-minimum-monotone, then coordinate-flag-upper to obtain (∏λ_i)volume.real(K')≤2^d.
5. Import native ZLattice.volume_image_eq_volume_div_covolume' for the compact measurable K: volume(K')=volume(K)/ofReal(covolume(L)). Covolume positivity and finite compact volume permit real conversion and multiplication by covolume(L), giving the displayed inequality with exactly that factor.
6. The coordinate theorem includes d=0, so the empty basis/product and one-point volume discharge that case without selecting a nonexistent first or last minimum. No minimum-normalization assumption λ_0≥1 is introduced.

Prerequisites: `GeometryOfNumbersAndQuadraticArithmetic:GN.1/integral-minimum-flag`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/gauge-linear-equiv`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-pos`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-monotone`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/coordinate-flag-upper`, `mathlib:Module.Basis.ofZLatticeBasis_repr_apply`, `mathlib:Module.Basis.mem_flag_iff_repr_eq_zero`, `mathlib:Module.Basis.equivFun`, `mathlib:Convex.linear_image`, `mathlib:Homeomorph.image_interior`, `mathlib:IsCompact.image`, `mathlib:IsCompact.isClosed`, `mathlib:IsClosed.measurableSet`, `mathlib:ZLattice.volume_image_eq_volume_div_covolume'`, `mathlib:ZLattice.covolume_pos`, `mathlib:IsCompact.measure_lt_top`

API: `TauCeti.GeometryOfNumbersPlan.minkowski_second_upper` — For a discrete full Z-lattice L in a finite-dimensional real inner-product space E and a centrally symmetric convex body K with 0 in its interior, (∏_{i:Fin d}λ_i(L,K))·volume.real(K)≤2^d·covolume(L), where d=dim_R E and λ_i is the inherited zero-based successive minimum. The formula includes d=0.

Acceptance checks:

- For L=2Z and K=[−3,3], minimum 2/3 times length 6 is 4=2·covolume(L); omitting covolume would assert 4≤2.
- For L=2Z×3Z and K=[−2,2]×[−1,1], minima (1,3) and area 8 give 24=4·6.
- In the zero-dimensional canonical space the empty product, volume, covolume and 2^0 are all one.

Source use: [Henk2002](https://arxiv.org/abs/math/0204158), p.2 Theorem 1.3 and complete §3 proof, pp.5–7. Combines the full coordinate upper proof with the native integral-basis covolume normalization. Along with the inherited lower theorem and attained witnesses, this supplies the generic two-sided product contract, not the consumer's arithmetic metric or algorithmic reductions.

## Consumer contracts and ownership

GN.1 now supplies plans for minimum values, their attained independent witnesses, intrinsic volume conventions and both sharp product inequalities. The new upper theorem supplies the generic product input needed by the Couveignes compact-model consumer; the ordered-product root estimate is a distinct consequence requiring its own ≥1 hypotheses. No consumer packet is marked complete, and the consumer-owned arithmetic metric/discriminant conversion and norm-floor arguments remain necessary. GN.5 uses the same native lattices and minimum invariant for comparison with certified lattice reduction; a selected minimum family supplies no algorithmic runtime or verified LLL output.

ArithmeticStatistics ST.0 and DiophantineApproximationAndTranscendence DT.0 import the relevant convex-body results. The first minimum adapter makes the native first theorem usable in this vocabulary. The boundary linear-forms theorem directly supplies the existing DT.0/DT.2 request, retaining every non-strict inequality and requiring positive dimension. Its region-volume helper imports the native Haar determinant formula and closed-box volume. Blichfeldt and Minkowski first remain baseline imports. Number-field ideals, units and class groups remain with their built owners. The weighted canonical embedding and its powers of two remain the EffectiveBoundsCompactModels consumer’s responsibility.

RS-03 retains generic verified LLL in GN.5 and its arithmetic exclusion applications in ED.1/ED.2. RS-07 retains the full Davenport multiset/projection-volume contract in GN.4. IntegralLattices, QuadraticFormInvariants, GlobalQuadraticForms, AdelicAlgebraicGroups and MetaplecticAutomorphicForms retain their recorded foundations. No retired Foundations stage is used as a dependency.

## Source boundaries and corrections

The Evertse author-hosted chapter is the PDF linked by the Fall 2023 course page. Its selected preliminaries and complete successive-minima/lower-bound proof were read; its full 28 pages and the Hermite-basis proof are not claimed read. The complete seven-page [Henk preprint](https://arxiv.org/abs/math/0204158) was read. Its publisher version was not obtained. Both file hashes, access date and exact page ranges are in the packet. The preprint’s Theorem 1.5 is a proved lattice-point estimate; its Conjecture 1.4 remains a conjecture in the source and is not supplied as a theorem.

Inherited source findings E1–E7 and their version provenance are retained. E1 is the independently confirmed Couveignes tensor-base correction. E2–E7 concern the Horesh–Karasik projected quotient, determinant signs, version-specific inverse-Gram/projection arguments, Haar-measure justification and complementary orientation. Their full records remain in the packet; this continuation adds no review verdict.

Two inherited wording findings await independent review; no new finding is added in this continuation. E8 corrects the coefficient index in Evertse’s Lemma 2.10: r coefficients for r vectors, rather than n ambient coordinates. Its lower-bound application has r=n and is unaffected. E9 records that Henk’s preprint uses floor brackets while describing a ceiling; the floor convention is retained. Both page images were checked. Searches of the linked course/author pages, arXiv version history and targeted correction queries found no separate correction in the checked sources. The apparent missing invertibility in Evertse’s transformation remark is not an error: printed p.15 explicitly defines that phrase to mean an invertible linear map.

The identical seven-page Henk preprint was freshly reread for the product-count checkpoint, with rendered pp.4–5 checked again. This checkpoint freshly rereads all seven pages and visually inspects pp.5–7 for the complete sharp upper proof. Both Theorem 1.5 and §3 are now decomposed. The publisher version was not obtained, and no new correction search or source-wide correctness claim is made.

## Planets and coverage

Twelve planets are selected: three in GN.0, six in GN.1 and three in GN.4. GN.1 shows Ordered-product bound, Successive minima, Independent minimum vectors, Minkowski lower product bound, Minkowski upper product bound, and Minkowski linear forms theorem. The central upper theorem takes the former Intrinsic ball bound slot; that auxiliary's id, statement, API and tests are unchanged. GN.4 retains Henk sublattice counting lemma, First-minimum lattice-point bound and Henk's successive-minima lattice-point bound. Planet selection is not an implementation claim.

- **GN.0 — partial.** Original lattice/covolume/fundamental-domain/change-of-basis target is already built (reviewed audit). Gram/Hadamard and primitive-orthogonal consequences from the four-item Couveignes routing are now source-decomposed. This remains a bounded source slice, not a declaration that the whole roadmap's source coverage is closed. Consumer-owned weighted number-field metric normalization remains in EffectiveBoundsCompactModels, not a new GN.0 carrier. A prescribed primitive-intersection basis and a complete rational flag can now be extended compatibly to an integral basis; this is an additional Henk proof-local interface, not a replacement of the built lattice foundations.
- **GN.1 — partial.** Full source coverage of the original GN.1 reading list and source-scoped applications remains open. The upper product inequality is now decomposed using the integral strict-minimum flag, native coordinate/covolume formula, cross-cluster null intersections, row factorization, codimension growth, exact initial and outer volumes, descending-exponent telescoping and the large-box limit. Equal consecutive minima and zero dimension are included; every declaration remains unchecked. No arithmetic metric or integer-vector lower-norm hypothesis is created. The attained-minima API and both product inequalities are planned, but Evertse's Hermite-basis proof (Theorem 2.11), John's ellipsoid theorem and their consequences have only had their statements read. Reconcile the inherited private-plan real-valued gauge/Fin-index API with the NNReal-valued Nat-indexed successiveMin proposed in Mathlib PR #35812 before implementation. The pin remains authoritative; the inspected upstream placeholder was not a supplier of the upper product theorem.
- **GN.2 — partial.** Import field invariants/Witt theory from QuadraticFormInvariants and Hasse–Minkowski/isotropy/representation from GlobalQuadraticForms; rational integral lattice duality/discriminant/gluing is completed IntegralLattices. New work: O_K/Z_p integral lattices, localization, genera/spinor genera, dyadic and quaternionic/hermitian variants, with source-specific restrictions.
- **GN.3 — partial.** AdelicAlgebraicGroups owns quotient/measure and reduction-domain foundations; MetaplecticAutomorphicForms owns theta. GN still needs local representation densities, finite stabilizers, genus classes, weighted mass, local normalization and convergence proofs.
- **GN.4 — partial.** Existing null-frontier asymptotic lattice counting is an import. GN.4 retains Davenport's bounded semialgebraic MULTISET/projection-volume estimate with uniform dimension/multiplicity/complexity dependence (accepted RS-07), plus independent mixing/nondivergence/Oppenheim/Duke branches, packing/covering, transference, star bodies, Mahler compactness and Siegel mean value. Coding Construction A is AlgebraicCodingTheory layer 6; fixed-domain Lipschitz estimates are GlobalNumberFields. Henk Lemma 2.1, inequality (1.3) and Theorem 1.5 are now decomposed through native integral flags, compatible rounding and diagonal-span avoidance. Theorem 1.5 retains d≥2 and the strict factor 2^(d−1). The dimension-one result is the separate non-strict first-minimum estimate. Conjecture 1.4 is not supplied as a theorem. These counting results do not supply the sharp upper Minkowski volume inequality or any quantitative lattice-counting error term.
- **GN.5 — partial.** GN.5 owns generic verified LLL (accepted RS-03): exact Gram–Schmidt/rational comparisons, unimodular update certificates, termination, Lovasz and size reduction, approximation guarantees and original-lattice verification. ED.1/ED.2 own their arithmetic reduction/exclusion applications. No unrestricted exact SVP/CVP follows from LLL.
- **GN.6 — partial.** GN.6 requires an exact category with duality, coherent double dual, forms/isometries, exact-category GW/W, hyperbolic/forgetful maps and higher hermitian K. Degree-zero field Witt/GW belongs to QuadraticFormInvariants. Source-scoped localization/periodicity needs precise invertibility-of-two/regularity assumptions; K.6 only the nonconnective subbranch.

## Exact remaining inputs

1. **Number-field metric comparison and integer-vector norm floor.** Consumer-owned normalization warning (not a request to duplicate it here): the Couveignes extraction routes the weighted/unweighted metric, discriminant normalization and integer-family applications to proposed EffectiveBoundsCompactModels. Couveignes uses twice the complex squared modulus; audited Mathlib mixed-embedding basis (1,i) is unweighted. The consumer must derive the 2^r2 measure factor, not identify unequal covolumes. Nonzero relation-lattice integer vectors have norm≥1; the initial number-field minima instead need the arithmetic norm/product argument. A general lattice does not have the ≥1 floor.

2. **Full GN.1 source coverage and upstream minimum compatibility.** The generic two-sided Minkowski product contract and independent attained witnesses are now supplied as unchecked plans. Remaining source work includes the complete original GN.1 bibliography and source-scoped applications, Evertse Theorem 2.11's Hermite-basis proof, John's ellipsoid theorem and their consequences. Reconcile the inherited real-valued Fin-indexed minimum plan with the inspected upstream NNReal/Nat design before implementation. EffectiveBoundsCompactModels still owns weighted number-field metric/discriminant conversion and arithmetic norm floors; the generic volume theorem does not supply those consumer-specific hypotheses.

3. **GN.2 primary-source and proof decomposition.** Import field invariants/Witt theory from QuadraticFormInvariants and Hasse–Minkowski/isotropy/representation from GlobalQuadraticForms; rational integral lattice duality/discriminant/gluing is completed IntegralLattices. New work: O_K/Z_p integral lattices, localization, genera/spinor genera, dyadic and quaternionic/hermitian variants, with source-specific restrictions.

4. **GN.3 primary-source and proof decomposition.** AdelicAlgebraicGroups owns quotient/measure and reduction-domain foundations; MetaplecticAutomorphicForms owns theta. GN still needs local representation densities, finite stabilizers, genus classes, weighted mass, local normalization and convergence proofs.

5. **GN.4 primary-source and proof decomposition.** Existing null-frontier asymptotic lattice counting is an import. GN.4 retains Davenport's bounded semialgebraic MULTISET/projection-volume estimate with uniform dimension/multiplicity/complexity dependence (accepted RS-07), plus independent mixing/nondivergence/Oppenheim/Duke branches, packing/covering, transference, star bodies, Mahler compactness and Siegel mean value. Coding Construction A is AlgebraicCodingTheory layer 6; fixed-domain Lipschitz estimates are GlobalNumberFields. Henk Lemma 2.1, inequality (1.3) and Theorem 1.5 are now decomposed through native integral flags, compatible rounding and diagonal-span avoidance. Theorem 1.5 retains d≥2 and the strict factor 2^(d−1). The dimension-one result is the separate non-strict first-minimum estimate. Conjecture 1.4 is not supplied as a theorem. These counting results do not supply the sharp upper Minkowski volume inequality or any quantitative lattice-counting error term.

6. **GN.5 primary-source and proof decomposition.** GN.5 owns generic verified LLL (accepted RS-03): exact Gram–Schmidt/rational comparisons, unimodular update certificates, termination, Lovasz and size reduction, approximation guarantees and original-lattice verification. ED.1/ED.2 own their arithmetic reduction/exclusion applications. No unrestricted exact SVP/CVP follows from LLL.

7. **GN.6 primary-source and proof decomposition.** GN.6 requires an exact category with duality, coherent double dual, forms/isometries, exact-category GW/W, hyperbolic/forgetful maps and higher hermitian K. Degree-zero field Witt/GW belongs to QuadraticFormInvariants. Source-scoped localization/periodicity needs precise invertibility-of-two/regularity assumptions; K.6 only the nonconnective subbranch.

8. **Proof execution.** All 77 nodes remain unchecked planning declarations. The suggested file checks signatures and tests only. Six general scratch proofs (gauge transport, cross-cluster null intersection, finite integer-box cardinality, the strict interior-difference gauge bound, integral flag coordinates and the large-box limit) and six concrete statements compile without placeholders or diagnostics. These are selected checks, not an implementation of all fourteen new nodes or the full theorem. Exact rational polygon/box/covolume regressions are finite evidence, not universal proofs. Earlier scratch and regression evidence remains historical and is not claimed rerun.

## Historical validation of the minimum checkpoint

The packet contains 41 nodes: one definition, 29 lemmas and eleven theorems. Its definition has 13 API items and seven discriminating unit tests; counting theorem interfaces as well gives 53 API entries and 64 packet contract tests. The suggested file contains 74 typed examples. All nineteen inherited node objects are preserved exactly.

The suggested file elaborates at the pinned baseline with 115 unproved-statement warnings and no errors or other warnings. The import closure contains 8,482 byte-verified Mathlib modules and no Tau Ceti imports. Explicit signature inspection checks that the full-lattice, discreteness, positive-interior and weight-order hypotheses are retained in the elaborated declarations. All Lean content is confined to the authorized suggested file. Elaboration is a type check, not proof completion.

Exact rational regressions check 80 body/lattice families, 382 rank thresholds, 208 greedy witness selections, 964 strict-flag conditions, 7,552 dilation/sign identities, 80 volume-product identities or inequalities, 64 independently computed planar polygon areas, and seven boundary/counterexample assertions. Additional inverse-image polygon-area checks and integer boundary witnesses test the linear-forms specialization; their counts are in the handoff. These finite checks are not proofs of the general declarations. Packet, source-version, preservation, dependency-graph and four-file intake checks are recorded in the handoff.

## Historical validation of the first-count continuation

All 41 inherited node objects, nine source findings and source-version records are preserved exactly. The five additions give 46 nodes: one definition, 32 lemmas and 13 theorems; 58 API entries, 76 packet contract tests, 86 typed examples, 11 planets and 103 baseline declarations. The existing definition still has 13 API items and seven tests. Eight gaps, no outgoing requests and seven partial stages remain.

The suggested file elaborates with 133 unproved-statement warnings and no errors or other warnings. Its inherited scalar definition now also has only an unproved signature, as required by protocol §13; the unchanged defining API lemma states its mathematical formula. This is not a change to the minimum invariant. The import closure contains 8,482 byte-verified Mathlib sources and no Tau Ceti imports. Four additive declarations are generated by the pinned source’s additive-translation annotation; the packet records their source generators and their compiled additive names, since the static index lists only the generators.

Separate scratch proofs establish the coset-difference injection, the residue-coordinate separation bound, its direct reduction to the native qG index theorem, and the floor-threshold inequality; six arithmetic examples are also proved there without placeholders. These checks do not implement the geometric packet nodes. Exact regressions cover 7,306 finite-group subsets, 19,948 coset fibers, 774 box/lattice families with strict thresholds, 338,586 doubled-box candidate points, 17,280 skew sublattices, 66,448 skew coset fibers and ten boundary assertions. The inherited minimum/volume regressions above were not rerun and remain explicitly historical evidence.

These are historical checks from the first-count checkpoint, not freshly rerun evidence. The stronger Henk count and the analytic Fubini/finite-union auxiliaries are now decomposed above. The sharp upper assembly is now supplied below; these older counts are not rerun evidence.

## Historical validation of the product-count checkpoint

That checkpoint had 56 nodes: one definition, 41 lemmas and fourteen theorems. There are 68 API entries and 96 packet contract tests across all node kinds, 106 suggested examples, twelve planets, 116 baseline declarations, eight gaps and no requests. The single scalar definition retains its thirteen API items and seven tests; the official checker reports those definition-only totals. All seven stages remain partial and every node unchecked.

The complete suggested file elaborates with 163 required unproved-statement warnings and no other diagnostics. All 8,482 reached Mathlib source files byte-match the pin; no Tau Ceti module is imported. Two general scratch statements, one-step divisibility rounding and diagonal-span coordinate membership, and eight concrete flag/index/arithmetic statements compile without placeholders or diagnostics. This is not a complete Lean proof of the integral-flag induction or the geometric theorem.

Exact tests cover 6,400 rounding steps, 8,008 antitone chains, 7,997 strict product comparisons, 9,261 skew/nonprimitive flag families, 37,044 prefix checks, 9,261 diagonal indices, 37,044 skew-coordinate checks, 494 rational box/minima families, 222,190 doubled-body candidates and six boundary rejections. All arithmetic is integer or rational. These are regressions, not universal geometric proofs.

All 46 inherited node objects, 103 baseline entries, nine findings and version records are preserved exactly. The Henk source gains one reading-scope entry; the other source objects are unchanged. Only the four authorized deliverables are submitted. At that checkpoint the finite-union, measurable-section and partial-scaling steps remained open. Those auxiliaries and the lattice-box assembly, telescoping and large-box limit are now decomposed; this paragraph records the previous checkpoint's boundary.

## Historical validation of the convex-section checkpoint

That checkpoint had 63 nodes: one definition, 47 lemmas and fifteen theorems; 75 API entries, 106 packet contract tests, 116 suggested examples, twelve unchanged planets, 132 baseline declarations, six sources, nine findings, eight gaps and no requests. The single definition retains thirteen API items and seven tests, which are the definition-only totals reported by the checker. Every node remains unchecked and every stage partial.

The complete suggested file elaborates with exactly 180 required unproved-statement warnings and no other diagnostics. All 8,482 reached Mathlib source files byte-match the pin; no Tau Ceti module is imported. Six general scratch proofs check convex enlargement, section identity, complementary dilation, its determinant, its Haar image measure and native Tonelli comparison. Six concrete scratch statements also compile, with no placeholders or diagnostics. This is not an implementation of all seven proposed nodes.

Exact rational regressions check 2,250 polygon-union comparisons, 16,650 section-volume inequalities, 36,450 convexity witnesses, 4,500 empty sections, 12,618 exact affine integration slabs, 6,750 codimension-two extrusions, 450 unit dilations, 27 touching-interval families and six boundary rejections. Five convex polygon shapes are tested with shifts, empty or repeated translation families and five dilation factors. These are finite regressions, not proofs of the general geometric statements. Earlier regression counts remain historical and were not rerun.

All 56 inherited node objects, 116 baseline declarations, E1–E9 and their sourceVersions remain exact. The same Henk preprint was freshly read in full as text and p.6 visually; only one read-scope entry is added. There is no publisher-version, new correction-search or new erratum claim. Native product-measure measurability, Tonelli and determinant results are imported, not replanned. The four authorized deliverables alone are submitted.

At that checkpoint, the integral coordinate transport, transverse-row decomposition, consecutive-minimum ratios, telescoping and large-box limit were open. The new section supplies those proof plans, including equal minima and dimension zero. Its selected verification is reported separately below.

## Current verification and remaining boundary

The packet has 77 nodes: one definition, 59 lemmas and seventeen theorems; 89 API entries, 137 packet contract tests, 147 suggested examples, twelve planets, 156 baseline declarations, six sources, nine findings, eight gaps and no requests. The one definition retains thirteen API items and seven tests. Every node remains unchecked and all seven stages remain partial.

The suggested file elaborates with 225 required unproved-statement warnings and no errors or other warnings. All 8,482 reached Mathlib source files byte-match the pin; no Tau Ceti module is imported. Separate scratch files prove six general statements and six examples without placeholders or diagnostics: gauge transport, cross-cluster null intersections, native integer-box cardinality, the strict interior-difference gauge bound, integral flag coordinates and the large-box limit. This is not a complete formal proof of all fourteen new declarations.

Exact rational checks cover 45 anisotropic polygon families; 270 row factorizations and 135 each of initial volumes, consecutive ratios, outer bounds and finite chains; 2,420 exact integration slabs; 4,410 strict-flag vectors and 4,815 cross-row gauge checks. Boxes through dimension five give 56 upper-product families, 840 row factorizations, 620 ratio checks and 220 finite chains, with four explicit zero-dimensional cases. There are 45 repeated-minimum equalities, 90 interval-cluster factorizations and 300 cross-cluster null checks. Tests also cover 1,488 skew/non-unit-covolume transports, 37,200 coordinate/gauge checks, 1,092 weighted telescoping identities, 3,276 volume-chain inequalities, 36 exact box-ratio identities and ten rejected wrong variants. All calculations are rational or integer; these finite regressions do not prove a universal geometric statement or a limit. Earlier verification remains historical.

All 63 inherited statements, hypotheses, proof steps, API items and tests remain exact. Metadata changes are the planet-slot reassignment and two consumer-use status notes on the minimum definition, now pointing to both product bounds. All 132 prior baseline objects, E1–E9 and sourceVersions remain exact. Henk gains one reading-scope entry; the Couveignes note now points to the supplied product-proof chain. Other sources and every non-GN.1 coverage record are unchanged. The native covolume coordinate identity is imported rather than replanned.

Continuation must address the full GN.1 bibliography and the Hermite/John branches, reconcile the minimum API with the inspected upstream design before implementation, and develop the precisely owned GN.2–GN.6 gaps. Generic two-sided product bounds now have plans; arithmetic normalization, transference, quantitative counting and certified reduction are not silently supplied. Final packet, errata, preservation, intake and fresh-main guard results are recorded in the handoff.


## Stage target inventory for this pass

### GeometryOfNumbersAndQuadraticArithmetic:GN.0 — planned

**Discrete real lattices, fundamental domains, covolumes and absolute-determinant changes.** `GeometryOfNumbersAndQuadraticArithmetic:GN.0/gram-det-orthonormal-coordinates`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-square-gram`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/gram-det-adapted-projection`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/gram-det-biorthogonal`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-projection`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-dual`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/primitive-orthogonal-covolume`. Imports: `mathlib:ZLattice.covolume`, `mathlib:ZLattice.covolume_eq_det_mul_measureReal`, `mathlib:ZSpan.isAddFundamentalDomain'`.

**Complex embeddings and number-field factors.** `GeometryOfNumbersAndQuadraticArithmetic:GN.0/mixed-embedding-normalization`.

Remaining refinement: Canonical lattice/fundamental-domain/covolume foundations are existing library imports. Refine the inherited primitive-orthogonal/Gram adapters and reconcile arbitrary consumer weighted embedding coordinates with their own determinant and norm contracts.

### GeometryOfNumbersAndQuadraticArithmetic:GN.1 — planned

**Blichfeldt and first Minkowski with boundary conventions.** `GeometryOfNumbersAndQuadraticArithmetic:GN.1/blichfeldt-native-interface`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-first-native-interface`.

**Both sharp second Minkowski inequalities and attained witnesses.** `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-lower`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`.

**Ideal-class and unit applications through existing owners.** `GeometryOfNumbersAndQuadraticArithmetic:GN.1/ideal-class-application-import`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/unit-application-import`.

Remaining refinement: Resolve the inherited Fin/real-valued minima prototype with the Nat/NNReal upstream proposal before implementation. Full source proofs of Evertse Hermite-basis and John ellipsoid refinements are not read; they do not replace either planned sharp product inequality.

### GeometryOfNumbersAndQuadraticArithmetic:GN.2 — planned

**Field Witt/discriminant/Clifford/Hasse classification, real/dyadic places and Hasse–Minkowski.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-genus`. Imports: `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-6-forms-over-a-nonarchimedean-local-field`, `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-6-representation-and-isometry`.

**Integral lattices, localization, genus and proper spinor genus.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-quadratic-lattice`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-localization`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-intersection-localizations`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/completed-lattice-descent`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-genus`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/proper-spinor-genus`.

**Dyadic, hermitian and quaternionic variants.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-dual-lattice`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-lattice-invariants`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/dyadic-atomic-form`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-normalized-form`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/quaternionic-integral-hermitian-data`.

Remaining refinement: Read and split the original dyadic normalization algorithm, proper spinor-genus/classification and quaternionic integral classification sources. Build native localization/completion and nonfree Dedekind-module adapters; field classification and ordinary integral Z-lattice foundations remain imported.

### GeometryOfNumbersAndQuadraticArithmetic:GN.3 — planned

**Arithmetic quotients and reduction domains.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3/definite-genus-class-finite`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/adelic-mass-identity`. Imports: `AdelicAlgebraicGroups:AA.2`, `AdelicAlgebraicGroups:AA.3`.

**Local representation densities and their normalization.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3/hermitian-representation-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/hermitian-embedding-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/finite-hermitian-isometry-formula`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/normalized-hermitian-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/hermitian-local-density`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/normalized-siegel-polynomial`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/cho-yamauchi-weight`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/cho-yamauchi-overlattice-formula`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/siegel-polynomial-functional-equation`.

**Finite stabilizers, weighted mass and a source-scoped mass formula.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3/definite-integral-isometry-finite`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/genus-mass`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/adelic-mass-identity`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/maximal-integral-mass-formula`.

**Theta coefficient interface.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3/theta-lattice-coefficient-interface`. Imports: `MetaplecticAutomorphicForms:MP.5`.

Remaining refinement: Read original Hironaka, Kitaoka, Cho–Yamauchi/Gan–Yu density inputs and the original Shimura/Gan–Hanke–Yu maximal mass proof. Refine smoothness, residue-cardinality normalization, class finiteness, local factor tables, convergence and archimedean constants; do not substitute the hermitian density polynomial for an orthogonal mass factor.

### GeometryOfNumbersAndQuadraticArithmetic:GN.4 — planned

**Lattice-point estimates, uniform semialgebraic multiset error and Henk counting.** `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/henk-sublattice-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/henk-successive-minima-count`.

**Mixing, ergodicity, unipotent recurrence, closure, measure and time averages.** `GeometryOfNumbersAndQuadraticArithmetic:GN.4/howe-moore-mixing`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/homogeneous-ergodicity`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/unipotent-nondivergence`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-orbit-closure`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-measure-classification`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-unipotent-equidistribution`.

**Oppenheim and Duke applications with actual hypotheses.** `GeometryOfNumbersAndQuadraticArithmetic:GN.4/oppenheim-values`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/duke-spherical-equidistribution`.

**Packing, covering, nonconvex star bodies and reciprocal transference.** `GeometryOfNumbersAndQuadraticArithmetic:GN.4/packing-radius`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/covering-radius`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/compact-star-body`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/dual-transference-lower`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/dual-transference-upper`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/covering-dual-transference`.

**Mahler compactness and integrable Siegel mean value.** `GeometryOfNumbersAndQuadraticArithmetic:GN.4/mahler-compactness`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/siegel-mean-value`.

**Coding-lattice real metric and covolume adapter.** `GeometryOfNumbersAndQuadraticArithmetic:GN.4/construction-a-real-lattice-interface`. Imports: `tauceti:TauCetiRoadmap/AlgebraicCodingTheory#layer-6-construction-a-with-exact-hypotheses`.

Remaining refinement: Acquire original Davenport/corrigendum/Rogers, Howe–Moore, Dani–Margulis, Ratner, Duke and Siegel proof inputs. Refine Gaussian upper transference, homogeneous quotient/L² interfaces, nonescape/time-average selection, star-body critical-lattice problems and coding metric adapters. No quantitative Oppenheim/Duke error bound or arbitrary-body n transference constant is asserted.

### GeometryOfNumbersAndQuadraticArithmetic:GN.5 — planned

**Exact Gram–Schmidt/LLL reduction with integer change-of-basis certificates.** `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-coefficient`, `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-reduced`, `GeometryOfNumbersAndQuadraticArithmetic:GN.5/unimodular-basis-certificate`, `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-integer-potential`, `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-exact-reduction`.

**Proved factor and verification in the original lattice.** `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-gram-schmidt-growth`, `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-short-vector-factor`, `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-original-lattice-verification`.

**Height/count/local representation handoff to arithmetic consumers.** `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-original-lattice-verification`, `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-exact-reduction`.

Remaining refinement: Split exact nearest-integer/Gram–Schmidt update, prefix-potential and termination transitions. The 1982 complexity proof beyond the beginning of Proposition 1.26 was not read, so no bit-complexity endpoint is supplied. Arithmetic heights, exclusion and local representation algorithms remain their consumers’ work using the exported certificate and factor.

### GeometryOfNumbersAndQuadraticArithmetic:GN.6 — planned

**Strong exact duality, symmetric/alternating spaces and exact Lagrangians.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/strong-category-duality`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-category-duality`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/symmetric-space`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-lagrangian`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hyperbolic-space`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/isotropic-reduction`.

**Exact GW/W presentations and forgetful/hyperbolic comparisons.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-grothendieck-witt-group`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-witt-group`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hyperbolic-forgetful-relations`.

**Higher hermitian fibre spaces and component comparison.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-q-construction`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/grothendieck-witt-space`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/higher-grothendieck-witt-groups`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/grothendieck-witt-space-components`.

**Exact filtering and symmetric Dedekind localization with residue shifts.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/schlichting-filtering-localization`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-residue-duality-line`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-symmetric-localization`.

**Source-scoped shifted periodicity and number-ring comparisons.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/shifted-karoubi-periodicity`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/number-ring-homotopy-limit`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/number-ring-invert-two-comparison`.

**Selected full nonconnective hermitian branch.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-suspension`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-suspension-delooping`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/nonconnective-hermitian-spectrum`. Imports: `GeneralAlgebraicKTheory:K.6`.

Remaining refinement: Refine exact-conflation/opposite/quotient adapters, formations, cofinality and the cone setup; import genuine nerve realization, pointed homotopy groups and spectra. Classical dg Bott periodicity requires unique 2-divisibility; symmetric Dedekind devissage is not quadratic dyadic devissage. The new stable Poincaré framework belongs to HermitianKTheoryOfPoincareCategories, whose precise stage/node interfaces remain to be designed. Calmes integer tables and quadratic/skew variants require separate source-scoped refinement rather than an unqualified ordinary-K or cyclic-group substitution.

## Additional declaration contracts

### GN.0

#### Mixed embedding covolume normalization

`GeometryOfNumbersAndQuadraticArithmetic:GN.0/mixed-embedding-normalization` — comparison.

For a number field K and an invertible fractional O_K-ideal I, use the existing mixed real/complex embedding and its real Haar measure. Its lattice covolume is absNorm(I)·2^(−r₂)·√|disc K|, and its real ambient dimension is [K:Q]. A complex coordinate contributes two real dimensions; replacing the metric or embedding coordinates requires the actual real determinant factor.

**Hypotheses and conventions.** The displayed formula uses the native mixed embedding, not a freely chosen weighted arithmetic metric.

**Construction or proof.** 1. Import the two pinned declarations without re-planning the embedding or ideal-lattice carrier. 2. When a consumer chooses a weighted metric, apply the native absolute-real-determinant covolume formula to that specific map.

**Prerequisites.** `mathlib:NumberField.mixedEmbedding.finrank`, `mathlib:NumberField.mixedEmbedding.covolume_idealLattice`, `mathlib:ZLattice.covolume_eq_det_mul_measureReal`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.mixed_embedding_normalization_test_1`: The complex-place factor is 2^(-r₂), not 2^(r₂).
- `TauCeti.GeometryOfNumbersPlan.mixed_embedding_normalization_test_2`: Real dimension is r₁+2r₂, not r₁+r₂.

**Source.** MathlibPin, CanonicalEmbedding/Basic.lean:213 and Discriminant/Basic.lean:134. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Consumer weighted arithmetic metric adapter: EffectiveBoundsCompactModels owns its chosen coefficient metric; a complete named weighted-number-field embedding comparison must specify the exact determinant and the lower norm estimate in that consumer. This packet supplies only the canonical mixed-embedding normalization, not a new consumer metric.

### GN.1

#### Blichfeldt native interface

`GeometryOfNumbersAndQuadraticArithmetic:GN.1/blichfeldt-native-interface` — comparison.

Under the pinned countable additive action, invariant measure and actual fundamental-domain hypotheses, a null-measurable S with μ(F)<μ(S) has two distinct lattice translates that intersect. For a subgroup acting by translations this gives distinct points of S whose difference is a nonzero lattice element.

**Hypotheses and conventions.** Retain null measurability and the additive fundamental-domain hypothesis; no full-rank lattice is inferred from a bare subgroup.

**Construction or proof.** 1. Call the existing Blichfeldt declaration. 2. Unpack an intersection point and subtract the two subgroup translations.

**Prerequisites.** `mathlib:MeasureTheory.exists_pair_mem_lattice_not_disjoint_vadd`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.blichfeldt_native_interface_test_1`: The strict volume comparison is retained.
- `TauCeti.GeometryOfNumbersPlan.blichfeldt_native_interface_test_2`: Two distinct lattice translations produce a nonzero difference.

**Source.** MathlibPin, MeasureTheory/Group/GeometryOfNumbers.lean:52. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Minkowski first theorem boundary interface

`GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-first-native-interface` — comparison.

For a countable additive lattice subgroup L of a finite-dimensional real normed space, a convex symmetric set S with μ(F)·2^dim<μ(S) contains a nonzero lattice point. For a compact S and discrete L, in a nontrivial ambient space, the non-strict ≥ threshold suffices. Dimension zero does not satisfy the compact theorem’s nontrivial-space hypothesis.

**Hypotheses and conventions.** Use the native Haar measure and actual additive fundamental domain.

**Construction or proof.** 1. Import the strict theorem. 2. For the equality-boundary variant import the compact/discrete theorem with its additional nontrivial ambient hypothesis.

**Prerequisites.** `mathlib:MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`, `mathlib:MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.minkowski_first_native_interface_test_1`: For Z in R and S=[−1,1], the non-strict theorem finds ±1.
- `TauCeti.GeometryOfNumbersPlan.minkowski_first_native_interface_test_2`: The open interval (−1,1) at equality cannot use the compact variant.
- `TauCeti.GeometryOfNumbersPlan.minkowski_first_native_interface_test_3`: No nonzero vector is asserted in zero dimension.

**Source.** MathlibPin, MeasureTheory/Group/GeometryOfNumbers.lean:65,91. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Bounded ideal-class representatives

`GeometryOfNumbersAndQuadraticArithmetic:GN.1/ideal-class-application-import` — comparison.

For a number field K of degree d, every ideal class of O_K has a nonzero integral representative I with N(I)≤(4/π)^r₂·d!/d^d·√|disc K|. The ideal class group is already finite in Mathlib. Geometry supplies this bound; no new class-group carrier is planned here.

**Hypotheses and conventions.** Full ring of integers and its native class group; orders with noninvertible proper ideals are a separate GlobalNumberFields problem.

**Construction or proof.** 1. Import the existing finite class-group instance and bounded-representative theorem. 2. Check that the native mixed-embedding covolume and r₂ factor are the ones used by the imported theorem.

**Prerequisites.** `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`, `mathlib:NumberField.exists_ideal_in_class_of_norm_le`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/mixed-embedding-normalization`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.ideal_class_application_import_test_1`: The representative is nonzero integral, not an arbitrary fractional-ideal placeholder.
- `TauCeti.GeometryOfNumbersPlan.ideal_class_application_import_test_2`: The factor d!/d^d and complex-place factor are retained.

**Source.** MathlibPin, NumberTheory/NumberField/ClassNumber.lean:59,77. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Dirichlet unit rank import

`GeometryOfNumbersAndQuadraticArithmetic:GN.1/unit-application-import` — comparison.

The native quotient of O_K^× by its torsion subgroup is a finitely generated free abelian group of rank r₁+r₂−1; use the existing NumberField.Units Dirichlet API, not a new logarithmic unit lattice carrier.

**Hypotheses and conventions.** Use the native NumberField.Units.rank and torsion subgroup.

**Construction or proof.** 1. Import finrank_modTorsion with its existing logEmbedding/unitLattice proof and native module instances. 2. Keep the arithmetic regulator and ray-unit fundamental domains with their number-field owners.

**Prerequisites.** `mathlib:NumberField.Units.finrank_modTorsion`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.unit_application_import_test_1`: For Q the unit rank is zero.
- `TauCeti.GeometryOfNumbersPlan.unit_application_import_test_2`: A complex place contributes one logarithmic unit coordinate even though it contributes two real embedding dimensions.

**Source.** MathlibPin, NumberTheory/NumberField/Units/DirichletTheorem.lean:457. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

### GN.2

#### Integral quadratic lattices over a Dedekind domain

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-quadratic-lattice` — definition.

For a Dedekind domain R with fraction field K, a finite-dimensional K-space V and native q:V→K quadratic, an integral quadratic lattice is L:Submodule R V with Submodule.IsLattice K L and q(L)⊆R. Nondegeneracy of q and unimodularity of its integral polar pairing are separate predicates. There is no global free-basis field.

**Hypotheses and conventions.** K has characteristic different from 2 for the field-classification interface; the native integral quadratic-map definition itself does not require 2 to be a unit in R. The embedding R→K and scalar tower are fixed. Invariant-factor and genus work uses a nondegenerate generic fibre.

**Construction or proof.** 1. Bundle the existing submodule and IsLattice certificate with the existing QuadraticForm and the exact image-in-R condition. 2. Restrict q to L using injectivity of R→K; obtain a native R-valued QuadraticMap. 3. Compare the rational symmetric bilinear carrier with completed IntegralLattices only under its stated integrality/evenness convention; do not replace q by half a bilinear diagonal over a dyadic ring.

**Prerequisites.** `mathlib:Submodule.IsLattice`, `mathlib:QuadraticMap`, `mathlib:QuadraticForm`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.ofCarrier` (constructor): Bundle a native full finite submodule and q with q(L)⊆R.
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.carrier` (projection): Return the original R-submodule, preserving its IsLattice instance.
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.quadraticMap` (compatibility): The restricted native R-quadratic map extends back to q on the K-span.
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.ext` (extensionality): For fixed q, equal carriers yield equal bundled integral-lattice data.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.integral_quadratic_lattice_test_1`: R=Z, K=Q, L=Z and q(x)=x² give an integral lattice whose polar pairing is 2xy and is not unimodular.
- `TauCeti.GeometryOfNumbersPlan.integral_quadratic_lattice_test_2`: The integral symmetric pairing B(x,y)=xy on Z does not make q(x)=B(x,x)/2 integral.
- `TauCeti.GeometryOfNumbersPlan.integral_quadratic_lattice_test_3`: A nonprincipal fractional ideal is allowed as an R-lattice; no constructor asks for an R-basis.

**Source.** Voight2026, §9.3 Definition 9.3.1 and §9.7 Definitions 9.7.1–9.7.8, printed pp.137,144–145. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Localization of an integral quadratic lattice

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-localization` — construction.

For a nonzero prime p of R, extend L to L_(p)=L⊗R R_(p), viewed as the span of L in the same K-space; extend its quadratic map and coefficient line by scalar change. Integral values and full finite generation are preserved.

**Hypotheses and conventions.** Use localization R_(p), not completion R_p; the latter changes the ambient field. No global freeness is assumed.

**Construction or proof.** 1. Construct scalar extension with the existing localization/tensor API. 2. Identify the tensor with its image in V by torsion-freeness and flat localization. 3. Clear denominators in a finite generating family to establish the native lattice and integrality properties. The exact tensor-image adapter is a recorded proof input.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-quadratic-lattice`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.localize` (constructor): Return the R_(p)-lattice and restricted quadratic form.
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.localize_mem_iff` (characterisation): x lies in L_(p) iff s x lies in L for some s∈R\p.
- `TauCeti.GeometryOfNumbersPlan.IntegralQuadraticLattice.localize_map` (functoriality): An integral isometry localizes, preserving identity and composition.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.lattice_localization_test_1`: Z_(2) contains 1/3 and excludes 1/2; this is not Z₂.
- `TauCeti.GeometryOfNumbersPlan.lattice_localization_test_2`: Localizing a nonprincipal coefficient ideal makes it principal at a nonzero prime of a Dedekind domain.
- `TauCeti.GeometryOfNumbersPlan.lattice_localization_test_3`: Localizing the zero-dimensional lattice still gives the zero-dimensional lattice.

**Source.** Voight2026, §9.4, (9.4.1)–(9.4.5), printed pp.139–140. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Localization image adapter: Identify L⊗R R_(p) with its span in V, prove injectivity, and produce exact local integral quadratic-map instances without imposing global freeness. Existing localization/tensor notions are imported, not re-planned.

#### Recover a lattice from its localizations

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-intersection-localizations` — theorem.

For full R-lattices L,M in a fixed K-space, L=⋂p L_(p), and L⊆M iff L_(p)⊆M_(p) for every maximal ideal p. Consequently equality of localized submodules detects equality of global submodules.

**Hypotheses and conventions.** R is a Dedekind domain; intersections are in the fixed K-space. This detects embedded submodule equality, not the existence of a compatible family of integral isometries.

**Construction or proof.** 1. For x in every localization let a={r∈R:r x∈L}. Clear a denominator using fullness to show a is nonzero. 2. Membership in each localization supplies an element of a outside each maximal ideal; hence a=R and x∈L. 3. Apply the intersection equality to both lattices for the inclusion criterion.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-localization`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.lattice_intersection_localizations_test_1`: 2Z and Z differ at the prime 2, though their Q-spans coincide.
- `TauCeti.GeometryOfNumbersPlan.lattice_intersection_localizations_test_2`: For equal embedded localizations the conclusion is L=M; independent local isometries do not supply a single global integral isometry.

**Source.** Voight2026, Lemma 9.4.6 and Corollary 9.4.7, printed p.140. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Descent of a lattice from a DVR completion

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/completed-lattice-descent` — theorem.

If R is a DVR with fraction field K and completion R̂ with fraction field K̂, extension L↦L⊗R R̂ and intersection N↦N∩V are inverse bijections between full R-lattices in finite-dimensional V and full R̂-lattices in V⊗K K̂.

**Hypotheses and conventions.** Intersection uses the canonical injection V→V⊗K K̂. Finite-generation and torsion-free hypotheses are retained; a torsion R-module is not declared free.

**Construction or proof.** 1. Choose a basis for the torsion-free finite R-lattice; R̂∩K=R identifies the intersection after extension. 2. For a completed lattice, sandwich it between r times and r inverse times a reference free lattice, with r∈R chosen to match valuation. 3. Use the finite quotient comparison modulo r to lift representatives, proving the reverse inclusion after extension. 4. The residue-quotient and completion embedding comparisons are recorded inputs, not silently new definitions.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-localization`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.completed_lattice_descent_test_1`: The descent of 2Z₂⊂Q₂ is 2Z_(2)⊂Q, not 2Z as a global lattice.
- `TauCeti.GeometryOfNumbersPlan.completed_lattice_descent_test_2`: The finite quotient comparison R/p^e≅R̂/p^e for e≥1 is essential to lifting completed generators.

**Source.** Voight2026, §9.5 (9.5.1)–(9.5.4), Lemma 9.5.3 and full proof, printed pp.142–143. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Completion and finite-quotient adapters: Supply the exact injections, scalar-extension embeddings and R/p^e→R̂/p^e isomorphism for the imported adic/local-field substrate; the source proof is read, but these adapters have not been matched to declarations at the pin.

#### Integral genus inside a rational quadratic space

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-genus` — definition.

Within a fixed nondegenerate quadratic K-space (V,q), two integral R-lattices belong to the same genus when their completed lattices are isometric under O(q_v)(K_v) at every nonzero prime v. If quadratic spaces themselves vary, also require the archimedean signature data and the rational-space identification from GlobalQuadraticForms. Genus classes are integral isometry classes inside this equivalence class.

**Hypotheses and conventions.** R is the ring of integers of a number field, or a specified localization with exactly its retained places. Genus, rational isometry and global integral isometry have separate types and separate quotient relations.

**Construction or proof.** 1. Use completed-lattice scalar change and the imported local orthogonal groups. 2. Prove reflexivity, symmetry and transitivity by composing local isometries. 3. Take the setoid quotient by global integral isometry inside the genus; do not quotient by unrelated local choices.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-quadratic-lattice`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/completed-lattice-descent`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-6-forms-over-a-nonarchimedean-local-field`, `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-6-representation-and-isometry`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.IntegralGenus.localIsometry` (data): A local isometry at each retained finite place, with archimedean data when spaces vary.
- `TauCeti.GeometryOfNumbersPlan.IntegralGenus.equivalence` (structure): The genus relation is an equivalence relation.
- `TauCeti.GeometryOfNumbersPlan.IntegralGenus.ofIntegralIsometry` (compatibility): A global integral isometry determines a genus relation.
- `TauCeti.GeometryOfNumbersPlan.IntegralGenus.classSet` (constructor): Integral-isometry classes of lattices in the fixed genus.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.integral_genus_test_1`: In fixed (Q,x²), Z and 2Z are rationally in the same ambient space but not in one integral genus.
- `TauCeti.GeometryOfNumbersPlan.integral_genus_test_2`: A global integral isometry yields local isometries at every place.
- `TauCeti.GeometryOfNumbersPlan.integral_genus_test_3`: Opposite real signatures cannot be identified when ambient spaces vary.

**Source.** Voight2026, Definition 9.7.13, printed p.146; completion comparison §9.5. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Proper spinor genus

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/proper-spinor-genus` — definition.

For nondegenerate q in characteristic different from 2, proper spinor genus is the orbit of an integral lattice under SO(q)(K) times the image of Spin(q)(A_f)→SO(q)(A_f), acting on its finite adelic completion. Proper genus uses SO instead of O. Their forgetful maps to ordinary genus are separate.

**Hypotheses and conventions.** Use the actual local-field image of the spin covering; no blanket surjectivity on local rational points. Dyadic spinor-norm images and signatures are supplied by their owners or left as precise gaps.

**Construction or proof.** 1. Import the spin covering and spinor norm from SpinRepresentations; import finite adeles from AdelicAlgebraicGroups. 2. Define the orbit relation from those actual groups and prove equivalence by group laws. 3. The spin image is contained in SO, so construct maps to proper genus and ordinary genus. 4. The adelic/local integral stabilizer and spinor-norm comparison proof is still a recorded input.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-genus`, `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-2-the-pin-and-spin-groups-and-the-double-covers`, `AdelicAlgebraicGroups:AA.1`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.ProperSpinorGenus.orbit` (constructor): Use global SO and the finite adelic spin image.
- `TauCeti.GeometryOfNumbersPlan.ProperSpinorGenus.equivalence` (structure): Orbit relation is reflexive, symmetric and transitive.
- `TauCeti.GeometryOfNumbersPlan.ProperSpinorGenus.toGenus` (compatibility): Forget orientation and the spin-image restriction.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.proper_spinor_genus_test_1`: At a place where a nontrivial spinor-norm class occurs, an SO-point with that norm cannot be inserted into the spin image merely by asserting surjectivity.
- `TauCeti.GeometryOfNumbersPlan.proper_spinor_genus_test_2`: A proper spinor-genus relation implies genus; the converse is not an API lemma.
- `TauCeti.GeometryOfNumbersPlan.proper_spinor_genus_test_3`: For rank one the proper orthogonal group is trivial; no higher-rank spin-image claim is inferred from that case.

**Source.** Voight2026, §9.7 genus convention; worker extension to the spin-cover target, with missing source classification stated explicitly. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Spinor-genus source and adelic image comparison: Acquire the exact O’Meara/spinor-genus passage and prove the integral adelic stabilizer comparison and dyadic spinor-norm images. The orbit definition is a worker specification of the staged target; no spinor-genus classification proof has been read or supplied.

#### Integral hermitian lattices

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice` — definition.

Let K be a field with involution, R⊂K a stable integral subring and V a finite K-space. A hermitian integral lattice consists of native L:Submodule R V, Submodule.IsLattice K L and a native sesquilinear H, conjugate-linear in its first argument and linear in its second, with H(y,x)=star H(x,y) and H(L,L)⊆R. Generic nondegeneracy is distinct from integral self-duality.

**Hypotheses and conventions.** Commutative K/R in this declaration; the quaternionic right-module variant is a separate target. For Li–Zhang density the extension is unramified quadratic F/F₀ and F₀ has characteristic different from 2; dyadic residue fields are allowed in §3 except its explicitly geometric branch.

**Construction or proof.** 1. Reuse Submodule.IsLattice and the pinned star-sesquilinear form rather than introducing a new bilinear carrier. 2. Bundle the actual symmetry and integral image conditions. 3. Transport along a K-linear isometry carrying the R-lattice onto the target; retain the coefficient involution.

**Prerequisites.** `mathlib:Submodule.IsLattice`, `mathlib:LinearMap.IsSymm`, `mathlib:LinearMap.Nondegenerate`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.IntegralHermitianLattice.ofCarrier` (constructor): Bundle the existing full finite submodule and actual integral star-sesquilinear form.
- `TauCeti.GeometryOfNumbersPlan.IntegralHermitianLattice.carrier` (projection): The native R-submodule, with its IsLattice certificate.
- `TauCeti.GeometryOfNumbersPlan.IntegralHermitianLattice.ext` (extensionality): For fixed H, equality of native carriers identifies bundled lattice data.
- `TauCeti.GeometryOfNumbersPlan.IntegralHermitianLattice.map` (functoriality): Transport along a hermitian isometry; identity and composition laws.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.integral_hermitian_lattice_test_1`: For rank one over an unramified quadratic extension, H(x,y)=star(x)y on O_F is integral and self-dual.
- `TauCeti.GeometryOfNumbersPlan.integral_hermitian_lattice_test_2`: Replacing conjugate transpose by ordinary transpose on the complex vector (i) changes its Gram value from 1 to −1.
- `TauCeti.GeometryOfNumbersPlan.integral_hermitian_lattice_test_3`: An integral hermitian lattice with nonunit Gram determinant is nondegenerate over F but not self-dual over O_F.

**Source.** LiZhangDensity, §1.7, physical p.8; §3 hypotheses, physical p.15. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Hermitian dual lattice

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-dual-lattice` — construction.

For a nondegenerate integral hermitian lattice L in V, define L∨={x∈V : H(x,L)⊆R}; under the stable involution this equals the right-dual condition H(L,x)⊆R. This is a full finite R-lattice over a Dedekind domain; integrality is equivalent to L⊆L∨. Self-duality means equality, not just equality of generic spans.

**Hypotheses and conventions.** R is Dedekind and stable under the involution; H is nondegenerate on the generic fibre. No finiteness of residue fields is needed until cardinalities are used.

**Construction or proof.** 1. Show the defining set is an R-submodule using sesquilinearity and stability of R under star. 2. Use a local free basis to express the dual by the inverse hermitian Gram matrix; descend the finite lattice property. 3. Use symmetry to compare the two pairing directions and prove the inclusion characterization. 4. Local inverse-Gram and descent adapters remain explicit proof gaps.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/completed-lattice-descent`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.IntegralHermitianLattice.dual` (constructor): The native submodule defined by integral pairings.
- `TauCeti.GeometryOfNumbersPlan.IntegralHermitianLattice.mem_dual_iff` (characterisation): Membership is equivalent to all pairings with L lying in R.
- `TauCeti.GeometryOfNumbersPlan.IntegralHermitianLattice.dual_dual` (relation): The double dual equals L under the stated Dedekind/nondegeneracy hypotheses.
- `TauCeti.GeometryOfNumbersPlan.IntegralHermitianLattice.integral_iff_le_dual` (characterisation): Integrality is exactly L⊆L∨.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.hermitian_dual_lattice_test_1`: For rank-one Gram π^a over an unramified extension, the dual of O_F e is π^−a O_F e.
- `TauCeti.GeometryOfNumbersPlan.hermitian_dual_lattice_test_2`: The Gram-1 lattice is self-dual; Gram-π lattice is integral but not self-dual.
- `TauCeti.GeometryOfNumbersPlan.hermitian_dual_lattice_test_3`: The zero-dimensional lattice equals its dual and has zero discriminant length.

**Source.** LiZhangDensity, §1.7, physical pp.8–9. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Hermitian inverse-Gram and scalar-change proof: Prove the local full finite inverse-Gram description, dual localization/completion compatibility and double-dual descent. Completed rational symmetric duality is imported only for its matching specialization, not asserted to provide all star-hermitian Dedekind adapters.

#### Fundamental invariants of a local hermitian lattice

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-lattice-invariants` — construction.

For an integral nondegenerate O_F-hermitian lattice L of rank n over a DVR, attach the unique ordered a₁≤…≤a_n with a_i≥0 and L∨/L≅⊕O_F/π^{a_i}; define val(L)=Σa_i and t(L)=#{i:a_i>0}. Vertex means a_i∈{0,1}; self-dual means all a_i=0.

**Hypotheses and conventions.** The quotient is measured by O_F-length; q is the size of the residue field of F₀ when F/F₀ is unramified quadratic. A_i=0 contributes the zero summand; n=0 has length/type 0.

**Construction or proof.** 1. Apply imported Smith normal form locally to the inclusion L→L∨; do not plan Smith normal form again. 2. Read off ordered exponents and prove independence of chosen bases and uniformizer. 3. Define valuation and type by finite sums/counts; identify vertex and self-dual cases.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-dual-lattice`, `mathlib:Submodule.exists_smith_normal_form_of_le`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.HermitianLatticeInvariants.ofDualQuotient` (constructor): The ordered DVR elementary-divisor exponents.
- `TauCeti.GeometryOfNumbersPlan.HermitianLatticeInvariants.valuation` (data): Sum of the exponents, equal to O_F-length.
- `TauCeti.GeometryOfNumbersPlan.HermitianLatticeInvariants.type` (data): Number of positive exponents.
- `TauCeti.GeometryOfNumbersPlan.HermitianLatticeInvariants.selfDual_iff` (characterisation): Self-duality iff valuation is zero.
- `TauCeti.GeometryOfNumbersPlan.HermitianLatticeInvariants.vertex_iff` (characterisation): Vertex iff every exponent is 0 or 1.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.hermitian_lattice_invariants_test_1`: Rank one with Gram π³ has val=3 and type=1; it is not a vertex lattice.
- `TauCeti.GeometryOfNumbersPlan.hermitian_lattice_invariants_test_2`: Invariants (0,1,1) give val=2, type=2 and a vertex lattice.
- `TauCeti.GeometryOfNumbersPlan.hermitian_lattice_invariants_test_3`: The cardinality of L∨/L is q^{2 val(L)} in an unramified quadratic extension, not q^{val(L)}.

**Source.** LiZhangDensity, §1.7, physical p.8. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Quaternionic integral hermitian lattices

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/quaternionic-integral-hermitian-data` — construction.

For a quaternion algebra B over a characteristic-not-two number field K, a fixed star-stable R-order O⊂B, a finite right B-module V and nondegenerate hermitian H:V×V→B satisfying H(xa,yb)=star(a)H(x,y)b, specify a full finite R-lattice L stable under right O with H(L,L)⊆O. The integral-isometry and local-genus data retain O, its involution and the hermitian sign.

**Hypotheses and conventions.** The quaternion algebra and standard involution are imported. The centre lattice is finite projective over Dedekind R; global right O-freeness is not assumed. This is a quaternionic right-module interface, not a commutative star-linear form with B incorrectly treated as a commutative field.

**Construction or proof.** 1. Import B and its standard involution and reuse the native full finite R-submodule. 2. Add actual right O-stability and the noncommutative sesquilinear pairing conditions. 3. Localize the order, lattice and pairing together and compare only within those fixed local orders. The order/module localization and source-specific quaternionic classification remain named gaps.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-quadratic-lattice`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.QuaternionicIntegralHermitianLattice.ofOrderStableCarrier` (constructor): The actual O-stable native R-lattice and quaternionic pairing.
- `TauCeti.GeometryOfNumbersPlan.QuaternionicIntegralHermitianLattice.order` (projection): Retain the coefficient order and its involution.
- `TauCeti.GeometryOfNumbersPlan.QuaternionicIntegralHermitianLattice.localize` (functoriality): Localize order, lattice and pairing simultaneously.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.quaternionic_integral_hermitian_data_test_1`: For a star-stable quaternion order O, H(x,y)=star(x)y on O satisfies the integral pairing condition.
- `TauCeti.GeometryOfNumbersPlan.quaternionic_integral_hermitian_data_test_2`: Taking reduced trace of H(1,1)=1 gives 2, so reduced-trace metric normalization is a separate comparison.
- `TauCeti.GeometryOfNumbersPlan.quaternionic_integral_hermitian_data_test_3`: Changing the order changes the integral-isometry problem even when the ambient quaternion algebra is unchanged.

**Source.** Voight2026, §9.3–9.7 full lattice and quadratic-module conventions; worker extension to the staged quaternionic hermitian target. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Quaternionic integral module and classification source: Acquire the exact quaternionic/hermitian local-lattice passages, including the routed Kurinczuk–Skodlerack–Stevens source restrictions. Prove order-module scalar change and noncommutative duality; do not infer them from commutative unramified hermitian density formulas.

#### Atomic integral quadratic forms over a local PID

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/dyadic-atomic-form` — definition.

Over a local PID R with valuation v and uniformizer π, an atomic quadratic form is either ⟨a⟩ with a a unit, or, when 2 is not a unit, a binary [a,b,c] satisfying v(b)<v(2a)≤v(2c) and v(a)v(b)=0. These are integral quadratic maps; the polar pairing is not divided by two.

**Hypotheses and conventions.** Valuation may take infinity for zero; the stated strict inequality excludes the unwanted zero terms. Field cases use the source’s trivial-valuation convention separately.

**Construction or proof.** 1. Use the native rank-one/rank-two quadratic map, with actual local-ring valuation conditions. 2. Record the two alternatives and transport them along integral isometry. 3. Keep the binary dyadic alternative distinct from field diagonalization.

**Prerequisites.** `mathlib:QuadraticMap`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.IsAtomicIntegralQuadraticForm` (constructor): The exact unary or dyadic binary valuation predicate.
- `TauCeti.GeometryOfNumbersPlan.IsAtomicIntegralQuadraticForm.unary` (characterisation): Unary atomic forms have unit coefficient.
- `TauCeti.GeometryOfNumbersPlan.IsAtomicIntegralQuadraticForm.binary` (characterisation): The binary alternative includes 2 nonunit and all valuation inequalities.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.dyadic_atomic_form_test_1`: Over Z₂ the hyperbolic quadratic form xy is an atomic binary form.
- `TauCeti.GeometryOfNumbersPlan.dyadic_atomic_form_test_2`: Over a ring with 2 invertible only the rank-one unit alternative occurs.
- `TauCeti.GeometryOfNumbersPlan.dyadic_atomic_form_test_3`: A field diagonal basis need not be an integral diagonal basis over Z₂.

**Source.** Voight2026, Definition 9.8.1 and Example 9.8.2, printed p.147. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Normalized integral quadratic form

`GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-normalized-form` — theorem.

Every finite-projective quadratic form over a local PID has an integral basis giving an orthogonal sum π^{e₁}Q₁⊥…⊥π^{e_s}Q_s of atomic unary/binary forms, with ordered exponents e_i≥0, allowing the zero blocks specified by the source infinity convention. This normalized form is not asserted unique.

**Hypotheses and conventions.** Over a local PID the finite-projective underlying module is free. No uniform diagonalization theorem is exported for dyadic rings.

**Construction or proof.** 1. Choose a least-valuation coefficient or cross coefficient. 2. Split the corresponding unary or dyadic binary block by integral basis operations and iterate on the orthogonal complement. 3. The exact algorithm and division-validity proof are cited to Voight Algorithm 3.12 and remain a primary-source gap.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2/dyadic-atomic-form`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.integral_normalized_form_test_1`: The binary hyperbolic dyadic block cannot be discarded in favour of an unsupported integral diagonalization.
- `TauCeti.GeometryOfNumbersPlan.integral_normalized_form_test_2`: The zero quadratic map requires the specified zero-block convention.

**Source.** Voight2026, Proposition 9.8.4 and proof reference, printed pp.147–148. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Integral atomic splitting algorithm: Acquire Voight’s 2013 Algorithm 3.12 and its proof, match actual discrete valuation and integral quadratic-map APIs, and split unary/binary pivot, orthogonal complement and termination lemmas. Book Proposition 9.8.4 cites this external proof rather than supplying it.

### GN.3

#### Finite hermitian representation counts

`GeometryOfNumbersAndQuadraticArithmetic:GN.3/hermitian-representation-count` — definition.

For a finite commutative star ring A and hermitian Gram matrices G of size m and B of size n, count all m×n matrices X with XᴴGX=B. This is a finite count of form-preserving maps, including noninjective maps when the source form is degenerate.

**Hypotheses and conventions.** m,n may be zero; star is part of the input. The target space is rank m and the represented/source lattice is rank n.

**Construction or proof.** 1. Enumerate native finite matrices and filter by the actual conjugate-transpose Gram equation. 2. Change coordinates with integral invertible matrices to obtain bijections of solutions. 3. Distinguish injective embeddings in a separate declaration; equality with embeddings requires a nonsingular source over a field.

**Prerequisites.** `mathlib:Matrix.conjTranspose`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.hermitianRepresentationCount` (constructor): Finite cardinality of XᴴGX=B.
- `TauCeti.GeometryOfNumbersPlan.hermitianRepresentationCount_empty` (simp): The empty source has count 1.
- `TauCeti.GeometryOfNumbersPlan.hermitianRepresentationCount_basisChange` (functoriality): Invertible source/target coordinate changes induce a bijection of representation sets.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.hermitian_representation_count_test_1`: Over Z/3 with trivial star, m=n=1, G=B=1 gives 2 maps.
- `TauCeti.GeometryOfNumbersPlan.hermitian_representation_count_test_2`: With G=1,B=0 over Z/3 the count is 1: the zero map.
- `TauCeti.GeometryOfNumbersPlan.hermitian_representation_count_test_3`: For n=0 there is one empty-column representation, for every ambient rank.

**Source.** LiZhangDensity, §3.1, definition of Rep_{M,L}, physical p.15. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Finite hermitian embedding counts

`GeometryOfNumbersAndQuadraticArithmetic:GN.3/hermitian-embedding-count` — definition.

For the same finite matrices, count solutions XᴴGX=B whose associated A-linear map A^n→A^m is injective. Over finite fields this is equivalent to column rank n; with a degenerate source it is stronger than the representation equation.

**Hypotheses and conventions.** The finite-field formula uses the extension F_{q²}/F_q with its nontrivial involution. Injectivity is not substituted by invertibility unless m=n.

**Construction or proof.** 1. Filter the representation set by injectivity of the native matrix linear map. 2. Use a nondegenerate source pairing over a field to prove automatic injectivity. 3. Under basis changes, transport the kernel condition as well as the Gram equation.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3/hermitian-representation-count`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.hermitianEmbeddingCount` (constructor): Finite count with the actual injectivity condition.
- `TauCeti.GeometryOfNumbersPlan.hermitianEmbeddingCount_empty` (simp): Count is 1 for n=0.
- `TauCeti.GeometryOfNumbersPlan.hermitianEmbeddingCount_le` (relation): Embedding count is at most representation count.
- `TauCeti.GeometryOfNumbersPlan.hermitianEmbeddingCount_eq_of_nonsingular` (compatibility): Over a field with nonsingular source, every representation is injective.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.hermitian_embedding_count_test_1`: Over Z/3, G=1,B=0 at rank one gives 0 embeddings but 1 representation.
- `TauCeti.GeometryOfNumbersPlan.hermitian_embedding_count_test_2`: For an empty source the unique map is injective and the count is 1.
- `TauCeti.GeometryOfNumbersPlan.hermitian_embedding_count_test_3`: When n>m over a field the embedding count is zero.

**Source.** LiZhangDensity, Proof of Theorem 3.5.1, physical p.18, finite hermitian isometries. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Finite-field hermitian isometry formula

`GeometryOfNumbersAndQuadraticArithmetic:GN.3/finite-hermitian-isometry-formula` — theorem.

For an n-dimensional F_{q²}/F_q-hermitian source with radical dimension a and a nondegenerate m-dimensional target, m≥n, the number of injective isometries is q^{n(2m−n)} ∏_{i=0}^{n+a−1}(1−(−q)^{i−m}).

**Hypotheses and conventions.** q is a prime power ≥2; the involution is x↦x^q. Count embeddings, not all maps from a degenerate source.

**Construction or proof.** 1. Choose the nondegenerate quotient of the source and its radical separately. 2. Count successive isometric vectors in the target and then injective isotropic radical lifts. 3. The exact finite hermitian counting argument is cited to Kitaoka by the source and remains an explicit proof acquisition gap.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3/hermitian-embedding-count`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.finite_hermitian_isometry_formula_test_1`: n=m=1,a=0 gives q+1 norm-one elements.
- `TauCeti.GeometryOfNumbersPlan.finite_hermitian_isometry_formula_test_2`: n=m=1,a=1 gives 0 embeddings.
- `TauCeti.GeometryOfNumbersPlan.finite_hermitian_isometry_formula_test_3`: n=0,a=0 gives the empty product 1.

**Source.** LiZhangDensity, Proof of Theorem 3.5.1, physical p.18. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Finite hermitian vector counting proof: Acquire and decompose the hermitian analogue of Kitaoka §5.6 Exercise 4 used in Li–Zhang p.18, including degenerate radical lifts. The source gives the formula but not this counting proof.

#### Normalized finite-level hermitian counts

`GeometryOfNumbersAndQuadraticArithmetic:GN.3/normalized-hermitian-count` — definition.

Given quotient rings A_N=O_F/π^N, Gram matrices reduced from fixed integral source/target lattices of ranks n≤m, and q=#k_{F₀}, set a_N=#Rep_{M,L}(A_N)/q^{N n(2m−n)} for N≥1. The denominator uses q, not q².

**Hypotheses and conventions.** F/F₀ is unramified quadratic and F₀ is a nonarchimedean local field of characteristic different from 2. The generic representation scheme is nonempty with dimension n(2m−n). This sequence does not by itself assert convergence.

**Construction or proof.** 1. Reduce the integral Gram matrices to each quotient ring. 2. Use the finite representation count, with all maps as in the representation scheme. 3. Normalize by the base-field residue size to the stated dimension; prove coordinate-change independence at every level.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3/hermitian-representation-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.normalizedHermitianCount` (constructor): Finite count divided by q^{N n(2m−n)}.
- `TauCeti.GeometryOfNumbersPlan.normalizedHermitianCount_empty` (simp): The empty-source count is 1.
- `TauCeti.GeometryOfNumbersPlan.normalizedHermitianCount_basisChange` (compatibility): Integral invertible basis changes preserve every normalized count.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.normalized_hermitian_count_test_1`: For n=0 the normalized count is 1 at every level.
- `TauCeti.GeometryOfNumbersPlan.normalized_hermitian_count_test_2`: For m=n=1 the exponent is N, not 2N.
- `TauCeti.GeometryOfNumbersPlan.normalized_hermitian_count_test_3`: A generic empty representation problem is not treated as a smooth nonempty scheme of the stated dimension.

**Source.** LiZhangDensity, §3.1 local density definition, physical p.15. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Hermitian local representation density

`GeometryOfNumbersAndQuadraticArithmetic:GN.3/hermitian-local-density` — construction.

Under the preceding local-field hypotheses, Den(M,L) is the limit of normalized finite-level counts. Its existence, finite value and basis independence are part of the construction, with the specified nonempty generic-fibre assumptions. The statement is separate from the geometric intersection identity.

**Hypotheses and conventions.** The unramified analytic density branch allows residue characteristic 2; geometric §3.4 hypotheses are not imported into all of §3. Haar measures on lattice coordinates assign volume 1 to the integral coordinate lattice before any self-dual Fourier normalization is applied.

**Construction or proof.** 1. Prove stabilization or convergence of the normalized finite-level sequence by local representation-density theory. 2. Identify the limit with the representation-scheme measure under the fixed normalization. 3. The existence and measure comparison proof from Hironaka/Gan–Yu is an explicit source gap.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3/normalized-hermitian-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-lattice-invariants`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.hermitianLocalDensity` (constructor): The proved limit of normalized counts.
- `TauCeti.GeometryOfNumbersPlan.hermitianLocalDensity_tendsto` (characterisation): The normalized sequence tends to the stated density.
- `TauCeti.GeometryOfNumbersPlan.hermitianLocalDensity_basisChange` (compatibility): Integral isometries preserve the density.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.hermitian_local_density_test_1`: Density of the empty source is 1.
- `TauCeti.GeometryOfNumbersPlan.hermitian_local_density_test_2`: The denominator and measure use q=#k_{F₀}; substituting q² changes the limit.
- `TauCeti.GeometryOfNumbersPlan.hermitian_local_density_test_3`: A ramified quadratic extension cannot reuse the unramified formula without a new theorem.

**Source.** LiZhangDensity, §§3.1–3.2, physical pp.15–16. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Hermitian density existence and normalization proof: Acquire Hironaka 1998/2012 and Gan–Yu 2000 at the exact passages used in Li–Zhang §§3.1–3.2. Prove existence, the generic fibre dimension, dyadic unramified smoothness and the finite-count/Haar comparison. These results are statement-read through Li–Zhang, not proof-read in their original sources.

#### Normalized hermitian Siegel polynomial

`GeometryOfNumbersAndQuadraticArithmetic:GN.3/normalized-siegel-polynomial` — construction.

For an integral nondegenerate unramified hermitian lattice L of rank n, construct the unique D_L∈Z[X] such that D_L((−q)^−k)=Den(⟨1⟩_{n+k},L)/Den(⟨1⟩_{n+k},⟨1⟩_n) for every integer k≥0. The denominator is ∏_{i=1}^n(1−(−q)^−i(−q)^−k).

**Hypotheses and conventions.** q≥2 and the extension is unramified quadratic. The interpolating polynomial and its integral coefficients require a proof, not a generic choice of a function through finitely many values.

**Construction or proof.** 1. Import the density and the standard self-dual target normalization. 2. Use the source Siegel-series existence theorem to obtain an integral polynomial. 3. Uniqueness follows from infinitely many distinct interpolation points over Q; the original existence proof remains a gap.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3/hermitian-local-density`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-lattice-invariants`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.normalizedSiegelPolynomial` (constructor): The integral normalized density polynomial.
- `TauCeti.GeometryOfNumbersPlan.normalizedSiegelPolynomial_eval` (characterisation): Evaluate at (−q)^−k to recover the specified density ratio.
- `TauCeti.GeometryOfNumbersPlan.normalizedSiegelPolynomial_selfDual` (simp): Polynomial equals 1 for a self-dual lattice.
- `TauCeti.GeometryOfNumbersPlan.normalizedSiegelPolynomial_isometry` (functoriality): Integral hermitian isometries preserve the polynomial.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.normalized_siegel_polynomial_test_1`: For a rank-one lattice with valuation a, D_L(X)=Σ_{i=0}^a(−X)^i.
- `TauCeti.GeometryOfNumbersPlan.normalized_siegel_polynomial_test_2`: A self-dual lattice has polynomial 1.
- `TauCeti.GeometryOfNumbersPlan.normalized_siegel_polynomial_test_3`: Using q^−k instead of (−q)^−k loses the alternating sign.

**Source.** LiZhangDensity, §3.2, physical p.16. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Integral Siegel polynomial existence: Prove the interpolation and integrality theorem cited in Li–Zhang §3.2 from the exact Hironaka source. Finite interpolation alone is not a proof of this construction.

#### Cho–Yamauchi weight polynomial

`GeometryOfNumbersAndQuadraticArithmetic:GN.3/cho-yamauchi-weight` — definition.

For q≥2 and a∈N define m_q(a;X)=∏_{i=0}^{a−1}(1−(−q)^i X) in Z[X], with empty product m_q(0;X)=1. The derivative weight is −m_q(a;X)′ at X=1; for a=0 it is 0, and for a≥1 it is ∏_{i=1}^{a−1}(1−(−q)^i).

**Hypotheses and conventions.** The negative base is in Z before taking powers. Polynomial empty weight 1 and derivative empty weight 0 are distinct.

**Construction or proof.** 1. Form the native polynomial finite product. 2. Differentiate at 1; for a≥1 only the differentiated i=0 factor survives. 3. Use the recurrence to support finite overlattice sums.

**Prerequisites.** `mathlib:Polynomial`, `mathlib:Polynomial.derivative`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.choYamauchiWeight` (constructor): The native integral polynomial finite product.
- `TauCeti.GeometryOfNumbersPlan.choYamauchiWeight_zero` (simp): Empty polynomial weight is 1.
- `TauCeti.GeometryOfNumbersPlan.choYamauchiWeight_succ` (relation): m(a+1;X)=m(a;X)(1−(−q)^a X).
- `TauCeti.GeometryOfNumbersPlan.choYamauchiWeight_derivative` (relation): The negative derivative at 1 is 0 for a=0 and the stated product for a>0.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.cho_yamauchi_weight_test_1`: m_q(0;X)=1, derivative weight 0.
- `TauCeti.GeometryOfNumbersPlan.cho_yamauchi_weight_test_2`: m_q(1;X)=1−X, derivative weight 1.
- `TauCeti.GeometryOfNumbersPlan.cho_yamauchi_weight_test_3`: m_q(2;X)=(1−X)(1+qX), derivative weight 1+q.

**Source.** LiZhangDensity, §3.5 before Theorem 3.5.1, physical p.17. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Cho–Yamauchi hermitian density formula

`GeometryOfNumbersAndQuadraticArithmetic:GN.3/cho-yamauchi-overlattice-formula` — theorem.

D_L(X)=Σ_{L⊆L′⊆(L′)∨} X^{2 length_{O_F}(L′/L)} m_q(t(L′);X), summing over integral overlattices of L. The sum is finite because every such L′ lies between L and L∨.

**Hypotheses and conventions.** Unramified quadratic extension of a local field of characteristic different from 2, including dyadic residue characteristic in this analytic statement. Length is over O_F; t is the number of positive fundamental invariants.

**Construction or proof.** 1. Classify a representation by its saturated overlattice and the residual hermitian radical. 2. Apply the finite-field embedding formula and the source smoothness/lifting result to each stratum. 3. Use polynomial interpolation to identify the finite sum with D_L. The smoothness and stratum-count comparison from Cho–Yamauchi/Gan–Yu remains explicit.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3/normalized-siegel-polynomial`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/cho-yamauchi-weight`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-dual-lattice`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-lattice-invariants`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/finite-hermitian-isometry-formula`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.cho_yamauchi_overlattice_formula_test_1`: For valuation-one rank one, D=1−X and the negative derivative is 1.
- `TauCeti.GeometryOfNumbersPlan.cho_yamauchi_overlattice_formula_test_2`: For valuation-three rank one, D=1−X+X²−X³ and the negative derivative is 2.
- `TauCeti.GeometryOfNumbersPlan.cho_yamauchi_overlattice_formula_test_3`: A self-dual L contributes just L with type 0 and polynomial 1.

**Source.** LiZhangDensity, Theorem 3.5.1 and proof, physical pp.17–18. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Overlattice stratum lifting and smoothness: Acquire Cho–Yamauchi Corollary 3.11/Theorem 3.9 and Gan–Yu Lemma 5.5.2/§9, including the unramified dyadic case, and prove the representation-to-overlattice stratification with the exact q-exponent.

#### Hermitian Siegel polynomial functional equation

`GeometryOfNumbersAndQuadraticArithmetic:GN.3/siegel-polynomial-functional-equation` — theorem.

For integral nondegenerate L, D_L(X)=(−X)^{val(L)}D_L(X^−1), interpreted in the Laurent polynomial ring. If val(L) is odd then D_L(1)=0.

**Hypotheses and conventions.** The val(L) parity and the negative sign are retained.

**Construction or proof.** 1. Apply the exact source Siegel-series functional equation with its discriminant parity. 2. Regard both sides as Laurent polynomials so inversion is meaningful. 3. Evaluate at 1; over Z, odd valuation gives D_L(1)=−D_L(1), hence zero.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3/normalized-siegel-polynomial`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-lattice-invariants`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.siegel_polynomial_functional_equation_test_1`: Rank-one D=1−X at valuation 1 satisfies D(X)=−X D(X^−1).
- `TauCeti.GeometryOfNumbersPlan.siegel_polynomial_functional_equation_test_2`: At valuation 2, D=1−X+X² and D(1)=1, so the odd-valuation vanishing does not extend to even valuation.

**Source.** LiZhangDensity, §3.2 (3.2.0.2), physical p.16. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Siegel-series functional-equation proof: Acquire and decompose Hironaka’s exact functional equation used at (3.2.0.2); the source states it but the original proof is not read.

#### Finite integral isometry stabilizers

`GeometryOfNumbersAndQuadraticArithmetic:GN.3/definite-integral-isometry-finite` — theorem.

For a full Z-lattice in a positive-definite real Euclidean space, its integral isometry group is finite. For a totally positive number-field quadratic lattice, restriction through all real embeddings gives the corresponding finite stabilizer.

**Hypotheses and conventions.** Definiteness and full finite generation are essential; indefinite lattices can have infinite isometry groups.

**Construction or proof.** 1. Fix a lattice basis. An isometry sends each basis vector into the finite lattice set on its fixed norm sphere. 2. Inject an isometry into its finite tuple of basis images. 3. For a totally positive number-field form, use the imported embedding and trace-metric comparison to reduce to a real Z-lattice.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-genus`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/finite-gauge-sublevel`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.definite_integral_isometry_finite_test_1`: For (Z,x²) the isometry group is {±1}, so its mass weight is 1/2.
- `TauCeti.GeometryOfNumbersPlan.definite_integral_isometry_finite_test_2`: Positive definiteness cannot be dropped: Pell-type indefinite rank-two lattices have infinite stabilizers.

**Source.** Voight2026, Definition 9.7.13; worker proof from finite lattice points, not a claimed source proof of the general mass theorem. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Totally positive restriction-of-scalars metric: Match the arithmetic embedding/trace metric and its normalization to the existing number-field/EffectiveBoundsCompactModels owner; do not create a second number-field metric here.

#### Finiteness of a positive-definite genus class set

`GeometryOfNumbersAndQuadraticArithmetic:GN.3/definite-genus-class-finite` — theorem.

The integral-isometry class set of a fixed positive-definite quadratic genus over Z, and of a fixed totally positive genus over a number ring, is finite.

**Hypotheses and conventions.** A fixed determinant/discriminant ideal and archimedean signatures belong to the genus data. This is finiteness of classes, not finiteness of all embedded lattices.

**Construction or proof.** 1. Apply the imported reduction-domain theorem to bound representative Gram data within the fixed discriminant genus. 2. Use finite integral coefficient enumeration and identify duplicates by integral isometry. 3. The exact reduction-to-finite-Gram and number-field coefficient-ideal argument remains a named proof gap.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-genus`, `AdelicAlgebraicGroups:AA.3`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.definite_genus_class_finite_test_1`: Infinitely many embedded coordinate changes can represent one integral-isometry class.
- `TauCeti.GeometryOfNumbersPlan.definite_genus_class_finite_test_2`: The rank-one positive unimodular Z-genus has one class, though its isometry group has two elements.

**Source.** Voight2026, Definition 9.7.13 and local-global finite-support lattice conventions, printed pp.141,146. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Definite genus finite representative theorem: Read and decompose the precise reduction bound for a fixed positive genus, including coefficient ideals over number rings. Adelic reduction supplies the domain framework, not this finite integral Gram enumeration by itself.

#### Weighted genus mass

`GeometryOfNumbersAndQuadraticArithmetic:GN.3/genus-mass` — definition.

For a positive-definite genus with its proved finite class set, mass(L)=Σ_[M] 1/|O(M)| as a positive rational number. Proper mass uses proper classes and SO(M) separately; neither is substituted for the other without an index comparison.

**Hypotheses and conventions.** Finite automorphism groups and a finite class set are supplied before summing. Unweighted class number and mass are different invariants.

**Construction or proof.** 1. Sum reciprocal stabilizer orders on a finite integral-isometry quotient. 2. Use isometry-conjugacy to prove the weight independent of the representative. 3. Keep O and SO versions distinguished by their class sets and stabilizers.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3/definite-integral-isometry-finite`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/definite-genus-class-finite`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.genusMass` (constructor): Finite sum of rational reciprocal integral-isometry stabilizer orders.
- `TauCeti.GeometryOfNumbersPlan.genusMass_representative` (compatibility): The summand is independent of the chosen representative.
- `TauCeti.GeometryOfNumbersPlan.genusMass_singleton` (simp): A singleton class set has mass the reciprocal stabilizer order.
- `TauCeti.GeometryOfNumbersPlan.genusMass_pos` (relation): A nonempty finite positive genus has strictly positive mass.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.genus_mass_test_1`: The rank-one positive unimodular genus has ordinary mass 1/2, not class number 1.
- `TauCeti.GeometryOfNumbersPlan.genus_mass_test_2`: For proper rank-one classes the stabilizer is trivial and proper mass is 1.
- `TauCeti.GeometryOfNumbersPlan.genus_mass_test_3`: Changing representatives cannot change the stabilizer cardinality.

**Source.** Voight2026, §9.7 genus class set; worker weighted measure interface for GN.3. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Adelic weighted mass identity

`GeometryOfNumbersAndQuadraticArithmetic:GN.3/adelic-mass-identity` — theorem.

Let q be totally positive over a totally real number field, G=SO(q), and K_f the integral stabilizer of a fixed lattice in its finite adelic genus. For compatible product Haar measures with convergent product vol(K_f), proper mass equals vol(G(K)\G(A))/(vol(G(K∞))·vol(K_f)). Every double-coset contribution is the reciprocal order of the proper integral stabilizer.

**Hypotheses and conventions.** Use proper SO classes and weights consistently. Local measures, archimedean measure and the convergent product are fixed before numerical evaluation. The numerator is not replaced by 2 until a separate Tamagawa-number theorem is supplied; low-rank tori have separate behavior.

**Construction or proof.** 1. Identify proper genus classes with G(K)\G(A_f)/K_f. 2. Decompose the adelic quotient over these finitely many double cosets. 3. Integrate each compact archimedean/stabilizer piece, dividing by its finite rational stabilizer. 4. Sum the contributions and divide by the actual positive local-volume product; the Tamagawa comparison and explicit densities remain precise gaps.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3/genus-mass`, `AdelicAlgebraicGroups:AA.2`, `AdelicAlgebraicGroups:AA.3`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.adelic_mass_identity_test_1`: Rescaling one local Haar measure changes the numerator and local factor compatibly.
- `TauCeti.GeometryOfNumbersPlan.adelic_mass_identity_test_2`: Replacing the weighted sum by the class number gives the wrong rank-one value.
- `TauCeti.GeometryOfNumbersPlan.adelic_mass_identity_test_3`: The numerical constant 2 is not an assumption-free formula for SO of rank 1 or 2.

**Source.** Benoist2019, Quotient/Haar convention on physical pp.5–7; worker adelic genus decomposition, not an attributed proof of a numerical Siegel mass formula. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Tamagawa normalization and explicit mass factors: Acquire the exact Smith–Minkowski–Siegel/Weil mass theorem, identify O versus SO indices and archimedean constants, prove the local-density factor comparison and the convergent Euler product, and prove the relevant Tamagawa number before assigning a numerical constant. The decomposition here gives an honest measure identity, not an unproved numerical mass formula.

#### Integral lattice theta coefficient interface

`GeometryOfNumbersAndQuadraticArithmetic:GN.3/theta-lattice-coefficient-interface` — comparison.

For a positive-definite even integral Z-lattice, the imported convergent theta kernel specializes to the lattice theta series whose coefficient at m is #{x∈L:q(x)=m}, with q(x)=B(x,x)/2. Scalar weight, level and Weil-representation/discriminant conventions are inherited from the theta owner.

**Hypotheses and conventions.** Do not identify an odd lattice’s half-norm with an integral q-expansion. The supplied analytic theta theorem includes its Schwartz function, Haar normalization and convergence hypotheses.

**Construction or proof.** 1. Specialize the existing Metaplectic theta kernel to the lattice indicator/Gaussian data. 2. Use positive definiteness and finite norm sublevels to identify each coefficient. 3. Prove the metric/discriminant and q-exponent adapter without defining a second theta representation.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-quadratic-lattice`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1/finite-gauge-sublevel`, `MetaplecticAutomorphicForms:MP.5`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.theta_lattice_coefficient_interface_test_1`: For an even lattice q=B(x,x)/2 is integer valued.
- `TauCeti.GeometryOfNumbersPlan.theta_lattice_coefficient_interface_test_2`: For an odd rank-one Gram-1 lattice the half-norm is not integral, so its level/exponent conventions require a different specialization.

**Source.** Duke1988, Introduction theta/Weyl-sum correspondence, printed p.74; worker even-lattice specialization. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Theta-kernel integral lattice adapter: Supply the exact Schwartz/Gaussian specialization, coefficient exponent, discriminant Weil module, level and weight from MP.5; this node imports that theory rather than asserting a scalar modularity theorem without its hypotheses.

#### Mass formula for maximal integral lattices

`GeometryOfNumbersAndQuadraticArithmetic:GN.3/maximal-integral-mass-formula` — theorem.

Let K be totally real of degree d≥2, Q a totally positive nondegenerate m-dimensional form, m≥3, and Λ the genus of maximal integral O_K-lattices. With ordinary O-isometry mass, r=floor(m/2), G=SO(Q), 2 mass(Λ)=2 γ_G^d |disc K|^(dim G/2) L(G) ∏_p λ_p(Q). Here dim G=r(2r−(−1)^m); γ_G=∏_(i=1)^r(2i−1)!/(2π)^(r(r+1)) for odd m and (r−1)!∏_(i=1)^(r−1)(2i−1)!/(2π)^(r²) for even m. L(G)=∏_(i=1)^r ζ_K(2i) for odd m; ζ_K(r)∏_(i=1)^(r−1)ζ_K(2i) for even m with square discriminant; otherwise [ζ_E(r)/ζ_K(r)] N(d_E/K)^(r−1/2)∏_(i=1)^(r−1)ζ_K(2i), E=K(√disc Q). The local λ_p are exactly the table in Definition 3.1, not the hermitian normalized density polynomial of GN.3.

**Hypotheses and conventions.** Maximal integrality is essential. Do not apply this formula to arbitrary lattices or indefinite forms. The leading two multiplies the ordinary O mass; τ(SO)=2 has a separate original-source proof obligation. The finite exceptional product and convergent positive-integer zeta Euler products are required.

**Construction or proof.** 1. Import rational field invariants and local classification from their existing owners. 2. Use the maximal-lattice single-genus result and local-type table. 3. Apply the Shimura/Gan–Hanke–Yu mass theorem with its archimedean and Tamagawa normalizations. 4. Separate the ordinary O mass from the proper SO adelic measure identity; identify every local factor, including dyadic places.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3/genus-mass`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/adelic-mass-identity`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-genus`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.maximal_integral_mass_formula_test_1`: Class number one implies mass=1/|Aut L|; it is not an unweighted class count.
- `TauCeti.GeometryOfNumbersPlan.maximal_integral_mass_formula_test_2`: The formula is restricted to m≥3; binary zeta-at-one substitution is excluded.
- `TauCeti.GeometryOfNumbersPlan.maximal_integral_mass_formula_test_3`: A dyadic exceptional factor is retained rather than set to one.

**Source.** Kirschmer2013, pp.3–4, Definition 3.1, Proposition 3.2 and Theorem 3.3. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Original maximal mass theorem and complete local table: Acquire Shimura 1999 Theorem 5.8 / Gan–Hanke–Yu 2001 Proposition 2.13, prove τ(SO)=2, maximal-lattice single genus, local-model comparison and finite bad-prime support. Definition 3.1/Table 1 are read, but the complete invariant-to-factor adapter and original mass proof require refinement. Mass zeta and archimedean normalization imports: Attach exact number-field Dedekind-zeta Euler product and special-value supplier declarations, and the gamma/local Haar conversion. Do not infer these from the theta or adelic measure stage alone.

### GN.4

#### Davenport semialgebraic multiset estimate

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count` — theorem.

For n≥1, a bounded semialgebraic multiset R⊂R^n with maximum multiplicity m, given by at most k polynomial inequalities of degrees≤ell, and an upper or lower triangular unipotent image R′, the multiplicity-weighted integer count differs from vol(R) by at most C(n,m,k,ell)·max(1,max_{1≤d<n}vol_d(proj_d R)). Projections are coordinate projections of the original region R.

**Hypotheses and conventions.** The n=1 inner projection maximum is empty and the error bound uses 1. The complexity and multiplicity control the uniform constant; boundedness alone is not enough. General linear transformations are not silently treated as the triangular-unipotent variant.

**Construction or proof.** 1. Prove the coordinate-line interval bound for the region and every coordinate projection. 2. Iterate one-dimensional count/length comparisons to reduce to projection volumes. 3. For semialgebraic regions, use the corrected algebraic-cell argument rather than the false claim that every projection is a basic conjunction of polynomial inequalities. 4. The original Davenport proof, 1964 corrigendum and Rogers bounded-cell proof must be acquired and decomposed; only the precise modern statement is read.

**Prerequisites.** `mathlib:ZLattice.covolume`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.davenport_semialgebraic_count_test_1`: For an interval [0,N] with N integral, count−length=1.
- `TauCeti.GeometryOfNumbersPlan.davenport_semialgebraic_count_test_2`: Counting a region twice multiplies both volume and point count; ignoring multiset multiplicity is wrong.
- `TauCeti.GeometryOfNumbersPlan.davenport_semialgebraic_count_test_3`: The projection error for a triangular image refers to the original region as in Proposition 2.5.

**Source.** BhargavaShankar2010, Proposition 2.5, physical p.14; Davenport 1951 plus 1964 corrigendum identified separately. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Corrected Davenport/Rogers proof and semialgebraic carrier: Acquire Davenport 1951 pp.179–183, its 1964 corrigendum p.580 and Rogers Theorem 9; decompose interval/projection induction and the bounded algebraic-cell complexity theorem. The corrigendum is identified via DOI 10.1112/jlms/s1-39.1.580-t and its indexed text, not represented as an acquired proof. Match the semialgebraic multiset carrier to its actual owner before a full Lean signature.

#### Howe–Moore matrix-coefficient decay

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/howe-moore-mixing` — theorem.

For a connected noncompact almost-simple real Lie group G with finite centre and a strongly continuous unitary representation on a Hilbert space with no nonzero G-invariant vector, every matrix coefficient tends to 0 as g leaves all compact subsets of G.

**Hypotheses and conventions.** Strong continuity, unitarity, finite centre and almost simplicity are retained. For a semisimple product one must specify escape in every noncompact factor or the appropriate factor-invariant exclusions.

**Construction or proof.** 1. Apply the exact Howe–Moore unitary-representation theorem, keeping its group and invariant-vector hypotheses. 2. For homogeneous quotient applications, construct the unitary action on the zero-mean L² subspace. 3. The full decay proof and the L² continuity/unitarity adapter remain explicit inputs.

**Prerequisites.** `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`, `AdelicAlgebraicGroups:AA.2`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.howe_moore_mixing_test_1`: A constant vector in the full L² quotient space has a nondecaying coefficient; remove constants before applying the theorem.
- `TauCeti.GeometryOfNumbersPlan.howe_moore_mixing_test_2`: Escaping only one factor of a product does not justify the unqualified product theorem.

**Source.** Benoist2019, Fact 3.3, physical p.20. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Howe–Moore source proof and unitary representation adapter: Acquire the original Howe–Moore proof or the cited complete exposition, split the Cartan/weak-limit/invariant-vector arguments, and match the strongly continuous L² action on G/Γ. The read Benoist source explicitly omits this proof.

#### Ergodicity of a noncompact subgroup action

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/homogeneous-ergodicity` — theorem.

Let G be connected noncompact almost-simple with finite centre, Γ a lattice and μ the invariant probability measure on G/Γ. Every closed noncompact subgroup H acts ergodically on (G/Γ,μ).

**Hypotheses and conventions.** Finite quotient volume is used to normalize μ; G is almost-simple, not an arbitrary product.

**Construction or proof.** 1. Construct the strongly continuous unitary action on zero-mean L²(G/Γ,μ). 2. If an H-invariant vector existed, its matrix coefficient would stay constant along an H-sequence leaving compact sets. 3. Apply Howe–Moore to force that vector to vanish and use the L² characterization of ergodicity.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.4/howe-moore-mixing`, `AdelicAlgebraicGroups:AA.2`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.homogeneous_ergodicity_test_1`: A compact subgroup does not meet the noncompactness hypothesis.
- `TauCeti.GeometryOfNumbersPlan.homogeneous_ergodicity_test_2`: For a semisimple product, a lattice quotient with factor-invariant functions requires an irreducibility/factor version instead.

**Source.** MorrisArithmetic, Moore-ergodicity conventions in the standing setting, §4.10 (not proof-read here); consequence derived from the preceding matrix-coefficient target. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** L² ergodicity characterization and quotient action: Match the actual invariant-probability quotient action, L² strong continuity and invariant-function characterization to the measure-theory baseline; no private ergodic-action predicate is introduced.

#### Dani–Margulis recurrence in the lattice space

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/unipotent-nondivergence` — theorem.

For d≥2, X=SL_d(R)/SL_d(Z), a one-parameter unipotent subgroup u_t, x∈X and epsilon>0, there exists a compact K⊂X such that for every T>0, Leb{t∈[0,T]:u_t x∈K}/T≥1−epsilon.

**Hypotheses and conventions.** K depends on x, epsilon and the flow. This is qualitative recurrence; no spectral rate or uniform compact set over all x is asserted.

**Construction or proof.** 1. Use Mahler compactness to describe cusp escape by short lattice vectors. 2. Apply the original Dani–Margulis polynomial/unipotent nondivergence estimate to construct K. 3. The estimate and its finite-interval uniformity are explicit proof acquisition gaps.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.unipotent_nondivergence_test_1`: A diagonal flow can diverge and cannot replace the unipotent flow.
- `TauCeti.GeometryOfNumbersPlan.unipotent_nondivergence_test_2`: The statement controls every T>0 with a compact set containing the necessary initial trajectory segment.

**Source.** Benoist2019, Fact 3.4, physical p.20. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Dani–Margulis nondivergence proof: Acquire the original recurrence proof cited by Benoist [11], including Mahler short-vector control and polynomial trajectory estimates. Record any quantitative strengthening as a separate theorem with its own good-function, covolume and uniformity hypotheses.

#### Ratner orbit-closure theorem

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-orbit-closure` — theorem.

For a connected linear semisimple real Lie group G, a lattice Γ, a connected subgroup U generated by one-parameter unipotent subgroups and x=gΓ, the closure of Ux is Lx for a connected closed subgroup L containing U, with L∩gΓg^−1 a lattice in L.

**Hypotheses and conventions.** The homogeneous orbit has finite invariant volume; the subgroup is generated by unipotent flows. A general diagonal orbit does not satisfy this conclusion.

**Construction or proof.** 1. Apply the original Ratner orbit-closure argument using unipotent recurrence and invariant-measure rigidity. 2. Identify the stabilizer as L∩gΓg^−1 and the orbit with its quotient. 3. The measure-rigidity and linearization proof chain is a recorded substantial gap, separate from Minkowski.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.4/unipotent-nondivergence`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.ratner_orbit_closure_test_1`: The orbit closure carries a finite L-invariant measure, not just an unspecified closed set.
- `TauCeti.GeometryOfNumbersPlan.ratner_orbit_closure_test_2`: Diagonal-flow fractal orbit closures show why the unipotent-generation hypothesis is retained.

**Source.** MorrisArithmetic, Theorem 20.1.3 and Remarks 20.1.4–20.1.5, printed pp.406–407; connected specialization. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Ratner orbit and measure rigidity proof: Acquire the original Ratner measure-classification/orbit-closure sources and decompose recurrence, shearing, linearization, invariant-subgroup construction and finite-volume orbit arguments. The Morris source explicitly states that these proofs are long and does not supply them in the selected slice.

#### Ratner invariant-measure classification

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-measure-classification` — theorem.

In the preceding homogeneous setting, every ergodic U-invariant probability measure on G/Γ is the unique normalized L-invariant measure on a closed finite-volume orbit Lx for a closed subgroup L containing U.

**Hypotheses and conventions.** U is connected and generated by one-parameter unipotent subgroups. Probability, invariance and ergodicity are separate hypotheses.

**Construction or proof.** 1. Prove the measure-rigidity theorem with its actual unipotent-flow hypotheses. 2. Identify support and invariant stabilizer, then normalize the homogeneous orbit measure. 3. This is a separate substantial source proof gap; orbit closure alone does not classify invariant measures.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.4/unipotent-nondivergence`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.ratner_measure_classification_test_1`: A convex combination of different homogeneous orbit measures need not be ergodic.
- `TauCeti.GeometryOfNumbersPlan.ratner_measure_classification_test_2`: Replacing probability by an arbitrary infinite invariant measure is outside the statement.

**Source.** MorrisArithmetic, Theorem 20.3.4, printed p.413. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Ratner ergodic measure proof: Acquire the original classification proof and record its measurable shearing/entropy-free rigidity inputs at declaration granularity. Do not infer this theorem solely from topological orbit closure.

#### Equidistribution of a unipotent orbit

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-unipotent-equidistribution` — theorem.

For a one-parameter unipotent flow u_t and x∈G/Γ, there is a closed finite-volume homogeneous orbit Lx containing u_t x and a normalized invariant probability μ_L such that T^−1∫_0^T f(u_t x)dt→∫f dμ_L for every continuous compactly supported f.

**Hypotheses and conventions.** The orbit measure is on the actual orbit closure, not necessarily all of G/Γ. No quantitative rate is inferred.

**Construction or proof.** 1. Use nondivergence to avoid escape of mass in empirical measures. 2. Apply the original unipotent measure-selection/rigidity argument to identify every subsequential limit. 3. Use uniqueness to obtain convergence against compactly supported continuous tests. The selection and linearization inputs are gaps.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.4/unipotent-nondivergence`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-orbit-closure`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-measure-classification`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.ratner_unipotent_equidistribution_test_1`: A closed periodic unipotent orbit equidistributes on itself, not on the full quotient.
- `TauCeti.GeometryOfNumbersPlan.ratner_unipotent_equidistribution_test_2`: The limiting measure has mass 1; vague convergence with escaped mass would not satisfy the statement.

**Source.** MorrisArithmetic, Definition 20.3.2 and Theorem 20.3.3, printed pp.412–413. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Ratner time-average selection and escape control: Measure classification plus qualitative recurrence does not by itself identify every time-average limit. Acquire the original equidistribution proof, its nonescape estimates and selection argument, retaining the stated one-parameter unipotent hypothesis.

#### Margulis’s theorem on irrational quadratic values

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/oppenheim-values` — theorem.

For n≥3, a real nondegenerate indefinite quadratic form q on R^n that is not proportional to a form with rational coefficients has q(Z^n) dense in R.

**Hypotheses and conventions.** Nondegeneracy, indefiniteness, dimension≥3 and irrationality up to scalar are all retained.

**Construction or proof.** 1. For n=3 use G=SL_3(R) and H=SO(q)° generated by unipotents. 2. Use Ratner orbit closure and the H-to-G intermediate subgroup classification. 3. A closed finite-volume H-orbit forces a rational defining form by Borel density, contradicting the scalar-irrationality assumption. 4. The dense orbit then gives dense quadratic values by continuity and q(R³)=R. The intermediate subgroup, rationality and higher-dimensional restriction arguments are precise gaps.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-orbit-closure`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.oppenheim_values_test_1`: An integral form has discrete values and is excluded.
- `TauCeti.GeometryOfNumbersPlan.oppenheim_values_test_2`: Positive-definite forms do not have values dense in all R.
- `TauCeti.GeometryOfNumbersPlan.oppenheim_values_test_3`: The n=2 form x²−(3+2√2)y² shows why dimension≥3 is required.

**Source.** MorrisArithmetic, Corollary 20.2.5 and three-variable proof, printed pp.410–411. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Oppenheim auxiliary Lie and arithmetic lemmas: Supply the SO(1,2) intermediate-subgroup classification, Borel-density rationality of its invariant quadratic line and reduction from n≥3 to an appropriate irrational indefinite ternary restriction. The selected Morris proof treats n=3 and explicitly omits some Lie calculations.

#### Duke spherical lattice-point equidistribution

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/duke-spherical-equidistribution` — theorem.

As n→∞ through positive square-free integers n not congruent to 7 modulo 8, the normalized counting measure on {v/√n:v∈Z³,‖v‖²=n} converges to normalized rotation-invariant surface measure on S².

**Hypotheses and conventions.** The representation set is nonempty on the stated admissible sequence. No effective constant is claimed: the representation-number lower bound is ineffective.

**Construction or proof.** 1. For each positive-degree spherical harmonic, identify its normalized Weyl sum with a coefficient of the corresponding half-integral-weight theta cusp form. 2. Use the exact Iwaniec coefficient estimate and Siegel representation-number lower bound to force that Weyl sum to zero. 3. Approximate continuous functions by spherical harmonics to obtain weak convergence; the analytic estimates and theta/harmonic adapters are explicit inputs.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.3/theta-lattice-coefficient-interface`, `MetaplecticAutomorphicForms:MP.7`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.duke_spherical_equidistribution_test_1`: n≡7 mod8 has no three-square representations and is excluded.
- `TauCeti.GeometryOfNumbersPlan.duke_spherical_equidistribution_test_2`: A measure on primitive representations for nonsquare-free n is a different theorem.

**Source.** Duke1988, Introduction, printed p.74, before Theorem 1. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Duke theta and coefficient estimates: Acquire Iwaniec’s exact half-integral coefficient bound and Siegel’s ineffective r₃(n) lower bound; match spherical-harmonic theta lifting and density of harmonic polynomials. Duke p.74 gives the deduction, not the original proofs of those inputs.

#### Euclidean lattice packing radius

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/packing-radius` — definition.

For a positive-dimensional full Euclidean lattice L, its packing radius is half the attained shortest nonzero norm. In dimension zero set it to zero.

**Hypotheses and conventions.** Full rank and positive dimension are retained; zero dimension has a separate radius-0 convention.

**Construction or proof.** 1. Reuse the attained first Euclidean minimum in positive dimension. 2. Divide that minimum by two; handle the zero-dimensional convention separately.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-first`, `mathlib:ZLattice.covolume`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.latticePackingRadius` (constructor): Half the attained first Euclidean minimum, zero in rank zero.
- `TauCeti.GeometryOfNumbersPlan.latticePackingRadius_eq_half` (characterisation): In positive rank it is half the first Euclidean minimum.
- `TauCeti.GeometryOfNumbersPlan.latticePackingRadius_smul` (functoriality): Positive scalar multiplication multiplies the packing radius by that scalar.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.packing_radius_test_1`: For aZ in R, a>0, the packing radius is a/2.
- `TauCeti.GeometryOfNumbersPlan.packing_radius_test_2`: For Z² the packing radius is 1/2.
- `TauCeti.GeometryOfNumbersPlan.packing_radius_test_3`: In dimension zero the packing radius is zero.

**Source.** Benoist2019, Physical pp.5–7 quotient/lattice conventions; worker Euclidean packing/covering construction. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Compact star bodies from homogeneous gauges

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/compact-star-body` — definition.

A compact star body is specified by a continuous positive homogeneous function p:V→R_{≥0} with p(x)=0 iff x=0, p(t x)=t p(x) for t≥0, and compact unit sublevel K={p≤1}. Convexity is not assumed. Nonzero lattice avoidance and critical determinants use this body, rather than the convex-body API without its hypotheses.

**Hypotheses and conventions.** Finite-dimensional real V; the compactness/properness condition is explicit. The body contains a neighborhood of zero.

**Construction or proof.** 1. Use an actual continuous homogeneous gauge and its sublevel set. 2. Prove star-shapedness, boundedness and positive radial scaling. 3. State lattice admissibility as no nonzero point in the interior and build critical-determinant problems with their own compactness inputs.

**Prerequisites.** `mathlib:ConvexBody.isCompact`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.CompactStarBody.ofGauge` (constructor): The actual continuous definite homogeneous gauge and compact unit sublevel.
- `TauCeti.GeometryOfNumbersPlan.CompactStarBody.radial` (characterisation): Positive radial scaling is governed by p(tx)=t p(x).
- `TauCeti.GeometryOfNumbersPlan.CompactStarBody.admissible` (data): No nonzero lattice point in the interior.
- `TauCeti.GeometryOfNumbersPlan.CompactStarBody.convexComparison` (compatibility): When the unit sublevel is convex, compare to the native ConvexBody.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.compact_star_body_test_1`: The Euclidean norm gives a convex star body.
- `TauCeti.GeometryOfNumbersPlan.compact_star_body_test_2`: p(x,y)=(√|x|+√|y|)² gives a compact nonconvex star body: (1,0),(0,1) lie in it but their midpoint does not.
- `TauCeti.GeometryOfNumbersPlan.compact_star_body_test_3`: A gauge vanishing along a nonzero ray fails the stated definiteness/compactness conditions.

**Source.** Benoist2019, Mahler statement physical p.7 motivates compactness; worker extension for the staged nonconvex star-body target. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Star-body critical determinant and compactness source: Acquire Mahler/Rogers star-body passages and prove the critical-lattice existence/extremal determinant claims under their exact boundedness and boundary hypotheses. The definition here is a worker construction; no convex-body theorem is applied to a nonconvex sublevel.

#### Polar-body transference lower inequality

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/dual-transference-lower` — theorem.

For a full real Euclidean lattice L and symmetric convex body K with nonempty interior, λ_i(K,L)·λ_{n+1−i}(K°,L*)≥1 for 1≤i≤n, where K° is the inner-product polar and L* the pairing-integral dual.

**Hypotheses and conventions.** Use the same inner-product and intrinsic dimension on both sides. The sharp upper transference and covering bounds require separate source theorems; they are not exported by this elementary lower bound.

**Construction or proof.** 1. Choose attained independent families at the two indicated minima. 2. The two spans have dimensions summing to n+1, so the dual family cannot pair to zero with the entire primal span. 3. A nonzero integral pairing has absolute value at least 1; the polar inequality bounds it above by the product of the two minima.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-witnesses`, `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-dual`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.dual_transference_lower_test_1`: For rectangular lattices and reciprocal coordinate boxes the paired products equal 1.
- `TauCeti.GeometryOfNumbersPlan.dual_transference_lower_test_2`: An arbitrary real pairing has no integer ≥1 floor.

**Source.** LLL1982, Proposition 1.11 uses the same integral-coefficient norm floor; transference is a separate worker polar-pairing deduction, not an attributed LLL theorem. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Polar-body carrier and upper transference theorem: Match the actual inner-product polar to a library definition, prove compact convex interior properties and the attained-minima comparison, then acquire the chosen classical/Banaszczyk upper transference theorem and covering constant. The present declaration proves only the lower inequality.

#### Mahler compactness criterion

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/mahler-compactness` — theorem.

For n≥2 and X_n=SL_n(R)/SL_n(Z), the closed set of covolume-one lattices whose shortest nonzero norm is at least epsilon>0 is compact. A subset is relatively compact iff its first minimum is uniformly bounded below away from zero.

**Hypotheses and conventions.** Covolume normalization and closedness for compactness are explicit. Relative compactness does not require the subset itself to be closed.

**Construction or proof.** 1. Use a reduced-basis bound from successive minima and fixed covolume to obtain uniformly bounded representative bases. 2. Extract a convergent matrix subsequence; determinant 1 prevents rank collapse. 3. The converse follows from continuity and positivity of the shortest-vector function. Source proof-local reduced-basis/quotient-topology adapters remain gaps.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`, `AdelicAlgebraicGroups:AA.3`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.mahler_compactness_test_1`: diag(t,t^−1)Z² escapes compact sets as t→∞ because its first minimum tends to 0.
- `TauCeti.GeometryOfNumbersPlan.mahler_compactness_test_2`: A nonclosed subset with a uniform first-minimum bound is relatively compact, but need not be compact.

**Source.** Benoist2019, Fact 1.5, physical p.7. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Mahler bounded basis and quotient topology: Acquire the complete chosen Mahler proof, refine the Hermite/reduced-basis uniform bound already listed in the inherited GN.1 frontier, and prove continuity/compactness in the exact SL quotient topology imported from the group owners.

#### Siegel lattice mean-value theorem

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/siegel-mean-value` — theorem.

For n≥2, invariant probability μ on X_n=SL_n(R)/SL_n(Z), and integrable f:R^n→R, its lattice transform Σ_{v∈L\{0}}f(v) is integrable on X_n and its μ-integral equals the Lebesgue integral of f. For nonnegative measurable f the Tonelli version permits infinity.

**Hypotheses and conventions.** Zero vectors are excluded; μ has total mass 1 and lattices have covolume 1. n=1 is excluded. Integrability of the lattice transform is a theorem, not an assumption silently imported from integrability of f.

**Construction or proof.** 1. Unfold the primitive-vector orbit using quotient Haar measures. 2. Determine the primitive normalization constant and sum over integer multiples of primitive vectors. 3. Use Tonelli then positive/negative parts to obtain the stated L¹ result. The Siegel unfolding/constant/integrability proof is an explicit source gap.

**Prerequisites.** `AdelicAlgebraicGroups:AA.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/mahler-compactness`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.siegel_mean_value_test_1`: Including v=0 adds f(0) and changes the formula.
- `TauCeti.GeometryOfNumbersPlan.siegel_mean_value_test_2`: In dimension one the single lattice Z does not give the Lebesgue mean-value formula.

**Source.** Benoist2019, Physical pp.5–7 invariant lattice-space measure conventions; exact Siegel source remains a recorded acquisition gap. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Original Siegel mean-value proof: Acquire Siegel’s A mean value theorem in geometry of numbers and decompose primitive unfolding, Haar normalization, arithmetic constant and L¹ justification. The current notes supply only the lattice-space/measure input, not that proof.

#### Construction A real-lattice comparison

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/construction-a-real-lattice-interface` — comparison.

For a linear code C⊂F_p^n, import the completed Construction A lattice and identify its unscaled real realization {x∈Z^n:x mod p∈C} with covolume p^{n−dim C}. The rescaled realization p^−1/2L has covolume p^{n/2−dim C}; unimodularity/integrality/evenness require the supplier’s exact self-duality and parity hypotheses.

**Hypotheses and conventions.** p is prime and C is linear; no code-distance statement alone supplies integral Gram conditions. Construction A itself is owned by AlgebraicCodingTheory layer 6.

**Construction or proof.** 1. Import the existing code-to-rational-lattice constructor. 2. Use the exact index p^{n−dim C} and native real scalar extension/covolume comparison. 3. Expose the metric and rescaling adapter; do not define another Construction A carrier.

**Prerequisites.** `tauceti:TauCetiRoadmap/AlgebraicCodingTheory#layer-6-construction-a-with-exact-hypotheses`, `mathlib:ZLattice.covolume`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.construction_a_real_lattice_interface_test_1`: For the zero code, the unscaled lattice is pZ^n and has covolume p^n.
- `TauCeti.GeometryOfNumbersPlan.construction_a_real_lattice_interface_test_2`: For the whole code it is Z^n with covolume 1.

**Source.** Benoist2019, Covolume-one lattice convention physical p.6; mathematical constructor is imported from AlgebraicCodingTheory. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Coding edge and real metric adapter: Resolve the current FF.4 routing against the actual AlgebraicCodingTheory layer-6 constructor. Supply rational-to-real carrier, index/covolume and norm/parity comparisons before deriving an atlas edge from the word code.

#### Euclidean lattice covering radius

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/covering-radius` — definition.

For a full Euclidean lattice L, μ(L)=sup_x inf_{v∈L} ‖x−v‖. It is the maximum of the continuous periodic distance-to-L function on the compact quotient; dimension zero gives zero.

**Hypotheses and conventions.** Finite-dimensional real Euclidean ambient space; L is discrete and spans the ambient space.

**Construction or proof.** 1. Use the native metric distance to the nonempty lattice. 2. Prove periodicity and 1-Lipschitz continuity. 3. Use a compact fundamental domain to obtain boundedness and attainment.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-first`, `mathlib:ZLattice.covolume`, `mathlib:Metric.infEDist`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.latticeCoveringRadius` (constructor): Supremum of the native distance-to-lattice function.
- `TauCeti.GeometryOfNumbersPlan.latticeCoveringRadius_attained` (relation): A point in a compact fundamental domain attains the radius.
- `TauCeti.GeometryOfNumbersPlan.latticeCoveringRadius_smul` (functoriality): Positive scalar multiplication multiplies μ by the same scalar.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.covering_radius_test_1`: For aZ in R with a>0, μ=a/2.
- `TauCeti.GeometryOfNumbersPlan.covering_radius_test_2`: For Z², μ=√2/2, larger than its packing radius 1/2.
- `TauCeti.GeometryOfNumbersPlan.covering_radius_test_3`: In dimension zero μ=0; a non-full-rank subgroup in positive dimension can have infinite ambient covering radius.

**Source.** RegevTransference, p.2, Definition 2 and Example 1. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Euclidean successive-minima transference

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/dual-transference-upper` — theorem.

For a full rank-n Euclidean lattice L, n≥1, and 1≤i≤n, λ_i(L)λ_(n+1−i)(L*)≤n, where L* is defined by integral inner products and both bodies are the Euclidean unit ball.

**Hypotheses and conventions.** The n constant here is Euclidean; it is not asserted for arbitrary polar convex bodies.

**Construction or proof.** 1. Use the original Gaussian/Fourier transference estimate of Banaszczyk; this proof remains an explicit source gap. 2. Transport its ordered minima and reciprocal-lattice conventions to the native finite index and dual-lattice API.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.4/dual-transference-lower`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.dual_transference_upper_test_1`: For aZ in R, the product is one.
- `TauCeti.GeometryOfNumbersPlan.dual_transference_upper_test_2`: For Zⁿ, each product is one and is at most n.
- `TauCeti.GeometryOfNumbersPlan.dual_transference_upper_test_3`: No dimension-independent upper bound is claimed.

**Source.** RegevTransference, p.1, Theorem 1 and Remark 1, citing Banaszczyk 1993. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Original upper transference proof: Acquire Banaszczyk, Math. Ann. 296 (1993), 625–635, and decompose its Gaussian Fourier/Poisson and subspace estimates. The lecture statement has been read; the original full proof has not.

#### Covering radius and reciprocal shortest vector

`GeometryOfNumbersAndQuadraticArithmetic:GN.4/covering-dual-transference` — theorem.

For a full rank-n Euclidean lattice L, n≥1, 1/2≤μ(L)λ_1(L*)≤n. This pass chooses Regev’s weaker uniform upper constant n; it does not claim that the scanned original proof of the sharper n/2 bound has been checked.

**Hypotheses and conventions.** Full rank, positive dimension and the actual Euclidean reciprocal lattice.

**Construction or proof.** 1. For the lower bound use μ(L)≥λ_n(L)/2 (Claim 3) and the reciprocal lower transference theorem. 2. For the upper bound use the Gaussian shifted-lattice mass proof of Theorem 4; its proof remains the named gap.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.4/covering-radius`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/dual-transference-lower`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.covering_dual_transference_test_1`: For aZ in R the product is 1/2.
- `TauCeti.GeometryOfNumbersPlan.covering_dual_transference_test_2`: For Zⁿ the product is √n/2.
- `TauCeti.GeometryOfNumbersPlan.covering_dual_transference_test_3`: An asymptotic 0.1275+o(1) constant from Aggarwal–Stephens-Davidowitz is not a uniform small-rank constant.

**Source.** RegevTransference, p.2, Claim 3 and Theorem 4. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Covering transference Gaussian proof: Read and split Regev Lecture 11 pp.3–6, including shifted Gaussian sum, tail, Poisson summation and final scale choice. The proved Claim 3 is already read; the upper-bound proof is not.

### GN.5

#### Gram–Schmidt reduction coefficients

`GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-coefficient` — definition.

For a real inner-product space and a family b:Fin n→V, set μ_{ij}=⟨b_i,b*_j⟩/‖b*_j‖² using the native ordered gramSchmidt b. Reduced-basis theorems require linear independence so denominators for relevant j are nonzero; the total function still uses the native zero-division convention.

**Hypotheses and conventions.** Indices are zero based; size reduction concerns j<i only. Exact rational Gram data is retained for certified arithmetic; floating approximations do not discharge inequalities.

**Construction or proof.** 1. Call the pinned Gram–Schmidt construction directly. 2. Define the scalar coefficient by the displayed inner-product ratio, consistent with its real-valued convention. 3. Use gramSchmidt_ne_zero to justify denominators for independent input.

**Prerequisites.** `mathlib:InnerProductSpace.gramSchmidt`, `mathlib:InnerProductSpace.gramSchmidt_ne_zero`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.lllCoefficient` (constructor): The native Gram–Schmidt inner-product ratio.
- `TauCeti.GeometryOfNumbersPlan.lllCoefficient_eq` (simp): Evaluation equals the stated ratio.
- `TauCeti.GeometryOfNumbersPlan.lllCoefficient_orthogonal` (relation): Off-diagonal coefficient is zero for an orthogonal family.
- `TauCeti.GeometryOfNumbersPlan.lllCoefficient_denominator_pos` (relation): Independent input gives a strictly positive squared denominator.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.lll_coefficient_test_1`: For b=((1,0),(1/2,1)) the coefficient μ₁₀ is 1/2.
- `TauCeti.GeometryOfNumbersPlan.lll_coefficient_test_2`: For an orthogonal family, off-diagonal reduction coefficients vanish.
- `TauCeti.GeometryOfNumbersPlan.lll_coefficient_test_3`: For dependent input b*_j can be zero; the total coefficient does not certify a reduced basis.

**Source.** LLL1982, §1, (1.2)–(1.3), physical p.2. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### LLL-reduced independent families

`GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-reduced` — definition.

An LLL-reduced family at δ=3/4 is linearly independent, has |μ_{ij}|≤1/2 for j<i, and for each adjacent j<i with i=j+1 satisfies ‖b*_i‖²≥(3/4−μ_{ij}²)‖b*_j‖². A basis of the input lattice is required separately by output certificates.

**Hypotheses and conventions.** The equality boundary is accepted; swaps occur for strict failure. The empty family is reduced by vacuity; positive-rank approximation statements assume n≥1.

**Construction or proof.** 1. Package the actual linear-independence, size and adjacent Lovász conditions as a concrete predicate. 2. Use orthogonality of adjacent Gram–Schmidt vectors to compare with the source norm inequality (1.5). 3. Expose each component without weakening independence or omitting the Lovász test.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-coefficient`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.IsLLLReduced` (constructor): The concrete independence, size and Lovász predicate.
- `TauCeti.GeometryOfNumbersPlan.IsLLLReduced.linearIndependent` (projection): Return independence.
- `TauCeti.GeometryOfNumbersPlan.IsLLLReduced.size` (projection): Return |μ_{ij}|≤1/2 for j<i.
- `TauCeti.GeometryOfNumbersPlan.IsLLLReduced.lovasz` (projection): Return the adjacent δ=3/4 inequality.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.lll_reduced_test_1`: The standard orthonormal basis is reduced.
- `TauCeti.GeometryOfNumbersPlan.lll_reduced_test_2`: The basis ((2,0),(0,1)) has size coefficients zero but fails the Lovász condition.
- `TauCeti.GeometryOfNumbersPlan.lll_reduced_test_3`: The dependent family ((1,0),(2,0)) is not reduced even when a zero-denominator convention makes some inequalities vacuous.

**Source.** LLL1982, §1, (1.4)–(1.5), physical pp.2–3. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Exact integer change-of-basis certificates

`GeometryOfNumbersAndQuadraticArithmetic:GN.5/unimodular-basis-certificate` — definition.

A certificate for input b and output c consists of U,V∈Mat_n(Z), UV=VU=I, and c_i=Σ_j U_{ji}b_j. Columns are output coordinates in the input family. This proves equality of integer spans and determinant ±1; determinant −1 is allowed.

**Hypotheses and conventions.** Input and output families have the same dimension; an input real basis gives an output basis. The certificate matrices are integral, not arbitrary rational or real inverses.

**Construction or proof.** 1. Store the two integer matrices and exact inverse equations with the coordinate identity. 2. Use the reverse matrix to express every b_j in the output span. 3. Use det_mul for the determinant-unit conclusion; real injectivity and rank pass through the inverse maps.

**Prerequisites.** `mathlib:Matrix.det_mul`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.UnimodularBasisCertificate.ofMatrices` (constructor): Supply actual integral inverse matrices and the exact output coordinates.
- `TauCeti.GeometryOfNumbersPlan.UnimodularBasisCertificate.span_eq` (relation): The input and output Z-spans are equal.
- `TauCeti.GeometryOfNumbersPlan.UnimodularBasisCertificate.det_unit` (relation): det U is 1 or −1.
- `TauCeti.GeometryOfNumbersPlan.UnimodularBasisCertificate.trans` (functoriality): Compose certificates by matrix multiplication with the correct column order.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.unimodular_basis_certificate_test_1`: The coordinate swap [[0,1],[1,0]] has determinant −1 and is a valid certificate.
- `TauCeti.GeometryOfNumbersPlan.unimodular_basis_certificate_test_2`: diag(2,1) is not an integer-invertible basis change.
- `TauCeti.GeometryOfNumbersPlan.unimodular_basis_certificate_test_3`: A floating matrix approximately inverting U does not inhabit this certificate.

**Source.** LLL1982, Algorithm (1.15), size reductions and adjacent swaps, physical pp.5–7; certificate format is a worker verification interface. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Growth bound for reduced orthogonal lengths

`GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-gram-schmidt-growth` — lemma.

For an LLL-reduced family and j<i, ‖b*_j‖²≤2^{i−j}‖b*_i‖².

**Hypotheses and conventions.** Fin-index differences are ordinary nonnegative integer differences.

**Construction or proof.** 1. Size reduction gives μ²≤1/4; substitute into Lovász to get ‖b*_{k+1}‖²≥(1/2)‖b*_k‖². 2. Iterate this nonnegative adjacent inequality along the finite interval.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-reduced`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.lll_gram_schmidt_growth_test_1`: For orthonormal input the right-hand side is at least the left-hand side.
- `TauCeti.GeometryOfNumbersPlan.lll_gram_schmidt_growth_test_2`: The exponent is an index difference, not the full ambient dimension.

**Source.** LLL1982, Proof of Proposition 1.6, physical p.3. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### LLL shortest-vector approximation bound

`GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-short-vector-factor` — theorem.

For n≥1 and an LLL-reduced basis b of a full real Euclidean Z-lattice L, every nonzero x∈L satisfies ‖b₀‖²≤2^{n−1}‖x‖². Equivalently b₀ is within factor 2^{(n−1)/2} of the shortest nonzero vector.

**Hypotheses and conventions.** L-membership is in the exact integer span of b, not the real span. This is an approximation bound; it does not assert exact SVP or CVP.

**Construction or proof.** 1. Expand x with integer coordinates and choose its largest nonzero coordinate index k. Its absolute coefficient is at least one. 2. Project to b*_k to obtain ‖x‖²≥‖b*_k‖². 3. Apply the reduced orthogonal-length growth bound from k to the first vector and enlarge 2^k to 2^{n−1}.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-reduced`, `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-gram-schmidt-growth`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.lll_short_vector_factor_test_1`: For n=1 the factor is 1 and the basis vector is shortest.
- `TauCeti.GeometryOfNumbersPlan.lll_short_vector_factor_test_2`: Replacing integer coordinates by real coefficients destroys the lower bound on the last nonzero coefficient.

**Source.** LLL1982, Proposition 1.11 and its proof, physical p.4. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Integer Gram-prefix potential

`GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-integer-potential` — definition.

For independent integer-column input in Euclidean R^n, let d_i be the determinant of the Gram matrix of the first i vectors, d₀=1, and D=∏_{1≤i<n} d_i. Each d_i is a positive integer; in ranks 0 and 1 the empty potential is 1.

**Hypotheses and conventions.** The metric is the standard integral Gram metric, or a specified positive-definite rational Gram metric cleared by a common denominator. For arbitrary real Gram data integrality of the potential is not claimed.

**Construction or proof.** 1. Use the native Gram matrix and determinant on each prefix. 2. Gram nondegeneracy makes each determinant positive; integral input gives an integer determinant. 3. Form the finite product and expose the size-reduction/swap transformation laws.

**Prerequisites.** `mathlib:Matrix.gram`, `mathlib:Matrix.det_mul`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.lllIntegerPotential` (constructor): Product of positive integral Gram-prefix determinants.
- `TauCeti.GeometryOfNumbersPlan.lllIntegerPotential_pos` (relation): The potential is a positive integer for independent integral input.
- `TauCeti.GeometryOfNumbersPlan.lllIntegerPotential_sizeReduce` (compatibility): An integer shear within the relevant prefix preserves the potential.
- `TauCeti.GeometryOfNumbersPlan.lllIntegerPotential_swap` (relation): A strict Lovász-failing adjacent swap decreases the potential by a factor strictly below 3/4.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.lll_integer_potential_test_1`: The standard basis has all prefix determinants and potential equal to 1.
- `TauCeti.GeometryOfNumbersPlan.lll_integer_potential_test_2`: A rational metric with denominator 2 needs a fixed rescaling; its original determinants are not asserted to be integers.
- `TauCeti.GeometryOfNumbersPlan.lll_integer_potential_test_3`: In ranks 0 and 1 the empty potential is 1, and no adjacent swap exists.

**Source.** LLL1982, (1.23)–(1.25), physical pp.7–8. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Exact terminating LLL reduction

`GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-exact-reduction` — construction.

Given a nonsingular integer basis matrix (or rational input cleared by a common denominator) in the standard Euclidean metric, compute a reduced output basis together with an exact unimodular-basis certificate. Use nearest-integer size reduction and strict Lovász-failing adjacent swaps at δ=3/4.

**Hypotheses and conventions.** Rank 0 and rank 1 return immediately with the identity certificate. Rounding ties use a fixed nearest-integer rule satisfying distance≤1/2. The polynomial complexity theorem is not supplied here; its proof continues beyond the selected p.8 source slice.

**Construction or proof.** 1. Use the source prefix invariant and exact Gram–Schmidt update equations to specify one shear/swap transition. 2. Every update is an integer shear or permutation, so compose its certificate. 3. Strict swaps decrease the positive integer potential; between swaps the index advances through a finite interval. This gives termination via a lexicographic potential/index measure. 4. The complete executable transition and invariant-preservation proof remains an explicit refinement gap; it is not replaced by an oracle that assumes a reduced output exists.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-reduced`, `GeometryOfNumbersAndQuadraticArithmetic:GN.5/unimodular-basis-certificate`, `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-integer-potential`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.exactLLL` (constructor): Return output coordinates, reducedness and the exact integer inverse certificate.
- `TauCeti.GeometryOfNumbersPlan.exactLLL_certificate` (projection): Recover the original-lattice certificate.
- `TauCeti.GeometryOfNumbersPlan.exactLLL_reduced` (projection): Recover the exact size and Lovász tests.
- `TauCeti.GeometryOfNumbersPlan.exactLLL_shortVector` (relation): For positive rank, the first vector satisfies the proven approximation inequality in the original lattice.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.lll_exact_reduction_test_1`: Input columns (2,0),(0,1) require a swap; the returned certificate may have determinant −1.
- `TauCeti.GeometryOfNumbersPlan.lll_exact_reduction_test_2`: Rank zero returns an empty reduced basis and empty identity matrices.
- `TauCeti.GeometryOfNumbersPlan.lll_exact_reduction_test_3`: An output without a proven Lovász condition is rejected even if short in floating-point arithmetic.

**Source.** LLL1982, Algorithm (1.15), updates (1.22), Figure 1, termination proof, physical pp.5–8. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** LLL transition and invariant refinements: Separate nearest-integer shear, adjacent-swap Gram updates, prefix invariant preservation, positive integer potential and lexicographic termination into proof-local declarations. The source pp.5–8 is read, but these algorithm invariants are not yet decomposed at implementation granularity. Complexity Proposition 1.26 is only statement-read; no complexity guarantee is exported.

#### Verify the short output in the original lattice

`GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-original-lattice-verification` — theorem.

If a certified output c is LLL-reduced and b is an independent input basis of L, then c₀∈L is nonzero and for every nonzero x∈L, ‖c₀‖²≤2^{n−1}‖x‖², for n≥1.

**Hypotheses and conventions.** The metric used by reduction and verification is the same exact Euclidean or specified rational Gram metric. Arithmetic height, relation exclusion and representation conditions are consumer-owned inputs.

**Construction or proof.** 1. Use the unimodular certificate to identify the two integer spans. 2. Independence gives c₀≠0. 3. Apply the preceding LLL bound to c and transport x-membership back through span equality.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.5/unimodular-basis-certificate`, `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-reduced`, `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-short-vector-factor`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.lll_original_lattice_verification_test_1`: A verified certificate includes both original membership and the approximation factor.
- `TauCeti.GeometryOfNumbersPlan.lll_original_lattice_verification_test_2`: A short vector in the real span but outside the integer span cannot pass verification.

**Source.** LLL1982, Proposition 1.11 plus exact shear/swap lattice preservation, physical pp.4–8. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

### GN.6

#### Strong duality on a category

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/strong-category-duality` — definition.

A strong duality on a category C is a functor D:Cᵒᵖ→C and a natural isomorphism η:Id_C→D D with D(η_X)∘η_{DX}=id_{DX}. This is classical categorical duality, distinct from a stable Poincaré infinity-category.

**Hypotheses and conventions.** C uses its existing category structure; opposite functors have the pinned map direction. Exactness and additivity are extra properties, not empty proposition fields standing in for them.

**Construction or proof.** 1. Use the native opposite category, functor and natural isomorphism. 2. State and retain the double-dual coherence equation. 3. Use coherence and η to recover the contravariant equivalence; do not replace the category by an untyped involution on objects.

**Prerequisites.** `mathlib:CategoryTheory.Functor.rightOp`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.StrongCategoryDuality` (constructor): The actual contravariant functor, natural isomorphism and coherence equation.
- `TauCeti.GeometryOfNumbersPlan.StrongCategoryDuality.dual` (projection): Return D:Cᵒᵖ→C.
- `TauCeti.GeometryOfNumbersPlan.StrongCategoryDuality.biddual` (projection): Return the natural double-dual isomorphism.
- `TauCeti.GeometryOfNumbersPlan.StrongCategoryDuality.coherence` (relation): D(η_X)η_{DX}=id_{DX}.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.strong_category_duality_test_1`: Identity double-dual data on a discrete one-object category is a strong duality.
- `TauCeti.GeometryOfNumbersPlan.strong_category_duality_test_2`: The functor reverses morphism composition.
- `TauCeti.GeometryOfNumbersPlan.strong_category_duality_test_3`: A natural transformation that is not invertible gives the source’s weak duality, not this strong-duality structure.

**Source.** Schlichting2010, Definition 2.1 and Definition 3.1, printed pp.109,113. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Exact category with strong duality

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-category-duality` — construction.

On an existing TauCeti.ExactStructure on a preadditive category E, equip a strong duality D that is additive and sends each conflation X→Y→Z to the reversed dual conflation DZ→DY→DX. The coefficient sign −η gives the alternating variant when D is additive.

**Hypotheses and conventions.** Use the completed intrinsic ExactStructure carrier and conflation-exact functors. No assumption 2 is invertible is required for this classical exact-category construction.

**Construction or proof.** 1. Import the exact structure rather than duplicating Quillen axioms. 2. Prove the dual functor preserves the actual conflation class with its contravariant order. 3. Use additivity to verify the coherence of −η and the skew/symmetric conversion.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/strong-category-duality`, `tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-0-intrinsic-exact-structures-and-conflation-exact-functors`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.ExactCategoryDuality.ofExactFunctor` (constructor): An additive conflation-exact strong duality on the existing exact category.
- `TauCeti.GeometryOfNumbersPlan.ExactCategoryDuality.dualConflation` (functoriality): Reverse a conflation to its dual conflation.
- `TauCeti.GeometryOfNumbersPlan.ExactCategoryDuality.signTwist` (constructor): The sign-twisted duality with double dual −η.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.exact_category_duality_test_1`: Finite projective R-modules with Hom_R(−,R) form the split exact example; arbitrary finite modules need not have invertible biduality.
- `TauCeti.GeometryOfNumbersPlan.exact_category_duality_test_2`: Over Z the hyperbolic symmetric plane is available without 1/2.
- `TauCeti.GeometryOfNumbersPlan.exact_category_duality_test_3`: Changing η to −η changes the symmetry equation and does not identify symmetric and quadratic refinements at 2.

**Source.** Schlichting2010, Definition 2.1, Example 2.2 and §2.4, printed pp.109–110. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Nondegenerate symmetric spaces

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/symmetric-space` — definition.

For strong duality (D,η), a symmetric space is (X,φ) with an isomorphism φ:X→DX satisfying D(φ)η_X=φ. A form-preserving map f:X→Y satisfies φ_X=D(f)φ_Y f; an isometry is such a map whose underlying morphism is an isomorphism.

**Hypotheses and conventions.** Nondegeneracy is an isomorphism, not merely a separating form over a ring. Symplectic spaces use the sign-twisted duality; a quadratic refinement is additional data at dyadic coefficients.

**Construction or proof.** 1. Bundle the object and actual pairing isomorphism with its typed coherence equation. 2. Define form-preserving morphisms using native categorical composition. 3. Use identity/composition and inverses to form the isometry groupoid.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/strong-category-duality`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.SymmetricSpace` (constructor): Object, pairing isomorphism and typed symmetry equation.
- `TauCeti.GeometryOfNumbersPlan.SymmetricSpace.pairing` (projection): The actual map X≅DX.
- `TauCeti.GeometryOfNumbersPlan.SymmetricSpace.preserves` (characterisation): Form-preservation is the displayed categorical equation.
- `TauCeti.GeometryOfNumbersPlan.SymmetricSpace.preserves_id` (simp): Identity preserves a symmetric space.
- `TauCeti.GeometryOfNumbersPlan.SymmetricSpace.preserves_comp` (functoriality): The composite of form-preserving maps preserves the forms.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.symmetric_space_test_1`: The rank-one pairing xy on Z is nondegenerate; 2xy is separating but not a pairing isomorphism over Z.
- `TauCeti.GeometryOfNumbersPlan.symmetric_space_test_2`: The identity map preserves every symmetric space.
- `TauCeti.GeometryOfNumbersPlan.symmetric_space_test_3`: A noninvertible form-preserving map is not called an isometry.

**Source.** Schlichting2010, Definition 2.4 and §3.1, printed pp.110,113. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Admissible Lagrangians

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-lagrangian` — definition.

A Lagrangian of (X,φ) is an admissible inflation i:L→X such that L→X→DL, with second map D(i)φ, is a conflation. Thus L is its own orthogonal, in the actual exact structure. A space is metabolic when a Lagrangian exists.

**Hypotheses and conventions.** An arbitrary isotropic submodule is not automatically admissible. An exact Lagrangian specifies the quotient and conflation, not only a rank equality.

**Construction or proof.** 1. Use the native conflation class and duality map to specify the short exact sequence. 2. Recover isotropy from composition zero and orthogonal equality from kernel exactness. 3. Transport the conflation through an isometry.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/symmetric-space`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-category-duality`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.ExactLagrangian.ofConflation` (constructor): A conflation L→X→DL with the displayed second map.
- `TauCeti.GeometryOfNumbersPlan.ExactLagrangian.isotropic` (relation): D(i)φi=0.
- `TauCeti.GeometryOfNumbersPlan.ExactLagrangian.mapIsometry` (functoriality): An isometry transports the admissible Lagrangian.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.exact_lagrangian_test_1`: The first summand of the hyperbolic plane is a Lagrangian.
- `TauCeti.GeometryOfNumbersPlan.exact_lagrangian_test_2`: 2Z⊂Z is not an admissible summand in the split exact category of projectives.
- `TauCeti.GeometryOfNumbersPlan.exact_lagrangian_test_3`: An isotropic subobject of too small a rank is not a Lagrangian.

**Source.** Schlichting2010, Definition 2.5, printed p.110. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Hyperbolic symmetric space

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/hyperbolic-space` — construction.

For X in an exact category with duality, H(X) has underlying object X⊕DX and pairing matrix [[0,1],[η_X,0]] to DX⊕DDX, with its actual biproduct identifications. The inclusion of X is an admissible Lagrangian.

**Hypotheses and conventions.** No division by 2 is used. The exact category’s split biproduct conflation is imported.

**Construction or proof.** 1. Form the native biproduct and the off-diagonal pairing. 2. Use η coherence to prove symmetry and invertibility. 3. Identify the standard biproduct conflation as the Lagrangian sequence.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-category-duality`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/symmetric-space`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-lagrangian`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.hyperbolicSpace` (constructor): The native biproduct with the off-diagonal perfect pairing.
- `TauCeti.GeometryOfNumbersPlan.hyperbolicSpace_lagrangian` (projection): The first summand is an admissible Lagrangian.
- `TauCeti.GeometryOfNumbersPlan.hyperbolicSpace_sum` (compatibility): Hyperbolic construction carries sums to orthogonal sums.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.hyperbolic_space_test_1`: Over Z, H(Z) has Gram [[0,1],[1,0]] and is even unimodular.
- `TauCeti.GeometryOfNumbersPlan.hyperbolic_space_test_2`: H(0) is the zero symmetric space.
- `TauCeti.GeometryOfNumbersPlan.hyperbolic_space_test_3`: H(X⊕Y) is isometric to H(X)⊥H(Y).

**Source.** Schlichting2010, After Definition 2.5, printed p.110. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Isotropic reduction of a symmetric space

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/isotropic-reduction` — construction.

For an admissible totally isotropic L⊂X with L⊂L⊥ also an inflation, there is a unique nondegenerate symmetric form on L⊥/L pulling back to the restricted form. X⊥−(L⊥/L) is metabolic with Lagrangian L⊥.

**Hypotheses and conventions.** Both admissibility conditions are retained. The quotient is the exact-category quotient of the specified conflation.

**Construction or proof.** 1. Use kernel/cokernel universal properties to factor the restricted pairing through the quotient in both arguments. 2. Use epimorphism cancellation to prove symmetry. 3. Build the source conflation into X⊕(L⊥/L) and apply the exact five-lemma to prove nondegeneracy and metabolicity.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-lagrangian`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/symmetric-space`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-category-duality`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.isotropicReduction` (constructor): The unique induced perfect symmetric quotient form.
- `TauCeti.GeometryOfNumbersPlan.isotropicReduction_pullback` (characterisation): Its pullback is the restricted pairing.
- `TauCeti.GeometryOfNumbersPlan.isotropicReduction_metabolic` (relation): X⊥−reduction is metabolic.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.isotropic_reduction_test_1`: For L=0 the quotient is X and X⊥−X is metabolic.
- `TauCeti.GeometryOfNumbersPlan.isotropic_reduction_test_2`: For a Lagrangian L the quotient L⊥/L is zero.
- `TauCeti.GeometryOfNumbersPlan.isotropic_reduction_test_3`: For a nonadmissible inclusion the quotient construction cannot be invoked.

**Source.** Schlichting2010, Lemma 2.6 and complete proof, printed pp.110–111. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Exact quotient and five-lemma adapters: Match the native exact subobject quotient, induced dual quotient map and exact five-lemma to the pinned completed ExactStructure API. The source proof is read; no private exact-category carrier is substituted.

#### Degree-zero Grothendieck–Witt group of an exact category

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-grothendieck-witt-group` — construction.

GW₀(E) is the group completion of isometry classes of nondegenerate symmetric spaces modulo [M]=[H(L)] for every metabolic M with an admissible Lagrangian L. Orthogonal sum is addition. This extra relation is essential in a nonsplit exact category.

**Hypotheses and conventions.** E is essentially small with its intrinsic exact structure and strong exact duality. Degree-zero field Witt/GW theory is imported from QuadraticFormInvariants; this declaration supplies the general exact-category extension and the comparison.

**Construction or proof.** 1. Take a small skeleton of symmetric spaces and the native free abelian group on its isometry classes. 2. Quotient by orthogonal-sum and metabolic/hyperbolic relations. 3. Prove choice independence and the universal property for additive invariants satisfying the metabolic relation.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/symmetric-space`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-lagrangian`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hyperbolic-space`, `mathlib:FreeAbelianGroup`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.ExactGrothendieckWittGroup` (constructor): The presented additive group.
- `TauCeti.GeometryOfNumbersPlan.ExactGrothendieckWittGroup.ofSpace` (constructor): The generator class of a symmetric space.
- `TauCeti.GeometryOfNumbersPlan.ExactGrothendieckWittGroup.orthogonalSum` (simp): Orthogonal sum becomes addition.
- `TauCeti.GeometryOfNumbersPlan.ExactGrothendieckWittGroup.metabolic` (relation): [M]=[H(L)] for an admissible Lagrangian.
- `TauCeti.GeometryOfNumbersPlan.ExactGrothendieckWittGroup.lift` (universal-property): Descend exactly the additive invariants satisfying the metabolic relation.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.exact_grothendieck_witt_group_test_1`: A metabolic space with Lagrangian L has the same GW class as H(L).
- `TauCeti.GeometryOfNumbersPlan.exact_grothendieck_witt_group_test_2`: Over a split exact projective category, stable metabolic cancellation yields the usual group completion.
- `TauCeti.GeometryOfNumbersPlan.exact_grothendieck_witt_group_test_3`: Over Z the symmetric and quadratic-refined group presentations are not conflated.

**Source.** Schlichting2010, §2.2, printed p.111. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Witt group of an exact category

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-witt-group` — construction.

W₀(E) is the monoid of symmetric-space isometry classes modulo metabolic spaces. It is a group because X⊥−X has the diagonal as an admissible Lagrangian. Equivalently it is the quotient of GW₀(E) by hyperbolic classes.

**Hypotheses and conventions.** The diagonal Lagrangian proof uses the actual perfect pairing and split exactness of its short sequence.

**Construction or proof.** 1. Define the metabolic quotient using actual symmetric spaces. 2. Use X⊥−X to exhibit the inverse class. 3. Compare the quotient presentation with GW₀ modulo the image of the hyperbolic map.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-grothendieck-witt-group`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-lagrangian`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hyperbolic-space`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-1-hyperbolic-planes-and-witt-theory`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.ExactWittGroup` (constructor): The metabolic quotient group.
- `TauCeti.GeometryOfNumbersPlan.ExactWittGroup.ofSpace` (constructor): The Witt class of a symmetric space.
- `TauCeti.GeometryOfNumbersPlan.ExactWittGroup.metabolic_eq_zero` (simp): Metabolic spaces have zero class.
- `TauCeti.GeometryOfNumbersPlan.ExactWittGroup.neg` (relation): Negating the pairing gives the additive inverse.
- `TauCeti.GeometryOfNumbersPlan.ExactWittGroup.fieldComparison` (compatibility): For fields in the existing owner’s scope, recover its Witt group.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.exact_witt_group_test_1`: A hyperbolic plane has zero Witt class.
- `TauCeti.GeometryOfNumbersPlan.exact_witt_group_test_2`: The inverse of [X,φ] is [X,−φ].
- `TauCeti.GeometryOfNumbersPlan.exact_witt_group_test_3`: W=GW is false: over R the hyperbolic plane has nonzero rank in GW but zero Witt class.

**Source.** Schlichting2010, §2.2 and Lemma 2.8, printed pp.111–112. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Hyperbolic and forgetful maps in degree zero

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/hyperbolic-forgetful-relations` — theorem.

Forgetting gives F:GW₀(E)→K₀(E), and H:K₀(E)→GW₀(E) is induced by X↦H(X). Their composite F H sends [X] to [X]+[DX], rather than universally to 2[X]. The sequence K₀(E)→GW₀(E)→W₀(E)→0 is exact.

**Hypotheses and conventions.** K₀ is the imported exact Grothendieck group. The duality involution can act nontrivially on K₀; multiplication by two is only a specialization when it acts trivially.

**Construction or proof.** 1. The underlying metabolic conflation has class [L]+[DL], so F respects the relation. 2. Lemma 2.8(b) makes H respect conflations. 3. Compute F H on generators and identify the Witt presentation as the cokernel of H.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-grothendieck-witt-group`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-witt-group`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hyperbolic-space`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.hyperbolic_forgetful_relations_test_1`: Over a field with trivial rank-duality action, F H doubles rank.
- `TauCeti.GeometryOfNumbersPlan.hyperbolic_forgetful_relations_test_2`: The hyperbolic image maps to zero in W₀.
- `TauCeti.GeometryOfNumbersPlan.hyperbolic_forgetful_relations_test_3`: For a nontrivial K₀ involution, the equation is 1+D and cannot be simplified without proof.

**Source.** Schlichting2010, Lemma 2.8 and proof, printed p.112. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Hermitian Q-construction

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-q-construction` — construction.

Qʰ(E) has symmetric spaces as objects. A morphism X→Y is an isomorphism class of spans X←p U→i Y with p an admissible deflation and i an admissible inflation, satisfying the matching restricted pairings and ker p≅ker(D(i)φ_Y). Equivalently the corresponding pairing square is bicartesian. Composition is the imported Q pullback composition.

**Hypotheses and conventions.** Use the actual pairing square and exact-category quotient data; not every ordinary Q-span lifts.

**Construction or proof.** 1. Import Quillen Q and its span equivalence and pullback composition. 2. Restrict to the hermitian bicartesian pairing condition. 3. Prove the condition survives composition and equivalence of representatives; expose the forgetful functor to Q(E).

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/symmetric-space`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-category-duality`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/isotropic-reduction`, `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.HermitianQ` (constructor): The native category of hermitian Q-spans.
- `TauCeti.GeometryOfNumbersPlan.HermitianQ.ofSpan` (constructor): A span with its actual bicartesian pairing condition.
- `TauCeti.GeometryOfNumbersPlan.HermitianQ.forget` (functoriality): Forget the pairings to the existing Q-construction.
- `TauCeti.GeometryOfNumbersPlan.HermitianQ.identity` (simp): Identity is the identity span.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.hermitian_q_construction_test_1`: A Lagrangian gives a Qʰ path from zero to its metabolic space.
- `TauCeti.GeometryOfNumbersPlan.hermitian_q_construction_test_2`: The identity span gives the identity morphism.
- `TauCeti.GeometryOfNumbersPlan.hermitian_q_construction_test_3`: A Q-span with incompatible pairing or wrong kernel is not a hermitian morphism.

**Source.** Schlichting2010, Definition 4.1 and §4.1, printed pp.116–117. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Hermitian span composition refinements: Decompose bicartesian-square equivalence, pullback closure, representative independence and category laws using the supplier Q-construction and completed exact structure. Definition 4.1 is read, but this construction has not been refined to all proof-local lemmas.

#### Grothendieck–Witt space of an exact category

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/grothendieck-witt-space` — construction.

GW(E) is the pointed homotopy fibre over the zero object of |Qʰ(E)|→|Q(E)|.

**Hypotheses and conventions.** Use actual nerve realization, homotopy fibre and homotopy groups from the topology owners. No assumption 2 is invertible is needed for Schlichting’s exact-category model.

**Construction or proof.** 1. Realize the nerves of the typed forgetful functor. 2. Take its pointed homotopy fibre with the zero-space base point. 3. Transport orthogonal sum to the homotopy groups and prove naturality for nonsingular exact form functors.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-q-construction`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.grothendieckWittSpace` (constructor): The specified pointed homotopy fibre.
- `TauCeti.GeometryOfNumbersPlan.grothendieckWittSpace_fibration` (relation): GW(E)→|QʰE|→|QE| is the defining fibre sequence.
- `TauCeti.GeometryOfNumbersPlan.grothendieckWittSpace_map` (functoriality): Nonsingular exact form functors induce pointed maps.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.grothendieck_witt_space_test_1`: The base point is the zero object, not an arbitrary unrecorded form.
- `TauCeti.GeometryOfNumbersPlan.grothendieck_witt_space_test_2`: For the hyperbolic category HE, GW(HE)≃K(E).
- `TauCeti.GeometryOfNumbersPlan.grothendieck_witt_space_test_3`: GW_i is a homotopy degree; a four-periodic shifted-duality statement does not say GW_i≅GW_{i+4}.

**Source.** Schlichting2010, Definition 4.4 and Definition 4.12, printed pp.117–118,122. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Classical hermitian homotopy-fibre carrier: Match small nerve realization, pointed homotopy fibre and orthogonal-sum H-space structures to topology/K-theory supplier nodes before prototyping this construction. No spectrum or homotopy fibre is represented by an empty Prop-valued field.

#### Degree-zero comparison for the GW space

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/grothendieck-witt-space-components` — comparison.

There is a natural additive isomorphism π₀GW(E)≅GW₀(E) with the previously defined metabolic presentation, compatible with forgetful and hyperbolic maps.

**Hypotheses and conventions.** Essentially small exact category with strong exact duality; no 1/2 assumption.

**Construction or proof.** 1. Use formations to identify π₁|QʰE| and W₀(E) to identify π₀|QʰE|. 2. Compare the fibre long exact sequence with GW_form→K₀→GW₀→W₀→0. 3. Apply the source five-lemma argument; the formation presentation and its path-loop proof are recorded refinements.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/grothendieck-witt-space`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-grothendieck-witt-group`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-witt-group`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.grothendieck_witt_space_components_test_1`: The comparison respects the hyperbolic image of an actual exact object.
- `TauCeti.GeometryOfNumbersPlan.grothendieck_witt_space_components_test_2`: The degree-zero class is the metabolic GW presentation, not just unconstrained free isometry classes.

**Source.** Schlichting2010, Proposition 4.11 and full proof, printed pp.121–122. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Formation and low-homotopy refinement: Split Schlichting §4.3 formation generators/relations, Proposition 4.9’s path-loop isomorphism, Lemma 4.10 and the exact five-lemma into proof-local nodes. Their source pp.119–122 is read; this pass records the precise comparison inputs rather than asserting they are implemented.

#### Canonical residue duality coefficient

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-residue-duality-line` — comparison.

For a Dedekind ring R, nonzero prime p and line bundle M with involution, the right adjoint residue dual coefficient RHom_R(R/p,M) is canonically (p^−1M/M)[−1]. A choice of uniformizer identifies p^−1M/M with M/pM; this last identification is not canonically natural under ramified base change.

**Hypotheses and conventions.** Use derived Hom with its actual shift and residue-module structure. A uniformizer choice is recorded when replacing the canonical coefficient by the unshifted residue line.

**Construction or proof.** 1. Resolve R/p by [p→R] and apply derived Hom into M. 2. Use invertibility of p and M to identify the cofiber M→p^−1M and the shift. 3. Multiply by a chosen local uniformizer for the optional residue-line identification.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/grothendieck-witt-space`, `GeneralAlgebraicKTheory:K.6`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.dedekind_residue_duality_line_test_1`: The residue term has a −1 duality shift, not degree zero.
- `TauCeti.GeometryOfNumbersPlan.dedekind_residue_duality_line_test_2`: For Z→Z[i] at 2, the integer 2 does not become a uniformizer at (1+i), so the naive residue-field identity is not the induced map.

**Source.** CalmesIII, Lemma 2.2.2 and proof, physical p.37. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Derived duality carrier owned by HermitianKTheoryOfPoincareCategories: Import the routed stable Poincaré/flavour and derived-duality framework from the new HermitianKTheoryOfPoincareCategories design. No packet/stage yet exists at this base, so no fictitious supplier node is invented. Match its actual derived Hom and line-with-involution types before prototyping this comparison.

#### Symmetric Grothendieck–Witt localization for Dedekind rings

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-symmetric-localization` — theorem.

For R,M as above, a set S of nonzero primes and every duality shift r, there is a canonical fibre sequence ⊕_{p∈S}GW(R/p;Q^s_{RHom_R(R/p,M)}[r])→GW(R;Q^s_M[r])→GW(R_S;Q^s_{M_S}[r]). With chosen uniformizers the left coefficient is (M/pM)[r−1].

**Hypotheses and conventions.** This is the symmetric Poincaré flavour at the spectrum level. No 2-unit assumption is imposed for this theorem; the analogous quadratic spectrum sequence fails at dyadic primes without additional restrictions.

**Construction or proof.** 1. Use the residue-duality-line comparison. 2. Apply the source symmetric dévissage equivalence on torsion perfect complexes and its canonical localization. 3. For infinite S pass through finite subsets using the imported filtered-colimit compatibility. Source generic surgery/Poincaré localization and Witt dévissage remain exact inputs.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-residue-duality-line`, `GeneralAlgebraicKTheory:K.6`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.dedekind_symmetric_localization_test_1`: The left shift is r−1 after a uniformizer choice.
- `TauCeti.GeometryOfNumbersPlan.dedekind_symmetric_localization_test_2`: Quadratic L-theory at the prime 2 cannot simply replace symmetric L-theory in this sequence.

**Source.** CalmesIII, Theorem 2.2.4, Corollary 2.2.5 and Remark 2.2.6, physical pp.38–39. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Symmetric dévissage framework and original inputs: Import generic GW/L fibre and localization from HermitianKTheoryOfPoincareCategories once its design has named nodes; import Quillen/Barwick ordinary K inputs from their owners. Acquire QSS79 symmetric Witt dévissage and refine the exact comparison; Calmes pp.38–39 proves the reduction using these inputs, not their proofs.

#### Hermitian filtering localization

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/schlichting-filtering-localization` — theorem.

For a duality-preserving s-filtering inclusion A⊂U of exact categories with strong duality, with A idempotent complete, |QʰA|→|QʰU|→|Qʰ(U/A)| is a pointed homotopy fibre sequence over zero.

**Hypotheses and conventions.** The four source s-filtering conditions and idempotent completeness are retained. The map W₀(U)→W₀(U/A) need not be surjective.

**Construction or proof.** 1. Import the actual exact quotient by weak isomorphisms from ordinary exact K-theory. 2. Descend the exact duality and pairing square to the quotient. 3. Apply the source hermitian localization proof, with its zero-component/base-point control; the full §8 proof is a gap.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-q-construction`, `GeneralAlgebraicKTheory:K.6`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.schlichting_filtering_localization_test_1`: A fully exact inclusion without the four s-filtering conditions is not enough.
- `TauCeti.GeometryOfNumbersPlan.schlichting_filtering_localization_test_2`: Idempotent completeness of A is an explicit hypothesis.

**Source.** Schlichting2010, §8.1, Theorem 8.2 and Remark 8.3, printed pp.140–141. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** s-filtering quotient and full Schlichting localization proof: Match each of the four filtering/special inflation/deflation conditions and the exact quotient to GeneralAlgebraicKTheory, then read and decompose Schlichting §8 pp.141–149. Only its statement and setup were read here; no characteristic restriction is invented.

#### Source-scoped shifted Karoubi periodicity

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/shifted-karoubi-periodicity` — comparison.

For a dg category with weak equivalences and duality whose mapping complexes are uniquely 2-divisible, the shifted classical GW spectra satisfy GW^[r+4](A)≃GW^[r](A), and the forgetful/hyperbolic Bott triangle is GW^[r](A)→K(A)→GW^[r+1](A)→ΣGW^[r](A). This shifts the duality index, not the higher homotopy degree.

**Hypotheses and conventions.** The dg model, weak equivalences and pretriangulated/smallness conventions are those of Schlichting. This theorem does not assert integral four-periodicity for genuine symmetric GW at dyadic coefficients.

**Construction or proof.** 1. Import ordinary K and the routed generic hermitian Bott/periodicity framework. 2. Prove the classical dg versus stable-Poincaré comparison under unique 2-divisibility. 3. Transport the source Bott triangle and shifted-duality equivalence through that comparison; full §6 source proofs are explicit gaps.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/grothendieck-witt-space`, `GeneralAlgebraicKTheory:K.4:construction`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.shifted_karoubi_periodicity_test_1`: The equality relates shift r with r+4 while keeping homotopy degree fixed.
- `TauCeti.GeometryOfNumbersPlan.shifted_karoubi_periodicity_test_2`: The hypothesis 2 invertible cannot be removed by citing the characteristic-free exact-category definitions.

**Source.** SchlichtingDerived, Introduction, physical pp.2–4; Theorems 6.1–6.2 are announced here. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Classical dg comparison and Karoubi proof: Read Schlichting §6 and the precise dg duality construction, then import the generic Poincaré Bott/Genauer theory from its routed owner rather than duplicating it. Unique 2-divisibility remains an explicit theorem hypothesis.

#### Number-ring homotopy-limit comparison

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/number-ring-homotopy-limit` — theorem.

For a Dedekind ring R whose fraction field is a number field, a line bundle M with involution ±1 and any duality shift r, GW(R;Q^s_M[r])→K(R;Q^s_M[r])^{hC₂} is a 2-adic equivalence. Its classical symmetric connective-cover specialization is an equivalence in nonnegative degrees after 2-completion.

**Hypotheses and conventions.** Do not replace 2-adic completion by localization at 2 or claim an integral equivalence in the presence of real embeddings. The generic spectrum/homotopy-fixed-point carrier is imported from the new hermitian owner.

**Construction or proof.** 1. Invert 2 in R and use the imported finite-vcd₂ homotopy-limit theorem. 2. Compare the finite sum of dyadic residue terms using the even-finite-field theorem. 3. Use symmetric localization and the fibre-sequence comparison to recover the middle 2-adic equivalence.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-symmetric-localization`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.number_ring_homotopy_limit_test_1`: A number ring with real places requires 2-completion; the rational signature contribution prevents the unqualified integral statement.
- `TauCeti.GeometryOfNumbersPlan.number_ring_homotopy_limit_test_2`: Classical connective groups give the nonnegative-degree specialization.

**Source.** CalmesIII, Theorem 3.1.7 and full proof, physical pp.51–52. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Even finite-field comparison and finite-vcd₂ theorem: Import the original finite-vcd₂ BKSØ homotopy-limit theorem, Quillen finite-field K calculation and the generic hermitian pullback from their owners; refine Calmes Proposition 3.1.4’s even-field L/Tate comparison. The selected Calmes source reduction is proof-read, but those foundational proofs remain imports/gaps.

#### Berrick–Karoubi comparison after inverting two

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/number-ring-invert-two-comparison` — theorem.

For a Dedekind ring R with number-field fraction field and epsilon=±1, GW^s(R;epsilon)→GW^s(R[1/2];epsilon) is a 2-local equivalence on connected covers, hence in strictly positive homotopy degrees, and is injective in degree zero.

**Hypotheses and conventions.** A degree-zero isomorphism is not asserted. 2-local equivalence is distinct from the preceding 2-adic homotopy-limit comparison.

**Construction or proof.** 1. Identify the fibre by the dyadic residue localization terms with duality shift −1. 2. Use the even finite-field comparison and odd-torsion positive K-groups to make that fibre 2-locally (−1)-truncated with zero π₀. 3. Read the fibre long exact sequence to obtain the stated positive-degree isomorphisms and π₀ injectivity.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-symmetric-localization`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/number-ring-homotopy-limit`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.number_ring_invert_two_comparison_test_1`: The map on π₀ is injective; it need not be surjective.
- `TauCeti.GeometryOfNumbersPlan.number_ring_invert_two_comparison_test_2`: The theorem compares R with R[1/2], not GW with ordinary K without duality.

**Source.** CalmesIII, Proposition 3.1.11 and proof, physical p.53. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Higher Grothendieck–Witt groups

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/higher-grothendieck-witt-groups` — definition.

For i≥0, GW_i(E)=π_i of the pointed Grothendieck–Witt fibre space; in degree zero use its canonical abelian H-space component group, not a shifted-duality index.

**Hypotheses and conventions.** Use actual pointed homotopy groups and orthogonal sum.

**Construction or proof.** 1. Take the native pointed homotopy groups of the fibre. 2. Use orthogonal sum for the degree-zero group law and naturality.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/grothendieck-witt-space`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.higherGrothendieckWittGroup` (constructor): Pointed homotopy group of the Grothendieck–Witt fibre.
- `TauCeti.GeometryOfNumbersPlan.higherGrothendieckWittGroup_map` (functoriality): Nonsingular exact form functors induce group maps.
- `TauCeti.GeometryOfNumbersPlan.higherGrothendieckWittGroup_zero` (compatibility): The component group agrees with exact-category GW_0.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.higher_grothendieck_witt_groups_test_1`: GW_0 agrees with the exact presentation, including metabolic relations.
- `TauCeti.GeometryOfNumbersPlan.higher_grothendieck_witt_groups_test_2`: For HE the higher groups agree with ordinary K_i(E).
- `TauCeti.GeometryOfNumbersPlan.higher_grothendieck_witt_groups_test_3`: Four-periodicity of duality shifts does not imply four-periodicity of i.

**Source.** Schlichting2010, printed pp.121–122, Proposition 4.11 and Definition 4.12. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

#### Hermitian suspension of an exact category

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-suspension` — construction.

For idempotent-complete exact E with strong exact duality, S_h E=C(E,E)/E is Schlichting’s hermitian suspension, using the actual cone category and filtering exact quotient, with induced duality. The cone has its duality-preserving Eilenberg swindle.

**Hypotheses and conventions.** C(E,E) is the filtered diagram/cone category of §9, not a ring of dummy symbols. Do not replace a hermitian cone by the ordinary K-theory cone without a duality comparison.

**Construction or proof.** 1. Build §9.1 diagram category and localize the shift maps compatibly with duality. 2. Use the s-filtering inclusion and Lemma 9.5 swindle. 3. Form the exact quotient with its induced duality.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-category-duality`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/schlichting-filtering-localization`, `GeneralAlgebraicKTheory:K.6`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.hermitianSuspension` (constructor): The specified exact quotient with induced strong duality.
- `TauCeti.GeometryOfNumbersPlan.hermitianSuspension_map` (functoriality): Compatible exact form functors induce suspension form functors.
- `TauCeti.GeometryOfNumbersPlan.hermitianCone_contractible` (relation): The duality-preserving cone swindle contracts its GW space.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.hermitian_suspension_test_1`: The cone GW space is contractible by id⊥T≅T.
- `TauCeti.GeometryOfNumbersPlan.hermitian_suspension_test_2`: The quotient is by the embedded E and retains exact duality.
- `TauCeti.GeometryOfNumbersPlan.hermitian_suspension_test_3`: No ordinary K carrier is asserted to equal this hermitian suspension.

**Source.** Schlichting2010, printed pp.159–162, Lemma 9.5, Corollary 9.6, Definition 9.10. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Hermitian cone diagram and filtering refinement: Physical pp.55,57–58 and the tail of p.56 were read; complete §9.1 cone object/morphism/shift definitions and Lemmas 9.2–9.4 proofs must be read and split. These are hermitian adapters, while generic exact quotients and idempotent completion remain K.6 imports.

#### Hermitian suspension delooping

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-suspension-delooping` — theorem.

For idempotent-complete exact E with strong exact duality, GW(E)≃ΩGW(S_h E). The idempotent-completion map ΩGW(S_h E)→ΩGW(˜S_h E) is an equivalence by cofinality.

**Hypotheses and conventions.** No invertibility of two is imposed on this exact-category model.

**Construction or proof.** 1. Use the s-filtering GW fibration and contractibility of the cone. 2. Use the GW cofinality theorem for the loop-space idempotent-completion map.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-suspension`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/schlichting-filtering-localization`.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.hermitian_suspension_delooping_test_1`: Idempotent completion is explicitly retained before iteration.
- `TauCeti.GeometryOfNumbersPlan.hermitian_suspension_delooping_test_2`: The analogous Ω|Qʰ(S_h E)| completion map is not always a π_0 isomorphism.

**Source.** Schlichting2010, printed p.162, Theorem 9.11 and Remark 9.12. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Hermitian cofinality input: Read and split §5 Theorem 5.2 at the exact GW-space level; its use in Remark 9.12 is read, but its full proof is not. Do not import ordinary K cofinality as if it proved this statement.

#### Nonconnective hermitian spectrum

`GeometryOfNumbersAndQuadraticArithmetic:GN.6/nonconnective-hermitian-spectrum` — construction.

Iterating idempotent-completed hermitian suspension gives the Ω-spectrum with levels GW(E), GW(˜S_h E), GW(˜S_h² E), … and structure equivalences from delooping. Its homotopy groups in all integer degrees are nonconnective hermitian groups. For the hyperbolic exact category HE this spectrum agrees with the imported nonconnective K spectrum of E.

**Hypotheses and conventions.** Keep hermitian structure maps and all idempotent completions. The sequence of |Qʰ(˜S_hⁿ E)| spaces alone is generally not an Ω-spectrum.

**Construction or proof.** 1. Iterate the actual suspension and completion functors. 2. Use the proved GW delooping equivalences as spectrum structure maps. 3. Prove the hyperbolic comparison at each level and check compatibility with the ordinary K.6 structure maps.

**Prerequisites.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-suspension-delooping`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/higher-grothendieck-witt-groups`, `GeneralAlgebraicKTheory:K.6`.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.nonconnectiveHermitianSpectrum` (constructor): The completed hermitian-suspension Ω-spectrum.
- `TauCeti.GeometryOfNumbersPlan.nonconnectiveHermitianSpectrum_loop` (relation): Each adjacent structure map is a loop equivalence.
- `TauCeti.GeometryOfNumbersPlan.nonconnectiveHermitianSpectrum_hyperbolic` (compatibility): Comparison with the imported nonconnective K spectrum for HE.

**Checks.**

- `TauCeti.GeometryOfNumbersPlan.nonconnective_hermitian_spectrum_test_1`: Degree-zero recovery does not require this construction.
- `TauCeti.GeometryOfNumbersPlan.nonconnective_hermitian_spectrum_test_2`: For HE negative groups recover nonconnective K groups.
- `TauCeti.GeometryOfNumbersPlan.nonconnective_hermitian_spectrum_test_3`: Qʰ-only levels can fail the Ω-spectrum condition when negative K groups are nonzero.

**Source.** Schlichting2010, printed p.162, Remark 9.12. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

**Unresolved inputs.** Native spectrum and hyperbolic suspension comparison: Obtain the genuine spectrum/loop/idempotent-completion interfaces from their owners and verify the hermitian hyperbolic functor’s compatibility with K.6 suspension. This construction is not represented by an opaque invented carrier in the suggested file.

## Source receipts and read frontier

**LLL1982 — Factoring polynomials with rational coefficients.** Math. Ann. 261 (1982), 515–534; scanned academic mirror with reprint folios 27–46; locators below use physical PDF pages and equation numbers, not the reprint folio as journal pagination. [A. K. Lenstra, H. W. Lenstra, Jr., L. Lovász](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstrafactor.pdf). SHA-256 `dabefb8bcfb5dbb8b36a43745081f8ab6f18aadc85b1e252fd7c85abefc5f704`, acquired 4 October 2026. Physical pp.1–8 visually read in full: introduction and §1 through termination and the statement of Proposition 1.26; complexity proof on p.9 and polynomial factoring sections not read.

**Voight2026 — Quaternion algebras.** Author post-publication v.1.0.7u, 5 August 2026; 883 physical pages; not represented as the unchanged 2021 publisher text. [John Voight](https://jvoight.github.io/quat-book.pdf). SHA-256 `a9316b834dbd500c52cd3a981c3205c9f4145b217042b213d23f696aee84b0f0`, acquired 4 October 2026. Physical pp.157–168 / printed pp.137–148: §9.3–9.8, including full local-global lattice proofs and completion descent; the normalized-form proof cites an external algorithm, recorded as a gap. No whole-book reading or publisher collation is claimed.

**LiZhangDensity — Kudla–Rapoport cycles and derivatives of local densities.** arXiv:1908.01701v3, 92 pages; version used by the routed extraction. [Chao Li, Wei Zhang](https://arxiv.org/pdf/1908.01701v3). SHA-256 `7db1843f90c3e79741f8d58d92b6bb42b0a3b7ae001c8f9419f43b08c2119d49`, acquired 4 October 2026. Physical pp.2–4, 8–9, 14–19, 20–24 read: intro hypotheses; §1.7 hermitian lattices and measure normalization; §3 representation densities, normalized polynomial and Cho–Yamauchi formula including the p.18 proof. Geometric intersection sections are contextual reading, not mathematical claims owned by GN. Hironaka, Cho–Yamauchi, Kitaoka and Gan–Yu proofs cited by §3 were not acquired.

**Schlichting2010 — Hermitian K-theory of exact categories.** Published-layout academic copy, J. K-Theory 5 (2010), 105–165, DOI 10.1017/is009010017jkt075, 61 pages. [Marco Schlichting](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf). SHA-256 `fdcf61c0e9e41550b7aaf8d34f2e9deb3276b0a6f8e59f9fb3262018b7052f0e`, acquired 4 October 2026. Physical pp.1–19 / printed pp.105–123: exact duality, symmetric spaces, Lagrangians, isotropic reduction, degree-zero GW/W, form functors, hermitian Q, GW space, formations and degree-zero comparison, with selected proofs in full. Physical pp.36–37 / printed 140–141: s-filtering conditions, exact quotient and localization statement; the remaining localization proof is not read. Physical p.55, pp.57–58, and tail of p.56 read: cone swindle, filtering consequence, hermitian suspension, delooping and nonconnective Ω-spectrum warning. Full §9.1 cone setup and §5 cofinality proof not read.

**SchlichtingDerived — Hermitian K-theory, derived equivalences and Karoubi’s Fundamental Theorem.** arXiv:1209.0848v3, 7 September 2016; PDF acquired through unversioned URL and version established from its first page, 119 pages. [Marco Schlichting](https://arxiv.org/pdf/1209.0848v3). SHA-256 `f18bf8e3950871bfc00ef1e51a11e17c2c9107b473f1ff7a5c36e2fac53e4dc0`, acquired 4 October 2026. Physical pp.1–4 introduction read: uniquely 2-divisible mapping-complex hypothesis, derived invariance, Bott triangle and shifted rather than homotopy-degree periodicity. Full §6 proofs remain precise gaps.

**CalmesIII — Hermitian K-theory for stable infinity-categories III: Grothendieck–Witt groups of rings.** arXiv:2009.07225v4, 63 pages; exact version of the current extraction. [Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus, Wolfgang Steimle](https://arxiv.org/pdf/2009.07225v4). SHA-256 `1e4b6720055ebdce0012f5780bfc7cdb5b853e32f29b17224a1be0bc676f770c`, acquired 4 October 2026. Physical pp.1–8 read: introduction and Recollection R.1–R.5. Physical pp.49–57 read: §3.1 homotopy-limit results and proofs; §3.2 symmetric/symplectic integral groups and their proof, duality action and low-degree table. Generic stable Poincaré/flavour theory belongs to the routed HermitianKTheoryOfPoincareCategories owner, not a second GN definition. Physical pp.36–40 read in full: linking duality, canonical residue dualizing line, Corollary 2.2.5, ramified-uniformizer warning and symmetric-only dyadic devissage. The p.41 continuation of the explicit residue-boundary proof was not read.

**BhargavaShankar2010 — Binary quartic forms having bounded invariants, and the boundedness of the average rank of elliptic curves.** arXiv:1006.1002v2, 50 pages. [Manjul Bhargava, Arul Shankar](https://arxiv.org/pdf/1006.1002v2). SHA-256 `c9dfd70eff16e6898bc034b9f6d3d77e0c4afe40753894dc34a20c588d640a07`, acquired 4 October 2026. Physical p.14 in full: Proposition 2.5 bounded semialgebraic multiset estimate and triangular-unipotent variant; its Davenport/Rogers proof inputs have not been acquired. No whole-paper claim.

**Duke1988 — Hyperbolic distribution problems and half-integral weight Maass forms.** Published-layout author copy, Invent. Math. 92 (1988), 73–90. [W. Duke](https://www.math.ucla.edu/~wdduke/preprints/hyperbolic.pdf). SHA-256 `3c468d0c0d79ec2ab29f96dcdda6094a4ceb6603a4caaae947c0bef443f9005f`, acquired 4 October 2026. Physical pp.1–3 / printed pp.73–75 read in full: spherical lattice-point application, theta/Weyl sum identity, square-free restrictions and Theorem 1. Full analytic coefficient proof and §§3–6 not read.

**Benoist2019 — Arithmeticity of discrete subgroups.** Author notes for 2018/2019 lectures, 43 pages. [Yves Benoist](https://www.imo.universite-paris-saclay.fr/~yves.benoist/prepubli/19ArithmeticityLectures.pdf). SHA-256 `d5e8b727b09c39ca74be90009e1e0e15430ed6611799d696a812acaf4ef68d6b`, acquired 4 October 2026. Physical pp.1–7 and19–21 read: actual quotient measure/lattice conventions, Mahler statement, Howe–Moore and Dani–Margulis recurrence statements, closed semisimple orbit finite-volume proof. Original mixing/recurrence proofs are cited but omitted by these notes, so remain gaps.

**MorrisArithmetic — Introduction to Arithmetic Groups.** arXiv:math/0106063v6, 7 May 2015, 491 physical pages. [Dave Witte Morris](https://arxiv.org/pdf/math/0106063v6). SHA-256 `4c0936b5321dc09338730b411ef62e6fffc9060d0146f30a24e65a5ada47df77`, acquired 4 October 2026. First page and physical p.59 / printed p.43 standing hypotheses; physical pp.412–415 / printed pp.396–399 reduction-theory context; physical pp.420–423 and426–429 / printed pp.404–407,410–413: Ratner orbit/measure/equidistribution statements and Margulis quadratic-value proof for three variables. Full Ratner proofs, higher-dimensional Oppenheim reduction and the rest of the book not read.

**RegevTransference — Transference Theorems, Lattices in Computer Science, Lecture 11.** Fall 2004, author-hosted lecture notes [Oded Regev; scribe Elad Verbin](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf). SHA-256 `11986af4502c60d4d53ad4db111d51b039845943af013fc54d2154e8396b0cf2`, acquired 4 October 2026. Physical pp.1–2 read in full: Theorem 1 and Remark 1, covering radius, cubic-lattice example and Claim 3 proof. Theorem 4 is stated with the weaker constant n; its pp.3–6 proof and the original 1993 proof were not read.

**StephensDavidowitz2019 — An improved constant in Banaszczyk’s transference theorem.** arXiv:1907.09020v1, 21 July 2019 [Divesh Aggarwal; Noah Stephens-Davidowitz](https://arxiv.org/pdf/1907.09020). SHA-256 `58e81f63fa837e02dfcfcea417b0c2411a53128d935c95a43ea146628194c39e`, acquired 4 October 2026. Physical pp.1–2 read in full: actual Euclidean dual/radius conventions and Theorems 1.1–1.2. The asymptotic improved constant is not exported as a uniform finite-dimensional bound; pp.3–6 proof not read.

**Kirschmer2013 — One-class genera of maximal integral quadratic forms.** Author preprint, June 2013 [Markus Kirschmer](https://www.math.rwth-aachen.de/~Markus.Kirschmer/papers/maxgen.pdf). SHA-256 `d128be3ded05632cfad338ce627ec62093d6b7d18e0f47d13b1f61a46847f2e7`, acquired 4 October 2026. Physical pp.1–5 read in full: integral/maximal lattice and genus definitions, local-type table, local mass factor table, Theorem 3.3 and beginning of Proposition 3.4 proof. Original Shimura/Gan–Hanke–Yu mass proof not acquired; remainder of classification not read.

## Suggested signatures and remaining interface work

The suggested file elaborates only against the verified pinned Mathlib import graph; there are no Tau Ceti imports. Native quadratic/hermitian carriers, counts, polynomial weights, exact LLL contracts, category duality, packing/covering, star bodies and finite weighted sums have real signatures. The catalogue at its end retains every new API/test name with its mathematical contract. A catalogue entry is not an executable declaration. Foreign exact-conflation, completed-field/adelic, theta, homogeneous and stable homotopy conditions that cannot yet be stated in that context are omitted explicitly under protocol section 13, rather than replaced with invented proposition fields or dummy carriers.

- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-localization`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-intersection-localizations`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/completed-lattice-descent`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-genus`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/proper-spinor-genus`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-lattice-invariants`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3/finite-hermitian-isometry-formula`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3/hermitian-local-density`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3/normalized-siegel-polynomial`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3/cho-yamauchi-overlattice-formula`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3/siegel-polynomial-functional-equation`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-category-duality`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-lagrangian`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hyperbolic-space`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/isotropic-reduction`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-grothendieck-witt-group`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-witt-group`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hyperbolic-forgetful-relations`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-q-construction`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/grothendieck-witt-space`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/grothendieck-witt-space-components`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/quaternionic-integral-hermitian-data`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/dyadic-atomic-form`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-normalized-form`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3/definite-integral-isometry-finite`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3/definite-genus-class-finite`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3/adelic-mass-identity`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3/theta-lattice-coefficient-interface`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/howe-moore-mixing`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/homogeneous-ergodicity`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/unipotent-nondivergence`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-orbit-closure`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-measure-classification`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-unipotent-equidistribution`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/duke-spherical-equidistribution`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/dual-transference-lower`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/mahler-compactness`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/siegel-mean-value`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/construction-a-real-lattice-interface`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-residue-duality-line`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-symmetric-localization`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/schlichting-filtering-localization`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/shifted-karoubi-periodicity`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/number-ring-homotopy-limit`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/number-ring-invert-two-comparison`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3/maximal-integral-mass-formula`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/higher-grothendieck-witt-groups`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-suspension`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-suspension-delooping`: The exact foreign statement context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.
- `GeometryOfNumbersAndQuadraticArithmetic:GN.6/nonconnective-hermitian-spectrum`: The exact foreign definition/construction context is not yet expressible against the checked Mathlib-only imports: obtain the listed exact-category, completion/adelic, local density, homogeneous, theta or stable Poincaré supplier interfaces. The complete mathematical declaration is retained below; no placeholder condition or carrier is introduced.

## Remaining proof gaps and supplier requests

- **Number-field metric comparison and integer-vector norm floor.** Consumer-owned normalization warning (not a request to duplicate it here): the Couveignes extraction routes the weighted/unweighted metric, discriminant normalization and integer-family applications to proposed EffectiveBoundsCompactModels. Couveignes uses twice the complex squared modulus; audited Mathlib mixed-embedding basis (1,i) is unweighted. The consumer must derive the 2^r2 measure factor, not identify unequal covolumes. Nonzero relation-lattice integer vectors have norm≥1; the initial number-field minima instead need the arithmetic norm/product argument. A general lattice does not have the ≥1 floor. Needed by .
- **Full GN.1 source coverage and upstream minimum compatibility.** The generic two-sided Minkowski product contract and independent attained witnesses are now supplied as unchecked plans. Remaining source work includes the complete original GN.1 bibliography and source-scoped applications, Evertse Theorem 2.11's Hermite-basis proof, John's ellipsoid theorem and their consequences. Reconcile the inherited real-valued Fin-indexed minimum plan with the inspected upstream NNReal/Nat design before implementation. EffectiveBoundsCompactModels still owns weighted number-field metric/discriminant conversion and arithmetic norm floors; the generic volume theorem does not supply those consumer-specific hypotheses. Needed by .
- **GN.2 primary-source and proof decomposition.** Import field invariants/Witt theory from QuadraticFormInvariants and Hasse–Minkowski/isotropy/representation from GlobalQuadraticForms; rational integral lattice duality/discriminant/gluing is completed IntegralLattices. New work: O_K/Z_p integral lattices, localization, genera/spinor genera, dyadic and quaternionic/hermitian variants, with source-specific restrictions. Needed by .
- **GN.3 primary-source and proof decomposition.** AdelicAlgebraicGroups owns quotient/measure and reduction-domain foundations; MetaplecticAutomorphicForms owns theta. GN still needs local representation densities, finite stabilizers, genus classes, weighted mass, local normalization and convergence proofs. Needed by .
- **GN.4 primary-source and proof decomposition.** Existing null-frontier asymptotic lattice counting is an import. GN.4 retains Davenport's bounded semialgebraic MULTISET/projection-volume estimate with uniform dimension/multiplicity/complexity dependence (accepted RS-07), plus independent mixing/nondivergence/Oppenheim/Duke branches, packing/covering, transference, star bodies, Mahler compactness and Siegel mean value. Coding Construction A is AlgebraicCodingTheory layer 6; fixed-domain Lipschitz estimates are GlobalNumberFields. Henk Lemma 2.1, inequality (1.3) and Theorem 1.5 are now decomposed through native integral flags, compatible rounding and diagonal-span avoidance. Theorem 1.5 retains d≥2 and the strict factor 2^(d−1). The dimension-one result is the separate non-strict first-minimum estimate. Conjecture 1.4 is not supplied as a theorem. These counting results do not supply the sharp upper Minkowski volume inequality or any quantitative lattice-counting error term. Needed by .
- **GN.5 primary-source and proof decomposition.** GN.5 owns generic verified LLL (accepted RS-03): exact Gram–Schmidt/rational comparisons, unimodular update certificates, termination, Lovasz and size reduction, approximation guarantees and original-lattice verification. ED.1/ED.2 own their arithmetic reduction/exclusion applications. No unrestricted exact SVP/CVP follows from LLL. Needed by .
- **GN.6 primary-source and proof decomposition.** GN.6 requires an exact category with duality, coherent double dual, forms/isometries, exact-category GW/W, hyperbolic/forgetful maps and higher hermitian K. Degree-zero field Witt/GW belongs to QuadraticFormInvariants. Source-scoped localization/periodicity needs precise invertibility-of-two/regularity assumptions; K.6 only the nonconnective subbranch. Needed by .
- **Proof execution.** All 77 nodes remain unchecked planning declarations. The suggested file checks signatures and tests only. Six general scratch proofs (gauge transport, cross-cluster null intersection, finite integer-box cardinality, the strict interior-difference gauge bound, integral flag coordinates and the large-box limit) and six concrete statements compile without placeholders or diagnostics. These are selected checks, not an implementation of all fourteen new nodes or the full theorem. Exact rational polygon/box/covolume regressions are finite evidence, not universal proofs. Earlier scratch and regression evidence remains historical and is not claimed rerun. Needed by .
- **Localization image adapter.** Identify L⊗R R_(p) with its span in V, prove injectivity, and produce exact local integral quadratic-map instances without imposing global freeness. Existing localization/tensor notions are imported, not re-planned. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.2/lattice-localization`.
- **Completion and finite-quotient adapters.** Supply the exact injections, scalar-extension embeddings and R/p^e→R̂/p^e isomorphism for the imported adic/local-field substrate; the source proof is read, but these adapters have not been matched to declarations at the pin. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.2/completed-lattice-descent`.
- **Spinor-genus source and adelic image comparison.** Acquire the exact O’Meara/spinor-genus passage and prove the integral adelic stabilizer comparison and dyadic spinor-norm images. The orbit definition is a worker specification of the staged target; no spinor-genus classification proof has been read or supplied. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.2/proper-spinor-genus`.
- **Hermitian inverse-Gram and scalar-change proof.** Prove the local full finite inverse-Gram description, dual localization/completion compatibility and double-dual descent. Completed rational symmetric duality is imported only for its matching specialization, not asserted to provide all star-hermitian Dedekind adapters. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-dual-lattice`.
- **LLL transition and invariant refinements.** Separate nearest-integer shear, adjacent-swap Gram updates, prefix invariant preservation, positive integer potential and lexicographic termination into proof-local declarations. The source pp.5–8 is read, but these algorithm invariants are not yet decomposed at implementation granularity. Complexity Proposition 1.26 is only statement-read; no complexity guarantee is exported. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.5/lll-exact-reduction`.
- **Finite hermitian vector counting proof.** Acquire and decompose the hermitian analogue of Kitaoka §5.6 Exercise 4 used in Li–Zhang p.18, including degenerate radical lifts. The source gives the formula but not this counting proof. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.3/finite-hermitian-isometry-formula`.
- **Hermitian density existence and normalization proof.** Acquire Hironaka 1998/2012 and Gan–Yu 2000 at the exact passages used in Li–Zhang §§3.1–3.2. Prove existence, the generic fibre dimension, dyadic unramified smoothness and the finite-count/Haar comparison. These results are statement-read through Li–Zhang, not proof-read in their original sources. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.3/hermitian-local-density`.
- **Integral Siegel polynomial existence.** Prove the interpolation and integrality theorem cited in Li–Zhang §3.2 from the exact Hironaka source. Finite interpolation alone is not a proof of this construction. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.3/normalized-siegel-polynomial`.
- **Overlattice stratum lifting and smoothness.** Acquire Cho–Yamauchi Corollary 3.11/Theorem 3.9 and Gan–Yu Lemma 5.5.2/§9, including the unramified dyadic case, and prove the representation-to-overlattice stratification with the exact q-exponent. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.3/cho-yamauchi-overlattice-formula`.
- **Siegel-series functional-equation proof.** Acquire and decompose Hironaka’s exact functional equation used at (3.2.0.2); the source states it but the original proof is not read. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.3/siegel-polynomial-functional-equation`.
- **Exact quotient and five-lemma adapters.** Match the native exact subobject quotient, induced dual quotient map and exact five-lemma to the pinned completed ExactStructure API. The source proof is read; no private exact-category carrier is substituted. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.6/isotropic-reduction`.
- **Hermitian span composition refinements.** Decompose bicartesian-square equivalence, pullback closure, representative independence and category laws using the supplier Q-construction and completed exact structure. Definition 4.1 is read, but this construction has not been refined to all proof-local lemmas. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-q-construction`.
- **Classical hermitian homotopy-fibre carrier.** Match small nerve realization, pointed homotopy fibre and orthogonal-sum H-space structures to topology/K-theory supplier nodes before prototyping this construction. No spectrum or homotopy fibre is represented by an empty Prop-valued field. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.6/grothendieck-witt-space`.
- **Formation and low-homotopy refinement.** Split Schlichting §4.3 formation generators/relations, Proposition 4.9’s path-loop isomorphism, Lemma 4.10 and the exact five-lemma into proof-local nodes. Their source pp.119–122 is read; this pass records the precise comparison inputs rather than asserting they are implemented. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.6/grothendieck-witt-space-components`.
- **Quaternionic integral module and classification source.** Acquire the exact quaternionic/hermitian local-lattice passages, including the routed Kurinczuk–Skodlerack–Stevens source restrictions. Prove order-module scalar change and noncommutative duality; do not infer them from commutative unramified hermitian density formulas. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.2/quaternionic-integral-hermitian-data`.
- **Integral atomic splitting algorithm.** Acquire Voight’s 2013 Algorithm 3.12 and its proof, match actual discrete valuation and integral quadratic-map APIs, and split unary/binary pivot, orthogonal complement and termination lemmas. Book Proposition 9.8.4 cites this external proof rather than supplying it. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-normalized-form`.
- **Totally positive restriction-of-scalars metric.** Match the arithmetic embedding/trace metric and its normalization to the existing number-field/EffectiveBoundsCompactModels owner; do not create a second number-field metric here. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.3/definite-integral-isometry-finite`.
- **Definite genus finite representative theorem.** Read and decompose the precise reduction bound for a fixed positive genus, including coefficient ideals over number rings. Adelic reduction supplies the domain framework, not this finite integral Gram enumeration by itself. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.3/definite-genus-class-finite`.
- **Tamagawa normalization and explicit mass factors.** Acquire the exact Smith–Minkowski–Siegel/Weil mass theorem, identify O versus SO indices and archimedean constants, prove the local-density factor comparison and the convergent Euler product, and prove the relevant Tamagawa number before assigning a numerical constant. The decomposition here gives an honest measure identity, not an unproved numerical mass formula. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.3/adelic-mass-identity`.
- **Theta-kernel integral lattice adapter.** Supply the exact Schwartz/Gaussian specialization, coefficient exponent, discriminant Weil module, level and weight from MP.5; this node imports that theory rather than asserting a scalar modularity theorem without its hypotheses. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.3/theta-lattice-coefficient-interface`.
- **Corrected Davenport/Rogers proof and semialgebraic carrier.** Acquire Davenport 1951 pp.179–183, its 1964 corrigendum p.580 and Rogers Theorem 9; decompose interval/projection induction and the bounded algebraic-cell complexity theorem. The corrigendum is identified via DOI 10.1112/jlms/s1-39.1.580-t and its indexed text, not represented as an acquired proof. Match the semialgebraic multiset carrier to its actual owner before a full Lean signature. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-semialgebraic-count`.
- **Howe–Moore source proof and unitary representation adapter.** Acquire the original Howe–Moore proof or the cited complete exposition, split the Cartan/weak-limit/invariant-vector arguments, and match the strongly continuous L² action on G/Γ. The read Benoist source explicitly omits this proof. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.4/howe-moore-mixing`.
- **L² ergodicity characterization and quotient action.** Match the actual invariant-probability quotient action, L² strong continuity and invariant-function characterization to the measure-theory baseline; no private ergodic-action predicate is introduced. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.4/homogeneous-ergodicity`.
- **Dani–Margulis nondivergence proof.** Acquire the original recurrence proof cited by Benoist [11], including Mahler short-vector control and polynomial trajectory estimates. Record any quantitative strengthening as a separate theorem with its own good-function, covolume and uniformity hypotheses. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.4/unipotent-nondivergence`.
- **Ratner orbit and measure rigidity proof.** Acquire the original Ratner measure-classification/orbit-closure sources and decompose recurrence, shearing, linearization, invariant-subgroup construction and finite-volume orbit arguments. The Morris source explicitly states that these proofs are long and does not supply them in the selected slice. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-orbit-closure`.
- **Ratner ergodic measure proof.** Acquire the original classification proof and record its measurable shearing/entropy-free rigidity inputs at declaration granularity. Do not infer this theorem solely from topological orbit closure. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-measure-classification`.
- **Oppenheim auxiliary Lie and arithmetic lemmas.** Supply the SO(1,2) intermediate-subgroup classification, Borel-density rationality of its invariant quadratic line and reduction from n≥3 to an appropriate irrational indefinite ternary restriction. The selected Morris proof treats n=3 and explicitly omits some Lie calculations. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.4/oppenheim-values`.
- **Duke theta and coefficient estimates.** Acquire Iwaniec’s exact half-integral coefficient bound and Siegel’s ineffective r₃(n) lower bound; match spherical-harmonic theta lifting and density of harmonic polynomials. Duke p.74 gives the deduction, not the original proofs of those inputs. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.4/duke-spherical-equidistribution`.
- **Star-body critical determinant and compactness source.** Acquire Mahler/Rogers star-body passages and prove the critical-lattice existence/extremal determinant claims under their exact boundedness and boundary hypotheses. The definition here is a worker construction; no convex-body theorem is applied to a nonconvex sublevel. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.4/compact-star-body`.
- **Polar-body carrier and upper transference theorem.** Match the actual inner-product polar to a library definition, prove compact convex interior properties and the attained-minima comparison, then acquire the chosen classical/Banaszczyk upper transference theorem and covering constant. The present declaration proves only the lower inequality. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.4/dual-transference-lower`.
- **Mahler bounded basis and quotient topology.** Acquire the complete chosen Mahler proof, refine the Hermite/reduced-basis uniform bound already listed in the inherited GN.1 frontier, and prove continuity/compactness in the exact SL quotient topology imported from the group owners. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.4/mahler-compactness`.
- **Original Siegel mean-value proof.** Acquire Siegel’s A mean value theorem in geometry of numbers and decompose primitive unfolding, Haar normalization, arithmetic constant and L¹ justification. The current notes supply only the lattice-space/measure input, not that proof. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.4/siegel-mean-value`.
- **Coding edge and real metric adapter.** Resolve the current FF.4 routing against the actual AlgebraicCodingTheory layer-6 constructor. Supply rational-to-real carrier, index/covolume and norm/parity comparisons before deriving an atlas edge from the word code. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.4/construction-a-real-lattice-interface`.
- **Derived duality carrier owned by HermitianKTheoryOfPoincareCategories.** Import the routed stable Poincaré/flavour and derived-duality framework from the new HermitianKTheoryOfPoincareCategories design. No packet/stage yet exists at this base, so no fictitious supplier node is invented. Match its actual derived Hom and line-with-involution types before prototyping this comparison. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-residue-duality-line`.
- **Symmetric dévissage framework and original inputs.** Import generic GW/L fibre and localization from HermitianKTheoryOfPoincareCategories once its design has named nodes; import Quillen/Barwick ordinary K inputs from their owners. Acquire QSS79 symmetric Witt dévissage and refine the exact comparison; Calmes pp.38–39 proves the reduction using these inputs, not their proofs. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-symmetric-localization`.
- **s-filtering quotient and full Schlichting localization proof.** Match each of the four filtering/special inflation/deflation conditions and the exact quotient to GeneralAlgebraicKTheory, then read and decompose Schlichting §8 pp.141–149. Only its statement and setup were read here; no characteristic restriction is invented. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.6/schlichting-filtering-localization`.
- **Classical dg comparison and Karoubi proof.** Read Schlichting §6 and the precise dg duality construction, then import the generic Poincaré Bott/Genauer theory from its routed owner rather than duplicating it. Unique 2-divisibility remains an explicit theorem hypothesis. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.6/shifted-karoubi-periodicity`.
- **Even finite-field comparison and finite-vcd₂ theorem.** Import the original finite-vcd₂ BKSØ homotopy-limit theorem, Quillen finite-field K calculation and the generic hermitian pullback from their owners; refine Calmes Proposition 3.1.4’s even-field L/Tate comparison. The selected Calmes source reduction is proof-read, but those foundational proofs remain imports/gaps. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.6/number-ring-homotopy-limit`.
- **Original upper transference proof.** Acquire Banaszczyk, Math. Ann. 296 (1993), 625–635, and decompose its Gaussian Fourier/Poisson and subspace estimates. The lecture statement has been read; the original full proof has not. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.4/dual-transference-upper`.
- **Covering transference Gaussian proof.** Read and split Regev Lecture 11 pp.3–6, including shifted Gaussian sum, tail, Poisson summation and final scale choice. The proved Claim 3 is already read; the upper-bound proof is not. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.4/covering-dual-transference`.
- **Original maximal mass theorem and complete local table.** Acquire Shimura 1999 Theorem 5.8 / Gan–Hanke–Yu 2001 Proposition 2.13, prove τ(SO)=2, maximal-lattice single genus, local-model comparison and finite bad-prime support. Definition 3.1/Table 1 are read, but the complete invariant-to-factor adapter and original mass proof require refinement. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.3/maximal-integral-mass-formula`.
- **Mass zeta and archimedean normalization imports.** Attach exact number-field Dedekind-zeta Euler product and special-value supplier declarations, and the gamma/local Haar conversion. Do not infer these from the theta or adelic measure stage alone. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.3/maximal-integral-mass-formula`.
- **Hermitian cone diagram and filtering refinement.** Physical pp.55,57–58 and the tail of p.56 were read; complete §9.1 cone object/morphism/shift definitions and Lemmas 9.2–9.4 proofs must be read and split. These are hermitian adapters, while generic exact quotients and idempotent completion remain K.6 imports. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-suspension`.
- **Hermitian cofinality input.** Read and split §5 Theorem 5.2 at the exact GW-space level; its use in Remark 9.12 is read, but its full proof is not. Do not import ordinary K cofinality as if it proved this statement. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-suspension-delooping`.
- **Native spectrum and hyperbolic suspension comparison.** Obtain the genuine spectrum/loop/idempotent-completion interfaces from their owners and verify the hermitian hyperbolic functor’s compatibility with K.6 suspension. This construction is not represented by an opaque invented carrier in the suggested file. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.6/nonconnective-hermitian-spectrum`.
- **Ratner time-average selection and escape control.** Measure classification plus qualitative recurrence does not by itself identify every time-average limit. Acquire the original equidistribution proof, its nonescape estimates and selection argument, retaining the stated one-parameter unipotent hypothesis. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-unipotent-equidistribution`.
- **Consumer weighted arithmetic metric adapter.** EffectiveBoundsCompactModels owns its chosen coefficient metric; a complete named weighted-number-field embedding comparison must specify the exact determinant and the lower norm estimate in that consumer. This packet supplies only the canonical mixed-embedding normalization, not a new consumer metric. Needed by `GeometryOfNumbersAndQuadraticArithmetic:GN.0/mixed-embedding-normalization`.

- **tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-6-forms-over-a-nonarchimedean-local-field.** Local field quadratic classification with actual dyadic discriminant/Hasse/sign conventions; only the field input, not integral genus. Consumers: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-genus`.
- **tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-6-representation-and-isometry.** Rational isometry from matching local field forms with all real signatures and finite invariants retained; no integral isometry conclusion. Consumers: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-genus`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-2-the-pin-and-spin-groups-and-the-double-covers.** Actual spin-cover map to SO on general characteristic-not-two field points and its spinor-norm kernel; no unsupported local surjectivity. Consumers: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/proper-spinor-genus`.
- **AdelicAlgebraicGroups:AA.1.** Finite adelic points and functorial induced spin-cover maps, with their actual restricted-product topology. Consumers: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/proper-spinor-genus`.
- **tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-0-intrinsic-exact-structures-and-conflation-exact-functors.** Use the completed intrinsic exact structure, actual conflation-exact functors and biproduct conflations; supply the duality adapter without defining a private Quillen carrier. Consumers: `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-category-duality`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-lagrangian`.
- **tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-1-hyperbolic-planes-and-witt-theory.** Compare the general exact-category degree-zero Witt/GW presentations with the existing field theory under its exact characteristic and form conventions. Consumers: `GeometryOfNumbersAndQuadraticArithmetic:GN.6/exact-witt-group`.
- **tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion.** Quaternion algebras and the standard involution in characteristic different from two; no commutative-field replacement of the right quaternion module. Consumers: `GeometryOfNumbersAndQuadraticArithmetic:GN.2/quaternionic-integral-hermitian-data`.
- **AdelicAlgebraicGroups:AA.2.** Compatible quotient/product Haar measures, finite-volume quotient and integration normalization; no numerical Tamagawa constant asserted without its separate proof. Consumers: `GeometryOfNumbersAndQuadraticArithmetic:GN.3/adelic-mass-identity`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/howe-moore-mixing`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/homogeneous-ergodicity`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/siegel-mean-value`.
- **AdelicAlgebraicGroups:AA.3.** Reduction domains for the indicated arithmetic groups, with actual coarse/fundamental-domain and quotient-topology hypotheses. Consumers: `GeometryOfNumbersAndQuadraticArithmetic:GN.3/definite-genus-class-finite`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/adelic-mass-identity`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/mahler-compactness`.
- **MetaplecticAutomorphicForms:MP.5.** Convergent theta kernel and the lattice Schwartz/Gaussian coefficient specialization, including its discriminant, level and measure conventions. Consumers: `GeometryOfNumbersAndQuadraticArithmetic:GN.3/theta-lattice-coefficient-interface`.
- **MetaplecticAutomorphicForms:MP.7.** The harmonic half-integral theta coefficient interface for Duke’s spherical Weyl sums; the analytic coefficient estimate remains a separate original-source gap. Consumers: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/duke-spherical-equidistribution`.
- **tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem.** Actual finite-dimensional matrix Lie groups and their closed subgroup structures; general homogeneous quotient manifolds are supplied by Lie groups Part II, not redefined here. Consumers: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/howe-moore-mixing`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-orbit-closure`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ratner-measure-classification`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/oppenheim-values`.
- **tauceti:TauCetiRoadmap/AlgebraicCodingTheory#layer-6-construction-a-with-exact-hypotheses.** Use the completed Construction A constructor, exact index and self-dual/parity hypotheses; supply the real metric/covolume adapter for the current unresolved FF.4 consumer routing. Consumers: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/construction-a-real-lattice-interface`.
- **GeneralAlgebraicKTheory:K.6.** Exact filtering quotients and the selected nonconnective/localization substrate only; ordinary K does not supply hermitian spectra or shifted residue duality. Consumers: `GeometryOfNumbersAndQuadraticArithmetic:GN.6/schlichting-filtering-localization`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-residue-duality-line`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/dedekind-symmetric-localization`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/hermitian-suspension`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6/nonconnective-hermitian-spectrum`.
- **GeneralAlgebraicKTheory:K.4:construction.** Imported ordinary S-construction and K spectrum for the classical dg Bott comparison; not a substitute for the hermitian spectrum. Consumers: `GeometryOfNumbersAndQuadraticArithmetic:GN.6/shifted-karoubi-periodicity`.

## Additional source finding awaiting verification

**GeometryOfNumbersAndQuadraticArithmetic/E10.** §9.4.5: publisher version of record (2021), printed p.144 / physical p.160; also post-publication v1.0.7u (5 August 2026), printed p.140 / physical p.160. Both passages read; updated passage visually verified. The printed assertion is “every finitely generated module over a DVR is free.” Every finitely generated torsion-free module over a DVR is free. The lattice applications have that torsion-free hypothesis because their carriers are submodules of a fraction-field vector space. For a DVR A with nonzero uniformizer π, the nonzero cyclic module A/πA is finitely generated and has π-torsion, whereas every free module over the domain A is torsion-free. This is a counterexample to the unrestricted printed assertion. Localized lattices remain torsion-free, so the correction does not invalidate the lattice descent target. The [publisher PDF](https://link.springer.com/content/pdf/10.1007/978-3-030-56694-4.pdf) has SHA-256 `f6c56f6ca7b4bee139b88865a3cf045f899da59d0217618c4dc81daf19ef1ad4`; the [author errata](https://jvoight.github.io/quat-errata.pdf) has SHA-256 `42987c03960d3c5d36e5920243e6defc587710cd7e106e79b3a688d1e3bf3232`. No correction was found in the dated author errata. This is an unchecked finding for the independent reviewer, not a confirmed verdict.

## Validation receipt

The indexed packet checker reports zero errors and zero warnings, with all seven stages planned. Source-issue and source-version checks report no errors. All 77 incoming whole node objects, 156 baseline entries, nine source findings, five source-version records and the inherited reader body are preserved. The suggested file has 2479 lines and 33 individual Mathlib imports. It elaborated at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` in 9.81 seconds, with 364 admission warnings, zero errors and zero other warnings. It imports no Tau Ceti module; the available build’s Tau Ceti root was not the pinned source commit, so this is a Mathlib-only elaboration check. No production-library implementation, exhaustive prototype coverage or mathematical closure is claimed.
