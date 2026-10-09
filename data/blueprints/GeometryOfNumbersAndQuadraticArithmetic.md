# Geometry of numbers, quadratic forms and homogeneous arithmetic

Revision 2 is a complete planning pass at the 300-node budget. It preserves all 169 input declaration identifiers, including the twelve declarations added by the independent reviewer, and adds 131 declaration-sized obligations. It remains a plan: every implementation status is unchecked. GN.5 is planned; GN.0, GN.1, GN.2, GN.3, GN.4 and GN.6 are partial. No stage is closed. The independent review dated 5 October 2026 remains an immutable historical verdict of needs_changes; this revision requires another independent review.

“Complete” records completion of this bounded planning pass. It does not assert coverage of every routed result, acquisition of every foundational proof, completion of every native signature, or implementation of any theorem. The precise open targets and sources appear with the stages, the supplier contracts, the gaps and the paper-item inventory below.

The packet is the structured dependency graph. This reader states the same declarations, hypotheses, proof outlines, APIs, mathematical test contracts and source locators. A local identifier such as GN.2/field-discriminant-comparison abbreviates GeometryOfNumbersAndQuadraticArithmetic:GN.2/field-discriminant-comparison. Suggested API and test names throughout have namespace TauCeti.GeometryOfNumbersPlan unless fully qualified otherwise. A test name is a planning identifier; anonymous native examples in the suggested file do not automatically certify every named mathematical contract.

## Library boundary and conventions

The pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The original independent audit read 176 baseline statements and their surrounding hypotheses. This revision retains those citations and adds seventeen statement-level inspections: the PID torsion decomposition theorem and sixteen native exact-category, localization, nerve, homotopy and DVR interfaces. The baseline catalogue at the end specifies what each supplies. An existing special case is used only under its actual assumptions.

Ordinary real full lattice and covolume foundations are library imports. A lattice is a native integer submodule with discreteness and full real span; Gram matrices use the pinned conjugate-linear first argument. Oriented determinant is not an absolute covolume. Hermitian determinant is not a rectangular basis determinant. Intrinsic volumes on a subspace and ambient volumes have different dimensions. A rational span is not the integral lattice it spans, and a finite subgroup quotient requires saturation when torsion-freeness is used.

For convex geometry the body contains a neighbourhood of zero and is compact, symmetric and convex under the displayed hypothesis of the relevant result. Successive minima measure the least dilate containing an appropriate number of independent lattice vectors. Their real/Fin-indexed planning adapter must be reconciled with the actual supplier indexing before implementation; a directional real basis is not an integral basis. The polar of a coordinate box is the weighted cross-polytope determined by its side lengths. A compact star body is supplied by its own positively homogeneous gauge and compact unit sublevel; convexity is an extra hypothesis, not a hidden prerequisite.

An arithmetic integral lattice over a Dedekind domain is a finitely generated full submodule of its fraction-field vector space. It is projective and can be nonfree. Quadratic integrality and perfection of the polar pairing differ: over the integers, x² is integral and its polar pairing is 2xy. Whenever a symmetric bilinear lattice is turned into a generic quadratic space the convention is q(x)=B(x,x)/2. The determinant changes by 2 raised to minus the rank, and the signed discriminant includes the rank-dependent sign. An integral quadratic refinement on a Z-lattice requires the stated evenness hypothesis. Localization at a prime and completion at that prime are distinct operations.

Generic field isometry, integral isometry, genus and proper spinor genus remain separate. QuadraticFormInvariants owns field hyperbolic decomposition, invariants, Witt theory and local classification. GlobalQuadraticForms owns global field isotropy and local-global representation/isometry. Completed IntegralLattices owns symmetric free Z-lattices, their rational duality and even discriminant gluing. Ten direct GN.2 comparison declarations import these theories with their actual conventions; a genus definition is not a substitute for any of them. Spinor genus uses the actual spinor-norm image and integral stabilizer. No surjectivity of Spin on field points is inferred from an algebraic double cover.

At a nonarchimedean place the symbol q for a residue cardinality means the cardinality of the base residue field; an unramified quadratic extension has q² elements. Representation counts include all form-preserving maps. The finite-field embedding formula counts injective maps and cannot replace a representation formula when the source has a radical. A zero rank-one source has a representation into an anisotropic rank-one target but no injective embedding. Empty generic fibres have their own eventual-empty-count branch: the unramified quadratic norm equation x²+y²=3 at Q₃ has one solution modulo 3 and none modulo 9. Existence of a normalized density polynomial requires its original smoothness and lifting inputs, recorded as gaps.

Mass is the sum of reciprocal finite stabilizer orders over the indicated classes. Proper SO mass differs from ordinary O mass. A rank-one proper stabilizer is trivial, and a square Z-lattice has four proper integral isometries, so its single proper class contributes 1/4. Haar measures, quotient integration and adelic reduction are imported from AA.2 and AA.3; a Tamagawa constant is never guessed from a theta or density normalization. The maximal integral mass endpoint retains the source degree/dimension, archimedean, dyadic and maximality hypotheses.

Generic certified LLL belongs here under the accepted ownership decision. Arithmetic exclusion and height arguments belong to their consumers. The ordered basis, exact Gram–Schmidt coefficients, size bound and Lovász bound determine the certificate. Native shears are nearest-integer operations in descending index order. The adjacent swap has explicit two-vector and later-coefficient formulas. The prefix Gram product is a positive integer for integral Gram data; the measure consisting of that potential and the remaining cursor distance is lexicographically decreasing. The supplied full-row-reduction outer loop is an explicit variant of the printed loop and requires its own preserved-prefix transition proof. Rank zero and rank one have separate immediate termination conventions. Approximation by a factor with square 2^(n−1) does not solve exact shortest-vector or closest-vector problems. Polynomial bit complexity is a source gap, not an exported guarantee.

Homogeneous dynamics uses connected matrix Lie groups, finite-volume quotients and normalized invariant probability measures under each theorem's precise hypotheses. Howe–Moore mixing, ergodicity, unipotent nondivergence, orbit closure, invariant-measure classification, ergodic-measure classification and time averages have different declarations. Quantitative nonescape is not a consequence of qualitative measure classification. Oppenheim retains nondegeneracy, indefiniteness, dimension at least three and failure to be a scalar multiple of a rational form. Duke's spherical theorem retains its stated arithmetic progression and square-free restrictions. Its coefficient estimate is a separate source input.

Packing, covering, critical determinants and transference form a second GN.4 branch. Admissibility means that the interior of the unit star body contains no nonzero lattice point. The critical determinant is the infimum of covolumes of full admissible lattices. A minimizing sequence, a bounded-basis compactness comparison and closed admissibility yield an extremal lattice. Mahler's cited source treats symmetric bodies; the positive-homogeneous-gauge extension here is identified as a proof adaptation. The rank-zero critical determinant is one. Gaussian transference uses the six-page Regev proof with its weaker uniform constant n. The original stronger Banaszczyk endpoint needs its own source. Gaussian lattice Poisson summation, phase signs and dual covolume are explicit Fourier-adapter obligations, even though the native Gaussian statements elaborate.

GN.6 starts with the pinned intrinsic exact structure on a preadditive category with zero object and biproducts. Strong contravariant duality includes a natural bidual isomorphism and its coherence square. Exactness is the actual proposition-valued IsConflationExact structure, passed explicitly for an additive functor. A perfect symmetric space has a pairing isomorphism. A Lagrangian is an admissible short complex whose quotient is the dual of its subobject. Injectivity does not imply admissibility. Hyperbolic forms and the canonical Lagrangian use biproducts and do not divide by two.

The Grothendieck–Witt presentation uses actual symmetric isometry classes and imposes orthogonal-sum and metabolic-to-hyperbolic relations. The Witt presentation kills metabolic classes. Forgetful and hyperbolic maps land in and start from the native exact K₀; their composite is 1+D, not generally multiplication by two. Orthogonal sum, the negative form and the diagonal Lagrangian are separate inputs. Isotropic reduction uses two actual conflations, an orthogonal quotient and a descended perfect form; general exact short-five is an adapter obligation and is not replaced by an abelian-only short-five theorem.

The hermitian Q-category uses representatives with an admissible deflation and inflation and the source bicartesian condition. Isomorphism of middle objects defines the representative relation. Pullback closure, descent of composition, identities and associativity are separate steps. The native category has quotient morphisms, and its nerve is the pinned simplicial nerve. Topological realization and ordinary Q remain actual supplier interfaces. The Grothendieck–Witt space is a pointed homotopy fibre; the prototype models the path fibre by continuous paths with endpoints in compact-open function spaces. HomotopyGroup indexed by Fin i supplies the native degree-i type. In degree zero a group law requires the coherent orthogonal-sum H-space comparison, and identifying components with the exact GW₀ presentation is a distinct theorem.

The hermitian cone uses the lexicographically ordered diagram index N plus the reverse of N. Rows are admissible inflations or deflations, with one uniform crossing bound. Morphisms are localized at the specified lower/upper shifts. Fractions, composition, exactness, duality, constants and the four-condition filtering quotient are separated. The pointwise swindle uses finite biproducts at each index, not an assumed infinite sum in the original category. The generic localization carrier does not supply its exact structure automatically. Ordinary K.6 does not supply the s-filtering quotient, shifted residue duality or coherent hermitian swindle.

Formations use an actual perfect space with two named Lagrangians, their isometries and common admissible reductions. The group imposes orthogonal-sum, concatenation and reduction relations. Its boundary is the difference of the two Lagrangian object classes in exact K₀, and its image is the kernel of the hyperbolic map. The comparison with a loop group is a genuine realization theorem. Hermitian suspension, its completion, nonconnective spectrum assembly and the hyperbolic comparison are distinct targets. Qʰ-space levels alone are not generally an omega spectrum. Duality-shift periodicity is not periodicity in every homotopy degree; the classical dg Bott comparison retains inversion of two.

The Calmes–Dotto–Harpaz–Hebestreit–Land–Moi–Nardin–Nikolaus–Steimle branch imports the stable Poincare framework from HermitianKTheoryOfPoincareCategories. That owner has a routed brief but no usable supplying stage or node in this checkout; the missing framework is a gap, not a fabricated citation or a second GN definition. Residue duality uses the canonical line (p⁻¹M/M)[−1]. Its identification by a uniformizer is not natural under arbitrary ramification, and symmetric dyadic devissage does not imply quadratic devissage. The integer symmetric and symplectic tables retain their eight residue rows, ordinary K(Z) factors and flavour conventions. The low-degree quadratic and skew-quadratic rows are separate, including the C₄ and C₂₄ phenomena. Number-ring homotopy-limit comparison requires 2-completion; inversion of two gives the stated connected-cover comparison and degree-zero injectivity under its hypotheses.

Signed hermitian twisting and transfer from Kurinczuk–Skodlerack–Stevens are commutative-field results at odd residue characteristic. They do not classify quaternionic orders. Transfer depends on a specified nonzero linear functional compatible with the involution, and determinant/norm and parity statements retain the involution and anisotropic-dimension hypotheses. The maximal-class transfer proof invokes an unacquired source. Quaternionic order data instead use a genuine quaternion algebra with standard involution and a right module, represented by a module over the opposite algebra. The acquired Emery–Kim proofs supply the free diagonal and split cases only; nonfree order-lattice localization and ramified classification remain gaps.

## Validation and scope of the prototype

The indexed packet checker reports 0 errors and 0 warnings. Its definition/construction counters are 218 API items and 176 unit-test contracts; there are also 76 supplemental API items and 227 supplemental theorem/comparison test contracts. The total graph has 294 API entries, 282 distinct advertised API names and 403 mathematical test contracts. The native file contains 363 anonymous admitted examples; their count is not a claim that 363 specific packet tests have been proved or matched automatically.

The suggested file elaborates at both pins using only admitted prototype obligations. An independent name probe checks every advertised API: 189 of the 218 definition/construction entries have typed signatures, as do the 76 supplemental entries. Twenty-nine distinct supplier-dependent names are absent and individually enumerated below and in suggestedFrontier. The probe intentionally reports those unknown names; the deliverable itself compiles. This is a type/context check, not a source-proof or implementation certificate.

Fresh exact-rational regressions checked 496 nonsingular two-dimensional integral bases and their nearest-integer shears, all 496 adjacent swaps and 176 failing-swap potential decreases. They checked 729 triangular three-dimensional configurations, 2,187 shears and 1,458 adjacent swaps. These finite checks verify the displayed update identities; they are not a universal termination proof. Eighty-one rational pairs verify both the atomic nonuniqueness substitution and the corrected square-completion polynomial. The two finite norm counts and four proper square-lattice isometries were recomputed. Historical larger/source-specific receipts remain historical rather than newly claimed executions.

## Stage overview

| Stage | Nodes | Coverage | Central branch |
| --- | ---: | --- | --- |
| GN.0 | 17 | partial | Intrinsic lattices, Gram bounds and arithmetic metric adapters |
| GN.1 | 53 | partial | Successive minima, finite counts and sharp product bounds |
| GN.2 | 55 | partial | Integral/generic comparisons, local invariants, spinor and signed forms |
| GN.3 | 16 | partial | Finite counts, local densities, Siegel polynomials, mass and theta |
| GN.4 | 46 | partial | Homogeneous arithmetic, critical lattices and Gaussian transference |
| GN.5 | 24 | planned | Certified exact LLL, termination and approximation |
| GN.6 | 89 | partial | Exact hermitian forms, Q/cone/formations and arithmetic GW comparisons |

The planet flag selects atlas landmarks, not every prerequisite. There are 35 landmarks and at most six in a stage. Every declaration below stays unchecked. A proof outline lists mathematical operations and imports; it does not assert that the corresponding proof has been carried out.

## GN.0: Intrinsic lattices, Gram bounds and arithmetic metric adapters

Coverage: **partial**. Finished 300-node planning pass at the protocol budget; source/supplier/implementation closure is not asserted.

The follow-up must establish the following scope before closure:

- Resolve the EffectiveBoundsCompactModels weighted-metric adapter in its owner.
- Read and decompose routed Browning–Le Boudec–Sawin intrinsic saturation/kernel/projection determinant consequences; completed full lattice carriers and the four Couveignes nodes remain imports/adapters, not new foundations.

### Gram determinant in orthonormal coordinates

**lemma; `GN.0/gram-det-orthonormal-coordinates`.** For an RCLike field k, a normed k-inner-product space E, an orthonormal basis b indexed by Fin n, and any v:Fin n→E, det Gram_k(v) equals the scalar image in k of ‖det_b(v)‖².

Hypotheses and conventions: n may be zero; independence of v is not assumed. The inner product is conjugate-linear in its first argument; Gram has entries ⟨v_i,v_j⟩.

Proof/construction outline: 1. Set A_ij=(b.repr(v_j))_i. The existing coordinate theorem identifies Gram(v) with AᴴA. 2. Take determinants using det_mul and det_conjTranspose; obtain conjugate(det A)·det A. 3. Use the RCLike norm-square identity and basis determinant definition to identify the scalar image of ‖det_b(v)‖², recording reality and nonnegativity. 4. For n=0 every determinant and empty product is one; no inverse or positive-rank assumption enters.

Direct prerequisites: `mathlib:Matrix.gram`, `mathlib:Matrix.gram_eq_conjTranspose_mul`, `mathlib:Matrix.det_mul`, `mathlib:Matrix.det_conjTranspose`

API contracts:

- `gram_det_orthonormal_coordinates` (relation; native signature elaborated): Exact scalar-valued norm-square identity, not merely equality of real parts.

Mathematical test contracts:

- `gram_det_orthonormal_coordinates_test_1` (characterisation): The singleton complex family (i) has Gram determinant 1, not −1.
- `gram_det_orthonormal_coordinates_test_2` (characterisation): Vectors (1,0),(0,i) in C² have Gram determinant 1 and squared coordinate-determinant norm 1.
- `gram_det_orthonormal_coordinates_test_3` (characterisation): The empty family in zero-dimensional space has determinant 1.

Source/derivation: [Couveignes2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf), §3, printed p.493 (physical PDF p.7), Gram/covolume calculation. The motivating passage is independently located. The node is a worker-derived auxiliary consequence with its stated additional hypotheses; its proof is supplied by the listed pinned/library or preceding-node inputs, not claimed verbatim as a theorem of this article.

Use: `Couveignes2020, §3, pp.493–494; routed GN input`: The squared lattice volume is computed by a Gram determinant.

### Hadamard bound in orthonormal coordinates

**lemma; `GN.0/orthonormal-coordinate-hadamard`.** For an orthonormal basis b:Fin n→E over an RCLike field and any v:Fin n→E, ‖det_b(v)‖≤∏i ‖v_i‖.

Hypotheses and conventions: b is a full orthonormal basis; n=0 and dependent families are allowed.

Proof/construction outline: 1. Obtain finite dimensionality from b and dimension n. Use the existing gramSchmidtOrthonormalBasis for v, indexed by Fin n; it extends nonzero orthogonalized vectors even when v is dependent. 2. In that basis c the checked formula gives det_c(v)=∏i⟨c_i,v_i⟩. Take norms and apply Cauchy–Schwarz, since ‖c_i‖=1. 3. Apply gram-det-orthonormal-coordinates with b and c. Injectivity of real scalar embedding identifies their squared determinant norms; nonnegativity identifies the norms. 4. Transfer the bound to b. Empty product is one. The existing real oriented-volume bound remains an import/provenance comparison, not a newly owned theorem.

Direct prerequisites: `GN.0/gram-det-orthonormal-coordinates`, `mathlib:InnerProductSpace.gramSchmidtOrthonormalBasis`, `mathlib:InnerProductSpace.gramSchmidtOrthonormalBasis_det`, `mathlib:norm_inner_le_norm`, `mathlib:Orientation.abs_volumeForm_apply_le`

API contracts:

- `orthonormal_coordinate_hadamard` (relation; native signature elaborated): Determinant norm bounded by product of column norms.

Mathematical test contracts:

- `orthonormal_coordinate_hadamard_test_1` (characterisation): Orthogonal real columns (2,0),(0,3) attain determinant norm 6 and product norm 6.
- `orthonormal_coordinate_hadamard_test_2` (characterisation): Columns (1,0),(1,1) have determinant norm 1 and product norm √2; equality fails.
- `orthonormal_coordinate_hadamard_test_3` (characterisation): Duplicate nonzero columns have determinant 0 and positive product norms.

Source/derivation: [Couveignes2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf), §3, printed p.494 (physical PDF p.8), Gram/covolume calculation. The motivating passage is independently located. The node is a worker-derived auxiliary consequence with its stated additional hypotheses; its proof is supplied by the listed pinned/library or preceding-node inputs, not claimed verbatim as a theorem of this article.

Use: `Couveignes2020, §3, pp.493–494; routed GN input`: Hadamard bounds the Hermitian determinant by its diagonal product.

### Hermitian Gram–Hadamard inequality

**theorem; `GN.0/hermitian-gram-hadamard`.** Atlas planet: Gram–Hadamard inequality. For any v:Fin n→E in a normed RCLike inner-product space, det Gram(v) is the scalar image of its real part, and 0≤Re(det Gram(v))≤∏i ‖v_i‖². The ambient space need not be finite-dimensional.

Hypotheses and conventions: E is normed, not merely seminormed; n may be zero. No linear independence or nonsingularity assumption.

Proof/construction outline: 1. Split on independence. If v is dependent, the pinned determinant/nonzero equivalence implies det Gram(v)=0; all conclusions follow from nonnegative squared norms. 2. For independent v take W=span(range v), with inherited inner product. The checked dimension theorem gives dim W=n; the coerced vectors remain independent. Choose orthonormal coordinates on W. 3. Submodule inclusion preserves inner products and norms, so Gram_W(v)=Gram_E(v). Apply the preceding two nodes in W, square the nonnegative bound, and distribute the square over the product. 4. The coordinate identity supplies reality and nonnegativity, not a comparison in a complex ordering. n=0 gives 1≤1.

Direct prerequisites: `GN.0/gram-det-orthonormal-coordinates`, `GN.0/orthonormal-coordinate-hadamard`, `mathlib:Matrix.det_gram_ne_zero_iff_linearIndependent`, `mathlib:Matrix.posSemidef_gram`, `mathlib:finrank_span_eq_card`

API contracts:

- `hermitian_gram_hadamard` (relation; native signature elaborated): Reality, nonnegativity and diagonal-product upper bound in one interface.

Mathematical test contracts:

- `hermitian_gram_hadamard_test_1` (characterisation): The empty Gram determinant and diagonal product both equal 1.
- `hermitian_gram_hadamard_test_2` (characterisation): Family (1,i) in C has Gram [[1,i],[-i,1]], determinant 0 and diagonal product 1; conjugation is essential.
- `hermitian_gram_hadamard_test_3` (characterisation): Real vectors (1,0),(1,1) have Gram [[1,1],[1,2]], determinant 1 and diagonal product 2.

Source/derivation: [Couveignes2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf), §3, printed p.494 (physical PDF p.8), Gram/covolume calculation. The motivating passage is independently located. The node is a worker-derived auxiliary consequence with its stated additional hypotheses; its proof is supplied by the listed pinned/library or preceding-node inputs, not claimed verbatim as a theorem of this article.

Use: `Couveignes2020, §3, pp.493–494; routed GN input`: Hadamard bounds the Hermitian determinant by its diagonal product.

### Uniform Gram determinant bound

**lemma; `GN.0/gram-uniform-bound`.** If D≥0 and every v_i in v:Fin n→E satisfies ‖v_i‖²≤D, then Re(det Gram(v))≤D^n.

Hypotheses and conventions: The bound is on squared norms, not individual coefficients; n=0 is allowed.

Proof/construction outline: 1. Use hermitian-gram-hadamard. 2. Multiply the n pointwise inequalities using nonnegative squared norms and D≥0; the constant product is D^n. 3. No off-diagonal bound is required. For an m-column matrix with entries bounded by A in modulus, the consumer must first show row squared norm ≤m·A², then instantiate D.

Direct prerequisites: `GN.0/hermitian-gram-hadamard`

API contracts:

- `gram_uniform_bound` (relation; native signature elaborated): D^n upper bound with D≥0 and squared-norm hypotheses.

Mathematical test contracts:

- `gram_uniform_bound_test_1` (characterisation): n=0,D=0 gives 1≤0^0=1.
- `gram_uniform_bound_test_2` (characterisation): A nonempty zero family with D=0 has determinant 0.
- `gram_uniform_bound_test_3` (characterisation): Two orthogonal vectors of squared norm 5 attain determinant 25, so replacing D^n by D fails.

Source/derivation: [Couveignes2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf), §3, printed p.494 (physical PDF p.8), Gram/covolume calculation. The motivating passage is independently located. The node is a worker-derived auxiliary consequence with its stated additional hypotheses; its proof is supplied by the listed pinned/library or preceding-node inputs, not claimed verbatim as a theorem of this article.

Use: `Couveignes2020, §3, pp.493–494; routed GN input`: A uniform diagonal bound gives D to the number of rows as determinant bound.

### Squared intrinsic covolume is a Gram determinant

**lemma; `GN.0/covolume-square-gram`.** For a discrete full Z-lattice L in a finite-dimensional real inner-product space E with canonical intrinsic volume and Z-basis b:Fin n→L, covolume(L)²=det Gram_R(i↦b_i in E).

Hypotheses and conventions: Use existing Submodule Z E, DiscreteTopology L and IsZLattice R L. The measure is canonical Euclidean volume; arbitrary Haar rescaling changes the identity. Rank equals dim E via existing basis extension. Rank zero is allowed.

Proof/construction outline: 1. Extend b to a real basis by ofZLatticeBasis, giving dim E=n. Choose an orthonormal basis c with the same index. 2. Apply covolume_eq_det_mul_measureReal with b,c and intrinsic volume. The c-fundamental domain equals its parallelepiped almost everywhere, and the latter has volume one. 3. Thus covolume(L)=|det_c(b)|. Square and apply gram-det-orthonormal-coordinates over R. 4. Do not reconstruct covolume, index, fundamental domains or rational discriminant forms. For a proper subspace W instantiate E=W, not ambient volume on a measure-zero subset.

Direct prerequisites: `GN.0/gram-det-orthonormal-coordinates`, `mathlib:IsZLattice`, `mathlib:Module.Basis.ofZLatticeBasis`, `mathlib:ZLattice.covolume`, `mathlib:ZLattice.covolume_eq_det_mul_measureReal`, `mathlib:ZSpan.fundamentalDomain_ae_parallelepiped`, `mathlib:OrthonormalBasis.volume_parallelepiped`

API contracts:

- `covolume_square_gram` (relation; native signature elaborated): Squared intrinsic covolume equals the real Gram determinant.

Mathematical test contracts:

- `covolume_square_gram_test_1` (characterisation): Basis (2,0),(0,3) has covolume 6 and Gram determinant 36.
- `covolume_square_gram_test_2` (characterisation): A unimodular shear of the standard Z² basis leaves covolume squared and Gram determinant equal to 1.
- `covolume_square_gram_test_3` (characterisation): Z(1,1) in its line has intrinsic covolume √2 and Gram determinant 2; ambient plane volume would give the wrong zero.

Source/derivation: [Couveignes2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf), §3, printed p.493 (physical PDF p.7), Gram/covolume calculation. The motivating passage is independently located. The node is a worker-derived auxiliary consequence with its stated additional hypotheses; its proof is supplied by the listed pinned/library or preceding-node inputs, not claimed verbatim as a theorem of this article.

Use: `Couveignes2020, §3, pp.493–494; routed GN input`: The squared lattice volume is computed by a Gram determinant.

### Integral basis adapted to a primitive intersection

**lemma; `GN.0/saturated-adapted-basis`.** With E, Δ, W and L as in the hypotheses, there exist natural numbers r,s, an integral basis b of Δ indexed by Fin r disjoint-union Fin s, and an integral basis c of L indexed by Fin r, such that b(inl i)=c_i in E for every i. Consequently r=dim W, s=dim W-perp and r+s=dim E; no orthogonality of the integral complement is asserted.

Hypotheses and conventions: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. Δ is a discrete full Z-submodule of E. W is a real subspace. L is the existing comap of Δ along W→E; span_R(L)=W, written intrinsically as span_R(L in W)=top. P is the existing image of Δ under orthogonal projection E→W-perp.

Proof/construction outline: 1. Use discreteness and the pinned finite/free instances for Δ and L; comap_discreteTopology applies because W→E is continuous and injective. The span hypothesis makes L a full lattice in W. Inside Δ take N={x in Δ: x lies in W}; the obvious subtype equivalence identifies N with L. 2. Apply Submodule.exists_smith_normal_form_of_le to N≤top in the finite free Z-module Δ. It supplies bases u_j of Δ and v_i of N with v_i=a_i u_i on the initial block. Each a_i is nonzero because v_i is a nonzero basis vector. 3. Since a_i u_i lies in W and a_i is a nonzero real scalar, u_i lies in W, hence in N. Express u_i as an integral combination of the v_j and compare its u_i-coordinate: 1=a_i z_i. Thus every a_i is a unit in Z. This is the saturation step, not an assumption that N has an orthogonal integral complement. 4. Rescale the initial u_i by these units using Basis.isUnitSMul and leave other u_j unchanged. Reindex Fin(r+s) by Fin r disjoint-union Fin s; transport the N-basis to L. Existing ofZLatticeBasis extends c and b to real bases, giving r=dim W and r+s=dim E. The pinned finrank_add_finrank_orthogonal then gives s=dim W-perp. Empty/full initial blocks work unchanged.

Direct prerequisites: `mathlib:Submodule.exists_smith_normal_form_of_le`, `mathlib:instModuleFinite_of_discrete_submodule`, `mathlib:instModuleFree_of_discrete_submodule`, `mathlib:ZLattice.comap_discreteTopology`, `mathlib:Module.Basis.isUnitSMul`, `mathlib:Module.Basis.ofZLatticeBasis`, `mathlib:Submodule.finrank_add_finrank_orthogonal`, `mathlib:Module.finrank_eq_card_basis`

API contracts:

- `saturated_adapted_basis` (characterisation; native signature elaborated): With E, Δ, W and L as in the hypotheses, there exist natural numbers r,s, an integral basis b of Δ indexed by Fin r disjoint-union Fin s, and an integral basis c of L indexed by Fin r, such that b(inl i)=c_i in E for every i. Consequently r=dim W, s=dim W-perp and r+s=dim E; no orthogonality of the integral complement is asserted.

Mathematical test contracts:

- `primitive_diagonal_completion` (computation): Columns (1,1),(0,1) form an integral basis: determinant 1.
- `nonsaturated_cannot_complete` (non-example): No matrix with first column (2,0) and an integral second column has determinant ±1.
- `zero_lattice_empty_basis` (degenerate): The zero lattice in zero-dimensional Euclidean space admits the empty integral basis.

Source/derivation: [HoreshKarasik2023](https://research-explorer.ista.ac.at/download/14717/14720/2023_QuarterlyJourMath_Horesh.pdf), Proposition B.4, published p.1290, basis-completion step.. Expands the source's primitive basis completion into a pinned Smith-normal-form argument.

Use: `Horesh–Karasik Appendix A–B; primitive-orthogonal covolume proof`: Expands the source's primitive basis completion into a pinned Smith-normal-form argument.

### Basis of the projected lattice

**lemma; `GN.0/projected-adapted-basis`.** Let b be an integral basis of a full lattice Δ indexed by Fin r disjoint-union Fin s, c a real basis of W indexed by Fin r, and b(inl i)=c_i in E. Then the vectors q_j=π(b(inr j)), with π:E→W-perp orthogonal projection, form a real basis q of W-perp, and their integral span is exactly P=π(Δ). In particular P is discrete and full in W-perp; these properties are conclusions.

Hypotheses and conventions: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. Δ is a discrete full lattice, b and c are the displayed actual bases, and the first block equality is assumed; no image discreteness, rational coordinate matrix or orthogonal integral splitting is assumed.

Proof/construction outline: 1. Extend b to a real basis using ofZLatticeBasis. Orthogonal projection onto W-perp has kernel W, by ker_orthogonalProjectionOnto and the closed-subspace double-complement identity. 2. If a real combination of the projected last-block vectors vanishes, the corresponding combination of last-block b-vectors lies in W. Express it with c, hence the first block of b; independence of b forces every last-block coefficient to vanish. 3. For x in W-perp, expand its ambient value in the real basis b and apply π. The first block vanishes and π(x)=x, proving spanning. These two arguments give a real basis q with the exact displayed vectors. 4. Expand each element of Δ in its integral b-coordinates: its projection is an integral combination of q. Conversely every q_j is the projection of an element of Δ. Hence span_Z(q)=P. Existing discreteTopology for the integral span of a real basis and instIsZLatticeRealSpan prove the two lattice instances. An integral basis of P is q.restrictScalars Z, transported across this equality.

Direct prerequisites: `mathlib:Module.Basis.ofZLatticeBasis`, `mathlib:Submodule.ker_orthogonalProjectionOnto`, `mathlib:Submodule.isCompl_orthogonal`, `mathlib:ZSpan.discreteTopology_pi_basisFun`, `mathlib:instIsZLatticeRealSpan`, `mathlib:Module.Basis.restrictScalars`

API contracts:

- `projected_adapted_basis` (characterisation; native signature elaborated): Let b be an integral basis of a full lattice Δ indexed by Fin r disjoint-union Fin s, c a real basis of W indexed by Fin r, and b(inl i)=c_i in E. Then the vectors q_j=π(b(inr j)), with π:E→W-perp orthogonal projection, form a real basis q of W-perp, and their integral span is exactly P=π(Δ). In particular P is discrete and full in W-perp; these properties are conclusions.

Mathematical test contracts:

- `diagonal_projected_generator` (computation): Projecting e₂ orthogonally off R(1,1) gives (−1/2,1/2), not (−1,1).
- `full_space_projection_zero` (degenerate): Projection off the full ambient space sends every integral submodule to the zero submodule of the zero-dimensional complement.
- `diagonal_projected_span` (characterisation): The projection of Z² off the diagonal is exactly the integral span of the projected e₂.

Source/derivation: [HoreshKarasik2023](https://research-explorer.ista.ac.at/download/14717/14720/2023_QuarterlyJourMath_Horesh.pdf), Proposition B.4, published p.1290, projected last block; Appendix introduction pp.1284–1285.. Makes projection discreteness and fullness explicit instead of inferring them from an unproved quotient-lattice claim.

Use: `Horesh–Karasik Appendix A–B; primitive-orthogonal covolume proof`: Makes projection discreteness and fullness explicit instead of inferring them from an unproved quotient-lattice claim.

### Gram determinant factorization under orthogonal projection

**lemma; `GN.0/gram-det-adapted-projection`.** Let b be a real basis of E indexed by Fin r disjoint-union Fin s and c a real basis of W indexed by Fin r, with b(inl i)=c_i in E. Then det Gram(b)=det Gram(c)·det Gram(j↦π(b(inr j))), where π:E→W-perp and each Gram matrix uses the intrinsic real inner product.

Hypotheses and conventions: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. The first block spans W and is a basis of W; r or s may be zero.

Proof/construction outline: 1. Choose orthonormal bases of W and W-perp. The pinned orthogonal complement decomposition and Basis.prod transported by prodEquivOfIsCompl give their concatenated orthonormal basis of E; orthonormality follows by the vanishing cross-inner-products. 2. In these coordinates the columns of b form an upper block-triangular matrix [A B;0 C]. A is the coordinate matrix of c; C is the coordinate matrix of its projected last block. This statement uses a real orthogonal decomposition only, not an integral decomposition. 3. Apply Matrix.det_fromBlocks_zero₂₁. Use gram-det-orthonormal-coordinates in E, W and W-perp, reindexing the finite sum type as Fin(r+s). Squaring det(A)det(C) gives the product of the two Gram determinants. 4. Finite reindexing preserves Gram determinants by simultaneous row/column permutation. Empty blocks have determinant one. Taking a positive square root later must use absolute coordinate determinants, not signed determinants.

Direct prerequisites: `GN.0/gram-det-orthonormal-coordinates`, `mathlib:stdOrthonormalBasis`, `mathlib:Module.Basis.prod`, `mathlib:Submodule.prodEquivOfIsCompl`, `mathlib:Submodule.isCompl_orthogonal`, `mathlib:Matrix.det_fromBlocks_zero₂₁`

API contracts:

- `gram_det_adapted_projection` (characterisation; native signature elaborated): Let b be a real basis of E indexed by Fin r disjoint-union Fin s and c a real basis of W indexed by Fin r, with b(inl i)=c_i in E. Then det Gram(b)=det Gram(c)·det Gram(j↦π(b(inr j))), where π:E→W-perp and each Gram matrix uses the intrinsic real inner product.

Mathematical test contracts:

- `sheared_gram_factor` (computation): The adapted columns (1,1),(0,1) give Gram determinant 1 = 2·(1/2).
- `signed_basis_gram` (computation): A sign-reversed coordinate basis has determinant −1 but Gram determinant 1.
- `empty_gram_factor` (degenerate): Empty Gram determinants multiply as 1 = 1·1.

Source/derivation: [HoreshKarasik2023](https://research-explorer.ista.ac.at/download/14717/14720/2023_QuarterlyJourMath_Horesh.pdf), Proposition B.4, published p.1290, block-triangular determinant proof.. Extracts the measure-free determinant step, with signs and empty blocks explicit.

Use: `Horesh–Karasik Appendix A–B; primitive-orthogonal covolume proof`: Extracts the measure-free determinant step, with signs and empty blocks explicit.

### Gram determinants of biorthogonal bases

**lemma; `GN.0/gram-det-biorthogonal`.** For real bases b,d of E indexed by Fin n satisfying inner(b_i,d_j)=δ_ij, det Gram(b)·det Gram(d)=1. This includes n=0 and does not say either basis is orthonormal.

Hypotheses and conventions: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. b and d are actual real bases, with the displayed mixed inner products.

Proof/construction outline: 1. Choose an orthonormal basis e with n indices, using finite dimension and the cardinality of b. Let A,D be the coordinate matrices of b,d. 2. OrthonormalBasis.sum_inner_mul_inner identifies the mixed-pairing matrix with transpose(A)·D. The biorthogonality hypothesis makes this matrix the identity. 3. Take determinants: det(A)det(D)=1, using det_mul and the real specialization of det_conjTranspose. Apply gram-det-orthonormal-coordinates to both bases and square the scalar identity. 4. The proof uses no inverse on a singular matrix and has no exceptional positive-rank assumption.

Direct prerequisites: `GN.0/gram-det-orthonormal-coordinates`, `mathlib:stdOrthonormalBasis`, `mathlib:OrthonormalBasis.sum_inner_mul_inner`, `mathlib:Matrix.det_mul`, `mathlib:Matrix.det_conjTranspose`

API contracts:

- `gram_det_biorthogonal` (characterisation; native signature elaborated): For real bases b,d of E indexed by Fin n satisfying inner(b_i,d_j)=δ_ij, det Gram(b)·det Gram(d)=1. This includes n=0 and does not say either basis is orthonormal.

Mathematical test contracts:

- `reciprocal_line_grams` (computation): The paired real bases 2 and 1/2 have Gram determinants 4 and 1/4.
- `sheared_dual_grams` (computation): Gram matrices [[2,1],[1,1]] and [[1,−1],[−1,2]] have determinant product 1.
- `unpaired_line_rejected` (non-example): Two copies of the basis vector 2 are not a biorthogonal pair: their Gram determinant product is 16, not 1.

Source/derivation: [HoreshKarasik2023](https://research-explorer.ista.ac.at/download/14717/14720/2023_QuarterlyJourMath_Horesh.pdf), Corollary A.3, published p.1285, reciprocal Gram determinants; proof of A.1, p.1284, biorthogonality.. Provides exactly the scalar determinant identity needed for reciprocal covolume, through the existing dual-basis API.

Use: `Horesh–Karasik Appendix A–B; primitive-orthogonal covolume proof`: Provides exactly the scalar determinant identity needed for reciprocal covolume, through the existing dual-basis API.

### Dual of a projected integral submodule

**lemma; `GN.0/dual-projection-comap`.** For any Z-submodule Δ of E and real subspace W, let π:E→W-perp be orthogonal projection. The intrinsic inner dual of π(Δ) equals the comap of the ambient inner dual Δ* along W-perp→E: (π(Δ))*=Δ*∩W-perp. Here every dual is the existing BilinForm.dualSubmodule with the real inner product. No discreteness, fullness or rationality is required for this equality of submodules.

Hypotheses and conventions: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. Dual means integer-valued pairing with every member of the submodule; the intrinsic dual is formed inside W-perp.

Proof/construction outline: 1. Unfold membership in the existing dualSubmodule, Submodule.map and ZLattice.comap. An x in W-perp belongs to the left side precisely when inner(x,π(z)) is integral for every z in Δ. 2. Use inner_orthogonalProjectionOnto_eq_of_mem_left to replace inner(x,π(z)) with inner(x,z). This is exactly membership in Δ* pulled back to W-perp. 3. Prove both inclusions by the image membership witnesses. Do not replace Δ* by Δ unless self-duality has been supplied or proved. In particular this identity still holds when the projected subgroup is not discrete.

Direct prerequisites: `mathlib:LinearMap.BilinForm.dualSubmodule`, `mathlib:ZLattice.comap`, `mathlib:Submodule.inner_orthogonalProjectionOnto_eq_of_mem_left`

API contracts:

- `dual_projection_comap` (characterisation; native signature elaborated): For any Z-submodule Δ of E and real subspace W, let π:E→W-perp be orthogonal projection. The intrinsic inner dual of π(Δ) equals the comap of the ambient inner dual Δ* along W-perp→E: (π(Δ))*=Δ*∩W-perp. Here every dual is the existing BilinForm.dualSubmodule with the real inner product. No discreteness, fullness or rationality is required for this equality of submodules.

Mathematical test contracts:

- `standard_lattice_selfdual` (compatibility): The integral span of any finite real orthonormal basis is self-dual for the integer-valued inner pairing.
- `scaled_ambient_dual` (non-example): For Δ=2Z in R the dual is (1/2)Z, so an arbitrary ambient lattice cannot be substituted for its dual.
- `diagonal_projected_dual` (compatibility): The dual of the projected Z² lattice in the diagonal's orthogonal line is exactly Z² intersected with that line.

Source/derivation: [HoreshKarasik2023](https://research-explorer.ista.ac.at/download/14717/14720/2023_QuarterlyJourMath_Horesh.pdf), Proposition B.5, published p.1291, corrected pairing proof.. Generalizes the published standard-lattice identity correctly by retaining the ambient dual.

Use: `Horesh–Karasik Appendix A–B; primitive-orthogonal covolume proof`: Generalizes the published standard-lattice identity correctly by retaining the ambient dual.

### Full orthogonal intersection in a self-dual lattice

**lemma; `GN.0/orthogonal-intersection-basis`.** Under the full-lattice and rational-intersection hypotheses on Δ,W,L, assume Δ*=Δ for the real inner pairing. Then there exist s and a real basis q of W-perp indexed by Fin s such that span_Z(q)=Δ∩W-perp, with s=dim W-perp. Thus the primitive orthogonal intersection is a discrete full lattice in its intrinsic space.

Hypotheses and conventions: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. Δ is a discrete full Z-submodule of E. W is a real subspace. L is the existing comap of Δ along W→E; span_R(L)=W, written intrinsically as span_R(L in W)=top. P is the existing image of Δ under orthogonal projection E→W-perp. Ambient self-duality Δ*=Δ is required, not merely covolume one or integrality.

Proof/construction outline: 1. Use saturated-adapted-basis; turn its integral basis of L into a real basis of W via ofZLatticeBasis. Apply projected-adapted-basis to obtain a real basis p whose integral span is P=π(Δ). 2. The real inner product is nondegenerate: pairing a putative annihilator with itself gives zero norm, hence zero. Existing BilinForm.dualSubmodule_span_of_basis identifies P* with the integral span of the existing inner-dual real basis of p. 3. Apply dual-projection-comap and Δ*=Δ to identify P* with Δ∩W-perp. Transport the dual real basis across that equality; existing span-basis lattice instances give discreteness and fullness. 4. Rank is the cardinality of a real basis, including zero rank when W=E. This route proves fullness and does not assume a rational basis of the orthogonal space in advance.

Direct prerequisites: `GN.0/saturated-adapted-basis`, `GN.0/projected-adapted-basis`, `GN.0/dual-projection-comap`, `mathlib:Module.Basis.ofZLatticeBasis`, `mathlib:LinearMap.BilinForm.dualBasis`, `mathlib:LinearMap.BilinForm.dualSubmodule_span_of_basis`, `mathlib:ZSpan.discreteTopology_pi_basisFun`, `mathlib:instIsZLatticeRealSpan`

API contracts:

- `orthogonal_intersection_basis` (characterisation; native signature elaborated): Under the full-lattice and rational-intersection hypotheses on Δ,W,L, assume Δ*=Δ for the real inner pairing. Then there exist s and a real basis q of W-perp indexed by Fin s such that span_Z(q)=Δ∩W-perp, with s=dim W-perp. Thus the primitive orthogonal intersection is a discrete full lattice in its intrinsic space.

Mathematical test contracts:

- `diagonal_orthogonal_rank_one` (characterisation): The orthogonal intersection for the diagonal in Z² is the integral span of a real basis indexed by one element.
- `orthogonal_full_rank_zero` (degenerate): The orthogonal intersection for the full plane has an empty real basis.
- `orthogonal_zero_rank_two` (degenerate): The orthogonal intersection for the zero subspace in the plane has a two-element real basis.

Source/derivation: [HoreshKarasik2023](https://research-explorer.ista.ac.at/download/14717/14720/2023_QuarterlyJourMath_Horesh.pdf), Corollary A.2, p.1285, and Proposition B.5, p.1291.. Combines existing dual-basis fullness with the missing projection/intersection bridge.

Use: `Horesh–Karasik Appendix A–B; primitive-orthogonal covolume proof`: Combines existing dual-basis fullness with the missing projection/intersection bridge.

### Covolume of a factor lattice

**theorem; `GN.0/covolume-projection`.** Atlas planet: Factor-lattice covolume. Under the full-lattice and rational-intersection hypotheses on Δ,W,L, the projected lattice P=π(Δ) in W-perp satisfies covol(P)=covol(Δ)/covol(L), with canonical intrinsic Euclidean volumes. No unimodularity or self-duality of Δ is assumed.

Hypotheses and conventions: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. Δ is a discrete full Z-submodule of E. W is a real subspace. L is the existing comap of Δ along W→E; span_R(L)=W, written intrinsically as span_R(L in W)=top. P is the existing image of Δ under orthogonal projection E→W-perp.

Proof/construction outline: 1. Build the adapted integral bases using saturated-adapted-basis and extend the L-basis to a real W-basis. projected-adapted-basis supplies a real basis of P; restrict its scalars to obtain the integral P-basis and the required discrete/full instances. 2. Use covolume-square-gram for Δ,L,P, reindexing the sum-type Δ basis if necessary. Apply gram-det-adapted-projection to the real extension of the adapted Δ basis. 3. These identities give covol(Δ)^2=covol(L)^2·covol(P)^2. Each covolume is strictly positive by the pinned covolume_pos theorem, including zero-dimensional lattices. Deduce covol(Δ)=covol(L)·covol(P), then divide by covol(L). 4. Do not discard the covol(Δ) factor, and do not use a signed determinant as a volume. The proof handles W=0 and W=E with the empty determinant and zero-dimensional volume both equal to one.

Direct prerequisites: `GN.0/saturated-adapted-basis`, `GN.0/projected-adapted-basis`, `GN.0/gram-det-adapted-projection`, `GN.0/covolume-square-gram`, `mathlib:Module.Basis.ofZLatticeBasis`, `mathlib:Module.Basis.restrictScalars`, `mathlib:ZLattice.covolume_pos`

API contracts:

- `covolume_projection` (characterisation; native signature elaborated): Under the full-lattice and rational-intersection hypotheses on Δ,W,L, the projected lattice P=π(Δ) in W-perp satisfies covol(P)=covol(Δ)/covol(L), with canonical intrinsic Euclidean volumes. No unimodularity or self-duality of Δ is assumed.

Mathematical test contracts:

- `diagonal_projection_covolume` (computation): The projected Z² lattice off the diagonal has intrinsic covolume 1/√2.
- `zero_space_covolume_one` (degenerate): The zero lattice in zero-dimensional Euclidean space has intrinsic covolume 1.
- `nonunimodular_factor_ratio` (computation): For Δ=2Ze₁⊕3Ze₂ and L=2Ze₁ the projected covolume is 3=6/2, not 1/2.

Source/derivation: [HoreshKarasik2023](https://research-explorer.ista.ac.at/download/14717/14720/2023_QuarterlyJourMath_Horesh.pdf), Proposition B.4, published p.1290.. Supplies the intrinsic metric quotient-volume formula, with the source's determinant-sign choice made explicit.

Use: `Horesh–Karasik Appendix A–B; primitive-orthogonal covolume proof`: Supplies the intrinsic metric quotient-volume formula, with the source's determinant-sign choice made explicit.

### Reciprocal covolume of the inner dual

**theorem; `GN.0/covolume-dual`.** For a discrete full Z-lattice L in a finite-dimensional real inner-product space E with canonical intrinsic Euclidean volume, covol(L*)=covol(L)^{-1}, where L* is the existing integer-valued inner dual in E. The full-lattice property of L* follows from the existing dual-basis and span-basis results and is not an additional assumption.

Hypotheses and conventions: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. L is discrete and spans E over R. A lower-rank lattice is first transported into its real span; its ambient polar is not used.

Proof/construction outline: 1. Choose a finite integral basis b of L and extend it to a real basis c via ofZLatticeBasis. The existing ofZLatticeBasis_span identifies its integral span with L. 2. Nondegeneracy of the inner form follows by self-pairing. Let d be its existing BilinForm.dualBasis of c. Existing dualSubmodule_span_of_basis identifies L* with span_Z(d); the span-basis instances provide discreteness and fullness. The integral basis is d.restrictScalars Z. 3. Apply apply_dualBasis_right and symmetry of the real inner product to obtain inner(c_i,d_j)=δ_ij. gram-det-biorthogonal says the Gram determinant product is one. 4. Apply covolume-square-gram to the integral bases of L and L*. Positive covolumes imply covol(L)·covol(L*)=1, then division gives the inverse formula. Dimension zero yields 1=1^{-1}.

Direct prerequisites: `GN.0/gram-det-biorthogonal`, `GN.0/covolume-square-gram`, `mathlib:Module.Basis.ofZLatticeBasis`, `mathlib:Module.Basis.ofZLatticeBasis_span`, `mathlib:LinearMap.BilinForm.dualBasis`, `mathlib:LinearMap.BilinForm.apply_dualBasis_right`, `mathlib:LinearMap.BilinForm.dualSubmodule_span_of_basis`, `mathlib:Module.Basis.restrictScalars`, `mathlib:ZSpan.discreteTopology_pi_basisFun`, `mathlib:instIsZLatticeRealSpan`, `mathlib:ZLattice.covolume_pos`

API contracts:

- `covolume_dual` (characterisation; native signature elaborated): For a discrete full Z-lattice L in a finite-dimensional real inner-product space E with canonical intrinsic Euclidean volume, covol(L*)=covol(L)^{-1}, where L* is the existing integer-valued inner dual in E. The full-lattice property of L* follows from the existing dual-basis and span-basis results and is not an additional assumption.

Mathematical test contracts:

- `scaled_line_dual_covolume` (computation): The inner dual of 2Z in R has covolume 1/2.
- `standard_covolume_one` (compatibility): The standard integral lattice in Euclidean n-space has covolume one, including n=0.
- `ambient_polar_not_intrinsic` (non-example): The ambient inner dual of the zero subgroup in R is all of R, not a discrete full lattice; a lower-rank lattice must be dualized inside its span.

Source/derivation: [HoreshKarasik2023](https://research-explorer.ista.ac.at/download/14717/14720/2023_QuarterlyJourMath_Horesh.pdf), Corollary A.3, published p.1285.. Adds the Euclidean volume consequence, not a replacement for the built algebraic dual or double-dual theorem.

Use: `Horesh–Karasik Appendix A–B; primitive-orthogonal covolume proof`: Adds the Euclidean volume consequence, not a replacement for the built algebraic dual or double-dual theorem.

### Equal covolumes of primitive orthogonal intersections

**theorem; `GN.0/primitive-orthogonal-covolume`.** Atlas planet: Primitive orthogonal covolumes. Let Δ be a discrete full self-dual lattice in E for the real inner pairing, and W a real subspace such that L=Δ∩W spans W. Then K=Δ∩W-perp is a full lattice in W-perp and covol(K)=covol(L), intrinsically. In particular, for rational W in R^n and Δ=Z^n, the primitive intersections W∩Z^n and W-perp∩Z^n have equal covolumes. This includes n=0, W=0 and W=E.

Hypotheses and conventions: E is a finite-dimensional real normed inner-product space. All subspaces carry the inherited inner product; all volumes are their canonical intrinsic Euclidean volumes, including volume one in dimension zero. Δ is a discrete full Z-submodule of E. W is a real subspace. L is the existing comap of Δ along W→E; span_R(L)=W, written intrinsically as span_R(L in W)=top. P is the existing image of Δ under orthogonal projection E→W-perp. Self-duality Δ*=Δ is explicit. For Z^n use the integral span of the standard orthonormal basis; rational W means its integral intersection spans it.

Proof/construction outline: 1. By covolume-dual applied to Δ and self-duality, its positive covolume equals its inverse, hence equals one. This does not follow from determinant sign or from integral splitting. 2. By saturated-adapted-basis and projected-adapted-basis, P=π(Δ) is a full lattice in W-perp. covolume-projection gives covol(P)=1/covol(L). 3. dual-projection-comap with self-duality identifies P* with K. orthogonal-intersection-basis supplies the intrinsic full-lattice conclusion independently of any covolume manipulation. Apply covolume-dual to P and simplify the two inverses to obtain covol(K)=covol(L). 4. For Δ the integral span of any finite orthonormal basis, apply dualSubmodule_span_of_basis: the basis is its own inner-dual by dualBasis_eq_iff and inner_eq_ite. This proves self-duality; the standard Euclidean basis gives Z^n. The condition on W is equivalent to having a rational coordinate basis, by clearing finitely many denominators, not by assuming the conclusion about W-perp. 5. Do not replace L by a proper finite-index sublattice with the same span: its covolume changes. Do not assert Δ=L⊕K over Z; the diagonal/antidiagonal example has index two.

Direct prerequisites: `GN.0/orthogonal-intersection-basis`, `GN.0/saturated-adapted-basis`, `GN.0/projected-adapted-basis`, `GN.0/covolume-projection`, `GN.0/covolume-dual`, `GN.0/dual-projection-comap`, `mathlib:LinearMap.BilinForm.dualSubmodule_span_of_basis`, `mathlib:LinearMap.BilinForm.dualBasis_eq_iff`, `mathlib:OrthonormalBasis.inner_eq_ite`, `mathlib:ZLattice.covolume_pos`

API contracts:

- `primitive_orthogonal_covolume` (characterisation; native signature elaborated): Let Δ be a discrete full self-dual lattice in E for the real inner pairing, and W a real subspace such that L=Δ∩W spans W. Then K=Δ∩W-perp is a full lattice in W-perp and covol(K)=covol(L), intrinsically. In particular, for rational W in R^n and Δ=Z^n, the primitive intersections W∩Z^n and W-perp∩Z^n have equal covolumes. This includes n=0, W=0 and W=E.

Mathematical test contracts:

- `diagonal_equal_covolumes` (computation): Both primitive diagonal and antidiagonal intersections in Z² have intrinsic covolume √2.
- `nonsaturation_changes_covolume` (non-example): Replacing the primitive generator (1,1) by (2,2) doubles its one-dimensional covolume while leaving its orthogonal line unchanged.
- `no_integral_orthogonal_splitting` (non-example): The primitive diagonal and antidiagonal generators form an index-two sublattice, not an integral basis of Z².

Source/derivation: [HoreshKarasik2023](https://research-explorer.ista.ac.at/download/14717/14720/2023_QuarterlyJourMath_Horesh.pdf), Corollary B.6, published p.1291; Couveignes2020 p.493 uses its standard-lattice case.. Closes the fourth routed Couveignes input and states the reusable self-dual ambient generalization as an explicit worker deduction.

Use: `Couveignes2020 p.493, orthogonal relation/evaluation lattices`: Closes the fourth routed Couveignes input and states the reusable self-dual ambient generalization as an explicit worker deduction.

### Complete a prescribed primitive-intersection basis

**lemma; `GN.0/prescribed-primitive-basis`.** If W is a real subspace whose intersection with L spans W, every prescribed integral basis c:Fin r→(L∩W) extends to an integral basis b of L indexed by Fin r disjoint-union Fin s, with r+s=d and initial vectors exactly c_i in E.

Hypotheses and conventions: E is a finite-dimensional real normed inner-product space, L a discrete full Z-submodule, and d=dim_R E. Reuse native IsZLattice, Basis and Basis.flag. The minimum index i:Fin d is zero-based; dimension zero has no index. L∩W means the native lattice comap along W→E. The input c is a basis of this saturated intersection, not an independent family of nontrivial index.

Proof/construction outline: 1. Take one completion b₀ and its intersection basis c₀ from saturated-adapted-basis. Equality of integral ranks permits reindexing its first block by Fin r. 2. Use the native basis-extension map to send each initial c₀-vector to the prescribed c-vector and keep each complementary vector fixed. Construct the inverse with the inverse c-to-c₀ coordinate change on the first block and identity on the complement. 3. Check both compositions on b₀ using the two basis coordinate identities. The block change is an integral linear automorphism, not just a real invertible map. Transport b₀ along it. 4. The native lattice rank identity gives r+s=d. No orthogonality or shortness of the complementary vectors is asserted.

Direct prerequisites: `GN.0/saturated-adapted-basis`, `mathlib:Module.Basis.constr`, `mathlib:Module.Basis.equiv`, `mathlib:Module.finrank_eq_card_basis`, `mathlib:ZLattice.rank`

API contracts:

- `saturated_adapted_basis_of_basis` (relation; native signature elaborated): If W is a real subspace whose intersection with L spans W, every prescribed integral basis c:Fin r→(L∩W) extends to an integral basis b of L indexed by Fin r disjoint-union Fin s, with r+s=d and initial vectors exactly c_i in E.

Mathematical test contracts:

- `prescribed_basis_orientation` (computation): The columns (1,1),(0,−1) have determinant −1, so orientation reversal is allowed.
- `prescribed_nonprimitive_column` (non-example): Every matrix with first column (2,0) has even determinant, hence cannot be an integral basis of Z².

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.3, simultaneous integral-basis statement before (2.1). Worker decomposition of the source's basis-completion step, preserving a prescribed basis rather than choosing an unrelated one.

Use: `Henk2002 (2.1), Theorem 1.5 and the upper-Minkowski proof`: Worker decomposition of the source's basis-completion step, preserving a prescribed basis rather than choosing an unrelated one.

### Integral basis adapted to a rational complete flag

**lemma; `GN.0/integral-rational-flag`.** For a real basis w:Fin d→E with w_i∈L, there is an integral basis b:Fin d→L whose real extension has exactly the same native basis flags as w at every k=0,…,d.

Hypotheses and conventions: E is a finite-dimensional real normed inner-product space, L a discrete full Z-submodule, and d=dim_R E. Reuse native IsZLattice, Basis and Basis.flag. The minimum index i:Fin d is zero-based; dimension zero has no index. Equality concerns real prefix spans, not equality of the vectors or their integral spans. The w_i need not be an integral basis.

Proof/construction outline: 1. Induct on d; the zero-dimensional case uses the empty basis. 2. For d>0 let W be the real span of the first d−1 vectors of w. Their restricted independent family is a real basis of W by the native basis-of-span construction. They belong to L∩W and span W, so the comap intersection is a discrete full lattice in W. 3. Apply the induction hypothesis within W to get an integral basis matching every proper prefix. Complete this particular basis by prescribed-primitive-basis; the complement has rank one. 4. Reindex the initial block followed by the final vector as Fin d. Literal preservation of the initial vectors preserves every proper prefix, and the last prefix is E. Separate incompatible one-cut choices would not establish this simultaneous assertion.

Direct prerequisites: `GN.0/prescribed-primitive-basis`, `mathlib:Module.Basis.flag`, `mathlib:Module.Basis.span`, `mathlib:Module.Basis.ofZLatticeBasis`, `mathlib:ZLattice.comap_discreteTopology`, `mathlib:ZLattice.rank`, `mathlib:Module.finrank_eq_card_basis`

API contracts:

- `exists_integral_basis_same_flag` (relation; native signature elaborated): For a real basis w:Fin d→E with w_i∈L, there is an integral basis b:Fin d→L whose real extension has exactly the same native basis flags as w at every k=0,…,d.

Mathematical test contracts:

- `flag_independent_not_integral` (non-example): The columns (1,1),(1,−1) have determinant −2: an independent integral-valued real basis is not necessarily an integral basis.
- `flag_standard_prefix` (compatibility): For the standard real basis of R³, x lies in flag 2 exactly when x_2=0.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.3, prefix-span equality and (2.1). Supplies the entire integral rational-flag step without creating a new flag carrier.

Use: `Henk2002 (2.1), Theorem 1.5 and the upper-Minkowski proof`: Supplies the entire integral rational-flag step without creating a new flag carrier.

### Mixed embedding covolume normalization

**comparison; `GN.0/mixed-embedding-normalization`.** For a number field K and an invertible fractional O_K-ideal I, use the existing mixed real/complex embedding and its real Haar measure. Its lattice covolume is absNorm(I)·2^(−r₂)·√|disc K|, and its real ambient dimension is [K:Q]. A complex coordinate contributes two real dimensions; replacing the metric or embedding coordinates requires the actual real determinant factor.

Hypotheses and conventions: The displayed formula uses the native mixed embedding, not a freely chosen weighted arithmetic metric.

Proof/construction outline: 1. Import the two pinned declarations without re-planning the embedding or ideal-lattice carrier. 2. When a consumer chooses a weighted metric, apply the native absolute-real-determinant covolume formula to that specific map.

Direct prerequisites: `mathlib:NumberField.mixedEmbedding.finrank`, `mathlib:NumberField.mixedEmbedding.covolume_idealLattice`, `mathlib:ZLattice.covolume_eq_det_mul_measureReal`

Mathematical test contracts:

- `mixed_embedding_normalization_test_1` (characterisation): The complex-place factor is 2^(-r₂), not 2^(r₂).
- `mixed_embedding_normalization_test_2` (characterisation): Real dimension is r₁+2r₂, not r₁+r₂.

Source/derivation: [MathlibPin](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib), CanonicalEmbedding/Basic.lean:213 and Discriminant/Basic.lean:134. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `CanonicalEmbedding/Basic.lean:213 and Discriminant/Basic.lean:134`: Mixed embedding covolume normalization supplies the corresponding staged target or its next declaration.

## GN.1: Successive minima, finite counts and sharp product bounds

Coverage: **partial**. Finished 300-node planning pass at the protocol budget; source/supplier/implementation closure is not asserted.

The follow-up must establish the following scope before closure:

- Reconcile Fin/real-valued minimum indexing with the actual supplier convention before implementation.
- Read the full Hermite-basis/John ellipsoid source proofs. Read Smith evaluation-polytope/Vandermonde, coefficient adjustment and independent BLPS flatness supplier; add their missing target declarations.

### Ordered tail product inequality

**lemma; `GN.1/ordered-tail-product`.** For monotone a:Fin n→R with a_j≥1, every i:Fin n satisfies a_i^(n−i.val)≤∏j a_j.

Hypotheses and conventions: Indices are zero-based; tail length n−i.val is strictly positive. The lower bound 1 and monotonicity are both load-bearing.

Proof/construction outline: 1. Use the temporary comparison function c_j=1 if j<i and c_j=a_i if i≤j; this is not a new packaged definition. 2. For j<i use 1≤a_j; for i≤j use monotonicity. All c_j≥0, so multiply the inequalities. 3. Split indices below i and at least i. The first product is one, the second has exactly n−i.val equal factors. 4. The consumer must supply and sort the independent nonzero lattice vectors; this arithmetic lemma does not supply minima witnesses.

Direct prerequisites: No additional supplier beyond the displayed native context.

API contracts:

- `ordered_tail_product` (relation; native signature elaborated): Natural-power form avoids root conventions.

Mathematical test contracts:

- `ordered_tail_product_test_1` (characterisation): For (1,2,4), the three left sides are 1,4,4 and total product is 8.
- `ordered_tail_product_test_2` (characterisation): Dropping a_j≥1 fails for (1/2,2): final term 2 exceeds total product 1.
- `ordered_tail_product_test_3` (characterisation): Dropping ordering fails for (4,1): first square 16 exceeds product 4.

Source/derivation: [Couveignes2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf), §3, printed p.494 (physical PDF p.8), ordered norms and intrinsic closed-ball volume. The motivating passage is independently located. The node is a worker-derived auxiliary consequence with its stated additional hypotheses; its proof is supplied by the listed pinned/library or preceding-node inputs, not claimed verbatim as a theorem of this article.

Use: `Couveignes2020, §3, pp.493–494; routed GN input`: An ordered product bound controls each norm using the length of its tail.

### Ordered-product root bound

**theorem; `GN.1/ordered-product-root-bound`.** Atlas planet: Ordered-product bound. If a:Fin n→R is monotone, a_j≥1, and ∏j a_j≤V, then a_i≤V^(1/(n−i.val)) for every i:Fin n, using Real.rpow.

Hypotheses and conventions: V≥1 follows from the hypotheses; no negative-base root. n−i.val>0 follows from i:Fin n; n=0 has no requested index.

Proof/construction outline: 1. Combine ordered-tail-product with the upper product bound. 2. A product of terms ≥1 is ≥1, hence V≥1. Also a_i≥0 and the tail length is positive. 3. Apply the pinned positive inverse-power equivalence at exponent the real cast of n−i.val, rewriting the real power at a natural exponent as the natural power. 4. With paper index k=i.val+1 the denominator is n+1−k, not n−k.

Direct prerequisites: `GN.1/ordered-tail-product`, `mathlib:Real.le_rpow_inv_iff_of_pos`

API contracts:

- `ordered_product_root_bound` (relation; native signature elaborated): Paper's one-based denominator without last-index off-by-one.

Mathematical test contracts:

- `ordered_product_root_bound_test_1` (characterisation): All terms 1 and V=1 give equality.
- `ordered_product_root_bound_test_2` (characterisation): For (1,2,4),V=8, the final bound has exponent 1, not 1/0.
- `ordered_product_root_bound_test_3` (characterisation): For (2,2),V=4, the first bound 2≤√4 is exact.

Source/derivation: [Couveignes2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf), §3, printed p.494 (physical PDF p.8), ordered norms and intrinsic closed-ball volume. The motivating passage is independently located. The node is a worker-derived auxiliary consequence with its stated additional hypotheses; its proof is supplied by the listed pinned/library or preceding-node inputs, not claimed verbatim as a theorem of this article.

Use: `Couveignes2020, §3, pp.493–494; routed GN input`: An ordered product bound controls each norm using the length of its tail.

### Intrinsic volume of an orthonormal cube

**lemma; `GN.1/orthonormal-cube-volume`.** For a full real orthonormal basis b:Fin n→E and r≥0, volume_E{x : every |(b.repr x)_i|≤r}=ENNReal.ofReal((2r)^n).

Hypotheses and conventions: E finite-dimensional with Borel structure and canonical volume. n=0 and r=0 allowed; no new cube type.

Proof/construction outline: 1. The coordinate map b.repr is measure preserving. Compose it with volume-preserving ofLp into the finite real function space. 2. The set becomes the interval box [−r,r]^n, by |t|≤r iff −r≤t≤r. 3. Apply Real.volume_Icc_pi. Side lengths 2r are nonnegative, so product of ofReal side lengths equals ofReal((2r)^n). 4. The empty-coordinate space has unit mass: n=0,r=0 gives 1, but n>0,r=0 gives 0.

Direct prerequisites: `mathlib:OrthonormalBasis.measurePreserving_repr`, `mathlib:PiLp.volume_preserving_ofLp`, `mathlib:Real.volume_Icc_pi`

API contracts:

- `orthonormal_cube_volume` (relation; native signature elaborated): ENNReal volume avoids an implicit finiteness assumption in toReal.

Mathematical test contracts:

- `orthonormal_cube_volume_test_1` (characterisation): n=0,r=0 gives volume 1.
- `orthonormal_cube_volume_test_2` (characterisation): n=1,r=0 gives volume 0.
- `orthonormal_cube_volume_test_3` (characterisation): n=2,r=3 gives 36, not 9: r is half-side length.

Source/derivation: [Couveignes2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf), §3, printed p.494 (physical PDF p.8), ordered norms and intrinsic closed-ball volume. The motivating passage is independently located. The node is a worker-derived auxiliary consequence with its stated additional hypotheses; its proof is supplied by the listed pinned/library or preceding-node inputs, not claimed verbatim as a theorem of this article.

Use: `Couveignes2020, §3, pp.493–494; routed GN input`: An inscribed coordinate cube supplies the lower bound on intrinsic ball volume.

### A cube inside the Euclidean unit ball

**lemma; `GN.1/inscribed-cube`.** For a real orthonormal basis b:Fin n→E and n>0, the coordinate cube |(b.repr x)_i|≤1/√n is contained in closedBall_E(0,1).

Hypotheses and conventions: The norm is Euclidean and b orthonormal; a general algebraic basis is insufficient. The normalized radius requires n>0.

Proof/construction outline: 1. b.repr preserves norm; use the pinned Euclidean norm-square sum identity. 2. Each coordinate square is at most 1/n because n>0 and its modulus is ≤1/√n. 3. Sum n inequalities: ‖x‖²≤n/n=1. Nonnegative norm implies ‖x‖≤1, exactly closed-ball membership. 4. This is set containment, not a volume theorem. Cube vertices lie on the boundary; containment in the open ball is false.

Direct prerequisites: `mathlib:EuclideanSpace.real_norm_sq_eq`

API contracts:

- `inscribed_cube` (relation; native signature elaborated): Closed-set containment with explicit positive dimension.

Mathematical test contracts:

- `inscribed_cube_test_1` (characterisation): n=1 gives [−1,1], whose endpoints have norm 1.
- `inscribed_cube_test_2` (characterisation): n=4 gives half-side 1/2; the vertex with all four coordinates 1/2 has squared norm 1.
- `inscribed_cube_test_3` (characterisation): Half-side 1 fails for n=2 at (1,1).

Source/derivation: [Couveignes2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf), §3, printed p.494 (physical PDF p.8), ordered norms and intrinsic closed-ball volume. The motivating passage is independently located. The node is a worker-derived auxiliary consequence with its stated additional hypotheses; its proof is supplied by the listed pinned/library or preceding-node inputs, not claimed verbatim as a theorem of this article.

Use: `Couveignes2020, §3, pp.493–494; routed GN input`: An inscribed coordinate cube supplies the lower bound on intrinsic ball volume.

### Intrinsic Euclidean ball lower bound

**theorem; `GN.1/intrinsic-ball-lower-bound`.** For a finite-dimensional real inner-product space E with an orthonormal basis indexed by Fin n and n>0, ENNReal.ofReal((2/√n)^n)≤volume_E(closedBall_E(0,1)). The real lower constant equals 2^n·n^(−n/2).

Hypotheses and conventions: Intrinsic volume on E; for a proper subspace of R^M instantiate E with the subspace. This is a closed ball, not its boundary sphere. Dimension zero has unit volume and is separate from division by √0.

Proof/construction outline: 1. Set r=1/√n≥0. 2. Apply orthonormal-cube-volume and inscribed-cube, followed by measure monotonicity. 3. Rewrite 2·(√n)⁻¹ as 2/√n. To match the paper use n>0, √n=n^(1/2), natural-power/real-power comparison and power multiplication to obtain 2^n·n^(−n/2). 4. No compactness-to-finiteness or toReal step is needed for the delivered inequality. Any real-volume corollary must explicitly use finiteness of closed-ball volume.

Direct prerequisites: `GN.1/orthonormal-cube-volume`, `GN.1/inscribed-cube`

API contracts:

- `intrinsic_ball_lower_bound` (relation; native signature elaborated): Closed-ball lower bound for the space's own canonical volume.

Mathematical test contracts:

- `intrinsic_ball_lower_bound_test_1` (characterisation): n=1 gives exact lower bound 2.
- `intrinsic_ball_lower_bound_test_2` (characterisation): n=4 gives lower constant 1.
- `intrinsic_ball_lower_bound_test_3` (characterisation): n=2 gives lower constant 2, not 4; ambient volume of a ball in a proper subspace is zero and cannot satisfy this intrinsic estimate.

Source/derivation: [Couveignes2020](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf), §3, printed p.494 (physical PDF p.8), ordered norms and intrinsic closed-ball volume. The motivating passage is independently located. The node is a worker-derived auxiliary consequence with its stated additional hypotheses; its proof is supplied by the listed pinned/library or preceding-node inputs, not claimed verbatim as a theorem of this article.

Use: `Couveignes2020, §3, pp.493–494; routed GN input`: An inscribed coordinate cube supplies the lower bound on intrinsic ball volume.

### Successive minima on the native lattice and convex body

**definition; `GN.1/successive-minimum`.** Atlas planet: Successive minima. For a Z-submodule L of a finite-dimensional real normed space E, K:ConvexBody E and i:Fin d, define λ_i(L,K) as the real infimum of A_i={r∈R : 0≤r and i.val+1≤dim_R span_R{x∈L : gauge K x≤r}}. This is a real-valued function on existing carriers. Its geometric laws require L discrete and full and 0∈interior K; central symmetry is needed for Minkowski’s product inequality.

Hypotheses and conventions: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof/construction outline: 1. Use the existing Mathlib gauge, native submodule span and dimension APIs. The definition introduces only the scalar invariant. 2. The finite index excludes nonexistent minima above the ambient dimension. Compactness/nonempty interior are not encoded as a new type; ConvexBody supplies compactness and convexity, and theorems state the interior hypothesis. 3. Under the geometric hypotheses, greedy-minimum-family and successive-minimum-is-least prove nonemptiness, positivity and actual attainment of the defining infimum. A real infimum of an empty set is never used as a geometric minimum.

Direct prerequisites: `mathlib:ConvexBody`, `mathlib:gauge`, `mathlib:finrank_span_eq_card`, `mathlib:gauge_closedBall`

API contracts:

- `successiveMin_def` (characterisation; native signature elaborated): λ_i is the infimum of the nonnegative gauge-rank thresholds A_i specified in the definition.
- `successiveMin_isLeast` (relation; native signature elaborated): For every i:Fin d, λ_i(L,K) is the least element of A_i={r≥0 : dim span_R{x∈L : gauge K x≤r}≥i.val+1}.
- `successiveMin_pos` (relation; native signature elaborated): For every i:Fin d, 0<λ_i(L,K).
- `successiveMin_monotone` (relation; native signature elaborated): The function i↦λ_i(L,K), on Fin d, is monotone.
- `successiveMin_le_iff` (relation; native signature elaborated): For r≥0, λ_i(L,K)≤r if and only if i.val+1≤dim_R span_R((L:Set E)∩r·(K:Set E)).
- `exists_successiveMin_witnesses` (relation; native signature elaborated): There exists a real basis b indexed by Fin d such that b_i∈L, gauge K b_i=λ_i(L,K), and every x∈L of gauge<λ_i lies in span_R{b_j:j<i}. In particular b_i∈λ_iK and all minimum bounds are attained by one independent family.
- `successiveMin_antitone_body` (relation; native signature elaborated): If K⊆K' and both bodies contain zero in their interior, then λ_i(L,K')≤λ_i(L,K) for every i.
- `successiveMin_monotone_lattice` (relation; native signature elaborated): If L≤M are discrete full lattices in the same E, then λ_i(M,K)≤λ_i(L,K).
- `successiveMin_smul_body` (relation; native signature elaborated): For c>0, λ_i(L,cK)=λ_i(L,K)/c. The scalar action on ConvexBody is the existing one.
- `successiveMin_linearEquiv` (relation; native signature elaborated): Let e:E≃_R F, L'=e(L) as integral submodules, and K'=e(K) as convex bodies. For valid indices i,j with i.val=j.val, λ_j(L',K')=λ_i(L,K). Finite-dimensional normed real E,F and the discrete/full/interior hypotheses are understood. The equivalence need not be orthogonal or unimodular.
- `successiveMin_first_le_iff` (relation; native signature elaborated): If d>0 and r≥0, λ_0(L,K)≤r if and only if there exists x∈L with x≠0 and x∈rK.
- `successiveMin_box` (relation; native signature elaborated): Let b be a real basis of E indexed by Fin d, L=span_Z(range b), and a:Fin d→R positive and nondecreasing. If K is the convex body {x:∀j, a_j|b.repr(x)_j|≤1}, then λ_i(L,K)=a_i for every i.
- `successiveMin_crosspolytope` (relation; native signature elaborated): With b,L and positive nondecreasing a as for rectangular-body-minima, let K={x:Σ_j a_j|b.repr(x)_j|≤1}. Then λ_i(L,K)=a_i. Together with weighted-crosspolytope-volume, this attains equality in minkowski-second-lower.

Mathematical test contracts:

- `successive_min_interval_half` (computation): For L=Z⊂R and K=[−2,2], λ_0(L,K)=1/2.
- `successive_min_rectangle_2_3` (computation): For L=Z² and K={|x_0|≤1/2, |x_1|≤1/3}, (λ_0,λ_1)=(2,3).
- `successive_min_empty_product` (degenerate): For the zero lattice in R^0 and its singleton convex body, the product over all minima indices is 1.
- `successive_min_scaled_lattice` (non-example): For L=2Z in R and K=[−1,1], λ_0=2, not 1.
- `successive_min_unit_ball_norm` (compatibility): On K=closedBall(0,1), the defining rank condition is dim span{x∈L : norm x≤r}≥i.val+1.
- `successive_min_no_integral_basis` (non-example): In Z² with the unit square, vectors (1,1),(1,−1) independently attain both minima 1 but their integral span has index two.
- `successive_min_closed_boundary` (characterisation): In Z and K=[−1,1], the attained minimum 1 has nonzero boundary witnesses; the strict sublevel {x∈Z : gauge K x<1} is {0}.

Acceptance: For Z in R and K=[−2,2], the only minimum is 1/2. For Z² and {|x|≤1/2, |y|≤1/3}, the ordered minima are 2,3. In dimension zero the index type is empty and the product of minima is 1. For 2Z and [−1,1], the minimum is 2, ruling out lattice-invariant or always-one definitions. For the Euclidean unit ball the gauge is exactly the ambient norm, with no square. The vectors attaining minima need not generate the entire integral lattice.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The precise source argument is expanded into the listed native-library steps. Core attainment is also valid without symmetry: this is an explicitly stated worker generalization of the same proof, not a claim that the source states it.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs. `DiophantineApproximationAndTranscendence:DT.2/absolute-minkowski-for-twisted-heights`: Supplies the attained ordinary successive-minima API. Combine minkowski-second-lower and minkowski-second-upper for the now-planned generic two-sided bound; no adelic or absolute theorem is inferred.

### Finite lattice points below a gauge bound

**lemma; `GN.1/finite-gauge-sublevel`.** For every real R, the set {x∈L : gauge K x≤R} is finite.

Hypotheses and conventions: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof/construction outline: 1. If R<0 the set is empty by gauge_nonneg. If R=0 it is {0}, because K is bounded and absorbs every vector, and gauge_eq_zero applies. 2. For R>0, positive homogeneity and gauge_le_one_iff_mem_closure identify the gauge sublevel with R·K; K is closed. This is compact, hence bounded. 3. Choose an integral basis of the full lattice, extend it to a real basis via ofZLatticeBasis and use its integral-span equality. ZSpan.setFinite_inter gives finiteness of the intersection with the bounded dilate.

Direct prerequisites: `mathlib:gauge_nonneg`, `mathlib:gauge_eq_zero`, `mathlib:gauge_smul_of_nonneg`, `mathlib:gauge_le_one_iff_mem_closure`, `mathlib:ConvexBody.isClosed`, `mathlib:ConvexBody.isCompact`, `mathlib:ZSpan.setFinite_inter`, `mathlib:Module.Basis.ofZLatticeBasis`, `mathlib:Module.Basis.ofZLatticeBasis_span`, `mathlib:absorbent_nhds_zero`, `mathlib:IsCompact.isVonNBounded`

API contracts:

- `finite_gauge_sublevel` (relation; native signature elaborated): For every real R, the set {x∈L : gauge K x≤R} is finite.

Acceptance: Negative bound gives the empty set. Bound zero gives precisely the zero lattice vector. For Z² and the unit square, bound 2 gives 25 points.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The precise source argument is expanded into the listed native-library steps. Core attainment is also valid without symmetry: this is an explicitly stated worker generalization of the same proof, not a claim that the source states it.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### An attained least gauge outside a proper subspace

**lemma; `GN.1/minimum-outside-subspace`.** If W<E is a proper real subspace, there is v∈L∖W with gauge K v≤gauge K x for every x∈L∖W. In particular the selected gauge is positive.

Hypotheses and conventions: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof/construction outline: 1. Fullness of L gives y∈L∖W: otherwise span_R L≤W contradicts W≠top. 2. Set R=gauge K y. The points of L∖W with gauge≤R form a nonempty subset of finite-gauge-sublevel. Choose one minimizing gauge with Set.exists_min_image. 3. Any other point outside W either lies in this finite set or has gauge>R≥gauge v. Since 0∈W, v≠0, and gauge_pos proves strict positivity. No enumeration of an infinite set or unproved compactness of L∖W is used.

Direct prerequisites: `GN.1/finite-gauge-sublevel`, `mathlib:IsZLattice`, `mathlib:Set.exists_min_image`, `mathlib:gauge_pos`, `mathlib:absorbent_nhds_zero`, `mathlib:ConvexBody.isCompact`, `mathlib:IsCompact.isVonNBounded`

API contracts:

- `exists_min_gauge_outside` (relation; native signature elaborated): If W<E is a proper real subspace, there is v∈L∖W with gauge K v≤gauge K x for every x∈L∖W. In particular the selected gauge is positive.

Acceptance: For Z², the rectangle with minima 2,3, and W=Re_0, the least outside gauge is 3. W=top is excluded because the complement is empty.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The precise source argument is expanded into the listed native-library steps. Core attainment is also valid without symmetry: this is an explicitly stated worker generalization of the same proof, not a claim that the source states it.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### A greedy independent family with a strict-sublevel flag

**lemma; `GN.1/greedy-minimum-family`.** There is a real-linearly-independent family v:Fin d→L such that a_i=gauge K v_i is positive and nondecreasing, and every x∈L with gauge K x<a_i lies in span_R{v_j:j<i}. The family has d members and thus spans E over R. No integral-basis claim is made.

Hypotheses and conventions: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof/construction outline: 1. Inductively construct a family of length k≤d. Its span has dimension k by finrank_span_eq_card, so is proper for k<d. Choose v_k of least gauge outside this span by minimum-outside-subspace. 2. Append v_k; linearIndependent_finSucc' gives independence from nonmembership. Previously chosen least gauges are no greater than the new one, because the candidate set outside the growing span shrinks. Each new vector is nonzero, so its gauge is positive. 3. Minimality of v_k implies that every strictly shorter lattice vector is already in the old span. Preserve all earlier strict-sublevel assertions when appending. 4. At k=d, independence and the dimension count give spanning. This finite recursion also constructs the empty family when d=0 and does not claim that independent minimum vectors are a Z-basis.

Direct prerequisites: `GN.1/minimum-outside-subspace`, `mathlib:linearIndependent_finSucc'`, `mathlib:finrank_span_eq_card`, `mathlib:basisOfLinearIndependentOfCardEqFinrank'`

API contracts:

- `exists_greedy_gauge_family` (relation; native signature elaborated): There is a real-linearly-independent family v:Fin d→L such that a_i=gauge K v_i is positive and nondecreasing, and every x∈L with gauge K x<a_i lies in span_R{v_j:j<i}. The family has d members and thus spans E over R. No integral-basis claim is made.

Acceptance: Repeated minima are allowed: the unit square has both values 1. Strict inequality in the flag is essential: e_0 has gauge equal to the first minimum and does not lie in the zero prefix.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The precise source argument is expanded into the listed native-library steps. Core attainment is also valid without symmetry: this is an explicitly stated worker generalization of the same proof, not a claim that the source states it.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### Attainment of the rank threshold

**lemma; `GN.1/successive-minimum-is-least`.** For every i:Fin d, λ_i(L,K) is the least element of A_i={r≥0 : dim span_R{x∈L : gauge K x≤r}≥i.val+1}.

Hypotheses and conventions: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof/construction outline: 1. Use greedy-minimum-family and write a_i=gauge K v_i. Positivity and monotonicity show that v_0,…,v_i lie in the a_i-sublevel. Their span has dimension i+1, hence a_i∈A_i. 2. If r<a_i, every lattice point of gauge≤r has gauge<a_i, hence belongs to the span of the i previous vectors. Its span has dimension at most i, by Submodule.finrank_mono and finrank_span_eq_card. Such r cannot belong to A_i. 3. Thus a_i is the least element of the nonempty, bounded-below A_i. The defining real infimum equals this least element; transfer its IsLeast property and equality to λ_i. This establishes attainment before using a boundary threshold.

Direct prerequisites: `GN.1/successive-minimum`, `GN.1/greedy-minimum-family`, `mathlib:Submodule.finrank_mono`, `mathlib:finrank_span_eq_card`, `mathlib:Real.sInf_nonneg`

API contracts:

- `successiveMin_isLeast` (relation; native signature elaborated): For every i:Fin d, λ_i(L,K) is the least element of A_i={r≥0 : dim span_R{x∈L : gauge K x≤r}≥i.val+1}.

Acceptance: A_i contains its endpoint; replacing ≤ by < in the membership assertion is false. For the rectangle 2,3 the rank jumps from zero to one at 2 and from one to two at 3.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The precise source argument is expanded into the listed native-library steps. Core attainment is also valid without symmetry: this is an explicitly stated worker generalization of the same proof, not a claim that the source states it.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### Positivity of each successive minimum

**lemma; `GN.1/successive-minimum-pos`.** For every i:Fin d, 0<λ_i(L,K).

Hypotheses and conventions: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof/construction outline: 1. By successive-minimum-is-least the value equals the gauge of the corresponding greedy vector. 2. That vector is outside a subspace containing zero; gauge_pos or the positivity part of greedy-minimum-family gives the result.

Direct prerequisites: `GN.1/successive-minimum-is-least`, `GN.1/greedy-minimum-family`

API contracts:

- `successiveMin_pos` (relation; native signature elaborated): For every i:Fin d, 0<λ_i(L,K).

Acceptance: For (1/2)Z and the unit interval the minimum is 1/2: positivity does not imply a lower bound of 1.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The precise source argument is expanded into the listed native-library steps. Core attainment is also valid without symmetry: this is an explicitly stated worker generalization of the same proof, not a claim that the source states it.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### Ordering of successive minima

**lemma; `GN.1/successive-minimum-monotone`.** The function i↦λ_i(L,K), on Fin d, is monotone.

Hypotheses and conventions: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof/construction outline: 1. For i≤j, membership in A_j implies membership in A_i because i+1≤j+1. 2. Apply the least-element statement at i to the attained threshold λ_j. Equal consecutive values are permitted.

Direct prerequisites: `GN.1/successive-minimum-is-least`

API contracts:

- `successiveMin_monotone` (relation; native signature elaborated): The function i↦λ_i(L,K), on Fin d, is monotone.

Acceptance: The unit cube has a constant sequence of minima; strict monotonicity is false.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The precise source argument is expanded into the listed native-library steps. Core attainment is also valid without symmetry: this is an explicitly stated worker generalization of the same proof, not a claim that the source states it.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### Closed-dilate rank characterization

**lemma; `GN.1/successive-minimum-le-iff`.** For r≥0, λ_i(L,K)≤r if and only if i.val+1≤dim_R span_R((L:Set E)∩r·(K:Set E)).

Hypotheses and conventions: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof/construction outline: 1. Positive homogeneity and the closed unit gauge sublevel identify {x:gauge K x≤r} with rK when r>0. For r=0 both sets are {0}, using boundedness/absorbency and gauge_eq_zero. 2. The rank condition is upward closed in r because gauge sublevels are nested. The least-element result therefore identifies its truth set exactly with [λ_i,∞). 3. This is the original source definition using dilates, not just an inequality for an unrelated gauge.

Direct prerequisites: `GN.1/successive-minimum-is-least`, `mathlib:gauge_eq_zero`, `mathlib:gauge_smul_of_nonneg`, `mathlib:gauge_le_one_iff_mem_closure`, `mathlib:Submodule.finrank_mono`, `mathlib:absorbent_nhds_zero`, `mathlib:ConvexBody.isCompact`, `mathlib:IsCompact.isVonNBounded`

API contracts:

- `successiveMin_le_iff` (relation; native signature elaborated): For r≥0, λ_i(L,K)≤r if and only if i.val+1≤dim_R span_R((L:Set E)∩r·(K:Set E)).

Acceptance: At r=0 the right side is false for every valid index. At r=λ_i the threshold holds.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The precise source argument is expanded into the listed native-library steps. Core attainment is also valid without symmetry: this is an explicitly stated worker generalization of the same proof, not a claim that the source states it.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### Simultaneously attained independent minimum vectors

**theorem; `GN.1/successive-minimum-witnesses`.** Atlas planet: Independent minimum vectors. There exists a real basis b indexed by Fin d such that b_i∈L, gauge K b_i=λ_i(L,K), and every x∈L of gauge<λ_i lies in span_R{b_j:j<i}. In particular b_i∈λ_iK and all minimum bounds are attained by one independent family.

Hypotheses and conventions: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof/construction outline: 1. Take the greedy family, convert its ambient vectors to a real basis using the full dimension count, and preserve its literal vectors. 2. Use successive-minimum-is-least to identify every greedy gauge with the corresponding minimum. Its strict-sublevel flag transfers unchanged. 3. Closed gauge sublevels at the positive λ_i give b_i∈λ_iK. This result is stronger than separate existence of unrelated rank witnesses and weaker than an integral basis.

Direct prerequisites: `GN.1/greedy-minimum-family`, `GN.1/successive-minimum-is-least`, `GN.1/successive-minimum-pos`, `mathlib:basisOfLinearIndependentOfCardEqFinrank'`, `mathlib:gauge_le_one_iff_mem_closure`, `mathlib:gauge_smul_of_nonneg`, `mathlib:absorbent_nhds_zero`

API contracts:

- `exists_successiveMin_witnesses` (relation; native signature elaborated): There exists a real basis b indexed by Fin d such that b_i∈L, gauge K b_i=λ_i(L,K), and every x∈L of gauge<λ_i lies in span_R{b_j:j<i}. In particular b_i∈λ_iK and all minimum bounds are attained by one independent family.

Acceptance: The unit-square diagonal pair has determinant −2 and attains both minima, so attainment alone does not certify an integral basis. The zero-dimensional family is an empty real basis and has no minimum value to evaluate.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The precise source argument is expanded into the listed native-library steps. Core attainment is also valid without symmetry: this is an explicitly stated worker generalization of the same proof, not a claim that the source states it.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### Larger bodies have smaller minima

**lemma; `GN.1/successive-minimum-antitone-body`.** If K⊆K' and both bodies contain zero in their interior, then λ_i(L,K')≤λ_i(L,K) for every i.

Hypotheses and conventions: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof/construction outline: 1. At the attained threshold of K, every lattice vector in rK also lies in rK'. Apply span/rank monotonicity. 2. Apply the closed-dilate characterization for K'.

Direct prerequisites: `GN.1/successive-minimum-le-iff`, `GN.1/successive-minimum-pos`, `mathlib:Submodule.finrank_mono`

API contracts:

- `successiveMin_antitone_body` (relation; native signature elaborated): If K⊆K' and both bodies contain zero in their interior, then λ_i(L,K')≤λ_i(L,K) for every i.

Acceptance: Changing [−1,1] to [−2,2] divides the only minimum by two.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The precise source argument is expanded into the listed native-library steps. Core attainment is also valid without symmetry: this is an explicitly stated worker generalization of the same proof, not a claim that the source states it.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### Sublattices have larger minima

**lemma; `GN.1/successive-minimum-monotone-lattice`.** If L≤M are discrete full lattices in the same E, then λ_i(M,K)≤λ_i(L,K).

Hypotheses and conventions: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof/construction outline: 1. For every nonnegative r, L∩rK⊆M∩rK. Apply rank monotonicity to their spans. 2. Use the attained threshold λ_i(L,K) and the closed-dilate characterization. A finite-index equality of minima is not inferred.

Direct prerequisites: `GN.1/successive-minimum-le-iff`, `GN.1/successive-minimum-pos`, `mathlib:Submodule.finrank_mono`

API contracts:

- `successiveMin_monotone_lattice` (relation; native signature elaborated): If L≤M are discrete full lattices in the same E, then λ_i(M,K)≤λ_i(L,K).

Acceptance: 2Z⊂Z gives minima 2 and 1 for the unit interval.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The precise source argument is expanded into the listed native-library steps. Core attainment is also valid without symmetry: this is an explicitly stated worker generalization of the same proof, not a claim that the source states it.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### Positive body scaling inverts the minima

**lemma; `GN.1/successive-minimum-smul-body`.** For c>0, λ_i(L,cK)=λ_i(L,K)/c. The scalar action on ConvexBody is the existing one.

Hypotheses and conventions: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof/construction outline: 1. The map x↦cx is a homeomorphism, so cK again has zero in its interior. 2. Use the pinned identity gauge(cK)=c⁻¹ gauge(K). Thus the admissible thresholds for cK are exactly 1/c times those for K. 3. Transport the least element in both directions, using c>0 for order preservation. Do not use c=0, which collapses a positive-dimensional body and violates the hypotheses.

Direct prerequisites: `GN.1/successive-minimum-is-least`, `mathlib:gauge_smul_left_of_nonneg`, `mathlib:ConvexBody.coe_smul`

API contracts:

- `successiveMin_smul_body` (relation; native signature elaborated): For c>0, λ_i(L,cK)=λ_i(L,K)/c. The scalar action on ConvexBody is the existing one.

Acceptance: Scaling the unit interval by 3 changes its minimum from 1 to 1/3.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, Lemma 2.8, printed pp.23–24 (physical pp.13–14). The precise source argument is expanded into the listed native-library steps. Core attainment is also valid without symmetry: this is an explicitly stated worker generalization of the same proof, not a claim that the source states it.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### Invariance under a simultaneous linear change

**lemma; `GN.1/successive-minimum-linear-equiv`.** Let e:E≃_R F, L'=e(L) as integral submodules, and K'=e(K) as convex bodies. For valid indices i,j with i.val=j.val, λ_j(L',K')=λ_i(L,K). Finite-dimensional normed real E,F and the discrete/full/interior hypotheses are understood. The equivalence need not be orthogonal or unimodular.

Hypotheses and conventions: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof/construction outline: 1. For r≥0, linearity and bijectivity identify L'∩rK' with e(L∩rK). Their real spans correspond under the linear equivalence, so their dimensions agree. 2. The admissible thresholds are equal, and their defining infima are equal. The identity and composition laws follow by equality of image carriers and composition of linear equivalences. 3. Use the images of both lattice and body; moving only one does not preserve minima. Restricting a lower-rank lattice to its real span is an intrinsic instance on that subspace, not an ambient full-lattice assertion.

Direct prerequisites: `GN.1/successive-minimum-le-iff`, `GN.1/successive-minimum-pos`, `mathlib:LinearEquiv.finrank_eq`

API contracts:

- `successiveMin_linearEquiv` (relation; native signature elaborated): Let e:E≃_R F, L'=e(L) as integral submodules, and K'=e(K) as convex bodies. For valid indices i,j with i.val=j.val, λ_j(L',K')=λ_i(L,K). Finite-dimensional normed real E,F and the discrete/full/interior hypotheses are understood. The equivalence need not be orthogonal or unimodular.

Acceptance: Scaling both Z and [−1,1] by 2 preserves minimum 1; scaling only the lattice gives 2. A shear acts simultaneously on the standard lattice and unit square without changing their two minima.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, change-of-coordinates remark after Theorem 2.9, printed pp.24–25 (physical pp.14–15); corrected nonsingularity hypothesis in sourceIssue E11.. The source intends a nonsingular linear change. The packet explicitly requires a linear equivalence and transports both lattice and body; it does not adopt the unrestricted printed formulation. Rank invariance follows from the pinned LinearEquiv.finrank_eq.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### The first minimum detects a nonzero lattice point

**lemma; `GN.1/successive-minimum-first`.** If d>0 and r≥0, λ_0(L,K)≤r if and only if there exists x∈L with x≠0 and x∈rK.

Hypotheses and conventions: E is a finite-dimensional real normed vector space; L is a discrete full Z-submodule (the existing IsZLattice carrier). K is an existing ConvexBody E with 0 in its interior. No replacement gauge or lattice carrier is introduced. Write d=finrank_R E. An index i:Fin d means the source’s (i.val+1)-st minimum. There is no minimum to evaluate when d=0. Symmetry is assumed only in statements that need it.

Proof/construction outline: 1. Apply successive-minimum-le-iff at the zero index: the span of L∩rK must have dimension at least one. 2. A span has positive dimension exactly when its generating set contains a nonzero vector: if every generator is zero its span is bottom; conversely a nonzero generator gives a one-dimensional independent singleton. 3. This adapter uses the existing first theorem without reproving Blichfeldt or Minkowski first.

Direct prerequisites: `GN.1/successive-minimum-le-iff`, `mathlib:finrank_span_eq_card`, `mathlib:Submodule.finrank_mono`

API contracts:

- `successiveMin_first_le_iff` (relation; native signature elaborated): If d>0 and r≥0, λ_0(L,K)≤r if and only if there exists x∈L with x≠0 and x∈rK.

Acceptance: For Z and the unit interval, r=1 has witnesses ±1, while every 0≤r<1 has none.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, definition and Lemma 2.8, pp.23–24; Henk p.2 before Theorem 1.2. The precise source argument is expanded into the listed native-library steps. Core attainment is also valid without symmetry: this is an explicitly stated worker generalization of the same proof, not a claim that the source states it.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### Volume of a weighted cross-polytope in basis coordinates

**lemma; `GN.1/weighted-crosspolytope-volume`.** Let E be a finite-dimensional real inner-product space with canonical volume, o an orthonormal basis and b any real basis, both indexed by Fin n. For positive a_i, volume{x:Σ_i a_i·|b.repr(x)_i|≤1}=ofReal((2^n/n!)·|det_o(b)|/∏_i a_i). Dimension zero is included.

Hypotheses and conventions: E has the canonical inner-product volume; o is orthonormal and b is a basis, not an arbitrary dependent family. Each a_i>0. n can be zero.

Proof/construction outline: 1. In R^n the unit l1 ball has volume 2^n/n!: specialize the pinned volume_sum_rpow_le to p=1,r=1 and simplify Gamma(n+1)=n!. For n=0 use the singleton finite-product measure directly, since the quoted closed-ball theorem requires a nonempty index. No new standard-ball-volume theorem is planned. 2. The weighted body is the image of that unit l1 ball under the invertible map t↦Σ_i (t_i/a_i)b_i. Transport through the volume-preserving o coordinates and the existing ofLp map. 3. Its absolute determinant is |det_o(b)|/∏a_i. Apply the pinned Haar image formula and simplify ENNReal factors, using positivity of the a_i and finiteness of the volume.

Direct prerequisites: `mathlib:MeasureTheory.volume_sum_rpow_le`, `mathlib:Real.Gamma_nat_eq_factorial`, `mathlib:MeasureTheory.Measure.addHaar_image_linearMap`, `mathlib:OrthonormalBasis.measurePreserving_repr`, `mathlib:PiLp.volume_preserving_ofLp`, `mathlib:Matrix.det_mul`, `mathlib:volume_euclideanSpace_eq_dirac`, `mathlib:Matrix.det_diagonal`

API contracts:

- `weighted_crosspolytope_volume` (relation; native signature elaborated): Let E be a finite-dimensional real inner-product space with canonical volume, o an orthonormal basis and b any real basis, both indexed by Fin n. For positive a_i, volume{x:Σ_i a_i·|b.repr(x)_i|≤1}=ofReal((2^n/n!)·|det_o(b)|/∏_i a_i). Dimension zero is included.

Acceptance: n=0 gives volume one. With the standard basis and a=(2,3), the planar diamond has area 1/3. Replacing the basis by (2e_0,3e_1), with a=(1,1), gives area 12.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, proof of the lower bound in Theorem 2.9, printed p.27 (physical p.17). The cited proof or example is decomposed into the listed declarations, importing the pinned native volume and covolume identities. Exercise 2.9 is proved by the stated coordinate-rank argument. Intrinsic spaces and dimension zero are explicit worker extensions.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### A symmetric body contains its weighted inscribed cross-polytope

**lemma; `GN.1/crosspolytope-containment`.** Let K be symmetric about zero with zero in its interior. For a real basis b and positive a_i, if b_i∈a_iK for every i, then {x:Σ_i a_i|b.repr(x)_i|≤1}⊆K.

Hypotheses and conventions: K:ConvexBody E, 0∈interior K and x∈K implies −x∈K. b is a finite real basis. All a_i are positive. The containment is independent of any lattice or volume normalization.

Proof/construction outline: 1. Membership b_i∈a_iK implies gauge K b_i≤a_i. 2. Expand x in the basis. The native gauge_sum_le bounds its gauge by the sum of the gauges of the coordinate multiples. Positive homogeneity and gauge_neg handle each sign, giving gauge(t b_i)=|t| gauge(b_i). 3. The weighted l1 constraint bounds this sum by 1. Since K is closed, the gauge≤1 characterization gives x∈K. 4. The coefficient index is the number of vectors, not the ambient coordinate dimension of a separate presentation; this uses the corrected convention in Evertse Lemma 2.10 (E8).

Direct prerequisites: `mathlib:gauge_le_of_mem`, `mathlib:gauge_sum_le`, `mathlib:gauge_neg`, `mathlib:gauge_smul_of_nonneg`, `mathlib:gauge_le_one_iff_mem_closure`, `mathlib:absorbent_nhds_zero`

API contracts:

- `weighted_crosspolytope_subset` (relation; native signature elaborated): Let K be symmetric about zero with zero in its interior. For a real basis b and positive a_i, if b_i∈a_iK for every i, then {x:Σ_i a_i|b.repr(x)_i|≤1}⊆K.

Acceptance: The diamond with vertices ±e_0,±e_1 is contained in the unit square. Without symmetry, containing b_i/a_i does not imply containing its negative.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, Lemma 2.10 and lower-bound proof, printed pp.26–27 (physical pp.16–17). The cited proof or example is decomposed into the listed declarations, importing the pinned native volume and covolume identities. Exercise 2.9 is proved by the stated coordinate-rank argument. Intrinsic spaces and dimension zero are explicit worker extensions.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### An independent lattice family has determinant at least the covolume

**lemma; `GN.1/lattice-determinant-lower-bound`.** In a finite-dimensional real inner-product space with canonical volume, let L be a discrete full lattice, o an orthonormal basis and b a real basis with every b_i∈L. Then covolume(L)≤|det_o(b)|.

Hypotheses and conventions: Both bases have the full ambient rank, including rank zero. L is discrete and full. The measure is intrinsic canonical Euclidean volume.

Proof/construction outline: 1. Set M=span_Z(range b). It is a discrete full lattice by the existing integral-span-of-real-basis instances, and M≤L. 2. The existing integral basis b.restrictScalars identifies covolume(M) with |det_o(b)| by covolume_eq_det_mul_measureReal and the unit volume of an orthonormal fundamental domain. 3. The pinned index formula gives covolume(M)/covolume(L)=[L:M], a natural number. Both covolumes are positive, so this integer is nonzero and hence at least one. Multiply by the positive covolume(L). 4. The independent family need not be an integral basis of L; index two in the diagonal square example is retained.

Direct prerequisites: `mathlib:ZLattice.covolume_div_covolume_eq_relIndex'`, `mathlib:ZLattice.covolume_eq_det_mul_measureReal`, `mathlib:ZLattice.covolume_pos`, `mathlib:ZSpan.fundamentalDomain_ae_parallelepiped`, `mathlib:OrthonormalBasis.volume_parallelepiped`, `mathlib:instIsZLatticeRealSpan`, `mathlib:Module.Basis.restrictScalars`

API contracts:

- `covolume_le_abs_basis_det` (relation; native signature elaborated): In a finite-dimensional real inner-product space with canonical volume, let L be a discrete full lattice, o an orthonormal basis and b a real basis with every b_i∈L. Then covolume(L)≤|det_o(b)|.

Acceptance: The diagonal and antidiagonal vectors in Z² have absolute determinant 2≥1. For 2Ze_0⊕3Ze_1 the basis determinant and covolume are both 6.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, lower-bound proof, printed p.27 (physical p.17). The cited proof or example is decomposed into the listed declarations, importing the pinned native volume and covolume identities. Exercise 2.9 is proved by the stated coordinate-rank argument. Intrinsic spaces and dimension zero are explicit worker extensions.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### Minkowski’s sharp lower product inequality

**theorem; `GN.1/minkowski-second-lower`.** Atlas planet: Minkowski lower product bound. For a discrete full lattice L in a finite-dimensional real inner-product space E and a symmetric convex body K with zero in its interior, (2^d/d!)·covolume(L)≤(∏_{i:Fin d}λ_i(L,K))·volume.real(K). Here d=finrank_R E and volume is intrinsic canonical Euclidean volume. The formula holds also for d=0.

Hypotheses and conventions: E is a finite-dimensional real inner-product space with Borel structure and canonical volume. L is a discrete full integral submodule. K is compact convex, centrally symmetric about zero, and has zero in its interior. A lower-rank lattice is first considered as a full lattice in its real span with that span’s own volume. No ambient-volume inequality for a measure-zero subspace is claimed.

Proof/construction outline: 1. Choose the simultaneously attained real basis b from successive-minimum-witnesses and write a_i=λ_i>0. Its vectors lie in a_iK. 2. By crosspolytope-containment the corresponding weighted cross-polytope D lies in K. Both are compact, so their ENNReal volumes are finite and volume monotonicity passes to real volumes. 3. Apply weighted-crosspolytope-volume and lattice-determinant-lower-bound: volume(D)≥(2^d/d!)covolume(L)/(∏a_i). Multiply by the positive product. 4. When d=0, the empty product and factorial are one, and K is the unique singleton with canonical volume one and the only lattice has covolume one. Thus equality holds; no positive-dimensional volume theorem or invalid minimum index is applied.

Direct prerequisites: `GN.1/successive-minimum-witnesses`, `GN.1/successive-minimum-pos`, `GN.1/weighted-crosspolytope-volume`, `GN.1/crosspolytope-containment`, `GN.1/lattice-determinant-lower-bound`, `mathlib:ConvexBody.isCompact`, `mathlib:volume_euclideanSpace_eq_dirac`

API contracts:

- `minkowski_second_lower` (relation; native signature elaborated): For a discrete full lattice L in a finite-dimensional real inner-product space E and a symmetric convex body K with zero in its interior, (2^d/d!)·covolume(L)≤(∏_{i:Fin d}λ_i(L,K))·volume.real(K). Here d=finrank_R E and volume is intrinsic canonical Euclidean volume. The formula holds also for d=0.

Acceptance: For Z² and the unit diamond, product 1 times area 2 equals 2²/2!. For Z² and the unit square, product 1 times area 4 is strictly larger than 2. For 2Z and [−3,3], minimum 2/3 times length 6 equals 4=(2/1!)·2. For dimension zero both sides are 1.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, Theorem 2.9 and its complete lower-bound proof, printed pp.24,26–27. The cited proof or example is decomposed into the listed declarations, importing the pinned native volume and covolume identities. Exercise 2.9 is proved by the stated coordinate-rank argument. Intrinsic spaces and dimension zero are explicit worker extensions.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### All prescribed minima of a coordinate box

**theorem; `GN.1/rectangular-body-minima`.** Let b be a real basis of E indexed by Fin d, L=span_Z(range b), and a:Fin d→R positive and nondecreasing. If K is the convex body {x:∀j, a_j|b.repr(x)_j|≤1}, then λ_i(L,K)=a_i for every i.

Hypotheses and conventions: b:Basis (Fin d) R E where d=finrank_R E. L is exactly its integral span. All a_i>0 and a is monotone. The stated set is the carrier of K.

Proof/construction outline: 1. Positive a_j make the set a compact convex symmetric neighborhood of zero, by its basis-coordinate box description. 2. The first i+1 basis vectors lie in a_iK, giving rank at least i+1 at r=a_i. 3. For 0≤r<a_i and x∈L∩rK, every coordinate with j≥i is an integer of absolute value at most r/a_j<1, hence zero. Thus all such points lie in the span of the first i vectors. 4. Use successive-minimum-le-iff and positivity to identify the exact endpoint. For a repeated value the rank may jump by more than one; all corresponding minima equal that value.

Direct prerequisites: `GN.1/successive-minimum-le-iff`, `GN.1/successive-minimum-pos`, `mathlib:finrank_span_eq_card`, `mathlib:Submodule.finrank_mono`

API contracts:

- `successiveMin_box` (relation; native signature elaborated): Let b be a real basis of E indexed by Fin d, L=span_Z(range b), and a:Fin d→R positive and nondecreasing. If K is the convex body {x:∀j, a_j|b.repr(x)_j|≤1}, then λ_i(L,K)=a_i for every i.

Acceptance: a=(2,3) gives minima 2,3. a=(1,1,4) gives a repeated first value; the two shortest lattice vectors may be opposites and still fail to be independent.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, Example 2, printed pp.25–26 (physical pp.15–16). The cited proof or example is decomposed into the listed declarations, importing the pinned native volume and covolume identities. Exercise 2.9 is proved by the stated coordinate-rank argument. Intrinsic spaces and dimension zero are explicit worker extensions.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### Sharpness via prescribed cross-polytope minima

**theorem; `GN.1/crosspolytope-minima`.** With b,L and positive nondecreasing a as for rectangular-body-minima, let K={x:Σ_j a_j|b.repr(x)_j|≤1}. Then λ_i(L,K)=a_i. Together with weighted-crosspolytope-volume, this attains equality in minkowski-second-lower.

Hypotheses and conventions: b:Basis (Fin d) R E where d=finrank_R E. L is exactly its integral span. All a_i>0 and a is monotone. The weighted l1 set is the carrier of K.

Proof/construction outline: 1. The positive weighted l1 ball in basis coordinates is compact, convex, symmetric and a neighborhood of zero. The first i+1 basis vectors belong to a_iK. 2. If 0≤r<a_i, a lattice point in rK has each weighted absolute coordinate at most r. Its integer coordinates with j≥i must vanish, exactly as in the coordinate-box argument. 3. Hence the rank threshold is exactly a_i by successive-minimum-le-iff. The proof is supplied here for the source’s Exercise 2.9, rather than treating an exercise as a proved theorem. 4. The existing determinant/covolume identification for L=span_Z b and weighted-crosspolytope-volume show that product(a)·volume(K)=(2^d/d!)covolume(L).

Direct prerequisites: `GN.1/successive-minimum-le-iff`, `GN.1/successive-minimum-pos`, `GN.1/weighted-crosspolytope-volume`, `mathlib:finrank_span_eq_card`, `mathlib:Submodule.finrank_mono`, `mathlib:ZLattice.covolume_eq_det_mul_measureReal`

API contracts:

- `successiveMin_crosspolytope` (relation; native signature elaborated): With b,L and positive nondecreasing a as for rectangular-body-minima, let K={x:Σ_j a_j|b.repr(x)_j|≤1}. Then λ_i(L,K)=a_i. Together with weighted-crosspolytope-volume, this attains equality in minkowski-second-lower.

Acceptance: a=(2,3), b standard in R² gives minima 2,3 and area 1/3, so the product-volume is 2. Empty dimension has no minimum index and still attains the volume-product equality 1.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.3, Example 3 and Exercise 2.9, printed p.26 (physical p.16). The cited proof or example is decomposed into the listed declarations, importing the pinned native volume and covolume identities. Exercise 2.9 is proved by the stated coordinate-rank argument. Intrinsic spaces and dimension zero are explicit worker extensions.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### Volume of a closed linear-forms parallelepiped

**lemma; `GN.1/linear-forms-box-volume`.** For n≥0, an invertible real n×n matrix A and positive a_i, the set C={x∈R^n:∀i, |(Ax)_i|≤a_i} has volume ofReal(2^n·(∏a_i)/|det A|).

Hypotheses and conventions: The matrix is square and det A≠0; all a_i>0. Lebesgue measure is the existing product volume on Fin n→R. n=0 is allowed for this volume identity.

Proof/construction outline: 1. Write C as the inverse image of the closed coordinate box [−a,a] under the native linear map Matrix.toLin'(A). 2. Use the pinned determinant adapter and nonzero determinant to apply the Haar preimage formula. The scale factor is |det A|⁻¹. 3. Use Real.volume_Icc_pi for the target box: its volume is the product of 2a_i, or 2^n times the product of a_i. All factors are positive, so the ENNReal and real expressions agree. 4. The same inverse linear equivalence transports compactness of the box; symmetry and convexity follow from linearity and the coordinate inequalities. These are native set properties, not a new parallelepiped type. The empty-dimensional formula is 1.

Direct prerequisites: `mathlib:LinearMap.det_toLin'`, `mathlib:LinearMap.equivOfDetNeZero`, `mathlib:MeasureTheory.Measure.addHaar_preimage_linearMap`, `mathlib:Real.volume_Icc_pi`

API contracts:

- `linear_forms_box_volume` (relation; native signature elaborated): For n≥0, an invertible real n×n matrix A and positive a_i, the set C={x∈R^n:∀i, |(Ax)_i|≤a_i} has volume ofReal(2^n·(∏a_i)/|det A|).

Acceptance: For n=1, A=(−2) and a=3 the set is [−3/2,3/2] of length 3. For A=diag(2,3), a=(2,3), the region is the unit square of area 4. For n=0 the determinant, coordinate product and volume are one.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.2, Corollary 2.6, printed p.20 (physical p.10). Exact source theorem, with a determinant/closed-box volume helper. The source pushes the lattice forward; this equivalent worker proof pulls the box back and imports the pinned compact first theorem.

Use: `Evertse §2.3; Henk Definition 1.1 and (2.2); GN.1/GN.5; EffectiveBoundsCompactModels`: Supplies attained independent short directions, exact normalization and the sharp lower product bound; arithmetic metrics and integer norm floors remain consumer inputs.

### Minkowski’s boundary linear-forms theorem

**theorem; `GN.1/minkowski-linear-forms`.** Atlas planet: Minkowski linear forms theorem. For n≥1, an invertible real n×n matrix A and positive a_i with ∏a_i≥|det A|, there exists z∈Z^n, z≠0, with |Σ_j A_ij z_j|≤a_i for every i. Every coordinate inequality is non-strict, including at equality in the determinant bound.

Hypotheses and conventions: n≥1, A:Matrix(Fin n,Fin n,R), det A≠0, all a_i>0, and ∏a_i≥|det A|. No rationality of the matrix entries is required.

Proof/construction outline: 1. Apply linear-forms-box-volume to the compact convex symmetric set C. The product hypothesis gives volume(C)≥2^n. 2. Use the standard real basis, its integral span and the native fundamental domain [0,1)^n. Its volume is one by ZSpan.volume_fundamentalDomain, and ZSpan.isAddFundamentalDomain' supplies the subgroup fundamental-domain contract. 3. The integral-span lattice is countable and discrete. Since n≥1, the ambient space is nontrivial. Instantiate the pinned compact version exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure; compactness is essential for the non-strict boundary threshold. 4. The returned nonzero real lattice vector has integer coordinates in the standard basis. Read them as z:Fin n→Z; injectivity of the integer casts preserves nonzeroness, and membership in C gives exactly the displayed inequalities. 5. The source pushes the lattice forward into the unit cube. This proof pulls the cube back and keeps the standard lattice: the invertible matrix identifies the two arguments, with the same absolute determinant and boundary convention.

Direct prerequisites: `GN.1/linear-forms-box-volume`, `mathlib:MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`, `mathlib:ZSpan.isAddFundamentalDomain'`, `mathlib:ZSpan.volume_fundamentalDomain`, `mathlib:instIsZLatticeRealSpan`

API contracts:

- `minkowski_linear_forms` (relation; native signature elaborated): For n≥1, an invertible real n×n matrix A and positive a_i with ∏a_i≥|det A|, there exists z∈Z^n, z≠0, with |Σ_j A_ij z_j|≤a_i for every i. Every coordinate inequality is non-strict, including at equality in the determinant bound.

Acceptance: For n=1, A=(2), a=2, z=1 is a boundary witness; replacing ≤ with < would eliminate every nonzero integer witness. A determinant of −2 has the same threshold as 2. n=0 is excluded: its only integer vector is zero despite the empty-product determinant inequality.

Source/derivation: [EvertseGeometry](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf), §2.2, Corollary 2.6 and complete proof, printed p.20 (physical p.10). Exact source theorem, with a determinant/closed-box volume helper. The source pushes the lattice forward; this equivalent worker proof pulls the box back and imports the pinned compact first theorem.

Use: `DiophantineApproximationAndTranscendence:DT.0/dirichlet-approximation-from-minkowski and DT.2/linear-form-dirichlet-exponent`: Discharges the existing GN.1 request for the exact compact-boundary linear-forms theorem. The consumer can replace its stage prerequisite by this node.

### Integral basis for the strict minimum flag

**lemma; `GN.1/integral-minimum-flag`.** There is an integral basis b:Fin d→L such that x∈L and gauge_K(x)<λ_i imply x belongs to the real flag of b at i, the span of its first i vectors.

Hypotheses and conventions: E is a finite-dimensional real normed inner-product space, L a discrete full Z-submodule, and d=dim_R E. Reuse native IsZLattice, Basis and Basis.flag. The minimum index i:Fin d is zero-based; dimension zero has no index. K is a native ConvexBody with zero in its interior. Write λ_i=successiveMin L K i. Symmetry is imposed only on the final counting theorem. No bound on the individual gauges of b_i is claimed; only the attained real basis's flag is preserved.

Proof/construction outline: 1. Take the simultaneously attained real basis and its strict-sublevel property from successive-minimum-witnesses. 2. Apply integral-rational-flag, since all the real basis vectors lie in L. Identify the existing prefix-span notation with native Basis.flag. 3. Rewrite the strict-sublevel memberships through the flag equalities. Repeated minima are allowed; dimension zero has an empty conclusion.

Direct prerequisites: `GN.1/successive-minimum-witnesses`, `GN.0/integral-rational-flag`, `mathlib:Module.Basis.flag`

API contracts:

- `exists_integral_minimum_flag` (relation; native signature elaborated): There is an integral basis b:Fin d→L such that x∈L and gauge_K(x)<λ_i imply x belongs to the real flag of b at i, the span of its first i vectors.

Mathematical test contracts:

- `minimum_flag_strict_boundary` (non-example): The nonzero constant vector in R² does not belong to flag zero; equality at the first minimum is not a strict sublevel.
- `minimum_flag_empty` (degenerate): The empty standard basis of R⁰ has flag zero equal to the entire zero space.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), pp.3–4, (2.1)–(2.3). Transfers the already planned attained-minimum flag, without pretending the minimum vectors themselves form an integral basis.

Use: `Henk2002 Theorem 1.5, pp.4–5`: Transfers the already planned attained-minimum flag, without pretending the minimum vectors themselves form an integral basis.

### Volume of interior-disjoint convex translates

**lemma; `GN.1/finite-interior-disjoint-volume`.** Let K⊆E be compact and convex, and v:I→E a finite family. If v_i+int(K) and v_j+int(K) are disjoint whenever i≠j, then μ(⋃_i(v_i+K))=|I|·μ(K). Equality is in the nonnegative extended reals.

Hypotheses and conventions: E is finite-dimensional real normed with Borel structure; μ is an additive Haar measure. No symmetry, origin condition or positive-dimensional interior of K is required. The index type may be empty. Repeated translation vectors are not silently deduplicated; the stated interior-disjointness hypothesis controls when the cardinal factor is valid.

Proof/construction outline: 1. Every translated set is compact, hence closed and measurable, and convex. Native convex-frontier measure zero applies even when the body is lower-dimensional. 2. If a point lies in two translates but not both translated interiors, it lies in the frontier of at least one translate, because both sets are closed. The disjoint-interior hypothesis therefore puts their intersection inside two null frontiers. 3. Thus the finite family is pairwise a.e. disjoint. Apply native measure_iUnion₀, convert the finite-index infinite sum to a finite sum, and use translation invariance to make every summand μ(K). 4. An empty family gives zero. If K has empty interior, its whole measure is zero by the frontier theorem, so repeated labels cause no contradiction.

Direct prerequisites: `mathlib:Convex.addHaar_frontier`, `mathlib:Convex.translate`, `mathlib:Homeomorph.image_interior`, `mathlib:IsCompact.image`, `mathlib:IsCompact.isClosed`, `mathlib:IsClosed.measurableSet`, `mathlib:MeasureTheory.measure_iUnion₀`, `mathlib:MeasureTheory.measure_preimage_mul_right`

API contracts:

- `finite_interior_disjoint_translate_volume` (compatibility; native signature elaborated): Let K⊆E be compact and convex, and v:I→E a finite family. If v_i+int(K) and v_j+int(K) are disjoint whenever i≠j, then μ(⋃_i(v_i+K))=|I|·μ(K). Equality is in the nonnegative extended reals.

Mathematical test contracts:

- `touching_interval_union` (computation): The closed intervals [0,1] and [1,2] have union of real volume 2 despite sharing an endpoint.
- `repeated_translates_need_disjoint_interiors` (non-example): Two copies of [0,1] have union volume 1, not 2; their interiors are not disjoint.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.5 (3.2), and p.6 the two volume factorizations after (3.4). Supplies the measure-theoretic additivity required for lattice translates whose closed boundaries can touch.

Use: `Henk2002 §3, equations (3.2)–(3.6)`: Supplies the measure-theoretic additivity required for lattice translates whose closed boundaries can touch.

### Sections of a finite translated union

**lemma; `GN.1/finite-translate-section`.** For every K⊆E×F, y∈F and finite v:I→E, {x:(x,y)∈U_v(K)}=⋃_i(v_i+{x:(x,y)∈K}).

Hypotheses and conventions: E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their native product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and native linear maps, not new constructors or carrier types.

Proof/construction outline: 1. Expand membership in the finite union and in an image: (x,y)=(v_i+a,b) forces b=y and x=v_i+a. 2. Use the same witness i and a in the reverse direction. No convexity, compactness or measure hypothesis is used.

Direct prerequisites: No additional supplier beyond the displayed native context.

API contracts:

- `finite_translate_section` (compatibility; native signature elaborated): For every K⊆E×F, y∈F and finite v:I→E, {x:(x,y)∈U_v(K)}=⋃_i(v_i+{x:(x,y)∈K}).

Mathematical test contracts:

- `empty_translate_family` (degenerate): The union of translates of [0,1] indexed by Fin 0 is the empty real set.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.6, the section inclusion between (3.6) and the successive integrations. Keeps section formation and the finite translation family compatible; no measure of a chosen center is involved.

Use: `Henk2002 §3, equations (3.2)–(3.6)`: Keeps section formation and the finite translation family compatible; no measure of a chosen center is involved.

### Translation containment of an enlarged convex section

**lemma; `GN.1/convex-section-enlargement`.** If K⊆E×F is convex and r≥1, then for every y∈F there exists t∈E such that {x:(x,y)∈U_v(K)}⊆t+{x:(x,y)∈U_v(f₁,r(K))}.

Hypotheses and conventions: E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their native product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and native linear maps, not new constructors or carrier types.

Proof/construction outline: 1. Fix y. Its section C={x:(x,y)∈K} is convex directly from convexity of K. The E-section of f₁,r(K) is rC by expanding the image coordinates. 2. If C is empty, the source union section is empty by finite-translate-section, so t=0 works. 3. Otherwise choose any a∈C for this fixed y and set t=(1−r)a. Since r>0 and 0≤1/r≤1, native Convex.add_smul_sub_mem puts b=a+r⁻¹(x−a) in C for every x∈C. 4. The vector identity x=rb+(1−r)a gives C⊆rC+t. Adding each unchanged v_i and taking their union yields the claimed containment. 5. This is a pointwise existential statement in y. It neither constructs nor assumes a measurable choice y↦a or y↦t.

Direct prerequisites: `GN.1/finite-translate-section`, `mathlib:Convex.add_smul_sub_mem`

API contracts:

- `convex_section_enlargement` (compatibility; native signature elaborated): If K⊆E×F is convex and r≥1, then for every y∈F there exists t∈E such that {x:(x,y)∈U_v(K)}⊆t+{x:(x,y)∈U_v(f₁,r(K))}.

Mathematical test contracts:

- `shifted_convex_section_translation` (computation): [2,3]⊆[4,6]−2, using a=2 and r=2.
- `shifted_convex_section_not_origin_nested` (non-example): [2,3] is not a subset of its dilation [4,6] about zero; the translation cannot be omitted.
- `nonconvex_section_counterexample` (non-example): There is no real t with {0,1,3}⊆{0,2,6}+t; arbitrary nonconvex sections do not satisfy the containment.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.6, pointwise t(x) inclusion immediately after (3.6). Makes the source's elementary fiber enlargement explicit, including empty sections and the required translating vector.

Use: `Henk2002 §3, equations (3.2)–(3.6)`: Makes the source's elementary fiber enlargement explicit, including empty sections and the required translating vector.

### Section-volume monotonicity under partial dilation

**lemma; `GN.1/section-union-volume-monotone`.** For convex K⊆E×F, r≥1 and every y∈F, μ{x:(x,y)∈U_v(K)}≤μ{x:(x,y)∈U_v(f₁,r(K))}.

Hypotheses and conventions: E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their native product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and native linear maps, not new constructors or carrier types.

Proof/construction outline: 1. Apply convex-section-enlargement at this fixed y to obtain one t. 2. Monotonicity of the native outer measure bounds the first section measure by that of the translated enlarged section. 3. Translation invariance removes t. This pointwise inequality does not need K compact or section measurability; those enter only for the product-measure integral.

Direct prerequisites: `GN.1/convex-section-enlargement`, `mathlib:MeasureTheory.measure_preimage_mul_right`

API contracts:

- `section_union_volume_mono` (compatibility; native signature elaborated): For convex K⊆E×F, r≥1 and every y∈F, μ{x:(x,y)∈U_v(K)}≤μ{x:(x,y)∈U_v(f₁,r(K))}.

Mathematical test contracts:

- `unit_dilation_section` (compatibility): At r=1, f₁,r(K)=K for every subset of ℝ×ℝ, so every section inequality is equality.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.6, the inequality between section-volume integrals. Separates translation invariance from the subsequent Tonelli argument.

Use: `Henk2002 §3, equations (3.2)–(3.6)`: Separates translation invariance from the subsequent Tonelli argument.

### Volume monotonicity of partially dilated unions

**lemma; `GN.1/partial-dilation-union-volume`.** For compact convex K⊆E×F, finite v:I→E and r≥1, (μ×ν)(U_v(K))≤(μ×ν)(U_v(f₁,r(K))).

Hypotheses and conventions: E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their native product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and native linear maps, not new constructors or carrier types.

Proof/construction outline: 1. Each partial dilation and each translation is continuous. Its image of K is compact, and native finite-union compactness makes both U_v(K) and U_v(f₁,r(K)) compact. 2. Both are Borel measurable. Native measurable_measure_prodMk_right supplies measurable section-volume functions; finite-dimensional Haar measures are s-finite. 3. Apply native prod_apply_symm to both unions. Compare their lower integrals by lintegral_mono and section-union-volume-monotone. 4. No center-selection function is integrated. Empty families, empty bodies, empty individual sections and zero-dimensional factors are handled by these same native formulas.

Direct prerequisites: `GN.1/section-union-volume-monotone`, `mathlib:IsCompact.image`, `mathlib:isCompact_iUnion`, `mathlib:IsCompact.isClosed`, `mathlib:IsClosed.measurableSet`, `mathlib:measurable_measure_prodMk_right`, `mathlib:MeasureTheory.Measure.prod_apply_symm`, `mathlib:MeasureTheory.lintegral_mono`

API contracts:

- `partial_dilation_union_volume` (compatibility; native signature elaborated): For compact convex K⊆E×F, finite v:I→E and r≥1, (μ×ν)(U_v(K))≤(μ×ν)(U_v(f₁,r(K))).

Acceptance: At r=1 both measurable unions are the same, so the product-volume comparison is equality. For an empty index type both sides are zero, including when either factor has dimension zero. The integration uses only the two native measurable section-volume functions; no measurable choice of the pointwise center is permitted as an unstated premise.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.6 (3.6) and the three-line successive-integration argument ending on p.7. Proves the exact finite-union volume comparison that underlies the source's consecutive-minimum ratio estimate.

Use: `Henk2002 §3, equations (3.2)–(3.6)`: Proves the exact finite-union volume comparison that underlies the source's consecutive-minimum ratio estimate.

### Complementary coordinate dilation of a union

**lemma; `GN.1/complementary-dilation-union`.** For any real r, any K⊆E×F and finite v:I→E, U_v(rK)=f₂,r(U_v(f₁,r(K))).

Hypotheses and conventions: E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their native product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and native linear maps, not new constructors or carrier types.

Proof/construction outline: 1. The left side consists of (v_i+rx,ry) with (x,y)∈K. The right side consists of f₂,r(v_i+rx,y), which is the same ordered pair. 2. Use identical witnesses in both directions. This is a direct image/finite-union identity, including r=0; no invertibility or measurable-set argument is involved.

Direct prerequisites: No additional supplier beyond the displayed native context.

API contracts:

- `complementary_dilation_union` (compatibility; native signature elaborated): For any real r, any K⊆E×F and finite v:I→E, U_v(rK)=f₂,r(U_v(f₁,r(K))).

Mathematical test contracts:

- `first_coordinate_stretch` (computation): On ℝ×ℝ, f₁,2(3,5)=(6,5).
- `complementary_coordinate_stretch` (computation): On ℝ×ℝ, f₂,2(3,5)=(3,10); it must leave the translation coordinate unchanged.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.6, identity M_q^i+K_{i+1}=f₂(M_q^i+f₁(K_i)). Exposes the precise order of the two native partial linear maps.

Use: `Henk2002 §3, equations (3.2)–(3.6)`: Exposes the precise order of the two native partial linear maps.

### Codimension growth for translated convex unions

**theorem; `GN.1/transverse-union-volume`.** For compact convex K⊆E×F, finite v:I→E and r≥1, r^(dim F)·(μ×ν)(U_v(K))≤(μ×ν)(U_v(rK)), interpreting the scalar factor by the native nonnegative extended-real inclusion.

Hypotheses and conventions: E and F are finite-dimensional real normed vector spaces with their Borel measurable structures; μ and ν are additive Haar measures on E and F. Use their native product measure μ×ν. The spaces may have dimension zero. For a finite indexing type I and v:I→E, write U_v(K)=⋃_{i∈I}{(v_i+x,y):(x,y)∈K}. Write f₁,r(x,y)=(rx,y), f₂,r(x,y)=(x,ry). These are ordinary finite unions and native linear maps, not new constructors or carrier types.

Proof/construction outline: 1. Regard f₂,r as the native product endomorphism id_E×(r·id_F). Native det_prodMap and det_smul give determinant r^(dim F). 2. The product measure is an additive Haar measure by the existing instance. Native addHaar_image_linearMap and r≥1 give the exact image-measure factor r^(dim F) on any set. 3. Apply complementary-dilation-union to identify the full dilation union with that image. Apply partial-dilation-union-volume to its preimage set and multiply the inequality by the nonnegative determinant factor. 4. No determinant is computed for a new abstract map carrier. If dim F=0 the factor is one; if r=1 both unions agree. This is not yet the global Minkowski product inequality.

Direct prerequisites: `GN.1/partial-dilation-union-volume`, `GN.1/complementary-dilation-union`, `mathlib:MeasureTheory.Measure.addHaar_image_linearMap`, `mathlib:LinearMap.det_prodMap`, `mathlib:LinearMap.det_smul`, `mathlib:MeasureTheory.Measure.prod.instIsHaarMeasure`

API contracts:

- `transverse_union_volume` (compatibility; native signature elaborated): For compact convex K⊆E×F, finite v:I→E and r≥1, r^(dim F)·(μ×ν)(U_v(K))≤(μ×ν)(U_v(rK)), interpreting the scalar factor by the native nonnegative extended-real inclusion.

Mathematical test contracts:

- `zero_transverse_exponent` (degenerate): For F=EuclideanSpace ℝ (Fin 0), the factor 2^(dim F) is 1, not 2 or zero.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.6 (3.5), using the partial maps and (3.6). Supplies the analytic codimension factor; applying it to lattice boxes and successive minima remains a separate proof step.

Use: `Henk2002 §3, equations (3.2)–(3.6)`: Supplies the analytic codimension factor; applying it to lattice boxes and successive minima remains a separate proof step.

### Gauge under an invertible linear change

**lemma; `GN.1/gauge-linear-equiv`.** For real modules E,F, a linear equivalence e:E≃_R F, K⊆E and x∈E, gauge_{e(K)}(e(x))=gauge_K(x). No convexity, boundedness, symmetry or nonempty-interior hypothesis is needed.

Hypotheses and conventions: E,F are real modules with additive commutative group structure. Both the set and the evaluation point are transformed; this is an adapter for the existing gauge, not another gauge definition.

Proof/construction outline: 1. Use the native inverse-scaling formula for gauge: its defining thresholds are the positive r with r⁻¹x∈K. 2. Linearity and injectivity identify r⁻¹e(x)∈e(K) exactly with r⁻¹x∈K for every positive r. The two threshold sets, hence their real infima, coincide. 3. The equality remains valid for an empty or nonabsorbing set because it identifies the native infimum sets exactly, including the native empty-set convention.

Direct prerequisites: `mathlib:gauge_def'`

API contracts:

- `gauge_linearEquiv` (compatibility; native signature elaborated): For real modules E,F, a linear equivalence e:E≃_R F, K⊆E and x∈E, gauge_{e(K)}(e(x))=gauge_K(x). No convexity, boundedness, symmetry or nonempty-interior hypothesis is needed.

Mathematical test contracts:

- `gauge_coordinate_scale` (computation): For K=[−1,1], transforming K and x=1 by multiplication by 2 gives gauge_[−2,2](2)=1.
- `gauge_coordinate_wrong_point` (non-example): Keeping K=[−1,1] while replacing x=1 by x=2 gives gauge 2, not 1.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.5, reduction to the standard lattice at the start of §3. Worker-derived normalization adapter for Henk's simultaneous coordinate change. The gauge language is the pinned library's, not a quotation of the paper.

Use: `Henk2002 §3 and GN.1/minkowski-second-upper`: Worker-derived normalization adapter for Henk's simultaneous coordinate change. The gauge language is the pinned library's, not a quotation of the paper.

### Null intersection of separated convex clusters

**lemma; `GN.1/convex-cluster-intersection-null`.** For finite families A:I→Set(E), B:J→Set(E) of convex sets, if int(A_i) and int(B_j) are disjoint for every i,j, then μ((⋃_i A_i)∩(⋃_j B_j))=0.

Hypotheses and conventions: E is finite-dimensional real normed, with Borel structure and an additive Haar measure μ. The families may be empty; the individual convex sets need not be closed or bounded. The unions need not be convex.

Proof/construction outline: 1. For a point belonging to A_i∩B_j, the cross-interior hypothesis says it is outside at least one of the two interiors. 2. Native mem_frontier_iff_notMem_interior puts that point in frontier(A_i) or frontier(B_j). Thus the cluster intersection is contained in the union of all those frontiers. 3. Each frontier is Haar-null by the existing convex-frontier theorem; finite unions are null by native measure_iUnion_null_iff and measure_union_null. Apply measure_mono_null. 4. No assertion that either cluster is convex is used, and no restriction is imposed on overlaps within A or within B.

Direct prerequisites: `mathlib:mem_frontier_iff_notMem_interior`, `mathlib:Convex.addHaar_frontier`, `mathlib:MeasureTheory.measure_iUnion_null_iff`, `mathlib:MeasureTheory.measure_union_null`, `mathlib:MeasureTheory.measure_mono_null`

API contracts:

- `convex_cluster_intersection_null` (compatibility; native signature elaborated): For finite families A:I→Set(E), B:J→Set(E) of convex sets, if int(A_i) and int(B_j) are disjoint for every i,j, then μ((⋃_i A_i)∩(⋃_j B_j))=0.

Mathematical test contracts:

- `cluster_touching_null` (computation): ([0,2]∪[1,3])∩([3,5]∪[4,6]) has real volume zero.
- `cluster_cross_overlap_not_null` (non-example): [0,2]∩[1,3] has volume one: dropping cross-interior disjointness is false.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.6, the volume factorizations immediately after (3.4). Worker-expanded null-overlap step needed because the paper's row blocks are generally nonconvex finite unions.

Use: `Henk2002 §3 and GN.1/minkowski-second-upper`: Worker-expanded null-overlap step needed because the paper's row blocks are generally nonconvex finite unions.

### Additive volume of transverse translate clusters

**lemma; `GN.1/clustered-translate-volume`.** For compact convex K⊆E, finite u:I→E and v:J→E, suppose int(u_i+v_j+K) and int(u_i′+v_j′+K) are disjoint whenever j≠j′, for all i,i′. Then μ(⋃_j⋃_i(u_i+v_j+K))=|J|·μ(⋃_i(u_i+K)).

Hypotheses and conventions: E is finite-dimensional real normed and Borel; μ is additive Haar measure. Both index types may be empty. Within each row j, the sets may overlap and the labels i may repeat.

Proof/construction outline: 1. The intersection of any two different row blocks has measure zero by convex-cluster-intersection-null applied to their individual convex translates. 2. Every block is a finite union of compact translates, hence measurable. Apply native measure_iUnion₀ to the row blocks, not to all individual translates. 3. Associativity and distribution of translation through a union identify each row block as v_j plus the same prefix union ⋃_i(u_i+K). Translation invariance makes its measure independent of j. 4. The finite sum of identical row volumes is |J| times that volume. Do not replace the prefix-union volume by |I|·μ(K), which can be strictly larger.

Direct prerequisites: `GN.1/convex-cluster-intersection-null`, `mathlib:Convex.translate`, `mathlib:Homeomorph.image_interior`, `mathlib:IsCompact.image`, `mathlib:isCompact_iUnion`, `mathlib:IsCompact.isClosed`, `mathlib:IsClosed.measurableSet`, `mathlib:MeasureTheory.measure_iUnion₀`, `mathlib:MeasureTheory.measure_preimage_mul_right`

API contracts:

- `clustered_translate_volume` (compatibility; native signature elaborated): For compact convex K⊆E, finite u:I→E and v:J→E, suppose int(u_i+v_j+K) and int(u_i′+v_j′+K) are disjoint whenever j≠j′, for all i,i′. Then μ(⋃_j⋃_i(u_i+v_j+K))=|J|·μ(⋃_i(u_i+K)).

Mathematical test contracts:

- `cluster_volume_overlapping_rows` (computation): The union of [0,2],[1,3],[3,5],[4,6] has volume 6=2·3, not 4·2=8.
- `cluster_volume_repeated_inner_label` (degenerate): Repeating [0,1] within a row does not double that row's volume; two touching translated rows still have total volume 2.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.6, the two factorizations following (3.4). Declares precisely the clustered additivity used in Henk's proof, preserving within-row overlaps and allowing touching cross-row boundaries.

Use: `Henk2002 §3 and GN.1/minkowski-second-upper`: Declares precisely the clustered additivity used in Henk's proof, preserving within-row overlaps and allowing touching cross-row boundaries.

### Separation outside a strict gauge flag

**lemma; `GN.1/strict-flag-translate-separation`.** Let K⊆R^d be a symmetric convex body with 0 in its interior, t>0 and 0≤k≤d. Suppose every z∈Z^d with gauge_K(c(z))<t has z_j=0 for j≥k. If x,y∈Z^d differ in some coordinate j≥k, then c(x)+int((t/2)K) and c(y)+int((t/2)K) are disjoint.

Hypotheses and conventions: These are native sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a native finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the native zero-dimensional convention. The flag condition is strict. No assertion about gauge=t points is made. A minimum vector need not be a basis vector, and no equality between a real and integral basis is assumed.

Proof/construction outline: 1. Suppose a point is c(x)+a=c(y)+b with a,b in int((t/2)K). Native interior_subset_gauge_lt_one and gauge_smul_left_of_nonneg give gauge_K(a)<t/2 and gauge_K(b)<t/2. 2. By convexity, zero-interior absorbency, gauge_add_le and symmetry gauge_K(b−a)≤gauge_K(b)+gauge_K(a)<t. 3. The equality of translated points gives c(x−y)=b−a. The strict flag hypothesis forces x_j−y_j=0 for every j≥k, contradicting the chosen unequal coordinate. 4. The argument uses no strict inequality between two consecutive minima; it therefore remains valid when minima repeat. For k=d the unequal-coordinate premise is impossible.

Direct prerequisites: `mathlib:interior_subset_gauge_lt_one`, `mathlib:gauge_smul_left_of_nonneg`, `mathlib:gauge_add_le`, `mathlib:gauge_neg`, `mathlib:absorbent_nhds_zero`

API contracts:

- `strict_flag_translate_separation` (compatibility; native signature elaborated): Let K⊆R^d be a symmetric convex body with 0 in its interior, t>0 and 0≤k≤d. Suppose every z∈Z^d with gauge_K(c(z))<t has z_j=0 for j≥k. If x,y∈Z^d differ in some coordinate j≥k, then c(x)+int((t/2)K) and c(y)+int((t/2)K) are disjoint.

Mathematical test contracts:

- `flag_half_body_touching` (computation): The open intervals (−1/2,1/2) and (1/2,3/2) are disjoint, even though the corresponding closed intervals touch.
- `flag_radius_factor_two` (non-example): Replacing the half-body by the whole unit interval makes translates centered at 0 and 1 overlap on (0,1).

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), pp.5–6, (3.2) and (3.4), using the strict flag from (2.3). Expands Henk's nonintersection argument using the stronger inherited strict-sublevel flag, which also handles repeated minima.

Use: `Henk2002 §3 and GN.1/minkowski-second-upper`: Expands Henk's nonintersection argument using the stronger inherited strict-sublevel flag, which also handles repeated minima.

### Volume factorization by lattice-box rows

**lemma; `GN.1/lattice-box-row-volume`.** For compact convex S⊆R^d, q∈N and k≤d, assume c(x)+int(S) and c(y)+int(S) are disjoint for all x,y∈M_q whose tails (coordinates j≥k) differ. Then volume(U_q(S))=(2q+1)^(d−k)·volume(U_q^k(S)).

Hypotheses and conventions: These are native sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a native finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the native zero-dimensional convention. Lebesgue volume is the native product volume on R^d. The statement is in the nonnegative extended reals, with the natural cardinal factor cast into that space.

Proof/construction outline: 1. Split each z∈M_q uniquely into u+v: u_j=z_j for j<k and zero otherwise; v_j=0 for j<k and z_j otherwise. Conversely every such bounded prefix/tail pair sums to an element of M_q. This coordinatewise bijection gives the exact union decomposition. 2. Take the prefix and tail finite interval subtypes as the indexing types in clustered-translate-volume. Different tails satisfy the stated cross-interior condition for every pair of prefix coordinates. 3. Each of the d−k tail coordinates ranges independently over the integer interval [−q,q]. Native Pi.card_Icc and Int.card_Icc give precisely (2q+1)^(d−k), including q=0 and k=d. 4. The common row is exactly U_q^k(S); no convexity of that row is claimed and no individual-translate cardinal sum replaces its volume.

Direct prerequisites: `GN.1/clustered-translate-volume`, `mathlib:Equiv.piEquivPiSubtypeProd`, `mathlib:Pi.card_Icc`, `mathlib:Int.card_Icc`

API contracts:

- `lattice_box_row_volume` (compatibility; native signature elaborated): For compact convex S⊆R^d, q∈N and k≤d, assume c(x)+int(S) and c(y)+int(S) are disjoint for all x,y∈M_q whose tails (coordinates j≥k) differ. Then volume(U_q(S))=(2q+1)^(d−k)·volume(U_q^k(S)).

Mathematical test contracts:

- `box_row_two_dimensional` (computation): For q=1,k=1,d=2 and S=[−1,1]×[−1/2,1/2], the prefix union has area 4 and the full union area 12=3·4; summing nine individual areas would incorrectly give 18.
- `box_row_zero_radius` (degenerate): M_0 consists only of zero in every dimension, so every row-volume factor at q=0 is one.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.6, the two displayed volume factorizations after (3.4). Uses native finite intervals and exact coordinate splitting to make Henk's row multiplicity explicit.

Use: `Henk2002 §3 and GN.1/minkowski-second-upper`: Uses native finite intervals and exact coordinate splitting to make Henk's row multiplicity explicit.

### Codimension growth in prefix coordinates

**lemma; `GN.1/coordinate-transverse-union-volume`.** For k≤d, compact convex S⊆R^d, a finite family v:I→R^d with (v_i)_j=0 whenever j≥k, and r≥1, r^(d−k)·volume(⋃_i(v_i+S))≤volume(⋃_i(v_i+rS)).

Hypotheses and conventions: These are native sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a native finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the native zero-dimensional convention. No symmetry or origin condition is required for S. The family may be empty or have repeated labels. This is the existing product-space inequality expressed in native coordinate space, not a new geometric carrier.

Proof/construction outline: 1. Use the native equivalence splitting Fin d by j.val<k into prefix and tail functions. Its homeomorphism preserves compactness; its coordinate formulas preserve convex combinations, translations and scalar multiplication. 2. Native volume_preserving_piEquivPiSubtypeProd identifies the original product volume with prefix-volume times tail-volume, with no extra determinant or normalization factor. 3. The tail restriction of every v_i is zero, so the transformed union has the exact form used by transverse-union-volume. Apply that theorem with prefix space R^{j<k} and tail space R^{j≥k}. 4. The tail index set is in bijection with Fin(d−k), hence its real dimension is d−k. Transport the measure inequality back through the native volume-preserving equivalence. The k=0 and k=d cases use the same empty-product measure convention.

Direct prerequisites: `GN.1/transverse-union-volume`, `mathlib:Equiv.piEquivPiSubtypeProd`, `mathlib:Homeomorph.piEquivPiSubtypeProd`, `mathlib:MeasureTheory.volume_preserving_piEquivPiSubtypeProd`, `mathlib:Module.finrank_fintype_fun_eq_card`

API contracts:

- `coordinate_transverse_union_volume` (compatibility; native signature elaborated): For k≤d, compact convex S⊆R^d, a finite family v:I→R^d with (v_i)_j=0 whenever j≥k, and r≥1, r^(d−k)·volume(⋃_i(v_i+S))≤volume(⋃_i(v_i+rS)).

Mathematical test contracts:

- `coordinate_codimension_two` (computation): For d=3,k=1,r=2 the multiplier is 4, not the ambient factor 8.
- `coordinate_full_prefix` (degenerate): For k=d the multiplier is r^0=1; for k=0 it is r^d.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.6, (3.5) and the coordinate maps f₁,f₂. Native coordinate adapter for the previously planned product-Haar theorem; neither coordinate volume nor change-of-variables infrastructure is replanned.

Use: `Henk2002 §3 and GN.1/minkowski-second-upper`: Native coordinate adapter for the previously planned product-Haar theorem; neither coordinate volume nor change-of-variables infrastructure is replanned.

### Consecutive-threshold lattice-box volume inequality

**lemma; `GN.1/successive-box-volume-ratio`.** For K⊆R^d a symmetric convex body with 0 in its interior, 0<s≤t, q∈N and k≤d, assume gauge_K(c(z))<t implies z_j=0 for all j≥k. Then (t/s)^(d−k)·volume.real(U_q((s/2)K))≤volume.real(U_q((t/2)K)).

Hypotheses and conventions: These are native sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a native finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the native zero-dimensional convention. K is the native compact nonempty ConvexBody; compactness is used to convert finite union measures to real volume.

Proof/construction outline: 1. Strict-flag-translate-separation at t proves that different transverse rows have disjoint interiors for the larger half-body. The same strict-flag premise holds at s because s≤t, so the smaller half-body has the same row separation. 2. Apply lattice-box-row-volume to both scales, obtaining the identical positive finite multiplicity (2q+1)^(d−k). 3. The prefix union contains translations only in the first k coordinates. Apply coordinate-transverse-union-volume with r=t/s≥1 and S=(s/2)K; positivity of s identifies rS exactly with (t/2)K. 4. Multiply by the common row multiplicity and substitute the two exact factorizations. All finite translated unions are compact, hence have finite measure, so conversion to real volume is legitimate. 5. When s=t, the multiplier is one and the two sets agree. The proof does not discard this branch or require distinct minima.

Direct prerequisites: `GN.1/strict-flag-translate-separation`, `GN.1/lattice-box-row-volume`, `GN.1/coordinate-transverse-union-volume`, `mathlib:IsCompact.measure_lt_top`, `mathlib:isCompact_iUnion`, `mathlib:IsCompact.image`

API contracts:

- `flag_box_volume_ratio` (compatibility; native signature elaborated): For K⊆R^d a symmetric convex body with 0 in its interior, 0<s≤t, q∈N and k≤d, assume gauge_K(c(z))<t implies z_j=0 for all j≥k. Then (t/s)^(d−k)·volume.real(U_q((s/2)K))≤volume.real(U_q((t/2)K)).

Mathematical test contracts:

- `box_ratio_repeated_minimum` (degenerate): If s=t>0, the ratio inequality is equality, including every q and cutoff.
- `box_ratio_codimension_not_dimension` (non-example): For q=1, K=[−1,1]×[−1/3,1/3], s=1,t=3,k=1, the smaller and larger union areas are 3 and 15. The required factor gives 9≤15; the incorrect ambient exponent gives 27≤15, which is false.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), pp.5–6, (3.3)–(3.5). Supplies Henk's consecutive-minimum ratio after substituting s=λ_i, t=λ_{i+1}, k=i+1 in zero-based indexing; the more general threshold formulation isolates the exact flag assumption.

Use: `Henk2002 §3 and GN.1/minkowski-second-upper`: Supplies Henk's consecutive-minimum ratio after substituting s=λ_i, t=λ_{i+1}, k=i+1 in zero-based indexing; the more general threshold formulation isolates the exact flag assumption.

### Initial lattice-box translate volume

**lemma; `GN.1/first-box-volume`.** For K⊆R^d a symmetric convex body with 0 in its interior and s>0, suppose gauge_K(c(z))<s for an integer vector z implies z=0. Then for every q∈N, volume.real(U_q((s/2)K))=(2q+1)^d·(s/2)^d·volume.real(K).

Hypotheses and conventions: These are native sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a native finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the native zero-dimensional convention. K is the native compact nonempty ConvexBody; compactness is used to convert finite union measures to real volume.

Proof/construction outline: 1. Use strict-flag-translate-separation at cutoff zero: any two distinct integer vectors differ in some coordinate, so the interiors of their half-body translates are disjoint. 2. Apply finite-interior-disjoint-volume to the finite interval M_q and the compact convex body (s/2)K. 3. Native Pi.card_Icc and Int.card_Icc give |M_q|=(2q+1)^d. Native addHaar_smul_of_nonneg gives volume((s/2)K)=(s/2)^d volume(K). 4. Compactness makes all measures finite, so taking real parts yields the displayed identity. At d=0 there is one integer vector and all exponents are zero; no first-minimum index is evaluated.

Direct prerequisites: `GN.1/strict-flag-translate-separation`, `GN.1/finite-interior-disjoint-volume`, `mathlib:Pi.card_Icc`, `mathlib:Int.card_Icc`, `mathlib:MeasureTheory.Measure.addHaar_smul_of_nonneg`, `mathlib:IsCompact.measure_lt_top`

API contracts:

- `first_box_volume` (compatibility; native signature elaborated): For K⊆R^d a symmetric convex body with 0 in its interior and s>0, suppose gauge_K(c(z))<s for an integer vector z implies z=0. Then for every q∈N, volume.real(U_q((s/2)K))=(2q+1)^d·(s/2)^d·volume.real(K).

Mathematical test contracts:

- `initial_box_square` (computation): For q=1 and K=[−1,1]^2 with s=1, the union area is 9=3²·(1/2)²·4.
- `initial_box_nonunit_threshold` (computation): For q=1, K=[−2,2]×[−1,1] and s=1/2, the union area is 9/2=3²·(1/4)²·8.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.5, (3.2). Exact starting value for the volume recurrence; the cardinality and scalar-volume laws are already built.

Use: `Henk2002 §3; GN.1; DiophantineApproximationAndTranscendence DT.0 and EffectiveBoundsCompactModels`: Exact starting value for the volume recurrence; the cardinality and scalar-volume laws are already built.

### Uniform enclosing box for lattice translates

**lemma; `GN.1/outer-lattice-box-volume`.** For any compact S⊆R^d there is R≥0 such that, for every q∈N, volume.real(U_q(S))≤(2q+2R)^d.

Hypotheses and conventions: These are native sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a native finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the native zero-dimensional convention. S need not be convex, symmetric or nonempty. R depends on S and d but is chosen once, independently of q.

Proof/construction outline: 1. Native compact-implies-bounded and the norm bound give R≥0 with |x_j|≤R for every x∈S and coordinate j; take the maximum of zero and a norm bound. 2. If z∈M_q and x∈S, each coordinate of c(z)+x lies in [−q−R,q+R] by the triangle inequality. Thus the whole finite union lies in that coordinate box. 3. Use native measureReal_mono and volume_Icc_pi. The enclosing box has volume (2q+2R)^d and finite measure; there is no asymptotic error term being assumed. 4. For d=0 the enclosing box has volume one, even when q=R=0. If S is empty the left side is zero.

Direct prerequisites: `mathlib:IsCompact.isBounded`, `mathlib:isBounded_iff_forall_norm_le'`, `mathlib:MeasureTheory.measureReal_mono`, `mathlib:Real.volume_Icc_pi`

API contracts:

- `outer_lattice_box_volume` (compatibility; native signature elaborated): For any compact S⊆R^d there is R≥0 such that, for every q∈N, volume.real(U_q(S))≤(2q+2R)^d.

Mathematical test contracts:

- `outer_box_fixed_margin` (computation): For q=1 and R=3/2 in dimension two, the enclosing area is (2+3)²=25, bounding the anisotropic row example of area 15.
- `outer_box_empty_dimension` (degenerate): In dimension zero the right side is one, including q=R=0; the empty union's volume is zero.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.5, (3.1). Expands Henk's boundedness constant into a native coordinate enclosure uniform over all q.

Use: `Henk2002 §3; GN.1; DiophantineApproximationAndTranscendence DT.0 and EffectiveBoundsCompactModels`: Expands Henk's boundedness constant into a native coordinate enclosure uniform over all q.

### Telescoping product with descending exponents

**lemma; `GN.1/weighted-ratio-product`.** For n∈N and positive a:Fin(n+1)→R, a_0^(n+1)·∏_{i:Fin n}(a_{i+1}/a_i)^(n−i)=∏_{j:Fin(n+1)}a_j.

Hypotheses and conventions: All a_j are strictly positive, so every denominator is nonzero. No monotonicity is needed for this algebraic identity. With n=0 the ratio product is empty and both sides are a_0.

Proof/construction outline: 1. Split the finite product at its first factor using native Fin.prod_univ_succ and induct on n. 2. For the induction step, factor a_0^(n+1)(a_1/a_0)^n=a_0·a_1^n, using positivity to cancel a_0. The remaining ratio product is the same expression for the tail sequence, with exponents n−1,…,1. 3. Apply the induction hypothesis to the tail and reassemble ∏a_j by Fin.prod_univ_succ. This explicitly accounts for the exponent decrease; an unweighted ratio product would only retain the endpoints. 4. Equal adjacent a_j contribute exactly one; no limit or cancellation of a zero threshold is used.

Direct prerequisites: `mathlib:Fin.prod_univ_succ`

API contracts:

- `weighted_ratio_product` (compatibility; native signature elaborated): For n∈N and positive a:Fin(n+1)→R, a_0^(n+1)·∏_{i:Fin n}(a_{i+1}/a_i)^(n−i)=∏_{j:Fin(n+1)}a_j.

Mathematical test contracts:

- `weighted_ratio_three_values` (computation): For a=(2,3,5), 2³·(3/2)²·(5/3)=30=2·3·5.
- `weighted_ratio_repeated_values` (degenerate): For a=(2,2,5), the repeated ratio is one and the identity gives 20.
- `weighted_ratio_rank_one` (degenerate): For n=0, the empty ratio product gives a_0^1=a_0.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.7, the final product expansion. Worker-expanded finite algebra behind Henk's cancellation of successive-minimum ratios.

Use: `Henk2002 §3; GN.1; DiophantineApproximationAndTranscendence DT.0 and EffectiveBoundsCompactModels`: Worker-expanded finite algebra behind Henk's cancellation of successive-minimum ratios.

### Accumulate the consecutive volume inequalities

**lemma; `GN.1/weighted-volume-chain`.** For positive a:Fin(n+1)→R, nonnegative V:Fin(n+1)→R and B≥0, assume a_0^(n+1)B≤V_0 and (a_{i+1}/a_i)^(n−i)V_i≤V_{i+1} for every i:Fin n. Then (∏_j a_j)B≤V_n.

Hypotheses and conventions: All sequence entries and endpoints use Fin(n+1). The recurrence has exactly n inequalities, so for n=0 the conclusion is the initial inequality.

Proof/construction outline: 1. Induct along the n consecutive inequalities, multiplying the previous lower bound by the next nonnegative ratio power at each step. 2. This gives V_n≥(∏_{i:Fin n}(a_{i+1}/a_i)^(n−i))·V_0. Substitute the initial lower bound and rearrange the finite real product. 3. Use weighted-ratio-product to replace a_0^(n+1) times the weighted ratio product by ∏a_j. 4. No division by V_i, B or body volume occurs. Thus zero volumes are allowed in this algebraic interface, and equality or repeated thresholds remain valid.

Direct prerequisites: `GN.1/weighted-ratio-product`

API contracts:

- `weighted_volume_chain` (compatibility; native signature elaborated): For positive a:Fin(n+1)→R, nonnegative V:Fin(n+1)→R and B≥0, assume a_0^(n+1)B≤V_0 and (a_{i+1}/a_i)^(n−i)V_i≤V_{i+1} for every i:Fin n. Then (∏_j a_j)B≤V_n.

Mathematical test contracts:

- `volume_chain_sharp_values` (computation): For a=(2,3,5), B=1 and V=(8,18,30), the two recurrence steps are equalities and the endpoint is 30.
- `volume_chain_zero_base` (degenerate): With B=0 and V identically zero the conclusion holds; a proof that divides by a volume would be invalid.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.7, the chain of inequalities after (3.6). Isolates the finite recurrence before applying the enclosing box and the limit.

Use: `Henk2002 §3; GN.1; DiophantineApproximationAndTranscendence DT.0 and EffectiveBoundsCompactModels`: Isolates the finite recurrence before applying the enclosing box and the limit.

### Pass a uniform box comparison to the limit

**lemma; `GN.1/large-box-comparison-limit`.** For d∈N and real R,B, if (2q+1)^d B≤(2q+2R)^d for every q∈N, then B≤1.

Hypotheses and conventions: The scalar statement does not require R≥0 or B≥0; the geometric application supplies both. The denominator 2q+1 is always strictly positive. Dimension zero is allowed.

Proof/construction outline: 1. Divide each inequality by the strictly positive (2q+1)^d to obtain B≤((2q+2R)/(2q+1))^d. 2. Use native tendsto_add_mul_div_add_mul_atTop_nhds with numerator constant 2R, denominator constant 1 and both linear coefficients 2. The ratio tends to one. 3. Continuity of natural powers gives limit one for its d-th power. Apply the native closed-order limit comparison (the generated dual of le_of_tendsto') to the pointwise lower bound by B. 4. This is a limit of explicit box ratios, not a lattice-point asymptotic theorem. In dimension zero the hypothesis already says B≤1.

Direct prerequisites: `mathlib:tendsto_add_mul_div_add_mul_atTop_nhds`, `mathlib:le_of_tendsto'`

API contracts:

- `large_box_comparison_limit` (compatibility; native signature elaborated): For d∈N and real R,B, if (2q+1)^d B≤(2q+2R)^d for every q∈N, then B≤1.

Mathematical test contracts:

- `large_box_half_margin` (computation): For R=1/2 the ratio (2q+2R)/(2q+1) is identically one.
- `large_box_zero_dimension` (degenerate): For d=0 both powers are one even when the numerator vanishes.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.7, the last display and its conclusion for all q. Expands the last limiting step without importing a stronger lattice-counting estimate.

Use: `Henk2002 §3; GN.1; DiophantineApproximationAndTranscendence DT.0 and EffectiveBoundsCompactModels`: Expands the last limiting step without importing a stronger lattice-counting estimate.

### Sharp product bound from a coordinate flag

**theorem; `GN.1/coordinate-flag-upper`.** Let K be a symmetric convex body in R^d with 0 in its interior, and let a:Fin d→R be positive and nondecreasing. Suppose for every i and z∈Z^d, gauge_K(c(z))<a_i implies z_j=0 for all j≥i. Then (∏_i a_i)·volume.real(K)≤2^d.

Hypotheses and conventions: These are native sets, finite unions and scalar images, not new box or lattice carrier types. For d,q∈N, write M_q={z∈Z^d:−q≤z_j≤q for every j}, a native finite interval in the function lattice. Write c(z)=(z_j:R)_j, U_q(S)=⋃_{z∈M_q}(c(z)+S), and M_q^k={z∈M_q:z_j=0 when k≤j<d}. Write U_q^k(S) for the same union restricted to M_q^k. Indices are zero-based. A cutoff k∈{0,…,d} retains the first k coordinates; the transverse dimension is d−k. Empty-coordinate products and volumes use the native zero-dimensional convention. The a_i are threshold data satisfying the explicit flag condition; the statement does not define a new successive-minimum invariant. The conclusion includes d=0.

Proof/construction outline: 1. If d=0, K is nonempty in the one-point function space. Native volume_pi_eq_dirac gives volume(K)=1, and the empty product and 2^0 are one. 2. For d=n+1>0, set S_i=(a_i/2)K and V_i=volume.real(U_q(S_i)). Positivity and monotonicity supply 0<a_i≤a_{i+1}. Apply flag_box_volume_ratio with cutoff k=i+1 and threshold t=a_{i+1}; its exponent is n−i. 3. At index zero the flag says every integer vector with gauge<a_0 has all coordinates zero. Apply first-box-volume to obtain V_0=(2q+1)^d(a_0/2)^d volume.real(K). 4. Use weighted-volume-chain with B_q=(2q+1)^d volume.real(K)/2^d. This yields (2q+1)^d·[(∏a_i)volume.real(K)/2^d]≤V_n. 5. Apply outer-lattice-box-volume to the fixed compact final body (a_n/2)K. The resulting R is independent of q, so large-box-comparison-limit gives (∏a_i)volume.real(K)/2^d≤1. Multiply by 2^d>0. 6. The n=0 recurrence is empty; equal adjacent thresholds use the equality branch of the ratio lemma. No strict floor-count estimate or conjectural factor-one lattice count is used.

Direct prerequisites: `GN.1/successive-box-volume-ratio`, `GN.1/first-box-volume`, `GN.1/weighted-volume-chain`, `GN.1/outer-lattice-box-volume`, `GN.1/large-box-comparison-limit`, `mathlib:MeasureTheory.Measure.volume_pi_eq_dirac`, `mathlib:ConvexBody.isCompact`

API contracts:

- `coordinate_flag_upper` (compatibility; native signature elaborated): Let K be a symmetric convex body in R^d with 0 in its interior, and let a:Fin d→R be positive and nondecreasing. Suppose for every i and z∈Z^d, gauge_K(c(z))<a_i implies z_j=0 for all j≥i. Then (∏_i a_i)·volume.real(K)≤2^d.

Mathematical test contracts:

- `coordinate_upper_rectangle` (computation): For Z² and K=[−3,3]×[−1,1], thresholds (1/3,1) give product-volume 4, exactly 2².
- `coordinate_upper_diamond` (computation): For the unit diamond and thresholds (1,1), product-volume is 2<4.
- `coordinate_upper_empty` (degenerate): For d=0 the product-volume and the bound are both one.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), §3, pp.5–7, (3.1)–(3.6) and final display. Complete declaration-sized coordinate proof of Henk's upper bound; the strict flag is supplied separately and need not be renamed as minima.

Use: `Henk2002 §3; GN.1; DiophantineApproximationAndTranscendence DT.0 and EffectiveBoundsCompactModels`: Complete declaration-sized coordinate proof of Henk's upper bound; the strict flag is supplied separately and need not be renamed as minima.

### Minkowski’s sharp upper product inequality

**theorem; `GN.1/minkowski-second-upper`.** Atlas planet: Minkowski upper product bound. For a discrete full Z-lattice L in a finite-dimensional real inner-product space E and a centrally symmetric convex body K with 0 in its interior, (∏_{i:Fin d}λ_i(L,K))·volume.real(K)≤2^d·covolume(L), where d=dim_R E and λ_i is the inherited zero-based successive minimum. The formula includes d=0.

Hypotheses and conventions: E carries its native Borel structure and canonical intrinsic Euclidean volume. L uses native Submodule Z E, DiscreteTopology and IsZLattice. K uses native ConvexBody. The inherited real-valued gauge minimum interface is a plan, not a new completed library implementation. Lower-rank lattices are first regarded as full lattices in their real spans, with intrinsic measure. No ambient-volume conclusion for a lower-dimensional body is substituted.

Proof/construction outline: 1. Choose an integral basis b adapted to the strict minimum flag by integral-minimum-flag; its real extension is native b.ofZLatticeBasis. This need not be the attained minimum family. 2. Let e=(b.ofZLatticeBasis).equivFunL and K'=e(K), using the native compact convex image. Continuity, bijectivity and linearity preserve the zero-interior and central-symmetry hypotheses. 3. For z∈Z^d take x=b.equivFun⁻¹(z)∈L. Native ofZLatticeBasis_repr_apply identifies e(x)=c(z), and gauge-linear-equiv identifies its gauge. Native mem_flag_iff_repr_eq_zero turns the inherited strict flag into the coordinate-flag hypothesis for a_i=λ_i. Native coordinate/basis bijectivity supplies every integer vector, not just an inclusion of a sublattice. 4. Use successive-minimum-pos and successive-minimum-monotone, then coordinate-flag-upper to obtain (∏λ_i)volume.real(K')≤2^d. 5. Import native ZLattice.volume_image_eq_volume_div_covolume' for the compact measurable K: volume(K')=volume(K)/ofReal(covolume(L)). Covolume positivity and finite compact volume permit real conversion and multiplication by covolume(L), giving the displayed inequality with exactly that factor. 6. The coordinate theorem includes d=0, so the empty basis/product and one-point volume discharge that case without selecting a nonexistent first or last minimum. No minimum-normalization assumption λ_0≥1 is introduced.

Direct prerequisites: `GN.1/integral-minimum-flag`, `GN.1/gauge-linear-equiv`, `GN.1/successive-minimum-pos`, `GN.1/successive-minimum-monotone`, `GN.1/coordinate-flag-upper`, `mathlib:Module.Basis.ofZLatticeBasis_repr_apply`, `mathlib:Module.Basis.mem_flag_iff_repr_eq_zero`, `mathlib:Module.Basis.equivFun`, `mathlib:Convex.linear_image`, `mathlib:Homeomorph.image_interior`, `mathlib:IsCompact.image`, `mathlib:IsCompact.isClosed`, `mathlib:IsClosed.measurableSet`, `mathlib:ZLattice.volume_image_eq_volume_div_covolume'`, `mathlib:ZLattice.covolume_pos`, `mathlib:IsCompact.measure_lt_top`

API contracts:

- `minkowski_second_upper` (compatibility; native signature elaborated): For a discrete full Z-lattice L in a finite-dimensional real inner-product space E and a centrally symmetric convex body K with 0 in its interior, (∏_{i:Fin d}λ_i(L,K))·volume.real(K)≤2^d·covolume(L), where d=dim_R E and λ_i is the inherited zero-based successive minimum. The formula includes d=0.

Mathematical test contracts:

- `upper_nonunit_covolume` (computation): For L=2Z and K=[−3,3], minimum 2/3 times length 6 is 4=2·covolume(L); omitting covolume would assert 4≤2.
- `upper_anisotropic_lattice` (computation): For L=2Z×3Z and K=[−2,2]×[−1,1], minima (1,3) and area 8 give 24=4·6.
- `upper_zero_dimension` (degenerate): In the zero-dimensional canonical space the empty product, volume, covolume and 2^0 are all one.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.2 Theorem 1.3 and complete §3 proof, pp.5–7. Combines the full coordinate upper proof with the native integral-basis covolume normalization. Along with the inherited lower theorem and attained witnesses, this supplies the generic two-sided product contract, not the consumer's arithmetic metric or algorithmic reductions.

Use: `Henk2002 §3; GN.1; DiophantineApproximationAndTranscendence DT.0 and EffectiveBoundsCompactModels`: Combines the full coordinate upper proof with the native integral-basis covolume normalization. Along with the inherited lower theorem and attained witnesses, this supplies the generic two-sided product contract, not the consumer's arithmetic metric or algorithmic reductions.

### Blichfeldt native interface

**comparison; `GN.1/blichfeldt-native-interface`.** Under the pinned countable additive action, invariant measure and actual fundamental-domain hypotheses, a null-measurable S with μ(F)<μ(S) has two distinct lattice translates that intersect. For a subgroup acting by translations this gives distinct points of S whose difference is a nonzero lattice element.

Hypotheses and conventions: Retain null measurability and the additive fundamental-domain hypothesis; no full-rank lattice is inferred from a bare subgroup.

Proof/construction outline: 1. Call the existing Blichfeldt declaration. 2. Unpack an intersection point and subtract the two subgroup translations.

Direct prerequisites: `mathlib:MeasureTheory.exists_pair_mem_lattice_not_disjoint_vadd`

Mathematical test contracts:

- `blichfeldt_native_interface_test_1` (characterisation): The strict volume comparison is retained.
- `blichfeldt_native_interface_test_2` (characterisation): Two distinct lattice translations produce a nonzero difference.

Source/derivation: [MathlibPin](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib), MeasureTheory/Group/GeometryOfNumbers.lean:52. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `MeasureTheory/Group/GeometryOfNumbers.lean:52`: Blichfeldt native interface supplies the corresponding staged target or its next declaration.

### Minkowski first theorem boundary interface

**comparison; `GN.1/minkowski-first-native-interface`.** For a countable additive lattice subgroup L of a finite-dimensional real normed space, a convex symmetric set S with μ(F)·2^dim<μ(S) contains a nonzero lattice point. For a compact S and discrete L, in a nontrivial ambient space, the non-strict ≥ threshold suffices. Dimension zero does not satisfy the compact theorem’s nontrivial-space hypothesis.

Hypotheses and conventions: Use the native Haar measure and actual additive fundamental domain.

Proof/construction outline: 1. Import the strict theorem. 2. For the equality-boundary variant import the compact/discrete theorem with its additional nontrivial ambient hypothesis.

Direct prerequisites: `mathlib:MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`, `mathlib:MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`

Mathematical test contracts:

- `minkowski_first_native_interface_test_1` (characterisation): For Z in R and S=[−1,1], the non-strict theorem finds ±1.
- `minkowski_first_native_interface_test_2` (characterisation): The open interval (−1,1) at equality cannot use the compact variant.
- `minkowski_first_native_interface_test_3` (characterisation): No nonzero vector is asserted in zero dimension.

Source/derivation: [MathlibPin](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib), MeasureTheory/Group/GeometryOfNumbers.lean:65,91. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `MeasureTheory/Group/GeometryOfNumbers.lean:65,91`: Minkowski first theorem boundary interface supplies the corresponding staged target or its next declaration.

### Bounded ideal-class representatives

**comparison; `GN.1/ideal-class-application-import`.** For a number field K of degree d, every ideal class of O_K has a nonzero integral representative I with N(I)≤(4/π)^r₂·d!/d^d·√|disc K|. The ideal class group is already finite in Mathlib. Geometry supplies this bound; no new class-group carrier is planned here.

Hypotheses and conventions: Full ring of integers and its native class group; orders with noninvertible proper ideals are a separate GlobalNumberFields problem.

Proof/construction outline: 1. Import the existing finite class-group instance and bounded-representative theorem. 2. Check that the native mixed-embedding covolume and r₂ factor are the ones used by the imported theorem.

Direct prerequisites: `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`, `mathlib:NumberField.exists_ideal_in_class_of_norm_le`, `GN.0/mixed-embedding-normalization`

Mathematical test contracts:

- `ideal_class_application_import_test_1` (characterisation): The representative is nonzero integral, not an arbitrary fractional-ideal placeholder.
- `ideal_class_application_import_test_2` (characterisation): The factor d!/d^d and complex-place factor are retained.

Source/derivation: [MathlibPin](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib), NumberTheory/NumberField/ClassNumber.lean:59,77. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `NumberTheory/NumberField/ClassNumber.lean:59,77`: Bounded ideal-class representatives supplies the corresponding staged target or its next declaration.

### Dirichlet unit rank import

**comparison; `GN.1/unit-application-import`.** The native quotient of O_K^× by its torsion subgroup is a finitely generated free abelian group of rank r₁+r₂−1; use the existing NumberField.Units Dirichlet API, not a new logarithmic unit lattice carrier.

Hypotheses and conventions: Use the native NumberField.Units.rank and torsion subgroup.

Proof/construction outline: 1. Import finrank_modTorsion with its existing logEmbedding/unitLattice proof and native module instances. 2. Keep the arithmetic regulator and ray-unit fundamental domains with their number-field owners.

Direct prerequisites: `mathlib:NumberField.Units.finrank_modTorsion`

Mathematical test contracts:

- `unit_application_import_test_1` (characterisation): For Q the unit rank is zero.
- `unit_application_import_test_2` (characterisation): A complex place contributes one logarithmic unit coordinate even though it contributes two real embedding dimensions.

Source/derivation: [MathlibPin](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib), NumberTheory/NumberField/Units/DirichletTheorem.lean:457. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `NumberTheory/NumberField/Units/DirichletTheorem.lean:457`: Dirichlet unit rank import supplies the corresponding staged target or its next declaration.

## GN.2: Integral/generic comparisons, local invariants, spinor and signed forms

Coverage: **partial**. Finished 300-node planning pass at the protocol budget; source/supplier/implementation closure is not asserted.

The follow-up must establish the following scope before closure:

- Match native localization/completion and nonfree Dedekind lattice adapters; dyadic spinor stabilizer images and complete integral quaternion classification remain gaps. The atomic splitting source and DVR existence are acquired and split.
- Complete the per-paper routed worklist below, including finite-field quadrics/Arf, local-classifier consumers, full KSS Proposition 3.15 and its unacquired maximal-element transfer input.

### Integral quadratic lattices over a Dedekind domain

**definition; `GN.2/integral-quadratic-lattice`.** Atlas planet: Integral quadratic lattices. For a Dedekind domain R with fraction field K, a finite-dimensional K-space V and native q:V→K quadratic, an integral quadratic lattice is L:Submodule R V with Submodule.IsLattice K L and q(L)⊆R. Nondegeneracy of q and unimodularity of its integral polar pairing are separate predicates. There is no global free-basis field.

Hypotheses and conventions: K has characteristic different from 2 for the field-classification interface; the native integral quadratic-map definition itself does not require 2 to be a unit in R. The embedding R→K and scalar tower are fixed. Invariant-factor and genus work uses a nondegenerate generic fibre.

Proof/construction outline: 1. Bundle the existing submodule and IsLattice certificate with the existing QuadraticForm and the exact image-in-R condition. 2. Restrict q to L using injectivity of R→K; obtain a native R-valued QuadraticMap. 3. Compare the rational symmetric bilinear carrier with completed IntegralLattices only under its stated integrality/evenness convention; do not replace q by half a bilinear diagonal over a dyadic ring.

Direct prerequisites: `mathlib:Submodule.IsLattice`, `mathlib:QuadraticMap`, `mathlib:QuadraticForm`

API contracts:

- `IntegralQuadraticLattice.ofCarrier` (constructor; native signature elaborated): Bundle a native full finite submodule and q with q(L)⊆R.
- `IntegralQuadraticLattice.carrier` (projection; native signature elaborated): Return the original R-submodule, preserving its IsLattice instance.
- `IntegralQuadraticLattice.quadraticMap` (compatibility; native signature elaborated): The restricted native R-quadratic map extends back to q on the K-span.
- `IntegralQuadraticLattice.ext` (extensionality; native signature elaborated): For fixed q, equal carriers yield equal bundled integral-lattice data.

Mathematical test contracts:

- `integral_quadratic_lattice_test_1` (characterisation): R=Z, K=Q, L=Z and q(x)=x² give an integral lattice whose polar pairing is 2xy and is not unimodular.
- `integral_quadratic_lattice_test_2` (characterisation): The integral symmetric pairing B(x,y)=xy on Z does not make q(x)=B(x,x)/2 integral.
- `integral_quadratic_lattice_test_3` (characterisation): A nonprincipal fractional ideal is allowed as an R-lattice; no constructor asks for an R-basis.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), §9.3 Definition 9.3.1 and §9.7 Definitions 9.7.1–9.7.8, printed pp.137,144–145. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§9.3 Definition 9.3.1 and §9.7 Definitions 9.7.1–9.7.8, printed pp.137,144–145`: Integral quadratic lattices over a Dedekind domain supplies the corresponding staged target or its next declaration.

### Localization of an integral quadratic lattice

**construction; `GN.2/lattice-localization`.** For a nonzero prime p of R, extend L to L_(p)=L⊗R R_(p), viewed as the span of L in the same K-space; extend its quadratic map and coefficient line by scalar change. Integral values and full finite generation are preserved.

Hypotheses and conventions: Use localization R_(p), not completion R_p; the latter changes the ambient field. No global freeness is assumed.

Proof/construction outline: 1. Construct scalar extension with the existing localization/tensor API. 2. Identify the tensor with its image in V by torsion-freeness and flat localization. 3. Clear denominators in a finite generating family to establish the native lattice and integrality properties. The exact tensor-image adapter is a recorded proof input.

Direct prerequisites: `GN.2/integral-quadratic-lattice`

API contracts:

- `IntegralQuadraticLattice.localize` (constructor; supplier signature unmatched): Return the R_(p)-lattice and restricted quadratic form.
- `IntegralQuadraticLattice.localize_mem_iff` (characterisation; supplier signature unmatched): x lies in L_(p) iff s x lies in L for some s∈R\p.
- `IntegralQuadraticLattice.localize_map` (functoriality; supplier signature unmatched): An integral isometry localizes, preserving identity and composition.

Mathematical test contracts:

- `lattice_localization_test_1` (characterisation): Z_(2) contains 1/3 and excludes 1/2; this is not Z₂.
- `lattice_localization_test_2` (characterisation): Localizing a nonprincipal coefficient ideal makes it principal at a nonzero prime of a Dedekind domain.
- `lattice_localization_test_3` (characterisation): Localizing the zero-dimensional lattice still gives the zero-dimensional lattice.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), §9.4, (9.4.1)–(9.4.5), printed pp.139–140. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§9.4, (9.4.1)–(9.4.5), printed pp.139–140`: Localization of an integral quadratic lattice supplies the corresponding staged target or its next declaration.

### Recover a lattice from its localizations

**theorem; `GN.2/lattice-intersection-localizations`.** For a full R-lattice L in a fixed fraction-field K-space over a Dedekind domain, L equals the intersection of its localizations L_(p) over maximal ideals p, as embedded submodules.

Hypotheses and conventions: R is a Dedekind domain; intersections are in the fixed K-space. This detects embedded submodule equality, not the existence of a compatible family of integral isometries.

Proof/construction outline: 1. For x in every localization let a={r∈R:r x∈L}. Clear a denominator using fullness to show a is nonzero. 2. Membership in each localization supplies an element of a outside each maximal ideal; hence a=R and x∈L.

Direct prerequisites: `GN.2/lattice-localization`

Mathematical test contracts:

- `lattice_intersection_localizations_test_1` (characterisation): 2Z and Z differ at the prime 2, though their Q-spans coincide.
- `lattice_intersection_localizations_test_2` (characterisation): For equal embedded localizations the conclusion is L=M; independent local isometries do not supply a single global integral isometry.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), Lemma 9.4.6 and Corollary 9.4.7, printed p.140. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Lemma 9.4.6 and Corollary 9.4.7, printed p.140`: Recover a lattice from its localizations supplies the corresponding staged target or its next declaration.

### Descent of a lattice from a DVR completion

**theorem; `GN.2/completed-lattice-descent`.** Atlas planet: Completion descent for lattices. If R is a DVR with fraction field K and completion R̂ with fraction field K̂, extension L↦L⊗R R̂ and intersection N↦N∩V are inverse bijections between full R-lattices in finite-dimensional V and full R̂-lattices in V⊗K K̂.

Hypotheses and conventions: Intersection uses the canonical injection V→V⊗K K̂. Finite-generation and torsion-free hypotheses are retained; a torsion R-module is not declared free.

Proof/construction outline: 1. Choose a basis for the torsion-free finite R-lattice; R̂∩K=R identifies the intersection after extension. 2. For a completed lattice, sandwich it between r times and r inverse times a reference free lattice, with r∈R chosen to match valuation. 3. Use the finite quotient comparison modulo r to lift representatives, proving the reverse inclusion after extension. 4. The residue-quotient and completion embedding comparisons are recorded inputs, not silently new definitions.

Direct prerequisites: `GN.2/lattice-localization`

Mathematical test contracts:

- `completed_lattice_descent_test_1` (characterisation): The descent of 2Z₂⊂Q₂ is 2Z_(2)⊂Q, not 2Z as a global lattice.
- `completed_lattice_descent_test_2` (characterisation): The finite quotient comparison R/p^e≅R̂/p^e for e≥1 is essential to lifting completed generators.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), §9.5 (9.5.1)–(9.5.4), Lemma 9.5.3 and full proof, printed pp.142–143. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§9.5 (9.5.1)–(9.5.4), Lemma 9.5.3 and full proof, printed pp.142–143`: Descent of a lattice from a DVR completion supplies the corresponding staged target or its next declaration.

### Integral genus inside a rational quadratic space

**definition; `GN.2/integral-genus`.** Atlas planet: Integral genus. Within a fixed nondegenerate quadratic K-space (V,q), two integral R-lattices belong to the same genus when their completed lattices are isometric under O(q_v)(K_v) at every nonzero prime v. If quadratic spaces themselves vary, also require the archimedean signature data and the rational-space identification from GlobalQuadraticForms. Genus classes are integral isometry classes inside this equivalence class.

Hypotheses and conventions: R is the ring of integers of a number field, or a specified localization with exactly its retained places. Genus, rational isometry and global integral isometry have separate types and separate quotient relations.

Proof/construction outline: 1. Use completed-lattice scalar change and the imported local orthogonal groups. 2. Prove reflexivity, symmetry and transitivity by composing local isometries. 3. Take the setoid quotient by global integral isometry inside the genus; do not quotient by unrelated local choices.

Direct prerequisites: `GN.2/integral-quadratic-lattice`, `GN.2/completed-lattice-descent`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-6-forms-over-a-nonarchimedean-local-field`, `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-6-representation-and-isometry`

API contracts:

- `IntegralGenus.localIsometry` (data; supplier signature unmatched): A local isometry at each retained finite place, with archimedean data when spaces vary.
- `IntegralGenus.equivalence` (structure; supplier signature unmatched): The genus relation is an equivalence relation.
- `IntegralGenus.ofIntegralIsometry` (compatibility; supplier signature unmatched): A global integral isometry determines a genus relation.
- `IntegralGenus.classSet` (constructor; supplier signature unmatched): Integral-isometry classes of lattices in the fixed genus.

Mathematical test contracts:

- `integral_genus_test_1` (characterisation): In fixed (Q,x²), Z and 2Z are rationally in the same ambient space but not in one integral genus.
- `integral_genus_test_2` (characterisation): A global integral isometry yields local isometries at every place.
- `integral_genus_test_3` (characterisation): Opposite real signatures cannot be identified when ambient spaces vary.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), Definition 9.7.13, printed p.146; completion comparison §9.5. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Definition 9.7.13, printed p.146; completion comparison §9.5`: Integral genus inside a rational quadratic space supplies the corresponding staged target or its next declaration.

### Proper spinor genus

**definition; `GN.2/proper-spinor-genus`.** Atlas planet: Proper spinor genus. For nondegenerate q in characteristic different from 2, proper spinor genus is the orbit of an integral lattice under SO(q)(K) times the image of Spin(q)(A_f)→SO(q)(A_f), acting on its finite adelic completion. Proper genus uses SO instead of O. Their forgetful maps to ordinary genus are separate.

Hypotheses and conventions: Use the actual local-field image of the spin covering; no blanket surjectivity on local rational points. Dyadic spinor-norm images and signatures are supplied by their owners or left as precise gaps.

Proof/construction outline: 1. Import the spin covering and spinor norm from SpinRepresentations; import finite adeles from AdelicAlgebraicGroups. 2. Define the orbit relation from those actual groups and prove equivalence by group laws. 3. The spin image is contained in SO, so construct maps to proper genus and ordinary genus. 4. The adelic/local integral stabilizer and spinor-norm comparison proof is still a recorded input.

Direct prerequisites: `GN.2/integral-genus`, `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-2-the-pin-and-spin-groups-and-the-double-covers`, `AdelicAlgebraicGroups:AA.1`

API contracts:

- `ProperSpinorGenus.orbit` (constructor; supplier signature unmatched): Use global SO and the finite adelic spin image.
- `ProperSpinorGenus.equivalence` (structure; supplier signature unmatched): Orbit relation is reflexive, symmetric and transitive.
- `ProperSpinorGenus.toGenus` (compatibility; supplier signature unmatched): Forget orientation and the spin-image restriction.

Mathematical test contracts:

- `proper_spinor_genus_test_1` (characterisation): For q=xy, τ_(1,1)τ_(1,2)=diag(2,1/2) has spinor norm [2]; over Q₂ this is not in the spin image.
- `proper_spinor_genus_test_2` (characterisation): Over Q₃ the same diag(2,1/2) stabilizes Z₃² and has nonsquare unit norm [2], so the integral stabilizer image is nontrivial.
- `proper_spinor_genus_test_3` (characterisation): In rank one SO is trivial and its spinor orbit fixes the lattice.

Acceptance: At a place where a nontrivial spinor-norm class occurs, an SO-point with that norm cannot be inserted into the spin image merely by asserting surjectivity. A proper spinor-genus relation implies genus; the converse is not an API lemma. For rank one the proper orthogonal group is trivial; no higher-rank spin-image claim is inferred from that case.

Source/derivation: [SchulzePillot2020](https://arxiv.org/pdf/2008.12847), §9.2, Definitions 9.9,9.13 and Remark 9.14, printed pp.124–126. O-prime is the actual spin-cover image/kernel of spinor norm; use finite adeles on the fixed embedded lattice and keep proper SO action.

Use: `§9.7 genus convention; worker extension to the spin-cover target, with missing source classification stated explicitly`: Proper spinor genus supplies the corresponding staged target or its next declaration.

### Integral hermitian lattices

**definition; `GN.2/integral-hermitian-lattice`.** Atlas planet: Integral hermitian lattices. Let K be a field with involution, R⊂K a stable integral subring and V a finite K-space. A hermitian integral lattice consists of native L:Submodule R V, Submodule.IsLattice K L and a native sesquilinear H, conjugate-linear in its first argument and linear in its second, with H(y,x)=star H(x,y) and H(L,L)⊆R. Generic nondegeneracy is distinct from integral self-duality.

Hypotheses and conventions: Commutative K/R in this declaration; the quaternionic right-module variant is a separate target. For Li–Zhang density the extension is unramified quadratic F/F₀ and F₀ has characteristic different from 2; dyadic residue fields are allowed in §3 except its explicitly geometric branch.

Proof/construction outline: 1. Reuse Submodule.IsLattice and the pinned star-sesquilinear form rather than introducing a new bilinear carrier. 2. Bundle the actual symmetry and integral image conditions. 3. Transport along a K-linear isometry carrying the R-lattice onto the target; retain the coefficient involution.

Direct prerequisites: `mathlib:Submodule.IsLattice`, `mathlib:LinearMap.IsSymm`, `mathlib:LinearMap.Nondegenerate`

API contracts:

- `IntegralHermitianLattice.ofCarrier` (constructor; native signature elaborated): Bundle the existing full finite submodule and actual integral star-sesquilinear form.
- `IntegralHermitianLattice.carrier` (projection; native signature elaborated): The native R-submodule, with its IsLattice certificate.
- `IntegralHermitianLattice.ext` (extensionality; native signature elaborated): For fixed H, equality of native carriers identifies bundled lattice data.
- `IntegralHermitianLattice.map` (functoriality; native signature elaborated): Transport along a hermitian isometry; identity and composition laws.

Mathematical test contracts:

- `integral_hermitian_lattice_test_1` (characterisation): For rank one over an unramified quadratic extension, H(x,y)=star(x)y on O_F is integral and self-dual.
- `integral_hermitian_lattice_test_2` (characterisation): Replacing conjugate transpose by ordinary transpose on the complex vector (i) changes its Gram value from 1 to −1.
- `integral_hermitian_lattice_test_3` (characterisation): An integral hermitian lattice with nonunit Gram determinant is nondegenerate over F but not self-dual over O_F.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), §1.7, physical p.8; §3 hypotheses, physical p.15. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§1.7, physical p.8; §3 hypotheses, physical p.15`: Integral hermitian lattices supplies the corresponding staged target or its next declaration.

### Hermitian dual lattice

**construction; `GN.2/hermitian-dual-lattice`.** For a nondegenerate integral hermitian lattice L in V, define L∨={x∈V : H(x,L)⊆R}; under the stable involution this equals the right-dual condition H(L,x)⊆R. This is a full finite R-lattice over a Dedekind domain; integrality is equivalent to L⊆L∨. Self-duality means equality, not just equality of generic spans.

Hypotheses and conventions: R is Dedekind and stable under the involution; H is nondegenerate on the generic fibre. No finiteness of residue fields is needed until cardinalities are used.

Proof/construction outline: 1. Show the defining set is an R-submodule using sesquilinearity and stability of R under star. 2. Use a local free basis to express the dual by the inverse hermitian Gram matrix; descend the finite lattice property. 3. Use symmetry to compare the two pairing directions and prove the inclusion characterization. 4. Local inverse-Gram and descent adapters remain explicit proof gaps.

Direct prerequisites: `GN.2/integral-hermitian-lattice`, `GN.2/completed-lattice-descent`

API contracts:

- `IntegralHermitianLattice.dual` (constructor; native signature elaborated): The native submodule defined by integral pairings.
- `IntegralHermitianLattice.mem_dual_iff` (characterisation; native signature elaborated): Membership is equivalent to all pairings with L lying in R.
- `IntegralHermitianLattice.dual_dual` (relation; native signature elaborated): The double dual equals L under the stated Dedekind/nondegeneracy hypotheses.
- `IntegralHermitianLattice.integral_iff_le_dual` (characterisation; native signature elaborated): Integrality is exactly L⊆L∨.

Mathematical test contracts:

- `hermitian_dual_lattice_test_1` (characterisation): For rank-one Gram π^a over an unramified extension, the dual of O_F e is π^−a O_F e.
- `hermitian_dual_lattice_test_2` (characterisation): The Gram-1 lattice is self-dual; Gram-π lattice is integral but not self-dual.
- `hermitian_dual_lattice_test_3` (characterisation): The zero-dimensional lattice equals its dual and has zero discriminant length.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), §1.7, physical pp.8–9. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§1.7, physical pp.8–9`: Hermitian dual lattice supplies the corresponding staged target or its next declaration.

### Dual quotient is primary torsion

**lemma; `GN.2/dual-quotient-primary-torsion`.** For an integral nondegenerate rank-n lattice over a DVR, L∨/L is finite, killed by some π^a, and generated by at most n elements.

Proof/construction outline: 1. Choose local free bases of L and L∨. 2. Inverse Gram denominators bound the quotient exponent; the quotient of the n-generator L∨ has at most n generators.

Direct prerequisites: `GN.2/hermitian-dual-lattice`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), §1.7, printed p.8; worker elementary-divisor adapters use the pinned PID supplier. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/dvr-torsion-decomposition-adapter`: Uses dual quotient is primary torsion with the displayed hypotheses and normalization.

### DVR torsion decomposition adapter

**lemma; `GN.2/dvr-torsion-decomposition-adapter`.** The primary torsion supplier decomposes L∨/L into O_F/(π^a_i); remove zero summands, order the exponents and pad with zeros to exactly n entries.

Proof/construction outline: 1. Apply the actual finite-primary theorem at the irreducible uniformizer. 2. The residue quotient has dimension equal to the number of positive summands, at most n. 3. Reindex by increasing exponent and append zero quotients.

Direct prerequisites: `GN.2/dual-quotient-primary-torsion`, `mathlib:Module.torsion_by_prime_power_decomposition`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), §1.7, printed p.8; worker elementary-divisor adapters use the pinned PID supplier. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/hermitian-lattice-invariants`: Uses dvr torsion decomposition adapter with the displayed hypotheses and normalization. `GN.2/dvr-graded-slice-count`: Uses dvr torsion decomposition adapter with the displayed hypotheses and normalization.

### DVR graded slice count

**lemma; `GN.2/dvr-graded-slice-count`.** For exponents a_i and m≥1, dimension over the residue field of π^(m−1)M/π^m M is #{i:a_i≥m}.

Proof/construction outline: 1. A cyclic π^a quotient contributes dimension one exactly when m≤a. 2. Scalar images, quotients and finite sums commute via the supplier equivalence.

Direct prerequisites: `GN.2/dvr-torsion-decomposition-adapter`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), §1.7, printed p.8; worker elementary-divisor adapters use the pinned PID supplier. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/dvr-ordered-exponent-uniqueness`: Uses dvr graded slice count with the displayed hypotheses and normalization. `GN.2/dvr-length-cardinality-adapter`: Uses dvr graded slice count with the displayed hypotheses and normalization.

### Ordered elementary divisor uniqueness

**lemma; `GN.2/dvr-ordered-exponent-uniqueness`.** Two ordered length-n exponent tuples defining the same finite DVR module coincide, including padded zeros.

Proof/construction outline: 1. Module isomorphisms preserve every scalar-image slice. 2. The successive tail counts recover multiplicity at each positive exponent; length n recovers zero multiplicity.

Direct prerequisites: `GN.2/dvr-graded-slice-count`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), §1.7, printed p.8; worker elementary-divisor adapters use the pinned PID supplier. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/hermitian-lattice-invariants`: Uses ordered elementary divisor uniqueness with the displayed hypotheses and normalization. `GN.2/dvr-uniformizer-independence`: Uses ordered elementary divisor uniqueness with the displayed hypotheses and normalization.

### Uniformizer independence

**lemma; `GN.2/dvr-uniformizer-independence`.** Replacing π by uπ, u a unit, preserves the ordered exponent tuple and every type/length invariant.

Proof/construction outline: 1. The generated ideals (π^a) and ((uπ)^a) agree, so each cyclic quotient is the same. 2. Apply ordered uniqueness.

Direct prerequisites: `GN.2/dvr-ordered-exponent-uniqueness`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), §1.7, printed p.8; worker elementary-divisor adapters use the pinned PID supplier. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/hermitian-lattice-invariants`: Uses uniformizer independence with the displayed hypotheses and normalization.

### DVR length and cardinality adapter

**lemma; `GN.2/dvr-length-cardinality-adapter`.** For finite residue field of size Q, length(M)=Σa_i and #M=Q^(Σa_i). For an unramified quadratic O_F/O_F0 extension Q=q², giving q^(2Σa_i).

Proof/construction outline: 1. Filter each summand by its uniformizer powers. 2. Multiply the residue cardinalities and add their composition lengths.

Direct prerequisites: `GN.2/dvr-graded-slice-count`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), §1.7, printed p.8; worker elementary-divisor adapters use the pinned PID supplier. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/hermitian-lattice-invariants`: Uses dvr length and cardinality adapter with the displayed hypotheses and normalization.

### Fundamental invariants of a local hermitian lattice

**construction; `GN.2/hermitian-lattice-invariants`.** For an integral nondegenerate O_F-hermitian lattice L of rank n over a DVR, attach the unique ordered a₁≤…≤a_n with a_i≥0 and L∨/L≅⊕O_F/π^{a_i}; define val(L)=Σa_i and t(L)=#{i:a_i>0}. Vertex means a_i∈{0,1}; self-dual means all a_i=0.

Hypotheses and conventions: The quotient is measured by O_F-length; q is the size of the residue field of F₀ when F/F₀ is unramified quadratic. A_i=0 contributes the zero summand; n=0 has length/type 0.

Proof/construction outline: 1. Apply imported Smith normal form locally to the inclusion L→L∨; do not plan Smith normal form again. 2. Read off ordered exponents and prove independence of chosen bases and uniformizer. 3. Define valuation and type by finite sums/counts; identify vertex and self-dual cases.

Direct prerequisites: `GN.2/hermitian-dual-lattice`, `GN.2/dvr-torsion-decomposition-adapter`, `GN.2/dvr-ordered-exponent-uniqueness`, `GN.2/dvr-uniformizer-independence`, `GN.2/dvr-length-cardinality-adapter`

API contracts:

- `HermitianLatticeInvariants.ofDualQuotient` (constructor; native signature elaborated): The ordered DVR elementary-divisor exponents.
- `HermitianLatticeInvariants.valuation` (data; native signature elaborated): Sum of the exponents, equal to O_F-length.
- `HermitianLatticeInvariants.type` (data; native signature elaborated): Number of positive exponents.
- `HermitianLatticeInvariants.selfDual_iff` (characterisation; native signature elaborated): Self-duality iff valuation is zero.
- `HermitianLatticeInvariants.vertex_iff` (characterisation; native signature elaborated): Vertex iff every exponent is 0 or 1.

Mathematical test contracts:

- `hermitian_lattice_invariants_test_1` (characterisation): Rank one with Gram π³ has val=3 and type=1; it is not a vertex lattice.
- `hermitian_lattice_invariants_test_2` (characterisation): Invariants (0,1,1) give val=2, type=2 and a vertex lattice.
- `hermitian_lattice_invariants_test_3` (characterisation): The cardinality of L∨/L is q^{2 val(L)} in an unramified quadratic extension, not q^{val(L)}.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), §1.7, physical p.8. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§1.7, physical p.8`: Fundamental invariants of a local hermitian lattice supplies the corresponding staged target or its next declaration.

### Quaternionic integral hermitian lattices

**construction; `GN.2/quaternionic-integral-hermitian-data`.** An embedded full central-ring lattice L in a right quaternion module is stable under the chosen star-stable quaternion order O. A nondegenerate pairing h has h(xa,yb)=star(a)h(x,y)b and h(y,x)=star(h(x,y)); integrality means h(L,L)⊂O. The right module is represented by the native opposite-ring action and the quaternion algebra and standard involution by an actual algebra-isomorphism model.

Hypotheses and conventions: Characteristic-zero central fraction field, standard-involution quaternion algebra, order full over the central ring, and a right module whose opposite-ring action is compatible with central scalar multiplication. The pairing is perfect on the generic space; integral regularity is an additional condition.

Proof/construction outline: 1. Import B and its standard involution and reuse the native full finite R-submodule. 2. Add actual right O-stability and the noncommutative sesquilinear pairing conditions. 3. Localize the order, lattice and pairing together and compare only within those fixed local orders. The order/module localization and source-specific quaternionic classification remain named gaps.

Direct prerequisites: `GN.2/integral-quadratic-lattice`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`

API contracts:

- `QuaternionicIntegralHermitianLattice.ofOrderStableCarrier` (constructor; native signature elaborated): The actual O-stable native R-lattice and quaternionic pairing.
- `QuaternionicIntegralHermitianLattice.order` (projection; native signature elaborated): Retain the coefficient order and its involution.
- `QuaternionicIntegralHermitianLattice.localize` (functoriality; supplier signature unmatched): Localize order, lattice and pairing simultaneously.

Mathematical test contracts:

- `quaternionic_integral_hermitian_data_test_1` (characterisation): For a star-stable quaternion order O, H(x,y)=star(x)y on O satisfies the integral pairing condition.
- `quaternionic_integral_hermitian_data_test_2` (characterisation): Taking reduced trace of H(1,1)=1 gives 2, so reduced-trace metric normalization is a separate comparison.
- `quaternionic_integral_hermitian_data_test_3` (characterisation): Changing the order changes the integral-isometry problem even when the ambient quaternion algebra is unchanged.

Source/derivation: [EmeryKim2022](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FB96042ED962BAA031D1F39C7A8AA012/S2050509422000433a.pdf/quaternionic-hyperbolic-lattices-of-minimal-covolume.pdf), §5.1, printed pp.10–11. Actual right order modules, standard involution and twisted right dual. The source proves the free diagonal example, while this node is the explicitly more general embedded-lattice adapter.

Use: `§9.3–9.7 full lattice and quadratic-module conventions; worker extension to the staged quaternionic hermitian target`: Quaternionic integral hermitian lattices supplies the corresponding staged target or its next declaration.

### Atomic integral quadratic forms over a local PID

**definition; `GN.2/dyadic-atomic-form`.** Over a local PID R with valuation v and uniformizer π, an atomic quadratic form is either ⟨a⟩ with a a unit, or, when 2 is not a unit, a binary [a,b,c] satisfying v(b)<v(2a)≤v(2c) and v(a)v(b)=0. These are integral quadratic maps; the polar pairing is not divided by two.

Hypotheses and conventions: Valuation may take infinity for zero; the stated strict inequality excludes the unwanted zero terms. Field cases use the source’s trivial-valuation convention separately.

Proof/construction outline: 1. Use the native rank-one/rank-two quadratic map, with actual local-ring valuation conditions. 2. Record the two alternatives and transport them along integral isometry. 3. Keep the binary dyadic alternative distinct from field diagonalization.

Direct prerequisites: `mathlib:QuadraticMap`, `mathlib:IsDiscreteValuationRing.addVal`

API contracts:

- `IsAtomicIntegralQuadraticForm` (constructor; native signature elaborated): The exact unary or dyadic binary valuation predicate.
- `IsAtomicIntegralQuadraticForm.unary` (characterisation; native signature elaborated): Unary atomic forms have unit coefficient.
- `IsAtomicIntegralQuadraticForm.binary` (characterisation; native signature elaborated): The binary alternative includes 2 nonunit and all valuation inequalities.

Mathematical test contracts:

- `dyadic_atomic_form_test_1` (characterisation): Over Z₂ the hyperbolic quadratic form xy is an atomic binary form.
- `dyadic_atomic_form_test_2` (characterisation): Over a ring with 2 invertible only the rank-one unit alternative occurs.
- `dyadic_atomic_form_test_3` (degenerate): The zero-dimensional quadratic form is not an atomic unary or binary block; zero blocks in a normalization require the separate infinity-exponent convention.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), Definition 9.8.1 and Example 9.8.2, printed p.147. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Definition 9.8.1 and Example 9.8.2, printed p.147`: Atomic integral quadratic forms over a local PID supplies the corresponding staged target or its next declaration.

### Minimal polar pivot

**lemma; `GN.2/atomic-minimal-polar-pivot`.** For nonzero polar matrix choose an entry of minimal valuation, preferring a diagonal entry in a tie. The chosen pivot divides every entry over the DVR.

Proof/construction outline: 1. The finite valuation minimum is attained. 2. DVR divisibility is the valuation comparison; the zero matrix is a separate base case.

Direct prerequisites: `GN.2/dyadic-atomic-form`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [VoightAlgorithm2013](https://arxiv.org/pdf/1004.0994), §3, Algorithm 3.12, correctness proof, printed pp.12–14. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/atomic-odd-pivot-diagonal`: Uses minimal polar pivot with the displayed hypotheses and normalization. `GN.2/atomic-unary-complement`: Uses minimal polar pivot with the displayed hypotheses and normalization. `GN.2/atomic-binary-pivot-normalization`: Uses minimal polar pivot with the displayed hypotheses and normalization.

### Odd pivot diagonalization

**lemma; `GN.2/atomic-odd-pivot-diagonal`.** If 2 is a unit and the strictly minimal entry is off diagonal T_ij, the vector e_i+e_j has T(v,v) of the same minimal valuation.

Proof/construction outline: 1. Expand T(v,v)=T_ii+2T_ij+T_jj. 2. Strictly higher diagonal valuations cannot cancel the unit-scaled minimal middle term.

Direct prerequisites: `GN.2/atomic-minimal-polar-pivot`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [VoightAlgorithm2013](https://arxiv.org/pdf/1004.0994), §3, Algorithm 3.12, correctness proof, printed pp.12–14. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/atomic-unary-complement`: Uses odd pivot diagonalization with the displayed hypotheses and normalization.

### Unary integral complement

**lemma; `GN.2/atomic-unary-complement`.** A minimal diagonal pivot v admits integral ratios T(v,e_k)/T(v,v); subtracting these multiples of v produces an orthogonal complementary basis.

Proof/construction outline: 1. Use pivot divisibility. 2. The shear is triangular unimodular; directly check the two polar terms cancel.

Direct prerequisites: `GN.2/atomic-minimal-polar-pivot`, `GN.2/atomic-odd-pivot-diagonal`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [VoightAlgorithm2013](https://arxiv.org/pdf/1004.0994), §3, Algorithm 3.12, correctness proof, printed pp.12–14. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/atomic-block-extraction`: Uses unary integral complement with the displayed hypotheses and normalization. `GN.2/atomic-corrected-square-completion`: Uses unary integral complement with the displayed hypotheses and normalization.

### Dyadic binary pivot normalization

**lemma; `GN.2/atomic-binary-pivot-normalization`.** For a strict off-diagonal minimum at a dyadic DVR, scale e_i by the unit π^v(T_ij)/T_ij and take e_j as the second vector. Their off-diagonal entry is π^v(T_ij), with both diagonal entries of strictly higher valuation.

Proof/construction outline: 1. The scaling factor has valuation zero. 2. Minimality and tie preference give strict diagonal inequalities.

Direct prerequisites: `GN.2/atomic-minimal-polar-pivot`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [VoightAlgorithm2013](https://arxiv.org/pdf/1004.0994), §3, Algorithm 3.12, correctness proof, printed pp.12–14. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/atomic-binary-determinant-valuation`: Uses dyadic binary pivot normalization with the displayed hypotheses and normalization.

### Binary determinant valuation

**lemma; `GN.2/atomic-binary-determinant-valuation`.** For diagonal entries A,C and off-diagonal B with v(A),v(C)>v(B), d=AC−B² has valuation 2v(B).

Proof/construction outline: 1. v(AC)>2v(B), so the unequal-valuation subtraction has the valuation of B².

Direct prerequisites: `GN.2/atomic-binary-pivot-normalization`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [VoightAlgorithm2013](https://arxiv.org/pdf/1004.0994), §3, Algorithm 3.12, correctness proof, printed pp.12–14. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/atomic-binary-integral-complement`: Uses binary determinant valuation with the displayed hypotheses and normalization.

### Binary integral complement

**lemma; `GN.2/atomic-binary-integral-complement`.** For each remaining e_k put t=B T(v2,e_k)−C T(v1,e_k), u=B T(v1,e_k)−A T(v2,e_k). Both t/d,u/d are integral; e_k+(t/d)v1+(u/d)v2 is orthogonal to the binary plane.

Proof/construction outline: 1. Pivot minimality bounds every T(vj,e_k) valuation below by v(B), so v(t),v(u)≥2v(B). 2. Solve the two linear equations; the added shear is unimodular.

Direct prerequisites: `GN.2/atomic-binary-determinant-valuation`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [VoightAlgorithm2013](https://arxiv.org/pdf/1004.0994), §3, Algorithm 3.12, correctness proof, printed pp.12–14. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/atomic-block-extraction`: Uses binary integral complement with the displayed hypotheses and normalization.

### Atomic block extraction

**lemma; `GN.2/atomic-block-extraction`.** Remove the common valuation from the unary or binary pivot. A binary pivot has at least one unit quadratic coefficient or unit middle coefficient, and satisfies the atomic inequalities.

Proof/construction outline: 1. Factor the minimum valuation of Q(v1),T(v1,v2),Q(v2), rather than indiscriminately dividing a polar diagonal by 2. 2. Order the two diagonal valuations; verify the source atomic predicate.

Direct prerequisites: `GN.2/atomic-unary-complement`, `GN.2/atomic-binary-integral-complement`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [VoightAlgorithm2013](https://arxiv.org/pdf/1004.0994), §3, Algorithm 3.12, correctness proof, printed pp.12–14. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/atomic-rank-termination`: Uses atomic block extraction with the displayed hypotheses and normalization.

### Atomic splitting termination

**lemma; `GN.2/atomic-rank-termination`.** Each nonzero pivot removes a unary or binary rank, so recursion terminates. In a characteristic-zero DVR a zero polar matrix means q=0, recorded as zero blocks with infinite exponent.

Proof/construction outline: 1. Use induction on finite free rank. 2. 2q(x)=T(x,x) and characteristic zero justify the zero-polar branch. 3. Sort blocks after orthogonal extraction; do not assert coefficient-triple uniqueness.

Direct prerequisites: `GN.2/atomic-block-extraction`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [VoightAlgorithm2013](https://arxiv.org/pdf/1004.0994), §3, Algorithm 3.12, correctness proof, printed pp.12–14. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/integral-normalized-form`: Uses atomic splitting termination with the displayed hypotheses and normalization.

### Normalized integral quadratic form

**theorem; `GN.2/integral-normalized-form`.** Every finite-projective quadratic form over a local PID has an integral basis giving an orthogonal sum π^{e₁}Q₁⊥…⊥π^{e_s}Q_s of atomic unary/binary forms, with ordered exponents e_i≥0, allowing the zero blocks specified by the source infinity convention. This normalized form is not asserted unique.

Hypotheses and conventions: Over a local PID the finite-projective underlying module is free. No uniform diagonalization theorem is exported for dyadic rings. Algorithm adapter here is proved for a finite free module over a characteristic-zero DVR; a projective module is free locally. The broader source proposition remains a separate scope, not an equal-characteristic-two algorithm assertion.

Proof/construction outline: 1. Choose a least-valuation coefficient or cross coefficient. 2. Split the corresponding unary or dyadic binary block by integral basis operations and iterate on the orthogonal complement. 3. The exact algorithm and division-validity proof are cited to Voight Algorithm 3.12 and remain a primary-source gap.

Direct prerequisites: `GN.2/dyadic-atomic-form`, `GN.2/atomic-rank-termination`

Mathematical test contracts:

- `integral_normalized_form_test_1` (characterisation): The binary hyperbolic dyadic block cannot be discarded in favour of an unsupported integral diagonalization.
- `integral_normalized_form_test_2` (characterisation): The zero quadratic map requires the specified zero-block convention.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), Proposition 9.8.4 and proof reference, printed pp.147–148. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Proposition 9.8.4 and proof reference, printed pp.147–148`: Normalized integral quadratic form supplies the corresponding staged target or its next declaration.

### Integral lattice inclusion detected locally

**lemma; `GN.2/lattice-inclusion-localizations`.** For full R-lattices L,M in a fixed fraction-field K-space over a Dedekind domain, L is contained in M iff L_(p) is contained in M_(p) for every maximal ideal p.

Hypotheses and conventions: R is a Dedekind domain; intersections are in the fixed K-space. This detects embedded submodule equality, not the existence of a compatible family of integral isometries.

Proof/construction outline: 1. Forward inclusion follows by localization. For the converse apply the intersection-of-localizations equality to M and each x in L.

Direct prerequisites: `GN.2/lattice-intersection-localizations`, `GN.2/lattice-localization`

Acceptance: 2Z is contained in Z at every prime, and the reverse inclusion fails at prime 2.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), Lemma 9.4.6 and Corollary 9.4.7, printed p.140. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `GN.2/lattice-intersection-localizations`: Separate the declaration-sized input from the bundled consuming declaration.

### Field hyperbolic comparison

**comparison; `GN.2/field-hyperbolic-comparison`.** For a finite-dimensional field space with 2 invertible, passage from a nondegenerate symmetric pairing B to q(x)=B(x,x)/2 identifies its categorical hyperbolic plane with the supplier xy plane. The integral hyperbolic plane over Z needs no division by 2.

Proof/construction outline: 1. Apply the supplier equivalence xy≃⟨1,−1⟩ only after scalar extension; compute polar(q)=B.

Direct prerequisites: `GN.2/integral-quadratic-lattice`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-1-hyperbolic-planes-and-witt-theory`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), §9.3–9.7 printed pp.137–145; exact supplier layer contract read separately on 2026-10-09. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2`: Exports field hyperbolic comparison to the staged target; source or supplier gaps remain explicit.

### Field discriminant comparison

**comparison; `GN.2/field-discriminant-comparison`.** In a basis of the generic space, the supplier plain quadratic discriminant of q=B(x,x)/2 is the square class of 2^(−n) det Gram(B), and signed discriminant multiplies by (−1)^(n(n−1)/2). Basis changes multiply by a square.

Proof/construction outline: 1. Use the supplier Gram determinant description and signed-to-plain conversion, with the factor 2^(−n) retained.

Direct prerequisites: `GN.2/integral-quadratic-lattice`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-3-the-classical-invariants-that-need-no-brauer-group`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), §9.3–9.7 printed pp.137–145; exact supplier layer contract read separately on 2026-10-09. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/signed-hermitian-determinant-comparison`: Uses field discriminant comparison with the displayed hypotheses and normalization.

### Field Witt comparison

**comparison; `GN.2/field-witt-comparison`.** Over a field with 2 invertible, the exact-category symmetric W0 of finite-dimensional vector spaces is additively isomorphic to the supplier Witt ring via B↦B(x,x)/2; orthogonal sums and hyperbolic relations agree. This supplies no integral Witt ring or dyadic quadratic-refinement identification.

Proof/construction outline: 1. Use split exactness of vector spaces, the hyperbolic comparison and the two universal presentations.

Direct prerequisites: `GN.2/integral-quadratic-lattice`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), §9.3–9.7 printed pp.137–145; exact supplier layer contract read separately on 2026-10-09. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2`: Exports field witt comparison to the staged target; source or supplier gaps remain explicit.

### Field Hasse comparison

**comparison; `GN.2/field-hasse-comparison`.** The generic quadratic form of an integral lattice uses the supplier Brauer-valued Hasse and Clifford invariants, with its signed/plain discriminant conventions; integral basis change preserves these through the generic isometry. No complete invariant claim over a general field is made.

Proof/construction outline: 1. Extend the integral isometry to K and invoke the supplier invariant descent; do not construct a second symbol.

Direct prerequisites: `GN.2/integral-quadratic-lattice`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-5-the-brauer-valued-invariants`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), §9.3–9.7 printed pp.137–145; exact supplier layer contract read separately on 2026-10-09. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2`: Exports field hasse comparison to the staged target; source or supplier gaps remain explicit.

### Local field classification adapter

**comparison; `GN.2/local-field-classification-adapter`.** For a characteristic-zero nonarchimedean local field, generic nondegenerate quadratic spaces are isometric exactly when dimension, plain discriminant and local Hasse sign agree. Completed integral lattices with those generic invariants can still be inequivalent.

Proof/construction outline: 1. Apply the supplier 6D classifier to scalar-extended forms; its hypotheses include dyadic fields and its 6E dictionary fixes the Brauer-to-sign conversion.

Direct prerequisites: `GN.2/integral-quadratic-lattice`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-6-forms-over-a-nonarchimedean-local-field`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), §9.3–9.7 printed pp.137–145; exact supplier layer contract read separately on 2026-10-09. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2`: Exports local field classification adapter to the staged target; source or supplier gaps remain explicit.

### Global field isotropy adapter

**comparison; `GN.2/global-field-isotropy-adapter`.** For the generic nondegenerate quadratic form over a number field, a nonzero isotropic vector exists exactly when one exists at all finite and real completions. Integral representation of a prescribed value requires additional lattice conditions.

Proof/construction outline: 1. Apply supplier 5.5 after identifying the generic form and all its localizations; clear denominators only for the zero equation.

Direct prerequisites: `GN.2/integral-quadratic-lattice`, `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), §9.3–9.7 printed pp.137–145; exact supplier layer contract read separately on 2026-10-09. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2`: Exports global field isotropy adapter to the staged target; source or supplier gaps remain explicit.

### Global field isometry adapter

**comparison; `GN.2/global-field-isometry-adapter`.** Local generic isometry at every finite and real place gives a single generic K-isometry. It does not identify the embedded lattices; the integral-genus relation and its class set retain precisely that extra problem.

Proof/construction outline: 1. Apply supplier 6.3 to the finite-dimensional regular forms, then state the remaining condition f(L)=M separately.

Direct prerequisites: `GN.2/integral-quadratic-lattice`, `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-6-representation-and-isometry`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), §9.3–9.7 printed pp.137–145; exact supplier layer contract read separately on 2026-10-09. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2`: Exports global field isometry adapter to the staged target; source or supplier gaps remain explicit.

### Symmetric Z carrier comparison

**comparison; `GN.2/symmetric-z-carrier-comparison`.** For R=Z,K=Q and a symmetric integral pairing B, the GN integral hermitian carrier with trivial involution recovers the completed IntegralLattices carrier. For an integral quadratic q use B=polar(q), not q(x)=B(x,x)/2 without the evenness condition.

Proof/construction outline: 1. Identify the common native Submodule Z V and Submodule.IsLattice Q instance; restrict the same B and compare integral values.

Direct prerequisites: `GN.2/integral-quadratic-lattice`, `tauceti:Completed/IntegralLattices#layer-1-lattices-with-forms`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), §9.3–9.7 printed pp.137–145; exact supplier layer contract read separately on 2026-10-09. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2`: Exports symmetric z carrier comparison to the staged target; source or supplier gaps remain explicit.

### Symmetric Z dual comparison

**comparison; `GN.2/symmetric-z-dual-comparison`.** Under the same symmetric Q-space specialization, GN hermitian dual equals B.dualSubmodule L as embedded Z-submodules. The quotient L∨/L and its determinant cardinality are the supplier discriminant group, for nondegenerate integral L.

Proof/construction outline: 1. Apply membership extensionality to the identical integral-pairing condition and reuse the supplier finite quotient and Smith comparison.

Direct prerequisites: `GN.2/integral-quadratic-lattice`, `tauceti:Completed/IntegralLattices#layer-2-duality-and-the-finite-discriminant-group`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), §9.3–9.7 printed pp.137–145; exact supplier layer contract read separately on 2026-10-09. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2`: Exports symmetric z dual comparison to the staged target; source or supplier gaps remain explicit.

### Symmetric Z overlattice comparison

**comparison; `GN.2/symmetric-z-overlattice-comparison`.** For the specialization, intermediate L⊂M⊂L∨ correspond through the supplier to subgroups of A_L. Integral M requires vanishing of the bilinear form; even M requires the quadratic refinement. A subgroup isotropic only for a quadratic form is used only when L is even.

Proof/construction outline: 1. Transport the common dual quotient through the supplier order isomorphism; reuse H⊥/H and the squared-index determinant formula.

Direct prerequisites: `GN.2/integral-quadratic-lattice`, `tauceti:Completed/IntegralLattices#layer-4-overlattices-and-isotropic-subgroups`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), §9.3–9.7 printed pp.137–145; exact supplier layer contract read separately on 2026-10-09. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2`: Exports symmetric z overlattice comparison to the staged target; source or supplier gaps remain explicit.

### Corrected square completion

**lemma; `GN.2/atomic-corrected-square-completion`.** When the unary pivot a is allowed, [a,b,c] becomes ⟨a,c−b²/(4a)⟩ by y-b/(2a)x in the basis. The printed plus signs in Example 3.14 are incorrect.

Proof/construction outline: 1. Substitute f1=e1 and f2=e2−(b/(2a))e1 and expand q(f2). 2. For [1,2,2] over Z₂ this gives ⟨1,1⟩, while the printed formula gives ⟨1,3⟩.

Direct prerequisites: `GN.2/atomic-unary-complement`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [VoightAlgorithm2013](https://arxiv.org/pdf/1004.0994), §3, Algorithm 3.12, correctness proof, printed pp.12–14. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2`: Exports corrected square completion to the staged target; source or supplier gaps remain explicit.

### Spinor norm of reflection products

**lemma; `GN.2/spinor-reflection-product`.** For q=xy the two reflections in (1,1) and (1,a) give diag(a,a^−1), with spinor norm [a] for a≠0.

Proof/construction outline: 1. Compute τ_(s,t)(x,y)=(-s y/t,-t x/s). 2. Multiply the two matrices and use the supplier spinor norm product rule.

Direct prerequisites: `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-1-hyperbolic-planes-and-witt-theory`, `GN.2/proper-spinor-genus`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [SchulzePillot2020](https://arxiv.org/pdf/2008.12847), §9.2, Lemma 9.10 and Example 9.12, printed pp.124–125; worker explicit hyperbolic example. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2`: Exports spinor norm of reflection products to the staged target; source or supplier gaps remain explicit.

### Nondyadic unimodular spinor image

**lemma; `GN.2/spinor-unimodular-stabilizer`.** For a nondyadic nonarchimedean local field and nondegenerate unimodular lattice of rank at least two, the proper stabilizer spinor norm image is R×K×².

Proof/construction outline: 1. The integral orthogonal group is generated by reflections in unit-norm vectors. 2. The lattice represents every unit; products of two reflections realize all unit classes.

Direct prerequisites: `GN.2/proper-spinor-genus`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-6-forms-over-a-nonarchimedean-local-field`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [SchulzePillot2020](https://arxiv.org/pdf/2008.12847), §9.2, Lemma 9.19, printed pp.126–127. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/spinor-adelic-norm`: Uses nondyadic unimodular spinor image with the displayed hypotheses and normalization.

### Adelic spinor norm

**lemma; `GN.2/spinor-adelic-norm`.** Local spinor norms of an adelic proper isometry assemble to an idele square class: almost all coordinates are units since its components stabilize unimodular local lattices.

Proof/construction outline: 1. Discard finitely many bad/dyadic/nonstabilizing places. 2. Apply the local unit-image result on the complement.

Direct prerequisites: `GN.2/spinor-unimodular-stabilizer`, `AdelicAlgebraicGroups:AA.1`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [SchulzePillot2020](https://arxiv.org/pdf/2008.12847), §9.2, Definition/Lemma 9.20, printed p.127. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/spinor-stabilizer-quotient`: Uses adelic spinor norm with the displayed hypotheses and normalization.

### Proper spinor stabilizer quotient

**lemma; `GN.2/spinor-stabilizer-quotient`.** In the proper genus, φL belongs to the proper spinor genus of L exactly when θ(φ) lies in θ(SO(K))θ(SO(A;L)); proper spinor genera correspond to the quotient of the actual adelic spinor-norm image by this product.

Proof/construction outline: 1. The kernel of θ is the actual spin image and contains commutators. 2. Move that normal kernel across the global group and stabilizer. 3. The resulting coset criterion gives injectivity and surjectivity onto the image quotient.

Direct prerequisites: `GN.2/spinor-adelic-norm`, `GN.2/proper-spinor-genus`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [SchulzePillot2020](https://arxiv.org/pdf/2008.12847), §9.2, Theorem 9.21 and full proof, printed p.127. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2`: Exports proper spinor stabilizer quotient to the staged target; source or supplier gaps remain explicit.

### Quaternion order involution stability

**lemma; `GN.2/quaternion-order-star-stability`.** For a quaternion order over the number ring, standard involution preserves the order.

Proof/construction outline: 1. Write standard conjugation as reduced trace minus the element; the trace is integral in the central number ring.

Direct prerequisites: `GN.2/quaternionic-integral-hermitian-data`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [EmeryKim2022](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FB96042ED962BAA031D1F39C7A8AA012/S2050509422000433a.pdf/quaternionic-hyperbolic-lattices-of-minimal-covolume.pdf), §5.1, printed p.10. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/quaternion-right-twisted-dual`: Uses quaternion order involution stability with the displayed hypotheses and normalization.

### Quaternion right twisted dual

**lemma; `GN.2/quaternion-right-twisted-dual`.** For a right order module L, its dual of right-linear maps to the order becomes a right module by (f·a)(x)=star(a)f(x). The adjoint x↦h(x,−) is right-linear for this action.

Proof/construction outline: 1. Check the opposite multiplication order under star. 2. Apply first-variable conjugate linearity to the adjoint.

Direct prerequisites: `GN.2/quaternionic-integral-hermitian-data`, `GN.2/quaternion-order-star-stability`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [EmeryKim2022](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FB96042ED962BAA031D1F39C7A8AA012/S2050509422000433a.pdf/quaternionic-hyperbolic-lattices-of-minimal-covolume.pdf), §5.1, printed pp.10–11. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/quaternion-unit-diagonal-regular`: Uses quaternion right twisted dual with the displayed hypotheses and normalization.

### Unit diagonal quaternion regularity

**lemma; `GN.2/quaternion-unit-diagonal-regular`.** On a free right order module with diagonal hermitian coefficients central units a_i, the adjoint is an isomorphism, with inverse on dual basis e_i*↦e_i a_i^−1.

Proof/construction outline: 1. The diagonal formula gives adjoint(e_i)=a_i e_i*. 2. Centrality, star(a_i)=a_i and unit inverses verify both compositions.

Direct prerequisites: `GN.2/quaternion-right-twisted-dual`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [EmeryKim2022](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FB96042ED962BAA031D1F39C7A8AA012/S2050509422000433a.pdf/quaternionic-hyperbolic-lattices-of-minimal-covolume.pdf), Lemma 5.1 and full proof, printed p.11. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/quaternion-split-stabilizer`: Uses unit diagonal quaternion regularity with the displayed hypotheses and normalization.

### Split quaternion stabilizer comparison

**lemma; `GN.2/quaternion-split-stabilizer`.** For a PID R with fraction field K, a split order O⊗R≅M2(R) and a regular free rank-r right hermitian module, its unitary stabilizer identifies with Sp_(2r)(R) inside the generic unitary group identified with Sp_(2r)(K).

Proof/construction outline: 1. Use the two standard matrix idempotents to obtain the rank-2r R-module and its alternating pairing. 2. Extend linear functionals and isometries using the off-diagonal matrix as in the source formula; regularity descends. 3. Import the unimodular alternating-form classification over a PID, retaining that precise supplier gap.

Direct prerequisites: `GN.2/quaternion-unit-diagonal-regular`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [EmeryKim2022](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FB96042ED962BAA031D1F39C7A8AA012/S2050509422000433a.pdf/quaternionic-hyperbolic-lattices-of-minimal-covolume.pdf), Lemma 5.2 and full proof, printed pp.11–12. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2`: Exports split quaternion stabilizer comparison to the staged target; source or supplier gaps remain explicit.

### Odd local quadratic norms

**lemma; `GN.2/odd-local-quadratic-norms`.** For a quadratic local extension F/F0 of odd residue characteristic, norms are the base-field units/elements lying in F-squares at even base valuation, together with negatives of F-squares at odd base valuation. In the unramified case they are exactly elements of even base valuation.

Hypotheses and conventions: Nonarchimedean local fields of odd residue characteristic; commutative trivial or quadratic extension with its specified involution.

Proof/construction outline: 1. Use Hensel square roots on principal units. 2. Compute residue unit norms in the ramified and unramified cases; append the relevant uniformizer norm.

Direct prerequisites: `GN.2/integral-hermitian-lattice`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [KSS2021](https://arxiv.org/pdf/1611.02667), Lemma 3.1 and full proof, printed pp.10–11. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/signed-hermitian-determinant-comparison`: Uses odd local quadratic norms with the displayed hypotheses and normalization. `GN.2/signed-hermitian-witt-comparison`: Uses odd local quadratic norms with the displayed hypotheses and normalization.

### Signed hermitian determinant comparison

**comparison; `GN.2/signed-hermitian-determinant-comparison`.** The determinant of a nondegenerate ε-hermitian field space is a well-defined class modulo the norm group, and changes by N(det B) under basis change; for the trivial extension the quotient is by squares. For a hyperbolic plane the class is −ε.

Hypotheses and conventions: Nonarchimedean local fields of odd residue characteristic; commutative trivial or quadratic extension with its specified involution.

Proof/construction outline: 1. Expand the conjugate-transpose Gram basis change and take its determinant. 2. The hyperbolic matrix [[0,1],[ε,0]] fixes the sign.

Direct prerequisites: `GN.2/integral-hermitian-lattice`, `GN.2/field-discriminant-comparison`, `GN.2/odd-local-quadratic-norms`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [KSS2021](https://arxiv.org/pdf/1611.02667), §3.2, printed pp.12–13. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2`: Exports signed hermitian determinant comparison to the staged target; source or supplier gaps remain explicit.

### Signed hermitian twist

**construction; `GN.2/signed-hermitian-twist`.** For perfect ε-hermitian h and invertible endomorphism a with adjoint(a)=ηa, η=±1, put h_a(v,w)=h(v,aw). This is perfect ηε-hermitian and its adjoint is b↦a^−1 adjoint(b)a.

Hypotheses and conventions: Nonarchimedean local fields of odd residue characteristic; commutative trivial or quadratic extension with its specified involution.

Proof/construction outline: 1. Compose the second-variable linear map with a and check the symmetry using its adjoint relation. 2. Transport the perfect adjoint and compute the conjugation formula.

Direct prerequisites: `GN.2/integral-hermitian-lattice`

API contracts:

- `signedHermitianTwist` (constructor; native signature elaborated): Compose the perfect sesquilinear form in its second variable with the given unit endomorphism.
- `signedHermitianTwist_apply` (simp; native signature elaborated): Evaluate as h(v,aw).
- `signedHermitianTwist_adjoint` (compatibility; native signature elaborated): The endomorphism adjoint is conjugated by a, with the displayed order.

Mathematical test contracts:

- `signed_hermitian_twist_test_1` (characterisation): a=1 leaves h unchanged.
- `signed_hermitian_twist_test_2` (characterisation): A scalar of negative involution changes hermitian to skew-hermitian.
- `signed_hermitian_twist_test_3` (characterisation): a=0 fails perfectness in positive rank and is excluded.

Source/derivation: [KSS2021](https://arxiv.org/pdf/1611.02667), §3.3, printed pp.13–14. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/signed-witt-scalar-twist`: Uses signed hermitian twist with the displayed hypotheses and normalization.

### Odd local signed Witt comparison

**comparison; `GN.2/signed-hermitian-witt-comparison`.** The exact-category Witt quotient for finite signed-hermitian vector spaces identifies with the anisotropic-class Witt group. For a quadratic extension it has order four, C2×C2 when −1 is a norm and C4 otherwise. The trivial-extension alternating case is zero; the orthogonal case imports the existing field Witt theory.

Hypotheses and conventions: Nonarchimedean local fields of odd residue characteristic; commutative trivial or quadratic extension with its specified involution.

Proof/construction outline: 1. Use the perfect duality induced by the field involution and sign on finite vector spaces. 2. Witt decomposition identifies quotient classes with anisotropic kernels; rank-one norm classes give the stated finite group.

Direct prerequisites: `GN.6/exact-witt-group`, `GN.2/odd-local-quadratic-norms`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [KSS2021](https://arxiv.org/pdf/1611.02667), §3.4, Proposition 3.12, printed p.14. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/signed-witt-scalar-twist`: Uses odd local signed witt comparison with the displayed hypotheses and normalization. `GN.2/signed-hermitian-transfer`: Uses odd local signed witt comparison with the displayed hypotheses and normalization. `GN.2/signed-transfer-parity-injectivity`: Uses odd local signed witt comparison with the displayed hypotheses and normalization.

### Signed Witt scalar twisting

**comparison; `GN.2/signed-witt-scalar-twist`.** For γ≠0 with involution(γ)=ηγ, scalar twisting induces an additive equivalence Wε(F/F0)→Wηε(F/F0), with inverse twist by γ^−1.

Hypotheses and conventions: Nonarchimedean local fields of odd residue characteristic; commutative trivial or quadratic extension with its specified involution.

Proof/construction outline: 1. Twisting preserves isometries, orthogonal sums and hyperbolic spaces. 2. Compose the two scalar twists and cancel γ.

Direct prerequisites: `GN.2/signed-hermitian-twist`, `GN.2/signed-hermitian-witt-comparison`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [KSS2021](https://arxiv.org/pdf/1611.02667), §3.4, printed p.14. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/signed-transfer-image-independent`: Uses signed witt scalar twisting with the displayed hypotheses and normalization.

### Signed hermitian transfer

**construction; `GN.2/signed-hermitian-transfer`.** For finite E/F with extending involutions and a nonzero involution-equivariant F-linear map λ:E→F, restriction of scalars with λ∘h gives a perfect ε-hermitian form. It sends a hyperbolic E-plane to [E:F] hyperbolic F-planes and induces a Witt homomorphism.

Hypotheses and conventions: Nonarchimedean local fields of odd residue characteristic; commutative trivial or quadratic extension with its specified involution.

Proof/construction outline: 1. Nonzero λ and field multiplication make the transferred radical zero. 2. A maximal isotropic subspace has the required half-dimension after scalar restriction. 3. Use the hyperbolic relation to descend; the trivial-involution quadratic case is the supplier transfer.

Direct prerequisites: `GN.2/signed-hermitian-witt-comparison`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-9-transfer-and-the-relative-stiefel-whitney-formula`

API contracts:

- `signedHermitianTransfer` (constructor; native signature elaborated): Transfer an actual sesquilinear field form using a nonzero equivariant functional.
- `signedHermitianTransfer_apply` (simp; native signature elaborated): Evaluate as λ(h(v,w)).
- `signedHermitianTransfer_hyperbolic` (compatibility; native signature elaborated): A hyperbolic plane transfers to [E:F] hyperbolic planes.
- `signedHermitianTransfer_witt` (functoriality; supplier signature unmatched): The induced additive map on the exact Witt quotients.

Mathematical test contracts:

- `signed_hermitian_transfer_test_1` (characterisation): E=F and λ=id give the identity.
- `signed_hermitian_transfer_test_2` (characterisation): A hyperbolic plane transfers to degree-many hyperbolic planes.
- `signed_hermitian_transfer_test_3` (characterisation): The zero linear functional on a positive-rank space is degenerate and is excluded.

Source/derivation: [KSS2021](https://arxiv.org/pdf/1611.02667), §3.5, printed p.15. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/signed-transfer-image-independent`: Uses signed hermitian transfer with the displayed hypotheses and normalization.

### Signed transfer image independence

**lemma; `GN.2/signed-transfer-image-independent`.** For a self-dual extension E=F[β] with involution β↦−β, the image of the signed Witt transfer does not depend on the nonzero equivariant functional λ.

Hypotheses and conventions: Nonarchimedean local fields of odd residue characteristic; commutative trivial or quadratic extension with its specified involution.

Proof/construction outline: 1. Any two such functionals differ by multiplication by a unique element of the fixed-field unit group. 2. That scalar twist is a Witt isomorphism, so the images agree.

Direct prerequisites: `GN.2/signed-hermitian-transfer`, `GN.2/signed-witt-scalar-twist`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [KSS2021](https://arxiv.org/pdf/1611.02667), Proposition 3.13(i) and proof, printed p.15. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/signed-transfer-maximal-element`: Uses signed transfer image independence with the displayed hypotheses and normalization.

### Signed transfer maximal element

**lemma; `GN.2/signed-transfer-maximal-element`.** For the self-dual extension, transfer sends the unique maximal anisotropic Witt class to the target maximal class.

Hypotheses and conventions: Nonarchimedean local fields of odd residue characteristic; commutative trivial or quadratic extension with its specified involution.

Proof/construction outline: 1. Import the specific standard-functional maximal-element theorem cited by the source. 2. A scalar twist preserves the maximal class, so functional independence extends it to all λ.

Direct prerequisites: `GN.2/signed-transfer-image-independent`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [KSS2021](https://arxiv.org/pdf/1611.02667), Proposition 3.13(ii) and printed proof, printed p.15; its cited [39, Theorem 4.4] proof remains an acquisition gap. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2/signed-transfer-parity-injectivity`: Uses signed transfer maximal element with the displayed hypotheses and normalization.

### Signed transfer parity injectivity

**lemma; `GN.2/signed-transfer-parity-injectivity`.** Outside the alternating trivial-extension case, for a self-dual E=F[β] extension, signed transfer is injective separately on the even and the odd anisotropic-dimension classes. It need not be globally injective.

Hypotheses and conventions: Nonarchimedean local fields of odd residue characteristic; commutative trivial or quadratic extension with its specified involution.

Proof/construction outline: 1. If β=0 the standard transfer is the identity. 2. Otherwise the source unitary Witt group has two elements in each parity class; their difference is the nonzero maximal class, whose image remains nonzero.

Direct prerequisites: `GN.2/signed-transfer-maximal-element`, `GN.2/signed-hermitian-witt-comparison`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [KSS2021](https://arxiv.org/pdf/1611.02667), Proposition 3.14 and full proof, printed p.15. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.2`: Exports signed transfer parity injectivity to the staged target; source or supplier gaps remain explicit.

## GN.3: Finite counts, local densities, Siegel polynomials, mass and theta

Coverage: **partial**. Finished 300-node planning pass at the protocol budget; source/supplier/implementation closure is not asserted.

The follow-up must establish the following scope before closure:

- Acquire original finite hermitian counting, Hironaka/Gan–Yu/Cho–Yamauchi density/Siegel-series proofs, proper genus finiteness and Shimura/Gan–Hanke–Yu mass theorem; normalize actual Haar/zeta/local factors.
- Match the complete finite-quotient and compact valuation-ring adapters, then type the generic-density, eventual-empty and normalized-polynomial signatures. Read/decompose the remaining routed theta, mass, orbital/density and arithmetic local counting results.

### Finite hermitian representation counts

**definition; `GN.3/hermitian-representation-count`.** Atlas planet: Hermitian representation counts. For a finite commutative star ring A and hermitian Gram matrices G of size m and B of size n, count all m×n matrices X with XᴴGX=B. This is a finite count of form-preserving maps, including noninjective maps when the source form is degenerate.

Hypotheses and conventions: m,n may be zero; star is part of the input. The target space is rank m and the represented/source lattice is rank n.

Proof/construction outline: 1. Enumerate native finite matrices and filter by the actual conjugate-transpose Gram equation. 2. Change coordinates with integral invertible matrices to obtain bijections of solutions. 3. Distinguish injective embeddings in a separate declaration; equality with embeddings requires a nonsingular source over a field.

Direct prerequisites: `mathlib:Matrix.conjTranspose`

API contracts:

- `hermitianRepresentationCount` (constructor; native signature elaborated): Finite cardinality of XᴴGX=B.
- `hermitianRepresentationCount_empty` (simp; native signature elaborated): The empty source has count 1.
- `hermitianRepresentationCount_basisChange` (functoriality; native signature elaborated): Invertible source/target coordinate changes induce a bijection of representation sets.

Mathematical test contracts:

- `hermitian_representation_count_test_1` (characterisation): Over Z/3 with trivial star, m=n=1, G=B=1 gives 2 maps.
- `hermitian_representation_count_test_2` (characterisation): With G=1,B=0 over Z/3 the count is 1: the zero map.
- `hermitian_representation_count_test_3` (characterisation): For n=0 there is one empty-column representation, for every ambient rank.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), §3.1, definition of Rep_{M,L}, physical p.15. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§3.1, definition of Rep_{M,L}, physical p.15`: Finite hermitian representation counts supplies the corresponding staged target or its next declaration.

### Finite hermitian embedding counts

**definition; `GN.3/hermitian-embedding-count`.** For the same finite matrices, count solutions XᴴGX=B whose associated A-linear map A^n→A^m is injective. Over finite fields this is equivalent to column rank n; with a degenerate source it is stronger than the representation equation.

Hypotheses and conventions: The finite-field formula uses the extension F_{q²}/F_q with its nontrivial involution. Injectivity is not substituted by invertibility unless m=n.

Proof/construction outline: 1. Filter the representation set by injectivity of the native matrix linear map. 2. Use a nondegenerate source pairing over a field to prove automatic injectivity. 3. Under basis changes, transport the kernel condition as well as the Gram equation.

Direct prerequisites: `GN.3/hermitian-representation-count`

API contracts:

- `hermitianEmbeddingCount` (constructor; native signature elaborated): Finite count with the actual injectivity condition.
- `hermitianEmbeddingCount_empty` (simp; native signature elaborated): Count is 1 for n=0.
- `hermitianEmbeddingCount_le` (relation; native signature elaborated): Embedding count is at most representation count.
- `hermitianEmbeddingCount_eq_of_nonsingular` (compatibility; native signature elaborated): Over a field with nonsingular source, every representation is injective.

Mathematical test contracts:

- `hermitian_embedding_count_test_1` (characterisation): Over Z/3, G=1,B=0 at rank one gives 0 embeddings but 1 representation.
- `hermitian_embedding_count_test_2` (characterisation): For an empty source the unique map is injective and the count is 1.
- `hermitian_embedding_count_test_3` (characterisation): When n>m over a field the embedding count is zero.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), Proof of Theorem 3.5.1, physical p.18, finite hermitian isometries. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Proof of Theorem 3.5.1, physical p.18, finite hermitian isometries`: Finite hermitian embedding counts supplies the corresponding staged target or its next declaration.

### Finite-field hermitian isometry formula

**theorem; `GN.3/finite-hermitian-isometry-formula`.** For an n-dimensional F_{q²}/F_q-hermitian source with radical dimension a and a nondegenerate m-dimensional target, m≥n, the number of injective isometries is q^{n(2m−n)} ∏_{i=0}^{n+a−1}(1−(−q)^{i−m}).

Hypotheses and conventions: q is a prime power ≥2; the involution is x↦x^q. Count embeddings, not all maps from a degenerate source.

Proof/construction outline: 1. Choose the nondegenerate quotient of the source and its radical separately. 2. Count successive isometric vectors in the target and then injective isotropic radical lifts. 3. The exact finite hermitian counting argument is cited to Kitaoka by the source and remains an explicit proof acquisition gap.

Direct prerequisites: `GN.3/hermitian-embedding-count`

Mathematical test contracts:

- `finite_hermitian_isometry_formula_test_1` (characterisation): n=m=1,a=0 gives q+1 norm-one elements.
- `finite_hermitian_isometry_formula_test_2` (characterisation): n=m=1,a=1 gives 0 embeddings.
- `finite_hermitian_isometry_formula_test_3` (characterisation): n=0,a=0 gives the empty product 1.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), Proof of Theorem 3.5.1, physical p.18. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Proof of Theorem 3.5.1, physical p.18`: Finite-field hermitian isometry formula supplies the corresponding staged target or its next declaration.

### Normalized finite-level hermitian counts

**definition; `GN.3/normalized-hermitian-count`.** For N≥1 let A_N=O_F/π^N, reduce fixed integral source/target Gram matrices of ranks n≤m to A_N, and let q=#k_{F₀}. Set a_N=hermitianRepresentationCount(G_N,B_N)/q^{N n(2m−n)}. Equivalently its numerator is #Rep_{M,L}(O_{F₀}/π^N), because the representation scheme is over O_{F₀}; it is not #Rep_{M,L}(A_N). The denominator uses q, not q².

Hypotheses and conventions: F/F₀ is unramified quadratic and F₀ is a nonarchimedean local field of characteristic different from 2. The generic representation scheme is nonempty with dimension n(2m−n). This sequence does not by itself assert convergence.

Proof/construction outline: 1. Reduce the integral Gram matrices to each quotient ring. 2. Use the finite representation count, with all maps as in the representation scheme. 3. Normalize by the base-field residue size to the stated dimension; prove coordinate-change independence at every level.

Direct prerequisites: `GN.3/hermitian-representation-count`, `GN.2/integral-hermitian-lattice`

API contracts:

- `normalizedHermitianCount` (constructor; native signature elaborated): Finite count divided by q^{N n(2m−n)}.
- `normalizedHermitianCount_empty` (simp; native signature elaborated): The empty-source count is 1.
- `normalizedHermitianCount_basisChange` (compatibility; native signature elaborated): Integral invertible basis changes preserve every normalized count.

Mathematical test contracts:

- `normalized_hermitian_count_test_1` (characterisation): For n=0 the normalized count is 1 at every level.
- `normalized_hermitian_count_test_2` (characterisation): For m=n=1 the exponent is N, not 2N.
- `normalized_hermitian_count_test_3` (characterisation): A generic empty representation problem is not treated as a smooth nonempty scheme of the stated dimension.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), §3.1 local density definition, physical p.15. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§3.1 local density definition, physical p.15`: Normalized finite-level hermitian counts supplies the corresponding staged target or its next declaration.

### Eventually empty integral representation counts

**lemma; `GN.3/empty-generic-density-zero`.** For complete discrete valuation fields in the stated unramified hermitian setting, if the generic representation scheme Rep(M,L)(F0) is empty, there is N0 such that every integral Gram representation count modulo pi^N is zero for N>=N0. Consequently every fixed-power normalized count is eventually zero and its limit is zero.

Hypotheses and conventions: The unramified analytic density branch allows residue characteristic 2; geometric §3.4 hypotheses are not imported into all of §3. Haar measures on lattice coordinates assign volume 1 to the integral coordinate lattice before any self-dual Fourier normalization is applied.

Proof/construction outline: 1. In fixed integral bases let C_N be the matrices in the compact integral coordinate lattice whose Gram equations hold modulo pi^N. 2. Each C_N is closed, C_(N+1) is contained in C_N, and the intersection consists exactly of integral Gram solutions. 3. A solution over the integral ring would extend to a generic representation, so the intersection is empty. The compact finite-intersection property gives some empty C_N0. 4. Every finite quotient matrix lifts to integral coordinates. Thus emptiness of C_N0 and all subsequent C_N forces eventual zero counts.

Direct prerequisites: `GN.3/hermitian-representation-count`

Mathematical test contracts:

- `empty_generic_density_zero_test` (non-example): For a rank-one target of norm 1 and source of norm pi, reduction modulo pi has a zero-vector solution, while modulo pi^2 no solution can have norm of valuation one. Generic emptiness implies eventual zero, not zero at every finite level.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), Li–Zhang §3.1, physical p.15, definition of the count; compact inverse-limit argument is a reviewer derivation.. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `GN.3/hermitian-local-density`: Separate the declaration-sized input from the bundled consuming declaration.

### Hermitian local representation density

**construction; `GN.3/hermitian-local-density`.** Atlas planet: Hermitian local densities. In the stated unramified local-field setting, Den(M,L) is the limit of normalized finite-level representation counts. For nonempty generic fibre use its specified dimension and the source existence theorem. For empty generic fibre set Den(M,L)=0; eventual emptiness of the finite-level counts proves agreement with the limit for any fixed exponent. Its finite value and integral-basis independence are part of the construction.

Hypotheses and conventions: The unramified analytic density branch allows residue characteristic 2; geometric §3.4 hypotheses are not imported into all of §3. Haar measures on lattice coordinates assign volume 1 to the integral coordinate lattice before any self-dual Fourier normalization is applied.

Proof/construction outline: 1. Separate the empty-generic branch using empty-generic-density-zero; the nonempty branch retains its dimension and Hironaka/Gan–Yu existence gap. 2. Prove stabilization or convergence of the normalized finite-level sequence by local representation-density theory. 3. Identify the limit with the representation-scheme measure under the fixed normalization. 4. The existence and measure comparison proof from Hironaka/Gan–Yu is an explicit source gap.

Direct prerequisites: `GN.3/normalized-hermitian-count`, `GN.2/hermitian-lattice-invariants`, `GN.3/empty-generic-density-zero`

API contracts:

- `hermitianLocalDensity` (constructor; supplier signature unmatched): The proved limit of normalized counts.
- `hermitianLocalDensity_tendsto` (characterisation; supplier signature unmatched): The normalized sequence tends to the stated density.
- `hermitianLocalDensity_basisChange` (compatibility; supplier signature unmatched): Integral isometries preserve the density.
- `hermitianLocalDensity_emptyGeneric` (simp; supplier signature unmatched): An empty generic representation fibre has density zero.

Mathematical test contracts:

- `hermitian_local_density_test_1` (characterisation): Density of the empty source is 1.
- `hermitian_local_density_test_2` (characterisation): The denominator and measure use q=#k_{F₀}; substituting q² changes the limit.
- `hermitian_local_density_test_3` (characterisation): A ramified quadratic extension cannot reuse the unramified formula without a new theorem.
- `hermitian_local_density_test_4` (degenerate): An empty generic representation fibre has density zero, although initial finite reductions can still admit solutions.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), §§3.1–3.2, physical pp.15–16. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§§3.1–3.2, physical pp.15–16`: Hermitian local representation density supplies the corresponding staged target or its next declaration.

### Normalized hermitian Siegel polynomial

**construction; `GN.3/normalized-siegel-polynomial`.** Atlas planet: Hermitian Siegel polynomials. For an integral nondegenerate unramified hermitian lattice L of rank n, construct the unique D_L∈Z[X] such that D_L((−q)^−k)=Den(⟨1⟩_{n+k},L)/Den(⟨1⟩_{n+k},⟨1⟩_n) for every integer k≥0. The denominator is ∏_{i=1}^n(1−(−q)^−i(−q)^−k).

Hypotheses and conventions: q≥2 and the extension is unramified quadratic. The interpolating polynomial and its integral coefficients require a proof, not a generic choice of a function through finitely many values.

Proof/construction outline: 1. Import the density and the standard self-dual target normalization. 2. Use the source Siegel-series existence theorem to obtain an integral polynomial. 3. Uniqueness follows from infinitely many distinct interpolation points over Q; the original existence proof remains a gap.

Direct prerequisites: `GN.3/hermitian-local-density`, `GN.2/hermitian-lattice-invariants`

API contracts:

- `normalizedSiegelPolynomial` (constructor; supplier signature unmatched): The integral normalized density polynomial.
- `normalizedSiegelPolynomial_eval` (characterisation; supplier signature unmatched): Evaluate at (−q)^−k to recover the specified density ratio.
- `normalizedSiegelPolynomial_selfDual` (simp; supplier signature unmatched): Polynomial equals 1 for a self-dual lattice.
- `normalizedSiegelPolynomial_isometry` (functoriality; supplier signature unmatched): Integral hermitian isometries preserve the polynomial.

Mathematical test contracts:

- `normalized_siegel_polynomial_test_1` (characterisation): For a rank-one lattice with valuation a, D_L(X)=Σ_{i=0}^a(−X)^i.
- `normalized_siegel_polynomial_test_2` (characterisation): A self-dual lattice has polynomial 1.
- `normalized_siegel_polynomial_test_3` (characterisation): Using q^−k instead of (−q)^−k loses the alternating sign.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), §3.2, physical p.16. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§3.2, physical p.16`: Normalized hermitian Siegel polynomial supplies the corresponding staged target or its next declaration.

### Cho–Yamauchi weight polynomial

**definition; `GN.3/cho-yamauchi-weight`.** For q≥2 and a∈N define m_q(a;X)=∏_{i=0}^{a−1}(1−(−q)^i X) in Z[X], with empty product m_q(0;X)=1. The derivative weight is −m_q(a;X)′ at X=1; for a=0 it is 0, and for a≥1 it is ∏_{i=1}^{a−1}(1−(−q)^i).

Hypotheses and conventions: The negative base is in Z before taking powers. Polynomial empty weight 1 and derivative empty weight 0 are distinct.

Proof/construction outline: 1. Form the native polynomial finite product. 2. Differentiate at 1; for a≥1 only the differentiated i=0 factor survives. 3. Use the recurrence to support finite overlattice sums.

Direct prerequisites: `mathlib:Polynomial`, `mathlib:Polynomial.derivative`

API contracts:

- `choYamauchiWeight` (constructor; native signature elaborated): The native integral polynomial finite product.
- `choYamauchiWeight_zero` (simp; native signature elaborated): Empty polynomial weight is 1.
- `choYamauchiWeight_succ` (relation; native signature elaborated): m(a+1;X)=m(a;X)(1−(−q)^a X).
- `choYamauchiWeight_derivative` (relation; native signature elaborated): The negative derivative at 1 is 0 for a=0 and the stated product for a>0.

Mathematical test contracts:

- `cho_yamauchi_weight_test_1` (characterisation): m_q(0;X)=1, derivative weight 0.
- `cho_yamauchi_weight_test_2` (characterisation): m_q(1;X)=1−X, derivative weight 1.
- `cho_yamauchi_weight_test_3` (characterisation): m_q(2;X)=(1−X)(1+qX), derivative weight 1+q.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), §3.5 before Theorem 3.5.1, physical p.17. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§3.5 before Theorem 3.5.1, physical p.17`: Cho–Yamauchi weight polynomial supplies the corresponding staged target or its next declaration.

### Cho–Yamauchi hermitian density formula

**theorem; `GN.3/cho-yamauchi-overlattice-formula`.** Atlas planet: Cho–Yamauchi density formula. D_L(X)=Σ_{L⊆L′⊆(L′)∨} X^{2 length_{O_F}(L′/L)} m_q(t(L′);X), summing over integral overlattices of L. The sum is finite because every such L′ lies between L and L∨.

Hypotheses and conventions: Unramified quadratic extension of a local field of characteristic different from 2, including dyadic residue characteristic in this analytic statement. Length is over O_F; t is the number of positive fundamental invariants.

Proof/construction outline: 1. Classify a representation by its saturated overlattice and the residual hermitian radical. 2. Apply the finite-field embedding formula and the source smoothness/lifting result to each stratum. 3. Use polynomial interpolation to identify the finite sum with D_L. The smoothness and stratum-count comparison from Cho–Yamauchi/Gan–Yu remains explicit.

Direct prerequisites: `GN.3/normalized-siegel-polynomial`, `GN.3/cho-yamauchi-weight`, `GN.2/hermitian-dual-lattice`, `GN.2/hermitian-lattice-invariants`, `GN.3/finite-hermitian-isometry-formula`

Mathematical test contracts:

- `cho_yamauchi_overlattice_formula_test_1` (characterisation): For valuation-one rank one, D=1−X and the negative derivative is 1.
- `cho_yamauchi_overlattice_formula_test_2` (characterisation): For valuation-three rank one, D=1−X+X²−X³ and the negative derivative is 2.
- `cho_yamauchi_overlattice_formula_test_3` (characterisation): A self-dual L contributes just L with type 0 and polynomial 1.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), Theorem 3.5.1 and proof, physical pp.17–18. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Theorem 3.5.1 and proof, physical pp.17–18`: Cho–Yamauchi hermitian density formula supplies the corresponding staged target or its next declaration.

### Hermitian Siegel polynomial functional equation

**theorem; `GN.3/siegel-polynomial-functional-equation`.** For integral nondegenerate L, D_L(X)=(−X)^{val(L)}D_L(X^−1), interpreted in the Laurent polynomial ring. If val(L) is odd then D_L(1)=0.

Hypotheses and conventions: The val(L) parity and the negative sign are retained.

Proof/construction outline: 1. Apply the exact source Siegel-series functional equation with its discriminant parity. 2. Regard both sides as Laurent polynomials so inversion is meaningful. 3. Evaluate at 1; over Z, odd valuation gives D_L(1)=−D_L(1), hence zero.

Direct prerequisites: `GN.3/normalized-siegel-polynomial`, `GN.2/hermitian-lattice-invariants`

Mathematical test contracts:

- `siegel_polynomial_functional_equation_test_1` (characterisation): Rank-one D=1−X at valuation 1 satisfies D(X)=−X D(X^−1).
- `siegel_polynomial_functional_equation_test_2` (characterisation): At valuation 2, D=1−X+X² and D(1)=1, so the odd-valuation vanishing does not extend to even valuation.

Source/derivation: [LiZhangDensity](https://arxiv.org/pdf/1908.01701v3), §3.2 (3.2.0.2), physical p.16. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§3.2 (3.2.0.2), physical p.16`: Hermitian Siegel polynomial functional equation supplies the corresponding staged target or its next declaration.

### Finite integral isometry stabilizers

**theorem; `GN.3/definite-integral-isometry-finite`.** For a full Z-lattice in a positive-definite real Euclidean space, its integral isometry group is finite. For a totally positive number-field quadratic lattice, restriction through all real embeddings gives the corresponding finite stabilizer.

Hypotheses and conventions: Definiteness and full finite generation are essential; indefinite lattices can have infinite isometry groups.

Proof/construction outline: 1. Fix a lattice basis. An isometry sends each basis vector into the finite lattice set on its fixed norm sphere. 2. Inject an isometry into its finite tuple of basis images. 3. For a totally positive number-field form, use the imported embedding and trace-metric comparison to reduce to a real Z-lattice.

Direct prerequisites: `GN.2/integral-genus`, `GN.1/finite-gauge-sublevel`

Mathematical test contracts:

- `definite_integral_isometry_finite_test_1` (characterisation): For (Z,x²) the isometry group is {±1}, so its mass weight is 1/2.
- `definite_integral_isometry_finite_test_2` (characterisation): Positive definiteness cannot be dropped: Pell-type indefinite rank-two lattices have infinite stabilizers.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), Definition 9.7.13; worker proof from finite lattice points, not a claimed source proof of the general mass theorem. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Definition 9.7.13; worker proof from finite lattice points, not a claimed source proof of the general mass theorem`: Finite integral isometry stabilizers supplies the corresponding staged target or its next declaration.

### Finiteness of a positive-definite genus class set

**theorem; `GN.3/definite-genus-class-finite`.** The integral-isometry class set of a fixed positive-definite quadratic genus over Z, and of a fixed totally positive genus over a number ring, is finite.

Hypotheses and conventions: A fixed determinant/discriminant ideal and archimedean signatures belong to the genus data. This is finiteness of classes, not finiteness of all embedded lattices.

Proof/construction outline: 1. Apply the imported reduction-domain theorem to bound representative Gram data within the fixed discriminant genus. 2. Use finite integral coefficient enumeration and identify duplicates by integral isometry. 3. The exact reduction-to-finite-Gram and number-field coefficient-ideal argument remains a named proof gap.

Direct prerequisites: `GN.2/integral-genus`, `AdelicAlgebraicGroups:AA.3`

Mathematical test contracts:

- `definite_genus_class_finite_test_1` (characterisation): Infinitely many embedded coordinate changes can represent one integral-isometry class.
- `definite_genus_class_finite_test_2` (characterisation): The rank-one positive unimodular Z-genus has one class, though its isometry group has two elements.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), Definition 9.7.13 and local-global finite-support lattice conventions, printed pp.141,146. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Definition 9.7.13 and local-global finite-support lattice conventions, printed pp.141,146`: Finiteness of a positive-definite genus class set supplies the corresponding staged target or its next declaration.

### Weighted genus mass

**definition; `GN.3/genus-mass`.** Atlas planet: Genus mass. For a positive-definite genus with its proved finite class set, mass(L)=Σ_[M] 1/|O(M)| as a positive rational number. Proper mass uses proper classes and SO(M) separately; neither is substituted for the other without an index comparison.

Hypotheses and conventions: Finite automorphism groups and a finite class set are supplied before summing. Unweighted class number and mass are different invariants.

Proof/construction outline: 1. Sum reciprocal stabilizer orders on a finite integral-isometry quotient. 2. Use isometry-conjugacy to prove the weight independent of the representative. 3. Keep O and SO versions distinguished by their class sets and stabilizers.

Direct prerequisites: `GN.3/definite-integral-isometry-finite`, `GN.3/definite-genus-class-finite`

API contracts:

- `genusMass` (constructor; native signature elaborated): Finite sum of rational reciprocal integral-isometry stabilizer orders.
- `genusMass_representative` (compatibility; native signature elaborated): The summand is independent of the chosen representative.
- `genusMass_singleton` (simp; native signature elaborated): A singleton class set has mass the reciprocal stabilizer order.
- `genusMass_pos` (relation; native signature elaborated): A nonempty finite positive genus has strictly positive mass.

Mathematical test contracts:

- `genus_mass_test_1` (characterisation): The rank-one positive unimodular genus has ordinary mass 1/2, not class number 1.
- `genus_mass_test_2` (characterisation): For proper rank-one classes the stabilizer is trivial and proper mass is 1.
- `genus_mass_test_3` (characterisation): Changing representatives cannot change the stabilizer cardinality.

Source/derivation: [Voight2026](https://jvoight.github.io/quat-book.pdf), §9.7 genus class set; worker weighted measure interface for GN.3. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§9.7 genus class set; worker weighted measure interface for GN.3`: Weighted genus mass supplies the corresponding staged target or its next declaration.

### Adelic weighted mass identity

**theorem; `GN.3/adelic-mass-identity`.** Atlas planet: Weighted mass formula. Let q be totally positive over a totally real number field, G=SO(q), and K_f the integral stabilizer of a fixed lattice in its finite adelic genus. For compatible product Haar measures with convergent product vol(K_f), proper mass equals vol(G(K)\G(A))/(vol(G(K∞))·vol(K_f)). Every double-coset contribution is the reciprocal order of the proper integral stabilizer.

Hypotheses and conventions: Use proper SO classes and weights consistently. Local measures, archimedean measure and the convergent product are fixed before numerical evaluation. The numerator is not replaced by 2 until a separate Tamagawa-number theorem is supplied; low-rank tori have separate behavior.

Proof/construction outline: 1. Identify proper genus classes with G(K)\G(A_f)/K_f. 2. Decompose the adelic quotient over these finitely many double cosets. 3. Integrate each compact archimedean/stabilizer piece, dividing by its finite rational stabilizer. 4. Sum the contributions and divide by the actual positive local-volume product; the Tamagawa comparison and explicit densities remain precise gaps.

Direct prerequisites: `GN.3/genus-mass`, `AdelicAlgebraicGroups:AA.2`, `AdelicAlgebraicGroups:AA.3`

Mathematical test contracts:

- `adelic_mass_identity_test_1` (characterisation): Rescaling one local Haar measure changes the numerator and local factor compatibly.
- `adelic_mass_identity_test_2` (characterisation): For proper rank-one classes the SO stabilizer is trivial and mass equals class count. A proper class whose stabilizer has order four contributes 1/4; for example SO(Z^2,x^2+y^2) has order four.
- `adelic_mass_identity_test_3` (characterisation): The numerical constant 2 is not an assumption-free formula for SO of rank 1 or 2.

Source/derivation: [Benoist2019](https://www.imo.universite-paris-saclay.fr/~yves.benoist/prepubli/19ArithmeticityLectures.pdf), Quotient/Haar convention on physical pp.5–7; worker adelic genus decomposition, not an attributed proof of a numerical Siegel mass formula. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Quotient/Haar convention on physical pp.5–7; worker adelic genus decomposition, not an attributed proof of a numerical Siegel mass formula`: Adelic weighted mass identity supplies the corresponding staged target or its next declaration.

### Integral lattice theta coefficient interface

**comparison; `GN.3/theta-lattice-coefficient-interface`.** For a positive-definite even integral Z-lattice, the imported convergent theta kernel specializes to the lattice theta series whose coefficient at m is #{x∈L:q(x)=m}, with q(x)=B(x,x)/2. Scalar weight, level and Weil-representation/discriminant conventions are inherited from the theta owner.

Hypotheses and conventions: Do not identify an odd lattice’s half-norm with an integral q-expansion. The supplied analytic theta theorem includes its Schwartz function, Haar normalization and convergence hypotheses.

Proof/construction outline: 1. Specialize the existing Metaplectic theta kernel to the lattice indicator/Gaussian data. 2. Use positive definiteness and finite norm sublevels to identify each coefficient. 3. Prove the metric/discriminant and q-exponent adapter without defining a second theta representation.

Direct prerequisites: `GN.2/integral-quadratic-lattice`, `GN.1/finite-gauge-sublevel`, `MetaplecticAutomorphicForms:MP.5`

Mathematical test contracts:

- `theta_lattice_coefficient_interface_test_1` (characterisation): For an even lattice q=B(x,x)/2 is integer valued.
- `theta_lattice_coefficient_interface_test_2` (characterisation): For an odd rank-one Gram-1 lattice the half-norm is not integral, so its level/exponent conventions require a different specialization.

Source/derivation: [Duke1988](https://www.math.ucla.edu/~wdduke/preprints/hyperbolic.pdf), Introduction theta/Weyl-sum correspondence, printed p.74; worker even-lattice specialization. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Introduction theta/Weyl-sum correspondence, printed p.74; worker even-lattice specialization`: Integral lattice theta coefficient interface supplies the corresponding staged target or its next declaration.

### Mass formula for maximal integral lattices

**theorem; `GN.3/maximal-integral-mass-formula`.** Let K be totally real of degree d≥2, Q a totally positive nondegenerate m-dimensional form, m≥3, and Λ the genus of maximal integral O_K-lattices. With ordinary O-isometry mass, r=floor(m/2), G=SO(Q), 2 mass(Λ)=2 γ_G^d |disc K|^(dim G/2) L(G) ∏_p λ_p(Q). Here dim G=r(2r−(−1)^m); γ_G=∏_(i=1)^r(2i−1)!/(2π)^(r(r+1)) for odd m and (r−1)!∏_(i=1)^(r−1)(2i−1)!/(2π)^(r²) for even m. L(G)=∏_(i=1)^r ζ_K(2i) for odd m; ζ_K(r)∏_(i=1)^(r−1)ζ_K(2i) for even m with square discriminant; otherwise [ζ_E(r)/ζ_K(r)] N(d_E/K)^(r−1/2)∏_(i=1)^(r−1)ζ_K(2i), E=K(√disc Q). The local λ_p are exactly the table in Definition 3.1, not the hermitian normalized density polynomial of GN.3.

Hypotheses and conventions: Maximal integrality is essential. Do not apply this formula to arbitrary lattices or indefinite forms. The leading two multiplies the ordinary O mass; τ(SO)=2 has a separate original-source proof obligation. The finite exceptional product and convergent positive-integer zeta Euler products are required.

Proof/construction outline: 1. Import rational field invariants and local classification from their existing owners. 2. Use the maximal-lattice single-genus result and local-type table. 3. Apply the Shimura/Gan–Hanke–Yu mass theorem with its archimedean and Tamagawa normalizations. 4. Separate the ordinary O mass from the proper SO adelic measure identity; identify every local factor, including dyadic places.

Direct prerequisites: `GN.3/genus-mass`, `GN.3/adelic-mass-identity`, `GN.2/integral-genus`

Mathematical test contracts:

- `maximal_integral_mass_formula_test_1` (characterisation): Class number one implies mass=1/|Aut L|; it is not an unweighted class count.
- `maximal_integral_mass_formula_test_2` (characterisation): The formula is restricted to m≥3; binary zeta-at-one substitution is excluded.
- `maximal_integral_mass_formula_test_3` (characterisation): A dyadic exceptional factor is retained rather than set to one.

Source/derivation: [Kirschmer2013](https://www.math.rwth-aachen.de/~Markus.Kirschmer/papers/maxgen.pdf), pp.3–4, Definition 3.1, Proposition 3.2 and Theorem 3.3. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `pp.3–4, Definition 3.1, Proposition 3.2 and Theorem 3.3`: Mass formula for maximal integral lattices supplies the corresponding staged target or its next declaration.

## GN.4: Homogeneous arithmetic, critical lattices and Gaussian transference

Coverage: **partial**. Finished 300-node planning pass at the protocol budget; source/supplier/implementation closure is not asserted.

The follow-up must establish the following scope before closure:

- Acquire/refine the original Davenport/corrigendum/Rogers, Howe–Moore, Dani–Margulis, Ratner, Oppenheim auxiliary, Duke and Siegel proof inputs. Quantitative time-average nonescape is independent of qualitative measure classification.
- Critical determinant/extremal-lattice and six-page covering Gaussian chains are split. Match bounded-basis compactness and quotient topology, native lattice Poisson/Fourier adapters and coding metric comparisons; acquire original stronger Banaszczyk estimates. Read/decompose the remaining routed intrinsic/weighted counts and homogeneous applications.

### Counting by differences in finite-index cosets

**lemma; `GN.4/coset-difference-bound`.** For an additive commutative group G, finite-index subgroup N, sets S,T⊆G with T finite, suppose x,y∈S and x−y∈N imply x−y∈T. Then S is bounded in cardinality by |S|≤[G:N]·|T|, with both cardinalities the native natural cardinal. No finiteness assumption on S is needed: the proof injects it into a finite set.

Hypotheses and conventions: N has finite index; T is finite. No topology, convexity, lattice, or prior finiteness of S is required.

Proof/construction outline: 1. Let π:G→G/N and R=π(S). For every occupied coset c∈R choose a_c∈S with π(a_c)=c. Empty S gives an empty family, so no global representative in S is demanded. 2. Map x∈S to (π(x),x−a_{π(x)}) in (G/N)×T. QuotientAddGroup.eq_iff_sub_mem and the difference hypothesis establish membership in T. 3. Equality of first coordinates identifies the selected representative; equality of second coordinates then cancels the same representative to give x=y. Nat.card_le_card_of_injective and Nat.card_prod give the bound, using the finite quotient instance and finite T. 4. Nat.card_coe_set_eq identifies set cardinalities. The subgroup index is a genuine finite count here, not its infinite-index zero sentinel.

Direct prerequisites: `mathlib:Subgroup.index`, `mathlib:AddSubgroup.FiniteIndex`, `mathlib:Subgroup.finite_quotient_of_finiteIndex`, `mathlib:QuotientGroup.eq_iff_div_mem`, `mathlib:Nat.card_le_card_of_injective`, `mathlib:Nat.card_prod`, `mathlib:Nat.card_coe_set_eq`

API contracts:

- `ncard_le_index_mul` (relation; native signature elaborated): For an additive commutative group G, finite-index subgroup N, sets S,T⊆G with T finite, suppose x,y∈S and x−y∈N imply x−y∈T. Then S is bounded in cardinality by |S|≤[G:N]·|T|, with both cardinalities the native natural cardinal. No finiteness assumption on S is needed: the proof injects it into a finite set.

Mathematical test contracts:

- `count_empty` (degenerate): The empty subset of Z has natural cardinal zero.
- `count_infinite_index_sentinel` (non-example): For N={0} in Z, N.index=0 but |{0}|=1; finite-index hypotheses are essential.

Acceptance: The empty source has cardinal zero. Finite index cannot be dropped: {0}⊂Z has cardinal one while the index of the zero subgroup of Z is the natural sentinel zero.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), §2, Lemma 2.1 proof, p.4. Worker's additive-group formulation of the source's coset-fiber difference injection, proved with the read native quotient and finite-cardinality APIs; not a newly defined carrier.

Use: `GN.4/henk-sublattice-count`: Each occupied lattice coset injects into the doubled body in the sublattice.

### Henk’s sublattice counting lemma

**theorem; `GN.4/henk-sublattice-count`.** Atlas planet: Henk sublattice counting lemma. Let E be a finite-dimensional real normed space, L a discrete full integral lattice, M≤L a submodule with nonzero finite relative index m=[L:M], and K a symmetric convex body with 0 in its interior. Then |L∩K|≤m·|M∩2K|. Counts include boundary points and the origin. In real inner-product coordinates with canonical volume and full M, the already-built index/covolume formula identifies m=covol(M)/covol(L), exactly as in Henk Lemma 2.1.

Hypotheses and conventions: L is discrete and full; M≤L; M.toAddSubgroup.relIndex(L.toAddSubgroup)≠0. K is compact convex, 0∈interior K, and x∈K implies −x∈K. Dimension zero is allowed.

Proof/construction outline: 1. Work in the additive group L, with N the pullback of M. Its native index is exactly m by AddSubgroup.relIndex; the explicit nonzero-index assumption supplies N.FiniteIndex. 2. Take S={x∈L:x∈K} and T={x∈L:x∈M and x∈2K}. The latter is finite: it lies in the gauge≤2 sublevel of L, since membership in 2K gives gauge≤2 by gauge_le_of_mem; use finite-gauge-sublevel. This argument does not assume an unproved new lattice structure on M. 3. If x,y∈S lie in the same N-coset, x−y∈M. Symmetry puts −y in K; Convex.midpoint_mem puts (x−y)/2 in K, hence x−y∈2K. Apply coset-difference-bound. 4. The subtype inclusions L→E are injective and identify S and T with the two ambient intersections; Set.ncard_image_of_injective transfers the counts. 5. For the source's Euclidean full-sublattice presentation, covolume_div_covolume_eq_relIndex' and positivity of both covolumes supply the nonzero index and its determinant-ratio expression. This is an existing baseline identity, not a new covolume theorem.

Direct prerequisites: `GN.4/coset-difference-bound`, `GN.1/finite-gauge-sublevel`, `mathlib:Subgroup.relIndex`, `mathlib:Set.ncard_image_of_injective`, `mathlib:Convex.midpoint_mem`, `mathlib:ConvexBody.convex`, `mathlib:gauge_le_of_mem`, `mathlib:ZLattice.covolume_div_covolume_eq_relIndex'`, `mathlib:ZLattice.covolume_pos`

API contracts:

- `henk_sublattice_count` (relation; native signature elaborated): Let E be a finite-dimensional real normed space, L a discrete full integral lattice, M≤L a submodule with nonzero finite relative index m=[L:M], and K a symmetric convex body with 0 in its interior. Then |L∩K|≤m·|M∩2K|. Counts include boundary points and the origin. In real inner-product coordinates with canonical volume and full M, the already-built index/covolume formula identifies m=covol(M)/covol(L), exactly as in Henk Lemma 2.1.

Mathematical test contracts:

- `henk_interval_counts` (computation): The set {−1,0,1} has three elements, {−2,0,2} has three elements, and 3≤2·3.
- `count_rank_zero` (degenerate): The singleton consisting of the zero function Fin 0→Z has cardinal one.

Acceptance: For L=Z, M=2Z and K=[−1,1], the two counts are 3 and 3, and the index is 2: 3≤6. For the unique lattice and body in dimension zero the index and both counts are one.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), §2, Lemma 2.1 and its complete proof, p.4. Exact counting inequality in relative-index form; the source determinant ratio is already baseline. The normed-space formulation and explicit finite-index hypothesis are justified by the supplied difference proof.

Use: `Henk2002, p.4 after Lemma 2.1 and pp.4–5 Theorem 1.5`: The count reduces to a sublattice whose intersection with the doubled body is only zero.

### Counting separated points in integral basis residues

**lemma; `GN.4/residue-separation-count`.** Let G be an additive commutative group with an integral basis b indexed by Fin n, let q≥1 be a natural number, and let S⊆G. Suppose x,y∈S and x−y=qz for some z∈G imply x=y. Then |S|≤q^n. The basis is an integral basis of all G, not merely an independent family; n=0 is included.

Hypotheses and conventions: b:Basis(Fin n,Z,G); q is a positive natural number. Separation is modulo qG. No topology or prior finiteness of S is required.

Proof/construction outline: 1. Let N be the existing range of the multiplication-by-q homomorphism on G. The given integral basis supplies native finite/free instances and Module.finrank_eq_card_basis gives finrank(Z,G)=n. 2. Import AddSubgroup.index_range_nsmul: [G:N]=q^n. Since q>0 this is nonzero, hence N.FiniteIndex. The entire quotient-cardinality computation is already built, not a new node. 3. Apply coset-difference-bound with T={0}. If x−y∈N, its range witness gives x−y=qz (natural and integral scalar multiplication agree). Separation forces x=y, hence x−y=0. 4. The singleton has cardinal one, so the imported index identity gives |S|≤q^n. This includes n=0. A separate scratch proof reducing basis coordinates modulo q is an independent verification of this same finite-set wrapper, not a replacement plan for the baseline index theorem.

Direct prerequisites: `GN.4/coset-difference-bound`, `mathlib:AddSubgroup.index_range_nsmul`, `mathlib:Module.finrank_eq_card_basis`

API contracts:

- `ncard_le_pow_of_no_congruent` (relation; native signature elaborated): Let G be an additive commutative group with an integral basis b indexed by Fin n, let q≥1 be a natural number, and let S⊆G. Suppose x,y∈S and x−y=qz for some z∈G imply x=y. Then |S|≤q^n. The basis is an integral basis of all G, not merely an independent family; n=0 is included.

Mathematical test contracts:

- `residue_three_distinct` (computation): The residue images of −1,0,1 in ZMod 3 have cardinal three.
- `residue_collision` (non-example): In ZMod 2 the integers 0 and 2 have equal residue, although they differ in Z.
- `residue_zero_modulus` (non-example): Nat.card(ZMod 0)=0; this does not make ZMod 0 finite.

Acceptance: The three integers −1,0,1 are distinct modulo 3. Modulo 2, 0 and 2 collide: a claimed separation for that pair is false. The positive-modulus condition prevents use of the infinite ZMod 0 sentinel.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), §2, p.4, inequality (1.3) deduction after Lemma 2.1. Finite-set separation wrapper for the source's q^n index step. The exact index is already AddSubgroup.index_range_nsmul and is imported; native quotient and residue carriers are not replanned.

Use: `GN.4/first-minimum-count`: G=L and q=floor(2/λ_0)+1; homothetic avoidance proves separation.

### Excluding nonzero points in a dilated sublattice

**lemma; `GN.4/homothetic-lattice-avoidance`.** For a discrete full integral lattice L in finite-dimensional real normed E, a convex body K with 0 in its interior, d=dim E>0, and q≥1 natural with 2/q<λ_0(L,K), one has (qL)∩2K={0}. Here qL is the pointwise real scalar image of the native lattice set. Symmetry is not needed for this lemma.

Hypotheses and conventions: d>0, q>0, and the threshold is strict: 2/q<λ_0. L is discrete/full and K has zero in its interior.

Proof/construction outline: 1. If v∈qL∩2K, write v=qz with z∈L. If v≠0 then z≠0 since q≠0. 2. From v∈2K divide the scalar equality by q>0 to obtain z∈(2/q)K. Apply successive-minimum-first at the nonnegative radius 2/q to infer λ_0≤2/q, contradicting the strict threshold. 3. Thus only zero remains. Conversely zero lies in L and K, hence in both dilates. The argument uses actual closed-body membership, not a switch from ≤ to < on boundary points.

Direct prerequisites: `GN.1/successive-minimum-first`

API contracts:

- `homothetic_lattice_avoidance` (relation; native signature elaborated): For a discrete full integral lattice L in finite-dimensional real normed E, a convex body K with 0 in its interior, d=dim E>0, and q≥1 natural with 2/q<λ_0(L,K), one has (qL)∩2K={0}. Here qL is the pointwise real scalar image of the native lattice set. Symmetry is not needed for this lemma.

Mathematical test contracts:

- `homothetic_three_avoids` (computation): An integer divisible by 3 with absolute value at most 2 is zero.
- `homothetic_equality_fails` (non-example): 2 is nonzero, divisible by 2, and has absolute value at most 2; also 2/2=1.

Acceptance: For L=Z, K=[−1,1] and q=3, 3Z∩[−2,2]={0}. At q=2, the nonzero points ±2 remain: replacing 2/q<λ_0 by ≤ is invalid.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), §2, p.4, inequality (1.3) deduction after Lemma 2.1. Source's qL avoidance argument, expressed using the already planned closed-dilate first-minimum characterization; symmetry is explicitly unnecessary for this intermediate implication.

Use: `GN.4/first-minimum-count`: Excludes differences of congruent lattice points in a symmetric convex body.

### Lattice-point bound from the first minimum

**theorem; `GN.4/first-minimum-count`.** Atlas planet: First-minimum lattice-point bound. For a discrete full integral lattice L in finite-dimensional real normed E of positive dimension d and a symmetric convex body K with 0 in its interior, |L∩K|≤(floor(2/λ_0(L,K))+1)^d. The floor is the natural floor of the positive real argument; λ_0 is the source's first minimum. Counts include closed boundary points. This is Henk (1.3), not Conjecture 1.4 and not the stronger Theorem 1.5.

Hypotheses and conventions: d>0; L discrete/full; K compact convex symmetric about zero with 0 in its interior.

Proof/construction outline: 1. By successive-minimum-pos, λ_0>0. Put q=floor(2/λ_0)+1. Then q≥1 and Nat.lt_floor_add_one gives 2/λ_0<q; multiplying by positive λ_0 and dividing by positive q yields 2/q<λ_0, including when 2/λ_0 is an integer. 2. Use Module.finBasisOfFinrankEq and ZLattice.rank to choose an integral basis of L indexed by Fin d. This basis is unrelated to the attained real minimum-vector basis, which need not be integral. 3. For x,y∈L∩K with x−y=qz in L, symmetry and Convex.midpoint_mem put x−y∈2K. Its membership in qL and homothetic-lattice-avoidance force x−y=0, hence x=y. 4. Apply residue-separation-count in the group L and transfer its set cardinal through the injective inclusion into E. That wrapper imports Mathlib's exact qG index computation, so the source's q^d step is already baseline. 5. Do not replace floor(2/λ_0)+1 by a ceiling: at integral 2/λ_0 the extra one is necessary for strict avoidance. Positive dimension is required only to form the first-minimum index; the general residue estimate separately covers dimension zero.

Direct prerequisites: `GN.4/residue-separation-count`, `GN.4/homothetic-lattice-avoidance`, `GN.1/successive-minimum-pos`, `mathlib:Module.finBasisOfFinrankEq`, `mathlib:ZLattice.rank`, `mathlib:instModuleFinite_of_discrete_submodule`, `mathlib:instModuleFree_of_discrete_submodule`, `mathlib:Nat.lt_floor_add_one`, `mathlib:Convex.midpoint_mem`, `mathlib:ConvexBody.convex`, `mathlib:Set.ncard_image_of_injective`

API contracts:

- `lattice_count_le_first_minimum` (relation; native signature elaborated): For a discrete full integral lattice L in finite-dimensional real normed E of positive dimension d and a symmetric convex body K with 0 in its interior, |L∩K|≤(floor(2/λ_0(L,K))+1)^d. The floor is the natural floor of the positive real argument; λ_0 is the source's first minimum. Counts include closed boundary points. This is Henk (1.3), not Conjecture 1.4 and not the stronger Theorem 1.5.

Mathematical test contracts:

- `first_min_cube_count` (computation): The product {−1,0,1}×{−1,0,1} has cardinal nine, equal to (floor(2/1)+1)^2.
- `first_min_small_body` (computation): For λ_0=3 the factor floor(2/λ_0)+1 is one.
- `first_min_anisotropic` (non-example): For minima 1/2 and 3, the first-minimum square bound is 25 while the last-minimum substitution gives 1<5.

Acceptance: The unit cube for Z^d has minimum one and 3^d lattice points, so equality is possible and the outer inequality cannot be strict. For K=[−1/3,1/3], λ_0=3 and the bound is one. For K=[−2,2]×[−1/3,1/3], the count is five but the first-minimum bound is twenty-five; substituting the last minimum would wrongly give one.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.2, inequality (1.3); §2 p.4, its complete deduction after Lemma 2.1. Exact first-minimum lattice-point bound. The source floor convention is retained per E9; the finite-set wrapper imports the already-built q^d index.

Use: `GN.4 finite lattice-point counting; Henk2002 (1.3)`: A dimension-explicit non-asymptotic count on existing lattice and body carriers, independent of mass, dynamics, or semialgebraic error terms.

### One step of divisibility-compatible rounding

**lemma; `GN.4/divisible-rounding-step`.** For positive naturals q,m with m<2q, let n=m if q≤m and n=q+m−(q mod m) otherwise. Then q≤n<2q and m divides n.

Hypotheses and conventions: Subtraction is natural. Even when the remainder is zero the second branch advances to the next multiple; no least-multiple claim.

Proof/construction outline: 1. If q≤m the assertion follows from n=m and the given bound. 2. Otherwise write q=m·a+r with 0≤r<m. Then n=m(a+1), so q≤n≤q+m<2q and m divides n. Positivity of m justifies the remainder bound.

Direct prerequisites: No additional supplier beyond the displayed native context.

API contracts:

- `divisible_rounding_step` (relation; native signature elaborated): For positive naturals q,m with m<2q, let n=m if q≤m and n=q+m−(q mod m) otherwise. Then q≤n<2q and m divides n.

Mathematical test contracts:

- `rounding_keep_next` (computation): q=5,m=6 gives n=6.
- `rounding_zero_remainder` (non-example): q=6,m=3 gives n=9, not 6; it still satisfies the strict upper bound.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.4, two-case construction after (2.4). Exact source arithmetic step.

Use: `Henk2002 Theorem 1.5, pp.4–5`: Exact source arithmetic step.

### Backward rounding along a divisibility chain

**lemma; `GN.4/divisible-rounding-chain`.** For any positive antitone q:Fin d→N there exists n with q_i≤n_i, n_i=q_i at the final index, n_i<2q_i at earlier indices, and n_j dividing n_i whenever i≤j.

Hypotheses and conventions: The empty family is allowed. Antitone means q_j≤q_i for i≤j. Positivity of n follows from q_i≤n_i.

Proof/construction outline: 1. Use the empty family at d=0. Otherwise set the final factor equal to the final positive q. 2. Recurse backward: the next factor is below twice its q, including the unchanged final factor. Antitonicity places it below twice the current q. 3. Apply divisible-rounding-step to choose the current factor divisible by the next. Transitivity gives the all-pairs divisibility direction. 4. Keep the final factor unchanged, so there are d−1 rounded positions rather than d.

Direct prerequisites: `GN.4/divisible-rounding-step`

API contracts:

- `exists_divisible_rounding` (relation; native signature elaborated): For any positive antitone q:Fin d→N there exists n with q_i≤n_i, n_i=q_i at the final index, n_i<2q_i at earlier indices, and n_j dividing n_i whenever i≤j.

Mathematical test contracts:

- `rounding_chain_example` (computation): q=(7,5,3) gives n=(12,6,3), with 3|6|12 and both earlier factors strictly below twice q.
- `rounding_empty_product` (degenerate): The empty factor product is one.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.4, (2.4) and backward induction. Source's compatible factor choices with the final factor and empty case explicit.

Use: `Henk2002 Theorem 1.5, pp.4–5`: Source's compatible factor choices with the final factor and empty case explicit.

### Strict product loss from backward rounding

**lemma; `GN.4/divisible-rounding-product`.** For d≥2, positive q, n_i≥q_i, final n_i=q_i and earlier n_i<2q_i imply ∏n_i<2^(d−1)∏q_i.

Hypotheses and conventions: Products are natural. This consequence needs no divisibility assumption.

Proof/construction outline: 1. Separate the final positive factor. The earlier d−1 factors form a nonempty family. 2. Use the native strict product inequality to compare their positive n_i with 2q_i. Multiply by the positive final q and collect the d−1 factors of two. 3. For d=1 the products are equal; strictness must not be exported in that dimension.

Direct prerequisites: `mathlib:Finset.prod_lt_prod`

API contracts:

- `divisible_rounding_product` (relation; native signature elaborated): For d≥2, positive q, n_i≥q_i, final n_i=q_i and earlier n_i<2q_i imply ∏n_i<2^(d−1)∏q_i.

Mathematical test contracts:

- `rounding_strict_product` (computation): 12·6·3=216<2²·7·5·3=420.
- `rounding_rank_one_not_strict` (non-example): For d=1,q=n=3 the strict assertion would be 3<3 and is false.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), pp.4–5, (2.4)–(2.5). Tracks the precise exponent and strict sign.

Use: `Henk2002 Theorem 1.5, pp.4–5`: Tracks the precise exponent and strict sign.

### Coordinate membership in a diagonal sublattice

**lemma; `GN.4/diagonal-span-coordinates`.** For an integral basis b:Fin d→G of an additive commutative group, x∈span_Z{n_i b_i} if and only if each n_i divides the integral coordinate b.repr(x)_i.

Hypotheses and conventions: The n_i are arbitrary naturals, including zero; use the native Submodule.span and integral module structure.

Proof/construction outline: 1. Induct on membership in the span for the forward implication: generator coordinates satisfy divisibility, preserved by zero, addition and integral scaling. 2. For the reverse implication choose quotients z_i with coordinate_i(x)=n_i z_i. Expand x by the native finite basis-coordinate sum and rewrite each term as z_i(n_i b_i). 3. If n_i=0, divisibility requires coordinate_i(x)=0; do not cancel a zero factor.

Direct prerequisites: `mathlib:Module.Basis.sum_repr`

API contracts:

- `mem_diagonal_span_iff` (relation; native signature elaborated): For an integral basis b:Fin d→G of an additive commutative group, x∈span_Z{n_i b_i} if and only if each n_i divides the integral coordinate b.repr(x)_i.

Mathematical test contracts:

- `diagonal_membership_different_factors` (computation): Coordinates (4,6) satisfy divisibility by (2,3), while 3 is not divisible by 2.
- `diagonal_zero_coordinate` (degenerate): Zero divides an integer z exactly when z=0.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), pp.4–5, lattice generated by n_i e_i. Coordinate interface for the source's native diagonal span, not a replacement carrier.

Use: `Henk2002 Theorem 1.5, pp.4–5`: Coordinate interface for the source's native diagonal span, not a replacement carrier.

### Index of a diagonal sublattice

**lemma; `GN.4/diagonal-span-index`.** The native additive index of span_Z{n_i b_i} in the finite free integral module with basis b is ∏n_i.

Hypotheses and conventions: The n_i are arbitrary naturals. A zero factor gives infinite index and the native index sentinel zero; all-positive factors give nonzero finite index. The empty product is one.

Proof/construction outline: 1. Under the native basis coordinate equivalence, the membership theorem identifies this span with the product of the coordinate subgroups n_i Z. 2. Apply the generated additive index-map and product-index theorems, then Int.index_zmultiples at each coordinate. 3. Each natural factor cast to an integer has natural absolute value n_i. The existing formulas also cover zero factors and rank zero. Positivity is checked separately before applying a finite-index count.

Direct prerequisites: `GN.4/diagonal-span-coordinates`, `mathlib:Module.Basis.equivFun`, `mathlib:Subgroup.index_map_equiv`, `mathlib:Subgroup.index_pi`, `mathlib:Int.index_zmultiples`

API contracts:

- `diagonal_span_index` (relation; native signature elaborated): The native additive index of span_Z{n_i b_i} in the finite free integral module with basis b is ∏n_i.

Mathematical test contracts:

- `diagonal_index_two_three` (computation): 2Z×3Z has index six.
- `diagonal_index_zero_factor` (non-example): 2Z×{0} has native natural index zero, not a positive finite cardinality.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.4, determinant ratio of the diagonal sublattice. Specialization of existing index formulas through the diagonal-span coordinate interface.

Use: `Henk2002 Theorem 1.5, pp.4–5`: Specialization of existing index formulas through the diagonal-span coordinate interface.

### Diagonal sublattice avoids the doubled body

**lemma; `GN.4/diagonal-lattice-avoidance`.** Given an integral basis with the strict minimum-flag property, positive n_i with n_j|n_i for i≤j and 2/n_i<λ_i, every point of span_Z{n_i b_i}∩2K is zero.

Hypotheses and conventions: E is a finite-dimensional real normed inner-product space, L a discrete full Z-submodule, and d=dim_R E. Reuse native IsZLattice, Basis and Basis.flag. The minimum index i:Fin d is zero-based; dimension zero has no index. K is a native ConvexBody with zero in its interior. Write λ_i=successiveMin L K i. Symmetry is imposed only on the final counting theorem. The exact flag hypothesis is the conclusion of integral-minimum-flag. Symmetry is unnecessary here.

Proof/construction outline: 1. The ambient diagonal span lies in L. For a nonzero point x choose the largest nonzero integral b-coordinate k; all higher coordinates vanish. 2. Write coordinate_i(x)=n_i z_i. For i≤k, n_k divides n_i, while the higher coordinates are zero. The native basis sum therefore constructs an integral y with x=n_k y. Its k-coordinate is still nonzero. 3. From x∈2K and n_k>0 get y∈(2/n_k)K, whence gauge_K(y)≤2/n_k<λ_k by the existing membership/gauge bound. 4. The flag hypothesis puts y before index k; native flag membership and the integral-to-real coordinate compatibility force its k-coordinate to be zero, contradiction. 5. In dimension zero there is no nonzero coordinate. Body membership remains closed: strictness enters only in the comparison with λ_k.

Direct prerequisites: `GN.4/diagonal-span-coordinates`, `mathlib:Module.Basis.sum_repr`, `mathlib:Module.Basis.mem_flag_iff_repr_eq_zero`, `mathlib:Module.Basis.ofZLatticeBasis_repr_apply`, `mathlib:gauge_le_of_mem`

API contracts:

- `diagonal_lattice_avoidance` (relation; native signature elaborated): Given an integral basis with the strict minimum-flag property, positive n_i with n_j|n_i for i≤j and 2/n_i<λ_i, every point of span_Z{n_i b_i}∩2K is zero.

Mathematical test contracts:

- `diagonal_division_needs_chain` (non-example): No integer equals 2/3; division by the last factor is not integral without the divisibility condition.
- `diagonal_threshold_needs_strict` (non-example): For Z and K=[−1,1], n=2 leaves the point 2 in nZ∩2K at the equality 2/n=λ_0=1.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), p.5, largest nonzero coordinate argument after (2.5). Supplies the source's avoidance argument in the original lattice basis, without a separate normalization carrier.

Use: `Henk2002 Theorem 1.5, pp.4–5`: Supplies the source's avoidance argument in the original lattice basis, without a separate normalization carrier.

### Henk's successive-minima lattice-point bound

**theorem; `GN.4/henk-successive-minima-count`.** Atlas planet: Henk's successive-minima lattice-point bound. For d≥2 and centrally symmetric K, |L∩K|<2^(d−1)∏_{i<d}(floor(2/λ_i)+1). The count includes the origin and all boundary points.

Hypotheses and conventions: E is a finite-dimensional real normed inner-product space, L a discrete full Z-submodule, and d=dim_R E. Reuse native IsZLattice, Basis and Basis.flag. The minimum index i:Fin d is zero-based; dimension zero has no index. K is a native ConvexBody with zero in its interior. Write λ_i=successiveMin L K i. Symmetry is imposed only on the final counting theorem. Floor means the greatest integer at most the input, following the already recorded E9 correction. This is Theorem 1.5, not Conjecture 1.4.

Proof/construction outline: 1. Choose an integral minimum-flag basis. Positivity and monotonicity of λ make q_i=floor(2/λ_i)+1 positive and antitone. 2. Backward rounding produces n_i. Since 2/λ_i<q_i≤n_i, positivity gives 2/n_i<λ_i. 3. Take the native ambient span M of n_i b_i. Its pullback to L has index ∏n_i by diagonal-span-index. The native relative-index definition identifies this with [L:M], nonzero because all factors are positive. 4. Diagonal-lattice-avoidance and membership of zero give M∩2K={0}. The existing Henk sublattice lemma yields |L∩K|≤∏n_i. 5. Apply the strict product bound. Keep the earlier non-strict first-minimum result for d=1. Neither the factor-one conjecture nor sharp upper Minkowski volume inequality is asserted.

Direct prerequisites: `GN.1/integral-minimum-flag`, `GN.1/successive-minimum-pos`, `GN.1/successive-minimum-monotone`, `GN.4/divisible-rounding-chain`, `GN.4/divisible-rounding-product`, `GN.4/diagonal-span-index`, `GN.4/diagonal-lattice-avoidance`, `GN.4/henk-sublattice-count`, `mathlib:Nat.floor_mono`, `mathlib:Nat.lt_floor_add_one`, `mathlib:Subgroup.relIndex`

API contracts:

- `lattice_count_lt_successive_minima` (relation; native signature elaborated): For d≥2 and centrally symmetric K, |L∩K|<2^(d−1)∏_{i<d}(floor(2/λ_i)+1). The count includes the origin and all boundary points.

Mathematical test contracts:

- `henk_cube_strict` (computation): For the standard unit square the nine points satisfy 9<2·3·3=18.
- `henk_anisotropic_strict` (computation): A rectangle with minima (1,3) has three points and gives 3<2·3·1=6; its product factor 3 is below the first-minimum square factor 9.

Source/derivation: [Henk2002](https://arxiv.org/pdf/math/0204158v1), pp.3–5, Theorem 1.5 and (2.1)–(2.5). Assembles the proved source bound from the decomposed flag, rounding, native index and avoidance interfaces.

Use: `Henk2002 Theorem 1.5, pp.4–5`: Assembles the proved source bound from the decomposed flag, rounding, native index and avoidance interfaces.

### Davenport semialgebraic multiset estimate

**theorem; `GN.4/davenport-semialgebraic-count`.** Atlas planet: Davenport lattice-point estimate. For n≥1, a bounded semialgebraic multiset R⊂R^n with maximum multiplicity m, given by at most k polynomial inequalities of degrees≤ell, and an upper or lower triangular unipotent image R′, the multiplicity-weighted integer count differs from vol(R) by at most C(n,m,k,ell)·max(1,max_{1≤d<n}vol_d(proj_d R)). Projections are coordinate projections of the original region R.

Hypotheses and conventions: The n=1 inner projection maximum is empty and the error bound uses 1. The complexity and multiplicity control the uniform constant; boundedness alone is not enough. General linear transformations are not silently treated as the triangular-unipotent variant.

Proof/construction outline: 1. Prove the coordinate-line interval bound for the region and every coordinate projection. 2. Iterate one-dimensional count/length comparisons to reduce to projection volumes. 3. For semialgebraic regions, use the corrected algebraic-cell argument rather than the false claim that every projection is a basic conjunction of polynomial inequalities. 4. The original Davenport proof, 1964 corrigendum and Rogers bounded-cell proof must be acquired and decomposed; only the precise modern statement is read.

Direct prerequisites: `mathlib:ZLattice.covolume`

Mathematical test contracts:

- `davenport_semialgebraic_count_test_1` (characterisation): For an interval [0,N] with N integral, count−length=1.
- `davenport_semialgebraic_count_test_2` (characterisation): Counting a region twice multiplies both volume and point count; ignoring multiset multiplicity is wrong.
- `davenport_semialgebraic_count_test_3` (characterisation): The projection error for a triangular image refers to the original region as in Proposition 2.5.

Source/derivation: [BhargavaShankar2010](https://arxiv.org/pdf/1006.1002v2), Proposition 2.5, physical p.14; Davenport 1951 plus 1964 corrigendum identified separately. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Proposition 2.5, physical p.14; Davenport 1951 plus 1964 corrigendum identified separately`: Davenport semialgebraic multiset estimate supplies the corresponding staged target or its next declaration.

### Howe–Moore matrix-coefficient decay

**theorem; `GN.4/howe-moore-mixing`.** For a connected noncompact almost-simple real Lie group G with finite centre and a strongly continuous unitary representation on a Hilbert space with no nonzero G-invariant vector, every matrix coefficient tends to 0 as g leaves all compact subsets of G.

Hypotheses and conventions: Strong continuity, unitarity, finite centre and almost simplicity are retained. For a semisimple product one must specify escape in every noncompact factor or the appropriate factor-invariant exclusions.

Proof/construction outline: 1. Apply the exact Howe–Moore unitary-representation theorem, keeping its group and invariant-vector hypotheses. 2. For homogeneous quotient applications, construct the unitary action on the zero-mean L² subspace. 3. The full decay proof and the L² continuity/unitarity adapter remain explicit inputs.

Direct prerequisites: `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`, `AdelicAlgebraicGroups:AA.2`

Mathematical test contracts:

- `howe_moore_mixing_test_1` (characterisation): A constant vector in the full L² quotient space has a nondecaying coefficient; remove constants before applying the theorem.
- `howe_moore_mixing_test_2` (characterisation): Escaping only one factor of a product does not justify the unqualified product theorem.

Source/derivation: [Benoist2019](https://www.imo.universite-paris-saclay.fr/~yves.benoist/prepubli/19ArithmeticityLectures.pdf), Fact 3.3, physical p.20. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Fact 3.3, physical p.20`: Howe–Moore matrix-coefficient decay supplies the corresponding staged target or its next declaration.

### Ergodicity of a noncompact subgroup action

**theorem; `GN.4/homogeneous-ergodicity`.** Let G be connected noncompact almost-simple with finite centre, Γ a lattice and μ the invariant probability measure on G/Γ. Every closed noncompact subgroup H acts ergodically on (G/Γ,μ).

Hypotheses and conventions: Finite quotient volume is used to normalize μ; G is almost-simple, not an arbitrary product.

Proof/construction outline: 1. Construct the strongly continuous unitary action on zero-mean L²(G/Γ,μ). 2. If an H-invariant vector existed, its matrix coefficient would stay constant along an H-sequence leaving compact sets. 3. Apply Howe–Moore to force that vector to vanish and use the L² characterization of ergodicity.

Direct prerequisites: `GN.4/howe-moore-mixing`, `AdelicAlgebraicGroups:AA.2`

Mathematical test contracts:

- `homogeneous_ergodicity_test_1` (characterisation): A compact subgroup does not meet the noncompactness hypothesis.
- `homogeneous_ergodicity_test_2` (characterisation): For a semisimple product, a lattice quotient with factor-invariant functions requires an irreducibility/factor version instead.

Source/derivation: [MorrisArithmetic](https://arxiv.org/pdf/math/0106063v6), Moore-ergodicity conventions in the standing setting, §4.10 (not proof-read here); consequence derived from the preceding matrix-coefficient target. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Moore-ergodicity conventions in the standing setting, §4.10 (not proof-read here); consequence derived from the preceding matrix-coefficient target`: Ergodicity of a noncompact subgroup action supplies the corresponding staged target or its next declaration.

### Dani–Margulis recurrence in the lattice space

**theorem; `GN.4/unipotent-nondivergence`.** For d≥2, X=SL_d(R)/SL_d(Z), a one-parameter unipotent subgroup u_t, x∈X and epsilon>0, there exists a compact K⊂X such that for every T>0, Leb{t∈[0,T]:u_t x∈K}/T≥1−epsilon.

Hypotheses and conventions: K depends on x, epsilon and the flow. This is qualitative recurrence; no spectral rate or uniform compact set over all x is asserted.

Proof/construction outline: 1. Use Mahler compactness to describe cusp escape by short lattice vectors. 2. Apply the original Dani–Margulis polynomial/unipotent nondivergence estimate to construct K. 3. The estimate and its finite-interval uniformity are explicit proof acquisition gaps.

Direct prerequisites: `GN.1/minkowski-second-upper`

Mathematical test contracts:

- `unipotent_nondivergence_test_1` (characterisation): A diagonal flow can diverge and cannot replace the unipotent flow.
- `unipotent_nondivergence_test_2` (characterisation): The statement controls every T>0 with a compact set containing the necessary initial trajectory segment.

Source/derivation: [Benoist2019](https://www.imo.universite-paris-saclay.fr/~yves.benoist/prepubli/19ArithmeticityLectures.pdf), Fact 3.4, physical p.20. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Fact 3.4, physical p.20`: Dani–Margulis recurrence in the lattice space supplies the corresponding staged target or its next declaration.

### Ratner orbit-closure theorem

**theorem; `GN.4/ratner-orbit-closure`.** Atlas planet: Ratner orbit closure. For a connected linear semisimple real Lie group G, a lattice Γ, a connected subgroup U generated by one-parameter unipotent subgroups and x=gΓ, the closure of Ux is Lx for a connected closed subgroup L containing U, with L∩gΓg^−1 a lattice in L.

Hypotheses and conventions: The homogeneous orbit has finite invariant volume; the subgroup is generated by unipotent flows. A general diagonal orbit does not satisfy this conclusion.

Proof/construction outline: 1. Apply the original Ratner orbit-closure argument using unipotent recurrence and invariant-measure rigidity. 2. Identify the stabilizer as L∩gΓg^−1 and the orbit with its quotient. 3. The measure-rigidity and linearization proof chain is a recorded substantial gap, separate from Minkowski.

Direct prerequisites: `GN.4/unipotent-nondivergence`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`

Mathematical test contracts:

- `ratner_orbit_closure_test_1` (characterisation): The orbit closure carries a finite L-invariant measure, not just an unspecified closed set.
- `ratner_orbit_closure_test_2` (characterisation): Diagonal-flow fractal orbit closures show why the unipotent-generation hypothesis is retained.

Source/derivation: [MorrisArithmetic](https://arxiv.org/pdf/math/0106063v6), Theorem 20.1.3 and Remarks 20.1.4–20.1.5, printed pp.406–407; connected specialization. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Theorem 20.1.3 and Remarks 20.1.4–20.1.5, printed pp.406–407; connected specialization`: Ratner orbit-closure theorem supplies the corresponding staged target or its next declaration.

### Ratner invariant-measure classification

**theorem; `GN.4/ratner-measure-classification`.** In the preceding homogeneous setting, every ergodic U-invariant probability measure on G/Γ is the unique normalized L-invariant measure on a closed finite-volume orbit Lx for a closed subgroup L containing U.

Hypotheses and conventions: U is connected and generated by one-parameter unipotent subgroups. Probability, invariance and ergodicity are separate hypotheses.

Proof/construction outline: 1. Prove the measure-rigidity theorem with its actual unipotent-flow hypotheses. 2. Identify support and invariant stabilizer, then normalize the homogeneous orbit measure. 3. This is a separate substantial source proof gap; orbit closure alone does not classify invariant measures.

Direct prerequisites: `GN.4/unipotent-nondivergence`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`

Mathematical test contracts:

- `ratner_measure_classification_test_1` (characterisation): A convex combination of different homogeneous orbit measures need not be ergodic.
- `ratner_measure_classification_test_2` (characterisation): Replacing probability by an arbitrary infinite invariant measure is outside the statement.

Source/derivation: [MorrisArithmetic](https://arxiv.org/pdf/math/0106063v6), Theorem 20.3.4, printed p.413. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Theorem 20.3.4, printed p.413`: Ratner invariant-measure classification supplies the corresponding staged target or its next declaration.

### Equidistribution of a unipotent orbit

**theorem; `GN.4/ratner-unipotent-equidistribution`.** For a one-parameter unipotent flow u_t and x∈G/Γ, there is a closed finite-volume homogeneous orbit Lx containing u_t x and a normalized invariant probability μ_L such that T^−1∫_0^T f(u_t x)dt→∫f dμ_L for every continuous compactly supported f.

Hypotheses and conventions: The orbit measure is on the actual orbit closure, not necessarily all of G/Γ. No quantitative rate is inferred.

Proof/construction outline: 1. Use nondivergence to avoid escape of mass in empirical measures. 2. Apply the original unipotent measure-selection/rigidity argument to identify every subsequential limit. 3. Use uniqueness to obtain convergence against compactly supported continuous tests. The selection and linearization inputs are gaps.

Direct prerequisites: `GN.4/unipotent-nondivergence`, `GN.4/ratner-orbit-closure`, `GN.4/ratner-measure-classification`

Mathematical test contracts:

- `ratner_unipotent_equidistribution_test_1` (characterisation): A closed periodic unipotent orbit equidistributes on itself, not on the full quotient.
- `ratner_unipotent_equidistribution_test_2` (characterisation): The limiting measure has mass 1; vague convergence with escaped mass would not satisfy the statement.

Source/derivation: [MorrisArithmetic](https://arxiv.org/pdf/math/0106063v6), Definition 20.3.2 and Theorem 20.3.3, printed pp.412–413. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Definition 20.3.2 and Theorem 20.3.3, printed pp.412–413`: Equidistribution of a unipotent orbit supplies the corresponding staged target or its next declaration.

### Margulis’s theorem on irrational quadratic values

**theorem; `GN.4/oppenheim-values`.** Atlas planet: Oppenheim theorem. For n≥3, a real nondegenerate indefinite quadratic form q on R^n that is not proportional to a form with rational coefficients has q(Z^n) dense in R.

Hypotheses and conventions: Nondegeneracy, indefiniteness, dimension≥3 and irrationality up to scalar are all retained.

Proof/construction outline: 1. For n=3 use G=SL_3(R) and H=SO(q)° generated by unipotents. 2. Use Ratner orbit closure and the H-to-G intermediate subgroup classification. 3. A closed finite-volume H-orbit forces a rational defining form by Borel density, contradicting the scalar-irrationality assumption. 4. The dense orbit then gives dense quadratic values by continuity and q(R³)=R. The intermediate subgroup, rationality and higher-dimensional restriction arguments are precise gaps.

Direct prerequisites: `GN.4/ratner-orbit-closure`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`

Mathematical test contracts:

- `oppenheim_values_test_1` (characterisation): An integral form has discrete values and is excluded.
- `oppenheim_values_test_2` (characterisation): Positive-definite forms do not have values dense in all R.
- `oppenheim_values_test_3` (characterisation): The n=2 form x²−(3+2√2)y² shows why dimension≥3 is required.

Source/derivation: [MorrisArithmetic](https://arxiv.org/pdf/math/0106063v6), Corollary 20.2.5 and three-variable proof, printed pp.410–411. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Corollary 20.2.5 and three-variable proof, printed pp.410–411`: Margulis’s theorem on irrational quadratic values supplies the corresponding staged target or its next declaration.

### Duke spherical lattice-point equidistribution

**theorem; `GN.4/duke-spherical-equidistribution`.** As n→∞ through positive square-free integers n not congruent to 7 modulo 8, the normalized counting measure on {v/√n:v∈Z³,‖v‖²=n} converges to normalized rotation-invariant surface measure on S².

Hypotheses and conventions: The representation set is nonempty on the stated admissible sequence. No effective constant is claimed: the representation-number lower bound is ineffective.

Proof/construction outline: 1. For each positive-degree spherical harmonic, identify its normalized Weyl sum with a coefficient of the corresponding half-integral-weight theta cusp form. 2. Use the exact Iwaniec coefficient estimate and Siegel representation-number lower bound to force that Weyl sum to zero. 3. Approximate continuous functions by spherical harmonics to obtain weak convergence; the analytic estimates and theta/harmonic adapters are explicit inputs.

Direct prerequisites: `GN.3/theta-lattice-coefficient-interface`, `MetaplecticAutomorphicForms:MP.7`

Mathematical test contracts:

- `duke_spherical_equidistribution_test_1` (characterisation): n≡7 mod8 has no three-square representations and is excluded.
- `duke_spherical_equidistribution_test_2` (characterisation): A measure on primitive representations for nonsquare-free n is a different theorem.

Source/derivation: [Duke1988](https://www.math.ucla.edu/~wdduke/preprints/hyperbolic.pdf), Introduction, printed p.74, before Theorem 1. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Introduction, printed p.74, before Theorem 1`: Duke spherical lattice-point equidistribution supplies the corresponding staged target or its next declaration.

### Euclidean lattice packing radius

**definition; `GN.4/packing-radius`.** For a positive-dimensional full Euclidean lattice L, its packing radius is half the attained shortest nonzero norm. In dimension zero set it to zero.

Hypotheses and conventions: Full rank and positive dimension are retained; zero dimension has a separate radius-0 convention.

Proof/construction outline: 1. Reuse the attained first Euclidean minimum in positive dimension. 2. Divide that minimum by two; handle the zero-dimensional convention separately.

Direct prerequisites: `GN.1/successive-minimum-first`, `mathlib:ZLattice.covolume`

API contracts:

- `latticePackingRadius` (constructor; native signature elaborated): Half the attained first Euclidean minimum, zero in rank zero.
- `latticePackingRadius_eq_half` (characterisation; native signature elaborated): In positive rank it is half the first Euclidean minimum.
- `latticePackingRadius_smul` (functoriality; native signature elaborated): Positive scalar multiplication multiplies the packing radius by that scalar.

Mathematical test contracts:

- `packing_radius_test_1` (computation): For aZ in R, a>0, the packing radius is a/2.
- `packing_radius_test_2` (computation): For Z² the packing radius is 1/2.
- `packing_radius_test_3` (computation): In dimension zero the packing radius is zero.

Source/derivation: [Benoist2019](https://www.imo.universite-paris-saclay.fr/~yves.benoist/prepubli/19ArithmeticityLectures.pdf), Physical pp.5–7 quotient/lattice conventions; worker Euclidean packing/covering construction. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Physical pp.5–7 quotient/lattice conventions; worker Euclidean packing/covering construction`: Euclidean lattice packing and covering radii supplies the corresponding staged target or its next declaration.

### Compact star bodies from homogeneous gauges

**definition; `GN.4/compact-star-body`.** A compact star body is specified by a continuous positive homogeneous function p:V→R_{≥0} with p(x)=0 iff x=0, p(t x)=t p(x) for t≥0, and compact unit sublevel K={p≤1}. Convexity is not assumed. Nonzero lattice avoidance and critical determinants use this body, rather than the convex-body API without its hypotheses.

Hypotheses and conventions: Finite-dimensional real V; the compactness/properness condition is explicit. The body contains a neighborhood of zero.

Proof/construction outline: 1. Use an actual continuous homogeneous gauge and its sublevel set. 2. Prove star-shapedness, boundedness and positive radial scaling. 3. State lattice admissibility as no nonzero point in the interior and build critical-determinant problems with their own compactness inputs. 4. Compactness is data of the actual star-body record. ConvexBody.isCompact is used only after constructing the convexComparison under an additional convexity hypothesis.

Direct prerequisites: No additional supplier beyond the displayed native context.

API contracts:

- `CompactStarBody.ofGauge` (constructor; native signature elaborated): The actual continuous definite homogeneous gauge and compact unit sublevel.
- `CompactStarBody.radial` (characterisation; native signature elaborated): Positive radial scaling is governed by p(tx)=t p(x).
- `CompactStarBody.admissible` (data; native signature elaborated): No nonzero lattice point in the interior.
- `CompactStarBody.convexComparison` (compatibility; native signature elaborated): When the unit sublevel is convex, compare to the native ConvexBody.

Mathematical test contracts:

- `compact_star_body_test_1` (characterisation): The Euclidean norm gives a convex star body.
- `compact_star_body_test_2` (characterisation): p(x,y)=(√|x|+√|y|)² gives a compact nonconvex star body: (1,0),(0,1) lie in it but their midpoint does not.
- `compact_star_body_test_3` (characterisation): A gauge vanishing along a nonzero ray fails the stated definiteness/compactness conditions.

Source/derivation: [Benoist2019](https://www.imo.universite-paris-saclay.fr/~yves.benoist/prepubli/19ArithmeticityLectures.pdf), Mahler statement physical p.7 motivates compactness; worker extension for the staged nonconvex star-body target. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Mahler statement physical p.7 motivates compactness; worker extension for the staged nonconvex star-body target`: Compact star bodies from homogeneous gauges supplies the corresponding staged target or its next declaration.

### Polar-body transference lower inequality

**theorem; `GN.4/dual-transference-lower`.** For a full real Euclidean lattice L and symmetric convex body K with nonempty interior, λ_i(K,L)·λ_{n+1−i}(K°,L*)≥1 for 1≤i≤n, where K° is the inner-product polar and L* the pairing-integral dual.

Hypotheses and conventions: Use the same inner-product and intrinsic dimension on both sides. The sharp upper transference and covering bounds require separate source theorems; they are not exported by this elementary lower bound.

Proof/construction outline: 1. Choose attained independent families at the two indicated minima. 2. The two spans have dimensions summing to n+1, so the dual family cannot pair to zero with the entire primal span. 3. A nonzero integral pairing has absolute value at least 1; the polar inequality bounds it above by the product of the two minima.

Direct prerequisites: `GN.1/successive-minimum-witnesses`, `GN.0/covolume-dual`

Mathematical test contracts:

- `dual_transference_lower_test_1` (characterisation): For L=Z^n and K=product_i[-a_i,a_i], a_i>0, the polar is the cross-polytope sum_i a_i|y_i|<=1. The ordered minima of K are sorted reciprocals 1/a_i and those of its polar are sorted a_i, so the oppositely indexed products equal one.
- `dual_transference_lower_test_2` (characterisation): An arbitrary real pairing has no integer ≥1 floor.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), Proposition 1.11 uses the same integral-coefficient norm floor; transference is a separate worker polar-pairing deduction, not an attributed LLL theorem. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Proposition 1.11 uses the same integral-coefficient norm floor; transference is a separate worker polar-pairing deduction, not an attributed LLL theorem`: Polar-body transference lower inequality supplies the corresponding staged target or its next declaration.

### Mahler compactness criterion

**theorem; `GN.4/mahler-compactness`.** For n≥2 and X_n=SL_n(R)/SL_n(Z), the closed set of covolume-one lattices whose shortest nonzero norm is at least epsilon>0 is compact. A subset is relatively compact iff its first minimum is uniformly bounded below away from zero.

Hypotheses and conventions: Covolume normalization and closedness for compactness are explicit. Relative compactness does not require the subset itself to be closed.

Proof/construction outline: 1. Use a reduced-basis bound from successive minima and fixed covolume to obtain uniformly bounded representative bases. 2. Extract a convergent matrix subsequence; determinant 1 prevents rank collapse. 3. The converse follows from continuity and positivity of the shortest-vector function. Source proof-local reduced-basis/quotient-topology adapters remain gaps.

Direct prerequisites: `GN.1/minkowski-second-upper`, `AdelicAlgebraicGroups:AA.3`

Mathematical test contracts:

- `mahler_compactness_test_1` (characterisation): diag(t,t^−1)Z² escapes compact sets as t→∞ because its first minimum tends to 0.
- `mahler_compactness_test_2` (characterisation): A nonclosed subset with a uniform first-minimum bound is relatively compact, but need not be compact.

Source/derivation: [Benoist2019](https://www.imo.universite-paris-saclay.fr/~yves.benoist/prepubli/19ArithmeticityLectures.pdf), Fact 1.5, physical p.7. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Fact 1.5, physical p.7`: Mahler compactness criterion supplies the corresponding staged target or its next declaration.

### Siegel lattice mean-value theorem

**theorem; `GN.4/siegel-mean-value`.** For n≥2, invariant probability μ on X_n=SL_n(R)/SL_n(Z), and integrable f:R^n→R, its lattice transform Σ_{v∈L\{0}}f(v) is integrable on X_n and its μ-integral equals the Lebesgue integral of f. For nonnegative measurable f the Tonelli version permits infinity.

Hypotheses and conventions: Zero vectors are excluded; μ has total mass 1 and lattices have covolume 1. n=1 is excluded. Integrability of the lattice transform is a theorem, not an assumption silently imported from integrability of f.

Proof/construction outline: 1. Unfold the primitive-vector orbit using quotient Haar measures. 2. Determine the primitive normalization constant and sum over integer multiples of primitive vectors. 3. Use Tonelli then positive/negative parts to obtain the stated L¹ result. The Siegel unfolding/constant/integrability proof is an explicit source gap.

Direct prerequisites: `AdelicAlgebraicGroups:AA.2`, `GN.4/mahler-compactness`

Mathematical test contracts:

- `siegel_mean_value_test_1` (characterisation): Including v=0 adds f(0) and changes the formula.
- `siegel_mean_value_test_2` (characterisation): In dimension one the single lattice Z does not give the Lebesgue mean-value formula.

Source/derivation: [Benoist2019](https://www.imo.universite-paris-saclay.fr/~yves.benoist/prepubli/19ArithmeticityLectures.pdf), Physical pp.5–7 invariant lattice-space measure conventions; exact Siegel source remains a recorded acquisition gap. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Physical pp.5–7 invariant lattice-space measure conventions; exact Siegel source remains a recorded acquisition gap`: Siegel lattice mean-value theorem supplies the corresponding staged target or its next declaration.

### Construction A real-lattice comparison

**comparison; `GN.4/construction-a-real-lattice-interface`.** For a linear code C⊂F_p^n, import the completed Construction A lattice and identify its unscaled real realization {x∈Z^n:x mod p∈C} with covolume p^{n−dim C}. The rescaled realization p^−1/2L has covolume p^{n/2−dim C}; unimodularity/integrality/evenness require the supplier’s exact self-duality and parity hypotheses.

Hypotheses and conventions: p is prime and C is linear; no code-distance statement alone supplies integral Gram conditions. Construction A itself is owned by AlgebraicCodingTheory layer 6.

Proof/construction outline: 1. Import the existing code-to-rational-lattice constructor. 2. Use the exact index p^{n−dim C} and native real scalar extension/covolume comparison. 3. Expose the metric and rescaling adapter; do not define another Construction A carrier.

Direct prerequisites: `tauceti:TauCetiRoadmap/AlgebraicCodingTheory#layer-6-construction-a-with-exact-hypotheses`, `mathlib:ZLattice.covolume`

Mathematical test contracts:

- `construction_a_real_lattice_interface_test_1` (characterisation): For the zero code, the unscaled lattice is pZ^n and has covolume p^n.
- `construction_a_real_lattice_interface_test_2` (characterisation): For the whole code it is Z^n with covolume 1.

Source/derivation: [Benoist2019](https://www.imo.universite-paris-saclay.fr/~yves.benoist/prepubli/19ArithmeticityLectures.pdf), Covolume-one lattice convention physical p.6; mathematical constructor is imported from AlgebraicCodingTheory. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Covolume-one lattice convention physical p.6; mathematical constructor is imported from AlgebraicCodingTheory`: Construction A real-lattice comparison supplies the corresponding staged target or its next declaration.

### Euclidean lattice covering radius

**definition; `GN.4/covering-radius`.** For a full Euclidean lattice L, μ(L)=sup_x inf_{v∈L} ‖x−v‖. It is the maximum of the continuous periodic distance-to-L function on the compact quotient; dimension zero gives zero.

Hypotheses and conventions: Finite-dimensional real Euclidean ambient space; L is discrete and spans the ambient space.

Proof/construction outline: 1. Use the native metric distance to the nonempty lattice. 2. Prove periodicity and 1-Lipschitz continuity. 3. Use a compact fundamental domain to obtain boundedness and attainment.

Direct prerequisites: `GN.1/successive-minimum-first`, `mathlib:ZLattice.covolume`, `mathlib:Metric.infEDist`

API contracts:

- `latticeCoveringRadius` (constructor; native signature elaborated): Supremum of the native distance-to-lattice function.
- `latticeCoveringRadius_attained` (relation; native signature elaborated): A point in a compact fundamental domain attains the radius.
- `latticeCoveringRadius_smul` (functoriality; native signature elaborated): Positive scalar multiplication multiplies μ by the same scalar.

Mathematical test contracts:

- `covering_radius_test_1` (characterisation): For aZ in R with a>0, μ=a/2.
- `covering_radius_test_2` (characterisation): For Z², μ=√2/2, larger than its packing radius 1/2.
- `covering_radius_test_3` (degenerate): In dimension zero μ=0; a non-full-rank subgroup in positive dimension can have infinite ambient covering radius.

Source/derivation: [RegevTransference](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf), p.2, Definition 2 and Example 1. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `p.2, Definition 2 and Example 1`: Euclidean lattice covering radius supplies the corresponding staged target or its next declaration.

### Euclidean successive-minima transference

**theorem; `GN.4/dual-transference-upper`.** For a full rank-n Euclidean lattice L, n≥1, and 1≤i≤n, λ_i(L)λ_(n+1−i)(L*)≤n, where L* is defined by integral inner products and both bodies are the Euclidean unit ball.

Hypotheses and conventions: The n constant here is Euclidean; it is not asserted for arbitrary polar convex bodies.

Proof/construction outline: 1. Use the original Gaussian/Fourier transference estimate of Banaszczyk; this proof remains an explicit source gap. 2. Transport its ordered minima and reciprocal-lattice conventions to the native finite index and dual-lattice API.

Direct prerequisites: `GN.4/dual-transference-lower`

Mathematical test contracts:

- `dual_transference_upper_test_1` (characterisation): For aZ in R, the product is one.
- `dual_transference_upper_test_2` (characterisation): For Zⁿ, each product is one and is at most n.
- `dual_transference_upper_test_3` (characterisation): In dimension one every full lattice has paired Euclidean minima product one, attaining the upper bound n=1.

Source/derivation: [RegevTransference](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf), p.1, Theorem 1 and Remark 1, citing Banaszczyk 1993. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `p.1, Theorem 1 and Remark 1, citing Banaszczyk 1993`: Euclidean successive-minima transference supplies the corresponding staged target or its next declaration.

### Lattice Gaussian sum

**definition; `GN.4/lattice-gaussian-sum`.** For s>0 define ρ_s(x)=exp(-π||x||²/s²) and ρ_s(L+u)=Σ_{x∈L}ρ_s(x+u), using the native countable sum of real values.

Proof/construction outline: 1. Use the full lattice’s countability and the separate shell-summability lemma.

Direct prerequisites: No additional supplier beyond the displayed native context.

API contracts:

- `latticeGaussianSum` (constructor; native signature elaborated): The countable Gaussian sum on the lattice subtype.
- `latticeGaussianSum_zeroRank` (simp; native signature elaborated): The sum in rank zero is 1.
- `latticeGaussianSum_translate` (relation; native signature elaborated): Integral shifts preserve the sum.
- `latticeGaussianSum_scale` (compatibility; native signature elaborated): Simultaneous positive scaling of L,u,s preserves the sum.

Mathematical test contracts:

- `lattice_gaussian_sum_test_1` (characterisation): For rank zero the sum is 1.
- `lattice_gaussian_sum_test_2` (characterisation): For L=aZ and s=a the unshifted sum equals that for Z at s=1.
- `lattice_gaussian_sum_test_3` (characterisation): For u∈L the shifted sum equals the unshifted sum.

Source/derivation: [RegevTransference](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf), Lecture 11, Definition 2, p.2 and Poisson identities p.3. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.4/gaussian-lattice-summable`: Uses lattice gaussian sum with the displayed hypotheses and normalization.

### Gaussian lattice summability

**lemma; `GN.4/gaussian-lattice-summable`.** For a full discrete lattice and s>0, the Gaussian and every polynomial-weighted Gaussian are absolutely summable over lattice translates.

Proof/construction outline: 1. Use separation to bound the number in each unit-radius shell polynomially. 2. The exponential squared-norm decay dominates that polynomial.

Direct prerequisites: `GN.4/lattice-gaussian-sum`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [RegevTransference](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf), Lecture 11 p.3, justification required for its Poisson use; worker shell proof. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.4/gaussian-lattice-poisson`: Uses gaussian lattice summability with the displayed hypotheses and normalization.

### Gaussian lattice Poisson adapter

**lemma; `GN.4/gaussian-lattice-poisson`.** ρ_s(L+u)=covol(L)^(-1)s^n Σ_{y∈L*}ρ_(1/s)(y) exp(2πi<y,u>); in particular ρ_s(L)=covol(L)^(-1)s^nρ_(1/s)(L*).

Proof/construction outline: 1. Import the general Fourier/Poisson theorem from its harmonic-analysis owner. 2. Specialize the Gaussian Fourier transform and the dual-lattice annihilator.

Direct prerequisites: `GN.4/gaussian-lattice-summable`, `GN.0/covolume-dual`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [RegevTransference](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf), Lecture 11 p.3, equations preceding Lemma 5. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.4/gaussian-shift-maximum`: Uses gaussian lattice poisson adapter with the displayed hypotheses and normalization. `GN.4/gaussian-scale-upper`: Uses gaussian lattice poisson adapter with the displayed hypotheses and normalization. `GN.4/gaussian-poisson-error`: Uses gaussian lattice poisson adapter with the displayed hypotheses and normalization.

### Shifted Gaussian maximum

**lemma; `GN.4/gaussian-shift-maximum`.** For every translate u, ρ_s(L+u)≤ρ_s(L).

Proof/construction outline: 1. Take absolute values in the absolutely summable dual Fourier expansion. 2. Each phase has modulus one.

Direct prerequisites: `GN.4/gaussian-lattice-poisson`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [RegevTransference](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf), Lecture 11 Lemma 5, p.3. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.4/gaussian-scale-upper`: Uses shifted gaussian maximum with the displayed hypotheses and normalization.

### Gaussian scale upper bound

**lemma; `GN.4/gaussian-scale-upper`.** For s≥1, ρ_s(L+u)≤s^nρ_1(L).

Proof/construction outline: 1. Drop phases and compare ρ_(1/s)≤ρ_1 on the dual lattice. 2. Apply the unshifted Poisson identity at scale 1.

Direct prerequisites: `GN.4/gaussian-shift-maximum`, `GN.4/gaussian-lattice-poisson`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [RegevTransference](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf), Lecture 11 Lemma 6, p.3. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.4/gaussian-shifted-tail`: Uses gaussian scale upper bound with the displayed hypotheses and normalization.

### Shifted Gaussian tail bound

**lemma; `GN.4/gaussian-shifted-tail`.** For n≥1, the sum of ρ_1 over (L+u) outside the open radius-√n ball is at most c^nρ_1(L), where c=2 exp(-3π/4)<1/4.

Proof/construction outline: 1. For ||x||²≥n, ρ_1(x)≤exp(-3πn/4)ρ_2(x). 2. Apply the scale-2 upper bound. The explicit constant strengthens the source’s 2^(-n) bound.

Direct prerequisites: `GN.4/gaussian-scale-upper`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [RegevTransference](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf), Lecture 11 Lemma 7, p.4; worker retains the explicit exponential constant. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.4/gaussian-short-vector-error`: Uses shifted gaussian tail bound with the displayed hypotheses and normalization. `GN.4/gaussian-covering-contradiction`: Uses shifted gaussian tail bound with the displayed hypotheses and normalization.

### Dual Gaussian error bound

**lemma; `GN.4/gaussian-short-vector-error`.** If λ₁(L)>√n, put R=ρ_1(L\{0}). Then R≤c^n/(1-c^n), with c as in the shifted-tail lemma.

Proof/construction outline: 1. Every nonzero vector is in the tail. 2. Write ρ_1(L)=1+R and solve R≤c^n(1+R).

Direct prerequisites: `GN.4/gaussian-shifted-tail`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [RegevTransference](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf), Lecture 11 Corollary 8, pp.4–5; explicit-constant strengthening. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.4/gaussian-covering-contradiction`: Uses dual gaussian error bound with the displayed hypotheses and normalization.

### Poisson approximation error

**lemma; `GN.4/gaussian-poisson-error`.** For every u, |ρ_1(L*+u)-covol(L)|≤covol(L)R, where R=ρ_1(L\{0}).

Proof/construction outline: 1. Separate the zero Fourier term from the other terms. 2. Triangle inequality bounds all nonzero phases by R.

Direct prerequisites: `GN.4/gaussian-lattice-poisson`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [RegevTransference](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf), Lecture 11 Lemma 9, p.5. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.4/gaussian-covering-contradiction`: Uses poisson approximation error with the displayed hypotheses and normalization.

### Gaussian covering contradiction

**lemma; `GN.4/gaussian-covering-contradiction`.** If λ₁(L)>√n, then no translate of L* can avoid the closed √n-ball. The lower estimate 1-R and upper estimate c^n(1+R) contradict each other since c^n<1/3.

Proof/construction outline: 1. A hole of distance >√n forces the entire shifted Gaussian sum into the tail. 2. Substitute the explicit R bound; 1-R-c^n(1+R) is positive when c^n<1/3.

Direct prerequisites: `GN.4/gaussian-short-vector-error`, `GN.4/gaussian-poisson-error`, `GN.4/gaussian-shifted-tail`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [RegevTransference](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf), Lecture 11 Theorem 4, pp.5–6; worker supplies constants valid also for n=1. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.4/covering-dual-transference`: Uses gaussian covering contradiction with the displayed hypotheses and normalization.

### Covering radius and reciprocal shortest vector

**theorem; `GN.4/covering-dual-transference`.** For a full rank-n Euclidean lattice L, n≥1, 1/2≤μ(L)λ_1(L*)≤n. This pass chooses Regev’s weaker uniform upper constant n; it does not claim that the scanned original proof of the sharper n/2 bound has been checked.

Hypotheses and conventions: Full rank, positive dimension and the actual Euclidean reciprocal lattice.

Proof/construction outline: 1. Use the separate Gaussian Poisson, shifted-tail and error lemmas. 2. If λ₁(L)μ(L*)>n, choose a positive scale making both factors exceed √n; dual scaling is reciprocal. 3. The Gaussian covering contradiction rules out the scaled lattice; replace L by L* and use double duality for the displayed convention. 4. Rank zero is the separate μ=0 convention.

Direct prerequisites: `GN.4/covering-radius`, `GN.4/dual-transference-lower`, `GN.4/gaussian-covering-contradiction`

Mathematical test contracts:

- `covering_dual_transference_test_1` (characterisation): For aZ in R the product is 1/2.
- `covering_dual_transference_test_2` (characterisation): For Zⁿ the product is √n/2.
- `covering_dual_transference_test_3` (characterisation): An asymptotic 0.1275+o(1) constant from Aggarwal–Stephens-Davidowitz is not a uniform small-rank constant.

Source/derivation: [RegevTransference](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf), p.2, Claim 3 and Theorem 4. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `p.2, Claim 3 and Theorem 4`: Covering radius and reciprocal shortest vector supplies the corresponding staged target or its next declaration.

### Critical determinant

**definition; `GN.4/critical-determinant`.** For a compact star body K in finite-dimensional Euclidean E (including rank zero), Δ(K) is the infimum of covolumes of full discrete Z-lattices L with K°∩L={0}, equivalently p_K(x)≥1 for all nonzero lattice vectors. A critical lattice attains this infimum.

Proof/construction outline: 1. Form the set of covolumes of admissible full lattices; the following lemmas establish nonemptiness and a positive lower bound.

Direct prerequisites: `GN.4/compact-star-body`

API contracts:

- `criticalDeterminant` (constructor; native signature elaborated): Infimum over admissible full lattices.
- `criticalDeterminant_le_covolume` (relation; native signature elaborated): Δ(K)≤covolume(L) for each admissible full L.
- `criticalDeterminant_mono` (relation; native signature elaborated): Body inclusion K⊂H implies Δ(K)≤Δ(H).
- `criticalDeterminant_smul` (compatibility; native signature elaborated): Δ(aK)=a^n Δ(K), a>0.

Mathematical test contracts:

- `critical_determinant_test_1` (characterisation): For p(x)=|x| on R, Δ=1 and Z is critical.
- `critical_determinant_test_2` (characterisation): For p(x)=|x|/2 on R, Δ=2 and 2Z is critical.
- `critical_determinant_test_3` (characterisation): For the Euclidean rank-zero convention Δ=1, the zero lattice is critical; the positive-dimension positivity proof is not used.

Source/derivation: [Mahler1946](https://carmamaths.org/resources/mahler/docs/090.pdf), §6, Definition 3 and Theorems 6–7, printed pp.158–159. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.4/critical-determinant-positive`: Uses critical determinant with the displayed hypotheses and normalization.

### Interior ball of a star body

**lemma; `GN.4/star-body-interior-ball`.** There is ρ>0 such that the Euclidean open ball B(0,ρ) lies in the strict gauge sublevel p<1.

Proof/construction outline: 1. Continuity at zero and p(0)=0 give a norm neighborhood with p<1.

Direct prerequisites: `GN.4/compact-star-body`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Mahler1946](https://carmamaths.org/resources/mahler/docs/090.pdf), §6, proof of Theorem 6, printed p.158. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.4/critical-determinant-positive`: Uses interior ball of a star body with the displayed hypotheses and normalization. `GN.4/critical-minimizing-sequence`: Uses interior ball of a star body with the displayed hypotheses and normalization.

### Admissible dilation lattice

**lemma; `GN.4/star-body-admissible-dilate`.** There exists an admissible full lattice for every bounded star body: scale an orthonormal Z-basis lattice past a bound for its unit sublevel.

Proof/construction outline: 1. Bound the norm on the compact unit sublevel. 2. Choose a scale greater than that bound; every nonzero lattice vector has norm at least the scale.

Direct prerequisites: `GN.4/compact-star-body`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Mahler1946](https://carmamaths.org/resources/mahler/docs/090.pdf), Worker orthonormal-basis construction from compact boundedness; background Definition 3 and Theorem 6, §6 printed p.158. Own proof adaptation, not an assertion that Mahler Theorem 4 states this particular construction.

Use: `GN.4/critical-minimizing-sequence`: Uses admissible dilation lattice with the displayed hypotheses and normalization.

### Positive critical determinant

**lemma; `GN.4/critical-determinant-positive`.** In positive dimension, Δ(K)>0: every admissible lattice has covolume at least the Minkowski threshold for an interior Euclidean ball.

Proof/construction outline: 1. A smaller covolume forces a nonzero vector in the interior ball. 2. Use positive volume of that ball and take the infimum.

Direct prerequisites: `GN.4/critical-determinant`, `GN.4/star-body-interior-ball`, `GN.1/minkowski-first-native-interface`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Mahler1946](https://carmamaths.org/resources/mahler/docs/090.pdf), §6, Theorem 6, printed p.158. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.4/critical-minimizing-sequence`: Uses positive critical determinant with the displayed hypotheses and normalization.

### Critical minimizing sequence

**lemma; `GN.4/critical-minimizing-sequence`.** There is a sequence of admissible lattices whose covolumes converge to Δ(K), bounded above by a fixed positive number and with every shortest nonzero vector at least ρ.

Proof/construction outline: 1. Use the infimum approximation property with error 1/(m+1). 2. Interior-ball avoidance supplies the uniform short-vector bound.

Direct prerequisites: `GN.4/critical-determinant-positive`, `GN.4/star-body-admissible-dilate`, `GN.4/star-body-interior-ball`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Mahler1946](https://carmamaths.org/resources/mahler/docs/090.pdf), §7, proof of Theorem 8, printed pp.158–159. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.4/critical-lattice-exists`: Uses critical minimizing sequence with the displayed hypotheses and normalization.

### Closed admissibility under basis convergence

**lemma; `GN.4/star-admissibility-closed`.** If bases b_m converge to an independent basis b and their integer spans are K-admissible, then the integer span of b is admissible.

Proof/construction outline: 1. Fix a nonzero integer coefficient tuple. Independence makes its limit vector nonzero. 2. Gauge continuity and p(∑z_i b_mi)≥1 give the same inequality in the limit.

Direct prerequisites: `GN.4/compact-star-body`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Mahler1946](https://carmamaths.org/resources/mahler/docs/090.pdf), §7, proof of Theorem 8, printed p.159; asymmetric gauge extension uses the same argument. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.4/critical-lattice-exists`: Uses closed admissibility under basis convergence with the displayed hypotheses and normalization.

### Critical lattice existence

**theorem; `GN.4/critical-lattice-exists`.** Every compact star body in finite-dimensional Euclidean space has a critical full lattice. Mahler states the symmetric star-body theorem; the same bounded-basis, gauge-continuity argument proves this packet’s positively homogeneous asymmetric extension.

Proof/construction outline: 1. Use the bounded-determinant and shortest-vector bounds to extract convergent independent bases by the imported Mahler selection theorem. 2. Determinant continuity gives covolume Δ(K); closed admissibility gives the required lattice. 3. Rank zero uses the unique lattice and covolume 1.

Direct prerequisites: `GN.4/critical-minimizing-sequence`, `GN.4/mahler-compactness`, `GN.4/star-admissibility-closed`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Mahler1946](https://carmamaths.org/resources/mahler/docs/090.pdf), §7, Theorem 8 and its complete proof, printed pp.158–159. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.4`: Exports critical lattice existence to the staged target; source or supplier gaps remain explicit.

## GN.5: Certified exact LLL, termination and approximation

Coverage: **planned**. Finished 300-node planning pass at the protocol budget; source/supplier/implementation closure is not asserted.

The follow-up must establish the following scope before closure:

- Nearest-integer/shear/swap/Gram-prefix/potential/prefix-invariant/lexicographic termination and approximation targets are separate planning nodes; reconcile the full-row-reduction native variant with Algorithm (1.15) and prove its transition invariant.
- No polynomial bit-complexity endpoint is supplied: Proposition 1.26 beyond the selected source boundary is unacquired. Read the two routed arithmetic reduction uses and verify they require only the exported certificate/factor, leaving arithmetic exclusion to EffectiveDiophantineGeometry.

### Gram–Schmidt reduction coefficients

**definition; `GN.5/lll-coefficient`.** For a real inner-product space and a family b:Fin n→V, set μ_{ij}=⟨b_i,b*_j⟩/‖b*_j‖² using the native ordered gramSchmidt b. Reduced-basis theorems require linear independence so denominators for relevant j are nonzero; the total function still uses the native zero-division convention.

Hypotheses and conventions: Indices are zero based; size reduction concerns j<i only. Exact rational Gram data is retained for certified arithmetic; floating approximations do not discharge inequalities.

Proof/construction outline: 1. Call the pinned Gram–Schmidt construction directly. 2. Define the scalar coefficient by the displayed inner-product ratio, consistent with its real-valued convention. 3. Use gramSchmidt_ne_zero to justify denominators for independent input.

Direct prerequisites: `mathlib:InnerProductSpace.gramSchmidt`, `mathlib:InnerProductSpace.gramSchmidt_ne_zero`

API contracts:

- `lllCoefficient` (constructor; native signature elaborated): The native Gram–Schmidt inner-product ratio.
- `lllCoefficient_eq` (simp; native signature elaborated): Evaluation equals the stated ratio.
- `lllCoefficient_orthogonal` (relation; native signature elaborated): Off-diagonal coefficient is zero for an orthogonal family.
- `lllCoefficient_denominator_pos` (relation; native signature elaborated): Independent input gives a strictly positive squared denominator.

Mathematical test contracts:

- `lll_coefficient_test_1` (characterisation): For b=((1,0),(1/2,1)) the coefficient μ₁₀ is 1/2.
- `lll_coefficient_test_2` (characterisation): For an orthogonal family, off-diagonal reduction coefficients vanish.
- `lll_coefficient_test_3` (characterisation): For dependent input b*_j can be zero; the total coefficient does not certify a reduced basis.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, (1.2)–(1.3), physical p.2. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§1, (1.2)–(1.3), physical p.2`: Gram–Schmidt reduction coefficients supplies the corresponding staged target or its next declaration.

### LLL-reduced independent families

**definition; `GN.5/lll-reduced`.** Atlas planet: LLL reduction. An LLL-reduced family at δ=3/4 is linearly independent, has |μ_{ij}|≤1/2 for j<i, and for each adjacent j<i with i=j+1 satisfies ‖b*_i‖²≥(3/4−μ_{ij}²)‖b*_j‖². A basis of the input lattice is required separately by output certificates.

Hypotheses and conventions: The equality boundary is accepted; swaps occur for strict failure. The empty family is reduced by vacuity; positive-rank approximation statements assume n≥1.

Proof/construction outline: 1. Package the actual linear-independence, size and adjacent Lovász conditions as a concrete predicate. 2. Use orthogonality of adjacent Gram–Schmidt vectors to compare with the source norm inequality (1.5). 3. Expose each component without weakening independence or omitting the Lovász test.

Direct prerequisites: `GN.5/lll-coefficient`

API contracts:

- `IsLLLReduced` (constructor; native signature elaborated): The concrete independence, size and Lovász predicate.
- `IsLLLReduced.linearIndependent` (projection; native signature elaborated): Return independence.
- `IsLLLReduced.size` (projection; native signature elaborated): Return |μ_{ij}|≤1/2 for j<i.
- `IsLLLReduced.lovasz` (projection; native signature elaborated): Return the adjacent δ=3/4 inequality.

Mathematical test contracts:

- `lll_reduced_test_1` (characterisation): The standard orthonormal basis is reduced.
- `lll_reduced_test_2` (characterisation): The basis ((2,0),(0,1)) has size coefficients zero but fails the Lovász condition.
- `lll_reduced_test_3` (characterisation): The dependent family ((1,0),(2,0)) is not reduced even when a zero-denominator convention makes some inequalities vacuous.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, (1.4)–(1.5), physical pp.2–3. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§1, (1.4)–(1.5), physical pp.2–3`: LLL-reduced independent families supplies the corresponding staged target or its next declaration.

### Exact integer change-of-basis certificates

**definition; `GN.5/unimodular-basis-certificate`.** Atlas planet: Exact lattice basis certificates. A certificate for input b and output c consists of U,V∈Mat_n(Z), UV=VU=I, and c_i=Σ_j U_{ji}b_j. Columns are output coordinates in the input family. This proves equality of integer spans and determinant ±1; determinant −1 is allowed.

Hypotheses and conventions: Input and output families have the same dimension; an input real basis gives an output basis. The certificate matrices are integral, not arbitrary rational or real inverses.

Proof/construction outline: 1. Store the two integer matrices and exact inverse equations with the coordinate identity. 2. Use the reverse matrix to express every b_j in the output span. 3. Use det_mul for the determinant-unit conclusion; real injectivity and rank pass through the inverse maps.

Direct prerequisites: `mathlib:Matrix.det_mul`

API contracts:

- `UnimodularBasisCertificate.ofMatrices` (constructor; native signature elaborated): Supply actual integral inverse matrices and the exact output coordinates.
- `UnimodularBasisCertificate.span_eq` (relation; native signature elaborated): The input and output Z-spans are equal.
- `UnimodularBasisCertificate.det_unit` (relation; native signature elaborated): det U is 1 or −1.
- `UnimodularBasisCertificate.trans` (functoriality; native signature elaborated): Compose certificates by matrix multiplication with the correct column order.

Mathematical test contracts:

- `unimodular_basis_certificate_test_1` (characterisation): The coordinate swap [[0,1],[1,0]] has determinant −1 and is a valid certificate.
- `unimodular_basis_certificate_test_2` (characterisation): diag(2,1) is not an integer-invertible basis change.
- `unimodular_basis_certificate_test_3` (characterisation): A floating matrix approximately inverting U does not inhabit this certificate.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), Algorithm (1.15), size reductions and adjacent swaps, physical pp.5–7; certificate format is a worker verification interface. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Algorithm (1.15), size reductions and adjacent swaps, physical pp.5–7; certificate format is a worker verification interface`: Exact integer change-of-basis certificates supplies the corresponding staged target or its next declaration.

### Growth bound for reduced orthogonal lengths

**lemma; `GN.5/lll-gram-schmidt-growth`.** For an LLL-reduced family and j<i, ‖b*_j‖²≤2^{i−j}‖b*_i‖².

Hypotheses and conventions: Fin-index differences are ordinary nonnegative integer differences.

Proof/construction outline: 1. Size reduction gives μ²≤1/4; substitute into Lovász to get ‖b*_{k+1}‖²≥(1/2)‖b*_k‖². 2. Iterate this nonnegative adjacent inequality along the finite interval.

Direct prerequisites: `GN.5/lll-reduced`

Mathematical test contracts:

- `lll_gram_schmidt_growth_test_1` (characterisation): For orthonormal input the right-hand side is at least the left-hand side.
- `lll_gram_schmidt_growth_test_2` (characterisation): The exponent is an index difference, not the full ambient dimension.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), Proof of Proposition 1.6, physical p.3. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Proof of Proposition 1.6, physical p.3`: Growth bound for reduced orthogonal lengths supplies the corresponding staged target or its next declaration.

### LLL shortest-vector approximation bound

**theorem; `GN.5/lll-short-vector-factor`.** Atlas planet: LLL short-vector bound. For n≥1 and an LLL-reduced basis b of a full real Euclidean Z-lattice L, every nonzero x∈L satisfies ‖b₀‖²≤2^{n−1}‖x‖². Equivalently b₀ is within factor 2^{(n−1)/2} of the shortest nonzero vector.

Hypotheses and conventions: L-membership is in the exact integer span of b, not the real span. This is an approximation bound; it does not assert exact SVP or CVP.

Proof/construction outline: 1. Expand x with integer coordinates and choose its largest nonzero coordinate index k. Its absolute coefficient is at least one. 2. Project to b*_k to obtain ‖x‖²≥‖b*_k‖². 3. Apply the reduced orthogonal-length growth bound from k to the first vector and enlarge 2^k to 2^{n−1}.

Direct prerequisites: `GN.5/lll-reduced`, `GN.5/lll-gram-schmidt-growth`

Mathematical test contracts:

- `lll_short_vector_factor_test_1` (characterisation): For n=1 the factor is 1 and the basis vector is shortest.
- `lll_short_vector_factor_test_2` (characterisation): Replacing integer coordinates by real coefficients destroys the lower bound on the last nonzero coefficient.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), Proposition 1.11 and its proof, physical p.4. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Proposition 1.11 and its proof, physical p.4`: LLL shortest-vector approximation bound supplies the corresponding staged target or its next declaration.

### Integer Gram-prefix potential

**definition; `GN.5/lll-integer-potential`.** For independent integer-column input in Euclidean R^n, let d_i be the determinant of the Gram matrix of the first i vectors, d₀=1, and D=∏_{1≤i<n} d_i. Each d_i is a positive integer; in ranks 0 and 1 the empty potential is 1.

Hypotheses and conventions: The metric is the standard integral Gram metric, or a specified positive-definite rational Gram metric cleared by a common denominator. For arbitrary real Gram data integrality of the potential is not claimed.

Proof/construction outline: 1. Use the native Gram matrix and determinant on each prefix. 2. Gram nondegeneracy makes each determinant positive; integral input gives an integer determinant. 3. Form the finite product and expose the size-reduction/swap transformation laws.

Direct prerequisites: `mathlib:Matrix.gram`, `mathlib:Matrix.det_mul`

API contracts:

- `lllIntegerPotential` (constructor; native signature elaborated): Product of positive integral Gram-prefix determinants.
- `lllIntegerPotential_pos` (relation; native signature elaborated): The potential is a positive integer for independent integral input.
- `lllIntegerPotential_sizeReduce` (compatibility; native signature elaborated): An integer shear within the relevant prefix preserves the potential.
- `lllIntegerPotential_swap` (relation; native signature elaborated): A strict Lovász-failing adjacent swap decreases the potential by a factor strictly below 3/4.

Mathematical test contracts:

- `lll_integer_potential_test_1` (characterisation): The standard basis has all prefix determinants and potential equal to 1.
- `lll_integer_potential_test_2` (characterisation): A rational metric with denominator 2 needs a fixed rescaling; its original determinants are not asserted to be integers.
- `lll_integer_potential_test_3` (characterisation): In ranks 0 and 1 the empty potential is 1, and no adjacent swap exists.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), (1.23)–(1.25), physical pp.7–8. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `(1.23)–(1.25), physical pp.7–8`: Integer Gram-prefix potential supplies the corresponding staged target or its next declaration.

### Nearest integer residual

**lemma; `GN.5/lll-nearest-integer`.** For t∈R put r=floor(t+1/2). Then -1/2≤t-r<1/2; in particular |t-r|≤1/2. This fixes ties deterministically.

Proof/construction outline: 1. Use floor(t+1/2)≤t+1/2<floor(t+1/2)+1.

Direct prerequisites: No additional supplier beyond the displayed native context.

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, algorithm (1.15), size reduction on printed pp.31–33; tie choice is the worker convention. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.5/lll-exact-reduction`: Uses nearest integer residual with the displayed hypotheses and normalization. `GN.5/lll-descending-size-reduction`: Uses nearest integer residual with the displayed hypotheses and normalization.

### Integral shear certificate

**lemma; `GN.5/lll-shear-certificate`.** Replacing b_i by b_i-r b_j, j<i and r∈Z, has integral inverse replacing that column by b_i+r b_j; the two coordinate matrices multiply to the identity.

Proof/construction outline: 1. Use I-r E_ji and I+r E_ji; E_ji squared is zero when j≠i. 2. Check the column action, including r=0.

Direct prerequisites: `GN.5/unimodular-basis-certificate`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34). Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.5/lll-exact-reduction`: Uses integral shear certificate with the displayed hypotheses and normalization. `GN.5/lll-shear-gram-schmidt`: Uses integral shear certificate with the displayed hypotheses and normalization.

### Shear preserves orthogonalized vectors

**lemma; `GN.5/lll-shear-gram-schmidt`.** For independent b and j<i, subtracting an integral multiple r b_j from b_i preserves every Gram–Schmidt vector.

Proof/construction outline: 1. For prefixes before i nothing changes. 2. At i the subtracted vector lies in the previous span, so its orthogonal projection vanishes. 3. For subsequent indices the prefix spans and their orthogonal projections agree.

Direct prerequisites: `GN.5/lll-coefficient`, `GN.5/lll-shear-certificate`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34). Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.5/lll-shear-coefficients`: Uses shear preserves orthogonalized vectors with the displayed hypotheses and normalization. `GN.5/lll-prefix-shear-invariant`: Uses shear preserves orthogonalized vectors with the displayed hypotheses and normalization.

### Shear coefficient update

**lemma; `GN.5/lll-shear-coefficients`.** For c_i=b_i-r b_j and c_k=b_k otherwise, μ(c)_ij=μ(b)_ij-r; for ℓ<j, μ(c)_iℓ=μ(b)_iℓ-r μ(b)_jℓ; coefficients in every other row, and in row i at j<ℓ<i, agree.

Proof/construction outline: 1. Take inner products with the unchanged orthogonalized vectors. 2. Use b_j expansion and orthogonality.

Direct prerequisites: `GN.5/lll-shear-gram-schmidt`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34). Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.5/lll-descending-size-reduction`: Uses shear coefficient update with the displayed hypotheses and normalization.

### Descending size reduction

**lemma; `GN.5/lll-descending-size-reduction`.** Process j=i-1,...,0 using the nearest-integer shear. Already bounded coefficients with index greater than j stay bounded; the final row i satisfies all |μ_ij|≤1/2.

Proof/construction outline: 1. Induct downward on the finite ordered prefix. 2. Changes affect only coefficients at indices ≤j.

Direct prerequisites: `GN.5/lll-nearest-integer`, `GN.5/lll-shear-coefficients`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34). Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.5/lll-exact-reduction`: Uses descending size reduction with the displayed hypotheses and normalization. `GN.5/lll-prefix-invariant`: Uses descending size reduction with the displayed hypotheses and normalization.

### Adjacent swap certificate

**lemma; `GN.5/lll-swap-certificate`.** Swapping adjacent columns i,j=i+1 gives an integral involutive coordinate matrix and hence a unimodular certificate.

Proof/construction outline: 1. Use the permutation matrix for the transposition and its inverse itself.

Direct prerequisites: `GN.5/unimodular-basis-certificate`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34). Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.5/lll-exact-reduction`: Uses adjacent swap certificate with the displayed hypotheses and normalization. `GN.5/lll-swap-first-vector`: Uses adjacent swap certificate with the displayed hypotheses and normalization.

### First swapped orthogonal vector

**lemma; `GN.5/lll-swap-first-vector`.** Write u=b*_i, v=b*_j, a=μ_ji, B=||u||²,C=||v||²,T=C+a²B. For the adjacent swap c, c*_i=v+a u and ||c*_i||²=T>0.

Proof/construction outline: 1. Project b_j off the common prefix before i. 2. Orthogonality gives the squared norm identity.

Direct prerequisites: `GN.5/lll-coefficient`, `GN.5/lll-swap-certificate`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, (1.22), printed p.32. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.5/lll-swap-second-vector`: Uses first swapped orthogonal vector with the displayed hypotheses and normalization. `GN.5/lll-prefix-swap-ratio`: Uses first swapped orthogonal vector with the displayed hypotheses and normalization.

### Second swapped orthogonal vector

**lemma; `GN.5/lll-swap-second-vector`.** In the same notation c*_j=(C/T)u-(a B/T)v, ||c*_j||²=BC/T, and μ(c)_ji=a B/T; T is positive.

Proof/construction outline: 1. Project u off v+a u. 2. Expand the squared norm with <u,v>=0.

Direct prerequisites: `GN.5/lll-swap-first-vector`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, (1.22), printed p.32. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.5/lll-swap-later-coefficients`: Uses second swapped orthogonal vector with the displayed hypotheses and normalization. `GN.5/lll-prefix-swap-ratio`: Uses second swapped orthogonal vector with the displayed hypotheses and normalization.

### Later swapped coefficients

**lemma; `GN.5/lll-swap-later-coefficients`.** For k>j, μ(c)_kj=μ(b)_ki-a μ(b)_kj and μ(c)_ki=μ(b)_kj+(aB/T)μ(c)_kj. Orthogonalized vectors outside i,j are unchanged; earlier coefficients of rows i,j are interchanged.

Proof/construction outline: 1. Express u,v in the new orthogonal basis and compare coefficients. 2. Prefix spans after j agree.

Direct prerequisites: `GN.5/lll-swap-second-vector`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, (1.22), printed p.32. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.5/lll-prefix-invariant`: Uses later swapped coefficients with the displayed hypotheses and normalization.

### LLL prefix invariant

**lemma; `GN.5/lll-prefix-invariant`.** At outer index 1≤k≤n, all pairs in the prefix b_0,...,b_(k-1) satisfy size and Lovász inequalities. A swap at k after reducing μ_k,k-1 preserves this invariant at max(1,k-1); a successful descending reduction extends it to k+1.

Proof/construction outline: 1. After a swap retain only the shorter untouched prefix. 2. On success, earlier shears preserve all orthogonalized vectors, so the tested adjacent inequality persists.

Direct prerequisites: `GN.5/lll-descending-size-reduction`, `GN.5/lll-swap-later-coefficients`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, (1.16)–(1.21), printed pp.31–33. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.5/lll-exact-reduction`: Uses lll prefix invariant with the displayed hypotheses and normalization. `GN.5/lll-lexicographic-termination`: Uses lll prefix invariant with the displayed hypotheses and normalization.

### Prefix Gram product

**lemma; `GN.5/lll-prefix-gram-product`.** For independent b and 0≤k≤n, d_k=det Gram(b_0,...,b_(k-1))=∏_{i<k}||b*_i||²>0, including d_0=1.

Proof/construction outline: 1. Use the unit triangular change from original vectors to orthogonalized vectors. 2. Apply determinant multiplicativity and diagonal Gram determinant.

Direct prerequisites: `GN.5/lll-coefficient`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, (1.24)–(1.25), printed p.33. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.5/lll-prefix-gram-integral`: Uses prefix gram product with the displayed hypotheses and normalization. `GN.5/lll-prefix-shear-invariant`: Uses prefix gram product with the displayed hypotheses and normalization. `GN.5/lll-prefix-swap-ratio`: Uses prefix gram product with the displayed hypotheses and normalization.

### Swap prefix determinant ratio

**lemma; `GN.5/lll-prefix-swap-ratio`.** For j=i+1 only d_j changes under the adjacent swap, and its ratio is T/B. Thus D(c)=(T/B)D(b).

Proof/construction outline: 1. Prefixes before i and after j have unchanged determinants. 2. The prefix of length j replaces B by T.

Direct prerequisites: `GN.5/lll-swap-first-vector`, `GN.5/lll-swap-second-vector`, `GN.5/lll-prefix-gram-product`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34). Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.5/lll-strict-potential-decrease`: Uses swap prefix determinant ratio with the displayed hypotheses and normalization.

### Integral positive prefix determinants

**lemma; `GN.5/lll-prefix-gram-integral`.** If every original Gram entry is integral, each d_k is a positive integer. Integral shears and swaps preserve integral Gram entries.

Proof/construction outline: 1. The determinant of the integer Gram matrix is an integer. 2. Positive real determinant rules out zero or a negative integer. 3. Gram transforms by Uᵀ G U.

Direct prerequisites: `GN.5/lll-prefix-gram-product`, `GN.5/unimodular-basis-certificate`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, (1.23)–(1.25), printed pp.33–34; integral-Gram extension of the coordinate-integer source setting. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.5/lll-strict-potential-decrease`: Uses integral positive prefix determinants with the displayed hypotheses and normalization.

### Strict LLL potential decrease

**lemma; `GN.5/lll-strict-potential-decrease`.** If C<(3/4-a²)B then 0<T/B<3/4 and 4D(c)<3D(b). For integral Gram data D is a positive integer, so D(c)<D(b).

Proof/construction outline: 1. Add a²B to the strict Lovász failure. 2. Multiply by positive D/B.

Direct prerequisites: `GN.5/lll-prefix-swap-ratio`, `GN.5/lll-prefix-gram-integral`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34). Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.5/lll-lexicographic-termination`: Uses strict lll potential decrease with the displayed hypotheses and normalization.

### Shear prefix determinant invariance

**lemma; `GN.5/lll-prefix-shear-invariant`.** For j<i, replacing b_i by b_i-r b_j preserves every d_k and therefore D=∏_{k=0}^{n-1}d_k.

Proof/construction outline: 1. Use unchanged orthogonalized norms in each prefix.

Direct prerequisites: `GN.5/lll-shear-gram-schmidt`, `GN.5/lll-prefix-gram-product`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, (1.15)–(1.25), physical pp.5–8 (reprint folios 31–34). Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.5/lll-lexicographic-termination`: Uses shear prefix determinant invariance with the displayed hypotheses and normalization.

### LLL lexicographic termination

**lemma; `GN.5/lll-lexicographic-termination`.** Outer transitions for n≥2 strictly decrease the lexicographic pair (D,n-k): swaps decrease D; successful passes increase k at fixed D. The finite descending shear loop terminates separately. The rank-zero and rank-one algorithms terminate immediately.

Proof/construction outline: 1. Use well-founded lexicographic order on N×N. 2. The original source also obtains finiteness from a positive discrete lower bound; integral Gram gives D≥1.

Direct prerequisites: `GN.5/lll-strict-potential-decrease`, `GN.5/lll-prefix-shear-invariant`, `GN.5/lll-prefix-invariant`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), §1, termination argument (1.23)–(1.25), printed pp.33–34; worker lexicographic formulation. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.5/lll-exact-reduction`: Uses lll lexicographic termination with the displayed hypotheses and normalization.

### Exact terminating LLL reduction

**construction; `GN.5/lll-exact-reduction`.** Atlas planet: Certified LLL algorithm. Given a nonsingular integer basis matrix (or rational input cleared by a common denominator) in the standard Euclidean metric, compute a reduced output basis together with an exact unimodular-basis certificate. Use nearest-integer size reduction and strict Lovász-failing adjacent swaps at δ=3/4.

Hypotheses and conventions: Rank 0 and rank 1 return immediately with the identity certificate. Rounding ties use a fixed nearest-integer rule satisfying distance≤1/2. The polynomial complexity theorem is not supplied here; its proof continues beyond the selected p.8 source slice.

Proof/construction outline: 1. Run Algorithm (1.15) using the deterministic nearest-integer convention and exact Gram coefficients. 2. Compose the shear/swap certificates at every transition. 3. Apply the separate prefix invariant and lexicographic termination lemmas; at k=n every pair is reduced. 4. Handle empty and singleton inputs before the outer loop. No bit complexity assertion is exported.

Direct prerequisites: `GN.5/lll-reduced`, `GN.5/unimodular-basis-certificate`, `GN.5/lll-integer-potential`, `GN.5/lll-nearest-integer`, `GN.5/lll-descending-size-reduction`, `GN.5/lll-prefix-invariant`, `GN.5/lll-lexicographic-termination`, `GN.5/lll-shear-certificate`, `GN.5/lll-swap-certificate`

API contracts:

- `exactLLL` (constructor; native signature elaborated): Return output coordinates, reducedness and the exact integer inverse certificate.
- `exactLLL_certificate` (projection; native signature elaborated): Recover the original-lattice certificate.
- `exactLLL_reduced` (projection; native signature elaborated): Recover the exact size and Lovász tests.
- `exactLLL_shortVector` (relation; native signature elaborated): For positive rank, the first vector satisfies the proven approximation inequality in the original lattice.

Mathematical test contracts:

- `lll_exact_reduction_test_1` (characterisation): Input columns (2,0),(0,1) require a swap; the returned certificate may have determinant −1.
- `lll_exact_reduction_test_2` (characterisation): Rank zero returns an empty reduced basis and empty identity matrices.
- `lll_exact_reduction_test_3` (characterisation): An output without a proven Lovász condition is rejected even if short in floating-point arithmetic.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), Algorithm (1.15), updates (1.22), Figure 1, termination proof, physical pp.5–8. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Algorithm (1.15), updates (1.22), Figure 1, termination proof, physical pp.5–8`: Exact terminating LLL reduction supplies the corresponding staged target or its next declaration.

### Verify the short output in the original lattice

**theorem; `GN.5/lll-original-lattice-verification`.** If a certified output c is LLL-reduced and b is an independent input basis of L, then c₀∈L is nonzero and for every nonzero x∈L, ‖c₀‖²≤2^{n−1}‖x‖², for n≥1.

Hypotheses and conventions: The metric used by reduction and verification is the same exact Euclidean or specified rational Gram metric. Arithmetic height, relation exclusion and representation conditions are consumer-owned inputs.

Proof/construction outline: 1. Use the unimodular certificate to identify the two integer spans. 2. Independence gives c₀≠0. 3. Apply the preceding LLL bound to c and transport x-membership back through span equality.

Direct prerequisites: `GN.5/unimodular-basis-certificate`, `GN.5/lll-reduced`, `GN.5/lll-short-vector-factor`

Mathematical test contracts:

- `lll_original_lattice_verification_test_1` (characterisation): A verified certificate includes both original membership and the approximation factor.
- `lll_original_lattice_verification_test_2` (characterisation): A short vector in the real span but outside the integer span cannot pass verification.

Source/derivation: [LLL1982](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf), Proposition 1.11 plus exact shear/swap lattice preservation, physical pp.4–8. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Proposition 1.11 plus exact shear/swap lattice preservation, physical pp.4–8`: Verify the short output in the original lattice supplies the corresponding staged target or its next declaration.

## GN.6: Exact hermitian forms, Q/cone/formations and arithmetic GW comparisons

Coverage: **partial**. Finished 300-node planning pass at the protocol budget; source/supplier/implementation closure is not asserted.

The follow-up must establish the following scope before closure:

- Native exact forms, GW/W quotient presentations, Q-span/category, cone diagrams/localization/finite swindle and formation group are typed planning interfaces. Match genuine Q/Qh realizations, orthogonal-sum H-space/cofinality comparisons and the ordinary exact quotient with its four s-filtering conditions.
- Read the remaining classical dg/localization proofs, supply shifted residue duality from the routed Poincare owner, match completion/loop/spectrum assembly and hyperbolic comparison to H/K owners. The Poincare brief has no stage/node ids here, so no fictitious supplier is named.
- Calmes integer residue-row and quadratic/skew low-degree outcomes are source-read nodes. Complete framework-specific K-group/2-completion/C2/Tate/module-action hypotheses and all remaining routed GN.6/GN.2 outcomes, including the finite-field inputs and Feng–Galatius–Venkatesh route.

### Strong duality on a category

**definition; `GN.6/strong-category-duality`.** Atlas planet: Exact-category duality. A strong duality on a category C is a functor D:Cᵒᵖ→C and a natural isomorphism η:Id_C→D D with D(η_X)∘η_{DX}=id_{DX}. This is classical categorical duality, distinct from a stable Poincaré infinity-category.

Hypotheses and conventions: C uses its existing category structure; opposite functors have the pinned map direction. Exactness and additivity are extra properties, not empty proposition fields standing in for them.

Proof/construction outline: 1. Use the native opposite category, functor and natural isomorphism. 2. State and retain the double-dual coherence equation. 3. Use coherence and η to recover the contravariant equivalence; do not replace the category by an untyped involution on objects.

Direct prerequisites: `mathlib:CategoryTheory.Functor.rightOp`

API contracts:

- `StrongCategoryDuality` (constructor; native signature elaborated): The actual contravariant functor, natural isomorphism and coherence equation.
- `StrongCategoryDuality.dual` (projection; native signature elaborated): Return D:Cᵒᵖ→C.
- `StrongCategoryDuality.biddual` (projection; native signature elaborated): Return the natural double-dual isomorphism.
- `StrongCategoryDuality.coherence` (relation; native signature elaborated): D(η_X)η_{DX}=id_{DX}.

Mathematical test contracts:

- `strong_category_duality_test_1` (characterisation): Identity double-dual data on a discrete one-object category is a strong duality.
- `strong_category_duality_test_2` (characterisation): The functor reverses morphism composition.
- `strong_category_duality_test_3` (characterisation): A natural transformation that is not invertible gives the source’s weak duality, not this strong-duality structure.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Definition 2.1 and Definition 3.1, printed pp.109,113. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Definition 2.1 and Definition 3.1, printed pp.109,113`: Strong duality on a category supplies the corresponding staged target or its next declaration.

### Exact category with strong duality

**construction; `GN.6/exact-category-duality`.** On an existing TauCeti.ExactStructure on a preadditive category E, equip a strong duality D that is additive and sends each conflation X→Y→Z to the reversed dual conflation DZ→DY→DX. The coefficient sign −η gives the alternating variant when D is additive.

Hypotheses and conventions: Use the completed intrinsic ExactStructure carrier and conflation-exact functors. No assumption 2 is invertible is required for this classical exact-category construction.

Proof/construction outline: 1. Import the exact structure rather than duplicating Quillen axioms. 2. Prove the dual functor preserves the actual conflation class with its contravariant order. 3. Use additivity to verify the coherence of −η and the skew/symmetric conversion.

Direct prerequisites: `GN.6/strong-category-duality`, `tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-0-intrinsic-exact-structures-and-conflation-exact-functors`, `tauceti:TauCeti.ExactStructure`, `tauceti:TauCeti.ExactStructure.IsConflationExact`, `tauceti:TauCeti.ExactStructure.op`, `tauceti:TauCeti.ExactStructure.split`

API contracts:

- `ExactCategoryDuality.ofExactFunctor` (constructor; native signature elaborated): An additive conflation-exact strong duality on the existing exact category.
- `ExactCategoryDuality.map_conflation` (functoriality; native signature elaborated): Reverse a conflation to its dual conflation.
- `ExactCategoryDuality.sign` (constructor; native signature elaborated): The sign-twisted duality with double dual −η.

Mathematical test contracts:

- `exact_category_duality_test_1` (characterisation): Finite projective R-modules with Hom_R(−,R) form the split exact example; arbitrary finite modules need not have invertible biduality.
- `exact_category_duality_test_2` (characterisation): Over Z the hyperbolic symmetric plane is available without 1/2.
- `exact_category_duality_test_3` (characterisation): Changing η to −η changes the symmetry equation and does not identify symmetric and quadratic refinements at 2.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Definition 2.1, Example 2.2 and §2.4, printed pp.109–110. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Definition 2.1, Example 2.2 and §2.4, printed pp.109–110`: Exact category with strong duality supplies the corresponding staged target or its next declaration.

### Nondegenerate symmetric spaces

**definition; `GN.6/symmetric-space`.** For strong duality (D,η), a symmetric space is (X,φ) with an isomorphism φ:X→DX satisfying D(φ)η_X=φ. A form-preserving map f:X→Y satisfies φ_X=D(f)φ_Y f; an isometry is such a map whose underlying morphism is an isomorphism.

Hypotheses and conventions: Nondegeneracy is an isomorphism, not merely a separating form over a ring. Symplectic spaces use the sign-twisted duality; a quadratic refinement is additional data at dyadic coefficients.

Proof/construction outline: 1. Bundle the object and actual pairing isomorphism with its typed coherence equation. 2. Define form-preserving morphisms using native categorical composition. 3. Use identity/composition and inverses to form the isometry groupoid.

Direct prerequisites: `GN.6/strong-category-duality`

API contracts:

- `SymmetricSpace` (constructor; native signature elaborated): Object, pairing isomorphism and typed symmetry equation.
- `SymmetricSpace.pairing` (projection; native signature elaborated): The actual map X≅DX.
- `SymmetricSpace.preserves` (characterisation; native signature elaborated): Form-preservation is the displayed categorical equation.
- `SymmetricSpace.preserves_id` (simp; native signature elaborated): Identity preserves a symmetric space.
- `SymmetricSpace.preserves_comp` (functoriality; native signature elaborated): The composite of form-preserving maps preserves the forms.

Mathematical test contracts:

- `symmetric_space_test_1` (characterisation): The rank-one pairing xy on Z is nondegenerate; 2xy is separating but not a pairing isomorphism over Z.
- `symmetric_space_test_2` (characterisation): The identity map preserves every symmetric space.
- `symmetric_space_test_3` (characterisation): A noninvertible form-preserving map is not called an isometry.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Definition 2.4 and §3.1, printed pp.110,113. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Definition 2.4 and §3.1, printed pp.110,113`: Nondegenerate symmetric spaces supplies the corresponding staged target or its next declaration.

### Admissible Lagrangians

**definition; `GN.6/exact-lagrangian`.** A Lagrangian of (X,φ) is an admissible inflation i:L→X such that L→X→DL, with second map D(i)φ, is a conflation. Thus L is its own orthogonal, in the actual exact structure. A space is metabolic when a Lagrangian exists.

Hypotheses and conventions: An arbitrary isotropic submodule is not automatically admissible. An exact Lagrangian specifies the quotient and conflation, not only a rank equality.

Proof/construction outline: 1. Use the native conflation class and duality map to specify the short exact sequence. 2. Recover isotropy from composition zero and orthogonal equality from kernel exactness. 3. Transport the conflation through an isometry.

Direct prerequisites: `GN.6/symmetric-space`, `GN.6/exact-category-duality`, `tauceti:TauCeti.ExactStructure.split`

API contracts:

- `ExactLagrangian.ofConflation` (constructor; native signature elaborated): A conflation L→X→DL with the displayed second map.
- `ExactLagrangian.zero` (relation; native signature elaborated): D(i)φi=0.
- `ExactLagrangian.mapIsometry` (functoriality; native signature elaborated): An isometry transports the admissible Lagrangian.

Mathematical test contracts:

- `exact_lagrangian_test_1` (characterisation): The first summand of the hyperbolic plane is a Lagrangian.
- `exact_lagrangian_test_2` (characterisation): 2Z⊂Z is not an admissible summand in the split exact category of projectives.
- `exact_lagrangian_test_3` (characterisation): An isotropic subobject of too small a rank is not a Lagrangian.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Definition 2.5, printed p.110. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Definition 2.5, printed p.110`: Admissible Lagrangians supplies the corresponding staged target or its next declaration.

### Hyperbolic symmetric space

**construction; `GN.6/hyperbolic-space`.** For X in an exact category with duality, H(X) has underlying object X⊕DX and pairing matrix [[0,1],[η_X,0]] to DX⊕DDX, with its actual biproduct identifications. The inclusion of X is an admissible Lagrangian.

Hypotheses and conventions: No division by 2 is used. The exact category’s split biproduct conflation is imported.

Proof/construction outline: 1. Form the native biproduct and the off-diagonal pairing. 2. Use η coherence to prove symmetry and invertibility. 3. Identify the standard biproduct conflation as the Lagrangian sequence.

Direct prerequisites: `GN.6/exact-category-duality`, `GN.6/symmetric-space`, `GN.6/exact-lagrangian`

API contracts:

- `hyperbolicSpace` (constructor; native signature elaborated): The native biproduct with the off-diagonal perfect pairing.
- `hyperbolicLagrangian` (projection; native signature elaborated): The first summand is an admissible Lagrangian.
- `hyperbolicSpace_sum` (compatibility; native signature elaborated): Hyperbolic construction carries sums to orthogonal sums.

Mathematical test contracts:

- `hyperbolic_space_test_1` (characterisation): Over Z, H(Z) has Gram [[0,1],[1,0]] and is even unimodular.
- `hyperbolic_space_test_2` (characterisation): H(0) is the zero symmetric space.
- `hyperbolic_space_test_3` (characterisation): H(X⊕Y) is isometric to H(X)⊥H(Y).

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), After Definition 2.5, printed p.110. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `After Definition 2.5, printed p.110`: Hyperbolic symmetric space supplies the corresponding staged target or its next declaration.

### Admissible isotropic subobject

**definition; `GN.6/admissible-isotropic-subobject`.** Store L→L-perp→X, the quotient L-perp→Q and the two conflations L→L-perp→Q and L-perp→X→DL. The composite L→X is an inflation. The second outgoing map is obtained from the actual pairing and dual inclusion.

Proof/construction outline: 1. Use the supplied exact orthogonal kernel and admissible quotient, retaining their arrows and universal properties.

Direct prerequisites: `GN.6/exact-category-duality`, `GN.6/symmetric-space`

API contracts:

- `ExactIsotropicSubobject` (data; native signature elaborated): The two actual conflations, inclusion and quotient maps.
- `ExactIsotropicSubobject.totalInclusion` (projection; native signature elaborated): The composite admissible inclusion L→X.
- `ExactIsotropicSubobject.quotientMap` (projection; native signature elaborated): The specified admissible quotient L-perp→Q.

Mathematical test contracts:

- `admissible_isotropic_subobject_test_1` (characterisation): L=0 in a perfect field space gives Q=X.
- `admissible_isotropic_subobject_test_2` (characterisation): A Lagrangian gives Q=0.
- `admissible_isotropic_subobject_test_3` (characterisation): The image 2Z inside the first summand of H(Z) does not qualify in the projective split exact structure.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 2.6, printed pp.110–111. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/isotropic-reduction`: Uses admissible isotropic subobject with the displayed hypotheses and normalization. `GN.6/isotropic-pairing-descent`: Uses admissible isotropic subobject with the displayed hypotheses and normalization.

### Isotropic pairing descends

**lemma; `GN.6/isotropic-pairing-descent`.** The restricted pairing on L-perp factors uniquely through the admissible quotient in both variables to a map Q→DQ.

Proof/construction outline: 1. Isotropy kills the first kernel. 2. Apply the cokernel property, then exact duality and the second cokernel property.

Direct prerequisites: `GN.6/admissible-isotropic-subobject`, `GN.6/exact-category-duality`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 2.6 proof, printed p.111. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/isotropic-quotient-symmetry`: Uses isotropic pairing descends with the displayed hypotheses and normalization. `GN.6/isotropic-quotient-perfect`: Uses isotropic pairing descends with the displayed hypotheses and normalization.

### Isotropic quotient symmetry

**lemma; `GN.6/isotropic-quotient-symmetry`.** The descended quotient pairing satisfies the strong-duality symmetry equation.

Proof/construction outline: 1. Precompose with the quotient deflation and postcompose with its dual inflation. 2. Cancel the epic and monic arrows and use symmetry on X.

Direct prerequisites: `GN.6/isotropic-pairing-descent`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 2.6 proof, printed p.111. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/isotropic-reduction`: Uses isotropic quotient symmetry with the displayed hypotheses and normalization.

### Exact short five lemma

**lemma; `GN.6/exact-short-five-lemma`.** In an exact category a map of conflations with isomorphisms on both ends is an isomorphism in the middle.

Proof/construction outline: 1. Use kernel/cokernel universal properties to produce the inverse middle arrow. 2. Commutativity and the monic/epic universal maps verify both composites.

Direct prerequisites: `GN.6/exact-category-duality`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 2.6 proof, printed p.111; elementary exact-category adapter. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/isotropic-quotient-perfect`: Uses exact short five lemma with the displayed hypotheses and normalization.

### Isotropic quotient is perfect

**lemma; `GN.6/isotropic-quotient-perfect`.** The descended quotient pairing is an isomorphism.

Proof/construction outline: 1. Compare the two rows of conflations in the source dual diagram. 2. Perfectness of X and biduality give the outer isomorphisms; apply the exact short five lemma.

Direct prerequisites: `GN.6/isotropic-pairing-descent`, `GN.6/exact-short-five-lemma`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 2.6 proof, printed p.111. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/isotropic-reduction`: Uses isotropic quotient is perfect with the displayed hypotheses and normalization. `GN.6/isotropic-graph-lagrangian`: Uses isotropic quotient is perfect with the displayed hypotheses and normalization.

### Isotropic reduction of a symmetric space

**construction; `GN.6/isotropic-reduction`.** For an admissible totally isotropic L⊂X with L⊂L⊥ also an inflation, there is a unique nondegenerate symmetric form on L⊥/L pulling back to the restricted form.

Hypotheses and conventions: Both admissibility conditions are retained. The quotient is the exact-category quotient of the specified conflation.

Proof/construction outline: 1. Use kernel/cokernel universal properties to factor the restricted pairing through the quotient in both arguments. 2. Use epimorphism cancellation to prove symmetry. 3. Use the exact five-lemma to prove the induced quotient form is nondegenerate; the separate metabolic comparison is isotropic-reduction-metabolic.

Direct prerequisites: `GN.6/admissible-isotropic-subobject`, `GN.6/isotropic-quotient-symmetry`, `GN.6/isotropic-quotient-perfect`

API contracts:

- `isotropicReduction` (constructor; native signature elaborated): The unique induced perfect symmetric quotient form.
- `isotropicReduction_pullback` (characterisation; native signature elaborated): Its pullback is the restricted pairing.
- `isotropicReduction_isometry` (functoriality; native signature elaborated): An isometry carrying one admissible isotropic subobject to another induces an isometry of their perfect quotient forms.

Mathematical test contracts:

- `isotropic_reduction_test_1` (characterisation): For L=0 the quotient is X and X⊥−X is metabolic.
- `isotropic_reduction_test_2` (characterisation): For a Lagrangian L the quotient L⊥/L is zero.
- `isotropic_reduction_test_3` (characterisation): For a nonadmissible inclusion the quotient construction cannot be invoked.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 2.6 and complete proof, printed pp.110–111. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Lemma 2.6 and complete proof, printed pp.110–111`: Isotropic reduction of a symmetric space supplies the corresponding staged target or its next declaration.

### Symmetric isometry classes

**definition; `GN.6/symmetric-isometry-classes`.** Isometry classes are the quotient of nondegenerate symmetric spaces by existence of an actual form-preserving categorical isomorphism.

Proof/construction outline: 1. Identity, inverse and composition of pairing-preserving isomorphisms give a setoid.

Direct prerequisites: `GN.6/symmetric-space`

API contracts:

- `SymmetricIsometry` (data; native signature elaborated): A categorical isomorphism satisfying the pairing equation.
- `symmetricIsometrySetoid` (characterisation; native signature elaborated): Two spaces are related exactly when such an isometry exists.
- `SymmetricIsometryClass` (constructor; native signature elaborated): The quotient by that setoid; its generator identifies precisely isometric spaces.

Mathematical test contracts:

- `symmetric_isometry_classes_test_1` (characterisation): A rank-one Z pairing xy is not isometric to 2xy, which is not perfect.
- `symmetric_isometry_classes_test_2` (characterisation): The zero space has a single isometry class.
- `symmetric_isometry_classes_test_3` (characterisation): Over Q, determinant square class separates ⟨1⟩ from ⟨2⟩.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), §2.2, printed p.111. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/exact-grothendieck-witt-group`: Uses symmetric isometry classes with the displayed hypotheses and normalization. `GN.6/formation`: Uses symmetric isometry classes with the displayed hypotheses and normalization.

### Orthogonal sum

**construction; `GN.6/orthogonal-sum`.** Orthogonal sum has carrier X⊕Y and the direct-sum pairing, transported across the additive duality biproduct isomorphism.

Proof/construction outline: 1. Construct the block diagonal pairing using the biproduct identities and dual additivity. 2. Bidual coherence supplies symmetry and the inverse block pairing.

Direct prerequisites: `GN.6/exact-category-duality`, `GN.6/symmetric-space`

API contracts:

- `orthogonalSum` (constructor; native signature elaborated): Construct the space on the actual categorical biproduct.
- `orthogonalSum_carrier` (simp; native signature elaborated): Its carrier is X.carrier⊕Y.carrier.
- `orthogonalSum_assoc` (compatibility; native signature elaborated): The canonical biproduct associator preserves the pairing.
- `orthogonalSum_comm` (compatibility; native signature elaborated): The biproduct swap is an isometry.

Mathematical test contracts:

- `orthogonal_sum_test_1` (characterisation): The sum of two rank-one unit forms over Z has diagonal Gram matrix (1,1).
- `orthogonal_sum_test_2` (characterisation): Zero is a unit up to isometry.
- `orthogonal_sum_test_3` (characterisation): Rank and determinant multiply in the usual block formula.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), §2.2, printed p.111. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/exact-grothendieck-witt-group`: Uses orthogonal sum with the displayed hypotheses and normalization. `GN.6/isotropic-reduction-metabolic`: Uses orthogonal sum with the displayed hypotheses and normalization. `GN.6/symmetric-diagonal-lagrangian`: Uses orthogonal sum with the displayed hypotheses and normalization. `GN.6/cone-swindle-endofunctor`: Uses orthogonal sum with the displayed hypotheses and normalization. `GN.6/hermitian-orthogonal-additivity`: Uses orthogonal sum with the displayed hypotheses and normalization. `GN.6/formation-group`: Uses orthogonal sum with the displayed hypotheses and normalization.

### Degree-zero Grothendieck–Witt group of an exact category

**construction; `GN.6/exact-grothendieck-witt-group`.** Atlas planet: Grothendieck–Witt group. GW₀(E) is the group completion of isometry classes of nondegenerate symmetric spaces modulo [M]=[H(L)] for every metabolic M with an admissible Lagrangian L. Orthogonal sum is addition. This extra relation is essential in a nonsplit exact category.

Hypotheses and conventions: E is essentially small with its intrinsic exact structure and strong exact duality. Degree-zero field Witt/GW theory is imported from QuadraticFormInvariants; this declaration supplies the general exact-category extension and the comparison.

Proof/construction outline: 1. Take a small skeleton of symmetric spaces and the native free abelian group on its isometry classes. 2. Quotient by orthogonal-sum and metabolic/hyperbolic relations. 3. Prove choice independence and the universal property for additive invariants satisfying the metabolic relation.

Direct prerequisites: `GN.6/symmetric-space`, `GN.6/exact-lagrangian`, `GN.6/hyperbolic-space`, `mathlib:FreeAbelianGroup`, `GN.6/symmetric-isometry-classes`, `GN.6/orthogonal-sum`

API contracts:

- `ExactGW0` (constructor; native signature elaborated): The presented additive group.
- `ExactGW0.of` (constructor; native signature elaborated): The generator class of a symmetric space.
- `ExactGW0.sum` (simp; native signature elaborated): Orthogonal sum becomes addition.
- `ExactGW0.metabolic` (relation; native signature elaborated): [M]=[H(L)] for an admissible Lagrangian.
- `ExactGW0.lift` (universal-property; native signature elaborated): Descend exactly the additive invariants satisfying the metabolic relation.

Mathematical test contracts:

- `exact_grothendieck_witt_group_test_1` (characterisation): A metabolic space with Lagrangian L has the same GW class as H(L).
- `exact_grothendieck_witt_group_test_2` (characterisation): Over a split exact projective category, stable metabolic cancellation yields the usual group completion.
- `exact_grothendieck_witt_group_test_3` (characterisation): Over Z the symmetric and quadratic-refined group presentations are not conflated.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), §2.2, printed p.111. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§2.2, printed p.111`: Degree-zero Grothendieck–Witt group of an exact category supplies the corresponding staged target or its next declaration.

### Negative symmetric space

**construction; `GN.6/negative-symmetric-space`.** Negate the pairing isomorphism on the same object; additive duality preserves the symmetry equation.

Proof/construction outline: 1. Negate both the pairing and its inverse; verify both inverse equations.

Direct prerequisites: `GN.6/exact-category-duality`, `GN.6/symmetric-space`

API contracts:

- `negativeSpace` (constructor; native signature elaborated): Negate the perfect pairing without changing the carrier.
- `negativeSpace_carrier` (simp; native signature elaborated): The underlying object is unchanged.
- `negativeSpace_pairing` (simp; native signature elaborated): The pairing hom is the negative of the original hom.
- `negativeSpace_negative` (simp; native signature elaborated): Double negation recovers the original pairing.

Mathematical test contracts:

- `negative_symmetric_space_test_1` (characterisation): Negating ⟨1⟩ gives ⟨−1⟩ over Q.
- `negative_symmetric_space_test_2` (characterisation): Negation twice recovers the original space.
- `negative_symmetric_space_test_3` (characterisation): Negation preserves the zero space.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), §2.2, printed p.111. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/isotropic-reduction-metabolic`: Uses negative symmetric space with the displayed hypotheses and normalization. `GN.6/symmetric-diagonal-lagrangian`: Uses negative symmetric space with the displayed hypotheses and normalization.

### Diagonal Lagrangian for opposite forms

**lemma; `GN.6/symmetric-diagonal-lagrangian`.** For a symmetric space X in an exact category with strong exact duality, the diagonal X into X orthogonally summed with -X is an admissible Lagrangian.

Hypotheses and conventions: The diagonal Lagrangian proof uses the actual perfect pairing and split exactness of its short sequence.

Proof/construction outline: 1. The diagonal split inflation and difference split deflation form a biproduct conflation. 2. The sum pairing vanishes on the diagonal; identify its induced dual deflation with the difference map using the perfect pairing of X.

Direct prerequisites: `GN.6/symmetric-space`, `GN.6/exact-lagrangian`, `GN.6/negative-symmetric-space`, `GN.6/orthogonal-sum`

Acceptance: For a one-dimensional field form <a>, the diagonal line in <a> orthogonal-sum <-a> has zero pairing and is the Lagrangian.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), §2.2 and Lemma 2.8, printed pp.111–112. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `GN.6/exact-witt-group`: Separate the declaration-sized input from the bundled consuming declaration.

### Witt group of an exact category

**construction; `GN.6/exact-witt-group`.** Atlas planet: Witt group. W0(E) is the orthogonal-sum monoid of symmetric-space isometry classes modulo metabolic spaces, equipped with its abelian group structure: the negative form supplies the inverse, as proved by symmetric-diagonal-lagrangian.

Hypotheses and conventions: The diagonal Lagrangian proof uses the actual perfect pairing and split exactness of its short sequence.

Proof/construction outline: 1. Define the metabolic quotient using actual symmetric spaces. 2. Use X⊥−X to exhibit the inverse class.

Direct prerequisites: `GN.6/exact-grothendieck-witt-group`, `GN.6/exact-lagrangian`, `GN.6/hyperbolic-space`, `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`, `GN.6/symmetric-diagonal-lagrangian`

API contracts:

- `ExactW0` (constructor; native signature elaborated): The metabolic quotient group.
- `ExactW0.of` (constructor; native signature elaborated): The Witt class of a symmetric space.
- `ExactW0.metabolic` (simp; native signature elaborated): Metabolic spaces have zero class.
- `ExactW0.neg` (relation; native signature elaborated): Negating the pairing gives the additive inverse.
- `ExactW0.fieldComparison` (compatibility; supplier signature unmatched): For fields in the existing owner’s scope, recover its Witt group.

Mathematical test contracts:

- `exact_witt_group_test_1` (characterisation): A hyperbolic plane has zero Witt class.
- `exact_witt_group_test_2` (characterisation): The inverse of [X,φ] is [X,−φ].
- `exact_witt_group_test_3` (characterisation): W=GW is false: over R the hyperbolic plane has nonzero rank in GW but zero Witt class.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), §2.2 and Lemma 2.8, printed pp.111–112. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§2.2 and Lemma 2.8, printed pp.111–112`: Witt group of an exact category supplies the corresponding staged target or its next declaration.

### Forgetful map on Grothendieck–Witt groups

**construction; `GN.6/grothendieck-witt-forgetful-map`.** For a small exact category E with strong exact duality, the underlying-object assignment induces the group homomorphism F:GW0(E)->K0(E).

Hypotheses and conventions: K₀ is the imported exact Grothendieck group. The duality involution can act nontrivially on K₀; multiplication by two is only a specialization when it acts trivially.

Proof/construction outline: 1. Orthogonal sum maps to the exact Grothendieck sum. 2. A metabolic space with Lagrangian L has underlying class [L]+[DL], matching the underlying class of H(L); hence the metabolic relation descends.

Direct prerequisites: `GN.6/exact-grothendieck-witt-group`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `tauceti:TauCeti.ExactK0`, `tauceti:TauCeti.ExactK0.of`, `tauceti:TauCeti.ExactK0.of_conflation`, `tauceti:TauCeti.ExactK0.map`

API contracts:

- `grothendieckWittForgetful` (constructor; native signature elaborated): The underlying-object group homomorphism.
- `grothendieckWittForgetful_of` (simp; native signature elaborated): F([X,phi])=[X].
- `grothendieckWittForgetful_natural` (functoriality; native signature elaborated): Commutes with exact form functors and their underlying exact functors.

Mathematical test contracts:

- `grothendieck_witt_forgetful_test_1` (degenerate): F of the zero space is zero.
- `grothendieck_witt_forgetful_test_2` (computation): Over a field, a nonsingular one-dimensional form has underlying K0 rank one.
- `grothendieck_witt_forgetful_test_3` (characterisation): F of a metabolic space with Lagrangian L is [L]+[DL].

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 2.8 and proof, printed p.112. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `GN.6/hyperbolic-forgetful-relations`: Separate the declaration-sized input from the bundled consuming declaration.

### Hyperbolic map from the exact Grothendieck group

**construction; `GN.6/grothendieck-witt-hyperbolic-map`.** For a small exact category E with strong exact duality, X maps to H(X) and induces a group homomorphism H:K0(E)->GW0(E).

Hypotheses and conventions: K₀ is the imported exact Grothendieck group. The duality involution can act nontrivially on K₀; multiplication by two is only a specialization when it acts trivially.

Proof/construction outline: 1. Apply Schlichting Lemma 2.8(b): an exact conflation yields the corresponding hyperbolic Grothendieck–Witt relation. 2. The additive assignment descends through the exact K0 presentation.

Direct prerequisites: `GN.6/exact-grothendieck-witt-group`, `GN.6/hyperbolic-space`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `tauceti:TauCeti.ExactK0`, `tauceti:TauCeti.ExactK0.map`

API contracts:

- `grothendieckWittHyperbolic` (constructor; native signature elaborated): The hyperbolic group homomorphism.
- `grothendieckWittHyperbolic_of` (simp; native signature elaborated): H([X])=[H(X)].
- `grothendieckWittHyperbolic_natural` (functoriality; native signature elaborated): Commutes with nonsingular exact form functors.

Mathematical test contracts:

- `grothendieck_witt_hyperbolic_test_1` (degenerate): H(0)=0.
- `grothendieck_witt_hyperbolic_test_2` (computation): Over a field the underlying rank of H of a rank-one class is two.
- `grothendieck_witt_hyperbolic_test_3` (characterisation): For each exact conflation X->Y->Z, H([Y])=H([X])+H([Z]).

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 2.8 and proof, printed p.112. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `GN.6/hyperbolic-forgetful-relations`: Separate the declaration-sized input from the bundled consuming declaration.

### Hyperbolic and forgetful maps in degree zero

**theorem; `GN.6/hyperbolic-forgetful-relations`.** The composite of the forgetful and hyperbolic maps is F H=1+D on the exact Grothendieck group: F H([X])=[X]+[DX]. It specializes to multiplication by two only when D acts trivially.

Hypotheses and conventions: K₀ is the imported exact Grothendieck group. The duality involution can act nontrivially on K₀; multiplication by two is only a specialization when it acts trivially.

Proof/construction outline: 1. Evaluate F H on the object generators of exact K0 and use additivity.

Direct prerequisites: `GN.6/grothendieck-witt-forgetful-map`, `GN.6/grothendieck-witt-hyperbolic-map`

Mathematical test contracts:

- `hyperbolic_forgetful_relations_test_1` (characterisation): Over a field with trivial rank-duality action, F H doubles rank.
- `hyperbolic_forgetful_relations_test_2` (characterisation): The hyperbolic image maps to zero in W₀.
- `hyperbolic_forgetful_relations_test_3` (characterisation): For a nontrivial K₀ involution, the equation is 1+D and cannot be simplified without proof.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 2.8 and proof, printed p.112. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Lemma 2.8 and proof, printed p.112`: Hyperbolic and forgetful maps in degree zero supplies the corresponding staged target or its next declaration.

### Hermitian Q span

**definition; `GN.6/hermitian-q-span`.** A representative X←U→Y has admissible deflation p and inflation i; the square from U to Y and X, with opposite corner DU and maps φY followed by Di and φX followed by Dp, is both cartesian and cocartesian.

Proof/construction outline: 1. Retain both universal squares in the native category and the two admissibility predicates.

Direct prerequisites: `GN.6/exact-category-duality`, `GN.6/symmetric-space`

API contracts:

- `HermitianQSpan` (constructor; native signature elaborated): Store the actual bicartesian square and admissible span legs.
- `HermitianQSpan.identity` (constructor; native signature elaborated): The two identity arrows give an identity representative.
- `HermitianQSpan.equivalent` (characterisation; native signature elaborated): A middle-object isomorphism commutes with both legs.
- `HermitianQSpan.comp` (constructor; native signature elaborated): Use the exact pullback of the next deflation along the previous inflation.

Mathematical test contracts:

- `hermitian_q_span_test_1` (characterisation): The identity representative uses U=X and both identity legs.
- `hermitian_q_span_test_2` (characterisation): A Lagrangian inclusion represents zero→X.
- `hermitian_q_span_test_3` (characterisation): An inclusion with a nonzero restricted self-pairing cannot represent zero→X.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Definition 4.1, printed p.116. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/hermitian-q-span-setoid`: Uses hermitian q span with the displayed hypotheses and normalization. `GN.6/hermitian-q-pullback-closure`: Uses hermitian q span with the displayed hypotheses and normalization.

### Hermitian Q representative equivalence

**lemma; `GN.6/hermitian-q-span-setoid`.** Isomorphisms of middle objects respecting both legs give an equivalence relation on hermitian Q representatives.

Proof/construction outline: 1. Use the identity, inverse and composite categorical isomorphism.

Direct prerequisites: `GN.6/hermitian-q-span`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Definition 4.1, printed p.116. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/hermitian-q-construction`: Uses hermitian q representative equivalence with the displayed hypotheses and normalization.

### Hermitian Q pullback closure

**lemma; `GN.6/hermitian-q-pullback-closure`.** Pullback composition of admissible spans produces another admissible hermitian bicartesian span.

Proof/construction outline: 1. Exact pullback gives the deflation; the composite of the pulled-back inflation with the second inflation gives the other leg. 2. Paste the pairing squares and use the dual pushout squares to verify both universal properties.

Direct prerequisites: `GN.6/hermitian-q-span`, `GN.6/isotropic-reduction`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Definition 4.1 and Remark 4.3, printed pp.116–117; source omitted routine diagram verification is made explicit. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/hermitian-q-composition-congr`: Uses hermitian q pullback closure with the displayed hypotheses and normalization. `GN.6/hermitian-q-identities`: Uses hermitian q pullback closure with the displayed hypotheses and normalization. `GN.6/hermitian-q-associativity`: Uses hermitian q pullback closure with the displayed hypotheses and normalization.

### Hermitian Q composition respects representatives

**lemma; `GN.6/hermitian-q-composition-congr`.** Isomorphic input spans have isomorphic pullback composites, respecting both outer legs.

Proof/construction outline: 1. The two pullback universal properties induce inverse middle maps.

Direct prerequisites: `GN.6/hermitian-q-pullback-closure`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Definition 4.1, printed p.116; exact pullback adapter. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/hermitian-q-construction`: Uses hermitian q composition respects representatives with the displayed hypotheses and normalization.

### Hermitian Q identity laws

**lemma; `GN.6/hermitian-q-identities`.** Composing an identity representative on either side gives an equivalent span.

Proof/construction outline: 1. Use the canonical pullback isomorphism along an identity.

Direct prerequisites: `GN.6/hermitian-q-pullback-closure`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Definition 4.1, printed p.116. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/hermitian-q-construction`: Uses hermitian q identity laws with the displayed hypotheses and normalization.

### Hermitian Q associativity

**lemma; `GN.6/hermitian-q-associativity`.** The two iterated pullback composites are isomorphic representatives, compatibly with the outer legs.

Proof/construction outline: 1. The common threefold fibre-product universal property gives the comparison and its inverse.

Direct prerequisites: `GN.6/hermitian-q-pullback-closure`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Definition 4.1, printed p.116. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/hermitian-q-construction`: Uses hermitian q associativity with the displayed hypotheses and normalization.

### Hermitian Q-construction

**construction; `GN.6/hermitian-q-construction`.** Atlas planet: Hermitian Q-construction. Qʰ(E) has symmetric spaces as objects. A morphism X→Y is an isomorphism class of spans X←p U→i Y with p an admissible deflation and i an admissible inflation, satisfying the matching restricted pairings and ker p≅ker(D(i)φ_Y). Equivalently the corresponding pairing square is bicartesian. Composition is the imported Q pullback composition.

Hypotheses and conventions: Use the actual pairing square and exact-category quotient data; not every ordinary Q-span lifts.

Proof/construction outline: 1. Import Quillen Q and its span equivalence and pullback composition. 2. Restrict to the hermitian bicartesian pairing condition. 3. Prove the condition survives composition and equivalence of representatives; expose the forgetful functor to Q(E).

Direct prerequisites: `GN.6/hermitian-q-span-setoid`, `GN.6/hermitian-q-composition-congr`, `GN.6/hermitian-q-identities`, `GN.6/hermitian-q-associativity`, `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`

API contracts:

- `HermitianQ` (constructor; native signature elaborated): The native category of hermitian Q-spans.
- `HermitianQ.ofSpan` (constructor; native signature elaborated): A span with its actual bicartesian pairing condition.
- `HermitianQ.forget` (functoriality; supplier signature unmatched): Forget the pairings to the existing Q-construction.
- `HermitianQ.identity` (simp; native signature elaborated): Identity is the identity span.

Mathematical test contracts:

- `hermitian_q_construction_test_1` (characterisation): A Lagrangian gives a Qʰ path from zero to its metabolic space.
- `hermitian_q_construction_test_2` (characterisation): The identity span gives the identity morphism.
- `hermitian_q_construction_test_3` (characterisation): A Q-span with incompatible pairing or wrong kernel is not a hermitian morphism.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Definition 4.1 and §4.1, printed pp.116–117. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Definition 4.1 and §4.1, printed pp.116–117`: Hermitian Q-construction supplies the corresponding staged target or its next declaration.

### Hermitian Q forgetful functor

**comparison; `GN.6/hermitian-q-forgetful-functor`.** Forgetting the pairings and bicartesian witness gives a functor Qh(E)→Q(E), preserving the zero object and representative composition.

Proof/construction outline: 1. The same admissible span and pullback represent the ordinary Q morphism.

Direct prerequisites: `GN.6/hermitian-q-construction`, `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Definition 4.1 and Definition 4.4, printed pp.116–117. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/hyperbolic-q-equivalence`: Uses hermitian q forgetful functor with the displayed hypotheses and normalization. `GN.6/hermitian-q-nerve-realization`: Uses hermitian q forgetful functor with the displayed hypotheses and normalization.

### Hermitian Q nerve realization

**comparison; `GN.6/hermitian-q-nerve-realization`.** Take the pinned category nerve of a small model of Qh(E), apply the supplied geometric realization functor and realize the forgetful natural transformation. The zero symmetric space gives the fibre base point.

Proof/construction outline: 1. Apply the native nerve functor to the actual quotient category. 2. Use the owner realization and its vertex map; check small-model equivalence and the zero vertex.

Direct prerequisites: `GN.6/hermitian-q-forgetful-functor`, `StableHomotopyKTheory:H.1`, `StableHomotopyKTheory:H.2`, `mathlib:CategoryTheory.nerve`, `mathlib:CategoryTheory.nerveMap`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Definition 4.4, printed p.117; topology interface is requested, not an invented realization. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/grothendieck-witt-space`: Uses hermitian q nerve realization with the displayed hypotheses and normalization.

### Grothendieck–Witt space of an exact category

**construction; `GN.6/grothendieck-witt-space`.** GW(E) is the pointed homotopy fibre over the zero object of |Qʰ(E)|→|Q(E)|.

Hypotheses and conventions: Use actual nerve realization, homotopy fibre and homotopy groups from the topology owners. No assumption 2 is invertible is needed for Schlichting’s exact-category model.

Proof/construction outline: 1. Realize the nerves of the typed forgetful functor. 2. Take its pointed homotopy fibre with the zero-space base point. 3. Transport orthogonal sum to the homotopy groups and prove naturality for nonsingular exact form functors.

Direct prerequisites: `GN.6/hermitian-q-nerve-realization`

API contracts:

- `grothendieckWittSpace` (constructor; native signature elaborated): The specified pointed homotopy fibre.
- `grothendieckWittSpace_fibration` (relation; supplier signature unmatched): GW(E)→|QʰE|→|QE| is the defining fibre sequence.
- `grothendieckWittSpace_map` (functoriality; native signature elaborated): Nonsingular exact form functors induce pointed maps.

Mathematical test contracts:

- `grothendieck_witt_space_test_1` (characterisation): The base point is the zero object, not an arbitrary unrecorded form.
- `grothendieck_witt_space_test_2` (characterisation): For the hyperbolic category HE, GW(HE)≃K(E).
- `grothendieck_witt_space_test_3` (characterisation): GW_i is a homotopy degree; a four-periodic shifted-duality statement does not say GW_i≅GW_{i+4}.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Definition 4.4 and Definition 4.12, printed pp.117–118,122. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Definition 4.4 and Definition 4.12, printed pp.117–118,122`: Grothendieck–Witt space of an exact category supplies the corresponding staged target or its next declaration.

### Formation

**definition; `GN.6/formation`.** A formation is a perfect symmetric space with two specified admissible Lagrangians. An isometry must carry each named Lagrangian to the corresponding one.

Proof/construction outline: 1. Retain the two inclusion maps, their exact quotients and the commuting carrier isomorphisms.

Direct prerequisites: `GN.6/exact-lagrangian`, `GN.6/symmetric-isometry-classes`

API contracts:

- `Formation` (constructor; native signature elaborated): A symmetric space and two actual ExactLagrangian objects.
- `Formation.first` (projection; native signature elaborated): The first admissible Lagrangian.
- `Formation.second` (projection; native signature elaborated): The second admissible Lagrangian.
- `Formation.swap` (constructor; native signature elaborated): Exchange the two named Lagrangians.

Mathematical test contracts:

- `formation_test_1` (characterisation): Using the same Lagrangian twice gives a trivial formation class.
- `formation_test_2` (characterisation): Interchanging the Lagrangians reverses its class.
- `formation_test_3` (characterisation): Over Q, the two coordinate Lagrangians of the hyperbolic plane are a formation; a non-isotropic coordinate does not qualify.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), §4.3, printed pp.119–120. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/formation-group`: Uses formation with the displayed hypotheses and normalization.

### Formation group

**construction; `GN.6/formation-group`.** The formation group is the free abelian group on formation isometry classes, modulo orthogonal additivity, concatenation [L1,L2]+[L2,L3]=[L1,L3], and common admissible isotropic reduction.

Proof/construction outline: 1. Construct the isometry-class setoid, then the subgroup generated by the three stated relation families. 2. Take the native abelian quotient and prove its universal property.

Direct prerequisites: `GN.6/formation`, `GN.6/orthogonal-sum`, `GN.6/isotropic-reduction`, `mathlib:FreeAbelianGroup`

API contracts:

- `FormationGroup` (constructor; native signature elaborated): The actual group quotient by the three relation families.
- `FormationGroup.of` (constructor; native signature elaborated): The class of a formation.
- `FormationGroup.concat` (relation; native signature elaborated): The three-Lagrangian concatenation relation.
- `FormationGroup.reduce` (relation; native signature elaborated): Common admissible isotropic reduction leaves the class unchanged.
- `FormationGroup.lift` (universal-property; native signature elaborated): A function on formation classes respecting all three relations induces a unique additive map.

Mathematical test contracts:

- `formation_group_test_1` (characterisation): The class [L,L] is zero by concatenation.
- `formation_group_test_2` (characterisation): Swapping gives its additive negative.
- `formation_group_test_3` (characterisation): Reducing both Lagrangians by a common admissible isotropic subobject preserves the formation class.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), §4.3, printed pp.119–120. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/formation-loop-comparison`: Uses formation group with the displayed hypotheses and normalization. `GN.6/formation-hyperbolic-kernel`: Uses formation group with the displayed hypotheses and normalization.

### Formation loop comparison

**comparison; `GN.6/formation-loop-comparison`.** Sending (X,L1,L2) to the loop formed by the L1 path followed by the inverse L2 path identifies the formation group with π1|Qh E| at zero.

Proof/construction outline: 1. Use strong monoidal cofinality to pass from stably metabolic to metabolic objects. 2. Insert a chosen Lagrangian path at every loop vertex to express a loop in formation generators. 3. The inverse functor to the one-object formation group uses pullback of the chosen Lagrangian; the three relations prove its composition law.

Direct prerequisites: `GN.6/formation-group`, `GN.6/hermitian-q-construction`, `StableHomotopyKTheory:H.4`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Proposition 4.9 and full proof, printed pp.120–121; Lemma 4.15 full proof pp.123–124. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/grothendieck-witt-space-components`: Uses formation loop comparison with the displayed hypotheses and normalization.

### Witt group as the hyperbolic cokernel

**lemma; `GN.6/witt-hyperbolic-cokernel`.** For a small exact category with strong exact duality, K0(E) --H--> GW0(E) -> W0(E) -> 0 is exact.

Hypotheses and conventions: K₀ is the imported exact Grothendieck group. The duality involution can act nontrivially on K₀; multiplication by two is only a specialization when it acts trivially.

Proof/construction outline: 1. The symmetric-space generators surject onto W0. 2. The metabolic relation defining GW0 identifies a metabolic class with its hyperbolic Lagrangian class. Quotienting by im H therefore gives exactly the metabolic quotient defining W0.

Direct prerequisites: `GN.6/exact-grothendieck-witt-group`, `GN.6/exact-witt-group`, `GN.6/grothendieck-witt-hyperbolic-map`

Acceptance: Each hyperbolic class maps to zero in the Witt group.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 2.8 and proof, printed p.112. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `GN.6/hyperbolic-forgetful-relations`: Separate the declaration-sized input from the bundled consuming declaration.

### Formation detects hyperbolic kernel

**lemma; `GN.6/formation-hyperbolic-kernel`.** The homomorphism from formations to ExactK0 sending a formation to [L1]−[L2] has image equal to the kernel of the hyperbolic homomorphism.

Proof/construction outline: 1. Both Lagrangians identify the same metabolic GW class, so their difference maps to zero. 2. An equality of hyperbolic classes is represented after stabilization by a metabolic isometry; its two transported Lagrangians give the required preimage.

Direct prerequisites: `GN.6/formation-group`, `GN.6/grothendieck-witt-hyperbolic-map`, `GN.6/witt-hyperbolic-cokernel`, `tauceti:TauCeti.ExactK0.of`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 4.10 and full proof, printed p.121. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/grothendieck-witt-space-components`: Uses formation detects hyperbolic kernel with the displayed hypotheses and normalization.

### Degree-zero comparison for the GW space

**comparison; `GN.6/grothendieck-witt-space-components`.** There is a natural additive isomorphism π₀GW(E)≅GW₀(E) with the previously defined metabolic presentation, compatible with forgetful and hyperbolic maps.

Hypotheses and conventions: Essentially small exact category with strong exact duality; no 1/2 assumption.

Proof/construction outline: 1. Use formations to identify π₁|QʰE| and W₀(E) to identify π₀|QʰE|. 2. Compare the fibre long exact sequence with GW_form→K₀→GW₀→W₀→0. 3. Apply the source five-lemma argument; the formation presentation and its path-loop proof are recorded refinements.

Direct prerequisites: `GN.6/grothendieck-witt-space`, `GN.6/exact-grothendieck-witt-group`, `GN.6/exact-witt-group`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GN.6/formation-loop-comparison`, `GN.6/formation-hyperbolic-kernel`

Mathematical test contracts:

- `grothendieck_witt_space_components_test_1` (characterisation): The comparison respects the hyperbolic image of an actual exact object.
- `grothendieck_witt_space_components_test_2` (characterisation): The degree-zero class is the metabolic GW presentation, not just unconstrained free isometry classes.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Proposition 4.11 and full proof, printed pp.121–122. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Proposition 4.11 and full proof, printed pp.121–122`: Degree-zero comparison for the GW space supplies the corresponding staged target or its next declaration.

### Canonical residue duality coefficient

**comparison; `GN.6/dedekind-residue-duality-line`.** For a Dedekind ring R, nonzero prime p and line bundle M with involution, the right adjoint residue dual coefficient RHom_R(R/p,M) is canonically (p^−1M/M)[−1]. A choice of uniformizer identifies p^−1M/M with M/pM; this last identification is not canonically natural under ramified base change.

Hypotheses and conventions: Use derived Hom with its actual shift and residue-module structure. A uniformizer choice is recorded when replacing the canonical coefficient by the unshifted residue line.

Proof/construction outline: 1. Resolve R/p by [p→R] and apply derived Hom into M. 2. Use invertibility of p and M to identify the cofiber M→p^−1M and the shift. 3. Multiply by a chosen local uniformizer for the choice-dependent residue-line identification.

Direct prerequisites: `GN.6/grothendieck-witt-space`

Mathematical test contracts:

- `dedekind_residue_duality_line_test_1` (characterisation): The residue term has a −1 duality shift, not degree zero.
- `dedekind_residue_duality_line_test_2` (characterisation): For Z→Z[i] at 2, the integer 2 does not become a uniformizer at (1+i), so the naive residue-field identity is not the induced map.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Lemma 2.2.2 and proof, physical p.37. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Lemma 2.2.2 and proof, physical p.37`: Canonical residue duality coefficient supplies the corresponding staged target or its next declaration.

### Symmetric Grothendieck–Witt localization for Dedekind rings

**theorem; `GN.6/dedekind-symmetric-localization`.** Atlas planet: Symmetric GW localization. For R,M as above, a set S of nonzero primes and every duality shift r, there is a canonical fibre sequence ⊕_{p∈S}GW(R/p;Q^s_{RHom_R(R/p,M)}[r])→GW(R;Q^s_M[r])→GW(R_S;Q^s_{M_S}[r]). With chosen uniformizers the left coefficient is (M/pM)[r−1].

Hypotheses and conventions: This is the symmetric Poincaré flavour at the spectrum level. No 2-unit assumption is imposed for this theorem; the analogous quadratic spectrum sequence fails at dyadic primes without additional restrictions.

Proof/construction outline: 1. Use the residue-duality-line comparison. 2. Apply the source symmetric dévissage equivalence on torsion perfect complexes and its canonical localization. 3. For infinite S pass through finite subsets using the imported filtered-colimit compatibility. Source generic surgery/Poincaré localization and Witt dévissage remain exact inputs.

Direct prerequisites: `GN.6/dedekind-residue-duality-line`

Mathematical test contracts:

- `dedekind_symmetric_localization_test_1` (characterisation): The left shift is r−1 after a uniformizer choice.
- `dedekind_symmetric_localization_test_2` (characterisation): Quadratic L-theory at the prime 2 cannot simply replace symmetric L-theory in this sequence.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Theorem 2.2.4, Corollary 2.2.5 and Remark 2.2.6, physical pp.38–39. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Theorem 2.2.4, Corollary 2.2.5 and Remark 2.2.6, physical pp.38–39`: Symmetric Grothendieck–Witt localization for Dedekind rings supplies the corresponding staged target or its next declaration.

### Hermitian filtering localization

**theorem; `GN.6/schlichting-filtering-localization`.** For a duality-preserving s-filtering inclusion A⊂U of exact categories with strong duality, with A idempotent complete, |QʰA|→|QʰU|→|Qʰ(U/A)| is a pointed homotopy fibre sequence over zero.

Hypotheses and conventions: The four source s-filtering conditions and idempotent completeness are retained. The map W₀(U)→W₀(U/A) need not be surjective.

Proof/construction outline: 1. Import the actual exact quotient by weak isomorphisms from ordinary exact K-theory. 2. Descend the exact duality and pairing square to the quotient. 3. Apply the source hermitian localization proof, with its zero-component/base-point control; the full §8 proof is a gap.

Direct prerequisites: `GN.6/hermitian-q-construction`

Mathematical test contracts:

- `schlichting_filtering_localization_test_1` (characterisation): A fully exact inclusion without the four s-filtering conditions is not enough.
- `schlichting_filtering_localization_test_2` (characterisation): Idempotent completeness of A is an explicit hypothesis.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), §8.1, Theorem 8.2 and Remark 8.3, printed pp.140–141. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `§8.1, Theorem 8.2 and Remark 8.3, printed pp.140–141`: Hermitian filtering localization supplies the corresponding staged target or its next declaration.

### Source-scoped shifted Karoubi periodicity

**comparison; `GN.6/shifted-karoubi-periodicity`.** For a dg category with weak equivalences and duality whose mapping complexes are uniquely 2-divisible, the shifted classical GW spectra satisfy GW^[r+4](A) equivalent to GW^[r](A). This shifts the duality index, not the higher homotopy degree.

Hypotheses and conventions: The dg model, weak equivalences and pretriangulated/smallness conventions are those of Schlichting. This theorem does not assert integral four-periodicity for genuine symmetric GW at dyadic coefficients.

Proof/construction outline: 1. Construct the actual shifted duality models, with their sign conventions, from the routed hermitian framework. 2. Transport their four-shift equivalence through the classical dg comparison; that comparison is an explicit gap.

Direct prerequisites: `GN.6/grothendieck-witt-space`, `GeneralAlgebraicKTheory:K.4:construction/S-construction`, `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`

Mathematical test contracts:

- `shifted_karoubi_periodicity_test_1` (characterisation): The equality relates shift r with r+4 while keeping homotopy degree fixed.
- `shifted_karoubi_periodicity_test_2` (characterisation): The hypothesis 2 invertible cannot be removed by citing the characteristic-free exact-category definitions.

Source/derivation: [SchlichtingDerived](https://arxiv.org/pdf/1209.0848v3), Introduction, physical pp.2–4; Theorems 6.1–6.2 are announced here. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Introduction, physical pp.2–4; Theorems 6.1–6.2 are announced here`: Source-scoped shifted Karoubi periodicity supplies the corresponding staged target or its next declaration.

### Number-ring homotopy-limit comparison

**theorem; `GN.6/number-ring-homotopy-limit`.** For a Dedekind ring R whose fraction field is a number field, a line bundle M with involution ±1 and any duality shift r, GW(R;Q^s_M[r])→K(R;Q^s_M[r])^{hC₂} is a 2-adic equivalence. Its classical symmetric connective-cover specialization is an equivalence in nonnegative degrees after 2-completion.

Hypotheses and conventions: Do not replace 2-adic completion by localization at 2 or claim an integral equivalence in the presence of real embeddings. The generic spectrum/homotopy-fixed-point carrier is imported from the new hermitian owner.

Proof/construction outline: 1. Invert 2 in R and use the imported finite-vcd₂ homotopy-limit theorem. 2. Compare the finite sum of dyadic residue terms using the even-finite-field theorem. 3. Use symmetric localization and the fibre-sequence comparison to recover the middle 2-adic equivalence.

Direct prerequisites: `GN.6/dedekind-symmetric-localization`

Mathematical test contracts:

- `number_ring_homotopy_limit_test_1` (characterisation): A number ring with real places requires 2-completion; the rational signature contribution prevents the unqualified integral statement.
- `number_ring_homotopy_limit_test_2` (characterisation): Classical connective groups give the nonnegative-degree specialization.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Theorem 3.1.7 and full proof, physical pp.51–52. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Theorem 3.1.7 and full proof, physical pp.51–52`: Number-ring homotopy-limit comparison supplies the corresponding staged target or its next declaration.

### Berrick–Karoubi comparison after inverting two

**theorem; `GN.6/number-ring-invert-two-comparison`.** For a Dedekind ring R with number-field fraction field and epsilon=±1, GW^s(R;epsilon)→GW^s(R[1/2];epsilon) is a 2-local equivalence on connected covers, hence in strictly positive homotopy degrees, and is injective in degree zero.

Hypotheses and conventions: A degree-zero isomorphism is not asserted. 2-local equivalence is distinct from the preceding 2-adic homotopy-limit comparison.

Proof/construction outline: 1. Identify the fibre by the dyadic residue localization terms with duality shift −1. 2. Use the even finite-field comparison and odd-torsion positive K-groups to make that fibre 2-locally (−1)-truncated with zero π₀. 3. Read the fibre long exact sequence to obtain the stated positive-degree isomorphisms and π₀ injectivity.

Direct prerequisites: `GN.6/dedekind-symmetric-localization`, `GN.6/number-ring-homotopy-limit`

Mathematical test contracts:

- `number_ring_invert_two_comparison_test_1` (characterisation): The map on π₀ is injective; it need not be surjective.
- `number_ring_invert_two_comparison_test_2` (characterisation): The theorem compares R with R[1/2], not GW with ordinary K without duality.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Proposition 3.1.11 and proof, physical p.53. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `Proposition 3.1.11 and proof, physical p.53`: Berrick–Karoubi comparison after inverting two supplies the corresponding staged target or its next declaration.

### Higher Grothendieck–Witt groups

**definition; `GN.6/higher-grothendieck-witt-groups`.** For i≥0, GW_i(E)=π_i of the pointed Grothendieck–Witt fibre space; in degree zero use its canonical abelian H-space component group, not a shifted-duality index.

Hypotheses and conventions: Use actual pointed homotopy groups and orthogonal sum.

Proof/construction outline: 1. Take the native pointed homotopy groups of the fibre. 2. Use orthogonal sum for the degree-zero group law and naturality.

Direct prerequisites: `GN.6/grothendieck-witt-space`, `mathlib:HomotopyGroup`, `mathlib:HomotopyGroup.pi0EquivZerothHomotopy`

API contracts:

- `higherGrothendieckWittGroup` (constructor; native signature elaborated): Pointed homotopy group of the Grothendieck–Witt fibre.
- `higherGrothendieckWittGroup_map` (functoriality; native signature elaborated): Nonsingular exact form functors induce group maps.
- `higherGrothendieckWittGroup_zero` (compatibility; native signature elaborated): Native π0 as a type is equivalent to path components of the fibre. Its canonical abelian H-space law and comparison with exact GW0 are the separate components theorem and H.4 interface.

Mathematical test contracts:

- `higher_grothendieck_witt_groups_test_1` (characterisation): GW_0 agrees with the exact presentation, including metabolic relations.
- `higher_grothendieck_witt_groups_test_2` (characterisation): For HE the higher groups agree with ordinary K_i(E).
- `higher_grothendieck_witt_groups_test_3` (characterisation): For the terminal pointed fibre, each pointed homotopy group is a singleton; this does not use a duality shift or a periodicity hypothesis.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), printed pp.121–122, Proposition 4.11 and Definition 4.12. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `printed pp.121–122, Proposition 4.11 and Definition 4.12`: Higher Grothendieck–Witt groups supplies the corresponding staged target or its next declaration.

### Hermitian cone diagrams

**definition; `GN.6/hermitian-cone-diagrams`.** C0(E,E) is the full subcategory of functors on the linear order N⊔N-op, all forward positions preceding every backward position. Forward arrows are inflations, backward arrows deflations. For a uniform k, all crossing arrows U_i→U^(i+k) are inflations and U_(i+k)→U^i deflations.

Proof/construction outline: 1. Use the native ordered category on the lexicographic sum and the native functor category. 2. Keep the uniform crossing bound, not a separate bound for each i.

Direct prerequisites: `GN.6/exact-category-duality`, `mathlib:CategoryTheory.ObjectProperty.FullSubcategory`

API contracts:

- `HermitianConeDiagram` (constructor; native signature elaborated): The full-subcategory object is an actual functor with the specified admissibility conditions.
- `HermitianConeDiagram.diagram` (projection; native signature elaborated): The underlying native functor on N⊔N-op.
- `HermitianConeDiagram.constant` (constructor; native signature elaborated): Embed an exact object as its constant diagram.
- `HermitianConeDiagram.crossingBound` (characterisation; native signature elaborated): A single natural number controls both crossing families.

Mathematical test contracts:

- `hermitian_cone_diagrams_test_1` (characterisation): Constant diagrams satisfy the conditions with k=0.
- `hermitian_cone_diagrams_test_2` (characterisation): A diagram whose forward map is multiplication by 2 on a projective Z-module fails inflation.
- `hermitian_cone_diagrams_test_3` (characterisation): Separate crossing bounds that are unbounded in i do not supply a cone object.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), §9.1, printed pp.154–155. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/cone-pointwise-extension-closed`: Uses hermitian cone diagrams with the displayed hypotheses and normalization. `GN.6/hermitian-cone-shifts`: Uses hermitian cone diagrams with the displayed hypotheses and normalization. `GN.6/cone-zero-extension-shift`: Uses hermitian cone diagrams with the displayed hypotheses and normalization.

### Cone diagrams are extension closed

**lemma; `GN.6/cone-pointwise-extension-closed`.** The cone conditions are closed under pointwise conflations, giving the induced exact structure on C0(E,E).

Proof/construction outline: 1. Use exact-category inflation/deflation composition and the extension diagram lemma. 2. Take the maximum of the two crossing bounds and enlarge it through the forward and backward admissible arrows.

Direct prerequisites: `GN.6/hermitian-cone-diagrams`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), §9.1, printed p.155. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/cone-localization-exactness`: Uses cone diagrams are extension closed with the displayed hypotheses and normalization.

### Hermitian cone shifts

**construction; `GN.6/hermitian-cone-shifts`.** The forward-row shift U[k] replaces U_i by U_(i+k) and leaves U^i unchanged; the backward-row shift U^[k] replaces U^i by U^(i+k) and leaves U_i unchanged. Their natural maps are U→U[k] and U^[k]→U. The shifts commute and preserve pointwise conflations.

Proof/construction outline: 1. Reindex the functor using monotone maps of the ordered index. 2. The comparison maps are the original structure arrows.

Direct prerequisites: `GN.6/hermitian-cone-diagrams`

API contracts:

- `coneLowerShift` (constructor; native signature elaborated): The lower-row reindexing exact endofunctor.
- `coneUpperShift` (constructor; native signature elaborated): The upper-row reindexing exact endofunctor.
- `coneLowerShiftMap` (data; native signature elaborated): The natural map from the identity to the lower shift.
- `coneUpperShiftMap` (data; native signature elaborated): The natural map from the upper shift to the identity.

Mathematical test contracts:

- `hermitian_cone_shifts_test_1` (characterisation): The zero shift is the identity.
- `hermitian_cone_shifts_test_2` (characterisation): Two lower shifts add their indices.
- `hermitian_cone_shifts_test_3` (characterisation): A lower and an upper shift commute.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), §9.1, printed p.155. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/cone-duality-exchanges-shifts`: Uses hermitian cone shifts with the displayed hypotheses and normalization. `GN.6/cone-fraction-morphisms`: Uses hermitian cone shifts with the displayed hypotheses and normalization. `GN.6/cone-constant-filtering`: Uses hermitian cone shifts with the displayed hypotheses and normalization.

### Cone fraction morphisms

**construction; `GN.6/cone-fraction-morphisms`.** The cone morphisms U→V are the filtered colimit of Hom_C0(U^[i],V[j]); representatives agree after sufficiently increasing both shift indices.

Proof/construction outline: 1. Build the explicit eventual-equality setoid of shifted representative maps. 2. Its quotient realizes the localization of the two shift families.

Direct prerequisites: `GN.6/hermitian-cone-shifts`

API contracts:

- `ConeFraction` (constructor; native signature elaborated): A shifted middle map and its two indices.
- `ConeFraction.equivalent` (characterisation; native signature elaborated): Equality after a common larger shift.
- `ConeFraction.comp` (constructor; native signature elaborated): Shift the two representatives to compose; the new indices are their sums.
- `ConeFraction.toLocalization` (compatibility; native signature elaborated): The universal comparison to native categorical localization.

Mathematical test contracts:

- `cone_fraction_morphisms_test_1` (characterisation): Unshifted maps embed faithfully.
- `cone_fraction_morphisms_test_2` (characterisation): Every lower and upper comparison map becomes invertible.
- `cone_fraction_morphisms_test_3` (characterisation): Constant-diagram morphisms agree with the original E morphisms.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Definition 9.1, printed pp.155–156. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/cone-fraction-composition`: Uses cone fraction morphisms with the displayed hypotheses and normalization.

### Cone fraction composition laws

**lemma; `GN.6/cone-fraction-composition`.** The representative g[j] composed with f^[k] defines associative, representative-independent composition with the shift comparisons as identities.

Proof/construction outline: 1. Use commuting shifts and naturality of their maps. 2. Common refinements prove the congruence and both identity laws.

Direct prerequisites: `GN.6/cone-fraction-morphisms`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Definition 9.1, printed pp.155–156. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/cone-localization-exactness`: Uses cone fraction composition laws with the displayed hypotheses and normalization. `GN.6/cone-swindle-descends`: Uses cone fraction composition laws with the displayed hypotheses and normalization.

### Cone duality exchanges shifts

**lemma; `GN.6/cone-duality-exchanges-shifts`.** Dualizing a cone diagram exchanges its forward and backward rows and interchanges the lower and upper shifts, reversing the comparison maps.

Proof/construction outline: 1. Apply the original contravariant exact duality pointwise and reverse the linear-sum index.

Direct prerequisites: `GN.6/hermitian-cone-shifts`, `GN.6/exact-category-duality`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), §9.1, printed p.155. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/cone-localization-exactness`: Uses cone duality exchanges shifts with the displayed hypotheses and normalization.

### Cone localization exactness

**lemma; `GN.6/cone-localization-exactness`.** A sequence in C(E,E) is a conflation exactly when it is isomorphic to a localized pointwise conflation; these sequences form an exact structure and duality descends.

Proof/construction outline: 1. Move a finite family of representatives to a common pair of shifts. 2. Pointwise admissible pushouts/pullbacks descend faithfully; prove composition and existence of each required square. 3. Apply the exchanged-shift duality to get the opposite axioms.

Direct prerequisites: `GN.6/cone-pointwise-extension-closed`, `GN.6/cone-fraction-composition`, `GN.6/cone-duality-exchanges-shifts`, `mathlib:CategoryTheory.MorphismProperty.Localization`, `mathlib:CategoryTheory.MorphismProperty.Q`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 9.2 and full proof, printed pp.156–158. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/hermitian-cone-category`: Uses cone localization exactness with the displayed hypotheses and normalization. `GN.6/cone-constant-fully-faithful`: Uses cone localization exactness with the displayed hypotheses and normalization. `GN.6/cone-relative-quotient-equivalence`: Uses cone localization exactness with the displayed hypotheses and normalization.

### Constant cone embedding is fully exact

**lemma; `GN.6/cone-constant-fully-faithful`.** The constant-diagram embedding E→C(E,E) is fully faithful, exact and reflects conflations.

Proof/construction outline: 1. Every shift of a constant is constant, so the morphism colimit is unchanged. 2. The representative conflation after shifts has the original componentwise kernel/cokernel data.

Direct prerequisites: `GN.6/cone-localization-exactness`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 9.3 and full proof, printed pp.158–159. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/hermitian-cone-category`: Uses constant cone embedding is fully exact with the displayed hypotheses and normalization. `GN.6/cone-constant-filtering`: Uses constant cone embedding is fully exact with the displayed hypotheses and normalization.

### Hermitian cone category

**construction; `GN.6/hermitian-cone-category`.** For the small exact category E with strong exact duality, C(E,E) is the exact diagram category of Schlichting section 9.1, localized at its specified shift morphisms, with induced strong exact duality and its embedded copy of E.

Hypotheses and conventions: C(E,E) is the filtered diagram/cone category of §9, not a ring of dummy symbols. Do not replace a hermitian cone by the ordinary K-theory cone without a duality comparison.

Proof/construction outline: 1. Use the source filtered diagram objects and morphisms, not formal ring symbols. 2. Localize at the shift maps and descend the exact structure and strong duality. 3. Verify the source s-filtering embedding before constructing the quotient.

Direct prerequisites: `GN.6/cone-localization-exactness`, `GN.6/cone-constant-fully-faithful`

API contracts:

- `hermitianCone` (constructor; native signature elaborated): The diagram cone category with exact structure and strong duality.
- `hermitianConeLocalization` (data; native signature elaborated): The canonical functor from genuine cone diagrams to their shift localization.
- `hermitianConeLocalization_inverts` (functoriality; native signature elaborated): Each specified shift morphism becomes an isomorphism under that localization.

Mathematical test contracts:

- `hermitian_cone_test_1` (degenerate): The cone of the zero exact category is equivalent to the zero exact category.
- `hermitian_cone_test_2` (characterisation): The shift maps chosen for localization become isomorphisms.
- `hermitian_cone_test_3` (compatibility): The embedded E objects retain their original morphisms, exact conflations and pairings.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), §9.1, Definition 9.1 and Lemmas 9.2–9.4, printed pp.154–160. Full diagram and fraction constructions and their exactness proofs read in this revision.

Use: `GN.6/hermitian-suspension`: Separate the declaration-sized input from the bundled consuming declaration.

### Constant cone embedding is s-filtering

**lemma; `GN.6/cone-constant-filtering`.** For idempotent-complete E, its fully exact constant inclusion into C(E,E) satisfies all four s-filtering conditions.

Proof/construction outline: 1. Truncate a representative at a sufficiently late index to factor a map through a constant object. 2. Use the uniform crossing condition for the special inflation and deflation factorizations. 3. Split the resulting idempotent when the special condition requires a summand.

Direct prerequisites: `GN.6/cone-constant-fully-faithful`, `GN.6/hermitian-cone-shifts`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 9.3 full proof, printed pp.158–159. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/hermitian-suspension`: Uses constant cone embedding is s-filtering with the displayed hypotheses and normalization. `GN.6/cone-relative-quotient-equivalence`: Uses constant cone embedding is s-filtering with the displayed hypotheses and normalization.

### Hermitian suspension of an exact category

**construction; `GN.6/hermitian-suspension`.** For idempotent-complete exact E with strong exact duality, S_h E=C(E,E)/E is Schlichting's hermitian suspension, the actual filtering exact quotient of the diagram cone, equipped with its induced strong exact duality.

Hypotheses and conventions: C(E,E) is the filtered diagram/cone category of §9, not a ring of dummy symbols. Do not replace a hermitian cone by the ordinary K-theory cone without a duality comparison.

Proof/construction outline: 1. Form the source exact quotient of the s-filtering embedding E into its cone. 2. Descend the diagram strong exact duality to the quotient.

Direct prerequisites: `GN.6/hermitian-cone-category`, `GN.6/schlichting-filtering-localization`, `GN.6/cone-constant-filtering`

API contracts:

- `hermitianSuspension` (constructor; supplier signature unmatched): The specified exact quotient with induced strong duality.
- `hermitianSuspension_map` (functoriality; supplier signature unmatched): Compatible exact form functors induce suspension form functors.
- `hermitianSuspension_duality` (compatibility; supplier signature unmatched): The quotient form functor from the cone intertwines the induced suspension duality with the cone duality.

Mathematical test contracts:

- `hermitian_suspension_test_1` (characterisation): The cone GW space is contractible by id⊥T≅T.
- `hermitian_suspension_test_2` (characterisation): The quotient is by the embedded E and retains exact duality.
- `hermitian_suspension_test_3` (degenerate): Every constant diagram from E has zero image in the filtering quotient C(E,E)/E.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), printed pp.159–162, Lemma 9.5, Corollary 9.6, Definition 9.10. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `printed pp.159–162, Lemma 9.5, Corollary 9.6, Definition 9.10`: Hermitian suspension of an exact category supplies the corresponding staged target or its next declaration.

### Cone zero extension shift

**construction; `GN.6/cone-zero-extension-shift`.** The simultaneous backward shift [-1] inserts zero at index 0 in both rows and takes the old (i−1)-component at i≥1; it is exact and duality-preserving.

Proof/construction outline: 1. Define all maps incident to the inserted zero as zero. 2. Reindex the remaining maps and increase the uniform crossing bound.

Direct prerequisites: `GN.6/hermitian-cone-diagrams`

API contracts:

- `coneZeroExtension` (constructor; native signature elaborated): The native diagram functor with the initial zero inserted.
- `coneZeroExtension_zero` (simp; native signature elaborated): Both components at zero are zero objects.
- `coneZeroExtension_successor` (simp; native signature elaborated): Both successor components recover the original components.

Mathematical test contracts:

- `cone_zero_extension_shift_test_1` (characterisation): The new zero-position component is zero.
- `cone_zero_extension_shift_test_2` (characterisation): Its index-one component is the original index-zero component.
- `cone_zero_extension_shift_test_3` (characterisation): Duality commutes with this simultaneous shift.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 9.5 proof, printed p.160. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/cone-swindle-endofunctor`: Uses cone zero extension shift with the displayed hypotheses and normalization.

### Hermitian cone swindle functor

**construction; `GN.6/cone-swindle-endofunctor`.** T is the pointwise sum of all nonnegative iterates of the zero-extension shift. At index i only the first i+1 terms contribute, so no countable coproduct hypothesis on E is introduced.

Proof/construction outline: 1. Use finite biproducts at each index and compatible finite inclusions on the diagram arrows. 2. Pointwise exactness and the simultaneous duality give an exact form functor.

Direct prerequisites: `GN.6/cone-zero-extension-shift`, `GN.6/orthogonal-sum`

API contracts:

- `coneSwindle` (constructor; native signature elaborated): The locally finite diagonal sum exact endofunctor.
- `coneSwindle_component` (simp; native signature elaborated): The i-th component is the finite sum of shifted source components.
- `coneSwindle_duality` (compatibility; native signature elaborated): The simultaneous dual shift makes T a form functor.

Mathematical test contracts:

- `cone_swindle_endofunctor_test_1` (characterisation): At index zero T has the original zero-index object.
- `cone_swindle_endofunctor_test_2` (characterisation): At index one its component is U1⊕U0.
- `cone_swindle_endofunctor_test_3` (characterisation): For the zero diagram every component is zero.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 9.5 proof, printed pp.160–161. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/cone-swindle-descends`: Uses hermitian cone swindle functor with the displayed hypotheses and normalization.

### Cone swindle descends to localization

**lemma; `GN.6/cone-swindle-descends`.** T sends both shift comparison families to isomorphisms in C(E,E), hence descends as an exact form endofunctor.

Proof/construction outline: 1. Assemble the source α_l maps, whose only exceptional component is a zero map at l−1. 2. The two comparison-map identities make the diagonals invertible after localization and hence make T(e) invertible.

Direct prerequisites: `GN.6/cone-swindle-endofunctor`, `GN.6/cone-fraction-composition`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 9.5 proof, printed p.161. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/cone-swindle-absorption`: Uses cone swindle descends to localization with the displayed hypotheses and normalization.

### Hermitian swindle absorption

**lemma; `GN.6/cone-swindle-absorption`.** On the localized cone, the exact form functors id orthogonal-sum T and T are naturally isometric.

Proof/construction outline: 1. Reindex the locally finite sum to get id⊥T[-1]≅T. 2. The shift comparison zigzag gives a form isometry [-1]≅id after localization.

Direct prerequisites: `GN.6/cone-swindle-descends`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 9.5 proof, printed pp.160–161. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/hermitian-cone-contractible`: Uses hermitian swindle absorption with the displayed hypotheses and normalization.

### Orthogonal additivity on GW spaces

**comparison; `GN.6/hermitian-orthogonal-additivity`.** Orthogonal sum of exact form functors induces the sum of their maps on the pointed GW H-space; a natural form isometry gives a homotopy.

Proof/construction outline: 1. Realize the orthogonal-sum functor and natural transformations. 2. Use the supplied grouplike H-space and based-homotopy conventions.

Direct prerequisites: `GN.6/grothendieck-witt-space`, `GN.6/orthogonal-sum`, `StableHomotopyKTheory:H.4`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), §4.2 and Corollary 9.6 proof, printed pp.118,161. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/hermitian-cone-contractible`: Uses orthogonal additivity on gw spaces with the displayed hypotheses and normalization.

### Contractibility of the hermitian cone space

**lemma; `GN.6/hermitian-cone-contractible`.** GW(C(E,E)) is contractible, using the source exact form endofunctor T and its natural form isomorphism id orthogonal-sum T isomorphic to T.

Hypotheses and conventions: C(E,E) is the filtered diagram/cone category of §9, not a ring of dummy symbols. Do not replace a hermitian cone by the ordinary K-theory cone without a duality comparison.

Proof/construction outline: 1. Construct the actual diagram shift-sum functor T as in Lemma 9.5. 2. Apply hermitian additivity to id plus T isomorphic to T to contract the GW identity map. Ordinary K additivity alone does not prove this.

Direct prerequisites: `GN.6/cone-swindle-absorption`, `GN.6/hermitian-orthogonal-additivity`

Acceptance: The comparison retains the source hypotheses: C(E,E) is the filtered diagram/cone category of §9, not a ring of dummy symbols.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), printed pp.159–162, Lemma 9.5, Corollary 9.6, Definition 9.10. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `GN.6/hermitian-suspension`: Separate the declaration-sized input from the bundled consuming declaration.

### Hermitian suspension delooping

**theorem; `GN.6/hermitian-suspension-delooping`.** For idempotent-complete exact E with strong exact duality, GW(E) is equivalent to Omega GW(S_h E).

Hypotheses and conventions: No invertibility of two is imposed on this exact-category model.

Proof/construction outline: 1. Use hermitian filtering localization and the contractibility of the cone space to identify the pointed fibre with the loop space.

Direct prerequisites: `GN.6/hermitian-suspension`, `GN.6/schlichting-filtering-localization`, `GN.6/hermitian-cone-contractible`

Mathematical test contracts:

- `hermitian_suspension_delooping_test_1` (characterisation): Idempotent completion is explicitly retained before iteration.
- `hermitian_suspension_delooping_test_2` (characterisation): The analogous Ω|Qʰ(S_h E)| completion map is not always a π_0 isomorphism.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), printed p.162, Theorem 9.11 and Remark 9.12. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `printed p.162, Theorem 9.11 and Remark 9.12`: Hermitian suspension delooping supplies the corresponding staged target or its next declaration.

### Cofinal object complement

**lemma; `GN.6/cofinal-object-complement`.** For a full extension-closed cofinal inclusion A⊂B, every object X of B admits T with X⊕T in A.

Proof/construction outline: 1. This is the explicit cofinal hypothesis; retain fullness, exactness and extension closure separately.

Direct prerequisites: `GN.6/exact-category-duality`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), §5.1, printed p.124. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/cofinal-hermitian-comma-contraction`: Uses cofinal object complement with the displayed hypotheses and normalization.

### Cofinal hermitian comma contraction

**lemma; `GN.6/cofinal-hermitian-comma-contraction`.** The two comma-category inclusions in the proof of hermitian cofinality have contractible classifying spaces.

Proof/construction outline: 1. Use X⊕T in A to add a metabolic complement and construct the two natural transformations contracting the first comma category. 2. For a finite subcategory choose a common finite sum of complements of all span kernels. Its added hyperbolic Lagrangian makes the second inclusion null-homotopic. 3. Use the supplier finite-support property for sphere maps, then its Quillen Theorem A.

Direct prerequisites: `GN.6/cofinal-object-complement`, `GN.6/hyperbolic-space`, `GN.6/symmetric-diagonal-lagrangian`, `GN.6/hermitian-q-construction`, `StableHomotopyKTheory:H.2`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Theorem 5.1 full proof, printed pp.126–127. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/cofinal-hermitian-q-fibration`: Uses cofinal hermitian comma contraction with the displayed hypotheses and normalization.

### Cofinal hermitian Q fibration

**theorem; `GN.6/cofinal-hermitian-q-fibration`.** For a duality-preserving cofinal fully exact inclusion, |Qh A|→|Qh B|→|H(B,A)| is a homotopy fibration; H(B,A) is the comma category for the relative hyperbolic map K0(B,A)→GW0(B,A).

Proof/construction outline: 1. The relative target is a groupoid, so Quillen Theorem B applies. 2. The two comma contractions identify its fibre with Qh A.

Direct prerequisites: `GN.6/cofinal-hermitian-comma-contraction`, `GN.6/grothendieck-witt-hyperbolic-map`, `StableHomotopyKTheory:H.2`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Theorem 5.1, printed pp.126–127. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/cofinal-grothendieck-witt-comparison`: Uses cofinal hermitian q fibration with the displayed hypotheses and normalization.

### Grothendieck–Witt cofinality

**theorem; `GN.6/cofinal-grothendieck-witt-comparison`.** A duality-preserving cofinal inclusion induces isomorphisms on GW_i for i≥1 and a monomorphism on GW0. Surjectivity on GW0 is not asserted.

Proof/construction outline: 1. Compare hermitian and ordinary Q cofinality fibrations by their forgetful maps. 2. Take vertical fibres and use the relative hyperbolic comma description.

Direct prerequisites: `GN.6/cofinal-hermitian-q-fibration`, `GN.6/grothendieck-witt-space`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Corollary 5.2 and full proof, printed pp.127–128. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/hermitian-suspension-completion`: Uses grothendieck–witt cofinality with the displayed hypotheses and normalization.

### Loop comparison under hermitian completion

**comparison; `GN.6/hermitian-suspension-completion`.** The idempotent-completion map Omega GW(S_h E) -> Omega GW(completion(S_h E)) is an equivalence, by hermitian cofinality.

Hypotheses and conventions: No invertibility of two is imposed on this exact-category model.

Proof/construction outline: 1. Apply the actual hermitian cofinality theorem to the completion inclusion and loop the GW spaces. 2. Retain the source warning that the corresponding Qh-only loop map need not be a pi0 isomorphism.

Direct prerequisites: `GN.6/hermitian-suspension`, `GN.6/cofinal-grothendieck-witt-comparison`

Acceptance: The comparison retains the source hypotheses: No invertibility of two is imposed on this exact-category model.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), printed p.162, Theorem 9.11 and Remark 9.12. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `GN.6/hermitian-suspension-delooping`: Separate the declaration-sized input from the bundled consuming declaration.

### Nonconnective hermitian spectrum

**construction; `GN.6/nonconnective-hermitian-spectrum`.** Iterating idempotent-completed hermitian suspension gives the Omega-spectrum with levels GW(E), GW(completion(S_h E)), GW(completion(S_h^2 E)), and so on, and structure equivalences induced by hermitian delooping. Its homotopy groups in all integer degrees are the nonconnective hermitian groups.

Hypotheses and conventions: Keep hermitian structure maps and all idempotent completions. The sequence of |Qʰ(˜S_hⁿ E)| spaces alone is generally not an Ω-spectrum.

Proof/construction outline: 1. Iterate the actual suspension and completion functors. 2. Use the proved GW delooping equivalences as spectrum structure maps.

Direct prerequisites: `GN.6/hermitian-suspension-delooping`, `GN.6/hermitian-suspension-completion`, `GN.6/higher-grothendieck-witt-groups`

API contracts:

- `nonconnectiveHermitianSpectrum` (constructor; supplier signature unmatched): The completed hermitian-suspension Ω-spectrum.
- `nonconnectiveHermitianSpectrum_loop` (relation; supplier signature unmatched): Each adjacent structure map is a loop equivalence.
- `nonconnectiveHermitianSpectrum_homotopy` (characterisation; supplier signature unmatched): The homotopy group in any integer degree is the corresponding nonconnective hermitian group, with the fixed suspension convention.

Mathematical test contracts:

- `nonconnective_hermitian_spectrum_test_1` (degenerate): For the zero exact category, all integer-degree nonconnective hermitian groups are zero.
- `nonconnective_hermitian_spectrum_test_2` (characterisation): For HE negative groups recover nonconnective K groups.
- `nonconnective_hermitian_spectrum_test_3` (non-example): If an exact category has nonzero negative K group, its hyperbolic Qh-only tower fails an adjacent loop equivalence; replacing the fibre levels by Qh levels loses that group.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), printed p.162, Remark 9.12. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `printed p.162, Remark 9.12`: Nonconnective hermitian spectrum supplies the corresponding staged target or its next declaration.

### Isotropic graph is Lagrangian

**lemma; `GN.6/isotropic-graph-lagrangian`.** The graph L-perp→X⊕−Q given by its inclusion and quotient is an admissible Lagrangian.

Proof/construction outline: 1. Construct the graph as a composite of inflations using the pushout diagram. 2. The pairing cancellation is the pullback equation; the diagram identifies the exact quotient with D(L-perp).

Direct prerequisites: `GN.6/isotropic-quotient-perfect`, `GN.6/exact-lagrangian`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 2.6 proof, printed pp.110–111. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/isotropic-reduction-metabolic`: Uses isotropic graph is lagrangian with the displayed hypotheses and normalization.

### Metabolic comparison for isotropic reduction

**lemma; `GN.6/isotropic-reduction-metabolic`.** For the admissible isotropic subobject L and induced perfect quotient form of isotropic-reduction, X orthogonally summed with the negative quotient form is metabolic, with admissible Lagrangian L-perp mapped by inclusion and quotient.

Hypotheses and conventions: Both admissibility conditions are retained. The quotient is the exact-category quotient of the specified conflation.

Proof/construction outline: 1. Use the source conflation from L-perp into X plus its quotient. 2. Verify total isotropy by the defining pullback equation. Use the exact five-lemma to identify the dual quotient and prove the Lagrangian condition.

Direct prerequisites: `GN.6/isotropic-reduction`, `GN.6/isotropic-graph-lagrangian`, `GN.6/negative-symmetric-space`, `GN.6/orthogonal-sum`

Acceptance: At L=0 the reduction is X and the comparison becomes X orthogonal-sum -X with its diagonal Lagrangian.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 2.6 and complete proof, printed pp.110–111. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `GN.6/isotropic-reduction`: Separate the declaration-sized input from the bundled consuming declaration.

### Classical hermitian Bott triangle

**comparison; `GN.6/classical-dg-bott-triangle`.** For the uniquely 2-divisible dg category with weak equivalences and duality in Schlichting Theorem 6.1, GW^[r](A) -> K(A) -> GW^[r+1](A) -> Sigma GW^[r](A) is an exact triangle, with forgetful and hyperbolic maps.

Hypotheses and conventions: The dg model, weak equivalences and pretriangulated/smallness conventions are those of Schlichting. This theorem does not assert integral four-periodicity for genuine symmetric GW at dyadic coefficients.

Proof/construction outline: 1. Import the generic Bott framework from its Poincare owner. 2. Identify the actual classical dg model with that framework under the source hypotheses; transport the source triangle. The model comparison and source proof remain named gaps.

Direct prerequisites: `GN.6/grothendieck-witt-space`, `GeneralAlgebraicKTheory:K.4:construction/S-construction`, `GeneralAlgebraicKTheory:K.4/delooping-and-the-spectrum`

Acceptance: The comparison retains the source hypotheses: The dg model, weak equivalences and pretriangulated/smallness conventions are those of Schlichting.

Source/derivation: [SchlichtingDerived](https://arxiv.org/pdf/1209.0848v3), SchlichtingDerived Theorem 6.1 and proof, physical pp.57–58; classical/stable model comparison remains a gap.. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `GN.6/shifted-karoubi-periodicity`: Separate the declaration-sized input from the bundled consuming declaration.

### Nonconnective hyperbolic comparison

**comparison; `GN.6/nonconnective-hyperbolic-comparison`.** For the hyperbolic exact category HE with its exchange duality, the completed-suspension nonconnective hermitian spectrum is naturally equivalent to the imported Frobenius-pair nonconnective K spectrum of E.

Hypotheses and conventions: Keep hermitian structure maps and all idempotent completions. The sequence of |Qʰ(˜S_hⁿ E)| spaces alone is generally not an Ω-spectrum.

Proof/construction outline: 1. Prove the source GW(HE) versus K(E) comparison in every completed suspension degree. 2. Check compatibility with the genuine ordinary K structure maps, including degree-zero completion conventions.

Direct prerequisites: `GN.6/nonconnective-hermitian-spectrum`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum-and-derived-invariance`

Acceptance: Positive degrees agree with Quillen K groups; degree zero uses the idempotent-completed derived-category convention of the imported spectrum.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), printed p.162, Remark 9.12. The stated scope is the source slice read here. Worker adapters and unresolved proof inputs are identified in proofSteps and gaps; this is an unchecked plan.

Use: `GN.6/nonconnective-hermitian-spectrum`: Separate the declaration-sized input from the bundled consuming declaration.

### Hyperbolic Q equivalence

**comparison; `GN.6/hyperbolic-q-equivalence`.** For the hyperbolic category HE=E×E-op with exchange duality, Qh(HE) is equivalent to Q(E), and its GW fibre space is equivalent to K(E).

Proof/construction outline: 1. A perfect pairing in HE identifies its second component with the first dual component. 2. Under this identification hermitian spans are ordinary admissible Q spans; the fibre comparison uses the product Q(E)×Q(E-op).

Direct prerequisites: `GN.6/hermitian-q-construction`, `GN.6/hermitian-q-forgetful-functor`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Example 2.3, Remark 4.3 and Example 4.5, printed pp.109,117. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6`: Exports hyperbolic q equivalence to the staged target; source or supplier gaps remain explicit.

### Relative cone quotient equivalence

**lemma; `GN.6/cone-relative-quotient-equivalence`.** For the fully exact inclusion A⊂U of the source, C(A,A)/A→C(U,A)/U is an exact duality-preserving equivalence.

Proof/construction outline: 1. Choose a tail whose quotient by the constant initial object lies in A. 2. Different tail choices are related by shifts and constant quotients, hence agree in the exact quotient. 3. This constructs a quasi-inverse with the same duality.

Direct prerequisites: `GN.6/cone-localization-exactness`, `GN.6/cone-constant-filtering`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [Schlichting2010](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf), Lemma 9.4 and full proof, printed pp.159–160. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6`: Exports relative cone quotient equivalence to the staged target; source or supplier gaps remain explicit.

### Classical integral degree-zero groups

**comparison; `GN.6/integer-classical-degree-zero`.** For Z, symmetric classical GW0 is Z⊕Z generated by ⟨1⟩,⟨−1⟩; symplectic GW0 is Z generated by the rank-two alternating hyperbolic form.

Proof/construction outline: 1. Import integral stable form classification, identify orthogonal-sum generators and use the group-completion comparison.

Direct prerequisites: `GN.6/exact-grothendieck-witt-group`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), §3.2, printed pp.54–55. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/integer-quadratic-table`: Uses classical integral degree-zero groups with the displayed hypotheses and normalization.

### Integral symmetric table, residue 0

**comparison; `GN.6/integer-symmetric-table-0`.** For k≥0 and n=8k+0≥1, the classical symmetric group is Z⊕Z/2 and the classical symplectic group is 0. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.

Proof/construction outline: 1. Use the 2-local Z[1/2] computation and the 2-inverted splitting. 2. Glue the finitely generated abelian groups; retain the odd K group itself, rather than assuming Kummer–Vandiver.

Direct prerequisites: `GN.6/number-ring-invert-two-comparison`, `GN.6/number-ring-homotopy-limit`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6`: Exports integral symmetric table, residue 0 to the staged target; source or supplier gaps remain explicit.

### Integral symmetric table, residue 1

**comparison; `GN.6/integer-symmetric-table-1`.** For k≥0 and n=8k+1≥1, the classical symmetric group is (Z/2)^3 and the classical symplectic group is 0. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.

Proof/construction outline: 1. Use the 2-local Z[1/2] computation and the 2-inverted splitting. 2. Glue the finitely generated abelian groups; retain the odd K group itself, rather than assuming Kummer–Vandiver.

Direct prerequisites: `GN.6/number-ring-invert-two-comparison`, `GN.6/number-ring-homotopy-limit`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/integer-quadratic-table`: Uses integral symmetric table, residue 1 with the displayed hypotheses and normalization. `GN.6/integer-skew-homotopy-orbits`: Uses integral symmetric table, residue 1 with the displayed hypotheses and normalization.

### Integral symmetric table, residue 2

**comparison; `GN.6/integer-symmetric-table-2`.** For k≥0 and n=8k+2≥1, the classical symmetric group is (Z/2)^2⊕K_(8k+2)(Z)_odd and the classical symplectic group is Z⊕K_(8k+2)(Z)_odd. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.

Proof/construction outline: 1. Use the 2-local Z[1/2] computation and the 2-inverted splitting. 2. Glue the finitely generated abelian groups; retain the odd K group itself, rather than assuming Kummer–Vandiver.

Direct prerequisites: `GN.6/number-ring-invert-two-comparison`, `GN.6/number-ring-homotopy-limit`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/integer-skew-homotopy-orbits`: Uses integral symmetric table, residue 2 with the displayed hypotheses and normalization.

### Integral symmetric table, residue 3

**comparison; `GN.6/integer-symmetric-table-3`.** For k≥0 and n=8k+3≥1, the classical symmetric group is Z/w_(4k+2) and the classical symplectic group is Z/(2w_(4k+2)). Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.

Proof/construction outline: 1. Use the 2-local Z[1/2] computation and the 2-inverted splitting. 2. Glue the finitely generated abelian groups; retain the odd K group itself, rather than assuming Kummer–Vandiver.

Direct prerequisites: `GN.6/number-ring-invert-two-comparison`, `GN.6/number-ring-homotopy-limit`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/integer-skew-quadratic-table`: Uses integral symmetric table, residue 3 with the displayed hypotheses and normalization.

### Integral symmetric table, residue 4

**comparison; `GN.6/integer-symmetric-table-4`.** For k≥0 and n=8k+4≥1, the classical symmetric group is Z and the classical symplectic group is Z/2. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.

Proof/construction outline: 1. Use the 2-local Z[1/2] computation and the 2-inverted splitting. 2. Glue the finitely generated abelian groups; retain the odd K group itself, rather than assuming Kummer–Vandiver.

Direct prerequisites: `GN.6/number-ring-invert-two-comparison`, `GN.6/number-ring-homotopy-limit`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6`: Exports integral symmetric table, residue 4 to the staged target; source or supplier gaps remain explicit.

### Integral symmetric table, residue 5

**comparison; `GN.6/integer-symmetric-table-5`.** For k≥0 and n=8k+5≥1, the classical symmetric group is 0 and the classical symplectic group is Z/2. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.

Proof/construction outline: 1. Use the 2-local Z[1/2] computation and the 2-inverted splitting. 2. Glue the finitely generated abelian groups; retain the odd K group itself, rather than assuming Kummer–Vandiver.

Direct prerequisites: `GN.6/number-ring-invert-two-comparison`, `GN.6/number-ring-homotopy-limit`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6`: Exports integral symmetric table, residue 5 to the staged target; source or supplier gaps remain explicit.

### Integral symmetric table, residue 6

**comparison; `GN.6/integer-symmetric-table-6`.** For k≥0 and n=8k+6≥1, the classical symmetric group is K_(8k+6)(Z)_odd and the classical symplectic group is Z⊕K_(8k+6)(Z)_odd. Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.

Proof/construction outline: 1. Use the 2-local Z[1/2] computation and the 2-inverted splitting. 2. Glue the finitely generated abelian groups; retain the odd K group itself, rather than assuming Kummer–Vandiver.

Direct prerequisites: `GN.6/number-ring-invert-two-comparison`, `GN.6/number-ring-homotopy-limit`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6`: Exports integral symmetric table, residue 6 to the staged target; source or supplier gaps remain explicit.

### Integral symmetric table, residue 7

**comparison; `GN.6/integer-symmetric-table-7`.** For k≥0 and n=8k+7≥1, the classical symmetric group is Z/w_(4k+4) and the classical symplectic group is Z/w_(4k+4). Here w_(2m) is the denominator of |B_(2m)/(4m)| and K_n(Z)_odd is the actual odd torsion subgroup; unrestricted cyclicity is not assumed.

Proof/construction outline: 1. Use the 2-local Z[1/2] computation and the 2-inverted splitting. 2. Glue the finitely generated abelian groups; retain the odd K group itself, rather than assuming Kummer–Vandiver.

Direct prerequisites: `GN.6/number-ring-invert-two-comparison`, `GN.6/number-ring-homotopy-limit`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Theorem 3.2.2, Remark 3.2.1 and full proof, printed pp.55–57. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6`: Exports integral symmetric table, residue 7 to the staged target; source or supplier gaps remain explicit.

### Integral symmetrization cofiber

**lemma; `GN.6/integer-symmetrization-cofiber`.** The cofiber C of Lgq(Z)→Lgs(Z) has π1=Z/2, π0=Z/8, π−1=Z/2, and all other homotopy groups zero. The degree-zero L map is multiplication by 8.

Proof/construction outline: 1. Use the genuine-to-nongenuine comparison ranges and the source low-degree L computations. 2. Apply the cofiber long exact sequence, retaining the factor 8.

Direct prerequisites: `GN.6/dedekind-symmetric-localization`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Lemma 3.2.7 and full proof, printed p.58. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/integer-quadratic-table`: Uses integral symmetrization cofiber with the displayed hypotheses and normalization. `GN.6/integer-skew-symmetrization-cofiber`: Uses integral symmetrization cofiber with the displayed hypotheses and normalization.

### Integral quadratic Grothendieck–Witt groups

**comparison; `GN.6/integer-quadratic-table`.** Classical quadratic GW0(Z)=Z⊕Z, with generators Hq and E8; GW1(Z)=(Z/2)^2. Symmetrization identifies quadratic and symmetric GW_n(Z) for every n≥2.

Proof/construction outline: 1. Use the index-eight degree-zero comparison and the cofiber exact sequence. 2. The cofiber vanishes above degree one, giving the higher comparison.

Direct prerequisites: `GN.6/integer-classical-degree-zero`, `GN.6/integer-symmetrization-cofiber`, `GN.6/integer-symmetric-table-1`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Theorem 3.2.9 and full proof, printed pp.58–59. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6`: Exports integral quadratic grothendieck–witt groups to the staged target; source or supplier gaps remain explicit.

### Skew integral symmetrization cofiber

**lemma; `GN.6/integer-skew-symmetrization-cofiber`.** The cofiber D of L−gq(Z)→L−gs(Z) is equivalent to Σ²C, with the symmetrization map identified under the two double-suspension equivalences.

Proof/construction outline: 1. Use the source shift equivalences for both genuine flavours and their naturality on symmetrization.

Direct prerequisites: `GN.6/integer-symmetrization-cofiber`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Lemma 3.2.10 and full proof, printed p.59. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/integer-skew-quadratic-table`: Uses skew integral symmetrization cofiber with the displayed hypotheses and normalization.

### Low skew-duality K homotopy orbits

**lemma; `GN.6/integer-skew-homotopy-orbits`.** For K(Z) with the skew-duality C2 action, π1 of the homotopy-orbit spectrum is Z/4 and π2 is zero.

Proof/construction outline: 1. The orbit spectral sequence gives order four; the L-to-orbit exact sequence makes π1 cyclic. 2. The equivariant comparison to connective real K is an isomorphism through degree two. Its orbit π2 is both finite and free, hence zero.

Direct prerequisites: `GN.6/number-ring-invert-two-comparison`, `GN.6/integer-symmetric-table-1`, `GN.6/integer-symmetric-table-2`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Lemma 3.2.11 and full proof, printed pp.59–60. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/integer-skew-quadratic-table`: Uses low skew-duality k homotopy orbits with the displayed hypotheses and normalization.

### Integral skew-quadratic Grothendieck–Witt groups

**comparison; `GN.6/integer-skew-quadratic-table`.** Classical skew-quadratic GW_n(Z), for n=0,1,2,3, is respectively Z⊕Z/2, Z/4, Z and Z/24. For n≥4 it agrees with symplectic GW_n(Z). The Z/2 in degree zero is the Arf class.

Proof/construction outline: 1. Use the rank/Arf presentation in degree zero. 2. Use the two orbit computations and shifted cofiber long exact sequences in degrees one through three; above three the cofiber vanishes.

Direct prerequisites: `GN.6/integer-skew-symmetrization-cofiber`, `GN.6/integer-skew-homotopy-orbits`, `GN.6/integer-symmetric-table-3`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Theorem 3.2.13 and full proof, printed pp.60–61. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6`: Exports integral skew-quadratic grothendieck–witt groups to the staged target; source or supplier gaps remain explicit.

### Genuine L-theory after inverting two

**comparison; `GN.6/genuine-l-invert-two-comparison`.** For any ring R, invertible coefficient bimodule M with involution and m∈Z∪{±∞}, L(R;Q_M^≥m)[1/2]→L(R;Q_M^s)[1/2] is an equivalence.

Proof/construction outline: 1. Import the multiplicative Poincaré L-theory framework; invert the four-shift signature-one element. 2. Use the 2-inverted equivalence over Z and base change along its L-module action.

Direct prerequisites: No additional supplier beyond the displayed native context.

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Proposition 3.1.14 and full proof, printed p.54. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6/classical-homotopy-limit-obstruction`: Uses genuine l-theory after inverting two with the displayed hypotheses and normalization.

### Classical homotopy-limit obstruction

**theorem; `GN.6/classical-homotopy-limit-obstruction`.** For a ring R and invertible coefficient bimodule M with involution, if the mod-2 map from connective classical symmetric GW to K homotopy fixed points is n-truncated, n≥0, then Lgs(R;M)→Ls(R;M) is (n−1)-truncated.

Proof/construction outline: 1. Use the classical-to-genuine connective comparison and the arithmetic pullback square. 2. The four-shift colimit is symmetric L; compare its shift map to the Tate spectrum shift equivalence. 3. Combine the mod-2 bound with the 2-inverted equivalence.

Direct prerequisites: `GN.6/genuine-l-invert-two-comparison`

Acceptance: The conclusion retains every stated hypothesis and normalization.

Source/derivation: [CalmesIII](https://arxiv.org/pdf/2009.07225v4), Proposition 3.1.13 and full proof, printed pp.53–54. Own-word source result or explicitly labelled proof adaptation; unchecked planning obligation.

Use: `GN.6`: Exports classical homotopy-limit obstruction to the staged target; source or supplier gaps remain explicit.

## Target-to-declaration inventory

These are the target rows of the current packet. A target inventory records an endpoint or adapter; it does not override a stage remaining list or a supplier gap.

- **Discrete real lattices, fundamental domains, covolumes and absolute-determinant changes** (GN.0, planned): `GN.0/gram-det-orthonormal-coordinates`, `GN.0/covolume-square-gram`, `GN.0/gram-det-adapted-projection`, `GN.0/gram-det-biorthogonal`, `GN.0/covolume-projection`, `GN.0/covolume-dual`, `GN.0/primitive-orthogonal-covolume`
- **Complex embeddings and number-field factors** (GN.0, planned): `GN.0/mixed-embedding-normalization`
- **Blichfeldt and first Minkowski with boundary conventions** (GN.1, planned): `GN.1/blichfeldt-native-interface`, `GN.1/minkowski-first-native-interface`
- **Both sharp second Minkowski inequalities and attained witnesses** (GN.1, planned): `GN.1/minkowski-second-lower`, `GN.1/minkowski-second-upper`
- **Ideal-class and unit applications through existing owners** (GN.1, planned): `GN.1/ideal-class-application-import`, `GN.1/unit-application-import`
- **Field Witt/discriminant/Clifford/Hasse classification, real/dyadic places and Hasse–Minkowski** (GN.2, planned): `GN.2/field-hyperbolic-comparison`, `GN.2/field-discriminant-comparison`, `GN.2/field-witt-comparison`, `GN.2/field-hasse-comparison`, `GN.2/local-field-classification-adapter`, `GN.2/global-field-isotropy-adapter`, `GN.2/global-field-isometry-adapter`
- **Integral lattices, localization, genus and proper spinor genus** (GN.2, partial): `GN.2/integral-quadratic-lattice`, `GN.2/lattice-localization`, `GN.2/lattice-intersection-localizations`, `GN.2/completed-lattice-descent`, `GN.2/integral-genus`, `GN.2/proper-spinor-genus`, `GN.2/symmetric-z-carrier-comparison`, `GN.2/symmetric-z-dual-comparison`, `GN.2/symmetric-z-overlattice-comparison`, `GN.2/spinor-reflection-product`, `GN.2/spinor-unimodular-stabilizer`, `GN.2/spinor-adelic-norm`, `GN.2/spinor-stabilizer-quotient`
- **Dyadic, hermitian and quaternionic variants** (GN.2, partial): `GN.2/integral-hermitian-lattice`, `GN.2/hermitian-dual-lattice`, `GN.2/hermitian-lattice-invariants`, `GN.2/dyadic-atomic-form`, `GN.2/integral-normalized-form`, `GN.2/quaternionic-integral-hermitian-data`
- **Arithmetic quotients and reduction domains** (GN.3, partial): `GN.3/definite-genus-class-finite`, `GN.3/adelic-mass-identity`
- **Local representation densities and their normalization** (GN.3, partial): `GN.3/hermitian-representation-count`, `GN.3/hermitian-embedding-count`, `GN.3/finite-hermitian-isometry-formula`, `GN.3/normalized-hermitian-count`, `GN.3/hermitian-local-density`, `GN.3/normalized-siegel-polynomial`, `GN.3/cho-yamauchi-weight`, `GN.3/cho-yamauchi-overlattice-formula`, `GN.3/siegel-polynomial-functional-equation`
- **Finite stabilizers, weighted mass and a source-scoped mass formula** (GN.3, partial): `GN.3/definite-integral-isometry-finite`, `GN.3/genus-mass`, `GN.3/adelic-mass-identity`, `GN.3/maximal-integral-mass-formula`
- **Theta coefficient interface** (GN.3, partial): `GN.3/theta-lattice-coefficient-interface`
- **Lattice-point estimates, uniform semialgebraic multiset error and Henk counting** (GN.4, partial): `GN.4/davenport-semialgebraic-count`, `GN.4/henk-sublattice-count`, `GN.4/henk-successive-minima-count`
- **Mixing, ergodicity, unipotent recurrence, closure, measure and time averages** (GN.4, partial): `GN.4/howe-moore-mixing`, `GN.4/homogeneous-ergodicity`, `GN.4/unipotent-nondivergence`, `GN.4/ratner-orbit-closure`, `GN.4/ratner-measure-classification`, `GN.4/ratner-unipotent-equidistribution`
- **Oppenheim and Duke applications with actual hypotheses** (GN.4, partial): `GN.4/oppenheim-values`, `GN.4/duke-spherical-equidistribution`
- **Packing, covering, nonconvex star bodies and reciprocal transference** (GN.4, partial): `GN.4/packing-radius`, `GN.4/covering-radius`, `GN.4/compact-star-body`, `GN.4/dual-transference-lower`, `GN.4/dual-transference-upper`, `GN.4/covering-dual-transference`, `GN.4/critical-determinant`, `GN.4/star-body-interior-ball`, `GN.4/star-body-admissible-dilate`, `GN.4/critical-determinant-positive`, `GN.4/critical-lattice-exists`, `GN.4/lattice-gaussian-sum`, `GN.4/gaussian-lattice-summable`, `GN.4/gaussian-shift-maximum`, `GN.4/gaussian-scale-upper`, `GN.4/gaussian-shifted-tail`, `GN.4/gaussian-short-vector-error`, `GN.4/gaussian-covering-contradiction`, `GN.4/critical-minimizing-sequence`, `GN.4/star-admissibility-closed`, `GN.4/gaussian-lattice-poisson`, `GN.4/gaussian-poisson-error`
- **Mahler compactness and integrable Siegel mean value** (GN.4, partial): `GN.4/mahler-compactness`, `GN.4/siegel-mean-value`
- **Coding-lattice real metric and covolume adapter** (GN.4, partial): `GN.4/construction-a-real-lattice-interface`
- **Exact Gram–Schmidt/LLL reduction with integer change-of-basis certificates** (GN.5, planned): `GN.5/lll-coefficient`, `GN.5/lll-reduced`, `GN.5/unimodular-basis-certificate`, `GN.5/lll-integer-potential`, `GN.5/lll-exact-reduction`, `GN.5/lll-nearest-integer`, `GN.5/lll-shear-certificate`, `GN.5/lll-shear-gram-schmidt`, `GN.5/lll-shear-coefficients`, `GN.5/lll-descending-size-reduction`, `GN.5/lll-swap-certificate`, `GN.5/lll-swap-first-vector`, `GN.5/lll-swap-second-vector`, `GN.5/lll-swap-later-coefficients`, `GN.5/lll-prefix-gram-product`, `GN.5/lll-prefix-gram-integral`, `GN.5/lll-prefix-shear-invariant`, `GN.5/lll-prefix-swap-ratio`, `GN.5/lll-strict-potential-decrease`, `GN.5/lll-prefix-invariant`, `GN.5/lll-lexicographic-termination`
- **Proved factor and verification in the original lattice** (GN.5, planned): `GN.5/lll-gram-schmidt-growth`, `GN.5/lll-short-vector-factor`, `GN.5/lll-original-lattice-verification`
- **Height/count/local representation handoff to arithmetic consumers** (GN.5, planned): `GN.5/lll-original-lattice-verification`, `GN.5/lll-exact-reduction`
- **Strong exact duality, symmetric/alternating spaces and exact Lagrangians** (GN.6, partial): `GN.6/strong-category-duality`, `GN.6/exact-category-duality`, `GN.6/symmetric-space`, `GN.6/exact-lagrangian`, `GN.6/hyperbolic-space`, `GN.6/isotropic-reduction`
- **Exact GW/W presentations and forgetful/hyperbolic comparisons** (GN.6, partial): `GN.6/exact-grothendieck-witt-group`, `GN.6/exact-witt-group`, `GN.6/hyperbolic-forgetful-relations`
- **Higher hermitian fibre spaces and component comparison** (GN.6, partial): `GN.6/hermitian-q-construction`, `GN.6/grothendieck-witt-space`, `GN.6/higher-grothendieck-witt-groups`, `GN.6/grothendieck-witt-space-components`
- **Exact filtering and symmetric Dedekind localization with residue shifts** (GN.6, partial): `GN.6/schlichting-filtering-localization`, `GN.6/dedekind-residue-duality-line`, `GN.6/dedekind-symmetric-localization`
- **Source-scoped shifted periodicity and number-ring comparisons** (GN.6, partial): `GN.6/shifted-karoubi-periodicity`, `GN.6/number-ring-homotopy-limit`, `GN.6/number-ring-invert-two-comparison`
- **Selected full nonconnective hermitian branch** (GN.6, partial): `GN.6/hermitian-suspension`, `GN.6/hermitian-suspension-delooping`, `GN.6/nonconnective-hermitian-spectrum`
- **Integer symmetric/symplectic eight-row groups; quadratic and skew-quadratic low-degree comparisons and classical homotopy-limit obstruction** (GN.6, partial): `GN.6/integer-classical-degree-zero`, `GN.6/integer-symmetric-table-0`, `GN.6/integer-symmetric-table-1`, `GN.6/integer-symmetric-table-2`, `GN.6/integer-symmetric-table-3`, `GN.6/integer-symmetric-table-4`, `GN.6/integer-symmetric-table-5`, `GN.6/integer-symmetric-table-6`, `GN.6/integer-symmetric-table-7`, `GN.6/integer-symmetrization-cofiber`, `GN.6/integer-quadratic-table`, `GN.6/integer-skew-symmetrization-cofiber`, `GN.6/integer-skew-homotopy-orbits`, `GN.6/integer-skew-quadratic-table`, `GN.6/classical-homotopy-limit-obstruction`
- **Odd-residue signed commutative-field hermitian Witt twisting and transfer** (GN.2, partial): `GN.2/odd-local-quadratic-norms`, `GN.2/signed-hermitian-determinant-comparison`, `GN.2/signed-hermitian-twist`, `GN.2/signed-hermitian-witt-comparison`, `GN.2/signed-witt-scalar-twist`, `GN.2/signed-hermitian-transfer`, `GN.2/signed-transfer-image-independent`, `GN.2/signed-transfer-maximal-element`, `GN.2/signed-transfer-parity-injectivity`

## Imported supplier contracts

These contracts name the actual supplying stage/node, with a separate field/integral/topological role. They do not authorize duplication of that owner.

- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-6-forms-over-a-nonarchimedean-local-field`: Local field quadratic classification with actual dyadic discriminant/Hasse/sign conventions; only the field input, not integral genus. Consumers: `GN.2/integral-genus`
- `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-6-representation-and-isometry`: Rational isometry from matching local field forms with all real signatures and finite invariants retained; no integral isometry conclusion. Consumers: `GN.2/integral-genus`
- `tauceti:TauCetiRoadmap/RepresentationTheory/SpinRepresentations#layer-2-the-pin-and-spin-groups-and-the-double-covers`: Actual spin-cover map to SO on general characteristic-not-two field points and its spinor-norm kernel; no unsupported local surjectivity. Consumers: `GN.2/proper-spinor-genus`
- `AdelicAlgebraicGroups:AA.1`: Finite adelic points and functorial induced spin-cover maps, with their actual restricted-product topology. Consumers: `GN.2/proper-spinor-genus`
- `tauceti:TauCetiRoadmap/GrothendieckEulerForms#layer-0-intrinsic-exact-structures-and-conflation-exact-functors`: Use the completed intrinsic exact structure, actual conflation-exact functors and biproduct conflations; supply the duality adapter without defining a private Quillen carrier. Consumers: `GN.6/exact-category-duality`, `GN.6/exact-lagrangian`
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-4-the-witt-ring-and-the-fundamental-ideal`: Compare the general exact-category degree-zero Witt/GW presentations with the existing field theory under its exact characteristic and form conventions. Consumers: `GN.6/exact-witt-group`
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion`: Quaternion algebras and the standard involution in characteristic different from two; no commutative-field replacement of the right quaternion module. Consumers: `GN.2/quaternionic-integral-hermitian-data`
- `AdelicAlgebraicGroups:AA.2`: Compatible Haar/quotient measures, quotient integration and L2 action normalization. Finite-volume reduction is imported separately from AA.3; no numerical Tamagawa constant is inferred. Consumers: `GN.3/adelic-mass-identity`, `GN.4/howe-moore-mixing`, `GN.4/homogeneous-ergodicity`, `GN.4/siegel-mean-value`
- `AdelicAlgebraicGroups:AA.3`: Reduction domains for the indicated arithmetic groups, with actual coarse/fundamental-domain and quotient-topology hypotheses. Consumers: `GN.3/definite-genus-class-finite`, `GN.3/adelic-mass-identity`, `GN.4/mahler-compactness`
- `MetaplecticAutomorphicForms:MP.5`: Convergent theta kernel and the lattice Schwartz/Gaussian coefficient specialization, including its discriminant, level and measure conventions. Consumers: `GN.3/theta-lattice-coefficient-interface`
- `MetaplecticAutomorphicForms:MP.7`: The harmonic half-integral theta coefficient interface for Duke’s spherical Weyl sums; the analytic coefficient estimate remains a separate original-source gap. Consumers: `GN.4/duke-spherical-equidistribution`
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`: Actual finite-dimensional matrix Lie groups and their closed subgroup structures; general homogeneous quotient manifolds are supplied by Lie groups Part II, not redefined here. Consumers: `GN.4/howe-moore-mixing`, `GN.4/ratner-orbit-closure`, `GN.4/ratner-measure-classification`, `GN.4/oppenheim-values`
- `tauceti:TauCetiRoadmap/AlgebraicCodingTheory#layer-6-construction-a-with-exact-hypotheses`: Use the completed Construction A constructor, exact index and self-dual/parity hypotheses; supply the real metric/covolume adapter for the current unresolved FF.4 consumer routing. Consumers: `GN.4/construction-a-real-lattice-interface`
- `GeneralAlgebraicKTheory:K.4:construction/S-construction`: The actual Waldhausen simplicial S-construction; delooping is imported separately from K.4/delooping-and-the-spectrum. Consumers: `GN.6/shifted-karoubi-periodicity`, `GN.6/classical-dg-bott-triangle`
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-1-hyperbolic-planes-and-witt-theory`: Import hyperbolic decomposition, reflection generation and cancellation over characteristic-not-two fields; GN adds the integral-to-generic adapter only. Consumers: `GN.2/field-hyperbolic-comparison`, `GN.2/spinor-reflection-product`
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-3-the-classical-invariants-that-need-no-brauer-group`: Import rank, determinant and signed discriminant with the q=B(x,x)/2 scaling explicitly compared. Consumers: `GN.2/field-discriminant-comparison`
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-5-the-brauer-valued-invariants`: Import the exact field Hasse/Clifford Brauer-class conventions, not an integral classification. Consumers: `GN.2/field-hasse-comparison`
- `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy`: Import Hasse–Minkowski isotropy at every finite and real completion for regular generic number-field forms. Consumers: `GN.2/global-field-isotropy-adapter`
- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-9-transfer-and-the-relative-stiefel-whitney-formula`: Import transfer by a nonzero field-linear functional and its change-of-functional theorem in the trivial-involution quadratic specialization; signed hermitian adaptation is new here. Consumers: `GN.2/signed-hermitian-transfer`
- `tauceti:Completed/IntegralLattices#layer-1-lattices-with-forms`: Import finite free integral symmetric Z-lattices and their isometries; no evenness assumption unless stated separately. Consumers: `GN.2/symmetric-z-carrier-comparison`
- `tauceti:Completed/IntegralLattices#layer-2-duality-and-the-finite-discriminant-group`: Import rational symmetric lattice duality and finite discriminant module; compare the B-dual convention directly. Consumers: `GN.2/symmetric-z-dual-comparison`
- `tauceti:Completed/IntegralLattices#layer-4-overlattices-and-isotropic-subgroups`: Import even integral Z-overlattice/discriminant gluing, retaining the finite quadratic refinement and evenness hypothesis. Consumers: `GN.2/symmetric-z-overlattice-comparison`
- `StableHomotopyKTheory:H.1`: Realize the native nerve of the small/smallified hermitian Q-category and the supplied ordinary Q-category as pointed topological spaces, with their forgetful functor. Consumers: `GN.6/hermitian-q-nerve-realization`
- `StableHomotopyKTheory:H.2`: Supply nerve realization of natural transformations, Quillen theorem A/B homotopy-fibre criteria and contractible comma categories under the precise source hypotheses. Consumers: `GN.6/hermitian-q-nerve-realization`, `GN.6/cofinal-hermitian-comma-contraction`, `GN.6/cofinal-hermitian-q-fibration`
- `StableHomotopyKTheory:H.4`: Supply coherent orthogonal-sum group completion, pointed H-space loop and fundamental-group interfaces; GN supplies the hermitian exact functors and form relations. Consumers: `GN.6/hermitian-orthogonal-additivity`, `GN.6/formation-loop-comparison`

The four-condition s-filtering exact quotient is an ordinary-K owner extension requiring a concrete supplying declaration. No existing K.6 citation is asserted to provide it. The Poincare owner has no supplying stage here; its framework request remains a recorded gap rather than a fictitious stage. Reciprocal immutable upstream consumer metadata for RT-AREA-algebraicnt-1/1 must be integrated by the maintainer, as the packet upstreamNotes/restructure proposal specifies. No upstream reader or atlas data is edited by this revision.

## Remaining supplier API signatures

These twenty-nine names have full mathematical contracts in their node entries above but are absent from the typed prototype. Obtain the actual supplier objects before adding their signatures.

- `GN.2/lattice-localization`: `IntegralQuadraticLattice.localize`, `IntegralQuadraticLattice.localize_mem_iff`, `IntegralQuadraticLattice.localize_map`
- `GN.2/integral-genus`: `IntegralGenus.localIsometry`, `IntegralGenus.equivalence`, `IntegralGenus.ofIntegralIsometry`, `IntegralGenus.classSet`
- `GN.2/proper-spinor-genus`: `ProperSpinorGenus.orbit`, `ProperSpinorGenus.equivalence`, `ProperSpinorGenus.toGenus`
- `GN.3/hermitian-local-density`: `hermitianLocalDensity`, `hermitianLocalDensity_tendsto`, `hermitianLocalDensity_basisChange`, `hermitianLocalDensity_emptyGeneric`
- `GN.3/normalized-siegel-polynomial`: `normalizedSiegelPolynomial`, `normalizedSiegelPolynomial_eval`, `normalizedSiegelPolynomial_selfDual`, `normalizedSiegelPolynomial_isometry`
- `GN.6/exact-witt-group`: `ExactW0.fieldComparison`
- `GN.6/hermitian-q-construction`: `HermitianQ.forget`
- `GN.6/grothendieck-witt-space`: `grothendieckWittSpace_fibration`
- `GN.2/quaternionic-integral-hermitian-data`: `QuaternionicIntegralHermitianLattice.localize`
- `GN.6/hermitian-suspension`: `hermitianSuspension`, `hermitianSuspension_map`, `hermitianSuspension_duality`
- `GN.6/nonconnective-hermitian-spectrum`: `nonconnectiveHermitianSpectrum`, `nonconnectiveHermitianSpectrum_loop`, `nonconnectiveHermitianSpectrum_homotopy`
- `GN.2/signed-hermitian-transfer`: `signedHermitianTransfer_witt`

## Gaps and closure work

No gap is hidden inside a declaration named “interface”. A supplying declaration, source proof or comparison must meet the stated context; importing a similar name does not close it.

### Gap 1: Number-field metric comparison and integer-vector norm floor

Consumer-owned normalization warning (not a request to duplicate it here): the Couveignes extraction routes the weighted/unweighted metric, discriminant normalization and integer-family applications to proposed EffectiveBoundsCompactModels. Couveignes uses twice the complex squared modulus; audited Mathlib mixed-embedding basis (1,i) is unweighted. The consumer must derive the 2^r2 measure factor, not identify unequal covolumes. Nonzero relation-lattice integer vectors have norm≥1; the initial number-field minima instead need the arithmetic norm/product argument. A general lattice does not have the ≥1 floor.

### Gap 2: Full GN.1 source coverage and upstream minimum compatibility

The generic two-sided Minkowski product contract and independent attained witnesses are now supplied as unchecked plans. Remaining source work includes the complete original GN.1 bibliography and source-scoped applications, Evertse Theorem 2.11's Hermite-basis proof, John's ellipsoid theorem and their consequences. Reconcile the inherited real-valued Fin-indexed minimum plan with the inspected upstream NNReal/Nat design before implementation. EffectiveBoundsCompactModels still owns weighted number-field metric/discriminant conversion and arithmetic norm floors; the generic volume theorem does not supply those consumer-specific hypotheses.

### Gap 3: GN.2 primary-source and proof decomposition

Import field invariants/Witt theory from QuadraticFormInvariants and Hasse–Minkowski/isotropy/representation from GlobalQuadraticForms; rational integral lattice duality/discriminant/gluing is completed IntegralLattices. New work: O_K/Z_p integral lattices, localization, genera/spinor genera, dyadic and quaternionic/hermitian variants, with source-specific restrictions.

### Gap 4: GN.3 primary-source and proof decomposition

AdelicAlgebraicGroups owns quotient/measure and reduction-domain foundations; MetaplecticAutomorphicForms owns theta. GN still needs local representation densities, finite stabilizers, genus classes, weighted mass, local normalization and convergence proofs.

### Gap 5: GN.4 primary-source and proof decomposition

Existing null-frontier asymptotic lattice counting is an import. GN.4 retains Davenport's bounded semialgebraic MULTISET/projection-volume estimate with uniform dimension/multiplicity/complexity dependence (accepted RS-07), plus independent mixing/nondivergence/Oppenheim/Duke branches, packing/covering, transference, star bodies, Mahler compactness and Siegel mean value. Coding Construction A is AlgebraicCodingTheory layer 6; fixed-domain Lipschitz estimates are GlobalNumberFields. Henk Lemma 2.1, inequality (1.3) and Theorem 1.5 are now decomposed through native integral flags, compatible rounding and diagonal-span avoidance. Theorem 1.5 retains d≥2 and the strict factor 2^(d−1). The dimension-one result is the separate non-strict first-minimum estimate. Conjecture 1.4 is not supplied as a theorem. These counting results do not supply the sharp upper Minkowski volume inequality or any quantitative lattice-counting error term.

### Gap 6: GN.5 primary-source and proof decomposition

GN.5 owns generic verified LLL (accepted RS-03): exact Gram–Schmidt/rational comparisons, unimodular update certificates, termination, Lovasz and size reduction, approximation guarantees and original-lattice verification. ED.1/ED.2 own their arithmetic reduction/exclusion applications. No unrestricted exact SVP/CVP follows from LLL.

### Gap 7: GN.6 primary-source and proof decomposition

GN.6 requires an exact category with duality, coherent double dual, forms/isometries, exact-category GW/W, hyperbolic/forgetful maps and higher hermitian K. Degree-zero field Witt/GW belongs to QuadraticFormInvariants. Source-scoped localization/periodicity needs precise invertibility-of-two/regularity assumptions; K.6 supplies ordinary Frobenius-pair/ring spectrum inputs, with a separate hermitian comparison obligation; it does not supply an s-filtering exact quotient.

### Gap 8: Proof execution

All 300 nodes remain unchecked planning obligations. Pinned elaboration checks signatures and admitted examples, not theorem proofs. Earlier receipt objects remain historical; only the finite checks explicitly recorded in the current validation.regressions are newly executed. No entire historical test suite or scratch proof is claimed rerun.

### Gap 9: Localization image adapter

Identify L⊗R R_(p) with its span in V, prove injectivity, and produce exact local integral quadratic-map instances without imposing global freeness. Existing localization/tensor notions are imported, not re-planned.

Consumers: `GN.2/lattice-localization`

### Gap 10: Completion and finite-quotient adapters

Supply the exact injections, scalar-extension embeddings and R/p^e→R̂/p^e isomorphism for the imported adic/local-field substrate; the source proof is read, but these adapters have not been matched to declarations at the pin.

Consumers: `GN.2/completed-lattice-descent`

### Gap 11: Dyadic spinor stabilizers and strong-approximation hypotheses

Schulze-Pillot §9.2 pp.124–129 supplies the precise proper spinor genus, stabilizer and adelic quotient now split into nodes. Complete integral stabilizer images at dyadic/ramified places and match the native spinor/GSpin/completion interfaces; any strong-approximation class-collapse theorem needs its source dimension/isotropy restrictions. These extra proofs are not claimed acquired.

Consumers: `GN.2/proper-spinor-genus`

### Gap 12: Hermitian inverse-Gram and scalar-change proof

Prove the local full finite inverse-Gram description, dual localization/completion compatibility and double-dual descent. Completed rational symmetric duality is imported only for its matching specialization, not asserted to provide all star-hermitian Dedekind adapters.

Consumers: `GN.2/hermitian-dual-lattice`

### Gap 13: Finite hermitian vector counting proof

Acquire and decompose the hermitian analogue of Kitaoka §5.6 Exercise 4 used in Li–Zhang p.18, including degenerate radical lifts. The source gives the formula but not this counting proof.

Consumers: `GN.3/finite-hermitian-isometry-formula`

### Gap 14: Hermitian density existence and normalization proof

Acquire Hironaka 1998/2012 and Gan–Yu 2000 at the exact passages used in Li–Zhang §§3.1–3.2. Prove existence, the generic fibre dimension, dyadic unramified smoothness and the finite-count/Haar comparison. These results are statement-read through Li–Zhang, not proof-read in their original sources.

Consumers: `GN.3/hermitian-local-density`

### Gap 15: Integral Siegel polynomial existence

Prove the interpolation and integrality theorem cited in Li–Zhang §3.2 from the exact Hironaka source. Finite interpolation alone is not a proof of this construction.

Consumers: `GN.3/normalized-siegel-polynomial`

### Gap 16: Overlattice stratum lifting and smoothness

Acquire Cho–Yamauchi Corollary 3.11/Theorem 3.9 and Gan–Yu Lemma 5.5.2/§9, including the unramified dyadic case, and prove the representation-to-overlattice stratification with the exact q-exponent.

Consumers: `GN.3/cho-yamauchi-overlattice-formula`

### Gap 17: Siegel-series functional-equation proof

Acquire and decompose Hironaka’s exact functional equation used at (3.2.0.2); the source states it but the original proof is not read.

Consumers: `GN.3/siegel-polynomial-functional-equation`

### Gap 18: Classical hermitian homotopy-fibre carrier

A native compact-open path-fibre subtype and HomotopyGroup carrier are now supplied. Match the actual realizations of Qh and the ordinary Q forgetful functor to H.1/H.2, and the coherent orthogonal-sum group structure to H.4. The abstract supplied topological spaces are not asserted to be those realizations without the adapters.

Consumers: `GN.6/grothendieck-witt-space`

### Gap 19: Quaternionic integral module and classification source

Emery–Kim §§5.1–5.2 pp.10–12 supplies free quaternion order-module diagonal/split cases, now four separate nodes. Match localization and perfect order-dual functors for general nonfree order lattices; ramified-place integral classification and maximal-order refinements remain unacquired. KSS §§3.1–3.5 is signed COMMUTATIVE field theory and supplies no quaternion classification.

Consumers: `GN.2/quaternionic-integral-hermitian-data`

### Gap 20: Totally positive restriction-of-scalars metric

Match the arithmetic embedding/trace metric and its normalization to the existing number-field/EffectiveBoundsCompactModels owner; do not create a second number-field metric here.

Consumers: `GN.3/definite-integral-isometry-finite`

### Gap 21: Definite genus finite representative theorem

Read and decompose the precise reduction bound for a fixed positive genus, including coefficient ideals over number rings. Adelic reduction supplies the domain framework, not this finite integral Gram enumeration by itself.

Consumers: `GN.3/definite-genus-class-finite`

### Gap 22: Tamagawa normalization and explicit mass factors

Acquire the exact Smith–Minkowski–Siegel/Weil mass theorem, identify O versus SO indices and archimedean constants, prove the local-density factor comparison and the convergent Euler product, and prove the relevant Tamagawa number before assigning a numerical constant. The decomposition here gives an honest measure identity, not an unproved numerical mass formula.

Consumers: `GN.3/adelic-mass-identity`

### Gap 23: Theta-kernel integral lattice adapter

Supply the exact Schwartz/Gaussian specialization, coefficient exponent, discriminant Weil module, level and weight from MP.5; this node imports that theory rather than asserting a scalar modularity theorem without its hypotheses.

Consumers: `GN.3/theta-lattice-coefficient-interface`

### Gap 24: Corrected Davenport/Rogers proof and semialgebraic carrier

Acquire Davenport 1951 pp.179–183, its 1964 corrigendum p.580 and Rogers Theorem 9; decompose interval/projection induction and the bounded algebraic-cell complexity theorem. The corrigendum is identified via DOI 10.1112/jlms/s1-39.1.580-t and its indexed text, not represented as an acquired proof. Match the semialgebraic multiset carrier to its actual owner before a full Lean signature.

Consumers: `GN.4/davenport-semialgebraic-count`

### Gap 25: Howe–Moore source proof and unitary representation adapter

Acquire the original Howe–Moore proof or the cited complete exposition, split the Cartan/weak-limit/invariant-vector arguments, and match the strongly continuous L² action on G/Γ. The read Benoist source explicitly omits this proof.

Consumers: `GN.4/howe-moore-mixing`

### Gap 26: L² ergodicity characterization and quotient action

Match the actual invariant-probability quotient action, L² strong continuity and invariant-function characterization to the measure-theory baseline; no private ergodic-action predicate is introduced.

Consumers: `GN.4/homogeneous-ergodicity`

### Gap 27: Dani–Margulis nondivergence proof

Acquire the original recurrence proof cited by Benoist [11], including Mahler short-vector control and polynomial trajectory estimates. Record any quantitative strengthening as a separate theorem with its own good-function, covolume and uniformity hypotheses.

Consumers: `GN.4/unipotent-nondivergence`

### Gap 28: Ratner orbit and measure rigidity proof

Acquire the original Ratner measure-classification/orbit-closure sources and decompose recurrence, shearing, linearization, invariant-subgroup construction and finite-volume orbit arguments. The Morris source explicitly states that these proofs are long and does not supply them in the selected slice.

Consumers: `GN.4/ratner-orbit-closure`

### Gap 29: Ratner ergodic measure proof

Acquire the original classification proof and record its measurable shearing/entropy-free rigidity inputs at declaration granularity. Do not infer this theorem solely from topological orbit closure.

Consumers: `GN.4/ratner-measure-classification`

### Gap 30: Oppenheim auxiliary Lie and arithmetic lemmas

Supply the SO(1,2) intermediate-subgroup classification, Borel-density rationality of its invariant quadratic line and reduction from n≥3 to an appropriate irrational indefinite ternary restriction. The selected Morris proof treats n=3 and explicitly omits some Lie calculations.

Consumers: `GN.4/oppenheim-values`

### Gap 31: Duke theta and coefficient estimates

Acquire Iwaniec’s exact half-integral coefficient bound and Siegel’s ineffective r₃(n) lower bound; match spherical-harmonic theta lifting and density of harmonic polynomials. Duke p.74 gives the deduction, not the original proofs of those inputs.

Consumers: `GN.4/duke-spherical-equidistribution`

### Gap 32: Polar-body carrier and upper transference theorem

Match the actual inner-product polar to a library definition, prove compact convex interior properties and the attained-minima comparison, then acquire the chosen classical/Banaszczyk upper transference theorem and covering constant. The present declaration proves only the lower inequality.

Consumers: `GN.4/dual-transference-lower`

### Gap 33: Mahler bounded basis and quotient topology

Acquire the complete chosen Mahler proof, refine the Hermite/reduced-basis uniform bound already listed in the inherited GN.1 frontier, and prove continuity/compactness in the exact SL quotient topology imported from the group owners.

Consumers: `GN.4/mahler-compactness`

### Gap 34: Original Siegel mean-value proof

Acquire Siegel’s A mean value theorem in geometry of numbers and decompose primitive unfolding, Haar normalization, arithmetic constant and L¹ justification. The current notes supply only the lattice-space/measure input, not that proof.

Consumers: `GN.4/siegel-mean-value`

### Gap 35: Coding edge and real metric adapter

Resolve the current FF.4 routing against the actual AlgebraicCodingTheory layer-6 constructor. Supply rational-to-real carrier, index/covolume and norm/parity comparisons before deriving an atlas edge from the word code.

Consumers: `GN.4/construction-a-real-lattice-interface`

### Gap 36: Derived duality carrier owned by HermitianKTheoryOfPoincareCategories

Import the routed stable Poincaré/flavour and derived-duality framework from the new HermitianKTheoryOfPoincareCategories design. No packet/stage yet exists at this base, so no fictitious supplier node is invented. Match its actual derived Hom and line-with-involution types before prototyping this comparison.

Consumers: `GN.6/dedekind-residue-duality-line`

### Gap 37: Symmetric dévissage framework and original inputs

Import generic GW/L fibre and localization from HermitianKTheoryOfPoincareCategories once its design has named nodes; import Quillen/Barwick ordinary K inputs from their owners. Acquire QSS79 symmetric Witt dévissage and refine the exact comparison; Calmes pp.38–39 proves the reduction using these inputs, not their proofs.

Consumers: `GN.6/dedekind-symmetric-localization`

### Gap 38: s-filtering quotient and full Schlichting localization proof

Match each of the four filtering/special inflation/deflation conditions and the exact quotient to GeneralAlgebraicKTheory, then read and decompose Schlichting §8 pp.141–149. Only its statement and setup were read here; no characteristic restriction is invented.

Consumers: `GN.6/schlichting-filtering-localization`

### Gap 39: Classical dg comparison and Karoubi proof

Read Schlichting §6 and the precise dg duality construction, then import the generic Poincaré Bott/Genauer theory from its routed owner rather than duplicating it. Unique 2-divisibility remains an explicit theorem hypothesis.

Consumers: `GN.6/shifted-karoubi-periodicity`

### Gap 40: Even finite-field comparison and finite-vcd₂ theorem

Import the original finite-vcd₂ BKSØ homotopy-limit theorem, Quillen finite-field K calculation and the generic hermitian pullback from their owners; refine Calmes Proposition 3.1.4’s even-field L/Tate comparison. The selected Calmes source reduction is proof-read, but those foundational proofs remain imports/gaps.

Consumers: `GN.6/number-ring-homotopy-limit`

### Gap 41: Original upper transference proof

Acquire Banaszczyk, Math. Ann. 296 (1993), 625–635, and decompose its Gaussian Fourier/Poisson and subspace estimates. The lecture statement has been read; the original full proof has not.

Consumers: `GN.4/dual-transference-upper`

### Gap 42: Original maximal mass theorem and complete local table

Acquire Shimura 1999 Theorem 5.8 / Gan–Hanke–Yu 2001 Proposition 2.13, prove τ(SO)=2, maximal-lattice single genus, local-model comparison and finite bad-prime support. Definition 3.1/Table 1 are read, but the complete invariant-to-factor adapter and original mass proof require refinement.

Consumers: `GN.3/maximal-integral-mass-formula`

### Gap 43: Mass zeta and archimedean normalization imports

Attach exact number-field Dedekind-zeta Euler product and special-value supplier declarations, and the gamma/local Haar conversion. Do not infer these from the theta or adelic measure stage alone.

Consumers: `GN.3/maximal-integral-mass-formula`

### Gap 44: Native spectrum and hyperbolic suspension comparison

Obtain the genuine spectrum/loop/idempotent-completion interfaces from their owners and verify the hermitian hyperbolic functor’s compatibility with K.6 suspension. This construction is not represented by an opaque invented carrier in the suggested file.

Consumers: `GN.6/nonconnective-hermitian-spectrum`

### Gap 45: Ratner time-average selection and escape control

Measure classification plus qualitative recurrence does not by itself identify every time-average limit. Acquire the original equidistribution proof, its nonescape estimates and selection argument, retaining the stated one-parameter unipotent hypothesis.

Consumers: `GN.4/ratner-unipotent-equidistribution`

### Gap 46: Consumer weighted arithmetic metric adapter

EffectiveBoundsCompactModels owns its chosen coefficient metric; a complete named weighted-number-field embedding comparison must specify the exact determinant and the lower norm estimate in that consumer. This packet supplies only the canonical mixed-embedding normalization, not a new consumer metric.

Consumers: `GN.0/mixed-embedding-normalization`

### Gap 47: Compact local-coordinate substrate for eventual emptiness

Match compactness of the valuation ring, separated pi-adic topology, closed Gram-equation loci and surjectivity of reduction to the actual local-field supplier before prototyping the empty-generic-density-zero lemma.

### Gap 48: Hermitian additivity, cone and completion interfaces

Source §9.1–9.2 pp.154–162 and §§5.1–5.3 pp.124–128 are fully read and split. The native cone full subcategory, localization, shifts, finite pointwise swindle and duality signatures are supplied. The generic four-condition s-filtering exact quotient and coherent GW additivity/realization/completion/spectrum adapters are still supplier work; K.6 does not supply them.

### Gap 49: Actual s-filtering exact quotient and derived-duality suppliers

The K.6 packet has a Frobenius-pair flasque spectrum and a ring Bass spectrum, but no exact quotient at Schlichting's four s-filtering conditions. Request the precise quotient/weak-isomorphism localization in the ordinary exact-K owner, and the shifted derived-Hom/duality framework in HermitianKTheoryOfPoincareCategories. Their stage/node interfaces are not yet established here.

### Gap 50: Prototype API and concrete test completion

The old catalogue is replaced by native exact-duality/Lagrangian/GW/W/Q/cone/formation/DVR/quaternion/atomic/topological-fibre/Gaussian/LLL-loop signatures and examples. Remaining native names and source-specific supplier contracts are enumerated individually in suggestedFrontier; a present constructor does not certify every API item or test. No warning sentence is counted as a unit test.

### Gap 51: Arithmetic GW flavour and table framework

The arithmetic outcomes have precise source statements and proof outlines. Their stable Poincaré flavours, genuine/non-genuine comparison ranges, multiplicative L module action, 2-completion, C2 orbit/fixed/Tate constructions, Berrick–Karoubi Z[1/2] computations, and actual K(Z) table interfaces belong to HermitianKTheoryOfPoincareCategories and ArithmeticKTheory. The routed Poincaré roadmap brief exists but has no stage/node ids here; retain this explicit ownership gap, not an invented supplier stage or formalisation claim.

Consumers: `GN.6/integer-symmetric-table-0`, `GN.6/integer-symmetric-table-1`, `GN.6/integer-symmetric-table-2`, `GN.6/integer-symmetric-table-3`, `GN.6/integer-symmetric-table-4`, `GN.6/integer-symmetric-table-5`, `GN.6/integer-symmetric-table-6`, `GN.6/integer-symmetric-table-7`, `GN.6/integer-symmetrization-cofiber`, `GN.6/integer-quadratic-table`, `GN.6/integer-skew-symmetrization-cofiber`, `GN.6/integer-skew-homotopy-orbits`, `GN.6/integer-skew-quadratic-table`, `GN.6/classical-homotopy-limit-obstruction`, `GN.6/genuine-l-invert-two-comparison`

### Gap 52: Split quaternion Morita and alternating PID classification

Match the idempotent right-module Morita equivalence and the regular alternating PID lattice classification to actual supplier APIs; the acquired source proves the split free-order-module result but does not classify all order lattices or all ramified quaternion places.

Consumers: `GN.2/quaternion-split-stabilizer`

### Gap 53: Signed hermitian Witt and transfer proof inputs

Acquire Witt decomposition/cancellation for the signed commutative hermitian field category and the specific maximal-element transfer proof [39, Theorem 4.4] cited by KSS Proposition 3.13(ii). The quadratic trivial-involution transfer remains the QFI Layer 9 supplier. KSS Proposition 3.15 determinant norm formula and its separate standard rank-one sign formulas are read but not yet declaration-sized nodes at this 300-node cutoff.

Consumers: `GN.2/signed-hermitian-witt-comparison`, `GN.2/signed-transfer-maximal-element`

### Gap 54: Generic lattice Poisson summation and Fourier comparison

Regev six-page proof is read and decomposed. Match a native lattice Poisson theorem, Gaussian Fourier transform, dual-lattice covolume, and character phase/sign normalization to actual pinned declarations or the Fourier-analysis owner; do not infer the lattice theorem solely from Euclidean inversion. The supplied Gaussian signature is an admitted mathematical contract.

Consumers: `GN.4/gaussian-lattice-poisson`

## Paper-item worklist

The 295 distinct routed items come from 31 papers and 36 route records. This inventory preserves the per-paper item identifiers and routing provenance through scratch deletion. Routing is not source reading or theorem coverage. The responsible follow-up checks each item against the current graph, reads the exact primary proof, splits an unmatched GN-owned declaration, and imports results owned elsewhere.

### PAPER-BERGSTROM-FABER-PAYNE-24 → GN.2

Routing record SHA-256: `404f19e0a6004383c558f6b8b9de183e156de3cccbf7d154a9cd0c51de5b2025`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-BERGSTROM-FABER-PAYNE-24/quadric-classification`

### PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20 → GN.5

Routing record SHA-256: `6aefc118079f198be03aaffb2eb23470bbcd02314c2b036b633c05c0e08cee94`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/primitive-prefix-extension`
- `PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20/reduced-basis-product`

### PAPER-BHARGAVA-SHANKAR-WANG-22 → GN.3

Routing record SHA-256: `2a286f8acdb74e9246cd144dc704f7c0c30be24292b0f394c60e25cbbba22019`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-BHARGAVA-SHANKAR-WANG-22/73`

### PAPER-BHARGAVA-SHANKAR-WANG-25 → GN.4

Routing record SHA-256: `76dbb8c657cdbc0636f6503a85c0d927963c378e11c145d9804e3f3f5c883af7`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-BHARGAVA-SHANKAR-WANG-25/31`
- `PAPER-BHARGAVA-SHANKAR-WANG-25/39`
- `PAPER-BHARGAVA-SHANKAR-WANG-25/40`
- `PAPER-BHARGAVA-SHANKAR-WANG-25/41`
- `PAPER-BHARGAVA-SHANKAR-WANG-25/42`
- `PAPER-BHARGAVA-SHANKAR-WANG-25/43`

### PAPER-BHARGAVA-SHANKAR-WANG-25 → GN.3

Routing record SHA-256: `76dbb8c657cdbc0636f6503a85c0d927963c378e11c145d9804e3f3f5c883af7`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-BHARGAVA-SHANKAR-WANG-25/70`

### PAPER-BROWNING-LEBOUDEC-SAWIN-23 → GN.0

Routing record SHA-256: `95aa32a173194f4c6456bf8397b05fa882584d754b25ba099587d4ff85c831bd`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/kernel`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/congruence`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/lattice`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/covolume`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/projection-quotient`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/primitive-lattice`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/orthogonal-lattice`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/dual`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/schmidt-dual`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/minor-gcd`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/intersection-det`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/congruence-det`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/mixed-det`

### PAPER-BROWNING-LEBOUDEC-SAWIN-23 → GN.4

Routing record SHA-256: `95aa32a173194f4c6456bf8397b05fa882584d754b25ba099587d4ff85c831bd`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/cone`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/transference`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/band-count`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/ball-count`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/ball-count-index`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/short-count`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/short-count-refined`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/dyadic-lattices`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/dyadic-bound`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/I-volume`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/I-asymptotic`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/J-volume`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/J-asymptotic`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/weighted-lattice`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/primitive-ball-input`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/bw-count`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/schmidt-extension-count`
- `PAPER-BROWNING-LEBOUDEC-SAWIN-23/davenport-reduced-basis`

### PAPER-BRUINIER-EHLEN-YANG-21 → GN.2

Routing record SHA-256: `06e7fe053d7a9c49119d3e26a000df5839295901637cf87857db3748abe24d91`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-BRUINIER-EHLEN-YANG-21/11`
- `PAPER-BRUINIER-EHLEN-YANG-21/12`

### PAPER-CALMES-ETAL-26 → GN.6, GN.2

Routing record SHA-256: `bbbad6e366b8fe5bdc9a3b05be9ceffa1e41fa398374103406948fa685e850c1`. Headline number-ring/invert-two and integer-table outcomes have source-scoped nodes; generic stable Poincare/2-completion and remaining local-global proof inputs remain the listed framework gaps.

- `PAPER-CALMES-ETAL-26/5`
- `PAPER-CALMES-ETAL-26/7`
- `PAPER-CALMES-ETAL-26/13`
- `PAPER-CALMES-ETAL-26/406`
- `PAPER-CALMES-ETAL-26/407`
- `PAPER-CALMES-ETAL-26/408`
- `PAPER-CALMES-ETAL-26/410`
- `PAPER-CALMES-ETAL-26/411`
- `PAPER-CALMES-ETAL-26/412`
- `PAPER-CALMES-ETAL-26/413`
- `PAPER-CALMES-ETAL-26/426`
- `PAPER-CALMES-ETAL-26/427`
- `PAPER-CALMES-ETAL-26/429`
- `PAPER-CALMES-ETAL-26/430`
- `PAPER-CALMES-ETAL-26/431`
- `PAPER-CALMES-ETAL-26/432`
- `PAPER-CALMES-ETAL-26/433`
- `PAPER-CALMES-ETAL-26/434`
- `PAPER-CALMES-ETAL-26/435`
- `PAPER-CALMES-ETAL-26/437`
- `PAPER-CALMES-ETAL-26/438`
- `PAPER-CALMES-ETAL-26/439`

### PAPER-CHARLES-16 → GN.2, GN.3

Routing record SHA-256: `d638fb89ffdd91c34c2e11d587379a7bb27e19c6cd4e2b3caf59200a36961460`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-CHARLES-16/36`
- `PAPER-CHARLES-16/37`
- `PAPER-CHARLES-16/38`
- `PAPER-CHARLES-16/39`
- `PAPER-CHARLES-16/40`
- `PAPER-CHARLES-16/87`
- `PAPER-CHARLES-16/107`
- `PAPER-CHARLES-16/110`
- `PAPER-CHARLES-16/115`
- `PAPER-CHARLES-16/118`
- `PAPER-CHARLES-16/131`
- `PAPER-CHARLES-16/142`
- `PAPER-CHARLES-16/nikulin-embedding-data`
- `PAPER-CHARLES-16/hyperbolic-genus-uniqueness`
- `PAPER-CHARLES-16/negative-rank-one-complement`
- `PAPER-CHARLES-16/nonprimitive-obstruction`
- `PAPER-CHARLES-16/explicit-primitive-splitting`
- `PAPER-CHARLES-16/explicit-positive-plane`
- `PAPER-CHARLES-16/explicit-orthogonal-class`
- `PAPER-CHARLES-16/explicit-prime-to-n`
- `PAPER-CHARLES-16/reciprocal-pair`
- `PAPER-CHARLES-16/reciprocal-discriminant`
- `PAPER-CHARLES-16/integral-orthogonal-split`
- `PAPER-CHARLES-16/unit-representation-lift`
- `PAPER-CHARLES-16/rank-one-norm`
- `PAPER-CHARLES-16/compatible-system-norm`
- `PAPER-CHARLES-16/prime-power-residues`
- `PAPER-CHARLES-16/unit-norm-primitive`
- `PAPER-CHARLES-16/cayley-discriminant`

### PAPER-CHENEVIER-TAIBI-20 → GN.2

Routing record SHA-256: `ee4df7d5c91440e1990291b49b8883e2f626d2f5d631292871ad2bd355706e69`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-CHENEVIER-TAIBI-20/regular-quadratic-forms`
- `PAPER-CHENEVIER-TAIBI-20/gspin-spin-sequences`
- `PAPER-CHENEVIER-TAIBI-20/zassenhaus`
- `PAPER-CHENEVIER-TAIBI-20/corollary-3-6`
- `PAPER-CHENEVIER-TAIBI-20/prop-3-7`

### PAPER-COUVEIGNES-20 → GN.0, GN.1

Routing record SHA-256: `11ef13cf509aa0411e75de0979db47a0f091b543a9f160f8f2c5a541902031c5`. Four routed consequences have explicit inherited nodes; verify their pinned proof adapters, preserving current node IDs.

- `PAPER-COUVEIGNES-20/primitive-orthogonal-covolume`
- `PAPER-COUVEIGNES-20/ordered-product-bound`
- `PAPER-COUVEIGNES-20/euclidean-ball-bound`
- `PAPER-COUVEIGNES-20/hadamard-gram`

### PAPER-DUKE-IMAMOGLU-TOTH-16 → GN.2, GN.3, GN.4

Routing record SHA-256: `a2d281f452853e47606a1482be9319938a398cfb0fc0861867b329ee1db27c41`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-DUKE-IMAMOGLU-TOTH-16/6`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/7`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/8`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/9`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/10`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/11`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/12`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/13`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/24`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/25`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/26`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/51`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/52`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/53`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/54`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/55`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/69`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/70`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/71`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/143`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/146`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/148`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/150`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/153`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/154`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/narrow-class-number`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/fundamental-discriminant-forms-primitive`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/geodesic-and-cm-main-terms`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/cycle-integral-convention`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/oriented-cycle-of-a-form`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/101`
- `PAPER-DUKE-IMAMOGLU-TOTH-16/102`

### PAPER-FENG-GALATIUS-VENKATESH-22 → GN.6

Routing record SHA-256: `94f9c25384c0f17a0c3c0528ee3e85aa9eddb4b913e15ac0e0c8f6646ecf1832`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-FENG-GALATIUS-VENKATESH-22/25`

### PAPER-FENG-YUN-ZHANG-24 → GN.3

Routing record SHA-256: `a7d0bf0d941d8500b29e2fd0f62fe6a71d322168a4b55b5e2386c753bac26670`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-FENG-YUN-ZHANG-24/4`
- `PAPER-FENG-YUN-ZHANG-24/5`

### PAPER-GHOSH-SARNAK-22 → GN.4

Routing record SHA-256: `0629eae571be6f8f8d221aab0e8cdc4fce29f3546eabbf3dab4f4de07eab6249`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-GHOSH-SARNAK-22/29`
- `PAPER-GHOSH-SARNAK-22/30`
- `PAPER-GHOSH-SARNAK-22/31`
- `PAPER-GHOSH-SARNAK-22/32`
- `PAPER-GHOSH-SARNAK-22/45`

### PAPER-HE-LI-SHI-ETAL-23 → GN.3

Routing record SHA-256: `8329c2616614a5722c36638c7289dc1d07c5a15992ca729be53b168963dc3342`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-HE-LI-SHI-ETAL-23/2`
- `PAPER-HE-LI-SHI-ETAL-23/3`
- `PAPER-HE-LI-SHI-ETAL-23/22`
- `PAPER-HE-LI-SHI-ETAL-23/23`
- `PAPER-HE-LI-SHI-ETAL-23/24`
- `PAPER-HE-LI-SHI-ETAL-23/25`
- `PAPER-HE-LI-SHI-ETAL-23/26`
- `PAPER-HE-LI-SHI-ETAL-23/27`
- `PAPER-HE-LI-SHI-ETAL-23/28`
- `PAPER-HE-LI-SHI-ETAL-23/30`
- `PAPER-HE-LI-SHI-ETAL-23/31`
- `PAPER-HE-LI-SHI-ETAL-23/32`
- `PAPER-HE-LI-SHI-ETAL-23/33`
- `PAPER-HE-LI-SHI-ETAL-23/34`
- `PAPER-HE-LI-SHI-ETAL-23/35`
- `PAPER-HE-LI-SHI-ETAL-23/36`
- `PAPER-HE-LI-SHI-ETAL-23/37`

### PAPER-ICHINO-PRASANNA-23 → GN.2

Routing record SHA-256: `32857bd2ec192bf97fe76772a5b3fbc8663ada19b0aa0415adf69b78d91cfc57`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-ICHINO-PRASANNA-23/017`

### PAPER-KHAYUTIN-19 → GN.2, GN.4

Routing record SHA-256: `a5d2c98c8abb4d87c234674e2abc3f9c8f23c34e2e422daa370d4d113b1ae93d`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-KHAYUTIN-19/95`
- `PAPER-KHAYUTIN-19/108`

### PAPER-KOYMANS-MILOVIC-21 → GN.4

Routing record SHA-256: `14ad30ba549d46340f3610bd5d069ab5eb7043bf15b184b9e4e6ab2635cb8c90`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-KOYMANS-MILOVIC-21/17`

### PAPER-KURINCZUK-SKODLERACK-STEVENS-21 → GN.2

Routing record SHA-256: `bea75936f4057e8ce86071b35b6d54f81ae526e087b52b7017c2cc8f16b2a4fb`. Selected norm/signed determinant/Witt/twist/transfer results in §§3.1–3.5 have new nodes. Split Proposition 3.15 determinant and rank-one signs; acquire [39] Theorem 4.4 for maximal transfer; check every one of the 18 routed items individually.

- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/13`
- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/14`
- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/16`
- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/30`
- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/31`
- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/32`
- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/38`
- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/39`
- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/40`
- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/41`
- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/42`
- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/43`
- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/44`
- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/45`
- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/46`
- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/47`
- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/48`
- `PAPER-KURINCZUK-SKODLERACK-STEVENS-21/49`

### PAPER-LESLIE-25 → GN.2, GN.3

Routing record SHA-256: `c502c65e1f6e98b351fe6b55ae18d46994e7a1e2fc3bf705dd0833d28dc56bc4`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-LESLIE-25/30`
- `PAPER-LESLIE-25/36`

### PAPER-LI-23 → GN.2

Routing record SHA-256: `77bb8bb90cd7845676b3b2e41684ade79dff1de3be90b48fae58f535747daf57`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-LI-23/10`
- `PAPER-LI-23/11`
- `PAPER-LI-23/43`
- `PAPER-LI-23/67`
- `PAPER-LI-23/68`
- `PAPER-LI-23/69`

### PAPER-LI-23 → GN.3

Routing record SHA-256: `77bb8bb90cd7845676b3b2e41684ade79dff1de3be90b48fae58f535747daf57`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-LI-23/12`

### PAPER-LI-LIU-22 → GN.3

Routing record SHA-256: `69c03532920eacb73fb955b9aefd2a3203bcb8b88465578e1a1428e6a00166f8`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-LI-LIU-22/38`
- `PAPER-LI-LIU-22/39`
- `PAPER-LI-LIU-22/40`
- `PAPER-LI-LIU-22/41`
- `PAPER-LI-LIU-22/42`
- `PAPER-LI-LIU-22/43`
- `PAPER-LI-LIU-22/44`
- `PAPER-LI-LIU-22/45`
- `PAPER-LI-LIU-22/46`

### PAPER-LI-ZHANG-22-B → GN.3

Routing record SHA-256: `f0699f58e794df256c54a21b62db5e38964bbd21611329df73a5826564d7dea7`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-LI-ZHANG-22-B/2`
- `PAPER-LI-ZHANG-22-B/3`
- `PAPER-LI-ZHANG-22-B/4`
- `PAPER-LI-ZHANG-22-B/5`
- `PAPER-LI-ZHANG-22-B/6`
- `PAPER-LI-ZHANG-22-B/7`
- `PAPER-LI-ZHANG-22-B/8`
- `PAPER-LI-ZHANG-22-B/9`
- `PAPER-LI-ZHANG-22-B/10`
- `PAPER-LI-ZHANG-22-B/11`
- `PAPER-LI-ZHANG-22-B/12`
- `PAPER-LI-ZHANG-22-B/13`
- `PAPER-LI-ZHANG-22-B/14`
- `PAPER-LI-ZHANG-22-B/15`
- `PAPER-LI-ZHANG-22-B/16`
- `PAPER-LI-ZHANG-22-B/17`
- `PAPER-LI-ZHANG-22-B/18`
- `PAPER-LI-ZHANG-22-B/19`
- `PAPER-LI-ZHANG-22-B/20`

### PAPER-LI-ZHANG-22 → GN.3

Routing record SHA-256: `f89f9906c139af206e14daf966ff6fd755ef80173e8d4856c35dbda7e5008deb`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-LI-ZHANG-22/5`
- `PAPER-LI-ZHANG-22/6`
- `PAPER-LI-ZHANG-22/7`
- `PAPER-LI-ZHANG-22/8`
- `PAPER-LI-ZHANG-22/9`
- `PAPER-LI-ZHANG-22/10`
- `PAPER-LI-ZHANG-22/11`
- `PAPER-LI-ZHANG-22/12`
- `PAPER-LI-ZHANG-22/13`
- `PAPER-LI-ZHANG-22/14`

### PAPER-LIPNOWSKI-TSIMERMAN-18 → GN.2

Routing record SHA-256: `afe626cca9703cf932be5264e31ab90757250d366f5b20577f52050746e7a626`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-LIPNOWSKI-TSIMERMAN-18/local-order`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/saturation-normalization`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/flag-fiber`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/model-ring`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/unit-norm-label`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/unitary-group`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/hermitian-lattice`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/hermitian-dual`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/gram-orbit-bijection`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/norm-ideal`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/local-hermitian-classification`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/hermitian-genus`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/free-projective-comparison`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/monogenic-conductor-bound`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/coefficient-dvr-model`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/isotypic-stabilizer-congruence-bound`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/finite-dvr-determinant-index`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/good-prime-lattice-orbit`

### PAPER-LIPNOWSKI-TSIMERMAN-18 → GN.3

Routing record SHA-256: `afe626cca9703cf932be5264e31ab90757250d366f5b20577f52050746e7a626`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-LIPNOWSKI-TSIMERMAN-18/extension-shear`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/yun-resultant-fiber`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/extension-determinant-bound`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/punctual-hilbert-count`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/yun-partition-formula`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/hilbert-crude-bound`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/model-orbit-count`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/genus-double-cosets`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/hermitian-mass`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/tamagawa-mass`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/relative-discriminant`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/factorial-asymptotic`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/finite-integral-group`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/mass-cardinality-comparison`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/ramification-count`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/weighted-partition-cumulative-bound`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/rank-one-local-class-bound`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/repeated-block-orbit-bound`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/semisimple-local-orbit-bound`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/adelic-local-orbit-bound`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/nonisotypic-stabilizer-bound`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/density-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/mass-asymptotic-source`
- `PAPER-LIPNOWSKI-TSIMERMAN-18/model-count-source`

### PAPER-LIU-WOOD-ZUREICKBROWN-24 → GN.4

Routing record SHA-256: `45c329e1b5c42a6a58625d19eafe3d4373933b5415ff4390498c4d52a7e0e7b7`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-LIU-WOOD-ZUREICKBROWN-24/42`

### PAPER-MAULIK-SHANKAR-TANG-22 → GN.1, GN.3, GN.4

Routing record SHA-256: `8beae85be9bda8b97f752f24ba89d638dbf6e921f53ceef45a136b9cea918313`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-MAULIK-SHANKAR-TANG-22/74`
- `PAPER-MAULIK-SHANKAR-TANG-22/75`
- `PAPER-MAULIK-SHANKAR-TANG-22/68`
- `PAPER-MAULIK-SHANKAR-TANG-22/82`

### PAPER-NELSON-VENKATESH-21 → GN.4

Routing record SHA-256: `903d6c393975d611b545a83eea787bd224d35035bfd2d615b10f2d55dff3269f`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-NELSON-VENKATESH-21/89`
- `PAPER-NELSON-VENKATESH-21/113`

### PAPER-SHANKAR-SHANKAR-TANG-ETAL-22 → GN.3

Routing record SHA-256: `16b8ab4b400b1e5f59a63f27fef880629677186f9a2e42e4ceb920528db6b567`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/39`
- `PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/40`
- `PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/41`
- `PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/42`
- `PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/43`
- `PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/44`
- `PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/45`
- `PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/46`
- `PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/47`

### PAPER-SHANKAR-SHANKAR-TANG-ETAL-22 → GN.1, GN.4

Routing record SHA-256: `16b8ab4b400b1e5f59a63f27fef880629677186f9a2e42e4ceb920528db6b567`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/77`
- `PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/78`
- `PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/79`

### PAPER-SMITH-24 → GN.1

Routing record SHA-256: `4772090521bfca646019acbdf6c2a95368d135ce11da33b6a813049619d4d4f7`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-SMITH-24/21`
- `PAPER-SMITH-24/23`
- `PAPER-SMITH-24/68`

### PAPER-ZHANG-21 → GN.2

Routing record SHA-256: `ab3c835cbbc0c1d34c3f4604670f1c143d74e36e0b6a905704e96256cdaec1d4`. Check every listed item against the current node statements, acquire its exact primary proof, and split any unmatched GN-owned declaration. A routing ID is inventory evidence, not proof coverage; request only the other owner’s actual supplying stage.

- `PAPER-ZHANG-21/1`

## Sources and reading boundaries

All statements above are in the workers’ own words. No source passage or section-by-section digest is reproduced. Exact versions and selected theorem/section/page locators identify the evidence. Earlier acquisition/read claims belong to prior authoring/review sessions unless the entry explicitly records revision codex-bfXOl0 on 9 October 2026. A cited foundational proof outside the read boundary remains an acquisition gap. No cleared library book was newly used in this revision.

### Couveignes2020

Enumerating number fields. Jean-Marc Couveignes.

Version: [Annals of Mathematics 192 (2020), 487–497; published PDF, 11 pages.](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf).

Acquired SHA-256: `8d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104`.

- Reading scope: Entire article, printed pp.487–497, including proofs, number-field normalization, interpolation input, relation lattice and references.
- Reading scope: Printed pp.493–494 additionally checked as page images: orthogonal primitive lattices, Hermitian Gram bound, closed ball and ordered relation norms.

### MathlibPin

Pinned inner-product, lattice and measure proofs. The Mathlib contributors.

Version: [Mathlib commit 082e2d37e8b0463410cdb532e111cd43d5a66174](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib).

- Reading scope: Analysis/InnerProductSpace/GramMatrix.lean in full; GramSchmidtOrtho.lean lines35–240 and305–381; Basic.lean Cauchy–Schwarz statement/proof.
- Reading scope: Algebra/Module/ZLattice/Covolume.lean lines1–239; Basic.lean fundamental-domain definition, almost-everywhere parallelepiped comparison, IsZLattice and ofZLatticeBasis.
- Reading scope: MeasureTheory/Measure/Haar/InnerProductSpace.lean lines45–159; Measure/Lebesgue/Basic.lean box volume statements and proofs.
- Reading scope: Analysis/InnerProductSpace/PiL2.lean Euclidean norm-square identities; Analysis/SpecialFunctions/Pow/Real.lean positive inverse-power comparison.
- Reading scope: LinearAlgebra/Matrix/Determinant/Basic.lean det_mul and det_conjTranspose; Matrix/Block.lean upper-triangular determinant; Dimension/Constructions.lean finrank_span_eq_card.
- Reading scope: Analysis/InnerProductSpace/Orientation.lean lines175–300, including existing real volume-form Hadamard inequality.
- Reading scope: LinearAlgebra/BilinearForm/DualLattice.lean in full; Properties.lean dualBasis, its pairing characterization and double-dual basis results; FreeModule/PID.lean SmithNormalForm structure and exists_smith_normal_form_of_le proof.
- Reading scope: Algebra/Module/ZLattice/Basic.lean discrete/full span-basis instances, finite/free discrete-submodule instances, ofZLatticeBasis and comap; Basis/Submodule.lean restrictScalars; Basis/SMul.lean unit scaling.
- Reading scope: Projection/Basic.lean complementary subspaces, projection kernel and projected inner products; LinearAlgebra/Projection.lean prodEquivOfIsCompl; Basis/Prod.lean product basis.
- Reading scope: PiL2.lean stdOrthonormalBasis, inner_eq_ite and mixed coordinate pairing; Matrix/Determinant/Basic.lean det_fromBlocks_zero₂₁ statement/proof opening.

### HoreshKarasik2023

Equidistribution of primitive lattices in R^n. Tal Horesh and Yakov Karasik.

Version: [The Quarterly Journal of Mathematics 74 (2023), 1253–1294, DOI 10.1093/qmath/haad008; version of record deposited at ISTA.](https://research-explorer.ista.ac.at/download/14717/14720/2023_QuarterlyJourMath_Horesh.pdf).

Acquired SHA-256: `f2a508029153b8428ff428732cf91e8d9d765650fc49217e9672ff7b2e826880`.

- Reading scope: Appendix introduction and A.1–A.4, printed pp.1284–1285, including full selected proofs and intrinsic-covolume convention.
- Reading scope: A.5–A.6 and their surrounding geometric/Haar-measure explanation, pp.1285–1286, only to compare the preprint proof issue; not imported as a node.
- Reading scope: B.1–B.7, printed pp.1289–1291, including full basis-completion, factor-volume and projected-dual proofs; pp.1290–1291 visually checked.
- Reading scope: Orientation convention and Definitions 2.1–2.2, pp.1260–1261, only to check the sign convention in B.4.

### HoreshKarasik2021v2

Equidistribution of primitive lattices in R^n. Tal Horesh and Yakov Karasik.

Version: [arXiv:2012.04508v2, 28 October 2021; superseded by the 2023 published text.](https://arxiv.org/pdf/2012.04508v2).

Acquired SHA-256: `f52ef00f945cfec330e68be260d6f83af27fe2067ac91e361de5afba94927aa5`.

- Reading scope: Appendix introduction and A.1–A.6, pp.27–29, selected definitions, full dual-basis and reciprocal-volume proofs, and version-comparison errors.
- Reading scope: B.1–B.6, pp.33–34, full selected proofs.

### EvertseGeometry

Diophantine approximation, Chapter 2: Geometry of numbers. Jan-Hendrik Evertse.

Version: [Author-hosted dio19-2.pdf linked by the Fall 2023 course page; accessed 2026-09-27. No journal version is alleged.](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf).

Acquired SHA-256: `99194d1c4a670d42219e277d5b9945d5e80ef159c3969ac1e0e467c304586063`.

- Reading scope: Physical pp.1–7 (printed 11–17): lattice/index and convex-body/gauge preliminaries; first-theorem statement and beginning of its proof. The first theorem is imported from the pin, not reconstructed.
- Reading scope: Physical p.5 (printed 15): dilation and the explicit invertible-linear-transformation convention.
- Reading scope: Physical pp.10–18 (printed 20–28): linear forms, approximation context, full successive-minima attainment and sharp lower proof, plus statements of Hermite/John consequences.
- Reading scope: §2.3 printed pp.23–27 supplies the complete proof slice decomposed here. The full 28-page chapter is not claimed read; the Hermite proof is not claimed read.
- Reading scope: Physical p.16 / printed p.26 visually inspected for Lemma 2.10’s coefficient index.

### Henk2002

Successive Minima and Lattice Points. Martin Henk.

Version: [arXiv:math/0204158v1 (12 April 2002), seven-page preprint. Author bibliography lists Rend. Circ. Mat. Palermo (2), Suppl.70 (2002), 377–384; the publisher text was not obtained.](https://arxiv.org/pdf/math/0204158v1).

Acquired SHA-256: `403d8f400cfd8a823260466713ef90bc7425c5be0677b986388b43da78608b60`.

- Reading scope: All seven physical pages, in batches of at most three: Definition 1.1, first/second-theorem statements, Conjecture 1.4, Theorem 1.5 and Lemma 2.1 proof, and the complete §3 proof of the upper second theorem.
- Reading scope: The §3 adapted-flag/translate-union/Fubini proof is a precise continuation input, not a decomposed upper theorem in this packet.
- Reading scope: Physical p.2 visually inspected for the floor/ceiling wording.
- Reading scope: Continuation codex-a71f92: all seven pages reread; rendered pp.3–5 checked for Lemma 2.1, (1.3), the strict versus non-strict signs, q_i rounding and Theorem 1.5. Lemma 2.1 and (1.3) are decomposed here; the full product estimate is not.
- Reading scope: Third continuation codex-a71f92: complete seven-page text freshly reread from the identical acquired arXiv v1; rendered pp.4–5 checked again. The complete Theorem 1.5 dependency chain is now decomposed, including the p.3 compatible integral flag. Section 3 sharp upper Minkowski remains a precise open proof chain. No new source finding, publisher collation or correction-search claim.
- Reading scope: Fourth continuation codex-a71f92: all seven pages freshly text-read; rendered p.6 checked for f₁/f₂, the pointwise section translation and codimension exponent. Seven analytic auxiliary nodes for §3 are decomposed. The lattice-box grouping, ratio assembly, telescoping and large-box limit remain open. No publisher acquisition, new erratum or new correction-search claim.
- Reading scope: Fifth continuation codex-a71f92: all seven pages freshly text-read and rendered pp.5–7 inspected for (3.1)–(3.6), the row counts, weighted ratio exponents and final limit. Fourteen additional nodes now close the sharp upper product proof at planning granularity, including the native integral-basis covolume normalization. Earlier read-scope entries describe the checkpoint at which they were recorded. Publisher text not obtained; no new correction search or source finding.

### LLL1982

Factoring polynomials with rational coefficients. A. K. Lenstra, H. W. Lenstra, Jr., L. Lovász.

Version: [Math. Ann. 261 (1982), 515–534; scanned academic mirror with reprint folios 27–46; locators below use physical PDF pages and equation numbers, not the reprint folio as journal pagination.](https://www.math.ucdavis.edu/~deloera/MISC/LA-BIBLIO/trunk/Lovasz/LovaszLenstraLenstrafactor.pdf).

Acquired SHA-256: `dabefb8bcfb5dbb8b36a43745081f8ab6f18aadc85b1e252fd7c85abefc5f704`.

- Reading scope: Physical pp.1–8 visually read in full: introduction and §1 through termination and the statement of Proposition 1.26; complexity proof on p.9 and polynomial factoring sections not read.
- Reading scope: Revision codex-bfXOl0, 2026-10-09: rendered physical pp.2–8 reread for the Gram–Schmidt updates, reduction loop, prefix determinants and termination; locator folios 31–34 mean physical pp.5–8, not journal pp.31–34. Proposition 1.26 complexity proof is not read or planned.

### Voight2026

Quaternion algebras. John Voight.

Version: [Author post-publication v.1.0.7u, 5 August 2026; 883 physical pages; not represented as the unchanged 2021 publisher text.](https://jvoight.github.io/quat-book.pdf).

Acquired SHA-256: `a9316b834dbd500c52cd3a981c3205c9f4145b217042b213d23f696aee84b0f0`.

- Reading scope: Physical pp.157–168 / printed pp.137–148: §9.3–9.8, including full local-global lattice proofs and completion descent; the normalized-form proof cites an external algorithm, recorded as a gap. No whole-book reading or publisher collation is claimed.

### LiZhangDensity

Kudla–Rapoport cycles and derivatives of local densities. Chao Li, Wei Zhang.

Version: [arXiv:1908.01701v3, 92 pages; version used by the routed extraction.](https://arxiv.org/pdf/1908.01701v3).

Acquired SHA-256: `7db1843f90c3e79741f8d58d92b6bb42b0a3b7ae001c8f9419f43b08c2119d49`.

- Reading scope: Physical pp.2–4, 8–9, 14–19, 20–24 read: intro hypotheses; §1.7 hermitian lattices and measure normalization; §3 representation densities, normalized polynomial and Cho–Yamauchi formula including the p.18 proof. Geometric intersection sections are contextual reading, not mathematical claims owned by GN. Hironaka, Cho–Yamauchi, Kitaoka and Gan–Yu proofs cited by §3 were not acquired.
- Reading scope: Revision codex-bfXOl0, 2026-10-09: §1.7 p.8 reread for the elementary-divisor normalization and inverse Gram conventions. Finite quotient-module existence is separately supplied by pinned Module.PID.

### Schlichting2010

Hermitian K-theory of exact categories. Marco Schlichting.

Version: [Published-layout academic copy, J. K-Theory 5 (2010), 105–165, DOI 10.1017/is009010017jkt075, 61 pages.](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/schlicht.pdf).

Acquired SHA-256: `fdcf61c0e9e41550b7aaf8d34f2e9deb3276b0a6f8e59f9fb3262018b7052f0e`.

- Reading scope: Physical pp.1–19 / printed pp.105–123: exact duality, symmetric spaces, Lagrangians, isotropic reduction, degree-zero GW/W, form functors, hermitian Q, GW space, formations and degree-zero comparison, with selected proofs in full. Physical pp.36–37 / printed 140–141: s-filtering conditions, exact quotient and localization statement; the remaining localization proof is not read.
- Reading scope: Physical p.55, pp.57–58, and tail of p.56 read: cone swindle, filtering consequence, hermitian suspension, delooping and nonconnective Ω-spectrum warning. Full §9.1 cone setup and §5 cofinality proof not read.
- Reading scope: Revision codex-bfXOl0, 2026-10-09: §§2.2,2.5 pp.110–112, §§3.1–3.2 pp.113–114, Definition 4.1/Remark 4.3 pp.116–117, complete §4.3 pp.119–122 and Lemma 4.15 proof pp.123–124; complete §§5.1–5.3 pp.124–128; §8.1–8.2 setup pp.140–142 and Lemma 8.5 statements (full localization proof remains unread); complete §§9.1–9.2 pp.154–162 including all Lemmas 9.2–9.5 proofs, suspension/cofinality and nonconnective definitions. Earlier narrower entries are historical, not the current read boundary.

### SchlichtingDerived

Hermitian K-theory, derived equivalences and Karoubi’s Fundamental Theorem. Marco Schlichting.

Version: [arXiv:1209.0848v3, 7 September 2016; PDF acquired through unversioned URL and version established from its first page, 119 pages.](https://arxiv.org/pdf/1209.0848v3).

Acquired SHA-256: `f18bf8e3950871bfc00ef1e51a11e17c2c9107b473f1ff7a5c36e2fac53e4dc0`.

- Reading scope: Physical pp.1–4 introduction read: uniquely 2-divisible mapping-complex hypothesis, derived invariance, Bott triangle and shifted rather than homotopy-degree periodicity. Full §6 proofs remain precise gaps.

### CalmesIII

Hermitian K-theory for stable infinity-categories III: Grothendieck–Witt groups of rings. Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus, Wolfgang Steimle.

Version: [arXiv:2009.07225v4, 63 pages; exact version of the current extraction.](https://arxiv.org/pdf/2009.07225v4).

Acquired SHA-256: `1e4b6720055ebdce0012f5780bfc7cdb5b853e32f29b17224a1be0bc676f770c`.

- Reading scope: Physical pp.1–8 read: introduction and Recollection R.1–R.5. Physical pp.49–57 read: §3.1 homotopy-limit results and proofs; §3.2 symmetric/symplectic integral groups and their proof, duality action and low-degree table. Generic stable Poincaré/flavour theory belongs to the routed HermitianKTheoryOfPoincareCategories owner, not a second GN definition.
- Reading scope: Physical pp.36–40 read in full: linking duality, canonical residue dualizing line, Corollary 2.2.5, ramified-uniformizer warning and symmetric-only dyadic devissage. The p.41 continuation of the explicit residue-boundary proof was not read.
- Reading scope: Revision codex-bfXOl0, 2026-10-09: Proposition 3.1.13 and Remark 3.1.14 pp.53–54; §3.2 pp.54–61, tables, the eight residue rows, Proposition 3.2.9 and Corollaries 3.2.10–3.2.13 with their printed proofs. Other generic stable Poincare proof sections remain the routed framework owner’s inputs.

### BhargavaShankar2010

Binary quartic forms having bounded invariants, and the boundedness of the average rank of elliptic curves. Manjul Bhargava, Arul Shankar.

Version: [arXiv:1006.1002v2, 50 pages.](https://arxiv.org/pdf/1006.1002v2).

Acquired SHA-256: `c9dfd70eff16e6898bc034b9f6d3d77e0c4afe40753894dc34a20c588d640a07`.

- Reading scope: Physical p.14 in full: Proposition 2.5 bounded semialgebraic multiset estimate and triangular-unipotent variant; its Davenport/Rogers proof inputs have not been acquired. No whole-paper claim.

### Duke1988

Hyperbolic distribution problems and half-integral weight Maass forms. W. Duke.

Version: [Published-layout author copy, Invent. Math. 92 (1988), 73–90.](https://www.math.ucla.edu/~wdduke/preprints/hyperbolic.pdf).

Acquired SHA-256: `3c468d0c0d79ec2ab29f96dcdda6094a4ceb6603a4caaae947c0bef443f9005f`.

- Reading scope: Physical pp.1–3 / printed pp.73–75 read in full: spherical lattice-point application, theta/Weyl sum identity, square-free restrictions and Theorem 1. Full analytic coefficient proof and §§3–6 not read.

### Benoist2019

Arithmeticity of discrete subgroups. Yves Benoist.

Version: [Author notes for 2018/2019 lectures, 43 pages.](https://www.imo.universite-paris-saclay.fr/~yves.benoist/prepubli/19ArithmeticityLectures.pdf).

Acquired SHA-256: `d5e8b727b09c39ca74be90009e1e0e15430ed6611799d696a812acaf4ef68d6b`.

- Reading scope: Physical pp.1–7 and19–21 read: actual quotient measure/lattice conventions, Mahler statement, Howe–Moore and Dani–Margulis recurrence statements, closed semisimple orbit finite-volume proof. Original mixing/recurrence proofs are cited but omitted by these notes, so remain gaps.

### MorrisArithmetic

Introduction to Arithmetic Groups. Dave Witte Morris.

Version: [arXiv:math/0106063v6, 7 May 2015, 491 physical pages.](https://arxiv.org/pdf/math/0106063v6).

Acquired SHA-256: `4c0936b5321dc09338730b411ef62e6fffc9060d0146f30a24e65a5ada47df77`.

- Reading scope: First page and physical p.59 / printed p.43 standing hypotheses; physical pp.412–415 / printed pp.396–399 reduction-theory context; physical pp.420–423 and426–429 / printed pp.404–407,410–413: Ratner orbit/measure/equidistribution statements and Margulis quadratic-value proof for three variables. Full Ratner proofs, higher-dimensional Oppenheim reduction and the rest of the book not read.

### RegevTransference

Transference Theorems, Lattices in Computer Science, Lecture 11. Oded Regev; scribe Elad Verbin.

Version: [Fall 2004, author-hosted lecture notes](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf).

Acquired SHA-256: `11986af4502c60d4d53ad4db111d51b039845943af013fc54d2154e8396b0cf2`.

- Reading scope: Physical pp.1–2 read in full: Theorem 1 and Remark 1, covering radius, cubic-lattice example and Claim 3 proof. Theorem 4 is stated with the weaker constant n; its pp.3–6 proof and the original 1993 proof were not read.
- Reading scope: Revision codex-bfXOl0, 2026-10-09: all six pages read, including the full Gaussian proof pp.3–6. The weaker finite-dimensional n constant is decomposed; no claim to the original stronger Banaszczyk theorem proof.

### StephensDavidowitz2019

An improved constant in Banaszczyk’s transference theorem. Divesh Aggarwal; Noah Stephens-Davidowitz.

Version: [arXiv:1907.09020v1, 21 July 2019](https://arxiv.org/pdf/1907.09020).

Acquired SHA-256: `58e81f63fa837e02dfcfcea417b0c2411a53128d935c95a43ea146628194c39e`.

- Reading scope: Physical pp.1–2 read in full: actual Euclidean dual/radius conventions and Theorems 1.1–1.2. The asymptotic improved constant is not exported as a uniform finite-dimensional bound; pp.3–6 proof not read.

### Kirschmer2013

One-class genera of maximal integral quadratic forms. Markus Kirschmer.

Version: [Author preprint, June 2013](https://www.math.rwth-aachen.de/~Markus.Kirschmer/papers/maxgen.pdf).

Acquired SHA-256: `d128be3ded05632cfad338ce627ec62093d6b7d18e0f47d13b1f61a46847f2e7`.

- Reading scope: Physical pp.1–5 read in full: integral/maximal lattice and genus definitions, local-type table, local mass factor table, Theorem 3.3 and beginning of Proposition 3.4 proof. Original Shimura/Gan–Hanke–Yu mass proof not acquired; remainder of classification not read.

### Mahler1946

On lattice points in n-dimensional star bodies I. Existence theorems. Kurt Mahler.

Version: [Published-layout archival copy, Proc. Royal Society A 187 (1946), 151–187.](https://carmamaths.org/resources/mahler/docs/090.pdf).

Acquired SHA-256: `ed79da4f0ea93c92fad57ede5568bd7e1b9085b8c1507f81080533810fcbba03`.

- Reading scope: §§1–2, printed pp.151–154; §§6–7, pp.158–159

### SchulzePillot2020

Lecture notes on quadratic forms and their arithmetic. Rainer Schulze-Pillot.

Version: [arXiv:2008.12847v2, 21 March 2021; acquired 2026-10-09, 143 physical pages; locators use printed folios.](https://arxiv.org/pdf/2008.12847).

Acquired SHA-256: `2f678d04ac611de3de3cfb08e1286a9560e40d02e23470668c44d56ba6e6f48e`.

- Reading scope: §9.2, Definitions 9.9,9.13, Lemma 9.10, Example 9.12, Remarks 9.14,9.16, printed pp.124–126; Lemma 9.19, Definition/Lemma 9.20, Theorem 9.21 and full proof pp.126–127; Lemmas 9.22–9.23, Theorem 9.24, Remark 9.25 pp.128–129. Other notes not represented as read.

### VoightAlgorithm2013

Identifying the matrix ring: algorithms for quaternion algebras and quadratic forms. John Voight.

Version: [arXiv:1004.0994v2, 30 April 2012; acquired author preprint, 38 physical pages. Algorithm 3.12 and Example 3.14 are cited from this version, not a collated publisher text.](https://arxiv.org/pdf/1004.0994).

Acquired SHA-256: `2849c5b32901ca660cfdef4a1a07c2127fcbaa4cda350c6b265271fdd2b16c61`.

- Reading scope: §3, atomic forms, Lemma 3.9, Proposition 3.10, Algorithm 3.12 and complete correctness proof, Examples 3.14–3.15, printed pp.11–14. Author errata (21 May 2019) read in full: https://jvoight.github.io/articles/quatalgs-errata.pdf.

### EmeryKim2022

Quaternionic hyperbolic lattices of minimal covolume. Vincent Emery and Inkang Kim.

Version: [Version of record, Forum of Mathematics, Sigma 10 (2022), e68, pp.1–19; DOI 10.1017/fms.2022.43.](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FB96042ED962BAA031D1F39C7A8AA012/S2050509422000433a.pdf/quaternionic-hyperbolic-lattices-of-minimal-covolume.pdf).

Acquired SHA-256: `a9b7b32c0c6947e33bc62cb29353c75cf3e008f80dd0921f28dc63a9f04818b1`.

- Reading scope: §5.1 and Lemma 5.1 full proof, printed pp.10–11; §5.2 and Lemma 5.2 full proof pp.11–12. No general classification of all quaternionic order lattices is claimed from these free-order-module results.

### KSS2021

Endo-parameters for p-adic classical groups. Robert Kurinczuk, Daniel Skodlerack and Shaun Stevens.

Version: [arXiv:1611.02667v3, 31 August 2020; 81 physical pages; source version is established from the title page.](https://arxiv.org/pdf/1611.02667).

Acquired SHA-256: `1cbcbb779d8d4ba8f3339d749b3dd7bc3d2555e6792491338a861d45009d9092`.

- Reading scope: §§3.1–3.5, printed pp.10–16: Lemma 3.1 complete proof; definitions, signed hermitian forms, unitary groups, twisting, Proposition 3.12; transfer definition, Propositions 3.13–3.15 and printed proofs. The maximal-element proof cited to [39] is not acquired and remains a gap.

### VoightAlgorithm2019

Author revision, 21 May 2019, 38 physical pages. John Voight.

Version: [Author revision, 21 May 2019, 38 physical pages; selected §3 printed pp.11–13, Algorithm 3.12 full correctness and Examples 3.14–3.15. The Example 3.14 sign discrepancy persists here.](https://jvoight.github.io/articles/quatalgs-051919.pdf).

Acquired SHA-256: `018def14b136701d82f52401cc0024559e9a1d6d98b6d63343cef8b761b85b62`.

- Reading scope: Author revision, 21 May 2019, 38 physical pages; selected §3 printed pp.11–13, Algorithm 3.12 full correctness and Examples 3.14–3.15. The Example 3.14 sign discrepancy persists here.

### VoightAlgorithmErrata2019

Author errata, 21 May 2019, two pages, read in full. John Voight.

Version: [Author errata, 21 May 2019, two pages, read in full; Algorithm 3.22 correction, no Example 3.14 correction.](https://jvoight.github.io/articles/quatalgs-errata.pdf).

Acquired SHA-256: `cb5482f360f8268d1baad085b78e2281e8e254da407d778c21b441ede2f1f675`.

- Reading scope: Author errata, 21 May 2019, two pages, read in full; Algorithm 3.22 correction, no Example 3.14 correction.

## Source corrections

E1–E14 retain the independent reviewer’s accepted corrections. E15 is a worker-verified sign correction in the acquired Voight Algorithm 3.12/Example 3.14 versions and needs independent errata review. The formula in the source statement is described here in our own words. The correct completion has a negative square correction; a positive correction changes the dyadic determinant square class. The 2019 errata addresses a different algorithm. No claim concerns an unacquired publisher collation, and nothing has been sent to an author.

- **E1** (``, Couveignes2020, §3, published p.493 (PDF p.7).): Use 𝓛 ⊗_Z R, equivalently rationalize over Z first and then extend from Q to R. Reason: The relation module is a positive-rank finite free abelian group, not a Q-module. Its real span requires extension over Z. Fresh visual reading agrees with the already independently confirmed finding.
- **E2** (`HoreshKarasik2023`, Published p.1290 (physical PDF p.38), paragraph immediately after the proof of Proposition B.3; the preprint p.34 (physical p.34) has the stronger finite-group claim.): For nonsaturated Λ only Δ/Λ has nonzero torsion. Its map to π(Δ) has kernel (Δ∩span_R Λ)/Λ; π(Δ), being a subgroup of a real vector space, is torsion-free. B.3 itself remains valid under primitivity. Reason: For Δ=Z² and Λ=2Ze₁, the quotient is Z/2⊕Z, while the projected subgroup is Ze₂. It is infinite and torsion-free. Projection remains a lattice because the real span is rational, although the quotient map is not injective.
- **E3** (`HoreshKarasik2023`, Published p.1290, Proposition B.4 proof, three transitions from squared Gram determinants to signed block determinants.): Use absolute values on all three determinants, or explicitly select compatible positively oriented bases/coordinates before these steps. The covolume quotient theorem is unchanged. Reason: The appendix allows arbitrary GL-bases and defines covolume as the nonnegative Gram square root. For g=diag(−1,1), covol(Ze₁)=1 whereas det(g1)=−1. The main paper's orientation language does not state the missing sign choice for arbitrary appendix bases; the packet uses squared determinants and positivity throughout.
- **E4** (`HoreshKarasik2021v2`, Preprint p.28, Example A.5; compare published p.1285, Example A.4.): The numerator is adj(BᵀB). The published displayed formula corrects it; its following prose still calls the adjugate that of B and should also say BᵀB. Reason: For a rectangular n×d basis matrix with n≠d, adj(B) is not defined; the invertible square Gram matrix is d×d. The published formula supplies the intended correct argument.
- **E5** (`HoreshKarasik2021v2`, Preprint p.34, Proposition B.5 proof, final paragraph and preceding span label; compare published p.1291.): Use the last complementary columns C of B: π(B) as an image lattice is spanned by π(C), not π(B′). The preceding common-span label must be VΛ-perp rather than VΛ. The published text replaces the proof with the correct direct pairing argument. Reason: B′ is the first d columns and spans VΛ, so π(B′)=0. For a nontrivial orthogonal complement it cannot be a factor-lattice basis. The intended complementary-column proof is valid after these index/space corrections.
- **E6** (`HoreshKarasik2021v2`, Preprint p.29, Proposition A.6 proof; compare published pp.1285–1286, Lemma A.5 and Proposition A.6.): Specify the quotient Haar measure and show the duality is induced by the identity on SO(n) and the inverse-transpose Cartan automorphism on GL(d). The published text supplies that argument; no measure-space claim is used in this blueprint. Reason: A smooth involution alone need not preserve a given measure: x↦1/x on positive reals changes Lebesgue measure by a nonconstant Jacobian. For the Haar-measure group automorphism in the corrected proof, involutivity forces its positive Haar scale factor to be one.
- **E7** (`HoreshKarasik2023`, Published p.1261, Definition 2.2, orientation on an arbitrary full lattice in VΛ-perp.): For arbitrary full L the criterion is det(B|C)>0. Equality to one is valid only with the additional normalization covol(Λ)covol(L)=1, which is imposed on the subsequently defined space of pairs but not on the stated arbitrary L. Reason: Take Λ=Ze₁ and L=2Ze₂: positively oriented complementary bases have concatenated determinant 2, and none has determinant 1. Likewise the diagonal primitive lattice and its integral orthogonal lattice have covolume product 2. This is an orientation-normalization slip, not a failure of B.6.
- **E8** (`EvertseGeometry`, Author course chapter dio19-2.pdf, Lemma 2.10, printed p.26 (physical p.16).): The coefficients of the r given vectors are indexed by i=1,…,r, matching both sums. The ambient dimension is n. Reason: The lemma starts with w_1,…,w_r in R^n and both displayed sums run to r. If r>n the printed coefficient declaration leaves some coefficients unspecified. The page image confirms n in that declaration. The lower-bound application has r=n and is unaffected.
- **E9** (`Henk2002`, arXiv math/0204158v1, p.2, sentence after (1.2); preprint only.): For the displayed floor brackets, read greatest integer not greater than x. Reason: The image shows floor brackets, whereas the quoted words describe a ceiling. For x=3/2 the two operations give 1 and 2. The proof p.4 uses q_i=floor(2/λ_i+1), in particular q_i>2/λ_i; retain the floor convention and do not identify Conjecture 1.4 with the proved Theorem 1.5.
- **E10** (`Voight2026`, §9.4.5: publisher version of record (2021), printed p.144 / physical p.160; also post-publication v1.0.7u (5 August 2026), printed p.140 / physical p.160. Both passages read; updated passage visually verified.): Every finitely generated torsion-free module over a DVR is free. The lattice applications have that torsion-free hypothesis because their carriers are submodules of a fraction-field vector space. Reason: For a DVR A with nonzero uniformizer π, the nonzero cyclic module A/πA is finitely generated and has π-torsion, whereas every free module over the domain A is torsion-free. This is a counterexample to the unrestricted printed assertion. Localized lattices remain torsion-free, so the correction does not invalidate the lattice descent target.
- **E11** (`EvertseGeometry`, Course chapter dio19-2.pdf, remark after Theorem 2.9, printed pp.24–25 (physical PDF pp.14–15).): Require an invertible real linear transformation (a linear equivalence). Its nonzero determinant permits cancellation in the following covolume-to-volume quotient. Reason: In dimension one, the zero linear map sends Z and the unit interval to {0}. The image lattice is no longer full and the image body has no interior in R; the claimed positive first minimum and the displayed quotient are unavailable. Simultaneous transport by a linear equivalence is the valid invariant statement.
- **E12** (`Voight2026`, Example 9.8.2, post-publication v1.0.7u (5 August 2026), printed p.147 / physical p.167, final uniqueness assertion; rendered page inspected.): The stated normalization of a does not give a unique coefficient triple [a,1,c] within an integral isometry class. Retain existence of an atomic presentation, and require a separate justified classification/normalization for uniqueness. Reason: Over Z₂ the invertible substitution (x,y)↦(x+y/3,y/3), of determinant 1/3∈Z₂×, takes x²+xy+y² to x²+xy+(1/3)y². Thus [1,1,1] and [1,1,1/3] are distinct triples, both atomic with normalized a=1 and v₂(a)=v₂(c)=0, in the same isometry class. This is a polynomial identity over Q and hence over Q₂.
- **E13** (`Schlichting2010`, Example 2.2, printed p.109 / physical PDF p.5; rendered author copy inspected.): Read P(R) as finitely generated projective right R-modules. The following bidual isomorphism and split exact category with duality assertion use that restriction. Reason: For R=Z with trivial involution, M=Z/2 is finitely generated but Hom_Z(M,Z)=0 and M**=0, so M cannot have the printed bidual isomorphism. The next sentence itself restricts the bidual assertion to projective modules.
- **E14** (`MorrisArithmetic`, arXiv math/0106063v6, prose immediately before Theorem 20.3.3, printed p.413 / physical p.429; rendered page inspected.): Insert unipotent in the preceding orbit-closure summary, as in the immediately following Theorem 20.3.3. Reason: The same source Warning 20.1.5 on p.407 gives diagonal-flow orbit closures with fractal transverse behavior, disproving the preceding unrestricted nice-submanifold summary. The numbered theorem correctly requires a unipotent subgroup.
- **E15** (`VoightAlgorithm2013`, Example 3.14, printed p.13): Both correction terms have a minus sign. Reason: Expansion of q(e2−b/(2a)e1) gives c−b²/(4a). On Z₂, [1,2,2] becomes ⟨1,1⟩; the printed plus gives determinant square class 3 instead of 1.

## Pinned declaration catalogue

The 176 reviewed declarations are preserved; seventeen fresh native statement inspections extend the boundary. This catalogue reports supplied statements, not new formalisation work. The packet stores each exact module, kind, inspection scope and any independent audit receipt.

- `mathlib:Matrix.gram` (def, `Mathlib/Analysis/InnerProductSpace/GramMatrix.lean`): Existing Gram matrix; inner(v_i,v_j), conjugate-linear first argument.
- `mathlib:Matrix.gram_eq_conjTranspose_mul` (theorem, `Mathlib/Analysis/InnerProductSpace/GramMatrix.lean`): In orthonormal coordinates Gram(v)=AᴴA, including rectangular families.
- `mathlib:Matrix.det_gram_ne_zero_iff_linearIndependent` (theorem, `Mathlib/Analysis/InnerProductSpace/GramMatrix.lean`): Finite family: nonzero Gram determinant iff independent in a normed inner-product space.
- `mathlib:Matrix.posSemidef_gram` (theorem, `Mathlib/Analysis/InnerProductSpace/GramMatrix.lean`): Every Gram matrix is positive semidefinite, without independence.
- `mathlib:InnerProductSpace.gramSchmidtOrthonormalBasis` (def, `Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean`): Orthonormal basis extending nonzero orthogonalized outputs when index cardinality equals ambient dimension; dependent input allowed.
- `mathlib:InnerProductSpace.gramSchmidtOrthonormalBasis_det` (theorem, `Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean`): Input determinant in its Gram–Schmidt orthonormal basis is the product of diagonal inner products.
- `mathlib:norm_inner_le_norm` (theorem, `Mathlib/Analysis/InnerProductSpace/Basic.lean`): RCLike Cauchy–Schwarz: norm(inner(x,y)) ≤ norm(x) norm(y).
- `mathlib:Matrix.det_mul` (theorem, `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`): Determinant multiplicativity over a commutative ring.
- `mathlib:Matrix.det_conjTranspose` (theorem, `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`): Conjugate-transpose determinant is star of determinant.
- `mathlib:finrank_span_eq_card` (theorem, `Mathlib/LinearAlgebra/Dimension/Constructions.lean`): Span of a finite independent family has dimension its cardinality.
- `mathlib:Orientation.abs_volumeForm_apply_le` (theorem, `Mathlib/Analysis/InnerProductSpace/Orientation.lean`): Already-built real full-dimensional oriented-volume Hadamard bound; not replanned.
- `mathlib:IsZLattice` (class, `Mathlib/Algebra/Module/ZLattice/Basic.lean`): Discrete Z-submodule with full scalar span; discreteness a separate instance.
- `mathlib:Module.Basis.ofZLatticeBasis` (def, `Mathlib/Algebra/Module/ZLattice/Basic.lean`): A lattice Z-basis extends to an ambient real basis with the same vectors.
- `mathlib:ZSpan.fundamentalDomain_ae_parallelepiped` (theorem, `Mathlib/Algebra/Module/ZLattice/Basic.lean`): Half-open fundamental domain equals closed basis parallelepiped almost everywhere for additive Haar measure.
- `mathlib:ZLattice.covolume` (def, `Mathlib/Algebra/Module/ZLattice/Covolume.lean`): Existing real covolume, parameterized by measure; use intrinsic volume here.
- `mathlib:ZLattice.covolume_eq_det_mul_measureReal` (theorem, `Mathlib/Algebra/Module/ZLattice/Covolume.lean`): Covolume equals absolute coordinate determinant times measureReal of the ambient basis fundamental domain.
- `mathlib:ZLattice.covolume_pos` (theorem, `Mathlib/Algebra/Module/ZLattice/Covolume.lean`): Positive covolume for a discrete full lattice with additive Haar measure.
- `mathlib:ZLattice.covolume_div_covolume_eq_relIndex'` (theorem, `Mathlib/Algebra/Module/ZLattice/Covolume.lean`): Index/covolume ratio for nested full real Euclidean lattices is already built.
- `mathlib:OrthonormalBasis.volume_parallelepiped` (theorem, `Mathlib/MeasureTheory/Measure/Haar/InnerProductSpace.lean`): Orthonormal parallelepiped has intrinsic volume one.
- `mathlib:OrthonormalBasis.measurePreserving_repr` (theorem, `Mathlib/MeasureTheory/Measure/Haar/InnerProductSpace.lean`): Orthonormal coordinates preserve canonical real volume.
- `mathlib:PiLp.volume_preserving_ofLp` (theorem, `Mathlib/MeasureTheory/Measure/Haar/InnerProductSpace.lean`): Coordinate map from EuclideanSpace to the finite real function space preserves volume, despite different norm conventions.
- `mathlib:Real.volume_Icc_pi` (theorem, `Mathlib/MeasureTheory/Measure/Lebesgue/Basic.lean`): Finite coordinate box volume is product of ENNReal.ofReal side lengths.
- `mathlib:EuclideanSpace.real_norm_sq_eq` (theorem, `Mathlib/Analysis/InnerProductSpace/PiL2.lean`): Euclidean squared norm is the sum of real coordinate squares.
- `mathlib:Real.le_rpow_inv_iff_of_pos` (lemma, `Mathlib/Analysis/SpecialFunctions/Pow/Real.lean`): For nonnegative bases and positive z, x≤y^(1/z) iff x^z≤y.
- `mathlib:Submodule.exists_smith_normal_form_of_le` (theorem, `Mathlib/LinearAlgebra/FreeModule/PID.lean`): Smith normal form for N≤O inside a finite free module over a PID; diagonal coefficients are not presumed units.
- `mathlib:instModuleFinite_of_discrete_submodule` (instance, `Mathlib/Algebra/Module/ZLattice/Basic.lean`): Every discrete integral submodule of a finite-dimensional real normed space is finite over Z.
- `mathlib:instModuleFree_of_discrete_submodule` (instance, `Mathlib/Algebra/Module/ZLattice/Basic.lean`): Every such discrete integral submodule is free over Z.
- `mathlib:ZLattice.comap_discreteTopology` (theorem, `Mathlib/Algebra/Module/ZLattice/Basic.lean`): Pullback along a continuous injective linear map preserves discreteness.
- `mathlib:Module.Basis.isUnitSMul` (def, `Mathlib/LinearAlgebra/Basis/SMul.lean`): Rescaling each basis vector by a unit preserves a basis.
- `mathlib:Submodule.ker_orthogonalProjectionOnto` (theorem, `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean`): Kernel of orthogonal projection onto K is its orthogonal complement.
- `mathlib:Submodule.isCompl_orthogonal` (theorem, `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean`): A subspace admitting orthogonal projection and its orthogonal complement are complementary.
- `mathlib:ZSpan.discreteTopology_pi_basisFun` (theorem, `Mathlib/Algebra/Module/ZLattice/Basic.lean`): Coordinate integral lattice is discrete; the immediately following read anonymous instance transports this to the Z-span of any finite real basis.
- `mathlib:instIsZLatticeRealSpan` (instance, `Mathlib/Algebra/Module/ZLattice/Basic.lean`): The integral span of a finite real basis is a full lattice; the preceding pinned instance supplies discreteness.
- `mathlib:Module.Basis.restrictScalars` (def, `Mathlib/LinearAlgebra/Basis/Submodule.lean`): A basis over an algebra restricts to a basis over the base ring of its integral/base-ring span.
- `mathlib:stdOrthonormalBasis` (irreducible_def, `Mathlib/Analysis/InnerProductSpace/PiL2.lean`): Finite-dimensional inner-product space has a real/complex orthonormal basis indexed by its finite dimension.
- `mathlib:Module.Basis.prod` (def, `Mathlib/LinearAlgebra/Basis/Prod.lean`): Bases of two modules combine to a sum-indexed basis of their product.
- `mathlib:Submodule.prodEquivOfIsCompl` (def, `Mathlib/LinearAlgebra/Projection.lean`): The sum map from two complementary subspaces is a linear equivalence to the ambient space.
- `mathlib:Matrix.det_fromBlocks_zero₂₁` (theorem, `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`): Determinant of an upper block-triangular matrix is the product of diagonal-block determinants, including empty blocks.
- `mathlib:OrthonormalBasis.sum_inner_mul_inner` (theorem, `Mathlib/Analysis/InnerProductSpace/PiL2.lean`): Finite orthonormal-coordinate expansion of a mixed inner product.
- `mathlib:LinearMap.BilinForm.dualSubmodule` (def, `Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean`): Existing submodule of vectors pairing into the base ring with every element of the input submodule.
- `mathlib:ZLattice.comap` (def, `Mathlib/Algebra/Module/ZLattice/Basic.lean`): Existing integral-submodule pullback along a scalar linear map.
- `mathlib:Submodule.inner_orthogonalProjectionOnto_eq_of_mem_left` (theorem, `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean`): Pairing an element of K with the projection of v onto K equals its ambient pairing with v.
- `mathlib:LinearMap.BilinForm.dualBasis` (def, `Mathlib/LinearAlgebra/BilinearForm/Properties.lean`): Existing bilinear dual basis for a nondegenerate bilinear form.
- `mathlib:LinearMap.BilinForm.dualSubmodule_span_of_basis` (lemma, `Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean`): The bilinear dual of the base-ring span of a finite field basis equals the base-ring span of its bilinear dual basis.
- `mathlib:Module.Basis.ofZLatticeBasis_span` (theorem, `Mathlib/Algebra/Module/ZLattice/Basic.lean`): The integral span of ofZLatticeBasis equals the original lattice.
- `mathlib:LinearMap.BilinForm.apply_dualBasis_right` (theorem, `Mathlib/LinearAlgebra/BilinearForm/Properties.lean`): For a nondegenerate symmetric bilinear form, the original basis and its dual pair by the Kronecker delta.
- `mathlib:LinearMap.BilinForm.dualBasis_eq_iff` (theorem, `Mathlib/LinearAlgebra/BilinearForm/Properties.lean`): Characterizes the bilinear dual basis by its pairings with the original basis.
- `mathlib:OrthonormalBasis.inner_eq_ite` (lemma, `Mathlib/Analysis/InnerProductSpace/PiL2.lean`): Pairings of orthonormal basis vectors are Kronecker deltas.
- `mathlib:Submodule.finrank_add_finrank_orthogonal` (theorem, `Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean`): In a finite-dimensional inner-product space, the dimensions of a subspace and its orthogonal complement sum to the ambient dimension.
- `mathlib:ConvexBody` (structure, `Mathlib/Analysis/Convex/Body.lean`): Native compact nonempty convex-set carrier; does not assert nonempty interior.
- `mathlib:ConvexBody.coe_smul` (theorem, `Mathlib/Analysis/Convex/Body.lean`): The existing body scalar action has carrier the pointwise scalar image.
- `mathlib:ConvexBody.isClosed` (theorem, `Mathlib/Analysis/Convex/Body.lean`): Closedness of a convex body in a Hausdorff space.
- `mathlib:ConvexBody.isCompact` (theorem, `Mathlib/Analysis/Convex/Body.lean`): Compactness of the existing body carrier.
- `mathlib:IsCompact.isVonNBounded` (theorem, `Mathlib/Analysis/LocallyConvex/Bounded.lean`): A compact set is von Neumann bounded in a topological real vector space.
- `mathlib:LinearEquiv.finrank_eq` (theorem, `Mathlib/LinearAlgebra/Dimension/Finrank.lean`): A linear equivalence preserves finite rank; use its restriction to corresponding spans.
- `mathlib:MeasureTheory.Measure.addHaar_image_linearMap` (theorem, `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean`): A real finite-dimensional linear map scales Haar image measure by the absolute determinant.
- `mathlib:MeasureTheory.volume_sum_rpow_le` (theorem, `Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean`): Exact closed lp-ball volume for p≥1 and a nonempty finite real coordinate index; p=1 gives the cross-polytope constant.
- `mathlib:Real.Gamma_nat_eq_factorial` (theorem, `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean`): Gamma(n+1)=n! for natural n.
- `mathlib:Real.sInf_nonneg` (lemma, `Mathlib/Algebra/Order/Archimedean/Real/Basic.lean`): The infimum of a real set whose elements are nonnegative is nonnegative.
- `mathlib:Set.exists_min_image` (theorem, `Mathlib/Data/Set/Finite/Lemmas.lean`): A nonempty finite set has a point minimizing any function into a linear order.
- `mathlib:Submodule.finrank_mono` (theorem, `Mathlib/LinearAlgebra/Dimension/Constructions.lean`): Submodule inclusion gives a dimension inequality when the larger module is finite.
- `mathlib:ZSpan.setFinite_inter` (theorem, `Mathlib/Algebra/Module/ZLattice/Basic.lean`): The integral span of a finite real basis meets every bounded set in finitely many points.
- `mathlib:absorbent_nhds_zero` (theorem, `Mathlib/Analysis/LocallyConvex/Basic.lean`): Every neighborhood of zero is absorbent.
- `mathlib:basisOfLinearIndependentOfCardEqFinrank'` (def, `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean`): Turn an independent family of ambient-dimension cardinality into a basis with the same vectors.
- `mathlib:gauge` (def, `Mathlib/Analysis/Convex/Gauge.lean`): Native real infimum of positive dilation factors containing a vector.
- `mathlib:gauge_eq_zero` (theorem, `Mathlib/Analysis/Convex/Gauge.lean`): For an absorbent von Neumann bounded set, gauge zero is equivalent to vector zero.
- `mathlib:gauge_le_of_mem` (theorem, `Mathlib/Analysis/Convex/Gauge.lean`): Membership in a nonnegative dilate implies its gauge upper bound.
- `mathlib:gauge_le_one_iff_mem_closure` (theorem, `Mathlib/Analysis/Convex/Gauge.lean`): For a convex neighborhood of zero, gauge≤1 means membership in its closure.
- `mathlib:gauge_neg` (theorem, `Mathlib/Analysis/Convex/Gauge.lean`): Negation preserves gauge for a set closed under negation.
- `mathlib:gauge_nonneg` (theorem, `Mathlib/Analysis/Convex/Gauge.lean`): Every native gauge value is nonnegative, including the real-infimum empty-set convention.
- `mathlib:gauge_pos` (theorem, `Mathlib/Analysis/Convex/Gauge.lean`): For an absorbent von Neumann bounded set, gauge is positive exactly on nonzero vectors.
- `mathlib:gauge_smul_left_of_nonneg` (theorem, `Mathlib/Analysis/Convex/Gauge.lean`): Scaling the set by a nonnegative scalar scales its gauge by the scalar inverse; geometric uses here impose strict positivity.
- `mathlib:gauge_smul_of_nonneg` (theorem, `Mathlib/Analysis/Convex/Gauge.lean`): Nonnegative scalar homogeneity of the native gauge.
- `mathlib:gauge_sum_le` (theorem, `Mathlib/Analysis/Convex/Gauge.lean`): Subadditivity over finite sums for a convex absorbent set.
- `mathlib:linearIndependent_finSucc'` (theorem, `Mathlib/LinearAlgebra/LinearIndependent/Lemmas.lean`): A finite family is independent exactly when its initial family is independent and the last vector is outside its span.
- `mathlib:LinearMap.det_toLin'` (theorem, `Mathlib/LinearAlgebra/Determinant.lean`): The determinant of the native linear map of a square matrix is its matrix determinant.
- `mathlib:LinearMap.equivOfDetNeZero` (abbrev, `Mathlib/LinearAlgebra/Determinant.lean`): A finite-dimensional linear endomorphism with nonzero determinant gives a linear equivalence.
- `mathlib:MeasureTheory.Measure.addHaar_preimage_linearMap` (theorem, `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean`): An invertible linear-map preimage scales Haar measure by the inverse absolute determinant.
- `mathlib:MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure` (theorem, `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean`): The compact symmetric convex-body theorem gives a nonzero discrete lattice point at the non-strict volume threshold, in nontrivial finite dimension.
- `mathlib:ZSpan.isAddFundamentalDomain'` (theorem, `Mathlib/Algebra/Module/ZLattice/Basic.lean`): The native half-open basis parallelepiped is a fundamental domain for the integral-span additive subgroup.
- `mathlib:ZSpan.volume_fundamentalDomain` (theorem, `Mathlib/Algebra/Module/ZLattice/Basic.lean`): The native real-coordinate fundamental domain has volume equal to the absolute basis determinant.
- `mathlib:gauge_closedBall` (theorem, `Mathlib/Analysis/Convex/Gauge.lean`): Closed-ball gauge equals norm divided by nonnegative radius.
- `mathlib:volume_euclideanSpace_eq_dirac` (lemma, `Mathlib/MeasureTheory/Measure/Haar/InnerProductSpace.lean`): Canonical Euclidean volume is the Dirac measure at zero for an empty coordinate index.
- `mathlib:Matrix.det_diagonal` (theorem, `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`): The determinant of a diagonal matrix is the product of its diagonal entries.
- `mathlib:Subgroup.index` (def, `Mathlib/GroupTheory/Index.lean`): The read source declaration generates AddSubgroup.index by its to_additive annotation. Its additive statement was checked by Lean: Natural quotient cardinal; zero on infinite index, so finiteness must be supplied.
- `mathlib:Subgroup.relIndex` (def, `Mathlib/GroupTheory/Index.lean`): The read source declaration generates AddSubgroup.relIndex by its to_additive annotation. Its additive statement was checked by Lean: Index of the subgroup pulled back to the containing subgroup.
- `mathlib:AddSubgroup.FiniteIndex` (class, `Mathlib/GroupTheory/Index.lean`): Native nonzero-index proposition; no replacement quotient-finiteness carrier.
- `mathlib:Subgroup.finite_quotient_of_finiteIndex` (instance, `Mathlib/GroupTheory/Index.lean`): The read source declaration generates AddSubgroup.finite_quotient_of_finiteIndex by its to_additive annotation. Its additive statement was checked by Lean: A finite-index additive subgroup has a finite quotient.
- `mathlib:QuotientGroup.eq_iff_div_mem` (theorem, `Mathlib/GroupTheory/QuotientGroup/Defs.lean`): The read source declaration generates QuotientAddGroup.eq_iff_sub_mem by its to_additive annotation. Its additive statement was checked by Lean: Two quotient classes agree exactly when their difference belongs to the subgroup.
- `mathlib:Nat.card_le_card_of_injective` (lemma, `Mathlib/SetTheory/Cardinal/Finite.lean`): An injection into a finite target bounds natural cardinality.
- `mathlib:Nat.card_prod` (theorem, `Mathlib/SetTheory/Cardinal/Finite.lean`): Natural cardinal of a product is the product of natural cardinals.
- `mathlib:Nat.card_fun` (theorem, `Mathlib/SetTheory/Cardinal/Finite.lean`): A function type on a finite domain has cardinal equal to the corresponding power.
- `mathlib:Nat.card_zmod` (theorem, `Mathlib/SetTheory/Cardinal/Finite.lean`): Natural cardinal of ZMod q is q; at q=0 this is the infinite-cardinality sentinel, not finiteness.
- `mathlib:Nat.card_coe_set_eq` (theorem, `Mathlib/Data/Set/Card.lean`): Natural cardinal of a set subtype equals native Set.ncard.
- `mathlib:Set.ncard_image_of_injective` (theorem, `Mathlib/Data/Set/Card.lean`): An injective image preserves natural set cardinality, including subtype coercions.
- `mathlib:ZMod.intCast_zmod_eq_zero_iff_dvd` (theorem, `Mathlib/Data/ZMod/Basic.lean`): An integer has zero residue modulo q exactly when q divides it.
- `mathlib:Module.finBasisOfFinrankEq` (def, `Mathlib/LinearAlgebra/Dimension/Free.lean`): A finite free module has a basis indexed by Fin n when its finite rank is n.
- `mathlib:ZLattice.rank` (theorem, `Mathlib/Algebra/Module/ZLattice/Basic.lean`): The integral rank of a discrete full lattice is the ambient scalar dimension.
- `mathlib:Nat.lt_floor_add_one` (theorem, `Mathlib/Algebra/Order/Floor/Semiring.lean`): Every real a is less than its natural floor plus one; positive inputs use the ordinary floor.
- `mathlib:Convex.midpoint_mem` (theorem, `Mathlib/Analysis/Convex/Basic.lean`): The midpoint of two points of a real convex set remains in it.
- `mathlib:ConvexBody.convex` (theorem, `Mathlib/Analysis/Convex/Body.lean`): The native body's set carrier is real convex.
- `mathlib:AddSubgroup.index_range_nsmul` (lemma, `Mathlib/GroupTheory/IndexNSmul.lean`): Already-built index of qG in a finite free integral module G is q^finrank(Z,G); no new homothetic index theorem is planned.
- `mathlib:Module.finrank_eq_card_basis` (theorem, `Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean`): A finite-indexed basis of a module over a strong-rank-condition ring identifies its finite rank with the index cardinal.
- `mathlib:Module.Basis.constr` (def, `Mathlib/LinearAlgebra/Basis/Defs.lean`): Native extension of assigned basis-vector values to a linear map; used for the block basis change and inverse.
- `mathlib:Module.Basis.equiv` (def, `Mathlib/LinearAlgebra/Basis/Defs.lean`): Integral change of basis as a linear equivalence carrying corresponding basis vectors.
- `mathlib:Module.Basis.flag` (def, `Mathlib/LinearAlgebra/Basis/Flag.lean`): Existing prefix-span flag of a finite basis, indexed by Fin(n+1).
- `mathlib:Module.Basis.span` (def, `Mathlib/LinearAlgebra/Basis/Basic.lean`): An independent family is a basis of its own span, preserving its literal vectors.
- `mathlib:Finset.prod_lt_prod` (lemma, `Mathlib/Algebra/Order/BigOperators/GroupWithZero/Finset.lean`): Strict finite product comparison for positive inputs with pointwise non-strict bounds and one strict factor.
- `mathlib:Module.Basis.sum_repr` (theorem, `Mathlib/LinearAlgebra/Basis/Defs.lean`): A vector equals the finite sum of its integral coordinates times basis vectors.
- `mathlib:Module.Basis.equivFun` (def, `Mathlib/LinearAlgebra/Basis/Defs.lean`): Finite basis coordinate equivalence with the native function module.
- `mathlib:Subgroup.index_map_equiv` (theorem, `Mathlib/GroupTheory/Index.lean`): Index invariance under a group isomorphism; source annotation generates AddSubgroup.index_map_equiv used here.
- `mathlib:Subgroup.index_pi` (lemma, `Mathlib/GroupTheory/Index.lean`): Index of a product subgroup is the product of indices; source annotation generates AddSubgroup.index_pi.
- `mathlib:Int.index_zmultiples` (lemma, `Mathlib/Data/ZMod/QuotientGroup.lean`): The native index of aZ in Z is natAbs(a), including the infinite-index sentinel at zero.
- `mathlib:Module.Basis.mem_flag_iff_repr_eq_zero` (theorem, `Mathlib/LinearAlgebra/Basis/Flag.lean`): Membership in a prefix flag is exactly vanishing of all coordinates at or after its cut.
- `mathlib:Module.Basis.ofZLatticeBasis_repr_apply` (theorem, `Mathlib/Algebra/Module/ZLattice/Basic.lean`): The real coordinates of an integral lattice vector are the casts of its integral basis coordinates.
- `mathlib:Nat.floor_mono` (theorem, `Mathlib/Algebra/Order/Floor/Semiring.lean`): Natural floor is monotone, including its totalized convention on negative inputs.
- `mathlib:Convex.addHaar_frontier` (theorem, `Mathlib/Analysis/Convex/Measure.lean`): The frontier of any convex set in a finite-dimensional real normed space has zero additive Haar measure; no full-dimensional interior assumption.
- `mathlib:Convex.translate` (theorem, `Mathlib/Analysis/Convex/Basic.lean`): Translation of a convex set is convex.
- `mathlib:Convex.add_smul_sub_mem` (theorem, `Mathlib/Analysis/Convex/Basic.lean`): For a,x in a convex set and 0≤s≤1, a+s(x−a) remains in the set.
- `mathlib:MeasureTheory.measure_iUnion₀` (theorem, `Mathlib/MeasureTheory/Measure/NullMeasurable.lean`): Countable a.e.-disjoint null-measurable unions have measure equal to the sum; finite-index specialization gives an ordinary finite sum.
- `mathlib:MeasureTheory.measure_preimage_mul_right` (theorem, `Mathlib/MeasureTheory/Group/Measure.lean`): Read with its generated additive measure_preimage_add_right: additive Haar measure is unchanged by translation preimages, hence by translation images.
- `mathlib:Homeomorph.image_interior` (theorem, `Mathlib/Topology/Homeomorph/Defs.lean`): Homeomorphisms carry interiors to interiors; apply to translations.
- `mathlib:IsCompact.image` (theorem, `Mathlib/Topology/Compactness/Compact.lean`): Continuous images of compact sets are compact.
- `mathlib:isCompact_iUnion` (theorem, `Mathlib/Topology/Compactness/Compact.lean`): A union over a finite index type of compact sets is compact.
- `mathlib:IsCompact.isClosed` (theorem, `Mathlib/Topology/Separation/Hausdorff.lean`): Compact subsets of Hausdorff spaces are closed.
- `mathlib:IsClosed.measurableSet` (theorem, `Mathlib/MeasureTheory/Constructions/BorelSpace/Basic.lean`): Closed sets in the supplied Borel measurable space are measurable.
- `mathlib:measurable_measure_prodMk_right` (theorem, `Mathlib/MeasureTheory/Measure/Prod.lean`): For a measurable subset of E×F and an s-finite measure on E, its E-section measure is a measurable function of F.
- `mathlib:MeasureTheory.Measure.prod_apply_symm` (theorem, `Mathlib/MeasureTheory/Measure/Prod.lean`): The product measure of a measurable set is the lower integral of its E-section measures with respect to the measure on F.
- `mathlib:MeasureTheory.lintegral_mono` (theorem, `Mathlib/MeasureTheory/Integral/Lebesgue/Basic.lean`): A pointwise order on nonnegative extended-real functions gives the same order on their lower integrals.
- `mathlib:LinearMap.det_prodMap` (theorem, `Mathlib/LinearAlgebra/Determinant.lean`): The determinant of the product of finite free endomorphisms is the product of their determinants.
- `mathlib:LinearMap.det_smul` (theorem, `Mathlib/LinearAlgebra/Determinant.lean`): Scalar multiplication of a finite free endomorphism multiplies its determinant by the scalar to the module dimension.
- `mathlib:MeasureTheory.Measure.prod.instIsHaarMeasure` (instance, `Mathlib/MeasureTheory/Group/Measure.lean`): Read with its to_additive product-Haar instance: the product of s-finite Haar measures is Haar. Finite-dimensional real spaces supply s-finiteness.
- `mathlib:gauge_def'` (theorem, `Mathlib/Analysis/Convex/Gauge.lean`): The native real gauge equals the infimum of positive inverse-scaling thresholds r with r⁻¹x in the set.
- `mathlib:mem_frontier_iff_notMem_interior` (lemma, `Mathlib/Topology/Closure.lean`): For a point belonging to a set, frontier membership is equivalent to failure of interior membership; no closedness assumption.
- `mathlib:MeasureTheory.measure_iUnion_null_iff` (theorem, `Mathlib/MeasureTheory/OuterMeasure/Basic.lean`): A countable union is null exactly when all its members are null; its measure_iUnion_null alias is used in the scratch proof.
- `mathlib:MeasureTheory.measure_union_null` (theorem, `Mathlib/MeasureTheory/OuterMeasure/Basic.lean`): The union of two null sets is null, without a measurability assumption.
- `mathlib:MeasureTheory.measure_mono_null` (theorem, `Mathlib/MeasureTheory/OuterMeasure/Basic.lean`): A subset of a measure-zero set has measure zero.
- `mathlib:interior_subset_gauge_lt_one` (theorem, `Mathlib/Analysis/Convex/Gauge.lean`): Every interior point has native gauge strictly less than one for a real module with continuous scalar multiplication.
- `mathlib:gauge_add_le` (theorem, `Mathlib/Analysis/Convex/Gauge.lean`): The gauge of a sum is bounded by the sum of gauges for a convex absorbent set.
- `mathlib:Equiv.piEquivPiSubtypeProd` (definition, `Mathlib/Logic/Equiv/Prod.lean`): Native equivalence splitting a function by a decidable predicate into the predicate and its complement; inverse uses the corresponding two restrictions.
- `mathlib:Pi.card_Icc` (theorem, `Mathlib/Data/Pi/Interval.lean`): Cardinality of a finite function-lattice interval is the product of the coordinate interval cardinalities.
- `mathlib:Int.card_Icc` (theorem, `Mathlib/Data/Int/Interval.lean`): The integer closed interval [a,b] has (b+1−a).toNat elements.
- `mathlib:Homeomorph.piEquivPiSubtypeProd` (definition, `Mathlib/Topology/Homeomorph/Lemmas.lean`): The native function-space predicate split is a homeomorphism.
- `mathlib:MeasureTheory.volume_preserving_piEquivPiSubtypeProd` (theorem, `Mathlib/MeasureTheory/Constructions/Pi.lean`): The native function-space split preserves product volume, including empty coordinate factors.
- `mathlib:IsCompact.measure_lt_top` (theorem, `Mathlib/MeasureTheory/Measure/Typeclasses/Finite.lean`): Compact sets have finite measure when the measure is finite on compact sets; additive Haar measures supply that instance.
- `mathlib:MeasureTheory.Measure.addHaar_smul_of_nonneg` (theorem, `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean`): For r≥0, Haar measure of rS is ofReal(r^dim) times Haar measure of S; includes dimension zero and empty sets.
- `mathlib:IsCompact.isBounded` (theorem, `Mathlib/Topology/MetricSpace/Bounded.lean`): A compact set in a pseudometric space is bounded.
- `mathlib:isBounded_iff_forall_norm_le'` (lemma, `Mathlib/Analysis/Normed/Group/Bounded.lean`): Read the source generator and its explicit additive alias isBounded_iff_forall_norm_le: boundedness gives a uniform norm upper bound.
- `mathlib:MeasureTheory.measureReal_mono` (theorem, `Mathlib/MeasureTheory/Measure/Real.lean`): Set inclusion implies real-measure comparison when the larger set has finite measure.
- `mathlib:Fin.prod_univ_succ` (theorem, `Mathlib/Algebra/BigOperators/Fin.lean`): A product indexed by Fin(n+1) is the zero-indexed factor times the successor-indexed tail product.
- `mathlib:tendsto_add_mul_div_add_mul_atTop_nhds` (theorem, `Mathlib/Analysis/SpecificLimits/Basic.lean`): The ratio (a+ck)/(b+dk) along natural k tends to c/d when d is nonzero.
- `mathlib:le_of_tendsto'` (theorem, `Mathlib/Topology/Order/OrderClosed.lean`): A pointwise upper bound passes to the limit in a closed order; its generated dual ge_of_tendsto' (or eventual ge_of_tendsto) gives the lower-bound form used here.
- `mathlib:MeasureTheory.Measure.volume_pi_eq_dirac` (lemma, `Mathlib/MeasureTheory/Constructions/Pi.lean`): Native volume of an empty-index function space is the Dirac measure at its unique point.
- `mathlib:Convex.linear_image` (theorem, `Mathlib/Analysis/Convex/Basic.lean`): A real-linear image of a convex set is convex.
- `mathlib:ZLattice.volume_image_eq_volume_div_covolume'` (theorem, `Mathlib/Algebra/Module/ZLattice/Covolume.lean`): For a discrete full lattice in a finite-dimensional real inner-product space, an integral-basis coordinate image of a null-measurable set has volume equal to the original volume divided by ofReal(covolume).
- `mathlib:Module.finrank_fintype_fun_eq_card` (theorem, `Mathlib/LinearAlgebra/Dimension/Constructions.lean`): The rank of a finite function space with values in the base ring is the cardinality of its index type.
- `mathlib:Submodule.IsLattice` (class, `Mathlib/Algebra/Module/Lattice.lean`): Finitely generated R-submodule spanning the ambient A-module; no freeness assertion.
- `mathlib:QuadraticMap` (structure, `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`): Native module-valued quadratic maps with square homogeneity and a bilinear companion.
- `mathlib:QuadraticForm` (abbrev, `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`): QuadraticMap R M R, reused rather than redefined.
- `mathlib:LinearMap.IsSymm` (structure, `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean`): Sesquilinear symmetry I(B x y)=B y x.
- `mathlib:LinearMap.Nondegenerate` (def, `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean`): Both left and right separation; does not assert an integral perfect pairing.
- `mathlib:Matrix.conjTranspose` (def, `Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean`): Transpose followed by coefficient star.
- `mathlib:InnerProductSpace.gramSchmidt` (def, `Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean`): Existing ordered Gram–Schmidt recursion, including zero and dependent families.
- `mathlib:InnerProductSpace.gramSchmidt_ne_zero` (theorem, `Mathlib/Analysis/InnerProductSpace/GramSchmidtOrtho.lean`): Independent input gives a nonzero orthogonalized vector at each index.
- `mathlib:CategoryTheory.Functor.rightOp` (def, `Mathlib/CategoryTheory/Opposites.lean`): A contravariant functor Cᵒᵖ→D becomes C→Dᵒᵖ, with explicit opposite map direction.
- `mathlib:FreeAbelianGroup` (def, `Mathlib/GroupTheory/FreeAbelianGroup.lean`): Free additive commutative group with generator and lift API, used for presentations.
- `mathlib:Polynomial` (structure, `Mathlib/Algebra/Polynomial/Basic.lean`): Native semiring-valued polynomials with finitely supported natural-degree coefficients.
- `mathlib:Polynomial.derivative` (def, `Mathlib/Algebra/Polynomial/Derivative.lean`): Native formal derivative as an R-linear map; used for the Cho–Yamauchi weight.
- `mathlib:Metric.infEDist` (def, `Mathlib/Topology/MetricSpace/HausdorffDistance.lean`): Native extended point-to-set distance; its real-valued Metric.infDist wrapper is ENNReal.toReal of this declaration, both exact source statements read.
- `mathlib:MeasureTheory.exists_pair_mem_lattice_not_disjoint_vadd` (theorem, `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean`): Blichfeldt with countable acting additive group, null measurability, invariant measure and an actual additive fundamental domain.
- `mathlib:MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` (theorem, `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean`): Strict convex symmetric Minkowski theorem for finite-dimensional real normed spaces and an actual additive fundamental domain.
- `mathlib:NumberField.mixedEmbedding.finrank` (theorem, `Mathlib/NumberTheory/NumberField/CanonicalEmbedding/Basic.lean`): Real dimension of the mixed embedding space is the number-field degree; complex coordinates count twice.
- `mathlib:NumberField.mixedEmbedding.covolume_idealLattice` (theorem, `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean`): Covolume for an invertible fractional ideal: absNorm times 2^(-r₂) times sqrt absolute discriminant.
- `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup` (instance, `Mathlib/NumberTheory/NumberField/ClassNumber.lean`): Existing finite ideal-class carrier of the full ring of integers.
- `mathlib:NumberField.exists_ideal_in_class_of_norm_le` (theorem, `Mathlib/NumberTheory/NumberField/ClassNumber.lean`): Integral representative of each ideal class bounded by (4/π)^r₂ times d!/d^d times sqrt absolute discriminant.
- `mathlib:NumberField.Units.finrank_modTorsion` (theorem, `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean`): Native quotient of units by torsion has integer rank r₁+r₂−1.
- `mathlib:Module.torsion_by_prime_power_decomposition` (theorem, `Mathlib/Algebra/Module/PID.lean`): For a domain PID R, irreducible p, finite R-module M killed elementwise by powers of p, existence of a finite direct sum of R/(p^k) equivalent to M. Does not order or characterize the exponents.
- `tauceti:TauCeti.ExactStructure` (structure, `TauCeti/CategoryTheory/Exact/ExactStructure.lean`): Intrinsic exact structure on a preadditive category with zero and binary biproducts; identities, composition and stable existing base/cobase changes are part of its data.
- `tauceti:TauCeti.ExactStructure.IsConflationExact` (structure, `TauCeti/CategoryTheory/Exact/Functor.lean`): An additive functor sends each specified source conflation to a target conflation. This is a proposition-valued structure passed explicitly, not a class inferred for arbitrary functors.
- `tauceti:TauCeti.ExactStructure.op` (def, `TauCeti/CategoryTheory/Exact/Opposite.lean`): Opposite exact structure, reversing inflations/deflations and evaluating conflations on the unopposite short complex.
- `tauceti:TauCeti.ExactStructure.split` (def, `TauCeti/CategoryTheory/Exact/Split.lean`): Split exact structure on a category with zero and binary biproducts. Split inflation requires an actual complement conflation; injectivity alone is insufficient.
- `tauceti:TauCeti.ExactK0` (def, `TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`): For an essentially small exact category, the native abelian group on object-isomorphism classes modulo conflation relations.
- `tauceti:TauCeti.ExactK0.of` (def, `TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`): Object class in the actual exact Grothendieck group.
- `tauceti:TauCeti.ExactK0.of_conflation` (theorem, `TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`): The middle object class equals the sum of the two outer classes for a distinguished conflation.
- `tauceti:TauCeti.ExactK0.map` (def, `TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean`): Additive group map induced by an additive conflation-exact functor, with object classes mapped to their images.
- `mathlib:CategoryTheory.ObjectProperty.FullSubcategory` (structure, `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean`): Native full subcategory consisting of objects satisfying an object property; morphisms are inherited from the ambient category.
- `mathlib:CategoryTheory.MorphismProperty.Localization` (def, `Mathlib/CategoryTheory/Localization/Construction.lean`): Native category quotient of paths with specified arrows inverted; no exact structure is supplied by this generic construction alone.
- `mathlib:CategoryTheory.MorphismProperty.Q` (def, `Mathlib/CategoryTheory/Localization/Construction.lean`): Canonical functor to the native localization, preserving identity and composition and inverting the designated arrows.
- `mathlib:HomotopyGroup` (def, `Mathlib/Topology/Homotopy/HomotopyGroup.lean`): Native homotopy classes of generalized loops indexed by a finite type at a base point; degree zero is a type before any H-space group structure.
- `mathlib:HomotopyGroup.pi0EquivZerothHomotopy` (def, `Mathlib/Topology/Homotopy/HomotopyGroup.lean`): The zeroth homotopy type is equivalent to path components. This alone does not identify components with the exact GW presentation.
- `mathlib:IsDiscreteValuationRing.addVal` (def, `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean`): Canonical DVR additive valuation in natural numbers with infinity; zero maps to infinity and unit-times-uniformizer powers have their exponent.
- `mathlib:CategoryTheory.nerve` (def, `Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean`): Native simplicial nerve of a category, built from composable arrows; geometric realization is a separate interface.
- `mathlib:CategoryTheory.nerveMap` (def, `Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean`): A category functor induces the corresponding map of native nerves, with vertex and arrow descriptions.

## Integration boundary

The revision changes only this packet, this reader, the suggested file and its handoff. Independent review must judge both the new contracts and the residual gaps. Acceptance of a budgeted complete pass creates follow-up work for every open stage; it does not change any implementation status or upgrade a partial stage to closed. The manager carries the direct upstream supplier/reciprocal-consumer metadata and routed owner extensions through the integration workflow.
