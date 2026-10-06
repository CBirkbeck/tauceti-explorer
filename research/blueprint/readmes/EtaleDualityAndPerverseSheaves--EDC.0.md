# Étale duality, cycle classes and perverse sheaves — Part 1: coefficients, f^!, purity, Poincaré duality and cycle classes (EDC.0–EDC.3)

This document is the plan for the first part of the roadmap EtaleDualityAndPerverseSheaves: its
stages EDC.0, EDC.1 (with EDC.1:adjoint and EDC.1:biduality), EDC.2 (with EDC.2:trace-purity
and EDC.2:pairings) and EDC.3. It agrees with the blueprint packet
research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.0.json, which is definitive for
node identifiers and prerequisites, and with the suggested Lean file
research/blueprint/suggested/EtaleDualityAndPerverseSheaves--EDC.0.lean. Every stage in scope
is planned at target level: each target the stage text states is a node, and every prerequisite
chain ends in a declaration of the pinned libraries, in a node of another blueprint, in a
requested stage of another roadmap, or in a recorded gap. Nothing here is claimed to be
formalised.

The second part of the roadmap (EDC.4 weak Lefschetz and projective bundles, EDC.5 perversity,
EDC.6 comparisons, EDC.7 decomposition, EDC.8 correspondences) is a separate job; it imports
the declarations planned here.

## Purpose and boundaries

SGA 4 XVIII constructs, for a compactifiable morphism f : X → S and torsion coefficients, a
right adjoint f^! of the compactly supported direct image Rf_!, computes it for smooth f as
f^*(d)[2d] (Poincaré duality, Théorème 3.2.5), and deduces global duality. This part plans
exactly that development, in the order its proof requires, together with the cycle-theoretic
exports that the rest of the atlas consumes: smooth-pair purity, fundamental classes, Gysin
maps, Chern classes and the étale cycle class map.

Ownership follows the accepted restructuring proposals RS-19 and RS-17. The finite-coefficient
foundations are CohomologicalPointCounting's (Tau Ceti pull request 196): ConstructibleEtale
(constructible sheaves, Tate-twist sheaves, the Kummer sequence), EtaleBaseChange (base change,
finiteness, acyclicity), CompactSupport (Nagata compactification and the finite-level Rf_!),
EllAdicRealization (ℓ-adic systems) and TraceFormula. That family is not a stage of the atlas,
so, as for every other packet, its declarations are requested from their integration owner
SchemeAndStackFoundations:SF.2; they are imported unchanged and never planned here. The
∞-categorical enhancement, the adjoint functor theorem and the coherent diagrams are
EnhancedDerivedSheaves E0–E3, cited by node. Chow groups and intersection products are
SchemeAndStackFoundations:SF.5, projective bundles SF.0, the Picard group and degree
JacobianChallenge Layer A, the Jacobian JacobianChallenge Layer D, and the Weil pairing
AbelianSchemesAndArithmeticModuli:A3.

What this part owns (RS-19 `owners`): cohomology with supports and the compatibility of the
imported Rf_! with the enhancement (EDC.0); the exceptional inverse image as an actual right
adjoint, the dualizing complex and the formal exchange maps (EDC.1:adjoint); the finite-flat
and curve traces and the smooth relative trace/purity theorem (EDC.2:trace-purity);
constructible biduality and relative/geometric duality (EDC.1:biduality); the normalized
Poincaré pairings with their derived integral and Frobenius forms (EDC.2:pairings); supported
fundamental classes, Gysin maps and étale cycle and Chern classes (EDC.3).

Non-goals, each with its owner. Gabber's absolute purity for regular pairs over arbitrary
regular bases is not proved (EDC.2's text excludes it); the purity statements over a trait that
LefschetzPencilsAndVanishingCycles:LPV.7 asks for are a recorded gap. Stacks (Laszlo–Olsson,
Liu–Zheng) and perfect schemes (Zhu, Appendix A.3) are proposed as two Part II roadmaps under
`restructure`, following the confirmed red-team findings RT-AREA-etale/3 and RT-AREA-etale/16.
The Grothendieck–Ogg–Shafarevich formula is proposed as a sub-stage EDC.2:euler-characteristic,
endorsing the FiniteFieldsAndCharacterSums proposal. The cycle class over an imperfect field
(which needs inseparable descent) is not asserted. No equality of numerical and homological
equivalence, no standard conjecture and no Tate conjecture is assumed.

## Baseline and conventions

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit (AUDIT-18) finds every
target of EDC.0–EDC.3 not built. The pinned Mathlib does contain what this part builds on, and
the plan uses it rather than restating it: the small étale site
`AlgebraicGeometry.Scheme.smallEtaleTopology` on the category `X.Etale`, the fact that its
sheaves of modules form a Grothendieck abelian category
(`isGrothendieckAbelian_sheaf_smallEtaleTopology`), the geometric points `pointSmallEtale` with
their fibre functors `GrothendieckTopology.Point.sheafFiber` and their conservativity, the
unbounded `DerivedCategory` of an abelian category with its t-structures and Ext groups, sheaf
cohomology `Sheaf.H`, the morphism classes (`Smooth`, `SmoothOfRelativeDimension`,
`IsClosedImmersion`, `IsProper`, `Flat`, `Etale`, `LocallyQuasiFinite`), the algebra trace,
roots of unity, injective modules and Baer's criterion, perfect pairings
`LinearMap.IsPerfPair`, and algebraic cycles `AlgebraicGeometry.AlgebraicCycle` with their
pushforward. Tau Ceti's line-bundle classes and Weil divisors are reached through
JacobianChallenge Layer A.

All proposed declarations use the namespace `TauCeti.EtaleDuality` and modules under
`TauCeti/AlgebraicGeometry/Etale/Duality/`. Schemes are separated of finite type over a field
k, or compactifiable (separated, of finite type) over a quasi-compact quasi-separated base S
where the statement is relative. An integer n ≥ 1 is invertible on the base and Λ is a
commutative ring with nΛ = 0; where ordinary duals are taken, Λ = O/πⁿ for a discrete valuation
ring O (for example ℤ/ℓⁿ), which is self-injective. General finite coefficient rings keep the
finite-Tor-dimension restriction, and biduality is never inferred for a non-Gorenstein Λ.
Integral (ℤ_ℓ, O_E) duality is derived and keeps its Ext terms; degreewise perfect pairings are
asserted at finite level over O/πⁿ and after inverting ℓ.

Twists: Λ(1) := μ_n ⊗ Λ, Λ(i) its tensor powers, K(i) := K ⊗ Λ(i). Over 𝔽_q the geometric
Frobenius acts on Λ(1) by q⁻¹ and on Λ(−d) by q^d; the arithmetic Frobenius is its inverse.
Thus a smooth geometrically connected d-dimensional variety has trace H^{2d}_c(X̄, Λ(d)) → Λ
and H^{2d}_c(X̄, Λ) = Λ(−d). Every pairing, Gysin map and adjunction unit below records its
twist and its cohomological shift.

## Dependency order

The exact order inside this part is EDC.0 → EDC.1:adjoint → EDC.2:trace-purity →
EDC.1:biduality → EDC.2:pairings → EDC.3. The numbered headers EDC.1 and EDC.2 collect
interfaces; they do not assert that all of EDC.1 precedes all of EDC.2. Constructing f^! uses
only EDC.0 and the cohomological-dimension bounds (SGA 4 XVIII 0.2 separates §3.1 from §§1–2).
The smooth trace and purity use only EDC.1:adjoint, and the curve calculation inside them is
proved from the Jacobian and Kummer theory, not by specializing general biduality.
Constructible biduality consumes the smooth dualizing calculation. The pairings consume both.
EDC.3 consumes EDC.2.

Inside EDC.2:trace-purity: quasi-finite flat trace and Kummer c₁ → curve trace → curve H¹
duality (Jacobian) → effacement lemma 1.6.9 → affine-space trace → the general trace 2.9 →
smooth effacement 2.14 → smooth purity 3.2.5 → top-degree compact cohomology.

## EDC.0 — Coefficient, support and enhancement interfaces

This layer fixes the coefficient categories and imports the finite-level Rf_!, adding only what
the adjoint construction and the remaining layers need: the stalks, the constructible and ctf
subcategories, Tate twists with their Frobenius convention, derived tensor and RHom, cohomology
with supports retaining the closed immersion, change of coefficients with the reduction
identities, and the lift of Rf_! to the enhancement with its amplitude and colimit properties.
Compactifiability, boundedness and colimit preservation are proved properties, not entries of a
'six functors' assumption. Acceptance (stage text): an open immersion, a finite étale map and
the structure map of A¹ have the same Rf_! as CompactSupport — these are the unit tests of
enhanced-compact-pushforward.

### `etale-derived-category` — The étale derived category D(X, Λ) and its geometric stalks ★

Node `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category` (definition); planet “Étale
derived category D(X, Λ)”; module `TauCeti/AlgebraicGeometry/Etale/Duality/DerivedCategory`.

Let X be a scheme and Λ a commutative ring. The étale derived category is D(X, Λ) := the
unbounded derived category of the Grothendieck abelian category Sh(X_ét, Λ) of sheaves of
Λ-modules on Mathlib's small étale site X.smallEtaleTopology. Its full subcategories D⁺, D⁻,
D^b are cut out by the canonical t-structure (cohomology sheaves ℋ^q K). For a geometric point
x̄ : Spec Ω → X (Ω separably closed) the geometric stalk K ↦ K_x̄ : D(X, Λ) → D(Λ) is the
derived functor of the exact fibre functor of the point pointSmallEtale x̄. Global cohomology
is H^q(X, K) := Hom_{D(X,Λ)}(Λ_X, K[q]) and RΓ(X, −) is the right derived functor of global
sections. When Λ is torsion with nΛ = 0, n invertible on X, D(X, Λ) is the finite-level
coefficient category of SGA 4 XVII–XVIII written D(X, Λ) there; this node fixes the notation
every node of this packet uses and adds no new category.

Hypotheses. X any scheme for the definition; quasi-compact quasi-separated wherever a
compactifiable morphism or Rf_! appears. Λ a commutative ring; for the duality statements Λ is
torsion with nΛ = 0 for an integer n invertible on X (SGA 4 XVIII 1.1.1). The site is Mathlib's
small étale site; the big étale site is never used for coefficients.

Construction and proof. (1) Take the abelian category Sheaf X.smallEtaleTopology (ModuleCat Λ);
it is Grothendieck abelian by Mathlib's isGrothendieckAbelian_sheaf_smallEtaleTopology, so it
has enough injectives and K-injective resolutions (EnhancedDerivedSheaves E1). (2) Form
Mathlib's DerivedCategory of it (HasDerivedCategory.standard); D⁺, D⁻, D^b are the usual
subcategories for the canonical t-structure. (3) The fibre functor of pointSmallEtale x̄ is
exact on abelian sheaves (filtered colimit over étale neighbourhoods), so
Functor.mapDerivedCategory gives the triangulated stalk functor; conservativity of the family
of geometric stalks follows from isConservativeFamilyOfPoints_pointSmallEtale' and exactness (a
complex is acyclic iff all its stalks are). (4) H^q(X, F) for a sheaf F agrees with Ext^q(Λ_X,
F), which for Λ = ℤ is Mathlib's Sheaf.H.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.EtaleSheaf` | data | EtaleSheaf Λ X := Sheaf X.smallEtaleTopology (ModuleCat Λ), the abelian category of étale sheaves of Λ-modules. |
| `TauCeti.EtaleDuality.EtaleDerived` | data | EtaleDerived Λ X := DerivedCategory (EtaleSheaf Λ X), pretriangulated, with shift [1]. |
| `TauCeti.EtaleDuality.EtaleDerived.constant` | constructor | Λ_X ∈ D(X, Λ): the constant sheaf Λ placed in degree 0. |
| `TauCeti.EtaleDuality.EtaleDerived.stalk` | projection | For a geometric point x̄ : Spec Ω → X, the triangulated functor K ↦ K_x̄ : D(X, Λ) → D(Λ) induced by the exact fibre functor of pointSmallEtale x̄. |
| `TauCeti.EtaleDuality.EtaleDerived.isIso_iff_stalk` | characterisation | A morphism u in D(X, Λ) is an isomorphism iff u_x̄ is an isomorphism for every geometric point x̄; an object is zero iff all its stalks are zero. |
| `TauCeti.EtaleDuality.EtaleDerived.cohomology` | projection | H^q(X, K) := Hom(Λ_X, K[q]), an abelian group (its Λ-module structure is that of cohomologyModule), functorial in K and contravariant in X; long exact sequences for distinguished triangles. |
| `TauCeti.EtaleDuality.EtaleDerived.cohomology_sheaf` | compatibility | For a sheaf F placed in degree 0, H^q(X, F) ≅ Ext^q(Λ_X, F), equal to Mathlib's Sheaf.H when Λ = ℤ. |
| `TauCeti.EtaleDuality.EtaleDerived.equivModuleOfSepClosed` | equivalence | For X = Spec Ω with Ω separably closed, global sections give an equivalence D(X, Λ) ≃ D(Λ) compatible with shifts. |
| `TauCeti.EtaleDuality.GeometricPoint` | data | A geometric point of X: a separably closed field Ω with a morphism Spec Ω → X. |
| `TauCeti.EtaleDuality.globalSections` | projection | Γ(X, −) : EtaleSheaf Λ X ⥤ Mod_Λ, evaluation at the terminal étale X-scheme X → X. |
| `TauCeti.EtaleDuality.cohomologyModule` | projection | H^q(X, K) as a Λ-module: the q-th cohomology of RΓ(X, K) ∈ D(Λ). |
| `TauCeti.EtaleDuality.compactCohomologyModule` | projection | H^q_c(X, K) as a Λ-module for X separated of finite type over a separably closed field: cohomology of RΓ(Ra_!K). |

Used by. SGA 4 XVIII 3.1.4 and 3.2.5: the source and target categories D(X, f^*𝒜) and D(S, 𝒜)
of Rf_! and Rf^!. EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image: the
categories between which f^! is the right adjoint of Rf_!.
LefschetzPencilsAndVanishingCycles:LPV.7 (request to EDC.0): bounded complexes, hypercohomology
and conservative geometric stalks. DeligneWeightsAndPurity:DWP.7 (request to EDC.0): the
derived category D^b_c(X, ℚ̄_ℓ) is built from these finite-level categories by EDC.6 and
EllAdicRealization.

Unit tests:

- `TauCeti.EtaleDuality.etaleDerived_isZero_of_isEmpty` (degenerate): If X is empty then every
  object of D(X, Λ) is zero.
- `TauCeti.EtaleDuality.etaleDerived_spec_sepClosed` (compatibility): For Ω separably closed,
  D(Spec Ω, Λ) is equivalent to D(Λ) by global sections, and H^q(Spec Ω, F) = 0 for q > 0.
- `TauCeti.EtaleDuality.etaleDerived_stalk_conservative` (characterisation): A complex K with
  K_x̄ ≅ 0 for every geometric point x̄ of X is zero in D(X, Λ).
- `TauCeti.EtaleDuality.etaleDerived_globalSections_not_conservative` (non-example): Over X =
  Spec 𝔽_q, the rank-one sheaf of ℤ/n-modules (n ≥ 3 prime to q) given by a nontrivial
  character Gal(𝔽̄_q/𝔽_q) → (ℤ/n)ˣ is nonzero with H⁰(X, −) = 0: global sections do not detect
  zero objects, stalks do.

Acceptance. X = Spec Ω with Ω separably closed: global sections is an exact equivalence
Sh(X_ét, Λ) ≃ Mod_Λ, so D(X, Λ) ≃ D(Λ). Agreement with EnhancedDerivedSheaves E1: the homotopy
category of the enhancement is this D(X, Λ).

Depends on: `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology`,
`mathlib:AlgebraicGeometry.Scheme.Etale`,
`mathlib:AlgebraicGeometry.Scheme.isGrothendieckAbelian_sheaf_smallEtaleTopology`,
`mathlib:DerivedCategory`, `mathlib:HasDerivedCategory.standard`,
`mathlib:AlgebraicGeometry.Scheme.pointSmallEtale`,
`mathlib:AlgebraicGeometry.Scheme.isConservativeFamilyOfPoints_pointSmallEtale'`,
`mathlib:CategoryTheory.GrothendieckTopology.Point.sheafFiber`,
`mathlib:CategoryTheory.Functor.mapDerivedCategory`,
`mathlib:CategoryTheory.Triangulated.TStructure`, `mathlib:CategoryTheory.Sheaf.H`,
`mathlib:DerivedCategory.singleFunctor`, `mathlib:DerivedCategory.homologyFunctor`,
`mathlib:CategoryTheory.constantSheaf`, `EnhancedDerivedSheaves:E1/enhanced-derived-category`.

Source: SGA4-XVIII, 1.1.1, p. 484-485; Stacks-MoreEtale, Lemma 11.1 (tag 0G2C).

### `constructible-ctf-complexes` — Constructible complexes D^b_c(X, Λ) and complexes of finite Tor-dimension D_ctf(X, Λ) ★

Node `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes` (definition); planet
“Constructible complexes D^b_c(X, Λ)”; module
`TauCeti/AlgebraicGeometry/Etale/Duality/Constructible`.

Let X be a noetherian scheme (in practice separated of finite type over a field or over a
regular base of dimension ≤ 1) and Λ a noetherian torsion ring with nΛ = 0, n invertible on X.
A complex K ∈ D(X, Λ) is constructible, K ∈ D^b_c(X, Λ), when it is bounded and every
cohomology sheaf ℋ^q K is a constructible sheaf of Λ-modules in the sense imported from
ConstructibleEtale (there is a finite partition of X into locally closed constructible
subschemes on each of which the sheaf is locally constant with finitely generated stalks). K is
of finite Tor-dimension, K ∈ D_ctf(X, Λ), when moreover there is an a such that K ⊗^L_Λ M has
ℋ^q = 0 for q < a for every Λ-module M (equivalently K is locally quasi-isomorphic to a bounded
complex of flat constructible sheaves). D_ctf ⊂ D^b_c ⊂ D^b are full triangulated
subcategories, and the predicates are checked on stalks.

Hypotheses. Λ noetherian, torsion, with nΛ = 0 and n invertible on X. The notion of
constructible sheaf is ConstructibleEtale's (imported through SchemeAndStackFoundations SF.2);
this node only names the derived subcategories and their closure properties. Finite
Tor-dimension is a separate condition: for Λ = ℤ/ℓ², the constructible sheaf (ℤ/ℓ)_X is in
D^b_c but not in D_ctf.

Construction and proof. (1) Constructibility of each ℋ^q is stable under extensions, kernels
and cokernels of constructible sheaves (imported), so the long exact cohomology sequence makes
D^b_c a triangulated subcategory closed under shifts and direct summands. (2) Finite
Tor-dimension is tested stalkwise because the geometric stalks are exact and conservative
(EDC.0/etale-derived-category) and commute with ⊗^L (EDC.0/derived-tensor-and-internal-hom).
(3) Stability: f^* preserves both (exact on stalks); ⊗^L preserves D_ctf and sends D_ctf ×
D^b_c to D^b_c; Rf_! preserves both for f separated of finite type (imported finiteness and SGA
4 XVII 5.2.10 for Tor-dimension); Rf_* preserves D^b_c for f of finite type over a field or a
regular base of dimension ≤ 1 (imported finiteness theorem of SGA 4½ [Th. finitude]).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.IsConstructibleComplex` | data | IsConstructibleComplex K : Prop, K bounded with every ℋ^q K constructible (imported sheaf notion). |
| `TauCeti.EtaleDuality.IsCtf` | data | IsCtf K : Prop, K constructible and of finite Tor-dimension over Λ. |
| `TauCeti.EtaleDuality.isConstructibleComplex_shift` | structure | IsConstructibleComplex K ↔ IsConstructibleComplex (K[1]); likewise for IsCtf. |
| `TauCeti.EtaleDuality.isConstructibleComplex_of_triangle` | structure | In a distinguished triangle K → L → M → K[1], two constructible vertices force the third. |
| `TauCeti.EtaleDuality.isConstructibleComplex_iff_stalk` | characterisation | For X of finite type over a field, K ∈ D^b_c iff K is bounded and there is a finite stratification on whose strata the ℋ^q K are locally constant with finitely generated stalks. |
| `TauCeti.EtaleDuality.IsCtf.tensor` | structure | IsCtf K → IsCtf L → IsCtf (K ⊗^L L), and IsCtf K → IsConstructibleComplex L → IsConstructibleComplex (K ⊗^L L). |
| `TauCeti.EtaleDuality.IsConstructibleComplex.pullback` | functoriality | f^* preserves D^b_c and D_ctf for any morphism f. |
| `TauCeti.EtaleDuality.IsConstructibleComplex.lowerShriek` | functoriality | For f separated of finite type, Rf_! preserves D^b_c and D_ctf (imported finiteness; SGA 4 XVII 5.2.10). |

Used by. SGA 4 XVIII 3.2.6: Poincaré duality is stated for locally constant constructible
coefficients. EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality: the
category on which D_X is an anti-equivalence. DeligneWeightsAndPurity:DWP.7 (request to EDC.0):
D^b_c with Rf_*, Rf_! and the long exact sequences, for mixed complexes.
EtaleDualityAndPerverseSheaves:EDC.5: the perverse t-structure lives on D^b_c over a
coefficient field.

Unit tests:

- `TauCeti.EtaleDuality.isCtf_constant` (computation): For Λ = ℤ/ℓⁿ and X of finite type over a
  field with ℓ invertible, the constant sheaf Λ_X is in D_ctf(X, Λ).
- `TauCeti.EtaleDuality.not_isCtf_reduction` (non-example): For Λ = ℤ/ℓ², the sheaf (ℤ/ℓ)_X is
  constructible but not of finite Tor-dimension: (ℤ/ℓ) ⊗^L_{ℤ/ℓ²} ℤ/ℓ has nonzero cohomology in
  every degree ≤ 0.
- `TauCeti.EtaleDuality.not_isConstructible_infinite_skyscrapers` (non-example): On A¹ over an
  algebraically closed field, ⊕_{a ∈ ℕ} (i_a)_*Λ over infinitely many distinct closed points is
  not constructible.
- `TauCeti.EtaleDuality.isConstructible_zero` (degenerate): The zero complex is in D_ctf, and
  on empty X every complex is.

Acceptance. Over Spec Ω (Ω separably closed), D^b_c is the category of bounded complexes with
finitely generated total cohomology, and D_ctf is the category of perfect complexes of
Λ-modules. The constant sheaf Λ_X is in D_ctf; a direct sum of skyscraper sheaves at infinitely
many closed points of A¹ is not in D^b_c.

Depends on: `etale-derived-category`, `derived-tensor-and-internal-hom`,
`SchemeAndStackFoundations:SF.2`.

Source: SGA4-XVII, 5.2.10, p. 359.

### `tate-twist` — Tate twists Λ(i) and K(i), with the Frobenius convention ★

Node `EtaleDualityAndPerverseSheaves:EDC.0/tate-twist` (construction); planet “Tate twist”;
module `TauCeti/AlgebraicGeometry/Etale/Duality/TateTwist`.

Let X be a scheme, n ≥ 1 an integer invertible on X and Λ a ring with nΛ = 0. The Tate-twist
sheaf is Λ(1) := μ_n ⊗_{ℤ/n} Λ, where μ_n is the étale sheaf U ↦ μ_n(Γ(U, O_U)) (locally free
of rank one over ℤ/n); Λ(i) := Λ(1)^{⊗i} for i ≥ 0 and Λ(i) := Hom(Λ(−i), Λ) for i < 0. For K ∈
D(X, Λ), K(i) := K ⊗_Λ Λ(i), an exact autoequivalence. The construction does not depend on n:
for n = dn′ the d-th power map gives μ_n ⊗ ℤ/n′ ≅ μ_{n′} (SGA 4 XVIII 1.1.1.2). For X over 𝔽_q,
the geometric Frobenius acts on Λ(1)_x̄ by q⁻¹ (arithmetic Frobenius ζ ↦ ζ^q is its inverse),
so it acts on Λ(−d) by q^d.

Hypotheses. n invertible on X and nΛ = 0; for torsion Λ of order prime to the residue
characteristics, twists are defined as colimits over n (SGA 4 XVIII 1.1.1.4). The sheaf μ_n and
its exactness properties (Kummer sequence) are imported from ConstructibleEtale through
SchemeAndStackFoundations SF.2.

Construction and proof. (1) Λ(1) is locally free of rank one over Λ, so −⊗_Λ Λ(i) is exact and
needs no derivation; Λ(i) ⊗ Λ(j) ≅ Λ(i + j) canonically. (2) f^*(Λ(1)_S) ≅ Λ(1)_X because μ_n
is defined by the same formula on every scheme; hence f^*(K(i)) ≅ (f^*K)(i), and by the
projection formula Rf_*, Rf_! commute with twists. (3) Over a separably closed field a
primitive n-th root of unity gives an isomorphism Λ(1) ≅ Λ, not canonical; over 𝔽_q the Galois
action is the cyclotomic character.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.tateTwistSheaf` | data | Λ(1) ∈ EtaleSheaf Λ X, the sheaf μ_n ⊗ Λ, locally free of rank one. |
| `TauCeti.EtaleDuality.tateTwist` | constructor | tateTwist i : D(X, Λ) ⥤ D(X, Λ), K ↦ K(i), an exact autoequivalence. |
| `TauCeti.EtaleDuality.tateTwistZeroIso` | simp | K(0) ≅ K naturally. |
| `TauCeti.EtaleDuality.tateTwistAddIso` | relation | K(i)(j) ≅ K(i + j) naturally, associative and unital. |
| `TauCeti.EtaleDuality.tateTwist_pullback` | functoriality | f^*(K(i)) ≅ (f^*K)(i), and Rf_*(K(i)) ≅ (Rf_*K)(i), Rf_!(K(i)) ≅ (Rf_!K)(i). |
| `TauCeti.EtaleDuality.tateTwist_shift` | compatibility | (K[m])(i) ≅ (K(i))[m] compatibly with the triangulated structure. |
| `TauCeti.EtaleDuality.tateTwistSheaf_iso_of_sepClosed` | example | Over Spec Ω with Ω separably closed, a primitive n-th root of unity in Ω gives Λ(1) ≅ Λ. |
| `TauCeti.EtaleDuality.tateTwist_geomFrobenius` | characterisation | Over 𝔽_q, geometric Frobenius acts on the stalk Λ(i)_x̄ by q^{-i}. |

Used by. SGA 4 XVIII 2.9: the trace R^{2d}f_!f^*F(d) → F has a twist d. SGA 4 XVIII 3.2.5:
smooth purity f^! = f^*(d)[2d]. DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters:
Λ(1) with geometric Frobenius acting by q⁻¹ (request to EDC.0).
EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map: cycle classes live in H^{2r}(X, Λ(r)).

Unit tests:

- `TauCeti.EtaleDuality.tateTwist_sepClosed_trivial` (computation): Over Spec Ω with Ω
  separably closed of characteristic prime to n, Λ(1) ≅ Λ as sheaves.
