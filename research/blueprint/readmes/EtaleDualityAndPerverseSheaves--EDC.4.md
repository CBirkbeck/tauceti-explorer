# Étale duality, cycle classes and perverse sheaves — Part 2: weak Lefschetz, perverse sheaves, comparisons, decomposition and correspondences (EDC.4–EDC.8)

This document is the plan for the second part of the roadmap EtaleDualityAndPerverseSheaves:
its stages EDC.4, EDC.5, EDC.6, EDC.7 and EDC.8. It agrees with the blueprint packet
research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.4.json, which is definitive for
node identifiers and prerequisites, and with the suggested Lean file
research/blueprint/suggested/EtaleDualityAndPerverseSheaves--EDC.4.lean. Every stage in scope
is planned at target level: each target the stage text states is a node, and every prerequisite
chain ends in a declaration of the pinned libraries, in a node of another blueprint, in a
requested stage of another roadmap, or in a recorded gap. Nothing here is claimed to be
formalised.

The first part (EDC.0 coefficients and supports, EDC.1 the exceptional inverse image and
Verdier duality, EDC.2 smooth trace, purity and Poincaré duality, EDC.3 Gysin maps and cycle
classes) is the packet EtaleDualityAndPerverseSheaves--EDC.0; this part imports its nodes by
identifier.

## Purpose and boundaries

This part turns the duality formalism of part EDC.0 into the tools its consumers use: the
Lefschetz theorems and the cohomology of projective bundles and blow-ups (for Weil I and II,
Lefschetz pencils and complete intersections), the perverse t-structure and intersection
complexes (for geometric Satake, Hitchin and shtuka geometry, nearby cycles and Igusa
varieties), the comparisons with ℓ-adic, analytic and diamond coefficients, the decomposition
theorem, and the Lefschetz–Verdier trace formalism with the determinant interface of the Weil
conjectures.

Ownership follows the accepted restructuring proposal RS-19, which keeps every layer of this
roadmap. The finite-coefficient foundations (constructible sheaves, proper and smooth base
change, finiteness, Artin vanishing, the ℓ-adic formalism and the complex comparison) belong to
CohomologicalPointCounting (Tau Ceti pull request 196), requested as every packet does from its
integration owner SchemeAndStackFoundations:SF.2; blow-ups, ample divisors and parameter
schemes from SchemeAndStackFoundations:SF.0; Weil II weights from DeligneWeightsAndPurity
DWP.7–DWP.9 (accepted packet, cited by node); the scheme/diamond comparisons of ECD §27 from
AdicCoefficientsAndComparisons L2–L6 and Huber's comparisons from ClassicalAdicEtaleCohomology
H5 (cited by node); the derived completion of the pro-étale side from EnhancedDerivedSheaves E4
(cited by node).

Non-goals, each with its owner. Stacks (Laszlo–Olsson, Liu–Zheng, Behrend) and perfect schemes
(Zhu, Appendix A.3; Hansen–Kaletha–Weinstein 5.6.2) are the two Part II roadmaps proposed by
part EDC.0 and endorsed here, after the confirmed findings RT-AREA-etale/3 and
RT-AREA-etale/16. Relative perverse t-structures and universal local acyclicity are not in the
text of these stages (gaps record who asked for them). Nearby cycles belong to
LefschetzPencilsAndVanishingCycles. Hard Lefschetz itself is DWP.9's; ordinary Frobenius point
counting is TraceFormula's; the contracting-boundary trace theorem is ET.5's; the zeta
functional equation is assembled by WeilConjectures WC.2.

## Baseline and conventions

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Mathlib supplies t-structures (`TStructure`),
hearts as object properties with BBD's abelian-subcategory criterion
(`AbelianSubcategory.abelian`), homological functors, the canonical t-structure on derived
categories, the affineness of closed subschemes of affine schemes and of basic opens of Proj,
and the linear algebra of characteristic polynomials and dual maps. Everything else is planned
here or imported.

- `mathlib:AlgebraicGeometry.isClosedImmersion_iff_isAffineHom`
  (Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean): A morphism is a closed immersion
  iff it is affine and surjective on sections over affine opens; used to see that a closed
  subscheme of an affine scheme maps to it by an affine morphism.
- `mathlib:AlgebraicGeometry.isAffine_of_isAffineHom`
  (Mathlib/AlgebraicGeometry/Morphisms/Affine.lean): If f : X → Y is an affine morphism and Y
  is affine, X is affine; gives the affineness of X − Y for a hyperplane section Y.
- `mathlib:AlgebraicGeometry.Proj.basicOpenIsoSpec`
  (Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean): The basic open D_+(f) of Proj of a
  graded algebra is isomorphic to Spec of the degree-zero part of the localization at f; the
  complement of a hyperplane in projective space is affine.
- `mathlib:CategoryTheory.Triangulated.TStructure`
  (Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean): t-structures on a
  pretriangulated category, given by the predicates le n and ge n with shift, orthogonality and
  truncation-triangle axioms; the carrier of every t-structure in EDC.5.
- `mathlib:CategoryTheory.Triangulated.TStructure.heart`
  (Mathlib/CategoryTheory/Triangulated/TStructure/Heart.lean): The heart t.le 0 ⊓ t.ge 0 of a
  t-structure as an object property; the Heart class identifies a category with it.
- `mathlib:CategoryTheory.Triangulated.AbelianSubcategory.abelian`
  (Mathlib/CategoryTheory/Triangulated/TStructure/AbelianSubcategory.lean): BBD 1.2: a full
  additive subcategory of a triangulated category with no negative Exts and all morphisms
  admissible is abelian; applied to the heart in EDC.5/t-structure-heart-abelian (the theorem
  that the heart is abelian is a TODO in Heart.lean at the pin).
- `mathlib:CategoryTheory.Functor.IsHomological`
  (Mathlib/CategoryTheory/Triangulated/HomologicalFunctor.lean): A functor from a
  pretriangulated to an abelian category is homological if it sends distinguished triangles to
  exact sequences; the property of H⁰_t.
- `mathlib:DerivedCategory.TStructure.t`
  (Mathlib/Algebra/Homology/DerivedCategory/TStructure.lean): The canonical t-structure on the
  derived category D(C) of an abelian category; the comparison object of the unit tests of
  EDC.5.
- `mathlib:CategoryTheory.Functor.IsTriangulated`
  (Mathlib/CategoryTheory/Triangulated/Functor.lean): Triangulated functors (sending
  distinguished triangles to distinguished triangles); the six functors of a recollement are
  triangulated.
- `mathlib:Matrix.charpoly_transpose` (Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean):
  charpoly(Mᵀ) = charpoly(M); used for the reciprocity of characteristic polynomials of a
  pairing similitude.
- `mathlib:LinearMap.det_dualMap` (Mathlib/LinearAlgebra/Determinant.lean): The determinant of
  the dual map of an endomorphism of a finite free module equals its determinant.

