# Étale duality, cycle classes and perverse sheaves, EDC.4: weak Lefschetz, projective bundles and blow-ups

Weak Lefschetz compares the cohomology of a smooth projective variety with that of a hyperplane section below the middle degree; the projective-bundle and blow-up formulas compute the cohomology of a projective bundle and of a blow-up along a smooth centre from the base and the centre. This layer plans the forms of these theorems that the atlas's consumers need beyond what EtaleCohomologyFoundations states: weak Lefschetz for possibly singular hyperplane sections with lisse coefficients (Deligne, Weil II, 4.1.6), its Gysin form and the torsion-freeness of the integral cokernel, ample divisors and complete-intersection chains, the cohomology of smooth complete intersections, the ring structure, pushforward, pairing and Frobenius weights of the projective-bundle decomposition, the sheaf-level blow-up decomposition with its explicit columns, retraction and weights, the blow-up along the axis of a pencil, split injectivity of pullback with supports (Liu–Tian–Xiao–Zhang–Zhu, Lemma 5.11.3) and the vanishing and restricted subspaces of a hyperplane section.

**Revision four.** Revision four (maintainer-directed) narrows this packet to EDC.4, weak Lefschetz, projective bundles and blow-ups, which the queue job names as its scope. The 92 draft nodes of EDC.5, EDC.7 and EDC.8 that the accepted EDC.5 and EDC.7 packets re-planned under new ids are retired with an exact replacement map (retiredDraftNodes); this removes the general semismall draft whose costalk step the third review could not verify, in favour of the accepted EDC.5 theorem that assumes adaptation of both K and D\_X K. The twelve EDC.6 nodes stay, because the accepted EDC.6 and EDC.7 packets import them by id. Every surviving node now consumes the six operations, duality, purity, Gysin, cycle-class, projective-bundle, blow-up, weak-Lefschetz and normalized adic statements of the open TauCetiRoadmap pull requests EtaleCohomologyFoundations (#938), EnhancedDerivedSheaves (#908) and ClassicalAdicEtaleCohomology (#875), and the projective-bundle and blow-up geometry of SchemeAndStackFoundations on TauCetiRoadmap main, and keeps only what they do not state: weak Lefschetz for singular sections and lisse coefficients, its Gysin and integral forms, ample-divisor chains, complete intersections, the ring, pushforward, pairing and Frobenius-weight parts of the projective-bundle formula, the sheaf-level blow-up decomposition with its retraction and weights, axis blow-ups, split injectivity with supports, vanishing and restricted subspaces, and the λ-adic, coefficient-extension, analytic and diamond residues of EDC.6.

The library baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The [packet](../packets/EtaleDualityAndPerverseSheaves--EDC.4.json) is the dependency graph; the [suggested file](../suggested/EtaleDualityAndPerverseSheaves--EDC.4.lean) gives Lean forms of every named statement, API item and unit test, with admitted proofs. It elaborates at the pins with admitted proofs as its only warnings; this checks the shapes of the statements, not their truth.

## Scope and ownership

This document plans the layer `EtaleDualityAndPerverseSheaves:EDC.4`. Weak Lefschetz for hyperplane sections and ample divisors, its Gysin and integral forms, smooth complete intersections, the projective-bundle and blow-up formulas and their consequences are the targets. The layer builds on duality, purity, cycle classes and the six operations, which it imports.

Owners of what this layer uses, and of what it does not plan:

- **EtaleCohomologyFoundations** (TauCetiRoadmap pull request #938) states the scheme six operations and duality (§§0.7–0.8, F.1–F.2, F.5), Artin vanishing and finiteness (§F.3), normalized ℓ-adic realization (§§F.4.1–F.4.6), smooth purity, Gysin maps, cycle classes and the smooth trace (§§0.9–0.11, F.6), the projective-bundle formula, the blow-up decomposition and weak Lefschetz for smooth ample hyperplane sections (§0.9, §F.7), field perverse t-structures (§F.8) and the Frobenius comparison (§F.10.2b). The nodes below cite these statements and do not restate them.
- **EnhancedDerivedSheaves** (pull request #908) states the enhanced derived categories, tensor and internal Hom with finite Tor amplitude, derived limits and completion, coherent derived functors and coefficient change (§§0.1–0.4), and coefficient reconstruction on replete topoi (E4).
- **ClassicalAdicEtaleCohomology** (pull request #875) states the algebraic–analytic comparisons (§8.2, §11.1) used by the EDC.6 index.
- **SchemeAndStackFoundations** (TauCetiRoadmap main) states projective bundles in the lines convention, Chern classes on Chow groups, normal bundles of regular immersions and blow-ups (§§4.11, 5.4–5.5). The identification of the exceptional divisor of a smooth blow-up, affine complements of ample sections, Veronese re-embeddings, complete-intersection chains and the ample-line bridge are requested (see Requests).
- The other layers of this roadmap: EDC.0–EDC.3 in the accepted packet EtaleDualityAndPerverseSheaves--EDC.0 (here only `EtaleDualityAndPerverseSheaves:EDC.3/chern-classes` and `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map` are cited, for the higher étale Chern classes and the descent of cycle classes to Chow groups, which EtaleCohomologyFoundations does not state); EDC.5 in the accepted packet EtaleDualityAndPerverseSheaves--EDC.5; EDC.6 in the accepted packet EtaleDualityAndPerverseSheaves--EDC.6, which imports the twelve EDC.6 statements kept below by their ids; EDC.7 and EDC.8 in the accepted packet EtaleDualityAndPerverseSheaves--EDC.7.

The 92 drafts for EDC.5, EDC.7 and EDC.8 that this packet held earlier are retired; the table under Retired drafts gives each replacement and the consumers to repoint. Among them is the general stratified semismall draft whose costalk step the third review could not verify; its accepted replacement assumes adaptation of both K and D\_X K and asserts no integral version.

## Conventions

Geometric objects in the suggested file are separated finite-type schemes over one specified field k, represented by the native category over Spec k. Broader finite-coefficient qcqs results are imported from EtaleCohomologyFoundations (TauCetiRoadmap pull request #938), not replanned; the active geometric signatures display their finite-type hypotheses.

IntegralDatum consists of a complete DVR O finite over Z\_ell, with a chosen uniformizer, residue characteristic ell prime and invertible in k, and fraction field finite over Q\_ell. RationalDatum identifies the coefficient field E with that fraction field. Finite coefficients have a positive annihilator invertible in k; perverse coefficients are finite ell-power torsion fields or DVR quotients, O, or finite E.

Cohomological shifts satisfy H^q(K\[n]) = H^{q+n}(K). Geometric Frobenius acts on E(1) by q inverse (EtaleCohomologyFoundations §F.10.2b). Point and hyperplane trace classes have degree +1 (§0.11).

Projective bundles parametrize lines in V, with O(1) dual to the tautological line. Thus the Chern relation is the sum of c\_r(V) xi^(m+1-r), with plus signs. Exceptional self-intersection is multiplication by minus zeta.

All declarations remain planning items with unchecked implementation status. Suggested carrier data imported from named owners are scaffolding. Elaborating admitted theorem bodies validates types, not mathematical proofs.

Derived tensor, internal Hom and finite-level coefficient reduction are the enhanced operations of EnhancedDerivedSheaves §0.3 in the ambient unbounded coefficient category. Tor amplitude is tested there against every degree-zero coefficient sheaf. A bounded restriction is obtained from an actual bounded-constructible witness.

The ambient coefficient carrier is the native unbounded derived category of the appropriate coefficient-module sheaves. Finite torsion coefficients use ordinary small-étale sheaves, identified by a t-exact finiteCoefficientEquivalence and its realization comparison. Integral and rational coefficients use pro-étale modules over the completed coefficient sheaf O\_X or E\_X, supplied by SF.2 (Bhatt–Scholze 6.8.1–6.8.2, p.58 and 6.8.15, p.62). Ordinary étale constant-O sheaves are not substituted for this adic carrier. Constructibility and derived completeness are imposed by the imported adic formalism.

## Exact supplier contracts

| Supplier | Interface consumed here |
| --- | --- |
| tauceti:TauCetiRoadmap/EtaleCohomologyFoundations (open pull request TauCetiProject/TauCetiRoadmap#938, read at head c4ee54f4b3b32173235ff75fa9db736daecb66fe on 2026-10-17) | §0.7 ClassicalAlgebraic.supportLocalization: open–closed localization triangles, sections with supports; §0.8 ClassicalAlgebraic.properSupports; §F.2.5 VanishingCycles.compactSupportCohomology: compactification-defined Rf\_!, proper agreement, compact-support localization; §0.9 ClassicalAlgebraic.cycleClasses: Kummer c₁, localized cycle classes of regular immersions, projective bundle formula with hyperplane-power summands, P^m calculation; §0.10 ClassicalAlgebraic.smoothBoundaryPurity: smooth-pair purity i^!Λ ≅ Λ\_Z(−c)\[−2c]; §0.11 ClassicalAlgebraic.smoothTrace: normalized smooth trace and its composition law; §F.0.3 VanishingCycles.etaleTateTwists; §F.0.4 VanishingCycles.universalHomeomorphismEtaleEquivalence: Tate twists; topological invariance; §F.1 VanishingCycles.constructibleDerivedCategory: D^b\_c, D^b\_ctf, Tor amplitude; §§F.2.1, F.2.7 VanishingCycles.properBaseChange, etaleKunnethCompactSupport: proper base change; projection formula; §F.2.3 VanishingCycles.localAcyclicity: local and universal local acyclicity; §F.3 VanishingCycles.affineArtinVanishing, etaleFiniteness, lisseDirectImageTransport: Artin vanishing with support bound; finiteness; lissity of smooth proper direct images; §§F.4.1–F.4.6 VanishingCycles.normalizedAdicSystems … adicFunctoriality: normalized ℓ-adic systems, realization, pro-étale comparison, integral finiteness and derived reduction, rational and finite-E realization, Galois action; §F.5 VanishingCycles.etaleExceptionalInverseImage, etaleVerdierDuality: exceptional inverse image, Verdier duality, biduality, adic duality; §F.6 VanishingCycles.smoothPurity, smoothPairGysin, etaleGaussBonnet: smooth purity, Poincaré duality, Gysin maps with projection and self-intersection formulas, Gauss–Bonnet; §F.7 VanishingCycles.etaleBlowup, etaleWeakLefschetz: adic projective bundle formula, blow-up decomposition of RΓ and RΓ\_c, weak Lefschetz for smooth ample hyperplane sections; §F.8 VanishingCycles.fieldPerverseTStructure, intermediateExtension: field perverse t-structures for finite and ℓ-adic coefficients; §F.10.2b VanishingCycles.frobeniusCohomology: scheme Frobenius is geometric Frobenius; Frobenius on Tate twists |
| tauceti:TauCetiRoadmap/EnhancedDerivedSheaves (open pull request TauCetiProject/TauCetiRoadmap#908, read at head b3ea60e3efc3bd4a0b541fb54469dcbf88772064 on 2026-10-17; the atlas nodes EnhancedDerivedSheaves:E4/\* cited as prerequisites are its atlas form) | §0.3 ClassicalDerived.tensorHom, inverseLimits, derivedCompletion: enhanced tensor and internal Hom, finite Tor amplitude, derived limits and Milnor sequences, derived completion; §0.4 ClassicalDerived.functorCoherence (coefficientComparison): coherent derived functors, exchange maps and coefficient change; §E4.5: coefficient systems and reconstruction on replete topoi |
| tauceti:TauCetiRoadmap/ClassicalAdicEtaleCohomology (open pull request TauCetiProject/TauCetiRoadmap#875, read at head e36805f4bbf96f644034fbc220ab0607a15ace83 on 2026-10-17; the atlas nodes ClassicalAdicEtaleCohomology:H5/\* cited as prerequisites are its atlas form) | §8.2: proper algebraic comparison; §11.1: nonproper algebraic comparison (Huber 3.8.1) |
| tauceti:TauCetiRoadmap/SchemeAndStackFoundations (merged on TauCetiRoadmap main (README last changed at d2081398eedfbd4153d3067aa98a21b5a5270957); the atlas stages SchemeAndStackFoundations:SF.\* are its atlas form) | §4.11: modifications, strict transforms, blow-ups (with StableReduction Layer 4); §5.4: projective bundles in the lines convention, Chern classes on Chow groups; §5.5: normal cones and normal bundles of regular immersions |
| Atlas nodes and stages | AdicCoefficientsAndComparisons:L2/coefficient-and-unbounded-extension, AdicCoefficientsAndComparisons:L2/scheme-support-extension, AdicCoefficientsAndComparisons:L3, AdicCoefficientsAndComparisons:L3/commutation-and-adjoints-27-1-27-3, AdicCoefficientsAndComparisons:L3/full-faithfulness-27-2, AdicCoefficientsAndComparisons:L3/internal-Hom-right-adjoint, AdicCoefficientsAndComparisons:L3/pushforward-right-adjoint, AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4, AdicCoefficientsAndComparisons:L4/analytic-test-space, AdicCoefficientsAndComparisons:L4/proper-support-comparison-27-5, AdicCoefficientsAndComparisons:L6/constructible-direct-image-comparison-27-6, AdicCoefficientsAndComparisons:L6/constructible-full-faithfulness-27-7, AdicCoefficientsAndComparisons:L6/semistable-boundary-induction, AdicCoefficientsAndComparisons:L6/trait-open-comparison, ClassicalAdicEtaleCohomology:H5/comparison-over-nonarchimedean-fields-3-8-1, ClassicalAdicEtaleCohomology:H5/proper-comparison-3-7-2, EnhancedDerivedSheaves:E4/coefficient-system-reconstruction, EnhancedDerivedSheaves:E4/inverse-limit-reconstruction, EtaleDualityAndPerverseSheaves:EDC.3/chern-classes, EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map, EtaleDualityAndPerverseSheaves:EDC.5/integral-dual-perversity, EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure, EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension, EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category, SchemeAndStackFoundations:SF.0, SchemeAndStackFoundations:SF.2, SchemeAndStackFoundations:SF.3, SchemeAndStackFoundations:SF.5 |
| Mathlib | mathlib:AlgebraicGeometry.isClosedImmersion\_iff\_isAffineHom, mathlib:AlgebraicGeometry.isAffine\_of\_isAffineHom, mathlib:AlgebraicGeometry.Proj.basicOpenIsoSpec |

Baseline declarations:

- `mathlib:AlgebraicGeometry.isClosedImmersion_iff_isAffineHom` (`Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean`): A morphism is a closed immersion iff it is affine and surjective on sections over affine opens; used to see that a closed subscheme of an affine scheme maps to it by an affine morphism.
- `mathlib:AlgebraicGeometry.isAffine_of_isAffineHom` (`Mathlib/AlgebraicGeometry/Morphisms/Affine.lean`): Given an affine morphism f : X → Y and an affine Y, X is affine. For the Lefschetz complement, first express U as a closed subscheme of the affine projective basic open; this lemma does not assert that arbitrary open subschemes are affine.
- `mathlib:AlgebraicGeometry.Proj.basicOpenIsoSpec` (`Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean`): For a homogeneous element of positive degree, the native basic open D\_+(f) is isomorphic to Spec of the degree-zero localization. With the graded projective-space bridge this gives the affine hyperplane complement; it does not supply that geometric bridge by itself.

## Layer EDC.4: weak Lefschetz, projective bundles and blow-ups

The layer runs from affine vanishing to the weak Lefschetz theorem and its Gysin and integral forms, then to ample divisors and complete intersections, and in parallel from the projective-bundle formula to blow-ups, axis blow-ups, split injectivity with supports and the vanishing and restricted subspaces of a hyperplane section.

<a id="edc-4-affine-vanishing-hypercohomology"></a>

### Artin vanishing for constructible complexes on affine schemes

**Theorem · `EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology`**

Let k be a separably closed field, n ≥ 1 invertible in k, Λ a noetherian ring with nΛ = 0, and U an affine scheme of finite type over k. (a) Imported, not planned here: for every constructible sheaf F of Λ-modules on U\_ét, H^q(U, F) = 0 for q > dim Supp F (Artin's affine vanishing with the support-sensitive bound; EtaleCohomologyFoundations §F.3, VanishingCycles.affineArtinVanishing). (b) Let K ∈ D^b\_c(U, Λ) and let d\_q ∈ ℤ ∪ {−∞} satisfy dim Supp ℋ^q(K) ≤ d\_q for every q (dim ∅ = −∞). Then H^m(U, K) = 0 for every m > max\_q (q + d\_q). (c) In particular, if dim Supp ℋ^q(K) ≤ −q for all q, then H^m(U, K) = 0 for m > 0; and H^m(U, K) = 0 for m > dim U + max{q : ℋ^q(K) ≠ 0}. (d) The same bounds hold for K ∈ D^b\_c(U, O\_E) and D^b\_c(U, E) (E/ℚ\_ℓ finite, ℓ invertible in k). Parts (b)–(d) are the complex and adic forms that the upstream section does not state.

Hypotheses and scope:

- k separably closed; n invertible in k; Λ noetherian with nΛ = 0 (for (a) and (b)).
- U affine of finite type over k; affineness is essential: H²(P¹, Λ(1)) = Λ although dim P¹ = 1.
- For O\_E and E coefficients use EtaleCohomologyFoundations §§F.4.1–F.4.5: normalized ℓ-adic systems with cohomological and Tor intervals uniform in the level, their realization, and finite E/ℚ\_ℓ through O\_E lattices. O\_E-coefficients are regarded as ℤ\_ℓ-coefficients with an O\_E-action along the finite free ℤ\_ℓ → O\_E; this changes neither the cohomology groups, nor the supports, nor the maps, and a finitely generated O\_E-module is O\_E-torsion-free exactly when it is ℤ\_ℓ-torsion-free.

Proof plan:

1. (a) is EtaleCohomologyFoundations §F.3 (VanishingCycles.affineArtinVanishing), which states the constructible bound q > dim Supp F for prime-to-characteristic torsion coefficients; it is the statement of SGA 4 XIV Corollaire 3.2, restated as BBD Corollaire 4.1.4.
2. (b) Use the hypercohomology spectral sequence E₂^{p,q} = H^p(U, ℋ^q K) ⇒ H^{p+q}(U, K), which converges because K is bounded. By (a), E₂^{p,q} = 0 for p > d\_q, so every term with p + q = m vanishes when m > q + d\_q for all q.
3. (c) is (b) with d\_q = −q, respectively d\_q = dim U.
4. (d) For O = ℤ\_ℓ, apply (b) to each level ℤ/ℓ^n of the normalized system (EtaleCohomologyFoundations §F.4.1). The universal-coefficient sequence puts the support of ℋ^q(K\_n) inside the supports of ℋ^q(K) and ℋ^{q+1}(K), and q + d\_{q+1} &lt; (q+1) + d\_{q+1}, so the levels satisfy the same bound max\_q(q + d\_q). Pass to the realization: §F.4.2 identifies RΓ of the realization with Rlim of the finite levels; the groups H^{m−1}(U, K\_n) are finite (§F.3), so the Milnor lim¹ term vanishes and H^m(U, K) = 0 above the bound. For O = O\_E restrict scalars to ℤ\_ℓ; rational coefficients follow by inverting ℓ (§F.4.5). The bound is imposed only on nonzero ordinary cohomology sheaves.

Direct prerequisites: none inside the atlas; the imported statements are named in the proof plan and in the source support below.

Source support:

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, (4.1.6), p. 218. Deligne's proof of weak Lefschetz rests on the cohomological dimension of affine varieties (SGA 4 XIV 3.2).
- [SGA 4, Exposé XIV: Théorème de finitude pour un morphisme propre; dimension cohomologique des schémas algébriques affines](https://www.normalesup.org/~forgogozo/SGA4/14/14.pdf), XIV, Corollaire 3.2, LNM 305 pp. 160. Artin's affine vanishing: cd X ≤ dim X for X affine of finite type over a separably closed field (the retyped text keeps the margin page number 160 and the footnote mark (4)).
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), §F.3, VanishingCycles.affineArtinVanishing (README at head c4ee54f). States affine Artin vanishing for prime-to-characteristic torsion sheaves on affine finite-type schemes over a separably closed field, with the sharper bound by the dimension of the support for constructible sheaves; imported as part (a).

Acceptance checks:

- U = 𝔸¹\_k, F constructible: H^q(𝔸¹, F) = 0 for q ≥ 2; the bound is sharp: H¹(𝔾\_m, ℤ/n) ≅ ℤ/n(−1) ≠ 0.
- K = i\_{x\*}Λ\[−q] for a closed point x: d\_q = 0, and H^m(U, K) = 0 for m ≠ q, as (b) predicts.
- Non-example: U = P¹ is not affine and H²(P¹, Λ(1)) ≅ Λ, so affineness cannot be dropped.

Suggested Lean names: `TauCeti.EtaleDuality.affine_vanishing_hypercohomology`.

<a id="edc-4-compact-support-vanishing-smooth-affine"></a>

### Vanishing of low-degree compactly supported cohomology of smooth affine varieties

**Theorem · `EtaleDualityAndPerverseSheaves:EDC.4/compact-support-vanishing-smooth-affine`**

Let k be separably closed, n invertible in k, Λ = O/π^m (more generally a noetherian self-injective ring killed by n), U a smooth affine k-scheme of pure dimension d and L a locally constant constructible sheaf of Λ-modules on U. Then H^i\_c(U, L) = 0 for i &lt; d. The same holds for a lisse O\_E-sheaf or a lisse E-sheaf L (E/ℚ\_ℓ finite, ℓ invertible in k).

Hypotheses and scope:

- k separably closed, n invertible; U smooth, affine, of pure dimension d.
- Λ self-injective, so that Poincaré duality is a perfect pairing degreewise; for O\_E use derived duality and the universal-coefficient sequence.
- A lisse O\_E-sheaf here means locally finite free over O\_E; geometric finiteness and coefficient reduction are those of EtaleCohomologyFoundations §F.4.4 for O = ℤ\_ℓ. O\_E-coefficients are regarded as ℤ\_ℓ-coefficients with an O\_E-action along the finite free ℤ\_ℓ → O\_E; this changes neither the cohomology groups, nor the supports, nor the maps, and a finitely generated O\_E-module is O\_E-torsion-free exactly when it is ℤ\_ℓ-torsion-free.

Proof plan:

1. Poincaré duality on the smooth U (EtaleCohomologyFoundations §F.6, VanishingCycles.smoothPurity together with the duality of §F.5, VanishingCycles.etaleVerdierDuality): H^i\_c(U, L) ≅ Hom\_Λ(H^{2d−i}(U, L^∨(d)), Λ) for self-injective Λ.
2. Artin vanishing (EDC.4/affine-vanishing-hypercohomology (a)) with e = d: H^{2d−i}(U, L^∨(d)) = 0 when 2d − i > d, that is i &lt; d.
3. For O use derived Poincaré duality and the universal-coefficient short exact sequence. The Hom term uses H^{2d−i}; the Ext-one term uses H^{2d−i+1}. Both vanish for i &lt; d. Retain the locally finite-free lisse input and geometric finiteness. Tensoring with E gives the rational case.
4. Cross-check: for finite or rational coefficients L\[d] is perverse on the smooth U, and the affine compact-support vanishing H^i\_c(U, P) = 0 for i &lt; 0 of EtaleCohomologyFoundations §F.8 gives the same range.

Direct prerequisites: [Artin vanishing for constructible complexes on affine schemes](#edc-4-affine-vanishing-hypercohomology) (`EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology`).

Source support:

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, (4.1.6), p. 219. Deligne deduces the vanishing of H^i\_c(X − Y) for i &lt; n from affine vanishing and Poincaré duality on the smooth affine X − Y.
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), §§F.5–F.6 and F.8 (README at head c4ee54f). §F.5 states exceptional inverse image and duality, §F.6 smooth purity f^!Λ ≅ Λ(d)\[2d] and higher-dimensional Poincaré duality; §F.8 states affine vanishing of compactly supported cohomology of perverse objects in negative degrees. The duality input of the first step is imported from there.

Acceptance checks:

- U = 𝔸^d: H^i\_c(𝔸^d, Λ) = 0 for i ≠ 2d, in particular for i &lt; d.
- U = 𝔾\_m (d = 1): H⁰\_c(𝔾\_m, Λ) = 0 while H¹\_c(𝔾\_m, Λ) = Λ ≠ 0 — the bound i &lt; d is sharp.
- Non-example: U = P¹ − ∅ is not affine and H⁰\_c(P¹, Λ) = Λ ≠ 0 although d = 1.

Suggested Lean names: `TauCeti.EtaleDuality.compact_support_vanishing_smooth_affine`.

<a id="edc-4-weak-lefschetz"></a>

### The weak Lefschetz theorem

**Theorem · `EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz`** · planet: Weak Lefschetz theorem

Let k be a separably closed field, ℓ a prime invertible in k, X a smooth projective k-scheme of pure dimension n + 1 with a closed immersion X ⊂ P^N\_k, H ⊂ P^N a hyperplane and Y = X ∩ H (scheme-theoretic, Y ≠ X), with inclusion i : Y → X. Let Λ be ℤ/ℓ^m, O\_E/λ^m, O\_E or E (E/ℚ\_ℓ finite), and L a locally constant constructible (respectively lisse) sheaf of Λ-modules on X. Then the restriction i^\* : H^q(X, L) → H^q(Y, i^\*L) is an isomorphism for q &lt; n and injective for q = n. Y need not be smooth. If X, Y and L are defined over a subfield k₀ with k = k₀^sep, i^\* is Gal(k/k₀)-equivariant; over k₀ = 𝔽\_q it commutes with the geometric Frobenius. For a smooth Y and constant coefficients this is VanishingCycles.etaleWeakLefschetz of EtaleCohomologyFoundations §F.7; the singular sections, the lisse coefficients and the equivariance are what this node adds.

Hypotheses and scope:

- k separably closed; ℓ invertible in k; X smooth projective of pure dimension n + 1; Y = X ∩ H for a hyperplane H of an embedding X ⊂ P^N.
- U := X − Y is affine (a closed subscheme of P^N − H ≅ 𝔸^N) and smooth of pure dimension n + 1; these are the only properties of Y used.
- This theorem is distinct from hard Lefschetz (DeligneWeightsAndPurity:DWP.9) and makes no claim about the nondegeneracy of the intersection form on the vanishing part (EDC.4/vanishing-and-restriction-subspaces).
- For O\_E coefficients use finite-free lisse sheaves. Integral and rational coefficients are those of EtaleCohomologyFoundations §§F.4.1–F.4.5 (ℤ\_ℓ, ℚ\_ℓ and finite E); O\_E-coefficients are regarded as ℤ\_ℓ-coefficients with an O\_E-action along the finite free ℤ\_ℓ → O\_E; this changes neither the cohomology groups, nor the supports, nor the maps, and a finitely generated O\_E-module is O\_E-torsion-free exactly when it is ℤ\_ℓ-torsion-free.

Proof plan:

1. U = X − Y is affine: X − Y → P^N − H is a closed immersion, hence an affine morphism (mathlib:AlgebraicGeometry.isClosedImmersion\_iff\_isAffineHom), into the affine scheme P^N − H = D\_+(h) ≅ Spec of a degree-zero localization (mathlib:AlgebraicGeometry.Proj.basicOpenIsoSpec); so U is affine (mathlib:AlgebraicGeometry.isAffine\_of\_isAffineHom).
2. The localization triangle j\_!j^\*L → L → i\_\*i^\*L → for j : U → X open and i : Y → X closed (EtaleCohomologyFoundations §0.7, ClassicalAlgebraic.supportLocalization) gives, X being proper, the exact sequence … → H^q\_c(U, L) → H^q(X, L) → H^q(Y, i^\*L) → H^{q+1}\_c(U, L) → … (compact-support localization, §§0.8 and F.2.5).
3. By EDC.4/compact-support-vanishing-smooth-affine applied to the smooth affine U of pure dimension n + 1, H^q\_c(U, L) = 0 for q &lt; n + 1. Hence i^\* is injective for q ≤ n and surjective for q ≤ n − 1.
4. Equivariance: all maps are induced by morphisms of schemes defined over k₀, hence commute with the Galois action; the action and the Frobenius conventions are those of EtaleCohomologyFoundations §F.4.6 (VanishingCycles.adicFunctoriality) and §F.10.2b (VanishingCycles.frobeniusCohomology).

Direct prerequisites: [Vanishing of low-degree compactly supported cohomology of smooth affine varieties](#edc-4-compact-support-vanishing-smooth-affine) (`EtaleDualityAndPerverseSheaves:EDC.4/compact-support-vanishing-smooth-affine`); `mathlib:AlgebraicGeometry.isClosedImmersion_iff_isAffineHom`; `mathlib:AlgebraicGeometry.Proj.basicOpenIsoSpec`; `mathlib:AlgebraicGeometry.isAffine_of_isAffineHom`.

Source support:

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, (4.1.6), p. 218–219. Deligne's weak Lefschetz: the long exact sequence of relative cohomology together with the vanishing of H^i\_c(X − Y) for i &lt; n gives the restriction statement.
- [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §7, p. 299. Weil I derives weak Lefschetz from affine vanishing and Poincaré duality, exactly the route of this node.
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), §F.7, VanishingCycles.etaleWeakLefschetz; §0.7 ClassicalAlgebraic.supportLocalization (README at head c4ee54f). §F.7 states weak Lefschetz for a smooth ample hyperplane section of a smooth projective variety with finite or ℓ-adic constant coefficients; §0.7 states the open–closed localization triangles used in the second step.

Acceptance checks:

- X = P^{n+1}, Y = P^n a hyperplane: i^\* : H^q(P^{n+1}, Λ) → H^q(P^n, Λ) is an isomorphism for q ≤ 2n (the P^m calculation of EtaleCohomologyFoundations §0.9), consistent with the theorem.
- X = P¹ × P¹ ⊂ P³ (n + 1 = 2), Y a smooth conic: i^\* is injective on H¹ = 0 and an isomorphism on H⁰; on H² (outside the range) the map Λ(−1)² → Λ(−1) is not injective, so the range q ≤ n is sharp.
- n + 1 = 1 (X a smooth projective curve, Y a finite set of points): H⁰(X) → H⁰(Y) is injective.
- Agreement with the upstream statement: for Y smooth and L = Λ constant, the conclusion is that of EtaleCohomologyFoundations §F.7 (VanishingCycles.etaleWeakLefschetz), whose plane-cubic check H¹(P²) = 0 → H¹(C) = Λ² is injective and not surjective.

Suggested Lean names: `TauCeti.EtaleDuality.weak_lefschetz`.

<a id="edc-4-weak-lefschetz-gysin"></a>

### The dual (Gysin) form of weak Lefschetz

**Theorem · `EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-gysin`**

In the situation of EDC.4/weak-lefschetz assume moreover that Y is smooth (a smooth hyperplane section, of pure dimension n). Then the Gysin map i\_\* : H^q(Y, i^\*L) → H^{q+2}(X, L(1)) is an isomorphism for q > n and surjective for q = n, for Λ = ℤ/ℓ^m, O\_E/λ^m, O\_E or E and L locally constant constructible (lisse). Equivalently H^{q+2}(X, L(1))/i\_\*H^q(Y, i^\*L) injects into H^{q+2}(U, L(1)), which vanishes for q + 2 > n + 1.

Hypotheses and scope:

- As in EDC.4/weak-lefschetz, with Y smooth of pure dimension n (smooth pair (Y, X) of codimension 1).

Proof plan:

1. The Gysin sequence of the smooth pair (Y, X): apply cohomology to the localization triangle i\_\*i^!L → L → Rj\_\*j^\*L of EtaleCohomologyFoundations §0.7 and identify i^!L ≅ i^\*L(−1)\[−2] by smooth-pair purity (§0.10, ClassicalAlgebraic.smoothBoundaryPurity, and its adic form in §F.6, VanishingCycles.smoothPairGysin). This gives … → H^{q+1}(U, L(1)) → H^q(Y, i^\*L) →i\_\* H^{q+2}(X, L(1)) → H^{q+2}(U, L(1)) → ….
2. U = X − Y is affine of dimension n + 1, so H^m(U, L(1)) = 0 for m > n + 1 (EDC.4/affine-vanishing-hypercohomology (a)).
3. Hence i\_\* is surjective when q + 2 > n + 1 (q ≥ n) and injective when q + 1 > n + 1 (q > n).
4. For field coefficients this is the transpose of EDC.4/weak-lefschetz under Poincaré duality on X and Y (the Gysin map is the transpose of i^\*, EtaleCohomologyFoundations §F.6), which gives the same ranges.

Direct prerequisites: [Artin vanishing for constructible complexes on affine schemes](#edc-4-affine-vanishing-hypercohomology) (`EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology`); [The weak Lefschetz theorem](#edc-4-weak-lefschetz) (`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz`).

Source support:

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, (4.1.6), p. 219. Deligne states the Gysin (dual) form of weak Lefschetz.
- [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §7, p. 300. Weil I uses the surjectivity of the Gysin map H^{n−1}(Y)(−1) → H^{n+1}(X) as the dual of weak Lefschetz.
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), §§0.7, 0.10 and F.6 (README at head c4ee54f). §0.10 states smooth-pair purity i^!Λ ≅ Λ\_Z(−c)\[−2c] with its class, and §F.6 the Gysin maps of smooth pairs with their projection formulas and adic realizations; with the triangle of §0.7 they give the Gysin sequence used here.

Acceptance checks:

- X = P^{n+1}, Y = P^n: i\_\* : H^q(P^n) → H^{q+2}(P^{n+1})(1) sends h^j to h^{j+1}; it is an isomorphism for n &lt; q ≤ 2n and surjective for q = n.
- n = 0: Y a finite set of d points on a curve X; i\_\* : H⁰(Y) = Λ^d → H²(X, Λ(1)) = Λ is the sum map, surjective.
- The range is sharp: for X = P¹ × P¹ and Y a conic, i\_\* : H⁰(Y) → H²(X)(1) is not surjective onto Λ² (q = 0 &lt; n = 1).

Suggested Lean names: `TauCeti.EtaleDuality.weak_lefschetz_gysin`.

<a id="edc-4-weak-lefschetz-integral"></a>

### Integral weak Lefschetz: torsion-freeness of the cokernel

**Theorem · `EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-integral`** · planet: Integral weak Lefschetz

In the situation of EDC.4/weak-lefschetz with L = ℤ\_ℓ (U = X − Y, n + 1 = dim X): the group H^{n+1}\_c(U, ℤ\_ℓ) is torsion-free, and consequently H^n(Y, ℤ\_ℓ)/i^\*H^n(X, ℤ\_ℓ) is torsion-free. The same holds for O\_E in place of ℤ\_ℓ.

Hypotheses and scope:

- k separably closed, ℓ invertible; X smooth projective of pure dimension n + 1; Y = X ∩ H a hyperplane section; U = X − Y.
- RΓ\_c(U, ℤ\_ℓ) is a perfect complex of ℤ\_ℓ-modules with RΓ\_c(U, ℤ\_ℓ) ⊗^L ℤ/ℓ ≅ RΓ\_c(U, ℤ/ℓ): this is EtaleCohomologyFoundations §F.4.4 (VanishingCycles.adicFiniteness). O\_E-coefficients are regarded as ℤ\_ℓ-coefficients with an O\_E-action along the finite free ℤ\_ℓ → O\_E; this changes neither the cohomology groups, nor the supports, nor the maps, and a finitely generated O\_E-module is O\_E-torsion-free exactly when it is ℤ\_ℓ-torsion-free.

Proof plan:

1. Universal coefficients: since RΓ\_c(U, ℤ\_ℓ) is perfect with derived reduction RΓ\_c(U, ℤ/ℓ) (EtaleCohomologyFoundations §F.4.4), there is a short exact sequence 0 → H^n\_c(U, ℤ\_ℓ) ⊗ ℤ/ℓ → H^n\_c(U, ℤ/ℓ) → Tor₁^{ℤ\_ℓ}(H^{n+1}\_c(U, ℤ\_ℓ), ℤ/ℓ) → 0.
2. H^n\_c(U, ℤ/ℓ) = 0 by EDC.4/compact-support-vanishing-smooth-affine (n &lt; n + 1), so H^{n+1}\_c(U, ℤ\_ℓ)\[ℓ] = Tor₁(H^{n+1}\_c(U, ℤ\_ℓ), ℤ/ℓ) = 0; a finitely generated ℤ\_ℓ-module without ℓ-torsion is torsion-free.
3. The exact sequence H^n(X, ℤ\_ℓ) → H^n(Y, ℤ\_ℓ) → H^{n+1}\_c(U, ℤ\_ℓ) of EDC.4/weak-lefschetz embeds H^n(Y)/i^\*H^n(X) into the torsion-free H^{n+1}\_c(U, ℤ\_ℓ).

Direct prerequisites: [Vanishing of low-degree compactly supported cohomology of smooth affine varieties](#edc-4-compact-support-vanishing-smooth-affine) (`EtaleDualityAndPerverseSheaves:EDC.4/compact-support-vanishing-smooth-affine`); [The weak Lefschetz theorem](#edc-4-weak-lefschetz) (`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz`).

Source support:

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4, (4.1.6), p. 219. Deligne's (4.1.6): the universal coefficient formula gives the torsion-freeness of H^{n+1}\_c(X − Y, ℤ\_ℓ), hence of H^n(Y, ℤ\_ℓ)/H^n(X, ℤ\_ℓ).
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), §F.4.4, VanishingCycles.adicFiniteness (README at head c4ee54f). States finite generation over ℤ\_ℓ, bounded perfect RΓ and RΓ\_c, and the derived reduction RΓ\_c(X, K\_ℤℓ) ⊗^L ℤ/ℓ^n ≅ RΓ\_c(X, K\_n) for separated finite-type schemes over a separably closed field; this is the hypothesis of the first step.

Acceptance checks:

- X = P^{n+1}: H^{n+1}\_c(𝔸^{n+1}, ℤ\_ℓ) = 0 (torsion-free) and the cokernel H^n(P^n)/H^n(P^{n+1}) = 0.
- X a smooth projective surface (n = 1) with Y a smooth hyperplane curve: H¹(Y, ℤ\_ℓ)/i^\*H¹(X, ℤ\_ℓ) is a free ℤ\_ℓ-module (the vanishing part of the curve's H¹ is saturated).
- Non-example: for the non-affine complement of a non-ample divisor the statement fails in general; the proof uses H^n\_c(U, ℤ/ℓ) = 0, which needs U affine.

Suggested Lean names: `TauCeti.EtaleDuality.weak_lefschetz_integral`.

<a id="edc-4-ample-divisor-weak-lefschetz"></a>

### Weak Lefschetz for ample divisors and hypersurface sections

**Theorem · `EtaleDualityAndPerverseSheaves:EDC.4/ample-divisor-weak-lefschetz`**

Let k be separably closed, ℓ invertible in k, X a smooth projective k-scheme of pure dimension n + 1, ℒ an ample invertible O\_X-module, r ≥ 1 and s ∈ Γ(X, ℒ^{⊗r}) with zero scheme Y = V(s) ≠ X. Then the conclusions of EDC.4/weak-lefschetz (restriction H^q(X, L) → H^q(Y, L) bijective for q &lt; n, injective for q = n) and, when Y is smooth, of EDC.4/weak-lefschetz-gysin hold, for Λ = ℤ/ℓ^m, O\_E/λ^m, O\_E, E. In particular they hold for Y = X ∩ V(F) with F a homogeneous form of degree r on P^N ⊃ X. By induction they hold along a chain X = X\_0 ⊃ X\_1 ⊃ … ⊃ X\_c of smooth successive ample divisors.

Hypotheses and scope:

- X smooth projective of pure dimension n + 1 over k separably closed; ℒ ample; Y the zero scheme of a section of a positive power of ℒ.
- Only the affineness of X − Y = X\_s and its smoothness are used, together with topological invariance of the étale site (Y and Y\_red have the same cohomology; EtaleCohomologyFoundations §F.0.4).

Proof plan:

1. X is proper over k and ℒ^{⊗r} is ample, so X\_s = X − Y is affine (Stacks, Tag 0EKE: for f universally closed and ℒ f-ample, X\_s → S is affine; requested from SchemeAndStackFoundations:SF.0). Ampleness alone does not suffice without properness: on a quasi-affine non-affine X with ℒ = O\_X and s = 1, X\_s = X.
2. With U = X\_s affine and smooth of pure dimension n + 1, the proofs of EDC.4/weak-lefschetz and EDC.4/weak-lefschetz-gysin apply verbatim: they use only EDC.4/compact-support-vanishing-smooth-affine and EDC.4/affine-vanishing-hypercohomology for U.
3. Alternatively, ℒ^{⊗rN} is very ample for N ≫ 0 and s^N is a hyperplane section in the corresponding embedding; Y and V(s^N) have the same reduced subscheme, and étale cohomology depends only on it (EtaleCohomologyFoundations §F.0.4, VanishingCycles.universalHomeomorphismEtaleEquivalence). For F of degree r on P^N, V(F) is a hyperplane section of the r-th Veronese re-embedding (Weil I, 5.7; the re-embedding is requested from SchemeAndStackFoundations:SF.0).
4. Chains: apply the statement to each X\_{j+1} ⊂ X\_j (each smooth projective) and compose.

Direct prerequisites: [The weak Lefschetz theorem](#edc-4-weak-lefschetz) (`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz`); [The dual (Gysin) form of weak Lefschetz](#edc-4-weak-lefschetz-gysin) (`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-gysin`); `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.3`.

Source support:

- [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §5, (5.7), p. 292. Weil I's Veronese re-embedding turns degree-r hypersurface sections into hyperplane sections.
- [The Stacks Project, Chapter 29: Morphisms of Schemes](https://stacks.math.columbia.edu/download/morphisms.pdf), Morphisms of Schemes, Lemma 44.18, Tag 0EKE. For X proper (universally closed) and ℒ ample, X\_s is affine: the complement of an ample divisor in a proper scheme is affine.
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), §F.0.4, VanishingCycles.universalHomeomorphismEtaleEquivalence (README at head c4ee54f). States that universal homeomorphisms induce equivalences of étale sites with transport of sheaves and cohomology; used to replace Y by its reduction.

Acceptance checks:

- X = P^{n+1}, Y a smooth quadric hypersurface (r = 2): H^q(Y) ≅ H^q(P^{n+1}) for q &lt; n.
- n + 1 = 2, X = P², Y a smooth plane cubic curve: H⁰(P²) → H⁰(Y) is an isomorphism (q = 0 &lt; n = 1) and H¹(P²) = 0 → H¹(Y) = Λ² is injective.
- Non-example: ℒ = O(0, 1) on X = P¹ × P¹ is nef but not ample; for Y a fibre P¹ × {pt}, X − Y = P¹ × 𝔸¹ is not affine and H²(X − Y, Λ) = Λ(−1) ≠ 0, so the affine-vanishing input fails; the theorem requires ample ℒ.

Suggested Lean names: `TauCeti.EtaleDuality.ample_divisor_weak_lefschetz`.

<a id="edc-4-complete-intersection-cohomology"></a>

### Cohomology of smooth complete intersections

**Theorem · `EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology`** · planet: Cohomology of complete intersections

Let k be separably closed, ℓ invertible in k, and X ⊂ P^N\_k a smooth complete intersection of dimension m ≥ 1 (there is a chain P^N = X\_N ⊃ X\_{N−1} ⊃ … ⊃ X\_m = X with each X\_r = X\_{r+1} ∩ H\_r for a hypersurface H\_r, all X\_r smooth). Let Λ = ℤ/ℓ^a, ℤ\_ℓ or ℚ\_ℓ and h = c₁(O(1))|\_X ∈ H²(X, Λ(1)). Then: (a) for q ≠ m, 0 ≤ q ≤ 2m, H^q(X, Λ) = 0 for q odd and H^q(X, Λ(q/2)) is free of rank one for q even; h^{q/2} generates for q &lt; m. For q > m, a generator is dual to h^{m−q/2} under Poincaré duality, and h^{q/2} is deg(X) times that generator (after the trace normalization); the restriction H^q(P^N, Λ) → H^q(X, Λ) is an isomorphism for q &lt; m. (b) H^m(X, Λ) = Λ(−m/2)·h^{m/2} ⊕ H^m(X, Λ)\_0 when m is even (for Λ = ℚ\_ℓ, and for ℤ/ℓ^a or ℤ\_ℓ when deg X is prime to ℓ), with H^m(X)\_0 := ker(∪h : H^m(X) → H^{m+2}(X)(1)); H^m(X) = H^m(X)\_0 when m is odd. (c) With ℤ\_ℓ coefficients all H^q(X, ℤ\_ℓ) are torsion-free. (d) If X is defined over 𝔽\_q, the geometric Frobenius acts on H^{2j}(X, ℚ\_ℓ), 2j ≠ m, by multiplication by q^j. The comparison of primitive ranks across characteristics is the separate target EDC.6/complete-intersection-betti-comparison; it is not a conclusion of this node.

Hypotheses and scope:

- X a smooth complete intersection in P^N over a separably closed field; ℓ invertible.
- The splitting in (b) uses that h^m has degree deg X on X (Tr(h^m) = deg X): it is a direct sum over ℚ\_ℓ, and over ℤ/ℓ^a or ℤ\_ℓ only when deg X is a unit.

Proof plan:

1. Induction along the chain X\_N = P^N ⊃ … ⊃ X\_m = X, each X\_r an ample divisor in the smooth projective X\_{r+1} (EDC.4/ample-divisor-weak-lefschetz): H^q(X\_{r+1}) → H^q(X\_r) is bijective for q &lt; r and injective for q = r; the Gysin map H^q(X\_r)(−1) → H^{q+2}(X\_{r+1}) is bijective for q > r and surjective for q = r (EDC.4/weak-lefschetz-gysin).
2. Hence H^q(X) ≅ H^q(P^N) for q &lt; m, where H^\*(P^N) has one Λ(−i) in each even degree 2i generated by the hyperplane powers (EtaleCohomologyFoundations §0.9 and the first check of §F.7), and by Poincaré duality on X (§§F.5–F.6, with the adic realization of §F.4.4) H^q(X) for q > m is dual to H^{2m−q}(X), which is Λ·h^{m−q/2} or 0.
3. Torsion-freeness: for each smooth divisor X\_r in X\_{r+1}, integral weak Lefschetz (EDC.4/weak-lefschetz-integral) gives an injection H^r(X\_{r+1}, ℤ\_ℓ) → H^r(X\_r, ℤ\_ℓ) with torsion-free cokernel. The source group is in a degree below dim X\_{r+1}, hence identified with the free projective-space group by the already proved low-degree calculation. Therefore the middle group of X\_r is free as well. Integral Poincaré duality and its universal-coefficient sequence then give freeness in all higher degrees, including degree r+1. This avoids assuming freeness in degree r+1 to prove it in degree r.
4. Splitting (b): Tr\_X(h^m) = deg X (the degree of the hyperplane class on X, from the point normalization of EtaleCohomologyFoundations §0.9 and the projection formula of §F.6), so h^{m/2} ∪ h^{m/2} ≠ 0 and Λh^{m/2} is a direct summand complementary to the kernel of ∪h when deg X is invertible in Λ.
5. Frobenius: the low-degree hyperplane powers have eigenvalue q^j in untwisted cohomology (geometric Frobenius acts on Λ(1) by q⁻¹, EtaleCohomologyFoundations §F.10.2b). In high degrees use the perfect Frobenius-equivariant pairing with low degrees, whose multiplier is q^m; the resulting eigenvalue is q^j even when h^j is not an integral generator.

Direct prerequisites: [Weak Lefschetz for ample divisors and hypersurface sections](#edc-4-ample-divisor-weak-lefschetz) (`EtaleDualityAndPerverseSheaves:EDC.4/ample-divisor-weak-lefschetz`); [The weak Lefschetz theorem](#edc-4-weak-lefschetz) (`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz`); [The dual (Gysin) form of weak Lefschetz](#edc-4-weak-lefschetz-gysin) (`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-gysin`); [Integral weak Lefschetz: torsion-freeness of the cokernel](#edc-4-weak-lefschetz-integral) (`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-integral`); `SchemeAndStackFoundations:SF.0`.

Unit tests:

- `TauCeti.EtaleDuality.completeIntersection_conic_generator` (non-example): On a smooth conic in characteristic different from 2, the hyperplane class has trace 2 and vanishes with F\_2 coefficients. A high-degree generator therefore uses duality rather than blindly using h^r.

Source support:

- [Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §16 (aside on complete intersections), p. 110. Milne gives the low-degree calculation, dual high-degree groups and primitive rational decomposition. The integral refinement uses saturated weak Lefschetz and integral duality; it does not assert that high integral hyperplane powers are generators.
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), §0.9, ClassicalAlgebraic.cycleClasses; §F.7, first check (README at head c4ee54f). §0.9 states the projective bundle formula with hyperplane-power generators and degree-one point normalization, giving H^\*(P^N) in the second step; the first check of §F.7 records the same calculation with ℓ-adic coefficients.

Acceptance checks:

- X = P^m itself (N = m): H^m(X)\_0 = 0 and every statement reduces to the P^m calculation of EtaleCohomologyFoundations §0.9.
- X a smooth plane cubic (m = 1): H¹(X, ℚ\_ℓ) = H¹(X)\_0 has dimension 2 = b\_1^0 for degree 3.
- X a smooth quadric surface in P³ (m = 2, degree 2): H²(X, ℚ\_ℓ(1)) = ℚ\_ℓh ⊕ H²\_0 with dim H²\_0 = 1; with ℤ/2 coefficients the splitting fails (deg X = 2 is not invertible), as the hypothesis requires.
- Smooth plane conic with Λ = ℤ/2: H²(X, Λ(1)) ≅ Λ but h = 2\[point] = 0. With ℤ₂, h spans an index-two submodule. Thus high-degree freeness must not be stated as generation by h.
- The active forms are typed over the common finite-type separated k-base; the carrier data for ample sections and complete-intersection chains are the SchemeAndStackFoundations:SF.0 requests of this packet.

Suggested Lean names: `TauCeti.EtaleDuality.complete_intersection_cohomology`, `TauCeti.EtaleDuality.complete_intersection_integral_free`, `TauCeti.EtaleDuality.complete_intersection_primitive_split`, `TauCeti.EtaleDuality.complete_intersection_odd_primitive`, `TauCeti.EtaleDuality.complete_intersection_frobenius`.

<a id="edc-4-projective-bundle-decomposition"></a>

### The projective-bundle decomposition: ring structure, pushforward, pairing and Frobenius weights

**Theorem · `EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition`** · planet: Projective bundle formula

Let X be a quasi-compact quasi-separated scheme with n invertible, Λ = ℤ/n or O/π^r. For Λ = O\_E or E require additionally that X is of finite type over a field with ℓ invertible and take bounded constructible K. Let V be a locally free O\_X-module of rank m + 1, π : P(V) → X the projective bundle of lines in V and ξ = c₁(O(1)) ∈ H²(P(V), Λ(1)). (a) Imported, not planned here: the map ⊕\_{j=0}^{m} Λ\_X(−j)\[−2j] → Rπ\_\*Λ\_{P(V)} given by ξ^j is an isomorphism (EtaleCohomologyFoundations §0.9, ClassicalAlgebraic.cycleClasses, for finite Λ; its adic realization is §F.7); consequently, by the projection formula, H^q(P(V), π^\*K) ≅ ⊕\_j H^{q−2j}(X, K(−j)) for every K. The node adds: (b) ring structure: ⊕\_q H^q(P(V), Λ(∗)) = H^∗(X, Λ(∗))\[ξ]/(Σ\_{r=0}^{m+1} c\_r(V) ξ^{m+1−r}); (c) for X smooth over k and π\_\* the Gysin pushforward (relative dimension m), π\_\*(π^\*a ∪ ξ^j) = 0 for j &lt; m and π\_\*(π^\*a ∪ ξ^m) = a; (d) if X and V are defined over a field k₀ and k = k₀^sep, the decomposition H^q(P(V)\_k, Λ) ≅ ⊕\_j H^{q−2j}(X\_k, Λ)(−j) is Gal(k/k₀)-equivariant; over k₀ = 𝔽\_q the geometric Frobenius acts on the j-th summand as F\_X ⊗ q^j (untwisted cohomology); (e) for X smooth proper of pure dimension d over k separably closed, the Poincaré pairing on P(V) restricted to the summands j and j' vanishes when j + j' &lt; m and is ⟨π^\*a ξ^j, π^\*b ξ^{m−j}⟩ = ⟨a, b⟩\_X when j + j' = m.

Hypotheses and scope:

- X qcqs with n invertible (for (c) and (e): X smooth, respectively smooth proper, over a field); V locally free of rank m + 1 (Zariski-locally free).
- P(V) parametrizes lines in V and ξ = c₁(O(1)), with O(1) dual to the tautological line: this is SchemeAndStackFoundations §5.4 (projectiveBundle V := relativeProj of the symmetric algebra of V^∨, with projectiveBundle\_dual\_convention) on TauCetiRoadmap main; the plus-sign Chern relation follows this convention.
- Twists and Frobenius conventions are those of EtaleCohomologyFoundations §F.0.3 (etaleTateTwists) and §F.10.2b (geometric Frobenius acts on Λ(−1) by q).
- The étale Chern classes c\_r(V) of (b) are those of EtaleDualityAndPerverseSheaves:EDC.3/chern-classes (defined by the projective-bundle relation); EtaleCohomologyFoundations states c₁ (§0.9) but not the higher étale classes. The adic extension is the realization of §F.7 in its finite-type range; O\_E-coefficients are regarded as ℤ\_ℓ-coefficients with an O\_E-action along the finite free ℤ\_ℓ → O\_E; this changes neither the cohomology groups, nor the supports, nor the maps, and a finitely generated O\_E-module is O\_E-torsion-free exactly when it is ℤ\_ℓ-torsion-free.

Proof plan:

1. (a) is imported: EtaleCohomologyFoundations §0.9 states the decomposition for finite Λ with summands generated by powers of c₁(O(1)), compatibly with pullback and coefficient reduction, and §F.7 realizes it adically through §F.4. The cohomological form with coefficients π^\*K follows from the projection formula (§F.2.7 for Rf\_! = Rf\_\* along the proper π).
2. (b) is the definition of the Chern classes by the projective-bundle relation (EDC.3/chern-classes) together with the freeness in (a).
3. (c) The pushforward π\_\* along the smooth proper π is the trace of Rπ\_! = Rπ\_\* against π^!Λ ≅ Λ(m)\[2m] (EtaleCohomologyFoundations §0.11 and smooth purity, §F.6), and the projection formula (§F.2.7) gives π\_\*(π^\*a ∪ ξ^j) = a ∪ π\_\*(ξ^j); π\_\*(ξ^j) ∈ H^{2j−2m}(X) vanishes for j &lt; m by degree and π\_\*(ξ^m) = 1 because on a fibre P^m, Tr(ξ^m) = 1 (point normalization of §0.9).
4. (d) ξ is the Chern class of a line bundle defined over k₀, so it is Galois-invariant in H²(P(V)\_k, Λ(1)); in untwisted cohomology F^\*ξ = q·ξ (EtaleCohomologyFoundations §F.10.2b: geometric Frobenius acts on Λ(1) by q⁻¹), which gives the stated action.
5. (e) Tr\_{P(V)} = Tr\_X ∘ π\_\* (compatibility of smooth traces with composition, EtaleCohomologyFoundations §0.11, ClassicalAlgebraic.smoothTrace), and (c).

Direct prerequisites: `EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`.

Source support:

- [Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §23, Theorem 23.2, p. 139. Milne states the lines-convention projective-bundle basis and the relation defining its Chern classes. Adjunction sends the Kummer cup-power morphisms to the specified derived columns.
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), §0.9, ClassicalAlgebraic.cycleClasses; §F.7; §0.11, ClassicalAlgebraic.smoothTrace; §F.10.2b (README at head c4ee54f). §0.9 states the étale projective bundle formula with hyperplane-power summands for finite coefficients; §F.7 its adic realization; §0.11 the normalized smooth trace and its composition law; §F.10.2b the Frobenius convention. Part (a) is imported from §0.9 and §F.7.
- [Scheme and stack foundations (TauCetiRoadmap roadmap README on main)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/d2081398eedfbd4153d3067aa98a21b5a5270957/TauCetiRoadmap/SchemeAndStackFoundations/README.md), §5.4, projectiveBundle and projectiveBundle\_dual\_convention (README at main d208139). Constructs the projective bundle as the relative Proj of the symmetric algebra of the dual, with O(1), the tautological quotient and the comparison with the quotient convention; this fixes the lines convention used here.

Acceptance checks:

- X = Spec k, E = k^{m+1}: P(E) = P^m and (a) is H^∗(P^m) = Λ\[ξ]/(ξ^{m+1}) (EtaleCohomologyFoundations §0.9).
- P¹-bundle over a curve C over 𝔽\_q: the geometric Frobenius has eigenvalues those of H^q(C) and q times those of H^{q−2}(C) on H^q(P(E)); e.g. dim H²(P(E)) = 2 with eigenvalues q, q.
- The Frobenius twist on the summand j is q^j, not 1: 'equal Betti numbers' is not enough (the stage forbids merely equating Betti numbers).
- Agreement with the upstream statement: on a rank-one bundle P(V) = X and only the j = 0 summand occurs, and the zero bundle has empty projectivization, as in the checks of EtaleCohomologyFoundations §0.9.

Suggested Lean names: `TauCeti.EtaleDuality.bundleColumn`, `TauCeti.EtaleDuality.projective_bundle_decomposition`, `TauCeti.EtaleDuality.projective_bundle_cohomology`, `TauCeti.EtaleDuality.projective_bundle_chern_relation`, `TauCeti.EtaleDuality.projective_bundle_pushforward`, `TauCeti.EtaleDuality.projective_bundle_pushforward_lower`, `TauCeti.EtaleDuality.projective_bundle_frobenius`, `TauCeti.EtaleDuality.projective_bundle_pairing`.

<a id="edc-4-blowup-direct-images"></a>

### Direct images along the blow-up of a smooth centre

**Theorem · `EtaleDualityAndPerverseSheaves:EDC.4/blowup-direct-images`**

Let k be a field, ℓ invertible in k, X a smooth k-scheme, i : Z → X a smooth closed subscheme of pure codimension c ≥ 2, π : X̃ = Bl\_Z X → X the blow-up, E = π^{−1}(Z) the exceptional divisor with j : E → X̃ and p = π|\_E : E → Z, and ζ := c₁(O\_E(1)) = −j^\*c₁(O\_X̃(E)) ∈ H²(E, Λ(1)). Then X̃ is smooth, E is a smooth divisor with E ≅ P(N\_{Z/X}) over Z (imported), Λ\_X → Rπ\_\*Λ\_X̃ is split injective, and Rπ\_\*Λ\_X̃ ≅ Λ\_X ⊕ ⊕\_{a=1}^{c−1} i\_\*Λ\_Z(−a)\[−2a]; equivalently π\_\*Λ = Λ, R^{2a}π\_\*Λ ≅ i\_\*Λ\_Z(−a) for 1 ≤ a ≤ c − 1 (generated by the image of ζ^a under j^\*), and R^qπ\_\*Λ = 0 for all other q > 0. Λ = ℤ/ℓ^m, O\_E/λ^m, O\_E or E. The splitting is the actual sum of the adjunction unit and j\_\*(zeta^(a-1)p^\*(-)); its restriction to E has columns 1,-zeta,...,-zeta^(c-1).

Hypotheses and scope:

- X smooth over a field k, Z ⊂ X smooth of pure codimension c ≥ 2; ℓ invertible in k.
- The geometry of the blow-up (X̃ smooth, E = P(N\_{Z/X}), O\_X̃(−E)|\_E = O\_E(1), π an isomorphism over X − Z, π proper) is requested from SchemeAndStackFoundations:SF.0. TauCetiRoadmap main states blow-ups and strict transforms (SchemeAndStackFoundations §4.11 with StableReduction Layer 4) and normal bundles of regular immersions (§5.5), but not this identification of the exceptional divisor.

Proof plan:

1. Over X − Z, π is an isomorphism, so Rπ\_\*Λ|\_{X−Z} = Λ.
2. π is proper, so proper base change (EtaleCohomologyFoundations §F.2.1, VanishingCycles.properBaseChange) gives (R^qπ\_\*Λ)\_z̄ = H^q(P^{c−1}\_{z̄}, Λ) at geometric points z̄ of Z: Λ(−a) for q = 2a ≤ 2(c − 1), 0 otherwise (EDC.4/projective-bundle-decomposition (a) over a point).
3. Use the adjunction unit for Λ\_X and, for 1 ≤ a ≤ c−1, the morphism i\_\*Λ\_Z(−a)\[−2a] → Rπ\_\*Λ\_X̃ obtained from p^\*, multiplication by ζ^{a−1}, and the exceptional-divisor Gysin map j\_\* (EtaleCohomologyFoundations §F.6, VanishingCycles.smoothPairGysin). Their direct sum defines the proposed decomposition morphism.
4. Check this morphism on geometric stalks by proper base change. Off Z it is the identity. Over Z its restriction to E has columns 1 and −ζ^a, since j^\*j\_\*y = −ζ∪y by the self-intersection formula of EtaleCohomologyFoundations §F.6. These form the projective-bundle basis, so the morphism is an isomorphism. The trace π\_\* splits its first column by the degree-one projection formula. Merely knowing the cohomology sheaves of a complex would not prove a derived splitting.
5. Applying RΓ recovers VanishingCycles.etaleBlowup of EtaleCohomologyFoundations §F.7, which states the decomposition of RΓ(Bl\_Z X, Λ) with the same exceptional Gysin columns; this node is its sheaf-level form over X, needed for supports and compact supports in EDC.4/pullback-injective-blowup-bundle.

Direct prerequisites: [The projective-bundle decomposition: ring structure, pushforward, pairing and Frobenius weights](#edc-4-projective-bundle-decomposition) (`EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition`); `SchemeAndStackFoundations:SF.0`.

Source support:

- [Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §33, proof of Lemma 33.2, p. 194. Milne computes the direct images along the blow-up of the codimension-two axis by proper base change: π\_\*Λ = Λ, R²π\_\*Λ supported on A ∩ X, other R^r = 0.
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), §F.2.1, VanishingCycles.properBaseChange; §F.6, VanishingCycles.smoothPairGysin; §F.7, VanishingCycles.etaleBlowup (README at head c4ee54f). §F.2.1 states proper base change for torsion D⁺ complexes; §F.6 the Gysin maps with projection and self-intersection formulas; §F.7 the global decomposition of RΓ(Bl\_Z X, Λ) for a smooth centre of codimension c ≥ 1, with its compact-support analogue.

Acceptance checks:

- Blow-up of a point in a surface (c = 2): R²π\_\*Λ = Λ\_x(−1) at the point x, generated by the class of the exceptional curve.
- c = 3, Z a point in a threefold: R²π\_\*Λ = Λ\_x(−1), R⁴π\_\*Λ = Λ\_x(−2), R¹ = R³ = 0.
- Non-example: for c = 1 the blow-up is an isomorphism and Rπ\_\*Λ = Λ; the formula's sum over 1 ≤ a ≤ c − 1 is then empty, so no correction term appears.
- The active forms are typed over the common finite-type separated k-base; the exceptional-divisor geometry is the SchemeAndStackFoundations:SF.0 request of this packet.

Suggested Lean names: `TauCeti.EtaleDuality.blowupSplitMap`, `TauCeti.EtaleDuality.blowup_direct_images`, `TauCeti.EtaleDuality.blowupColumn_cohomology`, `TauCeti.EtaleDuality.blowup_exceptional_restriction`.

<a id="edc-4-blowup-formula"></a>

### The blow-up formula along a smooth centre: explicit columns, retraction, traces and Frobenius weights

**Theorem · `EtaleDualityAndPerverseSheaves:EDC.4/blowup-formula`** · planet: Blow-up formula

In the situation of EDC.4/blowup-direct-images, for every q the map Φ : H^q(X, Λ) ⊕ ⊕\_{a=1}^{c−1} H^{q−2a}(Z, Λ(−a)) → H^q(X̃, Λ), (x, (z\_a)) ↦ π^\*x + Σ\_a j\_\*(ζ^{a−1} ∪ p^\*z\_a), where j\_\* : H^{r}(E, Λ(s)) → H^{r+2}(X̃, Λ(s+1)) is the Gysin map of the divisor E, is an isomorphism; the decomposition itself is VanishingCycles.etaleBlowup of EtaleCohomologyFoundations §F.7, imported. The node adds the following compatibilities of this specific Φ: its inverse has first component π\_\* (the Gysin pushforward, with π\_\*π^\* = id); j^\*π^\*x = p^\*i^\*x; π\_\*j\_\*(ζ^{a−1} ∪ p^\*z) = 0 for 1 ≤ a ≤ c − 1 (degree reasons along the fibres P^{c−1}); for X proper over k separably closed, Tr\_X̃(π^\*x) = Tr\_X(x) on top-degree classes; if X, Z are defined over k₀ (k = k₀^sep) Φ is Gal(k/k₀)-equivariant and over 𝔽\_q the geometric Frobenius acts on the summand H^{q−2a}(Z)(−a) as F\_Z ⊗ q^a (untwisted). Λ = ℤ/ℓ^m, O\_E/λ^m, O\_E or E.

Hypotheses and scope:

- As in EDC.4/blowup-direct-images; for Galois and Frobenius statements X and Z are defined over k₀ and the cohomology is that of X\_k, Z\_k.
- For cohomology over a non-separably-closed k₀ the decomposition is of Galois modules after base change to k.

Proof plan:

1. Apply RΓ(X, −) to Rπ\_\*Λ\_X̃ ≅ Λ\_X ⊕ ⊕\_a i\_\*Λ\_Z(−a)\[−2a] (EDC.4/blowup-direct-images): H^q(X̃) ≅ H^q(X) ⊕ ⊕\_a H^{q−2a}(Z)(−a). This is the decomposition stated by EtaleCohomologyFoundations §F.7.
2. Identify the summands with Φ: the first is π^\* (adjunction unit). For the others, j\_\*(ζ^{a−1} ∪ p^\*z) restricted to E is exactly −ζ^a ∪ p^\*z, because j^\*j\_\*y = y ∪ c₁(O(E))|\_E = −y ∪ ζ (self-intersection formula, EtaleCohomologyFoundations §F.6); the explicit projective-bundle basis on geometric stalks shows that Φ realises the decomposition.
3. π\_\*π^\* = id: π is proper birational between smooth schemes of the same dimension, so π^!Λ\_X ≅ Λ\_X̃ by smooth purity on both sides (EtaleCohomologyFoundations §F.6) and the trace defines π\_\*; π\_\*1 = 1 because π is an isomorphism over a dense open, and the projection formula (§F.2.7) gives π\_\*π^\*x = x ∪ π\_\*1 = x.
4. Traces: Tr\_X̃ = Tr\_X ∘ π\_\* (composition of smooth traces, EtaleCohomologyFoundations §0.11) and π\_\*π^\* = id. Equivariance and Frobenius as in EDC.4/projective-bundle-decomposition (d): ζ and the Gysin map of E are defined over k₀ and j\_\* raises the twist by one.

Direct prerequisites: [Direct images along the blow-up of a smooth centre](#edc-4-blowup-direct-images) (`EtaleDualityAndPerverseSheaves:EDC.4/blowup-direct-images`); [The projective-bundle decomposition: ring structure, pushforward, pairing and Frobenius weights](#edc-4-projective-bundle-decomposition) (`EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition`).

Source support:

- [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §7, p. 299. Weil I uses the blow-up formula along the smooth codimension-two centre A ∩ X: H\*(X̃) = H\*(X) ⊕ H^{\*−2}(A ∩ X)(−1).
- [Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §33, proof of Lemma 33.2, p. 194. Milne obtains H\*(X\*) ≅ H\*(X) ⊕ H\*−2(A ∩ X)(−1) from the degenerating Leray spectral sequence of the blow-up.
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), §F.7, VanishingCycles.etaleBlowup; §F.6; §0.11 (README at head c4ee54f). §F.7 states the blow-up decomposition of RΓ and RΓ\_c for a smooth centre with exceptional Gysin maps and their inverse signs, over an arbitrary field, with finite or ℓ-adic coefficients; its checks include the exceptional curve of square −1. The decomposition is imported; the explicit columns, the retraction and the weights are planned here.

Acceptance checks:

- Blowing up a point x on a smooth projective surface S (c = 2): H²(S̃) = H²(S) ⊕ Λ(−1)·\[E] with \[E]² = −1, H¹, H³ unchanged; over 𝔽\_q the new eigenvalue is q. Checked independently of any Weil bound (the stage's acceptance test).
- Blowing up a point in P³ (c = 3): b₂ and b₄ both increase by one, b\_odd unchanged.
- Euler characteristic: χ(X̃) = χ(X) + (c − 1)χ(Z); for c = 1 nothing changes.

Suggested Lean names: `TauCeti.EtaleDuality.blowupCohomologyMap`, `TauCeti.EtaleDuality.blowup_formula`, `TauCeti.EtaleDuality.blowup_first_inverse`, `TauCeti.EtaleDuality.blowup_frobenius`.

<a id="edc-4-pencil-axis-blowup"></a>

### Cohomology of the blow-up along the axis of a pencil

**Application · `EtaleDualityAndPerverseSheaves:EDC.4/pencil-axis-blowup`**

Let X ⊂ P^N be a smooth projective k-scheme of pure dimension n + 1 over a separably closed field k (ℓ invertible), and A ⊂ P^N a linear subspace of codimension 2 meeting X transversally, so that A ∩ X is smooth of pure codimension 2 in X (possibly empty). Let π : X̃ = Bl\_{A∩X}X → X. Then for Λ = ℤ/ℓ^m, ℤ\_ℓ, ℚ\_ℓ: H^q(X̃, Λ) ≅ H^q(X, Λ) ⊕ H^{q−2}(A ∩ X, Λ)(−1), via π^\* and j\_\*p^\*, with π^\* split injective; if X and A are defined over 𝔽\_q the decomposition commutes with the geometric Frobenius, which acts on the second summand as q·F\_{A∩X}. In particular b\_q(X̃) = b\_q(X) + b\_{q−2}(A ∩ X) and χ(X̃) = χ(X) + χ(A ∩ X). The identification of X̃ with the incidence variety of the pencil and the map X̃ → P¹ belong to LefschetzPencilsAndVanishingCycles:LPV.3 and are not used here.

Hypotheses and scope:

- X smooth projective of pure dimension n + 1; A a codimension-2 linear subspace transverse to X (so A ∩ X is smooth of codimension 2).
- n≥1, so the ambient dimension is at least two; the empty-axis case remains allowed.

Proof plan:

1. This is EDC.4/blowup-formula with c = 2, Z = A ∩ X, E = P(N\_{Z/X}) a P¹-bundle over Z, ζ⁰ = 1.
2. Frobenius on the summand: EDC.4/blowup-formula (twist (−1) contributes the factor q).

Direct prerequisites: [The blow-up formula along a smooth centre: explicit columns, retraction, traces and Frobenius weights](#edc-4-blowup-formula) (`EtaleDualityAndPerverseSheaves:EDC.4/blowup-formula`).

Source support:

- [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), §7, proof of Lemme (7.1), p. 299. Weil I passes to the blow-up of X along the smooth codimension-two centre A ∩ X (the axis of the pencil) and uses its cohomology.
- [Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §33, Lemma 33.2 and proof, p. 193–194. Milne blows up along the axis A ∩ X of a Lefschetz pencil before applying the Leray spectral sequence of X\* → P¹.

Acceptance checks:

- X = P² ⊂ P³ a plane (n + 1 = 2) and A a line meeting it transversally in one point x: X̃ = Bl\_x P², b₂(X̃) = 1 + 1 = 2.
- A ∩ X = ∅: X̃ = X and the second summand vanishes.
- X a smooth surface in P³ and A a line meeting X transversally in d = deg X points: b₂(X̃) = b₂(X) + d.

Suggested Lean names: `TauCeti.EtaleDuality.pencil_axis_blowup`.

<a id="edc-4-pullback-injective-blowup-bundle"></a>

### Pullback along blow-ups and projective bundles is split injective

**Theorem · `EtaleDualityAndPerverseSheaves:EDC.4/pullback-injective-blowup-bundle`**

Let σ : X' → X be either (i) the blow-up of a smooth k-scheme X along a smooth closed subscheme Z of pure codimension c ≥ 2, or (ii) a projective bundle P(E) → X of relative dimension r ≥ 1 over a qcqs X, with ℓ invertible. For Λ = ℤ/ℓ^m, O\_E/λ^m, O\_E or E, σ^\* : H^q(X, Λ) → H^q(X', Λ) is split injective, with retraction π\_\* in case (i) and a ↦ σ\_\*(ξ^r ∪ −) in case (ii); the same holds for cohomology with compact supports and for cohomology with supports in a closed subset T ⊂ X and its preimage. In case (ii) the cokernel is the sum of H^{q−2j}(X, Λ)(−j) for 1≤j≤r; for r=1 this is H^{q−2}(X, Λ)(−1), and in case (i) the cokernel is ⊕\_{a=1}^{c−1} H^{q−2a}(Z, Λ)(−a), so σ^\* is bijective in degrees q &lt; 2 (and an isomorphism in all degrees when Z = ∅).

Hypotheses and scope:

- As in EDC.4/blowup-formula (case (i)) or EDC.4/projective-bundle-decomposition (case (ii)); integral coefficients O\_E allowed.
- The adic projective-bundle case has the finite-type and bounded-constructible range of EDC.4/projective-bundle-decomposition. Supports and compact supports use the same proper derived decomposition, not a new pullback on compact supports for arbitrary nonproper morphisms.

Proof plan:

1. (i) EDC.4/blowup-formula: H^q(X') = σ^\*H^q(X) ⊕ (exceptional summands), with π\_\*σ^\* = id.
2. (ii) EDC.4/projective-bundle-decomposition (a) and (c).
3. Compact supports and supports in T: apply the same decompositions of Rσ\_\*Λ (EDC.4/blowup-direct-images, EDC.4/projective-bundle-decomposition (a)), which are isomorphisms in D(X, Λ), to RΓ\_c(X, −) and RΓ\_T(X, −); for σ proper, Rσ\_! = Rσ\_\* (EtaleCohomologyFoundations §0.8, ClassicalAlgebraic.properSupports) and supports in the preimage of T are computed by the triangles of §0.7.

Direct prerequisites: [The blow-up formula along a smooth centre: explicit columns, retraction, traces and Frobenius weights](#edc-4-blowup-formula) (`EtaleDualityAndPerverseSheaves:EDC.4/blowup-formula`); [The projective-bundle decomposition: ring structure, pushforward, pairing and Frobenius weights](#edc-4-projective-bundle-decomposition) (`EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition`); [Direct images along the blow-up of a smooth centre](#edc-4-blowup-direct-images) (`EtaleDualityAndPerverseSheaves:EDC.4/blowup-direct-images`).

Source support:

- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3), §5.11, Lemma 5.11.3(3), p. 98 (arXiv v3). Liu–Tian–Xiao–Zhang–Zhu use injectivity of the pullback along a blow-up with smooth centre or a P¹-bundle (Lemma 5.11.3(3)–(4)); this node is that statement for étale cohomology with O\_λ coefficients.
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), §§0.7–0.8, ClassicalAlgebraic.supportLocalization and ClassicalAlgebraic.properSupports (README at head c4ee54f). §0.7 states sections with supports and the open–closed triangles; §0.8 states compactification-defined lower shriek with proper agreement Rf\_! = Rf\_\*; together they transport the derived decompositions to supports and compact supports.

Acceptance checks:

- P¹-bundle over a point: H⁰(pt) → H⁰(P¹) bijective, H²(P¹) = Λ(−1) is the cokernel.
- Blow-up of a point on a surface: σ^\* bijective on H⁰, H¹, H³, H⁴ and injective with cokernel Λ(−1) on H².
- Integral coefficients: σ^\* is split injective on H^q(X, ℤ\_ℓ), so torsion in H^q(X, ℤ\_ℓ) injects into H^q(X', ℤ\_ℓ).

Suggested Lean names: `TauCeti.EtaleDuality.pullback_injective_blowup_bundle`, `TauCeti.EtaleDuality.bundle_supported_retraction`, `TauCeti.EtaleDuality.blowup_supported_retraction`, `TauCeti.EtaleDuality.bundle_supported_cokernel`, `TauCeti.EtaleDuality.blowup_supported_cokernel`, `TauCeti.EtaleDuality.supported_modification_low_degrees`.

<a id="edc-4-vanishing-and-restriction-subspaces"></a>

### Vanishing and restricted subspaces of a hyperplane section, and primitive subspaces

**Construction · `EtaleDualityAndPerverseSheaves:EDC.4/vanishing-and-restriction-subspaces`** · planet: Vanishing and restricted subspaces

Let k be separably closed, ℓ invertible, E a field of coefficients (finite of characteristic ℓ, or finite over ℚ\_ℓ), X a smooth projective k-scheme of pure dimension n + 1 and i : Y → X a smooth hyperplane section (pure dimension n), with Lefschetz class L = c₁(O\_X(1)) ∈ H²(X, E(1)). Define the vanishing subspace Van(Y) := ker(i\_\* : H^n(Y, E) → H^{n+2}(X, E(1))) and the restricted subspace Res(Y) := im(i^\* : H^n(X, E) → H^n(Y, E)), both E-subspaces of H^n(Y, E). Then, with respect to the Poincaré pairing ⟨y, y'⟩ = Tr\_Y(y ∪ y') on H^n(Y, E) (perfect and (−1)^n-symmetric after the identification E(n) ≅ E over k), Res(Y) = Van(Y)^⊥ and Van(Y) = Res(Y)^⊥; dim Res(Y) + dim Van(Y) = dim H^n(Y). Moreover i\_\*i^\* = L ∪ − on H^∗(X). For 0 ≤ q ≤ n + 1 the primitive subspace is P^q(X) := ker(L^{n+2−q} : H^q(X, E) → H^{2n+4−q}(X, E(n+2−q))). No decomposition H^n(Y) = Res(Y) ⊕ Van(Y) and no Lefschetz decomposition into primitive parts is asserted: both require hard Lefschetz (DeligneWeightsAndPurity:DWP.9).

Hypotheses and scope:

- X smooth projective of pure dimension n + 1 over k separably closed; Y a smooth hyperplane section; field coefficients E (so that orthogonal complements have complementary dimensions).

Proof plan:

1. Van(Y) and Res(Y) are kernels and images of E-linear maps between finite-dimensional spaces (finiteness: EtaleCohomologyFoundations §F.3, VanishingCycles.etaleFiniteness, for finite fields of coefficients; §§F.4.4–F.4.5 for ℓ-adic fields).
2. i\_\* is the transpose of i^\* for the Poincaré pairings of Y and X (EtaleCohomologyFoundations §F.6, Gysin maps and their projection formula): ⟨i^\*x, y⟩\_Y = ⟨x, i\_\*y⟩\_X. Hence y ⊥ Res(Y) ⟺ i\_\*y ⊥ H^n(X) ⟺ i\_\*y = 0 (perfectness of Poincaré duality on X, §§F.5–F.6), i.e. Res(Y)^⊥ = Van(Y); the pairing on Y is perfect, so Van(Y)^⊥ = Res(Y) and the dimensions add up.
3. i\_\*i^\*x = cl(Y) ∪ x = L ∪ x (projection formula of §F.6 and the agreement of the class of a Cartier divisor with the Kummer first Chern class, §0.9).
4. P^q(X) is a kernel of an E-linear map; nothing about its complement is claimed.

Direct prerequisites: [The weak Lefschetz theorem](#edc-4-weak-lefschetz) (`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz`); [The dual (Gysin) form of weak Lefschetz](#edc-4-weak-lefschetz-gysin) (`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-gysin`); `SchemeAndStackFoundations:SF.0`.

Uses:

- DeligneWeightsAndPurity:DWP.9 (orthogonal decomposition of a hyperplane section, Weil II 4.3.9): hard Lefschetz upgrades Res(Y) = Van(Y)^⊥ to H^n(Y) = Res(Y) ⊕ Van(Y)
- LefschetzPencilsAndVanishingCycles:LPV.4 (global vanishing cycles): the vanishing cycles of a Lefschetz pencil span Van(Y) and Res(Y) is their orthogonal
- Deligne, Weil II (4.3.1)–(4.3.2): Ev(Y) and Ev(Y)^⊥ for the trace pairing on H^n(Y)

API:

- `TauCeti.EtaleDuality.vanishingSubspace` (constructor): Van(Y) := ker(i\_\* : H^n(Y, E) → H^{n+2}(X, E(1))) as an E-subspace of H^n(Y, E).
- `TauCeti.EtaleDuality.restrictedSubspace` (constructor): Res(Y) := im(i^\* : H^n(X, E) → H^n(Y, E)) as an E-subspace of H^n(Y, E).
- `TauCeti.EtaleDuality.restrictedSubspace_eq_orthogonal` (characterisation): Res(Y) = Van(Y)^⊥ for the Poincaré pairing of Y.
- `TauCeti.EtaleDuality.vanishingSubspace_eq_orthogonal` (characterisation): Van(Y) = Res(Y)^⊥ for the Poincaré pairing of Y.
- `TauCeti.EtaleDuality.finrank_restricted_add_vanishing` (relation): dim Res(Y) + dim Van(Y) = dim H^n(Y, E).
- `TauCeti.EtaleDuality.gysin_comp_restriction` (relation): i\_\* ∘ i^\* = L ∪ − : H^q(X, E) → H^{q+2}(X, E(1)).
- `TauCeti.EtaleDuality.primitiveSubspace` (constructor): P^q(X) := ker(L^{n+2−q} : H^q(X, E) → H^{2n+4−q}(X, E(n+2−q))) for q ≤ n + 1.
- `TauCeti.EtaleDuality.vanishingSubspace_galois` (functoriality): If X, Y are defined over k₀, Van(Y) and Res(Y) are Gal(k/k₀)-stable subspaces.

Unit tests:

- `TauCeti.EtaleDuality.vanishingSubspace_projectiveSpace` (computation): For X = P^{n+1} and Y = P^n a hyperplane, Van(Y) = 0 and Res(Y) = H^n(Y).
- `TauCeti.EtaleDuality.restrictedSubspace_planeCubic` (computation): For X=P² embedded by O(3), a smooth plane cubic Y is a hyperplane section; Res(Y)=0 and Van(Y)=H¹(Y,E) has dimension 2.
- `TauCeti.EtaleDuality.vanishingSubspace_zero_of_curve_point` (degenerate): For n=0, X a smooth connected projective curve and Y a nonempty reduced hyperplane section of d points, Van(Y) is the kernel of the sum map E^d → E and has dimension d−1.
- `TauCeti.EtaleDuality.not_vanishing_inf_restricted_eq_bot` (non-example): Use 𝔽₂ coefficients over a separably closed base field of characteristic different from 2. Take X a smooth quadric threefold and Y its smooth quadric surface hyperplane section. H²(Y) ≅ 𝔽₂², Res(Y) is spanned by h = (1,1), and h∪h has trace 2 = 0, so Res(Y) = Van(Y) is nonzero. This detects an unjustified direct-sum axiom.

Source support:

- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), §4.3, before Lemme (4.3.2), p. 222. Deligne uses the vanishing part of H^n(Y) and its orthogonal for the trace pairing; this node constructs both as subspaces without the hard-Lefschetz splitting.
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), §§0.9, F.3, F.5–F.6 (README at head c4ee54f). §F.3 states finiteness of cohomology, §§F.5–F.6 duality, Gysin maps and their projection formula, and §0.9 the agreement of divisor classes with Kummer first Chern classes; these supply every step except the orthogonality argument itself.

Acceptance checks:

- X = P^{n+1}, Y = P^n: Van(Y) = 0 for n odd (H^n(Y) = 0) and for n even Van(Y) = 0 since i\_\* is an isomorphism H^n(P^n) → H^{n+2}(P^{n+1}); Res(Y) = H^n(Y).
- Take X = P² with its O(3) Veronese embedding and Y a smooth plane cubic, which is a hyperplane section for that embedding. Then Res(Y)=0 and Van(Y)=H¹(Y), of dimension 2.
- The intersection Res(Y) ∩ Van(Y) is not asserted to be 0: in characteristic ℓ coefficients E = 𝔽\_2 and n even, the restricted class of a quadric hyperplane section can be isotropic; only orthogonality is proved.
- The active forms are typed over the common finite-type separated k-base; the Veronese re-embedding used by the plane-cubic test is the SchemeAndStackFoundations:SF.0 request of this packet.

Suggested Lean names: `TauCeti.EtaleDuality.vanishingSubspace`, `TauCeti.EtaleDuality.restrictedSubspace`, `TauCeti.EtaleDuality.primitiveSubspace`.

Dependencies of the layer: EtaleCohomologyFoundations §§0.7–0.11, F.0.3–F.0.4, F.2–F.7 and F.10.2b; SchemeAndStackFoundations §§4.11, 5.4–5.5 and the SF.0/SF.3 requests; `EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`. Consumers inside the atlas: CohomologyComparisons CP.6, WeightsInEtaleCohomology R34.4, IgusaVarietiesAndTorsionConcentration IG.4, EtaleDualityAndPerverseSheaves EDC.6 and EDC.7.

## EDC.6 statements kept for their importers

The accepted EDC.6 packet plans EDC.6 and imports these twelve statements by id; the accepted EDC.7 packet cites five of them. They are revised here to consume the upstream ℤ\_ℓ, ℚ\_ℓ and finite-E statements and to keep only the λ-adic, coefficient-extension, analytic and diamond residues.

<a id="edc-6-scheme-adic-diamond-operation-comparisons-index"></a>

### Scheme, adic and diamond comparisons of the duality operations, with their exact hypotheses

**Comparison · `EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`**

Index of comparisons, with each construction imported from its owner. In characteristic p, for torsion Λ killed by an integer prime to p, ECD 27.1–27.3 give monoidal pullback c\_X^\*, its full faithfulness, and its right adjoint Rc\_{X\*}; the internal-Hom and pushforward identities are right-adjoint identities. For f : Y → X separated of finite type between qcqs schemes of characteristic p, ECD 27.4 gives Rf^◇\_!c\_Y^\* ≅ c\_X^\*Rf\_! and Rf^!Rc\_{X\*} ≅ Rc\_{Y\*}Rf^{◇!}. It does not assert c\_Y^\*Rf^! ≅ Rf^{◇!}c\_X^\*, or c^\*RHom ≅ RHom(c^\*−,c^\*−). The analogous ! comparison over a complete DVR with perfect residue field is imported from L4 (27.5), while constructible Rf\_\* comparison and full faithfulness in that setting are imported from L6 (27.6–27.7). For scheme → adic, H5/proper-comparison-3-7-2 supplies proper comparison for torsion sheaves in its stated generality, and H5/comparison-over-nonarchimedean-fields-3-8-1 supplies the finite-type comparison over a complete nonarchimedean field with coefficient torsion prime to char(k), not necessarily prime to the residue characteristic. Duality recovered by Rc\_{X\*} is EDC.6/diamond-transport-of-duality; stronger c^\* transport requires the additional comparison recorded as a gap.

Hypotheses and scope:

- Per comparison, the qcqs, finite-type, characteristic and ℓ-invertibility hypotheses of ECD 27.1–27.7 and Huber 3.7.2, 3.8.1; coefficients torsion and prime to p.
- Tensor, internal Hom and coefficient change are the enhanced operations of EnhancedDerivedSheaves §0.3 (ClassicalDerived.tensorHom) in the ambient unbounded derived category; finite Tor amplitude is tested against all degree-zero module sheaves as defined there. Bounded outputs require actual bounded-constructible restriction witnesses (EtaleCohomologyFoundations §F.1). The scheme-side six operations and duality are those of EtaleCohomologyFoundations §§0.7–0.8, F.2 and F.5.

Proof plan:

1. Import the comparison theorems from their owners: AdicCoefficientsAndComparisons L2 (qcqs compactification), L3 (27.1–27.4), L4 (27.5), L6 (27.6–27.7), and ClassicalAdicEtaleCohomology H5 (Huber 3.7.2 and 3.8.1; upstream ClassicalAdicEtaleCohomology §8.2, proper algebraic comparison, and §11.1, nonproper algebraic comparison). The scheme-side dualizing complex and biduality are EtaleCohomologyFoundations §F.5 (VanishingCycles.etaleExceptionalInverseImage, VanishingCycles.etaleVerdierDuality).
2. Do not invert a right-adjoint identity to obtain a pullback identity. Apply 27.3–27.4 and the unit K ≅ Rc\_{X\*}c\_X^\*K to recover scheme duality via Rc\_{X\*}; see EDC.6/diamond-transport-of-duality.

Direct prerequisites: `AdicCoefficientsAndComparisons:L2/scheme-support-extension`; `AdicCoefficientsAndComparisons:L2/coefficient-and-unbounded-extension`; `AdicCoefficientsAndComparisons:L3/full-faithfulness-27-2`; `AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4`; `AdicCoefficientsAndComparisons:L3/commutation-and-adjoints-27-1-27-3`; `AdicCoefficientsAndComparisons:L3/internal-Hom-right-adjoint`; `AdicCoefficientsAndComparisons:L3/pushforward-right-adjoint`; `AdicCoefficientsAndComparisons:L4/proper-support-comparison-27-5`; `AdicCoefficientsAndComparisons:L4/analytic-test-space`; `AdicCoefficientsAndComparisons:L6/constructible-direct-image-comparison-27-6`; `AdicCoefficientsAndComparisons:L6/constructible-full-faithfulness-27-7`; `AdicCoefficientsAndComparisons:L6/trait-open-comparison`; `AdicCoefficientsAndComparisons:L6/semistable-boundary-induction`; `ClassicalAdicEtaleCohomology:H5/proper-comparison-3-7-2`; `ClassicalAdicEtaleCohomology:H5/comparison-over-nonarchimedean-fields-3-8-1`; `AdicCoefficientsAndComparisons:L3`.

Source support:

- [Étale cohomology of diamonds](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf), §27, Proposition 27.2, p. 163. c\_X^\* is fully faithful for any scheme X of characteristic p with Λ as in the statement.
- [Étale cohomology of diamonds](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf), §27, Proposition 27.4, p. 165. Rf^◇\_!c\_Y^\* ≅ c\_X^\*Rf\_! for f separated of finite type between qcqs schemes of characteristic p.
- [Classical analytic étale cohomology (TauCetiRoadmap roadmap README, open pull request #875)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/e36805f4bbf96f644034fbc220ab0607a15ace83/TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md), §8.2 (proper algebraic comparison) and §11.1 (nonproper algebraic comparison, Huber 3.8.1) (README at head e36805f). States the comparison of algebraic and analytic étale cohomology for proper maps and, for constructible sheaves and finite-type maps over a complete nonarchimedean field, without properness; the H5 nodes cited here are the atlas form of these sections.

Acceptance checks:

- X = 𝔸¹ over a perfectoid field of characteristic p: Rf^◇\_!Λ = c^\*Rf\_!Λ = Λ(−1)\[−2] (ECD 27.4).
- D\_{X^◇}(Λ) ≅ c^\*K\_X for X smooth of dimension d: Λ(d)\[2d] on both sides.

Suggested Lean names: `TauCeti.EtaleDuality.scheme_diamond_fullyFaithful`, `TauCeti.EtaleDuality.scheme_diamond_lowerShriek`, `TauCeti.EtaleDuality.scheme_diamond_upperShriek_rightAdjoint`, `TauCeti.EtaleDuality.scheme_diamond_RHom_rightAdjoint`.

<a id="edc-6-classical-and-proetale-adic-categories"></a>

### Classical and pro-étale ℓ-adic constructible categories

**Comparison · `EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`**

Let X be a scheme of finite type over a field (or over ℤ\[1/ℓ]-regular bases of dimension ≤ 1), ℓ invertible on X, E/ℚ\_ℓ finite with ring of integers O and uniformizer λ. Imported, not planned here: for O = ℤ\_ℓ, EtaleCohomologyFoundations §§F.4.1–F.4.6 state the normalized bounded constructible ℓ-adic systems (VanishingCycles.normalizedAdicSystems), their classical realization K\_ℤℓ = Rlim K\_n (VanishingCycles.classicalAdicRealization), the comparison Rν\_\*K\_pro ≅ K\_ℤℓ with the pro-étale realization (VanishingCycles.etaleProetaleAdicComparison), integral finiteness and derived reduction (VanishingCycles.adicFiniteness), rational and finite-E realization through O\_E lattices (VanishingCycles.rationalAdicRealization), and the passage of proper, smooth and Rf\_! exchange, projection, tensor and Künneth through normalized systems (VanishingCycles.adicFunctoriality); §F.5 states adic duality as the realization of the finite-level duality. The node adds the λ-adic form for a possibly ramified O: the category D^b\_c(X, O) of normalized λ-adic systems (K\_m) with K\_m ∈ D\_ctf(X, O/λ^m) and K\_{m+1} ⊗^L O/λ^m ≅ K\_m (EDC.6/normalized-adic-system) is equivalent to Bhatt–Scholze's D\_cons(X\_proét, O) of derived λ-complete objects whose reductions are constructible, compatibly with the reduction functors K ↦ K ⊗^L O/λ^m. D^b\_c(X, E) := D^b\_c(X, O) ⊗ E is the full subcategory D\_cons(X\_proét, E), and D^b\_c(X, Ē) is the 2-colimit over finite E'/E. Both carry the six operations f^\*, Rf\_\*, Rf\_!, f^!, ⊗, RHom, compatible with the finite-level ones under reduction and with coefficient extension E → E'; for O = ℤ\_ℓ these are the imported operations.

Hypotheses and scope:

- X of finite type over a field (or a regular base of dimension ≤ 1) with ℓ invertible; E/ℚ\_ℓ finite.
- For the six operations use the hypotheses of Bhatt–Scholze §§6.6–6.7 and Remark 6.8.15: noetherian finite-dimensional bases with ℓ invertible, and the quasi-excellence hypothesis of 6.7.1 for nonproper direct image. Completion and coefficient reconstruction on a replete topos are EnhancedDerivedSheaves E4 (§E4.5); constructibility, boundedness and the scheme six operations are additional inputs, not consequences of repleteness alone.
- Tensor, internal Hom and coefficient change are the enhanced operations of EnhancedDerivedSheaves §0.3 in the ambient unbounded derived category; finite Tor amplitude is tested there against all degree-zero sheaves. Bounded outputs require actual bounded-constructible restriction witnesses. General-ring trace evaluation uses ctf inputs; bounded duality on every Dbc object uses its stated coefficient regime.

Proof plan:

1. Pro-étale side: D(X\_proét, O) and derived completion are EnhancedDerivedSheaves E4 (coefficient-system reconstruction, EnhancedDerivedSheaves:E4/coefficient-system-reconstruction); D\_cons is the subcategory of complete objects with constructible reductions (Bhatt–Scholze 6.5).
2. The equivalence with λ-adic systems: K ↦ (K ⊗^L O/λ^m)\_m with inverse Rlim (Bhatt–Scholze, comparison with Ekedahl's category; EnhancedDerivedSheaves:E4/inverse-limit-reconstruction). For O = ℤ\_ℓ this is EtaleCohomologyFoundations §§F.4.2–F.4.3; for ramified O the same argument applies to the tower O/λ^m, since O/λ^{em} is a finite free ℤ/ℓ^m-algebra (e the ramification index) and the realization, its Milnor sequence and the pro-étale comparison only use the uniform bounds and the finite-level operations.
3. Six operations on D^b\_c(X, O): defined levelwise on normalized systems by the finite-level operations of EtaleCohomologyFoundations §§0.7–0.8, F.2 and F.5, which preserve D\_ctf and commute with ⊗^L O/λ^m (projection formula, §F.2.7; finiteness, §F.3); E and Ē by localization and colimit (Bhatt–Scholze 6.8; for finite E also §F.4.5).

Direct prerequisites: [Uniformly bounded constructible normalized adic systems](#edc-6-normalized-adic-system) (`EtaleDualityAndPerverseSheaves:EDC.6/normalized-adic-system`); `EnhancedDerivedSheaves:E4/coefficient-system-reconstruction`; `EnhancedDerivedSheaves:E4/inverse-limit-reconstruction`.

Source support:

- [The pro-étale topology for schemes](https://arxiv.org/pdf/1309.1198v2), §§6.5–6.8, especially Proposition 6.6.11, Theorem 6.7.1 and Lemma 6.7.2, Proposition 6.8.14 and Remark 6.8.15, pp. 49–62 (arXiv v2). Bhatt–Scholze define constructible complexes on X\_proét with O and E coefficients and compare them with the classical category.
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), §§F.4.1–F.4.6 and F.5 (README at head c4ee54f). States normalized ℓ-adic systems with common cohomological and Tor intervals, their classical realization, the classical/pro-étale comparison, integral finiteness and derived reduction, rational and finite-E realization, and the passage of the operations through normalized systems; §F.5 states adic duality as the realization of finite-level duality. The ℤ\_ℓ statements are imported.
- [Enhanced derived categories of sheaves (TauCetiRoadmap roadmap README, open pull request #908)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/b3ea60e3efc3bd4a0b541fb54469dcbf88772064/TauCetiRoadmap/EnhancedDerivedSheaves/README.md), §0.3 (ClassicalDerived.tensorHom, inverseLimits, derivedCompletion) and §E4.5 (README at head b3ea60e). States enhanced derived tensor and internal Hom with finite Tor amplitude, derived limits with Milnor sequences, derived completion with reduction recovery, and coefficient reconstruction on replete topoi.

Acceptance checks:

- X = Spec Ω, Ω separably closed: D^b\_c(X, O) ≃ D^b\_{fg}(O) and D^b\_c(X, E) ≃ D^b\_{fd}(E).
- The constant system (O/λ^m)\_m corresponds to O\_X; its rationalization is E\_X.

Suggested Lean names: `TauCeti.EtaleDuality.classical_proetale_equivalence`, `TauCeti.EtaleDuality.normalized_system_equivalence`, `TauCeti.EtaleDuality.normalized_system_reduction`.

<a id="edc-6-adic-transport-of-duality-and-classes"></a>

### Transport of traces, duality and Gysin classes to ℓ-adic and rational coefficients

**Theorem · `EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`**

In the situation of EDC.6/classical-and-proetale-adic-categories, for X separated of finite type over a field k. Imported, not planned here: for O = ℤ\_ℓ and for ℚ\_ℓ and finite E, EtaleCohomologyFoundations §F.5 states adic duality as the realization of finite-level duality, §F.6 the adic realizations of the smooth trace, purity and Gysin maps, §F.4.4 finite generation and derived reduction of geometric cohomology, and §F.4.5 rational tensor, Hom and duality. The node states these for a possibly ramified O = O\_E and records the integral details used downstream: (a) the dualizing complex K\_X := a^!O ∈ D^b\_c(X, O) reduces to the finite-level K\_X ⊗^L O/λ^m and D\_X := RHom(−, K\_X) preserves D^b\_c(X, O); the evaluation K → D\_XD\_XK is an isomorphism for all K ∈ D^b\_c(X, O) (biduality holds at each finite level O/λ^m, a self-injective ring, and passes to the limit) and for D^b\_c(X, E); D\_X exchanges Rf\_\* and Rf\_!, f^\* and f^!. (b) The smooth trace Tr\_f, the purity isomorphism f^!O ≅ O(d)\[2d] for smooth f of relative dimension d, the Gysin maps and the cycle class map cl : CH^r(X) → H^{2r}(X, O(r)) are the limits of their finite-level versions, with integral torsion retained: for geometric cohomology (X over a separably closed field), H^q(X, O) = lim H^q(X, O/λ^m) is a finitely generated O-module whose torsion is not discarded, and the universal-coefficient sequences 0 → H^q(X, O) ⊗ O/λ^m → H^q(X, O/λ^m) → H^{q+1}(X, O)\[λ^m] → 0 hold. (c) After ⊗E these give the rational statements, compatible with extension of scalars E → E' ⊂ Ē (D\_X, traces and cycle classes commute with − ⊗\_E E').

Hypotheses and scope:

- X separated of finite type over a field; ℓ invertible; O = O\_E.
- The inverse-limit, finite-generation and finite-group Mittag-Leffler assertions in (b) concern geometric cohomology over a separably closed field. Arbitrary-field arithmetic cohomology is not asserted finite. Cycle-class transport uses the perfect-field and cycle hypotheses of EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map, whose descent to Chow groups EtaleCohomologyFoundations does not state.

Proof plan:

1. Use finite-level ambient coefficient reduction, then the uniform finite-Tor and constructibility bounds of normalized systems to obtain each bounded restriction. The O→O/λ^m functor restricts to Dbc because O has global dimension one; reductions between quotient rings restrict only on the appropriate finite-Tor inputs or with a supplied ambient boundedness witness. Biduality for the stated DVR and self-injective DVR-quotient coefficient regimes and the exchange isomorphisms hold levelwise (EtaleCohomologyFoundations §F.5) and pass through the normalized reconstruction. Finite-group Mittag–Leffler is applied to geometric cohomology over a separably closed field, not to arbitrary arithmetic cohomology.
2. Traces, purity and Gysin maps are compatible with reduction by construction (their finite-level constructions in EtaleCohomologyFoundations §§0.9–0.11 and F.6 are natural in Λ), hence define maps of systems; cycle classes likewise (EDC.3/cycle-class-map).
3. Universal coefficients: RΓ(X, K) ⊗^L O/λ^m ≅ RΓ(X, K ⊗^L O/λ^m) for K ∈ D^b\_c(X, O) and RΓ(X, K) ∈ D^b\_{fg}(O) (for O = ℤ\_ℓ this is §F.4.4; for ramified O the same argument over the tower O/λ^m). The finiteness clause is geometric; over arbitrary k the absolute Galois cohomology need not be finitely generated.
4. Coefficient extension: E' is finite free over E, so all operations commute with − ⊗\_E E'.

Direct prerequisites: [Classical and pro-étale ℓ-adic constructible categories](#edc-6-classical-and-proetale-adic-categories) (`EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`); `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`; [normalized system reduction API lemma](#edc-6-api-normalized-system-reduction) (`EtaleDualityAndPerverseSheaves:EDC.6/api-normalized-system-reduction`).

Source support:

- [The pro-étale topology for schemes](https://arxiv.org/pdf/1309.1198v2), Remark 6.8.15, p. 62 (arXiv v2). Bhatt–Scholze: the six operations and duality on constructible ℓ-adic complexes on the pro-étale site.
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), §§F.4.4–F.4.5, F.5 and F.6 (README at head c4ee54f). States integral finiteness and derived reduction of geometric cohomology, rational tensor/Hom/duality with finite E, adic duality, and the adic realizations of purity and Gysin maps; imported for ℤ\_ℓ, ℚ\_ℓ and finite E.

Acceptance checks:

- X smooth proper of dimension d over k separably closed: H^{2d}(X, O(d)) ≅ O via the limit trace, and Poincaré duality over O has the Ext¹ correction of integral duality (EtaleCohomologyFoundations §F.5, adic duality as the realization of §F.4).
- An Enriques surface over k separably closed of characteristic ≠ 2 with ℓ = 2: H²(X, ℤ\_2) has torsion ℤ/2, which the integral statement retains.

Suggested Lean names: `TauCeti.EtaleDuality.adic_cohomology_finite`, `TauCeti.EtaleDuality.integralUniversalCoefficient_exact`, `TauCeti.EtaleDuality.integral_duality_reduction`, `TauCeti.EtaleDuality.integral_biduality`, `TauCeti.EtaleDuality.integral_chern_reduction`, `TauCeti.EtaleDuality.integral_gysin_reduction`, `TauCeti.EtaleDuality.integral_trace_reduction`, `TauCeti.EtaleDuality.BoundedDualityCoefficients`, `TauCeti.EtaleDuality.integralReduction_realization`.

<a id="edc-6-rational-perverse-coefficient-extension"></a>

### Perverse t-structures with ℓ-adic coefficients and coefficient extension

**Theorem · `EtaleDualityAndPerverseSheaves:EDC.6/rational-perverse-coefficient-extension`**

For X of finite type over k (ℓ invertible) and E/ℚ\_ℓ finite, the middle perverse t-structure of EDC.5/middle-perverse-t-structure on D^b\_c(X, E) and on D^b\_c(X, Ē) := 2-colim\_{E'} D^b\_c(X, E') is compatible with coefficient extension: for a finite extension E ⊂ E', K ↦ K ⊗\_E E' is t-exact, induces an exact functor Perv(X, E) → Perv(X, E'), commutes with j\_!\* and IC (IC\_X(L) ⊗\_E E' ≅ IC\_X(L ⊗\_E E')), and Hom\_{Perv(X,E')}(K ⊗ E', L ⊗ E') = Hom\_{Perv(X,E)}(K, L) ⊗\_E E'. Reduction from O to O/λ (K ↦ K ⊗^L O/λ) is right t-exact for p and sends the heart of p to pD^{\[−1,0]} (EDC.5/integral-dual-perversity). Simple objects of Perv(X, Ē) are defined over some finite E'.

Hypotheses and scope:

- X of finite type over a field, ℓ invertible; E ⊂ E' finite extensions of ℚ\_ℓ.
- The perverse t-structures are those of EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure (stated upstream as VanishingCycles.fieldPerverseTStructure, EtaleCohomologyFoundations §F.8, for finite and ℓ-adic coefficients). The Hom scalar-extension identity is for a finite coefficient-field extension (general algebraic extensions through the stated filtered colimit), not an arbitrary field homomorphism.

Proof plan:

1. Faithfully flat finite scalar extension commutes with stalks and costalks and is exact, hence perverse t-exact. It commutes with images in the heart, so commutes with j\_!\* and IC without using the special standard-truncation formula. The algebraic-closure case is the filtered union of finite coefficient extensions.
2. Homs: RHom commutes with the finite free extension (EDC.6/adic-transport-of-duality-and-classes).
3. Reduction: K ⊗^L O/λ sits in the triangle K →λ K → K ⊗^L O/λ →, whose perverse cohomology sequence gives the amplitude \[−1, 0].

Direct prerequisites: `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`; `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension`; `EtaleDualityAndPerverseSheaves:EDC.5/integral-dual-perversity`; [Classical and pro-étale ℓ-adic constructible categories](#edc-6-classical-and-proetale-adic-categories) (`EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`); [Transport of traces, duality and Gysin classes to ℓ-adic and rational coefficients](#edc-6-adic-transport-of-duality-and-classes) (`EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`).

Unit tests:

- `TauCeti.EtaleDuality.coefficient_extension_reflects_zero_morphism` (compatibility): Finite faithful field extension detects a zero morphism between perverse objects.
- `TauCeti.EtaleDuality.coefficient_extension_point_rank` (computation): Extension of a finite-dimensional point coefficient space preserves rank, also for a quadratic field extension.
- `TauCeti.EtaleDuality.coefficient_extension_zero_object` (degenerate): Extension sends the zero perverse object to zero.

Source support:

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 2.2.18, p. 73. BBD's treatment of ℚ\_ℓ and Q̄\_ℓ coefficients for the perverse t-structure.
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), §F.8, VanishingCycles.fieldPerverseTStructure and VanishingCycles.intermediateExtension (README at head c4ee54f). States the middle perverse t-structure over a field for finite and ℓ-adic coefficients, intermediate extension as an image with its no-boundary-subobject/quotient characterization, and the integral perversities p and p⁺ exchanged by duality; coefficient extension E → E' is not stated there and is what this node adds.

Acceptance checks:

- IC\_X(Ē) of a smooth curve is Ē\[1].
- For X = Spec Ω, ⊗E' is the scalar extension of finite-dimensional vector spaces.

Suggested Lean names: `TauCeti.EtaleDuality.extendCoefficients_tExact`, `TauCeti.EtaleDuality.extendCoefficients_intermediateExtension`, `TauCeti.EtaleDuality.extendCoefficients_intersectionComplex`, `TauCeti.EtaleDuality.extendCoefficients_hom`, `TauCeti.EtaleDuality.extendPerverse_faithful`.

<a id="edc-6-complex-analytic-comparison"></a>

### Comparison with the complex-analytic constructible category

**Theorem · `EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`** · planet: Comparison with complex-analytic sheaves

Let X be separated of finite type over ℂ, X^an its analytification and Λ a finite ring (killed by n), O\_E or E. The comparison functor ε^\* : D^b\_c(X\_ét, Λ) → D^b\_c(X^an, Λ) (constructible for algebraic stratifications) is an equivalence for finite Λ (BBD 6.1.2, from Artin's comparison theorem SGA 4 XVI 4.1), commutes with f^\*, Rf\_\*, Rf\_! and f^! in their constructible ranges for morphisms of finite type. Tensor and RHom comparison are stated in the ambient unbounded categories: for bounded constructible K,L, finite Tor amplitude of K gives bounded-constructible restriction receipts for K⊗^L L and RHom(K,L), and the comparisons then restrict through these receipts. Bounded Verdier duality on every Dbc object is asserted only for the finite-field, DVR-quotient, integral and rational coefficient regimes; for a general finite ring it uses the existing ctf input range. The functor is t-exact for the middle perverse t-structures, so it identifies Perv(X\_ét, Λ) with algebraically constructible perverse sheaves on X^an and preserves j\_!\* and IC. For O\_E coefficients the corresponding equivalence follows from finite-level comparison. For E coefficients the functor is fully faithful with essential image the algebraically constructible complexes whose cohomology local systems on normal connected strata admit monodromy-stable O\_E lattices (BBD 6.1.2(A″),(B″)); it is an equivalence onto that image; the comparison of trace maps and cycle classes with topological orientation classes is EDC.6/trace-orientation-comparison.

Hypotheses and scope:

- X separated of finite type over ℂ; algebraically constructible complexes; Λ finite, O\_E or E.
- For E coefficients the analytic target is restricted to the monodromy-stable-lattice essential image. A rank-one E local system on ℂ× with monodromy ℓ admits no stable O\_E lattice and is not the analytification of an étale E local system.
- Tensor and internal-Hom outputs are first ambient objects. A bounded output is corestricted only with its actual bounded-constructible witness; the displayed comparisons use finite-Tor first input. Analytic complex-field tensor/RHom used by geometric-origin constructors has separate field-coefficient boundedness receipts.

Proof plan:

1. Artin's comparison theorem (H^q(X\_ét, F) ≅ H^q(X^an, F^an) for constructible F, SGA 4 XVI 4.1; and Rf\_\* comparison for f of finite type) is requested from CohomologicalPointCounting ComplexComparison through SchemeAndStackFoundations:SF.2 (its owner in the atlas convention).
2. Commutation with Rf\_! follows from Rf\_\* for proper maps and j\_! for open immersions (Nagata); with f^! and D by adjunction and the dualizing complexes on both sides (BBD 6.1.2; the étale side is EtaleCohomologyFoundations §F.5).
3. Perverse t-exactness: the stalk/costalk conditions are computed on points of X and stratifications, which agree on both sides.
4. Realize Dbc in the unbounded coefficient category appropriate to its regime and AnalyticDbc in the native derived category of analytic module sheaves. Compare the ambient tensor and RHom of the realized inputs; finite-Tor boundedness receipts and realization isomorphisms identify the bounded restrictions. Over complex coefficient fields, use their separate analytic boundedness theorem, not a universal bounded operation over arbitrary rings.

Direct prerequisites: [Transport of traces, duality and Gysin classes to ℓ-adic and rational coefficients](#edc-6-adic-transport-of-duality-and-classes) (`EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`); `EtaleDualityAndPerverseSheaves:EDC.5/middle-perverse-t-structure`; `EtaleDualityAndPerverseSheaves:EDC.5/perverse-intermediate-extension`; `SchemeAndStackFoundations:SF.2`; `EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaf-category`.

Unit tests:

- `TauCeti.EtaleDuality.analytic_monodromy_nonunit` (non-example): On C× a rank-one analytic E local system with monodromy the uniformizer has no monodromy-stable finite free O lattice.

Source support:

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 6.1.2(A′)–(C′), pp. 149–150. Finite and integral comparison are equivalences; rational comparison is fully faithful with the lattice essential image. Commutation with operations is (C′).

Acceptance checks:

- X = 𝔸¹\_ℂ: H^q(𝔸¹\_ét, Λ) = H^q(ℂ, Λ) = Λ for q = 0, 0 otherwise.
- IC of the nodal cubic over ℂ: ε^\*IC\_X = ν\_\*Λ\_{P¹(ℂ)}\[1], the topological IC complex.

Suggested Lean names: `TauCeti.EtaleDuality.finite_analytic_equivalence`, `TauCeti.EtaleDuality.integral_analytic_equivalence`, `TauCeti.EtaleDuality.rational_analytic_fullyFaithful`, `TauCeti.EtaleDuality.rational_analytic_essentialImage`, `TauCeti.EtaleDuality.analytic_comparison_tExact`, `TauCeti.EtaleDuality.analytic_pushforward_comparison`, `TauCeti.EtaleDuality.analytic_pullback_comparison`, `TauCeti.EtaleDuality.analytic_lowerShriek_comparison`, `TauCeti.EtaleDuality.analytic_upperShriek_comparison`, `TauCeti.EtaleDuality.analytic_tensor_comparison`, `TauCeti.EtaleDuality.analytic_RHom_comparison`, `TauCeti.EtaleDuality.analyticComparison_realization`, `TauCeti.EtaleDuality.analytic_tensor_field_bounded`, `TauCeti.EtaleDuality.analytic_RHom_field_bounded`.

<a id="edc-6-trace-orientation-comparison"></a>

### Algebraic traces and cycle classes versus topological orientation

**Theorem · `EtaleDualityAndPerverseSheaves:EDC.6/trace-orientation-comparison`**

Let X be smooth separated of pure dimension d over ℂ and Λ = ℤ/n, ℤ\_ℓ or ℚ\_ℓ. Under the comparison isomorphism H^q(X\_ét, Λ) ≅ H^q(X^an, Λ) (EDC.6/complex-analytic-comparison) and the identification Λ(1) ≅ Λ given by exp(2πi/n) ↦ 1 (ζ\_n ↦ 1): (a) the étale trace Tr : H^{2d}\_c(X\_ét, Λ(d)) → Λ (EDC.2:trace-purity) corresponds to integration against the complex orientation, Tr\_X ↦ ∫\_{X^an}, sending the class of a point to 1; (b) the étale cycle class cl(Z) ∈ H^{2r}(X\_ét, Λ(r)) of a closed subvariety of codimension r corresponds to the topological fundamental class of Z^an (Poincaré dual of \[Z^an]); (c) cup products and compactly supported duality pairings correspond. The sign convention: c₁(O(1)) on P¹ maps to the positive generator of H²(P¹(ℂ), ℤ) for the complex orientation, with the Kummer sequence matched to the exponential sequence by exp(2πi·/n).

Hypotheses and scope:

- X smooth over ℂ; the identification Λ(1) ≅ Λ through e^{2πi/n} is part of the statement (other choices change Tr by a sign or a unit).

Proof plan:

1. The Kummer sequence 0 → μ\_n → 𝔾\_m → 𝔾\_m → 0 maps to the exponential sequence on X^an via μ\_n ≅ ℤ/n, e^{2πi k/n} ↔ k; hence c₁ corresponds to the topological first Chern class (CohomologicalPointCounting ComplexComparison L10–12, requested through SchemeAndStackFoundations:SF.2).
2. Traces are normalized by points and c₁(O(1)) on P¹ (EtaleCohomologyFoundations §0.11, ClassicalAlgebraic.smoothTrace, whose P¹ check sends c₁(O(1)) to 1), and the topological integration satisfies the same normalization; both are compatible with Gysin maps of points, so they agree.
3. Cycle classes: both sides are determined by the fundamental class of the smooth locus and semi-purity (EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map; the localized classes of regular immersions are EtaleCohomologyFoundations §0.9).

Direct prerequisites: [Comparison with the complex-analytic constructible category](#edc-6-complex-analytic-comparison) (`EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`); `EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`; `SchemeAndStackFoundations:SF.2`.

Unit tests:

- `TauCeti.EtaleDuality.orientation_projective_line_positive` (computation): After the positive Tate-generator orientation identification, c1(O(1)) on P¹(C) integrates to +1.

Source support:

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 6.1.2 (B′), p. 149. The comparison of étale and analytic constructible categories over ℂ underlying the trace comparison.

Acceptance checks:

- X = P¹: Tr(c₁(O(1))) = 1 on both sides (the stage's acceptance: P¹'s orientation).
- X an open curve: H²\_c(X, Λ(1)) ≅ Λ with the same normalization.
- A smooth divisor D ⊂ X: cl(D) = c₁(O(D)) maps to the topological Poincaré dual of \[D] under both routes.

Suggested Lean names: `TauCeti.EtaleDuality.trace_orientation_comparison`, `TauCeti.EtaleDuality.chern_orientation_comparison`, `TauCeti.EtaleDuality.gysin_orientation_comparison`.

<a id="edc-6-complete-intersection-betti-comparison"></a>

### Betti numbers of smooth complete intersections are independent of the field

**Theorem · `EtaleDualityAndPerverseSheaves:EDC.6/complete-intersection-betti-comparison`**

Fix N, m and a multidegree (d\_1, …, d\_{N−m}). For every separably closed field k of characteristic ≠ ℓ and every smooth complete intersection X ⊂ P^N\_k of that multidegree and dimension m, every Betti number is independent of the geometric field, and dim H^m(X, ℚ\_ℓ) equals the topological Betti number b\_m(X\_ℂ^an) of any smooth complete intersection X\_ℂ ⊂ P^N\_ℂ of the same multidegree, and hence the primitive rank b\_m^0 = dim H^m(X, ℚ\_ℓ)\_0 of EDC.4/complete-intersection-cohomology is a function of (N, m, d\_•) only; for a smooth hypersurface of degree d, b\_m^0 = ((d − 1)^{m+2} + (−1)^m(d − 1))/d.

Hypotheses and scope:

- Smooth complete intersections of a fixed multidegree; ℓ invertible in k.
- m≥1 for the primitive-rank and displayed hypersurface formula, as in EDC.4/complete-intersection-cohomology; d≥1. Zero-dimensional reduced cohomology is a different convention.

Proof plan:

1. The parameter scheme S ⊂ ∏ P(Sym^{d\_i}) over Spec ℤ\[1/ℓ] of tuples defining a smooth complete intersection of dimension m is open with geometrically irreducible (hence connected) fibres and nonempty over every point; the universal family f : 𝒳 → S is smooth and proper (requested from SchemeAndStackFoundations:SF.0).
2. Smooth proper base change makes R^mf\_\*ℚ\_ℓ lisse on the connected parameter scheme (EtaleCohomologyFoundations §F.3, VanishingCycles.lisseDirectImageTransport, at finite levels, then §F.4), hence its rank is constant. Identifications of different geometric fibres require a choice of path or specialization data; the canonical conclusion here is equality of ranks, not a canonical identification of all fibres.
3. Over ℂ, Artin's comparison (EDC.6/complex-analytic-comparison) identifies dim H^m(X\_ℂ, ℚ\_ℓ) with the topological Betti number. The hypersurface formula: by étale Gauss–Bonnet (EtaleCohomologyFoundations §F.6, VanishingCycles.etaleGaussBonnet) χ(X) = deg c\_m(T\_X), and c(T\_X) = (1+h)^{N+1}∏(1+d\_ih)^{−1} restricted to X (requested from SchemeAndStackFoundations:SF.5); EDC.4/complete-intersection-cohomology gives all other Betti numbers, so b\_m is determined by χ.

Direct prerequisites: [Cohomology of smooth complete intersections](#edc-4-complete-intersection-cohomology) (`EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology`); [Comparison with the complex-analytic constructible category](#edc-6-complex-analytic-comparison) (`EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`); `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.5`.

Source support:

- [Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), §16, p. 110. Milne: the primitive rank depends only on m and the degrees, with the explicit hypersurface formula.
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), §F.3, VanishingCycles.lisseDirectImageTransport; §F.6, VanishingCycles.etaleGaussBonnet (README at head c4ee54f). §F.3 states lissity of R^if\_\* for smooth proper f with finite lisse coefficients; §F.6 states étale Gauss–Bonnet deg c\_d(T\_X) = Σ(−1)^i dim H^i(X, ℚ\_ℓ) for smooth proper X over an algebraically closed field.

Acceptance checks:

- Smooth plane cubics: b\_1 = 2 over every k (= (8 − 2)/3 = 2 by the formula with m = 1, d = 3).
- Smooth quadric surfaces: b\_2^0 = (1 + 1)/2 = 1.

Suggested Lean names: `TauCeti.EtaleDuality.complete_intersection_betti_comparison`, `TauCeti.EtaleDuality.complete_intersection_betti_all_degrees`, `TauCeti.EtaleDuality.complete_intersection_primitive_rank`, `TauCeti.EtaleDuality.hypersurface_primitive_rank`.

<a id="edc-6-diamond-transport-of-duality"></a>

### Transport of duality and perversity statements to diamonds in characteristic p

**Theorem · `EtaleDualityAndPerverseSheaves:EDC.6/diamond-transport-of-duality`**

Let k be of characteristic p, X separated of finite type over k, and Λ torsion killed by an integer prime to p. Put a : X → Spec k, B = (Spec k)^◇, and K\_{X^◇/B} = a^{◇!}c\_{Spec k}^\*Λ. For K ∈ D^b\_c(X, Λ), ECD 27.2–27.4 imply Rc\_{X\*}K\_{X^◇/B} ≅ K\_X and Rc\_{X\*}RHom(c\_X^\*K, K\_{X^◇/B}) ≅ D\_XK. These recover scheme duality through the right adjoint. The stronger assertions c\_X^\*K\_X ≅ K\_{X^◇/B} and c\_X^\*D\_XK ≅ D\_{X^◇/B}c\_X^\*K are conditional on an additional exceptional-pullback/internal-Hom comparison and preservation of the essential image; these inputs are not supplied by 27.1–27.4. No perverse t-structure on arbitrary diamonds is asserted.

Hypotheses and scope:

- Characteristic p, finite-type separated X over k, torsion coefficients prime to p; the dualizing complex is relative to B = (Spec k)^◇.
- The strong pullback transport requested by the stage remains a recorded gap; this node proves only right-adjoint recovery.
- The Rc\_\* identities live in the unbounded etale derived category. A bounded constructible K enters through its etale realization; no preservation of D^b\_c by Rc\_\* on arbitrary diamond objects is assumed. The relative dualizing objects on both sides use their actual maps to the common base.
- Tensor, internal Hom and coefficient change are the enhanced operations of EnhancedDerivedSheaves §0.3 in the ambient unbounded derived category; the scheme dualizing complex, biduality and exchange isomorphisms are EtaleCohomologyFoundations §F.5. Bounded outputs require actual bounded-constructible restriction witnesses.

Proof plan:

1. Use R a^! Rc\_{Spec k\*} ≅ Rc\_{X\*}R a^{◇!} and Rc\_{Spec k\*}c\_{Spec k}^\*Λ ≅ Λ to recover K\_X.
2. Apply the internal-Hom right-adjoint identity of 27.3 with first input c\_X^\*K, then the unit K ≅ Rc\_{X\*}c\_X^\*K to obtain D\_XK.
3. A counit c\_X^\*Rc\_{X\*}D\_{X^◇/B}c\_X^\*K → D\_{X^◇/B}c\_X^\*K need not be an isomorphism by full faithfulness alone; the missing essential-image argument is recorded as a gap.

Direct prerequisites: [Scheme, adic and diamond comparisons of the duality operations, with their exact hypotheses](#edc-6-scheme-adic-diamond-operation-comparisons-index) (`EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`); `AdicCoefficientsAndComparisons:L3/full-faithfulness-27-2`; `AdicCoefficientsAndComparisons:L3/rf-shriek-comparison-27-4`; `AdicCoefficientsAndComparisons:L3/commutation-and-adjoints-27-1-27-3`; `AdicCoefficientsAndComparisons:L3/internal-Hom-right-adjoint`; `AdicCoefficientsAndComparisons:L3/pushforward-right-adjoint`; `AdicCoefficientsAndComparisons:L3`.

Source support:

- [Étale cohomology of diamonds](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf), §27, Proposition 27.4, p. 165. 27.4 compares ! operations using c^\* for Rf\_! and Rc\_\* for Rf^!; together with 27.2–27.3 it supplies right-adjoint recovery, not an unconditional c^\* duality isomorphism.

Acceptance checks:

- X = 𝔸^d over k: K\_{(𝔸^d)^◇} ≅ Λ(d)\[2d] = c^\*K\_{𝔸^d}.
- X = P¹: D commutes with c^\* on Λ\_X, giving Λ(1)\[2] on both sides.

Suggested Lean names: `TauCeti.EtaleDuality.diamond_transport_of_duality`.

<a id="edc-6-normalized-adic-system"></a>

### Uniformly bounded constructible normalized adic systems

**Definition · `EtaleDualityAndPerverseSheaves:EDC.6/normalized-adic-system`** · planet: Normalized constructible adic systems

For a complete DVR O as in IntegralDatum, write R\_n = O/λ^(n+1). An adic system consists of bounded constructible levels K\_n and isomorphisms R\_m ⊗^L\_{R\_n} realization(K\_n) ≅ realization(K\_m) in the ambient unbounded R\_m-derived category for m ≤ n, with identity and triple-associator equations there. This is not an unrestricted functor Dbc(R\_n) → Dbc(R\_m). Normalization requires one pair of ordinary bounds, one pair of Tor bounds tested against all degree-zero ambient R\_n-sheaves, and one finite algebraic stratification on which every level ordinary-cohomology sheaf is lisse finite. The same bounds and stratification work for all n. Compatible level maps give the system category; NormalizedSystem is its full subcategory satisfying this predicate. For O = ℤ\_ℓ (λ = ℓ) the bounds part is VanishingCycles.normalizedAdicSystems of EtaleCohomologyFoundations §F.4.1, imported; the node adds the ramified λ-adic towers and the common stratification as part of the API. No unrestricted inverse limit is declared constructible.

Proof plan:

1. Use the coherent finite-level coefficient change of EnhancedDerivedSheaves §0.4 (ClassicalDerived.functorCoherence.coefficientComparison) with its canonical associators. The transition isomorphism itself identifies an ambient reduction with a bounded level. Define finite Tor and the uniform normalization bounds in the native standard t-structure of the ambient unbounded category (EnhancedDerivedSheaves §0.3), never in an already-bounded tensor codomain.
2. Extract ordinary and Tor bounds and a common finite stratification from the constructible pro-étale criterion (Bhatt–Scholze 6.7.1–6.7.2 and 6.8.14–6.8.15). E4 reconstruction supplies completeness but not constructibility.
3. The normalization equivalence identifies every level with derived coefficient reduction; for O = ℤ\_ℓ this is the comparison of EtaleCohomologyFoundations §§F.4.1–F.4.3.
4. Over O, which has global dimension one, integral-to-quotient reduction of a bounded constructible complex has a bounded realization. Quotient-to-quotient reduction does not have this property on all Dbc objects. On a separably closed point, R = ℤ/ℓ² and M = R/ℓ have Tor\_i(M, M) = M and Ext^i(M, M) = M for every i ≥ 0; the periodic multiplication-by-ℓ free resolution proves the obstruction (compare the Tor check of EtaleCohomologyFoundations §F.1). M remains in Dbc and in the point perverse heart, but has no finite Tor amplitude.
5. Use the coefficient-module sheaf category for the specified regime: finite levels have the t-exact native étale identification, while integral and rational objects realize in the pro-étale completed-coefficient category (EtaleCohomologyFoundations §F.4.3). Neither faithful realization nor its t-compatibility is asserted for ordinary étale constant-O sheaves.

Direct prerequisites: `EnhancedDerivedSheaves:E4/coefficient-system-reconstruction`; `EnhancedDerivedSheaves:E4/inverse-limit-reconstruction`.

Uses:

- EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories: the λ-adic constructible category is NormalizedSystem, compared with D\_cons(X\_proét, O) through the reduction functors and Rlim
- EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes: levelwise duality, traces and Gysin maps are maps of normalized systems; the reduction API identifies their levels with derived reductions
- EtaleDualityAndPerverseSheaves:EDC.6/operation-reduction-comparisons (accepted EDC.6 packet): strict reduction of the operations is stated on normalized systems, using their common strata and uniform Tor bounds
- EtaleDualityAndPerverseSheaves:EDC.7/restricted-constructible-categories (accepted EDC.7 packet): the common stratification and uniform bounds select the good-model strata for specialization to finite fields

API:

- `TauCeti.EtaleDuality.normalized_system_reduction` (compatibility): Under the equivalence, the n-th level is canonically isomorphic to derived reduction of the original integral complex.
- `TauCeti.EtaleDuality.normalized_system_uniform_bounds` (characterisation): Every normalized system has one lower and one upper ordinary cohomological bound valid at every level.
- `TauCeti.EtaleDuality.normalized_system_common_strata` (characterisation): Every normalized system has one finite algebraic stratification on which every cohomology sheaf at every level is lisse.
- `TauCeti.EtaleDuality.normalized_system_finiteTor` (characterisation): Each bounded level of a normalized system has finite Tor amplitude, measured in its ambient unbounded coefficient category against all degree-zero sheaves; the system predicate supplies the same interval for all levels.

Unit tests:

- `TauCeti.EtaleDuality.adic_constant_normalized` (computation): The constant integral complex produces a normalized system with uniform ordinary and Tor bounds.
- `TauCeti.EtaleDuality.adic_reduction_coherence` (compatibility): Successive reductions through n,m,l agree with direct reduction by the specified coefficient associator.
- `TauCeti.EtaleDuality.adic_unbounded_shifts_excluded` (non-example): A coherent system for which every proposed uniform ordinary interval fails at some level does not satisfy IsNormalized.
- `TauCeti.EtaleDuality.nonperfect_point_unbounded_operations` (non-example): Over a separably closed point and R=Z/ell², the degree-zero finite module M=R/ell belongs to Dbc, is not finite-Tor, and its ambient self-tensor has M in every nonpositive degree while its ambient self-RHom has M in every nonnegative degree. The suggested form fixes the actual quotient module and asserts the cohomology identifications.

Source support:

- [The pro-étale topology for schemes](https://arxiv.org/pdf/1309.1198v2), §§6.5–6.8, especially Proposition 6.6.11, Theorem 6.7.1 and Lemma 6.7.2, Proposition 6.8.14 and Remark 6.8.15, pp. 49–62 (arXiv v2). Bhatt–Scholze define constructible complexes on X\_proét with O and E coefficients and compare them with the classical category.
- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), 2.2.14, p.71. Finite Tor is required for a bounded coefficient transition; general bounded constructible objects are not automatically in the ctf subcategory.
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), §F.4.1, VanishingCycles.normalizedAdicSystems (README at head c4ee54f). Defines normalized bounded constructible ℓ-adic systems with common cohomological and Tor intervals independent of the level, with tensor, internal Hom for uniformly perfect sources and admissible truncations; checks the constant tower and the failure for unrelated ranks.

Acceptance checks:

- The named suggested forms use the stated objects, maps, bounds and coefficient regime.
- Agreement with the upstream notion: for O = ℤ\_ℓ a system is normalized exactly when it is a normalized system in the sense of EtaleCohomologyFoundations §F.4.1 whose levels admit one common lisse stratification; the constant tower is normalized there and here.

Suggested Lean names: `TauCeti.EtaleDuality.AdicSystem`, `TauCeti.EtaleDuality.AdicSystem.IsNormalized`, `TauCeti.EtaleDuality.NormalizedSystem`, `TauCeti.EtaleDuality.levelReduction`, `TauCeti.EtaleDuality.HasFiniteTorAmplitude`, `TauCeti.EtaleDuality.BoundedConstructible`, `TauCeti.EtaleDuality.boundedRestriction`, `TauCeti.EtaleDuality.boundedRestrictionIso`, `TauCeti.EtaleDuality.CoefficientDerived`, `TauCeti.EtaleDuality.coefficientRealization`, `TauCeti.EtaleDuality.finiteCoefficientEquivalence`, `TauCeti.EtaleDuality.finiteCoefficientEquivalence_tExact`, `TauCeti.EtaleDuality.finiteCoefficientEquivalence_realization`.

<a id="edc-6-api-normalized-system-reduction"></a>

### normalized system reduction API lemma

**Lemma · `EtaleDualityAndPerverseSheaves:EDC.6/api-normalized-system-reduction`**

In the coefficient, geometric and category setting of Uniformly bounded constructible normalized adic systems: Under the equivalence, the n-th level is canonically isomorphic to derived reduction of the original integral complex.

Proof plan:

1. Use the construction in EtaleDualityAndPerverseSheaves:EDC.6/normalized-adic-system and the cited source argument for this named API fact. Retain all the owner’s hypotheses and its specified maps.
2. The downstream uses are EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes. They cite this lemma directly rather than implicitly taking the API as proved.

Direct prerequisites: [Uniformly bounded constructible normalized adic systems](#edc-6-normalized-adic-system) (`EtaleDualityAndPerverseSheaves:EDC.6/normalized-adic-system`).

Source support:

- [The pro-étale topology for schemes](https://arxiv.org/pdf/1309.1198v2), §§6.5–6.8, especially Proposition 6.6.11, Theorem 6.7.1 and Lemma 6.7.2, Proposition 6.8.14 and Remark 6.8.15, pp. 49–62 (arXiv v2). Bhatt–Scholze define constructible complexes on X\_proét with O and E coefficients and compare them with the classical category.

Acceptance checks:

- The named suggested forms use the stated objects, maps, bounds and coefficient regime.

Suggested Lean names: `TauCeti.EtaleDuality.normalized_system_reduction`.

<a id="edc-6-api-normalized-system-uniform-bounds"></a>

### normalized system uniform bounds API lemma

**Lemma · `EtaleDualityAndPerverseSheaves:EDC.6/api-normalized-system-uniform-bounds`**

In the coefficient, geometric and category setting of Uniformly bounded constructible normalized adic systems: Every normalized system has one lower and one upper ordinary cohomological bound valid at every level.

Proof plan:

1. Use the construction in EtaleDualityAndPerverseSheaves:EDC.6/normalized-adic-system and the cited source argument for this named API fact. Retain all the owner’s hypotheses and its specified maps.
2. The downstream use is EtaleDualityAndPerverseSheaves:EDC.7/restricted-constructible-categories (accepted EDC.7 packet), which cites this lemma directly rather than implicitly taking the API as proved.

Direct prerequisites: [Uniformly bounded constructible normalized adic systems](#edc-6-normalized-adic-system) (`EtaleDualityAndPerverseSheaves:EDC.6/normalized-adic-system`).

Source support:

- [The pro-étale topology for schemes](https://arxiv.org/pdf/1309.1198v2), §§6.5–6.8, especially Proposition 6.6.11, Theorem 6.7.1 and Lemma 6.7.2, Proposition 6.8.14 and Remark 6.8.15, pp. 49–62 (arXiv v2). Bhatt–Scholze define constructible complexes on X\_proét with O and E coefficients and compare them with the classical category.

Acceptance checks:

- The named suggested forms use the stated objects, maps, bounds and coefficient regime.

Suggested Lean names: `TauCeti.EtaleDuality.normalized_system_uniform_bounds`.

<a id="edc-6-api-normalized-system-common-strata"></a>

### normalized system common strata API lemma

**Lemma · `EtaleDualityAndPerverseSheaves:EDC.6/api-normalized-system-common-strata`**

In the coefficient, geometric and category setting of Uniformly bounded constructible normalized adic systems: Every normalized system has one finite algebraic stratification on which every cohomology sheaf at every level is lisse.

Proof plan:

1. Use the construction in EtaleDualityAndPerverseSheaves:EDC.6/normalized-adic-system and the cited source argument for this named API fact. Retain all the owner’s hypotheses and its specified maps.
2. The downstream uses are EtaleDualityAndPerverseSheaves:EDC.7/restricted-constructible-categories. They cite this lemma directly rather than implicitly taking the API as proved.

Direct prerequisites: [Uniformly bounded constructible normalized adic systems](#edc-6-normalized-adic-system) (`EtaleDualityAndPerverseSheaves:EDC.6/normalized-adic-system`).

Source support:

- [The pro-étale topology for schemes](https://arxiv.org/pdf/1309.1198v2), §§6.5–6.8, especially Proposition 6.6.11, Theorem 6.7.1 and Lemma 6.7.2, Proposition 6.8.14 and Remark 6.8.15, pp. 49–62 (arXiv v2). Bhatt–Scholze define constructible complexes on X\_proét with O and E coefficients and compare them with the classical category.

Acceptance checks:

- The named suggested forms use the stated objects, maps, bounds and coefficient regime.

Suggested Lean names: `TauCeti.EtaleDuality.normalized_system_common_strata`.

## Retired drafts

| Draft | Replacement (owner packet) | Consumers to repoint |
| --- | --- | --- |
| `EDC.5/t-structure-heart-abelian` | `EDC.5/heart-abelian-subcategory` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/t-cohomology-functor` | `EDC.5/t-structure-cohomology` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/t-exact-functor` | `EDC.5/t-exact-functors` (EtaleDualityAndPerverseSheaves--EDC.5.json) | IgusaVarietiesAndTorsionConcentration.json: IG.4/compact-perversity, IG.4/compact-minimal-stratum-concentration, IG.4/semiperversity, IG.4/minimal-stratum-lower-bound |
| `EDC.5/recollement-data` | `EDC.5/recollement-situation` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/glued-t-structure` | `EDC.5/gluing-t-structures` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/abstract-intermediate-extension` | `EDC.5/recollement-intermediate-extension` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/perverse-t-structure` | `EDC.5/middle-perverse-t-structure` (EtaleDualityAndPerverseSheaves--EDC.5.json) | GeometricSatakeAndFusion--GS0.json: GS1/relative-perverse-t-structure; IgusaVarietiesAndTorsionConcentration.json: IG.4/compact-perversity, IG.4/compact-minimal-stratum-concentration, IG.4/semiperversity, IG.4/minimal-stratum-lower-bound; SchemeAndStackFoundations--SF.0.json (text reference) |
| `EDC.5/perverse-sheaves` | `EDC.5/perverse-sheaf-category` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/lisse-shift-is-perverse` | `EDC.5/shifted-local-systems-perverse` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/perverse-recollement` | `EDC.5/open-closed-perverse-recollement` (EtaleDualityAndPerverseSheaves--EDC.5.json) | GeometricSatakeAndFusion--GS0.json: GS1/integral-family-comparison, GS1/relative-perverse-t-structure |
| `EDC.5/intermediate-extension` | `EDC.5/perverse-intermediate-extension` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/intersection-complex` | `EDC.5/intersection-complex-of-local-system` (EtaleDualityAndPerverseSheaves--EDC.5.json) | GeometricSatakeAndFusion--GS0.json: GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles |
| `EDC.5/simple-perverse-sheaves` | `EDC.5/simple-perverse-sheaves-classification` (EtaleDualityAndPerverseSheaves--EDC.5.json) | EtaleDualityAndPerverseSheaves--EDC.7.json (text reference) |
| `EDC.5/verdier-duality-perverse` | `EDC.5/perverse-verdier-self-duality` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/affine-perverse-artin-vanishing` | `EDC.5/perverse-artin-vanishing` (EtaleDualityAndPerverseSheaves--EDC.5.json) | GeometricSatakeAndFusion--GS0.json: GS1/perverse-descent-and-shifted-ct, GS1/standard-costandard-objects; IgusaVarietiesAndTorsionConcentration.json: IG.4/compact-perversity, IG.4/compact-minimal-stratum-concentration, IG.4/semiperversity, IG.4/minimal-stratum-lower-bound |
| `EDC.5/perverse-amplitude-estimates` | `EDC.5/fibre-dimension-perverse-amplitude` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/generic-degree-concentration` | `EDC.5/perverse-sheaf-category` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/semismall-pushforward-perverse` | `EDC.5/semismall-pushforward-perversity` (EtaleDualityAndPerverseSheaves--EDC.5.json) | GeometricSatakeAndFusion--GS0.json: GS1/rational-weight-concentration, GS2:correspondences/rational-special-fibre-convolution (the replacement assumes that both i\_α^\*K and i\_α^\*D\_X K have locally constant cohomology on the source strata and is stated for self-injective or rational coefficients; each consumer must check that hypothesis for its convolution input) |
| `EDC.5/small-map-intersection-complex` | `EDC.5/small-pushforward-intersection-complex` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/integral-perverse-torsion-pair` | `EDC.5/integral-dual-perversity` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.7/weights-and-perverse-truncation` | `EDC.7/perverse-cohomology-weights` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/ext-vanishing-weights` | `EDC.7/weight-ext-vanishing` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/mixed-perverse-weight-filtration` | `EDC.7/weight-filtration` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/ic-purity` | `EDC.7/intersection-complex-purity` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/geometric-semisimplicity` | `EDC.7/pure-perverse-geometric-semisimplicity` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/pure-complex-decomposition` | `EDC.7/pure-complex-geometric-splitting` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/proper-direct-image-decomposition` | `EDC.7/decomposition-theorem` (EtaleDualityAndPerverseSheaves--EDC.7.json) | GeometricSatakeAndFusion--GS0.json: GS1/standard-costandard-torsion-bound |
| `EDC.7/relative-hard-lefschetz` | `EDC.7/relative-hard-lefschetz-theorem` (EtaleDualityAndPerverseSheaves--EDC.7.json) | EndoscopicTransferAndUnitaryTraceComparison--ET.0.json (text reference); EtaleDualityAndPerverseSheaves--EDC.7.json (text reference) |
| `EDC.7/relative-primitive-decomposition` | `EDC.7/relative-lefschetz-primitive-decomposition` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/spreading-out-to-finite-fields` | `EDC.7/restricted-constructible-categories` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/characteristic-zero-decomposition` | `EDC.7/decomposition-theorem-complex` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.8/cohomological-correspondence` | `EDC.8/cohomological-correspondence-lifting` (EtaleDualityAndPerverseSheaves--EDC.7.json) | EndoscopicTransferAndUnitaryTraceComparison--ET.5.json (text reference); EtaleDualityAndPerverseSheaves--EDC.7.json (text reference) |
| `EDC.8/correspondence-pushforward` | `EDC.8/cohomological-correspondence-pushforward` (EtaleDualityAndPerverseSheaves--EDC.7.json) | ExcursionOperatorsAndSpectralAction--ES7.json: ES7:equal-characteristic/frobenius-hecke-correspondences |
| `EDC.8/correspondence-restriction` | `EDC.8/correspondence-pullback-and-restriction` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.8/correspondence-composition` | `EDC.8/cohomological-correspondence-composition` (EtaleDualityAndPerverseSheaves--EDC.7.json) | ExcursionOperatorsAndSpectralAction--ES7.json: ES7:equal-characteristic/frobenius-hecke-correspondences; SchemeAndStackFoundations--SF.0.json (text reference) |
| `EDC.8/correspondence-trace` | `EDC.8/trace-map-and-local-terms` (EtaleDualityAndPerverseSheaves--EDC.7.json) | ExcursionOperatorsAndSpectralAction--ES7.json: ES7:equal-characteristic/geometric-automorphic-trace; SchemeAndStackFoundations--SF.0.json (text reference) |
| `EDC.8/lefschetz-verdier-formula` | `EDC.8/lefschetz-verdier-trace-formula` (EtaleDualityAndPerverseSheaves--EDC.7.json) | ExcursionOperatorsAndSpectralAction--ES7.json: ES7:equal-characteristic/geometric-automorphic-trace |
| `EDC.8/local-terms-finite-order` | `EDC.8/finite-order-local-terms` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.8/similitude-reciprocal-charpoly` | `EDC.8/similitude-charpoly-reciprocity` (EtaleDualityAndPerverseSheaves--EDC.7.json) | ExcursionOperatorsAndSpectralAction--ES7.json: ES7:equal-characteristic/dual-isotypic-pairing, ES7:equal-characteristic/kaiser-erratum |
| `EDC.8/middle-degree-determinant` | `EDC.8/form-similitude-determinant` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.8/poincare-pairing-reciprocity-export` | `EDC.8/poincare-reciprocity-export` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/perverse-weight-filtration-data` | `EDC.7/weight-filtration` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/categorical-graded-lefschetz` | `EDC.7/graded-lefschetz-object` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/categorical-primitive-decomposition` | `EDC.7/abstract-primitive-decomposition` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/geometric-origin` | `EDC.7/geometric-origin-class` (EtaleDualityAndPerverseSheaves--EDC.7.json) | EtaleDualityAndPerverseSheaves--EDC.7.json (text reference) |
| `EDC.7/restricted-residual-constructibility` | `EDC.7/restricted-constructible-categories` (EtaleDualityAndPerverseSheaves--EDC.7.json) | SchemeAndStackFoundations--SF.0.json (text reference) |
| `EDC.7/geometric-origin-pure-specialization` | `EDC.7/pure-specialization-of-geometric-origin` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.5/api-t-structure-homology-zero-is-homological` | `EDC.5/t-structure-cohomology` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-t-structure-is-zero-of-homology-is-zero` | `EDC.5/t-structure-cohomology` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-t-structure-is-l-e-iff-homology` | `EDC.5/t-structure-cohomology` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-functor--is-right-t-exact-comp` | `EDC.5/t-exact-functors` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-functor--is-left-t-exact-comp` | `EDC.5/t-exact-functors` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-functor-is-right-t-exact-iff-is-left-t-exact-of-adjunction` | `EDC.5/t-exact-functors` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-functor-heart-functor-preserves-finite-colimits` | `EDC.5/t-exact-functors` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-functor-heart-functor-preserves-finite-limits` | `EDC.5/t-exact-functors` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-recollement-triangle-lower-shriek-distinguished` | `EDC.5/recollement-situation` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-recollement-triangle-upper-shriek-distinguished` | `EDC.5/recollement-situation` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-recollement-upper-star-lower-shriek-eq-zero` | `EDC.5/recollement-situation` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-recollement-upper-star-intermediate-extension` | `EDC.5/recollement-intermediate-extension` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-recollement-intermediate-extension-no-sub-quotient` | `EDC.5/recollement-intermediate-extension` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-recollement-intermediate-extension-unique` | `EDC.5/recollement-intermediate-extension` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-recollement-intermediate-extension-fully-faithful` | `EDC.5/recollement-intermediate-extension` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-recollement-simple-classification` | `EDC.5/recollement-intermediate-extension` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-perverse-t-structure-le-iff` | `EDC.5/middle-perverse-t-structure` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-perverse-t-structure-ge-iff-verdier-dual` | `EDC.5/perverse-verdier-self-duality` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-perverse-t-structure-bounded` | `EDC.5/middle-perverse-t-structure` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-perverse-t-structure-glue` | `EDC.5/middle-perverse-t-structure` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-perverse-sheaf-hom-is-sheaf` | `EDC.5/perverse-sheaf-category` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-intermediate-extension-eq-image` | `EDC.5/perverse-intermediate-extension` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-restrict-intermediate-extension` | `EDC.5/perverse-intermediate-extension` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-intermediate-extension-stalk-bound` | `EDC.5/perverse-intermediate-extension` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-intermediate-extension-costalk-bound` | `EDC.5/perverse-intermediate-extension` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-intermediate-extension-comp` | `EDC.5/perverse-intermediate-extension` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-intersection-complex-restrict` | `EDC.5/intersection-complex-of-local-system` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.5/api-intersection-complex-simple` | `EDC.5/intersection-complex-of-local-system` (EtaleDualityAndPerverseSheaves--EDC.5.json) | none |
| `EDC.7/api-weight-filtration-unique` | `EDC.7/weight-filtration` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/api-weight-filtration-strict` | `EDC.7/weight-filtration` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/api-graded-tate-lefschetz-eta-power-succ` | `EDC.7/graded-lefschetz-object` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/api-graded-tate-lefschetz-primitive-kernel` | `EDC.7/graded-lefschetz-object` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/api-graded-tate-lefschetz-primitive-column-formula` | `EDC.7/abstract-primitive-decomposition` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/api-geometric-origin-simple` | `EDC.7/geometric-origin-class` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/api-geometric-origin-constituent` | `EDC.7/geometric-origin-class` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/api-restricted-by-iso` | `EDC.7/restricted-constructible-categories` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.7/api-restricted-by-constituents` | `EDC.7/restricted-constructible-categories` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.8/api-coh-corr-proper-support-map-id` | `EDC.8/cohomological-correspondence-lifting` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.8/api-coh-corr-proper-support-map-comp` | `EDC.8/cohomological-correspondence-lifting` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.8/api-coh-corr-pushforward-morphism` | `EDC.8/cohomological-correspondence-pushforward` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.8/api-coh-corr-pushforward-comp` | `EDC.8/cohomological-correspondence-pushforward` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.8/api-coh-corr-restrict-closed-support` | `EDC.8/correspondence-pullback-and-restriction` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.8/api-coh-corr-restrict-open-support` | `EDC.8/correspondence-pullback-and-restriction` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.8/api-coh-corr-trace-restrict-open` | `EDC.8/trace-map-and-local-terms` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |
| `EDC.8/api-coh-corr-local-term-sum` | `EDC.8/trace-additivity` (EtaleDualityAndPerverseSheaves--EDC.7.json) | none |

## Requests

- To `SchemeAndStackFoundations:SF.0`, for `EDC.4/blowup-direct-images`: Blow-ups along regular immersions of smooth schemes: for Z ⊂ X a smooth closed subscheme of pure codimension c of a smooth k-scheme, Bl\_Z X is smooth and proper over X, an isomorphism over X − Z, the exceptional divisor E = π^{-1}(Z) is the projective bundle P(N\_{Z/X}) over Z with O\_{Bl}(−E)|\_E ≅ O\_E(1) (Stacks, Divisors, blowing up along a regular immersion). TauCetiRoadmap main already states blow-ups and strict transforms (SchemeAndStackFoundations §4.11, with StableReduction Layer 4) and normal bundles of regular immersions (§5.5); the request is the identification of the exceptional divisor, which EtaleCohomologyFoundations §F.7 also consumes.
- To `SchemeAndStackFoundations:SF.0`, for `EDC.4/ample-divisor-weak-lefschetz`, `EDC.4/vanishing-and-restriction-subspaces`: For f : X → S universally closed (e.g. X proper over a field) and ℒ f-ample, X\_s → S is affine for every s ∈ Γ(X, ℒ) (Stacks, Tag 0EKE); and the Veronese re-embedding of P^N by O(r), under which degree-r hypersurfaces are hyperplane sections. Neither is stated on TauCetiRoadmap main.
- To `SchemeAndStackFoundations:SF.0`, for `EDC.4/complete-intersection-cohomology`, `EDC.6/complete-intersection-betti-comparison`: Smooth complete-intersection chains in P^N\_k (positive-degree homogeneous regular sequences whose successive zero schemes are smooth, each an ample divisor in the previous one), and the parameter scheme of smooth complete intersections of a given multidegree in P^N over ℤ\[1/ℓ]: an open subscheme of a product of projective spaces of forms, smooth with geometrically irreducible fibres over Spec ℤ\[1/ℓ], over which the universal complete intersection is smooth and proper.
- To `SchemeAndStackFoundations:SF.3`, for `EDC.4/ample-divisor-weak-lefschetz`: Bridge the existing Tau Ceti line-bundle/invertible-sheaf carrier to finite-type k-schemes and its tensor powers, sections and pullback. A chosen ample line has a positive tensor power induced by O(1) under an actual closed projective embedding. The zero scheme of the chosen section supplies the actual divisor. Reuse the existing line-bundle work; no new competing carrier is owned by EDC.
- To `SchemeAndStackFoundations:SF.5`, for `EDC.6/complete-intersection-betti-comparison`: The total Chern class of the tangent bundle of a smooth complete intersection X ⊂ P^N of multidegree (d\_1, …, d\_{N−m}): c(T\_X) = (1+h)^{N+1}∏(1+d\_ih)^{−1} restricted to X, from the Euler sequence and the conormal sequence of the regular embedding, with deg h^m = ∏d\_i. TauCetiRoadmap main states the Chern classes, Whitney sum and c(T\_{P^n}) (SchemeAndStackFoundations §5.4) and normal bundles of regular immersions (§5.5); the tangent–normal sequence of a smooth subvariety and this computation are the request. With étale Gauss–Bonnet (EtaleCohomologyFoundations §F.6) it gives the hypersurface Betti formula.
- To `SchemeAndStackFoundations:SF.2`, for `EDC.6/complex-analytic-comparison`, `EDC.6/trace-orientation-comparison`: ComplexComparison (CohomologicalPointCounting, layers 10–12, TauCetiRoadmap pull request 196): Artin's comparison theorem H^q(X\_ét, F) ≅ H^q(X(ℂ), F) and (R^qf\_{ét\*}F)^an ≅ R^qf\_{cl\*}F^an for f of finite type over ℂ and F constructible (SGA 4 XVI 4.1), and the compatibility of the Kummer sequence with the exponential sequence under μ\_n ≅ ℤ/n, e^{2πik/n} ↦ k, so that the étale and topological first Chern classes agree. Supply the analytic unbounded realization and the ambient coefficient-operation comparison; restrict tensor and RHom through proved bounded-constructible witnesses, with finite-Tor source input. Any finite-generation assertion is for geometric cohomology over a separably closed field.
- To `AdicCoefficientsAndComparisons:L3`, for `EDC.6/diamond-transport-of-duality`, `EDC.6/scheme-adic-diamond-operation-comparisons-index`: For the stronger EDC.6 c^\* dualizing/RHom transport, specify and prove essential-image preservation for the relative exceptional pullback and internal Hom, together with an invertible adjunction counit on those objects, in an exact geometric and coefficient range. The existing 27.1–27.4 right-adjoint recovery nodes are imported separately and do not establish this statement.

## Gaps

- **Strong exceptional-pullback and duality transport to diamonds** (needed by `EDC.6/scheme-adic-diamond-operation-comparisons-index`, `EDC.6/diamond-transport-of-duality`). The stage asks for c^\*K\_X and c^\*D\_X comparisons, but ECD 27.1–27.4 supply only Rc\_\* recovery. Supply a theorem from AdicCoefficientsAndComparisons:L3 proving the required essential-image preservation/counit isomorphism (with exact geometric and coefficient hypotheses), or explicitly rescope the target. Do not infer it from full faithfulness.
- **Relative perverse t-structures and universal local acyclicity over a base** (needed by `GlobalShtukasAndFunctionFieldLanglands:GS.1`). GlobalShtukasAndFunctionFieldLanglands requested from EDC.4 'the perverse t-structure relative to a base' and 'universal local acyclicity'. Universal local acyclicity for schemes with finite invertible coefficients is now stated upstream (EtaleCohomologyFoundations §F.2.3, VanishingCycles.localAcyclicity, and §F.3, VanishingCycles.genericLocalAcyclicity, TauCetiRoadmap pull request #938). The perverse t-structure relative to a base is not EDC.4 mathematics: EDC.5 is the absolute perverse t-structure over a field, the diamond relative version of Hansen–Scholze is GeometricSatakeAndFusion:GS1 (FS VI.7), and the scheme-theoretic relative version over a curve has no owner.
- **Nearby cycles over general bases and compactification boundary machinery requested from EDC.5/EDC.6** (needed by `GlobalShtukasAndFunctionFieldLanglands:GS.6`, `GlobalShtukasAndFunctionFieldLanglands:GS.7`). GlobalShtukasAndFunctionFieldLanglands requested nearby cycles over general bases with Orgogozo's finiteness theorem and 'compactifications and boundary strata in the étale setting'. Scheme compactification objects, Nagata existence and common refinements are now stated upstream (EtaleCohomologyFoundations §§G.1–G.3); nearby cycles over a henselian trait belong to LefschetzPencilsAndVanishingCycles (TauCetiRoadmap pull request #873). Nearby cycles over general bases (Orgogozo, Lu–Zheng) have no owner.

## Restructuring proposals

- rescope (`EtaleDualityAndPerverseSheaves`, `GeometricSatakeAndFusion`, `IgusaVarietiesAndTorsionConcentration`, `ExcursionOperatorsAndSpectralAction`, `SchemeAndStackFoundations`, `EndoscopicTransferAndUnitaryTraceComparison`): This packet held drafts for EDC.5–EDC.8 from the original part job. The accepted packets EtaleDualityAndPerverseSheaves--EDC.5 (supersededDraftNodes) and EtaleDualityAndPerverseSheaves--EDC.7 (its rescope entry) re-planned them under new ids and asked this round to retire them. The queue job and its issue name EDC.4 as the only stage in scope. Proposal: Retire the 92 EDC.5, EDC.7 and EDC.8 drafts listed in retiredDraftNodes and repoint their consumers to the listed replacements: GeometricSatakeAndFusion--GS0, IgusaVarietiesAndTorsionConcentration, ExcursionOperatorsAndSpectralAction--ES7 (prerequisites), and the text references in SchemeAndStackFoundations--SF.0, EndoscopicTransferAndUnitaryTraceComparison--ET.0 and --ET.5. Keep the twelve EDC.6 nodes here: EtaleDualityAndPerverseSheaves--EDC.6 (importsFromPackets) and --EDC.7 import them by id, as do CompletedCohomologyPartII--CC.8 and SchemeAndStackFoundations--SF.0. EDC.5–EDC.8 coverage is held by their own accepted packets; this packet records coverage for EDC.4 only.
- rescope (`EtaleDualityAndPerverseSheaves`): Maintainer instruction of 2026-10-17: EtaleCohomologyFoundations, EnhancedDerivedSheaves and ClassicalAdicEtaleCohomology are open TauCetiRoadmap pull requests; consume their six operations and duality statements and keep here only what they do not state. Proposal: For the roadmap's package: EDC.4 cites EtaleCohomologyFoundations §0.9 and §F.7 for the projective-bundle formula, the blow-up decomposition and weak Lefschetz for smooth ample hyperplane sections, and §§0.7–0.11, F.2–F.6 and F.10 for localization, proper supports, base change, Artin vanishing, finiteness, normalized adic realization, duality, purity, Gysin maps, cycle classes and Frobenius; EnhancedDerivedSheaves §§0.1–0.4 and E4 for the enhanced operations and completion. The nodes here state only the residues listed in the summary. The same instruction applies to the accepted EtaleDualityAndPerverseSheaves--EDC.0 packet (EDC.0–EDC.3: six operations, Verdier duality, Poincaré duality, purity, cycle classes, projective-space and projective-bundle cohomology), which this job does not edit: when the roadmap is packaged, EDC.0–EDC.3 should cite those upstream sections and keep only their residues (for example the higher étale Chern classes of EDC.3/chern-classes and the descent of cycle classes to Chow groups of EDC.3/cycle-class-map, which EtaleCohomologyFoundations does not state).
- rescope (`EtaleDualityAndPerverseSheaves`, `GeometricSatakeAndFusion`, `GlobalShtukasAndFunctionFieldLanglands`, `AdicCoefficientsAndComparisons`, `VStackSheavesAndLisseCategories`): Confirmed finding RT-AREA-geomlanglands/18 and two mis-addressed requests: the stage edge EDC.4 → GeometricSatakeAndFusion:GS1 carries nothing (EDC.4 is weak Lefschetz, projective bundles and blow-ups), GeometricSatakeAndFusion--GS0 requests the perverse t-structure and recollement from EDC.4, and GlobalShtukasAndFunctionFieldLanglands requests perverse sheaves, IC, the decomposition theorem and the smallness criterion from EDC.4. Proposal: Drop the edge EDC.4 → GS1 and keep EDC.5 → GS1 (already present). GS0/GS1's request is supplied by EDC.5/middle-perverse-t-structure, EDC.5/open-closed-perverse-recollement and EDC.5/perverse-intermediate-extension; GlobalShtukas GS.1's by EDC.5/perverse-sheaf-category, EDC.5/intersection-complex-of-local-system, EDC.5/small-pushforward-intersection-complex and EDC.7/decomposition-theorem (edge EDC.7 → GS.1 to add; acyclic, since EDC.7 does not depend on GlobalShtukas). Relative perversity and ULA are not EDC's (see gaps). Complete RT-AREA-geomlanglands/18 by adding AdicCoefficientsAndComparisons:L1 → GS1 and L3 → GS1 for the diamond carrier and comparison, and dropping VStackSheavesAndLisseCategories:VS3 → GS2:correspondences and VS3 → GS3:fusion: GS2 correspondences use the six-functor owner and fusion uses ULA/nearby cycles, not the VS3 Hecke-stack-equivalence theorem. These are orchestrator proposals, not edits to those roadmaps.
- rescope (`EtaleDualityAndPerverseSheaves`, `AdicCoefficientsAndComparisons`, `ClassicalAdicEtaleCohomology`): Confirmed finding RT-AREA-etale/17: EDC.6 uses ECD 27.1–27.4, owned by AdicCoefficientsAndComparisons:L3, which is not among EDC.6's ancestors. Proposal: Add AdicCoefficientsAndComparisons:L3 → EtaleDualityAndPerverseSheaves:EDC.6, the missing edge in RT-AREA-etale/17. L4 is already an ancestor via L6/L5 and H5 via L2, so do not report those two transitive dependencies as missing edges. Keep the precise node prerequisites and requests.

## Findings handed to this job

- REV-EtaleDualityAndPerverseSheaves--EDC.4\~3: general semismall pushforward (EDC.5/semismall-pushforward-perverse) lacks a justified costalk estimate: Resolved by retirement. The draft is replaced by EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perversity of the accepted EDC.5 packet, which assumes that both i\_α^\*K and i\_α^\*D\_X K have locally constant cohomology on the source strata (the two conditions BBD 4.2.8 uses), deduces cosupport by duality for self-injective or rational coefficients, and asserts no integral version. The eighth gap and EDC.5's partial coverage go with the draft.
- REV-EtaleDualityAndPerverseSheaves--EDC.4\~3: questions for the orchestrator (routing after the three-round limit; Part II and coarse dependency proposals): Routing: the maintainer opened this fourth round. The stack and perfect-scheme Part II proposals are carried by the accepted EDC.7 packet's restructure entries and the EDC.0 packet; the L3 → EDC.6 and GS1 edge proposals stay here as restructure entries.
- RT-AREA-etale/3 (stacks): Owned by the 'Étale duality, cycle classes and perverse sheaves, Part II: Artin and Deligne–Mumford stacks' proposal, recorded with replacement ids in the accepted EDC.7 packet's restructure and in the EDC.0 packet. EDC.4's statements are scheme statements and no stack consumer cites them.
- RT-AREA-etale/16 (perfect schemes, equivariance, hyperbolic localization): Owned by the perfect-scheme Part II proposal recorded in the accepted EDC.7 packet. For EDC.4 no Zhu item names a weak-Lefschetz, projective-bundle or blow-up target; the perfect-model extensions of the shared theory go to that Part II.
- RT-AREA-etale/17 (missing L3 → EDC.6 edge): Kept as a restructure entry here; the accepted EDC.6 packet records the same link.
- RT-AREA-geomlanglands/18 (EDC.4 → GS1 edge carries nothing): Kept as a restructure entry with the EDC.5 and EDC.7 replacement ids: drop EDC.4 → GS1; GS0/GS1's perverse requests go to the accepted EDC.5 packet.

## Maintainer-added sources

- Deligne, Weil II, (4.1.6) (PAPER-DELIGNE-80/s4-4.1.6-torsion-free-cokernel): `EDC.4/weak-lefschetz-integral`, `EDC.4/weak-lefschetz` (planned).
- Liu–Tian–Xiao–Zhang–Zhu, Lemma 5.11.3(3),(4) (PAPER-LIU-ETAL-22/G52): `EDC.4/pullback-injective-blowup-bundle`, `EDC.4/projective-bundle-decomposition`, `EDC.4/blowup-formula` (planned).
- Zhu, Annals 185 (2017), items routed to EDC.4 (PAPER-ZHU-17): no node (no EDC.4 target). Zhu's appendix uses the projective-bundle and blow-up formulas only on finite-type models, where the nodes here apply; the perfect-model transport is the perfect-scheme Part II.

## Source issues recorded in this packet

These were found while planning EDC.5 and EDC.7; the accepted EDC.5 packet cites E11–E13 from here. Each is described in the packet in full.

- `EtaleDualityAndPerverseSheaves/E11` (misprint, Faisceaux pervers, 2.2.12 (ii)\*, p. 71 (Numdam scan of Astérisque 100, 1982; checked on the page image)): K ∈ D^{≤p} iff H^i i\_x^\*K = 0 for i > p(2 dim x); K ∈ D^{≥p} iff H^i i\_x^!K = 0 for i &lt; p(2 dim x). Both inequalities are reversed in print.
- `EtaleDualityAndPerverseSheaves/E12` (misprint, Faisceaux pervers, Théorème 4.3.1 (ii), p. 112 (Numdam scan)): L is an irreducible lisse ℚ̄\_ℓ-sheaf: §4 works in D^b\_c(X, ℚ̄\_ℓ) (4.0).
- `EtaleDualityAndPerverseSheaves/E13` (misprint, Affine Grassmannians and the geometric Satake in mixed characteristic, Appendix A.3.1, printed p.55 (arXiv 1407.8519v3); published p.478): IC\_X|\_U ≅ ℚ̄\_ℓ\[dim X] (unnormalized; a half-twist normalization is a separate choice).
- `EtaleDualityAndPerverseSheaves/E14` (error, Affine Grassmannians and the geometric Satake in mixed characteristic, A.3.3, published pp.479–480; arXiv v3 p.55): Use geometric irreducibility for a scalar top trace; in general retain the vector space indexed by top-dimensional geometric components.
- `EtaleDualityAndPerverseSheaves/E15` (error, Affine Grassmannians and the geometric Satake in mixed characteristic, A.3.3, published p.480 first paragraph; arXiv v3 pp.55–56): Retain a chosen finite-type model and its ordinary trace, or track the powers of p by which model comparisons rescale that trace. An intrinsic automorphism-invariant scalar normalization on the perfection is unavailable.

## Coverage

- `EtaleDualityAndPerverseSheaves:EDC.4`: **planned**. Geometric inputs requested from SchemeAndStackFoundations: the exceptional divisor of a smooth blow-up (SF.0), affine complements of ample sections and Veronese re-embeddings (SF.0), complete-intersection chains (SF.0), and the ample-line bridge (SF.3). EtaleCohomologyFoundations §F.7 (TauCetiRoadmap pull request #938) states the projective-bundle formula, the blow-up decomposition and weak Lefschetz for smooth ample hyperplane sections; the nodes here import them and plan only the residues listed in the summary.

## Sources

- [Faisceaux pervers](https://www.numdam.org/item/AST_1982__100__1_0.pdf), A. A. Beilinson, J. Bernstein, P. Deligne; Astérisque 100 (1982), pp. 5–171; Numdam scan with OCR text layer (printed page = PDF page − 1), read 2026-10-06; excerpts checked against page images. Read: 1.3.6–1.3.17, pp.29–38; 1.4.3–1.4.26, pp.43–55; 2.1.3–2.1.23, pp.57–65; 2.2.10–2.2.18, pp.69–73; 3.3.4 and 4.0–4.3.1, pp.98–113; 5.1.14–5.1.15, pp.128–129; 5.3.1–5.4.10, pp.134–144; 6.1.2–6.1.10, pp.149–159; 6.2.4–6.2.10, pp.162–165; 3.2.2–3.2.4, pp.86–87; 3.2.17–3.2.18, pp.95–96; 5.1.2.3–5.1.2.5, pp.123–124; 5.4.11–5.4.15, pp.145–147; 1.4.16–1.4.19, pp.51–53; 2.2.14, p.71; 3.2.2–3.2.5, pp.86–87; 3.2.17–3.2.18 and proof completion, pp.95–97; 5.1.2.3–5.1.2.5, pp.123–124; 5.4.10–5.4.15, pp.144–147 (revision-three rereading).
- [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Pierre Deligne; Publ. Math. IHÉS 52 (1980), 137–252; Numdam scan with OCR, read 2026-10-06. Read: 4.1.1–4.1.6, pp.217–219; 4.2.2, p.219; 4.3.1–4.3.3, pp.222–223.
- [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf), Pierre Deligne; Publ. Math. IHÉS 43 (1974), 273–307; Numdam scan with OCR, read 2026-10-06. Read: 2.3–2.6, pp.281–282; 5.1–5.8, pp.289–292; 7.1–7.3, pp.298–301.
- [Lectures on Étale Cohomology](https://www.jmilne.org/math/CourseNotes/LEC.pdf), J. S. Milne; Version 2.21 (22 March 2013), read 2026-10-06; the text layer mangles symbols. Read: 16.4 and complete-intersection discussion, pp.109–110; 23.2, pp.139–140; 27.12–27.13, pp.158–159; 33.2 and proof, pp.193–194.
- [SGA 4, Exposé XIV: Théorème de finitude pour un morphisme propre; dimension cohomologique des schémas algébriques affines](https://www.normalesup.org/~forgogozo/SGA4/14/14.pdf), M. Artin; Retyped edition of LNM 305 (version 71766d9, 2024), with LNM page numbers in the margin; read 2026-10-06. Read: 1.1, printed p.145; 3.1–3.4 and start of §4, printed pp.159–162 (margin pagination; Corollaire 3.2 is p.160); Théorème 3.1 and Corollaire 3.2, printed pp.159–160 (revision-three verification).
- [The Stacks Project, Chapter 29: Morphisms of Schemes](https://stacks.math.columbia.edu/download/morphisms.pdf), The Stacks Project Authors; Version ed88ff78 (compiled 14 July 2026), read 2026-10-06. Read: Tag 0EKE, Lemma 44.18, p.106 in the fetched PDF; Tag 01VH, p.83 in the fetched PDF.
- [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://arxiv.org/pdf/1912.11942v3), Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu; arXiv 1912.11942v3 (2021); published Invent. Math. 228 (2022); read 2026-10-06. Read: 5.11.3 and proof, pp.97–99.
- [Affine Grassmannians and the geometric Satake in mixed characteristic](https://arxiv.org/pdf/1407.8519v3), Xinwen Zhu; arXiv 1407.8519v3 (2016); published Ann. of Math. 185 (2017); read 2026-10-06. Read: 2.11 and proof, pp.25–27; A.3.1–A.3.3, pp.54–56, including visual check of the IC shift in A.3.1, p.55.
- [The pro-étale topology for schemes](https://arxiv.org/pdf/1309.1198v2), Bhargav Bhatt, Peter Scholze; arXiv 1309.1198v2 (2014); published Astérisque 369 (2015); read 2026-10-06. Read: 5.5.1–5.5.4, p.40; 6.5.1–6.5.6, p.49; 6.6.11, 6.7.1–6.7.2, 6.8.14–6.8.15, pp.55–62; 6.6.11, p.54; 6.7.1–6.7.21, pp.55–58; 6.8.1–6.8.2, p.58; 6.8.11–6.8.15, pp.61–62 (revision-three rereading).
- [Étale cohomology of diamonds](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf), Peter Scholze; Author manuscript dated 14 April 2026; read 2026-10-06. Read: 27.1–27.7 with proof, pp.163–168.
- [Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf), Xinwen Zhu; Annals of Mathematics 185 (2017), 403–492, version of record. Read: A.1.2, p.465 (perfect-field convention); A.3.1–A.3.3, pp.478–480.
- [Étale cohomology foundations (TauCetiRoadmap roadmap README, open pull request #938)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/c4ee54f4b3b32173235ff75fa9db736daecb66fe/TauCetiRoadmap/EtaleCohomologyFoundations/README.md), TauCetiRoadmap contributors; README.md at head c4ee54f4b3b32173235ff75fa9db736daecb66fe of TauCetiProject/TauCetiRoadmap#938, read 2026-10-17. Read: Scope and ownership; Conventions; Exact supplier contracts; §§0.5–0.11; §§F.1, F.2.1–F.2.7, F.3; §§F.4.1–F.4.6, F.10.2b; §§F.5–F.8.
- [Enhanced derived categories of sheaves (TauCetiRoadmap roadmap README, open pull request #908)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/b3ea60e3efc3bd4a0b541fb54469dcbf88772064/TauCetiRoadmap/EnhancedDerivedSheaves/README.md), TauCetiRoadmap contributors; README.md at head b3ea60e3efc3bd4a0b541fb54469dcbf88772064 of TauCetiProject/TauCetiRoadmap#908, read 2026-10-17. Read: Layer 0, §§0.1–0.4; Layer E4 headings, §E4.5.
- [Classical analytic étale cohomology (TauCetiRoadmap roadmap README, open pull request #875)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/e36805f4bbf96f644034fbc220ab0607a15ace83/TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md), TauCetiRoadmap contributors; README.md at head e36805f4bbf96f644034fbc220ab0607a15ace83 of TauCetiProject/TauCetiRoadmap#875, read 2026-10-17. Read: Scope and ownership; §8.2; §11.1.
- [Scheme and stack foundations (TauCetiRoadmap roadmap README on main)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/d2081398eedfbd4153d3067aa98a21b5a5270957/TauCetiRoadmap/SchemeAndStackFoundations/README.md), TauCetiRoadmap contributors; README.md as last changed at d2081398eedfbd4153d3067aa98a21b5a5270957 on TauCetiProject/TauCetiRoadmap main (current at main 350e970 on 2026-10-17). Read: §4.11; §4.13; §§5.4–5.5.