- `TauCeti.EtaleDuality.tateTwist_zero` (degenerate): Λ(0) = Λ and K(0) ≅ K.
- `TauCeti.EtaleDuality.not_tateTwist_trivial_F2` (non-example): Over Spec 𝔽_2 with n = 3 and Λ
  = ℤ/3, Λ(1) is not isomorphic to Λ: Frobenius acts on μ_3(𝔽̄_2) by ζ ↦ ζ², which is not the
  identity.
- `TauCeti.EtaleDuality.tateTwist_frobenius_eigenvalue` (characterisation): Over 𝔽_q, geometric
  Frobenius acts on Λ(−1) by multiplication by q and on Λ(1) by q⁻¹.

Acceptance. The Frobenius convention: over 𝔽_q, Λ(−1) has geometric Frobenius eigenvalue q;
this is the convention of DeligneWeightsAndPurity and WeilConjectures. Independence of n via
(1.1.1.2), checked on the diagram (1.1.3.5) of Kummer sequences.

Depends on: `etale-derived-category`, `derived-tensor-and-internal-hom`,
`mathlib:rootsOfUnity`, `SchemeAndStackFoundations:SF.2`.

Source: SGA4-XVIII, 1.1.1, (1.1.1.1)-(1.1.1.3), p. 484; Milne-LEC, §16, p. 108.

### `derived-tensor-and-internal-hom` — Derived tensor product and internal Hom on D(X, Λ)

Node `EtaleDualityAndPerverseSheaves:EDC.0/derived-tensor-and-internal-hom` (comparison);
module `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; suggested declaration(s)
`TauCeti.EtaleDuality.derivedTensor_internalHom_adjunction`.

For X a scheme and Λ a commutative ring, the derived tensor product ⊗^L_Λ and the derived
internal Hom RHom_Λ on D(X, Λ) constructed by EnhancedDerivedSheaves E1 (K-flat and K-injective
replacements on the ringed site (X_ét, Λ)) satisfy: (i) Hom(K ⊗^L L, M) ≅ Hom(K, RHom(L, M))
naturally, so ⊗^L ⊣ RHom; (ii) (K ⊗^L L)_x̄ ≅ K_x̄ ⊗^L_Λ L_x̄ for every geometric point; (iii)
f^*(K ⊗^L L) ≅ f^*K ⊗^L f^*L and Hom(f^*K, M) ≅ Hom(K, Rf_*M); (iv) RHom(Λ_X, K) ≅ K and RΓ(X,
RHom(K, L)) ≅ RHom_X(K, L), whose H^0 is Hom_{D(X,Λ)}(K, L). For a closed immersion i, i^*
preserves ⊗^L, and for an étale j, j^* preserves RHom.

Hypotheses. Unbounded complexes are allowed: the replacements are the unbounded
K-flat/K-injective ones of EnhancedDerivedSheaves E1, not bounded-below injective resolutions.
No constructibility is needed for (i)-(iv).

Construction and proof. (1) Import the bifunctors and the adjunction from
EnhancedDerivedSheaves E1 for the site X_ét with constant ring Λ. (2) The stalk formula holds
because geometric stalks are exact, commute with tensor products and send K-flat complexes to
K-flat complexes of Λ-modules. (3) Pullback is exact and monoidal on sheaves and preserves
K-flatness, which gives (iii); the Leray identity RΓ(X, −) ∘ RHom = RHom_X is the global
sections of (i) (Stacks Cohomology on Sites, Lemmas 19.1 and 35.2, the two equalities used in
the proof of More Étale 11.5).

Acceptance. For X = Spec Ω with Ω separably closed these are the usual ⊗^L_Λ and RHom_Λ on
D(Λ). RHom(Λ_X, K) ≅ K and Λ_X is a unit for ⊗^L.

Depends on: `etale-derived-category`,
`EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`,
`EnhancedDerivedSheaves:E1/k-injective-and-k-flat-replacements`,
`mathlib:CategoryTheory.Adjunction`.

Source: Stacks-MoreEtale, Lemma 11.5 (tag 0GLC), proof.

### `cohomology-with-supports` — Cohomology with supports and the localization triangle ★

Node `EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports` (construction); planet
“Cohomology with supports”; module `TauCeti/AlgebraicGeometry/Etale/Duality/Supports`.

Let i : Z → X be a closed immersion with open complement j : U → X, and Λ a ring. On sheaves,
i^!F := i^{-1}(ker(F → j_*j^*F)) is the sheaf of sections of F supported on Z; it is right
adjoint to the exact functor i_*, so its right derived functor Ri^! : D(X, Λ) → D(Z, Λ) is
right adjoint to i_* on derived categories. The cohomology of X with supports in Z is RΓ_Z(X,
K) := RΓ(Z, Ri^!K), with groups H^q_Z(X, K). There is a distinguished triangle i_*Ri^!K → K →
Rj_*j^*K → (i_*Ri^!K)[1], hence RΓ_Z(X, K) ≅ fibre(RΓ(X, K) → RΓ(U, j^*K)) and the long exact
sequence of the pair … → H^q_Z(X, K) → H^q(X, K) → H^q(U, K) → H^{q+1}_Z(X, K) → …; for Z ⊂ Z′
closed there is the sequence of the triple. Excision: for φ : X′ → X étale with Z′ := φ^{-1}(Z)
→ Z an isomorphism, RΓ_Z(X, K) ≅ RΓ_{Z′}(X′, φ^*K). The construction retains the immersion i
and the category D(Z, Λ), and depends only on Z_red.

Hypotheses. Any scheme X; Z ⊂ X closed with its reduced or nonreduced structure (the étale
sites of Z and Z_red coincide). Λ any ring; no torsion or constructibility hypothesis.

Construction and proof. (1) i_* is exact and fully faithful on sheaves and i^{-1}i_* = id;
ker(F → j_*j^*F) is supported on Z, so i^! is right adjoint to i_* and preserves injectives.
(2) The localization triangle comes from the exact sequence 0 → i_*i^!I → I → j_*j^*I → 0 for
injective I (surjectivity: injective sheaves are flasque in the étale sense) applied to a
K-injective replacement. (3) Excision is Stacks More Étale Lemma 2.1 (growing sections) applied
to injective resolutions.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.supportSections` | data | i^! : EtaleSheaf Λ X ⥤ EtaleSheaf Λ Z, sections supported on Z. |
| `TauCeti.EtaleDuality.supportAdjunction` | universal-property | i_* ⊣ i^! on sheaves; i^!i_* ≅ id. |
| `TauCeti.EtaleDuality.derivedSupport` | constructor | Ri^! : D(X, Λ) ⥤ D(Z, Λ), right adjoint to i_* on derived categories. |
| `TauCeti.EtaleDuality.localizationTriangle` | relation | i_*Ri^!K → K → Rj_*j^*K → (i_*Ri^!K)[1] is distinguished, naturally in K. |
| `TauCeti.EtaleDuality.cohomologyWithSupports` | projection | H^q_Z(X, K) := H^q(Z, Ri^!K), a Λ-module. |
| `TauCeti.EtaleDuality.cohomologyWithSupports_exact` | relation | The long exact sequence of the pair (X, U) and of a triple Z ⊂ Z′. |
| `TauCeti.EtaleDuality.cohomologyWithSupports_excision` | characterisation | For φ : X′ → X étale with φ^{-1}(Z) → Z an isomorphism, H^q_Z(X, K) ≅ H^q_{φ^{-1}Z}(X′, φ^*K). |
| `TauCeti.EtaleDuality.derivedSupport_reduced` | characterisation | Ri^! depends only on the closed subset: the thickening Z_red → Z identifies the étale sites and the functors. |
| `TauCeti.EtaleDuality.localizationTriangle_distinguished` | relation | For j the open complement of i, the localization triangle is distinguished. |
| `TauCeti.EtaleDuality.forgetSupports` | projection | The map H^q_Z(X, K) → H^q(X, K) forgetting supports. |
| `TauCeti.EtaleDuality.restrictToOpen` | projection | The restriction H^q(X, K) → H^q(U, j^*K) to the open complement. |

Used by. SGA 4 XVIII 3.1.8 (ii): f^! for a closed immersion is sections with support. Milne LEC
16.1 and 23.1: purity and semi-purity are statements about H^q_Z(X, −).
EtaleDualityAndPerverseSheaves:EDC.3/fundamental-class: the fundamental class lives in
H^{2c}_Z(X, Λ(c)). EtaleDualityAndPerverseSheaves:EDC.5: the open-closed recollement uses i^!
and the localization triangle.

Unit tests:

- `TauCeti.EtaleDuality.cohomologyWithSupports_self` (degenerate): For Z = X (i = id), H^q_Z(X,
  K) = H^q(X, K).
- `TauCeti.EtaleDuality.cohomologyWithSupports_empty` (degenerate): For Z = ∅, H^q_Z(X, K) = 0.
- `TauCeti.EtaleDuality.cohomologyWithSupports_origin_line` (computation): For X = A¹_Ω, Ω
  algebraically closed, Z = {0} and Λ = ℤ/n with n invertible: H²_Z(X, Λ(1)) ≅ Λ and H^q_Z(X,
  Λ(1)) = 0 for q ≠ 2.
- `TauCeti.EtaleDuality.not_cohomologyWithSupports_eq_cohomology_of_support` (non-example):
  H⁰_{0}(A¹_Ω, Λ) = 0 while H⁰({0}, Λ) = Λ: cohomology with supports is not the cohomology of
  Z.

Acceptance. Z = X gives RΓ_Z = RΓ; Z = ∅ gives 0. For X = A¹ over an algebraically closed
field, Z = {0}, Λ = ℤ/n: H^q_Z(X, Λ(1)) is Λ for q = 2 and 0 otherwise (Kummer theory on A¹ −
{0}; this is EDC.3's purity for a point on a curve).

Depends on: `etale-derived-category`, `mathlib:AlgebraicGeometry.IsClosedImmersion`,
`mathlib:AlgebraicGeometry.IsOpenImmersion`, `mathlib:CategoryTheory.Adjunction`,
`SchemeAndStackFoundations:SF.2`.

Source: SGA4-XVIII, 3.1.8 (ii), p. 571; Stacks-MoreEtale, Lemma 2.1 (tag 0F6F); Milne-LEC, §23,
p. 138.

### `coefficient-change` — Change of coefficients and the reduction identities

Node `EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change` (construction); module
`TauCeti/AlgebraicGeometry/Etale/Duality/Coefficients`.

Let φ : Λ → Λ′ be a homomorphism of commutative rings. Restriction of scalars ρ : D(X, Λ′) →
D(X, Λ) is exact; extension of scalars Λ′ ⊗^L_Λ − : D(X, Λ) → D(X, Λ′) is its left adjoint. ρ
commutes with f^*, Rf_*, Rf_! and Ri^! (for i a closed immersion); extension commutes with f^*
and, for Λ and Λ′ torsion, with Rf_! (projection formula). In particular, for an ideal I ⊂ Λ
(reduction), (Λ/I) ⊗^L_Λ Rf_!K ≅ Rf_!((Λ/I) ⊗^L_Λ K) and RΓ_c(X_k̄, (Λ/I) ⊗^L K) ≅ (Λ/I) ⊗^L
RΓ_c(X_k̄, K). These identities use derived tensor products; the underived tensor product is
not exact.

Hypotheses. Λ, Λ′ commutative; for the Rf_! statements both torsion and f compactifiable. The
identities hold in the unbounded derived categories; no finite Tor-dimension hypothesis.

Construction and proof. (1) Adjunction: Hom_{Λ′}(Λ′ ⊗^L_Λ K, L) ≅ Hom_Λ(K, ρL) from the
sheaf-level adjunction and K-flat replacements (EnhancedDerivedSheaves E1). (2) ρ commutes with
f^* trivially and with Rf_* because ρ preserves K-injectives' acyclicity for f_* (flasque
sheaves); with Rf_! because Rf_! = R f̄_* ∘ j_! on a compactification (SGA 4 XVII 5.1.14,
Stacks More Étale Remark 10.8). (3) Extension commutes with Rf_! by the projection formula
Rf_!E ⊗^L K ≅ Rf_!(E ⊗^L f^{-1}K) with K = Λ′ (Stacks More Étale Lemma 10.7; SGA 4 XVII 5.2.9).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.restrictScalars` | constructor | ρ_φ : D(X, Λ′) ⥤ D(X, Λ), exact and triangulated. |
| `TauCeti.EtaleDuality.extendScalars` | constructor | Λ′ ⊗^L_Λ − : D(X, Λ) ⥤ D(X, Λ′). |
| `TauCeti.EtaleDuality.extendRestrictAdjunction` | universal-property | extendScalars φ ⊣ restrictScalars φ. |
| `TauCeti.EtaleDuality.restrictScalars_lowerShriek` | compatibility | ρ ∘ Rf_! ≅ Rf_! ∘ ρ for f compactifiable and torsion coefficients. |
| `TauCeti.EtaleDuality.extendScalars_lowerShriek` | compatibility | Λ′ ⊗^L Rf_!K ≅ Rf_!(Λ′ ⊗^L K) (the reduction identity). |
| `TauCeti.EtaleDuality.restrictScalars_derivedSupport` | compatibility | ρ ∘ Ri^! ≅ Ri^! ∘ ρ for a closed immersion i. |
| `TauCeti.EtaleDuality.restrictScalars_comp` | functoriality | ρ_{ψ∘φ} ≅ ρ_φ ∘ ρ_ψ and ρ_id ≅ id. |

Used by. SGA 4 XVIII 3.1.12.1: f^! commutes with restriction of scalars ('le faisceau d'anneaux
joue un rôle bidon').
EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality: passage
between O_E/πⁿ levels uses the reduction identity. EtaleDualityAndPerverseSheaves:EDC.6:
normalized adic systems are built from reduction maps.

Unit tests:

- `TauCeti.EtaleDuality.extendScalars_id` (degenerate): For φ = id, extension and restriction
  are isomorphic to the identity.
- `TauCeti.EtaleDuality.extendScalars_reduction_unbounded` (computation): For Λ = ℤ/ℓ², Λ′ =
  ℤ/ℓ: ℋ^{-q}(Λ′ ⊗^L_Λ Λ′_X) ≅ Λ′_X for all q ≥ 0.
- `TauCeti.EtaleDuality.restrictScalars_constant` (compatibility): ρ(Λ′_X) is the constant
  sheaf with value Λ′ regarded as a Λ-module.
- `TauCeti.EtaleDuality.not_extendScalars_underived_exact` (non-example): The underived tensor
  product with ℤ/ℓ is not exact: tensoring the injection ℤ → ℤ, x ↦ ℓx, with ℤ/ℓ gives the zero
  map on ℤ/ℓ ≠ 0 (shown for ℓ = 2); coefficient extension must be derived.

Acceptance. Λ = ℤ/ℓ², Λ′ = ℤ/ℓ: (ℤ/ℓ) ⊗^L_{ℤ/ℓ²} (ℤ/ℓ)_X has ℋ^{-q} ≅ (ℤ/ℓ)_X for every q ≥ 0,
so extension of scalars leaves D^b. Restriction of scalars of Λ′_X is the constant sheaf Λ′
regarded as a Λ-module.

Depends on: `etale-derived-category`, `derived-tensor-and-internal-hom`,
`SchemeAndStackFoundations:SF.2`,
`EnhancedDerivedSheaves:E1/presentability-and-derived-tensor`.

Source: Stacks-MoreEtale, Remark 11.8 (tag 0GLF); SGA4-XVII, Proposition 5.2.9, p. 358.

### `enhanced-compact-pushforward` — The enhanced compactly supported direct image Rf_! ★

Node `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward` (construction); planet
“Enhanced compactly supported direct image”; module
`TauCeti/AlgebraicGeometry/Etale/Duality/LowerShriek`.

Let f : X → S be compactifiable (separated, of finite type, S quasi-compact quasi-separated),
with fibres of dimension < d, and Λ a torsion ring. Choose a compactification X → X̄ (open
immersion j) followed by f̄ : X̄ → S proper. The complex-level functor f_!^•(F) := f̄_* τ_{≤2d}
Cℓ^*(j_!F), with Cℓ^* the modified canonical flasque resolution (filtered colimit of canonical
flasque resolutions of constructible subsheaves), is exact, commutes with filtered colimits and
computes Rf_! (SGA 4 XVIII 3.1.4.5-3.1.4.7). It defines an exact functor of the
EnhancedDerivedSheaves enhancements Rf_!^{enh} : 𝒟(X, Λ) → 𝒟(S, Λ) that preserves all small
colimits and whose homotopy-category functor is the imported finite-level Rf_! : D(X, Λ) → D(S,
Λ) of CompactSupport; the equivalences (gh)_!^{enh} ≃ g_!^{enh} h_!^{enh} and the base-change
equivalences are coherent, and the construction is independent of the compactification up to
coherent equivalence.

Hypotheses. f separated of finite type over a quasi-compact quasi-separated S (compactifiable
by Nagata, imported from CompactSupport). Λ torsion; the unbounded category is used, which
needs the finite cohomological dimension of EDC.0/compact-pushforward-amplitude-and-colimits.
This lifts the imported Rf_!; it is not a second definition of Rf_! (RS-19: EDC.0 does not own
the finite-level Rf_!).

Construction and proof. (1) Truncation: for every sheaf F the terms of τ_{≤2d}Cℓ^*j_!F are
f̄_*-acyclic: for i < 2d they are filtered colimits of flasque sheaves, and for i = 2d R^k f̄_*
of the term is R^{k+2d}f_!F = 0 (SGA 4 XVIII 3.1.4.5, using XVII 5.2.8.1). (2) So f_!^• is an
exact functor from sheaves to bounded complexes commuting with filtered colimits; applied
termwise to dg models it gives a dg functor between the K-injective/K-flat dg models of
EnhancedDerivedSheaves E1, hence a functor of the dg nerves. (3) Its homotopy-category functor
is the imported Rf_! (both are R f̄_* ∘ j_!), and it preserves small colimits because it is
exact and commutes with direct sums (EDC.0/compact-pushforward-amplitude-and-colimits). (4)
Composition and base change: use the coherent diagrams of ringed topoi of
EnhancedDerivedSheaves E3 (the Liu-Zheng construction) over the category of compactifiable
S-morphisms, and Beck-Chevalley mates; independence of the compactification is the
contractibility of the category of compactifications (CompactSupport) transported to the
enhancement.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.enhancedLowerShriek` | constructor | Rf_!^{enh} : 𝒟(X, Λ) → 𝒟(S, Λ), an exact functor of the EnhancedDerivedSheaves stable categories. |
| `TauCeti.EtaleDuality.enhancedLowerShriek_homotopy` | compatibility | The homotopy-category functor of Rf_!^{enh} is isomorphic to the imported Rf_! : D(X, Λ) ⥤ D(S, Λ). |
| `TauCeti.EtaleDuality.enhancedLowerShriek_preservesColimits` | instance | Rf_!^{enh} preserves all small colimits. |
| `TauCeti.EtaleDuality.enhancedLowerShriek_comp` | functoriality | (g ∘ h)_!^{enh} ≃ g_!^{enh} ∘ h_!^{enh}, with the coherent associativity and unit data. |
| `TauCeti.EtaleDuality.enhancedLowerShriek_baseChange` | compatibility | For a cartesian square, g^*Rf_!^{enh} ≃ Rf′_!^{enh}g′^*, coherently (proper base change). |
| `TauCeti.EtaleDuality.lowerShriek_openImmersion` | simp | For an open immersion j, Rj_! is extension by zero j_!, left adjoint to j^*. |
| `TauCeti.EtaleDuality.lowerShriek_proper` | simp | For proper f, Rf_! ≅ Rf_*. |

Used by. SGA 4 XVIII 0.1 (I)-(III): existence of the adjoint needs base change, finite
cohomological dimension with colimits, and a complex-level model.
EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image: f^! is the right
adjoint of Rf_!^{enh}, produced by the adjoint functor theorem of EnhancedDerivedSheaves E3.
ExcursionOperatorsAndSpectralAction:ES7 and GlobalShtukasAndFunctionFieldLanglands (requests to
EDC.0): the six operations on schemes, with their coherence.

Unit tests:

- `TauCeti.EtaleDuality.lowerShriek_openImmersion_stalk` (computation): For j : U → X open and
  K ∈ D(U, Λ), (Rj_!K)_x̄ = 0 for x̄ outside U and = K_x̄ for x̄ in U.
- `TauCeti.EtaleDuality.lowerShriek_finiteEtale` (computation): For f finite étale, Rf_! ≅ f_*
  is exact (no higher cohomology sheaves).
- `TauCeti.EtaleDuality.lowerShriek_affineLine` (computation): For a : A¹_Ω → Spec Ω, Ω
  algebraically closed, n invertible: H^q(Ra_!Λ(1)) = Λ for q = 2 and 0 for q ≠ 2.
- `TauCeti.EtaleDuality.not_lowerShriek_eq_pushforward` (non-example): For j : A¹_Ω → P¹_Ω,
  Rj_!Λ ≇ Rj_*Λ: their stalks at ∞ are 0 and Λ (in degree 0) respectively.

Acceptance. Open immersion j : U → X: Rj_!^{enh} is extension by zero. Finite étale f:
Rf_!^{enh} = f_* (exact). Structure map a : A¹_Ω → Spec Ω, Ω algebraically closed:
H^q(Ra_!Λ(1)) is Λ for q = 2 and 0 otherwise, the same as the imported Rf_!.

Depends on: `etale-derived-category`, `compact-pushforward-amplitude-and-colimits`,
`EnhancedDerivedSheaves:E1/enhanced-derived-category`,
`EnhancedDerivedSheaves:E3/coherent-diagrams-of-ringed-topoi`,
`EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`, `SchemeAndStackFoundations:SF.2`.

Source: SGA4-XVIII, 0.1 (III), p. 481; SGA4-XVIII, proof of 3.1.4, (3.1.4.7), p. 568-569.

### `compact-pushforward-amplitude-and-colimits` — Rf_! has finite amplitude and commutes with direct sums and filtered colimits

Node `EtaleDualityAndPerverseSheaves:EDC.0/compact-pushforward-amplitude-and-colimits`
(theorem); module `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; suggested declaration(s)
`TauCeti.EtaleDuality.lowerShriek_amplitude,
TauCeti.EtaleDuality.lowerShriek_preservesCoproducts`.

Let f : X → S be compactifiable with fibres of dimension ≤ d and Λ a torsion ring. (a) For
every sheaf F of Λ-modules, (R^q f_!F)_s̄ = H^q_c(X_s̄, F) for each geometric point s̄ of S,
and R^q f_!F = 0 for q > 2d; R^{2d}f_! is right exact. (b) Hence Rf_! has finite cohomological
amplitude and is defined on the unbounded D(X, Λ); there is N with H^i(Rf_!E) = 0 for i ∉ [a, b
+ N] when H^i(E) = 0 for i ∉ [a, b]. (c) Rf_! : D(X, Λ) → D(S, Λ) commutes with arbitrary
direct sums, and the functors R^q f_! commute with filtered colimits of sheaves. (d) Rf_!
preserves D^b_c and D_ctf (imported finiteness).

Hypotheses. f compactifiable; Λ torsion (for (c) on the unbounded category). The finite-level
Rf_!, its stalk formula and its cohomological dimension are CompactSupport's (imported); this
node records them in the form the adjoint construction consumes.

Construction and proof. (1) (a) is SGA 4 XVII 5.2.8 and 5.2.8.1: reduce by base change to S the
spectrum of an algebraically closed field and use cohomological dimension 2 dim X̄ of a
compactification (SGA 4 X 4.3). (2) (b) follows from (a) by the way-out lemma (Stacks More
Étale Lemma 10.2, SGA 4 XVIII Remark 3.1.5). (3) (c): reduce to an open immersion (j_! is a
left adjoint) and a proper morphism (Rf_* commutes with direct sums for torsion Λ by finite
cohomological dimension), Stacks More Étale Lemma 10.1; filtered colimits by SGA 4 XVIII 0.1
(II). (4) (d) is imported from CompactSupport and the finiteness theorem through
SchemeAndStackFoundations SF.2.

Acceptance. For X = A^d over an algebraically closed field, R^{2d}a_!Λ(d) ≅ Λ and R^q a_!Λ = 0
for q > 2d. For f finite, Rf_! = f_* is exact, so the amplitude is [0, 0].

Depends on: `etale-derived-category`, `SchemeAndStackFoundations:SF.2`,
`mathlib:CategoryTheory.Triangulated.TStructure`.

Source: SGA4-XVII, Corollaire 5.2.8.1, p. 358; Stacks-MoreEtale, Lemma 10.1 (tag 0G29);
SGA4-XVIII, 0.1 (II), p. 481.

## EDC.1:adjoint — the exceptional inverse image, before smooth purity

The right adjoint f^! of the enhanced Rf_! is produced by the adjoint functor theorem of
EnhancedDerivedSheaves E3, not stored as a field. Its homotopy-category functor agrees with SGA
4 XVIII's partial adjoint on D⁺ and with the Stacks Project's Brown-representability adjoint on
D, by uniqueness of adjoints. The dualizing complex and the Verdier dual are defined here
without any biduality claim; the exchange isomorphisms D Rf_! ≅ Rf_* D and D f^* ≅ f^! D are
formal at this stage, while their duals wait for biduality.

### `exceptional-inverse-image` — The exceptional inverse image f^!, right adjoint to Rf_! ★

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image` (construction);
planet “Exceptional inverse image f^!”; module
`TauCeti/AlgebraicGeometry/Etale/Duality/UpperShriek`.

Let f : X → S be compactifiable and Λ a torsion ring. The exceptional inverse image f^! : D(S,
Λ) → D(X, Λ) is the right adjoint of Rf_!: it is the homotopy-category functor of the right
adjoint f^!_{enh} of Rf_!^{enh}, which exists by the adjoint functor theorem for
colimit-preserving functors of presentable stable categories (EnhancedDerivedSheaves E3) and is
exact. There are natural isomorphisms Hom_{D(S,Λ)}(Rf_!K, L) ≅ Hom_{D(X,Λ)}(K, f^!L) with unit
K → f^!Rf_!K and counit Rf_!f^!L → L; f^! is triangulated. On D⁺ it is SGA 4 XVIII's partial
adjoint (3.1.4) and the derived functor of the complex-level f^{!•} right adjoint to f_!^•; on
the unbounded category it agrees with the Brown-representability adjoint of Stacks More Étale
Lemma 11.1, by uniqueness of adjoints. If f has fibres of dimension ≤ d and H^i(L) = 0 for i ≤
k then H^i(f^!L) = 0 for i ≤ k − 2d. For f étale, f^! = f^* with counit the trace f_!f^* → id;
for f quasi-finite, f^! is the right derived functor of the sheaf-level right adjoint of f_!;
for a closed immersion it is Ri^! of EDC.0/cohomology-with-supports.

Hypotheses. f separated of finite type over a quasi-compact quasi-separated base S; Λ torsion.
No smoothness, purity or constructibility is assumed: this is the formal prefix of SGA 4 XVIII
§3.1, independent of §§1-2 (XVIII 0.2). The right adjoint is produced, not assumed
(EnhancedDerivedSheaves E3).

