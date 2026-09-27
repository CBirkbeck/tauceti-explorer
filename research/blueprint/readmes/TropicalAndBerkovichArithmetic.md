# Berkovich spaces, tropical curves and nonarchimedean arithmetic

This roadmap builds the analytic points and topology that support skeletons, tropicalization and local arithmetic. Its first component is the spectrum of bounded multiplicative seminorms on a normed commutative ring. It has an explicit dependency chain to the pinned libraries, together with a suggested file that checks the types of its definitions, API and tests. The curve and tropicalization statements retained from the reviewed extraction have substantially more prerequisites. Their source content is preserved, their aggregate declarations are split, and their missing geometric inputs are recorded rather than assumed.

The packet remains partial across all eight stages. Eleven declarations in TB.0 form a component whose prerequisites terminate in the pinned baseline. No full stage is closed. In particular, compactness of a spectrum does not construct any point of it, compute a spectral radius, or produce a structure sheaf. Those distinctions matter to the perfectoid and adic consumers: they require nonemptiness, detection of units and a maximum formula as well as the topological space constructed here.

## Conventions and existing library

The spectrum component uses an arbitrary normed commutative unital ring A. It does not assume that A is complete, nontrivial, nonarchimedean, or an algebra over a field. Its points are real-valued multiplicative seminorms dominated by the norm. A point has value one at one. A multiplicative seminorm is allowed to kill nonzero elements, so its underlying algebraic carrier is Mathlib's MulRingSeminorm. Replacing it by a norm would delete valid points. Replacing it by an equivalence class of valuations would discard the numerical evaluations used in the topology and in tropical coordinates.

The norm of A need only be submultiplicative. For example, the maximum norm on a product of two real fields is not multiplicative: the two complementary idempotents have norm one and product zero. Both projection absolute values nevertheless are valid points. This is a useful regression case against an implementation that simply wraps the ambient norm or assumes every point has zero kernel.

Bounded means that one positive constant C works for all elements: p(a)≤C‖a‖. It does not mean that p is bounded as a function on A, nor does it mean an element-dependent constant. The native power-multiplicativity theorem turns this uniform bound into p(a)≤‖a‖. The packet therefore stores only a domination proof on the existing seminorm. It includes an adapter equating the two conventions, not a new proof of the general power trick.

The topology is induced from the product of real lines indexed by every element of A. Evaluation at all ring elements is essential. An initial topology built only from evaluations at scalars generally cannot distinguish points of an algebra. On a product ring, evaluating at (2,3) separates the two projection points even though they agree at the unit. This requirement also informs the correction recorded for the relative-spectrum definition in the Temkin preprint.

The suggested file uses the native product, induced topology, continuous maps, ring homomorphisms, compactness and separation classes. It introduces no substitute topological-space or valuation carrier. The point constructor, evaluations, extensionality and native-carrier comparison are named so consumers can work without unfolding the subtype. Topology, image equations, image closedness, compactness and Hausdorffness are separate declarations; this makes the proof graph inspectable.

The pinned commits are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Every baseline declaration listed in the packet was read in its source at the pin. The textual index was used only to locate declarations. The imported source files were checked against the pinned source tree and the installed Lean cache before compilation.

## Ownership and consumers

The accepted AUDIT-39 result and its independent review were read directly. The aggregate library-coverage file has no TB rows and still lists that audit as pending; this is an aggregation discrepancy, not evidence that no audit exists. The reviewed verdict treats all eight TB stages as not built, while identifying native seminorms, power tricks, valuations, adic spaces, graph infrastructure and algebraic curve results as partial inputs. The present component independently checks the seminorm and topology inputs it actually uses.

The two complete upstream documents used for style and boundaries are AdicSpaces and AnalyticToricGeometry. AdicSpaces explicitly excludes Berkovich spaces, while owning the adic spectra and foundational Huber constructions. Its Layer 2 supplies the adic side of the comparison; TB.0 must establish the normalized rank-one comparison and quotient topology. A rank-one generization existence result does not imply uniqueness, a canonical Berkovich map or the required quotient theorem.

AdicSpacesPartII already has a spectral-seminorm construction. This packet does not reproduce it. Its R3 consumer and the PerfectoidSpaces P1 packet request the spectrum for rings without a chosen base field, together with nonemptiness, unit detection and the spectral maximum. Those incoming requests explain the general ring scope of the new component. They remain unresolved until their spectral-theory proof leaves are supplied.

AdicSpacesPartII:R2/admissible-formal-scheme is imported by its exact node identifier. Its source statement covers possibly nonnoetherian rank-one valuation rings. Its generic-fibre comparison node was also read: that is an adic/rigid comparison and does not itself construct a Berkovich generic fibre. No duplicate formal-scheme or adic generic-fibre definition appears here.

SchemeAndStackFoundations has no packet at this snapshot. Requests therefore record the precise algebraic curve and model inputs at SF.3 and SF.4. Accepted RS-25 assigns the DVR stable-reduction results to StableReduction Layers 7–9. The analytic existence input used by BPR is over a possibly nondiscrete, nonnoetherian rank-one valuation ring. That extension must be scoped and made compatible with the existing owner; citing a DVR theorem as if it covered this ring would leave a real gap.

Toric geometry has a similar boundary. AnalyticToricGeometry Layer 0 owns its cones, fans, affine schemes and gluing, in a specification whose algebraic base is complex. The BPR statements use toric varieties over an arbitrary complete nonarchimedean K. The packet requests the common scheme interface and proposes a Part II for the missing general-base extension. This is a proposal, not an accepted reassignment. TB.4 and TB.5 retain tropical multiplicities and analytic comparison, not a second cone/fan library.

The atlas links and touching link entries were screened. The direct analytic consumer ArithmeticDynamics DY.2 uses TB.0, while DY.4 uses TB.6's local measures. Global heights, arithmetic dynamical limits and equidistribution keep their current owners. The Tate elliptic curve and point-level uniformization belong to EllipticCurves Layer 4. A rescope proposal makes TB.7 import these objects and build the actual skeleton-period and integration comparisons. General abelian uniformization and Coleman primitives are also imported from their owners.

## TB.0 — bounded points and their topology

The logical order is carrier, boundedness adapter and topology; evaluation embedding and image equations; closedness of the image; compactness and separation; contravariant pullback and the normed-field specialization. The carrier and topological proofs do not need completeness. A future nonemptiness theorem must introduce the exact Banach hypotheses its source proof uses rather than adding them gratuitously to every definition.

To prove compactness, use the product of intervals [0,‖a‖]. Tychonoff makes this product compact. Multiplication, the triangle inequality, negation, zero, one and nonnegativity are closed coordinate conditions, so the seminorm image is closed inside that compact product. The evaluation map is an embedding by extensionality; compactness transfers back to the spectrum. This argument even handles the empty zero-ring spectrum. It does not use a spectral maximum theorem and therefore cannot prove one by circular reasoning.

Pullback along f:A→B is x↦x∘f. Its norm bound initially has the boundedness constant of f; the native power trick removes that constant. Continuity then follows one evaluation at a time. The functor is contravariant, so compositions must be written in the reversed order. The API also records independence of the boundedness proof: a different witness is not a different map.

For a normed field K, its norm defines a point. Any other point agrees with it: for nonzero a, multiply the upper bounds at a and its inverse, using p(a)p(a inverse)=1. The inverse bound forces the missing lower bound. Completeness is unnecessary for this elementary argument. This supplies the scalar-value constraint for bounded algebra maps once those maps are in scope, without introducing a competing absolute-value representation.

