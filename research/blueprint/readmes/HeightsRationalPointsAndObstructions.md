# Heights, rational points and obstructions

This roadmap develops the arithmetic of rational points on varieties over number fields and
function fields: heights attached to line bundles and their canonical refinements on abelian
varieties, the Mordell–Weil theorem by descent, adelic points and the Brauer–Manin obstruction,
descent by torsors and the comparison of the resulting obstructions, Faltings' and Siegel's
finiteness theorems for curves, the structure of rational and torsion points on subvarieties of
abelian varieties (Manin–Mumford, Mordell–Lang, Bogomolov), and the classification of what is
proved for curves of each genus. Existence of points, finiteness, the structure of the set of
points, and the obstructions to the local-global principle are kept as separate statements; no
theorem here claims an algorithm for listing rational points.

## Scope and boundaries

- **Built on, never re-planned.** Mathlib's heights (`Height.AdmissibleAbsValues`,
  `Height.logHeight`, `Projectivization.logHeight`, `NumberField.absLogHeight₁`, the class
  `Northcott`, the descent theorem `CommGroup.fg_of_descent'` in its additive form
  `AddCommGroup.fg_of_descent'`), Tau Ceti's abelian varieties, line-bundle classes and Brauer
  groups of fields, and Tau Ceti's elliptic canonical height and Néron–Tate pairing.
- **Tau Ceti roadmaps imported.** EllipticCurves Layers 5–7 (pointed twists, Mordell–Weil and
  the explicit 2-descent for elliptic curves, the general Selmer-structure API on discrete Galois
  modules and the Weil–Châtelet group), ClassFieldTheory Layers 5, 10 and 13 (local invariants,
  the Albert–Brauer–Hasse–Noether sequence and reciprocity, the cyclic Hasse norm theorem),
  GlobalQuadraticForms Layer 5 (Hasse–Minkowski) and JacobianChallenge Layer F (Jacobians and the
  Abel–Jacobi map).
- **Atlas roadmaps imported.** SchemeAndStackFoundations (torsors and twisting SF.1, the scheme
  Brauer group key definition and its pullback, henselian and Hochschild–Serre inputs SF.2,
  curves, Picard groups and Riemann–Hurwitz SF.3, ample and very ample line bundles and
  intersection numbers SF.5), AbelianSchemesAndArithmeticModuli (cube and seesaw theorems, duals,
  isogenies, torsion, Poincaré reducibility), ArithmeticGaloisDuality (finiteness of
  H¹(G_{K,S}, M), Hermite's theorem, Poitou–Tate for tori), NeronModelsAndSemistableAbelianVarieties
  (Néron models of abelian schemes, Néron–Ogg–Shafarevich), DiophantineApproximationAndTranscendence
  (the subspace theorem and S-unit equations), and the number-field S-adic adapter of DT.2.
  Shafarevich finiteness enters Parshin’s comparison as an explicit hypothesis. The unconditional
  rational-point finiteness declaration is supplied by the independent RP.5 Vojta–Bombieri route.
- **Owned here and imported elsewhere.** The height machine, Tate's limit, Néron–Tate heights
  and their kernel (GrossZagierAndArithmeticHeights GZ.1, ArithmeticDynamics DY.1,
  EffectiveDiophantineMethods), Mordell–Weil for abelian varieties (GrossZagier, RankZeroOneBSD,
  AnabelianGeometry NC.5, ArithmeticStatistics ST.4), the Kodaira–Parshin construction
  (FaltingsFinitenessAndIsogenyTheorems R28.5), and the geometric reading of Weil–Châtelet classes
  as genus-one curves (EllipticCurves Layer 7 leaves it to the scheme-facing roadmap).
- **Not here.** Arithmetic intersection theory of adelic metrized line bundles (needed by the
  equidistribution input of the Bogomolov theorem; see the gaps), certified enumeration of rational
  points (EffectiveDiophantineMethods, ComputationalNumberTheory), the uniform Mordell–Lang bounds
  and the families height inequality (Part II directions of the routed papers), and the arithmetic
  of the elliptic anchor itself (EllipticCurves).

## Conventions

- **Fields with a product formula.** A generalized global field uses the native
  `Height.AdmissibleAbsValues` together with Conrad's extra conditions: infinitely many
  inequivalent nontrivial absolute values and excellent discrete valuation rings at the
  nonarchimedean places. Number fields and polarized function fields satisfy the stated
  contracts. The native class alone does not encode those conditions.
- **Normalization.** The projective height h_{K,n} at a point over a finite extension K′
  divides its relative height by [K′:K]. For number fields the absolute height is h_{ℚ,n};
  relative heights retain `totalWeight K`. The additive inequality consequently has the
  term log 2·totalWeight K before absolute normalization. Heights modulo uniformly bounded
  functions live in the native real module quotient `HeightClass`.
- **Canonical heights.** For L⁺=L⊗[-1]*L and L⁻=L⊗([-1]*L)⁻¹ use
  ĥ_L=(ĥ_{L⁺}+ĥ_{L⁻})/2. On an elliptic curve ĥ_{O(O)} is native `canonicalHeight`, which
  already halves the x-coordinate height. The unhalved polarization
  ĥ(a+b)−ĥ(a)−ĥ(b) is twice native `neronTatePairing`.
- **Local metrics.** Local norms use genuine absolute values. At complex places the usual
  norm carries its place weight; its square is not used as a triangle-inequality norm.
  Bounded point-metric families carry summable uniform log-ratio bounds. For local index
  counts over F/ℚ_p use the module absolute value q_F^(−ord_F), which is the [F:ℚ_p]-th
  power of the extension of the normalized ℚ_p norm. These two uses are kept explicit.
- **Cohomology and twisting.** Kummer theory is fppf; the étale/Galois formulation requires
  invertible degree. Twists use the inverse class: [Z^τ]=[Z]−π*τ for commutative G. In
  Harpaz–Wittenberg's notation σ=−τ and ε_τ=ε₀+PT(τ). Genus-one H¹(E) classes retain a
  marking of the Jacobian; forgetting it requires the Aut(E) orbit quotient.
- **Brauer groups and adeles.** Scheme Brauer groups belong to
  `SchemeAndStackFoundations:key/scheme-brauer`. Azumaya/cohomological comparison retains
  the ample-line-bundle hypothesis. For separated finite-type schemes, adelic points use
  the integral-model direct limit; proper schemes give the product of all local point
  spaces. Fixed-class Brauer evaluation is locally constant. No discrete topology on an
  infinite full Hom group is asserted.
- **Proof routes.** RP.5's Vojta–Bombieri Mordell assembly supplies RP.4's rational-point
  finiteness theorem. Parshin's construction supplies a separate conditional implication
  from Shafarevich finiteness. The two routes have one rational-point declaration. Deep
  proof inputs and unsupplied interfaces are identified in the obligation register below.

The packet is a target-level plan. The assertions below are mathematical targets, with proof
outlines and discriminating tests; they do not assert completed formal proofs. The suggested
Lean file records statements whose carriers exist at the pins, with real bodies for light
definitions. Metrics, cohomology and other missing carriers remain fully specified here.


<a id="rp-0"></a>
## RP.0. Height machine and canonical heights

The layer extends native normalized absolute heights to the line-bundle height machine, bounded-degree Northcott and general abelian canonical heights. Tate’s limit gives the symmetric and antisymmetric components; Northcott alone proves the number-field torsion kernel. Bounded point-metric families and a summably dominated contraction give local Néron functions. Family comparison and function-field subvariety heights have their additional geometric contracts stated separately.

**Named milestones:** [Absolute Weil height](#RP0-normalized-height), [Weil height machine](#RP0-weil-height-machine), [Northcott property](#RP0-northcott-ample), [Tate's limit](#RP0-tate-limit), [Néron–Tate height](#RP0-neron-tate-height), [Silverman–Tate theorem](#RP0-silverman-tate).

**Imported interfaces:** `AbelianSchemesAndArithmeticModuli:A1/relative-cube-and-power`, `AbelianSchemesAndArithmeticModuli:A1/relative-seesaw`, `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.5`.


<a id="RP0-uniform-boundedness"></a>
### Uniform boundedness at the top filter

*Lemma · node `HeightsRationalPointsAndObstructions:RP.0/uniform-boundedness` · declaration `bounded_top_iff` · module `TauCeti/NumberTheory/Height/Class`*

For h:X→ℝ, membership in the native boundedFilterSubmodule at the top filter is equivalent to the existence of C≥0 such that |h(x)|≤C for every x∈X.

Hypotheses and conventions:

- X, Y and Z are arbitrary types, with no topology or nonemptiness assumption; all functions take real values. Additional assumptions are stated explicitly.

Construction or proof:

1. Unfold native boundedFilterSubmodule and BoundedAtFilter. Asymptotics.isBigO_top changes the filter statement into one bound for every x, since the norm of the constant real one is one.
2. Replace a possibly negative bound C by max(C,0). This also handles X empty without a nonemptiness assumption. Conversely forget nonnegativity and use the native top-filter equivalence.

Checks:

- On the empty type C=0 works.
- The alternating sequence (−1)^n has bound 1.
- The sequence n on the natural numbers has no uniform bound.

Direct prerequisites:

- `mathlib:Filter.boundedFilterSubmodule`
- `mathlib:Filter.BoundedAtFilter`
- `mathlib:Asymptotics.isBigO_top`

Sources:

- [Aise Johan de Jong, *Notes on Heights*](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14, footnote 1 and Steps 1–7, pp.7–9. Elementary quotient interface extracted from the source’s height-class convention; the proof uses the listed native declarations.

<a id="RP0-height-class"></a>
### Heights modulo bounded functions

*Definition · node `HeightsRationalPointsAndObstructions:RP.0/height-class` · declaration `HeightClass` · module `TauCeti/NumberTheory/Height/Class`*

For any type X, HeightClass(X) is the native real module quotient of the function space X→ℝ by Filter.boundedFilterSubmodule at the top filter. Write [h] for the native linear quotient projection. It is a real vector space; no topology or pointwise evaluation of a class is supplied.

Hypotheses and conventions:

- X, Y and Z are arbitrary types, with no topology or nonemptiness assumption; all functions take real values. Additional assumptions are stated explicitly.

Construction or proof:

1. Specialize the native bounded-function submodule to real-valued functions and the top filter, then use the native submodule quotient. This is a transparent abbreviation, not another quotient relation or another boundedness predicate.
2. Use the inherited quotient module structure and mkQ. Constants belong to the submodule by const_boundedAtFilter, so their classes vanish. On a finite type every real function has a finite, hence bounded, range. The native metric boundedness criterion at center zero gives the Bornology compatibility statement.
3. For linear descent use native liftQ with the exact kernel-inclusion hypothesis; liftQ_apply and quot_hom_ext supply its computation and uniqueness interfaces.

Planning API:

- `TauCeti.HeightClass.mk` (constructor): The projection h↦[h] is exactly native mkQ, as a real linear map from functions to HeightClass(X).
- `TauCeti.HeightClass.mk_eq_mk_iff_isBounded` (compatibility): [h]=[g] exactly when the range of h−g is Bornology.IsBounded in ℝ.
- `TauCeti.HeightClass.mk_eq_zero_iff` (characterisation): [h]=0 exactly when there is C≥0 with |h(x)|≤C for every x.
- `TauCeti.HeightClass.mk_surjective` (data): Every height class has a real-valued function representative.
- `TauCeti.HeightClass.mk_zero` (simp): The class of the zero function is zero.
- `TauCeti.HeightClass.mk_add` (simp): [h+g]=[h]+[g].
- `TauCeti.HeightClass.mk_smul` (structure): For every real c, [c·h]=c·[h].
- `TauCeti.HeightClass.mk_const` (simp): For every real c, the class of the constant function with value c is zero.
- `TauCeti.HeightClass.mk_of_finite` (example): If X is finite, every function h:X→ℝ has zero class.
- `TauCeti.HeightClass.liftQ_mk` (universal-property): If L:(X→ℝ)→V is a real linear map annihilating the native bounded-function submodule, its native liftQ evaluated at [h] is L(h).
- `TauCeti.HeightClass.linearMap_ext` (extensionality): Two real linear maps from HeightClass(X) to V are equal if they agree on [h] for every function h.

Unit tests:

- **TauCeti.HeightClass.tests.empty** (degenerate): Every real function on the empty type has zero class.
- **TauCeti.HeightClass.tests.alternating** (computation): On ℕ the function n↦(−1)^n has zero class.
- **TauCeti.HeightClass.tests.unbounded** (non-example): On ℕ the function n↦n has nonzero class.
- **TauCeti.HeightClass.tests.affine_shift** (computation): On ℕ the functions n↦n+7 and n↦n have equal classes.
- **TauCeti.HeightClass.tests.native_quotient** (compatibility): For every h:X→ℝ, [h] is exactly Submodule.Quotient.mk(h) in the native module quotient.
- **TauCeti.HeightClass.tests.not_constants_only** (non-example): There is no real c such that (−1)^n=c for every natural n, although this sequence has zero class.
- **TauCeti.HeightClass.tests.not_ring_quotient** (non-example): On ℕ the constant functions 1 and 0 have equal classes, while n↦1·n and n↦0·n have different classes.

Checks:

- Bounded nonconstant functions vanish.
- A pointwise product of two classes is not defined: [1]=[0], but [n·1]≠[n·0].
- Finite point sets give the zero quotient.

Consumers:

- de Jong §14 footnote 1, Steps 4–6: Additivity and difference of very ample presentations are exact equalities in this quotient.
- de Jong §14 Step 7: Pullback of line bundles requires precomposition on this quotient.
- HeightsRationalPointsAndObstructions:RP.0/tate-limit and RP.0/neron-tate-height: Tate limits are taken of a representative; tateLimit_congr_bounded makes them functions of the class. ArithmeticDynamics DY.1 imports these.
- HeightsRationalPointsAndObstructions:RP.0 and RP.1: Native Northcott finiteness must be independent of the representative chosen for a geometric height.

Direct prerequisites:

- `mathlib:Filter.boundedFilterSubmodule`
- `mathlib:Filter.const_boundedAtFilter`
- `mathlib:Submodule.Quotient.mk`
- `mathlib:Submodule.Quotient.eq`
- `mathlib:Submodule.mkQ`
- `mathlib:Submodule.mkQ_surjective`
- `mathlib:Submodule.Quotient.mk_eq_zero`
- `mathlib:Submodule.liftQ`
- `mathlib:Submodule.liftQ_apply`
- `mathlib:Submodule.quot_hom_ext`
- `mathlib:Metric.isBounded_iff_subset_closedBall`
- [Uniform boundedness at the top filter](#RP0-uniform-boundedness) (`HeightsRationalPointsAndObstructions:RP.0/uniform-boundedness`)

Sources:

- [Aise Johan de Jong, *Notes on Heights*](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14, footnote 1 and Steps 1–7, pp.7–9. Elementary quotient interface extracted from the source’s height-class convention; the proof uses the listed native declarations.

<a id="RP0-equality-criterion"></a>
### The bounded-error equality criterion

*Lemma · node `HeightsRationalPointsAndObstructions:RP.0/equality-criterion` · declaration `mk_eq_mk_iff` · module `TauCeti/NumberTheory/Height/Class`*

For h,g:X→ℝ, [h]=[g] if and only if there is a real C≥0 such that |h(x)−g(x)|≤C for every x.

Hypotheses and conventions:

- X, Y and Z are arbitrary types, with no topology or nonemptiness assumption; all functions take real values. Additional assumptions are stated explicitly.

Construction or proof:

1. Use native Submodule.Quotient.eq to replace equality by membership of h−g in the bounded-function submodule.
2. Apply uniform-boundedness and evaluate subtraction pointwise. The bound is uniform over the whole chosen point type, not merely pointwise finite or bounded on a separately chosen finite subset.

Checks:

- [n+(−1)^n]=[n] on ℕ.
- [2n]≠[n] on ℕ.
- Equality of classes does not imply equality of values at a point.

Direct prerequisites:

- [Heights modulo bounded functions](#RP0-height-class) (`HeightsRationalPointsAndObstructions:RP.0/height-class`)
- [Uniform boundedness at the top filter](#RP0-uniform-boundedness) (`HeightsRationalPointsAndObstructions:RP.0/uniform-boundedness`)
- `mathlib:Submodule.Quotient.eq`

Sources:

- [Aise Johan de Jong, *Notes on Heights*](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14, footnote 1 and Steps 1–7, pp.7–9. Elementary quotient interface extracted from the source’s height-class convention; the proof uses the listed native declarations.

<a id="RP0-height-pullback"></a>
### Pullback of height classes

*Construction · node `HeightsRationalPointsAndObstructions:RP.0/height-pullback` · declaration `pullback` · module `TauCeti/NumberTheory/Height/Class`*

For any function f:X→Y, pullback(f):HeightClass(Y)→HeightClass(X) is the real linear map induced by precomposition: [h]↦[h∘f]. For X→Y→Z, pullback(g∘f)=pullback(f)∘pullback(g). No finite-fiber assumption is needed to define this map.

Hypotheses and conventions:

- X, Y and Z are arbitrary types, with no topology or nonemptiness assumption; all functions take real values. Additional assumptions are stated explicitly.

Construction or proof:

1. Form the native precomposition linear map from LinearMap.pi and LinearMap.proj: its x-coordinate is evaluation at f(x).
2. If h is bounded by C everywhere on Y, h∘f has the same bound on X. By uniform-boundedness this is exactly the submodule compatibility required by native mapQ.
3. Use native mapQ with that compatibility proof. Its evaluation, identity and composition theorems give the representative formula and contravariant functor laws. Constant f produces a constant representative, hence the zero map.

Planning API:

- `TauCeti.HeightClass.pullback_mk` (simp): For f:X→Y and h:Y→ℝ, pullback(f)([h])=[h∘f].
- `TauCeti.HeightClass.pullback_id` (functoriality): Pullback of the identity on X is the identity linear map on HeightClass(X).
- `TauCeti.HeightClass.pullback_comp` (functoriality): For f:X→Y and g:Y→Z, pullback(g∘f)=pullback(f) composed with pullback(g).
- `TauCeti.HeightClass.pullback_add` (structure): Pullback(f)(a+b)=pullback(f)(a)+pullback(f)(b).
- `TauCeti.HeightClass.pullback_smul` (structure): Pullback(f)(c·a)=c·pullback(f)(a) for real c.
- `TauCeti.HeightClass.pullback_const` (example): For any y∈Y, pullback of the constant map X→Y with value y is the zero linear map.

Unit tests:

- **TauCeti.HeightClass.pullback_tests.double** (computation): Pullback of [n] along n↦2n on ℕ is 2[n].
- **TauCeti.HeightClass.pullback_tests.constant** (degenerate): Pullback of [n] along the constant zero map ℕ→ℕ is zero.
- **TauCeti.HeightClass.pullback_tests.composition** (characterisation): Pullback of [n²] along doubling after successor is pullback along successor of pullback along doubling of [n²].
- **TauCeti.HeightClass.pullback_tests.noninjective** (non-example): Pullback along the constant zero map ℕ→ℕ is not injective.

Checks:

- On ℕ, pullback of [n] along doubling is 2[n].
- Pullback along a constant map is zero.
- Composition reverses order.

Consumers:

- de Jong §14 Step 7: The tensor-compatible height assignment is contravariant under maps on rational points.
- HeightsRationalPointsAndObstructions:RP.0/tate-limit (imported by ArithmeticDynamics DY.1): A self-map acts on the bounded-error input class; the condition of being an eigenclass is independent of representatives.
- HeightsRationalPointsAndObstructions:RP.0: Restriction to a subset of points, and the point maps induced by morphisms, use the same pullback construction.

Direct prerequisites:

- [Heights modulo bounded functions](#RP0-height-class) (`HeightsRationalPointsAndObstructions:RP.0/height-class`)
- [Uniform boundedness at the top filter](#RP0-uniform-boundedness) (`HeightsRationalPointsAndObstructions:RP.0/uniform-boundedness`)
- `mathlib:LinearMap.pi`
- `mathlib:LinearMap.proj`
- `mathlib:Submodule.mapQ`
- `mathlib:Submodule.mapQ_apply`
- `mathlib:Submodule.mapQ_id`
- `mathlib:Submodule.mapQ_comp`
- `mathlib:Filter.const_boundedAtFilter`

Sources:

- [Aise Johan de Jong, *Notes on Heights*](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14, footnote 1 and Steps 1–7, pp.7–9. Elementary quotient interface extracted from the source’s height-class convention; the proof uses the listed native declarations.

<a id="RP0-surjective-pullback"></a>
### Surjective maps detect height classes

*Lemma · node `HeightsRationalPointsAndObstructions:RP.0/surjective-pullback` · declaration `pullback_injective_of_surjective` · module `TauCeti/NumberTheory/Height/Class`*

If f:X→Y is surjective, pullback(f):HeightClass(Y)→HeightClass(X) is injective.

Hypotheses and conventions:

- X, Y and Z are arbitrary types, with no topology or nonemptiness assumption; all functions take real values. Additional assumptions are stated explicitly.

Construction or proof:

1. Choose representatives h and g for two classes, using native mkQ_surjective. The definition through mapQ says equality of pullbacks is equality of [h∘f] and [g∘f].
2. Use equality-criterion to obtain C bounding |h(f(x))−g(f(x))| on all X. For each y choose an x with f(x)=y; the same C bounds the difference on Y.
3. Apply equality-criterion on Y. No finiteness of the fibers is used.

Checks:

- A bijection gives an isomorphism through its inverse pullback.
- Projection ℕ×ℕ→ℕ is surjective and detects classes even though it does not preserve Northcott finiteness.

Direct prerequisites:

- [Pullback of height classes](#RP0-height-pullback) (`HeightsRationalPointsAndObstructions:RP.0/height-pullback`)
- [The bounded-error equality criterion](#RP0-equality-criterion) (`HeightsRationalPointsAndObstructions:RP.0/equality-criterion`)
- `mathlib:Submodule.mkQ_surjective`
- `mathlib:Submodule.mapQ_apply`

Sources:

- [Aise Johan de Jong, *Notes on Heights*](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14, footnote 1 and Steps 1–7, pp.7–9. Elementary consequence of the source’s bounded-error and pullback convention; not attributed as a separately stated source theorem.

<a id="RP0-northcott-one-sided"></a>
### Northcott transfer under a lower comparison

*Lemma · node `HeightsRationalPointsAndObstructions:RP.0/northcott-one-sided` · declaration `northcott_of_le_add` · module `TauCeti/NumberTheory/Height/Class`*

Let h,g:X→ℝ and C∈ℝ satisfy h(x)≤g(x)+C for every x. If h is Northcott in the native sense, then g is Northcott.

Hypotheses and conventions:

- X, Y and Z are arbitrary types, with no topology or nonemptiness assumption; all functions take real values. Additional assumptions are stated explicitly.

Construction or proof:

1. Fix a real B. If g(x)≤B, then h(x)≤B+C. Thus the B-sublevel set of g is a subset of the (B+C)-sublevel set of h.
2. Apply native Northcott.finite_le and finite-set subset closure. This constructs the native Northcott instance for g; it introduces no second finiteness predicate.

Checks:

- Take h(n)=n and g(n)=n+(−1)^n, with C=1.
- The reversed inequality is insufficient: 0≤n on ℕ, while n is Northcott and the constant zero function is not.

Direct prerequisites:

- `mathlib:Northcott`

Sources:

- [Aise Johan de Jong, *Notes on Heights*](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §17, p.10, with §14 footnote 1, p.7. Explicit elementary sublevel-set proof supplying the representative interface for the finiteness notion used by the source. No projective Northcott theorem is re-planned.

<a id="RP0-northcott-invariance"></a>
### Northcott invariance under bounded error

*Theorem · node `HeightsRationalPointsAndObstructions:RP.0/northcott-invariance` · declaration `northcott_congr` · module `TauCeti/NumberTheory/Height/Class`*

If h,g:X→ℝ have equal height classes, then native Northcott(h) holds if and only if native Northcott(g) holds.

Hypotheses and conventions:

- X, Y and Z are arbitrary types, with no topology or nonemptiness assumption; all functions take real values. Additional assumptions are stated explicitly.

Construction or proof:

1. Use equality-criterion to choose C≥0 with |h(x)−g(x)|≤C for every x. The absolute-value inequality gives both h(x)≤g(x)+C and g(x)≤h(x)+C.
2. Apply northcott-one-sided to each comparison. Both implications use the same C; no representative selection is part of the resulting statement.

Checks:

- n and n+(−1)^n on ℕ both have finite sublevel sets.
- n and −n on ℕ are not boundedly equivalent; only the first is Northcott.
- On a fixed field, this transfers an imported arithmetic-height finiteness theorem to any boundedly equal geometric representative. It does not assert finiteness over an algebraic closure without a degree restriction.

Direct prerequisites:

- [The bounded-error equality criterion](#RP0-equality-criterion) (`HeightsRationalPointsAndObstructions:RP.0/equality-criterion`)
- [Northcott transfer under a lower comparison](#RP0-northcott-one-sided) (`HeightsRationalPointsAndObstructions:RP.0/northcott-one-sided`)
- `mathlib:Northcott`

Sources:

- [Aise Johan de Jong, *Notes on Heights*](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14 footnote 1, p.7; §17, p.10. Combines the source’s bounded-error convention with the native finite-sublevel definition by the displayed two inclusions.

<a id="RP0-northcott-pullback"></a>
### Northcott for a boundedly equal pullback

*Theorem · node `HeightsRationalPointsAndObstructions:RP.0/northcott-pullback` · declaration `northcott_of_pullback_eq` · module `TauCeti/NumberTheory/Height/Class`*

Let f:X→Y have finite fibers, in the native TendstoCofinite sense. Let h:Y→ℝ be Northcott and g:X→ℝ satisfy [g]=pullback(f)([h]). Then g is Northcott.

Hypotheses and conventions:

- X, Y and Z are arbitrary types, with no topology or nonemptiness assumption; all functions take real values. Additional assumptions are stated explicitly.

Construction or proof:

1. Native Northcott.comp_of_finite_fibers gives Northcott(h∘f); use the native finite-fiber typeclass and its singleton-fiber characterization.
2. The mapQ representative formula rewrites the hypothesis as [g]=[h∘f]. Apply northcott-invariance. This only adds the bounded-error bridge; the finite-fiber theorem is imported.

Checks:

- For projection ℕ×Fin(2)→ℕ and h(n)=n, the pullback has finite sublevels.
- For projection ℕ×ℕ→ℕ, the zero-sublevel set contains all (0,m), so finite fibers cannot be omitted.

Direct prerequisites:

- [Pullback of height classes](#RP0-height-pullback) (`HeightsRationalPointsAndObstructions:RP.0/height-pullback`)
- [Northcott invariance under bounded error](#RP0-northcott-invariance) (`HeightsRationalPointsAndObstructions:RP.0/northcott-invariance`)
- `mathlib:Submodule.mapQ_apply`
- `mathlib:Northcott.comp_of_finite_fibers`
- `mathlib:Filter.TendstoCofinite`
- `mathlib:Filter.tendstoCofinite_iff_finite_preimage_singleton`

Sources:

- [Aise Johan de Jong, *Notes on Heights*](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14 Step 7, p.9; §17, p.10. A reusable consequence of pullback and finite-sublevel finiteness, explicitly built on the native finite-fiber result. It assumes no unstated ampleness or arithmetic theorem.

<a id="RP0-generalized-global-field"></a>
### Generalized global fields

*Definition · node `HeightsRationalPointsAndObstructions:RP.0/generalized-global-field` · module `TauCeti/NumberTheory/Height/GlobalField`*

A generalized global field is a field K with an admissible family of absolute values in the sense of Mathlib's Height.AdmissibleAbsValues K (a finite multiset of archimedean absolute values counted with multiplicity, a set of nonarchimedean ones, finite support of every nonzero element, and the product formula), with an infinite set of pairwise inequivalent nontrivial absolute-value classes, such that every nonarchimedean member is discretely valued with excellent valuation ring in K. A finite extension K'/K inside a fixed algebraic closure receives the extended family by the algebraic method: each v extends to the finitely many w | v, normalised so that the restriction of the w-absolute value to K is the v-absolute value raised to [K'_w : K_v]·e_v/e_w (e = 2 at complex places, 1 otherwise). The extended family again satisfies the product formula, and the construction is transitive in towers.

Hypotheses and conventions:

- K a field; the archimedean multiplicity convention is Mathlib's: a complex place occurs twice in the multiset, which is Conrad's exponent e_v = 2.
- Excellence of the nonarchimedean valuation rings is automatic in characteristic 0.

Construction or proof:

1. Start with Conrad Definition 8.1, including the infinite inequivalent nontrivial place classes and excellent discrete valuation rings in K. Encode finite support and the product formula through AdmissibleAbsValues, and prove the equivalence of weighted and multiplicity conventions; do not identify the native class with the stronger structure.
2. Extension: K' ⊗_K K_v is reduced (separability of K_v/K, from excellence), so it splits as the product of the K'_w; the norm formula gives the product formula for the extended family (Conrad §8, display before Example 8.5).
3. Transitivity in towers follows from multiplicativity of local degrees.

Planning API:

- `TauCeti.GeneralizedGlobalField` (structure): Class extending Height.AdmissibleAbsValues K by infinitude, inequivalence and nontriviality of place classes, and by discreteness and excellence of their valuation rings in K. A correspondence with Conrad’s weighted convention must be proved.
- `TauCeti.GeneralizedGlobalField.ofNumberField` (instance): A number field with Mathlib's instance NumberField.instAdmissibleAbsValues is a generalized global field.
- `TauCeti.GeneralizedGlobalField.extend` (constructor): For a finite extension K'/K, the family obtained by the algebraic method is a generalized global field structure on K'.
- `TauCeti.GeneralizedGlobalField.extend_restrict` (characterisation): For w | v, the restriction of |·|_w to K equals |·|_v^{[K'_w:K_v]e_v/e_w}.
- `TauCeti.GeneralizedGlobalField.extend_trans` (functoriality): Extending along K''/K'/K in two steps gives the same family as extending along K''/K.
- `TauCeti.GeneralizedGlobalField.extend_numberField` (compatibility): For number fields K ⊆ K', the extended family on K' is NumberField.instAdmissibleAbsValues K'.

Unit tests:

- **GeneralizedGlobalField.test_rat_product_formula** (computation): For K = ℚ and x = 2 the archimedean factor is 2 and the nonarchimedean factors multiply to 1/2.
- **GeneralizedGlobalField.test_extend_self** (degenerate): Extending along K'/K with K' = K returns the original family.
- **GeneralizedGlobalField.test_numberField** (compatibility): For K' = ℚ(i) the extended family from ℚ has one archimedean member of multiplicity two, as in Mathlib's instance.
- **GeneralizedGlobalField.test_no_archimedean** (non-example): The p-adic absolute values of ℚ alone (no archimedean member) violate the product formula at x = 2.

Checks:

- For K = ℚ with Mathlib's instance the product formula at x = 2 reads 2 · (1/2) = 1.
- The extended family on a number field K' is Mathlib's own instance on K' (Conrad Example 8.5).

Consumers:

- Conrad §9, definition of h_{K,n}: heights over K̄ are normalised through the extended families on finite subextensions
- Xie–Yuan 2022, §1.1: the geometric heights of a finitely generated field K/k are heights for such a structure (model-mk-height)
- HeightsRationalPointsAndObstructions:RP.0/normalized-height: the projective height is defined for any generalized global field

Direct prerequisites:

- `mathlib:Height.AdmissibleAbsValues`
- `mathlib:NumberField.instAdmissibleAbsValues`

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §8, Definition 8.1 and the algebraic method for finite extensions, author copy pp. 27–29. Defines generalized global fields by a product-formula family of absolute values with discrete excellent nonarchimedean members, and extends such a structure canonically through finite extensions.
- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §8, Example 8.3 and Example 8.5, pp. 27–29. The arithmetic case is a number field with its normalised absolute values; the algebraic method recovers the normalised absolute values of a finite extension.

<a id="RP0-geometric-height-field"></a>
### Polarized function fields as generalized global fields

*Construction · node `HeightsRationalPointsAndObstructions:RP.0/geometric-height-field` · module `TauCeti/NumberTheory/Height/FunctionField`*

Let k be a field, K/k a finitely generated extension with k algebraically closed in K and trdeg_k K ≥ 1, and (V, N) a polarization: V a normal projective k-variety with function field K and N an ample line bundle on V. For each prime divisor D of V put |x|_D = exp(−deg_N(D)·ord_D(x)) with deg_N(D) = (c₁(N)^{dim V−1}·D). These absolute values make K a generalized global field (all nonarchimedean). The elements with |x|_D = 1 for every D are exactly the nonzero constants k^×. If K'/K is finite with normalisation V' of V in K', constant field k' and pulled-back N', the algebraic-method family on K' is the (V', N') family raised to the power [k' : k].

Hypotheses and conventions:

- k algebraically closed in K; V normal (regular in codimension one suffices) and projective; N ample.
- When dim V = 1, V is unique and deg_N(D) = [k(D) : k] does not depend on N.

Construction or proof:

1. The product formula is the vanishing of deg_N of a principal divisor (Conrad Example 8.4), via SF.5 intersection numbers: deg_N(div f) = c₁(N)^{dim V−1}·div f = 0.
2. Finite support: a nonzero rational function has finitely many zero and polar divisors.
3. Extension: Conrad Lemma 8.6 compares the two families through leading coefficients of Hilbert polynomials (projection formula for the finite map V' → V).

Planning API:

- `TauCeti.GeneralizedGlobalField.ofPolarization` (constructor): The generalized global field structure on K defined by a polarization (V, N).
- `TauCeti.GeneralizedGlobalField.ofPolarization_absVal` (simp): |x|_D = exp(−deg_N(D)·ord_D x) for every prime divisor D of V.
- `TauCeti.GeneralizedGlobalField.ofPolarization_eq_one_iff` (characterisation): |x|_D = 1 for all D iff x ∈ k^×.
- `TauCeti.GeneralizedGlobalField.ofPolarization_curve` (compatibility): If dim V = 1 the family is independent of N, with weight [k(D):k].
- `TauCeti.GeneralizedGlobalField.extend_ofPolarization` (functoriality): For finite K'/K the extended family equals the (V', N') family to the power [k':k] (Conrad Lemma 8.6).

Unit tests:

- **ofPolarization.test_projectiveLine** (computation): V = ℙ¹_k, N = O(1), x = t: |t|_0 = e^{−1}, |t|_∞ = e, all other values 1, product 1.
- **ofPolarization.test_constants** (degenerate): Every c ∈ k^× has |c|_D = 1 for every D.
- **ofPolarization.test_curve_independent** (compatibility): For a curve V, replacing N by N^{⊗2} does not change the family.
- **ofPolarization.test_unweighted_fails** (non-example): On ℙ² with f = q/x² (q a smooth conic) the unweighted orders violate the product formula; the deg_N weights repair it.

Checks:

- For V = ℙ²_k, N = O(1) and f = q/x² with q a smooth conic, the weighted orders are 2·1 − 1·2 = 0 while the unweighted orders sum to −1.

Consumers:

- Xie–Yuan 2022 (1.1)–(1.3): naive and canonical heights over K are heights for this structure
- Gao–Habegger 2019 §2.1: the curve case K = k(S̄) with weights [k(v):k]
- HeightsRationalPointsAndObstructions:RP.1/lang-neron: Lang–Néron is proved with this height theory (Conrad §7, §10)

Direct prerequisites:

- [Generalized global fields](#RP0-generalized-global-field) (`HeightsRationalPointsAndObstructions:RP.0/generalized-global-field`)
- `SchemeAndStackFoundations:SF.5`

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §8, Example 8.4 and Lemma 8.6, author copy pp. 27–29. The geometric case: weights e^{−deg_{k,N}(v)} on codimension-one points of a normal projective model give the product formula; Lemma 8.6 compares the algebraic-method extension with the model of the normalisation, with exponent [k':k].
- [J. Xie, X. Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*](https://arxiv.org/abs/2108.09722v1), §1.1, pp. 1–2. Projective models and polarizations (S, M) of a finitely generated K/k, the data that define the geometric heights of the paper.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP0-normalized-height"></a>
### The normalised projective height

*Construction · node `HeightsRationalPointsAndObstructions:RP.0/normalized-height` · module `TauCeti/NumberTheory/Height/Normalized`*

For a generalized global field K with algebraic closure K̄ and n ≥ 0, h_{K,n} : ℙⁿ(K̄) → ℝ_{≥0} sends [t₀ : … : t_n] with t_i in a finite subextension K'/K to [K':K]^{-1}·Σ_{w} log max_i |t_i|_w^{e_w} (sum over the extended family of K'). It does not depend on K', on the homogeneous coordinates, or on the choice of K̄, and it is Aut(K̄/K)-invariant. For x ∈ ℙⁿ(K) it equals Mathlib's Projectivization.logHeight over K. For K = ℚ it is the absolute logarithmic Weil height h on ℙⁿ(ℚ̄); for x ∈ ℙⁿ(L) with L a number field, [L:ℚ]·h(x) is Mathlib's logHeight over L, and h([x : 1]) = NumberField.absLogHeight₁ x.

Hypotheses and conventions:

- K a generalized global field; the coordinates lie in a finite subextension.

Construction or proof:

1. Independence of K' from Σ_{w''|w}[K''_{w''}:K'_w] = [K'':K'] (Conrad §9).
2. Independence of coordinates from the product formula (Mathlib Height.mulHeight_smul_eq_mulHeight over K').
3. Galois invariance: σ permutes the places of σK' preserving local degrees.

Planning API:

- `TauCeti.normalizedHeight` (constructor): h_{K,n} : Projectivization K̄ (Fin (n+1) → K̄) → ℝ.
- `TauCeti.normalizedHeight_of_mem` (characterisation): If the coordinates lie in K', h_{K,n}(x) = [K':K]^{-1}·logHeight over K' of the coordinate vector.
- `TauCeti.normalizedHeight_algebraMap` (compatibility): For x defined over K, h_{K,n}(x) = Projectivization.logHeight x over K.
- `TauCeti.normalizedHeight_nonneg` (other): h_{K,n} ≥ 0.
- `TauCeti.normalizedHeight_galois` (functoriality): h_{K,n}(σx) = h_{K,n}(x) for σ ∈ Aut(K̄/K).
- `TauCeti.absHeight_eq_absLogHeight₁` (compatibility): For K = ℚ and x ∈ ℚ̄, h_{ℚ,1}([x:1]) = NumberField.absLogHeight₁ x.

Unit tests:

- **normalizedHeight.test_one_two** (computation): h_{ℚ,1}([1:2]) = log 2.
- **normalizedHeight.test_coordinate_point** (degenerate): h_{K,n}([1:0:…:0]) = 0.
- **normalizedHeight.test_sqrt_two** (computation): h_{ℚ,1}([√2 : 1]) = (1/2)·log 2.
- **normalizedHeight.test_relative_differs** (non-example): Mathlib's logHeight over ℚ(i) of the vector (2, 1) is 2·log 2, twice the normalised h_{ℚ,1}([2:1]) = log 2.

Checks:

- h_ℚ([1 : 2]) = log 2; h_ℚ([√2 : 1]) = (1/2)·log 2.

Consumers:

- Yuan 2026 §4.3.1: the absolute height of algebraic points entering the arithmetic bigness comparisons
- Tsimerman 2018 §6.2: heights of CM coordinates of bounded degree
- HeightsRationalPointsAndObstructions:RP.0/weil-height-machine: normalisation: very ample heights are pullbacks of h_{K,n}

Direct prerequisites:

- [Generalized global fields](#RP0-generalized-global-field) (`HeightsRationalPointsAndObstructions:RP.0/generalized-global-field`)
- `mathlib:Projectivization.logHeight`
- `mathlib:Height.mulHeight_smul_eq_mulHeight`
- `mathlib:NumberField.absLogHeight₁`

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, definition of h_{K,n} (first display of §9) and Remark 9.1, author copy pp. 29–30. The standard K-height on ℙⁿ(K̄) normalised by [K':K], independent of K' and invariant under Aut(K̄/K); in the arithmetic case one divides by [K:ℚ] to get an absolute height.
- [Xinyi Yuan and Shou-Wu Zhang, *Adelic line bundles over quasi-projective varieties*](https://arxiv.org/abs/2108.05625v4), §4.3.1, canonical height normalization, arXiv:2108.05625v4 pp.70–72. The absolute number-field projective height with the [K':ℚ]^{-1} normalisation, squared complex absolute values, and its independence of coordinates and of the field.
- [J. Tsimerman, *The André–Oort conjecture for A_g*](https://annals.math.princeton.edu/2018/187-2/p02), §6.2, p. 387. Uses the absolute coordinate height of algebraic points with bounded degree.

<a id="RP0-extension-invariance"></a>
### Heights under finite extension of the base field

*Lemma · node `HeightsRationalPointsAndObstructions:RP.0/extension-invariance` · declaration `TauCeti.logHeight_baseChange` · module `TauCeti/NumberTheory/Height/Machine`*

Let K be a generalized global field and K'/K a finite extension with the extended structure. The relative projective logarithmic height satisfies h_{K',n}(x) = [K':K]·h_{K,n}(x), for x in projective space over a common algebraic closure. For x rational over K this is the corresponding Mathlib logHeight base-change formula. Absolute normalized height, with the base-field normalization also divided out, is unchanged. The line-bundle version is an API of weil-height-machine, after that construction.

Hypotheses and conventions:

- K'/K finite; K' carries the structure of generalized-global-field (extend).

Construction or proof:

1. For v on K: Σ_{w|v} [K'_w:K_v] = [K':K] (reducedness of K' ⊗ K_v).
2. For x ∈ K, log|x|_w^{e_w} = [K'_w:K_v]·log|x|_v^{e_v} by extend_restrict; summing over w | v and then over v gives the identity.

Checks:

- For K = ℚ, K' = ℚ(i) and x = [2:1], the two sides are 2·log 2.

Direct prerequisites:

- [The normalised projective height](#RP0-normalized-height) (`HeightsRationalPointsAndObstructions:RP.0/normalized-height`)
- [Generalized global fields](#RP0-generalized-global-field) (`HeightsRationalPointsAndObstructions:RP.0/generalized-global-field`)
- `mathlib:Height.logHeight`

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, Remark 9.2, display (9.2), author copy p. 30. States [K':K]·h_{K,L} = h_{K',L_{K'}} on X(K̄) modulo bounded functions.

<a id="RP0-tuple-height-adapters"></a>
### Coordinate heights of algebraic tuples

*Lemma · node `HeightsRationalPointsAndObstructions:RP.0/tuple-height-adapters` · declaration `TauCeti.absLogHeight_tuple_le` · module `TauCeti/NumberTheory/Height/Machine`*

For algebraic numbers x₁, …, x_m ∈ ℚ̄ with absolute logarithmic heights h(x_i) = NumberField.absLogHeight₁ x_i: max_i h(x_i) ≤ h([1 : x₁ : … : x_m]) ≤ Σ_i h(x_i). For x ∈ ℚ̄ ⊂ ℂ the real and imaginary parts are algebraic, with h(Re x), h(Im x) ≤ 2·h(x) + 2·log 2 and degree over ℚ at most [ℚ(x):ℚ]². The counting height of a tuple is max_i h(x_i).

Hypotheses and conventions:

- Heights are absolute (normalised over ℚ); ℚ̄ is the algebraic closure inside ℂ.

Construction or proof:

1. The lower bound compares each place's maximum with |x_i|_w; the upper bound uses max(1, |x₁|, …) ≤ Π max(1, |x_i|) place by place.
2. Complex conjugation c restricts to an element of Gal(ℚ̄/ℚ), so h(c x) = h(x) by normalized-height Galois invariance.
3. Re x = (x + c x)/2 and Im x = (x − c x)/(2i): apply h(a + b) ≤ h(a) + h(b) + log 2 and h(ab) ≤ h(a) + h(b) (Mathlib Height.logHeight₁_add_le and Height.logHeight₁_mul_le over a common number field), with h(1/2) = log 2 and h(i) = 0.
4. For a nonreal algebraic x of degree d, consider the Galois-stable set of (α_i−α_j)/(2i), where the α_i are its d conjugates and i²=−1. Galois acts on i by a sign and exchanges ordered differences, so the orbit has at most d(d−1) values; Im x has degree at most d². For real x its imaginary part is zero. The real-part orbit uses (α_i+α_j)/2. Im x need not belong to ℚ(x,cx): x=√−2 gives Im x=√2.
5. Apply the native relative addition bound with log 2·totalWeight and divide by the total weight to obtain the absolute bound. The extra division by 2 contributes another log 2; multiplying by i has height zero.

Checks:

- x = 1 + i: Re x = Im x = 1 has height 0, while h(x) = (1/2)·log 2.

Direct prerequisites:

- [The normalised projective height](#RP0-normalized-height) (`HeightsRationalPointsAndObstructions:RP.0/normalized-height`)
- `mathlib:Height.logHeight₁_add_le`
- `mathlib:Height.logHeight₁_mul_le`
- `mathlib:NumberField.absLogHeight₁`

Sources:

- [J. Tsimerman, *The André–Oort conjecture for A_g*](https://annals.math.princeton.edu/2018/187-2/p02), §6.2, p. 387. Uses the maximum of the coordinate heights of an algebraic tuple and bounds on the real and imaginary parts of algebraic coordinates; the bounds stated here are proved directly.

<a id="RP0-northcott-projective"></a>
### Northcott's theorem on projective space

*Theorem · node `HeightsRationalPointsAndObstructions:RP.0/northcott-projective` · declaration `TauCeti.northcott_projectivization` · module `TauCeti/NumberTheory/Height/Machine`*

Let K be a number field and n ≥ 0, D ≥ 1, B ∈ ℝ. (a) {x ∈ ℙⁿ(K) : Projectivization.logHeight x ≤ B} is finite. (b) {x ∈ ℙⁿ(ℚ̄) : [ℚ(x):ℚ] ≤ D and h(x) ≤ B} is finite, where ℚ(x) is the field generated by the ratios of the coordinates. In Mathlib's vocabulary (a) is an instance Northcott (Projectivization.logHeight) for ℙⁿ(K).

Hypotheses and conventions:

- K a number field; h the normalised height of normalized-height; degrees over ℚ.

Construction or proof:

1. (a) Normalise a coordinate to 1; each affine coordinate x_i has absLogHeight₁ ≤ [K:ℚ]^{-1}·B + bounded, and Mathlib's finite_setOfPred_logHeight₁_le gives finitely many values per coordinate.
2. (b) Each ratio x_i/x_j has degree ≤ D and height ≤ B (tuple-height-adapters). Its minimal polynomial over ℤ has degree ≤ D and Mahler measure ≤ exp(D·B), hence coefficients bounded by binomial coefficients times exp(D·B): finitely many polynomials, finitely many roots.
3. (a) also follows from (b) with D = [K:ℚ] and extension-invariance.

Checks:

- For K = ℚ, n = 1, B = log 2: the points [a:b] with coprime a, b and max(|a|,|b|) ≤ 2 are [0:1], [1:0], [±1:1], [±2:1], [±1:2]: eight points.

Direct prerequisites:

- [The normalised projective height](#RP0-normalized-height) (`HeightsRationalPointsAndObstructions:RP.0/normalized-height`)
- [Coordinate heights of algebraic tuples](#RP0-tuple-height-adapters) (`HeightsRationalPointsAndObstructions:RP.0/tuple-height-adapters`)
- [Heights under finite extension of the base field](#RP0-extension-invariance) (`HeightsRationalPointsAndObstructions:RP.0/extension-invariance`)
- `mathlib:NumberField.finite_setOfPred_logHeight₁_le`
- `mathlib:Northcott`
- `mathlib:Polynomial.mahlerMeasure`

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, height properties list (Northcott is used in §10 and in the arithmetic case of Theorem 9.15's discussion), author copy pp. 30–35. Heights over number fields have finite sets of bounded height and degree (cited from Hindry–Silverman Part B).
- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Remark on heights in §2.6.4 and §9.5.1 (orientation only). Finiteness of points of bounded height underlies the finiteness theorems quoted there.

<a id="RP0-linear-change-bounded"></a>
### Linear changes of coordinates change heights boundedly

*Lemma · node `HeightsRationalPointsAndObstructions:RP.0/linear-change-bounded` · declaration `TauCeti.normalizedHeight_linearChange_bounded` · module `TauCeti/NumberTheory/Height/Machine`*

For a generalized global field K and T ∈ GL_{n+1}(K), the function h_{K,n}∘T − h_{K,n} is bounded on ℙⁿ(K̄). More generally, for a linear map A : K^{n+1} → K^{m+1} with trivial kernel, h_{K,m}(Ax) ≤ h_{K,n}(x) + C_A on ℙⁿ(K̄).

Hypotheses and conventions:

- T invertible; A injective (so Ax ≠ 0 for x ≠ 0).

Construction or proof:

1. Upper bound: Mathlib Height.logHeight_linearMap_apply_le applied over each finite subextension K' ⊇ K, then divided by [K':K] (constants scale exactly by extension-invariance).
2. Lower bound for T: apply the upper bound to T^{-1}.

Checks:

- For T(x₀, x₁) = (x₀, x₀ + x₁) on ℙ¹ the difference is at most log 2 in absolute value.

Direct prerequisites:

- [The normalised projective height](#RP0-normalized-height) (`HeightsRationalPointsAndObstructions:RP.0/normalized-height`)
- [Heights under finite extension of the base field](#RP0-extension-invariance) (`HeightsRationalPointsAndObstructions:RP.0/extension-invariance`)
- `mathlib:Height.logHeight_linearMap_apply_le`

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, statement that h_{K,n} − h_{K,n}∘T is bounded for T ∈ Aut(ℙⁿ_K), author copy p. 30. Records the boundedness of linear changes of coordinates, with proofs referred to Hindry–Silverman §B and Mumford's Abelian Varieties §4 App. II.

<a id="RP0-morphism-height-comparison"></a>
### Heights along morphisms to projective space

*Theorem · node `HeightsRationalPointsAndObstructions:RP.0/morphism-height-comparison` · declaration `TauCeti.normalizedHeight_comp_forms` · module `TauCeti/NumberTheory/Height/Machine`*

Let K be a generalized global field, X a projective K-variety and φ : X → ℙⁿ, ψ : X → ℙᵐ morphisms with φ*O(1) ≅ ψ*O(1). Then h_{K,n}∘φ − h_{K,m}∘ψ is bounded on X(K̄). If f : ℙⁿ → ℙᵐ is a morphism given by forms of degree d without common zero, h_{K,m}∘f = d·h_{K,n} + O(1).

Hypotheses and conventions:

- X projective over K; φ and ψ morphisms over K; the isomorphism of line bundles is over K.

Construction or proof:

1. Both maps are given by bases of subspaces of H⁰(X, L) for L = φ*O(1) generating L; by linear-change-bounded reduce to φ and ψ given by two generating families of sections of the same L.
2. Upper bounds: each section of one family is a linear combination of products with the other on an affine cover; Mathlib's Height.logHeight_eval_le gives h∘φ ≤ h∘ψ + C.
3. Lower bounds: the Nullstellensatz on X writes powers of the sections of one family as combinations of the other (Mathlib Height.logHeight_eval_ge in the case of ℙⁿ), giving the reverse inequality.

Checks:

- The Veronese map ℙ¹ → ℙ², [x:y] ↦ [x²:xy:y²], has h∘v = 2h exactly.

Direct prerequisites:

- [The normalised projective height](#RP0-normalized-height) (`HeightsRationalPointsAndObstructions:RP.0/normalized-height`)
- [Linear changes of coordinates change heights boundedly](#RP0-linear-change-bounded) (`HeightsRationalPointsAndObstructions:RP.0/linear-change-bounded`)
- `mathlib:Height.logHeight_eval_le`
- `mathlib:Height.logHeight_eval_ge`
- `SchemeAndStackFoundations:SF.5`

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, functoriality bullet (proved by the Nullstellensatz over K̄), author copy p. 31. Functoriality of K-heights for morphisms of projective K-varieties, by the Nullstellensatz.
- [Aise Johan de Jong, *Notes on Heights*](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14, Steps 1–7, pp. 7–9. Comparison of very ample presentations of the same line bundle.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP0-weil-height-machine"></a>
### Weil's height machine

*Construction · node `HeightsRationalPointsAndObstructions:RP.0/weil-height-machine` · module `TauCeti/NumberTheory/Height/Machine`*

Let K be a generalized global field and X a projective K-variety. There is a unique group homomorphism h_{K,•} : Pic(X) → HeightClass(X(K̄)), L ↦ h_{K,L}, such that for every very ample L with complete linear system embedding ι_L : X → ℙ(H⁰(X, L)), h_{K,L} is the class of h_{K,n}∘ι_L. It satisfies: (a) functoriality h_{K,f*M} = f*h_{K,M} for every K-morphism f : X → Y of projective varieties (pullback of classes, height-pullback); (b) extension [K':K]·h_{K,L} = h_{K',L_{K'}}; (c) positivity off the base locus (height-positivity-base-locus); (d) for L ample and M arbitrary there is c > 0 with |h_{K,M}| ≤ c·h_{K,L} + O(1); (e) for K a number field and L ample, Northcott (northcott-ample).

Hypotheses and conventions:

- X projective over K (any closed subscheme of some ℙⁿ_K); Pic(X) is the group of isomorphism classes of line bundles.

Construction or proof:

1. Very ample case: define h_{K,L} by ι_L; it is well defined by morphism-height-comparison, and additive since the Segre embedding is exact for heights (Mathlib Height.logHeight_fun_mul_eq).
2. General L: write L ≅ L₁ ⊗ L₂^{-1} with L₁, L₂ very ample; the class h_{K,L₁} − h_{K,L₂} is independent of the presentation by additivity on very ample bundles (Conrad §9 after (9.1)).
3. Functoriality: for very ample M on Y, f*M is globally generated, and ι_M∘f is a morphism with (ι_M∘f)*O(1) = f*M; compare with an embedding of f*M ⊗ (very ample) via morphism-height-comparison.
4. (d): L^{⊗N} ⊗ M^{±1} is very ample for N large, and very ample heights are bounded below.

Planning API:

- `TauCeti.weilHeight` (constructor): The homomorphism Pic(X) →+ HeightClass(X(K̄)), written h_{K,L}.
- `TauCeti.weilHeight_veryAmple` (characterisation): For very ample L, h_{K,L} is the class of h_{K,n}∘ι_L.
- `TauCeti.weilHeight_tensor` (simp): h_{K,L⊗M} = h_{K,L} + h_{K,M}.
- `TauCeti.weilHeight_pullback` (functoriality): h_{K,f*M} = (pullback along f) h_{K,M} for every morphism f : X → Y.
- `TauCeti.weilHeight_projectiveSpace` (example): On ℙⁿ, h_{K,O(d)} = d·[h_{K,n}].
- `TauCeti.weilHeight_baseChange` (compatibility): [K':K]·h_{K,L} = h_{K',L_{K'}}.
- `TauCeti.weilHeight_le_of_ample` (other): For L ample there is c > 0 with |h_{K,M}| ≤ c·h_{K,L} + O(1).
- `TauCeti.weilHeight_unique` (universal-property): Any homomorphism Pic(X) → HeightClass(X(K̄)) agreeing with h_{K,n}∘ι_L on very ample L is h_{K,•}.
- `TauCeti.weilHeight_baseChange` (functoriality): For finite K'/K with extended places and a projective K-variety X, h_{K',L_{K'}} = [K':K]·h_{K,L} as height classes. Absolute normalization makes these classes equal. Prove after the height machine using projective extension invariance.

Unit tests:

- **weilHeight.test_projectiveSpace** (computation): On ℙ¹_ℚ, h_{ℚ,O(2)}([1:2]) has representative 2·log 2.
- **weilHeight.test_trivial** (degenerate): h_{K,O_X} = 0 in HeightClass.
- **weilHeight.test_point** (degenerate): For X = Spec K (a point), every h_{K,L} is 0.
- **weilHeight.test_mathlib_relative** (compatibility): For X = ℙⁿ_K and x ∈ ℙⁿ(K), the representative h_{K,n}(x) equals Mathlib's Projectivization.logHeight x.
- **weilHeight.test_not_pointwise** (non-example): h_{K,O(1)} on ℙ¹ has representatives h and h + 1; no canonical function is chosen at this level.

Checks:

- On X = ℙⁿ, h_{K,O(d)} = d·h_{K,n}.
- Over K = ℚ and X a conic embedded in ℙ², the restriction of h to X(ℚ̄) represents h_{O(1)|X} and twice h_{O_X(P)} for any point P (O(1)|X ≅ O_X(2P) on X ≅ ℙ¹ over ℚ̄).

Consumers:

- Gao–Habegger 2019, Dimitrov–Gao–Habegger 2021 (Appendix A): the Height Machine is used for every comparison of heights on families and on resolutions
- Conrad §9–§10: positivity and Northcott of ample heights feed the canonical heights and Theorem 9.15
- GrossZagierAndArithmeticHeights:GZ.1: imports the line-bundle height machine (RT-AREA-iwasawa-1/3)
- ArithmeticDynamics:DY.1: canonical heights of polarised endomorphisms start from h_{K,L}

Direct prerequisites:

- [The normalised projective height](#RP0-normalized-height) (`HeightsRationalPointsAndObstructions:RP.0/normalized-height`)
- [Heights along morphisms to projective space](#RP0-morphism-height-comparison) (`HeightsRationalPointsAndObstructions:RP.0/morphism-height-comparison`)
- [Heights under finite extension of the base field](#RP0-extension-invariance) (`HeightsRationalPointsAndObstructions:RP.0/extension-invariance`)
- [Heights modulo bounded functions](#RP0-height-class) (`HeightsRationalPointsAndObstructions:RP.0/height-class`)
- [Pullback of height classes](#RP0-height-pullback) (`HeightsRationalPointsAndObstructions:RP.0/height-pullback`)
- `mathlib:Height.logHeight_fun_mul_eq`
- `SchemeAndStackFoundations:SF.5`
- `SchemeAndStackFoundations:SF.3`

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, (9.1) and the paragraph defining h_{K,L} for arbitrary L, the list of basic properties, author copy pp. 30–31. Very ample heights via complete linear systems; extension to Pic(X) by differences; a homomorphism Pic(X) → functions modulo O(1); functoriality, positivity of ample heights, quasi-equivalence and positivity off the base locus.
- [Aise Johan de Jong, *Notes on Heights*](https://www.math.columbia.edu/~dejong/courses/heights.pdf), §14, Steps 1–7, pp. 7–9. The construction of the line-bundle height class from very ample differences.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP0-height-positivity-base-locus"></a>
### Heights are bounded below off the base locus

*Theorem · node `HeightsRationalPointsAndObstructions:RP.0/height-positivity-base-locus` · declaration `TauCeti.weilHeight_bddBelow_off_baseLocus` · module `TauCeti/NumberTheory/Height/Machine`*

For a projective variety X over a generalized global field K and a line bundle L with base locus B = Supp coker(H⁰(X, L) ⊗ O_X → L), every representative of h_{K,L} is bounded below on X(K̄) ∖ B(K̄). In particular for L ample (some power globally generated) h_{K,L} is bounded below on X(K̄).

Hypotheses and conventions:

- X projective; L a line bundle with H⁰(X, L) ≠ 0 for a nonempty complement.

Construction or proof:

1. Choose a very ample M with L ⊗ M very ample, a basis (s_i) of H⁰(X, L) and a basis (t_j) of H⁰(X, M). At x ∉ B some s_i(x) ≠ 0, so the products s_i·t_j, part of a generating family of L ⊗ M, do not all vanish at x; comparing the heights of [s_i t_j(x)] and [t_j(x)] place by place gives h_{L⊗M}(x) ≥ h_M(x) − C, that is h_L(x) ≥ −C on X ∖ B (Conrad §9, base-locus property; morphism-height-comparison).

Checks:

- On ℙ¹ with L = O(1) the base locus is empty and h ≥ 0.

Direct prerequisites:

- [Weil's height machine](#RP0-weil-height-machine) (`HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`)

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, positivity away from the base locus (last bullet of the list of properties), author copy p. 31. States that h_{K,L} is bounded below on (X − B)(K̄) for the base locus B of L.

<a id="RP0-northcott-ample"></a>
### Northcott for ample line bundles

*Theorem · node `HeightsRationalPointsAndObstructions:RP.0/northcott-ample` · declaration `TauCeti.weilHeight_northcott_of_ample` · module `TauCeti/NumberTheory/Height/Machine`*

Let K be a number field, X a projective K-variety and L an ample line bundle on X. For every representative h of h_{K,L} and all D ≥ 1, B ∈ ℝ, the set {x ∈ X(ℚ̄) : [K(x):K] ≤ D and h(x) ≤ B} is finite. With Mathlib's class: for each D the restriction of h to points of degree ≤ D is Northcott.

Hypotheses and conventions:

- K a number field (Northcott fails for function fields with infinite constant field, where constant points have height 0).

Construction or proof:

1. Replace L by a very ample power L^{⊗m}: h_{K,L^m} = m·h_{K,L} and the property is insensitive to positive scaling and bounded error (northcott-invariance).
2. For very ample L the height is h_{K,n}∘ι_L with ι_L a closed embedding, so the set embeds into {y ∈ ℙⁿ(ℚ̄) : degree ≤ D[K:ℚ], h(y) ≤ B'}: finite by northcott-projective.

Checks:

- For X = ℙ¹_ℚ and L = O(1) at height ≤ log 2 and degree 1: the eight points of northcott-projective's example.

Direct prerequisites:

- [Weil's height machine](#RP0-weil-height-machine) (`HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`)
- [Northcott's theorem on projective space](#RP0-northcott-projective) (`HeightsRationalPointsAndObstructions:RP.0/northcott-projective`)
- [Northcott invariance under bounded error](#RP0-northcott-invariance) (`HeightsRationalPointsAndObstructions:RP.0/northcott-invariance`)
- `mathlib:Northcott`

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, positivity of ample K-heights, and §10 use of Northcott in the arithmetic case, author copy pp. 31–37. Ample heights dominate all heights and points of bounded height and degree are finite over number fields.

<a id="RP0-tate-limit"></a>
### Tate's limit

*Construction · node `HeightsRationalPointsAndObstructions:RP.0/tate-limit` · module `TauCeti/NumberTheory/Height/TateLimit`*

Let S be a set, φ : S → S a map, d > 1 a real number and f : S → ℝ with |f∘φ − d·f| ≤ C on S. Then f̂(s) = lim_{m→∞} d^{−m} f(φ^m(s)) exists for every s, |f̂ − f| ≤ C/(d − 1), and f̂∘φ = d·f̂. It is the unique function g with g∘φ = d·g and g − f bounded. If f' − f is bounded then f̂' = f̂, so the construction descends to height classes.

Hypotheses and conventions:

- Only the bound |f∘φ − d f| ≤ C is assumed; no topology on S.

Construction or proof:

1. The telescoping series f + Σ_{m≥0} d^{−(m+1)}(f∘φ^{m+1} − d·f∘φ^m) converges uniformly, with tail bounded by C·d^{−m}/(d−1).
2. f̂∘φ = d·f̂ by shifting the index; uniqueness: if g, g' both satisfy the functional equation with bounded difference D, then |g − g'| = d^{−m}|g∘φ^m − g'∘φ^m| ≤ d^{−m}D → 0.

Planning API:

- `TauCeti.tateLimit` (constructor): tateLimit φ d f : S → ℝ, defined as the telescoping series (a real body, no limUnder).
- `TauCeti.tendsto_tateLimit` (characterisation): d^{−m} f(φ^m s) → tateLimit φ d f s.
- `TauCeti.abs_tateLimit_sub_le` (other): |tateLimit φ d f − f| ≤ C/(d−1).
- `TauCeti.tateLimit_comp` (relation): tateLimit φ d f ∘ φ = d · tateLimit φ d f.
- `TauCeti.tateLimit_unique` (universal-property): A function g with g∘φ = d·g and g − f bounded equals tateLimit φ d f.
- `TauCeti.tateLimit_congr_bounded` (extensionality): If f' − f is bounded, tateLimit φ d f' = tateLimit φ d f.

Unit tests:

- **tateLimit.test_constant** (degenerate): For f constant and φ = id, tateLimit = 0.
- **tateLimit.test_exact** (computation): If f∘φ = d·f exactly then tateLimit φ d f = f.
- **tateLimit.test_elliptic** (compatibility): For W elliptic over a field with admissible absolute values, φ = doubling, d = 4 and f = naiveHeight/2, tateLimit φ 4 f = WeierstrassCurve.Affine.Point.canonicalHeight.
- **tateLimit.test_d_one** (non-example): For d = 1 the series need not converge: S = ℕ, φ(n) = n + 1, f(n) = n gives d^{−m}f(φ^m 0) = m.

Checks:

- S = ℕ, φ = id, d = 2, f = 1: f̂ = 0 and the bound C/(d−1) = 1 is attained.

Consumers:

- Conrad (9.3)–(9.4): symmetric and antisymmetric canonical heights
- ArithmeticDynamics:DY.1: canonical heights of polarised endomorphisms φ with φ*L ≅ L^{⊗d} are Tate limits; DY.1 imports this lemma
- Xie–Yuan 2022 (1.2): canonical heights of subvarieties are limits n^{−2}h([n]X)

Direct prerequisites:

- [Heights modulo bounded functions](#RP0-height-class) (`HeightsRationalPointsAndObstructions:RP.0/height-class`)

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, displays (9.3)–(9.4), author copy p. 32. Canonical heights are limits h(na)/n² and h(na)/n, independent of the representative chosen for h_{K,L}.
- [Tau Ceti roadmap authors, *EllipticCurves roadmap, Layer 6: the Mordell–Weil theorem*](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves), TauCetiRoadmap EllipticCurves, Layer 6 (canonical height milestone). Tate's limit for elliptic curves, ĥ = lim h(2ⁿP)/(2·4ⁿ), with convergence proved rather than assumed.

<a id="RP0-neron-tate-height"></a>
### The Néron–Tate canonical height

*Construction · node `HeightsRationalPointsAndObstructions:RP.0/neron-tate-height` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Height`*

Let A be an abelian variety over a generalized global field K and L a line bundle on A. For symmetric L ([−1]*L ≅ L) put ĥ⁺_{K,L} = Tate limit of h_{K,L} along [2] with d = 4; for antisymmetric L ([−1]*L ≅ L^{−1}) put ĥ⁻_{K,L} = Tate limit along [2] with d = 2; in general ĥ_{K,L} = (ĥ⁺_{K,L⁺} + ĥ⁻_{K,L⁻})/2 with L^± = L ⊗ [−1]*L^{±1}. Then ĥ_{K,L} : A(K̄) → ℝ represents h_{K,L}, depends only on the isomorphism class of L, is additive in L, vanishes at 0, is a quadratic form for symmetric L and additive for antisymmetric L, satisfies ĥ_{K,f*M} = ĥ_{K,M}∘f − ĥ_{K,M}(f(0)) for every morphism f : A → B of K-varieties and ĥ_{K,t_a*L} = ĥ_{K,L}∘t_a − ĥ_{K,L}(a), scales by [K':K] under finite extension, and for symmetric L depends only on the algebraic equivalence class of L. For K a number field the absolute Néron–Tate height is [K:ℚ]^{-1}·ĥ_{K,L}.

Hypotheses and conventions:

- A an abelian variety over K (Tau Ceti TauCeti.AlgebraicGeometry.AbelianVariety); L any line bundle.
- Symmetric: [2]*L ≅ L^{⊗4}; antisymmetric: [2]*L ≅ L^{⊗2} (theorem of the cube).

Construction or proof:

1. Theorem of the cube (AbelianSchemesAndArithmeticModuli A1.5) gives [2]*L ≅ L⁴ (symmetric) or L² (antisymmetric); with the height machine, h_{K,L}∘[2] − d·h_{K,L} is bounded, so tate-limit applies.
2. Quadraticity: the parallelogram law holds up to O(1) by the cube theorem on A × A; Tate limits turn it into an identity.
3. Functoriality and translation: both sides are functions of degree ≤ 2 in the same class modulo O(1), hence differ by a constant, fixed at 0 (Conrad (9.5)–(9.7)).
4. Algebraic equivalence: for symmetric L, L' with L' ⊗ L^{-1} ∈ Pic⁰(A), M = L' ⊗ L^{-1} is symmetric and antisymmetric, so M² is trivial and ĥ_M is additive with 2ĥ_M = 0 (alternative to Conrad Theorem 9.8's quasi-equivalence argument; Gao–Ge–Kühne Lemma 2.3).

Planning API:

- `TauCeti.neronTateHeight` (constructor): ĥ_{K,L} : A(K̄) → ℝ for any line bundle L on A.
- `TauCeti.neronTateHeight_mem_weilHeight` (characterisation): The class of ĥ_{K,L} in HeightClass is h_{K,L}.
- `TauCeti.neronTateHeight_zero` (simp): ĥ_{K,L}(0) = 0.
- `TauCeti.neronTateHeight_tensor` (simp): ĥ_{K,L⊗M} = ĥ_{K,L} + ĥ_{K,M}.
- `TauCeti.neronTateHeight_nsmul` (relation): For symmetric L, ĥ_{K,L}(n•a) = n²·ĥ_{K,L}(a).
- `TauCeti.neronTateHeight_parallelogram` (relation): For symmetric L, ĥ(a+b) + ĥ(a−b) = 2ĥ(a) + 2ĥ(b).
- `TauCeti.neronTateHeight_add_of_antisymm` (relation): For antisymmetric L, ĥ_{K,L} is additive.
- `TauCeti.neronTateHeight_pullback` (functoriality): ĥ_{K,f*M} = ĥ_{K,M}∘f − ĥ_{K,M}(f 0) for a morphism of varieties f : A → B.
- `TauCeti.neronTateHeight_translate` (functoriality): ĥ_{K,t_a*L} = ĥ_{K,L}∘t_a − ĥ_{K,L}(a).
- `TauCeti.neronTateHeight_baseChange` (compatibility): ĥ_{K',L_{K'}} = [K':K]·ĥ_{K,L}.
- `TauCeti.neronTateHeight_eq_of_algEquiv` (extensionality): Symmetric L, L' algebraically equivalent ⇒ ĥ_{K,L} = ĥ_{K,L'}.
- `TauCeti.neronTateHeight_quadraticMap` (structure): For symmetric L, ĥ_{K,L} is a QuadraticMap ℤ A(K̄) ℝ.

Unit tests:

- **neronTateHeight.test_trivial** (degenerate): ĥ_{K,O_A} = 0.
- **neronTateHeight.test_elliptic** (compatibility): For E given by a Weierstrass curve W over a number field K, ĥ_{K,O_E(O)}(P) = W.Point.canonicalHeight P; the absolute height is [K:ℚ]^{-1} times it.
- **neronTateHeight.test_product** (computation): On A = E₁ × E₂ with L = p₁*O(O) ⊗ p₂*O(O), ĥ(P, Q) = ĥ₁(P) + ĥ₂(Q).
- **neronTateHeight.test_torsion_translate** (characterisation): For symmetric L and torsion t, ĥ_{K,L}(a + t) = ĥ_{K,L}(a).
- **neronTateHeight.test_naive_not_quadratic** (non-example): For y² = x³ − 2 over ℚ and P = (3, 5), the naive x-height satisfies h(2P) ≠ 4h(P): h(x(2P)) = log 129 (x(2P) = 129/100), not 4·log 3 = log 81.

Checks:

- ĥ_{K,L}(n a) = n²·ĥ_{K,L}(a) for symmetric L and every integer n.
- For an elliptic curve E/K, ĥ_{K,O_E(O)} equals Tau Ceti's WeierstrassCurve.Affine.Point.canonicalHeight (which already halves the x-height).

Consumers:

- RP.1/mordell-weil: ĥ satisfies the hypotheses of the descent theorem CommGroup.fg_of_descent' (additive form)
- RP.5/bogomolov: small points are measured by ĥ_L for symmetric ample L
- Gao–Ge–Kühne 2026 Lemma 2.3; Xie–Yuan 2022 (1.2): canonical heights of points and the c₁-invariance
- GrossZagierAndArithmeticHeights:GZ.1: imports ĥ_L and keeps the Gross–Zagier normalisations

Direct prerequisites:

- [Tate's limit](#RP0-tate-limit) (`HeightsRationalPointsAndObstructions:RP.0/tate-limit`)
- [Weil's height machine](#RP0-weil-height-machine) (`HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`)
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`
- `AbelianSchemesAndArithmeticModuli:A1/relative-cube-and-power`
- `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, from 'In the special case of abelian varieties' through Theorem 9.8, displays (9.3)–(9.7), author copy pp. 31–33. Defines ĥ_{K,L} through symmetric and antisymmetric parts, proves functoriality, the translation formula (Lemma 9.7), the extension formula (Remark 9.6), non-negativity for symmetric ample L and dependence only on algebraic equivalence (Theorem 9.8).
- [Z. Gao, T. Ge, L. Kühne, *The Uniform Mordell–Lang Conjecture*](https://arxiv.org/abs/2105.15085v4), §2.1, Lemma 2.3, arXiv:2105.15085v4 pp.8–9. Néron–Tate heights of symmetric ample bundles with the same first Chern class agree.
- [V. Dimitrov, Z. Gao, P. Habegger, *Uniformity in Mordell–Lang for curves*](https://arxiv.org/abs/2001.10276v3), Remark 3.2, p. 14. The fibrewise Néron–Tate height depends only on the generic-fibre bundle.

<a id="RP0-neron-tate-kernel-number-field"></a>
### Positivity and kernel of the Néron–Tate height

*Theorem · node `HeightsRationalPointsAndObstructions:RP.0/neron-tate-kernel-number-field` · declaration `TauCeti.neronTateHeight_eq_zero_iff_isTorsion` · module `TauCeti/NumberTheory/Height/Machine`*

Let A be an abelian variety over a number field K and L a symmetric ample line bundle. Then ĥ_{K,L} ≥ 0 on A(ℚ̄); ĥ_{K,L}(a) = 0 if and only if a is a torsion point; and for every D the set of torsion points of degree ≤ D over K is finite. The proof uses Northcott only, not the finite generation of A(K).

Hypotheses and conventions:

- K a number field; L symmetric and ample.

Construction or proof:

1. Non-negativity: h_{K,L} is bounded below (height-positivity-base-locus), so the quadratic form ĥ_{K,L} is bounded below, hence ≥ 0 (Conrad §9 after Lemma 9.7).
2. If ĥ(a) = 0, all multiples n•a lie in A(K(a)) and have ĥ = 0, hence bounded h_{K,L}: finitely many by northcott-ample, so a is torsion. Conversely ĥ(a) = m^{−2}ĥ(m•a) = 0 for m the order.
3. All torsion points have canonical height zero, so the bounded difference with an ample height puts every point of degree ≤D in one bounded-degree Northcott set. That single set is finite; no union over fields or finite-generation theorem is used.

Checks:

- For an elliptic curve this specialises to Tau Ceti's WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder.

Direct prerequisites:

- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)
- [Northcott for ample line bundles](#RP0-northcott-ample) (`HeightsRationalPointsAndObstructions:RP.0/northcott-ample`)
- [Heights are bounded below off the base locus](#RP0-height-positivity-base-locus) (`HeightsRationalPointsAndObstructions:RP.0/height-positivity-base-locus`)
- `mathlib:Monoid.finite_set_isOfFiniteOrder_of_descent`
- `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder`

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, sentence after Lemma 9.7 (ĥ ≥ 0 for symmetric ample L) and the arithmetic case before Theorem 9.15, author copy pp. 33–35. Non-negativity of ĥ_{K,L} for symmetric ample L and positive definiteness over classical global fields.

<a id="RP0-neron-tate-bilinear-form"></a>
### The Néron–Tate bilinear form of a symmetric bundle

*Construction · node `HeightsRationalPointsAndObstructions:RP.0/neron-tate-bilinear-form` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Height`*

For an abelian variety A over a generalized global field K and a symmetric line bundle L, ⟨a, b⟩_L = ĥ_{K,L}(a + b) − ĥ_{K,L}(a) − ĥ_{K,L}(b) is a symmetric ℤ-bilinear form on A(K̄) with ⟨a, a⟩_L = 2ĥ_{K,L}(a); it equals Conrad's ⟨a, φ_L(b)⟩_{A,K} with φ_L(x) = t_x*L ⊗ L^{-1}. Its real extension is positive semidefinite on A(K')_ℝ for L ample.

Hypotheses and conventions:

- L symmetric; K generalized global field.

Construction or proof:

1. Bilinearity from the parallelogram law of a quadratic form (Mathlib QuadraticMap.polarBilin).
2. Comparison with φ_L: Conrad Theorem 9.10 via the Poincaré bundle and functoriality.
3. Semidefiniteness from ĥ ≥ 0 (Conrad Corollary 9.12).
4. Use the normalized Poincaré bundle from AbelianSchemesAndArithmeticModuli A2. In the elliptic specialization this unhalved polarization equals twice Tau Ceti’s native pairing.

Planning API:

- `TauCeti.neronTateForm` (constructor): ⟨,⟩_L : LinearMap.BilinMap ℤ A(K̄) ℝ.
- `TauCeti.neronTateForm_self` (simp): ⟨a, a⟩_L = 2ĥ_{K,L}(a).
- `TauCeti.neronTateForm_comm` (relation): ⟨a, b⟩_L = ⟨b, a⟩_L.
- `TauCeti.neronTateForm_torsion` (relation): ⟨a, t⟩_L = 0 for torsion t.
- `TauCeti.neronTateHeight_sum_le` (other): For L symmetric ample, ĥ(x₁ + ⋯ + x_m) ≤ m·Σ ĥ(x_i) (Xie–Yuan, proof of Lemma 5.3).

Unit tests:

- **neronTateForm.test_elliptic** (compatibility): For E from W over a number field, ⟨P, Q⟩_{O(O)} = 2·W.neronTatePairing P Q (Tau Ceti halves the polar form; neronTatePairing_self gives ⟨P,P⟩ = 2ĥ(P)).
- **neronTateForm.test_zero** (degenerate): ⟨0, b⟩_L = 0.
- **neronTateForm.test_sum_two** (computation): For L symmetric ample, ĥ(x+y)≤2ĥ(x)+2ĥ(y); dropping ampleness/semidefiniteness makes this inequality false for a negative polarization.
- **neronTateForm.test_not_definite_on_torsion** (non-example): On a torsion point t ≠ 0, ⟨t, t⟩_L = 0, so the form is not definite on A(K) itself, only on A(K)/A(K)_tors ⊗ ℝ.

Checks:

- For E elliptic and L = O(O): ⟨P, P⟩_L = 2ĥ(P), compared with Tau Ceti's neronTatePairing.

Consumers:

- RP.1/neron-tate-positive-definite: the regulator-type Gram matrices on A(K) are formed with ⟨,⟩_L
- Xie–Yuan 2022, proof of Lemma 5.3: ĥ(x₁ + ⋯ + x_m) ≤ m Σ ĥ(x_i) from Cauchy–Schwarz for this form

Direct prerequisites:

- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)
- `mathlib:QuadraticMap.polarBilin`
- `tauceti:WeierstrassCurve.Affine.neronTatePairing`
- `AbelianSchemesAndArithmeticModuli:A2/normalized-poincare-comparison`

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, Theorem 9.10 and Corollary 9.12, author copy pp. 34. The polarisation identity ⟨a₁, φ_L(a₂)⟩ = ĥ_L(a₁+a₂) − ĥ_L(a₁) − ĥ_L(a₂) and positive semidefiniteness for symmetric ample polarisations.

<a id="RP0-bounded-point-metrics"></a>
### Bounded metric families for point heights

*Definition · node `HeightsRationalPointsAndObstructions:RP.0/bounded-point-metrics` · module `TauCeti/NumberTheory/Height/Local`*

Let X be a projective variety over a generalized global field K and L a line bundle. Choose a presentation L=M⊗N⁻¹ with M,N generated by finitely many K-sections. Give each generated bundle the pullback sup metric from O(1), so in a local frame e its norm is 1/max_i|s_i/e|_v; tensor and dual give a reference metric m⁰_v on L. A bounded point-metric family consists of continuous fibre norms m_v with m_v(aℓ)=|a|_v m_v(ℓ), m_v(ℓ)>0 for ℓ≠0, and bounds c_v≥0 for d_v(m_v,m⁰_v)=sup_x|log(m_v/m⁰_v)(x)|≤c_v, where Σ_v n_v c_v<∞. The ratio is independent of a nonzero local frame. Bounds range over geometric local points, hence are uniform under finite extensions, with the extension weights of normalized-height. Changing the finite generating presentation gives an equivalent class of families. Tensor product, dual and pullback preserve this class. Each single-place space is complete for d_v. This is a point-height metric interface; it does not define arithmetic intersections or semipositivity of higher-dimensional cycles.

Hypotheses and conventions:

- Use nontrivial genuine absolute values and the product-formula weights of generalized-global-field; at a complex place take the usual complex norm with its weight, rather than treating its square as a norm satisfying the usual triangle inequality.
- Continuity is in local trivializations. A metric extending continuously to the proper analytification may be used with its bounded-ratio certificate; bare continuity on X(K̄_v) is not a substitute for that certificate. For the nonarchimedean case all norms are interpreted over the completed algebraic closure.
- X is projective and nonempty; the empty-space case is the unique metric datum with distance zero. Algebraic point-height sums are evaluated over a finite field of definition, not as an unweighted sum over all extensions of a place.
- Metrics on geometric local fibres are equivariant under continuous K_v-automorphisms of the completed algebraic closure (including complex conjugation over a real place). Finite-extension metrics are obtained by base change, with norms and log-ratio bounds raised or scaled when the chosen normalized absolute value is a power of the restricted one. Thus the value at an algebraic point is independent of local embeddings and the weighted sum is compatible with extension-invariance.

Construction or proof:

1. Use the globally generated difference presentation from the scheme line-bundle supplier. The quotient sup norm is independent of a local frame by homogeneity, since the generating sections have no common zero. The tensor quotient gives a reference metric for an arbitrary L.
2. On each patch where a generating section is largest, the remaining normalized coordinates have norm at most one. Comparing two generating presentations by polynomial identities and the no-common-zero relations gives local bounds in terms of finitely many K-coefficients. They vanish outside a finite set of nonarchimedean places; the archimedean constants have finite total weight. Thus the weighted bounds are summable and independent of the point or its finite field of definition. This is the point case of Gubler §5.2.17–18, made explicit rather than appealing to bare algebraic-point continuity.
3. For a fixed reference metric, another metric is exp(u) times it for a bounded continuous real function u. The sup distance is the norm of u−u′. A uniformly Cauchy sequence has a uniform limit since ℝ is complete; this limit is bounded and continuous and its exponential is a positive metric. This proves completeness without assuming the algebraic local point set compact. The subspace of equivariant functions is closed under uniform limits, so it is complete as well.
4. Tensor and dual add or negate log ratios, and pullback cannot increase their sup bound. Extend weights and norms to a finite field by extension-invariance; the total mass above each place recovers its original mass.

Planning API:

- `TauCeti.PointHeightMetricFamily` (structure): Galois-equivariant fibre norms, continuity, the generating reference, finite-extension compatibility and summable uniform log-ratio certificates.
- `TauCeti.PointHeightMetricFamily.dist` (data): d_v is the sup of the absolute log ratio and is finite; it is invariant under changing a frame.
- `TauCeti.PointHeightMetricFamily.complete` (instance): At one place the space of bounded continuous metrics is complete for d_v.
- `TauCeti.PointHeightMetricFamily.tensor` (constructor): Tensor adds logarithmic norms and d_v(m⊗n,m′⊗n′)≤d_v(m,m′)+d_v(n,n′).
- `TauCeti.PointHeightMetricFamily.dual` (constructor): Dual negates logarithmic norms and preserves d_v.
- `TauCeti.PointHeightMetricFamily.pullback` (functoriality): Pullback along a morphism of projective varieties is a metric family, with d_v(f*m,f*m′)≤d_v(m,m′).
- `TauCeti.PointHeightMetricFamily.height` (relation): The sum of −log norms at a rational point represents the Weil height; changing metrics changes it by at most Σ_v n_v d_v.

Unit tests:

- **PointHeightMetricFamily.test_sup** (computation): For O(1) on ℙⁿ the norm of x₀ at [x] is |x₀|_v/max_i|x_i|_v; multiplying all coordinates by a nonzero scalar leaves it unchanged.
- **PointHeightMetricFamily.test_trivial** (degenerate): On O_X the norm of 1 equal to 1 at every place gives height zero.
- **PointHeightMetricFamily.test_height** (compatibility): At [1:2] over ℚ, the reference O(1) metric gives height log 2, agreeing with normalized-height and the native absolute projective height.
- **PointHeightMetricFamily.test_constants** (non-example): Rescale the trivial norm at the real place of ℚ by exp(1) and leave the finite places fixed: the family is admissible but its point height is −1, not zero. Rescaling by exp(1) at every prime fails summability and is not admissible.

Checks:

- For a nonzero rational section s and P outside its divisor, Σ_v n_v(−log m_v(s(P))) converges absolutely and gives a representative of h_{K,L}. Compare first with the sup-metric reference and then with the summable bounds.

Consumers:

- RP.0/canonical-point-metrics: Complete local metric spaces and summable global defect bounds are the input to contraction.
- RP.0/local-weil-functions: The metric on O(D) defines the local function and its bounded ambiguity.

Direct prerequisites:

- [The normalised projective height](#RP0-normalized-height) (`HeightsRationalPointsAndObstructions:RP.0/normalized-height`)
- [Heights under finite extension of the base field](#RP0-extension-invariance) (`HeightsRationalPointsAndObstructions:RP.0/extension-invariance`)
- [Heights along morphisms to projective space](#RP0-morphism-height-comparison) (`HeightsRationalPointsAndObstructions:RP.0/morphism-height-comparison`)
- `SchemeAndStackFoundations:SF.5`

Sources:

- [W. Gubler, *Basic Properties of Heights of Subvarieties*](https://gubler.app.uni-regensburg.de/Publikationen/habi%2B.pdf), §5.1.2 and Theorem 5.1.13, pp.96,100–101; §5.2.15–18, pp.108–109; Example 5.3.20, p.117. Sup distance on bounded metrics, completeness, M-metric bounds and generated-bundle presentations; only the point-height specialization is used.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP0-canonical-point-metrics"></a>
### Canonical point metrics by contraction

*Construction · node `HeightsRationalPointsAndObstructions:RP.0/canonical-point-metrics` · module `TauCeti/NumberTheory/Height/Local`*

For a projective X/K, a morphism f:X→X and a K-isomorphism θ:f*L≃L^q with integer q>1, there is a unique bounded continuous metric m̂_v at each place making θ an isometry. These metrics form a bounded point-metric family. With Φ_v(m)=(θ_*f*m)^(1/q), d_v(Φ_v(m),Φ_v(m′))≤d_v(m,m′)/q. If c_v=d_v(m⁰_v,Φ_v(m⁰_v)), then d_v(Φ_v^j(m⁰_v),m̂_v)≤q^(−j)c_v/(1−1/q). For an abelian variety take f=[2], q=4 for a symmetric rigidified L and q=2 for an antisymmetric rigidified L, using the cube isomorphism. For arbitrary rigidified L, canonical metrics on L⁺=L⊗[-1]*L and L⁻=L⊗([-1]*L)⁻¹ induce the metric on L by the square root of their tensor product under L²≃L⁺⊗L⁻. No K-rational even/odd square-root decomposition is assumed.

Hypotheses and conventions:

- Use bounded-point-metrics and the same K-isomorphism θ at all places. For the abelian case the rigidification fixes the cube isomorphisms, and L⁺ is symmetric while L⁻ is antisymmetric.
- The geometric contraction applies to q>1, not q=1. For a general dynamical system this constructs a canonical point height; only the abelian specialization is a Néron–Tate height.

Construction or proof:

1. The starting reference family and its transform by algebraic f and θ have a summable distance bound, by the finite-presentation coefficient estimates in bounded-point-metrics. Identify the one-place metric space with bounded continuous real functions relative to its reference metric.
2. Apply native ContractingWith.exists_fixedPoint to Φ_v with contraction factor 1/q. Finite distance and completeness give a fixed point, uniform convergence of iterates, and the geometric error bound. Uniqueness follows by d≤d/q. Uniform limits preserve continuity. The reference metrics and Φ_v are Galois equivariant; uniqueness also preserves the finite-extension compatibility.
3. Sum the geometric error bounds over places; the limit remains an admissible family and exchanging the sum with the limit is justified by Σ_v n_v c_v/(1−1/q)<∞. This is Gubler Theorems 5.1.13 and 5.3.13 in the point case.
4. Tensor products, duals and homomorphism pullbacks of abelian canonical metrics satisfy the same cube equations, so uniqueness supplies their compatibility. Apply the symmetric and antisymmetric constructions to L⁺,L⁻ and the genuine isomorphism L²≃L⁺⊗L⁻; positive norms have a unique square root.
5. If θ is replaced by αθ, with α∈K×, the new norm is |α|_v^(−1/(q−1)) times the old one, so its local height changes by log|α|_v/(q−1). The product formula cancels these particular global changes. Independent place constants need not cancel. Summing the isometry equation gives ĥ(fP)=q ĥ(P), and bounded comparison with a Weil height identifies the sum uniquely with the Tate limit.

Planning API:

- `TauCeti.canonicalPointMetric` (constructor): The unique metric for (f,L,θ,q) at each place, with q>1.
- `TauCeti.canonicalPointMetric_isometry` (characterisation): θ:f*L≃L^q is an isometry.
- `TauCeti.canonicalPointMetric_error` (relation): d_v(Φ_v^j(m⁰_v),m̂_v)≤q^(−j)c_v/(1−1/q).
- `TauCeti.canonicalPointMetric_change_isomorphism` (compatibility): Changing θ to αθ scales the metric by |α|_v^(−1/(q−1)).
- `TauCeti.canonicalPointMetric_abelian_tensor` (functoriality): Rigidified abelian canonical metrics commute with tensor, dual and homomorphism pullback.
- `TauCeti.canonicalPointMetric_sum` (compatibility): With global cube isomorphisms their sum is ĥ_{K,L}, including the half-sum for L⁺,L⁻.

Unit tests:

- **canonicalPointMetric.test_power** (computation): For [x_i]↦[x_i^q] on ℙⁿ and its standard O(1) isomorphism the sup metric is fixed exactly.
- **canonicalPointMetric.test_trivial** (degenerate): The trivial rigidified bundle on an abelian variety has canonical norm 1 and height zero.
- **canonicalPointMetric.test_rescaling** (computation): For q=4, changing θ to αθ changes λ̂_v by +(1/3)log|α|_v; the global weighted change is zero.
- **canonicalPointMetric.test_q_one** (non-example): For f=id,L=O_X,q=1 and θ=id, every constant positive norm is fixed, so the uniqueness theorem cannot include q=1.
- **canonicalPointMetric.test_elliptic** (compatibility): For O(O) on an elliptic curve, the globally normalized canonical metric sum is native canonicalHeight, not twice it.

Checks:

- For abelian varieties the global sum at P is the existing RP.0/neron-tate-height, for each symmetric and antisymmetric component and hence every line bundle.

Consumers:

- RP.0/local-weil-functions: The norm of the canonical section of O(D) defines local Néron functions with an exact multiplication equation.
- RP.5/szpiro-ullmo-zhang-equidistribution: Provides the canonical point metric; the curvature measure and arithmetic intersections remain separate Arakelov proof inputs.

Direct prerequisites:

- [Bounded metric families for point heights](#RP0-bounded-point-metrics) (`HeightsRationalPointsAndObstructions:RP.0/bounded-point-metrics`)
- [Tate's limit](#RP0-tate-limit) (`HeightsRationalPointsAndObstructions:RP.0/tate-limit`)
- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)
- `AbelianSchemesAndArithmeticModuli:A1/relative-cube-and-power`
- `mathlib:ContractingWith.exists_fixedPoint`

Sources:

- [W. Gubler, *Basic Properties of Heights of Subvarieties*](https://gubler.app.uni-regensburg.de/Publikationen/habi%2B.pdf), Theorem 5.1.13 and Examples 5.1.14–15, pp.100–101; Theorem 5.3.13 and Remark 5.3.14, p.114; Example 5.3.20 and Theorem 5.3.24, pp.117–119. The primary contraction proof, summably dominated convergence and abelian canonical metric normalization.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP0-local-weil-functions"></a>
### Local Weil functions and Néron functions

*Definition · node `HeightsRationalPointsAndObstructions:RP.0/local-weil-functions` · module `TauCeti/NumberTheory/Height/Local`*

For a Cartier divisor D on a projective variety X/K and a bounded point-metric family m on O(D), put λ_{D,v}(P)=−log m_v(s_D(P)) on X(K̄_v)∖|D|, where s_D is its canonical rational section. If s_D=f e in a local nonvanishing frame, then λ=−log|f|_v−log m_v(e). Two admissible metrics give a bounded difference at each place and a summable uniform bound on the global difference. Tensor and pullback give local additivity and functoriality exactly for the transported metrics, and modulo bounded functions for independently chosen metrics. Canonical-point-metrics on an abelian variety give local Néron functions. If θ:[2]*O(D)≃O(D)^q is the chosen global isomorphism and θ([2]*s_D)=a_D s_D^q, then λ̂_{D,v}(2P)=qλ̂_{D,v}(P)−log|a_D(P)|_v where both sides are defined; q=4 for symmetric and q=2 for antisymmetric rigidified bundles. The normalized weighted global sum is ĥ_{K,O(D)}. Product-formula cancellation applies to principal logarithms and rescalings from a global K-isomorphism; arbitrary summable place constants have a global sum which need not vanish.

Hypotheses and conventions:

- K and n_v follow generalized-global-field and normalized-height. Evaluate the global sum over a finite field of definition with its normalized weights; D is a Cartier divisor and P avoids its support.
- Local metrics carry the bounded and summable certificates of bounded-point-metrics. Continuity on algebraic local points alone implies neither certificate.
- Canonical metrics use rigidifications and global cube isomorphisms; a change of arbitrary local constants preserves the global canonical normalization only when their weighted sum is zero.

Construction or proof:

1. Use bounded-point-metrics to build the metric of O(D) from generated-bundle presentations and summable bounded changes. Homogeneity shows the frame formula independent of trivialization; dividing two norms removes the divisor singularity and bounds the difference.
2. At a rational point the sup-metric reference sums to the projective height of the generating presentation, hence to h_{K,O(D)}. The summable uniform perturbation bound proves absolute convergence and the same height class. Changing s_D by f changes the sum by −Σ_v n_v log|f(P)|_v=0.
3. Canonical-point-metrics gives the local exact [2] isometry. Apply it to the section identity θ([2]*s_D)=a_D s_D^q to obtain the displayed logarithmic equation. Its correction sums to zero by the product formula, so the global sum is homogeneous and differs boundedly from a Weil height; Tate-limit uniqueness identifies it with ĥ. The half-sum of the symmetric and antisymmetric metrics handles arbitrary L.
4. For an elliptic Weierstrass equation W, distinguish the cube-metric function ν_v from the equation-independent Silverman normalization λ^Sil_v. Müller–Stoll Remark 3.1 and Proposition 3.2 pp.4 give ν_v=(1/2)λ^MS_v and λ^Sil_v=ν_v−(1/12)log|Δ(W)|_v. In the parameter t=−x/y, ν_v+log|t|_v tends to zero; ν_v(2P)=4ν_v(P)−log|ψ₂(P)|_v. The Silverman function has the additional +(1/4)log|Δ| term. The discriminant shift has weighted sum zero by the product formula, so both sum to the native (O)-canonical height. This local constant shift changes the fixed-isomorphism equation; it is not equality of the two local functions.

Planning API:

- `TauCeti.LocalWeilFunction` (structure): The norm-derived local function for (X,D,v) and a bounded point-metric family, with frame-independent logarithmic formula and summable uniform ambiguity.
- `TauCeti.LocalWeilFunction.add` (simp): λ_{D+E,v} = λ_{D,v} + λ_{E,v} up to bounded functions.
- `TauCeti.LocalWeilFunction.pullback` (functoriality): λ_{f*D,v} = λ_{D,v}∘f up to bounded functions.
- `TauCeti.neronFunction` (constructor): Local functions from the rigidified canonical metric, with q=4 or q=2 multiplication equation, and general bundles through the half-sum construction.
- `TauCeti.neronTateHeight_eq_sum_neronFunction` (relation): ĥ_{K,O(D)}(P)=Σ_v n_v λ̂_{D,v}(P) off D for globally normalized cube isomorphisms. Further independent constant changes preserve equality exactly when their weighted sum vanishes.
- `TauCeti.neronFunction_principal` (characterisation): λ̂_{div(f),v} = −log|f|_v + constant.

Unit tests:

- **LocalWeilFunction.test_projective_hyperplane** (computation): On ℙⁿ with D = {x₀ = 0}, λ_{D,v}(x) = log(max_i|x_i|_v/|x₀|_v) is a local Weil function.
- **LocalWeilFunction.test_principal** (degenerate): For D = div(f), λ = −log|f|_v is a local Weil function and its global sum vanishes by the product formula.
- **LocalWeilFunction.test_global_sum** (compatibility): Σ_v n_v λ_{D,v} represents h_{K,O(D)} on X(K) ∖ |D|.
- **LocalWeilFunction.test_elliptic_normalisation** (compatibility): For P and 2P both different from O, ν_v=(1/2)λ^MS_v satisfies ν_v(2P)=4ν_v(P)−log|ψ₂(P)|_v. The equation-independent normalization λ^Sil_v=ν_v−(1/12)log|Δ|_v satisfies λ^Sil_v(2P)=4λ^Sil_v(P)−log|ψ₂(P)|_v+(1/4)log|Δ|_v. Both differ boundedly from (1/2)log⁺|x(P)|_v and have the same global sum, native canonicalHeight; they need not be the same local function.
- **LocalWeilFunction.test_not_bounded** (non-example): For D≠0 effective and an analytic path approaching a smooth geometric point of its support from the complement, the norm-derived function is unbounded above; for example λ_{(0),v}(t)=−log|t|_v+O(1). A bounded function cannot satisfy this local equation. The condition includes a point approachable from the complement.
- **LocalWeilFunction.test_constant_change** (non-example): For D=0 on a projective variety over ℚ, choose λ_∞=1 and λ_p=0. This is an admissible local Weil family whose global sum is 1; the product formula does not turn it into the zero canonical height.

Checks:

- For E and D=(O), the local metric function agrees with the classical Néron local height after the stated normalization by a place constant. Its global normalized sum is native canonicalHeight.

Consumers:

- RS-03 narrowing of RP.0: canonical local heights on general abelian varieties are kept in RP.0
- GrossZagierAndArithmeticHeights:GZ.2: the arithmetic-intersection local height decomposition for Jacobians is compared with λ̂
- Gubler 2007 §3: canonical local heights enter the global canonical heights of subvarieties

Direct prerequisites:

- [Weil's height machine](#RP0-weil-height-machine) (`HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`)
- [Tate's limit](#RP0-tate-limit) (`HeightsRationalPointsAndObstructions:RP.0/tate-limit`)
- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)
- [Bounded metric families for point heights](#RP0-bounded-point-metrics) (`HeightsRationalPointsAndObstructions:RP.0/bounded-point-metrics`)
- [Canonical point metrics by contraction](#RP0-canonical-point-metrics) (`HeightsRationalPointsAndObstructions:RP.0/canonical-point-metrics`)

Sources:

- [W. Gubler, *Basic Properties of Heights of Subvarieties*](https://gubler.app.uni-regensburg.de/Publikationen/habi%2B.pdf), §5.1.2, Theorem 5.1.13 and Example 5.1.15, pp.96,100–101; §5.2.15–18, pp.108–109; Theorem 5.3.13 and §5.3.20–24, pp.114,117–119. Primary metric contraction and point-height specialization, avoiding the unread Bombieri–Gubler citation.
- [Jan Steffen Müller and Michael Stoll, *Computing canonical heights on elliptic curves in quasi-linear time*](https://www.mathe2.uni-bayreuth.de/stoll/papers/ellheights-arXiv-v2.pdf), §2–3, Remark 3.1 and Proposition 3.2, author manuscript pp.2–4. The elliptic duplication equation follows by translating the x-height convention to the (O)-height convention; its local function is twice the Silverman function plus (1/6)log|Δ|.

<a id="RP0-duplication-by-quartics"></a>
### Multiplication by two is given by quartic forms

*Theorem · node `HeightsRationalPointsAndObstructions:RP.0/duplication-by-quartics` · declaration `TauCeti.AbelianVariety.exists_quartic_duplication` · module `TauCeti/NumberTheory/Height/Machine`*

Let A be an abelian variety over a field, embedded in ℙⁿ by the complete linear system of a symmetric very ample L such that the embedding is projectively normal. Then [2] : A → A is given by homogeneous polynomials f₀, …, f_n of degree 4 without common zero on A. Consequently h∘[2] = 4h + O(1) is exhibited by explicit forms, and [2^l] is given by forms of degree 4^l.

Hypotheses and conventions:

- L symmetric and very ample, the embedding projectively normal.

Construction or proof:

1. [2]*L ≅ L^{⊗4}; projective normality makes H⁰(ℙⁿ, O(4)) → H⁰(A, L^{⊗4}) surjective, so the pulled-back coordinates are restrictions of quartics; they have no common zero since [2] is a morphism (Serre, in Waldschmidt Appendix II, Corollary 2, as cited by Dimitrov–Gao–Habegger).

Checks:

- For an elliptic curve E embedded in ℙ³ by the symmetric very ample bundle O(4·O), duplication is given by four quartic forms in the coordinates.

Direct prerequisites:

- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)
- `AbelianSchemesAndArithmeticModuli:A1/relative-cube-and-power`

Sources:

- [V. Dimitrov, Z. Gao, P. Habegger, *Uniformity in Mordell–Lang for curves*](https://arxiv.org/abs/2001.10276v3), proof of Proposition 4.3, pp. 19–20, (4.11), citing Waldschmidt 1987. On a projectively normal abelian variety embedded by a symmetric very ample bundle, [2] is given by quartic forms without common zeros on A; iterates by forms of degree 4^l.
- [Z. Gao, P. Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*](https://arxiv.org/abs/1801.05762v3), §2.2 (A2), p. 11; §9.1, p. 47. The same description in families after removing finitely many base points.

<a id="RP0-silverman-tate"></a>
### The Silverman–Tate theorem in families

*Theorem · node `HeightsRationalPointsAndObstructions:RP.0/silverman-tate` · declaration `TauCeti.AbelianScheme.silvermanTate` · module `TauCeti/NumberTheory/Height/Machine`*

Let S be a regular irreducible quasi-projective variety over ℚ̄ with a projective compactification S ⊆ S̄ ⊆ ℙᵐ, π : 𝒜 → S an abelian scheme with a closed immersion 𝒜 → ℙⁿ × S, and L = O(1,1)|_𝒜 symmetric on the generic fibre. There is c > 0 with |ĥ_{𝒜_{π(P)}}(P) − h(P)| ≤ c·max{1, h_{S̄}(π(P))} for all P ∈ 𝒜(ℚ̄), where ĥ is the fibrewise Néron–Tate height of L and h the height on ℙⁿ × ℙᵐ.

Hypotheses and conventions:

- Abelian scheme over a regular quasi-projective base over ℚ̄; L the restriction of O(1,1), symmetric on the generic fibre; line bundles rather than Weil divisors, so no smoothness of S̄ is needed.

Construction or proof:

1. Duplication estimate (family-duplication-estimate) gives |h([2]P) − 4h(P)| ≤ c₁·max{1, h_{S̄}(π(P))}.
2. Telescoping as in tate-limit with a base-dependent constant gives the bound with c = c₁/3.

Checks:

- For the constant family A×S with Segre height h(P,s)=h_A(P)+h_S(s), the error is ĥ_A(P)−h_A(P)−h_S(s); dependence on the base height is necessary.

Direct prerequisites:

- [The duplication estimate in families](#RP0-family-duplication-estimate) (`HeightsRationalPointsAndObstructions:RP.0/family-duplication-estimate`)
- [Tate's limit](#RP0-tate-limit) (`HeightsRationalPointsAndObstructions:RP.0/tate-limit`)
- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)

Sources:

- [V. Dimitrov, Z. Gao, P. Habegger, *Uniformity in Mordell–Lang for curves*](https://arxiv.org/abs/2001.10276v3), Theorem A.1 and proof, pp. 36–40. A Cartier-divisor version of Silverman's Theorem A (Crelle 342).
- [Z. Gao, P. Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*](https://arxiv.org/abs/1801.05762v3), proof of Proposition 10.1, (10.2), p. 51. The line-bundle version with error c₁(1 + h(π(P))), the smoothness hypothesis of Silverman's original removed.

<a id="RP0-family-duplication-estimate"></a>
### The duplication estimate in families

*Lemma · node `HeightsRationalPointsAndObstructions:RP.0/family-duplication-estimate` · declaration `TauCeti.AbelianScheme.duplication_estimate` · module `TauCeti/NumberTheory/Height/Machine`*

In the situation of silverman-tate there is c₁ > 0 with |h([2]P) − 4h(P)| ≤ c₁·max{1, h_{S̄}(π(P))} for all P ∈ 𝒜(ℚ̄).

Hypotheses and conventions:

- As in silverman-tate.

Construction or proof:

1. Close the graph of [2] to 𝒜'; F' = [2]*L ⊗ L^{⊗−4} is trivial on the generic fibre, hence a pullback from S up to boundary divisors.
2. Resolve S̄ and the closure of 𝒜 (Hironaka) and bound a Cartier divisor supported over the boundary by pullbacks of effective divisors avoiding a given π(P); finitely many choices cover S.
3. Compare heights on the resolution with h_{S̄} by the Height Machine on the projective base.

Checks:

- For the constant family with Segre height, h([2]P,s)−4h(P,s)=h_A([2]P)−4h_A(P)−3h_S(s), so a uniform bound independent of s is false.

Direct prerequisites:

- [Weil's height machine](#RP0-weil-height-machine) (`HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`)
- [Multiplication by two is given by quartic forms](#RP0-duplication-by-quartics) (`HeightsRationalPointsAndObstructions:RP.0/duplication-by-quartics`)
- [Heights are bounded below off the base locus](#RP0-height-positivity-base-locus) (`HeightsRationalPointsAndObstructions:RP.0/height-positivity-base-locus`)

Sources:

- [V. Dimitrov, Z. Gao, P. Habegger, *Uniformity in Mordell–Lang for curves*](https://arxiv.org/abs/2001.10276v3), Proposition A.2 and proof, pp. 37–40. The duplication estimate with constant c₁·max{1, h_{S̄}(π(P))}; the last comparison of heights on the resolution needs the argument recorded in the paper's source issue E10.

<a id="RP0-fibrewise-height-model-independence"></a>
### The fibrewise Néron–Tate height depends only on the generic fibre

*Lemma · node `HeightsRationalPointsAndObstructions:RP.0/fibrewise-height-model-independence` · declaration `TauCeti.AbelianScheme.fibreNeronTate_indep` · module `TauCeti/NumberTheory/Height/Machine`*

Let π : 𝒜 → S be an abelian scheme over a normal integral locally noetherian base and L, L' line bundles on 𝒜 whose restrictions to the generic fibre are both isomorphic to L₀^{⊗l}. Then L' ⊗ L^{-1} is the pullback of a line bundle on S, so L|_{𝒜_s} ≅ L'|_{𝒜_s} for every s and the fibrewise Néron–Tate heights agree; ĥ_{𝒜,L₀} depends only on L₀.

Hypotheses and conventions:

- S irreducible (normal for the descent of line bundles); l ≥ 1.
- Normal integral locally noetherian base, and the generic-trivial descent theorem for invertible sheaves in this abelian-scheme setting (DGH Remark 3.2 and Appendix A, invoking EGA IV₄ 21.4.13). This theorem is an explicit supplier request; reduced-base seesaw alone is not a substitute.

Construction or proof:

1. A line bundle on 𝒜 trivial on the generic fibre is a pullback from S (EGA IV 21.4.13 / the seesaw principle with rigidification, AbelianSchemesAndArithmeticModuli A1.4), so fibres agree.
2. neron-tate-height depends only on the isomorphism class on each fibre.

Checks:

- Twisting L by π*M for M on S does not change any fibrewise height.

Direct prerequisites:

- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)
- `AbelianSchemesAndArithmeticModuli:A1/relative-seesaw`

Sources:

- [V. Dimitrov, Z. Gao, P. Habegger, *Uniformity in Mordell–Lang for curves*](https://arxiv.org/abs/2001.10276v3), Remark 3.2, p. 14. Model independence of the fibrewise normalisation, via EGA IV 21.4.13.

<a id="RP0-silverman-specialization-limit"></a>
### Silverman's height limit theorem

*Theorem · node `HeightsRationalPointsAndObstructions:RP.0/silverman-specialization-limit` · declaration `TauCeti.AbelianScheme.tendsto_specialization` · module `TauCeti/NumberTheory/Height/Machine`*

Let S be a smooth projective curve over ℚ̄ with function field K = ℚ̄(S), π : 𝒜 → S° an abelian scheme over a dense open S° with generic fibre A/K, L symmetric ample. For x ∈ A(K̄) represented by a section σ_x : S' → 𝒜 over a generically finite ρ : S' → S, ĥ_{𝒜_{ρ(t)}}(σ_x(t)) / h_S(ρ(t)) → ĥ_{K,A}(x) as h_S(ρ(t)) → ∞, with h_S = h∘ι/deg S for an embedding ι and ĥ_{K,A} the function-field Néron–Tate height (geometric-height-field structure on K). Heights on curves are quasi-equivalent: h_S∘ρ/h_{S'} → deg ρ, and ĥ_{K',A_{K'}} = [K':K]·ĥ_{K,A}.

Hypotheses and conventions:

- S a smooth projective curve over ℚ̄; the abelian scheme over a dense open subset; L symmetric ample on the generic fibre.

Construction or proof:

1. Silverman's Theorem B (Crelle 342) as presented by Gao–Habegger Theorem 11.1, using Bombieri–Gubler Corollary 9.3.10 and Conrad Remark 9.2 for the base change of function-field heights.

Checks:

- For a constant family A₀ × S with x a constant point, both sides are 0.

Direct prerequisites:

- [The Silverman–Tate theorem in families](#RP0-silverman-tate) (`HeightsRationalPointsAndObstructions:RP.0/silverman-tate`)
- [Polarized function fields as generalized global fields](#RP0-geometric-height-field) (`HeightsRationalPointsAndObstructions:RP.0/geometric-height-field`)
- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)
- [Heights under finite extension of the base field](#RP0-extension-invariance) (`HeightsRationalPointsAndObstructions:RP.0/extension-invariance`)

Sources:

- [Z. Gao, P. Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*](https://arxiv.org/abs/1801.05762v3), Theorem 11.1, (11.1)–(11.2) and proof, pp. 52–53. Silverman's height limit theorem after base change, with the quasi-equivalence of heights on curves and the degree scaling of function-field Néron–Tate heights (the paper's misprints E16 corrected).

<a id="RP0-silverman-dominant-map-inequality"></a>
### Heights under generically finite dominant maps

*Theorem · node `HeightsRationalPointsAndObstructions:RP.0/silverman-dominant-map-inequality` · declaration `TauCeti.weilHeight_dominant_lower_bound` · module `TauCeti/NumberTheory/Height/Machine`*

Let f : X' → X be a dominant generically finite morphism of varieties over ℚ̄ (or an equidimensional dominant rational map), with heights h' and h from ample line bundles on projective compactifications. There are c > 0, c' and a dense Zariski open U ⊆ X' with h(f(P)) ≥ c·h'(P) − c' for P ∈ U(ℚ̄). The inequality holds only on U: it is not a global two-sided comparison.

Hypotheses and conventions:

- X', X varieties over ℚ̄; f dominant and generically finite.

Construction or proof:

1. Silverman 2011 (J. Ramanujan Math. Soc. 26), as cited by Gao–Habegger: compare f*L with an ample bundle on a blow-up and apply height-positivity-base-locus off the exceptional locus.

Checks:

- For f : ℙ¹ → ℙ¹, x ↦ x², U = ℙ¹ and c = 2.

Direct prerequisites:

- [Weil's height machine](#RP0-weil-height-machine) (`HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`)
- [Heights are bounded below off the base locus](#RP0-height-positivity-base-locus) (`HeightsRationalPointsAndObstructions:RP.0/height-positivity-base-locus`)

Sources:

- [Z. Gao, P. Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*](https://arxiv.org/abs/1801.05762v3), proof of Proposition 9.1, p. 49, citing Silverman 2011. The lower bound on a dense open subset; the paper's application needs instead a global comparison under base change (its source issue E25).

<a id="RP0-geometric-subvariety-height"></a>
### Heights of subvarieties over polarized function fields

*Construction · node `HeightsRationalPointsAndObstructions:RP.0/geometric-subvariety-height` · module `TauCeti/AlgebraicGeometry/AbelianVariety/SubvarietyHeight`*

Let K/k be finitely generated with k algebraically closed, (S, M) a polarization of K/k, A an abelian variety over K with a symmetric ample line bundle L, and (𝒜, π, ℒ) an integral model over S (𝒜 projective over k, π : 𝒜 → S projective with generic fibre A, ℒ extending L). For a closed subvariety X ⊆ A with closure 𝒳 ⊆ 𝒜, the naive height is h_{(𝒜,ℒ)}(X) = (ℒ^{dim X+1} · (π*M)^{dim S−1} · 𝒳) / ((1 + dim X)·deg_L X). The canonical height ĥ_L(X) = lim n^{−2} h_{(𝒜,ℒ)}([n]X) exists, depends on (S, M) and L but not on the model, is ≥ 0, and for a point x it is the Néron–Tate height ĥ_{K,L}(x) of the geometric-height-field structure. For X' ⊆ A_{K̄}, ĥ(X') := ĥ of its image in A.

Hypotheses and conventions:

- K/k finitely generated with trdeg ≥ 1 and k algebraically closed; integral models exist after shrinking S (spreading out).

Construction or proof:

1. Intersection numbers on 𝒜 from SchemeAndStackFoundations SF.5; existence of the limit and independence of the model by Gubler's theory of canonical heights over M-fields (Gubler 2007 Theorem 3.4 and §3.5–3.6; Gubler 2003 Theorem 11.18).
2. Non-negativity: take ℒ ample (Xie–Yuan (1.2)–(1.3)).
3. Points: model-mk-height-comparison identifies the point case with ĥ_{K,L}.

Planning API:

- `TauCeti.IntegralModel` (structure): An integral model (𝒜, π, ℒ) of (A, L) over a polarization (S, M).
- `TauCeti.naiveSubvarietyHeight` (constructor): h_{(𝒜,ℒ)}(X) by the intersection-number formula.
- `TauCeti.canonicalSubvarietyHeight` (constructor): ĥ_L(X) = lim n^{−2} h_{(𝒜,ℒ)}([n]X).
- `TauCeti.canonicalSubvarietyHeight_model_indep` (extensionality): ĥ_L(X) does not depend on the integral model.
- `TauCeti.canonicalSubvarietyHeight_nonneg` (other): ĥ_L(X) ≥ 0.
- `TauCeti.canonicalSubvarietyHeight_point` (compatibility): For a point x, ĥ_L({x}) = ĥ_{K,L}(x).
- `TauCeti.canonicalSubvarietyHeight_translate_torsion` (relation): ĥ_L(X + t) = ĥ_L(X) for torsion t.

Unit tests:

- **canonicalSubvarietyHeight.test_abelian_subvariety** (computation): ĥ_L(B) = 0 for every abelian subvariety B ⊆ A.
- **canonicalSubvarietyHeight.test_point_origin** (degenerate): ĥ_L({0}) = 0.
- **canonicalSubvarietyHeight.test_point** (compatibility): For a point x ∈ A(K), ĥ_L({x}) equals the Néron–Tate height for the geometric-height-field structure of (S, M).
- **canonicalSubvarietyHeight.test_naive_not_canonical** (non-example): The naive height of a translate x + B by a non-torsion x of positive height can be nonzero while ĥ_L(B) = 0; the naive height is not translation invariant.

Checks:

- When trdeg K/k = 1, S is the unique smooth projective model and M plays no role.

Consumers:

- Xie–Yuan 2022 §§3–5: small points and the geometric Bogomolov conjecture are stated with ĥ_L(X)
- Gao–Habegger 2019 §2.1: function-field heights over k(S̄)
- RP.5/bogomolov-statement: the essential minimum and the height of a subvariety

Direct prerequisites:

- [Polarized function fields as generalized global fields](#RP0-geometric-height-field) (`HeightsRationalPointsAndObstructions:RP.0/geometric-height-field`)
- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)
- [Tate's limit](#RP0-tate-limit) (`HeightsRationalPointsAndObstructions:RP.0/tate-limit`)
- `SchemeAndStackFoundations:SF.5`

Sources:

- [J. Xie, X. Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*](https://arxiv.org/abs/2108.09722v1), §1.1, (1.1)–(1.3), pp. 2–3. The naive height of a subvariety by intersection numbers on an integral model and the canonical height as the limit n^{−2}h([n]X), independent of the model and non-negative.
- [W. Gubler, *The Bogomolov conjecture for totally degenerate abelian varieties*](https://arxiv.org/abs/math/0609387v2), §3.1–3.6, Theorems 3.4 and 3.6, pp. 6–8 (arXiv v2). Global heights of subvarieties over function fields characterised by their properties, and Néron–Tate heights of subvarieties, non-negative.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP0-geometric-height-laws"></a>
### Laws for function-field canonical heights

*Theorem · node `HeightsRationalPointsAndObstructions:RP.0/geometric-height-laws` · declaration `TauCeti.canonicalSubvarietyHeight_laws` · module `TauCeti/NumberTheory/Height/Machine`*

For A over K = k(S) with polarization (S, M): point canonical heights are additive in symmetric line bundles, satisfy ĥ_{φ*L}(x) = ĥ_L(φ(x)) for homomorphisms φ, and ĥ_{p₁*L₁⊗p₂*L₂}(x, y) = ĥ_{L₁}(x) + ĥ_{L₂}(y); for symmetric ample L, L' there are c, C > 0 with c·ĥ_L ≤ ĥ_{L'} ≤ C·ĥ_L on A(K̄). For cycles, the unnormalised mixed canonical height H_{L₀,…,L_d}(Z) is multilinear and H_{φ*L₀,…,φ*L_d}(Z) = H_{L₀,…,L_d}(φ_*Z); when φ|_Z is generically finite onto its image of dimension d the degree factor cancels in the normalised height. Changing the ample base polarization (on a common projective model) changes heights by two-sided bounded factors and preserves density of small points.

Hypotheses and conventions:

- K = k(S) with S normal projective over algebraically closed k and M ample; L, L' symmetric ample.

Construction or proof:

1. Point laws: neron-tate-height applied to the geometric-height-field structure.
2. Comparison: L'^{⊗N} ⊗ L^{−1} and L^{⊗N} ⊗ L'^{−1} are ample for N large, and canonical heights of ample symmetric bundles are ≥ 0.
3. Cycle laws: Gubler 2003 Theorem 11.18(a)–(e) and Gubler 2007 §§2.10, 3.1–3.6 for mixed heights; projection formula (SF.5).
4. Keep normalized heights separate from arithmetic intersection degrees: for generically finite f, the unnormalized pushforward intersection scales by deg(f), while a degree-normalized height cancels that factor. State all line bundles and dimensions in each API.

Checks:

- For φ = [n], ĥ_{[n]*L} = n²ĥ_L for symmetric L.

Direct prerequisites:

- [Heights of subvarieties over polarized function fields](#RP0-geometric-subvariety-height) (`HeightsRationalPointsAndObstructions:RP.0/geometric-subvariety-height`)
- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)
- `SchemeAndStackFoundations:SF.5`

Sources:

- [J. Xie, X. Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*](https://arxiv.org/abs/2108.09722v1), pp. 2–3, 24, 26. Uses functoriality, products and comparison of canonical heights of points and subvarieties.
- [W. Gubler, *The Bogomolov conjecture for totally degenerate abelian varieties*](https://arxiv.org/abs/math/0609387v2), §§2.10, 3.1–3.6, pp. 5–8. Mixed canonical heights over function fields with their multilinearity and functoriality.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP0-geometric-height-base-change"></a>
### Function-field heights under finite and constant field extensions

*Theorem · node `HeightsRationalPointsAndObstructions:RP.0/geometric-height-base-change` · declaration `TauCeti.canonicalSubvarietyHeight_baseChange` · module `TauCeti/NumberTheory/Height/Machine`*

Let K = k(S) with S a smooth projective curve over algebraically closed k, and K'/K finite with S' the normalisation of S in K'. Recomputing heights with the model S' gives ĥ_{S'}(x) = [K':K]·ĥ_S(x), and the same scaling for subvarieties with pulled-back line bundles; the degree includes the inseparable degree. Under an extension l/k of algebraically closed fields, intersection numbers of base-changed proper schemes and canonical heights of geometrically integral subvarieties are unchanged. Consequently density of small points is invariant under finite extension of K and extension of algebraically closed constants.

Hypotheses and conventions:

- S a smooth projective curve; k algebraically closed; k ⊆ l algebraically closed.

Construction or proof:

1. Points: projection formula for S' → S and [K'(x):K] = [K'(x):K'][K':K] (Conrad Lemma 8.6 and Remark 9.2).
2. Subvarieties: projection formula for intersection numbers under finite maps (SF.5).
3. Constant extension: intersection numbers are invariant under flat base change of the ground field.

Checks:

- Distinguish: enlarging only the field of definition of x inside one normalised height does not change ĥ; recomputing with S' multiplies by [K':K].

Direct prerequisites:

- [Heights of subvarieties over polarized function fields](#RP0-geometric-subvariety-height) (`HeightsRationalPointsAndObstructions:RP.0/geometric-subvariety-height`)
- [Polarized function fields as generalized global fields](#RP0-geometric-height-field) (`HeightsRationalPointsAndObstructions:RP.0/geometric-height-field`)
- `SchemeAndStackFoundations:SF.5`

Sources:

- [J. Xie, X. Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*](https://arxiv.org/abs/2108.09722v1), (1.1)–(1.3), pp. 2–3; pp. 17–18, 22–25. Uses the behaviour of the geometric heights under finite and constant extensions.
- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §8, Lemma 8.6, and §9, Remark 9.2. The exponent [k':k] relating the algebraic-method structure and the model structure, and the extension formula for heights.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP0-model-mk-height-comparison"></a>
### Model heights are M_K-field heights

*Theorem · node `HeightsRationalPointsAndObstructions:RP.0/model-mk-height-comparison` · declaration `TauCeti.modelHeight_eq_admissibleHeight` · module `TauCeti/NumberTheory/Height/Machine`*

For K = k(S), S normal projective over algebraically closed k and M ample, give K the geometric-height-field structure of (S, M). For a projective K-variety X with a line bundle L and a projective model (𝒳, ℒ) over S, the model intersection height of points and subvarieties equals the M_K-field height with model metrics, up to bounded functions for points; Tate's limit identifies the canonical height of geometric-subvariety-height with the canonical-metric Néron–Tate height H_L(X)/((dim X + 1)·deg_L X). For S a curve the closed-point weights are 1 and the formula agrees with the function-field point height of Gao–Habegger §2.1, including the denominator [K(x):K].

Hypotheses and conventions:

- As in geometric-height-field; models projective over S.

Construction or proof:

1. Gubler 2007 Theorem 3.4(e) identifies model heights and sums of local heights; Theorem 3.6(d) with the Tate limit identifies canonical heights; keep the unnormalised mixed height until the final division.

Checks:

- For X = ℙⁿ_K with its standard model ℙⁿ_S the model height of a point is h_{K,n}.

Direct prerequisites:

- [Heights of subvarieties over polarized function fields](#RP0-geometric-subvariety-height) (`HeightsRationalPointsAndObstructions:RP.0/geometric-subvariety-height`)
- [Local Weil functions and Néron functions](#RP0-local-weil-functions) (`HeightsRationalPointsAndObstructions:RP.0/local-weil-functions`)
- [The normalised projective height](#RP0-normalized-height) (`HeightsRationalPointsAndObstructions:RP.0/normalized-height`)

Sources:

- [J. Xie, X. Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*](https://arxiv.org/abs/2108.09722v1), (1.1)–(1.3), pp. 2–3. Defines heights by intersection numbers on models.
- [W. Gubler, *The Bogomolov conjecture for totally degenerate abelian varieties*](https://arxiv.org/abs/math/0609387v2), §3.1, Theorem 3.4(e), §§3.5–3.6, pp. 6–8. Identifies model heights with sums of local heights over the M_K-field of a polarized function field, and canonical heights via Tate's limit.
- [Z. Gao, P. Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*](https://arxiv.org/abs/1801.05762v3), §2.1, pp. 9–10. Heights over the function field of a curve with the product formula, independent of the field of definition.

<a id="RP0-good-reduction-height-formula"></a>
### Canonical heights under everywhere good reduction

*Theorem · node `HeightsRationalPointsAndObstructions:RP.0/good-reduction-height-formula` · declaration `TauCeti.canonicalSubvarietyHeight_eq_of_goodReduction` · module `TauCeti/NumberTheory/Height/Machine`*

Let S be a smooth projective curve over algebraically closed k, K = k(S), A/K with everywhere good reduction and 𝒜 → S the abelian scheme extending it. A symmetric ample L on A extends to a symmetric rigidified ℒ on 𝒜, and for every closed subvariety X ⊆ A with closure 𝒳, h_ℒ(X) = ℒ^{dim X+1}·𝒳/((dim X + 1)·deg_L X) satisfies h_ℒ([n]X) = n²·h_ℒ(X); hence it equals ĥ_L(X).

Hypotheses and conventions:

- Everywhere good reduction over a complete curve S.

Construction or proof:

1. Extend a divisor of L and subtract π*e*ℒ' to rigidify; symmetry follows from rigidification since ℒ − [−1]*ℒ is a pullback from S (fibrewise-height-model-independence) and trivial along the zero section.
2. [n]*ℒ ≅ ℒ^{⊗n²} on 𝒜 by the cube theorem over S (AbelianSchemesAndArithmeticModuli A1.5); the projection formula gives the scaling.

Checks:

- For a constant abelian variety A = A₀ × S, h_ℒ(X) = 0 for constant X.

Direct prerequisites:

- [Heights of subvarieties over polarized function fields](#RP0-geometric-subvariety-height) (`HeightsRationalPointsAndObstructions:RP.0/geometric-subvariety-height`)
- [The fibrewise Néron–Tate height depends only on the generic fibre](#RP0-fibrewise-height-model-independence) (`HeightsRationalPointsAndObstructions:RP.0/fibrewise-height-model-independence`)
- `AbelianSchemesAndArithmeticModuli:A1/relative-cube-and-power`

Sources:

- [J. Xie, X. Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*](https://arxiv.org/abs/2108.09722v1), §4.3, pp. 21–22. The canonical height of a subvariety equals the intersection-theoretic height for the symmetric rigidified extension under everywhere good reduction.

<a id="rp-1"></a>
## RP.1. Weak Mordell–Weil and descent

The fppf Kummer sequence becomes the native abstract Selmer construction at invertible degree. Unramified local images and finite cohomology give weak Mordell–Weil; the native descent theorem and canonical height give finite generation. Lang–Néron is proved before the function-field height kernel, keeping original and geometric trace distinct. Two-coverings separate H¹(J[2]) from their images in H¹(J). Formal logarithms, Mattuck’s open subgroup and Katz’s strict ramification bound supply the local index and reduction targets.

**Named milestones:** [Kummer map](#RP1-kummer-map), [Selmer group](#RP1-selmer-group), [Weak Mordell–Weil theorem](#RP1-weak-mordell-weil), [Mordell–Weil theorem](#RP1-mordell-weil), [K/k-trace](#RP1-kk-trace), [Lang–Néron theorem](#RP1-lang-neron).

**Imported interfaces:** `HeightsRationalPointsAndObstructions:RP.0`, `HeightsRationalPointsAndObstructions:RP.3`, `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`, `AbelianSchemesAndArithmeticModuli:A3/relative-isogeny`, `AbelianSchemesAndArithmeticModuli:A5/complex-lattice-realization`, `AbelianSchemesAndArithmeticModuli:A6/poincare-complete-reducibility`, `ArithmeticGaloisDuality:R02.3/h1-finite`, `ArithmeticGaloisDuality:R02.3/hermite-unramified-outside-finite`, `ArithmeticGaloisDuality:R02.3/localisation-maps`, `NeronModelsAndSemistableAbelianVarieties:R11.1`, `NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-scheme-model`, `NeronModelsAndSemistableAbelianVarieties:R11.4/bgw-two-torsion`, `NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.3`.


<a id="RP1-kummer-map"></a>
### Kummer maps of isogenies of abelian varieties

*Construction · node `HeightsRationalPointsAndObstructions:RP.1/kummer-map` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Kummer`*

Let φ : A → B be an isogeny of abelian varieties over a field K with kernel A[φ] (a finite commutative K-group scheme). The fppf exact sequence 0 → A[φ] → A → B → 0 gives the Kummer map δ_φ : B(K)/φ(A(K)) ↪ H¹_fppf(K, A[φ]), an injective group homomorphism, natural in K and in φ, whose value at b is the class of the A[φ]-torsor φ^{-1}(b). When deg φ is prime to char K, A[φ] is étale and H¹_fppf(K, A[φ]) = H¹(G_K, A[φ](K^sep)) (continuous cohomology with the discrete module), so δ_φ is the Galois Kummer map; for φ = [n] it is A(K)/nA(K) ↪ H¹(K, A[n]).

Hypotheses and conventions:

- φ an isogeny (finite flat surjective homomorphism); fppf cohomology of a field.
- Galois description only when deg φ is invertible in K.
- The finite étale degree and Galois-cohomology descriptions require n invertible in k; in residue characteristic dividing n retain only the fppf formulation, with finiteness separately unresolved.

Construction or proof:

1. φ is finite flat and surjective, hence an fppf epimorphism of sheaves; the long exact sequence of fppf cohomology over Spec K gives B(K) → H¹(K, A[φ]) with kernel φ(A(K)) (SchemeAndStackFoundations SF.2 sheaf cohomology; torsor description SF.1/torsor-cohomology).
2. The evaluation description: the fibre φ^{-1}(b) is an A[φ]-torsor over K and its class is δ_φ(b) (Poonen §8.4, proof of Theorem 8.4.9: the two maps coincide).
3. Étale case: A[φ] étale and étale = Galois cohomology over a field.

Planning API:

- `TauCeti.AbelianVariety.kummer` (constructor): δ_φ : B(K) →+ H¹_fppf(K, A[φ]), with kernel φ(A(K)).
- `TauCeti.AbelianVariety.kummer_injective` (characterisation): The induced map B(K)/φ(A(K)) → H¹ is injective.
- `TauCeti.AbelianVariety.kummer_eq_torsorClass` (characterisation): δ_φ(b) is the class of the torsor φ^{-1}(b).
- `TauCeti.AbelianVariety.kummer_baseChange` (functoriality): δ_φ commutes with restriction along field extensions K → L.
- `TauCeti.AbelianVariety.kummer_comp` (functoriality): For composable isogenies, δ_{ψ∘φ} is compatible with δ_φ and δ_ψ via the exact sequence 0 → A[φ] → A[ψφ] → B[ψ] → 0.
- `TauCeti.AbelianVariety.kummer_galois` (compatibility): If deg φ is invertible in K, δ_φ is the connecting map of continuous Galois cohomology of the discrete G_K-module A[φ](K^sep).

Unit tests:

- **kummer.test_zero** (degenerate): δ_φ(0) = 0.
- **kummer.test_finite_field** (computation): Over a finite field, H¹(K, A[n]) = A[n](K^sep)/(Frob − 1), and δ_{[n]} is surjective since H¹(K, A) = 0 (Lang).
- **kummer.test_elliptic** (compatibility): For an elliptic curve and n = 2 in characteristic ≠ 2, δ agrees with Tau Ceti's x − T descent map into (K[X]/f)^×/squares under H¹(K, E[2]) ≅ ker(N : A^×/A^{×2} → K^×/K^{×2}).
- **kummer.test_not_surjective** (non-example): δ_{[2]} for E/ℚ is not surjective: H¹(ℚ, E[2]) is infinite while E(ℚ)/2E(ℚ) is finite.

Checks:

- For E : y² = x³ − x over ℚ and φ = [2], δ(0,0) is the class of the 2-covering obtained by halving (0,0), nonzero since (0,0) ∉ 2E(ℚ).

Consumers:

- Poonen Theorem 8.4.9: the image of A(k)/mA(k) lies in a Selmer set, which is finite
- TauCetiRoadmap EllipticCurves Layer 7: the abelian-variety instance of the general Selmer-structure API
- Bhargava–Gross–Wang 2017 §1: two-covers of torsors and the class W[2] in H¹(ℚ, J[2])
- ArithmeticStatistics:ST.4, EffectiveDiophantineMethods:ED.3: Selmer groups of isogenies and rank bounds

Direct prerequisites:

- `AbelianSchemesAndArithmeticModuli:A3/relative-isogeny`
- `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`
- `SchemeAndStackFoundations:SF.1`
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.5, Theorem 8.4.9 and its proof, pp. 242–243. For m prime to char k, the exact sequence 0 → A[m] → A → A → 0 of étale sheaves gives A(k)/mA(k) ↪ H¹(k, A[m]), and this coincides with evaluating the A[m]-torsor [m]: A → A.
- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.5, Theorem 6.5.10(i), p. 182. Isomorphism classes of fppf G-torsors are classified by H¹_fppf.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP1-local-kummer-image-unramified"></a>
### Local Kummer images at places of good reduction

*Lemma · node `HeightsRationalPointsAndObstructions:RP.1/local-kummer-image-unramified` · declaration `TauCeti.AbelianVariety.localKummer_unramified` · module `TauCeti/AlgebraicGeometry/AbelianVariety/MordellWeil`*

Let K be a number field, A/K an abelian variety, n ≥ 1, and v a finite place of K with v ∤ n at which A has good reduction. Then the image of A(K_v)/nA(K_v) in H¹(K_v, A[n]) is the unramified subgroup H¹_nr(K_v, A[n]) = H¹(G_{k_v}, A[n](K_v^nr)); in particular every class in the image becomes trivial on the inertia group I_v.

Hypotheses and conventions:

- Good reduction at v: A extends to an abelian scheme over O_v (its Néron model); v ∤ n.

Construction or proof:

1. The Néron model is the abelian scheme 𝒜/O_v (NeronModels R11.1/abelian-scheme-model); A[n] is finite étale over O_v, so I_v acts trivially (Néron–Ogg–Shafarevich, R11.5).
2. Over K_v^nr, [n] is surjective on 𝒜(O_v^nr) by Hensel's lemma (smooth [n] with surjective reduction on the special fibre), so the image of the Kummer map restricted to I_v vanishes.
3. Use H¹(O_v,𝒜)=0: the special fibre of the abelian scheme is connected, so Lang’s theorem kills its H¹ over the finite residue field, and smooth Hensel lifting gives the local torsor assertion. The integral Kummer exact sequence then identifies H¹(O_v,𝒜[n]) with 𝒜(O_v)/n𝒜(O_v). Its image in H¹(K_v,A[n]) is the unramified subgroup. Lang’s theorem is not applied to the finite group scheme A[n].

Checks:

- For E/ℚ with good reduction at p odd and n = 2, the local image at p is H¹_nr(ℚ_p, E[2]) of order #E(ℚ_p)[2].

Direct prerequisites:

- [Kummer maps of isogenies of abelian varieties](#RP1-kummer-map) (`HeightsRationalPointsAndObstructions:RP.1/kummer-map`)
- `NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-scheme-model`
- `NeronModelsAndSemistableAbelianVarieties:R11.5/neron-ogg-shafarevich`
- `ArithmeticGaloisDuality:R02.3/localisation-maps`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.4, proof of Theorem 8.4.6, pp. 241–242. For v outside S, points over k_v of a proper model give torsor classes coming from H¹(O_v, G), by the valuative criterion of properness.
- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.5, Theorem 6.5.13 and proof (Steps 1–2), pp. 183–184. H¹(O_v, F) → H¹(k_v, F) has trivial kernel for finite étale F, and H¹(O_v, G⁰) = 0 for smooth connected G⁰ by Lang and Hensel.

<a id="RP1-selmer-group"></a>
### Selmer groups and Tate–Shafarevich groups of abelian varieties

*Construction · node `HeightsRationalPointsAndObstructions:RP.1/selmer-group` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Selmer`*

For an isogeny φ : A → B of abelian varieties over a number field K, the Kummer Selmer structure on A[φ] has local conditions the images of the local Kummer maps δ_{φ,v} : B(K_v)/φA(K_v) → H¹(K_v, A[φ]) at every place v; it is unramified at almost all v (local-kummer-image-unramified) and is a Selmer structure in the sense of TauCetiRoadmap EllipticCurves Layer 7. Sel^φ(A/K) ⊆ H¹(K, A[φ]) is its Selmer group, and Ш(A/K) = ker(H¹(K, A) → Π_v H¹(K_v, A)) with H¹(K, A) the Galois cohomology of the discrete module A(K^sep). For φ = [n] write Sel^n(A/K).

Hypotheses and conventions:

- K a number field (characteristic 0, so all cohomology is Galois cohomology); every place, including archimedean ones.

Construction or proof:

1. Instantiate the general Selmer-structure constructor of EllipticCurves Layer 7 with M = A[φ](K^sep) and local subgroups the Kummer images.
2. Ш is the Weil–Châtelet group's locally trivial part, as in EllipticCurves Layer 7 with E replaced by A.

Planning API:

- `TauCeti.AbelianVariety.kummerSelmerStructure` (constructor): The Selmer structure on A[φ] with Kummer local conditions.
- `TauCeti.AbelianVariety.selmerGroup` (constructor): Sel^φ(A/K) as the Selmer group of kummerSelmerStructure.
- `TauCeti.AbelianVariety.sha` (constructor): Ш(A/K) ⊆ H¹(K, A(K^sep)).
- `TauCeti.AbelianVariety.kummer_mem_selmerGroup` (characterisation): δ_φ(b) ∈ Sel^φ(A/K) for b ∈ B(K).
- `TauCeti.AbelianVariety.selmerGroup_baseChange` (functoriality): Restriction to a finite extension L/K maps Sel^φ(A/K) into Sel^φ(A_L/L).
- `TauCeti.AbelianVariety.selmerGroup_elliptic` (compatibility): For A the abelian variety of an elliptic curve E, Sel^n(A/K) is the EllipticCurves Layer 7 group Sel_n(E/K).

Unit tests:

- **selmerGroup.test_degree_one** (degenerate): For φ an isomorphism, A[φ] = 0 and Sel^φ = 0.
- **selmerGroup.test_congruent_one** (computation): Sel²(E/ℚ) ≅ (ℤ/2)² for E : y² = x³ − x.
- **selmerGroup.test_elliptic** (compatibility): For an elliptic curve, the group agrees with the EllipticCurves Layer 7 Selmer group.
- **selmerGroup.test_selmer_not_rank** (non-example): #Sel² can exceed #E(ℚ)/2E(ℚ): for a genus-one curve C : y² = f(x) (deg f = 4) that is everywhere locally soluble with C(ℚ) = ∅ (a positive proportion, Bhargava–Gross–Wang Theorem 10 with g = 1), the class W[2] lies in Sel²(Jac C/ℚ) but not in the Kummer image.

Checks:

- For E : y² = x³ − x over ℚ, Sel²(E/ℚ) ≅ (ℤ/2)², equal to the image of E(ℚ)/2E(ℚ) = E[2](ℚ).

Consumers:

- ArithmeticStatistics:ST.4: average sizes of Selmer groups
- AnabelianGeometryAndNonabelianChabauty:NC.3: depth-one Selmer varieties agree with the Kummer map and Selmer group
- Bhargava–Gross–Wang 2017 §1: Sel_2(J) and the class W[2]

Direct prerequisites:

- [Kummer maps of isogenies of abelian varieties](#RP1-kummer-map) (`HeightsRationalPointsAndObstructions:RP.1/kummer-map`)
- [Local Kummer images at places of good reduction](#RP1-local-kummer-image-unramified) (`HeightsRationalPointsAndObstructions:RP.1/local-kummer-image-unramified`)
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.4, Definition 8.4.4 and Remark 8.4.5, p. 241. The Selmer set of a torsor; for an isogeny viewed as a torsor under its kernel it is the classical Selmer group (e.g. the 2-Selmer group of an elliptic curve).
- [Tau Ceti roadmap authors, *EllipticCurves roadmap, Layer 7: Selmer groups and Sha*](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves), TauCetiRoadmap EllipticCurves, Layer 7. Selmer structures on discrete Galois modules, the Selmer group and Sha, stated generally so that the same API serves abelian varieties.

<a id="RP1-descent-sequence"></a>
### The descent exact sequence

*Theorem · node `HeightsRationalPointsAndObstructions:RP.1/descent-sequence` · declaration `TauCeti.AbelianVariety.descent_exact` · module `TauCeti/AlgebraicGeometry/AbelianVariety/MordellWeil`*

For an isogeny φ : A → B over a number field K there is an exact sequence 0 → B(K)/φA(K) → Sel^φ(A/K) → Ш(A/K)[φ] → 0, where Ш(A/K)[φ] is the kernel of φ_* : Ш(A/K) → Ш(B/K).

Hypotheses and conventions:

- K a number field; φ an isogeny.

Construction or proof:

1. Compare the global and local Kummer sequences place by place (diagram chase), as in EllipticCurves Layer 7 for [m] on an elliptic curve.

Checks:

- For E : y² = x³ − x over ℚ and φ = [2]: Ш(E/ℚ)[2] = 0 and B(K)/φA(K) ≅ Sel² ≅ (ℤ/2)².

Direct prerequisites:

- [Selmer groups and Tate–Shafarevich groups of abelian varieties](#RP1-selmer-group) (`HeightsRationalPointsAndObstructions:RP.1/selmer-group`)
- [Kummer maps of isogenies of abelian varieties](#RP1-kummer-map) (`HeightsRationalPointsAndObstructions:RP.1/kummer-map`)
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.4, Remark 8.4.5 and the identity Sel = {τ : Z^τ(k_v) ≠ ∅ ∀v}, p. 241. Selmer elements are the torsor twists that are everywhere locally soluble; those with a global point form the image of the Kummer map.

<a id="RP1-selmer-finite"></a>
### Finiteness of Selmer groups

*Theorem · node `HeightsRationalPointsAndObstructions:RP.1/selmer-finite` · declaration `TauCeti.AbelianVariety.selmerGroup_finite` · module `TauCeti/AlgebraicGeometry/AbelianVariety/MordellWeil`*

For an isogeny φ : A → B of abelian varieties over a number field K, Sel^φ(A/K) is finite. More precisely, if S contains the archimedean places, the places above deg φ and the places of bad reduction, then Sel^φ(A/K) ⊆ H¹(G_{K,S}, A[φ]), which is finite.

Hypotheses and conventions:

- K a number field; S finite as stated.

Construction or proof:

1. Outside S the local conditions are unramified (local-kummer-image-unramified), so Sel^φ lies in the image of H¹(G_{K,S}, A[φ]) under inflation.
2. H¹(G_{K,S}, M) is finite for finite M of order invertible outside S (ArithmeticGaloisDuality R02.3/h1-finite, via Hermite's theorem R02.3/hermite-unramified-outside-finite).
3. Alternative route: the Selmer set of the proper torsor A → B under A[φ] is finite (Poonen Theorem 8.4.6).

Checks:

- For φ = [2] on y² = x³ − x, S = {2, ∞} and #H¹(G_{ℚ,S}, E[2]) = #(ℚ(S,2))² = 16 bounds #Sel² = 4.

Direct prerequisites:

- [Selmer groups and Tate–Shafarevich groups of abelian varieties](#RP1-selmer-group) (`HeightsRationalPointsAndObstructions:RP.1/selmer-group`)
- [Local Kummer images at places of good reduction](#RP1-local-kummer-image-unramified) (`HeightsRationalPointsAndObstructions:RP.1/local-kummer-image-unramified`)
- `ArithmeticGaloisDuality:R02.3/h1-finite`
- `ArithmeticGaloisDuality:R02.3/hermite-unramified-outside-finite`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.4, Theorem 8.4.6 and proof, pp. 241–242. The Selmer set of a torsor over a proper variety over a global field is finite, via H¹_S and Theorem 6.5.13.
- [Tau Ceti roadmap authors, *EllipticCurves roadmap, Layer 7: Selmer groups and Sha*](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves), TauCetiRoadmap EllipticCurves, Layer 7 (finiteness route via Hermite–Minkowski). Finiteness of H¹(G_{K,S}, E[m]) through extensions of bounded degree unramified outside S.

<a id="RP1-weak-mordell-weil"></a>
### The weak Mordell–Weil theorem

*Theorem · node `HeightsRationalPointsAndObstructions:RP.1/weak-mordell-weil` · declaration `TauCeti.AbelianVariety.finite_quotient_nsmul` · module `TauCeti/AlgebraicGeometry/AbelianVariety/MordellWeil`*

Let A be an abelian variety over a global field K and m ≥ 1 not divisible by char K. Then A(K)/mA(K) is finite. For K a number field this holds for every m ≥ 1.

Hypotheses and conventions:

- K a global field; m invertible in K.

Construction or proof:

1. A(K)/mA(K) embeds into H¹(K, A[m]) by kummer-map; its image lies in Sel^m(A/K) (Kummer images are locally Kummer images), which is finite by selmer-finite (number fields) or by Poonen Theorem 8.4.6 (global fields).
2. Over number fields every m is invertible.
3. For global function fields and n prime to the characteristic, use the finite Selmer set of the proper torsor [n]:A→A (RP.3/selmer-set-of-torsor), not the number-field Hermite supplier. This dependency is acyclic: that Selmer-set finiteness theorem does not use weak Mordell–Weil. Its global-field cohomological proof is an explicit unresolved contract.

Checks:

- For an elliptic curve over ℚ this is Tau Ceti's weak Mordell–Weil for m = 2 (TauCetiRoadmap EllipticCurves Layer 6).

Direct prerequisites:

- [Kummer maps of isogenies of abelian varieties](#RP1-kummer-map) (`HeightsRationalPointsAndObstructions:RP.1/kummer-map`)
- [Finiteness of Selmer groups](#RP1-selmer-finite) (`HeightsRationalPointsAndObstructions:RP.1/selmer-finite`)
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`
- [The Selmer set of a torsor](#RP3-selmer-set-of-torsor) (`HeightsRationalPointsAndObstructions:RP.3/selmer-set-of-torsor`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.5, Theorem 8.4.9 and proof, pp. 242–243. Weak Mordell–Weil over a global field for m not divisible by the characteristic, via the finite Selmer set.

Outstanding proof or supplier contracts: Global-function-field adelic and cohomology extension.

<a id="RP1-mordell-weil"></a>
### The Mordell–Weil theorem

*Theorem · node `HeightsRationalPointsAndObstructions:RP.1/mordell-weil` · declaration `TauCeti.AbelianVariety.fg_points` · module `TauCeti/AlgebraicGeometry/AbelianVariety/MordellWeil`*

For an abelian variety A over a number field K, the group A(K) is finitely generated. Its torsion subgroup is finite and A(K) ≅ ℤ^r ⊕ A(K)_tors with r = rank A(K).

Hypotheses and conventions:

- K a number field.

Construction or proof:

1. Choose a symmetric ample L; h = ĥ_{K,L} on A(K) is ≥ 0, satisfies the parallelogram law exactly, and is Northcott on A(K) (northcott-ample, since ĥ represents h_{K,L}).
2. A(K)/2A(K) is finite (weak-mordell-weil), i.e. the subgroup 2A(K) has finite index.
3. Mathlib's descent theorem CommGroup.fg_of_descent' in its additive form AddCommGroup.fg_of_descent' gives finite generation; Mathlib Monoid.finite_set_isOfFiniteOrder_of_descent (additive form) gives finite torsion.

Checks:

- For an elliptic curve this is Tau Ceti's WeierstrassCurve.Affine.Point fg theorem of EllipticCurves Layer 6 (fg_point_of_numberField).
- A(K) need not be finitely generated over K = ℂ(t) when A is constant: A(ℂ) ⊆ A(ℂ(t)) is uncountable (compare lang-neron).

Direct prerequisites:

- [The weak Mordell–Weil theorem](#RP1-weak-mordell-weil) (`HeightsRationalPointsAndObstructions:RP.1/weak-mordell-weil`)
- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)
- [Northcott for ample line bundles](#RP0-northcott-ample) (`HeightsRationalPointsAndObstructions:RP.0/northcott-ample`)
- [Positivity and kernel of the Néron–Tate height](#RP0-neron-tate-kernel-number-field) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-kernel-number-field`)
- `mathlib:CommGroup.fg_of_descent'`
- `mathlib:Monoid.finite_set_isOfFiniteOrder_of_descent`
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.5, statement before Theorem 8.4.9, p. 242. The Mordell–Weil theorem for abelian varieties over global fields; the weak theorem is proved on the way.
- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §7, Theorem 7.1 and Corollary 7.2, author copy pp. 23–24. Finite generation of A(K) for K finitely generated over its prime field (number fields included), by the height argument.
- [Tau Ceti roadmap authors, *EllipticCurves roadmap, Layer 6: the Mordell–Weil theorem*](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves), TauCetiRoadmap EllipticCurves, Layer 6. Mordell–Weil for elliptic curves by the naive-height descent, already in Tau Ceti.

<a id="RP1-neron-tate-positive-definite"></a>
### Positive definiteness of the Néron–Tate height on A(K) ⊗ ℝ

*Theorem · node `HeightsRationalPointsAndObstructions:RP.1/neron-tate-positive-definite` · declaration `TauCeti.AbelianVariety.neronTateHeight_posDef` · module `TauCeti/AlgebraicGeometry/AbelianVariety/MordellWeil`*

For an abelian variety A over a number field K and a symmetric ample L, the real extension of ĥ_{K,L} to A(K) ⊗ ℝ is positive definite; equivalently the Gram matrix of ⟨,⟩_L on a basis of A(K)/A(K)_tors is positive definite, and its determinant (the L-regulator) is positive.

Hypotheses and conventions:

- K a number field; L symmetric ample.

Construction or proof:

1. Finite generation (mordell-weil) makes A(K)/tors a lattice Λ of rank r; ĥ is a quadratic form on Λ with finitely many points of bounded value (Northcott) and kernel exactly the torsion (neron-tate-kernel-number-field).
2. Minkowski's lemma: a quadratic form on a lattice that is ≥ 0, with finitely many lattice points below every bound, extends to a positive definite form on Λ ⊗ ℝ (Conrad Lemma 10.1).

Checks:

- For E/ℚ of rank one with generator P, the Gram matrix is (2ĥ(P)) with ĥ(P) > 0.

Direct prerequisites:

- [The Mordell–Weil theorem](#RP1-mordell-weil) (`HeightsRationalPointsAndObstructions:RP.1/mordell-weil`)
- [The Néron–Tate bilinear form of a symmetric bundle](#RP0-neron-tate-bilinear-form) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-bilinear-form`)
- [Positivity and kernel of the Néron–Tate height](#RP0-neron-tate-kernel-number-field) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-kernel-number-field`)

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §10, Lemma 10.1 and the discussion before Theorem 9.15, author copy pp. 35–37. Over classical global fields the canonical height is positive definite on A(K) ⊗ ℝ; Minkowski's lemma on quadratic forms with Northcott.

<a id="RP1-kk-trace"></a>
### Chow's K/k-trace

*Construction · node `HeightsRationalPointsAndObstructions:RP.1/kk-trace` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Trace`*

Let K/k be a primary (for example regular) extension of fields and A an abelian variety over K. The K/k-trace is a pair (Tr_{K/k}(A), τ) of an abelian variety over k and a K-homomorphism τ : Tr_{K/k}(A)_K → A, final among pairs (C, f) with C an abelian variety over k and f : C_K → A. It exists; τ has finite kernel, whose Cartier dual is connected; if char k = 0, τ is a closed immersion. There is a unique abelian subvariety A' ⊆ A with A' = image of τ, and (A/A')^{K/k} = 0. Formation of the trace commutes with separable algebraic extensions of k.

Hypotheses and conventions:

- K/k primary (k separably closed in K suffices for the universal property; regular for the base-change statements).

Construction or proof:

1. Existence and properties: Conrad Theorem 6.2 (existence via the K/k-image of the dual) and Theorem 6.4 (finite kernel, connected Cartier dual of ker τ, closed immersion in characteristic 0).
2. Base change: Conrad Theorems 6.8 and 6.12.

Planning API:

- `TauCeti.AbelianVariety.trace` (constructor): Tr_{K/k}(A), an abelian variety over k.
- `TauCeti.AbelianVariety.traceMap` (projection): τ : Tr_{K/k}(A)_K → A.
- `TauCeti.AbelianVariety.trace_universal` (universal-property): Every f : C_K → A from a k-abelian variety C factors uniquely through τ.
- `TauCeti.AbelianVariety.traceMap_ker_finite` (other): ker τ is finite (trivial in characteristic 0).
- `TauCeti.AbelianVariety.trace_constant` (example): Tr_{K/k}(A₀ ⊗ K) = A₀.
- `TauCeti.AbelianVariety.trace_baseChange` (compatibility): Tr commutes with separable algebraic extension of k (Conrad Theorem 6.8).

Unit tests:

- **trace.test_constant** (computation): For A = E₀ ⊗ K with E₀ an elliptic curve over k, Tr = E₀.
- **trace.test_zero** (degenerate): Tr_{K/k}(0) = 0.
- **trace.test_nonisotrivial_elliptic** (computation): For E/ℂ(t) with nonconstant j-invariant, Tr_{K/k}(E) = 0.
- **trace.test_isotrivial_nonconstant** (non-example): The quadratic twist of a constant elliptic curve E₀ ⊗ K by t ∈ K^× with K(√t)/K not obtained from an extension of constants has trace 0, although it becomes constant over K(√t) (the example of Conrad Remark 4.6).

Checks:

- For A = A₀ ⊗_k K constant, Tr_{K/k}(A) = A₀ and τ = id.

Consumers:

- Lang–Néron theorem: A(K)/τ(Tr(k)) is finitely generated
- Xie–Yuan 2022 §5; Gao–Habegger 2019 §3: trivial trace is the hypothesis of Northcott and of the geometric Bogomolov conjecture
- RP.5/manin-mumford-positive-characteristic: trivial trace rules out isotrivial special subvarieties

Direct prerequisites:

- `SchemeAndStackFoundations:SF.1`
- `AbelianSchemesAndArithmeticModuli:A6/poincare-complete-reducibility`
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §6, Theorem 6.2, Theorem 6.4, Corollary 6.5, Theorems 6.8 and 6.12, author copy pp. 20–23. Existence of the K/k-trace, finiteness of ker τ with connected Cartier dual, closed immersion in characteristic 0, and compatibility with base change.
- [Z. Gao, P. Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*](https://arxiv.org/abs/1801.05762v3), §1 p. 2, §2 p. 9, §3.1 p. 12. The trace and trace map with the unique abelian subvariety A' = Tr ⊗ K and (A/A')^{K/k} = 0.
- [J. Xie, X. Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*](https://arxiv.org/abs/2108.09722v1), §1.1, p. 3. The K/k-trace as a final object; in positive characteristic tr is a purely inseparable isogeny onto its image.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP1-lang-neron"></a>
### The Lang–Néron theorem

*Theorem · node `HeightsRationalPointsAndObstructions:RP.1/lang-neron` · declaration `TauCeti.AbelianVariety.fg_points_mod_trace` · module `TauCeti/AlgebraicGeometry/AbelianVariety/MordellWeil`*

Let K/k be a finitely generated regular extension and A an abelian variety over K. Then A(K)/τ(Tr_{K/k}(A)(k)) is a finitely generated abelian group. In particular, if Tr_{K/k}(A) = 0 then A(K) is finitely generated.

Hypotheses and conventions:

- K/k finitely generated and regular.

Construction or proof:

1. Conrad §7, pp.23–26: reduce to a one-variable regular extension by Lemmas 7.3–7.4. Use bounded-degree components of the Hom scheme modulo the constant trace through the Albanese construction to obtain the required finite-dimensionality statement.
2. Use finiteness of étale H¹ on a smooth curve for the finite prime-to-characteristic torsion module to prove weak Mordell–Weil. Apply descent to the quotient modulo the trace using the bounded-degree/height input. Record the Hom-scheme and étale-cohomology contracts as gaps.
3. Do not use Theorem 9.15 in this proof: its positive-definiteness argument subsequently uses Lang–Néron.

Checks:

- For E/ℂ(t) with nonconstant j-invariant, E(ℂ(t)) is finitely generated.

Direct prerequisites:

- [Chow's K/k-trace](#RP1-kk-trace) (`HeightsRationalPointsAndObstructions:RP.1/kk-trace`)
- [Polarized function fields as generalized global fields](#RP0-geometric-height-field) (`HeightsRationalPointsAndObstructions:RP.0/geometric-height-field`)
- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)
- `mathlib:CommGroup.fg_of_descent'`

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §7, Theorem 7.1 with Lemmas 7.3–7.5, author copy pp. 23–27. Statement and proof of the Lang–Néron theorem.
- [Z. Gao, P. Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*](https://arxiv.org/abs/1801.05762v3), proof of Proposition 3.1, p. 14, and Proposition B.1, p. 58. Uses Lang–Néron for trivial-trace abelian varieties over function fields.

Outstanding proof or supplier contracts: Lang–Néron proof contracts.

<a id="RP1-function-field-neron-tate-kernel"></a>
### Kernel of the Néron–Tate height over function fields

*Theorem · node `HeightsRationalPointsAndObstructions:RP.1/function-field-neron-tate-kernel` · declaration `TauCeti.AbelianVariety.neronTateHeight_eq_zero_iff_trace` · module `TauCeti/AlgebraicGeometry/AbelianVariety/MordellWeil`*

Let K/k be finitely generated and regular of positive transcendence degree, with a polarization, and A/K an abelian variety with a symmetric ample line bundle L. On A(K̄), the kernel of ĥ_L is the image of the constant points of the geometric K̄/k̄-trace plus torsion. On A(K), the quadratic height induces a positive definite form on the real vector space obtained from A(K)/τ(Tr_{K/k}(A)(k)). Trivial original K/k-trace suffices for the torsion-kernel assertion on A(K). For all A(K̄) the torsion-kernel assertion requires trivial geometric trace; the original trace can become nonzero after a finite nonconstant extension.

Hypotheses and conventions:

- K/k finitely generated regular, trdeg ≥ 1; L symmetric ample.

Construction or proof:

1. ĥ vanishes on the trace points (Conrad Lemma 9.13: heights of constant points are bounded).
2. Positive definiteness modulo the trace (Conrad Theorem 9.15, proved in §10 via Theorem 10.2 and Néron's Lemma 10.3).
3. Combine with Lang–Néron and finite extensions (Conrad Lemma 9.16, Corollary 9.17).

Checks:

- The kernel is τ(Tr(k̄)) + torsion, not (Tr ⊗ K̄)(K̄) + torsion: the latter is the source misprint recorded for Gao–Habegger §1.
- A nonconstant quadratic isotrivial twist of a constant Jacobian can have zero original trace but nonzero geometric trace. Its zero-height constant points after the splitting extension distinguish the two hypotheses.

Direct prerequisites:

- [The Lang–Néron theorem](#RP1-lang-neron) (`HeightsRationalPointsAndObstructions:RP.1/lang-neron`)
- [Chow's K/k-trace](#RP1-kk-trace) (`HeightsRationalPointsAndObstructions:RP.1/kk-trace`)
- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)
- [Polarized function fields as generalized global fields](#RP0-geometric-height-field) (`HeightsRationalPointsAndObstructions:RP.0/geometric-height-field`)

Sources:

- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §9, Lemma 9.13, Theorem 9.15, Lemma 9.16, Corollary 9.17; §10, author copy pp. 35–41. Néron–Tate heights vanish on trace points and are positive definite modulo the trace.
- [J. Xie, X. Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*](https://arxiv.org/abs/2108.09722v1), proof of Lemma 5.3, p. 24; §5.3, p. 26. With trivial trace, canonical height zero means torsion (citing Conrad Theorem 9.15).
- [Z. Gao, P. Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*](https://arxiv.org/abs/1801.05762v3), §1 p. 2; §2.1 p. 10. The kernel of the function-field Néron–Tate height (with the printed form corrected).

Outstanding proof or supplier contracts: Lang–Néron proof contracts.

<a id="RP1-two-coverings"></a>
### Two-coverings of torsors and the class W[2]

*Definition · node `HeightsRationalPointsAndObstructions:RP.1/two-coverings` · module `TauCeti/AlgebraicGeometry/AbelianVariety/TwoCovering`*

Let J be an abelian variety over a field k of characteristic different from 2 and I a J-torsor. A two-covering of I is a J-torsor Y with a morphism π : Y → I such that π(y + a) = π(y) + 2a; π is finite étale of degree 2^{2 dim J}. Isomorphism classes of two-coverings of I form a principal homogeneous space under H¹(k, J[2]) (twisting), nonempty exactly when [I] ∈ 2·H¹(k, J). For I = J the base point is [2] : J → J, and for a ∈ J(k) the two-covering [2]^{-1}(a) has class δ(a) (kummer-map). For the Jacobian J of C : y² = f(x) of genus g over k (char k ≠ 2, f separable of degree 2g + 2) with torsor J¹ = Pic¹_C and hyperelliptic class d, the map J¹ → J² ≅ J, x ↦ 2x − d, is a two-covering of J by J¹; its class W[2] ∈ H¹(k, J[2]) maps to [J¹] ∈ H¹(k, J), and the image of W[2] in H¹(k,J) is zero iff J¹(k) ≠ ∅. The stronger condition W[2]=0 is equivalent to an odd unordered factorization of f as in w2-odd-factorizations.

Hypotheses and conventions:

- J abelian over k; for the hyperelliptic statements char k ≠ 2 and f separable of degree 2g + 2.

Construction or proof:

1. A two-covering of I is a J[2]-torsor over I compatible with the J-actions; H¹(k, J[2]) acts simply transitively on such classes by contracted product (SchemeAndStackFoundations SF.1 twisting).
2. For I=J, all two-covering classes are H¹(k,J[2]); those whose underlying J-torsor has a k-point are exactly the Kummer image. The map J¹→J has image class [J¹] in H¹(k,J), so Pic¹(k)≠∅ characterizes the vanishing of that image, not of W[2] itself.

Planning API:

- `TauCeti.AbelianVariety.TwoCovering` (structure): A two-covering (Y, π) of a J-torsor I.
- `TauCeti.AbelianVariety.TwoCovering.class` (projection): Its class in the H¹(k, J[2])-torsor of two-coverings of I.
- `TauCeti.AbelianVariety.TwoCovering.trivial` (constructor): [2] : J → J as the two-covering of the trivial torsor.
- `TauCeti.Hyperelliptic.W2` (constructor): W[2] ∈ H¹(k, J[2]) for C : y² = f(x) with deg f = 2g + 2.
- `TauCeti.Hyperelliptic.W2_eq_zero_iff` (characterisation): W[2]=0 iff f has an odd unordered factorization, allowing quadratic-conjugate odd factors. Its image in H¹(k,J) vanishes iff Pic¹_C(k) is nonempty.

Unit tests:

- **TwoCovering.test_trivial** (degenerate): The two-covering [2] : J → J has class 0.
- **TwoCovering.test_degree** (computation): A two-covering of a torsor under an abelian surface has degree 16.
- **W2.test_rational_point** (compatibility): A point P∈C(k) gives [P]∈Pic¹_C(k), so W[2] lies in the Kummer image and its H¹(k,J) image vanishes; W[2] itself need not vanish.
- **W2.test_not_selmer_zero** (non-example): A nonzero W[2] can still be a Kummer class when Pic¹_C(k) is nonempty. A locally soluble Pic¹ torsor places W[2] in Sel₂(J); failure of Pic¹_C(k)≠∅, rather than W[2]≠0 alone, puts it outside the Kummer image.

Checks:

- If I = J (trivial torsor), [2] : J → J is a two-covering of class 0.

Consumers:

- Bhargava–Gross–Wang 2017 Theorems 10–11: W[2] and two-coverings detect Brauer–Manin obstructions on J¹ and Sym^k C
- RP.3/bgw-hasse-failures: the obstruction is computed through W[2]

Direct prerequisites:

- [Kummer maps of isogenies of abelian varieties](#RP1-kummer-map) (`HeightsRationalPointsAndObstructions:RP.1/kummer-map`)
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.3`
- `NeronModelsAndSemistableAbelianVarieties:R11.4/bgw-two-torsion`

Sources:

- [M. Bhargava, B. H. Gross, X. Wang, *A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension*](https://arxiv.org/abs/1310.7692v2), §1, p. 2. Defines two-coverings of J-torsors, their classes in H¹(ℚ, J[2]), the 2-Selmer group as locally soluble two-coverings of J, and the class W[2] of J¹ → J² ≅ J, which maps to 0 in Ш[2] iff J¹(ℚ) ≠ ∅.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP1-w2-odd-factorizations"></a>
### W[2] and odd factorisations

*Theorem · node `HeightsRationalPointsAndObstructions:RP.1/w2-odd-factorizations` · declaration `TauCeti.Hyperelliptic.W2_eq_zero_of_odd_factor` · module `TauCeti/AlgebraicGeometry/AbelianVariety/MordellWeil`*

For C : y² = f(x) over a field k of characteristic ≠ 2 with f separable of degree 2g + 2, the points of the class W[2] (as a J[2]-torsor) are the Weierstrass divisor classes e of degree 1 with 2e ≡ d, and these correspond to the odd factorisations f = g·h over k (g, h of odd degree, rational or conjugate over a quadratic extension). Hence W[2] ≠ 0 whenever f has no odd factorisation over k.

Hypotheses and conventions:

- char k ≠ 2; deg f = 2g + 2 even; f separable.

Construction or proof:

1. J[2] is generated by differences of Weierstrass points; the J[2]-torsor of halves of d is described by subsets of the roots of f of odd size modulo complement (Bhargava–Gross–Wang Proposition 22(4)).

Checks:

- For a separable sextic with Galois group S₆ over ℚ, no Galois-stable odd unordered partition of the roots exists, so W[2]≠0. Irreducibility alone is insufficient: x⁶−2 has cubic factors conjugate over ℚ(√2).

Direct prerequisites:

- [Two-coverings of torsors and the class W[2]](#RP1-two-coverings) (`HeightsRationalPointsAndObstructions:RP.1/two-coverings`)

Sources:

- [M. Bhargava, B. H. Gross, X. Wang, *A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension*](https://arxiv.org/abs/1310.7692v2), §1, p. 2; Proposition 22(4), p. 11. Points of W[2] are degree-one Weierstrass divisors with 2e ≡ d, corresponding to odd factorisations of f.

<a id="RP1-selmer-set-two-covering"></a>
### The 2-Selmer set Sel₂(J¹) and the 2-Selmer set of order k

*Definition · node `HeightsRationalPointsAndObstructions:RP.1/selmer-set-two-covering` · module `TauCeti/AlgebraicGeometry/AbelianVariety/TwoCovering`*

For a number field K and a J-torsor I, Sel₂(I) is the set of isomorphism classes of everywhere locally soluble two-coverings of I. For I = J¹ of a hyperelliptic C as in two-coverings, Sel₂(J¹) is empty or a principal homogeneous space for Sel₂(J), and equals the set of elements of Sel₄(J) that map to W[2]. For odd k > 0, the 2-Selmer set of order k is the subset of classes that locally at every place v come from points e_v − ((k − 1)/2)·d with e_v an effective K_v-divisor of degree k.

Hypotheses and conventions:

- K a number field; I a torsor under an abelian variety; k odd.

Construction or proof:

1. Instance of the Selmer set of a torsor (Poonen Definition 8.4.4) for the J[2]-torsors of two-coverings; the principal homogeneous structure is the twisting action of H¹(K, J[2]) restricted to local solubility.

Planning API:

- `TauCeti.AbelianVariety.selmerSet` (constructor): Sel₂(I) for a J-torsor I.
- `TauCeti.AbelianVariety.selmerSet_torsor` (structure): If nonempty, Sel₂(I) is a principal homogeneous space for Sel₂(J).
- `TauCeti.Hyperelliptic.selmerSet_eq_preimage` (characterisation): Sel₂(J¹) = preimage of W[2] in Sel₄(J).
- `TauCeti.Hyperelliptic.selmerSetOfOrder` (constructor): The 2-Selmer set of order k.

Unit tests:

- **selmerSet.test_trivial_torsor** (degenerate): Sel₂(J) as a Selmer set of the trivial torsor is the 2-Selmer group.
- **selmerSet.test_point** (computation): C(K) ≠ ∅ implies Sel₂(J¹) ≠ ∅.
- **selmerSet.test_compat_poonen** (compatibility): Sel₂(I) is Poonen's Selmer set of the torsor I under the group scheme J[2] for any two-covering.
- **selmerSet.test_empty_locally_soluble** (non-example): Sel₂(J¹) can be empty for everywhere locally soluble C (Bhargava–Gross–Wang Theorem 5).

Checks:

- If C(K) ≠ ∅ then Sel₂(J¹) contains the class of the point and is a coset of Sel₂(J).

Consumers:

- RP.3/bgw-hasse-failures: Sel₂(J¹) = ∅ gives the obstruction
- ArithmeticStatistics:ST.4: average sizes of Selmer sets

Direct prerequisites:

- [Two-coverings of torsors and the class W[2]](#RP1-two-coverings) (`HeightsRationalPointsAndObstructions:RP.1/two-coverings`)
- [Selmer groups and Tate–Shafarevich groups of abelian varieties](#RP1-selmer-group) (`HeightsRationalPointsAndObstructions:RP.1/selmer-group`)

Sources:

- [M. Bhargava, B. H. Gross, X. Wang, *A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension*](https://arxiv.org/abs/1310.7692v2), §1, pp. 2–3; §12, p. 33. Defines Sel₂(J¹), its relation to Sel₂(J) and Sel₄(J), and the 2-Selmer set of order k.
- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.4, Definition 8.4.4, p. 241. The Selmer set of a torsor.

<a id="RP1-elliptic-two-descent-example"></a>
### A complete elliptic 2-descent

*Application · node `HeightsRationalPointsAndObstructions:RP.1/elliptic-two-descent-example` · declaration `TauCeti.AbelianVariety.elliptic_two_descent_example` · module `TauCeti/AlgebraicGeometry/AbelianVariety/MordellWeil`*

For E : y² = x³ − x over ℚ (S = {2, ∞}): E[2](ℚ) = {O, (0,0), (±1, 0)}; the local images at 2 and ∞ and the unramified conditions elsewhere cut Sel²(E/ℚ) ⊆ H¹(G_{ℚ,S}, E[2]) down to the image of E[2](ℚ), so Sel²(E/ℚ) ≅ (ℤ/2)², Ш(E/ℚ)[2] = 0, rank E(ℚ) = 0 and E(ℚ) = E[2](ℚ) is finitely generated. The Selmer bound is only an upper bound: for the Jacobian of an everywhere locally soluble genus-one curve y² = f(x) with no rational point (Bhargava–Gross–Wang Theorem 10, g = 1), W[2] is a Selmer element outside the Kummer image, so #Sel² > #E(ℚ)/2E(ℚ).

Hypotheses and conventions:

- ℚ, S = {2, ∞}; the x − T descent map of Tau Ceti identifies H¹(ℚ, E[2]) with the kernel of the norm on (ℚ^× /ℚ^{×2})³.

Construction or proof:

1. Compute the image of the descent map on E[2](ℚ); compute local images at 2 and ∞; intersect (EllipticCurves Layer 6 explicit 2-descent, already formalised in Tau Ceti's Stoll development).
2. Apply descent-sequence and mordell-weil.

Checks:

- rank E(ℚ) = 0 and #E(ℚ) = 4.

Direct prerequisites:

- [The descent exact sequence](#RP1-descent-sequence) (`HeightsRationalPointsAndObstructions:RP.1/descent-sequence`)
- [The Mordell–Weil theorem](#RP1-mordell-weil) (`HeightsRationalPointsAndObstructions:RP.1/mordell-weil`)
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`

Sources:

- [Tau Ceti roadmap authors, *EllipticCurves roadmap, Layer 6: the Mordell–Weil theorem*](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves), TauCetiRoadmap EllipticCurves, Layer 6, explicit 2-descent. The explicit 2-Selmer group in the étale algebra, its finiteness, and the rank bound.

<a id="RP1-formal-logarithm-small-ball"></a>
### Formal logarithms on a sufficiently small ideal

*Theorem · node `HeightsRationalPointsAndObstructions:RP.1/formal-logarithm-small-ball` · declaration `TauCeti.formalLogarithm_smallIdeal_equiv` · module `TauCeti/NumberTheory/Height/LocalDescent`*

Let F/ℚ_p be finite, O its integers, 𝔪 its maximal ideal, and e=ord_F(p). For a g-dimensional commutative formal group law over O, represented by g native multivariate power series with zero constant term, linear term X+Y, associativity, identity and inverses, there is a unique formal logarithm log_FG over F with derivative the identity. For every integer r>e/(p−1), it converges on (𝔪^r)^g and gives an analytic group isomorphism FG((𝔪^r)^g)≃((𝔪^r)^g,+), with analytic inverse and the same tangent map. In particular the whole maximal-ideal group is torsion-free when e<p−1. This is a multivariate logarithm theorem extending native one-dimensional FormalGroup; native FormalGroup.Point is a power-series-valued point type and does not already give points in a complete local field.

Hypotheses and conventions:

- The formal law has integral coefficients and is commutative; F has characteristic zero; use ord_F(π)=1 and r∈ℕ with r>e/(p−1).
- A smooth group model at the identity supplies its formal law and comparison with the kernel of reduction; that comparison is a separate NeronModels supplier contract. For an abelian variety without good reduction one still uses the smooth Néron model near the identity.

Construction or proof:

1. The inverse Jacobian in the second variables at Y=0 gives the g invariant differential forms with integral coefficients and identity constant matrix. Commutativity makes them closed. Integrate their homogeneous degree-(n−1) parts over F to obtain the degree-n part of log, whose denominators divide n. Translation invariance gives log(FG(X,Y))=log(X)+log(Y); derivative identity determines uniqueness in characteristic zero.
2. A homogeneous degree-n coefficient has valuation at least −e·ord_p(n). Since ord_p(n)≤(n−1)/(p−1), on 𝔪^r the nonlinear term has valuation at least nr−e·ord_p(n)>r and tends to infinity with n. The same estimates on differences show log−id is strictly contracting on (𝔪^r)^g. Solve log(x)=y by iterating x↦y−(log(x)−x); completeness gives its inverse on the whole ball. The power-series inverse is analytic by the same estimates. Log is a homomorphism, hence the inverse is too.
3. Katz Appendix Lemma′ proves the r=1 range by topologically nilpotent divided powers on 𝔪, followed by inverse logarithm and exponential; the coefficient proof gives the explicit small-ball refinement used here. The target is the logarithm, not a redevelopment of general Lie groups or an elliptic formal-group carrier.

Checks:

- For the additive g-dimensional law log is the identity on every ideal.
- For the multiplicative law in one variable log(1+T)=Σ_{n≥1}(−1)^{n+1}T^n/n and its inverse exp(T)−1 satisfy the stated strict-radius condition.
- At F=ℚ_p(ζ_p), e=p−1 and ζ_p−1∈𝔪 is nonzero p-torsion for the multiplicative law. At p=2 the witness is −2 over ℚ₂. Thus the strict inequality for r=1 cannot be replaced by e≤p−1.

Direct prerequisites:

- `mathlib:MvPowerSeries`
- `mathlib:FormalGroup`
- `mathlib:ContractingWith.exists_fixedPoint`

Sources:

- [S. Lang (article); N. Katz (Appendix), *Galois properties of torsion points on abelian varieties (Appendix by N. Katz)*](https://web.math.princeton.edu/~nmk/old/galoisprop.pdf), Appendix, Lemma′ and its proof, printed p.502 (the Appendix begins on p.501). Primary proof of logarithm/exponential isomorphism and torsion-freeness for e<p−1; the explicit r bound is the stated coefficient-estimate refinement.
- [A. Mattuck, *Abelian varieties over p-adic ground fields*](https://people.dm.unipi.it/lombardo/NonAbelianChabauty/Mat55.pdf), §13, Theorem 7 and proof, pp.114–117; §14(2), p.118. Analytic additive coordinates near the identity, with identity tangent normalization and linear change between charts.

<a id="RP1-local-division-index"></a>
### Local indices of multiplication by two

*Lemma · node `HeightsRationalPointsAndObstructions:RP.1/local-division-index` · declaration `TauCeti.AbelianVariety.card_quotient_two_padic` · module `TauCeti/AlgebraicGeometry/AbelianVariety/MordellWeil`*

Let A be an abelian variety of dimension g over F/ℚ_p finite. Mattuck gives an open finite-index subgroup U≃(O_F^g,+) of A(F). With the module absolute value |a|_F=q_F^(−ord_F(a)), #A(F)/2A(F)=|2|_F^(−g)·#A(F)[2]. Thus the factor is 2^(g[F:ℚ₂]) at p=2 and 1 otherwise; for F=ℚ₂ and full two-torsion it gives 2^(3g). This module absolute value is not the extension of the normalized ℚ_p norm without its [F:ℚ_p] power. Over ℝ the quotient has order #A(ℝ)[2]/2^g; over ℂ it is trivial.

Hypotheses and conventions:

- A abelian of dimension g over a local field of characteristic 0.

Construction or proof:

1. Read Mattuck Theorem 7, pp.114–117: its additive local uniformization sends an abelian subgroup into a linear subspace; projective compactness over a locally compact F makes the open subgroup finite index. An alternative implementation uses a smooth Néron identity chart, shrinks and rescales it until its formal law is integral, and applies formal-logarithm-small-ball. The model/chart comparison is an explicit supplier request, not an existing abelian-variety logarithm at the pins.
2. Let G=A(F), C=G/U. Since U is torsion-free, multiplication by two in 0→U→G→C→0 gives 0→G[2]→C[2]→U/2U→G/2G→C/2C→0. Both C groups are finite with equal order. Taking alternating cardinalities gives #G/2G=#G[2]·#U/2U, without assuming this group extension splits. For U≃O_F^g the last factor is q_F^(g ord_F(2))=|2|_F^(−g).
3. Over ℂ import complex-lattice-realization: A(ℂ)≃ℂ^g/Λ, where multiplication by two is surjective. Over ℝ take conjugation invariants in that uniformization. The identity component is a real g-torus; the component group embeds in H¹(⟨conjugation⟩,Λ), hence is killed by two. In 0→G⁰→G→π₀G→0, [2] is onto on G⁰ and G⁰[2] has order 2^g. The snake lemma gives G[2]↠π₀G and G/2G≃π₀G, proving the stated real count. No splitting hypothesis is needed.

Checks:

- For E/ℚ₂ with E(ℚ₂)[2] = ℤ/2 × ℤ/2, #E(ℚ₂)/2E(ℚ₂) = 8.
- If F/ℚ₂ is unramified quadratic and g=1 with all four two-torsion points rational, the quotient has order 4·4=16, not 8.
- At p odd the additive lattice contributes no two-quotient. For g=0 both sides equal 1.
- A real elliptic curve with one component has #E(ℝ)[2]=2 and quotient order 1; with two components these orders are 4 and 2. A complex abelian variety has quotient order 1.

Direct prerequisites:

- [Kummer maps of isogenies of abelian varieties](#RP1-kummer-map) (`HeightsRationalPointsAndObstructions:RP.1/kummer-map`)
- `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`
- [Formal logarithms on a sufficiently small ideal](#RP1-formal-logarithm-small-ball) (`HeightsRationalPointsAndObstructions:RP.1/formal-logarithm-small-ball`)
- `NeronModelsAndSemistableAbelianVarieties:R11.1`
- `AbelianSchemesAndArithmeticModuli:A5/complex-lattice-realization`

Sources:

- [A. Mattuck, *Abelian varieties over p-adic ground fields*](https://people.dm.unipi.it/lombardo/NonAbelianChabauty/Mat55.pdf), §13, Theorem 7 and proof, printed pp.114–117; §14(2), p.118. Primary proof of an additive open subgroup, finite index for locally compact fields. The index is then obtained by the displayed finite-group exact sequence.

Outstanding proof or supplier contracts: Smooth-group formal-completion and local-chart interfaces.

<a id="RP1-reduction-torsion-injective"></a>
### Reduction is injective on torsion

*Lemma · node `HeightsRationalPointsAndObstructions:RP.1/reduction-torsion-injective` · declaration `TauCeti.AbelianVariety.reduction_injective_torsion` · module `TauCeti/AlgebraicGeometry/AbelianVariety/MordellWeil`*

Let A be an abelian variety over a number field K with good reduction at a finite place v of residue characteristic p, absolute ramification index e_v, and 𝒜 the abelian scheme over O_v. The reduction map A(K_v)_tors → 𝒜(k_v) is injective on torsion of order prime to p, and on all torsion if e_v < p − 1. For the Jacobian J of a curve C over ℚ with good reduction at q, the reduction J(ℚ) → J̃(𝔽_q) is a homomorphism compatible with reduction of points and divisors, injective on torsion for q ≥ 3.

Hypotheses and conventions:

- Good reduction at v; e_v < p − 1 for the p-part.

Construction or proof:

1. Properness identifies A(F) with 𝒜(O_F) at a good-reduction place. The smooth formal completion of 𝒜 at zero identifies ker(red) with its g-dimensional integral commutative formal law on 𝔪_F; this comparison is requested explicitly from NeronModels R11.1.
2. For n prime to p, [n](T)=nT+higher-degree terms on the formal completion. On 𝔪_F the linear term is a unit and the nonlinear terms strictly contract, so [n] is bijective there by successive approximation; in particular the kernel has no prime-to-p torsion. Étaleness alone is not asserted to make all global n-torsion trivial.
3. If e_v<p−1, formal-logarithm-small-ball applies with r=1 and identifies the full reduction kernel with the torsion-free additive group 𝔪_F^g. This is precisely Katz Appendix Lemma′ and its logarithm/exponential proof on printed p.502. Consequently all torsion injects under the strict ramification bound.
4. Base change of the Jacobian and its Abel–Jacobi map to the good-reduction model gives compatibility with points and divisor classes; restrict the local statement to J(ℚ). At q≥3 one has e=1<q−1.

Checks:

- E : y² = x³ − x has good reduction at 3 and E(ℚ)_tors = ℤ/2 × ℤ/2 injects into Ẽ(𝔽₃), of order 4.
- On the multiplicative formal group over ℚ_p(ζ_p), e=p−1 and ζ_p−1 is nonzero p-torsion in the reduction kernel: the strict boundary cannot be weakened, nor can the restriction to prime-to-p torsion be dropped without a ramification hypothesis.
- For a dimension-zero abelian variety both torsion and reduction groups are trivial.

Direct prerequisites:

- `NeronModelsAndSemistableAbelianVarieties:R11.1/abelian-scheme-model`
- `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`
- [Formal logarithms on a sufficiently small ideal](#RP1-formal-logarithm-small-ball) (`HeightsRationalPointsAndObstructions:RP.1/formal-logarithm-small-ball`)
- `NeronModelsAndSemistableAbelianVarieties:R11.1`
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`

Sources:

- [S. Lang (article); N. Katz (Appendix), *Galois properties of torsion points on abelian varieties (Appendix by N. Katz)*](https://web.math.princeton.edu/~nmk/old/galoisprop.pdf), Appendix, Lemma and Lemma′, printed p.502; setup on p.501. Katz proves the local kernel torsion-free using logarithm and exponential when e<p−1, and derives the global torsion reduction injection.
- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.5, Theorem 6.5.13 proof, Step 2 (Lang and Hensel), p. 184. Hensel lifting along smooth group schemes over complete DVRs.

Outstanding proof or supplier contracts: Smooth-group formal-completion and local-chart interfaces.

<a id="RP1-two-isogeny-kummer-formula"></a>
### The Kummer map of a two-isogeny

*Application · node `HeightsRationalPointsAndObstructions:RP.1/two-isogeny-kummer-formula` · declaration `TauCeti.EllipticCurve.twoIsogeny_kummer` · module `TauCeti/AlgebraicGeometry/AbelianVariety/MordellWeil`*

For E : y² = x(x² + cx + d) over ℚ with d(c² − 4d) ≠ 0, the 2-isogeny φ : E → E' with E' : y² = x(x² − 2cx + c² − 4d) and its dual φ' : E' → E: the Kummer map E(ℚ)/φ'(E'(ℚ)) → H¹(ℚ, E'[φ']) ≅ ℚ^×/ℚ^{×2} is (x, y) ↦ x for x ≠ 0, (0, 0) ↦ d, O ↦ 1; the φ'-Selmer group is the set of d₁ ∈ ℚ^×/ℚ^{×2} dividing d up to squares for which v² = d₁u⁴ + cu² + d/d₁ is everywhere locally soluble; its quotient by the image of E(ℚ) is Ш(E'/ℚ)[φ'].

Hypotheses and conventions:

- E with a rational 2-torsion point at (0, 0); characteristic 0.
- Use an integral Weierstrass normalization for c,d and S containing primes dividing 2d and the bad-reduction set. Test local solubility on the smooth projective model of the homogeneous quartic, including points at infinity.

Construction or proof:

1. Instance of kummer-map for the degree-two isogeny: E'[φ'] ≅ μ₂ and H¹(ℚ, μ₂) ≅ ℚ^×/ℚ^{×2} (Kummer theory); the fibre of φ' over (x, y) is the quadratic extension ℚ(√x).
2. Selmer condition: everywhere local solubility of the homogeneous spaces v² = d₁u⁴ + cu² + d/d₁ (descent-sequence).
3. The divisor bound for square classes uses the integral equation. Local solubility is not restricted to the displayed affine chart of the covering.

Checks:

- For E : y² = x³ − x (c = 0, d = −1), the image of E(ℚ) is {1, −1} ⊆ ℚ^×/ℚ^{×2}.

Direct prerequisites:

- [Kummer maps of isogenies of abelian varieties](#RP1-kummer-map) (`HeightsRationalPointsAndObstructions:RP.1/kummer-map`)
- [The descent exact sequence](#RP1-descent-sequence) (`HeightsRationalPointsAndObstructions:RP.1/descent-sequence`)
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.4, Remark 8.4.5, p. 241. Selmer groups of isogenies as Selmer sets of the isogeny torsor.
- [Tau Ceti roadmap authors, *EllipticCurves roadmap, Layer 7: Selmer groups and Sha*](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves), TauCetiRoadmap EllipticCurves, Layer 7 (Selmer groups of an arbitrary isogeny φ and its dual). Isogeny Selmer groups of elliptic curves with their Kummer sequences.

<a id="rp-2"></a>
## RP.2. Adelic points and Brauer evaluation

Affine adelic points are identified with native restricted products. General separated schemes use the integral-model direct limit, since a global affine cover need not cover adelic points. Scheme Brauer evaluation, uniform finite support and fixed-class local constancy give the Brauer–Manin set. The layer includes algebraic and unramified classes, zero-cycles, the formal lemma and cyclic norm adapters. Finite local evaluation partitions form a finite constraint problem; an algorithm additionally needs the certified computational contracts in the requests.

**Named milestones:** [Brauer evaluation](#RP2-brauer-evaluation), [Finite support of Brauer evaluation](#RP2-brauer-evaluation-finite-support), [Rational points lie in the Brauer–Manin set](#RP2-rational-points-in-brauer-manin-set), [Adelic points](#RP2-adelic-points-general), [Brauer–Manin obstruction](#RP2-brauer-manin-general), [Brauer–Manin test](#RP2-effective-brauer-manin-test).

**Imported interfaces:** `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.2/pullback`, `SchemeAndStackFoundations:SF.5`, `SchemeAndStackFoundations:key/scheme-brauer`.


<a id="RP2-points-topology"></a>
### The topology on points with values in a topological algebra

*Definition · node `HeightsRationalPointsAndObstructions:RP.2/points-topology` · declaration `TauCeti.Points` · module `TauCeti/AlgebraicGeometry/AdelicPoints/Topology`*

Let R be a commutative ring, A a commutative R-algebra and B a commutative topological ring which is an R-algebra. The B-valued points of Spec A are Points_R(A, B) := A →ₐ[R] B. The points topology on Points_R(A, B) is the topology induced by the injection Points_R(A, B) → B^A, φ ↦ (φ(a))_{a ∈ A}, where B^A = (A → B) carries the product topology; equivalently, it is the coarsest topology for which every evaluation φ ↦ φ(a), a ∈ A, is continuous. Lean: `TauCeti.Points R A B`, a type synonym of `A →ₐ[R] B` carrying this topology as an instance; no topology instance is put on `A →ₐ[R] B` itself, so no existing instance is overridden.

Hypotheses and conventions:

- R and A commutative; B a commutative topological ring with an R-algebra structure. No finiteness of A and no separation axiom on B is assumed in the definition; the separation, closedness and local-compactness statements of RP.2/points-topology-presentation assume them.

Construction or proof:

1. Define the topology as TopologicalSpace.induced along the coercion Points_R(A, B) → (A → B), with Pi.topologicalSpace on the target. The coercion is injective (algebra maps are determined by their values), so this is the subspace topology of the image.
2. Continuity into Points: a map f from a topological space Z is continuous iff every z ↦ f(z)(a) is continuous (induced topology and product topology universal properties).
3. Functoriality: for g : A′ →ₐ[R] A, φ ↦ φ ∘ g is continuous, because each evaluation of the composite at a′ is the evaluation at g(a′). For a continuous R-algebra map h : B → B′, φ ↦ h ∘ φ is continuous, because each evaluation of the composite is h composed with an evaluation.
4. Products: Algebra.TensorProduct.liftEquiv identifies Points_R(A ⊗_R A′, B) with pairs (φ, φ′) (the commutation condition is automatic since B is commutative). The map φ ↦ (φ ∘ includeLeft, φ ∘ includeRight) is continuous by functoriality, and its inverse is continuous because each element of A ⊗_R A′ is a finite sum of products a ⊗ a′, whose value (φ(a)φ′(a′) summed) is a continuous function of (φ, φ′) as B is a topological ring.
5. Examples: for A = R[X], Polynomial.aeval identifies Points_R(R[X], B) with B through φ ↦ φ(X), a homeomorphism since every evaluation is a polynomial function of φ(X). For A = R[X, Y]/(XY − 1), φ ↦ φ(X) is a bijection onto Bˣ, and the points topology corresponds to Mathlib's topology on units (induced by u ↦ (u, u⁻¹), Units.embedProduct), because the points topology is induced by the two evaluations at X and Y = X⁻¹.

Planning API:

- `TauCeti.Points.continuous_eval` (other): For every a ∈ A the evaluation φ ↦ φ(a) is continuous on Points_R(A, B).
- `TauCeti.Points.continuous_iff` (characterisation): A map f : Z → Points_R(A, B) from a topological space is continuous iff z ↦ f(z)(a) is continuous for every a ∈ A.
- `TauCeti.Points.isEmbedding_coe` (compatibility): The coercion Points_R(A, B) → (A → B) is a topological embedding for the product topology.
- `TauCeti.Points.precomp` (functoriality): An R-algebra map g : A′ → A induces a continuous map Points_R(A, B) → Points_R(A′, B), φ ↦ φ ∘ g, compatible with identities and composition.
- `TauCeti.Points.postcomp` (functoriality): A continuous R-algebra map h : B → B′ induces a continuous map Points_R(A, B) → Points_R(A, B′), φ ↦ h ∘ φ, compatible with identities and composition.
- `TauCeti.Points.tensorHomeomorph` (universal-property): Points_R(A ⊗_R A′, B) ≃ₜ Points_R(A, B) × Points_R(A′, B), φ ↦ (φ ∘ includeLeft, φ ∘ includeRight).
- `TauCeti.Points.polynomialHomeomorph` (compatibility): Points_R(R[X], B) ≃ₜ B, φ ↦ φ(X).
- `TauCeti.Points.unitsHomeomorph` (compatibility): Points_R(R[X, Y]/(XY − 1), B) ≃ₜ Bˣ with Mathlib's topology on units, φ ↦ the unit with value φ(X) and inverse φ(Y).

Unit tests:

- **TauCeti.Points.tests.base** (degenerate): Points_R(R, B) has exactly one element, Algebra.ofId, and hence the only topology.
- **TauCeti.Points.tests.zero_ring** (degenerate): If A is the zero ring and B is nontrivial, Points_R(A, B) is empty.
- **TauCeti.Points.tests.polynomial_real** (computation): For R = ℤ, A = ℤ[X] and B = ℝ, φ ↦ φ(X) is a homeomorphism onto ℝ; in particular Points is connected and not discrete.
- **TauCeti.Points.tests.units_real** (compatibility): For R = ℤ, A = ℤ[X, Y]/(XY − 1) and B = ℝ, the space is homeomorphic to ℝ ∖ {0} with the subspace topology (inversion is continuous on ℝ ∖ {0}, so the units topology is the subspace topology).
- **TauCeti.Points.tests.not_discrete** (non-example): For B = ℚ_p and A = ℤ[X], the points φ_n with φ_n(X) = pⁿ converge to the point with value 0; so the points topology is not the discrete topology.

Checks:

- Every evaluation map is continuous, and a map into Points is continuous iff all its evaluations are.
- For A = R[X, Y]/(XY − 1) and B = 𝔸_ℚ, the space is 𝔸_ℚˣ with the topology in which u and u⁻¹ both vary continuously; it is not the subspace topology from 𝔸_ℚ (Conrad §3). A definition through the embedding of Spec A in the affine line would get this wrong.
- No presentation of A enters the definition; that any presentation gives the same topology is a lemma (RP.2/points-topology-presentation).

Consumers:

- HeightsRationalPointsAndObstructions:RP.2/adelic-points: The topology of X(𝔸_K) is the points topology with values in the adele ring.
- HeightsRationalPointsAndObstructions:RP.2/adelic-points-restricted-product: The local factors X(K_v) and X₀(O_v) carry the points topology with values in K_v, and the comparison is proved through presentations.
- AdelicAlgebraicGroups:AA.1: For an affine group scheme G of finite type, G(𝔸) with its topology is the points topology of its coordinate ring; the group case consumes this construction.
- Poonen Proposition 8.2.9 and Corollary 8.2.11 (coverage): Local constancy of Brauer evaluation is a statement about the points topology on X(K_v).

Direct prerequisites:

- `mathlib:TopologicalSpace.induced`
- `mathlib:Pi.topologicalSpace`
- `mathlib:AlgHom`
- `mathlib:Algebra.TensorProduct.liftEquiv`
- `mathlib:Polynomial.aeval`
- `mathlib:Units.embedProduct`

Sources:

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §2, Proposition 2.1, p. 2. Conrad's topological ring R is the value ring B here; his explicit description of the topology is taken as the definition.
- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §3, pp. 3–4. The units example of the acceptance cases.

<a id="RP2-points-topology-presentation"></a>
### Presentations compute the points topology

*Lemma · node `HeightsRationalPointsAndObstructions:RP.2/points-topology-presentation` · declaration `TauCeti.Points.isEmbedding_generators` · module `TauCeti/AlgebraicGeometry/AdelicPoints/Topology`*

Let R, A, B be as in RP.2/points-topology, n ∈ ℕ and π : R[X₁, …, X_n] → A a surjective R-algebra map (MvPolynomial (Fin n) R), with aᵢ := π(Xᵢ). Then φ ↦ (φ(a₁), …, φ(a_n)) is a topological embedding Points_R(A, B) → Bⁿ whose image is Z(ker π) := {b ∈ Bⁿ : aeval b f = 0 for all f ∈ ker π}. If B is T1, Z(ker π) is closed, so the embedding is closed and Points_R(A, B) is T1; if B is Hausdorff, Points_R(A, B) is Hausdorff; if B is locally compact Hausdorff, Points_R(A, B) is locally compact.

Hypotheses and conventions:

- π surjective; for the closedness statements B is T1 (resp. Hausdorff, locally compact Hausdorff).

Construction or proof:

1. Bijection onto Z(ker π): an R-algebra map out of the quotient A ≅ R[X]/ker π is determined by the images of the Xᵢ, and b ∈ Bⁿ is the image of such a map iff MvPolynomial.aeval b kills ker π.
2. Embedding: the map is continuous (n evaluations). Conversely every a ∈ A is π(f) for a polynomial f, and φ(a) = aeval (φ(a₁), …, φ(a_n)) f is a polynomial function of the coordinates, continuous because B is a topological ring; so each evaluation factors continuously through the image, and the points topology is induced from Bⁿ.
3. Closedness: Z(ker π) = ⋂_{f ∈ ker π} (b ↦ aeval b f)⁻¹{0}, an intersection of closed sets when {0} is closed.
4. Separation and local compactness pass to subspaces, and closed subspaces of locally compact Hausdorff spaces are locally compact.

Planning API:

- `TauCeti.Points.isEmbedding_generators` (characterisation): For a surjection π from MvPolynomial (Fin n) R onto A, the evaluation at π(X₁), …, π(X_n) is a topological embedding Points_R(A, B) → Fin n → B.
- `TauCeti.Points.range_generators` (characterisation): Its range is the common zero set of ker π.
- `TauCeti.Points.isClosedEmbedding_generators` (other): If B is T1 the embedding is closed.
- `TauCeti.Points.t2Space` (other): If B is Hausdorff, Points_R(A, B) is Hausdorff (for every A, since the coercion to A → B is injective).
- `TauCeti.Points.locallyCompactSpace` (other): If A is finitely generated and B is locally compact Hausdorff, Points_R(A, B) is locally compact.

Checks:

- For A = R[X]/(X² − 2) and B = ℝ, the image is {±√2} ⊂ ℝ, a closed two-point set.
- Two presentations of A give homeomorphic zero sets; the homeomorphism is given by polynomial maps in both directions.

Direct prerequisites:

- [The topology on points with values in a topological algebra](#RP2-points-topology) (`HeightsRationalPointsAndObstructions:RP.2/points-topology`)
- `mathlib:MvPolynomial.aeval`
- `mathlib:Topology.IsEmbedding`
- `mathlib:Topology.IsClosedEmbedding`

Sources:

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §2, proof of Proposition 2.1, p. 2. Independence of the presentation, which the proof deduces from the polynomial expression of every element in the generators.
- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §2, proof of Proposition 2.1, p. 2. Closedness of the image and local compactness.

<a id="RP2-points-topology-base-change"></a>
### Changing the value ring

*Lemma · node `HeightsRationalPointsAndObstructions:RP.2/points-topology-base-change` · declaration `TauCeti.Points.isEmbedding_postcomp` · module `TauCeti/AlgebraicGeometry/AdelicPoints/Topology`*

Let A be a finitely generated R-algebra and h : B → B′ a continuous R-algebra map of commutative topological R-algebras. Then postcomposition Points_R(A, B) → Points_R(A, B′) is continuous. If h is a topological embedding, so is the induced map; if h is moreover a closed (resp. open) embedding, so is the induced map; and if h(B) is discrete in B′, the image of Points_R(A, B) is discrete in Points_R(A, B′).

Hypotheses and conventions:

- A finitely generated; h continuous. The source's closed/open clause is stated with the roles of the two rings exchanged (sourceIssues HeightsRationalPointsAndObstructions/E8); the statement here uses the corrected orientation.

Construction or proof:

1. Choose a presentation π : R[X₁, …, X_n] → A (A finitely generated). By RP.2/points-topology-presentation both Points spaces embed in Bⁿ and B′ⁿ as the zero sets of ker π, and the induced map is the restriction of hⁿ : Bⁿ → B′ⁿ, since h is an algebra map.
2. If h is an embedding (resp. closed, open embedding), so is hⁿ, and Points_R(A, B) = hⁿ⁻¹(Points_R(A, B′)) inside Bⁿ, because a tuple satisfies the equations of ker π in B iff its image does in B′ (h injective). Restrictions of (closed, open) embeddings to preimages are (closed, open) embeddings.
3. Discreteness: hⁿ(Bⁿ) is discrete in B′ⁿ when h(B) is discrete in B′ (finite products of discrete subspaces), and the image of Points_R(A, B) is a subset of it.

Planning API:

- `TauCeti.Points.isEmbedding_postcomp` (functoriality): For A finitely generated and h a topological embedding, postcomposition with h is a topological embedding.
- `TauCeti.Points.isClosedEmbedding_postcomp` (functoriality): The same for closed embeddings.
- `TauCeti.Points.isOpenEmbedding_postcomp` (functoriality): The same for open embeddings.
- `TauCeti.Points.discrete_range_postcomp` (other): If h(B) is discrete in B′, the image of Points_R(A, B) in Points_R(A, B′) is discrete.

Checks:

- The inclusion K → 𝔸_K of a number field into its adele ring gives a discrete embedding of the K-points of any affine K-variety into its adelic points (RP.2/rational-points-discrete).
- The inclusion of the valuation ring O_v into K_v is an open and closed embedding, so the integral points of an O_v-model are open and closed in the K_v-points.

Direct prerequisites:

- [Presentations compute the points topology](#RP2-points-topology-presentation) (`HeightsRationalPointsAndObstructions:RP.2/points-topology-presentation`)
- `mathlib:Topology.IsEmbedding`
- `mathlib:Topology.IsClosedEmbedding`
- `mathlib:DiscreteTopology`

Sources:

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §2, Example 2.2, p. 3. The discreteness clause, stated in the correct orientation in the source.
- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §2, Example 2.2, p. 3. The closed and open clauses; the printed hypothesis 'R′ closed in R' has the two rings exchanged (sourceIssues E8).

<a id="RP2-adelic-points"></a>
### Adelic points of an affine variety

*Definition · node `HeightsRationalPointsAndObstructions:RP.2/adelic-points` · declaration `TauCeti.AdelicPoints` · module `TauCeti/AlgebraicGeometry/AdelicPoints/Basic`*

Let K be a number field, 𝔸_K = NumberField.AdeleRing (𝓞 K) K its adele ring (the product of the infinite adele ring and the finite adele ring), and A a finitely generated commutative K-algebra, the coordinate ring of the affine K-variety X = Spec A. The adelic points of X are X(𝔸_K) := Points_K(A, 𝔸_K) with the points topology (RP.2/points-topology). They come with: the diagonal ι : X(K) = Points_K(A, K) → X(𝔸_K), postcomposition with the algebra map K → 𝔸_K; for each finite place v (a height-one prime of 𝓞 K) the local projection X(𝔸_K) → X(K_v), K_v = v.adicCompletion K, postcomposition with the projection of the finite adeles to their v-component; and for each infinite place w the local projection X(𝔸_K) → X(K_w), K_w = w.Completion. All of these are continuous. Lean: `TauCeti.AdelicPoints K A`, with `diagonal`, `finiteProj v` and `infiniteProj w`.

Hypotheses and conventions:

- K a number field; A a finitely generated commutative K-algebra (so X is an affine K-scheme of finite type). Non-affine varieties are not covered by this node (coverage).

Construction or proof:

1. Definition: Points_K(A, 𝔸_K). The adele ring is a topological K-algebra (NumberField.AdeleRing is a topological ring with Algebra K).
2. Diagonal and projections: the algebra map K → 𝔸_K and the projections 𝔸_K → K_v are continuous K-algebra maps (the projection of the finite adeles to a component is RestrictedProduct.evalRingHom, continuous for the restricted-product topology; the infinite part is a product of the K_w). Postcomposition is continuous by RP.2/points-topology.
3. Product decomposition: since 𝔸_K = K_∞ × 𝔸_K^f, Points_K(A, 𝔸_K) ≃ₜ Points_K(A, K_∞) × Points_K(A, 𝔸_K^f) and Points_K(A, K_∞) ≃ₜ ∏_w X(K_w) (algebra maps into a product are families of algebra maps into the factors; the topologies agree because both are induced by the evaluations).
4. Hausdorff: 𝔸_K is Hausdorff (Tau Ceti NumberField.AdeleRing.instT2Space), so RP.2/points-topology-presentation makes X(𝔸_K) Hausdorff. Local compactness: the infinite adeles are locally compact (NumberField.InfiniteAdeleRing.locallyCompactSpace), and the finite adeles are locally compact by RestrictedProduct.locallyCompactSpace_of_group once each O_v is compact; compactness of O_v for a number field is not in the pinned libraries (gap), so the local-compactness API item waits for it.

Planning API:

- `TauCeti.AdelicPoints.diagonal` (constructor): The continuous map X(K) → X(𝔸_K) given by postcomposition with algebraMap K 𝔸_K.
- `TauCeti.AdelicPoints.finiteProj` (other): For a finite place v, the continuous map X(𝔸_K) → X(K_v) given by postcomposition with the v-th projection of the finite adeles.
- `TauCeti.AdelicPoints.infiniteProj` (other): For an infinite place w, the continuous map X(𝔸_K) → X(K_w) given by postcomposition with the w-th projection of the infinite adeles.
- `TauCeti.AdelicPoints.ext` (extensionality): Two adelic points agree iff all their local projections agree.
- `TauCeti.AdelicPoints.diagonal_injective` (other): The diagonal is injective (K → 𝔸_K is injective).
- `TauCeti.AdelicPoints.finiteProj_diagonal` (compatibility): The local projection of the diagonal image of x is x followed by K → K_v, and similarly at infinite places.
- `TauCeti.AdelicPoints.map` (functoriality): A K-algebra map A′ → A induces a continuous map X(𝔸_K) → X′(𝔸_K) compatible with the diagonal and the local projections.
- `TauCeti.AdelicPoints.t2Space` (other): X(𝔸_K) is Hausdorff.
- `TauCeti.AdelicPoints.locallyCompactSpace` (other): X(𝔸_K) is locally compact (needs compactness of every O_v, a recorded gap).

Unit tests:

- **TauCeti.AdelicPoints.tests.point** (degenerate): For A = K, X(𝔸_K) has exactly one element, the image of the unique K-point.
- **TauCeti.AdelicPoints.tests.affine_line** (computation): For A = K[X], evaluation at X is a homeomorphism X(𝔸_K) ≃ₜ 𝔸_K, and the diagonal is the inclusion K → 𝔸_K; it is not surjective.
- **TauCeti.AdelicPoints.tests.multiplicative_group** (compatibility): For A = K[X, Y]/(XY − 1), X(𝔸_K) is homeomorphic to the unit group 𝔸_Kˣ with Mathlib's topology on units (the idele topology).
- **TauCeti.AdelicPoints.tests.no_real_point** (non-example): For K = ℚ and A = ℚ[X]/(X² + 1), X(𝔸_ℚ) is empty, while X(ℚ₅) is not.

Checks:

- X(𝔸_K) is Hausdorff, and X(K) sits in it as a discrete closed subset (RP.2/rational-points-discrete).
- For K = ℚ and A = ℚ[X]/(X² + 1), X(𝔸_ℚ) is empty although X(ℚ_p) is nonempty for every p ≡ 1 mod 4, because X(ℝ) is empty.

Consumers:

- HeightsRationalPointsAndObstructions:RP.2/brauer-manin-pairing: The pairing is a function on X(𝔸_K), and the Brauer–Manin set is a subset of it.
- HeightsRationalPointsAndObstructions:RP.3: Descent sets are subsets of X(𝔸_K) cut out by torsors.
- Poonen §8.1 (F-obstructions): Every obstruction set is a subset of X(𝔸_K) containing the diagonal image of X(K).

Direct prerequisites:

- [The topology on points with values in a topological algebra](#RP2-points-topology) (`HeightsRationalPointsAndObstructions:RP.2/points-topology`)
- [Presentations compute the points topology](#RP2-points-topology-presentation) (`HeightsRationalPointsAndObstructions:RP.2/points-topology-presentation`)
- `mathlib:NumberField.AdeleRing`
- `mathlib:IsDedekindDomain.FiniteAdeleRing`
- `mathlib:NumberField.InfiniteAdeleRing`
- `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletion`
- `mathlib:NumberField.InfinitePlace.Completion`
- `mathlib:RestrictedProduct.evalRingHom`
- `tauceti:NumberField.AdeleRing.instT2Space`
- `mathlib:NumberField.InfiniteAdeleRing.locallyCompactSpace`
- `mathlib:RestrictedProduct.locallyCompactSpace_of_group`
- `mathlib:Algebra.FiniteType`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §2.6.3, p. 49. Adelic points as the A-points of X for the adele ring A of the global field k.
- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §2, Example 2.3, p. 3. The diagonal and its discreteness (proved in RP.2/rational-points-discrete).

Outstanding proof or supplier contracts: Compactness of the integers of a nonarchimedean completion of a number field.

<a id="RP2-integral-model"></a>
### Integral models and their integral local points

*Definition · node `HeightsRationalPointsAndObstructions:RP.2/integral-model` · declaration `TauCeti.AdelicPoints.IntegralModel` · module `TauCeti/AlgebraicGeometry/AdelicPoints/RestrictedProduct`*

Let K be a number field and A a finitely generated commutative K-algebra. An integral model of A is a finitely generated 𝓞_K-subalgebra A₀ ⊆ A such that K·A₀ = A (equivalently, the K-subalgebra generated by A₀ is A; then A₀ ⊗_{𝓞_K} K ≅ A). For a finite place v, its integral points at v are X₀(O_v) := {x ∈ X(K_v) : x(A₀) ⊆ O_v}, where O_v = v.adicCompletionIntegers K; for an infinite place w, X₀(O_w) := X(K_w). Lean: `TauCeti.AdelicPoints.IntegralModel K A` (a structure holding A₀, finite generation and the spanning condition) with `IntegralModel.integralPoints`.

Hypotheses and conventions:

- K a number field; A a finitely generated commutative K-algebra; A₀ a finitely generated 𝓞_K-subalgebra with K·A₀ = A. Models over rings of S-integers are the localisations A₀[1/N]; since the restricted product only sees almost all places, 𝓞_K-models suffice.

Construction or proof:

1. A₀ is torsion free over 𝓞_K (a subring of the K-vector space A), so A₀ ⊗_{𝓞_K} K is the localisation of A₀ at 𝓞_K ∖ {0}, which is K·A₀ = A.
2. A K-algebra map x : A → K_v is determined by its restriction to A₀, and x ∈ X₀(O_v) iff that restriction lands in O_v; so X₀(O_v) is identified with the 𝓞_K-algebra maps A₀ → O_v.
3. If a₁, …, a_n generate A₀ over 𝓞_K, then X₀(O_v) = {x : x(aᵢ) ∈ O_v for all i}, because O_v is a subring containing the image of 𝓞_K.
4. For an arbitrary affine finite-type scheme, prove compactness of integral points through a finite presentation as a closed locus in O_v^n. RestrictedProduct.locallyCompactSpace_of_group supplies the ambient adelic group only; X(K_v) is generally not a group.

Planning API:

- `TauCeti.AdelicPoints.IntegralModel.integralPoints` (constructor): The set X₀(O_v) ⊆ X(K_v) of points integral on A₀, for a finite place v.
- `TauCeti.AdelicPoints.IntegralModel.mem_integralPoints_iff` (characterisation): x ∈ X₀(O_v) iff x(aᵢ) ∈ O_v for a chosen finite family of 𝓞_K-algebra generators aᵢ of A₀.
- `TauCeti.AdelicPoints.IntegralModel.isOpen_integralPoints` (other): X₀(O_v) is open in X(K_v).
- `TauCeti.AdelicPoints.IntegralModel.isCompact_integralPoints` (other): X₀(O_v) is compact, given compactness of O_v (recorded gap): it is closed in the compact set of points with all generator values in O_v.
- `TauCeti.AdelicPoints.IntegralModel.ofGenerators` (constructor): The 𝓞_K-subalgebra generated by any finite family of K-algebra generators of A is an integral model.

Unit tests:

- **TauCeti.AdelicPoints.IntegralModel.tests.affine_line** (computation): For K = ℚ, A = ℚ[X], A₀ = ℤ[X], X₀(ℤ_p) corresponds to ℤ_p ⊆ ℚ_p under evaluation at X.
- **TauCeti.AdelicPoints.IntegralModel.tests.base** (degenerate): For A = K and A₀ = 𝓞_K, X₀(O_v) = X(K_v) is the single point at every v.
- **TauCeti.AdelicPoints.IntegralModel.tests.rescaled** (non-example): For A = ℚ[X], the models ℤ[X] and ℤ[X/2] have different integral points at 2 (ℤ₂ versus 2ℤ₂), so the integral points depend on the model at finitely many places.
- **TauCeti.AdelicPoints.IntegralModel.tests.no_integral_point** (computation): For A = ℚ[X]/(3X − 1) and A₀ = ℤ[X]/(3X − 1) ≅ ℤ[1/3], the unique point 1/3 lies in X(ℚ₃) but X₀(ℤ₃) is empty, while X₀(ℤ_p) = X(ℚ_p) for every p ≠ 3.

Checks:

- For A = ℚ[X] and A₀ = ℤ[X], X₀(ℤ_p) is ℤ_p inside ℚ_p.
- Different models may differ at finitely many places: for A = ℚ[X], A₀ = ℤ[X] and A₀′ = ℤ[X/2] have X₀(ℤ₂) = ℤ₂ ≠ 2ℤ₂ = X₀′(ℤ₂), and agree at every odd p (RP.2/integral-model-exists-unique).

Consumers:

- HeightsRationalPointsAndObstructions:RP.2/adelic-points-restricted-product: The restricted product is taken with respect to the integral points of a model.
- HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation-finite-support: Azumaya algebras are spread out over the model, and integral local points give trivial evaluations.

Direct prerequisites:

- [Adelic points of an affine variety](#RP2-adelic-points) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points`)
- `mathlib:Algebra.adjoin`
- `mathlib:Algebra.FiniteType`
- `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §2.6.3, p. 49. An integral model: a finite-type model over a ring of S-integers whose generic fibre is X.
- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Exercise 3.4(b), p. 95. The integral points at v as a subset of the K_v-points.

Outstanding proof or supplier contracts: Compactness of the integers of a nonarchimedean completion of a number field.

<a id="RP2-integral-model-exists-unique"></a>
### Integral models exist and agree at almost all places

*Lemma · node `HeightsRationalPointsAndObstructions:RP.2/integral-model-exists-unique` · declaration `TauCeti.AdelicPoints.IntegralModel.eventually_integralPoints_eq` · module `TauCeti/AlgebraicGeometry/AdelicPoints/RestrictedProduct`*

Let K be a number field and A a finitely generated commutative K-algebra. (a) The 𝓞_K-subalgebra generated by any finite family of K-algebra generators of A is an integral model (RP.2/integral-model). (b) For two integral models A₀, A₀′ there is a nonzero N ∈ 𝓞_K with A₀[1/N] = A₀′[1/N] inside A; consequently X₀(O_v) = X₀′(O_v) for every finite place v not dividing N, i.e. for all but finitely many v.

Hypotheses and conventions:

- A finitely generated over K; A₀, A₀′ finitely generated 𝓞_K-subalgebras spanning A over K.

Construction or proof:

1. (a) The subalgebra generated by K-algebra generators a₁, …, a_n is finitely generated over 𝓞_K, and its K-span contains the aᵢ and is a K-subalgebra, hence is A.
2. (b) Each of the finitely many generators of A₀′ lies in A = K·A₀, so it is a/m with a ∈ A₀ and m ∈ 𝓞_K ∖ {0}; let N₁ be the product of these denominators, so A₀′ ⊆ A₀[1/N₁]. Symmetrically A₀ ⊆ A₀′[1/N₂]. With N = N₁N₂, A₀[1/N] = A₀′[1/N].
3. If v does not divide N, N is a unit of O_v, so a K-algebra map x : A → K_v with x(A₀) ⊆ O_v also sends A₀[1/N], hence A₀′, into O_v, and conversely.
4. Only finitely many height-one primes contain N ≠ 0 (a nonzero element of a Dedekind domain lies in finitely many maximal ideals).

Checks:

- The models ℤ[X] and ℤ[X/2] of ℚ[X] satisfy (b) with N = 2.

Direct prerequisites:

- [Integral models and their integral local points](#RP2-integral-model) (`HeightsRationalPointsAndObstructions:RP.2/integral-model`)
- `mathlib:IsLocalization.Away`
- `mathlib:IsDedekindDomain.HeightOneSpectrum`

Sources:

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §3, Theorem 3.4(3), p. 5. Uniqueness of spreading out, specialised to affine models over the rings 𝓞_K[1/N] whose limit is K.
- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §3, p. 6. The denominator-chasing argument in the affine case.

<a id="RP2-adelic-points-restricted-product"></a>
### Adelic points as a restricted product

*Theorem · node `HeightsRationalPointsAndObstructions:RP.2/adelic-points-restricted-product` · declaration `TauCeti.AdelicPoints.restrictedProductHomeomorph` · module `TauCeti/AlgebraicGeometry/AdelicPoints/RestrictedProduct`*

Let K be a number field, A a finitely generated commutative K-algebra and A₀ an integral model (RP.2/integral-model). Then the local projections give a homeomorphism X(𝔸_K) ≃ₜ (∏_{w infinite} X(K_w)) × Πʳ_{v finite} [X(K_v), X₀(O_v)], where the second factor is Mathlib's restricted product of the X(K_v) with respect to the subsets X₀(O_v) (RestrictedProduct, with its restricted-product topology). In particular an element of X(𝔸_K) is exactly a family (x_v) of local points with x_v ∈ X₀(O_v) for all but finitely many finite v, and the restricted product does not depend on the model (RP.2/integral-model-exists-unique).

Hypotheses and conventions:

- K a number field; A finitely generated; A₀ an integral model. The infinite places are finitely many, so their factor is an ordinary product.

Construction or proof:

1. Product decomposition: RP.2/adelic-points reduces the statement to the finite adeles 𝔸_K^f = Πʳ_v [K_v, O_v].
2. Bijection: let a₁, …, a_n generate A₀ over 𝓞_K (they then generate A over K). For a K-algebra map φ : A → 𝔸_K^f, each φ(aᵢ) is a finite adele, so it lies in O_v for all v outside a finite set Tᵢ (RestrictedProduct.eventually); for v outside T = ⋃ Tᵢ the v-component x_v of φ sends every aᵢ, hence A₀, into O_v. Conversely a family (x_v) with x_v(A₀) ⊆ O_v for almost all v defines a family of adeles (x_v(a))_v for each a ∈ A (a = b/m with b ∈ A₀, and m is a unit at almost all v), and a K-algebra map into the restricted product, because ring operations in the restricted product are componentwise.
3. Topology: by RP.2/points-topology-presentation both sides embed as the zero set of the same ideal, the left side in (𝔸_K^f)ⁿ and the right side in Πʳ_v [K_vⁿ, O_vⁿ], through the values at a₁, …, a_n; and (𝔸_K^f)ⁿ = Πʳ_v [K_vⁿ, O_vⁿ] as topological rings (a finite product of restricted products is the restricted product of the products; open O_v). Under this identification the two embeddings agree, so the bijection is a homeomorphism.
4. Openness of the X₀(O_v): they are cut out by the open conditions x(aᵢ) ∈ O_v (RP.2/integral-model), which is what makes the restricted-product topology the right one (RestrictedProduct.isOpen_forall_mem).
5. Model independence: two models have the same integral points at almost all v, and a restricted product only depends on the subsets at almost all indices.

Planning API:

- `TauCeti.AdelicPoints.restrictedProductHomeomorph` (characterisation): X(𝔸_K) ≃ₜ (Π w, X(K_w)) × Πʳ v, [X(K_v), X₀(O_v)] for an integral model A₀, given by the local projections.
- `TauCeti.AdelicPoints.eventually_mem_integralPoints` (other): For every adelic point x and every integral model, finiteProj v x ∈ X₀(O_v) for all but finitely many v.
- `TauCeti.AdelicPoints.mk_of_eventually` (constructor): A family of local points, integral on A₀ at almost all finite places, defines an adelic point with these projections.

Checks:

- For A = K[X], the theorem is Mathlib's definition of the finite adele ring as Πʳ_v [K_v, O_v] (with the model 𝓞_K[X]).
- For A = K[X, Y]/(XY − 1) with model 𝓞_K[X, Y]/(XY − 1), it describes the idele group as the restricted product of the K_vˣ with respect to the O_vˣ, as groups and topologically; this agrees with Mathlib's unitsEquiv as groups.

Direct prerequisites:

- [Adelic points of an affine variety](#RP2-adelic-points) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points`)
- [Integral models and their integral local points](#RP2-integral-model) (`HeightsRationalPointsAndObstructions:RP.2/integral-model`)
- [Integral models exist and agree at almost all places](#RP2-integral-model-exists-unique) (`HeightsRationalPointsAndObstructions:RP.2/integral-model-exists-unique`)
- [Presentations compute the points topology](#RP2-points-topology-presentation) (`HeightsRationalPointsAndObstructions:RP.2/points-topology-presentation`)
- `mathlib:RestrictedProduct`
- `mathlib:RestrictedProduct.topologicalSpace`
- `mathlib:RestrictedProduct.eventually`
- `mathlib:RestrictedProduct.isOpen_forall_mem`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §2.6.3, p. 50. Poonen's description of X(𝔸) as the restricted product, and its topology.
- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), Exercise 3.4(c), p. 95. The bijection with the restricted product of local points.
- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §3, Theorem 3.6, p. 6. Conrad's theorem: the S-integral adelic points are the product of local points, homeomorphically in the affine case; passing to the limit over S gives the restricted product.

<a id="RP2-adelic-points-nonempty-iff"></a>
### Adelic points exist iff local points exist and are integral almost everywhere

*Lemma · node `HeightsRationalPointsAndObstructions:RP.2/adelic-points-nonempty-iff` · declaration `TauCeti.AdelicPoints.nonempty_iff` · module `TauCeti/AlgebraicGeometry/AdelicPoints/RestrictedProduct`*

Let K be a number field, A a finitely generated commutative K-algebra and A₀ an integral model. Then X(𝔸_K) is nonempty iff X(K_w) is nonempty for every infinite place w, X(K_v) is nonempty for every finite place v, and X₀(O_v) is nonempty for all but finitely many finite v. In particular X(K) ≠ ∅ implies X(𝔸_K) ≠ ∅ (through the diagonal), and X(𝔸_K) = ∅ as soon as X has no point over a single completion.

Hypotheses and conventions:

- As in RP.2/adelic-points-restricted-product.

Construction or proof:

1. By RP.2/adelic-points-restricted-product, an adelic point is a family of local points integral at almost all v; such a family exists iff every local set is nonempty and the integral subsets are nonempty at almost all v (choose integral points there and arbitrary points at the finitely many remaining places).
2. The diagonal image of a K-point is an adelic point (RP.2/adelic-points).

Checks:

- For A = ℚ[X]/(X² + 1): X(ℝ) = ∅, so X(𝔸_ℚ) = ∅.
- Local points must exist at every place: for A = ℚ[X]/(X² − 2), X(ℚ_p) is empty for every p ≡ ±3 mod 8, so X(𝔸_ℚ) = ∅ although X(ℝ) ≠ ∅.
- The lemma says nothing about X(K): the Brauer–Manin set (RP.2/brauer-manin-pairing) refines this necessary condition.

Direct prerequisites:

- [Adelic points as a restricted product](#RP2-adelic-points-restricted-product) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points-restricted-product`)
- [Adelic points of an affine variety](#RP2-adelic-points) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.1.1, p. 228. Nonemptiness of X(𝔸) is the local condition that the obstructions refine.

<a id="RP2-rational-points-discrete"></a>
### Rational points are discrete and closed in adelic points

*Lemma · node `HeightsRationalPointsAndObstructions:RP.2/rational-points-discrete` · declaration `TauCeti.AdelicPoints.isClosed_range_diagonal` · module `TauCeti/AlgebraicGeometry/AdelicPoints/Basic`*

Let K be a number field and A a finitely generated commutative K-algebra. The diagonal ι : X(K) → X(𝔸_K) is injective, and its image is a discrete closed subset of X(𝔸_K).

Hypotheses and conventions:

- K a number field; A finitely generated.

Construction or proof:

1. Choose a presentation of A. By RP.2/points-topology-presentation, X(𝔸_K) embeds as a closed subset of 𝔸_Kⁿ, compatibly with the embedding X(K) ⊆ Kⁿ, and ι is the restriction of the diagonal Kⁿ → 𝔸_Kⁿ.
2. K is discrete and closed in 𝔸_K (Tau Ceti discreteTopology_principalSubgroup, isClosed_principalSubgroup), so Kⁿ is discrete and closed in 𝔸_Kⁿ, and its intersection with X(𝔸_K) is the image of ι (a tuple in Kⁿ satisfies the equations in 𝔸_K iff it satisfies them in K, since K → 𝔸_K is injective).
3. Discreteness also follows from RP.2/points-topology-base-change.

Checks:

- For A = K[X], the image of ι is the principal subgroup K ⊆ 𝔸_K.

Direct prerequisites:

- [Adelic points of an affine variety](#RP2-adelic-points) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points`)
- [Presentations compute the points topology](#RP2-points-topology-presentation) (`HeightsRationalPointsAndObstructions:RP.2/points-topology-presentation`)
- [Changing the value ring](#RP2-points-topology-base-change) (`HeightsRationalPointsAndObstructions:RP.2/points-topology-base-change`)
- `tauceti:TauCeti.GlobalNumberFields.discreteTopology_principalSubgroup`
- `tauceti:TauCeti.GlobalNumberFields.isClosed_principalSubgroup`
- `mathlib:NumberField.AdeleRing.principalSubgroup`

Sources:

- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §2, Example 2.3, p. 3. Discreteness of the rational points in the adelic points.

<a id="RP2-azumaya-base-change"></a>
### Base change of Azumaya algebras

*Lemma · node `HeightsRationalPointsAndObstructions:RP.2/azumaya-base-change` · declaration `TauCeti.IsAzumaya.baseChange` · module `TauCeti/Algebra/Azumaya/BaseChange`*

Let R be a commutative ring, 𝒜 an Azumaya R-algebra (Mathlib IsAzumaya R 𝒜: finitely generated, projective and faithful as an R-module, with R-algebra map 𝒜 ⊗_R 𝒜ᵐᵒᵖ → End_R(𝒜) bijective), and S a commutative R-algebra. Then S ⊗_R 𝒜 is an Azumaya S-algebra. Over a field L, 𝒜 is Azumaya iff 𝒜 is a nonzero finite-dimensional central simple L-algebra.

Hypotheses and conventions:

- R, S commutative; 𝒜 Azumaya over R. For the field statement, L is a field.

Construction or proof:

1. Module conditions: S ⊗_R 𝒜 is finitely generated and projective over S (base change of finite projective modules). Faithfulness: a finite projective faithful module has positive rank at every prime of R, and base change preserves positive rank at primes of S, so S ⊗_R 𝒜 is faithful.
2. The algebra map: S ⊗_R (𝒜 ⊗_R 𝒜ᵐᵒᵖ) ≅ (S ⊗_R 𝒜) ⊗_S (S ⊗_R 𝒜)ᵐᵒᵖ, and, since 𝒜 is finite projective, S ⊗_R End_R(𝒜) ≅ End_S(S ⊗_R 𝒜); under these isomorphisms the map for S ⊗_R 𝒜 is the base change of the bijective map for 𝒜.
3. Field case: over a field, Azumaya algebras are free, and Mathlib's instance Algebra.IsCentral.instIsAzumaya gives centrality. Simplicity: a two-sided ideal I of 𝒜 gives a two-sided ideal I ⊗ 𝒜ᵐᵒᵖ of 𝒜 ⊗ 𝒜ᵐᵒᵖ ≅ End_L(𝒜), which is simple, so I = 0 or I = 𝒜. Conversely a finite-dimensional central simple algebra is Azumaya (Tau Ceti IsSimpleRing.isAzumaya).
4. Consequently S ⊗_R 𝒜 over a field S = L is a central simple L-algebra; this is what makes Brauer evaluation (RP.2/brauer-evaluation) land in Mathlib's Brauer group of L.

Planning API:

- `TauCeti.IsAzumaya.baseChange` (functoriality): IsAzumaya R 𝒜 implies IsAzumaya S (S ⊗[R] 𝒜) for every commutative R-algebra S.
- `TauCeti.IsAzumaya.isSimpleRing_of_field` (other): An Azumaya algebra over a field is a simple ring.
- `TauCeti.IsAzumaya.iff_isCentral_isSimpleRing` (characterisation): Over a field L, IsAzumaya L 𝒜 iff 𝒜 is nonzero, finite-dimensional, central and simple.

Checks:

- The matrix algebra M_n(R) is Azumaya (IsAzumaya.matrix) and its base change is M_n(S).
- The Hamilton quaternions over ℤ[1/2] form an Azumaya algebra; their base change to ℝ is ℍ, central simple and not split.

Direct prerequisites:

- `mathlib:IsAzumaya`
- `mathlib:AlgHom.mulLeftRight`
- `mathlib:IsAzumaya.matrix`
- `mathlib:Algebra.IsCentral.instIsAzumaya`
- `mathlib:Algebra.IsCentral`
- `mathlib:IsSimpleRing`
- `tauceti:TauCeti.IsSimpleRing.isAzumaya`
- `mathlib:Module.Projective`
- `mathlib:Module.End`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.6.3, Definition 6.6.12(iv), p. 189. Azumaya algebras as locally free algebras with 𝒜 ⊗ 𝒜ᵒᵖ ≅ End(𝒜), the form Mathlib's IsAzumaya takes on affine schemes; stability under base change is built into the local characterisations of Definition 6.6.12.
- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.6.3, p. 189. Over a field, Azumaya algebras are the central simple algebras.

<a id="RP2-brauer-evaluation"></a>
### Evaluating an Azumaya algebra at a point

*Construction · node `HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation` · declaration `TauCeti.BrauerManin.eval` · module `TauCeti/NumberTheory/BrauerManin/Evaluation`*

Let K be a field, A a commutative K-algebra, 𝒜 an Azumaya A-algebra and L a field with a K-algebra structure. For x ∈ Points_K(A, L), the evaluation of 𝒜 at x is 𝒜(x) := [L ⊗_{A, x} 𝒜] ∈ Br(L), the Brauer class (Tau Ceti BrauerGroup.mk of CSA.of) of the central simple L-algebra obtained by base change along x (RP.2/azumaya-base-change). Properties: (a) naturality: for a field extension L → L′ compatible with the K-structures, 𝒜(x′) = baseChange_{L′/L}(𝒜(x)) for x′ the composite point (Tau Ceti BrauerGroup.baseChange); (b) multiplicativity: (𝒜 ⊗_A 𝒜′)(x) = 𝒜(x)·𝒜′(x), 𝒜ᵐᵒᵖ(x) = 𝒜(x)⁻¹, and End_A(P)(x) = 1 for a finite projective A-module P of positive rank; (c) pullback: for a K-algebra map g : A′ → A (so A is an A′-algebra) and an Azumaya A′-algebra 𝒜′, (A ⊗_{A′} 𝒜′)(x) = 𝒜′(x ∘ g); (d) constant algebras: for a central simple K-algebra D, (A ⊗_K D)(x) = baseChange_{L/K}[D]. Lean: `TauCeti.BrauerManin.eval 𝒜 x : BrauerGroup L`.

Hypotheses and conventions:

- K, L fields, L a K-algebra; A commutative; 𝒜 Azumaya over A. All types in one universe, as Tau Ceti's BrauerGroup group structure requires.

Construction or proof:

1. Well-defined: L ⊗_{A,x} 𝒜 is Azumaya over L by RP.2/azumaya-base-change, hence central simple and finite-dimensional, so CSA.of applies.
2. (a) L′ ⊗_L (L ⊗_{A,x} 𝒜) ≅ L′ ⊗_{A,x′} 𝒜 (associativity of base change), and Tau Ceti BrauerGroup.baseChange_mk computes the class of the left side.
3. (b) L ⊗_A (𝒜 ⊗_A 𝒜′) ≅ (L ⊗_A 𝒜) ⊗_L (L ⊗_A 𝒜′) and L ⊗_A 𝒜ᵐᵒᵖ ≅ (L ⊗_A 𝒜)ᵐᵒᵖ; Tau Ceti mk_tensorProduct and mk_op. L ⊗_A End_A(P) ≅ End_L(L ⊗_A P) with L ⊗_A P a nonzero finite-dimensional L-vector space; Tau Ceti mk_end.
4. (c), (d): associativity of base change, L ⊗_{A,x} (A ⊗_{A′} 𝒜′) ≅ L ⊗_{A′, x∘g} 𝒜′ and L ⊗_A (A ⊗_K D) ≅ L ⊗_K D.

Planning API:

- `TauCeti.BrauerManin.eval` (constructor): eval 𝒜 x := BrauerGroup.mk (CSA.of L (L ⊗[A] 𝒜)) with A → L given by x.
- `TauCeti.BrauerManin.eval_baseChange` (compatibility): eval 𝒜 (composite of x with L → L′) = BrauerGroup.baseChange L L′ (eval 𝒜 x).
- `TauCeti.BrauerManin.eval_tensor` (structure): eval (𝒜 ⊗[A] 𝒜′) x = eval 𝒜 x * eval 𝒜′ x.
- `TauCeti.BrauerManin.eval_op` (structure): eval 𝒜ᵐᵒᵖ x = (eval 𝒜 x)⁻¹.
- `TauCeti.BrauerManin.eval_end` (structure): eval (Module.End A P) x = 1 for P finite projective of positive rank; in particular eval A x = 1.
- `TauCeti.BrauerManin.eval_pullback` (functoriality): eval (A ⊗[A′] 𝒜′) x = eval 𝒜′ (x ∘ g) for g : A′ → A.
- `TauCeti.BrauerManin.eval_const` (compatibility): eval (A ⊗[K] D) x = BrauerGroup.baseChange K L (BrauerGroup.mk D) for a central simple K-algebra D.
- `TauCeti.BrauerManin.eval_congr` (extensionality): Isomorphic Azumaya A-algebras have equal evaluations.

Unit tests:

- **TauCeti.BrauerManin.tests.trivial** (degenerate): eval A x = 1 for the Azumaya algebra A itself and every point x.
- **TauCeti.BrauerManin.tests.matrix** (computation): eval (Matrix (Fin n) (Fin n) A) x = 1 for n ≥ 1.
- **TauCeti.BrauerManin.tests.hamilton_real** (computation): For K = ℚ, A = ℚ and 𝒜 the rational Hamilton quaternions, eval 𝒜 at the embedding ℚ → ℝ is the nontrivial element of Br(ℝ) (Tau Ceti Quaternion.brauerGroupMulEquiv sends it to the generator of ℤ/2).
- **TauCeti.BrauerManin.tests.depends_on_point** (non-example): For A = ℚ[t, 1/t] and 𝒜 = (−1, t)_A, the evaluations at the real points t = 1 and t = −1 differ (1 and the class of ℍ); evaluation is not constant on X(ℝ), which has two components.
- **TauCeti.BrauerManin.tests.alg_closed** (compatibility): If L is algebraically closed, eval 𝒜 x = 1 for every 𝒜 and x (Tau Ceti baseChange_eq_one_of_isAlgClosed applied through naturality, or directly since Br(L) is trivial).

Checks:

- The trivial algebra 𝒜 = A and matrix algebras evaluate to 1 at every point.
- Evaluation genuinely depends on the point: for K = ℚ, A = ℚ[t, 1/t] and the quaternion algebra 𝒜 = (−1, t)_A, 𝒜 evaluated at t = 1 in ℝ is split, and at t = −1 in ℝ it is the class of ℍ, the nontrivial element of Br(ℝ).

Consumers:

- HeightsRationalPointsAndObstructions:RP.2/brauer-manin-pairing: The pairing sums the local invariants of the evaluations at the local components.
- HeightsRationalPointsAndObstructions:RP.2/rational-points-in-brauer-manin-set: Naturality of evaluation turns the pairing at a rational point into the reciprocity sum of one global class.
- Poonen Proposition 8.2.9 (coverage): Local constancy is a property of x ↦ 𝒜(x) on X(K_v).

Direct prerequisites:

- [Base change of Azumaya algebras](#RP2-azumaya-base-change) (`HeightsRationalPointsAndObstructions:RP.2/azumaya-base-change`)
- [The topology on points with values in a topological algebra](#RP2-points-topology) (`HeightsRationalPointsAndObstructions:RP.2/points-topology`)
- `tauceti:TauCeti.BrauerGroup.mk`
- `tauceti:TauCeti.BrauerGroup.instCommGroup`
- `tauceti:TauCeti.CSA.of`
- `tauceti:TauCeti.BrauerGroup.baseChange`
- `tauceti:TauCeti.BrauerGroup.baseChange_mk`
- `tauceti:TauCeti.BrauerGroup.mk_tensorProduct`
- `tauceti:TauCeti.BrauerGroup.mk_op`
- `tauceti:TauCeti.BrauerGroup.mk_end`
- `tauceti:TauCeti.BrauerGroup.mk_matrix`
- `mathlib:BrauerGroup`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.1, p. 229. Evaluation of a Brauer class at an L-point by pullback; for Azumaya algebras the pullback is the base change along the point.
- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.6.3.1, Definition 6.6.14, p. 189. The group law on Azumaya classes that evaluation respects.

<a id="RP2-azumaya-spreading-out"></a>
### Spreading out an Azumaya algebra over an integral model

*Lemma · node `HeightsRationalPointsAndObstructions:RP.2/azumaya-spreading-out` · declaration `TauCeti.BrauerManin.exists_azumaya_model` · module `TauCeti/NumberTheory/BrauerManin/Evaluation`*

Let K be a number field, A a finitely generated commutative K-algebra with integral model A₀ (RP.2/integral-model), and 𝒜 an Azumaya A-algebra. Then there are a nonzero N ∈ 𝓞_K and an Azumaya A₀[1/N]-algebra 𝒜₀ with A ⊗_{A₀[1/N]} 𝒜₀ ≅ 𝒜 as A-algebras.

Hypotheses and conventions:

- A = A₀ ⊗_{𝓞_K} K is the filtered colimit of the rings A₀[1/N], N ∈ 𝓞_K ∖ {0}.

Construction or proof:

1. 𝒜 is finitely presented as an A-module (finite projective) and as an A-algebra; choose a finite presentation of the module and of the multiplication table. Its finitely many coefficients lie in A₀[1/N] for some N, giving an A₀[1/N]-algebra 𝒜₀ with A ⊗ 𝒜₀ ≅ 𝒜 (descent of finitely presented objects to a stage of a filtered colimit).
2. Projectivity: a finitely presented module whose base change to the colimit is projective is projective after enlarging N (a projective module is a direct summand of a free one; the splitting is a finite amount of data and descends).
3. Bijectivity of 𝒜₀ ⊗ 𝒜₀ᵐᵒᵖ → End(𝒜₀): a map of finite projective modules which becomes bijective over the colimit is bijective after enlarging N (its inverse and the two composite identities are finitely many equations). Faithfulness: positive rank at every prime holds after enlarging N, since the rank function is locally constant and positive on A.
4. This is the Azumaya form of Poonen's Corollary 6.6.11 (spreading out a Brauer class), which Poonen proves for cohomological Brauer classes through the limit theorem for étale cohomology.

Checks:

- A constant algebra A ⊗_K D with D central simple over K spreads out over A₀[1/N] as A₀[1/N] ⊗ D₀ for any 𝓞_K[1/N]-order D₀ of D which is Azumaya over 𝓞_K[1/N] (N divisible by the ramified primes of D).

Direct prerequisites:

- [Integral models and their integral local points](#RP2-integral-model) (`HeightsRationalPointsAndObstructions:RP.2/integral-model`)
- [Base change of Azumaya algebras](#RP2-azumaya-base-change) (`HeightsRationalPointsAndObstructions:RP.2/azumaya-base-change`)
- `mathlib:IsAzumaya`
- `mathlib:IsLocalization.Away`
- `mathlib:Module.Projective`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.6, Corollary 6.6.11, p. 189. Spreading out a Brauer class to an S-integral model.
- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §3, Theorem 3.4(1), p. 5. Descent of finitely presented objects to a finite stage of a filtered colimit.

<a id="RP2-azumaya-complete-dvr-split"></a>
### Azumaya algebras over the integers of a nonarchimedean local field are split

*Lemma · node `HeightsRationalPointsAndObstructions:RP.2/azumaya-complete-dvr-split` · declaration `TauCeti.BrauerManin.azumaya_split_of_adicCompletionIntegers` · module `TauCeti/NumberTheory/BrauerManin/Evaluation`*

Let K be a number field, v a finite place, O_v = v.adicCompletionIntegers K with residue field κ_v (finite), and 𝒜₀ an Azumaya O_v-algebra. Then 𝒜₀ ≅ End_{O_v}(P) for a free O_v-module P of positive finite rank. Consequently K_v ⊗_{O_v} 𝒜₀ is a matrix algebra and its Brauer class in Br(K_v) is trivial.

Hypotheses and conventions:

- O_v is a complete discrete valuation ring with finite residue field.

Construction or proof:

1. Residue algebra: κ_v ⊗ 𝒜₀ is Azumaya over the finite field κ_v (RP.2/azumaya-base-change), hence central simple, hence a matrix algebra M_n(κ_v), since Br(κ_v) is trivial (Tau Ceti subsingleton_brauerGroup_of_finite; Wedderburn).
2. Lifting an idempotent: 𝒜₀ is a finite free O_v-module, complete for the 𝔪_v-adic topology. A primitive idempotent ē of M_n(κ_v) of rank one lifts to an idempotent e ∈ 𝒜₀ (idempotents lift along the surjection 𝒜₀ → κ_v ⊗ 𝒜₀ with 𝔪-adically complete source: successive approximation e ↦ 3e² − 2e³).
3. P := 𝒜₀e is a direct summand of 𝒜₀, hence finite projective over the local ring O_v, hence free, of rank n since κ_v ⊗ P ≅ κ_v ⊗ 𝒜₀ ē ≅ κ_vⁿ. Left multiplication gives an O_v-algebra map 𝒜₀ → End_{O_v}(P) between free modules of rank n², which is an isomorphism modulo 𝔪_v (the matrix algebra acting on its column space), hence an isomorphism (Nakayama; a surjective endomorphism of a finite free module over a local ring with bijective reduction is bijective).
4. Base change to K_v gives End_{K_v}(K_v ⊗ P), whose class is 1 (Tau Ceti mk_end).
5. This is the Azumaya form of Poonen Corollary 6.9.3 (Br O_v = 0), which rests on Proposition 6.9.1 (Br of a complete local ring equals Br of its residue field), first proved for Azumaya algebras by Azumaya.

Checks:

- For the Hamilton quaternions over ℤ_p with p odd, the lemma gives an isomorphism with M₂(ℤ_p); over ℤ₂ the standard order is not Azumaya, consistent with ℍ being ramified at 2.

Direct prerequisites:

- [Base change of Azumaya algebras](#RP2-azumaya-base-change) (`HeightsRationalPointsAndObstructions:RP.2/azumaya-base-change`)
- `tauceti:TauCeti.subsingleton_brauerGroup_of_finite`
- `tauceti:TauCeti.BrauerGroup.mk_end`
- `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers`
- `mathlib:IsAdicComplete`
- `mathlib:Module.Free`
- `mathlib:IsAzumaya`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.9.1, Corollary 6.9.3, p. 199. Br O_v = 0.
- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.9.1, Proposition 6.9.1, p. 198. The residue isomorphism for complete local rings, whose Azumaya form the proof above supplies for O_v.

<a id="RP2-brauer-evaluation-finite-support"></a>
### Brauer evaluation is trivial at almost all places

*Theorem · node `HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation-finite-support` · declaration `TauCeti.BrauerManin.finite_eval_ne_one` · module `TauCeti/NumberTheory/BrauerManin/Evaluation`*

Let K be a number field, A a finitely generated commutative K-algebra, 𝒜 an Azumaya A-algebra and x ∈ X(𝔸_K) an adelic point (RP.2/adelic-points). Then 𝒜(x_v) = 1 in Br(K_v) for all but finitely many finite places v, where x_v is the local projection of x (RP.2/brauer-evaluation).

Hypotheses and conventions:

- K a number field; A finitely generated; 𝒜 Azumaya over A.

Construction or proof:

1. Choose an integral model A₀ (RP.2/integral-model-exists-unique (a)) and spread 𝒜 out to an Azumaya A₀[1/N]-algebra 𝒜₀ (RP.2/azumaya-spreading-out).
2. By RP.2/adelic-points-restricted-product, x_v ∈ X₀(O_v) for all but finitely many v; discard also the finitely many v dividing N. For the remaining v, x_v restricts to an 𝓞_K-algebra map A₀[1/N] → O_v (N is a unit in O_v).
3. Then K_v ⊗_{A, x_v} 𝒜 ≅ K_v ⊗_{O_v} (O_v ⊗_{A₀[1/N]} 𝒜₀), and O_v ⊗ 𝒜₀ is Azumaya over O_v (RP.2/azumaya-base-change), hence split (RP.2/azumaya-complete-dvr-split); so 𝒜(x_v) = 1.

Checks:

- For a constant algebra A ⊗_K D, the exceptional places are among the places where D ramifies, whatever the adelic point.
- The finite set depends on x: for A = ℚ[t, 1/t] and 𝒜 = (−1, t)_A, a point with t = p at the place p gives the local class of (−1, p) over ℚ_p, which is nontrivial for p ≡ 3 mod 4.

Direct prerequisites:

- [Evaluating an Azumaya algebra at a point](#RP2-brauer-evaluation) (`HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation`)
- [Spreading out an Azumaya algebra over an integral model](#RP2-azumaya-spreading-out) (`HeightsRationalPointsAndObstructions:RP.2/azumaya-spreading-out`)
- [Azumaya algebras over the integers of a nonarchimedean local field are split](#RP2-azumaya-complete-dvr-split) (`HeightsRationalPointsAndObstructions:RP.2/azumaya-complete-dvr-split`)
- [Adelic points as a restricted product](#RP2-adelic-points-restricted-product) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points-restricted-product`)
- [Integral models exist and agree at almost all places](#RP2-integral-model-exists-unique) (`HeightsRationalPointsAndObstructions:RP.2/integral-model-exists-unique`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.2, Proposition 8.2.1, p. 229. The statement; Poonen writes the Brauer group additively.
- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.2, proof of Proposition 8.2.1, p. 229. The spreading-out proof followed here.

<a id="RP2-brauer-manin-pairing"></a>
### The Brauer–Manin pairing and the Brauer–Manin set

*Construction · node `HeightsRationalPointsAndObstructions:RP.2/brauer-manin-pairing` · declaration `TauCeti.BrauerManin.pairing` · module `TauCeti/NumberTheory/BrauerManin/Pairing`*

Let K be a number field and A a finitely generated commutative K-algebra. For each place v let inv_v : Br(K_v) → ℚ/ℤ be the local invariant (finite places: the invariant map of local class field theory, requested from ClassFieldTheory Layer 5; real places: Br(ℝ) ≅ ½ℤ/ℤ; complex places: 0). For an Azumaya A-algebra 𝒜 and x ∈ X(𝔸_K), the Brauer–Manin pairing is ⟨𝒜, x⟩ := Σ_v inv_v(𝒜(x_v)) ∈ ℚ/ℤ, a finite sum by RP.2/brauer-evaluation-finite-support (only finitely many terms are nonzero, and there are finitely many infinite places). The Brauer–Manin set of 𝒜 is X(𝔸_K)^𝒜 := {x : ⟨𝒜, x⟩ = 0}, and X(𝔸_K)^Br := ⋂_𝒜 X(𝔸_K)^𝒜 over all Azumaya A-algebras. There is a Brauer–Manin obstruction to the local-global principle for X if X(𝔸_K) ≠ ∅ and X(𝔸_K)^Br = ∅. Lean: `TauCeti.BrauerManin.pairing`, `brauerSet`, `brauerManinSet`, with ℚ/ℤ as AddCircle (1 : ℚ).

Hypotheses and conventions:

- K a number field; A finitely generated; the local invariant maps are the requested ClassFieldTheory Layer 5 declarations (requests), used as given homomorphisms Br(K_v) → ℚ/ℤ. Br here is the Azumaya Brauer group of the affine scheme; the comparison with Poonen's cohomological Br X is recorded as a gap.

Construction or proof:

1. Finite support: RP.2/brauer-evaluation-finite-support at the finite places; the infinite places are finite in number.
2. The pairing is additive in 𝒜 (RP.2/brauer-evaluation (b) and additivity of each inv_v) and depends only on the Azumaya class; isomorphic algebras give the same sets.
3. X(𝔸_K)^𝒜 = X(𝔸_K) when 𝒜 is split (End_A(P)): every evaluation is 1.

Planning API:

- `TauCeti.BrauerManin.pairing` (constructor): pairing 𝒜 x = Σ_v inv_v (eval 𝒜 (x_v)) in AddCircle (1 : ℚ), a finite sum.
- `TauCeti.BrauerManin.pairing_tensor` (structure): pairing (𝒜 ⊗[A] 𝒜′) x = pairing 𝒜 x + pairing 𝒜′ x.
- `TauCeti.BrauerManin.pairing_end` (structure): pairing (Module.End A P) x = 0 for P finite projective of positive rank.
- `TauCeti.BrauerManin.brauerSet` (constructor): brauerSet 𝒜 = {x | pairing 𝒜 x = 0}.
- `TauCeti.BrauerManin.brauerManinSet` (constructor): The intersection of brauerSet 𝒜 over all Azumaya A-algebras 𝒜.
- `TauCeti.BrauerManin.HasObstruction` (other): The proposition X(𝔸_K) ≠ ∅ ∧ brauerManinSet = ∅.

Unit tests:

- **TauCeti.BrauerManin.tests.pairing_trivial** (degenerate): pairing A x = 0 for every adelic point x, so brauerSet A = X(𝔸_K).
- **TauCeti.BrauerManin.tests.pairing_matrix** (computation): pairing (Matrix (Fin 2) (Fin 2) A) x = 0.
- **TauCeti.BrauerManin.tests.empty** (degenerate): If X(𝔸_K) is empty (for instance A = ℚ[X]/(X² + 1)), then HasObstruction is false.
- **TauCeti.BrauerManin.tests.hamilton_constant** (computation): For K = ℚ, A = ℚ and 𝒜 the Hamilton quaternions, X(𝔸_ℚ) is one point and pairing 𝒜 at it is inv_∞(ℍ) + inv_2(ℍ ⊗ ℚ₂) = ½ + ½ = 0.
- **TauCeti.BrauerManin.tests.brauer_set_subset** (compatibility): brauerManinSet ⊆ brauerSet 𝒜 ⊆ X(𝔸_K) for every 𝒜.

Checks:

- The Brauer–Manin set of the trivial algebra is all of X(𝔸_K).
- If X(𝔸_K) = ∅ there is no Brauer–Manin obstruction in this sense: the definition requires adelic points.
- A nonempty Brauer–Manin set does not by itself give a rational point (Poonen §8.6); the set is only an upper bound for the closure of X(K).

Consumers:

- HeightsRationalPointsAndObstructions:RP.2/rational-points-in-brauer-manin-set: Rational points lie in the Brauer–Manin set.
- HeightsRationalPointsAndObstructions:RP.3: Comparison of the descent obstruction with the Brauer–Manin set.
- HeightsRationalPointsAndObstructions:RP.6: The obstruction interface of the classification register.

Direct prerequisites:

- [Evaluating an Azumaya algebra at a point](#RP2-brauer-evaluation) (`HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation`)
- [Brauer evaluation is trivial at almost all places](#RP2-brauer-evaluation-finite-support) (`HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation-finite-support`)
- [Adelic points of an affine variety](#RP2-adelic-points) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points`)
- `tauceti:TauCeti.Quaternion.brauerGroupMulEquiv`
- `mathlib:AddCircle`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.2, Definition 8.2.5, p. 230. The Brauer–Manin set of one class and of the whole Brauer group.
- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.3, Definition 8.2.7, p. 230. The obstruction to the local-global principle.

<a id="RP2-rational-points-in-brauer-manin-set"></a>
### Rational points lie in the Brauer–Manin set

*Theorem · node `HeightsRationalPointsAndObstructions:RP.2/rational-points-in-brauer-manin-set` · declaration `TauCeti.BrauerManin.diagonal_mem_brauerManinSet` · module `TauCeti/NumberTheory/BrauerManin/Pairing`*

Let K be a number field and A a finitely generated commutative K-algebra. For every K-point x ∈ X(K) and every Azumaya A-algebra 𝒜, ⟨𝒜, ι(x)⟩ = 0. Hence ι(X(K)) ⊆ X(𝔸_K)^Br, and a Brauer–Manin obstruction (X(𝔸_K) ≠ ∅, X(𝔸_K)^Br = ∅) implies X(K) = ∅.

Hypotheses and conventions:

- As in RP.2/brauer-manin-pairing; the reciprocity law Σ_v inv_v(res_v β) = 0 for β ∈ Br(K) is the requested ClassFieldTheory Layer 10 theorem (requests).

Construction or proof:

1. For x ∈ X(K), the local projections of ι(x) are x followed by K → K_v, so by naturality (RP.2/brauer-evaluation (a)) 𝒜(ι(x)_v) = res_v(𝒜(x)) with 𝒜(x) ∈ Br(K).
2. Hence ⟨𝒜, ι(x)⟩ = Σ_v inv_v(res_v(𝒜(x))), which vanishes by the reciprocity law of the Albert–Brauer–Hasse–Noether sequence 0 → Br K → ⊕_v Br K_v → ℚ/ℤ → 0.
3. The inclusion in X(𝔸_K)^Br follows for all 𝒜 at once, and the obstruction statement is its contrapositive.

Checks:

- For the constant algebra A ⊗ D of a central simple K-algebra D, the pairing vanishes on every adelic point whose local components come from K-points, and more generally ⟨A ⊗ D, x⟩ = Σ_v inv_v(D_v) = 0 for every adelic point (constant algebras give no obstruction).

Direct prerequisites:

- [The Brauer–Manin pairing and the Brauer–Manin set](#RP2-brauer-manin-pairing) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-pairing`)
- [Evaluating an Azumaya algebra at a point](#RP2-brauer-evaluation) (`HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation`)
- [Adelic points of an affine variety](#RP2-adelic-points) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.2, Proposition 8.2.2, p. 230. The statement.
- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.2, Corollary 8.2.6, p. 230. The inclusion of rational points in the Brauer–Manin set.

<a id="RP2-adelic-points-general"></a>
### Adelic points of separated schemes of finite type

*Construction · node `HeightsRationalPointsAndObstructions:RP.2/adelic-points-general` · module `TauCeti/NumberTheory/AdelicPoints/Basic`*

For a separated finite-type K-scheme X over a number field, choose a model 𝒳 over O_{K,S}. Define X(𝔸_K) as the union over finite T⊇S of Π_{v∈T}X(K_v)×Π_{v∉T}𝒳(O_v), equipped with the direct-limit topology. The topology is independent of the model and recovers the affine restricted product. Rational points map diagonally and morphisms induce continuous maps. For proper X the model is proper outside a finite set, and the adelic space is the product of all local spaces. A finite affine cover of X does not in general cover its adelic points: different places may require different charts. A global open immersion induces a continuous injection, generally not a topological embedding.

Hypotheses and conventions:

- X separated of finite type over a number field K; places include the archimedean ones.

Construction or proof:

1. Conrad §3 gives the integral-model direct-limit construction and its model independence; compare with the affine case using finite presentation.
2. Extend each morphism to models after enlarging S. On every finite T-stage the induced map is continuous, hence continuous for the direct-limit topology.
3. For proper X, the valuative criterion identifies integral and local points outside S. Conrad §4, pp.9–10, shows why global affine-chart gluing and global open-immersion embeddings are invalid.

Planning API:

- `TauCeti.adelicPoints` (constructor): X(𝔸_K) with its topology, for X separated of finite type.
- `TauCeti.adelicPoints.diagonal` (projection): X(K) → X(𝔸_K).
- `TauCeti.adelicPoints.proj` (projection): X(𝔸_K) → X(K_v), continuous, for each place v.
- `TauCeti.adelicPoints.map` (functoriality): A morphism f : X → Y induces a continuous map X(𝔸) → Y(𝔸), with map_id and map_comp.
- `TauCeti.adelicPoints.homeomorph_pi_of_proper` (equivalence): For X proper, X(𝔸_K) ≃ₜ Π_v X(K_v).
- `TauCeti.adelicPoints.continuous_injective_of_open` (other): An open immersion induces a continuous injective map; an open-embedding assertion is available for each local point space, not generally for global adelic points.
- `TauCeti.adelicPoints.isClosedEmbedding_of_closed` (other): A closed immersion induces a closed embedding.

Unit tests:

- **adelicPoints.test_projectiveLine** (computation): ℙ¹(𝔸_ℚ) ≃ₜ Π_v ℙ¹(ℚ_v).
- **adelicPoints.test_point** (degenerate): For X = Spec K, X(𝔸_K) is a single point.
- **adelicPoints.test_affine_line** (compatibility): 𝔸¹(𝔸_K) ≃ₜ 𝔸_K, Mathlib's adele ring NumberField.AdeleRing K.
- **adelicPoints.test_gm_not_product** (non-example): 𝔾_m(𝔸_ℚ) is the idele group, not the product Π_v ℚ_v^× (which is not locally compact).
- **adelicPoints.test_idele_inclusion** (non-example): The inclusion 𝔾_m(𝔸_ℚ)→𝔸¹(𝔸_ℚ) is continuous injective but is not a topological embedding. Adelic projective-line points can use different affine charts at different places, so neither of its two standard affine adelic charts need contain an arbitrary adelic point.

Checks:

- For X = ℙ¹, X(𝔸_ℚ) = Π_v ℙ¹(ℚ_v), compact.
- For X = 𝔾_m = Spec ℚ[t, 1/t], X(𝔸_ℚ) is the idele group with its idelic topology.

Consumers:

- Harpaz–Wittenberg 2020 §1.1 (PAPER-HARPAZ-WITTENBERG-20/18): adelic points and weak approximation for proper varieties
- RP.3/descent-set: torsor descent sets are subsets of X(𝔸_K)
- AdelicAlgebraicGroups:AA.1: G(𝔸) for a linear algebraic group is an instance

Direct prerequisites:

- [Adelic points of an affine variety](#RP2-adelic-points) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points`)
- [Adelic points as a restricted product](#RP2-adelic-points-restricted-product) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points-restricted-product`)
- [Integral models exist and agree at almost all places](#RP2-integral-model-exists-unique) (`HeightsRationalPointsAndObstructions:RP.2/integral-model-exists-unique`)
- [The topology on points with values in a topological algebra](#RP2-points-topology) (`HeightsRationalPointsAndObstructions:RP.2/points-topology`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §2.6.3, pp. 49–50, and Exercise 3.4, p. 95. Adelic points of a variety over a global field as a restricted product of local points with respect to integral models; for proper X the product of local points.
- [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf), §3, Proposition 3.1, Theorem 3.6 and its proof, pp. 5–8. Weil's adelic topology for separated finite-type schemes by gluing, and its agreement with the restricted-product description.

<a id="RP2-scheme-brauer-evaluation"></a>
### Evaluation of scheme Brauer classes at points

*Construction · node `HeightsRationalPointsAndObstructions:RP.2/scheme-brauer-evaluation` · module `TauCeti/NumberTheory/AdelicPoints/BrauerEvaluation`*

Let X be a scheme and α ∈ Br_Az(X) (SchemeAndStackFoundations key/scheme-brauer). For a field L and x ∈ X(L) put α(x) = x*α ∈ Br_Az(Spec L), identified with Mathlib's Brauer group of central simple L-algebras (Tau Ceti TauCeti.BrauerGroup). α(x) is a group homomorphism in α, natural in L, compatible with pullback along morphisms of schemes, and on affine X = Spec R it agrees with the evaluation of brauer-evaluation for Azumaya R-algebras. For x ∈ X(K_v) over a local field it lands in Br(K_v).

Hypotheses and conventions:

- X any scheme; L a field.

Construction or proof:

1. Pullback of Azumaya algebras along x : Spec L → X (SF.2/pullback); over a field Azumaya algebras are central simple algebras (azumaya-base-change; SF.2 field comparison).

Planning API:

- `TauCeti.SchemeBrauer.eval` (constructor): α(x) ∈ TauCeti.BrauerGroup L for x : Spec L ⟶ X.
- `TauCeti.SchemeBrauer.eval_mul` (simp): (αβ)(x) = α(x)β(x).
- `TauCeti.SchemeBrauer.eval_pullback` (functoriality): (f*α)(x) = α(f∘x).
- `TauCeti.SchemeBrauer.eval_baseChange` (functoriality): For L → L', α(x_{L'}) = baseChange α(x).
- `TauCeti.SchemeBrauer.eval_affine` (compatibility): On Spec R it agrees with brauer-evaluation.
- `TauCeti.SchemeBrauer.eval_constant` (simp): For α = π*β with β ∈ Br(K), α(x) = β restricted to L.

Unit tests:

- **SchemeBrauer.eval.test_trivial** (degenerate): The class of O_X evaluates to 1 everywhere.
- **SchemeBrauer.eval.test_quaternion** (computation): On U : y² + z² = (3 − x²)(x² − 2) over ℚ, the class (3 − x², −1) evaluates to the nontrivial element of Br(ℚ₂) at every 2-adic point and to 0 at every real point (Poonen Proposition 8.2.15).
- **SchemeBrauer.eval.test_field** (compatibility): For X = Spec K, eval is the identity of Mathlib's Brauer group.
- **SchemeBrauer.eval.test_not_constant** (non-example): Evaluation of a nonconstant class need not be constant on X(K_v): on 𝔾_m over ℚ the class (t, −1) is nontrivial at t = −1 ∈ ℝ^× and trivial at t = 1.

Checks:

- For X = Spec K and α constant, α(x) = α for the unique point.

Consumers:

- Poonen §8.2: the Brauer–Manin pairing sums local invariants of α(x_v)
- Harpaz–Wittenberg 2020 §2 (PAPER-HARPAZ-WITTENBERG-20/19): evaluation of unramified classes on local points

Direct prerequisites:

- `SchemeAndStackFoundations:key/scheme-brauer`
- `SchemeAndStackFoundations:SF.2/pullback`
- [Evaluating an Azumaya algebra at a point](#RP2-brauer-evaluation) (`HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation`)
- [Base change of Azumaya algebras](#RP2-azumaya-base-change) (`HeightsRationalPointsAndObstructions:RP.2/azumaya-base-change`)
- `tauceti:TauCeti.BrauerGroup.baseChange`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.1, definition of evaluation before Proposition 8.2.1, p. 229. A Brauer class of X and a point over a field extension give a Brauer class of the field by pullback.

<a id="RP2-brauer-local-constancy"></a>
### Local constancy of Brauer evaluation

*Theorem · node `HeightsRationalPointsAndObstructions:RP.2/brauer-local-constancy` · declaration `TauCeti.SchemeBrauer.eval_locallyConstant` · module `TauCeti/NumberTheory/BrauerManin/Obstruction`*

Let k be a local field and X a k-variety. For α ∈ Br X, the map X(k) → Br k, x ↦ α(x), is locally constant for the analytic topology on X(k). If k is nonarchimedean with ring of integers O, 𝒳 is a finite-type O-model and α extends to Br 𝒳, then x ↦ α(x) is constant on 𝒳(O) and equal to 0 when Br O = 0.

Hypotheses and conventions:

- k a local field; X of finite type over k.

Construction or proof:

1. Near x the class extends over the henselisation of the local ring at the point; Brauer classes of henselian local rings are determined by the residue field (SchemeAndStackFoundations SF.2/brauer-henselian-local), and nearby points factor through a common henselian neighbourhood (Poonen Proposition 8.2.9 and its proof).
2. For O-points of a model: the class extends over Spec O, and Br O = 0 for complete discrete valuation rings with finite residue field (azumaya-complete-dvr-split).

Checks:

- For the Brauer class (t,−1) on 𝔾_m,ℝ, the evaluation is constant on each sign component of ℝ× and the two values differ. The class is ramified at 0 and ∞, so it is not a class on ℙ¹_ℝ.

Direct prerequisites:

- [Evaluation of scheme Brauer classes at points](#RP2-scheme-brauer-evaluation) (`HeightsRationalPointsAndObstructions:RP.2/scheme-brauer-evaluation`)
- `SchemeAndStackFoundations:SF.2`
- [Azumaya algebras over the integers of a nonarchimedean local field are split](#RP2-azumaya-complete-dvr-split) (`HeightsRationalPointsAndObstructions:RP.2/azumaya-complete-dvr-split`)
- [Adelic points of separated schemes of finite type](#RP2-adelic-points-general) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points-general`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.3, Proposition 8.2.9 and proof, Remark 8.2.10, pp. 231–232. Evaluation of a Brauer class is locally constant on X(k_v) and constant on integral points of a model where the class extends.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP2-brauer-manin-general"></a>
### The Brauer–Manin pairing and set for varieties

*Construction · node `HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general` · module `TauCeti/NumberTheory/AdelicPoints/BrauerManin`*

For a variety X over a number field K, the Brauer–Manin pairing X(𝔸_K) × Br X → ℚ/ℤ, ((x_v), α) ↦ Σ_v inv_v α(x_v), is well defined (α(x_v) = 0 for almost all v), additive in α, continuous and locally constant in (x_v) for each fixed α. For a subgroup B ⊆ Br X, X(𝔸_K)^B is the set of adelic points orthogonal to B, and X(𝔸_K)^{Br} = X(𝔸_K)^{Br X}. Rational points are orthogonal to Br X: X(K) ⊆ X(𝔸_K)^{Br}. There is a Brauer–Manin obstruction to the local-global principle when X(𝔸_K) ≠ ∅ but X(𝔸_K)^{Br} = ∅. On affine X with Azumaya classes this is brauer-manin-pairing.

Hypotheses and conventions:

- K a number field; X separated of finite type over K; Br X is the Azumaya Brauer group of key/scheme-brauer.
- inv_v is the local invariant of ClassFieldTheory Layer 5 (inv_∞ ∈ ½ℤ/ℤ at real places, 0 at complex places).

Construction or proof:

1. Finite support: spread X and α out to O_{K,S}; for v ∉ S, x_v ∈ 𝒳(O_v) and α(x_v) ∈ Br O_v = 0 (Poonen Proposition 8.2.1; brauer-evaluation-finite-support for the affine case).
2. Orthogonality of rational points: α(x) ∈ Br K and Σ_v inv_v = 0 (ClassFieldTheory Layer 10; Poonen Proposition 8.2.2, Corollary 8.2.6).

Planning API:

- `TauCeti.brauerManinPairing` (constructor): X(𝔸_K) → Br X →+ ℚ/ℤ.
- `TauCeti.brauerManinSet` (constructor): X(𝔸_K)^B for B ⊆ Br X.
- `TauCeti.brauerManinPairing_diagonal` (relation): The pairing vanishes on the diagonal image of X(K).
- `TauCeti.brauerManinPairing_constant` (simp): Constant classes pair to 0 with every adelic point.
- `TauCeti.brauerManinSet_antitone` (structure): B ⊆ B' ⇒ X(𝔸)^{B'} ⊆ X(𝔸)^B.
- `TauCeti.brauerManinPairing_continuous` (other): For each fixed α∈Br X, the scalar-valued function x↦⟨x,α⟩ is locally constant and continuous. No assertion is made that the map into the entire discrete Hom(Br X,ℚ/ℤ) is locally constant when Br X is infinite.
- `TauCeti.brauerManinSet_affine` (compatibility): On affine X it is the set of brauer-manin-pairing.

Unit tests:

- **brauerManinSet.test_conic** (computation): For a smooth conic X over ℚ, X(𝔸)^{Br} = X(𝔸) (Br X = Br_0 X since X_ℚ̄ ≅ ℙ¹).
- **brauerManinSet.test_empty_B** (degenerate): X(𝔸)^{0} = X(𝔸).
- **brauerManinSet.test_affine** (compatibility): On affine X with Azumaya classes it agrees with brauer-manin-pairing.
- **brauerManinSet.test_nonempty_no_point** (non-example): X(𝔸)^{Br} ≠ ∅ does not imply X(K) ≠ ∅ (Skorobogatov's bielliptic surface, RP.3/insufficiency-examples).

Checks:

- For constant α = π*β, β ∈ Br K, the pairing is Σ_v inv_v β = 0 for every adelic point.

Consumers:

- Harpaz–Wittenberg 2023 and 2020; Bhargava–Gross–Wang 2017 Theorems 10–11: Brauer–Manin obstructions and Brauer–Manin sets
- RP.3/descent-brauer-comparison: X(𝔸)^{descent} ⊆ X(𝔸)^{Br}
- Browning–Le Boudec–Sawin 2023: the obstruction is vacuous for smooth complete intersections of dimension ≥ 3

Direct prerequisites:

- [Evaluation of scheme Brauer classes at points](#RP2-scheme-brauer-evaluation) (`HeightsRationalPointsAndObstructions:RP.2/scheme-brauer-evaluation`)
- [Adelic points of separated schemes of finite type](#RP2-adelic-points-general) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points-general`)
- [The Brauer–Manin pairing and the Brauer–Manin set](#RP2-brauer-manin-pairing) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-pairing`)
- [Brauer evaluation is trivial at almost all places](#RP2-brauer-evaluation-finite-support) (`HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation-finite-support`)
- [Rational points lie in the Brauer–Manin set](#RP2-rational-points-in-brauer-manin-set) (`HeightsRationalPointsAndObstructions:RP.2/rational-points-in-brauer-manin-set`)
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.1–8.2.2, Proposition 8.2.1, Proposition 8.2.2, Corollary 8.2.6, pp. 229–231. The pairing has finite support, rational points pair trivially, and X(k) ⊆ X(𝔸)^{Br}.

<a id="RP2-brauer-manin-set-closed"></a>
### Topology of Brauer–Manin sets

*Theorem · node `HeightsRationalPointsAndObstructions:RP.2/brauer-manin-set-closed` · declaration `TauCeti.isClosed_brauerManinSet` · module `TauCeti/NumberTheory/BrauerManin/Obstruction`*

For X a variety over a number field K and B ⊆ Br X: X(𝔸)^B is closed in X(𝔸); for B finite (or finitely generated) it is open and closed; the closure of X(K) in X(𝔸) lies in X(𝔸)^{Br}. Hence for X proper, if X(𝔸)^{Br} ≠ X(𝔸) then X does not satisfy weak approximation.

Hypotheses and conventions:

- K a number field.

Construction or proof:

1. Each α ↦ pairing is locally constant (brauer-local-constancy plus finite support), so X(𝔸)^{α} is open and closed; intersect over α ∈ B.
2. X(K) ⊆ X(𝔸)^{Br} and closedness give the closure statement (Poonen Corollary 8.2.11).
3. For a fixed α and an adelic point, spread α and choose an integral-model neighborhood on which all evaluations outside one finite S vanish uniformly. Pointwise finite support alone does not prove local constancy of the sum.

Checks:

- The Iskovskikh surface has X(𝔸) ≠ ∅ = X(𝔸)^{Br}, so X(ℚ) = ∅.

Direct prerequisites:

- [The Brauer–Manin pairing and set for varieties](#RP2-brauer-manin-general) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general`)
- [Local constancy of Brauer evaluation](#RP2-brauer-local-constancy) (`HeightsRationalPointsAndObstructions:RP.2/brauer-local-constancy`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.3, Corollary 8.2.11, p. 232. Brauer sets are closed, open and closed for finitely generated subgroups, and contain the closure of the rational points; consequences for weak approximation.

<a id="RP2-brauer-manin-functoriality"></a>
### Functoriality of Brauer–Manin sets

*Lemma · node `HeightsRationalPointsAndObstructions:RP.2/brauer-manin-functoriality` · declaration `TauCeti.brauerManinSet_map` · module `TauCeti/NumberTheory/BrauerManin/Obstruction`*

For a morphism π : X' → X of K-varieties and B ⊆ Br X, π(X'(𝔸)^{π*B}) ⊆ X(𝔸)^B; in particular π(X'(𝔸)^{Br}) ⊆ X(𝔸)^{Br}, so X ↦ X(𝔸)^{Br} is functorial, and if X(𝔸)^{Br} = ∅ then X'(𝔸)^{Br} = ∅ for every X' mapping to X.

Hypotheses and conventions:

- K a number field; π a morphism of finite-type separated K-schemes.

Construction or proof:

1. Naturality of evaluation: (π*α)(x') = α(π x') (scheme-brauer-evaluation), summed over places (Poonen Proposition 8.1.8 for the functor Br, Corollaries 8.1.9–8.1.10).

Checks:

- Any variety mapping to the Iskovskikh surface has empty Brauer–Manin set.

Direct prerequisites:

- [The Brauer–Manin pairing and set for varieties](#RP2-brauer-manin-general) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general`)
- [Evaluation of scheme Brauer classes at points](#RP2-scheme-brauer-evaluation) (`HeightsRationalPointsAndObstructions:RP.2/scheme-brauer-evaluation`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.1, Proposition 8.1.8, Corollaries 8.1.9 and 8.1.10, pp. 228–229. Obstruction sets from a functor F are functorial in X.

<a id="RP2-algebraic-brauer-group"></a>
### Constant and algebraic Brauer groups

*Definition · node `HeightsRationalPointsAndObstructions:RP.2/algebraic-brauer-group` · module `TauCeti/NumberTheory/AdelicPoints/AlgebraicBrauer`*

For a variety X over a field k with separable closure k^s: Br₀(X) = image of Br k → Br X (the image, which need not be injective); Br₁(X) = ker(Br X → Br X_{k^s}); Br₀ ⊆ Br₁. If X is smooth geometrically integral with k^s[X]^× = k^{s×}, the Hochschild–Serre spectral sequence gives an exact sequence Br k → Br₁ X → H¹(k, Pic X_{k^s}) → H³(k, 𝔾_m), so Br₁ X/Br₀ X ≅ H¹(k, Pic X_{k^s}) over number fields (H³(k, 𝔾_m) = 0). The Brauer–Manin pairing restricted to Br₀ is zero, so it factors through Br X/Br₀ X.

Hypotheses and conventions:

- X a k-variety; Br is the Azumaya Brauer group of key/scheme-brauer (equal to the cohomological one for smooth quasi-projective X).
- The Hochschild–Serre statement is naturally for the cohomological Brauer group. To identify it with the Azumaya group used here, assume the Gabber comparison hypotheses (in particular regular quasi-projective X over a field), or carry the comparison map explicitly.

Construction or proof:

1. Definitions are images and kernels of pullback maps (SF.2/pullback).
2. The exact sequence is SchemeAndStackFoundations SF.2/brauer-hochschild-serre-sequence; H³(k, 𝔾_m) = 0 for number fields is ClassFieldTheory Layer 10.

Planning API:

- `TauCeti.brauerZero` (constructor): Br₀(X) ≤ Br X, the image of Br k.
- `TauCeti.brauerOne` (constructor): Br₁(X) ≤ Br X, the kernel of base change to k^s.
- `TauCeti.brauerZero_le_brauerOne` (structure): Br₀ ≤ Br₁.
- `TauCeti.brauerOne_quotient_equiv` (equivalence): Over a number field with k^s[X]^× = k^{s×}, Br₁/Br₀ ≃ H¹(k, Pic X_{k^s}).
- `TauCeti.brauerManinPairing_brauerZero` (simp): The pairing vanishes on Br₀.
- `TauCeti.brauerZero_injective_of_point` (other): If X(k) ≠ ∅ then Br k → Br X is injective.

Unit tests:

- **brauerOne.test_projectiveSpace** (computation): For X = ℙⁿ_k, Br X = Br₀ X = Br₁ X ≅ Br k.
- **brauerOne.test_point** (degenerate): For X = Spec k, Br₀ = Br₁ = Br k.
- **brauerOne.test_conic_no_point** (non-example): For a pointless conic C over ℚ, Br ℚ → Br C has nonzero kernel (the class of the quaternion algebra of C); Br₀ C is a proper quotient of Br ℚ, not a copy of it.
- **brauerOne.test_transcendental** (non-example): Br₁ ≠ Br in general: transcendental classes (nonzero image in Br X_{k^s}) exist on some K3 surfaces, so testing Br₁ alone can miss an obstruction.

Checks:

- If X(k) ≠ ∅, Br k → Br X is injective (split by a point).

Consumers:

- Harpaz–Wittenberg 2023 Remark 4.5: B_ω is defined inside Br₁/Br₀
- RP.3/descent-brauer-comparison: Br₁ is the part of the obstruction detected by torsors under tori
- Bhargava–Gross–Wang 2017: the obstructions on J¹ and Sym^k C come from algebraic classes

Direct prerequisites:

- `SchemeAndStackFoundations:key/scheme-brauer`
- `SchemeAndStackFoundations:SF.2/pullback`
- `SchemeAndStackFoundations:SF.2`
- [The Brauer–Manin pairing and set for varieties](#RP2-brauer-manin-general) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general`)
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`

Sources:

- [Y. Harpaz, O. Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §1.1, p. 6. Br(X) = H²_ét(X, 𝔾_m), Br₁(X) = ker(Br X → Br X_k̄), Br₀(X) = image of Br k.
- [Y. Harpaz, O. Wittenberg, *The Massey vanishing conjecture for number fields*](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §2 p. 8; §3, display (3.1), pp. 8–9. The algebraic and constant subgroups and the Hochschild–Serre sequence; quotients use the actual image Br₀(V).
- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §6.7 (Hochschild–Serre spectral sequence), pp. 192–195. Spectral sequences computing Br₁.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP2-unramified-brauer-group"></a>
### The unramified Brauer group

*Definition · node `HeightsRationalPointsAndObstructions:RP.2/unramified-brauer-group` · module `TauCeti/NumberTheory/AdelicPoints/UnramifiedBrauer`*

For a smooth geometrically integral variety V over a field k of characteristic 0, Br_nr(V) is the image of Br(V^c) → Br(V) for a smooth proper compactification V ⊆ V^c; it does not depend on V^c and equals the subgroup of Br V of classes unramified at every discrete valuation of k(V) trivial on k. Br_{1,nr}(V) = Br_nr(V) ∩ Br₁(V). For V proper, Br_nr(V) = Br V.

Hypotheses and conventions:

- char k = 0 (resolution of singularities provides V^c; purity for the Brauer group gives the valuation description).
- The smooth-compactification proof is asserted here in characteristic zero. In positive characteristic, the all-valuations definition and appropriate purity statements require a separate proof and do not follow from resolution for curves.

Construction or proof:

1. Independence of V^c: two compactifications are dominated by a third and Br of smooth proper varieties is a birational invariant (purity; Česnavičius).
2. The valuative description: residues along divisors of V^c (SF.2 Brauer of regular schemes injects into Br k(V)).
3. Use the regular Brauer intersection theorem (Česnavičius Thm.1.2) for codimension-one points. Passing from a chosen model to all valuations and comparing arbitrary-dimensional compactifications requires its own purity/birational contract, recorded as unresolved.

Planning API:

- `TauCeti.unramifiedBrauer` (constructor): Br_nr(V) ≤ Br V.
- `TauCeti.unramifiedBrauer_eq_range` (characterisation): Br_nr(V) = range(Br V^c → Br V) for any smooth proper compactification.
- `TauCeti.unramifiedBrauer_eq_top_of_proper` (simp): V proper ⇒ Br_nr(V) = Br V.
- `TauCeti.unramifiedBrauer_birational` (functoriality): Br_nr is a birational invariant of smooth geometrically integral varieties.
- `TauCeti.unramifiedBrauer_residue` (characterisation): α ∈ Br_nr(V) iff all residues of α along divisorial valuations of k(V) vanish.

Unit tests:

- **unramifiedBrauer.test_gm** (computation): Br_nr(𝔾_{m,ℚ}) = Br ℚ while Br 𝔾_{m,ℚ} ∋ (t, −1) ∉ Br_nr.
- **unramifiedBrauer.test_proper** (degenerate): For V = ℙⁿ, Br_nr = Br.
- **unramifiedBrauer.test_two_compactifications** (compatibility): ℙ² and ℙ¹ × ℙ¹ compactifying 𝔸² give the same subgroup Br k.
- **unramifiedBrauer.test_not_algebraic** (non-example): Br_nr(V) need not equal Br_{1,nr}(V).

Checks:

- For V = 𝔾_m over ℚ, the class (t, −1) is ramified at t = 0 and t = ∞, so it is not in Br_nr(𝔾_m) = Br ℚ.

Consumers:

- Harpaz–Wittenberg 2023 §2: the unramified Brauer–Manin pairing on the full product of local points
- Harpaz–Wittenberg 2020 Theorem 2.1: f*^{-1}Br_nr(Y) for torus torsors

Direct prerequisites:

- `SchemeAndStackFoundations:key/scheme-brauer`
- `SchemeAndStackFoundations:SF.2`
- [Constant and algebraic Brauer groups](#RP2-algebraic-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/algebraic-brauer-group`)

Sources:

- [Y. Harpaz, O. Wittenberg, *The Massey vanishing conjecture for number fields*](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §2, pp. 6–7. Br_nr(V) as the image of Br of a smooth proper compactification, independent of the compactification and equal to the valuation-theoretic unramified subgroup.
- [Y. Harpaz, O. Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §1.1, p. 6. The unramified Brauer group of a smooth integral variety in characteristic 0.
- [K. Česnavičius, *Purity for the Brauer group*](https://arxiv.org/abs/1711.06456v4), Theorem 1.2 (arXiv:1711.06456). Purity for the Brauer group, the input for independence of the compactification.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts; Lefschetz, Brauer reciprocity and purity proof contracts.

<a id="RP2-unramified-pairing-full-product"></a>
### The unramified pairing on the full product of local points

*Theorem · node `HeightsRationalPointsAndObstructions:RP.2/unramified-pairing-full-product` · declaration `TauCeti.unramifiedPairing_finiteSupport` · module `TauCeti/NumberTheory/BrauerManin/Obstruction`*

For a smooth geometrically integral variety V over a number field K, the pairing Π_v V(K_v) × Br_nr(V) → ℚ/ℤ, ((x_v), α) ↦ Σ_v inv_v α(x_v), has finite support even on the full product (not only on V(𝔸_K)); it is additive in α, locally constant, and the diagonal image of V(K) is orthogonal to Br_nr(V).

Hypotheses and conventions:

- V smooth geometrically integral over a number field K.

Construction or proof:

1. Extend α to a smooth proper compactification V^c and spread out over O_{K,S}; for v ∉ S, x_v ∈ V(K_v) ⊆ V^c(K_v) = 𝒱^c(O_v) and α(x_v) ∈ Br O_v = 0 (properness replaces integrality).

Checks:

- Constant classes pair to 0 with every element of the product.

Direct prerequisites:

- [The unramified Brauer group](#RP2-unramified-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/unramified-brauer-group`)
- [The Brauer–Manin pairing and set for varieties](#RP2-brauer-manin-general) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general`)
- [Adelic points of separated schemes of finite type](#RP2-adelic-points-general) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points-general`)

Sources:

- [Y. Harpaz, O. Wittenberg, *The Massey vanishing conjecture for number fields*](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §2, pp. 6–7. Summing local invariants pairs Π_v V(k_v) with Br_nr(V); unramifiedness gives finite support on the full product.

<a id="RP2-b-omega"></a>
### Almost-everywhere locally trivial algebraic Brauer classes

*Definition · node `HeightsRationalPointsAndObstructions:RP.2/b-omega` · module `TauCeti/NumberTheory/AdelicPoints/AlgebraicBrauer`*

For a smooth geometrically integral variety V over a number field K, B_ω(V) ⊆ Br₁(V)/Br₀(V) is the subgroup of classes whose image in Br₁(V_{K_v})/Br₀(V_{K_v}) vanishes for all but finitely many places v. Under the Hochschild–Serre identification Br₁/Br₀ ≅ H¹(K, Pic V_{K̄}) these are the classes locally trivial at almost all places. At every place outside its finite exceptional set a class of B_ω evaluates constantly on V(K_v), so its pairing with V(𝔸_K) depends only on finitely many local components; classes trivial at every place (Ш¹(K, Pic V_{K̄})) pair constantly.

Hypotheses and conventions:

- K a number field; k^s[V]^× = k^{s×} for the H¹ description.

Construction or proof:

1. Localisation maps on Br₁/Br₀ and on H¹(K, Pic V̄) commute with Hochschild–Serre; a class whose localisation lies in Br₀(V_{K_v}) evaluates constantly on V(K_v).

Planning API:

- `TauCeti.brauerOmega` (constructor): B_ω(V) ≤ Br₁(V)/Br₀(V).
- `TauCeti.mem_brauerOmega_iff` (characterisation): α ∈ B_ω iff its localisation vanishes outside a finite set of places.
- `TauCeti.brauerOmega_equiv_sha` (equivalence): B_ω ≅ almost-everywhere locally trivial classes of H¹(K, Pic V̄).
- `TauCeti.brauerManinPairing_brauerOmega_const` (relation): For α ∈ B_ω there is a finite set T of places such that the pairing of α with (x_v) depends only on (x_v)_{v∈T}.

Unit tests:

- **brauerOmega.test_zero** (degenerate): 0 ∈ B_ω.
- **brauerOmega.test_finite_exceptions** (computation): A class nonzero locally at exactly one place lies in B_ω.
- **brauerOmega.test_sha_compat** (compatibility): B_ω contains the classes of Ш¹(K, Pic V̄) (trivial at every place).
- **brauerOmega.test_weaker** (non-example): Almost-everywhere local triviality is weaker than local triviality at every place: B_ω can be strictly larger than Ш¹(K, Pic V̄).

Checks:

- Constant classes (zero in Br₁/Br₀) lie in B_ω.

Consumers:

- Harpaz–Wittenberg 2023 §4: B_ω enters the comparison of Massey vanishing with Brauer–Manin conditions

Direct prerequisites:

- [Constant and algebraic Brauer groups](#RP2-algebraic-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/algebraic-brauer-group`)
- [The Brauer–Manin pairing and set for varieties](#RP2-brauer-manin-general) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general`)

Sources:

- [Y. Harpaz, O. Wittenberg, *The Massey vanishing conjecture for number fields*](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §4, Remark 4.5, p. 13. B_ω(V) as the classes of Br₁/Br₀ vanishing in Br(V_{k_v})/Br₀(V_{k_v}) for almost every place; identified with almost-everywhere locally trivial H¹(k, Pic V̄) classes.

<a id="RP2-zero-cycle-brauer-pairing"></a>
### The Brauer–Manin pairing on zero-cycles

*Construction · node `HeightsRationalPointsAndObstructions:RP.2/zero-cycle-brauer-pairing` · module `TauCeti/NumberTheory/AdelicPoints/ZeroCycles`*

For a smooth proper variety X over a number field K and a closed point P of X_{K_v}, put α(P) = cor_{K_v(P)/K_v}(α restricted to P) ∈ Br K_v. Extending linearly gives ⟨,⟩ : Z₀(X_{𝔸}) × Br X → ℚ/ℤ, (Σ_v z_v, α) ↦ Σ_v inv_v α(z_v), on families of local zero-cycles (z_v)_v; it vanishes on principal divisors, on norms from ℂ at archimedean places, and on the diagonal image of global zero-cycles. For a rational point it is the ordinary pairing.

Hypotheses and conventions:

- X smooth proper over a number field; zero-cycles of any degree.

Construction or proof:

1. Corestriction is compatible with local invariants (inv_v ∘ cor = inv_w; ClassFieldTheory Layer 5).
2. Rational equivalence: Weil reciprocity for Brauer classes on curves through the norm; global cycles pair to 0 by the reciprocity law for each finite extension K(P)/K.
3. The descent to rational equivalence requires Brauer reciprocity on curves, including specialization and corestriction for principal divisors. An intersection-number projection formula alone does not provide this theorem; its precise supplier is requested below.

Planning API:

- `TauCeti.ZeroCycle.brauerEval` (constructor): α(P) for a closed point P, by corestriction.
- `TauCeti.ZeroCycle.brauerPairing` (constructor): The pairing on adelic families of zero-cycles.
- `TauCeti.ZeroCycle.brauerPairing_rationalEquivalence` (relation): It vanishes on principal divisors.
- `TauCeti.ZeroCycle.brauerPairing_global` (relation): Global zero-cycles pair to 0.
- `TauCeti.ZeroCycle.brauerPairing_point` (compatibility): On rational points it is brauerManinPairing.
- `TauCeti.ZeroCycle.brauerPairing_pushforward` (functoriality): ⟨f_*z, α⟩ = ⟨z, f*α⟩.

Unit tests:

- **ZeroCycle.brauerPairing.test_point** (compatibility): A rational point gives the ordinary evaluation.
- **ZeroCycle.brauerPairing.test_complex_norm** (computation): A real place and the cycle of a complex point (a norm from ℂ) pair to 0.
- **ZeroCycle.brauerPairing.test_zero** (degenerate): The zero cycle pairs to 0.
- **ZeroCycle.brauerPairing.test_not_degree_one** (non-example): A degree-two global point pairs to 0 although it is not a rational point; orthogonality does not produce rational points.

Checks:

- A rational point gives the pairing of brauer-manin-general.

Consumers:

- Harpaz–Wittenberg 2020 §§1–3: the zero-cycle Brauer–Manin obstruction on homogeneous spaces

Direct prerequisites:

- [The Brauer–Manin pairing and set for varieties](#RP2-brauer-manin-general) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general`)
- [Evaluation of scheme Brauer classes at points](#RP2-scheme-brauer-evaluation) (`HeightsRationalPointsAndObstructions:RP.2/scheme-brauer-evaluation`)
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`
- `SchemeAndStackFoundations:SF.5`

Sources:

- [Y. Harpaz, O. Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §1.2, pp. 6–7. Evaluation of Brauer classes on closed points by corestriction, extended linearly to zero-cycles and places; principal divisors and archimedean norms pair trivially and global cycles are orthogonal.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts; Lefschetz, Brauer reciprocity and purity proof contracts.

<a id="RP2-formal-lemma"></a>
### Harari's formal lemma

*Theorem · node `HeightsRationalPointsAndObstructions:RP.2/formal-lemma` · declaration `TauCeti.formal_lemma` · module `TauCeti/NumberTheory/BrauerManin/Obstruction`*

Let X be a smooth proper rationally connected variety over a number field K, V ⊆ X a dense open subset and A ⊆ Br(V) a subgroup with A/(A ∩ Br X) finite. Then V(𝔸_K)^A is dense in X(𝔸_K)^{A ∩ Br X}.

Hypotheses and conventions:

- The finiteness of the quotient A/(A ∩ Br X) (not of Br V) is the hypothesis used.

Construction or proof:

1. Colliot-Thélène–Skorobogatov 2000 Proposition 1.1 (as used by Harpaz–Wittenberg 2020, proof of Corollary 2.2): ramified classes can be compensated at auxiliary places by choosing local points near the boundary divisors.

Checks:

- For A ⊆ Br X the statement is the density of V(𝔸)^A in X(𝔸)^A (V(K_v) is dense in X(K_v)).

Direct prerequisites:

- [Topology of Brauer–Manin sets](#RP2-brauer-manin-set-closed) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-set-closed`)
- [The unramified Brauer group](#RP2-unramified-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/unramified-brauer-group`)
- [Local constancy of Brauer evaluation](#RP2-brauer-local-constancy) (`HeightsRationalPointsAndObstructions:RP.2/brauer-local-constancy`)

Sources:

- [Y. Harpaz, O. Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), proof of Corollary 2.2, p. 8, citing Colliot-Thélène–Skorobogatov 2000 Proposition 1.1. The formal lemma near a Brauer–Manin point, with the finite-quotient hypothesis.

Outstanding proof or supplier contracts: Formal lemma auxiliary-place proof.

<a id="RP2-cyclic-norm-class"></a>
### Cyclic algebras and the local invariant matrix

*Definition · node `HeightsRationalPointsAndObstructions:RP.2/cyclic-norm-class` · module `TauCeti/NumberTheory/AdelicPoints/CyclicAlgebras`*

Let L/K be a cyclic extension of number fields of degree r with a character χ : Gal(K̄/K) → ℤ/r cutting out L. For a ∈ K_v^× the cyclic algebra (χ, a) has class in Br(K_v)[r], zero iff a is a norm from L ⊗ K_v. For polynomials P₁, …, P_n ∈ K[t] and local inputs t_v, the local invariant matrix is b_{v,i} = inv_v(χ, P_i(t_v)) ∈ (1/r)ℤ/ℤ.

Hypotheses and conventions:

- L/K cyclic of degree r; χ a generator of the character group of Gal(L/K).

Construction or proof:

1. The cyclic algebra and its norm criterion over local fields are ClassFieldTheory Layer 5 inputs (local invariant of cyclic algebras); the matrix is a bookkeeping device recording these invariants.

Planning API:

- `TauCeti.cyclicAlgebraClass` (constructor): (χ, a) ∈ TauCeti.BrauerGroup K_v.
- `TauCeti.cyclicAlgebraClass_eq_one_iff` (characterisation): (χ, a) = 1 iff a is a norm from L ⊗ K_v.
- `TauCeti.cyclicAlgebraClass_mul` (simp): (χ, ab) = (χ, a)(χ, b).
- `TauCeti.cyclicAlgebraClass_inv` (relation): inv_v(χ, a) lies in (1/r)ℤ/ℤ.
- `TauCeti.localInvariantMatrix` (constructor): (b_{v,i}) for polynomials P_i and local inputs t_v.

Unit tests:

- **cyclicAlgebraClass.test_hilbert** (compatibility): For r = 2 and χ of ℚ(√d), (χ, a) is the quaternion algebra (d, a).
- **cyclicAlgebraClass.test_one** (degenerate): (χ, 1) = 1.
- **cyclicAlgebraClass.test_minus_one_real** (computation): For χ of ℚ(i), inv_∞(χ, −1) = 1/2.
- **cyclicAlgebraClass.test_noncyclic** (non-example): For a noncyclic L/K the norm-from-everywhere-locally criterion fails (Hasse norm theorem fails for biquadratic ℚ(√13, √17)/ℚ), so the cyclic hypothesis cannot be dropped.

Checks:

- For K = ℚ, L = ℚ(i), r = 2: (χ, a)_p = (−1, a)_p, the Hilbert symbol.

Consumers:

- Skorobogatov–Sofos 2023 §5: fibration arguments assemble global norms from local invariant data
- Poonen §8.2.5: the quaternion classes (3 − x², −1) of Iskovskikh's surface are the case r = 2

Direct prerequisites:

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`
- `tauceti:TauCeti.BrauerGroup.mk`

Sources:

- [A. N. Skorobogatov, E. Sofos, *Schinzel Hypothesis on average and rational points*](https://eprints.gla.ac.uk/292484/1/292484.pdf), §5.2, paragraph after Theorem 5.8, p. 722; (5.2) p. 722 and (5.4)–(5.10) pp. 723–724. The cyclic-algebra class (χ, a) in Br(ℚ_v)[r], zero iff a is a local norm, and the matrix of local invariants inv_p(χ, P_i(t_p)).

<a id="RP2-cyclic-norm-one-place"></a>
### The cyclic norm principle with one omitted place

*Theorem · node `HeightsRationalPointsAndObstructions:RP.2/cyclic-norm-one-place` · declaration `TauCeti.isNorm_of_local_norm_off_one_place` · module `TauCeti/NumberTheory/BrauerManin/Obstruction`*

Let L/K be cyclic and a ∈ K^×. If a is a local norm from L at every place except possibly one, then a is a norm from L^×.

Hypotheses and conventions:

- L/K cyclic (essential).

Construction or proof:

1. All local invariants of (χ, a) but one vanish; the sum of invariants is 0 (ClassFieldTheory Layer 10), so all vanish; the Albert–Brauer–Hasse–Noether injectivity gives (χ, a) = 0, and the cyclic splitting criterion (cyclicHasseNorm of ClassFieldTheory Layer 13) makes a a global norm.

Checks:

- For L = ℚ(i): if a is a sum of two squares in ℚ_p for every p ≠ 3 and in ℝ, it is a sum of two rational squares.

Direct prerequisites:

- [Cyclic algebras and the local invariant matrix](#RP2-cyclic-norm-class) (`HeightsRationalPointsAndObstructions:RP.2/cyclic-norm-class`)
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`

Sources:

- [A. N. Skorobogatov, E. Sofos, *Schinzel Hypothesis on average and rational points*](https://eprints.gla.ac.uk/292484/1/292484.pdf), proof of Theorem 5.3, p. 720, citing Colliot-Thélène–Skorobogatov, The Brauer–Grothendieck group, Corollary 13.1.10. A local norm everywhere but one place is a global norm for cyclic extensions.

<a id="RP2-product-norm-assembly"></a>
### Assembling a global norm from a local invariant matrix

*Theorem · node `HeightsRationalPointsAndObstructions:RP.2/product-norm-assembly` · declaration `TauCeti.isNorm_prod_of_invariantMatrix` · module `TauCeti/NumberTheory/BrauerManin/Obstruction`*

In the cyclic-norm setting, choose nonzero q_i=P_i(ν) with distinct designated exceptional places outside S. Write b_{v,i}=inv_v(χ,q_i) at v∈S. Require both Σ_{v∈S}b_{v,i}=0 for every i and Σ_i b_{v,i}=0 for every v∈S, together with vanishing outside S and each designated exceptional place, including at archimedean places. Reciprocity kills the invariant at the exceptional place separately for each i. The placewise sums then show that the product Π_i q_i has trivial cyclic-algebra class everywhere, hence is a global norm. Neither of the two sum conditions may be omitted.

Hypotheses and conventions:

- L/K cyclic; the terms q_i are treated separately (no repeated-prime obstruction).

Construction or proof:

1. Use the first condition, the fixed-i sum over S, in the reciprocity formula for each cyclic algebra (χ,q_i) to kill its single remaining local invariant.
2. Use the second condition, the fixed-place sum over i, for the product at S. Additivity gives zero at every other place; apply the cyclic Hasse norm theorem.

Checks:

- With n = 1 this is cyclic-norm-one-place for a = q₁.

Direct prerequisites:

- [The cyclic norm principle with one omitted place](#RP2-cyclic-norm-one-place) (`HeightsRationalPointsAndObstructions:RP.2/cyclic-norm-one-place`)
- [Cyclic algebras and the local invariant matrix](#RP2-cyclic-norm-class) (`HeightsRationalPointsAndObstructions:RP.2/cyclic-norm-class`)
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`

Sources:

- [A. N. Skorobogatov, E. Sofos, *Schinzel Hypothesis on average and rational points*](https://eprints.gla.ac.uk/292484/1/292484.pdf), equations (5.7)–(5.10), pp. 723–724. The local-to-global assembly of a product norm from the invariant matrix and the reciprocity law.

<a id="RP2-brauer-trivial-complete-intersections"></a>
### Brauer groups of high-dimensional complete intersections

*Theorem · node `HeightsRationalPointsAndObstructions:RP.2/brauer-trivial-complete-intersections` · declaration `TauCeti.brauer_completeIntersection` · module `TauCeti/NumberTheory/BrauerManin/Obstruction`*

Let k be a field of characteristic 0 and X ⊆ ℙⁿ_k a smooth complete intersection with dim X ≥ 3. Then Br k → Br X is an isomorphism. Consequently, over a number field, X(𝔸_K)^{Br} = X(𝔸_K) (and X(𝔸)^{descent} = X(𝔸)): the Brauer–Manin and descent obstructions are vacuous. This does not prove that X has a rational point.

Hypotheses and conventions:

- char k = 0; dim X ≥ 3; X a smooth complete intersection.

Construction or proof:

1. Use Lefschetz to identify Pic X_{k̄}=ℤ·O(1) and H²(X_{k̄},μ_n) with the corresponding projective-space group for every n. The Kummer sequence then gives Br X_{k̄}[n]=0; torsion gives Br X_{k̄}=0. The hyperplane bundle descends, H¹(k,ℤ)=0, and Hochschild–Serre gives Br X=Br₀ X. H³(k,𝔾_m)=0 is the number-field spectral-sequence input, not a substitute for the geometric H²/Kummer calculation.
2. Vacuity: constant classes pair trivially (brauer-manin-general); descent: X_{k̄} is algebraically simply connected and Theorem 8.5.4 (RP.3/etale-brauer-equals-descent).

Checks:

- Smooth cubic threefolds and quartic threefolds in ℙ⁴ have no Brauer–Manin obstruction.

Direct prerequisites:

- [Constant and algebraic Brauer groups](#RP2-algebraic-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/algebraic-brauer-group`)
- [The Brauer–Manin pairing and set for varieties](#RP2-brauer-manin-general) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.6.3, Theorem 8.6.12 and sketch of proof, p. 252. For smooth complete intersections of dimension ≥ 3 over a number field the descent and Brauer–Manin obstructions are vacuous; (ii) Br k → Br X is an isomorphism, citing Poonen–Voloch Proposition A.1.
- [T. Browning, P. Le Boudec, W. Sawin, *The Hasse principle for random Fano hypersurfaces*](https://arxiv.org/abs/2006.02356), §1, p. 2, citing Poonen–Voloch Appendix A. Uses that the Brauer–Manin obstruction is vacuous for high-dimensional complete intersections, as motivation for the Hasse principle for random Fano hypersurfaces.

Outstanding proof or supplier contracts: Lefschetz, Brauer reciprocity and purity proof contracts.

<a id="RP2-conic-example"></a>
### Conics: Brauer–Manin set and the Hasse principle

*Application · node `HeightsRationalPointsAndObstructions:RP.2/conic-example` · declaration `TauCeti.conic_hassePrinciple` · module `TauCeti/NumberTheory/BrauerManin/Obstruction`*

Let C ⊆ ℙ²_K be a smooth conic over a number field K. Then Br C = Br₀ C, so C(𝔸_K)^{Br} = C(𝔸_K); C satisfies the Hasse principle (C(𝔸_K) ≠ ∅ ⇒ C(K) ≠ ∅) and weak approximation once C(K) ≠ ∅. For C : x² + y² = 3z² over ℚ, C(ℚ₃) = ∅, so C(𝔸_ℚ) = ∅.

Hypotheses and conventions:

- C smooth projective conic over a number field.

Construction or proof:

1. C_{K̄} ≅ ℙ¹, so Pic C_{K̄} = ℤ with trivial Galois action and H¹(K, ℤ) = 0: Br₁ = Br₀ and Br C_{K̄} = 0.
2. Hasse principle: Hasse–Minkowski for ternary forms (TauCetiRoadmap GlobalQuadraticForms Layer 5).

Checks:

- x² + y² = 3z² has no ℚ₃-point (sums of two squares are not 3 times a unit square modulo 9 with the valuation count).

Direct prerequisites:

- [Constant and algebraic Brauer groups](#RP2-algebraic-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/algebraic-brauer-group`)
- [The Brauer–Manin pairing and set for varieties](#RP2-brauer-manin-general) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general`)
- `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §4.5, Theorem 4.5.11 (Châtelet: Severi–Brauer varieties satisfy the local-global principle), p. 108. Conics are one-dimensional Severi–Brauer varieties and satisfy the Hasse principle over global fields.

<a id="RP2-iskovskikh-example"></a>
### Iskovskikh's conic bundle surface

*Application · node `HeightsRationalPointsAndObstructions:RP.2/iskovskikh-example` · declaration `TauCeti.iskovskikh_brauerManin` · module `TauCeti/NumberTheory/BrauerManin/Obstruction`*

Let X be the smooth proper model of the affine surface y² + z² = (3 − x²)(x² − 2) over ℚ (a Châtelet surface). Then X(𝔸_ℚ) ≠ ∅ but X(𝔸_ℚ)^{𝒜} = ∅ for the quaternion class 𝒜 = (3 − x², −1) ∈ Br X; hence X(ℚ) = ∅ and the failure of the Hasse principle is explained by the Brauer–Manin obstruction.

Hypotheses and conventions:

- The class 𝒜 extends from the function field to Br X (Poonen Proposition 8.2.14).

Construction or proof:

1. Local solubility by Hensel's lemma at every p and at ∞.
2. Local invariants: inv_p 𝒜(P) = 0 for p ∉ {2, ∞} (units, Br ℤ_p = 0); inv_∞ 𝒜(P) = 0 for every real point (3 − x² or x² − 2 is positive, a norm from ℂ); inv_2 𝒜(P) = 1/2 for every P ∈ X(ℚ₂) (the relevant function is ≡ −1 mod 4, not a sum of two 2-adic squares); the sum is 1/2 ≠ 0 (Poonen Proposition 8.2.15).

Checks:

- The pairing of 𝒜 with every adelic point is 1/2.

Direct prerequisites:

- [The Brauer–Manin pairing and set for varieties](#RP2-brauer-manin-general) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general`)
- [Evaluation of scheme Brauer classes at points](#RP2-scheme-brauer-evaluation) (`HeightsRationalPointsAndObstructions:RP.2/scheme-brauer-evaluation`)
- [Local constancy of Brauer evaluation](#RP2-brauer-local-constancy) (`HeightsRationalPointsAndObstructions:RP.2/brauer-local-constancy`)
- [Azumaya algebras over the integers of a nonarchimedean local field are split](#RP2-azumaya-complete-dvr-split) (`HeightsRationalPointsAndObstructions:RP.2/azumaya-complete-dvr-split`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.5, Proposition 8.2.14 and Proposition 8.2.15 with proof, pp. 232–235. Iskovskikh's Châtelet surface has adelic points but empty Brauer set, so no rational points.

<a id="RP2-effective-brauer-manin-test"></a>
### Finite local partitions for a finite Brauer test; effective computation requires extra input

*Theorem · node `HeightsRationalPointsAndObstructions:RP.2/effective-brauer-manin-test` · declaration `TauCeti.brauerManinSet_finite_description` · module `TauCeti/NumberTheory/BrauerManin/Obstruction`*

For a proper variety X over a number field and a finite list of Brauer classes, there is a finite set T of places and, at each v∈T, a finite partition of the compact space X(K_v) by clopen evaluation fibres. The orthogonality condition is therefore a finite constraint on these fibres. This is an existence theorem: local constancy and compactness alone do not compute T, the nonempty fibres, or a terminating local solver. An effective algorithm additionally needs certified spreading data, local solution enumeration and explicit evaluation formulae. The Iskovskikh example supplies those extra data in that particular case.

Hypotheses and conventions:

- X smooth proper; B finite and given explicitly; the local invariants of ClassFieldTheory Layer 5 computed on explicit algebras.

Construction or proof:

1. Spread the fixed finite list of classes over one integral model so that evaluation vanishes outside a common finite T.
2. For each v∈T use local constancy and compactness to obtain finitely many evaluation fibres; at archimedean places use the finite connected-component description. This proves a finite partition, not an algorithm.

Checks:

- For the Iskovskikh surface, T = {2, ∞} and the computation is Proposition 8.2.15.

Direct prerequisites:

- [Local constancy of Brauer evaluation](#RP2-brauer-local-constancy) (`HeightsRationalPointsAndObstructions:RP.2/brauer-local-constancy`)
- [Brauer evaluation is trivial at almost all places](#RP2-brauer-evaluation-finite-support) (`HeightsRationalPointsAndObstructions:RP.2/brauer-evaluation-finite-support`)
- [Topology of Brauer–Manin sets](#RP2-brauer-manin-set-closed) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-set-closed`)
- [Iskovskikh's conic bundle surface](#RP2-iskovskikh-example) (`HeightsRationalPointsAndObstructions:RP.2/iskovskikh-example`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.2.4, Remark 8.2.12, p. 232; §8.2.6, pp. 235–236. For proper X the pairing with a Brauer class admits a finite explicit description: locally constant functions factor through finite levels and almost all places contribute 0; effectivity of searching for obstructing algebras.

Outstanding proof or supplier contracts: Certified computation beyond compact local evaluation fibres.

<a id="rp-3"></a>
## RP.3. Torsor descent and comparison of obstructions

Fibre evaluation partitions rational points among inverse twists. Selmer sets and descent sets compare with Brauer–Manin and étale–Brauer obstructions. Universal torsor existence is stated via the type obstruction δ(id). Relative Brauer edge maps and the residual Tate–Shafarevich functional implement unramified torus descent, with the twist sign fixed throughout. Marked genus-one torsors, hyperelliptic examples, strong approximation and insufficiency examples describe the reach and limits of the obstructions.

**Named milestones:** [Descent by torsors](#RP3-descent-partition), [Descent obstruction](#RP3-descent-set), [Étale–Brauer obstruction](#RP3-etale-brauer-set), [Étale–Brauer equals descent](#RP3-etale-brauer-equals-descent), [Unramified descent for torus torsors](#RP3-unramified-torus-descent).

**Imported interfaces:** `HeightsRationalPointsAndObstructions:RP.1`, `HeightsRationalPointsAndObstructions:RP.2`, `ArithmeticGaloisDuality:R02.3/h1-finite`, `ArithmeticGaloisDuality:R02.4/torus-sha-duality`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:key/scheme-brauer`.


<a id="RP3-torsor-evaluation"></a>
### Evaluation of torsors and twisted torsors

*Construction · node `HeightsRationalPointsAndObstructions:RP.3/torsor-evaluation` · module `TauCeti/NumberTheory/Descent/Torsor`*

Let k be a field, X a k-variety, G a smooth affine algebraic group over k and f : Z → X a G-torsor with class ζ ∈ H¹_fppf(X, G). For x ∈ X(L), ζ(x) ∈ H¹(L, G) is the class of the fibre Z_x. For a cocycle class τ ∈ H¹(k, G) represented by a torsor T, the twisted torsor f^τ : Z^τ = Z ×^G T^{-1} → X is a torsor under the inner form G_τ. Evaluation is natural in L and in X, and commutes with twisting: ζ^τ(x) corresponds to ζ(x) under the twisting bijection H¹(k, G) ≅ H¹(k, G_τ). The twisting bijection sends τ to the trivial class. For commutative G, [Z^τ]=[Z]−π*τ; x lifts to Z^τ exactly when ζ(x)=res(τ).

Hypotheses and conventions:

- G smooth affine (for twisting by the contracted product); H¹ is fppf (equal to Galois cohomology for smooth G over a field).

Construction or proof:

1. Pullback of torsors along x : Spec L → X (SchemeAndStackFoundations SF.1/torsor-cohomology).
2. Twisting: contracted product with T^{-1} (SF.1/contracted-product, SF.1/twisting-bijection; Poonen Example 6.5.12).

Planning API:

- `TauCeti.Torsor.eval` (constructor): ζ(x) ∈ H¹(L, G) for x ∈ X(L).
- `TauCeti.Torsor.twist` (constructor): f^τ : Z^τ → X, a torsor under G_τ.
- `TauCeti.Torsor.eval_pullback` (functoriality): Evaluation commutes with pullback along X' → X.
- `TauCeti.Torsor.twist_twist` (relation): Twisting by τ and then by the image of τ' is twisting by the composite class; twisting by the trivial class is the identity.
- `TauCeti.Torsor.twist_comm` (compatibility): For commutative G, [Z^τ] = [Z] − π*τ in H¹(X,G), using Poonen’s inverse-torsor convention. Harpaz–Wittenberg’s parameter is σ=−τ.
- `TauCeti.Torsor.eval_eq_trivial_iff` (characterisation): ζ(x) is trivial iff Z_x(L) ≠ ∅.

Unit tests:

- **Torsor.twist.test_trivial** (degenerate): Twisting by the trivial class returns Z → X.
- **Torsor.twist.test_inverse** (computation): For commutative G, twisting by τ then by −τ returns Z.
- **Torsor.eval.test_kummer** (compatibility): For [n] : A → A, eval is the Kummer map of RP.1/kummer-map.
- **Torsor.eval.test_point_not_lift** (non-example): ζ(x) ≠ 0 means x has no preimage in Z(k) although Z_x may have points over an extension.

Checks:

- For the torsor [2] : A → A under A[2], evaluation at a ∈ A(k) is the Kummer class δ(a) (RP.1/kummer-map).

Consumers:

- Poonen Theorem 8.4.1: partition of X(k) by the twisted torsors
- Harpaz–Wittenberg 2020 §2 (PAPER-HARPAZ-WITTENBERG-20/20): twists of torus torsors f^σ : Y^σ → X with [Y^σ] = [Y] + p*σ for commutative T
- Bhargava–Gross–Wang 2017: two-coverings are twists of [2] : J → J

Direct prerequisites:

- `SchemeAndStackFoundations:SF.1`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.1, evaluation of a torsor at rational points, pp. 239–240; §6.5, Example 6.5.12 (twisted torsor), p. 183. A G-torsor over X gives an evaluation map X(k) → H¹(k, G); twisting by τ gives Z^τ → X under the inner form.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP3-descent-partition"></a>
### The descent partition of rational points

*Theorem · node `HeightsRationalPointsAndObstructions:RP.3/descent-partition` · declaration `TauCeti.Torsor.mem_image_twist_iff` · module `TauCeti/NumberTheory/Descent/Torsor`*

In the setting of torsor-evaluation, {x ∈ X(k) : ζ(x) = τ} = f^τ(Z^τ(k)) for every τ ∈ H¹(k, G); hence X(k) is the disjoint union over τ ∈ H¹(k, G) of f^τ(Z^τ(k)).

Hypotheses and conventions:

- G smooth affine; X a k-variety.

Construction or proof:

1. x ∈ f^τ(Z^τ(k)) iff the fibre of Z^τ at x is trivial iff Z_x ≅ T as G-torsors iff ζ(x) = τ (Poonen Theorem 8.4.1 and its proof, using Proposition 5.12.14).

Checks:

- For y² = (x² + 1)(x⁴ + 1) and the μ₂-torsors Z_c given by c w² = x⁴ + 1, X(ℚ) = ⋃_c f_c(Z_c(ℚ)) (Poonen §8.3).

Direct prerequisites:

- [Evaluation of torsors and twisted torsors](#RP3-torsor-evaluation) (`HeightsRationalPointsAndObstructions:RP.3/torsor-evaluation`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.2, Theorem 8.4.1 and proof, p. 240. Rational points with a given fibre class are exactly images of rational points of the corresponding twist; X(k) is the disjoint union over H¹(k, G).

<a id="RP3-selmer-set-of-torsor"></a>
### The Selmer set of a torsor

*Definition · node `HeightsRationalPointsAndObstructions:RP.3/selmer-set-of-torsor` · module `TauCeti/NumberTheory/Descent/Torsor`*

For a global field k and a G-torsor f : Z → X, Sel_Z(k, G) = {τ ∈ H¹(k, G) : τ_v ∈ image of X(k_v) → H¹(k_v, G) for all places v} = {τ : Z^τ(k_v) ≠ ∅ for all v}. Then X(k) = ⨆_{τ ∈ Sel_Z(k,G)} f^τ(Z^τ(k)). If X is proper, Sel_Z(k, G) is finite, and there is a finite separable extension k'/k with X(k) ⊆ f(Z(k')).

Hypotheses and conventions:

- k a global field; finiteness needs X proper.
- For the trivial-torsor identification with Ш¹(k,G), assume X(𝔸_k)≠∅. For global function fields use the global-field adelic and finite-cohomology contracts, not merely the number-field constructions of RP.2.

Construction or proof:

1. Spread X, Z, G out over O_{k,S}; for v ∉ S local images come from H¹(O_v, G) (valuative criterion); for v ∈ S the local images of the finite component group are finite (local-evaluation-finite-image); H¹_S(k, G) has finite fibres over finitely many local data (Poonen Theorem 6.5.13).
2. The extension k': each τ in the finite Selmer set dies over some finite separable extension; take a compositum (Poonen Corollary 8.4.8).

Planning API:

- `TauCeti.Torsor.selmerSet` (constructor): Sel_Z(k, G) ⊆ H¹(k, G).
- `TauCeti.Torsor.mem_selmerSet_iff` (characterisation): τ ∈ Sel iff Z^τ(k_v) ≠ ∅ for all v.
- `TauCeti.Torsor.selmerSet_finite` (other): Sel_Z(k, G) is finite for X proper.
- `TauCeti.Torsor.rationalPoints_eq_iUnion_selmer` (relation): X(k) = ⋃_{τ ∈ Sel} f^τ(Z^τ(k)).
- `TauCeti.Torsor.exists_field_lift` (other): There is a finite separable k'/k with X(k) ⊆ f(Z(k')).

Unit tests:

- **Torsor.selmerSet.test_isogeny** (compatibility): For an isogeny φ : A → B viewed as an A[φ]-torsor over B, Sel_Z is Sel^φ(A/k) of RP.1/selmer-group.
- **Torsor.selmerSet.test_trivial_torsor** (degenerate): If X(𝔸_k)≠∅ and Z=X×G, Sel_Z(k,G)=Ш¹(k,G). If any X(k_v) is empty then the Selmer set is empty, so the nonemptiness hypothesis cannot be dropped.
- **Torsor.selmerSet.test_example** (computation): For Poonen's example y² = (x² + 1)(x⁴ + 1), the Selmer set is {c = 1, c = 2} modulo squares.
- **Torsor.selmerSet.test_nonproper** (non-example): For X = 𝔾_m and Z → X the squaring μ₂-torsor, Sel_Z(ℚ, μ₂) = ℚ^×/ℚ^{×2} is infinite: properness is needed.

Checks:

- For f = [2] : E → E on an elliptic curve over a number field, Sel_Z(k, E[2]) is the 2-Selmer group (Poonen Remark 8.4.5).

Consumers:

- Bhargava–Gross–Wang 2017: Sel₂(J¹) is the Selmer set of the two-covering torsor
- RP.4/chevalley-weil: the finite extension k' is the Chevalley–Weil field

Direct prerequisites:

- [The descent partition of rational points](#RP3-descent-partition) (`HeightsRationalPointsAndObstructions:RP.3/descent-partition`)
- [Finite local images of torsor evaluation](#RP3-local-evaluation-finite-image) (`HeightsRationalPointsAndObstructions:RP.3/local-evaluation-finite-image`)
- [Finiteness of Selmer groups](#RP1-selmer-finite) (`HeightsRationalPointsAndObstructions:RP.1/selmer-finite`)
- `ArithmeticGaloisDuality:R02.3/h1-finite`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.4, Definition 8.4.4, Remark 8.4.5, Theorem 8.4.6, Corollary 8.4.8, pp. 241–242. The Selmer set, its finiteness for proper X, and a single finite extension over which all rational points lift.

Outstanding proof or supplier contracts: Global-function-field adelic and cohomology extension.

<a id="RP3-local-evaluation-finite-image"></a>
### Finite local images of torsor evaluation

*Lemma · node `HeightsRationalPointsAndObstructions:RP.3/local-evaluation-finite-image` · declaration `TauCeti.Torsor.finite_range_eval_local` · module `TauCeti/NumberTheory/Descent/Torsor`*

Let k be a local field, X a proper k-variety, F a finite étale algebraic group over k and f : Z → X an F-torsor. Then the image of X(k) → H¹(k, F) is finite; if char k = 0, H¹(k, F) itself is finite.

Hypotheses and conventions:

- k local; X proper; F finite étale.

Construction or proof:

1. Krasner's lemma makes the fibre class locally constant (the evaluation is continuous for the discrete topology on H¹); X(k) is compact for proper X (Poonen Proposition 8.4.2).
2. In characteristic 0, H¹(k, F) is finite (Poonen Theorem 5.12.24(a)).

Checks:

- For X = ℙ¹ over ℚ_p and any F-torsor, the image is finite.

Direct prerequisites:

- [Evaluation of torsors and twisted torsors](#RP3-torsor-evaluation) (`HeightsRationalPointsAndObstructions:RP.3/torsor-evaluation`)
- [Adelic points of separated schemes of finite type](#RP2-adelic-points-general) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points-general`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.3, Proposition 8.4.2 and Remark 8.4.3, pp. 240–241. The image of X(k) → H¹(k, F) is finite for proper X over a local field.

<a id="RP3-descent-set"></a>
### Descent obstruction sets

*Definition · node `HeightsRationalPointsAndObstructions:RP.3/descent-set` · module `TauCeti/NumberTheory/Descent/ObstructionSets`*

Let k be a number field and X a k-variety. For a G-torsor f : Z → X under a smooth affine G, X(𝔸)^f is the set of adelic points whose image in Π_v H¹(k_v, G) comes from H¹(k, G); equivalently X(𝔸)^f = ⋃_{τ∈H¹(k,G)} f^τ(Z^τ(𝔸)) = ⋃_{τ∈Sel} f^τ(Z^τ(𝔸)), closed when X is proper. X(𝔸)^{H¹(X,G)} = ⋂_f X(𝔸)^f, X(𝔸)^{descent} = ⋂_G X(𝔸)^{H¹(X,G)} over all smooth affine G, and X(𝔸)^{ét}, X(𝔸)^{conn}, X(𝔸)^{PGL} restrict G to finite étale, smooth connected affine, PGL_n. Then X(k) ⊆ X(𝔸)^{descent} ⊆ X(𝔸). There is a descent obstruction when X(𝔸) ≠ ∅ = X(𝔸)^{descent}.

Hypotheses and conventions:

- k a number field; G smooth affine; X separated of finite type.
- For function fields the assertion requires the analogous adelic-space construction for global fields. RP.2 currently provides its number-field specialization; the extension is recorded as a gap rather than silently supplied by it.

Construction or proof:

1. Commutativity of X(k) → X(𝔸) with H¹(k, G) → Π_v H¹(k_v, G) (Poonen (8.4.13)) gives X(k) ⊆ X(𝔸)^f.
2. The union description and closedness for proper X: Poonen Exercise 8.7, via selmer-set-of-torsor and local-evaluation-finite-image.

Planning API:

- `TauCeti.descentSet` (constructor): X(𝔸)^f for a torsor f.
- `TauCeti.descentSet_eq_iUnion` (characterisation): X(𝔸)^f = ⋃_τ f^τ(Z^τ(𝔸)).
- `TauCeti.descentObstructionSet` (constructor): X(𝔸)^{descent}, and its variants for finite étale, connected and PGL_n groups.
- `TauCeti.diagonal_mem_descentSet` (relation): X(k) ⊆ X(𝔸)^{descent}.
- `TauCeti.isClosed_descentSet` (other): X(𝔸)^f is closed for X proper.
- `TauCeti.descentSet_map` (functoriality): For π : X' → X, π(X'(𝔸)^{π*f}) ⊆ X(𝔸)^f.

Unit tests:

- **descentSet.test_trivial** (degenerate): For the trivial torsor, X(𝔸)^f = X(𝔸).
- **descentSet.test_isogeny** (computation): For [n] : A → A over a number field with A proper, A(𝔸)^{[n]} is the set of adelic points whose local Kummer classes come from Sel^n(A/k).
- **descentSet.test_selmer_union** (compatibility): The union over H¹(k, G) may be replaced by the union over the Selmer set.
- **descentSet.test_nonempty_no_point** (non-example): X(𝔸)^{descent} ≠ ∅ does not imply X(k) ≠ ∅ (Poonen's threefold, insufficiency-examples).

Checks:

- For the trivial torsor Z = X × G, X(𝔸)^f = X(𝔸).

Consumers:

- Harpaz–Wittenberg 2020 Theorem 2.1: adelic points orthogonal to f*^{-1}Br_nr(Y) lie in ⋃_σ f^σ(Y^σ(𝔸)^{Br_nr})
- Bhargava–Gross–Wang 2017 Theorems 10–11: the J[2]-torsor of two-coverings obstructs J¹

Direct prerequisites:

- [Evaluation of torsors and twisted torsors](#RP3-torsor-evaluation) (`HeightsRationalPointsAndObstructions:RP.3/torsor-evaluation`)
- [The Selmer set of a torsor](#RP3-selmer-set-of-torsor) (`HeightsRationalPointsAndObstructions:RP.3/selmer-set-of-torsor`)
- [Adelic points of separated schemes of finite type](#RP2-adelic-points-general) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points-general`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.7, display (8.4.13), Definition 8.4.14 and the definitions of X(𝔸)^{ét}, X(𝔸)^{conn}, X(𝔸)^{PGL}, pp. 244–245. Descent sets of torsors, their intersections over all torsors and groups, and the descent obstruction.

Outstanding proof or supplier contracts: Global-function-field adelic and cohomology extension.

<a id="RP3-descent-brauer-comparison"></a>
### Descent is at least as strong as Brauer–Manin

*Theorem · node `HeightsRationalPointsAndObstructions:RP.3/descent-brauer-comparison` · declaration `TauCeti.descentObstructionSet_subset_brauerManinSet` · module `TauCeti/NumberTheory/Descent/Torsor`*

Let k be a number field and X a variety. For a PGL_n-torsor f : Z → X with Brauer class 𝒜 ∈ Br X[n], X(𝔸)^f = X(𝔸)^𝒜. If X is regular and quasi-projective, every class of Br X comes from some PGL_n-torsor, so X(𝔸)^{descent} ⊆ X(𝔸)^{PGL} = X(𝔸)^{Br}.

Hypotheses and conventions:

- k a number field; for the equality X(𝔸)^{PGL} = X(𝔸)^{Br}, X regular quasi-projective (Gabber–de Jong: Br X = Br' X).
- PGL_n-torsors classify Azumaya Brauer classes. Passage to the full cohomological Brauer group uses the regular quasi-projective Gabber comparison. Period=index is used only over number fields here.

Construction or proof:

1. The map H¹(X, PGL_n) → Br X[n] is compatible with evaluation; H¹(k, PGL_n) ≅ Br(k)[n] and H¹(k_v, PGL_n) ≅ Br(k_v)[n] (Poonen Remark 1.5.18), so the descent condition becomes the reciprocity condition (Poonen Lemma 8.5.2).
2. Every class of Br X is represented by an Azumaya algebra for X regular quasi-projective (Poonen Corollary 6.6.19; requested from SchemeAndStackFoundations SF.2).

Checks:

- For the Iskovskikh surface the PGL₂-torsor of the quaternion algebra already obstructs.

Direct prerequisites:

- [Descent obstruction sets](#RP3-descent-set) (`HeightsRationalPointsAndObstructions:RP.3/descent-set`)
- [The Brauer–Manin pairing and set for varieties](#RP2-brauer-manin-general) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general`)
- `SchemeAndStackFoundations:SF.2`
- `SchemeAndStackFoundations:key/scheme-brauer`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.5.1, Lemma 8.5.2 and Proposition 8.5.3 with proofs, pp. 245–246. The descent set of a PGL_n-torsor equals the Brauer set of its class; descent sets are contained in the Brauer–Manin set for regular quasi-projective X.

<a id="RP3-etale-brauer-set"></a>
### The étale–Brauer set

*Definition · node `HeightsRationalPointsAndObstructions:RP.3/etale-brauer-set` · module `TauCeti/NumberTheory/Descent/ObstructionSets`*

For a variety X over a number field k, X(𝔸)^{ét,Br} = ⋂_{F finite étale} ⋂_{f : Z → X F-torsor} ⋃_{τ ∈ H¹(k,F)} f^τ(Z^τ(𝔸)^{Br}), and X(𝔸)^{ét,descent} is defined with Z^τ(𝔸)^{descent} in place of Z^τ(𝔸)^{Br}. Then X(k) ⊆ X(𝔸)^{ét,descent} ⊆ X(𝔸)^{ét,Br} ⊆ X(𝔸)^{Br}.

Hypotheses and conventions:

- k a number field; X a variety.

Construction or proof:

1. Rational points: each x ∈ X(k) lifts to some Z^τ(k) (descent-partition), which lies in Z^τ(𝔸)^{Br} (RP.2/brauer-manin-general).
2. Inclusions from descent-brauer-comparison applied to the covers Z^τ and from the trivial torsor.

Planning API:

- `TauCeti.etaleBrauerSet` (constructor): X(𝔸)^{ét,Br}.
- `TauCeti.etaleDescentSet` (constructor): X(𝔸)^{ét,descent}.
- `TauCeti.diagonal_mem_etaleBrauerSet` (relation): X(k) ⊆ X(𝔸)^{ét,Br}.
- `TauCeti.etaleBrauerSet_subset_brauerManinSet` (other): X(𝔸)^{ét,Br} ⊆ X(𝔸)^{Br}.
- `TauCeti.etaleBrauerSet_simplyConnected` (simp): If X_{k̄} is algebraically simply connected, X(𝔸)^{ét,Br} = X(𝔸)^{Br}.

Unit tests:

- **etaleBrauerSet.test_projective** (computation): For X = ℙⁿ, X(𝔸)^{ét,Br} = X(𝔸).
- **etaleBrauerSet.test_empty** (degenerate): If X(𝔸) = ∅ then X(𝔸)^{ét,Br} = ∅.
- **etaleBrauerSet.test_compare_descent** (compatibility): For nice X, X(𝔸)^{ét,Br} = X(𝔸)^{descent} (etale-brauer-equals-descent).
- **etaleBrauerSet.test_bielliptic** (non-example): For Skorobogatov's bielliptic surface X(𝔸)^{ét,Br} = ∅ ≠ X(𝔸)^{Br}: the étale–Brauer set is strictly finer.

Checks:

- For X with trivial étale fundamental group of X_{k̄} (for example ℙⁿ or a smooth complete intersection of dimension ≥ 2), X(𝔸)^{ét,Br} = X(𝔸)^{Br}.

Consumers:

- Poonen §8.6.1: Skorobogatov's bielliptic surface has X(𝔸)^{ét,Br} = ∅ but X(𝔸)^{Br} ≠ ∅
- Poonen §8.6.2: Poonen's threefold has X(𝔸)^{ét,Br} ≠ ∅ but no rational points

Direct prerequisites:

- [Descent obstruction sets](#RP3-descent-set) (`HeightsRationalPointsAndObstructions:RP.3/descent-set`)
- [Descent is at least as strong as Brauer–Manin](#RP3-descent-brauer-comparison) (`HeightsRationalPointsAndObstructions:RP.3/descent-brauer-comparison`)
- [The descent partition of rational points](#RP3-descent-partition) (`HeightsRationalPointsAndObstructions:RP.3/descent-partition`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.5.2, definitions of X(𝔸)^{ét,Br} and X(𝔸)^{ét,descent}, pp. 246–247. The Brauer–Manin obstruction applied to all finite étale torsors and their twists.

<a id="RP3-etale-brauer-equals-descent"></a>
### Étale–Brauer equals descent

*Theorem · node `HeightsRationalPointsAndObstructions:RP.3/etale-brauer-equals-descent` · declaration `TauCeti.etaleBrauerSet_eq_descentObstructionSet` · module `TauCeti/NumberTheory/Descent/Torsor`*

For a smooth projective geometrically integral variety X over a number field k: X(𝔸)^{ét,Br} = X(𝔸)^{ét,descent} = X(𝔸)^{descent}. Moreover the descent obstruction is stable under iteration: X(𝔸)^{descent,descent} = X(𝔸)^{descent} for smooth quasi-projective geometrically integral X (Cao).

Hypotheses and conventions:

- X nice (smooth, projective, geometrically integral) for the first equality; smooth quasi-projective geometrically integral for Cao's theorem.

Construction or proof:

1. X(𝔸)^{descent} ⊆ X(𝔸)^{ét,descent}: Skorobogatov 2009 Theorem 1.1 (a torsor under a smooth affine group over a finite étale cover is dominated by a torsor under a larger group over X).
2. X(𝔸)^{ét,descent} ⊆ X(𝔸)^{ét,Br}: descent-brauer-comparison on each cover.
3. X(𝔸)^{ét,Br} ⊆ X(𝔸)^{descent}: Demarche 2009, extending Harari's X(𝔸)^{conn} = X(𝔸)^{Br}.
4. Iteration: Cao 2017 Corollaire 1.2 and induction (Poonen Corollary 8.5.6).

Checks:

- For Skorobogatov's bielliptic surface the empty étale–Brauer set is also explained by a single torsor under a noncommutative finite étale group (Poonen Remark 8.6.4).

Direct prerequisites:

- [The étale–Brauer set](#RP3-etale-brauer-set) (`HeightsRationalPointsAndObstructions:RP.3/etale-brauer-set`)
- [Descent is at least as strong as Brauer–Manin](#RP3-descent-brauer-comparison) (`HeightsRationalPointsAndObstructions:RP.3/descent-brauer-comparison`)
- [Descent obstruction sets](#RP3-descent-set) (`HeightsRationalPointsAndObstructions:RP.3/descent-set`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.5.3, Theorem 8.5.4 and sketch of proof, p. 247; §8.5.4, Theorem 8.5.5 and Corollary 8.5.6, p. 248. The étale–Brauer set equals the descent set for nice varieties over number fields (Demarche, Harari, Skorobogatov, Stoll); Cao's stability of descent under iteration.

Outstanding proof or supplier contracts: Deep descent comparisons and universal torsor existence.

<a id="RP3-universal-torsor"></a>
### Universal torsors and torsors of a given type

*Definition · node `HeightsRationalPointsAndObstructions:RP.3/universal-torsor` · module `TauCeti/NumberTheory/Descent/UniversalTorsor`*

Let X be a smooth geometrically integral variety over a field k with k̄[X]^× = k̄^× and Pic X_{k̄} free of finite rank, and T the k-torus with character module T̂ = Pic X_{k̄}. A torsor f : Y → X under a k-torus T' has a type λ : T̂' → Pic X_{k̄}, the map sending a character to the class of the pushed-out 𝔾_m-torsor. A universal torsor is a T-torsor of type the identity. Universal torsors exist iff the type obstruction δ(id)∈H²(k,T) vanishes; they exist when X(k) ≠ ∅; any two differ by twisting by H¹(k, T).

Hypotheses and conventions:

- X smooth geometrically integral with only constant invertible functions geometrically and Pic X_{k̄} free of finite rank (Colliot-Thélène–Sansuc).

Construction or proof:

1. Type map: the Hochschild–Serre spectral sequence for H¹(X, T') gives H¹(k, T') → H¹(X, T') → Hom_k(T̂', Pic X_{k̄}) → H²(k, T') (Colliot-Thélène–Sansuc); the type of a torsor is its image.
2. Twisting acts simply transitively on torsors of a fixed type (torsor-evaluation).
3. Here δ is the connecting map in the stated type exact sequence and id:T̂→Pic X_{k̄} defines the universal type. The existence assertion is δ(id)=0. No undefined Ext-valued elementary-obstruction carrier is introduced; comparison with that obstruction is a separate theorem.

Planning API:

- `TauCeti.ToricTorsor.type` (constructor): The type T̂' → Pic X_{k̄} of a torus torsor.
- `TauCeti.UniversalTorsor` (structure): A torsor of type id under the Néron–Severi torus.
- `TauCeti.UniversalTorsor.exists_of_point` (other): X(k) ≠ ∅ ⇒ a universal torsor exists.
- `TauCeti.UniversalTorsor.twist_transitive` (characterisation): Universal torsors form a principal homogeneous space under H¹(k, T).
- `TauCeti.UniversalTorsor.projectiveSpace` (example): 𝔸^{n+1} ∖ {0} → ℙⁿ is universal.

Unit tests:

- **UniversalTorsor.test_projective** (computation): 𝔸^{n+1} ∖ 0 → ℙⁿ is a universal torsor.
- **UniversalTorsor.test_point_trivial_pic** (degenerate): If Pic X_{k̄} = 0 the torus is trivial and the universal torsor is X itself.
- **UniversalTorsor.test_conic** (compatibility): For a pointless conic the degree-one generator of Pic(C_k̄)=ℤ is Galois invariant, and the Picard scheme has a corresponding rational class. It is not represented by a degree-one line bundle on C; δ(id) is the nonzero conic Brauer class, so no universal torsor of this type exists.
- **UniversalTorsor.test_type_matters** (non-example): A 𝔾_m-torsor over ℙ¹ of type 2 (from O(2)) is not universal.

Checks:

- For X = ℙⁿ, Pic X_{k̄} = ℤ, T = 𝔾_m and the universal torsor is 𝔸^{n+1} ∖ {0} → ℙⁿ.

Consumers:

- Harpaz–Wittenberg 2020 §6–7 (PAPER-HARPAZ-WITTENBERG-20/94): Brauer–Manin points imply existence of universal torsors
- RP.3/torus-descent-brauer: descent by torsors under tori compares with Br₁

Direct prerequisites:

- `SchemeAndStackFoundations:SF.1`
- [Evaluation of torsors and twisted torsors](#RP3-torsor-evaluation) (`HeightsRationalPointsAndObstructions:RP.3/torsor-evaluation`)
- `SchemeAndStackFoundations:SF.3`

Sources:

- [Y. Harpaz, O. Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §2, p. 8; §6, proofs of Théorèmes 6.1 and 6.6; §7, Proposition 7.8. Torsors under tori over X, their types, and universal torsors in the arguments of the paper.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP3-torus-descent-brauer"></a>
### Descent under tori and the algebraic Brauer group

*Theorem · node `HeightsRationalPointsAndObstructions:RP.3/torus-descent-brauer` · declaration `TauCeti.brauerOne_set_eq_universalTorsor_union` · module `TauCeti/NumberTheory/Descent/Torsor`*

Let X be smooth geometrically integral over a number field k with k̄[X]^× = k̄^× and Pic X_{k̄} free of finite rank. If X is moreover proper, every adelic point orthogonal to Br₁ X lifts to the adelic points of some universal torsor: X(𝔸)^{Br₁} = ⋃_{Y universal} f_Y(Y(𝔸)). More generally, for a torsor f : Y → X under a torus T and A ⊇ the cup products H¹(k, T̂) ∪ [f] in Br X, every point of X(𝔸)^A lifts to Y^σ(𝔸) for some σ.

Hypotheses and conventions:

- X smooth geometrically integral over a number field; the hypotheses on units and Pic for the universal-torsor statement.

Construction or proof:

1. Classical descent (Colliot-Thélène–Sansuc; Harari–Skorobogatov 2013 Theorem 8.4 and Proposition 8.12): the obstruction to lifting (x_v) is an element of Ш²(k, T) paired with x_v through the cup products, killed by orthogonality to H¹(k, T̂) ∪ [f] via Poitou–Tate for tori (ArithmeticGaloisDuality R02.4/torus-sha-duality).
2. Harpaz–Wittenberg 2020 Proposition 2.5 states the case used there.

Checks:

- For X = ℙⁿ both sides are X(𝔸).

Direct prerequisites:

- [Universal torsors and torsors of a given type](#RP3-universal-torsor) (`HeightsRationalPointsAndObstructions:RP.3/universal-torsor`)
- [Descent obstruction sets](#RP3-descent-set) (`HeightsRationalPointsAndObstructions:RP.3/descent-set`)
- [Constant and algebraic Brauer groups](#RP2-algebraic-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/algebraic-brauer-group`)
- [The Brauer–Manin pairing and set for varieties](#RP2-brauer-manin-general) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general`)
- `ArithmeticGaloisDuality:R02.4/torus-sha-duality`

Sources:

- [Y. Harpaz, O. Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), Proposition 2.5 and proof, p. 10, citing Harari–Skorobogatov 2013 Theorem 8.4 and Proposition 8.12. Every adelic point orthogonal to A lifts to some twist Y^σ(𝔸); the cup products H¹(k, T̂) ∪ [f] lie in ker f* ⊆ A.

Outstanding proof or supplier contracts: Deep descent comparisons and universal torsor existence.

<a id="RP3-relative-algebraic-brauer"></a>
### The relative algebraic Brauer group of a torus torsor

*Definition · node `HeightsRationalPointsAndObstructions:RP.3/relative-algebraic-brauer` · module `TauCeti/NumberTheory/Descent/TorusTorsor`*

For a morphism f : Y → X of k-varieties, Br₁(Y/X) is the subgroup of Br Y of classes whose image in Br Y_{k̄} lies in the image of Br X_{k̄} → Br Y_{k̄}. For f a torsor under a k-torus T and Y smooth, Br_nr(Y) ⊆ Br₁(Y/X), since Y_{k̄} is birationally X_{k̄} × T_{k̄}. Under the hypotheses of Harpaz–Wittenberg §2 there is an exact sequence Br X → Br₁(Y^σ/X) --φ_σ--> H²(k, T̂) --δ_σ--> H³(X, 𝔾_m) from the Leray and Hochschild–Serre spectral sequences; pullbacks from Br X are killed by φ_σ, and the last group is H³(X, 𝔾_m) (not H³(k, 𝔾_m)).

Hypotheses and conventions:

- f : Y → X a torsor under a k-torus T; Y, X smooth geometrically integral; k of characteristic 0.

Construction or proof:

1. Membership is an image condition, not a quotient equality.
2. Br_nr(Y) ⊆ Br₁(Y/X): unramified classes on X_{k̄} × T_{k̄} come from X_{k̄} (Br_nr of a torus over k̄ is 0).
3. The edge sequence: Leray for f and Hochschild–Serre for k̄/k (Harpaz–Wittenberg 2020 (2.2)).

Planning API:

- `TauCeti.relativeBrauerOne` (constructor): Br₁(Y/X) ≤ Br Y.
- `TauCeti.relativeBrauerEdge` (constructor): φ_σ : Br₁(Y^σ/X) → H²(k, T̂).
- `TauCeti.relativeBrauerEdge_exact` (relation): Br X → Br₁(Y^σ/X) → H²(k, T̂) → H³(X, 𝔾_m) is exact.
- `TauCeti.unramifiedBrauer_le_relativeBrauerOne` (other): Br_nr(Y) ≤ Br₁(Y/X) for torus torsors.
- `TauCeti.pullback_mem_relativeBrauerOne` (simp): f*Br X ≤ Br₁(Y/X).

Unit tests:

- **relativeBrauerOne.test_pullback** (degenerate): Pullbacks from Br X belong to Br₁(Y/X) and have φ_σ = 0.
- **relativeBrauerOne.test_trivial_torsor** (computation): For Y = X × 𝔾_m and α = pr₂*(χ, t) for a character class, φ(α) is the class of χ in H²(k, ℤ) ≅ H¹(k, ℚ/ℤ).
- **relativeBrauerOne.test_contains_unramified** (compatibility): Br_nr(Y) ≤ Br₁(Y/X) for every torus torsor.
- **relativeBrauerOne.test_last_term** (non-example): The target of δ_σ is H³(X, 𝔾_m), which can be nonzero for number fields although H³(k, 𝔾_m) = 0.

Checks:

- For Y = X × T (trivial torsor), Br₁(Y/X) ⊇ pr₁*Br X + pr₂*Br₁ T.

Consumers:

- Harpaz–Wittenberg 2020 Proposition 2.3 and Theorem 2.1: the edge map φ_σ and its twist independence

Direct prerequisites:

- [Constant and algebraic Brauer groups](#RP2-algebraic-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/algebraic-brauer-group`)
- [The unramified Brauer group](#RP2-unramified-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/unramified-brauer-group`)
- [Evaluation of torsors and twisted torsors](#RP3-torsor-evaluation) (`HeightsRationalPointsAndObstructions:RP.3/torsor-evaluation`)
- `SchemeAndStackFoundations:key/scheme-brauer`

Sources:

- [Y. Harpaz, O. Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §2, display (2.4), author-copy p.9. Defines Br₁(Y/X), shows Br_nr(Y) ⊆ Br₁(Y/X) for torus torsors, and gives the relative Brauer edge sequence.

<a id="RP3-edge-map-twist-independence"></a>
### Twist independence of the relative Brauer edge maps

*Theorem · node `HeightsRationalPointsAndObstructions:RP.3/edge-map-twist-independence` · declaration `TauCeti.relativeBrauerEdge_twist_indep` · module `TauCeti/NumberTheory/Descent/Torsor`*

In the setting of relative-algebraic-brauer, with σ ranging over H¹(k, T): (i) if H³(k, 𝔾_m) = 0 the map δ_σ : H²(k, T̂) → H³(X, 𝔾_m) does not depend on σ; (ii) if H³(k, 𝔾_m) = 0, the subgroup φ_σ(Br_nr(Y^σ)) ⊆ H²(k, T̂) does not depend on σ; (iii) without that hypothesis, f_σ*^{-1}(Br_nr(Y^σ)) ⊆ Br X does not depend on σ; (iv) for every extension L/k, α ∈ Br₁(Y^σ/X), y ∈ Y^σ(L) and t ∈ T(L), α(t·y) = α(y) + φ_σ(α) ∪ t in Br L (character evaluation pairing). For a torus torsor Z over k, Br₁(Z) = H²(k, k̄[Z]^×) with edge map to H²(k, T̂), onto when H³(k, 𝔾_m) = 0, and α(t·z) − α(z) = φ(α) ∪ t.

Hypotheses and conventions:

- H³(k, 𝔾_m) = 0 in (i)–(ii), true for number fields and their completions.

Construction or proof:

1. δ_σ is the cup product with the class of f_σ up to a fixed sign; the difference for two twists factors through H³(k, 𝔾_m) (Harpaz–Wittenberg Proposition 2.3(i)).
2. (ii)–(iii) from (i) and the birational description of Br_nr; (iv) from Lemma 2.4 applied to the fibre torsor over L.

Checks:

- For T = 𝔾_m and a 𝔾_m-torsor over Spec k, α(t·z) − α(z) = (χ, t) for the character class χ = φ(α).

Direct prerequisites:

- [The relative algebraic Brauer group of a torus torsor](#RP3-relative-algebraic-brauer) (`HeightsRationalPointsAndObstructions:RP.3/relative-algebraic-brauer`)
- [Evaluation of scheme Brauer classes at points](#RP2-scheme-brauer-evaluation) (`HeightsRationalPointsAndObstructions:RP.2/scheme-brauer-evaluation`)

Sources:

- [Y. Harpaz, O. Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §2, Lemma 2.4 and its proof, author-copy p.10. Twist independence of δ_σ, of the unramified edge image and of pulled-back unramified classes; the translation formula for evaluation; the torus torsor over a field.

<a id="RP3-residual-sha-functional"></a>
### The residual Tate–Shafarevich functional

*Construction · node `HeightsRationalPointsAndObstructions:RP.3/residual-sha-functional` · module `TauCeti/NumberTheory/Descent/TorusTorsor`*

In the setting of Harpaz–Wittenberg Theorem 2.1 (k a number field, f : Y → X a T-torsor, (x_v) ∈ X(𝔸)^A), choose an adelic lift y = (y_v) ∈ Y(𝔸) and identify the common edge image. For τ ∈ Ш¹(k, T) define ε_τ on Ш²(k, T̂) ∩ φ₀(Br_nr(Y)) by ε_τ(a) = Σ_v inv_v α_τ(y_v^τ) for any α_τ ∈ Br_nr(Y^τ) with φ_τ(α_τ) = a. The value does not depend on the choices, ε is additive, and ε_τ(a) = ε₀(a) + ⟨a, τ⟩ for the Poitou–Tate pairing ⟨,⟩ : Ш²(k, T̂) × Ш¹(k, T) → ℚ/ℤ. Here A=(f*)⁻¹Br_nr(Y) is the precise orthogonality subgroup. With Poonen’s twist parameter τ, HW’s parameter is σ=−τ; hence ε_τ(a)=ε₀(a)+⟨a,τ⟩.

Hypotheses and conventions:

- k a number field; twist and Poitou–Tate sign conventions as fixed in torsor-evaluation and ArithmeticGaloisDuality R02.4/torus-sha-duality.

Construction or proof:

1. Independence of α_τ: two choices differ by a pullback from Br X, which pairs to 0 with x_v ∈ X(𝔸)^A.
2. Independence of y: changing y_v by t_v ∈ T(k_v) changes the sum by Σ_v inv_v(a ∪ t_v) = 0 since a is locally trivial (edge-map-twist-independence (iv)).
3. Variation: compare the twists by σ through (iv) and the definition of the Poitou–Tate pairing (Harpaz–Wittenberg Proposition 2.6).

Planning API:

- `TauCeti.residualShaFunctional` (constructor): ε_τ : Ш²(k, T̂) ∩ φ₀(Br_nr Y) → ℚ/ℤ.
- `TauCeti.residualShaFunctional_indep_lift` (extensionality): ε_τ does not depend on the adelic lift or on α_τ.
- `TauCeti.residualShaFunctional_add` (simp): ε_τ is additive.
- `TauCeti.residualShaFunctional_twist` (relation): ε_τ(a) = ε₀(a) + ⟨a, τ⟩.

Unit tests:

- **residualShaFunctional.test_split_torus** (degenerate): For T split, Ш²(k, T̂) = 0 and ε is trivial.
- **residualShaFunctional.test_pullback_change** (computation): Changing α_τ by f_τ*β with β ∈ A changes the defining sum by 0.
- **residualShaFunctional.test_poitou_tate** (compatibility): The variation formula uses the Poitou–Tate pairing of ArithmeticGaloisDuality R02.4.
- **residualShaFunctional.test_domain** (non-example): ε is not defined on all of Ш²(k, T̂): outside the edge image φ₀(Br_nr Y) there is no α_τ to evaluate.

Checks:

- If Ш²(k, T̂) = 0 (for example T split), ε is the zero functional on the zero group.

Consumers:

- Harpaz–Wittenberg 2020 Proposition 2.7 and Theorem 2.1: vanishing of ε₀ allows full unramified orthogonality after translating local points

Direct prerequisites:

- [Twist independence of the relative Brauer edge maps](#RP3-edge-map-twist-independence) (`HeightsRationalPointsAndObstructions:RP.3/edge-map-twist-independence`)
- [Descent under tori and the algebraic Brauer group](#RP3-torus-descent-brauer) (`HeightsRationalPointsAndObstructions:RP.3/torus-descent-brauer`)
- `ArithmeticGaloisDuality:R02.4/torus-sha-duality`

Sources:

- [Y. Harpaz, O. Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §2, unnumbered definition of ε and its variation formula, author-copy pp.10–11. Definition and well-definedness of the residual functional ε_τ and its variation ε_τ = ε₀ − ⟨·, σ⟩.

<a id="RP3-unramified-torus-descent"></a>
### Unramified descent for torus torsors

*Theorem · node `HeightsRationalPointsAndObstructions:RP.3/unramified-torus-descent` · declaration `TauCeti.unramified_torus_descent` · module `TauCeti/NumberTheory/Descent/Torsor`*

Let k be a number field, X smooth geometrically integral and f : Y → X a torsor under a k-torus T. Put A = f*^{-1}(Br_nr(Y)) ⊆ Br X. Then X(𝔸_k)^A ⊆ ⋃_{σ ∈ H¹(k,T)} f_σ(Y^σ(𝔸_k)^{Br_nr(Y^σ)}). If X is proper then A = Br X. No rational connectedness is assumed.

Hypotheses and conventions:

- k a number field; X smooth geometrically integral; T a k-torus.

Construction or proof:

1. Lift (x_v) to some twist Y^σ(𝔸) (torus-descent-brauer, Harpaz–Wittenberg Proposition 2.5).
2. Choose σ in its Ш¹-coset so that ε_σ = 0 (residual-sha-functional and Poitou–Tate perfectness).
3. With ε_σ = 0, extend the evaluation functional through the edge image to H²(k, T̂); adelic torus duality supplies (t_v) with y_v ↦ t_v^{-1}y_v orthogonal to Br_nr(Y^σ) (Proposition 2.7, using edge-map-twist-independence (iv)).

Checks:

- For T = 1 the statement is X(𝔸)^{Br_nr} ⊆ X(𝔸)^{Br_nr}.

Direct prerequisites:

- [Descent under tori and the algebraic Brauer group](#RP3-torus-descent-brauer) (`HeightsRationalPointsAndObstructions:RP.3/torus-descent-brauer`)
- [The residual Tate–Shafarevich functional](#RP3-residual-sha-functional) (`HeightsRationalPointsAndObstructions:RP.3/residual-sha-functional`)
- [Twist independence of the relative Brauer edge maps](#RP3-edge-map-twist-independence) (`HeightsRationalPointsAndObstructions:RP.3/edge-map-twist-independence`)
- [The unramified pairing on the full product of local points](#RP2-unramified-pairing-full-product) (`HeightsRationalPointsAndObstructions:RP.2/unramified-pairing-full-product`)
- `ArithmeticGaloisDuality:R02.4/torus-sha-duality`

Sources:

- [Y. Harpaz, O. Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §2, Theorem 2.1 and proof, author-copy pp.8–11. Adelic points orthogonal to the pulled-back unramified classes lift to Brauer–Manin points of some twist; A = Br X for proper X.

<a id="RP3-open-torus-torsor-descent"></a>
### Descent from a torus torsor over a dense open subset

*Theorem · node `HeightsRationalPointsAndObstructions:RP.3/open-torus-torsor-descent` · declaration `TauCeti.open_torus_torsor_descent` · module `TauCeti/NumberTheory/Descent/Torsor`*

Let X be a smooth proper rationally connected variety over a number field k, V ⊆ X dense open and f : W → V a torsor under a k-torus. Then X(𝔸_k)^{Br X} is contained in the closure in X(𝔸_k) of ⋃_σ f_σ(W^σ(𝔸_k)^{Br_nr(W^σ)}). The input is that A = f*^{-1}Br_nr(W) ⊆ Br V has A/(A ∩ Br X) finite: after deleting a codimension ≥ 2 subset the compactified morphism is flat, and geometric codimension-one fibres have a multiplicity-one component.

Hypotheses and conventions:

- X smooth proper rationally connected; V dense open; W → V a torus torsor.

Construction or proof:

1. Finite quotient A/Br X (Colliot-Thélène–Skorobogatov 2000, proof of Lemma 3.1, as invoked by Harpaz–Wittenberg).
2. Harari's formal lemma (RP.2/formal-lemma) gives density of V(𝔸)^A in X(𝔸)^{A ∩ Br X} ⊇ X(𝔸)^{Br X}; apply unramified-torus-descent on V (Harpaz–Wittenberg Corollary 2.2).

Checks:

- For V=𝔸ⁿ⊂ℙⁿ and the trivial torus torsor V×𝔾_mⁿ→V, the conclusion specializes to density of the affine open in the proper adelic space. The coordinatewise inclusion 𝔾_mⁿ→𝔸ⁿ is not a torsor over 𝔸ⁿ.

Direct prerequisites:

- [Unramified descent for torus torsors](#RP3-unramified-torus-descent) (`HeightsRationalPointsAndObstructions:RP.3/unramified-torus-descent`)
- [Harari's formal lemma](#RP2-formal-lemma) (`HeightsRationalPointsAndObstructions:RP.2/formal-lemma`)
- [The unramified Brauer group](#RP2-unramified-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/unramified-brauer-group`)

Sources:

- [Y. Harpaz, O. Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), Corollaire 2.2 and proof, p. 8, citing Colliot-Thélène–Skorobogatov 2000 Proposition 1.1 and the proof of Lemma 3.1. Descent from an open torus torsor on a smooth proper rationally connected variety, via the finite ramification quotient and the formal lemma.

Outstanding proof or supplier contracts: Formal lemma auxiliary-place proof.

<a id="RP3-brauer-manin-universal-torsor-existence"></a>
### Brauer–Manin points give universal torsors

*Theorem · node `HeightsRationalPointsAndObstructions:RP.3/brauer-manin-universal-torsor-existence` · declaration `TauCeti.exists_universalTorsor_of_brauerManin` · module `TauCeti/NumberTheory/Descent/Torsor`*

For a smooth proper geometrically rationally connected variety X over a number field k, if X(𝔸_k)^{Br X} ≠ ∅ then a universal torsor over X exists over k. More generally, for a torus T' and a type λ : T̂' → Pic X_{k̄}, the obstruction to the existence of a torsor of type λ is detected by Br₁ X, and vanishes when X(𝔸)^{Br₁} ≠ ∅.

Hypotheses and conventions:

- X smooth proper geometrically rationally connected (so k̄[X]^× = k̄^× and Pic X_{k̄} is free of finite rank).

Construction or proof:

1. The existence obstruction of a torsor of type λ lies in H²(k, T') and pairs with the adelic point through Br₁ X by Poitou–Tate (Colliot-Thélène–Sansuc; Skorobogatov 2001 Proposition 6.1.4, as invoked by Harpaz–Wittenberg §6–7).

Checks:

- If X(k) ≠ ∅ the conclusion holds trivially.

Direct prerequisites:

- [Universal torsors and torsors of a given type](#RP3-universal-torsor) (`HeightsRationalPointsAndObstructions:RP.3/universal-torsor`)
- [Constant and algebraic Brauer groups](#RP2-algebraic-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/algebraic-brauer-group`)
- [The Brauer–Manin pairing and set for varieties](#RP2-brauer-manin-general) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general`)
- `ArithmeticGaloisDuality:R02.4/torus-sha-duality`

Sources:

- [Y. Harpaz, O. Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §6, proofs of Théorèmes 6.1 and 6.6; §7, Proposition 7.8. Brauer–Manin points imply existence over k of a universal torsor (citing Skorobogatov, Torsors and rational points, Proposition 6.1.4); the prescribed-type version through the type obstruction.

Outstanding proof or supplier contracts: Deep descent comparisons and universal torsor existence.

<a id="RP3-genus-one-torsors"></a>
### Genus-one curves as torsors and the Weil–Châtelet group

*Comparison · node `HeightsRationalPointsAndObstructions:RP.3/genus-one-torsors` · declaration `TauCeti.genusOne_torsor_equiv_weilChatelet` · module `TauCeti/NumberTheory/Descent/Torsor`*

Let E be an elliptic curve over a field k. A smooth projective genus-one curve C over k with Jacobian E is a torsor under E, and isomorphism classes of such torsors are in bijection with the Weil–Châtelet group WC(E/k) = H¹(k, E(k^s)) of TauCetiRoadmap EllipticCurves Layer 7; the trivial class corresponds to E, i.e. to C(k) ≠ ∅. Over a number field Ш(E/k) ⊆ WC(E/k) consists of the everywhere locally soluble C. This is a different classification from the pointed twists of EllipticCurves Layer 5 (H¹(k, Aut(E, O))): a pointed twist always has a rational point. The H¹(k,E) classification fixes an identification of the Jacobian with E and uses E-equivariant isomorphisms. Unmarked genus-one curves with Jacobian isomorphic to E require the further Aut(E)-orbit quotient.

Hypotheses and conventions:

- k a field; E elliptic; C smooth projective of genus one with Pic⁰_C ≅ E.

Construction or proof:

1. C is an E-torsor through the action of Pic⁰ on Pic¹ ≅ C (SchemeAndStackFoundations SF.3/genus-one-curves); torsor classes are H¹(k, E) (SF.1/torsor-cohomology with Poonen Theorem 6.5.10).
2. A torsor is trivial iff it has a k-point (Poonen Proposition 5.12.14).
3. Comparison with Layer 5: the forgetful map from pointed twists to curves lands in the trivial torsor classes of the twisted Jacobians.

Checks:

- The genus-one curve 2w² = x⁴ + 1 of Poonen §8.3 has the point (1, 1), so it is the trivial torsor under its Jacobian.

Direct prerequisites:

- `SchemeAndStackFoundations:SF.3`
- `SchemeAndStackFoundations:SF.1`
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`
- [Evaluation of torsors and twisted torsors](#RP3-torsor-evaluation) (`HeightsRationalPointsAndObstructions:RP.3/torsor-evaluation`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §5.12, Example 5.12.12 (genus-one curves as torsors under the Albanese/Jacobian) and Proposition 5.12.14, pp. 153–155. A nice genus-one curve is a torsor under its Jacobian; a torsor is trivial iff it has a rational point.
- [Tau Ceti roadmap authors, *EllipticCurves roadmap, Layer 7: Selmer groups and Sha*](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves), TauCetiRoadmap EllipticCurves, Layer 7 (Weil–Châtelet group) and Layer 5 (pointed twists). WC(E/K) as cohomology, with its geometric reading assigned to the scheme-facing roadmap; pointed twists are a different theory.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP3-bgw-hasse-failures"></a>
### Hasse principle failures for J¹ and Sym^k C with Brauer–Manin obstruction

*Application · node `HeightsRationalPointsAndObstructions:RP.3/bgw-hasse-failures` · declaration `TauCeti.bgw_hasse_failures` · module `TauCeti/NumberTheory/Descent/Torsor`*

For hyperelliptic curves C : y² = f(x) over ℚ of genus g ≥ 1 (deg f = 2g + 2), ordered by height: for fixed g a positive proportion of everywhere locally soluble C have J¹(ℚ) = ∅ with a Brauer–Manin obstruction on the g-dimensional variety J¹ (Bhargava–Gross–Wang Theorem 10); for fixed odd k > 0 the proportion of locally soluble C for which Sym^k(C) fails the Hasse principle tends to 1 as g → ∞, and the failure is a Brauer–Manin obstruction (Corollary 9, Theorem 11).

Hypotheses and conventions:

- Density statements for the family of locally soluble hyperelliptic curves ordered by the height of f.

Construction or proof:

1. Sel₂(J¹) = ∅ (RP.1/selmer-set-two-covering) gives a descent obstruction by the J[2]-torsor of two-coverings; for torsors under abelian varieties this descent obstruction is a Brauer–Manin obstruction (descent-brauer-comparison together with Manin's interpretation of Ш through Br₁).
2. The density statements are the averaging theorems of Bhargava–Gross–Wang, imported as stated.

Checks:

- For g = 1, J¹ ≅ C and Theorem 10 gives a positive proportion of locally soluble genus-one curves with no rational point.

Direct prerequisites:

- [The 2-Selmer set Sel₂(J¹) and the 2-Selmer set of order k](#RP1-selmer-set-two-covering) (`HeightsRationalPointsAndObstructions:RP.1/selmer-set-two-covering`)
- [Two-coverings of torsors and the class W[2]](#RP1-two-coverings) (`HeightsRationalPointsAndObstructions:RP.1/two-coverings`)
- [Descent obstruction sets](#RP3-descent-set) (`HeightsRationalPointsAndObstructions:RP.3/descent-set`)
- [Descent is at least as strong as Brauer–Manin](#RP3-descent-brauer-comparison) (`HeightsRationalPointsAndObstructions:RP.3/descent-brauer-comparison`)
- [Genus-one curves as torsors and the Weil–Châtelet group](#RP3-genus-one-torsors) (`HeightsRationalPointsAndObstructions:RP.3/genus-one-torsors`)

Sources:

- [M. Bhargava, B. H. Gross, X. Wang, *A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension*](https://arxiv.org/abs/1310.7692v2), Corollary 9, Theorems 10–11, p. 3. Positive-proportion Hasse principle failures for J¹ and Sym^k(C), explained by the Brauer–Manin obstruction.

Outstanding proof or supplier contracts: Manin's interpretation of Ш through the Brauer–Manin pairing; Deep descent comparisons and universal torsor existence.

<a id="RP3-descent-worked-example"></a>
### A worked descent: y² = (x² + 1)(x⁴ + 1)

*Application · node `HeightsRationalPointsAndObstructions:RP.3/descent-worked-example` · declaration `TauCeti.descent_example_genus_two` · module `TauCeti/NumberTheory/Descent/Torsor`*

For the genus-two curve X : y² = (x² + 1)(x⁴ + 1) over ℚ, the μ₂-torsors Z_c → X given by c·w² = x⁴ + 1 (c ∈ ℚ^×/ℚ^{×2}) partition X(ℚ) (descent-partition); only c ∈ {1, 2} are everywhere locally soluble (the Selmer set); Z_c maps to the genus-one curves Y₁ : w² = x⁴ + 1 and Y₂ : 2w² = x⁴ + 1, birational respectively to the rank-zero elliptic curves y² = x³ − 4x and y² = x³ − x; hence X(ℚ) consists of the six affine points (0, ±1), (±1, ±2) and the two points at infinity. A rational point of X lifts to exactly one twist, and the other twists have no rational point although some are locally soluble at many places.

Hypotheses and conventions:

- Torsors under μ₂ over the genus-two curve; the rank computations are 2-descents (RP.1/elliptic-two-descent-example for y² = x³ − x).

Construction or proof:

1. Resultant argument: only p = 2 divides both factors, so X⁴ + Z⁴ = c W² with c ∈ {±1, ±2}, positivity forces c ∈ {1, 2} (Poonen §8.3).
2. Rank zero and torsion ℤ/2 × ℤ/2 of both elliptic curves give the finite point sets.
3. Specify the elliptic labels rather than reading an ordering into Poonen’s unordered pair. For w²=x⁴+1, X=2(w+1)/x² and Y=4(w+1)/x³ give Y²=X³−4X. The twist 2w²=x⁴+1 has Jacobian isomorphic to Y²=X³−X. Extend the birational maps across the missing points on the smooth projective models.

Checks:

- #X(ℚ) = 8 including the two rational points at infinity.

Direct prerequisites:

- [The descent partition of rational points](#RP3-descent-partition) (`HeightsRationalPointsAndObstructions:RP.3/descent-partition`)
- [The Selmer set of a torsor](#RP3-selmer-set-of-torsor) (`HeightsRationalPointsAndObstructions:RP.3/selmer-set-of-torsor`)
- [A complete elliptic 2-descent](#RP1-elliptic-two-descent-example) (`HeightsRationalPointsAndObstructions:RP.1/elliptic-two-descent-example`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.3 and §8.3.1, pp. 236–238. The descent computation for y² = (x² + 1)(x⁴ + 1), reduction to the twists c ∈ {1, 2} and the six affine solutions.

<a id="RP3-strong-approximation-failure"></a>
### Finite étale covers obstruct strong approximation

*Theorem · node `HeightsRationalPointsAndObstructions:RP.3/strong-approximation-failure` · declaration `TauCeti.not_strongApproximation_of_finiteEtale` · module `TauCeti/NumberTheory/Descent/Torsor`*

Let k be a global field, S a finite set of places and f : Y → X a finite étale morphism of geometrically integral k-varieties that is not an isomorphism. If X(𝔸^S) ≠ ∅ then X(k) is not dense in X(𝔸^S). Consequently a normal geometrically integral variety with X(𝔸^S) ≠ ∅ and X_{k^s} not algebraically simply connected fails strong approximation off S.

Hypotheses and conventions:

- k global; f finite étale of degree > 1; the adeles away from S.
- For function fields the assertion requires the analogous adelic-space construction for global fields. RP.2 currently provides its number-field specialization; the extension is recorded as a gap rather than silently supplied by it.

Construction or proof:

1. Spread out over O_{k,S}; integral points have fibres of bounded degree and ramification, so finitely many fibre types and an infinite set of places splitting all of them; at one such place the Lang–Weil estimate gives a local point that does not split, an open set avoided by X(k) (Poonen Theorem 8.4.10, Corollary 8.4.11).

Checks:

- 𝔾_m over ℚ with the squaring cover fails strong approximation off ∞.

Direct prerequisites:

- [The Selmer set of a torsor](#RP3-selmer-set-of-torsor) (`HeightsRationalPointsAndObstructions:RP.3/selmer-set-of-torsor`)
- [Adelic points of separated schemes of finite type](#RP2-adelic-points-general) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points-general`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.6, Theorem 8.4.10 and Corollary 8.4.11 with proofs, pp. 243–244. Minchev's theorem: a nontrivial finite étale cover prevents strong approximation.

Outstanding proof or supplier contracts: Global-function-field adelic and cohomology extension.

<a id="RP3-insufficiency-examples"></a>
### Insufficiency of the Brauer–Manin and descent obstructions

*Application · node `HeightsRationalPointsAndObstructions:RP.3/insufficiency-examples` · declaration `TauCeti.exists_brauerManin_insufficient` · module `TauCeti/NumberTheory/Descent/Torsor`*

(a) There is a nice ℚ-variety X (Skorobogatov's bielliptic surface, birational to (x² + 1)y² = (x² + 2)z² = 3(t⁴ − 54t² − 117t − 243)) with X(𝔸)^{Br} ≠ ∅ but X(ℚ) = ∅; its emptiness is explained by X(𝔸)^{ét,Br} = ∅, equivalently by a single torsor under a noncommutative finite étale group. (b) There is a nice ℚ-variety (Poonen's quadric bundle over a curve) with X(𝔸)^{ét,Br} ≠ ∅ but X(ℚ) = ∅, so even the descent obstruction is insufficient. In particular a nonempty Brauer–Manin set does not imply a rational point.

Hypotheses and conventions:

- Explicit constructions over ℚ; the statements are existence theorems.

Construction or proof:

1. (a) Brauer–Manin applied to the étale double cover Y → X by a product of genus-one curves and its twists (Poonen §8.6.1, Theorem 8.6.1, Remark 8.6.4).
2. (b) Poonen §8.6.2, Theorem 8.6.5 and Propositions 8.6.6–8.6.10, combined with etale-brauer-equals-descent.

Checks:

- Both examples are compatible with X(ℚ) ⊆ X(𝔸)^{ét,Br}.

Direct prerequisites:

- [The étale–Brauer set](#RP3-etale-brauer-set) (`HeightsRationalPointsAndObstructions:RP.3/etale-brauer-set`)
- [Étale–Brauer equals descent](#RP3-etale-brauer-equals-descent) (`HeightsRationalPointsAndObstructions:RP.3/etale-brauer-equals-descent`)
- [The Brauer–Manin pairing and set for varieties](#RP2-brauer-manin-general) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.6.1–8.6.2, Theorem 8.6.1, Definition 8.6.2, Remark 8.6.4, Theorem 8.6.5, Propositions 8.6.6–8.6.10, pp. 248–252. Skorobogatov's bielliptic counterexample beyond Brauer–Manin and Poonen's counterexample beyond étale–Brauer.

<a id="rp-4"></a>
## RP.4. Curves: Faltings and integral-point finiteness

Chevalley–Weil controls lifting fields, and the full-branch Kodaira–Parshin construction uses an étale 2-isogeny pullback followed by a branched double cover. At genus two the intermediate and final genera are 17 and 41. De Franchis gives a conditional implication from Shafarevich finiteness. The unconditional Mordell declaration imports RP.5’s independent Vojta–Bombieri assembly. Integral-point finiteness uses the number-field S-adic Subspace Theorem adapter; the function-field theorem retains its distinct primary-proof obligation.

**Named milestones:** [Chevalley–Weil theorem](#RP4-chevalley-weil), [Kodaira–Parshin construction](#RP4-kodaira-parshin-construction), [Parshin's reduction](#RP4-parshin-implication), [Faltings' theorem](#RP4-mordell-faltings), [Siegel's theorem](#RP4-siegel-theorem).

**Imported interfaces:** `HeightsRationalPointsAndObstructions:RP.1`, `HeightsRationalPointsAndObstructions:RP.2`, `HeightsRationalPointsAndObstructions:RP.3`, `HeightsRationalPointsAndObstructions:RP.5`, `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`, `ArithmeticGaloisDuality:R02.3/hermite-unramified-outside-finite`, `DiophantineApproximationAndTranscendence:DT.2/absolute-subspace-theorem-for-systems`, `DiophantineApproximationAndTranscendence:DT.2/p-adic-subspace-theorem`, `DiophantineApproximationAndTranscendence:DT.2/s-unit-equation-over-rationals`, `NeronModelsAndSemistableAbelianVarieties:R11.6/equation-good-comparison`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.4`.


<a id="RP4-good-reduction-curve"></a>
### Curves with good reduction outside S

*Definition · node `HeightsRationalPointsAndObstructions:RP.4/good-reduction-curve` · module `TauCeti/NumberTheory/RationalPoints/Shafarevich`*

Let K be a number field and S a finite set of places containing the archimedean ones. A smooth projective geometrically connected curve C over K has good reduction outside S if it extends to a smooth proper morphism 𝒞 → Spec O_{K,S} with geometrically connected fibres. Shafarevich's set Sh(K, S, g) is the set of K-isomorphism classes of such curves of genus g. The Shafarevich finiteness statement for (K, S, g) is the assertion that Sh(K, S, g) is finite.

Hypotheses and conventions:

- S finite, containing the archimedean places; g ≥ 0.

Construction or proof:

1. Smooth proper models over Dedekind bases (SchemeAndStackFoundations SF.3 models of curves); the predicate is stated as the existence of such a model.

Planning API:

- `TauCeti.Curve.HasGoodReductionOutside` (constructor): The predicate: C extends to a smooth proper curve over O_{K,S}.
- `TauCeti.Curve.shafarevichSet` (constructor): Sh(K, S, g) as a set of isomorphism classes.
- `TauCeti.Curve.ShafarevichFiniteness` (other): The proposition that Sh(K, S, g) is finite, for use as a hypothesis.
- `TauCeti.Curve.hasGoodReductionOutside_mono` (structure): Good reduction outside S implies good reduction outside every S' ⊇ S.
- `TauCeti.Curve.hasGoodReductionOutside_baseChange` (functoriality): Good reduction outside S over K implies good reduction outside the places above S over every finite L/K.

Unit tests:

- **HasGoodReductionOutside.test_projectiveLine** (computation): ℙ¹_K has good reduction outside S = archimedean places.
- **HasGoodReductionOutside.test_mono** (degenerate): If S⊆T are finite sets, good reduction outside S implies good reduction outside T; Spec K itself is not the spectrum of S-integers for a finite S.
- **HasGoodReductionOutside.test_elliptic** (compatibility): For an elliptic curve, good reduction outside S agrees with Tau Ceti's Weierstrass good reduction at each v ∉ S (NeronModels R11.6/equation-good-comparison).
- **HasGoodReductionOutside.test_bad_at_two** (non-example): y² = x³ − x over ℚ has good reduction outside {2, ∞} but not outside {∞}: it lies in Sh(ℚ, {2, ∞}, 1) and not in Sh(ℚ, {∞}, 1).

Checks:

- ℙ¹_K has good reduction everywhere; an elliptic curve has good reduction outside the primes dividing its minimal discriminant.

Consumers:

- Milne IV Theorem 5.1; Szpiro §5.2: the Kodaira–Parshin curves C_P have good reduction outside a fixed set
- FaltingsFinitenessAndIsogenyTheorems:R28.5: Faltings' Korollar 1 to Satz 6: Sh(K, S, g) is finite for g ≥ 2

Direct prerequisites:

- `SchemeAndStackFoundations:SF.3`
- `SchemeAndStackFoundations:SF.4`
- `NeronModelsAndSemistableAbelianVarieties:R11.6/equation-good-comparison`

Sources:

- [L. Szpiro, *La conjecture de Mordell (d'après G. Faltings)*](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf), §2.1, definition of Shafarevich sets and Exemple 1.1, pp. 85–86. Shafarevich sets of isomorphism classes of families over B = Spec O − S with prescribed fibres; finiteness of extensions of bounded degree unramified outside S (Hermite).
- [J. S. Milne, *Abelian Varieties*](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter IV, §1 (statement of the Shafarevich conjecture) and §5, pp. 132–133, 145. Curves with good reduction outside a finite set of primes and Shafarevich's conjecture.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP4-chevalley-weil"></a>
### The Chevalley–Weil theorem

*Theorem · node `HeightsRationalPointsAndObstructions:RP.4/chevalley-weil` · declaration `TauCeti.chevalley_weil` · module `TauCeti/NumberTheory/RationalPoints/Curves`*

Let k be a number field and f : Z → X a finite étale morphism of varieties over k with X proper (or, for integral points, a finite étale morphism of separated schemes of finite type over O_{k,S}). Then there is a finite extension k'/k such that X(k) ⊆ f(Z(k')); for integral points, every x ∈ 𝒳(O_{k,S}) lifts to Z over a field of degree ≤ deg f unramified outside S ∪ (ramification of the model), and these fields form a finite set (Hermite).

Hypotheses and conventions:

- f finite étale; X proper for the rational-point form.

Construction or proof:

1. Rational points: f is a torsor under a finite étale group after passing to a Galois closure, and Poonen Corollary 8.4.8 gives k' (RP.3/selmer-set-of-torsor).
2. Integral points: fibres are finite étale O_{k,S}-schemes of degree deg f, unramified outside S; finitely many such by Hermite's theorem (ArithmeticGaloisDuality R02.3/hermite-unramified-outside-finite).

Checks:

- For the étale double cover of y² = (x² + 1)(x⁴ + 1) by c w² = x⁴ + 1, k' = ℚ(√2) suffices.

Direct prerequisites:

- [The Selmer set of a torsor](#RP3-selmer-set-of-torsor) (`HeightsRationalPointsAndObstructions:RP.3/selmer-set-of-torsor`)
- `ArithmeticGaloisDuality:R02.3/hermite-unramified-outside-finite`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.4, Corollary 8.4.8 and proof, p. 242; §8.4.6, proof of Theorem 8.4.10, p. 243. A finite separable extension over which all rational points lift through a torsor over a proper variety; integral points have fibres of bounded degree and ramification, so finitely many fibre types.
- [L. Szpiro, *La conjecture de Mordell (d'après G. Faltings)*](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf), §1, Exemple 1.1, p. 86. Finiteness of finite étale O − S-schemes of given degree (Hermite).

<a id="RP4-de-franchis"></a>
### De Franchis' theorem

*Theorem · node `HeightsRationalPointsAndObstructions:RP.4/de-franchis` · declaration `TauCeti.Curve.finite_surjective_hom` · module `TauCeti/NumberTheory/RationalPoints/Curves`*

Let C' and C be smooth projective curves over a field k of characteristic zero with genus(C) ≥ 2. Then there are only finitely many nonconstant morphisms C' → C.

Hypotheses and conventions:

- genus(C) ≥ 2; C, C' smooth projective over k.
- Characteristic zero for the assertion about all nonconstant morphisms. In positive characteristic use separable morphisms; unrestricted Frobenius iterates invalidate finiteness.

Construction or proof:

1. Milne Chapter IV Theorem 5.2 (reference to Lang): nonconstant maps C' → C have bounded degree by Riemann–Hurwitz, form a scheme of finite type (Hom scheme), and a rigidity argument shows the relevant components are points; equivalently, the induced homomorphisms Jac C' → Jac C form a discrete subset of a finitely generated group with bounded degree.

Checks:

- For C' = C of genus ≥ 2, Aut(C) is finite (a special case).
- Over a finite field a genus≥2 curve has infinitely many nonconstant Frobenius self-maps. The separability or characteristic-zero qualification is essential.

Direct prerequisites:

- `SchemeAndStackFoundations:SF.3`
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`

Sources:

- [J. S. Milne, *Abelian Varieties*](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter IV, §5, Theorem 5.2 (de Franchis), p. 146. For C of genus at least 2 there are only finitely many nonconstant maps C' → C.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP4-kodaira-parshin-construction"></a>
### The Kodaira–Parshin construction

*Construction · node `HeightsRationalPointsAndObstructions:RP.4/kodaira-parshin-construction` · module `TauCeti/NumberTheory/RationalPoints/KodairaParshin`*

Let K be a number field, S a finite set of places containing the archimedean and dyadic ones, and C/K a smooth projective curve of genus g ≥ 1 with good reduction outside S. There are a finite extension L/K and, for every P ∈ C(K), a curve C_P over L and a finite morphism φ_P : C_P → C_L such that: (i) C_P has good reduction outside the places of L above S; (ii) the genus of C_P is bounded in terms of g (Szpiro: 2g(C_P) − 2 = 2^{2g}(4g − 3) for the double cover of the 2-isogeny pullback); (iii) φ_P is ramified exactly above P. Construction: pull back multiplication by 2 on the Jacobian along the Abel–Jacobi map Q ↦ [Q − P] to get an unramified cover C₁ → C of degree 2^{2g}; the preimage D of P has degree 2^{2g}; over an extension of degree ≤ 2^{2g₁} unramified outside S, where g₁=1+2^{2g}(g−1) is the genus of C₁, O(D) ≅ M^{⊗2}, and C_P is the double cover of C₁ ramified exactly along D defined by M; L is the compositum of the finitely many fields so obtained.

Hypotheses and conventions:

- S contains the archimedean and dyadic places; g ≥ 1 (g ≥ 2 is used only in the application through de Franchis).

Construction or proof:

1. The unramified cover C₁ → C from the 2-isogeny of the Jacobian (JacobianChallenge Layer F Abel–Jacobi; AbelianSchemesAndArithmeticModuli A3 multiplication by 2), with good reduction outside S since [2] is étale away from dyadic places.
2. Halve the class of the full branch divisor D in Pic(C₁), using multiplication by two on Jac(C₁). Its fibre has degree 2^{2g₁}, so this is a safe extension-degree bound; 2^{2g} is not justified for this step. The fibre is finite étale outside S; use Hermite–Minkowski/Chevalley–Weil to choose one common finite compositum.
3. Double covers in residue characteristic ≠ 2 ramify exactly where the order of the defining function is odd (Milne IV §5 remarks), giving (i) and (iii); Riemann–Hurwitz gives (ii).
4. This is Szpiro’s full branch-divisor construction, pp.97–98. Milne IV §5 uses a two-point branch variant with a different genus. Keep the two constructions distinct; the displayed full-branch genus is g_P=1+2^{2g−1}(4g−3).

Planning API:

- `TauCeti.KodairaParshin.field` (data): The finite extension L/K, depending only on (C, S).
- `TauCeti.KodairaParshin.curve` (constructor): C_P over L for P ∈ C(K).
- `TauCeti.KodairaParshin.map` (projection): φ_P : C_P → C_L, finite.
- `TauCeti.KodairaParshin.goodReduction` (other): C_P has good reduction outside the places above S.
- `TauCeti.KodairaParshin.genus_eq` (characterisation): The genus of C_P is an explicit function of g alone.
- `TauCeti.KodairaParshin.ramified_iff` (characterisation): φ_P is ramified at a point exactly when it lies above P.

Unit tests:

- **KodairaParshin.test_genus_formula** (computation): For g = 2, C₁ has genus 17 (2g₁ − 2 = 16·2), D has degree 16 and C_P has genus 41 (2g' − 2 = 16·5).
- **KodairaParshin.test_unramified_step** (degenerate): C₁ → C is unramified of degree 2^{2g}.
- **KodairaParshin.test_comparison_LV** (compatibility): φ_P : C_P → C_L is a cover branched exactly above one point, the kind of cover that the Kodaira–Parshin family of MordellLawrenceVenkatesh LV.8 parametrises for the group Aff(q).
- **KodairaParshin.test_branch** (non-example): φ_P is not unramified: an unramified C_P would not distinguish distinct points P, and the map P ↦ C_P would not be finite-to-one.

Checks:

- For g = 1, taking P as origin identifies C with its Jacobian, and C₁ → C is multiplication by 2.

Consumers:

- parshin-implication: Shafarevich finiteness and de Franchis make P ↦ C_P finite-to-one
- FaltingsFinitenessAndIsogenyTheorems:R28.5/mordell-conjecture-by-the-parshin-construction: Faltings' Satz 7 is the composite of this construction with Korollar 1 to Satz 6
- MordellLawrenceVenkatesh:LV.8/kodaira-parshin-family: Lawrence–Venkatesh use a Hurwitz-space variant with Aff(q)-covers branched at one point

Direct prerequisites:

- [Curves with good reduction outside S](#RP4-good-reduction-curve) (`HeightsRationalPointsAndObstructions:RP.4/good-reduction-curve`)
- [The Chevalley–Weil theorem](#RP4-chevalley-weil) (`HeightsRationalPointsAndObstructions:RP.4/chevalley-weil`)
- `SchemeAndStackFoundations:SF.3`
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`
- `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`

Sources:

- [J. S. Milne, *Abelian Varieties*](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter IV, §5, Theorem 5.1 and its proof, pp. 145–148. The Kodaira–Parshin construction: a finite extension L and covers C_P → C_L with good reduction outside S, bounded genus and ramification exactly at P.
- [L. Szpiro, *La conjecture de Mordell (d'après G. Faltings)*](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf), §5.2, pp. 97–98. The construction via the pullback of multiplication by 2 on the Jacobian, halving the divisor D over an extension étale outside S, and the double cover ramified along D; Mumford's variant.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP4-parshin-implication"></a>
### Parshin: Shafarevich finiteness implies Mordell

*Theorem · node `HeightsRationalPointsAndObstructions:RP.4/parshin-implication` · declaration `TauCeti.Curve.finite_of_shafarevich` · module `TauCeti/NumberTheory/RationalPoints/Curves`*

Let K be a number field and C/K a smooth projective geometrically connected curve of genus g ≥ 2. Let L, S' and g' be the data of kodaira-parshin-construction for C. If the Shafarevich finiteness statement holds for (L, S', g'), then C(K) is finite.

Hypotheses and conventions:

- The Shafarevich finiteness for curves over L of the bounded genus g' with good reduction outside S' is a hypothesis (supplied unconditionally by FaltingsFinitenessAndIsogenyTheorems R28.5).

Construction or proof:

1. By hypothesis the curves C_P, P ∈ C(K), fall into finitely many isomorphism classes over L.
2. For a fixed curve X over L, each P with C_P ≅ X gives a nonconstant map X → C_L ramified exactly above P, and distinct P give distinct maps; de Franchis (g ≥ 2) bounds their number (Milne IV §5).

Checks:

- For g = 1 the argument fails exactly at de Franchis: an elliptic curve of positive rank has infinitely many rational points.

Direct prerequisites:

- [The Kodaira–Parshin construction](#RP4-kodaira-parshin-construction) (`HeightsRationalPointsAndObstructions:RP.4/kodaira-parshin-construction`)
- [De Franchis' theorem](#RP4-de-franchis) (`HeightsRationalPointsAndObstructions:RP.4/de-franchis`)
- [Curves with good reduction outside S](#RP4-good-reduction-curve) (`HeightsRationalPointsAndObstructions:RP.4/good-reduction-curve`)

Sources:

- [J. S. Milne, *Abelian Varieties*](https://www.jmilne.org/math/CourseNotes/AV.pdf), Chapter IV, §5, deduction of Mordell from Theorems 5.1 and 5.2, p. 146. Shafarevich's conjecture with the Kodaira–Parshin construction and de Franchis gives finiteness of C(K).
- [L. Szpiro, *La conjecture de Mordell (d'après G. Faltings)*](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf), §5.2, last paragraph, p. 98. The map from C(K) to the Shafarevich set has finite fibres since C_P → C is ramified only at P and there are finitely many maps between curves of genus ≥ 2.

<a id="RP4-mordell-faltings"></a>
### The Mordell conjecture (Faltings' theorem)

*Theorem · node `HeightsRationalPointsAndObstructions:RP.4/mordell-faltings` · declaration `TauCeti.Curve.finite_rationalPoints` · module `TauCeti/NumberTheory/RationalPoints/Curves`*

For a smooth projective geometrically connected curve C of genus≥2 over a number field K, C(K) is finite. This roadmap owns one proposed declaration, with the independent Vojta–Bombieri route at RP.5/vojta-bombieri-mordell. The Parshin route at RP.4/parshin-implication remains a conditional comparison requiring finiteness of curves of fixed genus with good reduction outside S; that hypothesis is not imported from the higher-tier Faltings roadmap. FaltingsFinitenessAndIsogenyTheorems and MordellLawrenceVenkatesh may import the present rational-point theorem and Parshin construction when their later plans are synchronized.

Hypotheses and conventions:

- K a number field; g ≥ 2.

Construction or proof:

1. Use RP.5/vojta-bombieri-mordell for the unconditional declaration; its prerequisite graph uses neither this node nor Shafarevich finiteness.
2. Record RP.4/parshin-implication as a separate conditional proof route. Do not treat a missing lower-tier supplier for Shafarevich finiteness as discharged by an upward dependency.

Checks:

- For y² = (x² + 1)(x⁴ + 1) over ℚ (genus 2), the finite set has eight points (RP.3/descent-worked-example).
- The theorem gives no bound on heights and no algorithm.

Direct prerequisites:

- [Faltings' theorem by the Vojta–Bombieri route](#RP5-vojta-bombieri-mordell) (`HeightsRationalPointsAndObstructions:RP.5/vojta-bombieri-mordell`)
- [Parshin: Shafarevich finiteness implies Mordell](#RP4-parshin-implication) (`HeightsRationalPointsAndObstructions:RP.4/parshin-implication`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §9.5.1, Theorem 9.5.1 and Remark 9.5.2, p. 286. Faltings' theorem; Parshin's reduction to Shafarevich's conjecture; ineffectivity of all known proofs.
- [L. Szpiro, *La conjecture de Mordell (d'après G. Faltings)*](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf), §1, Théorème 1, p. 84. Statement of Mordell's conjecture as proved by Faltings.

<a id="RP4-integral-points"></a>
### S-integral points on affine curves

*Definition · node `HeightsRationalPointsAndObstructions:RP.4/integral-points` · module `TauCeti/NumberTheory/RationalPoints/IntegralPoints`*

Let K be a number field, S a finite set of places containing the archimedean ones, X an affine curve over K with smooth projective completion X̄, and 𝒳 a model of X over O_{K,S} (an affine O_{K,S}-scheme of finite type with generic fibre X). The S-integral points are 𝒳(O_{K,S}) ⊆ X(K). Different models give sets that differ by enlarging S; finiteness of 𝒳(O_{K,S}) for every model and every S is independent of the choices.

Hypotheses and conventions:

- X affine; the model is affine of finite type over O_{K,S}.

Construction or proof:

1. Models exist by spreading out and agree over O_{K,T} for T ⊇ S large (RP.2/integral-model-exists-unique).

Planning API:

- `TauCeti.IntegralPoints` (constructor): 𝒳(O_{K,S}) ⊆ X(K) for a model 𝒳.
- `TauCeti.IntegralPoints.mono` (structure): S ⊆ S' ⇒ 𝒳(O_{K,S}) ⊆ 𝒳(O_{K,S'}).
- `TauCeti.IntegralPoints.model_indep` (extensionality): Two models agree after enlarging S.
- `TauCeti.IntegralPoints.gm` (example): For 𝔾_m the integral points are O_{K,S}^×.

Unit tests:

- **IntegralPoints.test_gm** (computation): 𝔾_m(ℤ[1/2]) = {±2^n}.
- **IntegralPoints.test_affine_line** (degenerate): 𝔸¹(O_{K,S}) = O_{K,S} is infinite: genus 0 with one point at infinity.
- **IntegralPoints.test_s_units** (compatibility): ℙ¹ ∖ {0, 1, ∞} has integral points the solutions of the S-unit equation u + v = 1 (DT.2).
- **IntegralPoints.test_gm_infinite** (non-example): 𝔾_m(ℤ[1/2]) is infinite: two points at infinity are not enough for Siegel finiteness.

Checks:

- For X = 𝔾_m = 𝔸¹ ∖ {0} with model Spec O_{K,S}[t, 1/t], the S-integral points are the S-units O_{K,S}^×.

Consumers:

- siegel-theorem: finiteness of S-integral points
- DiophantineApproximationAndTranscendence:DT.2: S-unit equations are integral points on ℙ¹ minus three points

Direct prerequisites:

- [Integral models and their integral local points](#RP2-integral-model) (`HeightsRationalPointsAndObstructions:RP.2/integral-model`)
- [Integral models exist and agree at almost all places](#RP2-integral-model-exists-unique) (`HeightsRationalPointsAndObstructions:RP.2/integral-model-exists-unique`)

Sources:

- [L. Szpiro, *La conjecture de Mordell (d'après G. Faltings)*](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf), §1, statement of Siegel's theorem and the description of integral points as sections, p. 84. Integral points of an affine curve with respect to S as sections of a model over Spec O − S.

<a id="RP4-siegel-theorem"></a>
### Siegel's theorem on integral points

*Theorem · node `HeightsRationalPointsAndObstructions:RP.4/siegel-theorem` · declaration `TauCeti.Curve.finite_integralPoints` · module `TauCeti/NumberTheory/RationalPoints/Curves`*

Let K be a number field, S a finite set of places containing the archimedean ones, and X an affine curve over K with smooth projective completion X̄ of genus g. If g ≥ 1, or g = 0 and X̄ ∖ X has at least three geometric points, then 𝒳(O_{K,S}) is finite for every model 𝒳. The theorem is ineffective in general.

Hypotheses and conventions:

- X affine, geometrically irreducible; the boundary counted over K̄.

Construction or proof:

1. Reduction: by Chevalley–Weil, replace X by an unramified cover (pulled back from multiplication on the Jacobian when g ≥ 1) and K by a finite extension, so that the boundary has at least three points defined over K.
2. Corvaja–Zannier, pp.267–271: choose V_N of functions with poles bounded by N times the boundary. Riemann–Roch gives its dimension and bases with controlled vanishing at each boundary point. For each v∈S choose the relevant boundary point and its basis, then apply the number-field S-adic Subspace Theorem to these systems of independent linear forms. The pole/vanishing inequality confines integral points to finitely many proper linear sections; on a curve each section is finite. The rational-only product form is insufficient; request the precise number-field corollary of DT.2/absolute-subspace-theorem-for-systems.
3. Genus 0 with three boundary points is the S-unit equation (DT.2).

Checks:

- The S-unit equation u + v = 1 in units of ℤ[1/2] has exactly the three solutions (2, −1), (−1, 2), (1/2, 1/2).

Direct prerequisites:

- [S-integral points on affine curves](#RP4-integral-points) (`HeightsRationalPointsAndObstructions:RP.4/integral-points`)
- [The Chevalley–Weil theorem](#RP4-chevalley-weil) (`HeightsRationalPointsAndObstructions:RP.4/chevalley-weil`)
- `DiophantineApproximationAndTranscendence:DT.2/p-adic-subspace-theorem`
- `DiophantineApproximationAndTranscendence:DT.2/s-unit-equation-over-rationals`
- [The Kodaira–Parshin construction](#RP4-kodaira-parshin-construction) (`HeightsRationalPointsAndObstructions:RP.4/kodaira-parshin-construction`)
- `DiophantineApproximationAndTranscendence:DT.2/absolute-subspace-theorem-for-systems`

Sources:

- [L. Szpiro, *La conjecture de Mordell (d'après G. Faltings)*](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf), §1, Théorème [Si] (Siegel), p. 84. Finiteness of S-integral points on an affine curve when the genus is positive or the genus is zero with at least three points at infinity; no effective bound.
- [P. Corvaja, U. Zannier, *A subspace theorem approach to integral points on curves*](https://www.numdam.org/item/CRMATH_2002__334_4_267_0.pdf), Main theorem (C. R. Math. Acad. Sci. Paris 334 (2002), 267–271). A proof of Siegel's theorem by the Subspace Theorem for curves with at least three points at infinity.

Outstanding proof or supplier contracts: Number-field S-adic Subspace Theorem adapter.

<a id="RP4-function-field-mordell"></a>
### The Mordell conjecture over function fields

*Theorem · node `HeightsRationalPointsAndObstructions:RP.4/function-field-mordell` · declaration `TauCeti.Curve.isotrivial_of_infinite` · module `TauCeti/NumberTheory/RationalPoints/Curves`*

Let K be a function field with field of constants k (K = k(V), k algebraically closed in K) and X a regular projective geometrically integral K-curve of genus > 1 with X(K) infinite. If char k = 0, X is constant (X ≅ Y_K for a k-curve Y); if char k = p > 0, X is isotrivial (constant after a finite extension of K). Constant curves over ℂ(t) and Frobenius twists over 𝔽_q(t) show that the hypotheses cannot be dropped.

Hypotheses and conventions:

- K a function field with constant field k; X of genus > 1.

Construction or proof:

1. Manin, Grauert (characteristic 0) and Samuel, Voloch (characteristic p), as recorded in Poonen Theorem 9.5.10; induction on the transcendence degree reduces to trdeg K/k = 1.

Checks:

- For K = ℂ(t) and X = (X₀)_K, X(K) ⊇ X₀(ℂ) is infinite.

Direct prerequisites:

- [The Lang–Néron theorem](#RP1-lang-neron) (`HeightsRationalPointsAndObstructions:RP.1/lang-neron`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §9.5.2, Examples 9.5.3–9.5.5, Definitions 9.5.6–9.5.8 and Theorem 9.5.10, pp. 287–288. Over function fields, curves of genus > 1 with infinitely many points are constant (characteristic 0) or isotrivial (characteristic p).

Outstanding proof or supplier contracts: Function-field Mordell conjecture proofs.

<a id="rp-5"></a>
## RP.5. Subvarieties of abelian varieties and special sets

Scheme stabilizers, abelian quotients, generated subvarieties, Ueno loci and finite-rank groups organize the special sets. Manin–Mumford and Mordell–Lang describe torsion and finite-rank intersections; finiteness off the Ueno locus is a consequence of the coset decomposition. For curves, Mumford’s gap principle and Bombieri’s angle/norm-ratio inequality give an independent Mordell assembly. The difference map and equidistribution lead to Bogomolov, with generic sequences, admissible metrics and the higher-dimensional Arakelov inputs explicit.

**Named milestones:** [Ueno locus](#RP5-ueno-locus), [Manin–Mumford theorem](#RP5-manin-mumford), [Faltings' subvariety theorem](#RP5-faltings-subvarieties), [Mordell–Lang theorem](#RP5-mordell-lang), [Bogomolov conjecture](#RP5-bogomolov).

**Imported interfaces:** `HeightsRationalPointsAndObstructions:RP.0`, `HeightsRationalPointsAndObstructions:RP.1`, `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`, `AbelianSchemesAndArithmeticModuli:A6/curve-generated-subvariety`, `AbelianSchemesAndArithmeticModuli:A6/poincare-complete-reducibility`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.5`.


<a id="RP5-abelian-subvariety"></a>
### Abelian subvarieties, cosets and quotients

*Definition · node `HeightsRationalPointsAndObstructions:RP.5/abelian-subvariety` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Subvariety`*

Let A be an abelian variety over a field k. An abelian subvariety is a closed subgroup scheme B ⊆ A that is an abelian variety (smooth, connected, proper). A coset is a translate x + B with B an abelian subvariety and x ∈ A(k̄); a torsion coset is one with x torsion; a torsion subvariety is a finite union of torsion cosets. For every abelian subvariety B the quotient A → A/B exists as an abelian variety with kernel B, and by Poincaré reducibility there is a complementary abelian subvariety B' with B + B' = A and B ∩ B' finite.

Hypotheses and conventions:

- k any field; cosets are taken over k̄ unless stated.

Construction or proof:

1. Quotients by abelian subvarieties: the fppf quotient sheaf A/B (SF.1/quotient-sheaf) is an algebraic space by Artin's theorem (SF.1/artin-bootstrap), a proper smooth connected group space over a field, hence an abelian variety; over a field this is Conrad Theorem 3.7 for quotients by closed subgroups (Xie–Yuan, proof of Proposition 3.6). AbelianSchemesAndArithmeticModuli A3 treats finite subgroups only.
2. Complements: Poincaré complete reducibility (AbelianSchemesAndArithmeticModuli A6/poincare-complete-reducibility).

Planning API:

- `TauCeti.AbelianVariety.AbelianSubvariety` (structure): A closed subgroup scheme which is an abelian variety.
- `TauCeti.AbelianVariety.quotient` (constructor): A ⧸ B as an abelian variety with the projection A → A/B.
- `TauCeti.AbelianVariety.quotient_ker` (characterisation): The kernel of A → A/B is B.
- `TauCeti.AbelianVariety.exists_complement` (other): There is B' with B + B' = A and B ∩ B' finite.
- `TauCeti.AbelianVariety.IsCoset` (constructor): X = x + B for an abelian subvariety B.
- `TauCeti.AbelianVariety.IsTorsionCoset` (constructor): A coset x + B with x torsion.
- `TauCeti.AbelianVariety.IsTorsionSubvariety` (constructor): A finite union of torsion cosets.

Unit tests:

- **AbelianSubvariety.test_diagonal** (computation): The diagonal of E × E is an abelian subvariety with quotient E via (P, Q) ↦ P − Q.
- **AbelianSubvariety.test_zero** (degenerate): {0} and A are abelian subvarieties; A/A = 0 and A/{0} = A.
- **AbelianSubvariety.test_torsion_not_abelian** (non-example): For dim A>0, A[2] is not an abelian subvariety: in characteristic≠2 it is a nontrivial disconnected finite étale group scheme; in characteristic 2 it can be connected but is not smooth. Connectedness alone does not certify an abelian subvariety.
- **IsTorsionCoset.test_point** (computation): A torsion point {t} is a torsion coset with B = 0; a non-torsion point is a coset but not a torsion coset.

Checks:

- In A = E × E, the diagonal and the antidiagonal are abelian subvarieties meeting in E[2].

Consumers:

- Mordell–Lang, Manin–Mumford and Bogomolov: the exceptional sets are finite unions of cosets
- Gao–Ge–Kühne 2026 §1–2: cosets, abelian subvarieties generated by X − X, maximal cosets
- Xie–Yuan 2022 §§3–5: quotients by Stab⁰(X) and torsion subvarieties

Direct prerequisites:

- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`
- `AbelianSchemesAndArithmeticModuli:A6/poincare-complete-reducibility`
- `SchemeAndStackFoundations:SF.1`

Sources:

- [J. Xie, X. Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*](https://arxiv.org/abs/2108.09722v1), proof of Proposition 3.6, p. 16; proof of Lemma 5.3, p. 24. Quotients A → A/B by abelian subvarieties and the image X/Stab⁰(X).
- [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf), §3, Theorem 3.7, author copy p.6. Quotients of finite type group schemes over a field by closed subgroups.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP5-stabilizer"></a>
### Stabilizers of subvarieties

*Construction · node `HeightsRationalPointsAndObstructions:RP.5/stabilizer` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Subvariety`*

For a closed subvariety X of an abelian variety A over k, Stab(X) is the closed subgroup scheme of a ∈ A with a + X = X, and Stab⁰(X) its identity component (reduced), an abelian subvariety. X is a union of cosets of Stab⁰(X) and X/Stab⁰(X) ⊆ A/Stab⁰(X) has finite stabilizer. If X is irreducible and embedded in projective space by a very ample L, deg_L Stab(X) ≤ (deg_L X)^{dim X + 1}.

Hypotheses and conventions:

- X closed in A; for the degree bound X irreducible and L very ample.
- Use an algebraically closed field of characteristic zero for the scheme stabilizer and its degree bound here. For perfect fields the reduced identity component is smooth; a nonreduced stabilizer in characteristic p cannot be silently replaced in scheme-fibre assertions.

Construction or proof:

1. Stab(X) is the intersection over x ∈ X(k̄) of X − x, a closed subgroup (representability of the transporter).
2. The degree bound: David–Hindry Lemme 2.1(ii) via intersection of finitely many translates (as cited by Gao–Habegger).

Planning API:

- `TauCeti.AbelianVariety.stab` (constructor): Stab(X) as a closed subgroup scheme.
- `TauCeti.AbelianVariety.stabZero` (constructor): Stab⁰(X), an abelian subvariety.
- `TauCeti.AbelianVariety.add_stab` (relation): Stab(X) + X = X.
- `TauCeti.AbelianVariety.stab_quotient_finite` (other): The image of X in A/Stab⁰(X) has finite stabilizer.
- `TauCeti.AbelianVariety.degree_stab_le` (other): deg_L Stab(X) ≤ (deg_L X)^{dim X + 1}.

Unit tests:

- **stab.test_coset** (computation): Stab⁰(x + B) = B.
- **stab.test_point** (degenerate): Stab({x}) = 0.
- **stab.test_curve** (compatibility): For a curve C of genus ≥ 2 embedded in its Jacobian, Stab(C) is finite.
- **stab.test_not_reduced_union** (non-example): Stab(X) need not be connected: for X = B ∪ (t + B) with t ∈ A[2] ∖ B, Stab(X) ⊇ B ∪ (t + B).

Checks:

- Stab(A) = A; Stab({x}) = {0}; for X = x + B, Stab⁰(X) = B.

Consumers:

- Zhang's difference-map lemma: finite stabilizer is its hypothesis
- Gao–Habegger 2019 §6, §8: degree bounds for stabilizers in families

Direct prerequisites:

- [Abelian subvarieties, cosets and quotients](#RP5-abelian-subvariety) (`HeightsRationalPointsAndObstructions:RP.5/abelian-subvariety`)
- `SchemeAndStackFoundations:SF.1`
- `SchemeAndStackFoundations:SF.5`

Sources:

- [Z. Gao, P. Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*](https://arxiv.org/abs/1801.05762v3), proof of Proposition 6.9, p. 38; proof of Proposition 8.1, p. 47. Stabilizers of subvarieties of abelian varieties and the degree bound deg Stab(W) ≤ deg(W)^{dim W+1} of David–Hindry.
- [J. Xie, X. Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*](https://arxiv.org/abs/2108.09722v1), proof of Proposition 3.6, p. 16. The quotient X/Stab⁰(X).

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP5-generated-abelian-subvariety"></a>
### The abelian subvariety generated by X − X

*Construction · node `HeightsRationalPointsAndObstructions:RP.5/generated-abelian-subvariety` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Subvariety`*

For an irreducible closed subvariety X of an abelian variety A over an algebraically closed field, the abelian subvariety A' generated by X − X is the g-fold sum (X − X) + ⋯ + (X − X) (g = dim A); X ⊆ A' + Q for some Q ∈ A(k), and X generates A when A' = A. Translation preserves the property. With L very ample, deg_L(Y + Y') ≤ 4^{dim Y + dim Y'}·deg_L Y·deg_L Y' for irreducible Y, Y' ⊆ A, and deg_L A' ≪_g (deg_L X)^{2g}.

Hypotheses and conventions:

- k algebraically closed; X irreducible; L very ample (replace L by L^{⊗3} in the degree argument).

Construction or proof:

1. Sums of irreducible subvarieties stabilise after g steps by dimension count; the stable sum is a subgroup, hence an abelian subvariety.
2. Degree of sums: Gao–Ge–Kühne Lemma 2.4 (projection from the addition map on A × A).
3. Degree of A′: iterate Lemma 2.4 along the g-fold sum (Gao–Ge–Kühne Lemma 2.5, argument of Hindry), retaining the per-step factor 4^{dim Y+dim Y′} from Lemma 2.4.

Planning API:

- `TauCeti.AbelianVariety.generatedBy` (constructor): A' = the abelian subvariety generated by X − X.
- `TauCeti.AbelianVariety.generatedBy_eq_sum` (characterisation): A' = (X − X) + ⋯ + (X − X) (g summands).
- `TauCeti.AbelianVariety.subset_generatedBy_add` (relation): X ⊆ A' + Q for some Q.
- `TauCeti.AbelianVariety.Generates` (constructor): The predicate A' = A.
- `TauCeti.AbelianVariety.degree_add_le` (other): deg_L(Y + Y') ≤ 4^{dim Y + dim Y'}·deg_L Y·deg_L Y'.

Unit tests:

- **generatedBy.test_point** (degenerate): For X a point, A' = 0.
- **generatedBy.test_coset** (computation): For X = x + B, A' = B.
- **generatedBy.test_curve_jacobian** (compatibility): For C ⊆ Jac C of genus ≥ 1, A' = Jac C, matching AbelianSchemesAndArithmeticModuli A6/curve-generated-subvariety.
- **Generates.test_translate** (non-example): A subvariety X contained in a translate x + B of a proper abelian subvariety B does not generate A (its A' is contained in B), even when x ∉ B, so that X lies in no proper abelian subvariety.

Checks:

- For a curve C of genus ≥ 1 embedded in its Jacobian J, C − C generates J (AbelianSchemesAndArithmeticModuli A6/curve-generated-subvariety).

Consumers:

- Gao–Ge–Kühne 2026 §§2, 7: reduction of uniform Mordell–Lang to subvarieties that generate A
- Zhang's difference lemma and the Faltings–Zhang map: nondegeneracy of difference maps

Direct prerequisites:

- [Abelian subvarieties, cosets and quotients](#RP5-abelian-subvariety) (`HeightsRationalPointsAndObstructions:RP.5/abelian-subvariety`)
- `AbelianSchemesAndArithmeticModuli:A6/curve-generated-subvariety`
- `SchemeAndStackFoundations:SF.5`

Sources:

- [Z. Gao, T. Ge, L. Kühne, *The Uniform Mordell–Lang Conjecture*](https://arxiv.org/abs/2105.15085v4), §2.2, Lemmas 2.4–2.5, arXiv:2105.15085v4 pp.10–11. X generates A; A′ is the g-fold sum of X−X; Lemmas 2.4–2.5 give the degree bounds for sums and A′ in the arXiv v4 read.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP5-ueno-locus"></a>
### The Ueno locus

*Definition · node `HeightsRationalPointsAndObstructions:RP.5/ueno-locus` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Ueno`*

For a closed subvariety X of an abelian variety A over an algebraically closed field of characteristic 0, the Ueno locus Z(X) is the union of all positive-dimensional cosets contained in X, and X° = X ∖ Z(X). Z(X) is Zariski closed (Kawamata), so X° is open. (X − P)° = X° − P, and (X')° ⊇ X° ∩ X' for closed X' ⊆ X. The positive-dimensional abelian subvarieties B maximal with x + B ⊆ X for some x form a finite set Σ(X; A) with deg_L B and #Σ(X; A) bounded in terms of dim A and deg_L X (Bogomolov; Rémond), and Z(X) = ⋃_{B ∈ Σ(X;A)} (X_B + B) with X_B = ⋂_{b ∈ B} (X − b) ∩ B^⊥ a finite intersection of at most dim X translates.

Hypotheses and conventions:

- k algebraically closed of characteristic 0; X closed in A.
- For the quoted uniform degree bound on B^⊥ and X_B, assume X generates A, or replace A by the abelian subvariety generated by X−X. An arbitrary fixed Poincaré complement has no asserted uniform degree bound.

Construction or proof:

1. Closedness: Kawamata's structure theorem for subvarieties with positive-dimensional stabilizer (Ueno fibration), as cited by Gao–Ge–Kühne.
2. Finiteness and degree bounds of maximal cosets: Bogomolov 1981 Theorem 1 and Rémond Proposition 4.1, Lemma 4.6, as cited by Gao–Ge–Kühne and Gao–Habegger.
3. GGK Lemma 7.4, pp.43–44, uses the generating hypothesis when choosing B^⊥ with controlled degree. Positive dimension of B allows dimension descent to a finite intersection of at most dim X translates; this count is not itself an error.

Planning API:

- `TauCeti.AbelianVariety.uenoLocus` (constructor): Z(X), the union of positive-dimensional cosets in X.
- `TauCeti.AbelianVariety.isClosed_uenoLocus` (other): Z(X) is Zariski closed (Kawamata).
- `TauCeti.AbelianVariety.uenoLocus_translate` (relation): (X − P)° = X° − P.
- `TauCeti.AbelianVariety.maximalCosets_finite` (other): Σ(X; A) is finite with degrees bounded in terms of dim A and deg X.
- `TauCeti.AbelianVariety.uenoLocus_eq_iUnion` (characterisation): Z(X) = ⋃_{B ∈ Σ} (X_B + B).

Unit tests:

- **uenoLocus.test_curve** (computation): For C ⊆ Jac C of genus ≥ 2, Z(C) = ∅.
- **uenoLocus.test_abelian** (degenerate): Z(A) = A when dim A ≥ 1.
- **uenoLocus.test_product** (computation): For X = C × E ⊆ Jac C × E with E elliptic, Z(X) = X.
- **uenoLocus.test_not_torsion_condition** (non-example): The Ueno locus contains non-torsion cosets x + B: it is not the union of torsion cosets in X.

Checks:

- For a curve of genus ≥ 2 in its Jacobian, the Ueno locus is empty.

Consumers:

- Gao–Ge–Kühne 2026 Theorem 1.1: uniform Mordell–Lang counts points of X° ∩ Γ
- Faltings' theorem on subvarieties: X(K) ∩ X° is finite

Direct prerequisites:

- [Abelian subvarieties, cosets and quotients](#RP5-abelian-subvariety) (`HeightsRationalPointsAndObstructions:RP.5/abelian-subvariety`)
- [Stabilizers of subvarieties](#RP5-stabilizer) (`HeightsRationalPointsAndObstructions:RP.5/stabilizer`)
- [The abelian subvariety generated by X − X](#RP5-generated-abelian-subvariety) (`HeightsRationalPointsAndObstructions:RP.5/generated-abelian-subvariety`)

Sources:

- [Z. Gao, T. Ge, L. Kühne, *The Uniform Mordell–Lang Conjecture*](https://arxiv.org/abs/2105.15085v4), §7, Lemma 7.4, arXiv:2105.15085v4 pp.43–44. The Ueno locus, X°, Kawamata's closedness, and the structure via maximal cosets with bounded degree and number (Bogomolov, Rémond).
- [Z. Gao, P. Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*](https://arxiv.org/abs/1801.05762v3), proof of Proposition C.1, p. 61. Bogomolov's theorem: maximal cosets in X are translates of abelian subvarieties of bounded degree.

Outstanding proof or supplier contracts: Structure of the Ueno locus.

<a id="RP5-finite-rank-subgroup"></a>
### Subgroups of finite rank

*Definition · node `HeightsRationalPointsAndObstructions:RP.5/finite-rank-subgroup` · module `TauCeti/Algebra/FiniteRank`*

A subgroup Γ of an abelian group G (for example A(F) for an abelian variety A over a field F) has finite rank if Γ ⊗_ℤ ℚ is a finite-dimensional ℚ-vector space; rk Γ = dim_ℚ(Γ ⊗ ℚ). Equivalently Γ is contained in the division hull {x : Nx ∈ Γ₀ for some N ≥ 1} of a finitely generated subgroup Γ₀ of the same rank. No End(A)-stability is required.

Hypotheses and conventions:

- G abelian.
- The torsion subgroup is not finitely generated only for an abelian variety of positive dimension in the stated algebraically closed characteristic-zero test.

Construction or proof:

1. Choose Γ₀ generated by lifts of a ℚ-basis of Γ ⊗ ℚ; every x ∈ Γ has a multiple in Γ₀.

Planning API:

- `TauCeti.HasFiniteRank` (constructor): The predicate FiniteDimensional ℚ (Γ ⊗ ℚ), stated with Mathlib's Module.rank.
- `TauCeti.finiteRank_iff_le_divisionHull` (characterisation): Γ has finite rank iff it lies in the division hull of a finitely generated subgroup of the same rank.
- `TauCeti.HasFiniteRank.mono` (structure): Subgroups of finite-rank groups have finite rank.
- `TauCeti.HasFiniteRank.of_fg` (example): Finitely generated groups have finite rank.

Unit tests:

- **HasFiniteRank.test_torsion** (computation): A(K̄)_tors has rank 0.
- **HasFiniteRank.test_fg** (degenerate): ℤ^r has rank r.
- **HasFiniteRank.test_divisionHull** (compatibility): The division hull of A(K) in A(K̄) has rank rk A(K).
- **HasFiniteRank.test_not_fg** (non-example): ℚ ⊆ ℝ has rank 1 but is not finitely generated: finite rank is weaker than finite generation.

Checks:

- A(K) has finite rank by Mordell–Weil. If dim A>0 over an algebraically closed field of characteristic zero, A(K̄)_tors has rank zero and is not finitely generated; dimension zero is excluded from the latter claim.

Consumers:

- Mordell–Lang for finite-rank groups: Γ in the conjecture of Lang
- Dimitrov–Gao–Habegger 2021; Gao–Ge–Kühne 2026: uniform bounds in terms of rk Γ

Direct prerequisites:

- [The Mordell–Weil theorem](#RP1-mordell-weil) (`HeightsRationalPointsAndObstructions:RP.1/mordell-weil`)
- `mathlib:Module.rank`

Sources:

- [V. Dimitrov, Z. Gao, P. Habegger, *Uniformity in Mordell–Lang for curves*](https://arxiv.org/abs/2001.10276v3), §1, p. 3. Finite rank: Γ ⊗ ℚ finite-dimensional, rank its dimension.
- [Z. Gao, T. Ge, L. Kühne, *The Uniform Mordell–Lang Conjecture*](https://arxiv.org/abs/2105.15085v4), §1, Theorem 1.1 and its finite-rank Mordell–Lang context, arXiv:2105.15085v4 pp.2–3; §7.3, pp.41–42. Finite-rank subgroups and division hulls of finitely generated subgroups; no End(A)-stability (source issue E14).

<a id="RP5-manin-mumford"></a>
### The Manin–Mumford theorem

*Theorem · node `HeightsRationalPointsAndObstructions:RP.5/manin-mumford` · declaration `TauCeti.AbelianVariety.manin_mumford` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Subvariety`*

Let A be an abelian variety over an algebraically closed field of characteristic 0 and X ⊆ A a closed subvariety. Then the Zariski closure of X ∩ A_tors is a torsion subvariety (a finite union of torsion cosets contained in X). Equivalently, if X ∩ A_tors is Zariski dense in X then X is a torsion subvariety. Positive-dimensional torsion cosets are legitimate infinite components.

Hypotheses and conventions:

- Characteristic 0 (in positive characteristic see manin-mumford-positive-characteristic).

Construction or proof:

1. Raynaud 1983 (curves and subvarieties; p-adic methods); over number fields Hindry 1988 Theorem 1 via lower bounds for Galois orbits of torsion points; the specialisation argument reduces ℂ to ℚ̄.
2. It is the case Γ = A_tors (rank 0) of mordell-lang, but its proofs are independent.

Checks:

- For a curve C of genus ≥ 2 in its Jacobian by an Abel–Jacobi embedding, C ∩ J_tors is finite.

Direct prerequisites:

- [Abelian subvarieties, cosets and quotients](#RP5-abelian-subvariety) (`HeightsRationalPointsAndObstructions:RP.5/abelian-subvariety`)
- [Stabilizers of subvarieties](#RP5-stabilizer) (`HeightsRationalPointsAndObstructions:RP.5/stabilizer`)

Sources:

- [Z. Gao, P. Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*](https://arxiv.org/abs/1801.05762v3), Theorem 3.2 and proof, p. 13, citing Raynaud 1983, Hindry 1988 Theorem 1, Hrushovski 2001, Scanlon 2004. Manin–Mumford in characteristic 0 in a uniform form.
- [J. Xie, X. Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*](https://arxiv.org/abs/2108.09722v1), §5, Theorem 5.1, pp. 22–23. The Manin–Mumford statement (Raynaud over number fields).

Outstanding proof or supplier contracts: Proofs of Manin–Mumford.

<a id="RP5-manin-mumford-positive-characteristic"></a>
### Manin–Mumford for trivial trace in positive characteristic

*Theorem · node `HeightsRationalPointsAndObstructions:RP.5/manin-mumford-positive-characteristic` · declaration `TauCeti.AbelianVariety.manin_mumford_trivialTrace` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Subvariety`*

In characteristic p>0, let K be finitely generated over an algebraically closed field k and A an abelian variety over K with trivial geometric K̄/k-trace. If X ⊆ A_{K̄} is a closed subvariety with X(K̄) ∩ A(K̄)_tors Zariski dense in X, then X is a torsion subvariety. The proof covers all torsion, including p-power torsion.

Hypotheses and conventions:

- Characteristic p>0; trivial geometric K̄/k-trace; k algebraically closed.
- The trace is the geometric trace of A_{K̄} over the algebraically closed constant field k, as specified by Xie–Yuan §1.1; zero original K/k-trace is not enough.

Construction or proof:

1. Scanlon's positive-characteristic Manin–Mumford theorem (Theorem 2.2): the closure of X ∩ G_tors is a finite union of special subvarieties a + h^{-1}(X₀) with h : G → G₀ and X₀ defined over 𝔽̄_p (Pink–Roessler 2004 for the full torsion).
2. Trivial geometric trace excludes nonzero homomorphisms to abelian varieties over 𝔽̄_p ⊆ k (kk-trace universal property), so special subvarieties are torsion cosets (Xie–Yuan, review note on Theorem 5.1).

Checks:

- For A with trivial trace and X a curve of genus ≥ 2, X ∩ A_tors is finite.
- A nonconstant quadratic isotrivial twist of a constant Jacobian in characteristic p≠2 can have zero K/k-trace while becoming constant over K(√t). Over K̄ its constant genus≥2 curve has dense torsion over F̄_p and is not a torsion coset. This rules out the original-trace-only hypothesis.

Direct prerequisites:

- [The Manin–Mumford theorem](#RP5-manin-mumford) (`HeightsRationalPointsAndObstructions:RP.5/manin-mumford`)
- [Chow's K/k-trace](#RP1-kk-trace) (`HeightsRationalPointsAndObstructions:RP.1/kk-trace`)
- `AbelianSchemesAndArithmeticModuli:A3/multiplication-and-density`

Sources:

- [J. Xie, X. Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*](https://arxiv.org/abs/2108.09722v1), §5, Theorem 5.1 and proof, pp. 22–23. Manin–Mumford for trivial trace over finitely generated fields in arbitrary characteristic (Hrushovski; Pink–Roessler).
- [T. Scanlon, *Positive characteristic Manin–Mumford theorem*](https://arxiv.org/abs/math/0303340), Theorem 2.2 (arXiv:math/0303340). Positive-characteristic Manin–Mumford for all torsion, with special subvarieties defined over finite fields.

<a id="RP5-uniform-manin-mumford"></a>
### Uniform Manin–Mumford in families

*Theorem · node `HeightsRationalPointsAndObstructions:RP.5/uniform-manin-mumford` · declaration `TauCeti.AbelianVariety.uniform_manin_mumford` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Subvariety`*

Let A be an abelian variety over an algebraically closed field K of characteristic 0, V an irreducible quasi-projective K-variety and Y ⊆ V × A an irreducible closed subvariety with fibres Y_v. There are a finite set 𝓜 of abelian subvarieties of A and an integer D such that for every v ∈ V(K) the Zariski closure of Y_v ∩ A_tors is a union of at most D translates of members of 𝓜 by torsion points.

Hypotheses and conventions:

- Characteristic 0; Y irreducible closed in V × A.

Construction or proof:

1. Scanlon's automatic uniformity (2004 Theorem 2.4) via the model theory of algebraically closed fields with a generic automorphism (Hrushovski), as cited by Gao–Habegger Theorem 3.2 (statement misprint E1 corrected).

Checks:

- For V a point this is manin-mumford.

Direct prerequisites:

- [The Manin–Mumford theorem](#RP5-manin-mumford) (`HeightsRationalPointsAndObstructions:RP.5/manin-mumford`)

Sources:

- [Z. Gao, P. Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*](https://arxiv.org/abs/1801.05762v3), Theorem 3.2 and proof, p. 13. Uniform Manin–Mumford in algebraic families in characteristic 0, citing Raynaud, Scanlon, Hrushovski, Hindry.

Outstanding proof or supplier contracts: Proofs of Manin–Mumford.

<a id="RP5-faltings-subvarieties"></a>
### Faltings' theorem on rational points of subvarieties of abelian varieties

*Theorem · node `HeightsRationalPointsAndObstructions:RP.5/faltings-subvarieties` · declaration `TauCeti.AbelianVariety.faltings_subvariety` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Subvariety`*

Let A be an abelian variety over a number field K and X ⊆ A a closed subvariety. Then X(K) is contained in a finite union of cosets x_i + B_i contained in X; consequently X(K) ∩ X° is finite, where X° is the complement of the Ueno locus. In particular, if X contains no positive-dimensional coset (for example a curve of genus ≥ 2 in its Jacobian), X(K) is finite.

Hypotheses and conventions:

- K a number field; X closed in A.

Construction or proof:

1. Faltings 1991 (Diophantine approximation on abelian varieties): Vojta's method generalised to subvarieties, with Faltings' product theorem and an arithmetic Riemann–Roch input; induction on dim X through the Ueno fibration (as cited by Gao–Ge–Kühne §1).
2. For curves the elementary version is Bombieri's (vojta-inequality and mumford-gap).
3. Finiteness of X°∩Γ is a consequence of the full coset decomposition, not a standalone equivalent assertion: it contains no information about Γ-points inside the Ueno locus without an additional induction.

Checks:

- For C ⊆ J a curve of genus ≥ 2, this reproves Faltings' theorem on curves (RP.4/mordell-faltings).

Direct prerequisites:

- [The Ueno locus](#RP5-ueno-locus) (`HeightsRationalPointsAndObstructions:RP.5/ueno-locus`)
- [Vojta's inequality](#RP5-vojta-inequality) (`HeightsRationalPointsAndObstructions:RP.5/vojta-inequality`)
- [Mumford's gap principle](#RP5-mumford-gap) (`HeightsRationalPointsAndObstructions:RP.5/mumford-gap`)
- [The Mordell–Weil theorem](#RP1-mordell-weil) (`HeightsRationalPointsAndObstructions:RP.1/mordell-weil`)
- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)

Sources:

- [Z. Gao, T. Ge, L. Kühne, *The Uniform Mordell–Lang Conjecture*](https://arxiv.org/abs/2105.15085v4), §1, Theorem 1.1 and its finite-rank Mordell–Lang context, arXiv:2105.15085v4 pp.2–3. Faltings' theorem as the finitely generated case of Mordell–Lang; X(K) ∩ X° finite.
- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §9.5.3, statement of Faltings' theorem on subvarieties of abelian varieties after Conjecture 9.5.11. Rational points on subvarieties of abelian varieties lie in finitely many cosets.

Outstanding proof or supplier contracts: Faltings' proof of the subvariety theorem in higher dimension.

<a id="RP5-vojta-inequality"></a>
### Vojta's inequality

*Theorem · node `HeightsRationalPointsAndObstructions:RP.5/vojta-inequality` · declaration `TauCeti.Curve.vojta_inequality` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Subvariety`*

Let C be a smooth projective curve of genus g≥2 over a number field k, embedded in J using a degree-one divisor class after a finite extension if needed, with the theta Néron–Tate norm. Bombieri §10 Thm.1 gives an effectively determined γ(C)>1 such that if z,w∈C(k), ‖z‖≥γ(C) and ‖w‖≥γ(C)‖z‖, then ⟨z,w⟩≤(3/4)‖z‖‖w‖. Use the same normalization for the threshold and norm ratio; an arbitrary rescaling changes the threshold. The proof needs the product/Roth lemma in §§6–9, recorded separately as unresolved proof input.

Hypotheses and conventions:

- C of genus ≥ 2; k a number field; heights normalised as Néron–Tate heights for the theta divisor.

Construction or proof:

1. Construct the Vojta divisor on C × C and a small section by Siegel's lemma (Bombieri §§3, 8); lower bound for its height at (z, w) (§6); upper bound by Mumford's method (§5); derivative estimates and Roth's lemma bound the index (§§7, 9); combine in §10.

Checks:

- The inequality excludes infinitely many points in a narrow cone; combined with mumford-gap it gives finiteness.

Direct prerequisites:

- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)
- [Weil's height machine](#RP0-weil-height-machine) (`HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`)
- [The Mordell–Weil theorem](#RP1-mordell-weil) (`HeightsRationalPointsAndObstructions:RP.1/mordell-weil`)
- `mathlib:Int.Matrix.exists_ne_zero_int_vec_norm_le`
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`

Sources:

- [E. Bombieri, *The Mordell conjecture revisited*](http://www.numdam.org/item/ASNSP_1990_4_17_4_615_0.pdf), §§3–10, Theorem 1 and proof, pp. 617–638. The Vojta divisor, Siegel's lemma, Mumford's method, Roth's lemma, and Theorem 1: an effective angle inequality for pairs of rational points of large and very different heights.

Outstanding proof or supplier contracts: Bombieri product and Roth lemma.

<a id="RP5-mumford-gap"></a>
### Mumford's gap principle

*Theorem · node `HeightsRationalPointsAndObstructions:RP.5/mumford-gap` · declaration `TauCeti.Curve.mumford_gap` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Subvariety`*

Let C be a smooth projective curve of genus g ≥ 2 over a number field k embedded in its Jacobian. There are constants c(C) and an angle θ₀ > 0 such that for distinct z, w ∈ C(k) with |z| ≥ c(C), |w| ≥ |z| and angle between z and w (for the Néron–Tate inner product) at most θ₀, one has |w| ≥ 2|z|. Consequently the points of C(k) in any cone of small angle have Néron–Tate norms growing geometrically, and the number of rational points of norm ≤ T is O(log T).

Hypotheses and conventions:

- g ≥ 2; heights as in vojta-inequality.

Construction or proof:

1. Mumford's formula: the height on C × C of the diagonal is, up to bounded functions, a quadratic expression in Néron–Tate heights that is indefinite for g ≥ 2 and bounded below off the diagonal (Bombieri §4–§5, Lemmas 1–2).
2. Bombieri §10 p.639: (‖z‖²+‖w‖²)/(2g)−⟨z,w⟩ ≥ −c(1+‖z‖+‖w‖), for distinct curve points. For sufficiently large norms in a cone whose pairwise cosine exceeds 3/4, assuming 1≤‖w‖/‖z‖<2 makes the leading term negative, a contradiction; hence the ratio is at least two. Northcott handles the bounded initial region.

Checks:

- With vojta-inequality: points in a cone either have bounded norm or violate Vojta, so C(k) ∩ cone is finite; finitely many cones cover the finite-dimensional J(k) ⊗ ℝ.

Direct prerequisites:

- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)
- [Heights are bounded below off the base locus](#RP0-height-positivity-base-locus) (`HeightsRationalPointsAndObstructions:RP.0/height-positivity-base-locus`)
- [The Mordell–Weil theorem](#RP1-mordell-weil) (`HeightsRationalPointsAndObstructions:RP.1/mordell-weil`)

Sources:

- [E. Bombieri, *The Mordell conjecture revisited*](http://www.numdam.org/item/ASNSP_1990_4_17_4_615_0.pdf), §4, p. 619, and §5, Lemmas 1–2, pp. 621–622. Mumford's method: the height of the diagonal on C × C in terms of Néron–Tate heights; gap principle for rational points.

<a id="RP5-vojta-bombieri-mordell"></a>
### Faltings' theorem by the Vojta–Bombieri route

*Theorem · node `HeightsRationalPointsAndObstructions:RP.5/vojta-bombieri-mordell` · declaration `TauCeti.Curve.finite_rationalPoints` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Subvariety`*

Let C be a smooth projective curve of genus g ≥ 2 over a number field k. Then C(k) is finite. This is the same declaration as RP.4/mordell-faltings, proved here without Shafarevich finiteness: J(k) ⊗ ℝ is a finite-dimensional Euclidean space (Mordell–Weil and positive definiteness), and vojta-inequality and mumford-gap leave only finitely many points in each of finitely many cones.

Hypotheses and conventions:

- k a number field; g ≥ 2.

Construction or proof:

1. Embed C in J; J(k) is finitely generated (RP.1/mordell-weil) and ĥ is positive definite on J(k) ⊗ ℝ (RP.1/neron-tate-positive-definite).
2. Cover J(k) ⊗ ℝ by finitely many cones of angle < cos⁻¹(3/4); in each, mumford-gap forces geometric growth and vojta-inequality bounds the ratio, leaving finitely many points (Bombieri §10, Theorem 2).
3. Bombieri Thm.2 bounds the number of points above a specified norm threshold in terms of rank and γ. Northcott gives finiteness below that threshold but does not make the theorem an effective enumeration or a bound on every rational-point height.

Checks:

- Bombieri's Theorem 2 gives an explicit bound for the number of rational points, not for their heights.

Direct prerequisites:

- [Vojta's inequality](#RP5-vojta-inequality) (`HeightsRationalPointsAndObstructions:RP.5/vojta-inequality`)
- [Mumford's gap principle](#RP5-mumford-gap) (`HeightsRationalPointsAndObstructions:RP.5/mumford-gap`)
- [Positive definiteness of the Néron–Tate height on A(K) ⊗ ℝ](#RP1-neron-tate-positive-definite) (`HeightsRationalPointsAndObstructions:RP.1/neron-tate-positive-definite`)

Sources:

- [E. Bombieri, *The Mordell conjecture revisited*](http://www.numdam.org/item/ASNSP_1990_4_17_4_615_0.pdf), §10, Theorems 1–2, pp. 637–639. Proof of the Mordell conjecture by Vojta's inequality and Mumford's gap principle, with an effective bound on the number of points.
- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §9.5.1, p. 286. Vojta's proof and Bombieri's elementary version of Faltings' theorem.

Outstanding proof or supplier contracts: Bombieri product and Roth lemma.

<a id="RP5-mordell-lang"></a>
### The Mordell–Lang theorem

*Theorem · node `HeightsRationalPointsAndObstructions:RP.5/mordell-lang` · declaration `TauCeti.AbelianVariety.mordell_lang` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Subvariety`*

Let A be an abelian variety over an algebraically closed field F of characteristic 0, X ⊆ A a closed subvariety and Γ ⊆ A(F) a subgroup of finite rank. Then X(F) ∩ Γ is a finite union of sets (x_i + B_i(F)) ∩ Γ with x_i + B_i ⊆ X cosets; consequently X° ∩ Γ is finite. Special cases: Γ = A(K) finitely generated (faltings-subvarieties), Γ = A_tors (manin-mumford).

Hypotheses and conventions:

- Characteristic 0; Γ of finite rank (finite-rank-subgroup).

Construction or proof:

1. Finitely generated Γ over a number field: faltings-subvarieties. Specialisation reduces finitely generated F to number fields (Raynaud, Hindry).
2. Finite rank: Γ lies in the division hull of a finitely generated Γ₀; McQuillan 1995 combined with Hindry's Galois-orbit argument handles division points (as cited by Gao–Ge–Kühne §1).
3. Finiteness of X°∩Γ is a consequence of the full coset decomposition, not a standalone equivalent assertion: it contains no information about Γ-points inside the Ueno locus without an additional induction.

Checks:

- For X a curve of genus ≥ 2 in its Jacobian and Γ the division hull of J(K), X ∩ Γ is finite.

Direct prerequisites:

- [Faltings' theorem on rational points of subvarieties of abelian varieties](#RP5-faltings-subvarieties) (`HeightsRationalPointsAndObstructions:RP.5/faltings-subvarieties`)
- [The Manin–Mumford theorem](#RP5-manin-mumford) (`HeightsRationalPointsAndObstructions:RP.5/manin-mumford`)
- [Subgroups of finite rank](#RP5-finite-rank-subgroup) (`HeightsRationalPointsAndObstructions:RP.5/finite-rank-subgroup`)
- [The Ueno locus](#RP5-ueno-locus) (`HeightsRationalPointsAndObstructions:RP.5/ueno-locus`)

Sources:

- [Z. Gao, T. Ge, L. Kühne, *The Uniform Mordell–Lang Conjecture*](https://arxiv.org/abs/2105.15085v4), §1, Theorem 1.1 and its finite-rank Mordell–Lang context, arXiv:2105.15085v4 pp.2–3. Lang's conjecture for finite-rank Γ, proved by Faltings, Vojta, McQuillan, Raynaud and Hindry.
- [V. Dimitrov, Z. Gao, P. Habegger, *Uniformity in Mordell–Lang for curves*](https://arxiv.org/abs/2001.10276v3), §1, pp. 1–3. Mordell–Lang for curves and finite-rank subgroups.

Outstanding proof or supplier contracts: Faltings' proof of the subvariety theorem in higher dimension.

<a id="RP5-faltings-zhang-map"></a>
### The Faltings–Zhang difference map

*Construction · node `HeightsRationalPointsAndObstructions:RP.5/faltings-zhang-map` · module `TauCeti/AlgebraicGeometry/AbelianVariety/FaltingsZhang`*

For an abelian variety A and M ≥ 1, D_M : A^{M+1} → A^M, (P₀, …, P_M) ↦ (P₁ − P₀, …, P_M − P₀). For a subvariety X ⊆ A, D_M restricts to X^{M+1} → A^M. In families of curves over S → M_g it is built from Pic¹ × Pic¹ → Jac by differences, landing in 𝔄_g^{[M]} ×_{A_g} S.

Hypotheses and conventions:

- M ≥ 1 (the source states M ≥ 2 on p. 6 but uses D₁).

Construction or proof:

1. A morphism of abelian varieties composed with translations; its restriction to X^{M+1} is proper.

Planning API:

- `TauCeti.AbelianVariety.faltingsZhang` (constructor): D_M : A^{M+1} → A^M.
- `TauCeti.AbelianVariety.faltingsZhang_apply` (simp): D_M(P₀, …, P_M) = (P₁ − P₀, …, P_M − P₀).
- `TauCeti.AbelianVariety.faltingsZhang_hom` (structure): D_M is a homomorphism of abelian varieties.
- `TauCeti.AbelianVariety.faltingsZhang_diag` (characterisation): D_M(P, …, P) = 0.

Unit tests:

- **faltingsZhang.test_M1** (computation): D₁(P, Q) = Q − P.
- **faltingsZhang.test_diagonal** (degenerate): The diagonal maps to 0.
- **faltingsZhang.test_kernel** (characterisation): ker D_M is the diagonal copy of A.
- **faltingsZhang.test_not_finite_on_coset** (non-example): On X = B a positive-dimensional abelian subvariety, D_M|_{X^{M+1}} has positive-dimensional fibres for every M.

Checks:

- D₁ on X × X is the difference map (x, y) ↦ y − x.

Consumers:

- zhang-difference-lemma: its generic fibre is an orbit of Stab(X)
- Bogomolov's proof (Zhang): pulling back heights along D_M
- Dimitrov–Gao–Habegger 2021; Gao–Ge–Kühne 2026: uniformity in Mordell–Lang

Direct prerequisites:

- [Abelian subvarieties, cosets and quotients](#RP5-abelian-subvariety) (`HeightsRationalPointsAndObstructions:RP.5/abelian-subvariety`)
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`

Sources:

- [V. Dimitrov, Z. Gao, P. Habegger, *Uniformity in Mordell–Lang for curves*](https://arxiv.org/abs/2001.10276v3), (1.3), p. 6; §6.1, (6.3)–(6.5), pp. 24–25; p. 28. The Faltings–Zhang morphism for one abelian variety and in families (target corrected in the paper's source issue E12).
- [Z. Gao, T. Ge, L. Kühne, *The Uniform Mordell–Lang Conjecture*](https://arxiv.org/abs/2105.15085v4), §5.1, reduction steps, arXiv:2105.15085v4 pp.28–30. The difference map D₀ : X^{M+1} → A^M.

<a id="RP5-zhang-difference-lemma"></a>
### Zhang's difference-map lemma

*Theorem · node `HeightsRationalPointsAndObstructions:RP.5/zhang-difference-lemma` · declaration `TauCeti.AbelianVariety.faltingsZhang_generic_fibre` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Subvariety`*

For an irreducible closed subvariety X of an abelian variety A with finite stabilizer there is M₀ such that for M ≥ M₀ the generic fibre of D_M : X^{M+1} → A^M is a single orbit of Stab(X) acting diagonally; in particular D_M|_{X^{M+1}} is generically finite onto its image.

Hypotheses and conventions:

- X irreducible with finite stabilizer.
- The scheme-fibre/orbit statement is in characteristic zero. A geometric-point stabilizer identity alone cannot prove equality with a nonreduced scheme stabilizer in characteristic p.

Construction or proof:

1. Fibres of D_M over a point are intersections of translates of X; for M large these stabilise to Stab(X) (Zhang 1998, proof of Lemma 3.1, as recalled by Gao–Ge–Kühne).

Checks:

- For a curve of genus ≥ 2 in its Jacobian, D₂ is generically finite on C³.

Direct prerequisites:

- [The Faltings–Zhang difference map](#RP5-faltings-zhang-map) (`HeightsRationalPointsAndObstructions:RP.5/faltings-zhang-map`)
- [Stabilizers of subvarieties](#RP5-stabilizer) (`HeightsRationalPointsAndObstructions:RP.5/stabilizer`)

Sources:

- [Z. Gao, T. Ge, L. Kühne, *The Uniform Mordell–Lang Conjecture*](https://arxiv.org/abs/2105.15085v4), §5.1, reduction steps, arXiv:2105.15085v4 pp.28–30. For finite stabilizer and M large the generic fibre of D₀ : X^{M+1} → A^M is a Stab(X)-orbit.

<a id="RP5-minimal-torsion-subvariety"></a>
### The minimal torsion subvariety containing X

*Construction · node `HeightsRationalPointsAndObstructions:RP.5/minimal-torsion-subvariety` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Subvariety`*

For an irreducible closed subvariety X of an abelian variety A over an algebraically closed field, T_X is the smallest torsion coset of A containing X; for a ∈ T_X torsion, T_X − a is an abelian subvariety. X is a torsion coset iff X = T_X.

Hypotheses and conventions:

- X irreducible.

Construction or proof:

1. Intersections of torsion cosets containing X are finite unions of torsion cosets; irreducibility selects one component; descending chain condition on abelian subvarieties.

Planning API:

- `TauCeti.AbelianVariety.minimalTorsionCoset` (constructor): T_X.
- `TauCeti.AbelianVariety.subset_minimalTorsionCoset` (other): X ⊆ T_X.
- `TauCeti.AbelianVariety.minimalTorsionCoset_le` (universal-property): T_X ⊆ T for every torsion coset T ⊇ X.
- `TauCeti.AbelianVariety.isTorsionCoset_iff` (characterisation): X is a torsion coset iff X = T_X.

Unit tests:

- **minimalTorsionCoset.test_torsion_point** (degenerate): T_{{t}} = {t} for t torsion.
- **minimalTorsionCoset.test_nontorsion_point** (computation): For E elliptic and x of infinite order, T_{{x}} = E.
- **minimalTorsionCoset.test_subgroup** (compatibility): For an abelian subvariety B, T_B = B.
- **minimalTorsionCoset.test_translate** (non-example): For x + B with x not torsion modulo B, T_{x+B} ≠ x + B.

Checks:

- For a torsion point t, T_{{t}} = {t}; for a non-torsion point x of an elliptic curve E, T_{{x}} = E.

Consumers:

- Xie–Yuan 2022 §5: reduction of the Bogomolov statement to subvarieties generating T_X
- manin-mumford: the conclusion X = T_X

Direct prerequisites:

- [Abelian subvarieties, cosets and quotients](#RP5-abelian-subvariety) (`HeightsRationalPointsAndObstructions:RP.5/abelian-subvariety`)

Sources:

- [J. Xie, X. Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*](https://arxiv.org/abs/2108.09722v1), proof of Lemma 5.3, p. 24. The minimal torsion subvariety T_X containing X, with T_X − a an abelian subvariety for torsion a ∈ T_X.

<a id="RP5-essential-minimum"></a>
### The essential minimum of a subvariety

*Definition · node `HeightsRationalPointsAndObstructions:RP.5/essential-minimum` · module `TauCeti/AlgebraicGeometry/AbelianVariety/SmallPoints`*

Let A be an abelian variety over a number field (or a polarized function field) K, L a symmetric ample line bundle and X ⊆ A_{K̄} a nonempty irreducible closed subvariety. The essential minimum is μ_ess(X) = sup over proper closed Y ⊊ X of inf{ĥ_L(x) : x ∈ X(K̄) ∖ Y(K̄)}; equivalently the infimum of the ε ≥ 0 such that {x ∈ X(K̄) : ĥ_L(x) ≤ ε} is Zariski dense in X. X has dense small points iff μ_ess(X) = 0.

Hypotheses and conventions:

- L symmetric ample; ĥ_L the Néron–Tate height.
- X is nonempty and irreducible. The zero-height/torsion tests and μ_ess=0 iff torsion-coset theorem use number fields; geometric function-field constants require the trace correction and are not covered by that equivalence.

Construction or proof:

1. Monotone in Y; independent of the field of definition by the Galois invariance of ĥ.

Planning API:

- `TauCeti.AbelianVariety.essentialMinimum` (constructor): μ_ess(X) ∈ [0, ∞).
- `TauCeti.AbelianVariety.essentialMinimum_eq_zero_iff` (characterisation): μ_ess(X) = 0 iff points of arbitrarily small height are Zariski dense in X.
- `TauCeti.AbelianVariety.essentialMinimum_translate_torsion` (relation): μ_ess(X + t) = μ_ess(X) for torsion t.
- `TauCeti.AbelianVariety.essentialMinimum_nonneg` (other): μ_ess(X) ≥ 0.

Unit tests:

- **essentialMinimum.test_torsion_coset** (computation): μ_ess(t + B) = 0.
- **essentialMinimum.test_point** (degenerate): For a point X = {x}, μ_ess(X) = ĥ_L(x).
- **essentialMinimum.test_kernel** (compatibility): Over a number field, for X={x}, μ_ess(X)=0 iff x is torsion. The statement on arbitrary polarized function fields instead has the geometric-trace kernel.
- **essentialMinimum.test_inf_not_ess** (non-example): Over a number field, a genus≥2 curve through 0 has inf ĥ=0 but μ_ess>0 by Bogomolov. This test is not asserted for a constant curve over a function field.

Checks:

- For X a torsion coset, μ_ess(X) = 0.

Consumers:

- bogomolov: Over number fields, Bogomolov says μ_ess(X)>0 unless X is a torsion coset; function-field constant/trace subvarieties require the corresponding geometric correction.
- Zhang's successive minima theorem: μ_ess(X) ≥ ĥ_L(X) ≥ μ_ess(X)/(dim X + 1)

Direct prerequisites:

- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)
- [Positivity and kernel of the Néron–Tate height](#RP0-neron-tate-kernel-number-field) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-kernel-number-field`)

Sources:

- [E. Ullmo, *Positivité et discrétion des points algébriques des courbes*](https://arxiv.org/abs/alg-geom/9606017), §1, Théorème 1.1, p. 1 (arXiv). Bogomolov's conjecture for curves stated as a positive lower bound for heights outside a finite set.
- [J. Xie, X. Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*](https://arxiv.org/abs/2108.09722v1), §1.1, pp. 1–3. Small points of subvarieties and the geometric Bogomolov conjecture.

<a id="RP5-bogomolov"></a>
### The Bogomolov conjecture (Ullmo–Zhang)

*Theorem · node `HeightsRationalPointsAndObstructions:RP.5/bogomolov` · declaration `TauCeti.AbelianVariety.bogomolov` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Subvariety`*

Let A be an abelian variety over a number field K, L a symmetric ample line bundle and X ⊆ A_{K̄} an irreducible closed subvariety that is not a torsion coset. Then μ_ess(X) > 0: there is ε > 0 such that {x ∈ X(K̄) : ĥ_L(x) < ε} is not Zariski dense in X. For a curve of genus ≥ 2 embedded in its Jacobian, the set of points of height < ε is finite (Ullmo). Manin–Mumford alone (height zero) does not imply this.

Hypotheses and conventions:

- K a number field (characteristic 0); X not a torsion coset.

Construction or proof:

1. Reduce to X with finite stabilizer that generates A (quotient by Stab⁰(X), minimal-torsion-subvariety).
2. Suppose small points are dense; by Szpiro–Ullmo–Zhang equidistribution (szpiro-ullmo-zhang-equidistribution) generic small sequences on X^{M+1} and on D_M(X^{M+1}) equidistribute to the canonical measures.
3. Zhang's difference lemma makes D_M generically finite; comparing the pushforward of the measure on X^{M+1} with the measure on the image yields a contradiction on the support (Zhang 1998; Ullmo 1998 for curves).

Checks:

- For X=x+B, assume the image of x in A/B has infinite order; x itself having infinite order does not suffice when x∈B. Then μ_ess(X)>0. An exact equality with a quotient-point height requires the specified quotient-induced orthogonal polarization; arbitrary polarizations only give the appropriate comparison/positivity.

Direct prerequisites:

- [The essential minimum of a subvariety](#RP5-essential-minimum) (`HeightsRationalPointsAndObstructions:RP.5/essential-minimum`)
- [Zhang's difference-map lemma](#RP5-zhang-difference-lemma) (`HeightsRationalPointsAndObstructions:RP.5/zhang-difference-lemma`)
- [The minimal torsion subvariety containing X](#RP5-minimal-torsion-subvariety) (`HeightsRationalPointsAndObstructions:RP.5/minimal-torsion-subvariety`)
- [Equidistribution of small points on abelian varieties](#RP5-szpiro-ullmo-zhang-equidistribution) (`HeightsRationalPointsAndObstructions:RP.5/szpiro-ullmo-zhang-equidistribution`)

Sources:

- [E. Ullmo, *Positivité et discrétion des points algébriques des courbes*](https://arxiv.org/abs/alg-geom/9606017), §1, Théorème 1.1, p. 1 (arXiv alg-geom/9606017). Bogomolov's conjecture for curves in their Jacobians, via Zhang's admissible pairing and equidistribution.
- [Z. Gao, T. Ge, L. Kühne, *The Uniform Mordell–Lang Conjecture*](https://arxiv.org/abs/2105.15085v4), §5.1, reduction steps, arXiv:2105.15085v4 pp.28–30. Zhang's route to Bogomolov through the difference map.
- [W. Gubler, *The Bogomolov conjecture for totally degenerate abelian varieties*](https://arxiv.org/abs/math/0609387v2), §5, Theorem 5.5 and proof, arXiv v2 pp.13–16. Zhang's proof of Bogomolov for number fields by equidistribution.

Outstanding proof or supplier contracts: Arithmetic intersection theory of adelic metrized line bundles.

<a id="RP5-szpiro-ullmo-zhang-equidistribution"></a>
### Equidistribution of small points on abelian varieties

*Theorem · node `HeightsRationalPointsAndObstructions:RP.5/szpiro-ullmo-zhang-equidistribution` · declaration `TauCeti.AbelianVariety.equidistribution_small_points` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Subvariety`*

Let A be an abelian variety over a number field K, L symmetric ample, X ⊆ A geometrically irreducible and defined over K (after a finite extension if needed) with μ_ess(X) = 0, and (x_n) a generic sequence in X(K̄) (no infinite subsequence lies in a proper closed subvariety of X) with ĥ_L(x_n) → 0. Then for every archimedean place v the probability measures equidistributed on the Galois orbits of x_n in X(ℂ_v) converge weakly to the normalised canonical measure c₁(L, ‖·‖_can)^{dim X}/deg_L X.

Hypotheses and conventions:

- K a number field; (x_n) generic and small.
- For the general-subvariety version use Ullmo Thm.2.4: a semipositive adelic metric with strictly positive archimedean curvature and the prescribed uniform approximation by arithmetic model metrics, with the normalized subvariety height and generic small sequence. The abelian canonical version is Thm.2.3; the general version is not inferred solely from μ_ess=0 without the metric/intersection input.
- Take Galois orbits over a field of definition of X; otherwise their support can leave X and the asserted measure on X(ℂ_v) is ill-typed. Generic means that every proper closed subset contains only finitely many terms, not that no finite subsequence lies in it.

Construction or proof:

1. Szpiro–Ullmo–Zhang 1997: Zhang's successive minima inequality for adelic metrized line bundles and the variational principle with perturbed metrics.
2. Its inputs, the arithmetic intersection theory of adelic metrized line bundles on varieties of arbitrary dimension (arithmetic Hilbert–Samuel and successive minima), are planned by no roadmap (recorded gap).

Checks:

- For an elliptic curve E over a number field, a generic sequence of torsion points has Galois-orbit measures converging to Haar measure. A constant torsion sequence is not generic and does not equidistribute.

Direct prerequisites:

- [The essential minimum of a subvariety](#RP5-essential-minimum) (`HeightsRationalPointsAndObstructions:RP.5/essential-minimum`)
- [Local Weil functions and Néron functions](#RP0-local-weil-functions) (`HeightsRationalPointsAndObstructions:RP.0/local-weil-functions`)
- [The Néron–Tate canonical height](#RP0-neron-tate-height) (`HeightsRationalPointsAndObstructions:RP.0/neron-tate-height`)

Sources:

- [E. Ullmo, *Positivité et discrétion des points algébriques des courbes*](https://arxiv.org/abs/alg-geom/9606017), §1, discussion of Zhang's admissible pairing and equidistribution, pp. 1–3. The equidistribution input of Ullmo's proof (Szpiro–Ullmo–Zhang).
- [W. Gubler, *The Bogomolov conjecture for totally degenerate abelian varieties*](https://arxiv.org/abs/math/0609387v2), §1 and §5, citing Zhang 1998 and Szpiro–Ullmo–Zhang. Zhang's equidistribution approach, and its tropical analogue over function fields.

Outstanding proof or supplier contracts: Arithmetic intersection theory of adelic metrized line bundles.

<a id="RP5-coset-free-hypersurface-sections"></a>
### Hypersurface sections of abelian varieties containing no cosets

*Theorem · node `HeightsRationalPointsAndObstructions:RP.5/coset-free-hypersurface-sections` · declaration `TauCeti.AbelianVariety.exists_cosetFree_hypersurface` · module `TauCeti/AlgebraicGeometry/AbelianVariety/Subvariety`*

Let A ⊆ ℙ^M be an abelian variety of dimension g ≥ 1 and d ≥ g − 1. There is a dense Zariski open U in the space of degree-d forms, with complement of codimension ≥ d + 2 − g, such that A ∩ 𝒵(f) contains no positive-dimensional coset for f ∈ U. For an abelian subvariety B with dim B ≥ 1 and d ≥ max{1, g − dim B}, the forms f with A ∩ 𝒵(f) containing a translate of B lie in a closed subset of codimension ≥ d + 1 + dim B − g. The Hilbert function satisfies H_V(d) ≥ binom(dim V + d, dim V) ≥ d + 1 for V ⊆ ℙ^M with dim V ≥ 1.

Hypotheses and conventions:

- A ⊆ ℙ^M projective; d as stated.
- A and the form space are over an algebraically closed field of characteristic zero. The good open excludes forms vanishing identically on A, including the zero form.

Construction or proof:

1. Incidence variety of (coset translate, form) and fibre dimension counts using the Hilbert function lower bound (Gao–Habegger Lemma C.2 and (C.1)).
2. Bogomolov's finiteness of maximal cosets reduces to finitely many B (ueno-locus); apply Lemma C.2 to each (Proposition C.1).

Checks:

- For g=1, every form not identically zero on A gives a finite section; forms identically zero on A give the whole elliptic curve and lie outside U. In particular U is not the entire vector space of forms.

Direct prerequisites:

- [The Ueno locus](#RP5-ueno-locus) (`HeightsRationalPointsAndObstructions:RP.5/ueno-locus`)
- [Abelian subvarieties, cosets and quotients](#RP5-abelian-subvariety) (`HeightsRationalPointsAndObstructions:RP.5/abelian-subvariety`)
- `SchemeAndStackFoundations:SF.5`

Sources:

- [Z. Gao, P. Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*](https://arxiv.org/abs/1801.05762v3), (C.1), Lemma C.2 and Proposition C.1 with corollary and proofs, pp. 59–61 (misprint E17). Generic hypersurface sections of abelian varieties contain no positive-dimensional coset, with codimension estimates.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="rp-6"></a>
## RP.6. Rational-point classification and frontier register

Local solubility, the Hasse principle and the Abel–Jacobi embedding transfer the preceding theorems to curves. Genus zero has the conic local-global classification; genus one uses marked torsors and the finite-Sha conditional Brauer–Manin theorem; genus at least two has finiteness. Degree-one Picard points are distinguished from descended line bundles. The conjecture register defines precise propositions and supplies no assumed theorem to a proved consumer.

**Named milestones:** [Genus zero: conics and the Hasse principle](#RP6-genus-zero-classification), [Genus one: torsors under the Jacobian](#RP6-genus-one-classification), [Genus at least two: finiteness](#RP6-higher-genus-classification).

**Imported interfaces:** `HeightsRationalPointsAndObstructions:RP.0`, `HeightsRationalPointsAndObstructions:RP.1`, `HeightsRationalPointsAndObstructions:RP.2`, `HeightsRationalPointsAndObstructions:RP.3`, `HeightsRationalPointsAndObstructions:RP.4`, `HeightsRationalPointsAndObstructions:RP.5`, `SchemeAndStackFoundations:SF.3`.


<a id="RP6-local-solubility"></a>
### Local solubility and the local-global principle

*Definition · node `HeightsRationalPointsAndObstructions:RP.6/local-solubility` · module `TauCeti/NumberTheory/RationalPoints/LocalGlobal`*

A variety X over a number field K is locally soluble (everywhere locally soluble) if X(K_v) ≠ ∅ for every place v. X satisfies the local-global principle (Hasse principle) if X(𝔸_K) ≠ ∅ implies X(K) ≠ ∅, and weak approximation if X(K) is dense in Π_v X(K_v). For X proper, X(𝔸_K) ≠ ∅ iff X is locally soluble; for X of finite type, local solubility at the finitely many places outside a model's good set and integral points elsewhere characterise X(𝔸_K) ≠ ∅.

Hypotheses and conventions:

- K a number field; X separated of finite type.

Construction or proof:

1. For proper X, X(𝔸_K) = Π_v X(K_v) (RP.2/adelic-points-general).
2. In general use RP.2/adelic-points-nonempty-iff (integral points almost everywhere, from Lang–Weil and Hensel for smooth geometrically integral fibres).

Planning API:

- `TauCeti.IsLocallySoluble` (constructor): ∀ v, X(K_v) ≠ ∅.
- `TauCeti.SatisfiesHassePrinciple` (constructor): X(𝔸_K) ≠ ∅ → X(K) ≠ ∅.
- `TauCeti.SatisfiesWeakApproximation` (constructor): X(K) dense in Π_v X(K_v).
- `TauCeti.adelicPoints_nonempty_iff_locallySoluble` (characterisation): For proper X, X(𝔸_K) ≠ ∅ ↔ IsLocallySoluble X.
- `TauCeti.IsLocallySoluble.of_rationalPoint` (other): X(K) ≠ ∅ ⇒ X locally soluble.

Unit tests:

- **IsLocallySoluble.test_conic** (computation): x² + y² = 3z² over ℚ is not locally soluble (no ℚ₃-point).
- **IsLocallySoluble.test_point** (degenerate): Spec K is locally soluble and satisfies the Hasse principle.
- **SatisfiesHassePrinciple.test_conic** (compatibility): Smooth conics satisfy the Hasse principle (GlobalQuadraticForms Layer 5; RP.2/conic-example).
- **SatisfiesHassePrinciple.test_iskovskikh** (non-example): Iskovskikh's surface is locally soluble without rational points (RP.2/iskovskikh-example).

Checks:

- x² + y² = 3z² is not locally soluble at 3.

Consumers:

- classification theorems of this layer: genus 0 satisfies the local-global principle; genus 1 can fail it
- Bhargava–Gross–Wang 2017: densities of locally soluble hyperelliptic curves

Direct prerequisites:

- [Adelic points of separated schemes of finite type](#RP2-adelic-points-general) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points-general`)
- [Adelic points exist iff local points exist and are integral almost everywhere](#RP2-adelic-points-nonempty-iff) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points-nonempty-iff`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §8.4.7 (definition of the local-global principle), p. 245; §2.6.3, pp. 49–50. The local-global principle as the implication X(𝔸) ≠ ∅ ⇒ X(k) ≠ ∅; adelic points of proper varieties are products of local points.

<a id="RP6-curve-in-jacobian"></a>
### Rational points of curves through the Abel–Jacobi embedding

*Theorem · node `HeightsRationalPointsAndObstructions:RP.6/curve-in-jacobian` · declaration `TauCeti.Curve.abelJacobi_points` · module `TauCeti/NumberTheory/RationalPoints/Classification`*

Let C be a smooth projective geometrically connected curve of genus g ≥ 1 over a field K with a divisor class D₀ of degree 1 defined over K (for instance a rational point). The Abel–Jacobi map ι_{D₀} : C → J = Jac C, P ↦ [P − D₀], is a closed immersion, and C(K) = ι^{-1}(J(K)) ∩ C(K) maps bijectively onto ι(C)(K) ⊆ J(K). Hence any finiteness or structure theorem for ι(C) ∩ Γ with Γ ⊆ J(K̄) (Mordell–Lang, Manin–Mumford, Bogomolov) transfers to points of C; for g = 1, ι is an isomorphism C ≅ J and C(K) is a J(K)-torsor.

Hypotheses and conventions:

- g ≥ 1; D₀ of degree 1 over K (for g ≥ 2 a rational point suffices; without one, use C ⊆ Pic¹ and a torsor).

Construction or proof:

1. Import the Abel–Jacobi morphism from JacobianChallenge Layer F. For genus≥1, Riemann–Roch separates geometric points under the degree-one Abel map; its differential is injective by evaluation of holomorphic differentials (canonical system has no base point). Properness plus the resulting geometric immersion gives a closed immersion. The chosen degree-one Picard point translates Pic¹ to J, even if it has no representative line bundle over K.
2. Points over K correspond since ι is a K-morphism and a closed immersion.

Checks:

- For an elliptic curve with D₀ = O, ι is the identity; for C of genus 2 the image is a theta divisor.

Direct prerequisites:

- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`
- `SchemeAndStackFoundations:SF.3`

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §5.7 (Jacobians as Albanese varieties) and Example 5.12.11, pp. 138–153. The Albanese torsor and the map from a curve to its Jacobian.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP6-genus-zero-classification"></a>
### Rational points on genus-zero curves

*Theorem · node `HeightsRationalPointsAndObstructions:RP.6/genus-zero-classification` · declaration `TauCeti.Curve.genusZero_hasse` · module `TauCeti/NumberTheory/RationalPoints/Classification`*

Let C be a smooth projective geometrically connected curve of genus 0 over a number field K. Then C is isomorphic to a smooth plane conic; C satisfies the Hasse principle; if C(K) ≠ ∅ then C ≅ ℙ¹_K, C(K) is infinite and Zariski dense, and C satisfies weak approximation. Whether C(K) ≠ ∅ is decided by finitely many local conditions (the places where the associated quaternion algebra ramifies).

Hypotheses and conventions:

- K a number field; genus 0.

Construction or proof:

1. Anticanonical embedding as a conic (SchemeAndStackFoundations SF.3/projective-line-characterization); Hasse–Minkowski for ternary forms (GlobalQuadraticForms Layer 5); a point gives ℙ¹ by projection.
2. Brauer–Manin is vacuous on conics (RP.2/conic-example).

Checks:

- x² + y² = z² ≅ ℙ¹_ℚ; x² + y² = 3z² has no rational point.

Direct prerequisites:

- `SchemeAndStackFoundations:SF.3`
- `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy`
- [Conics: Brauer–Manin set and the Hasse principle](#RP2-conic-example) (`HeightsRationalPointsAndObstructions:RP.2/conic-example`)
- [Local solubility and the local-global principle](#RP6-local-solubility) (`HeightsRationalPointsAndObstructions:RP.6/local-solubility`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §4.5, Example 4.5.8 and Theorems 4.5.10–4.5.11, printed pp.106–108. One-dimensional Severi–Brauer varieties are conics and satisfy the local-global principle over global fields.

Outstanding proof or supplier contracts: Unplanned scheme, curve and line-bundle supplier contracts.

<a id="RP6-genus-one-classification"></a>
### Rational points on genus-one curves

*Theorem · node `HeightsRationalPointsAndObstructions:RP.6/genus-one-classification` · declaration `TauCeti.Curve.genusOne_classification` · module `TauCeti/NumberTheory/RationalPoints/Classification`*

Let C be a smooth projective geometrically connected curve of genus 1 over a number field K with Jacobian E. Then: C is an E-torsor with class [C] ∈ H¹(K, E) (RP.3/genus-one-torsors); C(K) ≠ ∅ iff [C] = 0, and then C ≅ E and C(K) ≅ E(K) is a finitely generated group (Mordell–Weil), finite or infinite according to the rank; if C is locally soluble, [C] ∈ Ш(E/K), and C(K) = ∅ is possible (a positive proportion of locally soluble genus-one curves y² = f(x), Bhargava–Gross–Wang Theorem 10 with g = 1). If Ш(E/K) is finite, the only obstruction to C(K) ≠ ∅ is the Brauer–Manin obstruction (Manin); the finiteness of Ш remains conjectural; the preceding Brauer–Manin sufficiency statement is a proved conditional theorem and uses finiteness explicitly.

Hypotheses and conventions:

- K a number field; genus 1.

Construction or proof:

1. Torsor classification (RP.3/genus-one-torsors); Mordell–Weil for E (TauCetiRoadmap EllipticCurves Layer 6; RP.1/mordell-weil).
2. Locally soluble failures: RP.3/bgw-hasse-failures.
3. Manin's theorem: the Cassels–Tate pairing on Ш(E/K) is computed by the Brauer–Manin pairing of algebraic classes on C (Skorobogatov, Torsors and rational points §6.2); stated conditionally on finiteness of Ш.

Checks:

- The curves 2w² = x⁴ + 1 and w² = x⁴ + 1 have rational points and are elliptic curves of rank 0 (Poonen §8.3).

Direct prerequisites:

- [Genus-one curves as torsors and the Weil–Châtelet group](#RP3-genus-one-torsors) (`HeightsRationalPointsAndObstructions:RP.3/genus-one-torsors`)
- [The Mordell–Weil theorem](#RP1-mordell-weil) (`HeightsRationalPointsAndObstructions:RP.1/mordell-weil`)
- [Selmer groups and Tate–Shafarevich groups of abelian varieties](#RP1-selmer-group) (`HeightsRationalPointsAndObstructions:RP.1/selmer-group`)
- [Hasse principle failures for J¹ and Sym^k C with Brauer–Manin obstruction](#RP3-bgw-hasse-failures) (`HeightsRationalPointsAndObstructions:RP.3/bgw-hasse-failures`)
- [The Brauer–Manin pairing and set for varieties](#RP2-brauer-manin-general) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §5.12, Example 5.12.12 and Proposition 5.12.14, pp. 153–155; §8.3, pp. 236–238. Genus-one curves are torsors under their Jacobians; worked rank-zero examples.
- [M. Bhargava, B. H. Gross, X. Wang, *A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension*](https://arxiv.org/abs/1310.7692v2), Theorem 10, p. 3. A positive proportion of locally soluble genus-one (g = 1) curves y² = f(x) have no rational point, by a Brauer–Manin obstruction.

Outstanding proof or supplier contracts: Manin's interpretation of Ш through the Brauer–Manin pairing.

<a id="RP6-higher-genus-classification"></a>
### Rational points on curves of genus at least two

*Theorem · node `HeightsRationalPointsAndObstructions:RP.6/higher-genus-classification` · declaration `TauCeti.Curve.higherGenus_finite` · module `TauCeti/NumberTheory/RationalPoints/Classification`*

Let C be a smooth projective geometrically connected curve of genus g ≥ 2 over a number field K. Then C(K) is finite (Faltings), by either proof route (RP.4/mordell-faltings or RP.5/vojta-bombieri-mordell); ι(C)(K̄) ∩ Γ is finite for every finite-rank Γ ⊆ J(K̄) (Mordell–Lang); points of small Néron–Tate height on ι(C) are finite (Bogomolov). No proved theorem gives an algorithm listing C(K) in general; for curves over function fields the analogue holds for non-isotrivial curves.

Hypotheses and conventions:

- K a number field; g ≥ 2.
- Choose a degree-one Picard class after a finite extension to define ι if needed, or work in the Pic¹ torsor. The curve’s rational points transfer back by the closed immersion.

Construction or proof:

1. Faltings: RP.4/mordell-faltings; Mordell–Lang and Bogomolov on ι(C): RP.5/mordell-lang, RP.5/bogomolov, transferred by curve-in-jacobian; function fields: RP.4/function-field-mordell.

Checks:

- y² = (x² + 1)(x⁴ + 1) over ℚ has exactly eight rational points (RP.3/descent-worked-example).

Direct prerequisites:

- [The Mordell conjecture (Faltings' theorem)](#RP4-mordell-faltings) (`HeightsRationalPointsAndObstructions:RP.4/mordell-faltings`)
- [The Mordell–Lang theorem](#RP5-mordell-lang) (`HeightsRationalPointsAndObstructions:RP.5/mordell-lang`)
- [The Bogomolov conjecture (Ullmo–Zhang)](#RP5-bogomolov) (`HeightsRationalPointsAndObstructions:RP.5/bogomolov`)
- [Rational points of curves through the Abel–Jacobi embedding](#RP6-curve-in-jacobian) (`HeightsRationalPointsAndObstructions:RP.6/curve-in-jacobian`)
- [The Mordell conjecture over function fields](#RP4-function-field-mordell) (`HeightsRationalPointsAndObstructions:RP.4/function-field-mordell`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §9.5.1, Theorem 9.5.1 and Remark 9.5.2, p. 286. Faltings' theorem and the ineffectivity of known proofs.

<a id="RP6-conjecture-register"></a>
### Statements of the open conjectures (no consumer treats them as proved)

*Definition · node `HeightsRationalPointsAndObstructions:RP.6/conjecture-register` · module `TauCeti/NumberTheory/RationalPoints/Conjectures`*

The following are defined as propositions, never assumed by a theorem of this roadmap: (a) Bombieri–Lang: for a geometrically integral variety X of general type over a number field K with dim X > 0, X(K) is not Zariski dense; (b) Vojta's main conjecture for a smooth projective X with canonical divisor K_X, ample A, normal crossings divisor D, finite set of places S and ε > 0: Σ_{v∈S} λ_{D,v}(x) + h_{K_X}(x) ≤ ε·h_A(x) + O(1) outside a proper Zariski closed subset; (c) Colliot-Thélène's conjecture: for smooth proper geometrically rationally connected X over a number field, X(K) is dense in X(𝔸_K)^{Br}; (d) finiteness of Ш(A/K) for abelian varieties over number fields. Each is a definition of a Prop with a precise statement; the register records which special cases are theorems (curves for (a) by Faltings; conics and Châtelet surfaces with few degenerate fibres for (c)). In (b), quantify over rational points x∈X(K) outside Supp(D)∪Z, require S to contain all archimedean places, choose Z depending on the geometric data and ε, and allow a uniform additive constant depending on the fixed data and S. This is the rational-point, untruncated ε-height form; no bounded-degree discriminant or truncated-counting version is asserted.

Hypotheses and conventions:

- Statements only; hypotheses as in Poonen §9.5.3 and §9.2.

Construction or proof:

1. Write each statement over the carriers of this roadmap (rational points, Weil heights and local Weil functions, Brauer–Manin sets, Ш).

Planning API:

- `TauCeti.BombieriLangConjecture` (constructor): The proposition (a), quantified over K and X.
- `TauCeti.VojtaConjecture` (constructor): The proposition (b).
- `TauCeti.BrauerManinOnlyObstructionConjecture` (constructor): The proposition (c) for rationally connected varieties.
- `TauCeti.ShaFinitenessConjecture` (constructor): The proposition (d).
- `TauCeti.bombieriLang_curves` (example): The case dim X = 1 of (a) holds (Faltings).

Unit tests:

- **BombieriLangConjecture.test_curves** (compatibility): Restricted to curves of genus ≥ 2, (a) is equivalent to RP.4/mordell-faltings.
- **BombieriLangConjecture.test_dim_zero** (degenerate): The hypothesis dim X > 0 excludes points, for which the statement would be false (a rational point is Zariski dense in itself).
- **BrauerManinOnlyObstructionConjecture.test_conic** (computation): For conics (c) holds (RP.2/conic-example).
- **BrauerManinOnlyObstructionConjecture.test_not_general_type** (non-example): (c) is false without rational connectedness: Skorobogatov's bielliptic surface (RP.3/insufficiency-examples) has X(𝔸)^{Br} ≠ ∅ = X(ℚ).

Checks:

- For curves, (a) is Faltings' theorem (higher-genus-classification).

Consumers:

- worked classification theorems: record which cases of the conjectures are proved
- EffectiveDiophantineMethods: certified enumeration is stated separately and never deduced from these

Direct prerequisites:

- [Weil's height machine](#RP0-weil-height-machine) (`HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`)
- [Local Weil functions and Néron functions](#RP0-local-weil-functions) (`HeightsRationalPointsAndObstructions:RP.0/local-weil-functions`)
- [The Brauer–Manin pairing and set for varieties](#RP2-brauer-manin-general) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general`)
- [Selmer groups and Tate–Shafarevich groups of abelian varieties](#RP1-selmer-group) (`HeightsRationalPointsAndObstructions:RP.1/selmer-group`)

Sources:

- [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf), §9.5.3, Conjecture 9.5.11, printed p.288; Conjecture 9.2.27, printed p.267. States Bombieri–Lang and the rationally connected local-global conjecture. The density/weak-approximation form is sourced separately to Harpaz–Wittenberg 2024 Conjecture 1.1.
- [Paul Vojta, *Diophantine Approximation and Nevanlinna Theory*](https://math.berkeley.edu/~vojta/cime/cime.pdf), §14, Conjecture 14.6(b), printed p.160; contrast §24, Conjecture 24.1, printed p.200. Gives the rational-point main inequality; the algebraic-point extension separately includes a discriminant term and degree bound.
- [Yonatan Harpaz and Olivier Wittenberg, *Supersolvable descent for rational points*](https://msp.org/ant/2024/18-4/ant-v18-n4-p05-s.pdf), §1, Conjecture 1.1, printed p.787. States the density form of the Colliot-Thélène conjecture for rationally connected varieties. On proper varieties the local product/unramified Brauer formulation is the adelic/Brauer formulation in this register.

## Requests to other roadmaps

These are precise interface requests. A stage citation records the requested scope; it does not claim that the requested target is already provided. Fine-grained supplier targets and native declarations are used in preference to stage requests whenever they exist.

### Interface 1: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality

For each place v of a number field K, the local invariant inv_v : Br(K_v) → ℚ/ℤ on Mathlib's Brauer group of central simple algebras over the completion (isomorphism at finite places, ½ℤ/ℤ at real places, 0 at complex places), additive for Tau Ceti's BrauerGroup group structure; its compatibility with corestriction (inv_w = inv_v ∘ cor for w | v); and the local invariant of a cyclic algebra (χ, a), zero exactly when a is a local norm.

Consumers: [The Brauer–Manin pairing and the Brauer–Manin set](#RP2-brauer-manin-pairing) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-pairing`), [The Brauer–Manin pairing and set for varieties](#RP2-brauer-manin-general) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general`), [The Brauer–Manin pairing on zero-cycles](#RP2-zero-cycle-brauer-pairing) (`HeightsRationalPointsAndObstructions:RP.2/zero-cycle-brauer-pairing`), [Cyclic algebras and the local invariant matrix](#RP2-cyclic-norm-class) (`HeightsRationalPointsAndObstructions:RP.2/cyclic-norm-class`).

### Interface 2: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants

The reciprocity law Σ_v inv_v(res_v β) = 0 for β ∈ Br(K) of a number field K, with res_v β trivial for almost all v, the injectivity Br(K) → ⊕_v Br(K_v) (Albert–Brauer–Hasse–Noether), and H³(K, 𝔾_m) = 0.

Consumers: [Rational points lie in the Brauer–Manin set](#RP2-rational-points-in-brauer-manin-set) (`HeightsRationalPointsAndObstructions:RP.2/rational-points-in-brauer-manin-set`), [The Brauer–Manin pairing and set for varieties](#RP2-brauer-manin-general) (`HeightsRationalPointsAndObstructions:RP.2/brauer-manin-general`), [Constant and algebraic Brauer groups](#RP2-algebraic-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/algebraic-brauer-group`), [The Brauer–Manin pairing on zero-cycles](#RP2-zero-cycle-brauer-pairing) (`HeightsRationalPointsAndObstructions:RP.2/zero-cycle-brauer-pairing`), [The cyclic norm principle with one omitted place](#RP2-cyclic-norm-one-place) (`HeightsRationalPointsAndObstructions:RP.2/cyclic-norm-one-place`), [Assembling a global norm from a local invariant matrix](#RP2-product-norm-assembly) (`HeightsRationalPointsAndObstructions:RP.2/product-norm-assembly`).

### Interface 3: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields

The cyclic Hasse norm theorem (cyclicHasseNorm): for a cyclic extension L/K of number fields, an element of K^× that is a local norm at every place is a global norm.

Consumers: [The cyclic norm principle with one omitted place](#RP2-cyclic-norm-one-place) (`HeightsRationalPointsAndObstructions:RP.2/cyclic-norm-one-place`).

### Interface 4: tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5

The pointed-twist classification H¹(Gal(K^sep/K), Aut(E, O)) of elliptic curves, used only for the comparison with genus-one torsors (pointed twists always have a rational point).

Consumers: [Genus-one curves as torsors and the Weil–Châtelet group](#RP3-genus-one-torsors) (`HeightsRationalPointsAndObstructions:RP.3/genus-one-torsors`).

### Interface 5: tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii

Mordell–Weil and weak Mordell–Weil for elliptic curves over number fields (fg_point_of_numberField), the explicit 2-descent with its rank bound, and the canonical height WeierstrassCurve.Affine.Point.canonicalHeight with its normalisation to the divisor (O).

Consumers: [The weak Mordell–Weil theorem](#RP1-weak-mordell-weil) (`HeightsRationalPointsAndObstructions:RP.1/weak-mordell-weil`), [The Mordell–Weil theorem](#RP1-mordell-weil) (`HeightsRationalPointsAndObstructions:RP.1/mordell-weil`), [A complete elliptic 2-descent](#RP1-elliptic-two-descent-example) (`HeightsRationalPointsAndObstructions:RP.1/elliptic-two-descent-example`).

### Interface 6: tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4

The Selmer-structure constructor on a discrete Galois module (local-condition subgroups unramified at almost all places), its Selmer group, the forced-discrete continuous cohomology, the Weil–Châtelet group H¹(K, E) with Ш inside it, and Selmer groups of an arbitrary isogeny with their Kummer sequences; these are instantiated for abelian varieties without being redefined.

Consumers: [Kummer maps of isogenies of abelian varieties](#RP1-kummer-map) (`HeightsRationalPointsAndObstructions:RP.1/kummer-map`), [Selmer groups and Tate–Shafarevich groups of abelian varieties](#RP1-selmer-group) (`HeightsRationalPointsAndObstructions:RP.1/selmer-group`), [The descent exact sequence](#RP1-descent-sequence) (`HeightsRationalPointsAndObstructions:RP.1/descent-sequence`), [The Kummer map of a two-isogeny](#RP1-two-isogeny-kummer-formula) (`HeightsRationalPointsAndObstructions:RP.1/two-isogeny-kummer-formula`), [Genus-one curves as torsors and the Weil–Châtelet group](#RP3-genus-one-torsors) (`HeightsRationalPointsAndObstructions:RP.3/genus-one-torsors`).

### Interface 7: tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy

Hasse–Minkowski for ternary quadratic forms over number fields (a smooth conic with points everywhere locally has a rational point).

Consumers: [Conics: Brauer–Manin set and the Hasse principle](#RP2-conic-example) (`HeightsRationalPointsAndObstructions:RP.2/conic-example`), [Rational points on genus-zero curves](#RP6-genus-zero-classification) (`HeightsRationalPointsAndObstructions:RP.6/genus-zero-classification`).

### Interface 8: tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property

The Jacobian of a smooth projective curve with a degree-one divisor class and the Abel–Jacobi morphism C → J with its universal property, a closed immersion for genus ≥ 1.

Consumers: [De Franchis' theorem](#RP4-de-franchis) (`HeightsRationalPointsAndObstructions:RP.4/de-franchis`), [The Kodaira–Parshin construction](#RP4-kodaira-parshin-construction) (`HeightsRationalPointsAndObstructions:RP.4/kodaira-parshin-construction`), [Vojta's inequality](#RP5-vojta-inequality) (`HeightsRationalPointsAndObstructions:RP.5/vojta-inequality`), [Rational points of curves through the Abel–Jacobi embedding](#RP6-curve-in-jacobian) (`HeightsRationalPointsAndObstructions:RP.6/curve-in-jacobian`).

### Interface 9: SchemeAndStackFoundations:SF.2

Gabber–de Jong: for a quasi-projective scheme over a field (more generally a scheme with an ample line bundle), the Azumaya Brauer group of key/scheme-brauer maps isomorphically onto the torsion Br'(X) of H²_ét(X, 𝔾_m); equivalently every torsion class comes from some PGL_n-torsor (Poonen Corollary 6.6.19). The SF.2 plan has δ_X : Br_Az → H² and Br' but not this comparison.

Consumers: [Descent is at least as strong as Brauer–Manin](#RP3-descent-brauer-comparison) (`HeightsRationalPointsAndObstructions:RP.3/descent-brauer-comparison`).

### Interface 10: SchemeAndStackFoundations:SF.1

Missing target SchemeAndStackFoundations:SF.1/artin-bootstrap. For a finite-type group scheme G over a field and a closed subgroup H, construct the separated finite-type scheme G/H representing the fppf quotient, with faithfully flat quotient map, G×H≃G×_{G/H}G, base-change compatibility and the invariant-map universal property (Conrad Theorem 3.7, p.6). For normal H give its group structure; for an abelian variety and an abelian subvariety prove the quotient is an abelian variety. An algebraic-space representability slogan alone does not supply this contract. This is a requested contract, not an existing supplier theorem.

Consumers: [Chow's K/k-trace](#RP1-kk-trace) (`HeightsRationalPointsAndObstructions:RP.1/kk-trace`), [Abelian subvarieties, cosets and quotients](#RP5-abelian-subvariety) (`HeightsRationalPointsAndObstructions:RP.5/abelian-subvariety`).

### Interface 11: SchemeAndStackFoundations:SF.1

Missing target SchemeAndStackFoundations:SF.1/contracted-product. For a right G-torsor P and a left G-space Z, construct P×^G Z as the fppf quotient of P×Z by (p,z)·g=(pg,g⁻¹z), prove descent and base-change compatibility and identify it with Z after a trivialization. Give the induced torsor under the inner form; for commutative G identify twisting by the inverse class with subtraction in H¹. This is a requested contract, not an existing supplier theorem.

Consumers: [Evaluation of torsors and twisted torsors](#RP3-torsor-evaluation) (`HeightsRationalPointsAndObstructions:RP.3/torsor-evaluation`).

### Interface 12: SchemeAndStackFoundations:SF.1

Missing target SchemeAndStackFoundations:SF.1/quotient-sheaf. Construct the fppf quotient sheaf A/B for an abelian subvariety B of an abelian variety A over a field, its group structure and faithfully flat projection with kernel B, and prove it is represented by a smooth proper geometrically connected scheme. Supply the universal property and base-change law. Quotients by finite subgroups alone do not cover B of positive dimension. This is a requested contract, not an existing supplier theorem.

Consumers: [Abelian subvarieties, cosets and quotients](#RP5-abelian-subvariety) (`HeightsRationalPointsAndObstructions:RP.5/abelian-subvariety`).

### Interface 13: SchemeAndStackFoundations:SF.1

Missing target SchemeAndStackFoundations:SF.1/stabilizer. For a closed subscheme X of an abelian variety A, represent the functor T↦{a∈A(T):t_a(X_T)=X_T} as a closed subgroup scheme Stab(X), with base-change compatibility. In characteristic zero its identity component is an abelian subvariety, X is invariant under it and descends along A→A/Stab(X)⁰. Keep scheme structure in characteristic p; reduced geometric stabilizer points do not suffice. This is a requested contract, not an existing supplier theorem.

Consumers: [Stabilizers of subvarieties](#RP5-stabilizer) (`HeightsRationalPointsAndObstructions:RP.5/stabilizer`).

### Interface 14: SchemeAndStackFoundations:SF.1

Missing target SchemeAndStackFoundations:SF.1/torsor. Define an fppf G-torsor P→X by faithful-flat local triviality and the isomorphism P×G≃P×_X P. Give constructors for the trivial torsor and fibres of an isogeny, pullback, equivariant morphisms/isomorphisms and descent. For an abelian isogeny φ:A→B prove A→B is a ker φ-torsor; in the étale API require deg φ invertible. This is a requested contract, not an existing supplier theorem.

Consumers: [Kummer maps of isogenies of abelian varieties](#RP1-kummer-map) (`HeightsRationalPointsAndObstructions:RP.1/kummer-map`), [Two-coverings of torsors and the class W[2]](#RP1-two-coverings) (`HeightsRationalPointsAndObstructions:RP.1/two-coverings`), [Evaluation of torsors and twisted torsors](#RP3-torsor-evaluation) (`HeightsRationalPointsAndObstructions:RP.3/torsor-evaluation`), [Universal torsors and torsors of a given type](#RP3-universal-torsor) (`HeightsRationalPointsAndObstructions:RP.3/universal-torsor`).

### Interface 15: SchemeAndStackFoundations:SF.1

Missing target SchemeAndStackFoundations:SF.1/torsor-cohomology. Identify isomorphism classes of G-torsors over a field with pointed H¹_fppf(k,G), including the trivial class, restriction to extensions/completions, connecting classes for an exact group-scheme sequence and compatibility with pullback/evaluation at a rational point. For smooth G compare with Galois/étale H¹; retain fppf cohomology for non-étale p-torsion. This is a requested contract, not an existing supplier theorem.

Consumers: [Kummer maps of isogenies of abelian varieties](#RP1-kummer-map) (`HeightsRationalPointsAndObstructions:RP.1/kummer-map`), [Evaluation of torsors and twisted torsors](#RP3-torsor-evaluation) (`HeightsRationalPointsAndObstructions:RP.3/torsor-evaluation`), [Universal torsors and torsors of a given type](#RP3-universal-torsor) (`HeightsRationalPointsAndObstructions:RP.3/universal-torsor`), [Genus-one curves as torsors and the Weil–Châtelet group](#RP3-genus-one-torsors) (`HeightsRationalPointsAndObstructions:RP.3/genus-one-torsors`).

### Interface 16: SchemeAndStackFoundations:SF.1

Missing target SchemeAndStackFoundations:SF.1/twisting-bijection. Given a G-torsor P of class τ, construct the inner form G^τ and the pointed bijection H¹(k,G^τ)→H¹(k,G) taking its neutral element to τ, compatibly with field restriction. For a commutative group identify a twist Z^τ with class [Z]−π*τ and prove a fibre over x is trivial exactly when evaluation equals τ. Distinguish two-covering classes from their images in H¹(k,J). This is a requested contract, not an existing supplier theorem.

Consumers: [Two-coverings of torsors and the class W[2]](#RP1-two-coverings) (`HeightsRationalPointsAndObstructions:RP.1/two-coverings`), [Evaluation of torsors and twisted torsors](#RP3-torsor-evaluation) (`HeightsRationalPointsAndObstructions:RP.3/torsor-evaluation`).

### Interface 17: SchemeAndStackFoundations:SF.2

Missing target SchemeAndStackFoundations:SF.2/brauer-henselian-local. For a henselian local ring R identify the torsion étale Brauer group with that of its residue field under the relevant smooth/étale hypotheses, and prove that evaluation of a fixed Brauer class on a smooth variety over a nonarchimedean local field is locally constant in the analytic topology. Include the real/complex counterpart used in Poonen Proposition 8.2.9. No uniform discreteness claim for evaluation into Hom(Br X,ℚ/ℤ) is requested. This is a requested contract, not an existing supplier theorem.

Consumers: [Local constancy of Brauer evaluation](#RP2-brauer-local-constancy) (`HeightsRationalPointsAndObstructions:RP.2/brauer-local-constancy`).

### Interface 18: SchemeAndStackFoundations:SF.2

Missing target SchemeAndStackFoundations:SF.2/brauer-hochschild-serre-sequence. For a smooth geometrically integral variety X/k with k̄[X]×=k̄×, construct the Hochschild–Serre edge map Br₁(X)→H¹(k,Pic X̄), its kernel equal to the image of Br(k), and the connecting map to H³(k,𝔾_m), with naturality. State the full low-degree sequence, including the obstruction Pic(X̄)^G→Br(k). Over a number field H³=0 gives the stated quotient comparison; do not assume Br(k) injects without justification. This is a requested contract, not an existing supplier theorem.

Consumers: [Constant and algebraic Brauer groups](#RP2-algebraic-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/algebraic-brauer-group`).

### Interface 19: SchemeAndStackFoundations:SF.2

Missing target SchemeAndStackFoundations:SF.2/brauer-regular-injectivity. For a regular integral noetherian scheme X inject Br(X) into Br(k(X)); identify it with the intersection of the Brauer groups of its codimension-one local rings, with residue maps and purity hypotheses explicit (Česnavičius Theorem 1.1). Deduce unramifiedness of classes extending to a smooth proper model at every rank-one discrete valuation using properness. The reverse direction for all valuations additionally uses a smooth proper model/resolution and is a separate gap. This is a requested contract, not an existing supplier theorem.

Consumers: [The unramified Brauer group](#RP2-unramified-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/unramified-brauer-group`).

### Interface 20: SchemeAndStackFoundations:SF.3

Missing target SchemeAndStackFoundations:SF.3/abel-maps-high-degree. For a smooth projective geometrically connected curve C/k of genus g and d≥2g−1, construct Sym^d(C)→Pic^d(C), surjective after fppf/geometric base change, with fibres projective spaces of dimension d−g when the corresponding line bundle exists; use Riemann–Roch and H¹-vanishing. State any Poincaré-bundle/section hypothesis for a global projective-bundle presentation. Supply the tangent/cohomology calculation used to make the degree-one Abel map a closed immersion for g≥1. This is a requested contract, not an existing supplier theorem.

Consumers: [Rational points of curves through the Abel–Jacobi embedding](#RP6-curve-in-jacobian) (`HeightsRationalPointsAndObstructions:RP.6/curve-in-jacobian`).

### Interface 21: SchemeAndStackFoundations:SF.3

Missing target SchemeAndStackFoundations:SF.3/degree-zero-class-comparison. Identify the Jacobian with the degree-zero Picard scheme and define degree-one Picard torsors and the difference map Pic¹×Pic¹→Pic⁰. Separate Pic^d(k) from actual k-line bundles and divisors using the Brauer obstruction exact sequence; with a k-rational point or a chosen degree-one line bundle specify the trivialization and Abel–Jacobi map. Include the hyperelliptic degree-two class and x↦2x−d, whose H¹(J) class is Pic¹. This is a requested contract, not an existing supplier theorem.

Consumers: [Two-coverings of torsors and the class W[2]](#RP1-two-coverings) (`HeightsRationalPointsAndObstructions:RP.1/two-coverings`), [The Kodaira–Parshin construction](#RP4-kodaira-parshin-construction) (`HeightsRationalPointsAndObstructions:RP.4/kodaira-parshin-construction`), [Rational points of curves through the Abel–Jacobi embedding](#RP6-curve-in-jacobian) (`HeightsRationalPointsAndObstructions:RP.6/curve-in-jacobian`).

### Interface 22: SchemeAndStackFoundations:SF.3

Missing target SchemeAndStackFoundations:SF.3/genus-base-change. For a smooth proper geometrically connected curve prove that dim H¹(C,O_C) and the arithmetic/geometric genus are invariant under field extension. For a smooth proper family of geometrically connected curves over a connected noetherian base prove genus is locally constant and therefore constant, via cohomology-and-base-change/Euler characteristic. Apply this to smooth models over O_{K,S}. This is a requested contract, not an existing supplier theorem.

Consumers: [Curves with good reduction outside S](#RP4-good-reduction-curve) (`HeightsRationalPointsAndObstructions:RP.4/good-reduction-curve`).

### Interface 23: SchemeAndStackFoundations:SF.3

Missing target SchemeAndStackFoundations:SF.3/genus-one-curves. For a smooth projective geometrically connected genus-one curve C/k, construct Jac(C) and its canonical action making C a torsor under Jac(C), identify its class in H¹(k,Jac(C)), and prove C(k)≠∅ iff the torsor class vanishes. A chosen k-point makes C an elliptic curve. Classify marked torsors by H¹(k,E), then distinguish unmarked curves by the action of Aut_k(E). This is a requested contract, not an existing supplier theorem.

Consumers: [Genus-one curves as torsors and the Weil–Châtelet group](#RP3-genus-one-torsors) (`HeightsRationalPointsAndObstructions:RP.3/genus-one-torsors`).

### Interface 24: SchemeAndStackFoundations:SF.3

Missing target SchemeAndStackFoundations:SF.3/picard-cohomological. Compare line bundles with H¹(X,𝔾_m) in the Zariski/étale/fppf settings used here, compatibly with tensor product, pullback and descent. Provide the relative Picard functor/scheme and the distinction between its rational points and descended line bundles; for universal torus torsors supply the character-to-Picard type map and its obstruction exact sequence with geometric units hypotheses. This is a requested contract, not an existing supplier theorem.

Consumers: [Weil's height machine](#RP0-weil-height-machine) (`HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`), [Universal torsors and torsors of a given type](#RP3-universal-torsor) (`HeightsRationalPointsAndObstructions:RP.3/universal-torsor`).

### Interface 25: SchemeAndStackFoundations:SF.3

Missing target SchemeAndStackFoundations:SF.3/projective-line-characterization. For a smooth projective geometrically connected genus-zero curve over k, prove that a k-point yields an isomorphism with ℙ¹_k, and realize the curve as a smooth plane conic/degree-two form. Keep the rational-point hypothesis; apply Hasse–Minkowski over number fields as a separate supplier theorem, not as part of the geometric classification. This is a requested contract, not an existing supplier theorem.

Consumers: [Rational points on genus-zero curves](#RP6-genus-zero-classification) (`HeightsRationalPointsAndObstructions:RP.6/genus-zero-classification`).

### Interface 26: SchemeAndStackFoundations:SF.3

Missing target SchemeAndStackFoundations:SF.3/scheme-riemann-hurwitz. For a finite separable morphism f:C→D of smooth projective geometrically connected curves, give the different/ramification divisor and 2g(C)−2=deg(f)(2g(D)−2)+deg Diff_f. State the tame degree-two special case with its branch count in characteristic different from two. Supply the separability/characteristic-zero condition in de Franchis and the genus calculation for the full-branch Kodaira–Parshin cover. This is a requested contract, not an existing supplier theorem.

Consumers: [De Franchis' theorem](#RP4-de-franchis) (`HeightsRationalPointsAndObstructions:RP.4/de-franchis`), [The Kodaira–Parshin construction](#RP4-kodaira-parshin-construction) (`HeightsRationalPointsAndObstructions:RP.4/kodaira-parshin-construction`).

### Interface 27: SchemeAndStackFoundations:SF.4

Missing target SchemeAndStackFoundations:SF.4/resolution-of-curves. For an integral projective curve over a perfect field, produce its finite normalization and smooth projective model and compare its function field. Specify extension and uniqueness of smooth proper models over a DVR when good reduction is already known. Resolution alone does not establish good reduction, and curve-only resolution does not supply the arbitrary-dimensional compactifications used in RP.0 and RP.2. This is a requested contract, not an existing supplier theorem.

Consumers: [Curves with good reduction outside S](#RP4-good-reduction-curve) (`HeightsRationalPointsAndObstructions:RP.4/good-reduction-curve`).

### Interface 28: SchemeAndStackFoundations:SF.5

Missing target SchemeAndStackFoundations:SF.5/ample. Define ample line bundles and their stability under tensor powers, finite pullback and products on projective schemes; give positivity of top intersection degrees on positive-dimensional integral projective subvarieties. For a projective model B of a function field, state the ample-polarization intersection degrees and their finite-base-change scaling used to normalize geometric heights. This is a requested contract, not an existing supplier theorem.

Consumers: [Polarized function fields as generalized global fields](#RP0-geometric-height-field) (`HeightsRationalPointsAndObstructions:RP.0/geometric-height-field`), [Weil's height machine](#RP0-weil-height-machine) (`HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`), [Heights of subvarieties over polarized function fields](#RP0-geometric-subvariety-height) (`HeightsRationalPointsAndObstructions:RP.0/geometric-subvariety-height`).

### Interface 29: SchemeAndStackFoundations:SF.5

Missing target SchemeAndStackFoundations:SF.5/chern-projection. Supply first-Chern-class intersections with cycles on proper schemes, multilinearity, rational-equivalence invariance and the proper projection formula f_*(c₁(f*L)·α)=c₁(L)·f_*α, including pushforward field-degree multiplicities and flat base change. Give degrees of subvarieties, Segre/product intersection rules and finite-map degree scaling. These are the geometric contracts for heights and Bézout estimates; Brauer reciprocity on CH₀ remains a distinct request. This is a requested contract, not an existing supplier theorem.

Consumers: [Polarized function fields as generalized global fields](#RP0-geometric-height-field) (`HeightsRationalPointsAndObstructions:RP.0/geometric-height-field`), [Heights of subvarieties over polarized function fields](#RP0-geometric-subvariety-height) (`HeightsRationalPointsAndObstructions:RP.0/geometric-subvariety-height`), [Laws for function-field canonical heights](#RP0-geometric-height-laws) (`HeightsRationalPointsAndObstructions:RP.0/geometric-height-laws`), [Function-field heights under finite and constant field extensions](#RP0-geometric-height-base-change) (`HeightsRationalPointsAndObstructions:RP.0/geometric-height-base-change`), [The Brauer–Manin pairing on zero-cycles](#RP2-zero-cycle-brauer-pairing) (`HeightsRationalPointsAndObstructions:RP.2/zero-cycle-brauer-pairing`), [The abelian subvariety generated by X − X](#RP5-generated-abelian-subvariety) (`HeightsRationalPointsAndObstructions:RP.5/generated-abelian-subvariety`), [Hypersurface sections of abelian varieties containing no cosets](#RP5-coset-free-hypersurface-sections) (`HeightsRationalPointsAndObstructions:RP.5/coset-free-hypersurface-sections`).

### Interface 30: SchemeAndStackFoundations:SF.5

Missing target SchemeAndStackFoundations:SF.5/very-ample. Define very ample line bundles via closed immersions into projective space, the complete-linear-system embedding when applicable, pullback of O(1), and powers of an ample bundle becoming very ample. Prove projective-normality implies surjectivity of polynomial sections in the specified degree; keep this extra hypothesis in quartic duplication. Supply degree/Bézout control for intersections and morphism-coordinate height comparisons. This is a requested contract, not an existing supplier theorem. For any line bundle L on a projective variety supply L=M⊗N⁻¹ with M,N globally generated, and finite generating families. Compare two presentations on patches where a generating section has maximal norm, by no-common-zero polynomial relations with finitely many ground-field coefficients. These local estimates supply bounded-point-metrics and summable bounds for algebraically transported metric families; global height comparison alone is not the local bound.

Consumers: [Heights along morphisms to projective space](#RP0-morphism-height-comparison) (`HeightsRationalPointsAndObstructions:RP.0/morphism-height-comparison`), [Weil's height machine](#RP0-weil-height-machine) (`HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`), [Stabilizers of subvarieties](#RP5-stabilizer) (`HeightsRationalPointsAndObstructions:RP.5/stabilizer`), [Bounded metric families for point heights](#RP0-bounded-point-metrics) (`HeightsRationalPointsAndObstructions:RP.0/bounded-point-metrics`), [Canonical point metrics by contraction](#RP0-canonical-point-metrics) (`HeightsRationalPointsAndObstructions:RP.0/canonical-point-metrics`).

### Interface 31: SchemeAndStackFoundations:SF.1

Represent smooth affine group torsors and the fppf quotient sheaf; contracted products, evaluation, inner-form twisting, and the bijection sending the chosen torsor class to the trivial class. For commutative groups use [Z^τ]=[Z]−π*τ. For abelian-subvariety quotients prove that the field quotient is an abelian variety; algebraic-space representability alone is insufficient.

Consumers: [Evaluation of torsors and twisted torsors](#RP3-torsor-evaluation) (`HeightsRationalPointsAndObstructions:RP.3/torsor-evaluation`), [The descent partition of rational points](#RP3-descent-partition) (`HeightsRationalPointsAndObstructions:RP.3/descent-partition`), [The Selmer set of a torsor](#RP3-selmer-set-of-torsor) (`HeightsRationalPointsAndObstructions:RP.3/selmer-set-of-torsor`), [Descent is at least as strong as Brauer–Manin](#RP3-descent-brauer-comparison) (`HeightsRationalPointsAndObstructions:RP.3/descent-brauer-comparison`), [Universal torsors and torsors of a given type](#RP3-universal-torsor) (`HeightsRationalPointsAndObstructions:RP.3/universal-torsor`), [Genus-one curves as torsors and the Weil–Châtelet group](#RP3-genus-one-torsors) (`HeightsRationalPointsAndObstructions:RP.3/genus-one-torsors`), [Abelian subvarieties, cosets and quotients](#RP5-abelian-subvariety) (`HeightsRationalPointsAndObstructions:RP.5/abelian-subvariety`).

### Interface 32: SchemeAndStackFoundations:SF.2

Hochschild–Serre and the type exact sequence with hypotheses on geometric units and Picard group; canonical comparison of Azumaya and cohomological Brauer groups only under the Gabber hypotheses. Supply the maps and signs, not just an abstract cohomology name.

Consumers: [Constant and algebraic Brauer groups](#RP2-algebraic-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/algebraic-brauer-group`), [Universal torsors and torsors of a given type](#RP3-universal-torsor) (`HeightsRationalPointsAndObstructions:RP.3/universal-torsor`), [The relative algebraic Brauer group of a torus torsor](#RP3-relative-algebraic-brauer) (`HeightsRationalPointsAndObstructions:RP.3/relative-algebraic-brauer`), [Twist independence of the relative Brauer edge maps](#RP3-edge-map-twist-independence) (`HeightsRationalPointsAndObstructions:RP.3/edge-map-twist-independence`), [Brauer–Manin points give universal torsors](#RP3-brauer-manin-universal-torsor-existence) (`HeightsRationalPointsAndObstructions:RP.3/brauer-manin-universal-torsor-existence`).

### Interface 33: SchemeAndStackFoundations:SF.4

Characteristic-zero resolution of arbitrary-dimensional varieties and comparison of smooth projective compactifications; the currently requested curve-only resolution is insufficient for the family height argument. Include normal-base generic-trivial bundle descent and boundary-divisor domination used in DGH Appendix A.

Consumers: [The Silverman–Tate theorem in families](#RP0-silverman-tate) (`HeightsRationalPointsAndObstructions:RP.0/silverman-tate`), [The duplication estimate in families](#RP0-family-duplication-estimate) (`HeightsRationalPointsAndObstructions:RP.0/family-duplication-estimate`), [The fibrewise Néron–Tate height depends only on the generic fibre](#RP0-fibrewise-height-model-independence) (`HeightsRationalPointsAndObstructions:RP.0/fibrewise-height-model-independence`), [The unramified Brauer group](#RP2-unramified-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/unramified-brauer-group`).

### Interface 34: SchemeAndStackFoundations:SF.5

Lefschetz for Picard groups and H²(μ_n) of smooth complete intersections of dimension≥3 in characteristic zero, including Kummer compatibility. H³ of the base field alone does not prove geometric Brauer vanishing.

Consumers: [Brauer groups of high-dimensional complete intersections](#RP2-brauer-trivial-complete-intersections) (`HeightsRationalPointsAndObstructions:RP.2/brauer-trivial-complete-intersections`).

### Interface 35: SchemeAndStackFoundations:SF.2

Brauer reciprocity on proper curves: evaluation/corestriction on closed points annihilates principal divisors, so the Brauer pairing descends to CH₀. State the residue/specialization and norm compatibility needed in the proof.

Consumers: [The Brauer–Manin pairing on zero-cycles](#RP2-zero-cycle-brauer-pairing) (`HeightsRationalPointsAndObstructions:RP.2/zero-cycle-brauer-pairing`).

### Interface 36: DiophantineApproximationAndTranscendence:DT.2

Number-field S-adic product-form Subspace Theorem for place-dependent systems of independent linear forms, as used by Corvaja–Zannier pp.268–270. Derive the normalization-correct corollary from absolute-subspace-theorem-for-systems; the rational-only product theorem does not by itself supply it.

Consumers: [Siegel's theorem on integral points](#RP4-siegel-theorem) (`HeightsRationalPointsAndObstructions:RP.4/siegel-theorem`).

### Interface 37: AbelianSchemesAndArithmeticModuli:A2

Normalized Albanese/trace comparison and finite-type Hom-scheme bounded-degree components modulo constant trace, as used by Conrad §7 pp.23–26. This precedes positive definiteness; no dependency on Conrad Thm.9.15 is allowed.

Consumers: [The Lang–Néron theorem](#RP1-lang-neron) (`HeightsRationalPointsAndObstructions:RP.1/lang-neron`).

### Interface 38: ArithmeticGaloisDuality:R02.3

Separate the existing number-field Hermite/finite-H¹ theorem from the required global-function-field and smooth-curve étale-H¹ finiteness statements. For prime-to-characteristic finite modules give the exact unramified/cohomology finiteness argument used in Lang–Néron and proper-torsor Selmer finiteness.

Consumers: [The weak Mordell–Weil theorem](#RP1-weak-mordell-weil) (`HeightsRationalPointsAndObstructions:RP.1/weak-mordell-weil`), [The Lang–Néron theorem](#RP1-lang-neron) (`HeightsRationalPointsAndObstructions:RP.1/lang-neron`), [The Selmer set of a torsor](#RP3-selmer-set-of-torsor) (`HeightsRationalPointsAndObstructions:RP.3/selmer-set-of-torsor`).

### Interface 39: NeronModelsAndSemistableAbelianVarieties:R11.1

For a smooth commutative finite-type group over a complete DVR, identify the formal completion at its identity with a g-dimensional integral formal law and identify its maximal-ideal points with the reduction kernel, topologically and functorially. For an abelian variety over a p-adic field, provide the identity chart from its smooth Néron model (including bad reduction); sufficiently deep balls are open in A(F). For good-reduction Jacobians give divisor/Abel–Jacobi specialization compatible with this reduction. The elliptic equation-filtration comparison in R11.2 is only a specialization and does not supply this general contract.

Consumers: [Local indices of multiplication by two](#RP1-local-division-index) (`HeightsRationalPointsAndObstructions:RP.1/local-division-index`), [Reduction is injective on torsion](#RP1-reduction-torsion-injective) (`HeightsRationalPointsAndObstructions:RP.1/reduction-torsion-injective`).


## Outstanding proof and supplier contracts

Each target has a prerequisite chain to native declarations, another owner’s interface, or a named obligation here. Point metrics and local logarithms do not supply higher-dimensional intersection theory, general smooth-group completions, or the independent deep finiteness proofs.

### Arithmetic intersection theory of adelic metrized line bundles

The Szpiro–Ullmo–Zhang equidistribution theorem needs Zhang's adelic metrized line bundles on varieties of arbitrary dimension over number fields, arithmetic intersection numbers, the arithmetic Hilbert–Samuel formula and Zhang's successive minima theorem. ArithmeticDynamics DY.4 plans equidistribution on ℙ¹ only and ArakelovGeometryAndAbelianHeights plans the Faltings height (R35.1–R35.6), so no roadmap plans this theory. Proposed owner: a Part II of ArakelovGeometryAndAbelianHeights (see restructure).

Needed by: [Equidistribution of small points on abelian varieties](#RP5-szpiro-ullmo-zhang-equidistribution) (`HeightsRationalPointsAndObstructions:RP.5/szpiro-ullmo-zhang-equidistribution`), [The Bogomolov conjecture (Ullmo–Zhang)](#RP5-bogomolov) (`HeightsRationalPointsAndObstructions:RP.5/bogomolov`).

### Faltings' proof of the subvariety theorem in higher dimension

For curves the Vojta–Bombieri route is planned (vojta-inequality, mumford-gap). For subvarieties of dimension > 1, Faltings 1991 (Annals 133, not freely available) uses Faltings' product theorem and arithmetic Riemann–Roch; neither is planned in the atlas. McQuillan's theorem on division points (finite-rank case) is likewise cited, not decomposed.

Needed by: [Faltings' theorem on rational points of subvarieties of abelian varieties](#RP5-faltings-subvarieties) (`HeightsRationalPointsAndObstructions:RP.5/faltings-subvarieties`), [The Mordell–Lang theorem](#RP5-mordell-lang) (`HeightsRationalPointsAndObstructions:RP.5/mordell-lang`).

### Proofs of Manin–Mumford

Raynaud 1983 (p-adic method) and Hindry 1988 (lower bounds for Galois orbits of torsion points through Serre's and Bogomolov's results on the image of Galois) are cited key theorems; their inputs are not planned. Scanlon's Theorem 2.2 is read for the positive-characteristic case.

Needed by: [The Manin–Mumford theorem](#RP5-manin-mumford) (`HeightsRationalPointsAndObstructions:RP.5/manin-mumford`), [Uniform Manin–Mumford in families](#RP5-uniform-manin-mumford) (`HeightsRationalPointsAndObstructions:RP.5/uniform-manin-mumford`).

### Structure of the Ueno locus

Kawamata's closedness theorem (Ueno fibration) and Bogomolov's 1981 finiteness of maximal cosets with Rémond's degree bounds are cited through Gao–Ge–Kühne and Gao–Habegger; the original sources were not read.

Needed by: [The Ueno locus](#RP5-ueno-locus) (`HeightsRationalPointsAndObstructions:RP.5/ueno-locus`).

### Manin's interpretation of Ш through the Brauer–Manin pairing

The identification of the Cassels–Tate pairing with the algebraic Brauer–Manin pairing on torsors under abelian varieties (Manin 1971; Skorobogatov, Torsors and rational points §6.2, not freely available) is used as a cited key theorem; the Cassels–Tate pairing itself is not planned by this roadmap.

Needed by: [Rational points on genus-one curves](#RP6-genus-one-classification) (`HeightsRationalPointsAndObstructions:RP.6/genus-one-classification`), [Hasse principle failures for J¹ and Sym^k C with Brauer–Manin obstruction](#RP3-bgw-hasse-failures) (`HeightsRationalPointsAndObstructions:RP.3/bgw-hasse-failures`).

### Compactness of the integers of a nonarchimedean completion of a number field

O_v = v.adicCompletionIntegers K is compact for a number field K (complete, with finite residue field), which gives local compactness of the finite adeles through RestrictedProduct.locallyCompactSpace_of_group and of X(𝔸_K) through RP.2/points-topology-presentation. No compactness instance for adicCompletionIntegers is in the pinned declaration index; only the local-compactness API items use it.

Needed by: [Adelic points of an affine variety](#RP2-adelic-points) (`HeightsRationalPointsAndObstructions:RP.2/adelic-points`), [Integral models and their integral local points](#RP2-integral-model) (`HeightsRationalPointsAndObstructions:RP.2/integral-model`).

### Function-field Mordell conjecture proofs

Manin, Grauert (characteristic 0) and Samuel, Voloch (characteristic p) are cited through Poonen Theorem 9.5.10; not decomposed.

Needed by: [The Mordell conjecture over function fields](#RP4-function-field-mordell) (`HeightsRationalPointsAndObstructions:RP.4/function-field-mordell`).

### Unplanned scheme, curve and line-bundle supplier contracts

The exact SchemeAndStackFoundations target references listed in requests do not exist in its current packet. SF.3–SF.5 have no target decomposition yet. The replacements are stage requests, not satisfied prerequisites. Required contracts include torsors/twists, regular Brauer comparison, Picard/curve geometry, Riemann–Roch/Riemann–Hurwitz, arbitrary-dimensional resolution, ample/very ample comparisons and intersection projection formulas. See the independently checked request list; scheme Brauer remains owned by key/scheme-brauer. The very-ample request also specifies generated-bundle difference presentations and their local coefficient bounds for the point-metric construction.

Needed by: [Polarized function fields as generalized global fields](#RP0-geometric-height-field) (`HeightsRationalPointsAndObstructions:RP.0/geometric-height-field`), [Heights along morphisms to projective space](#RP0-morphism-height-comparison) (`HeightsRationalPointsAndObstructions:RP.0/morphism-height-comparison`), [Weil's height machine](#RP0-weil-height-machine) (`HeightsRationalPointsAndObstructions:RP.0/weil-height-machine`), [Heights of subvarieties over polarized function fields](#RP0-geometric-subvariety-height) (`HeightsRationalPointsAndObstructions:RP.0/geometric-subvariety-height`), [Laws for function-field canonical heights](#RP0-geometric-height-laws) (`HeightsRationalPointsAndObstructions:RP.0/geometric-height-laws`), [Function-field heights under finite and constant field extensions](#RP0-geometric-height-base-change) (`HeightsRationalPointsAndObstructions:RP.0/geometric-height-base-change`), [Kummer maps of isogenies of abelian varieties](#RP1-kummer-map) (`HeightsRationalPointsAndObstructions:RP.1/kummer-map`), [Chow's K/k-trace](#RP1-kk-trace) (`HeightsRationalPointsAndObstructions:RP.1/kk-trace`), [Two-coverings of torsors and the class W[2]](#RP1-two-coverings) (`HeightsRationalPointsAndObstructions:RP.1/two-coverings`), [Local constancy of Brauer evaluation](#RP2-brauer-local-constancy) (`HeightsRationalPointsAndObstructions:RP.2/brauer-local-constancy`), [Constant and algebraic Brauer groups](#RP2-algebraic-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/algebraic-brauer-group`), [The unramified Brauer group](#RP2-unramified-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/unramified-brauer-group`), [The Brauer–Manin pairing on zero-cycles](#RP2-zero-cycle-brauer-pairing) (`HeightsRationalPointsAndObstructions:RP.2/zero-cycle-brauer-pairing`), [Evaluation of torsors and twisted torsors](#RP3-torsor-evaluation) (`HeightsRationalPointsAndObstructions:RP.3/torsor-evaluation`), [Universal torsors and torsors of a given type](#RP3-universal-torsor) (`HeightsRationalPointsAndObstructions:RP.3/universal-torsor`), [Genus-one curves as torsors and the Weil–Châtelet group](#RP3-genus-one-torsors) (`HeightsRationalPointsAndObstructions:RP.3/genus-one-torsors`), [Curves with good reduction outside S](#RP4-good-reduction-curve) (`HeightsRationalPointsAndObstructions:RP.4/good-reduction-curve`), [De Franchis' theorem](#RP4-de-franchis) (`HeightsRationalPointsAndObstructions:RP.4/de-franchis`), [The Kodaira–Parshin construction](#RP4-kodaira-parshin-construction) (`HeightsRationalPointsAndObstructions:RP.4/kodaira-parshin-construction`), [Abelian subvarieties, cosets and quotients](#RP5-abelian-subvariety) (`HeightsRationalPointsAndObstructions:RP.5/abelian-subvariety`), [Stabilizers of subvarieties](#RP5-stabilizer) (`HeightsRationalPointsAndObstructions:RP.5/stabilizer`), [The abelian subvariety generated by X − X](#RP5-generated-abelian-subvariety) (`HeightsRationalPointsAndObstructions:RP.5/generated-abelian-subvariety`), [Hypersurface sections of abelian varieties containing no cosets](#RP5-coset-free-hypersurface-sections) (`HeightsRationalPointsAndObstructions:RP.5/coset-free-hypersurface-sections`), [Rational points of curves through the Abel–Jacobi embedding](#RP6-curve-in-jacobian) (`HeightsRationalPointsAndObstructions:RP.6/curve-in-jacobian`), [Rational points on genus-zero curves](#RP6-genus-zero-classification) (`HeightsRationalPointsAndObstructions:RP.6/genus-zero-classification`), [Bounded metric families for point heights](#RP0-bounded-point-metrics) (`HeightsRationalPointsAndObstructions:RP.0/bounded-point-metrics`), [Canonical point metrics by contraction](#RP0-canonical-point-metrics) (`HeightsRationalPointsAndObstructions:RP.0/canonical-point-metrics`).

### Lang–Néron proof contracts

Conrad §7 pp.23–26 needs bounded-degree Hom/Albanese control and finite étale H¹ on a smooth curve. These are not supplied by the later height-kernel theorem, whose proof uses Lang–Néron; the previous circular route is removed.

Needed by: [The Lang–Néron theorem](#RP1-lang-neron) (`HeightsRationalPointsAndObstructions:RP.1/lang-neron`), [Kernel of the Néron–Tate height over function fields](#RP1-function-field-neron-tate-kernel) (`HeightsRationalPointsAndObstructions:RP.1/function-field-neron-tate-kernel`).

### Global-function-field adelic and cohomology extension

RP.2 presently constructs number-field adelic points. The global-function-field theorems require an analogous integral-model direct limit and local topology, together with proper-torsor/finite-H¹ finiteness for prime-to-characteristic modules. Poonen §§8.4–8.6 verifies the assertions, but the lower-tier proof contracts remain unplanned; characteristic-dividing fppf finiteness is a further obligation.

Needed by: [The weak Mordell–Weil theorem](#RP1-weak-mordell-weil) (`HeightsRationalPointsAndObstructions:RP.1/weak-mordell-weil`), [The Selmer set of a torsor](#RP3-selmer-set-of-torsor) (`HeightsRationalPointsAndObstructions:RP.3/selmer-set-of-torsor`), [Descent obstruction sets](#RP3-descent-set) (`HeightsRationalPointsAndObstructions:RP.3/descent-set`), [Finite étale covers obstruct strong approximation](#RP3-strong-approximation-failure) (`HeightsRationalPointsAndObstructions:RP.3/strong-approximation-failure`).

### Deep descent comparisons and universal torsor existence

Poonen Thm.8.5.4 states the étale–Brauer/descent equivalence; its proof needs domination/composition of connected covers and the Demarche–Harari–Skorobogatov comparison, which is not decomposed. HW20 §6.1 invokes an external universal-torsor existence theorem for the rationally connected case; its book proof is unread. BGW descent-to-Brauer obstruction uses the Cassels–Tate/Brauer comparison, not merely empty Selmer sets.

Needed by: [Étale–Brauer equals descent](#RP3-etale-brauer-equals-descent) (`HeightsRationalPointsAndObstructions:RP.3/etale-brauer-equals-descent`), [Descent under tori and the algebraic Brauer group](#RP3-torus-descent-brauer) (`HeightsRationalPointsAndObstructions:RP.3/torus-descent-brauer`), [Brauer–Manin points give universal torsors](#RP3-brauer-manin-universal-torsor-existence) (`HeightsRationalPointsAndObstructions:RP.3/brauer-manin-universal-torsor-existence`), [Hasse principle failures for J¹ and Sym^k C with Brauer–Manin obstruction](#RP3-bgw-hasse-failures) (`HeightsRationalPointsAndObstructions:RP.3/bgw-hasse-failures`).

### Bombieri product and Roth lemma

The statement of Bombieri §10 Thm.1–2 and the Mumford inequality were read and checked. The product/Roth lemma in §§6–9 is a deep proof input not decomposed by the present Vojta node; no complete no-gap Mordell proof can be certified until it is planned. The effective bound concerns high-point counts, not an effective bound on all heights.

Needed by: [Vojta's inequality](#RP5-vojta-inequality) (`HeightsRationalPointsAndObstructions:RP.5/vojta-inequality`), [Faltings' theorem by the Vojta–Bombieri route](#RP5-vojta-bombieri-mordell) (`HeightsRationalPointsAndObstructions:RP.5/vojta-bombieri-mordell`).

### Certified computation beyond compact local evaluation fibres

Finite partitions follow from properness and local constancy. An algorithm additionally needs computable spreading, a finite exceptional set, terminating local solubility/evaluation tests and certified nonempty fibres. Those are requested from the computational roadmaps; the Iskovskikh calculation is only a worked special case.

Needed by: [Finite local partitions for a finite Brauer test; effective computation requires extra input](#RP2-effective-brauer-manin-test) (`HeightsRationalPointsAndObstructions:RP.2/effective-brauer-manin-test`).

### Lefschetz, Brauer reciprocity and purity proof contracts

The corrected proof sketches specify the required H²(μ_n)/Picard Lefschetz comparison, Brauer reciprocity on curves, and compactification/all-valuations purity. These are stage requests, not supplied by curve-only resolution, an intersection projection formula, or H³ of the base field.

Needed by: [The unramified Brauer group](#RP2-unramified-brauer-group) (`HeightsRationalPointsAndObstructions:RP.2/unramified-brauer-group`), [The Brauer–Manin pairing on zero-cycles](#RP2-zero-cycle-brauer-pairing) (`HeightsRationalPointsAndObstructions:RP.2/zero-cycle-brauer-pairing`), [Brauer groups of high-dimensional complete intersections](#RP2-brauer-trivial-complete-intersections) (`HeightsRationalPointsAndObstructions:RP.2/brauer-trivial-complete-intersections`).

### Number-field S-adic Subspace Theorem adapter

The full Corvaja–Zannier paper is now read. Its proof uses place-dependent linear forms over a general number field. DT.2 owns an absolute systems theorem, but the exact normalized product-form corollary used here must be supplied and linked; the previously cited rational-only product theorem is insufficient.

Needed by: [Siegel's theorem on integral points](#RP4-siegel-theorem) (`HeightsRationalPointsAndObstructions:RP.4/siegel-theorem`).

### Formal lemma auxiliary-place proof

HW20 uses the Colliot-Thélène–Skorobogatov formal lemma for finite A/(A∩Br X). Its statement and downstream use were read; the primary auxiliary-place proof is not decomposed here. Ramification, residue control and the existence of compensating local points are explicit proof obligations, not consequences of fixed-class local constancy alone.

Needed by: [Harari's formal lemma](#RP2-formal-lemma) (`HeightsRationalPointsAndObstructions:RP.2/formal-lemma`), [Descent from a torus torsor over a dense open subset](#RP3-open-torus-torsor-descent) (`HeightsRationalPointsAndObstructions:RP.3/open-torus-torsor-descent`).

### Smooth-group formal-completion and local-chart interfaces

The primary Mattuck and Katz statements and proofs have been read. The remaining implementation input is the exact general smooth formal-completion/kernel and p-adic identity-chart comparison requested from NeronModels R11.1. Its current elliptic formal-group comparison does not supply arbitrary dimension. The logarithm theorem, convergence radius and finite-group index count are planned here; this gap records the supplier interface, not an unread-source limitation.

Needed by: [Local indices of multiplication by two](#RP1-local-division-index) (`HeightsRationalPointsAndObstructions:RP.1/local-division-index`), [Reduction is injective on torsion](#RP1-reduction-torsion-injective) (`HeightsRationalPointsAndObstructions:RP.1/reduction-torsion-injective`).


## Ownership and extensions

- **HeightsRationalPointsAndObstructions, GrossZagierAndArithmeticHeights, RankZeroOneBSD.** Confirmed finding RT-AREA-iwasawa-1/3: GZ.1 plans the line-bundle height machine, canonical heights, positivity/torsion and Mordell–Weil for abelian varieties, which RS-03 left with RP.0 and RP.1. This packet now plans them: RP.0/weil-height-machine, RP.0/tate-limit, RP.0/neron-tate-height, RP.0/neron-tate-kernel-number-field (Northcott only, no finite generation), RP.0/neron-tate-bilinear-form, and RP.1/weak-mordell-weil, RP.1/mordell-weil (height half by Mathlib's descent theorem in its additive form AddCommGroup.fg_of_descent'). Narrow GrossZagierAndArithmeticHeights:GZ.1 to YZZ's normalisation of ⟨,⟩_L and the Poincaré pairing A × A∨ (YZZ Theorems 7.1–7.2), the M-linear and L-linear χ-component pairings for strict GL₂-type A with dual-endomorphism compatibility, and the comparison with the elliptic instance; import the height machine and canonical heights from RP.0 and Mordell–Weil from RP.1, with stage links RP.0 → GZ.1 and RP.1 → GZ.1. Keep GZ.2's arithmetic intersection pairing and Faltings–Hriljac comparison there, comparing with RP.0/local-weil-functions. Reroute RankZeroOneBSD:BSD.1's Mordell–Weil import to RP.1.
- **HeightsRationalPointsAndObstructions, ArithmeticDynamics.** ArithmeticDynamics DY.1 plans Tate's limit (DY.1/tate-limit and its six lemmas) although DY.1 consumes RP.0 (stage link RP.0 → DY.1); importing DY.1/tate-limit into RP.0 would create a cycle, so RP.0 plans the general lemma (RP.0/tate-limit, a real body as a telescoping series). Move the Tate-limit family of DY.1 to RP.0/tate-limit: DY.1 cites RP.0/tate-limit, keeps its dynamical canonical heights, the semiconjugacy transport and the preperiodic-point statements, and its elliptic comparison becomes a test of RP.0/neron-tate-height.
- **HeightsRationalPointsAndObstructions, FaltingsFinitenessAndIsogenyTheorems, MordellLawrenceVenkatesh.** The previous RP.4 prerequisite pointed to tier-17 Shafarevich finiteness from this tier-9 roadmap. That edge is removed. The independent Vojta–Bombieri route already belongs to RP.5, so one rational-point declaration can be owned here without importing Shafarevich finiteness upward. Keep RP.4/kodaira-parshin-construction, RP.4/de-franchis and conditional RP.4/parshin-implication here. Own the unconditional rational-point declaration through RP.5/vojta-bombieri-mordell, exported by RP.4/mordell-faltings. FaltingsFinitenessAndIsogenyTheorems R28.5 and MordellLawrenceVenkatesh LV.11 should import that declaration and attach their additional proof routes downstream. Do not move the declaration upward while RP.6 needs it.
- **HeightsRationalPointsAndObstructions, ArakelovGeometryAndAbelianHeights.** RP.5's Bogomolov branch needs arithmetic intersection theory of adelic metrized line bundles (Zhang), which no roadmap plans (gap). Create 'Arakelov geometry and abelian heights, Part II: adelic line bundles and equidistribution', owning adelic metrized line bundles on projective varieties over number fields, arithmetic intersection numbers, the arithmetic Hilbert–Samuel theorem, Zhang's successive minima theorem and the Szpiro–Ullmo–Zhang equidistribution theorem (with ArithmeticDynamics DY.4 as its ℙ¹ case). RP.5/szpiro-ullmo-zhang-equidistribution and RP.5/bogomolov then move there as consumers of RP.5's definitions (essential-minimum, zhang-difference-lemma).
- **HeightsRationalPointsAndObstructions.** The reviewed audit marks RP.6 as a process layer; RS-03 kept it. RP.6 keeps only mathematics: local-solubility, curve-in-jacobian, the genus 0, 1 and ≥ 2 classification theorems, and the conjecture register as precise propositions with no proved consumer; certified enumeration stays with EffectiveDiophantineMethods.
- **HeightsRationalPointsAndObstructions.** Sub-layers for the atlas: RP.0 (35 nodes) and RP.2 (35 nodes) are broad. RP.0 sub-layers: 'Global fields and the height machine' (generalized-global-field … northcott-ample), 'Canonical and local heights on abelian varieties' (tate-limit … local-weil-functions), 'Heights in families and over function fields' (duplication-by-quartics … good-reduction-height-formula). RP.2 sub-layers: 'Adelic points' (points-topology … adelic-points-general), 'Brauer evaluation and the Brauer–Manin set' (azumaya-base-change … effective-brauer-manin-test), 'Algebraic, unramified and cyclic Brauer classes' (algebraic-brauer-group … iskovskikh-example).

Upstream interface notes:

- tauceti:TauCetiRoadmap/EllipticCurves: Layer 7's statement that the geometric reading of Weil–Châtelet classes 'belongs to the scheme-facing roadmap' is now planned in HeightsRationalPointsAndObstructions RP.3/genus-one-torsors; Layer 6's canonical height normalisation (halved x-height) is the comparison test of RP.0/neron-tate-height.
- FaltingsFinitenessAndIsogenyTheorems, MordellLawrenceVenkatesh: Rational-point finiteness is owned by HeightsRationalPointsAndObstructions RP.5/vojta-bombieri-mordell (exported at RP.4/mordell-faltings); Parshin construction and its conditional implication are RP.4. Later higher-tier plans should import these targets; no upward prerequisite remains here.

## Coverage

| Layer | Coverage | Outstanding contracts |
| --- | --- | --- |
| RP.0 | planned | Unplanned scheme, curve and line-bundle supplier contracts |
| RP.1 | planned | Unplanned scheme, curve and line-bundle supplier contracts; Lang–Néron proof contracts; Global-function-field adelic and cohomology extension; Smooth-group formal-completion and local-chart interfaces |
| RP.2 | planned | Compactness of the integers of a nonarchimedean completion of a number field; Unplanned scheme, curve and line-bundle supplier contracts; Certified computation beyond compact local evaluation fibres; Lefschetz, Brauer reciprocity and purity proof contracts; Formal lemma auxiliary-place proof |
| RP.3 | planned | Manin's interpretation of Ш through the Brauer–Manin pairing; Unplanned scheme, curve and line-bundle supplier contracts; Global-function-field adelic and cohomology extension; Deep descent comparisons and universal torsor existence; Formal lemma auxiliary-place proof |
| RP.4 | planned | Function-field Mordell conjecture proofs; Unplanned scheme, curve and line-bundle supplier contracts; Number-field S-adic Subspace Theorem adapter |
| RP.5 | planned | Arithmetic intersection theory of adelic metrized line bundles; Faltings' proof of the subvariety theorem in higher dimension; Proofs of Manin–Mumford; Structure of the Ueno locus; Unplanned scheme, curve and line-bundle supplier contracts; Bombieri product and Roth lemma |
| RP.6 | planned | Manin's interpretation of Ш through the Brauer–Manin pairing; Unplanned scheme, curve and line-bundle supplier contracts |

## Corrections to the sources

The following mathematical corrections apply to the cited copies. They are stated in our own words; no source passage is reproduced.

### E1: Notes on Heights

§3, proof of Lemma 3.1, p.2 in the undated 13-page author copy read 2026-09-27. The equality for the logarithmic height needs log(max|xᵢ|/gcd(xᵢ)). The displayed lemma’s weaker upper bound by max|xᵢ| remains true. The stronger upper bound by log(max|xᵢ|) is what §11 uses.

Check: At [1:2], the height is log 2, whereas the displayed quotient is 2.

### E2: Notes on Heights

§11, paragraph before the left inverse, p.6 in the undated 13-page author copy read 2026-09-27. The (m+1)-by-(n+1) matrix with m≥n and maximal rank has rank n+1, which gives its left inverse.

Check: The inclusion with matrix [[1,0],[0,1],[0,0]] has m=2,n=1, rank 2, and a left inverse; rank 3 is impossible.

### E3: Notes on Heights

§11, lower-bound calculation, p.6 in the undated 13-page author copy read 2026-09-27. The equality identifying log max|yⱼ| with hₘ(y) requires primitive integer coordinates. Replace y=Ax by its primitive integer normalization y′; eBy′ is a nonzero scalar multiple of x. Apply the same upper estimate to y′. In the preceding maximum, the range for j is 0,…,m, not 0,…,n.

Check: For A=2I₂ and x=(1,1), y=(2,2), so log max|yⱼ|=log 2 while h₁([y])=0. For A=(0,1)ᵀ, n=0,m=1, the printed maximum over index 0 alone also misses the nonzero coordinate.

### E4: Notes on Heights

§14, Step 5, displayed equality, p.8 in the undated 13-page author copy read 2026-09-27. Replace each displayed ϕ by the corresponding real-valued height h; the equality is in the height-class quotient.

Check: The earlier ϕ notation denotes maps into projective spaces, which cannot be added as real functions. The preceding tensor identity gives the intended sum of heights.

### E5: Notes on Heights

§14, Step 6 continuation, p.9 in the undated 13-page author copy read 2026-09-27. Use Fact III for very ampleness of a tensor product of very ample bundles.

Check: Fact II gives difference presentations of arbitrary invertible modules; Fact III says that tensoring a very ample bundle with a globally generated one is very ample.

### E6: Notes on Heights

§14, Step 7, p.9 in the undated 13-page author copy read 2026-09-27. Insert the globally generated comparison: tensor a globally generated L by a sufficiently positive very ample N as in Fact IV; the Segre identity gives the height of its chosen generating sections as h(L⊗N)−h(N). Additivity identifies this with h(L). Apply this comparison to both L and f*L before asserting pullback.

Check: Step 3 only states the comparison for very ample L. A pullback of a very ample bundle can be trivial under a constant morphism and need not be very ample, so the cited step alone does not justify its second use.

### E7: Notes on Heights

§15, equation (15.0.1), p.9 in the undated 13-page author copy read 2026-09-27. Use log(max{1,||1+a||ᵥ}) in the sum if this is the height comparison for [1:1+a]. Alternatively restrict a≠−1 and state an extended-log convention if only the weaker untruncated inequality is intended. The max version is the one supplied by Axiom 2.

Check: At a=−1 each displayed logarithm has zero argument. With the usual real logarithm this is undefined; the projective height itself is well defined and equals zero. The pointwise estimate (15.0.2) is meaningful at a=−1.

### E8: Weil and Grothendieck approaches to adelic points

§2, Example 2.2, p. 3 (author copy dated 2011-12-31). Require R to be closed, respectively open, in R′; then X(R) is closed, respectively open, in X(R′). The inclusion is R→R′ throughout.

Check: The embedding identifies R with a subring of R′. A finite affine presentation embeds X(R) into a power of R, whose image inside the corresponding power of R′ has the asserted closed/open property. The reversed condition is ill-typed for a proper subring. The subsequent discreteness comparison and the number-field, S-integer and local-integer examples use the correct inclusion direction.

### E9: Abelian Varieties

Chapter IV §5, Theorem 5.2, printed p.146. Qualify finiteness of all nonconstant curve maps by characteristic zero; in positive characteristic restrict to separable morphisms.

Check: A genus≥2 curve defined over a finite field has infinitely many distinct nonconstant Frobenius self-maps. The characteristic-zero number-field use in Parshin remains valid.

### E10: Abelian Varieties

Chapter IV §5, Proposition 5.3(b), printed p.147. The attached curves have good reduction outside the fixed finite set S, not at every prime in S.

Check: The construction’s possible bad places are the original bad primes and the dyadic primes, which are included in S. The surrounding argument and proof use good reduction outside S.

### E11: Diophantine Approximation and Nevanlinna Theory

§19, proof of Theorem 19.1 after (19.1.1), printed p.172. For the at-least-three-boundary-points argument, use r≥3 and a positive coefficient for sufficiently large N. The leading coefficient is r(r−2)N²/2, so the displayed inequality bounds the ample height; a negative coefficient would give no contradiction.

Check: For g=0,r=3,N=10,ε=1 the coefficient is 435−310=125>0. For r=2,g=0 it is N(1−ε), and for r=2,g≥1 the needed argument does not follow, consistent with the theorem’s stated r≥3 hypothesis.


## Source editions and read locators

- **dejong-heights.** [Aise Johan de Jong, *Notes on Heights*](https://www.math.columbia.edu/~dejong/courses/heights.pdf). Undated author-hosted course notes, linked by the Spring 2022 Schemes course page; 13-page copy accessed 2026-09-27. Read physical/printed pp.1–3 and 6–10: goals and elementary heights; coordinate estimates; all of §14, including its footnote and Steps 1–7; local-function discussion and §17. Pages 4–5 and 11–13 are not claimed read. Pages 2,6,8,9 were visually checked for the recorded source findings. The quotient and finiteness interfaces below use §14 footnote and §17 as motivation, with their elementary proofs written here. No claim that the notes prove the complete roadmap. Authorship and course context verified at https://www.math.columbia.edu/~dejong/courses/schemes-spring-2022.html. No dated revision or separate correction located on that page or the author homepage on 2026-09-27.
- **poonen-rational-points.** [Bjorn Poonen, *Rational points on varieties*](https://math.mit.edu/~poonen/papers/Qpoints.pdf). Graduate Studies in Mathematics 186, AMS 2017; author-hosted PDF (348 physical pages; printed page = PDF page − 14), accessed 2026-09-28. Read in full in earlier checkpoints: §2.6.3 (pp. 49–50), Exercise 3.4 (p. 95), §6.6.2–6.6.3 (pp. 187–189), §6.9.1 (pp. 198–199), §8.1 (pp. 227–229), §8.2.1–8.2.4 (pp. 229–232). Read in this job (2026-10-12, same file, printed page = PDF page − 14): §4.5 (Theorem 4.5.2, Example 4.5.8, Theorem 4.5.11, pp. 105–108); §5.12 (Examples 5.12.11–5.12.12, Proposition 5.12.14, Theorem 5.12.24, pp. 151–157); §6.5 (Theorem 6.5.10, Example 6.5.12, Theorem 6.5.13 with proof, pp. 178–186); §8.2.5–8.2.6 (Iskovskikh, Propositions 8.2.14–8.2.15, effectivity, pp. 232–236); §8.3 (pp. 236–239); §8.4 (Theorems 8.4.1, 8.4.6, 8.4.9, 8.4.10, Proposition 8.4.2, Definition 8.4.4, Corollaries 8.4.8, 8.4.11, pp. 239–245); §8.5 (Lemma 8.5.2, Proposition 8.5.3, Theorems 8.5.4–8.5.5, Corollary 8.5.6, pp. 245–248); §8.6 (Theorems 8.6.1, 8.6.5, 8.6.12, Remark 8.6.4, pp. 248–253); §9.5 (Theorem 9.5.1, Remark 9.5.2, Examples 9.5.3–9.5.5, Theorem 9.5.10, Conjecture 9.5.11, pp. 286–288). Chapter 1 §1.5 (local invariants) is consumed from TauCetiRoadmap ClassFieldTheory, not re-read.
- **conrad-adelic-points.** [Brian Conrad, *Weil and Grothendieck approaches to adelic points*](https://math.stanford.edu/~conrad/papers/adelictop.pdf). Author copy (22 pp.), file dated 2011-12-31 on the author's papers page; published in L'Enseignement Mathématique 58 (2012). Accessed 2026-09-28; the author's papers directory lists no erratum for it.. Read §1–§3 through the proof of Theorem 3.6 (pp. 1–8): Proposition 2.1 and its proof, Examples 2.2–2.4, Proposition 3.1, Remarks 3.2–3.5, Theorem 3.4, Theorem 3.6 and its proof. Page 3 was rendered and inspected for the misprint recorded as E8. §4–§5 not read.
- **conrad-kktrace.** [B. Conrad, *Chow's K/k-image and K/k-trace, and the Lang–Néron theorem*](https://math.stanford.edu/~conrad/papers/Kktrace.pdf). L'Enseignement Mathématique (2) 52 (2006), 37–108; author copy (41 pp.), accessed 2026-10-12; cited by section, theorem and author-copy page. §3 (Theorem 3.7, Corollaries 3.20–3.21), §6 (Theorems 6.2, 6.4, 6.8, 6.12, Corollary 6.5), §7 (Theorem 7.1, Corollary 7.2, Lemmas 7.3–7.5), §8 (Definition 8.1, Examples 8.3–8.5, Lemma 8.6, Remark 8.7) and §9 (heights, Remarks 9.1–9.2, Theorem 9.3, Examples 9.4–9.5, displays (9.3)–(9.9), Remark 9.6, Lemma 9.7, Theorem 9.8, Remark 9.9, Theorem 9.10, Corollaries 9.11–9.12, Lemma 9.13, Remark 9.14, Theorem 9.15, Lemma 9.16, Corollary 9.17) read in full; §10 read through Lemma 10.1 and the statement of Theorem 10.2.
- **milne-av.** [J. S. Milne, *Abelian Varieties*](https://www.jmilne.org/math/CourseNotes/AV.pdf). Course notes v2.00 (2008), author PDF (172 pp.), accessed 2026-10-12. Chapter IV §1 (statement of Parshin's argument, pp. 132–133) and §5 (Theorem 5.1, Kodaira–Parshin construction and proof; Theorem 5.2, de Franchis; deduction of Mordell from Shafarevich, pp. 145–148).
- **szpiro-bourbaki-619.** [L. Szpiro, *La conjecture de Mordell (d'après G. Faltings)*](http://www.numdam.org/item/SB_1983-1984__26__83_0.pdf). Séminaire Bourbaki exp. 619 (1983/84), Astérisque 121–122 (1985), 83–103; Numdam PDF (printed page = PDF page + 81), accessed 2026-10-12. §1 (Théorème 1, Siegel's theorem, pp. 84–85), §2.1 (Shafarevich sets, Exemples 1.1–1.5, pp. 85–87), §5.2 (the Kodaira–Parshin construction, pp. 97–98) and §5.3 (p. 98).
- **bombieri-1990.** [E. Bombieri, *The Mordell conjecture revisited*](http://www.numdam.org/item/ASNSP_1990_4_17_4_615_0.pdf). Ann. Scuola Norm. Sup. Pisa (4) 17 (1990), 615–640; Numdam PDF (printed page = PDF page + 613), accessed 2026-10-12. §§1–5 (pp. 615–622), §10 (Theorems 1–2, pp. 637–639); §§6–9 skimmed for the structure of the proof.
- **gubler-2007.** [W. Gubler, *The Bogomolov conjecture for totally degenerate abelian varieties*](https://arxiv.org/abs/math/0609387v2). Invent. Math. 169 (2007), 377–400; arXiv:math/0609387v2 (21 pp.), accessed 2026-10-12. §1 (introduction), §2.1–2.10 (local heights, canonical local heights), §3.1–3.6 (global heights over function fields, Theorems 3.4 and 3.6), Lemma 4.1 (fundamental inequality), Theorem 5.5 and the remarks after it (pp. 1–15 of arXiv v2).
- **ullmo-1998.** [E. Ullmo, *Positivité et discrétion des points algébriques des courbes*](https://arxiv.org/abs/alg-geom/9606017). Ann. of Math. 147 (1998), 167–179; arXiv:alg-geom/9606017v1 (16 pp.), accessed 2026-10-12. §1 (Théorème 1.1 and the discussion of Zhang's admissible pairing and equidistribution), pp. 1–3.
- **gao-habegger-19.** [Z. Gao, P. Habegger, *Heights in families of abelian varieties and the Geometric Bogomolov Conjecture*](https://arxiv.org/abs/1801.05762v3). Ann. of Math. 189 (2019), 527–604; arXiv:1801.05762v3, accessed 2026-10-12. Theorem numbers and pages checked in arXiv v3 for: §2.1–2.2, Theorem 3.2 (p. 13), proofs of Propositions 6.9, 8.1, 9.1, 10.1, Theorem 11.1 (pp. 52–53), Appendix C (Lemma C.2, Proposition C.1, pp. 59–61). Statements follow the reviewed extraction PAPER-GAO-HABEGGER-19 with its source issues.
- **dgh-21.** [V. Dimitrov, Z. Gao, P. Habegger, *Uniformity in Mordell–Lang for curves*](https://arxiv.org/abs/2001.10276v3). Ann. of Math. 194 (2021), 237–298; arXiv:2001.10276v3, accessed 2026-10-12. Checked in arXiv v3: §1 (p. 3, p. 6), Remark 3.2 (p. 14), proof of Proposition 4.3 (pp. 19–20), §6.1 (pp. 24–25), Appendix A (Theorem A.1, Proposition A.2, pp. 36–40). Statements follow the reviewed extraction PAPER-DIMITROV-GAO-HABEGGER-21.
- **ggk-26.** [Z. Gao, T. Ge, L. Kühne, *The Uniform Mordell–Lang Conjecture*](https://arxiv.org/abs/2105.15085v4). Publ. Math. IHÉS 143 (2026); arXiv:2105.15085v4. This review cites arXiv pagination, not unverified published page numbers.. Checked in arXiv v4 for theorem numbers: §1.1–1.2, Lemmas 2.3–2.5, §5.1 Step 1, proof of Lemma 7.4. Statements and published pages follow the reviewed extraction PAPER-GAO-GE-KUHNE-26.
- **xie-yuan-22.** [J. Xie, X. Yuan, *Geometric Bogomolov conjecture in arbitrary characteristics*](https://arxiv.org/abs/2108.09722v1). Invent. Math. 229 (2022); arXiv:2108.09722v1, accessed 2026-10-12. Checked in arXiv v1: §1.1 ((1.1)–(1.3), pp. 1–3), proof of Proposition 3.6 (p. 16), §4.3 (pp. 21–22), §5 (Theorem 5.1, pp. 22–23; proof of Lemma 5.3, p. 24; §5.3, p. 26). Statements follow the reviewed extraction PAPER-XIE-YUAN-22.
- **hw-20.** [Y. Harpaz, O. Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf). J. Amer. Math. Soc. 33 (2020); author copy (31 pp.), accessed 2026-10-12. §1.1–1.2 (pp. 6–7), §2 (Théorème 2.1, Corollaire 2.2, Propositions 2.3, 2.5–2.7, Lemme 2.4, equations (2.2) and (2.8), pp. 7–11); §§6–7 located for Théorèmes 6.1, 6.6 and Proposition 7.8. Statements follow the reviewed extraction PAPER-HARPAZ-WITTENBERG-20.
- **hw-23.** [Y. Harpaz, O. Wittenberg, *The Massey vanishing conjecture for number fields*](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf). Duke Math. J. 172 (2023); author copy (33 pp.), accessed 2026-10-12. §2 (pp. 6–8), §3 display (3.1) (pp. 8–9), §4 Remark 4.5 (p. 13). Statements follow the reviewed extraction PAPER-HARPAZ-WITTENBERG-23.
- **bgw-17.** [M. Bhargava, B. H. Gross, X. Wang, *A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension*](https://arxiv.org/abs/1310.7692v2). J. Amer. Math. Soc. 30 (2017), 451–493; arXiv:1310.7692v2, accessed 2026-10-12. §1 (pp. 1–3: two-coverings, W[2], Sel₂(J¹), Corollary 9, Theorems 10–11), Proposition 22 (p. 11), §12 (p. 33).
- **scanlon-2005.** [T. Scanlon, *Positive characteristic Manin–Mumford theorem*](https://arxiv.org/abs/math/0303340). Compositio Math. 141 (2005); arXiv:math/0303340, accessed 2026-10-12. Statement of Theorem 2.2 (§2) checked.
- **cesnavicius-purity.** [K. Česnavičius, *Purity for the Brauer group*](https://arxiv.org/abs/1711.06456v4). Duke Math. J. 168 (2019); arXiv:1711.06456v4, Dec. 1, 2018; primary public copy read 2026-10-13. Introduction: statements of Theorems 1.1–1.3 (Theorem 1.2: Br of a Noetherian integral regular scheme is the intersection of the Brauer groups of its codimension-one local rings inside Br K).
- **tauceti-ellipticcurves-l6.** [Tau Ceti roadmap authors, *EllipticCurves roadmap, Layer 6: the Mordell–Weil theorem*](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves). TauCetiRoadmap main, EllipticCurves/README.md, read 2026-10-12. Layers 5–7 (twists, Mordell–Weil with explicit 2-descent and canonical height milestone, Selmer structures and Sha).
- **tauceti-ellipticcurves-l7.** [Tau Ceti roadmap authors, *EllipticCurves roadmap, Layer 7: Selmer groups and Sha*](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/EllipticCurves). TauCetiRoadmap main, EllipticCurves/README.md, read 2026-10-12. Layer 7 in full (general Selmer structures, Weil–Châtelet group, finiteness route via Hermite–Minkowski).
- **yuan-26.** [Xinyi Yuan and Shou-Wu Zhang, *Adelic line bundles over quasi-projective varieties*](https://arxiv.org/abs/2108.05625v4). Adelic line bundles over quasi-projective varieties, arXiv:2108.05625v4, April 30, 2024; manuscript dated May 1, 2024; published Ann. of Math. 203 (2026). Independently read §4.3.1, arXiv v4 pp.70–72 on 2026-10-13; number-field and function-field height normalizations and the theta convention. The earlier August-21 manuscript label is not the version used here.
- **tsimerman-18.** [J. Tsimerman, *The André–Oort conjecture for A_g*](https://annals.math.princeton.edu/2018/187-2/p02). Ann. of Math. 187 (2018), no. 2. Not re-read in this job: §6.2, p. 387, as recorded by the reviewed extraction PAPER-TSIMERMAN-18 (algebraic-point-height, northcott-finiteness).
- **skorobogatov-sofos-23.** [A. N. Skorobogatov, E. Sofos, *Schinzel Hypothesis on average and rational points*](https://eprints.gla.ac.uk/292484/1/292484.pdf). Invent. Math. 231 (2023). Not re-read in this job: §5.2 p. 722, proof of Theorem 5.3 p. 720, (5.7)–(5.10) pp. 723–724, as recorded by the reviewed extraction PAPER-SKOROBOGATOV-SOFOS-23.
- **browning-leboudec-sawin-23.** [T. Browning, P. Le Boudec, W. Sawin, *The Hasse principle for random Fano hypersurfaces*](https://arxiv.org/abs/2006.02356). Ann. of Math. 197 (2023), no. 3; arXiv:2006.02356v1. Not re-read in this job: §1 p. 2 and its use of Poonen–Voloch Appendix A, as recorded by the reviewed extraction PAPER-BROWNING-LEBOUDEC-SAWIN-23/brauer-trivial.
- **bombieri-gubler.** E. Bombieri, W. Gubler, *Heights in Diophantine Geometry*. Cambridge University Press, New Mathematical Monographs 4, 2006. Not independently read in this review. No other copy was obtained. The unavailable proof remains an explicit gap; this source entry is bibliographic, not a verification claim.
- **corvaja-zannier-2002.** [P. Corvaja, U. Zannier, *A subspace theorem approach to integral points on curves*](https://www.numdam.org/item/CRMATH_2002__334_4_267_0.pdf). C. R. Math. Acad. Sci. Paris 334 (2002), 267–271. Independently read all printed pp.267–271 on 2026-10-13: the boundary-function proof, Riemann–Roch dimension/vanishing estimates, S-adic linear-form systems and finite étale-cover reduction. Statements and proof requirements are recorded in our own words.
- **mattuck-1955.** [A. Mattuck, *Abelian varieties over p-adic ground fields*](https://people.dm.unipi.it/lombardo/NonAbelianChabauty/Mat55.pdf). Ann. of Math. 62 (1955), 92–119. §13, Theorem 7 and its full proof, printed pp.114–117; §14 observations 1–3, p.118, in the university-hosted scan read 2026-10-14.
- **katz-1981-appendix.** [S. Lang (article); N. Katz (Appendix), *Galois properties of torsion points on abelian varieties (Appendix by N. Katz)*](https://web.math.princeton.edu/~nmk/old/galoisprop.pdf). Invent. Math. 62 (1981), 481–502. Appendix by N. Katz: setup on printed p.501, Lemma, Lemma′ and full proof on p.502; visually read in the author-hosted scan on 2026-10-14.
- **mueller-stoll-2016.** [Jan Steffen Müller and Michael Stoll, *Computing canonical heights on elliptic curves in quasi-linear time*](https://www.mathe2.uni-bayreuth.de/stoll/papers/ellheights-arXiv-v2.pdf). Author manuscript, Dec.15, 2015, 15 pages; published LMS J. Comput. Math. 19 (2016). Read §2–3, author-copy pp.2–4 on 2026-10-13, including Remark 3.1 and Proposition 3.2. The reviewer translated its x-height local normalization to the (O)-normalization. Re-read §2–3, printed pp.2–4, on 2026-10-14 from the same author PDF/hash, including the full proof construction of the local telescoping height, Remark 3.1 and Proposition 3.2. Distinguished the half Müller–Stoll function from the Silverman local normalization; their discriminant shift sums to zero but changes the local duplication equation.
- **vojta-cime.** [Paul Vojta, *Diophantine Approximation and Nevanlinna Theory*](https://math.berkeley.edu/~vojta/cime/cime.pdf). Author-hosted CIME chapter, printed pp.111–224; independently accessed 2026-10-13. Read Conjecture 14.6 and its immediate hypotheses, printed p.160, and Conjecture 24.1 and its comparison with rational points, printed p.200. Also read §19 pp.171–172 for the Corvaja–Zannier comparison and inspected p.172 visually. No claim to have read the full chapter.
- **hw-supersolvable-2024.** [Yonatan Harpaz and Olivier Wittenberg, *Supersolvable descent for rational points*](https://msp.org/ant/2024/18-4/ant-v18-n4-p05-s.pdf). Algebra & Number Theory 18:4 (2024), 787–814; publisher PDF. Read introduction, Conjecture 1.1 and Theorem 1.2, printed pp.787–788, on 2026-10-13. Proper varieties identify the full local product with adelic points, and their Brauer group with the unramified group. No claim to have read the rest of this paper.
- **gubler-heights-2002.** [W. Gubler, *Basic Properties of Heights of Subvarieties*](https://gubler.app.uni-regensburg.de/Publikationen/habi%2B.pdf). Habilitationsschrift, 5 July 2002, author-hosted 125-page PDF, accessed 2026-10-14. §5.1.2, pp.96–97; §5.1.12–16 and the proof of Theorem 5.1.13, pp.100–101; §5.2.1–4 and §5.2.15–18, pp.106,108–109; Theorem 5.3.13 and Remark 5.3.14, p.114; §5.3.20–24 and their proofs, pp.117–119. Only metrics and point-height consequences are planned here; higher-dimensional arithmetic intersections remain the recorded Part II input.

## Pinned library declarations used

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. These entries identify the exact reusable substrate, including the limits of its contract.

- `mathlib:Filter.BoundedAtFilter` (`Mathlib/Order/Filter/ZeroAndBoundedAtFilter.lean`): A function is big-O of the constant real function one along a specified filter.
- `mathlib:Filter.boundedFilterSubmodule` (`Mathlib/Order/Filter/ZeroAndBoundedAtFilter.lean`): The submodule of functions bounded along a filter; specialize both scalar and codomain to real numbers and the filter to top.
- `mathlib:Filter.const_boundedAtFilter` (`Mathlib/Order/Filter/ZeroAndBoundedAtFilter.lean`): Every constant function is bounded along every filter.
- `mathlib:Asymptotics.isBigO_top` (`Mathlib/Analysis/Asymptotics/Lemmas.lean`): Big-O at the top filter is a single norm bound valid at every point.
- `mathlib:Metric.isBounded_iff_subset_closedBall` (`Mathlib/Topology/MetricSpace/Bounded.lean`): A set is bornologically bounded exactly when it lies in a closed ball about any specified center; specialize the center to real zero to get the uniform absolute-value bound.
- `mathlib:Submodule.Quotient.mk` (`Mathlib/LinearAlgebra/Quotient/Defs.lean`): The native quotient projection from a module by a submodule.
- `mathlib:Submodule.Quotient.eq` (`Mathlib/LinearAlgebra/Quotient/Defs.lean`): Two quotient representatives are equal precisely when their difference belongs to the submodule.
- `mathlib:Submodule.Quotient.mk_eq_zero` (`Mathlib/LinearAlgebra/Quotient/Defs.lean`): A quotient representative vanishes precisely when it belongs to the submodule.
- `mathlib:Submodule.mkQ` (`Mathlib/LinearAlgebra/Quotient/Defs.lean`): The native quotient projection bundled as a linear map.
- `mathlib:Submodule.mkQ_surjective` (`Mathlib/LinearAlgebra/Quotient/Defs.lean`): Every quotient element has a representative.
- `mathlib:Submodule.quot_hom_ext` (`Mathlib/LinearAlgebra/Quotient/Defs.lean`): Two linear maps out of a quotient agree when they agree on every representative.
- `mathlib:Submodule.liftQ` (`Mathlib/LinearAlgebra/Quotient/Basic.lean`): Linear descent from a module when the submodule lies in the kernel.
- `mathlib:Submodule.liftQ_apply` (`Mathlib/LinearAlgebra/Quotient/Basic.lean`): Evaluation of the native quotient lift on a representative.
- `mathlib:Submodule.mapQ` (`Mathlib/LinearAlgebra/Quotient/Basic.lean`): A compatible linear map descends between native module quotients.
- `mathlib:Submodule.mapQ_apply` (`Mathlib/LinearAlgebra/Quotient/Basic.lean`): The descended map evaluates on a representative by the original linear map.
- `mathlib:Submodule.mapQ_comp` (`Mathlib/LinearAlgebra/Quotient/Basic.lean`): Composition law for descended linear maps.
- `mathlib:Submodule.mapQ_id` (`Mathlib/LinearAlgebra/Quotient/Basic.lean`): Identity law for the native descended map.
- `mathlib:LinearMap.pi` (`Mathlib/LinearAlgebra/Pi.lean`): Build a linear map into a function module from its coordinate linear maps.
- `mathlib:LinearMap.proj` (`Mathlib/LinearAlgebra/Pi.lean`): Evaluation of a function module at an index as a linear map.
- `mathlib:Northcott` (`Mathlib/Order/Northcott.lean`): Native typeclass whose finite_le field asserts that every upper sublevel set is finite.
- `mathlib:Northcott.comp_of_finite_fibers` (`Mathlib/Order/Northcott.lean`): A Northcott function remains Northcott after precomposition by a map with finite fibers.
- `mathlib:Filter.TendstoCofinite` (`Mathlib/Order/Filter/TendstoCofinite.lean`): Native typeclass for maps sending the cofinite filter to the cofinite filter.
- `mathlib:Filter.tendstoCofinite_iff_finite_preimage_singleton` (`Mathlib/Order/Filter/TendstoCofinite.lean`): The preceding class is equivalent to all singleton fibers being finite.
- `mathlib:AddCircle` (`Mathlib/Topology/Instances/AddCircle/Defs.lean`): AddCircle p = 𝕜 ⧸ zmultiples p; AddCircle (1 : ℚ) is the target ℚ/ℤ of local invariants.
- `mathlib:AlgHom` (`Mathlib/Algebra/Algebra/Hom.lean`): R-algebra homomorphisms A →ₐ[R] B, the carrier of B-valued points of Spec A.
- `mathlib:AlgHom.mulLeftRight` (`Mathlib/Algebra/Azumaya/Defs.lean`): The R-algebra map A ⊗[R] Aᵐᵒᵖ → End_R(A), a ⊗ b ↦ (x ↦ a x b), whose bijectivity is part of IsAzumaya.
- `mathlib:Algebra.FiniteType` (`Mathlib/RingTheory/FiniteType.lean`): Finite generation of an algebra, the finiteness hypothesis on coordinate rings.
- `mathlib:Algebra.IsCentral` (`Mathlib/Algebra/Central/Defs.lean`): Centrality of an algebra over its base.
- `mathlib:Algebra.IsCentral.instIsAzumaya` (`Mathlib/Algebra/Azumaya/Basic.lean`): An Azumaya algebra which is free over its base is central (instance), used over fields.
- `mathlib:Algebra.TensorProduct.liftEquiv` (`Mathlib/RingTheory/TensorProduct/Maps.lean`): Algebra maps out of a tensor product correspond to pairs of commuting algebra maps, used for points of a product.
- `mathlib:Algebra.adjoin` (`Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean`): The subalgebra generated by a set, used to build integral models from generators.
- `mathlib:BrauerGroup` (`Mathlib/Algebra/BrauerGroup/Defs.lean`): The Brauer group of a field as the quotient of central simple algebras by Brauer equivalence.
- `mathlib:DiscreteTopology` (`Mathlib/Topology/Order.lean`): Discreteness of a topological space, for the rational points inside the adelic points.
- `mathlib:IsAdicComplete` (`Mathlib/RingTheory/AdicCompletion/Basic.lean`): Adic completeness, the completeness of O_v used to lift idempotents.
- `mathlib:IsAzumaya` (`Mathlib/Algebra/Azumaya/Defs.lean`): Azumaya algebras over a commutative ring: finite, projective, faithful, with A ⊗ Aᵐᵒᵖ → End(A) bijective.
- `mathlib:IsAzumaya.matrix` (`Mathlib/Algebra/Azumaya/Matrix.lean`): Matrix algebras are Azumaya.
- `mathlib:IsDedekindDomain.FiniteAdeleRing` (`Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean`): The finite adele ring as the restricted product of the adic completions with respect to their integers.
- `mathlib:IsDedekindDomain.HeightOneSpectrum` (`Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean`): Height-one primes of a Dedekind domain, the finite places.
- `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletion` (`Mathlib/RingTheory/DedekindDomain/AdicValuation.lean`): The completion K_v at a finite place.
- `mathlib:IsDedekindDomain.HeightOneSpectrum.adicCompletionIntegers` (`Mathlib/RingTheory/DedekindDomain/AdicValuation.lean`): The valuation ring O_v of K_v.
- `mathlib:IsLocalization.Away` (`Mathlib/RingTheory/Localization/Away/Basic.lean`): Localisation at the powers of one element, for the rings A₀[1/N].
- `mathlib:IsSimpleRing` (`Mathlib/RingTheory/SimpleRing/Defs.lean`): Simple rings.
- `mathlib:Module.End` (`Mathlib/Algebra/Module/LinearMap/End.lean`): Endomorphism algebras of modules, the split Azumaya algebras.
- `mathlib:Module.Free` (`Mathlib/LinearAlgebra/FreeModule/Basic.lean`): Free modules.
- `mathlib:Module.Projective` (`Mathlib/Algebra/Module/Projective.lean`): Projective modules.
- `mathlib:MvPolynomial.aeval` (`Mathlib/Algebra/MvPolynomial/Eval.lean`): Evaluation of multivariate polynomials in an algebra, for presentations of coordinate rings.
- `mathlib:NumberField.AdeleRing` (`Mathlib/NumberTheory/NumberField/AdeleRing.lean`): The adele ring of a number field as the product of the infinite and finite adele rings, a topological K-algebra.
- `mathlib:NumberField.AdeleRing.principalSubgroup` (`Mathlib/NumberTheory/NumberField/AdeleRing.lean`): The diagonal copy of K in its adele ring.
- `mathlib:NumberField.InfiniteAdeleRing` (`Mathlib/NumberTheory/NumberField/InfiniteAdeleRing.lean`): The product of the completions at the infinite places.
- `mathlib:NumberField.InfiniteAdeleRing.locallyCompactSpace` (`Mathlib/NumberTheory/NumberField/InfiniteAdeleRing.lean`): The infinite adele ring is locally compact.
- `mathlib:NumberField.InfinitePlace.Completion` (`Mathlib/NumberTheory/NumberField/Completion/InfinitePlace.lean`): The completion K_w at an infinite place.
- `mathlib:Pi.topologicalSpace` (`Mathlib/Topology/Constructions.lean`): The product topology on function types.
- `mathlib:Polynomial.aeval` (`Mathlib/Algebra/Polynomial/AlgebraMap.lean`): Evaluation of polynomials in an algebra.
- `mathlib:RestrictedProduct` (`Mathlib/Topology/Algebra/RestrictedProduct/Basic.lean`): The restricted product of a family of types with respect to a family of subsets, along a filter (cofinite by default).
- `mathlib:RestrictedProduct.evalRingHom` (`Mathlib/Topology/Algebra/RestrictedProduct/Basic.lean`): Evaluation of a restricted product of rings at one index, as a ring homomorphism.
- `mathlib:RestrictedProduct.eventually` (`Mathlib/Topology/Algebra/RestrictedProduct/Basic.lean`): An element of a restricted product lies in the chosen subsets at almost all indices.
- `mathlib:RestrictedProduct.isOpen_forall_mem` (`Mathlib/Topology/Algebra/RestrictedProduct/TopologicalSpace.lean`): For open subsets, the product of the subsets is open in the restricted product.
- `mathlib:RestrictedProduct.locallyCompactSpace_of_group` (`Mathlib/Topology/Algebra/RestrictedProduct/TopologicalSpace.lean`): A restricted product of locally compact groups with respect to compact open subgroups is locally compact.
- `mathlib:RestrictedProduct.topologicalSpace` (`Mathlib/Topology/Algebra/RestrictedProduct/TopologicalSpace.lean`): The restricted-product topology.
- `mathlib:TopologicalSpace.induced` (`Mathlib/Topology/Defs/Induced.lean`): The topology induced by a map, used to define the points topology.
- `mathlib:Topology.IsClosedEmbedding` (`Mathlib/Topology/Defs/Induced.lean`): Closed embeddings.
- `mathlib:Topology.IsEmbedding` (`Mathlib/Topology/Defs/Induced.lean`): Topological embeddings.
- `mathlib:Units.embedProduct` (`Mathlib/Algebra/Group/Prod.lean`): The embedding of the units u ↦ (u, u⁻¹) defining Mathlib's topology on units.
- `tauceti:NumberField.AdeleRing.instT2Space` (`TauCeti/NumberTheory/NumberField/Global/Adeles/Basic.lean`): The adele ring of a number field is Hausdorff.
- `tauceti:TauCeti.BrauerGroup.baseChange` (`TauCeti/Algebra/BrauerGroup/BaseChange.lean`): Base change of Brauer classes as a multiplicative group homomorphism along a field extension, with the two fields and Brauer representatives in the same pinned universe. This is not the unrestricted cross-universe map without lifting.
- `tauceti:TauCeti.BrauerGroup.baseChange_mk` (`TauCeti/Algebra/BrauerGroup/BaseChange.lean`): The class of the scalar extension is the base change of the class.
- `tauceti:TauCeti.BrauerGroup.instCommGroup` (`TauCeti/Algebra/BrauerGroup/Group.lean`): The commutative group structure on the Brauer group of a field.
- `tauceti:TauCeti.BrauerGroup.mk` (`TauCeti/Algebra/BrauerGroup/Group.lean`): The Brauer class of a central simple algebra.
- `tauceti:TauCeti.BrauerGroup.mk_end` (`TauCeti/Algebra/BrauerGroup/Group.lean`): Endomorphism algebras of nonzero finite-dimensional vector spaces have trivial class.
- `tauceti:TauCeti.BrauerGroup.mk_matrix` (`TauCeti/Algebra/BrauerGroup/Group.lean`): Matrix algebras over a central simple algebra have the same class.
- `tauceti:TauCeti.BrauerGroup.mk_op` (`TauCeti/Algebra/BrauerGroup/Group.lean`): The opposite algebra has the inverse class.
- `tauceti:TauCeti.BrauerGroup.mk_tensorProduct` (`TauCeti/Algebra/BrauerGroup/Group.lean`): The class of a tensor product is the product of the classes.
- `tauceti:TauCeti.CSA.of` (`TauCeti/Algebra/BrauerGroup/Basic.lean`): Packaging a finite-dimensional central simple algebra as an object of CSA.
- `tauceti:TauCeti.GlobalNumberFields.discreteTopology_principalSubgroup` (`TauCeti/NumberTheory/NumberField/Global/Adeles/Discrete.lean`): K is discrete in its adele ring.
- `tauceti:TauCeti.GlobalNumberFields.isClosed_principalSubgroup` (`TauCeti/NumberTheory/NumberField/Global/Adeles/Discrete.lean`): K is closed in its adele ring.
- `tauceti:TauCeti.IsSimpleRing.isAzumaya` (`TauCeti/Algebra/CentralSimple/Opposite.lean`): A finite-dimensional central simple algebra over a field is Azumaya.
- `tauceti:TauCeti.Quaternion.brauerGroupMulEquiv` (`TauCeti/Algebra/BrauerGroup/Real.lean`): Br(ℝ) ≅ ℤ/2, sending the Hamilton quaternions to the generator: the invariant at a real place.
- `tauceti:TauCeti.subsingleton_brauerGroup_of_finite` (`TauCeti/Algebra/BrauerGroup/Trivial.lean`): The Brauer group of a finite field is trivial (Wedderburn).
- `mathlib:CommGroup.fg_of_descent'` (`Mathlib/GroupTheory/Descent.lean`): Descent theorem: G/G² finite, h ≥ 0 with the approximate parallelogram law and Northcott imply G finitely generated; its additive form AddCommGroup.fg_of_descent' is generated by to_additive.
- `mathlib:Height.AdmissibleAbsValues` (`Mathlib/NumberTheory/Height/Basic.lean`): Class of a field with an admissible family of absolute values: archimedean multiset with multiplicity, nonarchimedean set, finite support and the product formula. This class alone does not encode Conrad Definition 8.1: infinitude, inequivalence, nontriviality and excellent discrete valuation rings are additional obligations.
- `mathlib:Height.logHeight` (`Mathlib/NumberTheory/Height/Basic.lean`): Logarithmic height of a tuple over a field with admissible absolute values (not normalised by the degree).
- `mathlib:Height.logHeight_eval_ge` (`Mathlib/NumberTheory/Height/MvPolynomial.lean`): Lower bound for the height of the value of homogeneous polynomials given a Nullstellensatz certificate: N times the height minus a constant.
- `mathlib:Height.logHeight_eval_le` (`Mathlib/NumberTheory/Height/MvPolynomial.lean`): Upper bound for the height of the value of homogeneous polynomials of degree N: N times the height plus a constant.
- `mathlib:Height.logHeight_fun_mul_eq` (`Mathlib/NumberTheory/Height/Basic.lean`): The height of the tensor (Segre) product of two nonzero vectors is the sum of their heights.
- `mathlib:Height.logHeight_linearMap_apply_le` (`Mathlib/NumberTheory/Height/MvPolynomial.lean`): Height of the image of a vector under a linear map is at most the height of the vector plus a constant depending on the matrix.
- `mathlib:Height.logHeight₁_add_le` (`Mathlib/NumberTheory/Height/Basic.lean`): For a field with AdmissibleAbsValues, logHeight₁(x+y) ≤ logHeight₁(x)+logHeight₁(y)+log 2·totalWeight K. Division by the number-field total weight gives the absolute-height log 2 term; the relative-height statement does not have a field-independent log 2 term.
- `mathlib:Height.logHeight₁_mul_le` (`Mathlib/NumberTheory/Height/Basic.lean`): h(xy) ≤ h(x) + h(y).
- `mathlib:Height.mulHeight_smul_eq_mulHeight` (`Mathlib/NumberTheory/Height/Basic.lean`): The multiplicative height of a vector is unchanged by scaling with a nonzero scalar (product formula).
- `mathlib:Int.Matrix.exists_ne_zero_int_vec_norm_le` (`Mathlib/NumberTheory/SiegelsLemma.lean`): Integer Siegel lemma: for a matrix with 0 < m < n, a nonzero integral kernel vector has the stated bound involving n·max(1,‖A‖) raised to m/(n−m). The zero-row case is separate; the nonarchimedean/number-field Subspace Theorem is not supplied by this declaration.
- `mathlib:Module.rank` (`Mathlib/LinearAlgebra/Dimension/Basic.lean`): Rank of a module (dimension over a field).
- `mathlib:Monoid.finite_set_isOfFiniteOrder_of_descent` (`Mathlib/GroupTheory/Descent.lean`): If h(x^n) ≥ b·h(x) − c with b > 1 and h is Northcott, the elements of finite order form a finite set (additive form by to_additive).
- `mathlib:NumberField.absLogHeight₁` (`Mathlib/NumberTheory/Height/NumberField.lean`): Absolute logarithmic height of an element of a characteristic-zero field algebraic over ℚ, normalised through ℚ(x).
- `mathlib:NumberField.finite_setOfPred_logHeight₁_le` (`Mathlib/NumberTheory/Height/NumberField.lean`): Northcott for elements of a fixed number field: finitely many elements of bounded logarithmic height.
- `mathlib:NumberField.instAdmissibleAbsValues` (`Mathlib/NumberTheory/Height/NumberField.lean`): The admissible family of a number field: infinite places with multiplicity and normalised finite places.
- `mathlib:Polynomial.mahlerMeasure` (`Mathlib/Analysis/Polynomial/MahlerMeasure.lean`): Mahler measure of a complex polynomial.
- `mathlib:Projectivization.logHeight` (`Mathlib/NumberTheory/Height/Projectivization.lean`): Logarithmic height of a point of projective space over a field with admissible absolute values, independent of the representative. The projective Northcott adapter still requires a finite coordinate presentation; it is not already the planned projectivization theorem.
- `mathlib:QuadraticMap.polarBilin` (`Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`): The polar bilinear form of a quadratic map.
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety` (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean`): Abelian varieties over a field as group objects that are smooth, proper and geometrically connected.
- `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder` (`TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean`): Over a field with the Northcott property, the elliptic canonical height vanishes exactly at torsion points. This native elliptic specialization uses canonical-height Northcott to prove the torsion kernel, without a Mordell–Weil prerequisite.
- `tauceti:WeierstrassCurve.Affine.neronTatePairing` (`TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight.lean`): The elliptic Néron–Tate pairing, the halved polar form of the canonical height. The native elliptic pairing is half the unhalved polarization ĥ(P+Q)−ĥ(P)−ĥ(Q) used here; the compatibility multiplies the native pairing by two.
- `mathlib:ContractingWith.exists_fixedPoint` (`Mathlib/Topology/MetricSpace/Contracting.lean`): On a complete emetric space a map with contraction factor K<1 and a starting point of finite distance from its image has a fixed point, convergence of its iterates and the geometric error bound.
- `mathlib:FormalGroup` (`Mathlib/RingTheory/FormalGroup/Basic.lean`): Native one-dimensional formal group law over a commutative ring, with its formal two-variable series and associativity. Its Point API is power-series-valued, not the missing local-field evaluation/logarithm or a g-dimensional smooth-group completion.
- `mathlib:MvPowerSeries` (`Mathlib/RingTheory/MvPowerSeries/Basic.lean`): Native multivariate formal power series with monomials indexed by finitely supported natural exponents. The coefficient-function carrier is reused for g-dimensional formal laws, not replaced.