Construction and proof. (1) Rf_!^{enh} preserves small colimits between presentable stable
categories (EDC.0/enhanced-compact-pushforward), so EnhancedDerivedSheaves E3 produces its
right adjoint f^!_{enh} with unit and counit; pass to homotopy categories. (2) Agreement with
SGA 4 XVIII 3.1.4 on D⁺ and with Stacks 0G2C on D: both are right adjoints of the same functor
Rf_!, hence canonically isomorphic. (3) Amplitude: by adjunction with L′ := τ_{≤k−2d}f^!L,
Rf_!L′ has cohomology in degrees ≤ k so Hom(Rf_!L′, L) = 0 (XVIII 3.1.7 (i), Stacks 0GLA). (4)
Étale f: f_! is left adjoint to f^* with the trace as counit (SGA 4 XVII 6.2.11), so f^! = f^*;
quasi-finite f: Rf_! = f_! is exact and commutes with filtered colimits, so it has a
sheaf-level right adjoint whose derived functor is f^! (XVIII 3.1.8 (i)); closed immersion:
XVIII 3.1.8 (ii).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.upperShriek` | constructor | f^! : D(S, Λ) ⥤ D(X, Λ) for f compactifiable and Λ torsion. |
| `TauCeti.EtaleDuality.lowerShriekUpperShriekAdjunction` | universal-property | Rf_! ⊣ f^!, with unit and counit. |
| `TauCeti.EtaleDuality.upperShriek_commShift` | instance | f^! commutes with the shift functors. |
| `TauCeti.EtaleDuality.upperShriek_isTriangulated` | instance | f^! is a triangulated functor. |
| `TauCeti.EtaleDuality.upperShriek_id` | simp | id^! ≅ id. |
| `TauCeti.EtaleDuality.upperShriek_etale` | simp | For f étale (separated, of finite type), f^! ≅ f^* with counit the trace f_!f^* → id. |
| `TauCeti.EtaleDuality.upperShriek_closedImmersion` | compatibility | For a closed immersion i, i^! ≅ Ri^! (derived sections with support). |
| `TauCeti.EtaleDuality.upperShriek_amplitude` | other | If f has fibres of dimension ≤ d and L ∈ D^{≥k+1}, then f^!L ∈ D^{≥k+1−2d}. |
| `TauCeti.EtaleDuality.upperShriek_quasiFinite` | characterisation | For f quasi-finite, f^! is the right derived functor of the right adjoint of the exact functor f_! on sheaves. |

Used by. SGA 4 XVIII 3.2.5: Poincaré duality identifies f^! for smooth f. SGA 7 XIII
2.1.6-2.1.7 via LefschetzPencilsAndVanishingCycles:LPV.0 (request to EDC.1): Rf^! for
quasi-finite and separated finite-type morphisms, for the functorialities of RΨ.
DeligneWeightsAndPurity:DWP.7 (request to EDC.1): f^! for separated finite-type morphisms over
𝔽_q and over ℤ[1/ℓ]. EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex: K_X :=
a^!Λ. EtaleDualityAndPerverseSheaves:EDC.5: recollement uses i^! and j^! = j^*.

Unit tests:

- `TauCeti.EtaleDuality.upperShriek_id_eq` (degenerate): For f = 𝟙_X, f^! ≅ 𝟭 (D(X, Λ)).
- `TauCeti.EtaleDuality.upperShriek_openImmersion` (computation): For j : U → X an open
  immersion, j^!K ≅ j^*K, and the counit j_!j^*K → K is extension by zero of the identity.
- `TauCeti.EtaleDuality.upperShriek_point_line` (computation): For i : {0} → A¹_Ω (Ω
  algebraically closed, n invertible, Λ = ℤ/n), i^!Λ ≅ Λ(−1)[−2].
- `TauCeti.EtaleDuality.not_upperShriek_eq_pullback_closed` (non-example): For i : {0} → A¹_Ω,
  i^!Λ ≇ i^*Λ = Λ: the exceptional inverse image of a closed immersion is not the pullback.

Acceptance. X = S, f = id: f^! = id. j : U → X open immersion: j^! = j^*. i : {0} → A¹_Ω, Ω
algebraically closed: i^!Λ ≅ Λ(−1)[−2] (computed by EDC.3/smooth-pair-purity), so f^! ≠ f^* for
closed immersions.

Depends on: `enhanced-compact-pushforward`, `compact-pushforward-amplitude-and-colimits`,
`cohomology-with-supports`,
`EnhancedDerivedSheaves:E3/adjoint-functor-theorem-and-localisations`,
`mathlib:CategoryTheory.Adjunction`, `mathlib:CategoryTheory.Functor.IsTriangulated`,
`mathlib:CategoryTheory.Functor.CommShift`, `mathlib:AlgebraicGeometry.Etale`,
`mathlib:AlgebraicGeometry.LocallyQuasiFinite`.

Source: SGA4-XVIII, Théorème 3.1.4, p. 567; SGA4-XVIII, Définition 3.1.6, p. 570-571;
Stacks-MoreEtale, Lemma 11.1 (tag 0G2C); SGA4-XVIII, Proposition 3.1.8, p. 571.

### `upper-shriek-pseudofunctor` — Composition and localization for f^!

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/upper-shriek-pseudofunctor` (theorem);
module `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; suggested declaration(s)
`TauCeti.EtaleDuality.upperShriek_comp`.

For compactifiable S-morphisms X →h Y →g Z there are isomorphisms c^!_{g,h} : h^!g^! ≅ (gh)^!,
transposed from the composition isomorphism Rg_!Rh_! ≅ R(gh)_!, satisfying the cocycle
condition for triple composites and unit conditions; so the categories D(X, Λ) form a category
fibred (by f^!) and cofibred (by Rf_!) over compactifiable morphisms. For a commutative square
of compactifiable morphisms there is the cobase-change map Rf′_!g′^! → g^!Rf_!. For k : V → S
étale with X_V := X ×_S V, there is the localization isomorphism k_X^*f^! ≅ f_V^!k^*.

Hypotheses. Compactifiable morphisms over a quasi-compact quasi-separated base; Λ torsion.

Construction and proof. (1) Transpose the composition isomorphism of
EDC.0/enhanced-compact-pushforward by uniqueness of adjoints; the coherence of the enhancement
(EnhancedDerivedSheaves E3 mates) gives the cocycle condition (SGA 4 XVIII 3.1.13.1). (2)
Localization: k_!Rf_{V!} ≅ Rf_!k_{X!} transposes, using k^! = k^* for étale k
(EDC.1:adjoint/exceptional-inverse-image), to (3.1.10.1).

Acceptance. For h = id, c^!_{g,id} is the identity. For two open immersions U ⊂ V ⊂ X, the
composite of restrictions is restriction.

Depends on: `exceptional-inverse-image`, `enhanced-compact-pushforward`,
`EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`.

Source: SGA4-XVIII, 3.1.13, (3.1.13.1), p. 576; SGA4-XVIII, proof of 3.1.10, (3.1.10.1), p.
573.

### `sheafified-adjunction` — The sheafified adjunction Rf_*RHom(L, f^!K) ≅ RHom(Rf_!L, K) and the induction formulas

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction` (theorem); module
`TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; suggested declaration(s)
`TauCeti.EtaleDuality.sheafified_adjunction`.

Let f : X → S be compactifiable and Λ torsion. (a) For K ∈ D(S, Λ) and L ∈ D(X, Λ), the
composite Rf_*RHom(L, f^!K) → RHom(Rf_!L, Rf_!f^!K) → RHom(Rf_!L, K) is an isomorphism; taking
RΓ gives RHom_X(L, f^!K) ≅ RHom_S(Rf_!L, K). (b) Induction formula: for K ∈ D(S, Λ) and L ∈
D(S, Λ), RHom(f^*K, f^!L) ≅ f^!RHom(K, L). (c) Base change: for a cartesian square with g : S′
→ S and f′ : X′ → S′, Rg′_*f′^!L ≅ f^!Rg_*L. (d) Coefficient restriction: for a ring map Λ → Λ′
of torsion rings, ρf^! ≅ f^!ρ.

Hypotheses. f compactifiable, Λ torsion; unbounded complexes allowed (Stacks); SGA 4 XVIII
states (a)-(c) with K ∈ D⁻, L ∈ D⁺, which the unbounded version contains. No smoothness or
constructibility.

Construction and proof. (1) (a) Test against M ∈ D(S, Λ): Hom(M, Rf_*RHom(L, f^!K)) =
Hom(f^{-1}M ⊗^L L, f^!K) = Hom(Rf_!(f^{-1}M ⊗^L L), K) = Hom(M ⊗^L Rf_!L, K) = Hom(M,
RHom(Rf_!L, K)), the fourth equality being the projection formula (Stacks More Étale Lemmas
11.5-11.6; SGA 4 XVIII 3.1.10). (2) (b)-(d) are the three special cases of the induction
isomorphism (3.1.11.4) of SGA 4 XVIII 3.1.12, transposed from base change and the projection
formula (XVII 5.2.6, 5.2.9) by uniqueness of adjoints; (c) is also Stacks 0GLE, (d) Stacks
0GLF.

Acceptance. For f étale, (a) reduces to f_*RHom(L, f^*K) ≅ RHom(f_!L, K), the usual adjunction
formula. For f = i a closed immersion and L = Λ_X, (a) gives i_*Ri^!K ≅ RHom(i_*Λ_Z, K) =
RHom_Z-supported, the local-cohomology form.

Depends on: `exceptional-inverse-image`, `derived-tensor-and-internal-hom`,
`coefficient-change`, `SchemeAndStackFoundations:SF.2`.

Source: Stacks-MoreEtale, Lemma 11.5 (tag 0GLC); SGA4-XVIII, Corollaires 3.1.12.2-3.1.12.3, p.
575-576; SGA4-XVIII, Corollaire 3.1.12.1, p. 575.

### `local-cohomology-identification` — i_*i^! is local cohomology

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/local-cohomology-identification` (theorem);
module `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; suggested declaration(s)
`TauCeti.EtaleDuality.upperShriek_closedImmersion_eq_derivedSupport`.

For a closed immersion i : Z → X with open complement j : U → X and Λ torsion, the exceptional
inverse image i^! of EDC.1:adjoint/exceptional-inverse-image is canonically isomorphic to Ri^!
of EDC.0/cohomology-with-supports, compatibly with the adjunctions i_* ⊣ i^!; hence i_*i^!K ≅
RHom(i_*Λ_Z, K) (the local cohomology complex, by the sheafified adjunction for the finite
morphism i), RΓ(Z, i^!K) = RΓ_Z(X, K), and there is a distinguished triangle i_*i^!K → K →
Rj_*j^*K → with j^! = j^*.

Hypotheses. i a closed immersion (finite, hence compactifiable with Ri_! = i_*); Λ torsion.

Construction and proof. (1) Ri_! = i_* (finite morphism); the right adjoint of i_* on derived
categories is Ri^! (EDC.0/cohomology-with-supports); uniqueness of adjoints identifies it with
i^!. (2) The triangle is the localization triangle of EDC.0/cohomology-with-supports with Rj_*
= j_* ∘ (right adjoint of j^* = j^!).

Acceptance. Z = X: i^! = id; Z = ∅: i^! = 0.

Depends on: `exceptional-inverse-image`, `cohomology-with-supports`, `sheafified-adjunction`.

Source: SGA4-XVIII, Proposition 3.1.8 (ii), p. 571.

### `dualizing-complex` — The dualizing complex K_X = a^!Λ ★

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex` (definition); planet
“Dualizing complex”; module `TauCeti/AlgebraicGeometry/Etale/Duality/Dualizing`.

Let k be a field, n invertible in k, Λ a ring with nΛ = 0, and a : X → Spec k separated of
finite type. The dualizing complex of X is K_X := a^!Λ ∈ D(X, Λ). More generally, for f : X → S
compactifiable, the relative dualizing complex is K_{X/S} := f^!Λ_S. For an étale (separated,
finite type) map u : V → X, u^*K_X ≅ K_V; for a closed immersion i : Z → X, i^!K_X ≅ K_Z; for
compactifiable X → Y → S, K_{X/S} ≅ h^!K_{Y/S}. No identification K_X ≅ Λ(d)[2d] is part of
this definition: it is the theorem EDC.1:biduality/dualizing-complex-of-smooth-scheme, after
smooth purity.

Hypotheses. X separated of finite type over a field k (or compactifiable over a quasi-compact
quasi-separated S); Λ torsion, n invertible. Defined before and independently of smooth purity
and biduality (SGA 4 XVIII 0.2).

Construction and proof. (1) Apply EDC.1:adjoint/exceptional-inverse-image to the structure
morphism; the restriction and composition formulas are the étale case and the
pseudofunctoriality (EDC.1:adjoint/upper-shriek-pseudofunctor).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.dualizingComplex` | data | K_X := a^!Λ ∈ D(X, Λ) for a : X → Spec k separated of finite type. |
| `TauCeti.EtaleDuality.relativeDualizingComplex` | data | K_{X/S} := f^!Λ_S for f compactifiable. |
| `TauCeti.EtaleDuality.dualizingComplex_spec` | simp | K_{Spec k} ≅ Λ. |
| `TauCeti.EtaleDuality.dualizingComplex_etale` | compatibility | u^*K_X ≅ K_V for u : V → X étale separated of finite type. |
| `TauCeti.EtaleDuality.dualizingComplex_closedImmersion` | compatibility | i^!K_X ≅ K_Z for a closed immersion i : Z → X. |
| `TauCeti.EtaleDuality.relativeDualizingComplex_comp` | functoriality | K_{X/S} ≅ h^!K_{Y/S} for compactifiable X →h Y → S. |

Used by. SGA 4 XVIII 3.2.6: global duality RΓ(X, D F) ≅ RHom(RΓ_c(X, F), Λ).
EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual: D_X := RHom(−, K_X).
DeligneWeightsAndPurity:DWP.7 (request to EDC.1): K_X = Ra^!ℚ̄_ℓ and D = RHom(−, K_X).
EtaleDualityAndPerverseSheaves:EDC.5: the self-duality of the middle perversity is measured
against K_X.

Unit tests:

- `TauCeti.EtaleDuality.dualizingComplex_point` (degenerate): For X = Spec k, K_X ≅ Λ.
- `TauCeti.EtaleDuality.dualizingComplex_finiteSeparable` (computation): For X = Spec L with
  L/k finite separable, K_X ≅ Λ_X.
- `TauCeti.EtaleDuality.dualizingComplex_curve` (computation): For X a smooth curve over an
  algebraically closed k, K_X ≅ Λ(1)[2] (after EDC.2:trace-purity/smooth-purity).
- `TauCeti.EtaleDuality.not_dualizingComplex_shift_of_constant` (non-example): For X = Spec k ⊔
  A¹_k (k algebraically closed), K_X restricts to Λ on the point and to Λ(1)[2] on the line, so
  K_X is not Λ_X(d)[2d] for any single d.

Acceptance. K_{Spec k} = Λ. For X = Spec L, L/k finite separable, K_X = Λ_X (a étale).

Depends on: `exceptional-inverse-image`, `upper-shriek-pseudofunctor`.

Source: SGA4-XVIII, 3.2.6, (3.2.6.1), p. 586; Stacks-MoreEtale, Lemma 11.3 (tag 0GL9).

### `verdier-dual` — The Verdier duality functor D_X = RHom(−, K_X) ★

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual` (definition); planet “Verdier
duality functor”; module `TauCeti/AlgebraicGeometry/Etale/Duality/VerdierDual`.

For X separated of finite type over a field k (n invertible, Λ torsion), the Verdier duality
functor is the contravariant triangulated functor D_X : D(X, Λ)^op → D(X, Λ), D_X(K) := RHom(K,
K_X). It satisfies D_X(K[m]) ≅ D_X(K)[−m], D_X(Λ_X) ≅ K_X, D_X(K ⊗^L L) ≅ RHom(K, D_X L), and
there is a natural evaluation morphism ev_K : K → D_X D_X K. For u : V → X étale, u^*D_X ≅ D_V
u^*. Biduality (ev_K an isomorphism on D^b_c) is not part of this definition: it is
EDC.1:biduality/constructible-biduality.

Hypotheses. X separated of finite type over a field; Λ torsion; the functor is defined on all
of D(X, Λ).

Construction and proof. (1) Compose the internal RHom of EDC.0/derived-tensor-and-internal-hom
with K_X; the shift and tensor formulas are the closed monoidal structure; ev_K is adjoint to
the evaluation K ⊗^L RHom(K, K_X) → K_X. (2) Étale restriction: u^*RHom(K, K_X) ≅ RHom(u^*K,
u^*K_X) for u étale and u^*K_X ≅ K_V (EDC.1:adjoint/dualizing-complex).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.verdierDual` | constructor | D_X : (D(X, Λ))ᵒᵖ ⥤ D(X, Λ), K ↦ RHom(K, K_X). |
| `TauCeti.EtaleDuality.verdierDual_shift` | compatibility | D_X(K[m]) ≅ D_X(K)[−m]. |
| `TauCeti.EtaleDuality.verdierDual_constant` | simp | D_X(Λ_X) ≅ K_X. |
| `TauCeti.EtaleDuality.verdierDual_tensor` | relation | D_X(K ⊗^L L) ≅ RHom(K, D_X L). |
| `TauCeti.EtaleDuality.verdierDualEval` | data | ev_K : K ⟶ D_X(D_X K), natural in K. |
| `TauCeti.EtaleDuality.verdierDual_etale` | compatibility | u^* ∘ D_X ≅ D_V ∘ u^* for u : V → X étale. |

Used by. SGA 4½ [Dualité] via DeligneWeightsAndPurity:DWP.7 (request to EDC.1): D = RHom(−,
K_X) with D² ≅ id on D^b_c and the exchange formulas. EtaleDualityAndPerverseSheaves:EDC.5:
self-duality of the perverse t-structure and D_X IC_X(L) ≅ IC_X(L^∨(d)).
LefschetzPencilsAndVanishingCycles:LPV.7 (request to EDC.1:biduality): support duality and D_Y
i^*K = i^*DK(−1)[−2] for a transversal section.

Unit tests:

- `TauCeti.EtaleDuality.verdierDual_point` (computation): For X = Spec Ω, Ω algebraically
  closed, Λ self-injective (e.g. ℤ/n) and M a finitely generated Λ-module in degree 0, D_X(M) ≅
  Hom_Λ(M, Λ) in degree 0.
- `TauCeti.EtaleDuality.verdierDual_zero` (degenerate): D_X(0) ≅ 0.
- `TauCeti.EtaleDuality.verdierDual_smoothCurve_constant` (computation): For X a smooth curve
  over an algebraically closed field, D_X(Λ_X) ≅ Λ(1)[2].
- `TauCeti.EtaleDuality.not_verdierDual_eq_linearDual` (non-example): D_X(Λ_X) ≇ RHom(Λ_X, Λ_X)
  = Λ_X on a smooth curve: duality is measured against K_X, not against Λ_X.

Acceptance. X = Spec Ω with Ω algebraically closed, Λ = ℤ/n: D(M) = Hom_{ℤ/n}(M, ℤ/n) for a
finite ℤ/n-module M placed in degree 0 (ℤ/n is self-injective).

Depends on: `dualizing-complex`, `derived-tensor-and-internal-hom`,
`mathlib:CategoryTheory.Functor.IsTriangulated`.

Source: SGA4-XVIII, 3.2.6, p. 586.

### `formal-duality-exchange` — Formal exchange: D_S ∘ Rf_! ≅ Rf_* ∘ D_X and D_X ∘ f^* ≅ f^! ∘ D_S

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/formal-duality-exchange` (theorem); module
`TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; suggested declaration(s)
`TauCeti.EtaleDuality.verdierDual_lowerShriek, TauCeti.EtaleDuality.verdierDual_pullback`.

Let f : X → S be a morphism of schemes separated of finite type over a field k, Λ torsion. With
K_X ≅ f^!K_S (composition of exceptional inverse images): (a) for every L ∈ D(X, Λ), D_S(Rf_!L)
≅ Rf_*(D_X L); (b) for every K ∈ D(S, Λ), D_X(f^*K) ≅ f^!(D_S K). Both hold without
constructibility or biduality. The dual forms D_S Rf_* ≅ Rf_! D_X and D_X f^! ≅ f^* D_S need
biduality and are EDC.1:biduality/duality-exchange-isomorphisms.

Hypotheses. X, S separated of finite type over k; f compactifiable; Λ torsion.

Construction and proof. (1) (a) is EDC.1:adjoint/sheafified-adjunction (a) with K := K_S, using
f^!K_S ≅ K_X. (2) (b) is the induction formula EDC.1:adjoint/sheafified-adjunction (b) with L
:= K_S.

Acceptance. For f = j an open immersion, (b) reads D_U(j^*K) ≅ j^*D_X K.

Depends on: `sheafified-adjunction`, `verdier-dual`, `upper-shriek-pseudofunctor`.

Source: Stacks-MoreEtale, Lemma 11.6 (tag 0GLD).

### `base-change-exchange-maps` — The formal base-change and exchange maps for f^!

Node `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps` (construction);
module `TauCeti/AlgebraicGeometry/Etale/Duality/Exchange`.

For a cartesian square X′ →g′ X, f′ : X′ → S′, f : X → S, g : S′ → S with f compactifiable and
Λ torsion, construct natural transformations: (i) the isomorphism Rg′_* f′^! ≅ f^! Rg_*
(transpose of proper base change g^*Rf_! ≅ Rf′_!g′^*); (ii) the base-change morphism g′^*f^! →
f′^!g^* (mate of (i)); (iii) the cobase-change morphism Rf′_!g′^! → g^!Rf_! for g
compactifiable; (iv) the exchange morphism f^*RHom(K, L) → RHom(f^*K, f^*L) and its dual form
f^!RHom(K, L) ≅ RHom(f^*K, f^!L). These are constructed as mates in the EnhancedDerivedSheaves
coherent diagrams and satisfy the pasting laws for horizontal and vertical composition of
squares. (ii) is an isomorphism for g étale here and for g smooth after
EDC.2:trace-purity/smooth-purity; it is not an isomorphism for an arbitrary g.

Hypotheses. f compactifiable, S and S′ quasi-compact quasi-separated, Λ torsion.

Construction and proof. (1) Take the mates of the proper base change isomorphism under the
adjunctions Rf_! ⊣ f^!, g^* ⊣ Rg_* (EnhancedDerivedSheaves E3 mates and Beck-Chevalley), giving
(i) and (ii); (iii) is the mate of the composition isomorphism (SGA 4 XVIII 3.1.13.2); (iv) is
EDC.1:adjoint/sheafified-adjunction (b). (2) Pasting: the mate correspondence is functorial for
pasting of squares (EnhancedDerivedSheaves E3).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.upperShriekPushforwardIso` | compatibility | Rg′_* ∘ f′^! ≅ f^! ∘ Rg_* for a cartesian square. |
| `TauCeti.EtaleDuality.upperShriekBaseChange` | data | The natural transformation g′^* ∘ f^! ⟶ f′^! ∘ g^*, the mate of (i). |
| `TauCeti.EtaleDuality.upperShriekCobaseChange` | data | Rf′_! ∘ g′^! ⟶ g^! ∘ Rf_! for g compactifiable. |
| `TauCeti.EtaleDuality.upperShriekBaseChange_etale` | simp | For g étale, upperShriekBaseChange is an isomorphism. |
| `TauCeti.EtaleDuality.upperShriekBaseChange_paste` | functoriality | Compatibility of upperShriekBaseChange with horizontal and vertical pasting of cartesian squares. |

Used by. SGA 4 XVIII 3.1.12-3.1.14: the induction and cobase-change isomorphisms used in the
duality proofs. LefschetzPencilsAndVanishingCycles:LPV.7 (request to EDC.1:biduality): pullback
exchange with all shifts and Tate twists.
EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity: for smooth g the base-change
map becomes an isomorphism.

Unit tests:

- `TauCeti.EtaleDuality.upperShriekBaseChange_id` (degenerate): For g = id the base-change map
  is the identity of f^!.
- `TauCeti.EtaleDuality.upperShriekBaseChange_openImmersion` (computation): For g an open
  immersion, g′^*f^! ≅ f′^!g^*.
- `TauCeti.EtaleDuality.not_upperShriekBaseChange_iso_closedPoint` (non-example): For f =
  id_{A¹} and g : {0} → A¹ (over Ω algebraically closed), the map g^*Λ → g^!Λ = Λ(−1)[−2] is
  not an isomorphism.

Acceptance. For g étale, (ii) is the localization isomorphism of
EDC.1:adjoint/upper-shriek-pseudofunctor. For g = i : {s} → S a closed point of a curve and f =
id, (ii) is i^*Λ → i^!Λ, which is zero, not an isomorphism (i^!Λ = Λ(−1)[−2]).

Depends on: `exceptional-inverse-image`, `sheafified-adjunction`,
`EnhancedDerivedSheaves:E3/mates-and-beck-chevalley`, `SchemeAndStackFoundations:SF.2`.

Source: SGA4-XVIII, 3.1.13, (3.1.13.2), p. 576; Stacks-MoreEtale, Lemma 11.7 (tag 0GLE).

## EDC.2:trace-purity — traces and smooth purity

This layer follows SGA 4 XVIII §§1–2 and 3.2: the quasi-finite flat trace with its degree
normalization, the Kummer first Chern class, the trace for curves with multiplicities, the
curve duality and effacement lemmas (from the Jacobian, the Weil pairing and Kummer theory),
the trace of affine space, Deligne's general trace 2.9 with its four characterizing properties,
the smooth effacement theorem 2.14, and the smooth purity theorem f^! ≅ f^*(d)[2d]. The
normalization is fixed by degree-one points and c₁(O(1)) on P¹. The purity proof is the
stalkwise one (Stacks More Étale 16.1 with 2.14.4), which avoids Deligne's Lemma 3.2.3 (see the
source issues).