### Berkovich spectrum

Identifier: TropicalAndBerkovichArithmetic:TB.0/spectrum.

For a normed commutative unital ring A, M(A) is the subtype of native MulRingSeminorm A consisting of p with p(a) ≤ ‖a‖ for every a. Points are actual real-valued seminorms, not equivalence classes. Completeness, a base field, multiplicativity of the ambient norm and a nonarchimedean norm are not required for this carrier.


Construction or proof plan:

1. Take the norm-dominated subtype of the existing seminorm carrier; retain its function coercion through the named evaluation projection. The native carrier already supplies positivity, zero, negation, triangle inequality, one and multiplication.


Public API:

- TauCeti.Berkovich.Spectrum.toSeminorm — Forget only the domination proof, retaining the native MulRingSeminorm.
- TauCeti.Berkovich.Spectrum.eval — For x in M(A) and a in A, return x(a) in ℝ.
- TauCeti.Berkovich.Spectrum.ofSeminorm — A native multiplicative seminorm p with a pointwise norm bound gives a point.
- TauCeti.Berkovich.Spectrum.ofSeminorm_eval — Evaluating the constructed point at a returns p(a).
- TauCeti.Berkovich.Spectrum.ext — Points with equal values at every a in A are equal.
- TauCeti.Berkovich.Spectrum.eval_zero — Every point has value zero at zero.
- TauCeti.Berkovich.Spectrum.eval_one — Every point has value one at one.
- TauCeti.Berkovich.Spectrum.eval_mul — x(ab)=x(a)x(b).
- TauCeti.Berkovich.Spectrum.eval_neg — x(−a)=x(a).
- TauCeti.Berkovich.Spectrum.eval_add_le — x(a+b)≤x(a)+x(b).
- TauCeti.Berkovich.Spectrum.eval_nonneg — 0≤x(a).
- TauCeti.Berkovich.Spectrum.eval_le_norm — x(a)≤‖a‖.


Definition tests:

- TauCeti.Berkovich.Spectrum.zeroRing_empty — M(A) is empty when A is a subsingleton normed ring.
- TauCeti.Berkovich.Spectrum.zeroFunction_excluded — No point takes value zero at every a.
- TauCeti.Berkovich.Spectrum.native_compatibility — Forgetting the bound on the point made from p returns exactly p.
- TauCeti.Berkovich.Spectrum.nonmultiplicative_product_norm — The maximum norm on ℝ×ℝ is not multiplicative: use (1,0) and (0,1).


Acceptance:

- The zero ring has no point because one must map to one and zero to zero.
- The zero function is excluded.
- On the product of two real fields, the two projection seminorms are distinct; the ambient maximum norm itself is not multiplicative.


Dependencies: mathlib:MulRingSeminorm, mathlib:MulRingSeminorm.ext.


Source: temkin-2011, Definition 2.2.2.1(i), p. 6; Definition/Exercise 2.1.2.1(i), p. 4. The source uses bounded points for Banach rings. The bounded-iff-dominated node proves equality with this presentation; this carrier needs no completion.


### Bounded points are norm dominated

Identifier: TropicalAndBerkovichArithmetic:TB.0/bounded-iff-dominated.

For p in native MulRingSeminorm A, there is a constant C>0 with p(a)≤C‖a‖ for all a if and only if p(a)≤‖a‖ for all a.


Construction or proof plan:

1. Apply the native contraction theorem to the identity ring map, the norm ring seminorm, and the multiplicative function p. Native preservation of powers supplies power multiplicativity.
2. For the reverse direction choose C=1. This is an adapter, not a second power-trick theorem.


Acceptance:

- A different positive bound C produces the same point subtype.
- A point need not be bounded as a real-valued function on all of A.


Dependencies: mathlib:RingHom.IsBoundedWrt, mathlib:normRingSeminorm, mathlib:IsPowMul, mathlib:map_pow, mathlib:contraction_of_isPowMul_of_boundedWrt.


Source: temkin-2011, Definition 2.2.2.1(i), p. 6. Identifies the source boundedness convention with the chosen subtype; the proof is the pinned library theorem.


### Topology of pointwise convergence

Identifier: TropicalAndBerkovichArithmetic:TB.0/evaluation-topology.

Equip M(A) with the topology induced by x↦(a↦x(a)) into the full product ℝ^A. Thus continuity into M(A) is equivalent to continuity of every evaluation coordinate.


Construction or proof plan:

1. Use the native induced topology on the native function product.
2. Apply the inducing-map continuity criterion, followed by coordinatewise continuity into a product.


Public API:

- TauCeti.Berkovich.Spectrum.topology — The topology is induced by the full evaluation map M(A)→ℝ^A.
- TauCeti.Berkovich.Spectrum.continuous_eval — Evaluation at each a is continuous.
- TauCeti.Berkovich.Spectrum.continuous_iff — For any topological Z, f:Z→M(A) is continuous exactly when each z↦f(z)(a) is continuous.
- TauCeti.Berkovich.Spectrum.topology_eq_induced — The topology agrees with the native induced topology from ℝ^A.


Definition tests:

- TauCeti.Berkovich.Spectrum.topology_zero_coordinate — Evaluation at zero is continuous.
- TauCeti.Berkovich.Spectrum.topology_product_coordinates — For a,b in A the map x↦(x(a),x(b)) is continuous into ℝ².
- TauCeti.Berkovich.Spectrum.topology_all_coordinates — Coordinatewise continuous maps into M(A) are continuous.
- TauCeti.Berkovich.Spectrum.topology_distinguishes_projections — An open set contains the first projection point of ℝ×ℝ and excludes the second; evaluation at (2,3) separates them.


Acceptance:

- Evaluations at zero and one are continuous constants.
- The two projection points of ℝ×ℝ have disjoint separating neighborhoods.


Dependencies: TropicalAndBerkovichArithmetic:TB.0/spectrum, mathlib:Topology.IsInducing.continuous_iff, mathlib:continuous_pi, mathlib:continuous_apply.


Source: temkin-2011, Definition 2.2.2.1(i), p. 6. The initial topology for evaluation at every element of A.


### The evaluation map is an embedding

Identifier: TropicalAndBerkovichArithmetic:TB.0/evaluation-embedding.

The evaluation map M(A)→ℝ^A is a topological embedding.


Construction or proof plan:

1. The topology is induced by definition. Native seminorm extensionality and subtype extensionality prove injectivity.


Acceptance:

- Equality of coordinates cannot identify two distinct points.


Dependencies: TropicalAndBerkovichArithmetic:TB.0/spectrum, TropicalAndBerkovichArithmetic:TB.0/evaluation-topology, mathlib:MulRingSeminorm.ext, mathlib:Topology.IsEmbedding.


Source: temkin-2011, Definition 2.2.2.1(i), p. 6. The explicit induced-topology embedding is the library formulation of the definition.


### Equations for the evaluation image

Identifier: TropicalAndBerkovichArithmetic:TB.0/evaluation-range.

The image of M(A) in ℝ^A is exactly the functions v satisfying v(0)=0, v(1)=1, v(−a)=v(a), v(a+b)≤v(a)+v(b), v(ab)=v(a)v(b), and 0≤v(a)≤‖a‖ for all a,b.


Construction or proof plan:

1. Unpack a spectrum point to obtain the listed laws.
2. Conversely bundle the additive group seminorm laws and multiplicative zero-preserving unital homomorphism laws into the existing MulRingSeminorm, then attach domination.


