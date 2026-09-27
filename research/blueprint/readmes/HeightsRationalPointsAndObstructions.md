# Heights, rational points and obstructions

This is the first blueprint checkpoint for RP.0–RP.6. It develops the algebraic target of the geometric height machine and the finite-sublevel interface needed to use that target. Every declaration is a plan. The full geometric height machine has not yet been decomposed, and no stage is closed.

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

### HeightsRationalPointsAndObstructions:RP.2 — not_read

Adelic evaluation and unramified finite support: Read Poonen Chapter 8 and the Harpaz–Wittenberg source fully. Construct actual scheme adelic points, Brauer evaluation and the carrier comparison to ClassFieldTheory Layers 5/10 invariants and global reciprocity. For the unramified pairing use the full product of local points and prove finite support there; a restricted adelic carrier cannot replace it without comparison.

Brauer constants and almost-everywhere local triviality: Process PAPER-HARPAZ-WITTENBERG-23 items 29,31,38,61: unramified Brauer classes, actual image Br₀, Br₁/Br₀, and Bω as almost-everywhere trivial localization in Brauer quotients. Do not replace this condition by constancy of evaluation functions. Prove diagonal-point orthogonality via the actual invariant maps, and the finite-subgroup tests.

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

## Baseline and review handoff

The pinned commits are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Every baseline declaration in this packet was read in its source with its hypotheses. The packet cites the native closed-ball characterization of boundedness and the Northcott class itself, including its finite-sublevel field. The generated additive norm-bound theorem and the Northcott field also have their actual Lean names checked in the seed; those two names are absent from the textual declaration index and are not used as separate baseline references.

The reviewed audit's seven RP rows, AUDIT-09 review, accepted RS-03 decision and review, current roadmap stages, the link maps touching this roadmap, and relevant ArithmeticDynamics and GrossZagier consumers were checked. ArithmeticDirichletSeries and Multiquadratic serve as previously read nearby upstream examples, with their unchanged bytes verified for this snapshot. There is no inherited RP blueprint packet to preserve. The broad GZ.1 integrated source node does not provide a separate existing HeightClass carrier.

The two proposed planets are Heights modulo bounded functions and Northcott invariance under bounded error. The first names the construction users manipulate; the second names the result making a finite-point conclusion independent of the chosen representative. Pullback and the one-sided comparison are supporting declarations.

Resume at the geometric height-machine gap. Fix the actual point type and native Picard/invertible-sheaf suppliers, decompose the source's coordinate and Segre arguments, and prove the globally generated comparison before defining the full tensor-compatible assignment. Preserve the arithmetic normalization and elliptic factor-of-two boundary throughout. RP.1–RP.6 retain their own full-proof and supplier work; the foundational component is not evidence that those stages are complete.
