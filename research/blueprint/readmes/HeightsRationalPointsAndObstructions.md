# Heights, rational points and obstructions

This blueprint for RP.0–RP.6 now has two checkpoints.

- **First checkpoint (RP.0).** The algebraic target of the geometric height machine, and the finite-sublevel interface needed to use that target.
- **Second checkpoint (RP.2, affine case).** The adelic points of affine varieties and the Brauer–Manin pairing.

Every declaration is a plan. The full geometric height machine has not yet been decomposed, and no stage is closed.

## Scope, ownership and conventions

The accepted RS-03 decision keeps divisor and line-bundle heights, tensor and pullback laws, and general abelian canonical and local heights in RP.0. Normalized absolute heights and their arithmetic finiteness theorems come from the audited arithmetic-height baseline. Elliptic canonical heights and descent come from the protected EllipticCurves roadmap. This checkpoint adds no absolute height, product formula, elliptic height, Selmer structure, or analytic limit construction.

A height representative here is a function from an arbitrary type X to the real numbers. The intended applications take X to be an actual type of rational points, algebraic points with a specified degree condition, or a subset of such a type. Neither a topology nor a field structure on X is assumed. In particular, imposing continuity would exclude functions for an irrelevant reason, and changing the topology on X must not change the quotient.

Two representatives determine the same class when their difference is bounded by one real constant on all of X. The order of quantifiers matters: there exists a bound, then for every point the bound applies. Every real-valued function is finite at each individual point, which says nothing about uniform boundedness. The top filter is the exact native filter for this condition. The bottom filter would make the condition vacuous; a filter expressing approach to a chosen end of X would test a different condition.

The baseline search found the needed bounded-function submodule already in Mathlib. Filter.boundedFilterSubmodule specializes to real-valued functions bounded along the top filter. The packet uses this exact object. HeightClass is a transparent abbreviation for its native module quotient. Native quotient projection, linear descent, quotient equality, and quotient map composition remain the library's constructions. The public API below gives specialized names and mathematical contracts where a height user needs them; it does not construct another equivalence relation or another boundedness predicate.

Only additive and real-linear structure descends. Bounded functions form a subalgebra, but not an ideal in the algebra of all real functions: the constant function one is bounded, and multiplying it by the unbounded function n on the natural numbers is unbounded. Thus the quotient is not supplied with pointwise multiplication. Likewise a class has no well-defined evaluation at a single point: adding a constant changes that value without changing the class. The tests explicitly detect these two tempting mistakes.

