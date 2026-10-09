# Scheme, stack, cohomology and intersection foundations — SF.3: curves, divisors and Picard objects

This layer is the curve-and-Picard layer of the foundations roadmap. Its job is integration: three Tau Ceti roadmaps already plan most of the theory of curves, and this layer states precisely how they fit together and adds what none of them states but the arithmetic roadmaps above it need. It supplies degrees, Riemann–Roch and Serre duality for vector bundles and coherent sheaves on curves; the cohomological, divisorial and groupoid descriptions of Picard groups of schemes; Picard torsors of curves without rational points, with the Brauer obstruction separating rational divisor classes from rational divisors; Abel maps from symmetric powers in high degree and norms of line bundles; and the comparison of the Tate module of a Jacobian with degree-one étale cohomology under pinned conventions. It also carries the checks the layer promises: genus zero, genus one, extension of scalars, degree zero and the Tate module.

## What is imported, and from where

- **JacobianChallenge (Tau Ceti).** Layer A: invertible sheaves, the Picard group Pic X under tensor product, Weil and Cartier divisors on curves, the identification Cl(X) ≅ Pic X on a smooth curve, the degree deg L = χ(L) − χ(O_X) and Pic⁰ = ker deg. Layer B: coherent cohomology of proper curves over a field, the genus g = dim H¹(X, O_X), the line-bundle Riemann–Roch theorem χ(L) = deg L + 1 − g and Serre duality for line bundles with the dualizing sheaf ω_{X/k}, deg ω = 2g − 2. Layer C: flat base change, cohomology and base change, relative effective Cartier divisors and the symmetric powers X^(d). Layer D: the Picard sheaf of a smooth projective geometrically connected curve over a field, rigidified along a rational point, its representability, and Pic⁰ with its properness. Layer E: the Jacobian as an abelian variety of dimension g, with T₀(J) ≅ H¹(X, O_X). Layer F: the Abel–Jacobi morphism with a base point, its universal property and base change.
- **AlgebraicCurves (Tau Ceti).** Function-field places, divisors, Cl and Cl⁰ (Layer 3), Weil differentials and Riemann–Roch (Layer 4), the Hurwitz formula (Layer 7), constant-field extensions and the inseparable genus drop (Layer 8), hyperelliptic and elliptic model classes (Layer 10), and the dictionary of Layer 12: the regular projective model X_F as the normalization of P¹_k in F, closed points as places, the anti-equivalence between function fields and regular projective curves, the comparison of divisors and degrees, and the comparison H⁰ = L(D), cohomological genus = function-field genus, ω ↔ canonical class.
- **StableReduction (Tau Ceti).** Sheaves of relative differentials (Layers 0–1); the single dualizing-sheaf interface for proper flat Gorenstein curves, of which JacobianChallenge's smooth duality is the restriction; tensor powers, relative ampleness and the ampleness-by-degree criterion on proper curves; effective étale descent of polarized schemes (Layer 2).
- **ClassFieldTheory (Tau Ceti).** The Brauer group Br(k) = H²(G_k, k^{s×}) on the continuous Galois-cohomology carrier, with restriction and corestriction (Layer 5), and the Albert–Brauer–Hasse–Noether theorem (Layer 10).
- **CohomologicalPointCounting (Tau Ceti roadmap pull request 196).** Roots-of-unity sheaves, Kummer exactness and Tate twists (ConstructibleEtale Layer 6), finite-coefficient étale cohomology (ConstructibleEtale Layer 9), the classical ℓ-adic realization (EllAdicRealization), and TraceFormula Layer 8, which builds torsion and Tate modules of abelian varieties and the finite-level comparison of H¹_et(C, Z/ℓ^n) with the dual of J_C[ℓ^n]. Its integration point in this roadmap is SF.2.
- **Earlier layers of this roadmap.** SF.0 (schemes, morphisms, Zariski's main theorem), SF.1 (fppf descent of quasi-coherent modules, algebraic stacks), SF.2 (étale cohomology on Mathlib's small étale site, the cohomological Brauer group, and coherent duality: f^!, the proper Serre duality theorem `SF.2/serre-proper`, the smooth formula `SF.2/smooth-proper` and the canonical module `SF.2/canonical-module`).
- **Libraries.** Mathlib supplies schemes and morphism properties, function fields, orders of vanishing and algebraic cycles, the small étale site, sheaf cohomology `CategoryTheory.Sheaf.H`, pro-étale ℓ-adic cohomology `AlgebraicGeometry.Scheme.EllAdicCohomology`, Kähler differentials, `CommRing.Pic`, `BrauerGroup`, group cohomology with Hilbert 90, and monoidal and symmetric categories, cores and exact pairings. Tau Ceti supplies `InvertibleSheaf`, `LineBundleClass` (a commutative monoid under tensor product), `SchemeWeilDivisor` with the injective map from divisor classes to line-bundle classes and the Weil–Cartier equivalence on curves, residue-weighted degrees `relativeDegree`, cohomology of sheaves of modules `Scheme.Modules.Cohomology` with Mayer–Vietoris and the truncated Euler characteristic `eulerCharBelow`, `AbelianVariety` with its tangent space, base change and multiplication maps, the function-field genus, Riemann–Roch, genus-zero and genus-one theorems, and base change of Brauer groups of fields.

Nothing planned by those owners is planned again here. Where a statement here specializes or extends one of theirs, the node says which and proves compatibility.

## Boundaries

- The Néron–Severi group of an abelian variety, the injection [L] ↦ φ_L into symmetric homomorphisms, its finite generation and the Picard number belong to AbelianSchemesAndArithmeticModuli A2. This layer supplies the Picard groups, groupoids and torsors that A2 starts from.
- Coherent duality beyond curves (f^!, the trace, dualizing complexes, Serre duality for proper Cohen–Macaulay varieties, duality for smooth proper formal schemes) belongs to SF.2. The duality theorem below is the curve case of SF.2's theory.
- Nef, big and semiample line bundles, exceptional loci, Kodaira's lemma, Keel's criterion and Stein factorization belong to SF.5 (or a layer after it). The only positivity statements here are the degree bounds on curves, and the ampleness-by-degree criterion on proper curves is StableReduction Layer 2's.
- Picard schemes and Jacobians of curves over a general Noetherian base, and relative Picard representability for higher-dimensional projective families, belong to AlgebraicModuliForArithmeticGeometry and to JacobianChallenge Part II; the field case is planned here and those owners specialize to it. The Albanese and Picard varieties of higher-dimensional smooth proper varieties go with higher-dimensional Picard representability.
- Models of curves over discrete valuation rings, specialization of divisors and relative canonical sheaves of regular models belong to SF.4 and StableReduction Layers 2 and 5. The étale fundamental group of a scheme belongs to CohomologicalPointCounting/ConstructibleEtale Layer 3. Algebraic de Rham cohomology of curves belongs to the de Rham cohomology roadmap.

## Conventions

k is a field, k^s a separable closure and G_k = Gal(k^s/k). A *curve* over k is an integral separated scheme of finite type over k of dimension one; a *proper curve* is a proper one. The genus of a proper k-scheme X of dimension one with H⁰(X, O_X) = k is g(X) = dim_k H¹(X, O_X) (JacobianChallenge Layer B); the function-field genus of AlgebraicCurves is always called the genus of the function field. Smoothness, properness, projectivity and geometric connectedness are hypotheses stated where used, never bundled into a predicate; regular is not smooth over an imperfect field. The degree of an invertible sheaf is χ(L) − χ(O_X), and of a vector bundle of rank r it is χ(E) − rχ(O_X); it is never the naive count of points and never the Euler characteristic. Br(k) means H²(G_k, k^{s×}); H²_et(X, G_m) is the cohomological Brauer group of SF.2, and the Azumaya Brauer group of SF.2 is compared with Mathlib's `BrauerGroup` for fields by `SF.2/field-comparison`. Pic(X) is the group of isomorphism classes of invertible sheaves; Pic_{X/k} is the fppf Picard sheaf; 𝒫ic is the Picard groupoid or stack; Pic^d_{X/k} is the degree-d component of the Picard scheme. The Tate module is T_ℓ J = lim J[ℓ^n](k^s), Z_ℓ(1) = lim μ_{ℓ^n}(k^s), and continuous ℓ-adic cohomology is the limit of finite-coefficient étale cohomology.

### Hypotheses of the Abel–Jacobi constructions

| construction | curve hypotheses | base point | output |
|---|---|---|---|
| Abel–Jacobi ι_O : X → J (JacobianChallenge Layer F) | smooth, proper, geometrically connected over k | O ∈ X(k) required | morphism to the Jacobian, O ↦ 0; closed immersion if g ≥ 1 |
| Abel map a₁ : X → Pic¹_{X/k} (`SF.3/abel-maps-high-degree`, `SF.3/genus-one-curves`) | smooth, projective, geometrically connected | none | morphism to the degree-one torsor; isomorphism if g = 1 |
| Abel maps γ_d : X^(d) → Pic^d_{X/k} (`SF.3/abel-maps-high-degree`) | smooth, projective, geometrically connected; d ≥ 0 | none | surjective for d ≥ g, birational for d = g, smooth projective P^{d−g}-fibration for d ≥ 2g − 1 |
| Projective-bundle description of γ_d | as above, d ≥ 2g − 1 | a Poincaré sheaf, for example from O ∈ X(k) | γ_d is the projectivization of a rank d − g + 1 bundle |
| Pullback of 1-forms ι_O^* (`SF.3/abel-jacobi-differentials`) | smooth, projective, geometrically connected, g ≥ 1 | O ∈ X(k); result independent of O | isomorphism of g-dimensional spaces |
| Picard torsors Pic^d_{X/k} (`SF.3/picard-scheme-without-point`) | smooth, projective, geometrically connected | none | torsors under Pic⁰_{X/k}, trivial iff Pic^d_{X/k}(k) ≠ ∅ |

## SF.3a. Curves, their models, and the genus checks

These targets connect an arbitrary curve to the regular projective curves of AlgebraicCurves Layer 12 and record what the genus does under base change, finite morphisms and in genus zero and one.

### The nonsingular projective model of a normal curve and its boundary (`SF.3/nonsingular-projective-model`, construction)

Let k be a field and X a normal integral separated scheme of finite type over k of dimension one, with function field F = k(X). Let X̄ = X_F be the regular projective curve of AlgebraicCurves Layer 12B (the normalization of the projective line in F), with its identification k(X̄) = F. Construct the open immersion j_X : X → X̄ over k which is the identity on function fields. It is the unique open immersion of X into a regular proper k-curve inducing the identity of F. Its boundary ∂X := X̄ ∖ j_X(X) is a finite set of closed points (the punctures of X), empty exactly when X is proper. If k is perfect and X is smooth over k, then X̄ is smooth over k (the smooth proper completion of X). Without perfectness X̄ can fail to be smooth along ∂X even when X is smooth.

**Hypotheses.** k is a field; X is a scheme over k which is integral, normal, separated and of finite type, of dimension one. The smoothness clause assumes k perfect and X smooth over k; the regular model is used without that assumption.

**Proof outline.**

1. Every closed point x of X has a discrete valuation ring O_{X,x} with fraction field F, hence determines a place of F/k; AlgebraicCurves Layer 12A–12B identify the closed points of X̄ with all places of F/k, with the same residue fields.
2. The birational map from X to the proper curve X̄ extends to a morphism because X is a normal curve and X̄ is proper (Stacks, Algebraic Curves, Lemma 0BXZ).
3. The morphism is injective on points and an isomorphism on the local ring of every point (both are the valuation ring of the same place), hence it is a birational quasi-finite morphism between normal curves; by Zariski's main theorem it is an open immersion (Stacks, Algebraic Curves, Lemma 0BY0 and Theorem 0BY1).
4. Uniqueness: two open immersions inducing the identity of F agree at the generic point, hence agree because X̄ is separated and X is reduced.
5. The complement of a nonempty open subset of an irreducible curve is a finite set of closed points; it is empty if and only if X is proper, because removing a closed point from a separated irreducible positive-dimensional scheme destroys properness (Stacks, Varieties, Lemma 0A24).
6. If k is perfect, regular local rings of X̄ are geometrically regular, so X̄ is smooth over k (Stacks, Algebraic Curves, Lemma 0BY3).

**Declarations and API** (suggested module `TauCeti/AlgebraicGeometry/Curve/NonsingularModel`).

| name | role | statement |
|---|---|---|
| `TauCeti.AlgebraicGeometry.Curve.nonsingularModel` | constructor | The regular projective k-curve X̄ attached to a normal curve X, equal to AlgebraicCurves' X_{k(X)}. |
| `TauCeti.AlgebraicGeometry.Curve.nonsingularModel.openImmersion` | data | The open immersion j_X : X → X̄ over k inducing the identity of k(X). |
| `TauCeti.AlgebraicGeometry.Curve.nonsingularModel.functionField_iso` | characterisation | j_X induces the identity k(X̄) = k(X) under the identification of AlgebraicCurves Layer 12B. |
| `TauCeti.AlgebraicGeometry.Curve.nonsingularModel.unique` | universal-property | Any open immersion of X into a regular proper k-curve inducing the identity of k(X) factors through a unique isomorphism with X̄. |
| `TauCeti.AlgebraicGeometry.Curve.nonsingularModel.extend` | universal-property | Every k-morphism from X to a proper k-scheme extends uniquely along j_X. |
| `TauCeti.AlgebraicGeometry.Curve.boundary` | projection | ∂X = X̄ ∖ j_X(X), a finite set of closed points. |
| `TauCeti.AlgebraicGeometry.Curve.boundary_eq_empty_iff` | characterisation | ∂X is empty if and only if X is proper over k. |
| `TauCeti.AlgebraicGeometry.Curve.nonsingularModel_smooth` | compatibility | If k is perfect and X is smooth over k then X̄ is smooth over k. |
| `TauCeti.AlgebraicGeometry.Curve.nonsingularModel.map` | functoriality | A dominant k-morphism X → Y of normal curves extends to a finite morphism X̄ → Ȳ, compatibly with composition and identities. |

**Unit tests.**

- `TauCeti.AlgebraicGeometry.Curve.nonsingularModel_affineLine` (computation): The model of A¹_k is P¹_k and the boundary is the single k-rational point at infinity.
- `TauCeti.AlgebraicGeometry.Curve.nonsingularModel_gm` (computation): The model of G_m = A¹_k ∖ {0} is P¹_k and the boundary consists of the two k-rational points 0 and ∞.
- `TauCeti.AlgebraicGeometry.Curve.nonsingularModel_proper` (degenerate): If X is proper and regular then j_X is an isomorphism and the boundary is empty.
- `TauCeti.AlgebraicGeometry.Curve.nonsingularModel_not_smooth` (non-example): Over k = F_p(t) with p odd, let U be the smooth locus of the affine curve y² = x^p − t; U omits the closed point y = 0. The model of U contains that point, where it is regular but not smooth over k, so the model of a smooth curve need not be smooth over an imperfect field.

**Uses.** TropicalAndBerkovichArithmetic:TB.2 (semistable vertex sets): the smooth proper completion X̂ of a smooth connected curve and its finite puncture set D = X̂ ∖ X; AnabelianGeometryAndNonabelianChabauty:NC.0/smooth-curve: the smooth proper model of an affine smooth curve and the genus of that model; Bresciani 2024, §1 (routed to SF.3): a hyperbolic curve is one with 2g(X̄) − 2 + deg(X̄ ∖ X) > 0; SchemeAndStackFoundations:SF.3/curve-affine-or-projective: the boundary decides whether the curve is affine.

**Acceptance.** For X = A¹_k the model is P¹_k and ∂X is the single rational point at infinity. For X proper and regular, j_X is an isomorphism. The construction is compatible with AlgebraicCurves Layer 12C: a dominant morphism of curves extends uniquely to their models.

**Prerequisites.** AlgebraicCurves (Layer 12), `AlgebraicGeometry.Scheme.functionField` (Mathlib), `AlgebraicGeometry.IsOpenImmersion` (Mathlib), `AlgebraicGeometry.IsProper` (Mathlib), `AlgebraicGeometry.IsSeparated` (Mathlib), `AlgebraicGeometry.Smooth` (Mathlib), SF.0.

