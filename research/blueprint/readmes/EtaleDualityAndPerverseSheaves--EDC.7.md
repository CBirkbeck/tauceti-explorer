# Étale duality, cycle classes and perverse sheaves — EDC.7–EDC.8

This part of the roadmap plans the two late layers: **EDC.7**, the theory of weights for perverse sheaves over finite fields culminating in the decomposition theorem and relative hard Lefschetz, together with their transport to ℂ; and **EDC.8**, cohomological correspondences, their trace maps and local terms, the Lefschetz–Verdier and Fujiwara–Varshavsky trace formulas, and the linear algebra of Poincaré duality with Frobenius that the Weil conjectures need for the functional equation. The [packet](../packets/EtaleDualityAndPerverseSheaves--EDC.7.json) fixes node identifiers and the dependency graph; this document states every target with its hypotheses, proof plan, API, unit tests and sources; the [suggested Lean file](../suggested/EtaleDualityAndPerverseSheaves--EDC.7.lean) proposes signatures against the pinned libraries. Nothing here is claimed to be formalised.

## What this part builds, and what it imports

**Built here.** Mixed perverse sheaves and the criteria for their weights; Ext-vanishing between weights; purity of intermediate extensions and of intersection complexes; the weight filtration; geometric semisimplicity of pure perverse sheaves; the splitting of pure complexes; the decomposition theorem for proper maps over finite fields and its semismall form; graded Lefschetz objects and relative hard Lefschetz with its primitive decomposition; BBD's restricted constructible categories, perverse sheaves of geometric origin, and the decomposition and relative hard Lefschetz theorems over ℂ. Correspondences and cohomological correspondences with pushforward, pullback, restriction and composition; trace maps and local terms; compatibility with proper pushforward and additivity; the Lefschetz–Verdier formula; specialisation of correspondences and the deformation to the normal cone; contracting correspondences, Frobenius twists and the Fujiwara–Varshavsky trace formula; naive local terms for semisimple and finite-order automorphisms; the graded Frobenius duality datum with reciprocity of characteristic polynomials and the determinant identities.

**Imported, never rebuilt.**

- *Earlier layers of this roadmap.* The étale derived category, constructible and finite-Tor complexes, Tate twists and compact support (EDC.0); exceptional inverse image, Verdier duality, biduality, recollement and relative duality (EDC.1); smooth purity, the trace and Poincaré pairings with their Frobenius equivariance (EDC.2); Chern classes and Gysin maps (EDC.3); the projective-bundle decomposition (EDC.4). The perverse t-structure and its ℓ-adic form, perverse sheaves, intermediate extension, intersection complexes, simple objects, Verdier duality on perverse sheaves, Artin vanishing, perverse amplitude, smooth-pullback exactness and full faithfulness, the semismall and small-map criteria (EDC.5, cited by the node ids of the EDC.5 packet), and the adic coefficient categories, coefficient extension and the comparison with the complex-analytic category (EDC.6, cited by the original node ids that the EDC.6 packet imports).
- *Weights.* Mixed and pure complexes, the stability of mixedness under the six operations, the upper-weight bound for Rf_! (Deligne's main theorem of Weil II, through its variant 6.2.3), the purity criterion for lisse sheaves on smooth schemes, proper purity, geometric semisimplicity of pure lisse sheaves and arithmetic models come from DeligneWeightsAndPurity DWP.7–DWP.8. Its absolute hard Lefschetz theorem DWP.9 is the special case against which relative hard Lefschetz is checked; BBD's proof of the relative theorem does not use it.
- *Nearby cycles.* The specialisation functor of EDC.8 is nearby cycles over a trait, from LefschetzPencilsAndVanishingCycles LPV.0.
- *Point counting.* The perfect-complex trace and the Grothendieck–Lefschetz trace formula belong to CohomologicalPointCounting TraceFormula (TauCetiRoadmap pull request 196). EDC.8 does not rebuild them; its trivial-correspondence trace is that trace, and Grothendieck–Lefschetz is recovered as the case U = X of the Fujiwara–Varshavsky formula.
- *Libraries.* Mathlib's abelian categories, simple, artinian and noetherian objects, biproducts, kernels, schemes, fibre products, proper and separated morphisms, ideal sheaves, characteristic polynomials (including charpolyRev and the transpose and inverse identities), dual-map determinants, generalized eigenspaces, perfect pairings and the permutation-trace formula; Tau Ceti's permutation trace on finite products, the rank-two alternating similitude determinant and the isometry determinant identity.

**Boundaries.** Everything is scheme-level: Artin and Deligne–Mumford stacks, perfect schemes, equivariant coefficients and hyperbolic localisation are the two proposed Part IIs recorded at the end. There is no integral or mod-ℓ decomposition theorem, no canonical or Frobenius-compatible splitting, and no semisimplicity theorem for arithmetic Frobenius. EDC.8 defines no zeta function: WeilConjectures WC.2 and WC.6 assemble the functional equation from the identities exported here. The Igusa-variety application of the Fujiwara–Varshavsky formula (compactification, isolation, acceptable functions and the Kottwitz-triple count) stays with EndoscopicTransferAndUnitaryTraceComparison ET.5; the Hitchin support theorem stays with ET.2b; parity and boundary calculations for Satake categories stay with GeometricSatakeAndFusion.

## Conventions

- **Base and coefficients.** X₀ is separated of finite type over 𝔽_q, X := X₀ ⊗ 𝔽̄_q, ℓ ≠ p. ℚ̄_ℓ-coefficients are the 2-colimit over finite E/ℚ_ℓ of the rational adic categories of EDC.6. Arithmetic objects carry the index 0; dropping it means pulling back to 𝔽̄_q.
- **Weights.** Integer weights in the sense of DWP.8. A complex has weights ≤ w when ℋ^i has punctual weights ≤ w + i, and weights ≥ w when its Verdier dual has weights ≤ −w; pure means both. Geometric Frobenius acts on ℚ̄_ℓ(1) by q^{−1}, so ℚ̄_ℓ(1) has weight −2 and K(r) has weights shifted by −2r.
- **Perverse normalisation.** The middle perversity; on a smooth pure d-dimensional scheme, L[d] is perverse for L lisse. IC_X(L) = j_!*(L[d]) carries no Tate half-twist; L punctually pure of weight w gives IC_X(L) pure of weight w + d.
- **Hard Lefschetz.** η is the first Chern class of a relatively ample line bundle; η^i : pH^{−i} → pH^{i}(i). Both sides are pure of weight w − i for a pure perverse input of weight w.
- **Correspondences.** A cohomological correspondence is u : c₁^*F₁ → c₂^!F₂, pulling back along the first leg; equivalently c₂!c₁^*F₁ → F₂. The graph-type correspondence of g : X → X is (g, id), whose cohomological correspondences are maps g^*F → F. The n-th Frobenius twist is (Frⁿ ∘ c₁, c₂). The stage description's c₂^*K → c₁^!K is the same notion with the legs named in the other order.
- **Functional equation.** For a graded Frobenius duality datum of weight (2d, q^d), P_i(t) = det(1 − tF_i), χ = Σ(−1)^i b_i and Δ = ∏ det(F_i)^{(−1)^i}; then Δ² = q^{dχ}. This is the convention of WC.2.

## Sources

BBD (*Faisceaux pervers*, chapters 5 and 6) is the source for EDC.7, with Weil II for the weight inputs it imports and the de Cataldo–Migliorini survey for the semismall decomposition and the primitive decomposition. Varshavsky's *Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara* is the source for EDC.8's trace theory, with Lu–Zheng for composition, Varshavsky's *Local terms for transversal intersections* and Hansen–Kaletha–Weinstein for local terms of finite-order automorphisms, and Weil I and Milne for the functional-equation interface. Yun–Zhang (II) and Zhu are consumers whose uses fix the API. Every source is public; URLs, versions and hashes are at the end.


## EDC.7 — Pure intersection complexes and decomposition


The layer works over finite fields first. The order of proof is the order of the subsections below: Frobenius descent and the Hochschild–Serre sequences (BBD 5.1.2) feed Ext-vanishing between weights (5.1.15); the H⁰ criterion on affines (5.2.1) feeds stability under subquotients (5.3.1), which gives purity of intermediate extensions along affine immersions (5.3.2) and purity of simple mixed perverse sheaves (5.3.4); these with the abstract splitting lemma (5.3.6) give the weight filtration (5.3.5), then the generic weight criterion (5.3.7) and geometric semisimplicity (5.3.8). The weight criterion for perverse cohomology (5.4.1) comes next, then the general quasi-finite purity statement (5.4.3), the splitting of pure complexes (5.4.5–5.4.6) and the decomposition theorem. Relative hard Lefschetz (5.4.10) uses the universal hyperplane section (5.4.11–5.4.13) and geometric semisimplicity; the primitive decomposition is a formal consequence in any abelian category with a Tate twist. Chapter 6 transports the finite-field theorems to ℂ.

**Acceptance tests for the layer.** The blow-up of 𝔸² at a point has Rπ_*ℚ̄_ℓ[2] ≅ ℚ̄_ℓ[2] ⊕ δ₀(−1), both pure of weight 2 (decomposition and semismall forms agree). Rj_*ℚ̄_ℓ[1] for j : 𝔾_m ↪ 𝔸¹ is mixed of weights 1 and 2, has weight filtration with graded pieces ℚ̄_ℓ[1] and δ₀(−1), and is a non-split extension, so purity is necessary for every splitting statement. The unipotent sheaf E₂ on Spec 𝔽_q is pure, geometrically semisimple and not semisimple arithmetically. For a smooth projective X₀ and the constant sheaf, intersection-cohomology hard Lefschetz is the hard Lefschetz theorem of DWP.9, and the nodal cubic shows that IC differs from the constant sheaf and that the latter is not pure.


### Frobenius structures and mixed perverse sheaves

Arithmetic objects live on X₀ over 𝔽_q; their pullbacks to X = X₀ ⊗ 𝔽̄_q carry a Frobenius descent datum. The first node identifies perverse sheaves on X₀ with Frobenius-equivariant perverse sheaves on X up to the failure of essential surjectivity, through the Hochschild–Serre sequences for Hom; the second restricts the perverse t-structure to mixed complexes.

<a id="node-EDC-7-frobenius-descent-of-perverse-sheaves"></a>

#### Perverse sheaves over 𝔽_q as Frobenius-equivariant perverse sheaves over 𝔽̄_q

Node `EDC.7/frobenius-descent-of-perverse-sheaves` · theorem.

Let X₀ be separated of finite type over 𝔽_q and K₀, L₀ ∈ D^b_c(X₀, ℚ̄_ℓ), with pullbacks K, L to X. (a) For every i there is a short exact sequence 0 → Hom^{i−1}(K, L)_F → Hom^i(K₀, L₀) → Hom^i(K, L)^F → 0, where Hom^i := Hom(−, −[i]) in the derived category, F is the geometric Frobenius acting on the finite-dimensional ℚ̄_ℓ-space Hom^i(K, L) = H^i RHom(K, L) by transport of structure, and the subscript/superscript F denote coinvariants/invariants. (b) The functor sending a perverse sheaf F₀ on X₀ to the pair (F, φ), φ : Fr*F ≅ F its Weil descent isomorphism, is fully faithful from Perv(X₀, ℚ̄_ℓ) to the category of perverse sheaves on X equipped with an isomorphism Fr*F ≅ F, and its essential image is stable under extensions and under subquotients. (c) The functor is not essentially surjective: over X₀ = Spec 𝔽_q the pair (ℚ̄_ℓ, multiplication by a non-unit u ∈ ℚ̄_ℓ^×) is not in the image.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).
- The Frobenius acting on Hom^i(K, L) is the one induced by the descent data of K₀ and L₀; continuous Galois cohomology of Gal(𝔽̄_q/𝔽_q) ≅ ℤ̂ is used.

**Construction and proof.**

- Write Hom^i(K₀, L₀) = H^i RΓ(Spec 𝔽_q, Ra_* RHom(K₀, L₀)) for a : X₀ → Spec 𝔽_q, and identify the geometric fibre of Ra_*RHom(K₀, L₀) with RHom(K, L) by proper/smooth base change for RHom of constructible complexes over a field (SF.2 Hochschild–Serre for Galois coverings, passed to adic coefficients).
- The Hochschild–Serre spectral sequence for Gal(𝔽̄_q/𝔽_q) ≅ ℤ̂ has only the columns p = 0, 1, since continuous cohomology of ℤ̂ with finite-dimensional ℓ-adic coefficients is invariants in degree 0, coinvariants in degree 1 and zero above; this gives (a) (BBD (5.1.2.3)–(5.1.2.5)).
- For perverse K₀, L₀ the group Hom^{−1}(K, L) vanishes (EDC.5/heart-abelian-subcategory), so (a) with i = 0 gives full faithfulness: Hom(K₀, L₀) = Hom(K, L)^F.
- With i = 1, Ext¹ in Perv(X₀) and Ext¹ in the category of pairs (F, φ) both sit in exact sequences with Hom(K, L)_F on the left and Ext¹(K, L)^F on the right; equal dimensions and injectivity give a bijection, hence stability under extensions.
- Stability under subquotients follows from the noetherian-induction Lemma 5.1.3 of BBD: on a smooth dense open where a sub-object is a shifted lisse sheaf, a Frobenius-stable lisse subquotient descends; extend by p j_!, p j_* and the closed complement.
- The non-example over a point: a Weil-descent isomorphism of ℚ̄_ℓ which is multiplication by a non-ℓ-adic unit is not the Frobenius of a continuous ℓ-adic Galois representation.

**Prerequisites.** `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category`; `EtaleDualityAndPerverseSheaves:EDC.5/heart-abelian-subcategory`; `EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`; `SchemeAndStackFoundations:SF.2/hochschild-serre-galois-covering`; `EtaleDualityAndPerverseSheaves:EDC.0/derived-tensor-and-internal-hom`; `DeligneWeightsAndPurity:DWP.8/ext-one-of-lisse-sheaves-3-4-2`.

**Acceptance.**

- Over X₀ = Spec 𝔽_q, K₀ = L₀ = ℚ̄_ℓ: Hom^0 = ℚ̄_ℓ and Hom^1(K₀, L₀) = ℚ̄_ℓ (coinvariants of the trivial action), while Hom^1(K, L) = 0.
- For K₀ = ℚ̄_ℓ and L₀ = ℚ̄_ℓ(1) on Spec 𝔽_q: F acts on Hom(K, L) = ℚ̄_ℓ by q^{-1} ≠ 1, so invariants and coinvariants vanish and Hom^i(K₀, L₀) = 0 for all i.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, 5.1.1–5.1.4, pp. 122–125 (Proposition 5.1.2 with Remark, Lemma 5.1.3, Remark 5.1.4). BBD prove full faithfulness of the extension-of-scalars functor on perverse sheaves with its Frobenius isomorphism, stability of the essential image under extensions and subquotients, the short exact sequences (5.1.2.5) for Hom^i, and give the non-unit counterexample over a point.

<a id="node-EDC-7-mixed-perverse-sheaves"></a>

#### Mixed perverse sheaves and the perverse t-structure on mixed complexes

Node `EDC.7/mixed-perverse-sheaves` · definition.

For X₀ separated of finite type over 𝔽_q, let D^b_m(X₀, ℚ̄_ℓ) ⊂ D^b_c(X₀, ℚ̄_ℓ) be the full triangulated subcategory of mixed complexes (DWP.8/mixed-complexes). The middle perverse t-structure of D^b_c(X₀, ℚ̄_ℓ) restricts to a t-structure on D^b_m(X₀, ℚ̄_ℓ); its heart Perv_m(X₀) is the category of mixed perverse sheaves: perverse sheaves on X₀ whose ordinary cohomology sheaves are mixed. Perv_m(X₀) is a full abelian subcategory of Perv(X₀, ℚ̄_ℓ) stable under kernels, cokernels, extensions and all subquotients. A mixed perverse sheaf F₀ has weights ≤ w (resp. ≥ w, pure of weight w) when F₀ ∈ D^b_m has; with the shifted convention of DWP.8, F₀[1] has weights ≤ w + 1 exactly when F₀ has weights ≤ w.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).
- Mixedness is tested on ordinary cohomology sheaves; perverse truncations are computed in D^b_c(X₀, ℚ̄_ℓ).

**Construction and proof.**

- D^b_m(X₀) is stable under f^*, Rf_*, Rf_!, Rf^!, ⊗, RHom and Verdier duality (DWP.8/six-operations-preserve-mixedness-6-1-11) and under the ordinary truncations, since mixedness is a condition on cohomology sheaves (BBD 5.1.6).
- The perverse truncations are built from these operations along a stratification (EDC.5/middle-perverse-t-structure, gluing), so they preserve D^b_m; hence the perverse t-structure restricts (BBD 5.1.7(i)).
- The heart of the restricted t-structure is a full subcategory of Perv(X₀) stable under kernels, cokernels and extensions (it is the intersection with a triangulated subcategory).
- Stability under subquotients: apply BBD Lemma 5.1.3/Remark 5.1.4 to the system of subcategories Perv_m(Y₀) for all subschemes Y₀, whose hypotheses (stability under p j_!, p j_*, closed pushforward, lisse subquotients on smooth strata) hold by DWP.8 stability (BBD 5.1.7(ii)).

**Prerequisites.** `DeligneWeightsAndPurity:DWP.8/mixed-complexes`; `DeligneWeightsAndPurity:DWP.8/pure-complexes`; `DeligneWeightsAndPurity:DWP.8/six-operations-preserve-mixedness-6-1-11`; `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`; `EtaleDualityAndPerverseSheaves:EDC.5/adic-perverse-t-structures`; `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes`; `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category`; `DeligneWeightsAndPurity:DWP.8/directional-weight-estimates`; `EtaleDualityAndPerverseSheaves:EDC.5/perverse-verdier-self-duality`; [`EDC.7/frobenius-descent-of-perverse-sheaves`](#node-EDC-7-frobenius-descent-of-perverse-sheaves); `DeligneWeightsAndPurity:DWP.7/weights-mixed-sheaves-definitions`.

**Uses.**

- BBD 5.3.5 and 5.4.1: the weight filtration and the perverse-cohomology weight criterion live in Perv_m(X₀).
- Yun–Zhang II §3.5, (3.36)–(3.38): graded pieces of a perverse filtration are pure, so their cohomology has a single weight and the long exact sequences split by weight.
- EndoscopicTransferAndUnitaryTraceComparison:ET.2b: the Hitchin direct image is a pure complex whose perverse cohomology sheaves are mixed perverse.
- GeometricSatakeAndFusion:GS4:rational-reductivity: Satake perverse sheaves on finite-type models are pure mixed perverse sheaves.

**API.**

- `TauCeti.EtaleDuality.MixedPerverseSheaf` (data): The full subcategory Perv_m(X₀) of Perv(X₀, ℚ̄_ℓ) of perverse sheaves whose ordinary cohomology sheaves are mixed.
- `TauCeti.EtaleDuality.mixedTStructure` (structure): The perverse t-structure restricted to D^b_m(X₀); its heart is equivalent to MixedPerverseSheaf X₀.
- `TauCeti.EtaleDuality.MixedPerverseSheaf.abelian` (instance): Perv_m(X₀) is abelian and its inclusion into Perv(X₀) is exact.
- `TauCeti.EtaleDuality.MixedPerverseSheaf.of_subquotient` (characterisation): A subobject or quotient in Perv(X₀) of a mixed perverse sheaf is mixed (BBD 5.1.7(ii)).
- `TauCeti.EtaleDuality.MixedPerverseSheaf.of_extension` (characterisation): An extension in Perv(X₀) of mixed perverse sheaves is mixed.
- `TauCeti.EtaleDuality.perverseCohomology_mixed` (functoriality): For K₀ mixed, every pH^i(K₀) is mixed perverse.
- `TauCeti.EtaleDuality.MixedPerverseSheaf.HasWeightsLE` (projection): F₀ has weights ≤ w iff its underlying complex is in D^b_{≤w}(X₀) (DWP.8/mixed-complexes).
- `TauCeti.EtaleDuality.MixedPerverseSheaf.IsPure` (projection): F₀ is pure of weight w iff it has weights ≤ w and ≥ w.
- `TauCeti.EtaleDuality.MixedPerverseSheaf.isPure_dual` (relation): D_{X₀}F₀ is mixed perverse, and F₀ pure of weight w implies D_{X₀}F₀ pure of weight −w (EDC.5/perverse-verdier-self-duality, DWP.8/directional-weight-estimates).
- `TauCeti.EtaleDuality.MixedPerverseSheaf.isPure_twist` (relation): F₀ pure of weight w implies F₀(r) pure of weight w − 2r.

**Unit tests.**

- `TauCeti.EtaleDuality.constantShift_isPure` (computation): For X₀ smooth of pure dimension d, ℚ̄_ℓ[d] is a mixed perverse sheaf, pure of weight d.
- `TauCeti.EtaleDuality.zero_isPure_all` (degenerate): The zero perverse sheaf is mixed and pure of every weight w.
- `TauCeti.EtaleDuality.mixedPerverse_point_iff` (compatibility): On X₀ = Spec 𝔽_q a perverse sheaf is a finite-dimensional Galois representation, and it is mixed iff every eigenvalue of the geometric Frobenius is a q-Weil number of some integer weight (DWP.7/weights-mixed-sheaves-definitions).
- `TauCeti.EtaleDuality.not_mixed_of_nonWeil_eigenvalue` (non-example): On Spec 𝔽_q the rank-one representation with Frobenius eigenvalue 1 + √2 is perverse but not mixed, since the conjugate 1 − √2 has a different absolute value.

**Acceptance.**

- ℚ̄_ℓ[d] on a smooth pure d-dimensional X₀ is mixed perverse and pure of weight d.
- On Spec 𝔽_q, Perv_m is the category of finite-dimensional continuous ℚ̄_ℓ-representations of Gal(𝔽̄_q/𝔽_q) whose Frobenius eigenvalues are q-Weil numbers of integer weight.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, 5.1.5–5.1.8, pp. 125–127. BBD recall punctual purity and mixedness, define D^b_m by mixed cohomology sheaves, prove that the perverse t-structure induces one on D^b_m and that subquotients of mixed perverse sheaves are mixed (Stabilités 5.1.7), and define weights ≤ w, ≥ w and purity with the shift in i (5.1.8).

**Source.** P. Deligne, *La conjecture de Weil. II*, (6.1.11) and (6.2.2)–(6.2.4), pp. 246–247. Stability of mixed complexes under the operations and the definition of complexes of weights ≤ w, ≥ w.

**Library home.** `TauCeti/AlgebraicGeometry/Etale/Perverse/Weights`, namespace `TauCeti.EtaleDuality`.

<a id="node-EDC-7-pointwise-weight-criteria"></a>

#### Weights are tested at closed points and are insensitive to finite extension of 𝔽_q

Node `EDC.7/pointwise-weight-criteria` · theorem.

Let K₀ ∈ D^b_m(X₀, ℚ̄_ℓ). (a) K₀ has weights ≤ w iff i_x^*K₀ has weights ≤ w for every closed point i_x : x → X₀; K₀ has weights ≥ w iff i_x^!K₀ has weights ≥ w for every closed point x. (b) For n ≥ 1, the pullback K₁ of K₀ to X₀ ⊗ 𝔽_{qⁿ} is mixed (resp. of weights ≤ w, ≥ w) iff K₀ is; hence weights of an object over 𝔽̄_q are defined once it descends to some 𝔽_{qⁿ}. (c) Weights are additive under external products: inf{w : K₀ ⊠ L₀ ∈ D_{≤w}} = inf{w : K₀ ∈ D_{≤w}} + inf{w : L₀ ∈ D_{≤w}}, and dually for the lower bounds.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).
- In (c), X₀ × Y₀ is the fibre product over 𝔽_q and K₀ ⊠ L₀ := pr₁^*K₀ ⊗ pr₂^*L₀.

**Construction and proof.**

- (a), first half: weights ≤ w are defined by the punctual weights of ℋ^i, i.e. by the stalks at closed points, which are the cohomology of i_x^*K₀.
- (a), second half: K₀ has weights ≥ w iff D K₀ has weights ≤ −w; apply the first half to D K₀ and use i_x^* D = D i_x^! (EDC.1:biduality/duality-exchange-isomorphisms).
- (b): the closed points of X₀ ⊗ 𝔽_{qⁿ} lie over those of X₀ and the Frobenius of the residue field of a point over x is a power of that of x; Weil q^{deg}-numbers of weight w are preserved and detected by powers.
- (c): the upper bound ≤ w + w′ is stability of ⊗ and pullback (DWP.8/directional-weight-estimates); equality is checked at closed points (a), where the stalk of K₀ ⊠ L₀ at (x, y) is the tensor product of the stalks and eigenvalue weights add; the lower bound follows by duality since ⊠ commutes with Verdier duality (EDC.1:biduality, Künneth for dualizing complexes).

**Prerequisites.** `DeligneWeightsAndPurity:DWP.8/mixed-complexes`; `DeligneWeightsAndPurity:DWP.8/pure-complexes`; `DeligneWeightsAndPurity:DWP.8/directional-weight-estimates`; `EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`; `EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`; `DeligneWeightsAndPurity:DWP.7/weights-mixed-sheaves-definitions`.

**Acceptance.**

- ℚ̄_ℓ on 𝔸¹_{𝔽_q} is pure of weight 0: at every closed point x, i_x^*ℚ̄_ℓ = ℚ̄_ℓ has weight 0 and i_x^!ℚ̄_ℓ = ℚ̄_ℓ(−1)[−2] has weight 2 − 2 = 0; its perverse shift ℚ̄_ℓ[1] is pure of weight 1.
- ℚ̄_ℓ(1) ⊠ ℚ̄_ℓ(1) on Spec 𝔽_q is ℚ̄_ℓ(2), of weight −4 = (−2) + (−2).

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Proposition 5.1.9, Remarks 5.1.10–5.1.11, p. 127; 5.1.12, p. 128; (5.1.14.1) and (5.1.14.1*), pp. 128–129. BBD test weights ≤ w by i_x^* and ≥ w by i_x^! at closed points, note invariance under finite extension of the finite field, and prove that weights add exactly under external tensor products.

<a id="node-EDC-7-weight-ext-vanishing"></a>

#### Ext-vanishing between weights

Node `EDC.7/weight-ext-vanishing` · theorem.

Let K₀, L₀ ∈ D^b_m(X₀, ℚ̄_ℓ) and w ∈ ℤ. (a) If K₀ has weights ≤ w and L₀ has weights > w (i.e. ≥ w + 1), then Ra_*RHom(K₀, L₀) ∈ D_{>0}(Spec 𝔽_q) for a : X₀ → Spec 𝔽_q, and Hom(K₀, L₀[i]) = 0 for all i > 0. (b) If K₀ has weights ≤ w and L₀ has weights ≥ w, then F has no invariants on Hom(K, L[i]) for i > 0, so the restriction Hom(K₀, L₀[i]) → Hom(K, L[i]) is zero for i > 0, and Hom(K₀, L₀[i]) = 0 for i ≥ 2. (c) In particular, for mixed perverse K₀ of weights ≤ w and L₀ of weights > w: Hom(K₀, L₀) = 0 and Ext¹_{Perv(X₀)}(K₀, L₀) = 0; for simple mixed perverse U₀, V₀ pure of weights u > v, Ext¹(V₀, U₀) = 0.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).

**Construction and proof.**

- RHom(K₀, L₀) has weights ≥ (w+1) − w = 1 by DWP.8/directional-weight-estimates (v), and Ra_* preserves lower bounds (ii); so Ra_*RHom ∈ D_{≥1} = D_{>0}, giving (a) first part (BBD 5.1.15(i)).
- On Spec 𝔽_q, a complex of weights > 0 has H^i of weights > i ≥ 0 for i ≥ 0, so Frobenius has no eigenvalue 1: invariants and coinvariants of Hom^i(K, L) vanish for i ≥ 0.
- Insert into the exact sequences of EDC.7/frobenius-descent-of-perverse-sheaves: Hom^i(K₀, L₀) = 0 for i > 0, which is (a) (BBD 5.1.15(ii)).
- With weights ≥ w for L₀, Hom^i(K, L) has weights ≥ i, hence > 0 for i ≥ 1: invariants vanish for i > 0 and coinvariants vanish for i ≥ 1, giving (b) (BBD 5.1.15(iii)).
- (c): for perverse K₀, L₀, Hom^0 = Hom(K, L)^F with weights > 0 has no invariants; Ext¹ in Perv is Hom^1 (EDC.5/heart-abelian-subcategory). The simple pure case is the instance used in BBD 5.3.5.

**Prerequisites.** [`EDC.7/frobenius-descent-of-perverse-sheaves`](#node-EDC-7-frobenius-descent-of-perverse-sheaves); [`EDC.7/mixed-perverse-sheaves`](#node-EDC-7-mixed-perverse-sheaves); `DeligneWeightsAndPurity:DWP.8/directional-weight-estimates`; `EtaleDualityAndPerverseSheaves:EDC.5/heart-abelian-subcategory`; `DeligneWeightsAndPurity:DWP.8/pure-complexes`.

**Acceptance.**

- K₀ = ℚ̄_ℓ, L₀ = ℚ̄_ℓ(−1) on Spec 𝔽_q (weights 0 and 2): Hom^i(K₀, L₀) = 0 for all i, since Frobenius acts by q ≠ 1.
- Sharpness of the strict inequality: K₀ = L₀ = ℚ̄_ℓ on Spec 𝔽_q (both of weight 0) has Ext¹(K₀, L₀) = ℚ̄_ℓ ≠ 0, realised by the unipotent rank-two sheaf E₂.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Proposition 5.1.15 (i)–(iii) and its proof, p. 129 (checked on the page image). BBD: for K₀ of weights ≤ w and L₀ of weights > w, Ra_*RHom is in D_{>0} and Hom^i vanishes for i > 0; for L₀ of weights ≥ w the Frobenius invariants of Hom^i(K, L) vanish for i > 0, so the restriction maps are zero.


### Weights of perverse sheaves and intersection complexes

Lower weights of a mixed perverse sheaf are detected by H⁰ on affine étale opens; this gives stability of weight bounds under subquotients, hence purity of intermediate extensions along affine immersions and purity of intersection complexes, and purity of simple mixed perverse sheaves.

<a id="node-EDC-7-affine-cohomology-weight-criterion"></a>

#### Lower weights of a mixed perverse sheaf are detected by H⁰ on affine étale opens

Node `EDC.7/affine-cohomology-weight-criterion` · theorem.

A mixed perverse sheaf F₀ on X₀ has weights ≥ w iff for every affine étale map u : U₀ → X₀ the Frobenius module H⁰(U, u^*F) (hypercohomology of the pullback over 𝔽̄_q, with U₀ defined over a finite extension 𝔽_{qⁿ} as allowed by EDC.7/pointwise-weight-criteria (b)) has weights ≥ w.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).
- U₀ → X₀ étale with U₀ affine; H⁰ is hypercohomology of the complex u^*F over 𝔽̄_q.

**Construction and proof.**

- Necessity: u^! = u^* for étale u preserves weights ≥ w, and RΓ = Ra_* preserves lower bounds (DWP.8/directional-weight-estimates (ii)); H⁰ of a complex of weights ≥ w has weights ≥ w.
- Sufficiency on a smooth connected curve (BBD 5.2.2): filter F₀ by simple perverse constituents, which are (j_*L₀)[1] = j_!*(L₀[1]) for irreducible lisse L₀ or punctual; both are pure; count dimensions of H^{−1} and H⁰ on affine opens with many points over a closed point to exclude constituents of small weight.
- General case (BBD 5.2.3–5.2.8): by restriction to curves through general points and noetherian induction, using the largest perverse subsheaf with punctual support and its weight, and the exact sequences of perverse cohomology on affine opens (EDC.5/perverse-artin-vanishing).
- The weights of H⁰(U, F) are those of the Frobenius of 𝔽_{qⁿ} acting by transport of structure (BBD 5.1.11–5.1.12).

**Prerequisites.** [`EDC.7/mixed-perverse-sheaves`](#node-EDC-7-mixed-perverse-sheaves); [`EDC.7/pointwise-weight-criteria`](#node-EDC-7-pointwise-weight-criteria); `DeligneWeightsAndPurity:DWP.8/directional-weight-estimates`; `EtaleDualityAndPerverseSheaves:EDC.5/perverse-artin-vanishing`; `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves-classification`; `DeligneWeightsAndPurity:DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`.

**Acceptance.**

- F₀ = ℚ̄_ℓ[1] on 𝔾_{m,𝔽_q}: H⁰(𝔾_m, ℚ̄_ℓ[1]) = H¹(𝔾_m, ℚ̄_ℓ) = ℚ̄_ℓ(−1) has weight 2 ≥ 1, consistent with weights ≥ 1, while H^{−1} = H⁰(𝔾_m) has weight 0 < 1 and is not tested.
- A punctual perverse sheaf ℚ̄_ℓ(1) at a rational point has H⁰ = ℚ̄_ℓ(1) of weight −2 on every affine étale neighbourhood, so it does not have weights ≥ −1.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Théorème 5.2.1 and its proof 5.2.2–5.2.8, pp. 129–134. BBD characterise lower weights of a mixed perverse sheaf by the weights of H⁰(U, F) on affine étale U, first on smooth curves and then in general.

<a id="node-EDC-7-subquotient-weight-stability"></a>

#### Subquotients of mixed perverse sheaves keep their weight bounds

Node `EDC.7/subquotient-weight-stability` · theorem.

If a mixed perverse sheaf F₀ has weights ≥ w (resp. ≤ w), every subquotient of F₀ in Perv(X₀) has weights ≥ w (resp. ≤ w).

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).

**Construction and proof.**

- (a), quotients: reduce to w = 0 by twist; for a quotient G₀ of F₀ and affine étale U, H⁰(U, G) is a quotient of H⁰(U, F) (EDC.5/perverse-artin-vanishing gives H¹ of perverse sheaves on affines zero), so has weights ≥ 0, and EDC.7/affine-cohomology-weight-criterion applies.
- (a), subobjects: the sequence H^{−1}(U, F/G) → H⁰(U, G) → H⁰(U, F) gives weights ≥ −1 for G; pass to G ⊠ G ⊂ F ⊠ F on X₀ × X₀ and use additivity (EDC.7/pointwise-weight-criteria (c)) to get weights ≥ −1/2, hence ≥ 0 since weights are integers. The upper bounds follow by duality (BBD 5.3.1).

