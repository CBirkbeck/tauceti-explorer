# Étale duality, cycle classes and perverse sheaves — EDC.5: the early perverse category and intermediate extension

This part plans stage `EtaleDualityAndPerverseSheaves:EDC.5` at target level: the abstract theory of t-structures and recollement that Mathlib does not have, the middle perverse t-structure on constructible étale complexes over a field, perverse sheaves, the exactness of the six operations, intermediate extension and intersection complexes, Verdier self-duality with its integral replacement p/p⁺, and semismall and small pushforward. The [packet](../packets/EtaleDualityAndPerverseSheaves--EDC.5.json) fixes the identifiers; this document follows it node by node. The [suggested Lean file](../suggested/EtaleDualityAndPerverseSheaves--EDC.5.lean) states what the pinned libraries can already type.

The pass is complete: 29 target nodes, 117 API entries, 64 unit tests and 6 planets. The stage is planned; its remaining items are supplier replacements and lemma-level splitting. No purity, semisimplicity or decomposition statement is made here: those are EDC.7, which imports this stage.

## Ownership, inputs and boundaries

Mathlib at the pin has `CategoryTheory.Triangulated.TStructure` with its truncation functors and the heart as an object property, the canonical t-structure on a derived category, and the `AbelianSubcategory` criterion. It has no abelian instance on hearts, no t-cohomology functors, no t-exactness predicate and no recollement. Tau Ceti and the current TauCetiRoadmap checkout have nothing on t-structures, recollement or perverse sheaves, and no other atlas roadmap plans them in the abstract; so the abstract layer is owned here, once, and the Beilinson, good-filtration and motivic t-structures of other roadmaps can cite it.

The étale inputs are the accepted nodes of part EDC.0: the derived category D(X, Λ) and its stalks, constructible complexes, cohomology with supports, coefficient change, compact support with its amplitude, f^! and the local cohomology identification, dualizing complexes, Verdier duality, constructible biduality, the exchange formulas, the étale recollement, smooth purity, top-degree compact cohomology and smooth-pair purity (EDC.3). Using EDC.3's smooth-pair purity adds a same-roadmap dependency EDC.3 → EDC.5 that the atlas graph does not draw.

Five supplier contracts go to SchemeAndStackFoundations SF.2, which integrates CohomologicalPointCounting: Artin's affine theorem, topological invariance of the étale site, surjectivity of π₁ for open subschemes of unibranch schemes, the ℓ-adic constructible formalism with its duality, and the base-change, finiteness and Künneth inputs EDC.0 also imports. The ℓ-adic formalism is requested from SF.2 rather than from EDC.6, because EDC.6 lies downstream of EDC.5 in the atlas. The filtered-colimit cohomology statement is cited from the SF.2 node `SchemeAndStackFoundations:SF.2/cohomology-filtered-colimits`.

Consumers: LPV.6 uses the early category for nearby-cycle t-exactness and never imports EDC.7; IG.4 uses the enlarged costalk conditions on filtered colimits of finite-level complexes, which are an extension of this category and not an identification of Ind-objects with constructible perverse sheaves; GeometricSatakeAndFusion GS1 glues its relative t-structure on the same pattern and uses semismall pushforward rationally; ET.2a:duality-perversity re-exports the stage; EDC.6 and EDC.7 build on it. Stacks and perfect schemes are outside this scheme-level stage (the Part IIs of the restructure entry).

An earlier draft of this stage sits inside the EDC.4-part packet (which also covers EDC.4 and EDC.6–EDC.8 and was sent back after three review rounds). This packet replaces it. The validator does not allow two packets of one roadmap to share node ids, so the nodes here have new ids; the field `supersededDraftNodes` maps each draft id to its replacement, so that the accepted consumers citing draft ids (GS0, IG, SF.0) can be pointed at the new ones:

| Draft id (EDC.4 packet) | Replacement |
| --- | --- |
| `EtaleDualityAndPerverseSheaves:EDC.5/t-structure-heart-abelian` | `EtaleDualityAndPerverseSheaves:EDC.5/heart-abelian-subcategory` |
| `EtaleDualityAndPerverseSheaves:EDC.5/t-cohomology-functor` | `EtaleDualityAndPerverseSheaves:EDC.5/t-structure-cohomology` |
| `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functor` | `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functors` |
| `EtaleDualityAndPerverseSheaves:EDC.5/recollement-data` | `EtaleDualityAndPerverseSheaves:EDC.5/recollement-situation` |
| `EtaleDualityAndPerverseSheaves:EDC.5/glued-t-structure` | `EtaleDualityAndPerverseSheaves:EDC.5/gluing-t-structures` |
| `EtaleDualityAndPerverseSheaves:EDC.5/abstract-intermediate-extension` | `EtaleDualityAndPerverseSheaves:EDC.5/recollement-intermediate-extension` |
| `EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure` | `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure` |
| `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaves` | `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category` |
| `EtaleDualityAndPerverseSheaves:EDC.5/lisse-shift-is-perverse` | `EtaleDualityAndPerverseSheaves:EDC.5/shifted-local-systems-perverse` |
| `EtaleDualityAndPerverseSheaves:EDC.5/perverse-recollement` | `EtaleDualityAndPerverseSheaves:EDC.5/open-closed-perverse-recollement` |
| `EtaleDualityAndPerverseSheaves:EDC.5/intermediate-extension` | `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension` |
| `EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex` | `EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex-of-local-system` |
| `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves` | `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves-classification` |
| `EtaleDualityAndPerverseSheaves:EDC.5/verdier-duality-perverse` | `EtaleDualityAndPerverseSheaves:EDC.5/perverse-verdier-self-duality` |
| `EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing` | `EtaleDualityAndPerverseSheaves:EDC.5/perverse-artin-vanishing` |
| `EtaleDualityAndPerverseSheaves:EDC.5/perverse-amplitude-estimates` | `EtaleDualityAndPerverseSheaves:EDC.5/fibre-dimension-perverse-amplitude` |
| `EtaleDualityAndPerverseSheaves:EDC.5/generic-degree-concentration` | `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category` |
| `EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perverse` | `EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perversity` |
| `EtaleDualityAndPerverseSheaves:EDC.5/small-map-intersection-complex` | `EtaleDualityAndPerverseSheaves:EDC.5/small-pushforward-intersection-complex` |
| `EtaleDualityAndPerverseSheaves:EDC.5/integral-perverse-torsion-pair` | `EtaleDualityAndPerverseSheaves:EDC.5/integral-dual-perversity` |

The draft's semismall target was left unverified by its review: its costalk argument used product charts and lisse stalks only. Here the support condition is proved stratum by stratum with compact-support bounds, and the cosupport condition by Verdier duality, under the explicit hypothesis that K and D_X K have locally constant cohomology on the source strata; no local triviality is needed. The draft's ℓ-adic prerequisites pointed into EDC.6; they now go to SF.2.

## Conventions

- dim(x) is the dimension of the closure of x in X (BBD 4.0); the middle perversity is p(x) = −dim(x).
- pD^{≤a} = pD^{≤0}[−a]; perverse cohomology pH^m(K) = pH⁰(K[m]).
- IC_X(L) := j_!*(L[d]) restricts to L[d] on the smooth open U; no Tate half-twist is built in.
- D_X = RHom(−, K_X) with K_X = a^!Λ; on smooth X of pure dimension d, K_X ≅ Λ(d)[2d] and D_X(L[d]) ≅ L^∨(d)[d].
- Rf_*, Rf_!, f^*, f^! are the derived functors of EDC.0–EDC.1; j_* without R is the underived direct image.

Coefficient regimes, used consistently in the hypotheses:

| Regime | Where it is enough |
| --- | --- |
| Λ noetherian, nΛ = 0, n invertible in k | t-structure, heart, recollement, j_!*, IC, quasi-finite and fibre-dimension exactness, enlarged conditions |
| Λ self-injective (finite field, O/λ^m, ℤ/ℓ^m) | Verdier self-duality, Rf_! halves deduced by duality, semismall and small pushforward |
| Λ a finite ring | left t-exactness of Rf_! for affine f, by restriction of scalars to ℤ/n |
| Λ a field | finite length and simple objects, t-exactness of ⊠, thick image of smooth pullback |
| O, E (ℓ-adic, k with finite Galois cohomology) | ℓ-adic perverse t-structures; E self-dual, O exchanged with p⁺ |

## EDC.5a — t-categories, recollement and tilting

Mathlib's `TStructure` gives aisles, truncation functors and the heart as a predicate, and its `AbelianSubcategory` criterion gives abelian structures on suitable subcategories of a triangulated category. Everything else in BBD §1.3–1.4 is planned here, once and in the abstract form every consumer uses: the abelian heart, its cohomology functors, t-exactness, recollements, gluing, the abstract intermediate extension with the simple objects of a glued heart, and tilting along a torsion theory (needed for the integral perversity p⁺). No geometry enters this group.

### The heart of a t-structure is an abelian category

Node `EtaleDualityAndPerverseSheaves:EDC.5/heart-abelian-subcategory` · theorem.

