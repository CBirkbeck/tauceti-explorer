# Roadmap: Algebraic moduli and representability for arithmetic geometry, Part II — numerical Picard groups and contraction descent

**Summary.** This roadmap develops the numerical theory of invertible sheaves on proper schemes over fields and over Noetherian bases, the Picard scheme of an arbitrary proper scheme over a field with its torsion component and its local system of numerical classes, and the descent theorems that constancy of that local system controls: descent of contractions with projective target and descent of the dual graphs, residue fields and intersection labels of fibres of contractions of smooth proper surfaces. It also states, in the generality the mixed-characteristic minimal model program uses them, the numerical facts about families over a discrete valuation ring and about descent of line bundles along contractions. It starts where Algebraic moduli and representability for arithmetic geometry stops: that roadmap and its continuation in Complex comparison, Part II own the relative Picard sheaf, the Picard stack, representability of the relative Picard sheaf for proper flat families with universal functions, its Brauer obstruction and identity components; here the base is a field but the scheme is arbitrary (nonreduced, disconnected, with H⁰(X, O_X) ≠ k), and the new objects are numerical.

The end theorems are the numerical Néron–Severi theorem for proper schemes over a field (1.3) and over a Noetherian base (1.4); the Murre–Oort representability of Pic_{X/k} (2.1), finiteness of Pic^τ_{X/k} (2.5) and Schröer's positive-power criterion for constancy of Num_{X/k} (2.10); Schröer's Theorem 1.3 on descent of geometric contractions (3.7); Schröer's Theorem 2.1 on descent of fibre graphs, residue fields and labels (4.7–4.9); and, over a DVR, lifting of line bundles when H²(X, O_X) = 0 (5.3), identification of cones (5.4), nef-and-big transfer (5.5), descent of semiample numerically trivial sheaves (5.6) and vertical descent (5.7).

