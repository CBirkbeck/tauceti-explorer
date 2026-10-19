# Algebraic cycles, pure and mixed motives: MC.7

This layer specifies cycle-conjecture predicates, conditional implications and a register of proved cases. Its purpose is to make coefficients, realizations, geometric domains and logical premises explicit enough for a contributor to implement them without treating a conjecture as a theorem. It imports Chow groups and correspondences from MC.0–MC.1, realizations from MC.2, geometric motives from MC.4 and the early Tannakian interface from MC.6. Analytic L-data and the Selmer-side Beilinson–Bloch–Kato statement have the single owner PeriodsAndSpecialValues:PS.6.

**Coverage:** `MotivesAndAlgebraicCycles:MC.7` is **planned** at target level; the planning pass is complete. The 50 targets below contain 16 definitions, 72 API items and 48 discriminating planning tests. There are 12 recorded gaps and 16 supplier requests. These prevent closure. Every implementation remains `unchecked`. A proved-case label describes the mathematics and its stated premises, not a completed Lean implementation.

**Planets:** retain Hodge conjecture and Tate conjecture; add Lefschetz standard conjecture, Bloch–Beilinson filtration, motivic t-structure and real integral Hodge conjecture. The assembled layer has six planets. The exact inherited-target and planet reconciliation is listed below.

## Conventions and imported carriers

**geometry.** Unless an item explicitly admits proper nonprojective varieties, X/k is smooth projective of pure dimension d. Rational Chow groups mean integral Chow groups tensored with Q; equality in a realization never means equality in CH. Geometrically integral hypotheses are stated where used.

**coefficients.** For the standard conjectures, k is algebraically closed, H is a fixed classical Weil cohomology with characteristic-zero coefficient field F, and hard Lefschetz for H is an input. A_H^i is the Q-span of rational algebraic classes in H^{2i}(X)(i). Positivity is on this rational space, never an order on Q_l. Scalar extensions are separate interfaces.

**hodge.** The untwisted class of a codimension-p cycle has Hodge type (p,p) in weight 2p. After twist (p) it has type (0,0). Tau Ceti uses weight -2m and type (-m,-m) for its Tate object tate m. Rational and integral Hodge conjectures are separate predicates.

**real.** R denotes a specified real closed field, C=R(i), G=Gal(C/R). The notation real numbers means the Archimedean field. For general R use equivariant semialgebraic cohomology; do not postulate an analytic Hodge decomposition. Z(j) has G-action (-1)^j. Identifications of embedded twist lattices used by different authors require a scalar normalization.

**S3.** X/R is smooth proper geometrically integral, d>=1. The real-locus pairing is total cup-product degree H^{d-1}(X(R),F2) x H^1(X(R),F2) -> F2; no orientation is needed.

**S54.** S3, plus either R is the real numbers or H^2(X,O_X)=0, real integral Hodge for 1-cycles, and universal CH0 support on a surface after every algebraically closed extension C/R. Low-dimensional statements use the source zero conventions; d>=3 is imposed for cohomology indexed d-3.

**status.** Conjecture predicates, conditional implication theorems, proof-scoped proved cases, source-only register entries, and source questions are labelled separately in each target. An unchecked planning node is never a library implementation.

The source homological motive convention puts the realization of M(X) in degrees [−2d,0]. It sends the geometric Tate object Q(1) to degree0, whereas the Lefschetz summand of M(P¹) is Q(1)[2]. MC.1 uses the contravariant Chow convention, sending its 1(m) to Q(−m)[−2m]; this variance and shift must be checked at the MC.4 boundary.

## Baseline and ownership

The pinned libraries are Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The following declarations were read at those pins; their geometric applications remain separate targets.

| Declaration | Module | Exact role in this layer |
| --- | --- | --- |
| `tauceti:TauCeti.Hodge.HodgeStructureOn` | `TauCeti/Geometry/Hodge/Structure.lean` | Bounded opposed filtration on an actual complex vector space with conjugation; supplies the abstract pure Hodge carrier, not geometric cohomology. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn.piece` | `TauCeti/Geometry/Hodge/Structure.lean` | The component H^{p,n-p} is F^p intersected with conjugate F^{n-p}. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn.mem_conjF_iff` | `TauCeti/Geometry/Hodge/Structure.lean` | Membership in conjugate filtration is tested by applying the given conjugation. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn.IsMorphism` | `TauCeti/Geometry/Hodge/Morphism.lean` | Complex-linear maps commuting with conjugation and preserving F. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn.IsMorphism.map_piece_le` | `TauCeti/Geometry/Hodge/Morphism.lean` | Such a morphism maps every pure Hodge component to its counterpart. |
| `tauceti:TauCeti.Hodge.tate` | `TauCeti/Geometry/Hodge/Tate/Basic.lean` | Rank-one integral Tate structure of weight -2m with cutoff filtration p<=-m. |
| `tauceti:TauCeti.Hodge.tate_piece` | `TauCeti/Geometry/Hodge/Tate/Basic.lean` | The p-component of tate m is the entire complex line exactly at p=-m, and is zero elsewhere. |
| `mathlib:CategoryTheory.Triangulated.TStructure` | `Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean` | Abstract t-structure on a pretriangulated category; supplies no motivic t-structure. |
| `mathlib:CategoryTheory.Triangulated.TStructure.heart` | `Mathlib/CategoryTheory/Triangulated/TStructure/Heart.lean` | Heart object property is the intersection of the nonpositive and nonnegative parts. |

The current TauCetiRoadmap and Tau Ceti sources were also audited. data/library-coverage.json has no reviewed MotivesAndAlgebraicCycles stage entry; absence is not evidence of no declarations. Exact pinned source statements were read for the nine baseline declarations.

- Current AlgebraicVectorBundles README and Suggested.lean: vector bundles, operations and Chern-facing interfaces are imported; no new vector-bundle theory here.
- Current RealAlgebraicGeometry README and Suggested.lean: effective real algebra/semialgebraic interfaces are imported, but do not supply the required equivariant cohomology.
- Current completed HodgeStructures and current/pinned TauCeti Geometry/Hodge modules: import abstract pure Hodge structures and morphisms.
- Mathlib TStructure Basic/Heart at the pin: import abstract t-structures and their hearts.

Current roadmap commit: `0d144d044dacebca17b654695b6f1ad58f159b27`; current library commit: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. MotivesAndAlgebraicCycles is not among the 94 upstream/CaraianiNewton roadmaps. No higher-tier theorem is used to define a lower-tier carrier. Keep early realization, abstract Tannaka and late arithmetic compatibility separate to avoid a blanket MC.2/MC.7 cycle.

The accepted RS-08 restructuring retains MC.7. Only this layer is specified here. Abstract cohomology, vector bundles, pure Hodge structures, general t-structures, Picard schemes, neutral reconstruction and special-cycle constructions retain their existing owners. Requests extend those owners at an explicit interface; unregistered proposed owners are recorded as gaps.

## Rational cycle classes and the standard conjectures

<a id="rational-classes-of-type"></a>

### Rational classes on the existing Hodge carrier

**Target:** `MotivesAndAlgebraicCycles:MC.7/rational-classes-of-type`. **Kind:** definition. Definition; geometric specialization requires the requested comparison theorem.

For a Q-vector space V, a complex vector space W with its compatible restricted Q-module, a Q-linear comparison i:V→W, a conjugation ω on W and the existing pure Hodge structure hs of weight n, put RationalClassesOfType(i,hs,p)=i^{-1}(F^p W ∩ conjugate(F^{n-p}W)), a Q-subspace of V. No injectivity or fixed-conjugation property is silently built into i. Geometric rational Hodge classes specialize this construction to n=2p and the canonical comparison.

**Uses defining the API.**

- Retained MC.7/hodge-class and Deligne §2: Expose the exact comparison between the rational carrier and its (p,p) complex component.
- Ichino–Prasanna Definition 12.1: Use type(0,0) for a weight-zero compatible realization before imposing all-prime Galois invariance.

**API.**

- `CycleConjectures.rationalClassesOfType` (constructor): The inverse-image Q-subspace just specified; membership is equivalent to i(v) lying in hs.piece p.
- `CycleConjectures.rationalClassesOfType_ext` (extensionality): Two such subspaces agree when their membership predicates agree for every rational vector.
- `CycleConjectures.rationalClassesOfType_diagonal_iff` (characterisation): If n=2p and ω(i(v))=i(v) for every v, membership is exactly i(v)∈F^p.
- `CycleConjectures.rationalClassesOfType_map` (functoriality): A Q-linear f and complex Hodge morphism g satisfying i′f=gi send this subspace into the corresponding subspace; identities and composites obey the inherited map laws.
- `CycleConjectures.rationalClassesOfType_wrong_weight` (characterisation): If i is injective, its image is fixed by conjugation, and n≠2p, the rational subspace of type (p,n-p) is zero, by disjointness of distinct Hodge components.

**Discriminating tests.** These are specification checks; only the two identified Tate-line tests are executed in the suggested file.

- `CycleConjectures.rationalType_tate_unit` (computation): For V=Q, W=C, i the scalar embedding and hs=tate0, the p=0 subspace is all Q. This example is proved in the suggested file.
- `CycleConjectures.rationalType_tate_wrong_index` (non-example): For the same Tate0 object and p=1 the subspace is zero. This example is proved in the suggested file.
- `CycleConjectures.rationalType_twist_sign` (compatibility): For hs=tate(-1), weight 2, the p=1 subspace along Q→C is all Q, whereas p=0 gives zero. This is a named README test target, not an admitted example.

**Construction or proof.**

1. Restrict the scalars of the existing complex Hodge piece to Q and take its inverse image along i.
2. For diagonal classes use conjugation-fixity and n=2p to identify the two filtration tests. For functoriality apply the imported map_piece_le to the commuting comparison square.

**Check.** The suggested file defines this inverse image with a real body on pinned carriers. Neither the geometric cohomology Hodge structure nor algebraicity of any class is assumed by this definition.

**Direct prerequisites:** `tauceti:TauCeti.Hodge.HodgeStructureOn`, `tauceti:TauCeti.Hodge.HodgeStructureOn.piece`, `tauceti:TauCeti.Hodge.HodgeStructureOn.mem_conjF_iff`, `tauceti:TauCeti.Hodge.HodgeStructureOn.IsMorphism.map_piece_le`, `tauceti:TauCeti.Hodge.tate`, `tauceti:TauCeti.Hodge.tate_piece`.