**Prerequisites.** [`EDC.7/affine-cohomology-weight-criterion`](#node-EDC-7-affine-cohomology-weight-criterion); [`EDC.7/pointwise-weight-criteria`](#node-EDC-7-pointwise-weight-criteria); `EtaleDualityAndPerverseSheaves:EDC.5/perverse-artin-vanishing`; `EtaleDualityAndPerverseSheaves:EDC.5/perverse-verdier-self-duality`; `DeligneWeightsAndPurity:DWP.8/directional-weight-estimates`.

**Acceptance.**

- On Spec 𝔽_q the unipotent rank-two sheaf E₂ (Frobenius a single Jordan block with eigenvalue 1) is pure of weight 0, and its unique rank-one subobject and quotient ℚ̄_ℓ are pure of weight 0.
- On Spec 𝔽_q, ℚ̄_ℓ ⊕ ℚ̄_ℓ(−1) has weights ≤ 2 and ≥ 0; its quotient ℚ̄_ℓ(−1) has weight 2 ≤ 2 and its subobject ℚ̄_ℓ has weight 0 ≥ 0, while neither bound can be improved for the sum.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Proposition 5.3.1, p. 134. BBD show that subquotients of a mixed perverse sheaf of weights ≥ w (≤ w) keep the bound, via H⁰ on affines, the external-square trick and integrality of weights, and obtain the upper bound by duality.

<a id="node-EDC-7-intersection-complex-purity"></a>

#### Intermediate extension along an affine immersion preserves weights; purity of IC

Node `EDC.7/intersection-complex-purity` · theorem. Planet: Purity of intersection complexes.

(a) Let j : U₀ ↪ X₀ be an affine locally closed immersion and F₀ a mixed perverse sheaf on U₀. If F₀ has weights ≤ w (resp. ≥ w), so does j_!*F₀; if F₀ is pure of weight w, j_!*F₀ is pure of weight w. (b) Let X₀ be irreducible of dimension d, U₀ ⊂ X₀ a dense open subscheme smooth over 𝔽_q and L₀ a lisse ℚ̄_ℓ-sheaf on U₀ punctually pure of weight w. Then the intersection complex IC_{X₀}(L₀) = j_!*(L₀[d]) of EDC.5/intersection-complex-of-local-system is a pure perverse sheaf of weight w + d; in particular IC_{X₀} := IC_{X₀}(ℚ̄_ℓ) is pure of weight d. (c) Consequently, for X₀ proper over 𝔽_q, the intersection cohomology H^i(X, IC_X(L)) is pure of weight w + d + i for every i.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).
- (a): j affine (j_! and Rj_* are then t-exact for the perverse t-structure). (b): the shift is the perverse normalisation L₀[d]; no Tate half-twist is built in.

**Construction and proof.**

- (a) Since j is affine and quasi-finite, j_!F₀ and Rj_*F₀ are perverse (EDC.5/perverse-artin-vanishing, BBD 4.1.3).
- If F₀ has weights ≤ w, j_!F₀ has weights ≤ w (DWP.8/directional-weight-estimates (i)); j_!*F₀ is the image of j_!F₀ → Rj_*F₀, a quotient of j_!F₀ in Perv(X₀), so it has weights ≤ w by EDC.7/subquotient-weight-stability.
- Dually, if F₀ has weights ≥ w, Rj_*F₀ has weights ≥ w and its subobject j_!*F₀ has weights ≥ w; combining both gives purity (BBD 5.3.2, first proof).
- (b) L₀[d] is pure of weight w + d on the smooth U₀ (DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5 (c)) and perverse (EDC.5/shifted-local-systems-perverse). Shrink U₀ to an affine dense open (IC is independent of the dense open, EDC.5/intersection-complex-of-local-system); a morphism from an affine scheme to the separated X₀ is affine, so U₀ ↪ X₀ is an affine immersion; apply (a).
- (c) Proper pushforward to Spec 𝔽_q preserves purity (DWP.8/proper-direct-image-preserves-purity-6-2-6): RΓ(X, IC) is pure of weight w + d, so H^i is pure of weight w + d + i.

**Prerequisites.** `EtaleDualityAndPerverseSheaves:EDC.5/perverse-artin-vanishing`; `DeligneWeightsAndPurity:DWP.8/directional-weight-estimates`; [`EDC.7/subquotient-weight-stability`](#node-EDC-7-subquotient-weight-stability); `DeligneWeightsAndPurity:DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`; `EtaleDualityAndPerverseSheaves:EDC.5/shifted-local-systems-perverse`; `EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex-of-local-system`; `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension`; [`EDC.7/pointwise-weight-criteria`](#node-EDC-7-pointwise-weight-criteria); `DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6`; [`EDC.7/mixed-perverse-sheaves`](#node-EDC-7-mixed-perverse-sheaves).

**Acceptance.**

- For a smooth projective curve C₀ and L₀ = ℚ̄_ℓ: IC = ℚ̄_ℓ[1], pure of weight 1, and H^i(C, ℚ̄_ℓ[1]) = H^{i+1}(C, ℚ̄_ℓ) is pure of weight i + 1.
- For the nodal cubic X₀ with normalisation ν : ℙ¹ → X₀ (ν finite birational), IC_{X₀} = ν_*ℚ̄_ℓ[1], so IH^0(X) = H¹(ℙ¹) = 0 although H¹(X, ℚ̄_ℓ) = ℚ̄_ℓ has weight 0: the constant sheaf ℚ̄_ℓ[1] on X₀ is not pure of weight 1.
- The specialisation X₀ smooth projective of dimension d gives IC = ℚ̄_ℓ[d] and recovers purity of H^i(X, ℚ̄_ℓ) of weight i (DeligneWeightsAndPurity:DWP.7, Weil II 3.3.9).

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Corollaire 5.3.2 with its first proof, p. 135. BBD prove that for an affine immersion j the intermediate extension of a mixed perverse sheaf of weights ≤ w (≥ w) keeps the bound, so pure goes to pure of the same weight, via perversity of j_! and the quotient j_!F → j_!*F.

**Source.** P. Deligne, *La conjecture de Weil. II*, (6.2.5) c), p. 248; (6.2.6), p. 248. Shifted lisse pure sheaves on smooth schemes are pure, and proper direct images preserve purity.

<a id="node-EDC-7-simple-mixed-perverse-is-pure"></a>

#### Simple mixed perverse sheaves are pure

Node `EDC.7/simple-mixed-perverse-is-pure` · theorem.

Every simple object of Perv_m(X₀) is pure: it is isomorphic to i_*j_!*(L₀[d]) for i the closure of a smooth connected locally closed U₀ ⊂ X₀ of dimension d, j : U₀ ↪ Ū₀ open and L₀ an irreducible lisse ℚ̄_ℓ-sheaf on U₀ punctually pure of some integer weight β, and it is pure of weight β + d.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).

**Construction and proof.**

- A simple mixed perverse sheaf is simple in Perv(X₀) (EDC.7/mixed-perverse-sheaves: subobjects of mixed are mixed), so it is i_*j_!*(L₀[d]) with L₀ irreducible lisse on a smooth connected U₀ (EDC.5/simple-perverse-sheaves-classification, applied to arithmetic objects through EDC.7/frobenius-descent-of-perverse-sheaves).
- Shrink U₀ (allowed, EDC.5/intersection-complex-of-local-system): L₀ is mixed and irreducible, so its weight filtration by lisse subsheaves (DWP.7/weights-mixed-sheaves-definitions; Weil II 3.4.1(ii)) has a single step and L₀ is punctually pure.
- Take U₀ affine and apply EDC.7/intersection-complex-purity (BBD 5.3.4).

**Prerequisites.** [`EDC.7/mixed-perverse-sheaves`](#node-EDC-7-mixed-perverse-sheaves); `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves-classification`; [`EDC.7/frobenius-descent-of-perverse-sheaves`](#node-EDC-7-frobenius-descent-of-perverse-sheaves); `EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex-of-local-system`; `DeligneWeightsAndPurity:DWP.7/weights-mixed-sheaves-definitions`; [`EDC.7/intersection-complex-purity`](#node-EDC-7-intersection-complex-purity).

**Acceptance.**

- The punctual simple perverse sheaf ℚ̄_ℓ(r) at a closed point is pure of weight −2r.
- On Spec 𝔽_q a simple mixed perverse sheaf is a one-dimensional continuous ℚ̄_ℓ-representation whose Frobenius eigenvalue is a q-Weil number of some integer weight β, and it is pure of weight β.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Corollaire 5.3.4, p. 136. BBD: every simple mixed perverse sheaf is pure, by writing it as an intermediate extension of an irreducible, hence pure, lisse sheaf on an affine smooth open.


### The weight filtration and geometric semisimplicity

Ext-vanishing from lower to higher weight and an abstract splitting lemma in finite-length abelian categories give the weight filtration; descending the socle gives geometric semisimplicity of pure perverse sheaves, with its consequences for indecomposables and for open–closed decompositions.

<a id="node-EDC-7-torsion-theory-splitting-lemma"></a>

#### Splitting lemma for a partition of simple objects with Ext¹-vanishing

Node `EDC.7/torsion-theory-splitting-lemma` · theorem.

Let A be an abelian category in which every object has finite length. Let S⁺ ⊔ S⁻ be a partition of the isomorphism classes of simple objects, and A⁺ (resp. A⁻) the full subcategory of objects all of whose simple subquotients lie in S⁺ (resp. S⁻). Assume every short exact sequence 0 → U → E → V → 0 with U ∈ S⁺ and V ∈ S⁻ splits. Then every object F has a unique subobject W F ∈ A⁻ with F / W F ∈ A⁺; Hom(A⁺, A⁻) = Hom(A⁻, A⁺) = 0 and Ext¹(A⁻, A⁺) = 0; and every morphism f : F → G satisfies f(W F) = f(F) ∩ W G.

**Hypotheses.**

- A abelian, every object of finite length (artinian and noetherian); the partition is of isomorphism classes of simple objects; Ext¹ vanishing is only required from S⁻ to S⁺.

**Construction and proof.**

- Ext¹(Y, X) = 0 for X ∈ A⁺, Y ∈ A⁻ by dévissage along composition series and the long exact Ext sequence; Hom vanishings because A⁺ and A⁻ share no simple constituents.
- Existence by induction on length: choose a simple subobject S ⊂ F and W(F/S); its preimage E is an extension of W(F/S) by S. If S ∈ S⁻ take W F = E; if S ∈ S⁺ the extension splits by Ext¹(W(F/S), S) = 0, take a lift of W(F/S).
- Uniqueness: for two candidates W′, W″ the composites W′ → F → F/W″ and W″ → F → F/W′ vanish by Hom(A⁻, A⁺) = 0.
- Strictness: both f(W F) and f(F) ∩ W G have the characteristic property of W(f(F)).

**Prerequisites.** `mathlib:CategoryTheory.Abelian`; `mathlib:CategoryTheory.Simple`; `mathlib:CategoryTheory.IsArtinianObject`; `mathlib:CategoryTheory.IsNoetherianObject`.

**Acceptance.**

- A = finite-dimensional representations of ℤ over ℚ̄_ℓ on which the generator acts with eigenvalues in {1, q}, S⁻ = {eigenvalue 1}, S⁺ = {eigenvalue q}: W F is the generalized 1-eigenspace and the splitting is the generalized eigenspace decomposition.
- Without the Ext¹ hypothesis the conclusion fails: for finite-dimensional representations of the quiver 1 → 2 over a field, the indecomposable projective P₁ is a non-split extension of S₁ by S₂; with S⁻ = {S₁} and S⁺ = {S₂}, its subobjects are 0, S₂ and P₁, and none lies in A⁻ with quotient in A⁺.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Lemme 5.3.6 and its proof, p. 137. BBD's abstract lemma: in a finite-length abelian category with a partition of simples and vanishing Ext¹ from the second class to the first, each object has a unique subobject in A⁻ with quotient in A⁺, functorial and strict.

<a id="node-EDC-7-weight-filtration"></a>

#### The weight filtration of a mixed perverse sheaf

Node `EDC.7/weight-filtration` · construction. Planet: Weight filtration of mixed perverse sheaves.

Every mixed perverse sheaf F₀ on X₀ has a unique finite increasing filtration W = (W_i F₀)_{i ∈ ℤ} by perverse subsheaves, with W_i F₀ = 0 for i ≪ 0 and W_i F₀ = F₀ for i ≫ 0, such that Gr^W_i F₀ := W_i F₀ / W_{i−1} F₀ is pure of weight i for every i. W_i F₀ is the largest perverse subsheaf of weights ≤ i, and F₀ / W_i F₀ has weights > i. Every morphism f : F₀ → G₀ of mixed perverse sheaves is strictly compatible: f(W_i F₀) = f(F₀) ∩ W_i G₀. The filtration is an arithmetic object on X₀; after base change to 𝔽̄_q it need not split Frobenius-equivariantly, although each graded piece becomes semisimple (EDC.7/pure-perverse-geometric-semisimplicity).

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).
- Weights are integers (mixed in the sense of DWP.7, not ι-mixed with real weights); for ι-mixed objects BBD 5.3.5 applies to the weight-class decomposition modulo ℤ first.

**Construction and proof.**

- Perv_m(X₀) is abelian with all objects of finite length (EDC.7/mixed-perverse-sheaves, EDC.5/simple-perverse-sheaves-classification), and simple objects are pure (EDC.7/simple-mixed-perverse-is-pure).
- For each i, partition the simple classes into S⁺ (weight > i) and S⁻ (weight ≤ i); Ext¹(V, U) = 0 for U ∈ S⁺, V ∈ S⁻ by EDC.7/weight-ext-vanishing (c).
- EDC.7/torsion-theory-splitting-lemma gives the unique W_i F₀ with constituents of weight ≤ i and quotient with constituents of weight > i, and strictness.
- An object of A⁻ has weights ≤ i (weights ≤ i are stable under extensions, DWP.8/mixed-complexes) and conversely constituents of an object of weights ≤ i have weights ≤ i (EDC.7/subquotient-weight-stability); so W_i F₀ is the largest subobject of weights ≤ i and Gr^W_i is pure of weight i (BBD 5.3.5).

**Prerequisites.** [`EDC.7/mixed-perverse-sheaves`](#node-EDC-7-mixed-perverse-sheaves); `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves-classification`; [`EDC.7/simple-mixed-perverse-is-pure`](#node-EDC-7-simple-mixed-perverse-is-pure); [`EDC.7/weight-ext-vanishing`](#node-EDC-7-weight-ext-vanishing); [`EDC.7/torsion-theory-splitting-lemma`](#node-EDC-7-torsion-theory-splitting-lemma); [`EDC.7/subquotient-weight-stability`](#node-EDC-7-subquotient-weight-stability); `DeligneWeightsAndPurity:DWP.8/mixed-complexes`; `EtaleDualityAndPerverseSheaves:EDC.5/perverse-verdier-self-duality`.

**Uses.**

- BBD 5.3.7 and 5.3.8: the generic weight criterion and geometric semisimplicity use a simple quotient of maximal weight provided by W.
- Yun–Zhang II §3.5, (3.37)–(3.38): W_{≤0} of cohomology of a filtered perverse sheaf is used to cut long exact sequences by weight.
- GeometricSatakeAndFusion:GS4:rational-reductivity: pure Satake objects have a one-step weight filtration, so semisimplicity applies directly.

**API.**

- `TauCeti.EtaleDuality.weightFiltration` (constructor): For a mixed perverse sheaf F₀ and i ∈ ℤ, the perverse subsheaf W_i F₀ ⊆ F₀.
- `TauCeti.EtaleDuality.weightFiltration_mono` (structure): W_i F₀ ≤ W_{i+1} F₀ as subobjects.
- `TauCeti.EtaleDuality.weightFiltration_eq_bot` (structure): There is N with W_i F₀ = 0 for i < −N and W_i F₀ = F₀ for i > N.
- `TauCeti.EtaleDuality.weightGraded_isPure` (characterisation): W_i F₀ / W_{i−1} F₀ is pure of weight i.
- `TauCeti.EtaleDuality.weightFiltration_unique` (extensionality): Any finite increasing filtration by perverse subsheaves with pure graded pieces of weights i equals W.
- `TauCeti.EtaleDuality.weightFiltration_strict` (functoriality): For f : F₀ → G₀, f(W_i F₀) = f(F₀) ∩ W_i G₀; in particular f maps W_i into W_i.
- `TauCeti.EtaleDuality.weightFiltration_eq_largest` (characterisation): W_i F₀ is the largest perverse subsheaf of F₀ having weights ≤ i.
- `TauCeti.EtaleDuality.weightFiltration_dual` (relation): D(W_i F₀) is identified with the quotient D F₀ / W_{−i−1} D F₀ (duality exchanges weights i and −i).

**Unit tests.**

- `TauCeti.EtaleDuality.weightFiltration_pure` (degenerate): If F₀ is pure of weight w then W_i F₀ = 0 for i < w and W_i F₀ = F₀ for i ≥ w.
- `TauCeti.EtaleDuality.weightFiltration_jstar_Gm` (computation): For j : 𝔾_m ↪ 𝔸¹ over 𝔽_q, W_1(Rj_*ℚ̄_ℓ[1]) = ℚ̄_ℓ,𝔸¹[1] and Gr^W_2(Rj_*ℚ̄_ℓ[1]) ≅ δ₀(−1).
- `TauCeti.EtaleDuality.weightFiltration_point` (compatibility): On Spec 𝔽_q, W_i of a mixed representation V is the sum of the generalized Frobenius eigenspaces with eigenvalues of weight ≤ i, which is the weight filtration of DeligneWeightsAndPurity:DWP.8/punctual-weight-filtration-3-4-1-ii for lisse sheaves on a point.
- `TauCeti.EtaleDuality.weightFiltration_not_split_geometrically_trivial` (non-example): The weight filtration is not a direct-sum decomposition in Perv(X₀) in general: the extension in weightFiltration_jstar_Gm is non-split, since Hom(δ₀(−1), Rj_*ℚ̄_ℓ[1]) = 0.

**Acceptance.**

- For F₀ pure of weight w: W_{w−1}F₀ = 0 and W_w F₀ = F₀.
- On 𝔾_{m,𝔽_q} with j : 𝔾_m ↪ 𝔸¹, the perverse sheaf Rj_*ℚ̄_ℓ[1] sits in 0 → ℚ̄_ℓ,𝔸¹[1] → Rj_*ℚ̄_ℓ[1] → δ₀(−1) → 0; its weight filtration has Gr_1 = ℚ̄_ℓ[1] and Gr_2 = δ₀(−1), the punctual sheaf at 0 of weight 2.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Théorème 5.3.5 and its proof with Lemme 5.3.6, pp. 136–137. BBD construct the unique finite increasing weight filtration with pure graded pieces and prove strict compatibility of morphisms, from Ext¹-vanishing between simple pure objects of decreasing weight and the abstract splitting lemma.

**Library home.** `TauCeti/AlgebraicGeometry/Etale/Perverse/Weights`, namespace `TauCeti.EtaleDuality`.

<a id="node-EDC-7-generic-weight-criterion"></a>

#### Upper weights of a mixed perverse sheaf are detected generically on closed subvarieties

Node `EDC.7/generic-weight-criterion` · theorem.

A mixed perverse sheaf F₀ on X₀ has weights ≤ w iff every irreducible closed subscheme Y₀ ⊆ X₀, of dimension d, has a dense open U₀ ⊆ Y₀ on which the ordinary cohomology sheaf ℋ^{−d}(F₀)|_{U₀} has punctual weights ≤ w − d.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).

**Construction and proof.**

- Necessity: weights ≤ w means ℋ^{−d} has punctual weights ≤ w − d everywhere.
- Sufficiency: otherwise, by EDC.7/weight-filtration, F₀ has a simple quotient G₀ pure of weight w′ > w, of the form j_!*(L₀[d]) on a smooth affine connected U₀ ⊂ Y₀ with L₀ punctually pure of weight w′ − d (EDC.7/simple-mixed-perverse-is-pure).
- The long exact cohomology sequence of 0 → Ker → F₀ → G₀ → 0 gives, on a dense open of Y₀, a surjection ℋ^{−d}(F₀) → ℋ^{−d}(G₀) = L₀ (degree −d is the top degree there by the perverse stalk bounds, EDC.5/middle-perverse-t-structure); so L₀ has weights ≤ w − d, contradicting w′ > w (BBD 5.3.7).

**Prerequisites.** [`EDC.7/weight-filtration`](#node-EDC-7-weight-filtration); [`EDC.7/simple-mixed-perverse-is-pure`](#node-EDC-7-simple-mixed-perverse-is-pure); `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`; `DeligneWeightsAndPurity:DWP.8/mixed-complexes`.

**Acceptance.**

- For F₀ = ℚ̄_ℓ[1] ⊕ δ₀(−1) on 𝔸¹: on Y₀ = 𝔸¹ the generic sheaf ℋ^{−1} = ℚ̄_ℓ has weight 0 ≤ w − 1 iff w ≥ 1, and on Y₀ = {0} the sheaf ℋ^0 contains ℚ̄_ℓ(−1) of weight 2 ≤ w iff w ≥ 2; so F₀ has weights ≤ 2 and not ≤ 1.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Corollaire 5.3.7 and its proof, pp. 137–138. BBD: a mixed perverse sheaf has weights ≤ w iff on a dense open of each irreducible d-dimensional closed subvariety the cohomology sheaf in degree −d has punctual weights ≤ w − d.

<a id="node-EDC-7-geometrically-semisimple-perverse-sheaf"></a>

#### Semisimple and geometrically semisimple perverse sheaves

Node `EDC.7/geometrically-semisimple-perverse-sheaf` · definition.

An object of an abelian category is semisimple if it is isomorphic to a finite direct sum of simple objects. A perverse sheaf F on X (over 𝔽̄_q) is semisimple if it is semisimple in Perv(X, ℚ̄_ℓ); then F ≅ ⊕_k i_{V_k*} j_{k!*}(L_k[d_k]) with V_k smooth connected locally closed of dimension d_k and L_k irreducible lisse. A perverse sheaf F₀ on X₀ is geometrically semisimple if its pullback F to X is semisimple; a complex K₀ ∈ D^b_c(X₀, ℚ̄_ℓ) is geometrically split-semisimple if its pullback K satisfies K ≅ ⊕_i pH^i(K)[−i] with every pH^i(K) semisimple. No condition on the Frobenius structure is imposed.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).
- Semisimplicity is a property of the geometric object over 𝔽̄_q, not of F₀ in Perv(X₀); a decomposition of K is an isomorphism, not a canonical one.

**Construction and proof.**

- Finite direct sums exist in Perv(X) (an additive heart); finite length makes 'sum of simple subobjects' and 'finite direct sum of simples' agree.
- The description of simple objects is EDC.5/simple-perverse-sheaves-classification.
- For lisse sheaves on a smooth connected X₀ shifted by dim X₀, the definition agrees with geometric semisimplicity of DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity, since L ↦ L[d] is an exact fully faithful embedding of lisse sheaves into Perv(X) whose essential image is closed under subquotients on smooth X.

**Prerequisites.** `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves-classification`; `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category`; `DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity`; `EtaleDualityAndPerverseSheaves:EDC.5/heart-abelian-subcategory`; `mathlib:CategoryTheory.Simple`; `mathlib:CategoryTheory.Limits.HasFiniteBiproducts`; `mathlib:IsSemisimpleModule`.

**Uses.**

- BBD 5.3.8, 5.4.5: the conclusion of the decomposition theorem is geometric split-semisimplicity.
- GeometricSatakeAndFusion:GS4:rational-reductivity: semisimplicity of the Satake category over 𝔽̄_q, used to show the Tannakian group is reductive.
- EndoscopicTransferAndUnitaryTraceComparison:ET.2b: the Hitchin direct image over the elliptic locus is a direct sum of shifted simple perverse sheaves whose supports are then studied.
- Yun–Zhang II §7.1, Proposition 7.1: endomorphisms of a middle-extension direct image are determined on a dense open.

**API.**

- `TauCeti.EtaleDuality.IsSemisimpleObject` (data): In an abelian category with finite biproducts: X is isomorphic to a finite biproduct of simple objects.
- `TauCeti.EtaleDuality.IsSemisimpleObject.biprod` (structure): Finite biproducts of semisimple objects are semisimple.
- `TauCeti.EtaleDuality.IsSemisimpleObject.of_mono` (structure): In a finite-length abelian category, a subobject (and a quotient) of a semisimple object is semisimple and is a direct summand.
- `TauCeti.EtaleDuality.isSemisimpleObject_iff_socle` (characterisation): A finite-length object is semisimple iff it equals the sum of its simple subobjects (its socle).
- `TauCeti.EtaleDuality.IsGeometricallySemisimple` (data): F₀ ∈ Perv(X₀) is geometrically semisimple iff its pullback to X is IsSemisimpleObject in Perv(X, ℚ̄_ℓ).
- `TauCeti.EtaleDuality.IsGeometricallySplitSemisimple` (data): K₀ is geometrically split-semisimple iff over 𝔽̄_q there is an isomorphism K ≅ ⊕_i pH^i(K)[−i] (finite sum) and each pH^i(K) is semisimple.
- `TauCeti.EtaleDuality.isGeometricallySemisimple_lisse_iff` (compatibility): For X₀ smooth connected of dimension d and L₀ lisse, L₀[d] is geometrically semisimple iff L₀ is geometrically semisimple in the sense of DWP.8/geometric-semisimplicity.
- `TauCeti.EtaleDuality.IsGeometricallySemisimple.baseChange` (functoriality): Geometric semisimplicity is invariant under extension of 𝔽_q to 𝔽_{qⁿ} and of E to E′.

**Unit tests.**

- `TauCeti.EtaleDuality.isSemisimpleObject_zero` (degenerate): The zero object is semisimple (the empty biproduct).
- `TauCeti.EtaleDuality.isSemisimpleObject_moduleCat_field` (compatibility): For a field K, every finite-dimensional object of ModuleCat K is IsSemisimpleObject, agreeing with Mathlib's IsSemisimpleModule.
- `TauCeti.EtaleDuality.not_isSemisimpleObject_unipotent` (non-example): The ℚ̄_ℓ[ℤ]-module ℚ̄_ℓ² on which 1 acts by the unipotent Jordan block is not semisimple in finite-dimensional ℤ-representations: its unique simple subobject has no complement.
- `TauCeti.EtaleDuality.E2_isGeometricallySemisimple` (computation): The rank-two unipotent sheaf E₂ on Spec 𝔽_q is geometrically semisimple, and its arithmetic object is not semisimple in Perv(Spec 𝔽_q).

**Acceptance.**

- The constant sheaf ℚ̄_ℓ[d] on a smooth connected X₀ is geometrically semisimple (it is simple over 𝔽̄_q).
- The arithmetic sheaf E₂ (unipotent Frobenius) on Spec 𝔽_q is geometrically semisimple (over 𝔽̄_q it is ℚ̄_ℓ²) but not semisimple in Perv(Spec 𝔽_q).

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Théorème 5.3.8 (statement), p. 138; 6.2.4 (the notion 'semi-simple' for complexes), p. 163. BBD's conclusion that F over 𝔽̄_q is a direct sum of simple perverse sheaves j_!*L[d], and their definition of a semisimple complex as the sum of its shifted semisimple perverse cohomology sheaves.

**Library home.** `TauCeti/AlgebraicGeometry/Etale/Perverse/Weights`, namespace `TauCeti.EtaleDuality`.

<a id="node-EDC-7-pure-perverse-geometric-semisimplicity"></a>

#### Pure perverse sheaves are geometrically semisimple

Node `EDC.7/pure-perverse-geometric-semisimplicity` · theorem. Planet: Geometric semisimplicity of pure perverse sheaves.

If F₀ is a pure perverse sheaf on X₀ (of some weight w), then F₀ is geometrically semisimple: over 𝔽̄_q, F is a finite direct sum of simple perverse sheaves i_*j_!*(L[d]) with L irreducible lisse on smooth connected U ⊂ X of dimension d. Neither F₀ in Perv(X₀) nor the Frobenius action is asserted semisimple.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).
- Purity of the arithmetic object F₀ is the hypothesis; a perverse sheaf over 𝔽̄_q with no pure model is not covered.

**Construction and proof.**

- Let F′ ⊆ F be the socle (sum of simple perverse subsheaves); it is Frobenius-stable, so it descends to F′₀ ⊆ F₀ (EDC.7/frobenius-descent-of-perverse-sheaves, stability under subquotients).
- F′₀ and F″₀ := F₀ / F′₀ are pure of weight w (EDC.7/subquotient-weight-stability).
- The class of 0 → F′₀ → F₀ → F″₀ → 0 in Hom^1(F″₀, F′₀) maps to zero in Hom^1(F″, F′) (EDC.7/weight-ext-vanishing (b)), so F ≅ F′ ⊕ F″ over 𝔽̄_q.
- If F″ ≠ 0 it has a simple subobject, which lifts to a simple subobject of F not in F′, contradicting maximality; so F = F′ is semisimple (BBD 5.3.8, copying Weil II 3.4.1(iii)).

**Prerequisites.** [`EDC.7/frobenius-descent-of-perverse-sheaves`](#node-EDC-7-frobenius-descent-of-perverse-sheaves); [`EDC.7/subquotient-weight-stability`](#node-EDC-7-subquotient-weight-stability); [`EDC.7/weight-ext-vanishing`](#node-EDC-7-weight-ext-vanishing); [`EDC.7/geometrically-semisimple-perverse-sheaf`](#node-EDC-7-geometrically-semisimple-perverse-sheaf); `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves-classification`.

**Acceptance.**

- DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity-theorem-3-4-1-iii (a punctually pure lisse sheaf on a normal X₀ is geometrically semisimple) is recovered for smooth connected X₀ by applying the theorem to L₀[dim X₀].
- E₂ on Spec 𝔽_q is pure of weight 0 and geometrically semisimple, but F₀ = E₂ is not semisimple: the theorem asserts nothing about the arithmetic category.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Théorème 5.3.8 and its proof, p. 138. BBD prove that a pure perverse sheaf becomes a direct sum of simple perverse sheaves over 𝔽̄_q, by descending the socle and killing the extension class with 5.1.15(iii).

**Source.** P. Deligne, *La conjecture de Weil. II*, Théorème (3.4.1)(iii), p. 207. The lisse case on a normal base, whose proof BBD copy.

<a id="node-EDC-7-pure-indecomposables"></a>

#### Indecomposable pure perverse sheaves are Jordan blocks on simple ones

Node `EDC.7/pure-indecomposables` · theorem.

(a) The indecomposable pure perverse sheaves on X₀ with ℚ̄_ℓ coefficients are exactly S₀ ⊗ E_n with S₀ simple and n ≥ 1, where E_n is the pullback to X₀ of the rank-n sheaf on Spec 𝔽_q on which geometric Frobenius acts unipotently with one Jordan block. (b) If S₀ is simple, there are d ≥ 1 and a perverse sheaf S₁ on X₁ := X₀ ⊗ 𝔽_{q^d} such that S₀ ≅ π_*S₁ for π : X₁ → X₀, S₁ is geometrically simple (its pullback to X is simple) and S₁ is not isomorphic to any of its conjugates under Gal(𝔽_{q^d}/𝔽_q). Part (a) also holds with coefficients a finite E/ℚ_ℓ; part (b) does not in general.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).

**Construction and proof.**

- For F₀ with F semisimple (e.g. F₀ pure, EDC.7/pure-perverse-geometric-semisimplicity), decompose F into isotypic components indexed by isomorphism classes a of simple constituents; Frobenius permutes the classes, and orbits C give a decomposition F₀ = ⊕_C F₀,C descending by EDC.7/frobenius-descent-of-perverse-sheaves.
- For an orbit of length d, the a-part is defined over 𝔽_{q^d} and F₀,C ≅ π_*(F₁,a); choose φ : Fr^{d*}G_a ≅ G_a for a simple G_a; then F₁,a ≅ G_a ⊗ V_a with V_a := Hom(G_a, F_a) carrying a Frobenius.
- Indecomposability forces one orbit and a single Jordan block on V_a; rescaling φ makes it unipotent, giving S₀ ⊗ E_n with S₀ = π_*(G₁) simple (BBD 5.3.9(i)); for F₀ simple, V_a is one-dimensional, giving (b).
- With E coefficients the linear algebra of 5.3.9(i) still goes through, but the descent of a geometrically simple constituent to a finite extension may need a coefficient extension, so (b) fails as stated (BBD 5.3.10).

**Prerequisites.** [`EDC.7/pure-perverse-geometric-semisimplicity`](#node-EDC-7-pure-perverse-geometric-semisimplicity); [`EDC.7/frobenius-descent-of-perverse-sheaves`](#node-EDC-7-frobenius-descent-of-perverse-sheaves); `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves-classification`.

**Acceptance.**

- E_n on Spec 𝔽_q is pure of weight 0 and indecomposable but not simple for n ≥ 2.
- Let X₀ = Spec 𝔽_{q²}, viewed over 𝔽_q: the simple perverse sheaf ℚ̄_ℓ on X₀ pulls back to ℚ̄_ℓ ⊕ ℚ̄_ℓ on the two geometric points, so it is not geometrically simple; it is π_*S₁ for d = 2 and S₁ the constant sheaf on one of the two components of X₀ ⊗ 𝔽_{q²}, which is geometrically simple and not isomorphic to its Galois conjugate.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Proposition 5.3.9, pp. 138–139, and Remarque 5.3.10, p. 140. BBD classify indecomposable pure perverse sheaves as tensor products of simple ones with unipotent Jordan blocks, describe simple ones by induction from a finite extension, and note what survives with E_λ coefficients.

<a id="node-EDC-7-pure-open-closed-decomposition"></a>

#### A pure perverse sheaf splits into an intermediate extension and a part supported on the complement

Node `EDC.7/pure-open-closed-decomposition` · theorem.

Let F₀ be a pure perverse sheaf on X₀, j : U₀ ↪ X₀ open and i : Z₀ ↪ X₀ the complementary closed immersion. Then F₀ has a unique decomposition F₀ = j_!*F′₀ ⊕ i_*F″₀ in Perv(X₀), with F′₀ = j^*F₀; the adjunction map pj_!j^*F₀ → F₀ factors through the quotient j_!*j^*F₀ of pj_!j^*F₀, the map F₀ → pj_*j^*F₀ through the subobject j_!*j^*F₀ of pj_*j^*F₀, and the composite of adjunction maps i_* pH⁰(i^!F₀) → F₀ → i_* pH⁰(i^*F₀) is an isomorphism (both sides equal i_*F″₀).

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).
- F₀ pure; for mixed F₀ the decomposition fails (e.g. Rj_*ℚ̄_ℓ[1] on 𝔸¹).

**Construction and proof.**

- Uniqueness: Hom(j_!*F′, i_*F″) = Hom(i_*F″, j_!*F′) = 0 since j_!* has no subobject or quotient supported on Z (EDC.5/recollement-intermediate-extension).
- By EDC.7/frobenius-descent-of-perverse-sheaves it suffices to check the factorisations and that the maps are the inclusions and projections of a decomposition over 𝔽̄_q.
- Over 𝔽̄_q, F is semisimple (EDC.7/pure-perverse-geometric-semisimplicity), so it suffices to treat its simple constituents, each of the form j_!*G′ or i_*G″ (EDC.5/simple-perverse-sheaves-classification), for which the statements are immediate (BBD 5.3.11).