### `quasi-finite-flat-trace` — The trace for quasi-finite flat morphisms ★

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/quasi-finite-flat-trace`
(construction); planet “Trace for finite flat maps”; module
`TauCeti/AlgebraicGeometry/Etale/Duality/Trace/FiniteFlat`.

For f : X → S separated, flat, of finite presentation and quasi-finite, and F an abelian sheaf
on S, there is a unique trace morphism Tr_f : f_!f^*F → F such that (Var 1) Tr_f is natural in
F; (Var 2) it is compatible with every base change S′ → S; (Var 3) for f = gh with g, h of the
same kind, Tr_f = Tr_g ∘ g_!(Tr_h)g^*; (Var 4) if f is finite locally free of constant rank r,
the composite F → f_*f^*F = f_!f^*F → F is multiplication by r. On geometric stalks over s̄,
(f_!f^*F)_s̄ = ⊕_{x̄ ↦ s̄} F_s̄ and Tr_f is (a_x̄) ↦ Σ m_x̄ a_x̄, where m_x̄ is the length of
the local ring of the fibre X_s̄ at x̄. For f étale, Tr_f is the counit of the adjunction f_! ⊣
f^*. With F replaced by K ∈ D(S, Λ), it gives Rf_!f^*K = f_!f^*K → K.

Hypotheses. f separated, flat, of finite presentation, quasi-finite (relative dimension zero);
S arbitrary. F any abelian sheaf (no torsion hypothesis is needed in relative dimension zero).

Construction and proof. (1) Uniqueness: (Var 2) reduces to S the spectrum of a separably closed
field, where (Var 3)-(Var 4) and decomposition into connected components (6.2.3.1) determine
the map (SGA 4 XVII 6.2.3). (2) Existence: étale-locally on S, f is a disjoint union of a
finite locally free part and a part with empty fibres over the point; on the finite locally
free part with constant coefficients use the trace of the finite locally free algebra, which on
the geometric fibre gives the multiplicities (Mathlib Algebra.trace on stalks); glue by
uniqueness. (3) Étale case: SGA 4 XVII 6.2.11 identifies f_! with the left adjoint of f^* and
Tr_f with the counit.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.finiteFlatTrace` | constructor | Tr_f : f_!f^*F ⟶ F for f separated flat of finite presentation and quasi-finite. |
| `TauCeti.EtaleDuality.finiteFlatTrace_natural` | functoriality | Tr_f is natural in F. |
| `TauCeti.EtaleDuality.finiteFlatTrace_baseChange` | compatibility | g^*(Tr_f) corresponds to Tr_{f′} under the base-change isomorphism g^*f_! ≅ f′_!g′^*. |
| `TauCeti.EtaleDuality.finiteFlatTrace_comp` | functoriality | Tr_{gh} = Tr_g ∘ g_!(Tr_h). |
| `TauCeti.EtaleDuality.finiteFlatTrace_unit` | relation | For f finite locally free of constant rank r, Tr_f ∘ (unit of f^* ⊣ f_*) = r · id. |
| `TauCeti.EtaleDuality.finiteFlatTrace_etale` | compatibility | For f étale, Tr_f is the counit of f_! ⊣ f^*. |
| `TauCeti.EtaleDuality.finiteFlatTrace_stalk` | characterisation | On the stalk at s̄, Tr_f is (a_x̄) ↦ Σ_x̄ m_x̄ a_x̄ with m_x̄ the multiplicity of the fibre at x̄. |

Used by. SGA 4 XVIII 2.9 (Var 4)(I) and 2.10: the d = 0 case of the general trace. SGA 4 XVIII
1.1.6: the curve trace is glued from quasi-finite flat maps to P¹ composed with Tr_{P¹}.
ClassicalAdicEtaleCohomology:H0 (request to EDC.2:trace-purity): compatibility of the curve
trace with finite flat maps (degree). EtaleDualityAndPerverseSheaves:EDC.3/gysin-map: proper
pushforward along a finite map of degree δ composes with pullback to δ.

Unit tests:

- `TauCeti.EtaleDuality.finiteFlatTrace_separable` (computation): For Spec L → Spec K with L/K
  finite separable of degree r, Tr ∘ unit = r on every sheaf.
- `TauCeti.EtaleDuality.finiteFlatTrace_square_map` (computation): For f : A¹ → A¹, x ↦ x²,
  over an algebraically closed field of characteristic ≠ 2, the stalk of Tr_f at 0 is
  multiplication by 2 on F_0.
- `TauCeti.EtaleDuality.finiteFlatTrace_id` (degenerate): For f = id, Tr_f is the identity.
- `TauCeti.EtaleDuality.not_finiteFlatTrace_counit_ramified` (non-example): For x ↦ x² on A¹
  the trace is not the counit of an adjunction f_! ⊣ f^*: at 0 it is 2 · id rather than an
  isomorphism compatible with a left adjoint, so 'trace = counit' holds only for étale f.

Acceptance. Spec L → Spec K for a finite separable extension of degree r: Tr ∘ unit = r. x ↦ x²
on A¹ over an algebraically closed field of characteristic ≠ 2: at the origin the stalk of
f_!f^*F is F_0 and Tr is multiplication by 2.

Depends on: `etale-derived-category`, `compact-pushforward-amplitude-and-colimits`,
`mathlib:Algebra.trace`, `mathlib:AlgebraicGeometry.Flat`,
`mathlib:AlgebraicGeometry.LocallyQuasiFinite`, `mathlib:AlgebraicGeometry.IsFinite`,
`mathlib:AlgebraicGeometry.Scheme.Hom.finrank`, `SchemeAndStackFoundations:SF.2`.

Source: SGA4-XVII, Théorème 6.2.3, p. 422-423; SGA4-XVII, Théorème 6.2.3 (Var 4), p. 423;
SGA4-XVII, Proposition 6.2.11, p. 430.

### `first-chern-class` — The Kummer first Chern class c₁ : Pic(X) → H²(X, Λ(1)) ★

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class` (construction);
planet “Kummer first Chern class”; module
`TauCeti/AlgebraicGeometry/Etale/Duality/FirstChernClass`.

Let X be a scheme with n invertible on X and Λ a ring with nΛ = 0. The Kummer sequence 0 → μ_n
→ G_m →(·)^n G_m → 0 is exact on X_ét, and H¹(X_ét, G_m) = Pic(X) (both imported). The first
Chern class is the composite c₁ : Pic(X) = H¹(X, G_m) →δ H²(X, μ_n) → H²(X, Λ(1)). It is a
group homomorphism, natural for pullback, and kills nPic(X). For an effective Cartier divisor D
⊂ X with complement U, c₁(O(D)) is the image of the local class cl_D ∈ H²_D(X, μ_n) (boundary
of the class of a local equation in H¹(U, μ_n)) under H²_D(X) → H²(X).

Hypotheses. n invertible on X; Λ with nΛ = 0. The Kummer sequence and Pic(X) = H¹(X, G_m) are
imported (ConstructibleEtale through SchemeAndStackFoundations SF.2); Pic(X) and degrees of
line bundles on curves come from JacobianChallenge Layer A.

Construction and proof. (1) δ is the connecting map of the long exact sequence of the Kummer
sequence (SGA 4 IX 3.2); compose with μ_n → Λ(1). (2) Naturality from the naturality of the
Kummer sequence under f^{-1}; additivity because δ is a homomorphism and [L ⊗ M] = [L] + [M] in
H¹(G_m). (3) Divisor form: the section 1 of O(D) trivializes O(D) on U, so [O(D)] comes from
H¹_D(X, G_m), whose δ is the local class.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.firstChernClass` | constructor | c₁ : Pic(X) →+ H²(X, Λ(1)), the Kummer boundary. |
| `TauCeti.EtaleDuality.firstChernClass_tensor` | simp | c₁(L ⊗ M) = c₁(L) + c₁(M), c₁(O_X) = 0, c₁(L^∨) = −c₁(L). |
| `TauCeti.EtaleDuality.firstChernClass_pullback` | functoriality | c₁(f^*L) = f^*c₁(L). |
| `TauCeti.EtaleDuality.firstChernClass_pow` | relation | c₁(L^{⊗n}) = 0 for nΛ = 0. |
| `TauCeti.EtaleDuality.firstChernClass_divisor` | characterisation | For an effective Cartier divisor D, c₁(O(D)) is the image of the local class cl_D ∈ H²_D(X, Λ(1)). |
| `TauCeti.EtaleDuality.firstChernClass_changeN` | compatibility | For n′ ∣ n, reduction μ_n → μ_{n′} (via (·)^{n/n′}) sends c₁ to c₁ (SGA 4 XVIII (1.1.3.5)). |

Used by. SGA 4 XVIII 1.1.3 and 1.1.6: the curve trace is normalized by c₁ of a degree-one line
bundle. EtaleDualityAndPerverseSheaves:EDC.3/chern-classes: c₁ of O(1) generates the
projective-bundle cohomology. DeligneWeightsAndPurity:DWP.7 (request to EDC.3): c₁ : Pic(X) →
H²(X, ℚ_ℓ(1)), additive and natural, and the Lefschetz operator. CohomologyComparisons:CP.6:
compares étale c₁ under the Kummer map with other realizations.

Unit tests:

- `TauCeti.EtaleDuality.firstChernClass_projectiveLine` (computation): On P¹ over an
  algebraically closed field, c₁(O(1)) generates H²(P¹, μ_n) ≅ ℤ/n.
- `TauCeti.EtaleDuality.firstChernClass_trivial` (degenerate): c₁(O_X) = 0.
- `TauCeti.EtaleDuality.not_firstChernClass_injective` (non-example): c₁(O_{P¹}(n)) = 0
  although O(n) is nontrivial: c₁ only sees Pic(X)/n.
- `TauCeti.EtaleDuality.firstChernClass_degree_curve` (compatibility): For X a smooth
  projective connected curve over an algebraically closed field, Tr_X(c₁(L)) = deg L mod n
  (with EDC.2:trace-purity/curve-trace).

Acceptance. On P¹ over an algebraically closed field, c₁(O(1)) generates H²(P¹, μ_n) ≅ ℤ/n and
its curve trace is 1. c₁(O_X) = 0 and c₁(L^{⊗n}) = 0.

Depends on: `tate-twist`, `cohomology-with-supports`, `SchemeAndStackFoundations:SF.2`,
`tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`.

Source: SGA4-XVIII, 1.1.3, (1.1.3.2), p. 485; Milne-LEC, §23, p. 138.

### `curve-trace` — The trace morphism for curves ★

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace` (construction); planet
“Trace morphism for curves”; module `TauCeti/AlgebraicGeometry/Etale/Duality/Trace/Curve`.

(a) Let X be a curve (separated, finite type, pure dimension one) over an algebraically closed
field k of exponent characteristic p, n prime to p, with irreducible components c and
multiplicities n_i = length O_{X,η_i}. Then H²_c(X, ℤ/n(1)) ≅ H²(X̄_red, ℤ/n(1)) ≅
Pic(X̄_red)/n ≅ (ℤ/n)^c (X̄ a completion of X_red, c₁ and degree), and Tr_X : H²_c(X, ℤ/n(1)) →
ℤ/n is (a_i) ↦ Σ n_i a_i; it extends to Tr_X : H²_c(X, F(1)) → F for every torsion abelian
group F prime to p. (b) For a flat compactifiable curve f : X → S (flat, finite presentation,
separated, fibres of pure dimension one) and a torsion sheaf F on S prime to the residue
characteristics, there is a unique Tr_f : R²f_!(f^*F(1)) → F, natural in F, compatible with
every base change, and equal to (a) on geometric fibres. It satisfies: additivity over
components (1.1.4); compatibility with quasi-finite flat traces on either side (1.1.7, 1.1.8);
and Tr_f is an isomorphism when f is smooth with geometrically irreducible fibres (1.1.9).

Hypotheses. k algebraically closed for (a); in (b) S arbitrary (quasi-compact quasi-separated
for compactifiability) and F torsion prime to residue characteristics. Uses the cohomology of
curves over algebraically closed fields (H² = Pic/n, vanishing above 2), imported through
SchemeAndStackFoundations SF.2, and the degree of line bundles from JacobianChallenge Layer A.

Construction and proof. (1) (a): H²_c(X) ≅ H²_c(X_red) (topological invariance), and for the
dense open X_red ⊂ X̄ the localization sequence (SGA 4 XVII 5.1.16.3) with the finite
complement gives H²_c(X) ≅ H²(X̄); Kummer and degree give (ℤ/n)^c; define t((a_i)) = Σ n_i a_i
(SGA 4 XVIII 1.1.3). (2) (b): on P¹_S the Kummer map ℤ/n → R²p_*ℤ/n(1) is an isomorphism
(checked fibrewise); its inverse is Tr_p. Where X admits a quasi-finite flat S-map u to P¹_S,
set Tr_f := Tr_p ∘ Tr_u (EDC.2:trace-purity/quasi-finite-flat-trace), independent of u by
checking fibrewise via 1.1.5; glue over such opens using right exactness of R²f_!; in general
restrict to the dense Cohen-Macaulay locus. For F with nF = 0 use R²f_!ℤ/n(1) ⊗ F ≅
R²f_!(f^*F(1)) (projection formula) and pass to the limit (SGA 4 XVIII 1.1.6). (3) 1.1.4,
1.1.7-1.1.9 are checked fibre by fibre from (a).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.curveTrace` | constructor | Tr_f : R²f_!(f^*F(1)) ⟶ F for a flat compactifiable curve f : X → S and torsion F prime to the residue characteristics. |
| `TauCeti.EtaleDuality.curveTrace_baseChange` | compatibility | Tr_f is compatible with every base change S′ → S. |
| `TauCeti.EtaleDuality.curveTrace_components` | relation | For nonempty opens U_i of the irreducible components, the sum of the Tr_{U_i} factors through Tr_X (SGA 4 XVIII 1.1.4). |
| `TauCeti.EtaleDuality.curveTrace_quasiFiniteFlat` | functoriality | For u : X → Y quasi-finite flat over a curve Y, Tr_{fu} = Tr_f ∘ R²f_!(Tr_u) (1.1.7), and the dual compatibility for a quasi-finite flat base (1.1.8). |
| `TauCeti.EtaleDuality.curveTrace_isIso` | characterisation | If f is smooth with geometrically irreducible fibres, Tr_f is an isomorphism. |
| `TauCeti.EtaleDuality.curveTrace_firstChernClass` | compatibility | For X a proper smooth connected curve over an algebraically closed field, Tr_X(c₁(L)) = deg L mod n. |

Used by. SGA 4 XVIII 2.8-2.9: the trace of A¹ and the general trace are built from the curve
trace. SGA 4 XVIII 1.6.9: the effacement lemma needs Tr_{f′} to be an isomorphism on a small
neighbourhood. ClassicalAdicEtaleCohomology:H0 (request to EDC.2:trace-purity): the torsion
trace for smooth separated curves over an arbitrary base, compatible with base change and
normalized by c₁(O(1)). EllipticKTheory:E.5 (request to EDC.2:trace-purity): H² of a smooth
proper curve via the normalized trace.

Unit tests:

- `TauCeti.EtaleDuality.curveTrace_projectiveLine` (computation): On P¹ over an algebraically
  closed field, Tr(c₁(O(1))) = 1 ∈ ℤ/n.
- `TauCeti.EtaleDuality.curveTrace_twoLines` (computation): For X = A¹ ⊔ A¹ over an
  algebraically closed field, H²_c(X, Λ(1)) ≅ Λ² and Tr_X(a, b) = a + b.
- `TauCeti.EtaleDuality.curveTrace_empty` (degenerate): For the empty curve, H²_c = 0 and Tr =
  0.
- `TauCeti.EtaleDuality.not_curveTrace_isIso_doubleLine` (non-example): For X = Spec k[x,
  y]/(y²) (a double line) and n = 2, Tr_X is multiplication by the multiplicity 2 on H²_c(X,
  ℤ/2(1)) ≅ ℤ/2, hence zero and not an isomorphism.

Acceptance. P¹ over k algebraically closed: Tr(c₁(O(1))) = 1. Two disjoint lines: H²_c ≅ Λ² and
Tr is the sum. The double line Spec k[x, y]/(y²): Tr is multiplication by 2 on H²_c ≅ ℤ/n, not
an isomorphism for n even.

Depends on: `first-chern-class`, `quasi-finite-flat-trace`,
`compact-pushforward-amplitude-and-colimits`, `tate-twist`, `SchemeAndStackFoundations:SF.2`,
`tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`.

Source: SGA4-XVIII, 1.1.3, (1.1.3.3), p. 486; SGA4-XVIII, Proposition 1.1.6, p. 489;
SGA4-XVIII, Lemme 1.1.9, p. 491.

### `curve-h1-duality` — Poincaré duality on a smooth curve over an algebraically closed field

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-h1-duality` (theorem); module
`TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; suggested declaration(s)
`TauCeti.EtaleDuality.curve_h1_duality`.

Let U be a smooth connected curve over an algebraically closed field k and n invertible in k.
For every finite locally constant sheaf F of ℤ/n-modules on U and every r, the pairing H^r_c(U,
F) × H^{2−r}(U, F^∨(1)) → H²_c(U, μ_n) →Tr ℤ/n is perfect. In particular H¹_c(U, ℤ/n) and H¹(U,
μ_n) are dual, and for a tame finite étale cover u : U′ → U the trace Tr_u : H¹_c(U′, ℤ/n) →
H¹_c(U, ℤ/n) is (after choosing μ_n ≅ ℤ/n) the transpose of u^* : H¹(U, ℤ/n) → H¹(U′, ℤ/n). The
proof uses the Jacobian and Kummer theory and is independent of the general duality theorem.

Hypotheses. k algebraically closed, n invertible; U smooth connected (affine or proper). This
is the curve input of SGA 4 XVIII §1 and must not be deduced from EDC.1:biduality or
EDC.2:pairings (it is used to prove them).

Construction and proof. (1) Dévissage (Milne LEC 14.7, steps 0-4): both sides vanish outside 0
≤ r ≤ 2; both are δ-functors in F; a finite map U′ → U reduces F to a direct image of a
constant sheaf; removing a point x compares the pair sequences, with H^r_x(U, μ_n) = ℤ/n for r
= 2 and 0 otherwise (Kummer on the henselian trait); so it suffices to treat F = ℤ/n on a
complete smooth curve X. (2) Complete curve: H⁰ and H² are dual by the trace
(EDC.2:trace-purity/curve-trace). In degree 1, Kummer gives H¹(X, μ_n) = Pic(X)[n] = J(k)[n]
for the Jacobian J (JacobianChallenge Layer D) and H¹(X, ℤ/n) = Hom(π₁, ℤ/n) = Hom(J[n], ℤ/n)
via the Abel-Jacobi pullback of isogenies; the cup product pairing is identified with the Weil
pairing on J[n] (Milne LEC 14.8), which is perfect for the principal polarization
(AbelianSchemesAndArithmeticModuli A3). (3) Transposition 1.6.6: the trace Tr_u and u^* are
adjoint for the cup-product pairing by the projection formula Tr_u(a ∪ u^*b) = Tr_u(a) ∪ b;
perfectness on U and U′ then makes Tr_u the transpose of u^* (SGA 4 XVIII 1.6.6, first proof
via 1.6.5.1).

Acceptance. U = A¹: H¹_c(A¹, ℤ/n) = 0 = H¹(A¹, μ_n). U = G_m: H¹_c(G_m, ℤ/n) ≅ ℤ/n and H¹(G_m,
μ_n) = Γ(G_m, O)^×/n ≅ ℤ/n (generated by the Kummer class of the coordinate t), and the pairing
is perfect.

Depends on: `curve-trace`, `first-chern-class`, `cohomology-with-supports`,
`AbelianSchemesAndArithmeticModuli:A3`,
`tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`,
`SchemeAndStackFoundations:SF.2`.

Source: Milne-LEC, Theorem 14.7, p. 93; Milne-LEC, Example 14.8, p. 93; SGA4-XVIII, Lemme
1.6.6, p. 545.

### `curve-effacement-lemma` — The fundamental effacement lemma for smooth curves ★

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-effacement-lemma` (theorem);
planet “Fundamental effacement lemma”.

Let f : X → S be a smooth compactifiable curve, x̄ a geometric point of X with image s̄, and n
≥ 1 invertible on S. There exist an étale neighbourhood V of s̄ in S and an étale neighbourhood
U of x̄ in X_V, with f′ : U → V, such that R⁰f′_!ℤ/n = 0, the trace map Tr_u : R¹f′_!ℤ/n →
R¹f_{V!}ℤ/n of the étale map u : U → X_V is zero, and Tr_{f′} : R²f′_!ℤ/n(1) → ℤ/n is an
isomorphism.

Hypotheses. f smooth compactifiable of relative dimension one; n invertible on S.

Construction and proof. (1) R⁰f′_! = 0 holds once f′ is quasi-affine, and Tr_{f′} is an
isomorphism once the geometric fibres of f′ are connected (curve-trace, 1.1.9); both are
arranged étale-locally by EGA IV 15.6.5 (SGA 4 XVIII 1.6.8). (2) Killing R¹: on a geometric
fibre, take the maximal abelian n-torsion Galois cover U′ → U of a connected affine fibre; u^*
is zero on H¹(U, ℤ/n), so by EDC.2:trace-purity/curve-h1-duality (1.6.6) Tr_u is zero on H¹_c
(SGA 4 XVIII 1.6.7). (3) Spread out the cover and use the acyclicity lemma for smooth morphisms
(SGA 4 XV 2.6, imported with smooth base change) to make the images of Tr_u for shrinking U a
decreasing filtered system with stationary value zero (SGA 4 XVIII 1.6.9).

Acceptance. For S = Spec k with k algebraically closed and X = A¹, U := A¹ minus a point with
the n-th power cover already kills R¹.

Depends on: `curve-h1-duality`, `curve-trace`, `quasi-finite-flat-trace`,
`SchemeAndStackFoundations:SF.2`.

Source: SGA4-XVIII, Lemme fondamental 1.6.9, p. 548; SGA4-XVIII, 0.2, p. 481-482.

### `affine-space-trace` — The trace isomorphism for affine space

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/affine-space-trace` (construction);
module `TauCeti/AlgebraicGeometry/Etale/Duality/Trace/AffineSpace`.

For a quasi-compact quasi-separated S, the standard vector bundle a_d : E^d_S = A^d_S → S, and
a torsion sheaf F on S prime to the residue characteristics, there is an isomorphism Tr_{a_d} :
R^{2d}a_{d!}a_d^*F(d) → F defined by induction: Tr_{a_0} = id, Tr_{a_1} is the curve trace (an
isomorphism by 1.1.9), and Tr_{a_{d+1}} is the composite of Tr_{a_d} and R^{2d}a_{d!}(Tr_{a_1})
through E^{d+1} = E¹ ×_S E^d. Its source and target commute with base change; it is invariant
under permutation of coordinates (any connected algebraic group acting on E^d acts trivially on
R^{2d}a_{d!}).

Hypotheses. S quasi-compact quasi-separated; F torsion prime to the residue characteristics.

Construction and proof. (1) Induction via the composition isomorphism R^{2d}f_!R^{2e}g_! ≅
R^{2(d+e)}(fg)_! (maximal-degree argument in the Leray spectral sequence, SGA 4 XVIII 2.7). (2)
Permutation invariance: the affine group acts on the base-change-compatible sheaf
R^{2d}a_{d!}F(d), and a connected group acts trivially (2.8.2).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.affineSpaceTrace` | constructor | Tr_{a_d} : R^{2d}a_{d!}a_d^*F(d) ≅ F. |
| `TauCeti.EtaleDuality.affineSpaceTrace_succ` | relation | Tr_{a_{d+1}} = Tr_{a_d} ∘ R^{2d}a_{d!}(Tr_{a_1}) under E^{d+1} = E¹ ×_S E^d. |
| `TauCeti.EtaleDuality.affineSpaceTrace_perm` | relation | Tr_{a_d} is invariant under permutations of the coordinates. |
| `TauCeti.EtaleDuality.affineSpaceTrace_baseChange` | compatibility | Tr_{a_d} commutes with every base change S′ → S. |

Used by. SGA 4 XVIII 2.9 (Var 4)(II): normalization of the general trace on the affine line.
EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-effacement: smooth morphisms are
étale-locally affine spaces.

Unit tests:

- `TauCeti.EtaleDuality.affineSpaceTrace_zero` (degenerate): For d = 0, Tr_{a_0} is the
  identity of F.
- `TauCeti.EtaleDuality.affineSpaceTrace_line` (computation): For d = 1 over an algebraically
  closed field, Tr_{a_1} sends the class in H²_c(A¹, Λ(1)) of a point (Gysin image of 1) to 1.
- `TauCeti.EtaleDuality.affineSpaceTrace_swap` (characterisation): For d = 2, Tr_{a_2} ∘ σ^* =
  Tr_{a_2} for the coordinate swap σ of A².
- `TauCeti.EtaleDuality.not_affineSpaceTrace_lower_degree` (non-example): R^q a_{d!}Λ = 0 for q
  ≠ 2d (d ≥ 1, algebraically closed field): there is no nonzero trace in degree 2d − 1, so a
  'trace' placed in any degree but 2d is zero.

Acceptance. d = 1: the curve trace of A¹; it sends the compactly supported class of a point to
1.

Depends on: `curve-trace`, `compact-pushforward-amplitude-and-colimits`,
`mathlib:AlgebraicGeometry.AffineSpace`.

Source: SGA4-XVIII, 2.8, (2.8.1), p. 552-553; SGA4-XVIII, 2.8.2, p. 553.

### `flat-trace` — The trace morphism Tr_f : R^{2d}f_!f^*F(d) → F ★

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/flat-trace` (construction); planet
“Trace morphism Tr_f”; module `TauCeti/AlgebraicGeometry/Etale/Duality/Trace/Flat`.

Consider triples (f, d, F): f : X → Y compactifiable, d an integer, F a torsion sheaf on Y
prime to the residue characteristics, where f satisfies (∗)_d: there is an open U ⊂ X on which
f is flat of finite presentation with fibres of dimension ≤ d and the fibres of X − U have
dimension < d. There is a unique trace Tr_f : R^{2d}f_!f^*F(d) → F such that (Var 1) it is
natural in F; (Var 2) it commutes with base change along Y′ → Y (Y′ quasi-compact
quasi-separated); (Var 3) for composable X →g Y →f Z satisfying (∗)_e and (∗)_d, fg satisfies
(∗)_{d+e} and Tr_{fg} = Tr_f ∘ R^{2d}f_!(Tr_g) under R^{2d}f_!R^{2e}g_! ≅ R^{2(d+e)}(fg)_!;
(Var 4)(I) for d = 0 and f finite locally free of rank r, F → f_*f^*F → F is multiplication by
r; (II) for the affine line it is the isomorphism (2.8.1). For d = 0 it is the quasi-finite
flat trace, for curves the curve trace, for affine space (2.8.1) (Prop. 2.10). It is compatible
with Künneth: Tr_{f×g} = Tr_f ⊗ Tr_g (2.12). In derived form, Tr_f : Rf_!(f^*K(d)[2d]) → K for
K ∈ D(Y, Λ), Λ killed by n invertible (2.13.2). Tr_f is an isomorphism iff every geometric
fibre has exactly one irreducible component of dimension d, with multiplicity prime to n
(Remark 2.10.1, via EDC.2:trace-purity/smooth-purity).

Hypotheses. f compactifiable satisfying (∗)_d (e.g. flat of finite presentation of pure
relative dimension d); F torsion prime to residue characteristics. Uses only §1.1 of SGA 4
XVIII (not the effacement lemma).