**Sources.** The Stacks Project Authors, *The Stacks Project*: Algebraic Curves (tag 0BRV), Section 2 'Curves and function fields' (tag 0BXX): Lemmas 0BXZ, 0BY0, Theorem 0BY1, Definition 0BY2, Lemmas 0BY3, 0BY4; Varieties (tag 0209), Section 43: Lemmas 0A24, 0BXW, 0B8Y and Remark 0H1F. Tau Ceti roadmap contributors, *Roadmap: algebraic curves — function fields, divisors, and Riemann–Roch*: Layer 12, sublayers 12A–12C.

### A curve is affine or projective (`SF.3/curve-affine-or-projective`, theorem)

Let k be a field and X an integral separated scheme of finite type over k of dimension one. Then exactly one of the following holds: X is affine, or X is proper over k; in the second case X is projective over k. For X normal, X is affine if and only if its boundary ∂X in the nonsingular projective model is nonempty.

**Hypotheses.** k is a field; X is integral, separated, of finite type over k and of dimension one.

**Proof outline.**

1. Replace X by its normalization ν: X^ν → X, which is finite and surjective (Mathlib's relative normalization); X is affine iff X^ν is affine (Chevalley's theorem for finite surjective morphisms) and proper iff X^ν is proper.
2. If ∂X^ν is empty, X^ν = X̄^ν is projective by AlgebraicCurves Layer 12B, and then X is proper; a proper scheme of dimension at most one over k is projective (Stacks, Varieties, Lemma 0A26).
3. If ∂X^ν is nonempty, X^ν is a projective curve minus a nonempty finite set of closed points, which is affine (Stacks, Varieties, Lemmas 0A27 and 0A28).
4. A scheme that is both affine and proper over k with positive dimension cannot exist, because a proper affine k-scheme is finite over k.

**Acceptance.** A¹_k is affine and not proper; P¹_k is projective. A projective curve minus one closed point is affine. The node is the source of the proper-versus-affine dichotomy used for separated smooth finite-type curves.

**Prerequisites.** SF.3/nonsingular-projective-model, `AlgebraicGeometry.Scheme.Hom.normalization` (Mathlib), `AlgebraicGeometry.IsAffine` (Mathlib), `AlgebraicGeometry.IsProper` (Mathlib), AlgebraicCurves (Layer 12).

**Sources.** The Stacks Project Authors, *The Stacks Project*: Varieties (tag 0209), Section 43 'Curves' (tag 0A22): Lemmas 0A24, 0A26, 0A27, 0A28.

### The genus of a proper curve is invariant under every field extension (`SF.3/genus-base-change`, theorem)

Let k be a field and X a proper k-scheme of dimension one with H⁰(X, O_X) = k, and let g(X) = dim_k H¹(X, O_X) be its genus in the sense of JacobianChallenge Layer B. For every field extension K/k, the base change X_K is proper of dimension one over K, H⁰(X_K, O) = K and g(X_K) = g(X). Comparison with function fields: if X is smooth and geometrically connected, g(X) equals the genus of k(X)/k of AlgebraicCurves Layer 3 (Layer 12E). For K/k separable algebraic, X_K is again smooth and g(X_K) is also the function-field genus of K·k(X). For an inseparable extension K/k the scheme X_K may fail to be normal; then the function-field genus of the constant field extension of k(X) (AlgebraicCurves Layer 8) is the genus of the normalization of X_K and can be strictly smaller than g(X_K) = g(X).

**Hypotheses.** k is a field; X is proper over k, of dimension one, with H⁰(X, O_X) = k; K/k is an arbitrary field extension.

**Proof outline.**

1. Cohomology of coherent sheaves commutes with flat base change: H^i(X_K, F_K) = H^i(X, F) ⊗_k K (JacobianChallenge Layer C; StableReduction Layer 2), applied to F = O_X in degrees 0 and 1.
2. Properness and dimension are preserved by base change to a field (Mathlib's base-change stability of proper morphisms).
3. For smooth geometrically connected X, AlgebraicCurves Layer 12E identifies dim H¹(X, O_X) with the function-field genus; for separable algebraic K, smoothness is preserved and the same comparison applies to X_K.
4. The normalization of X_K has smaller or equal genus (Stacks, Algebraic Curves, Lemma 0CE4); in the inseparable example the inequality is strict.

**Acceptance.** Inseparable guard (AlgebraicCurves worked example): over k = F_p(t), p odd, let X be the regular projective model of y² = x^p − t. Then g(X) = (p−1)/2, and over k' = k(t^{1/p}) the scheme X_{k'} still has genus (p−1)/2, while its normalization, the model of the rational function field k'(y/(x − t^{1/p})^{(p−1)/2}), has genus 0. For P¹_k and every K: g = 0 before and after base change. The node discharges SF.3's 'extension of scalars' acceptance check together with SF.3/picard-scheme-without-point (base change of Picard schemes).

**Prerequisites.** JacobianChallenge (Layer B), JacobianChallenge (Layer C), AlgebraicCurves (Layer 8), AlgebraicCurves (Layer 12), `AlgebraicGeometry.IsProper` (Mathlib), `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` (Tau Ceti), `TauCeti.genus` (Tau Ceti).

**Sources.** The Stacks Project Authors, *The Stacks Project*: Algebraic Curves (tag 0BRV), Section 8 'The genus of a curve' (tag 0BY6): Definition 0BY7, Lemma 0BY9; Section 18: Lemma 0CE4; Section 2: Lemma 0BY4. Tau Ceti roadmap contributors, *Roadmap: algebraic curves — function fields, divisors, and Riemann–Roch*: Layer 8 (constant-field extensions; inseparable genus drop) and Worked examples, item 'Inseparable constant-extension drop'.

### Riemann–Hurwitz for morphisms of smooth proper curves (`SF.3/scheme-riemann-hurwitz`, theorem)

Let k be a field and f : X → Y a nonconstant morphism of smooth proper curves over k with H⁰(X, O_X) = H⁰(Y, O_Y) = k, which is generically étale (equivalently k(X)/k(Y) is separable). Then Ω_{X/Y} is a coherent torsion sheaf; let R be the effective Cartier divisor it cuts out (the different), with multiplicity d_x = length Ω_{X/Y,x} at a closed point x. Then 2g_X − 2 = deg(f)(2g_Y − 2) + Σ_x d_x [κ(x):k], with d_x ≥ e_x − 1, and d_x = e_x − 1 exactly when x is tamely ramified over f(x). In particular, if f is finite étale then g_X − 1 = deg(f)(g_Y − 1). Under the curve–function-field anti-equivalence (AlgebraicCurves Layer 12C) R corresponds to the different divisor of k(X)/k(Y), and the formula is the Hurwitz genus formula of AlgebraicCurves Layer 7.

**Hypotheses.** k is a field; X and Y are smooth proper curves over k with H⁰ = k; f is nonconstant and generically étale.

**Proof outline.**

1. The pullback f*Ω_{Y/k} → Ω_{X/k} is injective because f is generically étale, with cokernel Ω_{X/Y} supported on finitely many closed points (Stacks, Algebraic Curves, Lemma 0C1C).
2. Additivity of degree (SF.3/vector-bundle-degree) gives deg Ω_X = deg f*Ω_Y + deg R, and deg f*Ω_Y = deg(f) deg Ω_Y (Stacks, Varieties, Lemma 0AYZ).
3. deg Ω_{X/k} = 2g_X − 2 and deg Ω_{Y/k} = 2g_Y − 2 by SF.3/curve-serre-duality (Stacks, Algebraic Curves, Lemma 0C1A).
4. The local analysis of d_x versus the ramification index is Stacks, Algebraic Curves, Lemma 0C1F; it matches the different exponent of AlgebraicCurves Layer 7 under the anti-equivalence of Layer 12C.

**Acceptance.** Hyperelliptic genus 2: the double cover y² = x⁵ − 1 → P¹ (char ≠ 2, 5) gives 2·2 − 2 = 2(−2) + 6. An unramified double cover of a genus-two curve has genus three: 3 − 1 = 2(2 − 1). Artin–Schreier y² − y = x³ over F₂: the place at infinity has d > e − 1, so the tame count fails (AlgebraicCurves worked example).

**Prerequisites.** SF.3/vector-bundle-degree, SF.3/curve-serre-duality, AlgebraicCurves (Layer 7), AlgebraicCurves (Layer 12), StableReduction (Layer 1), JacobianChallenge (Layer B), `KaehlerDifferential` (Mathlib).

**Sources.** The Stacks Project Authors, *The Stacks Project*: Algebraic Curves (tag 0BRV), Section 12 'Riemann–Hurwitz' (tag 0C1B): Lemmas 0C1C, 0C1D, 0C1F; Varieties (tag 0209), Section 44: Lemma 0AYZ. Tau Ceti roadmap contributors, *Roadmap: algebraic curves — function fields, divisors, and Riemann–Roch*: Layer 7 (the different and the Hurwitz genus formula) and Worked examples (hyperelliptic genus 2, wild Artin–Schreier).

### Curves of genus zero and the characterization of the projective line (`SF.3/projective-line-characterization`, theorem)

Let k be a field and X a proper curve over k. The following are equivalent: (a) X ≅ P¹_k; (b) X is smooth and geometrically irreducible of genus 0 and carries an invertible sheaf of odd degree; (c) H⁰(X, O_X) = k, X has genus 0 and carries an invertible sheaf of degree 1; (d) H¹(X, O_X) = 0 and X has normal closed points x_1, …, x_n with gcd [κ(x_i):k] = 1. Moreover, if H⁰(X, O_X) = k and g(X) = 0, every invertible sheaf of degree 0 is trivial, so the degree embeds Pic(X) into Z and Pic⁰ is trivial; if X is in addition Gorenstein it is a plane conic. For P¹_k: H⁰(P¹, O) = k, H¹(P¹, O) = 0, the degree is an isomorphism Pic(P¹_k) ≅ Z, and Pic⁰_{P¹/k} = Spec k. Function-field form: under AlgebraicCurves Layer 12 this is Tau Ceti's theorem that a genus-zero function field with a divisor of degree one is a rational function field.

**Hypotheses.** k is a field; X is a proper curve over k (integral, one-dimensional, proper).

**Proof outline.**

1. Riemann–Roch on a genus-zero curve with H⁰ = k: an invertible sheaf L of degree d > 0 has h⁰(L) = d + 1 and h¹(L) = 0, and is very ample (Stacks, Algebraic Curves, Lemma 0C6T); degree-zero sheaves are trivial (Lemma 0C6M).
2. From (c): a degree-one L has two independent sections defining an isomorphism X → P¹_k.
3. From (b) or (d): an odd-degree class together with ω^{-1} of degree 2 produces a class of degree 1 (Stacks, Algebraic Curves, Proposition 0C6U).
4. H¹(P¹, O) = 0 from the Mayer–Vietoris sequence of the two standard affine charts (Tau Ceti mayerVietorisSequence_exact) and affine acyclicity (JacobianChallenge Layer B).
5. The function-field statement is Tau Ceti's nonempty_algEquiv_ratFunc_of_genus_eq_zero_of_divisor_degree_eq_one transported along AlgebraicCurves Layer 12C.

**Acceptance.** Non-example: the conic x² + y² + z² = 0 over R has genus 0 and H⁰ = R but every invertible sheaf has even degree; it is not isomorphic to P¹_R. Genus-zero check of SF.3: Pic⁰_{P¹/k} is trivial, so the Jacobian of P¹ is the zero abelian variety.

**Prerequisites.** JacobianChallenge (Layer A), JacobianChallenge (Layer B), AlgebraicCurves (Layer 12), `TauCeti.nonempty_algEquiv_ratFunc_of_genus_eq_zero_of_divisor_degree_eq_one` (Tau Ceti), `TauCeti.AlgebraicGeometry.Scheme.Modules.mayerVietorisSequence_exact` (Tau Ceti), SF.3/vector-bundle-riemann-roch.

**Sources.** The Stacks Project Authors, *The Stacks Project*: Algebraic Curves (tag 0BRV), Section 10 'Curves of genus zero' (tag 0C6L): Lemmas 0C6M, 0C6T, 0C6N, Proposition 0C6U.

### Genus-one curves: degree-one bundles, rational points and torsors under the Jacobian (`SF.3/genus-one-curves`, theorem)

Let k be a field and X a smooth proper geometrically connected curve over k of genus 1. (a) Every invertible sheaf N on X of degree 1 has h⁰(N) = 1, and the zero scheme of its nonzero section is a k-rational point; hence X(k) is nonempty if and only if X carries an invertible sheaf of degree 1. (b) The base-point-free Abel map a₁ : X → Pic¹_{X/k}, x ↦ O_X(x), is an isomorphism of k-schemes; X is a torsor under its Jacobian Pic⁰_{X/k}, trivial exactly when X(k) is nonempty. (c) For O ∈ X(k), P ↦ [O(P − O)] is an isomorphism (X, O) ≅ (Pic⁰_{X/k}, 0) of pointed k-schemes; on k-points it is Tau Ceti's bijection between degree-one places and Cl⁰(k(X)) under AlgebraicCurves Layer 12D, and it is the identification Jac(E, O) ≅ E of the JacobianChallenge acceptance checks.

**Hypotheses.** k is a field; X is smooth, proper and geometrically connected over k, of genus one.

**Proof outline.**

1. Riemann–Roch (SF.3/vector-bundle-riemann-roch) gives χ(N) = 1; Serre duality gives h¹(N) = h⁰(ω ⊗ N⁻¹) = 0 because deg(ω ⊗ N⁻¹) = −1 < 0; so h⁰(N) = 1.
2. An effective Cartier divisor D of degree 1 is finite over k with dim_k Γ(D, O_D) = 1 (Stacks, Varieties, Lemma 0AYY), hence a k-rational point.
3. Over a finite separable extension k' with X(k') ≠ ∅, a₁ is translation of the pointed isomorphism of (c) (JacobianChallenge Layer F); a₁ is defined over k, so it is an isomorphism over k.
4. Compatibility on k-points with Tau Ceti's Place.degreeOneEquivDegreeZeroClassGroup and Divisor.exists_linearlyEquivalent_ofPoint_of_genus_eq_one follows from AlgebraicCurves Layer 12D.

**Acceptance.** Non-example: the plane cubic x³ + 2y³ + 4z³ = 0 over Q has genus one and no rational point, so it has no invertible sheaf of degree one and Pic¹_{X/Q}(Q) = X(Q) is empty. Genus-one check of SF.3: for a Weierstrass elliptic curve E with origin O, Pic⁰_{E/k} ≅ E sends the group law to tensor product.

**Prerequisites.** SF.3/picard-scheme-without-point, SF.3/abel-maps-high-degree, SF.3/vector-bundle-riemann-roch, SF.3/curve-serre-duality, JacobianChallenge (Layer F), AlgebraicCurves (Layer 12), `TauCeti.Place.degreeOneEquivDegreeZeroClassGroup` (Tau Ceti), `TauCeti.Divisor.exists_linearlyEquivalent_ofPoint_of_genus_eq_one` (Tau Ceti).