**Prerequisites.** [`EDC.7/pure-perverse-geometric-semisimplicity`](#node-EDC-7-pure-perverse-geometric-semisimplicity); [`EDC.7/frobenius-descent-of-perverse-sheaves`](#node-EDC-7-frobenius-descent-of-perverse-sheaves); `EtaleDualityAndPerverseSheaves:EDC.5/recollement-intermediate-extension`; `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves-classification`; `EtaleDualityAndPerverseSheaves:EDC.5/open-closed-perverse-recollement`.

**Acceptance.**

- For the mixed, not pure, perverse sheaf F₀ = Rj_*ℚ̄_ℓ[1] on 𝔸¹_{𝔽_q} with Z = {0}: i^!F₀ = 0 while pH⁰(i^*F₀) = ℚ̄_ℓ(−1) ≠ 0, so the composite in the statement is not an isomorphism, and F₀ is a non-split extension of δ₀(−1) by ℚ̄_ℓ[1]; purity is necessary.
- For F₀ = IC_{X₀} with X₀ irreducible and U₀ dense, F″₀ = 0.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Corollaire 5.3.11, p. 140 (checked on the page image). BBD: a pure perverse sheaf has a unique decomposition j_!*F′ ⊕ i_*F″, with the adjunction maps factoring through the intermediate extension and i_*pi^!F → F → i_*pi^*F an isomorphism.


### Pure complexes and the decomposition theorem over finite fields

Weights of a mixed complex are read off its perverse cohomology; the connecting maps of the perverse truncation triangles of a pure complex vanish over 𝔽̄_q, so pure complexes split into shifted semisimple perverse sheaves; proper pushforward preserves purity, which gives the decomposition theorem and its semismall form.

<a id="node-EDC-7-perverse-cohomology-weights"></a>

#### Weights of a mixed complex are read off its perverse cohomology

Node `EDC.7/perverse-cohomology-weights` · theorem.

Let K₀ ∈ D^b_m(X₀, ℚ̄_ℓ). (a) K₀ has weights ≤ w (resp. ≥ w) iff every perverse cohomology sheaf pH^i(K₀) has weights ≤ w + i (resp. ≥ w + i). (b) K₀ is pure of weight w iff every pH^i(K₀) is pure of weight w + i. (c) For f : X₀ → Y₀ of finite type and F₀ a mixed perverse sheaf of weights ≤ w, the perverse sheaves pH⁰(Rf_!F₀) and pH⁰(f^*F₀) have weights ≤ w; if F₀ has weights ≥ w, pH⁰(Rf_*F₀) and pH⁰(Rf^!F₀) have weights ≥ w.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).
- Perverse truncation and perverse cohomology are those of EDC.7/mixed-perverse-sheaves; the shift convention puts pH^i(K₀)[−i] in weights ≤ w + i − i = w when pH^i has weights ≤ w + i.

**Construction and proof.**

- Sufficiency in (a): weights ≤ w are stable under extensions in triangles (DWP.8/mixed-complexes); use the triangles (pτ_{<i}K₀, pτ_{≤i}K₀, pH^i(K₀)[−i]).
- Necessity in (a), by descending induction on i, reduced to w = 0 and showing pH⁰K₀ ≤ 0 once pH^i K₀ ≤ i for i > 0: then pτ_{>0}K₀ ≤ 0, so pτ_{≤0}K₀ ≤ 0 by the triangle; the sequence ℋ^{−d}(pτ_{<0}K₀) → ℋ^{−d}(pH⁰K₀) → ℋ^{−d+1}(pτ_{<0}K₀) and the vanishing of the outer terms generically on each d-dimensional irreducible Y₀ give generic punctual weights ≤ −d; conclude by EDC.7/generic-weight-criterion (BBD 5.4.1). The lower-bound statement is dual.
- (b) is (a) applied to both bounds (BBD 5.4.4).
- (c): Rf_!, f^* preserve upper bounds and Rf_*, f^! lower bounds (DWP.8/directional-weight-estimates); apply (a) to the degree-0 perverse cohomology (BBD 5.4.2).

**Prerequisites.** [`EDC.7/mixed-perverse-sheaves`](#node-EDC-7-mixed-perverse-sheaves); [`EDC.7/generic-weight-criterion`](#node-EDC-7-generic-weight-criterion); `DeligneWeightsAndPurity:DWP.8/mixed-complexes`; `DeligneWeightsAndPurity:DWP.8/directional-weight-estimates`; `EtaleDualityAndPerverseSheaves:EDC.5/t-structure-cohomology`.

**Acceptance.**

- For X₀ smooth of dimension d, K₀ = ℚ̄_ℓ (weight 0): pH^d(K₀) = ℚ̄_ℓ[d] is pure of weight 0 + d, and all other pH^i vanish.
- For f : 𝔸¹_{𝔽_q} → Spec 𝔽_q and F₀ = ℚ̄_ℓ[1] (pure of weight 1): Rf_!F₀ = H²_c(𝔸¹)[−1] = ℚ̄_ℓ(−1)[−1], whose only perverse cohomology sheaf pH¹ = ℚ̄_ℓ(−1) has weight 2 = 1 + 1; by (b), Rf_!F₀ is pure of weight 1.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Théorème 5.4.1, Corollaires 5.4.2 and 5.4.4, pp. 140–142. BBD: K₀ has weights ≤ w (≥ w) iff each pH^iK₀ has weights ≤ w + i (≥ w + i); hence perverse cohomology of a pure complex is pure, and pH⁰ of f_!, f^* (f_*, f^!) preserve upper (lower) weight bounds.

<a id="node-EDC-7-quasi-finite-intermediate-extension-purity"></a>

#### Intermediate extension along a quasi-finite morphism preserves weights

Node `EDC.7/quasi-finite-intermediate-extension-purity` · theorem.

Let f : X₀ → Y₀ be quasi-finite (for example any locally closed immersion) and F₀ a mixed perverse sheaf on X₀. Define f_!*F₀ := Im(pH⁰(Rf_!F₀) → pH⁰(Rf_*F₀)). If F₀ has weights ≥ w (resp. ≤ w), so does f_!*F₀; pure perverse sheaves go to pure perverse sheaves of the same weight. For a locally closed immersion j this is the intermediate extension j_!* of EDC.5/perverse-intermediate-extension, without the affineness hypothesis of EDC.7/intersection-complex-purity.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).
- f quasi-finite and separated of finite type.

**Construction and proof.**

- pH⁰(Rf_!F₀) has weights ≤ w when F₀ does and pH⁰(Rf_*F₀) has weights ≥ w when F₀ does (EDC.7/perverse-cohomology-weights (c)).
- f_!*F₀ is a quotient of the first and a subobject of the second, so EDC.7/subquotient-weight-stability gives both bounds (BBD 5.4.3, following the first proof of 5.3.2).
- For an immersion, the image of pH⁰j_! → pH⁰j_* is j_!* (EDC.5/perverse-intermediate-extension, BBD 1.4.22).

**Prerequisites.** [`EDC.7/perverse-cohomology-weights`](#node-EDC-7-perverse-cohomology-weights); [`EDC.7/subquotient-weight-stability`](#node-EDC-7-subquotient-weight-stability); `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension`; `EtaleDualityAndPerverseSheaves:EDC.5/quasi-finite-perverse-exactness`.

**Acceptance.**

- For j : 𝔸² ∖ {0} ↪ 𝔸² (quasi-finite, not affine), Rj_*ℚ̄_ℓ[2] is not perverse (it has the cohomology sheaf δ₀(−2) in degree 1), but the image of pH⁰(Rj_!ℚ̄_ℓ[2]) → pH⁰(Rj_*ℚ̄_ℓ[2]) is j_!*ℚ̄_ℓ[2] = ℚ̄_ℓ[2], pure of weight 2.
- For f finite (e.g. a normalisation), f_!* = f_* is exact and preserves purity.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Corollaire 5.4.3, p. 142; Remarque 5.3.3, p. 136. BBD: for quasi-finite f, f_!* = Im(pf_! → pf_*) carries perverse sheaves of weights ≥ w (≤ w) to perverse sheaves of weights ≥ w (≤ w), hence pure to pure of the same weight.

<a id="node-EDC-7-pure-complex-geometric-splitting"></a>

#### Pure complexes split geometrically into shifted intersection complexes

Node `EDC.7/pure-complex-geometric-splitting` · theorem.

Let K₀ ∈ D^b_m(X₀, ℚ̄_ℓ) be pure of weight w. Then over 𝔽̄_q: (a) K ≅ ⊕_i pH^i(K)[−i] (a finite sum, isomorphism in D^b_c(X, ℚ̄_ℓ)); (b) each pH^i(K) is semisimple, being the pullback of the pure perverse sheaf pH^i(K₀) of weight w + i; (c) consequently K ≅ ⊕_k (i_{V_k*} j_{k!*}(L_k[d_k]))[n_k] for finitely many smooth connected locally closed V_k of dimension d_k, irreducible lisse L_k on V_k and integers n_k. The isomorphism in (a) is not canonical and need not be compatible with the Frobenius structure of K₀.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).
- Purity of the arithmetic complex K₀ is required; the conclusion is over 𝔽̄_q only.

**Construction and proof.**

- pH^i(K₀) is pure of weight w + i (EDC.7/perverse-cohomology-weights (b)), so pH^i(K₀)[−i] is pure of weight w and pτ_{<i}K₀ has weights ≤ w, pH^i(K₀)[−i] weights ≥ w.
- The connecting morphism of (pτ_{<i}K₀, pτ_{≤i}K₀, pH^i(K₀)[−i]) is a degree-one map from pH^i(K₀)[−i] to pτ_{<i}K₀; by EDC.7/weight-ext-vanishing (b) its image over 𝔽̄_q is zero, so pτ_{≤i}K ≅ pτ_{<i}K ⊕ pH^i(K)[−i]; induct on i (BBD 5.4.5).
- (b) is EDC.7/pure-perverse-geometric-semisimplicity; (c) combines (a), (b) and the classification of simple perverse sheaves (EDC.5/simple-perverse-sheaves-classification) (BBD 5.4.6).

**Prerequisites.** [`EDC.7/perverse-cohomology-weights`](#node-EDC-7-perverse-cohomology-weights); [`EDC.7/weight-ext-vanishing`](#node-EDC-7-weight-ext-vanishing); [`EDC.7/pure-perverse-geometric-semisimplicity`](#node-EDC-7-pure-perverse-geometric-semisimplicity); [`EDC.7/geometrically-semisimple-perverse-sheaf`](#node-EDC-7-geometrically-semisimple-perverse-sheaf); `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves-classification`; `EtaleDualityAndPerverseSheaves:EDC.5/t-structure-cohomology`.

**Acceptance.**

- For X₀ smooth projective, K₀ = Rf_*ℚ̄_ℓ for f : X₀ → Spec 𝔽_q is pure of weight 0 and the splitting is H*(X, ℚ̄_ℓ) ≅ ⊕_i H^i(X)[−i], the elementary decomposition of a complex of vector spaces.
- The split is not Frobenius-equivariant in general: E₂[0] on Spec 𝔽_q is pure of weight 0, and its geometric splitting as ℚ̄_ℓ ⊕ ℚ̄_ℓ does not descend to 𝔽_q.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Théorème 5.4.5 and Corollaire 5.4.6, p. 142. BBD: a pure complex over 𝔽_q splits over 𝔽̄_q as the sum of its shifted perverse cohomology sheaves (by 5.4.4 and 5.1.15(iii)), hence as a sum of shifted j_!*L[d] with L irreducible lisse.

<a id="node-EDC-7-decomposition-theorem"></a>

#### The decomposition theorem for proper morphisms over finite fields

Node `EDC.7/decomposition-theorem` · theorem. Planet: Decomposition theorem.

Let f₀ : X₀ → Y₀ be a proper morphism of separated schemes of finite type over 𝔽_q and K₀ ∈ D^b_m(X₀, ℚ̄_ℓ) pure of weight w (for example K₀ = IC_{X₀}(L₀) with L₀ lisse punctually pure of weight w − dim X₀ on a smooth dense open, or K₀ = ℚ̄_ℓ[dim X₀] for X₀ smooth). Then: (a) Rf₀_*K₀ is pure of weight w and each pH^i(Rf₀_*K₀) is pure of weight w + i; (b) over 𝔽̄_q, Rf_*K ≅ ⊕_i pH^i(Rf_*K)[−i]; (c) each pH^i(Rf_*K) is semisimple, a finite sum of i_{V*}j_!*(L[dim V]) with L irreducible lisse on smooth connected V ⊂ Y; (d) for Y₀ proper over 𝔽_q, H^j(Y, Rf_*K) = H^j(X, K) is pure of weight w + j. No integral or mod-ℓ decomposition, no canonical or Frobenius-compatible splitting, and no semisimplicity of the arithmetic Frobenius is asserted.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).
- f₀ proper; K₀ pure (a pure arithmetic model is part of the input).

**Construction and proof.**

- (a): proper direct image preserves purity (DWP.8/proper-direct-image-preserves-purity-6-2-6); perverse cohomology of a pure complex is pure (EDC.7/perverse-cohomology-weights (b)).
- (b), (c): apply EDC.7/pure-complex-geometric-splitting to Rf₀_*K₀.
- (d): compose with the proper structure map of Y₀ and use (a) for Y₀ → Spec 𝔽_q.
- The standard inputs IC_{X₀}(L₀) pure of weight w come from EDC.7/intersection-complex-purity.