Conventions. ℓ is a prime invertible on every scheme; coefficient rings are ℤ/ℓ^m, O_E/λ^m,
O_E, E or ℚ̄_ℓ as each node states. Perversity is the middle perversity of BBD §4.0: K ∈
pD^{≤0} iff ℋ^i(K)_x̄ = 0 for i > −dim(x) at every point x, with dim(x) the dimension of its
closure; IC_X(L) := j_!*(L[d]) is unnormalized (no half Tate twist). Weights are Deligne's
ι-weights; K has weights ≤ w when the pointwise weights of ℋ^iK are ≤ w + i (BBD 5.1.8).
Geometric Frobenius acts on Λ(−1) by q (part EDC.0's convention). A cohomological
correspondence from (X, L) to (Y, M) is u : ←c^*L → →c^!M on C (Lu–Zheng, Yun–Zhang); the stage
text's c₂^*K → c₁^!K is the same notion with the legs named in the other order.

## Dependency order

EDC.4 and EDC.5 rest on part EDC.0 (EDC.2 and EDC.3 for EDC.4; EDC.1 and EDC.2 for EDC.5).
EDC.6 uses EDC.5 for the ℓ-adic perverse t-structure. EDC.7 uses EDC.5, EDC.6 and DWP.7–DWP.9.
EDC.8 uses EDC.1 and EDC.2 and the pairings of part EDC.0. Within EDC.5, the abstract
t-structure nodes precede the perverse ones.

## EDC.4 — Weak Lefschetz, projective bundles and blow-ups

Artin's affine vanishing theorem (imported) and Poincaré duality (part EDC.0) give the
vanishing of low-degree compactly supported cohomology of smooth affine varieties, hence weak
Lefschetz for a hyperplane section and, through the Gysin sequence, its dual form; Deligne's
universal-coefficient argument refines it to ℤ_ℓ. The same argument covers ample divisors and
smooth complete intersections. The projective-bundle decomposition of part EDC.0 is refined to
keep track of Tate twists and Frobenius on every summand, and proper base change computes the
direct images along the blow-up of a smooth centre, giving the blow-up formula with every map
identified. Vanishing and restricted subspaces of a hyperplane section are constructed as
orthogonal complements; no direct-sum splitting requiring hard Lefschetz is asserted (that is
DeligneWeightsAndPurity:DWP.9).

### `affine-vanishing-hypercohomology` — Artin vanishing for constructible complexes on affine schemes

Node `EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology` (theorem).

Let k be a separably closed field, n ≥ 1 invertible in k, Λ a noetherian ring with nΛ = 0, and
U an affine scheme of finite type over k. (a) For every constructible sheaf F of Λ-modules on
U_ét with dim Supp F ≤ e, H^q(U, F) = 0 for q > e (Artin's affine vanishing theorem, SGA 4 XIV
3.1–3.2, imported). (b) Let K ∈ D^b_c(U, Λ) and let d_q ∈ ℤ ∪ {−∞} satisfy dim Supp ℋ^q(K) ≤
d_q for every q (dim ∅ = −∞). Then H^m(U, K) = 0 for every m > max_q (q + d_q). (c) In
particular, if dim Supp ℋ^q(K) ≤ −q for all q, then H^m(U, K) = 0 for m > 0; and H^m(U, K) = 0
for m > dim U + max{q : ℋ^q(K) ≠ 0}. The same bounds hold for K ∈ D^b_c(U, O_E) and D^b_c(U, E)
(E/ℚ_ℓ finite, ℓ invertible in k), by passage to the limit.

Hypotheses. k separably closed; n invertible in k; Λ noetherian with nΛ = 0 (for (a) and (b)).
U affine of finite type over k; affineness is essential: H²(P¹, Λ(1)) = Λ although dim P¹ = 1.
For O_E and E coefficients, the finiteness and Mittag-Leffler properties of the ℓ-adic
formalism are imported (EllAdicRealization through SchemeAndStackFoundations:SF.2).

Construction and proof. (1) (a) is SGA 4 XIV Corollaire 3.2 (Artin), requested from
SchemeAndStackFoundations:SF.2 as part of the constructible-sheaf toolkit of
CohomologicalPointCounting; BBD Corollaire 4.1.4 restates it. (2) (b) Use the hypercohomology
spectral sequence E₂^{p,q} = H^p(U, ℋ^q K) ⇒ H^{p+q}(U, K), which converges because K is
bounded. By (a), E₂^{p,q} = 0 for p > d_q, so every term with p + q = m vanishes when m > q +
d_q for all q. (3) (c) is (b) with d_q = −q, respectively d_q = dim U. (4) Adic coefficients:
H^m(U, K) = lim_r H^m(U, K ⊗^L O_E/λ^r) for K ∈ D^b_c(U, O_E) (finite groups, Mittag-Leffler),
and H^m(U, K ⊗ E) = H^m(U, K) ⊗ E.

Acceptance. U = 𝔸¹_k, F constructible: H^q(𝔸¹, F) = 0 for q ≥ 2; the bound is sharp: H¹(𝔾_m,
ℤ/n) ≅ ℤ/n(−1) ≠ 0. K = i_{x*}Λ[−q] for a closed point x: d_q = 0, and H^m(U, K) = 0 for m ≠ q,
as (b) predicts. Non-example: U = P¹ is not affine and H²(P¹, Λ(1)) ≅ Λ, so affineness cannot
be dropped.

Depends on: `SchemeAndStackFoundations:SF.2`,
`EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`,
`EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`.

Source: Deligne-WeilII-1980, §4, (4.1.6), p. 218; SGA4-XIV, XIV, Corollaire 3.2, LNM 305 pp.
159–160.

### `compact-support-vanishing-smooth-affine` — Vanishing of low-degree compactly supported cohomology of smooth affine varieties

Node `EtaleDualityAndPerverseSheaves:EDC.4/compact-support-vanishing-smooth-affine` (theorem).

Let k be separably closed, n invertible in k, Λ = O/π^m (more generally a noetherian
self-injective ring killed by n), U a smooth affine k-scheme of pure dimension d and L a
locally constant constructible sheaf of Λ-modules on U. Then H^i_c(U, L) = 0 for i < d. The
same holds for a lisse O_E-sheaf or a lisse E-sheaf L (E/ℚ_ℓ finite, ℓ invertible in k).

Hypotheses. k separably closed, n invertible; U smooth, affine, of pure dimension d. Λ
self-injective, so that Poincaré duality is a perfect pairing degreewise; for O_E use the
derived duality and the universal-coefficient sequence.

Construction and proof. (1) Poincaré duality (EDC.2:pairings/poincare-duality-torsion):
H^i_c(U, L) ≅ Hom_Λ(H^{2d−i}(U, L^∨(d)), Λ). (2) Artin vanishing
(EDC.4/affine-vanishing-hypercohomology (a)) with e = d: H^{2d−i}(U, L^∨(d)) = 0 when 2d − i >
d, that is i < d. (3) For O_E: the derived duality RΓ_c(U, L) ≅ RHom_{O_E}(RΓ(U, L^∨(d)[2d]),
O_E) of EDC.2:pairings/adic-and-rational-poincare-duality and the vanishing of H^j(U, L^∨(d))
for j > d give H^i_c = 0 for i < d (the Ext¹ term involves H^{2d−i+1}, which vanishes for i < d
+ 1).

Acceptance. U = 𝔸^d: H^i_c(𝔸^d, Λ) = 0 for i ≠ 2d, in particular for i < d. U = 𝔾_m (d = 1):
H⁰_c(𝔾_m, Λ) = 0 while H¹_c(𝔾_m, Λ) = Λ ≠ 0 — the bound i < d is sharp. Non-example: U = P¹ − ∅
is not affine and H⁰_c(P¹, Λ) = Λ ≠ 0 although d = 1.

Depends on: `affine-vanishing-hypercohomology`,
`EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`,
`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`.

Source: Deligne-WeilII-1980, §4, (4.1.6), p. 219.

### `weak-lefschetz` — The weak Lefschetz theorem ★

Node `EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz` (theorem); planet “Weak Lefschetz
theorem”.

Let k be a separably closed field, ℓ a prime invertible in k, X a smooth projective k-scheme of
pure dimension n + 1 with a closed immersion X ⊂ P^N_k, H ⊂ P^N a hyperplane and Y = X ∩ H
(scheme-theoretic, Y ≠ X), with inclusion i : Y → X. Let Λ be ℤ/ℓ^m, O_E/λ^m, O_E or E (E/ℚ_ℓ
finite), and L a locally constant constructible (respectively lisse) sheaf of Λ-modules on X.
Then the restriction i^* : H^q(X, L) → H^q(Y, i^*L) is an isomorphism for q < n and injective
for q = n. Y need not be smooth. If X, Y and L are defined over a subfield k₀ with k = k₀^sep,
i^* is Gal(k/k₀)-equivariant; over k₀ = 𝔽_q it commutes with the geometric Frobenius.

Hypotheses. k separably closed; ℓ invertible in k; X smooth projective of pure dimension n + 1;
Y = X ∩ H for a hyperplane H of an embedding X ⊂ P^N. U := X − Y is affine (a closed subscheme
of P^N − H ≅ 𝔸^N) and smooth of pure dimension n + 1; these are the only properties of Y used.
This theorem is distinct from hard Lefschetz (DeligneWeightsAndPurity:DWP.9) and makes no claim
about the nondegeneracy of the intersection form on the vanishing part
(EDC.4/vanishing-and-restriction-subspaces).

Construction and proof. (1) U = X − Y is affine: X − Y → P^N − H is a closed immersion, hence
an affine morphism (mathlib:AlgebraicGeometry.isClosedImmersion_iff_isAffineHom), into the
affine scheme P^N − H = D_+(h) ≅ Spec of a degree-zero localization
(mathlib:AlgebraicGeometry.Proj.basicOpenIsoSpec); so U is affine
(mathlib:AlgebraicGeometry.isAffine_of_isAffineHom). (2) The localization triangle j_!j^*L → L
→ i_*i^*L → for j : U → X open and i : Y → X closed (EDC.1:biduality/recollement-adjunctions)
gives, X being proper, the exact sequence … → H^q_c(U, L) → H^q(X, L) → H^q(Y, i^*L) →
H^{q+1}_c(U, L) → …. (3) By EDC.4/compact-support-vanishing-smooth-affine applied to the smooth
affine U of pure dimension n + 1, H^q_c(U, L) = 0 for q < n + 1. Hence i^* is injective for q ≤
n and surjective for q ≤ n − 1. (4) Equivariance: all maps are induced by morphisms of schemes
defined over k₀, hence commute with the Galois action
(EDC.2:pairings/galois-frobenius-equivariance for the conventions).

Acceptance. X = P^{n+1}, Y = P^n a hyperplane: i^* : H^q(P^{n+1}, Λ) → H^q(P^n, Λ) is an
isomorphism for q ≤ 2n (EDC.3/projective-space-cohomology), consistent with the theorem. X = P¹
× P¹ ⊂ P³ (n + 1 = 2), Y a smooth conic: i^* is injective on H¹ = 0 and an isomorphism on H⁰;
on H² (outside the range) the map Λ(−1)² → Λ(−1) is not injective, so the range q ≤ n is sharp.
n + 1 = 1 (X a smooth projective curve, Y a finite set of points): H⁰(X) → H⁰(Y) is injective.

Depends on: `compact-support-vanishing-smooth-affine`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`,
`EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`,
`mathlib:AlgebraicGeometry.isClosedImmersion_iff_isAffineHom`,
`mathlib:AlgebraicGeometry.Proj.basicOpenIsoSpec`,
`mathlib:AlgebraicGeometry.isAffine_of_isAffineHom`.

Source: Deligne-WeilII-1980, §4, (4.1.6), p. 218–219; Deligne-WeilI-1974, §7, p. 299.

### `weak-lefschetz-gysin` — The dual (Gysin) form of weak Lefschetz

Node `EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-gysin` (theorem).

In the situation of EDC.4/weak-lefschetz assume moreover that Y is smooth (a smooth hyperplane
section, of pure dimension n). Then the Gysin map i_* : H^q(Y, i^*L) → H^{q+2}(X, L(1)) is an
isomorphism for q > n and surjective for q = n, for Λ = ℤ/ℓ^m, O_E/λ^m, O_E or E and L locally
constant constructible (lisse). Equivalently H^{q+2}(X, L(1))/i_*H^q(Y, i^*L) injects into
H^{q+2}(U, L(1)), which vanishes for q + 2 > n + 1.

Hypotheses. As in EDC.4/weak-lefschetz, with Y smooth of pure dimension n (smooth pair (Y, X)
of codimension 1).

Construction and proof. (1) The Gysin sequence of the smooth pair (Y, X)
(EDC.3/gysin-sequence): … → H^{q+1}(U, L(1)) → H^q(Y, i^*L) →i_* H^{q+2}(X, L(1)) → H^{q+2}(U,
L(1)) → …. (2) U = X − Y is affine of dimension n + 1, so H^m(U, L(1)) = 0 for m > n + 1
(EDC.4/affine-vanishing-hypercohomology (a)). (3) Hence i_* is surjective when q + 2 > n + 1 (q
≥ n) and injective when q + 1 > n + 1 (q > n). (4) For field coefficients this is the transpose
of EDC.4/weak-lefschetz under Poincaré duality on X and Y (EDC.3/gysin-map: i_* is the
transpose of i^*), which gives the same ranges.

Acceptance. X = P^{n+1}, Y = P^n: i_* : H^q(P^n) → H^{q+2}(P^{n+1})(1) sends h^j to h^{j+1}; it
is an isomorphism for n < q ≤ 2n and surjective for q = n. n = 0: Y a finite set of d points on
a curve X; i_* : H⁰(Y) = Λ^d → H²(X, Λ(1)) = Λ is the sum map, surjective. The range is sharp:
for X = P¹ × P¹ and Y a conic, i_* : H⁰(Y) → H²(X)(1) is not surjective onto Λ² (q = 0 < n =
1).

Depends on: `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`,
`affine-vanishing-hypercohomology`, `EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`,
`weak-lefschetz`.

Source: Deligne-WeilII-1980, §4, (4.1.6), p. 219; Deligne-WeilI-1974, §7, p. 300.

### `weak-lefschetz-integral` — Integral weak Lefschetz: torsion-freeness of the cokernel

Node `EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-integral` (theorem).

In the situation of EDC.4/weak-lefschetz with L = ℤ_ℓ (U = X − Y, n + 1 = dim X): the group
H^{n+1}_c(U, ℤ_ℓ) is torsion-free, and consequently H^n(Y, ℤ_ℓ)/i^*H^n(X, ℤ_ℓ) is torsion-free.
The same holds for O_E in place of ℤ_ℓ.

Hypotheses. k separably closed, ℓ invertible; X smooth projective of pure dimension n + 1; Y =
X ∩ H a hyperplane section; U = X − Y. RΓ_c(U, ℤ_ℓ) is a perfect complex of ℤ_ℓ-modules with
RΓ_c(U, ℤ_ℓ) ⊗^L ℤ/ℓ ≅ RΓ_c(U, ℤ/ℓ) (ℓ-adic formalism imported through
SchemeAndStackFoundations:SF.2).

Construction and proof. (1) Universal coefficients: there is a short exact sequence 0 →
H^n_c(U, ℤ_ℓ) ⊗ ℤ/ℓ → H^n_c(U, ℤ/ℓ) → Tor₁^{ℤ_ℓ}(H^{n+1}_c(U, ℤ_ℓ), ℤ/ℓ) → 0. (2) H^n_c(U, ℤ/ℓ)
= 0 by EDC.4/compact-support-vanishing-smooth-affine (n < n + 1), so H^{n+1}_c(U, ℤ_ℓ)[ℓ] =
Tor₁(H^{n+1}_c(U, ℤ_ℓ), ℤ/ℓ) = 0; a finitely generated ℤ_ℓ-module without ℓ-torsion is
torsion-free. (3) The exact sequence H^n(X, ℤ_ℓ) → H^n(Y, ℤ_ℓ) → H^{n+1}_c(U, ℤ_ℓ) of
EDC.4/weak-lefschetz embeds H^n(Y)/i^*H^n(X) into the torsion-free H^{n+1}_c(U, ℤ_ℓ).

Acceptance. X = P^{n+1}: H^{n+1}_c(𝔸^{n+1}, ℤ_ℓ) = 0 (torsion-free) and the cokernel
H^n(P^n)/H^n(P^{n+1}) = 0. X a smooth projective surface (n = 1) with Y a smooth hyperplane
curve: H¹(Y, ℤ_ℓ)/i^*H¹(X, ℤ_ℓ) is a free ℤ_ℓ-module (the vanishing part of the curve's H¹ is
saturated). Non-example: for the non-affine complement of a non-ample divisor the statement
fails in general; the proof uses H^n_c(U, ℤ/ℓ) = 0, which needs U affine.

Depends on: `compact-support-vanishing-smooth-affine`, `weak-lefschetz`,
`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`,
`SchemeAndStackFoundations:SF.2`.

Source: Deligne-WeilII-1980, §4, (4.1.6), p. 219.

### `ample-divisor-weak-lefschetz` — Weak Lefschetz for ample divisors and hypersurface sections

Node `EtaleDualityAndPerverseSheaves:EDC.4/ample-divisor-weak-lefschetz` (theorem).

Let k be separably closed, ℓ invertible in k, X a smooth projective k-scheme of pure dimension
n + 1, ℒ an ample invertible O_X-module, r ≥ 1 and s ∈ Γ(X, ℒ^{⊗r}) with zero scheme Y = V(s) ≠
X. Then the conclusions of EDC.4/weak-lefschetz (restriction H^q(X, L) → H^q(Y, L) bijective
for q < n, injective for q = n) and, when Y is smooth, of EDC.4/weak-lefschetz-gysin hold, for
Λ = ℤ/ℓ^m, O_E/λ^m, O_E, E. In particular they hold for Y = X ∩ V(F) with F a homogeneous form
of degree r on P^N ⊃ X. By induction they hold along a chain X = X_0 ⊃ X_1 ⊃ … ⊃ X_c of smooth
successive ample divisors.

Hypotheses. X smooth projective of pure dimension n + 1 over k separably closed; ℒ ample; Y the
zero scheme of a section of a positive power of ℒ. Only the affineness of X − Y = X_s and its
smoothness are used, together with topological invariance of the étale site (Y and Y_red have
the same cohomology).

Construction and proof. (1) X is proper over k and ℒ^{⊗r} is ample, so X_s = X − Y is affine
(Stacks, Tag 0EKE: for f universally closed and ℒ f-ample, X_s → S is affine; requested from
SchemeAndStackFoundations:SF.0). Ampleness alone does not suffice without properness: on a
quasi-affine non-affine X with ℒ = O_X and s = 1, X_s = X. (2) With U = X_s affine and smooth
of pure dimension n + 1, the proofs of EDC.4/weak-lefschetz and EDC.4/weak-lefschetz-gysin
apply verbatim: they use only EDC.4/compact-support-vanishing-smooth-affine and
EDC.4/affine-vanishing-hypercohomology for U. (3) Alternatively, ℒ^{⊗rN} is very ample for N ≫
0 and s^N is a hyperplane section in the corresponding embedding; Y and V(s^N) have the same
reduced subscheme, and étale cohomology only depends on it (topological invariance, imported
through SchemeAndStackFoundations:SF.2). For F of degree r on P^N, V(F) is a hyperplane section
of the r-th Veronese re-embedding (Weil I, 5.7). (4) Chains: apply the statement to each
X_{j+1} ⊂ X_j (each smooth projective) and compose.

Acceptance. X = P^{n+1}, Y a smooth quadric hypersurface (r = 2): H^q(Y) ≅ H^q(P^{n+1}) for q <
n. n + 1 = 2, X = P², Y a smooth plane cubic curve: H⁰(P²) → H⁰(Y) is an isomorphism (q = 0 < n
= 1) and H¹(P²) = 0 → H¹(Y) = Λ² is injective. Non-example: ℒ = O(0, 1) on X = P¹ × P¹ is nef
but not ample; for Y a fibre P¹ × {pt}, X − Y = P¹ × 𝔸¹ is not affine and H²(X − Y, Λ) = Λ(−1)
≠ 0, so the affine-vanishing input fails; the theorem requires ample ℒ.

Depends on: `weak-lefschetz`, `weak-lefschetz-gysin`, `SchemeAndStackFoundations:SF.0`,
`SchemeAndStackFoundations:SF.2`.

Source: Deligne-WeilI-1974, §5, (5.7), p. 292; Stacks-Morphisms, Morphisms of Schemes, Lemma
44.18, Tag 0EKE.

### `complete-intersection-cohomology` — Cohomology of smooth complete intersections

Node `EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology` (theorem).

Let k be separably closed, ℓ invertible in k, and X ⊂ P^N_k a smooth complete intersection of
dimension m ≥ 1 (there is a chain P^N = X_N ⊃ X_{N−1} ⊃ … ⊃ X_m = X with each X_r = X_{r+1} ∩
H_r for a hypersurface H_r, all X_r smooth). Let Λ = ℤ/ℓ^a, ℤ_ℓ or ℚ_ℓ and h = c₁(O(1))|_X ∈
H²(X, Λ(1)). Then: (a) for q ≠ m, 0 ≤ q ≤ 2m, H^q(X, Λ) = 0 for q odd and H^q(X, Λ(q/2)) =
Λ·h^{q/2} for q even; the restriction H^q(P^N, Λ) → H^q(X, Λ) is an isomorphism for q < m. (b)
H^m(X, Λ) = Λ(−m/2)·h^{m/2} ⊕ H^m(X, Λ)_0 when m is even (for Λ = ℚ_ℓ, and for ℤ/ℓ^a when deg X
is prime to ℓ), with H^m(X)_0 := ker(∪h : H^m(X) → H^{m+2}(X)(1)); H^m(X) = H^m(X)_0 when m is
odd. (c) With ℤ_ℓ coefficients all H^q(X, ℤ_ℓ) are torsion-free. (d) If X is defined over 𝔽_q,
the geometric Frobenius acts on H^{2j}(X, ℚ_ℓ), 2j ≠ m, by multiplication by q^j. The primitive
rank b_m^0 = dim H^m(X, ℚ_ℓ)_0 is the same for all smooth complete intersections of the same
multidegree over all separably closed fields of characteristic ≠ ℓ
(EDC.6/complete-intersection-betti-comparison).

Hypotheses. X a smooth complete intersection in P^N over a separably closed field; ℓ
invertible. The splitting in (b) uses that h^m has degree deg X on X (Tr(h^m) = deg X): it is a
direct sum over ℚ_ℓ, and over ℤ/ℓ^a or ℤ_ℓ only when deg X is a unit.

Construction and proof. (1) Induction along the chain X_N = P^N ⊃ … ⊃ X_m = X, each X_r an
ample divisor in the smooth projective X_{r+1} (EDC.4/ample-divisor-weak-lefschetz):
H^q(X_{r+1}) → H^q(X_r) is bijective for q < r and injective for q = r; the Gysin map
H^q(X_r)(−1) → H^{q+2}(X_{r+1}) is bijective for q > r and surjective for q = r
(EDC.4/weak-lefschetz-gysin). (2) Hence H^q(X) ≅ H^q(P^N) for q < m
(EDC.3/projective-space-cohomology), and by Poincaré duality on X
(EDC.2:pairings/poincare-duality-torsion, adic form
EDC.2:pairings/adic-and-rational-poincare-duality) H^q(X) for q > m is dual to H^{2m−q}(X),
which is Λ·h^{m−q/2} or 0. (3) Torsion-freeness (c): by EDC.4/weak-lefschetz-integral at each
step the cokernels are torsion-free, and Poincaré duality transports torsion-freeness from
degrees < m to degrees > m + 1; the middle degree is torsion-free because H^{m+1}(X, ℤ_ℓ) is
(universal coefficients). (4) Splitting (b): Tr_X(h^m) = deg X
(EDC.3/projective-space-cohomology, degree formula), so h^{m/2} ∪ h^{m/2} ≠ 0 and Λh^{m/2} is a
direct summand complementary to the kernel of ∪h when deg X is invertible in Λ. (5) Frobenius
(d): h is the class of a hyperplane, F^*h = q·h in H²(X, ℚ_ℓ) untwisted (EDC.0/tate-twist), so
F acts on h^j by q^j.

Acceptance. X = P^m itself (N = m): H^m(X)_0 = 0 and every statement reduces to
EDC.3/projective-space-cohomology. X a smooth plane cubic (m = 1): H¹(X, ℚ_ℓ) = H¹(X)_0 has
dimension 2 = b_1^0 for degree 3. X a smooth quadric surface in P³ (m = 2, degree 2): H²(X,
ℚ_ℓ(1)) = ℚ_ℓh ⊕ H²_0 with dim H²_0 = 1; with ℤ/2 coefficients the splitting fails (deg X = 2
is not invertible), as the hypothesis requires.

Depends on: `ample-divisor-weak-lefschetz`, `weak-lefschetz`, `weak-lefschetz-gysin`,
`weak-lefschetz-integral`, `EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`,
`EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`,
`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`,
`EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`.

Source: Milne-LEC-v2.21, §16 (aside on complete intersections), p. 110.

### `projective-bundle-decomposition` — The projective-bundle decomposition with Tate twists and Frobenius ★

Node `EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition` (theorem); planet
“Projective bundle formula”.

Let X be a quasi-compact quasi-separated scheme with n invertible, Λ = ℤ/n, O/π^m, O_E or E, E
a locally free O_X-module of rank m + 1, π : P(E) → X the projective bundle and ξ = c₁(O(1)) ∈
H²(P(E), Λ(1)). (a) The map ⊕_{j=0}^{m} Λ_X(−j)[−2j] → Rπ_*Λ_{P(E)} given by ξ^j is an
isomorphism in D(X, Λ) (refining EDC.3/projective-bundle-freeness), hence H^q(P(E), π^*K) ≅ ⊕_j
H^{q−2j}(X, K(−j)) for every K ∈ D(X, Λ). (b) Ring structure: ⊕_q H^q(P(E), Λ(∗)) = H^∗(X,
Λ(∗))[ξ]/(Σ_{r=0}^{m+1} c_r(E) ξ^{m+1−r}). (c) For X smooth over k and π_* the Gysin
pushforward (relative dimension m), π_*(π^*a ∪ ξ^j) = 0 for j < m and π_*(π^*a ∪ ξ^m) = a. (d)
If X and E are defined over a field k₀ and k = k₀^sep, the decomposition H^q(P(E)_k, Λ) ≅ ⊕_j
H^{q−2j}(X_k, Λ)(−j) is Gal(k/k₀)-equivariant; over k₀ = 𝔽_q the geometric Frobenius acts on
the j-th summand as F_X ⊗ q^j (untwisted cohomology). (e) For X smooth proper of pure dimension
d over k separably closed, the Poincaré pairing on P(E) restricted to the summands j and j'
vanishes when j + j' < m and is ⟨π^*a ξ^j, π^*b ξ^{m−j}⟩ = ⟨a, b⟩_X when j + j' = m.

Hypotheses. X qcqs with n invertible (for (c) and (e): X smooth, respectively smooth proper,
over a field); E locally free of rank m + 1 (Zariski-locally free). Twists and Frobenius
conventions are those of EDC.0/tate-twist (geometric Frobenius acts on Λ(−1) by q).

Construction and proof. (1) (a) is EDC.3/projective-bundle-freeness for Λ = ℤ/n and O/π^m; for
O_E pass to the limit over m (the maps are compatible with reduction), and for E tensor with E.
(2) (b) is the definition of Chern classes (EDC.3/chern-classes) together with the freeness in
(a). (3) (c) Projection formula for the Gysin map (EDC.3/gysin-map): π_*(π^*a ∪ ξ^j) = a ∪
π_*(ξ^j); π_*(ξ^j) ∈ H^{2j−2m}(X) vanishes for j < m by degree and π_*(ξ^m) = 1 because on a
fibre P^m, Tr(ξ^m) = 1 (EDC.3/projective-space-cohomology). (4) (d) ξ is the Chern class of a
line bundle defined over k₀, so it is Galois-invariant in H²(P(E)_k, Λ(1)); in untwisted
cohomology F^*ξ = q·ξ (EDC.0/tate-twist), which gives the stated action. (5) (e) Tr_{P(E)} =
Tr_X ∘ π_* (EDC.3/gysin-map, compatibility of traces), and (c).

Acceptance. X = Spec k, E = k^{m+1}: P(E) = P^m and (a) is H^∗(P^m) = Λ[ξ]/(ξ^{m+1})
(EDC.3/projective-space-cohomology). P¹-bundle over a curve C over 𝔽_q: the geometric Frobenius
has eigenvalues those of H^q(C) and q times those of H^{q−2}(C) on H^q(P(E)); e.g. dim H²(P(E))
= 2 with eigenvalues q, q. The Frobenius twist on the summand j is q^j, not 1: 'equal Betti
numbers' is not enough (the stage forbids merely equating Betti numbers).

Depends on: `EtaleDualityAndPerverseSheaves:EDC.3/projective-bundle-freeness`,
`EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`,
`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`,
`EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`,
`EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`,
`EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`,
`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`.

Source: Milne-LEC-v2.21, §23, Theorem 23.2, p. 139.

### `blowup-direct-images` — Direct images along the blow-up of a smooth centre

Node `EtaleDualityAndPerverseSheaves:EDC.4/blowup-direct-images` (theorem).

Let k be a field, ℓ invertible in k, X a smooth k-scheme, i : Z → X a smooth closed subscheme
of pure codimension c ≥ 2, π : X̃ = Bl_Z X → X the blow-up, E = π^{−1}(Z) the exceptional
divisor with j : E → X̃ and p = π|_E : E → Z, and ζ := c₁(O_E(1)) = −j^*c₁(O_X̃(E)) ∈ H²(E,
Λ(1)). Then X̃ is smooth, E is a smooth divisor with E ≅ P(N_{Z/X}) over Z (imported), Λ_X →
Rπ_*Λ_X̃ is split injective, and Rπ_*Λ_X̃ ≅ Λ_X ⊕ ⊕_{a=1}^{c−1} i_*Λ_Z(−a)[−2a]; equivalently
π_*Λ = Λ, R^{2a}π_*Λ ≅ i_*Λ_Z(−a) for 1 ≤ a ≤ c − 1 (generated by the image of ζ^a under j^*),
and R^qπ_*Λ = 0 for all other q > 0. Λ = ℤ/ℓ^m, O_E/λ^m, O_E or E.

Hypotheses. X smooth over a field k, Z ⊂ X smooth of pure codimension c ≥ 2; ℓ invertible in k.
The geometry of the blow-up (X̃ smooth, E = P(N_{Z/X}), O_X̃(−E)|_E = O_E(1), π an isomorphism
over X − Z, π proper) is requested from SchemeAndStackFoundations:SF.0.

Construction and proof. (1) Over X − Z, π is an isomorphism, so Rπ_*Λ|_{X−Z} = Λ. (2) π is
proper, so proper base change (requested from SchemeAndStackFoundations:SF.2) gives
(R^qπ_*Λ)_z̄ = H^q(P^{c−1}_{z̄}, Λ) at geometric points z̄ of Z: Λ(−a) for q = 2a ≤ 2(c − 1), 0
otherwise (EDC.3/projective-space-cohomology). (3) The classes ζ^a ∈ H^{2a}(E, Λ(a)) restrict
to generators on every fibre; via the base change map i^*R^{2a}π_*Λ → R^{2a}p_*Λ = Λ_Z(−a)
(EDC.4/projective-bundle-decomposition for p) they give the isomorphisms R^{2a}π_*Λ ≅
i_*Λ_Z(−a), and the decomposition of Rp_*Λ_E gives the splitting of Rπ_*Λ after restriction to
Z. (4) The adjunction Λ → Rπ_*Λ is split by the trace π_* (π proper birational between smooth
schemes of the same dimension, EDC.3/gysin-map: π_*π^* = id because π_*1 = 1 for a birational
proper map), so Rπ_*Λ = Λ ⊕ C with C supported on Z; C ≅ ⊕_a i_*Λ_Z(−a)[−2a] because a complex
supported on Z with locally constant cohomology sheaves Λ_Z(−a) in degrees 2a, split by the
ζ^a, is the direct sum of its shifted cohomology sheaves.

Acceptance. Blow-up of a point in a surface (c = 2): R²π_*Λ = Λ_x(−1) at the point x, generated
by the class of the exceptional curve. c = 3, Z a point in a threefold: R²π_*Λ = Λ_x(−1),
R⁴π_*Λ = Λ_x(−2), R¹ = R³ = 0. Non-example: for c = 1 the blow-up is an isomorphism and Rπ_*Λ =
Λ; the formula's sum over 1 ≤ a ≤ c − 1 is then empty, so no correction term appears.

Depends on: `projective-bundle-decomposition`,
`EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`,
`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`, `SchemeAndStackFoundations:SF.0`,
`SchemeAndStackFoundations:SF.2`.

Source: Milne-LEC-v2.21, §33, proof of Lemma 33.2, p. 194.

### `blowup-formula` — The blow-up formula along a smooth centre ★

Node `EtaleDualityAndPerverseSheaves:EDC.4/blowup-formula` (theorem); planet “Blow-up formula”.

In the situation of EDC.4/blowup-direct-images, for every q the map Φ : H^q(X, Λ) ⊕
⊕_{a=1}^{c−1} H^{q−2a}(Z, Λ(−a)) → H^q(X̃, Λ), (x, (z_a)) ↦ π^*x + Σ_a j_*(ζ^{a−1} ∪ p^*z_a),
is an isomorphism, where j_* : H^{r}(E, Λ(s)) → H^{r+2}(X̃, Λ(s+1)) is the Gysin map of the
divisor E. Its inverse has first component π_* (the Gysin pushforward, with π_*π^* = id).
Compatibilities: j^*π^*x = p^*i^*x; π_*j_*(ζ^{a−1} ∪ p^*z) = 0 for 1 ≤ a ≤ c − 1 (degree
reasons along the fibres P^{c−1}); for X proper over k separably closed, Tr_X̃(π^*x) = Tr_X(x)
on top-degree classes; if X, Z are defined over k₀ (k = k₀^sep) Φ is Gal(k/k₀)-equivariant and
over 𝔽_q the geometric Frobenius acts on the summand H^{q−2a}(Z)(−a) as F_Z ⊗ q^a (untwisted).
Λ = ℤ/ℓ^m, O_E/λ^m, O_E or E.

Hypotheses. As in EDC.4/blowup-direct-images; for Galois and Frobenius statements X and Z are
defined over k₀ and the cohomology is that of X_k, Z_k. For cohomology over a
non-separably-closed k₀ the decomposition is of Galois modules after base change to k.

Construction and proof. (1) Apply RΓ(X, −) to Rπ_*Λ_X̃ ≅ Λ_X ⊕ ⊕_a i_*Λ_Z(−a)[−2a]
(EDC.4/blowup-direct-images): H^q(X̃) ≅ H^q(X) ⊕ ⊕_a H^{q−2a}(Z)(−a). (2) Identify the summands
with Φ: the first is π^* (adjunction unit). For the others, j_*(ζ^{a−1} ∪ p^*z) restricted to E
is −ζ^a ∪ p^*z + (terms with smaller power), because j^*j_*y = y ∪ c₁(O(E))|_E = −y ∪ ζ
(self-intersection formula, EDC.3/self-intersection-formula); triangularity in a gives that Φ
realises the decomposition. (3) π_*π^* = id: π is proper birational between smooth schemes of
the same dimension (EDC.3/gysin-map, projection formula with π_*1 = 1). (4) Traces: Tr_X̃ =
Tr_X ∘ π_* (EDC.3/gysin-map) and π_*π^* = id. Equivariance and Frobenius as in
EDC.4/projective-bundle-decomposition (d): ζ and the Gysin map of E are defined over k₀ and j_*
raises the twist by one.

Acceptance. Blowing up a point x on a smooth projective surface S (c = 2): H²(S̃) = H²(S) ⊕
Λ(−1)·[E] with [E]² = −1, H¹, H³ unchanged; over 𝔽_q the new eigenvalue is q. Checked
independently of any Weil bound (the stage's acceptance test). Blowing up a point in P³ (c =
3): b₂ and b₄ both increase by one, b_odd unchanged. Euler characteristic: χ(X̃) = χ(X) + (c −
1)χ(Z); for c = 1 nothing changes.

Depends on: `blowup-direct-images`, `EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`,
`EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`,
`projective-bundle-decomposition`.

Source: Deligne-WeilI-1974, §7, p. 299; Milne-LEC-v2.21, §33, proof of Lemma 33.2, p. 194.

### `pencil-axis-blowup` — Cohomology of the blow-up along the axis of a pencil

Node `EtaleDualityAndPerverseSheaves:EDC.4/pencil-axis-blowup` (application).

Let X ⊂ P^N be a smooth projective k-scheme of pure dimension n + 1 over a separably closed
field k (ℓ invertible), and A ⊂ P^N a linear subspace of codimension 2 meeting X transversally,
so that A ∩ X is smooth of pure codimension 2 in X (possibly empty). Let π : X̃ = Bl_{A∩X}X →
X. Then for Λ = ℤ/ℓ^m, ℤ_ℓ, ℚ_ℓ: H^q(X̃, Λ) ≅ H^q(X, Λ) ⊕ H^{q−2}(A ∩ X, Λ)(−1), via π^* and
j_*p^*, with π^* split injective; if X and A are defined over 𝔽_q the decomposition commutes
with the geometric Frobenius, which acts on the second summand as q·F_{A∩X}. In particular
b_q(X̃) = b_q(X) + b_{q−2}(A ∩ X) and χ(X̃) = χ(X) + χ(A ∩ X). The identification of X̃ with
the incidence variety of the pencil and the map X̃ → P¹ belong to
LefschetzPencilsAndVanishingCycles:LPV.3 and are not used here.

Hypotheses. X smooth projective of pure dimension n + 1; A a codimension-2 linear subspace
transverse to X (so A ∩ X is smooth of codimension 2).

Construction and proof. (1) This is EDC.4/blowup-formula with c = 2, Z = A ∩ X, E = P(N_{Z/X})
a P¹-bundle over Z, ζ⁰ = 1. (2) Frobenius on the summand: EDC.4/blowup-formula (twist (−1)
contributes the factor q).

Acceptance. X = P² ⊂ P³ a plane (n + 1 = 2) and A a line meeting it transversally in one point
x: X̃ = Bl_x P², b₂(X̃) = 1 + 1 = 2. A ∩ X = ∅: X̃ = X and the second summand vanishes. X a
smooth surface in P³ and A a line meeting X transversally in d = deg X points: b₂(X̃) = b₂(X) +
d.

Depends on: `blowup-formula`.

Source: Deligne-WeilI-1974, §7, proof of Lemme (7.1), p. 299; Milne-LEC-v2.21, §33, Lemma 33.2
and proof, p. 193–194.

### `pullback-injective-blowup-bundle` — Pullback along blow-ups and projective bundles is split injective

Node `EtaleDualityAndPerverseSheaves:EDC.4/pullback-injective-blowup-bundle` (theorem).

Let σ : X' → X be either (i) the blow-up of a smooth k-scheme X along a smooth closed subscheme
Z of pure codimension c ≥ 2, or (ii) a projective bundle P(E) → X of relative dimension r ≥ 1
over a qcqs X, with ℓ invertible. For Λ = ℤ/ℓ^m, O_E/λ^m, O_E or E, σ^* : H^q(X, Λ) → H^q(X',
Λ) is split injective, with retraction π_* in case (i) and a ↦ σ_*(ξ^r ∪ −) in case (ii); the
same holds for cohomology with compact supports and for cohomology with supports in a closed
subset T ⊂ X and its preimage. In case (ii) with r = 1 the cokernel is H^{q−2}(X, Λ)(−1), and
in case (i) the cokernel is ⊕_{a=1}^{c−1} H^{q−2a}(Z, Λ)(−a), so σ^* is bijective in degrees q
< 2 (and an isomorphism in all degrees when Z = ∅).

Hypotheses. As in EDC.4/blowup-formula (case (i)) or EDC.4/projective-bundle-decomposition
(case (ii)); integral coefficients O_E allowed.

Construction and proof. (1) (i) EDC.4/blowup-formula: H^q(X') = σ^*H^q(X) ⊕ (exceptional
summands), with π_*σ^* = id. (2) (ii) EDC.4/projective-bundle-decomposition (a) and (c). (3)
Compact supports and supports in T: apply the same decompositions of Rσ_*Λ
(EDC.4/blowup-direct-images, EDC.4/projective-bundle-decomposition (a)), which are isomorphisms
in D(X, Λ), to RΓ_c(X, −) and RΓ_T(X, −) (proper base change for σ proper, imported through
SchemeAndStackFoundations:SF.2).

Acceptance. P¹-bundle over a point: H⁰(pt) → H⁰(P¹) bijective, H²(P¹) = Λ(−1) is the cokernel.
Blow-up of a point on a surface: σ^* bijective on H⁰, H¹, H³, H⁴ and injective with cokernel
Λ(−1) on H². Integral coefficients: σ^* is split injective on H^q(X, ℤ_ℓ), so torsion in H^q(X,
ℤ_ℓ) injects into H^q(X', ℤ_ℓ).

Depends on: `blowup-formula`, `projective-bundle-decomposition`, `blowup-direct-images`,
`SchemeAndStackFoundations:SF.2`.

Source: Liu-Tian-Xiao-Zhang-Zhu-2022, §5.11, Lemma 5.11.3(3), p. 98 (arXiv v3).

### `vanishing-and-restriction-subspaces` — Vanishing and restricted subspaces of a hyperplane section, and primitive subspaces

Node `EtaleDualityAndPerverseSheaves:EDC.4/vanishing-and-restriction-subspaces` (construction);
module `TauCeti/AlgebraicGeometry/Etale/Lefschetz/VanishingSubspace`.

Let k be separably closed, ℓ invertible, E a field of coefficients (finite of characteristic ℓ,
or finite over ℚ_ℓ), X a smooth projective k-scheme of pure dimension n + 1 and i : Y → X a
smooth hyperplane section (pure dimension n), with Lefschetz class L = c₁(O_X(1)) ∈ H²(X,
E(1)). Define the vanishing subspace Van(Y) := ker(i_* : H^n(Y, E) → H^{n+2}(X, E(1))) and the
restricted subspace Res(Y) := im(i^* : H^n(X, E) → H^n(Y, E)), both E-subspaces of H^n(Y, E).
Then, with respect to the Poincaré pairing ⟨y, y'⟩ = Tr_Y(y ∪ y') on H^n(Y, E) (perfect and
(−1)^n-symmetric after the identification E(n) ≅ E over k), Res(Y) = Van(Y)^⊥ and Van(Y) =
Res(Y)^⊥; dim Res(Y) + dim Van(Y) = dim H^n(Y). Moreover i_*i^* = L ∪ − on H^∗(X). For 0 ≤ q ≤
n + 1 the primitive subspace is P^q(X) := ker(L^{n+2−q} : H^q(X, E) → H^{2n+4−q}(X, E(n+2−q))).
No decomposition H^n(Y) = Res(Y) ⊕ Van(Y) and no Lefschetz decomposition into primitive parts
is asserted: both require hard Lefschetz (DeligneWeightsAndPurity:DWP.9).

Hypotheses. X smooth projective of pure dimension n + 1 over k separably closed; Y a smooth
hyperplane section; field coefficients E (so that orthogonal complements have complementary
dimensions).

Construction and proof. (1) Van(Y) and Res(Y) are kernels and images of E-linear maps between
finite-dimensional spaces (finiteness imported through SchemeAndStackFoundations:SF.2). (2) i_*
is the transpose of i^* for the Poincaré pairings of Y and X (EDC.3/gysin-map): ⟨i^*x, y⟩_Y =
⟨x, i_*y⟩_X. Hence y ⊥ Res(Y) ⟺ i_*y ⊥ H^n(X) ⟺ i_*y = 0 (perfectness on X,
EDC.2:pairings/poincare-duality-torsion), i.e. Res(Y)^⊥ = Van(Y); the pairing on Y is perfect,
so Van(Y)^⊥ = Res(Y) and the dimensions add up. (3) i_*i^*x = cl(Y) ∪ x = L ∪ x
(EDC.3/projective-space-cohomology, the hyperplane-section formula). (4) P^q(X) is a kernel of
an E-linear map; nothing about its complement is claimed.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.vanishingSubspace` | constructor | Van(Y) := ker(i_* : H^n(Y, E) → H^{n+2}(X, E(1))) as an E-subspace of H^n(Y, E). |
| `TauCeti.EtaleDuality.restrictedSubspace` | constructor | Res(Y) := im(i^* : H^n(X, E) → H^n(Y, E)) as an E-subspace of H^n(Y, E). |
| `TauCeti.EtaleDuality.restrictedSubspace_eq_orthogonal` | characterisation | Res(Y) = Van(Y)^⊥ for the Poincaré pairing of Y. |
| `TauCeti.EtaleDuality.vanishingSubspace_eq_orthogonal` | characterisation | Van(Y) = Res(Y)^⊥ for the Poincaré pairing of Y. |
| `TauCeti.EtaleDuality.finrank_restricted_add_vanishing` | relation | dim Res(Y) + dim Van(Y) = dim H^n(Y, E). |
| `TauCeti.EtaleDuality.gysin_comp_restriction` | relation | i_* ∘ i^* = L ∪ − : H^q(X, E) → H^{q+2}(X, E(1)). |
| `TauCeti.EtaleDuality.primitiveSubspace` | constructor | P^q(X) := ker(L^{n+2−q} : H^q(X, E) → H^{2n+4−q}(X, E(n+2−q))) for q ≤ n + 1. |
| `TauCeti.EtaleDuality.vanishingSubspace_galois` | functoriality | If X, Y are defined over k₀, Van(Y) and Res(Y) are Gal(k/k₀)-stable subspaces. |

Used by. DeligneWeightsAndPurity:DWP.9 (orthogonal decomposition of a hyperplane section, Weil
II 4.3.9): hard Lefschetz upgrades Res(Y) = Van(Y)^⊥ to H^n(Y) = Res(Y) ⊕ Van(Y).
LefschetzPencilsAndVanishingCycles:LPV.4 (global vanishing cycles): the vanishing cycles of a
Lefschetz pencil span Van(Y) and Res(Y) is their orthogonal. Deligne, Weil II (4.3.1)–(4.3.2):
Ev(Y) and Ev(Y)^⊥ for the trace pairing on H^n(Y).

Unit tests:

- `TauCeti.EtaleDuality.vanishingSubspace_projectiveSpace` (computation): For X = P^{n+1} and Y
  = P^n a hyperplane, Van(Y) = 0 and Res(Y) = H^n(Y).
- `TauCeti.EtaleDuality.restrictedSubspace_planeCubic` (computation): For a smooth plane cubic
  Y ⊂ P², Res(Y) = 0 and Van(Y) = H¹(Y, E) has dimension 2.
- `TauCeti.EtaleDuality.vanishingSubspace_zero_of_curve_point` (degenerate): For n = 0 (X a
  curve, Y = a finite set of d points), Van(Y) is the kernel of the sum map E^d → E, of
  dimension d − 1.
- `TauCeti.EtaleDuality.not_vanishing_inf_restricted_eq_bot` (non-example): Res(Y) ⊓ Van(Y) = ⊥
  is not a consequence of the definitions: it is equivalent to the nondegeneracy of the pairing
  on Van(Y), which is DWP.9's hard-Lefschetz input.

Acceptance. X = P^{n+1}, Y = P^n: Van(Y) = 0 for n odd (H^n(Y) = 0) and for n even Van(Y) = 0
since i_* is an isomorphism H^n(P^n) → H^{n+2}(P^{n+1}); Res(Y) = H^n(Y). Y a smooth plane
cubic in X = P² (n = 1): Res(Y) = 0 (H¹(P²) = 0) and Van(Y) = H¹(Y), of dimension 2. The
intersection Res(Y) ∩ Van(Y) is not asserted to be 0: in characteristic ℓ coefficients E = 𝔽_2
and n even, the restricted class of a quadric hyperplane section can be isotropic; only
orthogonality is proved.

Depends on: `EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`,
`EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`,
`EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`, `weak-lefschetz`,
`weak-lefschetz-gysin`, `SchemeAndStackFoundations:SF.2`.

Source: Deligne-WeilII-1980, §4.3, before Lemme (4.3.2), p. 222.

## EDC.5 — The early perverse category and intermediate extension

BBD chapter 1 first: Mathlib has t-structures, their truncations and hearts, but not yet the
theorem that the heart is abelian, the cohomology functors, t-exactness or recollement; these
are planned here because no other layer of the atlas owns them. Then the middle perverse
t-structure on D^b_c(X, Λ) for X of finite type over a field, with coefficients a finite field
of characteristic ℓ, O/π^m or E/ℚ_ℓ, perverse sheaves, open–closed recollement, intermediate
extension and intersection complexes, simple objects, self-duality, perverse Artin vanishing
and amplitude estimates, and the consequences used by Caraiani–Scholze (generic concentration),
Mirković–Vilonen and Yun–Zhang (semismall and small maps). Integral O_E coefficients get the
separate p/p⁺ torsion-pair construction. No weight, purity or decomposition statement is made
in this stage.

### `t-structure-heart-abelian` — The heart of a t-structure is abelian

Node `EtaleDualityAndPerverseSheaves:EDC.5/t-structure-heart-abelian` (theorem).

Let C be a triangulated category and t = (C^{≤0}, C^{≥0}) a t-structure on C (Mathlib's
TStructure). The heart C^♥ = C^{≤0} ∩ C^{≥0} (Mathlib's TStructure.heart, as a full
subcategory) is an abelian category; a sequence 0 → A → B → C → 0 in C^♥ is short exact if and
only if it extends to a distinguished triangle A → B → C → A[1] of C, and this extension is
unique. Ext¹_{C^♥}(C, A) → Hom_C(C, A[1]) is an isomorphism and Hom_C(A, B[n]) = 0 for n < 0
and A, B ∈ C^♥.

Hypotheses. C triangulated (IsTriangulated, octahedral axiom); t a t-structure.

Construction and proof. (1) Hom_C(A, B[n]) = 0 for n < 0 and A, B in the heart: B[n] ∈ C^{≥1}
when n < 0 (Mathlib TStructure.zero'). (2) Every morphism f : A → B of the heart is admissible:
complete it to a triangle A → B → S → A[1]; S ∈ C^{[−1,0]}, and the truncation triangle
τ^{≤−1}S → S → τ^{≥0}S → gives K := (τ^{≤−1}S)[−1] and Q := τ^{≥0}S in the heart with the
triangle K[1] → S → Q → required by Mathlib's AbelianSubcategory criterion (BBD 1.2). (3) Apply
mathlib:CategoryTheory.Triangulated.AbelianSubcategory.abelian to the inclusion of the heart
(BBD 1.3.6). Short exact sequences ↔ triangles is BBD 1.3.6's proof (1.2.4).

Acceptance. The canonical t-structure on D(A) for A abelian
(mathlib:DerivedCategory.TStructure.t): the heart is equivalent to A. C = 0: the heart is the
zero category, abelian. Non-example: a triangle of heart objects A → B → C → A[1] with nonzero
A[1]-component gives a non-split extension; the heart is not semisimple in general (D^b(ℤ): 0 →
ℤ → ℤ → ℤ/2 → 0).

Depends on: `mathlib:CategoryTheory.Triangulated.TStructure`,
`mathlib:CategoryTheory.Triangulated.TStructure.heart`,
`mathlib:CategoryTheory.Triangulated.AbelianSubcategory.abelian`.

Source: BBD-1982, Théorème 1.3.6, p. 31.

### `t-cohomology-functor` — Cohomology functors of a t-structure

Node `EtaleDualityAndPerverseSheaves:EDC.5/t-cohomology-functor` (construction); module
`TauCeti/CategoryTheory/Triangulated/TStructure/Homology`.

For a t-structure t on a triangulated category C, the functor H⁰_t := τ^{≥0}τ^{≤0} : C → C^♥
(Mathlib's truncation functors, corestricted to the heart) is a homological functor: it sends
distinguished triangles to long exact sequences in the abelian category C^♥
(EDC.5/t-structure-heart-abelian). Set H^n_t(X) := H⁰_t(X[n]). For X ∈ C^♥, H⁰_t(X) ≅ X; for X
∈ C^{≤a} ∩ C^{≥b} (a bounded object), X = 0 if and only if H^n_t(X) = 0 for all n, and X ∈
C^{≤0} if and only if H^n_t(X) = 0 for n > 0.

Hypotheses. C triangulated, t a t-structure; conservativity statements are for bounded objects
(t-structures need not be nondegenerate).

Construction and proof. (1) Define H⁰_t from Mathlib's truncations τ^{≤0}, τ^{≥0}
(TStructure.truncLE, truncGE) — the composite lands in the heart. (2) Homological: BBD 1.3.6
(second assertion) — for a triangle X → Y → Z →, the long sequence of H^n_t is exact; proved by
reducing to triangles in C^{≤0} and C^{≥0} with the truncation triangles. (3) Conservativity on
bounded objects by induction on the length using the truncation triangles.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.TStructure.homologyZero` | constructor | H⁰_t : C ⥤ heart(t), the composite τ^{≥0}τ^{≤0} corestricted to the heart. |
| `TauCeti.EtaleDuality.TStructure.homology` | constructor | H^n_t := H⁰_t ∘ [n] : C ⥤ heart(t). |
| `TauCeti.EtaleDuality.TStructure.homologyZero_isHomological` | instance | H⁰_t is a homological functor (Mathlib Functor.IsHomological). |
| `TauCeti.EtaleDuality.TStructure.homologyZero_obj_heart` | simp | For X in the heart, H⁰_t(X) ≅ X. |
| `TauCeti.EtaleDuality.TStructure.isZero_of_homology_isZero` | characterisation | For X bounded for t, X ≅ 0 iff H^n_t(X) ≅ 0 for all n. |
| `TauCeti.EtaleDuality.TStructure.isLE_iff_homology` | characterisation | For X bounded below, X ∈ C^{≤0} iff H^n_t(X) ≅ 0 for every n > 0. |

Used by. BBD 1.3.6–1.3.7 and §2.1: perverse cohomology pH^n := H^n_t for the perverse
t-structure; the long exact sequences used throughout §§1.4–5.
EtaleDualityAndPerverseSheaves:EDC.7 (decomposition theorem): K ≅ ⊕ pH^i(K)[−i] is stated with
the perverse cohomology functors. LefschetzPencilsAndVanishingCycles:LPV.6: t-exactness of
nearby cycles is checked on perverse cohomology.

Unit tests:

- `TauCeti.EtaleDuality.homologyZero_canonical` (compatibility): For the canonical t-structure
  on D(A), H^n_t ≅ the homology functor DerivedCategory.homologyFunctor A n.
- `TauCeti.EtaleDuality.homologyZero_zero` (degenerate): H⁰_t(0) ≅ 0.
- `TauCeti.EtaleDuality.homologyZero_shift_ne` (non-example): H⁰_t does not commute with
  shifts: on D(A), H⁰_t(A[1]) = 0 while H⁰_t(A) = A for A ≠ 0 in A, so H⁰_t is not a
  triangulated functor.

Acceptance. For the canonical t-structure on D(A), H^n_t agrees with the usual homology functor
H^n : D(A) → A.

Depends on: `t-structure-heart-abelian`, `mathlib:CategoryTheory.Triangulated.TStructure`,
`mathlib:CategoryTheory.Functor.IsHomological`, `mathlib:DerivedCategory.TStructure.t`.

Source: BBD-1982, Théorème 1.3.6, p. 31.

### `t-exact-functor` — Left and right t-exact functors

Node `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functor` (definition); module
`TauCeti/CategoryTheory/Triangulated/TStructure/Exact`.

Let (C₁, t₁), (C₂, t₂) be triangulated categories with t-structures and T : C₁ → C₂ a
triangulated functor. T is right t-exact if T(C₁^{≤0}) ⊂ C₂^{≤0}, left t-exact if T(C₁^{≥0}) ⊂
C₂^{≥0}, and t-exact if both. If T is left (right) t-exact, the induced functor pT := H⁰_{t₂} ∘
T ∘ ι : C₁^♥ → C₂^♥ is left (right) exact. For an adjoint pair T* ⊣ T_* of triangulated
functors, T* is right t-exact if and only if T_* is left t-exact. Composites of right (left)
t-exact functors are right (left) t-exact.

Hypotheses. Triangulated functors between triangulated categories with t-structures.

Construction and proof. (1) Definition by the two inclusions; the adjoint criterion: Hom(T*X,
Y) = Hom(X, T_*Y) and the characterisation C^{≤0} = ⊥(C^{≥1}) (BBD 1.3.17 (iii)). (2) Exactness
of pT: from the long exact sequence of H⁰_t applied to T of a triangle
(EDC.5/t-cohomology-functor), BBD 1.3.17 (i).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.Functor.IsRightTExact` | constructor | T is right t-exact: T(C₁^{≤0}) ⊆ C₂^{≤0}. |
| `TauCeti.EtaleDuality.Functor.IsLeftTExact` | constructor | T is left t-exact: T(C₁^{≥0}) ⊆ C₂^{≥0}. |
| `TauCeti.EtaleDuality.Functor.IsTExact` | constructor | T is t-exact: both. |
| `TauCeti.EtaleDuality.Functor.IsRightTExact.comp` | functoriality | Composites of right t-exact functors are right t-exact. |
| `TauCeti.EtaleDuality.Functor.isRightTExact_iff_isLeftTExact_of_adjunction` | characterisation | For T* ⊣ T_*, T* is right t-exact iff T_* is left t-exact. |
| `TauCeti.EtaleDuality.Functor.heartFunctor` | data | pT := H⁰_{t₂} ∘ T ∘ ι : heart(t₁) ⥤ heart(t₂). |
| `TauCeti.EtaleDuality.Functor.heartFunctor_preservesFiniteColimits` | other | If T is right t-exact, pT is right exact (preserves finite colimits). |

Used by. BBD 1.4.16 and 4.1.1–4.2.4: exactness properties of j_!, j_*, i^*, i^!, affine and
smooth morphisms are stated as t-exactness. LefschetzPencilsAndVanishingCycles:LPV.6: nearby
cycles RΨ[−1] is t-exact for the perverse t-structure.
IgusaVarietiesAndTorsionConcentration:IG.4: semiperversity bounds are one-sided t-exactness
statements.

Unit tests:

- `TauCeti.EtaleDuality.isTExact_id` (degenerate): The identity functor of C is t-exact for
  every t.
- `TauCeti.EtaleDuality.isRightTExact_shift_one` (computation): The shift functor [1] is right
  t-exact for every t.
- `TauCeti.EtaleDuality.not_isLeftTExact_shift_one` (non-example): For the canonical
  t-structure on D(A) with A ≠ 0, the shift [1] is not left t-exact.
- `TauCeti.EtaleDuality.isTExact_canonical_exactFunctor` (compatibility): An exact functor F :
  A → B of abelian categories induces a t-exact functor D(A) → D(B) for the canonical
  t-structures.

Acceptance. The identity is t-exact; the shift [1] is right t-exact and not left t-exact for a
nondegenerate t.

Depends on: `t-cohomology-functor`, `mathlib:CategoryTheory.Triangulated.TStructure`.

Source: BBD-1982, 1.3.16, p. 36.

### `recollement-data` — Recollement of triangulated categories

Node `EtaleDualityAndPerverseSheaves:EDC.5/recollement-data` (definition); module
`TauCeti/CategoryTheory/Triangulated/TStructure/Recollement`.

A recollement of triangulated categories D_F ⟶ D ⟶ D_U consists of triangulated functors i_* :
D_F → D and j^* : D → D_U with left and right adjoints i^* ⊣ i_* ⊣ i^! and j_! ⊣ j^* ⊣ j_*,
such that i_*, j_! and j_* are fully faithful, j^*i_* = 0, and for every K ∈ D the adjunction
maps extend to distinguished triangles j_!j^*K → K → i_*i^*K → and i_*i^!K → K → j_*j^*K →.
Equivalently: i_* identifies D_F with the kernel of j^* and the two triangles exist (BBD
1.4.3). Consequences: i^*j_! = 0, i^!j_* = 0, the triangles are functorial and unique. The main
instance is constructible étale sheaves on X with a closed subscheme Z = F and open complement
U (EDC.1:biduality/recollement-adjunctions).

Hypotheses. D, D_F, D_U triangulated; the six functors triangulated.

Construction and proof. (1) Record the six functors and adjunctions as data, and full
faithfulness, vanishing and the existence of triangles as properties (BBD 1.4.3). (2) Derived
identities: i^*j_! = 0 from Hom(i^*j_!A, B) = Hom(A, j^*i_*B) = 0; uniqueness of the connecting
maps from Hom(j_!j^*K, i_*i^*K[−1]) = 0 (BBD 1.1.10).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.Recollement` | constructor | The structure of a recollement: i_*, j^*, their adjoints i^*, i^!, j_!, j_* with the adjunctions, full faithfulness, j^*i_* ≅ 0 and the two triangles. |
| `TauCeti.EtaleDuality.Recollement.triangleLowerShriek` | data | The functorial distinguished triangle j_!j^*K → K → i_*i^*K → K[1]... completed by the connecting map. |
| `TauCeti.EtaleDuality.Recollement.triangleUpperShriek` | data | The functorial distinguished triangle i_*i^!K → K → j_*j^*K → (i_*i^!K)[1]. |
| `TauCeti.EtaleDuality.Recollement.upperStar_lowerShriek_eq_zero` | relation | i^* ∘ j_! ≅ 0 and i^! ∘ j_* ≅ 0. |
| `TauCeti.EtaleDuality.Recollement.ofClosedOpen` | constructor | The constructible étale recollement for Z ⊂ X closed with open complement U. |
| `TauCeti.EtaleDuality.Recollement.op` | other | The opposite recollement on the opposite categories exchanges j_! with j_* and i^* with i^!. |

Used by. BBD 1.4.10: a t-structure on D is glued from t-structures on D_U and D_F.
EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure: induction over a stratification
glues the perverse t-structure. GeometricSatakeAndFusion:GS1: the relative perverse t-structure
is glued along Schubert strata.

Unit tests:

- `TauCeti.EtaleDuality.recollement_ofClosedOpen_empty` (degenerate): For Z = ∅, i_* = 0 and
  j^* is an equivalence D(X) ≌ D(U).
- `TauCeti.EtaleDuality.recollement_ofClosedOpen_upperStar` (compatibility): In
  Recollement.ofClosedOpen, j^* is the restriction functor pullback j of the imported étale
  operations.
- `TauCeti.EtaleDuality.recollement_triangle_point` (computation): For X = 𝔸¹, Z = {0}, K =
  Λ_X: the triangle j_!Λ_U → Λ_X → i_*Λ_Z → is the localization triangle.
- `TauCeti.EtaleDuality.not_recollement_without_adjoints` (non-example): A semiorthogonal
  decomposition D = ⟨D_F, D_U⟩ with only a left adjoint to i_* is not a recollement: both
  adjoints of i_* and j^* are required for gluing t-structures.

Acceptance. The étale recollement for Z ⊂ X closed with open complement U satisfies the axioms
(EDC.1:biduality/recollement-adjunctions).

Depends on: `EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`,
`mathlib:CategoryTheory.Functor.IsTriangulated`.

Source: BBD-1982, 1.4.3 (1.4.3.1)–(1.4.3.2), p. 44.

### `glued-t-structure` — Gluing t-structures along a recollement

Node `EtaleDualityAndPerverseSheaves:EDC.5/glued-t-structure` (theorem).

Given a recollement D_F ⟶ D ⟶ D_U (EDC.5/recollement-data) and t-structures t_F on D_F and t_U
on D_U, D^{≤0} := {K : j^*K ∈ D_U^{≤0}, i^*K ∈ D_F^{≤0}} and D^{≥0} := {K : j^*K ∈ D_U^{≥0},
i^!K ∈ D_F^{≥0}} form a t-structure on D (BBD 1.4.10). For it: j_! and i^* are right t-exact,
j_* and i^! are left t-exact, i_* and j^* are t-exact (BBD 1.4.16); the induced functors on
hearts satisfy pj^* ∘ pi_* = 0 and p(i_*) identifies D_F^♥ with the objects A of D^♥ with j^*A
= 0. Boundedness of t_F and t_U implies boundedness of the glued t-structure.

Hypotheses. A recollement; t-structures on D_F and D_U.

Construction and proof. (1) Axiom (i) (Hom(D^{≤0}, D^{≥1}) = 0) from the first triangle of K
and the adjunctions; axiom (ii) by shift invariance; axiom (iii) (truncation triangles) by the
two-step construction of BBD 1.4.10 using τ_U and τ_F and the octahedral axiom. (2) Exactness
(1.4.16) from the definitions and EDC.5/t-exact-functor's adjoint criterion.

Acceptance. Z = ∅: the glued t-structure is t_U transported along j^*. The perverse t-structure
on a curve X with a closed point Z is glued from the shifted standard t-structure on U and the
standard one on Z (EDC.5/perverse-t-structure).

Depends on: `recollement-data`, `t-exact-functor`,
`mathlib:CategoryTheory.Triangulated.TStructure`.

Source: BBD-1982, Théorème 1.4.10, p. 48.

### `abstract-intermediate-extension` — Intermediate extension in a recollement

Node `EtaleDualityAndPerverseSheaves:EDC.5/abstract-intermediate-extension` (construction);
module `TauCeti/CategoryTheory/Triangulated/TStructure/IntermediateExtension`.

In a recollement with glued t-structure (EDC.5/glued-t-structure), write pj_! := H⁰ ∘ j_! and
pj_* := H⁰ ∘ j_* : D_U^♥ → D^♥. The intermediate extension j_!* : D_U^♥ → D^♥ sends B to the
image of the canonical map pj_!B → pj_*B (BBD 1.4.22). It satisfies j^*j_!*B ≅ B; j_!*B has no
nonzero subobject or quotient of the form i_*C with C ∈ D_F^♥, and it is the unique extension
of B with this property (BBD 1.4.23–1.4.25); j_!* is fully faithful; it sends simple objects to
simple objects, and every simple object of D^♥ is either j_!*S with S simple in D_U^♥ or i_*T
with T simple in D_F^♥ (BBD 1.4.26).

Hypotheses. A recollement with the glued t-structure.

Construction and proof. (1) Define j_!* as the image in the abelian heart
(EDC.5/t-structure-heart-abelian) of pj_!B → pj_*B, the map adjoint to B → j^*pj_*B. (2)
Characterisations: BBD 1.4.23 (truncation descriptions j_!*B = τ^F_{≤−1}j_*B and = τ^F_{≥1}j_!B
for the glued truncations) and 1.4.24–1.4.25 (no sub/quotient from D_F, uniqueness). (3) Simple
objects: BBD 1.4.26 via the exact sequences relating pj_!, j_!*, pj_* with i_*-terms.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.Recollement.intermediateExtension` | constructor | j_!* : heart(t_U) ⥤ heart(glued), B ↦ image(pj_!B → pj_*B). |
| `TauCeti.EtaleDuality.Recollement.upperStar_intermediateExtension` | simp | j^* ∘ j_!* ≅ 𝟭 on heart(t_U). |
| `TauCeti.EtaleDuality.Recollement.intermediateExtension_no_sub_quotient` | characterisation | j_!*B has no nonzero subobject or quotient in the essential image of i_* : heart(t_F) → heart. |
| `TauCeti.EtaleDuality.Recollement.intermediateExtension_unique` | characterisation | An object A of the heart with j^*A ≅ B and no sub/quotient from heart(t_F) is isomorphic to j_!*B. |
| `TauCeti.EtaleDuality.Recollement.intermediateExtension_fullyFaithful` | other | j_!* is fully faithful. |
| `TauCeti.EtaleDuality.Recollement.simple_classification` | characterisation | Every simple object of the heart is j_!*S with S simple or i_*T with T simple. |

Used by. BBD 2.1.7–2.1.11: the intersection complex is j_!* of a shifted local system.
EtaleDualityAndPerverseSheaves:EDC.5/intermediate-extension: the étale j_!* is this
construction for the perverse t-structures. GeometricSatakeAndFusion:GS1: simple equivariant
perverse sheaves on the affine Grassmannian are intermediate extensions from orbits.

Unit tests:

- `TauCeti.EtaleDuality.intermediateExtension_empty_closed` (degenerate): If D_F = 0 then j_!*
  ≅ the inverse of the equivalence j^* on hearts.
- `TauCeti.EtaleDuality.intermediateExtension_simple` (characterisation): j_!* sends simple
  objects to simple objects.
- `TauCeti.EtaleDuality.intermediateExtension_ne_lowerShriek` (non-example): For the étale
  recollement of 𝔾_m ⊂ 𝔸¹ and B = Λ_{𝔾_m}[1] (Λ a field), pj_!B ≇ j_!*B: pj_!B has the quotient
  i_*Λ_0, so j_!* differs from pj_!.

Acceptance. Z = ∅: j_!* = identity up to the equivalence j^*.

Depends on: `glued-t-structure`, `t-structure-heart-abelian`, `t-cohomology-functor`.

Source: BBD-1982, Définition 1.4.22, p. 54.

### `perverse-t-structure` — The middle perverse t-structure ★

Node `EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure` (construction); planet “Middle
perverse t-structure”; module `TauCeti/AlgebraicGeometry/Etale/Perverse/TStructure`.

Let k be a field, X a scheme of finite type over k, ℓ invertible in k, and Λ either a finite
field of characteristic ℓ or Λ = O/π^m (self-injective) or a finite extension E of ℚ_ℓ (with
D^b_c(X, E) imported, EDC.6/classical-and-proetale-adic-categories). For a point x of X let
dim(x) := dim of its closure. Define pD^{≤0}(X, Λ) := {K ∈ D^b_c(X, Λ) : ℋ^i(K)_x̄ = 0 for i >
−dim(x), for all points x} — equivalently dim Supp ℋ^{−i}(K) ≤ i for all i — and pD^{≥0}(X, Λ)
:= {K : ℋ^i(i_x^!K)_x̄ = 0 for i < −dim(x), for all x}, where i_x : x̄ → X; for Λ a field, K ∈
pD^{≥0} iff D_X K ∈ pD^{≤0}. Then (pD^{≤0}, pD^{≥0}) is a bounded t-structure on D^b_c(X, Λ),
the middle perverse t-structure. It is local for the étale topology, it is obtained by gluing
(EDC.5/glued-t-structure) the shifted standard t-structures on the strata of any stratification
adapted to K, and for X = Spec k with k separably closed it is the standard t-structure.

Hypotheses. X of finite type over a field k; ℓ invertible in k. Coefficients: finite fields of
characteristic ℓ, O/π^m, or E/ℚ_ℓ finite. Integral O_E coefficients need the separate
torsion-pair construction EDC.5/integral-perverse-torsion-pair; no statement about them is made
here. The costalk condition uses i_x^! for the inclusion of a (non-closed) point, computed as a
colimit over open neighbourhoods of strata; equivalently, for a stratification {S} adapted to
K, i_S^!K has cohomology sheaves in degrees ≥ −dim S.

Construction and proof. (1) Choose a stratification by smooth locally closed strata S such that
the ℋ^i(K|_S) and ℋ^i(i_S^!K) are locally constant (constructibility,
EDC.0/constructible-ctf-complexes, and stability of D^b_c under the six operations,
EDC.1:biduality/duality-exchange-isomorphisms). (2) On each stratum take the standard
t-structure shifted by −dim S; glue by induction on the number of strata with
EDC.5/glued-t-structure along the recollement of an open union of strata and its closed
complement (EDC.5/recollement-data, EDC.1:biduality/recollement-adjunctions); this is BBD 2.1.3
in the étale setting (BBD 2.2.10–2.2.19). (3) Independence of the stratification: refine (BBD
2.1.14); étale locality from the stalk description; the duality characterisation for field
coefficients from the exchange D i_S^* = i_S^! D
(EDC.1:biduality/duality-exchange-isomorphisms) and self-duality of the shifted standard
t-structure on lisse sheaves (EDC.1:biduality/dualizing-complex-of-smooth-scheme).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.perverseTStructure` | constructor | The middle perverse t-structure on D^b_c(X, Λ). |
| `TauCeti.EtaleDuality.perverseTStructure_le_iff` | characterisation | K ∈ pD^{≤0} iff for every geometric point x̄ over x and every j with j + dim(x) > 0, ℋ^j(K)_x̄ = 0. |
| `TauCeti.EtaleDuality.perverseTStructure_ge_iff_verdierDual` | characterisation | For Λ a field: K ∈ pD^{≥0} iff D_X K ∈ pD^{≤0}. |
| `TauCeti.EtaleDuality.perverseTStructure_bounded` | other | Every K ∈ D^b_c(X, Λ) lies in pD^{≥a} ∩ pD^{≤b} for some a ≤ b. |
| `TauCeti.EtaleDuality.perverseTStructure_restrict_etale` | functoriality | For u : V → X étale, u^* is t-exact for the perverse t-structures. |
| `TauCeti.EtaleDuality.perverseTStructure_glue` | compatibility | For Z ⊂ X closed with complement U, the perverse t-structure of X is the gluing of those of U and Z along Recollement.ofClosedOpen. |
| `TauCeti.EtaleDuality.perverseTStructure_point` | compatibility | For X = Spec k, k separably closed, the perverse t-structure is the canonical t-structure. |

Used by. BBD §4.0: pD^{≤0}, pD^{≥0} defined by dimension of supports and costalks. Yun–Zhang
II, §§3.5, 7.1 (PAPER-YUN-ZHANG-19/10): perverse sheaves and IC complexes on finite-type
schemes with characteristic-zero ℓ-adic coefficients. Caraiani–Scholze, §6.1
(PAPER-CARAIANI-SCHOLZE-17/164): perverse 𝔽_ℓ-sheaves on finite-type schemes over an
algebraically closed field. GeometricSatakeAndFusion:GS1: the scheme-side model for the
relative perverse t-structure of FS VI.7. LefschetzPencilsAndVanishingCycles:LPV.6 and LPV.7:
nearby cycles RΨ[d] are perverse.

Unit tests:

- `TauCeti.EtaleDuality.perverse_point_eq_canonical` (compatibility): For X = Spec Ω, Ω
  separably closed, pD^{≤0}(X, Λ) = D^{≤0} under D^b_c(Spec Ω, Λ) ≃ D^b_{fg}(Λ).
- `TauCeti.EtaleDuality.perverse_curve_constant_shift` (computation): For X a smooth curve over
  a separably closed field, Λ_X[1] lies in the heart.
- `TauCeti.EtaleDuality.perverse_empty` (degenerate): For X = ∅ the category is zero and both
  halves are everything.
- `TauCeti.EtaleDuality.not_perverse_curve_constant` (non-example): For X a smooth curve, Λ_X
  (degree 0) lies in pD^{≤−1}, not in pD^{≥0}: it is not perverse.

Acceptance. X = Spec k, k separably closed: pD^{≤0} = D^{≤0}. X a smooth curve: Λ_X[1] ∈
pD^{≤0} ∩ pD^{≥0}; Λ_X ∉ pD^{≥0}.

Depends on: `glued-t-structure`, `recollement-data`,
`EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme`,
`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`,
`mathlib:CategoryTheory.Triangulated.TStructure`.

Source: BBD-1982, 4.0, (4.0.1)–(4.0.2), p. 102; BBD-1982, Proposition 2.1.3, p. 57.

### `perverse-sheaves` — Perverse sheaves ★

Node `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaves` (definition); planet “Perverse
sheaves”; module `TauCeti/AlgebraicGeometry/Etale/Perverse/Basic`.

In the situation of EDC.5/perverse-t-structure, the category of perverse sheaves Perv(X, Λ) is
the heart pD^{≤0}(X, Λ) ∩ pD^{≥0}(X, Λ), an abelian category (EDC.5/t-structure-heart-abelian),
with perverse cohomology functors pH^n : D^b_c(X, Λ) → Perv(X, Λ) (EDC.5/t-cohomology-functor).
Perverse sheaves form a stack for the étale topology: morphisms glue (U ↦ Hom(K|_U, L|_U) is a
sheaf for K, L perverse) and objects glue (BBD 2.1.23, 2.2.19). For Λ a field (or O/π^m), every
perverse sheaf has finite length (EDC.5/simple-perverse-sheaves).

Hypotheses. As in EDC.5/perverse-t-structure.

Construction and proof. (1) Define Perv(X, Λ) as the heart; abelian by
EDC.5/t-structure-heart-abelian. (2) Stack property: for K ∈ pD^{≤0}, L ∈ pD^{≥0}, the complex
RHom(K, L) has no cohomology in negative degrees (BBD 2.1.21), so ℋ⁰RHom(K, L) is the sheaf of
morphisms (2.1.22); gluing of objects (2.1.23) follows by the standard descent argument for
objects of a heart with vanishing negative Exts.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.PerverseSheaf` | constructor | Perv(X, Λ) := the heart of perverseTStructure, as a full subcategory of D^b_c(X, Λ). |
| `TauCeti.EtaleDuality.PerverseSheaf.abelian` | instance | Perv(X, Λ) is abelian. |
| `TauCeti.EtaleDuality.perverseCohomology` | constructor | pH^n : D^b_c(X, Λ) ⥤ Perv(X, Λ), n ∈ ℤ. |
| `TauCeti.EtaleDuality.perverseCohomology_isHomological` | instance | pH⁰ is homological: distinguished triangles give long exact sequences of perverse sheaves. |
| `TauCeti.EtaleDuality.PerverseSheaf.restrictEtale` | functoriality | For u : V → X étale, u^* : Perv(X, Λ) ⥤ Perv(V, Λ) is exact. |
| `TauCeti.EtaleDuality.PerverseSheaf.hom_isSheaf` | other | For K, L perverse, U ↦ Hom(K∣_U, L∣_U) is a sheaf on X_ét; in particular, for u : V → X étale surjective, two morphisms K ⟶ L that agree after u^* are equal. |
| `TauCeti.EtaleDuality.PerverseSheaf.isIso_of_restrictEtale` | other | For u : V → X étale surjective, a morphism of perverse sheaves that becomes an isomorphism after u^* is an isomorphism (the conservativity used to glue objects along an étale cover, BBD 2.2.19). |

Used by. Caraiani–Scholze, Corollary 6.1.4: perverse 𝔽_ℓ-sheaves and their generic
concentration in one degree. EtaleDualityAndPerverseSheaves:EDC.7: pure perverse sheaves, their
weight filtration and semisimplicity. GlobalShtukasAndFunctionFieldLanglands:GS.1: every sheaf
in the Satake category is perverse (scheme models).
EndoscopicTransferAndUnitaryTraceComparison:ET.2b and ET.5: perverse sheaves on Hitchin bases
and Igusa varieties.

Unit tests:

- `TauCeti.EtaleDuality.perverseSheaf_point` (compatibility): Perv(Spec Ω, Λ) ≌ finitely
  generated Λ-modules, Ω separably closed.
- `TauCeti.EtaleDuality.perverseSheaf_skyscraper` (computation): For x a closed point of X,
  i_{x*}M (M a finitely generated Λ-module, degree 0) is perverse.
- `TauCeti.EtaleDuality.perverseSheaf_empty` (degenerate): Perv(∅, Λ) is the zero category.
- `TauCeti.EtaleDuality.not_perverse_constant_surface` (non-example): For X a smooth surface,
  Λ_X[1] is not perverse (it lies in pD^{≤−1}); Λ_X[2] is.

Acceptance. Perv(Spec Ω, Λ) ≃ finitely generated Λ-modules for Ω separably closed.

Depends on: `perverse-t-structure`, `t-structure-heart-abelian`, `t-cohomology-functor`.

Source: BBD-1982, Corollaire 2.1.23, p. 65.

### `lisse-shift-is-perverse` — Shifted local systems on smooth schemes are perverse

Node `EtaleDualityAndPerverseSheaves:EDC.5/lisse-shift-is-perverse` (theorem).

Let X be smooth over k of pure dimension d (ℓ invertible) and L a locally constant
constructible sheaf of Λ-modules (Λ a field of characteristic ℓ, O/π^m, or a lisse E-sheaf).
Then L[d] is perverse. More generally, for K ∈ D^b_c(X, Λ) with locally constant cohomology
sheaves, K ∈ pD^{≤0} iff ℋ^i(K) = 0 for i > −d, and for Λ a field K ∈ pD^{≥0} iff ℋ^i(K) = 0
for i < −d.

Hypotheses. X smooth of pure dimension d over a field; locally constant cohomology sheaves.

Construction and proof. (1) Support condition: Supp ℋ^{−d}(L[d]) ⊂ X has dimension d and ℋ^{−i}
= 0 otherwise. (2) Cosupport: D_X(L[d]) = L^∨(d)[d]
(EDC.1:biduality/dualizing-complex-of-smooth-scheme), again a shifted local system in degree
−d, so L[d] ∈ pD^{≥0} by the duality characterisation (EDC.5/perverse-t-structure); for O/π^m
use the costalk description i_x^!L = L_x̄(−c)[−2c] at points of codimension c (purity,
EDC.3/smooth-pair-purity, applied on a stratification by smooth strata).

Acceptance. X a smooth curve: L[1] is perverse for every local system L. X = 𝔸²: Λ[2] is
perverse while Λ[1] is not.

Depends on: `perverse-t-structure`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme`,
`EtaleDualityAndPerverseSheaves:EDC.3/smooth-pair-purity`.

Source: BBD-1982, 4.0 (Exemples), p. 102.

### `perverse-recollement` — Open–closed recollement of perverse sheaves

Node `EtaleDualityAndPerverseSheaves:EDC.5/perverse-recollement` (theorem).

Let X be of finite type over k, i : Z → X closed with open complement j : U → X, and Λ as in
EDC.5/perverse-t-structure. The perverse t-structure on D^b_c(X, Λ) is glued
(EDC.5/glued-t-structure) from those on U and Z. Hence j_! and i^* are right t-exact, Rj_* and
i^! are left t-exact, i_* and j^* are t-exact; i_* : Perv(Z, Λ) → Perv(X, Λ) is fully faithful
with essential image the perverse sheaves supported on Z; and for K perverse there are exact
sequences 0 → i_*pH^{−1}i^*K → pj_!j^*K → K → i_*pH⁰i^*K → 0 and 0 → i_*pH⁰i^!K → K → pj_*j^*K
→ i_*pH¹i^!K → 0 in Perv(X, Λ) (BBD 4.1.10).

Hypotheses. As in EDC.5/perverse-t-structure.

Construction and proof. (1) The étale recollement (EDC.5/recollement-data with
EDC.1:biduality/recollement-adjunctions) and the stalk/costalk definitions show that the
perverse t-structure of X is the glued one (BBD 2.1.3, 2.2). (2) Exactness:
EDC.5/glued-t-structure (BBD 1.4.16). (3) The exact sequences are the long exact perverse
cohomology sequences of the two recollement triangles (BBD 4.1.10, using that i^*K ∈
pD^{[−1,0]} and i^!K ∈ pD^{[0,1]} for K perverse).

Acceptance. X = 𝔸¹, Z = {0}, K = Λ_X[1]: i^*K = Λ[1] so pH^{−1}i^*K = Λ_0 and the first
sequence is 0 → i_*Λ_0 → j_!Λ_U[1] → Λ_X[1] → 0.

Depends on: `perverse-t-structure`, `glued-t-structure`, `recollement-data`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`.

Source: BBD-1982, Proposition 1.4.16, p. 51.

### `intermediate-extension` — Intermediate extension of perverse sheaves ★

Node `EtaleDualityAndPerverseSheaves:EDC.5/intermediate-extension` (construction); planet
“Intermediate extension”; module
`TauCeti/AlgebraicGeometry/Etale/Perverse/IntermediateExtension`.

Let j : U → X be a locally closed immersion of schemes of finite type over k (factor j = ī ∘ j'
with j' : U → Ū open dense and ī : Ū → X closed) and Λ as in EDC.5/perverse-t-structure. The
intermediate extension j_!* : Perv(U, Λ) → Perv(X, Λ) is j_!* := ī_* ∘ j'_!*, where j'_!*A is
the image of pH⁰(j'_!A) → pH⁰(Rj'_*A) (EDC.5/abstract-intermediate-extension for the
recollement of EDC.5/perverse-recollement). j_!*A is the unique perverse extension P of A to Ū
with i^*P ∈ pD^{≤−1}(Z) and i^!P ∈ pD^{≥1}(Z) for Z = Ū − U; in stalk terms, for any
stratification of Z, ℋ^i(P)_x̄ = 0 for i ≥ −dim(x) and the costalks vanish for i ≤ −dim(x) at
points x of Z (BBD 2.1.9). Iterating over a stratification U = U_0 ⊂ U_1 ⊂ … ⊂ U_n = Ū by
unions of strata gives j_!*A = τ_{≤−dim S_n−1}Rj_{n*} ∘ … ∘ τ_{≤−dim S_1−1}Rj_{1*}A (Deligne's
formula, BBD 2.1.11). j_!* is fully faithful, preserves simple objects, and is transitive:
(j₂j₁)_!* = j₂_!* ∘ j₁_!*.

Hypotheses. X of finite type over k; j a locally closed immersion; Λ as in
EDC.5/perverse-t-structure.

Construction and proof. (1) Open dense case: EDC.5/abstract-intermediate-extension for the
recollement of U ⊂ Ū (EDC.5/perverse-recollement). (2) Stalk/costalk characterisation: BBD
2.1.9 (uniqueness of the extension with the strict bounds on Z), using the truncation
description 1.4.23. (3) Deligne's formula: BBD 2.1.11, by induction on the strata with the
formula of 1.4.23 at each step. (4) Transitivity and independence of the factorisation from the
characterisation.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.intermediateExtension` | constructor | j_!* : Perv(U, Λ) ⥤ Perv(X, Λ) for j : U ⟶ X an open immersion (locally closed immersions by composing with the closed pushforward). |
| `TauCeti.EtaleDuality.intermediateExtension_eq_image` | characterisation | j_!*A ≅ image(pH⁰(j_!A) → pH⁰(Rj_*A)). |
| `TauCeti.EtaleDuality.restrict_intermediateExtension` | simp | j^*(j_!*A) ≅ A. |
| `TauCeti.EtaleDuality.intermediateExtension_stalk_bound` | characterisation | For a point x of Z = X − U and j' : U → X open dense, ℋ^i(j_!*A)_x̄ = 0 for i ≥ −dim(x). |
| `TauCeti.EtaleDuality.intermediateExtension_fullyFaithful` | other | j_!* is fully faithful. |
| `TauCeti.EtaleDuality.intermediateExtension_comp` | functoriality | (j₂ ∘ j₁)_!* ≅ j₂_!* ∘ j₁_!*. |
| `TauCeti.EtaleDuality.intermediateExtension_truncation_formula` | relation | For a single closed stratum Z of dimension e: j_!*A ≅ τ_{≤−e−1}Rj_*A (Deligne's formula, one step). |

Used by. BBD 4.3.1 and §5.3: simple perverse sheaves and pure IC complexes are intermediate
extensions. Zhu, Appendix A.3.1 (PAPER-ZHU-17/E05): IC_X = j_!*Q̄_ℓ[d] on finite-type models of
perfect spaces. EtaleDualityAndPerverseSheaves:EDC.7/ic-purity: j_!* preserves purity for
affine j. IgusaVarietiesAndTorsionConcentration:IG.4: intermediate extensions in the
nearby-cycle support bounds.

Unit tests:

- `TauCeti.EtaleDuality.intermediateExtension_iso` (degenerate): If j is an isomorphism, j_!* ≅
  𝟭.
- `TauCeti.EtaleDuality.intermediateExtension_curve_constant` (computation): For j : 𝔾_m → 𝔸¹
  over a separably closed field and Λ a field, j_!*(Λ[1]) ≅ Λ_{𝔸¹}[1].
- `TauCeti.EtaleDuality.intermediateExtension_kummer` (computation): For j : 𝔾_m → 𝔸¹ and L a
  nontrivial rank-one Kummer local system, j_!*(L[1]) ≅ j_!L[1] ≅ Rj_*L[1].
- `TauCeti.EtaleDuality.not_intermediateExtension_eq_lowerShriek` (non-example): For j : 𝔾_m →
  𝔸¹ and Λ a field, j_!(Λ[1]) is perverse but not isomorphic to j_!*(Λ[1]).

Acceptance. j an isomorphism: j_!* = id. j : 𝔾_m → 𝔸¹, A = L[1] for a nontrivial Kummer local
system L: j_!*A = j_!A = Rj_*A.

Depends on: `abstract-intermediate-extension`, `perverse-recollement`, `perverse-t-structure`,
`t-structure-heart-abelian`.

Source: BBD-1982, Proposition 2.1.9, p. 59.

### `intersection-complex` — The intersection complex IC_X(L) ★

Node `EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex` (definition); planet
“Intersection complex”; module `TauCeti/AlgebraicGeometry/Etale/Perverse/IntersectionComplex`.

Let X be an irreducible scheme of finite type over k of dimension d, U ⊂ X a dense open
subscheme that is smooth over k, and L a locally constant constructible sheaf of Λ-modules on U
(Λ a field of characteristic ℓ or E/ℚ_ℓ; lisse for E). The intersection complex is IC_X(L) :=
j_!*(L[d]) for j : U → X (EDC.5/intermediate-extension, EDC.5/lisse-shift-is-perverse). It is
independent of U: for U' ⊂ U dense open, IC_X(L) ≅ IC_X(L|_{U'}). IC_X := IC_X(Λ). For X
smooth, IC_X(L) = L[d]; for X a curve, IC_X(L) = (j_*L)[1] with j_* the underived direct image;
IC_X(L) is simple when L is irreducible; for a finite surjective birational ν : X' → X with X'
smooth, IC_X(L) ≅ ν_*IC_{X'}(L). No Tate half-twist normalization is built in: IC_X(L) is the
unnormalized j_!*(L[d]).

Hypotheses. X irreducible of finite type over k, of dimension d; U dense, open and smooth; Λ a
field (finite of characteristic ℓ) or E/ℚ_ℓ. A dense smooth open exists over a perfect field;
over an imperfect k, take U regular and smooth over k if it exists (the definition requires a
smooth dense open).

Construction and proof. (1) Definition through EDC.5/intermediate-extension. (2) Independence
of U: for U' ⊂ U, j_{U'!*} = j_{U!*} ∘ (U' ⊂ U)_!* by transitivity, and (U' ⊂ U)_!*(L|_{U'}[d])
= L[d] because L[d] on smooth U has no sub/quotient supported on U − U'
(EDC.5/lisse-shift-is-perverse and the characterisation of j_!*). (3) Curves: Deligne's formula
with one closed stratum of dimension 0: τ_{≤−1}(Rj_*L[1]) = j_*L[1]. (4) Finite birational ν:
ν_* is t-exact (EDC.5/perverse-amplitude-estimates) and ν_*IC_{X'} satisfies the strict
stalk/costalk bounds (BBD 2.1.9).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.intersectionComplex` | constructor | IC_X(L) := j_!*(L[d]) ∈ Perv(X, Λ) for j : U ⟶ X dense open smooth and L locally constant on U. |
| `TauCeti.EtaleDuality.intersectionComplex_restrict` | characterisation | IC_X(L) ≅ IC_X(L∣_{U'}) for U' ⊂ U dense open: independence of the chosen open. |
| `TauCeti.EtaleDuality.intersectionComplex_of_smooth` | simp | If X is smooth (U = X), IC_X(L) ≅ L[d]. |
| `TauCeti.EtaleDuality.intersectionComplex_curve` | simp | If dim X = 1, IC_X(L) ≅ (j_*L)[1] with j_* the underived direct image. |
| `TauCeti.EtaleDuality.intersectionComplex_simple` | other | If L is irreducible, IC_X(L) is a simple perverse sheaf. |
| `TauCeti.EtaleDuality.intersectionComplex_finite_birational` | compatibility | For ν : X' → X finite surjective birational with X' smooth, IC_X(L) ≅ ν_*(L'[d]) where L' extends L. |

Used by. Zhu, Appendix A.3.1 (PAPER-ZHU-17/E05): IC_X = j_!*Q̄_ℓ[d] for X geometrically
irreducible of dimension d. Yun–Zhang II, §3.5.3 (PAPER-YUN-ZHANG-19/11): small-map
pushforwards are identified with IC complexes. EtaleDualityAndPerverseSheaves:EDC.7/ic-purity:
IC_X(L) is pure of weight w + d for L pure of weight w. GeometricSatakeAndFusion:GS3 and GS4:
IC complexes of Schubert varieties of Witt Grassmannian models.
GlobalShtukasAndFunctionFieldLanglands:GS.1: IC complexes of global Hecke stacks (via their
scheme models).

Unit tests:

- `TauCeti.EtaleDuality.intersectionComplex_smoothCurve` (computation): For X a smooth curve
  over a separably closed field, IC_X ≅ Λ_X[1].
- `TauCeti.EtaleDuality.intersectionComplex_nodalCurve` (computation): For X a nodal cubic with
  normalization ν : P¹ → X, IC_X ≅ ν_*Λ_{P¹}[1], whose stalk at the node is Λ² in degree −1.
- `TauCeti.EtaleDuality.intersectionComplex_cuspidalCurve` (computation): For X a cuspidal
  cubic, ν is a universal homeomorphism and IC_X ≅ Λ_X[1].
- `TauCeti.EtaleDuality.not_intersectionComplex_nodal_constant` (non-example): For X nodal with
  node s, Λ_X[1] is perverse but not IC_X: the exact sequence 0 → i_{s*}Λ → Λ_X[1] →
  ν_*Λ_{P¹}[1] → 0 in Perv(X) exhibits a nonzero subobject supported at the node.

Acceptance. X a smooth curve: IC_X = Λ[1].

Depends on: `intermediate-extension`, `lisse-shift-is-perverse`.

Source: BBD-1982, Théorème 4.3.1 (ii), p. 112; Zhu-2017, Appendix A.3.1, p. 54 (arXiv v3).

### `simple-perverse-sheaves` — Perverse sheaves have finite length; classification of simple objects

Node `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves` (theorem).

Let X be of finite type over k and Λ a finite field of characteristic ℓ or E/ℚ_ℓ finite.
Perv(X, Λ) is artinian and noetherian: every perverse sheaf has a finite composition series.
The simple objects are exactly the i_{V*}j_!*(L[dim V]) where V ⊂ X is an irreducible locally
closed subscheme smooth over k, i_V the closure inclusion, and L an irreducible locally
constant sheaf on V (lisse for E); two such are isomorphic iff the closures of V agree and the
L agree on a common dense open.

Hypotheses. X of finite type over k (perfect, or so that the needed smooth dense opens exist);
Λ a field.

Construction and proof. (1) Noetherian induction on X with EDC.5/perverse-recollement: on a
dense smooth open U where K has lisse cohomology, the category of lisse sheaves (finite length
for field coefficients) controls K|_U; the exact sequences of BBD 4.1.10 reduce to
lower-dimensional supports (BBD 4.3.1). (2) Simple objects:
EDC.5/abstract-intermediate-extension (simple objects of a recollement heart) with
EDC.5/intersection-complex.

Acceptance. X = Spec Ω: simple perverse sheaves are Λ (one-dimensional) — Perv(Spec Ω, Λ) =
finite-dimensional Λ-vector spaces. X a smooth curve: the simple objects are skyscrapers
i_{x*}Λ at closed points and IC_X(L) = (j_*L)[1] for L irreducible on dense opens.

Depends on: `intermediate-extension`, `intersection-complex`, `perverse-recollement`,
`abstract-intermediate-extension`.

Source: BBD-1982, Théorème 4.3.1 (ii), p. 112.

### `verdier-duality-perverse` — Self-duality of the middle perversity and duality of IC complexes ★

Node `EtaleDualityAndPerverseSheaves:EDC.5/verdier-duality-perverse` (theorem); planet “Verdier
duality of perverse sheaves”.

Let X be separated of finite type over k (ℓ invertible) and Λ a finite field of characteristic
ℓ or E/ℚ_ℓ finite. The Verdier dual D_X (EDC.1:adjoint/verdier-dual) exchanges pD^{≤0}(X, Λ)
and pD^{≥0}(X, Λ); it induces an anti-equivalence D_X : Perv(X, Λ)^op ≅ Perv(X, Λ) with D_X² ≅
id, pH^n(D_X K) ≅ D_X pH^{−n}(K), D_X ∘ j_!* ≅ j_!* ∘ D_U, and for X irreducible of dimension d
with smooth dense open U, D_X IC_X(L) ≅ IC_X(L^∨(d)) where L^∨ = Hom(L, Λ). No identification
of IC_X(L) with its dual is made without a given pairing L ⊗ L → Λ(−d).

Hypotheses. X separated of finite type over a field; Λ a field (finite of characteristic ℓ, or
E/ℚ_ℓ). Integral O_E: duality exchanges p and p⁺ instead
(EDC.5/integral-perverse-torsion-pair).

Construction and proof. (1) Biduality on D^b_c (EDC.1:biduality/constructible-biduality) and
the exchanges D i^* = i^! D, D Rj_* = j_! D (EDC.1:biduality/duality-exchange-isomorphisms)
show D(pD^{≤0}) = pD^{≥0} from the stalk/costalk definition (BBD 2.1.16–2.1.17, 4.0). (2) D_X ∘
j_!* ≅ j_!* ∘ D_U: D exchanges pj_! and pj_* (by the exchange formulas and t-exactness), hence
the images. (3) D_U(L[d]) = L^∨(d)[d] on smooth U
(EDC.1:biduality/dualizing-complex-of-smooth-scheme); apply j_!*.

Acceptance. X a smooth curve: D_X(Λ[1]) = Λ(1)[1], i.e. D IC_X = IC_X(1). X = Spec Ω: D is
Hom_Λ(−, Λ) on finite-dimensional vector spaces.

Depends on: `perverse-t-structure`, `perverse-sheaves`, `intermediate-extension`,
`intersection-complex`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme`,
`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`.

Source: BBD-1982, 4.0 (autodualité), p. 102.

### `affine-perverse-artin-vanishing` — Perverse Artin vanishing for affine morphisms ★

Node `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing` (theorem); planet
“Perverse Artin vanishing”.

Let f : X → Y be an affine morphism of schemes of finite type over k (ℓ invertible) and Λ as in
EDC.5/perverse-t-structure. Then Rf_* : D^b_c(X, Λ) → D^b_c(Y, Λ) is right t-exact and (for f
separated) Rf_! is left t-exact for the perverse t-structures (BBD 4.1.1, 4.1.2). If f is
quasi-finite and affine, Rf_* and Rf_! are t-exact (BBD 4.1.3). In particular, for X affine
over a separably closed k and K perverse, H^i(X, K) = 0 for i > 0 and H^i_c(X, K) = 0 for i <
0; for a constructible sheaf F, H^i(X, F) = 0 for i > dim X (BBD 4.1.4 = SGA 4 XIV 3.2).

Hypotheses. f affine between schemes of finite type over a field; Λ a field, O/π^m or E/ℚ_ℓ;
separatedness for Rf_!.

Construction and proof. (1) Right t-exactness of Rf_* for f affine: Artin's theorem on the
dimension of supports of R^qf_* for affine f (SGA 4 XIV 3.1, requested from
SchemeAndStackFoundations:SF.2 together with EDC.4/affine-vanishing-hypercohomology) gives dim
Supp R^qf_*F ≤ d(F) − q, which is BBD 4.1.1's estimate. (2) Left t-exactness of Rf_!: by
duality (EDC.5/verdier-duality-perverse, D Rf_* = Rf_! D) for field coefficients; for O/π^m by
BBD's direct argument (4.1.2). (3) Quasi-finite affine: Rf_* is also left t-exact because the
fibres have dimension 0 (EDC.5/perverse-amplitude-estimates), and dually for Rf_! (BBD 4.1.3).
(4) Y = Spec k gives the vanishing of H^i(X, K) for i > 0, and H^i_c by duality.

Acceptance. X = 𝔸¹, K = Λ[1]: H^i(𝔸¹, Λ[1]) = 0 for i > 0 (indeed H^{−1} = Λ, H^0 = 0). j : 𝔾_m
→ 𝔸¹ is affine and quasi-finite: Rj_* and j_! send perverse sheaves to perverse sheaves.
Non-example: for P¹ → Spec k (not affine), H^1(P¹, Λ[1]) = H²(P¹, Λ) ≠ 0.

Depends on: `perverse-t-structure`, `lisse-shift-is-perverse`,
`affine-vanishing-hypercohomology`, `verdier-duality-perverse`,
`SchemeAndStackFoundations:SF.2`.

Source: BBD-1982, Corollaire 4.1.3, p. 103.

### `perverse-amplitude-estimates` — Perverse amplitude of pushforward and pullback

Node `EtaleDualityAndPerverseSheaves:EDC.5/perverse-amplitude-estimates` (theorem).

Let f : X → Y be a morphism of schemes of finite type over k whose fibres have dimension ≤ d,
and Λ as in EDC.5/perverse-t-structure. Then (BBD 4.2.4): f^* sends pD^{≤0} to pD^{≤d} and f^!
sends pD^{≥0} to pD^{≥−d}; Rf_! sends pD^{≤0} to pD^{≤d} and Rf_* sends pD^{≥0} to pD^{≥−d}. If
f is smooth of pure relative dimension d, f^*[d] ≅ f^![−d](−d) is t-exact and, for f moreover
with geometrically connected fibres, f^*[d] : Perv(Y) → Perv(X) is fully faithful (BBD 4.2.5).
For f finite, f_* = Rf_* = Rf_! is t-exact; for i a closed immersion i_* : Perv(Z) → Perv(X) is
fully faithful; étale pullback is t-exact.

Hypotheses. f a morphism of finite type schemes over k with fibre dimension ≤ d; Λ as in
EDC.5/perverse-t-structure.

Construction and proof. (1) The estimate for f^* from the stalk condition: dim of the closure
of a point of X is at most dim of its image plus d (BBD 4.2.4); the other three by duality and
adjunction (EDC.5/t-exact-functor adjoint criterion). (2) Smooth f: smooth purity f^! =
f^*(d)[2d] (EDC.2:trace-purity/smooth-purity) makes the two one-sided estimates meet. (3) Full
faithfulness for smooth f with connected fibres: BBD 4.2.5 (Hom computed by f_*f^* on ℋ⁰RHom).
(4) Finite f: fibres of dimension 0 give both estimates.

Acceptance. f : 𝔸^d_Y → Y: f^*[d] sends Λ_Y[dim Y] to Λ[dim Y + d], perverse. f = closed
immersion of a point: i_*Λ is perverse.

Depends on: `perverse-t-structure`, `t-exact-functor`,
`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`, `verdier-duality-perverse`.

Source: BBD-1982, 4.2.4, p. 108.

### `generic-degree-concentration` — A perverse sheaf is concentrated in one degree at generic points of its support

Node `EtaleDualityAndPerverseSheaves:EDC.5/generic-degree-concentration` (theorem).

Let Y be a scheme of finite type over an algebraically closed field k of characteristic ≠ ℓ,
and K a perverse sheaf of 𝔽_ℓ-modules (more generally Λ as in EDC.5/perverse-t-structure) on Y
supported on a closed subset of dimension ≤ e. Then for every geometric point x̄ of Y whose
closure has dimension e, the stalk K_x̄ is concentrated in degree −e: ℋ^i(K)_x̄ = 0 for i ≠ −e.

Hypotheses. Y of finite type over an algebraically closed field; K perverse with dim Supp K ≤
e.

Construction and proof. (1) On a dense open V of each e-dimensional irreducible component of
Supp K, smooth of dimension e, the ℋ^i(K)|_V are locally constant (constructibility). (2) The
support condition gives ℋ^i(K)_x̄ = 0 for i > −e at the generic point x of the component. (3)
On V, K|_V has locally constant cohomology, so the costalk condition at x (codimension 0 in V)
reads ℋ^i(K)_x̄ = 0 for i < −e (EDC.5/lisse-shift-is-perverse); hence only i = −e survives.

Acceptance. K = IC_Y for Y irreducible of dimension e: the generic stalk is Λ in degree −e. K =
i_{x*}Λ for a closed point (e = 0): concentrated in degree 0. Non-example: at a non-generic
point of the support the stalk can have several degrees (the stalk of IC of a cone over a
smooth projective curve of genus g ≥ 1 at the vertex has two nonzero degrees).

Depends on: `perverse-t-structure`, `lisse-shift-is-perverse`.

Source: Caraiani-Scholze-2017, discussion after Corollary 6.1.4, p. 87 (arXiv v1).

### `semismall-pushforward-perverse` — Stratified semismall proper maps preserve perversity

Node `EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perverse` (theorem).

Let f : X → Y be a proper morphism of schemes of finite type over k, with stratifications {X_α}
of X and {Y_β} of Y such that f is stratified (each f^{−1}(Y_β) is a union of strata and f|:
X_α ∩ f^{−1}(Y_β) → Y_β is a locally trivial fibration in the étale topology on strata) and
semismall: for every stratum X_α and every Y_β ⊂ f(X_α̅), dim(f^{−1}(y) ∩ X_α) ≤ ½(dim X_α −
dim Y_β) for y ∈ Y_β. Then Rf_* = Rf_! sends perverse sheaves on X constructible with respect
to {X_α} to perverse sheaves on Y. In particular, if X is smooth of pure dimension n and f is
semismall (2 dim X ×_Y X ≤ 2n), Rf_*Λ_X[n] is perverse.

Hypotheses. f proper, stratified and semismall as stated; Λ as in EDC.5/perverse-t-structure.

Construction and proof. (1) Support condition: for y ∈ Y_β, (Rf_*K)_ȳ = RΓ(f^{−1}(ȳ), K) by
proper base change (requested from SchemeAndStackFoundations:SF.2); each stratum X_α ∩
f^{−1}(y) contributes in degrees ≤ −dim X_α + 2 dim(f^{−1}(y) ∩ X_α) ≤ −dim Y_β (cohomological
dimension 2·dim of a variety, Artin), giving the stalk condition (Mirković–Vilonen, Lemma 4.3).
(2) Cosupport condition: dual argument with Rf_! = Rf_* and EDC.5/verdier-duality-perverse (or
directly with costalks for O/π^m).

Acceptance. f = id: trivially semismall. The Springer resolution of the nilpotent cone of sl₂
(blow-up of the quadric cone at its vertex) is semismall: Rf_*Λ[2] is perverse, ≅ IC ⊕ i_{0*}Λ.
Non-example: the blow-up of a point in a smooth threefold is not semismall (fibre P² of
dimension 2 > 3/2): Rf_*Λ[3] ≅ Λ[3] ⊕ i_*Λ(−1)[1] ⊕ i_*Λ(−2)[−1] has summands in perverse
degrees −1 and 1, so it is not perverse.

Depends on: `perverse-t-structure`, `perverse-amplitude-estimates`, `verdier-duality-perverse`,
`SchemeAndStackFoundations:SF.2`.

Source: Mirkovic-Vilonen-2007, §4, Lemma 4.3, p. 14 (arXiv v5); deCataldo-Migliorini-2009,
§4.2, Proposition 4.2.1, p. 56 (arXiv v2).

### `small-map-intersection-complex` — Small maps push intersection complexes to intersection complexes

Node `EtaleDualityAndPerverseSheaves:EDC.5/small-map-intersection-complex` (theorem).

Let f : X → Y be a proper surjective morphism of irreducible schemes of finite type over k, X
smooth of pure dimension n, and suppose f is small: for every r ≥ 1, dim{y ∈ Y : dim f^{−1}(y)
≥ r} < n − 2r. Let V ⊂ Y be a dense open over which f is finite étale (it exists in
characteristic 0 or after shrinking where f is generically étale) and L := (f_*Λ)|_V. Then
Rf_*Λ_X[n] ≅ IC_Y(L). The same holds with Λ_X replaced by a local system on X.

Hypotheses. f proper surjective, X smooth of pure dimension n, f small; f finite étale over a
dense open V (assume f generically étale, e.g. separable).

Construction and proof. (1) Rf_*Λ[n] is perverse by EDC.5/semismall-pushforward-perverse (small
implies semismall). (2) Smallness gives the strict inequalities: for y outside V in a stratum
Y_β of dimension b, ℋ^i(Rf_*Λ[n])_ȳ = H^{i+n}(f^{−1}(ȳ)) = 0 unless i + n ≤ 2 dim f^{−1}(y) < n
− b, i.e. i < −b; dually for costalks. These are the strict bounds characterising j_!*
(EDC.5/intermediate-extension, BBD 2.1.9), so Rf_*Λ[n] = j_!*((Rf_*Λ[n])|_V) = IC_Y(L).

Acceptance. f finite surjective birational from a smooth X (e.g. the normalization of a nodal
curve): f is small, Rf_*Λ[n] = IC_Y. Non-example: a semismall but not small map (the blow-up of
a point in a smooth surface, r = 1 with dim{y} = 0 = n − 2r) gives Rf_*Λ[2] = IC_Y ⊕ i_*Λ(−1),
not IC.

Depends on: `semismall-pushforward-perverse`, `intermediate-extension`, `intersection-complex`.

Source: deCataldo-Migliorini-2009, §4.2, Remark 4.2.4, p. 56 (arXiv v2); Yun-Zhang-2019, §7.1,
proof of Proposition 7.1(1), published p. 507.

### `integral-perverse-torsion-pair` — Integral perverse t-structures p and p⁺

Node `EtaleDualityAndPerverseSheaves:EDC.5/integral-perverse-torsion-pair` (construction);
module `TauCeti/AlgebraicGeometry/Etale/Perverse/Integral`.

Let X be of finite type over k (ℓ invertible), E/ℚ_ℓ finite with ring of integers O = O_E and
uniformizer λ, and D^b_c(X, O) the integral constructible category
(EDC.6/classical-and-proetale-adic-categories). The middle perverse t-structure p on D^b_c(X,
O) is defined by the stalk and costalk conditions of EDC.5/perverse-t-structure (equivalently
by gluing). The dual t-structure p⁺ is defined by p⁺D^{≤0} := {K ∈ pD^{≤1} : pH¹(K) is
λ-torsion} and p⁺D^{≥0} := {K ∈ pD^{≥0} : pH⁰(K) is λ-torsion-free} (the tilt of p along the
torsion pair (torsion, torsion-free) in Perv(X, O)). Then (BBD 3.3): p⁺ is a t-structure;
pD^{≤0} ⊂ p⁺D^{≤0} ⊂ pD^{≤1}; the Verdier dual D_X exchanges p and p⁺ (D_X(pD^{≤0}) =
p⁺D^{≥0}); K ↦ K ⊗^L_O E is t-exact from p (and from p⁺) to the middle perverse t-structure of
D^b_c(X, E); reduction K ↦ K ⊗^L_O O/λ is right t-exact from p to p and left t-exact from p⁺ to
p. Integral duality does not preserve the heart of p.

Hypotheses. X of finite type over a field; O = O_E a complete DVR with residue characteristic ℓ
invertible on X.

Construction and proof. (1) p on D^b_c(X, O) by gluing along strata as in
EDC.5/perverse-t-structure with the standard t-structure of D^b_{fg}(O) on each stratum (BBD
3.3.4). (2) Torsion pair: torsion and torsion-free objects of the noetherian abelian category
Perv(X, O) form a torsion pair; the tilt (Happel–Reiten–Smalø) gives p⁺ (BBD §3.3 for the
stratified case). (3) Duality: on D^b_{fg}(O), RHom(−, O) exchanges the standard t-structure
with its tilt (Ext¹(T, O) for T torsion lands in degree 1); glue with the exchange formulas
(EDC.1:biduality/duality-exchange-isomorphisms, in its adic form
EDC.6/adic-transport-of-duality-and-classes).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.perverseIntegral` | constructor | The middle perverse t-structure p on D^b_c(X, O). |
| `TauCeti.EtaleDuality.perversePlus` | constructor | The t-structure p⁺ on D^b_c(X, O), tilt of p along torsion/torsion-free. |
| `TauCeti.EtaleDuality.perversePlus_le_iff` | characterisation | K ∈ p⁺D^{≤0} iff K ∈ pD^{≤1} and pH¹(K) is λ-torsion. |
| `TauCeti.EtaleDuality.perversePlus_ge_iff` | characterisation | K ∈ p⁺D^{≥0} iff K ∈ pD^{≥0} and pH⁰(K) is λ-torsion-free. |
| `TauCeti.EtaleDuality.verdierDual_perverse_le_iff` | relation | K ∈ pD^{≤0} iff D_X K ∈ p⁺D^{≥0}. |
| `TauCeti.EtaleDuality.perverse_le_perversePlus_le` | relation | pD^{≤0} ⊆ p⁺D^{≤0} ⊆ pD^{≤1}. |
| `TauCeti.EtaleDuality.rationalize_tExact` | compatibility | K ↦ K ⊗^L_O E is t-exact from p (and from p⁺) to the middle perverse t-structure on D^b_c(X, E). |

Used by. BBD §3.3: the integral perversities p and p⁺ and their exchange under duality.
LefschetzPencilsAndVanishingCycles:LPV.7 (request to EDC.5): integral p/p⁺ conventions for
nearby cycles are not imported from rational self-duality. GeometricSatakeAndFusion:GS1:
integral perverse sheaves on Witt Grassmannians (ℓ^{a(μ)} bounds compare p and p⁺ objects).

Unit tests:

- `TauCeti.EtaleDuality.perversePlus_point_torsion` (computation): For X = Spec Ω, O/λ placed
  in degree 1 lies in the heart of p⁺ and O/λ in degree 0 does not.
- `TauCeti.EtaleDuality.perversePlus_point_free` (computation): For X = Spec Ω, O in degree 0
  lies in the hearts of both p and p⁺.
- `TauCeti.EtaleDuality.perversePlus_empty` (degenerate): For X = ∅, p = p⁺.
- `TauCeti.EtaleDuality.not_perverse_eq_perversePlus` (non-example): p ≠ p⁺ on D^b_c(Spec Ω,
  O): O/λ[0] is in the heart of p but not of p⁺.

Acceptance. X = Spec Ω: p is the standard t-structure on D^b_{fg}(O); its p⁺ heart contains
O/λ[−1] but not O/λ[0].

Depends on: `perverse-t-structure`, `perverse-sheaves`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`,
`mathlib:CategoryTheory.Triangulated.TStructure`.

Source: BBD-1982, 4.0 (a), p. 101, with 3.3.4, p. 99–100.

## EDC.6 — Integral, analytic and diamond comparison of operations

The ℓ-adic constructible categories of EllAdicRealization (Ekedahl) and of Bhatt–Scholze are
identified, and the constructions of part EDC.0 and of EDC.5 (traces, duality, Gysin and cycle
classes, perverse t-structures) are transported to O_E and E coefficients with integral torsion
retained and compatibly with coefficient extension. Artin's comparison theorem identifies étale
and complex-analytic constructible categories with their operations, and the algebraic trace
and cycle classes with topological orientation classes; smooth proper base change gives the
field-independence of Betti numbers of complete intersections. The scheme/adic/diamond
comparisons are those of ECD §27 and Huber §§3.7–3.8, imported from their owners and used to
transport duality; no diamond six operations are constructed here.

### `scheme-adic-diamond-operation-comparisons-index` — Scheme, adic and diamond comparisons of the duality operations, with their exact hypotheses

Node `EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`
(comparison).

The comparison functors between schemes and their analytic or diamond counterparts commute with
the operations planned in EDC.0–EDC.5 under the following hypotheses, each supplied by its
owner. Scheme → diamond in characteristic p (ECD §27, owned by AdicCoefficientsAndComparisons
L3): for any scheme X of characteristic p and Λ killed by an integer prime to p, c_X^* :
D_ét(X, Λ) → D_ét(X^◇, Λ) commutes with ⊗ and pullback (27.1), is fully faithful with right
adjoint Rc_{X*} (27.2), Rc_{X*} commutes with RHom and pushforward (27.3), and for f separated
of finite type between qcqs schemes of characteristic p, Rf^◇_!c_Y^* ≅ c_X^*Rf_! and
Rf^!Rc_{X*} ≅ Rc_{Y*}Rf^{◇!} (27.4). Mixed characteristic over a complete DVR O with perfect
residue field (AdicCoefficientsAndComparisons L4 and L6): the Rf_!/f^! comparison for separated
f of finite type over O (27.5), and commutation of c^* with Rf_* and full faithfulness on
constructible complexes with finite coefficients prime to p (27.6–27.7). Scheme → adic (Huber,
owned by ClassicalAdicEtaleCohomology H5): proper base change R^+f_* comparison for f proper
(Huber 3.7.2) and R^qf_*F ≅ R^qf^{rig}_*F for f of finite type over a complete nonarchimedean
field and F constructible with torsion prime to the residue characteristic (Huber 3.8.1).
Consequences recorded here: for f separated of finite type in these ranges, the comparison
functors commute with Rf_!, f^! and hence with the dualizing complex K_X and the Verdier dual
D_X on constructible complexes (D_{X^◇}c^* ≅ c^*D_X whenever c^* commutes with f^! for a : X →
Spec k and with RHom on constructible objects). None of these constructs diamond six operations
or asserts that an analytic space has an algebraic model.

Hypotheses. Per comparison, the qcqs, finite-type, characteristic and ℓ-invertibility
hypotheses of ECD 27.1–27.7 and Huber 3.7.2, 3.8.1; coefficients torsion and prime to p
(rational statements by passage to the limit in EDC.6/adic-transport-of-duality-and-classes).

Construction and proof. (1) Import the comparison theorems from their owners:
AdicCoefficientsAndComparisons L2 (qcqs compactification), L3 (27.1–27.4), L4 (27.5), L6
(27.6–27.7), and ClassicalAdicEtaleCohomology H5 (Huber 3.7.2 and 3.8.1). (2) Duality
transport: K_X = a^!Λ (EDC.1:adjoint/dualizing-complex) and D_X = RHom(−, K_X); in the
characteristic-p range, 27.3–27.4 give Rc_*D_{X^◇}c^*K ≅ D_X Rc_*c^*K ≅ D_X K using full
faithfulness (27.2); apply to constructible K (EDC.1:biduality/constructible-biduality).

Acceptance. X = 𝔸¹ over a perfectoid field of characteristic p: Rf^◇_!Λ = c^*Rf_!Λ = Λ(−1)[−2]
(ECD 27.4). D_{X^◇}(Λ) ≅ c^*K_X for X smooth of dimension d: Λ(d)[2d] on both sides.

Depends on: `AdicCoefficientsAndComparisons:L2`, `AdicCoefficientsAndComparisons:L3`,
`AdicCoefficientsAndComparisons:L4`, `AdicCoefficientsAndComparisons:L6`,
`ClassicalAdicEtaleCohomology:H5/proper-comparison-3-7-2`,
`ClassicalAdicEtaleCohomology:H5/comparison-over-nonarchimedean-fields-3-8-1`,
`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`.

Source: Scholze-ECD-2026, §27, Proposition 27.2, p. 163; Scholze-ECD-2026, §27, Proposition
27.4, p. 165.

### `classical-and-proetale-adic-categories` — Classical and pro-étale ℓ-adic constructible categories

Node `EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`
(comparison).

Let X be a scheme of finite type over a field (or over ℤ[1/ℓ]-regular bases of dimension ≤ 1),
ℓ invertible on X, E/ℚ_ℓ finite with ring of integers O and uniformizer λ. The integral
constructible category D^b_c(X, O) — defined either as Ekedahl's category of λ-adic systems
(normalized complexes (K_m) with K_m ∈ D_ctf(X, O/λ^m) and K_{m+1} ⊗^L O/λ^m ≅ K_m) as imported
from EllAdicRealization (through SchemeAndStackFoundations:SF.2), or as Bhatt–Scholze's
D_cons(X_proét, O) of derived λ-complete objects whose reductions are constructible — are
equivalent, compatibly with the reduction functors K ↦ K ⊗^L O/λ^m. D^b_c(X, E) := D^b_c(X, O)
⊗ E is the full subcategory D_cons(X_proét, E) of Bhatt–Scholze, and D^b_c(X, Ē) is the
2-colimit over finite E'/E. Both carry the six operations f^*, Rf_*, Rf_!, f^!, ⊗, RHom,
compatible with the finite-level ones under reduction, and with coefficient extension E → E'.

Hypotheses. X of finite type over a field (or a regular base of dimension ≤ 1) with ℓ
invertible; E/ℚ_ℓ finite.

Construction and proof. (1) Pro-étale side: D(X_proét, O) and derived completion are
EnhancedDerivedSheaves E4 (coefficient-system reconstruction,
EnhancedDerivedSheaves:E4/coefficient-system-reconstruction); D_cons is the subcategory of
complete objects with constructible reductions (Bhatt–Scholze 6.5). (2) The equivalence with
λ-adic systems: K ↦ (K ⊗^L O/λ^m)_m with inverse R lim (Bhatt–Scholze, comparison with
Ekedahl's category; EnhancedDerivedSheaves:E4/inverse-limit-reconstruction). (3) Six operations
on D^b_c(X, O): defined levelwise on normalized systems by the finite-level operations
(EDC.0/coefficient-change, EDC.1:adjoint/exceptional-inverse-image) which preserve D_ctf and
commute with ⊗^L O/λ^m (projection formula, imported finiteness through
SchemeAndStackFoundations:SF.2); E and Ē by localization and colimit (Bhatt–Scholze 6.8).

Acceptance. X = Spec Ω, Ω separably closed: D^b_c(X, O) ≃ D^b_{fg}(O) and D^b_c(X, E) ≃
D^b_{fd}(E). The constant system (O/λ^m)_m corresponds to O_X; its rationalization is E_X.

Depends on: `EnhancedDerivedSheaves:E4/coefficient-system-reconstruction`,
`EnhancedDerivedSheaves:E4/inverse-limit-reconstruction`,
`EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`,
`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`,
`EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`,
`SchemeAndStackFoundations:SF.2`.

Source: Bhatt-Scholze-proetale-2015, before Proposition 6.8.14, p. 61 (arXiv v2).

### `adic-transport-of-duality-and-classes` — Transport of traces, duality and Gysin classes to ℓ-adic and rational coefficients

Node `EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes` (theorem).

In the situation of EDC.6/classical-and-proetale-adic-categories, for X separated of finite
type over a field k: (a) the dualizing complex K_X := a^!O ∈ D^b_c(X, O) reduces to the
finite-level K_X ⊗^L O/λ^m and D_X := RHom(−, K_X) preserves D^b_c(X, O); the evaluation K →
D_XD_XK is an isomorphism for all K ∈ D^b_c(X, O) (no self-injectivity needed at the integral
level, because biduality holds at each finite level O/λ^m and passes to the limit) and for
D^b_c(X, E); D_X exchanges Rf_* and Rf_!, f^* and f^!. (b) The smooth trace Tr_f, the purity
isomorphism f^!O ≅ O(d)[2d] for smooth f of relative dimension d, the Gysin maps and the cycle
class map cl : CH^r(X) → H^{2r}(X, O(r)) are the limits of their finite-level versions
(EDC.2:trace-purity, EDC.3), with integral torsion retained: H^q(X, O) = lim H^q(X, O/λ^m) is a
finitely generated O-module whose torsion is not discarded, and the universal-coefficient
sequences 0 → H^q(X, O) ⊗ O/λ^m → H^q(X, O/λ^m) → H^{q+1}(X, O)[λ^m] → 0 hold. (c) After ⊗E
these give the rational statements, compatible with extension of scalars E → E' ⊂ Ē (D_X,
traces and cycle classes commute with − ⊗_E E').

Hypotheses. X separated of finite type over a field; ℓ invertible; O = O_E.

Construction and proof. (1) Each finite-level operation commutes with reduction O/λ^{m+1} →
O/λ^m (EDC.0/coefficient-change, projection formula for Rf_! and f^!, imported finiteness), so
it defines a functor on normalized systems; biduality and the exchange formulas hold levelwise
(EDC.1:biduality/constructible-biduality, EDC.1:biduality/duality-exchange-isomorphisms) and
pass to R lim (Mittag-Leffler for finite groups). (2) Traces and Gysin maps are compatible with
reduction by construction (their finite-level constructions are natural in Λ), hence define
maps of systems; cycle classes likewise (EDC.3/cycle-class-map). (3) Universal coefficients:
RΓ(X, K) ⊗^L O/λ^m ≅ RΓ(X, K ⊗^L O/λ^m) for K ∈ D^b_c(X, O) (projection formula) and RΓ(X, K) ∈
D^b_{fg}(O). (4) Coefficient extension: E' is finite free over E, so all operations commute
with − ⊗_E E'.

Acceptance. X smooth proper of dimension d over k separably closed: H^{2d}(X, O(d)) ≅ O via the
limit trace, and Poincaré duality over O has the Ext¹ correction of
EDC.2:pairings/adic-and-rational-poincare-duality. An Enriques surface over k separably closed
of characteristic ≠ 2 with ℓ = 2: H²(X, ℤ_2) has torsion ℤ/2, which the integral statement
retains.

Depends on: `classical-and-proetale-adic-categories`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`,
`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`,
`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`,
`EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`,
`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`,
`EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`.

Source: Bhatt-Scholze-proetale-2015, Remark 6.8.15, p. 62 (arXiv v2).

### `rational-perverse-coefficient-extension` — Perverse t-structures with ℓ-adic coefficients and coefficient extension

Node `EtaleDualityAndPerverseSheaves:EDC.6/rational-perverse-coefficient-extension` (theorem).

For X of finite type over k (ℓ invertible) and E/ℚ_ℓ finite, the middle perverse t-structure of
EDC.5/perverse-t-structure on D^b_c(X, E) and on D^b_c(X, Ē) := 2-colim_{E'} D^b_c(X, E') is
compatible with coefficient extension: for E ⊂ E', K ↦ K ⊗_E E' is t-exact, induces an exact
functor Perv(X, E) → Perv(X, E'), commutes with j_!* and IC (IC_X(L) ⊗_E E' ≅ IC_X(L ⊗_E E')),
and Hom_{Perv(X,E')}(K ⊗ E', L ⊗ E') = Hom_{Perv(X,E)}(K, L) ⊗_E E'. Reduction from O to O/λ (K
↦ K ⊗^L O/λ) is right t-exact for p and sends the heart of p to pD^{[−1,0]}
(EDC.5/integral-perverse-torsion-pair). Simple objects of Perv(X, Ē) are defined over some
finite E'.

Hypotheses. X of finite type over a field, ℓ invertible; E ⊂ E' finite extensions of ℚ_ℓ.

Construction and proof. (1) The stalk/costalk conditions are insensitive to the faithfully flat
extension E → E' (ℋ^i(K ⊗ E') = ℋ^i(K) ⊗ E'), so ⊗E' is t-exact; j_!* commutes with ⊗E' by its
truncation formula (EDC.5/intermediate-extension, Deligne's formula) (BBD 2.2.18). (2) Homs:
RHom commutes with the finite free extension (EDC.6/adic-transport-of-duality-and-classes). (3)
Reduction: K ⊗^L O/λ sits in the triangle K →λ K → K ⊗^L O/λ →, whose perverse cohomology
sequence gives the amplitude [−1, 0].

Acceptance. IC_X(Ē) of a smooth curve is Ē[1]. For X = Spec Ω, ⊗E' is the scalar extension of
finite-dimensional vector spaces.

Depends on: `perverse-t-structure`, `intermediate-extension`, `integral-perverse-torsion-pair`,
`classical-and-proetale-adic-categories`, `adic-transport-of-duality-and-classes`.

Source: BBD-1982, 2.2.18, p. 73.

### `complex-analytic-comparison` — Comparison with the complex-analytic constructible category ★

Node `EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison` (theorem); planet
“Comparison with complex-analytic sheaves”.

Let X be separated of finite type over ℂ, X^an its analytification and Λ a finite ring (killed
by n), O_E or E. The comparison functor ε^* : D^b_c(X_ét, Λ) → D^b_c(X^an, Λ) (constructible
for algebraic stratifications) is an equivalence for finite Λ (BBD 6.1.2, from Artin's
comparison theorem SGA 4 XVI 4.1), commutes with the six operations f^*, Rf_*, Rf_!, f^!, ⊗^L,
RHom for morphisms of finite type (in particular with Verdier duality D_X), and is t-exact for
the middle perverse t-structures, so it identifies Perv(X_ét, Λ) with algebraically
constructible perverse sheaves on X^an and preserves j_!* and IC. For O_E and E coefficients
the same holds on the ℓ-adic categories (limits of the finite-level statements); the comparison
of trace maps and cycle classes with topological orientation classes is
EDC.6/trace-orientation-comparison.

Hypotheses. X separated of finite type over ℂ; algebraically constructible complexes; Λ finite,
O_E or E.

Construction and proof. (1) Artin's comparison theorem (H^q(X_ét, F) ≅ H^q(X^an, F^an) for
constructible F, SGA 4 XVI 4.1; and Rf_* comparison for f of finite type) is requested from
CohomologicalPointCounting ComplexComparison through SchemeAndStackFoundations:SF.2 (its owner
in the atlas convention). (2) Commutation with Rf_! follows from Rf_* for proper maps and j_!
for open immersions (Nagata); with f^! and D by adjunction and the dualizing complexes on both
sides (BBD 6.1.2). (3) Perverse t-exactness: the stalk/costalk conditions are computed on
points of X and stratifications, which agree on both sides.

Acceptance. X = 𝔸¹_ℂ: H^q(𝔸¹_ét, Λ) = H^q(ℂ, Λ) = Λ for q = 0, 0 otherwise. IC of the nodal
cubic over ℂ: ε^*IC_X = ν_*Λ_{P¹(ℂ)}[1], the topological IC complex.

Depends on: `adic-transport-of-duality-and-classes`, `perverse-t-structure`,
`intermediate-extension`, `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`,
`SchemeAndStackFoundations:SF.2`.

Source: BBD-1982, 6.1.2 (B′), p. 149.

### `trace-orientation-comparison` — Algebraic traces and cycle classes versus topological orientation

Node `EtaleDualityAndPerverseSheaves:EDC.6/trace-orientation-comparison` (theorem).

Let X be smooth separated of pure dimension d over ℂ and Λ = ℤ/n, ℤ_ℓ or ℚ_ℓ. Under the
comparison isomorphism H^q(X_ét, Λ) ≅ H^q(X^an, Λ) (EDC.6/complex-analytic-comparison) and the
identification Λ(1) ≅ Λ given by exp(2πi/n) ↦ 1 (ζ_n ↦ 1): (a) the étale trace Tr :
H^{2d}_c(X_ét, Λ(d)) → Λ (EDC.2:trace-purity) corresponds to integration against the complex
orientation, Tr_X ↦ ∫_{X^an}, sending the class of a point to 1; (b) the étale cycle class
cl(Z) ∈ H^{2r}(X_ét, Λ(r)) of a closed subvariety of codimension r corresponds to the
topological fundamental class of Z^an (Poincaré dual of [Z^an]); (c) cup products and compactly
supported duality pairings correspond. The sign convention: c₁(O(1)) on P¹ maps to the positive
generator of H²(P¹(ℂ), ℤ) for the complex orientation, with the Kummer sequence matched to the
exponential sequence by exp(2πi·/n).

Hypotheses. X smooth over ℂ; the identification Λ(1) ≅ Λ through e^{2πi/n} is part of the
statement (other choices change Tr by a sign or a unit).

Construction and proof. (1) The Kummer sequence 0 → μ_n → 𝔾_m → 𝔾_m → 0 maps to the exponential
sequence on X^an via μ_n ≅ ℤ/n, e^{2πi k/n} ↔ k; hence c₁ corresponds to the topological first
Chern class (CohomologicalPointCounting ComplexComparison L10–12, requested through
SchemeAndStackFoundations:SF.2). (2) Traces are normalized by points and c₁(O(1)) on P¹
(EDC.2:trace-purity), and the topological integration satisfies the same normalization; both
are compatible with Gysin maps of points, so they agree. (3) Cycle classes: both sides are
determined by the fundamental class of the smooth locus and semi-purity
(EDC.3/fundamental-class).

Acceptance. X = P¹: Tr(c₁(O(1))) = 1 on both sides (the stage's acceptance: P¹'s orientation).
X an open curve: H²_c(X, Λ(1)) ≅ Λ with the same normalization. A smooth divisor D ⊂ X: cl(D) =
c₁(O(D)) maps to the topological Poincaré dual of [D] under both routes.

Depends on: `complex-analytic-comparison`,
`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/top-degree-compact-cohomology`,
`EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`,
`EtaleDualityAndPerverseSheaves:EDC.3/fundamental-class`, `SchemeAndStackFoundations:SF.2`.

Source: BBD-1982, 6.1.2 (B′), p. 149.

### `complete-intersection-betti-comparison` — Betti numbers of smooth complete intersections are independent of the field

Node `EtaleDualityAndPerverseSheaves:EDC.6/complete-intersection-betti-comparison` (theorem).

Fix N, m and a multidegree (d_1, …, d_{N−m}). For every separably closed field k of
characteristic ≠ ℓ and every smooth complete intersection X ⊂ P^N_k of that multidegree and
dimension m, dim H^m(X, ℚ_ℓ) equals the topological Betti number b_m(X_ℂ^an) of any smooth
complete intersection X_ℂ ⊂ P^N_ℂ of the same multidegree, and hence the primitive rank b_m^0 =
dim H^m(X, ℚ_ℓ)_0 of EDC.4/complete-intersection-cohomology is a function of (N, m, d_•) only;
for a smooth hypersurface of degree d, b_m^0 = ((d − 1)^{m+2} + (−1)^m(d − 1))/d.

Hypotheses. Smooth complete intersections of a fixed multidegree; ℓ invertible in k.

Construction and proof. (1) The parameter scheme S ⊂ ∏ P(Sym^{d_i}) over Spec ℤ[1/ℓ] of tuples
defining a smooth complete intersection of dimension m is open with geometrically irreducible
(hence connected) fibres and nonempty over every point; the universal family f : 𝒳 → S is
smooth and proper (imported scheme geometry from SchemeAndStackFoundations:SF.0). (2) Smooth
and proper base change (requested from SchemeAndStackFoundations:SF.2) makes R^mf_*ℚ_ℓ lisse on
S; S is connected (irreducible over ℤ[1/ℓ]) so its rank is constant, and specializations
between geometric points of S identify the fibres' H^m. (3) Over ℂ, Artin's comparison
(EDC.6/complex-analytic-comparison) identifies dim H^m(X_ℂ, ℚ_ℓ) with the topological Betti
number; the hypersurface formula is the classical Euler characteristic computation (χ(X) = deg
c_m(T_X), with EDC.4/complete-intersection-cohomology giving all other Betti numbers).

Acceptance. Smooth plane cubics: b_1 = 2 over every k (= (8 − 2)/3 = 2 by the formula with m =
1, d = 3). Smooth quadric surfaces: b_2^0 = (1 + 1)/2 = 1.

Depends on: `complete-intersection-cohomology`, `complex-analytic-comparison`,
`SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`.

Source: Milne-LEC-v2.21, §16, p. 110.

### `diamond-transport-of-duality` — Transport of duality and perversity statements to diamonds in characteristic p

Node `EtaleDualityAndPerverseSheaves:EDC.6/diamond-transport-of-duality` (theorem).

Let k be a perfectoid (or algebraically closed nonarchimedean) field of characteristic p, X a
separated scheme of finite type over k (or over its ring of integers), and Λ a finite ring
killed by an integer prime to p. Under the comparison c_X^* : D_ét(X, Λ) → D_ét(X^◇, Λ)
(EDC.6/scheme-adic-diamond-operation-comparisons-index): c_X^*K_X ≅ K_{X^◇} (dualizing
complexes), c_X^*D_X K ≅ D_{X^◇}c_X^*K for K ∈ D^b_c(X, Λ), and c^* commutes with Rf_!, f^! and
with the exchange isomorphisms of EDC.1:biduality; consequently the Verdier biduality of
constructible complexes transports to their images. The middle perverse t-structure is
transported only where the target defines it from the scheme model (perfect schemes and Witt
Grassmannians: GeometricSatakeAndFusion GS1 through the scheme side); no perverse t-structure
on general diamonds is constructed here.

Hypotheses. The hypotheses of ECD 27.1–27.4 (characteristic p) or 27.5–27.7 (mixed
characteristic, finite coefficients prime to p, constructible complexes).

Construction and proof. (1) Apply EDC.6/scheme-adic-diamond-operation-comparisons-index: c^*
commutes with Rf_! and (via Rc_*) with f^!; for a : X → Spec k this gives c^*K_X ≅ K_{X^◇}. (2)
Duality: c^*RHom(K, K_X) ≅ RHom(c^*K, c^*K_X) for constructible K (27.1, 27.3 and full
faithfulness 27.2). (3) Transport of exchange isomorphisms: they are built from adjunctions
that c^* respects.

Acceptance. X = 𝔸^d over k: K_{(𝔸^d)^◇} ≅ Λ(d)[2d] = c^*K_{𝔸^d}. X = P¹: D commutes with c^* on
Λ_X, giving Λ(1)[2] on both sides.

Depends on: `scheme-adic-diamond-operation-comparisons-index`,
`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`,
`AdicCoefficientsAndComparisons:L3`.

Source: Scholze-ECD-2026, §27, Proposition 27.4, p. 165.

## EDC.7 — Pure intersection complexes and decomposition

Weil II's weights, mixed complexes, the direct-image theorem and absolute hard Lefschetz are
imported from DeligneWeightsAndPurity DWP.7–DWP.9. On top of EDC.5 this stage plans BBD chapter
5: weights of perverse cohomology, Ext-vanishing between weights, the weight filtration of
mixed perverse sheaves, purity of intermediate extensions and IC complexes, geometric
semisimplicity of pure perverse sheaves, the decomposition of pure complexes over 𝔽̄_q and for
proper direct images, and relative hard Lefschetz for projective maps with a chosen relatively
ample class; then chapter 6: spreading out and the decomposition theorem over ℂ for complexes
of geometric origin. There is no mod-ℓ or integral decomposition theorem here, and no claim
that arithmetic Frobenius is semisimple.

### `weights-and-perverse-truncation` — Weights are compatible with perverse truncation

Node `EtaleDualityAndPerverseSheaves:EDC.7/weights-and-perverse-truncation` (theorem).

Let X₀/𝔽_q be as in Weil II and K₀ ∈ D^b_m(X₀, ℚ̄_ℓ) a mixed complex
(DeligneWeightsAndPurity:DWP.8/mixed-complexes). Then: (a) the perverse cohomology sheaves
pH^i(K₀) are mixed; (b) K₀ has weights ≤ w iff each pH^i(K₀) has weights ≤ w + i, and K₀ has
weights ≥ w iff each pH^i(K₀) has weights ≥ w + i (BBD 5.4.1); (c) the six operations satisfy
the weight estimates f_!, f^* preserve D_{≤w}, f_*, f^! preserve D_{≥w}, and D exchanges D_{≤w}
and D_{≥−w} (BBD 5.1.14; owned by DWP.8 and imported here); (d) for j an affine immersion, j_!
and j_* of a mixed perverse sheaf of weights ≤ w (resp. ≥ w) have weights ≤ w (resp. ≥ w).

Hypotheses. X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or
E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed
complexes as in DeligneWeightsAndPurity:DWP.8.

Construction and proof. (1) (c) is imported:
DeligneWeightsAndPurity:DWP.8/six-operations-preserve-mixedness-6-1-11,
DWP.8/compact-support-direct-image-upper-weights-6-2-3 and DWP.8/directional-weight-estimates
(Weil II 6.1.11, 6.2.3). (2) (a),(b): BBD 5.4.1 — by induction on the perverse amplitude using
the truncation triangles and the fact that D_{≤w} is stable under extensions; the 'if'
directions use the triangles directly, the 'only if' directions use (c) for i^*, i^! on strata
and the stalk description of pD^{≤0}. (3) (d): j affine, so j_* and j_! are t-exact on perverse
sheaves when quasi-finite (EDC.5/affine-perverse-artin-vanishing), and (c).

Acceptance. K₀ = ℚ̄_ℓ on a smooth curve X₀ over 𝔽_q (pure of weight 0): its only perverse
cohomology is pH^1(K₀) = ℚ̄_ℓ[1], pure of weight 1 = w + i, as (b) requires. K₀ = ℚ̄_ℓ[1] on
the same curve is perverse and pure of weight 1.

Depends on: `DeligneWeightsAndPurity:DWP.8/mixed-complexes`,
`DeligneWeightsAndPurity:DWP.8/pure-complexes`,
`DeligneWeightsAndPurity:DWP.8/six-operations-preserve-mixedness-6-1-11`,
`DeligneWeightsAndPurity:DWP.8/compact-support-direct-image-upper-weights-6-2-3`,
`DeligneWeightsAndPurity:DWP.8/directional-weight-estimates`, `perverse-sheaves`,
`t-cohomology-functor`, `affine-perverse-artin-vanishing`.

Source: BBD-1982, Théorème 5.4.1, p. 141 (with Stabilités 5.1.14, p. 128).

### `ext-vanishing-weights` — Ext-vanishing between weights

Node `EtaleDualityAndPerverseSheaves:EDC.7/ext-vanishing-weights` (theorem).

In the situation of Weil II over 𝔽_q: (a) if K₀ has weights ≤ w and L₀ has weights ≥ w, then
the Frobenius module H^i(X, RHom(K, L)) has weights ≥ i for every i, and Hom(K₀, L₀[i]) = 0 for
i ≥ 2; (b) if K₀ and L₀ are perverse, K₀ of weights ≤ w and L₀ of weights > w, then Hom(K₀, L₀)
= 0 and Ext¹_{Perv(X₀)}(K₀, L₀) = Hom(K₀, L₀[1]) = 0 (BBD 5.1.15).

Hypotheses. X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or
E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed
complexes as in DeligneWeightsAndPurity:DWP.8.

Construction and proof. (1) RHom(K₀, L₀) = D(K₀ ⊗^L D L₀) has weights ≥ 0 when K₀ ∈ D_{≤w} and
L₀ ∈ D_{≥w}, since D L₀ ∈ D_{≤−w}, ⊗ adds upper weights and D exchanges D_{≤0} and D_{≥0}
(EDC.7/weights-and-perverse-truncation (c)); pushing forward to Spec 𝔽_q preserves D_{≥0} (Rf_*
of a complex of weights ≥ 0), so H^i(X, RHom(K, L)) has weights ≥ i. (2) The Hochschild–Serre
sequence 0 → H^{i−1}(X, RHom)_F → Hom(K₀, L₀[i]) → H^i(X, RHom)^F → 0 for the absolute
Frobenius (Weil II 5.1.2.5) and the absence of the eigenvalue 1 in weights ≠ 0 give (a); for
perverse K, L, H^i(X, RHom(K, L)) = 0 for i < 0, and in (b) H⁰ and H¹ have weights > 0, so
neither the invariants of H⁰ nor the coinvariants of H⁰ (which compute Hom and Ext¹) survive
(BBD 5.1.15).

Acceptance. K₀ = ℚ̄_ℓ(−1) (weight 2) and L₀ = ℚ̄_ℓ (weight 0) on Spec 𝔽_q: Hom = 0 and Ext¹ =
H¹(𝔽_q, ℚ̄_ℓ(1)) = 0.

Depends on: `weights-and-perverse-truncation`, `DeligneWeightsAndPurity:DWP.8/pure-complexes`,
`DeligneWeightsAndPurity:DWP.8/extensions-between-pure-lisse-sheaves-3-4-3-3-4-4`.

Source: BBD-1982, Proposition 5.1.15, p. 129.

### `mixed-perverse-weight-filtration` — The weight filtration of a mixed perverse sheaf

Node `EtaleDualityAndPerverseSheaves:EDC.7/mixed-perverse-weight-filtration` (theorem).

A mixed perverse sheaf F₀ on X₀ (separated of finite type over 𝔽_q, coefficients ℚ̄_ℓ) has a
unique finite increasing filtration W (the weight filtration) by perverse subsheaves such that
Gr^W_i F₀ is pure of weight i; every morphism of mixed perverse sheaves is strictly compatible
with the weight filtrations (BBD 5.3.5). The subcategory of mixed perverse sheaves is stable
under subquotients and extensions in Perv(X₀).

Hypotheses. X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or
E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed
complexes as in DeligneWeightsAndPurity:DWP.8.

Construction and proof. (1) Stability of mixed perverse sheaves under subquotients (BBD 5.3.1)
and induction on length (EDC.5/simple-perverse-sheaves), with Ext¹(V₀, U₀) = 0 for simple U₀,
V₀ of weights u > v (EDC.7/ext-vanishing-weights) to order the composition factors (BBD 5.3.5).

Acceptance. A pure perverse sheaf has a one-step filtration. Rj_*ℚ̄_ℓ[1] for j : 𝔾_m → 𝔸¹ over
𝔽_q: W₁ = ℚ̄_ℓ_{𝔸¹}[1] (weight 1) and Gr^W_2 = i_{0*}ℚ̄_ℓ(−1) (weight 2).

Depends on: `ext-vanishing-weights`, `weights-and-perverse-truncation`,
`simple-perverse-sheaves`.

Source: BBD-1982, Théorème 5.3.5, p. 136.

### `ic-purity` — Purity of intersection complexes ★

Node `EtaleDualityAndPerverseSheaves:EDC.7/ic-purity` (theorem); planet “Purity of intersection
complexes”.

Let X₀ be separated of finite type over 𝔽_q, j : U₀ → X₀ a locally closed immersion with U₀
smooth irreducible of dimension d, and L₀ a lisse ℚ̄_ℓ-sheaf on U₀ pure of weight w. Then
IC_{X₀}(L₀) := j_!*(L₀[d]) is pure of weight w + d. More generally, j_!* preserves purity: if
F₀ is a perverse sheaf on U₀ pure of weight w then j_!*F₀ is pure of weight w (BBD 5.3.2); for
j affine, j_!*F₀ is the image of the weight-≤-w object j_!F₀ in the weight-≥-w object j_*F₀.

Hypotheses. X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or
E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed
complexes as in DeligneWeightsAndPurity:DWP.8. L₀ lisse and pure of weight w on the smooth U₀;
the weight is shifted by d in the perverse normalization (L₀[d] has weight w + d).

Construction and proof. (1) Reduce to j affine (an open immersion with complement a Cartier
divisor, then compose; BBD 5.3.2). (2) For j affine and quasi-finite, j_! and j_* are t-exact
(EDC.5/affine-perverse-artin-vanishing); j_!F₀ has weights ≤ w and j_*F₀ has weights ≥ w
(EDC.7/weights-and-perverse-truncation (d)); subquotients of objects of weights ≤ w (≥ w) have
weights ≤ w (≥ w) (BBD 5.3.1), so the image j_!*F₀ has weights both ≤ w and ≥ w. (3) L₀[d] is
pure of weight w + d (DeligneWeightsAndPurity:DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5).

Acceptance. X₀ smooth: IC_{X₀}(L₀) = L₀[d], pure of weight w + d. X₀ the nodal cubic over 𝔽_q
with split node s: IC = ν_*ℚ̄_ℓ[1] is pure of weight 1, while ℚ̄_ℓ[1] on X₀ is mixed: its
perverse subobject i_{s*}ℚ̄_ℓ has weight 0.

Depends on: `intersection-complex`, `intermediate-extension`,
`weights-and-perverse-truncation`, `affine-perverse-artin-vanishing`,
`DeligneWeightsAndPurity:DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`.

Source: BBD-1982, Corollaire 5.3.2, p. 135.

### `geometric-semisimplicity` — Pure perverse sheaves are geometrically semisimple ★

Node `EtaleDualityAndPerverseSheaves:EDC.7/geometric-semisimplicity` (theorem); planet
“Geometric semisimplicity”.

Let F₀ be a perverse sheaf on X₀ (separated of finite type over 𝔽_q) pure of weight w. Then F
:= F₀ ⊗ 𝔽̄_q is a semisimple object of Perv(X, ℚ̄_ℓ): F ≅ ⊕ i_{V*}j_!*(L[dim V]) with L
irreducible lisse on smooth V (BBD 5.3.8). No semisimplicity of F₀ itself, of the Frobenius
action, or of any mod-ℓ or integral object is asserted.

Hypotheses. X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or
E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed
complexes as in DeligneWeightsAndPurity:DWP.8.

Construction and proof. (1) The weight filtration of EDC.7/mixed-perverse-weight-filtration and
Ext-vanishing reduce to F₀ pure simple-graded; on a smooth dense open, F₀ is a shifted pure
lisse sheaf and Deligne's semisimplicity theorem
(DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity-theorem-3-4-1-iii) makes it
geometrically semisimple. (2) Extensions across the boundary: for F pure, Ext¹ between the
intermediate extensions of its generic pieces vanishes geometrically (weights: the
Frobenius-invariant part of Ext¹ of pure objects of the same weight is controlled by
EDC.7/ext-vanishing-weights), giving F ≅ ⊕ j_!*(pieces) (BBD 5.3.8 and its proof via
5.3.6–5.3.7).

Acceptance. A pure lisse sheaf on a smooth curve: geometric semisimplicity is Deligne's
theorem. Non-example: F₀ = the unipotent rank-2 local system on 𝔾_m over 𝔽_q with nontrivial
geometric monodromy is mixed, not pure, and F is not semisimple.

Depends on: `mixed-perverse-weight-filtration`, `ext-vanishing-weights`, `ic-purity`,
`DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity-theorem-3-4-1-iii`,
`simple-perverse-sheaves`.

Source: BBD-1982, Théorème 5.3.8, p. 138.

### `pure-complex-decomposition` — Pure complexes decompose geometrically ★

Node `EtaleDualityAndPerverseSheaves:EDC.7/pure-complex-decomposition` (theorem); planet
“Decomposition theorem (finite fields)”.

Let K₀ ∈ D^b_m(X₀, ℚ̄_ℓ) be pure of weight w (X₀ separated of finite type over 𝔽_q). Then over
𝔽̄_q, K ≅ ⊕_i pH^i(K)[−i] (BBD 5.4.5), each pH^i(K₀) is pure of weight w + i, and each pH^i(K)
is semisimple (EDC.7/geometric-semisimplicity); hence K is a direct sum of shifted IC complexes
i_{V*}j_!*(L[dim V])[n] with L irreducible lisse on smooth V (BBD 5.4.6). The splitting is not
canonical and need not be compatible with the Weil structure of K₀.

Hypotheses. X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or
E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed
complexes as in DeligneWeightsAndPurity:DWP.8.

Construction and proof. (1) pH^i(K₀) pure of weight w + i
(EDC.7/weights-and-perverse-truncation (b)). (2) The connecting map of the truncation triangle
pτ_{<i}K → pτ_{≤i}K → pH^i(K)[−i] → is a class in Ext¹(pH^i(K)[−i], pτ_{<i}K); weights force
its image to vanish after base change to 𝔽̄_q (BBD 5.4.4 with 5.1.15), so each triangle splits
geometrically (BBD 5.4.5). (3) Combine with EDC.7/geometric-semisimplicity (BBD 5.4.6).

Acceptance. K₀ = ℚ̄_ℓ ⊕ ℚ̄_ℓ(−1)[−2] on Spec 𝔽_q (pure of weight 0): K = ℚ̄_ℓ ⊕ ℚ̄_ℓ[−2].
Non-example: K₀ = Rj_*ℚ̄_ℓ[1] for j : 𝔾_m → 𝔸¹ is perverse and mixed of weights 1 and 2; over
𝔽̄_q the sequence 0 → ℚ̄_ℓ[1] → Rj_*ℚ̄_ℓ[1] → i_{0*}ℚ̄_ℓ(−1) → 0 does not split
(Hom(i_{0*}ℚ̄_ℓ, Rj_*ℚ̄_ℓ[1]) = 0), so purity is needed.

Depends on: `weights-and-perverse-truncation`, `ext-vanishing-weights`,
`geometric-semisimplicity`.

Source: BBD-1982, Théorème 5.4.5, p. 142.

### `proper-direct-image-decomposition` — The decomposition theorem for proper maps over finite fields

Node `EtaleDualityAndPerverseSheaves:EDC.7/proper-direct-image-decomposition` (theorem).

Let f₀ : X₀ → Y₀ be a proper morphism of schemes separated of finite type over 𝔽_q and K₀ a
perverse sheaf on X₀ pure of weight w (e.g. K₀ = IC_{X₀}(L₀) with L₀ pure of weight w − dim
X₀). Then Rf₀_*K₀ is pure of weight w, and over 𝔽̄_q: Rf_*K ≅ ⊕_i pH^i(Rf_*K)[−i] with each
pH^i(Rf_*K) semisimple, a direct sum of i_{V*}IC_{V̅}(L) for irreducible lisse L on smooth
locally closed V ⊂ Y. In particular Rf_*IC_X(L) for X proper over 𝔽̄_q gives H^∗(X, IC_X(L))
pure. The finite-type proper models and resolutions over 𝔽̄_q used by GeometricSatakeAndFusion
GS3/GS4 are instances; no mod-ℓ or integral decomposition is asserted.

Hypotheses. X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or
E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed
complexes as in DeligneWeightsAndPurity:DWP.8. f₀ proper; K₀ pure perverse.

Construction and proof. (1) Rf₀_* = Rf₀_! preserves purity for f₀ proper
(DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6, Weil II 6.2.6). (2)
Apply EDC.7/pure-complex-decomposition to Rf₀_*K₀ and EDC.7/geometric-semisimplicity to its
perverse cohomology.

Acceptance. f = identity: the statement is EDC.7/geometric-semisimplicity. f : Bl_x S → S the
blow-up of a point of a smooth surface: Rf_*ℚ̄_ℓ[2] ≅ ℚ̄_ℓ[2] ⊕ i_{x*}ℚ̄_ℓ(−1). f : X → Spec
𝔽_q with X smooth proper: H^∗(X) pure (Weil II), and the decomposition is the grading by
degree.

Depends on: `pure-complex-decomposition`, `geometric-semisimplicity`, `ic-purity`,
`DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6`.

Source: BBD-1982, Théorème 5.4.5, p. 142; Zhu-2017, proof of Lemma 2.11, p. 26 (arXiv v3).

### `relative-hard-lefschetz` — Relative hard Lefschetz ★

Node `EtaleDualityAndPerverseSheaves:EDC.7/relative-hard-lefschetz` (theorem); planet “Relative
hard Lefschetz theorem”.

Let f₀ : X₀ → Y₀ be a projective morphism of schemes separated of finite type over 𝔽_q, η ∈
H²(X₀, ℚ̄_ℓ(1)) the first Chern class of an f₀-ample line bundle, and F₀ a perverse sheaf on X₀
pure of weight w. Then for every i ≥ 0, cup product with η^i induces isomorphisms η^i :
pH^{−i}(Rf₀_*F₀) ≅ pH^i(Rf₀_*F₀)(i), of pure perverse sheaves of weights w − i and w + i
respectively (the twist (i) records the weight shift) (BBD 5.4.10). A proper morphism has no
automatic ample class; the statement requires projectivity and a chosen relatively ample class.

Hypotheses. X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or
E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed
complexes as in DeligneWeightsAndPurity:DWP.8. f₀ projective with an f₀-ample line bundle; η
its Chern class (EDC.3/chern-classes in its adic form).

Construction and proof. (1) Local on Y₀: factor f₀ as X₀ ↪ P^d × Y₀ → Y₀ with η = c₁(O(1))
after replacing η by a multiple (BBD 5.4.10 proof). (2) Case i = 1 via a hyperplane section and
the weak Lefschetz-type exact sequences on the fibres (perverse Artin vanishing
EDC.5/affine-perverse-artin-vanishing for the affine complement), then induction on i (BBD
5.4.14–5.4.15). (3) The absolute hard Lefschetz theorem over a point
(DeligneWeightsAndPurity:DWP.9/hard-lefschetz-4-1-1 and its version for potentially pure
complexes DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13) is the input on fibres.

Acceptance. Y₀ = Spec 𝔽_q, F₀ = ℚ̄_ℓ[n] on X₀ smooth projective: the absolute hard Lefschetz
H^{n−i}(X) ≅ H^{n+i}(X)(i). f₀ : P¹ × Y₀ → Y₀, F₀ = ℚ̄_ℓ[dim Y₀ + 1]: pH^{−1} = ℚ̄_ℓ[dim Y₀],
pH^{1} = ℚ̄_ℓ(−1)[dim Y₀], η an isomorphism.

Depends on: `proper-direct-image-decomposition`, `affine-perverse-artin-vanishing`,
`DeligneWeightsAndPurity:DWP.9/hard-lefschetz-4-1-1`,
`DeligneWeightsAndPurity:DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13`,
`EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`, `adic-transport-of-duality-and-classes`.

Source: BBD-1982, Théorème 5.4.10, p. 144.

### `relative-primitive-decomposition` — Primitive decomposition of perverse direct images

Node `EtaleDualityAndPerverseSheaves:EDC.7/relative-primitive-decomposition` (theorem).

In the situation of EDC.7/relative-hard-lefschetz, for i ≥ 0 let P^{−i} := ker(η^{i+1} :
pH^{−i}(Rf₀_*F₀) → pH^{i+2}(Rf₀_*F₀)(i+1)). Then pH^{−i}(Rf₀_*F₀) = ⊕_{a ≥ 0} η^a P^{−i−2a}(−a)
and, over 𝔽̄_q, Rf_*F ≅ ⊕_{i} ⊕_{a=0}^{i} η^a P^{−i}(−a)[i − 2a] (non-canonically, by
EDC.7/pure-complex-decomposition); in particular dim of stalks satisfies the hard Lefschetz
symmetry.

Hypotheses. X₀ separated of finite type over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, coefficients ℚ̄_ℓ (or
E/ℚ_ℓ finite) with a fixed isomorphism ι : ℚ̄_ℓ ≅ ℂ; weights are ι-weights (Weil II 1.2), mixed
complexes as in DeligneWeightsAndPurity:DWP.8. As in EDC.7/relative-hard-lefschetz.

Construction and proof. (1) Linear algebra of a graded object with a degree-2 operator
satisfying hard Lefschetz in the abelian category of perverse sheaves (the argument of
DeligneWeightsAndPurity:DWP.9/lefschetz-decomposition-of-a-graded-operator applied in
Perv(Y₀)). (2) Combine with EDC.7/pure-complex-decomposition for the derived statement.

Acceptance. Y₀ = point: the classical primitive decomposition of H^∗ of a smooth projective
variety.

Depends on: `relative-hard-lefschetz`, `pure-complex-decomposition`,
`DeligneWeightsAndPurity:DWP.9/lefschetz-decomposition-of-a-graded-operator`.

Source: BBD-1982, Théorème 5.4.10, p. 144.

### `spreading-out-to-finite-fields` — From ℂ to finite fields: spreading out constructible complexes

Node `EtaleDualityAndPerverseSheaves:EDC.7/spreading-out-to-finite-fields` (theorem).

Let X be separated of finite type over ℂ and K ∈ D^b_c(X^an, ℚ) (or ℚ̄_ℓ via
EDC.6/complex-analytic-comparison) algebraically constructible of 'geometric origin' (obtained
from constant sheaves by the six operations, perverse truncations and taking subquotients of
perverse sheaves). Then there exist a finitely generated ℤ-subalgebra A ⊂ ℂ, a model X_A over S
= Spec A, a stratification of X_A over which K spreads out to K_A ∈ D^b_c(X_A, ℚ̄_ℓ)
universally locally acyclic over a dense open of S, such that for every closed point s ∈ S with
residue field 𝔽_q, the restriction K_s̄ to X_s̄ corresponds to K under specialization
isomorphisms compatible with the six operations and the perverse t-structure, and K_s is mixed
(pure if K is pure of geometric origin) (BBD 6.1.2–6.1.10). Not every complex sheaf has an
arithmetic model with pure coefficients; the statement is restricted to geometric origin.

Hypotheses. X separated of finite type over ℂ; complexes of geometric origin; ℓ fixed.

Construction and proof. (1) Spread out X, a stratification adapted to K, and K itself over a
finitely generated A (limit arguments; Mathlib spreads out smooth algebras — requested
scheme-theoretic spreading of constructible sheaves from SchemeAndStackFoundations:SF.2). (2)
Generic constancy: after shrinking S, the formation of the six operations commutes with base
change to the fibres (generic base change, imported through SchemeAndStackFoundations:SF.2),
and the comparison over ℂ is EDC.6/complex-analytic-comparison. (3) Geometric origin ⇒ the
specialization is mixed (BBD 6.2.4).

Acceptance. K = ℚ_X for X smooth projective over ℂ: K_s is pure for almost all s (Weil II), and
H^∗(X^an, ℚ) ⊗ ℚ_ℓ ≅ H^∗(X_s̄, ℚ_ℓ).

Depends on: `complex-analytic-comparison`, `adic-transport-of-duality-and-classes`,
`SchemeAndStackFoundations:SF.2`, `DeligneWeightsAndPurity:DWP.8/mixed-complexes`.

Source: BBD-1982, 6.1.10, p. 158.

### `characteristic-zero-decomposition` — The decomposition theorem over the complex numbers ★

Node `EtaleDualityAndPerverseSheaves:EDC.7/characteristic-zero-decomposition` (theorem); planet
“Decomposition theorem over ℂ”.

Let f : X → Y be a proper morphism of separated schemes of finite type over ℂ and K a
semisimple perverse sheaf of geometric origin on X (e.g. IC_X(L) with L a local system of
geometric origin, or ℚ_X[d] for X smooth of pure dimension d). Then Rf_*K ≅ ⊕_i pH^i(Rf_*K)[−i]
in D^b_c(Y^an, ℚ̄_ℓ) (equivalently with ℚ or ℂ coefficients, by
EDC.6/complex-analytic-comparison), each pH^i(Rf_*K) is semisimple of geometric origin, and for
f projective with relatively ample class η, η^i : pH^{−i}(Rf_*K) ≅ pH^i(Rf_*K) (BBD 6.2.5,
6.2.10).

Hypotheses. f proper over ℂ; K semisimple perverse of geometric origin (BBD 6.2.4); relative
hard Lefschetz needs f projective with η.

Construction and proof. (1) Spread out (EDC.7/spreading-out-to-finite-fields) f, K and a choice
of pure structure: each simple constituent of geometric origin is pure after specialization
(BBD 6.2.4). (2) Apply EDC.7/proper-direct-image-decomposition and
EDC.7/relative-hard-lefschetz over 𝔽̄_q and transport back by specialization and
EDC.6/complex-analytic-comparison (BBD 6.2.5).

Acceptance. f : X̃ → X a resolution of a surface with an isolated singularity: Rf_*ℚ[2] ≅ IC_X
⊕ (skyscraper of rank the number of exceptional curves). X smooth projective → point: H^∗(X, ℚ)
splits by degree and satisfies hard Lefschetz.

Depends on: `spreading-out-to-finite-fields`, `proper-direct-image-decomposition`,
`relative-hard-lefschetz`, `complex-analytic-comparison`.

Source: BBD-1982, Théorème 6.2.5, p. 163.

## EDC.8 — Correspondences and the functional-equation interface

Cohomological correspondences in the convention of Lu–Zheng and Yun–Zhang (u : ←c^*L → →c^!M),
their proper pushforward, restriction to invariant subschemes and composition, the trace class
on the fixed-point scheme and the Lefschetz–Verdier formula (Varshavsky), and Varshavsky's
agreement of true and naive local terms for automorphisms of finite prime-to-p order. Ordinary
Frobenius point counting stays with CohomologicalPointCounting TraceFormula and the
contracting-boundary theorem with EndoscopicTransferAndUnitaryTraceComparison:ET.5. Finally the
linear algebra of pairing similitudes and the reciprocity of Frobenius characteristic
polynomials, with the middle-degree determinant computed rather than assumed, are exported to
WeilConjectures WC.2 and WC.6.

### `cohomological-correspondence` — Cohomological correspondences ★

Node `EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence` (definition); planet
“Cohomological correspondence”; module `TauCeti/AlgebraicGeometry/Etale/Correspondence/Basic`.

Let X, Y be separated schemes of finite type over k. A correspondence from X to Y is a
separated finite-type k-scheme C with morphisms ←c : C → X and →c : C → Y. For L ∈ D(X, Λ) and
M ∈ D(Y, Λ), a cohomological correspondence from (X, L) to (Y, M) supported on C is a morphism
u : ←c^*L → →c^!M in D(C, Λ); equivalently (adjunction →c_! ⊣ →c^!) a morphism →c_!←c^*L → M. A
morphism of correspondences p : C → D over X × Y with p proper induces p_* : Hom(←c^*L, →c^!M)
→ Hom(←d^*L, →d^!M). The atlas convention follows Lu–Zheng and Yun–Zhang (pull back along the
left leg, upper shriek along the right leg); the stage text writes c₂^*K → c₁^!K for the same
notion with the legs named in the opposite order, and Varshavsky writes the adjoint form
c_{2!}c_1^*F_1 → F_2.

Hypotheses. k a field (separably closed for traces and local terms), Λ a torsion noetherian
ring killed by an integer invertible in k (or O_E, E by passage to the limit,
EDC.6/adic-transport-of-duality-and-classes); all schemes separated of finite type over k.

Construction and proof. (1) Data: C with ←c, →c and u; f^* and f^! from EDC.0 and
EDC.1:adjoint/exceptional-inverse-image; the adjoint form by
EDC.1:adjoint/sheafified-adjunction (Rf_! ⊣ f^!). (2) Morphisms of correspondences: for p
proper, u ↦ (←d^*L → p_*p^*←d^*L = p_*←c^*L →p_*u p_*→c^!M = p_!p^!→d^!M → →d^!M) (Lu–Zheng
2.6, using p_! ≅ p_*).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.CohCorr` | constructor | A cohomological correspondence from (X, L) to (Y, M): C with ←c, →c separated of finite type and u : ←c^*L ⟶ →c^!M. |
| `TauCeti.EtaleDuality.CohCorr.ofAdjoint` | equivalence | Cohomological correspondences supported on C are in bijection with morphisms →c_!←c^*L ⟶ M. |
| `TauCeti.EtaleDuality.CohCorr.id` | constructor | The identity correspondence of (X, L): C = X, ←c = →c = id, u = id. |
| `TauCeti.EtaleDuality.CohCorr.ofMorphism` | constructor | For f : X → Y and φ : f^*M ⟶ L on X, the correspondence from (Y, M) to (X, L) supported on C = X with legs ←c = f, →c = id and u = φ (graph correspondence). |
| `TauCeti.EtaleDuality.CohCorr.properMap` | functoriality | A proper morphism p : C → D of correspondences over X × Y induces p_* : Hom(←c^*L, →c^!M) → Hom(←d^*L, →d^!M). |
| `TauCeti.EtaleDuality.CohCorr.properMap_comp` | functoriality | (q ∘ p)_* = q_* ∘ p_* and id_* = id. |

Used by. EndoscopicTransferAndUnitaryTraceComparison:ET.5: Frobenius-twisted Hecke
correspondences on Igusa varieties with contracting boundary (Fujiwara's theorem). Yun–Zhang I,
Appendix A.4 (YUN-ZHANG-17/35): Hecke correspondences on shtukas act on cohomology through
cohomological correspondences.
ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic: Hecke and excursion actions
on the cohomology of moduli of shtukas. Hansen–Kaletha–Weinstein, §5.6
(PAPER-HANSEN-KALETHA-WEINSTEIN-22/090): local terms of finite-order automorphisms.

Unit tests:

- `TauCeti.EtaleDuality.cohCorr_id_ofAdjoint` (computation): Under CohCorr.ofAdjoint the
  identity correspondence of (X, L) corresponds to id_L.
- `TauCeti.EtaleDuality.cohCorr_empty` (degenerate): If C = ∅ the only cohomological
  correspondence supported on C is 0.
- `TauCeti.EtaleDuality.cohCorr_point` (compatibility): For X = Y = C = Spec Ω (Ω separably
  closed), cohomological correspondences from L to M are morphisms of complexes of Λ-modules L
  ⟶ M.
- `TauCeti.EtaleDuality.not_cohCorr_pullback_pullback` (non-example): A morphism ←c^*L ⟶ →c^*M
  is not a cohomological correspondence when →c is not étale: for →c : 𝔸¹ → Spec Ω, →c^!Λ =
  Λ(1)[2] ≠ →c^*Λ, and the trace formalism needs the ! form.

Acceptance. The graph of a morphism f : X → Y with u : f^*M → f^*M = Γ^!… gives the
correspondence of f^*; the identity correspondence C = X with u = id.

Depends on: `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`,
`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction`,
`EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`.

Source: Lu-Zheng-2022, §2.2, Construction 2.6, p. 13 (arXiv v4); Varshavsky-LV-2007, Definition
1.1.4 and Remark 1.1.5, p. 7 (arXiv v2).

### `correspondence-pushforward` — Proper pushforward of cohomological correspondences

Node `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-pushforward` (construction); module
`TauCeti/AlgebraicGeometry/Etale/Correspondence/Pushforward`.

Given a correspondence C → X × Y and a commutative diagram of correspondences (f : X → S, h : C
→ B, g : Y → T, with B → S × T) such that one of: (i) the square C → B, X → S on the left is
cartesian, (ii) f and the induced C → X ×_S B are proper, (iii) ←c and ←b are proper — there is
a base change map ←b^*f_! → h_!←c^* and hence a pushforward h_! : Hom(←c^*L, →c^!M) →
Hom(←b^*f_!L, →b^!g_!M) (Varshavsky 1.1.6). For S = B = T and the identity correspondence on S,
a self-correspondence u of L induces an endomorphism f_!(u) of f_!L; for f proper (X proper
over k, S = Spec k) this is the action RΓ(u) on RΓ(X, L). Pushforwards are compatible with
composition of maps of correspondences.

Hypotheses. k a field (separably closed for traces and local terms), Λ a torsion noetherian
ring killed by an integer invertible in k (or O_E, E by passage to the limit,
EDC.6/adic-transport-of-duality-and-classes); all schemes separated of finite type over k.

Construction and proof. (1) The base change map in the three cases (Varshavsky 1.1.6 (a)):
proper base change for (i)–(ii) (imported through SchemeAndStackFoundations:SF.2 for Rf_!), and
for (iii) the map adjoint to f_! → f_!c_*c^*. (2) u ↦ the composite ←b^*f_!L → h_!←c^*L →h_!(u)
h_!→c^!M → →b^!g_!M, the last map adjoint to →b_!h_!→c^! = g_!→c_!→c^! → g_!. (3) Compatibility
with composition of maps of correspondences: Varshavsky 1.1.6 (b).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.CohCorr.pushforward` | constructor | h_! : Hom(←c^*L, →c^!M) → Hom(←b^*f_!L, →b^!g_!M) under any of the conditions (i)–(iii). |
| `TauCeti.EtaleDuality.CohCorr.pushforward_comp` | functoriality | Pushforward along a composite of maps of correspondences is the composite of pushforwards. |
| `TauCeti.EtaleDuality.CohCorr.pushforward_id` | functoriality | Pushforward along the identity map of correspondences is the identity. |
| `TauCeti.EtaleDuality.CohCorr.actionOnCompactCohomology` | data | For a self-correspondence u of L on X, RΓ_c(u) : RΓ_c(X, L) → RΓ_c(X, L), defined when ←c is proper. |
| `TauCeti.EtaleDuality.CohCorr.actionOnCompactCohomology_id` | simp | RΓ_c(id_L) = id. |

Used by. Varshavsky, Proposition 1.2.5: the Lefschetz–Verdier formula is the commutation of
traces with proper pushforward. EtaleDualityAndPerverseSheaves:EDC.8/lefschetz-verdier-formula:
the action of u on RΓ_c is its pushforward to a point. Yun–Zhang I, (A.24): h_!ζ : f_!F → g_!G
for a map of correspondences.

Unit tests:

- `TauCeti.EtaleDuality.pushforward_identity_correspondence` (degenerate): Pushing the identity
  correspondence of (X, L) forward along f : X → Spec k proper gives the identity of RΓ(X, L).
- `TauCeti.EtaleDuality.pushforward_graph_frobenius` (computation): For X₀ over 𝔽_q, the graph
  of Frobenius with its canonical u acts on RΓ_c(X, Λ) by the geometric Frobenius
  (compatibility with TraceFormula's convention).
- `TauCeti.EtaleDuality.pushforward_closed_immersion` (compatibility): For f a closed immersion
  and C = X, the pushforward of u is f_*(u) under f_! = f_*.
- `TauCeti.EtaleDuality.not_pushforward_nonproper` (non-example): Without (i)–(iii) no base
  change map ←b^*f_! → h_!←c^* is available: for ←c : 𝔸¹ → 𝔸¹ ⨿ 𝔸¹ … the action on RΓ_c is not
  defined when ←c is not proper (e.g. ←c an open immersion 𝔾_m → 𝔸¹ on X = 𝔸¹).

Acceptance. For C = X = Y, u = id_L and f : X → Spec k proper, f_!(u) = id on RΓ(X, L).

Depends on: `cohomological-correspondence`, `SchemeAndStackFoundations:SF.2`,
`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`.

Source: Varshavsky-LV-2007, 1.1.6(a), p. 7 (arXiv v2).

### `correspondence-restriction` — Restriction of cohomological correspondences to invariant subschemes

Node `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-restriction` (construction); module
`TauCeti/AlgebraicGeometry/Etale/Correspondence/Restriction`.

Let u be a cohomological self-correspondence of L ∈ D(X, Λ) supported on c : C → X × X. A
closed subscheme Z ⊂ X is c-invariant if ←c(→c^{−1}(Z)) ⊂ Z set-theoretically, i.e. →c^{−1}(Z)
⊂ ←c^{−1}(Z); an open U ⊂ X is c-invariant in the dual sense ←c^{−1}(U) ⊂ →c^{−1}(U) (the
complement of an invariant closed subscheme). Then u restricts to a self-correspondence u|_Z of
L|_Z supported on c|_Z : C_Z := →c^{−1}(Z)_red → Z × Z, and for Z closed invariant with open
complement U (then U is invariant for the transposed condition) the localization triangle
j_!(L|_U) → L → i_*(L|_Z) → is compatible with the restricted correspondences; consequently,
when ←c is proper, Tr(RΓ_c(u)) = Tr(RΓ_c(u|_U)) + Tr(RΓ_c(u|_Z)) for Λ a field (additivity of
traces).

Hypotheses. k a field (separably closed for traces and local terms), Λ a torsion noetherian
ring killed by an integer invertible in k (or O_E, E by passage to the limit,
EDC.6/adic-transport-of-duality-and-classes); all schemes separated of finite type over k.

Construction and proof. (1) Restriction: the base change maps of Varshavsky 1.1.9 for the
closed embedding Z → X and the inclusion C_Z → C (the invariance makes ←c map →c^{−1}(Z) into
Z, so the restriction is defined) (Varshavsky 1.1.9, 1.5.1, 1.5.6). (2) Compatibility with the
localization triangle: functoriality of the restrictions in the triangle; additivity of traces
of endomorphisms of triangles of perfect complexes over a field.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.CohCorr.IsInvariantClosed` | constructor | Z ⊂ X closed is c-invariant: →c^{−1}(Z) ⊆ ←c^{−1}(Z) set-theoretically (equivalently ←c(→c^{−1}(Z)) ⊆ Z). |
| `TauCeti.EtaleDuality.CohCorr.restrictClosed` | constructor | For Z closed c-invariant, the restricted correspondence u∣_Z on (Z, L∣_Z). |
| `TauCeti.EtaleDuality.CohCorr.restrictOpen` | constructor | For U open with ←c^{−1}(U) ⊆ →c^{−1}(U), the restricted correspondence u∣_U on (U, L∣_U). |
| `TauCeti.EtaleDuality.CohCorr.trace_additive` | relation | For Z closed invariant with complement U, ←c proper and Λ a field: Tr(RΓ_c(u)) = Tr(RΓ_c(u∣_U)) + Tr(RΓ_c(u∣_Z)). |

Used by. Varshavsky, §1.5 and §2: locally invariant subschemes and the reduction of local terms
to neighbourhoods of fixed points. EndoscopicTransferAndUnitaryTraceComparison:ET.5: the
contracting boundary is an invariant closed subscheme whose contribution is isolated.

Unit tests:

- `TauCeti.EtaleDuality.restrictClosed_self` (degenerate): Z = X is invariant and u|_X = u.
- `TauCeti.EtaleDuality.restrictClosed_empty` (degenerate): Z = ∅ is invariant and u|_∅ = 0.
- `TauCeti.EtaleDuality.restrictClosed_fixedPoint` (computation): For C = 𝔸¹ with ←c = id and
  →c(z) = z² and Z = {0} (invariant: →c^{−1}(0)_red = {0}), u|_Z is the induced endomorphism of
  the stalk L_0.
- `TauCeti.EtaleDuality.not_invariant_translation` (non-example): For C = 𝔸¹ with ←c = id and
  →c(z) = z + 1 over a field of characteristic 0, Z = {0} is not invariant (→c^{−1}(0) = {−1})
  and no restriction is defined.

Acceptance. X = 𝔸¹, C = graph of z ↦ z², Z = {0} is invariant; u|_Z is the identity of L_0.

Depends on: `cohomological-correspondence`, `correspondence-pushforward`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`.

Source: Varshavsky-LV-2007, Definition 1.5.1(a), p. 14 (arXiv v2).

### `correspondence-composition` — Composition of cohomological correspondences

Node `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-composition` (construction); module
`TauCeti/AlgebraicGeometry/Etale/Correspondence/Composition`.

Given cohomological correspondences (c, u) from (X, L) to (Y, M) and (d, v) from (Y, M) to (Z,
N), their composite (e, w) is supported on C ×_Y D with legs ←c ∘ ←d′ and →d ∘ →c′ (←d′ : C ×_Y
D → C, →c′ : C ×_Y D → D) and w is the composite ←d′^*←c^*L →u ←d′^*→c^!M →α →c′^!←d^*M →v
→c′^!→d^!N, where α is adjoint to the base change isomorphism →c′_!←d′^* ≅ ←d^*→c_! (proper
base change for Rf_!). In this setting (schemes separated of finite type over k) the base
change isomorphism always exists, so the composite is always defined; composition is
associative up to the canonical isomorphisms of fibre products, unital for the identity
correspondences, and compatible with proper maps of correspondences; it makes (X, L) with
cohomological correspondences into a 2-category with symmetric monoidal structure (X, L) ⊗ (X′,
L′) = (X × X′, L ⊠ L′) (Lu–Zheng, Construction 2.6). Pushforward to Spec k is functorial: for
←c, ←d proper, RΓ_c of the composite is the composite of the RΓ_c's.

Hypotheses. k a field (separably closed for traces and local terms), Λ a torsion noetherian
ring killed by an integer invertible in k (or O_E, E by passage to the limit,
EDC.6/adic-transport-of-duality-and-classes); all schemes separated of finite type over k.

Construction and proof. (1) Composite as in Lu–Zheng Construction 2.6, using the proper base
change isomorphism for Rf_! (requested through SchemeAndStackFoundations:SF.2) and the exchange
map of EDC.1:adjoint/base-change-exchange-maps. (2) Associativity and units: coherence of base
change isomorphisms (pseudofunctoriality of f^*, f_!, f^!;
EDC.1:adjoint/upper-shriek-pseudofunctor). (3) Functoriality of RΓ_c: the pushforward to a
point of a composite equals the composite of pushforwards (base change compatibility).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.CohCorr.comp` | constructor | The composite (e, w) supported on C ×_Y D. |
| `TauCeti.EtaleDuality.CohCorr.comp_id` | simp | Composition with the identity correspondence is the identity up to the canonical isomorphism C ×_Y Y ≅ C. |
| `TauCeti.EtaleDuality.CohCorr.comp_assoc` | relation | (w ∘ v) ∘ u ≅ w ∘ (v ∘ u) via the canonical isomorphism of iterated fibre products. |
| `TauCeti.EtaleDuality.CohCorr.actionOnCompactCohomology_comp` | functoriality | RΓ_c(v ∘ u) = RΓ_c(v) ∘ RΓ_c(u) when the left legs are proper. |
| `TauCeti.EtaleDuality.CohCorr.externalProduct` | structure | (c, u) ⊠ (c′, u′) from (X × X′, L ⊠ L′) to (Y × Y′, M ⊠ M′). |

Used by. Lu–Zheng, §2: the symmetric monoidal 2-category of cohomological correspondences whose
categorical traces are the Lefschetz–Verdier traces. Yun–Zhang I, §5: composition of Hecke
correspondences on moduli of shtukas. EndoscopicTransferAndUnitaryTraceComparison:ET.5:
Frobenius composed with Hecke correspondences.

Unit tests:

- `TauCeti.EtaleDuality.comp_graphs` (computation): For graph correspondences of morphisms f :
  X → Y and g : Y → Z with the canonical u, the composite is the graph of g ∘ f.
- `TauCeti.EtaleDuality.comp_empty` (degenerate): If C = ∅ then the composite is supported on ∅
  and is 0.
- `TauCeti.EtaleDuality.comp_point` (compatibility): Over X = Y = Z = C = D = Spec Ω,
  composition is composition of morphisms of complexes of Λ-modules.
- `TauCeti.EtaleDuality.not_comp_support_product` (non-example): The support of the composite
  is the fibre product C ×_Y D, not C × D: for C = D = Δ_X the composite is supported on X, not
  X × X.

Acceptance. Composing with the identity correspondence returns the original correspondence.

Depends on: `cohomological-correspondence`, `correspondence-pushforward`,
`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`,
`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/upper-shriek-pseudofunctor`,
`SchemeAndStackFoundations:SF.2`.

Source: Lu-Zheng-2022, §2.2, Construction 2.6, p. 13 (arXiv v4).

### `correspondence-trace` — The trace of a cohomological self-correspondence ★

Node `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-trace` (construction); planet “Trace
of a cohomological correspondence”; module
`TauCeti/AlgebraicGeometry/Etale/Correspondence/Trace`.

Let k be separably closed, c : C → X × X a self-correspondence, Fix(c) := C ×_{X×X} Δ_X the
fixed-point scheme with Δ′ : Fix(c) → C, and L ∈ D_ctf(X, Λ) (or D^b_c with Λ a field). The
trace map Tr_c : Hom(←c^*L, →c^!L) → H⁰(Fix(c), K_{Fix(c)}) is the composite of the
identification Hom(←c^*L, →c^!L) ≅ H⁰(C, →c^!(L ⊠ D_X L) restricted …) — precisely: Hom(←c^*L,
→c^!L) ≅ H⁰(C, c^!(D_X L ⊠ L)) (Künneth and biduality), the restriction to Fix(c) via Δ′^* and
the evaluation pairing Δ^*(D_X L ⊠ L) = D_X L ⊗ L → K_X, giving H⁰(Fix(c), Δ′^*c^!(D_X L ⊠ L))
→ H⁰(Fix(c), K_{Fix(c)}) (Varshavsky 1.2.2, (1.2)–(1.4)). For β ⊂ Fix(c) open and closed and
proper over k, the local term is LT_β(u) := ∫_β Tr_c(u)|_β ∈ Λ (trace H⁰(β, K_β) → Λ for β
proper). The trace map is compatible with restriction to open subschemes of C and is linear in
u.

Hypotheses. k a field (separably closed for traces and local terms), Λ a torsion noetherian
ring killed by an integer invertible in k (or O_E, E by passage to the limit,
EDC.6/adic-transport-of-duality-and-classes); all schemes separated of finite type over k. L of
finite Tor-dimension (or Λ a field) so that biduality and Künneth hold (EDC.1:biduality).

Construction and proof. (1) Künneth for D(X × X): Hom(←c^*L, →c^!L) ≅ H⁰(C, c^!(D_X L ⊠ L))
(Varshavsky 1.2.1–1.2.2; the formula RHom(pr₁^*L, pr₂^!L) ≅ D_X L ⊠ L uses
EDC.1:biduality/constructible-biduality and the Künneth formula for f^!,
EDC.1:biduality/duality-exchange-isomorphisms). (2) Evaluation: D_X L ⊗ L → K_X
(EDC.1:adjoint/verdier-dual) and base change Δ′^*c^! → Δ_{Fix}^!… along the cartesian square
defining Fix(c) (EDC.1:adjoint/base-change-exchange-maps). (3) Local terms by the trace H⁰(β,
K_β) → Λ for β proper over k (EDC.1:biduality/relative-and-geometric-duality).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.CohCorr.fixedLocus` | constructor | Fix(c) := C ×_{X × X} X, with its map to C. |
| `TauCeti.EtaleDuality.CohCorr.trace` | constructor | Tr_c : Hom(←c^*L, →c^!L) → H⁰(Fix(c), K_{Fix(c)}), Λ-linear. |
| `TauCeti.EtaleDuality.CohCorr.localTerm` | constructor | LT_β(u) := ∫_β Tr_c(u)∣_β for β ⊂ Fix(c) open, closed and proper over k. |
| `TauCeti.EtaleDuality.CohCorr.trace_add` | simp | Tr_c(u + u′) = Tr_c(u) + Tr_c(u′). |
| `TauCeti.EtaleDuality.CohCorr.trace_restrictOpen` | compatibility | For C′ ⊂ C open, Tr_{c∣C′}(u∣_{C′}) = Tr_c(u)∣_{Fix(c) ∩ C′}. |
| `TauCeti.EtaleDuality.CohCorr.localTerm_sum` | relation | If Fix(c) is proper, Σ_{β ∈ π₀(Fix(c))} LT_β(u) = ∫_{Fix(c)} Tr_c(u). |

Used by. Varshavsky, Proposition 1.2.5 and Corollary 1.2.6: trace maps commute with proper
pushforward, giving the Lefschetz–Verdier formula. Hansen–Kaletha–Weinstein, Proposition 5.6.2:
local terms loc_x(g, A) of finite-order automorphisms. Yun–Zhang I, A.4.2: the trace τ_C(ζ) ∈
H₀^{BM}(Fix(C)) of a self-correspondence of shtukas.

Unit tests:

- `TauCeti.EtaleDuality.trace_identity_euler` (computation): For the identity correspondence of
  (X, Λ) with X proper over k separably closed, ∫_X Tr(id) = χ(X, Λ) = Σ(−1)^i rank H^i(X, Λ).
- `TauCeti.EtaleDuality.trace_empty_fixedLocus` (degenerate): If Fix(c) = ∅ then Tr_c = 0.
- `TauCeti.EtaleDuality.localTerm_isolated_identity` (computation): For X = C = Spec Ω and u ∈
  End(L), LT(u) = Tr(u | L) (alternating trace on the perfect complex L).
- `TauCeti.EtaleDuality.not_trace_naive_nonisolated` (non-example): For a non-isolated fixed
  component (e.g. c = Δ on X = P¹), the local term is the Euler characteristic 2, not a sum of
  naive stalk traces at points.

Acceptance. For c = Δ_X (the identity correspondence) and X proper, Fix(c) = X and ∫_X Tr(id_L)
= χ(RΓ(X, L)).

Depends on: `cohomological-correspondence`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`,
`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`,
`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality`.

Source: Varshavsky-LV-2007, 1.2.2(b), formula (1.4), p. 9 (arXiv v2).

### `lefschetz-verdier-formula` — The Lefschetz–Verdier trace formula ★

Node `EtaleDualityAndPerverseSheaves:EDC.8/lefschetz-verdier-formula` (theorem); planet
“Lefschetz–Verdier trace formula”.

Let k be separably closed and f : X → S, h : C → B, g : X → S a map from a self-correspondence
c of X to a self-correspondence b of S satisfying the hypotheses of
EDC.8/correspondence-pushforward with f proper, and let h_Fix : Fix(c) → Fix(b) be the induced
proper map. Then for L ∈ D_ctf(X, Λ) and u ∈ Hom(←c^*L, →c^!L), Tr_b(f_!(u)) =
h_{Fix!}(Tr_c(u)) in H⁰(Fix(b), K_{Fix(b)}) (Varshavsky 1.2.5). In particular, for X proper
over k, S = B = Spec k and ←c proper: Tr(RΓ(u) | RΓ(X, L)) = Σ_{β ∈ π₀(Fix(c))} LT_β(u) (SGA 5
III 4.7, Varshavsky 1.2.6). Ordinary Frobenius point counting (the Grothendieck–Lefschetz trace
formula) remains CohomologicalPointCounting TraceFormula's theorem, and the
contracting-boundary (Fujiwara) version with isolation and large-power hypotheses is
EndoscopicTransferAndUnitaryTraceComparison:ET.5's; an arbitrary fixed-point scheme gives no
numerical formula without properness of the components β.

Hypotheses. k a field (separably closed for traces and local terms), Λ a torsion noetherian
ring killed by an integer invertible in k (or O_E, E by passage to the limit,
EDC.6/adic-transport-of-duality-and-classes); all schemes separated of finite type over k. f
proper (for the global formula X proper over k); L ∈ D_ctf(X, Λ).

Construction and proof. (1) Commutation of trace maps with proper pushforward (Varshavsky
1.2.5): reduce to the compatibility of the evaluation map with f_! and the Künneth formula (SGA
5 III 4.4). (2) Global formula: apply to f : X → Spec k; Tr_b of an endomorphism of a perfect
complex over Spec k is its trace, and h_{Fix!} sums the local terms of the components of the
proper Fix(c) (Varshavsky 1.2.6).

Acceptance. Identity correspondence on X proper: Tr(id | RΓ(X, Λ)) = χ(X) = ∫_X Tr(id). X = P¹
over k = 𝔽̄_q, c the graph of z ↦ z^q: Fix(c) = P¹(𝔽_q) is finite étale, each local term is 1,
and Tr(F^* | H^∗(P¹)) = 1 + q = #P¹(𝔽_q). Non-proper X = 𝔸¹ with c = graph of z ↦ z + 1 in
characteristic p (no fixed points): Tr(RΓ_c(u)) = Tr on H²_c = 1 ≠ 0 = Σ LT, so properness (or
Fujiwara's hypotheses) is needed.

Depends on: `correspondence-trace`, `correspondence-pushforward`, `correspondence-restriction`,
`EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality`.

Source: Varshavsky-LV-2007, Corollary 1.2.6, p. 10 (arXiv v2).

### `local-terms-finite-order` — True and naive local terms agree for automorphisms of finite prime-to-p order

Node `EtaleDualityAndPerverseSheaves:EDC.8/local-terms-finite-order` (theorem).

Let X be of finite type over an algebraically closed field k of characteristic p, g an
automorphism of X of finite order prime to p, A ∈ D^b_c(X, Λ) (Λ = ℤ/ℓ^n, ℤ_ℓ or ℚ_ℓ) with u :
g^*A → A, and x an isolated fixed point of g. Then the local term of the cohomological
correspondence (graph of g, u) at x equals the naive local term: LT_x(u) = Tr(u_x | A_x)
(Varshavsky, Local terms, Theorem 4.10(b) and Corollary 5.4(b)). Consequently, for X proper,
Tr(g | RΓ(X, A)) = Σ_{x ∈ X^g} Tr(u_x | A_x) when X^g is finite. The extension to perfect
schemes (Hansen–Kaletha–Weinstein, Proposition 5.6.2) is transported in the Part II of
EtaleDualityAndPerverseSheaves on perfect schemes.

Hypotheses. X of finite type over k = k̄ of characteristic p; g of finite order prime to p; x
an isolated fixed point.

Construction and proof. (1) The graph of a finite prime-to-p order automorphism is 'contracting
near fixed points in the tame sense': Varshavsky reduces, by a g-equivariant étale
neighbourhood and the decomposition of the tangent action, to the case where the local term can
be computed by restriction to the invariant subscheme {x} (EDC.8/correspondence-restriction)
(Varshavsky, Local terms, 4.10(b), 5.4(b)). (2) The global statement follows from
EDC.8/lefschetz-verdier-formula.

Acceptance. g = identity on X = Spec k: LT = Tr(u | A). g : z ↦ −z on P¹ (p ≠ 2), A = Λ with u
= id: fixed points 0, ∞, each local term 1, total 2 = Tr(g^* | H⁰ ⊕ H²).

Depends on: `lefschetz-verdier-formula`, `correspondence-restriction`, `correspondence-trace`.

Source: Varshavsky-LocalTerms-2020, Theorem 4.10(b), p. 10 (arXiv v3);
Hansen-Kaletha-Weinstein-2022, Proposition 5.6.2, p. 61 (arXiv v4).

### `similitude-reciprocal-charpoly` — Characteristic polynomials of a pairing similitude are reciprocal

Node `EtaleDualityAndPerverseSheaves:EDC.8/similitude-reciprocal-charpoly` (theorem).

Let F be a field, V and W finite-dimensional F-vector spaces of dimension b, ⟨·,·⟩ : V × W → F
a perfect pairing, c ∈ F^× and φ ∈ GL(V), ψ ∈ GL(W) with ⟨φv, ψw⟩ = c⟨v, w⟩ for all v, w. Then
ψ = c·(φ^∨)^{−1} under W ≅ V^∨, and det(1 − tψ | W) = (−ct)^b det(φ)^{−1} det(1 − (ct)^{−1}φ |
V) in F[t]; equivalently det(ψ) = c^b det(φ)^{−1} and the eigenvalues of ψ are c/α for α the
eigenvalues of φ, with algebraic multiplicities (over an algebraic closure). No semisimplicity
of φ is assumed.

Hypotheses. F any field; perfect pairing; φ, ψ invertible with similitude factor c.

Construction and proof. (1) ψ is the adjoint of c·φ^{−1}: ⟨v, ψw⟩ = c⟨φ^{−1}v, w⟩, so in dual
bases the matrix of ψ is c (Φ^{−1})^T. (2) det(1 − tcΦ^{−T}) = det(Φ^{−1}) det(Φ − ct) =
det(Φ)^{−1}(−ct)^b det(1 − (ct)^{−1}Φ); charpoly of a transpose is unchanged
(mathlib:Matrix.charpoly_transpose) and det of the dual map is unchanged
(mathlib:LinearMap.det_dualMap).

Acceptance. b = 1: ψ = c/φ. φ = id, c = q: ψ = q·id and det(1 − tψ) = (1 − qt)^b. Non-example:
without perfectness (a degenerate pairing) the eigenvalues of ψ are unconstrained.

Depends on: `mathlib:Matrix.charpoly_transpose`, `mathlib:LinearMap.det_dualMap`.

Source: Deligne-WeilI-1974, (2.6), p. 282.

### `middle-degree-determinant` — The determinant of Frobenius on the middle degree

Node `EtaleDualityAndPerverseSheaves:EDC.8/middle-degree-determinant` (theorem).

Let F be a field of characteristic 0, V of dimension b with a perfect ε-symmetric bilinear form
⟨·,·⟩ : V × V → F (ε = ±1) and φ ∈ GL(V) with ⟨φv, φw⟩ = c⟨v, w⟩, c = q^n (n ≥ 0 an integer, q
a positive integer). Let m_± be the dimension of the generalized eigenspace of φ for the
eigenvalue ±q^{n/2} (computed over F(q^{n/2})); these are the only eigenvalues paired with
themselves under α ↔ c/α. (a) If ε = −1 (alternating), b, m_+ and m_− are even and det φ =
c^{b/2}. (b) If ε = +1 (symmetric) and n is even, det φ = (−1)^{m_−} q^{nb/2}, and (−1)^{m_−} =
(−1)^{b − m_+} (so the sign can equally be read off from the multiplicity m_+ of q^{n/2}, as
Weil I (2.6) does). (c) In all cases (det φ)² = c^b.

Hypotheses. F of characteristic 0 (so that ℓ = 2 is allowed through ℚ_ℓ-coefficients); perfect
ε-symmetric form; similitude factor c = q^n.

Construction and proof. (1) (c) from EDC.8/similitude-reciprocal-charpoly with W = V, ψ = φ:
det φ = c^b det φ^{−1}. (2) Pair the eigenvalues α ↔ c/α (with multiplicities, generalized
eigenspaces V_α and V_{c/α} are dual under the form); the non-self-paired pairs contribute c
each to the determinant; the self-paired eigenvalues are α = ±q^{n/2}. (3) On V_{q^{n/2}} the
contribution is (q^{n/2})^{m_+}; on V_{−q^{n/2}} it is (−q^{n/2})^{m_−}; since b = 2r + m_+ +
m_− for r non-self-paired pairs, det φ = (−1)^{m_−} q^{nb/2}; for ε = −1 the form restricted to
V_{±q^{n/2}} is nondegenerate and alternating, so m_± are even and the sign disappears.

Acceptance. V = H¹ of an elliptic curve over 𝔽_q (alternating, b = 2): det φ = q. V = H² of a
smooth quadric surface over 𝔽_q with nonsplit ruling (symmetric, b = 2, n = 2, c = q²):
eigenvalues q and −q, det φ = −q²; the sign is the determinant of the orthogonal part.
Non-example: an arbitrary sign ± cannot replace the computation: for the split quadric the
eigenvalues are q, q and det φ = +q².

Depends on: `similitude-reciprocal-charpoly`.

Source: Milne-LEC-v2.21, Remark 27.13, p. 159.

### `poincare-pairing-reciprocity-export` — Reciprocity of Frobenius characteristic polynomials from Poincaré duality ★

Node `EtaleDualityAndPerverseSheaves:EDC.8/poincare-pairing-reciprocity-export` (theorem);
planet “Reciprocity of Frobenius polynomials”.

Let X₀ be smooth proper of pure dimension d over 𝔽_q, X = X₀ ⊗ 𝔽̄_q, ℓ ∤ q, and P_i(t) := det(1
− tF | H^i(X, ℚ_ℓ)) with F the geometric Frobenius, b_i := dim H^i, χ := Σ(−1)^i b_i. Then for
every i: P_{2d−i}(t) = (−q^d t)^{b_i} det(F | H^i)^{−1} P_i(1/(q^d t)), and det(F | H^i) det(F
| H^{2d−i}) = q^{d b_i}. For i = d the form on H^d is (−1)^d-symmetric and det(F | H^d) = ±q^{d
b_d/2} as in EDC.8/middle-degree-determinant (with the sign given by the generalized eigenspace
at −q^{d/2} when d is even; + when d is odd). Writing Δ := Π_i det(F | H^i)^{(−1)^{i+1}}, Δ² =
q^{dχ}. The statement concerns the actual finite-dimensional spaces with no semisimplicity
assumption; WeilConjectures WC.2 assembles the signed zeta functional equation from it and EDC
does not define a zeta function.

Hypotheses. X₀ smooth proper of pure dimension d over 𝔽_q; ℚ_ℓ (or E/ℚ_ℓ) coefficients, ℓ = 2
allowed; no semisimplicity of F.

Construction and proof. (1) The cup-product pairing H^i × H^{2d−i} → H^{2d} ≅ ℚ_ℓ(−d) is
perfect and satisfies ⟨Fx, Fy⟩ = q^d⟨x, y⟩ (EDC.2:pairings/galois-frobenius-equivariance,
EDC.2:pairings/adic-and-rational-poincare-duality), and is (−1)^{i}-graded symmetric
(EDC.2:pairings/cup-product-trace-pairing). (2) Apply EDC.8/similitude-reciprocal-charpoly with
c = q^d to (H^i, H^{2d−i}), and EDC.8/middle-degree-determinant to H^d. (3) Δ² = Π_i (det F|H^i
det F|H^{2d−i})^{(−1)^{i+1}} … = q^{dχ} by pairing i with 2d − i (the middle term squared gives
q^{d b_d}).

Acceptance. X₀ = P¹: P_0 = 1 − t, P_2 = 1 − qt, and P_2(t) = (−qt) P_0(1/(qt)). X₀ an elliptic
curve: P_1(t) = 1 − a t + q t², self-reciprocal: P_1(t) = q t² P_1(1/(qt)), det F|H¹ = q. An
even-dimensional middle pairing (d = 2, a smooth quadric surface with nonsplit ruling): det(F |
H²) = −q², the sign computed, not assumed.

Depends on: `similitude-reciprocal-charpoly`, `middle-degree-determinant`,
`EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`,
`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`,
`EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`.

Source: Milne-LEC-v2.21, Remark 27.13, p. 159; Deligne-WeilI-1974, (2.6), p. 282.

## Requests to other roadmaps

Each request names the supplier stage and the exact statement this part imports; the consuming
nodes cite the stage.

- `SchemeAndStackFoundations:SF.2`: Artin's affine vanishing (SGA 4 XIV, Théorème 3.1 and
  Corollaire 3.2), from CohomologicalPointCounting's constructible-sheaf toolkit integrated by
  SF.2: for f : X → Y an affine morphism of schemes of finite type over a field and F a torsion
  sheaf with d(F) := max dim of the closures of points in Supp F ≤ n, one has d(R^qf_*F) ≤ n −
  q; in particular cd(X) ≤ dim X for X affine of finite type over a separably closed field
  (torsion coefficients prime to the characteristic). Needed by:
  `affine-vanishing-hypercohomology`, `affine-perverse-artin-vanishing`.
- `SchemeAndStackFoundations:SF.2`: Proper base change for Rf_* along proper f and for Rf_!
  (SGA 4 XII 5.1, XVII 5.2.6), already requested by part EDC.0; here used for the fibres of a
  blow-up, of a semismall map and of correspondences, and the projection formula for Rf_!.
  Needed by: `blowup-direct-images`, `pullback-injective-blowup-bundle`,
  `semismall-pushforward-perverse`, `correspondence-pushforward`, `correspondence-composition`.
- `SchemeAndStackFoundations:SF.2`: The ℓ-adic formalism of EllAdicRealization
  (CohomologicalPointCounting): Ekedahl's normalized λ-adic systems and the triangulated
  category D^b_c(X, O_E) := 2-lim D_ctf(X, O_E/λ^m) for X of finite type over a field (or a
  regular base of dimension ≤ 1), its reduction functors, the six operations computed
  levelwise, finiteness of H^i(X, K) as O_E-modules, perfectness of RΓ_c(X, K) with RΓ_c(X, K)
  ⊗^L O_E/λ^m ≅ RΓ_c(X, K ⊗^L O_E/λ^m), and D^b_c(X, E) := D^b_c(X, O_E) ⊗ E. Needed by:
  `weak-lefschetz-integral`, `classical-and-proetale-adic-categories`.
- `SchemeAndStackFoundations:SF.2`: Smooth and proper base change for a smooth proper family
  over a connected base (R^qf_*Λ lisse, with specialization isomorphisms), and the generic base
  change and spreading-out of constructible complexes over a finitely generated ℤ-algebra (SGA
  4½ [Th. finitude] 2.13 and the limit arguments of EGA IV §8 for constructible sheaves).
  Needed by: `complete-intersection-betti-comparison`, `spreading-out-to-finite-fields`.
- `SchemeAndStackFoundations:SF.2`: ComplexComparison (CohomologicalPointCounting, layers
  10–12): Artin's comparison theorem H^q(X_ét, F) ≅ H^q(X(ℂ), F) and (R^qf_{ét*}F)^an ≅
  R^qf_{cl*}F^an for f of finite type over ℂ and F constructible (SGA 4 XVI 4.1), and the
  compatibility of the Kummer sequence with the exponential sequence under μ_n ≅ ℤ/n,
  e^{2πik/n} ↦ k, so that the étale and topological first Chern classes agree. Needed by:
  `complex-analytic-comparison`, `trace-orientation-comparison`.
- `SchemeAndStackFoundations:SF.2`: Topological invariance of the étale site (already requested
  by part EDC.0) and finiteness of étale cohomology of constructible sheaves on schemes of
  finite type over a separably closed field, used to compare a hypersurface section with its
  reduced subscheme and to make vanishing subspaces finite-dimensional. Needed by:
  `ample-divisor-weak-lefschetz`, `vanishing-and-restriction-subspaces`.
- `SchemeAndStackFoundations:SF.0`: Blow-ups along regular immersions of smooth schemes: for Z
  ⊂ X a smooth closed subscheme of pure codimension c of a smooth k-scheme, Bl_Z X is smooth
  and proper over X, an isomorphism over X − Z, the exceptional divisor E = π^{-1}(Z) is the
  projective bundle P(N_{Z/X}) over Z with O_{Bl}(−E)|_E ≅ O_E(1) (Stacks, Divisors, blowing up
  along a regular immersion). Needed by: `blowup-direct-images`.
- `SchemeAndStackFoundations:SF.0`: For f : X → S universally closed (e.g. X proper over a
  field) and ℒ f-ample, X_s → S is affine for every s ∈ Γ(X, ℒ) (Stacks, Tag 0EKE); and the
  Veronese re-embedding of P^N by O(r), under which degree-r hypersurfaces are hyperplane
  sections. Needed by: `ample-divisor-weak-lefschetz`.
- `SchemeAndStackFoundations:SF.0`: The parameter scheme of smooth complete intersections of a
  given multidegree in P^N over ℤ[1/ℓ]: an open subscheme of a product of projective spaces of
  forms, smooth with geometrically irreducible fibres over Spec ℤ[1/ℓ], over which the
  universal complete intersection is smooth and proper. Needed by:
  `complete-intersection-betti-comparison`.
- `AdicCoefficientsAndComparisons:L2`: The extension of the scheme Rf_! to separated
  finite-type morphisms of qcqs schemes, compatible with the Noetherian one (input of ECD
  27.4). Needed by: `scheme-adic-diamond-operation-comparisons-index`.
- `AdicCoefficientsAndComparisons:L3`: ECD Propositions 27.1–27.4: c_X^* commutes with ⊗ and
  pullback, is fully faithful with right adjoint Rc_{X*} commuting with RHom and pushforward,
  and Rf^◇_!c_Y^* ≅ c_X^*Rf_!, Rf^!Rc_{X*} ≅ Rc_{Y*}Rf^{◇!} for f separated of finite type
  between qcqs schemes of characteristic p. This is the edge AdicCoefficientsAndComparisons:L3
  → EDC.6 of the confirmed finding RT-AREA-etale/17. Needed by:
  `scheme-adic-diamond-operation-comparisons-index`, `diamond-transport-of-duality`.
- `AdicCoefficientsAndComparisons:L4`: ECD Proposition 27.5: the Rf_!/f^! comparison for
  separated maps of schemes of finite type over a complete DVR with perfect residue field.
  Needed by: `scheme-adic-diamond-operation-comparisons-index`.
- `AdicCoefficientsAndComparisons:L6`: ECD Propositions 27.6–27.7: commutation of c^* with Rf_*
  and full faithfulness on constructible complexes with finite coefficients prime to p, for
  schemes of finite type over O. Needed by: `scheme-adic-diamond-operation-comparisons-index`.

## Gaps

- **ℓ-adic sheaf theory on Artin and Deligne–Mumford stacks (confirmed finding
  RT-AREA-etale/3).** This part is scheme-only, like part EDC.0. Perverse sheaves and IC on
  Artin stacks, the decomposition theorem for proper representable maps of DM stacks, and
  correspondences/trace formulas on DM stacks (the EDC.8 stack items YUN-ZHANG-17/35,
  YUN-ZHANG-19/120, LAFFORGUE-18/48) are planned nowhere. The first `restructure` entry
  endorses part EDC.0's Part II proposal for stacks and assigns these items to it. Needed by:
  `GlobalShtukasAndFunctionFieldLanglands:GS.1`, `GlobalShtukasAndFunctionFieldLanglands:GS.3`,
  `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`, `EtaleDualityAndPerverseSheaves:EDC.8`.
- **Perfect schemes, equivariant perverse sheaves and hyperbolic localization (confirmed
  finding RT-AREA-etale/16).** Zhu's E01–E03, E07–E14, the equivariant items
  (equivariant-perverse-sheaves-pfp, equivariant-cohomology-borel,
  equivariant-cohomology-free-quotient), characteristic-classes-of-torsors, the Braden
  hyperbolic localization E09, IC-stalk-parity (a statement about Witt Grassmannians that
  belongs to GeometricSatakeAndFusion) and HKW's perfect-scheme local terms
  (PAPER-HANSEN-KALETHA-WEINSTEIN-22/091) need the Part II on perfect schemes proposed by part
  EDC.0 and endorsed in `restructure`. The finite-type statements they transport (E04 perverse
  t-structure, E05 IC, E06 decomposition) are nodes here. Needed by:
  `GeometricSatakeAndFusion:GS1`, `GeometricSatakeAndFusion:GS3`,
  `GeometricSatakeAndFusion:GS4`.
- **Relative perverse t-structures and universal local acyclicity over a base.**
  GlobalShtukasAndFunctionFieldLanglands requested from EDC.4 'the perverse t-structure
  relative to a base' and 'universal local acyclicity'. Neither is in the text of EDC.4–EDC.8
  (EDC.5 is the absolute perverse t-structure over a field). The relative perverse t-structure
  of Hansen–Scholze is owned on the diamond side by GeometricSatakeAndFusion:GS1 (FS VI.7) and
  ULA by VStackSheavesAndLisseCategories:VS1; the scheme-theoretic relative version over a
  curve has no owner. Needed by: `GlobalShtukasAndFunctionFieldLanglands:GS.1`.
- **Nearby cycles over general bases and compactification boundary machinery requested from
  EDC.5/EDC.6.** GlobalShtukasAndFunctionFieldLanglands requested nearby cycles over general
  bases with Orgogozo's finiteness theorem (from EDC.6) and 'compactifications and boundary
  strata in the étale setting' (from EDC.5). Neither is in the text of EDC.5 or EDC.6; nearby
  cycles belong to LefschetzPencilsAndVanishingCycles:LPV.0/LPV.6 (over a trait) and the
  general-base version (Orgogozo, Lu–Zheng) has no owner. Needed by:
  `GlobalShtukasAndFunctionFieldLanglands:GS.6`, `GlobalShtukasAndFunctionFieldLanglands:GS.7`.
- **Euler characteristic of smooth complete intersections.** The hypersurface formula b_m^0 =
  ((d − 1)^{m+2} + (−1)^m(d − 1))/d needs χ(X) = deg c_m(T_X) (a Gauss–Bonnet / Riemann–Roch
  statement in étale cohomology, or the topological computation over ℂ). Neither
  SchemeAndStackFoundations:SF.5 nor any EDC stage states it; the field-independence of b_m^0
  is planned without it. Needed by: `complete-intersection-betti-comparison`.

## Proposed restructuring

- **rescope** (EtaleDualityAndPerverseSheaves, GlobalShtukasAndFunctionFieldLanglands,
  EndoscopicTransferAndUnitaryTraceComparison). Confirmed finding RT-AREA-etale/3, for the
  stages of this part: EDC.5, EDC.7 and EDC.8 are scheme-only, yet GlobalShtukas GS.1 and GS.3,
  ET.2b and the EDC.8 stack items (YUN-ZHANG-17/35, YUN-ZHANG-19/120, LAFFORGUE-18/48) apply
  their outputs on stacks. Proposal: Endorse part EDC.0's proposal 'Étale duality, cycle
  classes and perverse sheaves, Part II: Artin and Deligne–Mumford stacks'. Its perverse layer
  imports EDC.5/perverse-t-structure, EDC.5/intermediate-extension and
  EDC.5/intersection-complex by smooth descent; its decomposition layer imports
  EDC.7/proper-direct-image-decomposition for proper representable maps of DM stacks; its trace
  layer imports EDC.8/cohomological-correspondence, EDC.8/correspondence-trace and
  EDC.8/lefschetz-verdier-formula (Varshavsky, Behrend). Edges from the Part II to GS.1, GS.3,
  ET.2b; LAFFORGUE-18/48 is re-routed there as missing.
- **rescope** (EtaleDualityAndPerverseSheaves, GeometricSatakeAndFusion). Confirmed finding
  RT-AREA-etale/16: PAPER-ZHU-17 route 7 adds perfect-scheme, equivariant and
  hyperbolic-localization items outside EDC's scope. Proposal: Endorse part EDC.0's proposal
  'Étale duality, cycle classes and perverse sheaves, Part II: perfect schemes, equivariant
  coefficients and hyperbolic localization', importing
  GeometricSatakeAndFusion:GS0:Witt-geometry's perfect-space carrier and
  AdicCoefficientsAndComparisons L2's perfection invariance. It receives Zhu E01–E03, E07–E14,
  the equivariant items, characteristic-classes-of-torsors, E09 (Braden's hyperbolic
  localization for schemes, planned nowhere else) and PAPER-HANSEN-KALETHA-WEINSTEIN-22/091.
  Zhu E04, E05, E06 stay as sources of EDC.5/perverse-t-structure, EDC.5/intersection-complex
  and EDC.7/proper-direct-image-decomposition on finite-type models; IC-stalk-parity moves to
  GeometricSatakeAndFusion.
- **rescope** (EtaleDualityAndPerverseSheaves, GeometricSatakeAndFusion,
  GlobalShtukasAndFunctionFieldLanglands). Confirmed finding RT-AREA-geomlanglands/18 and two
  mis-addressed requests: the stage edge EDC.4 → GeometricSatakeAndFusion:GS1 carries nothing
  (EDC.4 is weak Lefschetz, projective bundles and blow-ups), GeometricSatakeAndFusion--GS0
  requests the perverse t-structure and recollement from EDC.4, and
  GlobalShtukasAndFunctionFieldLanglands requests perverse sheaves, IC, the decomposition
  theorem and the smallness criterion from EDC.4. Proposal: Drop the edge EDC.4 → GS1 and keep
  EDC.5 → GS1 (already present). GS0/GS1's request is supplied by EDC.5/perverse-t-structure,
  EDC.5/perverse-recollement and EDC.5/intermediate-extension; GlobalShtukas GS.1's by
  EDC.5/perverse-sheaves, EDC.5/intersection-complex, EDC.5/small-map-intersection-complex and
  EDC.7/proper-direct-image-decomposition (edge EDC.7 → GS.1 to add; acyclic, since EDC.7 does
  not depend on GlobalShtukas). Relative perversity and ULA are not EDC's (see gaps).
- **rescope** (EtaleDualityAndPerverseSheaves, AdicCoefficientsAndComparisons,
  ClassicalAdicEtaleCohomology). Confirmed finding RT-AREA-etale/17: EDC.6 uses ECD 27.1–27.4,
  owned by AdicCoefficientsAndComparisons:L3, which is not among EDC.6's ancestors. Proposal:
  Add the stage edges AdicCoefficientsAndComparisons:L3 → EDC.6,
  AdicCoefficientsAndComparisons:L4 → EDC.6 and ClassicalAdicEtaleCohomology:H5 → EDC.6. They
  are induced by the prerequisites of EDC.6/scheme-adic-diamond-operation-comparisons-index and
  EDC.6/diamond-transport-of-duality (requests to L3, L4 and node prerequisites in H5), and
  close the decomposition review's open orchestrator decision.
- **split** (EtaleDualityAndPerverseSheaves). EDC.5 holds both the abstract BBD chapter 1
  formalism (hearts, t-exactness, recollement, intermediate extension in a recollement) and the
  perverse t-structure on schemes; the former is general triangulated-category theory that no
  other layer of the atlas plans and that Mathlib has only in part (the heart is not yet
  abelian at the pin). Proposal: Divide EDC.5 into two sub-layers for the atlas:
  'EDC.5:t-structures — hearts, t-exactness and recollement' with nodes
  EDC.5/t-structure-heart-abelian, EDC.5/t-cohomology-functor, EDC.5/t-exact-functor,
  EDC.5/recollement-data, EDC.5/glued-t-structure, EDC.5/abstract-intermediate-extension; and
  'EDC.5:perverse — perverse sheaves and intersection complexes' with the remaining fourteen
  EDC.5 nodes. EDC.5 owns the first sub-layer unless a foundational triangulated-categories
  roadmap is created, in which case it moves there.

## Confirmed red-team findings handed to this job

- RT-AREA-etale/3 (stacks): this part is scheme-only; the first restructuring entry and the
  first gap route the stack consumers (GS.1, GS.3, ET.2b, the EDC.8 stack items) to the
  proposed Part II on Artin and Deligne–Mumford stacks.
- RT-AREA-etale/16 (perfect schemes): Zhu's E04, E05 and E06 are planned on finite-type models
  in `perverse-t-structure`, `intersection-complex` and `proper-direct-image-decomposition`;
  the perfect-scheme, equivariant and hyperbolic-localization items go to the proposed Part II
  (second restructuring entry, second gap).
- RT-AREA-etale/17 (missing edge L3 → EDC.6): `scheme-adic-diamond-operation-comparisons-index`
  and `diamond-transport-of-duality` request AdicCoefficientsAndComparisons:L3 (and L4, L6) and
  cite ClassicalAdicEtaleCohomology H5 nodes, which induces the edges L3 → EDC.6, L4 → EDC.6
  and H5 → EDC.6 (fourth restructuring entry).
- RT-AREA-geomlanglands/18 (GS1's edges): EDC.4 supplies nothing to GS1; the third
  restructuring entry drops EDC.4 → GS1, keeps EDC.5 → GS1, and names the EDC.5 nodes that
  GS0/GS1 and GlobalShtukas GS.1 import.

## Sources and their mistakes

- `BBD-1982`: A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Astérisque 100
  (1982), pp. 5–171; Numdam scan with OCR text layer (printed page = PDF page − 1), read
  2026-10-06; excerpts checked against page images.
  https://www.numdam.org/item/AST_1982__100__1_0.pdf; read: §1.3 (1.3.1–1.3.17), §1.4
  (1.4.3–1.4.26), §2.1 (2.1.1–2.1.23), §2.2 (2.2.9–2.2.19), §3.3, §4.0–4.3, §5.1
  (5.1.8–5.1.15), §5.3 (5.3.1–5.3.8), §5.4 (5.4.1–5.4.10), §6.1–6.2 (6.1.1–6.1.10,
  6.2.4–6.2.10).
- `Deligne-WeilII-1980`: Pierre Deligne, *La conjecture de Weil. II*, Publ. Math. IHÉS 52
  (1980), 137–252; Numdam scan with OCR, read 2026-10-06.
  https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf; read: §4.1 ((4.1.1)–(4.1.6),
  Lefschetz faible), §4.2–4.3 ((4.2.2), (4.3.1)–(4.3.2)).
- `Deligne-WeilI-1974`: Pierre Deligne, *La conjecture de Weil. I*, Publ. Math. IHÉS 43 (1974),
  273–307; Numdam scan with OCR, read 2026-10-06.
  https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf; read: §2 ((2.3)–(2.6), functional
  equation), §5 ((5.1)–(5.7), pencils and Veronese), §7 (proof of Lemme (7.1)).
- `Milne-LEC-v2.21`: J. S. Milne, *Lectures on Étale Cohomology*, Version 2.21 (22 March 2013),
  read 2026-10-06; the text layer mangles symbols.
  https://www.jmilne.org/math/CourseNotes/LEC.pdf; read: §15 (Theorem 15.1), §16 (Example 16.4
  and the aside on complete intersections), §23 (Theorem 23.2), §27 (Theorem 27.12, Remark
  27.13), §33 (Lemma 33.2 and proof).
- `SGA4-XIV`: M. Artin, *SGA 4, Exposé XIV: Théorème de finitude pour un morphisme propre;
  dimension cohomologique des schémas algébriques affines*, Retyped edition of LNM 305 (version
  71766d9, 2024), with LNM page numbers in the margin; read 2026-10-06.
  https://www.normalesup.org/~forgogozo/SGA4/14/14.pdf; read: §2.1, Théorème 3.1, Corollaires
  3.2–3.3.
- `SGA4-XVI`: M. Artin, *SGA 4, Exposé XVI: Théorème de changement de base par un morphisme
  lisse, et applications*, Retyped edition of LNM 305 (version 71766d9, 2024); read 2026-10-06.
  https://www.normalesup.org/~forgogozo/SGA4/16/16.pdf; read: Théorème 4.1 (comparison
  theorem).
- `Stacks-Morphisms`: The Stacks Project Authors, *The Stacks Project, Chapter 29: Morphisms of
  Schemes*, Version ed88ff78 (compiled 14 July 2026), read 2026-10-06.
  https://stacks.math.columbia.edu/download/morphisms.pdf; read: Lemma 44.18 (Tag 0EKE),
  Definition 38.1 (Tag 01VH).
- `Varshavsky-LV-2007`: Yakov Varshavsky, *Lefschetz–Verdier trace formula and a generalization
  of a theorem of Fujiwara*, arXiv math/0505564v2 (2005); published Geom. Funct. Anal. 17
  (2007), 271–319; read 2026-10-06. https://arxiv.org/pdf/math/0505564v2; read: §0.2, §1.1
  (1.1.1–1.1.9), §1.2 (1.2.1–1.2.6), §1.5 (1.5.1–1.5.8).
- `Varshavsky-LocalTerms-2020`: Yakov Varshavsky, *Local terms for transversal intersections*,
  arXiv 2003.06815v3 (25 November 2021); read 2026-10-06. https://arxiv.org/pdf/2003.06815v3;
  read: Theorem 4.10, Corollary 4.11, Example 5.3, Corollaries 5.4–5.7.
- `Hansen-Kaletha-Weinstein-2022`: David Hansen, Tasho Kaletha, Jared Weinstein, *On the
  Kottwitz conjecture for local shtuka spaces*, arXiv 1709.06651v4 (17 March 2022); published
  Forum Math. Pi 10 (2022); read 2026-10-06. https://arxiv.org/pdf/1709.06651v4; read: §5.6,
  Proposition 5.6.2 and proof.
- `Lu-Zheng-2022`: Qing Lu, Weizhe Zheng, *Categorical traces and a relative Lefschetz–Verdier
  formula*, arXiv 2005.08522v4 (9 January 2022); published Forum Math. Sigma 10 (2022), e10;
  read 2026-10-06. https://arxiv.org/pdf/2005.08522v4; read: §2.2, Construction 2.6.
- `Caraiani-Scholze-2017`: Ana Caraiani, Peter Scholze, *On the generic part of the cohomology
  of compact unitary Shimura varieties*, arXiv 1511.02418v1 (2015); published Ann. of Math. 186
  (2017), 649–766; read 2026-10-06. https://arxiv.org/pdf/1511.02418v1; read: §6.1, Corollary
  6.1.4 and its proof.
- `Mirkovic-Vilonen-2007`: I. Mirković, K. Vilonen, *Geometric Langlands duality and
  representations of algebraic groups over commutative rings*, arXiv math/0401222v5 (2018);
  published Ann. of Math. 166 (2007); read 2026-10-06. https://arxiv.org/pdf/math/0401222v5;
  read: §2 (conventions), §4, (4.4) and Lemma 4.3.
- `deCataldo-Migliorini-2009`: Mark Andrea de Cataldo, Luca Migliorini, *The decomposition
  theorem, perverse sheaves and the topology of algebraic maps*, arXiv 0712.0349v2 (2009);
  published Bull. Amer. Math. Soc. 46 (2009), 535–633; read 2026-10-06.
  https://arxiv.org/pdf/0712.0349v2; read: §2.3 (Example 2.3.5), §4.2 (Proposition 4.2.1,
  Definition 4.2.2, Remark 4.2.4, Theorem 4.2.7).
- `Yun-Zhang-2019`: Zhiwei Yun, Wei Zhang, *Shtukas and the Taylor expansion of L-functions
  (II)*, Published, Ann. of Math. 189 (2019), 393–526 (authors' copy of the published version);
  read 2026-10-06. https://math.mit.edu/~zyun/GZW_ramified_published.pdf; read: §5.5
  (Proposition 5.5(3)(4)), §7.1 (Proposition 7.1 and proof).
- `Liu-Tian-Xiao-Zhang-Zhu-2022`: Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu,
  *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*, arXiv 1912.11942v3
  (2021); published Invent. Math. 228 (2022); read 2026-10-06.
  https://arxiv.org/pdf/1912.11942v3; read: §5.11 (Notation 5.11.1, Lemma 5.11.3 and proof).
- `Zhu-2017`: Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed
  characteristic*, arXiv 1407.8519v3 (2016); published Ann. of Math. 185 (2017); read
  2026-10-06. https://arxiv.org/pdf/1407.8519v3; read: Appendix A.2–A.3 (A.3.1, A.3.4), proof
  of Lemma 2.11.
- `Bhatt-Scholze-proetale-2015`: Bhargav Bhatt, Peter Scholze, *The pro-étale topology for
  schemes*, arXiv 1309.1198v2 (2014); published Astérisque 369 (2015); read 2026-10-06.
  https://arxiv.org/pdf/1309.1198v2; read: §5.5, §6.5–6.8 (Definition 6.5.1, Proposition
  6.6.11, Theorem 6.7.1, Definitions 6.8.1, 6.8.8, Proposition 6.8.14, Remark 6.8.15).
- `Scholze-ECD-2026`: Peter Scholze, *Étale cohomology of diamonds*, Author manuscript dated 14
  April 2026; read 2026-10-06. https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf; read:
  §27, Propositions 27.1–27.4.

Mistakes recorded under `sourceIssues`:

- EtaleDualityAndPerverseSheaves/E11 (misprint, BBD-1982, 2.2.12 (ii)*, p. 71 (Numdam scan of
  Astérisque 100, 1982; checked on the page image)): printed "(ii)* Pour tout point (fermé ou
  non) x de X, notant dim x la dimension de {x}⁻, on a H^i i_x^*K = 0 pour i < p(2dim x) (resp.
  H^i i_x^!K = 0 pour i > p(2dim x))."; correction: K ∈ D^{≤p} iff H^i i_x^*K = 0 for i > p(2
  dim x); K ∈ D^{≥p} iff H^i i_x^!K = 0 for i < p(2 dim x). Both inequalities are reversed in
  print. Reason: The statement is announced as a reformulation of 2.2.2(ii), and the same
  conditions appear correctly in (4.0.1)–(4.0.2) for p = p_{1/2} (H^i i_x^*K = 0 for i >
  −dim(x), H^i i_x^!K = 0 for i < −dim(x)). With the printed inequalities, Λ_x placed in degree
  0 at a closed point would fail the D^{≤p} condition. Known: new.
- EtaleDualityAndPerverseSheaves/E12 (misprint, BBD-1982, Théorème 4.3.1 (ii), p. 112 (Numdam
  scan)): printed "L est un ℚ_ℓ-faisceau lisse irréductible sur V"; correction: L is an
  irreducible lisse ℚ̄_ℓ-sheaf: §4 works in D^b_c(X, ℚ̄_ℓ) (4.0). Reason: 4.0 fixes ℚ̄_ℓ
  coefficients for the whole section; the classification of simple objects is over ℚ̄_ℓ. Known:
  new.
- EtaleDualityAndPerverseSheaves/E13 (misprint, Zhu-2017, Appendix A.3.1, pp. 54–55 (arXiv
  1407.8519v3)): printed "smooth open subset U is canonically isomorphic to Qℓ [2 dim X](dim
  X)"; correction: IC_X|_U ≅ ℚ̄_ℓ[dim X] (unnormalized; a half-twist normalization is a
  separate choice). Reason: IC_X = j_!*ℚ̄_ℓ[dim X] restricts to ℚ̄_ℓ[dim X] on the smooth open
  U (EDC.5/intersection-complex); the printed shift 2 dim X is not perverse. Known:
  PAPER-ZHU-17/E25 (recorded by the extraction of Zhu's paper in this atlas).

## Coverage

- `EtaleDualityAndPerverseSheaves:EDC.4`: planned. Remaining: Lemma-level refinement: split
  EDC.4/blowup-formula into the Gysin/restriction identities j^*j_* = −ζ ∪ and the
  triangularity argument; give the ℓ-adic limit step of EDC.4/weak-lefschetz its own lemma. SGA
  7 XVIII §§1–4 (Katz) was not available in a public copy; the blow-up and projective-bundle
  statements are planned from Weil I §7, Milne LEC §§23, 33 and the proper base change
  argument. Compare with SGA 7 XVIII when a copy is available.
- `EtaleDualityAndPerverseSheaves:EDC.5`: planned. Remaining: Lemma-level refinement of
  EDC.5/t-structure-heart-abelian (admissibility of morphisms of the heart) and
  EDC.5/glued-t-structure (axiom (iii) via the octahedron). The costalk description of pD^{≥0}
  for torsion O/π^m coefficients (no duality characterisation) is stated through strata; a
  lemma node for the strata-wise costalk criterion.
- `EtaleDualityAndPerverseSheaves:EDC.6`: planned. Remaining: The Euler characteristic formula
  for smooth complete intersections used in EDC.6/complete-intersection-betti-comparison is
  recorded as a gap. Lemma-level: separate the ℤ_ℓ biduality limit argument and the
  universal-coefficient sequences of EDC.6/adic-transport-of-duality-and-classes into lemmas.
- `EtaleDualityAndPerverseSheaves:EDC.7`: planned. Remaining: Lemma-level refinement of BBD
  5.4.10's proof (cases i = 1 and the induction, 5.4.14–5.4.15) and of 5.3.6–5.3.7 inside
  EDC.7/geometric-semisimplicity. The 'geometric origin' class of BBD 6.2.4 is used as stated;
  a definition node for it at lemma level.
- `EtaleDualityAndPerverseSheaves:EDC.8`: planned. Remaining: Lemma-level: the Künneth
  identification Hom(←c^*L, →c^!L) ≅ H⁰(C, c^!(D L ⊠ L)) inside EDC.8/correspondence-trace
  deserves its own lemma node. SGA 5 III (Illusie) was not available; the trace formalism
  follows Varshavsky and Lu–Zheng.