**Sources.** The Stacks Project Authors, *The Stacks Project*: Varieties (tag 0209), Section 44 'Degrees on curves': Lemma 0AYY; Algebraic Curves (tag 0BRV), Section 17: Lemma 0CDU(1). Tau Ceti roadmap contributors, *Roadmap: the Jacobian challenge (Christian Merten's AG version)*: Acceptance criteria, item 'genus 1: Jac(E,O) ≅ E'.

### Vanishing, global generation and very ampleness of line bundles on curves by degree (`SF.3/line-bundle-degree-bounds`, theorem)

Let k be a field and X a smooth proper geometrically connected curve over k of genus g, and L an invertible sheaf on X. (i) If deg L < 0 then H⁰(L) = 0; if deg L = 0 then H⁰(L) ≠ 0 iff L ≅ O_X. (ii) If deg L > 2g − 2 then H¹(L) = 0 and h⁰(L) = deg L + 1 − g. (iii) If deg L ≥ 2g then L is globally generated; more precisely, for every nonempty zero-dimensional closed subscheme Z with deg L ≥ 2g − 1 + deg Z, L is globally generated and H⁰(L) → H⁰(L|_Z) is surjective. (iv) If deg L ≥ 2g + 1 then L is very ample. (v) If deg L ≥ g then h⁰(L) ≥ 1. In a family π : X_T → T of such curves, (ii) applied fibrewise makes π_*L locally free of rank deg L + 1 − g and compatible with arbitrary base change (JacobianChallenge Layer C).

**Hypotheses.** k is a field; X is smooth, proper and geometrically connected over k of genus g; L is invertible.

**Proof outline.**

1. (i) A nonzero section of a negative-degree sheaf would give an effective divisor of negative degree; in degree 0 its divisor is zero.
2. (ii) Serre duality H¹(L) ≅ H⁰(ω ⊗ L⁻¹)^∨ (SF.3/curve-serre-duality) and deg(ω ⊗ L⁻¹) < 0, then Riemann–Roch.
3. (iii) Apply (ii) to L(−Z) and L(−x) to get surjectivity of evaluation (Stacks, Algebraic Curves, Lemmas 0E3B, 0E3C, 0E3D).
4. (iv) Apply (ii) to L(−x − y) for all pairs of geometric points to separate points and tangents (Stacks, Algebraic Curves, Lemma 0H2V).
5. (v) Riemann–Roch: h⁰(L) ≥ deg L + 1 − g.

**Acceptance.** Genus 0: every L of degree ≥ 1 on P¹ is very ample (deg ≥ 2g + 1 = 1). Sharpness: on a genus-two curve, ω has degree 2g − 2 = 2 and h¹(ω) = 1, so (ii) fails at deg L = 2g − 2. Sharpness of (iv): on a genus-one curve a line bundle of degree 2 = 2g is globally generated but not very ample, since its sections define a double cover of P¹.

**Prerequisites.** SF.3/curve-serre-duality, SF.3/vector-bundle-riemann-roch, JacobianChallenge (Layer B), JacobianChallenge (Layer C), StableReduction (Layer 2).

**Sources.** The Stacks Project Authors, *The Stacks Project*: Algebraic Curves (tag 0BRV), Section 22 'More vanishing results' (tag 0E39): Lemmas 0E3A, 0E3B, 0E3C, 0E3D, 0H2V; Section 6: Lemma 0B5E.

## SF.3b. Vector bundles and duality on curves

JacobianChallenge states Riemann–Roch and Serre duality for line bundles. Consumers need them for vector bundles and coherent sheaves; these targets supply them as the curve case of SF.2's duality, identified with the dualizing sheaf of JacobianChallenge and StableReduction. They do not follow from the function-field Riemann–Roch theorem.

### Degree of a vector bundle on a proper curve (`SF.3/vector-bundle-degree`, definition) — planet: *Degree of a vector bundle on a curve*

Let k be a field, X a proper k-scheme of dimension at most one, and E a locally free O_X-module of constant finite rank r. Its degree is deg(E) := χ(X, E) − r·χ(X, O_X) ∈ Z, where χ(X, F) = dim_k H⁰(X, F) − dim_k H¹(X, F) is computed with the coherent cohomology of JacobianChallenge Layer B (finite-dimensional, zero above degree one). For r = 1 this is the degree deg L = χ(L) − χ(O_X) of JacobianChallenge Layer A. The degree is additive in short exact sequences of locally free sheaves, equals the degree of the determinant, satisfies deg(E ⊗ V) = rank(E) deg(V) + rank(V) deg(E), is invariant under extension of the base field, and multiplies by deg(X/Y) under pullback along a nonconstant morphism of proper curves.

**Hypotheses.** k is a field; X is proper over k with dim X ≤ 1; E is locally free of constant finite rank r ≥ 0.

**Proof outline.**

1. Finiteness and vanishing of H^i(X, E) for i ≥ 2 come from JacobianChallenge Layer B (coherent cohomology of proper curves), so χ is an integer.
2. Additivity: the long exact cohomology sequence of a short exact sequence of coherent sheaves and additivity of ranks (Stacks, Varieties, Lemma 0AYS; Tau Ceti finrank_cohomology_zero_sub_one_eq_add for the χ-additivity on curves).
3. Determinant: induction on the rank after a finite extension making E filtered by line subbundles, with base-change invariance (Stacks, Varieties, Lemmas 0B59 and 0DJ5).
4. Tensor product, twist by an effective Cartier divisor and pullback formulas: Stacks, Varieties, Lemmas 0AYX, 0AYY, 0AYZ.

**Declarations and API** (suggested module `TauCeti/AlgebraicGeometry/Curve/VectorBundleDegree`).

| name | role | statement |
|---|---|---|
| `TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree` | constructor | deg(E) = χ(X, E) − rank(E)·χ(X, O_X) for E locally free of constant rank on a proper k-scheme of dimension ≤ 1. |
| `TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_rankOne` | compatibility | For an invertible sheaf L, the degree is JacobianChallenge Layer A's deg L = χ(L) − χ(O_X). |
| `TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_of_iso` | extensionality | Isomorphic bundles have equal degree. |
| `TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_add_of_shortExact` | relation | For 0 → E₁ → E₂ → E₃ → 0 locally free, deg E₂ = deg E₁ + deg E₃. |
| `TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_det` | characterisation | deg E = deg(det E) = deg(∧^r E). |
| `TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_tensor` | simp | deg(E ⊗ V) = rank(E) deg(V) + rank(V) deg(E). |
| `TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_dual` | simp | deg(E^∨) = − deg(E). |
| `TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_twist` | simp | deg(E(D)) = rank(E) deg(D) + deg(E) for an effective Cartier divisor D with deg D = dim_k Γ(D, O_D). |
| `TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_elementaryModification` | relation | If E' ⊂ E is a locally free subsheaf of the same rank with E/E' of finite length, deg E' = deg E − dim_k Γ(X, E/E'). |
| `TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_baseChange` | functoriality | deg(E_K) on X_K over K equals deg(E) for every field extension K/k. |
| `TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_pullback` | functoriality | For a nonconstant morphism f : X → Y of proper curves, deg(f*E) = deg(X/Y)·deg(E). |

**Unit tests.**

- `TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_trivial` (degenerate): deg(O_X^r) = 0 for every r ≥ 0, and the zero bundle has degree 0.
- `TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_projectiveLine` (computation): On P¹_k, deg(O(a) ⊕ O(b)) = a + b for all integers a, b.
- `TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_divisor` (compatibility): On a regular proper curve X with Weil divisor D, deg O_X(D) = Σ_x n_x [κ(x):k], the value of Tau Ceti's SchemeWeilDivisor.relativeDegree along X → Spec k.
- `TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_ne_eulerChar` (non-example): On a smooth proper geometrically connected genus-two curve, χ(O_X) = −1 while deg(O_X) = 0: the degree is not the Euler characteristic.
- `TauCeti.AlgebraicGeometry.Curve.vectorBundleDegree_filtration` (characterisation): If E has a filtration by locally free subsheaves with invertible quotients L_1, …, L_r then deg E = Σ deg L_i; for example E = O(1) ⊕ O(−1) on P¹_k has degree 0 although E is not isomorphic to O², so the degree does not determine the bundle.

**Uses.** HodgeStructuresPartII:H.4 (parabolic bundles, parabolic degree): ordinary degree of the underlying bundle, rank/degree additivity on saturated sequences and the length formula for elementary modifications; Yu 2023, Ch.15 Lemma 4.2.1 (routed to SF.3): degrees and slopes of bundles on X_1 in the shifted-slope argument; Landesman–Litt 2024, §5 and Appendix A (routed to SF.3): degrees of E ⊗ ω_C(D) and E^∨ ⊗ ω_C; SchemeAndStackFoundations:SF.3/scheme-riemann-hurwitz: additivity of degree along f*Ω_Y → Ω_X; SchemeAndStackFoundations:SF.3/vector-bundle-riemann-roch: χ(E) in terms of deg(E) and the rank.

**Acceptance.** deg(O_X^r) = 0. On P¹_k, deg(O(a) ⊕ O(b)) = a + b. For a regular proper curve and a Weil divisor D, deg O_X(D) equals Tau Ceti's SchemeWeilDivisor.relativeDegree of D along X → Spec k.

**Prerequisites.** JacobianChallenge (Layer A), JacobianChallenge (Layer B), `AlgebraicGeometry.Scheme.Modules.eulerCharBelow` (Tau Ceti), `AlgebraicGeometry.Scheme.Modules.finrank_cohomology_zero_sub_one_eq_add` (Tau Ceti), `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.relativeDegree` (Tau Ceti), `AlgebraicGeometry.Scheme.Modules` (Mathlib), `Module.finrank` (Mathlib).