Let C be a pretriangulated category satisfying the octahedral axiom (Mathlib's IsTriangulated) and let t be a t-structure on C in Mathlib's sense (aisles t.le n and coaisles t.ge n, with t.le n = t.le 0 shifted by −n). Its heart C^♥ := t.le 0 ∩ t.ge 0, as a full subcategory with inclusion ι, is an abelian category, and ι is additive and fully faithful. Moreover: (i) Hom_C(ιA, (ιB)[m]) = 0 for A, B in the heart and every m < 0; (ii) a sequence 0 → A → B → D → 0 in C^♥ is short exact if and only if there is a morphism ιD → (ιA)[1] completing ιA → ιB → ιD to a distinguished triangle, and that morphism is then unique; (iii) the heart is closed under extensions in C: if X′ → X → X″ → X′[1] is distinguished with X′, X″ in the heart, so is X; (iv) a morphism f : A → B of the heart has kernel ι-image τ_{≤0}(Cone(f)[−1]) and cokernel τ_{≥0}Cone(f) computed with Mathlib's truncation functors.

**Hypotheses.**

- C pretriangulated with the octahedral axiom; t any t-structure (no boundedness or nondegeneracy is needed).
- The abelian structure is the one supplied by Mathlib's AbelianSubcategory criterion; the theorem is that its two hypotheses hold for the heart.

**Proof.**

- Negative Hom vanishing (i): (ιB)[m] lies in t.ge (−m) ⊆ t.ge 1 for m < 0, so every map from t.le 0 to it is zero by the orthogonality axiom of the t-structure (BBD 1.3.1 (i)).
- Admissibility: for f : A → B in the heart complete ιA → ιB to a triangle ιA → ιB → S → (ιA)[1]. The rotated triangle ιB → S → (ιA)[1] shows S ∈ t.le 0 ∩ t.ge (−1). The truncation triangle τ_{≤−1}S → S → τ_{≥0}S gives K := (τ_{≤−1}S)[−1] and Q := τ_{≥0}S in the heart with a distinguished triangle K[1] → S → Q → K[2], which is Mathlib's admissibleMorphism condition (BBD 1.3.6 proof, p.31; the diagram (1.2.2.1)).
- The heart is closed under finite direct sums because both t.le 0 and t.ge 0 are closed under extensions (BBD 1.3.4, p.30: each is an orthogonal of the other), hence has finite products. Apply mathlib:CategoryTheory.Triangulated.AbelianSubcategory.abelian to ι.
- (ii) and (iv) are the description of kernels, cokernels and short exact sequences in an admissible abelian subcategory (BBD 1.2.4–1.2.5, the admissibility used in 1.3.6); (iii) is BBD 1.3.6's stability under extensions, again from 1.3.4.

**Acceptance.**

- For Mathlib's canonical t-structure DerivedCategory.TStructure.t on D(A), the heart is equivalent to A through the degree-zero inclusion (BBD 1.3.6, Exemple, p.31).
- For the middle perverse t-structure on a point Spec Ω with Ω separably closed, the heart is the category of finitely generated Λ-modules in degree 0 (EDC.5/perverse-sheaf-category).
- Non-example: in D(Ab), the full subcategory of complexes with cohomology in degrees −1 and 0 is not the heart of any t-structure: it contains A = (ℤ/2)[1] and B = ℤ/2, and Hom(B, A[−1]) = Hom(ℤ/2, ℤ/2) ≠ 0, which (i) forbids.

**Depends on.** `mathlib:CategoryTheory.Triangulated.TStructure`, `mathlib:CategoryTheory.Triangulated.TStructure.heart`, `mathlib:CategoryTheory.Triangulated.AbelianSubcategory.abelian`, `mathlib:CategoryTheory.IsTriangulated`, `mathlib:CategoryTheory.Triangulated.TStructure.truncLE`, `mathlib:CategoryTheory.Triangulated.TStructure.truncGE`

**Used by.** `t-structure-cohomology`, `t-exact-functors`, `gluing-t-structures`, `recollement-intermediate-extension`, `torsion-pair-tilt`, `perverse-sheaf-category`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Théorème 1.3.6 and its proof, pp.31–32; 1.3.4, p.30: The heart of a t-category is an admissible abelian subcategory stable by extensions; its proof shows every morphism of the heart is admissible by truncating the cone.

**Suggested declarations.** `TauCeti.EtaleDuality.heart_hom_neg_eq_zero`, `TauCeti.EtaleDuality.heart_admissible`, `TauCeti.EtaleDuality.heartAbelian`

### The cohomology functors of a t-structure

Node `EtaleDualityAndPerverseSheaves:EDC.5/t-structure-cohomology` · construction.

Let t be a t-structure on a pretriangulated category C with the octahedral axiom. The zeroth t-cohomology is H⁰_t := τ_{≥0} ∘ τ_{≤0} : C → C^♥, lifted to the heart (canonically isomorphic to τ_{≤0} ∘ τ_{≥0}, BBD 1.3.5), and H^m_t(X) := H⁰_t(X[m]). Then: (a) H⁰_t is a homological functor to the abelian heart: a distinguished triangle X → Y → Z → X[1] gives a long exact sequence … → H^m_t X → H^m_t Y → H^m_t Z → H^{m+1}_t X → …; (b) for X in the heart, H⁰_t X ≅ X and H^m_t X = 0 for m ≠ 0; (c) if X lies in t.le a ∩ t.ge b for some a, b (X is t-bounded) then X ≅ 0 if and only if H^m_t X = 0 for all m, and X ∈ t.le 0 if and only if H^m_t X = 0 for all m > 0 (dually for t.ge 0); (d) if t is nondegenerate (⋂ t.le n = ⋂ t.ge n = 0) the same detection holds for every object (BBD 1.3.7).

**Hypotheses.**

- C pretriangulated with the octahedral axiom; t a t-structure. Detection (c) needs t-boundedness of X; (d) needs nondegeneracy.

**Construction and proof.**

- Define H⁰_t from Mathlib's truncation functors t.truncLE 0 and t.truncGE 0; the composite lands in the heart because truncations preserve the opposite aisle (BBD 1.3.4–1.3.5), and lift it along the inclusion.
- Homological: BBD 1.3.6, second half (pp.31–32): first for triangles inside t.ge 0 and inside t.le 0 by representability, then the general case by the octahedral axiom.
- (b): truncations of an object of the heart are itself. (c): induction on b − a with the triangles τ_{≤b−1}X → X → H^b_t(X)[−b]; (d): BBD 1.3.7.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.TStructure.homologyZero` | constructor | H⁰_t : C ⥤ heart(t), the lift of truncGE 0 ∘ truncLE 0 to the heart. |
| `TauCeti.EtaleDuality.TStructure.homology` | constructor | H^m_t := H⁰_t ∘ [m] : C ⥤ heart(t) for m ∈ ℤ. |
| `TauCeti.EtaleDuality.TStructure.homologyZero_isHomological` | instance | H⁰_t is a homological functor (Mathlib Functor.IsHomological) into the abelian heart. |
| `TauCeti.EtaleDuality.TStructure.homologyZeroIsoOfMemHeart` | simp | For X in the heart, H⁰_t X ≅ X naturally. |
| `TauCeti.EtaleDuality.TStructure.homology_shift` | relation | H^m_t(X[a]) ≅ H^{m+a}_t(X) naturally. |
| `TauCeti.EtaleDuality.TStructure.isZero_of_homology_isZero` | characterisation | If X is t-bounded and every H^m_t X is zero, then X is zero. |
| `TauCeti.EtaleDuality.TStructure.isLE_iff_homology` | characterisation | For t-bounded X: X ∈ t.le n iff H^m_t X = 0 for all m > n; dually X ∈ t.ge n iff H^m_t X = 0 for m < n. |
| `TauCeti.EtaleDuality.TStructure.homologyCanonicalIso` | compatibility | For DerivedCategory.TStructure.t on D(A), under heart ≌ A, H^m_t corresponds to DerivedCategory.homologyFunctor A m. |

**Unit tests.**

- `TauCeti.EtaleDuality.homology_canonical_shift` (computation): For the canonical t-structure on D(Ab): H¹_t((ℤ/2)[−1]) ≅ ℤ/2 and H⁰_t((ℤ/2)[−1]) ≅ 0.
- `TauCeti.EtaleDuality.homologyZero_zero` (degenerate): H⁰_t(0) ≅ 0, and for X in the heart H^m_t X ≅ 0 for m ≠ 0.
- `TauCeti.EtaleDuality.homology_canonical_compat` (compatibility): For DerivedCategory.TStructure.t on D(A), H^m_t ≅ DerivedCategory.homologyFunctor A m under heart ≌ A.
- `TauCeti.EtaleDuality.homologyZero_not_triangulated` (non-example): H⁰_t does not commute with the shift: for A ≠ 0 in A, H⁰_t(A[1]) = 0 while (H⁰_t A)[1] is not zero; so H⁰_t is homological but not triangulated.
- `TauCeti.EtaleDuality.not_isZero_of_homology_unbounded` (non-example): For the degenerate t-structure with t.le n = C and t.ge n = 0 for all n on a nonzero C, every H^m_t vanishes on a nonzero object, which is not t-bounded: the boundedness hypothesis in isZero_of_homology_isZero cannot be dropped.

**Acceptance.**

- For Mathlib's canonical t-structure on D(Ab): H¹_t((ℤ/2)[−1]) ≅ ℤ/2 and H⁰_t((ℤ/2)[−1]) = 0.
- For the middle perverse t-structure, H^m_t is perverse cohomology pH^m (EDC.5/perverse-sheaf-category); on a smooth curve C, pH^{1}(Λ_C) ≅ Λ_C[1] and pH^m(Λ_C) = 0 for m ≠ 1.

**Uses.**

- BBD 1.3.6–1.3.7 and 2.1.7: perverse cohomology pH^m is H^m_t for the perverse t-structure.
- EtaleDualityAndPerverseSheaves:EDC.7: the decomposition K ≅ ⊕ pH^i(K)[−i] is stated with these functors.
- LefschetzPencilsAndVanishingCycles:LPV.6: t-exactness of nearby cycles is checked on perverse cohomology.
- EDC.5/torsion-pair-tilt: the tilt is defined by conditions on H⁰_t and H¹_t.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/heart-abelian-subcategory`, `mathlib:CategoryTheory.Triangulated.TStructure`, `mathlib:CategoryTheory.Triangulated.TStructure.truncLE`, `mathlib:CategoryTheory.Triangulated.TStructure.truncGE`, `mathlib:CategoryTheory.Functor.IsHomological`, `mathlib:DerivedCategory.TStructure.t`, `mathlib:DerivedCategory.homologyFunctor`, `mathlib:CategoryTheory.Triangulated.TStructure.bounded`

**Used by.** `t-exact-functors`, `gluing-t-structures`, `recollement-intermediate-extension`, `torsion-pair-tilt`, `perverse-sheaf-category`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Proposition 1.3.5 and Théorème 1.3.6, pp.30–32; Proposition 1.3.7, p.32: τ_{≥a}τ_{≤b} ≅ τ_{≤b}τ_{≥a}; H⁰ := τ_{≥0}τ_{≤0} with values in the heart is cohomological; for a nondegenerate t-structure the H^i are conservative and detect the aisles.

**Suggested declarations.** `TauCeti.EtaleDuality.TStructure.homologyZero`, `TauCeti.EtaleDuality.TStructure.homology`

### Left and right t-exact functors

Node `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functors` · definition.

Let (C₁, t₁), (C₂, t₂) be pretriangulated categories with t-structures and T : C₁ → C₂ a triangulated functor. T is right t-exact if T(t₁.le 0) ⊆ t₂.le 0, left t-exact if T(t₁.ge 0) ⊆ t₂.ge 0, and t-exact if both; since T commutes with shifts, right t-exactness gives T(t₁.le n) ⊆ t₂.le n for every n, and dually. The induced functor on hearts is pT := H⁰_{t₂} ∘ T ∘ ι₁ : C₁^♥ → C₂^♥. Then (BBD 1.3.17): (i) pT is right exact if T is right t-exact and left exact if T is left t-exact; (ii) for T right t-exact and K ∈ t₁.le 0, H⁰_{t₂}(TK) ≅ pT(H⁰_{t₁}K) (dually for left t-exact and K ∈ t₁.ge 0); (iii) for an adjunction T* ⊣ T_* of triangulated functors, T* is right t-exact if and only if T_* is left t-exact, and then pT* ⊣ pT_*; (iv) composites of left (right) t-exact functors are left (right) t-exact and p(T₂ ∘ T₁) ≅ pT₂ ∘ pT₁. A fully faithful t-exact functor reflects the aisles (BBD 1.3.19).

**Hypotheses.**

- Triangulated functors between pretriangulated categories with t-structures; (iii) needs an adjunction of triangulated functors (Mathlib Adjunction plus IsTriangulated on both functors).

**Construction and proof.**

- Definitions by the two inclusions; the shift statement from T(X[1]) ≅ T(X)[1] and t.le n = t.le 0 [−n].
- (i), (ii): long exact sequences of H_{t₂} applied to T of a short exact sequence of the heart, using EDC.5/heart-abelian-subcategory (ii) (BBD 1.3.17 proof, p.37).
- (iii): Hom(T*V, U) = Hom(V, T_*U) and the characterisation of t.le 0 as the left orthogonal of t.ge 1 (BBD 1.3.4); the heart adjunction from H⁰ of the adjunction maps (BBD 1.3.17 (iii), 1.3.18).
- (iv): BBD 1.3.17 (iv) from (ii).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.Functor.IsRightTExact` | constructor | T maps t₁.le 0 into t₂.le 0. |
| `TauCeti.EtaleDuality.Functor.IsLeftTExact` | constructor | T maps t₁.ge 0 into t₂.ge 0. |
| `TauCeti.EtaleDuality.Functor.IsTExact` | constructor | T is left and right t-exact. |
| `TauCeti.EtaleDuality.Functor.IsRightTExact.le` | characterisation | A triangulated right t-exact functor maps t₁.le n into t₂.le n for every n ∈ ℤ. |
| `TauCeti.EtaleDuality.Functor.IsRightTExact.comp` | functoriality | Composites of right t-exact functors are right t-exact. |
| `TauCeti.EtaleDuality.Functor.IsLeftTExact.comp` | functoriality | Composites of left t-exact functors are left t-exact. |
| `TauCeti.EtaleDuality.Functor.isRightTExact_iff_isLeftTExact_of_adjunction` | characterisation | For an adjunction T* ⊣ T_* of triangulated functors, T* is right t-exact iff T_* is left t-exact. |
| `TauCeti.EtaleDuality.Functor.heartFunctor` | data | pT := H⁰_{t₂} ∘ T ∘ ι₁ : heart(t₁) ⥤ heart(t₂). |
| `TauCeti.EtaleDuality.Functor.heartFunctor_preservesFiniteColimits` | other | If T is right t-exact, pT is right exact (preserves finite colimits). |
| `TauCeti.EtaleDuality.Functor.heartFunctor_preservesFiniteLimits` | other | If T is left t-exact, pT is left exact (preserves finite limits). |
| `TauCeti.EtaleDuality.Functor.heartAdjunction` | universal-property | If T* ⊣ T_* with T* right t-exact, then pT* ⊣ pT_* on the hearts. |
| `TauCeti.EtaleDuality.Functor.heartFunctorComp` | functoriality | For left t-exact T₁, T₂, p(T₂ ∘ T₁) ≅ pT₂ ∘ pT₁; dually for right t-exact functors. |

**Unit tests.**

- `TauCeti.EtaleDuality.isTExact_id` (degenerate): The identity functor is t-exact for every t-structure.
- `TauCeti.EtaleDuality.isRightTExact_shift_one` (computation): The shift [1] is right t-exact for every t-structure.
- `TauCeti.EtaleDuality.not_isLeftTExact_shift_one` (non-example): For the canonical t-structure on D(A) with A ≠ 0, the shift [1] is not left t-exact: A ∈ t.ge 0 but A[1] ∉ t.ge 0.
- `TauCeti.EtaleDuality.isTExact_mapDerivedCategory` (compatibility): An exact functor F : A ⥤ B of abelian categories induces a t-exact functor D(A) ⥤ D(B) for the canonical t-structures.
- `TauCeti.EtaleDuality.not_isRightTExact_globalSections_projectiveLine` (non-example): Derived global sections RΓ(P¹_Ω, −) : D(P¹_Ω, Λ) → D(Λ), Ω separably closed, is left t-exact for the canonical t-structures but not right t-exact: Λ(1) in degree 0 has H²(P¹, Λ(1)) ≅ Λ ≠ 0.

**Acceptance.**

- The identity of C is t-exact; the shift [1] is right t-exact for every t.
- For an exact functor F : A → B of abelian categories, the derived functor D(A) → D(B) is t-exact for the canonical t-structures.

**Uses.**

- BBD 1.4.16 and 2.1.6: exactness of j_!, j^*, Rj_*, i^*, i_*, i^! in a recollement.
- BBD 4.1.1–4.2.5: affine, quasi-finite, smooth and fibre-dimension amplitude statements.
- LefschetzPencilsAndVanishingCycles:LPV.6: RΨ[−1] is t-exact for the perverse t-structures.
- IgusaVarietiesAndTorsionConcentration:IG.4: semiperversity bounds are one-sided t-exactness statements.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/t-structure-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.5/heart-abelian-subcategory`, `mathlib:CategoryTheory.Triangulated.TStructure`, `mathlib:CategoryTheory.Functor.IsTriangulated`, `mathlib:CategoryTheory.Adjunction`

**Used by.** `gluing-t-structures`, `recollement-intermediate-extension`, `open-closed-perverse-recollement`, `quasi-finite-perverse-exactness`, `fibre-dimension-perverse-amplitude`, `smooth-pullback-perverse-exactness`, `perverse-artin-vanishing`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 1.3.16 and Proposition 1.3.17, pp.36–37; Remarque 1.3.18, p.37; 1.3.19, p.38: Definition of left and right t-exact functors; exactness of the induced heart functors, the adjoint criterion with the induced heart adjunction, and composition; induced t-structures under fully faithful t-exact functors.

**Suggested declarations.** `TauCeti.EtaleDuality.Functor.IsRightTExact`, `TauCeti.EtaleDuality.Functor.IsLeftTExact`, `TauCeti.EtaleDuality.Functor.IsTExact`

### Recollement of triangulated categories

Node `EtaleDualityAndPerverseSheaves:EDC.5/recollement-situation` · definition.

A recollement D_F → D → D_U consists of pretriangulated categories D_F, D, D_U, triangulated functors i_* : D_F → D and j^* : D → D_U, triangulated adjoints i^* ⊣ i_* ⊣ i^! and j_! ⊣ j^* ⊣ j_* (all six triangulated, with the four adjunctions given), such that (a) j^* ∘ i_* ≅ 0; (b) for every K in D the adjunction maps extend to distinguished triangles j_!j^*K → K → i_*i^*K → (j_!j^*K)[1] and i_*i^!K → K → j_*j^*K → (i_*i^!K)[1]; (c) the adjunction maps i^*i_* → 1, 1 → i^!i_*, 1 → j^*j_!, j^*j_* → 1 are isomorphisms, so i_*, j_! and j_* are fully faithful (BBD 1.4.3). Consequences: i^*j_! ≅ 0, i^!j_* ≅ 0, Hom(j_!B, i_*A) = 0 = Hom(i_*A, j_*B); the connecting maps of the triangles in (b) are unique; i_* identifies D_F with the full subcategory of D on which j^* vanishes. The basic instance is constructible étale sheaves on X with a closed subscheme Z and open complement U, with i_* = i_! and j^! = j^* (EDC.1:biduality/recollement-adjunctions).

**Hypotheses.**

- D_F, D, D_U pretriangulated; the six functors triangulated; adjunctions part of the data.

**Construction and proof.**

- Record the functors and adjunctions as data, and (a)–(c) as properties (BBD 1.4.3, (1.4.3.1)–(1.4.3.5)).
- i^*j_! ≅ 0 and i^!j_* ≅ 0 by adjunction from (a); uniqueness of the connecting maps because Hom(j_!j^*K, i_*i^*K[−1]) = 0 (BBD 1.1.10 with (1.4.3.3)).
- The kernel of j^* is the essential image of i_*: the second triangle of (b) for K with j^*K = 0.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.Recollement` | constructor | The structure: i_*, j^*, the adjoints i^*, i^!, j_!, j_*, the four adjunctions, j^*i_* ≅ 0, the two distinguished triangles and the full faithfulness isomorphisms. |
| `TauCeti.EtaleDuality.Recollement.triangleLowerShriek` | data | The functorial distinguished triangle j_!j^*K → K → i_*i^*K → (j_!j^*K)[1] built from the counit and unit. |
| `TauCeti.EtaleDuality.Recollement.triangleUpperShriek` | data | The functorial distinguished triangle i_*i^!K → K → j_*j^*K → (i_*i^!K)[1]. |
| `TauCeti.EtaleDuality.Recollement.upperStar_lowerShriek_isZero` | relation | i^* ∘ j_! ≅ 0 and i^! ∘ j_* ≅ 0. |
| `TauCeti.EtaleDuality.Recollement.essImage_lowerStar` | characterisation | K is in the essential image of i_* iff j^*K ≅ 0. |
| `TauCeti.EtaleDuality.Recollement.op` | other | The opposite recollement of D_F^op → D^op → D_U^op, exchanging j_! with j_* and i^* with i^!. |
| `TauCeti.EtaleDuality.Recollement.ofClosedOpen` | constructor | The constructible étale recollement of D^b_c(Z, Λ) → D^b_c(X, Λ) → D^b_c(U, Λ) for Z ⊂ X closed with open complement U (EDC.1:biduality/recollement-adjunctions). |
| `TauCeti.EtaleDuality.Recollement.ofClosedOpen_upperStar` | compatibility | In ofClosedOpen, j^* is restriction to U and i_* is pushforward along the closed immersion. |

**Unit tests.**

- `TauCeti.EtaleDuality.recollement_ofClosedOpen_empty` (degenerate): For Z = ∅, i_* = 0 and j^* : D^b_c(X, Λ) → D^b_c(U, Λ) is an equivalence.
- `TauCeti.EtaleDuality.recollement_triangle_affineLine` (computation): For X = 𝔸¹, Z = {0}, K = Λ_X: triangleLowerShriek is j_!Λ_{𝔾_m} → Λ_{𝔸¹} → i_*Λ_0 →.
- `TauCeti.EtaleDuality.recollement_ofClosedOpen_upperStar_eq` (compatibility): In Recollement.ofClosedOpen, j^* is the restriction functor of EDC.0/etale-derived-category along U ⊂ X.
- `TauCeti.EtaleDuality.not_recollement_without_adjoints` (non-example): The inclusion of finite-dimensional F-vector spaces into all F-vector spaces (as derived categories in degree 0) is fully faithful but has no right adjoint: a right adjoint R would give Hom(F, R(V)) ≅ Hom(F, V) = V for infinite-dimensional V, impossible since Hom(F, R(V)) = R(V) is finite-dimensional. Full faithfulness alone does not give a recollement.

**Acceptance.**

- For the étale recollement of Z = {0} ⊂ X = 𝔸¹ with U = 𝔾_m, the first triangle for Λ_X is the localization triangle j_!Λ_U → Λ_X → i_*Λ_0 →.
- Duality on D^b_c (EDC.1:biduality/duality-exchange-isomorphisms) maps the étale recollement to the opposite recollement, exchanging j_! with j_* and i^* with i^!.

**Uses.**

- BBD 1.4.10: a t-structure on D is glued from t-structures on D_U and D_F.
- EDC.5/middle-perverse-t-structure: induction over strata glues the perverse t-structure.
- GeometricSatakeAndFusion:GS1: the relative perverse t-structure is glued along Schubert strata.
- EDC.5/recollement-intermediate-extension: j_!* is the image of pj_! → pj_*.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`, `mathlib:CategoryTheory.Functor.IsTriangulated`, `mathlib:CategoryTheory.Adjunction`

**Used by.** `gluing-t-structures`, `middle-perverse-t-structure`, `open-closed-perverse-recollement`, `enlarged-perversity-conditions`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 1.4.3, (1.4.3.1)–(1.4.3.5), pp.44–45; 1.4.2.1, p.44; Remarque 1.4.8, p.48: The abstract recollement axioms: exact adjoints of i_* and j^*, the vanishing j^*i_* = 0 with its adjoint consequences, the two distinguished triangles, and full faithfulness; the sheaf situation that motivates them.

**Suggested declarations.** `TauCeti.EtaleDuality.Recollement`

### Gluing t-structures along a recollement

Node `EtaleDualityAndPerverseSheaves:EDC.5/gluing-t-structures` · theorem. Planet: Gluing of t-structures.

Let D_F → D → D_U be a recollement (EDC.5/recollement-situation) of categories satisfying the octahedral axiom, with t-structures t_F and t_U. Put D^{≤0} := {K : j^*K ∈ D_U^{≤0}, i^*K ∈ D_F^{≤0}} and D^{≥0} := {K : j^*K ∈ D_U^{≥0}, i^!K ∈ D_F^{≥0}}. Then: (a) (D^{≤0}, D^{≥0}) is a t-structure on D, the glued t-structure (BBD 1.4.10); conversely a t-structure on D is glued from t-structures on D_U and D_F exactly when j_!j^* is right t-exact (BBD 1.4.12); (b) j_!, i^* are right t-exact, j_*, i^! are left t-exact, j^*, i_* are t-exact, and (pj_!, pj^*, pj_*), (pi^*, pi_*, pi^!) are adjoint triples of functors between the hearts (BBD 1.4.16); (c) on hearts pj^* ∘ pi_* = 0, pi^* ∘ pj_! = 0, pi^! ∘ pj_* = 0, and for A in the heart C the sequences pj_!pj^*A → A → pi_*pi^*A → 0 and 0 → pi_*pi^!A → A → pj_*pj^*A are exact; the essential image of pi_* is the thick subcategory of A with pj^*A = 0, and pj^* identifies C_U with the quotient C/C_F (BBD 1.4.17–1.4.18); (d) for A in C there are exact sequences 0 → pi_*H^{−1}(i^*A) → pj_!pj^*A → A → pi_*pi^*A → 0 and 0 → pi_*pi^!A → A → pj_*pj^*A → pi_*H¹(i^!A) → 0 (BBD 1.4.19); (e) for B in D_U and p ∈ ℤ there is, up to unique isomorphism, a unique extension X of B (j^*X ≅ B) with i^*X ∈ D_F^{≤p−1} and i^!X ∈ D_F^{≥p+1}, namely the relative truncation τ^F_{≤p−1}j_*B (BBD 1.4.14); (f) the glued t-structure is nondegenerate iff t_U and t_F are (1.4.11), and it is bounded when t_U and t_F are bounded.

**Hypotheses.**

- A recollement whose three categories satisfy the octahedral axiom; t-structures t_U, t_F.

**Proof.**

- Orthogonality: for X ∈ D^{≤0}, Y ∈ D^{≥1} use the first triangle of X and adjunction: Hom(i_*i^*X, Y) = Hom(i^*X, i^!Y) = 0 and Hom(j_!j^*X, Y) = Hom(j^*X, j^*Y) = 0 (BBD 1.4.10, axiom (i)).
- Truncation triangles: choose Y → X → j_*τ_{≥1}j^*X and A → Y → i_*τ_{≥1}i^*Y and apply the octahedral axiom; applying j^*, i^*, i^! to the octahedron shows A ∈ D^{≤0}, B ∈ D^{≥1} (BBD 1.4.10, axiom (iii), pp.48–49).
- (b) from the definitions and the adjoint criterion of EDC.5/t-exact-functors (BBD 1.4.16); (c)–(d) from the two triangles of the recollement and long exact sequences of t-cohomology (EDC.5/t-structure-cohomology; BBD 1.4.17–1.4.19).
- (e): the triangle i_*i^*X → j_!B[1] ... of BBD 1.4.14 shows any such X is τ^F_{≤p−1}j_*B, which has the required bounds; (f) boundedness: if B ∈ D_U^{[a,b]} and the F-part is bounded, the defining conditions are met in a finite range.

**Acceptance.**

- With D_F = 0 the glued t-structure on D ≃ D_U is t_U; with D_U = 0 it is t_F.
- For the étale recollement of a point in 𝔸¹ and the shifted natural t-structures (shift 1 on 𝔾_m, 0 on the point), the glued t-structure is the middle perverse t-structure of 𝔸¹ and Λ_{𝔸¹}[1] lies in its heart.
- Gluing the natural t-structures (shift 0 on both pieces) gives the natural t-structure of D^b_c(X, Λ).

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/recollement-situation`, `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functors`, `EtaleDualityAndPerverseSheaves:EDC.5/t-structure-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.5/heart-abelian-subcategory`, `mathlib:CategoryTheory.Triangulated.TStructure`, `mathlib:CategoryTheory.IsTriangulated`

**Used by.** `recollement-intermediate-extension`, `middle-perverse-t-structure`, `open-closed-perverse-recollement`, `adic-perverse-t-structures`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Théorème 1.4.10, p.48; Remarque 1.4.11, Proposition 1.4.12, p.49; Proposition 1.4.14, p.51: The pair defined by conditions on j^*, i^* and i^! is a t-structure; the converse criterion through j_!j^*; nondegeneracy; uniqueness of extensions with prescribed i^*, i^! bounds.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Propositions 1.4.16–1.4.18, pp.51–52; Lemme 1.4.19, p.52: Exactness of the six functors for the glued t-structure, the adjoint triples on hearts, the vanishing composites and exact sequences, the thick subcategory and quotient, and the four-term exact sequences.

**Suggested declarations.** `TauCeti.EtaleDuality.Recollement.gluedTStructure`, `TauCeti.EtaleDuality.Recollement.gluedTStructure_le_iff`, `TauCeti.EtaleDuality.Recollement.gluedTStructure_ge_iff`

### Intermediate extension in a recollement

Node `EtaleDualityAndPerverseSheaves:EDC.5/recollement-intermediate-extension` · construction.

In a recollement with glued t-structure (EDC.5/gluing-t-structures), with hearts C_U, C, C_F, the intermediate extension j_!* : C_U → C sends B to the image, in the abelian category C, of the map pj_!B → pj_*B adjoint to the identity of B (BBD 1.4.22). Then: (a) j^*j_!*B ≅ B; (b) j_!*B ≅ τ^F_{≤−1}j_*B ≅ τ^F_{≥1}j_!B, and similarly pj_!B ≅ τ^F_{≤−2}j_*B, pj_*B ≅ τ^F_{≤0}j_*B (BBD 1.4.23); (c) j_!*B is the unique extension X of B in D with i^*X ∈ D_F^{≤−1} and i^!X ∈ D_F^{≥1} (BBD 1.4.24), equivalently the unique extension of B in C with no nonzero subobject or quotient in the essential image of pi_* (BBD 1.4.25); (d) j_!* is a fully faithful functor and sends simple objects to simple objects; (e) every simple object of C is either pi_*S with S simple in C_F or j_!*S with S simple in C_U (BBD 1.4.26).

**Hypotheses.**

- A recollement of categories satisfying the octahedral axiom with the glued t-structure.

**Construction and proof.**

- Define j_!* as the image of the canonical map pj_!B → pj_*B in the abelian heart (EDC.5/heart-abelian-subcategory), the map being H⁰ of j_!B → j_*B (BBD (1.4.6.2), (1.4.22.1)).
- (b): BBD 1.4.23 from 1.4.14 (EDC.5/gluing-t-structures (e)) with p = −1, −2, 0.
- (c): 1.4.24 is 1.4.14 for p = 0; 1.4.25 reformulates it, because pi^*X (resp. pi^!X) is the largest quotient (resp. subobject) of X in C_F (BBD 1.4.17.1).
- (d): a map φ : B → B′ induces a map of images; restriction is faithful on objects with no C_F-sub or quotient because kernel and cokernel defects would be supported on F (1.4.25); simple objects by 1.4.26.
- (e): BBD 1.4.26 — a simple object of C either lies in the thick subcategory C_F or has simple image in C/C_F and no sub or quotient in C_F.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.Recollement.intermediateExtension` | constructor | j_!* : heart(t_U) ⥤ heart(glued), B ↦ image(pj_!B → pj_*B). |
| `TauCeti.EtaleDuality.Recollement.intermediateExtension_eq_image` | characterisation | j_!*B ≅ Abelian.image of the canonical map pj_!B ⟶ pj_*B. |
| `TauCeti.EtaleDuality.Recollement.upperStar_intermediateExtension` | simp | j^* ∘ j_!* ≅ 𝟭 on heart(t_U). |
| `TauCeti.EtaleDuality.Recollement.intermediateExtension_iso_truncation` | characterisation | j_!*B ≅ τ^F_{≤−1}(j_*B) ≅ τ^F_{≥1}(j_!B) (relative truncations). |
| `TauCeti.EtaleDuality.Recollement.intermediateExtension_unique` | universal-property | An extension X of B with i^*X ∈ D_F^{≤−1} and i^!X ∈ D_F^{≥1} is isomorphic to j_!*B by a unique isomorphism compatible with the identifications j^*X ≅ B. |
| `TauCeti.EtaleDuality.Recollement.intermediateExtension_no_sub_quotient` | characterisation | j_!*B has no nonzero subobject and no nonzero quotient in the essential image of pi_*. |
| `TauCeti.EtaleDuality.Recollement.intermediateExtension_fullyFaithful` | other | j_!* is fully faithful. |
| `TauCeti.EtaleDuality.Recollement.intermediateExtension_simple` | other | j_!* sends simple objects to simple objects. |
| `TauCeti.EtaleDuality.Recollement.simple_classification` | characterisation | Every simple object of the glued heart is pi_*S (S simple in C_F) or j_!*S (S simple in C_U), and these are distinct. |

**Unit tests.**

- `TauCeti.EtaleDuality.intermediateExtension_closed_zero` (degenerate): If D_F = 0 then j_!* is a quasi-inverse of the equivalence pj^* on hearts.
- `TauCeti.EtaleDuality.intermediateExtension_affineLine` (computation): For the étale recollement 𝔾_m ⊂ 𝔸¹ ⊃ {0} with field coefficients, j_!*(Λ[1]) ≅ Λ_{𝔸¹}[1].
- `TauCeti.EtaleDuality.not_lowerShriek_eq_intermediateExtension` (non-example): For 𝔾_m ⊂ 𝔸¹ with field coefficients, pj_!(Λ[1]) has the nonzero subobject i_*Λ_0, so pj_!(Λ[1]) ≇ j_!*(Λ[1]).
- `TauCeti.EtaleDuality.intermediateExtension_simple_test` (characterisation): j_!* of a simple object of C_U is simple in C.

**Acceptance.**

- For j : 𝔾_m → 𝔸¹ with field coefficients, j_!*(Λ[1]) ≅ Λ_{𝔸¹}[1], and the exact sequence 0 → i_*Λ_0 → pj_!(Λ[1]) → Λ_{𝔸¹}[1] → 0 shows pj_! ≠ j_!*.

**Uses.**

- BBD 2.1.7–2.1.11: the intersection complex is j_!* of a shifted local system.
- EDC.5/perverse-intermediate-extension: the étale j_!* is this construction for the perverse recollement.
- GeometricSatakeAndFusion:GS1: simple equivariant perverse sheaves are intermediate extensions from orbits.
- LefschetzPencilsAndVanishingCycles:LPV.6: the exchange of RΨ with j_!* is stated for this image.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/gluing-t-structures`, `EtaleDualityAndPerverseSheaves:EDC.5/heart-abelian-subcategory`, `EtaleDualityAndPerverseSheaves:EDC.5/t-structure-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functors`, `mathlib:CategoryTheory.Abelian.image`, `mathlib:CategoryTheory.Simple`

**Used by.** `perverse-intermediate-extension`, `deligne-truncation-formula`, `simple-perverse-sheaves-classification`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Définition 1.4.22, Proposition 1.4.23, p.54; Corollaires 1.4.24–1.4.25, Proposition 1.4.26, p.55: j_!*B is the image of pj_!B in pj_*B; its relative truncation descriptions; the unique extension with i^* ≤ −1 and i^! ≥ 1, equivalently without sub or quotient from the closed part; the simple objects of the glued heart.

**Suggested declarations.** `TauCeti.EtaleDuality.Recollement.intermediateExtension`

### Tilting a t-structure along a torsion theory

Node `EtaleDualityAndPerverseSheaves:EDC.5/torsion-pair-tilt` · construction.

Let t be a t-structure on a pretriangulated category D with heart C, and (T, F) a torsion theory on C (Hom(T, F) = 0 for T ∈ T, F ∈ F, and every A in C has a short exact sequence 0 → A_T → A → A_F → 0 with A_T ∈ T, A_F ∈ F). The tilt t⁺ is defined by t⁺.le 0 := {X ∈ t.le 1 : H¹_t X ∈ T} and t⁺.ge 0 := {X ∈ t.ge 0 : H⁰_t X ∈ F}. Then t⁺ is a t-structure on D with t.le 0 ⊆ t⁺.le 0 ⊆ t.le 1 and t.ge 1 ⊆ t⁺.ge 0 ⊆ t.ge 0; its heart C⁺ carries the torsion theory (F, T[−1]); tilting t⁺ along it gives t shifted by one. If C is O-linear (O a discrete valuation ring with uniformizer λ) and noetherian, then (λ-power-torsion objects, objects on which λ is a monomorphism) is a torsion theory on C; if C is artinian, (divisible objects, torsion objects) is one.

**Hypotheses.**

- D pretriangulated with the octahedral axiom; (T, F) a torsion theory on the heart.

**Construction and proof.**

- Orthogonality: for X ∈ t⁺.le 0, Y ∈ t⁺.ge 1, Hom(X, Y) = Hom(τ_{≥1}X, τ_{≤1}Y) = Hom_C(H¹X, H¹Y) = 0 since H¹X ∈ T and H¹Y ∈ F (Juteau Prop. 1.3.6 (i)).
- Truncation: split H¹_t X by the torsion sequence and lift it to a triangle with BBD 1.3.15 (Juteau Prop. 1.3.6 (iii)).
- The noetherian/artinian torsion theories: the chain ker(λ^n) stabilises (resp. im(λ^n)) (Juteau Props. 1.3.4–1.3.5).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.TStructure.tilt` | constructor | t⁺ := the tilt of t along a torsion theory (T, F) of its heart. |
| `TauCeti.EtaleDuality.TStructure.tilt_le_iff` | characterisation | X ∈ t⁺.le 0 iff X ∈ t.le 1 and H¹_t X ∈ T. |
| `TauCeti.EtaleDuality.TStructure.tilt_ge_iff` | characterisation | X ∈ t⁺.ge 0 iff X ∈ t.ge 0 and H⁰_t X ∈ F. |
| `TauCeti.EtaleDuality.TStructure.le_le_tilt` | relation | t.le 0 ⊆ t⁺.le 0 ⊆ t.le 1. |
| `TauCeti.EtaleDuality.TStructure.ge_tilt_ge` | relation | t.ge 1 ⊆ t⁺.ge 0 ⊆ t.ge 0. |
| `TauCeti.EtaleDuality.TStructure.TorsionTheory` | structure | A torsion theory on an abelian category: full subcategories (T, F) with Hom(T, F) = 0 and the torsion sequences. |
| `TauCeti.EtaleDuality.TStructure.TorsionTheory.ofNoetherianLinear` | constructor | For an O-linear noetherian abelian category, (λ-power torsion, λ-torsion-free) is a torsion theory. |
| `TauCeti.EtaleDuality.TStructure.tilt_tilt` | relation | Tilting t⁺ along (F, T[−1]) recovers t shifted by one. |

**Unit tests.**

- `TauCeti.EtaleDuality.tilt_point_integral` (computation): On D^b_fg(ℤ_ℓ) with (torsion, torsion-free): (ℤ/ℓ)[−1] ∈ heart(t⁺), (ℤ/ℓ)[0] ∉ heart(t⁺), ℤ_ℓ[0] ∈ heart(t⁺).
- `TauCeti.EtaleDuality.tilt_torsion_zero` (degenerate): If T = 0 (so F = C) then t⁺ = t.
- `TauCeti.EtaleDuality.tilt_free_zero` (degenerate): If F = 0 (so T = C) then t⁺.le 0 = t.le 1: the tilt is the shift of t by one.
- `TauCeti.EtaleDuality.tilt_dual_compat` (compatibility): RHom_{ℤ_ℓ}(−, ℤ_ℓ) maps the natural t.le 0 of D^b_fg(ℤ_ℓ) onto t⁺.ge 0 (BBD 3.3.1).
- `TauCeti.EtaleDuality.not_torsionTheory_divisible_free` (non-example): On finitely generated ℤ_ℓ-modules, (divisible, torsion) is not a torsion theory: the only divisible submodule of ℤ_ℓ is 0 and ℤ_ℓ/0 = ℤ_ℓ is not torsion, so ℤ_ℓ has no torsion sequence (the category is noetherian, not artinian).

**Acceptance.**

- For D = D^b_fg(ℤ_ℓ) with the natural t-structure and (torsion, torsion-free), the heart of t⁺ contains ℤ_ℓ[0] and (ℤ/ℓ)[−1] but not (ℤ/ℓ)[0]; this is BBD's t-structure on D_c(pt, ℤ) in 3.3.1.

**Uses.**

- BBD 3.3.4 and Juteau §1.1: the integral perversity p⁺ is the tilt of p along (torsion, torsion-free).
- EDC.5/integral-dual-perversity: Verdier duality on D^b_c(X, O) exchanges p and p⁺.
- LefschetzPencilsAndVanishingCycles:LPV.6: integral nearby cycles are stated for the p/p⁺ conventions.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/t-structure-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.5/heart-abelian-subcategory`, `mathlib:CategoryTheory.Triangulated.TStructure`

**Used by.** `integral-dual-perversity`

**Sources.**

- [Correspondance de Springer modulaire et matrices de décomposition (Modular Springer correspondence and decomposition matrices)](https://arxiv.org/pdf/0901.3671v1), Definition 1.3.1, Propositions 1.3.3–1.3.6, pp.42–44 (arXiv:0901.3671v1): Torsion theories on an abelian category, the torsion/torsion-free and divisible/torsion theories of a noetherian (artinian) O-linear category, and the tilted t-structure with aisle conditions on pH¹ and pH⁰.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 3.3.1–3.3.2, p.98; 3.3.4, p.99: The duality RHom(−, ℤ) exchanges the natural t-structure of D_c(ℤ) with its tilt; the t-structures p and p⁺ determine each other through torsion conditions on pH¹ and pH⁰.

**Suggested declarations.** `TauCeti.EtaleDuality.TStructure.tilt`

## EDC.5b — Dimension and the middle perverse t-structure

The perverse t-structure is defined pointwise, by stalks and costalks measured against dim(x), and constructed by gluing shifted natural t-structures along stratifications; smooth-pair purity makes the result independent of the stratification. The base field is arbitrary (the perfect closure has the same étale site), and the coefficients are any noetherian ring killed by an integer invertible on the base. ℓ-adic coefficients are handled by reduction modulo λ, inside the ℓ-adic formalism requested from SchemeAndStackFoundations SF.2. The enlarged conditions on nonconstructible complexes are definitions with continuity properties, not a t-structure.

### The dimension of a point and the middle perversity

Node `EtaleDualityAndPerverseSheaves:EDC.5/point-dimension-function` · definition.

Let X be a scheme locally of finite type over a field k. For a point x of X put dim(x) := the Krull dimension of the closure of {x} in X, a natural number equal to the transcendence degree of κ(x) over k. The function x ↦ dim(x) is a dimension function: if x specializes to y ≠ x then dim(y) < dim(x), and dim(y) = dim(x) − 1 when {y}^− has codimension one in {x}^−. It does not change under passage to an open (or étale) neighbourhood of x, nor under a purely inseparable or other algebraic extension of the base field at points lying over x; for a morphism f : X → Y of finite type whose fibres have dimension ≤ d, dim(x) ≤ dim(f(x)) + d, with equality dim(x) = dim(f(x)) when f is quasi-finite. The middle perversity is the function p(x) := −dim(x). It is defined through dimension and not codimension: for strata whose closures have different dimensions the two conventions differ.

**Hypotheses.**

- X locally of finite type over a field (so points have finite transcendence degree and X is catenary).
- dim(x) is computed in X, not in a stratum: for x in a locally closed S ⊂ X the closure of x in S and in X have the same dimension.

**Construction and proof.**

- Define dim(x) as Mathlib's topologicalKrullDim of the closure of {x} (an element of ℕ ∪ {±∞}, finite here); the equality with tr.deg_k κ(x) is the dimension theory of finite-type algebras over a field, applied to the integral closed subscheme {x}^− (BBD 4.0, p.102 uses this as the definition).
- Dimension function: {y}^− ⊊ {x}^− are integral of finite type over k, so dim drops, by one in codimension one (catenarity of finite-type algebras over a field).
- Open/étale invariance: the closure of x in an open U is dense in the closure in X; étale maps are quasi-finite and preserve transcendence degree. Field extensions: for an algebraic k′/k, residue fields of points over x are algebraic over κ(x).
- Morphisms: for y = f(x), κ(x) is a finitely generated extension of κ(y) of transcendence degree at most the dimension of the fibre (BBD 4.2.4, p.108: dim(x) ≤ dim f(x) + d), zero for quasi-finite f.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.pointDim` | constructor | pointDim X x := topologicalKrullDim (closure {x}) for X locally of finite type over k. |
| `TauCeti.EtaleDuality.pointDim_eq_trdeg` | characterisation | pointDim X x = tr.deg_k κ(x). |
| `TauCeti.EtaleDuality.pointDim_lt_of_specializes` | relation | If x ⤳ y and x ≠ y then pointDim y < pointDim x. |
| `TauCeti.EtaleDuality.pointDim_closedPoint` | simp | For a closed point x of X locally of finite type over k, pointDim x = 0. |
| `TauCeti.EtaleDuality.pointDim_open` | compatibility | For U ⊆ X open and x ∈ U, the dimension of x computed in U equals pointDim X x. |
| `TauCeti.EtaleDuality.pointDim_le_add_fibreDim` | relation | For f : X → Y of finite type with fibres of dimension ≤ d, pointDim X x ≤ pointDim Y (f x) + d. |
| `TauCeti.EtaleDuality.pointDim_quasiFinite` | relation | For f quasi-finite (in particular étale, finite, or an immersion), pointDim X x = pointDim Y (f x). |
| `TauCeti.EtaleDuality.AboveMiddleCutoff` | data | The middle perversity p(x) = −pointDim x as a cutoff: AboveMiddleCutoff x m holds iff m > −dim(x), the degrees in which stalks of an object of pD^{≤0} must vanish. |

**Unit tests.**

- `TauCeti.EtaleDuality.pointDim_affineSpace_closed` (computation): Every closed point of 𝔸^n_k has pointDim 0.
- `TauCeti.EtaleDuality.pointDim_affineSpace_generic` (computation): The generic point of 𝔸^n_k has pointDim n.
- `TauCeti.EtaleDuality.pointDim_spec_field` (degenerate): The unique point of Spec k has pointDim 0.
- `TauCeti.EtaleDuality.pointDim_eq_coheight_compat` (compatibility): pointDim X x equals the Krull dimension of the reduced closed subscheme {x}^− (Mathlib topologicalKrullDim of its underlying space).
- `TauCeti.EtaleDuality.not_pointDim_eq_codim` (non-example): On 𝔸² ⊔ 𝔸¹ the closed points have pointDim 0 but codimension 2 and 1: a perversity defined through codimension would give these points different cutoffs.

**Acceptance.**

- A closed point of 𝔸^n_k has dim 0; the generic point of 𝔸^n_k has dim n.
- On X = 𝔸² ⊔ 𝔸¹ the closed points all have dim 0 although they have codimension 2 and 1 respectively.

**Uses.**

- BBD 4.0, (4.0.1)–(4.0.2): the stalk and costalk conditions of the middle perverse t-structure.
- BBD 4.2.4: amplitude estimates through dim(x) ≤ dim f(x) + d.
- IgusaVarietiesAndTorsionConcentration:IG.7: the costalk lower bound uses δ = 0 on a finite closed set.
- EDC.5/enlarged-perversity-conditions: the same function defines the nonconstructible conditions.

**Depends on.** `mathlib:topologicalKrullDim`, `mathlib:closure`, `mathlib:Specializes`

**Used by.** `middle-perverse-t-structure`, `shifted-local-systems-perverse`, `quasi-finite-perverse-exactness`, `fibre-dimension-perverse-amplitude`, `enlarged-perversity-conditions`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.0, p.102: For a point x, closed or not, BBD set dim(x) := dim of the closure of x = the transcendence degree of k(x) over k, and state the perverse conditions (4.0.1)–(4.0.2) with it.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Remarque before Corollaire 2.2.6, p.69; 2.2.11–2.2.12, pp.70–71: The perversity conditions must be expressed through the dimension, not the codimension, of strata; the middle perversity p_{1/2} on a stratum S is −dim S and in pointwise form uses dim x.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.2.4, p.108: For f with fibres of dimension ≤ d and x in X, dim(x) ≤ dim f(x) + d.

**Suggested declarations.** `TauCeti.EtaleDuality.pointDim`, `TauCeti.EtaleDuality.AboveMiddleCutoff`

### The middle perverse t-structure on constructible complexes

Node `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure` · construction. Planet: Middle perverse t-structure.

Let k be a field, n invertible in k, X separated of finite type over k and Λ a noetherian ring with nΛ = 0. For a point x of X let i_x : x → X be the inclusion, factored as x → {x}^− → X, and put i_x^* K := (K restricted to x) and i_x^! K := (i^!K restricted to the generic point x of {x}^−) for i : {x}^− → X closed; their geometric fibres at x̄ are the stalk and costalk of K at x. Define pD^{≤0}(X, Λ) := {K ∈ D^b_c(X, Λ) : ℋ^m(i_x^*K) = 0 for m > −dim(x), for every point x} (4.0.1), equivalently dim Supp ℋ^m(K) ≤ −m for every m (4.0.1′), and pD^{≥0}(X, Λ) := {K ∈ D^b_c(X, Λ) : ℋ^m(i_x^!K) = 0 for m < −dim(x), for every point x} (4.0.2), with pD^{≤a} := pD^{≤0}[−a] and pD^{≥a} := pD^{≥0}[−a]. Then (pD^{≤0}, pD^{≥0}) is a t-structure on D^b_c(X, Λ), the middle perverse t-structure. It is bounded: D^{≤−dim X} ⊆ pD^{≤0} ⊆ D^{≤0} and D^{≥0} ⊆ pD^{≥0} ⊆ D^{≥−dim X} for the natural t-structure. For a finite partition of X into equidimensional locally closed strata S, each smooth after passing to the perfect closure of k, such that every ℋ^m(i_S^*K) and ℋ^m(i_S^!K) is locally constant, K ∈ pD^{≤0} iff ℋ^m(i_S^*K) = 0 for m > −dim S on every stratum, and K ∈ pD^{≥0} iff ℋ^m(i_S^!K) = 0 for m < −dim S on every stratum. The t-structure is étale local, restriction of scalars along a finite Λ → Λ′ is t-exact, extension of the base field is t-exact, and for X = Spec Ω with Ω separably closed it is the natural t-structure of D^b_c(Spec Ω, Λ) ≃ D^b_fg(Λ).

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- Λ is a noetherian commutative ring with nΛ = 0; D^b_c(X, Λ) is the bounded constructible category of EDC.0/constructible-ctf-complexes.
- No smoothness of X and no perfectness of k are assumed: the proof reduces to the perfect closure by topological invariance of the étale site.
- BBD write the proof for ℤ/ℓ, ℤ/ℓ^n and finite ℤ/ℓ^n-algebras (2.2.10–2.2.13); for a general noetherian Λ killed by n the proof below runs the same gluing induction on the specific complexes involved.

**Construction and proof.**

- Reduce to k perfect: X_{k^perf} → X is a universal homeomorphism, so it induces an equivalence of étale sites (requested from SchemeAndStackFoundations:SF.2, Stacks Tag 04DY), preserving stalks, costalks, constructibility and dim(x) (EDC.5/point-dimension-function).
- On a smooth equidimensional stratum S of dimension e, for complexes with locally constant cohomology the pointwise conditions are the natural t-structure shifted by e: the stalk condition at the generic point gives D^{≤−e}, and smooth-pair purity (EDC.3/smooth-pair-purity) gives i_x^!L ≅ i_x^*L(−c)[−2c] for c = e − dim(x), so the costalk condition is implied by the one at the generic point (EDC.5/shifted-local-systems-perverse).
- Construction of the truncation triangle of a given K by noetherian induction on X: take a dense open U on which the cohomology sheaves of K are lisse and U is smooth equidimensional, truncate there with the shifted natural truncation, glue with the perverse t-structure of the closed complement (induction) along the recollement EDC.1:biduality/recollement-adjunctions by the octahedral argument of EDC.5/gluing-t-structures (BBD 1.4.10 and 2.1.3); the finiteness theorem (Rj_* and i^! preserve D^b_c, EDC.0/constructible-ctf-complexes with its SF.2 import) keeps every object constructible.
- Orthogonality Hom(pD^{≤0}, pD^{≥1}) = 0 by dévissage along the same stratification: for i_S the stratum inclusions, Hom(i_{S!}i_S^*K, L) = Hom(i_S^*K, i_S^!L) vanishes by the shifted natural bounds on S (BBD 2.1.4).
- Independence of choices and the stratum criterion: refining the stratification does not change the conditions, by purity (BBD 2.2.11, citing SGA 4 XVI 3.7 for the analogue of 2.1.14) and the pointwise form 2.2.12 with the corrected inequalities of EtaleDualityAndPerverseSheaves/E11; the stratum criterion is the one used in the proof of BBD 4.2.8, p.112.
- Bounds (2.1.2.1); étale locality from the pointwise form and the quasi-finite invariance of dim(x); restriction of scalars commutes with stalks and with i^! (EDC.0/coefficient-change); base-field extension: BBD 4.2.9; the point: dim(x) = 0 and costalk = stalk.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.perverseLE` | constructor | The upper aisle: K with ℋ^m(i_x^*K) = 0 for m > −dim(x) at every point x. |
| `TauCeti.EtaleDuality.perverseGE` | constructor | The lower aisle: K with ℋ^m(i_x^!K) = 0 for m < −dim(x) at every point x. |
| `TauCeti.EtaleDuality.perverseTStructure` | constructor | The t-structure on D^b_c(X, Λ) with le 0 = perverseLE and ge 0 = perverseGE. |
| `TauCeti.EtaleDuality.perverseTStructure_le_iff_support` | characterisation | K ∈ pD^{≤0} iff dim Supp ℋ^m(K) ≤ −m for every m. |
| `TauCeti.EtaleDuality.perverseTStructure_le_iff_strata` | characterisation | For a stratification adapted to K (lisse ℋ^m(i_S^*K), ℋ^m(i_S^!K)): K ∈ pD^{≤0} iff ℋ^m(i_S^*K) = 0 for m > −dim S, and K ∈ pD^{≥0} iff ℋ^m(i_S^!K) = 0 for m < −dim S. |
| `TauCeti.EtaleDuality.perverseTStructure_bounded` | other | D^{≤−dim X} ⊆ pD^{≤0} ⊆ D^{≤0} and D^{≥0} ⊆ pD^{≥0} ⊆ D^{≥−dim X}; every K lies in some pD^{[a,b]}. |
| `TauCeti.EtaleDuality.perverseTStructure_glue` | compatibility | For Z ⊂ X closed with complement U, the perverse t-structure of X is the gluing of those of U and Z along Recollement.ofClosedOpen. |
| `TauCeti.EtaleDuality.perverseTStructure_etale_local` | functoriality | For an étale surjective u : V → X, K ∈ pD^{≤0} (resp. pD^{≥0}) iff u^*K is. |
| `TauCeti.EtaleDuality.perverseTStructure_restrictScalars` | functoriality | Restriction of scalars along a finite ring map Λ → Λ′ (so that constructibility is kept) is t-exact for the perverse t-structures. |
| `TauCeti.EtaleDuality.perverseTStructure_baseField` | functoriality | For a field extension K/k, pullback to X_K is t-exact (BBD 4.2.9). |
| `TauCeti.EtaleDuality.perverseTStructure_point` | compatibility | For X = Spec Ω, Ω separably closed, the perverse t-structure is the natural one under D^b_c ≃ D^b_fg(Λ). |
| `TauCeti.EtaleDuality.perverseTStructure_perfectClosure` | compatibility | Pullback along X_{k^perf} → X is a t-exact equivalence of the perverse t-structures. |

**Unit tests.**

- `TauCeti.EtaleDuality.perverse_point_eq_canonical` (compatibility): For X = Spec Ω, Ω separably closed: pD^{≤0} = D^{≤0} under D^b_c(Spec Ω, Λ) ≃ D^b_fg(Λ).
- `TauCeti.EtaleDuality.perverse_curve_constant_shift` (computation): For a smooth curve C over k and Λ ≠ 0: Λ_C[1] ∈ pD^{≤0} ∩ pD^{≥0}.
- `TauCeti.EtaleDuality.perverse_skyscraper` (computation): For a closed point x and a finitely generated Λ-module M, i_{x*}M[0] ∈ pD^{≤0} ∩ pD^{≥0}.
- `TauCeti.EtaleDuality.perverse_empty` (degenerate): For X = ∅ the category is zero and pD^{≤0} = pD^{≥0} = everything.
- `TauCeti.EtaleDuality.not_perverse_curve_constant` (non-example): For a nonempty smooth curve C and Λ ≠ 0, Λ_C (degree 0) lies in pD^{≥1} and not in pD^{≤0}.
- `TauCeti.EtaleDuality.not_perverse_codimension_convention` (non-example): On X = 𝔸² ⊔ 𝔸¹, Λ_{𝔸²}[2] ⊕ Λ_{𝔸¹}[1] is perverse, while Λ_{𝔸²}[2] ⊕ Λ_{𝔸¹}[2] (every component shifted by dim X, as a codimension-based convention would do) is not: at the generic point of 𝔸¹ the costalk of Λ_{𝔸¹}[2] sits in degree −2 < −1, violating the lower condition.

**Acceptance.**

- On a smooth curve C over k, Λ_C[1] lies in the heart and Λ_C (in degree 0) lies in pD^{≥1} but not in pD^{≤0}.
- For a closed point x of X, i_{x*}M[0] lies in the heart for every finitely generated Λ-module M.
- On a smooth surface S, Λ_S[1] lies in pD^{≥1} but not in pD^{≤0} (its stalk at the generic point is in degree −1 > −2), while Λ_S[2] is perverse.

**Uses.**

- BBD §4.0: pD^{≤0}, pD^{≥0} defined by the dimension of supports and costalks.
- Caraiani–Scholze 2017, §6.1 (PAPER-CARAIANI-SCHOLZE-17/164): perverse 𝔽_ℓ-sheaves on finite-type schemes over an algebraically closed field.
- GeometricSatakeAndFusion:GS1: the scheme model and gluing pattern for the relative perverse t-structure.
- LefschetzPencilsAndVanishingCycles:LPV.6: nearby cycles preserve the perverse heart on geometric fibres.
- IgusaVarietiesAndTorsionConcentration:IG.4: the lower bound pD^{≥d} after nearby cycles.
- EndoscopicTransferAndUnitaryTraceComparison:ET.2a:duality-perversity: re-exported middle perverse truncations.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/gluing-t-structures`, `EtaleDualityAndPerverseSheaves:EDC.5/recollement-situation`, `EtaleDualityAndPerverseSheaves:EDC.5/point-dimension-function`, `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`, `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/local-cohomology-identification`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`, `EtaleDualityAndPerverseSheaves:EDC.3/smooth-pair-purity`, `mathlib:CategoryTheory.Triangulated.TStructure`, `mathlib:CategoryTheory.Triangulated.TStructure.bounded`, `SchemeAndStackFoundations:SF.2`

**Used by.** `perverse-sheaf-category`, `shifted-local-systems-perverse`, `open-closed-perverse-recollement`, `perverse-verdier-self-duality`, `quasi-finite-perverse-exactness`, `fibre-dimension-perverse-amplitude`, `perverse-artin-vanishing`, `external-product-t-exact`, `perverse-intermediate-extension`, `deligne-truncation-formula`, `intermediate-extension-low-degree-cohomology`, `intersection-complex-of-local-system`, `simple-perverse-sheaves-classification`, `adic-perverse-t-structures`, `enlarged-perversity-conditions`, `semismall-pushforward-perversity`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.0, (4.0.1)–(4.0.2) and (4.0.1′), p.102: A perverse sheaf satisfies vanishing of stalk cohomology above −dim(x) and of costalk cohomology below −dim(x); (4.0.1) characterises the upper aisle and is equivalent to dim Supp ℋ^iK ≤ −i.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 2.2.9–2.2.13, pp.69–71: For X of finite type over k with the étale topology, pairs (S, L) of stratifications and local systems are used to glue t-structures, refinement is controlled by purity, the limit gives the perverse t-structure on D^b_c(X, ℤ/ℓ), with the pointwise reformulation 2.2.12 and the ℤ/ℓ^n case 2.2.13.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Proposition 2.1.3, Corollaire 2.1.4, p.57; (2.1.2.1), p.57: Induction on the number of strata glues the shifted natural t-structures into a t-structure; the perverse aisles are squeezed between natural aisles.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), proof of Proposition 4.2.8, p.112; 4.2.9, p.112: With a stratification whose strata are equidimensional with smooth reduction and on which ℋ^ni^*K and ℋ^ni^!K are lisse, perversity is tested stratum by stratum through −dim S; base field extension is t-exact.
- [The Stacks project](https://stacks.math.columbia.edu), Tag 04DY (Étale Cohomology, Section 59.45): A universal homeomorphism induces an equivalence of small étale sites; used for the reduction to a perfect base field.

**Suggested declarations.** `TauCeti.EtaleDuality.perverseLE`, `TauCeti.EtaleDuality.perverseGE`

### Perverse sheaves

Node `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category` · definition. Planet: Perverse sheaves.

In the situation of EDC.5/middle-perverse-t-structure, the category of perverse sheaves is the heart Perv(X, Λ) := pD^{≤0}(X, Λ) ∩ pD^{≥0}(X, Λ), a full abelian subcategory of D^b_c(X, Λ) (EDC.5/heart-abelian-subcategory), with perverse cohomology functors pH^m : D^b_c(X, Λ) → Perv(X, Λ) (EDC.5/t-structure-cohomology). Short exact sequences of perverse sheaves are the distinguished triangles with perverse vertices; Hom(K, L[m]) = 0 for perverse K, L and m < 0. Perverse sheaves form a stack for the étale topology: for perverse K, L the presheaf U ↦ Hom(K|_U, L|_U) on X_ét is a sheaf, and perverse sheaves given on an étale covering with isomorphisms on overlaps satisfying the cocycle condition glue to a perverse sheaf, unique up to unique isomorphism (BBD 2.1.21–2.1.23, 2.2.19). If K is perverse with support of dimension ≤ e, then at every point x with dim(x) = e its stalk is concentrated in degree −e.

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- Λ is a noetherian commutative ring with nΛ = 0; D^b_c(X, Λ) is the bounded constructible category of EDC.0/constructible-ctf-complexes.

**Construction and proof.**

- Define Perv(X, Λ) as the heart and pH^m as the t-cohomology of EDC.5/middle-perverse-t-structure.
- Morphism descent: for K ∈ pD^{≤0} and L ∈ pD^{≥0}, ℋ^mRHom(K, L) = 0 for m < 0 (BBD 2.1.20–2.1.21, (2.2.8) in the étale setting), so ℋ⁰RHom(K, L) is the sheaf of morphisms (2.1.22).
- Object descent: BBD 2.2.19 gives a proof valid for the étale constructible categories: glue along a finite étale covering using the vanishing of negative local Exts and the morphism descent just proved.
- Generic concentration: the support condition gives vanishing above −e at x; on a dense open V of {x}^− smooth of dimension e on which K has lisse cohomology, the costalk condition at x reads ℋ^m(K)_x̄ = 0 for m < −e (EDC.5/shifted-local-systems-perverse), since i_x^! and i_x^* differ there by the twist and shift of purity.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.PerverseSheaf` | constructor | Perv(X, Λ) := the heart of perverseTStructure, a full subcategory of D^b_c(X, Λ). |
| `TauCeti.EtaleDuality.PerverseSheaf.abelian` | instance | Perv(X, Λ) is abelian. |
| `TauCeti.EtaleDuality.perverseCohomology` | constructor | pH^m : D^b_c(X, Λ) ⥤ Perv(X, Λ), m ∈ ℤ. |
| `TauCeti.EtaleDuality.perverseCohomology_isHomological` | instance | pH⁰ is homological: distinguished triangles give long exact sequences of perverse sheaves. |
| `TauCeti.EtaleDuality.PerverseSheaf.ext_neg_eq_zero` | relation | Hom(K, L[m]) = 0 for perverse K, L and m < 0. |
| `TauCeti.EtaleDuality.PerverseSheaf.hom_isSheaf` | other | For perverse K, L, U ↦ Hom(K∣_U, L∣_U) is a sheaf on X_ét. |
| `TauCeti.EtaleDuality.PerverseSheaf.descent` | other | Perverse sheaves on an étale covering with cocycle isomorphisms glue uniquely to a perverse sheaf on X. |
| `TauCeti.EtaleDuality.PerverseSheaf.restrictEtale` | functoriality | For u : V → X étale, u^* : Perv(X, Λ) ⥤ Perv(V, Λ) is exact. |
| `TauCeti.EtaleDuality.PerverseSheaf.pointEquiv` | equivalence | For X = Spec Ω, Ω separably closed, Perv(X, Λ) ≌ finitely generated Λ-modules. |
| `TauCeti.EtaleDuality.PerverseSheaf.stalk_generic_concentration` | other | If K is perverse with dim Supp K ≤ e and dim(x) = e, then ℋ^m(K)_x̄ = 0 for m ≠ −e. |

**Unit tests.**

- `TauCeti.EtaleDuality.perverseSheaf_point` (compatibility): Perv(Spec Ω, Λ) ≌ finitely generated Λ-modules, Ω separably closed.
- `TauCeti.EtaleDuality.perverseSheaf_skyscraper` (computation): For a closed point x and finitely generated M, i_{x*}M[0] is perverse.
- `TauCeti.EtaleDuality.perverseSheaf_empty` (degenerate): Perv(∅, Λ) is the zero category.
- `TauCeti.EtaleDuality.perverseSheaf_surface_shift` (computation): On a smooth surface S: Λ_S[2] is perverse and Λ_S[1] is not.
- `TauCeti.EtaleDuality.not_perverse_constant_surface` (non-example): On a smooth surface, pH^m(Λ_S[1]) = 0 for m ≠ 1 and pH¹(Λ_S[1]) ≅ Λ_S[2]: Λ_S[1] is not perverse.

**Acceptance.**

- Perv(Spec Ω, Λ) ≃ finitely generated Λ-modules for Ω separably closed.
- On a nodal cubic X with normalization ν : P¹ → X and node s: 0 → i_{s*}Λ → Λ_X[1] → ν_*Λ_{P¹}[1] → 0 is a short exact sequence of perverse sheaves.

**Uses.**

- BBD 4.3: simple objects and finite length of Perv(X).
- EtaleDualityAndPerverseSheaves:EDC.7: pure perverse sheaves and the decomposition theorem.
- Caraiani–Scholze 2017, after Corollary 6.1.4, p.87: generic stalks of a perverse sheaf at maximal-dimensional support points sit in one degree.
- GeometricSatakeAndFusion:GS1: flat perverse objects and standard objects pH⁰j_!, pH⁰Rj_*.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/heart-abelian-subcategory`, `EtaleDualityAndPerverseSheaves:EDC.5/t-structure-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.5/shifted-local-systems-perverse`, `EtaleDualityAndPerverseSheaves:EDC.0/derived-tensor-and-internal-hom`, `mathlib:CategoryTheory.Triangulated.TStructure.heart`

**Used by.** `open-closed-perverse-recollement`, `perverse-verdier-self-duality`, `smooth-pullback-perverse-exactness`, `affine-open-complement-exactness`, `perverse-intermediate-extension`, `adic-perverse-t-structures`, `integral-dual-perversity`, `semismall-pushforward-perversity`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Définition 2.1.5, p.58; Proposition 2.1.20 and Corollaires 2.1.21–2.1.23, pp.64–65: Perverse sheaves are the heart; negative ℋ^iRHom between the two aisles vanish, morphisms form a sheaf, and perverse sheaves form a stack.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 2.2.8, p.69; 2.2.19, p.74: In the scheme setting RHom between perverse aisles has no negative cohomology sheaves and morphisms glue; object descent is reproved for the étale constructible categories.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.0, Exemples, p.102: A lisse sheaf in degree −d on a smooth pure d-dimensional scheme and a punctual sheaf in degree 0 are perverse.

**Suggested declarations.** `TauCeti.EtaleDuality.PerverseSheaf`, `TauCeti.EtaleDuality.perverseCohomology`

### Shifted local systems on smooth schemes are perverse

Node `EtaleDualityAndPerverseSheaves:EDC.5/shifted-local-systems-perverse` · theorem.

Let X be smooth over k of pure dimension d and K ∈ D^b_c(X, Λ) with locally constant cohomology sheaves. Then K ∈ pD^{≤0} iff ℋ^m(K) = 0 for m > −d, and K ∈ pD^{≥0} iff ℋ^m(K) = 0 for m < −d. In particular L[d] is perverse for every locally constant constructible sheaf L of Λ-modules, and on lisse complexes the perverse t-structure is the natural t-structure shifted by d. For a point x with dim(x) = d − c, i_x^!K ≅ i_x^*K(−c)[−2c].

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- Λ is a noetherian commutative ring with nΛ = 0; D^b_c(X, Λ) is the bounded constructible category of EDC.0/constructible-ctf-complexes.
- X smooth over k of pure dimension d; the cohomology sheaves of K are locally constant.

**Proof.**

- Stalk side: the support of a nonzero locally constant sheaf is a union of components of dimension d, so (4.0.1′) is the vanishing above −d.
- Costalk side: choose a smooth dense open V of {x}^− (after passing to k^perf, EDC.5/middle-perverse-t-structure); V ⊂ X is a smooth pair of codimension c, and smooth-pair purity with locally constant coefficients (EDC.3/smooth-pair-purity) gives i_V^!K ≅ i_V^*K(−c)[−2c]; restrict to x. The costalk condition at x becomes ℋ^m(K_x̄) = 0 for m < −dim(x) − 2c = −d − c, implied by the condition at the generic points (c = 0).
- This is the argument of BBD 4.3.2 (p.112–113) and the example in 4.0 (p.102).

**Acceptance.**

- For C a smooth curve: Λ_C[1] is perverse; Λ_C[0] is not.
- For X = 𝔸² and a closed point x: i_x^!Λ_X ≅ Λ(−2)[−4], whose only cohomology is in degree 4 ≥ −0.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/point-dimension-function`, `EtaleDualityAndPerverseSheaves:EDC.3/smooth-pair-purity`, `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`

**Used by.** `perverse-sheaf-category`, `deligne-truncation-formula`, `intersection-complex-of-local-system`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.0, Exemples, p.102: A lisse sheaf placed in degree −d on X smooth of pure dimension d is perverse.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Lemme 4.3.2 and its proof, pp.112–113: On a smooth irreducible X the vanishing at boundary points of stalks above −dim X and of costalks up to −dim x + (dim X − dim x) follows from cohomological purity.

**Suggested declarations.** `TauCeti.EtaleDuality.perverse_shift_lisse`

### Open–closed recollement of perverse sheaves

Node `EtaleDualityAndPerverseSheaves:EDC.5/open-closed-perverse-recollement` · theorem.

Let i : Z → X be a closed immersion with open complement j : U → X. The middle perverse t-structure on D^b_c(X, Λ) is glued (EDC.5/gluing-t-structures) from those of U and Z along the étale recollement. Consequently: j_!, i^* are right t-exact; Rj_*, i^! are left t-exact; j^* and i_* are t-exact; pj_!, pj^*, pj_* and pi^*, pi_*, pi^! are adjoint triples on perverse sheaves; i_* : Perv(Z, Λ) → Perv(X, Λ) is fully faithful with essential image the perverse sheaves K with j^*K = 0, a thick (Serre) subcategory, and pj^* identifies Perv(U, Λ) with the quotient; for K perverse there are exact sequences of perverse sheaves 0 → i_*pH^{−1}(i^*K) → pj_!j^*K → K → i_*pH⁰(i^*K) → 0 and 0 → i_*pH⁰(i^!K) → K → pj_*j^*K → i_*pH¹(i^!K) → 0, the middle maps being pH⁰ of the counit j_!j^*K → K and the unit K → Rj_*j^*K. No bound i^*K ∈ pD^{[−1,0]} holds for a general closed immersion (that is the affine-open case, EDC.5/affine-open-complement-exactness).

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- Λ is a noetherian commutative ring with nΛ = 0; D^b_c(X, Λ) is the bounded constructible category of EDC.0/constructible-ctf-complexes.
- i : Z → X closed with open complement j : U → X.

**Proof.**

- The stalk and costalk conditions for points of U are those of U (EDC.5/point-dimension-function: dim(x) is unchanged), and for points of Z the conditions on i^*K and i^!K are those defining pD(Z); hence the perverse t-structure of X is the glued one (BBD 2.1.8, 2.2.3, 2.2.11).
- Exactness and adjoint triples: EDC.5/gluing-t-structures (b) (BBD 1.4.16, 2.1.6).
- Thick subcategory and quotient: EDC.5/gluing-t-structures (c) (BBD 1.4.17.1–1.4.18).
- Exact sequences: EDC.5/gluing-t-structures (d) (BBD 1.4.19), using only i^*K ∈ pD^{≤0}, i^!K ∈ pD^{≥0}.
- Counterexample to a [−1, 0] bound: for a closed point x of a smooth surface S, i_x^*Λ_S[2] = Λ[2] has perverse degree −2 and i_x^!Λ_S[2] = Λ(−2)[−2] has perverse degree +2.

**Acceptance.**

- For j : 𝔾_m → 𝔸¹ and K = Λ_{𝔸¹}[1]: i^*K = Λ[1] so pH^{−1}(i^*K) = Λ and the first sequence reads 0 → i_*Λ_0 → pj_!(Λ[1]) → Λ_{𝔸¹}[1] → 0.
- For a closed point x of a smooth surface S, i^*(Λ_S[2]) has nonzero pH^{−2}: the four-term sequences use only pH^{−1}i^* and pH⁰i^*, and this example shows they are not a two-term amplitude statement.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/gluing-t-structures`, `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category`, `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functors`, `EtaleDualityAndPerverseSheaves:EDC.5/recollement-situation`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`

**Used by.** `affine-open-complement-exactness`, `perverse-intermediate-extension`, `intermediate-extension-low-degree-cohomology`, `simple-perverse-sheaves-classification`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Proposition 2.1.6, p.58; 2.1.8, p.59; 2.2.3, pp.67–68: For a union of strata U, j_! and j^* are right t-exact and their adjoints left t-exact; the perverse t-structure is the gluing of those on an open and its closed complement, so the formalism of 1.4 applies.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Propositions 1.4.16–1.4.18 and Lemme 1.4.19, pp.51–52: Exactness, adjoint triples on hearts, thick subcategory, quotient and the two exact sequences for an object of the glued heart.

**Suggested declarations.** `TauCeti.EtaleDuality.perverse_recollement_glue`

### Perverse t-structures with ℓ-adic coefficients

Node `EtaleDualityAndPerverseSheaves:EDC.5/adic-perverse-t-structures` · construction.

Assume the ℓ-adic hypotheses: E/ℚ_ℓ finite with ring of integers O and uniformizer λ, and k with finite H^i(Gal(k^sep/k′), ℤ/ℓ) for all finite k′/k. On the ℓ-adic constructible categories D^b_c(X, O) (constructible complexes of finite Tor-dimension at each level λ^m, as a 2-limit) and D^b_c(X, E) := D^b_c(X, O) ⊗_O E, the middle perverse t-structures are defined by the stalk and costalk conditions (4.0.1)–(4.0.2) on the cohomology sheaves ℋ^m (constructible O- and E-sheaves), equivalently by gluing as in EDC.5/middle-perverse-t-structure. Then: K ∈ pD^{≤0}(X, O) iff K ⊗^L_O O/λ ∈ pD^{≤0}(X, O/λ) (BBD 2.2.17); for every interval [a, b] the functor pD^{[a,b]}(X, O) ⊗ E → pD^{[a,b]}(X, E) is an equivalence, so Perv(X, E) = Perv(X, O) ⊗_O E (BBD 2.2.18); the results of EDC.5 stated for torsion coefficients (recollement, intermediate extension, quasi-finite, affine, smooth and fibre-dimension exactness) hold for O and E coefficients (BBD 2.2.19, 4.0); for E the perverse t-structure is self-dual (EDC.5/perverse-verdier-self-duality), for O it is not (EDC.5/integral-dual-perversity).

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- For ℓ-adic coefficients (E/ℚ_ℓ finite, ring of integers O, uniformizer λ, ℓ ≠ char k) the base field satisfies BBD's finiteness condition: H^i(Gal(k^sep/k′), ℤ/ℓ) is finite for every finite k′/k and every i (BBD 2.2.14 and 4.0; for example k finite or separably closed). The categories D^b_c(X, O) and D^b_c(X, E) and their operations are the ℓ-adic formalism requested from SchemeAndStackFoundations:SF.2.
- Pro-étale constructible categories (Bhatt–Scholze) remove the Galois-finiteness condition; they are a different supplied category, not used here.

**Construction and proof.**

- The categories and their operations, compatible with reduction modulo λ^m, are the ℓ-adic formalism requested from SchemeAndStackFoundations:SF.2 (BBD 2.2.14–2.2.16 after Deligne's Weil II 1.1.2; 2-limits of triangulated categories with finite Hom sets are triangulated, BBD 2.2.15).
- Upper aisle via reduction: the exact sequences 0 → ℋ^mK ⊗ ℤ/ℓ^n → ℋ^m(K ⊗ ℤ/ℓ^n) → Tor(ℋ^{m+1}K, ℤ/ℓ^n) → 0 (2.2.16.1) show that the support conditions on K and on K ⊗^L O/λ agree (BBD 2.2.17).
- Gluing along (S, L)-constructible subcategories and passage to the limit over (S, L) as in EDC.5/middle-perverse-t-structure (BBD 2.2.17–2.2.18); the equivalence after ⊗ E from Hom-finiteness.
- The torsion-coefficient theorems transfer by the conservativity of reduction modulo λ and of restriction of scalars (BBD 4.0).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.adicPerverseTStructure` | constructor | The middle perverse t-structure on D^b_c(X, O) (and on D^b_c(X, E)). |
| `TauCeti.EtaleDuality.adicPerverse_le_iff_reduction` | characterisation | K ∈ pD^{≤0}(X, O) iff K ⊗^L_O O/λ ∈ pD^{≤0}(X, O/λ). |
| `TauCeti.EtaleDuality.adicPerverse_rationalize_equiv` | equivalence | pD^{[a,b]}(X, O) ⊗_O E ≃ pD^{[a,b]}(X, E); in particular Perv(X, E) = Perv(X, O) ⊗ E. |
| `TauCeti.EtaleDuality.adicPerverse_rationalize_tExact` | functoriality | K ↦ K ⊗_O E is t-exact from p on O to the perverse t-structure on E. |
| `TauCeti.EtaleDuality.adicPerverse_reduction_rightTExact` | functoriality | K ↦ K ⊗^L_O O/λ^m is right t-exact from p on O to the perverse t-structure on O/λ^m. |
| `TauCeti.EtaleDuality.adicPerverse_point` | compatibility | For X = Spec Ω, Ω separably closed, the perverse t-structure on D^b_c(X, O) is the natural one on D^b_fg(O). |

**Unit tests.**

- `TauCeti.EtaleDuality.adicPerverse_point_integral` (computation): On Spec Ω: O/λ[0] and O[0] are p-perverse, O/λ[1] is not.
- `TauCeti.EtaleDuality.adicPerverse_empty` (degenerate): For X = ∅ both categories are zero.
- `TauCeti.EtaleDuality.adicPerverse_reduction_compat` (compatibility): For K ∈ D^b_c(X, O), pH⁰ commutes with − ⊗ E: (pH⁰K) ⊗ E ≅ pH⁰(K ⊗ E).
- `TauCeti.EtaleDuality.not_adicPerverse_reduction_tExact` (non-example): Reduction modulo λ is not left t-exact from p: O/λ[0] is p-perverse on a point but O/λ ⊗^L O/λ has cohomology in degrees −1 and 0.

**Acceptance.**

- For X = Spec Ω, Ω separably closed: Perv(X, O) is finitely generated O-modules in degree 0 and Perv(X, E) is finite-dimensional E-vector spaces.
- On a smooth curve C, O_C[1] and E_C[1] are perverse; (O/λ)_C[1] ∈ D^b_c(C, O) is p-perverse.

**Uses.**

- BBD §§4–5: Q̄_ℓ-perverse sheaves are the setting of purity and the decomposition theorem (EDC.7).
- LefschetzPencilsAndVanishingCycles:LPV.7: RΨℚ_ℓ[d] perverse with rational ℓ-adic coefficients.
- GeometricSatakeAndFusion:GS1: integral O_ℓ coefficients and coefficient reduction for perverse objects.
- Yun–Zhang II, §3.5: perverse sheaves with characteristic-zero ℓ-adic coefficients.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/gluing-t-structures`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category`, `EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`, `SchemeAndStackFoundations:SF.2`

**Used by.** `integral-dual-perversity`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 2.2.14–2.2.18, pp.71–74: ℤ_ℓ-sheaves via the 2-limit of D^b_ctf(X, ℤ/ℓ^n) under the Galois-finiteness hypothesis; the natural and perverse t-structures on D^b_c(X, ℤ_ℓ), perversity tested modulo ℓ; ℚ_ℓ and finite extensions E by tensoring, with perverse ℚ_ℓ-sheaves obtained from perverse ℤ_ℓ-sheaves.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.0, p.101: Section 4 works with ℚ̄_ℓ-coefficients for fields k with finite Galois cohomology; most results hold for ℤ_ℓ, ℚ_ℓ, ℤ/ℓ^n, E, O and finite quotients of O, by reduction to ℤ/ℓ-coefficients.

**Suggested declarations.** `TauCeti.EtaleDuality.adicPerverseTStructure`

### Perversity conditions on nonconstructible complexes

Node `EtaleDualityAndPerverseSheaves:EDC.5/enlarged-perversity-conditions` · definition.

Let X be separated of finite type over k and Λ torsion (nΛ = 0, n invertible in k). For a ∈ ℤ and K in the unbounded derived category D(X, Λ) (EDC.0/etale-derived-category), say K ∈ pD^{≤a}_{ext}(X, Λ) if ℋ^m(i_x^*K) = 0 for m > a − dim(x) at every point x, and K ∈ pD^{≥a}_{ext}(X, Λ) if K is bounded below and ℋ^m(i_x^!K) = 0 for m < a − dim(x) at every point x (i_x^! := restriction of i^! along {x}^− → X to x, EDC.1:adjoint/local-cohomology-identification). Then: (a) on D^b_c(X, Λ) these are the aisles of the middle perverse t-structure; (b) pD^{≤a}_{ext} is closed under extensions, arbitrary direct sums and filtered colimits; (c) pD^{≥a}_{ext} is closed under extensions and under filtered colimits of systems that are uniformly bounded below (all K_α ∈ D^{≥b} for one b), because for such systems geometric costalks commute with the colimit; (d) for j : U → X open, Rj_* preserves pD^{≥a}_{ext} and j^* preserves both conditions; for f : X → Y finite, f_* preserves both; for u étale, u^* preserves both and detects them when surjective. No t-structure on D(X, Λ) and no constructibility of filtered colimits is asserted.

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- Λ torsion with nΛ = 0; X noetherian (separated of finite type over k); the lower condition includes bounded-belowness so that the costalk of a filtered colimit is computed by the colimit of costalks.

**Construction and proof.**

- (a): definitions agree with (4.0.1)–(4.0.2) (EDC.5/middle-perverse-t-structure).
- (b): stalks are exact and commute with all colimits.
- (c): ℋ^m(i_x^!K) is the colimit over étale neighbourhoods V of x and closed W = {x}^− ∩ V of H^m_W(V, K); with a uniform lower bound b, H^m_W(V, −) depends only on τ_{≤m+1}, a bounded complex in [b, m+1], and étale cohomology with supports of the qcqs V commutes with filtered colimits of sheaves (SF.2/cohomology-filtered-colimits via the localization triangle of EDC.0/cohomology-with-supports); induct on the length.
- (d): for x ∉ U, {x}^− ⊆ X ∖ U and i^!Rj_* = 0 (EDC.5/recollement-situation), so the costalk of Rj_*K at x vanishes; for x ∈ U it is that of K. Finite f: f_* is exact, stalks of f_*K at y are the sums of stalks over the finitely many points above y, and i_y^!f_*K = f′_*i′^!K by base change for the closed immersion; dim is preserved by quasi-finite maps (EDC.5/point-dimension-function). Étale u: stalks and costalks are preserved.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.perverseLEExt` | constructor | K ∈ D(X, Λ) with ℋ^m(i_x^*K) = 0 for m > a − dim(x) at every point. |
| `TauCeti.EtaleDuality.perverseGEExt` | constructor | K ∈ D⁺(X, Λ) with ℋ^m(i_x^!K) = 0 for m < a − dim(x) at every point. |
| `TauCeti.EtaleDuality.perverseLEExt_iff_of_constructible` | compatibility | On D^b_c(X, Λ), perverseLEExt a and perverseGEExt a are pD^{≤a} and pD^{≥a}. |
| `TauCeti.EtaleDuality.perverseLEExt_colimit` | other | perverseLEExt a is closed under filtered colimits and direct sums. |
| `TauCeti.EtaleDuality.perverseGEExt_colimit` | other | perverseGEExt a is closed under filtered colimits of systems uniformly bounded below. |
| `TauCeti.EtaleDuality.costalk_colimit_iso` | relation | For a filtered system K_α in D^{≥b}(X, Λ), colim ℋ^m(i_x^!K_α) ≅ ℋ^m(i_x^! colim K_α). |
| `TauCeti.EtaleDuality.perverseGEExt_pushforward_open` | functoriality | For j : U → X open, Rj_* preserves perverseGEExt a. |
| `TauCeti.EtaleDuality.perverseExt_finite_pushforward` | functoriality | For f finite, f_* preserves perverseLEExt a and perverseGEExt a. |
| `TauCeti.EtaleDuality.perverseExt_etale_local` | functoriality | For u étale, u^* preserves both conditions, and detects them when u is surjective. |

**Unit tests.**

- `TauCeti.EtaleDuality.perverseExt_skyscraper_sum` (computation): On a smooth curve C, ⊕_{x closed} i_{x*}Λ[0] satisfies both perverseLEExt 0 and perverseGEExt 0.
- `TauCeti.EtaleDuality.perverseExt_empty` (degenerate): On X = ∅ every complex satisfies both conditions.
- `TauCeti.EtaleDuality.perverseExt_constructible_compat` (compatibility): For K ∈ D^b_c(X, Λ), K ∈ perverseLEExt 0 ∩ perverseGEExt 0 iff K ∈ Perv(X, Λ).
- `TauCeti.EtaleDuality.not_perverseGEExt_colimit_unbounded` (non-example): The uniform lower bound cannot be dropped: on X = Spec Ω the system K_N := ⊕_{0 ≤ m ≤ N} Λ[m] (cohomology Λ in degrees −N, …, 0) with the split inclusions is filtered, each K_N is bounded below but no single bound works, and colim K_N = ⊕_{m ≥ 0} Λ[m] is not bounded below, so it lies in no perverseGEExt a.

**Acceptance.**

- A filtered colimit of perverse sheaves Λ_C[1] → … along the identity is Λ_C[1].
- For a smooth curve C and the direct sum K = ⊕_{x ∈ C closed} i_{x*}Λ[0] (not constructible), K ∈ pD^{≤0}_{ext} ∩ pD^{≥0}_{ext}.

**Uses.**

- IgusaVarietiesAndTorsionConcentration:IG.4: the uniform costalk lower bound passes through the two-level colimit of finite-level complexes.
- LefschetzPencilsAndVanishingCycles:LPV.6: the filtered-colimit support criterion is stated in this enlarged setting.
- IgusaVarietiesAndTorsionConcentration:IG.7: the ordinary-locus costalk lower bound uses the costalk condition on a finite closed set.
- Caraiani–Scholze 2017, §6.1: perversity of nonconstructible pushforwards along the Hodge–Tate period map, tested on finite-level approximants.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/point-dimension-function`, `EtaleDualityAndPerverseSheaves:EDC.5/recollement-situation`, `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`, `EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports`, `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/local-cohomology-identification`, `SchemeAndStackFoundations:SF.2/cohomology-filtered-colimits`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Définition 2.1.2 and the remarks after it, p.56: The lower perverse condition makes sense for complexes not in D⁺ when the costalk functors have finite cohomological dimension, and it then forces boundedness below; without that hypothesis it is used on D⁺.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.0, (4.0.1)–(4.0.2), p.102: The pointwise stalk and costalk conditions with dim(x).

**Suggested declarations.** `TauCeti.EtaleDuality.perverseLEExt`, `TauCeti.EtaleDuality.perverseGEExt`

## EDC.5c — Exactness of the operations

The exactness statements the stage asks for: finite and quasi-finite maps, fibre-dimension amplitude, smooth pullback with its shift by the relative dimension (and its full faithfulness for connected fibres), perverse Artin vanishing for affine maps with its one-sided bounds, affine open complements, and the external product. The proofs are stalk-dimension counts plus duality; Artin's affine theorem is the one imported input.

### Quasi-finite, finite and étale morphisms and the perverse t-structure

Node `EtaleDualityAndPerverseSheaves:EDC.5/quasi-finite-perverse-exactness` · theorem.

Let f : X → Y be a quasi-finite morphism of separated schemes of finite type over k. Then Rf_! and f^* are right t-exact and their right adjoints Rf_* and f^! are left t-exact for the middle perverse t-structures. If f is finite, f_* = Rf_* = Rf_! is t-exact; if f is étale, f^* = f^! is t-exact; a closed immersion i gives a t-exact fully faithful i_* on perverse sheaves. For a perverse sheaf F on X, Rf_!F ∈ pD^{≤0}(Y) and Rf_*F ∈ pD^{≥0}(Y), and f_!*F := image(pH⁰Rf_!F → pH⁰Rf_*F) defines a functor Perv(X, Λ) → Perv(Y, Λ) generalising j_!*.

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- Λ is a noetherian commutative ring with nΛ = 0; D^b_c(X, Λ) is the bounded constructible category of EDC.0/constructible-ctf-complexes.
- f quasi-finite (for Rf_!: separated, of finite type).

**Proof.**

- Right t-exactness of Rf_! and f^*: by (4.0.1′) the upper aisle is a condition on dim Supp ℋ^m; for f quasi-finite the underived f_! and f^* are exact, ℋ^m(Rf_!K) = f_!ℋ^m(K) with support f(Supp ℋ^mK) of the same dimension, and Supp ℋ^m(f^*K) = f^{−1}(Supp ℋ^mK) has dimension at most that of Supp ℋ^mK (EDC.5/point-dimension-function) (BBD 2.2.5).
- Left t-exactness of Rf_* and f^! by adjunction (EDC.5/t-exact-functors, BBD 1.3.17 (iii)).
- Finite f: Rf_* = Rf_! = f_* exact on sheaves (finite pushforward, imported with proper base change through SF.2), so both one-sided statements combine; étale f: f^! = f^* (EDC.1:adjoint/exceptional-inverse-image) (BBD 2.2.6).
- f_!*: BBD 2.2.7 — the natural map Rf_!F → Rf_*F factors through pH⁰ of each side.

**Acceptance.**

- For a finite surjection ν : P¹ → X onto a nodal cubic, ν_*Λ_{P¹}[1] is perverse.
- For j : 𝔾_m → 𝔸¹ (quasi-finite, affine) j_!Λ[1] and Rj_*Λ[1] are perverse (also by EDC.5/affine-open-complement-exactness).

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/point-dimension-function`, `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functors`, `EtaleDualityAndPerverseSheaves:EDC.0/compact-pushforward-amplitude-and-colimits`, `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`, `SchemeAndStackFoundations:SF.2`

**Used by.** `perverse-artin-vanishing`, `perverse-intermediate-extension`, `intersection-complex-of-local-system`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Proposition 2.2.5, p.68; Corollaire 2.2.6 and 2.2.7, p.69: For f quasi-finite, f_! and f^* are right t-exact and f^!, f_* left t-exact; finite f gives t-exact f_* and étale f gives t-exact f^*; for perverse F, f_!F ∈ pD^{≤0}, f_*F ∈ pD^{≥0} and f_!* is the image of pf_! → pf_*.

**Suggested declarations.** `TauCeti.EtaleDuality.quasiFinite_lowerShriek_isRightTExact`, `TauCeti.EtaleDuality.finite_pushforward_isTExact`, `TauCeti.EtaleDuality.etale_pullback_isTExact`

### Perverse amplitude of the operations for a morphism with bounded fibre dimension

Node `EtaleDualityAndPerverseSheaves:EDC.5/fibre-dimension-perverse-amplitude` · theorem.

Let f : X → Y be a morphism of separated schemes of finite type over k whose fibres have dimension ≤ d. Then f^* maps pD^{≤0}(Y) into pD^{≤d}(X) and f^! maps pD^{≥0}(Y) into pD^{≥−d}(X); Rf_! maps pD^{≤0}(X) into pD^{≤d}(Y) and Rf_* maps pD^{≥0}(X) into pD^{≥−d}(Y). For f proper, Rf_* = Rf_! has perverse amplitude [−d, d]. Consequently (pH^d Rf_!, pH^{−d} f^!) and (pH^d f^*, pH^{−d} Rf_*) are adjoint pairs of functors between perverse sheaves.

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- Λ is a noetherian commutative ring with nΛ = 0; D^b_c(X, Λ) is the bounded constructible category of EDC.0/constructible-ctf-complexes.
- Fibres of f of dimension ≤ d.

**Proof.**

- f^*: by (4.0.1) and dim(x) ≤ dim f(x) + d (EDC.5/point-dimension-function), ℋ^m(f^*K)_x = ℋ^m(K)_{f(x)} vanishes for m > −dim f(x) ≥ −dim(x) + d (BBD 4.2.4).
- Rf_*: adjoint to f^*[d] up to shift (EDC.5/t-exact-functors (iii)).
- Rf_! and f^!: duality exchanges each pair for self-injective coefficients (EDC.5/perverse-verdier-self-duality); for a general noetherian Λ use instead the stalk formula of Rf_! (compact-support cohomology of fibres vanishing above 2·dim, EDC.0/compact-pushforward-amplitude-and-colimits) with (4.0.1′), and adjunction for f^!.
- The adjunctions on perverse sheaves follow from BBD 1.3.17 (iii) applied to (Rf_![d], f^![−d]) and (f^*[d], Rf_*[−d]).

**Acceptance.**

- For f : 𝔸¹ → Spec k (d = 1) and K = Λ[1]: Rf_*K = RΓ(𝔸¹, Λ)[1] = Λ[1] ∈ pD^{≥−1} and Rf_!K = Λ(−1)[−1] ∈ pD^{≤1}; both bounds are attained.
- For f = P¹ → Spec k (proper, d = 1): Rf_*Λ[1] has perverse cohomology in degrees −1 and 1 only.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/point-dimension-function`, `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functors`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-verdier-self-duality`, `EtaleDualityAndPerverseSheaves:EDC.0/compact-pushforward-amplitude-and-colimits`

**Used by.** `smooth-pullback-perverse-exactness`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.2.2–4.2.4, p.108: For fibres of dimension ≤ d the amplitude of f_!, f^* is ≤ d and of f^!, f_* is ≥ −d; duality and the adjoint criterion reduce everything to f^*, where it follows from (4.0.1) and dim(x) ≤ dim f(x) + d; the resulting adjunctions between perverse sheaves; the proper case.

**Suggested declarations.** `TauCeti.EtaleDuality.perverse_pullback_amplitude`, `TauCeti.EtaleDuality.perverse_proper_pushforward_amplitude`

### Smooth pullback with its dimension shift

Node `EtaleDualityAndPerverseSheaves:EDC.5/smooth-pullback-perverse-exactness` · theorem.

Let f : X → Y be smooth of pure relative dimension d. Then f^![−d] ≅ f^*[d](d), and the functor f^*[d] is t-exact for the middle perverse t-structures, inducing an exact functor f^*[d] : Perv(Y, Λ) → Perv(X, Λ) with left adjoint pH^d Rf_!(d) and right adjoint pH^{−d} Rf_*. If moreover f is surjective with geometrically connected fibres, then f^*[d] : Perv(Y, Λ) → Perv(X, Λ) is fully faithful (BBD 4.2.5); for Λ a field its essential image is closed under subobjects and quotients, every perverse sheaf on X has a largest perverse subsheaf and a largest perverse quotient coming from Y, namely f^*[d] of pH^{−d}Rf_* and of pH^dRf_!(d) (BBD 4.2.6.2), and f^*[d] sends simple objects to simple objects.

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- Λ is a noetherian commutative ring with nΛ = 0; D^b_c(X, Λ) is the bounded constructible category of EDC.0/constructible-ctf-complexes.
- f smooth of pure relative dimension d; for full faithfulness, f surjective with geometrically connected fibres; for the thick-image statement Λ is a field (finite of characteristic ℓ, or E).

**Proof.**

- Smooth purity f^! ≅ f^*(d)[2d] (EDC.2:trace-purity/smooth-purity), so f^*[d] ≅ f^![−d](−d); EDC.5/fibre-dimension-perverse-amplitude gives f^*[d] right t-exact and f^![−d] left t-exact; together t-exact.
- Full faithfulness: f^*RHom(K, L) ≅ RHom(f^*K, f^*L) for smooth f (smooth base change, imported through SF.2); for perverse K, L both RHoms lie in D^{≥0}, and f_*f^*H ≅ H for every sheaf H because f has local sections and geometrically connected fibres (BBD (4.2.5.1)–(4.2.5.3)).
- Thick image: BBD 4.2.6–4.2.6.2: finite length (EDC.5/simple-perverse-sheaves-classification) and preservation of simple objects, the latter by smooth base change for j_!* and irreducibility of pulled-back local systems on connected fibres.

**Acceptance.**

- For pr : 𝔸¹ × Y → Y, pr^*[1] sends IC_Y to IC_{𝔸¹×Y} and is fully faithful on perverse sheaves.
- For the étale double cover f : 𝔾_m → 𝔾_m, z ↦ z² (char k ≠ 2, ℓ ≠ 2; fibres not connected), f^*[1] is not full: for the nontrivial quadratic Kummer sheaf L, Hom(Λ[1], L[1]) = 0 while f^*L ≅ Λ gives Hom(f^*Λ[1], f^*L[1]) ≅ Λ.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/fibre-dimension-perverse-amplitude`, `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functors`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category`, `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves-classification`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`, `EtaleDualityAndPerverseSheaves:EDC.0/derived-tensor-and-internal-hom`, `SchemeAndStackFoundations:SF.2`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.2.4 (smooth case), pp.108–109; Proposition 4.2.5, p.109; 4.2.6, Lemme 4.2.6.1 and Corollaire 4.2.6.2, pp.110–111: For f smooth of relative dimension d, f^*[d] = f^![−d](−d) is t-exact with adjoints pH^df_!(d) and pH^{−d}f_*; with geometrically connected (nonempty) fibres it is fully faithful on perverse sheaves and its image is closed under subquotients, with largest sub and quotient coming from Y.

**Suggested declarations.** `TauCeti.EtaleDuality.smooth_pullback_shift_isTExact`, `TauCeti.EtaleDuality.smooth_pullback_fullyFaithful`

### Perverse Artin vanishing for affine morphisms

Node `EtaleDualityAndPerverseSheaves:EDC.5/perverse-artin-vanishing` · theorem.

Let f : X → Y be an affine morphism of separated schemes of finite type over k. Then Rf_* : D^b_c(X, Λ) → D^b_c(Y, Λ) is right t-exact and Rf_! is left t-exact for the middle perverse t-structures (BBD 4.1.1–4.1.2); pf_* := pH⁰Rf_* is right exact and pf_! := pH⁰Rf_! left exact on perverse sheaves, and p(fg)_* ≅ pf_* pg_* for affine f, g. If f is quasi-finite and affine, Rf_* and Rf_! are t-exact (BBD 4.1.3). If k is separably closed and K ∈ pD^{≤0}(X), then H^m(Z, K) = 0 for m > 0 for every quasi-finite u : Z → X with Z affine (BBD 4.1.5); in particular for X affine and K perverse, H^m(X, K) = 0 for m > 0 and H^m_c(X, K) = 0 for m < 0, and H^m(X, F) = 0 for m > dim X for every constructible sheaf F (SGA 4 XIV 3.2).

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- Λ is a noetherian commutative ring with nΛ = 0; D^b_c(X, Λ) is the bounded constructible category of EDC.0/constructible-ctf-complexes.
- f affine; for Rf_!, f separated of finite type and Λ a finite ring (reduced to self-injective ℤ/ℓ^a-coefficients by restriction of scalars).
- For the cohomology statements k is separably closed (BBD state 4.1.4–4.1.5 for k algebraically closed; the purely inseparable extension k̄/k changes no étale cohomology, by topological invariance).

**Proof.**

- Right t-exactness of Rf_*: a constructible K lies in pD^{≤d} iff each ℋ^m(K)[−m] does, so it suffices that dim Supp R^qf_*F ≤ dim Supp F − q for every constructible F on X: Artin's affine theorem SGA 4 XIV 3.1, requested from SchemeAndStackFoundations:SF.2 (BBD 4.1.1, p.102–103).
- Left t-exactness of Rf_!: Verdier duality D Rf_* ≅ Rf_! D (EDC.1:biduality/duality-exchange-isomorphisms) with EDC.5/perverse-verdier-self-duality (BBD 4.1.2) for self-injective Λ; for a finite ring Λ killed by n, restriction of scalars to ℤ/n = ∏ ℤ/ℓ^a keeps constructibility, commutes with Rf_!, stalks and costalks (EDC.0/coefficient-change) and detects both aisles (BBD 4.0), and each ℤ/ℓ^a is self-injective.
- Quasi-finite affine f: EDC.5/quasi-finite-perverse-exactness supplies the other half (BBD 4.1.3; its proof cites 4.1.7 for the right t-exactness of f_*, meaning 4.1.1: EtaleDualityAndPerverseSheaves/E16).
- Cohomology: apply 4.1.1 to Z → Spec k after the quasi-finite pullback u^*K ∈ pD^{≤0}(Z) (BBD 4.1.5); H_c by duality over a separably closed field.

**Acceptance.**

- For X = 𝔸¹ over k̄ and K = Λ[1]: H^m(𝔸¹, Λ[1]) = 0 for m > 0 (H¹(𝔸¹, Λ) = 0), and H^m_c(𝔸¹, Λ[1]) = 0 for m < 0 (H⁰_c(𝔸¹, Λ) = 0).
- Non-example (affineness): for P¹ over k̄ and K = Λ[1], H¹(P¹, Λ[1]) = H²(P¹, Λ) ≅ Λ(−1) ≠ 0.
- For X = 𝔾_m over k̄, H¹(𝔾_m, Λ) ≅ Λ(−1) ≠ 0 in degree 1 = dim X: the bound m > dim X is sharp.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/quasi-finite-perverse-exactness`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-verdier-self-duality`, `EtaleDualityAndPerverseSheaves:EDC.5/t-exact-functors`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`, `EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`, `SchemeAndStackFoundations:SF.2`

**Used by.** `affine-open-complement-exactness`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Théorème 4.1.1, p.102; Corollaires 4.1.2–4.1.5, p.103: For f affine Rf_* is right t-exact (a reformulation of SGA 4 XIV 3.1) and Rf_! left t-exact; quasi-finite affine f gives t-exact f_! and f_*; over an algebraically closed field the cohomology of an affine variety vanishes above its dimension, and K ∈ pD^{≤0} has no positive cohomology on affine quasi-finite Z.

**Suggested declarations.** `TauCeti.EtaleDuality.affine_pushforward_isRightTExact`, `TauCeti.EtaleDuality.affine_lowerShriek_isLeftTExact`, `TauCeti.EtaleDuality.perverse_artin_vanishing`

### Affine open immersions: exactness and the four-term sequences

Node `EtaleDualityAndPerverseSheaves:EDC.5/affine-open-complement-exactness` · theorem.

Let j : U → X be an affine open immersion (for example the complement of an effective Cartier divisor) with closed complement i : D → X. Then: (i) for a perverse G on U, j_!G and Rj_*G are perverse; (ii) for a perverse F on X, i^*F ∈ pD^{[−1,0]}(D) and i^!F ∈ pD^{[0,1]}(D), and there are exact sequences of perverse sheaves 0 → i_*pH^{−1}i^*F → j_!j^*F → F → i_*pH⁰i^*F → 0 and 0 → i_*pH⁰i^!F → F → Rj_*j^*F → i_*pH¹i^!F → 0; (iii) for a perverse G on U there is an exact sequence 0 → i_*pH^{−1}(i^*Rj_*G) → j_!G → Rj_*G → i_*pH⁰(i^*Rj_*G) → 0, and i^*j_!*G[−1] and i^!j_!*G[1] are perverse with i^*j_!*G[−1] ≅ pH^{−1}(i^*Rj_*G) ≅ pH⁰(i^!j_!G) and i^!j_!*G[1] ≅ pH⁰(i^*Rj_*G) ≅ pH¹(i^!j_!G) (BBD 4.1.10–4.1.12).

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- Λ is a noetherian commutative ring with nΛ = 0; D^b_c(X, Λ) is the bounded constructible category of EDC.0/constructible-ctf-complexes.
- j an affine open immersion; Λ self-injective where the left t-exactness of j_! is deduced by duality.

**Proof.**

- (i) is EDC.5/perverse-artin-vanishing for the quasi-finite affine j (BBD 4.1.3).
- (ii): the perverse cohomology sequences of the triangles j_!j^*F → F → i_*i^*F and i_*i^!F → F → Rj_*j^*F, with j_!j^*F and Rj_*j^*F perverse by (i), force the stated amplitudes (BBD 4.1.10).
- (iii): (ii) for F = Rj_*G gives the sequence (BBD (4.1.11.1)); comparing with (ii) for F = j_!G through i^*Rj_*G ≅ i^!j_!G[1] identifies the end terms, and j_!*G is the image of j_!G → Rj_*G (EDC.5/perverse-intermediate-extension), whence the descriptions of i^*j_!*G[−1] and i^!j_!*G[1] (BBD 4.1.12).

**Acceptance.**

- For j : 𝔾_m → 𝔸¹ over k̄ and G = Λ[1]: pH^{−1}(i^*Rj_*G) ≅ Λ_0 and pH⁰(i^*Rj_*G) ≅ Λ_0(−1), the sequence 0 → i_*Λ_0 → j_!Λ[1] → Rj_*Λ[1] → i_*Λ_0(−1) → 0 is exact, j_!*G ≅ Λ_{𝔸¹}[1], i^*j_!*G[−1] ≅ Λ_0 and i^!j_!*G[1] ≅ Λ_0(−1).
- Non-example: for the non-affine complement j of a closed point x in a smooth surface S, Rj_*Λ[2] is not perverse: R³j_*Λ ≠ 0 at x (from H⁴_x(S, Λ) ≅ Λ(−2)), giving cohomology in degree 1 at a point of dimension 0.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/perverse-artin-vanishing`, `EtaleDualityAndPerverseSheaves:EDC.5/open-closed-perverse-recollement`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Corollaire 4.1.10, (4.1.10.1)–(4.1.10.2); 4.1.11, (4.1.11.1); Corollaire 4.1.12, (4.1.12.1)–(4.1.12.2), p.106: For an affine open immersion j with closed complement, j_! and j_* preserve perversity, i^*F and i^!F have perverse amplitude [−1,0] and [0,1] with four-term exact sequences, and i^*j_!*G[−1], i^!j_!*G[1] are perverse and computed by perverse cohomology of i^*j_*G and i^!j_!G.

**Suggested declarations.** `TauCeti.EtaleDuality.affine_open_lowerShriek_perverse`, `TauCeti.EtaleDuality.affine_open_restriction_amplitude`

### External tensor product is t-exact

Node `EtaleDualityAndPerverseSheaves:EDC.5/external-product-t-exact` · theorem.

For X₁, X₂ separated of finite type over k and Λ a field (finite of characteristic ℓ, or E under the ℓ-adic hypotheses), the external tensor product K ⊠ L := pr₁^*K ⊗ pr₂^*L : D^b_c(X₁, Λ) × D^b_c(X₂, Λ) → D^b_c(X₁ ×_k X₂, Λ) is t-exact in each variable for the middle perverse t-structures; in particular the external product of perverse sheaves is perverse and IC_{X₁}(L₁) ⊠ IC_{X₂}(L₂) ≅ IC_{X₁×X₂}(L₁ ⊠ L₂). It commutes with Rf_*, Rf_!, f^*, f^! for products of morphisms and with Verdier duality (BBD 4.2.7).

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- Λ a field; the statement is false for ℤ_ℓ or ℤ/ℓ² coefficients without flatness, since ⊗ is not exact (BBD 4.0 (d)).

**Proof.**

- Künneth formulas for ⊠ with the six operations, and D(K ⊠ L) ≅ DK ⊠ DL: imported (SGA 4 XVII 5.4.3, through SF.2 as requested by EDC.0) and BBD 4.2.7.
- Choose stratifications T₁, T₂ adapted to K and L (EDC.5/middle-perverse-t-structure stratum criterion); on S₁ × S₂, i^*(K ⊠ L) = i^*K ⊠ i^*L and i^!(K ⊠ L) = i^!K ⊠ i^!L, and the cutoff −dim(S₁ × S₂) = −dim S₁ − dim S₂ is additive; over a field, ℋ of a tensor product of complexes with lisse cohomology is the tensor product of cohomologies (BBD 4.2.8, which stresses the linearity of the perversity function).
- IC: the external product of j_!* is j_!* of the external product by the strict support conditions and EDC.5/perverse-intermediate-extension.

**Acceptance.**

- Λ_{C₁}[1] ⊠ Λ_{C₂}[1] ≅ Λ_{C₁×C₂}[2] for smooth curves C₁, C₂.
- For Λ = ℤ/ℓ²: (ℤ/ℓ)_{pt} ⊠ (ℤ/ℓ)_{pt} = ℤ/ℓ ⊗^L ℤ/ℓ has cohomology in degrees −1 and 0, so it is not perverse.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-verdier-self-duality`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`, `SchemeAndStackFoundations:SF.2`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.2.7, pp.111–112; Proposition 4.2.8 and its proof, p.112: The external tensor product commutes with the usual operations and with duality; for a field of coefficients it is t-exact, checked stratum by stratum on product stratifications, the perversity being linear in dimension.

**Suggested declarations.** `TauCeti.EtaleDuality.externalProduct_isTExact`

## EDC.5d — Intermediate extension and intersection complexes

j_!* is the image of pj_! → pj_*, characterised by strict boundary bounds and by the absence of boundary sub- and quotient objects. Deligne's truncation formula holds only under its local-constancy hypothesis, which is part of the statement. IC_X(L) = j_!*(L[d]) restricts to L[d] on the smooth open, does not depend on it, and gives all simple perverse sheaves over a field.

### Intermediate extension of perverse sheaves

Node `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension` · construction. Planet: Intermediate extension.

Let j : U → X be a locally closed immersion of separated schemes of finite type over k, factored as an open immersion j′ : U → Ū into its closure followed by the closed immersion ī : Ū → X, and put Z := Ū ∖ U. The intermediate extension is j_!* := ī_* ∘ j′_!* : Perv(U, Λ) → Perv(X, Λ), where j′_!*A is the image of pH⁰(j′_!A) → pH⁰(Rj′_*A) (EDC.5/recollement-intermediate-extension for the perverse recollement of EDC.5/open-closed-perverse-recollement). For A perverse on U, j′_!*A is the unique perverse sheaf P on Ū with P|_U ≅ A, ℋ^m(i_x^*P) = 0 for m ≥ −dim(x) and ℋ^m(i_x^!P) = 0 for m ≤ −dim(x) at every point x of Z (BBD 2.1.9 in the pointwise form of 2.2.12); equivalently the unique perverse extension with no nonzero perverse subobject or quotient supported on Z. It is fully faithful, sends simple objects to simple objects, is independent of the factorisation, and is transitive: (j₂ ∘ j₁)_!* ≅ j₂_!* ∘ j₁_!* (BBD (2.1.7.1)). If i : Z → Ū is the closed complement, i^*j′_!*A ∈ pD^{≤−1}(Z) and i^!j′_!*A ∈ pD^{≥1}(Z).

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- Λ is a noetherian commutative ring with nΛ = 0; D^b_c(X, Λ) is the bounded constructible category of EDC.0/constructible-ctf-complexes.
- j a locally closed immersion; A perverse on U.

**Construction and proof.**

- Open dense case: EDC.5/recollement-intermediate-extension applied to the glued perverse t-structure (EDC.5/open-closed-perverse-recollement), giving image, characterisations, full faithfulness and simplicity.
- Pointwise strict bounds: the conditions i^*P ∈ pD^{≤−1}(Z), i^!P ∈ pD^{≥1}(Z) of BBD 1.4.24 translate through the pointwise description of the perverse t-structure of Z (EDC.5/middle-perverse-t-structure; dim(x) is the same in Z and in X) into the strict stalk and costalk vanishing (BBD 2.1.9).
- Transitivity (BBD (2.1.7.1)): apply pj_!, pj_!*, pj_* to the maps pk_! → pk_!* → pk_* and compose; independence of the factorisation follows from the characterisation.
- Closed pushforward ī_* is t-exact and fully faithful on perverse sheaves (EDC.5/quasi-finite-perverse-exactness).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.intermediateExtension` | constructor | j_!* : Perv(U, Λ) ⥤ Perv(X, Λ) for a locally closed immersion j : U ⟶ X. |
| `TauCeti.EtaleDuality.intermediateExtension_eq_image` | characterisation | For j open, j_!*A ≅ image(pH⁰(j_!A) ⟶ pH⁰(Rj_*A)) in Perv(X, Λ). |
| `TauCeti.EtaleDuality.restrict_intermediateExtension` | simp | j^*(j_!*A) ≅ A. |
| `TauCeti.EtaleDuality.intermediateExtension_stalk_bound` | characterisation | For a boundary point x of Ū ∖ U, ℋ^m(i_x^*j_!*A) = 0 for m ≥ −dim(x). |
| `TauCeti.EtaleDuality.intermediateExtension_costalk_bound` | characterisation | For a boundary point x of Ū ∖ U, ℋ^m(i_x^!j_!*A) = 0 for m ≤ −dim(x). |
| `TauCeti.EtaleDuality.intermediateExtension_unique` | universal-property | A perverse extension of A satisfying both strict boundary bounds is uniquely isomorphic to j_!*A. |
| `TauCeti.EtaleDuality.intermediateExtension_no_sub_quotient` | characterisation | j_!*A has no nonzero perverse subobject or quotient supported on Ū ∖ U. |
| `TauCeti.EtaleDuality.intermediateExtension_fullyFaithful` | other | j_!* is fully faithful. |
| `TauCeti.EtaleDuality.intermediateExtension_comp` | functoriality | (j₂ ∘ j₁)_!* ≅ j₂_!* ∘ j₁_!*. |
| `TauCeti.EtaleDuality.intermediateExtension_simple` | other | j_!* sends simple perverse sheaves to simple perverse sheaves. |
| `TauCeti.EtaleDuality.intermediateExtension_etale` | functoriality | For u : V → X étale and j_V the base change of j, u^* ∘ j_!* ≅ j_{V!*} ∘ u^*. |

**Unit tests.**

- `TauCeti.EtaleDuality.intermediateExtension_iso` (degenerate): If j is an isomorphism, j_!* ≅ the identity functor.
- `TauCeti.EtaleDuality.intermediateExtension_affineLine_constant` (computation): For j : 𝔾_m → 𝔸¹ and Λ a field, j_!*(Λ[1]) ≅ Λ_{𝔸¹}[1].
- `TauCeti.EtaleDuality.intermediateExtension_kummer` (computation): For j : 𝔾_m → 𝔸¹ over k̄ and L a nontrivial Kummer local system of rank one, j_!*(L[1]) ≅ j_!L[1] ≅ Rj_*L[1].
- `TauCeti.EtaleDuality.intermediateExtension_closed_compat` (compatibility): For a closed immersion ī, ī_!* = ī_* on perverse sheaves (the pushforward of EDC.5/quasi-finite-perverse-exactness).
- `TauCeti.EtaleDuality.not_intermediateExtension_eq_lowerShriek` (non-example): For j : 𝔾_m → 𝔸¹ and Λ a field, pH⁰(j_!Λ[1]) = j_!Λ[1] is not isomorphic to j_!*(Λ[1]): it has the subobject i_*Λ_0.
- `TauCeti.EtaleDuality.not_unrestricted_standard_truncation` (non-example): For U = 𝔾_m ⊂ 𝔸¹ and A the skyscraper Λ at 1 in degree 0, j_!*A ≅ A while τ_{≤−1}Rj_*A = 0: the truncation formula of EDC.5/deligne-truncation-formula needs its degree hypothesis.

**Acceptance.**

- For j : 𝔾_m → 𝔸¹ over k̄ and L a nontrivial rank-one Kummer local system, j_!L[1] ≅ j_!*(L[1]) ≅ Rj_*L[1].
- For j : 𝔾_m → 𝔸¹ and Λ[1], j_!*(Λ[1]) ≅ Λ_{𝔸¹}[1], while j_!(Λ[1]) and Rj_*(Λ[1]) are different perverse sheaves.

**Uses.**

- BBD 2.1.11 and 4.3.1: intersection complexes and the simple perverse sheaves are intermediate extensions.
- HodgeStructuresPartII:H.5: H¹ of the intermediate extension across a normal-crossings boundary.
- LefschetzPencilsAndVanishingCycles:LPV.6: exchange of nearby cycles with j_!* under t-exactness.
- FunctionFieldArithmeticPartII:GC.3: symmetric powers of a local system as a shifted middle extension.
- GeometricSatakeAndFusion:GS1: standard, costandard and IC objects of Schubert cells.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/recollement-intermediate-extension`, `EtaleDualityAndPerverseSheaves:EDC.5/open-closed-perverse-recollement`, `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/quasi-finite-perverse-exactness`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category`

**Used by.** `perverse-verdier-self-duality`, `smooth-pullback-perverse-exactness`, `affine-open-complement-exactness`, `external-product-t-exact`, `deligne-truncation-formula`, `intermediate-extension-low-degree-cohomology`, `intersection-complex-of-local-system`, `simple-perverse-sheaves-classification`, `small-pushforward-intersection-complex`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 1.4.22–1.4.25, pp.54–55; 2.1.7, (2.1.7.1), pp.58–59: j_!*A is the image of pj_!A → pj_*A; for locally closed unions of strata the transitivity p(jk)_!* = pj_!* pk_!* holds.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Proposition 2.1.9, p.59; 2.2.12, pp.70–71: j_!*B is the unique extension with stalks vanishing in degrees ≥ p(S) and costalks vanishing in degrees ≤ p(S) on boundary strata; in the étale setting these become pointwise conditions with p = −dim(x).

**Suggested declarations.** `TauCeti.EtaleDuality.intermediateExtension`

### Deligne's truncation formula for the intermediate extension

Node `EtaleDualityAndPerverseSheaves:EDC.5/deligne-truncation-formula` · theorem.

Let j : U → X be an open immersion whose closed complement F is smooth over k (after passing to k^perf) of pure dimension d, and A perverse on U. If ℋ^m(Rj_*A)|_F is locally constant for every m ≥ −d, then j_!*A ≅ τ_{≤−d−1}Rj_*A for the natural truncation (BBD 2.2.4.1); if the local constancy holds for m ≥ −d − 1 (resp. m ≥ −d + 1) then pH⁰(j_!A) ≅ τ_{≤−d−2}Rj_*A (resp. pH⁰(Rj_*A) ≅ τ_{≤−d}Rj_*A). More generally, for a filtration X = U_N ⊃ … ⊃ U_k = U by opens such that each U_{m+1} ∖ U_m is smooth of pure dimension −m − 1 and the hypothesis holds at each step, j_!*A ≅ τ_{≤ N−1}Rj_{N*} ∘ … ∘ τ_{≤ k}Rj_{k+1,*}A, with j_{m+1} : U_m → U_{m+1} (BBD 2.1.11).

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- Λ is a noetherian commutative ring with nΛ = 0; D^b_c(X, Λ) is the bounded constructible category of EDC.0/constructible-ctf-complexes.
- The local constancy hypothesis on ℋ^m(Rj_*A)|_F is part of the statement; it fails in general (wild ramification), and without it the natural truncation does not compute j_!* in the étale setting.

**Proof.**

- By EDC.5/recollement-intermediate-extension (b) (BBD 1.4.23), j_!*A ≅ τ^F_{≤−1}Rj_*A for the perverse truncation relative to F (BBD (2.2.3.1)).
- On F, smooth of pure dimension d, complexes with locally constant cohomology sheaves have the perverse t-structure equal to the natural one shifted by d (EDC.5/shifted-local-systems-perverse), so for the part of Rj_*A in degrees ≥ −d the relative perverse truncation is τ_{≤−d−1} (BBD 2.2.4 with the stratum criterion 2.2.2 (iii)).
- Iterate along the filtration using transitivity (EDC.5/perverse-intermediate-extension), as in BBD 2.1.11.

**Acceptance.**

- For j : 𝔾_m → 𝔸¹ and Λ[1] (d = 0): τ_{≤−1}Rj_*Λ[1] = (j_*Λ)[1] = Λ_{𝔸¹}[1] = j_!*Λ[1].
- For a smooth curve C, an open dense j : U → C and L locally constant on U (the hypothesis holds at the finitely many points of F), j_!*(L[1]) ≅ (j_*L)[1] with j_* the underived direct image.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension`, `EtaleDualityAndPerverseSheaves:EDC.5/recollement-intermediate-extension`, `EtaleDualityAndPerverseSheaves:EDC.5/shifted-local-systems-perverse`, `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`

**Used by.** `intermediate-extension-low-degree-cohomology`, `intersection-complex-of-local-system`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 2.2.3, (2.2.3.1), and Proposition 2.2.4, (2.2.4.1)–(2.2.4.3), p.68: For F smooth of dimension d with ℋ^ij_*A locally constant on F for i ≥ p(2d) = −d, j_!*A is the natural truncation τ_{≤−d−1}j_*A; similar formulas for pj_! and pj_* under the shifted hypotheses.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 2.1.10, p.59; Proposition 2.1.11, p.60: For a perversity decreasing under specialization, j_!*A is the iterated composite of direct images and natural truncations along the filtration by unions of strata of bounded perversity.

**Suggested declarations.** `TauCeti.EtaleDuality.intermediateExtension_eq_truncation`

### Low-degree cohomology of an intermediate extension across a boundary of high codimension

Node `EtaleDualityAndPerverseSheaves:EDC.5/intermediate-extension-low-degree-cohomology` · theorem.

Let j : U → X be an open immersion whose closed complement Z has codimension ≥ c in every component (dim Z ≤ d − c with X of pure dimension d), A perverse on U and P := j_!*A. Then the cone C of the natural map P → Rj_*A lies in i_*pD^{≥0}(Z) ⊆ i_*D^{≥ −dim Z}, hence in the natural D^{≥ c−d}; consequently, for every étale V → X, H^m(V, P) → H^m(V ∩ U, A) is an isomorphism for m ≤ c − d − 1 and injective for m = c − d. For A = L[d] with L a sheaf on U: H^q(X, P[−d]) ≅ H^q(U, L) for q ≤ c − 1 and H^c(X, P[−d]) → H^c(U, L) is injective. In particular, for X̄ smooth of pure dimension d, D ⊂ X̄ a strict normal crossings divisor with singular locus D_sing (codimension ≥ 2), X := X̄ ∖ D, a : X → U := X̄ ∖ D_sing, b : U → X̄ and F locally constant on X such that the ℋ^mRa_*F are locally constant along D ∖ D_sing, one has b_!*((a_*F)[d]) = j_!*(F[d]) and H¹(X̄, j_!*(F[d])[−d]) ≅ H¹(U, a_*F).

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- Λ is a noetherian commutative ring with nΛ = 0; D^b_c(X, Λ) is the bounded constructible category of EDC.0/constructible-ctf-complexes.
- codim (X ∖ U) ≥ c in each component of X, X of pure dimension d.

**Proof.**

- The recollement triangle i_*i^!P → P → Rj_*j^*P gives C ≅ i_*i^!P[1]; i^!P ∈ pD^{≥1}(Z) by the strict costalk bound (EDC.5/perverse-intermediate-extension), so C ∈ i_*pD^{≥0}(Z).
- pD^{≥0}(Z) ⊆ D^{≥−dim Z} (EDC.5/middle-perverse-t-structure bounds), and −dim Z ≥ c − d.
- Long exact cohomology sequence of P → Rj_*A → C on V.
- SNC case: a_!*(F[d]) = (a_*F)[d] by EDC.5/deligne-truncation-formula (D ∖ D_sing is smooth of dimension d − 1, under the stated local constancy), transitivity gives j_!* = b_!* a_!*, and the codimension-two case of the first part applied to b gives the H¹ isomorphism.

**Acceptance.**

- For X = 𝔸², U = 𝔸² ∖ {0}, A = Λ[2]: P = Λ_{𝔸²}[2], and H^q(𝔸², Λ) → H^q(U, Λ) is an isomorphism for q ≤ 1 and injective for q = 2 (here c = 2), while H³(U, Λ) ≅ Λ(−2) ≠ 0 = H³(𝔸², Λ).
- For the nodal cubic X with node s, normalisation ν : P¹ → X and U = X ∖ {s} (c = 1, d = 1): IC_X[−1] = ν_*Λ, so H⁰(X, IC_X[−1]) = H⁰(P¹, Λ) ≅ Λ ≅ H⁰(U, Λ) (degree c − 1), and H¹(X, IC_X[−1]) = H¹(P¹, Λ) = 0 injects into H¹(U, Λ) ≅ Λ(−1) (degree c).

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension`, `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/deligne-truncation-formula`, `EtaleDualityAndPerverseSheaves:EDC.5/open-closed-perverse-recollement`, `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/local-cohomology-identification`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Corollaire 1.4.24, p.55; (2.1.2.1), p.57: j_!*B is characterised by i^*X ∈ D_F^{≤−1} and i^!X ∈ D_F^{≥1}; perverse aisles are squeezed between natural aisles.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Proposition 2.2.4, p.68: The natural-truncation description of j_!* across a smooth boundary with locally constant direct images.

**Suggested declarations.** `TauCeti.EtaleDuality.intermediateExtension_cohomology_iso`

### The intersection complex of a local system

Node `EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex-of-local-system` · definition. Planet: Intersection complex.

Let X be a separated scheme of finite type over k, irreducible of dimension d, U ⊂ X a dense open subscheme smooth over k (one exists when k is perfect; in general pass to k^perf by EDC.5/middle-perverse-t-structure), j : U → X the inclusion and L a locally constant constructible sheaf of Λ-modules on U. The intersection complex is IC_X(L) := j_!*(L[d]) ∈ Perv(X, Λ) (EDC.5/perverse-intermediate-extension, EDC.5/shifted-local-systems-perverse), and IC_X := IC_X(Λ). It does not depend on U: for U′ ⊂ U dense open, IC_X(L) ≅ IC_X(L|_{U′}). Its restriction to U is L[d] (no Tate twist and no shift by 2d). If X is smooth, IC_X(L) = L[d]; if dim X = 1, IC_X(L) ≅ (j_*L)[1]; if ν : X′ → X is finite and an isomorphism over U with X′ smooth of pure dimension d and L′ locally constant on X′ extending L, then IC_X(L) ≅ ν_*(L′[d]); IC_X(L) is simple if L is irreducible and Λ is a field. No half-twist normalisation is built into the definition.

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- Λ is a noetherian commutative ring with nΛ = 0; D^b_c(X, Λ) is the bounded constructible category of EDC.0/constructible-ctf-complexes.
- X irreducible of dimension d; U dense open and smooth over k; L locally constant constructible on U.

**Construction and proof.**

- Definition through EDC.5/perverse-intermediate-extension applied to the perverse sheaf L[d] on U.
- Independence of U: transitivity (j_U ∘ j′)_!* = j_{U!*} ∘ j′_!* and j′_!*(L|_{U′}[d]) = L[d] because a shifted local system on smooth U satisfies the strict boundary bounds on U ∖ U′ by purity (BBD Lemme 4.3.2).
- Curves: EDC.5/deligne-truncation-formula with a zero-dimensional boundary.
- Finite birational ν: ν_* is t-exact (EDC.5/quasi-finite-perverse-exactness) and finite fibres over the boundary give the strict stalk and costalk bounds (proper base change for finite maps), so ν_*(L′[d]) is the unique extension.
- Simplicity for irreducible L over a field: EDC.5/simple-perverse-sheaves-classification (BBD 4.3.3).

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.intersectionComplex` | constructor | IC_X(L) := j_!*(L[d]) ∈ Perv(X, Λ) for j : U ⟶ X dense open smooth and L locally constant on U. |
| `TauCeti.EtaleDuality.intersectionComplex_restrict` | simp | IC_X(L)∣_U ≅ L[d]. |
| `TauCeti.EtaleDuality.intersectionComplex_independent` | characterisation | For U′ ⊆ U dense open, IC_X(L) ≅ IC_X(L∣_{U′}). |
| `TauCeti.EtaleDuality.intersectionComplex_of_smooth` | simp | If X is smooth (U = X), IC_X(L) ≅ L[d]. |
| `TauCeti.EtaleDuality.intersectionComplex_curve` | characterisation | If d = 1, IC_X(L) ≅ (j_*L)[1] with j_* underived. |
| `TauCeti.EtaleDuality.intersectionComplex_finite_birational` | characterisation | For ν : X′ → X finite, an isomorphism over U, X′ smooth and L′ locally constant on X′ extending L: IC_X(L) ≅ ν_*(L′[d]). |
| `TauCeti.EtaleDuality.intersectionComplex_simple` | other | If Λ is a field and L is irreducible, IC_X(L) is simple. |
| `TauCeti.EtaleDuality.intersectionComplex_verdierDual` | relation | For self-injective Λ: D_X IC_X(L) ≅ IC_X(L^∨(d)) (EDC.5/perverse-verdier-self-duality). |

**Unit tests.**

- `TauCeti.EtaleDuality.intersectionComplex_smoothCurve` (computation): For a smooth curve C, IC_C ≅ Λ_C[1].
- `TauCeti.EtaleDuality.intersectionComplex_nodalCurve` (computation): For a nodal cubic X with normalisation ν : P¹ → X, IC_X ≅ ν_*Λ_{P¹}[1], with stalk Λ² in degree −1 at the node.
- `TauCeti.EtaleDuality.intersectionComplex_cuspidalCurve` (computation): For a cuspidal cubic X, IC_X ≅ Λ_X[1] (the normalisation is a universal homeomorphism).
- `TauCeti.EtaleDuality.intersectionComplex_point` (degenerate): For X = Spec k̄ (d = 0), IC_X(L) = L in degree 0.
- `TauCeti.EtaleDuality.intersectionComplex_restrict_compat` (compatibility): IC_X|_U ≅ Λ_U[d], not Λ_U(d)[2d] (the dualizing complex): the IC normalisation is the perverse shift.
- `TauCeti.EtaleDuality.not_intersectionComplex_nodal_constant` (non-example): For a nodal cubic X with node s, Λ_X[1] is perverse but not IC_X: 0 → i_{s*}Λ → Λ_X[1] → ν_*Λ_{P¹}[1] → 0 exhibits a nonzero subobject supported at the node.

**Acceptance.**

- IC of a smooth curve is Λ[1]; IC of a nodal cubic is ν_*Λ_{P¹}[1], whose stalk at the node is Λ² in degree −1.
- IC of a cuspidal cubic X is Λ_X[1], since its normalisation is a universal homeomorphism.

**Uses.**

- BBD 4.3.1: the simple perverse sheaves are i_{V*}IC_{V̄}(L).
- EtaleDualityAndPerverseSheaves:EDC.7: purity of IC_X(L) for pure L and the decomposition theorem.
- GeometricSatakeAndFusion:GS0: IC sheaves of Schubert varieties and the Mirković–Vilonen weight cycles.
- GlobalShtukasAndFunctionFieldLanglands:GS.1: Satake sheaves as IC complexes of bounded strata.
- Yun–Zhang II, §7.1: IC complexes of finite-type schemes with ℓ-adic coefficients.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension`, `EtaleDualityAndPerverseSheaves:EDC.5/shifted-local-systems-perverse`, `EtaleDualityAndPerverseSheaves:EDC.5/deligne-truncation-formula`, `EtaleDualityAndPerverseSheaves:EDC.5/quasi-finite-perverse-exactness`, `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`

**Used by.** `perverse-verdier-self-duality`, `simple-perverse-sheaves-classification`, `small-pushforward-intersection-complex`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Lemme 4.3.2 and Lemme 4.3.3, pp.112–113; Théorème 4.3.1 (ii), p.112: On smooth irreducible X a lisse L[dim X] is its own intermediate extension from any dense open, is simple when L is irreducible, and the simple perverse sheaves are the intermediate extensions of such L[dim V] from smooth irreducible locally closed V.

**Suggested declarations.** `TauCeti.EtaleDuality.intersectionComplex`

### Finite length and the simple perverse sheaves

Node `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves-classification` · theorem.

Let Λ be a field (finite of characteristic ℓ ≠ char k, or E/ℚ_ℓ finite under the ℓ-adic hypotheses, or its algebraic closure). Every perverse sheaf on X has finite length in Perv(X, Λ): the category is artinian and noetherian. The simple perverse sheaves are exactly the objects i_{V̄*}IC_{V̄}(L) = j_{V!*}(L[dim V]), where j_V : V → X is the inclusion of an irreducible locally closed subscheme smooth over k (after passage to k^perf) and L is an irreducible locally constant sheaf of Λ-modules on V; two such are isomorphic iff the closures of the V agree and the L agree on a common dense open. For Λ = O/λ^m every perverse sheaf has finite length (its simple constituents are those of the λ-adic graded pieces, which are O/λ-perverse); for Λ = O the category is only noetherian and its dual p⁺-category only artinian.

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- Λ a field for the classification; X separated of finite type over k.

**Proof.**

- Reduce to k perfect by topological invariance (EDC.5/middle-perverse-t-structure).
- Simplicity of L[dim V] on smooth irreducible V for irreducible L: a perverse subobject is M[dim V] on a dense open for a lisse subsheaf M; irreducibility persists on dense opens because π₁(U) → π₁(V) is surjective for V normal irreducible (Stacks Tag 0BQI, requested from SF.2); then the no-sub/quotient characterisation of j_!* (BBD 4.3.3, citing 1.4.25: EtaleDualityAndPerverseSheaves/E17).
- Simplicity of i_{V̄*}j_!*: twice EDC.5/recollement-intermediate-extension (d) (BBD 4.3.4).
- Finite length by noetherian induction: a perverse F is L[dim U] on a smooth irreducible dense open U of its support with L lisse of finite length, so the four-term sequences of EDC.5/open-closed-perverse-recollement reduce to intermediate extensions of the constituents of L and to perverse sheaves on smaller supports (BBD 4.3.4); the classification is EDC.5/recollement-intermediate-extension (e).
- O/λ^m: filter by λ^iF; O: BBD 4.0 (b) and Juteau §1.1.

**Acceptance.**

- On 𝔸¹ over k̄ with Λ a field, Rj_*Λ[1] for j : 𝔾_m → 𝔸¹ has length 2, with constituents Λ_{𝔸¹}[1] and i_*Λ_0(−1).
- Over Λ = ℤ_ℓ on a point, ℤ_ℓ has the infinite descending chain ℤ_ℓ ⊃ ℓℤ_ℓ ⊃ …, so Perv(pt, ℤ_ℓ) is not artinian.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension`, `EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex-of-local-system`, `EtaleDualityAndPerverseSheaves:EDC.5/recollement-intermediate-extension`, `EtaleDualityAndPerverseSheaves:EDC.5/open-closed-perverse-recollement`, `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`, `mathlib:CategoryTheory.Simple`, `mathlib:CategoryTheory.IsArtinianObject`, `mathlib:CategoryTheory.IsNoetherianObject`, `SchemeAndStackFoundations:SF.2`

**Used by.** `smooth-pullback-perverse-exactness`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Théorème 4.3.1, Lemmes 4.3.2–4.3.3, 4.3.4, pp.112–113: The category of perverse sheaves is artinian and noetherian; j_!*(L[dim V]) for smooth irreducible V and irreducible lisse L is simple and all simple objects arise so; the proof reduces to a perfect field.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.0 (b), p.101: Over ℤ_ℓ the theorem fails already on a point: p-perverse sheaves are only noetherian and p⁺-perverse sheaves only artinian.
- [The Stacks project](https://stacks.math.columbia.edu), Tag 0BQI (Lemma 58.10.7): For X irreducible and geometrically unibranch and U nonempty open, π₁(U) → π₁(X) is surjective.

**Suggested declarations.** `TauCeti.EtaleDuality.perverseSheaf_finiteLength`, `TauCeti.EtaleDuality.perverseSheaf_simple_iff`

## EDC.5e — Duality and integral coefficients

Verdier duality preserves the perverse heart exactly for self-injective (finite field, O/λ^m, ℤ/ℓ^m) and rational coefficients; the IC duality formula carries the twist (d) and the dual local system. Over O it exchanges p with the tilt p⁺, and integral duality does not preserve Perv(X, O).

### Verdier duality preserves perverse sheaves

Node `EtaleDualityAndPerverseSheaves:EDC.5/perverse-verdier-self-duality` · theorem. Planet: Verdier self-duality of perverse sheaves.

Let Λ be self-injective (a finite field of characteristic ℓ ≠ char k, O/λ^m or ℤ/ℓ^m), or Λ = E/ℚ_ℓ finite under the ℓ-adic hypotheses. Verdier duality D_X = RHom(−, K_X) (EDC.1:adjoint/verdier-dual) maps pD^{≤0}(X, Λ) onto pD^{≥0}(X, Λ) and pD^{≥0} onto pD^{≤0}. Hence D_X restricts to an anti-equivalence Perv(X, Λ)^op ≃ Perv(X, Λ) with D_X² ≅ id, pH^m(D_X K) ≅ D_X pH^{−m}(K), D_X ∘ pj_! ≅ pj_* ∘ D_U and D_X ∘ j_!* ≅ j_!* ∘ D_U for an open or locally closed j. For X irreducible of dimension d with a dense open U smooth over k and L locally constant constructible on U, D_X IC_X(L) ≅ IC_X(L^∨(d)) with L^∨ := Hom(L, Λ). No isomorphism IC_X(L) ≅ D_X IC_X(L) is asserted without a given perfect pairing L ⊗ L → Λ(−d). For Λ = O_E (not self-injective) duality exchanges the middle perversity p with p⁺ instead (EDC.5/integral-dual-perversity).

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- For duality statements Λ is moreover self-injective (a finite field of characteristic ℓ ≠ char k, or O_E/λ^m, or ℤ/ℓ^m; EDC.1:biduality/self-injective-coefficients), the setting of EDC.1:biduality/constructible-biduality.
- For ℓ-adic coefficients (E/ℚ_ℓ finite, ring of integers O, uniformizer λ, ℓ ≠ char k) the base field satisfies BBD's finiteness condition: H^i(Gal(k^sep/k′), ℤ/ℓ) is finite for every finite k′/k and every i (BBD 2.2.14 and 4.0; for example k finite or separably closed). The categories D^b_c(X, O) and D^b_c(X, E) and their operations are the ℓ-adic formalism requested from SchemeAndStackFoundations:SF.2. (only for the E-coefficient case).

**Proof.**

- Biduality and the exchange formulas D i^* ≅ i^! D, D Rj_* ≅ j_! D (EDC.1:biduality/constructible-biduality, EDC.1:biduality/duality-exchange-isomorphisms; for E the ℓ-adic versions requested from SF.2).
- On a smooth stratum S of dimension e, for a complex M with locally constant cohomology, D_S M = RHom(M, Λ(e)[2e]) has ℋ^m(D_S M) = Hom(ℋ^{−m−2e}(M), Λ)(e), because Hom(−, Λ) is exact on finitely generated Λ-modules (self-injectivity, EDC.1:biduality/self-injective-coefficients) and K_S ≅ Λ(e)[2e] (EDC.1:biduality/dualizing-complex-of-smooth-scheme). So D_S exchanges the shifted natural aisles D^{≤−e} and D^{≥−e}.
- Apply the stratum criterion of EDC.5/middle-perverse-t-structure to K and D_X K with a stratification adapted to both: i_S^* D_X K ≅ D_S i_S^! K. This is BBD 2.2.8 (field coefficients) and 4.0.
- j_!*: D exchanges pj_! and pj_* and is exact on hearts, so it maps the image of pj_! → pj_* to the image of the dual map. IC: D_U(L[d]) ≅ L^∨(d)[d] on smooth U, then apply j_!*.

**Acceptance.**

- D_X(Λ_C[1]) ≅ Λ_C(1)[1] on a smooth curve C.
- For Λ = O = ℤ_ℓ on X = Spec Ω: D(ℤ/ℓ[0]) = ℤ/ℓ[−1], which is not perverse although ℤ/ℓ[0] is — integral coefficients are excluded.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension`, `EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex-of-local-system`, `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/self-injective-coefficients`, `SchemeAndStackFoundations:SF.2`

**Used by.** `fibre-dimension-perverse-amplitude`, `perverse-artin-vanishing`, `external-product-t-exact`, `semismall-pushforward-perversity`, `small-pushforward-intersection-complex`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 2.2.8, p.69; 2.2.11, p.70: For a field of coefficients Verdier duality exchanges D^{≤p} with D^{≥p*} and p-perverse with p*-perverse sheaves.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.0, p.102: The middle perversity being self-dual, Verdier duality exchanges pD^{≤0} and pD^{≥0} and induces an anti-autoequivalence of perverse sheaves.
- [Correspondance de Springer modulaire et matrices de décomposition (Modular Springer correspondence and decomposition matrices)](https://arxiv.org/pdf/0901.3671v1), §1.1, (1.2)–(1.9), pp.38–39 (arXiv:0901.3671v1): For field coefficients K or F the duality exchanges the two perverse aisles; over O it exchanges p with p⁺.

**Suggested declarations.** `TauCeti.EtaleDuality.verdierDual_perverseLE_iff`

### The dual integral perversity p⁺ and its exchange with p

Node `EtaleDualityAndPerverseSheaves:EDC.5/integral-dual-perversity` · construction.

Under the ℓ-adic hypotheses, let p be the middle perverse t-structure on D^b_c(X, O) (EDC.5/adic-perverse-t-structures). Its heart Perv(X, O) is O-linear and noetherian, so (λ-power torsion, λ-torsion-free) is a torsion theory on it, and p⁺ is the tilt (EDC.5/torsion-pair-tilt): p⁺D^{≤0} = {K ∈ pD^{≤1} : pH¹K is torsion} and p⁺D^{≥0} = {K ∈ pD^{≥0} : pH⁰K is torsion-free}. Pointwise, K ∈ p⁺D^{≤0} iff ℋ^m(i_x^*K) = 0 for m > −dim(x) + 1 and ℋ^{−dim(x)+1}(i_x^*K) is torsion at every point x, and K ∈ p⁺D^{≥0} iff ℋ^m(i_x^!K) = 0 for m < −dim(x) and ℋ^{−dim(x)}(i_x^!K) is torsion-free. Then pD^{≤0} ⊆ p⁺D^{≤0} ⊆ pD^{≤1}; Verdier duality on D^b_c(X, O) exchanges p and p⁺: D(pD^{≤0}) = p⁺D^{≥0} and D(pD^{≥0}) = p⁺D^{≤0}, so D maps Perv(X, O)^op onto the p⁺-heart and not onto itself; a p-perverse K is p⁺-perverse iff it is torsion-free in Perv(X, O); an exact functor is right t-exact for p iff it is for p⁺; K ↦ K ⊗ E is t-exact from both p and p⁺; the p⁺-heart is artinian while Perv(X, O) is noetherian.

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- For ℓ-adic coefficients (E/ℚ_ℓ finite, ring of integers O, uniformizer λ, ℓ ≠ char k) the base field satisfies BBD's finiteness condition: H^i(Gal(k^sep/k′), ℤ/ℓ) is finite for every finite k′/k and every i (BBD 2.2.14 and 4.0; for example k finite or separably closed). The categories D^b_c(X, O) and D^b_c(X, E) and their operations are the ℓ-adic formalism requested from SchemeAndStackFoundations:SF.2.
- O-linear noetherian heart: torsion means killed by some λ^N, torsion-free means λ is a monomorphism.

**Construction and proof.**

- The torsion theory on the noetherian O-linear heart: Juteau Props. 1.3.4–1.3.5; the tilt: EDC.5/torsion-pair-tilt.
- Pointwise description: BBD 3.3.4 (i)–(iv) in the stratified setting, passed to the limit over stratifications (BBD 3.3.5), giving Juteau's (1.4)–(1.9).
- Duality: on a smooth stratum, RHom_O(−, O) on lisse O-sheaves exchanges the natural t-structure with its tilt, shifted by the dimension, because Ext¹_O(T, O) is torsion in degree 1 for torsion T (BBD 3.3.1, 3.3.3); glue with the ℓ-adic exchange formulas D i^* ≅ i^! D (requested from SF.2 with the ℓ-adic formalism) as in BBD 3.3.4 (p.100).
- Exactness statements: BBD 3.3.4 (the right t-exact criterion) and the tilt inclusions; rationalisation kills torsion.

**API.**

| Declaration | Role | Contract |
| --- | --- | --- |
| `TauCeti.EtaleDuality.perversePlusTStructure` | constructor | p⁺ on D^b_c(X, O): the tilt of p along (torsion, torsion-free) in Perv(X, O). |
| `TauCeti.EtaleDuality.perversePlus_le_iff` | characterisation | K ∈ p⁺D^{≤0} iff K ∈ pD^{≤1} and pH¹K is λ-power torsion. |
| `TauCeti.EtaleDuality.perversePlus_ge_iff` | characterisation | K ∈ p⁺D^{≥0} iff K ∈ pD^{≥0} and pH⁰K is λ-torsion-free. |
| `TauCeti.EtaleDuality.perverse_le_perversePlus_le` | relation | pD^{≤0} ⊆ p⁺D^{≤0} ⊆ pD^{≤1}. |
| `TauCeti.EtaleDuality.verdierDual_perverse_le_iff` | characterisation | K ∈ pD^{≤0} iff D_X K ∈ p⁺D^{≥0}; K ∈ pD^{≥0} iff D_X K ∈ p⁺D^{≤0}. |
| `TauCeti.EtaleDuality.perversePlus_rationalize_tExact` | functoriality | K ↦ K ⊗_O E is t-exact from p⁺ to the perverse t-structure on D^b_c(X, E). |
| `TauCeti.EtaleDuality.perverse_isRightTExact_iff_perversePlus` | characterisation | An exact functor D^b_c(X, O) → D^b_c(X′, O) is right t-exact for p iff it is right t-exact for p⁺. |
| `TauCeti.EtaleDuality.perverse_and_perversePlus_iff_torsionFree` | characterisation | A p-perverse K is p⁺-perverse iff it is torsion-free in Perv(X, O). |

**Unit tests.**

- `TauCeti.EtaleDuality.perversePlus_point_torsion` (computation): On Spec Ω: O/λ[−1] lies in the heart of p⁺ and O/λ[0] does not.
- `TauCeti.EtaleDuality.perversePlus_point_free` (computation): On Spec Ω: O[0] lies in the hearts of both p and p⁺.
- `TauCeti.EtaleDuality.perversePlus_empty` (degenerate): For X = ∅, p = p⁺.
- `TauCeti.EtaleDuality.perversePlus_rationalize_compat` (compatibility): After ⊗ E, the hearts of p and p⁺ both become Perv(X, E): (p⁺H⁰K) ⊗ E ≅ pH⁰(K ⊗ E).
- `TauCeti.EtaleDuality.not_perverse_eq_perversePlus` (non-example): p ≠ p⁺ on D^b_c(Spec Ω, O): O/λ[0] is p-perverse but not p⁺-perverse, so integral duality does not preserve Perv(X, O).

**Acceptance.**

- On Spec Ω: O/λ[0] is p-perverse and not p⁺-perverse; O/λ[−1] is p⁺-perverse; O[0] is in both hearts; D(O/λ[0]) = O/λ[−1].
- On a smooth curve C, D_C(O_C[1]) ≅ O_C(1)[1] is in both hearts, but D_C((O/λ)_C[1]) ≅ (O/λ)_C(1)[0] is p⁺-perverse and not p-perverse.

**Uses.**

- BBD 4.0 (a): over ℤ_ℓ the self-dual perversity gives two t-structures exchanged by duality.
- LefschetzPencilsAndVanishingCycles:LPV.6: integral nearby cycles and their duals use the p/p⁺ conventions.
- GeometricSatakeAndFusion:GS1: flat perverse objects and Verdier duality of standard objects integrally.
- Juteau 2009, Chapter 2: decomposition numbers relate the p- and p⁺-intermediate extensions.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/adic-perverse-t-structures`, `EtaleDualityAndPerverseSheaves:EDC.5/torsion-pair-tilt`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category`, `EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`, `SchemeAndStackFoundations:SF.2`

**Sources.**

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 3.3.1–3.3.5, pp.98–100: RHom(−, ℤ) exchanges the natural t-structure of D_c(ℤ) with its tilt; the perversities p and p⁺ determine each other through torsion conditions; Verdier duality exchanges p and (p*)⁺; Dedekind coefficient rings and ℤ_ℓ-cohomology of schemes of finite type over k are included.
- [Correspondance de Springer modulaire et matrices de décomposition (Modular Springer correspondence and decomposition matrices)](https://arxiv.org/pdf/0901.3671v1), §1.1, (1.2)–(1.9), pp.38–39; Proposition 1.3.6, pp.43–44 (arXiv:0901.3671v1): Over O the duality exchanges p with p⁺, defined pointwise by torsion conditions in the boundary degree; the two t-structures determine each other, the p-heart is noetherian and the p⁺-heart artinian.

**Suggested declarations.** `TauCeti.EtaleDuality.perversePlusTStructure`

## EDC.5f — Semismall and small maps

Proper semismall pushforward preserves perversity, stratum by stratum, with the cosupport obtained by duality; this is the corrected form of the earlier draft's open target, and it needs no local triviality of the map. Small maps with a generically étale locus push IC to IC.

### Proper semismall pushforward preserves perversity

Node `EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perversity` · theorem.

Let f : X → Y be a proper morphism of separated schemes of finite type over k and Λ self-injective (a finite field of characteristic ℓ, O/λ^m, ℤ/ℓ^m) or E under the ℓ-adic hypotheses. Let X = ⊔_α X_α be a finite partition into locally closed equidimensional strata and Y = ⊔_β Y_β a finite partition into locally closed subsets, such that for all α, β and every geometric point ȳ of Y_β: 2·dim(f^{−1}(ȳ) ∩ X_α) + dim Y_β ≤ dim X_α (with dim ∅ = −∞). Let K be a perverse sheaf on X such that the cohomology sheaves of i_α^*K and of i_α^*D_X K are locally constant on each X_α. Then Rf_*K = Rf_!K is perverse. In particular (one stratum): if X is smooth of pure dimension n, L is locally constant on X and dim(X ×_Y X) ≤ n — equivalently 2·dim f^{−1}(ȳ) + dim Y_β ≤ n for a partition of Y — then Rf_*(L[n]) is perverse (f is semismall).

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- For duality statements Λ is moreover self-injective (a finite field of characteristic ℓ ≠ char k, or O_E/λ^m, or ℤ/ℓ^m; EDC.1:biduality/self-injective-coefficients), the setting of EDC.1:biduality/constructible-biduality.
- f proper; the strata hypotheses as stated; no local triviality of f over the Y_β is needed.
- Self-injective coefficients are needed for the cosupport half, which is deduced from the support half by duality; for O = ℤ_ℓ duality exchanges p and p⁺ and the statement is not asserted here.

**Proof.**

- Support: for ȳ in Y_β, (Rf_*K)_ȳ ≅ RΓ(f^{−1}(ȳ), K) by proper base change (imported through SF.2), and RΓ(f^{−1}(ȳ), K) = RΓ_c because the fibre is proper. Filter the fibre by the locally closed pieces Z_α := f^{−1}(ȳ) ∩ X_α (compact-support localization sequences, EDC.0/compact-pushforward-amplitude-and-colimits).
- On X_α the cohomology sheaves of K are locally constant, so the stalk condition at the generic points of X_α gives ℋ^m(K|_{X_α}) = 0 for m > −dim X_α everywhere on X_α (EDC.5/middle-perverse-t-structure). Since H^q_c(Z, F) = 0 for q > 2·dim Z and every torsion sheaf F (EDC.2:trace-purity/top-degree-compact-cohomology), the hypercohomology spectral sequence gives H^m_c(Z_α, K) = 0 for m > 2·dim Z_α − dim X_α ≤ −dim Y_β. Hence ℋ^m(Rf_*K)_ȳ = 0 for m > −dim Y_β ≥ −dim(y), which is (4.0.1) at y; so Rf_*K ∈ pD^{≤0}(Y).
- Cosupport: D_X K is perverse (EDC.5/perverse-verdier-self-duality) and satisfies the same stratum hypotheses, so Rf_*D_X K ∈ pD^{≤0}(Y); D_Y Rf_*K ≅ Rf_!D_X K = Rf_*D_X K (EDC.1:adjoint/formal-duality-exchange, f proper), hence Rf_*K ∈ pD^{≥0}(Y) by self-duality.
- Smooth source: take one stratum X; K = L[n] and D_X K = L^∨(n)[n] have locally constant cohomology; dim(X ×_Y X) ≤ n is the stated inequality summed over the strata of a partition of Y by fibre dimension (de Cataldo–Migliorini Prop. 4.2.1, there over ℂ with a topologically locally trivial stratification, which this étale argument does not need).

**Acceptance.**

- A proper surjective generically finite map of smooth surfaces is semismall (fibres of dimension ≤ 1 over finitely many points), so Rf_*Λ[2] is perverse; e.g. the blow-up of a point of 𝔸².
- Non-example: the blow-up f of a point in 𝔸³ (exceptional divisor P² over the point, 2·2 + 0 > 3) is not semismall, and Rf_*Λ[3] has stalk H⁴(P², Λ) ≠ 0 in degree 1 at the point, so it is not perverse.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-verdier-self-duality`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category`, `EtaleDualityAndPerverseSheaves:EDC.0/compact-pushforward-amplitude-and-colimits`, `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/top-degree-compact-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/formal-duality-exchange`, `SchemeAndStackFoundations:SF.2`

**Used by.** `small-pushforward-intersection-complex`

**Sources.**

- [The decomposition theorem, perverse sheaves and the topology of algebraic maps](https://arxiv.org/pdf/0712.0349v2), §4.2, Proposition 4.2.1 and Definition 4.2.2, p.56 (arXiv:0712.0349v2): For X nonsingular of dimension n and f proper surjective with a stratification of Y, f_*ℚ_X[n] is perverse iff dim X ×_Y X ≤ n iff dim S_k + 2d_k ≤ dim X for every stratum; such maps are called semismall.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 4.2.4, p.108: Proper f with fibres of dimension ≤ d has perverse amplitude [−d, d]; the proof bounds stalks by dimensions, as the support step here does stratum by stratum.

**Suggested declarations.** `TauCeti.EtaleDuality.semismall_pushforward_perverse`

### Small maps push intersection complexes to intersection complexes

Node `EtaleDualityAndPerverseSheaves:EDC.5/small-pushforward-intersection-complex` · theorem.

Let f : X → Y be a proper surjective morphism of irreducible separated schemes of finite type over k, X smooth of pure dimension n, Λ self-injective (or E), L locally constant on X, and suppose f is small: there is a partition Y = ⊔ Y_β into locally closed subsets with a dense open stratum Y_0 such that 2·dim f^{−1}(ȳ) + dim Y_β < n for every β ≠ 0 and ȳ ∈ Y_β. Assume moreover that f is finite étale over a dense open V ⊂ Y_0 smooth over k (generic étaleness is a hypothesis: smallness does not imply it in characteristic p). Then dim Y = n and Rf_*(L[n]) ≅ IC_Y((f_*L)|_V).

**Hypotheses.**

- k is a field, n ≥ 1 an integer invertible in k, and X, Y, Z, U are separated schemes of finite type over k; every point x has dim(x) := dim of its closure (EDC.5/point-dimension-function).
- For duality statements Λ is moreover self-injective (a finite field of characteristic ℓ ≠ char k, or O_E/λ^m, or ℤ/ℓ^m; EDC.1:biduality/self-injective-coefficients), the setting of EDC.1:biduality/constructible-biduality.
- f proper surjective, X smooth of pure dimension n, f small, f finite étale over a dense smooth open V.

**Proof.**

- Rf_*(L[n]) is perverse by EDC.5/semismall-pushforward-perversity (small implies semismall).
- Strict support: for ȳ ∉ V in Y_β of dimension b, the support computation of the semismall proof gives ℋ^m(Rf_*L[n])_ȳ = 0 for m > 2·dim f^{−1}(ȳ) − n, and smallness makes this < −b, including the zero-dimensional fibres over strata with b < n (where −n < −b). Strict cosupport by duality: D_Y Rf_*(L[n]) ≅ Rf_*(L^∨(n)[n]).
- These are the strict bounds of EDC.5/perverse-intermediate-extension along Y ∖ V, so Rf_*(L[n]) ≅ j_!*((Rf_*L[n])|_V) = IC_Y((f_*L)|_V) (EDC.5/intersection-complex-of-local-system).

**Acceptance.**

- The normalisation ν of a nodal cubic is small (over the node the fibre is two points: 2·0 + 0 < 1) and finite étale over the smooth locus, so ν_*Λ_{P¹}[1] = IC_X.
- Non-example: the blow-up f of a point in 𝔸² is semismall but not small (2·1 + 0 = 2): the stalk of Rf_*Λ[2] at the origin is H^*(P¹, Λ)[2], with ℋ⁰ ≅ H²(P¹, Λ) ≅ Λ(−1) ≠ 0 at a point of dimension 0, which the strict stalk bound of an intersection complex forbids; so Rf_*Λ[2] is perverse but is not IC_{𝔸²}.

**Depends on.** `EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perversity`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension`, `EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex-of-local-system`, `EtaleDualityAndPerverseSheaves:EDC.5/perverse-verdier-self-duality`

**Sources.**

- [The decomposition theorem, perverse sheaves and the topology of algebraic maps](https://arxiv.org/pdf/0712.0349v2), §4.2, Remark 4.2.4, p.56 (arXiv:0712.0349v2): If dim S_k + 2d_k < dim X for every non-dense stratum the map is small and f_*ℚ_X[n] satisfies the support and cosupport conditions of intersection cohomology, so it is IC_Y of the local system on the open set where f is a covering.

**Suggested declarations.** `TauCeti.EtaleDuality.small_pushforward_intersectionComplex`

## Planets

- Gluing of t-structures — `EtaleDualityAndPerverseSheaves:EDC.5/gluing-t-structures`
- Middle perverse t-structure — `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`
- Perverse sheaves — `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category`
- Verdier self-duality of perverse sheaves — `EtaleDualityAndPerverseSheaves:EDC.5/perverse-verdier-self-duality`
- Intermediate extension — `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension`
- Intersection complex — `EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex-of-local-system`

## Requests to other roadmaps

- **SchemeAndStackFoundations:SF.2.** Artin's affine theorem in the form BBD 4.1.1 uses (SGA 4 XIV 3.1–3.2): for f : X → Y an affine morphism of schemes of finite type over a field k, n invertible in k, Λ noetherian with nΛ = 0 and F a constructible sheaf of Λ-modules on X, dim Supp R^qf_*F ≤ dim Supp F − q for every q (dim computed with dim(x) = dim of the closure of x); in particular, for X affine over a separably closed field, H^q(X, F) = 0 for q > dim X. Needed by: `perverse-artin-vanishing`.
- **SchemeAndStackFoundations:SF.2.** Topological invariance of the étale site (Stacks Tag 04DY, Section 59.45): a universal homeomorphism, in particular X_{k^perf} → X for X of finite type over a field k, induces an equivalence of small étale sites, hence of D(−, Λ), compatible with pullback and pushforward, stalks at geometric points, constructibility, Rf_!, f^! and the closed/open recollement. Needed by: `middle-perverse-t-structure`, `intersection-complex-of-local-system`, `simple-perverse-sheaves-classification`.
- **SchemeAndStackFoundations:SF.2.** Étale fundamental groups of geometrically unibranch schemes (Stacks Tag 0BQI): for X irreducible and geometrically unibranch (e.g. normal, e.g. smooth over k) and U ⊂ X nonempty open, π₁(U, ū) → π₁(X, ū) is surjective; consequently restriction from X to U is fully faithful on locally constant constructible sheaves and preserves irreducibility. Needed by: `simple-perverse-sheaves-classification`.
- **SchemeAndStackFoundations:SF.2.** The ℓ-adic constructible formalism (EllAdicRealization of CohomologicalPointCounting; Deligne, Weil II 1.1.2–1.1.3; BBD 2.2.14–2.2.18): for k with finite H^i(Gal(k^sep/k′), ℤ/ℓ) for all finite k′/k, ℓ ≠ char k, E/ℚ_ℓ finite with integers O and uniformizer λ: the triangulated categories D^b_c(X, O) (2-limit of D^b_ctf(X, O/λ^m) along − ⊗^L O/λ^m) and D^b_c(X, E) = D^b_c(X, O) ⊗ E, their natural t-structures with hearts the constructible O- and E-sheaves, the six operations f^*, Rf_*, Rf_!, f^!, ⊗^L, RHom with Verdier duality D_X = RHom(−, a^!O), biduality, the exchange formulas D i^* ≅ i^! D and D Rf_* ≅ Rf_! D on constructible complexes, and compatibility of all of these with reduction modulo λ^m and with ⊗_O E. Needed by: `adic-perverse-t-structures`, `integral-dual-perversity`, `perverse-verdier-self-duality`, `external-product-t-exact`.
- **SchemeAndStackFoundations:SF.2.** Base change and finiteness inputs already requested by EDC.0 from CohomologicalPointCounting, in the forms EDC.5 uses: proper base change (Rf_*K)_ȳ ≅ RΓ(f^{−1}(ȳ), K) for f proper and torsion K; exactness of finite pushforward with stalks the sum over the finite fibre; smooth base change and f^*RHom(K, L) ≅ RHom(f^*K, f^*L) for f smooth and K constructible; the finiteness theorem (Rf_*, Rj_* and i^! preserve D^b_c(−, Λ) for Λ noetherian with nΛ = 0, SGA 4½ [Th. finitude] 1.1); and the Künneth formula for ⊠ (SGA 4 XVII 5.4.3) with D(K ⊠ L) ≅ DK ⊠ DL (BBD 4.2.7). Needed by: `middle-perverse-t-structure`, `quasi-finite-perverse-exactness`, `smooth-pullback-perverse-exactness`, `semismall-pushforward-perversity`, `external-product-t-exact`.

## Gaps

### Perverse t-structures over a trait or a regular base of dimension one (LPV.0 request)

LefschetzPencilsAndVanishingCycles--LPV.0 requests from EDC.5 the early perverse t-structure for schemes of finite type over a trait with the rectified dimension function. EDC.5 is stated for schemes of finite type over a field (its stage text). The gluing construction transfers verbatim to a dimension function on schemes of finite type over an excellent regular base of dimension ≤ 1, but the identification of the pointwise costalk conditions with shifted natural t-structures on regular, non-smooth strata needs Gabber's absolute purity, which EDC.0 records as unowned (its gap 'Absolute purity for higher-dimensional regular pairs'). The trait-relative t-structure therefore needs that purity owner first; LPV.6 uses EDC.5 only on the geometric fibres, which this packet supplies.

Needed by: `LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness`, `LefschetzPencilsAndVanishingCycles:LPV.6/vanishing-perverse-exactness`, `LefschetzPencilsAndVanishingCycles:LPV.6/filtered-colimit-support-criterion`.

### Two-sided pushforward comparisons for integral O_C/p models (IG request, partly supplied)

IgusaVarietiesAndTorsionConcentration requests (i) the pointwise costalk and stalk criteria on nonconstructible complexes with their continuity under filtered colimits and (ii) pushforward comparisons for finitely presented O_C/p models with the source dimension function pulled back from the base. Part (i) is EDC.5/enlarged-perversity-conditions (stalks: all filtered colimits; costalks: uniformly bounded-below filtered colimits; Rj_* for open j, finite pushforward and étale pullback). Part (ii) concerns formal models over O_C/p, not schemes of finite type over a field; it belongs with the formal-model geometry of IG.4 (FormalNeighbourhood) and the nearby-cycle comparison of LPV.6, and is not planned here.

Needed by: `IgusaVarietiesAndTorsionConcentration:IG.4/compact-perversity`, `IgusaVarietiesAndTorsionConcentration:IG.4/semiperversity`, `IgusaVarietiesAndTorsionConcentration:IG.7/koshikawa-ordinary-costalk-bound`.

### Relative perverse t-structure and universal local acyclicity over a scheme base (GlobalShtukas request)

Carried from the EDC.4-part draft: GlobalShtukasAndFunctionFieldLanglands asked EtaleDualityAndPerverseSheaves for the perverse t-structure relative to a base curve and universal local acyclicity. EDC.5 is the absolute perverse t-structure over a field; the relative (Hansen–Scholze) t-structure is owned on the diamond side by GeometricSatakeAndFusion:GS1 and ULA by VStackSheavesAndLisseCategories:VS1; the scheme-theoretic relative version over a curve has no owner.

Needed by: `GlobalShtukasAndFunctionFieldLanglands:GS.1`.

### Compactifications and boundary strata in the étale setting (GlobalShtukas GS.6 request)

GlobalShtukasAndFunctionFieldLanglands requested from EDC.5 'compactifications and boundary strata in the étale setting, with the comparison of the cohomology of a compactification with that of the open part'. EDC.5 supplies the open–closed recollement, j_!, Rj_*, j_!* and the low-degree comparison of EDC.5/intermediate-extension-low-degree-cohomology; the construction of compactifications of shtuka varieties and their boundary geometry is not in EDC.5's stage text and has no owner.

Needed by: `GlobalShtukasAndFunctionFieldLanglands:GS.6/compactification-and-boundary-analysis`.

### Perverse sheaves and IC on algebraic stacks (confirmed finding RT-AREA-etale/3)

EDC.5 is scheme-only. The perverse t-structure and intersection complexes on Artin stacks (Laszlo–Olsson) are layer (3) of the stacks Part II proposed by EDC.0 and endorsed in this packet's restructure entry; its consumers (shtuka, Hitchin, Bun_G stacks) import the scheme-level nodes here through smooth descent, starting from EDC.5/smooth-pullback-perverse-exactness.

Needed by: `GlobalShtukasAndFunctionFieldLanglands:GS.1`, `GlobalShtukasAndFunctionFieldLanglands:GS.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`.

### Perfect schemes and equivariant perverse sheaves (confirmed finding RT-AREA-etale/16)

Zhu's perverse t-structure and IC on perfect pfp spaces, equivariant perverse sheaves and hyperbolic localization belong to the perfect-schemes Part II proposed by EDC.0. The finite-type statements they transport are the nodes of this packet (perverse t-structure, intermediate extension, IC, semismall pushforward); topological invariance of the étale site (requested from SF.2) is the bridge for perfections.

Needed by: `GeometricSatakeAndFusion:GS1`, `GeometricSatakeAndFusion:GS3`, `GeometricSatakeAndFusion:GS4`.

## Restructuring

- **rescope** (EtaleDualityAndPerverseSheaves, GlobalShtukasAndFunctionFieldLanglands, GeometricSatakeAndFusion). Confirmed findings RT-AREA-etale/3 and RT-AREA-etale/16, as they bear on EDC.5: consumers apply EDC.5's perverse t-structure and IC on Artin stacks and on perfect pfp spaces, which this scheme-level stage does not plan. Endorse the two Part IIs proposed in EtaleDualityAndPerverseSheaves--EDC.0 and give them their EDC.5 inputs: the stacks Part II's layer (3) (perverse t-structure and IC on Artin stacks) starts from EDC.5/middle-perverse-t-structure, EDC.5/smooth-pullback-perverse-exactness (smooth descent of perversity with the shift by relative dimension), EDC.5/perverse-intermediate-extension and EDC.5/intersection-complex-of-local-system; the perfect-schemes Part II transports EDC.5/middle-perverse-t-structure, EDC.5/perverse-intermediate-extension, EDC.5/intersection-complex-of-local-system and EDC.5/semismall-pushforward-perversity along finite-type models and perfection, using topological invariance of the étale site. Neither Part II redefines these scheme-level notions.

## Mistakes in the sources

### EtaleDualityAndPerverseSheaves/E16 — misprint

[Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Proof of Corollaire 4.1.3, p.103 (Numdam scan of Astérisque 100, first edition; checked on the page image).

The proof says that f_* is t-exact on the right by reference to 4.1.7.

The right t-exactness of f_* for affine f is Théorème 4.1.1; the reference should read 4.1.1.

**Reason.** 4.1.7 is the lemma producing a nonvanishing H^d on an open affine of a smooth affine variety (p.104), which says nothing about t-exactness; 4.1.1 (p.102) is the statement that Rf_* is right t-exact for affine f, exactly what the corollary needs together with 2.2.5 for the left half.

**Affects.** nothing. **Known.** new.

### EtaleDualityAndPerverseSheaves/E17 — misprint

[Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), Proof of Lemme 4.3.3 and 4.3.4, p.113 (Numdam scan; checked on the page image).

Both proofs invoke the absence of subobjects and quotients supported on the boundary by citing (1.4.2.5).

The intended reference is Corollaire 1.4.25 (p.55): j_!*B is the unique extension without nonzero sub- or quotient objects from the closed part.

**Reason.** There is no statement numbered 1.4.2.5 in §1.4 (it runs 1.4.1, 1.4.2.1, 1.4.2.3, 1.4.3, …, 1.4.26); 1.4.25 is the characterisation the argument uses, and 4.3.4 applies it to the open and closed embeddings exactly as 1.4.25–1.4.26 allow.

**Affects.** nothing. **Known.** new.

Three confirmed findings recorded with the earlier draft apply to statements planned here and are used in their corrected form; they are not recorded twice:

- `EtaleDualityAndPerverseSheaves/E11` (EtaleDualityAndPerverseSheaves--EDC.4.json): BBD 2.2.12 prints the two pointwise inequalities reversed; EDC.5/middle-perverse-t-structure uses the corrected form (4.0.1)–(4.0.2).
- `EtaleDualityAndPerverseSheaves/E12` (EtaleDualityAndPerverseSheaves--EDC.4.json): BBD 4.3.1 (ii) labels the local system with ℚ_ℓ where §4 works over ℚ̄_ℓ; EDC.5/simple-perverse-sheaves-classification states the classification over any coefficient field.
- `EtaleDualityAndPerverseSheaves/E13` (EtaleDualityAndPerverseSheaves--EDC.4.json): Zhu A.3.1 misnormalises IC on the smooth open; EDC.5/intersection-complex-of-local-system fixes IC_X(L)|_U = L[d].

## Suggested Lean file

The suggested file follows the 12 October shape: it imports individual Mathlib modules, has no data definition without a real body, and states only what the pinned Mathlib can type; it elaborates at the pins with unproved theorem statements as its only warnings. It contains, for EDC.5a, the t-exactness predicates with the adjoint criterion and composition, the heart's abelian structure through Mathlib's admissible-subcategory criterion, the t-cohomology functors H⁰_t and H^m_t with detection on bounded objects, the induced heart functors and their exactness and adjunction, the recollement structure, the glued t-structure (real aisles, axioms left as propositions) with its exactness statements and the converse criterion, the abstract intermediate extension as an image in the glued heart with its characterisations and the classification of simple objects, and the tilt along a torsion theory; for EDC.5b, the dimension of a point, the middle cutoff, and the pointwise upper perverse condition on Mathlib's étale derived category with its natural bounds. The lower aisle needs costalks i_x^!, and the perverse t-structure on D^b_c, perverse sheaves, j_!* on schemes, IC, the exactness theorems and the ℓ-adic categories need carriers the pins do not have (i^!, Rf_!, constructibility); they are targets of this document only, and the file's closing comment lists them by name.

## Coverage and validation

| Stage | Status | Remaining |
| --- | --- | --- |
| `EtaleDualityAndPerverseSheaves:EDC.5` | planned | Replace the five SchemeAndStackFoundations:SF.2 requests (Artin's affine theorem, topological invariance, π₁ surjectivity, the ℓ-adic formalism, base change/finiteness/Künneth) by accepted supplier nodes when they exist. Lemma-level refinement (one node per part of the multi-part theorems, e.g. gluing (a)–(f), the affine-open sequences) when the roadmap comes near the front of the line. The trait-relative perverse t-structure and the O_C/p-model pushforward comparisons are consumer requests outside this stage (gaps), not EDC.5 targets. |

`python3 scripts/check_blueprint.py` reports no errors and no warnings for the packet; every prerequisite resolves to a node of this packet, an accepted EDC.0 node, the SF.2 node cited above, an SF.2 request or a pinned Mathlib declaration read at the pin; the internal prerequisite graph is acyclic.

## Public references

- [A. A. Beilinson, J. Bernstein, P. Deligne, Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf). Astérisque 100 (1982), pp. 5–171; Numdam scan with OCR (printed page = PDF page − 1), read 2026-10-13; statements checked on page images where the OCR is unclear.
- [M. A. A. de Cataldo, L. Migliorini, The decomposition theorem, perverse sheaves and the topology of algebraic maps](https://arxiv.org/pdf/0712.0349v2). Bull. Amer. Math. Soc. 46 (2009), 535–633; arXiv:0712.0349v2 (printed page = PDF page), read 2026-10-13.
- [D. Juteau, Correspondance de Springer modulaire et matrices de décomposition (Modular Springer correspondence and decomposition matrices)](https://arxiv.org/pdf/0901.3671v1). Thèse de doctorat, Université Paris 7 (2007); arXiv:0901.3671v1, read 2026-10-13 (printed page = PDF page − 2).
- [The Stacks project authors, The Stacks project](https://stacks.math.columbia.edu). Online, tags read 2026-10-13.