Acceptance:

- The zero function violates the one equation; the product maximum norm violates multiplication.


Dependencies: TropicalAndBerkovichArithmetic:TB.0/spectrum, mathlib:MulRingSeminorm.


Source: temkin-2011, Definition/Exercise 2.1.2.1(i), p. 4; Definition 2.2.2.1(i), p. 6. Native-carrier expansion used only to prove the image description.


### Closedness of the evaluation image

Identifier: TropicalAndBerkovichArithmetic:TB.0/closed-evaluation-range.

The image of M(A) in ℝ^A is closed.


Construction or proof plan:

1. Express the image as the intersection of the equalities and inequalities of evaluation-range.
2. Coordinate evaluation, real addition and real multiplication are continuous. Each equality is closed by the Hausdorff equality theorem; each inequality is closed by the real order theorem. Intersect over all elements and pairs.


Acceptance:

- One uses non-strict inequalities; imposing strict positivity on all nonzero elements would fail closedness.


Dependencies: TropicalAndBerkovichArithmetic:TB.0/evaluation-range, mathlib:continuous_apply, mathlib:isClosed_eq, mathlib:isClosed_le, mathlib:isClosed_iInter.


Source: temkin-2011, Fact 2.2.2.3(i), p. 7. This is the explicit topological proof step for the compactness statement; supplied here from native closed-set lemmas.


### Compactness of the Berkovich spectrum

Identifier: TropicalAndBerkovichArithmetic:TB.0/compact-spectrum.

M(A) is compact for every normed commutative ring A, even without completeness or nontriviality.


Construction or proof plan:

1. The image lies in the product of compact real intervals [0,‖a‖]. Tychonoff makes that product compact.
2. Closedness of the image makes it a compact subset of this product. Reflect compactness along the evaluation embedding. No nonemptiness argument is used.


Acceptance:

- M(ℝ×ℝ) is compact although its ambient norm is not multiplicative.
- The empty spectrum of a zero ring is compact.


Dependencies: TropicalAndBerkovichArithmetic:TB.0/evaluation-embedding, TropicalAndBerkovichArithmetic:TB.0/closed-evaluation-range, mathlib:isCompact_pi_infinite, mathlib:CompactIccSpace, mathlib:IsCompact.of_isClosed_subset, mathlib:Topology.IsEmbedding.isCompact_iff.


Source: temkin-2011, Fact 2.2.2.3(i), p. 7. Proves the compactness assertion in a stronger generality; the nonemptiness assertion is not included.


### Hausdorffness of the Berkovich spectrum

Identifier: TropicalAndBerkovichArithmetic:TB.0/hausdorff-spectrum.

M(A) is Hausdorff.


Construction or proof plan:

1. The real product is Hausdorff and the evaluation map is an embedding.


Acceptance:

- Projection points on ℝ×ℝ are separated using evaluation at (2,3).


Dependencies: TropicalAndBerkovichArithmetic:TB.0/evaluation-embedding, mathlib:Pi.t2Space, mathlib:Topology.IsEmbedding.t2Space.


Source: temkin-2011, Definition 2.2.2.1(i), p. 6. Point separation follows from distinct real-valued seminorms having different coordinates.


### Pullback of Berkovich points

Identifier: TropicalAndBerkovichArithmetic:TB.0/comap.

For normed commutative rings A,B and a bounded unital ring homomorphism f:A→B, construct the continuous map M(f):M(B)→M(A), given by M(f)(x)(a)=x(f(a)).


Construction or proof plan:

1. Compose the native seminorm laws with the ring map. If ‖f(a)‖≤C‖a‖, then x(f(a))≤C‖a‖. Apply bounded-iff-dominated to the composed seminorm.
2. For continuity test each a-coordinate, which is evaluation at f(a). Identity and reversed composition follow by pointwise extensionality.


Public API:

- TauCeti.Berkovich.Spectrum.comap_eval — M(f)(x)(a)=x(f(a)).
- TauCeti.Berkovich.Spectrum.comap_id — M(id)(x)=x.
- TauCeti.Berkovich.Spectrum.comap_comp — M(g∘f)(x)=M(f)(M(g)(x)).
- TauCeti.Berkovich.Spectrum.comap_continuous — The map is continuous for the evaluation topologies.
- TauCeti.Berkovich.Spectrum.comap_proof_irrel — Changing the proof of boundedness does not change the continuous map.


Definition tests:

- TauCeti.Berkovich.Spectrum.comap_first_projection — Pull the real norm back along the first projection ℝ×ℝ→ℝ: its value at (2,3) is 2.
- TauCeti.Berkovich.Spectrum.comap_second_projection — Pull back along the second projection: its value at (2,3) is 3.
- TauCeti.Berkovich.Spectrum.comap_id_real — Pulling the real norm point back along the identity fixes it.
- TauCeti.Berkovich.Spectrum.comap_distinguishes_projections — The first and second projection pullbacks are distinct.


Acceptance:

- Contravariance reverses f:A→B and g:B→D: M(g∘f)=M(f)∘M(g).
- Do not assume an arbitrary continuous ring homomorphism is bounded.


Dependencies: TropicalAndBerkovichArithmetic:TB.0/spectrum, TropicalAndBerkovichArithmetic:TB.0/bounded-iff-dominated, TropicalAndBerkovichArithmetic:TB.0/evaluation-topology, mathlib:RingHom.IsBounded, mathlib:MulRingSeminorm.


Source: temkin-2011, Exercise 2.2.2.4(i), p. 7. Contravariant continuous functor on bounded homomorphisms; completeness is unused.


### The norm point of a valued field

Identifier: TropicalAndBerkovichArithmetic:TB.0/field-norm-point.

For a normed field K, its native absolute-value norm defines a distinguished point ν_K of M(K), with ν_K(a)=‖a‖. No completeness or nontrivial valuation hypothesis is needed.


Construction or proof plan:

1. Combine the native norm homomorphism with the native additive seminorm laws; the required upper bound is equality.


Public API:

- TauCeti.Berkovich.Spectrum.normPoint_eval — ν_K(a)=‖a‖.
- TauCeti.Berkovich.Spectrum.normPoint_toMonoidWithZeroHom — The underlying native multiplicative map of ν_K is normHom.
- TauCeti.Berkovich.Spectrum.normPoint_eq_ofSeminorm — Any native seminorm point whose function equals the norm is ν_K.


Definition tests:

- TauCeti.Berkovich.Spectrum.normPoint_two — ν_ℝ(2)=2.
- TauCeti.Berkovich.Spectrum.normPoint_zero — ν_ℝ(0)=0.
- TauCeti.Berkovich.Spectrum.normPoint_inverse — ν_ℝ(2 inverse)=1/2.


Acceptance:

- The real norm point has values 0,2,1/2 on 0,2,2 inverse.


Dependencies: TropicalAndBerkovichArithmetic:TB.0/spectrum, mathlib:normHom, mathlib:MulRingSeminorm.


Source: temkin-2011, Definitions 2.1.2.1(i) and 2.2.2.1(i), pp. 4, 6. Specialization to the multiplicative norm of a field.


### The spectrum of a normed field is a singleton

Identifier: TropicalAndBerkovichArithmetic:TB.0/field-spectrum-singleton.

For any normed field K, every point of M(K) equals ν_K.


Construction or proof plan:

1. For a=0 equality is forced. For a≠0, multiplicativity gives p(a)p(a inverse)=1.
2. Use p(a)≤‖a‖ and p(a inverse)≤‖a inverse‖=‖a‖ inverse to obtain the reverse inequality p(a)≥‖a‖. Apply extensionality.


Acceptance:

- Every point of M(ℝ) takes value 3 at −3.
- A power of the real absolute value with exponent strictly between zero and one fails domination near zero.


Dependencies: TropicalAndBerkovichArithmetic:TB.0/field-norm-point, TropicalAndBerkovichArithmetic:TB.0/spectrum.


Source: temkin-2011, Definition 2.2.2.1(i), p. 6. Elementary consequence of the bounded multiplicative point definition, proved here with explicit inverse bounds.


## TB.2 — retained curve structure targets

The curve convention is fixed in every statement: K is algebraically closed, complete and nontrivially rank-one valued; X is a smooth connected algebraic curve, X̂ its smooth proper completion, and D its punctures. Valuation and absolute value are related by |a|=exp(−val(a)). Annular lengths use this logarithmic normalization. The curve theory must allow loop edges, multiple edges, rays and vertex genera. Neither a simple graph nor the genus of a bare graph recovers all curve information.

The four inherited extraction identifiers are retained. The vertex-set aggregate is narrowed to one definition; its skeleton, boundary and characterization results have their own nodes. The inherited retraction identifier now names the construction, with continuity and connectedness separate. The stable-reduction identifier retains the existence assertion, with minimal-skeleton and stable-vertex conclusions split off. Each statement below ends in the recorded analytic/model gaps rather than claiming a closed chain.

These geometric definitions and their tests cannot yet be stated faithfully against the missing analytic carriers. The suggested file explicitly omits them. An arbitrary type equipped with proposition fields asserting the desired geometry would not establish a usable blueprint signature. The mathematical API and tests are retained here so a continuation can implement the true interfaces once the carriers are available.

### Semistable vertex set

Identifier: TropicalAndBerkovichArithmetic:TB.2/semistable-vertex-sets-and-skeleta.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. A semistable vertex set is a finite set V of type-2 points of X̂^an whose complement is a disjoint union of open balls and finitely many open annuli, with the punctures in distinct open-ball components. This inherited identifier now retains only the vertex-set definition.


Construction or proof plan:

1. Use the native algebraic curve and its missing Berkovich analytification, with the TB.1 analytic ball and annulus classifications.
2. Specify the decomposition as a property of V, without choosing an enumeration of infinitely many ball components.


Public API:

- TauCeti.Berkovich.Curve.SemistableVertexSet.points — Return the finite subset V of type-2 points.
- TauCeti.Berkovich.Curve.SemistableVertexSet.ext — Equal finite subsets define equal vertex sets.
- TauCeti.Berkovich.Curve.SemistableVertexSet.ofDecomposition — A finite type-2 subset with the stated decomposition and puncture separation gives a vertex set.
- TauCeti.Berkovich.Curve.SemistableVertexSet.punctures_separated — Distinct punctures lie in distinct complementary ball components.


Definition tests:

- TauCeti.Berkovich.Curve.vertexSet_unpunctured — For D empty the puncture condition is vacuous.
- TauCeti.Berkovich.Curve.vertexSet_sameBall_rejected — Two punctures in one complementary ball prevent semistability for the punctured curve.
- TauCeti.Berkovich.Curve.vertexSet_loop_allowed — A complementary annulus may have both boundary ends at the same vertex; a simple-graph restriction would reject valid examples.


Acceptance:

- Two punctures in one complementary ball invalidate the candidate.


Dependencies: TropicalAndBerkovichArithmetic:TB.0, TropicalAndBerkovichArithmetic:TB.1, SchemeAndStackFoundations:SF.3.


Source: bpr-structure-published, Definition 3.1, printed p. 101; arXiv p. 7. Refines the reviewed extraction; published passages collated.


### Skeleton of a semistable decomposition

Identifier: TropicalAndBerkovichArithmetic:TB.2/skeleton.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. For a semistable V, define Σ(X,V) as V union the intrinsic skeleta of the generalized open annulus components of X^an minus V. A punctured ball contributes a ray. Its completed skeleton is the closure in X̂^an.


Construction or proof plan:

1. Take the union in the analytic point space using TB.1 annulus skeleta.
2. Define the completed-skeleton accessor by closure; equality with Σ union D is proved separately.


Public API:

- TauCeti.Berkovich.Curve.skeleton_mem — Membership means being a vertex or a point of a complementary annulus skeleton.
- TauCeti.Berkovich.Curve.skeleton_vertex_mem — Every vertex is in Σ.
- TauCeti.Berkovich.Curve.completedSkeleton — The closure of Σ in X̂^an.
- TauCeti.Berkovich.Curve.skeleton_no_annuli — If there are no generalized annulus components, Σ=V.


Definition tests:

- TauCeti.Berkovich.Curve.skeleton_noAnnuli — No annulus components implies Σ=V.
- TauCeti.Berkovich.Curve.skeleton_annulusInterior — An intrinsic annulus-skeleton point is in Σ even when not in V.
- TauCeti.Berkovich.Curve.skeleton_puncture — A puncture is in the completed skeleton and is not in Σ.


Acceptance:

- A puncture belongs to the completed skeleton but not to X^an.


Dependencies: TropicalAndBerkovichArithmetic:TB.2/semistable-vertex-sets-and-skeleta, TropicalAndBerkovichArithmetic:TB.1.


Source: bpr-structure-published, Definitions 3.3 and 3.5, printed pp. 102–103. Refines the reviewed extraction; published passages collated.


### Limit boundaries of semistable components

Identifier: TropicalAndBerkovichArithmetic:TB.2/component-limit-boundary.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. An open-ball component has one boundary vertex. An open annulus of modulus r has its skeleton parametrization extending continuously from (0,r) to [0,r], with both ends in V, possibly equal. A punctured ball has the extension [0,∞] with one end in V and one in D.


Construction or proof plan:

1. BPR Proposition 2.10 yields limits of regular-function norms as logarithmic radius tends to zero.
2. Lemma 2.13 gives constant norms off the annular skeleton; use a zero-free collar to check endpoint continuity, then compactness.
3. Apply the same endpoint argument at both annulus ends or at the puncture. These parts share one proof. The cited TB.1 inputs remain gaps.


Acceptance:

- A loop annulus has equal endpoint images.


Dependencies: TropicalAndBerkovichArithmetic:TB.2/semistable-vertex-sets-and-skeleta, TropicalAndBerkovichArithmetic:TB.0, TropicalAndBerkovichArithmetic:TB.1.


Source: bpr-structure-published, Lemma 3.2 with proof, printed pp. 101–102. Refines the reviewed extraction; published passages collated.


### Ball components off the skeleton

Identifier: TropicalAndBerkovichArithmetic:TB.2/skeleton-complement-balls.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. Every component B of X^an minus Σ is an open ball with a singleton limit boundary in Σ.


Construction or proof plan:

1. Combine the component boundary lemma with BPR Lemma 2.12 for an annulus minus its intrinsic skeleton.


Acceptance:

- The boundary point may lie in an edge interior, not in V.


Dependencies: TropicalAndBerkovichArithmetic:TB.2/skeleton, TropicalAndBerkovichArithmetic:TB.2/component-limit-boundary, TropicalAndBerkovichArithmetic:TB.1.


Source: bpr-structure-published, Lemma 3.4(3), printed p. 102. Refines the reviewed extraction; published passages collated.