The definition is motivated by the footnote to §14 of [A. J. de Jong's Notes on Heights](https://www.math.columbia.edu/~dejong/courses/heights.pdf). Its tensor and pullback identities explain the linear and contravariant APIs. The generic Northcott condition is the native class asserting that every upper sublevel set is finite. A bounded perturbation preserves that condition. This elementary interface does not prove Northcott's arithmetic theorem, supply an ample line bundle, or remove a degree restriction over an algebraic closure.

ArithmeticDynamics:DY.1/tate-limit already owns the analytic limit, convergence and bounded-error independence. The present quotient makes its input convention explicit without introducing a second limit. Its abelian multiplication comparison is a consumer of the eventual RP.0 construction. GrossZagier GZ.1 also contains a broad geometric-height and canonical-height source decomposition. The packet records a proposal that it import the general RP.0 foundations and retain its Poincaré and coefficient-field applications. GZ.2 retains arithmetic intersections and the Faltings–Hriljac comparison. That proposal is not a claim that the wider ownership question has already been decided.

## The closed foundational component

The dependency component below ends entirely in the pinned library. There is no supplier request needed to construct a quotient of real function spaces or prove these elementary comparison statements. The geometric constructions which use it still have the precise gaps recorded below.

### Uniform boundedness at the top filter

Declaration: TauCeti.HeightClass.bounded_top_iff. Node: HeightsRationalPointsAndObstructions:RP.0/uniform-boundedness.

For h:X→ℝ, membership in the native boundedFilterSubmodule at the top filter is equivalent to the existence of C≥0 such that |h(x)|≤C for every x∈X.

Proof or construction:

1. Unfold native boundedFilterSubmodule and BoundedAtFilter. Asymptotics.isBigO_top changes the filter statement into one bound for every x, since the norm of the constant real one is one.
2. Replace a possibly negative bound C by max(C,0). This also handles X empty without a nonemptiness assumption. Conversely forget nonnegativity and use the native top-filter equivalence.

Acceptance cases:

- On the empty type C=0 works.
- The alternating sequence (−1)^n has bound 1.
- The sequence n on the natural numbers has no uniform bound.

Prerequisites: mathlib:Filter.boundedFilterSubmodule, mathlib:Filter.BoundedAtFilter, mathlib:Asymptotics.isBigO_top.

Source: §14, footnote 1 and Steps 1–7, pp.7–9. Elementary quotient interface extracted from the source’s height-class convention; the proof uses the listed native declarations.

### Heights modulo bounded functions

Declaration: TauCeti.HeightClass. Node: HeightsRationalPointsAndObstructions:RP.0/height-class.

For any type X, HeightClass(X) is the native real module quotient of the function space X→ℝ by Filter.boundedFilterSubmodule at the top filter. Write [h] for the native linear quotient projection. It is a real vector space; no topology or pointwise evaluation of a class is supplied.

Proof or construction:

1. Specialize the native bounded-function submodule to real-valued functions and the top filter, then use the native submodule quotient. This is a transparent abbreviation, not another quotient relation or another boundedness predicate.
2. Use the inherited quotient module structure and mkQ. Constants belong to the submodule by const_boundedAtFilter, so their classes vanish. On a finite type every real function has a finite, hence bounded, range. The native metric boundedness criterion at center zero gives the Bornology compatibility statement.
3. For linear descent use native liftQ with the exact kernel-inclusion hypothesis; liftQ_apply and quot_hom_ext supply its computation and uniqueness interfaces.

The required uses are:

- de Jong §14 footnote 1, Steps 4–6: Additivity and difference of very ample presentations are exact equalities in this quotient.
- de Jong §14 Step 7: Pullback of line bundles requires precomposition on this quotient.
- ArithmeticDynamics:DY.1/tate-limit and canonical-height-of-multiplication-on-an-abelian-variety: The bounded-error convention identifies input representatives. The analytic limit remains the DY.1 owner; no convergence theorem is claimed here.
- HeightsRationalPointsAndObstructions:RP.0 and RP.1: Native Northcott finiteness must be independent of the representative chosen for a geometric height.

The API supplies:

- TauCeti.HeightClass.mk: The projection h↦[h] is exactly native mkQ, as a real linear map from functions to HeightClass(X).
- TauCeti.HeightClass.mk_eq_mk_iff_isBounded: [h]=[g] exactly when the range of h−g is Bornology.IsBounded in ℝ.
- TauCeti.HeightClass.mk_eq_zero_iff: [h]=0 exactly when there is C≥0 with |h(x)|≤C for every x.
- TauCeti.HeightClass.mk_surjective: Every height class has a real-valued function representative.
- TauCeti.HeightClass.mk_zero: The class of the zero function is zero.
- TauCeti.HeightClass.mk_add: [h+g]=[h]+[g].
- TauCeti.HeightClass.mk_smul: For every real c, [c·h]=c·[h].
- TauCeti.HeightClass.mk_const: For every real c, the class of the constant function with value c is zero.
- TauCeti.HeightClass.mk_of_finite: If X is finite, every function h:X→ℝ has zero class.
- TauCeti.HeightClass.liftQ_mk: If L:(X→ℝ)→V is a real linear map annihilating the native bounded-function submodule, its native liftQ evaluated at [h] is L(h).
- TauCeti.HeightClass.linearMap_ext: Two real linear maps from HeightClass(X) to V are equal if they agree on [h] for every function h.

Discriminating tests:

- TauCeti.HeightClass.tests.empty (degenerate): Every real function on the empty type has zero class.
- TauCeti.HeightClass.tests.alternating (computation): On ℕ the function n↦(−1)^n has zero class.
- TauCeti.HeightClass.tests.unbounded (non-example): On ℕ the function n↦n has nonzero class.
- TauCeti.HeightClass.tests.affine_shift (computation): On ℕ the functions n↦n+7 and n↦n have equal classes.
- TauCeti.HeightClass.tests.native_quotient (compatibility): For every h:X→ℝ, [h] is exactly Submodule.Quotient.mk(h) in the native module quotient.
- TauCeti.HeightClass.tests.not_constants_only (non-example): There is no real c such that (−1)^n=c for every natural n, although this sequence has zero class.
- TauCeti.HeightClass.tests.not_ring_quotient (non-example): On ℕ the constant functions 1 and 0 have equal classes, while n↦1·n and n↦0·n have different classes.

Acceptance cases:

- Bounded nonconstant functions vanish.
- A pointwise product of two classes is not defined: [1]=[0], but [n·1]≠[n·0].
- Finite point sets give the zero quotient.

Prerequisites: mathlib:Filter.boundedFilterSubmodule, mathlib:Filter.const_boundedAtFilter, mathlib:Submodule.Quotient.mk, mathlib:Submodule.Quotient.eq, mathlib:Submodule.mkQ, mathlib:Submodule.mkQ_surjective, mathlib:Submodule.Quotient.mk_eq_zero, mathlib:Submodule.liftQ, mathlib:Submodule.liftQ_apply, mathlib:Submodule.quot_hom_ext, mathlib:Metric.isBounded_iff_subset_closedBall, HeightsRationalPointsAndObstructions:RP.0/uniform-boundedness.

Source: §14, footnote 1 and Steps 1–7, pp.7–9. Elementary quotient interface extracted from the source’s height-class convention; the proof uses the listed native declarations.

### The bounded-error equality criterion

Declaration: TauCeti.HeightClass.mk_eq_mk_iff. Node: HeightsRationalPointsAndObstructions:RP.0/equality-criterion.

For h,g:X→ℝ, [h]=[g] if and only if there is a real C≥0 such that |h(x)−g(x)|≤C for every x.

Proof or construction:

1. Use native Submodule.Quotient.eq to replace equality by membership of h−g in the bounded-function submodule.
2. Apply uniform-boundedness and evaluate subtraction pointwise. The bound is uniform over the whole chosen point type, not merely pointwise finite or bounded on a separately chosen finite subset.

Acceptance cases:

- [n+(−1)^n]=[n] on ℕ.
- [2n]≠[n] on ℕ.
- Equality of classes does not imply equality of values at a point.

Prerequisites: HeightsRationalPointsAndObstructions:RP.0/height-class, HeightsRationalPointsAndObstructions:RP.0/uniform-boundedness, mathlib:Submodule.Quotient.eq.

Source: §14, footnote 1 and Steps 1–7, pp.7–9. Elementary quotient interface extracted from the source’s height-class convention; the proof uses the listed native declarations.

### Pullback of height classes

Declaration: TauCeti.HeightClass.pullback. Node: HeightsRationalPointsAndObstructions:RP.0/height-pullback.

For any function f:X→Y, pullback(f):HeightClass(Y)→HeightClass(X) is the real linear map induced by precomposition: [h]↦[h∘f]. For X→Y→Z, pullback(g∘f)=pullback(f)∘pullback(g). No finite-fiber assumption is needed to define this map.

Proof or construction:

1. Form the native precomposition linear map from LinearMap.pi and LinearMap.proj: its x-coordinate is evaluation at f(x).
2. If h is bounded by C everywhere on Y, h∘f has the same bound on X. By uniform-boundedness this is exactly the submodule compatibility required by native mapQ.
3. Use native mapQ with that compatibility proof. Its evaluation, identity and composition theorems give the representative formula and contravariant functor laws. Constant f produces a constant representative, hence the zero map.

The required uses are:

- de Jong §14 Step 7: The tensor-compatible height assignment is contravariant under maps on rational points.
- ArithmeticDynamics:DY.1/tate-limit: A self-map acts on the bounded-error input class; the condition of being an eigenclass is independent of representatives.
- HeightsRationalPointsAndObstructions:RP.0: Restriction to a subset of points, and the point maps induced by morphisms, use the same pullback construction.

The API supplies:

- TauCeti.HeightClass.pullback_mk: For f:X→Y and h:Y→ℝ, pullback(f)([h])=[h∘f].
- TauCeti.HeightClass.pullback_id: Pullback of the identity on X is the identity linear map on HeightClass(X).
- TauCeti.HeightClass.pullback_comp: For f:X→Y and g:Y→Z, pullback(g∘f)=pullback(f) composed with pullback(g).
- TauCeti.HeightClass.pullback_add: Pullback(f)(a+b)=pullback(f)(a)+pullback(f)(b).
- TauCeti.HeightClass.pullback_smul: Pullback(f)(c·a)=c·pullback(f)(a) for real c.
- TauCeti.HeightClass.pullback_const: For any y∈Y, pullback of the constant map X→Y with value y is the zero linear map.

Discriminating tests:

- TauCeti.HeightClass.pullback_tests.double (computation): Pullback of [n] along n↦2n on ℕ is 2[n].
- TauCeti.HeightClass.pullback_tests.constant (degenerate): Pullback of [n] along the constant zero map ℕ→ℕ is zero.
- TauCeti.HeightClass.pullback_tests.composition (characterisation): Pullback of [n²] along doubling after successor is pullback along successor of pullback along doubling of [n²].
- TauCeti.HeightClass.pullback_tests.noninjective (non-example): Pullback along the constant zero map ℕ→ℕ is not injective.

Acceptance cases:

- On ℕ, pullback of [n] along doubling is 2[n].
- Pullback along a constant map is zero.
- Composition reverses order.

Prerequisites: HeightsRationalPointsAndObstructions:RP.0/height-class, HeightsRationalPointsAndObstructions:RP.0/uniform-boundedness, mathlib:LinearMap.pi, mathlib:LinearMap.proj, mathlib:Submodule.mapQ, mathlib:Submodule.mapQ_apply, mathlib:Submodule.mapQ_id, mathlib:Submodule.mapQ_comp, mathlib:Filter.const_boundedAtFilter.

Source: §14, footnote 1 and Steps 1–7, pp.7–9. Elementary quotient interface extracted from the source’s height-class convention; the proof uses the listed native declarations.

### Surjective maps detect height classes

Declaration: TauCeti.HeightClass.pullback_injective_of_surjective. Node: HeightsRationalPointsAndObstructions:RP.0/surjective-pullback.

If f:X→Y is surjective, pullback(f):HeightClass(Y)→HeightClass(X) is injective.

Proof or construction:

1. Choose representatives h and g for two classes, using native mkQ_surjective. The definition through mapQ says equality of pullbacks is equality of [h∘f] and [g∘f].
2. Use equality-criterion to obtain C bounding |h(f(x))−g(f(x))| on all X. For each y choose an x with f(x)=y; the same C bounds the difference on Y.
3. Apply equality-criterion on Y. No finiteness of the fibers is used.

Acceptance cases:

- A bijection gives an isomorphism through its inverse pullback.
- Projection ℕ×ℕ→ℕ is surjective and detects classes even though it does not preserve Northcott finiteness.

Prerequisites: HeightsRationalPointsAndObstructions:RP.0/height-pullback, HeightsRationalPointsAndObstructions:RP.0/equality-criterion, mathlib:Submodule.mkQ_surjective, mathlib:Submodule.mapQ_apply.

Source: §14, footnote 1 and Steps 1–7, pp.7–9. Elementary consequence of the source’s bounded-error and pullback convention; not attributed as a separately stated source theorem.

### Northcott transfer under a lower comparison

Declaration: TauCeti.HeightClass.northcott_of_le_add. Node: HeightsRationalPointsAndObstructions:RP.0/northcott-one-sided.

Let h,g:X→ℝ and C∈ℝ satisfy h(x)≤g(x)+C for every x. If h is Northcott in the native sense, then g is Northcott.

Proof or construction:

1. Fix a real B. If g(x)≤B, then h(x)≤B+C. Thus the B-sublevel set of g is a subset of the (B+C)-sublevel set of h.
2. Apply native Northcott.finite_le and finite-set subset closure. This constructs the native Northcott instance for g; it introduces no second finiteness predicate.

Acceptance cases:

- Take h(n)=n and g(n)=n+(−1)^n, with C=1.
- The reversed inequality is insufficient: 0≤n on ℕ, while n is Northcott and the constant zero function is not.

Prerequisites: mathlib:Northcott.

Source: §17, p.10, with §14 footnote 1, p.7. Explicit elementary sublevel-set proof supplying the representative interface for the finiteness notion used by the source. No projective Northcott theorem is re-planned.

### Northcott invariance under bounded error

Declaration: TauCeti.HeightClass.northcott_congr. Node: HeightsRationalPointsAndObstructions:RP.0/northcott-invariance.

If h,g:X→ℝ have equal height classes, then native Northcott(h) holds if and only if native Northcott(g) holds.

Proof or construction:

1. Use equality-criterion to choose C≥0 with |h(x)−g(x)|≤C for every x. The absolute-value inequality gives both h(x)≤g(x)+C and g(x)≤h(x)+C.
2. Apply northcott-one-sided to each comparison. Both implications use the same C; no representative selection is part of the resulting statement.

Acceptance cases:

- n and n+(−1)^n on ℕ both have finite sublevel sets.
- n and −n on ℕ are not boundedly equivalent; only the first is Northcott.
- On a fixed field, this transfers an imported arithmetic-height finiteness theorem to any boundedly equal geometric representative. It does not assert finiteness over an algebraic closure without a degree restriction.

Prerequisites: HeightsRationalPointsAndObstructions:RP.0/equality-criterion, HeightsRationalPointsAndObstructions:RP.0/northcott-one-sided, mathlib:Northcott.

Source: §14 footnote 1, p.7; §17, p.10. Combines the source’s bounded-error convention with the native finite-sublevel definition by the displayed two inclusions.

### Northcott for a boundedly equal pullback

Declaration: TauCeti.HeightClass.northcott_of_pullback_eq. Node: HeightsRationalPointsAndObstructions:RP.0/northcott-pullback.

Let f:X→Y have finite fibers, in the native TendstoCofinite sense. Let h:Y→ℝ be Northcott and g:X→ℝ satisfy [g]=pullback(f)([h]). Then g is Northcott.

Proof or construction:

1. Native Northcott.comp_of_finite_fibers gives Northcott(h∘f); use the native finite-fiber typeclass and its singleton-fiber characterization.
2. The mapQ representative formula rewrites the hypothesis as [g]=[h∘f]. Apply northcott-invariance. This only adds the bounded-error bridge; the finite-fiber theorem is imported.

Acceptance cases:

- For projection ℕ×Fin(2)→ℕ and h(n)=n, the pullback has finite sublevels.
- For projection ℕ×ℕ→ℕ, the zero-sublevel set contains all (0,m), so finite fibers cannot be omitted.

Prerequisites: HeightsRationalPointsAndObstructions:RP.0/height-pullback, HeightsRationalPointsAndObstructions:RP.0/northcott-invariance, mathlib:Submodule.mapQ_apply, mathlib:Northcott.comp_of_finite_fibers, mathlib:Filter.TendstoCofinite, mathlib:Filter.tendstoCofinite_iff_finite_preimage_singleton.

Source: §14 Step 7, p.9; §17, p.10. A reusable consequence of pullback and finite-sublevel finiteness, explicitly built on the native finite-fiber result. It assumes no unstated ampleness or arithmetic theorem.

## RP.2: adelic points and the Brauer–Manin pairing, affine case

This component builds RP.2 for affine varieties over a number field.

- **Topology on points.** It defines the topology on points with values in a topological algebra, from which the topology of adelic points is obtained without choosing a presentation.
- **Adelic points.** It proves that adelic points form the restricted product of local points with respect to the integral points of any integral model.
- **Brauer evaluation.** Brauer classes are represented by Azumaya algebras over the coordinate ring. They are evaluated at points by base change into Mathlib's Brauer group of a field, which Tau Ceti makes a commutative group.
- **Finite support.** The evaluation at an adelic point is trivial at almost all places. This is proved by spreading out, and by the splitting of Azumaya algebras over the integers of a local field.

The local invariant maps and the global reciprocity law are requested from ClassFieldTheory Layers 5 and 10, and are used only through those requests.

The sources are:

- Conrad's *Weil and Grothendieck approaches to adelic points* (author copy). Its Example 2.2 exchanges the two rings in its closed/open clause (sourceIssues E8); the statement here uses the corrected orientation.
- Poonen's *Rational points on varieties* (author PDF), §2.6.3, §6.6, §6.9 and §8.2.

Three limitations are recorded:

- The Brauer–Manin set of this packet uses Azumaya algebras. Its comparison with Poonen's cohomological Br X is recorded as a gap.
- Compactness of the local integers, which local compactness needs, is also a gap.
- Non-affine varieties, local constancy of evaluation, and the acceptance examples are listed in the coverage.

### The topology on points with values in a topological algebra

Declaration: TauCeti.Points. Node: HeightsRationalPointsAndObstructions:RP.2/points-topology.

Let R be a commutative ring, A a commutative R-algebra and B a commutative topological ring which is an R-algebra. The B-valued points of Spec A are Points_R(A, B) := A →ₐ[R] B. The points topology on Points_R(A, B) is the topology induced by the injection Points_R(A, B) → B^A, φ ↦ (φ(a))_{a ∈ A}, where B^A = (A → B) carries the product topology; equivalently, it is the coarsest topology for which every evaluation φ ↦ φ(a), a ∈ A, is continuous. Lean: `TauCeti.Points R A B`, a type synonym of `A →ₐ[R] B` carrying this topology as an instance; no topology instance is put on `A →ₐ[R] B` itself, so no existing instance is overridden.

Hypotheses: R and A commutative; B a commutative topological ring with an R-algebra structure. No finiteness of A and no separation axiom on B is assumed in the definition; the separation, closedness and local-compactness statements of RP.2/points-topology-presentation assume them.

Proof or construction:

1. Define the topology as TopologicalSpace.induced along the coercion Points_R(A, B) → (A → B), with Pi.topologicalSpace on the target. The coercion is injective (algebra maps are determined by their values), so this is the subspace topology of the image.
2. Continuity into Points: a map f from a topological space Z is continuous iff every z ↦ f(z)(a) is continuous (induced topology and product topology universal properties).
3. Functoriality: for g : A′ →ₐ[R] A, φ ↦ φ ∘ g is continuous, because each evaluation of the composite at a′ is the evaluation at g(a′). For a continuous R-algebra map h : B → B′, φ ↦ h ∘ φ is continuous, because each evaluation of the composite is h composed with an evaluation.
4. Products: Algebra.TensorProduct.liftEquiv identifies Points_R(A ⊗_R A′, B) with pairs (φ, φ′) (the commutation condition is automatic since B is commutative). The map φ ↦ (φ ∘ includeLeft, φ ∘ includeRight) is continuous by functoriality, and its inverse is continuous because each element of A ⊗_R A′ is a finite sum of products a ⊗ a′, whose value (φ(a)φ′(a′) summed) is a continuous function of (φ, φ′) as B is a topological ring.
5. Examples: for A = R[X], Polynomial.aeval identifies Points_R(R[X], B) with B through φ ↦ φ(X), a homeomorphism since every evaluation is a polynomial function of φ(X). For A = R[X, Y]/(XY − 1), φ ↦ φ(X) is a bijection onto Bˣ, and the points topology corresponds to Mathlib's topology on units (induced by u ↦ (u, u⁻¹), Units.embedProduct), because the points topology is induced by the two evaluations at X and Y = X⁻¹.

The required uses are:

- HeightsRationalPointsAndObstructions:RP.2/adelic-points: The topology of X(𝔸_K) is the points topology with values in the adele ring.
- HeightsRationalPointsAndObstructions:RP.2/adelic-points-restricted-product: The local factors X(K_v) and X₀(O_v) carry the points topology with values in K_v, and the comparison is proved through presentations.
- AdelicAlgebraicGroups:AA.1: For an affine group scheme G of finite type, G(𝔸) with its topology is the points topology of its coordinate ring; the group case consumes this construction.
- Poonen Proposition 8.2.9 and Corollary 8.2.11 (coverage): Local constancy of Brauer evaluation is a statement about the points topology on X(K_v).

The API supplies:

- TauCeti.Points.continuous_eval: For every a ∈ A the evaluation φ ↦ φ(a) is continuous on Points_R(A, B).
- TauCeti.Points.continuous_iff: A map f : Z → Points_R(A, B) from a topological space is continuous iff z ↦ f(z)(a) is continuous for every a ∈ A.
- TauCeti.Points.isEmbedding_coe: The coercion Points_R(A, B) → (A → B) is a topological embedding for the product topology.
- TauCeti.Points.precomp: An R-algebra map g : A′ → A induces a continuous map Points_R(A, B) → Points_R(A′, B), φ ↦ φ ∘ g, compatible with identities and composition.
- TauCeti.Points.postcomp: A continuous R-algebra map h : B → B′ induces a continuous map Points_R(A, B) → Points_R(A, B′), φ ↦ h ∘ φ, compatible with identities and composition.
- TauCeti.Points.tensorHomeomorph: Points_R(A ⊗_R A′, B) ≃ₜ Points_R(A, B) × Points_R(A′, B), φ ↦ (φ ∘ includeLeft, φ ∘ includeRight).
- TauCeti.Points.polynomialHomeomorph: Points_R(R[X], B) ≃ₜ B, φ ↦ φ(X).
- TauCeti.Points.unitsHomeomorph: Points_R(R[X, Y]/(XY − 1), B) ≃ₜ Bˣ with Mathlib's topology on units, φ ↦ the unit with value φ(X) and inverse φ(Y).

Discriminating tests:

- TauCeti.Points.tests.base (degenerate): Points_R(R, B) has exactly one element, Algebra.ofId, and hence the only topology.
- TauCeti.Points.tests.zero_ring (degenerate): If A is the zero ring and B is nontrivial, Points_R(A, B) is empty.
- TauCeti.Points.tests.polynomial_real (computation): For R = ℤ, A = ℤ[X] and B = ℝ, φ ↦ φ(X) is a homeomorphism onto ℝ; in particular Points is connected and not discrete.
- TauCeti.Points.tests.units_real (compatibility): For R = ℤ, A = ℤ[X, Y]/(XY − 1) and B = ℝ, the space is homeomorphic to ℝ ∖ {0} with the subspace topology (inversion is continuous on ℝ ∖ {0}, so the units topology is the subspace topology).
- TauCeti.Points.tests.not_discrete (non-example): For B = ℚ_p and A = ℤ[X], the points φ_n with φ_n(X) = pⁿ converge to the point with value 0; so the points topology is not the discrete topology.

Acceptance cases:

- Every evaluation map is continuous, and a map into Points is continuous iff all its evaluations are.
- For A = R[X, Y]/(XY − 1) and B = 𝔸_ℚ, the space is 𝔸_ℚˣ with the topology in which u and u⁻¹ both vary continuously; it is not the subspace topology from 𝔸_ℚ (Conrad §3). A definition through the embedding of Spec A in the affine line would get this wrong.
- No presentation of A enters the definition; that any presentation gives the same topology is a lemma (RP.2/points-topology-presentation).

Prerequisites: mathlib:TopologicalSpace.induced, mathlib:Pi.topologicalSpace, mathlib:AlgHom, mathlib:Algebra.TensorProduct.liftEquiv, mathlib:Polynomial.aeval, mathlib:Units.embedProduct.

Sources:

- Conrad, §2, Proposition 2.1, p. 2. Conrad's topological ring R is the value ring B here; his explicit description of the topology is taken as the definition.
- Conrad, §3, pp. 3–4. The units example of the acceptance cases.

### Presentations compute the points topology

Declaration: TauCeti.Points.isEmbedding_generators. Node: HeightsRationalPointsAndObstructions:RP.2/points-topology-presentation.

Let R, A, B be as in RP.2/points-topology, n ∈ ℕ and π : R[X₁, …, X_n] → A a surjective R-algebra map (MvPolynomial (Fin n) R), with aᵢ := π(Xᵢ). Then φ ↦ (φ(a₁), …, φ(a_n)) is a topological embedding Points_R(A, B) → Bⁿ whose image is Z(ker π) := {b ∈ Bⁿ : aeval b f = 0 for all f ∈ ker π}. If B is T1, Z(ker π) is closed, so the embedding is closed and Points_R(A, B) is T1; if B is Hausdorff, Points_R(A, B) is Hausdorff; if B is locally compact Hausdorff, Points_R(A, B) is locally compact.

Hypotheses: π surjective; for the closedness statements B is T1 (resp. Hausdorff, locally compact Hausdorff).

Proof or construction:

1. Bijection onto Z(ker π): an R-algebra map out of the quotient A ≅ R[X]/ker π is determined by the images of the Xᵢ, and b ∈ Bⁿ is the image of such a map iff MvPolynomial.aeval b kills ker π.
2. Embedding: the map is continuous (n evaluations). Conversely every a ∈ A is π(f) for a polynomial f, and φ(a) = aeval (φ(a₁), …, φ(a_n)) f is a polynomial function of the coordinates, continuous because B is a topological ring; so each evaluation factors continuously through the image, and the points topology is induced from Bⁿ.
3. Closedness: Z(ker π) = ⋂_{f ∈ ker π} (b ↦ aeval b f)⁻¹{0}, an intersection of closed sets when {0} is closed.
4. Separation and local compactness pass to subspaces, and closed subspaces of locally compact Hausdorff spaces are locally compact.

The API supplies:

- TauCeti.Points.isEmbedding_generators: For a surjection π from MvPolynomial (Fin n) R onto A, the evaluation at π(X₁), …, π(X_n) is a topological embedding Points_R(A, B) → Fin n → B.
- TauCeti.Points.range_generators: Its range is the common zero set of ker π.
- TauCeti.Points.isClosedEmbedding_generators: If B is T1 the embedding is closed.
- TauCeti.Points.t2Space: If B is Hausdorff, Points_R(A, B) is Hausdorff (for every A, since the coercion to A → B is injective).
- TauCeti.Points.locallyCompactSpace: If A is finitely generated and B is locally compact Hausdorff, Points_R(A, B) is locally compact.

Acceptance cases:

- For A = R[X]/(X² − 2) and B = ℝ, the image is {±√2} ⊂ ℝ, a closed two-point set.
- Two presentations of A give homeomorphic zero sets; the homeomorphism is given by polynomial maps in both directions.

Prerequisites: HeightsRationalPointsAndObstructions:RP.2/points-topology, mathlib:MvPolynomial.aeval, mathlib:Topology.IsEmbedding, mathlib:Topology.IsClosedEmbedding.

Sources:

- Conrad, §2, proof of Proposition 2.1, p. 2. Independence of the presentation, which the proof deduces from the polynomial expression of every element in the generators.
- Conrad, §2, proof of Proposition 2.1, p. 2. Closedness of the image and local compactness.

### Changing the value ring

Declaration: TauCeti.Points.isEmbedding_postcomp. Node: HeightsRationalPointsAndObstructions:RP.2/points-topology-base-change.

Let A be a finitely generated R-algebra and h : B → B′ a continuous R-algebra map of commutative topological R-algebras. Then postcomposition Points_R(A, B) → Points_R(A, B′) is continuous. If h is a topological embedding, so is the induced map; if h is moreover a closed (resp. open) embedding, so is the induced map; and if h(B) is discrete in B′, the image of Points_R(A, B) is discrete in Points_R(A, B′).

Hypotheses: A finitely generated; h continuous. The source's closed/open clause is stated with the roles of the two rings exchanged (sourceIssues HeightsRationalPointsAndObstructions/E8); the statement here uses the corrected orientation.

Proof or construction:

1. Choose a presentation π : R[X₁, …, X_n] → A (A finitely generated). By RP.2/points-topology-presentation both Points spaces embed in Bⁿ and B′ⁿ as the zero sets of ker π, and the induced map is the restriction of hⁿ : Bⁿ → B′ⁿ, since h is an algebra map.
2. If h is an embedding (resp. closed, open embedding), so is hⁿ, and Points_R(A, B) = hⁿ⁻¹(Points_R(A, B′)) inside Bⁿ, because a tuple satisfies the equations of ker π in B iff its image does in B′ (h injective). Restrictions of (closed, open) embeddings to preimages are (closed, open) embeddings.
3. Discreteness: hⁿ(Bⁿ) is discrete in B′ⁿ when h(B) is discrete in B′ (finite products of discrete subspaces), and the image of Points_R(A, B) is a subset of it.

The API supplies:

- TauCeti.Points.isEmbedding_postcomp: For A finitely generated and h a topological embedding, postcomposition with h is a topological embedding.
- TauCeti.Points.isClosedEmbedding_postcomp: The same for closed embeddings.
- TauCeti.Points.isOpenEmbedding_postcomp: The same for open embeddings.
- TauCeti.Points.discrete_range_postcomp: If h(B) is discrete in B′, the image of Points_R(A, B) in Points_R(A, B′) is discrete.

Acceptance cases:

- The inclusion K → 𝔸_K of a number field into its adele ring gives a discrete embedding of the K-points of any affine K-variety into its adelic points (RP.2/rational-points-discrete).
- The inclusion of the valuation ring O_v into K_v is an open and closed embedding, so the integral points of an O_v-model are open and closed in the K_v-points.

Prerequisites: HeightsRationalPointsAndObstructions:RP.2/points-topology-presentation, mathlib:Topology.IsEmbedding, mathlib:Topology.IsClosedEmbedding, mathlib:DiscreteTopology.

Sources:

- Conrad, §2, Example 2.2, p. 3. The discreteness clause, stated in the correct orientation in the source.
- Conrad, §2, Example 2.2, p. 3. The closed and open clauses; the printed hypothesis 'R′ closed in R' has the two rings exchanged (sourceIssues E8).

### Adelic points of an affine variety

Declaration: TauCeti.AdelicPoints. Node: HeightsRationalPointsAndObstructions:RP.2/adelic-points.

Let K be a number field, 𝔸_K = NumberField.AdeleRing (𝓞 K) K its adele ring (the product of the infinite adele ring and the finite adele ring), and A a finitely generated commutative K-algebra, the coordinate ring of the affine K-variety X = Spec A. The adelic points of X are X(𝔸_K) := Points_K(A, 𝔸_K) with the points topology (RP.2/points-topology). They come with: the diagonal ι : X(K) = Points_K(A, K) → X(𝔸_K), postcomposition with the algebra map K → 𝔸_K; for each finite place v (a height-one prime of 𝓞 K) the local projection X(𝔸_K) → X(K_v), K_v = v.adicCompletion K, postcomposition with the projection of the finite adeles to their v-component; and for each infinite place w the local projection X(𝔸_K) → X(K_w), K_w = w.Completion. All of these are continuous. Lean: `TauCeti.AdelicPoints K A`, with `diagonal`, `finiteProj v` and `infiniteProj w`.

Hypotheses: K a number field; A a finitely generated commutative K-algebra (so X is an affine K-scheme of finite type). Non-affine varieties are not covered by this node (coverage).

Proof or construction:

1. Definition: Points_K(A, 𝔸_K). The adele ring is a topological K-algebra (NumberField.AdeleRing is a topological ring with Algebra K).
2. Diagonal and projections: the algebra map K → 𝔸_K and the projections 𝔸_K → K_v are continuous K-algebra maps (the projection of the finite adeles to a component is RestrictedProduct.evalRingHom, continuous for the restricted-product topology; the infinite part is a product of the K_w). Postcomposition is continuous by RP.2/points-topology.
3. Product decomposition: since 𝔸_K = K_∞ × 𝔸_K^f, Points_K(A, 𝔸_K) ≃ₜ Points_K(A, K_∞) × Points_K(A, 𝔸_K^f) and Points_K(A, K_∞) ≃ₜ ∏_w X(K_w) (algebra maps into a product are families of algebra maps into the factors; the topologies agree because both are induced by the evaluations).
4. Hausdorff: 𝔸_K is Hausdorff (Tau Ceti NumberField.AdeleRing.instT2Space), so RP.2/points-topology-presentation makes X(𝔸_K) Hausdorff. Local compactness: the infinite adeles are locally compact (NumberField.InfiniteAdeleRing.locallyCompactSpace), and the finite adeles are locally compact by RestrictedProduct.locallyCompactSpace_of_group once each O_v is compact; compactness of O_v for a number field is not in the pinned libraries (gap), so the local-compactness API item waits for it.

The required uses are:

- HeightsRationalPointsAndObstructions:RP.2/brauer-manin-pairing: The pairing is a function on X(𝔸_K), and the Brauer–Manin set is a subset of it.
- HeightsRationalPointsAndObstructions:RP.3: Descent sets are subsets of X(𝔸_K) cut out by torsors.
- Poonen §8.1 (F-obstructions): Every obstruction set is a subset of X(𝔸_K) containing the diagonal image of X(K).

The API supplies:

- TauCeti.AdelicPoints.diagonal: The continuous map X(K) → X(𝔸_K) given by postcomposition with algebraMap K 𝔸_K.
- TauCeti.AdelicPoints.finiteProj: For a finite place v, the continuous map X(𝔸_K) → X(K_v) given by postcomposition with the v-th projection of the finite adeles.
- TauCeti.AdelicPoints.infiniteProj: For an infinite place w, the continuous map X(𝔸_K) → X(K_w) given by postcomposition with the w-th projection of the infinite adeles.
- TauCeti.AdelicPoints.ext: Two adelic points agree iff all their local projections agree.
- TauCeti.AdelicPoints.diagonal_injective: The diagonal is injective (K → 𝔸_K is injective).
- TauCeti.AdelicPoints.finiteProj_diagonal: The local projection of the diagonal image of x is x followed by K → K_v, and similarly at infinite places.
- TauCeti.AdelicPoints.map: A K-algebra map A′ → A induces a continuous map X(𝔸_K) → X′(𝔸_K) compatible with the diagonal and the local projections.
- TauCeti.AdelicPoints.t2Space: X(𝔸_K) is Hausdorff.
- TauCeti.AdelicPoints.locallyCompactSpace: X(𝔸_K) is locally compact (needs compactness of every O_v, a recorded gap).

Discriminating tests:

- TauCeti.AdelicPoints.tests.point (degenerate): For A = K, X(𝔸_K) has exactly one element, the image of the unique K-point.
- TauCeti.AdelicPoints.tests.affine_line (computation): For A = K[X], evaluation at X is a homeomorphism X(𝔸_K) ≃ₜ 𝔸_K, and the diagonal is the inclusion K → 𝔸_K; it is not surjective.
- TauCeti.AdelicPoints.tests.multiplicative_group (compatibility): For A = K[X, Y]/(XY − 1), X(𝔸_K) is homeomorphic to the unit group 𝔸_Kˣ with Mathlib's topology on units (the idele topology).
- TauCeti.AdelicPoints.tests.no_real_point (non-example): For K = ℚ and A = ℚ[X]/(X² + 1), X(𝔸_ℚ) is empty, while X(ℚ₅) is not.

Acceptance cases:

- X(𝔸_K) is Hausdorff, and X(K) sits in it as a discrete closed subset (RP.2/rational-points-discrete).
- For K = ℚ and A = ℚ[X]/(X² + 1), X(𝔸_ℚ) is empty although X(ℚ_p) is nonempty for every p ≡ 1 mod 4, because X(ℝ) is empty.

Prerequisites: HeightsRationalPointsAndObstructions:RP.2/points-topology, HeightsRationalPointsAndObstructions:RP.2/points-topology-presentation, mathlib:NumberField.AdeleRing, mathlib:IsDedekindDomain.FiniteAdeleRing, mathlib:NumberField.InfiniteAdeleRing, mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletion, mathlib:NumberField.InfinitePlace.Completion, mathlib:RestrictedProduct.evalRingHom, tauceti:NumberField.AdeleRing.instT2Space, mathlib:NumberField.InfiniteAdeleRing.locallyCompactSpace, mathlib:RestrictedProduct.locallyCompactSpace_of_group, mathlib:Algebra.FiniteType.

Sources:

- Poonen, §2.6.3, p. 49. Adelic points as the A-points of X for the adele ring A of the global field k.
- Conrad, §2, Example 2.3, p. 3. The diagonal and its discreteness (proved in RP.2/rational-points-discrete).

### Integral models and their integral local points

Declaration: TauCeti.AdelicPoints.IntegralModel. Node: HeightsRationalPointsAndObstructions:RP.2/integral-model.

Let K be a number field and A a finitely generated commutative K-algebra. An integral model of A is a finitely generated 𝓞_K-subalgebra A₀ ⊆ A such that K·A₀ = A (equivalently, the K-subalgebra generated by A₀ is A; then A₀ ⊗_{𝓞_K} K ≅ A). For a finite place v, its integral points at v are X₀(O_v) := {x ∈ X(K_v) : x(A₀) ⊆ O_v}, where O_v = v.adicCompletionIntegers K; for an infinite place w, X₀(O_w) := X(K_w). Lean: `TauCeti.AdelicPoints.IntegralModel K A` (a structure holding A₀, finite generation and the spanning condition) with `IntegralModel.integralPoints`.

Hypotheses: K a number field; A a finitely generated commutative K-algebra; A₀ a finitely generated 𝓞_K-subalgebra with K·A₀ = A. Models over rings of S-integers are the localisations A₀[1/N]; since the restricted product only sees almost all places, 𝓞_K-models suffice.

Proof or construction:

1. A₀ is torsion free over 𝓞_K (a subring of the K-vector space A), so A₀ ⊗_{𝓞_K} K is the localisation of A₀ at 𝓞_K ∖ {0}, which is K·A₀ = A.
2. A K-algebra map x : A → K_v is determined by its restriction to A₀, and x ∈ X₀(O_v) iff that restriction lands in O_v; so X₀(O_v) is identified with the 𝓞_K-algebra maps A₀ → O_v.
3. If a₁, …, a_n generate A₀ over 𝓞_K, then X₀(O_v) = {x : x(aᵢ) ∈ O_v for all i}, because O_v is a subring containing the image of 𝓞_K.

The required uses are:

- HeightsRationalPointsAndObstructions:RP.2/adelic-points-restricted-product: The restricted product is taken with respect to the integral points of a model.
- HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation-finite-support: Azumaya algebras are spread out over the model, and integral local points give trivial evaluations.

The API supplies:

- TauCeti.AdelicPoints.IntegralModel.integralPoints: The set X₀(O_v) ⊆ X(K_v) of points integral on A₀, for a finite place v.
- TauCeti.AdelicPoints.IntegralModel.mem_integralPoints_iff: x ∈ X₀(O_v) iff x(aᵢ) ∈ O_v for a chosen finite family of 𝓞_K-algebra generators aᵢ of A₀.
- TauCeti.AdelicPoints.IntegralModel.isOpen_integralPoints: X₀(O_v) is open in X(K_v).
- TauCeti.AdelicPoints.IntegralModel.isCompact_integralPoints: X₀(O_v) is compact, given compactness of O_v (recorded gap): it is closed in the compact set of points with all generator values in O_v.
- TauCeti.AdelicPoints.IntegralModel.ofGenerators: The 𝓞_K-subalgebra generated by any finite family of K-algebra generators of A is an integral model.

Discriminating tests:

- TauCeti.AdelicPoints.IntegralModel.tests.affine_line (computation): For K = ℚ, A = ℚ[X], A₀ = ℤ[X], X₀(ℤ_p) corresponds to ℤ_p ⊆ ℚ_p under evaluation at X.
- TauCeti.AdelicPoints.IntegralModel.tests.base (degenerate): For A = K and A₀ = 𝓞_K, X₀(O_v) = X(K_v) is the single point at every v.
- TauCeti.AdelicPoints.IntegralModel.tests.rescaled (non-example): For A = ℚ[X], the models ℤ[X] and ℤ[X/2] have different integral points at 2 (ℤ₂ versus 2ℤ₂), so the integral points depend on the model at finitely many places.
- TauCeti.AdelicPoints.IntegralModel.tests.no_integral_point (computation): For A = ℚ[X]/(3X − 1) and A₀ = ℤ[X]/(3X − 1) ≅ ℤ[1/3], the unique point 1/3 lies in X(ℚ₃) but X₀(ℤ₃) is empty, while X₀(ℤ_p) = X(ℚ_p) for every p ≠ 3.

Acceptance cases:

- For A = ℚ[X] and A₀ = ℤ[X], X₀(ℤ_p) is ℤ_p inside ℚ_p.
- Different models may differ at finitely many places: for A = ℚ[X], A₀ = ℤ[X] and A₀′ = ℤ[X/2] have X₀(ℤ₂) = ℤ₂ ≠ 2ℤ₂ = X₀′(ℤ₂), and agree at every odd p (RP.2/integral-model-exists-unique).

Prerequisites: HeightsRationalPointsAndObstructions:RP.2/adelic-points, mathlib:Algebra.adjoin, mathlib:Algebra.FiniteType, mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers.

Sources:

- Poonen, §2.6.3, p. 49. An integral model: a finite-type model over a ring of S-integers whose generic fibre is X.
- Poonen, Exercise 3.4(b), p. 95. The integral points at v as a subset of the K_v-points.

### Integral models exist and agree at almost all places

Declaration: TauCeti.AdelicPoints.IntegralModel.eventually_integralPoints_eq. Node: HeightsRationalPointsAndObstructions:RP.2/integral-model-exists-unique.

Let K be a number field and A a finitely generated commutative K-algebra. (a) The 𝓞_K-subalgebra generated by any finite family of K-algebra generators of A is an integral model (RP.2/integral-model). (b) For two integral models A₀, A₀′ there is a nonzero N ∈ 𝓞_K with A₀[1/N] = A₀′[1/N] inside A; consequently X₀(O_v) = X₀′(O_v) for every finite place v not dividing N, i.e. for all but finitely many v.

Hypotheses: A finitely generated over K; A₀, A₀′ finitely generated 𝓞_K-subalgebras spanning A over K.

Proof or construction:

1. (a) The subalgebra generated by K-algebra generators a₁, …, a_n is finitely generated over 𝓞_K, and its K-span contains the aᵢ and is a K-subalgebra, hence is A.
2. (b) Each of the finitely many generators of A₀′ lies in A = K·A₀, so it is a/m with a ∈ A₀ and m ∈ 𝓞_K ∖ {0}; let N₁ be the product of these denominators, so A₀′ ⊆ A₀[1/N₁]. Symmetrically A₀ ⊆ A₀′[1/N₂]. With N = N₁N₂, A₀[1/N] = A₀′[1/N].
3. If v does not divide N, N is a unit of O_v, so a K-algebra map x : A → K_v with x(A₀) ⊆ O_v also sends A₀[1/N], hence A₀′, into O_v, and conversely.
4. Only finitely many height-one primes contain N ≠ 0 (a nonzero element of a Dedekind domain lies in finitely many maximal ideals).

Acceptance cases:

- The models ℤ[X] and ℤ[X/2] of ℚ[X] satisfy (b) with N = 2.

Prerequisites: HeightsRationalPointsAndObstructions:RP.2/integral-model, mathlib:IsLocalization.Away, mathlib:IsDedekindDomain.HeightOneSpectrum.

Sources:

- Conrad, §3, Theorem 3.4(3), p. 5. Uniqueness of spreading out, specialised to affine models over the rings 𝓞_K[1/N] whose limit is K.
- Conrad, §3, p. 6. The denominator-chasing argument in the affine case.

### Adelic points as a restricted product

Declaration: TauCeti.AdelicPoints.restrictedProductHomeomorph. Node: HeightsRationalPointsAndObstructions:RP.2/adelic-points-restricted-product.

Let K be a number field, A a finitely generated commutative K-algebra and A₀ an integral model (RP.2/integral-model). Then the local projections give a homeomorphism X(𝔸_K) ≃ₜ (∏_{w infinite} X(K_w)) × Πʳ_{v finite} [X(K_v), X₀(O_v)], where the second factor is Mathlib's restricted product of the X(K_v) with respect to the subsets X₀(O_v) (RestrictedProduct, with its restricted-product topology). In particular an element of X(𝔸_K) is exactly a family (x_v) of local points with x_v ∈ X₀(O_v) for all but finitely many finite v, and the restricted product does not depend on the model (RP.2/integral-model-exists-unique).

Hypotheses: K a number field; A finitely generated; A₀ an integral model. The infinite places are finitely many, so their factor is an ordinary product.

Proof or construction:

1. Product decomposition: RP.2/adelic-points reduces the statement to the finite adeles 𝔸_K^f = Πʳ_v [K_v, O_v].
2. Bijection: let a₁, …, a_n generate A₀ over 𝓞_K (they then generate A over K). For a K-algebra map φ : A → 𝔸_K^f, each φ(aᵢ) is a finite adele, so it lies in O_v for all v outside a finite set Tᵢ (RestrictedProduct.eventually); for v outside T = ⋃ Tᵢ the v-component x_v of φ sends every aᵢ, hence A₀, into O_v. Conversely a family (x_v) with x_v(A₀) ⊆ O_v for almost all v defines a family of adeles (x_v(a))_v for each a ∈ A (a = b/m with b ∈ A₀, and m is a unit at almost all v), and a K-algebra map into the restricted product, because ring operations in the restricted product are componentwise.
3. Topology: by RP.2/points-topology-presentation both sides embed as the zero set of the same ideal, the left side in (𝔸_K^f)ⁿ and the right side in Πʳ_v [K_vⁿ, O_vⁿ], through the values at a₁, …, a_n; and (𝔸_K^f)ⁿ = Πʳ_v [K_vⁿ, O_vⁿ] as topological rings (a finite product of restricted products is the restricted product of the products; open O_v). Under this identification the two embeddings agree, so the bijection is a homeomorphism.
4. Openness of the X₀(O_v): they are cut out by the open conditions x(aᵢ) ∈ O_v (RP.2/integral-model), which is what makes the restricted-product topology the right one (RestrictedProduct.isOpen_forall_mem).
5. Model independence: two models have the same integral points at almost all v, and a restricted product only depends on the subsets at almost all indices.

The API supplies:

- TauCeti.AdelicPoints.restrictedProductHomeomorph: X(𝔸_K) ≃ₜ (Π w, X(K_w)) × Πʳ v, [X(K_v), X₀(O_v)] for an integral model A₀, given by the local projections.
- TauCeti.AdelicPoints.eventually_mem_integralPoints: For every adelic point x and every integral model, finiteProj v x ∈ X₀(O_v) for all but finitely many v.
- TauCeti.AdelicPoints.mk_of_eventually: A family of local points, integral on A₀ at almost all finite places, defines an adelic point with these projections.

Acceptance cases:

- For A = K[X], the theorem is Mathlib's definition of the finite adele ring as Πʳ_v [K_v, O_v] (with the model 𝓞_K[X]).
- For A = K[X, Y]/(XY − 1) with model 𝓞_K[X, Y]/(XY − 1), it describes the idele group as the restricted product of the K_vˣ with respect to the O_vˣ, as groups and topologically; this agrees with Mathlib's unitsEquiv as groups.

Prerequisites: HeightsRationalPointsAndObstructions:RP.2/adelic-points, HeightsRationalPointsAndObstructions:RP.2/integral-model, HeightsRationalPointsAndObstructions:RP.2/integral-model-exists-unique, HeightsRationalPointsAndObstructions:RP.2/points-topology-presentation, mathlib:RestrictedProduct, mathlib:RestrictedProduct.topologicalSpace, mathlib:RestrictedProduct.eventually, mathlib:RestrictedProduct.isOpen_forall_mem.

Sources:

- Poonen, §2.6.3, p. 50. Poonen's description of X(𝔸) as the restricted product, and its topology.
- Poonen, Exercise 3.4(c), p. 95. The bijection with the restricted product of local points.
- Conrad, §3, Theorem 3.6, p. 6. Conrad's theorem: the S-integral adelic points are the product of local points, homeomorphically in the affine case; passing to the limit over S gives the restricted product.

### Adelic points exist iff local points exist and are integral almost everywhere

Declaration: TauCeti.AdelicPoints.nonempty_iff. Node: HeightsRationalPointsAndObstructions:RP.2/adelic-points-nonempty-iff.

Let K be a number field, A a finitely generated commutative K-algebra and A₀ an integral model. Then X(𝔸_K) is nonempty iff X(K_w) is nonempty for every infinite place w, X(K_v) is nonempty for every finite place v, and X₀(O_v) is nonempty for all but finitely many finite v. In particular X(K) ≠ ∅ implies X(𝔸_K) ≠ ∅ (through the diagonal), and X(𝔸_K) = ∅ as soon as X has no point over a single completion.

Hypotheses: As in RP.2/adelic-points-restricted-product.

Proof or construction:

1. By RP.2/adelic-points-restricted-product, an adelic point is a family of local points integral at almost all v; such a family exists iff every local set is nonempty and the integral subsets are nonempty at almost all v (choose integral points there and arbitrary points at the finitely many remaining places).
2. The diagonal image of a K-point is an adelic point (RP.2/adelic-points).

Acceptance cases:

- For A = ℚ[X]/(X² + 1): X(ℝ) = ∅, so X(𝔸_ℚ) = ∅.
- Local points must exist at every place: for A = ℚ[X]/(X² − 2), X(ℚ_p) is empty for every p ≡ ±3 mod 8, so X(𝔸_ℚ) = ∅ although X(ℝ) ≠ ∅.
- The lemma says nothing about X(K): the Brauer–Manin set (RP.2/brauer-manin-pairing) refines this necessary condition.

Prerequisites: HeightsRationalPointsAndObstructions:RP.2/adelic-points-restricted-product, HeightsRationalPointsAndObstructions:RP.2/adelic-points.

Sources:

- Poonen, §8.1.1, p. 228. Nonemptiness of X(𝔸) is the local condition that the obstructions refine.

### Rational points are discrete and closed in adelic points

Declaration: TauCeti.AdelicPoints.isClosed_range_diagonal. Node: HeightsRationalPointsAndObstructions:RP.2/rational-points-discrete.

Let K be a number field and A a finitely generated commutative K-algebra. The diagonal ι : X(K) → X(𝔸_K) is injective, and its image is a discrete closed subset of X(𝔸_K).

Hypotheses: K a number field; A finitely generated.

Proof or construction:

1. Choose a presentation of A. By RP.2/points-topology-presentation, X(𝔸_K) embeds as a closed subset of 𝔸_Kⁿ, compatibly with the embedding X(K) ⊆ Kⁿ, and ι is the restriction of the diagonal Kⁿ → 𝔸_Kⁿ.
2. K is discrete and closed in 𝔸_K (Tau Ceti discreteTopology_principalSubgroup, isClosed_principalSubgroup), so Kⁿ is discrete and closed in 𝔸_Kⁿ, and its intersection with X(𝔸_K) is the image of ι (a tuple in Kⁿ satisfies the equations in 𝔸_K iff it satisfies them in K, since K → 𝔸_K is injective).
3. Discreteness also follows from RP.2/points-topology-base-change.

Acceptance cases:

- For A = K[X], the image of ι is the principal subgroup K ⊆ 𝔸_K.

Prerequisites: HeightsRationalPointsAndObstructions:RP.2/adelic-points, HeightsRationalPointsAndObstructions:RP.2/points-topology-presentation, HeightsRationalPointsAndObstructions:RP.2/points-topology-base-change, tauceti:TauCeti.GlobalNumberFields.discreteTopology_principalSubgroup, tauceti:TauCeti.GlobalNumberFields.isClosed_principalSubgroup, mathlib:NumberField.AdeleRing.principalSubgroup.

Sources:

- Conrad, §2, Example 2.3, p. 3. Discreteness of the rational points in the adelic points.

### Base change of Azumaya algebras

Declaration: TauCeti.IsAzumaya.baseChange. Node: HeightsRationalPointsAndObstructions:RP.2/azumaya-base-change.

Let R be a commutative ring, 𝒜 an Azumaya R-algebra (Mathlib IsAzumaya R 𝒜: finitely generated, projective and faithful as an R-module, with R-algebra map 𝒜 ⊗_R 𝒜ᵐᵒᵖ → End_R(𝒜) bijective), and S a commutative R-algebra. Then S ⊗_R 𝒜 is an Azumaya S-algebra. Over a field L, 𝒜 is Azumaya iff 𝒜 is a nonzero finite-dimensional central simple L-algebra.

Hypotheses: R, S commutative; 𝒜 Azumaya over R. For the field statement, L is a field.

Proof or construction:

1. Module conditions: S ⊗_R 𝒜 is finitely generated and projective over S (base change of finite projective modules). Faithfulness: a finite projective faithful module has positive rank at every prime of R, and base change preserves positive rank at primes of S, so S ⊗_R 𝒜 is faithful.
2. The algebra map: S ⊗_R (𝒜 ⊗_R 𝒜ᵐᵒᵖ) ≅ (S ⊗_R 𝒜) ⊗_S (S ⊗_R 𝒜)ᵐᵒᵖ, and, since 𝒜 is finite projective, S ⊗_R End_R(𝒜) ≅ End_S(S ⊗_R 𝒜); under these isomorphisms the map for S ⊗_R 𝒜 is the base change of the bijective map for 𝒜.
3. Field case: over a field, Azumaya algebras are free, and Mathlib's instance Algebra.IsCentral.instIsAzumaya gives centrality. Simplicity: a two-sided ideal I of 𝒜 gives a two-sided ideal I ⊗ 𝒜ᵐᵒᵖ of 𝒜 ⊗ 𝒜ᵐᵒᵖ ≅ End_L(𝒜), which is simple, so I = 0 or I = 𝒜. Conversely a finite-dimensional central simple algebra is Azumaya (Tau Ceti IsSimpleRing.isAzumaya).
4. Consequently S ⊗_R 𝒜 over a field S = L is a central simple L-algebra; this is what makes Brauer evaluation (RP.2/brauer-evaluation) land in Mathlib's Brauer group of L.

The API supplies:

- TauCeti.IsAzumaya.baseChange: IsAzumaya R 𝒜 implies IsAzumaya S (S ⊗[R] 𝒜) for every commutative R-algebra S.
- TauCeti.IsAzumaya.isSimpleRing_of_field: An Azumaya algebra over a field is a simple ring.
- TauCeti.IsAzumaya.iff_isCentral_isSimpleRing: Over a field L, IsAzumaya L 𝒜 iff 𝒜 is nonzero, finite-dimensional, central and simple.

Acceptance cases:

- The matrix algebra M_n(R) is Azumaya (IsAzumaya.matrix) and its base change is M_n(S).
- The Hamilton quaternions over ℤ[1/2] form an Azumaya algebra; their base change to ℝ is ℍ, central simple and not split.

Prerequisites: mathlib:IsAzumaya, mathlib:AlgHom.mulLeftRight, mathlib:IsAzumaya.matrix, mathlib:Algebra.IsCentral.instIsAzumaya, mathlib:Algebra.IsCentral, mathlib:IsSimpleRing, tauceti:TauCeti.IsSimpleRing.isAzumaya, mathlib:Module.Projective, mathlib:Module.End.

Sources:

- Poonen, §6.6.3, Definition 6.6.12(iv), p. 189. Azumaya algebras as locally free algebras with 𝒜 ⊗ 𝒜ᵒᵖ ≅ End(𝒜), the form Mathlib's IsAzumaya takes on affine schemes; stability under base change is built into the local characterisations of Definition 6.6.12.
- Poonen, §6.6.3, p. 189. Over a field, Azumaya algebras are the central simple algebras.

### Evaluating an Azumaya algebra at a point

Declaration: TauCeti.BrauerManin.eval. Node: HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation.

Let K be a field, A a commutative K-algebra, 𝒜 an Azumaya A-algebra and L a field with a K-algebra structure. For x ∈ Points_K(A, L), the evaluation of 𝒜 at x is 𝒜(x) := [L ⊗_{A, x} 𝒜] ∈ Br(L), the Brauer class (Tau Ceti BrauerGroup.mk of CSA.of) of the central simple L-algebra obtained by base change along x (RP.2/azumaya-base-change). Properties: (a) naturality: for a field extension L → L′ compatible with the K-structures, 𝒜(x′) = baseChange_{L′/L}(𝒜(x)) for x′ the composite point (Tau Ceti BrauerGroup.baseChange); (b) multiplicativity: (𝒜 ⊗_A 𝒜′)(x) = 𝒜(x)·𝒜′(x), 𝒜ᵐᵒᵖ(x) = 𝒜(x)⁻¹, and End_A(P)(x) = 1 for a finite projective A-module P of positive rank; (c) pullback: for a K-algebra map g : A′ → A (so A is an A′-algebra) and an Azumaya A′-algebra 𝒜′, (A ⊗_{A′} 𝒜′)(x) = 𝒜′(x ∘ g); (d) constant algebras: for a central simple K-algebra D, (A ⊗_K D)(x) = baseChange_{L/K}[D]. Lean: `TauCeti.BrauerManin.eval 𝒜 x : BrauerGroup L`.

Hypotheses: K, L fields, L a K-algebra; A commutative; 𝒜 Azumaya over A. All types in one universe, as Tau Ceti's BrauerGroup group structure requires.

Proof or construction:

1. Well-defined: L ⊗_{A,x} 𝒜 is Azumaya over L by RP.2/azumaya-base-change, hence central simple and finite-dimensional, so CSA.of applies.
2. (a) L′ ⊗_L (L ⊗_{A,x} 𝒜) ≅ L′ ⊗_{A,x′} 𝒜 (associativity of base change), and Tau Ceti BrauerGroup.baseChange_mk computes the class of the left side.
3. (b) L ⊗_A (𝒜 ⊗_A 𝒜′) ≅ (L ⊗_A 𝒜) ⊗_L (L ⊗_A 𝒜′) and L ⊗_A 𝒜ᵐᵒᵖ ≅ (L ⊗_A 𝒜)ᵐᵒᵖ; Tau Ceti mk_tensorProduct and mk_op. L ⊗_A End_A(P) ≅ End_L(L ⊗_A P) with L ⊗_A P a nonzero finite-dimensional L-vector space; Tau Ceti mk_end.
4. (c), (d): associativity of base change, L ⊗_{A,x} (A ⊗_{A′} 𝒜′) ≅ L ⊗_{A′, x∘g} 𝒜′ and L ⊗_A (A ⊗_K D) ≅ L ⊗_K D.

The required uses are:

- HeightsRationalPointsAndObstructions:RP.2/brauer-manin-pairing: The pairing sums the local invariants of the evaluations at the local components.
- HeightsRationalPointsAndObstructions:RP.2/rational-points-in-brauer-manin-set: Naturality of evaluation turns the pairing at a rational point into the reciprocity sum of one global class.
- Poonen Proposition 8.2.9 (coverage): Local constancy is a property of x ↦ 𝒜(x) on X(K_v).

The API supplies:

- TauCeti.BrauerManin.eval: eval 𝒜 x := BrauerGroup.mk (CSA.of L (L ⊗[A] 𝒜)) with A → L given by x.
- TauCeti.BrauerManin.eval_baseChange: eval 𝒜 (composite of x with L → L′) = BrauerGroup.baseChange L L′ (eval 𝒜 x).
- TauCeti.BrauerManin.eval_tensor: eval (𝒜 ⊗[A] 𝒜′) x = eval 𝒜 x * eval 𝒜′ x.
- TauCeti.BrauerManin.eval_op: eval 𝒜ᵐᵒᵖ x = (eval 𝒜 x)⁻¹.
- TauCeti.BrauerManin.eval_end: eval (Module.End A P) x = 1 for P finite projective of positive rank; in particular eval A x = 1.
- TauCeti.BrauerManin.eval_pullback: eval (A ⊗[A′] 𝒜′) x = eval 𝒜′ (x ∘ g) for g : A′ → A.
- TauCeti.BrauerManin.eval_const: eval (A ⊗[K] D) x = BrauerGroup.baseChange K L (BrauerGroup.mk D) for a central simple K-algebra D.
- TauCeti.BrauerManin.eval_congr: Isomorphic Azumaya A-algebras have equal evaluations.

Discriminating tests:

- TauCeti.BrauerManin.tests.trivial (degenerate): eval A x = 1 for the Azumaya algebra A itself and every point x.
- TauCeti.BrauerManin.tests.matrix (computation): eval (Matrix (Fin n) (Fin n) A) x = 1 for n ≥ 1.
- TauCeti.BrauerManin.tests.hamilton_real (computation): For K = ℚ, A = ℚ and 𝒜 the rational Hamilton quaternions, eval 𝒜 at the embedding ℚ → ℝ is the nontrivial element of Br(ℝ) (Tau Ceti Quaternion.brauerGroupMulEquiv sends it to the generator of ℤ/2).
- TauCeti.BrauerManin.tests.depends_on_point (non-example): For A = ℚ[t, 1/t] and 𝒜 = (−1, t)_A, the evaluations at the real points t = 1 and t = −1 differ (1 and the class of ℍ); evaluation is not constant on X(ℝ), which has two components.
- TauCeti.BrauerManin.tests.alg_closed (compatibility): If L is algebraically closed, eval 𝒜 x = 1 for every 𝒜 and x (Tau Ceti baseChange_eq_one_of_isAlgClosed applied through naturality, or directly since Br(L) is trivial).

Acceptance cases:

- The trivial algebra 𝒜 = A and matrix algebras evaluate to 1 at every point.
- Evaluation genuinely depends on the point: for K = ℚ, A = ℚ[t, 1/t] and the quaternion algebra 𝒜 = (−1, t)_A, 𝒜 evaluated at t = 1 in ℝ is split, and at t = −1 in ℝ it is the class of ℍ, the nontrivial element of Br(ℝ).

Prerequisites: HeightsRationalPointsAndObstructions:RP.2/azumaya-base-change, HeightsRationalPointsAndObstructions:RP.2/points-topology, tauceti:TauCeti.BrauerGroup.mk, tauceti:TauCeti.BrauerGroup.instCommGroup, tauceti:TauCeti.CSA.of, tauceti:TauCeti.BrauerGroup.baseChange, tauceti:TauCeti.BrauerGroup.baseChange_mk, tauceti:TauCeti.BrauerGroup.mk_tensorProduct, tauceti:TauCeti.BrauerGroup.mk_op, tauceti:TauCeti.BrauerGroup.mk_end, tauceti:TauCeti.BrauerGroup.mk_matrix, mathlib:BrauerGroup.

Sources:

- Poonen, §8.2.1, p. 229. Evaluation of a Brauer class at an L-point by pullback; for Azumaya algebras the pullback is the base change along the point.
- Poonen, §6.6.3.1, Definition 6.6.14, p. 189. The group law on Azumaya classes that evaluation respects.

### Spreading out an Azumaya algebra over an integral model

Declaration: TauCeti.BrauerManin.exists_azumaya_model. Node: HeightsRationalPointsAndObstructions:RP.2/azumaya-spreading-out.

Let K be a number field, A a finitely generated commutative K-algebra with integral model A₀ (RP.2/integral-model), and 𝒜 an Azumaya A-algebra. Then there are a nonzero N ∈ 𝓞_K and an Azumaya A₀[1/N]-algebra 𝒜₀ with A ⊗_{A₀[1/N]} 𝒜₀ ≅ 𝒜 as A-algebras.

Hypotheses: A = A₀ ⊗_{𝓞_K} K is the filtered colimit of the rings A₀[1/N], N ∈ 𝓞_K ∖ {0}.

Proof or construction:

1. 𝒜 is finitely presented as an A-module (finite projective) and as an A-algebra; choose a finite presentation of the module and of the multiplication table. Its finitely many coefficients lie in A₀[1/N] for some N, giving an A₀[1/N]-algebra 𝒜₀ with A ⊗ 𝒜₀ ≅ 𝒜 (descent of finitely presented objects to a stage of a filtered colimit).
2. Projectivity: a finitely presented module whose base change to the colimit is projective is projective after enlarging N (a projective module is a direct summand of a free one; the splitting is a finite amount of data and descends).
3. Bijectivity of 𝒜₀ ⊗ 𝒜₀ᵐᵒᵖ → End(𝒜₀): a map of finite projective modules which becomes bijective over the colimit is bijective after enlarging N (its inverse and the two composite identities are finitely many equations). Faithfulness: positive rank at every prime holds after enlarging N, since the rank function is locally constant and positive on A.
4. This is the Azumaya form of Poonen's Corollary 6.6.11 (spreading out a Brauer class), which Poonen proves for cohomological Brauer classes through the limit theorem for étale cohomology.

Acceptance cases:

- A constant algebra A ⊗_K D with D central simple over K spreads out over A₀[1/N] as A₀[1/N] ⊗ D₀ for any 𝓞_K[1/N]-order D₀ of D which is Azumaya over 𝓞_K[1/N] (N divisible by the ramified primes of D).

Prerequisites: HeightsRationalPointsAndObstructions:RP.2/integral-model, HeightsRationalPointsAndObstructions:RP.2/azumaya-base-change, mathlib:IsAzumaya, mathlib:IsLocalization.Away, mathlib:Module.Projective.

Sources:

- Poonen, §6.6, Corollary 6.6.11, p. 189. Spreading out a Brauer class to an S-integral model.
- Conrad, §3, Theorem 3.4(1), p. 5. Descent of finitely presented objects to a finite stage of a filtered colimit.

### Azumaya algebras over the integers of a nonarchimedean local field are split

Declaration: TauCeti.BrauerManin.azumaya_split_of_adicCompletionIntegers. Node: HeightsRationalPointsAndObstructions:RP.2/azumaya-complete-dvr-split.

Let K be a number field, v a finite place, O_v = v.adicCompletionIntegers K with residue field κ_v (finite), and 𝒜₀ an Azumaya O_v-algebra. Then 𝒜₀ ≅ End_{O_v}(P) for a free O_v-module P of positive finite rank. Consequently K_v ⊗_{O_v} 𝒜₀ is a matrix algebra and its Brauer class in Br(K_v) is trivial.

Hypotheses: O_v is a complete discrete valuation ring with finite residue field.

Proof or construction:

1. Residue algebra: κ_v ⊗ 𝒜₀ is Azumaya over the finite field κ_v (RP.2/azumaya-base-change), hence central simple, hence a matrix algebra M_n(κ_v), since Br(κ_v) is trivial (Tau Ceti subsingleton_brauerGroup_of_finite; Wedderburn).
2. Lifting an idempotent: 𝒜₀ is a finite free O_v-module, complete for the 𝔪_v-adic topology. A primitive idempotent ē of M_n(κ_v) of rank one lifts to an idempotent e ∈ 𝒜₀ (idempotents lift along the surjection 𝒜₀ → κ_v ⊗ 𝒜₀ with 𝔪-adically complete source: successive approximation e ↦ 3e² − 2e³).
3. P := 𝒜₀e is a direct summand of 𝒜₀, hence finite projective over the local ring O_v, hence free, of rank n since κ_v ⊗ P ≅ κ_v ⊗ 𝒜₀ ē ≅ κ_vⁿ. Left multiplication gives an O_v-algebra map 𝒜₀ → End_{O_v}(P) between free modules of rank n², which is an isomorphism modulo 𝔪_v (the matrix algebra acting on its column space), hence an isomorphism (Nakayama; a surjective endomorphism of a finite free module over a local ring with bijective reduction is bijective).
4. Base change to K_v gives End_{K_v}(K_v ⊗ P), whose class is 1 (Tau Ceti mk_end).
5. This is the Azumaya form of Poonen Corollary 6.9.3 (Br O_v = 0), which rests on Proposition 6.9.1 (Br of a complete local ring equals Br of its residue field), first proved for Azumaya algebras by Azumaya.

Acceptance cases:

- For the Hamilton quaternions over ℤ_p with p odd, the lemma gives an isomorphism with M₂(ℤ_p); over ℤ₂ the standard order is not Azumaya, consistent with ℍ being ramified at 2.

Prerequisites: HeightsRationalPointsAndObstructions:RP.2/azumaya-base-change, tauceti:TauCeti.subsingleton_brauerGroup_of_finite, tauceti:TauCeti.BrauerGroup.mk_end, mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers, mathlib:IsAdicComplete, mathlib:Module.Free, mathlib:IsAzumaya.

Sources:

- Poonen, §6.9.1, Corollary 6.9.3, p. 199. Br O_v = 0.
- Poonen, §6.9.1, Proposition 6.9.1, p. 198. The residue isomorphism for complete local rings, whose Azumaya form the proof above supplies for O_v.

### Brauer evaluation is trivial at almost all places

Declaration: TauCeti.BrauerManin.finite_eval_ne_one. Node: HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation-finite-support.

Let K be a number field, A a finitely generated commutative K-algebra, 𝒜 an Azumaya A-algebra and x ∈ X(𝔸_K) an adelic point (RP.2/adelic-points). Then 𝒜(x_v) = 1 in Br(K_v) for all but finitely many finite places v, where x_v is the local projection of x (RP.2/brauer-evaluation).

Hypotheses: K a number field; A finitely generated; 𝒜 Azumaya over A.

Proof or construction:

1. Choose an integral model A₀ (RP.2/integral-model-exists-unique (a)) and spread 𝒜 out to an Azumaya A₀[1/N]-algebra 𝒜₀ (RP.2/azumaya-spreading-out).
2. By RP.2/adelic-points-restricted-product, x_v ∈ X₀(O_v) for all but finitely many v; discard also the finitely many v dividing N. For the remaining v, x_v restricts to an 𝓞_K-algebra map A₀[1/N] → O_v (N is a unit in O_v).
3. Then K_v ⊗_{A, x_v} 𝒜 ≅ K_v ⊗_{O_v} (O_v ⊗_{A₀[1/N]} 𝒜₀), and O_v ⊗ 𝒜₀ is Azumaya over O_v (RP.2/azumaya-base-change), hence split (RP.2/azumaya-complete-dvr-split); so 𝒜(x_v) = 1.

Acceptance cases:

- For a constant algebra A ⊗_K D, the exceptional places are among the places where D ramifies, whatever the adelic point.
- The finite set depends on x: for A = ℚ[t, 1/t] and 𝒜 = (−1, t)_A, a point with t = p at the place p gives the local class of (−1, p) over ℚ_p, which is nontrivial for p ≡ 3 mod 4.

Prerequisites: HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation, HeightsRationalPointsAndObstructions:RP.2/azumaya-spreading-out, HeightsRationalPointsAndObstructions:RP.2/azumaya-complete-dvr-split, HeightsRationalPointsAndObstructions:RP.2/adelic-points-restricted-product, HeightsRationalPointsAndObstructions:RP.2/integral-model-exists-unique.

Sources:

- Poonen, §8.2.2, Proposition 8.2.1, p. 229. The statement; Poonen writes the Brauer group additively.
- Poonen, §8.2.2, proof of Proposition 8.2.1, p. 229. The spreading-out proof followed here.

### The Brauer–Manin pairing and the Brauer–Manin set

Declaration: TauCeti.BrauerManin.pairing. Node: HeightsRationalPointsAndObstructions:RP.2/brauer-manin-pairing.

Let K be a number field and A a finitely generated commutative K-algebra. For each place v let inv_v : Br(K_v) → ℚ/ℤ be the local invariant (finite places: the invariant map of local class field theory, requested from ClassFieldTheory Layer 5; real places: Br(ℝ) ≅ ½ℤ/ℤ; complex places: 0). For an Azumaya A-algebra 𝒜 and x ∈ X(𝔸_K), the Brauer–Manin pairing is ⟨𝒜, x⟩ := Σ_v inv_v(𝒜(x_v)) ∈ ℚ/ℤ, a finite sum by RP.2/brauer-evaluation-finite-support (only finitely many terms are nonzero, and there are finitely many infinite places). The Brauer–Manin set of 𝒜 is X(𝔸_K)^𝒜 := {x : ⟨𝒜, x⟩ = 0}, and X(𝔸_K)^Br := ⋂_𝒜 X(𝔸_K)^𝒜 over all Azumaya A-algebras. There is a Brauer–Manin obstruction to the local-global principle for X if X(𝔸_K) ≠ ∅ and X(𝔸_K)^Br = ∅. Lean: `TauCeti.BrauerManin.pairing`, `brauerSet`, `brauerManinSet`, with ℚ/ℤ as AddCircle (1 : ℚ).

Hypotheses: K a number field; A finitely generated; the local invariant maps are the requested ClassFieldTheory Layer 5 declarations (requests), used as given homomorphisms Br(K_v) → ℚ/ℤ. Br here is the Azumaya Brauer group of the affine scheme; the comparison with Poonen's cohomological Br X is recorded as a gap.

Proof or construction:

1. Finite support: RP.2/brauer-evaluation-finite-support at the finite places; the infinite places are finite in number.
2. The pairing is additive in 𝒜 (RP.2/brauer-evaluation (b) and additivity of each inv_v) and depends only on the Azumaya class; isomorphic algebras give the same sets.
3. X(𝔸_K)^𝒜 = X(𝔸_K) when 𝒜 is split (End_A(P)): every evaluation is 1.

The required uses are:

- HeightsRationalPointsAndObstructions:RP.2/rational-points-in-brauer-manin-set: Rational points lie in the Brauer–Manin set.
- HeightsRationalPointsAndObstructions:RP.3: Comparison of the descent obstruction with the Brauer–Manin set.
- HeightsRationalPointsAndObstructions:RP.6: The obstruction interface of the classification register.

The API supplies:

- TauCeti.BrauerManin.pairing: pairing 𝒜 x = Σ_v inv_v (eval 𝒜 (x_v)) in AddCircle (1 : ℚ), a finite sum.
- TauCeti.BrauerManin.pairing_tensor: pairing (𝒜 ⊗[A] 𝒜′) x = pairing 𝒜 x + pairing 𝒜′ x.
- TauCeti.BrauerManin.pairing_end: pairing (Module.End A P) x = 0 for P finite projective of positive rank.
- TauCeti.BrauerManin.brauerSet: brauerSet 𝒜 = {x | pairing 𝒜 x = 0}.
- TauCeti.BrauerManin.brauerManinSet: The intersection of brauerSet 𝒜 over all Azumaya A-algebras 𝒜.
- TauCeti.BrauerManin.HasObstruction: The proposition X(𝔸_K) ≠ ∅ ∧ brauerManinSet = ∅.

Discriminating tests:

- TauCeti.BrauerManin.tests.pairing_trivial (degenerate): pairing A x = 0 for every adelic point x, so brauerSet A = X(𝔸_K).
- TauCeti.BrauerManin.tests.pairing_matrix (computation): pairing (Matrix (Fin 2) (Fin 2) A) x = 0.
- TauCeti.BrauerManin.tests.empty (degenerate): If X(𝔸_K) is empty (for instance A = ℚ[X]/(X² + 1)), then HasObstruction is false.
- TauCeti.BrauerManin.tests.hamilton_constant (computation): For K = ℚ, A = ℚ and 𝒜 the Hamilton quaternions, X(𝔸_ℚ) is one point and pairing 𝒜 at it is inv_∞(ℍ) + inv_2(ℍ ⊗ ℚ₂) = ½ + ½ = 0.
- TauCeti.BrauerManin.tests.brauer_set_subset (compatibility): brauerManinSet ⊆ brauerSet 𝒜 ⊆ X(𝔸_K) for every 𝒜.

Acceptance cases:

- The Brauer–Manin set of the trivial algebra is all of X(𝔸_K).
- If X(𝔸_K) = ∅ there is no Brauer–Manin obstruction in this sense: the definition requires adelic points.
- A nonempty Brauer–Manin set does not by itself give a rational point (Poonen §8.6); the set is only an upper bound for the closure of X(K).

Prerequisites: HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation, HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation-finite-support, HeightsRationalPointsAndObstructions:RP.2/adelic-points, tauceti:TauCeti.Quaternion.brauerGroupMulEquiv, mathlib:AddCircle.

Sources:

- Poonen, §8.2.2, Definition 8.2.5, p. 230. The Brauer–Manin set of one class and of the whole Brauer group.
- Poonen, §8.2.3, Definition 8.2.7, p. 230. The obstruction to the local-global principle.

### Rational points lie in the Brauer–Manin set

Declaration: TauCeti.BrauerManin.diagonal_mem_brauerManinSet. Node: HeightsRationalPointsAndObstructions:RP.2/rational-points-in-brauer-manin-set.

Let K be a number field and A a finitely generated commutative K-algebra. For every K-point x ∈ X(K) and every Azumaya A-algebra 𝒜, ⟨𝒜, ι(x)⟩ = 0. Hence ι(X(K)) ⊆ X(𝔸_K)^Br, and a Brauer–Manin obstruction (X(𝔸_K) ≠ ∅, X(𝔸_K)^Br = ∅) implies X(K) = ∅.

Hypotheses: As in RP.2/brauer-manin-pairing; the reciprocity law Σ_v inv_v(res_v β) = 0 for β ∈ Br(K) is the requested ClassFieldTheory Layer 10 theorem (requests).

Proof or construction:

1. For x ∈ X(K), the local projections of ι(x) are x followed by K → K_v, so by naturality (RP.2/brauer-evaluation (a)) 𝒜(ι(x)_v) = res_v(𝒜(x)) with 𝒜(x) ∈ Br(K).
2. Hence ⟨𝒜, ι(x)⟩ = Σ_v inv_v(res_v(𝒜(x))), which vanishes by the reciprocity law of the Albert–Brauer–Hasse–Noether sequence 0 → Br K → ⊕_v Br K_v → ℚ/ℤ → 0.
3. The inclusion in X(𝔸_K)^Br follows for all 𝒜 at once, and the obstruction statement is its contrapositive.

Acceptance cases:

- For the constant algebra A ⊗ D of a central simple K-algebra D, the pairing vanishes on every adelic point whose local components come from K-points, and more generally ⟨A ⊗ D, x⟩ = Σ_v inv_v(D_v) = 0 for every adelic point (constant algebras give no obstruction).

Prerequisites: HeightsRationalPointsAndObstructions:RP.2/brauer-manin-pairing, HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation, HeightsRationalPointsAndObstructions:RP.2/adelic-points.

Sources:

- Poonen, §8.2.2, Proposition 8.2.2, p. 230. The statement.
- Poonen, §8.2.2, Corollary 8.2.6, p. 230. The inclusion of rational points in the Brauer–Manin set.

## Quantitative checks and boundaries

The Northcott transfer has an explicit set inclusion. If h is at most g plus C, then the B-sublevel set of g lies inside the (B+C)-sublevel set of h. The orientation cannot be reversed. On the natural numbers, h(n)=n has finite sublevel sets, while g(n)=0 does not, even though g is at most h. For bounded equivalence, the absolute-value inequality gives both required orientations and hence an equivalence of the native Northcott properties.

The representative n+(−1)ⁿ illustrates this transfer without being a constant translate. Its difference from n has absolute value one. Its B-sublevel is contained in the natural numbers at most B+1. Conversely, −n has an infinite zero-sublevel, so neither negation nor arbitrary nonzero scalar multiplication preserves Northcott finiteness. The quotient is a real vector space, but Northcott is a property of particular classes, not of every linear operation on those classes.

For pullback, projection from ℕ×Fin(2) to ℕ has two-point fibers. The pullback of n has at most twice as many points in each sublevel as n itself. Projection from ℕ×ℕ is still surjective, and therefore its pullback is injective on height classes, but its zero-sublevel contains every (0,m). Surjectivity detects bounded error; finite fibers preserve finite sublevels. The two hypotheses solve different mathematical problems.

The composition test uses the quadratic representative n² because the linear representative n would hide an order error: successor and doubling differ in composition by a constant, which vanishes in the quotient. For n², doubling after successor yields (2n+2)², while successor after doubling yields (2n+1)². Their difference is 4n+3 and is unbounded. This makes the test sensitive to the contravariant order.

A successful elaboration of the suggested statements is a signature check. Its placeholder proofs do not certify any of these mathematical assertions. The tests and elementary proof arguments are supplied so that independent review and implementation have specific falsifiable contracts.

## Remaining source and construction work

### HeightsRationalPointsAndObstructions:RP.0 — partial

The geometric height-machine construction: Construct the map from actual Picard classes of projective varieties to HeightClass of their chosen rational or algebraic point type. Read and decompose the Segre and coordinate-change bounds, the globally generated comparison, very ample difference presentations and their independence. Match the existing invertible-sheaf and Picard suppliers before writing signatures. This checkpoint gives the target vector space, not that map. The §14 Step 7 bridge is recorded in sourceIssues.

Absolute normalization and geometric Northcott applications: Import the reviewed arithmetic-height baseline and establish its precise projective and scheme-point comparison, field-extension normalization, degree restrictions and ampleness hypotheses. Native Northcott here is only the generic finite-sublevel property. No finiteness on the full algebraic closure is asserted.

Canonical and local heights on general abelian varieties: Read complete primary proofs, import ArithmeticDynamics:DY.1/tate-limit for the analytic limit, and supply the symmetric-line-bundle multiplication identity, uniqueness, quadratic polarization, local/global compatibility and comparison with the pinned elliptic half-x-height. Inspect actual pairing and regulator normalization. GZ.1/GZ.2 overlap is recorded as an ownership proposal, not a second construction.

### HeightsRationalPointsAndObstructions:RP.1 — not_read

General abelian Kummer geometry and finite generation: Decompose actual isogeny and fppf Kummer maps and the geometric realization of the protected elliptic-anchor abstract Selmer structures. Prove finite quotients and the height descent to finite generation, and compare the elliptic example to the existing explicit descent. Do not interpret a Selmer bound as an exact rank.

### HeightsRationalPointsAndObstructions:RP.2 — partial

Local constancy and closedness: Poonen Proposition 8.2.9 (Brauer evaluation is locally constant on X(K_v); proof through the henselisation at a point and the limit property of Br) and Corollary 8.2.11 (X(𝔸)^𝒜 open and closed, X(𝔸)^Br closed, the closure of X(K) inside X(𝔸)^Br, and the weak-approximation obstruction for proper X). The Azumaya form needs 'Br_Az of a henselian local ring injects into Br of its residue field' (Poonen Remark 6.9.2), not yet decomposed.

Non-affine varieties: Weil's topology on X(𝔸_K) for finite-type K-schemes by gluing (Conrad §3, Theorem 3.6 and Proposition 3.1), the proper case X(𝔸_K) = ∏_v X(K_v) (Poonen Exercise 3.4(d)), and the comparison with Grothendieck's X(𝔸_K) = X(Spec 𝔸_K). This checkpoint covers affine X only.

The cohomological Brauer group: Poonen defines Br X := H²_ét(X, 𝔾_m) (Definition 6.6.4); this checkpoint uses Azumaya algebras. Relate the two (Br_Az X ↪ Br X always; equality with the torsion of Br X for quasi-projective X, Gabber / de Jong) before identifying X(𝔸)^Br with Poonen's set; request the étale-cohomological Br X from its owner.

The functor-obstruction formalism of Poonen §8.1 (F-obstructions, functoriality Proposition 8.1.8 and Corollaries 8.1.9–8.1.10) and the descent obstruction are RP.3's and are not yet built.

Acceptance examples: a conic (Hasse principle for conics, imported from tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy) and a variety with an actual Brauer–Manin obstruction (Iskovskikh's conic bundle, Poonen §8.2.5, which is not affine and needs the non-affine theory).

Brauer constants and almost-everywhere local triviality: Process PAPER-HARPAZ-WITTENBERG-23 items 29,31,38,61: unramified Brauer classes, actual image Br₀, Br₁/Br₀, and Bω as almost-everywhere trivial localization in Brauer quotients. Do not replace this condition by constancy of evaluation functions. Effective tests for a specified finite subgroup of Br X.

### HeightsRationalPointsAndObstructions:RP.3 — not_read

Torsor descent and comparison of obstructions: Read Poonen §§6.5–6.9 and §9.5 and construct twists, stabilizers, local lifts and the precise equality/inclusion of obstruction sets under stated hypotheses. Reuse the elliptic twist and Weil–Châtelet specializations from the protected anchor. A scheme or torsor carrier must not be replaced by a proposition.

### HeightsRationalPointsAndObstructions:RP.4 — not_read

Parshin and Siegel proof decompositions: Read complete proof sources for uniformly bounded Parshin covers, ramification and field extensions. Import the R28.5 Shafarevich owner. Decompose Siegel with exact genus/boundary and DiophantineApproximation DT.2 input. Distinguish finite sets from effective height bounds or enumeration algorithms.

### HeightsRationalPointsAndObstructions:RP.5 — not_read

Mordell–Lang and Manin–Mumford: Acquire and read complete primary proofs with characteristic and field hypotheses, define the actual stabilizers and translates, and decompose finitely generated subgroup and torsion intersections. Positive-dimensional torsion translates remain valid infinite components.

Bogomolov and small-point equidistribution: Acquire and decompose the complete Ullmo/Zhang proofs for the number-field small-points theorem. Symmetric ampleness, the positive threshold and failure of Zariski density must be explicit; torsion classification and R28 finiteness do not prove this conclusion. Reconcile the ArithmeticDynamics DY.4 equidistribution owner.

### HeightsRationalPointsAndObstructions:RP.6 — not_read

Classification interfaces and frontier register: RP.6 is a process layer in the reviewed audit but was not dropped by accepted RS-03. Keep its coverage open until its interfaces, actual Jacobian point-transfer statements and worked genus cases are specified, or the maintainer accepts the rescope proposal. Conjectures must have no proved-result consumers.

## Source reading and corrections

The source used for this component is the undated 13-page author copy of de Jong's Notes on Heights, linked from his Spring 2022 Schemes course. The file was accessed on 2026-09-27 and has SHA-256 ad8618d15e8c940a12b975ae0c939fcdf4f4606dc22826920f2647c09e521c74. Pages 1–3 and 6–10 were read, including the entire height-machine construction in §14 and the bounded-height discussion in §17. Pages 4–5 and 11–13 are not included in this reading claim. Pages 2, 6, 8 and 9 were also inspected visually. These are course notes, not a claimed journal version of record.

The following findings concern exactly that copy and await independent review. The author's current PDF, course page, homepage, and a bounded web search for corrections were checked on 2026-09-27; no correction to these passages was located. They do not change the elementary quotient component. They identify repairs needed before the complete source proof can be used.

### HeightsRationalPointsAndObstructions/E1 — misprint

§3, proof of Lemma 3.1, p.2 in the undated 13-page author copy read 2026-09-27.

The equality for the logarithmic height needs log(max|xᵢ|/gcd(xᵢ)). The displayed lemma’s weaker upper bound by max|xᵢ| remains true. The stronger upper bound by log(max|xᵢ|) is what §11 uses.

Check: At [1:2], the height is log 2, whereas the displayed quotient is 2.

### HeightsRationalPointsAndObstructions/E2 — misprint

§11, paragraph before the left inverse, p.6 in the undated 13-page author copy read 2026-09-27.

The (m+1)-by-(n+1) matrix with m≥n and maximal rank has rank n+1, which gives its left inverse.

Check: The inclusion with matrix [[1,0],[0,1],[0,0]] has m=2,n=1, rank 2, and a left inverse; rank 3 is impossible.

### HeightsRationalPointsAndObstructions/E3 — error

§11, lower-bound calculation, p.6 in the undated 13-page author copy read 2026-09-27.

The equality identifying log max|yⱼ| with hₘ(y) requires primitive integer coordinates. Replace y=Ax by its primitive integer normalization y′; eBy′ is a nonzero scalar multiple of x. Apply the same upper estimate to y′. In the preceding maximum, the range for j is 0,…,m, not 0,…,n.

Check: For A=2I₂ and x=(1,1), y=(2,2), so log max|yⱼ|=log 2 while h₁([y])=0. For A=(0,1)ᵀ, n=0,m=1, the printed maximum over index 0 alone also misses the nonzero coordinate.

### HeightsRationalPointsAndObstructions/E4 — misprint

§14, Step 5, displayed equality, p.8 in the undated 13-page author copy read 2026-09-27.

Replace each displayed ϕ by the corresponding real-valued height h; the equality is in the height-class quotient.

Check: The earlier ϕ notation denotes maps into projective spaces, which cannot be added as real functions. The preceding tensor identity gives the intended sum of heights.

### HeightsRationalPointsAndObstructions/E5 — misprint

§14, Step 6 continuation, p.9 in the undated 13-page author copy read 2026-09-27.

Use Fact III for very ampleness of a tensor product of very ample bundles.

Check: Fact II gives difference presentations of arbitrary invertible modules; Fact III says that tensoring a very ample bundle with a globally generated one is very ample.

### HeightsRationalPointsAndObstructions/E6 — gap

§14, Step 7, p.9 in the undated 13-page author copy read 2026-09-27.

Insert the globally generated comparison: tensor a globally generated L by a sufficiently positive very ample N as in Fact IV; the Segre identity gives the height of its chosen generating sections as h(L⊗N)−h(N). Additivity identifies this with h(L). Apply this comparison to both L and f*L before asserting pullback.

Check: Step 3 only states the comparison for very ample L. A pullback of a very ample bundle can be trivial under a constant morphism and need not be very ample, so the cited step alone does not justify its second use.

### HeightsRationalPointsAndObstructions/E7 — misprint

§15, equation (15.0.1), p.9 in the undated 13-page author copy read 2026-09-27.

Use log(max{1,||1+a||ᵥ}) in the sum if this is the height comparison for [1:1+a]. Alternatively restrict a≠−1 and state an extended-log convention if only the weaker untruncated inequality is intended. The max version is the one supplied by Axiom 2.

Check: At a=−1 each displayed logarithm has zero argument. With the usual real logarithm this is undefined; the projective height itself is well defined and equals zero. The pointwise estimate (15.0.2) is meaningful at a=−1.

Poonen's author-hosted Rational points on varieties was acquired, but only the first three physical pages were read for metadata and contents; its mathematical chapters are not claimed decomposed here. Goren's Unlikely Intersections course PDF was acquired for triage; physical pages 1, 14 and 15 were inspected, and it supplies no node in this checkpoint. The Harpaz–Wittenberg routing records were read as maintainer requirements, not as a substitute for the primary paper. Source acquisition and proof decomposition for the remaining stages stay explicit in the gaps.

### HeightsRationalPointsAndObstructions/E8 — misprint

Source: Conrad, *Weil and Grothendieck approaches to adelic points*, §2, Example 2.2, p. 3 (author copy dated 2011-12-31).

Printed: “Moreover, if R′ is closed (resp. open) in R then X(R) → X(R′) is a closed (resp. open) embedding.”

Correction: Moreover, if R is closed (resp. open) in R′ then X(R) → X(R′) is a closed (resp. open) embedding.

Reason: In Example 2.2, R → R′ is a continuous map of topological rings, and the preceding sentence assumes it is a topological embedding, so R is (identified with) a subring of R′; the condition must be on R inside R′. The printed condition 'R′ closed in R' makes no sense for a subring R ⊊ R′, and the proof ('closed immersions of X into an affine space over R') uses Rⁿ closed (resp. open) in R′ⁿ. The following sentence ('if R is discrete in R′ then X(R) is discrete in X(R′)') has the correct orientation, and the examples (F in A_F, O_{F,S} in A_{F,S}, O_v open in F_v) are of this form.

Affects: nothing. Known: not found: the author's papers directory lists no erratum for adelictop.pdf (checked 2026-09-28); the published version was not consulted.

## Baseline and review handoff

The pinned commits are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Every baseline declaration in this packet was read in its source with its hypotheses. The packet cites the native closed-ball characterization of boundedness and the Northcott class itself, including its finite-sublevel field. The generated additive norm-bound theorem and the Northcott field also have their actual Lean names checked in the seed; those two names are absent from the textual declaration index and are not used as separate baseline references.

The reviewed audit's seven RP rows, AUDIT-09 review, accepted RS-03 decision and review, current roadmap stages, the link maps touching this roadmap, and relevant ArithmeticDynamics and GrossZagier consumers were checked. ArithmeticDirichletSeries and Multiquadratic serve as previously read nearby upstream examples, with their unchanged bytes verified for this snapshot. There is no inherited RP blueprint packet to preserve. The broad GZ.1 integrated source node does not provide a separate existing HeightClass carrier.

The two proposed planets are Heights modulo bounded functions and Northcott invariance under bounded error. The first names the construction users manipulate; the second names the result making a finite-point conclusion independent of the chosen representative. Pullback and the one-sided comparison are supporting declarations.

Resume at the geometric height-machine gap. Fix the actual point type and native Picard/invertible-sheaf suppliers, decompose the source's coordinate and Segre arguments, and prove the globally generated comparison before defining the full tensor-compatible assignment. Preserve the arithmetic normalization and elliptic factor-of-two boundary throughout. RP.1–RP.6 retain their own full-proof and supplier work; the foundational component is not evidence that those stages are complete.

The RP.2 component adds two sources, both read at the versions recorded in sourceVersions.

- **Poonen, *Rational points on varieties*.** The author PDF, whose hash matches the copy acquired in the first checkpoint. The sections read are §2.6.3, Exercise 3.4, §6.6.2–6.6.3, §6.9.1, §8.1 and §8.2.1–8.2.4.
- **Conrad, *Weil and Grothendieck approaches to adelic points*.** The author copy, read in §1–§3.

Its 55 new baseline declarations were checked against the pinned declaration index, and their declaration heads were read in the pinned source tree. Among them are:

- Mathlib's `RestrictedProduct` and its topology, the adele rings, `IsAzumaya` and `BrauerGroup`;
- Tau Ceti's Brauer group structure and base change, Br(𝔽_q) = 0, Br(ℝ) ≅ ℤ/2, and K discrete and closed in 𝔸_K.

The six RP.2 planets are:

- Adelic points;
- Adelic points as a restricted product;
- Brauer evaluation;
- Finite support of Brauer evaluation;
- The Brauer–Manin set;
- Rational points lie in the Brauer–Manin set.

The local invariants and the reciprocity law are requests, not constructions. In the suggested file they appear as clearly marked stand-ins and as an explicit reciprocity hypothesis, which the ClassFieldTheory owner's theorem will discharge.