Construction and proof. (1) Reduction to the dense open U and to the Cohen-Macaulay locus:
R^{2d} does not see closed subsets of fibre dimension < d (SGA 4 XVIII 2.1, 2.3) and is
computed by étale covers (2.2). (2) Locally on a Cohen-Macaulay flat X, choose a quasi-finite
flat map u : X → E^d_Y and set Tr_f := Tr_{a_d} ∘ R^{2d}a_{d!}(Tr_u) (affine-space trace and
quasi-finite flat trace); independence of u: two systems of parameters are joined by a chain
changing one coordinate at a time (2.5-2.6), and changing one coordinate reduces to the curve
case (1.1.7-1.1.8). Glue by uniqueness. (3) Uniqueness: (Var 2) reduces to S an algebraically
closed field, and (Var 3)-(Var 4) pin the trace on the generating classes. (4) Künneth
compatibility from (Var 3) and the asymmetric description of the Künneth map (SGA 4 XVII
5.4.3.5); the derived form by tensoring with K via the projection formula (2.13.1).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.trace` | constructor | Tr_f : R^{2d}f_!f^*F(d) ⟶ F for f compactifiable satisfying (∗)_d. |
| `TauCeti.EtaleDuality.derivedTrace` | constructor | Tr_f : Rf_!(f^*K(d)[2d]) ⟶ K in D(Y, Λ), natural in K. |
| `TauCeti.EtaleDuality.trace_baseChange` | compatibility | (Var 2): compatibility with base change. |
| `TauCeti.EtaleDuality.trace_comp` | functoriality | (Var 3): Tr_{fg} = Tr_f ∘ R^{2d}f_!(Tr_g). |
| `TauCeti.EtaleDuality.trace_finite` | relation | (Var 4)(I): for d = 0 and f finite locally free of rank r, Tr_f ∘ unit = r. |
| `TauCeti.EtaleDuality.trace_affineLine` | compatibility | (Var 4)(II): for the affine line Tr_f is the isomorphism (2.8.1). |
| `TauCeti.EtaleDuality.trace_kunneth` | compatibility | Tr_{f×g} ∘ (Künneth) = Tr_f ⊗ Tr_g (SGA 4 XVIII 2.12). |
| `TauCeti.EtaleDuality.trace_isIso_iff` | characterisation | Tr_f is an isomorphism iff each geometric fibre has exactly one d-dimensional irreducible component, of multiplicity prime to n. |
| `TauCeti.EtaleDuality.higherLowerShriek` | projection | R^q f_!K := ℋ^q(Rf_!K), the sheaf on which the trace is defined. |

Used by. SGA 4 XVIII 3.2.1-3.2.5: the adjoint of the derived trace is the purity map t_f :
f^*K(d)[2d] → f^!K. DeligneWeightsAndPurity:DWP.7 (request to EDC.2): the relative trace
R^{2N}f_!ℚ_ℓ(N) → ℚ_ℓ compatible with base change. LefschetzPencilsAndVanishingCycles:LPV.0
(request to EDC.2): the relative trace R^{2n}f_*ℚ_ℓ(n) ≅ ℚ_ℓ for smooth proper f with connected
fibres. ArithmeticStatistics:ST.5 (request to EDC.2): H^{2n}_c of a geometrically irreducible
smooth component is ℚ_λ(−n).

Unit tests:

- `TauCeti.EtaleDuality.trace_projectiveSpace` (computation): For P^d over an algebraically
  closed field, Tr(c₁(O(1))^d) = 1.
- `TauCeti.EtaleDuality.trace_dimZero_separable` (computation): For Spec k′ → Spec k finite
  separable of degree r and d = 0, Tr ∘ unit = r.
- `TauCeti.EtaleDuality.trace_twoComponents` (computation): For X = P¹ ⊔ P¹ over an
  algebraically closed field (d = 1), H²(X, Λ(1)) ≅ Λ² and Tr is the sum, so Tr is surjective
  but not injective.
- `TauCeti.EtaleDuality.not_trace_ignores_multiplicity` (non-example): For the double plane X =
  Spec k[x, y, z]/(z²) over an algebraically closed k and d = 2, Tr is multiplication by 2 on
  H⁴_c(X, Λ(2)) ≅ Λ; a trace defined without multiplicities (the identity there) violates (Var
  4)(I) after a finite flat projection.

Acceptance. For X = Spec k′ → Spec k finite separable of degree r and d = 0, Tr ∘ unit = r. For
P^d over an algebraically closed field, Tr(c₁(O(1))^d) = 1.

Depends on: `quasi-finite-flat-trace`, `curve-trace`, `affine-space-trace`,
`compact-pushforward-amplitude-and-colimits`, `derived-tensor-and-internal-hom`,
`mathlib:AlgebraicGeometry.Flat`, `SchemeAndStackFoundations:SF.2`.

Source: SGA4-XVIII, Théorème 2.9, p. 553; SGA4-XVIII, Proposition 2.10, p. 559; SGA4-XVIII,
2.13, (2.13.2), p. 560; SGA4-XVIII, Remarque 2.10.1, p. 559.

### `smooth-effacement` — Effacement for smooth morphisms (SGA 4 XVIII 2.14)

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-effacement` (theorem).

Let f : X → S be smooth compactifiable of pure relative dimension d and n ≥ 1 invertible on S.
For every geometric point x̄ of X over s̄ there are an étale neighbourhood V of s̄ and an étale
neighbourhood U of x̄ in X_V, with f′_V : U → V and j : U → X_V, such that R^i f′_{V!}ℤ/n → R^i
f_{V!}ℤ/n (the trace of j) is zero for i < 2d and Tr_{f′_V} : R^{2d}f′_{V!}ℤ/n(d) → ℤ/n is an
isomorphism. Consequently (2.14.4) the map Rf′_{V!}ℤ/n(d) → Rf_{V!}ℤ/n(d) factors in D^b(V,
ℤ/n) through Rf′_{V!}ℤ/n(d) → ℤ/n[−2d], the composite of the truncation and Tr_{f′_V}.

Hypotheses. f smooth compactifiable of pure relative dimension d; n invertible.

Construction and proof. (1) d = 0 is trivial and d = 1 is
EDC.2:trace-purity/curve-effacement-lemma. For d ≥ 2, factor f étale-locally as a smooth curve
over a smooth morphism of relative dimension d − 1 and iterate, composing traces by (Var 3) of
EDC.2:trace-purity/flat-trace. (2) Lemma 2.14.2: in D^b of an abelian category, a composite of
2k morphisms each zero on H^p for p < k between complexes concentrated in [0, k] factors
through H^k(K_0)[−k]; apply with 4d successive neighbourhoods to obtain the factorization
2.14.4.

Acceptance. For f : A^d_S → S and U a suitable étale neighbourhood, the factorization exhibits
Rf′_!ℤ/n(d)[2d] → ℤ/n as the pro-trace.

Depends on: `curve-effacement-lemma`, `flat-trace`,
`mathlib:AlgebraicGeometry.SmoothOfRelativeDimension`.

Source: SGA4-XVIII, Théorème 2.14, p. 560-561; SGA4-XVIII, Corollaire 2.14.4, p. 562.

### `smooth-purity` — Smooth purity (Poincaré duality): f^!K ≅ f^*K(d)[2d] ★

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity` (theorem); planet
“Smooth purity f^! ≅ f^*(d)[2d]”; module `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`;
suggested declaration(s) `TauCeti.EtaleDuality.smooth_purity`.

Let f : X → S be smooth and compactifiable, d the locally constant relative dimension, n ≥ 1
invertible on S, and Λ a ring with nΛ = 0. The morphism t_f : f^*K(d)[2d] → f^!K adjoint to the
derived trace Tr_f : Rf_!(f^*K(d)[2d]) → K is an isomorphism for every K ∈ D(S, Λ). Hence f^!
has finite cohomological amplitude, Rf_! is left adjoint to K ↦ f^*K(d)[2d] with counit Tr_f,
and Hom(L, f^*K(d)[2d]) ≅ Hom(Rf_!L, K). The isomorphism is additive over the components of
different relative dimension, compatible with composition (t_{gh} = t_h ∘ h^*t_g under (gh)^! ≅
h^!g^!, SGA 4 XVIII 3.2.4), with base change along any S′ → S (via the base-change map of
EDC.1:adjoint/base-change-exchange-maps, which is therefore an isomorphism for smooth f), with
products (Künneth compatibility of traces) and, for d = 0 (f étale), with the identification
f^! = f^* whose counit is the quasi-finite flat trace. The normalization is fixed by Tr(class
of a degree-one point) = 1 and Tr(c₁(O(1))) = 1 on P¹.

Hypotheses. f smooth compactifiable (S quasi-compact quasi-separated); d : X → ℕ locally
constant. Λ any ring killed by n invertible on S, unbounded K allowed. This is smooth purity,
not Gabber's absolute purity for regular pairs over arbitrary regular bases.

Construction and proof. (1) Reduce to d constant. By the localization formula
(EDC.1:adjoint/upper-shriek-pseudofunctor) and Stacks More Étale Lemma 16.1, ℋ^q(f^!K)
restricted to affine étale U → X is the sheaf associated to U ↦ Hom(R(U → S)_!Λ, K[q]),
functorial for étale maps through the traces of étale maps. (2) By the effacement factorization
(EDC.2:trace-purity/smooth-effacement, SGA 4 XVIII 2.14.4), the pro-system of R(U → S)_!Λ(d)
over étale neighbourhoods U of x̄ is pro-isomorphic, through the traces, to Λ[−2d]; hence the
colimit over U of Hom(R(U → S)_!Λ, K[q]) is the colimit over étale neighbourhoods V of s̄ of
Hom(Λ(−d)[−2d], K[q]|_V), i.e. ℋ^q(K(d)[2d])_s̄ = ℋ^q(f^*K(d)[2d])_x̄, and the identification
is induced by Tr, hence by t_f (this direct stalk argument replaces Deligne's Lemma 3.2.3,
whose proof the author did not understand; see sourceIssues). (3) Stalks are conservative
(EDC.0/etale-derived-category), so t_f is an isomorphism on D⁺; finite amplitude of f^*(d)[2d]
extends it to unbounded K (SGA 4 XVIII 3.2.5 and note 43). (4) Composition (3.2.4), base change
and products follow from (Var 2), (Var 3) and Künneth compatibility of Tr
(EDC.2:trace-purity/flat-trace) by transposition.

Acceptance. For X = A¹ over an algebraically closed field: a^!Λ ≅ Λ(1)[2]. For f étale (d = 0):
t_f is the identification f^! = f^*. For a closed point i : x → C of a smooth curve over an
algebraically closed field: i^!Λ ≅ Λ(−1)[−2], from (a_C)^! = Λ(1)[2] and (a_x)^! = Λ.

Depends on: `flat-trace`, `smooth-effacement`, `exceptional-inverse-image`,
`upper-shriek-pseudofunctor`, `base-change-exchange-maps`, `etale-derived-category`,
`mathlib:AlgebraicGeometry.SmoothOfRelativeDimension`.

Source: SGA4-XVIII, Théorème 3.2.5 (Dualité de Poincaré), p. 585; SGA4-XVIII, 3.2.4, p.
584-585; Stacks-MoreEtale, Lemma 16.1 (tag 0GLK).

### `top-degree-compact-cohomology` — Top-degree compactly supported cohomology of a variety

Node `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/top-degree-compact-cohomology`
(theorem); module `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; suggested declaration(s)
`TauCeti.EtaleDuality.top_degree_compact_cohomology`.

Let X be separated of finite type of dimension ≤ d over an algebraically closed field k, n
invertible in k, Λ = ℤ/n. Then H^q_c(X, F) = 0 for q > 2d and every torsion sheaf F, and the
trace gives H^{2d}_c(X, Λ(d)) ≅ Λ^{C_d}, C_d the set of irreducible components of dimension d,
the trace on the factor of a component of multiplicity m being multiplication by m. In
particular, for X geometrically irreducible of dimension d over a field k₀ with k = k̄₀,
H^{2d}_c(X_k, Λ) ≅ Λ(−d) as a Galois module (geometric Frobenius acting by q^d over 𝔽_q). For X
smooth connected of dimension d and F locally constant constructible, H^{2d}_c(X, F) ≅
(F_x̄)_{π₁(X, x̄)}(−d) (coinvariants); this is EDC.2:pairings/extreme-degree-cohomology.

Hypotheses. X separated of finite type over an algebraically closed field (for the Galois
statement, base change from k₀).

Construction and proof. (1) Vanishing above 2d: SGA 4 XVII 5.2.8.1. (2) Remove the closed set
where X is not flat Cohen-Macaulay of dimension d plus the components of smaller dimension:
R^{2d} is unchanged (SGA 4 XVIII 2.1). On the dense smooth open part of X_red of each
d-dimensional component (k algebraically closed, hence perfect), smooth purity gives
H^{2d}_c(U, Λ(d)) ≅ H⁰(U, Λ)^∨ = Λ^{π₀(U)} through Tr; multiplicities enter through the
CM-locus trace (Remark 2.10.1). (3) Galois equivariance: Tr is compatible with base change (Var
2), hence Galois-equivariant into Λ, so H^{2d}_c(X_k, Λ) ≅ Λ(−d).

Acceptance. X = P^d: H^{2d}(P^d, Λ(d)) ≅ Λ. X = A^d ∪ A^{d−1} (disjoint): H^{2d}_c ≅ Λ.

Depends on: `flat-trace`, `smooth-purity`, `compact-pushforward-amplitude-and-colimits`,
`mathlib:IsSepClosed`.

Source: SGA4-XVIII, Lemme 2.1, p. 550; SGA4-XVIII, Remarque 2.10.1, p. 559.

## EDC.1:biduality — constructible biduality and global duality

Using the smooth dualizing complex, this layer proves constructible biduality by stratification
and dévissage, the exchange isomorphisms in both directions, the constructible recollement data
consumed by EDC.5, and relative duality Ra_*D_X K ≅ RHom(Ra_!K, Λ) in D(k_ét, Λ) with its
geometric form. Acceptance (stage text): a closed point and its open complement, with both
localization triangles and all shifts — the example of recollement-adjunctions; and Spec 𝔽_q,
which separates relative from absolute duality — the example of relative-and-geometric-duality.

### `dualizing-complex-of-smooth-scheme` — The dualizing complex of a smooth scheme and the dual of a local system

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme`
(theorem); module `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; suggested declaration(s)
`TauCeti.EtaleDuality.dualizingComplex_smooth`.

Let X be smooth of pure dimension d over a field k, n invertible in k, Λ with nΛ = 0. Then K_X
≅ Λ(d)[2d] canonically (via t_a for a : X → Spec k). If moreover Λ is self-injective (e.g. ℤ/ℓⁿ
or O/πⁿ) and L is a locally constant constructible sheaf of Λ-modules, then RHom(L, Λ) = L^∨ :=
Hom(L, Λ) in degree 0 and D_X(L) ≅ L^∨(d)[2d]; the evaluation L → D_X D_X L is an isomorphism.
For a smooth closed pair Z ⊂ X of pure codimension c, i^!K_X = K_Z gives i^!Λ_X ≅ Λ_Z(−c)[−2c].

Hypotheses. X smooth of pure dimension d over a field k; Λ killed by n invertible.
Self-injectivity of Λ is used for L^∨ to be the derived dual; over ℤ_ℓ the derived dual has Ext
terms (EDC.2:pairings/adic-and-rational-poincare-duality).

Construction and proof. (1) K_X = a^!Λ ≅ a^*Λ(d)[2d] = Λ(d)[2d] by
EDC.2:trace-purity/smooth-purity. (2) For L locally constant constructible, ℰxt^q(L, Λ) is
computed étale-locally where L is constant with finite stalk M, and Ext^q_Λ(M, Λ) = 0 for q > 0
because Λ is self-injective (EDC.1:biduality/self-injective-coefficients); so RHom(L, Λ(d)[2d])
= L^∨(d)[2d], and biduality reduces to M ≅ Hom(Hom(M, Λ), Λ) for finitely generated modules
over a self-injective artinian ring (Matlis duality). (3) Closed pair: i^!K_X ≅ K_Z by
composition, then cancel twists (EDC.3/smooth-pair-purity gives the canonical form).

Acceptance. X a smooth curve over an algebraically closed field: K_X ≅ Λ(1)[2].

Depends on: `smooth-purity`, `dualizing-complex`, `verdier-dual`,
`self-injective-coefficients`.

Source: SGA4-XVIII, 3.2.6, p. 586; SGA4-XVIII, Théorème 3.2.5, p. 586.

### `self-injective-coefficients` — ℤ/ℓⁿ and O/πⁿ are self-injective

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/self-injective-coefficients` (lemma);
module `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; suggested declaration(s)
`TauCeti.EtaleDuality.zmod_selfInjective`.

Let O be a discrete valuation ring with uniformizer π (for example ℤ_ℓ or the ring of integers
O_E of a finite extension E/ℚ_ℓ) and n ≥ 1. Then Λ = O/πⁿ is injective as a module over itself.
Consequently Hom_Λ(−, Λ) is exact on Λ-modules, Ext^q_Λ(M, Λ) = 0 for q > 0, and M → Hom(Hom(M,
Λ), Λ) is an isomorphism for finitely generated M. For Λ = ℤ/ℓ² the module ℤ/ℓ is not
projective, so finite-level duality is a statement about the self-injective ring, not about a
field.

Hypotheses. O a discrete valuation ring; n ≥ 1.

Construction and proof. (1) Baer's criterion (Mathlib Module.Baer): the ideals of O/πⁿ are
πᵏO/πⁿ; a map πᵏO/πⁿ → O/πⁿ sends πᵏ to an element killed by π^{n−k}, which lies in π^kO/πⁿ, so
it extends to multiplication by an element. (2) Matlis duality for the artinian local
Gorenstein ring O/πⁿ gives the double-dual isomorphism on finitely generated modules (each is a
sum of O/πᵏ).

Acceptance. Hom_{ℤ/ℓ²}(ℤ/ℓ, ℤ/ℓ²) ≅ ℤ/ℓ, generated by 1 ↦ ℓ.

Depends on: `mathlib:Module.Injective`, `mathlib:Module.Baer`, `mathlib:ZMod`.

Source: SGA4-XVIII, 3.2.6, p. 586.

### `constructible-biduality` — Verdier biduality on constructible complexes ★

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality` (theorem); planet
“Verdier biduality”; module `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; suggested
declaration(s) `TauCeti.EtaleDuality.verdierDualEval_isIso_constant`.

Let X be separated of finite type over a field k (or over a regular noetherian base of
dimension ≤ 1 such as ℤ[1/ℓ]), n invertible, and Λ = O/πⁿ (more generally a noetherian
self-injective ring killed by n). Then D_X preserves D^b_c(X, Λ) and D_ctf(X, Λ), and for K ∈
D^b_c(X, Λ) the evaluation ev_K : K → D_X D_X K is an isomorphism. Hence D_X : D^b_c(X, Λ)^op →
D^b_c(X, Λ) is an anti-equivalence with D_X² ≅ id. For a general finite coefficient ring the
statement is restricted to D_ctf, and no biduality is asserted for non-Gorenstein Λ.

Hypotheses. X separated of finite type over a field (for the regular one-dimensional base, SGA
4½ [Th. finitude] 4.3, as DWP.7 requests); n invertible. Λ self-injective (Gorenstein of
dimension 0) and noetherian; over ℤ_ℓ or ℚ_ℓ biduality is obtained by passage to the limit in
EDC.6. Uses the finiteness theorem (Rj_* and Ri^! preserve D^b_c), imported through
SchemeAndStackFoundations SF.2.

Construction and proof. (1) Both sides are triangulated in K, so by dévissage along a
stratification X = ⊔ X_α into smooth connected locally closed strata on which the ℋ^q K are
locally constant (the stratification exists by constructibility, refined to smooth strata
because the reduced strata are generically smooth over a perfect closure; over an imperfect
field use a purely inseparable base change, which does not change étale sites), and the
localization triangles j_!j^* → id → i_*i^* →, it suffices to treat K = (j_α)_!L with L locally
constant on a smooth stratum. (2) Exchange (EDC.1:adjoint/formal-duality-exchange):
D_X((j_α)_!L) ≅ R(j_α)_*D_{X_α}L, and on the smooth stratum D(L) = L^∨(d)[2d]
(EDC.1:biduality/dualizing-complex-of-smooth-scheme). Constructibility of R(j_α)_* (imported
finiteness) gives D_X preserves D^b_c. (3) Biduality for (j_α)_!L: apply D again; D_X(Rj_*M) ≅
j_!D_U(M) for M ∈ D^b_c(U) is the dual statement, proved by induction on dim X using the same
dévissage on X − U and the identity i^!Rj_* = 0; the local calculation on a smooth stratum is L
≅ L^∨∨ (self-injectivity).

Acceptance. X = Spec Ω (Ω separably closed): biduality is M ≅ Hom(Hom(M, Λ), Λ) on perfect
complexes over Λ = ℤ/ℓⁿ. X a smooth curve, K = j_*L for j : U → X dense open and L locally
constant: D_X(j_*L) ≅ j_*(L^∨)(1)[2] (used for Weil I 2.12).

Depends on: `dualizing-complex-of-smooth-scheme`, `formal-duality-exchange`, `verdier-dual`,
`local-cohomology-identification`, `constructible-ctf-complexes`,
`SchemeAndStackFoundations:SF.2`.

Source: SGA4-XVIII, 3.2.6, (3.2.6.1), p. 586; SGA4-XVIII, 0.2, p. 481.

### `duality-exchange-isomorphisms` — Duality exchanges f_* with f_! and f^* with f^!

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms` (theorem).

Under the hypotheses of EDC.1:biduality/constructible-biduality, for f : X → S a morphism of
schemes separated of finite type over k and constructible complexes: D_S ∘ Rf_* ≅ Rf_! ∘ D_X on
D^b_c(X, Λ) and D_X ∘ f^! ≅ f^* ∘ D_S on D^b_c(S, Λ); in particular, for i : Z → X closed and j
: U → X open, D_Z i^* ≅ i^! D_X, D_X i_* ≅ i_* D_Z, D_U j^* ≅ j^* D_X and D_X Rj_* ≅ j_! D_U.
Moreover D_X(K ⊗^L L) ≅ RHom(K, D_X L) for K, L ∈ D^b_c, and f^! preserves D^b_c.

Hypotheses. As in constructible-biduality; constructibility of Rf_* and f^! is part of the
conclusion (f^! via f^! = D f^* D).

Construction and proof. (1) Apply D to the formal exchanges D_S Rf_! ≅ Rf_* D_X and D_X f^* ≅
f^! D_S (EDC.1:adjoint/formal-duality-exchange) and use biduality on both sides;
constructibility of f^!K follows from f^!K ≅ D_X f^* D_S K.

Acceptance. For i the inclusion of a closed point of a smooth curve C over an algebraically
closed field: i^!Λ ≅ D(i^*D_C Λ) = D(Λ(1)[2]) = Λ(−1)[−2].

Depends on: `constructible-biduality`, `formal-duality-exchange`.

Source: SGA4-XVIII, 3.1.10 and 3.2.6, p. 573 and 586.

### `recollement-adjunctions` — Open-closed recollement on constructible complexes ★

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions` (theorem); planet
“Open–closed recollement”.

Let X be separated of finite type over a field, i : Z → X closed with open complement j : U →
X, Λ = O/πⁿ (or a self-injective noetherian ring killed by n invertible). On D^b_c the six
functors i^*, i_* = i_!, i^!, j_!, j^* = j^!, Rj_* satisfy: i^* ⊣ i_* ⊣ i^! and j_! ⊣ j^* ⊣
Rj_*; i_*, j_! and Rj_* are fully faithful; j^*i_* = 0, i^*j_! = 0 and i^!Rj_* = 0; and there
are distinguished triangles j_!j^*K → K → i_*i^*K → and i_*i^!K → K → Rj_*j^*K →, natural in K.
Duality exchanges the two triangles. These are the recollement data (BBD 1.4.3) that EDC.5 uses
to glue the perverse t-structure.

Hypotheses. X separated of finite type over a field; constructible coefficients; Λ as in
constructible-biduality.

Construction and proof. (1) The adjunctions and triangles hold on the unbounded categories
(EDC.0/cohomology-with-supports, EDC.1:adjoint/local-cohomology-identification);
constructibility of Rj_* and i^! (imported finiteness and
EDC.1:biduality/duality-exchange-isomorphisms) restricts them to D^b_c. (2) The vanishing
statements are checked on stalks (j^*i_*) or by adjunction (i^!Rj_* = right adjoint of j^*i_* =
0).

Acceptance. X = A¹, Z = {0}: for K = Λ the second triangle has i^!Λ = Λ(−1)[−2] and Rj_*Λ with
stalk at 0 equal to Λ ⊕ Λ(−1)[−1]: both triangles and all shifts are verified (the closed-point
acceptance test of EDC.1).

Depends on: `local-cohomology-identification`, `duality-exchange-isomorphisms`,
`cohomology-with-supports`, `constructible-ctf-complexes`, `SchemeAndStackFoundations:SF.2`.

Source: SGA4-XVIII, Proposition 3.1.8, p. 571.

### `relative-and-geometric-duality` — Global Verdier duality over a field: relative and geometric forms ★

Node `EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality` (theorem);
planet “Global Verdier duality”; module `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`;
suggested declaration(s) `TauCeti.EtaleDuality.relative_duality`.

Let X be separated of finite type over a field k with a : X → Spec k, n invertible, Λ = O/πⁿ
(or self-injective, killed by n). (a) Relative duality in D(k_ét, Λ): Ra_*D_X K ≅ RHom(Ra_!K,
Λ) for every K ∈ D(X, Λ), as complexes of Gal(k_s/k)-modules. (b) Geometric duality: for X̄ :=
X ⊗_k k_s, RΓ(X̄, D_X̄ K̄) ≅ RHom_Λ(RΓ_c(X̄, K̄), Λ), and for K ∈ D^b_c, H^{−q}(X̄, D K̄) ≅
Hom_Λ(H^q_c(X̄, K̄), Λ) since Λ is self-injective. The relative form is not the same as a
statement about absolute cohomology RΓ(X, −) = RΓ(k, Ra_*−): for X = Spec 𝔽_q and K = Λ, the
absolute groups RΓ(X, D_X Λ) = RΓ(𝔽_q, Λ) are Λ in degrees 0 and 1, while RHom_Λ(RΓ(𝔽_q, Λ), Λ)
is Λ in degrees 0 and −1, so the absolute analogue of (b) is false. Over ℤ_ℓ the derived dual
and its Ext terms are retained (EDC.6 and EDC.2:pairings/adic-and-rational-poincare-duality).

Hypotheses. X separated of finite type over a field k; n invertible in k. (a) holds for all K ∈
D(X, Λ); the degreewise form in (b) uses self-injectivity of Λ.

Construction and proof. (1) (a) is EDC.1:adjoint/sheafified-adjunction (a) for a with L := K
and K := Λ, using a^!Λ = K_X (EDC.1:adjoint/dualizing-complex). (2) (b): proper base change
along Spec k_s → Spec k (imported) commutes Ra_*, Ra_! with geometric fibres, and the stalk of
RHom(Ra_!K, Λ) at the geometric point is RHom(RΓ_c(X̄, K̄), Λ) since Ra_!K is constructible
(bounded with finite cohomology) for K ∈ D^b_c; self-injectivity gives the degreewise
statement.