### Closure and punctures of the skeleton

Identifier: TropicalAndBerkovichArithmetic:TB.2/completed-skeleton-boundary.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. Σ is closed in X^an, its limit boundary in X̂^an is D, and its closure is Σ union D. It is compact exactly when D is empty.


Construction or proof plan:

1. Use the finitely many segments and rays with their endpoint extensions.
2. For D empty the union is compact; any omitted puncture is a limit point preventing compactness in the Hausdorff proper analytification.


Acceptance:

- A punctured-ball ray is not compact, and its added endpoint is not at finite path distance.


Dependencies: TropicalAndBerkovichArithmetic:TB.2/skeleton, TropicalAndBerkovichArithmetic:TB.2/component-limit-boundary, TropicalAndBerkovichArithmetic:TB.0.


Source: bpr-structure-published, Lemma 3.4(1)–(2), Definition 3.5, printed pp. 102–103. Refines the reviewed extraction; published passages collated.


### Disc characterization of the skeleton

Identifier: TropicalAndBerkovichArithmetic:TB.2/skeleton-disc-characterization.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. Σ consists of the points admitting no affinoid neighborhood isomorphic to a closed unit ball and disjoint from V.


Construction or proof plan:

1. Off Σ, use the complementary open ball.
2. For x in Σ outside V, any connected candidate neighborhood disjoint from V stays in the same annulus component. Apply BPR Proposition 2.4.


Acceptance:

- The disjointness from V cannot be omitted in the connected-neighborhood argument.


Dependencies: TropicalAndBerkovichArithmetic:TB.2/skeleton, TropicalAndBerkovichArithmetic:TB.2/skeleton-complement-balls, TropicalAndBerkovichArithmetic:TB.1.


Source: bpr-structure-published, Lemma 3.4(4), printed pp. 102–103. Refines the reviewed extraction; published passages collated.


### Retraction onto the skeleton

Identifier: TropicalAndBerkovichArithmetic:TB.2/retraction-to-the-skeleton.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. Define τ_V:X^an→Σ to fix Σ and send every other point to the unique boundary point of its complementary open-ball component. Continuity is a separate lemma.


Construction or proof plan:

1. Use the unique boundary supplied by skeleton-complement-balls, and the identity on Σ.


Public API:

- TauCeti.Berkovich.Curve.retraction_on_skeleton — τ_V fixes Σ pointwise.
- TauCeti.Berkovich.Curve.retraction_on_ball — τ_V is constant on each complementary ball with value its boundary point.
- TauCeti.Berkovich.Curve.retraction_surjective — Every point of Σ is attained.
- TauCeti.Berkovich.Curve.retraction_unique — These skeleton and ball evaluation laws determine the map.


Definition tests:

- TauCeti.Berkovich.Curve.retraction_vertex — τ_V(v)=v for a vertex.
- TauCeti.Berkovich.Curve.retraction_edgeInterior — An edge-interior point is fixed rather than rounded to a vertex.
- TauCeti.Berkovich.Curve.retraction_sameBall — Two points in one off-skeleton ball have the same image.


Acceptance:

- An edge-interior point is fixed.


Dependencies: TropicalAndBerkovichArithmetic:TB.2/skeleton, TropicalAndBerkovichArithmetic:TB.2/skeleton-complement-balls.


Source: bpr-structure-published, Definition 3.7, printed p. 103. Refines the reviewed extraction; published passages collated.


### Continuity of skeletal retraction

Identifier: TropicalAndBerkovichArithmetic:TB.2/continuous-retraction.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. τ_V is continuous and restricts on each complementary generalized annulus to its intrinsic retraction.


Construction or proof plan:

1. The annulus assertion follows from BPR Lemma 2.12.
2. Supply the vertex-neighborhood proof left as an exercise in Lemma 3.8. This is an unresolved proof input; continuity on the complementary components alone is insufficient.


Acceptance:

- Check vertices with infinitely many attached balls.


Dependencies: TropicalAndBerkovichArithmetic:TB.2/retraction-to-the-skeleton, TropicalAndBerkovichArithmetic:TB.1.


Source: bpr-structure-published, Lemma 3.8, printed p. 103. Refines the reviewed extraction; published passages collated.


### Connectedness of the skeleton

Identifier: TropicalAndBerkovichArithmetic:TB.2/connected-skeleton.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. Both Σ and its completed skeleton are connected.


Construction or proof plan:

1. Use connectedness of X^an and surjectivity of τ_V, then connectedness of the closure. Analytic connectedness remains an open named input.


Acceptance:

- Completing puncture ends does not create an extra connected component.


Dependencies: TropicalAndBerkovichArithmetic:TB.2/continuous-retraction, TropicalAndBerkovichArithmetic:TB.2/completed-skeleton-boundary, TropicalAndBerkovichArithmetic:TB.0.


Source: bpr-structure-published, Proposition 3.9, printed p. 103. Refines the reviewed extraction; published passages collated.


### Existence of a semistable vertex set

Identifier: TropicalAndBerkovichArithmetic:TB.2/stable-reduction-and-minimal-skeleta.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. X has a semistable vertex set. This inherited identifier now records the existence part of Theorem 4.22.


Construction or proof plan:

1. Import the analytic semistable reduction theorem over the possibly nonnoetherian rank-one valuation ring, as in BL85 Theorem 7.1; request the extension beyond the DVR stable-reduction owner.
2. Use the model-to-vertex correspondence of BPR Theorem 4.11.
3. Separate punctures by Proposition 3.13(3), whose proof was read but whose annular inputs remain open.


Acceptance:

- The punctured case needs refinement, not an arbitrary vertex addition.


Dependencies: TropicalAndBerkovichArithmetic:TB.2/semistable-vertex-sets-and-skeleta, AdicSpacesPartII:R2/admissible-formal-scheme, SchemeAndStackFoundations:SF.4.


Source: bpr-structure-published, Theorem 4.22, printed p. 112. Refines the reviewed extraction; published passages collated.


### Intrinsic minimal skeleton

Identifier: TropicalAndBerkovichArithmetic:TB.2/intrinsic-minimal-skeleton.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. If χ(X)=2−2g(X̂)−#D≤0 and V is inclusion-minimal, Σ(X,V) is the locus with no affinoid neighborhood isomorphic to the closed unit ball.


Construction or proof plan:

1. Use genus-zero contractions (BPR Proposition 4.21) and refinement (3.13).
2. The source reduces a forbidden closed-ball intersection to a tree with a low-valence genus-zero vertex. The contraction, genus and neighborhood inputs require decomposition.


Acceptance:

- The χ≤0 restriction excludes the unpunctured projective line.


Dependencies: TropicalAndBerkovichArithmetic:TB.2/stable-reduction-and-minimal-skeleta, TropicalAndBerkovichArithmetic:TB.2/skeleton-disc-characterization, TropicalAndBerkovichArithmetic:TB.2/continuous-retraction.


Source: bpr-structure-published, Theorem 4.22(1), printed p. 112. Refines the reviewed extraction; published passages collated.


### Stable vertices of a hyperbolic curve

Identifier: TropicalAndBerkovichArithmetic:TB.2/stable-vertex-characterization.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. For χ(X)<0 and inclusion-minimal V, V is stable and equals the points of Σ of valence at least three or positive vertex genus. The genus of a type-2 point is the genus of the smooth proper curve over the residue field with function field the residue field of its completed residue field.


Construction or proof plan:

1. Apply the genus-zero contractions in Proposition 4.21.
2. The residue-curve genus and model-comparison proofs are open inputs. The strict Euler-characteristic condition is retained.


Acceptance:

- A positive-genus vertex remains even at valence below three.


Dependencies: TropicalAndBerkovichArithmetic:TB.2/stable-reduction-and-minimal-skeleta, TropicalAndBerkovichArithmetic:TB.2/skeleton.


Source: bpr-structure-published, Definition 4.20 and Theorem 4.22(2), printed pp. 111–112. Refines the reviewed extraction; published passages collated.


### Uniqueness of the minimal skeleton

Identifier: TropicalAndBerkovichArithmetic:TB.2/unique-minimal-skeleton.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. For χ(X)≤0 there is a unique set-theoretic minimal skeleton.


Construction or proof plan:

1. A finite vertex set has a minimal subset, and the intrinsic description is independent of that choice.


Acceptance:

- A Tate curve has one minimal circle but many minimal one-point vertex sets.


Dependencies: TropicalAndBerkovichArithmetic:TB.2/intrinsic-minimal-skeleton.


Source: bpr-structure-published, Corollary 4.23, printed p. 112. Refines the reviewed extraction; published passages collated.


### Uniqueness of stable vertices

Identifier: TropicalAndBerkovichArithmetic:TB.2/unique-stable-vertex-set.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. For χ(X)<0 there is a unique stable vertex set.


Construction or proof plan:

1. Use the intrinsic skeleton and its valence-or-genus characterization. Also establish that stable sets are minimal in this range using the contraction theory; that input remains open.


Acceptance:

- Do not apply the assertion to a Tate curve with χ=0.


Dependencies: TropicalAndBerkovichArithmetic:TB.2/unique-minimal-skeleton, TropicalAndBerkovichArithmetic:TB.2/stable-vertex-characterization.


Source: bpr-structure-published, Corollary 4.23, printed p. 112. Refines the reviewed extraction; published passages collated.


## TB.4 — retained tropical multiplicity targets

The tropical multiplicity and coordinate-slope formulas came from the inherited TB.5 aggregate, but are recorded here under their owning stage. A tropicalization is more than its underlying set. Initial degenerations, component multiplicities and lattice indices must remain visible. The formula gives a finite sum of expansion factors, not a count of topological preimages. Its proof needs the body of the BPR paper and the algebraic supplier; the introduction has only been used to pin the target statement.

### Tropical multiplicity formula for curves

Identifier: TropicalAndBerkovichArithmetic:TB.4/tropical-multiplicity-formula.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. After suitable subdivision, each tropical edge e′ has finitely many embedded segments e_i of H° mapping homeomorphically onto it. Other segments disjoint from these in its preimage are contracted. Its multiplicity is the sum of their positive integral expansion factors. Initial-degeneration components are counted with scheme multiplicities.


Construction or proof plan:

1. Read and decompose Proposition 5.4, Theorem 5.8 and Corollary 5.9, including finite-map multiplicities and initial degenerations. These proof bodies remain unread.


Acceptance:

- Factors 2 and 3 contribute multiplicity 5, not 2.


Dependencies: TropicalAndBerkovichArithmetic:TB.3, TropicalAndBerkovichArithmetic:TB.0, SchemeAndStackFoundations:SF.0.


Source: bpr-tropicalization-2016, Theorem 1.3, arXiv pp. 2–3. Reviewed introduction statement; proof bodies remain open.


### Expansion factors from coordinate slopes

Identifier: TropicalAndBerkovichArithmetic:TB.4/expansion-factor-gcd.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. For an affine curve embedded in a torus by invertible regular functions f_i, the expansion factor on an affine edge is the gcd of the absolute values of the integral slopes of log|f_i|. An all-zero slope tuple gives factor zero and a contracted edge.


Construction or proof plan:

1. The index of the coordinate-slope vector in its primitive lattice direction is the gcd.
2. Identifying this index with the analytic and tropical lengths requires the missing metric and slope framework.


Acceptance:

- Slopes (−2,4) give factor 2; (0,0) gives zero.


Dependencies: TropicalAndBerkovichArithmetic:TB.3.


Source: bpr-tropicalization-2016, Introduction, arXiv p. 3, pointing to Remark 5.6. Reviewed introduction statement; proof bodies remain open.


## TB.5 — retained faithful tropicalization targets

Faithful tropicalization is an existence and refinement theorem. A selected embedding can contract edges or multiply their lengths, and a new embedding must repair that behavior. The space H° consists of non-leaves: excluding classical points alone would still leave type-4 points, contrary to the source. The target is an isometry of the finite subgraph onto its tropical image with their length metrics. The multiplicity-one criterion includes generic reducedness at every point of the tropical subgraph. The edge formula does not on its own supply the vertex gluing argument.

### Faithful tropicalization of a finite subgraph

Identifier: TropicalAndBerkovichArithmetic:TB.5/faithful-tropicalization-and-expansion-factors.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. Every finite embedded Γ in H°(X^an) admits a closed embedding of X into a quasiprojective toric K-variety meeting its dense torus T such that Γ maps isometrically onto its tropical image. Metrics are the subgraph length metrics. H° is the non-leaf locus, excluding classical and type-4 points. This identifier now retains the existence part of Theorem 1.1.


Construction or proof plan:

1. Read BPR tropicalization §§4–6 for rational functions, multiplicities and faithful refinement; the introduction supplies no proof leaves.
2. Import toric embeddings from the algebraic owner and resolve the arbitrary-field scope extension.


Acceptance:

- A plane embedding can contract a Tate loop; faithfulness is not automatic.


Dependencies: TropicalAndBerkovichArithmetic:TB.3, TropicalAndBerkovichArithmetic:TB.4, TropicalAndBerkovichArithmetic:TB.2/skeleton, SchemeAndStackFoundations:SF.0.


Source: bpr-tropicalization-2016, Theorem 1.1, arXiv p. 2. Reviewed introduction statement; proof bodies remain open.


### Faithfulness under domination

Identifier: TropicalAndBerkovichArithmetic:TB.5/faithful-domination.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. Embeddings faithful on a fixed Γ are stable under domination by equivariant toric maps and cofinal among toric embeddings meeting the dense torus.


Construction or proof plan:

1. Decompose the domination relation, common dominating embeddings and stability proof from BPR §5.15.


Acceptance:

- Lengths are measured within the image subgraph, not via shortcuts in the entire tropicalization.


Dependencies: TropicalAndBerkovichArithmetic:TB.5/faithful-tropicalization-and-expansion-factors, TropicalAndBerkovichArithmetic:TB.4.


Source: bpr-tropicalization-2016, Theorem 1.1 and following paragraph, arXiv p. 2. Reviewed introduction statement; proof bodies remain open.


### Multiplicity-one isometry criterion

Identifier: TropicalAndBerkovichArithmetic:TB.5/multiplicity-one-isometry.

K is algebraically closed and complete for a nontrivial rank-one nonarchimedean valuation; X is a smooth connected algebraic K-curve; X̂ is its smooth proper completion and D=X̂ minus X is the finite puncture set. If Γ′ is a finite embedded tropical subgraph and every initial degeneration at w in Γ′ is irreducible and generically reduced, a unique embedded Γ in H° maps homeomorphically onto it and the map is an isometry for the subgraph length metrics.


Construction or proof plan:

1. Read the proof in BPR §§5–6, including vertex compatibility. The edge multiplicity formula gives a unique slope-one edge over a multiplicity-one edge but does not alone establish vertex gluing.