| Layer | Title | What it delivers |
|---|---|---|
| [0](#layer-0-degrees-on-curves-and-relative-numerical-triviality) | Degrees on curves and relative numerical triviality | degree over a residue field, curve index d_C, Pic^τ(X/S), field-extension invariance, closed points suffice, surjective pullback |
| [1](#layer-1-numerical-groups-cones-nefness-and-bigness) | Numerical groups, cones, nefness and bigness | Num, N¹, N₁, NE‾, ρ, numerical Néron–Severi, relative nef, big |
| [2](#layer-2-the-picard-scheme-of-a-proper-scheme-over-a-field-and-the-numerical-local-system) | The Picard scheme over a field and the numerical local system | Murre–Oort, X^aff and the Brauer obstruction, Pic^τ_{X/k}, Num_{X/k}, norms, Lemma 1.1, doubling lift, finite fields |
| [3](#layer-3-contractions-semiample-sheaves-and-descent-of-contractions) | Contractions, semiample sheaves and descent of contractions | contractions, rigidity, semiample sheaves, the semiample–contraction dictionary, spreading out, inseparable descent, Theorem 1.3, openness of ampleness |
| [4](#layer-4-component-graphs-and-contractions-of-smooth-surfaces) | Component graphs and contractions of smooth surfaces | dual graphs, Proposition 1.2, labelled graphs, the surface trichotomy, negativity, Zariski's lemma, Theorem 2.1 |
| [5](#layer-5-numerical-theory-in-families-and-descent-along-contractions) | Numerical theory in families and descent along contractions | restriction to the special fibre, numerical versus actual lifts, lifting with H² = 0, cones, nef and big, semiample descent, vertical descent, extremal curves, the AHK rank |

## Scope and ownership

**This roadmap owns** the degree of invertible sheaves on proper one-dimensional schemes over a field taken over the residue field of the base point, the curve index d_C, relative numerical triviality and the subgroup Pic^τ(X/S) ⊂ Pic(X), the numerical groups Num(X/S), N¹(X/S), N₁(X/S) and the cone NE‾(X/S) over a Noetherian base, the numerical Néron–Severi theorem for proper schemes over arbitrary fields, relative nefness, bigness on integral proper schemes and relative semiampleness; the Picard scheme of an arbitrary proper scheme over a field, the affinization and the Brauer obstruction over it, the torsion component Pic^τ_{X/k} and the étale local system Num_{X/k}; contractions, the rigidity lemma, the semiample–contraction dictionary and the descent of contractions; component dual graphs, intersection-labelled graphs, the negativity of exceptional curves, Zariski's lemma and the descent of fibre graphs of surface contractions; and the numerical statements over a DVR and along contractions listed in Layer 5.

**Supplied elsewhere and cited.** Algebraic moduli and representability for arithmetic geometry supplies relative Picard sheaves of algebraic spaces with base change, kernel and section splitting (§7.6), the Picard stack, infinitesimal lifting of line bundles (§7.3) and identity components of group algebraic spaces (§7.9); Complex comparison, Part II supplies representability of the relative Picard sheaf for proper flat families with universal functions (§C3.2d.2), its Brauer obstruction (§C3.2d.4) and Pic^τ over a locally Noetherian base for projective flat families with geometrically integral fibres (§C3.2e). JacobianChallenge supplies invertible sheaves and degrees on curves (Layer A), coherent cohomology over a field and in proper families (Layers B–C) and the Picard functor and projective Picard representability for projective geometrically integral schemes over a field (Layer D). SchemeAndStackFoundations supplies limits and descent along field extensions (§§0.9, 0.11, 0.23), algebraic spaces (Layer 1), Leray, flat base change, Hilbert 90, Kummer, Galois cohomology and Brauer groups (§§2.2, 2.6, 2.11, 2.15, 2.22), degrees on curves and norms of line bundles (§§3.3, 3.5), Stein factorisation, Grothendieck existence, generic flatness and Chow's lemma (§§4.9, 4.10, 4.12), and Chow groups, first Chern classes, the surface pairing and the numerical group of smooth projective surfaces (§§5.2–5.3, 5.9–5.10). StableReduction supplies dual graphs of nodal curves (Layer 1), relative Proj, global generation and the openness of fibrewise ampleness for schemes (Layer 2) and intersection theory on regular models over a DVR (Layer 4). The characteristic-zero numerical theory of projective varieties over algebraically closed fields (N¹, NE‾, nefness, Kleiman's criterion, semiampleness) is the upstream AbundanceStatement roadmap's Layers 4–5; the statements here specialise to it and are compared with it, not built a second time.

**Not in this roadmap.** The minimal model program in positive and mixed characteristic and its theorems (base point free, cone and contraction theorems, flips, the descent clauses of Bhatt et al. Propositions 2.51 and 9.16 and Theorem 9.15, and the lifting of MMP steps of Hacon–Witaszek) belong to the birational-geometry continuation of SchemeAndStackFoundations; this roadmap supplies the numerical statements they apply. Moduli of stable surfaces in mixed characteristic is a separate roadmap. Relative positivity beyond nef, big and semiample (EWM maps, Keel's theorem, gluing) belongs to the positivity continuation of SchemeAndStackFoundations; genus-one fibrations and their Jacobians to the genus-one roadmap; the Enriques-specific results to Enriques surfaces and nonexistence over the integers.

## Conventions

Schemes over a Noetherian base S are proper over S unless stated. A curve over S is an integral one-dimensional closed subscheme C of X whose image is a closed point s of S; it is proper over κ(s), and degrees (L·C) are taken over κ(s), never over a field of constants of C. Over a field k a curve is an integral proper closed subscheme of dimension one. Pic^τ(X/S) denotes the subgroup of Pic(X) of relatively numerically trivial classes; Pic^τ_{X/k} denotes the group scheme of Layer 2, and the two are compared there. Num, N¹ and N₁ are defined with curves over closed points; by 0.5 the same groups arise with curves in all fibres. Pic_{X/k} is the fppf sheafification of T ↦ Pic(X_T). Contractions satisfy O\_Y ≅ f\_\*O\_X and are proper. A semiample invertible sheaf has a positive globally generated power; m = 0 is never allowed. The constant d in the positive-power criterion is at least one.

Declaration names are relative to `TauCetiRoadmap.AlgebraicModuliForArithmeticGeometryPartII`, with the displayed prefixes `Numerical`, `Picard`, `Contraction` and `DualGraph` as namespaces.

## How to read the build

Layers 0 and 1 are the numerical vocabulary; the finiteness theorems 1.3 and 1.4 use only Layer 0 and the cohomological suppliers. Layer 2 is the Picard theory over a field and uses Layer 1 for the stalks of Num. Layer 3 uses Layer 2's Leray obstruction to descend semiample sheaves and proves Theorem 1.3. Layer 4 is surfaces: it uses Layer 3's contractions and Layer 2's constancy. Layer 5 uses Layers 0, 1, 3 and 4 and does not use Layer 2.


## Layer 0: Degrees on curves and relative numerical triviality

\*\*Targets.\*\* The degree deg\_κ(L) of an invertible sheaf on a proper scheme of dimension ≤ 1 over a field κ, with tensor, cycle, finite-pullback, base-field and field-extension laws; the curve index d\_C of an integral proper curve (Das–Waldron Lemma 4.1, Bhatt et al. Lemma 2.47); the predicate L ≡\_f 0 of relative numerical triviality for proper f : X → S over a Noetherian base, with the subgroup Pic^τ(X/S) ⊂ Pic(X); invariance of numerical triviality under extension of the base field; the theorem that closed points of S suffice; detection of numerical triviality by proper surjective pullback.


<a id="np-0-1"></a>

### 0.1 Degree of an invertible sheaf on a curve over a field

Define `Numerical.curveDegree`. Let κ be a field and C a scheme proper over κ with dim C ≤ 1 (C may be reducible, nonreduced or have zero-dimensional components). For an invertible sheaf L on C put deg\_κ(L) := χ\_κ(C, L) − χ\_κ(C, O\_C), where χ\_κ is the alternating sum of the κ-dimensions of the (finite-dimensional) coherent cohomology groups. For a scheme X over a base S, a point s ∈ S, a closed integral subscheme C ⊂ X\_s of dimension one that is proper over κ(s) (a curve over s), and L ∈ Pic(X), write (L·C) := deg\_{κ(s)}(L|\_C). The degree is taken over the residue field κ(s) of the point of S under C, never over a larger field of constants of C.

*Hypotheses.* κ a field; C proper over κ of dimension at most one; for (L·C): C is an integral curve in a fibre X\_s, proper over κ(s).

*Source.* Kleiman, The Picard scheme, Definition 6.1, p. 52: Numerical equivalence on a complete scheme over a field is defined by equality of ∫c₁L·[Y] over complete integral curves Y, and this number equals the degree of L on Y and on its normalization.; Bhatt et al. 2023, §2.5, paragraph before Remark 2.22, p. 18: For a projective morphism to Z, a curve over Z is a one-dimensional scheme proper over a closed point of Z; intersection numbers L·\_k C are degrees over the residue field k of that closed point.; Stacks, Section 33.45 (tag 0BEL), Numerical intersections: Intersection numbers (L₁⋯L\_d·Z) of invertible sheaves with a proper d-dimensional closed subscheme over a field are defined through Euler characteristics; d = 1 is the degree used here.

*Construction.* Finite-dimensionality of H^i(C, F) for coherent F on proper C over κ is the coherent cohomology of JacobianChallenge Layer B/C; H^i = 0 for i ≥ 2 by Grothendieck vanishing. Additivity: for L, M invertible, χ(L⊗M) − χ(L) − χ(M) + χ(O) = 0 on a one-dimensional proper scheme (the second difference of χ vanishes: restrict to effective Cartier divisors after twisting, or use the cycle formula below). Cycle formula: deg\_κ(L) = Σ\_i m\_i deg\_κ(L|\_{C\_i}) over the one-dimensional irreducible components C\_i with reduced structure, m\_i = length O\_{C,η\_i}; zero-dimensional components contribute nothing. This is SchemeAndStackFoundations §5.3's c1\_degree\_curve, deg(c₁(L) ∩ [C]\_1), on the fundamental 1-cycle. On an integral proper curve the degree equals the degree of the pullback to the normalization and the residue-weighted degree of the divisor of any rational section (JacobianChallenge Layer A, Kleiman 2005, Definition 6.1).

*Uses.* Schröer 2023, §1, p. 4: numerical triviality of an invertible sheaf on the geometric fibre is vanishing of all these degrees; Bhatt et al. 2023, §2.5, p. 18 and Lemma 2.47: f-nefness and the intersection pairing with curves over closed points of the base; Hacon–Witaszek 2023, §6: numerical equivalence of Q-line bundles on the special fibre of a lift over a DVR; this roadmap 0.4, 1.1: the pairing whose kernel defines Pic^τ(X/S) and N¹(X/S).

The API:

- `Numerical.curveDegree` (data): deg\_κ(L) ∈ ℤ for an invertible sheaf L on a proper κ-scheme C of dimension ≤ 1, depending only on the isomorphism class of L.
- `Numerical.curveDegree_tensor` (simp): deg\_κ(L ⊗ M) = deg\_κ(L) + deg\_κ(M); deg\_κ(O\_C) = 0.
- `Numerical.curveDegree_inv` (simp): deg\_κ(L^{-1}) = −deg\_κ(L) and deg\_κ(L^{⊗n}) = n·deg\_κ(L) for n ∈ ℤ.
- `Numerical.curveDegree_cycle` (characterisation): deg\_κ(L) = Σ\_i length(O\_{C,η\_i})·deg\_κ(L|\_{(C\_i)\_red}) over the generic points η\_i of the one-dimensional irreducible components.
- `Numerical.curveDegree_finite_pullback` (functoriality): For a finite surjective κ-morphism π : C′ → C of integral proper curves, deg\_κ(π\*L) = [κ(C′) : κ(C)]·deg\_κ(L).
- `Numerical.curveDegree_baseField` (compatibility): If C is proper over a finite extension κ′ ⊃ κ, then deg\_κ(L) = [κ′ : κ]·deg\_{κ′}(L).
- `Numerical.curveDegree_fieldExtension` (compatibility): For any field extension K/κ, deg\_K(L\_K on C\_K) = deg\_κ(L on C) (flat base change of cohomology).
- `Numerical.curveDegree_eq_chow` (compatibility): On an integral proper curve, deg\_κ(L) = deg(c₁(L) ∩ [C]) of SchemeAndStackFoundations §5.3 and agrees with JacobianChallenge Layer A's deg for smooth projective geometrically integral curves.

*Needs:* JacobianChallenge Layer A; JacobianChallenge Layer B; JacobianChallenge Layer C; SchemeAndStackFoundations Layer 3; SchemeAndStackFoundations Layer 5; Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass`; Mathlib `AlgebraicGeometry.IsProper`.

**Checks.**

- `Numerical.curveDegree_projectiveLine` (computation): On P¹\_κ, deg\_κ(O(m)) = m for every m ∈ ℤ.
- `Numerical.curveDegree_realForm` (computation): For C = P¹\_ℂ viewed as a proper ℝ-scheme, deg\_ℝ(O(1)) = 2 and deg\_ℂ(O(1)) = 1: the base field is part of the data.
- `Numerical.curveDegree_trivial` (degenerate): deg\_κ(O\_C) = 0, and on a zero-dimensional proper κ-scheme every invertible sheaf has degree 0.
- `Numerical.curveDegree_doubleLine` (computation): For the nonreduced conic C = V(y²) ⊂ P²\_κ, deg\_κ(O(1)|\_C) = 2 = 2·deg(O(1)|\_line): nilpotent multiplicities count.
- `Numerical.curveDegree_ne_euler` (non-example): χ(L) is not the degree: on P¹\_κ, χ(O) = 1 while deg(O) = 0.
- deg\_κ O\_{P¹\_κ}(m) = m.
- deg over κ depends on κ: P¹\_ℂ regarded as an ℝ-scheme has deg\_ℝ O(1) = 2.
- On the double line V(y²) ⊂ P²\_κ, deg O(1)|\_C = 2.


<a id="np-0-2"></a>

### 0.2 Divisibility of curve degrees by the geometric index d\_C

Prove. Let X be a scheme locally of finite type over a field k, C ⊂ X an integral curve proper over k, k̄ an algebraic closure and φ : X\_{k̄} → X the projection. There is an integer d\_C ≥ 1, depending only on C, such that for every invertible sheaf L on X (more generally every ℝ-Cartier divisor D) and every integral curve C′ ⊂ X\_{k̄} with φ(C′) = C one has (L·C)\_k = d\_C·(φ\*L·C′)\_{k̄}. In particular d\_C divides (L·C)\_k for every invertible L. Explicitly d\_C = m·r, where (C\_{k̄})\_red has r irreducible components, all of multiplicity m in the fundamental cycle of C\_{k̄}.

*Hypotheses.* k a field, C integral and proper over k; the conclusion is for every component C′ of (C\_{k̄})\_red.

*Source.* Bhatt et al. 2023, Lemma 2.47 and proof, p. 25: For a proper curve over a point of a Dedekind base there is a positive integer d\_C with D·C = d\_C(φ\*D·C̄) for every ℝ-Cartier D and every geometric component C̄ over C; Cartier degrees are divisible by d\_C.; Das–Waldron 2022, Lemma 3.6, p. 10, and Lemma 4.1, p. 12: The constant d\_C = [L:k][K(E):K(C)] is an integer, and for a curve on a proper variety over k the degree over k is d\_C times the geometric degree on any component over C; only properness of C is used.

*Proof sketch.* The group Aut(k̄/k) permutes the irreducible components of C\_{k̄} transitively, since C is irreducible and k̄/k is normal (purely inseparable steps are homeomorphisms). Conjugate components have equal multiplicity in [C\_{k̄}] and equal φ\*L-degree, because φ\*L is Aut(k̄/k)-invariant up to isomorphism. Field-extension invariance of degrees (curve-degree API) gives (L·C)\_k = deg\_{k̄}(φ\*L|\_{C\_{k̄}}) = Σ\_i m·(φ\*L·C′\_i) = m·r·(φ\*L·C′). Das–Waldron give the same constant as [L : k]·[K(E) : K(C)] with L the compositum of the fields of definition of the geometric components; both descriptions agree.

*Needs:* [0.1](#np-0-1); Mathlib `IsAlgClosure`; SchemeAndStackFoundations Layer 0.

**Checks.**

- For C = P¹\_ℂ viewed over ℝ, d\_C = 2 and every invertible sheaf has even ℝ-degree on C.
- For k = F\_p(t), k′ = k(t^{1/p}) and C = P¹\_{k′} viewed over k, C\_{k̄} is a p-fold thickening of P¹\_{k̄}: d\_C = p.
- For geometrically integral C, d\_C = 1.


<a id="np-0-3"></a>

### 0.3 Numerical triviality is invariant under extension of the base field

Prove. Let X be proper over a field k, L ∈ Pic(X) and K/k any field extension. Then (L·C) = 0 for every integral curve C ⊂ X if and only if (L\_K·C′) = 0 for every integral curve C′ ⊂ X\_K.

*Hypotheses.* X proper over k; K/k arbitrary (not necessarily algebraic).

*Source.* Kleiman, The Picard scheme, Exercise 6.11, Proposition 6.12 and Remark 6.14, pp. 57–58: τ-equivalence to O\_X is membership in Pic^τ; forming Pic^τ commutes with extending k; for complete X numerical and τ-equivalence agree over an algebraically closed field.; Kleiman, The Picard scheme, Theorem 6.3, pp. 52–53: Over an algebraically closed field on a projective scheme, τ-equivalence to O\_X, numerical equivalence to O\_X and boundedness of the powers are equivalent.

*Proof sketch.* (⇐) For C ⊂ X, the base change C\_K is a proper one-dimensional K-scheme and deg\_k(L|\_C) = deg\_K(L\_K|\_{C\_K}) = Σ\_i m\_i (L\_K·C\_i) = 0. (⇒), K/k finite: X\_K → X is finite; a curve C′ ⊂ X\_K maps finitely onto an integral curve C ⊂ X, and the projection formula gives [K:k]·(L\_K·C′)\_K = [κ(C′):κ(C)]·(L·C)\_k = 0. (⇒), general K: C′ is defined over a finitely generated k-subalgebra A ⊂ K; spread C′ to a flat proper family of curves over an open of Spec A and specialise to a closed point a, whose residue field is finite over k (Nullstellensatz). Degrees are constant in flat proper families of curves (χ(L^{⊗n}) is locally constant), so (L\_K·C′) equals a degree on X\_{κ(a)}, which vanishes by the finite case. Equivalently: the τ-component of the Picard scheme commutes with extension of k and its points are the numerically trivial classes (Kleiman, Proposition 6.12 and Remark 6.14).

*Needs:* [0.1](#np-0-1); SchemeAndStackFoundations Layer 0; JacobianChallenge Layer C.

**Checks.**

- On P¹\_ℝ, O(m) is numerically trivial iff it is so on P¹\_ℂ, iff m = 0.
- A curve on X\_K need not map onto a curve of X (a generic line of P²\_{k(u)} dominates P²\_k); the proof specialises instead of taking images.


<a id="np-0-4"></a>

### 0.4 Relative numerical triviality and the subgroup Pic^τ(X/S)

Define `Numerical.NumericallyTrivial`. Let f : X → S be a proper morphism with S Noetherian. An invertible sheaf L on X is f-numerically trivial, written L ≡\_f 0 (or L ≡\_S 0), if (L·C) = 0 for every point s ∈ S and every integral curve C ⊂ X\_s. Two invertible sheaves are f-numerically equivalent if L ⊗ M^{-1} ≡\_f 0. The f-numerically trivial classes form a subgroup Pic^τ(X/S) ⊂ Pic(X); this subgroup of Pic(X) is distinct from the group scheme Pic^τ\_{X/k} of NP.2, whose rational points it is compared with there. For S = Spec k this is numerical equivalence on the proper k-scheme X.

*Hypotheses.* f proper, S Noetherian; curves in all fibres, degrees over residue fields of S.

*Source.* Bhatt et al. 2023, Remark 2.22, p. 19: Pic^τ(X/S) is the subgroup of line bundles numerically trivial on all fibres of a proper morphism of Noetherian schemes, with the parenthetical claim that closed points suffice.; Schröer 2023, §1, p. 4: Pic^τ\_{X/k} parametrises invertible sheaves numerically trivial on the geometric fibre of a proper scheme over a field.; Witaszek 2022, §2, p. 7: Relative nefness over a Noetherian base tests degrees on integral proper curves in all fibres over their residue fields.

*Construction.* The subgroup property is the tensor and inverse API of 0.1. By 0.5 the condition may be tested over closed points of S only (the convention of Bhatt et al.), and by 0.3 on geometric fibres (the convention of Schröer).

*Uses.* Schröer 2023, Lemma 1.1, Proposition 1.2, Theorem 2.1: the kernel of the numerical class map Pic → Num on a proper scheme over a field; Bhatt et al. 2023, Remark 2.22 and Propositions 2.51, 9.16: relative numerical triviality ≡\_Z 0 over the base of a contraction; Hacon–Witaszek 2023, Theorem 1.3(2), §6: numerical equivalence on the special fibre of a lift; Witaszek 2022, Proposition 5.3 and Keel 1999 Lemma 2.16: numerically trivial line bundles on projective schemes over locally finite fields are torsion; EnriquesSurfacesAndIntegralNonexistence Layers 0 and 2: Pic^τ of an Enriques surface and its relative version.

The API:

- `Numerical.NumericallyTrivial` (data): The predicate L ≡\_f 0 on Pic(X) for proper f : X → S.
- `Numerical.numericallyTrivialSubgroup` (structure): Pic^τ(X/S) is a subgroup of Pic(X): closed under ⊗, inverse, containing O\_X.
- `Numerical.numericallyTrivial_pullback_base` (simp): f\*N ≡\_f 0 for N ∈ Pic(S).
- `Numerical.numericallyTrivial_iff_closedPoints` (characterisation): L ≡\_f 0 iff (L·C) = 0 for all curves C in fibres over closed points of S (0.5).
- `Numerical.numericallyTrivial_iff_geometric` (characterisation): L ≡\_f 0 iff L\_{s̄} is numerically trivial on X\_{s̄} for every geometric point s̄ (0.3).
- `Numerical.numericallyTrivial_baseChange` (functoriality): If L ≡\_f 0 then L\_T ≡\_{f\_T} 0 for every morphism T → S of Noetherian schemes.
- `Numerical.numericallyTrivial_restrict` (functoriality): If Z ⊂ X is closed then L ≡\_f 0 implies L|\_Z ≡\_{f|\_Z} 0.
- `Numerical.numericallyTrivial_iff_surface` (compatibility): For S = Spec k with k algebraically closed and X a smooth projective surface, L ≡ 0 iff L is Chow.NumericallyEquivalent to O\_X in SchemeAndStackFoundations §5.10; for projective varieties over algebraically closed fields of characteristic zero it is AbundanceStatement Layer 4B's numerical equivalence.

*Needs:* [0.1](#np-0-1); Mathlib `AlgebraicGeometry.IsProper`; Mathlib `CommRing.Pic`; Tau Ceti `TauCeti.AlgebraicGeometry.LineBundleClass`.

**Checks.**

- `Numerical.numericallyTrivial_projectiveLine` (computation): On P¹\_k over S = Spec k, O(m) ≡ 0 iff m = 0.
- `Numerical.numericallyTrivial_identity` (degenerate): For f = id\_S every L ∈ Pic(S) is f-numerically trivial, so Pic^τ(S/S) = Pic(S) even when Pic(S) ≠ 0.
- `Numerical.numericallyTrivial_elliptic` (non-example): On an elliptic curve E over k̄ with distinct points p, q, O(p − q) ≡ 0 although O(p − q) ≇ O\_E: numerically trivial is weaker than trivial.
- `Numerical.numericallyTrivial_relative_ruling` (computation): For the first projection f : P¹×P¹ → P¹, O(a,b) ≡\_f 0 iff b = 0, while O(a,b) ≡ 0 over Spec k iff a = b = 0.
- f\*N ≡\_f 0 for every N ∈ Pic(S).
- For the identity X = S every invertible sheaf is numerically trivial.
- On an Enriques surface over k̄ of characteristic ≠ 2, ω is numerically trivial and nontrivial.


<a id="np-0-5"></a>

### 0.5 Numerical triviality can be tested over closed points of the base

Prove. Let f : X → S be proper with S Noetherian and L ∈ Pic(X). If (L·D) = 0 for every closed point t ∈ S and every integral curve D ⊂ X\_t, then L ≡\_f 0.

*Hypotheses.* f proper, S Noetherian.

*Source.* Bhatt et al. 2023, Remark 2.22, p. 19: The parenthetical remark that numerical triviality on all fibres may be checked over closed points only; the proof is supplied here.; Stacks, tag 00PH: A Noetherian local domain that is not a field is dominated by a discrete valuation ring with the same fraction field.

*Proof sketch.* Suppose the conclusion fails at some point; by Noetherian induction choose a failing point s whose closure T is minimal. T ≠ {s}, since closed points satisfy the hypothesis. Choose t′ ∈ T of codimension one in T. Normalising the one-dimensional Noetherian local domain O\_{T,t′} (Krull–Akizuki) gives a discrete valuation ring R dominating it with fraction field finite over κ(s) and residue field finite over κ(t′). For a curve C ⊂ X\_s, base change its closure to Spec R and take the flat closure Z of its generic fibre; Z is proper and flat of relative dimension one over R, and χ(L^{⊗n}) is constant on its fibres, so the degree of L on C (unchanged by the finite extension of κ(s)) equals the degree on the special fibre, a one-dimensional proper scheme over κ(R). The special fibre's one-dimensional components lie in X\_{t′} ⊗ κ(R); L is numerically trivial on X\_{t′} by minimality of T, hence on X\_{t′} ⊗ κ(R) (0.3). The cycle formula gives degree 0, a contradiction.

*Needs:* [0.1](#np-0-1); [0.3](#np-0-3); SchemeAndStackFoundations Layer 0; JacobianChallenge Layer C.

**Checks.**

- Over S = Spec ℤ\_p and X = P¹\_S, testing the special fibre recovers O(m) ≡\_f 0 iff m = 0.
- Generic points do not suffice: for X = Bl\_x P²\_{ℤ\_p} with x a closed point of the special fibre and E the exceptional curve, O(E) is trivial on the generic fibre but has degree −1 on E, so O(E) is not f-numerically trivial.


<a id="np-0-6"></a>

### 0.6 Proper surjective pullback detects numerical triviality

Prove. Let g : X′ → X be a proper surjective morphism of schemes proper over a Noetherian S. For L ∈ Pic(X), L ≡\_S 0 if and only if g\*L ≡\_S 0. Hence g\* : Num(X/S) → Num(X′/S) (NP.1) is injective.

*Hypotheses.* g proper and surjective over S; X, X′ proper over S Noetherian.

*Source.* Kleiman, The Picard scheme, Remark 6.14, pp. 57–58: For a surjection from a projective variety given by Chow's lemma, numerical triviality of the pullback follows from the projection formula; the converse lifting of curves is the standard complement.; Stacks, Lemma 33.45.7 (tag 0BET): Intersection numbers of pulled-back invertible sheaves on a closed subscheme equal the degree of the map onto its image times those on the image.

*Proof sketch.* (⇒) A curve C′ in a fibre of X′ maps onto a curve D or to a point; by the projection formula (g\*L·C′) = [κ(C′):κ(D)](L·D), or 0. (⇐) Given a curve D ⊂ X\_s, the generic fibre of g over the generic point of D is a nonempty proper scheme; the closure of one of its closed points is an integral curve C′ ⊂ X′\_s mapping finitely onto D, and (g\*L·C′) = [κ(C′):κ(D)](L·D) with a positive factor.

*Needs:* [0.4](#np-0-4); [0.1](#np-0-1); SchemeAndStackFoundations Layer 5.

**Checks.**

- For the normalization ν : C̃ → C of a nodal cubic, ν\*L ≡ 0 iff L ≡ 0.
- For the blow-up g : Bl\_p P² → P², g\*O(1) is not numerically trivial; the exceptional curve meets it in degree 0 but a line's strict transform does not.


### Dependencies

This layer uses SchemeAndStackFoundations Layer 0, SchemeAndStackFoundations Layer 3, SchemeAndStackFoundations Layer 5, JacobianChallenge Layer A, JacobianChallenge Layer B, JacobianChallenge Layer C.


## Layer 1: Numerical groups, cones, nefness and bigness

\*\*Targets.\*\* Num(X/S) = Pic(X)/Pic^τ(X/S), N¹(X/S)\_ℚ, N¹(X/S)\_ℝ and ρ(X/S); the space N₁(X/S) of 1-cycles on curves over closed points and the cone NE‾(X/S); the numerical Néron–Severi theorem for proper schemes over a field (Num free of finite rank, with the étale rank bound) and its relative version over a Noetherian base; relative nefness and the nef cone; bigness on integral proper schemes with the nef criterion. Compatibility with SchemeAndStackFoundations §5.10 (surfaces) and with the characteristic-zero numerical theory of the upstream AbundanceStatement roadmap.


<a id="np-1-1"></a>

### 1.1 The relative numerical group N¹(X/S) and the relative Picard number

Define `Numerical.Num`. For f : X → S proper with S Noetherian put Num(X/S) := Pic(X)/Pic^τ(X/S), N¹(X/S)\_ℚ := Num(X/S) ⊗ ℚ and N¹(X/S) := N¹(X/S)\_ℝ := Num(X/S) ⊗ ℝ, with the class map [−] : Pic(X) → Num(X/S). The relative Picard number is ρ(X/S) := dim\_ℝ N¹(X/S), finite by 1.4. Equivalently N¹(X/S)\_ℚ is (Pic(X) ⊗ ℚ) modulo the kernel of the ℚ-linear degree pairing with curves in fibres, which is Hacon–Witaszek's N¹(X) = Pic(X) ⊗ ℚ/≡ for S = Spec k.

*Hypotheses.* f proper, S Noetherian.

*Source.* Bhatt et al. 2023, Remark 2.22, p. 19: N¹(X/S) is defined as (Pic(X)/Pic^τ(X/S)) ⊗ ℝ, finite-dimensional, with ρ(X/S) its dimension, the relative Picard rank.; Hacon–Witaszek 2023, §1, after Theorem 1.3, p. 3: N¹(X) is Pic(X) ⊗ ℚ modulo numerical equivalence, the ℚ-line bundles up to numerical equivalence.

*Construction.* Num(X/S) is torsion-free: if L^{⊗n} ≡\_f 0 with n ≠ 0, cancel n in each integer degree. Torsion-freeness makes Num → N¹\_ℚ → N¹\_ℝ injective, and tensoring the exact sequence 0 → Pic^τ(X/S) → Pic(X) → Num → 0 with ℚ identifies N¹\_ℚ with Pic ⊗ ℚ modulo ℚ-numerical equivalence.

*Uses.* Hacon–Witaszek 2023, Theorem 1.3(2) and Lemma 6.3: surjectivity of the restriction N¹(𝒳/R) → N¹(X) from a lift over a DVR to its special fibre; Bhatt et al. 2023, Remark 2.22 and §9: ρ(X/Z) = 1 for extremal contractions; W ⊂ Div\_ℚ(X) as functionals on faces; Alexeev–Hacon–Kawamata 2007, Lemma 1.6: dim N¹(X) ⊗ ℝ of a resolution enters the birational rank 5.9; Schröer 2023, §1: Num(X\_{k̄}) ≅ ℤ^ρ is the stalk of the local system Num\_{X/k}.

The API:

- `Numerical.Num` (data): Num(X/S) := Pic(X)/Pic^τ(X/S), an abelian group with class map Pic(X) → Num(X/S).
- `Numerical.Num.mk_eq_mk_iff` (extensionality): [L] = [M] in Num(X/S) iff L ⊗ M^{-1} ≡\_f 0.
- `Numerical.Num.pairing` (data): The degree pairing Num(X/S) × {curves in fibres} → ℤ descends from Pic(X).
- `Numerical.Num.torsionFree` (instance): Num(X/S) is torsion-free.
- `Numerical.N1` (data): N¹(X/S)\_ℚ := Num ⊗ ℚ and N¹(X/S) := Num ⊗ ℝ with the injective maps Num ↪ N¹\_ℚ ↪ N¹\_ℝ.
- `Numerical.relativePicardNumber` (data): ρ(X/S) := dim\_ℝ N¹(X/S) ∈ ℕ.
- `Numerical.Num.pullback` (functoriality): An S-morphism g : X′ → X of proper S-schemes induces g\* : Num(X/S) → Num(X′/S), with id\* = id and (g∘h)\* = h\*∘g\*; injective when g is surjective.
- `Numerical.Num.baseChange` (functoriality): For a field extension K/k, Num(X/k) → Num(X\_K/K) is injective (0.3).
- `Numerical.N1.qCartierClass` (constructor): For normal X and a ℚ-Cartier Weil divisor D with rD Cartier, [D] := (1/r)[O\_X(rD)] ∈ N¹(X/S)\_ℚ, independent of r.
- `Numerical.Num.eq_surface` (compatibility): For a smooth projective surface over an algebraically closed field, Num(X/k) is SchemeAndStackFoundations §5.10's Num S; for projective varieties over algebraically closed fields of characteristic zero, N¹(X/k)\_ℝ is AbundanceStatement Layer 4B's N¹(X)\_ℝ.

*Needs:* [0.4](#np-0-4); [0.6](#np-0-6); Mathlib `Module.finrank`.

**Checks.**

- `Numerical.Num_projectiveLine` (computation): Num(P¹\_k/k) ≅ ℤ via the degree, and ρ = 1.
- `Numerical.Num_identity` (degenerate): Num(S/S) = 0 and ρ(S/S) = 0 for the identity, whatever Pic(S) is.
- `Numerical.Num_productRelative` (computation): For the first projection P¹×P¹ → P¹, Num ≅ ℤ by the fibre degree b of O(a,b); over Spec k, Num ≅ ℤ² with intersection matrix [[0,1],[1,0]].
- `Numerical.Num_ne_Pic_elliptic` (non-example): For an elliptic curve E over k̄, Pic(E) ≅ E(k̄) × ℤ but Num(E/k̄) ≅ ℤ: the numerical group is not the Picard group.
- `Numerical.Num_torsion_killed` (non-example): For an Enriques surface Y over k̄ (characteristic ≠ 2), the class of ω has order 2 in Pic(Y) and is zero in Num(Y/k̄).
- ρ(P¹×P¹/k) = 2 and ρ(P¹×P¹/P¹) = 1 for a projection.
- ρ(S/S) = 0 for the identity.


<a id="np-1-2"></a>

### 1.2 Relative 1-cycles N₁(X/S) and the cone of curves NE(X/S)

Define `Numerical.N1curves`. For f : X → S proper with S Noetherian, a curve over S is an integral one-dimensional closed subscheme C ⊂ X with f(C) a closed point s, proper over κ(s). Let Z₁(X/S)\_ℝ be the real vector space on curves over S, paired with Pic(X) by (L·Σa\_iC\_i) = Σ a\_i (L·C\_i)\_{κ(s\_i)}. Put N₁(X/S) := Z₁(X/S)\_ℝ modulo the cycles pairing to zero with every invertible sheaf. NE(X/S) ⊂ N₁(X/S) is the convex cone of classes Σ a\_i[C\_i] with a\_i ≥ 0, and NE‾(X/S) its closure in the Euclidean topology of the finite-dimensional space N₁(X/S).

*Hypotheses.* f proper, S Noetherian; curves lie over closed points, degrees over their residue fields.

*Source.* Bhatt et al. 2023, §2.5, paragraph before Remark 2.22, p. 18: Curves over Z are one-dimensional schemes proper over a closed point of Z; N₁ is spanned by integral curves over Z modulo numerical equivalence; f-nefness is nonnegativity on such curves.; Hacon–Witaszek 2023, proof of Theorem 1.3(2a), p. 33: Only curves projective over the base, hence in the special fibre, enter the definition of NE for a scheme over a DVR.

*Construction.* By 0.5, the kernel of Pic(X) → Hom(Z₁(X/S), ℤ) is Pic^τ(X/S), so the pairing N¹(X/S) × N₁(X/S) → ℝ is nondegenerate on both sides. With N¹(X/S) finite-dimensional (1.4), nondegeneracy makes N₁(X/S) its dual; NE‾ is a closed convex cone, not assumed polyhedral.

*Uses.* Bhatt et al. 2023, Theorem 9.9, Proposition 9.16, Definition 9.30: extremal rays and faces V = L^⊥ ⊂ NE‾(X/T); Hacon–Witaszek 2023, proof of Theorem 6.1(2a): comparison of NE(𝒳/S) with NE(X) of the special fibre; this roadmap 5.4 and 5.8: identification of relative cones and minimal normalised degree on a ray.

The API:

- `Numerical.N1curves` (data): N₁(X/S) as the quotient of real 1-cycles on curves over closed points by the numerically trivial ones.
- `Numerical.N1curves.pairing` (data): The bilinear pairing N¹(X/S) × N₁(X/S) → ℝ.
- `Numerical.N1curves.pairing_perfect` (equivalence): The pairing identifies N₁(X/S) with the ℝ-dual of N¹(X/S).
- `Numerical.coneOfCurves` (data): NE(X/S) and its closure NE‾(X/S), a closed convex cone.
- `Numerical.N1curves.pushforward` (functoriality): For an S-morphism g : X′ → X of proper S-schemes, g\_\*[C] = [κ(C):κ(g(C))]·[g(C)] or 0, with (g\*L·γ) = (L·g\_\*γ) and g\_\*(NE(X′/S)) ⊂ NE(X/S).

*Needs:* [1.1](#np-1-1); [0.5](#np-0-5).

**Checks.**

- `Numerical.coneOfCurves_productLines` (computation): For P¹×P¹ over k, N₁ ≅ ℝ² and NE‾ is the closed cone spanned by the classes of the two rulings.
- `Numerical.coneOfCurves_identity` (degenerate): For f = id\_S there are no curves over S: N₁(S/S) = 0 and NE(S/S) = {0}.
- `Numerical.coneOfCurves_relativeRuling` (computation): For the first projection P¹×P¹ → P¹, N₁(X/S) = ℝ·[fibre] and NE‾ is its nonnegative ray.
- `Numerical.coneOfCurves_not_closed` (non-example): NE(X/S) itself need not be closed (on suitable abelian or K3 surfaces it is a round cone with irrational boundary); the closure is part of the definition.
- For P¹×P¹ over k, NE‾ is spanned by the two rulings.
- For S = X, N₁ = 0.


<a id="np-1-3"></a>

### 1.3 Numerical Néron–Severi theorem for proper schemes over a field

Prove. Let X be proper over a field k. Then Num(X/k) is a free abelian group of finite rank, and rank Num(X/k) ≤ ρ(X\_{k̄}) := rank Num(X\_{k̄}/k̄). For k algebraically closed and ℓ a prime invertible in k, ρ(X) ≤ dim\_{𝔽\_ℓ} H²\_ét(X, μ\_ℓ).

*Hypotheses.* X proper over a field; the étale bound needs ℓ invertible in k and k algebraically closed.

*Source.* Kleiman, The Picard scheme, Remark 6.19, pp. 59–60: For proper X/S the rank of the Néron–Severi group Pic/Pic^τ of geometric fibres is finite and bounded; the proof is in SGA 6, Exposé XIII, Theorem 5.1.; Bhatt et al. 2023, Remark 2.22, p. 19: Finite-dimensionality of N¹ over a field is Kleiman 1966, §4, Proposition 2.; SGA 6, Exposé XIII, Exposé XIII, Theorem 5.1: The Néron–Severi group of a proper scheme over an algebraically closed field is finitely generated (theorem of the base).

*Proof sketch.* Num(X/k) ↪ Num(X\_{k̄}/k̄) (1.1, base-change API), so assume k = k̄. Rank bound: if b\_1, …, b\_r ∈ Num are ℤ-independent, choose curves C\_1, …, C\_r with det((b\_i·C\_j)) ≠ 0; the image of Num → ℤ^r, L ↦ ((L·C\_j))\_j, is a lattice of rank r, so dim\_{𝔽\_ℓ} Num/ℓNum ≥ r. Num/ℓ is a quotient of Pic(X)/ℓ, which injects into H²\_ét(X, μ\_ℓ) by the Kummer sequence; that group is finite for X proper over k = k̄. Freeness: with r = rank Num, choose curves with det((b\_i·C\_j)) ≠ 0 for a ℚ-basis b\_i; L ↦ ((L·C\_j)) is injective on the torsion-free Num, so Num embeds in ℤ^r. Characteristic-free alternative: Num(X) is a quotient of NS(X) = Pic(X)/Pic⁰(X) (Pic⁰ ⊂ Pic^τ), finitely generated by the theorem of the base (SGA 6, Exposé XIII, Theorem 5.1). In characteristic zero this recovers AbundanceStatement Layer 4B item 2 for projective varieties; for smooth projective surfaces it recovers SchemeAndStackFoundations §5.10's Num.free\_finiteRank.

*Needs:* [1.1](#np-1-1); [0.3](#np-0-3); SchemeAndStackFoundations Layer 2; SchemeAndStackFoundations Layer 5.

**Checks.**

- ρ(P^n\_k) = 1.
- For an elliptic curve E over k̄, ρ(E × E) = 2 + rank End(E) ∈ {3, 4, 6}, the value 6 occurring only for supersingular E in positive characteristic.


<a id="np-1-4"></a>

### 1.4 Finite-dimensionality of N¹(X/S) over a Noetherian base

Prove. For f : X → S proper with S Noetherian, Num(X/S) is a free abelian group of finite rank, so N¹(X/S) is finite-dimensional and ρ(X/S) < ∞.

*Hypotheses.* f proper, S Noetherian.

*Source.* Bhatt et al. 2023, Remark 2.22, p. 19: N¹(X/S) is finite-dimensional for proper morphisms of Noetherian schemes by the arguments of Kleiman 1966 for varieties over a field.; Kleiman, The Picard scheme, Theorem 6.16 and proof, pp. 58–59: In flat projective families the locus where a family of invertible sheaves is τ-trivial is open and closed, by local constancy of Euler characteristics.

*Proof sketch.* Noetherian induction on S: by generic flatness choose a dense open U ⊂ S over whose connected components f is flat; on a connected U, χ(L\_s^{⊗p}(n)) is locally constant in s for each p, n, and these Euler characteristics detect numerical triviality of a fibre (Kleiman, Theorem 6.3 and its use in Theorem 6.16), so L ≡\_{f\_U} 0 iff L\_{η} ≡ 0 at the generic point η of each component of U. Hence Num(X\_U/U) ↪ ⊕\_η Num(X\_η/κ(η)), finitely generated free by 1.3, and Num(X/S) ↪ Num(X\_U/U) ⊕ Num(X\_Z/Z) for Z = S ∖ U closed, which is finitely generated by induction. Torsion-freeness (1.1) gives freeness.

*Needs:* [1.3](#np-1-3); [0.5](#np-0-5); SchemeAndStackFoundations Layer 4; JacobianChallenge Layer C.

**Checks.**

- For S = Spec k this is 1.3.
- ρ(X/S) ≤ ρ(X/k) for X proper over a field and S proper over k.


<a id="np-1-5"></a>

### 1.5 Relatively nef invertible sheaves and ℝ-Cartier classes

Define `Numerical.IsRelNef`. For f : X → S proper with S Noetherian, L ∈ Pic(X) (or a class in N¹(X/S)) is f-nef if (L·C) ≥ 0 for every curve C over S, equivalently if [L] lies in the nef cone Nef(X/S) := {α ∈ N¹(X/S) : α·γ ≥ 0 for γ ∈ NE‾(X/S)}. A ℚ- or ℝ-Cartier divisor is f-nef if its class is.

*Hypotheses.* f proper, S Noetherian; testing over closed points of S.

*Source.* Bhatt et al. 2023, §2.5, paragraph before Remark 2.22, p. 18: An ℝ-Cartier divisor is f-nef when its degree on every integral curve over Z is nonnegative.; Witaszek 2022, §2, p. 7: L is S-nef when its degree on every integral proper curve in a fibre is nonnegative, degrees over that fibre's residue field.

*Construction.* Nonnegativity on curves extends to NE(X/S) by linearity and to NE‾ by continuity of the pairing; so the two descriptions agree. Testing over all points of S is equivalent: the specialization argument of 0.5 transports a degree on a curve over a nonclosed point to a nonnegative combination of degrees over a closed point.

*Uses.* Witaszek 2022, §§2, 5–6; Bhatt et al. 2023, §§2.8, 9: nef line bundles in Keel-type base point free and EWM theorems; Hacon–Witaszek 2023, §6: nefness of a lifted class on the generic fibre (5.5); Cascini–Tanaka 2020, Lemma 2.17: hypothesis of vertical descent (5.7); AbundanceStatement Layer 4C: absolute nef cone in characteristic zero, which this specialises to.

The API:

- `Numerical.IsRelNef` (data): f-nefness of L ∈ Pic(X), of α ∈ N¹(X/S) and of ℚ/ℝ-Cartier divisors.
- `Numerical.nefCone` (data): Nef(X/S) ⊂ N¹(X/S), the dual of NE‾(X/S); closed and convex.
- `Numerical.IsRelNef.iff_cone` (characterisation): L is f-nef iff [L] ∈ Nef(X/S).
- `Numerical.IsRelNef.add` (relation): Nef classes are closed under addition and positive scaling; numerically trivial classes are nef.
- `Numerical.IsRelNef.pullback` (functoriality): If g : X′ → X is an S-morphism of proper S-schemes and L is f-nef then g\*L is nef; the converse holds for g surjective.
- `Numerical.IsRelNef.baseChange` (functoriality): Nefness is preserved by base change T → S of Noetherian schemes and detected on geometric fibres.
- `Numerical.IsRelNef.eq_abundance` (compatibility): For S = Spec k, k algebraically closed of characteristic zero, X a projective variety, f-nefness is AbundanceStatement Layer 4C's nefness.

*Needs:* [1.2](#np-1-2); [0.5](#np-0-5).

**Checks.**

- `Numerical.IsRelNef_projectiveLine` (computation): On P¹\_k, O(m) is nef iff m ≥ 0.
- `Numerical.IsRelNef_identity` (degenerate): For f = id\_S every invertible sheaf is f-nef (there are no curves over S).
- `Numerical.IsRelNef_blowup` (non-example): On Bl\_p P² the exceptional curve E has O(E)·E = −1, so O(E) is not nef although it is effective.
- `Numerical.IsRelNef_relativeRuling` (computation): For the first projection P¹×P¹ → P¹, O(a,b) is f-nef iff b ≥ 0, with a arbitrary.
- On P¹\_k, O(m) is nef iff m ≥ 0.
- Numerically trivial classes are nef.


<a id="np-1-6"></a>

### 1.6 Big invertible sheaves on integral proper schemes over a field

Define `Numerical.IsBig`. Let V be an integral proper scheme of dimension n over a field k. An invertible sheaf L on V is big if there is c > 0 with h⁰(V, L^{⊗m}) ≥ c·m^n for all sufficiently large and divisible m. Top intersection numbers (L^n·V) are the n-fold numerical intersections of SchemeAndStackFoundations §5.3 / Stacks §33.45. For a nef L, L is big iff (L^n·V) > 0.

*Hypotheses.* V integral and proper over a field; nefness is with respect to Spec k.

*Source.* Witaszek 2022, §2, p. 7: Relative bigness on integral X is growth of sections of L^k on the generic fibre at rate k^{dim}, for sufficiently large divisible k.; Lazarsfeld 2004, Theorem 2.2.16 and Corollary 1.4.41: A nef divisor on a projective variety is big iff its top self-intersection is positive; Fujita's vanishing bounds the higher cohomology of nef twists.

*Construction.* The criterion for nef L: asymptotic Riemann–Roch gives h⁰(L^{⊗m}) − h¹(L^{⊗m}) + … = (L^n)m^n/n! + O(m^{n−1}), and for nef L the higher cohomology is O(m^{n−1}) (Fujita vanishing, or the Kleiman-type estimate), so bigness is (L^n) > 0. Bigness depends only on the numerical class for nef L (by the criterion), but not in general.

*Uses.* Hacon–Witaszek 2023, §6 (nef and big transfer): 5.5 transfers nef and big from the special to the generic fibre; Witaszek 2022, §2 and Bhatt et al. 2023, §2.8: the exceptional locus E(L) is the union of subvarieties on which L is not big.

The API:

- `Numerical.IsBig` (data): Bigness of an invertible sheaf on an integral proper k-scheme.
- `Numerical.IsBig.iff_topIntersection_of_nef` (characterisation): For nef L, L is big iff (L^n·V) > 0.
- `Numerical.IsBig.pow` (relation): L is big iff L^{⊗m} is big for some (every) m ≥ 1.
- `Numerical.IsBig.fieldExtension` (compatibility): For K/k with V\_K integral, L is big iff L\_K is big (flat base change of H⁰).

*Needs:* [1.5](#np-1-5); SchemeAndStackFoundations Layer 5; JacobianChallenge Layer B.

**Checks.**

- `Numerical.IsBig_projectiveSpace` (computation): O(1) on P^n\_k is big; h⁰(O(m)) = binom(m+n, n).
- `Numerical.IsBig_trivial` (degenerate): O\_V is big iff dim V = 0.
- `Numerical.IsBig_productPullback` (non-example): On P¹×P¹, the pullback O(1,0) of O(1) along a projection is nef with (O(1,0)²) = 0 and is not big.
- O(1) on P^n is big; O on a positive-dimensional V is not big.


### Dependencies

This layer uses Layer 0, SchemeAndStackFoundations Layer 2, SchemeAndStackFoundations Layer 4, SchemeAndStackFoundations Layer 5, JacobianChallenge Layer B, JacobianChallenge Layer C.


## Layer 2: The Picard scheme of a proper scheme over a field and the numerical local system

\*\*Targets.\*\* Representability of Pic\_{X/k} for an arbitrary proper k-scheme (Murre–Oort, Kleiman Corollary 4.18.3), with no condition on H⁰(X, O\_X); the affinization X^aff and h\_\*G\_m; torsion of Brauer groups of finite algebras and the Leray obstruction Pic(X) → Pic\_{X/k}(k) → Br(X^aff) (Schröer Lemma 1.4); the torsion component Pic^τ\_{X/k} open, closed, of finite type, with points the numerically trivial classes; the étale local system Num\_{X/k} with stalk ℤ^ρ and constancy; norms along finite field extensions and torsion of split Pic^τ-torsors; Schröer's positive-power criterion (Lemma 1.1, with d ≥ 1); the doubling lift through a 2-torsion kernel; finiteness of rational τ-classes over finite fields and torsion of numerically trivial sheaves over algebraic extensions of finite fields.


<a id="np-2-1"></a>

### 2.1 The Picard scheme of a proper scheme over a field (Murre–Oort)

Prove. Let X be a proper scheme over a field k, not necessarily reduced, connected or equidimensional, and without assuming H⁰(X, O\_X) = k. The fppf sheafification Pic\_{X/k} of T ↦ Pic(X\_T) on k-schemes (equivalently of T ↦ Pic(X\_T)/Pic(T)) is represented by a commutative group scheme, locally of finite type and separated over k, which is a disjoint union of open quasi-projective subschemes. Formation of Pic\_{X/k} commutes with every field extension K/k.

*Hypotheses.* X proper over a field; no condition on H⁰(X, O\_X), reducedness or connectedness.

*Source.* Kleiman, The Picard scheme, Corollary 4.18.3 and the following paragraphs, pp. 34–35; Proposition 4.17, p. 33: If X is complete over a field, Pic\_{X/k} exists, represents the fppf Picard functor and is a disjoint union of open quasi-projective subschemes (Murre, Oort, Grothendieck); if it exists it is locally of finite type.; Schröer 2023, §1, p. 4: Uses the Picard scheme of an arbitrary proper scheme over a field, allowing nonreduced, reducible or non-equidimensional X.

*Proof sketch.* For X projective and geometrically integral this is JacobianChallenge Layer D's projective Picard representability; for proper flat X with universal functions over a general base it is the algebraic-space theorem ComplexComparisonPartII §C3.2d.2 relative\_picard\_algebraicSpace, which does not apply when H⁰(X, O\_X) ≠ k. Nilpotent dévissage (Oort): for X\_red ⊂ X with ideal I, filter by powers of I; each step Pic(X\_{n+1,T}) → Pic(X\_{n,T}) has kernel and cokernel controlled by H¹ and H² of the coherent sheaf I^n/I^{n+1} ⊗ O\_T, so Pic\_{X/k} → Pic\_{X\_red/k} is relatively representable with affine unipotent kernel. Reduced X: Chow's lemma (SchemeAndStackFoundations §4.12) gives a projective X′ → X surjective; Grothendieck's relative representability (Kleiman, Theorem 4.18.5) makes Pic\_{X/k} → Pic\_{X′/k} representable of finite type; X′ is handled by the projective case component by component together with the finite étale constants H⁰(X′, O). Local finite type follows from Kleiman, Proposition 4.17; separatedness holds for any group scheme over a field; base change is formation of fppf sheafification.

*Needs:* JacobianChallenge Layer D; AlgebraicModuliForArithmeticGeometry §7.6.1 `relativePicardSheaf`; ComplexComparisonPartII §C3.2d.2 `relative_picard_algebraicSpace`; SchemeAndStackFoundations Layer 4; SchemeAndStackFoundations Layer 1; ComplexComparisonPartII §§C3.2d–C3.2e.

**Checks.**

- Pic\_{P¹\_k/k} ≅ ∐\_{d∈ℤ} Spec k.
- For X = P¹\_ℂ viewed over ℝ, Pic\_{X/ℝ} is the Weil restriction of ℤ\_ℂ: its ℝ-points are ℤ and its ℂ-points ℤ².
- For X = Spec k[ε]/(ε²), Pic(X\_T) = 0 for local T, so Pic\_{X/k} is the trivial group scheme although H⁰(X, O\_X) ≠ k.


<a id="np-2-2"></a>

### 2.2 The affinization X^aff and the sheaf h\_\*G\_m

Construct `Picard.affinization`. For h : X → Spec k proper, X^aff := Spec H⁰(X, O\_X), a finite k-algebra, with the canonical morphism X → X^aff (Stein factorization of h). For every k-algebra A, Γ(X\_A, O) = H⁰(X, O\_X) ⊗\_k A, so h\_\*G\_{m,X} = (X^aff → Spec k)\_\*G\_m as fppf sheaves on k-schemes: the Weil restriction of G\_m from the finite algebra H⁰(X, O\_X).

*Hypotheses.* X proper over a field k.

*Source.* Schröer 2023, Lemma 1.4 and proof, pp. 7–8: Introduces X^aff = Spec H⁰(X, O\_X), a finite k-algebra, and identifies the direct images of G\_a and G\_m on X and X^aff using flat base change for the quasi-compact separated X.

*Construction.* Finite-dimensionality of H⁰(X, O\_X) (JacobianChallenge Layer C) and flat base change of coherent cohomology (SchemeAndStackFoundations §2.6) give the formula for Γ(X\_A, O). Units of H⁰(X, O\_X) ⊗ A define the fppf sheaf h\_\*G\_m; the Stein factorization X → X^aff → Spec k is SchemeAndStackFoundations §4.9's stein\_factorization.

*Uses.* Schröer 2023, Lemma 1.4: reduces the Leray obstruction H²(k, h\_\*G\_m) to the Brauer group of a finite algebra; this roadmap 2.4 and 2.3: the target of the Picard obstruction; 3.1: X → X^aff is the contraction onto the affine part of the Stein factorisation of the structure morphism.

The API:

- `Picard.affinization` (data): X^aff = Spec H⁰(X, O\_X) with the morphism X → X^aff.
- `Picard.affinization_finite` (other): H⁰(X, O\_X) is a finite k-algebra, so X^aff is finite over k (a finite product of Artin local k-algebras).
- `Picard.affinization_baseChange` (functoriality): (X\_A)^aff = (X^aff)\_A for every k-algebra A, compatibly with the canonical maps.
- `Picard.directImage_units` (equivalence): h\_\*G\_{m,X} ≅ (X^aff → Spec k)\_\*G\_m as fppf sheaves of groups.
- `Picard.affinization_contraction` (characterisation): X → X^aff is a contraction (O\_{X^aff} ≅ (X → X^aff)\_\*O\_X) and is universal among morphisms from X to affine k-schemes.

*Needs:* JacobianChallenge Layer C; SchemeAndStackFoundations Layer 2; SchemeAndStackFoundations Layer 4.

**Checks.**

- `Picard.affinization_projectiveLine` (computation): For X = P¹\_k, X^aff = Spec k.
- `Picard.affinization_realForm` (computation): For X = P¹\_ℂ viewed over ℝ, X^aff = Spec ℂ, a field extension of degree 2.
- `Picard.affinization_affine` (degenerate): For X = Spec B with B finite over k, X^aff = X.
- `Picard.affinization_disjoint` (computation): For X = P¹\_k ⊔ P¹\_k, X^aff = Spec(k × k); h\_\*G\_m ≅ G\_m × G\_m.
- `Picard.affinization_ne_reduced` (non-example): For X = P¹ × Spec k[ε]/(ε²), X^aff = Spec k[ε]/(ε²) is not reduced; replacing it by its reduction changes h\_\*G\_m by the unipotent factor 1 + εA.
- X^aff = Spec k when H⁰(X, O\_X) = k (for instance X geometrically integral).


<a id="np-2-3"></a>

### 2.3 Cohomological Brauer groups of finite algebras over a field are torsion

Prove. Let R be a finite k-algebra and h : Spec R → Spec k. Then R^i h\_\*G\_m = 0 (fppf, equivalently étale) for i = 1, 2, so the Leray edge map H²(Spec k, h\_\*G\_m) → H²(Spec R, G\_m) is bijective. Restriction H²(Spec R, G\_m) → H²(Spec R\_red, G\_m) is bijective and R\_red = ∏\_i K\_i is a finite product of finite field extensions of k, so H²(Spec R, G\_m) ≅ ⊕\_i Br(K\_i) is a torsion group.

*Hypotheses.* R finite over a field k; cohomology is étale (= fppf) cohomology with G\_m coefficients.

*Source.* Schröer 2023, Lemma 1.4 and proof, pp. 7–8: H²(S, h\_\*G\_m) = Br(X^aff) is torsion: R¹ vanishes by semilocality of finite algebras, R² by strict henselization over a separable closure, and Br of the reduction is a sum of field Brauer groups.; atlas paper extraction, PAPER-SCHROER-23/E22: The Leray edge map runs from H²(S, h\_\*G\_m) to H²(X, G\_m); the printed direction is reversed.

*Proof sketch.* i = 1: for every finite k-algebra A, R ⊗\_k A is semilocal, so its Picard group vanishes (Mathlib: a commutative ring with finitely many maximal ideals has trivial Pic). i = 2: R ⊗\_k k^sep is a finite product of strictly henselian Artin local rings, on which H²(−, G\_m) vanishes; a class dies over a finite subextension, so the sheaf R²h\_\*G\_m is zero. Nilpotent invariance: 1 + I is a successive extension of quasi-coherent sheaves for a nilpotent ideal I, whose higher cohomology vanishes on the affine Spec R; hence H²(R, G\_m) ≅ H²(R\_red, G\_m). Br of a field is torsion (SchemeAndStackFoundations §2.22 and §2.15: Galois cohomology of G\_m in degree 2 is torsion).

*Needs:* [2.2](#np-2-2); Mathlib `CommRing.Pic`; SchemeAndStackFoundations §2.22 (Brauer groups of schemes); SchemeAndStackFoundations Layer 2.

**Checks.**

- For R = ℂ over ℝ, H²(ℝ, h\_\*G\_m) = Br(ℂ) = 0.
- For R = k[ε]/(ε²), H²(R, G\_m) = Br(k).


<a id="np-2-4"></a>

### 2.4 The Brauer obstruction to representing points of Pic\_{X/k}

Prove. Let h : X → Spec k be proper. The fppf Leray spectral sequence for h and G\_m gives an exact sequence 0 → Pic(X) → Pic\_{X/k}(k) → H²(k, h\_\*G\_m) ≅ Br(X^aff) → H²(X, G\_m), with the first map the canonical one. Since Br(X^aff) is torsion, for every λ ∈ Pic\_{X/k}(k) there is n ≥ 1 with n·λ the class of an invertible sheaf on X. For every field K ⊃ k the map Pic(X\_K) → Pic\_{X/k}(K) is injective.

*Hypotheses.* X proper over a field; H⁰(X, O\_X) arbitrary.

*Source.* Schröer 2023, proof of Lemma 1.1, p. 5: The Leray–Serre sequence for h and G\_m gives H¹(X, G\_m) → H⁰(S, R¹h\_\*G\_m) → H²(S, h\_\*G\_m) with left arrow the canonical map, and torsion of the right term makes a multiple of every rational point come from an invertible sheaf.; Kleiman, The Picard scheme, Theorem 2.5 and Remark 2.11, pp. 17–21: The comparison of Picard functors and the Leray description of the obstruction between Pic(X\_T)/Pic(T) and the sheafified Picard functor.

*Proof sketch.* R¹h\_\*G\_m is the fppf Picard sheaf Pic\_{X/k} (Hilbert 90, SchemeAndStackFoundations §2.11), and h\_\*G\_m = (X^aff → Spec k)\_\*G\_m (2.2). The five-term sequence 0 → H¹(k, h\_\*G\_m) → H¹(X, G\_m) → H⁰(k, R¹h\_\*G\_m) → H²(k, h\_\*G\_m) → H²(X, G\_m) has H¹(k, h\_\*G\_m) = Pic(X^aff) = 0 (2.3, i = 1). H²(k, h\_\*G\_m) ≅ Br(X^aff) is torsion by 2.3. When H⁰(X, O\_X) = k this is ComplexComparisonPartII §C3.2d.4 picard\_brauer\_obstruction over T = Spec k.

*Needs:* [2.1](#np-2-1); [2.2](#np-2-2); [2.3](#np-2-3); ComplexComparisonPartII §C3.2d.4 `picard_brauer_obstruction`; SchemeAndStackFoundations Layer 2.

**Checks.**

- For the pointless real conic X, Pic(X) = 2ℤ ⊂ Pic\_{X/ℝ}(ℝ) = ℤ, the cokernel ℤ/2 = Br(ℝ) and n = 2 works.
- For X = P¹\_ℂ over ℝ, X^aff = Spec ℂ, Br(ℂ) = 0 and Pic(X) = Pic\_{X/ℝ}(ℝ) = ℤ.


<a id="np-2-5"></a>

### 2.5 The torsion component Pic^τ\_{X/k} is open, closed and of finite type

Prove. Let X be proper over k and G = Pic\_{X/k}. Put Pic^τ\_{X/k} := ⋃\_{n≥1} [n]^{-1}(G⁰), with G⁰ the identity component. Then Pic^τ\_{X/k} is an open and closed subgroup scheme of finite type, its formation commutes with every field extension, and for every field K ⊃ k and L ∈ Pic(X\_K), the class of L lies in Pic^τ\_{X/k}(K) iff L is numerically trivial on X\_K. In particular Pic^τ\_{X/k}(k̄) = Pic^τ(X\_{k̄}/k̄) of 0.4 (Pic\_{X/k}(k̄) = Pic(X\_{k̄}) over an algebraically closed field).

*Hypotheses.* X proper over a field; the τ-numerical comparison uses 0.3.

*Source.* Kleiman, The Picard scheme, Definition 6.8, Lemma 6.9, Exercise 6.11, Proposition 6.12 and Remark 6.14, pp. 56–58: G^τ is the union of preimages of G⁰ under the power maps, an open group subscheme compatible with field extension; for the Picard scheme of a complete scheme it is closed of finite type and its points are the τ-equivalent, equivalently numerically trivial, sheaves.; Schröer 2023, §1, p. 4: Pic^τ\_{X/k} parametrises numerically trivial sheaves, is of finite type and separated, citing SGA 6 Exposé XII Corollary 1.5 and Exposé XIII Theorem 4.7.; SGA 6, Exposé XIII, Exposé XIII, Theorem 4.7: Pic^τ of a proper scheme over a field is an open and closed subgroup scheme of finite type.

*Proof sketch.* G⁰ is an open and closed subgroup of finite type compatible with field extension (group schemes locally of finite type over a field); [n]^{-1}(G⁰) are open and closed subgroups, so G^τ is an open subgroup compatible with field extension (Kleiman, Lemma 6.9). Over k̄, membership of λ in G^τ is τ-equivalence of L with O\_X, which is numerical triviality (Kleiman, Exercise 6.11, Theorem 6.3; for complete X, Remark 6.14 via Chow's lemma and the projection formula). Quasi-compactness: numerically trivial invertible sheaves on a projective scheme over k̄ form a bounded family (Kleiman, Theorem 6.3 and Proposition 6.12); for proper X pull back to a Chow cover X′ → X, whose induced map on Picard schemes is of finite type (Kleiman, Theorem 4.18.5), so Pic^τ is closed and of finite type. Over k̄, every k̄-point of Pic\_{X/k} is represented by an invertible sheaf (2.4 with Br(X^aff\_{k̄}) = 0).

*Needs:* [2.1](#np-2-1); [0.4](#np-0-4); [0.3](#np-0-3); [2.4](#np-2-4); AlgebraicModuliForArithmeticGeometry §7.9 `spaceSectionComponentCriterion` and ComplexComparisonPartII §C3.2f.2; ComplexComparisonPartII §§C3.2d–C3.2e.

**Checks.**

- Pic^τ\_{P¹/k} = 0; for an elliptic curve Pic^τ = Pic⁰ ≅ E; for an Enriques surface over k̄ of characteristic ≠ 2, Pic⁰ = 0 and Pic^τ ≅ ℤ/2.
- For an ordinary Enriques surface in characteristic 2, Pic^τ = μ₂ is connected and nonreduced, so Pic^τ = Pic⁰ with its full structure.


<a id="np-2-6"></a>

### 2.6 The local system of numerical classes Num\_{X/k}

Construct `Picard.NumLocalSystem`. For X proper over a field k put Num\_{X/k} := Pic\_{X/k}/Pic^τ\_{X/k} (fppf quotient). It is an étale group scheme over k, determined by the Galois module Num\_{X/k}(k^sep) = Num\_{X/k}(k̄) = Num(X\_{k̄}/k̄) ≅ ℤ^{ρ} with ρ = ρ(X\_{k̄}) ≥ 0, on which Gal(k^sep/k) acts continuously through a finite quotient. The class map Pic(X) → Num(X/k) → Num\_{X/k}(k) is injective on Num(X/k).

*Hypotheses.* X proper over a field; ρ = 0 is allowed.

*Source.* Schröer 2023, §1, pp. 4–5: Num\_{X/k} = Pic\_{X/k}/Pic^τ\_{X/k} is an étale group scheme, the local system of numerical classes, corresponding to the Galois representation on Num\_{X/k}(k^sep) = Num\_{X/k}(k^alg) = ℤ^ρ; ρ = 0 occurs; the group schemes exist without reducedness, irreducibility or equidimensionality.

*Construction.* Pic^τ\_{X/k} is open, so the quotient of the locally finite type group Pic\_{X/k} by it is étale (its geometric fibre is the discrete group of components modulo those of Pic^τ). Over k̄: Num\_{X/k}(k̄) = Pic(X\_{k̄})/Pic^τ(X\_{k̄}/k̄) = Num(X\_{k̄}/k̄) by 2.5; this is free of finite rank by 1.3. Purely inseparable extensions do not change points of an étale scheme, so the k^sep- and k̄-points agree. A finitely generated free ℤ-module with continuous action of a profinite group has open stabiliser, so the action factors through a finite quotient. Injectivity of Num(X/k) → Num\_{X/k}(k): if [L] ∈ Pic^τ\_{X/k}(k) then L\_{k̄} is numerically trivial, hence L is (0.3).

*Uses.* Schröer 2023, Lemma 1.1, Proposition 1.2, Theorems 1.3 and 2.1: constancy of Num\_{X/k} is the hypothesis of every descent statement; Schröer 2023, §§5, 7: the relative Num of an Enriques family and the point count of a surface with constant Num; EnriquesSurfacesAndIntegralNonexistence Layers 2–3: Num ≅ (ℤ¹⁰)\_S and constant numerical Picard over finite fields and ℤ; WeilConjectures WC.7: point count #X(F\_{q^r}) = 1 + b₂q^r + q^{2r} for surfaces with constant Num.

The API:

- `Picard.NumLocalSystem` (data): Num\_{X/k} := Pic\_{X/k}/Pic^τ\_{X/k}, an étale commutative group scheme over k.
- `Picard.NumLocalSystem.galoisModule` (equivalence): Étale group schemes over k ≃ discrete Gal(k^sep/k)-modules sends Num\_{X/k} to Num(X\_{k̄}/k̄) with its Galois action.
- `Picard.NumLocalSystem.stalk_free` (other): Num\_{X/k}(k^sep) is free abelian of rank ρ(X\_{k̄}), and equals Num\_{X/k}(k̄).
- `Picard.NumLocalSystem.classMap_injective` (other): Num(X/k) → Num\_{X/k}(k) is injective.
- `Picard.NumLocalSystem.baseChange` (functoriality): Num\_{X\_K/K} = (Num\_{X/k})\_K for every field extension K/k.
- `Picard.NumLocalSystem.pullback` (functoriality): A k-morphism g : X′ → X of proper k-schemes induces g\* : Num\_{X/k} → Num\_{X′/k}, functorially; injective on stalks when g is surjective.

*Needs:* [2.5](#np-2-5); [1.3](#np-1-3); [1.1](#np-1-1); Mathlib `IsSepClosure`; Mathlib `separableClosure.isPurelyInseparable`.

**Checks.**

- `Picard.NumLocalSystem_projectiveLine` (computation): Num\_{P¹\_k/k} ≅ ℤ\_k, the constant group scheme, generated by the class of O(1).
- `Picard.NumLocalSystem_realForm` (computation): For X = P¹\_ℂ viewed over ℝ, Num(X\_ℂ) = ℤ² with complex conjugation exchanging the two factors: Num\_{X/ℝ} is not constant.
- `Picard.NumLocalSystem_point` (degenerate): For X = Spec K with K/k finite, Num\_{X/k} = 0 and ρ = 0.
- `Picard.NumLocalSystem_isolatedPoint` (computation): For X = P¹\_ℝ ⊔ Spec ℂ over ℝ, Num\_{X/ℝ} ≅ ℤ\_ℝ is constant: zero-dimensional components contribute nothing.
- `Picard.NumLocalSystem_conic` (non-example): For the pointless real conic, Num\_{X/ℝ}(ℝ) = ℤ but the image of Pic(X) is 2ℤ: rational points of Num need not come from invertible sheaves.
- For X geometrically integral with a rational point, Pic(X) → Pic\_{X/k}(k) is bijective.


<a id="np-2-7"></a>

### 2.7 Constant numerical local system

Define `Picard.IsConstantNum`. Num\_{X/k} is constant if Gal(k^sep/k) acts trivially on Num\_{X/k}(k^sep); equivalently Num\_{X/k} ≅ (ℤ^{⊕ρ})\_k = ∐\_{l∈ℤ^ρ} Spec k as group schemes.

*Hypotheses.* X proper over a field.

*Source.* Schröer 2023, §1, p. 5: A constant local system means the Galois representation Gal(k^sep/k) → GL\_ρ(ℤ) is trivial, equivalently Num\_{X/k} is the disjoint union of copies of Spec k indexed by ℤ^ρ.

*Construction.* The equivalence is the étale–Galois dictionary of 2.6: a trivial Galois module corresponds to a constant étale group scheme.

*Uses.* Schröer 2023, Theorems 1.3 and 2.1: the hypothesis under which contractions and fibre graphs descend; EnriquesSurfacesAndIntegralNonexistence Layers 2–3: constant Num of Enriques surfaces over finite fields and over ℤ.

The API:

- `Picard.IsConstantNum` (data): The predicate that Gal(k^sep/k) acts trivially on Num\_{X/k}(k^sep).
- `Picard.IsConstantNum.iff_iso_constant` (characterisation): IsConstantNum X ↔ Num\_{X/k} ≅ (ℤ^ρ)\_k.
- `Picard.IsConstantNum.iff_finiteIndex` (characterisation): IsConstantNum X ↔ the image of Num(X/k) in Num(X\_{k̄}) has finite index (2.10).
- `Picard.IsConstantNum.baseChange` (functoriality): Constancy is preserved by every field extension K/k.
- `Picard.IsConstantNum.of_sepClosed` (other): If k is separably closed, Num\_{X/k} is constant.

*Needs:* [2.6](#np-2-6).

**Checks.**

- `Picard.IsConstantNum_projectiveLine` (computation): Num\_{P¹\_k/k} is constant with ρ = 1.
- `Picard.IsConstantNum_realForm` (non-example): Num\_{P¹\_ℂ/ℝ} (P¹\_ℂ as an ℝ-scheme) is not constant: conjugation swaps the two generators of ℤ².
- `Picard.IsConstantNum_rhoZero` (degenerate): If ρ(X\_{k̄}) = 0 (for instance X finite over k), Num\_{X/k} is constant.
- `Picard.IsConstantNum_quadricSurface` (computation): For a smooth quadric surface Q ⊂ P³\_k whose two rulings are defined over a quadratic extension and swapped by Galois, Num\_{Q/k} is not constant though ρ(Q\_{k̄}) = 2; for the split quadric P¹×P¹ it is constant.
- Over a separably closed field every Num\_{X/k} is constant.


<a id="np-2-8"></a>

### 2.8 Norms of Picard classes along a finite field extension

Construct `Picard.picardNorm`. Let E/k be a finite field extension of degree n, X proper over k, pr : X\_E → X and q : Spec E → Spec k. For every k-algebra A, pr\_A : X\_{E⊗A} → X\_A is finite locally free of rank n, and the norm of invertible sheaves Nm\_{pr\_A} : Pic(X\_{E⊗A}) → Pic(X\_A) (SchemeAndStackFoundations §3.5) is natural in A. It induces a homomorphism of fppf sheaves Nm : q\_\*Pic\_{X\_E/E} → Pic\_{X/k} with Nm ∘ pr\* = [n], mapping q\_\*Pic^τ\_{X\_E/E} into Pic^τ\_{X/k}.

*Hypotheses.* E/k finite of degree n; X proper over k.

*Source.* Schröer 2023, proof of Lemma 1.1, p. 5: Besides pullback along the rank-n projection there is a norm map in the other direction with N∘pr\* multiplication by n, referring to EGA II §6.5.; atlas paper extraction, PAPER-SCHROER-23/E20: The norm used in the proof must be taken on the τ-component Pic^τ\_{X′/E} = P ⊗\_k E, not on the whole Picard scheme.

*Construction.* The norm along a finite locally free morphism of constant rank n is a homomorphism with Nm(pr\*L) ≅ L^{⊗n} and commutes with base change (SchemeAndStackFoundations §3.5); naturality in A passes to fppf sheafifications. Nm preserves numerical triviality: on a curve C ⊂ X\_{K}, deg(Nm L|\_C) is a sum of degrees of L on the curves of X\_{E⊗K} over C (projection formula), so Nm maps Pic^τ into Pic^τ.

*Uses.* Schröer 2023, proof of Lemma 1.1: kills Pic^τ-torsor classes split by a finite extension (2.9); Schröer 2023, proof of Lemma 8.4: norms of Picard classes in the isogeny argument consumed by GenusOneFibrations.

The API:

- `Picard.picardNorm` (data): Nm : q\_\*Pic\_{X\_E/E} → Pic\_{X/k}, a homomorphism of fppf sheaves of abelian groups.
- `Picard.picardNorm_comp_pullback` (relation): Nm ∘ pr\* = multiplication by n = [E : k] on Pic\_{X/k}.
- `Picard.picardNorm_tau` (other): Nm maps q\_\*Pic^τ\_{X\_E/E} into Pic^τ\_{X/k}.
- `Picard.picardNorm_lineBundle` (compatibility): On classes of invertible sheaves Nm is SchemeAndStackFoundations §3.5's lineBundleNorm along X\_E → X.
- `Picard.picardNorm_trans` (functoriality): For k ⊂ E ⊂ F, Nm\_{F/k} = Nm\_{E/k} ∘ q\_\*Nm\_{F/E}.

*Needs:* [2.5](#np-2-5); SchemeAndStackFoundations Layer 3; Mathlib `AlgebraicGeometry.Scheme.Hom.finrank`.

**Checks.**

- `Picard.picardNorm_projectiveLine` (computation): For X = P¹\_k, Nm(O\_{P¹\_E}(d)) = O(n·d) and the induced map on Num is multiplication by n.
- `Picard.picardNorm_trivialExtension` (degenerate): For E = k, Nm is the identity.
- `Picard.picardNorm_ne_pullbackInverse` (non-example): For n ≥ 2, Nm is not inverse to pr\*: Nm ∘ pr\* = [n] ≠ id on Pic\_{P¹/k} ≅ ℤ.
- For X = P¹\_k and E/k of degree n, Nm(O\_{P¹\_E}(1)) ≅ O\_{P¹\_k}(n).


<a id="np-2-9"></a>

### 2.9 Pic^τ-torsors split by a field extension of degree n are killed by n

Prove. Let X be proper over k, P = Pic^τ\_{X/k} and l ∈ Num\_{X/k}(k). The fibre T\_l ⊂ Pic\_{X/k} over l is a P-torsor, with class [T\_l] ∈ H¹\_fppf(k, P). If T\_l has a point over a finite extension E/k of degree n, then n·[T\_l] = 0; consequently n·l lifts to a k-point of Pic\_{X/k}.

*Hypotheses.* X proper over a field; E/k finite of degree n; fppf cohomology.

*Source.* Schröer 2023, proof of Lemma 1.1, p. 5: Each rational point of Num is a representable torsor for Pic^τ, trivialised over the residue field of a closed point; the norm and the Leray–Serre sequence show its class has finite order.; atlas paper extraction, PAPER-SCHROER-23/E20: The printed vanishing of R¹pr\_\*P′ is false in general and not needed: injectivity of H¹(k, pr\_\*P′) → H¹(E, P′) from the five-term sequence suffices.

*Proof sketch.* T\_l is a P-torsor because Pic → Num is a P-torsor over each point of the étale Num; a closed point of T\_l with residue field E splits it over E. With P\_E = P ⊗\_k E = Pic^τ\_{X\_E/E} and q : Spec E → Spec k, the five-term sequence for q gives an injection H¹(k, q\_\*P\_E) → H¹(E, P\_E); the class pr\*[T\_l] maps to the split class, hence is zero. Apply Nm : q\_\*P\_E → P (2.8): n·[T\_l] = Nm(pr\*[T\_l]) = 0. A trivial torsor has a rational point, which lifts n·l.

*Needs:* [2.6](#np-2-6); [2.8](#np-2-8); SchemeAndStackFoundations Layer 2.

**Checks.**

- For the pointless real conic and l the generator, T\_l is split by ℂ and 2l lifts (indeed l itself lifts to Pic\_{X/ℝ}(ℝ)).


<a id="np-2-10"></a>

### 2.10 Positive-power descent criterion for constancy of Num

Prove. Let X be proper over a field k. Num\_{X/k} is constant if and only if there is an integer d ≥ 1 such that for every invertible sheaf L on X\_{k̄} there is a numerically trivial invertible sheaf N on X\_{k̄} with L^{⊗d} ⊗ N isomorphic to the pullback of an invertible sheaf on X.

*Hypotheses.* X proper over a field; d ≥ 1 (d = 0 would make the condition vacuous).

*Source.* Schröer 2023, Lemma 1.1 and proof, pp. 5–6: Constancy of Num\_{X/k} is characterised by the existence of a power d such that every geometric invertible sheaf becomes, up to a numerically trivial twist, a pullback from X after raising to the d-th power; sufficiency by finite index, necessity by torsors and the Leray obstruction.; atlas paper extraction, PAPER-SCHROER-23/E1: The printed lemma allows d ≥ 0; with d = 0 the property holds for every X, so d ≥ 1 is required, as the proof uses.

*Proof sketch.* (⇐) The condition says the image of Num(X/k) in Num(X\_{k̄}) ≅ ℤ^ρ contains d·ℤ^ρ, which is Galois-fixed; a group acting by automorphisms of a torsion-free ℤ^ρ and fixing d·ℤ^ρ fixes ℤ^ρ. (⇒) For each l in a basis of Num\_{X/k}(k) = ℤ^ρ, 2.9 gives n ≥ 1 with n·l ∈ image of Pic\_{X/k}(k), and 2.4 gives n′ ≥ 1 with n′n·l ∈ image of Pic(X). Take d the product over a basis; then Pic(X) → Num\_{X/k}(k̄) has image containing d·ℤ^ρ.

*Needs:* [2.9](#np-2-9); [2.4](#np-2-4); [2.7](#np-2-7); Mathlib `DistribMulAction`.

**Checks.**

- For X = P¹\_ℂ over ℝ no d ≥ 1 works (Num not constant), while d = 0 works trivially: this is why d ≥ 1 is required.
- For the pointless real conic, d = 2 works and d = 1 does not.


<a id="np-2-11"></a>

### 2.11 Doubling numerical classes through a 2-torsion kernel

Construct `Picard.doubleLift`. Let 0 → P → Q → N → 0 be an exact sequence of abelian fppf sheaves (in particular of abelian groups) with 2·P = 0. Multiplication by 2 on Q factors uniquely as d ∘ π for a homomorphism d : N → Q, and π ∘ d = [2]\_N. Applied to 0 → Pic^τ\_{Y/S} → Pic\_{Y/S} → Num\_{Y/S} → 0 for a family with 2·Pic^τ = 0 (Enriques families), every section of Num\_{Y/S} has a canonical doubled lift to Pic\_{Y/S}.

*Hypotheses.* 2·P = 0; exactness in the fppf topology (a sheaf quotient N = Q/P).

*Source.* atlas paper extraction, PAPER-SCHROER-23/183 (supplement to Proposition 5.5): For an exact sequence of fppf sheaves with 2-torsion kernel, doubling on the middle term descends to the quotient; applied to Pic^τ → Pic → Num of an Enriques family.

*Construction.* [2] : Q → Q kills P, so it factors uniquely through the sheaf quotient N = Q/P; π ∘ d ∘ π = π ∘ [2] = [2] ∘ π, and π is an epimorphism of sheaves.

*Uses.* EnriquesSurfacesAndIntegralNonexistence E3/local-projectivity: lifting a doubled ample numerical class over a Noetherian local base with a section; Schröer 2023, Proposition 5.5 (repaired): local projectivity of Enriques families.

The API:

- `Picard.doubleLift` (data): d : N → Q with d ∘ π = [2]\_Q.
- `Picard.doubleLift_comp_proj` (relation): π ∘ d = [2]\_N.
- `Picard.doubleLift_unique` (universal-property): d is the unique homomorphism with d ∘ π = [2]\_Q.
- `Picard.doubleLift_natural` (functoriality): d commutes with maps of short exact sequences with 2-torsion kernels and with base change of sheaves.

*Needs:* [2.6](#np-2-6).

**Checks.**

- `Picard.doubleLift_cyclic` (computation): For 0 → 2ℤ/4 → ℤ/4 → ℤ/2 → 0, d(1) = 2 ∈ ℤ/4.
- `Picard.doubleLift_split` (degenerate): For P = 0, d = [2]\_N.
- `Picard.doubleLift_needs_two_torsion` (non-example): For 0 → 2ℤ/8 → ℤ/8 → ℤ/2 → 0 the kernel 2ℤ/8 ≅ ℤ/4 is not killed by 2, and [2] does not factor through ℤ/2, since 2·2 = 4 ≠ 0 in ℤ/8.
- For Q = ℤ/4 ⊃ P = 2ℤ/4, N = ℤ/2 and d(1) = 2.


<a id="np-2-12"></a>

### 2.12 Finiteness of rational τ-classes over finite fields and torsion over locally finite fields

Prove. (a) For X proper over a finite field F\_q, Pic^τ\_{X/F\_q}(F\_{q^r}) is finite for every r ≥ 1. (b) If k is an algebraic extension of a finite field and X is proper over k, every numerically trivial invertible sheaf on X has finite order in Pic(X).

*Hypotheses.* (a) X proper over F\_q; (b) k algebraic over a finite field.

*Source.* Witaszek 2022, proof of Proposition 5.3, using Keel 1999 Lemma 2.16: A numerically trivial line bundle on a projective scheme over an algebraic extension of a finite field is torsion, by finite type of the numerically trivial Picard functor and finiteness of rational points over finite fields.; atlas paper extraction, PAPER-WITASZEK-22/picard-scheme-numerical: The finite-type assertion for numerically trivial line bundles, including the descent to a finite field, is supplied by the numerical Picard roadmap.

*Proof sketch.* (a) Pic^τ is of finite type over F\_q (2.5), so it has finitely many points over each finite field. (b) X and L are defined over a finite subfield F ⊂ k (spreading out, EGA IV 8.8.2); L₀ on X₀ is numerically trivial (0.3), so [L₀] ∈ Pic^τ\_{X₀/F}(F), a finite group by (a). Pic(X₀) → Pic\_{X₀/F}(F) is injective (2.4), so L₀ has finite order, hence so does L.

*Needs:* [2.5](#np-2-5); [2.4](#np-2-4); [0.3](#np-0-3); SchemeAndStackFoundations Layer 0.

**Checks.**

- On an elliptic curve E over F̄\_p every degree-zero invertible sheaf is torsion, since E(F̄\_p) is torsion.
- Over ℚ̄ the analogue of (b) fails: E(ℚ̄) has points of infinite order.


### Dependencies

This layer uses Layer 0, Layer 1, JacobianChallenge Layer D, AlgebraicModuliForArithmeticGeometry Layer 7, ComplexComparisonPartII §§C3.2d–C3.2e, SchemeAndStackFoundations Layer 1, SchemeAndStackFoundations Layer 2, SchemeAndStackFoundations Layer 3, SchemeAndStackFoundations Layer 4.


## Layer 3: Contractions, semiample sheaves and descent of contractions

\*\*Targets.\*\* Contractions (proper, O\_Y ≅ f\_\*O\_X) with Zariski connectedness and Stein factorisation; the rigidity lemma; relatively semiample invertible sheaves and section rings; the dictionary between semiample sheaves and projective contractions, including numerical invariance; spreading out a geometric contraction to a finite extension (EGA IV 8.8.2); purely inseparable descent of contractions to arbitrary proper targets; Schröer's Theorem 1.3: with Num\_{X/k} constant, every geometric contraction with projective target descends; openness of ampleness for proper algebraic spaces with the scheme conclusion (Stacks 0D3A, 0D3D).


<a id="np-3-1"></a>

### 3.1 Contractions

Define `Contraction.IsContraction`. A contraction is a proper morphism f : X → Y of schemes for which O\_Y → f\_\*O\_X is an isomorphism. In the setting of Schröer, X and Y are proper over a field k; over a Noetherian base S, X and Y are proper S-schemes and f is an S-morphism.

*Hypotheses.* f proper; O\_Y ≅ f\_\*O\_X; Y locally Noetherian for the fibre statements.

*Source.* Schröer 2023, §1, p. 6: A contraction of X is a proper scheme Z with a morphism f : X → Z such that O\_Z = f\_\*(O\_X).; atlas paper extraction, PAPER-SCHROER-23/223: Zariski connectedness: a proper morphism of locally Noetherian schemes with O\_Z = f\_\*O\_X is surjective with geometrically connected fibres (EGA III 4.3.1, 4.3.4).

*Construction.* Surjectivity: if y ∉ f(X), then (f\_\*O\_X)\_y = 0 ≠ O\_{Y,y}. Geometric connectedness of the fibres is Zariski's connectedness theorem, SchemeAndStackFoundations §4.9 (stein\_factorization), for locally Noetherian Y. Flat base change of f\_\*O\_X (SchemeAndStackFoundations §2.6) shows that contractions are stable under flat base change, in particular under field extension.

*Uses.* Schröer 2023, Theorem 1.3, Theorem 2.1, §3: contractions of proper schemes and of smooth proper surfaces; connectedness of geometric fibres; Witaszek 2022 and Bhatt et al. 2023 (semiample fibrations, EWM maps): the contraction associated with a semiample line bundle; this roadmap 3.4, 4.4: the objects that descend and that are classified.

The API:

- `Contraction.IsContraction` (data): IsContraction f :↔ f proper ∧ O\_Y → f\_\*O\_X is an isomorphism.
- `Contraction.surjective` (other): A contraction is surjective.
- `Contraction.geometricallyConnected_fibres` (other): Every fibre of a contraction to a locally Noetherian Y is geometrically connected (SchemeAndStackFoundations §4.9).
- `Contraction.comp` (structure): Composites of contractions are contractions; isomorphisms are contractions.
- `Contraction.flatBaseChange` (functoriality): For a flat Y′ → Y, the base change of a contraction is a contraction; in particular contractions of proper k-schemes are stable under field extension.
- `Contraction.stein` (universal-property): Every proper f : X → Y with Y locally Noetherian factors uniquely as a contraction X → Spec\_Y f\_\*O\_X followed by a finite morphism.
- `Contraction.structureMorphism_iff` (characterisation): For X proper over k, X → Spec k is a contraction iff H⁰(X, O\_X) = k.

*Needs:* Mathlib `AlgebraicGeometry.IsProper`; SchemeAndStackFoundations Layer 4; SchemeAndStackFoundations Layer 2.

**Checks.**

- `Contraction.blowup` (computation): The blow-up Bl\_x S → S of a regular surface at a closed point is a contraction with fibre P¹\_{κ(x)} over x.
- `Contraction.projection` (computation): The projection P¹\_k × P¹\_k → P¹\_k is a contraction.
- `Contraction.identity` (degenerate): Every isomorphism is a contraction; Spec k → Spec k is the contraction of a point.
- `Contraction.cuspNormalization_not` (non-example): The normalization 𝔸¹ → Spec k[t², t³] is finite and birational but not a contraction: f\_\*O is k[t] ≠ k[t², t³].
- `Contraction.realForm_not` (non-example): P¹\_ℂ → Spec ℝ is proper with connected fibre but not a contraction, since H⁰ = ℂ ≠ ℝ.
- The blow-up of a regular surface in a closed point is a contraction.
- The structure morphism of P¹\_ℂ regarded over ℝ is not a contraction to Spec ℝ.


<a id="np-3-2"></a>

### 3.2 Rigidity: maps contracting the curves of a contraction factor through it

Prove. Let S be a Noetherian scheme, f : X → Y a contraction of proper S-schemes and g : X → Z an S-morphism to a scheme Z proper over S. If g maps every integral curve contained in a fibre of f to a point, then there is a unique S-morphism h : Y → Z with g = h ∘ f.

*Hypotheses.* f a contraction; X, Y, Z proper over Noetherian S.

*Source.* Debarre 2001, Lemma 1.15: Rigidity lemma: for a proper surjective morphism with connected fibres onto a variety, a morphism contracting one fibre (hence all fibres, by connectedness) factors.; Schröer 2023, proof of Theorem 1.3, pp. 6–7: Uses that the semiample sheaf defining a contraction is unique up to pullbacks of semiample sheaves from the target, and that numerically equivalent sheaves give the same contraction.

*Proof sketch.* Each fibre F = f^{-1}(y) is connected (3.1). If g(F) had positive dimension, some integral curve of F would map onto a curve (lift curves as in 0.6); so g(F) is finite and connected, a single point. Let Γ ⊂ Y ×\_S Z be the scheme-theoretic image of (f, g). The projection π : Γ → Y is proper with finite fibres, hence finite, and O\_Y → π\_\*O\_Γ → f\_\*O\_X = O\_Y with the second map injective (Γ is a scheme-theoretic image) forces π\_\*O\_Γ = O\_Y, so π is an isomorphism. h is the second projection composed with π^{-1}; uniqueness holds because f is surjective and O\_Y = f\_\*O\_X makes f an epimorphism of schemes.

*Needs:* [3.1](#np-3-1); [0.6](#np-0-6); SchemeAndStackFoundations Layer 4.

**Checks.**

- Two contractions X → Y₁, X → Y₂ contracting exactly the same curves are isomorphic under X.
- The hypothesis cannot be weakened to a numerical one without the curves: a map contracting fewer curves need not factor.


<a id="np-3-3"></a>

### 3.3 Semiample invertible sheaves and the section ring

Define `Contraction.IsSemiample`. Let f : X → S be proper with S Noetherian. An invertible sheaf L on X is f-semiample if some L^{⊗m}, m ≥ 1, is f-globally generated: f\*f\_\*L^{⊗m} → L^{⊗m} is surjective. Over S = Spec k this is semiampleness (some positive power globally generated). The section ring is R(X/S, L) := ⊕\_{t≥0} f\_\*L^{⊗t}, a quasi-coherent graded O\_S-algebra; over a field R(X, L) = ⊕\_t H⁰(X, L^{⊗t}) and P(X, L) := Proj R(X, L).

*Hypotheses.* f proper, S Noetherian; m ≥ 1 is required (m = 0 would make every sheaf semiample).

*Source.* Schröer 2023, proof of Theorem 1.3, p. 6: The graded ring R(X, L) = ⊕\_t H⁰(X, L^{⊗t}) and P(X, L) = Proj R(X, L); for semiample L this is projective and gives a contraction.; Witaszek 2022, §2, p. 7: L is relatively semiample over S if some positive tensor power is relatively base point free.

*Construction.* Global generation can be checked on fibres over points of S after the base change theorems, and descends along field extensions by flat base change of H⁰. A globally generated invertible sheaf has nonnegative degree on every curve (restrict a nonvanishing section at a point of the curve), so semiample sheaves are nef.

*Uses.* Schröer 2023, Theorem 1.3: every contraction with projective target comes from a semiample sheaf; descent of the sheaf descends the contraction; Witaszek 2022, Bhatt et al. 2023, §§2.7–2.8 and 9: semiample fibrations in base point free theorems; this roadmap 5.6: descent of relatively semiample, relatively numerically trivial line bundles; AbundanceStatement Layer 5: absolute semiampleness in characteristic zero, which this specialises to.

The API:

- `Contraction.IsSemiample` (data): f-semiampleness: ∃ m ≥ 1 with f\*f\_\*L^{⊗m} → L^{⊗m} surjective.
- `Contraction.sectionRing` (data): R(X/S, L) := ⊕\_{t≥0} f\_\*L^{⊗t}, a graded quasi-coherent O\_S-algebra; over a field, R(X, L) and P(X, L) = Proj R(X, L).
- `Contraction.IsSemiample.pow` (relation): L is semiample iff L^{⊗n} is semiample for some (every) n ≥ 1.
- `Contraction.IsSemiample.nef` (relation): Semiample implies nef (1.5).
- `Contraction.IsSemiample.pullback` (functoriality): Pullbacks of semiample sheaves along S-morphisms of proper S-schemes are semiample.
- `Contraction.IsSemiample.fieldExtension` (compatibility): Over a field, L is semiample iff L\_K is semiample for some (every) extension K/k.
- `Contraction.IsSemiample.of_pullback_base` (other): If L^{⊗m} ≅ f\*M for some m ≥ 1 and M invertible on S, then L is f-semiample.

*Needs:* [1.5](#np-1-5); JacobianChallenge Layer C; StableReduction Layer 2.

**Checks.**

- `Contraction.IsSemiample_projectiveSpace` (computation): O(1) on P^n\_k is semiample, with R(P^n, O(1)) = k[x₀, …, x\_n] and P = P^n.
- `Contraction.IsSemiample_torsion` (degenerate): Every torsion invertible sheaf (in particular O\_X) is semiample, with P(X, L) = X^aff.
- `Contraction.IsSemiample_nontorsion_degreeZero` (non-example): On an elliptic curve over ℂ, O(p − q) of infinite order is nef but not semiample: no positive power has a nonzero section.
- `Contraction.IsSemiample_exceptional` (non-example): On Bl\_p P², O(E) is effective but not semiample (it is not nef).
- O(1) on P^n is semiample; a torsion invertible sheaf is semiample.


<a id="np-3-4"></a>

### 3.4 Semiample sheaves and projective contractions

Prove. Let X be proper over a field k and L a semiample invertible sheaf. (i) R(X, L) is a finitely generated k-algebra, P(X, L) is projective over k and the canonical morphism φ\_L : X → P(X, L) is a contraction; an integral curve C ⊂ X is contracted by φ\_L iff (L·C) = 0. (ii) Every contraction f : X → Z with Z projective over k is isomorphic under X to φ\_L for L = f\*O\_Z(1). (iii) R(X, L) and P(X, L) commute with field extension. (iv) If L, L′ are semiample and numerically equivalent, φ\_L and φ\_{L′} are isomorphic under X.

*Hypotheses.* X proper over a field; L semiample.

*Source.* Schröer 2023, proof of Theorem 1.3, pp. 6–7: For semiample L, P(X, L) is projective and gives a contraction, each contraction with projective target is of this form, and the sheaf is unique up to pullbacks of semiample sheaves on the target.; atlas paper extraction, PAPER-SCHROER-23/216: The dictionary between semiample sheaves and projective contractions, including compatibility with field extension and the numerical invariance used for the Galois norm.

*Proof sketch.* (i) Choose m with L^{⊗m} globally generated, giving ψ : X → P^N; its Stein factorisation X → Y := Spec\_{P^N}(ψ\_\*O\_X) → P^N is a contraction onto a projective Y carrying an ample sheaf whose pullback is L^{⊗m}; the Veronese subring R(X, L^{⊗m}) is the section ring of that ample sheaf, hence finitely generated with Proj equal to Y, and R(X, L) is finite over it, so P(X, L) = Y. Curves with (L·C) = 0 are exactly those mapping to points. (ii) H⁰(X, f\*O\_Z(t)) = H⁰(Z, O\_Z(t)) by the projection formula and O\_Z = f\_\*O\_X, so R(X, f\*O(1)) is the section ring of an ample sheaf on Z and Proj of it is Z. (iii) Flat base change of H⁰ and of Proj. (iv) φ\_L and φ\_{L′} contract exactly the curves of degree zero, which are the same curves; by 3.2 each factors through the other.

*Needs:* [3.3](#np-3-3); [3.1](#np-3-1); [3.2](#np-3-2); AlgebraicModuliForArithmeticGeometry Layer 1; StableReduction Layer 2.

**Checks.**

- For L = O\_{P¹×P¹}(1, 0), φ\_L is the first projection.
- For L = O\_X, φ\_L is X → X^aff.


<a id="np-3-5"></a>

### 3.5 Spreading out a geometric contraction to a finite extension

Prove. Let X be proper over k and f̄ : X\_{k̄} → Ȳ a contraction with Ȳ projective over k̄. There are a finite subextension k ⊂ k′ ⊂ k̄ and a contraction f′ : X\_{k′} → Y′ with Y′ projective over k′, whose base change to k̄ is isomorphic under X\_{k̄} to f̄.

*Hypotheses.* X proper over k; Ȳ projective over k̄.

*Source.* EGA IV₃, Théorème (8.8.2), Numdam PDF p. 27, and (8.10.5): Schemes, morphisms and properties of finite presentation over a filtered limit of rings descend to a finite stage; properness and projectivity descend as well.; Schröer 2023, proof of Theorem 1.3, p. 7: By EGA IV 8.8.2 the given contraction over k^alg is the base change of a contraction with projective target over a finite extension k′.

*Proof sketch.* k̄ is the filtered union of its finite subextensions; Ȳ, the morphism f̄ and a projective embedding descend to some k′ by EGA IV 8.8.2 (finite presentation) and 8.10.5 (properness, projectivity). O\_{Y′} → f′\_\*O\_{X\_{k′}} becomes an isomorphism after the faithfully flat base change to k̄ (flat base change of direct images), hence is one.

*Needs:* [3.1](#np-3-1); SchemeAndStackFoundations Layer 0; SchemeAndStackFoundations Layer 2.

**Checks.**

- If f̄ is already defined over k, k′ = k works.


<a id="np-3-6"></a>

### 3.6 Contractions descend along purely inseparable extensions

Prove. Let k ⊂ k′ be a purely inseparable field extension (possibly infinite), X proper over k and f′ : X\_{k′} → Y′ a contraction with Y′ proper over k′ (no projectivity, no condition on Num). There is a contraction f : X → Y over k, with Y proper over k, such that f′ ≅ f\_{k′} under X\_{k′}.

*Hypotheses.* k′/k purely inseparable; Y′ only proper.

*Source.* Schröer 2023, proof of Theorem 1.3 and the remark after it, p. 7: For a purely inseparable extension any contraction of X ⊗ k′ to a proper scheme descends, with no assumption on Num: the topological space is forced, the structure sheaf is f\_\*O\_X, and properness descends.; atlas paper extraction, PAPER-SCHROER-23/E2 and /E21: In the printed proof the preimage U′ = f′^{-1}(V) should read f′^{-1}(V′), and the continuous map |X′| → |Y′| is f′, not f.

*Proof sketch.* pr : X\_{k′} → X is a universal homeomorphism (SchemeAndStackFoundations §0.23); put |Y| := |Y′|, f := f′ on spaces and O\_Y := f\_\*O\_X, giving a ringed space Y with a morphism X → Y. Locally: for an affine open V′ ⊂ Y′ with preimage U′ = f′^{-1}(V′) and corresponding U ⊂ X, f′\_\*O = O makes U′ → V′ = Spec Γ(U′, O) the affine hull; Γ(U′, O) = Γ(U, O) ⊗\_k k′ shows U′ → V′ is the base change of U → V = Spec Γ(U, O), and V′ → V is a homeomorphism, so (|V|, O\_Y|\_{|V|}) ≅ V. Hence Y is a scheme, Y′ = Y\_{k′}, f′ = f\_{k′}; Y is proper by fpqc descent of properness along Spec k′ → Spec k (EGA IV 2.7.1).

*Needs:* [3.1](#np-3-1); SchemeAndStackFoundations Layer 0.

**Checks.**

- For k′ = k this returns f′.
- The statement fails for separable extensions without further hypotheses: contracting one of the two components of (P¹\_ℂ)\_ℂ = P¹\_ℂ ⊔ P¹\_ℂ does not descend to ℝ.


<a id="np-3-7"></a>

### 3.7 Descent of geometric contractions under constant Num (Schröer, Theorem 1.3)

Prove. Let X be proper over a field k with Num\_{X/k} constant. Every contraction f̄ : X\_{k̄} → Ȳ with Ȳ projective over k̄ is isomorphic under X\_{k̄} to the base change of a contraction f : X → Y over k; Y is then projective over k.

*Hypotheses.* X proper over k; IsConstantNum X; Ȳ projective (the inseparable step alone needs only properness).

*Source.* Schröer 2023, Theorem 1.3 and proof, pp. 6–7: With constant Num every contraction of X ⊗ k^alg to a projective scheme is the base change of a contraction of X: spread out to a splitting field, average the semiample sheaf over the Galois group, lift a multiple to X, and treat the purely inseparable part separately.

*Proof sketch.* Spread f̄ out to a contraction f′ : X\_{k′} → Y′ over a finite normal extension k′/k (3.5), and write it as L′ ↦ φ\_{L′} for a semiample L′ (3.4 (ii)). k′ ⊃ k₁ ⊃ k with k₁ = separable closure of k in k′: k₁/k is Galois with group G and k′/k₁ is purely inseparable (Mathlib separableClosure.isGalois, separableClosure.isPurelyInseparable). Galois step: each σ\*L′ is semiample and numerically equivalent to L′, since Galois acts trivially on Num\_{X/k}(k̄); so M := ⊗\_{σ∈G} σ\*L′ is semiample, defines the same contraction as L′ (3.4 (iv)), and its class is a G-invariant k₁-point of Pic\_{X/k}, hence a k-point. By 2.4 some M^{⊗m} is L\_{k₁} for an invertible L on X; L is semiample (descent of global generation), and φ\_L base changes to φ\_{M^{⊗m}} ≅ f′ over k₁ (3.4 (iii)). Inseparable step: 3.6 descends the contraction from k′ to k₁, and uniqueness of descended contractions glues the two steps.

*Needs:* [3.5](#np-3-5); [3.4](#np-3-4); [3.6](#np-3-6); [2.7](#np-2-7); [2.4](#np-2-4); Mathlib `separableClosure.isGalois`; Mathlib `separableClosure.isPurelyInseparable`.

**Checks.**

- For X = P¹\_ℂ viewed over ℝ, Num\_{X/ℝ} is not constant and the contraction of X\_ℂ = P¹\_ℂ ⊔ P¹\_ℂ collapsing only the first component does not descend.
- For X geometrically integral over a finite field with Num constant, every geometric fibration onto a projective curve descends (the Enriques application, EnriquesSurfacesAndIntegralNonexistence Layer 2).


<a id="np-3-8"></a>

### 3.8 Openness of ampleness for proper algebraic spaces

Prove. Let Y be a Noetherian scheme, f : X → Y a proper morphism from an algebraic space and L an invertible O\_X-module. (i) If y ∈ Y is such that the fibre X\_y is a scheme and L\_y is ample on X\_y, there is an open neighbourhood V ∋ y such that L|\_{f^{-1}V} is ample on f^{-1}(V)/V; in particular f^{-1}(V) is a scheme, projective over V. (ii) For an arbitrary proper morphism of algebraic spaces f : X → Y there is an open V ⊂ Y such that a morphism Y′ → Y factors through V iff the pullback of L to X ×\_Y Y′ is ample over Y′.

*Hypotheses.* (i) Y Noetherian scheme, f proper, X\_y a scheme; (ii) f proper morphism of algebraic spaces.

*Source.* Stacks, Lemma 71.15.3 (tag 0D3A): For a proper algebraic space over a Noetherian scheme, if the fibre over y is a scheme on which L is ample, then L is ample over a neighbourhood of y.; Stacks, Lemma 74.13.2 (tag 0D3D): For a proper morphism of algebraic spaces there is an open subspace of the target through which a base change factors exactly when the pullback of L is ample.; atlas paper extraction, PAPER-SCHROER-23/186: This openness, with the representability conclusion, is the input of the local projectivity repair of Proposition 5.5; neither R09.1 nor R09.3 names it.

*Proof sketch.* (i) Over a Noetherian complete local base the fibrewise very ample powers lift (formal functions, Grothendieck existence), giving a finite morphism to P^r over a neighbourhood after shrinking; a finite morphism to a projective scheme makes X a scheme and L ample. The scheme case of the openness is StableReduction Layer 2's 'fibrewise ample is open'. (ii) Descent of the ample locus along an étale cover of Y by schemes and the fpqc-local nature of relative ampleness (Stacks 0D2P).

*Needs:* StableReduction Layer 2; AlgebraicModuliForArithmeticGeometry Layer 3; SchemeAndStackFoundations Layer 1.

**Checks.**

- For a family of smooth projective curves every fibrewise ample L is relatively ample over the whole base.
- Ampleness on one fibre is essential: for the trivial sheaf on X = P¹ × Y, no neighbourhood works.


### Dependencies

This layer uses Layer 1, Layer 2, SchemeAndStackFoundations Layer 0, SchemeAndStackFoundations Layer 1, SchemeAndStackFoundations Layer 2, SchemeAndStackFoundations Layer 4, StableReduction Layer 2, AlgebraicModuliForArithmeticGeometry Layer 1, AlgebraicModuliForArithmeticGeometry Layer 3.


## Layer 4: Component graphs and contractions of smooth surfaces

\*\*Targets.\*\* The component dual graph of a Noetherian scheme and the induced maps (edges go to edges or vertices); the curve criterion (Schröer Proposition 1.2, for schemes with all components one-dimensional); intersection matrices and intersection-labelled graphs of curves on a smooth proper surface; the trichotomy for contractions of smooth proper surfaces (point, birational, fibre type); negative definiteness of exceptional curves (Du Val, Mumford, Lipman Lemma 14.1); Zariski's lemma for fibres; Schröer's Theorem 2.1: graph descent, purely inseparable residue fields of reducible geometric fibres, and descent of edge labels (with κ(a) = k).


<a id="np-4-1"></a>

### 4.1 The component dual graph of a Noetherian scheme

Define `DualGraph.componentGraph`. For a Noetherian scheme Z, the dual graph Γ(Z) is the finite simple graph whose vertices are the irreducible components Z\_i of Z, two distinct vertices Z\_i ≠ Z\_j being adjacent iff Z\_i ∩ Z\_j ≠ ∅. A morphism Z′ → Z mapping each irreducible component of Z′ into an irreducible component of Z (for instance a flat morphism, or a base change along a field extension) induces a map of vertex sets sending adjacent vertices to adjacent or equal vertices. It is a graph isomorphism if it is bijective on vertices and on edges; a vertex bijection automatically sends edges to edges.

*Hypotheses.* Z Noetherian (finitely many components).

*Source.* Schröer 2023, §1, p. 6: The dual graph of a Noetherian scheme has the irreducible components as vertices, joined when they meet; maps sending components to components induce graph morphisms.; atlas paper extraction, PAPER-SCHROER-23/E28: The printed claim that such maps send edges to edges fails when two components with the same image meet (x² + y² = 0 over ℝ); edges go to edges or to a vertex, and to edges when the vertex map is bijective.

*Construction.* Adjacency is symmetric and irreflexive; finiteness of the vertex set is Noetherianity. If Z′\_i ∩ Z′\_j ≠ ∅ then their images meet, so adjacent vertices go to adjacent or equal vertices; when the vertex map is injective, equal images cannot occur.

*Uses.* Schröer 2023, Proposition 1.2 and Theorem 2.1: constancy of Num is equivalent to, or implies, Γ(X\_{k̄}) → Γ(X) being an isomorphism; EnriquesSurfacesAndIntegralNonexistence 2.19: descent of the dual graphs of fibres of genus-one fibrations over finite fields; StableReduction Layer 1: the dual graph of a nodal curve, a refinement with edges for nodes, which this coarser graph forgets.

The API:

- `DualGraph.componentGraph` (data): Γ(Z) as a SimpleGraph on irreducibleComponents Z, adjacency Z\_i ≠ Z\_j ∧ (Z\_i ∩ Z\_j).Nonempty.
- `DualGraph.componentGraph_adj_iff` (simp): Adjacency unfolds to distinctness and nonempty intersection.
- `DualGraph.vertexMap` (functoriality): A component-preserving morphism Z′ → Z induces a vertex map; identities and composites are respected.
- `DualGraph.vertexMap_adj` (relation): Adjacent vertices map to adjacent or equal vertices.
- `DualGraph.IsGraphIso` (data): Bijectivity on vertices and on edges; equivalent to vertex bijectivity plus reflection of adjacency.
- `DualGraph.baseChange` (functoriality): For a field extension K/κ and Z of finite type over κ, the projection Z\_K → Z induces Γ(Z\_K) → Γ(Z).

*Needs:* Mathlib `irreducibleComponents`; Mathlib `SimpleGraph`; StableReduction Layer 1.

**Checks.**

- `DualGraph.componentGraph_disjointLines` (computation): Γ(P¹ ⊔ P¹) has two vertices and no edge.
- `DualGraph.componentGraph_irreducible` (degenerate): An irreducible Z has one vertex and no edges; Γ(∅) is empty.
- `DualGraph.componentGraph_axes` (computation): For Z = V(xy) ⊂ 𝔸², Γ(Z) is a single edge.
- `DualGraph.vertexMap_contracts_edge` (non-example): For Z = V(x² + y²) ⊂ 𝔸²\_ℝ, Γ(Z\_ℂ) is an edge and Γ(Z) a single vertex: the induced map sends the edge to a vertex, not to an edge.
- Γ(P¹ ⊔ P¹) has two vertices and no edge; Γ of a nodal cubic is one vertex.


<a id="np-4-2"></a>

### 4.2 Constancy of Num for curves is graph descent

Prove. Let X be a proper scheme over k all of whose irreducible components are one-dimensional. Then Num\_{X/k} is constant iff Γ(X\_{k̄}) → Γ(X) is a graph isomorphism.

*Hypotheses.* X proper over k; every irreducible component of dimension one (zero-dimensional components excluded).

*Source.* Schröer 2023, Proposition 1.2 and proof, p. 6: For one-dimensional X, Num\_{X/k} is constant iff Γ(X̄) → Γ(X) is a graph isomorphism, proved with effective Cartier divisors at chosen closed points and Lemma 1.1.; atlas paper extraction, PAPER-SCHROER-23/E18 and /E19: The proposition needs every irreducible component to be one-dimensional (counterexample P¹\_ℝ ⊔ Spec ℂ); in the proof the effective Cartier divisor lives on X̄, not X.

*Proof sketch.* An invertible sheaf is numerically trivial iff its degrees on the reduced components C\_1, …, C\_r vanish, so Num(X\_{k̄}) ⊗ ℚ has the components of X\_{k̄} as a dual basis. (⇐) If the vertex map is bijective, choose closed points a\_i in C\_i outside the other components and outside the embedded points, and effective Cartier divisors D\_i supported at a\_i; the classes of O(D\_i) span a finite-index subgroup of Num\_{X/k}(k̄) defined over k, so Galois acts trivially (2.10). (⇒) For a component E of X\_{k̄}, take an effective Cartier divisor on X\_{k̄} supported on E away from the others; 2.10 gives L on X with (L\_{k̄}·E′) ≥ 0, positive exactly for E′ = E, so exactly one component of X lies under E: the vertex map is bijective.

*Needs:* [4.1](#np-4-1); [2.10](#np-2-10); [0.4](#np-0-4).

**Checks.**

- For X = P¹\_ℂ viewed over ℝ, Γ(X\_ℂ) has two vertices over one: Num is not constant.
- For X = P¹\_ℝ ⊔ Spec ℂ the statement is outside the hypothesis: Num\_{X/ℝ} = ℤ is constant but Γ(X\_ℂ) has three vertices over two.


<a id="np-4-3"></a>

### 4.3 Intersection matrices and intersection-labelled graphs of curves on a surface

Define `DualGraph.intersectionMatrix`. Let S be a smooth proper surface over k with H⁰(S, O\_S) = k and C ⊂ S a curve with irreducible components C\_1, …, C\_r and multiplicities m\_i ≥ 1. Its intersection matrix is N(C) := ((C\_i·C\_j))\_{i,j} ∈ Mat\_r(ℤ), intersection numbers on S over k (SchemeAndStackFoundations §5.9). C is negative definite (resp. negative semidefinite) if N(C) is. The labelled graph of C is Γ(C) with each edge {C\_i, C\_j}, i ≠ j, labelled by (C\_i·C\_j) > 0.

*Hypotheses.* S smooth proper over k with H⁰(S, O\_S) = k; intersection numbers over k.

*Source.* Schröer 2023, §2, p. 8: For a curve C = Σ m\_iC\_i on a smooth proper surface with h⁰(O\_S) = 1, the intersection matrix N(C) = (C\_i·C\_j), negative (semi)definiteness, and the edge labels (C\_i·C\_j) > 0.; atlas paper extraction, PAPER-SCHROER-23/E3: In §2 the surface is S throughout; the printed X belongs to §1.

*Construction.* Distinct components meet iff (C\_i·C\_j) > 0 (local intersection multiplicities are positive at common points), so labels are positive exactly on edges. N(C) is symmetric by symmetry of the intersection pairing.

*Uses.* Schröer 2023, Theorem 2.1(ii): edge labels are compared between geometric and schematic fibres; EnriquesSurfacesAndIntegralNonexistence 2.19: intersection-labelled fibre graphs over finite fields; this roadmap 4.5 and 4.6: definiteness of N(C) for fibres of contractions.

The API:

- `DualGraph.intersectionMatrix` (data): N(C) ∈ Mat\_r(ℤ), symmetric.
- `DualGraph.IsNegDef` (data): C is negative definite iff −N(C) is positive definite; IsNegSemidef likewise.
- `DualGraph.labelledGraph` (data): Γ(C) with edge labels (C\_i·C\_j) > 0.
- `DualGraph.label_pos_iff_adj` (characterisation): For i ≠ j, (C\_i·C\_j) > 0 iff C\_i and C\_j are adjacent in Γ(C).
- `DualGraph.labelledGraph_baseChange` (compatibility): If C\_i = D\_i ⊗\_{κ} Ω for a field κ ⊃ k, then (D\_i·D\_j)\_k = [κ:k]·(C\_i·C\_j)\_Ω.

*Needs:* [4.1](#np-4-1); SchemeAndStackFoundations Layer 5.

**Checks.**

- `DualGraph.intersectionMatrix_twoLines` (computation): Two lines L, L′ in P²\_k: N = [[1,1],[1,1]], one edge labelled 1; positive semidefinite, not negative.
- `DualGraph.intersectionMatrix_exceptional` (computation): The exceptional curve E of a blow-up at a k-point: N = [−1], negative definite.
- `DualGraph.intersectionMatrix_single` (degenerate): A single smooth fibre F of a fibration S → P¹: N = [0], negative semidefinite and not definite.
- `DualGraph.labelledGraph_residueScaling` (non-example): For components defined over a degree-2 extension κ of k, labels over k are twice the geometric labels: the label is not a geometric invariant without fixing the base field.
- For two lines in P²\_k, N = [[1,1],[1,1]].


<a id="np-4-4"></a>

### 4.4 Contractions of smooth proper surfaces

Prove. Let S be a smooth proper surface over k with H⁰(S, O\_S) = k and f : S → Z a contraction. Exactly one of the following holds: (a) Z = Spec k and f is the structure morphism; (b) Z is a geometrically normal proper surface and f is birational; (c) Z is a smooth proper geometrically connected curve over k, and f is flat with geometrically connected fibres (f is of fibre type).

*Hypotheses.* S smooth proper surface, H⁰(S, O\_S) = k; f a contraction.

*Source.* Schröer 2023, §2, p. 8: A contraction of a smooth proper surface with h⁰(O\_S) = 1 is either birational onto a geometrically normal surface or of fibre type onto a smooth curve.; atlas paper extraction, PAPER-SCHROER-23/E23: The printed dichotomy omits the contraction to Spec k; Theorem 2.1 excludes it by assuming one-dimensional geometric fibres.

*Proof sketch.* Z is normal and, after the flat base change to k̄, geometrically normal: O\_Z = f\_\*O\_S with S normal, and contractions commute with field extension (3.1). dim Z = 0: Z = Spec H⁰(Z, O\_Z) = Spec H⁰(S, O\_S) = Spec k. dim Z = 2: f is generically finite, and O\_Z = f\_\*O\_S forces the generic fibre to have degree one, so f is birational. dim Z = 1: a geometrically normal curve is smooth; S is integral and dominates the Dedekind scheme Z, so f is flat; H⁰(Z, O\_Z) = k with Z geometrically reduced gives geometric connectedness; fibres are geometrically connected by Zariski connectedness.

*Needs:* [3.1](#np-3-1); SchemeAndStackFoundations Layer 0; SchemeAndStackFoundations Layer 4.

**Checks.**

- The blow-up of P²\_k at a k-point is of type (b); P¹×P¹ → P¹ is of type (c); S → Spec k is of type (a).


<a id="np-4-5"></a>

### 4.5 Negative definiteness of exceptional curves (Du Val, Mumford, Grauert)

Prove. Let S be a regular two-dimensional scheme, proper over a field k, f : S → Z a proper birational morphism onto a normal surface and z ∈ Z a point with dim f^{-1}(z) = 1. The irreducible components E\_1, …, E\_r of f^{-1}(z) have negative definite intersection matrix ((E\_i·E\_j)). The statement is stable under base change to Ω ⊃ κ(z) algebraically closed (which keeps the normality of the contraction target when Z is geometrically normal).

*Hypotheses.* S regular, f proper birational onto a normal surface; intersection numbers over k (any positive rescaling preserves definiteness).

*Source.* Lipman 1969, §13, p. 223, and Lemma (14.1), p. 224: For a desingularisation of a two-dimensional normal local ring, the intersection matrix of the components of the closed fibre is negative definite (a lemma of Du Val).; Alexeev–Hacon–Kawamata 2007, proof of Lemma 1.6, p. 4: Cites Mumford 1961 for negative definiteness of the intersection form on exceptional curves of a birational morphism of surfaces.; atlas paper extraction, PAPER-SCHROER-23/221: Negativity of exceptional curves is the birational case of Theorem 2.1, applied after base change to Ω.

*Proof sketch.* Localise at z: X = S ×\_Z Spec O\_{Z,z} → Spec O\_{Z,z} is a desingularisation of a two-dimensional normal local ring. Choose a nonunit r ∈ O\_{Z,z}; its pullback divisor C = Σ c\_iE\_i + (strict part) satisfies (C·E\_i) = 0 for all i, with c\_i > 0 by connectedness of the fibre (Zariski) and the strict part meeting some E\_i; the standard criterion then gives definiteness. Base change: f\_Ω remains a contraction onto the normal Z\_Ω (geometric normality, 4.4), so the same applies over Ω.

*Needs:* [4.3](#np-4-3); [4.4](#np-4-4); StableReduction Layer 4; SchemeAndStackFoundations Layer 5.

**Checks.**

- For the blow-up of a point, ((E·E)) = (−1).
- For the minimal resolution of an A\_n singularity, the matrix is the negative of the A\_n Cartan matrix.


<a id="np-4-6"></a>

### 4.6 Zariski's lemma for fibres of fibrations of regular surfaces

Prove. Let S be a regular two-dimensional scheme, f : S → Z a proper flat morphism onto a regular one-dimensional scheme with O\_Z = f\_\*O\_S, z ∈ Z a closed point and f^\*(z) = Σ\_{i=1}^r m\_iC\_i its fibre. Then (C\_i·C\_j) ≥ 0 for i ≠ j, with equality iff C\_i ∩ C\_j = ∅; (f^\*(z)·C\_j) = 0 for all j; the intersection form on ⊕ℚC\_i is negative semidefinite with radical ℚ·Σm\_iC\_i; every proper subset of {C\_1, …, C\_r} spans a negative definite sublattice; in particular C\_i² < 0 for every i when r ≥ 2.

*Hypotheses.* S regular of dimension two; f proper flat with connected fibres onto a regular curve; no smoothness of the generic fibre is needed.

*Source.* Stacks, Lemma 55.9.7 (tag 0C66), in Situation 55.9.3: For a regular proper model over a DVR, off-diagonal intersections are nonnegative, vanishing exactly for disjoint components, the fibre is orthogonal to every component, connectedness holds, and the form is negative semidefinite with radical spanned by the multiplicities.; atlas paper extraction, PAPER-SCHROER-23/222: Zariski's lemma for curves of fibre type, with every proper subset of components negative definite and C\_i² < 0 once the fibre has at least two components.

*Proof sketch.* Localise at z to get a regular proper flat model over the discrete valuation ring O\_{Z,z}; the special fibre is connected because O\_Z = f\_\*O\_S. (C\_i·C\_j) ≥ 0 for i ≠ j from local intersection multiplicities; (f^\*(z)·C\_j) = 0 because f^\*(z) is the divisor of a uniformiser; no proper nonempty subset is orthogonal to its complement, by connectedness. These three properties imply negative semidefiniteness with radical spanned by (m\_i) and definiteness on proper subsets (Stacks, Lemma 55.9.7, via the linear algebra of §55.2); the smooth-generic-fibre hypothesis of the Stacks situation is not used by these steps.

*Needs:* [4.3](#np-4-3); StableReduction Layer 4; SchemeAndStackFoundations Layer 5.

**Checks.**

- For a fibre of type I₂ (two rational curves meeting in two points), N = [[−2, 2], [2, −2]].
- For an irreducible fibre, N = [0].


<a id="np-4-7"></a>

### 4.7 Descent of fibre dual graphs under constant Num (Schröer, Theorem 2.1(i))

Prove. Let S be a smooth proper surface over k with H⁰(S, O\_S) = k and Num\_{S/k} constant, f : S → Z a contraction, ā : Spec Ω → Z a geometric point with image a, S\_ā = S ×\_Z Spec Ω and S\_a = f^{-1}(a). If S\_ā is one-dimensional, then Γ(S\_ā) → Γ(S\_a) is a graph isomorphism.

*Hypotheses.* S smooth proper, H⁰(S, O\_S) = k, Num\_{S/k} constant; S\_ā one-dimensional (so f is birational or of fibre type).

*Source.* Schröer 2023, Theorem 2.1(i) and proof, pp. 8–9: With Num constant, the geometric-to-schematic fibre graph map is an isomorphism: negative definiteness (birational case) or semidefiniteness (fibre type) makes the components numerically independent, so Galois fixes them.; atlas paper extraction, PAPER-SCHROER-23/E25: In the fibre-type case the printed use of the two subcurves C₁+…+C\_{r−1} and C₂+…+C\_r does not exclude C₁ and C\_r being exchanged; the one-line fix (C\_i − C\_j)·C\_i < 0 separates all classes.

*Proof sketch.* Reduce to Ω = κ(a)^alg. The components C\_1, …, C\_r of S\_ā are curves on S\_Ω, and Aut(Ω/κ(a)) ⊂ Aut(Ω/k) acts on them; constancy of Num\_{S/k} makes it act trivially on Num(S\_Ω). The classes [C\_i] ∈ Num(S\_Ω) are pairwise distinct: in the birational case N(S\_ā) is negative definite (4.5), so ⊕ℤC\_i → Num is injective; in the fibre-type case with r ≥ 2, (C\_i − C\_j)·C\_i = C\_i² − (C\_i·C\_j) < 0 by 4.6; r = 1 is trivial. Hence every automorphism fixes every C\_i, so each component of S\_ā is defined over κ(a) up to a purely inseparable extension and lies over exactly one component of S\_a: the vertex map is bijective, hence a graph isomorphism (4.1).

*Needs:* [4.4](#np-4-4); [4.5](#np-4-5); [4.6](#np-4-6); [4.1](#np-4-1); [2.7](#np-2-7); [1.1](#np-1-1).

**Checks.**

- Over a finite field, every geometrically reducible fibre of a genus-one fibration of an Enriques surface with constant Num has its geometric components defined over its residue field (EnriquesSurfacesAndIntegralNonexistence 2.19).
- Without constant Num the statement fails: for a conic bundle S → P¹\_ℝ with a fibre x² + y² = 0 over a real point a, Γ(S\_ā) has two vertices (the conjugate lines) over one vertex of Γ(S\_a), and complex conjugation swaps their classes in Num(S\_ℂ).


<a id="np-4-8"></a>

### 4.8 Residue fields of reducible geometric fibres are purely inseparable (Theorem 2.1(iii))

Prove. In the situation of 4.7, if S\_ā is reducible then κ(a)/k is purely inseparable.

*Hypotheses.* as in 4.7, with S\_ā reducible.

*Source.* Schröer 2023, Theorem 2.1(iii) and proof, pp. 8–9: If the geometric fibre is reducible, the residue extension k ⊂ κ(a) is purely inseparable, since otherwise Galois would permute the components of S\_a ⊗\_k Ω nontrivially.

*Proof sketch.* If κ(a)/k is not purely inseparable, κ(a) ⊗\_k Ω has several points and S\_a ⊗\_k Ω is a disjoint union of at least two copies of S\_ā, permuted transitively and nontrivially by Aut(Ω/k), whereas S\_a is connected. All components of S\_a ⊗\_k Ω have pairwise distinct classes in Num(S\_Ω): within a copy by the argument of 4.7 (r ≥ 2), across copies because disjoint E, E′ satisfy (E − E′)·E = E² < 0. Constancy of Num makes Aut(Ω/k) fix every class, hence every component: a contradiction.

*Needs:* [4.7](#np-4-7); [4.6](#np-4-6); [4.5](#np-4-5).

**Checks.**

- Over a finite field every purely inseparable extension is trivial, so reducible geometric fibres lie over rational points.


<a id="np-4-9"></a>

### 4.9 Edge labels of fibre graphs descend (Theorem 2.1(ii), corrected)

Prove. In the situation of 4.7, suppose S\_ā is reducible and (S\_a)\_red is geometrically reduced over κ(a). Then κ(a) = k, and the graph isomorphism Γ(S\_ā) → Γ(S\_a) preserves edge labels: (C\_i·C\_j) on S\_Ω equals (D\_i·D\_j) on S for the components C\_i, C\_j of S\_ā over the components D\_i, D\_j of S\_a.

*Hypotheses.* as in 4.7; S\_ā reducible; (S\_a)\_red geometrically reduced over κ(a).

*Source.* Schröer 2023, Theorem 2.1(ii), p. 8: The graph isomorphism respects edge labels provided the reduced schematic fibre is geometrically reduced over the residue field; the proof is left to the reader.; atlas paper extraction, PAPER-SCHROER-23/E24: The definitions alone do not give (ii): labels over k scale by [κ(a):k]; the missing equality κ(a) = k follows from (iii) and smoothness of S by comparing q and q².

*Proof sketch.* Geometric reducedness gives C\_i = D\_i ⊗\_{κ(a)} Ω, so (D\_i·D\_j)\_k = [κ(a):k]·(C\_i·C\_j) (4.3 base-change API). By 4.8, κ(a)/k is purely inseparable of some degree q; κ(a) ⊗\_k Ω is local of length q, so D\_i ⊗\_k Ω = q·C\_i as divisors on the smooth surface S\_Ω and (D\_i·D\_j)\_k = q²·(C\_i·C\_j). S\_ā is connected (Zariski) and reducible, so some (C\_i·C\_j) > 0; comparing q and q² gives q = 1, hence κ(a) = k and equal labels.

*Needs:* [4.7](#np-4-7); [4.8](#np-4-8); [4.3](#np-4-3).

**Checks.**

- Over a finite field the residue extension is trivial by (iii) and the labels agree directly.


### Dependencies

This layer uses Layer 2, Layer 3, SchemeAndStackFoundations Layer 0, SchemeAndStackFoundations Layer 4, SchemeAndStackFoundations Layer 5, StableReduction Layer 1, StableReduction Layer 4.


## Layer 5: Numerical theory in families and descent along contractions

\*\*Targets.\*\* For a proper scheme over a DVR, the injective restriction N¹(𝒳/S) → N¹(X) to the special fibre and numerical surjectivity; numerical surjectivity gives numerical, not actual, lifts (Hacon–Witaszek E7); lifting of line bundles over a complete DVR when H²(X, O\_X) = 0 (Hacon–Witaszek Lemma 6.3); identification of relative cones under numerical surjectivity; transfer of nef and big from the special to the generic fibre; descent of relatively semiample, relatively numerically trivial sheaves along contractions (the general step behind Bhatt et al. Propositions 2.51 and 9.16 and Hacon–Witaszek Proposition 5.4); vertical numerical descent (Cascini–Tanaka Lemma 2.17); extremal curves of minimal normalised degree (Bhatt et al. Definition 9.30); the Alexeev–Hacon–Kawamata birational Picard rank.


<a id="np-5-1"></a>

### 5.1 Restriction of numerical classes to the special fibre over a DVR

Construct `Numerical.specialFibreRestriction`. Let R be a discrete valuation ring with residue field k, S = Spec R, and 𝒳 → S proper with special fibre X = 𝒳 ⊗\_R k. The curves over S are exactly the integral curves of X, so N₁(𝒳/S) is a quotient of N₁(X/k), and restriction of invertible sheaves induces res : N¹(𝒳/S) → N¹(X/k), [𝓛] ↦ [𝓛|\_X], which is injective. 𝒳/S is called numerically surjective when res is surjective (equivalently its ℚ-form is).

*Hypotheses.* R a DVR; 𝒳 → Spec R proper (projective in the sources).

*Source.* Hacon–Witaszek 2023, Theorem 1.3(2), p. 2, and the remark after Theorem 1.4, p. 3: The hypothesis that N¹(𝒳/Spec R) → N¹(X) is surjective for a lift over a DVR, with N¹ = Pic ⊗ ℚ modulo numerical equivalence; completeness of R is needed for surjectivity via Lemma 6.3.; Hacon–Witaszek 2023, proof of Theorem 1.3(2a), p. 33: Only curves projective over S, hence lying in the special fibre, enter NE(𝒳/S); numerical relations on 𝒳 and X agree when the restriction is surjective.

*Construction.* The only closed point of S is the closed point, so by 0.5 𝓛 ≡\_S 0 iff 𝓛|\_X ≡ 0: res is well defined and injective. A 1-cycle on X pairs with Pic(𝒳) through restriction; it is numerically trivial on 𝒳/S iff it annihilates the image of res, so N₁(𝒳/S) = N₁(X)/(image of res)^⊥.

*Uses.* Hacon–Witaszek 2023, Theorem 1.3(2) (published Theorem 6.1): lifting MMP steps of the special fibre over R; this roadmap 5.2 and 5.4: what numerical surjectivity supplies and what it does not.

The API:

- `Numerical.specialFibreRestriction` (data): res : N¹(𝒳/S) → N¹(X/k) and its ℚ-form.
- `Numerical.specialFibreRestriction_injective` (other): res is injective.
- `Numerical.IsNumericallySurjective` (data): The predicate that res is surjective.
- `Numerical.curveSpace_specialFibre` (equivalence): N₁(𝒳/S) ≅ N₁(X/k)/(im res)^⊥, compatibly with the pairings.
- `Numerical.specialFibreRestriction_baseChange` (functoriality): For an extension of DVRs R → R′ with 𝒳′ = 𝒳 ⊗ R′, res commutes with the base change maps.

*Needs:* [1.1](#np-1-1); [1.2](#np-1-2); [0.5](#np-0-5).

**Checks.**

- `Numerical.specialFibreRestriction_projectiveSpace` (computation): For 𝒳 = P^n\_R, res is the identity of ℝ ≅ N¹ and 𝒳 is numerically surjective.
- `Numerical.specialFibreRestriction_identity` (degenerate): For 𝒳 = S, both N¹ groups are zero.
- `Numerical.specialFibreRestriction_quadricDegeneration` (non-example): For the smooth quadric 𝒳 = {x² + y² = zw} over the non-complete DVR ℤ\_(5), the rulings of the generic fibre are defined over ℚ(i) and exchanged by Galois, so Pic(𝒳) = Pic(𝒳\_ℚ) has rank 1, while the special fibre over 𝔽₅ (where −1 is a square) is split with N¹ of rank 2: res is injective and not surjective. Over a henselian DVR this cannot happen, since the ruling cover is étale.
- For 𝒳 = P^n\_R, res : ℝ → ℝ is the identity on the degree.


<a id="np-5-2"></a>

### 5.2 Numerical surjectivity gives numerical, not actual, lifts

Prove. In the situation of 5.1, assume 𝒳/S is numerically surjective. Then for every L ∈ Pic(X) there are m ≥ 1 and 𝓛 ∈ Pic(𝒳) with 𝓛|\_X ≡ L^{⊗m} (numerical equivalence on X); equivalently every ℚ-line bundle on X is numerically the restriction of a ℚ-Cartier class on 𝒳. Numerical surjectivity does not imply that L itself, or any power, is isomorphic to the restriction of an invertible sheaf on 𝒳.

*Hypotheses.* R a DVR, 𝒳/S proper and numerically surjective.

*Source.* atlas paper extraction, PAPER-HACON-WITASZEK-23/E7 (confirmed): The published proof of Theorem 6.1(2b) chooses Cartier divisors on 𝒳 restricting to given divisors on X from surjectivity of N¹; surjectivity of numerical classes supplies only numerical representatives.; Hacon–Witaszek 2023, proof of Theorem 1.3(2), pp. 33–34: The step where Cartier divisors 𝒜, ℋ on 𝒳 with 𝒜|\_X = A and ℋ|\_X = H are taken from surjectivity of N¹(𝒳/S) → N¹(X).

*Proof sketch.* Num(𝒳/S) and Num(X) are lattices of the same rank in N¹ (1.4), and res maps the first injectively into the second with finite index when surjective after ⊗ℚ; m can be taken to be that index. The non-implication: for E the elliptic curve 11a1 over ℚ with good reduction at 7 and 𝒳 = E ⊗ ℤ\_(7), Pic(𝒳) = Pic(E\_ℚ) and restriction of degree-zero classes is the reduction map E(ℚ) = ℤ/5 → E(𝔽₇), a group of order 10; a degree-zero class outside the image is numerically trivial, so numerically lifted by O, but is not a restriction.

*Needs:* [5.1](#np-5-1); [1.4](#np-1-4).

**Checks.**

- When H²(X, O\_X) = 0 and R is complete, actual lifts exist (5.3).


<a id="np-5-3"></a>

### 5.3 Line bundles lift over a complete DVR when H²(X, O\_X) = 0

Prove. Let R be a complete discrete valuation ring, 𝒳 → Spec R proper flat with special fibre X, and H²(X, O\_X) = 0. Every invertible sheaf L on X is isomorphic to 𝓛|\_X for some invertible 𝓛 on 𝒳; in particular 𝒳/R is numerically surjective. If L is ample, every such 𝓛 is ample over R.

*Hypotheses.* R complete DVR (any characteristics); 𝒳 proper flat over R; H²(X, O\_X) = 0.

*Source.* Hacon–Witaszek 2023, Lemma 6.3 and proof, p. 31: For a complete mixed-characteristic DVR and a lift of X with H²(X, O\_X) = 0, every line bundle lifts (obstructions in H², Grothendieck existence), so N¹(𝒳/R) → N¹(X) is surjective, and ample lifts are ample by Stacks 0D3A; the argument does not use the characteristic.; Kleiman, The Picard scheme, Proposition 5.19 and proof, p. 47: Infinitesimal lifting of invertible sheaves has obstruction in H²(X, O\_X).

*Proof sketch.* Lift L successively to X\_n = 𝒳 ⊗ R/m^{n+1}: the obstruction lies in H²(X, O\_X) ⊗ m^n/m^{n+1} = 0 (AlgebraicModuliForArithmeticGeometry §7.3 picard\_infinitesimal\_lifting, framed lifts along the flat thickenings). Grothendieck's existence theorem (SchemeAndStackFoundations §4.10) algebraises the compatible system (L\_n) to an invertible 𝓛 on 𝒳 with 𝓛|\_X ≅ L. Ampleness: the closed fibre is the only fibre over a closed point, so openness of ampleness (3.8, scheme case) makes 𝓛 ample over a neighbourhood of the closed point, which is all of Spec R.

*Needs:* [5.1](#np-5-1); [3.8](#np-3-8); AlgebraicModuliForArithmeticGeometry §7.3 `picard_infinitesimal_lifting`; SchemeAndStackFoundations Layer 4.

**Checks.**

- For a lift of a curve (H² = 0 automatically), every line bundle lifts; for a lift of an abelian or K3 surface the hypothesis fails and the Picard rank can drop.


<a id="np-5-4"></a>

### 5.4 Numerical surjectivity identifies relative and special-fibre cones

Prove. In the situation of 5.1, if 𝒳/S is numerically surjective then res : N¹(𝒳/S) → N¹(X) is an isomorphism, the identity on cycles induces N₁(X) ≅ N₁(𝒳/S), and under these identifications NE‾(𝒳/S) = NE‾(X), Nef(𝒳/S) = Nef(X), and extremal rays and faces of the two cones correspond. A class on 𝒳 is relatively ample over S iff its restriction to X is ample.

*Hypotheses.* R a DVR; 𝒳/S proper and numerically surjective.

*Source.* Hacon–Witaszek 2023, proof of Theorem 1.3(2a), p. 33: When N¹(𝒳/S) → N¹(X) is surjective, NE(𝒳/S) = NE(X), because only curves in the special fibre enter and numerical relations agree; an extremal ray of X is cut out on 𝒳 by a lifted ample class.

*Proof sketch.* res is injective (5.1) and surjective by hypothesis; dualising gives N₁(X) ≅ N₁(𝒳/S) because the curves are the same and the annihilator of im res is zero. Effective cycles correspond under the identity, so the cones and their closures agree; nef cones are their duals; faces correspond. Ampleness over S is tested on the special fibre by openness of ampleness (3.8).

*Needs:* [5.1](#np-5-1); [1.5](#np-1-5); [3.8](#np-3-8).

**Checks.**

- For 𝒳 = P^n\_R both cones are the ray of a line.


<a id="np-5-5"></a>

### 5.5 Nef and big classes on the special fibre are nef and big on the generic fibre

Prove. Let R be a DVR and T → Spec R flat and projective with integral special fibre T\_s and integral generic fibre T\_η of dimension n ≥ 1, and let H be a ℚ-Cartier divisor on T. If H|\_{T\_s} is nef and big then H|\_{T\_η} is nef and big. The conclusion depends only on the numerical class of H|\_{T\_s}.

*Hypotheses.* R a DVR; T → Spec R flat projective with integral fibres of dimension n; H ℚ-Cartier on T.

*Source.* atlas paper extraction, PAPER-HACON-WITASZEK-23/special-nef-big-transfer: For a flat projective family over a DVR with integral three-dimensional fibres, a ℚ-Cartier H whose special restriction is nef and big has nef and big generic restriction, independently of the numerical representative; supplied in the extraction for the repaired proof of the published Theorem 6.1(2b).; Hacon–Witaszek 2023, proof of Theorem 1.3(1), p. 32: Top self-intersections of K + tA agree on the generic and special fibres of the lift, which is used to compare bigness.

*Proof sketch.* Top self-intersections are constant in flat proper families: χ(T\_t, mH|\_{T\_t}) is independent of t, and (H\_t^n) is n! times its leading coefficient in m; so (H\_η^n) = (H\_s^n) > 0. Nefness: for an integral curve C\_η ⊂ T\_η, its closure 𝒞 ⊂ T is flat over R and its special fibre is an effective 1-cycle Σ a\_iC\_i on T\_s; constancy of χ on 𝒞 gives (H·C\_η) = Σ a\_i (H·C\_i) ≥ 0. A nef divisor with positive top self-intersection on an integral proper scheme is big (1.6); both conditions depend only on numerical classes.

*Needs:* [1.5](#np-1-5); [1.6](#np-1-6); [0.5](#np-0-5); SchemeAndStackFoundations Layer 5.

**Checks.**

- For T = P^n\_R and H = O(1), both restrictions are ample.
- The converse fails: a nef and big class on the generic fibre can specialise to a non-nef class when a (−1)-curve appears in the special fibre (blow-up of a point of the special fibre).


<a id="np-5-6"></a>

### 5.6 Relatively semiample, relatively numerically trivial sheaves descend

Prove. Let f : X → Z be a contraction of schemes proper over a Noetherian scheme S, and L an invertible sheaf on X that is f-semiample and f-numerically trivial. Then there are m ≥ 1 and an invertible sheaf M on Z with L^{⊗m} ≅ f\*M. For ℚ-Cartier divisors: an f-semiample, f-numerically trivial ℚ-Cartier D on X is ℚ-linearly equivalent to f\* of a ℚ-Cartier divisor on Z.

*Hypotheses.* f a contraction; L f-semiample and ≡\_f 0.

*Source.* Bhatt et al. 2023, Proposition 2.51, second assertion and proof, pp. 26–27: For the semiample fibration of a nef L, every relatively numerically trivial ℚ-Cartier divisor descends; the proof makes L + D semiample over the base and descends it.; Bhatt et al. 2023, Proposition 9.16(a), p. 106: In the contraction of an extremal face, numerically trivial ℚ-Cartier divisors over Z descend to Z.; atlas paper extraction, PAPER-HACON-WITASZEK-23/semistable-numerical-descent: Prop 5.4's final assertion: for the base point free contraction, f-numerically trivial ℚ-Cartier divisors are ℚ-linearly pulled back.

*Proof sketch.* Choose m with f\*f\_\*L^{⊗m} → L^{⊗m} surjective; it defines a Z-morphism φ : X → P = P\_Z(f\_\*L^{⊗m}) with L^{⊗m} ≅ φ\*O\_P(1). Since L ≡\_f 0, φ maps every curve in a fibre of f to a point (O\_P(1) is ample on the fibres of P → Z); by 3.2 φ = h ∘ f for a unique Z-morphism h : Z → P. Then L^{⊗m} ≅ f\*(h\*O\_P(1)); put M := h\*O\_P(1).

*Needs:* [3.2](#np-3-2); [3.3](#np-3-3); [0.4](#np-0-4); [3.1](#np-3-1).

**Checks.**

- For f the structure map X → X^aff of a proper k-scheme and L torsion, the conclusion holds with M trivial on the finite X^aff.
- Semiampleness cannot be dropped: on an elliptic curve E → Spec k, O(p − q) of infinite order is numerically trivial and no power is pulled back from the point.


<a id="np-5-7"></a>

### 5.7 Vertical numerical descent (Cascini–Tanaka, Lemma 2.17)

Prove. Let f : X → S be a proper morphism of integral normal excellent schemes with f\_\*O\_X = O\_S, and L a ℚ-Cartier ℚ-divisor on X. Assume S is ℚ-factorial, L is f-nef, L restricted to the generic fibre X\_{K(S)} is ℚ-linearly trivial, and every prime divisor D of X has f(D) equal to S or to a prime divisor of S. Then L ∼\_ℚ f\*M for a ℚ-Cartier ℚ-divisor M on S.

*Hypotheses.* f proper, X, S integral normal excellent, f\_\*O\_X = O\_S; S ℚ-factorial; L f-nef, generically ℚ-trivial; no prime divisor of X maps to a closed subset of codimension ≥ 2.

*Source.* Cascini–Tanaka 2020, Lemma 2.17 and proof, pp. 16–17: For a proper morphism of integral normal excellent schemes with f\_\*O\_X = O\_S, a ℚ-Cartier L which is f-nef, ℚ-trivial on the generic fibre, with S ℚ-factorial and every prime divisor dominating S or mapping onto a prime divisor, is ℚ-linearly a pullback.; Bhatt et al. 2023, proofs of Lemmas 2.54 and 9.25, pp. 27 and 111: Applies Cascini–Tanaka Lemma 2.17 to deduce relative torsion or pullback of a nef divisor along an equidimensional fibration over a regular base.; Witaszek 2022, proof of Proposition 6.6: Applies Cascini–Tanaka Lemma 2.17 for vertical ℚ-pullback in the EWM argument.

*Proof sketch.* Replace L by a Cartier multiple; generic ℚ-triviality gives mL + div(φ) = L′ with Supp L′ ⊂ f^{-1}(S₀), S₀ ⊊ S closed. By hypothesis every component of L′ maps onto a prime divisor P of S; ℚ-factoriality makes f\*P a ℚ-Cartier divisor, and subtracting a multiple of f\*P makes L′ ≤ 0 over the generic point of P with one coefficient zero. Over the discrete valuation ring O\_{S,P}, an f-nef vertical divisor that is ≤ 0 with a zero coefficient vanishes (negativity of vertical divisors: the fibre over P is connected by f\_\*O = O, and the Zariski-type argument of 4.6 applies on surfaces cut from the fibre). Induct on the number of such P.

*Needs:* [1.5](#np-1-5); [4.6](#np-4-6); [3.1](#np-3-1); SchemeAndStackFoundations Layer 0.

**Checks.**

- For f a projective bundle over a regular S, every f-nef L trivial on the generic fibre is a pullback.
- The last hypothesis is needed: for the blow-up f : X = Bl\_p S → S of a closed point on a regular surface, L = O(−E) is f-nef ((−E)·E = 1), trivial on the generic fibre, and not ℚ-linearly a pullback since pullbacks have degree 0 on E; here E maps to a point.


<a id="np-5-8"></a>

### 5.8 Extremal curves of minimal normalised degree on a ray

Prove. Let f : X → T be projective with T Noetherian, R ⊂ NE‾(X/T) a ray containing the class of some curve over T, and H an f-ample Cartier divisor. For curves C over T with [C] ∈ R, the numbers (H·C)/d\_C are positive integers, where d\_C is the curve index of C over the residue field of its image point (0.2). Hence the minimum μ\_H(R) = min{(H·C)/d\_C : [C] ∈ R} is attained; a curve attaining it is called extremal. Extremality does not depend on H, and for every ℚ-Cartier D with D·R < 0, an extremal Γ maximises (D·C)/d\_C among curves in R.

*Hypotheses.* f projective, T Noetherian; R a ray spanned by a curve class.

*Source.* Bhatt et al. 2023, Definition 9.30 and the following paragraph, p. 116: A curve Γ in an extremal ray is extremal if it minimises H·C/d\_C; the notion is independent of the ample H, and negative divisors on the ray are maximised by it.

*Proof sketch.* d\_C divides (H·C) (0.2), and (H·C) > 0 for f-ample H, so (H·C)/d\_C ∈ ℤ\_{>0}; a nonempty set of positive integers has a minimum. All curves in R have classes λ\_C·ξ for a fixed generator ξ with λ\_C > 0; for another ample H′, (H·C)/(H′·C) = (H·ξ)/(H′·ξ) is constant on R, so the minimisers coincide. For D·R < 0, (D·C)/d\_C = λ\_C(D·ξ)/d\_C with D·ξ < 0 is maximal exactly where λ\_C/d\_C, equivalently (H·C)/d\_C, is minimal.

*Needs:* [0.2](#np-0-2); [1.2](#np-1-2).

**Checks.**

- On P^n\_k over k the lines are extremal, with (O(1)·line)/d = 1.
- For X = P¹\_ℂ viewed over T = Spec ℝ, d\_X = 2 and (O(1)·X)\_ℝ/d\_X = 1.


<a id="np-5-9"></a>

### 5.9 The Alexeev–Hacon–Kawamata birational Picard rank

Construct `Numerical.ahkRank`. Let Y be a normal integral scheme projective over a Noetherian base U admitting a projective resolution, that is a proper birational morphism π : X → Y with X regular and projective over U, such that any two resolutions are dominated by a third. Put ρ\_AHK(Y/U) := ρ(X/U) − #{prime divisors of X exceptional over Y}. This integer does not depend on the resolution, is unchanged by small (isomorphic in codimension one) birational modifications of Y over U, and agrees with ρ(Y/U) when Y is regular (more generally ℚ-factorial). It is not the naive relative Picard number of a singular Y.

*Hypotheses.* Y normal, projective over U; resolutions exist and any two are dominated by a third (a hypothesis in mixed characteristic, a theorem in characteristic zero).

*Source.* Alexeev–Hacon–Kawamata 2007, Lemma 1.6 and proof, pp. 3–4: For a birational morphism of projective varieties from a smooth X onto a normal Y, the exceptional divisors are independent in N¹(X), and dim N¹(X) ⊗ ℝ minus their number is independent of the resolution and positive.; Hacon–Witaszek 2023, §3, p. 12: The Picard rank of Alexeev–Hacon–Kawamata, Lemma 1.6, strictly drops along divisorial steps of normalised special-fibre components; it is used in the termination argument.

*Construction.* The exceptional prime divisors E\_1, …, E\_m of a resolution are linearly independent in N¹(X/U): cutting by general hyperplanes reduces to surfaces, where 4.5 applies. For a birational morphism g : X₃ → X₁ of regular schemes, Pic(X₃) = g\*Pic(X₁) ⊕ ⊕ℤE\_j over the g-exceptional E\_j (regularity makes every divisor Cartier), and the independence above gives ρ(X₃/U) = ρ(X₁/U) + #Exc(g). The exceptional divisors of X₃ → Y are the strict transforms of those of X₁ → Y together with Exc(g), so the difference is unchanged; a third resolution dominating two given ones compares any two. A small modification Y ⇢ Y′ has a common resolution with the same exceptional divisors over Y and Y′.

*Uses.* Hacon–Witaszek 2023, termination arguments (§3): a birational invariant that decreases under divisorial contractions and is stable under flips; Alexeev–Hacon–Kawamata 2007, Definition 2.3 (difficulty): a summand of the difficulty function in termination of flips.

The API:

- `Numerical.ahkRank` (data): ρ\_AHK(Y/U) ∈ ℤ from a chosen resolution, with the independence theorem.
- `Numerical.ahkRank_eq_of_resolution` (characterisation): For every resolution π : X → Y, ρ\_AHK(Y/U) = ρ(X/U) − #Exc(π).
- `Numerical.ahkRank_regular` (compatibility): If Y is regular, ρ\_AHK(Y/U) = ρ(Y/U).
- `Numerical.ahkRank_small` (other): ρ\_AHK is invariant under birational maps over U that are isomorphisms in codimension one.
- `Numerical.ahkRank_divisorialContraction` (relation): For a divisorial contraction Y → Y′ over U of normal varieties with resolutions, ρ\_AHK(Y′/U) = ρ\_AHK(Y/U) − 1.

*Needs:* [1.1](#np-1-1); [4.5](#np-4-5); [1.4](#np-1-4); SchemeAndStackFoundations Layer 4.

**Checks.**

- `Numerical.ahkRank_projectivePlane` (computation): ρ\_AHK(P²/k) = 1, computed on P² or on any blow-up Bl\_{p}P² (2 − 1).
- `Numerical.ahkRank_regular_point` (degenerate): For Y = U, ρ\_AHK(U/U) = 0.
- `Numerical.ahkRank_quadricCone` (computation): For the projective cone Y over a smooth conic, the minimal resolution is the Hirzebruch surface F₂ with ρ = 2 and one exceptional curve, so ρ\_AHK(Y/k) = 1.
- `Numerical.ahkRank_ne_naive` (non-example): For a small resolution X → Y of a threefold ordinary double point there are no exceptional divisors, so ρ\_AHK(Y) = ρ(X) exceeds the rank of the Cartier classes of Y by one: ρ\_AHK is not the naive Picard rank of a singular Y.
- For Y regular, ρ\_AHK(Y/U) = ρ(Y/U).
- For the cone over a smooth plane conic (an A₁ surface singularity) over U = Spec k, ρ\_AHK = 1 while the resolution has ρ = 2.


### Dependencies

This layer uses Layer 0, Layer 1, Layer 3, Layer 4, AlgebraicModuliForArithmeticGeometry Layer 7, SchemeAndStackFoundations Layer 0, SchemeAndStackFoundations Layer 4, SchemeAndStackFoundations Layer 5.


## Downstream consumers

- Enriques surfaces and nonexistence over the integers uses Num_{X/k}, constancy and Theorems 1.3 and 2.1 (2.6, 3.7, 4.7–4.9) for descent of numerical classes, (−2)-curves, genus-one fibrations and fibre graphs over finite fields and over ℤ; the doubling lift (2.11) and openness of ampleness for algebraic spaces (3.8) for local projectivity of Enriques families.
- The point count of a surface with constant numerical local system (WeilConjectures WC.7) uses constancy (2.7).
- The birational-geometry continuation of SchemeAndStackFoundations (minimal model program in positive and mixed characteristic) uses Layers 1 and 5: N¹, NE‾, nefness and bigness, restriction to the special fibre, numerical representatives, cone identification, nef-and-big transfer, semiample descent, vertical descent, extremal curves and the AHK rank.
- The positivity continuation of SchemeAndStackFoundations uses nefness, bigness, semiampleness (1.5, 1.6, 3.3), the semiample contraction (3.4), vertical descent (5.7) and torsion over locally finite fields (2.12).
- The genus-one roadmap uses Zariski's lemma (4.6) and the norms of Picard classes (2.8).
- The stable-surface moduli roadmap uses Layers 1 and 3 and the semiample descent of Layer 5.


## Corrections to the sources

The statements above use the corrected forms below.

- Cascini–Tanaka 2020, Lemma 2.17, pp. 16–17 (arXiv v3) (misprint). The conclusion asks for a ℚ-Cartier ℚ-divisor M on Y with L ∼\_ℚ f\*M, although the morphism of the lemma is f : X → S and no Y occurs. Correction: M is a ℚ-Cartier ℚ-divisor on S. Reason: f\*M is defined only for M on the target S of f; the hypotheses (ℚ-factoriality, images of prime divisors) all concern S.
- Schröer 2023, Lemma 1.1, p. 5 (arXiv v3) (misprint). Constancy of Num\_{X/k} is characterised by the existence of an integer d ≥ 0 with the descent property for d-th powers. Correction: d ≥ 1; with d = 0 the property holds for every X. Reason: For X = P¹\_ℂ viewed over ℝ, d = 0 satisfies the condition with N = O while Num is not constant.
- Schröer 2023, proof of Lemma 1.1, p. 5 (arXiv v3) (error). The proof takes P′ = Pic\_{X′/E} and asserts that R¹pr\_\*P′ vanishes by the argument of Lemma 1.4. Correction: Take P′ = Pic^τ\_{X′/E}; the vanishing claim is not needed, since the five-term sequence already makes H¹(k, pr\_\*P′) → H¹(E, P′) injective. Reason: With the full Picard scheme the torsor class is trivially zero; the vanishing fails for nonreduced P′ over inseparable E.
- Schröer 2023, §1, p. 6, paragraph before Proposition 1.2 (arXiv v3) (error). Component-preserving morphisms induce maps of dual graphs sending edges to edges. Correction: Edges go to edges or to a single vertex; to edges when the vertex map is bijective. Reason: x² + y² = 0 over ℝ is irreducible while its complexification has two meeting components.
- Schröer 2023, Proposition 1.2, p. 6 (arXiv v3) (error). For one-dimensional X, Num constant iff the geometric-to-schematic graph map is an isomorphism. Correction: Assume every irreducible component of X is one-dimensional. Reason: X = P¹\_ℝ ⊔ Spec ℂ has constant Num = ℤ but three geometric vertices over two.
- Schröer 2023, §2, p. 8 (arXiv v3) (error). A contraction of a smooth proper surface with h⁰(O) = 1 is birational onto a geometrically normal surface or of fibre type onto a smooth curve. Correction: Add the contraction to Spec k. Reason: The structure morphism is a contraction since h⁰(O\_S) = 1.
- Schröer 2023, Theorem 2.1(ii), p. 8 (arXiv v3) (gap). Label preservation is said to follow immediately from (i) and the definitions. Correction: Labels over k scale by [κ(a):k]; prove κ(a) = k from (iii) and smoothness (compare q with q²). Reason: At a closed point with κ(a) ≠ k intersection numbers on S over k are multiplied by [κ(a):k].
- Schröer 2023, proof of Theorem 2.1, fibre-type case, p. 9 (arXiv v3) (gap). Injectivity on the two subcurves C₁+…+C\_{r−1} and C₂+…+C\_r is used to conclude that Galois fixes every component. Correction: Use (C\_i − C\_j)·C\_i = C\_i² − (C\_i·C\_j) < 0 to separate all classes. Reason: The two subcurves do not exclude an exchange of C₁ and C\_r (for r = 2 they are C₁ and C₂ separately).
- Hacon–Witaszek 2023, proof of Theorem 1.3(2), pp. 33–34 (arXiv v2; published Theorem 6.1(2b)) (gap). Surjectivity of N¹(𝒳/S) → N¹(X) is used to choose Cartier divisors on 𝒳 whose restrictions equal given divisors on X. Correction: Surjectivity supplies only ℚ-Cartier classes whose restrictions are numerically equivalent to the given ones (5.2). Reason: For 𝒳 = E ⊗ ℤ\_(7), E = 11a1, numerical surjectivity holds but degree-zero classes outside the image of E(ℚ) → E(𝔽₇) are not restrictions.

## Open input

- **Supplier of finiteness of H²\_ét(X, μ\_ℓ) for proper X over an algebraically closed field.** 1.3 bounds ρ(X) by dim\_{𝔽\_ℓ} H²\_ét(X, μ\_ℓ) via the Kummer injection Pic(X)/ℓ ↪ H²\_ét(X, μ\_ℓ); this needs the finiteness theorem for étale cohomology of proper schemes over a separably closed field with ℓ-torsion coefficients (SGA 4, Exposé XIV; SGA 4½, Th. finitude). No layer of the atlas was found that owns it in this form (candidates: EtaleDualityAndPerverseSheaves, ClassicalAdicEtaleCohomology, WeilConjectures WC.0). The alternative route through the theorem of the base (SGA 6, Exposé XIII, Theorem 5.1) is cited from a source that is not freely available. Either an owner of the finiteness theorem is assigned, or the theorem of the base is planned with a free source.

## References

- Schröer 2023: Stefan Schröer, *There is no Enriques surface over the integers*, arXiv:2004.07025v3 (identical to the author version of 19 July 2022; printed page = PDF page); published Annals of Mathematics 197 (2023), 1–63. <https://arxiv.org/pdf/2004.07025v3>
- Kleiman, The Picard scheme: Steven L. Kleiman, *The Picard scheme*, arXiv:math/0504020v1 (PDF page = printed page); published in Fundamental Algebraic Geometry, Math. Surveys Monogr. 123, AMS 2005 (numbering 9.x). <https://arxiv.org/pdf/math/0504020v1>
- Bhatt et al. 2023: Bhargav Bhatt, Linquan Ma, Zsolt Patakfalvi, Karl Schwede, Kevin Tucker, Joe Waldron, Jakub Witaszek, *Globally +-regular varieties and the minimal model program for threefolds in mixed characteristic*, arXiv:2012.15801v3 (pages are PDF pages of v3); published Publ. Math. IHÉS 138 (2023). <https://arxiv.org/pdf/2012.15801v3>
- Hacon–Witaszek 2023: Christopher Hacon, Jakub Witaszek, *On the relative minimal model program for fourfolds in positive and mixed characteristic*, arXiv:2009.02631v2 (PDF pages; the published Forum Math. Pi 11 (2023) renumbers Theorem 1.3 of §6 as Theorem 6.1). <https://arxiv.org/pdf/2009.02631v2>
- Witaszek 2022: Jakub Witaszek, *Keel's base point free theorem and quotients in mixed characteristic*, arXiv:2002.11915v2; published Annals of Mathematics 195 (2022), 655–705. <https://arxiv.org/pdf/2002.11915v2>
- Das–Waldron 2022: Omprokash Das, Joe Waldron, *On the log minimal model program for threefolds over imperfect fields of characteristic p > 5*, arXiv:1911.04394v3; published J. London Math. Soc. (2022). <https://arxiv.org/pdf/1911.04394v3>
- Cascini–Tanaka 2020: Paolo Cascini, Hiromu Tanaka, *Relative semi-ampleness in positive characteristic*, arXiv:1706.04845v3; published Proc. London Math. Soc. 121 (2020). <https://arxiv.org/pdf/1706.04845v3>
- Alexeev–Hacon–Kawamata 2007: Valery Alexeev, Christopher Hacon, Yujiro Kawamata, *Termination of (many) 4-dimensional log flips*, arXiv:math/0605137v2; published Invent. Math. 168 (2007). <https://arxiv.org/pdf/math/0605137v2>
- Lipman 1969: Joseph Lipman, *Rational singularities, with applications to algebraic surfaces and unique factorization*, Publ. Math. IHÉS 36 (1969), 195–279 (Numdam). <https://www.numdam.org/item/PMIHES_1969__36__195_0.pdf>
- EGA IV₃: Alexander Grothendieck (with Jean Dieudonné), *Éléments de géométrie algébrique IV, troisième partie*, Publ. Math. IHÉS 28 (1966), Numdam scan (copy cleared by the maintainer). <https://www.numdam.org/item/PMIHES_1966__28__5_0/>
- Stacks: The Stacks project authors, *The Stacks project*, online, tags read 19 October 2026 (stable tags are the locators). <https://stacks.math.columbia.edu>
- atlas paper extraction: Tau Ceti Atlas workers (reviewed), *Reviewed paper extractions of the Tau Ceti Atlas*, research/blueprint/papers/PAPER-SCHROER-23, PAPER-HACON-WITASZEK-23, PAPER-BHATT-ETAL-23 and PAPER-WITASZEK-22 result files at this commit; item and source-issue ids are the locators.
- SGA 6, Exposé XIII: Steven L. Kleiman (exposé), in P. Berthelot, A. Grothendieck, L. Illusie, *Théorie des intersections et théorème de Riemann–Roch (SGA 6), Exposé XIII: Les théorèmes de finitude pour le foncteur de Picard*, Lecture Notes in Math. 225, Springer, 1971.
- Lazarsfeld 2004: Robert Lazarsfeld, *Positivity in Algebraic Geometry I*, Ergebnisse 48, Springer, 2004.
- Debarre 2001: Olivier Debarre, *Higher-Dimensional Algebraic Geometry*, Universitext, Springer, 2001.