Acceptance. X = Spec k: (a) is RHom(K, Λ) ≅ RHom(K, Λ). X = Spec 𝔽_q, K = Λ: relative duality
holds in D(𝔽_q,ét, Λ), while the absolute form fails in degrees ±1 (H¹(𝔽_q, Λ) = Λ against
Ext^{−1} = Λ in degree −1), as the stage requires to be tested. X = P¹ over an algebraically
closed field: H^{−q}(X, D Λ) = H^{2−q}(X, Λ(1)) is dual to H^q(X, Λ).

Depends on: `sheafified-adjunction`, `dualizing-complex`, `self-injective-coefficients`,
`constructible-ctf-complexes`, `SchemeAndStackFoundations:SF.2`.

Source: SGA4-XVIII, 3.2.6, p. 586; Stacks-MoreEtale, Lemma 11.6 (tag 0GLD).

## EDC.2:pairings — Poincaré pairings and their normalizations

The perfect pairing H^i_c(X̄, F) × H^{2d−i}(X̄, F^∨(d)) → Λ at finite level, its identification
with cup product and trace, graded symmetry, Galois and Frobenius equivariance ⟨Fx, Fy⟩ =
q^d⟨x, y⟩, the derived integral and the rational ℓ-adic forms (kept separate), the curve
statements Weil I (2.10) and (2.12) (the latter keeps the identifier of the integrated
decomposition), the tensor-Hom identifications on curves used by Yu, and relative duality for
smooth morphisms with locally constant coefficients.

### `poincare-duality-torsion` — Poincaré duality for smooth varieties with torsion coefficients ★

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion` (theorem); planet
“Poincaré duality pairing”; module `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`;
suggested declaration(s) `TauCeti.EtaleDuality.poincare_duality,
TauCeti.EtaleDuality.poincarePairing`.

Let X be smooth, separated, of finite type and of pure dimension d over a separably closed
field k, n invertible in k, Λ = O/πⁿ (e.g. ℤ/ℓⁿ), and F a locally constant constructible sheaf
of Λ-modules. Then RΓ(X, F^∨(d)[2d]) ≅ RHom_Λ(RΓ_c(X, F), Λ), and for every i the pairing
H^i_c(X, F) × H^{2d−i}(X, F^∨(d)) → H^{2d}_c(X, Λ(d)) →Tr Λ is a perfect pairing of finitely
generated Λ-modules. For X proper, H_c = H. For general Λ killed by n the derived statement
holds with F^∨ := RHom(F, Λ) and the degreewise statement needs self-injectivity.

Hypotheses. k separably closed (for a general k apply to X ⊗ k_s with Galois action:
EDC.2:pairings/galois-frobenius-equivariance). X smooth separated of pure dimension d; F
locally constant constructible; Λ = O/πⁿ.

Construction and proof. (1) Combine EDC.1:biduality/relative-and-geometric-duality (b) with D_X
F = F^∨(d)[2d] (EDC.1:biduality/dualizing-complex-of-smooth-scheme). (2) Identify the pairing
with cup product followed by the trace (EDC.2:pairings/cup-product-trace-pairing). (3)
Finiteness of H^i_c and H^i: imported finiteness theorem.

Acceptance. X = P¹, F = Λ: H⁰ × H²(Λ(1)) → Λ and H¹ = 0. X = G_m, F = Λ: H¹_c(G_m, Λ) ≅ Λ is
dual to H¹(G_m, Λ(1)) ≅ Λ.

Depends on: `relative-and-geometric-duality`, `dualizing-complex-of-smooth-scheme`,
`SchemeAndStackFoundations:SF.2`.

Source: SGA4-XVIII, 3.2.6, (3.2.6.2), p. 586; Milne-LEC, Theorem 24.1, p. 144.

### `cup-product-trace-pairing` — The duality pairing is cup product followed by the trace; graded symmetry

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing` (theorem).

In the situation of EDC.2:pairings/poincare-duality-torsion, the pairing defined by the duality
isomorphism equals ⟨x, y⟩ = Tr_X(x ∪ y) for x ∈ H^i_c(X, F), y ∈ H^{2d−i}(X, F^∨(d)), where ∪ :
H^i_c(X, F) ⊗ H^j(X, G) → H^{i+j}_c(X, F ⊗ G) is the cup product and F ⊗ F^∨ → Λ is evaluation.
For F = Λ and X proper, the cup-product pairing H^i(X, Λ) × H^{2d−i}(X, Λ(d)) → Λ satisfies ⟨x,
y⟩ = (−1)^{i(2d−i)}⟨y, x⟩ = (−1)^i ⟨y, x⟩ after identifying Λ(d) ⊗ Λ ≅ Λ ⊗ Λ(d); in the middle
degree i = d with d odd it is alternating, and with d even symmetric. For smooth proper f : X →
S of relative dimension d with connected geometric fibres, R^{2d}f_*Λ(d) ≅ Λ via Tr_f and the
fibrewise pairings R^jf_*Λ ⊗ R^{2d−j}f_*Λ → R^{2d}f_*Λ → Λ(−d) are morphisms of sheaves
compatible with base change, so monodromy preserves them.

Hypotheses. As in poincare-duality-torsion; for the relative form f smooth proper with
geometrically connected fibres, n invertible on S.

Construction and proof. (1) The duality isomorphism is the adjoint of Tr through the evaluation
K ⊗^L D K → K_X; on cohomology this is cup product with the evaluation map followed by Tr (SGA
4 XVIII 3.2.6, Milne LEC 24.1 discussion). (2) Graded commutativity of the cup product on H*(X,
Λ) (Koszul sign (−1)^{ij}), with i(2d − i) ≡ i mod 2. (3) Relative form: Tr_f is an isomorphism
for connected geometric fibres (EDC.2:trace-purity/flat-trace, isomorphism criterion) and
commutes with base change (Var 2); R^jf_* = R^jf_! commutes with base change (proper base
change, imported).

Acceptance. Curve (d = 1): the pairing on H¹ is alternating, matching the Weil pairing on J[n]
(Milne LEC 14.8). Surface (d = 2): the pairing on H² is symmetric; on P¹ × P¹ its matrix in the
basis of the two rulings is [[0, 1], [1, 0]].

Depends on: `poincare-duality-torsion`, `flat-trace`, `SchemeAndStackFoundations:SF.2`.

Source: Milne-LEC, §24, p. 145; SGA4-XVIII, Proposition 2.12, p. 559-560.

### `galois-frobenius-equivariance` — Galois and Frobenius equivariance of the Poincaré pairing

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance` (theorem).

Let X₀ be smooth separated of finite type of pure dimension d over a field k₀, X = X₀ ⊗ k_s,
and F₀ locally constant constructible on X₀. The pairing H^i_c(X, F) × H^{2d−i}(X, F^∨(d)) → Λ
of EDC.2:pairings/poincare-duality-torsion is Gal(k_s/k₀)-equivariant (Λ with trivial action).
Over k₀ = 𝔽_q with geometric Frobenius F: for the untwisted pairing H^i_c(X, Λ) × H^{2d−i}(X,
Λ) → H^{2d}_c(X, Λ) ≅ Λ(−d), one has ⟨Fx, Fy⟩ = q^d⟨x, y⟩. Consequently, if F acts on H^i_c
with eigenvalue α then q^d/α is an eigenvalue of F on H^{2d−i}, with multiplicities preserved.

Hypotheses. k₀ arbitrary for Galois equivariance; k₀ = 𝔽_q for the Frobenius statement.

Construction and proof. (1) Trace and cup product are compatible with base change (Var 2) and
hence with the Galois action; the twist Λ(d) carries the cyclotomic character. (2) Geometric
Frobenius acts on Λ(−d) by q^d (EDC.0/tate-twist).

Acceptance. X = P¹ over 𝔽_q: F acts on H⁰ by 1 and on H² by q, and ⟨F·1, Fy⟩ = q⟨1, y⟩.
Elliptic curve E over 𝔽_q: the Frobenius eigenvalues α, β on H¹ satisfy αβ = q.

Depends on: `poincare-duality-torsion`, `cup-product-trace-pairing`, `tate-twist`.

Source: Deligne-WeilI-1974, Théorème (2.12), p. 283.

### `adic-and-rational-poincare-duality` — ℓ-adic and rational Poincaré duality, with the integral derived form kept separate ★

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`
(theorem); planet “ℓ-adic Poincaré duality”.

Let X be smooth separated of finite type of pure dimension d over a separably closed field k,
E/ℚ_ℓ finite with ring of integers O_E and uniformizer π, ℓ invertible in k, and F a lisse
O_E-sheaf (compatible system (F_m) of locally constant constructible O_E/π^m-sheaves). With
H^i_c(X, F) := lim_m H^i_c(X, F_m) and H^i(X, F^∨(d)) := lim_m H^i(X, F_m^∨(d)) (finitely
generated O_E-modules), there is a derived duality RΓ(X, F^∨(d)[2d]) ≅ RHom_{O_E}(RΓ_c(X, F),
O_E), hence short exact sequences 0 → Ext¹_{O_E}(H^{2d−i+1}_c(X, F), O_E) → H^i(X, F^∨(d)) →
Hom(H^{2d−i}_c(X, F), O_E) → 0. After ⊗E, the pairing H^i_c(X, F_E) × H^{2d−i}(X, F_E^∨(d)) → E
is a perfect pairing of finite-dimensional E-vector spaces, Galois-equivariant
(Frobenius-equivariant over 𝔽_q).

Hypotheses. k separably closed; ℓ invertible; F lisse; finite-level duality is applied at each
level O_E/π^m (self-injective). The ℓ-adic realization (limits, Mittag-Leffler for finite
groups, finiteness of H^i) is imported from EllAdicRealization through
SchemeAndStackFoundations SF.2; the pro-étale comparison is EDC.6.

Construction and proof. (1) At level m: RΓ(X, F_m^∨(d)[2d]) ≅ RHom_{O/π^m}(RΓ_c(X, F_m), O/π^m)
(EDC.2:pairings/poincare-duality-torsion), compatible with reduction
(EDC.0/coefficient-change). (2) Pass to the derived limit: R lim of RHom_{O/π^m}(C ⊗^L O/π^m,
O/π^m) is RHom_{O_E}(C, O_E) for C a perfect O_E-complex computing RΓ_c(X, F) (finiteness), and
the groups are finite so lim¹ vanishes. (3) The universal coefficient sequence for
RHom_{O_E}(C, O_E) gives the Ext¹ terms; they are torsion and vanish after ⊗E.

Acceptance. X a smooth projective curve of genus g, F = ℤ_ℓ: H¹(X, ℤ_ℓ) is free of rank 2g and
the pairing H¹ × H¹ → ℤ_ℓ(−1) is perfect (unimodular). An Enriques surface over k of
characteristic ≠ 2, ℓ = 2: H²(X, ℤ_2) has torsion ℤ/2 and H³(X, ℤ_2) ≅ ℤ/2, illustrating the
Ext¹ term; over ℚ_2 the pairing is perfect.

Depends on: `poincare-duality-torsion`, `coefficient-change`, `galois-frobenius-equivariance`,
`SchemeAndStackFoundations:SF.2`.

Source: Deligne-WeilI-1974, (2.14) A), p. 283.

### `curve-poincare-duality-with-j-star-statement` — Poincaré duality on a projective curve with j_* coefficients (Weil I 2.12)

Node `EtaleDualityAndPerverseSheaves:EDC.2/curve-poincare-duality-with-j-star-statement`
(theorem).

Let X be a projective smooth connected curve over an algebraically closed field k, j : U → X
the inclusion of a dense open, ℓ invertible in k, and F a lisse ℚ_ℓ-sheaf (or a locally
constant constructible O/πⁿ-sheaf) on U. Then D_X(j_*F) ≅ j_*(F^∨)(1)[2], and the pairing Tr(x
∪ y) : H^i(X, j_*F) ⊗ H^{2−i}(X, j_*F^∨(1)) → H²(X, j_*(F ⊗ F^∨)(1)) → H²(X, ℚ_ℓ(1)) → ℚ_ℓ is a
perfect duality, Frobenius-equivariant when X, U and F are defined over 𝔽_q. The stalks of j_*F
at the points of X − U are the local monodromy invariants.

Hypotheses. X projective smooth connected curve over k algebraically closed; F lisse on U; for
ℚ_ℓ coefficients pass to the limit as in EDC.2:pairings/adic-and-rational-poincare-duality. The
torsion statement needs the dual of j_*F to be j_*(F^∨)(1)[2], which is the local calculation
at the punctures.

Construction and proof. (1) Local calculation (the computation Deligne calls 'pas difficile',
Weil I (2.14) E): at a puncture s with inclusion i_s, i_s^*j_*F = F^{I_s} (invariants) and
i_s^!j_*F = (F_{I_s})(−1)[−2] (coinvariants), and the duality between invariants and
coinvariants of the dual representation gives D(j_*F) ≅ j_*(F^∨)(1)[2]
(EDC.1:biduality/constructible-biduality, example). (2) Then global duality
(EDC.1:biduality/relative-and-geometric-duality) gives RΓ(X, j_*F^∨(1)[2]) ≅ RHom(RΓ(X, j_*F),
Λ), identified with the cup-product pairing (EDC.2:pairings/cup-product-trace-pairing); pass to
ℚ_ℓ.

Acceptance. Used in Weil I (3.9) and Weil II (3.3.5) to turn upper weight bounds into lower
bounds; the pairing is on j_*F, not on j_!F. U = X: the usual Poincaré duality on the curve.

Depends on: `constructible-biduality`, `relative-and-geometric-duality`,
`cup-product-trace-pairing`, `adic-and-rational-poincare-duality`.

Source: Deligne-WeilI-1974, §2, Théorème (2.12), p. 283; Deligne-WeilI-1974, §2, (2.14) E), p.
283.

### `extreme-degree-cohomology` — Cohomology in degrees 0 and 2d with compact supports

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/extreme-degree-cohomology` (theorem).

Let X be smooth, separated, connected of dimension d ≥ 1 over a separably closed field k, n
invertible, and F a locally constant constructible sheaf of Λ-modules (Λ = O/πⁿ) or a lisse
ℚ_ℓ-sheaf. (a) H^{2d}_c(X, F) ≅ (F_x̄)_{π₁(X, x̄)}(−d), the coinvariants of the monodromy
representation, twisted. (b) If X is affine, H⁰_c(X, F) = 0. (c) For d = 1 (a curve, Weil I
(2.10)): H⁰_c(X, F) = 0 when X is affine and H²_c(X, F) = (F_x̄)_{π₁(X, x̄)}(−1). In
particular, for a rank-one F with geometrically nontrivial monodromy on a non-proper
geometrically connected X, H⁰_c = H^{2d}_c = 0.

Hypotheses. X smooth connected; for (b) affine (or more generally with no proper component).

Construction and proof. (1) (a): by EDC.2:pairings/poincare-duality-torsion, H^{2d}_c(X, F) is
dual to H⁰(X, F^∨(d)) = ((F_x̄)^∨)^{π₁}(d), and duality exchanges invariants of the dual with
coinvariants. (2) (b): a section of F with compact (proper) support on a connected non-proper X
is zero (its support is open and closed and proper).

Acceptance. X = A¹, F = Λ: H⁰_c = 0 and H²_c = Λ(−1). X = G_m, F = the Kummer sheaf of a
nontrivial character χ of μ_m: H⁰_c = H²_c = 0.

Depends on: `poincare-duality-torsion`, `adic-and-rational-poincare-duality`,
`top-degree-compact-cohomology`.

Source: Deligne-WeilI-1974, Scholie (2.10), p. 282.

### `lisse-tensor-hom-duality-on-curves` — H⁰ and H² of F₁ ⊗ F₂^∨ on a proper curve

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/lisse-tensor-hom-duality-on-curves`
(theorem).

Let X be a projective smooth connected curve over an algebraically closed field (or the
geometric curve of one over 𝔽_q), and F₁, F₂ lisse ℚ̄_ℓ-sheaves. Then H⁰(X, F₁ ⊗ F₂^∨) =
Hom_X(F₂, F₁) and H²(X, F₁ ⊗ F₂^∨) ≅ H⁰(X, F₁^∨ ⊗ F₂(1))^∨ = Hom_X(F₁, F₂)^∨(−1),
Frobenius-equivariantly for Weil sheaves; on a non-proper U the same holds for H⁰_c = 0 and
H²_c by EDC.2:pairings/extreme-degree-cohomology. (Yu prints the two Hom's in the opposite
order; see sourceIssues.)

Hypotheses. Lisse ℚ̄_ℓ coefficients (via finite E and passage to the limit).

Construction and proof. (1) F₁ ⊗ F₂^∨ ≅ Hom(F₂, F₁) as lisse sheaves, so global sections are
Hom_X(F₂, F₁). (2) Poincaré duality (EDC.2:pairings/adic-and-rational-poincare-duality) on the
proper curve gives H²(X, G) ≅ H⁰(X, G^∨(1))^∨ with G^∨ = F₁^∨ ⊗ F₂ ≅ Hom(F₁, F₂). (3) Frobenius
equivariance from EDC.2:pairings/galois-frobenius-equivariance.

Acceptance. F₁ = F₂ irreducible: H⁰ and H² are one-dimensional, giving the pole of the
self-pair L-function (Yu Prop. 6.1.1).

Depends on: `adic-and-rational-poincare-duality`, `galois-frobenius-equivariance`,
`extreme-degree-cohomology`.

Source: Yu-2023, §6.1, equations (6.1.1)-(6.1.2), p. 42.

### `relative-duality-locally-constant` — Relative Poincaré duality for smooth morphisms with locally constant coefficients

Node `EtaleDualityAndPerverseSheaves:EDC.2:pairings/relative-duality-locally-constant`
(theorem).

Let f : X → S be smooth compactifiable of pure relative dimension d, n invertible on S, Λ =
O/πⁿ, and F a locally constant constructible sheaf of Λ-modules on X such that the R^q f_!(F^∨)
are locally constant constructible for all q. Then R^q f_*F ≅ Hom_Λ(R^{2d−q}f_!(F^∨), Λ)(−d)
for every q, compatibly with base change; in particular, for f proper smooth the sheaves R^q
f_*F and R^{2d−q}f_*(F^∨(d)) are dual local systems. This is the scheme analogue of Berkovich's
Theorem 7.4.9 requested by ClassicalAdicEtaleCohomology H5.

Hypotheses. f smooth compactifiable of pure relative dimension d; F locally constant
constructible with locally constant R^q f_!(F^∨); Λ self-injective.

Construction and proof. (1) Rf_*RHom(F^∨, f^!Λ) ≅ RHom(Rf_!F^∨, Λ)
(EDC.1:adjoint/sheafified-adjunction), with f^!Λ = Λ(d)[2d] (EDC.2:trace-purity/smooth-purity)
and RHom(F^∨, Λ) = F. (2) If the R^q f_!F^∨ are locally constant constructible, ℰxt^p(R^q
f_!F^∨, Λ) = 0 for p > 0 (self-injectivity, stalkwise), so the spectral sequence degenerates to
the stated isomorphism.

Acceptance. f : A^d_S → S, F = Λ: R^q f_*Λ = Λ for q = 0 and 0 otherwise, dual to R^{2d}f_!Λ(d)
≅ Λ.

Depends on: `sheafified-adjunction`, `smooth-purity`, `self-injective-coefficients`.

Source: SGA4-XVIII, Théorème 3.2.5, p. 585.

## EDC.3 — Gysin maps and cycle classes

For a smooth closed pair over a field: purity i^!Λ ≅ Λ(−c)[−2c] (from smooth purity of both
members and composition of f^!), semi-purity, the fundamental class with supports (through the
smooth locus for a singular cycle, over a perfect field), Gysin maps and proper pushforward
with projection formula and trace compatibility, the Gysin sequence, the projective-bundle
freeness that defines Chern classes, Chern classes, the cycle class map CH^r(X) → H^{2r}(X,
Λ(r)) with its compatibilities, the self-intersection formula and the cohomology of projective
space. Acceptance (stage text): hyperplanes in P^n, a transverse intersection, a
self-intersection, and a singular divisor through the actual fundamental-class construction —
the tests of cycle-class-map and fundamental-class. EDC.3 exports the geometric étale cycle
map; RefinedTraceMethods keeps its K-theoretic and syntomic regulators.

### `smooth-pair-purity` — Cohomological purity for a smooth pair ★

Node `EtaleDualityAndPerverseSheaves:EDC.3/smooth-pair-purity` (theorem); planet “Purity for
smooth pairs”; module `TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; suggested
declaration(s) `TauCeti.EtaleDuality.smooth_pair_purity`.

Let k be a field, n invertible in k, Λ with nΛ = 0, X smooth over k and i : Z → X a closed
immersion with Z smooth over k, of pure codimension c. Then there is a canonical isomorphism
i^!Λ_X ≅ Λ_Z(−c)[−2c] in D(Z, Λ); equivalently ℋ^q_Z(Λ_X) = 0 for q ≠ 2c and ℋ^{2c}_Z(Λ(c)) ≅
Λ_Z, and for every locally constant constructible F on X, H^q_Z(X, F) ≅ H^{q−2c}(Z, i^*F(−c)).
The generator s_{Z/X} ∈ H^{2c}_Z(X, Λ(c)) corresponding to 1 is the fundamental class
(EDC.3/fundamental-class); for c = 1 it is the Kummer local class of the divisor Z
(EDC.2:trace-purity/first-chern-class). The formula is for a smooth pair over a field; a
regular immersion into a singular ambient scheme, or a regular pair over a trait, is not
covered (that is Gabber's absolute purity, outside this roadmap's stated scope).

Hypotheses. X and Z smooth over the field k; i a closed immersion of pure codimension c. F
locally constant constructible for the version with coefficients (projection formula for i^!).

Construction and proof. (1) Composition of exceptional inverse images: i^!a_X^! ≅ a_Z^!
(EDC.1:adjoint/upper-shriek-pseudofunctor), with a_X^!Λ = Λ(d)[2d] and a_Z^!Λ = Λ(d − c)[2(d −
c)] (EDC.2:trace-purity/smooth-purity), so i^!Λ_X(d)[2d] ≅ Λ_Z(d − c)[2d − 2c]; cancel the
invertible twist and shift (EDC.0/tate-twist). (2) Canonicity: the composite is independent of
d (additivity over components) and compatible with étale localization on X; for c = 1, compare
with the Kummer local class by reducing étale-locally to Z = {t = 0} ⊂ A¹ × Z and the
computation on A¹ (EDC.0/cohomology-with-supports test). (3) Coefficients: i^!(F) ≅ i^*F ⊗ i^!Λ
for F locally constant (projection formula / induction formula,
EDC.1:adjoint/sheafified-adjunction). (4) Local calculation: a smooth pair is étale-locally
isomorphic to the zero section Z → Z × A^c (EGA IV 17.12.2); by étale excision
(EDC.0/cohomology-with-supports) and the Künneth formula the canonical isomorphism is the
c-fold external product of the point-on-a-line case H²_{0}(A¹, Λ(1)) ≅ Λ, so the identification
is independent of the chart and agrees with the composition isomorphism.

Acceptance. A point on a curve: i^!Λ ≅ Λ(−1)[−2]. A hyperplane P^{n−1} ⊂ P^n:
H^q_{P^{n−1}}(P^n, Λ) ≅ H^{q−2}(P^{n−1}, Λ(−1)).

Depends on: `smooth-purity`, `upper-shriek-pseudofunctor`, `local-cohomology-identification`,
`sheafified-adjunction`, `tate-twist`, `mathlib:AlgebraicGeometry.IsClosedImmersion`,
`mathlib:AlgebraicGeometry.Smooth`.

Source: Milne-LEC, Theorem 16.1, p. 108; SGA4-XVIII, 3.1.13, p. 576.

### `semi-purity` — Semi-purity: H^q_Z(X, Λ) = 0 for q < 2c

Node `EtaleDualityAndPerverseSheaves:EDC.3/semi-purity` (theorem); module
`TauCeti/AlgebraicGeometry/Etale/Duality/Theorems`; suggested declaration(s)
`TauCeti.EtaleDuality.semi_purity`.

Let X be smooth over a perfect field k, n invertible, and Z ⊂ X a closed subset of codimension
≥ c. Then H^q_Z(X, F) = 0 and ℋ^q_Z(F) = 0 for q < 2c and every locally constant constructible
F. Consequently, for Y ⊂ Z closed of codimension ≥ c + 1 in X, restriction H^{2c}_Z(X, F) →
H^{2c}_{Z−Y}(X − Y, F) is an isomorphism (and injective in degree 2c + 1).

Hypotheses. X smooth over a perfect field k (so the regular locus of a reduced closed subscheme
is smooth and dense); codim Z ≥ c.

Construction and proof. (1) Induction on dim Z: the singular locus Y of Z_red has smaller
dimension; the triple sequence H^q_Y(X) → H^q_Z(X) → H^q_{Z−Y}(X − Y) gives the vanishing from
purity for the smooth pair (Z − Y, X − Y) (EDC.3/smooth-pair-purity) and induction for Y
(codimension ≥ c + 1, so H^q_Y = 0 for q < 2c + 2) (Milne LEC 23.1). (2) The isomorphism in
degree 2c follows from the same sequence.

Acceptance. Z a point on a surface (c = 2): H^q_Z = 0 for q < 4.

Depends on: `smooth-pair-purity`, `cohomology-with-supports`, `mathlib:PerfectField`.

Source: Milne-LEC, Lemma 23.1 (Semi-purity), p. 138.

### `fundamental-class` — The fundamental class with supports of a cycle ★

Node `EtaleDualityAndPerverseSheaves:EDC.3/fundamental-class` (construction); planet
“Fundamental class with supports”; module
`TauCeti/AlgebraicGeometry/Etale/Duality/FundamentalClass`.

Let X be smooth of pure dimension d over a perfect field k, n invertible, Λ = ℤ/n (or O/πⁿ).
For an integral closed subscheme Z ⊂ X of codimension c with (smooth, dense) regular locus Z° =
Z − Y, the fundamental class s_{Z/X} ∈ H^{2c}_Z(X, Λ(c)) is the unique class restricting to the
purity generator s_{Z°/(X−Y)} ∈ H^{2c}_{Z°}(X − Y, Λ(c)) (EDC.3/smooth-pair-purity), which
exists and is unique by semi-purity. Extend linearly to cycles: for α = Σ m_i[Z_i] of
codimension c with support |α|, s_α := Σ m_i s_{Z_i/X} ∈ H^{2c}_{|α|}(X, Λ(c)). For Z smooth it
is the image of 1 under purity; for c = 1 and Z a Cartier divisor it is the Kummer local class.
Smooth purity is never applied to a singular Z; over an imperfect field, where the regular
locus may fail to be smooth, the construction is not asserted.

Hypotheses. X smooth over a perfect field k; Z integral of pure codimension c; n invertible.
Perfectness of k makes the regular locus of Z smooth and dense (covers finite fields and
algebraically closed fields).

Construction and proof. (1) Semi-purity (EDC.3/semi-purity) with Y = Sing(Z) of codimension ≥ c
+ 1 in X gives H^{2c}_Z(X) ≅ H^{2c}_{Z°}(X − Y); define s_{Z/X} as the preimage of the purity
generator. (2) Compatibility with étale restriction and with open restriction X′ ⊂ X follows
from uniqueness.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.fundamentalClass` | constructor | s_{Z/X} ∈ H^{2c}_Z(X, Λ(c)) for Z ⊂ X integral of codimension c, X smooth over a perfect field. |
| `TauCeti.EtaleDuality.fundamentalClass_restrict` | characterisation | s_{Z/X} is the unique class restricting to the purity generator on X − Sing(Z). |
| `TauCeti.EtaleDuality.fundamentalClass_smooth` | compatibility | For Z smooth, s_{Z/X} is the image of 1 under purity H⁰(Z, Λ) ≅ H^{2c}_Z(X, Λ(c)). |
| `TauCeti.EtaleDuality.fundamentalClass_divisor` | compatibility | For c = 1 and Z a Cartier divisor, s_{Z/X} is the Kummer local class; its image in H²(X, Λ(1)) is c₁(O(Z)). |
| `TauCeti.EtaleDuality.fundamentalClass_etale` | functoriality | u^*s_{Z/X} = s_{u^{-1}Z/X′} for u : X′ → X étale. |
| `TauCeti.EtaleDuality.fundamentalClassOfCycle` | constructor | s_α ∈ H^{2c}_{∣α∣}(X, Λ(c)) for a codimension-c cycle α, additive in α. |