Acceptance:

- Irreducibility without generic reducedness is insufficient.


Dependencies: TropicalAndBerkovichArithmetic:TB.4/tropical-multiplicity-formula, TropicalAndBerkovichArithmetic:TB.3, TropicalAndBerkovichArithmetic:TB.4.


Source: bpr-tropicalization-2016, Theorem 1.4, arXiv p. 3. Reviewed introduction statement; proof bodies remain open.


## Remaining stages and exact open work

TB.1 must construct the four point types, intrinsic annulus skeleta, their retractions and path metrics, logarithmic moduli, slopes and the nonalgebraically closed descent statements. Native polynomial Gauss norms are useful inputs but do not themselves classify analytic points or prove the annulus geometry. A nested family of discs with empty intersection is a required type-IV regression case.

TB.3 must build metric-graph divisors and integral-affine functions, fix the outgoing-slope sign in the Laplacian, construct the metric Jacobian and prove the graph Riemann–Roch and specialization theorems. Native function-field Riemann–Roch is already a supplier. The discrete weighted Picard group of a numerical type is a different object from a metric-graph Jacobian. Metrized complexes and positive-genus components are required whenever the graph alone loses information. Equality of algebraic and graph ranks is not a general target.

TB.6 must construct model line-bundle metrics, intersection-weighted measures, their total mass, semipositive approximation and local heights with integrability. The good-reduction mass and the uniform measure on a Tate circle test normalization. A global equidistribution theorem additionally needs a polarized metrized line bundle and a suitable small sequence; those hypotheses cannot be recovered from the local measure construction alone.

TB.7 must compare imported uniformizations and integration theories with the skeleton. The Tate parameter and the loop length must use the same logarithmic normalization. Schottky uniformization has a totally degenerate scope and is not a description of every curve. Local Coleman primitives, annular monodromy, path integrals and abelian integrals need genuine comparison maps and choices of logarithm branch. A metric graph alone does not select a unique global integral.

The following gap register is the exact continuation contract. The packet's coverage records also retain one entry for every stage.

### Nonemptiness, unit criterion and spectral maximum

Read full proofs for nonzero Banach rings: existence of a bounded multiplicative seminorm, detection of units, and the spectral seminorm as the attained maximum of evaluations. Compactness alone proves none of these. This leaves incoming AdicSpacesPartII R3 and PerfectoidSpaces P1 requests unresolved; their spectral-seminorm carrier is not reconstructed here.


### Completed residue fields and analytic spaces

Build residue fields from prime kernels and native completion; prove scalar/nonarchimedean compatibility, affinoid domains, sheaves, gluing and curve analytification, including connectedness. Source proofs remain partly unread.


### Rank-one adic comparison

Import native Spa and R1/R2 objects, then prove the actual normalized rank-one map, maximal-generization uniqueness, continuity and quotient topology under precise plus-ring hypotheses. Native generization existence alone is insufficient.


### TB.1 line and annulus foundations

Read and decompose the four point types, intrinsic generalized-annulus skeleta/retractions, BPR Propositions 2.4/2.5/2.10 and Lemmas 2.12/2.13, closed-ball contractibility and zero-free norm constancy. Preserve type IV without spherical completeness.


### Continuity at vertices

Supply the actual vertex-neighborhood proof left as an exercise in Lemma 3.8. This is an intentional exercise, not a claimed source error.


### Formal models, genus and refinement

Decompose Theorem 4.11, formal fibres, vertex genus and the genus formula, Proposition 4.21 contractions and full refinement API. Read BL85 proof leaves. Prove finite valued-field extension compatibility; do not substitute a simple intersection graph for the metric skeleton with loops and genera.


### TB.3 graph divisors and specialization

Fix public proof sources for metric-graph divisors, integral-affine slopes, Laplacian sign, Jacobian, graph Riemann–Roch and specialization inequality, including metrized complexes. Consume native algebraic Riemann–Roch and StableReduction numerical types without duplication.


### TB.4–TB.5 proof bodies

Read BPR §§4–6 and tropical foundations: initial degenerations, polyhedra, balancing, finite-map multiplicities, rational functions, dominating embeddings and vertex compatibility. The introduction supplies targets, not closed proofs. Resolve general-base toric ownership through the request.


### TB.6 metrics, measures and local heights

Read Chambert-Loir math/0304023 and primary model/intersection sources. Plan model line-bundle metrics, intersection-weighted measures, mass equal to degree, semipositive approximation and integrable local heights. Global heights and equidistribution have other owners.


### TB.7 interfaces

Import the elliptic Tate curve from EllipticCurves Layer 4, Coleman primitives from ColemanIntegration, and abelian uniformization from R11.3. Source Schottky/Mumford theory in its totally degenerate range and actual skeleton-period/integration comparisons.


### Missing Lean forms of geometric targets

All TB.2, TB.4 and TB.5 nodes and the APIs/tests of SemistableVertexSet, skeleton and retraction are omitted from the suggested file: actual analytic-curve, annulus, type-2-point, residue-curve and tropical initial-degeneration carriers are absent. Do not replace them by unconstrained proposition parameters. All 11 TB.0 nodes and their APIs/tests are typed.


### Complete source extraction

Only listed passages were read. Complete Berkovich/Huber foundations, BPR proof bodies, Baker–Norine, Baker specialization, Chambert-Loir and integration/uniformization sources. The inherited BPR source-catalogue gap remains; this job cannot edit the catalogue.


## Source versions and findings

The source record distinguishes inherited reading from this worker’s reading. Each file has a checksum and the exact passages consulted. Reading introductory statements is not represented as reading their proof bodies. The published BPR offprint was compared directly with the arXiv copy at the relevant passages. The Springer Temkin chapter could not be obtained through the PDF request, which returned HTML, so its two findings are confined to the author-hosted 2011 preprint. No finding has an independent verdict yet.


### Introduction to Berkovich analytic spaces — temkin-2011

Author-hosted arXiv:1010.2235v2, 16 December 2011; 52 pages. Not asserted to be the Springer chapter.