**Source:** [Pierre Deligne, The Hodge Conjecture](https://www.claymath.org/wp-content/uploads/2022/06/hodge.pdf), §§1–2 pp.1–3. Rational classes are selected by the Hodge component after comparison; the abstract Hodge carrier is imported from the pinned library.

<a id="hodge-conjecture-interface"></a>

### Retained rational Hodge conjecture and geometric comparison

**Target:** `MotivesAndAlgebraicCycles:MC.7/hodge-conjecture-interface`. **Kind:** comparison. Comparison and conjecture interface.

Retain MC.7/hodge-class, MC.7/cycle-classes-are-hodge and MC.7/hodge-conjecture. For smooth projective X/C and 0≤p≤d, Hdg^{2p}(X,Q)=H^{2p}(X,Q)∩H^{p,p}(X) inside complex cohomology, equivalently the preimage of F^p. HC(X,p) is surjectivity of CH^p(X)_Q→Hdg^{2p}(X,Q). The geometric comparison must identify this with RationalClassesOfType at n=2p, compatibly with twist(p), cup product and correspondence action. Algebraic classes lie in the target unconditionally; surjectivity is a conjecture predicate.

**Construction or proof.**

1. Use the imported geometric Hodge decomposition and the cycle-class compatibility.
2. For a rational vector, conjugation fixes it and membership in F^p in weight 2p is the diagonal-component criterion.

**Check.** The cycle inclusion is a proved input; HC(X,p) remains a proposition to state, not an axiom. Twisting by p changes (p,p), weight 2p to (0,0), weight 0. A complex (p,p) vector with no rational preimage is not a rational Hodge class.

**Direct prerequisites:** `MotivesAndAlgebraicCycles:MC.7/hodge-class`, `MotivesAndAlgebraicCycles:MC.7/cycle-classes-are-hodge`, `MotivesAndAlgebraicCycles:MC.7/hodge-conjecture`, [rational-classes-of-type](#rational-classes-of-type), `MotivesAndAlgebraicCycles:MC.2`, `ComplexComparisonPartII:C5`.

**Source:** [Pierre Deligne, The Hodge Conjecture](https://www.claymath.org/wp-content/uploads/2022/06/hodge.pdf), §§1–3 pp.1–4. Specifies the rational class condition and cycle-class inclusion; it does not prove general algebraicity.

<a id="rational-kunneth-C"></a>

### Rational algebraicity of Künneth projectors

**Target:** `MotivesAndAlgebraicCycles:MC.7/rational-kunneth-C`. **Kind:** definition. Rational refinement of the retained coefficient-field predicate.

In the fixed classical Weil theory H with coefficient field F, for smooth projective X/k of dimension d, C_Q,H(X) asserts that each cohomological Künneth projector π_i∈H^{2d}(X×X)(d) is the class of an element of CH^d(X×X)_Q. The projectors are canonical in cohomology; their cycle representatives need not be idempotent modulo rational equivalence. This rational-algebraicity condition implies the old F-linear cycle condition after scalar extension, while the converse needs a scalar-descent argument and is not a definition.

**Uses defining the API.**

- Kleiman Theorem 4.1: The algebraic inverse Lefschetz implication produces rational projector cycles.
- Jannsen Conjecture 2.1 and Murre Conjecture 5.1: Graded action and Chow–Künneth lifting require the rational version.

**API.**

- `StandardConjectures.CQ` (constructor): Every π_i has a rational Chow representative.
- `StandardConjectures.CQ_realization` (characterisation): A representative acts as identity in degree i and zero in other degrees.
- `StandardConjectures.CQ_extend` (compatibility): Scalar extension Q→F gives the F-linear algebraicity condition.
- `StandardConjectures.CQ_product` (functoriality): For products the degree-i projector is the sum of exterior products with indices adding to i.

**Discriminating tests.** These are specification checks; only the two identified Tate-line tests are executed in the suggested file.

- `StandardConjectures.CQ_point` (degenerate): For Spec k the degree 0 projector is the diagonal and all other projectors are0.
- `StandardConjectures.CQ_projective_space` (computation): For P^d only the even projectors occur, with rational product-hyperplane representatives.
- `StandardConjectures.CQ_not_chow_lift` (non-example): Two representatives differing by a homologically trivial correspondence have the same cohomological action; C_Q does not identify them in Chow or force either to be Chow-idempotent.

**Construction or proof.**

1. Use the existing Künneth components of the diagonal and the rational cycle map.
2. Express algebraicity as membership in its image without choosing canonical Chow lifts.

**Check.** Orthogonality in cohomology does not prove Chow orthogonality.

**Direct prerequisites:** `MotivesAndAlgebraicCycles:MC.2/kunneth-components`, `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`, `MotivesAndAlgebraicCycles:MC.0/correspondence-action-on-cycles`, `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`, `MotivesAndAlgebraicCycles:MC.0/numerical-equivalence`.

**Source:** [Steven L. Kleiman, The standard conjectures](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische1994.Kleiman.Standard.Conjectures.pdf), §3 pp.11–12 and Theorem 4.1 pp.14–15. Uses rational algebraic correspondences for the standard-conjecture implications.

<a id="rational-numerical-D"></a>

### Numerical equals homological for rational cycles

**Target:** `MotivesAndAlgebraicCycles:MC.7/rational-numerical-D`. **Kind:** definition. Explicit rational version used by the implication theorems.

For the fixed H and smooth projective X/k, D_Q,H(X) says that every z∈CH^j(X)_Q whose degree pairing with every complementary rational cycle is zero has cl_H(z)=0, for every j. The reverse containment of equivalence relations follows from trace compatibility, so this is equality of numerical and H-homological equivalence on rational cycles. The coefficient field of H may differ from Q; the cycles being tested remain rational.

**Uses defining the API.**

- Kleiman Proposition 5.1: Compare D with A and the Hodge standard positivity predicate.
- Jannsen1992 Corollary 1: Specify when homological and numerical motive quotients may be compared, without asserting the conjecture.

**API.**

- `StandardConjectures.DQ` (constructor): Numerical triviality of every rational cycle implies its H-class vanishes.
- `StandardConjectures.DQ_iff_kernels` (characterisation): The numerical and realization kernels agree in every codimension.
- `StandardConjectures.DQ_pairing` (equivalence): Equivalently the rational algebraic-image intersection pairing has zero radical.
- `StandardConjectures.DQ_transport` (compatibility): An isomorphism preserving cycle products and realization transports the predicate.

**Discriminating tests.** These are specification checks; only the two identified Tate-line tests are executed in the suggested file.

- `StandardConjectures.DQ_point` (degenerate): On a point the degree pairing Q×Q→Q has no radical.
- `StandardConjectures.DQ_projective_space` (computation): Complementary powers h^j,h^{d−j} pair to1, so D holds in every codimension.
- `StandardConjectures.DQ_all_complements` (non-example): On P¹×P¹ the divisor a−b pairs to0 with the ample class a+b but is not numerically trivial: its pairing with a is -1. A single ample test is insufficient.

**Construction or proof.**

1. Use the imported rational intersection pairing and homological kernel.
2. Trace compatibility gives homological⇒numerical; the predicate supplies the other implication.

**Check.** Do not test numerical triviality against only one ample power.

**Direct prerequisites:** `MotivesAndAlgebraicCycles:MC.0/numerical-equivalence`, `MotivesAndAlgebraicCycles:MC.2/homological-equivalence`, `MotivesAndAlgebraicCycles:MC.2/trace-of-a-product`.

**Source:** [Steven L. Kleiman, The standard conjectures](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische1994.Kleiman.Standard.Conjectures.pdf), §3 pp.11–12; Proposition 5.1 pp.16–17. Separates rational numerical and homological equivalence and relates them by primitive positivity.

<a id="lefschetz-standard-A"></a>

### Standard conjecture A on algebraic classes

**Target:** `MotivesAndAlgebraicCycles:MC.7/lefschetz-standard-A`. **Kind:** definition. Conjecture predicate, with hard Lefschetz an imported theorem in admitted theories.

Fix the standard-conjecture conventions and an ample rational divisor class η, with L=cup η. A_H(X,η) means that for each 0≤j≤d/2, L^{d-2j}:A_H^j(X)→A_H^{d-j}(X) is bijective. Here A_H is the rational image of Chow classes in the chosen cohomology, not the entire cohomology and not the Chow group modulo rational equivalence.

**Uses defining the API.**

- Kleiman Theorem 4.1 and Corollary 4.2: Compare inverse Lefschetz correspondences with bijectivity on algebraic classes.
- Kleiman Proposition 5.1: Combine algebraic Lefschetz with Hodge positivity to obtain numerical equals homological.

**API.**

- `StandardConjectures.A` (constructor): The predicate is the conjunction of the displayed restricted bijectivities.
- `StandardConjectures.A_iff_surjective` (characterisation): Under hard Lefschetz, each restricted map is injective, so A is equivalent to surjectivity in these degrees.
- `StandardConjectures.A_rescale` (compatibility): Replacing η by a positive rational multiple does not change A: each map is multiplied by a nonzero rational power.
- `StandardConjectures.A_transport` (functoriality): An isomorphism of polarized varieties with the same realization conventions transports A in both directions.

**Discriminating tests.** These are specification checks; only the two identified Tate-line tests are executed in the suggested file.

- `StandardConjectures.A_projective_space` (computation): For P^d, η=h, h^j maps to h^{d-j}; every required map is an isomorphism of Q-lines.
- `StandardConjectures.A_middle` (degenerate): For 2j=d, the exponent is zero and the required map is the identity on A_H^j.
- `StandardConjectures.A_not_chow` (non-example): For a positive-genus complex curve, A holds on the degree-one algebraic image even though CH^1_Q contains a nonzero degree-zero Picard part killed by realization.

**Construction or proof.**

1. Form the rational image spaces using the imported cycle map. The cohomological Lefschetz map restricts to them by multiplicativity. Package bijectivity as a predicate, without choosing a new inverse.

**Check.** Do not replace an algebraic image by CH^j itself.

**Direct prerequisites:** `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`, `MotivesAndAlgebraicCycles:MC.2/cycle-class-degree`, `SchemeAndStackFoundations:SF.5`.

**Source:** [Steven L. Kleiman, The standard conjectures](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische1994.Kleiman.Standard.Conjectures.pdf), §4 p.13, conjecture A(X,L). States Lefschetz on the algebraic subspaces of the fixed Weil cohomology.

<a id="lefschetz-standard-B"></a>

### Lefschetz standard conjecture

**Target:** `MotivesAndAlgebraicCycles:MC.7/lefschetz-standard-B`. **Kind:** definition. Conjecture predicate.

With the same k,H,X,η, B_H(X) means that for every 0≤i≤d the inverse of L^{d-i}:H^i(X)→H^{2d-i}(X) is induced by a rational algebraic correspondence of degree i-d, equivalently a class in CH^i(X×X)_Q acting from degree 2d-i to degree i. The dependence on η is removed by the comparison theorem, rather than assumed in the data. Equivalent formulations use an algebraic lowering operator Λ or primitive projectors with the specified Lefschetz convention.

**Uses defining the API.**

- Kleiman Theorem 4.1: Derive A and Künneth C from algebraic inverse Lefschetz.
- Beilinson §1.4 pp.2–3: An assumed motivic t-structure lifts hard Lefschetz inverses to Chow correspondences.

**API.**

- `StandardConjectures.B` (constructor): For every i in [0,d], provide an algebraic cohomological inverse to L^{d-i}.
- `StandardConjectures.B_inverse_action` (characterisation): The correspondence action composes on either side with L^{d-i} to the appropriate identity.
- `StandardConjectures.B_iff_lowering_algebraic` (equivalence): Under hard Lefschetz and the fixed primitive conventions, B is equivalent to algebraicity of Λ.
- `StandardConjectures.B_independent_ample` (compatibility): The truth value is unchanged by replacing the ample divisor, as proved in Theorem 4.1.

**Discriminating tests.** These are specification checks; only the two identified Tate-line tests are executed in the suggested file.

- `StandardConjectures.B_projective_space` (computation): On P^d the inverse operators have representatives given by products of powers of the two hyperplane classes, with the action degree i-d.
- `StandardConjectures.B_identity` (degenerate): At i=d the diagonal correspondence realizes the identity; no negative-degree inverse is requested.
- `StandardConjectures.B_degree_check` (non-example): For a surface the inverse H^4→H^0 is represented by a codimension-zero correspondence; demanding codimension d for every inverse gives the wrong degree.

**Construction or proof.**

1. Use the realization action of degree-(i-d) correspondences from MC.0/MC.2.
2. State existence of a cycle inducing the unique cohomological inverse; keep nonuniqueness modulo rational equivalence.

**Check.** The representative has codimension i on X×X. The identity degree i=d is included.

**Direct prerequisites:** [lefschetz-standard-A](#lefschetz-standard-A), `MotivesAndAlgebraicCycles:MC.2/classical-weil-cohomology`, `MotivesAndAlgebraicCycles:MC.0/correspondence-action-on-cycles`, `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`, `MotivesAndAlgebraicCycles:MC.0/numerical-equivalence`.

**Source:** [Steven L. Kleiman, The standard conjectures](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische1994.Kleiman.Standard.Conjectures.pdf), §4 pp.13–15, definition B(X), Theorem 4.1. Identifies algebraicity of inverse Lefschetz with the lowering-operator and primitive-projector formulations.

<a id="hodge-standard-positivity"></a>

### Hodge standard conjecture on rational primitive cycles

**Target:** `MotivesAndAlgebraicCycles:MC.7/hodge-standard-positivity`. **Kind:** definition. Conjecture predicate; proved special cases are recorded separately.

For each 0≤j≤d/2 let P A_H^j= A_H^j∩ker(L^{d-2j+1}). Hdg_H(X,η) means that the Q-valued symmetric pairing (a,b)↦(-1)^j deg(a·b·η^{d-2j}) is positive definite on this rational primitive space. The degree comes from rational intersection numbers via the trace compatibility; it is not an ordering on the coefficient field F. In particular positivity is a separate conjecture from B and from arithmetic Tate.

**Uses defining the API.**

- Kleiman Proposition 5.1: Anisotropy proves A+Hdg implies D.
- Kleiman Proposition 5.4: With B, positivity on X×X controls adjoints of algebraic correspondences.

**API.**

- `StandardConjectures.Hdg` (constructor): Every nonzero primitive rational algebraic class has strictly positive signed self-intersection.
- `StandardConjectures.Hdg_pairing` (data): The associated bilinear form is symmetric and Q-valued, with the displayed sign and exponent.
- `StandardConjectures.Hdg_rescale` (compatibility): Multiplying η by a positive rational rescales the primitive pairing positively and preserves the predicate.
- `StandardConjectures.Hdg_anisotropic` (characterisation): A primitive vector with zero self-pairing is zero under Hdg; this is the precise input to numerical/homological comparison.

**Discriminating tests.** These are specification checks; only the two identified Tate-line tests are executed in the suggested file.

- `StandardConjectures.Hdg_surface_sign` (computation): For primitive divisors on a surface the positive form is -deg(D·E), agreeing with SF.5/hodge-index.
- `StandardConjectures.Hdg_point` (degenerate): For Spec k the j=0 form on Q is (a,b)↦ab, hence positive definite.
- `StandardConjectures.Hdg_no_order_Ql` (non-example): For an l-adic realization no order on Q_l is supplied: the positivity assertion is on the rational cycle-image form and cannot demand that arbitrary Q_l scalars be positive.

**Construction or proof.**

1. Use the imported rational intersection pairing and primitive kernel; record positive definiteness as a predicate.
2. In characteristic zero Betti Hodge–Riemann gives the assertion, and comparison transports it to the admitted étale theory. For surfaces it is the imported Hodge-index theorem.

**Check.** Positivity is not inferred from Tate in positive characteristic.

**Direct prerequisites:** [lefschetz-standard-A](#lefschetz-standard-A), `MotivesAndAlgebraicCycles:MC.2/trace-of-a-product`, `SchemeAndStackFoundations:SF.5`, `ComplexComparisonPartII:C5`.

**Source:** [Steven L. Kleiman, The standard conjectures](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische1994.Kleiman.Standard.Conjectures.pdf), §5 pp.16–17, conjecture Hdg(X) and Proposition 5.1. Specifies rational primitive algebraic classes and the signed intersection form.

<a id="standard-implications"></a>

### Implications among the standard conjectures

**Target:** `MotivesAndAlgebraicCycles:MC.7/standard-implications`. **Kind:** theorem. Conditional proved implication theorem.

In the fixed hard-Lefschetz Weil theory, B_H(X) implies A_H(X,η) and rational Künneth C_H(X). A_H(X×X,η⊠1+1⊠η) implies B_H(X); consequently global A for all smooth projective varieties is equivalent to global B. Rational D_H(X) implies A_H(X,η), and A_H(X,η) together with Hdg_H(X,η) implies rational D_H(X). Over C, HC(X) in every codimension implies A_H(X,η) and D_H(X), while HC(X×X) in the required degrees implies B_H(X). These are conditional implication maps; none supplies a proof of a general conjecture.

**Construction or proof.**

1. Realize inverse Lefschetz and primitive projectors by correspondences and express Künneth projections through them.
2. For D compare the algebraic primitive intersection pairing: Hdg supplies nondegeneracy and A reconstructs complementary algebraic classes.
3. For the Hodge consequence the inverse operator is a Hodge class on X×X; apply the product Hodge conjecture, not HC for an unrelated degree on X.

**Check.** The premise involving X×X cannot be weakened to A(X) by deleting the product. Use rational versions of C and D; an arbitrary F-linear cycle formulation needs the separate scalar-extension comparison. The signs and primitive exponents agree with the definition above.

**Direct prerequisites:** [lefschetz-standard-A](#lefschetz-standard-A), [lefschetz-standard-B](#lefschetz-standard-B), [hodge-standard-positivity](#hodge-standard-positivity), [rational-kunneth-C](#rational-kunneth-C), [rational-numerical-D](#rational-numerical-D), [hodge-conjecture-interface](#hodge-conjecture-interface), `MotivesAndAlgebraicCycles:MC.2`, `MotivesAndAlgebraicCycles:MC.0/correspondence-action-on-cycles`, `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`, `MotivesAndAlgebraicCycles:MC.0/numerical-equivalence`.

**Source:** [Steven L. Kleiman, The standard conjectures](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische1994.Kleiman.Standard.Conjectures.pdf), Theorem 4.1 and Corollary 4.2 pp.14–15; Proposition 5.1 pp.16–17; Corollary 5.3 p.18. Gives the precise pointwise/product/global implications and the characteristic-zero Hodge input.

<a id="tate-variants-corrected"></a>

### Tate variants with the necessary quantifiers

**Target:** `MotivesAndAlgebraicCycles:MC.7/tate-variants-corrected`. **Kind:** comparison. Corrected comparison; conditional global implication register.

Retain MC.7/tate-conjecture, MC.7/strong-tate-conjecture and MC.7/tate-beilinson-conjecture. For k finitely generated over its prime field and l≠char(k), T(X,p,l) says CH^p(X)⊗Q_l→H^{2p}(X_ksep,Q_l(p))^{G_k} is onto. The geometric Tate subspace is the union of invariants for open subgroups, equivalently classes defined after finite extension; it is a different target. Strong Tate also requires the invariants to be a direct summand of the G_k-representation. Over a finite field, Tate–Beilinson combines this Q_l-surjectivity with injectivity of CH^p(X)⊗Q→H^{2p}(X_ksep,Q_l(p)); its injectivity uses rational Chow coefficients, with no claim here of Q_l-linear injectivity. Global strong Tate over all smooth projective varieties and relevant powers yields the Lefschetz/Künneth/numerical standard conjectures in the stated theory; no implication to Hodge positivity in positive characteristic is asserted. Integral Z_l surjectivity is a distinct generally false strengthening. Preserve also the inherited variants with their hypotheses: the Borel–Moore cycle-class conjecture for an arbitrary variety over a finitely generated field follows from the smooth-projective version if it admits a resolution with smooth compactification; over finite fields divisor Tate implies integral divisor Tate, and divisor Tate for all surfaces over finite fields implies integral1-cycle Tate over their algebraic closures. For a smooth projective surface over a finite field fibred with connected fibres over a smooth projective curve and smooth generic fibre of Jacobian J, divisor Tate is equivalent to finite Brauer group, finite Sha(J), and BSD for J over the function field. These implications import the exact arithmetic proof contracts in G-TATE-VARIANTS.

**Construction or proof.**

1. Keep the fixed field and chosen prime as explicit parameters. Finite-extension classes are obtained by the filtered union of open-subgroup invariants.
2. For the implication register require the global Tate and semisimplicity hypotheses on the varieties/products used to realize inverse Lefschetz and projectors; a single codimension statement does not suffice.

**Check.** For k algebraically closed the arithmetic Tate predicate is outside its finitely-generated-base domain. Surjectivity does not imply injectivity or semisimplicity as a definition. Replace the overly broad implication sentence of the retained tate-conjecture-variants during assembly.

**Direct prerequisites:** `MotivesAndAlgebraicCycles:MC.7/tate-conjecture`, `MotivesAndAlgebraicCycles:MC.7/strong-tate-conjecture`, `MotivesAndAlgebraicCycles:MC.7/tate-beilinson-conjecture`, [rational-numerical-D](#rational-numerical-D), `MotivesAndAlgebraicCycles:MC.2`.

**Source:** [Burt Totaro, Recent progress on the Tate conjecture](https://www.math.ucla.edu/~totaro/papers/public_html/tate.pdf), §1 Conjecture 1.1 pp.2–3; §2 pp.5–7. Separates fixed-base and finite-extension Tate classes, integral variants, semisimplicity, and the exclusion of the Hodge standard conjecture from the positive-characteristic implication.

**Source:** [Burt Totaro, Recent progress on the Tate conjecture](https://www.math.ucla.edu/~totaro/papers/public_html/tate.pdf), §1 pp.4–5; §2 pp.6–7. Gives the fibred-surface equivalences, Borel–Moore reduction and two distinct integral implications.

<a id="known-case-register"></a>

### Coefficient-sensitive register of Hodge, Tate and standard cases

**Target:** `MotivesAndAlgebraicCycles:MC.7/known-case-register`. **Kind:** application. Typed theorem register, with proofs and source-only entries distinguished.

The register fixes the predicate, field, characteristic, degree and proof scope of each case. H1: integral and rational HC in codimension1 over C for smooth proper varieties, by the divisor theorem. T1: strong Tate in codimension1 for abelian varieties over finite fields, l≠char(k). T2: the same for abelian varieties over number fields, using Faltings’s isogeny theorem. T3: Tate for divisors on abelian varieties over any field finitely generated over its prime field, l invertible. T4: Tate for divisors on smooth projective varieties over a number field with h^{2,0}=0. T5: Tate for divisors on K3 surfaces over number fields. T6: Tate for divisors on irreducible hyperkähler varieties over number fields. T7: Tate for divisors on smooth proper X over a finitely generated characteristic-zero field with h^{2,0}=1, provided some complex embedding admits a deformation over a smooth base on which the H² Hodge structure varies nontrivially. T8: Tate for divisors on K3 surfaces over finite fields, including characteristic2; the historical p>5 non-supersingular result alone does not cover all of T8. All T entries have Q_l cycle coefficients. TB1: CH^1(X)_Q→H²(X_ksep,Q_l(1)) is injective for smooth projective X over a finite field. B1: Lefschetz B for curves, surfaces, abelian varieties and generalized flag varieties G/P in the setting of Kleiman Proposition 4.3. C1: retain the dimension≤2, abelian, finite-field-algebraic-closure and product register of known-cases-of-conjecture-C, subject to its explicit primary-proof and realization-scope gaps. Hdg1: Hodge standard positivity in characteristic zero for the Betti theory and its compared étale theory. Entries H1 and TB1 have short proofs here; B1 and the other T/C entries retain primary-proof gaps rather than acquiring proofs from a survey citation.

**Construction or proof.**

1. For H1 apply the complex divisor theorem. For T4 use its rational form and the geometric étale comparison, then descend a finite collection of divisors by trace and divide by the extension degree.
2. For TB1, Pic^0(k) is finite and the Néron–Severi group injects rationally into l-adic cohomology by Kummer; tensoring Pic^0(k) with Q gives0.
3. For T2 import the existing Faltings owner rather than restating its isogeny theorem. The other non-elementary entries have exact primary-proof contracts in G-KNOWN.

**Check.** No assertion of Tate in every codimension for all abelian varieties is made. T7 retains its varying-deformation hypothesis. The entries describe statements in the cited editions; they are not an exhaustive claim about the current frontier.

**Direct prerequisites:** [hodge-conjecture-interface](#hodge-conjecture-interface), [tate-variants-corrected](#tate-variants-corrected), [lefschetz-one-one-cases](#lefschetz-one-one-cases), [lefschetz-standard-B](#lefschetz-standard-B), [hodge-standard-positivity](#hodge-standard-positivity), `MotivesAndAlgebraicCycles:MC.7/known-cases-of-conjecture-C`, `FaltingsFinitenessAndIsogenyTheorems:R28.4`, `MotivesAndAlgebraicCycles:MC.2`.

**Source:** [Burt Totaro, Recent progress on the Tate conjecture](https://www.math.ucla.edu/~totaro/papers/public_html/tate.pdf), §2 p.7; §3 pp.7–9; §4 pp.9–10, Theorem 4.1; opening of §5 pp.10–11. States the individual divisor cases with their fields and the deformation hypothesis; supplies a survey proof of T1, not a substitute for its foundational moduli/isogeny suppliers.

**Source:** [Steven L. Kleiman, The standard conjectures](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische1994.Kleiman.Standard.Conjectures.pdf), Proposition 4.3 p.16; §5 pp.16–19. Lists the Lefschetz cases and characteristic-zero positivity.

**Source:** [Uwe Jannsen, Motives, numerical equivalence, and semi-simplicity](https://epub.uni-regensburg.de/26642/1/jannsen10.pdf), Remarks1–2 p.451. Gives the retained C case register.

**Source:** [Pierre Deligne, The Hodge Conjecture](https://www.claymath.org/wp-content/uploads/2022/06/hodge.pdf), §2 remark(iii) p.2. Integral divisor algebraicity.

<a id="smash-nilpotence-proof-correction"></a>

### Rational-point smash nilpotence with the corrected coefficient

**Target:** `MotivesAndAlgebraicCycles:MC.7/smash-nilpotence-proof-correction`. **Kind:** theorem. Proved target with corrected proof and explicit auxiliary supplier contracts.

Retain the statement of MC.7/smash-nilpotence: for geometrically irreducible smooth projective X/k and x,x′∈X(k), ([x]−[x′])^{×n} is torsion in CH₀(X^n) for sufficiently large n. After base change to kbar and a smooth curve C through the points, let π:C^n→Sym^n C have degree n!, L=O_C(x−x′), L_i=pr_i*L, N=Norm_π(L_1), α_n=∏c₁(L_i), β_n=c₁(N)^n. Then π*N≃(⊗_i L_i)^((n−1)!), and π*β_n=((n−1)!)^n n! α_n. For n>g and n≥max(0,2g−1), the Abel map to Pic^n is a projective bundle, N descends from Pic^n, and β_n=0 by dimension. Thus a nonzero integer kills α_n over kbar, and the algebraic-extension torsion-kernel theorem gives the assertion over k. The corrected integer replaces the erroneous (n!)^n in the online proof, without changing its torsion conclusion.

**Construction or proof.**

1. If x=x′ the cycle is zero; in dimension0 geometric irreducibility and the rational point reduce to this case. Otherwise use the existing field-extension torsion-kernel target, and geometric Bertini with imposed distinct points to reduce to a smooth curve over the algebraic closure.
2. In the norm pullback, each L_i occurs (n−1)! times in the product over permutations. Since c₁(L_i)²=0, exactly n! ordered monomials survive in the nth power.
3. Base change for the norm transports the connected Picard family joining L to O_C. Its restriction to each projective Abel fibre is algebraically trivial, hence trivial; the projective-bundle Picard calculation makes N a pullback. A power above dim Pic^n=g is zero.
4. The finite-flat symmetric quotient, Picard fibre calculation and connected-family degree constancy are supplied through R-SF3; the high-degree Abel projective bundle and norm themselves are already exact imported nodes.

**Check.** For n=2 the surviving coefficient is2, whereas (n!)^n would be4; for n=3 it is48, whereas the printed coefficient is216. The conclusion is torsion integrally and zero after tensoring with Q. This is smash nilpotence of rational-point differences, not a proof of smash nilpotence for every numerically trivial cycle.

**Direct prerequisites:** `MotivesAndAlgebraicCycles:MC.7/smash-nilpotence`, `MotivesAndAlgebraicCycles:MC.2/chow-kernel-torsion`, `SchemeAndStackFoundations:SF.3/line-bundle-norm`, `SchemeAndStackFoundations:SF.3/abel-maps-high-degree`, `SchemeAndStackFoundations:SF.5/first-chern`, `SchemeAndStackFoundations:SF.5/projective-bundle-formula`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.2`.

**Source:** [The Stacks Project authors, Weil Cohomology Theories](https://stacks.math.columbia.edu/tag/0FH9), Tag0FH9, proof, online version read 19 October2026; Tag0FH8 for descent. The argument uses norm, symmetric powers and vanishing by dimension. Its multinomial coefficient is corrected here.

## Filtrations and the conditional category of mixed motives

<a id="bloch-beilinson-axioms"></a>

### Bloch–Beilinson filtration in Jannsen’s version 1

**Target:** `MotivesAndAlgebraicCycles:MC.7/bloch-beilinson-axioms`. **Kind:** definition. Definition of a system; its existence is conjectural.

For a field k and one fixed classical Weil cohomology H, a version-1 Bloch–Beilinson system assigns a descending Q-subspace filtration F^ν CH^j(X)_Q for every smooth projective X/k and j≥0. It has F^0=CH^j_Q, F^1=ker(cl_H), products F^r·F^s⊆F^{r+s}, and compatibility with pullback and proper pushforward with their codimension shifts. Assuming rational algebraic Künneth C for the system, the induced action on Gr_F^ν CH^j depends only on homological correspondence classes and π_i acts as δ_{i,2j-ν}. For each (X,j) the filtration is eventually zero. The strong form requires F^{j+1}=0. Existence is a global conjecture, not a chosen axiom on individual Chow groups.

**Uses defining the API.**

- Jannsen Theorem 5.2 and Proposition 5.3: A finite multiplicative filtration makes the homologically trivial correspondence ideal nilpotent and lifts projectors.
- MC.7/murre-axioms below: Compare the canonical filtration with one defined by Chow–Künneth projectors.

**API.**

- `BlochBeilinsonFiltration.step` (projection): Evaluate F^ν CH^j(X)_Q and its inclusion into the rational Chow group.
- `BlochBeilinsonFiltration.gr` (data): Form F^ν/F^{ν+1} and induced actions of correspondences.
- `BlochBeilinsonFiltration.first_eq_hom` (characterisation): The first step is precisely the kernel of the fixed cycle class map.
- `BlochBeilinsonFiltration.product_mem` (relation): Intersection products add filtration indices and cycle codimensions.
- `BlochBeilinsonFiltration.correspondence_gr` (functoriality): On each associated graded, a degree-zero correspondence acts through its H-homology class; π_i acts by the stated Kronecker scalar.
- `BlochBeilinsonFiltration.strong` (characterisation): The strong predicate is F^{j+1} CH^j=0 for every X,j; it implies eventual termination.

**Discriminating tests.** These are specification checks; only the two identified Tate-line tests are executed in the suggested file.

- `BlochBeilinsonFiltration.point` (degenerate): For Spec k in codimension0, F^0=Q and F^1=0; positive codimension groups vanish.
- `BlochBeilinsonFiltration.curve` (computation): For a pointed smooth projective geometrically connected curve, F^1 CH^1_Q=Pic^0(C)_Q and the strong form gives F^2=0; π_1 acts as identity on Gr^1.
- `BlochBeilinsonFiltration.projective_space` (computation): On P^d, all F^1 CH^j_Q vanish and π_{2j} acts as identity on Gr^0 CH^j. A law with π_j instead fails in codimension1 on P^2.

**Construction or proof.**

1. Use actual rational Chow groups, their intersection products and correspondence actions.
2. Package the filtration system and its laws; the conjecture asserts such a system exists for all varieties over the fixed base.
3. The algebraicity premise for Künneth components is explicit in the graded projector law. Do not silently identify a conjectured grading with a Chow projector.

**Check.** The graded index is 2j-ν, and the strong cutoff is j+1. Morphisms preserve ν; proper pushforward shifts cycle codimension, not the filtration index.

**Direct prerequisites:** `MotivesAndAlgebraicCycles:MC.2/homological-equivalence`, [rational-kunneth-C](#rational-kunneth-C), `SchemeAndStackFoundations:SF.5`, `MotivesAndAlgebraicCycles:MC.0/correspondence-action-on-cycles`, `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`, `MotivesAndAlgebraicCycles:MC.0/numerical-equivalence`.

**Source:** [Uwe Jannsen, Motivic sheaves and filtrations on Chow groups](https://epub.uni-regensburg.de/26639/1/ubr13239_ocr.pdf), Conjecture 2.1, equation(2.1) and Lemma 2.2 pp.257–260. States the five filtration conditions, the projector index 2j-ν, and the distinction between eventual and strong termination.

<a id="murre-axioms"></a>

### Murre’s conjecture and its filtration

**Target:** `MotivesAndAlgebraicCycles:MC.7/murre-axioms`. **Kind:** definition. Conjecture predicate; rational coefficients and fixed variance.

For each irreducible smooth projective d-fold X/k and a fixed Weil cohomology, Murre data consist of rational Chow correspondences π_0,…,π_{2d} lifting the cohomological projectors, with π_iπ_j=0 for i≠j, π_i²=π_i and sum π_i=Δ_X in CH^d(X×X)_Q. Require π_{2j+1},…,π_{2d} to kill CH^j_Q; put F^ν CH^j_Q=intersection_{r=0}^{ν-1} ker(π_{2j-r}) with π_i=0 for indices outside [0,2d]; require independence from the chosen projectors and F^1=CH^j_hom,Q. The strong form additionally makes π_0,…,π_{j-1} act as zero. The conjecture is existence of these data and laws for every X, with the corresponding choice-independent system.

**Uses defining the API.**

- Jannsen Theorem 5.2 pp.288–289: Translate the projector formulation to the global filtration system.
- Jannsen Proposition 5.8 pp.295–297: Products and functoriality require the conjecture on the varieties/products occurring in correspondence actions.

**API.**

- `MurreData.projector` (projection): Return π_i in CH^d(X×X)_Q with zero outside the allowed range.
- `MurreData.projector_action` (relation): The projectors are mutually orthogonal and sum to the diagonal both as Chow correspondences and on each Chow group.
- `MurreData.filtration` (data): The ν-step is the displayed intersection of kernels, and the empty intersection gives F^0.
- `MurreData.filtration_independent` (compatibility): Any two sets satisfying the full Murre conditions give equal filtration subspaces, not equal projectors.
- `MurreData.first_eq_hom` (characterisation): F^1 is exactly the kernel of the chosen realization.
- `MurreData.strong_vanishing` (relation): The added low-index vanishing forces the strong j+1 cutoff; it is stronger than the ordinary high-index vanishing.

**Discriminating tests.** These are specification checks; only the two identified Tate-line tests are executed in the suggested file.

- `MurreData.projective_space` (computation): For P^d, π_{2j}=h_1^{d-j}h_2^j in the chosen action convention, odd projectors vanish, and F^1 CH^j_Q=0.
- `MurreData.pointed_curve` (computation): For C with base point o, use π_0=[o×C], π_2=[C×o] and π_1=Δ-π_0-π_2 in the cohomological action convention; F^1 CH^1_Q is Pic^0_Q.
- `MurreData.noncanonical_projectors` (non-example): Independence is a statement about the filtration: it does not equate every possible Chow–Künneth decomposition or turn a cohomological lift into a canonical Chow idempotent.

**Construction or proof.**

1. Use the Chow correspondence ring and its action, with the same variance as MC.0/MC.1.
2. Form the finite kernel intersections. Existence, independence and the first-step identity are separate fields of the predicate; none follows just by writing the formula.

**Check.** Cohomological idempotents alone are insufficient: orthogonality and sum are identities in the rational Chow ring.

**Direct prerequisites:** [bloch-beilinson-axioms](#bloch-beilinson-axioms), [rational-kunneth-C](#rational-kunneth-C), `MotivesAndAlgebraicCycles:MC.0/correspondence-action-on-cycles`, `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`, `MotivesAndAlgebraicCycles:MC.0/numerical-equivalence`, `MotivesAndAlgebraicCycles:MC.1/chow-group-of-motive`, `MotivesAndAlgebraicCycles:MC.1/motives-mod-adequate-relation`.

**Source:** [Uwe Jannsen, Motivic sheaves and filtrations on Chow groups](https://epub.uni-regensburg.de/26639/1/ubr13239_ocr.pdf), Conjecture 5.1 and strong form, p.288. Distinguishes lifting in Chow from cohomological projectors, the two vanishing ranges and independence of the filtration.

<a id="murre-bloch-beilinson-equivalence"></a>

### Global Murre and Bloch–Beilinson equivalence

**Target:** `MotivesAndAlgebraicCycles:MC.7/murre-bloch-beilinson-equivalence`. **Kind:** theorem. Proved equivalence of conjectural existence predicates.

For a fixed base field k and fixed Weil realization, Jannsen’s version-1 Bloch–Beilinson conjecture for all smooth projective varieties is equivalent to Murre’s conjecture for all such varieties. The resulting filtrations coincide. The same equivalence holds for the strong forms. This is a theorem comparing global conjectures; it does not derive all functoriality from an isolated decomposition of one X.

**Construction or proof.**

1. A finite multiplicative filtration makes the homologically trivial correspondence ideal nilpotent; use the idempotent-lifting argument of Propositions5.3–5.4.
2. Lift the cohomological projectors, and identify their kernel filtration by Proposition 5.5.
3. In the other direction use the Murre conditions on products to control graph correspondences, intersection and the graded projector actions as in Proposition 5.8.

**Check.** Global quantifiers and products remain in the statement. The proposition comparing formulations does not assert existence of either filtration.

**Direct prerequisites:** [bloch-beilinson-axioms](#bloch-beilinson-axioms), [murre-axioms](#murre-axioms), `MotivesAndAlgebraicCycles:MC.0/correspondence-action-on-cycles`, `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`, `MotivesAndAlgebraicCycles:MC.0/numerical-equivalence`, `MotivesAndAlgebraicCycles:MC.1/chow-group-of-motive`, `MotivesAndAlgebraicCycles:MC.1/motives-mod-adequate-relation`.

**Source:** [Uwe Jannsen, Motivic sheaves and filtrations on Chow groups](https://epub.uni-regensburg.de/26639/1/ubr13239_ocr.pdf), Theorem 5.2 p.288 and proof via Propositions5.3–5.8 pp.289–297. Gives both directions, equality of filtrations and the strong-form variant.

<a id="motivic-t-structure-predicate"></a>

### Motivic t-structure relative to a realization

**Target:** `MotivesAndAlgebraicCycles:MC.7/motivic-t-structure-predicate`. **Kind:** definition. Conjecture predicate on an existing abstract t-structure.

Let k be a perfect field admitting resolution of singularities (in particular a characteristic-zero field) and DM_gm(k,Q) the rational idempotent-complete triangulated rigid tensor category supplied by MC.4. Fix a tensor triangulated Betti realization to D^b(Vec_Q) when k embeds in C, or geometric l-adic realization to D^b(Vec_Q_l), l≠char(k). A motivic t-structure μ is a Mathlib t-structure on this category whose cohomology is conservative (nondegenerate in Beilinson’s stated sense), whose unit belongs to the heart and whose tensor product satisfies μ^{≤a}⊗μ^{≤b}⊂μ^{≤a+b} and μ^{≥a}⊗μ^{≥b}⊂μ^{≥a+b} for all integers a,b, and for which the chosen realization is t-exact. Tensoring with a heart object is therefore t-exact; arbitrary shifted objects do not define t-exact tensor functors. Its heart is exactly μ^{≤0}∩μ^{≥0}. The conjecture asserts existence. Boundedness, uniqueness and Tannakian properties are consequences under this premise, not fields asserting that an arbitrary triangulated category is already abelian.

**Uses defining the API.**

- Beilinson §1.3 pp.1–2: Derive faithfulness, boundedness, uniqueness and t-exactness of twists.
- Beilinson §1.4 pp.2–3: Lift hard Lefschetz from realization to the heart and construct algebraic projectors.

**API.**

- `MotivicTStructure.underlying` (projection): Forget to Mathlib’s TStructure on the actual DM category.
- `MotivicTStructure.heart` (compatibility): The heart is the library full subcategory cut out by the intersection of its nonpositive and nonnegative parts.
- `MotivicTStructure.realization_exact` (projection): The fixed realization sends μ-truncation degrees to the standard derived degrees.
- `MotivicTStructure.tensor_exact` (relation): The unit is in the heart and the displayed joint tensor bounds hold for every a,b; tensoring with a heart object preserves both halves.
- `MotivicTStructure.cohomology_conservative` (characterisation): A morphism inducing isomorphisms on all μ-cohomology objects is an isomorphism; in particular an object with all μH zero is zero.

**Discriminating tests.** These are specification checks; only the two identified Tate-line tests are executed in the suggested file.

- `MotivicTStructure.tate_degree` (compatibility): Under a motivic t-structure Q(1) belongs to the heart, so a Tate twist does not add a cohomological shift. Q(1)[2] is a separate shifted object.
- `MotivicTStructure.projective_line` (computation): M(P^1)=Q⊕Q(1)[2] has μ-cohomology in degrees0 and -2 in this homological convention.
- `MotivicTStructure.no_zero_realization` (non-example): A candidate with a nonzero object whose realization vanishes cannot satisfy the derived conservative realization consequence; realization exactness alone is insufficient.

**Construction or proof.**

1. Instantiate the existing abstract t-structure only after MC.4 supplies the geometric category and MC.2 supplies the actual realization.
2. The motivic refinement is a predicate on that existing t-structure; use the library heart instead of defining a second general heart.

**Check.** For projective d-fold X, the paper’s r(M(X)) is homology in cohomological degrees [-2d,0]. The definition supplies no unconditional t-structure on DM. The current MC.4 domain is perfect fields admitting resolution; a general positive-characteristic extension requires the explicit R-MC4 contract.

**Direct prerequisites:** `mathlib:CategoryTheory.Triangulated.TStructure`, `mathlib:CategoryTheory.Triangulated.TStructure.heart`, `MotivesAndAlgebraicCycles:MC.4`, `MotivesAndAlgebraicCycles:MC.2`.

**Source:** [Alexander Beilinson, Remarks on Grothendieck’s standard conjectures](https://arxiv.org/pdf/1006.1116v2), §§1.1–1.2 p.1, definition and conjecture. Specifies the rational geometric category, homological convention and tensor/realization exactness, with nondegeneracy as conservativity of cohomology.

<a id="motivic-t-structure-consequences"></a>

### Conditional heart, uniqueness and standard conjectures

**Target:** `MotivesAndAlgebraicCycles:MC.7/motivic-t-structure-consequences`. **Kind:** theorem. Conditional theorem.

Assuming a motivic t-structure relative to r, its heart is a Tannakian Q-category; r restricted to the heart is an exact faithful tensor fiber functor over the realization coefficient field, each heart object has finite length, r is conservative, μ is bounded and unique for r, and Tate twists are t-exact. For every smooth projective X the motivic hard-Lefschetz maps are isomorphisms, M(X) splits as the sum of μH^a(M(X))[-a] (a generally noncanonical decomposition), and B and C follow. In characteristic zero the realization choice agrees under comparison, all standard conjectures follow and the pure heart objects μH^a(M(X)) are semisimple. This does not prove that the whole mixed heart is semisimple or that its fiber functor is Q-valued when r is l-adic.

**Construction or proof.**

1. Apply the Tannakian fiber-functor criterion to the heart; its exact tensor realization and rigidity give faithfulness.
2. Faithfulness and nondegeneracy detect truncation degrees and give conservativity, boundedness and uniqueness.
3. Lift hard Lefschetz by conservativity; split via the Lefschetz decomposition argument; translate inverse maps and projections through MC.4’s Chow-correspondence Hom identification.
4. In characteristic zero use polarization on pure Hodge substructures to split subobjects of the pure pieces.

**Check.** Every conclusion retains the motivic existence assumption. The heart’s full mixed category is not declared semisimple. No unconditional MC.3 numerical semisimplicity is used to manufacture the missing t-structure.

**Direct prerequisites:** [motivic-t-structure-predicate](#motivic-t-structure-predicate), [lefschetz-standard-B](#lefschetz-standard-B), [standard-implications](#standard-implications), `MotivesAndAlgebraicCycles:MC.4`, `MotivesAndAlgebraicCycles:MC.2`, `MotivesAndAlgebraicCycles:MC.6`, `ComplexComparisonPartII:C5`.

**Source:** [Alexander Beilinson, Remarks on Grothendieck’s standard conjectures](https://arxiv.org/pdf/1006.1116v2), §1.3 pp.1–2; Proposition and corollary in §1.4 pp.2–3; §1.5 p.3. Proves the consequences conditionally on existence; characteristic-zero positivity is used for semisimplicity of the pure pieces.

## Arithmetic cycle ranks and simultaneous realization classes

<a id="compatible-hodge-tate-classes"></a>

### Simultaneous Hodge and Tate classes

**Target:** `MotivesAndAlgebraicCycles:MC.7/compatible-hodge-tate-classes`. **Kind:** definition. Definition on an imported category.

Let k be a number field and L⊂C a coefficient number field. For an object V of the compatible-realization category M_k^L of IP §2.1, with L-vector space V_B, the source L-Hodge structure and, for every rational prime l, a continuous G_k-module V_l and comparison i_l:V_B⊗Q_l≃V_l, define HT(V)⊂V_B by: the complex comparison of c has type(0,0), and i_l(c⊗1) is G_k-fixed for every l. Use the source L-Hodge convention when L is not real; an identification with an underlying rational Hodge structure is an additional comparison. This is simultaneous Hodge and Tate invariance, not a condition on p-adic Hodge–Tate weights.

**Uses defining the API.**

- IP Definition 12.1 and the formulation of its main theorem in §12: The geometric correspondences must yield simultaneous classes in the compatible realization, not just Betti Hodge vectors.
- MC.7/hodge-conjecture-interface: Separate the weight-zero type test from the arithmetic invariance test.

**API.**

- `HodgeTateClasses.subspace` (constructor): The simultaneous conditions define an L-subspace of V_B.
- `HodgeTateClasses.mem_iff` (characterisation): Membership is equivalent to the type(0,0) test and every-prime fixed-vector test.
- `HodgeTateClasses.map` (functoriality): A morphism in M_k^L restricts to an L-linear map on HT; identities and composites are respected.
- `HodgeTateClasses.coefficient_extension` (compatibility): For L⊂L′⊂C the scalar-extension map sends HT(V)⊗_L L′ into HT(V⊗_L L′); no equality is asserted without a comparison theorem.

**Discriminating tests.** These are specification checks; only the two identified Tate-line tests are executed in the suggested file.

- `HodgeTateClasses.unit` (computation): For the compatible unit L(0) with trivial Galois actions, HT=L.
- `HodgeTateClasses.tate_nonzero` (non-example): For L(1), the Hodge type(-1,-1) prevents any nonzero HT class, even if one ignores its nontrivial cyclotomic action.
- `HodgeTateClasses.quadratic_character` (non-example): A nontrivial quadratic Artin line has type(0,0), but its nontrivial G_k action gives HT=0. Testing only Hodge type would incorrectly give the whole line.

**Construction or proof.**

1. Import the compatible realization object from MC.2. Intersect the inverse images of the invariant subspaces with the type(0,0) subspace.
2. Morphisms preserve both requirements by Hodge compatibility and equivariance at every prime.

**Check.** Every rational prime is quantified; a one-prime Tate condition is not substituted.

**Direct prerequisites:** `MotivesAndAlgebraicCycles:MC.2`, [rational-classes-of-type](#rational-classes-of-type).

**Source:** [Atsushi Ichino and Kartik Prasanna, Hodge classes and the Jacquet–Langlands correspondence](https://arxiv.org/pdf/1806.10563v2), §2.1 p.12; Definition 12.1 p.82 in arXiv v2. Supplies the compatible realization category and its all-prime class condition; the published pagination differs.

**Catalogue coverage:** `PAPER-ICHINO-PRASANNA-23/005`.

<a id="beilinson-bloch-predicates"></a>

### Beilinson–Bloch rank and equivariant multiplicity conjectures

**Target:** `MotivesAndAlgebraicCycles:MC.7/beilinson-bloch-predicates`. **Kind:** definition. Conjecture predicates, including analytic prerequisites.

For smooth projective X/E of dimension 2r−1 over a number field, r≥1, let CH^r(X)^0 be cycles homologically trivial after base change to Ebar in the fixed compatible realizations. Given the motivic L-function and its analytic order at zero, BB(X,r) asserts rank_Z CH^r(X)^0=ord_{s=0} L(s,H^{2r−1}(X_Ebar,Q_l(r))) for every l and compatible coefficient embedding. If an algebra T acts by étale correspondences and ρ is a nonzero irreducible finite-dimensional complex T-module, the equivariant predicate is dim_C Hom_T(ρ,CH^r(X)^0_C)=ord_{s=0} L(s,Hom_T(ρ,H^{2r−1}(X_Ebar,Q_l(r))_C)). The L-function’s continuation, prime-independence and finite order are analytic premises supplied separately; the finite cycle rank is part of the conjectural conclusion.

**Uses defining the API.**

- Li–Liu Conjecture 1.1 p.3: Specialize to the middle degree of a unitary Shimura tower and the appropriate cuspidal base-change factor.
- Li–Liu Theorems1.5 and1.7 pp.5–7: Measure precisely how nonvanishing of cycles falls short of the conjectural multiplicity equality.

**API.**

- `BeilinsonBloch.rank_predicate` (constructor): The unrefined predicate is the displayed rank/order equality for each compatible prime.
- `BeilinsonBloch.equivariant_predicate` (constructor): The refined predicate uses T-linear Hom multiplicities on both sides.
- `BeilinsonBloch.finite_rank` (relation): An instance and a finite analytic order imply finite rational cycle rank.
- `BeilinsonBloch.transport` (compatibility): An isomorphism of Chow and realization modules compatible with T and the L-data transports the predicate.
- `BeilinsonBloch.unit_algebra` (characterisation): For T=C and its one-dimensional trivial representation, the equivariant equality reduces to the unrefined equality after coefficient comparison.

**Discriminating tests.** These are specification checks; only the two identified Tate-line tests are executed in the suggested file.

- `BeilinsonBloch.elliptic_rank` (compatibility): For r=1 and an elliptic curve, CH^1_hom=Pic^0(E)(E); the shift gives the BSD rank equality at the usual elliptic center1.
- `BeilinsonBloch.order_zero` (degenerate): Analytic order0 predicts CH^r_hom⊗Q=0; it does not predict the integral torsion subgroup is zero.
- `BeilinsonBloch.localization_not_dimension` (non-example): A nonzero localization at a Hecke maximal ideal does not by itself give a one-dimensional Hom eigenspace, so it cannot be used as this predicate’s constructor.

**Construction or proof.**

1. Form the homologically trivial subgroup using the actual cycle map.
2. Use the analytic supplier’s L-data and order, and state the two equality predicates; do not construct an L-function from a formal symbol.
3. For dim 1 the first predicate specializes to the rank assertion in BSD, without adding its leading-term formula.

**Check.** The geometric center is s=0 after twist(r); the unitary automorphic normalization below uses s=1/2.

**Direct prerequisites:** `MotivesAndAlgebraicCycles:MC.2`, `PeriodsAndSpecialValues:PS.6`, `MotivesAndAlgebraicCycles:MC.0/correspondence-action-on-cycles`, `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`, `MotivesAndAlgebraicCycles:MC.0/numerical-equivalence`.

**Source:** [Chao Li and Yifeng Liu, Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf), Introduction pp.2–3, unreﬁned formula and equation(1.1). States the rank equality, the equivariant refinement and the middle-degree Tate twist.

**Catalogue coverage:** `PAPER-LI-LIU-21/1`.

<a id="height-positivity-predicate"></a>

### Conditional primitive height positivity

**Target:** `MotivesAndAlgebraicCycles:MC.7/height-positivity-predicate`. **Kind:** definition. Definition of a conditional predicate; primary domain/normalization gap remains.

Fix X/E smooth projective of dimension 2r−1, r≥1, an ample class η, a specified domain P of primitive homologically trivial codimension-r cycles with complex coefficients, and a well-defined Hermitian Beilinson–Bloch height h on P in a fixed normalization. The positivity predicate is: for every nonzero z∈P, (-1)^r h(z,z)>0 as a real number. The intended primitive domain is the kernel of multiplication by η in CH^r_hom,C, but verifying its exact identification and the height normalization against Beilinson1987 Conjecture 5.5 is an explicit source gap. For Li–Liu’s theta classes use only their specified height domain; their Remark 1.10 additionally invokes injectivity of the étale Abel–Jacobi map to obtain primitivity. This predicate does not assert that a height on all homologically trivial cycles has already been constructed.

**Uses defining the API.**

- Li–Liu Remark 1.10 p.8: Interpret the signed theta height once primitivity is established.
- Li–Liu Theorem 1.7(1): Use the archimedean sign of C_r and positive denominator only with all local factors and normalization fixed.

**API.**

- `HeightPositivity.predicate` (constructor): The signed self-pairing is positive on every nonzero vector of the supplied domain.
- `HeightPositivity.zero_iff` (characterisation): Under positivity, h(z,z)=0 if and only if z=0.
- `HeightPositivity.scalar` (relation): For a≠0 the signed self-height of az is |a|² times that of z.
- `HeightPositivity.isometry` (compatibility): A complex-linear isomorphism preserving the primitive domain and normalized height transports positivity.

**Discriminating tests.** These are specification checks; only the two identified Tate-line tests are executed in the suggested file.

- `HeightPositivity.zero` (degenerate): The zero vector has height0 and is excluded from the strict inequality.
- `HeightPositivity.curve_sign` (compatibility): For r=1 the source convention predicts a negative height h on nonzero primitive divisors before multiplication by -1; replacing it with the positive Néron–Tate convention requires a sign comparison.
- `HeightPositivity.nonprimitive` (non-example): Positivity on P provides no value or positivity assertion for a vector outside the supplied primitive height domain.

**Construction or proof.**

1. Define positivity only after a supplier provides a genuine Hermitian height with a named domain and normalization.
2. Keep the expected primary identification separate; no inference from an unsigned arithmetic intersection number is allowed.

**Check.** The inequality is strict only for nonzero primitive vectors. The primary height reference was not obtained; the gap remains visible.

**Direct prerequisites:** [beilinson-bloch-predicates](#beilinson-bloch-predicates), `MotivesAndAlgebraicCycles:MC.2`.

**Source:** [Chao Li and Yifeng Liu, Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf), Remark 1.10 p.8; Theorem 1.7 and its footnote4 pp.6–7. Records the signed positivity expectation, the primitivity qualification and the restricted height-valued formula.

<a id="unitary-bb-specialization"></a>

### Unitary Shimura specialization of Beilinson–Bloch

**Target:** `MotivesAndAlgebraicCycles:MC.7/unitary-bb-specialization`. **Kind:** application. Source conjecture and conditional specialization.

Let E/F be CM, n=2r>0, and let V/E have signature(n−1,1) at the chosen real place and(n,0) at every other real place. Put H=U(V) and use its smooth projective Shimura tower X_L/E at neat levels; in the general F=Q formulation replace by the canonical smooth toroidal compactification as the source instructs. For tempered cuspidal π of U(r,r)(A_F), and an irreducible admissible π̃∞ of H(A_F^∞) nearly equivalent to π at the identified good finite places and occurring in colim H^{n−1}_dR(X_L/C), Conjecture 1.1 predicts dim_C Hom_H(π̃∞,colim CH^r(X_L)^0_C)=ord_{s=1/2} L(s,Π_j(π̃∞)). Here Π_j is the particular cuspidal factor of BC(π) determined by the cohomological occurrence, not automatically the entire base change. The shift from the equivariant BB formula is 1/2.

**Construction or proof.**

1. At a level with π̃∞ invariants, take its Hecke algebra and invariant representation in the equivariant predicate.
2. Import the cohomological local-global comparison identifying the L-function with the named cuspidal factor and center shift; pass to the tower compatibly.

**Check.** A source conjecture specialization, not an unconditional theorem. The toroidal qualification is needed in the general conjecture, even though the theorem below assumes [F:Q] even.

**Direct prerequisites:** [beilinson-bloch-predicates](#beilinson-bloch-predicates), `MotivesAndAlgebraicCycles:MC.2`, `PeriodsAndSpecialValues:PS.6`, `MotivesAndAlgebraicCycles:MC.0/correspondence-action-on-cycles`, `MotivesAndAlgebraicCycles:MC.0/correspondence-composition`, `MotivesAndAlgebraicCycles:MC.0/numerical-equivalence`.

**Source:** [Chao Li and Yifeng Liu, Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf), Conjecture 1.1 p.3 and footnote2; comparison with(1.1) pp.3–4. Gives the tower, cohomological occurrence, near-equivalence and cuspidal-factor conditions.

<a id="li-liu-hypothesis-contract"></a>

### Exact hypotheses for the Li–Liu cycle cases

**Target:** `MotivesAndAlgebraicCycles:MC.7/li-liu-hypothesis-contract`. **Kind:** comparison. Hypothesis contract, with supplier gaps recorded.

For the two theorems below impose Assumption 1.3: E/F is CM, unramified at all finite places, all 2-adic places of F split in E (these conditions imply [F:Q] is even), n=2r; π is cuspidal on U(r,r)(A_F); each archimedean π_v is the holomorphic discrete series with Harish–Chandra parameters {(1−n)/2,(3−n)/2,…,(n−1)/2}; each split finite π_v is principal series; each inert finite π_v is unramified or almost unramified relative to K_{r,v}, and an almost-unramified v is unramified over Q; all finite π_v are tempered. Define R_π as ramified split places and S_π as almost-unramified inert places, and assume |S_π| odd. The associated incoherent totally positive V_π determines the coherent V of the preceding signature with the same finite local spaces; H=U(V). Hypothesis 6.6 is the all-prime local-global identity: for every l and coefficient embedding, the semisimplified G_E-representation Hom_H(π̃∞,colim H^{2r−1}_ét(X_L/Ebar,Q_lbar)) is the specified ρ^c_{Π_j(π̃∞)} for each π̃∞ matching the good unramified constituents in Lemma 3.15(b). Hypothesis 4.5, when separately invoked, says that for every neat L, L-invariant Schwartz φ and every complex-linear functional λ on CH^r(X_L)_C, λ(Z_φ(g)_L) converges absolutely and is an automorphic form in A^[r]. Formal modularity of a q-series is insufficient.

**Construction or proof.**

1. Import almost-unramified representation theory, canonical models and compatible cohomology from their owners through the supplier contract.
2. Use odd |S_π| and even [F:Q] to obtain root number -1; choose the coherent neighbor with one negative archimedean signature.

**Check.** Hypothesis 4.5 is not a premise of Theorem 1.5; it is a premise of Theorem 1.7. All-prime cohomological identities retain semisimplification and the complex-conjugate Galois representation.

**Direct prerequisites:** [unitary-bb-specialization](#unitary-bb-specialization), `MotivesAndAlgebraicCycles:MC.2`, `PeriodsAndSpecialValues:PS.6`.

**Source:** [Chao Li and Yifeng Liu, Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf), Assumption 1.3 pp.4–5; Hypothesis 4.5 p.24; Hypothesis 6.6 p.30. Spells out the theorem’s separate representation-theoretic, cohomological and modularity hypotheses.

<a id="li-liu-localized-nonvanishing"></a>

### Nonzero localized Chow group from a central derivative

**Target:** `MotivesAndAlgebraicCycles:MC.7/li-liu-localized-nonvanishing`. **Kind:** theorem. Conditional proved case, exact theorem statement; deep input proofs remain supplier gaps.

Assume also the corrected almost-self-dual local index identity specified in G-AIP, whose later repair has not been verified in this pass. Under the Li–Liu hypothesis contract including Hypothesis 6.6, suppose L′(1/2,π)≠0. For a finite set R of finite places with R_π⊆R and |R\V_F^spl|>2, fix the outside-R special maximal level L^R, Hecke character χ_π^R and maximal ideal m_π^R=kerχ_π^R over Qac. Then colim_{L_R}(CH^r(X_{L_R L^R})^0_Qac)_{m_π^R}≠0. The same nonvanishing is witnessed by the subgroup generated by the specified special cycles. This is localization at m, not an assertion about a nonzero m-eigenspace or its dimension, and does not use Hypothesis 4.5.

**Additional hypotheses.** Corrected local index identity, or its cited auxiliary conjectural premise until a verified replacement is supplied (PAPER-LI-LIU-21/E3).

**Construction or proof.**

1. Assuming the localization vanishes, choose Hecke annihilators with nonzero χ_π^R value for the finite cycle data entering the height calculation.
2. Use the local index identities and the cohomological comparison to make the relevant height coefficients vanish.
3. Lemma 11.1 and the doubling identity, with a choice of nonzero local zeta factors, contradict L′(1/2,π)≠0. The local intersection and automorphic identities are supplier inputs, not reconstructed here.

**Check.** Do not replace localization by the kernel of m or assert the full BB rank equality. Retain R_π⊆R and at least two split places in R; the PDF text extraction corrupts both the intersection and inequality.

**Direct prerequisites:** [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [beilinson-bloch-predicates](#beilinson-bloch-predicates), `MotivesAndAlgebraicCycles:MC.2`, `PeriodsAndSpecialValues:PS.6`.

**Source:** [Chao Li and Yifeng Liu, Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf), Theorem 1.5 pp.5–6, Remark 1.6(2)–(4); proof §11 pp.51–52. Establishes localized nonvanishing without modularity, with the requirement of at least two split places in R.

<a id="li-liu-arithmetic-inner-product"></a>

### Arithmetic theta height and a nonzero isotypic cycle

**Target:** `MotivesAndAlgebraicCycles:MC.7/li-liu-arithmetic-inner-product`. **Kind:** theorem. Conditional proved formula and isotypic nonvanishing; supplier inputs explicit.

Assume also the corrected almost-self-dual local index identity specified in G-AIP, whose later repair has not been verified in this pass. Under the same contract, now also assume Hypothesis 4.5. For pure tensor cusp vectors ϕ_1,ϕ_2 of lowest weight at infinity with ⟨ϕ_1v^c,ϕ_2v⟩=1 there, and finite pure tensor Schwartz functions φ_1,φ_2, the arithmetic theta lifts satisfy ⟨Θ_{φ_1}(ϕ_1),Θ_{φ_2}(ϕ_2)⟩^natural = [L′(1/2,π)/b_{2r}(0)] C_r^[F:Q] ∏_{v finite} Z_v^natural(ϕ_1v^c,ϕ_2v,φ_1v⊗φ_2v^c), where C_r=(-1)^r 2^{-2r} π^{r²} [∏_{j=1}^r Γ(j)]/[∏_{j=r+1}^{2r} Γ(j)], b_{2r}(0)>0 is the source Gross-motive factor, and almost all normalized local factors are1. The normalized height initially takes values in C⊗Q_l on the source domain; this identity places it in C and makes it independent of l. If the derivative is nonzero, for π̃∞ the finite theta lift of π∞ one has Hom_H(π̃∞,colim CH^r(X_L)^0_C)≠0. Neither conclusion asserts that this Hom space has dimension 1.

**Additional hypotheses.** Corrected local index identity, or its cited auxiliary conjectural premise until a verified replacement is supplied (PAPER-LI-LIU-21/E3).

**Construction or proof.**

1. Hypothesis 4.5 defines the Chow-valued arithmetic theta lift. Apply the arithmetic Siegel–Weil and local index identities to its Fourier coefficients.
2. Factor the doubling integral and evaluate its archimedean factors with the chosen lowest-weight normalization; the finite unramified factors are1.
3. For the nonvanishing statement choose local data with nonzero product. A zero theta Hom would force the height pairing to vanish, contrary to the derivative and local factors.

**Check.** The product includes the conjugations in the displayed order and the denominator b_{2r}(0). The height formula alone is not the unrestricted primitive positivity conjecture.

**Direct prerequisites:** [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [height-positivity-predicate](#height-positivity-predicate), `MotivesAndAlgebraicCycles:MC.2`, `PeriodsAndSpecialValues:PS.6`.

**Source:** [Chao Li and Yifeng Liu, Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf), Theorem 1.7 and footnote4 pp.6–7; proof §11 pp.52–53. States the normalization, separate modularity assumption, exact product and stronger isotypic nonvanishing.

## Integral real algebraicity, detectors and descent

<a id="integral-hodge-predicate"></a>

### Integral Hodge classes and their defect

**Target:** `MotivesAndAlgebraicCycles:MC.7/integral-hodge-predicate`. **Kind:** definition. Definition; general algebraicity is a conjecture.

For X/C smooth proper of pure dimension d and k≥0, Hdg^{2k}(X,Z(k)) is the inverse image of H^{k,k} under H^{2k}(X(C),Z(k))→H^{2k}(X(C),C), with the twist lattice normalization fixed. Integral HC(X,k) means surjectivity of CH^k(X)→Hdg^{2k}(X,Z(k)); its defect is the cokernel. All torsion cohomology classes lie in this Hodge subgroup, so rational surjectivity does not imply integral surjectivity.

**Uses defining the API.**

- BW §2.2 and Theorem 3.22: Impose the geometric Hodge condition on equivariant integral classes and use complex integral algebraicity in descent.
- CTV Corollary 3.12: Identify the integral 1-cycle defect with an unramified cohomology group.

**API.**

- `IntegralHodgeClasses.subgroup` (constructor): The subgroup is the displayed inverse image, containing the cohomological torsion.
- `IntegralHodgeConjecture.iff_defect_zero` (characterisation): Integral HC holds exactly when its cokernel is zero.
- `IntegralHodgeClasses.rationalize` (compatibility): With the geometric comparison, rationalization gives the rational Hodge subspace.
- `IntegralHodgeClasses.cycle_mem` (relation): Every codimension-k algebraic cycle has class in the subgroup.

**Discriminating tests.** These are specification checks; only the two identified Tate-line tests are executed in the suggested file.

- `IntegralHodge.point` (degenerate): On Spec C in degree 0 the target and cycle group are Z and the defect is zero.
- `IntegralHodge.torsion` (characterisation): A torsion integral cohomology class belongs to Hdg even though its complex image is zero; deleting it changes the conjecture.
- `IntegralHodge.divisor` (compatibility): In codimension1 Lefschetz(1,1) gives defect0, with integral coefficients rather than only Q.

**Construction or proof.**

1. Take the inverse image subgroup and the cokernel of the cycle map whose image is Hodge.
2. Compare after tensoring with Q using the fixed integral/rational comparison, retaining the torsion kernel.

**Check.** The target is the inverse image, not merely the torsion-free quotient.

**Direct prerequisites:** [hodge-conjecture-interface](#hodge-conjecture-interface), `MotivesAndAlgebraicCycles:MC.2`, `ComplexComparisonPartII:C5`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), §2.1 pp.35–36. Defines the integral subgroup and states the stronger integral algebraicity condition.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/integral-hodge`.

<a id="real-integral-hodge-predicate"></a>

### Real integral Hodge classes

**Target:** `MotivesAndAlgebraicCycles:MC.7/real-integral-hodge-predicate`. **Kind:** definition. Conjecture predicate over the real numbers.

For X over the real numbers smooth proper, use the MC.2 equivariant integral cohomology H_G^{2k}(X(C),Z(k)), its forgetful map to ordinary cohomology, and the admissible subgroup A_G^{2k}. Concretely, if α_p are the components of restriction to X(R) in the canonical mod-2 decomposition, A_G^{2k} consists of α with α_{k+i}=Sq^i(α_k) for every even integer i, taking negative squares and out-of-range components to be zero. Put Hdg_G^{2k}{}_0=A_G^{2k}∩forget^{-1}(Hdg^{2k}). Real IHC(X,k) asserts CH^k(X)→Hdg_G^{2k}{}_0 is onto; its defect is this cokernel. The equivariant theory, Steenrod operations, component decomposition and cycle-class factorization are supplier interfaces, not newly planned topology.

**Uses defining the API.**

- BW Lemma 2.14 and Proposition 2.13: Transport the correct target under blowups and birational maps.
- BW Theorems3.16 and3.22: Compare cycle surjectivity with the topological and Picard descent detectors.

**API.**

- `RealIntegralHodgeClasses.subgroup` (constructor): The target is the intersection just specified.
- `RealIntegralHodgeClasses.mem_iff` (characterisation): Membership is equivalent to all admissibility equations plus the geometric Hodge test.
- `RealIntegralHodgeConjecture.defect` (data): The cokernel of the factored integral cycle map measures failure of surjectivity.
- `RealIntegralHodgeClasses.operations` (functoriality): Pullback, cup product and proper pushforward preserve the target in the corresponding shifted degrees.
- `RealIntegralHodgeClasses.real_component` (compatibility): The component α_k of a cycle class equals its Borel–Haefliger class.

**Discriminating tests.** These are specification checks; only the two identified Tate-line tests are executed in the suggested file.

- `RealIntegralHodge.divisor_target` (computation): For k=1 admissibility imposes no extra restriction, so the target is the full equivariant Hodge subgroup.
- `RealIntegralHodge.top_degree` (compatibility): For zero-cycles the topological constraints retain exactly the real-point and norm-of-complex-point generators.
- `RealIntegralHodge.constant_nonempty` (non-example): For positive even k and X(R) nonempty, the constant torsion class ω^{2k} is Hodge but fails admissibility; omitting the admissible intersection incorrectly includes it.

**Construction or proof.**

1. Intersect the supplied admissible subgroup with the inverse image of integral Hodge classes. The cycle inclusion uses MC.2’s equivariant cycle-class theorem.
2. Use pullback, product and proper pushforward compatibility of both conditions with codimension shifts.

**Check.** For k=d−1, admissibility says α_p=0 for p<d−1. Smooth proper need not be projective in this definition.

**Direct prerequisites:** [integral-hodge-predicate](#integral-hodge-predicate), `MotivesAndAlgebraicCycles:MC.2`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Definition 1.19 and(1.58) pp.31–32; Definition 2.2 and(2.1) pp.36–37. Combines topological admissibility and the integral Hodge condition.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/real-hodge`.

<a id="realclosed-integral-hodge-predicate"></a>

### Integral cycle surjectivity over a real closed field

**Target:** `MotivesAndAlgebraicCycles:MC.7/realclosed-integral-hodge-predicate`. **Kind:** definition. Definition with an explicit vanishing hypothesis.

For an arbitrary real closed R, X/R smooth proper and k≥0, assume H^q(X,Ω_X^p)=0 for every p+q=2k with(p,q)≠(k,k). Define the real-closed integral Hodge property as surjectivity CH^k(X)→A_G^{2k}(X(C),Z(k)), where A_G is the same semialgebraic admissible subgroup. No analytic Hodge decomposition over R is introduced. Over the real numbers these vanishings identify the target with Hdg_G{}_0, so the two predicates agree.

**Uses defining the API.**

- BW Propositions2.9–2.10: State divisor and zero-cycle cases without pretending general R has analytic Hodge theory.
- BW Theorems3.16 and5.4: Use H²(O)=0 when the source requires a general-real-closed substitute for its Hodge argument.

**API.**

- `RealClosedIntegralHodge.predicate` (constructor): The predicate is integral cycle surjectivity to the admissible subgroup under the displayed vanishing hypothesis.
- `RealClosedIntegralHodge.real_compare` (compatibility): Over the real numbers it agrees with RealIntegralHodgeConjecture in the vanishing range.
- `RealClosedIntegralHodge.defect_zero` (characterisation): Surjectivity is equivalent to vanishing of the corresponding cokernel.
- `RealClosedIntegralHodge.transport` (functoriality): An R-isomorphism transports the cycle map and target and hence the predicate.

**Discriminating tests.** These are specification checks; only the two identified Tate-line tests are executed in the suggested file.

- `RealClosedIntegralHodge.zero_cycles` (compatibility): For k=d all off-diagonal Hodge groups in total degree 2d vanish for dimension reasons.
- `RealClosedIntegralHodge.divisors` (compatibility): For k=1, H²(O)=0 and its conjugate H⁰(Ω²)=0 provide the needed vanishing range in characteristic0.
- `RealClosedIntegralHodge.no_analytic_transfer` (non-example): For a non-Archimedean real closed R with nonzero off-diagonal groups, the displayed predicate is not licensed as an analytic Hodge conjecture or obtained by choosing an embedding R→R.

**Construction or proof.**

1. Use equivariant semialgebraic cohomology from the supplier, and state surjectivity only under the displayed vanishings.
2. Over the real numbers use Hodge decomposition and the vanishings to prove that every admissible class satisfies the Hodge test.

**Check.** Spreading out a cohomological identity does not by itself transport cycle surjectivity to every real closed extension.

**Direct prerequisites:** [real-integral-hodge-predicate](#real-integral-hodge-predicate), `MotivesAndAlgebraicCycles:MC.2`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Definition 2.3 and preceding paragraph p.37. Allows the cohomological formulation over arbitrary real closed fields under the stated Hodge-cohomology vanishing.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/realclosed-hodge`.

<a id="real-rational-descent-and-constants"></a>

### Rational norm descent and constant torsion classes

**Target:** `MotivesAndAlgebraicCycles:MC.7/real-rational-descent-and-constants`. **Kind:** theorem. Proved comparison and elementary constant-class criterion.

If X is smooth proper over the real numbers and XC satisfies rational HC in codimension k, the real integral cycle map becomes onto Hdg_G^{2k}{}_0⊗Q after tensoring with Q: lift the forgotten class on XC and apply norm, dividing by2. For any real closed R, positive even k and smooth proper X/R, the constant class ω^{2k}, viewed in twist(k) by parity, belongs to A_G^{2k} if and only if X(R)=∅. Over the real numbers it is Hodge because it is torsion. Thus real integral HC in this range implies its algebraicity when X(R)=∅. The k=0 unit is excluded from the emptiness criterion.

**Construction or proof.**

1. Use restriction followed by norm equal to2; rational equivariant cohomology identifies with the invariant part of ordinary cohomology.
2. For constants, restrict to a real point and inspect the forbidden degree-zero component; when there are no real points the admissibility equations are empty.

**Check.** Only the forward rational descent implication is claimed here. The positive-degree and even-codimension restrictions are explicit.

**Direct prerequisites:** [real-integral-hodge-predicate](#real-integral-hodge-predicate), [realclosed-integral-hodge-predicate](#realclosed-integral-hodge-predicate), `MotivesAndAlgebraicCycles:MC.2`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Remark 2.4(ii) and following constant-class discussion pp.37–38. Uses rational norm descent and the real-locus restriction of a positive-degree constant class.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/rational-real-hc`, `PAPER-BENOIST-WITTENBERG-20/constant-omega`.

<a id="lefschetz-one-one-cases"></a>

### Complex and real integral divisor algebraicity

**Target:** `MotivesAndAlgebraicCycles:MC.7/lefschetz-one-one-cases`. **Kind:** theorem. Proved cases conditional only on the explicitly requested comparison theorems.

For a smooth proper complex variety, CH^1=Pic maps onto integral Hodge classes in H²(Z(1)). For a smooth proper variety over the real numbers, Pic maps onto the equivariant Hodge subgroup Hdg_G²(Z(1))=Hdg_G²(Z(1))_0. For arbitrary real closed R, if X is smooth proper and H²(X,O_X)=0, then Pic(X)→H_G²(X(C),Z(1)) is onto. The last assertion uses MC.2’s torsion-free divisor cokernel and Kummer comparison, and is distinct from invoking an analytic decomposition over R.

**Construction or proof.**

1. Complex: use the analytic exponential exact sequence and GAGA to identify the integral F¹ kernel with line-bundle classes.
2. Real: apply its G-equivariant version and the analytic/algebraic line-bundle comparison.
3. General R: Kummer gives a torsion-free cokernel; H²(O)=0 kills the rational geometric Brauer Tate module, and norm kills the remaining rational obstruction. Finite generation then gives zero cokernel.

**Check.** All three cases retain integral coefficients. The real-closed case retains H²(O)=0.

**Direct prerequisites:** [integral-hodge-predicate](#integral-hodge-predicate), [real-integral-hodge-predicate](#real-integral-hodge-predicate), [realclosed-integral-hodge-predicate](#realclosed-integral-hodge-predicate), `MotivesAndAlgebraicCycles:MC.2`, `ComplexComparisonPartII:C5`, `SchemeAndStackFoundations:SF.3`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Propositions2.8–2.9 pp.39–40. Real divisor algebraicity and its real-closed replacement.

**Source:** [Pierre Deligne, The Hodge Conjecture](https://www.claymath.org/wp-content/uploads/2022/06/hodge.pdf), §4 pp.4–5. Complex integral divisor theorem via the exponential sequence.

**Source:** [Olivier Benoist, The period-index problem for real surfaces](https://www.math.ens.psl.eu/~benoist/articles/realperiodindex.pdf), Proofs of Proposition 1.2, end of §1, and Proposition 6.6, §6.2. Two routed applications use these complex and real divisor theorems; no new divisor theory is required.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/divisor-real-lefschetz`, `PAPER-BENOIST-WITTENBERG-20/divisor-surjective`, `PAPER-BENOIST-19/90`, `PAPER-BENOIST-19/135`.

<a id="zero-cycle-and-projective-space-cases"></a>

### Zero-cycles and projective spaces over real closed fields

**Target:** `MotivesAndAlgebraicCycles:MC.7/zero-cycle-and-projective-space-cases`. **Kind:** theorem. Proved elementary families.

For every smooth proper pure d-dimensional X/R over a real closed field, the integral cycle map in codimension d is onto the admissible target. It is generated by classes of one real point on each semialgebraic connected component of X(R), together with norms of complex points on the components of X(C). For P^d_R the real-closed integral Hodge property holds in every codimension0≤k≤d; the powers of its hyperplane class generate the required target. Codimension0 and k>d have the usual unit and zero-target conventions.

**Construction or proof.**

1. Apply the supplier’s top-degree equivariant cohomology calculation component by component. Real points lift the real components and norm classes account for the remaining degree lattice.
2. For projective space use the diagonal decomposition over C and the equivariant product/pushforward laws to reduce every target class to a hyperplane power.

**Check.** The projective diagonal calculation uses P^k(C) in the relevant complex cohomology factor.

**Direct prerequisites:** [realclosed-integral-hodge-predicate](#realclosed-integral-hodge-predicate), `MotivesAndAlgebraicCycles:MC.2`, `SchemeAndStackFoundations:SF.2`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Proposition 2.10 pp.40–41; Proposition 2.15 pp.44–45. Gives real-point/norm generators and the diagonal argument for projective space.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/zero-cycles`, `PAPER-BENOIST-WITTENBERG-20/projective-space`.

<a id="real-blowup-and-birational-invariance"></a>

### Blowup decomposition and birational invariance of real defects

**Target:** `MotivesAndAlgebraicCycles:MC.7/real-blowup-and-birational-invariance`. **Kind:** theorem. Proved comparison, with weak factorization requested.

Let π:X̃→X be the blowup of smooth proper X/R along a smooth center Y of codimension r, τ:E→Y the exceptional projective bundle, ι:E→X̃, and ξ=c₁(O_E(1)). In codimension k the map (α,(β_i))↦π*α+∑_{i=k−r+1}^{k−1}ι*(ξ^{k−i−1}τ*β_i) identifies the admissible groups, and over the real numbers their Hodge subgroups, with the corresponding direct sum for X and Y; groups outside the geometric range are zero. Consequently over the real numbers the integral Hodge defect in codimension2 and in codimension d−1 is a birational invariant of smooth proper d-folds. Over any real closed R, the cokernel of CH₁(X)→A_G^{2d−2} is birationally invariant. The latter assertion is a topological-target assertion and does not invent Hodge theory over R.

**Construction or proof.**

1. Apply the blowup formulas in Chow and cohomology. In extracting the exceptional remainder use δ=-ι*(γ-π*α); the sign comes from the normal bundle O_E(-1).
2. Admissibility and Hodge compatibility follow from pullback, product and proper pushforward. In the two claimed degrees the center defects reduce to divisor, zero-cycle or trivial cases.
3. Factor a birational map into smooth blowups and blowdowns using the requested characteristic-zero weak factorization theorem.

**Check.** The range of the sum has r−1 terms. No assertion of birational invariance in all codimensions is made.

**Direct prerequisites:** [real-integral-hodge-predicate](#real-integral-hodge-predicate), [realclosed-integral-hodge-predicate](#realclosed-integral-hodge-predicate), [lefschetz-one-one-cases](#lefschetz-one-one-cases), [zero-cycle-and-projective-space-cases](#zero-cycle-and-projective-space-cases), `MotivesAndAlgebraicCycles:MC.2`, `SchemeAndStackFoundations:SF.4`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Lemma 2.14 and equation(2.3) pp.43–44; Proposition 2.13 pp.42–44. Combines the equivariant blowup formula with the low-codimension and zero-cycle cases.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/blowup-hodge`, `PAPER-BENOIST-WITTENBERG-20/birational-hodge`, `PAPER-BENOIST-WITTENBERG-20/birational-top`.

<a id="real-detector-orthogonality"></a>

### Duality between the cycle and Picard detectors

**Target:** `MotivesAndAlgebraicCycles:MC.7/real-detector-orthogonality`. **Kind:** theorem. Proved duality theorem with cohomological suppliers.

Under convention S3, import from MC.2 the group M and maps ψ:A_G^{2d−2}→M and ψ′:Pic(XC)^G[2∞]→M*. If X(R)=∅, M=F₂, ψ(α)=α∪ω² under H_G^{2d}(Z(d+1))≃F₂, and ψ′ is the Brauer obstruction to descent. If X(R)≠∅, M=H^{d−1}(X(R),F₂), M*=H¹(X(R),F₂), ψ is the real component and ψ′ is the Borel–Haefliger class of Pic(X)[2∞], using Pic(X)=Pic(XC)^G. Then imψ and imψ′ are exact annihilators under M×M*→F₂.

**Construction or proof.**

1. If the real locus is empty, identify the dual of cup product by ω² through Hochschild–Serre; the Kummer restriction map is onto exactly when Picard torsion descends.
2. If it is nonempty, restrict the real-complex sequence to the complement of X(R), identify the admissible group with that restriction, and use the supplied self-dual exact sequence. Lemma 3.4 concerns the image of ψ′.

**Check.** The pairing is perfect over F₂ and requires no real orientation. The Picard source uses invariant 2-primary torsion, not arbitrary complex line bundles.

**Direct prerequisites:** [realclosed-integral-hodge-predicate](#realclosed-integral-hodge-predicate), `MotivesAndAlgebraicCycles:MC.2`, `SchemeAndStackFoundations:SF.3`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Definitions3.1–3.2 and Theorem 3.3 pp.46–49. Identifies the two detectors and proves exact orthogonality in both real-locus cases.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/psi-orthogonal`.

<a id="real-genus-and-descent"></a>

### Genus parity, Picard descent and finite covers

**Target:** `MotivesAndAlgebraicCycles:MC.7/real-genus-and-descent`. **Kind:** theorem. Proved parity criteria; Witt input explicitly open as a supplier.

Put φ=ψ∘cl:CH₁(X)→M under S3. If X(R)≠∅ this is the Borel–Haefliger cycle map. If X(R)=∅, an integral curve contributes1 exactly when its normalization is geometrically integral of even genus; otherwise it contributes0. For a smooth proper geometrically integral curve B/R with B(R)=∅, Pic(B)[2∞]→Pic(BC)^G[2∞] is onto exactly when its genus is even. The parity input is: an invariant line bundle of degree congruent to g(B) modulo2 descends. Finally, for a finite map E→F of smooth proper geometrically integral curves with F(R)=∅ and g(F) even, g(E) is even if and only if the degree is odd.

**Construction or proof.**

1. Reduce an integral curve to its normalization and use proper pushforward compatibility. For empty real locus apply duality and the Geyer descent criterion.
2. For parity descent, tensor to a sufficiently positive degree without changing parity. Riemann–Roch gives an odd-dimensional space of sections, incompatible with a nonsplit quaternionic descent obstruction. The Witt input used in the converse remains a supplier-design gap.
3. For covers apply χ(O_E)≡deg(f)χ(O_F) modulo2, obtained by Riemann–Roch and the even-degree property of closed points on F.

**Check.** Geometric genus means genus of the normalization, not an arithmetic genus chosen silently. The curve target F has empty real locus and even genus in the cover assertion.

**Direct prerequisites:** [real-detector-orthogonality](#real-detector-orthogonality), `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.3/vector-bundle-riemann-roch`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Theorem 3.6, Lemma 3.7 and Sublemma3.8 pp.49–50; Proposition 3.12 p.52. Relates the detector, real descent and the Riemann–Roch parity formula.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/phi-genus`, `PAPER-BENOIST-WITTENBERG-20/geyer`, `PAPER-BENOIST-WITTENBERG-20/pic-descent-parity`, `PAPER-BENOIST-WITTENBERG-20/finite-even-genus`.

<a id="real-curve-existence-and-index"></a>

### Curve existence and the first intermediate index

**Target:** `MotivesAndAlgebraicCycles:MC.7/real-curve-existence-and-index`. **Kind:** theorem. Proved existence and index criteria with geometric suppliers.

For X/R smooth proper geometrically integral with d≥2, a geometrically integral curve of odd geometric genus exists; if X(R)≠∅, one of even geometric genus exists as well. For a nonempty proper variety X/R, define ind₁ using the supplier’s gcd of χ(X,F) for coherent sheaves supported in dimension≤1. Then ind₁(X)=1 exactly when X(R)≠∅ or X contains a geometrically integral curve of even geometric genus; otherwise ind₁(X)=2. The index assertion allows singular X; the smooth curve-existence construction retains d≥2.

**Construction or proof.**

1. On a smooth projective surface take a general member of |4H|; adjunction gives odd genus. To obtain even genus blow up a real point and use |4nH′+E| for n sufficiently large.
2. For higher-dimensional smooth proper X pass through a suitable surface and resolution; geometric Bertini and compactification are requested in the precise real form needed.
3. The coherent-sheaf gcd equals the gcd of Euler characteristics of normalized integral subvarieties of dimension≤1. Real points contribute1; a curve without real points contributes odd Euler characteristic exactly in even genus. All remaining generators are even.

**Check.** The d≥2 hypothesis cannot be dropped from the curve-existence assertions.

**Direct prerequisites:** [real-genus-and-descent](#real-genus-and-descent), `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.5`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Proposition 3.9 pp.50–51; Proposition 3.10 and Corollary 3.11 pp.51–52. Uses Bertini/adjunction and the coherent-sheaf index formula.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/odd-genus-curve`, `PAPER-BENOIST-WITTENBERG-20/even-genus-realpoint`, `PAPER-BENOIST-WITTENBERG-20/elw-real-one`.

<a id="real-norm-detector-exactness"></a>

### Norm exactness without geometric Picard 2-torsion

**Target:** `MotivesAndAlgebraicCycles:MC.7/real-norm-detector-exactness`. **Kind:** theorem. Proved cohomological comparison.

Under S3 and Pic(XC)[2]=0, the sequence H^{2d−2}(X(C),Z(d−1))→A_G^{2d−2}(X(C),Z(d−1))→M→0 is exact, where the first arrow is the norm and the second is ψ. In particular the norm lands in the admissible subgroup. This statement is cohomological and does not assume real integral HC.

**Construction or proof.**

1. Kummer and Poincaré duality make H^{2d−1}(X(C),Z) finite of odd order.
2. Cup product by ω identifies the required 2-torsion groups and has norm image as its kernel. If real points exist, the real component decomposition identifies the remaining quotient with M.

**Check.** The hypothesis is geometric Picard 2-torsion zero, stronger than a claim just about descended line bundles.

**Direct prerequisites:** [real-detector-orthogonality](#real-detector-orthogonality), `MotivesAndAlgebraicCycles:MC.2`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Proposition 3.14 and Lemma 3.15 pp.53–54. Uses absence of Picard 2-torsion and the real-complex exact sequence.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/norm-psi-exact`.

<a id="real-obstruction-predicates"></a>

### Three obstructions to real cycle surjectivity

**Target:** `MotivesAndAlgebraicCycles:MC.7/real-obstruction-predicates`. **Kind:** definition. Definitions of obstruction predicates.

Under S3 write φ=ψ∘cl:CH₁(X)→M. A topological obstruction means ψ is not onto. Over the real numbers a Hodge obstruction means ψ is onto but ψ restricted to Hdg_G^{2d−2}{}_0 is not onto. Over the real numbers a cycle obstruction means that restricted map is onto but φ is not. Over a general real closed field with H²(O)=0, a cycle obstruction means ψ is onto but φ is not. These predicates classify failures of the detector φ, not every possible failure of real IHC. In particular φ onto need not imply real IHC without the hypotheses of the descent criterion below.

**Uses defining the API.**

- BW Examples4.1–4.8: Distinguish three mechanisms rather than treating every nonalgebraic real class as a Hodge obstruction.
- BW Question4.9: Ask whether cycle failure can coexist with complex integral HC.

**API.**

- `RealCycleObstruction.topological` (constructor): Failure of surjectivity of ψ.
- `RealCycleObstruction.hodge` (constructor): Over the real numbers, surjectivity of ψ together with failure on the Hodge subgroup.
- `RealCycleObstruction.cycle` (constructor): Surjectivity on the appropriate Hodge/admissible subgroup together with failure of φ.
- `RealCycleObstruction.implications` (relation): Topological failure requires Pic(XC)[2]≠0; Hodge failure requires H²(O)≠0; cycle failure implies failure of real IHC.

**Discriminating tests.** These are specification checks; only the two identified Tate-line tests are executed in the suggested file.

- `RealCycleObstruction.disconnected_curve` (computation): A geometrically integral curve with at least two real components has only the constant fundamental class in H⁰, so its detector has a topological obstruction.
- `RealCycleObstruction.pg_zero` (non-example): In the H²(O)=0 range a Hodge obstruction cannot occur; a deficient φ with ψ onto is classified as a cycle obstruction.
- `RealCycleObstruction.only_detector` (non-example): Surjectivity of φ alone is not accepted as a constructor of real IHC unless the complex algebraicity and Picard-torsion hypotheses of the descent theorem are supplied.

**Construction or proof.**

1. Use the supplied maps and their factorizations and define the three predicates by their surjectivity conditions.
2. Keep the geometric-Hodge factor only over the real numbers; in the vanishing range over R use its cohomological replacement.

**Check.** The cycle-obstruction predicate contains the surjectivity of the preceding detector, not only non-surjectivity of the cycle map.

**Direct prerequisites:** [real-detector-orthogonality](#real-detector-orthogonality), [real-integral-hodge-predicate](#real-integral-hodge-predicate).

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), §3.6.1 pp.54–55. Separates topological, Hodge and cycle-theoretic failures of the detector.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/obstruction-types`.

<a id="real-algebraic-orthogonality"></a>

### Algebraic curves, Picard torsion and even genus

**Target:** `MotivesAndAlgebraicCycles:MC.7/real-algebraic-orthogonality`. **Kind:** theorem. Proved theorem with explicit source-scope correction.

Under S3 assume H²(X,O_X)=0 and real IHC for 1-cycles. Then cl_R(CH₁(X))⊂H^{d−1}(X(R),F₂) and cl_R(Pic(X)[2∞])⊂H¹(X(R),F₂) are exact orthogonal complements. If in addition d≥2 or X(R)=∅, X contains a geometrically integral curve of even geometric genus if and only if Pic(X)[2∞]→Pic(XC)^G[2∞] is onto. The additional dimension-or-emptiness condition corrects the unqualified printed assertion: a positive-real-point odd-genus curve is a counterexample in dimension 1. If Pic(XC)[2]=0, the Borel–Haefliger curve map is onto and an even-genus curve exists; in dimension 1 the torsion-free Picard hypothesis forces genus 0.

**Construction or proof.**

1. H²(O)=0 removes the Hodge obstruction, and real IHC identifies imφ=imψ. Apply exact detector orthogonality.
2. If the real locus is empty, φ onto is equivalent to an even-genus curve and ψ′=0 to surjectivity of torsion descent. If it is nonempty and d≥2, a real point splits Picard descent and the Bertini construction supplies the curve.
3. For Pic(XC)[2]=0 apply norm exactness and duality; in dimension 1 use the dimension of Pic⁰ to isolate genus 0.

**Check.** Do not silently restore the printed dimension 1 assertion when real points exist. The Picard group in the pairing is its 2-primary torsion subgroup.

**Direct prerequisites:** [real-detector-orthogonality](#real-detector-orthogonality), [real-genus-and-descent](#real-genus-and-descent), [real-curve-existence-and-index](#real-curve-existence-and-index), [real-norm-detector-exactness](#real-norm-detector-exactness).

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Theorem 3.16 pp.55–56, proof via Theorem 3.6 and Proposition 3.9. The algebraicity hypothesis identifies the image of φ with the image of ψ; the even-genus assertion needs its verified scope.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/main-orthogonality`, `PAPER-BENOIST-WITTENBERG-20/main-even-genus`, `PAPER-BENOIST-WITTENBERG-20/main-no-pic2-real`, `PAPER-BENOIST-WITTENBERG-20/main-no-pic2-genus`.

<a id="real-surface-and-enriques-cases"></a>

### Geometric-genus-zero surfaces and Enriques curves

**Target:** `MotivesAndAlgebraicCycles:MC.7/real-surface-and-enriques-cases`. **Kind:** theorem. Proved surface and Enriques criteria with explicit classification inputs.

For a smooth proper geometrically integral surface X/R with H²(O)=0, cl_R(Pic(X)) and cl_R(Pic(X)[2∞]) are exact orthogonal complements in H¹(X(R),F₂). The even-genus criterion is the torsion-descent criterion above, and dim_F₂ H¹_alg≥(1/2)dim_F₂ H¹. For an Enriques surface, geometric 2-primary Picard torsion is generated by the descended canonical class, so an even-genus curve exists over every real closed field. Over the real numbers H¹_alg=w₁(X(R))^⊥; it is proper exactly when at least one real component is nonorientable. The torsion description and the equality cl_R(K_X)=w₁ are explicit supplier inputs.

**Construction or proof.**

1. For surfaces the 1-cycle statement is the divisor theorem, so no extra IHC assumption remains.
2. Let A=H¹_alg and B be the torsion image. Exact orthogonality and B⊆A give A^⊥⊆A, hence 2dimA≥dimH¹.
3. The canonical line bundle descends and generates the geometric torsion, giving the even-genus criterion. Identify its real class with the first Stiefel–Whitney class for the orthogonal-complement assertion.

**Check.** The half-dimension bound retains H²(O)=0. The existence of a nonorientable real Enriques example is separately registered, with a primary-source gap.

**Direct prerequisites:** [lefschetz-one-one-cases](#lefschetz-one-one-cases), [real-algebraic-orthogonality](#real-algebraic-orthogonality), `SchemeAndStackFoundations:SF.5`, `MotivesAndAlgebraicCycles:MC.2`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Corollary 3.17, Remark 3.18(ii), Example 3.19 and Corollary 3.20 pp.56–57. Applies divisor algebraicity and duality to surfaces, then the canonical torsion class to Enriques surfaces.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/surface-orthogonality`, `PAPER-BENOIST-WITTENBERG-20/surface-genus`, `PAPER-BENOIST-WITTENBERG-20/enriques-pic`, `PAPER-BENOIST-WITTENBERG-20/enriques-even`, `PAPER-BENOIST-WITTENBERG-20/surface-half`.

<a id="real-integral-descent-criterion"></a>

### A detector criterion from complex integral algebraicity

**Target:** `MotivesAndAlgebraicCycles:MC.7/real-integral-descent-criterion`. **Kind:** theorem. Proved descent criterion; threefold corollary retains named primary inputs.

Under S3 assume Pic(XC)[2]=0, H²(X,O_X)=0 and surjectivity of the complex 1-cycle map CH₁(XC)→H^{2d−2}(X(C),Z(d−1)). Then real IHC for 1-cycles is equivalent to φ onto. If X(R)≠∅ this is cl_R(CH₁(X))=H^{d−1}(X(R),F₂); if X(R)=∅ it is existence of a geometrically integral even-genus curve. For a smooth proper threefold which is geometrically rationally connected, or geometrically simply connected Calabi–Yau with K_X≃O_X and H¹(O)=H²(O)=0, the same equivalence holds after importing the complex integral 1-cycle theorem and the corresponding Picard-torsion vanishing. The complex theorem is a named primary-proof gap, not established by a bare label Calabi–Yau.

**Construction or proof.**

1. Place the cycle norm above the exact cohomological norm-detector sequence. Given a target class, first match its detector with a real cycle, then lift the remaining norm class using complex algebraicity.
2. The converse is immediate by factoring the cycle map. Apply the genus interpretation when real points are absent.
3. For the threefold corollary import the complex uniruled/Calabi–Yau integral Hodge theorem, geometric Picard-torsion control and characteristic-zero comparison.

**Check.** General R uses the cohomological interpretation of the complex target in the H²(O)=0 range.

**Direct prerequisites:** [real-norm-detector-exactness](#real-norm-detector-exactness), [real-genus-and-descent](#real-genus-and-descent), `SchemeAndStackFoundations:SF.5`, `MotivesAndAlgebraicCycles:MC.2`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Theorem 3.22 and Corollary 3.23 pp.57–58. Uses norm exactness and complex algebraicity to isolate the remaining real detector.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/real-hc-criterion`, `PAPER-BENOIST-WITTENBERG-20/threefold-criterion`.

## Obstruction examples, torsion and source-question boundaries

<a id="real-obstruction-example-register"></a>

### Verified obstruction examples and source-only boundary cases

**Target:** `MotivesAndAlgebraicCycles:MC.7/real-obstruction-example-register`. **Kind:** application. Elementary proved examples plus clearly bounded source-only register.

The following cases have different proof status. A smooth proper geometrically integral curve with at least two real components has a topological detector failure because CH₁ is generated by its single fundamental class. An odd-genus curve with empty real locus has ind₁=2. A real Enriques surface with a nonorientable real component has a topological failure by the canonical-class criterion, but existence of the cited surface requires its primary classification source. For the sharp half-dimension example, an elliptic E/R has two real components and X→E is a conic bundle smooth above E(R), with X(R) connected nonempty: the source records dimH¹=2 and dimH¹_alg=1; the omitted bundle/class calculation is an explicit gap. The source also records a real K3 with H¹≠0 but H¹_alg=0; its construction in Mangolte’s book has not been read and is a source-only register entry, not a verified example here.

**Construction or proof.**

1. Check the two curve assertions directly from the fundamental class and Euler characteristic.
2. For a given nonorientable Enriques surface apply H¹_alg=w₁^⊥ and nondegeneracy.
3. Do not assert an explicit conic bundle, K3 or Enriques construction without the primary inputs listed in the gap ledger.

**Check.** Each unverified existence or dimension computation remains labelled as a source-only case.

**Direct prerequisites:** [real-obstruction-predicates](#real-obstruction-predicates), [real-surface-and-enriques-cases](#real-surface-and-enriques-cases), [real-curve-existence-and-index](#real-curve-existence-and-index).

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Examples4.1–4.3 pp.58–59; Remarks3.21(i)–(ii) p.57. Separates elementary curve examples from classification or omitted-calculation examples.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/curve-topological-example`, `PAPER-BENOIST-WITTENBERG-20/curve-empty-example`, `PAPER-BENOIST-WITTENBERG-20/enriques-nonorientable`, `PAPER-BENOIST-WITTENBERG-20/surface-half-sharp`, `PAPER-BENOIST-WITTENBERG-20/k3-h1-nonalgebraic`.

<a id="campedelli-construction-obstruction"></a>

### Obstruction to the displayed Campedelli descent

**Target:** `MotivesAndAlgebraicCycles:MC.7/campedelli-construction-obstruction`. **Kind:** theorem. Independent correction theorem; replacement-example gap remains.

Let ζ be primitive of order8 and f[x₀:…:x₆]=[ζ x̄₁:x̄₀:ζ² x̄₃:x̄₂:ζ³ x̄₅:x̄₄:x̄₆]. Then g=f² has weights(1,7,2,6,3,5,0) modulo8 and f has order16. On quadrics set T(Q)=overline(Q(f(x))); this is conjugate-linear and T²=g*. Quadratic weight spaces of even weight have dimension 4 and of odd weight dimension 3. On the weight 4 basis(a,b,c,d)=(x₀x₄,x₁x₅,x₂²,x₃²), T(Aa+Bb+Cc+Dd)=B̄a−Āb+D̄c−C̄d, so T²=-1 and there is no T-stable complex line. Consequently a scheme-theoretic smooth complete intersection Y of nonzero quadrics Q_i of weights2i, i=0,1,2,3, cannot be f-stable: its quadratic ideal has weight 4 part C Q₂, which would have to be T-stable. Thus this displayed construction cannot supply the claimed real Campedelli example. Existence of a replacement real-empty surface with H^i(O)=0 for i>0 and failed torsion descent remains a gap.

**Construction or proof.**

1. Enumerate the 28 monomials x_i x_j, i≤j, by weight w_i+w_j. Compute T on the four weight 4 monomials and apply it twice.
2. If T(v)=cv for v≠0 then -v=T²(v)=|c|²v, a contradiction.
3. For a regular sequence of four quadrics, twist its Koszul resolution by2: the terms before I_Y(2) are O(-6), O(-4)^4, O(-2)^6, O^4. Imported projective cohomology vanishing identifies H⁰(I_Y(2)) with span(Q_i). Distinct weights make its weight 4 part the prohibited line.

**Check.** The claim is nonexistence for the displayed construction, not nonexistence of all real Campedelli surfaces. The ordinary square of the conjugate-linear T, rather than a linearized approximation, equals -1 on weight 4. A global regular-sequence Koszul resolution is requested in addition to the existing abstract Koszul complex.

**Direct prerequisites:** `SchemeAndStackFoundations:SF.2/projective-space-cohomology`, `DerivedDeRhamCohomology:DD.1/koszul-complex`, [real-obstruction-predicates](#real-obstruction-predicates), `SchemeAndStackFoundations:SF.2`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Example 4.4 pp.59–60, corrected by the explicit quadratic calculation here. The source displays the action and construction; the obstruction is an independently checked correction, not a source theorem.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/campedelli-action`, `PAPER-BENOIST-WITTENBERG-20/campedelli-descent`, `PAPER-BENOIST-WITTENBERG-20/campedelli-eigenspaces`, `PAPER-BENOIST-WITTENBERG-20/campedelli-conjugate-pullback`, `PAPER-BENOIST-WITTENBERG-20/campedelli-quaternionic-block`, `PAPER-BENOIST-WITTENBERG-20/campedelli-quadratic-ideal`.

<a id="quartic-surface-hodge-obstructions"></a>

### Quartic K3 surfaces with Hodge obstructions

**Target:** `MotivesAndAlgebraicCycles:MC.7/quartic-surface-hodge-obstructions`. **Kind:** application. Source-scoped example targets with geometric primary-input gap.

The two Example 4.5–4.6 families are source-scoped existence targets over the real numbers. Near a smooth real quartic surface containing a real line, choose a very general quartic with Pic(XC)=Z·h. The transported class of that line has odd pairing with h, whereas h²=4; integral divisor algebraicity and the Picard rank show the transported real class is not algebraic. In an empty-real-locus very general quartic with Pic(XC)=Z·h, a smooth hyperplane section has genus 3 and hence detector0. Since CH₁ is generated by the hyperplane class, the detector vanishes on all cycles; the genus-detector theorem then excludes every geometrically integral even-geometric-genus curve. This argument does not identify arithmetic and geometric genus for singular curves. Both fail the corresponding detector through a Hodge obstruction. Existence of the required very-general real fibers and Picard-rank statements is a Noether–Lefschetz/deformation input recorded as a gap.

**Construction or proof.**

1. Import a locally constant real topological family and a very-general Picard-rank 1 fiber in the stated real component.
2. For the real-point example use mod-2 intersection with the hyperplane class. For the empty-real example compute the detector on a smooth genus 3 hyperplane generator, extend by additivity to CH₁, and use the normalization-genus detector theorem; do not apply adjunction directly to geometric genera of singular curves.
3. The complex integral divisor theorem holds here, so the obstruction is imposed by the Hodge condition on the detector, not by failure of complex integral divisor algebraicity.

**Check.** The Noether–Lefschetz existence input is not replaced by an assertion that every real quartic has Picard rank 1.

**Direct prerequisites:** [real-obstruction-predicates](#real-obstruction-predicates), [real-genus-and-descent](#real-genus-and-descent), [lefschetz-one-one-cases](#lefschetz-one-one-cases), `SchemeAndStackFoundations:SF.5`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Examples4.5–4.6 pp.60–61. Uses deformation of real quartics and Picard rank 1 to distinguish the Hodge obstruction.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/quartic-hodge-real`, `PAPER-BENOIST-WITTENBERG-20/quartic-hodge-empty`.

<a id="quartic-valuation-and-cycle-obstructions"></a>

### Valuation and specialization obstruction in quartic fibrations

**Target:** `MotivesAndAlgebraicCycles:MC.7/quartic-valuation-and-cycle-obstructions`. **Kind:** theorem. Proved obstruction mechanism; construction suppliers and approximation are explicit gaps.

Over kbar((t)) with kbar an algebraic closure of a finite field, the quartic x₀⁴+t x₁⁴+t²x₂⁴+t³x₃⁴=0 has no point over an odd-degree finite extension: after a valuation extension of odd ramification index e, the nonzero term valuations are distinct modulo4. Consequently the quartic-fibration construction of Examples4.7–4.8 has every complex curve of even projection degree. The special bidegree(4,4) equation over P¹ is v(u³x₀⁴+u²v x₁⁴+uv²x₂⁴+v³x₃⁴)=0; specialize curves to it and use the generic-fiber valuation obstruction. Smooth real approximations over P¹_R can have a real section whose topological projection is nonzero while every algebraic curve has zero mod-2 projection. Over an empty-real conic B, the corresponding smooth approximation has every geometrically integral curve of odd genus by the finite-cover parity criterion, hence ind₁=2. These yield cycle obstructions. The real approximation and DVR cycle specialization contracts, rather than normal-cone specialization, are required inputs.

**Construction or proof.**

1. In an odd-degree extension the residue extension has degree 1 and e is odd. For any nonzero coordinates, 4v(x_i)+ie have pairwise distinct residues modulo4, so exactly one term has least valuation and the sum cannot vanish.
2. Specialize a hypothetical odd-projection-degree curve through the proper family. Horizontal components of its special cycle would give an odd-degree point on the quartic generic fiber, contradicting the valuation calculation.
3. Use the source real approximation to arrange the desired real topological projection or empty-real base. For the latter a curve’s projection to B is finite after normalization and of even degree, hence its genus is odd.

**Check.** The claim concerns projection degrees in the specified examples, not all smooth quartic threefolds. The specialization step requires the requested proper DVR specialization preserving cycle degree.

**Direct prerequisites:** [real-obstruction-predicates](#real-obstruction-predicates), [real-genus-and-descent](#real-genus-and-descent), [real-curve-existence-and-index](#real-curve-existence-and-index), `SchemeAndStackFoundations:SF.5`, `MotivesAndAlgebraicCycles:MC.2`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Examples4.7–4.8 pp.61–62. Uses even projection degree and real approximation to produce genuine cycle-theoretic failure.

**Source:** [Burt Totaro, On the integral Hodge and Tate conjectures over a number field](https://www.math.ucla.edu/~totaro/papers/public_html/integral.pdf), Author preprint Theorem 2.1 pp.3–4, proof. Primary valuation and DVR specialization argument; published theorem numbering is different.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/totaro-valuation`, `PAPER-BENOIST-WITTENBERG-20/totaro-specialization`, `PAPER-BENOIST-WITTENBERG-20/quartic-fibration-real`, `PAPER-BENOIST-WITTENBERG-20/quartic-fibration-empty`.

<a id="anisotropic-quadric-constant-obstruction"></a>

### A constant-class obstruction on anisotropic quadrics

**Target:** `MotivesAndAlgebraicCycles:MC.7/anisotropic-quadric-constant-obstruction`. **Kind:** application. Source-only register; primary quadratic-form proofs remain gaps.

For the smooth projective anisotropic quadric X/R of dimension n over a real closed field, the source records that ω⁴ is algebraic precisely when -1 is a sum of seven squares in R(X), and this holds precisely when n≤6. Thus for n≥7 the real-closed integral Hodge property in codimension2 fails: the positive constant class is admissible but is not algebraic. The equivalence uses a real function-field theorem and Pfister’s sums-of-squares theorem whose primary proofs are not read in this pass; this is a source-only known case with those exact proof gaps.

**Construction or proof.**

1. Import the comparison of algebraicity of ω⁴ with the seven-square condition and the Pfister threshold.
2. Apply admissibility of positive constant classes on an empty-real quadric.

**Check.** The seven-square condition is not replaced by an arbitrary sum-of-squares condition.

**Direct prerequisites:** [real-rational-descent-and-constants](#real-rational-descent-and-constants), [realclosed-integral-hodge-predicate](#realclosed-integral-hodge-predicate).

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Example 2.5 p.38. Identifies the constant-class obstruction and its dimension threshold, citing two primary inputs.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/quadric-omega`.

<a id="real-unramified-cycle-defect"></a>

### Unramified description of the torsion 1-cycle defect

**Target:** `MotivesAndAlgebraicCycles:MC.7/real-unramified-cycle-defect`. **Kind:** theorem. Proved comparison with coniveau and decomposition-of-diagonal supplier gaps.

Let X/R be smooth proper geometrically integral of dimension d≥3, and assume CH₀(X_C′) is supported on a surface for every algebraically closed extension C′ containing R. Write H_X^q(M) for the Zariski sheafification of U↦H_G^q(U(C),M), and H_X^q(M)_0 for the kernel of restriction to the real-locus sheaf of H^q(G,M). Then H^{d−3}(X,H_X^d(Q/Z(d−1))_0) is canonically the torsion subgroup of coker[CH₁(X)→A_G^{2d−2}(X(C),Z(d−1))]. If R is the real numbers or H²(O)=0, real IHC for 1-cycles is equivalent to vanishing of this group. In dimension 3 the left side is H³_nr(X,Q/Z(2))_0, classes whose restriction at every real point vanishes.

**Construction or proof.**

1. Use the requested coniveau spectral sequence and its real-locus high-degree comparison. Universal surface support kills H^{d−3}(X_C,H_{X_C}^d(Q)).
2. The coefficient sequence identifies the displayed group with the torsion of H^{d−2}(X,H_X^d(Z(d−1))). Degeneration in the relevant bidegree identifies the latter with the cycle cokernel.
3. In the extra Hodge range rational 1-cycle algebraicity follows from hard Lefschetz and the divisor theorem, and norm descent identifies the real integral Hodge defect with that torsion cokernel.

**Check.** Surface support is universal in the stated extensions, not assumed just for one algebraic closure. The real-locus-zero subscript is retained on the sheaf.

**Direct prerequisites:** [real-integral-hodge-predicate](#real-integral-hodge-predicate), [realclosed-integral-hodge-predicate](#realclosed-integral-hodge-predicate), [lefschetz-one-one-cases](#lefschetz-one-one-cases), `MotivesAndAlgebraicCycles:MC.2`, `SchemeAndStackFoundations:SF.5`, `MotivesAndAlgebraicCycles:MC.0`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Proposition 5.2 and Remarks5.3 pp.65–67, using Proposition 5.1 pp.62–65. Combines Bloch–Ogus, rational support vanishing and the coefficient boundary to compute the torsion defect.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/torsion-defect`, `PAPER-BENOIST-WITTENBERG-20/unramified-hc-criterion`.

<a id="real-boundary-and-torsion-cycles"></a>

### Boundary coniveau and Bloch’s torsion cycle map

**Target:** `MotivesAndAlgebraicCycles:MC.7/real-boundary-and-torsion-cycles`. **Kind:** theorem. Proved conditional torsion theorem with precise Abel–Jacobi suppliers.

Under S54, let ∂:H_G^{2d−3}(Q/Z(d−1))→H_G^{2d−2}(Z(d−1)) be the coefficient boundary and define its subscript0 target as ∂^{-1}(A_G^{2d−2}). Then ∂^{-1}(N^{d−2}H_G^{2d−2}(Z(d−1)))=N^{d−2}H_G^{2d−3}(Q/Z(d−1)). Bloch’s Abel–Jacobi map λ:CH₁(X)_tors→H_G^{2d−3}(Q/Z(d−1))_0 is onto, and is an isomorphism for d≤3. In the low dimensions the usual zero-group conventions apply; the d≥3 unramified expression is only used where its index is nonnegative.

**Construction or proof.**

1. Real IHC makes the unramified defect vanish. Compare the Q/Z and shifted Z coniveau spectral sequences; high rows are isomorphic and the remaining edge is injective.
2. The supplier’s Bloch-map theorem identifies imλ with N^{d−2}; combine this with the boundary preimage equality and N^{d−2}H_G^{2d−2}=A_G^{2d−2}.
3. Use the independent low-dimensional injectivity theorem for λ when d≤3; surjectivity alone is insufficient.

**Check.** The target of λ is the boundary preimage, not an undefined Hodge structure on Q/Z cohomology. The primary Bloch-map construction/image/injectivity theorems are requested, not inferred from the coefficient sequence.

**Direct prerequisites:** [real-unramified-cycle-defect](#real-unramified-cycle-defect), `MotivesAndAlgebraicCycles:MC.2`, `SchemeAndStackFoundations:SF.5`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Theorem 5.4(i), Lemma 5.6 and proof pp.68–69. Uses a comparison of coefficient coniveau spectral sequences and the image/injectivity theorem for Bloch’s map.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/boundary-coniveau`, `PAPER-BENOIST-WITTENBERG-20/aj-surjective`, `PAPER-BENOIST-WITTENBERG-20/aj-isomorphism`.

<a id="real-torsion-orthogonality"></a>

### Orthogonality for torsion curves and all divisors

**Target:** `MotivesAndAlgebraicCycles:MC.7/real-torsion-orthogonality`. **Kind:** theorem. Proved torsion duality under S54.

Under S54, cl_R(CH₁(X)[2∞]) is the exact annihilator in H^{d−1}(X(R),F₂) of the image of H_G²(X(C),Z(1))→H¹(X(R),F₂), under mod-2 Poincaré duality. If H²(O)=0 this latter image is cl_R(Pic(X)), so torsion curves are orthogonal to all divisor classes. This differs from the earlier theorem pairing all curves with torsion divisors.

**Construction or proof.**

1. The boundary compatibility identifies the real torsion-cycle image with ψ applied to torsion admissible integral cohomology.
2. Identify the Pontryagin dual of the relevant localization boundary with the real component map. Kernel and image are exact annihilators.
3. Use the real-closed divisor theorem only when H²(O)=0 to replace the cohomological image by all algebraic divisors.

**Check.** The two pairings exchange which group is torsion; they are not interchanged without proof.

**Direct prerequisites:** [real-boundary-and-torsion-cycles](#real-boundary-and-torsion-cycles), [real-detector-orthogonality](#real-detector-orthogonality), [lefschetz-one-one-cases](#lefschetz-one-one-cases), `MotivesAndAlgebraicCycles:MC.2`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Theorem 5.4(ii), Corollary 5.5 and proof pp.68–70. Uses torsion Abel–Jacobi surjectivity and duality for the relative real-complex sequence.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/torsion-orthogonality`, `PAPER-BENOIST-WITTENBERG-20/torsion-pic-orthogonality`.

<a id="complex-unramified-cycle-defect"></a>

### Complex integral 1-cycle defect and unramified cohomology

**Target:** `MotivesAndAlgebraicCycles:MC.7/complex-unramified-cycle-defect`. **Kind:** theorem. Proved complex comparison with explicitly requested coniveau suppliers.

For a smooth connected projective complex d-fold X, d≥3, whose CH₀ is supported on a surface, the finite integral Hodge defect Z^{2d−2}(X)=Hdg^{2d−2}(X,Z)/imcl is canonically H^{d−3}(X,H_X^d(Q/Z(d−1))). Here the sheaf and cycle map are the ordinary complex ones; there is no equivariant real-locus-zero subscript. The decomposition-of-diagonal support argument and the integral Bloch–Ogus coefficient sequence are the specified suppliers.

**Construction or proof.**

1. Decomposition of the diagonal kills H^{d−3}(X,H_X^d(Q)) under surface support.
2. Apply the coefficient exact sequence and the Bloch–Ogus filtration in total degree 2d−2. The remaining integral quotient is the integral Hodge defect; rational 1-cycle algebraicity makes it torsion and finite.

**Check.** Do not import the real kernel condition into this complex theorem.

**Direct prerequisites:** [integral-hodge-predicate](#integral-hodge-predicate), `MotivesAndAlgebraicCycles:MC.2`, `SchemeAndStackFoundations:SF.5`, `MotivesAndAlgebraicCycles:MC.0`.

**Source:** [Jean-Louis Colliot-Thélène and Claire Voisin, Cohomologie non ramifiée et conjecture de Hodge entière](https://www.cmls.polytechnique.fr/perso/voisin/Articlesweb/CTVoisin13juin11.pdf), Proposition 3.3(ii) pp.10–11; Theorem 3.11 and Corollary 3.12 pp.14–15 in the 2011 preprint. Uses rational coniveau vanishing under surface support and the integral coefficient sequence to identify the finite defect.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/ctv-torsion-defect`.

<a id="quartic-threefold-torsion"></a>

### Torsion cycles on real-empty quartic threefolds

**Target:** `MotivesAndAlgebraicCycles:MC.7/quartic-threefold-torsion`. **Kind:** theorem. Conditional proved computation, unconditional over the real numbers after the registered Fano input.

Let X⊂P⁴_R be a smooth quartic threefold with X(R)=∅. If real IHC for 1-cycles holds, then CH₁(X)_tors≃F₂⊕(Q/Z)^30 as abelian groups. For the real numbers the IHC premise follows from BW2 Theorem 7.1 for real-empty Fano threefolds and is removed. For arbitrary real closed fields it remains a premise. The proof uses universal CH₀ support, H_G⁴(Z(2))≃Z⊕F₂ with the norm of a line primitive, and rank H_G³(Z(2))=30. These cohomology and Fano inputs have explicit supplier contracts and proof-scope gaps.

**Construction or proof.**

1. Geometric rational connectedness gives universal CH₀ support on a point; S54 and low-dimensional injectivity identify CH₁_tors with H_G³(Q/Z(2)).
2. The coefficient sequence gives an extension of H_G⁴(Z(2))_tors=F₂ by H_G³(Z(2))⊗Q/Z. The latter divisible group splits the extension.
3. Norm exactness and the even top-degree real-empty lattice make the norm of a line primitive in H_G⁴. Lefschetz fixed-point trace0 on b₃=60 gives invariant rank 30.
4. Over the real numbers apply the real-empty Fano theorem; retain its source-proof gap rather than claiming its proof has been fully decomposed.

**Check.** No unconditional statement over all real closed fields is inferred from the Archimedean case.

**Direct prerequisites:** [real-boundary-and-torsion-cycles](#real-boundary-and-torsion-cycles), [real-integral-descent-criterion](#real-integral-descent-criterion), [real-norm-detector-exactness](#real-norm-detector-exactness), `MotivesAndAlgebraicCycles:MC.2`, `SchemeAndStackFoundations:SF.5`, `MotivesAndAlgebraicCycles:MC.0`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Proposition 5.7 and Lemmas5.8–5.9 pp.70–71. Computes the torsion from the coefficient sequence and empty-real quartic cohomology.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, II](https://www.math.ens.psl.eu/~benoist/articles/hodgereel2.pdf), Theorem 7.1 and Corollary 7.2 pp.389–390. Supplies real IHC over the real numbers; the full Fano proof is not reconstructed in this pass.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/quartic-torsion`, `PAPER-BENOIST-WITTENBERG-20/quartic-real-input`.

<a id="quartic-sketch-completion-targets"></a>

### Two quartic computations requiring completion of source sketches

**Target:** `MotivesAndAlgebraicCycles:MC.7/quartic-sketch-completion-targets`. **Kind:** comparison. Source-sketch completion targets, with gaps; criterion itself is a conditional proved input.

The source sketches two further computations over the real numbers: for a smooth real-empty quartic threefold, CH₁(X)≃Z⊕F₂⊕(R/Z)^30; and for the specific smooth quartic x₀⁴+x₁⁴=x₂⁴+x₃⁴+x₄⁴, CH₁(X)_tors≃F₂⊕(Q/Z)^30. These are named proof-completion targets, not deductions already established by the preceding torsion theorem. The first needs the actual real intermediate-Jacobian group and comparison with the full Chow group. The second needs a real-point calculation of the admissible H_G⁴ lattice and H_G³ rank, plus real IHC. BW2 Proposition 7.7 gives a sufficient anticanonical criterion: for smooth Fano X with -K_X very ample and smooth S∈|-K_X|, a nonzero (-1)-eigenspace H^{1,1}_van(SC) makes the Gysin image algebraic; if H¹(S(R),F₂)→H¹(X(R),F₂) is onto, real IHC follows. Verification of that criterion for the displayed quartic remains a gap.

**Construction or proof.**

1. For the first computation identify the real intermediate-Jacobian group and its finite component extension, then prove its relation to the full Chow group; record both unresolved inputs.
2. For the second compute cohomology with real-locus constraints and check the anticanonical criterion explicitly; empty-real fixed-point trace cannot simply be reused.
3. The proof of the criterion deforms anticanonical K3 sections, applies the infinitesimal period map and excludes a flat nonzero proper(1,1) vanishing subsystem by irreducible monodromy. These deeper inputs remain supplier gaps.

**Check.** The displayed real-point quartic is not replaced by every smooth quartic with real points. The full Chow group does not follow merely by replacing Q/Z with R/Z in its torsion subgroup.

**Direct prerequisites:** [quartic-threefold-torsion](#quartic-threefold-torsion), [real-boundary-and-torsion-cycles](#real-boundary-and-torsion-cycles), `MotivesAndAlgebraicCycles:MC.2`.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Remark 5.10(i)–(ii) pp.71–72. Both stronger group computations are sketches with omitted details.

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, II](https://www.math.ens.psl.eu/~benoist/articles/hodgereel2.pdf), Proposition 7.7 and proof pp.393–395. The anticanonical criterion uses deformation, Gauss–Manin, vanishing-cycle monodromy and the real Gysin map.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/quartic-full-chow`, `PAPER-BENOIST-WITTENBERG-20/fermat-quartic-torsion`.

<a id="cycle-question-ledger"></a>

### Source questions defining the cycle-conjecture boundary

**Target:** `MotivesAndAlgebraicCycles:MC.7/cycle-question-ledger`. **Kind:** comparison. Source questions, statement-only coverage.

The following are source-time propositions to formulate, with no claim about their open status in 2026: (1) for every smooth proper rationally connected complex d-fold, is CH₁ onto its integral Hodge target? (2) does some real closed R admit a smooth proper odd-dimensional d-fold with empty real locus and nonalgebraic constant class ω^{2d−2}? (3) for every smooth proper geometrically integral X over the real numbers whose complexification is a uniruled threefold, a Calabi–Yau threefold (K≃O and H¹(O)=H²(O)=0), or a rationally connected variety, does real IHC hold for 1-cycles? (4) does some smooth proper geometrically integral X over the real numbers have complex integral HC for 1-cycles and a cycle obstruction to the real detector? These are quantified conjecture/existence questions, not unconditional theorem claims.

**Construction or proof.**

1. Formulate the quantified propositions with the coefficient, dimension and field conditions of the displayed definitions.
2. Use the proved threefold criterion or constant-class examples only within their stated hypotheses. No source question supplies an existence witness.

**Check.** This ledger makes no claim about subsequent research or the present open/closed status of these questions.

**Direct prerequisites:** [integral-hodge-predicate](#integral-hodge-predicate), [real-obstruction-predicates](#real-obstruction-predicates), [real-integral-descent-criterion](#real-integral-descent-criterion), [real-rational-descent-and-constants](#real-rational-descent-and-constants).

**Source:** [Olivier Benoist and Olivier Wittenberg, On the integral Hodge conjecture for real varieties, I](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf), Question2.1 p.36; Question2.6 p.38; Question2.16 p.45; Question4.9 p.62. Source-time questions distinguish general targets from proved families.

**Catalogue coverage:** `PAPER-BENOIST-WITTENBERG-20/question-voisin`, `PAPER-BENOIST-WITTENBERG-20/question-omega`, `PAPER-BENOIST-WITTENBERG-20/question-real-ihc`, `PAPER-BENOIST-WITTENBERG-20/question-cycle-obstruction`.

## Worked checks across interfaces

**A correspondence degree.** On a surface, inverse hard Lefschetz from H⁴ to H⁰ has degree −2 as a correspondence and is represented by codimension0 on X×X. A codimension2 representative would preserve degree and cannot be this inverse. On P¹×P¹, with ruling classes a,b and a²=b²=0, ab=1, the cycle a−b pairs to0 with a+b but to−1 with a. Numerical triviality therefore requires every complementary cycle, not one ample test.

**The two torsion pairings.** All real algebraic curves pair with 2-primary torsion divisors under the H²(O)=0 and real-IHC premises. Under S54, 2-primary torsion curves pair with all divisors. Exchanging those torsion qualifiers gives different statements and fails the intended checks.

**A dimension boundary.** A smooth odd-genus real curve with real points has split Picard descent. Its only one-dimensional integral subvariety is itself, so it has no even-genus curve. This rules out the unqualified dimension1 parity equivalence; d≥2 or empty real locus is required.

**A quadratic obstruction.** On the four-dimensional weight4 space in the displayed Campedelli construction, T(A,B,C,D)=(B̄,−Ā,D̄,−C̄). Applying T twice gives −id. If a nonzero v spans a stable complex line, T(v)=cv would imply −v=|c|²v, impossible. The Koszul/projective-cohomology comparison identifies the relevant ideal component with just such a line.

**An odd-degree valuation check.** In an odd-degree extension of kbar((t)), its residue field remains algebraically closed and the ramification index e is odd. Nonzero summands of x₀⁴+t x₁⁴+t²x₂⁴+t³x₃⁴ have valuations congruent to0,e,2e,3e modulo4. They are distinct, so a unique least valuation prevents cancellation. Proper DVR specialization, with degree preservation, is the bridge from this local calculation to the fibration obstruction.

**A multinomial check.** With a_i²=0, (a₁+⋯+a_n)^n=n!a₁⋯a_n. Combining this with the norm multiplicity (n−1)! gives ((n−1)!)^n n!, equal to2 for n=2 and48 for n=3. The larger integer in Stacks Tag0FH9 is unnecessary for the torsion conclusion and is not used.

## Inherited targets and assembly

The existing packet is imported, not overwritten. The following inventory accounts for all15 of its MC.7 nodes. A coefficient refinement does not silently identify two differently parameterized predicates.

| Existing node | Disposition | Continuation | Assembly instruction |
| --- | --- | --- | --- |
| `hodge-class` | retain | [hodge-conjecture-interface](#hodge-conjecture-interface) | Uses the actual pure-Hodge carrier; C5 supplies geometric comparison. |
| `cycle-classes-are-hodge` | retain | [hodge-conjecture-interface](#hodge-conjecture-interface) | Cycle inclusion is imported through MC.2/C5. |
| `hodge-conjecture` | retain | [hodge-conjecture-interface](#hodge-conjecture-interface) | Keep the rational conjecture and its existing planet. |
| `tate-conjecture` | retain | [tate-variants-corrected](#tate-variants-corrected) | Keep fixed-base rational-l-adic surjectivity and its existing planet. |
| `strong-tate-conjecture` | retain | [tate-variants-corrected](#tate-variants-corrected) | Keep the direct-summand requirement distinct. |
| `tate-beilinson-conjecture` | retain | [tate-variants-corrected](#tate-variants-corrected) | Its injectivity correctly has CH⊗Q, while Tate surjectivity has CH⊗Q_l. |
| `kunneth-conjecture-C` | retain-as-coefficient-variant | [rational-kunneth-C](#rational-kunneth-C) | Retain the F-linear predicate; rational C_Q is the new conjecture used in rational motive implications. Remove this old planet at assembly. |
| `conjecture-D` | retain-with-coefficient-disambiguation | [rational-numerical-D](#rational-numerical-D) | Keep the numerical/homological interface and qualified known cases; select rational coefficients explicitly for new implications. Remove its old planet at assembly. |
| `known-cases-of-conjecture-C` | retain-with-proof-scope | [known-case-register](#known-case-register) | Keep its four cases but carry G-KNOWN, in particular the realization-scope question over finite fields. |
| `smash-nilpotence` | retain-statement-correct-proof | [smash-nilpotence-proof-correction](#smash-nilpotence-proof-correction) | Keep its torsion conclusion; replace the erroneous coefficient and fill named norm/Abel contracts. Remove its old planet at assembly. |
| `lefschetz-and-hodge-standard-conjectures` | supersede | [lefschetz-standard-B](#lefschetz-standard-B) | A, B and Hdg are now explicit separate predicates; delete the old unsupported Tate⇒Hdg remark. Remove its old planet at assembly. |
| `bloch-beilinson-filtration-and-murre` | supersede | [bloch-beilinson-axioms](#bloch-beilinson-axioms) | The precise axioms, strong forms and global equivalence replace a statement of missing knowledge. |
| `motivic-t-structure` | supersede | [motivic-t-structure-predicate](#motivic-t-structure-predicate) | An explicit conditional predicate and its consequences replace the earlier no-statement placeholder. |
| `tate-conjecture-variants` | supersede-implications-retain-other-variants | [tate-variants-corrected](#tate-variants-corrected) | Retain the Borel–Moore variant with resolution/compactification, finite-extension equivalence, the two integral implications and the fibred-surface Brauer/Sha/BSD comparison under their original hypotheses. Replace only the global implication register which had omitted strong Tate and the Hdg exception. |
| `tate-and-hodge-known-cases` | supersede-register | [known-case-register](#known-case-register) | All H1/T1–T8/TB1 cases are preserved with coefficients and exact proof scope. |

At assembly remove the old planets C, D, smash nilpotence and the combined standard-conjectures placeholder. Retain their valid mathematical content as directed above. Keep the Hodge and Tate planets and the four new planets, for six in total. Source-only known cases retain their proof gaps.

## Supplier contracts

A request below names a registered supplier stage and a precise export; it does not claim that the export is implemented. The early realization interface has no MC.7 conjectural premise. Its arithmetic and real-cohomological extensions are separate, preventing a circular blanket dependency.

### R-MC0: `MotivesAndAlgebraicCycles:MC.0`

Extend correspondences, Part II, with universal CH₀ support on a surface after every algebraically closed extension, decomposition-of-diagonal action, and the resulting coniveau vanishing used in BW §5.1 pp.62–65. Supply quartic-threefold and anisotropic-quadric universal support with exact hypotheses. Existing correspondence-group/action/composition and numerical equivalence are imported, not reconstructed.

**Consumers:** [real-unramified-cycle-defect](#real-unramified-cycle-defect), [complex-unramified-cycle-defect](#complex-unramified-cycle-defect), [quartic-threefold-torsion](#quartic-threefold-torsion).

### R-MC2-EARLY: `MotivesAndAlgebraicCycles:MC.2`

Early realization interface: actual geometric Betti/l-adic carriers, classical Weil products, Poincaré duality, cycle map, rational scalar comparisons and hard Lefschetz in the fixed theory. Realizations must accept rational Chow correspondences of codimension d+r acting H^i→H^{i+2r}(r). Import the geometric étale cycle map from EtaleDerivedCategories:EDC.3 and Hodge comparison from C5; do not make this early interface depend on MC.7 conjectures.

**Consumers:** [hodge-conjecture-interface](#hodge-conjecture-interface), [tate-variants-corrected](#tate-variants-corrected), [standard-implications](#standard-implications), [lefschetz-standard-A](#lefschetz-standard-A), [lefschetz-standard-B](#lefschetz-standard-B), [hodge-standard-positivity](#hodge-standard-positivity), [rational-kunneth-C](#rational-kunneth-C), [rational-numerical-D](#rational-numerical-D), [motivic-t-structure-predicate](#motivic-t-structure-predicate), [motivic-t-structure-consequences](#motivic-t-structure-consequences), [known-case-register](#known-case-register).

### R-MC2-REAL: `MotivesAndAlgebraicCycles:MC.2`

Integral equivariant and Borel–Haefliger cycle maps; admissibility via α_{k+i}=Sq^i α_k for every even integer i (negative squares zero); products, proper pushforward, smooth pullback, norm/forgetful and real components. Supply M, ψ and ψ′, the exact norm–Kummer sequence and finite-stalk duality used in BW §§3.1–3.3 pp.45–55. Top-degree generators, blowup formula with normal bundle O(-1), projective-space diagonal, Geyer Picard descent, and Picard Brauer comparison are separate exact export statements. Topology itself has the missing-owner contract G-TOPOLOGY. This is MC.2 Part II, separated from arithmetic Abel–Jacobi.

**Consumers:** [integral-hodge-predicate](#integral-hodge-predicate), [real-integral-hodge-predicate](#real-integral-hodge-predicate), [realclosed-integral-hodge-predicate](#realclosed-integral-hodge-predicate), [real-rational-descent-and-constants](#real-rational-descent-and-constants), [lefschetz-one-one-cases](#lefschetz-one-one-cases), [zero-cycle-and-projective-space-cases](#zero-cycle-and-projective-space-cases), [real-blowup-and-birational-invariance](#real-blowup-and-birational-invariance), [real-detector-orthogonality](#real-detector-orthogonality), [real-genus-and-descent](#real-genus-and-descent), [real-curve-existence-and-index](#real-curve-existence-and-index), [real-norm-detector-exactness](#real-norm-detector-exactness), [real-obstruction-predicates](#real-obstruction-predicates), [real-algebraic-orthogonality](#real-algebraic-orthogonality), [real-surface-and-enriques-cases](#real-surface-and-enriques-cases), [real-integral-descent-criterion](#real-integral-descent-criterion), [real-obstruction-example-register](#real-obstruction-example-register), [quartic-surface-hodge-obstructions](#quartic-surface-hodge-obstructions), [quartic-valuation-and-cycle-obstructions](#quartic-valuation-and-cycle-obstructions), [anisotropic-quadric-constant-obstruction](#anisotropic-quadric-constant-obstruction).

### R-MC2-CONIVEAU: `MotivesAndAlgebraicCycles:MC.2`

Integral coniveau/Bloch–Ogus and torsion-cycle interface: BW §5.1 pp.62–65 and Theorem 5.4 pp.68–70, with real-locus-zero Q/Z sheaf, boundary preimage of coniveau and Bloch map λ. For S54 prove boundary^{-1}(N H_G^{2d−2}(Z(d−1)))=N H_G^{2d−3}(Q/Z(d−1)); λ is onto and is an isomorphism for d≤3. Obtain the primary image and injectivity theorems named in G-CONIVEAU. Supply the finite rank/torsion calculations for an empty-real quartic threefold in Lemmas5.8–5.9, keeping equivariance and twist.

**Consumers:** [real-unramified-cycle-defect](#real-unramified-cycle-defect), [real-boundary-and-torsion-cycles](#real-boundary-and-torsion-cycles), [real-torsion-orthogonality](#real-torsion-orthogonality), [complex-unramified-cycle-defect](#complex-unramified-cycle-defect), [quartic-threefold-torsion](#quartic-threefold-torsion), [quartic-sketch-completion-targets](#quartic-sketch-completion-targets).

### R-MC2-COMPATIBLE: `MotivesAndAlgebraicCycles:MC.2`

Compatible realization category M_k^L of Ichino–Prasanna arXiv v2 §2.1 p.12, including every-prime comparison, morphisms, coefficient extension, and the source L-Hodge convention for nonreal L. Export cycle/correspondence compatibility; the simultaneous class predicate is owned here.

**Consumers:** [compatible-hodge-tate-classes](#compatible-hodge-tate-classes).

### R-MC2-ARITH: `MotivesAndAlgebraicCycles:MC.2`

Arithmetic realization/Abel–Jacobi Part II: homologically trivial cycles on the unitary tower, cohomological local-global identity of Li–Liu Hypothesis 6.6 with semisimplification, all primes and ρ[π̃∞]; compare with the specified analytic L-factor. Import actual heights and special-cycle constructions from the pending arithmetic-inner-product owner G-AIP. Abstract cycle class maps and the étale Abel–Jacobi map are not duplicated in MC.7.

**Consumers:** [beilinson-bloch-predicates](#beilinson-bloch-predicates), [height-positivity-predicate](#height-positivity-predicate), [unitary-bb-specialization](#unitary-bb-specialization), [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product).

### R-MC4: `MotivesAndAlgebraicCycles:MC.4`

Extend the geometric-motive interface to rational DM_gm(k,Q), the admitted field hypotheses, rigid triangulated tensor structure, and Hom(M(X),M(X)(a)[2a])=CH^{d+a}(X×X)_Q with action compatible with the homological realization. Existing effective/tate-stabilised motives and Chow embedding are imported; current MC.4 requires perfect fields admitting resolution. State characteristic-zero results on that supported domain and record any extension needed for general characteristic.

**Consumers:** [motivic-t-structure-predicate](#motivic-t-structure-predicate), [motivic-t-structure-consequences](#motivic-t-structure-consequences).

### R-MC6: `MotivesAndAlgebraicCycles:MC.6`

Apply the existing early neutral-Tannakian/reconstruction interface to the exact faithful rigid tensor heart with End(1)=Q, allowing a Q_l-valued fiber functor and a Q-Tannakian category which is not asserted neutral over Q. Need the Tannakian criterion, finite length and conservativity; do not duplicate neutral reconstruction or the Zhu/Gleason–Lim–Xu routes.

**Consumers:** [motivic-t-structure-consequences](#motivic-t-structure-consequences).

### R-C5: `ComplexComparisonPartII:C5`

Geometric pure Hodge structure on smooth proper complex cohomology, algebraic de Rham filtration/singular comparison, cycle classes of type(p,p), Hodge–Riemann on rational primitive classes, analytic exponential exact sequence and GAGA (including the equivariant line-bundle version over the real numbers). Abstract pure Hodge structures and their morphisms are already at the pinned Tau Ceti baseline and must be imported.

**Consumers:** [hodge-conjecture-interface](#hodge-conjecture-interface), [lefschetz-one-one-cases](#lefschetz-one-one-cases), [hodge-standard-positivity](#hodge-standard-positivity), [motivic-t-structure-consequences](#motivic-t-structure-consequences), [integral-hodge-predicate](#integral-hodge-predicate).

### R-SF2: `SchemeAndStackFoundations:SF.2`

Cohomology/base-change facts beyond the exact projective-space-cohomology node: constancy of Euler characteristic in flat proper families of line bundles and its application to degree on projective lines. Provide the coherent finiteness used in real divisor Kummer comparison; equivariant topological cohomology is routed through MC.2, not assumed to be coherent sheaf cohomology.

**Consumers:** [smash-nilpotence-proof-correction](#smash-nilpotence-proof-correction), [zero-cycle-and-projective-space-cases](#zero-cycle-and-projective-space-cases).

### R-SF3: `SchemeAndStackFoundations:SF.3`

Use existing line-bundle-norm, abel-maps-high-degree, vector-bundle-riemann-roch, genus-base-change and picard-brauer-sequence. Additional exports: C^n→Sym^n C finite flat of degree n!, group-quotient norm pullback product, Pic(projective bundle)=Pic(base)⊕Z and connected-family constancy of fibre degree; then a fibre-trivial line bundle descends. For real curves export Geyer descent/Picard2-primary statements with empty-real-locus and genus parity hypotheses. The general Picard representability and high-degree Abel theorem are not requested anew.

**Consumers:** [smash-nilpotence-proof-correction](#smash-nilpotence-proof-correction), [lefschetz-one-one-cases](#lefschetz-one-one-cases), [real-genus-and-descent](#real-genus-and-descent), [real-curve-existence-and-index](#real-curve-existence-and-index), [real-norm-detector-exactness](#real-norm-detector-exactness), [real-algebraic-orthogonality](#real-algebraic-orthogonality), [real-surface-and-enriques-cases](#real-surface-and-enriques-cases).

### R-SF4: `SchemeAndStackFoundations:SF.4`

SchemeAndStackFoundations, Part II: characteristic-zero weak factorization between smooth proper real varieties; normalization/resolution of curves; smooth geometrically integral real complete-intersection curves with imposed points and required genus parity, over a real closed field; geometric Bertini with imposed points after algebraic closure for smash nilpotence. Existing bertini-smoothness does not supply geometric integrality, point constraints or weak factorization.

**Consumers:** [smash-nilpotence-proof-correction](#smash-nilpotence-proof-correction), [real-blowup-and-birational-invariance](#real-blowup-and-birational-invariance), [real-curve-existence-and-index](#real-curve-existence-and-index), [real-genus-and-descent](#real-genus-and-descent).

### R-SF5: `SchemeAndStackFoundations:SF.5`

Intersection-theory extension: proper DVR specialization on Chow groups preserving degree of zero-cycles and degree against a relative hyperplane/divisor, as used in Totaro preprint Theorem 2.1 pp.3–4. Existing SF.5/specialization concerns deformation to a normal cone and is not this theorem. Import existing Chow groups, exterior products, Chern classes, smooth intersection, finite-flat degree and projective-bundle formula. Hodge-index positivity must identify its numerical radical with the relevant homological kernel before asserting strict positivity on A_H.

**Consumers:** [lefschetz-standard-A](#lefschetz-standard-A), [lefschetz-standard-B](#lefschetz-standard-B), [hodge-standard-positivity](#hodge-standard-positivity), [rational-kunneth-C](#rational-kunneth-C), [rational-numerical-D](#rational-numerical-D), [bloch-beilinson-axioms](#bloch-beilinson-axioms), [quartic-valuation-and-cycle-obstructions](#quartic-valuation-and-cycle-obstructions).

### R-SF2-KOSZUL: `SchemeAndStackFoundations:SF.2`

Global regular-section Koszul resolution for a smooth complete intersection of four quadrics in P⁶_C, exact on the ambient projective space, and its O(2)-twist cohomology using SF.2/projective-space-cohomology. Existing DerivedDeRhamCohomology:DD.1/koszul-complex is the abstract construction, not this geometric exactness result.

**Consumers:** [campedelli-construction-obstruction](#campedelli-construction-obstruction).

### R-PS6: `PeriodsAndSpecialValues:PS.6`

The single shared analytic/Selmer-side Beilinson–Bloch–Kato interface: motivic L-data, analytic continuation and order at zero, prime/coefficient independence, equivariant factorization, and the shift to the unitary center1/2. Supply a conditional comparison between finite cycle rank and the appropriate Selmer dimension only under the named Abel–Jacobi/comparison premises. MC.7 owns the cycle-rank predicate; PS.6 owns the L/Selmer statement and no rank equality is silently taken as a theorem.

**Consumers:** [beilinson-bloch-predicates](#beilinson-bloch-predicates), [unitary-bb-specialization](#unitary-bb-specialization), [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product).

### R-FALTINGS: `FaltingsFinitenessAndIsogenyTheorems:R28.4`

Import the isogeny/Hom theorem for abelian varieties over number fields to obtain divisor Tate via the polarization and Rosati correspondence; use the existing owner and its actual exact statement, including l and coefficient hypotheses.

**Consumers:** [known-case-register](#known-case-register).

## Gaps preventing closure

### G-TOPOLOGY: Equivariant topology supplier is not yet registered

The catalogue proposes EquivariantTopologyRealVarieties, Part II of algebraic topology, but this identifier has no registered stage. Obtain/register equivariant semialgebraic cohomology over a real closed field, Steenrod operations with negative-square convention, real-component restriction, twist, norm, Poincaré duality with finite stalks, blowup and coniveau compatibilities. MC.2 consumes that theory and exports only geometric realization/cycle statements; RealAlgebraicGeometry currently provides QE/CAD and does not provide these cohomology results.

**Consumers:** [real-integral-hodge-predicate](#real-integral-hodge-predicate), [real-detector-orthogonality](#real-detector-orthogonality), [real-norm-detector-exactness](#real-norm-detector-exactness), [real-torsion-orthogonality](#real-torsion-orthogonality), [zero-cycle-and-projective-space-cases](#zero-cycle-and-projective-space-cases), [real-blowup-and-birational-invariance](#real-blowup-and-birational-invariance).

### G-HEIGHT: Primary primitive domain and height normalization

Read Beilinson, Height pairing between algebraic cycles, Contemp.Math.67 (1987), Conjecture 5.5, from a permitted copy. None was obtained in this pass. Verify the exact primitive kernel, coefficient extension, Hermitian/sign convention and height existence hypotheses before identifying the conditional supplied-domain predicate with the primary conjecture. Li–Liu Remark 1.10 supplies only its signed expectation and the étale-Abel–Jacobi injectivity qualification.

**Consumers:** [height-positivity-predicate](#height-positivity-predicate), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product).

### G-AIP: Arithmetic-inner-product supplier designs and corrected local index proof

The routed owners UnitaryArithmeticInnerProductFormula (Gross–Zagier and arithmetic heights, Part II), UnitaryKudlaRapoportCycles and UnitaryRapoportZinkSpacesAndRSZModels have no registered stages here. Register their exact contracts before dependency closure: smooth projective neat-level unitary towers, Kudla cycles, Chow-valued modular theta series under Hypothesis 4.5, restricted l-adic height, arithmetic Siegel–Weil/doubling factorization, local zeta integrals and the almost-self-dual local intersection identity. PAPER-LI-LIU-21/E3 records that the cited 2020 local index input had an additional conjectural premise; a proposed later repair is Li–Rapoport–Zhang (2024), Theorem 14.6.2/Corollary 16.1.5, whose proof was not read. Until that supplier is verified the two case nodes additionally assume the corrected local index identity. Other extracted Hecke/tempered-correspondence corrections must be incorporated, not treated as established by their citation.

**Consumers:** [unitary-bb-specialization](#unitary-bb-specialization), [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product).

### G-KNOWN: Primary proofs behind the classical known-case register

Read/route the exact primary proofs for T1 (Tate finite-field abelian isogeny/divisor theorem), T3 (Zarhin spread-out), T5 (Tankeev K3), T6 (André hyperkähler), T7 (Moonen with varying deformation), T8 (the finite-field K3 chain including characteristic2), and B1/C1 (Murre, Lieberman and Katz–Messing). Check which Weil theories the finite-field C statement supports; do not generalize an l-adic proof to every abstract Weil theory. Totaro §§3–5 and Jannsen92 Remarks1–2 were read as statement/proof-sketch registers, not these primary proofs. T2 imports R28.4. No hypothesis-free Hilbert/Picard modular-surface entry is invented from survey names.

**Consumers:** [known-case-register](#known-case-register), `MotivesAndAlgebraicCycles:MC.7/known-cases-of-conjecture-C`.

### G-CONIVEAU: Primary coniveau and torsion Abel–Jacobi inputs

BW §5 pp.62–67 and CTV preprint Proposition 3.3, Theorem 3.11/Corollary 3.12 were read, including their proofs. Their primary Bloch–Ogus/Gersten and Bloch torsion cycle-map image/injectivity inputs were not read. Obtain the exact Q/Z/twist/real-locus-zero contracts of R-MC2-CONIVEAU and prove the d≤3 injectivity range; never infer torsion Chow groups from cohomological cokernels alone.

**Consumers:** [real-unramified-cycle-defect](#real-unramified-cycle-defect), [real-boundary-and-torsion-cycles](#real-boundary-and-torsion-cycles), [real-torsion-orthogonality](#real-torsion-orthogonality), [complex-unramified-cycle-defect](#complex-unramified-cycle-defect), [quartic-threefold-torsion](#quartic-threefold-torsion).

### G-QUADRATIC: Real function-field quadratic-form owner is unregistered

The catalogue proposes QuadraticFormsRealFunctionFields as Part II of global quadratic forms; no stage is registered. Obtain Witt’s empty-real-curve sum-of-two-squares criterion and Pfister’s precise seven-square theorem over the anisotropic quadric function field. Do not substitute number-field quadratic forms or claim the quadric dimension cutoff from topology alone.

**Consumers:** [anisotropic-quadric-constant-obstruction](#anisotropic-quadric-constant-obstruction), [real-genus-and-descent](#real-genus-and-descent).

### G-EXAMPLES: Primary construction and approximation inputs for real examples

Obtain the exact real conic-bundle construction and detector dimensions (BW Remark 3.21(i) p.57), real K3 Picard/BH construction (BW Remark 3.21(ii) p.57), Noether–Lefschetz Picard calculations for the two quartic surfaces (BW Examples4.5–4.6 p.60), and real algebraic approximation/connected-locus constructions for the fibration examples (BW Examples4.7–4.8 pp.60–61). Their statements and uses were read; these primary existence/approximation proofs were not. The parity/valuation obstruction mechanism is stated separately and proved conditionally on these inputs.

**Consumers:** [real-obstruction-example-register](#real-obstruction-example-register), [quartic-surface-hodge-obstructions](#quartic-surface-hodge-obstructions), [quartic-valuation-and-cycle-obstructions](#quartic-valuation-and-cycle-obstructions).

### G-CAMPEDELLI: Replace the invalid Campedelli construction

PAPER-BENOIST-WITTENBERG-20/E3: the displayed anti-linear action has T²=-1 on the weight 4 quadratic equation space, which forbids a stable complex line. The complete-intersection ideal has precisely one such weight 4 line, so no displayed complete intersection descends. The intended real-empty Campedelli surface and its cycle-obstruction consequence require a different verified construction. The obstruction calculation is a finished target; the asserted existence is not accepted.

**Consumers:** [campedelli-construction-obstruction](#campedelli-construction-obstruction), [real-obstruction-example-register](#real-obstruction-example-register).

### G-FANO: Primary real Fano/K3 deformation suppliers

BW2 Theorem 7.1 is read at statement level; its full Fano-threefold proof remains to be extracted. Proposition 7.7 and its proof pp.393–395 were read and provide the exact anticanonical K3 sufficient criterion stated in quartic-sketch-completion-targets, but import infinitesimal periods, invariant/vanishing cohomology and irreducible monodromy from their owners. The empty-real quartic case over the real numbers can be registered as a source theorem; general real-closed surjectivity is not inferred by transfer.

**Consumers:** [quartic-threefold-torsion](#quartic-threefold-torsion), [quartic-sketch-completion-targets](#quartic-sketch-completion-targets).

### G-QUARTIC-FULL: Complete both announced quartic Chow computations

For the empty-real quartic prove the real intermediate-Jacobian group structure and its comparison with the full Chow group before deriving CH₁≃Z⊕F₂⊕(R/Z)^30. For the displayed real-point Fermat quartic prove the appropriate analogue of Lemma 5.9 and check BW2 Proposition 7.7 to derive CH₁,tors≃F₂⊕(Q/Z)^30. BW Remark 5.10 gives sketches, not these missing proofs.

**Consumers:** [quartic-sketch-completion-targets](#quartic-sketch-completion-targets).

### G-COMPLEX-THREEFOLD: External complex integral curve cases

For rationally connected and simply connected Calabi–Yau threefolds over C, obtain the exact primary complex integral Hodge-for-curves results used in BW Theorem 3.22 and its examples. Complex rational Hodge is insufficient for the integral descent criterion. Enriques Picard torsion/classification inputs likewise need an exact existing surface owner or a proposed extension before closing their example.

**Consumers:** [real-integral-descent-criterion](#real-integral-descent-criterion), [real-surface-and-enriques-cases](#real-surface-and-enriques-cases).

### G-TATE-VARIANTS: Primary proofs of the retained extended Tate variants

Obtain Jannsen’s resolution/smooth-compactification reduction to Borel–Moore homology, the finite-field integral divisor implication, Schoen’s integral1-cycle implication and the Artin–Tate fibred-surface Brauer/Sha/BSD comparison. Totaro §1 pp.4–5 and §2 pp.6–7 were read for these statements; their primary proofs are not read. Record the separate fields and quantifiers.

**Consumers:** [tate-variants-corrected](#tate-variants-corrected).

## Source corrections used by the targets

**MotivesAndAlgebraicCycles/E-MC7-1** — Tag0FH9, nth-power calculation in the proof, online HTML read 19 October2026. The norm argument uses ((n−1)!)^n n^n, equivalently (n!)^n, as the coefficient of the exterior product. The coefficient is ((n−1)!)^n n!: after squares vanish, the nth power of a sum of n classes has n! surviving ordered monomials. For n=2, (a+b)^2=2ab when a²=b²=0, whereas the displayed coefficient gives4ab. For n=3 the correct coefficient is48 rather than216. Both integers are nonzero, so the torsion conclusion is unchanged. No correction was found on the current tag page; this pass does not assert priority beyond that search.

Existing findings are referenced in their paper extractions; this layer neither duplicates those findings nor supplies their independent review. Its target statements and supplier contracts incorporate the following actions.

| Existing finding | Required action | Consumers |
| --- | --- | --- |
| `PAPER-BENOIST-WITTENBERG-20/E1` | Restrict the real-point parity equivalence to d≥2. | [real-algebraic-orthogonality](#real-algebraic-orthogonality) |
| `PAPER-BENOIST-WITTENBERG-20/E2` | Require positive even k for the constant-class criterion. | [real-rational-descent-and-constants](#real-rational-descent-and-constants) |
| `PAPER-BENOIST-WITTENBERG-20/E3` | Reject the displayed Campedelli construction and keep the replacement gap. | [campedelli-construction-obstruction](#campedelli-construction-obstruction) |
| `PAPER-BENOIST-WITTENBERG-20/E4` | Use the negative exceptional pullback in the blowup inverse. | [real-blowup-and-birational-invariance](#real-blowup-and-birational-invariance) |
| `PAPER-BENOIST-WITTENBERG-20/E5` | The proper pushforward starts on the source variety. | [real-integral-hodge-predicate](#real-integral-hodge-predicate) |
| `PAPER-BENOIST-WITTENBERG-20/E6` | Use ψ′ for the image detector. | [real-detector-orthogonality](#real-detector-orthogonality) |
| `PAPER-BENOIST-WITTENBERG-20/E7` | The curve-class map has source CH₁. | [real-integral-hodge-predicate](#real-integral-hodge-predicate) |
| `PAPER-BENOIST-WITTENBERG-20/E8` | Use the complex projective-space factor in the diagonal argument. | [zero-cycle-and-projective-space-cases](#zero-cycle-and-projective-space-cases) |
| `PAPER-BENOIST-WITTENBERG-20/E9` | Retain equivariance on the Hodge target. | [real-integral-descent-criterion](#real-integral-descent-criterion) |
| `PAPER-BENOIST-WITTENBERG-20/E10` | Keep both full-Chow/Fermat computations as proof targets with gaps. | [quartic-sketch-completion-targets](#quartic-sketch-completion-targets) |
| `PAPER-BENOIST-WITTENBERG-20/E11` | Use finite-stalk local systems for the asserted perfect duality. | [real-detector-orthogonality](#real-detector-orthogonality), [real-torsion-orthogonality](#real-torsion-orthogonality) |
| `PAPER-LI-LIU-21/E1` | Use the corrected published archimedean constant, not the obsolete preprint normalization. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E2` | Import the corrected harmonic Green-current argument from the height supplier. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E3` | Add the local-index supplier premise until the later repair is verified. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E4` | Keep relative dimension n−1−j in the model supplier. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E5` | Schwartz spaces use the finite adeles over F in the correct tensor product. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E6` | Keep the disjoint-support and degree/twist corrections in the height supplier. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E7` | The convergence supplier must sum the shell estimates correctly. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E8` | At the proof stage choose the auxiliary set inside the split places. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E9` | The product with supports needs the two possibly different supports. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E10` | Use the dual Hecke character, or restrict to the real Hecke algebra before conjugating. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E11` | Use smooth-representation equivariance to define tower Hecke actions. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E12` | Use the stronger cohomological Hecke annihilator instead of geometric restriction injectivity. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E13` | Use that stronger annihilator for the tempered-correspondence product. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E14` | Replace unsupported Hecke finite generation by finite-dimensional linear algebra. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E15` | Local theta lifts are zero or irreducible, with nonvanishing separately imposed. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E16` | Use the complementary basis indices in the linear-algebra supplier. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E17` | Keep regular support in the analytic Schwartz-space argument. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E18` | Keep the actual number of tensor factors in model pushforwards. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E19` | State smoothness only at neat levels. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |
| `PAPER-LI-LIU-21/E20` | Use π̃∞ in the cohomological Galois-representation label. | [li-liu-hypothesis-contract](#li-liu-hypothesis-contract), [li-liu-localized-nonvanishing](#li-liu-localized-nonvanishing), [li-liu-arithmetic-inner-product](#li-liu-arithmetic-inner-product) |

Li–Liu Theorem1.5 was also checked on the rendered author-copy page5: the set condition is |R∩V_F^spl|≥2. The extracted PDF text corrupts it. This is a text-extraction problem and is not recorded as a mistake in the paper.

## Source editions and reading scope

All target statements, proof outlines and corrections above are in our own words. Page numbers refer to the edition listed here; an unread primary proof is not credited as read because a survey cites it. PDF hashes and the Stacks HTML hash are recorded in the packet.

- **DELIGNE:** [Pierre Deligne, *The Hodge Conjecture*](https://www.claymath.org/wp-content/uploads/2022/06/hodge.pdf). Clay Mathematics Institute problem description, five-page author text. Read: pp.1–5, Hodge classes, cycle classes and the divisor case.
- **KLEIMAN:** [Steven L. Kleiman, *The standard conjectures*](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische1994.Kleiman.Standard.Conjectures.pdf). Motives, Proceedings of Symposia in Pure Mathematics 55, Part 1 (1994), pp.3–20; scanned article. Read: §1 pp.3–6; §3 pp.11–12; §4 pp.13–16; §5 pp.16–19, visually read.
- **JANNSEN94:** [Uwe Jannsen, *Motivic sheaves and filtrations on Chow groups*](https://epub.uni-regensburg.de/26639/1/ubr13239_ocr.pdf). Motives, Proceedings of Symposia in Pure Mathematics 55, Part 1 (1994), pp.245–302; institutional scan. Read: §2 Conjecture 2.1 and Lemma 2.2, pp.257–260; §5 Conjecture 5.1, Theorem 5.2 and Propositions5.3–5.8, pp.288–297; p.288 visually checked.
- **BEILINSON10:** [Alexander Beilinson, *Remarks on Grothendieck’s standard conjectures*](https://arxiv.org/pdf/1006.1116v2). arXiv:1006.1116v2 (11 June 2010), seven pages. Read: §§1.1–1.7, pp.1–4; definition, conditional consequences and proof of §1.4.
- **TOTARO:** [Burt Totaro, *Recent progress on the Tate conjecture*](https://www.math.ucla.edu/~totaro/papers/public_html/tate.pdf). Author manuscript, 15 pages; source-time theorem register. Read: §§1–2 pp.2–7, statements, coefficients and variants; §3 pp.7–9, abelian divisor case survey; §4 pp.9–10 and opening of §5 pp.10–11, characteristic-sensitive known-case register.
- **JANNSEN92:** [Uwe Jannsen, *Motives, numerical equivalence, and semi-simplicity*](https://epub.uni-regensburg.de/26642/1/jannsen10.pdf). Inventiones Mathematicae 107 (1992), 447–452; institutional scan. Read: Corollaries1–2 and Remarks1–4 pp.449–452, including the known-case register.
- **BW:** [Olivier Benoist and Olivier Wittenberg, *On the integral Hodge conjecture for real varieties, I*](https://www.math.ens.psl.eu/~benoist/articles/hodgereel1.pdf). Inventiones Mathematicae 222 (2020), 1–77; author-hosted published article. Read: §1.6.3–1.6.4 pp.30–35, admissibility and functoriality; §§2–4 pp.35–62, statements and proofs of selected real-cycle cases; §5 pp.62–72, coniveau inputs, torsion and quartic computations.
- **BW2:** [Olivier Benoist and Olivier Wittenberg, *On the integral Hodge conjecture for real varieties, II*](https://www.math.ens.psl.eu/~benoist/articles/hodgereel2.pdf). Journal de l’École polytechnique — Mathématiques 7 (2020), 373–429; author-hosted published article. Read: §7.1 Theorem 7.1, Corollary 7.2 and Example 7.3 pp.389–390; §7.3 Proposition 7.7 and its proof pp.393–395; broader Fano argument remains a source-proof gap.
- **CTV:** [Jean-Louis Colliot-Thélène and Claire Voisin, *Cohomologie non ramifiée et conjecture de Hodge entière*](https://www.cmls.polytechnique.fr/perso/voisin/Articlesweb/CTVoisin13juin11.pdf). Author preprint dated 13 June 2011; preprint pagination. Read: Introduction pp.1–3; Proposition 3.3 and proof pp.10–11; Theorem 3.11 and Corollary 3.12 with proofs pp.14–15.
- **TOTARO13:** [Burt Totaro, *On the integral Hodge and Tate conjectures over a number field*](https://www.math.ucla.edu/~totaro/papers/public_html/integral.pdf). Author preprint; Theorem2.1 on pp.3–4 corresponds to published Theorem3.1. Read: §2 Theorem 2.1 and its valuation/specialization proof pp.3–4; not the later degree-48 argument.
- **LI-LIU:** [Chao Li and Yifeng Liu, *Chow groups and L-derivatives of automorphic motives for unitary groups*](https://www.math.columbia.edu/~chaoli/AIPF.pdf). Author manuscript dated 20 October 2021, 67 pages; Annals 194 (2021), 817–901 is the publication, whose pagination is not used here. Read: Introduction pp.2–8, Conjecture 1.1, Assumption 1.3, Theorems1.5 and1.7, Remark 1.10; Hypothesis 4.5 p.24; Hypothesis 6.6 p.30; §11 pp.51–53, proofs of Theorems1.5 and1.7.
- **IP:** [Atsushi Ichino and Kartik Prasanna, *Hodge classes and the Jacquet–Langlands correspondence*](https://arxiv.org/pdf/1806.10563v2). arXiv:1806.10563v2, author preprint; preprint pagination. Read: §2.1 p.12, compatible realization category and coefficient extension; §12.1 Definition 12.1 p.82, simultaneous Hodge–Tate classes.
- **BENOIST:** [Olivier Benoist, *The period-index problem for real surfaces*](https://www.math.ens.psl.eu/~benoist/articles/realperiodindex.pdf). Author manuscript; published PMIHÉS130 (2019),63–110; use section/proposition locators in the author copy. Read: Proof of Proposition 1.2 at end of §1, integral complex divisor algebraicity; Proof of Proposition 6.6 in §6.2, real divisor algebraicity; these are applications, not primary proofs of Lefschetz(1,1).
- **STACKS:** [The Stacks Project authors, *Weil Cohomology Theories*](https://stacks.math.columbia.edu/tag/0FH9). Online tags accessed 19 October 2026; stable tag locators instead of changing chapter pagination. Read: Tags0FH8 and0FH9, algebraic-extension kernel and rational-point smash nilpotence; tag0FH5 is a different lemma.

The71 MC.7 catalogue items are covered exactly once by the target-level `routedItems` inventory: 67 from Benoist–Wittenberg, one composite Li–Liu cycle-conjecture item, IP005 and the two Benoist divisor applications. IP003 belongs to the compatible-realization supplier. Out-of-scope MC.0/MC.2 and Zhu/Gleason–Lim–Xu MC.6 material is imported through the contracts, not duplicated here.

## Suggested file and acceptance

The [suggested file](../suggested/MotivesAndAlgebraicCycles--MC.7.lean) uses the actual pinned Hodge carrier. It contains one light inverse-image definition, two end-theorem signatures (diagonal membership and functoriality), and two proved Tate-line examples. The additional API and geometric targets above stay in this document until their real carriers exist. In particular no unspecified proposition field stands in for a missing conjecture, height, Chow group or motivic category.

The suggested file elaborated with `lean-check`, exit0, with only the two admitted-theorem warnings. The packet checker reports zero errors and warnings. Acceptance additionally requires the71-item routing bijection, the15-item inherited inventory, acyclic internal prerequisites, at least three discriminating tests per definition and the assembled six-planet selection. Closure requires discharging the16 requests and12 gaps above; the complete planning pass does not assert that closure.