**Prerequisites.** `DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6`; [`EDC.7/perverse-cohomology-weights`](#node-EDC-7-perverse-cohomology-weights); [`EDC.7/pure-complex-geometric-splitting`](#node-EDC-7-pure-complex-geometric-splitting); [`EDC.7/intersection-complex-purity`](#node-EDC-7-intersection-complex-purity).

**Acceptance.**

- For the blow-up π : X₀ → 𝔸²_{𝔽_q} of the origin, Rπ_*ℚ̄_ℓ[2] ≅ ℚ̄_ℓ[2] ⊕ δ₀(−1) over 𝔽̄_q, both summands pure of weight 2 (the exceptional ℙ¹ contributes H²(ℙ¹) = ℚ̄_ℓ(−1) at 0).
- For f : X₀ → Spec 𝔽_q proper and K₀ = IC_{X₀}, (d) gives purity of intersection cohomology, agreeing with EDC.7/intersection-complex-purity (c).
- The finite-type proper models and resolutions over 𝔽̄_q used by GeometricSatakeAndFusion GS3–GS4 (Zhu, proof of Lemma 2.11) and the proper Hitchin-type maps of ET.2b are instances, with the purity of their inputs established by the consumer.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Théorèmes 5.4.5–5.4.6, p. 142, with 5.1.14, p. 128. BBD's pure-complex decomposition applied to proper direct images, which preserve purity.

**Source.** P. Deligne, *La conjecture de Weil. II*, (6.2.6), p. 248. Proper direct images of pure complexes are pure.

**Source.** X. Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*, proof of Lemma 2.11, p. 26 (arXiv v3); Appendix A.3.1, pp. 54–55. Zhu applies the decomposition theorem to proper maps between finite-type models of Witt-vector affine Schubert varieties, the finite-type instance routed here (PAPER-ZHU-17/E06).

**Source.** Z. Yun, W. Zhang, *Shtukas and the Taylor expansion of L-functions (II)*, §3.5, Corollary 3.29 and (3.36)–(3.38), pp. 443–452. Yun–Zhang use that the relevant direct-image perverse sheaves are pure of weight 0 and the resulting weight splitting of cohomology sequences (PAPER-YUN-ZHANG-19/11).

<a id="node-EDC-7-semismall-decomposition"></a>

#### The decomposition theorem for semismall maps

Node `EDC.7/semismall-decomposition` · application.

Let X₀ be smooth over 𝔽_q of pure dimension n, f₀ : X₀ → Y₀ proper and surjective, and assume f is semismall: dim(X ×_Y X) ≤ n. Choose a stratification of Y₀ into smooth connected locally closed strata S₀ (defined over 𝔽_q after a finite extension) such that each R^q f_*ℚ̄_ℓ restricted to each stratum is lisse; put d_S := dim f^{−1}(y) for y ∈ S, and call S relevant if dim S + 2 d_S = n. Then Rf₀_*ℚ̄_ℓ[n] is a pure perverse sheaf of weight n, and over 𝔽̄_q there is an isomorphism Rf_*ℚ̄_ℓ[n] ≅ ⊕_{S relevant} IC_{S̄}(L_S), L_S := (R^{2d_S}f_*ℚ̄_ℓ)|_S, where L_S is the lisse sheaf whose geometric fibre at y is H^{2d_S}(f^{−1}(y)) ≅ ℚ̄_ℓ(−d_S)^{#(top-dimensional irreducible components of f^{−1}(y))}. The summand supported on S̄ (its S-isotypic part for the support decomposition) is canonically determined.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).
- X₀ smooth of pure dimension n; f₀ proper surjective and semismall; the stratification makes all R^q f_*ℚ̄_ℓ lisse on strata.

**Construction and proof.**

- Rf_*ℚ̄_ℓ[n] is perverse by the smooth-source constant-coefficient semismall criterion (the special case stated in EDC.5/semismall-pushforward-perversity; de Cataldo–Migliorini Proposition 4.2.1), and pure of weight n by DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5 (c) and DWP.8/proper-direct-image-preserves-purity-6-2-6.
- By EDC.7/pure-perverse-geometric-semisimplicity, Rf_*ℚ̄_ℓ[n] = ⊕ IC_{S̄}(M_S) over 𝔽̄_q, grouping simple constituents by the stratum of the generic point of their support, with M_S semisimple lisse on S (EDC.5/simple-perverse-sheaves-classification).
- Restrict to a stratum S: an IC_{S̄′}(M_{S′}) with S ⊂ S̄′ ∖ S′ has ℋ^j vanishing on S for j ≥ −dim S (EDC.5/perverse-intermediate-extension stalk bound), so ℋ^{−dim S}(Rf_*ℚ̄_ℓ[n])|_S = M_S.
- By proper base change the left side is R^{n−dim S}f_*ℚ̄_ℓ|_S, whose fibres are H^{n−dim S}(f^{−1}(y)); semismallness gives n − dim S ≥ 2 d_S, so it vanishes unless S is relevant, where it is the top cohomology H^{2d_S}(f^{−1}(y)) = ℚ̄_ℓ(−d_S)^{#top components} (EDC.2:trace-purity/top-degree-compact-cohomology).
- The support decomposition of a semisimple perverse sheaf is canonical (the S-part is the sum of all simple subobjects with generic support point in S).

**Prerequisites.** `EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perversity`; `EtaleDualityAndPerverseSheaves:EDC.5/small-pushforward-intersection-complex`; `DeligneWeightsAndPurity:DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5`; `DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6`; [`EDC.7/pure-perverse-geometric-semisimplicity`](#node-EDC-7-pure-perverse-geometric-semisimplicity); `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves-classification`; `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension`; `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/top-degree-compact-cohomology`; [`EDC.7/decomposition-theorem`](#node-EDC-7-decomposition-theorem).

**Acceptance.**

- For the blow-up of 𝔸² at the origin (n = 2): strata 𝔸²∖{0} (d = 0, relevant) and {0} (d = 1, 0 + 2 = 2, relevant), giving ℚ̄_ℓ[2] ⊕ δ₀(−1), matching EDC.7/decomposition-theorem's acceptance example.
- For a small map (all non-dense strata irrelevant) the formula reduces to Rf_*ℚ̄_ℓ[n] ≅ IC_Y(L) with L = f_*ℚ̄_ℓ on the dense stratum, agreeing with EDC.5/small-pushforward-intersection-complex.
- For the Springer resolution of the nilpotent cone of SL₂ (n = 2), the strata are the regular orbit (d = 0) and the origin (d = 1, relevant), giving ℚ̄_ℓ[2] ⊕ δ₀(−1) as for the A₁ surface singularity.

**Source.** M. A. de Cataldo, L. Migliorini, *The decomposition theorem, perverse sheaves and the topology of algebraic maps*, Proposition 4.2.1, Definitions 4.2.2–4.2.3, Remark 4.2.4 and Theorem 4.2.7, pp. 55–57 (arXiv v2). de Cataldo and Migliorini characterise semismall maps by perversity of f_*Q[n], define relevant strata, and state the semismall decomposition f_*Q_X[n] ≅ ⊕ IC_S(L_S) with L_S the monodromy of top-dimensional fibre components, over ℂ; the étale argument here follows the same support count.

**Source.** X. Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*, proof of Proposition 2.3, p. 21 (arXiv v3), citing Mirković–Vilonen Lemma 4.3. Semismall convolution maps on affine Grassmannians are the consumer instance (PAPER-ZHU-17/cited-MV07-semismall-perversity).


### Hard Lefschetz

Graded Lefschetz objects in an abelian category with a Tate twist carry the primitive decomposition as a formal consequence of hard Lefschetz. BBD prove relative hard Lefschetz for projective morphisms by the universal hyperplane section, purity and geometric semisimplicity; the case of a point is hard Lefschetz in intersection cohomology.

<a id="node-EDC-7-graded-lefschetz-object"></a>

#### Graded Lefschetz objects and primitive parts in an abelian category with a Tate twist

Node `EDC.7/graded-lefschetz-object` · definition.

Let A be an abelian category with an additive autoequivalence M ↦ M(1) and powers M(n), n ∈ ℤ. A graded Lefschetz object (L, η) consists of objects L^i ∈ A for i ∈ ℤ, zero outside a finite interval, and morphisms η_i : L^i → L^{i+2}(1). For r ≥ 0 its iterate η^r : L^{i} → L^{i+2r}(r) is η_{i+2r−2}(r−1) ∘ ⋯ ∘ η_i(0), with the canonical identifications (a)(b) ≅ (a+b). (L, η) satisfies hard Lefschetz if η^r : L^{−r} → L^{r}(r) is an isomorphism for every r ≥ 0. Its primitive part in degree −r ≤ 0 is the kernel P^{−r} := ker(η^{r+1} : L^{−r} → L^{r+2}(r+1)), with its inclusion into L^{−r}.

**Hypotheses.**

- A abelian; (1) an additive autoequivalence with chosen coherence isomorphisms (a)(b) ≅ (a + b); in the application A = Perv(Y₀, ℚ̄_ℓ) or Perv(Y, ℚ̄_ℓ) and (1) is the Tate twist.

**Construction and proof.**

- The iterate is defined by induction on r, composing with the twisted η and the coherence isomorphisms; hard Lefschetz and primitive parts are defined from it with Mathlib's kernels.
- Morphisms of graded Lefschetz objects are families of morphisms commuting with η; kernels of η-iterates are functorial for them.

**Prerequisites.** `mathlib:CategoryTheory.Abelian`; `mathlib:CategoryTheory.Limits.kernel`; `DeligneWeightsAndPurity:DWP.9/lefschetz-decomposition-of-a-graded-operator`; `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category`.

**Uses.**

- BBD 5.4.10: the perverse cohomology sheaves pH^i(Rf_*F₀) with η = c₁ of a relatively ample line bundle form a graded Lefschetz object in Perv(Y₀).
- EDC.7/relative-lefschetz-primitive-decomposition: primitive parts give the relative Lefschetz decomposition of perverse cohomology.
- DeligneWeightsAndPurity:DWP.9/lefschetz-decomposition-of-a-graded-operator: the vector-space case with trivial twist is DWP.9's graded operator.

**API.**

- `TauCeti.EtaleDuality.GradedLefschetz` (data): Structure: objects L i (i : ℤ), finite support, morphisms η i : L i ⟶ twist (L (i+2)) 1.
- `TauCeti.EtaleDuality.GradedLefschetz.etaPow` (constructor): The iterate η^r : L i ⟶ twist (L (i + 2r)) r, defined by recursion on r using the twist coherence.
- `TauCeti.EtaleDuality.GradedLefschetz.etaPow_zero` (simp): η^0 is the identity (up to the coherence isomorphism (0) ≅ id).
- `TauCeti.EtaleDuality.GradedLefschetz.etaPow_succ` (simp): η^{r+1} = (η_{i+2r})(r) ∘ η^r, after coherence.
- `TauCeti.EtaleDuality.GradedLefschetz.HardLefschetz` (data): For all r : ℕ, η^r : L (−r) ⟶ twist (L r) r is an isomorphism.
- `TauCeti.EtaleDuality.GradedLefschetz.primitive` (constructor): P^{−r} := kernel of η^{r+1} : L (−r) ⟶ twist (L (r+2)) (r+1), with its inclusion ι_r.
- `TauCeti.EtaleDuality.GradedLefschetz.primitive_eq_top` (characterisation): If L^{r+2} = 0 then P^{−r} = L^{−r}; in particular P^{−r} = L^{−r} for r at the end of the support.
- `TauCeti.EtaleDuality.GradedLefschetz.map` (functoriality): Morphisms of graded Lefschetz objects induce maps on primitive parts, compatibly with composition and identities.

**Unit tests.**

- `TauCeti.EtaleDuality.gradedLefschetz_zero_hardLefschetz` (degenerate): The zero graded object satisfies hard Lefschetz and has zero primitive parts.
- `TauCeti.EtaleDuality.gradedLefschetz_projectiveSpace` (computation): For L^i = ℚ̄_ℓ(−(n+i)/2) for i ≡ n mod 2, |i| ≤ n, and 0 otherwise (the cohomology of ℙⁿ shifted by n) with η the identity maps, hard Lefschetz holds and P^{−r} = L^{−n} if r = n and 0 otherwise.
- `TauCeti.EtaleDuality.gradedLefschetz_zero_eta_not_HL` (non-example): L^{−1} = L^{1} = ℚ̄_ℓ with η = 0 does not satisfy hard Lefschetz (η¹ : L^{−1} → L^{1}(1) is zero).
- `TauCeti.EtaleDuality.gradedLefschetz_vectorSpace_compat` (compatibility): For A = finite-dimensional vector spaces with trivial twist, HardLefschetz agrees with the bijectivity hypothesis of DeligneWeightsAndPurity:DWP.9/lefschetz-decomposition-of-a-graded-operator after reindexing V^j = L^{j−n}.

**Acceptance.**

- For A = finite-dimensional ℚ̄_ℓ-vector spaces with trivial twist, L^i = H^{n+i}(X) of a smooth projective n-dimensional X and η = cup product with an ample class, this is the data of DeligneWeightsAndPurity:DWP.9/lefschetz-operator, and P^{−r} is the primitive cohomology P^{n−r}.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, 5.4.10 (set-up before the theorem), p. 144. BBD iterate cup product with a relatively ample class to obtain η^n : pH^i f_*K₀ → pH^{i+2n} f_*K₀(n), the graded Lefschetz data on perverse cohomology.

**Source.** M. A. de Cataldo, L. Migliorini, *The decomposition theorem, perverse sheaves and the topology of algebraic maps*, Theorem 5.2.1, item 2 (primitive Lefschetz decomposition), pp. 81–82 (arXiv v2). The primitive spaces P^{n−r} = Ker η^{r+1} and the primitive decomposition in the vector-space case.

**Library home.** `TauCeti/CategoryTheory/Abelian/GradedLefschetz`, namespace `TauCeti.EtaleDuality`.

<a id="node-EDC-7-abstract-primitive-decomposition"></a>

#### Primitive decomposition of a graded Lefschetz object satisfying hard Lefschetz

Node `EDC.7/abstract-primitive-decomposition` · theorem.

Let (L, η) be a graded Lefschetz object in an abelian category with Tate twist (EDC.7/graded-lefschetz-object) satisfying hard Lefschetz. Then for every r ≥ 0 the map ⊕_{a ≥ 0} P^{−r−2a}(−a) → L^{−r}, given on the a-th summand by η^a composed with the primitive inclusion and the twist coherence, is an isomorphism (a finite biproduct), and for every r ≥ 0, L^{r} ≅ L^{−r}(−r) via η^r. Equivalently, in each degree n the map from the biproduct of the primitive string columns P^{−r}(−a), 0 ≤ a ≤ r, −r + 2a = n, to L^n is an isomorphism.

**Hypotheses.**

- Hard Lefschetz for all r ≥ 0; L of finite support. No splitting is assumed: the summands are the actual kernels and the maps are actual η-powers.

**Construction and proof.**

- For r ≥ 0, η : L^{−r−2} → L^{−r}(1) is a monomorphism, since η^{r+1} ∘ η = η^{r+2} is an isomorphism on L^{−r−2}.
- The endomorphism p := η ∘ (η^{r+2})^{−1}(−1) ∘ η^{r+1} of L^{−r} (with twists) is an idempotent with image η(L^{−r−2})(−1) and kernel P^{−r}; hence L^{−r} = P^{−r} ⊕ η L^{−r−2}(−1).
- Iterate (induction on the length of the support) to obtain the full string decomposition; positive degrees follow from the isomorphisms η^r.

**Prerequisites.** [`EDC.7/graded-lefschetz-object`](#node-EDC-7-graded-lefschetz-object); `DeligneWeightsAndPurity:DWP.9/lefschetz-decomposition-of-a-graded-operator`.

**Acceptance.**

- For ℙ¹ (n = 1): L^{−1} = ℚ̄_ℓ, L^{1} = ℚ̄_ℓ(−1), P^{−1} = L^{−1}; the decomposition is L^{−1} = P^{−1}, L^{1} = ηP^{−1}.
- In the vector-space case the statement is DeligneWeightsAndPurity:DWP.9/lefschetz-decomposition-of-a-graded-operator (i)–(ii), including dim P^{n−r} = dim V^{n−r} − dim V^{n−r−2}.

**Source.** M. A. de Cataldo, L. Migliorini, *The decomposition theorem, perverse sheaves and the topology of algebraic maps*, Theorem 5.2.1, item 2 (primitive Lefschetz decomposition), pp. 81–82 (arXiv v2). The primitive decomposition derived formally from hard Lefschetz; the argument uses only kernels, images and the inverse of η^r, so it holds in any abelian category with a twist.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Théorème 5.4.10, p. 144. The hard-Lefschetz input in the perverse setting, from which the decomposition is formal.

<a id="node-EDC-7-universal-hyperplane-lemma"></a>

#### Perverse cohomology along the universal hyperplane section

Node `EDC.7/universal-hyperplane-lemma` · lemma.

Let f : X → Y factor as a closed immersion X ↪ ℙ^d × Y followed by the projection, with η = c₁(𝒪(1)). Let Y′ = ℙ^{d∨} × Y, X′ = ℙ^{d∨} × X with u : X′ → X and u : Y′ → Y the projections (smooth of relative dimension d with connected fibres), H ⊂ X′ the universal hyperplane section, v : H ↪ X′ and h : H → Y′ the induced proper map. For K ∈ pD^{≥0}(X): (i) u^*Rf_*K ≅ Rf′_*u^*K, hence (u^*pH^i Rf_*K)[d] ≅ pH^{i+d}(Rf′_*u^*K); (ii) for i < d − 1, pH^i(Rf′_*u^*K) ≅ pH^i(Rh_*(uv)^*K); (iii) pH^{d−1}(Rf′_*u^*K) → pH^{d−1}(Rh_*(uv)^*K) is injective and identifies the source with the largest perverse subsheaf of the target that comes from Y (is of the form u^*G[d]).

**Hypotheses.**

- X, Y separated of finite type over a field k (k = 𝔽_q or 𝔽̄_q), coefficients ℚ̄_ℓ; the factorisation through ℙ^d × Y is available locally on Y after replacing η by a multiple.

**Construction and proof.**

- u is smooth of relative dimension d with connected fibres, so u^*[d] is t-exact and fully faithful on perverse sheaves, with a largest subobject and a largest quotient coming from Y (EDC.5/smooth-pullback-perverse-exactness, BBD 4.2.4–4.2.6); smooth base change gives (i).
- u^*K lies in pD^{≥d}(X′); the projection g : U := X′ ∖ H → Y′ is affine, so g_!(u^*K|_U) ∈ pD^{≥d}(Y′) by left t-exactness of g_! (EDC.5/perverse-artin-vanishing, BBD 4.1.2); the triangle (g_!(u^*K|_U), Rf′_*u^*K, Rh_*(uv)^*K) gives (ii) and the injectivity in (iii).
- For (iii) it remains to compare pH^{−d}u_* of the two sides; by the projective-bundle formula (EDC.4/projective-bundle-decomposition, BBD 5.4.12) u_*u^* = ⊕_{i=0}^{d} (−)[−2i](−i) and (uv)_*(uv)^* has the same summands for i ≤ d − 1, and the fibre-dimension bound gives the needed vanishing (BBD 5.4.13).

**Prerequisites.** `EtaleDualityAndPerverseSheaves:EDC.5/fibre-dimension-perverse-amplitude`; `EtaleDualityAndPerverseSheaves:EDC.5/smooth-pullback-perverse-exactness`; `EtaleDualityAndPerverseSheaves:EDC.5/perverse-artin-vanishing`; `EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition`; `EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`; `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category`.

**Acceptance.**

- For Y a point and X = ℙ^d itself, H is the universal hyperplane (incidence variety) and (ii)–(iii) recover the weak Lefschetz statement for hyperplane sections of ℙ^d in degrees below d − 1.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Lemme 5.4.11, Lemme 5.4.12 and 5.4.13, pp. 145–146. BBD's universal hyperplane section set-up, the comparison of perverse cohomology of f_*u^*K and h_*(uv)^*K in low degrees and in degree d − 1 (largest subobject coming from Y), via smooth pullback exactness, affine vanishing and the projective-bundle formula.

<a id="node-EDC-7-relative-hard-lefschetz-theorem"></a>

#### Relative hard Lefschetz

Node `EDC.7/relative-hard-lefschetz-theorem` · theorem. Planet: Relative hard Lefschetz theorem.

Let f₀ : X₀ → Y₀ be a projective morphism of separated schemes of finite type over 𝔽_q and η ∈ H²(X₀, ℚ̄_ℓ(1)) the first Chern class of an f₀-ample line bundle. Cup product with η gives η : K₀ → K₀[2](1) for every K₀, hence η^i : pH^{−i}(Rf₀_*K₀) → pH^{i}(Rf₀_*K₀)(i). If F₀ is a pure perverse sheaf on X₀ of weight w, then for every i ≥ 0, η^i : pH^{−i}(Rf₀_*F₀) → pH^{i}(Rf₀_*F₀)(i) is an isomorphism of pure perverse sheaves of weight w − i on Y₀ (the same then holds over 𝔽̄_q). A proper morphism has no automatic ample class: projectivity and the chosen relatively ample line bundle are hypotheses.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).
- f₀ projective; the line bundle is f₀-ample; η is its Chern class in the adic theory (EDC.3/chern-classes, EDC.6/adic-transport-of-duality-and-classes); F₀ pure perverse.

**Construction and proof.**

- The question is local on Y₀; after shrinking Y₀ and replacing η by a positive multiple (which does not change bijectivity of η^i), f₀ factors through ℙ^d × Y₀ with η = c₁(𝒪(1)).
- Case i = 1: η is the composite of restriction pH^{−1}(Rf_*F) → pH^0(Rh_*((uv)^*F[d−1])) along the universal hyperplane and its dual Gysin map back to pH^1(Rf_*F)(1) (after u^*[d]).
- By EDC.7/universal-hyperplane-lemma, u^*pH^{−1} is the largest subobject of P := pH^0(Rh_*((uv)^*F[d−1])) coming from Y, and dually u^*pH^1(1) is its largest quotient coming from Y.
- (uv)^*F₀[d−1] is pure (smooth pullback), so Rh_* of it and P are pure (DWP.8/proper-direct-image-preserves-purity-6-2-6, EDC.7/perverse-cohomology-weights), hence P is semisimple over 𝔽̄_q (EDC.7/pure-perverse-geometric-semisimplicity); the largest sub coming from Y maps isomorphically to the largest such quotient, so η is an isomorphism (BBD 5.4.14).
- General i: induction on i, factoring u^*[d] of η^{i+1} through pH^{−i}h_*, the inductive isomorphism for h and (uv)^*F[d−1], and the dual Gysin map (BBD 5.4.15).
- Weights: pH^{−i} has weight w − i and pH^{i}(i) has weight w + i − 2i = w − i.

**Prerequisites.** [`EDC.7/universal-hyperplane-lemma`](#node-EDC-7-universal-hyperplane-lemma); [`EDC.7/pure-perverse-geometric-semisimplicity`](#node-EDC-7-pure-perverse-geometric-semisimplicity); [`EDC.7/perverse-cohomology-weights`](#node-EDC-7-perverse-cohomology-weights); `DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6`; `EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`; `EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`; [`EDC.7/graded-lefschetz-object`](#node-EDC-7-graded-lefschetz-object); `EtaleDualityAndPerverseSheaves:EDC.5/fibre-dimension-perverse-amplitude`; `EtaleDualityAndPerverseSheaves:EDC.5/smooth-pullback-perverse-exactness`; `EtaleDualityAndPerverseSheaves:EDC.5/perverse-verdier-self-duality`.

**Acceptance.**

- For Y₀ = Spec 𝔽_q, X₀ smooth projective of dimension n and F₀ = ℚ̄_ℓ[n], the statement is DeligneWeightsAndPurity:DWP.9/hard-lefschetz-4-1-1: η^i : H^{n−i}(X, ℚ̄_ℓ) ≅ H^{n+i}(X, ℚ̄_ℓ(i)).
- For f₀ = ℙ¹ × Y₀ → Y₀ and F₀ = ℚ̄_ℓ[1 + dim Y₀] with Y₀ smooth: pH^{−1} = ℚ̄_ℓ[dim Y₀] and pH^{1} = ℚ̄_ℓ(−1)[dim Y₀], and η is the isomorphism given by the class of a point in H²(ℙ¹).
- The ampleness hypothesis matters: for f : ℙ¹_{𝔽_q} → Spec 𝔽_q and F₀ = ℚ̄_ℓ[1], the trivial line bundle gives η = 0, so η¹ : pH^{−1} = H⁰(ℙ¹) → pH¹(1) = H²(ℙ¹)(1) is zero although both sides are ℚ̄_ℓ.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, 5.4.10 (statement), p. 144; proof 5.4.14–5.4.15, pp. 146–147 (checked on the page images). BBD's relative hard Lefschetz for a projective morphism and a relatively ample class, proved by the universal hyperplane section, purity and geometric semisimplicity, and induction on i.

**Source.** M. A. de Cataldo, L. Migliorini, *The decomposition theorem, perverse sheaves and the topology of algebraic maps*, Theorem 3.1.11 and Remark 3.1.12, p. 38 (arXiv v2). Survey statement of relative hard Lefschetz over 𝔽_q and 𝔽̄_q for pure perverse sheaves and its special case of hard Lefschetz in intersection cohomology.

<a id="node-EDC-7-relative-lefschetz-primitive-decomposition"></a>

#### Relative primitive decomposition of perverse cohomology

Node `EDC.7/relative-lefschetz-primitive-decomposition` · theorem.

In the situation of EDC.7/relative-hard-lefschetz-theorem, put P^{−i} := ker(η^{i+1} : pH^{−i}(Rf₀_*F₀) → pH^{i+2}(Rf₀_*F₀)(i+1)) for i ≥ 0. Then for every i ≥ 0, pH^{−i}(Rf₀_*F₀) ≅ ⊕_{a ≥ 0} P^{−i−2a}(−a) via η-powers, in Perv(Y₀); and over 𝔽̄_q, Rf_*F ≅ ⊕_{i ≥ 0} ⊕_{a=0}^{i} P^{−i}(−a)[i − 2a] (non-canonically for the sum over degrees, by EDC.7/decomposition-theorem). Each P^{−i} is pure of weight w − i.

**Hypotheses.**

- As in EDC.7/relative-hard-lefschetz-theorem.

**Construction and proof.**

- The perverse cohomology sheaves with the η-maps form a graded Lefschetz object in Perv(Y₀) with the Tate twist (EDC.7/graded-lefschetz-object), which satisfies hard Lefschetz by EDC.7/relative-hard-lefschetz-theorem.
- Apply EDC.7/abstract-primitive-decomposition in Perv(Y₀).
- Combine with the geometric splitting of EDC.7/decomposition-theorem (b) for the statement on Rf_*F; purity of P^{−i} by EDC.7/subquotient-weight-stability.

**Prerequisites.** [`EDC.7/relative-hard-lefschetz-theorem`](#node-EDC-7-relative-hard-lefschetz-theorem); [`EDC.7/abstract-primitive-decomposition`](#node-EDC-7-abstract-primitive-decomposition); [`EDC.7/graded-lefschetz-object`](#node-EDC-7-graded-lefschetz-object); [`EDC.7/decomposition-theorem`](#node-EDC-7-decomposition-theorem); [`EDC.7/subquotient-weight-stability`](#node-EDC-7-subquotient-weight-stability).

**Acceptance.**

- For f the structure map of a smooth projective X₀ of dimension n and F₀ = ℚ̄_ℓ[n], P^{−i} is primitive cohomology P^{n−i}(X), and the decomposition is the classical Lefschetz decomposition, matching DWP.9/lefschetz-decomposition-of-a-graded-operator.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Théorème 5.4.10, p. 144. Hard Lefschetz on perverse cohomology, from which the primitive decomposition is formal.

**Source.** M. A. de Cataldo, L. Migliorini, *The decomposition theorem, perverse sheaves and the topology of algebraic maps*, Theorem 5.2.1, item 2, pp. 81–82 (arXiv v2). Primitive decomposition from hard Lefschetz.

<a id="node-EDC-7-intersection-cohomology-hard-lefschetz"></a>

#### Hard Lefschetz in intersection cohomology

Node `EDC.7/intersection-cohomology-hard-lefschetz` · application.

Let X₀ be projective over 𝔽_q of pure dimension n, η the Chern class of an ample line bundle, and L₀ a lisse sheaf on a smooth dense open of X₀, punctually pure of weight w. Then for every i ≥ 0, cup product with η^i is an isomorphism IH^{n−i}(X, L) → IH^{n+i}(X, L)(i), where IH^j(X, L) := H^{j−n}(X, IC_X(L)), between spaces pure of weight w + n − i.

**Hypotheses.**

- X₀ separated of finite type over 𝔽_q (q a power of p), X := X₀ ⊗_{𝔽_q} 𝔽̄_q, ℓ ≠ p; coefficients ℚ̄_ℓ, realised as the 2-colimit of the rational adic categories D^b_c(−, E) over finite E/ℚ_ℓ (EDC.6/classical-and-proetale-adic-categories, EDC.6/rational-perverse-coefficient-extension); 'perverse' refers to the middle perversity of EDC.5/middle-perverse-t-structure with its ℓ-adic form EDC.5/adic-perverse-t-structures; mixed complexes and integer weights are those of DeligneWeightsAndPurity:DWP.8/mixed-complexes and DWP.8/pure-complexes (a sheaf of weights ≤ w has ℋ^i of punctual weights ≤ w + i; weights ≥ w are defined by duality).
- X₀ projective; L₀ punctually pure (a pure model is required).

**Construction and proof.**

- IC_{X₀}(L₀) is pure of weight w + n (EDC.7/intersection-complex-purity).
- Apply EDC.7/relative-hard-lefschetz-theorem to f₀ : X₀ → Spec 𝔽_q and F₀ = IC_{X₀}(L₀); perverse cohomology on a point is ordinary cohomology.

**Prerequisites.** [`EDC.7/intersection-complex-purity`](#node-EDC-7-intersection-complex-purity); [`EDC.7/relative-hard-lefschetz-theorem`](#node-EDC-7-relative-hard-lefschetz-theorem); `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-4-1-1`; `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13`.

**Acceptance.**

- For X₀ smooth projective and L₀ = ℚ̄_ℓ this is DeligneWeightsAndPurity:DWP.9/hard-lefschetz-4-1-1 over 𝔽̄_q.
- Agreement with Weil II 6.2.13 (DeligneWeightsAndPurity:DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13) for K = IC_X(L), whose support conditions hold with the integer n = dim X.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Théorème 5.4.10 with Y₀ a point, p. 144; 6.2.10, p. 165. BBD note that the case of Y a point gives hard Lefschetz in intersection cohomology.

**Source.** M. A. de Cataldo, L. Migliorini, *The decomposition theorem, perverse sheaves and the topology of algebraic maps*, Remark 3.1.12, p. 38 (arXiv v2). The case Y₀ = point, P₀ = IC gives hard Lefschetz for intersection cohomology over 𝔽_q and 𝔽̄_q.


### From finite fields to ℂ

Restricted constructible categories specialise from ℂ to the algebraic closure of a finite field along strictly henselian traits, compatibly with chosen operations and the perverse t-structure. Simple perverse sheaves of geometric origin specialise to pure ones, which transports the decomposition and relative hard Lefschetz theorems to ℂ.

<a id="node-EDC-7-restricted-constructible-categories"></a>

#### Restricted constructible categories and their specialisation to finite fields

Node `EDC.7/restricted-constructible-categories` · construction.

Let X be of finite type over ℂ, T a finite stratification of X into smooth connected algebraic strata and, for each T ∈ T, L(T) a finite set of isomorphism classes of irreducible locally constant sheaves of ℤ/ℓ-modules on T. D^b_{T,L}(X, ℤ_ℓ) is the full subcategory of D^b_c(X, ℤ_ℓ) of objects whose cohomology sheaves, reduced mod ℓ and restricted to each stratum T, are locally constant with all constituents in L(T). Choose a finitely generated ℤ-subalgebra A ⊂ ℂ, S = Spec A, and a model (X_S, T_S, L_S) over S, shrunk so that strata are smooth over S with geometrically connected fibres and the Ext sheaves between the j_!L are locally constant and commute with base change. For a strictly henselian DVR V with A ⊂ V ⊂ ℂ whose residue field s̄ is an algebraic closure of a finite residue field of A, the restriction functors D^b_{T,L}(X, ℤ_ℓ) ← D^b_{T,L}(X_V, ℤ_ℓ) → D^b_{T,L}(X_s̄, ℤ_ℓ) are equivalences; the induced system of equivalences D^b_{T,L}(X, ℤ_ℓ) ≃ D^b_{T,L}(X_s̄, ℤ_ℓ), as a germ along the filter of such V, depends only on (X, T, L). After refining (T, L) and shrinking S, the equivalences respect any given finite list of the operations Rf_*, Rf_!, f^*, Rf^!, ⊗, RHom, the perverse t-structure (when the R^q j_*L|_{T′} are lisse with constituents in L(T′)), and rank, lissity and monodromy of sheaves on strata; they extend to ℚ_ℓ, E_λ and ℚ̄_ℓ coefficients. There is no equivalence of the full categories D^b_c(X, ℤ_ℓ) ≃ D^b_c(X_s̄, ℤ_ℓ).

**Hypotheses.**

- X separated of finite type over ℂ; complex coefficients for the analytic statements and ℚ̄_ℓ coefficients for the étale ones, related by a chosen field isomorphism ℂ ≅ ℚ̄_ℓ and by the étale/analytic comparison of EDC.6/complex-analytic-comparison; strata are algebraic.
- Only finitely many operations and objects are transported at a time; refinements change the germ only by restriction.

**Construction and proof.**

- For ℤ/ℓⁿ coefficients the equivalences are formal from the identification of the H^p(−, Ext^q(F, G)) on X, X_V and X_s̄ for F, G of the form j_!L (smooth and proper base change on the chosen model, generic base change, SF.2 spreading out) (BBD 6.1.9).
- Finite Tor dimension is preserved, and the ℓ-adic statement follows from the definition of ℓ-adic derived categories as normalized systems (EDC.6/normalized-adic-system, EDC.6/classical-and-proetale-adic-categories).
- Compatibility with operations and with the perverse t-structure: enlarge (T, L) so that the operations send the restricted categories into restricted categories, then shrink S so that base change holds (BBD 6.1.10, using EGA IV §§8–9 spreading-out lists, 6.1.7).
- Over ℂ, the étale category is compared with the analytic one by EDC.6/complex-analytic-comparison.

**Prerequisites.** `EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`; `EtaleDualityAndPerverseSheaves:EDC.6/normalized-adic-system`; `EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`; `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`; `SchemeAndStackFoundations:SF.2`.

**Uses.**

- BBD 6.2.6–6.2.7: transport a simple perverse sheaf of geometric origin to a finite field, where it has a pure model, and transport the decomposition back.
- EDC.7/pure-specialization-of-geometric-origin: the restricted categories are the carriers of the specialisation equivalences.
- DeligneWeightsAndPurity:DWP.8/potentially-property-p-3-4-10: arithmetic models of objects over algebraically closed fields of characteristic 0.

**API.**

- `TauCeti.EtaleDuality.RestrictedCategory` (data): For a stratification T and finite sets L(T) of irreducible ℤ/ℓ-local systems, the full subcategory of D^b_c(X, ℤ_ℓ) whose residual cohomology on each stratum has constituents in L(T).
- `TauCeti.EtaleDuality.RestrictedCategory.mem_iff` (characterisation): K lies in the restricted category iff for every q and T, ℋ^q(K ⊗^L ℤ/ℓ)|_T is locally constant with all Jordan–Hölder constituents in L(T).
- `TauCeti.EtaleDuality.RestrictedCategory.triangulated` (structure): The restricted category is a triangulated subcategory, closed under isomorphism, shifts and cones.
- `TauCeti.EtaleDuality.GoodModel` (data): A finitely generated A ⊂ ℂ and a model (X_S, T_S, L_S) satisfying the smoothness, geometric connectedness and Ext-base-change conditions of BBD 6.1.8.
- `TauCeti.EtaleDuality.specializationEquiv` (equivalence): For a good model and a strictly henselian V as in BBD 6.1.8, the equivalence D_{T,L}(X, ℤ_ℓ) ≃ D_{T,L}(X_s̄, ℤ_ℓ) through D_{T,L}(X_V, ℤ_ℓ).
- `TauCeti.EtaleDuality.specializationEquiv_perverse` (compatibility): If the R^q j_*L|_{T′} are lisse with constituents in L(T′), the equivalence is t-exact for the perverse t-structures.
- `TauCeti.EtaleDuality.specializationEquiv_comm` (compatibility): For one of Rf_*, Rf_!, f^*, Rf^!, ⊗, RHom and suitable refinements of (T, L) on source and target, the equivalences commute with it after shrinking S.
- `TauCeti.EtaleDuality.specializationEquiv_rational` (functoriality): The equivalences extend to ℚ_ℓ, E and ℚ̄_ℓ coefficients by inverting ℓ and taking 2-colimits.

**Unit tests.**

- `TauCeti.EtaleDuality.restrictedCategory_univ` (degenerate): If every residual class is allowed on every stratum, every object of D^b_c(X, ℤ_ℓ) is restricted.
- `TauCeti.EtaleDuality.restrictedCategory_empty_L` (degenerate): If L(T) is empty for every stratum, an object is restricted iff all its residual cohomology sheaves vanish on every stratum (it is zero).
- `TauCeti.EtaleDuality.restrictedCategory_mono` (characterisation): Enlarging the families L(T) enlarges the restricted category; refinements of (T, L) therefore induce the restriction maps of germs used in BBD 6.1.10.

**Acceptance.**

- For X = a point and T = {X}, D^b_{T,L}(X, ℤ_ℓ) is the category of perfect ℤ_ℓ-complexes, identical over ℂ and over s̄; for X = ℙ¹_ℂ with one stratum and L = {ℤ/ℓ}, the specialisation sends Rπ_*ℤ_ℓ to Rπ_*ℤ_ℓ on ℙ¹_{s̄}, both with cohomology ℤ_ℓ, 0, ℤ_ℓ(−1).
- On X = 𝔾_{m,ℂ} the ℤ_ℓ-local system with monodromy a non-quasi-unipotent element of GL₂(ℤ_ℓ) is not in any D_{T,L} coming from a model over a finitely generated A, illustrating why only restricted categories specialise (BBD 6.1.8).

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, 6.1.8, Lemme 6.1.9 and 6.1.10, pp. 155–159. BBD restrict to complexes whose residual cohomology on strata has constituents in fixed finite families, prove that the restriction functors through a strictly henselian DVR are equivalences, and that after refining and shrinking they respect chosen operations and the perverse t-structure; only germs of systems of equivalences are obtained.

**Library home.** `TauCeti/AlgebraicGeometry/Etale/Perverse/Specialization`, namespace `TauCeti.EtaleDuality`.

<a id="node-EDC-7-geometric-origin-class"></a>

#### Perverse sheaves and complexes of geometric origin

Node `EDC.7/geometric-origin-class` · definition.

For schemes X of finite type over ℂ, the class of simple perverse sheaves of complex vector spaces of geometric origin is the smallest class (a) containing the constant sheaf ℂ on a point and (b) closed under taking the simple constituents of pH^i T(F) for T one of Rf_*, Rf_!, f^*, Rf^! (f a morphism of schemes of finite type over ℂ), and (c) closed under taking the simple constituents of pH^i(A ⊗ B) and pH^i RHom(A, B) for A, B with constituents in the class. A perverse sheaf is semisimple of geometric origin if it is a finite direct sum of simple ones of geometric origin; a complex K ∈ D^b_c(X(ℂ), ℂ) is semisimple of geometric origin if K ≅ ⊕_i pH^i(K)[−i] and each pH^i(K) is semisimple of geometric origin.

**Hypotheses.**

- X separated of finite type over ℂ; complex coefficients for the analytic statements and ℚ̄_ℓ coefficients for the étale ones, related by a chosen field isomorphism ℂ ≅ ℚ̄_ℓ and by the étale/analytic comparison of EDC.6/complex-analytic-comparison; strata are algebraic.
- The definition is inductive over all schemes of finite type over ℂ; constituents are simple subquotients in the analytic perverse heart.

**Construction and proof.**

- The class exists as the intersection of all classes with properties (a)–(c).
- The full subcategories of D^b_c(X(ℂ), ℂ) of objects whose perverse cohomology constituents are of geometric origin are stable under f_*, f_!, f^*, f^!, ⊗ and RHom by construction (BBD 6.2.4).

**Prerequisites.** `EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`; `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves-classification`; `EtaleDualityAndPerverseSheaves:EDC.5/t-structure-cohomology`; [`EDC.7/geometrically-semisimple-perverse-sheaf`](#node-EDC-7-geometrically-semisimple-perverse-sheaf).

**Uses.**

- BBD 6.2.5, 6.2.10: hypothesis of the decomposition and relative hard Lefschetz theorems over ℂ.
- BBD 6.2.6: objects of geometric origin specialise to pure objects over finite fields.
- GeometricSatakeAndFusion and EndoscopicTransferAndUnitaryTraceComparison characteristic-zero consumers: IC complexes of local systems of geometric origin on complex varieties.

**API.**

- `TauCeti.EtaleDuality.GeometricOrigin` (data): The inductive predicate on simple analytic perverse sheaves defined by (a)–(c).
- `TauCeti.EtaleDuality.GeometricOrigin.const_point` (constructor): The constant sheaf ℂ on Spec ℂ is of geometric origin.
- `TauCeti.EtaleDuality.GeometricOrigin.of_constituent` (constructor): A simple constituent of pH^i T(F) with F of geometric origin and T ∈ {Rf_*, Rf_!, f^*, Rf^!} is of geometric origin; likewise for ⊗ and RHom.
- `TauCeti.EtaleDuality.GeometricOrigin.simple` (projection): Every perverse sheaf of geometric origin is simple.
- `TauCeti.EtaleDuality.IsSemisimpleGeometricOrigin` (data): K ≅ ⊕_i pH^i(K)[−i] with each pH^i(K) a finite sum of simple perverse sheaves of geometric origin.
- `TauCeti.EtaleDuality.IsSemisimpleGeometricOrigin.ic_finite_monodromy` (example): j_!*(L[d]) is semisimple of geometric origin when L has finite monodromy.
- `TauCeti.EtaleDuality.IsSemisimpleGeometricOrigin.shift` (structure): Stable under shifts and finite direct sums.

**Unit tests.**

- `TauCeti.EtaleDuality.geometricOrigin_constant_smooth` (computation): For X smooth connected of dimension d over ℂ, ℂ_X[d] is of geometric origin (it is pH^d(f^*ℂ) for f : X → point).
- `TauCeti.EtaleDuality.isSemisimpleGeometricOrigin_zero` (degenerate): The zero complex is semisimple of geometric origin (the empty sum).
- `TauCeti.EtaleDuality.not_isSemisimpleGeometricOrigin_jstar` (non-example): For j : ℂ^× ↪ ℂ, the perverse sheaf Rj_*ℂ[1] has constituents ℂ_ℂ[1] and ℂ_0, both of geometric origin, but it is a non-split extension of ℂ_0 by ℂ_ℂ[1], so it is not semisimple of geometric origin.

**Acceptance.**

- For j : U ↪ X an open immersion with U smooth connected of dimension d and L a local system with finite monodromy on U, j_!*(L[d]) is semisimple of geometric origin, since L is a direct summand of π_*ℂ for a finite étale cover π.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, 6.2.4, pp. 162–163. BBD define simple perverse sheaves of geometric origin as the smallest class containing ℂ on a point and closed under constituents of perverse cohomology of the four operations and of ⊗, RHom, and define semisimple objects and complexes of geometric origin.

**Library home.** `TauCeti/AlgebraicGeometry/Etale/Perverse/Specialization`, namespace `TauCeti.EtaleDuality`.

<a id="node-EDC-7-pure-specialization-of-geometric-origin"></a>

#### Simple perverse sheaves of geometric origin specialise to pure sheaves over finite fields

Node `EDC.7/pure-specialization-of-geometric-origin` · theorem.

Let F be a simple perverse ℚ̄_ℓ-sheaf of geometric origin on X over ℂ (transported from ℂ to ℚ̄_ℓ coefficients by a field isomorphism and EDC.6/complex-analytic-comparison). For S = Spec A, A ⊂ ℂ finitely generated over ℤ and large enough, each specialisation equivalence of EDC.7/restricted-constructible-categories sends F to a simple perverse sheaf F_s̄ on X_s̄ satisfying (P): X_s̄ comes by extension of scalars from some X₀ over a finite field 𝔽_q and F_s̄ from a pure perverse sheaf F₀ on X₀.

**Hypotheses.**

- X separated of finite type over ℂ; complex coefficients for the analytic statements and ℚ̄_ℓ coefficients for the étale ones, related by a chosen field isomorphism ℂ ≅ ℚ̄_ℓ and by the étale/analytic comparison of EDC.6/complex-analytic-comparison; strata are algebraic.
- The model, the finite field and the pure F₀ are part of the output (a witness), not assumptions; purity is a conclusion.

**Construction and proof.**

- Simplicity is preserved by the specialisation equivalences (EDC.7/restricted-constructible-categories, perverse t-exactness).
- By the inductive definition (EDC.7/geometric-origin-class) it suffices that (P) holds for ℚ̄_ℓ on a point and is stable under the generating operations, which commute with the equivalences after refining and shrinking.
- If F_s̄, G_s̄ satisfy (P), then pH^iT(F₀) (and pH^i of ⊗, RHom) are mixed (EDC.7/mixed-perverse-sheaves, DWP.8/six-operations-preserve-mixedness-6-1-11); their simple constituents are pure (EDC.7/simple-mixed-perverse-is-pure) and, by EDC.7/restricted-constructible-categories, the constituents of the specialised objects are their pullbacks (BBD 6.2.6).

**Prerequisites.** [`EDC.7/restricted-constructible-categories`](#node-EDC-7-restricted-constructible-categories); [`EDC.7/geometric-origin-class`](#node-EDC-7-geometric-origin-class); [`EDC.7/mixed-perverse-sheaves`](#node-EDC-7-mixed-perverse-sheaves); [`EDC.7/simple-mixed-perverse-is-pure`](#node-EDC-7-simple-mixed-perverse-is-pure); `DeligneWeightsAndPurity:DWP.8/six-operations-preserve-mixedness-6-1-11`; `DeligneWeightsAndPurity:DWP.8/potentially-property-p-3-4-10`.

**Acceptance.**

- For F = ℂ_X[d] with X smooth over ℂ, F₀ can be taken to be ℚ̄_ℓ[d] on a smooth model X₀, pure of weight d.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Lemme 6.2.6 and its proof, pp. 163–164. BBD prove that, for S large, the specialisation equivalences send a simple perverse sheaf of geometric origin to a simple perverse sheaf coming from a pure one over a finite field, by stability of property (P) under the generating operations.

<a id="node-EDC-7-decomposition-theorem-complex"></a>

#### The decomposition theorem over ℂ

Node `EDC.7/decomposition-theorem-complex` · theorem. Planet: Decomposition theorem over ℂ.

Let f : X → Y be a proper morphism of schemes of finite type over ℂ. If K ∈ D^b_c(X(ℂ), ℂ) is semisimple of geometric origin, then Rf_*K is semisimple of geometric origin: Rf_*K ≅ ⊕_i pH^i(Rf_*K)[−i] and each pH^i(Rf_*K) is a finite direct sum of simple perverse sheaves of geometric origin. The same holds with ℂ replaced by ℚ̄_ℓ in the étale topology. In particular, for X smooth (resp. any X and L of geometric origin), Rf_*ℂ_X[dim X] (resp. Rf_*IC_X(L)) decomposes in this way. No ℚ- or ℚ_ℓ-rational descent of the splitting is asserted.

**Hypotheses.**

- X separated of finite type over ℂ; complex coefficients for the analytic statements and ℚ̄_ℓ coefficients for the étale ones, related by a chosen field isomorphism ℂ ≅ ℚ̄_ℓ and by the étale/analytic comparison of EDC.6/complex-analytic-comparison; strata are algebraic.
- K semisimple of geometric origin; complex (or ℚ̄_ℓ) coefficients.

**Construction and proof.**

- Reduce to K = F simple perverse of geometric origin (finite sums and shifts).
- Choose S large and specialise (EDC.7/pure-specialization-of-geometric-origin): F_s̄ comes from a pure F₀ on X₀ over 𝔽_q, and f, refined (T, L) on Y and the operation Rf_* are compatible with the equivalences (EDC.7/restricted-constructible-categories).
- Over 𝔽̄_q, Rf_*F_s̄ splits as ⊕ pH^i[−i] with semisimple pH^i (EDC.7/decomposition-theorem); transport back through the equivalences to get the statement for Rf_*F; the constituents are of geometric origin by definition (BBD 6.2.7).

**Prerequisites.** [`EDC.7/pure-specialization-of-geometric-origin`](#node-EDC-7-pure-specialization-of-geometric-origin); [`EDC.7/restricted-constructible-categories`](#node-EDC-7-restricted-constructible-categories); [`EDC.7/decomposition-theorem`](#node-EDC-7-decomposition-theorem); [`EDC.7/geometric-origin-class`](#node-EDC-7-geometric-origin-class); `EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`.

**Acceptance.**

- For the blow-up π of ℂ² at 0, Rπ_*ℂ[2] ≅ ℂ[2] ⊕ ℂ_0 (the complex counterpart of the 𝔽_q example of EDC.7/decomposition-theorem).
- For f : X → point with X projective, the theorem gives H*(X, IC_X) as a graded vector space, the content being the existence of the IC formalism rather than splitting.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Théorème 6.2.5 and its proof 6.2.7, pp. 163–164. BBD: for proper f, Rf_* of a semisimple complex of geometric origin is semisimple of geometric origin, proved by specialising to a finite field and applying 5.4.5 and 5.3.8.

**Source.** M. A. de Cataldo, L. Migliorini, *The decomposition theorem, perverse sheaves and the topology of algebraic maps*, Theorem 1.6.1, pp. 13–14 (arXiv v2). Survey statement of the decomposition and semisimplicity theorems over ℂ.

<a id="node-EDC-7-relative-hard-lefschetz-complex"></a>

#### Relative hard Lefschetz over ℂ

Node `EDC.7/relative-hard-lefschetz-complex` · theorem.

Let f : X → Y be a projective morphism of schemes of finite type over ℂ, η the first Chern class of a relatively ample line bundle, and F a semisimple perverse sheaf of geometric origin on X. Then for every i ≥ 0, η^i : pH^{−i}(Rf_*F) → pH^{i}(Rf_*F) is an isomorphism (Tate twists trivialised by the choice of 2πi). For Y a point this is hard Lefschetz in intersection cohomology of complex projective varieties.

**Hypotheses.**

- X separated of finite type over ℂ; complex coefficients for the analytic statements and ℚ̄_ℓ coefficients for the étale ones, related by a chosen field isomorphism ℂ ≅ ℚ̄_ℓ and by the étale/analytic comparison of EDC.6/complex-analytic-comparison; strata are algebraic.
- f projective with a chosen relatively ample line bundle; F semisimple of geometric origin.

**Construction and proof.**

- Specialise F to a pure F₀ over a finite field (EDC.7/pure-specialization-of-geometric-origin) with f and η compatible after shrinking S.
- Apply EDC.7/relative-hard-lefschetz-theorem over 𝔽_q and transport back (BBD 6.2.10).

**Prerequisites.** [`EDC.7/pure-specialization-of-geometric-origin`](#node-EDC-7-pure-specialization-of-geometric-origin); [`EDC.7/relative-hard-lefschetz-theorem`](#node-EDC-7-relative-hard-lefschetz-theorem); [`EDC.7/restricted-constructible-categories`](#node-EDC-7-restricted-constructible-categories); `EtaleDualityAndPerverseSheaves:EDC.6/trace-orientation-comparison`.

**Acceptance.**

- For X smooth projective over ℂ and F = ℂ[dim X], Y a point: η^i : H^{n−i}(X, ℂ) ≅ H^{n+i}(X, ℂ), the classical hard Lefschetz theorem.

**Source.** A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Théorème 6.2.10, p. 165. BBD: relative hard Lefschetz for projective f and semisimple perverse sheaves of geometric origin over ℂ, deduced from 6.2.6 and 5.4.10; the case of a point gives hard Lefschetz in intersection cohomology.


## EDC.8 — Correspondences and the functional-equation interface


The layer follows Varshavsky's construction of trace maps, which needs no properness of the correspondence. Pushforward along a proper morphism of correspondences commutes with trace maps (Varshavsky 1.2.5); applied to the structure morphism this is the Lefschetz–Verdier formula (1.2.6). Additivity over an invariant closed subset (1.5.10) and specialisation along the deformation to the normal cone (1.3.5, 1.4.2) prove that the local terms of a correspondence contracting near Z are those of its restriction to Z (2.1.3). Frobenius twists of a correspondence defined over 𝔽_q contract near invariant subsets once qⁿ exceeds a ramification bound (2.2.3–2.2.4), which gives the Fujiwara–Varshavsky trace formula (2.3.2). For automorphisms the normal-cone criterion of Varshavsky's note on local terms (2020) identifies true and naive local terms for semisimple elements of linear algebraic groups, in particular for finite-order automorphisms of order prime to p. The last subsection is pure linear algebra applied to Poincaré duality.

**Ownership of the generic Fujiwara theorem.** The contracting-correspondence theorem and the Fujiwara–Varshavsky trace formula are general facts about correspondences of schemes over 𝔽̄_q, needed both by the Igusa-variety trace formula of ET.5 and by the raw fixed-point trace identity of AutomorphicGaloisRepresentationsPartII AG2.1a. They are planned once, here; ET.5 keeps the verification of their hypotheses for Igusa varieties and the counting that follows.

**Acceptance tests for the layer.** For a finite étale X and a permutation correspondence, the Lefschetz–Verdier formula is the permutation-trace identity of Tau Ceti. For the identity correspondence of X₀ ⊗ 𝔽̄_q twisted by Frobenius, the Fujiwara–Varshavsky formula is the Grothendieck–Lefschetz formula. For the involution x ↦ −x of ℙ¹ local terms are naive, while translation in characteristic p has a non-naive local term 2 at ∞. For the functional-equation interface: ℙ¹ (Δ = q, χ = 2), a genus-g curve (det F₁ = q^g, Δ = q^{1−g}) and a smooth quadric surface whose rulings Frobenius swaps (det F₂ = −q², the sign that the split quadric does not have).


### Correspondences and cohomological correspondences

Correspondences, their morphisms and fixed-point schemes; cohomological correspondences in Varshavsky's adjoint form; pushforward along admissible morphisms and the induced map on compactly supported cohomology; pullback and restriction to open and invariant closed subsets with naive local terms; composition over fibre products.

<a id="node-EDC-8-scheme-correspondence"></a>

#### Correspondences of schemes and their morphisms

Node `EDC.8/scheme-correspondence` · definition.

A correspondence from X₁ to X₂ is a morphism c = (c₁, c₂) : C → X₁ × X₂ of schemes separated of finite type over k. A morphism from c : C → X₁ × X₂ to b : B → Y₁ × Y₂ is a triple [f] = (f₁, f♮, f₂) with b₁f♮ = f₁c₁ and b₂f♮ = f₂c₂. [f] is proper (resp. an open or closed embedding) when f₁, f♮ and f₂ are. A self-correspondence is c : C → X × X; its fixed-point scheme is Fix(c) := C ×_{X×X} X (fibre product with the diagonal Δ), with Δ′ : Fix(c) → C and c′ : Fix(c) → X. A compactification of c is a correspondence c̄ : C̄ → X̄₁ × X̄₂ proper over k with a dominant open embedding [j] : c → c̄; every pair of compactifications of X₁, X₂ extends to one of c.

**Hypotheses.**

- Schemes separated of finite type over a field k; fibre products are the native scheme fibre products.

**Construction and proof.**

- Composition of morphisms of correspondences is componentwise; Fix is functorial for morphisms of self-correspondences with f₁ = f₂.
- Existence of compactifications: compactify C by Nagata and take the closure of C in C′ × X̄₁ × X̄₂ (Varshavsky 1.1.3).

**Prerequisites.** `mathlib:AlgebraicGeometry.Scheme`; `mathlib:CategoryTheory.Limits.pullback`; `mathlib:AlgebraicGeometry.IsProper`; `mathlib:AlgebraicGeometry.IsSeparated`.

**Uses.**

- Varshavsky 2007, 1.1.6–1.2.6: pushforward of cohomological correspondences and trace maps are defined along morphisms of correspondences.
- EndoscopicTransferAndUnitaryTraceComparison:ET.5: Hecke correspondences on Igusa varieties composed with Frobenius.
- ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic: Frobenius–Hecke correspondences on moduli of shtukas (scheme-level parts).

**API.**

- `TauCeti.EtaleDuality.Correspondence` (data): Structure: a scheme C with morphisms c₁ : C ⟶ X₁, c₂ : C ⟶ X₂ over Spec k.
- `TauCeti.EtaleDuality.Correspondence.Hom` (data): Morphisms (f₁, f♮, f₂) with the two commuting squares.
- `TauCeti.EtaleDuality.Correspondence.Hom.IsProper` (projection): A morphism is proper when f₁, f♮ and f₂ are proper.
- `TauCeti.EtaleDuality.Correspondence.fix` (constructor): Fix(c) := pullback of (c₁, c₂) : C ⟶ X ×_k X along the diagonal, with Δ′ and c′.
- `TauCeti.EtaleDuality.Correspondence.graph` (constructor): The graph-type correspondence (g, id) : X ⟶ X ×_k X of a morphism g : X ⟶ X (c₁ = g, c₂ = id), the convention used for cohomological correspondences.
- `TauCeti.EtaleDuality.Correspondence.fix_graph` (characterisation): Fix(graph g) is the equaliser of id and g.
- `TauCeti.EtaleDuality.Correspondence.Hom.comp` (functoriality): Componentwise composition, associative and unital.

**Unit tests.**

- `TauCeti.EtaleDuality.fix_graph_id_point` (degenerate): For X = Spec k and g = id, Fix(graph g) = Spec k.
- `TauCeti.EtaleDuality.fix_graph_frobenius_count` (computation): For X₀ over 𝔽_q and g the q-power Frobenius of X = X₀ ⊗ 𝔽̄_q, Fix(graph g) is the reduced finite scheme of points of X₀(𝔽_q).
- `TauCeti.EtaleDuality.fix_transpose` (characterisation): Fix(c^t) is canonically isomorphic to Fix(c).
- `TauCeti.EtaleDuality.fix_graph_affine_line_translation` (non-example): Translation x ↦ x + 1 on 𝔸¹ has empty fixed-point scheme over every field, although in characteristic p it is an automorphism of finite order p: a finite-order automorphism need not have fixed points.

**Acceptance.**

- The graph-type correspondence (g, id) : X → X × X of an endomorphism g has Fix equal to the fixed-point scheme X^g.
- The transpose c^t = (c₂, c₁) has Fix(c^t) ≅ Fix(c).

**Source.** Y. Varshavsky, *Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara*, Definition 1.1.1, Notation 1.1.2, Remark 1.1.3, pp. 6–7; Notation 1.2.1, p. 8 (arXiv v2). Varshavsky's correspondences, morphisms between them, proper/open/closed morphisms, compactifications and the fixed-point scheme.

**Library home.** `TauCeti/AlgebraicGeometry/Etale/Correspondence`, namespace `TauCeti.EtaleDuality`.

<a id="node-EDC-8-cohomological-correspondence-lifting"></a>

#### Cohomological correspondences

Node `EDC.8/cohomological-correspondence-lifting` · definition. Planet: Cohomological correspondence.

Let c : C → X₁ × X₂ be a correspondence, F₁ ∈ D^b_ctf(X₁, Λ) and F₂ ∈ D^b_ctf(X₂, Λ). A cohomological correspondence lifting c (a c-morphism) from F₁ to F₂ is a morphism u : c₁^*F₁ → c₂^!F₂ in D(C, Λ); equivalently, by the adjunction c₂_! ⊣ c₂^!, a morphism c₂_!c₁^*F₁ → F₂. Hom_c(F₁, F₂) := Hom(c₁^*F₁, c₂^!F₂). Convention: pull back along the first leg and apply the exceptional inverse image along the second; the stage description's c₂^*K → c₁^!K is the same notion with the legs named in the opposite order. For an endomorphism g : X → X, the graph-type correspondence is (g, id) : X → X × X (c₁ = g, c₂ = id), whose c-morphisms are the maps u : g^*F → F.

**Hypotheses.**

- All schemes are separated of finite type over a field k (separably closed whenever trace maps, local terms or traces on cohomology occur); ℓ is invertible in k; Λ is a finite ring killed by a power of ℓ, or a finite extension of ℤ_ℓ or ℚ_ℓ (in the adic case D^b_ctf is the category of EDC.6/classical-and-proetale-adic-categories); D^b_ctf(X, Λ) is the category of constructible complexes of finite Tor dimension (EDC.0/constructible-ctf-complexes), stable under the six operations.

**Construction and proof.**

- The adjunction c₂_! ⊣ c₂^! is EDC.1:adjoint/exceptional-inverse-image; it identifies the two descriptions naturally in F₁, F₂.
- For c the identity correspondence of X, Hom_c(F₁, F₂) = Hom(F₁, F₂) (since id^! = id).

**Prerequisites.** [`EDC.8/scheme-correspondence`](#node-EDC-8-scheme-correspondence); `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`; `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction`; `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`; `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`.

**Uses.**

- Varshavsky 2007, Definition 1.1.4 and Remark 1.1.5: c-morphisms are the objects whose traces are computed.
- Lu–Zheng 2022, Construction 2.6: objects (X, L) and 1-morphisms (c, u) of the 2-category of cohomological correspondences.
- EndoscopicTransferAndUnitaryTraceComparison:ET.5: Hecke operators on Igusa cohomology are cohomological correspondences composed with Frobenius.
- AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity: Hecke correspondences with compact-support coefficients for the Fujiwara–Varshavsky trace identity.
- ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences: Frobenius–Hecke correspondences on finite-type schemes.

**API.**

- `TauCeti.EtaleDuality.CohCorr` (data): For c : Correspondence X₁ X₂ and F₁, F₂, the type of morphisms c₁^*F₁ ⟶ c₂^!F₂.
- `TauCeti.EtaleDuality.CohCorr.adjointEquiv` (equivalence): CohCorr c F₁ F₂ ≃ (c₂_!c₁^*F₁ ⟶ F₂), natural in F₁ and F₂.
- `TauCeti.EtaleDuality.CohCorr.ofId` (constructor): For the identity correspondence of X, CohCorr ≃ Hom(F₁, F₂).
- `TauCeti.EtaleDuality.CohCorr.ofGraph` (constructor): For the graph-type correspondence (g, id), CohCorr ≃ Hom(g^*F, F).
- `TauCeti.EtaleDuality.CohCorr.module` (instance): CohCorr c F₁ F₂ is a Λ-module, and precomposition/postcomposition with morphisms of F₁, F₂ are Λ-linear.
- `TauCeti.EtaleDuality.CohCorr.transport` (extensionality): An isomorphism of correspondences (support isomorphism compatible with both legs) transports c-morphisms through the canonical identifications of pullbacks and exceptional pullbacks; two c-morphisms are equal iff their transports are.

**Unit tests.**

- `TauCeti.EtaleDuality.cohCorr_point` (degenerate): For X₁ = X₂ = C = Spec k, CohCorr ≃ Hom(F₁, F₂) in D(Λ).
- `TauCeti.EtaleDuality.cohCorr_graph_weil` (computation): For X₀ over 𝔽_q and F₀ a Weil sheaf, the Weil isomorphism Fr^*F ≅ F is a c-morphism for the graph-type correspondence of Frobenius on X.
- `TauCeti.EtaleDuality.cohCorr_adjoint_compat` (compatibility): adjointEquiv agrees with EDC.1's adjunction c₂_! ⊣ c₂^! (its unit and counit).
- `TauCeti.EtaleDuality.cohCorr_not_pushforward_of_endomorphism` (non-example): For c = (id, g) (legs reversed) a c-morphism is F → g^!F, which is not a map g^*F → F unless g is étale; the leg convention matters.

**Acceptance.**

- For c = (g, id) the graph-type correspondence of an endomorphism g, a c-morphism is a map u : g^*F → F; for g the Frobenius of X₀ ⊗ 𝔽̄_q, the Weil structure Fr^*F ≅ F of a sheaf on X₀ is one.
- For X₁ = X₂ = C = Spec k, a c-morphism is a morphism of perfect Λ-complexes F₁ → F₂.

**Source.** Y. Varshavsky, *Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara*, Definition 1.1.4 and Remark 1.1.5, p. 7 (arXiv v2). A c-morphism is a morphism c₂!c₁^*F₁ → F₂, usually called a cohomological correspondence lifting c.

**Source.** Q. Lu, W. Zheng, *Categorical traces and a relative Lefschetz–Verdier formula*, §2.2, Construction 2.6, p. 13 (arXiv v4). Cohomological correspondences as morphisms c₁^*L → c₂^!M, forming the 1-morphisms of a symmetric monoidal 2-category.

**Library home.** `TauCeti/AlgebraicGeometry/Etale/Correspondence`, namespace `TauCeti.EtaleDuality`.

<a id="node-EDC-8-cohomological-correspondence-pushforward"></a>

#### Pushforward of cohomological correspondences and the induced map on compactly supported cohomology

Node `EDC.8/cohomological-correspondence-pushforward` · construction.

Let [f] = (f₁, f♮, f₂) : c → b be a morphism of correspondences satisfying one of: (i) the square (c₁, f♮, f₁, b₁) is cartesian; (ii) f₁ and f♮ are proper; (iii) c₁ and b₁ are proper. Then there is a base change morphism BC : b₁^*f₁_! → f♮_!c₁^* (the standard one in (i), (ii); in (iii) adjoint to f₁_! → f₁_!c₁_*c₁^* = b₁_*f♮_!c₁^*), and every c-morphism u : c₂_!c₁^*F₁ → F₂ yields a b-morphism [f]_!(u) : b₂_!b₁^*(f₁_!F₁) → b₂_!f♮_!c₁^*F₁ = f₂_!c₂_!c₁^*F₁ → f₂_!F₂. Pushforwards compose: ([g] ∘ [f])_! = [g]_! ∘ [f]_! when both satisfy the same condition. For c₁ proper, the structure morphism to the trivial correspondence gives RΓ_c(u) : RΓ_c(X₁, F₁) → RΓ_c(X₂, F₂), explicitly RΓ_c(X₁, F₁) → RΓ_c(C, c₁^*F₁) = RΓ_c(X₂, c₂_!c₁^*F₁) → RΓ_c(X₂, F₂), and RΓ_c(u) is unchanged under compactification.

**Hypotheses.**

- All schemes are separated of finite type over a field k (separably closed whenever trace maps, local terms or traces on cohomology occur); ℓ is invertible in k; Λ is a finite ring killed by a power of ℓ, or a finite extension of ℤ_ℓ or ℚ_ℓ (in the adic case D^b_ctf is the category of EDC.6/classical-and-proetale-adic-categories); D^b_ctf(X, Λ) is the category of constructible complexes of finite Tor dimension (EDC.0/constructible-ctf-complexes), stable under the six operations.
- One of the three admissibility conditions (i)–(iii) for [f]; for RΓ_c(u), c₁ proper.

**Construction and proof.**

- BC in cases (i), (ii) is proper base change for Rf_! (EDC.0/enhanced-compact-pushforward); in case (iii) it is the adjoint composite using c₁_! = c₁_* (Varshavsky 1.1.6(a)).
- Compatibility with composition reduces to the compatibility of base change morphisms with composition (Varshavsky 1.1.6(b)).
- RΓ_c(u) := [π]_!(u) for the structure morphism, which satisfies (iii); independence of compactification by 1.1.6(b) (Varshavsky 1.1.7).

**Prerequisites.** [`EDC.8/cohomological-correspondence-lifting`](#node-EDC-8-cohomological-correspondence-lifting); `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`; `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`; `SchemeAndStackFoundations:SF.2`.

**Uses.**

- Varshavsky 2007, Proposition 1.2.5 and Corollary 1.2.6: traces are compatible with proper pushforward; RΓ_c(u) is the operator whose trace is computed.
- ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences: pushforward of Hecke correspondences to cohomology.
- EndoscopicTransferAndUnitaryTraceComparison:ET.5: action of Frobenius–Hecke correspondences on compactly supported Igusa cohomology.

**API.**

- `TauCeti.EtaleDuality.CohCorr.pushforward` (constructor): For an admissible [f] : c ⟶ b, the map CohCorr c F₁ F₂ → CohCorr b (f₁_!F₁) (f₂_!F₂).
- `TauCeti.EtaleDuality.CohCorr.pushforward_comp` (functoriality): ([g] ∘ [f])_! = [g]_! ∘ [f]_! for morphisms admissible for the same condition.
- `TauCeti.EtaleDuality.CohCorr.pushforward_id` (functoriality): The identity morphism of correspondences induces the identity.
- `TauCeti.EtaleDuality.CohCorr.rgammac` (constructor): For c₁ proper, RΓ_c(u) : RΓ_c(X₁, F₁) ⟶ RΓ_c(X₂, F₂).
- `TauCeti.EtaleDuality.CohCorr.rgammac_compactification` (compatibility): RΓ_c(u) agrees with RΓ_c of the extension of u to a compactification under RΓ_c(X_i, F_i) ≅ RΓ_c(X̄_i, j_i!F_i).
- `TauCeti.EtaleDuality.CohCorr.rgammac_graph` (simp): For the graph-type correspondence of proper g, RΓ_c(u) = H(u) ∘ g^* on RΓ_c(X, F).

**Unit tests.**

- `TauCeti.EtaleDuality.pushforward_trivial` (degenerate): Pushing forward along the identity morphism of the trivial correspondence over Spec k is the identity on Hom(F₁, F₂).
- `TauCeti.EtaleDuality.rgammac_graph_finite_set` (computation): For X = ⊔_{i∈I} Spec k finite, g a self-map σ of I and F = constant M, RΓ_c(u) is the endomorphism (x_i) ↦ (u_i(x_{σ(i)})) of M^I.
- `TauCeti.EtaleDuality.rgammac_frobenius_compat` (compatibility): For X₀ over 𝔽_q, F₀ a Weil complex and u its Frobenius structure on the graph of Frobenius, RΓ_c(u) is the geometric Frobenius endomorphism of RΓ_c(X, F) used by CohomologicalPointCounting TraceFormula.

**Acceptance.**

- For c the graph-type correspondence of g : X → X proper and u : g^*F → F, RΓ_c(u) is the endomorphism of RΓ_c(X, F) induced by g and u (pull back along g, then u).
- For the trivial correspondence over Spec k, [π]_! is the identity.

**Source.** Y. Varshavsky, *Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara*, 1.1.6 (a)–(b) and 1.1.7 (a)–(c), pp. 7–8 (arXiv v2). Pushforward of cohomological correspondences under the three admissibility conditions, compatibility with composition, and the map RΓ_c(u) with its independence of compactification.

**Library home.** `TauCeti/AlgebraicGeometry/Etale/Correspondence`, namespace `TauCeti.EtaleDuality`.

<a id="node-EDC-8-correspondence-pullback-and-restriction"></a>

#### Pullback, open restriction and restriction to invariant closed subsets

Node `EDC.8/correspondence-pullback-and-restriction` · construction.

(a) Pullback: if [f] : c → b has its right square cartesian up to nilpotents, or f♮ and f₂ étale, there is BC : c₂_!f♮^* → f₂^*b₂_!, and a b-morphism u gives a c-morphism [f]^*(u) : c₂_!c₁^*(f₁^*F₁) → f₂^*F₂. (b) Open restriction: for a self-correspondence c and open W ⊂ C, U ⊂ X, u restricts to u|_W and to u|_U on c|_U : c₁^{−1}(U) ∩ c₂^{−1}(U) → U × U. (c) A closed Z ⊂ X is c-invariant if c₁(c₂^{−1}(Z)) ⊂ Z set-theoretically, and locally c-invariant if each z ∈ Z has an open neighbourhood U with Z ∩ U c|_U-invariant; for c-invariant Z, c|_Z : c₂^{−1}(Z)_red → Z × Z and u restricts to u|_Z; in general one first restricts to the largest open W(Z) ⊂ C over which Z is invariant. (d) If c₂ is quasi-finite and x is a closed point, Fix(c|_x) is finite and for y ∈ Fix(c|_x) the restriction u_y : F_x → F_x is the summand of (c₂_!c₁^*F)_x → F_x at y; Tr(u_y) is the naive local term.

**Hypotheses.**

- All schemes are separated of finite type over a field k (separably closed whenever trace maps, local terms or traces on cohomology occur); ℓ is invertible in k; Λ is a finite ring killed by a power of ℓ, or a finite extension of ℤ_ℓ or ℚ_ℓ (in the adic case D^b_ctf is the category of EDC.6/classical-and-proetale-adic-categories); D^b_ctf(X, Λ) is the category of constructible complexes of finite Tor dimension (EDC.0/constructible-ctf-complexes), stable under the six operations.

**Construction and proof.**

- (a), (b): base change for cartesian squares up to nilpotents (topological invariance, SF.2) and étale base change (Varshavsky 1.1.8–1.1.9).
- (c): the largest open W(Z) is the complement of the closure of c₂^{−1}(Z) ∖ c₁^{−1}(Z) (Varshavsky Lemma 1.5.3(b)); invariance makes the inclusion of c|_Z cartesian up to nilpotents, so (a) applies (1.5.6).
- (d): for quasi-finite c₂ the stalk (c₂_!c₁^*F)_x is the direct sum of the stalks of c₁^*F over c₂^{−1}(x) (Varshavsky 1.5.7).

**Prerequisites.** [`EDC.8/cohomological-correspondence-lifting`](#node-EDC-8-cohomological-correspondence-lifting); [`EDC.8/cohomological-correspondence-pushforward`](#node-EDC-8-cohomological-correspondence-pushforward); `EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`; `SchemeAndStackFoundations:SF.2`.

**Uses.**

- Varshavsky 2007, Proposition 1.5.10 and Theorem 2.1.3: additivity of traces over Z and U, and the contracting case where local terms are computed on Z.
- Varshavsky 2020, Theorem 4.10: restriction to an invariant closed subscheme with no almost fixed points nearby.
- Hansen–Kaletha–Weinstein, Proposition 5.6.2: comparison of local terms on X and on a g-stable closed subscheme.

**API.**

- `TauCeti.EtaleDuality.CohCorr.pullbackAlong` (constructor): For [f] with right square cartesian up to nilpotents or f♮, f₂ étale, the map CohCorr b F₁ F₂ → CohCorr c (f₁^*F₁) (f₂^*F₂).
- `TauCeti.EtaleDuality.CohCorr.restrictOpen` (constructor): u ↦ u|_U for U ⊂ X open, on c|_U := c₁^{−1}(U) ∩ c₂^{−1}(U).
- `TauCeti.EtaleDuality.Correspondence.IsInvariant` (data): Z closed is c-invariant iff c₁(c₂^{−1}(Z)) ⊆ Z as sets.
- `TauCeti.EtaleDuality.Correspondence.IsLocallyInvariant` (data): Z is locally c-invariant iff every point of Z has an open U with Z ∩ U invariant for c|_U.
- `TauCeti.EtaleDuality.CohCorr.restrictClosed` (constructor): For Z c-invariant, u ↦ u|_Z on c|_Z : c₂^{−1}(Z)_red → Z × Z.
- `TauCeti.EtaleDuality.Correspondence.isLocallyInvariant_of_isInvariant` (relation): Invariant implies locally invariant, and locally invariant implies invariant in a neighbourhood of Fix(c) (Varshavsky 1.5.3(a),(e)).
- `TauCeti.EtaleDuality.CohCorr.naiveLocalTerm` (constructor): For c₂ quasi-finite and y ∈ Fix(c|_x), u_y : F_x ⟶ F_x and its trace.

**Unit tests.**

- `TauCeti.EtaleDuality.restrictOpen_univ` (degenerate): Restriction to U = X returns u (after the canonical identification c|_X = c).
- `TauCeti.EtaleDuality.isInvariant_point_of_finite_fibre` (computation): If c₂^{−1}(x) is finite, {x} is locally c-invariant (Varshavsky Example 1.5.2).
- `TauCeti.EtaleDuality.restrictClosed_graph_compat` (compatibility): For the graph-type correspondence of g with g(Z) ⊆ Z, restrictClosed gives the restriction g|_Z^*(F|_Z) → F|_Z of u.
- `TauCeti.EtaleDuality.not_isInvariant_translation` (non-example): For the graph of translation by 1 on 𝔸¹ in characteristic 0, the closed point {0} is not invariant.

**Acceptance.**

- For c the graph-type correspondence of an automorphism g with g(Z) = Z, Z is c-invariant and u|_Z is the restricted equivariant structure on F|_Z.
- Example 1.5.2 of Varshavsky: a closed point x with c₂^{−1}(x) finite is locally c-invariant.

**Source.** Y. Varshavsky, *Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara*, 1.1.8–1.1.9, p. 8; Definition 1.5.1, Example 1.5.2, Lemma 1.5.3, 1.5.6–1.5.8, pp. 14–16 (arXiv v2). Pullback and open restriction of c-morphisms, invariant and locally invariant closed subsets, restriction to them, and naive local terms for quasi-finite c₂.

**Library home.** `TauCeti/AlgebraicGeometry/Etale/Correspondence`, namespace `TauCeti.EtaleDuality`.

<a id="node-EDC-8-cohomological-correspondence-composition"></a>

#### Composition of cohomological correspondences

Node `EDC.8/cohomological-correspondence-composition` · construction.

Given cohomological correspondences (c, u) from (X, L) to (Y, M) and (d, v) from (Y, M) to (Z, N), their composite is supported on e : C ×_Y D → X × Z with legs c₁ ∘ pr_C and d₂ ∘ pr_D, and is the composite pr_C^*c₁^*L → pr_C^*c₂^!M → pr_D^!d₁^*M → pr_D^!d₂^!N, where the middle map is the base change pr_C^*c₂^! → pr_D^!d₁^* of the cartesian square (adjoint to the proper/compact base change isomorphism pr_D!pr_C^* ≅ d₁^*c₂!). Composition is associative and unital up to the canonical isomorphisms of fibre products, and is compatible with pushforward to Spec k: for c₁, d₁ proper, RΓ_c of the composite is RΓ_c(v) ∘ RΓ_c(u). Together with external products (X, L) ⊗ (X′, L′) = (X × X′, L ⊠ L′) these form a symmetric monoidal 2-category.

**Hypotheses.**

- All schemes are separated of finite type over a field k (separably closed whenever trace maps, local terms or traces on cohomology occur); ℓ is invertible in k; Λ is a finite ring killed by a power of ℓ, or a finite extension of ℤ_ℓ or ℚ_ℓ (in the adic case D^b_ctf is the category of EDC.6/classical-and-proetale-adic-categories); D^b_ctf(X, Λ) is the category of constructible complexes of finite Tor dimension (EDC.0/constructible-ctf-complexes), stable under the six operations.
- The base-change maps are those of EDC.1:adjoint/base-change-exchange-maps; external products use finite Tor dimension on both factors.

**Construction and proof.**

- The base change map pr_C^*c₂^! → pr_D^!d₁^* exists for every cartesian square of separated finite-type schemes (EDC.1:adjoint/base-change-exchange-maps), so the composite is always defined.
- Associativity and unit: coherence of base change maps with composition of squares (EDC.1:adjoint/upper-shriek-pseudofunctor).
- Compatibility with RΓ_c: compose the pushforwards of 1.1.6 and use proper base change (Lu–Zheng Construction 2.6).

**Prerequisites.** [`EDC.8/cohomological-correspondence-lifting`](#node-EDC-8-cohomological-correspondence-lifting); [`EDC.8/cohomological-correspondence-pushforward`](#node-EDC-8-cohomological-correspondence-pushforward); `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`; `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/upper-shriek-pseudofunctor`; `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`.

**Uses.**

- Lu–Zheng 2022, Construction 2.6: 1-composition in the 2-category of cohomological correspondences.
- ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/frobenius-hecke-correspondences: composing Hecke correspondences with Frobenius.
- EndoscopicTransferAndUnitaryTraceComparison:ET.5: Hecke correspondence composed with a power of Frobenius before the Fujiwara–Varshavsky trace.

**API.**

- `TauCeti.EtaleDuality.CohCorr.comp` (constructor): (c, u), (d, v) ↦ (c ×_Y d, composite).
- `TauCeti.EtaleDuality.CohCorr.comp_assoc` (structure): Associativity up to the canonical isomorphism of iterated fibre products, transporting the actual c-morphisms.
- `TauCeti.EtaleDuality.CohCorr.id_comp` (structure): The identity correspondence with u = id is a left and right unit.
- `TauCeti.EtaleDuality.CohCorr.rgammac_comp` (functoriality): For proper first legs, RΓ_c(v ∘ u) = RΓ_c(v) ∘ RΓ_c(u).
- `TauCeti.EtaleDuality.CohCorr.boxProduct` (structure): External product of cohomological correspondences, symmetric monoidal and compatible with composition.

**Unit tests.**

- `TauCeti.EtaleDuality.comp_graph` (computation): The composite of the graph-type correspondences of g and h is the graph-type correspondence of g ∘ h.
- `TauCeti.EtaleDuality.comp_id` (degenerate): Composition with the identity correspondence returns the original c-morphism after the canonical identification C ×_X X ≅ C.
- `TauCeti.EtaleDuality.comp_point_compat` (compatibility): For X = Y = Z = Spec k composition is composition of morphisms in D(Λ).
- `TauCeti.EtaleDuality.comp_assoc_up_to_iso` (characterisation): Composition is associative up to the canonical isomorphism (C ×_Y D) ×_Z E ≅ C ×_Y (D ×_Z E) of supports, which transports the composite c-morphisms into each other; it is an isomorphism of 1-morphisms of the 2-category, not an equality of supports.

**Acceptance.**

- Composing the graph-type correspondences of g and h (with structures u, v) gives the graph-type correspondence of g ∘ h with the composite structure.
- The identity correspondence of (X, L) with u = id is a unit.

**Source.** Q. Lu, W. Zheng, *Categorical traces and a relative Lefschetz–Verdier formula*, §2.2, Construction 2.6, p. 13 (arXiv v4). The 2-category of cohomological correspondences: composition over fibre products via base change, with symmetric monoidal structure by external products.

**Library home.** `TauCeti/AlgebraicGeometry/Etale/Correspondence`, namespace `TauCeti.EtaleDuality`.


### Trace maps and the Lefschetz–Verdier formula

The trace map of a self-correspondence is built from Illusie's Künneth identification, evaluation and base change along the diagonal; it commutes with proper pushforward and is additive over invariant closed subsets; the Lefschetz–Verdier formula follows, with the zero-dimensional case matching Tau Ceti's permutation-trace lemma.

<a id="node-EDC-8-trace-map-and-local-terms"></a>

#### The trace map of a self-correspondence and its local terms

Node `EDC.8/trace-map-and-local-terms` · construction. Planet: Trace of a cohomological correspondence.

Let k be separably closed, c : C → X × X a self-correspondence and F ∈ D^b_ctf(X, Λ). The trace map Tr_c : Hom(c₂_!c₁^*F, F) → H⁰(Fix(c), K_{Fix(c)}) is H⁰ of the composite RHom(c₁^*F, c₂^!F) ≅ c^!(DF ⊠ F) → c^!Δ_*K_X ≅ Δ′_*c′^!K_X = Δ′_*K_{Fix(c)}, where the first isomorphism is Illusie's Künneth identification, the middle map is induced by DF ⊠ F → Δ_*K_X adjoint to the evaluation DF ⊗ F → K_X, and the last is proper base change for the closed immersion Δ. For an open β ⊂ Fix(c), Tr_β is the restriction to β; if β is proper over k, the local term LT_β(u) ∈ Λ is the image of Tr_β(u) under the integration map π_β! : H⁰(β, K_β) → Λ. For the trivial correspondence over Spec k, Tr is the usual trace of an endomorphism of a perfect complex.

**Hypotheses.**

- All schemes are separated of finite type over a field k (separably closed whenever trace maps, local terms or traces on cohomology occur); ℓ is invertible in k; Λ is a finite ring killed by a power of ℓ, or a finite extension of ℤ_ℓ or ℚ_ℓ (in the adic case D^b_ctf is the category of EDC.6/classical-and-proetale-adic-categories); D^b_ctf(X, Λ) is the category of constructible complexes of finite Tor dimension (EDC.0/constructible-ctf-complexes), stable under the six operations.
- k separably closed; F of finite Tor dimension, so that biduality and the Künneth identification DF ⊠ F ≅ RHom(pr₁^*F, pr₂^!F) hold (EDC.1:biduality).

**Construction and proof.**

- Illusie's identification RHom(c₁^*F, c₂^!F) ≅ c^!RHom(pr₁^*F, pr₂^!F) ≅ c^!(DF ⊠ F) from EDC.1:adjoint/sheafified-adjunction and EDC.1:biduality/relative-and-geometric-duality.
- The evaluation map and the diagonal adjunction give DF ⊠ F → Δ_*K_X; base change c^!Δ_* ≅ Δ′_*c′^! for the cartesian square defining Fix(c) (EDC.1:adjoint/base-change-exchange-maps), and c′^!K_X = K_{Fix(c)} (Varshavsky 1.2.2(a)).
- Local terms by restriction and the proper integration map (Varshavsky 1.2.2(b), (1.3)–(1.4)); the trivial-correspondence case is Varshavsky 1.2.3 and matches the perfect-complex trace of CohomologicalPointCounting TraceFormula Layer 2.

**Prerequisites.** [`EDC.8/cohomological-correspondence-lifting`](#node-EDC-8-cohomological-correspondence-lifting); [`EDC.8/scheme-correspondence`](#node-EDC-8-scheme-correspondence); `EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`; `EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality`; `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction`; `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`; `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`; `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex`; `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`.

**Uses.**

- Varshavsky 2007, Proposition 1.2.5 and Corollary 1.2.6: the Lefschetz–Verdier formula equates the trace on cohomology with the sum of local terms.
- Varshavsky 2007, Theorem 2.1.3 and Theorem 2.3.2: local terms of contracting correspondences are naive.
- ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/geometric-automorphic-trace: trace classes of Hecke–Frobenius correspondences.
- Hansen–Kaletha–Weinstein, Proposition 5.6.2: true local terms loc_x(g, A) at isolated fixed points.

**API.**

- `TauCeti.EtaleDuality.CohCorr.traceMap` (constructor): Tr_c : Hom(c₂_!c₁^*F, F) → H⁰(Fix(c), K_{Fix(c)}), Λ-linear.
- `TauCeti.EtaleDuality.CohCorr.traceMap_linear` (simp): Tr_c is Λ-linear in u.
- `TauCeti.EtaleDuality.CohCorr.traceOn` (projection): Tr_β := restriction of Tr_c to an open β ⊆ Fix(c).
- `TauCeti.EtaleDuality.CohCorr.localTerm` (constructor): For β ⊆ Fix(c) open and proper over k, LT_β(u) := π_β!(Tr_β(u)) ∈ Λ.
- `TauCeti.EtaleDuality.CohCorr.localTerm_sum` (relation): For a finite partition of a proper Fix(c) into open-closed β, π_!Tr_c(u) = Σ_β LT_β(u).
- `TauCeti.EtaleDuality.CohCorr.traceMap_trivial` (compatibility): For the trivial correspondence over Spec k, Tr is the trace of a perfect complex of CohomologicalPointCounting TraceFormula Layer 2.
- `TauCeti.EtaleDuality.CohCorr.traceMap_restrictOpen` (compatibility): Tr commutes with restriction to open W ⊆ C containing the relevant part of Fix(c).

**Unit tests.**

- `TauCeti.EtaleDuality.traceMap_point` (degenerate): On the trivial correspondence, Tr(id_F) = χ(F) := Σ (−1)^i rank H^i(F) for F with free cohomology over a field Λ.
- `TauCeti.EtaleDuality.localTerm_isolated_identity` (computation): For g an automorphism with isolated fixed point x and F = Λ, u = id, if the induced map on the normal cone at x has no nonzero fixed vector then LT_x(u) = 1 (Varshavsky 2020, Corollary 4.11(b)).
- `TauCeti.EtaleDuality.localTerm_naive_compat` (compatibility): For c₂ quasi-finite and {x} c-invariant, LT_y(u|_x) equals the naive trace Tr(u_y | F_x).
- `TauCeti.EtaleDuality.localTerm_not_naive_identity_curve` (non-example): For the identity of a smooth proper curve X of genus g with F = Λ, Fix(c) = X is not isolated and its local term is χ(X) = 2 − 2g, not a sum of naive local terms 1 over points.

**Acceptance.**

- For the trivial correspondence pt → pt × pt, Tr(u) = Tr(u | F) for F a perfect Λ-complex (Varshavsky 1.2.3).
- For c₂ quasi-finite and an isolated fixed point y over a closed point x with {x} invariant, LT_y(u|_x) = Tr(u_y | F_x), the naive local term (Varshavsky 1.5.7).

**Source.** Y. Varshavsky, *Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara*, 0.3–0.4, pp. 5–6; Notation 1.2.1, 1.2.2 (a)–(b) with (1.2)–(1.4), Example 1.2.3, pp. 8–9 (arXiv v2). The trace map built from Illusie's Künneth isomorphisms, evaluation and base change along the diagonal; restriction to open β and integration over proper β give local terms; the trivial correspondence gives the usual trace.

**Library home.** `TauCeti/AlgebraicGeometry/Etale/Correspondence`, namespace `TauCeti.EtaleDuality`.

<a id="node-EDC-8-trace-pushforward-compatibility"></a>

#### Trace maps commute with proper pushforward of correspondences

Node `EDC.8/trace-pushforward-compatibility` · theorem.

Let [f] = (f, f♮, f) be a proper morphism from a self-correspondence c : C → X × X to b : B → Y × Y (the two outer components equal). Then the induced f′ : Fix(c) → Fix(b) is proper and, for every F ∈ D^b_ctf(X, Λ) and u ∈ Hom(c₂_!c₁^*F, F), Tr_b([f]_!(u)) = f′_!(Tr_c(u)) in H⁰(Fix(b), K_{Fix(b)}), where f′_! is the integration map of the proper f′. The correspondences c and b need not be proper.

**Hypotheses.**

- All schemes are separated of finite type over a field k (separably closed whenever trace maps, local terms or traces on cohomology occur); ℓ is invertible in k; Λ is a finite ring killed by a power of ℓ, or a finite extension of ℤ_ℓ or ℚ_ℓ (in the adic case D^b_ctf is the category of EDC.6/classical-and-proetale-adic-categories); D^b_ctf(X, Λ) is the category of constructible complexes of finite Tor dimension (EDC.0/constructible-ctf-complexes), stable under the six operations.
- [f] proper with equal outer components; k separably closed.

**Construction and proof.**

- Fix is functorial and f′ is a base change of proper maps, hence proper.
- Varshavsky constructs a compactifiable cohomological morphism from c to b and proves compatibility with trace maps by reduction to the identity correspondence and a diagram chase with Illusie's isomorphisms (Varshavsky Theorem 4.3.1, Corollary 4.3.2, §4.4).
- The statement for proper [f] is Varshavsky Proposition 1.2.5 (proved in 4.3.4).

**Prerequisites.** [`EDC.8/trace-map-and-local-terms`](#node-EDC-8-trace-map-and-local-terms); [`EDC.8/cohomological-correspondence-pushforward`](#node-EDC-8-cohomological-correspondence-pushforward); `EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality`; `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`.

**Acceptance.**

- For b the trivial correspondence and c proper, the statement is the Lefschetz–Verdier formula of EDC.8/lefschetz-verdier-trace-formula.

**Source.** Y. Varshavsky, *Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara*, Proposition 1.2.5, p. 10; Theorem 4.3.1, Corollary 4.3.2 and 4.3.4, pp. 34–36 (arXiv v2). Trace maps commute with proper pushforward of correspondences, without assuming c or b proper.

<a id="node-EDC-8-lefschetz-verdier-trace-formula"></a>

#### The Lefschetz–Verdier trace formula

Node `EDC.8/lefschetz-verdier-trace-formula` · theorem. Planet: Lefschetz–Verdier trace formula.

Let k be separably closed and c : C → X × X a self-correspondence proper over k (C and X proper over k). For every F ∈ D^b_ctf(X, Λ) and every c-morphism u : c₂_!c₁^*F → F, Tr(RΓ_c(u) | RΓ_c(X, F)) = Σ_{β ∈ π₀(Fix(c))} LT_β(u). For Λ a field this is Σ_i (−1)^i Tr(H^i_c(u)) = Σ_β LT_β(u). Ordinary Frobenius point counting (Grothendieck–Lefschetz) remains the theorem of CohomologicalPointCounting TraceFormula, and the contracting-boundary refinement is EDC.8/fujiwara-varshavsky-trace-formula.

**Hypotheses.**

- All schemes are separated of finite type over a field k (separably closed whenever trace maps, local terms or traces on cohomology occur); ℓ is invertible in k; Λ is a finite ring killed by a power of ℓ, or a finite extension of ℤ_ℓ or ℚ_ℓ (in the adic case D^b_ctf is the category of EDC.6/classical-and-proetale-adic-categories); D^b_ctf(X, Λ) is the category of constructible complexes of finite Tor dimension (EDC.0/constructible-ctf-complexes), stable under the six operations.
- c proper over k (the structure morphism [π]_c is proper); for the trace on cohomology, Λ such that RΓ_c(X, F) is perfect.

**Construction and proof.**

- Apply EDC.8/trace-pushforward-compatibility to the structure morphism [π]_c from c to the trivial correspondence: the left side is Tr([π]_!(u)) (Varshavsky 1.1.7, 1.2.3).
- The right side is π_{Fix(c)!}(Tr_c(u)), which splits over the connected components of the proper Fix(c) (Varshavsky Corollary 1.2.6; SGA 5 III 4.7).

**Prerequisites.** [`EDC.8/trace-pushforward-compatibility`](#node-EDC-8-trace-pushforward-compatibility); [`EDC.8/cohomological-correspondence-pushforward`](#node-EDC-8-cohomological-correspondence-pushforward); [`EDC.8/trace-map-and-local-terms`](#node-EDC-8-trace-map-and-local-terms); `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`.

**Acceptance.**

- For X = ⊔_{i∈I} Spec k finite, c the graph-type correspondence of σ : I → I and F = M constant: Tr(RΓ(u)) = Σ_{σ(i)=i} Tr(u_i | M), which is Tau Ceti's LinearMap.trace_pi_of_apply_eq (EDC.8/zero-dimensional-lefschetz-verdier).
- For X a smooth proper curve of genus g, c = Δ and F = ℚ_ℓ: χ(X) = 2 − 2g = LT_X(id), the self-intersection of the diagonal.

**Source.** Y. Varshavsky, *Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara*, Corollary 1.2.6, p. 10 (arXiv v2). For a correspondence proper over k, the trace of RΓ_c(u) equals the sum of local terms over the connected components of Fix(c).

<a id="node-EDC-8-zero-dimensional-lefschetz-verdier"></a>

#### The Lefschetz–Verdier formula for finite étale schemes and permutation correspondences

Node `EDC.8/zero-dimensional-lefschetz-verdier` · application.

Let k be separably closed, X = ⊔_{i ∈ I} Spec k for a finite set I, σ : I → I and g : X → X the induced morphism, c = (g, id) its graph-type correspondence, M a finite free Λ-module (Λ a field or ℤ/ℓⁿ) and F the constant sheaf with fibre M, with u : g^*F → F given by endomorphisms u_i : M → M. Then RΓ(X, F) = M^I, RΓ(u) acts by (x_i) ↦ (u_i(x_{σ(i)})), Fix(c) = {i : σ(i) = i}, LT_i(u) = Tr(u_i) and the Lefschetz–Verdier formula reads Tr(RΓ(u)) = Σ_{σ(i)=i} Tr(u_i | M), which is the linear-algebra identity of Tau Ceti's LinearMap.trace_pi_of_apply_eq; with M = Λ and u_i = 1 it counts fixed points (Mathlib's Matrix.trace_permutation).

**Hypotheses.**

- X finite étale (a finite disjoint union of copies of Spec k); Λ a field (for the cited linear-algebra lemma) or ℤ/ℓⁿ.

**Construction and proof.**

- Étale cohomology of a finite disjoint union of separably closed points is the product of fibres in degree 0.
- Fix(c) is the reduced finite scheme of fixed indices; at each the local term is naive (EDC.8/correspondence-pullback-and-restriction (d), with c₂ = id quasi-finite).
- Both sides are computed by tauceti:LinearMap.trace_pi_of_apply_eq with T = RΓ(u), and by mathlib:Matrix.trace_permutation when u_i = 1.

**Prerequisites.** [`EDC.8/lefschetz-verdier-trace-formula`](#node-EDC-8-lefschetz-verdier-trace-formula); [`EDC.8/correspondence-pullback-and-restriction`](#node-EDC-8-correspondence-pullback-and-restriction); `tauceti:LinearMap.trace_pi_of_apply_eq`; `mathlib:Matrix.trace_permutation`.

**Acceptance.**

- σ a transposition of I = {1, 2} with u_i = id on M = Λ: trace 0, no fixed points.
- σ = id: trace |I| · rank M = Σ_i Tr(id_M).

**Source.** Y. Varshavsky, *Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara*, Example 1.2.3 and 1.5.7, pp. 9 and 16 (arXiv v2). Over a point the trace map is the usual trace, and for quasi-finite c₂ local terms at isolated points are naive traces on stalks.

<a id="node-EDC-8-trace-additivity"></a>

#### Additivity of trace maps over an invariant closed subset and its complement

Node `EDC.8/trace-additivity` · theorem.

Let c : C → X × X be a self-correspondence, u : c₂_!c₁^*F → F a c-morphism and Z ⊂ X a closed c-invariant subset with open complement U. Then c₁^{−1}(U) ⊂ c₂^{−1}(U), u|_Z and u|_U extend by zero to c-morphisms [i_Z]_!(u|_Z) and [j_U]_!(u|_U), and Tr_c(u) = Tr_c([i_Z]_!(u|_Z)) + Tr_c([j_U]_!(u|_U)) in H⁰(Fix(c), K_{Fix(c)}). Consequently, for c proper over k, Tr(RΓ_c(u)) = Tr(RΓ_c(u|_Z)) + Tr(RΓ_c(u|_U)).

**Hypotheses.**

- All schemes are separated of finite type over a field k (separably closed whenever trace maps, local terms or traces on cohomology occur); ℓ is invertible in k; Λ is a finite ring killed by a power of ℓ, or a finite extension of ℤ_ℓ or ℚ_ℓ (in the adic case D^b_ctf is the category of EDC.6/classical-and-proetale-adic-categories); D^b_ctf(X, Λ) is the category of constructible complexes of finite Tor dimension (EDC.0/constructible-ctf-complexes), stable under the six operations.
- Z closed and c-invariant; k separably closed.

**Construction and proof.**

- [i_Z] is a closed embedding, so condition (ii) of EDC.8/cohomological-correspondence-pushforward applies; [j_U] satisfies the cartesian condition (i) because c₁^{−1}(U) ⊂ c₂^{−1}(U) (Varshavsky 1.5.9).
- Varshavsky proves the equality with filtered derived categories: the localisation triangle j_!F|_U → F → i_*F|_Z underlies a filtered object, and filtered trace maps are additive (Varshavsky Proposition 1.5.10, proved in §5.1–5.3).
- The statement on cohomology follows by applying EDC.8/lefschetz-verdier-trace-formula to the three c-morphisms.

**Prerequisites.** [`EDC.8/trace-map-and-local-terms`](#node-EDC-8-trace-map-and-local-terms); [`EDC.8/correspondence-pullback-and-restriction`](#node-EDC-8-correspondence-pullback-and-restriction); [`EDC.8/cohomological-correspondence-pushforward`](#node-EDC-8-cohomological-correspondence-pushforward); [`EDC.8/lefschetz-verdier-trace-formula`](#node-EDC-8-lefschetz-verdier-trace-formula); `EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`.

**Acceptance.**

- For the graph-type correspondence of an automorphism g of a proper curve and Z = X^g finite, the Lefschetz number splits into the fixed-point contribution and the contribution of U, which has no fixed points.

**Source.** Y. Varshavsky, *Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara*, 1.5.9 and Proposition 1.5.10, p. 16; §5.1–5.3, pp. 39–44 (arXiv v2). Additivity of trace maps for an invariant closed subset and its open complement, proved through filtered derived categories.


### Contracting correspondences and the Fujiwara–Varshavsky trace formula

Specialisation of cohomological correspondences along the deformation to the normal cone, Verdier's isomorphism on the zero section, contracting correspondences, Frobenius twists, and the resulting computation of local terms: naive local terms for large Frobenius twists (Fujiwara, Varshavsky) and for semisimple or finite-order automorphisms.

<a id="node-EDC-8-correspondence-specialization"></a>

#### Specialisation of cohomological correspondences over a trait

Node `EDC.8/correspondence-specialization` · construction.

Let k be separably closed, R a discrete valuation ring over k with residue field k (for example k[t]_{(t)} or k[[t]]), D = Spec R with generic point η and closed point s. A separated finite-type X̃ over D lifts X if it comes with ϕ : X̃ → X × D inducing X̃_η ≅ X_η; the specialisation functor is sp_{X̃}(F) := Ψ_{X̃}(ϕ_η^*F_η) : D^b_ctf(X, Λ) → D^b_ctf(X̃_s, Λ), with Ψ the nearby-cycles functor (computed after strict henselisation). A lift f̃ of f gives base-change maps f̃_s^*sp ↔ sp f^*, f̃_s!sp → sp f_!, sp f_* → f̃_s*sp, sp f^! → f̃_s^!sp, isomorphisms for f̃ proper (the ! and * pushforward ones) or smooth (pullback). For a lift c̃ of a correspondence c, every c-morphism u gives a c̃_s-morphism sp_c̃(u) : c̃_s2!c̃_s1^*sp F₁ → sp c₂!c₁^*F₁ → sp F₂. The trace maps commute with specialisation: sp_{Fix(c̃)}(Tr_c(u)) = Tr_{c̃_s}(sp_c̃(u)), where sp_{Fix(c̃)} : H⁰(Fix(c), K) → H⁰(Fix(c̃_s), K) is the induced map; c and c̃ need not be proper. For X̃ = X × D, sp is the identity.

**Hypotheses.**

- All schemes are separated of finite type over a field k (separably closed whenever trace maps, local terms or traces on cohomology occur); ℓ is invertible in k; Λ is a finite ring killed by a power of ℓ, or a finite extension of ℤ_ℓ or ℚ_ℓ (in the adic case D^b_ctf is the category of EDC.6/classical-and-proetale-adic-categories); D^b_ctf(X, Λ) is the category of constructible complexes of finite Tor dimension (EDC.0/constructible-ctf-complexes), stable under the six operations.
- R a DVR over k with residue field k; nearby cycles of LefschetzPencilsAndVanishingCycles:LPV.0 with torsion coefficients prime to the residue characteristic, extended to adic coefficients.

**Construction and proof.**

- Ψ is i^*Rj_* after strict henselisation (LPV.0 nearby cycles); the base-change maps are composites of proper/smooth base change on X̃ and the exchange maps of Ψ with g^*, Rg_*, Rg_! (LPV.0 functorialities) (Varshavsky 1.3.1–1.3.2).
- For the constant lift, i^*F_D → i^*Rj_*j^*F_D is an isomorphism (Varshavsky 1.3.3(a), Remark 3.2.5).
- sp_c̃(u) is the displayed composite (1.3.4); compatibility with trace maps is Varshavsky Proposition 1.3.5, proved with cohomological morphisms in §4 (4.3.4).

**Prerequisites.** `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`; `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`; [`EDC.8/trace-map-and-local-terms`](#node-EDC-8-trace-map-and-local-terms); [`EDC.8/cohomological-correspondence-lifting`](#node-EDC-8-cohomological-correspondence-lifting); `SchemeAndStackFoundations:SF.2`; `EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`.

**Uses.**

- Varshavsky 2007, proof of Theorem 2.1.3: specialise to the deformation to the normal cone and compare trace maps.
- EDC.8/normal-cone-specialization: the lift used is the deformation of X to the normal cone of Z.

**API.**

- `TauCeti.EtaleDuality.Lift` (data): A separated finite-type X̃ over D with ϕ : X̃ ⟶ X × D whose generic fibre is an isomorphism.
- `TauCeti.EtaleDuality.Lift.sp` (constructor): sp_{X̃} : D^b_ctf(X, Λ) ⥤ D^b_ctf(X̃_s, Λ), F ↦ Ψ(ϕ_η^*F_η).
- `TauCeti.EtaleDuality.Lift.sp_const` (simp): For the constant lift X × D, sp is naturally isomorphic to the identity.
- `TauCeti.EtaleDuality.Lift.bcLowerShriek` (compatibility): For a lift f̃ of f, f̃_s!sp → sp f_!, an isomorphism for f̃ proper.
- `TauCeti.EtaleDuality.CohCorr.sp` (constructor): For a lift c̃ of c, u ↦ sp_c̃(u), a c̃_s-morphism from sp F₁ to sp F₂.
- `TauCeti.EtaleDuality.CohCorr.traceMap_sp` (compatibility): sp_{Fix(c̃)} ∘ Tr_c = Tr_{c̃_s} ∘ sp_c̃ (Varshavsky Proposition 1.3.5).

**Unit tests.**

- `TauCeti.EtaleDuality.sp_const_trivial` (degenerate): For X = Spec k with the constant lift, sp is the identity on perfect Λ-complexes.
- `TauCeti.EtaleDuality.sp_nearby_compat` (compatibility): sp_{X̃}(F) = Ψ_{X̃}(ϕ_η^*F_η) is LefschetzPencilsAndVanishingCycles:LPV.0's nearby-cycles complex for the trait D.
- `TauCeti.EtaleDuality.sp_normalCone_point` (computation): For Z = X = Spec k the deformation to the normal cone is the constant lift and sp is the identity.
- `TauCeti.EtaleDuality.sp_normalCone_zeroSection` (characterisation): For the deformation to the normal cone of Z ⊂ X, restricting sp(F) to the zero section recovers F|_Z (Verdier; Varshavsky Proposition 1.4.2); away from the zero section sp(F) is not determined by F|_Z.

**Acceptance.**

- For the constant lift X × D and c × D, sp_c̃(u) = u and the compatibility is trivial.

**Source.** Y. Varshavsky, *Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara*, 1.3.1–1.3.4 and Proposition 1.3.5, pp. 10–12; 4.3.4, p. 35 (arXiv v2). Lifts over a trait, the specialisation functor through nearby cycles and its base-change maps, specialisation of c-morphisms, and commutation of trace maps with specialisation without properness.

**Library home.** `TauCeti/AlgebraicGeometry/Etale/Correspondence`, namespace `TauCeti.EtaleDuality`.

<a id="node-EDC-8-normal-cone-specialization"></a>

#### Deformation to the normal cone and Verdier’s specialisation isomorphism

Node `EDC.8/normal-cone-specialization` · theorem.

Let Z ⊂ X be a closed subscheme and R as in EDC.8/correspondence-specialization with uniformizer t. The deformation X̃_Z := Spec(O_{X_D}[I_{Z_D}/t]) lifts X, its special fibre is the normal cone N_Z(X) = Spec(⊕_n I_Zⁿ/I_Z^{n+1}), and Z_D ↪ X̃_Z restricts on the special fibre to the zero section Z ⊂ N_Z(X). (a) Verdier: for F ∈ D^b_ctf(X, Λ) the natural map sp_{X̃_Z}(F)|_Z → F|_Z is an isomorphism. (b) Functoriality: for f : X′ → X with f·(I_Z) ⊂ I_{Z′}, f lifts uniquely to f̃ : X̃′_{Z′} → X̃_Z; f̃_s(N_{Z′}(X′)) lies set-theoretically in the zero section iff f·(I_Z)ⁿ ⊂ I_{Z′}^{n+1} for some n; for Z′ = f^{−1}(Z) and f a closed embedding (resp. proper, smooth), so is f̃. (c) A correspondence c lifts to c̃_Z on the deformations, and the deformation of Fix(c) to the normal cone of c′^{−1}(Z) is a closed subscheme of Fix(c̃_Z).

**Hypotheses.**

- All schemes are separated of finite type over a field k (separably closed whenever trace maps, local terms or traces on cohomology occur); ℓ is invertible in k; Λ is a finite ring killed by a power of ℓ, or a finite extension of ℤ_ℓ or ℚ_ℓ (in the adic case D^b_ctf is the category of EDC.6/classical-and-proetale-adic-categories); D^b_ctf(X, Λ) is the category of constructible complexes of finite Tor dimension (EDC.0/constructible-ctf-complexes), stable under the six operations.
- Z ⊂ X closed; (a) for all F of finite Tor dimension (in fact for all constructible F).

**Construction and proof.**

- (b), (c): direct from the definition of the Rees-type algebra O_{X_D}[I_Z/t] (Varshavsky Lemma 1.4.3, Corollary 1.4.5).
- (a) is Verdier's (SP5); Varshavsky gives a complete proof, Verdier's being sketchy: reduce to X = 𝔸¹ and Z = {0} (the contractible case, §3.1) by a local computation with the G_m-action on the deformation, then treat the general case by induction (§3.2), using LPV.0's nearby cycles and their base change.

**Prerequisites.** [`EDC.8/correspondence-specialization`](#node-EDC-8-correspondence-specialization); `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle`; `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence`; [`EDC.8/scheme-correspondence`](#node-EDC-8-scheme-correspondence).

**Acceptance.**

- For Z = X the deformation is the constant lift and (a) is the identity.
- For X = 𝔸¹, Z = {0}, N_Z(X) = 𝔸¹ and (a) says the nearby cycles of the deformed constant sheaf restrict to F_0 at the zero section.

**Source.** Y. Varshavsky, *Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara*, Notation 1.4.1, Proposition 1.4.2, Lemma 1.4.3, 1.4.4 and Corollary 1.4.5, pp. 12–14; §3, pp. 21–25 (arXiv v2). The deformation to the normal cone as a lift, Verdier's theorem that specialisation restricted to the zero section recovers F|_Z (with a complete proof in §3, Verdier's being sketchy), and the functoriality used for correspondences.

<a id="node-EDC-8-contracting-correspondence"></a>

#### Contracting correspondences and Frobenius twists

Node `EDC.8/contracting-correspondence` · definition.

Let c : C → X × X be a correspondence and Z ⊂ X a closed subscheme. c stabilises Z if c₁·(I_Z) ⊂ c₂·(I_Z)·O_C (scheme-theoretically c₁(c₂^{−1}(Z)) ⊂ Z); c is contracting near Z if it stabilises Z and c₁·(I_Z)ⁿ ⊂ c₂·(I_Z)^{n+1}·O_C for some n ≥ 1; c is contracting near Z in a neighbourhood of fixed points if some open W ⊃ Fix(c) of C has c|_W contracting near Z. Over 𝔽̄_q with c defined over 𝔽_q, the n-th Frobenius twist is c^{(n)} := (Fr_X^n ∘ c₁, c₂) = (c₁ ∘ Fr_C^n, c₂). For f : Y → X and Z ⊂ X closed, ram(f, Z) is the least m with (I_{(f^{−1}Z)_red})^m ⊂ I_{f^{−1}Z}; for f quasi-finite, ram(f) := max_x ram(f, x) is finite.

**Hypotheses.**

- All schemes are separated of finite type over a field k (separably closed whenever trace maps, local terms or traces on cohomology occur); ℓ is invertible in k; Λ is a finite ring killed by a power of ℓ, or a finite extension of ℤ_ℓ or ℚ_ℓ (in the adic case D^b_ctf is the category of EDC.6/classical-and-proetale-adic-categories); D^b_ctf(X, Λ) is the category of constructible complexes of finite Tor dimension (EDC.0/constructible-ctf-complexes), stable under the six operations.
- Schemes noetherian (finite type over k); in the Frobenius statements k = 𝔽̄_q and c is defined over 𝔽_q.

**Construction and proof.**

- Stabilising Z implies Z_red is c-invariant (Varshavsky Remark 2.1.2(a)); contraction is equivalently the condition that the special fibre of the deformed correspondence c̃_Z maps N_{c^{−1}(Z)}(C) into the zero section of N_Z(X) (Remark 2.1.2(b), via EDC.8/normal-cone-specialization (b)).
- ram(f, Z) exists by noetherianity, and is bounded by dim_k k[f^{−1}(x)] for quasi-finite f (Varshavsky 2.2.2).

**Prerequisites.** [`EDC.8/scheme-correspondence`](#node-EDC-8-scheme-correspondence); [`EDC.8/correspondence-pullback-and-restriction`](#node-EDC-8-correspondence-pullback-and-restriction); [`EDC.8/normal-cone-specialization`](#node-EDC-8-normal-cone-specialization); `mathlib:AlgebraicGeometry.Scheme.IdealSheafData`; `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap`.

**Uses.**

- Varshavsky 2007, Theorem 2.1.3: local terms of contracting correspondences are computed on Z.
- Varshavsky 2007, Lemma 2.2.3 and Theorem 2.3.2: Frobenius twists of correspondences defined over 𝔽_q are contracting for large n.
- EndoscopicTransferAndUnitaryTraceComparison:ET.5: contracting near the boundary of a compactified Igusa variety after twisting by high powers of Frobenius.
- Varshavsky 2020, Lemma 4.7: contracting correspondences have no almost fixed points in a punctured tubular neighbourhood.

**API.**

- `TauCeti.EtaleDuality.Correspondence.Stabilizes` (data): c₁·(I_Z) ⊆ c₂·(I_Z)·O_C as ideal sheaves of C.
- `TauCeti.EtaleDuality.Correspondence.IsContractingNear` (data): Stabilizes c Z and ∃ n ≥ 1, c₁·(I_Z)ⁿ ⊆ c₂·(I_Z)^{n+1}·O_C.
- `TauCeti.EtaleDuality.Correspondence.IsContractingNearFix` (data): ∃ W ⊆ C open containing Fix(c) with c|_W contracting near Z.
- `TauCeti.EtaleDuality.Correspondence.frobeniusTwist` (constructor): c^{(n)} := (Fr_X^n ∘ c₁, c₂) for c defined over 𝔽_q.
- `TauCeti.EtaleDuality.ramification` (constructor): ram(f, Z) := least m with (I_{(f^{−1}Z)_red})^m ⊆ I_{f^{−1}Z}; ram(f) := max over closed points for f quasi-finite.
- `TauCeti.EtaleDuality.Correspondence.Stabilizes.isInvariant` (relation): If c stabilises Z then Z_red is c-invariant.
- `TauCeti.EtaleDuality.Correspondence.isContractingNear_iff_normalCone` (characterisation): c is contracting near Z iff it stabilises Z and the special fibre of the deformed correspondence maps the normal cone into the zero section.

**Unit tests.**

- `TauCeti.EtaleDuality.frobenius_isContractingNear_point` (computation): The graph-type correspondence (Fr, id) of the q-Frobenius is contracting near every 𝔽_q-rational point, with n = 1.
- `TauCeti.EtaleDuality.identity_not_contracting` (non-example): The identity correspondence of 𝔸¹ is not contracting near {0}: I² does not contain I.
- `TauCeti.EtaleDuality.isContractingNear_empty` (degenerate): Every correspondence is contracting near Z = X (I_Z = 0) and near Z = ∅ (I_Z = O_X), with n = 1.
- `TauCeti.EtaleDuality.ramification_etale` (compatibility): For f étale, ram(f, Z) = 1 for every closed Z (f^{−1}(Z) is reduced when Z is).

**Acceptance.**

- The graph-type correspondence (Fr, id) of the q-Frobenius of X = X₀ ⊗ 𝔽̄_q is contracting near every point x ∈ X₀(𝔽_q): Fr·(I_x) ⊆ I_x^q ⊆ I_x².
- The identity correspondence of X is not contracting near a nonempty closed Z that is not open: I_Zⁿ ⊄ I_Z^{n+1} for every n.

**Source.** Y. Varshavsky, *Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara*, Definition 2.1.1, Remark 2.1.2, p. 17; 2.2.1–2.2.2, pp. 18–19 (arXiv v2). Stabilising and contracting correspondences, contraction near fixed points, Frobenius twists of correspondences defined over 𝔽_q and the ramification degree.

**Library home.** `TauCeti/AlgebraicGeometry/Etale/Correspondence`, namespace `TauCeti.EtaleDuality`.

<a id="node-EDC-8-contracting-local-terms"></a>

#### Local terms of a contracting correspondence are computed on the contracted subscheme

Node `EDC.8/contracting-local-terms` · theorem.

Let c : C → X × X be contracting near a closed subscheme Z in a neighbourhood of fixed points, and β ⊂ Fix(c) open and connected with c′(β) ∩ Z ≠ ∅. Then (a) β ⊂ c′^{−1}(Z) set-theoretically, so β is an open connected subset of Fix(c|_Z); (b) for every c-morphism u, Tr_β(u) = Tr_β(u|_Z), and if β is proper over k, LT_β(u) = LT_β(u|_Z).

**Hypotheses.**

- All schemes are separated of finite type over a field k (separably closed whenever trace maps, local terms or traces on cohomology occur); ℓ is invertible in k; Λ is a finite ring killed by a power of ℓ, or a finite extension of ℤ_ℓ or ℚ_ℓ (in the adic case D^b_ctf is the category of EDC.6/classical-and-proetale-adic-categories); D^b_ctf(X, Λ) is the category of constructible complexes of finite Tor dimension (EDC.0/constructible-ctf-complexes), stable under the six operations.
- k separably closed; contraction near Z on an open neighbourhood of Fix(c).

**Construction and proof.**

- Replace c by its restriction to a neighbourhood of Fix(c) where it contracts and by C ∖ (Fix(c) ∖ β), so Fix(c) = β.
- (a): by EDC.8/normal-cone-specialization (b)–(c) the special fibre of the deformation maps the normal cone of c′^{−1}(Z) in β to the zero section, giving (I_{c′^{−1}Z})ⁿ = (I_{c′^{−1}Z})^{n+1} on β; connectedness and noetherianity force (I_{c′^{−1}Z})ⁿ = 0.
- (b): by EDC.8/trace-additivity, Tr_c(u) is the sum of the Z-part (equal to Tr_{c|_Z}(u|_Z) by EDC.8/trace-pushforward-compatibility for the closed embedding) and the U-part; to kill the U-part assume F|_Z = 0 and use EDC.8/correspondence-specialization for c and the deformation c̃_Z: the specialised c-morphism vanishes because the deformed first leg lands in the zero section where sp F = F|_Z = 0 (Verdier, EDC.8/normal-cone-specialization (a)), while sp on Fix is an isomorphism (Varshavsky Theorem 2.1.3).

**Prerequisites.** [`EDC.8/contracting-correspondence`](#node-EDC-8-contracting-correspondence); [`EDC.8/normal-cone-specialization`](#node-EDC-8-normal-cone-specialization); [`EDC.8/correspondence-specialization`](#node-EDC-8-correspondence-specialization); [`EDC.8/trace-additivity`](#node-EDC-8-trace-additivity); [`EDC.8/trace-pushforward-compatibility`](#node-EDC-8-trace-pushforward-compatibility); [`EDC.8/correspondence-pullback-and-restriction`](#node-EDC-8-correspondence-pullback-and-restriction).

**Acceptance.**

- For the graph-type correspondence of Frobenius and Z = {x} a fixed closed point, LT_x(u) is the naive term Tr(u_x | F_x).

**Source.** Y. Varshavsky, *Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara*, Theorem 2.1.3 and its proof, pp. 17–18 (arXiv v2). For a correspondence contracting near Z in a neighbourhood of fixed points, connected components of Fix meeting Z lie in Z and their trace maps and local terms equal those of the restriction to Z.

<a id="node-EDC-8-frobenius-twist-contracting"></a>

#### Frobenius twists are contracting for large powers

Node `EDC.8/frobenius-twist-contracting` · theorem.

Let c : C → X × X be a correspondence over 𝔽̄_q defined over 𝔽_q. (a) If Z ⊂ X is closed, n satisfies qⁿ > ram(c₂, Z), and Z is c^{(n)}-invariant, then c^{(n)} is contracting near Z. (b) If Z is a closed locally c-invariant subset defined over 𝔽_q, then c^{(n)} is contracting near Z in a neighbourhood of fixed points for every n with qⁿ > ram(c₂, Z). (c) If c₂ is quasi-finite, then for every n with qⁿ > ram(c₂), c^{(n)} is contracting near every closed point in a neighbourhood of fixed points, and Fix(c^{(n)}) is finite.

**Hypotheses.**

- k = 𝔽̄_q; c defined over 𝔽_q; ram as in EDC.8/contracting-correspondence.

**Construction and proof.**

- (a): with d = ram(c₂, Z), (c₁^{(n)})·(I_Z) is the qⁿ-th power of an ideal contained in I_{c₂^{−1}(Z)_red}, hence inside I_{c₂^{−1}(Z)_red}^{d+1} ⊂ I_{c₂^{−1}(Z)}, and its d-th power lies in I_{c₂^{−1}(Z)}^{d+1} (Varshavsky Lemma 2.2.3).
- (b): a locally c-invariant Z defined over 𝔽_q is locally c^{(n)}-invariant, so it is c^{(n)}|_W-invariant on the open W(Z) ⊃ Fix(c^{(n)}) (EDC.8/correspondence-pullback-and-restriction); apply (a) to c|_W (Varshavsky Corollary 2.2.4(a)).
- (c): closed points are locally invariant when c₂ is quasi-finite (Varshavsky Example 1.5.2, Corollary 2.2.4(b)); finiteness of Fix by EDC.8/contracting-local-terms (a) applied at each point (Theorem 2.3.2(a)).

**Prerequisites.** [`EDC.8/contracting-correspondence`](#node-EDC-8-contracting-correspondence); [`EDC.8/correspondence-pullback-and-restriction`](#node-EDC-8-correspondence-pullback-and-restriction); [`EDC.8/contracting-local-terms`](#node-EDC-8-contracting-local-terms).

**Acceptance.**

- For c the identity correspondence of X₀ ⊗ 𝔽̄_q, c^{(n)} is the graph of Frobenius^n, whose fixed points are X₀(𝔽_{qⁿ}), finite, for every n ≥ 1 (ram = 1).

**Source.** Y. Varshavsky, *Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara*, Lemma 2.2.3, Corollary 2.2.4, pp. 19; Theorem 2.3.2(a), p. 20 (arXiv v2). Twisting a correspondence defined over 𝔽_q by a large power of Frobenius makes it contracting near invariant subsets and near closed points, and makes the fixed-point set finite.

<a id="node-EDC-8-fujiwara-varshavsky-trace-formula"></a>

#### The Fujiwara–Varshavsky trace formula (Deligne’s conjecture)

Node `EDC.8/fujiwara-varshavsky-trace-formula` · theorem. Planet: Fujiwara–Varshavsky trace formula.

Let c : C → X × X be a correspondence over 𝔽̄_q defined over 𝔽_q, and U ⊂ X an open subset defined over 𝔽_q such that c₁ is proper over c₁^{−1}(U), c₂ is quasi-finite over c₂^{−1}(U), and X ∖ U is locally c-invariant. Then there is d ≥ ram(c₂|_{c₂^{−1}(U)}) such that for every F ∈ D^b_ctf(X, Λ) with F|_{X∖U} = 0, every n with qⁿ > d and every c^{(n)}-morphism u : c₂!(c₁^{(n)})^*F → F: Tr(RΓ_c(u)) = Σ_{y ∈ Fix(c^{(n)}) ∩ c₂^{−1}(U)} Tr(u_y | F_{c₂(y)}), a finite sum of naive local terms. If X and C are proper, d := max{ram(c₂|_{c₂^{−1}(U)}), ram(c₂, X ∖ U)} works. For F with a Weil structure ψ : Fr^*F → F and a c-morphism u, u^{(n)} := u ∘ ψⁿ is a c^{(n)}-morphism, and for U = X this is Deligne's conjecture proved by Fujiwara.

**Hypotheses.**

- k = 𝔽̄_q; c and U defined over 𝔽_q; the properness/quasi-finiteness over U and local invariance of X ∖ U; Λ and D^b_ctf as in EDC.8/scheme-correspondence's setting; RΓ_c(u) as in Varshavsky 2.3.1 (defined using c₁ proper over U and F|_{X∖U} = 0).

**Construction and proof.**

- RΓ_c(u) is defined by restricting to c₁^{−1}(U), where c₁ is proper, and using RΓ_c(U, F|_U) ≅ RΓ_c(X, F) (Varshavsky 2.3.1).
- Reduce (b) to (c): restrict to c₁^{−1}(U), compactify so that X̄ ∖ U stays locally invariant (Varshavsky Lemma 1.5.4), and extend u by zero; traces are unchanged (EDC.8/cohomological-correspondence-pushforward).
- (c): by EDC.8/lefschetz-verdier-trace-formula, Tr(RΓ_c(u)) = Σ_β LT_β(u). Components with c₂(β) ⊂ X ∖ U: c^{(n)} contracts near X ∖ U (EDC.8/frobenius-twist-contracting (b)), so LT_β(u) = LT_β(u|_{X∖U}) = 0 as F|_{X∖U} = 0 (EDC.8/contracting-local-terms).
- Components meeting c₂^{−1}(U) are points y (EDC.8/frobenius-twist-contracting (c)), c^{(n)} contracts near c₂(y), and LT_y(u) = LT_y(u|_x) = Tr(u_y) (EDC.8/contracting-local-terms and the naive term of EDC.8/correspondence-pullback-and-restriction (d)) (Varshavsky Theorem 2.3.2, Remark 2.3.3).

**Prerequisites.** [`EDC.8/lefschetz-verdier-trace-formula`](#node-EDC-8-lefschetz-verdier-trace-formula); [`EDC.8/frobenius-twist-contracting`](#node-EDC-8-frobenius-twist-contracting); [`EDC.8/contracting-local-terms`](#node-EDC-8-contracting-local-terms); [`EDC.8/correspondence-pullback-and-restriction`](#node-EDC-8-correspondence-pullback-and-restriction); [`EDC.8/cohomological-correspondence-pushforward`](#node-EDC-8-cohomological-correspondence-pushforward); [`EDC.8/trace-map-and-local-terms`](#node-EDC-8-trace-map-and-local-terms).

**Acceptance.**

- For c the identity correspondence of X₀ ⊗ 𝔽̄_q with X₀ proper, U = X and u^{(n)} = ψⁿ the Weil structure: the formula is the Grothendieck–Lefschetz trace formula Tr(Frⁿ | RΓ(X, F)) = Σ_{x ∈ X₀(𝔽_{qⁿ})} Tr(Frⁿ_x | F_x), the theorem of CohomologicalPointCounting TraceFormula Layer 11, here recovered for all n ≥ 1 (ram = 1).
- For a Hecke correspondence of a compactified modular curve with U the open modular curve, the formula computes Tr(Frobⁿ ∘ T | H_c) by fixed points in U for n large, the input consumed by EndoscopicTransferAndUnitaryTraceComparison:ET.5 and AutomorphicGaloisRepresentationsPartII:AG2.1a.

**Source.** Y. Varshavsky, *Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara*, 2.3.1, Theorem 2.3.2 and Remark 2.3.3, pp. 19–21 (arXiv v2). Varshavsky's generalisation of Fujiwara's theorem: for qⁿ large, the trace of a Frobenius-twisted correspondence on compactly supported cohomology is the sum of naive local terms over fixed points in U; for U = X it is Deligne's conjecture proved by Fujiwara.

<a id="node-EDC-8-finite-order-local-terms"></a>

#### True and naive local terms agree for semisimple and finite-order automorphisms

Node `EDC.8/finite-order-local-terms` · theorem.

Let k be algebraically closed of characteristic p ≥ 0 and X separated of finite type over k. (a) If f : X → X is a morphism and x ∈ Fix(f) is such that the induced map of normal cones N_x(f) : N_x(X) → N_x(X) has no nonzero fixed points, then x is an isolated fixed point and, for every u : f^*F → F with F ∈ D^b_ctf(X, Λ), LT_x(u) = Tr(u_x | F_x). (b) If a linear algebraic group G acts on X, g ∈ G is semisimple and x is an isolated fixed point of g, then N_x(g) has no nonzero fixed points, so LT_x(u) = Tr(u_x | F_x). (c) In particular, if g is an automorphism of X of finite order prime to p, at every isolated fixed point x the true local term of (g, u) equals the naive one; and for X proper and X^g finite, Tr(RΓ(u)) = Σ_{x ∈ X^g} Tr(u_x | F_x). The extension to perfectly finite-type schemes (Hansen–Kaletha–Weinstein, Proposition 5.6.2) is not part of this layer.

**Hypotheses.**

- All schemes are separated of finite type over a field k (separably closed whenever trace maps, local terms or traces on cohomology occur); ℓ is invertible in k; Λ is a finite ring killed by a power of ℓ, or a finite extension of ℤ_ℓ or ℚ_ℓ (in the adic case D^b_ctf is the category of EDC.6/classical-and-proetale-adic-categories); D^b_ctf(X, Λ) is the category of constructible complexes of finite Tor dimension (EDC.0/constructible-ctf-complexes), stable under the six operations.
- k algebraically closed; for (c), g^m = id as k-scheme automorphisms with m invertible in k, so that ⟨g⟩ is a finite diagonalizable group of order prime to p.

**Construction and proof.**

- (a): {x} is closed and invariant for the graph of f, and the graph has no fixed points in the punctured tubular neighbourhood of {x}; Varshavsky's Theorem 4.10(b) identifies LT_x(u) with LT_x(u|_x), which is the naive term (Varshavsky 2020, Corollary 4.11), using the specialisation-to-the-normal-cone method of EDC.8/contracting-local-terms.
- (b): for semisimple g, the closure of ⟨g⟩ is diagonalizable and N_{Z^g}(X^g) ≅ N_Z(X)^g (Lemma 5.1, Corollary 5.2); for an isolated fixed point this gives N_x(X)^g = {0} (Corollary 5.4(b), 5.6).
- (c): a finite-order automorphism of order prime to p generates a finite diagonalizable group, so g is semisimple (Example 5.3); the global statement follows from EDC.8/lefschetz-verdier-trace-formula.

**Prerequisites.** [`EDC.8/trace-map-and-local-terms`](#node-EDC-8-trace-map-and-local-terms); [`EDC.8/correspondence-pullback-and-restriction`](#node-EDC-8-correspondence-pullback-and-restriction); [`EDC.8/normal-cone-specialization`](#node-EDC-8-normal-cone-specialization); [`EDC.8/contracting-local-terms`](#node-EDC-8-contracting-local-terms); [`EDC.8/lefschetz-verdier-trace-formula`](#node-EDC-8-lefschetz-verdier-trace-formula); `mathlib:AlgebraicGeometry.Scheme`.

**Acceptance.**

- For the involution x ↦ −x of ℙ¹ (p ≠ 2) with F = Λ, u = id: fixed points 0 and ∞, naive terms 1 + 1 = 2 = Tr(g^* | H⁰ ⊕ H²) = 1 + 1.
- The finite-order hypothesis matters: for translation by 1 on 𝔸¹ ⊂ ℙ¹ in characteristic p (order p, not prime to p), the unique fixed point ∞ has naive term 1 while Tr(g^* | H*(ℙ¹)) = 2, so the local term at ∞ is 2, not naive.

**Source.** Y. Varshavsky, *Local terms for transversal intersections*, Theorem 4.10 and Corollary 4.11, p. 10; Lemma 5.1–Corollary 5.6, pp. 10–11 (arXiv v3). If the normal-cone map at an isolated fixed point has no nonzero fixed points the local term is naive; semisimple elements of linear algebraic groups, in particular automorphisms of finite order prime to p, satisfy this at isolated fixed points.

**Source.** D. Hansen, T. Kaletha, J. Weinstein, *On the Kottwitz conjecture for local shtuka spaces*, Proposition 5.6.2 and its proof, p. 61 (arXiv v4). The finite-type case of HKW's proposition is Varshavsky's theorem (combine Theorem 4.10(b) and Corollary 5.4(b)); HKW extend it to perfectly finite-type schemes by deperfection (PAPER-HANSEN-KALETHA-WEINSTEIN-22/090, /091).


### The functional-equation interface

Linear algebra of similitudes, the determinant of a similitude of a symmetric or alternating form, the graded Frobenius duality datum of a smooth proper variety or rational homology manifold, and the reciprocity and determinant identities that WeilConjectures WC.2 and WC.6 assemble into the functional equation.

<a id="node-EDC-8-similitude-charpoly-reciprocity"></a>

#### Characteristic polynomials of the two sides of a similitude are reciprocal

Node `EDC.8/similitude-charpoly-reciprocity` · theorem.

Let F be a field, V and W vector spaces of the same finite dimension b over F, ⟨·,·⟩ : V × W → F a perfect pairing, c ∈ F^×, and φ ∈ GL(V), ψ ∈ GL(W) with ⟨φv, ψw⟩ = c⟨v, w⟩ for all v, w. Then, under W ≅ V^∨ given by the pairing, ψ = c·(φ^∨)^{−1}; consequently det(ψ) = c^b det(φ)^{−1} and, in F[t], det(1 − tψ | W) = det(φ)^{−1}·det(φ − ct | V); equivalently, in F(t), det(1 − tψ | W) = (−ct)^b·det(φ)^{−1}·det(1 − (ct)^{−1}φ | V). Over an algebraic closure, the eigenvalues of ψ with algebraic multiplicity are the c/α for α the eigenvalues of φ. No semisimplicity of φ or ψ is assumed.

**Hypotheses.**

- F any field; ⟨·,·⟩ perfect; φ, ψ invertible; similitude factor c ∈ F^× (the same on both sides).

**Construction and proof.**

- ⟨v, ψw⟩ = c⟨φ^{−1}v, w⟩, so the functional ⟨·, ψw⟩ equals c·⟨·, w⟩ ∘ φ^{−1}; i.e. ψ corresponds to c·(φ^{−1})^∨ = c·(φ^∨)^{−1}.
- det(1 − tψ) = det(1 − tc·(φ^∨)^{−1}) = det(1 − tc·φ^{−1}) (transpose invariance, mathlib:Matrix.charpoly_transpose / mathlib:LinearMap.det_dualMap) = det(φ)^{−1} det(φ − ct).
- Taking t = 0 in det(ψ − x) form, or comparing constant terms, gives det ψ = c^b det(φ)^{−1}; the eigenvalue statement is the root statement for det(φ − ct) (compare mathlib:Matrix.charpoly_inv for c = 1).

**Prerequisites.** `mathlib:Matrix.charpoly_transpose`; `mathlib:LinearMap.det_dualMap`; `mathlib:Matrix.charpoly_inv`; `mathlib:Matrix.reverse_charpoly`; `mathlib:LinearMap.charpoly`.

**Acceptance.**

- b = 1, V = W = F with ⟨v, w⟩ = vw, φ = α, ψ = c/α: det(1 − tψ) = 1 − (c/α)t and det(φ)^{−1}det(φ − ct) = (α − ct)/α.
- A unipotent φ (Jordan block, α = 1) with c = q gives ψ with the single eigenvalue q of the same algebraic multiplicity, without diagonalisability.

**Source.** P. Deligne, *La conjecture de Weil. I*, (2.3)–(2.4), p. 281. Poincaré duality is a perfect Frobenius-compatible pairing H^i × H^{2n−i} → ℚ_ℓ(−n), so the Frobenius eigenvalues on H^{2n−i} are the qⁿ/α for α those on H^i; the linear-algebra step is the similitude identity stated here.

<a id="node-EDC-8-form-similitude-determinant"></a>

#### The determinant of a similitude of a symmetric or alternating form

Node `EDC.8/form-similitude-determinant` · theorem.

Let F be a field of characteristic ≠ 2, V of finite dimension b with a perfect bilinear form ⟨·,·⟩ which is symmetric (ε = +1) or alternating (ε = −1), c ∈ F^×, and φ ∈ GL(V) with ⟨φv, φw⟩ = c⟨v, w⟩. Fix s ∈ F̄ with s² = c and let m_± be the algebraic multiplicity of ±s as an eigenvalue of φ (the dimension of the generalized eigenspace over F̄). Then: (a) generalized eigenspaces V_α, V_β (α, β ∈ F̄) are orthogonal unless αβ = c, and V_α, V_{c/α} have equal dimension; (b) det(φ)² = c^b; (c) if ε = −1, then b, m_+ and m_− are even and det(φ) = c^{b/2}; (d) if ε = +1, then m_+ + m_− ≡ b (mod 2) and det(φ) = (−1)^{m_−} s^b, so when s ∈ F (e.g. c = q^d with d even, s = q^{d/2}), det(φ) = (−1)^{m_−} c^{b/2} = (−1)^{b − m_+} c^{b/2}.

**Hypotheses.**

- char F ≠ 2; form perfect and ε-symmetric; φ a similitude with factor c; no semisimplicity of φ.

**Construction and proof.**

- (a): write φ = α + N on V_α and φ = β + N′ on V_β with N, N′ nilpotent; then (c − αβ)⟨v, w⟩ = α⟨v, N′w⟩ + β⟨Nv, w⟩ + ⟨Nv, N′w⟩, and induction on the nilpotency orders gives ⟨v, w⟩ = 0 when αβ ≠ c; perfectness then pairs V_α perfectly with V_{c/α}.
- (b) is EDC.8/similitude-charpoly-reciprocity with W = V, ψ = φ: det φ = c^b det(φ)^{−1}.
- Eigenvalues α ≠ ±s come in pairs {α, c/α} of equal multiplicity, each pair contributing c^{dim V_α}; so det φ = c^{(b − m_+ − m_−)/2} s^{m_+} (−s)^{m_−} = (−1)^{m_−} s^b, and b − m_+ − m_− is even.
- (c): V_s and V_{−s} are self-paired, so the alternating form restricts to perfect alternating forms on them: m_± even and det φ = s^b = c^{b/2} (b even for an alternating perfect form; Tau Ceti's rank-two case is LinearMap.det_eq_of_compl₁₂_self_eq_smul).

**Prerequisites.** [`EDC.8/similitude-charpoly-reciprocity`](#node-EDC-8-similitude-charpoly-reciprocity); `mathlib:Module.End.maxGenEigenspace`; `tauceti:LinearMap.det_eq_of_compl₁₂_self_eq_smul`; `tauceti:TauCeti.BilinForm.IsIsometry.det_sq_mul_det_toMatrix_self`.

**Acceptance.**

- Rank-two alternating case: det φ = c, matching tauceti:LinearMap.det_eq_of_compl₁₂_self_eq_smul.
- Symmetric rank one with ⟨x, y⟩ = xy and φ = −s (c = s²): m_− = 1 and det φ = −s, so the sign is not determined by the form alone.
- Isometries (c = 1): det(φ)² = 1, matching tauceti:TauCeti.BilinForm.IsIsometry.det_sq_mul_det_toMatrix_self.

**Source.** P. Deligne, *La conjecture de Weil. I*, (2.6), pp. 281–282. For n odd the middle form is alternating so b_n is even; for n even the sign of the functional equation is (−1)^N with N the dimension of the generalized eigenspace of q^{n/2}.

**Source.** J. S. Milne, *Lectures on Étale Cohomology*, Remark 27.13 and Summary 27.14(a), p. 159. The sign of the functional equation is + if d is odd or q^{d/2} occurs an even number of times as an eigenvalue on H^d, and − otherwise.

<a id="node-EDC-8-graded-frobenius-duality-datum"></a>

#### Graded Frobenius duality data of weight (2d, q^d)

Node `EDC.8/graded-frobenius-duality-datum` · definition.

Fix a field E of characteristic 0, an integer d ≥ 0 and q ∈ E^×. A graded Frobenius duality datum consists of finite-dimensional E-vector spaces H^i (0 ≤ i ≤ 2d; zero otherwise), automorphisms F_i ∈ GL(H^i), and perfect pairings ⟨·,·⟩_i : H^i × H^{2d−i} → E such that ⟨F_i x, F_{2d−i} y⟩_i = q^d ⟨x, y⟩_i and ⟨x, y⟩_i = (−1)^i ⟨y, x⟩_{2d−i} (the Koszul sign (−1)^{i(2d−i)} = (−1)^i of graded commutativity). Its Betti numbers are b_i := dim H^i, its Euler characteristic χ := Σ (−1)^i b_i, its polynomials P_i(t) := det(1 − tF_i | H^i) and its determinant Δ := ∏_i det(F_i)^{(−1)^i} ∈ E^×. The middle form ⟨·,·⟩_d is (−1)^d-symmetric.

**Hypotheses.**

- E of characteristic 0 (so ℚ_ℓ with ℓ = 2 is allowed, and alternating and symmetric are distinct); pairings perfect; F acts by a similitude of factor q^d; no semisimplicity of F.

**Construction and proof.**

- The data are linear algebra; the main instance is built from EDC.2's Poincaré duality: for X₀ smooth proper of pure dimension d over 𝔽_q and ℓ ∤ q, H^i := H^i(X, ℚ_ℓ), F_i := geometric Frobenius, ⟨x, y⟩_i := Tr(x ∪ y) with the trace H^{2d}(X, ℚ_ℓ) → ℚ_ℓ(−d) composed with the identification of ℚ_ℓ(−d) on which F acts by q^d (EDC.2:pairings/cup-product-trace-pairing, EDC.2:pairings/galois-frobenius-equivariance, EDC.2:pairings/adic-and-rational-poincare-duality).
- Graded commutativity of cup product gives the Koszul sign; equivariance of the trace under Frobenius gives the similitude factor q^d (Weil I (2.5)).
- A second instance: X₀ proper of pure dimension d whose dualizing complex has a Frobenius-equivariant isomorphism a^!ℚ_ℓ ≅ ℚ_ℓ(d)[2d] (a rational homology manifold), with the pairing from EDC.1:biduality/relative-and-geometric-duality; this is the datum WeilConjectures:WC.6/homology-manifold-weil-assembly needs.

**Prerequisites.** `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`; `EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`; `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`; `EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality`; `mathlib:LinearMap.IsPerfPair`; `mathlib:LinearMap.charpoly`.

**Uses.**

- WeilConjectures:WC.2/signed-zeta-functional-equation: the graded duality of smooth proper varieties gives reciprocal polynomials and Δ² = q^{dχ}.
- WeilConjectures:WC.2/middle-degree-parity: the middle form is alternating for d odd, so b_d is even.
- WeilConjectures:WC.6/homology-manifold-weil-assembly: proper rational homology manifolds give the same datum without smoothness or projectivity.
- ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/dual-isotypic-pairing: dual isotypic pieces paired by a Frobenius similitude.

**API.**

- `TauCeti.GradedFrobeniusDuality` (data): Structure: d, q, spaces H : ℕ → FDVect E, automorphisms F i, pairings pair i : H i →ₗ H (2d − i) →ₗ E, perfectness, similitude and Koszul-symmetry fields.
- `TauCeti.GradedFrobeniusDuality.betti` (projection): b_i := finrank E (H i).
- `TauCeti.GradedFrobeniusDuality.betti_symm` (relation): b_i = b_{2d−i} for 0 ≤ i ≤ 2d.
- `TauCeti.GradedFrobeniusDuality.eulerChar` (projection): χ := Σ_{i ≤ 2d} (−1)^i b_i ∈ ℤ.
- `TauCeti.GradedFrobeniusDuality.frobPoly` (projection): P_i(t) := det(1 − t F_i) = charpolyRev of F_i.
- `TauCeti.GradedFrobeniusDuality.delta` (projection): Δ := ∏_{i ≤ 2d} det(F_i)^{(−1)^i} ∈ E^× (with zpow).
- `TauCeti.GradedFrobeniusDuality.middle_symm` (relation): ⟨x, y⟩_d = (−1)^d ⟨y, x⟩_d on H^d.
- `TauCeti.GradedFrobeniusDuality.ofSmoothProper` (constructor): The datum of a smooth proper X₀ of pure dimension d over 𝔽_q (EDC.2:pairings), with E = ℚ_ℓ.

**Unit tests.**

- `TauCeti.GradedFrobeniusDuality.zero_dim_point` (degenerate): d = 0, H⁰ = E, F = 1, ⟨1,1⟩ = 1: χ = 1, Δ = 1, P₀ = 1 − t.
- `TauCeti.GradedFrobeniusDuality.projectiveLine` (computation): The ℙ¹ datum (d = 1, F₀ = 1, F₂ = q) has χ = 2 and Δ = q, and Δ² = q^{dχ} = q².
- `TauCeti.GradedFrobeniusDuality.not_datum_wrong_factor` (non-example): H⁰ = H² = E with F₀ = 1, F₂ = 1 and ⟨1,1⟩ = 1, d = 1, q ≠ 1, is not a datum: the similitude condition ⟨F₀x, F₂y⟩ = q⟨x, y⟩ fails.
- `TauCeti.GradedFrobeniusDuality.curve_betti_even` (compatibility): For d = 1 the form on H¹ is alternating and perfect, so b₁ is even (agreeing with DeligneWeightsAndPurity:DWP.9/alternating-forms-have-even-rank).

**Acceptance.**

- ℙ¹ over 𝔽_q: H⁰ = E with F = 1, H² = E with F = q, ⟨1, 1⟩ = 1; d = 1, χ = 2, Δ = q.
- A smooth projective curve of genus g: H¹ of dimension 2g with the alternating cup-product form and F a symplectic similitude of factor q.

**Source.** P. Deligne, *La conjecture de Weil. I*, (2.3)–(2.6), pp. 281–282. Poincaré duality for smooth proper varieties is a perfect Frobenius-compatible pairing with values in ℚ_ℓ(−n), graded commutative, alternating in the middle degree for n odd.

**Library home.** `TauCeti/LinearAlgebra/Charpoly/Similitude`, namespace `TauCeti`.

<a id="node-EDC-8-poincare-reciprocity-export"></a>

#### Reciprocity of Frobenius polynomials and the determinant relation

Node `EDC.8/poincare-reciprocity-export` · theorem. Planet: Reciprocity of Frobenius polynomials.

For a graded Frobenius duality datum (EDC.8/graded-frobenius-duality-datum) of weight (2d, q^d): (a) b_i = b_{2d−i}; (b) for 0 ≤ i ≤ 2d, P_{2d−i}(t)·det(F_i) = (−q^d t)^{b_i}·P_i(1/(q^d t)) as an identity in E(t), and the eigenvalues of F_{2d−i} with algebraic multiplicity are the q^d/α for α those of F_i; (c) det(F_i)·det(F_{2d−i}) = q^{d b_i}; (d) if d is odd, b_d is even and det(F_d) = q^{d b_d/2}; if d is even, det(F_d) = (−1)^{m_−} q^{d b_d/2} = (−1)^{b_d − m_+} q^{d b_d/2}, where m_± is the algebraic multiplicity of ±q^{d/2} as an eigenvalue of F_d; (e) Δ² = q^{dχ}, and dχ is even. These are statements about the actual finite-dimensional spaces; no semisimplicity of Frobenius is assumed, and no zeta function is defined here (WeilConjectures:WC.2 assembles the signed functional equation from them). For X₀ smooth proper over 𝔽_q of pure dimension d and E = ℚ_ℓ (ℓ ∤ q, ℓ = 2 allowed) these apply to H^i(X, ℚ_ℓ) with geometric Frobenius, and likewise for proper rational homology manifolds.

**Hypotheses.**

- A graded Frobenius duality datum over a field of characteristic 0; for the geometric instances, the hypotheses of EDC.2:pairings (smooth proper) or a Frobenius-equivariant isomorphism a^!ℚ_ℓ ≅ ℚ_ℓ(d)[2d] (homology manifold).

**Construction and proof.**

- (a): the pairing H^i × H^{2d−i} → E is perfect.
- (b), (c): apply EDC.8/similitude-charpoly-reciprocity to V = H^i, W = H^{2d−i}, φ = F_i, ψ = F_{2d−i}, c = q^d: det(1 − tF_{2d−i}) = det(F_i)^{−1} det(F_i − q^d t), and det(F_i − q^d t) = (−q^d t)^{b_i} det(1 − (q^d t)^{−1}F_i).
- (d): the middle form is (−1)^d-symmetric (Koszul sign); apply EDC.8/form-similitude-determinant with c = q^d and s = q^{d/2} when d is even.
- (e): pairing i with 2d − i (same parity), Δ² = ∏_i (det F_i · det F_{2d−i})^{(−1)^i} = ∏_i q^{d b_i (−1)^i} = q^{dχ}; dχ is even because d even, or d odd and χ ≡ b_d ≡ 0 mod 2 after pairing the other degrees.

**Prerequisites.** [`EDC.8/graded-frobenius-duality-datum`](#node-EDC-8-graded-frobenius-duality-datum); [`EDC.8/similitude-charpoly-reciprocity`](#node-EDC-8-similitude-charpoly-reciprocity); [`EDC.8/form-similitude-determinant`](#node-EDC-8-form-similitude-determinant); `EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`; `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`.

**Acceptance.**

- ℙ¹: P₂(t)·det(F₀) = 1 − qt = (−qt)·(1 − 1/(qt)) = (−qt)·P₀(1/(qt)); Δ = q, χ = 2, Δ² = q².
- A curve of genus g: det(F₁) = q^g (alternating middle form), Δ = 1 · q^{−g} · q = q^{1−g}, χ = 2 − 2g and Δ² = q^{2−2g} = q^{dχ}.
- A smooth quadric surface over 𝔽_q (d = 2) whose two rulings are swapped by Frobenius: F on H² = ℚ_ℓ(−1)² has eigenvalues q and −q, m_− = 1, so det(F₂) = −q², the sign that the split quadric (eigenvalue q twice) does not have.

**Source.** P. Deligne, *La conjecture de Weil. I*, (2.4) and (2.6), pp. 281–282. Eigenvalues on H^{2n−i} are qⁿ/α; the functional equation Z(X₀, t) = ε q^{−nχ/2} t^{−χ} Z(X₀, q^{−n}t^{−1}) with ε = 1 for n odd and (−1)^N for n even, N the multiplicity of q^{n/2}.

**Source.** J. S. Milne, *Lectures on Étale Cohomology*, Remark 27.13 and Summary 27.14, p. 159. The sign of the functional equation from the multiplicity of q^{d/2} on H^d.


## Dependencies on other roadmaps

Every prerequisite outside this packet, with the nodes here that use it. Library declarations were read at the pinned commits.

| Prerequisite | Owner | Used by |
|---|---|---|
| `DeligneWeightsAndPurity:DWP.7/weights-mixed-sheaves-definitions` | DeligneWeightsAndPurity | [`EDC.7/mixed-perverse-sheaves`](#node-EDC-7-mixed-perverse-sheaves), [`EDC.7/pointwise-weight-criteria`](#node-EDC-7-pointwise-weight-criteria), [`EDC.7/simple-mixed-perverse-is-pure`](#node-EDC-7-simple-mixed-perverse-is-pure) |
| `DeligneWeightsAndPurity:DWP.8/directional-weight-estimates` | DeligneWeightsAndPurity | [`EDC.7/mixed-perverse-sheaves`](#node-EDC-7-mixed-perverse-sheaves), [`EDC.7/pointwise-weight-criteria`](#node-EDC-7-pointwise-weight-criteria), [`EDC.7/weight-ext-vanishing`](#node-EDC-7-weight-ext-vanishing), [`EDC.7/affine-cohomology-weight-criterion`](#node-EDC-7-affine-cohomology-weight-criterion), [`EDC.7/subquotient-weight-stability`](#node-EDC-7-subquotient-weight-stability), [`EDC.7/intersection-complex-purity`](#node-EDC-7-intersection-complex-purity), [`EDC.7/perverse-cohomology-weights`](#node-EDC-7-perverse-cohomology-weights) |
| `DeligneWeightsAndPurity:DWP.8/ext-one-of-lisse-sheaves-3-4-2` | DeligneWeightsAndPurity | [`EDC.7/frobenius-descent-of-perverse-sheaves`](#node-EDC-7-frobenius-descent-of-perverse-sheaves) |
| `DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity` | DeligneWeightsAndPurity | [`EDC.7/geometrically-semisimple-perverse-sheaf`](#node-EDC-7-geometrically-semisimple-perverse-sheaf) |
| `DeligneWeightsAndPurity:DWP.8/mixed-complexes` | DeligneWeightsAndPurity | [`EDC.7/mixed-perverse-sheaves`](#node-EDC-7-mixed-perverse-sheaves), [`EDC.7/pointwise-weight-criteria`](#node-EDC-7-pointwise-weight-criteria), [`EDC.7/weight-filtration`](#node-EDC-7-weight-filtration), [`EDC.7/generic-weight-criterion`](#node-EDC-7-generic-weight-criterion), [`EDC.7/perverse-cohomology-weights`](#node-EDC-7-perverse-cohomology-weights) |
| `DeligneWeightsAndPurity:DWP.8/potentially-property-p-3-4-10` | DeligneWeightsAndPurity | [`EDC.7/pure-specialization-of-geometric-origin`](#node-EDC-7-pure-specialization-of-geometric-origin) |
| `DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6` | DeligneWeightsAndPurity | [`EDC.7/intersection-complex-purity`](#node-EDC-7-intersection-complex-purity), [`EDC.7/decomposition-theorem`](#node-EDC-7-decomposition-theorem), [`EDC.7/semismall-decomposition`](#node-EDC-7-semismall-decomposition), [`EDC.7/relative-hard-lefschetz-theorem`](#node-EDC-7-relative-hard-lefschetz-theorem) |
| `DeligneWeightsAndPurity:DWP.8/pure-complexes` | DeligneWeightsAndPurity | [`EDC.7/mixed-perverse-sheaves`](#node-EDC-7-mixed-perverse-sheaves), [`EDC.7/pointwise-weight-criteria`](#node-EDC-7-pointwise-weight-criteria), [`EDC.7/weight-ext-vanishing`](#node-EDC-7-weight-ext-vanishing) |
| `DeligneWeightsAndPurity:DWP.8/six-operations-preserve-mixedness-6-1-11` | DeligneWeightsAndPurity | [`EDC.7/mixed-perverse-sheaves`](#node-EDC-7-mixed-perverse-sheaves), [`EDC.7/pure-specialization-of-geometric-origin`](#node-EDC-7-pure-specialization-of-geometric-origin) |
| `DeligneWeightsAndPurity:DWP.8/twist-shift-and-smooth-lisse-purity-6-2-5` | DeligneWeightsAndPurity | [`EDC.7/affine-cohomology-weight-criterion`](#node-EDC-7-affine-cohomology-weight-criterion), [`EDC.7/intersection-complex-purity`](#node-EDC-7-intersection-complex-purity), [`EDC.7/semismall-decomposition`](#node-EDC-7-semismall-decomposition) |
| `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-4-1-1` | DeligneWeightsAndPurity | [`EDC.7/intersection-cohomology-hard-lefschetz`](#node-EDC-7-intersection-cohomology-hard-lefschetz) |
| `DeligneWeightsAndPurity:DWP.9/hard-lefschetz-for-potentially-pure-complexes-6-2-13` | DeligneWeightsAndPurity | [`EDC.7/intersection-cohomology-hard-lefschetz`](#node-EDC-7-intersection-cohomology-hard-lefschetz) |
| `DeligneWeightsAndPurity:DWP.9/lefschetz-decomposition-of-a-graded-operator` | DeligneWeightsAndPurity | [`EDC.7/graded-lefschetz-object`](#node-EDC-7-graded-lefschetz-object), [`EDC.7/abstract-primitive-decomposition`](#node-EDC-7-abstract-primitive-decomposition) |
| `EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes` | EtaleDualityAndPerverseSheaves | [`EDC.8/cohomological-correspondence-lifting`](#node-EDC-8-cohomological-correspondence-lifting), [`EDC.8/cohomological-correspondence-composition`](#node-EDC-8-cohomological-correspondence-composition), [`EDC.8/trace-map-and-local-terms`](#node-EDC-8-trace-map-and-local-terms), [`EDC.8/lefschetz-verdier-trace-formula`](#node-EDC-8-lefschetz-verdier-trace-formula) |
| `EtaleDualityAndPerverseSheaves:EDC.0/derived-tensor-and-internal-hom` | EtaleDualityAndPerverseSheaves | [`EDC.7/frobenius-descent-of-perverse-sheaves`](#node-EDC-7-frobenius-descent-of-perverse-sheaves) |
| `EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward` | EtaleDualityAndPerverseSheaves | [`EDC.8/cohomological-correspondence-pushforward`](#node-EDC-8-cohomological-correspondence-pushforward) |
| `EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category` | EtaleDualityAndPerverseSheaves | [`EDC.8/cohomological-correspondence-lifting`](#node-EDC-8-cohomological-correspondence-lifting) |
| `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps` | EtaleDualityAndPerverseSheaves | [`EDC.8/cohomological-correspondence-pushforward`](#node-EDC-8-cohomological-correspondence-pushforward), [`EDC.8/cohomological-correspondence-composition`](#node-EDC-8-cohomological-correspondence-composition), [`EDC.8/trace-map-and-local-terms`](#node-EDC-8-trace-map-and-local-terms), [`EDC.8/trace-pushforward-compatibility`](#node-EDC-8-trace-pushforward-compatibility) |
| `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex` | EtaleDualityAndPerverseSheaves | [`EDC.8/trace-map-and-local-terms`](#node-EDC-8-trace-map-and-local-terms) |
| `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image` | EtaleDualityAndPerverseSheaves | [`EDC.8/cohomological-correspondence-lifting`](#node-EDC-8-cohomological-correspondence-lifting) |
| `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction` | EtaleDualityAndPerverseSheaves | [`EDC.8/cohomological-correspondence-lifting`](#node-EDC-8-cohomological-correspondence-lifting), [`EDC.8/trace-map-and-local-terms`](#node-EDC-8-trace-map-and-local-terms) |
| `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/upper-shriek-pseudofunctor` | EtaleDualityAndPerverseSheaves | [`EDC.8/cohomological-correspondence-composition`](#node-EDC-8-cohomological-correspondence-composition) |
| `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual` | EtaleDualityAndPerverseSheaves | [`EDC.8/trace-map-and-local-terms`](#node-EDC-8-trace-map-and-local-terms) |
| `EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality` | EtaleDualityAndPerverseSheaves | [`EDC.7/pointwise-weight-criteria`](#node-EDC-7-pointwise-weight-criteria), [`EDC.8/trace-map-and-local-terms`](#node-EDC-8-trace-map-and-local-terms) |
| `EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms` | EtaleDualityAndPerverseSheaves | [`EDC.7/pointwise-weight-criteria`](#node-EDC-7-pointwise-weight-criteria) |
| `EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions` | EtaleDualityAndPerverseSheaves | [`EDC.7/universal-hyperplane-lemma`](#node-EDC-7-universal-hyperplane-lemma), [`EDC.8/correspondence-pullback-and-restriction`](#node-EDC-8-correspondence-pullback-and-restriction), [`EDC.8/trace-additivity`](#node-EDC-8-trace-additivity) |
| `EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality` | EtaleDualityAndPerverseSheaves | [`EDC.8/trace-map-and-local-terms`](#node-EDC-8-trace-map-and-local-terms), [`EDC.8/trace-pushforward-compatibility`](#node-EDC-8-trace-pushforward-compatibility), [`EDC.8/graded-frobenius-duality-datum`](#node-EDC-8-graded-frobenius-duality-datum) |
| `EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality` | EtaleDualityAndPerverseSheaves | [`EDC.8/graded-frobenius-duality-datum`](#node-EDC-8-graded-frobenius-duality-datum), [`EDC.8/poincare-reciprocity-export`](#node-EDC-8-poincare-reciprocity-export) |
| `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing` | EtaleDualityAndPerverseSheaves | [`EDC.8/graded-frobenius-duality-datum`](#node-EDC-8-graded-frobenius-duality-datum) |
| `EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance` | EtaleDualityAndPerverseSheaves | [`EDC.8/graded-frobenius-duality-datum`](#node-EDC-8-graded-frobenius-duality-datum), [`EDC.8/poincare-reciprocity-export`](#node-EDC-8-poincare-reciprocity-export) |
| `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/top-degree-compact-cohomology` | EtaleDualityAndPerverseSheaves | [`EDC.7/semismall-decomposition`](#node-EDC-7-semismall-decomposition) |
| `EtaleDualityAndPerverseSheaves:EDC.3/chern-classes` | EtaleDualityAndPerverseSheaves | [`EDC.7/relative-hard-lefschetz-theorem`](#node-EDC-7-relative-hard-lefschetz-theorem) |
| `EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition` | EtaleDualityAndPerverseSheaves | [`EDC.7/universal-hyperplane-lemma`](#node-EDC-7-universal-hyperplane-lemma) |
| `EtaleDualityAndPerverseSheaves:EDC.5/adic-perverse-t-structures` | EtaleDualityAndPerverseSheaves | [`EDC.7/mixed-perverse-sheaves`](#node-EDC-7-mixed-perverse-sheaves) |
| `EtaleDualityAndPerverseSheaves:EDC.5/fibre-dimension-perverse-amplitude` | EtaleDualityAndPerverseSheaves | [`EDC.7/universal-hyperplane-lemma`](#node-EDC-7-universal-hyperplane-lemma), [`EDC.7/relative-hard-lefschetz-theorem`](#node-EDC-7-relative-hard-lefschetz-theorem) |
| `EtaleDualityAndPerverseSheaves:EDC.5/heart-abelian-subcategory` | EtaleDualityAndPerverseSheaves | [`EDC.7/frobenius-descent-of-perverse-sheaves`](#node-EDC-7-frobenius-descent-of-perverse-sheaves), [`EDC.7/weight-ext-vanishing`](#node-EDC-7-weight-ext-vanishing), [`EDC.7/geometrically-semisimple-perverse-sheaf`](#node-EDC-7-geometrically-semisimple-perverse-sheaf) |
| `EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex-of-local-system` | EtaleDualityAndPerverseSheaves | [`EDC.7/intersection-complex-purity`](#node-EDC-7-intersection-complex-purity), [`EDC.7/simple-mixed-perverse-is-pure`](#node-EDC-7-simple-mixed-perverse-is-pure) |
| `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure` | EtaleDualityAndPerverseSheaves | [`EDC.7/mixed-perverse-sheaves`](#node-EDC-7-mixed-perverse-sheaves), [`EDC.7/generic-weight-criterion`](#node-EDC-7-generic-weight-criterion), [`EDC.7/restricted-constructible-categories`](#node-EDC-7-restricted-constructible-categories) |
| `EtaleDualityAndPerverseSheaves:EDC.5/open-closed-perverse-recollement` | EtaleDualityAndPerverseSheaves | [`EDC.7/pure-open-closed-decomposition`](#node-EDC-7-pure-open-closed-decomposition) |
| `EtaleDualityAndPerverseSheaves:EDC.5/perverse-artin-vanishing` | EtaleDualityAndPerverseSheaves | [`EDC.7/affine-cohomology-weight-criterion`](#node-EDC-7-affine-cohomology-weight-criterion), [`EDC.7/subquotient-weight-stability`](#node-EDC-7-subquotient-weight-stability), [`EDC.7/intersection-complex-purity`](#node-EDC-7-intersection-complex-purity), [`EDC.7/universal-hyperplane-lemma`](#node-EDC-7-universal-hyperplane-lemma) |
| `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension` | EtaleDualityAndPerverseSheaves | [`EDC.7/intersection-complex-purity`](#node-EDC-7-intersection-complex-purity), [`EDC.7/quasi-finite-intermediate-extension-purity`](#node-EDC-7-quasi-finite-intermediate-extension-purity), [`EDC.7/semismall-decomposition`](#node-EDC-7-semismall-decomposition) |
| `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category` | EtaleDualityAndPerverseSheaves | [`EDC.7/frobenius-descent-of-perverse-sheaves`](#node-EDC-7-frobenius-descent-of-perverse-sheaves), [`EDC.7/mixed-perverse-sheaves`](#node-EDC-7-mixed-perverse-sheaves), [`EDC.7/geometrically-semisimple-perverse-sheaf`](#node-EDC-7-geometrically-semisimple-perverse-sheaf), [`EDC.7/graded-lefschetz-object`](#node-EDC-7-graded-lefschetz-object), [`EDC.7/universal-hyperplane-lemma`](#node-EDC-7-universal-hyperplane-lemma) |
| `EtaleDualityAndPerverseSheaves:EDC.5/perverse-verdier-self-duality` | EtaleDualityAndPerverseSheaves | [`EDC.7/mixed-perverse-sheaves`](#node-EDC-7-mixed-perverse-sheaves), [`EDC.7/subquotient-weight-stability`](#node-EDC-7-subquotient-weight-stability), [`EDC.7/weight-filtration`](#node-EDC-7-weight-filtration), [`EDC.7/relative-hard-lefschetz-theorem`](#node-EDC-7-relative-hard-lefschetz-theorem) |
| `EtaleDualityAndPerverseSheaves:EDC.5/quasi-finite-perverse-exactness` | EtaleDualityAndPerverseSheaves | [`EDC.7/quasi-finite-intermediate-extension-purity`](#node-EDC-7-quasi-finite-intermediate-extension-purity) |
| `EtaleDualityAndPerverseSheaves:EDC.5/recollement-intermediate-extension` | EtaleDualityAndPerverseSheaves | [`EDC.7/pure-open-closed-decomposition`](#node-EDC-7-pure-open-closed-decomposition) |
| `EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perversity` | EtaleDualityAndPerverseSheaves | [`EDC.7/semismall-decomposition`](#node-EDC-7-semismall-decomposition) |
| `EtaleDualityAndPerverseSheaves:EDC.5/shifted-local-systems-perverse` | EtaleDualityAndPerverseSheaves | [`EDC.7/intersection-complex-purity`](#node-EDC-7-intersection-complex-purity) |
| `EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves-classification` | EtaleDualityAndPerverseSheaves | [`EDC.7/affine-cohomology-weight-criterion`](#node-EDC-7-affine-cohomology-weight-criterion), [`EDC.7/simple-mixed-perverse-is-pure`](#node-EDC-7-simple-mixed-perverse-is-pure), [`EDC.7/weight-filtration`](#node-EDC-7-weight-filtration), [`EDC.7/geometrically-semisimple-perverse-sheaf`](#node-EDC-7-geometrically-semisimple-perverse-sheaf), [`EDC.7/pure-perverse-geometric-semisimplicity`](#node-EDC-7-pure-perverse-geometric-semisimplicity), [`EDC.7/pure-indecomposables`](#node-EDC-7-pure-indecomposables), [`EDC.7/pure-open-closed-decomposition`](#node-EDC-7-pure-open-closed-decomposition), [`EDC.7/pure-complex-geometric-splitting`](#node-EDC-7-pure-complex-geometric-splitting), [`EDC.7/semismall-decomposition`](#node-EDC-7-semismall-decomposition), [`EDC.7/geometric-origin-class`](#node-EDC-7-geometric-origin-class) |
| `EtaleDualityAndPerverseSheaves:EDC.5/small-pushforward-intersection-complex` | EtaleDualityAndPerverseSheaves | [`EDC.7/semismall-decomposition`](#node-EDC-7-semismall-decomposition) |
| `EtaleDualityAndPerverseSheaves:EDC.5/smooth-pullback-perverse-exactness` | EtaleDualityAndPerverseSheaves | [`EDC.7/universal-hyperplane-lemma`](#node-EDC-7-universal-hyperplane-lemma), [`EDC.7/relative-hard-lefschetz-theorem`](#node-EDC-7-relative-hard-lefschetz-theorem) |
| `EtaleDualityAndPerverseSheaves:EDC.5/t-structure-cohomology` | EtaleDualityAndPerverseSheaves | [`EDC.7/perverse-cohomology-weights`](#node-EDC-7-perverse-cohomology-weights), [`EDC.7/pure-complex-geometric-splitting`](#node-EDC-7-pure-complex-geometric-splitting), [`EDC.7/geometric-origin-class`](#node-EDC-7-geometric-origin-class) |
| `EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes` | EtaleDualityAndPerverseSheaves | [`EDC.7/relative-hard-lefschetz-theorem`](#node-EDC-7-relative-hard-lefschetz-theorem) |
| `EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories` | EtaleDualityAndPerverseSheaves | [`EDC.7/frobenius-descent-of-perverse-sheaves`](#node-EDC-7-frobenius-descent-of-perverse-sheaves), [`EDC.7/restricted-constructible-categories`](#node-EDC-7-restricted-constructible-categories), [`EDC.8/correspondence-specialization`](#node-EDC-8-correspondence-specialization) |
| `EtaleDualityAndPerverseSheaves:EDC.6/coefficient-extension-duality-and-classes` | EtaleDualityAndPerverseSheaves | [`EDC.7/mixed-perverse-sheaves`](#node-EDC-7-mixed-perverse-sheaves) |
| `EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison` | EtaleDualityAndPerverseSheaves | [`EDC.7/restricted-constructible-categories`](#node-EDC-7-restricted-constructible-categories), [`EDC.7/geometric-origin-class`](#node-EDC-7-geometric-origin-class), [`EDC.7/decomposition-theorem-complex`](#node-EDC-7-decomposition-theorem-complex) |
| `EtaleDualityAndPerverseSheaves:EDC.6/normalized-adic-system` | EtaleDualityAndPerverseSheaves | [`EDC.7/restricted-constructible-categories`](#node-EDC-7-restricted-constructible-categories) |
| `EtaleDualityAndPerverseSheaves:EDC.6/trace-orientation-comparison` | EtaleDualityAndPerverseSheaves | [`EDC.7/relative-hard-lefschetz-complex`](#node-EDC-7-relative-hard-lefschetz-complex) |
| `LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence` | LefschetzPencilsAndVanishingCycles | [`EDC.8/correspondence-specialization`](#node-EDC-8-correspondence-specialization), [`EDC.8/normal-cone-specialization`](#node-EDC-8-normal-cone-specialization) |
| `LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle` | LefschetzPencilsAndVanishingCycles | [`EDC.8/correspondence-specialization`](#node-EDC-8-correspondence-specialization), [`EDC.8/normal-cone-specialization`](#node-EDC-8-normal-cone-specialization) |
| `mathlib:AlgebraicGeometry.IsProper` | Mathlib | [`EDC.8/scheme-correspondence`](#node-EDC-8-scheme-correspondence) |
| `mathlib:AlgebraicGeometry.IsSeparated` | Mathlib | [`EDC.8/scheme-correspondence`](#node-EDC-8-scheme-correspondence) |
| `mathlib:AlgebraicGeometry.Scheme` | Mathlib | [`EDC.8/scheme-correspondence`](#node-EDC-8-scheme-correspondence), [`EDC.8/finite-order-local-terms`](#node-EDC-8-finite-order-local-terms) |
| `mathlib:AlgebraicGeometry.Scheme.IdealSheafData` | Mathlib | [`EDC.8/contracting-correspondence`](#node-EDC-8-contracting-correspondence) |
| `mathlib:AlgebraicGeometry.Scheme.IdealSheafData.comap` | Mathlib | [`EDC.8/contracting-correspondence`](#node-EDC-8-contracting-correspondence) |
| `mathlib:CategoryTheory.Abelian` | Mathlib | [`EDC.7/torsion-theory-splitting-lemma`](#node-EDC-7-torsion-theory-splitting-lemma), [`EDC.7/graded-lefschetz-object`](#node-EDC-7-graded-lefschetz-object) |
| `mathlib:CategoryTheory.IsArtinianObject` | Mathlib | [`EDC.7/torsion-theory-splitting-lemma`](#node-EDC-7-torsion-theory-splitting-lemma) |
| `mathlib:CategoryTheory.IsNoetherianObject` | Mathlib | [`EDC.7/torsion-theory-splitting-lemma`](#node-EDC-7-torsion-theory-splitting-lemma) |
| `mathlib:CategoryTheory.Limits.HasFiniteBiproducts` | Mathlib | [`EDC.7/geometrically-semisimple-perverse-sheaf`](#node-EDC-7-geometrically-semisimple-perverse-sheaf) |
| `mathlib:CategoryTheory.Limits.kernel` | Mathlib | [`EDC.7/graded-lefschetz-object`](#node-EDC-7-graded-lefschetz-object) |
| `mathlib:CategoryTheory.Limits.pullback` | Mathlib | [`EDC.8/scheme-correspondence`](#node-EDC-8-scheme-correspondence) |
| `mathlib:CategoryTheory.Simple` | Mathlib | [`EDC.7/torsion-theory-splitting-lemma`](#node-EDC-7-torsion-theory-splitting-lemma), [`EDC.7/geometrically-semisimple-perverse-sheaf`](#node-EDC-7-geometrically-semisimple-perverse-sheaf) |
| `mathlib:IsSemisimpleModule` | Mathlib | [`EDC.7/geometrically-semisimple-perverse-sheaf`](#node-EDC-7-geometrically-semisimple-perverse-sheaf) |
| `mathlib:LinearMap.IsPerfPair` | Mathlib | [`EDC.8/graded-frobenius-duality-datum`](#node-EDC-8-graded-frobenius-duality-datum) |
| `mathlib:LinearMap.charpoly` | Mathlib | [`EDC.8/similitude-charpoly-reciprocity`](#node-EDC-8-similitude-charpoly-reciprocity), [`EDC.8/graded-frobenius-duality-datum`](#node-EDC-8-graded-frobenius-duality-datum) |
| `mathlib:LinearMap.det_dualMap` | Mathlib | [`EDC.8/similitude-charpoly-reciprocity`](#node-EDC-8-similitude-charpoly-reciprocity) |
| `mathlib:Matrix.charpoly_inv` | Mathlib | [`EDC.8/similitude-charpoly-reciprocity`](#node-EDC-8-similitude-charpoly-reciprocity) |
| `mathlib:Matrix.charpoly_transpose` | Mathlib | [`EDC.8/similitude-charpoly-reciprocity`](#node-EDC-8-similitude-charpoly-reciprocity) |
| `mathlib:Matrix.reverse_charpoly` | Mathlib | [`EDC.8/similitude-charpoly-reciprocity`](#node-EDC-8-similitude-charpoly-reciprocity) |
| `mathlib:Matrix.trace_permutation` | Mathlib | [`EDC.8/zero-dimensional-lefschetz-verdier`](#node-EDC-8-zero-dimensional-lefschetz-verdier) |
| `mathlib:Module.End.maxGenEigenspace` | Mathlib | [`EDC.8/form-similitude-determinant`](#node-EDC-8-form-similitude-determinant) |
| `SchemeAndStackFoundations:SF.2` | SchemeAndStackFoundations | [`EDC.7/restricted-constructible-categories`](#node-EDC-7-restricted-constructible-categories), [`EDC.8/cohomological-correspondence-pushforward`](#node-EDC-8-cohomological-correspondence-pushforward), [`EDC.8/correspondence-pullback-and-restriction`](#node-EDC-8-correspondence-pullback-and-restriction), [`EDC.8/correspondence-specialization`](#node-EDC-8-correspondence-specialization) |
| `SchemeAndStackFoundations:SF.2/hochschild-serre-galois-covering` | SchemeAndStackFoundations | [`EDC.7/frobenius-descent-of-perverse-sheaves`](#node-EDC-7-frobenius-descent-of-perverse-sheaves) |
| `tauceti:LinearMap.det_eq_of_compl₁₂_self_eq_smul` | Tau Ceti | [`EDC.8/form-similitude-determinant`](#node-EDC-8-form-similitude-determinant) |
| `tauceti:LinearMap.trace_pi_of_apply_eq` | Tau Ceti | [`EDC.8/zero-dimensional-lefschetz-verdier`](#node-EDC-8-zero-dimensional-lefschetz-verdier) |
| `tauceti:TauCeti.BilinForm.IsIsometry.det_sq_mul_det_toMatrix_self` | Tau Ceti | [`EDC.8/form-similitude-determinant`](#node-EDC-8-form-similitude-determinant) |


## Consumers

- **EndoscopicTransferAndUnitaryTraceComparison ET.2b** uses EDC.7/decomposition-theorem, EDC.7/pure-perverse-geometric-semisimplicity and EDC.7/relative-hard-lefschetz-theorem for the Hitchin direct image; it must establish the locus, coefficients, purity, properness and the relatively ample class those statements need.
- **EndoscopicTransferAndUnitaryTraceComparison ET.5** imports cohomological correspondences, trace maps and EDC.8/fujiwara-varshavsky-trace-formula, and verifies their hypotheses for Igusa varieties.
- **AutomorphicGaloisRepresentationsPartII AG2.1a** uses EDC.8/fujiwara-varshavsky-trace-formula for Hecke correspondences composed with high Frobenius powers, with compact supports.
- **ExcursionOperatorsAndSpectralAction ES7 (equal characteristic)** uses composition and pushforward of Frobenius–Hecke correspondences, their trace maps, the Lefschetz–Verdier formula and the similitude reciprocity on dual isotypic pieces; the stack-level parts need the stacks Part II.
- **GeometricSatakeAndFusion GS1, GS3, GS4** use the decomposition theorem and geometric semisimplicity on finite-type proper models and resolutions over 𝔽̄_q, and the semismall decomposition for convolution maps; transport through perfection is the perfect-schemes Part II.
- **WeilConjectures WC.2 and WC.6** import EDC.8/graded-frobenius-duality-datum and EDC.8/poincare-reciprocity-export: reciprocal polynomials, Δ² = q^{dχ}, parity of b_d for odd d and the middle-degree sign from generalized eigenspaces, without semisimplicity and for ℓ = 2.
- **Yun–Zhang (II)** use purity of the relevant perverse direct images and the resulting weight splitting of cohomology sequences (§3.5) and middle-extension properties of small and finite direct images (§7.1); their stack and Frobenius-graph statements belong to the stacks Part II.


## Requests to other layers

- **SchemeAndStackFoundations:SF.2.** Adic constructible inputs over finite fields and finitely generated bases: (1) for X₀ separated of finite type over 𝔽_q and K₀, L₀ ∈ D^b_c(X₀, ℚ̄_ℓ), the Hochschild–Serre identification RΓ(X₀, RHom(K₀, L₀)) ≅ RΓ_cont(Gal(𝔽̄_q/𝔽_q), RHom(K, L)) with continuous cohomology of ℤ̂ on finite-dimensional ℓ-adic modules (invariants in degree 0, coinvariants in degree 1, zero above) — the adic, complex-level extension of SF.2/hochschild-serre-galois-covering; (2) spreading out of separated finite-type schemes, stratifications, lisse sheaves and finitely many operations over a finitely generated ℤ-algebra A ⊂ ℂ, with generic base change and constructibility of the Ext sheaves R^p a_* Ext^q(j_!L, j′_!L′) commuting with base change after shrinking Spec A (EGA IV §§8–9 type statements used by BBD 6.1.7–6.1.10); (3) proper base change for Rf_! and topological invariance of the étale site for squares cartesian up to nilpotents. Needed by: [`EDC.7/frobenius-descent-of-perverse-sheaves`](#node-EDC-7-frobenius-descent-of-perverse-sheaves), [`EDC.7/restricted-constructible-categories`](#node-EDC-7-restricted-constructible-categories), [`EDC.8/cohomological-correspondence-pushforward`](#node-EDC-8-cohomological-correspondence-pushforward), [`EDC.8/correspondence-pullback-and-restriction`](#node-EDC-8-correspondence-pullback-and-restriction), [`EDC.8/correspondence-specialization`](#node-EDC-8-correspondence-specialization).

## Recorded gaps

- **ℓ-adic sheaf theory, perverse sheaves, decomposition and trace formulas on Artin and Deligne–Mumford stacks (RT-AREA-etale/3).** EDC.7 and EDC.8 are scheme-only. The decomposition theorem for proper representable maps of DM stacks, perverse sheaves and IC on Artin stacks (Laszlo–Olsson, Liu–Zheng), and correspondences and trace formulas on DM stacks (Yun–Zhang 2017 Lemma A.11 and Proposition A.12, items PAPER-YUN-ZHANG-17/35 and PAPER-YUN-ZHANG-19/120; Lafforgue's stack operations, PAPER-LAFFORGUE-18/48) are planned nowhere. The owner is the proposed Part II 'Étale duality, cycle classes and perverse sheaves, Part II: Artin and Deligne–Mumford stacks' (paper route EtaleDualityAndPerverseSheavesPartIIStacks, design job DESIGN-EtaleDualityAndPerverseSheavesPartII), which imports the scheme nodes of this packet; see restructure. Needed by: `GlobalShtukasAndFunctionFieldLanglands:GS.1`, `GlobalShtukasAndFunctionFieldLanglands:GS.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`, `ShtukaSpecialCyclesAndHigherSiegelWeil`, `RamifiedGeometricClassFieldTheory`.
- **Perfect schemes, equivariant perverse sheaves and hyperbolic localisation (RT-AREA-etale/16).** The decomposition theorem on perfectly finite-type spaces (transport through deperfection), equivariant perverse sheaves and Borel equivariant cohomology, Braden's hyperbolic localisation for schemes (PAPER-ZHU-17/E09) and perfect-scheme local terms (Hansen–Kaletha–Weinstein Proposition 5.6.2, PAPER-HANSEN-KALETHA-WEINSTEIN-22/091) belong to the proposed Part II 'Étale duality, cycle classes and perverse sheaves, Part II: perfect schemes, equivariant coefficients and hyperbolic localization'. This packet keeps Zhu's finite-type decomposition (PAPER-ZHU-17/E06) as a source of EDC.7/decomposition-theorem and the finite-type local-term theorem (PAPER-HANSEN-KALETHA-WEINSTEIN-22/090) as EDC.8/finite-order-local-terms. Parity of IC stalks on Witt Grassmannians (PAPER-ZHU-17/IC-stalk-parity) is GeometricSatakeAndFusion's. Needed by: `GeometricSatakeAndFusion:GS1`, `GeometricSatakeAndFusion:GS3`, `GeometricSatakeAndFusion:GS4:rational-reductivity`.
- **Semisimplicity of the characteristic-zero decomposition over smaller coefficient fields.** BBD 6.2.5 is stated with ℂ (equivalently ℚ̄_ℓ) coefficients. For K defined over a subfield E ⊂ ℂ (for example ℚ) with K ⊗ ℂ semisimple of geometric origin, the vanishing of the degree-one connecting maps of the perverse truncation triangles descends to E because Hom spaces commute with coefficient extension, so Rf_*K ≅ ⊕ pH^i(Rf_*K)[−i] over E. Semisimplicity of the pH^i over E additionally needs Galois descent of subobjects of perverse sheaves along coefficient extension, which EDC.6/rational-perverse-coefficient-extension (Hom ⊗ E′ compatibility) does not state. The node asserts the splitting over E and records semisimplicity over E as this gap. Needed by: [`EDC.7/decomposition-theorem-complex`](#node-EDC-7-decomposition-theorem-complex).

## Structural proposals

- **rescope** (EtaleDualityAndPerverseSheaves, DeligneWeightsAndPurity). Upstream tier order (research/blueprint/upstream/CaraianiNewton.md) puts EtaleDualityAndPerverseSheaves in tier 10 and DeligneWeightsAndPurity in tier 11, but EDC.7 rests on DWP.8: mixed and pure complexes, stability of mixedness (Weil II 6.1.11), the upper-weight bound for Rf_! (Weil II 6.2.3, which is Deligne's main theorem 3.3.1 of DWP.7), the lisse purity criterion (6.2.5) and proper purity (6.2.6). DWP.0–DWP.8 in turn rest on EDC.0–EDC.4 and LPV.0–LPV.5, so these notions cannot move down into EDC without moving most of Weil I and Weil II with them. BBD's proof of relative hard Lefschetz (5.4.10–5.4.15) does not use DWP.9's absolute theorem; DWP.9 enters only as the specialisation EDC.7/intersection-cohomology-hard-lefschetz compares with. Proposal: Treat EDC.7 as a unit above DeligneWeightsAndPurity in the upstream order: package EDC.7 with DeligneWeightsAndPurity (as its final layer, or as a bundle with it), or move EDC.7 to a separate unit in tier 11 after DWP. EDC.0–EDC.6 and EDC.8 have no DWP dependence and stay in the tier-10 package. Replace the stage edge DeligneWeightsAndPurity:DWP.9 → EDC.7 by nothing (the absolute theorem is a consumer check, not an input), and keep DWP.7 → EDC.7 and DWP.8 → EDC.7.
- **rescope** (EtaleDualityAndPerverseSheaves, EndoscopicTransferAndUnitaryTraceComparison, AutomorphicGaloisRepresentationsPartII). AutomorphicGaloisRepresentationsPartII:AG2.1a requests from EDC.8 a generic Fujiwara–Varshavsky trace formula for Hecke correspondences composed with high Frobenius powers, independent of ET.5; ET.5's text assigns 'the required contracting-boundary Lefschetz–Verdier/Fujiwara trace theorem' to ET.5 itself. The theorem is general scheme geometry (Varshavsky 2007 §2), needed by both. Proposal: EDC.8 owns Varshavsky's contracting-correspondence theorem and the Fujiwara–Varshavsky trace formula (EDC.8/contracting-correspondence, EDC.8/contracting-local-terms, EDC.8/frobenius-twist-contracting, EDC.8/fujiwara-varshavsky-trace-formula). ET.5 imports them through the existing EDC.8 → ET.5 edge and keeps only the Igusa-specific verification of its hypotheses (compactification, local invariance of the boundary, isolation, acceptable functions and the Kottwitz-triple count). AG2.1a cites EDC.8/fujiwara-varshavsky-trace-formula. RS-19's ownership of 'the contracting-boundary Igusa theorem' by ET.5 is unchanged.
- **rescope** (EtaleDualityAndPerverseSheaves, GlobalShtukasAndFunctionFieldLanglands, EndoscopicTransferAndUnitaryTraceComparison, ShtukaSpecialCyclesAndHigherSiegelWeil, RamifiedGeometricClassFieldTheory). Confirmed finding RT-AREA-etale/3 for EDC.7 and EDC.8: their outputs are applied on algebraic stacks by GS.1, GS.3, ET.2b and the stack items YUN-ZHANG-17/35, YUN-ZHANG-19/120 and LAFFORGUE-18/48. Proposal: Plan once, in 'Étale duality, cycle classes and perverse sheaves, Part II: Artin and Deligne–Mumford stacks' (route EtaleDualityAndPerverseSheavesPartIIStacks): Laszlo–Olsson and Liu–Zheng operations, the perverse t-structure and IC on Artin stacks, the decomposition theorem for proper representable maps of DM stacks (importing EDC.7/decomposition-theorem and EDC.7/relative-hard-lefschetz-theorem by smooth descent), and correspondences and trace formulas on DM stacks (importing EDC.8/cohomological-correspondence-lifting, EDC.8/trace-map-and-local-terms, EDC.8/lefschetz-verdier-trace-formula and EDC.8/fujiwara-varshavsky-trace-formula). Add edges from that Part II to GS.1, GS.3 and ET.2b; route YUN-ZHANG-17/35 and YUN-ZHANG-19/120 there and correct LAFFORGUE-18/48 to missing with that owner; the shtuka and ramified class-field Part II briefs import it.
- **rescope** (EtaleDualityAndPerverseSheaves, GeometricSatakeAndFusion). Confirmed finding RT-AREA-etale/16 for EDC.7 and EDC.8: PAPER-ZHU-17's perfect-scheme, equivariant and hyperbolic-localisation items and HKW's perfect-scheme local terms are outside EDC's scheme scope. Proposal: Plan them in 'Étale duality, cycle classes and perverse sheaves, Part II: perfect schemes, equivariant coefficients and hyperbolic localization', importing GeometricSatakeAndFusion:GS0's perfect-space carrier, AdicCoefficientsAndComparisons:L2's perfection invariance, EDC.7/decomposition-theorem (transported through deperfection) and EDC.8/finite-order-local-terms (transported as in HKW 5.6.2). PAPER-ZHU-17/E06 stays a source of EDC.7/decomposition-theorem on finite-type models; PAPER-HANSEN-KALETHA-WEINSTEIN-22/090 is EDC.8/finite-order-local-terms; /091 and Zhu E09 (Braden) go to the Part II; the equivariant part is shared with the stacks Part II.
- **rescope** (EtaleDualityAndPerverseSheaves, GeometricSatakeAndFusion). The EDC.7 and EDC.8 nodes of the earlier unaccepted EDC.4 packet (ids EDC.7/… and EDC.8/… there) are re-planned here under new ids. GeometricSatakeAndFusion--GS0 cites EDC.7/proper-direct-image-decomposition of that packet. Proposal: When this packet is accepted, retire the EDC.7/EDC.8 nodes of research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.4.json and repoint consumers: EDC.7/proper-direct-image-decomposition → EDC.7/decomposition-theorem, EDC.7/ic-purity → EDC.7/intersection-complex-purity, EDC.7/relative-hard-lefschetz → EDC.7/relative-hard-lefschetz-theorem, EDC.8/correspondence-trace → EDC.8/trace-map-and-local-terms, EDC.8/local-terms-finite-order → EDC.8/finite-order-local-terms. This packet's EDC.5 inputs already cite the EDC.5 packet through its supersededDraftNodes table.

## Mistakes found in the sources

- **EtaleDualityAndPerverseSheaves/E701** (misprint, Faisceaux pervers, 5.4.14, Preuve de 5.4.10 (i = 1), p. 147 (Numdam scan of Astérisque 100, 1982; checked on the page image, PDF page 148)). The proof says that the degree-zero perverse cohomology of the pushforward along the universal hyperplane section is semisimple and cites 5.3.7 for this. Correction: The semisimplicity of a pure perverse sheaf over the algebraic closure is Théorème 5.3.8; 5.3.7 is the generic criterion for upper weights. Reason: 5.3.7 (p. 137) characterises weights ≤ w by generic cohomology sheaves and says nothing about semisimplicity; 5.3.8 (p. 138) is the geometric semisimplicity theorem, which is what the argument uses to match the largest subobject and the largest quotient coming from Y. Affects: nothing; known: new.
- **EtaleDualityAndPerverseSheaves/E702** (misprint, Faisceaux pervers, Corollaire 5.3.11, p. 140 (Numdam scan; checked on the page image, PDF page 141)). The statement names the closed complement of the open U₀ by the same letter F₀ that denotes the pure perverse sheaf being decomposed. Correction: Use a different letter for the closed complement, say i : Z₀ ↪ X₀. Reason: The decomposition F₀ = j_!*F′₀ ⊕ i_*F″₀ then reads unambiguously; with the clash, 'i : F₀ ↪ X₀' and the perverse sheaf F₀ coincide in notation. Affects: nothing; known: new.

## Coverage

- `EDC.7`: planned. EDC.5 and EDC.6 inputs cite the (unreviewed) EDC.5 and EDC.6 packets; follow any renaming their reviews make. Semisimplicity over subfields of ℂ of the characteristic-zero decomposition (recorded gap); the stack and perfect-scheme extensions are the proposed Part IIs (recorded gaps).
- `EDC.8`: planned. EDC.6 coefficient inputs cite the ids the (unreviewed) EDC.6 packet imports; follow any renaming its review makes. Correspondences and trace formulas on DM stacks and perfect-scheme local terms are the proposed Part IIs (recorded gaps).

## Sources

- A. A. Beilinson, J. Bernstein, P. Deligne, *Faisceaux pervers*, Astérisque 100 (1982), 5–171; Numdam scan (printed page = PDF page − 1). <https://www.numdam.org/item/AST_1982__100__1_0.pdf>. Read: §5.0–5.1 (5.1.1–5.1.15), pp. 121–129; §5.2 (5.2.1), pp. 129–134; §5.3 (5.3.1–5.3.11), pp. 134–140; §5.4 (5.4.1–5.4.15), pp. 140–147; §6.1.8–6.1.10, pp. 155–159; §6.2.2–6.2.11, pp. 160–165; page images checked for 5.1.15 (p. 129), 5.3.11 (p. 140), 5.4.10 (p. 144), 5.4.14 (p. 147).
- P. Deligne, *La conjecture de Weil. II*, Publ. Math. IHÉS 52 (1980), 137–252 (Numdam). <https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf>. Read: Théorème (3.4.1), p. 207 (statement); (6.1.11), p. 246; (6.2.1)–(6.2.7), pp. 247–248; (6.2.13), p. 250 (statement); other Weil II inputs enter through the accepted DeligneWeightsAndPurity DWP.7 packet.
- P. Deligne, *La conjecture de Weil. I*, Publ. Math. IHÉS 43 (1974), 273–307 (Numdam). <https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf>. Read: (2.3)–(2.6), pp. 281–282.
- J. S. Milne, *Lectures on Étale Cohomology*, Version 2.21, 22 March 2013. <https://www.jmilne.org/math/CourseNotes/LEC.pdf>. Read: §27, Remark 27.13 and Summary 27.14, p. 159.
- Y. Varshavsky, *Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara*, Geom. Funct. Anal. 17 (2007); arXiv:math/0505564v2. <https://arxiv.org/pdf/math/0505564v2>. Read: 0.1–0.4, pp. 4–6; §1.1–1.2 (1.1.1–1.2.6), pp. 6–10; §1.3–1.4 (statements), pp. 10–14; §1.5 (1.5.1–1.5.10), pp. 14–16; §2 (2.1.1–2.3.3), pp. 17–21.
- Y. Varshavsky, *Local terms for transversal intersections*, arXiv:2003.06815v3. <https://arxiv.org/pdf/2003.06815v3>. Read: Lemma 4.7–Corollary 4.11, pp. 9–10; §5 (Lemma 5.1–Theorem 5.9), pp. 10–12.
- D. Hansen, T. Kaletha, J. Weinstein, *On the Kottwitz conjecture for local shtuka spaces*, Forum Math. Pi 10 (2022); arXiv:1709.06651v4. <https://arxiv.org/pdf/1709.06651v4>. Read: Proposition 5.6.2 and the surrounding argument, pp. 60–62.
- Q. Lu, W. Zheng, *Categorical traces and a relative Lefschetz–Verdier formula*, Forum Math. Sigma 10 (2022); arXiv:2005.08522v4. <https://arxiv.org/pdf/2005.08522v4>. Read: §2.2, Construction 2.6, p. 13.
- M. A. de Cataldo, L. Migliorini, *The decomposition theorem, perverse sheaves and the topology of algebraic maps*, Bull. AMS 46 (2009); arXiv:0712.0349v2. <https://arxiv.org/pdf/0712.0349v2>. Read: Theorem 1.6.1 and 1.6.3, pp. 13–14; Theorem 3.1.11 and Remark 3.1.12, p. 38; §4.2, Proposition 4.2.1–Theorem 4.2.7, pp. 55–57; Theorem 5.2.1, pp. 81–82.
- Z. Yun, W. Zhang, *Shtukas and the Taylor expansion of L-functions (II)*, Ann. of Math. 189 (2019), no. 2, 393–526 (published version, author copy). <https://math.mit.edu/~zyun/GZW_ramified_published.pdf>. Read: §3.5 (Corollary 3.29, (3.36)–(3.38)), pp. 443–452; §7.1 (Propositions 7.1–7.3), pp. 506–509.
- X. Zhu, *Affine Grassmannians and the geometric Satake in mixed characteristic*, Ann. of Math. 185 (2017), no. 2; arXiv:1407.8519v3. <https://arxiv.org/pdf/1407.8519v3>. Read: §2.1 (proof of Proposition 2.3), p. 21; §2.1–2.2 (Lemma 2.11 and its proof), pp. 24–27; Appendix A.3.1, pp. 54–55.