[Public source](https://math.huji.ac.il/~temkin/papers/Introduction_to_Berkovich_Spaces.pdf). SHA-256: 93d4a9bb0ffc9fa2273a0ff5996b2c8ec72201c8c7f9dd7fac652c64c77f2e5a.

- Physical pp. 1, 3–7; §§2.1–2.2.4 through p. 7. Spectrum definition, compactness statement and functoriality exercise. This passage supplies no proof of nonemptiness or spectral maximum.
- Source issues visually checked on pp. 4 and 7.


### On the structure of nonarchimedean analytic curves — bpr-structure-2014

arXiv:1404.0279v1 [math.AG], 1 April 2014 (published in Tropical and non-Archimedean geometry, Contemp. Math. 605 (2013); this is the paper cited as [BPR13] by the tropicalization paper). Not in the library catalogue. Extraction line numbers refer to a pdftotext -layout extraction of this PDF (1299 lines).

[Public source](https://arxiv.org/abs/1404.0279). SHA-256: 5e40117270a0051d9661c9bbd0317968b810573796a5c2408582f20692568a11.

- Section 3: Definition 3.1 - Proposition 3.9 with proofs (semistable vertex sets, skeleta, completed skeleta, retraction) (pp. 7-9; extraction lines 374-484)
- Theorem 4.22 (stable reduction theorem) and Corollary 4.23, statements and the first lines of the proof (extraction lines 885-900)
- REVIEW-EXT-03 (re-fetched 2026-09-16 from https://arxiv.org/pdf/1404.0279v1, 363304 bytes; SHA-256 identical to the value recorded above; stamp "arXiv:1404.0279v1 [math.AG] 1 Apr 2014"): Section 3 opening conventions, Definitions 3.1, 3.3, 3.5, 3.7, Remark 3.6, Lemmas 3.2, 3.4, 3.8 and Proposition 3.9 with all proofs, and Definition 3.10 (pp. 7-9, lines 370-490); Theorem 4.22 with the whole printed proof and Corollary 4.23 (lines 878-905).
- This worker, 2026-09-27: physical pp. 1, 7–10, 16–18. Hash reproduced; published comparison recorded separately.


### Nonarchimedean geometry, tropicalization, and metrics on curves — bpr-tropicalization-2016

arXiv:1104.0320v3 [math.AG], 10 June 2015 (published in Algebraic Geometry 3 (2016) 63-105). The paper notes that its numbering differs from v2 and that the former Section 5 was extracted and published separately as [BPR13] (= the structure paper above). Not in the library catalogue. Extraction line numbers refer to a pdftotext -layout extraction (2144 lines).

[Public source](https://arxiv.org/abs/1104.0320). SHA-256: 19fbd64ec043835cbadad0375df562d78aa62b26b4820bd1e9f0f79d45c4348e.

- Introduction: statements of Theorems 1.1-1.4 and the surrounding discussion of expansion factors m_rel(e) and tropical multiplicities (pp. 2-3; extraction lines 60-140)
- REVIEW-EXT-03 (re-fetched 2026-09-16 from https://arxiv.org/pdf/1104.0320v3, 577783 bytes; SHA-256 identical to the value recorded above; stamp "arXiv:1104.0320v3 [math.AG] 10 Jun 2015"): the version remark and the whole introduction, including the standing hypotheses, the definition of H°(X^an) as the space of non-leaves, Theorems 1.1-1.4, the expansion-factor discussion and the gcd formula (pp. 1-3, lines 20-145); Remark 5.6 with (5.6.1) (lines 1237-1245).
- This worker, 2026-09-27: physical pp. 1–3 including standing hypotheses and Theorems 1.1–1.4. Hash reproduced. Remark 5.6 locator is inherited; its formula is also on p. 3. Proof bodies unread.


### On the structure of non-archimedean analytic curves — bpr-structure-published

Published author offprint, Contemporary Mathematics 605 (2013), 93–121, DOI 10.1090/conm/605/12113; 29 physical pages.

[Public source](https://sites.lsa.umich.edu/sdpayne/wp-content/uploads/sites/1450/2025/08/StructureOfNonarchimedeanCurves.pdf?download=1). SHA-256: 01cbd4659548f916d5c82bbd4703dcee865307271796d873cc7d1dd098c43d6e.

- Physical pp. 9–13 (printed 101–105), 19–21 (111–113), 23 (115). Definitions 3.1–3.10, Lemmas 3.2/3.4/3.8, Proposition 3.9 and 3.13 with proofs; definitions 4.16, 4.19–4.20; Theorem 4.22 and Corollary 4.23 with printed proof; Remark 4.24; §5.3 source comparison.
- Visual checks of printed pp. 102 and 115. Full paper not read.


### TropicalAndBerkovichArithmetic/E1

Definition/Exercise 2.1.1.1(iv), preprint p. 4 only. Two-sided constant bounds imply equal topologies; the converse is false for general seminormed abelian groups. On the additive real group, |x| and √|x| are norms with the same topology. At x=n² their ratio is n, and near zero the reverse ratio is unbounded. No global equivalence constant exists. The finding affects a stated result and awaits independent review. Correction searches: arXiv:1010.2235 submission history: v2 remains the listed version.; Author-hosted PDF; author papers-page URLs unavailable.; Springer chapter landing page and PDF request (returned HTML).; Searches for Temkin introduction Berkovich errata: no relevant correction located.


### TropicalAndBerkovichArithmetic/E2

Definition 2.2.3.1, preprint p. 7 only. Use f ∈ C in the topology of MSpec(C). For C=K[T], evaluation points at T=0 and T=1 agree on A=K and differ at T. Base-ring coordinates alone cannot separate these points. The finding affects a stated result and awaits independent review. Correction searches: arXiv:1010.2235 submission history: v2 remains the listed version.; Author-hosted PDF; author papers-page URLs unavailable.; Springer chapter landing page and PDF request (returned HTML).; Searches for Temkin introduction Berkovich errata: no relevant correction located.


### TropicalAndBerkovichArithmetic/E3

Proof of Lemma 3.2, printed p. 102 (physical 10); also arXiv p. 8. The logarithmic radius tends to 0, and the scalar function |f(φ(z))| on the annular skeleton must lie in (c1,c2). The preceding limit is r→0. The map φ has values on the curve, not in a real interval; r1,r2 are not the endpoints of the continuity test. These substitutions repair the intended collar argument. The finding affects the proof and awaits independent review. Correction searches: arXiv:1404.0279v1 and published author offprint collated.; Rabinoff research/publications page and Payne published offprint.; Searches for the paper title with errata: no relevant correction located.


### TropicalAndBerkovichArithmetic/E4

Proof of Lemma 3.4(4), printed pp. 102–103; also arXiv p. 8. Qualify the connected neighborhood as disjoint from V. A connected subset of the complement of V lies in one component; an arbitrary connected neighborhood need not. The candidate affinoid neighborhood already has the required disjointness, so the theorem is unchanged. The finding affects the proof and awaits independent review. Correction searches: arXiv:1404.0279v1 and published author offprint collated.; Rabinoff research/publications page and Payne published offprint.; Searches for the paper title with errata: no relevant correction located.


### TropicalAndBerkovichArithmetic/E5

§5.3 opening, printed p. 115 (physical 23); also arXiv p. 18. The old edge becomes a union of subdivided edges with its length preserved. Use Proposition 3.13(1)–(2), not containment of the old edge in one refined edge. Insert a type-2 point in the interior of an old edge, as Proposition 3.13(2) permits. The two new edges each omit part of the old one. The global metric compatibility result requires the subdivision formulation. The finding affects the proof and awaits independent review. Correction searches: arXiv:1404.0279v1 and published author offprint collated.; Rabinoff research/publications page and Payne published offprint.; Searches for the paper title with errata: no relevant correction located.


## Validation and implementation boundary

The suggested TB.0 file elaborates with Lean 4.34.0-rc2, with no errors and 47 expected proof-placeholder warnings only. It contains 17 typed examples. This checks signatures and their compatibility with the pinned carriers; it proves none of the proposed theorems. All packet nodes retain unchecked implementation status. The full geometric APIs and tests of TB.2 are specified mathematically and explicitly excluded from this compilation claim.

The checker is run against the unmodified pinned textual declaration index. The dependency audit separately traces all eleven TB.0 nodes to native declarations, while preserving the gaps and supplier requests of the geometric targets. Arithmetic regression witnesses exercise the product seminorms, invalid zero and scaled functions, the topology-coordinate distinction, the inverse-bound field argument and edge subdivision. These witnesses supplement the source reading and type checking; they are not formal proofs of the roadmap.

A continuation should first finish the spectral existence/maximum proofs and the actual analytic carriers. Then it should close the annulus inputs used by the retained curve nodes, including the vertex-continuity exercise, before expanding the tropical proof bodies. The preserved source targets and original identifiers make this sequence explicit without restarting the reviewed extraction.