Used by. Milne LEC §23: the direct definition of the cycle map uses s_{Z/X} for singular Z via
the smooth locus. EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map: cl(Z) is the image of
s_{Z/X} in H^{2c}(X, Λ(c)). LefschetzPencilsAndVanishingCycles:LPV.0 (request to EDC.3): cycle
classes of the generatrices of a quadric. EtaleDualityAndPerverseSheaves:EDC.4: the exceptional
divisor class in the blowup formula.

Unit tests:

- `TauCeti.EtaleDuality.fundamentalClass_hyperplane` (computation): For a hyperplane H ⊂ P^n
  over an algebraically closed field, the image of s_{H/P^n} in H²(P^n, Λ(1)) is c₁(O(1)).
- `TauCeti.EtaleDuality.fundamentalClass_nodalCubic` (computation): For the nodal cubic C ⊂ P²
  over an algebraically closed field of characteristic ≠ 2, 3, the image of s_{C/P²} is
  3c₁(O(1)), computed through the smooth locus.
- `TauCeti.EtaleDuality.fundamentalClass_whole` (degenerate): For Z = X (c = 0), s_{X/X} = 1 ∈
  H⁰(X, Λ).
- `TauCeti.EtaleDuality.not_fundamentalClass_purity_singular` (non-example): For the cone Z =
  {xy = z²} ⊂ A³ (singular at the origin), H*_Z(A³, Λ) is not H^{*−2}(Z, Λ(−1)): purity fails
  for the singular pair, so s_{Z/A³} cannot be defined by applying purity to Z.

Acceptance. For a hyperplane H ⊂ P^n, s_{H/P^n} maps to c₁(O(1)) in H²(P^n, Λ(1)). For the
nodal cubic C ⊂ P², s_{C/P²} maps to 3c₁(O(1)) = c₁(O(3)) although C is singular.

Depends on: `smooth-pair-purity`, `semi-purity`, `first-chern-class`,
`mathlib:AlgebraicGeometry.AlgebraicCycle`, `mathlib:PerfectField`.

Source: Milne-LEC, §23, p. 139.

### `gysin-map` — Gysin maps and proper pushforward in cohomology ★

Node `EtaleDualityAndPerverseSheaves:EDC.3/gysin-map` (construction); planet “Gysin map”;
module `TauCeti/AlgebraicGeometry/Etale/Duality/Gysin`.

(a) For a closed immersion i : Z → X of smooth k-schemes of pure codimension c and F locally
constant constructible on X, the Gysin map i_* : H^q(Z, i^*F(m)) → H^{q+2c}(X, F(m + c)) is the
composite of the purity isomorphism H^q(Z, i^*F(m)) ≅ H^{q+2c}_Z(X, F(m + c)) and forgetting
supports. (b) For f : Y → X proper between smooth k-schemes of pure dimensions d_Y and d_X, e
:= d_Y − d_X, f_* : H^q(Y, Λ(m)) → H^{q−2e}(X, Λ(m − e)) is the map induced by the adjunction
Rf_*f^!Λ → Λ and f^!Λ_X ≅ Λ_Y(e)[2e]; for k separably closed it is the transpose of f^* :
H^{2d_X−q+2e}_c(X) → H^{2d_Y−q}_c(Y) under Poincaré duality. Properties: f_*(y ∪ f^*x) = f_*y ∪
x (projection formula); (gf)_* = g_*f_*; i_*1 = cl(Z); for X, Y proper over k separably closed,
Tr_X ∘ f_* = Tr_Y; for f finite flat of degree δ, f_*f^* = δ; transverse base change g^*i_* =
i′_*g′^* for a cartesian square with g transverse to Z.

Hypotheses. Smooth schemes over a field k; proper f; F locally constant constructible (twists
explicit).

Construction and proof. (1) (a) from EDC.3/smooth-pair-purity and the localization triangle;
(b) from smooth purity for Y and X and the counit of Rf_! = Rf_* ⊣ f^!. (2) Agreement of (a)
and (b) for closed immersions: both are adjoint to restriction under duality (Milne LEC 24.2
(b)). (3) Projection formula and composition from the projection formula for Rf_* and the
composition of f^! (EDC.1:adjoint/upper-shriek-pseudofunctor); Tr_X ∘ f_* = Tr_Y from the trace
compatibility (Var 3) of EDC.2:trace-purity/flat-trace; finite flat degree from (Var 4)(I). (4)
Transverse base change: g^!-compatibility of purity for g transverse (the base change map of
EDC.1:adjoint/base-change-exchange-maps is an isomorphism for the smooth pair pulled back
transversally).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.gysin` | constructor | i_* : H^q(Z, Λ(m)) → H^{q+2c}(X, Λ(m + c)) for a smooth pair of codimension c. |
| `TauCeti.EtaleDuality.properPushforward` | constructor | f_* : H^q(Y, Λ(m)) → H^{q−2e}(X, Λ(m − e)) for f proper between smooth schemes, e = dim Y − dim X. |
| `TauCeti.EtaleDuality.properPushforward_projection` | relation | f_*(y ∪ f^*x) = f_*y ∪ x. |
| `TauCeti.EtaleDuality.properPushforward_comp` | functoriality | (g ∘ f)_* = g_* ∘ f_*, and id_* = id. |
| `TauCeti.EtaleDuality.gysin_one` | simp | i_*1 = cl(Z). |
| `TauCeti.EtaleDuality.trace_properPushforward` | compatibility | For X, Y proper over k separably closed, Tr_X(f_*y) = Tr_Y(y) on top-degree classes. |
| `TauCeti.EtaleDuality.properPushforward_finiteFlat` | relation | For f finite flat of degree δ, f_*f^* = δ. |
| `TauCeti.EtaleDuality.gysin_baseChange` | compatibility | For a cartesian square with g transverse to Z, g^* ∘ i_* = i′_* ∘ g′^*. |
| `TauCeti.EtaleDuality.gysin_eq_properPushforward` | compatibility | For a closed immersion, the purity Gysin map agrees with the duality pushforward. |

Used by. Milne LEC 24.2: Gysin maps defined by duality, with projection formula and degree.
DeligneWeightsAndPurity:DWP.7 (request to EDC.3): Gysin map of a smooth hyperplane section with
i_*(i^*x) = cl(Y) ∪ x and Tr_X(i_*y ∪ x) = Tr_Y(y ∪ i^*x). GeneralizedHeegnerCycles:GH.0
(request to EDC.3): compatibility of cycle classes with correspondences.
EtaleDualityAndPerverseSheaves:EDC.4: weak Lefschetz in its dual Gysin form and the blowup
formula.

Unit tests:

- `TauCeti.EtaleDuality.gysin_point_curve` (computation): For a closed point i : x → C of a
  smooth projective connected curve over an algebraically closed field, Tr_C(i_*1) = 1.
- `TauCeti.EtaleDuality.gysin_hyperplane_powers` (computation): For i : P^{n−1} → P^n a
  hyperplane over an algebraically closed field, i_*(h^j) = h^{j+1} in H*(P^n, Λ).
- `TauCeti.EtaleDuality.properPushforward_id` (degenerate): id_* = id.
- `TauCeti.EtaleDuality.not_properPushforward_ring_hom` (non-example): For f : C′ → C finite
  flat of degree 2 between smooth projective connected curves over an algebraically closed
  field (n odd), f_*(1_{C′}) = 2 · 1_C ≠ 1_C in H⁰(C, Λ): proper pushforward is H*(C)-linear by
  the projection formula but not a ring homomorphism.

Acceptance. Point i : x → C on a smooth projective curve: i_*1 = cl(x) and Tr_C(i_*1) = 1.
Hyperplane i : P^{n−1} → P^n: i_*(h^j) = h^{j+1}.

Depends on: `smooth-pair-purity`, `smooth-purity`, `flat-trace`, `poincare-duality-torsion`,
`base-change-exchange-maps`, `mathlib:AlgebraicGeometry.IsProper`.

Source: Milne-LEC, Remark 24.2, p. 145; Milne-LEC, Remark 24.2 (e)-(f), p. 145.

### `gysin-sequence` — The Gysin sequence

Node `EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence` (theorem).

For a smooth pair (Z, X) of pure codimension c over a field k, U := X − Z, n invertible and F
locally constant constructible on X, there is a long exact sequence … → H^{q−2c}(Z, F(−c)) →i_*
H^q(X, F) → H^q(U, F) → H^{q−2c+1}(Z, F(−c)) → …, functorial in F and compatible with base
change along k′/k; in particular H^q(X, F) ≅ H^q(U, F) for q < 2c − 1 and H^{2c−1}(X, F) ↪
H^{2c−1}(U, F). The same holds in families: for a smooth pair over a base S with smooth proper
structure maps, the sequence of the sheaves R^q f_* is exact.

Hypotheses. Smooth pair over a field (or a relative smooth pair over S for the family version);
F locally constant constructible.

Construction and proof. (1) Substitute the purity isomorphism (EDC.3/smooth-pair-purity) into
the long exact sequence of the pair (EDC.0/cohomology-with-supports) (Milne LEC 16.2). (2)
Family version: apply Rf_* to the localization triangle and use relative purity i^!Λ =
Λ(−c)[−2c] for a relative smooth pair (smooth purity for Z → S and X → S, composition).

Acceptance. X = P¹, Z = {∞}: 0 → H¹(P¹) = 0 → H¹(A¹) = 0 → H⁰(pt)(−1) → H²(P¹) → H²(A¹) = 0, so
H²(P¹, Λ) ≅ Λ(−1).

Depends on: `smooth-pair-purity`, `cohomology-with-supports`, `gysin-map`,
`SchemeAndStackFoundations:SF.2`.

Source: Milne-LEC, Corollary 16.2, p. 108.

### `projective-bundle-freeness` — Cohomology of a projective bundle is free on powers of ξ

Node `EtaleDualityAndPerverseSheaves:EDC.3/projective-bundle-freeness` (theorem).

Let X be a scheme with n invertible, E a locally free O_X-module of rank m + 1, π : P(E) → X
the projective bundle with O(1), and ξ := c₁(O(1)) ∈ H²(P(E), Λ(1)). Then the map ⊕_{j=0}^{m}
H^{q−2j}(X, F(−j)) → H^q(P(E), π^*F), (a_j) ↦ Σ π^*a_j ∪ ξ^j, is an isomorphism for every q and
every locally constant constructible F on X; equivalently Rπ_*Λ ≅ ⊕_{j=0}^m Λ(−j)[−2j] via ξ^j.
This is the input that defines Chern classes; the refined decomposition with Frobenius on every
summand, and the blowup formula, are EDC.4's.

Hypotheses. X quasi-compact quasi-separated (finite cover by trivializing opens) with n
invertible; F locally constant constructible.

Construction and proof. (1) Case E trivial: P(E) = X × P^m, and H*(P^m_{k̄}, Λ) =
Λ[h]/(h^{m+1}) with h = c₁(O(1)) (EDC.3/projective-space-cohomology) plus Künneth (imported) or
proper base change for Rπ_*. (2) General case: the map Σ ξ^j ∪ π^*(−) : ⊕ Λ(−j)[−2j] → Rπ_*Λ is
a map of complexes on X that is an isomorphism Zariski-locally, hence an isomorphism (Milne LEC
23.2, by Mayer-Vietoris).

Acceptance. X = Spec k, E = k^{m+1}: H*(P^m) is free on 1, h, …, h^m.

Depends on: `projective-space-cohomology`, `first-chern-class`,
`SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`.

Source: Milne-LEC, Theorem 23.2, p. 139.

### `chern-classes` — Chern classes of vector bundles in étale cohomology ★

Node `EtaleDualityAndPerverseSheaves:EDC.3/chern-classes` (construction); planet “Chern
classes”; module `TauCeti/AlgebraicGeometry/Etale/Duality/ChernClass`.

Let X be a scheme with n invertible (in applications smooth over a perfect field). For a
locally free E of rank m + 1 with π : P(E) → X and ξ = c₁(O_{P(E)}(1)), the Chern classes
c_r(E) ∈ H^{2r}(X, Λ(r)) are the unique classes with Σ_{r=0}^{m+1} π^*c_r(E) ∪ ξ^{m+1−r} = 0
and c₀ = 1 (Grothendieck's definition through EDC.3/projective-bundle-freeness). They satisfy:
functoriality c_r(f^*E) = f^*c_r(E); normalization c₁(L) is the Kummer class for a line bundle;
Whitney formula c_t(E) = c_t(E′)c_t(E″) for 0 → E′ → E → E″ → 0; c_r(E) = 0 for r > rank E;
splitting principle. The top Chern class of the normal bundle computes self-intersections
(EDC.3/self-intersection-formula).

Hypotheses. n invertible; E locally free of finite rank (Zariski-locally free).

Construction and proof. (1) Existence and uniqueness of the relation from freeness of H*(P(E))
over H*(X) (Grothendieck's method, Milne LEC 23.3). (2) Normalization and convention: P(E) :=
Proj Sym(E^∨) parametrizes lines in E and O(−1) is the tautological line subbundle; for E = L
of rank one, P(L) = X with O(−1) = L, so the relation ξ + c₁(E) = 0 gives c₁(E) = −c₁(O(1)) =
c₁(L), the Kummer class (Milne LEC 23.3 (b)). (3) Whitney formula and splitting principle: pull
back to the flag bundle, where E has a filtration with line-bundle quotients and π^* is
injective (iterate projective-bundle freeness).

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.chernClass` | constructor | c_r(E) ∈ H^{2r}(X, Λ(r)) for E locally free. |
| `TauCeti.EtaleDuality.totalChernClass` | data | c(E) = Σ c_r(E), a unit in ⊕ H^{2r}(X, Λ(r)). |
| `TauCeti.EtaleDuality.chernClass_pullback` | functoriality | c_r(f^*E) = f^*c_r(E). |
| `TauCeti.EtaleDuality.chernClass_one_lineBundle` | compatibility | For L invertible, c₁(L) = firstChernClass L and c_r(L) = 0 for r ≥ 2. |
| `TauCeti.EtaleDuality.totalChernClass_whitney` | relation | c(E) = c(E′) ∪ c(E″) for 0 → E′ → E → E″ → 0. |
| `TauCeti.EtaleDuality.chernClass_eq_zero_of_rank_lt` | simp | c_r(E) = 0 for r > rank E. |
| `TauCeti.EtaleDuality.chernClass_projectiveBundle_relation` | characterisation | Σ_r π^*c_r(E) ∪ ξ^{rank E − r} = 0 in H^{2 rank E}(P(E), Λ(rank E)). |

Used by. Milne LEC 23.3: Chern classes from the projective-bundle relation.
EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula: c_c(N_{Z/X}) computes i^*i_*.
ExcursionOperatorsAndSpectralAction / GeometricSatakeAndFusion (perfect-scheme Part II):
characteristic classes of torsors, built from Chern classes (Zhu A.3.2); routed to the proposed
Part II. CohomologyComparisons:CP.6: comparison of Chern classes across realizations.

Unit tests:

- `TauCeti.EtaleDuality.chernClass_tangent_projectiveSpace` (computation): For X = P^m over an
  algebraically closed field, c(T_{P^m}) = (1 + h)^{m+1} in Λ[h]/(h^{m+1}).
- `TauCeti.EtaleDuality.chernClass_trivial` (degenerate): c(O_X^r) = 1.
- `TauCeti.EtaleDuality.chernClass_sum_lines` (computation): c(O(1) ⊕ O(1)) = (1 + h)² on P^m,
  so c₂ = h² ≠ 0 for m ≥ 2.
- `TauCeti.EtaleDuality.not_chernClass_two_of_line` (non-example): For a line bundle L, c₂(L) =
  0 although c₁(L)² may be nonzero (e.g. L = O(1) on P²): c₂ is not c₁².

Acceptance. c(T_{P^m}) = (1 + h)^{m+1}. c(O ⊕ O(1)) on P^m is 1 + h.

Depends on: `projective-bundle-freeness`, `first-chern-class`,
`SchemeAndStackFoundations:SF.0`.

Source: Milne-LEC, §23, p. 140; Milne-LEC, Theorem 23.3, p. 140.

### `cycle-class-map` — The étale cycle class map CH^r(X) → H^{2r}(X, Λ(r)) ★

Node `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map` (construction); planet “Cycle class
map”; module `TauCeti/AlgebraicGeometry/Etale/Duality/CycleClass`.

Let X be smooth of pure dimension d over a perfect field k, n invertible, Λ = ℤ/n (or O/πⁿ, and
with ℤ_ℓ, ℚ_ℓ coefficients by passage to the limit). The cycle class of a codimension-r cycle α
is cl_X(α) := image of the fundamental class s_α ∈ H^{2r}_{|α|}(X, Λ(r)) in H^{2r}(X, Λ(r)).
The map cl_X : Z^r(X) → H^{2r}(X, Λ(r)) is additive and factors through rational equivalence,
giving cl_X : CH^r(X) → H^{2r}(X, Λ(r)) (Chow groups imported from SchemeAndStackFoundations
SF.5). For r = 1 it is c₁ ∘ (divisor ↦ line bundle); it is compatible with flat pullback, with
proper pushforward (Gysin maps of EDC.3/gysin-map), with intersection products (cl(α · β) =
cl(α) ∪ cl(β) for properly intersecting cycles, hence a ring homomorphism CH*(X) → ⊕ H^{2r}(X,
Λ(r)) for X smooth quasi-projective), and with the Galois action (cl is Gal(k̄/k)-equivariant
into H^{2r}(X_k̄, Λ(r))). For X proper over k̄, Tr_X(cl(point)) = 1, so Tr ∘ cl = degree on
0-cycles. No comparison between numerical and homological equivalence is asserted.

Hypotheses. X smooth over a perfect field; for the ring structure X smooth quasi-projective
(moving lemma imported with the intersection product from SF.5). Over an imperfect field the
construction through the smooth locus is not asserted (inseparable descent is outside this
stage).

Construction and proof. (1) Additivity by construction; flat pullback and étale-local nature
from EDC.3/fundamental-class. (2) Rational equivalence: a principal divisor div(f) on an
integral W of codimension r − 1 maps to zero because cl(div f) = i_{W*}c₁(O(div f)) for W
smooth, and in general by restricting to the regular locus (semi-purity) and the Kummer class
of f; this is the independence of representatives. (3) Proper pushforward: cl(f_*α) = f_*cl(α)
from the trace compatibility of fundamental classes (finite case: (Var 4); generically finite
by restriction to an open; contracted components push forward to 0 in both). (4) Intersection:
for properly intersecting α, β the cup product s_α ∪ s_β ∈ H^{2(r+s)}_{|α|∩|β|} is determined
on the smooth locus of the intersection, where it is the fundamental class with intersection
multiplicities (Tor formula), as in SGA 4½ [Cycle] 2.3.8; the Chern-class route (Milne LEC
23.4) gives the same map. (5) Galois equivariance and Tr(cl(point)) = 1 from base change of
purity and the normalization of the trace.

| Declaration | Role | Contract |
|---|---|---|
| `TauCeti.EtaleDuality.cycleClass` | constructor | cl_X : Z^r(X) →+ H^{2r}(X, Λ(r)), on Mathlib AlgebraicCycle X ℤ restricted to codimension r. |
| `TauCeti.EtaleDuality.cycleClass_rationalEquiv` | characterisation | cl_X vanishes on cycles rationally equivalent to zero, so factors through CH^r(X). |
| `TauCeti.EtaleDuality.cycleClass_divisor` | compatibility | For a Cartier divisor D, cl_X(D) = c₁(O(D)). |
| `TauCeti.EtaleDuality.cycleClass_pullback` | functoriality | cl(f^*α) = f^*cl(α) for f flat (and for f between smooth schemes with the refined pullback). |
| `TauCeti.EtaleDuality.cycleClass_pushforward` | functoriality | cl(f_*α) = f_*cl(α) for f proper between smooth schemes. |
| `TauCeti.EtaleDuality.cycleClass_intersection` | relation | cl(α · β) = cl(α) ∪ cl(β) for properly intersecting cycles. |
| `TauCeti.EtaleDuality.trace_cycleClass_point` | simp | Tr_X(cl(x)) = 1 for a closed point of X proper over k separably closed; Tr ∘ cl = deg on 0-cycles. |
| `TauCeti.EtaleDuality.cycleClass_galois` | compatibility | cl is Gal(k̄/k)-equivariant into H^{2r}(X_k̄, Λ(r)); over 𝔽_q geometric Frobenius fixes cl(α) in the twisted group. |

Used by. MotivesAndAlgebraicCycles:MC.2 (request to EDC.3): ℓ-adic cycle class map compatible
with pullback, pushforward, intersection and with Tr(cl(point)) = 1. WeilConjectures:WC.6
(request to EDC.3): actual CH^j cycle map, Galois/Frobenius equivariance in ℚ_ℓ(j) and
intersection compatibility. GeneralizedHeegnerCycles:GH.1 (request via GH.0): étale cycle
classes and homological triviality of generalized Heegner cycles.
WeightsInEtaleCohomology:R34.5 (request to EDC.3): the arithmetic first Chern class η and
cup-product naturality.

Unit tests:

- `TauCeti.EtaleDuality.cycleClass_hyperplane` (computation): On P^n over an algebraically
  closed field, cl(H) = h and cl of a linear subspace of codimension r is h^r.
- `TauCeti.EtaleDuality.cycleClass_transverse_curves` (computation): For two transverse curves
  C, D on a smooth projective surface over an algebraically closed field, Tr(cl(C) ∪ cl(D)) =
  #(C ∩ D).
- `TauCeti.EtaleDuality.cycleClass_zero` (degenerate): cl_X(0) = 0, and cl_X([X]) = 1 for r =
  0.
- `TauCeti.EtaleDuality.cycleClass_principal` (characterisation): For f a nonzero rational
  function on X, cl_X(div f) = 0.
- `TauCeti.EtaleDuality.not_cycleClass_injective` (non-example): For an elliptic curve E over
  an algebraically closed field, the 0-cycle [p] − [q] (p ≠ q) is not rationally equivalent to
  0 but cl([p] − [q]) = 0 in H²(E, Λ(1)): cl is not injective (and nothing about numerical vs
  homological equivalence is asserted).

Acceptance. Hyperplanes in P^n: cl(H) = h and cl(H₁ ∩ … ∩ H_r) = h^r for transverse
hyperplanes. A transverse intersection of two curves on a surface: Tr(cl(C) ∪ cl(D)) = #(C ∩
D). Self-intersection of a line on P²: cl(L)² = h², Tr = 1 = deg N_{L/P²}. A singular divisor
(the nodal cubic in P²): cl(C) = 3h through the fundamental class built on the smooth locus.

Depends on: `fundamental-class`, `gysin-map`, `semi-purity`, `first-chern-class`,
`SchemeAndStackFoundations:SF.5`, `mathlib:AlgebraicGeometry.AlgebraicCycle`,
`mathlib:AlgebraicGeometry.AlgebraicCycle.map`.

Source: Milne-LEC, §23, p. 139; Milne-LEC, Theorem 23.4, p. 142.

### `self-intersection-formula` — The self-intersection formula

Node `EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula` (theorem).

For a closed immersion i : Z → X of smooth k-schemes of pure codimension c with normal bundle N
= N_{Z/X}, and y ∈ H^q(Z, Λ(m)), one has i^*i_*y = c_c(N) ∪ y in H^{q+2c}(Z, Λ(m + c)); in
particular i^*cl(Z) = c_c(N). For c = 1, i^*cl(Z) = c₁(O(Z)|_Z) = c₁(N).

Hypotheses. Smooth pair over a field; n invertible.

Construction and proof. (1) Deformation to the normal bundle: the smooth pair (Z × A¹, M°) over
A¹ with fibre (Z, X) at 1 and (Z, N) at 0 has a relative fundamental class, and specialization
identifies i^*i_* with the zero-section composite for N; for a vector bundle N, s^*s_*1 =
c_top(N) by the projective-bundle relation on P(N ⊕ O) (EDC.3/chern-classes). (2) For c = 1,
directly: i^*c₁(O(Z)) = c₁(O(Z)|_Z) and O(Z)|_Z = N.

Acceptance. A line L ⊂ P²: i^*cl(L) = c₁(O_L(1)), degree 1. The diagonal Δ ⊂ C × C of a curve
of genus g: Tr(cl(Δ) ∪ cl(Δ)) = 2 − 2g.

Depends on: `gysin-map`, `chern-classes`, `smooth-pair-purity`,
`SchemeAndStackFoundations:SF.0`.

Source: Milne-LEC, Remark 24.2 (e), p. 145; Milne-LEC, Theorem 23.3, p. 140.

### `projective-space-cohomology` — Cohomology of projective space and degrees

Node `EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology` (theorem).

Let k be separably closed, n invertible, Λ = ℤ/n. Then H^q(P^m_k, Λ) = 0 for q odd, and ⊕_r
H^{2r}(P^m_k, Λ(r)) = Λ[h]/(h^{m+1}) as a ring under cup product, with h = c₁(O(1)) =
cl(hyperplane) ∈ H²(P^m, Λ(1)) and Tr(h^m) = 1. More generally, for X smooth projective of pure
dimension d over k and L a line bundle, Tr_X(c₁(L)^d) = deg_L(X) := (L^d) mod n, and for i : Y
→ X a smooth hyperplane section, i_*(i^*x) = cl(Y) ∪ x and Tr_X(i_*y ∪ x) = Tr_Y(y ∪ i^*x).

Hypotheses. k separably closed; X smooth projective for the degree formula (intersection number
(L^d) from SF.5).

Construction and proof. (1) Induction on m with the Gysin sequence for P^{m−1} ⊂ P^m with
complement A^m (H^q_c(A^m) concentrated in degree 2m, H^q(A^m) = Λ in degree 0):
EDC.3/gysin-sequence, EDC.2:trace-purity/affine-space-trace; h generates H² by the curve trace
on a line. (2) Degree formula: cl(L)^d = cl(D₁ ∩ … ∩ D_d) for general divisors D_i of a very
ample multiple, and Tr ∘ cl = degree on 0-cycles (EDC.3/cycle-class-map); extend additively.
(3) Hyperplane formulas: projection formula and Tr_X ∘ i_* = Tr_Y (EDC.3/gysin-map).