**Sources.** The Stacks Project Authors, *The Stacks Project*: Varieties (tag 0209), Section 44 'Degrees on curves' (tag 0AYQ): Definition 0AYR, Lemmas 0B59, 0AYS, 0AYW, 0AYX, 0DJ5, 0AYY, 0AYZ. Tau Ceti roadmap contributors, *Roadmap: the Jacobian challenge (Christian Merten's AG version)*: Layer A, item 'Degree'.

### Riemann–Roch for vector bundles on Gorenstein curves (`SF.3/vector-bundle-riemann-roch`, theorem)

Let k be a field and X a proper k-scheme which is Gorenstein and equidimensional of dimension one, with dualizing module ω_X (invertible; SF.3/curve-serre-duality). Then deg ω_X = −2χ(X, O_X), and for every locally free E of constant rank r, χ(X, E) = deg(E) − (r/2)·deg(ω_X), and dim_k H^i(X, E) = dim_k H^{1−i}(X, E^∨ ⊗ ω_X). If X is smooth, proper and geometrically connected of genus g, this reads χ(X, E) = deg(E) + r(1 − g), with deg Ω¹_{X/k} = 2g − 2. For r = 1 this is the line-bundle Riemann–Roch χ(L) = deg L + 1 − g of JacobianChallenge Layer B; the vector-bundle form is not a consequence of the function-field Riemann–Roch of AlgebraicCurves Layer 4.

**Hypotheses.** k is a field; X is proper over k, Gorenstein and equidimensional of dimension one; E is locally free of constant finite rank.

**Proof outline.**

1. By Serre duality χ(ω_X) = −χ(O_X) (Stacks, Algebraic Curves, Lemma 0BS5), and χ(ω_X) = deg ω_X + χ(O_X) by the definition of degree, so deg ω_X = −2χ(O_X).
2. By definition of the degree (SF.3/vector-bundle-degree), χ(E) = deg(E) + rχ(O_X) = deg(E) − (r/2) deg(ω_X).
3. The dimension equality is Serre duality for E (SF.3/curve-serre-duality, part (ii)).
4. In the smooth case χ(O_X) = 1 − g and ω_X ≅ Ω¹_{X/k} (SF.3/curve-serre-duality, part (iv)).

**Acceptance.** E = O_X^r: χ = r(1 − g). E = ω_X on a smooth curve of genus g: χ(ω) = g − 1, deg ω = 2g − 2. On P¹_k, E = O(a) ⊕ O(b): χ = a + b + 2. On a nodal plane cubic (arithmetic genus 1, Gorenstein): deg ω_X = 0.

**Prerequisites.** SF.3/vector-bundle-degree, SF.3/curve-serre-duality, JacobianChallenge (Layer B), StableReduction (Layer 2).

**Sources.** The Stacks Project Authors, *The Stacks Project*: Algebraic Curves (tag 0BRV), Section 5 'Riemann-Roch' (tag 0B5B): Lemmas 0BS5, 0BS6.

### Serre duality for coherent sheaves on proper Cohen–Macaulay curves (`SF.3/curve-serre-duality`, theorem) — planet: *Serre duality on curves*

Let k be a field and X a proper k-scheme which is Cohen–Macaulay and equidimensional of dimension one, f : X → Spec k, and ω_X := H^{-1}(f^!k) the dualizing module, so that f^!k ≅ ω_X[1] (SF.2/serre-proper and SF.2/canonical-module). Then: (i) for every quasi-coherent F there are functorial isomorphisms Ext^{1+i}_X(F, ω_X) ≅ Hom_k(H^{−i}(X, F), k), compatible with long exact sequences; equivalently Ext^j_X(F, ω_X) ≅ H^{1−j}(X, F)^∨ for coherent F; (ii) for E locally free of finite rank, H^i(X, E^∨ ⊗ ω_X) ≅ H^{1−i}(X, E)^∨; (iii) for U, V locally free of finite rank, Ext¹_X(U, V) ≅ Hom_X(V, U ⊗ ω_X)^∨; (iv) if X is smooth over k then ω_X ≅ Ω¹_{X/k} (SF.2/smooth-proper with d = 1), this sheaf is the dualizing sheaf ω_{X/k} of JacobianChallenge Layer B and StableReduction Layer 2, and h⁰(Ω¹) = g, deg Ω¹ = 2g − 2 when H⁰(X, O_X) = k; (v) for L invertible, (ii) is the line-bundle Serre duality of JacobianChallenge Layer B. This is the curve case of SF.2's coherent duality; duality in higher dimension and over bases is owned by SF.2 and StableReduction Layer 2.

**Hypotheses.** k is a field; X is proper over k, Cohen–Macaulay and equidimensional of dimension one; F quasi-coherent; U, V, E locally free of finite rank. Part (iv) assumes X smooth over k, and for the numerical statements H⁰(X, O_X) = k.

**Proof outline.**

1. SF.2/serre-proper: Ext^i_X(K, f^!k) ≅ Hom_k(H^{−i}(X, K), k) for K in D_qc(X).
2. For X Cohen–Macaulay and equidimensional of dimension one, f^!k has a single nonzero cohomology sheaf, in degree −1 (SF.2/canonical-module; Stacks, Algebraic Curves, Lemmas 0BS2 and 0BS3), so Ext^i(F, f^!k) = Ext^{i+1}(F, ω_X).
3. For E locally free, Ext^j(E, ω_X) = H^j(X, E^∨ ⊗ ω_X), giving (ii).
4. Ext¹(U, V) = H¹(X, U^∨ ⊗ V) ≅ H⁰(X, U ⊗ V^∨ ⊗ ω_X)^∨ = Hom(V, U ⊗ ω_X)^∨ by (ii) with E = U ⊗ V^∨, giving (iii).
5. For f smooth of relative dimension one, SF.2/smooth-proper gives f^!k ≅ Ω¹_{X/k}[1]; the numerical identities are Stacks, Algebraic Curves, Lemma 0C1A, and the comparison with JacobianChallenge's ω_{X/k} is the StableReduction contract J-B / SR-2 (one dualizing-sheaf interface).

**Acceptance.** On P¹_k: ω = O(−2) and H¹(P¹, O(−2)) ≅ H⁰(P¹, O)^∨ = k. On a smooth genus-g curve: h⁰(Ω¹) = g and h¹(Ω¹) = 1. Yu's form: for line bundles U = L, V = M, Ext¹(L, M) ≅ H⁰(L ⊗ M^∨ ⊗ ω)^∨.

**Prerequisites.** SF.2/serre-proper, SF.2/smooth-proper, SF.2/canonical-module, StableReduction (Layer 2), JacobianChallenge (Layer B), `KaehlerDifferential` (Mathlib).

**Sources.** The Stacks Project Authors, *The Stacks Project*: Algebraic Curves (tag 0BRV), Section 4 'Duality' (tag 0E31): Lemmas 0BS2, 0BS3, Remark 0BS4; Section 8: Lemma 0C1A. Tau Ceti roadmap contributors, *Roadmap: the Jacobian challenge (Christian Merten's AG version)*: Layer B, item 'Serre duality'. Tau Ceti roadmap contributors, *Roadmap: stable reduction of curves and stable maps*: Inventory, contract J-B / SR-2, and Layer 2.

## SF.3c. Picard groups, groupoids and torsors

These targets describe Picard groups of schemes cohomologically and by divisors, keep the automorphisms that the Picard group forgets, and treat curves without rational points, where rational divisor classes and rational divisors differ by a Brauer class.

### The Picard group as first cohomology of the units (Hilbert 90 for schemes) (`SF.3/picard-cohomological`, comparison)

For every scheme X there are canonical isomorphisms Pic(X) ≅ H¹_Zar(X, O_X^×) ≅ H¹_et(X, G_m) ≅ H¹_fppf(X, G_m), natural in X and compatible with tensor product of invertible sheaves and pullback; here Pic(X) is the group of isomorphism classes of invertible sheaves of JacobianChallenge Layer A (Tau Ceti's LineBundleClass with the inverses supplied by duals), and the étale group is computed on the small étale site of X (Mathlib's smallEtaleTopology) with the cohomology of SF.2. For X = Spec k this is the vanishing of H¹(Gal(k^s/k), k^{s×}) (Hilbert's Theorem 90); for X = Spec A affine, Pic(X) is Mathlib's CommRing.Pic A.

**Hypotheses.** X is an arbitrary scheme; G_m is the multiplicative group as a sheaf on the small or big site of X.

**Proof outline.**

1. Čech description in degree one: a G_m-valued 1-cocycle on a covering U → X for the étale or fppf topology is a descent datum on O_U, effective by fpqc descent for quasi-coherent modules (SF.1), and the descended module is invertible because the covering is faithfully flat.
2. Conversely an invertible sheaf is Zariski-locally trivial, giving a Čech class; isomorphic sheaves give cohomologous cocycles.
3. In degree one Čech cohomology computes derived-functor cohomology for every topology, so the four groups agree (Stacks, Étale Cohomology, Theorem 03P8; Kleiman, formula (2.11.1) and p. 21).
4. Naturality and the group structure: pullback and tensor product correspond to restriction and product of cocycles.

**Acceptance.** X = Spec k: H¹_et(Spec k, G_m) = 0, which is Mathlib's groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units in each finite Galois layer. X = P¹_k: H¹(P¹, O^×) ≅ Z, generated by O(1). X = Spec A with A Dedekind: Pic(X) ≅ CommRing.Pic A ≅ ClassGroup A.

**Prerequisites.** JacobianChallenge (Layer A), SF.1, SF.2, `AlgebraicGeometry.Scheme.smallEtaleTopology` (Mathlib), `CategoryTheory.Sheaf.H` (Mathlib), `CommRing.Pic` (Mathlib), `groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units` (Mathlib), `TauCeti.AlgebraicGeometry.LineBundleClass` (Tau Ceti).

**Sources.** The Stacks Project Authors, *The Stacks Project*: Étale Cohomology (tag 03N1), Section 24: Theorem 03P8. Steven L. Kleiman, *The Picard scheme*: Remark 2.11, formula (2.11.1), p. 20, and the Hilbert 90 paragraph, p. 21.

### Weil divisor classes and the Picard group on normal and locally factorial schemes (`SF.3/class-group-picard-locally-factorial`, theorem)

Let X be a locally Noetherian integral scheme with Weil divisor class group Cl(X) (Tau Ceti's divisor class group of SchemeWeilDivisor with principal divisors given by Mathlib's orders of vanishing), and let c₁ : Pic(X) → Cl(X) send an invertible sheaf to the Weil divisor of any nonzero rational section. (i) If X is normal, c₁ is an injective homomorphism. (ii) The local rings of X are unique factorization domains if and only if X is normal and c₁ is surjective; in particular, for X normal, c₁ is bijective exactly when X is locally factorial, and c₁ is an isomorphism for X regular. (Without normality bijectivity does not imply factoriality: for X = Spec k[[t², t³]] both groups vanish.) (iii) For X Noetherian, integral, separated and locally factorial, Cl(X), the group of Cartier divisor classes and Pic(X) are canonically isomorphic. On a Noetherian integral scheme of dimension at most one whose codimension-one local rings are discrete valuation rings, c₁ is inverse to Tau Ceti's classGroupToLineBundleClass and the Cartier step is Tau Ceti's equivCartierDivisor.

**Hypotheses.** X is a locally Noetherian integral scheme; for (iii) X is in addition Noetherian, separated and locally factorial.

**Proof outline.**

1. The divisor of a rational section is well defined modulo principal divisors and additive in tensor products (Stacks, Divisors, Lemma 02SL).
2. Injectivity for normal X: an invertible sheaf whose rational section has principal divisor has a nowhere-vanishing global section after rescaling, because a normal Noetherian domain is the intersection of its height-one localizations (Stacks, Divisors, Lemma 0BE8).
3. Local factoriality is equivalent to normality plus surjectivity: a prime divisor through x is locally principal exactly when its height-one prime in O_{X,x} is principal (Stacks, Divisors, Lemma 0BE9); regular local rings are unique factorization domains (Auslander–Buchsbaum).
4. For curves the inverse map is Tau Ceti's D ↦ O_X(D) (classGroupToLineBundleClass, injective) and JacobianChallenge Layer A's surjectivity.

**Acceptance.** Dedekind case: X = Spec A gives Cl(A) ≅ Pic(A), Mathlib's ClassGroup and CommRing.Pic. Non-example for surjectivity: the quadric cone Spec k[x, y, z]/(xy − z²) is normal with Cl = Z/2 and Pic = 0. Non-example for injectivity without normality: on the cuspidal cubic the degree-zero part of Pic is G_a(k) while the Weil divisor class group of degree zero is trivial.

**Prerequisites.** JacobianChallenge (Layer A), `TauCeti.AlgebraicGeometry.SchemeWeilDivisor` (Tau Ceti), `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClass_injective` (Tau Ceti), `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.equivCartierDivisor` (Tau Ceti), `TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ofScheme` (Tau Ceti), `AlgebraicGeometry.Scheme.ord` (Mathlib), `AlgebraicGeometry.AlgebraicCycle` (Mathlib).

**Sources.** The Stacks Project Authors, *The Stacks Project*: Divisors (tag 01WO), Sections 27–28 'Weil divisors' (tag 0BE0) and 'The Weil divisor class associated to an invertible module' (tag 02SE): Definitions 0BE4, 0BE6, Lemmas 02SL, 0BE8, 0BE9.

### The excision sequence for Picard groups along a boundary divisor (`SF.3/picard-excision-sequence`, theorem)

Let X be a Noetherian, integral, separated, locally factorial scheme, U ⊂ X a dense open subscheme, and D_1, …, D_r the irreducible components of X ∖ U of codimension one. There is an exact sequence O(U)^× / O(X)^× → ⊕_i Z·D_i → Pic(X) → Pic(U) → 0, the first map taking a unit f on U to its divisor (supported on the D_i), the second taking D_i to O_X(D_i), the third being restriction. In particular, if every unit on U is constant on X, i.e. O(U)^× = O(X)^×, then 0 → Div_{X∖U}(X) → Pic(X) → Pic(U) → 0 is exact. When X is smooth and geometrically integral over a field k and the sequence is formed over k̄, it is Gal(k̄/k)-equivariant and Div_{X̄∖Ū}(X̄) is a permutation module.

**Hypotheses.** X is Noetherian, integral, separated and locally factorial; U ⊂ X is open and dense; components of X ∖ U of codimension at least two contribute nothing.

**Proof outline.**

1. Weil divisors split as Z¹(X) = Z¹(U) ⊕ (⊕_i Z·D_i), and restriction of principal divisors is compatible; this gives the localization sequence in codimension one (Stacks, Chow Homology, Lemma 02RX).
2. Identify Weil divisor classes with Picard groups on X and on U by SF.3/class-group-picard-locally-factorial (U is again locally factorial).
3. Exactness at the left: a unit f on U whose divisor on X is zero is regular and invertible at every codimension-one point, hence a unit on X by normality.

**Acceptance.** X = P^n_k, U = A^n_k: Pic(A^n) = 0 and Z·H → Pic(P^n) is an isomorphism. X = P¹_k, U = G_m: the unit t on U has divisor [0] − [∞], and the sequence reads Z → Z² → Z → 0. Harpaz–Wittenberg setting: X smooth geometrically irreducible over a field of characteristic zero with k̄[V]^× = k̄^×.

**Prerequisites.** SF.3/class-group-picard-locally-factorial, `AlgebraicGeometry.AlgebraicCycle` (Mathlib), `TauCeti.AlgebraicGeometry.SchemeWeilDivisor` (Tau Ceti).

**Sources.** The Stacks Project Authors, *The Stacks Project*: Chow Homology (tag 02P3), Section 19: Lemma 02RX. Yonatan Harpaz, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*: §3, diagram (3.1), p. 12.

### Picard groupoids, and the Picard groupoid of a scheme (`SF.3/picard-groupoid`, construction)

(a) A Picard groupoid is a symmetric monoidal category (Mathlib's MonoidalCategory and SymmetricCategory) whose underlying category is a groupoid and in which every object is invertible for the tensor product (it is part of an exact pairing). Its isomorphism classes π₀ form an abelian group and the automorphisms π₁ of the unit form an abelian group acting on every object. (b) For a scheme X, the Picard groupoid 𝒫ic(X) is the core (Mathlib's CategoryTheory.Core) of Tau Ceti's category InvertibleSheaf X, with the tensor product InvertibleSheaf.tensorProduct, unit O_X and inverse the dual sheaf (JacobianChallenge Layer A). Then π₀𝒫ic(X) = Pic(X) and π₁𝒫ic(X) = Aut(O_X) = Γ(X, O_X)^×. (c) Pullback along f : Y → X is a symmetric monoidal functor 𝒫ic(X) → 𝒫ic(Y), pseudofunctorial in f, and T ↦ 𝒫ic(T) satisfies effective descent for fppf coverings (SF.1), so it is a stack in Picard groupoids.

**Hypotheses.** (a) is categorical; (b), (c) apply to every scheme; descent in (c) is fppf descent of quasi-coherent modules.

**Proof outline.**

1. Define 𝒫ic(X) as the core of the full subcategory of invertible O_X-modules; the monoidal structure restricts because tensor products and duals of invertible sheaves are invertible (Tau Ceti tensorProduct; dual from JacobianChallenge Layer A).
2. The associator, unitors and symmetry are the restrictions of those of O_X-modules; coherence is inherited.
3. π₀ is the skeleton, which is Tau Ceti's LineBundleClass; with duals it is a group, JacobianChallenge's Pic(X).
4. Automorphisms of O_X as a module are multiplication by global units.
5. Pullback is strong monoidal; descent of invertible sheaves along fppf coverings is SF.1's descent of quasi-coherent modules plus invertibility being fppf-local.

**Declarations and API** (suggested module `TauCeti/AlgebraicGeometry/Picard/Groupoid`).

| name | role | statement |
|---|---|---|
| `TauCeti.AlgebraicGeometry.Picard.PicardGroupoid` | structure | A symmetric monoidal groupoid in which every object has a tensor inverse (an exact pairing with some object). |
| `TauCeti.AlgebraicGeometry.Picard.PicardGroupoid.pi0` | projection | The abelian group of isomorphism classes, with product induced by the tensor product. |
| `TauCeti.AlgebraicGeometry.Picard.PicardGroupoid.pi1` | projection | The abelian group Aut(1) of automorphisms of the unit. |
| `TauCeti.AlgebraicGeometry.Picard.picardGroupoid` | constructor | 𝒫ic(X) = Core(InvertibleSheaf X) with tensor product, unit O_X and duals. |
| `TauCeti.AlgebraicGeometry.Picard.picardGroupoid.pi0_equiv` | equivalence | π₀𝒫ic(X) ≅ Pic(X), equal to Tau Ceti's LineBundleClass X as a monoid. |
| `TauCeti.AlgebraicGeometry.Picard.picardGroupoid.pi1_equiv` | equivalence | π₁𝒫ic(X) ≅ Γ(X, O_X)^× via multiplication by units. |
| `TauCeti.AlgebraicGeometry.Picard.picardGroupoid.pullback` | functoriality | Pullback along f : Y → X is a symmetric monoidal functor, with canonical isomorphisms for identities and compositions. |
| `TauCeti.AlgebraicGeometry.Picard.picardGroupoid.isStack` | other | T ↦ 𝒫ic(T) satisfies effective descent for fppf coverings of schemes. |
| `TauCeti.AlgebraicGeometry.Picard.gradedPicardGroupoid` | constructor | The graded Picard groupoid of pairs (L, f) with f : X → Z locally constant, tensor (L, f) ⊗ (M, g) = (L ⊗ M, f + g) and symmetry ℓ ⊗ m ↦ (−1)^{fg} m ⊗ ℓ; π₀ = Pic(X) × H⁰(X, Z) and π₁ = Γ(X, O_X)^×. |

**Unit tests.**

- `TauCeti.AlgebraicGeometry.Picard.picardGroupoid_pi0` (characterisation): π₀𝒫ic(X) is isomorphic to LineBundleClass X, compatibly with tensor product.
- `TauCeti.AlgebraicGeometry.Picard.picardGroupoid_field` (computation): For X = Spec k, 𝒫ic(X) is equivalent to the one-object groupoid with automorphism group k^×.
- `TauCeti.AlgebraicGeometry.Picard.picardGroupoid_projectiveLine` (computation): For X = P¹_k, π₀ = Z (generated by O(1)) and π₁ = k^×.
- `TauCeti.AlgebraicGeometry.Picard.picardGroupoid_not_discrete` (non-example): When Γ(X, O_X)^× is nontrivial, 𝒫ic(X) is not equivalent to the discrete groupoid on Pic(X); and the symmetric monoidal category of all O_X-modules is not a Picard groupoid since O_X ⊕ O_X has no tensor inverse.

**Uses.** Bhatt–Scholze 2017, §§4–5 and §12 (routed to SF.1 and SF.3): the groupoid of line bundles and graded Picard v-descent; the abstract Picard interface for determinant descent; Witaszek 2022 (routed to SF.1): Picard groupoids of conductor squares and their patching as 2-fibre products; SchemeAndStackFoundations:SF.3/picard-stack-curve: the Picard stack of a curve is T ↦ 𝒫ic(X_T); FunctionFieldArithmeticPartII:GC.0/root-picard: the graded root Picard stack is built from ordinary Picard groupoids in all degrees; NeronModelsAndSemistableAbelianVarietiesPartII:G.0/line-bundle-patching: invertible sheaves on a conductor pushout form a groupoid fibre product.

**Acceptance.** For X = Spec k the groupoid has one isomorphism class with automorphism group k^×. π₀ of 𝒫ic(P¹_k) is Z and π₁ is k^×.

**Prerequisites.** JacobianChallenge (Layer A), SF.1, `TauCeti.AlgebraicGeometry.InvertibleSheaf` (Tau Ceti), `TauCeti.AlgebraicGeometry.InvertibleSheaf.tensorProduct` (Tau Ceti), `TauCeti.AlgebraicGeometry.LineBundleClass` (Tau Ceti), `CategoryTheory.Core` (Mathlib), `CategoryTheory.MonoidalCategory` (Mathlib), `CategoryTheory.SymmetricCategory` (Mathlib), `CategoryTheory.ExactPairing` (Mathlib), `CategoryTheory.Groupoid` (Mathlib).

**Sources.** Bhargav Bhatt, *Projectivity of the Witt vector affine Grassmannian*: §4 opening, p. 15; Construction 5.1, p. 18; Definition 12.14 and Proposition 12.15, pp. 58–59. Tau Ceti roadmap contributors, *Roadmap: the Jacobian challenge (Christian Merten's AG version)*: Layer A, item 'Invertible sheaves on a scheme; the Picard group Pic X under ⊗'.

### Norms of invertible sheaves along finite locally free morphisms (`SF.3/line-bundle-norm`, construction)

Let π : X → Y be a finite locally free morphism of schemes of constant degree d ≥ 1. The canonical norm Norm_π : π_*O_X → O_Y (the determinant of multiplication) is multiplicative, restricts to g ↦ g^d on O_Y, and its formation commutes with arbitrary base change on Y. It induces a homomorphism Norm_π : Pic(X) → Pic(Y) with Norm_π(π*N) ≅ N^{⊗d}, and a norm on sections of invertible sheaves Norm_π : Γ(X, L) → Γ(Y, Norm_π L) whose zero locus is the image of the zero locus of the section. Equivalently Norm_π(L) ≅ det(π_*L) ⊗ det(π_*O_X)^{-1}. For π a finite flat morphism of smooth proper curves over a field, Norm_π(O_X(D)) ≅ O_Y(π_*D) for every divisor D, with π_*[x] = [κ(x):κ(π x)]·[π x], and deg Norm_π(L) = deg L.

**Hypotheses.** π : X → Y is finite locally free of constant degree d ≥ 1; the curve statements assume X, Y smooth proper curves over a field and π finite flat.

**Proof outline.**

1. Existence of the canonical norm of degree d for finite locally free π, compatible with base change (Stacks, Divisors, Lemma 0BD2).
2. Given a norm, an invertible sheaf on X trivializes over π⁻¹(V) for small V ⊂ Y; apply Norm_π to the transition functions to define Norm_π(L) (Stacks, Divisors, Lemmas 0BCY and 0BCZ, with the vanishing property).
3. Norm_π(π*N) ≅ N^{⊗d} because Norm_π restricted to O_Y is the d-th power; multiplicativity gives a homomorphism.
4. Determinant description: compare transition functions of det π_*L with those of det π_*O_X on a trivializing cover.
5. Curves: the norm of the canonical section of O_X(x) vanishes exactly at π(x) to order [κ(x):κ(π x)], since the length of O_X/m_x over O_{Y,π x} is that degree.

**Declarations and API** (suggested module `TauCeti/AlgebraicGeometry/Picard/Norm`).

| name | role | statement |
|---|---|---|
| `TauCeti.AlgebraicGeometry.Picard.lineBundleNorm` | constructor | Norm_π : Pic(X) → Pic(Y) for π finite locally free of constant degree d ≥ 1. |
| `TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_pullback` | simp | Norm_π(π*N) ≅ N^{⊗d}. |
| `TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_tensor` | simp | Norm_π(L ⊗ L') ≅ Norm_π(L) ⊗ Norm_π(L'). |
| `TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_comp` | functoriality | Norm_{π∘ρ} ≅ Norm_π ∘ Norm_ρ for composable finite locally free morphisms, and Norm_id = id. |
| `TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_baseChange` | functoriality | Formation of Norm_π commutes with base change along any Y' → Y. |
| `TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_det` | characterisation | Norm_π(L) ≅ det(π_*L) ⊗ det(π_*O_X)^{-1}. |
| `TauCeti.AlgebraicGeometry.Picard.sectionNorm` | data | A section s of L gives Norm_π(s) in Γ(Y, Norm_π L), vanishing at y iff s vanishes at some point over y. |
| `TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_divisor` | compatibility | For curves, Norm_π(O_X(D)) ≅ O_Y(π_*D) and deg Norm_π(L) = deg L. |

**Unit tests.**

- `TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_id` (degenerate): For π = id_X, Norm_π(L) ≅ L.
- `TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_square` (computation): For π : P¹_k → P¹_k, z ↦ z², Norm_π(O(1)) ≅ O(1) and Norm_π(O(2)) ≅ O(2).
- `TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_field` (compatibility): For Y = Spec k and X = Spec K with K/k finite, the norm π_*O_X^× → O_Y^× is Algebra.norm k on K^×.
- `TauCeti.AlgebraicGeometry.Picard.lineBundleNorm_ne_det` (non-example): For a hyperelliptic double cover π : C → P¹ of genus g ≥ 1, det(π_*O_C) ≅ O(−g−1) is nontrivial, so Norm_π(O_C) ≅ O while det(π_*O_C) is not trivial: the norm is not the determinant of the pushforward, and not the pushforward itself (which has rank 2).

**Uses.** MotivesAndAlgebraicCycles:MC.7/smash-nilpotence: the norm along the finite flat morphism X^n → S^n(X) and the identity π*Norm(L₁) ≅ (L₁ ⊗ … ⊗ L_n)^{⊗(n−1)!}; FunctionFieldArithmeticPartII:GC.6/norm-residue-square and GC.6/root-norm: the norm of a double cover restricted to the ramification and the ramified norm of Picard objects; Yun–Zhang 2017, §6.1: the Picard norm Nm : Pic_{X'} → Pic_X and its kernel; SchemeAndStackFoundations:SF.3/picard-norm-sequence: sheafifying the norm to Picard schemes and stacks.

**Acceptance.** For π = id_X the norm is the identity. For the double cover π : P¹ → P¹, z ↦ z², Norm(O(1)) = O(1) and Norm(π*O(1)) = Norm(O(2)) = O(2) = O(1)^{⊗2}. Over a field, for X = Spec of a finite extension, the norm on units is Mathlib's Algebra.norm.

**Prerequisites.** JacobianChallenge (Layer A), `TauCeti.AlgebraicGeometry.InvertibleSheaf` (Tau Ceti), `AlgebraicGeometry.IsFinite` (Mathlib), `AlgebraicGeometry.Flat` (Mathlib), `Algebra.norm` (Mathlib).

**Sources.** The Stacks Project Authors, *The Stacks Project*: Divisors (tag 01WO), Section 18 'Norms' (tag 0BCX): Lemmas 0BCY, 0BCZ, 0BD2. Zhiwei Yun, *Shtukas and the Taylor expansion of L-functions*: §6.1, proof of Proposition 6.1(1), p. 40.

### Picard schemes and Picard torsors of a curve without a rational point (`SF.3/picard-scheme-without-point`, theorem) — planet: *Picard torsors of a curve*

Let k be a field and X a smooth projective geometrically connected curve over k of genus g; no rational point is assumed. Let Pic_{X/k} be the Picard sheaf of JacobianChallenge Layer D (fppf sheafification of T ↦ Pic(X_T)). (i) Pic_{X/k} coincides with its étale sheafification, and Pic_{X/k}(T) = Pic(X_T)/Pic(T) for every k-scheme T with X(T) nonempty; in particular Pic_{X/k}(k) = Pic(X_{k^s})^{Gal(k^s/k)}. (ii) Pic_{X/k} is represented by a smooth separated commutative group scheme locally of finite type over k, the disjoint union of open and closed subschemes Pic^d_{X/k} (d ∈ Z) parametrizing classes of degree d on the geometric fibres. (iii) Pic⁰_{X/k} is an abelian variety of dimension g; over every extension K/k with X(K) nonempty it is the Jacobian of X_K of JacobianChallenge Layers D–E, and its formation commutes with field extension. (iv) Each Pic^d_{X/k} is a torsor under Pic⁰_{X/k} for the tensor action, a smooth projective geometrically connected k-variety of dimension g, trivial exactly when Pic^d_{X/k}(k) is nonempty; Pic^{2g−2}_{X/k} has the k-point [ω_{X/k}], and the degrees d with Pic^d_{X/k}(k) nonempty form a subgroup PZ ⊆ Z (P the period) containing the degrees of k-rational divisors.

**Hypotheses.** k is a field; X is smooth, projective and geometrically connected over k, of genus g; X(k) may be empty.

**Proof outline.**

1. X has a closed point with separable residue field (Stacks, Varieties, Lemma 056U), so X(k') ≠ ∅ for some finite Galois extension k'/k.
2. Over k', JacobianChallenge Layer D represents Pic_{X_{k'}/k'} using a k'-point to rigidify (Stacks, Picard Schemes of Curves, Lemma 0B9N and Proposition 0B9Z), with components Pic^d translates of the projective Jacobian Pic⁰ (Stacks, Lemma 0BA0).
3. The universal sheaf transported by Gal(k'/k) gives a descent datum on the representing scheme; each component is quasi-projective, so the descent datum is effective (Milne, Abelian Varieties, Part III, Propositions 1.13 and 1.14; effective étale descent of polarized schemes in StableReduction Layer 2; SF.1).
4. The descended scheme represents the étale sheafification of T ↦ Pic(X_T), which equals the fppf sheafification because X → Spec k has sections étale-locally and O_k ≅ f_*O_X universally (Kleiman, Theorem 2.5 and Remark 2.11; Milne, Part III, Remark 1.12).
5. Torsor structure: tensor product Pic⁰ × Pic^d → Pic^d becomes an isomorphism with the projection after base change to k', hence over k; triviality is equivalent to a k-point. [ω] is k-rational of degree 2g − 2 (SF.3/curve-serre-duality).
6. Base change of the sheafification along k → K gives the base change of the representing scheme.

**Acceptance.** Genus 0: for a conic X without rational point, Pic^d_{X/k} ≅ Spec k for every d, so every Pic^d_{X/k}(k) is nonempty (period 1), but the k-point of Pic¹ is not represented by an invertible sheaf (index 2): its obstruction δ is the class of the conic in Br(k) (SF.3/picard-brauer-sequence). Genus 1: Pic¹_{X/k} ≅ X (SF.3/genus-one-curves). With x₀ ∈ X(k): Pic^d_{X/k} ≅ Pic⁰_{X/k} by L ↦ L(−d x₀), recovering JacobianChallenge Layer D.

**Prerequisites.** JacobianChallenge (Layer D), JacobianChallenge (Layer E), JacobianChallenge (Layer A), SF.1, StableReduction (Layer 2), SF.3/curve-serre-duality, `AlgebraicGeometry.Smooth` (Mathlib), `AlgebraicGeometry.IsProper` (Mathlib), `AlgebraicGeometry.GeometricallyIntegral` (Mathlib), `TauCeti.AlgebraicGeometry.AbelianVariety` (Tau Ceti), `TauCeti.AlgebraicGeometry.AbelianVariety.baseChange` (Tau Ceti).

**Sources.** J. S. Milne, *Abelian Varieties (course notes, v2.00)*: Part III 'Jacobian Varieties', §1: Theorem 1.6, Remarks 1.4(a)–(b), 1.10–1.12, Propositions 1.13–1.14, pp. 88–91. Steven L. Kleiman, *The Picard scheme*: Definition 2.2, p. 17; Theorem 2.5 (Comparison), p. 18; Remark 2.11, pp. 20–21. The Stacks Project Authors, *The Stacks Project*: Picard Schemes of Curves (tag 0B92): Definition 0B9L, Lemmas 0B9M, 0B9N, Proposition 0B9Z, Lemma 0BA0; Varieties (tag 0209): Lemma 056U. Manjul Bhargava, *A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension*: §3, p. 10. Tau Ceti roadmap contributors, *Roadmap: the Jacobian challenge (Christian Merten's AG version)*: Standing hypotheses; Layer D; 'Scope and caveats': the k-rational point and the Pic¹-torsor story.

### The Picard–Brauer obstruction sequence over a field (`SF.3/picard-brauer-sequence`, theorem) — planet: *Picard–Brauer obstruction sequence*

Let k be a field with separable closure k^s and G_k = Gal(k^s/k), and X a proper k-scheme with H⁰(X, O_X) = k and X(k^s) nonempty (for instance a smooth projective geometrically connected curve). Let Br(k) = H²(G_k, k^{s×}) be the Galois-cohomological Brauer group (the carrier of ClassFieldTheory Layer 5) and H²_et(X, G_m) the cohomological Brauer group of SF.2. There is a natural exact sequence 0 → Pic(X) → Pic_{X/k}(k) →δ Br(k) → H²_et(X, G_m), where Pic_{X/k}(k) = Pic(X_{k^s})^{G_k} and the last map is pullback along X → Spec k. Consequences: (a) if X(k) ≠ ∅ then δ = 0, Pic(X) = Pic_{X/k}(k), and a rational point splits the sequence; (b) for every finite extension k'/k with X(k') ≠ ∅, δ(Pic_{X/k}(k)) lies in the relative Brauer group Br(k'/k) = ker(Br(k) → Br(k')) and is killed by [k':k]; hence δ = 0 if X has rational points over finite extensions of coprime degrees; (c) if Br(k) = 0 (k separably closed, finite, or a C₁ field such as k₀(t) with k₀ algebraically closed) then every k-rational divisor class is represented by an invertible sheaf on X. Over a general Noetherian base the relative version is planned by JacobianChallenge Part II; it specializes to this sequence at S = Spec k.

**Hypotheses.** k is a field; X is proper over k with H⁰(X, O_X) = k (hence O ≅ f_*O_X universally) and X(k^s) ≠ ∅.

**Proof outline.**

1. Leray spectral sequence for f : X → Spec k on the étale sites, E₂^{p,q} = H^p(Spec k_et, R^q f_*G_m) ⇒ H^{p+q}(X_et, G_m), and its exact sequence of low degree (Kleiman, Remark 2.11, sequence (2.11.4)); étale cohomology of Spec k is continuous Galois cohomology of the value at k^s.
2. f_*G_m = G_m because H⁰(X_K, O) = K for all K; H¹(G_k, k^{s×}) = 0 (Hilbert 90); H¹(X_et, G_m) = Pic(X) (SF.3/picard-cohomological).
3. H⁰(Spec k_et, R¹f_*G_m) = Pic_{X/k,et}(k) = Pic(X_{k^s})^{G_k}, equal to the fppf Picard sheaf by SF.3/picard-scheme-without-point(i) (Kleiman, Theorem 2.5).
4. (a): a section σ gives a retraction σ* of Pic(X) → Pic_{X/k}(k) and of Br(k) → H²(X, G_m).
5. (b): naturality under base change k → k' kills δ after restriction; the kernel of restriction to k' is killed by [k':k] (corestriction∘restriction = multiplication by the degree, ClassFieldTheory Layer 5; for central simple algebras Stacks, Brauer Groups, Lemma 0751).
6. (c) is immediate; Tsen's theorem gives Br(k₀(t)) = 0.

**Acceptance.** Conic without rational point over R: Pic(X) = 2Z inside Pic_{X/R}(R) = Z, and δ(1) is the class of the Hamilton quaternions, the generator of Br(R) ≅ Z/2 (Tau Ceti Quaternion.brauerGroupMulEquiv, transported through SF.2/field-comparison). For X with X(k) ≠ ∅, Pic(X) → Pic_{X/k}(k) is an isomorphism. Hyperelliptic curves: SF.3/rational-divisor-classes.

**Prerequisites.** SF.3/picard-cohomological, SF.3/picard-scheme-without-point, SF.2, SF.2/cohomological-brauer, SF.2/field-comparison, ClassFieldTheory (Layer 5), JacobianChallenge (Layer D), `groupCohomology` (Mathlib), `Field.absoluteGaloisGroup` (Mathlib), `TauCeti.Quaternion.brauerGroupMulEquiv` (Tau Ceti), `TauCeti.BrauerGroup.baseChange` (Tau Ceti).

**Sources.** Steven L. Kleiman, *The Picard scheme*: Remark 2.11, pp. 20–21, sequences (2.11.3), (2.11.4) and the Brauer-group paragraph. J. S. Milne, *Abelian Varieties (course notes, v2.00)*: Part III, Remark 1.11, p. 90. Manjul Bhargava, *A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension*: §3, p. 10.

### Rational divisor classes versus rational divisors on hyperelliptic curves (`SF.3/rational-divisor-classes`, theorem)

Let K be a field of characteristic ≠ 2, f(x, y) = f₀x^{2g+2} + … + f_{2g+2}y^{2g+2} a binary form with nonzero discriminant and f₀ ≠ 0, and C : z² = f(x, y) the associated smooth projective hyperelliptic curve of genus g ≥ 1, with K' = K(√f₀). (i) The obstruction δ : Pic_{C/K}(K) → Br(K) of SF.3/picard-brauer-sequence takes values in Br(K'/K), which is 2-torsion and is identified with K^×/N(K'^×) (quaternion algebras split by K'). (ii) If C has a K-rational divisor of odd degree, equivalently a point over an extension of K of odd degree, then every K-rational divisor class is represented by a K-rational divisor: Pic(C) = Pic_{C/K}(K). (iii) If K is a global field and C has a divisor of degree one over every completion K_v, the same conclusion holds.

**Hypotheses.** char K ≠ 2; f is a binary form of degree 2g + 2 with nonzero discriminant and f₀ ≠ 0; g ≥ 1.

**Proof outline.**

1. The two points at infinity of C are rational over K', so (i) follows from SF.3/picard-brauer-sequence(b) with k' = K'.
2. (ii): by (i) δ takes values in a group killed by 2, and by SF.3/picard-brauer-sequence(b) applied to a field over which C has a point of odd degree, also in a group killed by an odd number; hence δ = 0.
3. (iii): by (ii) applied over each K_v, the image of a class in Br(K) restricts to zero at every place; a Brauer class of a global field that is locally trivial everywhere is trivial (Albert–Brauer–Hasse–Noether, ClassFieldTheory Layer 10).

**Acceptance.** If C has a K-rational point, both sides agree for trivial reasons. The degree-two hyperelliptic class d (pullback of O(1) from the line) is always represented by a K-rational divisor.

**Prerequisites.** SF.3/picard-brauer-sequence, ClassFieldTheory (Layer 5), ClassFieldTheory (Layer 10), AlgebraicCurves (Layer 10), `BrauerGroup` (Mathlib), `TauCeti.BrauerGroup.baseChange` (Tau Ceti).

**Sources.** Manjul Bhargava, *A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension*: §3, Proposition 21 and the preceding paragraph, p. 10; the generalized-Jacobian reformulation, p. 11.

### Degree-zero divisor classes, line bundles and rational points of the Jacobian (`SF.3/degree-zero-class-comparison`, comparison)

Let k be a field and X a smooth projective geometrically connected curve over k with function field F = k(X). The following maps are defined and compatible with addition and degree: Cl⁰(F) (Tau Ceti's kernel of the degree on the function-field class group) ≅ the weighted-degree-zero subgroup of the class group of scheme Weil divisors of X (Tau Ceti's OrderSystem.picZero for OrderSystem.ofScheme X, via AlgebraicCurves Layer 12D) ≅ Pic⁰(X), the classes of invertible sheaves of degree 0 (Tau Ceti's injective classGroupToLineBundleClass together with JacobianChallenge Layer A's surjectivity and degree comparison) ↪ Pic⁰_{X/k}(k) (SF.3/picard-scheme-without-point). The last map is bijective if X(k) ≠ ∅, and in general its cokernel embeds in Br(k) through δ (SF.3/picard-brauer-sequence). On all of Pic, the degree maps Pic(X) onto IZ and Pic_{X/k}(k) onto PZ, where I (the index) is the gcd of degrees of closed points and P (the period) divides I; I divides 2g − 2.

**Hypotheses.** k is a field; X is smooth, projective and geometrically connected over k.

**Proof outline.**

1. AlgebraicCurves Layer 12D identifies Weil divisors on X with divisors of F, matching principal divisors and degrees, so the two class groups of degree zero agree.
2. On a regular curve Tau Ceti's classGroupToLineBundleClass is an injective homomorphism D ↦ O_X(D); JacobianChallenge Layer A proves it surjective and deg O_X(D) = Σ n_x[κ(x):k] (equal to Tau Ceti's relativeDegree).
3. Pic(X) → Pic_{X/k}(k) is injective with cokernel in Br(k) by SF.3/picard-brauer-sequence, and bijective with a rational point.
4. The canonical divisor of a rational differential is a k-rational divisor of degree 2g − 2, so I divides 2g − 2; a k-rational divisor gives a k-rational class, so P divides I.

**Acceptance.** Degree-zero check of SF.3: for an elliptic curve E over k with origin O, Tau Ceti's Cl⁰(k(E)) ≅ E(k) (degreeOneEquivDegreeZeroClassGroup) agrees with E(k) ≅ Pic⁰_{E/k}(k). For a conic without rational point, Pic⁰(X) = 0 = Pic⁰_{X/k}(k), while Pic(X) = 2Z ⊊ Pic_{X/k}(k) = Z.

**Prerequisites.** SF.3/picard-scheme-without-point, SF.3/picard-brauer-sequence, JacobianChallenge (Layer A), AlgebraicCurves (Layer 12), `TauCeti.Divisor.degreeClass` (Tau Ceti), `TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.picZero` (Tau Ceti), `TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ofScheme` (Tau Ceti), `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.classGroupToLineBundleClassHom` (Tau Ceti), `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.relativeDegree` (Tau Ceti), `TauCeti.Place.degreeOneEquivDegreeZeroClassGroup` (Tau Ceti).

**Sources.** Tau Ceti roadmap contributors, *Roadmap: algebraic curves — function fields, divisors, and Riemann–Roch*: Layer 3 (Cl and Cl⁰) and Layer 12D (divisors and degrees compared). Tau Ceti roadmap contributors, *Roadmap: the Jacobian challenge (Christian Merten's AG version)*: Layer A, items 'Divisors on a curve' and 'Degree'. J. S. Milne, *Abelian Varieties (course notes, v2.00)*: Part III, Theorem 1.6 and Remark 1.11, pp. 88–90.

### The Picard stack of a curve and its degree components (`SF.3/picard-stack-curve`, construction)

Let k be a field and X a proper k-scheme with H⁰(X, O_X) = k (holding universally after base change). The Picard stack 𝒫ic_{X/k} is the stack in groupoids on (Sch/k)_fppf whose groupoid over T is the Picard groupoid 𝒫ic(X_T) of SF.3/picard-groupoid, with pullback along T' → T. Every object has automorphism group G_m(T) = Γ(T, O_T)^×, and the map to isomorphism classes, sheafified, is a morphism 𝒫ic_{X/k} → Pic_{X/k} which is a G_m-gerbe. For X a smooth projective geometrically connected curve of genus g, 𝒫ic_{X/k} = ⊔_{d∈Z} 𝒫ic^d_{X/k} by the degree on geometric fibres, each 𝒫ic^d_{X/k} is a smooth algebraic stack of dimension g − 1 over k, a G_m-gerbe over the torsor Pic^d_{X/k} (SF.3/picard-scheme-without-point), and it is isomorphic to Pic^d_{X/k} × BG_m when X(k) ≠ ∅. Tensor product makes 𝒫ic_{X/k} a stack of Picard groupoids, graded by degree.

**Hypotheses.** k is a field; X is proper over k with H⁰(X_K, O) = K for all K/k; for the algebraic-stack statements X is a smooth projective geometrically connected curve.

**Proof outline.**

1. The prestack T ↦ 𝒫ic(X_T) is a stack because invertible sheaves and their isomorphisms satisfy fppf descent (SF.3/picard-groupoid(c); SF.1).
2. Automorphisms of an invertible sheaf on X_T are units of Γ(X_T, O) = Γ(T, O_T).
3. Locally on Pic_{X/k} the universal class lifts to a sheaf, and any two lifts differ by an invertible sheaf from T, which gives the gerbe structure; a rational point gives rigidified lifts, hence a section and the splitting with BG_m (Kleiman, Theorem 2.5 and Definition 2.8).
4. Degree is locally constant in flat families, giving the decomposition; dimension g − 1 = dim Pic^d − dim G_m.

**Declarations and API** (suggested module `TauCeti/AlgebraicGeometry/Picard/Stack`).

| name | role | statement |
|---|---|---|
| `TauCeti.AlgebraicGeometry.Picard.picardStack` | constructor | The stack T ↦ 𝒫ic(X_T) on (Sch/k)_fppf. |
| `TauCeti.AlgebraicGeometry.Picard.picardStack.degreeComponent` | projection | The open and closed substack 𝒫ic^d of sheaves of degree d on every geometric fibre. |
| `TauCeti.AlgebraicGeometry.Picard.picardStack.aut_eq_units` | characterisation | Every object over T has automorphism group Γ(T, O_T)^×. |
| `TauCeti.AlgebraicGeometry.Picard.picardStack.toPicardSheaf` | projection | The morphism to the Picard sheaf Pic_{X/k} induced by isomorphism classes. |
| `TauCeti.AlgebraicGeometry.Picard.picardStack.isGerbe` | other | 𝒫ic_{X/k} → Pic_{X/k} is a G_m-gerbe. |
| `TauCeti.AlgebraicGeometry.Picard.picardStack.split_of_point` | equivalence | A rational point x₀ gives 𝒫ic^d ≅ Pic^d × BG_m through rigidification along x₀. |
| `TauCeti.AlgebraicGeometry.Picard.picardStack.tensor` | structure | Tensor product 𝒫ic^d × 𝒫ic^e → 𝒫ic^{d+e} making the stack a graded stack of Picard groupoids. |
| `TauCeti.AlgebraicGeometry.Picard.picardStack.baseChange` | functoriality | For K/k, 𝒫ic_{X_K/K} is the restriction of 𝒫ic_{X/k} to K-schemes. |

**Unit tests.**

- `TauCeti.AlgebraicGeometry.Picard.picardStack_projectiveLine` (computation): For X = P¹_k and every d, 𝒫ic^d_{X/k} ≅ BG_m.
- `TauCeti.AlgebraicGeometry.Picard.picardStack_field` (degenerate): Over T = Spec k, objects of 𝒫ic^d are invertible sheaves of degree d on X and morphisms their isomorphisms.
- `TauCeti.AlgebraicGeometry.Picard.picardStack_aut` (characterisation): Every object of 𝒫ic^d over Spec k has automorphism group k^×.
- `TauCeti.AlgebraicGeometry.Picard.picardStack_not_scheme` (non-example): 𝒫ic^d_{X/k} is not equivalent to the Picard scheme Pic^d_{X/k} (nor to any algebraic space): its objects have nontrivial automorphism groups G_m.

**Uses.** FunctionFieldArithmeticPartII:GC.0/root-picard: ordinary line-bundle Picard stacks in every integer degree underlie the graded root Picard stack; Yun–Zhang 2017, §§3.2, 5.2 and 6.1: Pic_X acts on moduli of sections and shtukas; quotients by the Picard stack; exact sequences of Picard stacks for a double cover; Yun–Zhang 2019 (routed to SF.3, item /8): Pic^d as a torsor and not a chosen Pic⁰; SchemeAndStackFoundations:SF.3/universal-section-stack: base of the stack of pairs (L, s).

**Acceptance.** For X = P¹_k, 𝒫ic^d ≅ BG_m for every d. Objects of 𝒫ic^d over Spec k are invertible sheaves of degree d on X with their isomorphisms.

**Prerequisites.** SF.3/picard-groupoid, SF.3/picard-scheme-without-point, SF.1, JacobianChallenge (Layer D), `CategoryTheory.Core` (Mathlib).

**Sources.** Zhiwei Yun, *Shtukas and the Taylor expansion of L-functions*: §3.2.1, p. 16. Steven L. Kleiman, *The Picard scheme*: Definitions 2.1, 2.2 and 2.8, Lemma 2.9, pp. 16–19. Tau Ceti roadmap contributors, *Roadmap: the Jacobian challenge (Christian Merten's AG version)*: Layer D, 'Keep the three notions distinct (Picard stack vs functor/sheaf vs rigidified functor)'.

## SF.3d. Abel maps and Jacobian comparisons

These targets relate symmetric powers, line bundles with sections and Picard stacks, compute the effect of norms, and compare the Jacobian with the curve on 1-forms and on degree-one étale cohomology.

### The stack of line bundles with a section over the Picard stack (`SF.3/universal-section-stack`, construction)

Let k be a field, X a smooth projective geometrically connected curve over k of genus g, and d ∈ Z. The stack X̂_d over 𝒫ic^d_{X/k} classifies pairs (L, s) with L an invertible sheaf on X_T of degree d on every geometric fibre and s ∈ H⁰(X_T, L). (i) If d < 0 then s = 0 and X̂_d = 𝒫ic^d. (ii) If d ≥ 0, the open substack where s is nonzero on every geometric fibre is isomorphic to the symmetric power X^(d) (JacobianChallenge Layer C's Hilbert scheme of relative effective Cartier divisors of degree d) via (L, s) ↦ the zero scheme of s, and its closed complement is the zero section 𝒫ic^d. (iii) If d ≥ 2g − 1, X̂_d → 𝒫ic^d is the total space of a vector bundle of rank d − g + 1 (the pushforward of the universal sheaf), so X^(d) → 𝒫ic^d is smooth of relative dimension d − g + 1. (iv) Addition (L₁, s₁), (L₂, s₂) ↦ (L₁ ⊗ L₂, s₁ ⊗ s₂) defines X̂_{d₁} × X̂_{d₂} → X̂_{d₁+d₂}, restricting to addition of effective divisors on symmetric powers.

**Hypotheses.** k is a field; X is smooth, projective and geometrically connected over k, of genus g; d ∈ Z.

**Proof outline.**

1. (i) A nonzero section of a negative-degree invertible sheaf on a geometric fibre would give an effective divisor of negative degree.
2. (ii) A section nonzero on fibres has zero scheme a relative effective Cartier divisor of degree d (Stacks, Picard Schemes of Curves, Lemma 0B9D), giving X^(d); conversely D ↦ (O(D), 1_D).
3. (iii) For d ≥ 2g − 1, fibrewise H¹ vanishes (SF.3/line-bundle-degree-bounds), so the pushforward of the universal sheaf is locally free of rank d + 1 − g and commutes with base change (JacobianChallenge Layer C); X̂_d is its total space.
4. (iv) Tensor product of sections; on nonvanishing loci it is the sum of divisors (Stacks, Proposition 0B9I(3)).

**Declarations and API** (suggested module `TauCeti/AlgebraicGeometry/Picard/SectionStack`).

| name | role | statement |
|---|---|---|
| `TauCeti.AlgebraicGeometry.Picard.sectionStack` | constructor | X̂_d, the stack of pairs (L, s) over 𝒫ic^d_{X/k}. |
| `TauCeti.AlgebraicGeometry.Picard.sectionStack.forget` | projection | The forgetful morphism X̂_d → 𝒫ic^d. |
| `TauCeti.AlgebraicGeometry.Picard.sectionStack.zeroSection` | data | The zero section 𝒫ic^d → X̂_d, a closed immersion. |
| `TauCeti.AlgebraicGeometry.Picard.sectionStack.eq_of_neg` | characterisation | For d < 0 the zero section is an isomorphism. |
| `TauCeti.AlgebraicGeometry.Picard.sectionStack.symmetricPowerEquiv` | equivalence | For d ≥ 0 the nonvanishing locus is isomorphic to X^(d) via the zero scheme of the section. |
| `TauCeti.AlgebraicGeometry.Picard.sectionStack.isVectorBundle` | other | For d ≥ 2g − 1, X̂_d → 𝒫ic^d is a vector bundle of rank d − g + 1. |
| `TauCeti.AlgebraicGeometry.Picard.sectionStack.add` | structure | The addition morphism X̂_{d₁} × X̂_{d₂} → X̂_{d₁+d₂}, associative and commutative. |
| `TauCeti.AlgebraicGeometry.Picard.sectionStack.add_symmetricPower` | compatibility | On nonvanishing loci, addition is the sum of effective divisors X^(d₁) × X^(d₂) → X^(d₁+d₂). |

**Unit tests.**

- `TauCeti.AlgebraicGeometry.Picard.sectionStack_negative` (degenerate): For d < 0, X̂_d ≅ 𝒫ic^d_{X/k}.
- `TauCeti.AlgebraicGeometry.Picard.sectionStack_projectiveLine` (computation): For X = P¹_k and d ≥ 0, X̂_d ≅ [A^{d+1}/G_m] with weights one, and its nonvanishing locus is P^d.
- `TauCeti.AlgebraicGeometry.Picard.sectionStack_rank` (characterisation): For d ≥ 2g − 1 the fibre of X̂_d over a geometric point [L] is H⁰(L), of dimension d − g + 1.
- `TauCeti.AlgebraicGeometry.Picard.sectionStack_not_bundle` (non-example): For a curve of genus g ≥ 1 and d = 2g − 2, the fibre dimension is g at [ω] and g − 1 at a general point, so X̂_{2g−2} → 𝒫ic^{2g−2} is not a vector bundle: the bound d ≥ 2g − 1 is sharp.

**Uses.** Yun–Zhang 2017, Proposition 3.1 and §6.1: smoothness of moduli built from X̂_d and of X'_d over Pic for large degree; FunctionFieldArithmeticPartII:GC.1/root-symmetric-space and GC.4/evaluation-surjective: hat spaces of sections and the vector bundles π_*L of rank d − g + 1 commuting with base change; SchemeAndStackFoundations:SF.3/abel-maps-high-degree: fibres of the Abel maps and the projective-bundle description.

**Acceptance.** For X = P¹_k and d ≥ 0, X̂_d ≅ [A^{d+1}/G_m] over BG_m, and the nonzero locus is P^d = Sym^d P¹. Genus one, d = 1: rank 1, and X^(1) = X → 𝒫ic¹ followed by the coarse map is the isomorphism X ≅ Pic¹ of SF.3/genus-one-curves.

**Prerequisites.** SF.3/picard-stack-curve, SF.3/line-bundle-degree-bounds, JacobianChallenge (Layer C), SF.3/picard-scheme-without-point.

**Sources.** Zhiwei Yun, *Shtukas and the Taylor expansion of L-functions*: §3.2.1, p. 16; proof of Proposition 3.1(2), p. 18. The Stacks Project Authors, *The Stacks Project*: Picard Schemes of Curves (tag 0B92), Section 3 (tag 0B9C): Lemma 0B9D, Proposition 0B9I, Remark 0B9J.

### Abel maps from symmetric powers: fibres, surjectivity and projective bundles (`SF.3/abel-maps-high-degree`, theorem) — planet: *Abel maps of symmetric powers*

Let k be a field and X a smooth projective geometrically connected curve over k of genus g, d ≥ 0, and γ_d : X^(d) → Pic^d_{X/k}, D ↦ O_X(D), the Abel map, defined without a base point from the universal divisor. (i) The fibre of γ_d over a K-point of Pic^d_{X/k} represented by an invertible sheaf L on X_K is the complete linear system |L| ≅ P(H⁰(X_K, L)); in general the fibre over a K-point c is a Brauer–Severi variety of class δ(c) (SF.3/picard-brauer-sequence) which becomes |L| over K^s. (ii) γ_d is surjective for d ≥ g, and γ_g is birational. (iii) For d ≥ 2g − 1, γ_d is smooth and projective and every geometric fibre is a projective space of dimension d − g; when a Poincaré sheaf exists on X × Pic^d_{X/k} (for instance if X(k) ≠ ∅), γ_d is the projectivization of a vector bundle of rank d − g + 1. (iv) γ_1 = a₁ : X → Pic¹_{X/k} is a closed immersion if g ≥ 1, and an isomorphism if g = 1. (v) γ_2 is injective on geometric points if and only if X has no linear system of degree two and dimension one, i.e. g ≥ 3 and X is not hyperelliptic.

**Hypotheses.** k is a field; X is smooth, projective and geometrically connected over k, of genus g; d ≥ 0.

**Proof outline.**

1. (i) Two effective divisors have the same image exactly when they are linearly equivalent; the fibre is the nonvanishing locus of X̂_d over [L] modulo scalars (SF.3/universal-section-stack).
2. (ii) Riemann–Roch gives h⁰(L) ≥ d + 1 − g ≥ 1 for d ≥ g; for d = g a general fibre is a point (Milne, Abelian Varieties, Part III, Theorem 5.1 and Lemma 5.2; Stacks, Lemma 0BA0).
3. (iii) For d ≥ 2g − 1 the vector bundle structure of SF.3/universal-section-stack(iii) shows that X^(d) is the projectivization over 𝒫ic^d, hence smooth with fibres P^{d−g}; with a Poincaré sheaf the gerbe splits and the projectivization descends to Pic^d.
4. (iv) Over k^s with a point, γ₁ is a translate of the Abel–Jacobi morphism of JacobianChallenge Layer F, a closed immersion for g ≥ 1; for g = 1 see SF.3/genus-one-curves.
5. (v) Injectivity on geometric points fails exactly when two distinct effective degree-two divisors are linearly equivalent.

**Acceptance.** Genus 0: γ_d : P^d = Sym^d P¹ → Pic^d_{P¹/k} = Spec k; for a pointless real conic X, γ₁ : X → Pic¹_{X/R} = Spec R has fibre X, a nontrivial Brauer–Severi curve. Genus 2: γ₂ contracts the hyperelliptic linear system, a P¹, to the point [ω] and is an isomorphism elsewhere. The fibre over [L] for d ≥ 2g − 1 has dimension d − g, matching smoothness of relative dimension d − g + 1 over the Picard stack.

**Prerequisites.** SF.3/universal-section-stack, SF.3/picard-scheme-without-point, SF.3/line-bundle-degree-bounds, SF.3/vector-bundle-riemann-roch, JacobianChallenge (Layer C), JacobianChallenge (Layer F).

**Sources.** The Stacks Project Authors, *The Stacks Project*: Picard Schemes of Curves (tag 0B92), Section 6 (tag 0B9R): Lemma 0BA0. J. S. Milne, *Abelian Varieties (course notes, v2.00)*: Part III, §5: Theorem 5.1, Lemma 5.2, pp. 101–102. Zhiwei Yun, *Shtukas and the Taylor expansion of L-functions*: Proof of Proposition 3.1(2), p. 18.

### Norms on Picard schemes and stacks, and the double-cover exact sequence (`SF.3/picard-norm-sequence`, theorem)

(i) Let π : X' → X be a finite flat morphism of degree n between smooth projective geometrically connected curves over a field k. The norm of SF.3/line-bundle-norm, formed in families, defines a morphism of Picard stacks Nm : 𝒫ic_{X'/k} → 𝒫ic_{X/k} preserving the degree, hence morphisms of Picard schemes Nm : Pic^d_{X'/k} → Pic^d_{X/k}, with Nm ∘ π* = [n] and, for π Galois with group Γ, π* ∘ Nm = Σ_{σ∈Γ} σ*; on symmetric powers it is the pushforward of effective divisors X'^(d) → X^(d). (ii) If char k ≠ 2 and π is a finite étale double cover with involution σ, the exact sequence of étale sheaves 1 → O_X^× → π_*O_{X'}^× →(1−σ) π_*O_{X'}^× →Nm O_X^× → 1 induces an exact sequence of Picard stacks 1 → 𝒫ic_{X'}/𝒫ic_X →(1−σ) 𝒫ic⁰_{X'} →Nm 𝒫ic⁰_X → 1, so the Prym kernel ker(Nm : Pic⁰_{X'/k} → Pic⁰_{X/k}) is the image of 1 − σ, of dimension g − 1, where g' = 2g − 1 by Riemann–Hurwitz.

**Hypotheses.** k is a field; X, X' smooth projective geometrically connected curves; π finite flat of degree n; in (ii) char k ≠ 2 and π étale of degree two.

**Proof outline.**

1. The norm commutes with base change (SF.3/line-bundle-norm), so it is defined on families of invertible sheaves and on isomorphisms, giving a morphism of stacks, and on the sheafified Picard functors.
2. Degree is preserved because Norm(O(D)) = O(π_*D) and π_* preserves degree; Norm(π*N) = N^{⊗n}.
3. For π Galois, π*Norm(L) ≅ ⊗_σ σ*L by comparing transition functions.
4. (ii) Exactness of the sheaf sequence is Hilbert 90 for the double cover locally in the étale topology; the induced sequence of Picard stacks is Yun–Zhang 2017 §6.1; g' = 2g − 1 is SF.3/scheme-riemann-hurwitz for an étale double cover.

**Acceptance.** Genus-two base, unramified double cover of genus three: the Prym kernel has dimension one. For the identity morphism, Nm is the identity of 𝒫ic_{X/k}.

**Prerequisites.** SF.3/line-bundle-norm, SF.3/picard-stack-curve, SF.3/picard-scheme-without-point, SF.3/scheme-riemann-hurwitz, SF.3/picard-cohomological, JacobianChallenge (Layer C).

**Sources.** Zhiwei Yun, *Shtukas and the Taylor expansion of L-functions*: §6.1, proof of Proposition 6.1(1), p. 40. The Stacks Project Authors, *The Stacks Project*: Divisors (tag 01WO), Section 18 'Norms' (tag 0BCX): Lemmas 0BCY, 0BD2.

### Invariant differentials of a group scheme and global 1-forms on an abelian variety (`SF.3/invariant-differentials`, lemma)

Let G → S be a group scheme with identity section e, and ω_G := e*Ω¹_{G/S}. There is a canonical isomorphism Ω¹_{G/S} ≅ f*ω_G given by translation-invariant forms; over a field k, Ω¹_{G/k} is a free O_G-module and ω_G is the cotangent space at the identity, the k-dual of the Zariski tangent space. For an abelian variety A over k (Tau Ceti's AbelianVariety, proper and geometrically integral, so Γ(A, O_A) = k), evaluation at the identity is an isomorphism Γ(A, Ω¹_{A/k}) ≅ ω_A = T₀(A)^∨, where T₀(A) is Tau Ceti's AbelianVariety.TangentSpace; every global 1-form on A is translation invariant.

**Hypotheses.** G → S is a group scheme; for the abelian-variety statement S = Spec k and A is an abelian variety over k.

**Proof outline.**

1. The shear isomorphism G ×_S G → G ×_S G, (x, y) ↦ (x, xy), identifies the pullback of Ω¹ along the multiplication with the pullback along the second projection; restricting along e gives Ω¹_{G/S} ≅ f*e*Ω¹_{G/S} (Stacks, Groupoid Schemes, Lemma 047I).
2. Over a field, f*ω_G is free of rank dim_k ω_G.
3. For A proper and geometrically integral, Γ(A, O_A) = k, so Γ(A, Ω¹) = Γ(A, O_A) ⊗ ω_A = ω_A, which is the dual of the tangent space at the identity (Tau Ceti's TangentSpace is the k-dual of m/m² at the identity).

**Acceptance.** For the elliptic curve E, Γ(E, Ω¹) is spanned by the invariant differential and has dimension one. For A = E × E', Γ(A, Ω¹) is two-dimensional, spanned by the pullbacks of the invariant differentials.

**Prerequisites.** `TauCeti.AlgebraicGeometry.AbelianVariety` (Tau Ceti), `TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace` (Tau Ceti), `KaehlerDifferential` (Mathlib), StableReduction (Layer 1).

**Sources.** The Stacks Project Authors, *The Stacks Project*: Groupoid Schemes (tag 022L), Section 6 'Properties of group schemes' (tag 045W): Lemma 047I. J. S. Milne, *Abelian Varieties (course notes, v2.00)*: Part III, proof of Proposition 2.2, p. 91.

### Pullback of 1-forms along the Abel–Jacobi map (`SF.3/abel-jacobi-differentials`, theorem)

Let k be a field, X a smooth projective geometrically connected curve over k of genus g ≥ 1, O ∈ X(k), J the Jacobian of JacobianChallenge Layers D–E, and ι_O : X → J, P ↦ [O(P − O)], the Abel–Jacobi morphism of JacobianChallenge Layer F. Then ι_O^* : Γ(J, Ω¹_{J/k}) → Γ(X, Ω¹_{X/k}) is an isomorphism of g-dimensional k-vector spaces, independent of O. It is the composite of Γ(J, Ω¹) ≅ T₀(J)^∨ (SF.3/invariant-differentials), the dual of JacobianChallenge's T₀(J) ≅ H¹(X, O_X), and Serre duality H¹(X, O_X)^∨ ≅ Γ(X, Ω¹_{X/k}) (SF.3/curve-serre-duality).

**Hypotheses.** k is a field; X is smooth, projective and geometrically connected over k with g ≥ 1 and a rational point O.

**Proof outline.**

1. Γ(J, Ω¹) ≅ T₀(J)^∨ by SF.3/invariant-differentials; T₀(J) ≅ H¹(X, O_X) by JacobianChallenge Layer E; H¹(X, O_X)^∨ ≅ Γ(X, Ω¹) by SF.3/curve-serre-duality(ii) with E = O_X.
2. Commutativity of the square relating ι_O^* with these identifications is checked on tangent vectors: the differential of ι_O at O is dual to the composite, as in Milne, Abelian Varieties, Part III, Propositions 2.1 and 2.2.
3. Independence of O: ι_{O'} = t_{[O(O − O')]} ∘ ι_O, and translation fixes invariant forms.

**Acceptance.** Genus one: for an elliptic curve with origin O, ι_O is an isomorphism and ι_O^* is the identity on the invariant differential. Dimension count: both sides have dimension g by SF.3/curve-serre-duality(iv) and JacobianChallenge Layer E.

**Prerequisites.** SF.3/invariant-differentials, SF.3/curve-serre-duality, JacobianChallenge (Layer E), JacobianChallenge (Layer F).

**Sources.** J. S. Milne, *Abelian Varieties (course notes, v2.00)*: Part III, §2: Propositions 2.1 and 2.2, p. 91.

### The Tate module of the Jacobian and degree-one étale cohomology of the curve (`SF.3/tate-module-etale-h1`, theorem) — planet: *Tate module and étale H¹ of a curve*

Let k be a field with separable closure k^s and G_k = Gal(k^s/k), X a smooth projective geometrically connected curve over k of genus g, J := Pic⁰_{X/k} (SF.3/picard-scheme-without-point; the Jacobian of JacobianChallenge Layers D–E when X(k) ≠ ∅), and ℓ a prime invertible in k. Pinned conventions: T_ℓ J := lim_n J[ℓ^n](k^s) is the Tate module of CohomologicalPointCounting/TraceFormula Layer 8; Z_ℓ(1) := lim_n μ_{ℓ^n}(k^s); H¹(X_{k^s}, Z_ℓ(i)) := lim_n H¹_et(X_{k^s}, μ_{ℓ^n}^{⊗i}). Then: (i) Kummer theory gives canonical G_k-equivariant isomorphisms H¹_et(X_{k^s}, μ_{ℓ^n}) ≅ Pic(X_{k^s})[ℓ^n] = J[ℓ^n](k^s), compatible with the transition maps (the ℓ-th power on μ and multiplication by ℓ on J), hence T_ℓ J ≅ H¹(X_{k^s}, Z_ℓ(1)), a free Z_ℓ-module of rank 2g; (ii) dually, H¹(X_{k^s}, Z_ℓ) ≅ Hom_{Z_ℓ}(T_ℓ J, Z_ℓ), G_k-equivariantly; this is the limit over n of the finite-level comparison between H¹_et(X_{k^s}, Z/ℓ^n) and the dual of J[ℓ^n] of TraceFormula Layer 8, and it agrees with the pullback isomorphism along an Abel–Jacobi map H¹(J_{k^s}, Z_ℓ) ≅ H¹(X_{k^s}, Z_ℓ) together with H¹(J_{k^s}, Z_ℓ) = Hom(T_ℓ J, Z_ℓ); (iii) under the comparison of CohomologicalPointCounting/EllAdicRealization, H¹(X_{k^s}, Z_ℓ) is Mathlib's pro-étale ℓ-adic cohomology EllAdicCohomology of X_{k^s} in degree one; (iv) the identifications commute with extension of k and with pullback along finite morphisms of curves (pullback on H¹ corresponding to pullback of line bundles); after ⊗ Q_ℓ, H¹(X_{k^s}, Q_ℓ) ≅ Hom(V_ℓ J, Q_ℓ) has dimension 2g.

**Hypotheses.** k is a field; X is smooth, projective and geometrically connected over k of genus g; ℓ is a prime different from the characteristic of k.

**Proof outline.**

1. Kummer sequence 0 → μ_{ℓ^n} → G_m → G_m → 0, exact on the étale site of X_{k^s} because ℓ is invertible (Stacks, Étale Cohomology, Lemma 03PL; CohomologicalPointCounting/ConstructibleEtale Layer 6).
2. Its long exact sequence, with H⁰(X_{k^s}, G_m) = k^{s×} being ℓ^n-divisible and H¹(X_{k^s}, G_m) = Pic(X_{k^s}) (SF.3/picard-cohomological), gives H¹(X_{k^s}, μ_{ℓ^n}) ≅ Pic(X_{k^s})[ℓ^n] (Stacks, Étale Cohomology, Lemma 03RQ for algebraically closed fields; the same argument applies over k^s).
3. Degree is torsion-free on Pic, so Pic[ℓ^n] = Pic⁰[ℓ^n] = J[ℓ^n](k^s) (SF.3/picard-scheme-without-point), of order ℓ^{2ng} (JacobianChallenge Layer E; Stacks, Algebraic Curves, Lemma 0C1Z).
4. G_k-equivariance: all maps are induced by morphisms of sheaves on the big étale site of k and commute with the Galois action on k^s.
5. Limit over n gives (i); (ii) is the limit of TraceFormula Layer 8's finite-level comparison, and Milne's argument through the abelianized fundamental group (Part III, Lemma 9.2 and Corollary 9.6) shows the agreement with Abel–Jacobi pullback; (iii) is the EllAdicRealization comparison applied to X_{k^s}.

**Acceptance.** Genus 0: both sides vanish. Genus 1: for an elliptic curve E, T_ℓ E ≅ H¹(E_{k^s}, Z_ℓ(1)), and the dual statement is compatible with the Weil pairing on E[ℓ^n]. Over a finite field F_q, the trace of geometric Frobenius on H¹(X_{k^s}, Q_ℓ) equals q + 1 − #X(F_q), matching the trace of Frobenius on V_ℓ J (TraceFormula Layer 15).

**Prerequisites.** SF.3/picard-scheme-without-point, SF.3/picard-cohomological, JacobianChallenge (Layer E), SF.2, `AlgebraicGeometry.Scheme.EllAdicCohomology` (Mathlib), `PadicInt` (Mathlib), `rootsOfUnity` (Mathlib), `Field.absoluteGaloisGroup` (Mathlib), `TauCeti.AlgebraicGeometry.AbelianVariety.mulBy` (Tau Ceti).
 Upstream (pull request 196): UPSTREAM:CohomologicalPointCounting:TraceFormula:8, UPSTREAM:CohomologicalPointCounting:ConstructibleEtale:6, UPSTREAM:CohomologicalPointCounting:ConstructibleEtale:7-9, UPSTREAM:CohomologicalPointCounting:EllAdicRealization:0-10.

**Sources.** The Stacks Project Authors, *The Stacks Project*: Étale Cohomology (tag 03N1): Lemma 03PL (Kummer sequence), Theorem 03P8, Lemma 03RQ; Algebraic Curves (tag 0BRV): Lemma 0C1Z. J. S. Milne, *Abelian Varieties (course notes, v2.00)*: Part III, §9: Lemma 9.2, Corollary 9.6, pp. 114–115. Tau Ceti roadmap contributors, *Roadmap: Grothendieck–Lefschetz and cohomological L-functions (CohomologicalPointCounting/TraceFormula, TauCetiRoadmap PR 196)*: Layer 8 'Weil's trace theorem for smooth projective curves', and the boundary paragraph naming JacobianChallenge.

## Acceptance tests of the layer

- **Genus zero.** `SF.3/projective-line-characterization`: P¹_k is the only genus-zero proper curve with a degree-one line bundle; the real conic without points is the non-example; Pic⁰ of P¹ is trivial.
- **Genus one.** `SF.3/genus-one-curves`: a degree-one line bundle gives a rational point, X ≅ Pic¹_{X/k}, and with an origin X ≅ Pic⁰_{X/k}, matching JacobianChallenge's Jac(E, O) ≅ E and Tau Ceti's degree-one-places bijection; the cubic x³ + 2y³ + 4z³ = 0 over Q is the pointless example.
- **Extension of scalars.** `SF.3/genus-base-change`: the scheme genus is invariant under every field extension, while the function-field genus of an inseparable constant extension can drop (y² = x^p − t over F_p(t)); `SF.3/picard-scheme-without-point`: Picard schemes and Jacobians commute with field extension; degrees of vector bundles are invariant (`SF.3/vector-bundle-degree`).
- **Degree zero.** `SF.3/degree-zero-class-comparison`: the function-field Cl⁰, the scheme Weil-divisor Pic⁰ of Tau Ceti and the degree-zero line bundles agree and embed in Jac(X)(k), bijectively with a rational point, with cokernel in Br(k).
- **Tate module.** `SF.3/tate-module-etale-h1`: T_ℓ J ≅ H¹(X_{k^s}, Z_ℓ(1)) by Kummer theory, and H¹(X_{k^s}, Z_ℓ) ≅ Hom(T_ℓ J, Z_ℓ), Galois-equivariantly, compatible with TraceFormula Layer 8 at finite level and with Mathlib's pro-étale ℓ-adic cohomology.

## Dependencies on other roadmaps

- **JacobianChallenge (Layer A).** Invertible sheaves on schemes with duals, so that Pic(X) is a group (Tau Ceti's LineBundleClass with inverses); deg L = χ(L) − χ(O_X) for proper curves; surjectivity of D ↦ O_X(D) and degree agreement Σ n_x[κ(x):k] on smooth curves. Used by: SF.3/picard-cohomological, SF.3/class-group-picard-locally-factorial, SF.3/picard-groupoid, SF.3/line-bundle-norm, SF.3/vector-bundle-degree, SF.3/projective-line-characterization, SF.3/picard-scheme-without-point, SF.3/degree-zero-class-comparison.
- **JacobianChallenge (Layer B).** Coherent cohomology of proper curves over k: finite dimensionality, vanishing above degree one, affine acyclicity; genus g = dim H¹(X, O_X); χ(L) = deg L + 1 − g; line-bundle Serre duality with ω_{X/k} and deg ω = 2g − 2. Used by: SF.3/genus-base-change, SF.3/scheme-riemann-hurwitz, SF.3/projective-line-characterization, SF.3/line-bundle-degree-bounds, SF.3/vector-bundle-degree, SF.3/vector-bundle-riemann-roch, SF.3/curve-serre-duality.
- **JacobianChallenge (Layer C).** Flat base change for coherent cohomology; cohomology and base change in relative dimension one (fibrewise H¹ = 0 gives locally free pushforward commuting with base change); the symmetric powers X^(d) = Hilb^d as smooth projective schemes representing relative effective Cartier divisors of degree d. Used by: SF.3/genus-base-change, SF.3/line-bundle-degree-bounds, SF.3/universal-section-stack, SF.3/abel-maps-high-degree, SF.3/picard-norm-sequence.
- **JacobianChallenge (Layer D).** The Picard sheaf of a smooth projective geometrically connected curve over k as fppf sheafification, its rigidification along a rational point, representability and projectivity of Pic⁰ with a rational point, and the open-closed degree decomposition. Used by: SF.3/picard-scheme-without-point, SF.3/picard-brauer-sequence, SF.3/picard-stack-curve.
- **JacobianChallenge (Layer E).** The Jacobian as an abelian variety of dimension g with T₀(J) ≅ H¹(X, O_X); multiplication by ℓ prime to the characteristic finite étale of degree ℓ^{2g} with geometric kernel (Z/ℓ)^{2g}. Used by: SF.3/picard-scheme-without-point, SF.3/abel-jacobi-differentials, SF.3/tate-module-etale-h1.
- **JacobianChallenge (Layer F).** The Abel–Jacobi morphism ι_O : X → J with O ↦ 0, its universal property, closed immersion for g ≥ 1, and base change. Used by: SF.3/genus-one-curves, SF.3/abel-maps-high-degree, SF.3/abel-jacobi-differentials.
- **AlgebraicCurves (Layer 7).** The Hurwitz genus formula and the different divisor of a finite separable extension of function fields, with the tame/wild distinction. Used by: SF.3/scheme-riemann-hurwitz.
- **AlgebraicCurves (Layer 8).** Constant-field extensions: genus invariance with its separability hypotheses and the inseparable genus-drop example. Used by: SF.3/genus-base-change.
- **AlgebraicCurves (Layer 10).** The hyperelliptic model class z² = f(x, y) with its genus formula and points at infinity. Used by: SF.3/rational-divisor-classes.
- **AlgebraicCurves (Layer 12).** The dictionary between function fields and regular projective curves (12A–12C: normalization of P¹ in F, points = places, anti-equivalence), divisor comparison (12D) and the cohomology comparison H⁰ = L(D), cohomological genus = function-field genus, ω ↔ canonical class (12E). Used by: SF.3/nonsingular-projective-model, SF.3/curve-affine-or-projective, SF.3/genus-base-change, SF.3/scheme-riemann-hurwitz, SF.3/projective-line-characterization, SF.3/genus-one-curves, SF.3/degree-zero-class-comparison.
- **StableReduction (Layer 1).** The sheaf of relative Kähler differentials Ω_{X/S} on schemes, with its basic exact sequences. Used by: SF.3/scheme-riemann-hurwitz, SF.3/invariant-differentials.
- **StableReduction (Layer 2).** The dualizing sheaf of proper Gorenstein curves (one interface with JacobianChallenge's ω_{X/k}); flat base change and cohomology and base change for proper curves; effective étale descent of schemes with a relatively ample invertible sheaf. Used by: SF.3/genus-base-change, SF.3/line-bundle-degree-bounds, SF.3/vector-bundle-riemann-roch, SF.3/curve-serre-duality, SF.3/picard-scheme-without-point.
- **ClassFieldTheory (Layer 5).** The Brauer group Br(k) = H²(G_k, k^{s×}) on the continuous Galois-cohomology carrier, with restriction and corestriction and cor ∘ res = multiplication by the degree. Used by: SF.3/picard-brauer-sequence, SF.3/rational-divisor-classes.
- **ClassFieldTheory (Layer 10).** The Albert–Brauer–Hasse–Noether theorem: a Brauer class of a global field that is locally trivial everywhere is trivial. Used by: SF.3/rational-divisor-classes.
- **UPSTREAM:CohomologicalPointCounting:TraceFormula:8** (integrated through SF.2). Prime-to-characteristic torsion and Tate modules of abelian varieties and the comparison of H¹_et(C, Z/ℓ^n) with the dual of J_C[ℓ^n] compatibly in n (accepted RS-17 owner of the finite-level curve H¹–Jacobian comparison).
- **UPSTREAM:CohomologicalPointCounting:ConstructibleEtale:6** (integrated through SF.2). Roots-of-unity sheaves μ_n, Kummer exactness for n invertible, Tate twists with the pinned Frobenius convention.
- **UPSTREAM:CohomologicalPointCounting:ConstructibleEtale:7-9** (integrated through SF.2). Finite-coefficient étale cohomology with cup products, cohomology of separably closed fields and the Kummer long exact sequence.
- **UPSTREAM:CohomologicalPointCounting:EllAdicRealization:0-10** (integrated through SF.2). Comparison of classical continuous ℓ-adic cohomology lim H^i(Z/ℓ^n) with Mathlib's pro-étale EllAdicCohomology for finite-type schemes over separably closed fields.

## Recorded gap and source issue

- **Leray five-term sequence on the étale site and étale cohomology of Spec k as Galois cohomology.** SF.3/picard-brauer-sequence uses the exact sequence of low degree of the Leray spectral sequence for f : X → Spec k on étale sites and the identification H^p(Spec k_et, F) = H^p_cont(G_k, F(k^s)). SF.2's stated scope (sheaf cohomology on étale sites) covers both, and PR 196 ConstructibleEtale Layer 9 computes the cohomology of a separably closed field, but no node of an accepted packet states the five-term sequence. The SF.2 follow-up should add it as a node; until then SF.3 cites the SF.2 stage.
- **SchemeAndStackFoundations/E-SF3-1** (gap, Part III, proof of Proposition 2.2, p. 91, in Abelian Varieties v2.0 (16 March 2008), the version read). The proof identifies global 1-forms on J with the dual tangent space at zero and global 1-forms on C with the dual of H¹(C, O_C), and leaves to the reader, as an exercise described as rather complicated, the commutativity of the square relating pullback along the canonical map C → J to these identifications. Correction: The commutativity has to be proved: compute the differential of f_P : C → J at P through the universal divisorial correspondence of Theorem 1.7 and compare with the coboundary H⁰(C, O_C(P)/O_C) → H¹(C, O_C) that identifies T₀(J) with H¹(C, O_C) (Proposition 2.1), then dualize with Serre duality. SF.3/abel-jacobi-differentials records this as its second proof step.

## Sources

- The Stacks Project Authors, *The Stacks Project*, Git master a04446e57ec1fbc252a871afcec7752fb2807b14 (2026-07-28), LaTeX sources read 2026-10-09. https://stacks.math.columbia.edu. Read: Algebraic Curves (tag 0BRV): Sections 2, 4–8, 10, 12, 17, 18, 22 in full; Picard Schemes of Curves (tag 0B92): all sections; Varieties (tag 0209): Sections 25, 43, 44; Divisors (tag 01WO): Sections 18, 27, 28; Étale Cohomology (tag 03N1): Sections 24, 28, 69; Groupoid Schemes (tag 022L): Section 6; Chow Homology (tag 02P3): Section 19; Brauer Groups (tag 073X): Sections 5, 8.
- Steven L. Kleiman, *The Picard scheme*, arXiv:math/0504020v1 (1 April 2005), read 2026-10-09. https://arxiv.org/abs/math/0504020. Read: §2 'The several Picard functors', pp. 16–22 (Definitions 2.1, 2.2, 2.8, Theorem 2.5, Lemmas 2.7, 2.9, 2.10, Remark 2.11).
- J. S. Milne, *Abelian Varieties (course notes, v2.00)*, Version 2.0, March 16, 2008, read 2026-10-09. https://www.jmilne.org/math/CourseNotes/AV.pdf. Read: Part III 'Jacobian Varieties': §1 pp. 85–91, §2 pp. 91–94, §5 pp. 101–104, §9 pp. 113–116.
- Manjul Bhargava, Benedict H. Gross, Xiaoheng Wang, *A positive proportion of locally soluble hyperelliptic curves over Q have no point over any odd degree extension*, arXiv:1310.7692v2 (24 Feb 2017), read 2026-10-09. https://arxiv.org/abs/1310.7692. Read: §3 'Hyperelliptic curves, divisor classes, and generalized Jacobians', pp. 9–12.
- Zhiwei Yun, Wei Zhang, *Shtukas and the Taylor expansion of L-functions*, arXiv:1512.02683v3 (11 Apr 2017), read 2026-10-09. https://arxiv.org/abs/1512.02683. Read: §3.2.1–3.2.6 and Proposition 3.1 with proof, pp. 16–19; §6.1, Proposition 6.1 and proof of (1), pp. 39–41.
- Yonatan Harpaz, Olivier Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois inverse*, Author manuscript (revised 23 September 2019), read 2026-10-09. https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf. Read: §3 opening and diagram (3.1), p. 12.
- Bhargav Bhatt, Peter Scholze, *Projectivity of the Witt vector affine Grassmannian*, arXiv:1507.06490v3 (21 Feb 2017), read 2026-10-09. https://arxiv.org/abs/1507.06490. Read: §4 opening p. 15; Construction 5.1 p. 18; Definition 12.14 and Proposition 12.15, pp. 58–59.
- Tau Ceti roadmap contributors, *Roadmap: the Jacobian challenge (Christian Merten's AG version)*, TauCetiRoadmap JacobianChallenge/README.md as mirrored in tauceti-explorer content/tau-ceti/JacobianChallenge (read 2026-10-09). https://github.com/TauCetiProject/TauCetiRoadmap. Read: Whole document: Layers A–F, acceptance criteria, scope and caveats.
- Tau Ceti roadmap contributors, *Roadmap: algebraic curves — function fields, divisors, and Riemann–Roch*, TauCetiRoadmap AlgebraicCurves/README.md as mirrored in tauceti-explorer content/tau-ceti/AlgebraicCurves (read 2026-10-09). https://github.com/TauCetiProject/TauCetiRoadmap. Read: Introduction, scope, standing hypotheses, pinned conventions; Layers 8, 9, 12 in full; worked examples; cross-roadmap contracts.
- Tau Ceti roadmap contributors, *Roadmap: stable reduction of curves and stable maps*, TauCetiRoadmap StableReduction/README.md as mirrored in tauceti-explorer content/tau-ceti/StableReduction (read 2026-10-09). https://github.com/TauCetiProject/TauCetiRoadmap. Read: Base and standing conventions; inventory and supplier contracts J-A1 to J-E; Layers 0–2.
- Tau Ceti roadmap contributors, *Roadmap: Grothendieck–Lefschetz and cohomological L-functions (CohomologicalPointCounting/TraceFormula, TauCetiRoadmap PR 196)*, PR 196 head 4bd72379658126cbe9be935656396f0c9dac4de0, read 2026-10-09. https://github.com/TauCetiProject/TauCetiRoadmap/blob/4bd72379658126cbe9be935656396f0c9dac4de0/TauCetiRoadmap/CohomologicalPointCounting/TraceFormula/README.md. Read: Consume/missing inventories; Layers 7, 8, 15; scope boundaries; ConstructibleEtale Layers 3, 6, 9 of the same PR.