Acceptance. P¹: H⁰ = Λ, H² = Λ(−1), Tr(h) = 1. A smooth quadric surface Q ⊂ P³: Tr(h²) = 2.

Depends on: `gysin-sequence`, `gysin-map`, `cycle-class-map`, `affine-space-trace`,
`SchemeAndStackFoundations:SF.5`.

Source: Milne-LEC, proof of Theorem 23.2, p. 139.

## Requests to other roadmaps

Each request names the supplier stage and the exact statement this part imports; the consuming
nodes cite the stage.

- `SchemeAndStackFoundations:SF.2`: From ConstructibleEtale (CohomologicalPointCounting,
  PR196), integrated by SF.2: (i) constructible sheaves of Λ-modules on X_ét for X noetherian
  and Λ noetherian torsion (finite stratification by locally closed constructible subschemes on
  which the sheaf is locally constant with finitely generated stalks), forming a weak Serre
  subcategory stable under f^* and ⊗; (ii) the sheaf μ_n for n invertible and the exactness of
  the Kummer sequence 0 → μ_n → G_m → G_m → 0 on X_ét, with H¹(X_ét, G_m) = Pic(X) naturally in
  X; (iii) the exact pullback f^* and the right derived functors Rf_* and RΓ on the unbounded
  D(X_ét, Λ) (K-injective resolutions); (iv) topological invariance: a nilpotent thickening
  Z_red → Z induces an equivalence of étale sites. Needed by: `constructible-ctf-complexes`,
  `tate-twist`, `cohomology-with-supports`, `coefficient-change`, `first-chern-class`.
- `SchemeAndStackFoundations:SF.2`: From CompactSupport (PR196), integrated by SF.2: for f : X
  → S separated of finite type with S quasi-compact quasi-separated and Λ torsion, the functor
  Rf_! : D(X_ét, Λ) → D(S_ét, Λ) on unbounded complexes, defined through a Nagata
  compactification as R f̄_* ∘ j_! and independent of it, with: the composition isomorphism
  R(gh)_! ≅ Rg_!Rh_! satisfying the cocycle condition; proper base change g^*Rf_! ≅ Rf′_!g′^*
  (SGA 4 XVII 5.2.6); stalks (R^q f_!F)_s̄ = H^q_c(X_s̄, F) (5.2.8); R^q f_!F = 0 for q > 2d
  when the fibres have dimension ≤ d (5.2.8.1); the projection formula Rf_!(E ⊗^L f^{-1}K) ≅
  Rf_!E ⊗^L K (5.2.9; Stacks 0GL5); the Künneth isomorphism (5.4.3); the localization sequence
  for U open with closed complement (5.1.16.2); Rf_! = f_! left adjoint to f^* for f étale
  (6.2.11); Rf_! = Rf_* for f proper; preservation of finite Tor-dimension (5.2.10) and of
  D^b_c. Needed by: `compact-pushforward-amplitude-and-colimits`,
  `enhanced-compact-pushforward`, `coefficient-change`, `sheafified-adjunction`,
  `base-change-exchange-maps`, `quasi-finite-flat-trace`, `curve-trace`, `flat-trace`.
- `SchemeAndStackFoundations:SF.2`: From EtaleBaseChange (PR196), integrated by SF.2: proper
  base change for Rf_* along proper f, the smooth base change theorem and its acyclicity lemma
  (SGA 4 XV 2.1 and 2.6) in the form used by SGA 4 XVIII 1.6.9, and the finiteness theorem:
  Rf_* preserves D^b_c(−, Λ) for f of finite type between schemes of finite type over a field
  or over a regular noetherian base of dimension ≤ 1 (SGA 4½ [Th. finitude] 1.1 and 4.3), with
  finiteness of H^q(X_k̄, F) and H^q_c(X_k̄, F) for constructible F. Needed by:
  `curve-effacement-lemma`, `constructible-biduality`, `recollement-adjunctions`,
  `relative-and-geometric-duality`, `poincare-duality-torsion`, `cup-product-trace-pairing`,
  `gysin-sequence`.
- `SchemeAndStackFoundations:SF.2`: Cohomology of curves over an algebraically closed field k
  (Stacks 03RM-03RR), n invertible: for a proper curve X, H²(X, μ_n) ≅ Pic(X)/n ≅
  (ℤ/n)^{irreducible components} via degrees of line bundles (and through X_red), H^q(X, μ_n) =
  0 for q ≥ 3, H¹(X, μ_n) ≅ Pic(X)[n]; for a smooth affine curve H^q(X, μ_n) = 0 for q ≥ 2; for
  a closed point x of a smooth curve C, H^q_x(C, μ_n) is ℤ/n for q = 2 and 0 otherwise (Kummer
  on the henselization). Also the identification, owned by TraceFormula Layer 8 (RS-17), of the
  cup product H¹(X, μ_n) × H¹(X, μ_n) → H²(X, μ_n^{⊗2}) ≅ μ_n with the Weil pairing on
  Jac(X)[n] (Milne LEC 14.8). Needed by: `curve-trace`, `curve-h1-duality`,
  `first-chern-class`.
- `SchemeAndStackFoundations:SF.2`: From EllAdicRealization (PR196), integrated by SF.2: for
  E/ℚ_ℓ finite and a lisse O_E-sheaf F = (F_m) on X of finite type over a separably closed
  field, the groups H^i(X, F) := lim_m H^i(X, F_m) and H^i_c(X, F) are finitely generated
  O_E-modules with lim¹ = 0, RΓ(X, F) and RΓ_c(X, F) are perfect O_E-complexes with RΓ(X, F)
  ⊗^L O_E/π^m ≅ RΓ(X, F_m), compatibly with the Galois action and with extension of
  coefficients to E and ℚ̄_ℓ. Needed by: `adic-and-rational-poincare-duality`.
- `SchemeAndStackFoundations:SF.0`: The projective bundle π : P(E) = Proj Sym(E^∨) → X of a
  locally free sheaf E of rank m + 1 on a scheme X, with O_{P(E)}(1), the tautological exact
  sequence, local triviality P(E)|_U ≅ U × P^m over trivializing opens, and the complete flag
  bundle as an iterated projective bundle (for the splitting principle). Needed by:
  `projective-bundle-freeness`, `chern-classes`, `self-intersection-formula`.
- `SchemeAndStackFoundations:SF.5`: For X smooth (quasi-projective where intersections are
  taken) over a field: the group Z^r(X) of codimension-r cycles (Mathlib AlgebraicCycle
  restricted to codimension r), rational equivalence and CH^r(X); flat pullback; proper
  pushforward compatible with Mathlib's AlgebraicCycle.map; the intersection product of
  properly intersecting cycles with Serre's Tor multiplicities and the moving lemma making
  CH*(X) a ring; the degree of 0-cycles on proper X; and the deformation to the normal cone of
  a closed immersion. Needed by: `cycle-class-map`, `projective-space-cohomology`.
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`:
  Line bundles and the Picard group Pic(X) of a scheme as an abelian group under ⊗, natural
  under pullback, divisors and O(D), and the degree deg : Pic(X) → ℤ of a line bundle on a
  proper curve over a field, additive, with principal divisors of degree zero and deg O_{P¹}(1)
  = 1. Needed by: `first-chern-class`, `curve-trace`.
-
  `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`:
  The Jacobian J = Pic⁰ of a smooth projective connected curve X over an algebraically closed
  field, an abelian variety of dimension g with J(k)[n] = Pic⁰(X)[n] ≅ (ℤ/n)^{2g} for n
  invertible, and its canonical principal polarization. Needed by: `curve-h1-duality`.
- `AbelianSchemesAndArithmeticModuli:A3`: The Weil pairing e_n : A[n] × A^∨[n] → μ_n of an
  abelian variety over an algebraically closed field (n invertible) and, for a principal
  polarization λ, perfectness and alternation of the induced pairing on A[n]; applied to the
  Jacobian of a curve. Needed by: `curve-h1-duality`.

## Gaps

- **Purity over a trait and regular-immersion fundamental classes are not in EDC.0-EDC.3.**
  LPV.7 requests from EDC.2:trace-purity and EDC.3 the relative fundamental class Λ ≅
  Rf^!Λ(−d)[−2d] for a strict semistable trait morphism (Saito 2003, Proposition 1.1.1(2)) and
  fundamental classes of the regular intersection strata over the trait (Saito 2003, Lemma
  1.1.4). These are purity statements for regular pairs over a discrete valuation ring
  (Gabber's absolute purity and its semistable special case), which EDC.2's text excludes
  ('This proves smooth purity, not the unrelated general Gabber absolute-purity theorem') and
  EDC.3 restricts to smooth pairs over a field. This packet plans smooth purity
  (EDC.2:trace-purity/smooth-purity) and smooth-pair purity (EDC.3/smooth-pair-purity) only.
  Absolute purity for regular pairs (Gabber; Riou's exposé in Astérisque 363-364, XVI) needs an
  owner: a new layer after EDC.3, or the trait geometry of LefschetzPencilsAndVanishingCycles.
  Recorded for the maintainer. Needed by:
  `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/snc-nearby-cycle-description`,
  `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/snc-restriction-gysin-differential`,
  `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/localization-duality-cross`.
- **ℓ-adic sheaf theory on algebraic stacks (RT-AREA-etale/3) has no layer.** EDC.0-EDC.3 are
  planned for schemes only. Consumers on Artin and Deligne-Mumford stacks (shtuka, Hitchin,
  Bun_G and root-Picard stacks; WC.6's smooth proper DM stacks; FunctionFieldArithmeticPartII's
  tame coarse comparisons) need the Laszlo-Olsson / Liu-Zheng enhanced six operations on
  stacks, which this packet does not plan. The restructure entry proposes the Part II that the
  confirmed red-team finding asks for. The scheme-level objects of this packet (the enhanced
  Rf_! and f^!, the dualizing complex, smooth purity) are what that Part II extends by smooth
  descent. Needed by: `GlobalShtukasAndFunctionFieldLanglands:GS.1`,
  `GlobalShtukasAndFunctionFieldLanglands:GS.3`,
  `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`,
  `WeilConjectures:WC.6/purity-for-smooth-proper-dm-stacks`.
- **Perfect schemes and finite-level equivariant coefficients (RT-AREA-etale/16) are not
  planned here.** PAPER-ZHU-17 routes to EDC.0, EDC.1:adjoint, EDC.1:biduality,
  EDC.2:trace-purity and EDC.3 the items E01-E03, E07, E14 and
  characteristic-classes-of-torsors: constructible coefficients, six operations, Verdier
  biduality, fundamental classes and Chern classes on separated perfectly-finitely-presented
  perfect algebraic spaces, through finite-type models (Zhu, Appendix A.3). The confirmed
  finding RT-AREA-etale/16 classifies these as new layers. This packet plans the finite-type
  scheme statements those transports start from (and E07(a)'s finite-type trace isomorphism,
  EDC.2:trace-purity/top-degree-compact-cohomology), and records the perfect-space transport in
  the Part II proposed under restructure. Zhu's A.3 orientation problem (independence of the
  model in E07) stays a proof gate of that Part II. Needed by: `GeometricSatakeAndFusion:GS0`,
  `GeometricSatakeAndFusion:GS3`.
- **The Grothendieck-Ogg-Shafarevich formula has no layer.** FiniteFieldsAndCharacterSums
  requests χ_c(X, F) = rk F · χ_c(X) − Σ_s Sw_s(F) from EDC.2 (RT-AREA-finitefields/3,
  confirmed). It is not among EDC.2's stated targets and needs Swan conductors
  (ArithmeticGaloisRepresentations:R01.3) and the Euler-characteristic computation of SGA 5 X /
  Raynaud (Séminaire Bourbaki 286). This packet endorses the FiniteFieldsAndCharacterSums
  proposal of a sub-stage EtaleDualityAndPerverseSheaves:EDC.2:euler-characteristic after EDC.2
  (restructure entry), with inputs EDC.2:pairings and R01.3. Needed by:
  `FiniteFieldsAndCharacterSums:FF.2/h1c-conductor-bound`,
  `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sum-on-curve-bound`,
  `FiniteFieldsAndCharacterSums:FF.2/deligne-cohomology-of-polynomial-sheaf`.

## Proposed restructuring

- **rescope** (EtaleDualityAndPerverseSheaves, GlobalShtukasAndFunctionFieldLanglands,
  EndoscopicTransferAndUnitaryTraceComparison, WeilConjectures). Confirmed red-team finding
  RT-AREA-etale/3: no layer plans ℓ-adic sheaf theory on Artin or Deligne-Mumford stacks, while
  EDC is scheme-only and accepted routes apply EDC.5/7/8 outputs on stacks. Proposal: Create
  'Étale duality, cycle classes and perverse sheaves, Part II: Artin and Deligne-Mumford
  stacks' with EtaleDualityAndPerverseSheaves as first prerequisite and EnhancedDerivedSheaves
  E2-E3 (smooth descent, coherent diagrams) as inputs. Layers: (1) lisse-étale site, D_c(𝒳, Λ)
  and the Laszlo-Olsson / Liu-Zheng enhanced six operations on Artin stacks, extending EDC.0's
  enhanced Rf_! and EDC.1:adjoint's f^! by smooth descent; (2) dualizing complex, smooth purity
  and biduality on stacks (from EDC.1-EDC.2); (3) the perverse t-structure and IC on Artin
  stacks (from EDC.5); (4) the decomposition theorem for proper representable maps of DM stacks
  (from EDC.7); (5) correspondences and trace formulas on DM stacks (Varshavsky, Behrend; from
  EDC.8). Edges from it to GlobalShtukas GS.1 and GS.3, ET.2b, the EDC.8 stack items and WC.6's
  DM-stack purity node; the shtuka and ramified geometric class field theory Part II briefs
  import it, and LAFFORGUE-18/48 is re-routed there as missing.
- **rescope** (EtaleDualityAndPerverseSheaves, GeometricSatakeAndFusion). Confirmed red-team
  finding RT-AREA-etale/16: PAPER-ZHU-17 route 7 adds about twenty items outside EDC's declared
  scope (six operations, Verdier duality, perversity, IC and Chern classes on perfect pfp
  spaces; equivariant perverse sheaves and Borel equivariant cohomology; Braden hyperbolic
  localization). Proposal: Create 'Étale duality, cycle classes and perverse sheaves, Part II:
  perfect schemes, equivariant coefficients and hyperbolic localization', importing
  GeometricSatakeAndFusion GS0:Witt-geometry's perfect-space carrier and the perfection
  invariance of the étale site, with layers: (1) D^b_c on separated pfp perfect spaces through
  finite-type models, with the six operations, biduality and the trace/fundamental classes of
  EDC.0-EDC.3 transported (Zhu A.3.1, A.3.3, items E01-E03, E07), including the
  model-independence proof gate; (2) Chern and characteristic classes of torsors on perfect
  spaces (A.3.2, E14) from EDC.3/chern-classes; (3) finite-level equivariant perverse sheaves
  and Borel equivariant cohomology (A.3.5, E10-E13), sharing its equivariant part with the
  stacks Part II; (4) scheme-level Braden hyperbolic localization (E09). Keep only the
  finite-type items (E06) as sources of EDC.7. Within this packet, EDC.0-EDC.3 plan the
  finite-type scheme statements those transports start from.
- **rescope** (EtaleDualityAndPerverseSheaves, FiniteFieldsAndCharacterSums). The
  Grothendieck-Ogg-Shafarevich Euler characteristic formula for lisse sheaves on curves is used
  by FiniteFieldsAndCharacterSums FF.2 and by KloostermanMomentsAndPotentialAutomorphy, and no
  stage states it (RT-AREA-finitefields/3, confirmed). The FiniteFieldsAndCharacterSums packet
  already proposes a sub-stage of this roadmap. Proposal: Endorse that proposal: add
  EtaleDualityAndPerverseSheaves:EDC.2:euler-characteristic after EDC.2:pairings (inputs
  EDC.2:pairings/extreme-degree-cohomology, EDC.2:pairings/poincare-duality-torsion and
  ArithmeticGaloisRepresentations:R01.3 in equal characteristic), stating χ_c(X, F) = rk F ·
  χ_c(X) − Σ_{s} Sw_s(F) for F lisse on a dense open X of a smooth projective connected curve
  over an algebraically closed field, with χ_c = χ, sourced to Raynaud (Séminaire Bourbaki 286,
  Numdam) or SGA 5 X; link it to FF.2.

## Confirmed red-team findings handed to this job

RT-AREA-etale/3 (stacks). This part is scheme-only by design and says so in every relevant
node; the stack formalism is proposed as 'Étale duality, cycle classes and perverse sheaves,
Part II: Artin and Deligne–Mumford stacks' (restructure, first entry), and the stack consumers
are listed in the second gap. The extraction that marked the stack formalism 'planned at EDC.0'
is therefore not supported by this packet.

RT-AREA-etale/16 (perfect schemes). The perfect-space transport of Zhu's Appendix A.3 (items
E01–E03, E07, E14, characteristic classes of torsors) is not planned here; it is proposed as
'Étale duality, cycle classes and perverse sheaves, Part II: perfect schemes, equivariant
coefficients and hyperbolic localization' (restructure, second entry). The finite-type
statements those transports start from are nodes here: the trace isomorphism on top-degree
compact cohomology (E07(a) on finite-type models) is
EDC.2:trace-purity/top-degree-compact-cohomology, Chern classes are EDC.3/chern-classes, and
biduality is EDC.1:biduality/constructible-biduality.

## Sources and their mistakes

Read for this part: SGA 4 XVIII (retyped edition of the SGA 4 re-edition project, 2024;
introduction, §1.1, §1.6.6–1.6.9, §2, §3.1.1–3.1.13 and §3.2), SGA 4 XVII (5.1.16,
5.2.6–5.2.10, 5.4.3, 6.2.3, 6.2.11), Milne's Lectures on Étale Cohomology v2.21 (§§14, 16, 23,
24), the Stacks Project chapter More Étale Cohomology (§§2, 10–12, 16), Deligne's Weil I (§2)
and Yu (arXiv v5, §6.1). SGA 4½ ([Dualité], [Cycle], [Th. finitude]) was not available in a
readable copy; where the stage text cites it, the packet cites the equivalent statement in SGA
4 XVIII, Milne or the Stacks Project, and the finiteness theorem is requested from its owner.

- `EtaleDualityAndPerverseSheaves/E1` (gap, affects the proof), SGA4-XVIII, Lemme 3.2.3 and its
  proof, p. 583-584 (retyped edition, version 71766d9, 2024). Printed: "Je serais reconnaissant
  à toute personne ayant compris cette démonstration de me l’expliquer." (after the proof that
  the two constructions of t_f agree) Correction: The compatibility of the adjoint of Tr_f with
  the map t_f of (3.2.1.2) is asserted with a proof the author himself does not vouch for. The
  purity theorem can be proved without it: define t_f as the adjoint of Tr_f and compute
  ℋ^q(f^!K) stalkwise by the formula of Stacks More Étale Lemma 16.1 together with the
  factorization 2.14.4, as EDC.2:trace-purity/smooth-purity does. Reason: The proof's final
  step is left to the reader ('dont on laisse au lecteur le soin de vérifier que, dans la
  catégorie dérivée, il coïncide avec (3.2.1.2)'), and the author records that he did not
  understand it. Known: The author's own remark in the text (SGA 4 XVIII, after the proof of
  3.2.3); the Stacks Project (More Étale Cohomology §16, tags 0GLJ-0GLK) computes f^! stalkwise
  instead..
- `EtaleDualityAndPerverseSheaves/E2` (misprint, affects nothing), SGA4-XVIII, 3.2.1, display
  (3.2.1.1), p. 583 (retyped edition, version 71766d9, 2024). Printed: "𝑅2𝑑 𝑓! (Z/𝑛)𝑈 ≃ 𝑗! 𝑅2𝑑
  𝜑!Z/𝑛 −−→ 𝑗! Z/𝑁(−𝑑) = 𝐾 ″ (𝑈 , 𝑉 , 𝜑))" Correction: j_! ℤ/n(−d) = K″(U, V, φ): the
  coefficient is ℤ/n (the integer n fixed in 3.2.1), not ℤ/N, and the final parenthesis is
  unbalanced. Reason: No integer N is introduced in 3.2.1; K″ was defined two lines earlier
  from ℤ/n(−d)[−2d]. Known: new.
- `EtaleDualityAndPerverseSheaves/E3` (misprint, affects nothing), SGA4-XVIII, Lemme 2.14.2, p.
  561 (retyped edition, version 71766d9, 2024). Printed: "𝑓𝑖 ∶ 𝐾𝑖 → 𝐾𝑖+𝑖 (0 ≤ 𝑖 ≤ 2𝑘 − 1) des
  morphismes et 𝑓 leur composé" Correction: f_i : K_i → K_{i+1}. Reason: The f_i are composed
  into f : K_0 → K_{2k}, so consecutive indices are meant. Known: new.
- `EtaleDualityAndPerverseSheaves/E4` (misprint, affects nothing), Milne-LEC, Remark 24.2 and
  the display before it, p. 145 (version 2.21, 22 March 2013). Printed: "By duality, we get a
  map π∗ : H^r(Y, Λ) → H^{r−2c}(X, Λ(−e))" (with a = dim X, d = dim Y, e = d − a) Correction:
  π_* : H^r(Y, Λ) → H^{r−2e}(X, Λ(−e)); for a closed immersion of codimension c, e = −c and the
  target is H^{r+2c}(X, Λ(c)). Reason: Dualizing π^* : H^{2d−r}_c(X, Λ(d)) → H^{2d−r}_c(Y,
  Λ(d)) with Poincaré duality on Y (dimension d) and X (dimension a) lands in H^{2a−2d+r}(X,
  Λ(a − d)) = H^{r−2e}(X, Λ(−e)); c is not defined in the remark. Known: new.
- `EtaleDualityAndPerverseSheaves/E5` (gap, affects the proof), Milne-LEC, §23, after Theorem
  23.3 and the NOTES, p. 140-142 (version 2.21). Printed: "set φ(Z) = Σ(−1)^i ch(E_i)" ...
  "Theorem 23.4 This chern-class cycle map agrees with the directly-defined cycle map. Proof. A
  correct proof is quite long." Correction: The Chern character used to define φ is not defined
  in the notes, and the agreement 23.4 is unproved there. The packet's cycle class map is the
  direct one (fundamental classes through the smooth locus) and proves its compatibilities
  directly (EDC.3/cycle-class-map), not through 23.4. Reason: The notes say so themselves.
  Known: Milne's NOTES in §23 of version 2.21: 'This subsection needs to be rewritten ... you
  seem to have forgotten to define it.'.
- `EtaleDualityAndPerverseSheaves/E6` (misprint, affects nothing), Yu-2023, §6.1, equations
  (6.1.1)-(6.1.2), p. 42 (arXiv:1807.04659v5, 18 July 2022). Printed: "H⁰(X, F1 ⊗ F2∨) ≅
  HomX(F1, F2)" and "Hc²(X, F1 ⊗ F2∨) ≅ H⁰(X, F1∨ ⊗ F2(1))∨ ≅ HomX(F2, F1)∨(−1)" Correction:
  H⁰(X, F₁ ⊗ F₂^∨) = Hom_X(F₂, F₁) and H²_c(X, F₁ ⊗ F₂^∨) ≅ Hom_X(F₁, F₂)^∨(−1). Reason: F₁ ⊗
  F₂^∨ ≅ Hom(F₂, F₁), and F₁^∨ ⊗ F₂ ≅ Hom(F₁, F₂). Both uses in the proof (vanishing for F₁, F₂
  without common constituent, and the self-pair F₁ = F₂) are symmetric in the order. Known:
  PAPER-YU-23/E14 (research/blueprint/papers/PAPER-YU-23.result.json), confirmed by
  REV-PAPER-YU-23.
- `EtaleDualityAndPerverseSheaves/E7` (gap, affects nothing), SGA4-XVIII, Définition 1.1.2 and
  editors' note 2, p. 485 (retyped edition, version 71766d9, 2024). Printed: "une courbe sur un
  corps est quasi-projective(2)" Correction: EGA II 7.4.10 proves quasi-projectivity only for
  normal curves; the general case was announced for EGA V, which never appeared. The
  construction of the curve trace does not need it: it can be made locally on quasi-projective
  opens and glued, as in the proof of 1.1.6. Reason: Editors' note 2 of the retyped edition.
  Known: Editors' note (N.D.E.) 2 to 1.1.2 in the retyped edition (2024)..

## Coverage

- `EtaleDualityAndPerverseSheaves:EDC.0`: planned. Lemma-level refinement of
  EDC.0/enhanced-compact-pushforward (dg model of f_!^•, independence of compactification in
  the enhancement) once EnhancedDerivedSheaves E1/E3 are accepted. The constructibility
  predicate and Tate-twist sheaf are imported from ConstructibleEtale through the SF.2
  requests; replace the stage prerequisite by SF.2 node ids when SchemeAndStackFoundations
  plans them.
- `EtaleDualityAndPerverseSheaves:EDC.1`: planned. Collector stage: its targets are realised by
  the EDC.1:adjoint and EDC.1:biduality nodes; nothing further.
- `EtaleDualityAndPerverseSheaves:EDC.1:adjoint`: planned. Lemma level: the coherence data of
  f^! (cocycle and pasting) as separate lemma nodes once EnhancedDerivedSheaves E3 mates are
  accepted.
- `EtaleDualityAndPerverseSheaves:EDC.1:biduality`: planned. Lemma level: the stratification
  dévissage of constructible-biduality (existence of a smooth stratification adapted to K, the
  induction on dim X) as separate nodes. Biduality over the regular one-dimensional base ℤ[1/ℓ]
  (DWP.7's request) is stated with the same proof; its finiteness input (SGA 4½ [Th. finitude]
  4.3) is requested from SF.2.
- `EtaleDualityAndPerverseSheaves:EDC.2`: planned. Collector stage: its targets are realised by
  the EDC.2:trace-purity and EDC.2:pairings nodes; nothing further.
- `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`: planned. Lemma level: SGA 4 XVIII
  2.5-2.6 (chains of systems of parameters) and 2.14.2 (the derived-category factorization
  lemma) as separate lemma nodes.
- `EtaleDualityAndPerverseSheaves:EDC.2:pairings`: planned. The Euler-characteristic sub-stage
  requested by FiniteFieldsAndCharacterSums is proposed under restructure, not planned here.
- `EtaleDualityAndPerverseSheaves:EDC.3`: planned. Lemma level: deformation to the normal cone
  and the Tor-multiplicity comparison inside cycle-class-map and self-intersection-formula as
  separate nodes, after SchemeAndStackFoundations SF.5 plans the Chow-side constructions.
  Purity over a trait for LPV.7 is recorded as a gap (no owner in EDC.0-EDC.3).
