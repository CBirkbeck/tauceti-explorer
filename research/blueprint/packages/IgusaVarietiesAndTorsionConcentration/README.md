# Roadmap: Igusa varieties, compactified period fibres and torsion concentration

**Summary.** This roadmap builds the geometry and cohomology of Igusa varieties that Caraiani and Scholze use to control torsion in the cohomology of unitary Shimura varieties, and assembles their vanishing theorem together with Koshikawa's local refinement. Layer IG.0 fixes the quasi-split unitary similitude datum, its three spherical Hecke algebras and the passage between their localizations, the set B(G) of isocrystals with G-structure, central leaves, internal Hom p-divisible groups, liftable automorphisms and the deformation spaces governing a Newton stratum. Layer IG.1 constructs the perfect Igusa variety, Mantovan's finite-level tower and the Harris–Taylor Igusa varieties of the first kind, with their group actions and cohomology. Layer IG.2 compactifies: well-positioned subsets, partial toroidal and minimal compactifications of leaves and Igusa varieties, their boundary charts and cusp labels, and the affineness of the partial minimal compactification. Layer IG.3 identifies the fibres of the Hodge–Tate period map with canonical compactifications of perfect Igusa varieties and proves the product formula and Mantovan's filtration. Layer IG.4 turns this into two degree bounds: semiperversity of nearby cycles gives a lower bound on the minimal stratum, and Artin vanishing on the affine partial minimal compactification gives an upper bound. Layer IG.5 uses the Igusa trace formula, Hecke-equivariant duality and local Langlands to show that a generic system of eigenvalues concentrated in one degree forces the ordinary stratum. Layer IG.6 proves Pink's formula for Igusa varieties and the boundary length obstruction. Layer IG.7 assembles the end theorems: cohomology localized at a generic maximal ideal lives in degrees at least the middle degree, compactly supported cohomology in degrees at most it, with the integral, local-system, irreducible and middle-degree consequences used in potential automorphy, and Koshikawa's version that needs neither F⁺ ≠ ℚ nor a bound on the residual length.

| Layer | Title | Headline targets |
| --- | --- | --- |
| IG.0 | Unitary data, Hecke algebras, p-divisible groups and central leaves | `KottwitzSet`, `KottwitzSet.admissible`, `UnitarySimilitudeDatum`, `heckeOperatorSubring`, `heckeRestrict`, `localization_operator_eq_sum`, `newtonStratum`, `InternalHom.pdiv`, `IsCompletelySlopeDivisible`, `AutUniversalCover`, `centralLeaf`, `RZSpace` |
| IG.1 | Igusa towers, actions and cohomology | `Igusa`, `MantovanIgusa`, `perfectionOfMantovan`, `IgusaTower.action`, `IgusaCohomology.compactSupport`, `AltIgusaCohomology`, `IgusaFirstKind` |
| IG.2 | Partial compactifications and cusp geometry | `IsWellPositioned`, `partialMinimal`, `ToroidalIgusa`, `PerfectToroidalIgusa`, `ekedahlOortStratum`, `PerfectMinimalIgusa`, `MinimalIgusa`, `IgusaCuspLabel` |
| IG.3 | Hodge–Tate period fibres and the product formula | `flagNewtonStratum`, `goodReductionLocus`, `localHodgeTate`, `canonicalLift`, `XbInfinite`, the product formula, `igusaToShimura`, the compactified fibre theorem, Mantovan's filtration |
| IG.4 | Nearby cycles, semiperversity and degree bounds | `FormalNeighbourhood`, semiperversity, `partialSupportCohomology`, the Artin vanishing upper bound, the minimal-stratum lower bound |
| IG.5 | Dual Hecke systems and ordinary genericity | `heckeInvolution`, `dualIdeal`, Hecke-equivariant Poincaré duality, genericity forces ordinarity |
| IG.6 | Boundary cohomology and Pink's formula | `boundaryStratum`, `boundaryComparison`, Pink's formula, the boundary length obstruction |
| IG.7 | Generic vanishing and its arithmetic forms | `IsCSGeneric`, `IsCohomologicallyGeneric`, Caraiani–Scholze vanishing, the ACC+ and Caraiani–Newton middle-degree exports, Koshikawa's local and global vanishing |

## Scope and ownership

**Owned here.** The quasi-split unitary similitude datum of Caraiani–Scholze with its locally symmetric spaces; its full, operator and unitary spherical Hecke algebras, the restriction map between the last two, the inversion, and the comparison of localizations along the inclusion of the operator algebra into the full algebra. The set B(G) of isocrystals with G-structure, the Newton and Kottwitz maps, the partial order and the admissible sets B(G, μ), in the form the Igusa arguments use them; the Newton stratification of the special fibre of a PEL Shimura variety and of the flag variety. Internal Hom p-divisible groups, complete slope divisibility, universal-cover automorphisms, liftable automorphisms, central leaves and their dimension, the quasi-isogeny torsor, PEL Rapoport–Zink spaces at finite and infinite level and the Harris–Taylor Drinfeld-level strata. Perfect, Mantovan and first-kind Igusa varieties, their actions and cohomology; well-positioned subsets and partial compactifications of leaves and Igusa varieties; Ekedahl–Oort affineness and its transfer; Igusa cusp labels and boundary strata. The Hodge–Tate period fibre theorems, the product formula and Mantovan's filtration; semiperversity, the two degree bounds, partially compactly supported cohomology, dual Hecke ideals, the ordinary genericity theorem, Pink's formula for Igusa varieties, the boundary length obstruction, and the end theorems of Caraiani–Scholze and Koshikawa with their middle-degree exports. Two local representation-theoretic inputs to Koshikawa's argument also belong to this roadmap: Mínguez–Sécherre's supercuspidal supports and lifting of mod-ℓ supercuspidal representations of inner forms of GL_m, and the passage from mod-ℓ to integral localized vanishing, which remains open and is not used by the end theorems (Layer IG.7).

**Left to other roadmaps.** Restricted products, adelic points and the Hasse principle come from TauCetiRoadmap AdelicAlgebraicGroups (Layers 1 and 4). Smooth representations, Hecke algebras over rings, their anti-involution, the derived smooth category, unnormalized induction and the Satake isomorphism come from TauCetiRoadmap SmoothRepresentationsOfLocalGroups (Layers SR.0, SR.0d, SR.1, SR.2, SR.4). Determinants, Cayley–Hamilton reconstruction, Hecke-polynomial conventions and interpolation come from TauCetiRoadmap IntegralHeckeAndGaloisDeterminants (Layers 0, 1, 3a, 4). The global Artin map and its geometric normalization come from TauCetiRoadmap ClassFieldTheory (Layer 11) and local Tate duality from its Layer 5. Among the atlas roadmaps: PELModuli supplies integral PEL data, moduli and compactifications; FiniteFlatGroupsAndIntegralPadicHodgeTheory supplies p-divisible groups, universal covers, Dieudonné theory and the Dieudonné–Manin classification; AbelianSchemesAndArithmeticModuli the classical Serre–Tate theorem; ShimuraCompactifications the toroidal and minimal compactifications and their boundary charts; NeronModelsAndSemistableAbelianVarieties Raynaud extensions; SchemeAndStackFoundations formal schemes and étale Cartan–Leray descent; AdicSpacesPartII, AdicEtaleGeometry, PerfectoidSpaces and DiamondsAndVStacks the analytic geometry; ClassicalAdicEtaleCohomology, DiamondEtaleCohomology and DiamondSixOperations the étale cohomology of adic spaces and diamonds; EtaleDualityAndPerverseSheaves the finite-type perverse formalism and duality; LefschetzPencilsAndVanishingCycles nearby cycles; AdicCoefficientsAndComparisons the ℓ-adic tower comparisons; PadicHodgeTheory the primitive comparison theorem; PerfectoidShimuraVarieties the perfectoid Shimura varieties and the Hodge–Tate period map; HodgeTateAndCanonicalSubgroups the Hasse invariant, Scholze–Weinstein's classification over O_C and the comparison of global and local Hodge–Tate filtrations; ArithmeticLocallySymmetricSpaces Borel–Serre boundaries, finite-level duality and the unnormalized Satake transform; ArithmeticGaloisDuality local and global duality; EndoscopicTransferAndUnitaryTraceComparison the stable and twisted trace formulas, base change and local Langlands for inner forms of GL_m; AutomorphicGaloisRepresentationsPartII Galois representations of automorphic representations and the decomposed-genericity predicate; TorsionCohomologyInfrastructure Scholze's torsion Galois determinants and boundary induction for GL_n.

The Fargues–Scholze geometry enters only through Koshikawa's argument, the flag Newton stratification and Mantovan's filtration: the classification of G-bundles on the Fargues–Fontaine curve (VectorBundlesAndIsocrystals VB2), the strata of Bun_G and their dualizing objects (BunGAndNewtonStrata BG2–BG3), the coefficient categories of those strata (VStackSheavesAndLisseCategories VS4), local Shimura varieties for products of GL_n (HeckeStacksAndLocalShtukas HS2) and the spectral action with its Fargues–Scholze parameters (ExcursionOperatorsAndSpectralAction ES3–ES7). Each is used exactly as stated in the supplier contracts below and is not planned again here.

General boundary constructions, Cartan–Leray descent and the general theory of perverse sheaves belong to their own roadmaps; only their Igusa-specific applications are developed here. The mathematical specification in this README is definitive; [Suggested.lean](Suggested.lean) records the definitions and statements that can already be written against the pinned Mathlib and Tau Ceti, and is not exhaustive.

## Conventions

The global datum is the quasi-split unitary similitude group attached to a CM field F, its maximal real subfield F⁺, and a split skew-hermitian space of dimension 2n. The rational similitude factor is common to all embeddings. The local geometric results have the broader unramified PEL generality of types (A) and (C); they do not include type (D). The Harris–Taylor Drinfeld-level constructions use their own signature (1, n−1) datum and are never obtained by silently changing the signature of the balanced global datum.

Write p for the geometric prime, ℓ ≠ p for the coefficient prime, k for an algebraically closed field of characteristic p, and C for a complete algebraically closed extension of ℚ_p with valuation ring O_C. For the balanced unitary datum,

$$d=[F^+:\mathbb Q]n^2,\qquad d_b=\langle2\rho,\nu_b\rangle.$$

Here d is the complex dimension of the Shimura variety and d_b is the dimension of the central leaf and of the finite-level Igusa varieties of b. Use the covariant Dieudonné convention of Caraiani–Scholze for slopes: they lie in [−1, 0]. A Shimura Hodge cocharacter μ gives Newton classes in B(G, μ⁻¹). The ordinary class is maximal for the Newton order and its flag stratum has dimension zero. A cyclotomic completed base K_∞ is chosen once, before infinite-level local period fibres or the product formula are formed.

At finite level the Igusa maps are finite étale. The perfect Igusa variety trivializes the whole p-divisible group; Mantovan's tower trivializes liftable truncations of its slope-graded pieces. Mantovan's right action corresponds to the left quasi-isogeny action through inversion. Our left action is (j, h)·(ρ, η) = (jρ, ηh⁻¹). Scalar pairs act trivially, so the action is not asserted to be faithful. Cohomology with ℤ_ℓ coefficients takes the derived limit over the coefficients before the colimit over geometric levels. Smooth duals, derived coinvariants and the orientation character κ are kept in every equivariant formula.

The notation C^{X,tor}, C^{X,*}, Ig^{X,tor} and Ig^{X,*} refers to **partial** compactifications inside the ambient compactifications. A partial compactification need not be proper. Finite-level minimal Igusa maps are finite, whereas their inverse limit is integral. At a semi-abelian boundary the torsion A[p^∞] need not be p-divisible: one uses its connected part and the polarized biconnected quotient. The functor RΓ_{c−∂} means RΓ(Ig^{b,*}, j_!−), not compact support on Ig^b.

Arithmetic and geometric Frobenius conventions are never mixed. In the Hecke–Galois dictionary Art_F sends a uniformizer to a geometric Frobenius, and |Art_F⁻¹| takes that Frobenius to q_v⁻¹. The dual residual system is ρ̄^∨ ⊗ |Art_F⁻¹|^{1−2n}. Weak genericity excludes α_i = q_vα_j for i ≠ j and allows repeated eigenvalues; strong decomposed genericity also requires distinct eigenvalues. Residual length at most two is used only on the global trace-and-boundary route.

**Hecke algebras.** Fix an imaginary quadratic subfield F₀ ⊂ F and a finite set S of rational primes, and let the index set be the primes q ∉ S that split in F₀. Three rings appear, and Caraiani–Scholze use the symbol 𝕋^S for two of them.

- The *full similitude algebra* 𝕋^S_full is the restricted tensor product of the spherical algebras ℤ[G(ℚ_q)//G(ℤ_q)]. It is the ring of CSnc §5.1 (p. 64) and §6, used for the trace formula and the boundary.
- The *operator algebra* 𝕋^S ⊂ 𝕋^S_full is the subring generated by the operators T_{i,v} (1 ≤ i ≤ 2n, v a prime of F over an index q), whose similitude component is ℤ_q^×. It is the ring of CSnc §2.1 (pp. 11–12) and §2.8.
- The *unitary algebra* 𝕋^{0,S} is the restricted tensor product of the ℤ[G⁰(ℚ_q)//G⁰(ℤ_q)]. It is the ring of the main theorem (CSnc §1, p. 4).

Restriction of functions to G⁰ is a ring isomorphism 𝕋^S → 𝕋^{0,S} sending T_{i,v} to T⁰_{i,v}; on the full algebra it is not multiplicative (Layer IG.0). Every statement below names its algebra, and passes between them only through the restriction isomorphism and the localization comparison of IG.0.

The standing settings used in the hypotheses are these.

- **Smooth toroidal setting.** The standing hypotheses of CSnc §§3–4: p unramified in F, N ≥ 3 prime to p, K = K(N), and Σ a compatible family of smooth projective cone decompositions with trivial stabilizers (CSnc Remark 2.5.6); S = S_K and S_k = S ×_ℤ k for k algebraically closed of characteristic p.
- **Valued-field fibre setting.** p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C a complete algebraically closed nonarchimedean extension of ℚ_p with ring of integers O_C, residue field k and a fixed section k → O_C/p.
- **Nearby-cycle setting.** p unramified in F, N ≥ 3 prime to p, Σ as in CSnc Remark 2.5.6; C complete algebraically closed over ℚ_p with residue field k; ℓ ≠ p; d = [F⁺:ℚ]n².
- **Trace-comparison setting.** The standing assumptions of CSnc §5: p unramified in F; F contains an imaginary quadratic F₀ in which p splits; F⁺ ≠ ℚ; a character ϖ : 𝔸^×_{F₀}/F₀^× → ℂ^× extending the quadratic character of F₀/ℚ; S ⊇ {∞} ∪ {primes dividing pℓΔ_F} ∪ {primes where ϖ ramifies}; level N ≥ 3 divisible only by primes in S^p_f = S_fin ∖ {p} and by the integer N₀ of CSnc Remark 5.4.5; ι_ℓ : ℚ̄_ℓ ≅ ℂ fixed. Hecke statements in this setting are about 𝕋^S_full.
- **Boundary tower setting.** p unramified in F; X a p-divisible group with G-structure over k with class b; N ≥ 3 prime to p; ℓ ≠ p; Ig^b_∞ = lim_N Ig^b_{K(N)}, and similarly Ig^{b,*}_∞ and Ig^{b,tor}_∞; compactly supported cohomology of schemes with integral maps to schemes of finite type in Hamacher's sense (the colimit over an approximating tower with finite transitions).
- **Global residual-system setting.** F = F⁺F₀ CM with F₀ imaginary quadratic and F⁺ ≠ ℚ; G⁰ the quasi-split unitary group of IG.0 with d = [F⁺:ℚ]n²; ℓ a prime; S a finite set of places containing ∞, ℓ, the primes ramified in F and those where K is not hyperspecial; 𝔪⁰ ⊂ 𝕋^{0,S} a maximal ideal in the support of H^*(X⁰_K, 𝔽_ℓ), with 𝔪 = res⁻¹(𝔪⁰) ⊂ 𝕋^S the corresponding ideal of the operator algebra and ρ̄_𝔪 = ρ̄_{𝔪⁰} : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ) its Galois representation.

## Exact supplier contracts

Each contract states what a target below takes from a neighbouring roadmap, in the generality the target needs. A theorem that uses a contract takes its full stated generality, coefficient system and equivariance; a weaker nearby statement is not a substitute. In particular, rational nearby-cycle exactness over a trait does not replace torsion exactness over O_C, a dimension formula does not replace an equivariant dualizing object, and a characteristic-zero parameter comparison does not replace the mod-ℓ spectral action.

### From Mathlib (pinned)

`AlgebraicGeometry.Scheme`, `Scheme.Hom`, `IsAffine`, `IsFinite`, `IsProper`, `ValuationRing`, `PerfectRing`, `WittVector`, the derived categories `DerivedCategory` and localizations. `PerfectRing R p` does not by itself assert characteristic p; add `CharP R p`. The small étale and pro-étale topologies are `Scheme.smallEtaleTopology` and `Scheme.proetaleTopology`; scheme normalization is `Scheme.Hom.normalization`. The valuative criterion `IsProper.of_valuativeCriterion` needs quasi-compactness, quasi-separatedness and local finite type; neither properness nor finiteness follows from an unrestricted pointwise lifting assertion. For number fields use `NumberField.IsCMField` and `NumberField.maximalRealSubfield`. `Matrix.unitaryGroup` preserves the identity form and is not the split skew-hermitian group used here. Restricted products are `RestrictedProduct` with `RestrictedProduct.coeMonoidHom`; double cosets, `HeckeCoset` and `HeckeRing` are Mathlib's.

### From Tau Ceti (pinned)

The convolution ring structure `HeckeCosetModule.instRingHeckeRing` (`TauCeti/NumberTheory/HeckeRing/Associativity.lean`) on `HeckeRing Δ H R` for a Hecke triple, and the anti-involution formalism `HeckeAntiInvolution`, `HeckeAntiInvolution.ofAmbient`, `HeckeAntiInvolution.onHeckeCoset` and `mul_comm_of_antiInvolution` (`TauCeti/NumberTheory/HeckeRing/Commutativity.lean`). `TauCeti.ReductiveAffineGroupSchemeCat` is the category of reductive groups over a field; it supplies the reductive generic fibre, not an integral model over ℤ. Local spherical commutativity is a theorem about the chosen datum, not part of the ring structure.

### From TauCetiRoadmap roadmaps

- **AdelicAlgebraicGroups.** Layer 1 (adelic points as restricted products, with their integral subgroups) for the spherical datum of IG.0, and Layer 4 for the Hasse principle used in IG.0 (Hasse principle for G).
- **SmoothRepresentationsOfLocalGroups.** SR.0 (smooth representations; exact invariants of compact open subgroups whose pro-order is invertible in the coefficients, with that hypothesis explicit). SR.0d (the derived smooth category, derived invariants, derived tensor products, and derived smooth duality with biduality for admissible complexes, SR.0d.2). SR.1 (Hecke algebras over rings: the double-coset ring, the anti-involution [UgU] ↦ [Ug⁻¹U] of SR.1.2, and the equivalence of SR.1.3 between smooth representations and nondegenerate modules over the convolution algebra for a fixed Haar measure). SR.2 (unnormalized smooth and compact induction, inflation from a Levi, Frobenius reciprocity, for locally profinite groups such as J_b(ℚ_p) × G(𝔸_f^p)). SR.4 (the spherical Hecke algebra of GL_n and of unramified unitary groups, its commutativity and the Satake isomorphism).
- **IntegralHeckeAndGaloisDeterminants.** Layer 0 (determinants as multiplicative polynomial laws), Layer 1 (Cayley–Hamilton algebras and reconstruction of semisimple representations from determinants), Layer 3a (the GL_n Hecke polynomial and its geometric-Frobenius convention) and Layer 4 (interpolation of determinants over integral coefficient rings), for the torsion Galois arguments of IG.5 and IG.6.
- **ClassFieldTheory.** Layer 11: the global Artin map of F and its geometric normalization (the composite with inversion, sending uniformizers to geometric Frobenius), used for the twist |Art_F⁻¹|^{1−2n} of the dual Hecke ideal. Layer 5: for a finite extension L/ℚ_p and finite l-primary continuous G_L-modules M with l ≠ p, finiteness of H^0, H^1, H^2, the local Euler characteristic formula and local Tate duality, giving dim H¹(G_L, M) = dim H⁰(G_L, M) + dim H²(G_L, M); in particular H¹(G_L, χ_λ) = 0 for the unramified mod-l character with arithmetic Frobenius eigenvalue λ ∉ {1, q_L}, compatibly with finite coefficient extension. This is the obstruction-vanishing input to IG.5 (splitting generic local lifts).

### From the atlas roadmaps

- **PELModuli M0–M3.** Integral PEL data and their local unramified scalar extensions (finite étale ℤ_p-orders, decomposition of B into matrix algebras over unramified fields, maximal orders, and the equivalence between a B-linear isotropic weight-(0, 1) projector P and the cocharacter μ(t) = (1 − P) + tP with c ∘ μ = id; CS17 §4.2, pp. 696–697), the moduli problem, the smooth integral model with hyperspecial level, and complex uniformization.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2, R07.6.** p-divisible groups, quotients by sub-p-divisible groups with exactness, base change and height additivity; the universal cover X̃ = lim_{×p} X over a ring on which p is nilpotent, its invariance under isogeny, its rigidity under nilpotent thickenings and its representability over perfect bases (CS17 Proposition 4.1.2), and quasi-isogenies as isomorphisms of universal covers; Dieudonné theory, the Dieudonné–Manin classification of isocrystals over 𝔽̄_p, and the adapter from positive Dieudonné slopes to the covariant [−1, 0] normalization used here; Scholze–Weinstein's Theorem A (on an f-semiperfect ring such as O_C/p, the Dieudonné functor on p-divisible groups up to isogeny is fully faithful into φ-modules over B⁺_cris); existence, in the PEL classes used here, of representatives with integral O_B-action, determinant condition, principal polarization and complete slope divisibility, keeping rational quasi-polarizations separate from integral principal polarizations; Illusie deformation theory.
- **AbelianSchemesAndArithmeticModuli A4.** The classical Serre–Tate theorem: for a nilpotent thickening S → S′ on which p is nilpotent, abelian schemes over S′ with endomorphisms and polarization correspond to triples (A_S, 𝒢_{S′}, A_S[p^∞] ≅ 𝒢 ×_{S′} S); IG.0 extends it to semi-abelian schemes and non-noetherian bases.
- **SchemeAndStackFoundations SF.2, SF.4.** SF.4: formal schemes over Spf W(k) and Spf O_C, completions along closed subschemes, and invariance of the étale site of a henselian p-adically complete ring, including W(R) for R perfect and its completed O_C base changes, with compatible special-fibre, generic-fibre and equivariant comparisons. SF.2: for finite and profinite étale towers of Shimura and Igusa varieties, the Hecke-equivariant geometric Cartan–Leray isomorphism RΓ(X, Λ) ≅ RΓ_cont(Q, RΓ(X_∞, Λ)) and its relative sheaf version, compatible with nearby cycles, uniform costalk lower bounds, localization, finite-level descent, the p-level and auxiliary ℓ-level transition maps and the restriction to toroidal boundary charts. Derived invariants are left t-exact on bounded-below complexes; no exactness is claimed for an ℓ-power group on ℓ-torsion coefficients.
- **AdicSpacesPartII F0, R2; AdicEtaleGeometry A1; PerfectoidSpaces P0–P2, P7; DiamondsAndVStacks D5.** Analytic adic spaces, adic generic fibres of formal schemes over possibly nonnoetherian valuation bases, perfectoid spaces and tilting, preperfectoid spaces and strong completions, diamonds; and the criterion that a map of qcqs diamonds which is bijective on (C, C⁺)-points for every complete algebraically closed C and every allowed C⁺ is an isomorphism (Scholze, Étale cohomology of diamonds, Lemma 11.11).
- **ClassicalAdicEtaleCohomology H0, H1; DiamondEtaleCohomology C0, C4, C8; DiamondSixOperations S1–S4.** Étale cohomology of adic spaces, the formal–adic comparison, overconvergence, canonical compactifications of separated diamonds with their universal property, Krull dimension of locally spatial diamonds; for a torsor under a locally pro-p group J with prime-to-p torsion coefficients and a fixed Haar measure, compact pushforward along the quotient identified with derived J-coinvariants over C_c(J), with base change, the projection formula and the opposite-action convention of Koshikawa Lemmas 7.3 and 7.5 (S2); for the closed ordinary immersion i and its open complement j, the adjunction i_* ⊣ Ri^! and the fibre sequence i_*Ri^! → id → Rj_*j^*, the analogous localization for locally closed Newton strata and the costalk-to-stalk map (S3); and the exchange q^*Ri^! ≅ Ri′^! q_K^* for an eligible locally closed stratum immersion and a separated, representable, ℓ-cohomologically smooth q_K, compatible with the support sequences and equivariant compact pushforward of Koshikawa §9 (S4).
- **EtaleDualityAndPerverseSheaves EDC.0, EDC.2, EDC.4, EDC.5.** Étale cohomology and compact support of schemes, Poincaré duality pairings, Artin vanishing for affine schemes, and the perverse t-structure on schemes of finite type over k. For torsion Λ of characteristic ℓ ≠ p on the finite-type k-targets obtained from finitely presented O_C/p models: the costalk lower-bound criterion H^i(i_x^!K) = 0 for i < a − dim closure{x}, extended to uniformly bounded finite-level nearby-cycle complexes and their two-level filtered colimits; preservation under integral pushforward with the source dimension function pulled back from the base; the stalk upper criterion and two-sided comparison from finite-type approximants for the compact case. No constructibility and no perverse t-structure on arbitrary schemes is posited.
- **LefschetzPencilsAndVanishingCycles LPV.0, LPV.6.** Nearby cycles over O_C through finite-type models over complete discretely valued subrings; left t-exactness for the perverse t-structure with 𝔽_ℓ coefficients (Illusie, Autour du théorème de monodromie locale, Corollary 4.5), and full t-exactness at finite level in the compact case; naturality under the auxiliary level changes and toroidal boundary comparisons used here; for the ordinary support sets of Koshikawa Corollary 8.2, compatibility of nearby cycles with closed-support cohomology under refinement of formal models, identifying generic-fibre ordinary support with the derived inverse limit of special-fibre support complexes (distinct from the filtered-colimit continuity of étale cohomology).
- **AdicCoefficientsAndComparisons L5.** The comparison of étale cohomology along the ℓ-power tame tower used for boundary killing.
- **PadicHodgeTheory P8.** Scholze's primitive comparison theorem and its relative form: for the proper toroidal-to-minimal Stein factorization maps of rigid spaces over C at finite level, O⁺ᵃ/p^n → π_*O⁺ᵃ/p^n is an almost isomorphism when ℤ/p^n → π_*ℤ/p^n is an isomorphism.
- **PerfectoidShimuraVarieties S0–S4, S6.** Perfectoid Shimura varieties at infinite level at p and their minimal and toroidal compactifications, the Hodge–Tate period map π_HT and its boundary behaviour, and the flag variety Fℓ.
- **HodgeTateAndCanonicalSubgroups T0–T2.** The Hasse invariant Ha = det(V : ω^{(p)} → ω) of a BT₁ over an 𝔽_p-scheme as a section of ω^{⊗(p−1)}; the agreement of the Hodge–Tate filtration of H¹_ét(A_C, ℤ_p) ⊗ C with that of A[p^∞] for an abelian variety over O_C (CS17 Remark 4.2.8); Scholze–Weinstein's Theorem B (p-divisible groups over O_C correspond to pairs (T, W) with T finite free over ℤ_p and W ⊂ T ⊗ C(−1)), to which IG.3 adds the O_F-action and polarization.
- **ShimuraCompactifications C0–C5; NeronModelsAndSemistableAbelianVarieties R11.3.** Cusp labels, toroidal and minimal compactifications of S_K with their stratifications and formal boundary charts Ξ_{Z,Σ_Z}, the splitting of Z_N, and Raynaud extensions of degenerating abelian varieties.
- **ArithmeticLocallySymmetricSpaces ALS.0–ALS.2, ALS.4–ALS.6.** Locally symmetric spaces of GL_r(F) and unitary groups, the Borel–Serre compactification and its boundary strata, finite-level Poincaré duality, the unnormalized Satake transform r_M ∘ r_P, and the boundary exact sequences with integral coefficients and local systems.
- **ArithmeticGaloisDuality R02.2, D7.** Global duality and the derived local duality used with integral coefficients.
- **EndoscopicTransferAndUnitaryTraceComparison ET.4–ET.7b.** For 𝒢_n⃗ = (Res_{F₀/ℚ}𝔾_m × Res_{F/ℚ}GL_n⃗) ⋊ {1, θ}: the stabilized twisted trace formula with no proper cuspidal subsets when [F⁺:ℚ] ≥ 2, base-change transfers and the level N₀ (ET.4; CSnc §§5.2–5.5); Shin's stable trace formula for Igusa varieties with no ker¹ factor (ET.5; Shin 2010 Theorem 7.2, CSnc Theorem 5.3.2); local Langlands for GL_m and its inner forms with full Weil–Deligne parameters (Badulescu's Jacquet–Langlands), the semisimple parameters of CSnc Remark 5.1.1, and the nontransfer of generic principal series to nontrivial inner forms of Levi subgroups (ET.6; CS17 Lemma 5.4.3); the rational Igusa trace comparison with the corrected Red^b normalization (δ̄^{1/2}_{P(ν_b)} applied once) and Ξ(φ_n⃗)-cohomologicality (ET.7b; CSnc Theorem 5.6.1, Lemma 5.6.2).
- **AutomorphicGaloisRepresentationsPartII AG2.0–AG2.7.** Galois representations attached to regular algebraic cuspidal and isobaric automorphic representations of GL_m over CM fields, with local–global compatibility at unramified places, and the decomposed-genericity predicate of a residual representation (AG2.7) with infinitely many witness primes avoiding any finite set.
- **TorsionCohomologyInfrastructure TC.3, TC.4.** Scholze's torsion Galois determinants for GL_r over a CM field (Scholze 2015 Corollary 5.4.3; ACC+ Theorem 2.3.5), and boundary induction for GL_n and unitary Borel–Serre strata, showing that an absolutely irreducible residual representation does not occur in localized boundary cohomology.

### From the Fargues–Scholze roadmaps

- **VectorBundlesAndIsocrystals VB2.** Fargues' classification: G-bundles on the Fargues–Fontaine curve X_{C♭} correspond to B(G) (CS17 Theorem 3.2.9); G-Dieudonné modules over B⁺_cris(O_C/p) correspond to G-bundles on X_{C♭} and are determined up to isomorphism by their restriction to W(k)[1/p] (Fargues 2020, Théorèmes 5.1 and 5.6); p-divisible groups over O_C/p up to isogeny are classified by such bundles (CS17 Theorem 4.1.4). Used by IG.3 for the flag Newton stratification, period surjectivity and constancy modulo p^ε.
- **BunGAndNewtonStrata BG2–BG3.** The minuscule modification map q_K : [Fℓ/K_p] → Bun_G of Koshikawa Lemma 6.1 with ℓ-cohomological smoothness and smooth base change for the Newton-stratum maps, and the ordinary-stratum dualizing object κ⁻¹[−2d] of Koshikawa Lemma 9.1, with the character κ matching the one on the Igusa and local factors (Koshikawa Lemma 7.6). A dimension formula for the strata does not supply this orientation character.
- **VStackSheavesAndLisseCategories VS4.** The coefficient equivalence D_ét(Bun_G^b, 𝔽_ℓ) ≃ D_sm(J_b(ℚ_p), 𝔽_ℓ), with its compatibility with q_K^b-pullback and the bounded admissible V_b of Koshikawa §9; for the positive connected automorphism group J̃_b^0 and its torsors, the equivariant dualizing identification Rπ_unip^!𝔽_ℓ ≅ 𝔽_ℓ(d_b)[2d_b] and the trace equivalence Rπ_{unip,!}Rπ_unip^! ≅ id, keeping the J_b(ℚ_p)-equivariant orientation character κ and its comparison under the universal-cover/bundle dictionary (Koshikawa Lemmas 7.4 and 7.6).
- **HeckeStacksAndLocalShtukas HS2.** The minuscule local Shimura varieties M_{(G,b,μ),K} for products of GL_n over every finite F/ℚ_p, with reflex field, geometric base, hyperspecial levels and commuting actions, and an explicit dictionary between its μ versus μ⁻¹ and B(G, μ) conventions and the ones used here.
- **ExcursionOperatorsAndSpectralAction ES3–ES7.** The integral action over ℤ_ℓ[q^{1/2}] of the Fargues–Scholze spectral Bernstein centre on compactly supported local-shtuka cohomology, compatible with colimits, Hecke functors and coefficient reduction, with the map from the spectral centre to End(c-Ind_K^G Λ) = H_K^op followed by [KgK] ↦ [Kg⁻¹K] evaluating at 𝔪 to ρ̄_𝔪, including the shifted, half-twisted realization of FS IX.3.1 (ES3); for bounded admissible stratum complexes, spectral support read off from irreducible constituents, vanishing of all Ext between objects of disjoint central support, and support under duality (ES4); mod-ℓ Fargues–Scholze parameters of irreducible smooth representations of inner forms of GL_n, with central characters and the twisted Levi embedding, and the identification of reduced parameters with semisimplified characteristic-zero lifts of supercuspidal support (ES5; FS IX.5.2); compatibility of parameters with products, mod-ℓ reduction and parabolic induction with the modulus twist made explicit, and the identification of the dual spectral action with the Chevalley/contragredient involution preserving generic unramified support (ES6); compatibility of Fargues–Scholze parameters with the semisimplified local Langlands correspondence for GL_n and its inner forms (ES7).

## How to read the build

Layer IG.0 sets up the datum, its Hecke algebras and the p-divisible-group geometry of a Newton stratum; everything later depends on it. Layers IG.1 and IG.2 construct Igusa varieties and their partial compactifications over the special fibre. Layer IG.3 connects them with the generic fibre: the fibres of the Hodge–Tate period map are compactified Igusa varieties, so stalks of the pushforward of 𝔽_ℓ are Igusa cohomology. Layer IG.4 converts this into the two degree bounds, and IG.5 and IG.6 supply the two arithmetic inputs, the ordinary genericity theorem from the trace formula and the boundary length obstruction from Pink's formula. Layer IG.7 assembles the global vanishing theorem and its integral and middle-degree forms, and then, separately, Koshikawa's local route, which replaces the trace formula and the boundary analysis by the spectral action and so removes the hypotheses F⁺ ≠ ℚ and residual length at most two.

## Layer IG.0: Unitary data, Hecke algebras, p-divisible groups and central leaves

The layer opens with the local group theory every later layer uses: isocrystals with G-structure, the set B(G), its Newton and Kottwitz invariants and the admissible sets B(G, μ). It then fixes the explicit unitary datum, its three spherical Hecke algebras and the comparison of their localizations, and its good-reduction integral model. Local deformation theory supplies the groups and torsors governing a Newton stratum: internal Hom p-divisible groups, slope filtrations, universal-cover automorphisms, liftable automorphisms, central leaves, Rapoport–Zink spaces and the quasi-isogeny torsor. The internal Hom API is needed to describe the positive-dimensional fibres of the universal-cover automorphism group; it is not replaced by the discrete group J_b(ℚ_p). The layer ends with the Harris–Taylor strata at Drinfeld level used by the Li–Liu applications.

### IG.0.1 Isocrystals with G-structure and the set B(G)

<a id="ig-0-isocrystals-and-kottwitz-set"></a>

Let G be a connected reductive group over ℚ_p, L = W(𝔽̄_p)[1/p] and σ the Frobenius of L. Define `KottwitzSet G` = B(G) as the set of σ-conjugacy classes of G(L), where h acts by g ↦ hgσ(h)⁻¹. An isocrystal over 𝔽̄_p is a finite-dimensional L-vector space with a σ-linear automorphism; an isocrystal with G-structure is an exact tensor functor from Rep_{ℚ_p}G to isocrystals, and b ↦ (V ↦ (V ⊗ L, b σ)) identifies B(G) with isomorphism classes of isocrystals with G-structure. For G = GL_n this is b ↦ (L^n, bσ), and the Dieudonné–Manin classification identifies B(GL_n) with Newton polygons: rational slopes λ with multiplicities m_λ ≥ 0 such that m_λλ ∈ ℤ and Σ m_λ = n. For b ∈ G(L) define the algebraic group J_b over ℚ_p by J_b(R) = {g ∈ G(L ⊗_{ℚ_p} R) : g b σ(g)⁻¹ = b}; J_b(ℚ_p) is the automorphism group of the isocrystal with G-structure of b, and J_b depends on b only up to isomorphism within its class. If M_b is the centralizer of the Newton cocharacter ν_b of IG.0.2, a ℚ_p-rational Levi subgroup for a decent representative, then b is basic in M_b and J_b is an inner form of M_b. For a p-divisible group X with extra structure over 𝔽̄_p, J_b(ℚ_p) is the group of self-quasi-isogenies of X respecting the extra structure.

Here G is connected reductive over ℚ_p; the identification with self-quasi-isogenies is for the PEL data of type (A) or (C) of IG.0.

([CS17](#ref-cs17), §3.1, Definition 3.1.1, pp. 675–676; §5.4, pp. 738–739 for decent representatives, M_b and J_b, following Kottwitz 1985 and Rapoport–Zink 1996, Chapter 1.)

The API:

- `KottwitzSet`: B(G) as the quotient of G(L) by σ-conjugation.
- `KottwitzSet.equivIsocrystal`: The bijection with isomorphism classes of isocrystals with G-structure.
- `KottwitzSet.glEquivNewtonPolygon`: For GL_n, the Dieudonné–Manin bijection with Newton polygons.
- `KottwitzSet.map`: Functoriality for homomorphisms of reductive groups, and B(G₁ × G₂) = B(G₁) × B(G₂).
- `JGroup`: The σ-centralizer J_b, with `JGroup.isInnerForm` (an inner form of M_b) and `JGroup.equivAutIsocrystal`.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 (Dieudonné–Manin); TauCetiRoadmap ReductiveGroupsPartII (reductive groups over ℚ_p and Levi subgroups); Mathlib `WittVector`.

**Checks.**

- For G = 𝔾_m, B(G) ≅ ℤ by b ↦ val_p(b), and J_b = 𝔾_m for every b.
- For G = GL_2 the classes with Newton slopes {0, 1} and {1/2, 1/2} are distinct, and {1/2, 0} is not a Newton polygon of an isocrystal of height 2 (the slope 1/2 needs even multiplicity).
- For b = diag(1, p) in GL_2 (slopes 0 and 1), J_b(ℚ_p) = ℚ_p^× × ℚ_p^×; for b basic of slope 1/2, J_b(ℚ_p) = D^×, D the quaternion division algebra over ℚ_p, which is not split: J_b is an inner form of M_b = GL_2 and not isomorphic to it.
- J_b(ℚ_p) is not the centralizer of b in G(L): for b = p ∈ GL_1(L) the centralizer is L^×, while J_b(ℚ_p) = ℚ_p^×.

### IG.0.2 The Newton and Kottwitz maps, the order and B(G, μ)

<a id="ig-0-newton-kottwitz-admissible"></a>

Let G be connected reductive over ℚ_p, with a splitting over ℚ̄_p fixed, cocharacter lattice X_*(G) and Galois group Γ = Gal(ℚ̄_p/ℚ_p). Define the Newton map ν : B(G) → (X_*(G) ⊗ ℚ)^Γ_dom, sending b to the conjugacy class of its slope homomorphism (for GL_n, the slope decomposition), and the Kottwitz map κ : B(G) → π₁(G)_Γ, the unique natural transformation of set-valued functors on connected reductive groups that is b ↦ val_p(det b) for GL_n. The two are compatible in π₁(G)_Γ ⊗ ℚ, and (ν, κ) : B(G) → (X_*(G) ⊗ ℚ)^Γ_dom × π₁(G)_Γ is injective. Order dominant rational cocharacters by ν ≼ ν′ when ν′ − ν is a nonnegative rational combination of positive coroots, and B(G) by b ≼ b′ when ν_b ≼ ν_{b′} and κ(b) = κ(b′). For a conjugacy class μ of cocharacters with Galois average μ̄ and image μ^♭ ∈ π₁(G)_Γ, the set of μ-admissible classes is B(G, μ) = {b : ν_b ≼ μ̄, κ(b) = μ^♭}. An element is basic when ν_b is central. Put d_b = ⟨2ρ, ν_b⟩. For the unitary datum of IG.0.3 at a prime p that splits completely in F, G_{ℚ_p} ≅ ∏_{w|𝔭} GL_{2n}(ℚ_p) × 𝔾_m (𝔭 the prime of F₀ chosen above p), and B(G_{ℚ_p}, μ⁻¹) consists of the tuples (ν_w)_w of Newton vectors of height 2n with ν_w dominated by the component μ⁻¹_w (in particular of the same total slope), together with the similitude component fixed by μ; its unique maximal element is the ordinary class ν_w = μ⁻¹_w for every w, and d_b = d exactly for the ordinary class, because ⟨2ρ, ·⟩ is strictly positive on nonzero sums of positive coroots.

Here G is connected reductive over ℚ_p and μ is arbitrary (minuscule in all applications).

([CS17](#ref-cs17), §3.1, pp. 676–677, Definition 3.1.2, p. 677, recalling Kottwitz 1985 and Rapoport–Richartz 1996, Theorem 1.15; [CSnc](#ref-csnc), §2.7, p. 33 for the ordinary class and d_b.)

The API:

- `KottwitzSet.newton`: The Newton map ν, constant on σ-conjugacy classes.
- `KottwitzSet.kottwitz`: The Kottwitz map κ, natural in G.
- `KottwitzSet.newton_kottwitz_injective`: Injectivity of (ν, κ).
- `KottwitzSet.instPartialOrder`: The order b ≼ b′.
- `KottwitzSet.admissible`: B(G, μ), with `KottwitzSet.admissible_finite`.
- `KottwitzSet.IsBasic`, `KottwitzSet.dim` (d_b = ⟨2ρ, ν_b⟩) and `KottwitzSet.ordinary` for the unitary datum.
- For GL_n, already statable at the pins: `NewtonVector` (decreasing slopes with integral multiplicity-weighted slopes), `pairingTwoRho` (⟨2ρ, ν⟩), `DominatedBy` (the dominance order), `IsAdmissible` (B(GL_n, μ)) and `admissible_gl2_eq` (the first check below).

*Needs:* earlier targets of Layer IG.0; TauCetiRoadmap ReductiveGroupsPartII (root data, coroots and π₁ of reductive groups over ℚ_p).

**Checks.**

- For GL_2 and μ = (1, 0), B(GL_2, μ) has exactly two elements, the ordinary class (slopes 1, 0) and the basic class (slopes 1/2, 1/2), and the basic class is the smaller one.
- For GL_n, κ(b) = val_p(det b) is the total slope: b = diag(1, p) has κ = 1, the value of μ = (1, 0), while b = 1 has κ = 0 and is not (1, 0)-admissible. For GL_n the order condition already forces equal κ; for a group with torsion in π₁(G)_Γ, such as a nonsplit torus, κ carries information that ν does not.
- For imaginary quadratic F and n = 1 with p split, B(G_{ℚ_p}, μ⁻¹) has two elements, ordinary with d_b = 1 and basic with d_b = 0.
- For GL_4 with μ = (1, 1, 0, 0), the ordinary class has ⟨2ρ, ν⟩ = 4 = ⟨2ρ, μ⟩ and the basic class (slopes 1/2 four times) has ⟨2ρ, ν⟩ = 0.

### IG.0.3 Quasi-split unitary similitude data

<a id="ig-0-quasi-split-unitary-datum"></a>

Fix a CM field F with maximal totally real subfield F⁺ and an integer n ≥ 1. Let V = F^{2n} with the skew-hermitian form ⟨x, y⟩ = Σ_{i=1}^{n} (x_i ȳ_{2n+1−i} − x_{2n+1−i} ȳ_i) and the alternating form (x, y) = tr_{F/ℚ}⟨x, y⟩, and fix an O_F-lattice L ⊂ V that is self-dual for (·,·) (for example L = O_F^n ⊕ 𝔡^{−1,n}, 𝔡^{−1} the inverse different). The unitary similitude group is the group scheme G over ℤ with G(R) = {(g, c) ∈ GL_{O_F}(L)(R) × 𝔾_m(R) : (gv, gw) = c(v, w) for all v, w ∈ L}, and the unitary group is G⁰ = ker(c : G → 𝔾_m). The symmetric space of G(ℝ) is X = ∏_{τ:F⁺↪ℝ} X_{τ,+} ⊔ ∏_τ X_{τ,−}, with X_{τ,±} the positive (negative) definite n-dimensional subspaces of V ⊗_{F⁺,τ} ℝ ≅ ℂ^{2n}, and X⁰ = ∏_τ X_{τ,+}. For a neat compact open K ⊂ G(𝔸_f), X_K = G(ℚ)\(X × G(𝔸_f)/K) is a real manifold of dimension 2d with d = [F⁺:ℚ]n²; X⁰_{K⁰} is defined in the same way for G⁰. For N ≥ 3, K(N) = {g ∈ G(ℤ̂) : g ≡ 1 mod N}. Its spherical Hecke algebras are fixed in IG.0.4.

For a commutative ℚ-algebra R the points are G(R) = {(g, c) ∈ GL_{2n}(F ⊗_ℚ R) × R^× : gᵀ J ḡ = c J}, where J is the matrix of ⟨·,·⟩ (antidiagonal, with entries 1 above and −1 below the antidiagonal midpoint) and ḡ applies complex conjugation of F; preserving the alternating form up to c is equivalent to preserving ⟨·,·⟩ up to c because the trace form of F/ℚ is nondegenerate. The similitude character is (g, c) ↦ c.

The statement assumes that F is a CM field, n ≥ 1, L ⊂ V is a self-dual O_F-lattice for (·,·), and K ⊂ G(𝔸_f) is neat (K(N) with N ≥ 3 is neat).

([CSnc](#ref-csnc), §2.1, pp. 10–11.)

The API:

- `UnitarySimilitudeDatum.group`: G over ℤ and its similitude character c.
- `UnitarySimilitudeDatum.unitaryGroup`: The closed kernel G⁰=ker c.
- `UnitarySimilitudeDatum.locallySymmetricSpace`: The neat-level real double quotient X_K.
- `UnitarySimilitudeDatum.dim_locallySymmetricSpace`: Its real dimension 2d.
- `UnitarySimilitudeDatum.similitudeGroup`: The points G(R) over a commutative ℚ-algebra R as pairs (g, c) with gᵀJḡ = cJ, and `UnitarySimilitudeDatum.similitude`; in the suggested file these are `skewHermMatrix` (J), `similitudeGroup` over a ring with involution, `similitude` and `unitaryGroup`, with the trace pairing `splitTracePairing` and `UnitarySimilitudeDatum.dim`.
- `UnitarySimilitudeDatum.toPELDatum`: The PELModuli M0 datum (F,*,V,(·,·),L).

*Needs:* PELModuli M0; Tau Ceti `TauCeti.ReductiveAffineGroupSchemeCat`; Mathlib `NumberField.IsCMField`, `NumberField.maximalRealSubfield`, `Matrix.GeneralLinearGroup`; Mathlib `Matrix.unitaryGroup` (only as the non-example below).

**Checks.**

- For F imaginary quadratic and n = 1 the space X_{K(N)} has real dimension 2 (d = 1).
- The lattice O_F^n ⊕ 𝔡^{−1,n} is self-dual for (x, y) = tr⟨x, y⟩.
- G⁰(ℚ) ≠ G(ℚ): the scalar 2 ∈ ℚ^× ⊂ F^× lies in G(ℚ) with similitude factor c = 4 ≠ 1, so it is not in G⁰(ℚ).
- For a ℚ-algebra R, G⁰(R) = {g ∈ GL_{2n}(F ⊗ R) : gᵀ J ḡ = J}, J the antidiagonal matrix of ⟨·,·⟩ (signature (n, n)); this is not Mathlib's Matrix.unitaryGroup, which preserves the identity form, and over ℤ the lattice L ⊗ R need not be free over O_F ⊗ R unless the different is principal.

### IG.0.4 Spherical Hecke algebras of the datum

<a id="ig-0-spherical-hecke-algebras"></a>

Fix an imaginary quadratic subfield F₀ ⊂ F and a finite set S of rational primes containing the primes ramified in F and those where the level is not hyperspecial, and let Q_S be the set of primes q ∉ S that split in F₀. For q ∈ Q_S and a prime 𝔮 of F₀ above q, the decomposition of V ⊗ ℚ_q along 𝔮 and its conjugate gives a group isomorphism G(ℚ_q) ≅ ∏_{w|𝔮} GL_{2n}(F_w) × ℚ_q^× whose last coordinate is the similitude c; under it G⁰(ℚ_q) is the product of the GL_{2n}(F_w) and G(ℤ_q) = ∏_{w|𝔮} GL_{2n}(O_{F_w}) × ℤ_q^×. Define three rings.

(1) The full similitude algebra `heckeFull` 𝕋^S_full, the restricted tensor product of the ℤ[G(ℚ_q)//G(ℤ_q)] over q ∈ Q_S, realised as the double-coset ring `HeckeRing Δ K^S ℤ` of the restricted product Δ of the G(ℚ_q) with respect to K^S = ∏_q G(ℤ_q), with basis the double cosets [K^S g K^S].

(2) For a prime v of F above q ∈ Q_S and 1 ≤ i ≤ 2n, the operator `heckeOperator` T_{i,v} ∈ 𝕋^S_full: the double coset of the element that is diag(ϖ_v, …, ϖ_v, 1, …, 1) (i entries ϖ_v) in GL_{2n}(F_v), the identity in the other factors GL_{2n}(F_w), and has similitude coordinate in ℤ_q^×, in the decomposition attached to the prime of F₀ below v. The operator algebra `heckeOperatorSubring` 𝕋^S ⊂ 𝕋^S_full is the subring generated by all T_{i,v}, v running over all primes of F above all q ∈ Q_S.

(3) The unitary algebra `heckeUnitary` 𝕋^{0,S}, the restricted tensor product of the ℤ[G⁰(ℚ_q)//G⁰(ℤ_q)], with the operators T⁰_{i,v} given by the same double cosets in G⁰ (CSnc §2.1, pp. 11–12); it is generated by the T⁰_{i,v}.

Prove: (a) 𝕋^S is the subring of 𝕋^S_full of functions supported on the elements whose similitude is a unit at every q; (b) restriction of functions to G⁰ is a ring isomorphism `heckeRestrict` : 𝕋^S → 𝕋^{0,S} with T_{i,v} ↦ T⁰_{i,v}; (c) for q ∈ Q_S let z_q be the central element of G(ℚ_q) with similitude q and identity coordinates in every GL_{2n}(F_w), and U_q = [K z_q K]; then U_q is a unit of 𝕋^S_full with inverse [K z_q⁻¹ K], and 𝕋^S_full is the Laurent polynomial ring 𝕋^S[U_q^{±1} : q ∈ Q_S]; (d) all three rings are commutative; (e) the inversion g ↦ g⁻¹ induces the involution ι of 𝕋^S_full, [KgK] ↦ [Kg⁻¹K]; ι preserves 𝕋^S, sends U_q to U_q⁻¹, satisfies heckeRestrict ∘ ι = ι⁰ ∘ heckeRestrict for the inversion ι⁰ of 𝕋^{0,S}, and ι(T_{i,v}) = T_{2n,v}⁻¹ T_{2n−i,v} (with T_{0,v} = 1). Restriction of functions on the whole of 𝕋^S_full is **not** a ring homomorphism, so every comparison with the unitary group goes through 𝕋^S.

*Proof sketch.* The unit-similitude subgroup c⁻¹(ℤ_q^×) is the direct product G⁰(ℚ_q) × ℤ_q^×, and G(ℤ_q) = G⁰(ℤ_q) × ℤ_q^×. So a G(ℤ_q)-bi-invariant function supported there is determined by its restriction to G⁰(ℚ_q), convolution of two such functions is again supported there, and it is computed in G⁰; this gives (a) and (b), using that the T_{i,v} have unit similitude and the T⁰_{i,v} generate 𝕋^{0,S} (the inverse of T⁰_{2n,v} is the operator T⁰_{2n,v^c} at the conjugate place). Since c(z_q) = q generates ℚ_q^×/ℤ_q^× and z_q is central, G(ℚ_q) is the product of the unit-similitude subgroup and the cyclic group of z_q, which gives (c). Commutativity is the Satake isomorphism for GL_{2n}, or the anti-involution criterion with ι. The formula for ι(T_{i,v}) is the computation of the inverse double coset in GL_{2n}(F_v).

The hypotheses are that each q ∈ Q_S splits in F₀ and lies outside S; the operators T_{i,v} are not defined at other primes.

([CSnc](#ref-csnc), §2.1, pp. 11–12, for 𝕋^S, 𝕋^{0,S} and restriction; §5.1, p. 64, for the full algebra, the split decomposition and T_{i,v}; §2.8, proof of Theorem 1.1, p. 36, for ι; [acc23](#ref-acc23), §2.2.19, pp. 35–36, for the anti-involution.)

The API:

- `heckeFull`: 𝕋^S_full as `HeckeRing Δ K^S ℤ` for the restricted product, with `heckeFull_mul_comm`.
- `heckeOperator`: The operators T_{i,v} for v above q ∈ Q_S.
- `heckeOperatorSubring`: 𝕋^S, with `mem_heckeOperatorSubring_iff_support` (statement (a)).
- `heckeUnitary`: 𝕋^{0,S} with its operators T⁰_{i,v}.
- `heckeRestrict`: The ring isomorphism 𝕋^S ≃+* 𝕋^{0,S}, with `heckeRestrict_heckeOperator`.
- `heckeSimilitudeUnit`: The units U_q, with `heckeFull_eq_laurent` (statement (c)).
- `heckeInvolution`: ι on 𝕋^S_full, with `heckeInvolution_mem_operator`, `heckeInvolution_similitudeUnit` and `heckeRestrict_comp_involution`.

At a prime q that splits completely in F the local factors can already be written at the pins, in the coordinates G(ℚ_q) = ∏_{w} GL_{2n}(ℚ_q) × ℚ_q^×: `SplitLocalGroup`, `SplitLocalUnitaryGroup`, `glIntegral`, `unitsIntegral`, `splitIntegralSubgroup`, `splitUnitaryIntegralSubgroup`, `unitSimilitudeSubgroup`, the rings `localHeckeFull` and `localHeckeUnitary` (native `HeckeRing`s), the operator subring `localHeckeOperatorSubring`, the elements `similitudeElement` and `localSimilitudeUnit` (U_q^k), the function `restrictValue` (restriction of functions to G⁰), and the statements `localHeckeFull_mul_comm`, `localSimilitudeUnit_mul_neg`, `localSimilitudeUnit_not_mem`, `localHeckeFull_eq_laurent`, `exists_heckeRestrict` (statement (b), with the isomorphism given by `restrictValue`) and `not_exists_ringHom_restrict_full` (no ring homomorphism on the full algebra restricts functions).

*Needs:* earlier targets of Layer IG.0; Mathlib `RestrictedProduct`, `HeckeRing`; Tau Ceti `HeckeCosetModule.instRingHeckeRing`, `HeckeAntiInvolution.ofAmbient`; TauCetiRoadmap AdelicAlgebraicGroups Layer 1; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.1, SR.4.

**Checks.**

- U_q · U_q⁻¹ = 1 in 𝕋^S_full, but every element in the support of U_q or of U_q⁻¹ has similitude of valuation ±1, so restriction of functions sends both to 0 and sends 1 to the identity: restriction of functions on 𝕋^S_full is not multiplicative, and U_q ∉ 𝕋^S.
- For F imaginary quadratic and n = 1 (so F₀ = F and each q ∈ Q_S has two places v, v^c of F), T_{2,v} · T_{2,v^c} = 1 in 𝕋^S; a definition of 𝕋^S using only the places above one prime of F₀ would miss these inverses and would not be isomorphic to 𝕋^{0,S}.
- For 2n = 2, ι(T_{1,v}) = T_{2,v}⁻¹ T_{1,v} and ι(T_{2,v}) = T_{2,v}⁻¹; ι is not the identity on 𝕋^S.
- On the native basis, ι is the linear extension of `HeckeAntiInvolution.onHeckeCoset` for the `ofAmbient` inversion datum: it sends the basis vector of a double coset c to the basis vector of `onHeckeCoset c`; inversion need not fix double cosets.

### IG.0.5 Localization along the operator inclusion

<a id="ig-0-localization-along-operator-inclusion"></a>

Call a 𝕋^S_full-module M locally finite if it is the union of its finite submodules (finite as sets). Examples are the cohomology with 𝔽_ℓ or ℤ/ℓ^m coefficients of a Shimura variety or of a Mantovan Igusa variety at a fixed finite level, and filtered colimits of such along Hecke-equivariant maps, such as Igusa cohomology at infinite p-level. Let 𝔪 ⊂ 𝕋^S be a maximal ideal. Prove: (1) every maximal ideal 𝔐 of 𝕋^S_full in the support of M has finite residue field and 𝔐 ∩ 𝕋^S is maximal; (2) the natural map M_𝔪 → ⊕_𝔐 M_𝔐, the sum over the maximal ideals 𝔐 of 𝕋^S_full in the support of M with 𝔐 ∩ 𝕋^S = 𝔪, is an isomorphism, and each finite submodule has only finitely many 𝔐 in its support; (3) for a graded locally finite module M^•, M^i_𝔪 = 0 if and only if M^i_𝔐 = 0 for all 𝔐 over 𝔪, so if M^•_𝔪 is nonzero in exactly one degree then each M^•_𝔐 over 𝔪 is nonzero in at most that degree and at least one is nonzero there; (4) if 𝔐 lies over 𝔪 then ι(𝔐) lies over ι(𝔪), and a Galois representation whose Frobenius characteristic polynomials are the reductions of the Hecke polynomials of the T_{i,v} is the same for 𝔐 and for 𝔪; (5) for a maximal ideal 𝔪⁰ ⊂ 𝕋^{0,S}, 𝔪 = heckeRestrict⁻¹(𝔪⁰) is maximal with the same residue field, and for a 𝕋^{0,S}-module N viewed as a 𝕋^S-module through heckeRestrict, N_𝔪 = N_{𝔪⁰}.

*Proof sketch.* Localization commutes with filtered colimits, so reduce to a finite module M. Then 𝕋^S_full/Ann(M) embeds in a finite product of copies of M, so it is a finite, hence Artinian, ring, and M is the direct sum of its localizations at the finitely many maximal ideals of its support (Stacks, Lemma 10.53.6). A finite residue field 𝕋^S_full/𝔐 contains 𝕋^S/(𝔐 ∩ 𝕋^S), a finite domain, hence a field. An element s ∈ 𝕋^S ∖ 𝔪 is a unit on M_𝔐 when 𝔐 ∩ 𝕋^S = 𝔪; when 𝔐 ∩ 𝕋^S = 𝔪′ ≠ 𝔪, an element of 𝔪′ ∖ 𝔪 acts nilpotently on M_𝔐, so inverting it kills M_𝔐. Statement (4) holds because ι preserves 𝕋^S and the T_{i,v} lie in 𝕋^S; statement (5) because heckeRestrict is an isomorphism.

The hypothesis that M is a union of finite submodules is essential; it is satisfied by all the cohomology groups localized in Layers IG.4–IG.7.

([Stacks, Lemma 10.53.6](https://stacks.math.columbia.edu/tag/00JB); the comparison is the one used implicitly in [CSnc](#ref-csnc), §2.8, proof of Theorem 1.1, p. 36, where the operator-algebra ideal of §2.1 is fed into Corollary 5.1.3, p. 66, stated for the full algebra of §5.1.)

The API: `localization_operator_eq_sum` (statement (2)), `localization_operator_eq_zero_iff` (statement (3)), `dualIdeal_comap` (statement (4)), `localization_unitary_eq` (statement (5)).

*Needs:* earlier targets of Layer IG.0; Mathlib `LocalizedModule`, `IsArtinianRing`.

**Checks.**

- Toy case: with 𝕋^S = 𝔽_ℓ (ℓ ≥ 3), 𝕋^S_full = 𝔽_ℓ[U^{±1}], 𝔪 = 0 and M = 𝔽_ℓ[U]/(U − 1) ⊕ 𝔽_ℓ[U]/(U − 2), M_𝔪 = M is the sum of its localizations at (U − 1) and (U − 2).
- Non-example: M = 𝔽_ℓ[U^{±1}] is not locally finite; the element 1 has nonzero image in M_𝔐 for every one of the infinitely many maximal ideals 𝔐, so there is no map M → ⊕_𝔐 M_𝔐 and statement (2) fails.
- M = 0 gives the empty sum, and a module on which 𝕋^S acts through a different maximal ideal 𝔪′ ≠ 𝔪 has M_𝔪 = 0 although its full-algebra localizations at ideals over 𝔪′ are nonzero.

### IG.0.6 The open and closed unitary component

<a id="ig-0-unitary-subgroup-comparison"></a>

Let K ⊂ G(𝔸_f) be neat and K⁰ = K ∩ G⁰(𝔸_f). The inclusion G⁰ ↪ G induces an open and closed immersion X⁰_{K⁰} → X_K, and the induced maps H^i(X_K, ·) → H^i(X⁰_{K⁰}, ·) and H^i_c(X⁰_{K⁰}, ·) → H^i_c(X_K, ·) are equivariant for the operator algebra 𝕋^S, acting on the cohomology of X⁰_{K⁰} through heckeRestrict : 𝕋^S → 𝕋^{0,S}. Consequently, for a maximal ideal 𝔪⁰ ⊂ 𝕋^{0,S} and 𝔪 = heckeRestrict⁻¹(𝔪⁰), H^i(X⁰_{K⁰}, ·)_{𝔪⁰} is a quotient of H^i(X_K, ·)_𝔪 and H^i_c(X⁰_{K⁰}, ·)_{𝔪⁰} is a submodule of H^i_c(X_K, ·)_𝔪: restriction to an open and closed subspace is surjective, extension by zero is injective, and localization is exact. The full algebra 𝕋^S_full is not used here: it acts on the cohomology of X_K, but there is no ring map from it to 𝕋^{0,S} compatible with these maps (IG.0.4, first check).

The map X⁰_{K⁰} → X_K is injective because an element γ ∈ G(ℚ) relating two points of X⁰ × G⁰(𝔸_f) has c(γ) ∈ ℚ^× ∩ ∏_p ℤ_p^× = {±1} and c(γ) > 0, so γ ∈ G⁰(ℚ).

The hypotheses are: K neat and K⁰ = K ∩ G⁰(𝔸_f).

([CSnc](#ref-csnc), §2.1, Lemma 2.1.1, p. 12.)

*Needs:* earlier targets of Layer IG.0 (IG.0.4 and IG.0.5).

### IG.0.7 The Hasse principle for G

<a id="ig-0-hasse-principle"></a>

The map H¹(ℚ, G) → ∏_v H¹(ℚ_v, G), v running over all places of ℚ, is injective. Equivalently, a 2n-dimensional F-vector space V′ with an alternating form (·,·)′ satisfying (xv, w)′ = (v, x̄w)′ that is isomorphic to (V, (·,·)) up to a scalar after base change to every completion ℚ_v is isomorphic to it up to a scalar over ℚ.

The hypotheses are: G is the unitary similitude group of the quasi-split datum.

([CSnc](#ref-csnc), §2.1, Proposition 2.1.2, p. 12.)

*Needs:* earlier targets of Layer IG.0; TauCetiRoadmap AdelicAlgebraicGroups Layer 4; PELModuli M3.

### IG.0.8 Abelian and p-divisible groups with G-structure

<a id="ig-0-g-structure"></a>

(1) For a scheme S over ℤ[1/Δ_F], an abelian variety with G-structure over S is a triple (A, ι, λ): an abelian scheme A/S of relative dimension [F:ℚ]n, an action ι : O_F → End(A) such that Lie A is a free O_F ⊗_ℤ O_S-module of rank n, and a principal polarization λ : A ≅ A^∨ whose Rosati involution induces complex conjugation on O_F. (2) Take p unramified in F and a scheme S with p locally nilpotent. The p-divisible version consists of (X, ι, λ), where X/S is p-divisible of height 2[F:ℚ]n and dimension [F:ℚ]n, ι : O_F → End(X) with Lie X free of rank n over O_F ⊗_ℤ O_S, and λ : X ≅ X^∨ a principal polarization whose Rosati involution is complex conjugation via ι. Morphisms are O_F-linear maps respecting λ (isomorphisms may respect λ up to ℤ_p^× when stated, as in Igusa level structures).

The hypotheses are: p unramified in F in (2); the rank condition on Lie is the determinant (Kottwitz) condition of the split signature (n, n) at every place.

([CSnc](#ref-csnc), §2.1, Definition 2.1.3(2), p. 13.)

The API:

- `PDivGStructure.ofAbelian`: The p-divisible group A[p^∞] with its induced G-structure.
- `PDivGStructure.baseChange`: Base change, compatible with composition.
- `PDivGStructure.height_eq`: Height 2[F:ℚ]n and dimension [F:ℚ]n.
- `PDivGStructure.Iso`: O_F-linear isomorphisms preserving polarization up to ℤ_p^×; strict ones preserve it exactly.
- `PDivGStructure.cartierDual`: The polarization identification with the conjugate Cartier dual.

*Needs:* earlier targets of Layer IG.0; PELModuli M1; PELModuli M0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.

**Checks.**

- Over 𝔽̄_p with p unramified in F (signature (n, n) makes the ordinary element admissible for every such p), μ_{p^∞} ⊗ O_F^n ⊕ (ℚ_p/ℤ_p) ⊗ O_F^n with the standard polarization is a p-divisible group with G-structure of height 2[F:ℚ]n.
- A p-divisible group with the required height and O_F-action whose Lie algebra has conjugate embedding ranks (n+1,n−1) fails the balanced Lie-rank condition; the failure is unequal component ranks, not freeness of a different common rank.
- For an abelian variety with G-structure A, the height of A[p^∞] is 2 dim A = 2[F:ℚ]n.

### IG.0.9 The integral model S_K

<a id="ig-0-integral-model"></a>

Fix N ≥ 3 and K = K(N). The S-points of S^pre_K over ℤ[1/Δ_F] consist of an abelian variety (A, ι, λ) with G-structure, level data η : L/N → A[N] that are O_F-linear, and ζ_N ∈ μ_N(O_S) of exact order N. Require that η carries (·,·) mod N to the Weil pairing of λ via ζ_N, and that η extends to compatible O_F-linear maps L/Δ_F^m N → A[Δ_F^m N] for all m ≥ 1. It is a Deligne–Mumford stack, representable after base change to ℤ[1/(Δ_F N)] and after base change to ℤ_(p) whenever the prime-to-p part of N is at least 3. S_K is the normalization of S^pre_K in S^pre_K × ℤ[1/(Δ_F N)]. For p ∤ NΔ_F, S_K ×_ℤ ℤ_(p) is the smooth PEL integral model of PELModuli M2 with hyperspecial level at p; its special fibre S_{K,k} = S_K ×_ℤ k (k = 𝔽̄_p) carries the universal p-divisible group with G-structure A[p^∞]. As schemes, S^pre_K and S_K mean their restrictions to the open base U_{D,N} on which Δ_F is invertible and the prime-to-q part of N is at least 3 at every residual prime q; the whole normalized Deligne–Mumford stack is not declared to be a Scheme.

Level-forgetting maps are defined over a common good-prime base for N|M, p∤MΔ_F. Complex uniformization commutes with these maps. Prime-to-p Hecke correspondences compose compatibly.

The hypotheses are: N ≥ 3 and K=K(N). The source first defines a Deligne–Mumford moduli stack over ℤ[1/Δ_F]. The suggested Scheme carrier is its restriction to the open base U_{D,N} where the prime-to-residue-characteristic part of N is at least 3. At p unramified in F with that tame-level condition, base change to ℤ_(p) is defined; smoothness additionally requires p∤N.

([CSnc](#ref-csnc), §2.1, Definition 2.1.4, p. 13; [CSnc](#ref-csnc), §2.1, Definition 2.1.5, p. 13.)

The API: `IntegralModel.moduli`, `IntegralModel.smooth_of_good`, `IntegralModel.universalPDiv`, `IntegralModel.hecke`, `IntegralModel.toPELModuli`, `IntegralModel.transitionAtP`, `IntegralModel.complexTransition`.

*Needs:* earlier targets of Layer IG.0; PELModuli M1; PELModuli M0; PELModuli M2.

**Checks.**

- At a good prime the relative dimension is d; imaginary quadratic F with n=1 gives a curve.
- The complex fibre is the Shimura variety X_K.
- For N=p≥3 the tame level is trivial, so the N^p≥3 representability criterion does not apply.

### IG.0.10 Complex uniformization

<a id="ig-0-complex-uniformization"></a>

There is a natural isomorphism of complex manifolds X_K ≅ S_K(ℂ), equivariant for the Hecke action of G(𝔸_f).

The hypotheses are: K = K(N) with N ≥ 3.

([CSnc](#ref-csnc), §2.1, Proposition 2.1.6, p. 13.)

*Needs:* earlier targets of Layer IG.0; PELModuli M3.

### IG.0.11 Unramified local PEL data of type (A) or (C)

<a id="ig-0-unramified-local-pel-datum"></a>

An unramified local PEL datum D^int = (B, *, V, (·,·), O_B, Λ, μ, b) consists of: a finite-dimensional semisimple ℚ_p-algebra B with anti-involution *, which is a product of matrix algebras over unramified extensions of ℚ_p; a *-stable maximal ℤ_p-order O_B; a finite left B-module V with an alternating form (·,·) : V × V → ℚ_p such that (bv, w) = (v, b*w); an O_B-stable lattice Λ ⊂ V self-dual for (·,·), so that G(R) = {(g, c) ∈ GL_{B⊗R}(V ⊗ R) × R^× : (gv, gw) = c(v, w)} extends to a reductive group G over ℤ_p, assumed connected (type D excluded); a conjugacy class μ : 𝔾_m → G_{ℚ̄_p} of cocharacters with weights 0 and 1 on V, V_{ℚ̄_p} = V₀ ⊕ V₁ with both summands totally isotropic and c ∘ μ = id, with field of definition E; and b ∈ G(L), L = W(𝔽̄_p)[1/p], with [b] ∈ B(G, μ^{−1}). The slopes of b on V lie in [−1, 0] in the paper's (nonstandard) covariant normalization of the Dieudonné module, so there is a p-divisible group X_b over 𝔽̄_p with rational B-action on its universal cover and symmetric quasi-polarization, unique up to quasi-isogeny, whose rational covariant Dieudonné module is V ⊗ L with Frobenius b σ. Global PEL data of type (A) or (C) unramified at p with hyperspecial level give such a datum at every b ∈ B(G_{ℚ_p}, μ^{−1}).

The hypotheses are: B is a product of matrix algebras over unramified extensions of ℚ_p (unramified datum). G connected: data of type D are excluded. p = 2 is allowed in this unramified setting without type D.

([CS17](#ref-cs17), §4.2, p. 697; [CS17](#ref-cs17), §4.2, p. 696.)

The API:

- `LocalPELDatum.reductiveModel`: The reductive ℤ_p-model stabilizing Λ up to scalar.
- `LocalPELDatum.pdivOfB`: The rational B-framing X_b and symmetric quasi-polarization; integral O_B-action and principal polarization are separate data.
- `LocalPELDatum.pdivOfB_isocrystal`: The isocrystal (V⊗L,bσ) with action and pairing.
- `LocalPELDatum.pdivOfB_unique`: Uniqueness up to structure-preserving quasi-isogeny.
- `LocalPELDatum.ofGlobal`: The unramified type (A)/(C) hyperspecial global-to-local construction for b∈B(G,μ⁻¹).
- `LocalPELDatum.J`: Self-quasi-isogenies J_b(ℚ_p), identified with the σ-centralizer `JGroup` of IG.0.1.
- `LocalPELDatum.IntegralSlopeRepresentative`: An integral principal-polarized, determinant-compatible, completely slope divisible representative quasi-isogenous to X_b; its existence is supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

*Needs:* earlier targets of Layer IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2; PELModuli M0.

**Checks.**

- For the unitary datum at p split in F and b ordinary, X_b ≅ (μ_{p^∞} ⊕ ℚ_p/ℤ_p) ⊗_{ℤ_p} O_F^n ⊗ ℤ_p with the standard polarization.
- For the quasi-split unitary datum and b basic, X_b is isoclinic of slope 1/2.
- An orthogonal datum (* of type D, G disconnected) is not an unramified local PEL datum in this sense.
- J_b(ℚ_p) = Aut(X_b, extra structures) ⊗ ℚ equals the σ-centralizer of b of IG.0.1.

### IG.0.12 The Newton map and stratification

<a id="ig-0-newton-map"></a>

Let S be the special fibre over k = 𝔽̄_p of the integral model of a PEL Shimura variety of type (A) or (C) with hyperspecial level at p (for the quasi-split unitary datum: S_{K,k} with p ∤ NΔ_F). For a point x ∈ S with geometric point x̄, the rational Dieudonné module of A_x̄[p^∞] with its extra structures is an isocrystal with G-structure, classified by an element b_x ∈ B(G_{ℚ_p}); then [b_x] ∈ B(G_{ℚ_p}, μ^{−1}) (Rapoport–Richartz), with μ the Hodge cocharacter. The Newton stratum S^b = {x : [b_x] = b} is locally closed, and S = ⊔_{b ∈ B(G_{ℚ_p}, μ^{−1})} S^b. For each b fix a completely slope divisible X_b over k with G-structure in the isogeny class b (CS17 §4.3, after [Man05, §3]). The map x ↦ [b_x] is the PEL-specific map; B(G), the Newton map ν, the Kottwitz map κ, the order and B(G, μ) are those of IG.0.1–IG.0.2, with the sign of μ recorded: the Shimura variety has Hodge cocharacter μ and the strata are indexed by B(G, μ^{−1}).

Require prime-to-p Hecke invariance, invariance under structure-preserving quasi-isogeny, and closure(S^b)⊆⋃_{b′≤b}S^{b′}.

The hypotheses are: PEL datum of type (A) or (C) unramified at p with hyperspecial K_p; for the quasi-split unitary datum p ∤ NΔ_F.

([CS17](#ref-cs17), §4.3, p. 714.)

The API: `newtonPoint`, `newtonStratum`, `newtonStratum_disjoint_union`, `closure_newtonStratum_subset`, `newtonPoint_hecke`, `newtonPoint_isogeny`.

*Needs:* earlier targets of Layer IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

**Checks.**

- When p splits in F the ordinary stratum is open and dense.
- For imaginary quadratic F, n=1 and split p there are two strata; the basic locus is finite.
- For n≥2, isogenous but nonisomorphic groups give the same Newton point and different leaves; for imaginary quadratic F, n=1 and split p each stratum is one leaf.
- The Newton class belongs to B(G,μ⁻¹), with the stated cocharacter convention.

### IG.0.13 Splitting symplectic filtrations

<a id="ig-0-splitting-symplectic-filtrations"></a>

Work over an algebraically closed characteristic-p field k and fix p-divisible data (X, ι, λ) with G-structure. The connected–multiplicative filtration X^μ ⊂ X° ⊂ X is O_F-stable and symplectic and splits uniquely, X ≅ X^μ ⊕ X^{(0,1)} ⊕ X^{ét}, with λ decomposing accordingly; X is determined up to isomorphism by X^{(0,1)} with its O_F-action and polarization and by the finite projective O_F ⊗ ℤ_p-module T_p(X^{ét}). More generally, if Z_{−2} ⊂ Z_{−1} ⊂ X is an O_F-stable filtration by sub-p-divisible groups with Z_{−2} multiplicative, X/Z_{−1} étale and λ identifying Z_{−2} with (X/Z_{−1})^∨, then there is an O_F-linear splitting X ≅ Z_{−2} ⊕ Z_{−1}/Z_{−2} ⊕ X/Z_{−1} under which λ decomposes as a direct sum.

The hypotheses are: k algebraically closed (perfect suffices for the connected–étale splitting).

([CSnc](#ref-csnc), §2.2, Proposition 2.2.1, p. 14.)

*Needs:* earlier targets of Layer IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.

### IG.0.14 The internal Hom p-divisible group

<a id="ig-0-internal-hom-p-divisible-group"></a>

Let G, G′ be isoclinic p-divisible groups over a perfect field k of characteristic p. For n ≥ 1, H_n = 𝓗om(G[p^n], G′[p^n]) is a commutative group scheme of finite type over k; for m ≥ n the restriction r_{m,n} : H_m → H_n has closed kernel and H_n^{(m)} = H_m / ker r_{m,n} ⊂ H_n is a closed subgroup scheme, decreasing in m. (Lemma 4.1.5) H_n^{(m)} is constant for m ≫ 0, equal to a finite group scheme H′_n. (Lemma 4.1.6) The maps ι_n : H_n → H_{n+1} (precompose with p : G[p^{n+1}] → G[p^n], compose with G′[p^n] ↪ G′[p^{n+1}]) send H′_n into H′_{n+1}, and H_{G,G′} := colim_n H′_n is a p-divisible group over k with H_{G,G′}[p^n] = H′_n. The construction extends to O_F-linear Homs for p-divisible groups with an action of the ring of integers O_F of an unramified extension F/ℚ_p.

The construction is contravariant in G and covariant in G′, respects composition and isogenies, and has the O_F-linear variant for unramified F/ℚ_p.

The hypotheses are: G, G′ isoclinic over a perfect field k of characteristic p.

([CS17](#ref-cs17), §4.1, Lemma 4.1.5, p. 693; [CS17](#ref-cs17), §4.1, Lemma 4.1.6, p. 694.)

The API: `InternalHom.pdiv`, `InternalHom.torsion_eq`, `InternalHom.tateModule`, `InternalHom.map`, `InternalHom.ofLinear`.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

**Checks.**

- 𝓗_{μ,μ}=ℚ_p/ℤ_p: equal slopes give an étale group.
- 𝓗_{μ,ét}=0, whereas 𝓗_{ét,μ}=μ_{p^∞} has dimension one.
- At finite level the truncation consists of liftable homomorphisms; all truncated homomorphisms need not lift.

### IG.0.15 Internal Hom: Tate and Dieudonné modules

<a id="ig-0-internal-hom-dieudonne-module"></a>

Let G, G′ be isoclinic p-divisible groups over a perfect field k. (1) The Tate module T_p H_{G,G′} is identified with the sheaf 𝓗om(G, G′). (2) The rational Dieudonné module satisfies D(H_{G,G′})[1/p] = Hom(D(G)[1/p], D(G′)[1/p])^{≤0}, the part of slopes ≤ 0 of the internal Hom isocrystal (with the normalization of CS17 §4.1); the statement depends only on G, G′ up to quasi-isogeny. The analogous statements hold O_F-linearly for F/ℚ_p unramified, using D_F(G) = D(G)[1/p]_{τ₀}, an isocrystal for φ^{[F:ℚ_p]}.

The hypotheses are: G, G′ isoclinic over a perfect field k.

([CS17](#ref-cs17), §4.1, Lemma 4.1.7, p. 695; [CS17](#ref-cs17), §4.1, Lemma 4.1.8, p. 695.)

*Needs:* earlier targets of Layer IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

### IG.0.16 Internal Hom: slopes and formal structure

<a id="ig-0-internal-hom-slopes"></a>

Let G, G′ be isoclinic p-divisible groups over a perfect field k. (1) If the slope of G is strictly greater than that of G′, then H_{G,G′} = 0. (2) If the slopes are equal, H_{G,G′} is étale. (3) If the slope of G is strictly smaller than that of G′, H_{G,G′} is connected; if it has dimension r, the sheaf 𝓗om(G, G′) is representable by Spec k[[x₁^{1/p^∞}, …, x_r^{1/p^∞}]]/(x₁, …, x_r).

The hypotheses are: G, G′ isoclinic over a perfect field k.

([CS17](#ref-cs17), §4.1, Corollary 4.1.10, p. 696; [CS17](#ref-cs17), §4.1, Corollary 4.1.11, p. 696.)

*Needs:* earlier targets of Layer IG.0.

### IG.0.17 Complete slope divisibility

<a id="ig-0-completely-slope-divisible"></a>

Let T be an 𝔽_p-scheme and 𝒢/T a p-divisible group with relative Frobenius Frob_𝒢. (1) 𝒢 is isoclinic and slope divisible of slope λ ∈ ℚ_{≥0} if one can write λ = r/s so that the quasi-isogeny p^{−r} Frob^s_𝒢 : 𝒢 → 𝒢^{(p^s)} is an isomorphism. (2) 𝒢 is slope divisible with respect to λ = r/s if p^{−r} Frob^s_𝒢 is an isogeny. (3) 𝒢 is completely slope divisible if there are rational numbers λ₁ > … > λ_r ≥ 0 and a filtration 0 = 𝒢₀ ⊂ 𝒢₁ ⊂ … ⊂ 𝒢_r = 𝒢 by p-divisible groups such that each 𝒢_i is slope divisible with respect to λ_i and 𝒢_i/𝒢_{i−1} is isoclinic and slope divisible of slope λ_i. Such a filtration is unique and its formation is fpqc local on T.

The hypotheses are: T an 𝔽_p-scheme; slopes in the covariant normalization of CSnc §2.3.

([CSnc](#ref-csnc), §2.3, Definition 2.3.3, p. 18; [CSnc](#ref-csnc), §2.3, Lemma 2.3.4, p. 19.)

The API:

- `IsCompletelySlopeDivisible`: The stated slope-divisibility predicate.
- `IsCompletelySlopeDivisible.slopeFiltration`: The unique slope divisible filtration.
- `IsCompletelySlopeDivisible.baseChange`: Base-change stability of the predicate and filtration.
- `IsCompletelySlopeDivisible.of_generic`: Generic-to-global divisibility over connected regular bases with constant Newton polygon (CSnc Lemma 2.3.4).
- `IsCompletelySlopeDivisible.split_of_perfect`: Canonical splitting over perfect bases (Oort–Zink Proposition 1.3).

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

**Checks.**

- μ_{p^∞} ⊕ ℚ_p/ℤ_p over 𝔽̄_p is completely slope divisible with slopes 1 > 0.
- A nonzero isoclinic slope divisible group is completely slope divisible with r=1; the zero group has the empty filtration r=0.
- A p-divisible group over a nonnormal base that is not isogenous to one with a slope filtration ([OZ02, Ex. 4.2]) is not completely slope divisible.
- For slopes in {0, 1} the slope filtration is the multiplicative–étale filtration of the p-divisible group.

### IG.0.18 Slope divisible representatives and base change

<a id="ig-0-slope-filtration-existence"></a>

(1) Every p-divisible group over an algebraically closed field of characteristic p is isogenous to a completely slope divisible one, which is a direct sum of isoclinic slope divisible groups defined over a finite field, with decreasing slopes; for the PEL classes used here, choosing a representative with integral O_B-action, determinant condition, principal polarization and complete slope divisibility is a separate existence statement supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2, as used in CS17 §4.3. (2) Over a perfect base a completely slope divisible p-divisible group is the direct sum of its isoclinic graded pieces [OZ02, Prop. 1.3]. (3) If V is a valuation ring of characteristic p with fraction field K and G/V has constant Newton polygon with G_K completely slope divisible, then G is completely slope divisible [OZ02, Prop. 2.3]. (4) Over a connected regular characteristic-p base with constant Newton polygon, complete slope divisibility at the geometric generic point implies it everywhere [Zin01, Thm 7].

The hypotheses are: Characteristic p bases; (3) needs constant Newton polygon. In (4), the Newton polygon is constant on the base.

([oz02](#ref-oz02), Proposition 1.3, p. 186; [oz02](#ref-oz02), Proposition 2.3, p. 189; [CS17](#ref-cs17), §4.3, p. 714.)

*Needs:* earlier targets of Layer IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

### IG.0.19 Universal-cover automorphisms

<a id="ig-0-automorphism-group-of-universal-cover"></a>

For an unramified local PEL datum with p-divisible group X_b over 𝔽̄_p, let X̃_b = lim_{×p} X_b be its universal cover. Aut_G(X̃_b) is the sheaf on Nilp^{op}_{W(𝔽̄_p)} with Aut_G(X̃_b)(R) = {(α, β) : α ∈ Aut_{O_B}(X̃_{b,R}), β ∈ Aut(μ̃_{p^∞,R}), α respects the polarization up to β}. It is representable by a formal scheme over Spf W(𝔽̄_p), locally of the form Spf W(R) for a perfect ring R. Its group of 𝔽̄_p-points (equivalently of W(𝔽̄_p)-points) is J_b(ℚ_p), the self-quasi-isogenies of X_b respecting the extra structures.

The hypotheses are: Unramified local PEL datum of type (A) or (C); X_b chosen completely slope divisible.

([CS17](#ref-cs17), §4.2, Lemma 4.2.10, p. 703; [CS17](#ref-cs17), §4.2, Definition 4.2.9, p. 703.)

The API:

- `AutUniversalCover`: The sheaf Aut_G(X̃_b) on Nilp^{op}_{W(𝔽̄_p)}.
- `AutUniversalCover.representable`: Formal representability, locally Spf W(R) with R perfect.
- `AutUniversalCover.points`: Its geometric points are J_b(ℚ_p).
- `AutUniversalCover.rigid`: Bijective restriction across nilpotent thickenings.
- `AutUniversalCover.toJ`: The map to J_b(ℚ_p) of [IG.0.20](#ig-0-structure-of-automorphism-group).

*Needs:* earlier targets of Layer IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; SchemeAndStackFoundations SF.4; AdicSpacesPartII F0; AdicSpacesPartII R2.

**Checks.**

- For X_b isoclinic, Aut_G(X̃_b) = J_b(ℚ_p) is the constant locally profinite formal scheme (d = 0).
- For the standard rank-two symplectic PEL datum B=ℚ_p, V=ℚ_p², its standard alternating form, O_B=ℤ_p, Λ=ℤ_p² and μ(t)=diag(t,1), with ordinary X_b=μ_{p^∞}⊕ℚ_p/ℤ_p, the group is GSp₂=GL₂ and every fibre over J_b(ℚ_p)=ℚ_p^××ℚ_p^× is Spf W(k)[[x^{1/p^∞}]].
- Aut_G(X̃_b) is not the automorphism group scheme Aut(X_b): its 𝔽̄_p-points are J_b(ℚ_p), not the compact Aut(X_b)(𝔽̄_p).
- The group of 𝔽̄_p-points equals J_b(ℚ_p) of IG.0.1 for the isocrystal of X_b.

### IG.0.20 The automorphism fibres over J_b

<a id="ig-0-structure-of-automorphism-group"></a>

Regard the locally profinite set J_b(ℚ_p) as a formal scheme over W(𝔽̄_p) (sections over U ⊂ J_b(ℚ_p) are the continuous maps U → W(𝔽̄_p)). For unramified local PEL data of type (A) or (C) there is a natural map Aut_G(X̃_b) → J_b(ℚ_p) all of whose fibres are isomorphic to Spf W(𝔽̄_p)[[x₁^{1/p^∞}, …, x_d^{1/p^∞}]] with d = ⟨2ρ, ν_b⟩, ρ the half-sum of the positive roots.

The hypotheses are: Unramified local PEL data of type (A) or (C); X_b completely slope divisible.

([CS17](#ref-cs17), §4.2, Proposition 4.2.11, p. 704.)

*Needs:* earlier targets of Layer IG.0.

### IG.0.21 Liftable automorphisms and finite-level torsors

<a id="ig-0-liftable-automorphisms"></a>

Let k be algebraically closed of characteristic p and X/k an isoclinic p-divisible group with extra structures of EL or PEL type. (1) For m ≥ 1 let Γ_m be the group of automorphisms of X[p^m] commuting with the extra structures that lift to automorphisms of X[p^{m′}] for all m′ ≥ m; the finite étale group scheme Γ_{m,k} represents the functor of T-automorphisms of X_T[p^m] commuting with the extra structures that lift fppf locally to X_T[p^{m′}] for all m′ ≥ m (and one m′ suffices). (2) Let 𝒳/k be a seminormal scheme and 𝒢/𝒳 a p-divisible group with the same kind of extra structures, geometrically isomorphic to X at every point. Then the functor on 𝒳-schemes T of isomorphisms ρ_m : 𝒢[p^m] ×_𝒳 T ≅ X[p^m] ×_k T compatible with the extra structures that lift fppf locally to isomorphisms of p^{m′}-truncations for all m′ ≥ m is representable by a Γ_m-torsor J_m(𝒢/𝒳) → 𝒳.

The hypotheses are: X isoclinic; 𝒳 seminormal; 𝒢 geometrically isomorphic to X at all points.

([CSnc](#ref-csnc), §2.2, Proposition 2.2.3, p. 15; [CSnc](#ref-csnc), §2.2, Theorem 2.2.4, p. 15.)

The API: `liftableAutomorphismsPlain`, `liftableAutomorphisms`.

*Needs:* earlier targets of Layer IG.0.

### IG.0.22 Finite isomorphism loci in truncated RZ spaces

<a id="ig-0-truncated-rz-isomorphism-locus"></a>

Let Y/k be a p-divisible group with extra structures over an algebraically closed field k, and M^{0,d}_Y the reduced special fibre of the truncated Rapoport–Zink space of isogenies with kernel contained in Y[p^d]; let H be the universal p-divisible group over it. The subset Z = {x ∈ M^{0,d}_Y : H_x̄ ≅ Y_x̄ compatibly with extra structures} consists of finitely many points, all defined over k.

The hypotheses are: Y need not be isoclinic.

([CSnc](#ref-csnc), §2.2, Lemma 2.2.5, p. 16.)

*Needs:* earlier targets of Layer IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.

### IG.0.23 Isomorphism torsors

<a id="ig-0-isomorphism-torsors"></a>

Let X/k be a p-divisible group with EL or PEL extra structure over algebraically closed k (not necessarily isoclinic), Γ = lim_m Γ_m = Aut(X)(k) the profinite group of its automorphisms with extra structure, and Aut(X) the group scheme of automorphisms with extra structure (in general highly non-reduced). Let 𝒢 be a p-divisible group with the same extra structure over a scheme 𝒳/k, geometrically isomorphic to X at every point. (1) If 𝒳 is perfect, the functor on perfect 𝒳-schemes T of isomorphisms 𝒢 ×_𝒳 T ≅ X ×_k T is representable by a Γ-torsor J(𝒢/𝒳) → 𝒳. (2) If 𝒳 is regular, the functor on all 𝒳-schemes T of such isomorphisms is representable by an Aut(X)-torsor over 𝒳.

The hypotheses are: (1) 𝒳 perfect; (2) 𝒳 regular; 𝒢 geometrically isomorphic to X with extra structures.

([CSnc](#ref-csnc), §2.2, Proposition 2.2.6, p. 17; [CSnc](#ref-csnc), §2.2, Proposition 2.2.7, p. 17.)

*Needs:* earlier targets of Layer IG.0; Mathlib `PerfectRing`.

### IG.0.24 Central leaves

<a id="ig-0-central-leaf"></a>

Let X be a p-divisible group with G-structure over k = 𝔽̄_p (more generally with the extra structures of a PEL datum of type (A) or (C), unramified at p, hyperspecial level). The central leaf C^X ⊂ S_{K,k} is the subset of points x such that A[p^∞]_x̄ ≅ X ×_k k(x̄) compatibly with the extra structures, for one (equivalently every) geometric point x̄ over x. It is locally closed (closed in the Newton stratum S^b of X) and, with its reduced structure, a smooth subscheme of S_{K,k} (Mantovan [Man05, Prop. 1]). It is stable under prime-to-p Hecke correspondences; unlike the Newton stratum and the Igusa variety, it depends on X within its isogeny class.

The hypotheses are: PEL datum of type (A) or (C) unramified at p with hyperspecial level; X over 𝔽̄_p with extra structures.

([CSnc](#ref-csnc), §2.3, Definition 2.3.1, p. 17; [CS17](#ref-cs17), §4.3, Definition 4.3.6, p. 716.)

The API:

- `centralLeaf`: The reduced locally closed C^X⊂S_{K,k}.
- `centralLeaf_smooth`: Smoothness over k.
- `centralLeaf_subset_newtonStratum`: C^X is closed inside its Newton stratum S^b.
- `mem_centralLeaf_iff`: Geometric structure-preserving isomorphism with X.
- `centralLeaf_hecke`: Preservation by prime-to-p Hecke correspondences.
- `centralLeaf_universal_iso`: Pointwise geometric isomorphisms give the [IG.0.23](#ig-0-isomorphism-torsors) construction.

*Needs:* earlier targets of Layer IG.0.

**Checks.**

- For b ordinary, C^{X_b} equals the ordinary Newton stratum.
- For F imaginary quadratic and n = 1 and b basic, C^{X_b} is a finite set of supersingular points.
- In general C^X ⊊ S^b: for a non-ordinary, non-basic b with d_b < dim S^b the leaf is a proper closed subset of the stratum.
- dim C^{X_b} = ⟨2ρ, ν_b⟩.

### IG.0.25 The dimension of a central leaf

<a id="ig-0-central-leaf-dimension"></a>

For a PEL datum of type (A) or (C) unramified at p with hyperspecial level and b ∈ B(G_{ℚ_p}, μ^{−1}), every central leaf C^{X} with X in the isogeny class b is smooth of pure dimension d_b = ⟨2ρ, ν_b⟩, where ν_b is the Newton point and ρ the half-sum of positive roots; the perfect Igusa variety Ig^b has the same dimension d_b (CSnc §2.7).

The hypotheses are: PEL type (A) or (C), unramified at p, hyperspecial level.

([ham15](#ref-ham15), Corollary 7.8 (2), p. 30 (arXiv:1312.0490v2); [CS17](#ref-cs17), §4.2, Remark 4.2.13, p. 708.)

*Needs:* earlier targets of Layer IG.0.

### IG.0.26 Serre–Tate theory without noetherian hypotheses

<a id="ig-0-serre-tate-semi-abelian"></a>

Suppose S is a quotient of S′ by a nilpotent ideal and p is nilpotent in both rings. (1) Base change from S′ to S is an equivalence on p-divisible groups up to isogeny, on abelian schemes up to p-power isogeny, and on semi-abelian schemes that are global extensions of abelian schemes by split tori (with Hom ⊗ ℤ[1/p]). (2) Extensions G_{S′} of abelian schemes by split tori over S′ are equivalent to triples (G_S, 𝒢_{S′}, ρ) with G_S such an extension over S, 𝒢_{S′} a p-divisible group over S′ and ρ : G_S[p^∞] ≅ 𝒢_{S′} ×_{S′} S. No noetherian hypotheses are needed. The classical statement for abelian schemes (CSnc Theorem 2.4.2(1)) comes from AbelianSchemesAndArithmeticModuli A4; the isogeny-level, non-noetherian and semi-abelian extensions used for toroidal boundary charts are the content of this target.

The hypotheses are: p nilpotent in S′, kernel of S′ → S nilpotent.

([CSnc](#ref-csnc), §2.4, Theorem 2.4.1, p. 20; [CSnc](#ref-csnc), §2.4, Theorem 2.4.2, p. 21.)

*Needs:* AbelianSchemesAndArithmeticModuli A4; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.

### IG.0.27 PEL Rapoport–Zink spaces

<a id="ig-0-pel-rapoport-zink-space"></a>

For an unramified local PEL datum D^int with p-divisible group X_b, Ĕ the completion of the maximal unramified extension of E and O_Ĕ its ring of integers, 𝔐_{D^int} is the functor on Nilp^{op}_{O_Ĕ} (O_Ĕ-algebras R on which p is nilpotent) sending R to the isomorphism classes of pairs (G, ρ) with G a p-divisible group over R with O_B-action satisfying the determinant condition and a principal polarization whose Rosati involution is compatible with *, and ρ : X_b ×_{𝔽̄_p} R/p → G ×_R R/p an O_B-linear quasi-isogeny respecting the polarizations up to an automorphism of μ̃_{p^∞,R/p}. It is representable by a formal scheme over Spf O_Ĕ that locally admits a finitely generated ideal of definition, and it is formally smooth (Rapoport–Zink [RZ96, Thm 3.25, §3.82]). J_b(ℚ_p) acts by composition on ρ.

The action is g·(G,ρ)=(G,ρ∘g⁻¹). Provide the adic generic fibre and the truncated reduced subspaces whose isogeny kernel lies in X_b[p^m].

The hypotheses are: Unramified local PEL datum of type (A) or (C) (p = 2 allowed without type D).

([CS17](#ref-cs17), §4.2, Definition 4.2.1, p. 697; [CS17](#ref-cs17), §4.2, Theorem 4.2.2, p. 698.)

The API: `RZSpace`, `RZSpace.represents`, `RZSpace.formallySmooth`, `RZSpace.jAction`, `RZSpace.genericFibre`, `RZSpace.truncated`.

*Needs:* earlier targets of Layer IG.0; AbelianSchemesAndArithmeticModuli A4; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2; SchemeAndStackFoundations SF.4; AdicSpacesPartII F0; AdicSpacesPartII R2; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.

**Checks.**

- For the paired PEL datum GL_n×𝔾_m of type (1,0,…,0), the basic formal space has components indexed by ℤ×ℤ, each Spf W(k)[[u₁,…,u_{n−1}]]. The EL GL_n datum has only the ℤ index.
- Multiplication by p is a positive-height quasi-isogeny, not an isomorphism; imposing isomorphisms changes the functor.
- The formal dimension is ⟨2ρ,μ⟩.

### IG.0.28 Homomorphisms over valuation rings and normal domains

<a id="ig-0-berthelot-without-noetherian"></a>

(1) Let V be a valuation ring of characteristic p with fraction field K, and G, H p-divisible groups over V with constant Newton polygon. Then Hom(G, H) → Hom(G_K, H_K) is a bijection. (2) The same holds for an integral domain R of characteristic p, integrally closed in its fraction field K, in place of V (removing the noetherian hypothesis from Berthelot's theorem).

The hypotheses are: Constant Newton polygon of G and H over Spec V (resp. Spec R).

([CS17](#ref-cs17), §4.2, Lemma 4.2.16, p. 710; [CS17](#ref-cs17), §4.2, Remark 4.2.17, p. 710.)

*Needs:* earlier targets of Layer IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2; Mathlib `ValuationRing`.

### IG.0.29 Constant Newton polygons over perfect rings

<a id="ig-0-constant-newton-polygon-over-perfect-rings"></a>

Let R be a strictly henselian perfect ring with residue field k. In the isogeny categories, reduction G ↦ G_k identifies the constant-Newton-polygon p-divisible groups over R with all p-divisible groups over k. Each object G on the R-side is isogenous to G₀ ×_{𝔽̄_p} R, with G₀ completely slope divisible over 𝔽̄_p. Moreover there is a constant c depending only on the heights such that for every homomorphism ψ_k : G_k → H_k of such groups, p^c ψ_k lifts uniquely to G → H. In particular all automorphisms of X_R for X over 𝔽̄_p are constant.

The hypotheses are: R strictly henselian and perfect; constant Newton polygon.

([CS17](#ref-cs17), §4.3, Lemma 4.3.15, p. 721; [CS17](#ref-cs17), §4.3, Remark 4.3.16, p. 721.)

*Needs:* earlier targets of Layer IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2; Mathlib `PerfectRing`.

### IG.0.30 The quasi-isogeny torsor

<a id="ig-0-quasi-isogeny-torsor"></a>

Let S be a scheme over 𝔽̄_p and X a p-divisible group with PEL extra structures over S such that, for some b ∈ B(G), all geometric fibres of X are quasi-isogenous to X_b compatibly with extra structures. Then there is a natural J_b(ℚ_p)-torsor over S_proét (a torsor under the sheaf of groups attached to the topological group J_b(ℚ_p), in the sense of Bhatt–Scholze) whose fibre at a geometric point x̄ is the set of quasi-isogenies X_x̄ → X_b compatible with extra structures; it depends only on X up to isogeny. If S is connected and locally topologically noetherian, it corresponds to a continuous homomorphism π₁^proét(S, x̄) → J_b(ℚ_p). Applied to A[p^∞] over a Newton stratum S^b, this gives a J_b(ℚ_p)-torsor over S^b.

The hypotheses are: All geometric fibres quasi-isogenous to X_b with extra structures.

([CS17](#ref-cs17), §4.3, Proposition 4.3.13, p. 720.)

*Needs:* earlier targets of Layer IG.0; Mathlib `AlgebraicGeometry.Scheme.proetaleTopology`.

### IG.0.31 Harris–Taylor Newton strata at Drinfeld level

<a id="ig-0-drinfeld-level-newton-strata"></a>

In the setting of Li–Liu §§6–7 (a unitary Shimura variety of signature (1, n−1) at one archimedean place and (0, n) at the others, with Drinfeld level 𝔭^m at a place u of F⁺ split in F, of residue characteristic p), let 𝒳_m be the integral model at Drinfeld level m and Y_m = 𝒳_m ⊗ k. For 0 ≤ j ≤ n − 1 let Y_{m,j} ⊂ Y_m^{red} be the closed locus where the formal part of the one-dimensional O_{F_u}-divisible group A[u^{c,∞}] has height at least j + 1, and Y°_{m,j} = Y_{m,j} ∖ Y_{m,j+1}. Then Y°_{m,j} is smooth over k of pure dimension n − 1 − j, Y_{m,0} = Y_m^{red}, and the strata are stable under the prime-to-p Hecke action.

The hypotheses are: Harris–Taylor type unitary datum with u split in F, Drinfeld level structure at u. The smoothness and dimension statements are those of Harris–Taylor [HT01, Cor. III.4.4] at Drinfeld level.

([lil21](#ref-lil21), Proof of Lemma 7.3 and footnote 14, p. 34.)

The API: `DrinfeldStratum`, `DrinfeldStratum.closed`, `DrinfeldStratum.smooth`, `DrinfeldStratum.hecke`, `DrinfeldStratum.levelZero`.

*Needs:* earlier targets of Layer IG.0.

**Checks.**

- For n=2 the j=1 locus is zero-dimensional and supersingular.
- The j=0 locus is open and dense of dimension n−1.
- For m≥1 the ambient Y_m can be nonreduced; the Newton strata use reduced structures.

### IG.0.32 Constructibility of isomorphism loci

<a id="ig-0-isomorphism-locus-constructible"></a>

Let 𝒢 be a p-divisible group with PEL extra structure over a scheme T of finite type over an algebraically closed field k of characteristic p, and Y a p-divisible group with the same kind of structure over k. The set of points t ∈ T with 𝒢_t̄ ≅ Y ⊗ k(t̄) (compatibly with the extra structure) is constructible, and it is closed in any locally closed subset of T on which the Newton polygon of 𝒢 is constant.

The hypotheses are: T of finite type over k; extra structures of PEL type.

([CSnc](#ref-csnc), §2.2, proof of Lemma 2.2.5, p. 17; [man05](#ref-man05), Proposition 1, §3, p. 7 of the Caltech preprint (proof p. 8).)

*Needs:* earlier targets of Layer IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

### IG.0.33 Refined Drinfeld strata and their closures

<a id="ig-0-refined-drinfeld-strata"></a>

In the Harris–Taylor type setting of [IG.0.31](#ig-0-drinfeld-level-newton-strata) (n arbitrary), for x ∈ Y_m(𝔽̄_p) the group A_x[u^{c,∞}] is a one-dimensional O_{F_u}-divisible group of height n; let 0 ≤ h(x) ≤ n − 1 be the height of its étale part. Y^[h]_m (h(x) ≤ h) is closed and reduced, and Y^(h)_m := Y^[h]_m ∖ Y^[h−1]_m is smooth of pure dimension h. For m ≥ 1, 𝔖^h_m is the set of free O_{F_u}/𝔭_u^m-submodules of (𝔭_u^{−m}/O_{F_u})^n of rank n − h, and Y^(M)_m ⊂ Y^(h)_m (M ∈ 𝔖^h_m) is the open and closed locus where the Drinfeld level structure has kernel M; with Y^[M]_m the scheme-theoretic closure, Y^[M]_m = ⋃_{M ⊆ M′ ∈ 𝔖_m} Y^(M′)_m set-theoretically (display (4.1)). The strata are preserved by Hecke operators away from u.

The hypotheses are: Harris–Taylor type datum with Drinfeld level m ≥ 1 at a split place u.

([lil22](#ref-lil22), §4.3, after Theorem 4.21, p. 58; [lil22](#ref-lil22), §4.3, display (4.1), p. 58.)

The API: `RefinedStratum`, `RefinedStratum.closure`, `RefinedStratum.closure_eq`, `RefinedStratum.decomp`, `RefinedStratum.hecke`.

*Needs:* earlier targets of Layer IG.0.

**Checks.**

- For n=2, 𝔖_m^0 has one element and indexes the supersingular locus.
- For h=n−1, rank-one submodules index the open dense strata.
- When h≥1 a refined stratum need not be closed: its closure contains strata indexed by strict overmodules M′⊋M.

### Examples

For imaginary quadratic F, n = 1 and p split, G_{ℚ_p} ≅ GL_2(ℚ_p) × ℚ_p^× and B(G_{ℚ_p}, μ⁻¹) has two classes: the ordinary one, with d_b = 1, whose central leaf is the open ordinary stratum of the modular-type curve, and the basic one, with d_b = 0, whose leaf is a finite set of supersingular points. In the same case the operator algebra at a split q contains T_{1,v}, T_{2,v} and the inverse T_{2,v^c} of T_{2,v}, while the full algebra contains in addition the similitude unit U_q, which restriction to G⁰ cannot see. For the ordinary class the internal Hom from μ_{p^∞} to ℚ_p/ℤ_p vanishes and the one from ℚ_p/ℤ_p to μ_{p^∞} is μ_{p^∞}, so the fibres of Aut_G(X̃_b) over J_b(ℚ_p) = GL_1(F ⊗ ℚ_p) × ℚ_p^× are one-dimensional perfectoid formal discs Spf W(k)[[x^{1/p^∞}]], matching d_b = 1.

### Dependencies

TauCetiRoadmap ReductiveGroupsPartII, AdelicAlgebraicGroups (Layers 1 and 4) and SmoothRepresentationsOfLocalGroups (SR.1, SR.4); Tau Ceti's Hecke rings and anti-involutions; PELModuli M0–M3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2, R07.6; AbelianSchemesAndArithmeticModuli A4; SchemeAndStackFoundations SF.4; AdicSpacesPartII F0, R2.

## Layer IG.1: Igusa towers, actions and cohomology

Construct the three distinct trivialization spaces before passing to cohomology: the perfect full Igusa variety, Mantovan's finite-level slope tower, and the first-kind Igusa varieties for the Drinfeld datum. Level transition maps, perfection and left/right action comparisons are part of the construction, because the later trace and boundary formulas use their equivariance.

### IG.1.1 Perfect Igusa varieties

<a id="ig-1-perfect-igusa-variety"></a>

Let X be a p-divisible group with G-structure over k = 𝔽̄_p (more generally, with the extra structures of a PEL datum of type (A) or (C), unramified at p, with hyperspecial level), lying in the isogeny class b, and C^X ⊂ S_{K,k} its central leaf. The Igusa variety Ig^X → C^X is the scheme parametrizing isomorphisms ρ : A[p^∞] ≅ X of p-divisible groups with G-structure (respecting the polarizations up to ℤ_p^×). (1) It is representable by an Aut(X)-torsor over C^X, Aut(X) the (generally non-reduced) group scheme of automorphisms of X with G-structure; its restriction to perfect schemes is a pro-étale Γ_X-torsor over (C^X)_perf, Γ_X = Aut(X)(k) profinite. (2) Ig^X is perfect. (3) Equivalently (CS17 Lemma 4.3.4), Ig^X(R) is the set of pairs (A, ρ̃) with A an abelian variety with G-structure over R up to p-power isogeny and ρ̃ : A[p^∞] → X ×_k R a quasi-isogeny respecting the extra structures; hence the formal group Aut_G(X̃) acts on Ig^X through ρ̃, extending the action of Aut(X), and in particular J_b(ℚ_p) = Aut_G(X̃)(k) acts on Ig^X. Ig^X depends only on the isogeny class b (Ig^b := Ig^{X_b}), and G(𝔸_f^p) acts on the tower (Ig^X_{K^p})_{K^p} by prime-to-p Hecke correspondences, commuting with J_b(ℚ_p).

The hypotheses are: PEL datum of type (A) or (C), unramified at p, hyperspecial K_p (for the quasi-split unitary datum: p ∤ NΔ_F). K^p sufficiently small (neat).

([CSnc](#ref-csnc), §2.3, Corollary 2.3.2, p. 18; [CS17](#ref-cs17), §4.3, Corollary 4.3.5, p. 715; [CS17](#ref-cs17), §4.3, Lemma 4.3.4, p. 715.)

The API: `Igusa`, `Igusa.isTorsor`, `Igusa.isPerfect`, `Igusa.isoUpToIsogeny`, `Igusa.jAction`, `Igusa.heckeAction`, `Igusa.ofIsogeny`.

*Needs:* Layer IG.0; Mathlib `PerfectRing`.

**Checks.**

- For ordinary b and p split in F, Γ_b=GL_n(O_F⊗ℤ_p)×ℤ_p^×.
- For imaginary quadratic F, n=1 and basic b, the tower is a profinite torsor over a finite central leaf.
- An infinite Γ_b gives an Igusa variety that is not of finite type.
- Frobenius on Ig^b is an isomorphism.

### IG.1.2 Isogeny invariance and leaf correspondences

<a id="ig-1-igusa-isogeny-invariance"></a>

An isogeny φ : X → X′ of p-divisible groups with G-structure (compatible with the extra structures up to a common similitude scalar) induces an isomorphism Ig^X ≅ Ig^{X′}, equivariant for J_b(ℚ_p) × G(𝔸_f^p) after identifying J_b(ℚ_p) for X and X′ through φ. Hence the perfect Igusa variety Ig^b depends only on the isogeny class b, and there are pro-finite correspondences C^X ← Ig^X ≅ Ig^{X′} → C^{X′} between different leaves in the same Newton stratum. This invariance is for the open Igusa variety; the toroidal statement ([IG.2.11](#ig-2-toroidal-isogeny-invariance)) needs separate hypotheses.

The hypotheses are: φ compatible with the extra structures (O_F-linear, polarizations up to a scalar).

([CSnc](#ref-csnc), §2.3, after Corollary 2.3.2, p. 18.)

*Needs:* earlier targets of Layer IG.1.

### IG.1.3 Mantovan’s finite-level Igusa varieties

<a id="ig-1-mantovan-igusa-variety"></a>

Let X = ⊕_{i=1}^r X_i be completely slope divisible with G-structure over k, with isoclinic X_i of strictly decreasing slopes, and 𝒢 = A[p^∞]|_{C^X}, which is completely slope divisible with slope filtration 𝒢₁ ⊂ … ⊂ 𝒢_r and graded pieces 𝒢^i. The (pro-)Igusa variety Ig^X_Mant → C^X parametrizes over a C^X-scheme T tuples (ρ_i)_{i=1}^r of isomorphisms ρ_i : 𝒢^i ×_{C^X} T ≅ X_i ×_k T compatible with the O_F ⊗ ℤ_p-actions and commuting with the polarizations 𝒢^i → (𝒢^j)^∨ (λ_i + λ_j = 1) up to an element of ℤ_p^×(T) independent of i. For m ≥ 0, Ig^X_{Mant,m} parametrizes isomorphisms ρ_{i,m} : 𝒢^i[p^m] ×_{C^X} T ≅ X_i[p^m] ×_k T that lift fppf locally to every m′ ≥ m and respect the extra structures up to (ℤ/p^m)^×. Then Ig^X_{Mant,m} → C^X is a finite étale Galois cover with group Γ_{m,X} (by [IG.0.21](#ig-0-liftable-automorphisms)), the transition maps are finite étale, and Ig^X_Mant = lim_m Ig^X_{Mant,m} is a pro-finite étale Γ_X-cover of C^X. Each Ig^X_{Mant,m} is smooth over k of dimension d_b. The monoid action in the API uses Mantovan’s right-action convention on the inverse trivializations X_i→𝒢^i; the perfect Igusa action ρ↦jρ is a left action. Thus source δ acts through j=δ^{-1} after perfection.

The right-action monoid S_b consists of δ with δ⁻¹ an isogeny and ker[p^{f_i}]⊆ker(δ_i⁻¹)⊆ker[p^{e_i}] on decreasing slope pieces, with f_i maximal, e_i minimal and f_{i−1}≥e_i. It contains Γ_b, p⁻¹ and inverse slope Frobenius. Put e(δ)=e_1(δ). For m≥e(δ), construct r_δ:Ig_{Mant,m}→Ig_{Mant,m−e(δ)} and prove proj_{m−e(δ)}∘r_δ^{pro}=r_δ∘proj_m. This is level loss, not an action on a fixed finite level.

The hypotheses are: X completely slope divisible with G-structure; C^X the central leaf (smooth, so seminormal).

([CSnc](#ref-csnc), §2.3, Definition 2.3.5, p. 19; [CS17](#ref-cs17), §4.3, Remark 4.3.7, p. 716; [shi09](#ref-shi09), Definition 5.3, §5, p. 16 of the Berkeley preprint; [man05](#ref-man05), Proposition 4, §4, p. 11 of the Caltech preprint; [man05](#ref-man05), §4, definition of S_b on author-copy pp.11–12; Lemma 5 and following paragraph p.12; Lemma 6 p.13.)

The API: `MantovanIgusa`, `MantovanIgusa.finiteEtale`, `MantovanIgusa.transition`, `MantovanIgusa.smooth`, `MantovanIgusa.pro`, `MantovanIgusa.monoidAction`, `MantovanIgusa.levelLoss`, `MantovanIgusa.levelAction`, `MantovanIgusa.monoidAction_toLevel`.

*Needs:* Layer IG.0.

**Checks.**

- For imaginary quadratic F and n=1 the ordinary level-one Igusa curve has group (O_F/p)^××(ℤ/p)^×, including the similitude factor.
- Level zero is the central leaf.
- Trivializing all A[p^m] gives a different functor: it need not be finite étale.
- The level-m group is the image of Aut(X_b) on ⊕_i X_i[p^m].

### IG.1.4 Perfection of Mantovan’s tower

<a id="ig-1-perfection-of-mantovan"></a>

For completely slope divisible X_b in the isogeny class b, the natural map P:Ig^b→Ig^b_Mant=lim_m Ig^b_{Mant,m} identifies the perfect scheme Ig^b with the perfection of Ig^b_Mant. Consequently H^i(Ig^b,ℤ/ℓ^n)=colim_m H^i(Ig^b_{Mant,m},ℤ/ℓ^n) and H^i_c(Ig^b,ℤ/ℓ^n)=colim_m H^i_c(Ig^b_{Mant,m},ℤ/ℓ^n) for ℓ≠p. Write a_j for the perfect left action ρ↦jρ and r_δ for Mantovan’s source right action of δ∈S_b. The geometric compatibility is P∘a_{δ^{-1}}=r_δ∘P. Using inverse pullback a_{j^{-1}}^* to turn a geometric left action into a left action on cohomology, the resulting J_b(ℚ_p)-cohomology action agrees with Mantovan’s action r_δ^* on S_b.

The hypotheses are: X_b completely slope divisible; ℓ ≠ p.

([CS17](#ref-cs17), §4.3, Proposition 4.3.8, p. 717; [CSnc](#ref-csnc), §2.3, Remark 2.3.7, p. 20; [man05](#ref-man05), §4, Lemma 5 p.12 and the cohomology action on pp.13–14 of the author copy.)

The API: `perfectionOfMantovan`.

*Needs:* earlier targets of Layer IG.1; Layer IG.0.

### IG.1.5 Faithful flatness of Ig^b→C^b

<a id="ig-1-igusa-faithfully-flat"></a>

The map Ig^b → C^b is faithfully flat. Since it is a quasi-torsor under the group scheme Aut(X_b) of automorphisms of X_b respecting the extra structures, it is an fpqc Aut(X_b)-torsor. This torsor is distinct from the pro-étale Γ_X-torsor Ig^b → (C^b)_perf: Aut(X_b) is highly non-reduced (like Spec k[[x₁^{1/p^∞}, …, x_d^{1/p^∞}]]/(x₁, …, x_d)) when X_b is not isoclinic, while Γ_X = Aut(X_b)(k) is profinite.

The hypotheses are: X_b completely slope divisible.

([CS17](#ref-cs17), §4.3, Corollary 4.3.9, p. 718.)

*Needs:* earlier targets of Layer IG.1; Layer IG.0.

### IG.1.6 Group actions, scalar kernel and stabilizers

<a id="ig-1-igusa-group-actions"></a>

Let Ig^b_{K^p} be the perfect Igusa variety at prime-to-p level K^p⊂G(𝔸_f^p) and Ig^b_∞=lim_{K^p}Ig^b_{K^p}. Use the geometric left action of J_b(ℚ_p)×G(𝔸_f^p): (j,h) sends (A,ρ̃,η) to (A,j∘ρ̃,η∘h^{-1}) in the moduli description up to p-power isogeny. The finite Hecke correspondence labelled g in [IG.1.1](#ig-1-perfect-igusa-variety) uses η↦η∘g; the left tower action at h therefore uses the correspondence labelled h^{-1}. The action is continuous in the tower sense: for each compact open K^p and m, ker(Γ_{X_b}→Γ_{m,X_b})×K^p fixes the corresponding finite-level projection. The diagonally embedded scalars ℤ[1/p]^×={±p^e} act trivially: (z,z) sends (ρ̃,η) to (zρ̃,ηz^{-1}), and [z^{-1}]:A→A identifies this pair with the original one in the moduli problem up to p-power isogeny. Thus the action factors through the quotient by this diagonal subgroup; no faithfulness of that quotient action is claimed. On cohomology inverse pullback gives a smooth left J_b(ℚ_p)×G(𝔸_f^p)-representation.

Provide the level quotient Ig^b_{K^p}=Ig^b_∞/K^p. Projection stabilizers are open; point stabilizers need not be open.

The hypotheses are: K^p neat; ℓ ≠ p for the statements on cohomology.

([CS17](#ref-cs17), §4.3, after Proposition 4.3.8, p. 718; [cs17](#ref-cs17), Definition 4.3.1 and Lemma 4.3.4, published pp.715–716; [man05](#ref-man05), §4, prime-to-p Hecke action on author-copy p.13.)

The API: `IgusaTower.action`, `IgusaTower.stabilizer_open`, `IgusaTower.levelQuotient`, `IgusaTower.globalUnits_trivial`, `IgusaTower.hecke_compat`.

*Needs:* earlier targets of Layer IG.1.

**Checks.**

- For ordinary b and p split in F, J_b(ℚ_p)=GL_n(F⊗ℚ_p)×ℚ_p^×.
- For neat normal tame K^p⊂K^{p′}, the transition is finite étale Galois with group K^{p′}/K^p; equal levels give the identity.
- The scalar pair (p,p) fixes every point.
- The induced cohomology representation is smooth.

### IG.1.7 Igusa cohomology complexes

<a id="ig-1-igusa-cohomology"></a>

For ℓ ≠ p and Λ ∈ {ℤ/ℓ^n, 𝔽_ℓ, ℤ_ℓ, ℚ_ℓ, ℚ̄_ℓ}, define RΓ_c(Ig^b_∞, Λ) := colim_{K^p, m} RΓ_c(Ig^b_{Mant,K^p,m}, Λ) and RΓ(Ig^b_∞, Λ) := colim_{K^p, m} RΓ(Ig^b_{Mant,K^p,m}, Λ) (for ℤ_ℓ, ℚ_ℓ take the derived limit over n of the torsion coefficients at each finite level first), with transition maps the pullbacks along the finite étale transition maps. They are complexes of smooth Λ[J_b(ℚ_p) × G(𝔸_f^p)]-modules; at each finite level H^i_c(Ig^b_{Mant,K^p,m}, Λ) is finitely generated over Λ and vanishes outside [0, 2d_b]. Coefficient change holds: RΓ_c(·, ℤ/ℓ^n) ⊗^L_{ℤ/ℓ^n} 𝔽_ℓ ≅ RΓ_c(·, 𝔽_ℓ). The integral complex is defined by this colimit; no rational virtual-character formula enters its definition. The full algebra 𝕋^S_full of IG.0.4 (S ⊃ {p, ℓ} ∪ bad primes) acts through the G(𝔸_f^S)-action, hence so does the operator algebra 𝕋^S, and H^i(Ig^b, 𝔽_ℓ)_𝔪 denotes the localization at a maximal ideal 𝔪 of either ring at fixed tame level K^p(N). With torsion coefficients the cohomology at fixed tame level is the colimit over m of finite Hecke modules, so it is locally finite and IG.0.5 relates the two localizations.

The map RΓ_c→RΓ is equivariant for the commuting actions and Hecke localization.

The hypotheses are: ℓ ≠ p; K^p neat.

([CSnc](#ref-csnc), §2.8, Proposition 2.8.2, p. 34; [CS17](#ref-cs17), §4.3, after Proposition 4.3.8, p. 718.)

The API: `IgusaCohomology.compactSupport`, `IgusaCohomology.ordinary`, `IgusaCohomology.smooth`, `IgusaCohomology.finite_level`, `IgusaCohomology.changeCoeff`, `IgusaCohomology.heckeAction`, `IgusaCohomology.forgetToCompact`.

*Needs:* earlier targets of Layer IG.1; EtaleDualityAndPerverseSheaves EDC.0; Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.2; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0d.

**Checks.**

- Over a finite basic central leaf, H_c is zero outside degree zero; H_c^0 is smoothly induced from the trivial representation.
- For ordinary finite levels of dimension d, H_c^i=0 for i>2d.
- The alternating virtual class does not determine the graded cohomology.
- Perfect Igusa cohomology is the colimit of the Mantovan-level cohomologies.

### IG.1.8 Alternating cohomology and its S-unramified part

<a id="ig-1-alternating-igusa-cohomology"></a>

Fix b and X_b. Define [H_c(Ig^b, ℚ̄_ℓ)] := Σ_k (−1)^k colim_{K^p, m} H^k_c(Ig^b_{Mant,K^p,m}, ℚ̄_ℓ) ∈ Groth(G(𝔸_f^p) × J_b(ℚ_p)), a virtual admissible representation: every π ∈ Groth(G(𝔸_f^p) × J_b(ℚ_p)) is a possibly infinite sum Σ n_i π_i of irreducibles such that for each compact open K only finitely many i have n_i ≠ 0 and π_i^K ≠ 0. For a finite set S of places containing p, ∞ and the ramified places and K^S = ∏_{q∉S} K_q hyperspecial, π^{S-ur} := Σ_{i : π_i^{K^S} ≠ 0} n_i π_i. The trace pairing with C^∞_c(G(𝔸_f^p) × J_b(ℚ_p)) determines an element of Groth by its traces; the S-unramified part carries an action of the full algebra 𝕋^S_full through characters.

The hypotheses are: ℓ ≠ p; each H^k_c at each finite level is finite-dimensional, so the limits are admissible.

([CS17](#ref-cs17), §5.2, p. 731.)

The API: `AltIgusaCohomology`, `AltIgusaCohomology.admissible`, `AltIgusaCohomology.trace`, `AltIgusaCohomology.unramifiedPart`, `AltIgusaCohomology.ext_trace`.

*Needs:* earlier targets of Layer IG.1; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.2; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0d.

**Checks.**

- For a finite basic central leaf the virtual class is the actual H_c^0 representation.
- Its trace is additive and the zero class has trace zero.
- Equal multiplicities in adjacent degrees cancel in the virtual class.

### IG.1.9 Harris–Taylor Igusa varieties of the first kind

<a id="ig-1-harris-taylor-igusa-varieties"></a>

In the Harris–Taylor setting, I_{m,j} → Y°_{0,j} is the finite étale Igusa variety of the first kind trivializing the level-m étale part of A[u^{c,∞}], of étale height n−1−j. It does not trivialize the formal part. The stratum Y°_{m,j} is a finite disjoint union of copies of I_{m,j}; Mantovan’s cover I^j_{Mant,m} → I_{m,j} adds the trivialization of the formal part, and the perfect Igusa variety is the perfection of its inverse-limit tower.

The hypotheses are: Harris–Taylor type unitary datum; Drinfeld level at u.

([lil21](#ref-lil21), Proof of Lemma 7.3 and footnote 15, p. 35.)

The API: `IgusaFirstKind`, `IgusaFirstKind.finiteEtale`, `IgusaFirstKind.stratum_decomp`, `IgusaFirstKind.mantovanCover`.

*Needs:* Layer IG.0; earlier targets of Layer IG.1.

**Checks.**

- For n=2, j=0 the finite-level Igusa variety is an ordinary curve.
- I_0^j=Y_0^{∘,j}.
- For j<n−1 these finite-level smooth varieties have positive dimension and are not perfect.

### IG.1.10 Smooth closures of refined strata

<a id="ig-1-refined-strata-closures-smooth"></a>

For m ≥ 1, 0 ≤ h ≤ n − 1 and M ∈ 𝔖^h_m, the closure Y^[M]_m is smooth (and proper) over k of pure dimension h (Mantovan [Man08, Prop. 12]), and Y^(M)_m is isomorphic as a k-scheme (not over Y^(h)_0) to the Harris–Taylor Igusa variety of the first kind I^h_m. Here h is the étale height, while the first-kind index j in [IG.1.9](#ig-1-harris-taylor-igusa-varieties) is the formal height minus one: j=n−1−h. Thus I^h_m=I_{m,n−1−h}.

The hypotheses are: Harris–Taylor type datum with Drinfeld level m ≥ 1 at u; the comparison of Mantovan's integral model with Li–Liu's X_m is part of the claim.

([lil22](#ref-lil22), Li–Liu II §4.3, p.60 for the isomorphism with I^h_m as a k-scheme; proof of Proposition4.25, p.62 for smoothness; proof of Theorem4.21, p.63; introduction p.7; [man08](#ref-man08), Proposition 12, author-copy p.12; [man08](#ref-man08), §4.2.4, author-copy p.22.)

*Needs:* Layer IG.0; earlier targets of Layer IG.1.

### Examples

For the ordinary class and p split in F, Γ_b = GL_n(O_F ⊗ ℤ_p) × ℤ_p^× and the level-one Mantovan Igusa variety over the ordinary leaf is a finite étale Galois cover with group (O_F/p)^× × (ℤ/p)^× when F is imaginary quadratic and n = 1. For the basic class in that case the leaf is finite and H^0_c of the perfect Igusa variety is the smooth induction of the trivial representation, concentrated in degree zero; its virtual class is the actual representation.

### Dependencies

Layer IG.0; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0, SR.0d, SR.2; EtaleDualityAndPerverseSheaves EDC.0.

## Layer IG.2: Partial compactifications and cusp geometry

Well-positioned subsets allow central leaves to meet the ambient toroidal boundary through explicit lower-dimensional PEL data. Connected and biconnected trivializations extend the Igusa tower. Ekedahl–Oort geometry gives the affine minimal compactification needed for Artin vanishing. For a general representative, the affineness transfer uses the unit-similitude toroidal extension specified below; the minimal representative has the separate direct Ekedahl–Oort route. Existence of a completely slope-divisible minimal representative with G-structure is a required input, not a consequence of the existence of a fundamental element alone.

### IG.2.1 Well-positioned subsets

<a id="ig-2-well-positioned-subscheme"></a>

A locally closed subset Y ⊆ S_k is well-positioned if there is a family Y^♮ = {Y^♮_Z} indexed by the cusp labels Z at level K such that (1) each Y^♮_Z is a locally closed subset of the boundary Shimura variety S_{Z,k}, and (2) for every complete algebraically closed nonarchimedean C over k and every x = (A, ι, λ, η) ∈ S_k(C) degenerating into the cusp Z, with Raynaud extension 0 → T → G → B → 0 over O_C, x lies in Y if and only if the point π(x) = (B, …) ∈ S_{Z,k}(C) lies in Y^♮_Z. Equivalently (Lan–Stroh), for every affine open Spf R of the formal chart 𝔛°_σ of the toroidal boundary, Y ×_S W⁰ = Y^♮_Z ×_{S_Z} W⁰ with W⁰ ⊂ Spec R the preimage of the interior. The notion is independent of Σ, agrees with Boxer's [Box15, Def. 3.4.1] when good integral models exist, and is preserved by the prime-to-p Hecke correspondences that extend to the compactifications.

Work in the smooth toroidal setting.

([CSnc](#ref-csnc), §3.1, Definition 3.1.1, p. 37; [CSnc](#ref-csnc), §3.1, Remark 3.1.2, p. 38.)

The API:

- `IsWellPositioned`: The stated boundary-chart condition.
- `IsWellPositioned.boundaryData`: The unique boundary subsets Y^♮_Z.
- `isWellPositioned_iff_chart`: The chart identity Y×_S W⁰=Y^♮_Z×_{S_Z}W⁰.
- `IsWellPositioned.indep_cone`: Independence of Σ.
- `IsWellPositioned.hecke`: Preservation by prime-to-p Hecke images.
- `IsWellPositioned.closure`: Stability under closure and the boundary complement Y₀.

*Needs:* Layer IG.0; ShimuraCompactifications C1; ShimuraCompactifications C4; NeronModelsAndSemistableAbelianVarieties R11.3; ShimuraCompactifications C5; ShimuraCompactifications C0; ShimuraCompactifications C3.

**Checks.**

- S_k itself is well-positioned, with Y^♮_Z = S_{Z,k} for every cusp label Z.
- The empty set is well-positioned with all Y^♮_Z empty.
- The ordinary locus of S_k is well-positioned, with Y^♮_Z the ordinary locus of S_{Z,k}.
- For n = 1 and [F⁺:ℚ] = 2, let Y ⊂ S_k be a closed curve with empty interior whose closure in S^*_k meets a proper cusp Z (positive torus rank; the open cusp is excluded). Then Y is not well-positioned: the boundary Shimura variety at Z is zero-dimensional, and the well-positioned condition would require Y to contain the full punctured boundary chart whenever its boundary datum there is nonempty.

### IG.2.2 Partial toroidal and minimal compactifications

<a id="ig-2-partial-compactifications"></a>

Let Y ⊂ S_k be well-positioned, Ỹ its closure in S_k and Y₀ = Ỹ ∖ Y. Let Ỹ^* and Y^*₀ (resp. Ỹ^tor, Y^tor₀) be the closures of Y and Y₀ in the minimal compactification S^*_k (resp. in the toroidal compactification S^tor_{K,Σ,k}). The partial minimal and partial toroidal compactifications are Y^* := Ỹ^* ∖ Y^*₀ and Y^tor := Ỹ^tor ∖ Y^tor₀, locally closed in S^*_k and S^tor_k with their reduced structures. They satisfy Y^* ×_{S^*_k} S_{Z,k} = Y^♮_Z for every cusp label Z, Y^tor is the preimage of Y^* under π : S^tor → S^*, the map Y^tor → Y^* is proper and surjective with π_*O = O after normalization, and Y^tor (resp. Y^*) is stratified by the (Z, [σ]) (resp. Z) as S^tor (resp. S^*) is.

Prove compatibility with Hecke correspondences and refinements of the cone decomposition.

Work in the smooth toroidal setting. The further hypotheses are: Y well-positioned.

([CSnc](#ref-csnc), §3.1, p. 38; [ls18a-author](#ref-ls18a-author), Theorem 2.3.2 with display (2.3.3), author-copy pp.17–19; Definition 2.3.1, pp.16–17.)

The API: `partialMinimal`, `partialToroidal`, `partialToroidal_eq_preimage`, `partialMinimal_inter_boundary`, `partialToroidal_to_partialMinimal_proper`, `partialCompactification_hecke`.

*Needs:* earlier targets of Layer IG.2; ShimuraCompactifications C5; ShimuraCompactifications C3.

**Checks.**

- For Y=S both partial compactifications are the ambient compactifications.
- The ordinary minimal partial compactification is the Hasse nonvanishing locus.
- For nonclosed Y one must remove the closure of Y₀; the full closure alone is too large. For closed Y they agree.
- Intersecting Y^* with the interior recovers Y.

### IG.2.3 Lan–Stroh boundary charts

<a id="ig-2-lan-stroh-boundary-charts"></a>

Let Y ⊂ S_k be well-positioned and Z a cusp label. The formal completion of Y^tor along its Z-stratum is canonically isomorphic to the Γ_Z-quotient of the formal completion of Ξ_{Z,Σ_Z} ×_{S_Z} Y^♮_Z along its toroidal boundary ∂_{Z,Σ_Z} ×_{S_Z} Y^♮_Z, compatibly with the corresponding description of Ŝ^tor_Z in ShimuraCompactifications C5. If Y is smooth (resp. regular), so is Y^tor.

Work in the smooth toroidal setting. The further hypotheses are: Y well-positioned; Σ smooth with trivial stabilizers.

([CSnc](#ref-csnc), §3.2, p. 41 (citing [LS18a, Thm 2.3.2(5)]).)

*Needs:* earlier targets of Layer IG.2; ShimuraCompactifications C5; ShimuraCompactifications C4; NeronModelsAndSemistableAbelianVarieties R11.3.

### IG.2.4 Closed partial minimal compactifications

<a id="ig-2-partial-minimal-closed"></a>

Let Y ⊂ Y′ ⊂ S_k be well-positioned locally closed subsets with Y closed in Y′. Then Y^* is a closed subset of Y′^*, and Y^♮_Z is closed in Y′^♮_Z for every cusp label Z.

Work in the smooth toroidal setting.

([CSnc](#ref-csnc), §3.1, Proposition 3.1.3, p. 38.)

*Needs:* earlier targets of Layer IG.2.

### IG.2.5 Well-positioned central leaves

<a id="ig-2-leaves-are-well-positioned"></a>

For every p-divisible group X with G-structure over k, the central leaf C^X ⊂ S_k is well-positioned. For a cusp label Z = (Z_N, X) (X of O_F-rank r), (C^X)^♮_Z is the central leaf C^{X_Z}_Z of S_{Z,k} for the unique p-divisible group X_Z with G-structure (for the group with n replaced by n − r) such that X ≅ Hom(X, μ_{p^∞}) ⊕ X_Z ⊕ X ⊗ ℚ_p/ℤ_p, or empty if no such X_Z exists. Writing C^X_Z := C^{X,*} ×_{S^*} S_Z, this identifies C^X_Z = C^{X_Z}_Z. The partial toroidal compactification C^{X,tor} is a smooth variety over k.

Work in the smooth toroidal setting.

([CSnc](#ref-csnc), §3.1, Proposition 3.1.4, p. 38; [CSnc](#ref-csnc), §3.1, Lemma 3.1.5, p. 39.)

*Needs:* earlier targets of Layer IG.2; Layer IG.0; ShimuraCompactifications C4; NeronModelsAndSemistableAbelianVarieties R11.3.

### IG.2.6 Connected and biconnected boundary groups

<a id="ig-2-connected-part-at-boundary"></a>

Let 𝒜 be the semi-abelian scheme over C^{X,tor} (restriction of the universal one over S^tor). For m ≥ 1 the groups 𝒜[p^m] are quasi-finite flat; across a nonempty degenerating boundary they are not finite flat and 𝒜[p^∞] is not a p-divisible group. If the boundary is empty, this obstruction does not occur. In either case, its connected part 𝒜[p^∞]° (the ind-scheme 𝒜̂[p^∞] of the formal completion along the identity) is a p-divisible group over C^{X,tor} with O_F-action, geometrically isomorphic at every point to X° = Hom(X, μ_{p^∞}) ⊕ X°_Z. Its multiplicative part 𝒜[p^∞]^μ has constant rank, and the biconnected part 𝒜[p^∞]^{(0,1)} = 𝒜[p^∞]°/𝒜[p^∞]^μ carries a principal polarization extending the one over C^X.

Work in the smooth toroidal setting.

([CSnc](#ref-csnc), §3.2, Proposition 3.2.1, p. 39; [CSnc](#ref-csnc), §3.2, Proposition 3.2.2, p. 40.)

*Needs:* earlier targets of Layer IG.2; ShimuraCompactifications C4; NeronModelsAndSemistableAbelianVarieties R11.3; AdicSpacesPartII F0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.

### IG.2.7 Finite-level toroidal Igusa varieties

<a id="ig-2-toroidal-igusa-finite-level"></a>

Let X = ⊕ X_i be completely slope divisible with G-structure. (1) The finite étale Γ_{m,X}-cover Ig^X_{Mant,m} → C^X extends uniquely to a finite étale cover Ig^{X,tor}_m → C^{X,tor}, Galois with group Γ_{m,X}. It represents Igusa level-p^m structures on C^{X,tor}-schemes T: for each i with λ_i > 0, an isomorphism ρ_{i,m} : 𝒜[p^∞]_i[p^m] ×T ≅ X_i[p^m] × T commuting with O_F and lifting fppf locally to all p^{m′}, together with a scalar in (ℤ/p^m)^×(T) such that ρ_{i,m}, ρ_{j,m} commute with the polarizations up to that scalar whenever λ_i + λ_j = 1. (2) With the splitting of Z_N of ShimuraCompactifications C5 fixed, for each cusp label Z the formal completion of Ig^{X,tor}_m along its Z-stratum is canonically isomorphic to 𝔜_{Z,Σ_Z}/Γ_Z, where 𝔜_{Z,Σ_Z} is the completion along the boundary of the Γ_{m,X}-torsor Ig^X_{Z,Σ_Z} → Ξ_{Z,Σ_Z} ×_{S_Z} C^X_Z defined by Igusa level structures on the completely slope divisible connected part H_Z of the Raynaud extension G_Z over C_Z ×_{S_Z} C^X_Z.

Work in the smooth toroidal setting. The further hypotheses are: X completely slope divisible with G-structure.

([CSnc](#ref-csnc), §3.2.3, Theorem 3.2.4, p. 40; [CSnc](#ref-csnc), §3.2.3, Theorem 3.2.6, p. 41.)

The API: `ToroidalIgusa`, `ToroidalIgusa.represents`, `ToroidalIgusa.restrict_open`, `ToroidalIgusa.unique`, `ToroidalIgusa.boundaryChart`, `ToroidalIgusa.transition`.

*Needs:* Layer IG.1; earlier targets of Layer IG.2; Layer IG.0.

**Checks.**

- Level zero is C^{X,tor}.
- If X has no étale part there is no boundary and the tower is Mantovan’s.
- The imaginary quadratic n=1 ordinary level-one tower is a curve with cusps, finite étale over the compactified leaf.
- At a toric degeneration, trivializing all torsion fails to give this finite étale functor; use connected torsion and a common similitude scalar.

### IG.2.8 Perfect toroidal Igusa varieties

<a id="ig-2-perfect-toroidal-igusa-variety"></a>

For any p-divisible group X with G-structure over k (not necessarily completely slope divisible), the pro-finite étale Γ_X-cover Ig^X → C^X_perf extends uniquely to a pro-finite étale cover Ig^{X,tor} → C^{X,tor}_perf, Galois with group Γ_X. It represents perfect Igusa level structures on perfect C^{X,tor}-schemes T: an O_F-linear isomorphism ρ : 𝒜[p^∞]° ×T ≅ X° × T together with a scalar in ℤ_p^×(T) such that the induced isomorphism of biconnected parts ρ^{(0,1)} commutes with the polarizations up to that scalar. If X is completely slope divisible, Ig^{X,tor} is the perfection of lim_m Ig^{X,tor}_m. Ig^X is an fpqc Aut(X)-torsor over C^X before perfection, but this fails over the toroidal boundary strata.

Work in the smooth toroidal setting.

([CSnc](#ref-csnc), §3.2.7, Theorem 3.2.8, p. 42; [CSnc](#ref-csnc), §3.2.7, Remark 3.2.10, p. 42.)

The API: `PerfectToroidalIgusa`, `PerfectToroidalIgusa.represents`, `PerfectToroidalIgusa.restrict_open`, `PerfectToroidalIgusa.eq_perf_lim`, `PerfectToroidalIgusa.action`.

*Needs:* Layer IG.1; earlier targets of Layer IG.2; Layer IG.0; Mathlib `PerfectRing`.

**Checks.**

- If X has no étale part, Ig^{X,tor}=Ig^X.
- At an ordinary modular cusp the Γ_b-torsor trivializes the multiplicative connected part and includes the common ℤ_p^× scalar.
- With ordinary cusps present, the boundary is not an fpqc Aut(X)-torsor trivializing the entire p-divisible group.

### IG.2.9 Toroidal Igusa boundary charts

<a id="ig-2-igusa-boundary-charts"></a>

(1) The Γ_X-torsor C^{Ig,X}_Z → (C_Z ×_{S_Z} C^X_Z)_perf parametrizing O_F-linear isomorphisms H_Z ≅ X° with a ℤ_p^×-scalar compatible on biconnected parts is the perfect scheme parametrizing (B, ι, λ, η) ∈ S_Z, an extension 0 → T → G → B → 0 by the split torus with cocharacter group X, and an O_F-linear embedding ρ : G[p^∞] ↪ X such that T[p^∞] ⊂ G[p^∞] ⊂ X is symplectic and B[p^∞] = G[p^∞]/T[p^∞] ≅ Gr_{−1} compatibly with principal polarizations. (2) The 𝐒_{Z,perf}-torsor Ξ^{Ig,X}_Z → C^{Ig,X}_Z is the perfection of the 𝐒_Z-torsor of symmetric lifts f : X → G of f₀ : X → B^∨ ≅ B; after choosing a symplectic splitting δ_X of the filtration of X, it parametrizes symmetric lifts f̃ : X[1/p] → G of the induced f̃₀ : X[1/p] → B. (3) With the splitting of Z_N fixed, the completion of Ig^{X,tor} along its Z-stratum is canonically isomorphic to 𝔜_{Z,Σ_Z}/Γ_Z, 𝔜_{Z,Σ_Z} the completion of Ξ^{Ig,X}_{Z,Σ_Z} := Ξ^{Ig,X}_Z ×_{Ξ_Z} Ξ_{Z,Σ_Z} along its toroidal boundary.

Work in the smooth toroidal setting.

([CSnc](#ref-csnc), §3.2.7, Proposition 3.2.11, p. 43; [CSnc](#ref-csnc), §3.2.7, Theorem 3.2.13, p. 44.)

*Needs:* earlier targets of Layer IG.2; Layer IG.0; ShimuraCompactifications C4; NeronModelsAndSemistableAbelianVarieties R11.3.

### IG.2.10 Unit-similitude quasi-isogenies

<a id="ig-2-unit-similitude-quasi-isogeny"></a>

Assume p splits in the imaginary quadratic F₀ ⊂ F. Let X, X′ be p-divisible groups with G-structure over k in the same isogeny class b. Then there is a G-quasi-isogeny φ : X′ → X with similitude factor 1 that restricts to isomorphisms X′^{ét} ≅ X^{ét} and X′^μ ≅ X^μ.

The hypotheses are: p split in F₀ (so G_{ℚ_p} ≅ ℚ_p^× × ∏_{v|𝔭} GL_{2n}(F_v) for 𝔭 a prime of F₀ above p).

([CSnc](#ref-csnc), §3.3.1, footnote 15, p. 45.)

*Needs:* Layer IG.0.

### IG.2.11 Toroidal isogeny invariance

<a id="ig-2-toroidal-isogeny-invariance"></a>

Let φ : X → X′ be a quasi-isogeny of p-divisible groups with G-structure over k, with similitude factor in ℤ_p^×, inducing isomorphisms on étale and multiplicative parts. Then the isomorphism Ig^X ≅ Ig^{X′} induced by φ ([IG.1.2](#ig-1-igusa-isogeny-invariance)) extends uniquely to an isomorphism Ig^{X,tor} ≅ Ig^{X′,tor} over the correspondence of partial toroidal compactifications, equivariantly for the prime-to-p Hecke action. This is the unit-similitude extension theorem required for the transfer arguments below; its proof must construct a principally polarized boundary quotient and establish compatibility with the interior isomorphism.

Work in the smooth toroidal setting. The further hypotheses are: φ a G-quasi-isogeny with unit similitude, isomorphism on X^{ét} and X^μ.

([CSnc](#ref-csnc), §3.2.7, before Corollary 3.2.14, p. 44; [CSnc](#ref-csnc), §3.2.7, Corollary 3.2.14, p. 44.)

*Needs:* earlier targets of Layer IG.2; Layer IG.1.

### IG.2.12 Ekedahl–Oort strata and Hasse sections

<a id="ig-2-ekedahl-oort-stratification"></a>

For the PEL datum of IG.0 at p unramified, the p-torsion A[p] of the universal abelian scheme over S_k with its O_F-action and polarization defines an F-zip with G-structure (Moonen–Wedhorn; Pink–Wedhorn–Ziegler), hence a morphism ζ : S_k → [E_𝒵\G_k] to the stack of G-zips, which is smooth. The Ekedahl–Oort strata S^w, w ∈ ^JW (minimal-length coset representatives for the Weyl group of the Levi of μ), are the locally closed fibres of ζ over the points of [E_𝒵\G_k]; dim S^w = ℓ(w). Each stratum closure carries Hasse sections: sections of a power of the Hodge line bundle ω^{⊗N} on the closure of S^w whose non-vanishing locus is exactly S^w (Boxer; Goldring–Koskivirta). EO strata extend to the toroidal and minimal compactifications as well-positioned subsets, and the Hasse sections extend to S^* using the ample Hodge line bundle there.

The zip morphism is smooth and each nonempty stratum has dimension ℓ(w). Its Hasse section cuts out the stratum inside its closure; for the ordinary stratum use a matching positive power of the classical Hasse invariant.

Work in the smooth toroidal setting. The further hypotheses are: PEL datum of type (A) or (C) unramified at p (here the quasi-split unitary datum).

([CSnc](#ref-csnc), §3.3.1, proof of Theorem 3.3.2, p. 45; [box15](#ref-box15), Theorem C, p. 17 (§1.5 of the Introduction; with Theorem B, p. 17); in the text Theorem 6.2.3 and Corollary 6.2.4, p. 190; [ls18a-author](#ref-ls18a-author), Proposition3.5.1(3)–(4), p.41; Proposition3.5.5 and Corollary3.5.8, pp.41–42 (84-page current author copy).)

The API: `ekedahlOortStratum`, `ekedahlOortStratum_dim`, `zipMorphism_smooth`, `hasseSection`, `ekedahlOortStratum_wellPositioned`, `ekedahlOortStratum_ordinary`.

*Needs:* Layer IG.0; earlier targets of Layer IG.2; HodgeTateAndCanonicalSubgroups T0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2; ShimuraCompactifications C5.

**Checks.**

- For imaginary quadratic F and n=1 the two EO strata have dimensions one and zero.
- The longest label is open and dense.
- Different zip labels give disjoint strata.
- An ordinary Hasse section has weight a positive multiple of p−1; its nonvanishing locus is ordinary.

### IG.2.13 Affineness of partial minimal EO strata

<a id="ig-2-eo-strata-minimal-affine"></a>

For every w ∈ ^JW, the partial minimal compactification (S^w)^* of the Ekedahl–Oort stratum S^w (a well-positioned subset) is affine.

Work in the smooth toroidal setting.

([box15](#ref-box15), Theorem C, p. 17 (§1.5 of the Introduction; with Theorem B, p. 17); in the text Theorem 6.2.3 and Corollary 6.2.4, p. 190; [CSnc](#ref-csnc), §3.3.1, proof of Theorem 3.3.2, p. 45.)

*Needs:* earlier targets of Layer IG.2; ShimuraCompactifications C5.

### IG.2.14 A central-leaf EO stratum in each Newton stratum

<a id="ig-2-fundamental-eo-stratum-in-newton-stratum"></a>

For every b ∈ B(G_{ℚ_p}, μ^{−1}) there is an EO label w ∈ ^JW whose associated affine Weyl representative is fundamental such that the Ekedahl–Oort stratum S^w is contained in the Newton stratum S^b; for such w, the p-divisible groups with G-structure at the points of S^w are all isomorphic, so S^w is a central leaf C^{X_w} with X_w the minimal p-divisible group with G-structure in the class b.

The hypotheses are: PEL datum of type (A) or (C) unramified at p (Nie's results are for unramified groups with minuscule μ).

([nie15](#ref-nie15), Proposition 1.5, p. 3 (arXiv:1310.2229v2; proof on p. 12); [nie15](#ref-nie15), Corollary 1.6, p. 4 (arXiv:1310.2229v2); [nie15](#ref-nie15), Theorem1.4, p.3 (arXiv:1310.2229v2), with Corollary1.6 p.4.)

*Needs:* earlier targets of Layer IG.2; Layer IG.0.

### IG.2.15 Transfer of affineness

<a id="ig-2-affineness-transfer-lemma"></a>

Consider schemes X ← C → Y with maps π₁, π₂, and closed subschemes X₀ ⊂ X, C₀ ⊂ C, Y₀ ⊂ Y with C₀ topologically the preimage of both X₀ and Y₀. Assume X, X₀ and Y₀ are affine, and π₁, π₂ are proper, surjective and finite away from C₀. Then Y is affine.

The hypotheses are: π₁, π₂ proper surjective, finite away from C₀; X, X₀, Y₀ affine.

([CSnc](#ref-csnc), §3.3.1, Lemma 3.3.3, p. 46.)

The API: `isAffine_of_transfer`.

*Needs:* Mathlib `AlgebraicGeometry.IsAffine`; Mathlib `AlgebraicGeometry.IsProper`; Mathlib `AlgebraicGeometry.IsFinite`; Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`.

### IG.2.16 Affineness of partial minimal leaves

<a id="ig-2-leaf-minimal-compactification-affine"></a>

The affineness target for a p-divisible group X with G-structure has the following two forms: (1) for X = X_w the minimal p-divisible group of a fundamental element ([IG.2.14](#ig-2-fundamental-eo-stratum-in-newton-stratum)), C^{X,*} is affine unconditionally; (2) for an arbitrary X in the same isogeny class, C^{X,*} is affine provided there is a unit-similitude G-quasi-isogeny X_w → X that is an isomorphism on étale and multiplicative parts ([IG.2.10](#ig-2-unit-similitude-quasi-isogeny), available for p split in F₀) and the toroidal invariance [IG.2.11](#ig-2-toroidal-isogeny-invariance) holds for it.

Work in the smooth toroidal setting.

([CSnc](#ref-csnc), §3.3.1, Theorem 3.3.2, p. 45; [CSnc](#ref-csnc), §3.3.1, proof of Theorem 3.3.2, p. 45.)

*Needs:* earlier targets of Layer IG.2.

### IG.2.17 Perfect minimal Igusa varieties

<a id="ig-2-perfect-minimal-igusa"></a>

Define Ig^{X,*} as the normalization of C^{X,*} in the perfect Igusa variety Ig^X. Then Ig^{X,*} → C^{X,*} is integral, so Ig^{X,*} is affine when C^{X,*} is; it agrees with the Stein factorization of Ig^{X,tor} → C^{X,*}, so, when C^{X,*} is affine, Ig^{X,*} = Spec H⁰(Ig^{X,tor}, O). A G-quasi-isogeny φ : X → X′ as in [IG.2.11](#ig-2-toroidal-isogeny-invariance) induces Ig^{X,*} ≅ Ig^{X′,*}.

Work in the smooth toroidal setting.

([CSnc](#ref-csnc), §3.3.1, Proposition 3.3.4, p. 46.)

The API: `PerfectMinimalIgusa`, `PerfectMinimalIgusa.integral`, `PerfectMinimalIgusa.eq_spec_H0`, `PerfectMinimalIgusa.isAffine`, `PerfectMinimalIgusa.open`.

*Needs:* earlier targets of Layer IG.2; Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`.

**Checks.**

- If X has no étale part, Ig^{X,*}=Ig^X.
- At ordinary imaginary quadratic n=1 cusps the boundary is a profinite set indexed bijectively by the cusp labels.
- For infinite Γ_b the integral map need not be finite.

### IG.2.18 Finite-level minimal Igusa varieties

<a id="ig-2-minimal-igusa-compactification"></a>

Fix b ∈ B(G_{ℚ_p}, μ^{−1}) and a completely slope divisible X_b with G-structure in the class b; when possible take X_b = X_w minimal for a fundamental w ([IG.2.14](#ig-2-fundamental-eo-stratum-in-newton-stratum)), which is completely slope divisible. Let C^b = C^{X_b} and Ig^b_m = Ig^{X_b}_{Mant,m}. Define Ig^{b,*}_m as the normalization of C^{b,*} in Ig^b_m and Ig^{b,*} := lim_m Ig^{b,*}_m. Then: (1) h^{b,*}_m : Ig^{b,*}_m → C^{b,*} is finite and surjective, so Ig^{b,*}_m is affine whenever C^{b,*} is; (2) Ig^b_m ↪ Ig^{b,*}_m is a dense open immersion and Ig^{b,*}_m is normal; (3) Ig^{b,*} → C^{b,*} is integral (not finite) and Ig^{b,*} is affine whenever C^{b,*} is; its perfection is Ig^{X_b,*} of [IG.2.17](#ig-2-perfect-minimal-igusa).

Extend prime-to-p Hecke correspondences and the level-changing Mantovan monoid maps through normalization.

Work in the smooth toroidal setting. The further hypotheses are: X_b completely slope divisible.

([CSnc](#ref-csnc), §3.3.6, Definition 3.3.7, p. 46; [CSnc](#ref-csnc), §3.3.6, Lemma 3.3.8, p. 47; [CSnc](#ref-csnc), §2.8, Theorem 2.8.1, p. 33.)

The API: `MinimalIgusa`, `MinimalIgusa.finite`, `MinimalIgusa.normal`, `MinimalIgusa.isAffine`, `MinimalIgusa.lim_integral`, `MinimalIgusa.perf`, `MinimalIgusa.hecke`.

*Needs:* Layer IG.1; earlier targets of Layer IG.2; Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`; Mathlib `AlgebraicGeometry.IsFinite`.

**Checks.**

- Level zero is the normalization of C^{X,*}; it is C^{X,*} when that scheme is normal.
- In the ordinary modular level-one case this is a finite curve with cusps.
- For infinite Γ_b the inverse-limit map is integral and need not be finite.

### IG.2.19 Igusa cusp labels

<a id="ig-2-igusa-cusp-labels"></a>

An Igusa cusp label is a triple Z̃ = (Z_b, Z^p, X) where (1) Z_b is an O_F-stable filtration Z_{b,−2} ⊂ Z_{b,−1} ⊂ X_b with Gr_{−2} = Z_{b,−2} multiplicative, Gr_0 = X_b/Z_{b,−1} étale, identified as Cartier dual by the polarization (so Gr_{−1} is principally polarized); (2) Z^p is an O_F-stable symplectic filtration Z^p_{−2} ⊂ Z^p_{−1} ⊂ L ⊗ ℤ̂^p; (3) X is a finite projective O_F-module with isomorphisms X ⊗ ℚ_p/ℤ_p ≅ Gr^{Z_b}_0 and X ⊗ ℤ̂^p ≅ Gr^{Z^p}_0. J_b(ℚ_p) × G(𝔸_f^p) acts on Igusa cusp labels; at level K (compact open) an Igusa cusp label is a K-orbit, and for K = Γ_b(p^m)K^p(N) these are triples (Z_{m,b}, Z_N, X) with Z = (Z_N, X) a cusp label at level K(N) and Z_{m,b} an O_F-linear symplectic filtration of X_b[p^m] with X/p^m ≅ Gr_0. Its stabilizer is Γ_Z̃ = {γ ∈ Aut_{O_F}(X) : γ ≡ 1 mod p^mN}.

Work in the smooth toroidal setting. The further hypotheses are: X_b completely slope divisible.

([CSnc](#ref-csnc), §3.3.9, Definition 3.3.10, p. 47; [CSnc](#ref-csnc), §3.3.9, p. 47.)

The API:

- `IgusaCuspLabel`: The stated triples (Z_b,Z^p,X).
- `IgusaCuspLabel.toCuspLabel`: The underlying Shimura label (Z^p,X).
- `IgusaCuspLabel.action`: The J_b(ℚ_p)×G(𝔸_f^p)-action.
- `IgusaCuspLabel.atLevel`: The finite-level triples (Z_{m,b},Z_N,X).
- `IgusaCuspLabel.stabilizer`: The level-congruence subgroup Γ_Z̃.
- `IgusaCuspLabel.rank`: The O_F-rank r of X, with 0≤r≤n.

*Needs:* Layer IG.0; ShimuraCompactifications C1.

**Checks.**

- The label with X = 0 corresponds to the open stratum Ig^b_m.
- At m = 0 (level Γ_b K^p(N)) the filtration Z_{0,b} of X_b[p⁰] = 0 is trivial, so the Igusa cusp labels above a cusp label Z of the leaf correspond to Z itself; for n = 1, F imaginary quadratic and b ordinary there is exactly one above each cusp.
- If X_b^{ét} = 0 there are no Igusa cusp labels with X ≠ 0.

### IG.2.20 Toroidal Igusa boundary strata

<a id="ig-2-toroidal-igusa-boundary-strata"></a>

(1) The completion of Ig^{b,tor}_m along its Z-stratum decomposes into open and closed formal subschemes indexed by Igusa cusp labels Z̃ at level Γ_b(p^m)K^p(N) above Z. (2) Fix a symplectic O_F-linear splitting δ_{m,b} of X_b[p^m] along Z_{m,b} and the splitting of Z_N. There is an abelian scheme C_Z̃ = Hom_{O_F}((1/N)X, (B/B[p^m]^μ)^∨) over the level-p^m Igusa variety Ig^b_{Z,m} of the boundary leaf C^b_Z ⊂ S_Z, mapping to C_Z over S_Z, such that, with Ξ_{Z̃,Σ_Z} the pullback of Ξ_{Z,Σ_Z} → C_Z to C_Z̃ and 𝔛_{Z̃,Σ_Z} its completion along the toroidal boundary, the Z̃-piece is Γ_Z̃-equivariantly 𝔛_{Z̃,Σ_Z}/Γ_Z̃; the moduli interpretation is by Igusa level-p^m structures compatible with Z̃ and δ_{m,b} (Definition 3.3.13). The natural map C_Z̃ → C_Z ×_{S_Z} Ig^b_{Z,m} is finite étale.

Work in the smooth toroidal setting. The further hypotheses are: X_b completely slope divisible.

([CSnc](#ref-csnc), §3.3.11, Theorem 3.3.12, p. 48; [CSnc](#ref-csnc), §3.3.11, proof of Theorem 3.3.12, p. 50.)

*Needs:* earlier targets of Layer IG.2; ShimuraCompactifications C4; NeronModelsAndSemistableAbelianVarieties R11.3; ShimuraCompactifications C5.

### IG.2.21 Boundary strata of Ig^{b,*}_m

<a id="ig-2-minimal-igusa-boundary-strata"></a>

There is a decomposition into locally closed strata Ig^{b,*}_m = ⊔_{Z̃} Ig^b_{Z̃}, Z̃ running over Igusa cusp labels at level Γ_b(p^m)K^p(N), with Ig^b_{Z̃} ≅ Ig^b_{Z,m}, the level-p^m Igusa variety over the boundary leaf C^b_Z in S_Z (for the smaller unitary group of rank 2(n − r)). If the stratum of Z̃ meets the closure of the stratum of Z̃′, the underlying cusp labels satisfy the corresponding closure relation. This necessary condition does not identify all Igusa-level incidence relations from the underlying labels alone.

Work in the smooth toroidal setting. The further hypotheses are: X_b completely slope divisible.

([CSnc](#ref-csnc), §3.3.14, Theorem 3.3.15, p. 50.)

*Needs:* earlier targets of Layer IG.2; ShimuraCompactifications C5.

### Examples

For F imaginary quadratic and n = 1 the two Ekedahl–Oort strata have dimensions one and zero, the ordinary partial minimal compactification is the nonvanishing locus of the Hasse invariant, and at level zero the Igusa cusp labels above a cusp of the ordinary leaf are in bijection with that cusp. The toroidal Igusa tower over the ordinary leaf is a curve with cusps, finite étale over the compactified leaf, and trivializing all of A[p^m] at a toric degeneration instead of its connected part would not give a finite étale functor.

### Dependencies

Layers IG.0 and IG.1; ShimuraCompactifications C0–C5; NeronModelsAndSemistableAbelianVarieties R11.3; HodgeTateAndCanonicalSubgroups T0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2; AdicSpacesPartII F0; Mathlib affineness, properness, finiteness and normalization.

## Layer IG.3: Hodge–Tate period fibres and the product formula

The local Hodge–Tate map, universal-cover automorphisms and the product formula identify the open period fibres. Extending the trivializations across boundary charts gives the compactified fibre theorem. Rank-one point comparisons are upgraded using qcqs diamonds and canonical compactifications with proper targets. The minimal case also uses relative primitive comparison. The final filtration retains the equivariant orientation data needed by the local arithmetic argument.

### IG.3.1 The good-reduction locus and tower

<a id="ig-3-good-reduction-locus"></a>

Inside the adic space S_{K(N),ℚ_p} attached to S_{K(N)} ⊗ ℚ_p, the good-reduction locus S°_{K(N),ℚ_p} is the locus of points where the universal abelian variety has good reduction; it is a Hecke-equivariant quasicompact open subspace, equal for p ∤ NΔ_F to the adic generic fibre of the p-adic completion of S_{K(N)} ⊗ ℤ_p. At infinite level, S°_{K(p^∞N)} := lim_m S°^◇_{K(p^mN),ℚ_p} is representable by a perfectoid space (Scholze, Theorem 4.1.1), open in S^*_{K(p^∞N)}, and the Hodge–Tate period map restricts to π°_HT : S°_{K(p^∞N)} → Fℓ. Here S^*_{K(p^∞N)} = lim_m S^{*,◇}_{K(p^mN),ℚ_p} and S^tor_{K(p^∞N)} = lim_m S^{tor,◇}_{K(p^mN),ℚ_p} (limits of spatial diamonds), both representable by perfectoid spaces (S^tor for a cofinal choice of Σ).

Work in the valued-field fibre setting.

([CSnc](#ref-csnc), §2.6, p. 31; [CSnc](#ref-csnc), §2.6, Theorem 2.6.2, p. 30.)

The API: `goodReductionLocus`, `goodReductionLocus_eq_genericFibre`, `goodReductionLocus_hecke`, `goodReductionLocus_infinite`, `goodReductionLocus_piHT`.

*Needs:* Layer IG.0; PerfectoidShimuraVarieties S0; PerfectoidShimuraVarieties S2; PerfectoidShimuraVarieties S4; PerfectoidShimuraVarieties S1; PerfectoidShimuraVarieties S3; SchemeAndStackFoundations SF.4; AdicSpacesPartII F0; AdicSpacesPartII R2.

**Checks.**

- Supersingular modular residue discs belong to S°, so S° is larger than the ordinary tube.
- The complementary geometric rank-one points are punctured cusp discs; this alone does not assert an adic open complement.
- For noncompact S the good-reduction locus need not be closed.

### IG.3.2 Cohomology of the good-reduction locus

<a id="ig-3-good-reduction-locus-cohomology"></a>

Let C be a complete algebraically closed extension of ℚ_p and N ≥ 3 prime to p. The natural Hecke-equivariant map H^i(S_{K(N),ℚ̄}, 𝔽_ℓ) → H^i(S°_{K(N),C}, 𝔽_ℓ) is an isomorphism for every i and every ℓ ≠ p. (Lan–Stroh prove it for every N ≥ 3, also divisible by p; only N prime to p is used and planned here.)

Work in the valued-field fibre setting. The further hypotheses are: ℓ ≠ p.

([CSnc](#ref-csnc), §2.6, Proposition 2.6.4, p. 31; [CSnc](#ref-csnc), §2.6, proof of Proposition 2.6.4, p. 32; [ls18b](#ref-ls18b), Corollary 5.20, p. 25 of the authors' compilation.)

*Needs:* earlier targets of Layer IG.3; ClassicalAdicEtaleCohomology H1:formal-adic-comparison; ShimuraCompactifications C5; LefschetzPencilsAndVanishingCycles LPV.0.

### IG.3.3 Flag points and p-divisible groups

<a id="ig-3-flag-points-and-p-divisible-groups"></a>

Let Fℓ be the adic space over ℚ_p attached to the flag variety of totally isotropic F-linear subspaces of V. For C as above, points x ∈ Fℓ(C) correspond bijectively to isomorphism classes of pairs (𝒳_{O_C}, α) with 𝒳_{O_C} a p-divisible group with G-structure over O_C and α : T_p𝒳_{O_C} ≅ L ⊗ ℤ_p an isomorphism compatible with G-structures; the subspace is the Hodge–Tate filtration Lie 𝒳 ⊗ C(1) ⊂ T_p𝒳 ⊗ C. The special fibre X_k = 𝒳_{O_C} ⊗ k is a p-divisible group with G-structure over k, whose isogeny class defines b(x) ∈ B(G_{ℚ_p}, μ^{−1}). The filtration 𝒳^μ ⊂ 𝒳° ⊂ 𝒳 transported by α is a symplectic O_F-linear filtration of L ⊗ ℤ_p; fixing a symplectic splitting δ gives a splitting δ_{𝒳} of 𝒳 and δ_X of X.

Work in the valued-field fibre setting.

([CSnc](#ref-csnc), §4.1, p. 51; [CSnc](#ref-csnc), §2.7, p. 33.)

*Needs:* Layer IG.0; HodgeTateAndCanonicalSubgroups T2; PerfectoidShimuraVarieties S3.

### IG.3.4 The Newton stratification of the flag variety

<a id="ig-3-flag-newton-stratification"></a>

Let G be connected reductive over ℚ_p, μ a minuscule conjugacy class of cocharacters with field of definition E, and Fℓ_{G,μ} the adic flag variety over E. A point x ∈ Fℓ_{G,μ}(C, C⁺), C complete algebraically closed over E, determines through the Bialynicki-Birula map and Beauville–Laszlo gluing a modification E(x) of type μ of the trivial G-bundle on the Fargues–Fontaine curve X_{C♭}; by Fargues' classification its isomorphism class is an element `flagNewtonClass` b(x) ∈ B(G). Define the stratum Fℓ^b_{G,μ} as the set of points with b(x) = b. Prove: (1) b(x) depends only on the image of x in |Fℓ_{G,μ}|, and a higher-rank point has the class of its rank-one generization; (2) b(x) ∈ B(G, μ⁻¹), that is, ν_{b(x)} ≼ μ⁻¹ and κ(b(x)) = −μ^♭ (Newton polygon above Hodge polygon for the modification); (3) x ↦ b(x) is lower semicontinuous on |Fℓ_{G,μ}|; (4) every stratum is locally closed, the basic stratum is open, and Fℓ^{≽b}_{G,μ} = ⊔_{b ≼ b′} Fℓ^{b′}_{G,μ} is closed. For PEL data the class b(x) of a rank-one point agrees with the isogeny class of the special fibre of its p-divisible group (IG.3, corresponding Newton strata on rank-one points).

The hypotheses are that G is connected reductive over ℚ_p and μ is minuscule; (2) holds for arbitrary μ on the B_dR⁺-affine Grassmannian.

([CS17](#ref-cs17), §3.5, Proposition 3.5.3 with Lemmas 3.5.4–3.5.5, pp. 687–689; Definition 3.5.6, Proposition 3.5.7 and Corollary 3.5.9, pp. 689–690.)

The API:

- `flagNewtonClass`: b : |Fℓ_{G,μ}| → B(G), constant along generizations.
- `flagNewtonStratum`: The strata Fℓ^b_{G,μ}.
- `flagNewtonClass_mem_admissible`: Statement (2).
- `flagNewtonClass_lowerSemicontinuous`: Statement (3).
- `flagNewtonStratum_isLocallyClosed`, `flagNewtonStratum_basic_isOpen`, `flagNewtonStratum_ge_isClosed`: Statement (4).

*Needs:* Layer IG.0 (B(G) and B(G, μ)); PerfectoidShimuraVarieties S3 (the flag variety); VectorBundlesAndIsocrystals VB2 (Fargues' classification of G-bundles on X_{C♭} and the modification E(x)).

**Checks.**

- For G = GL_2 and μ = (1, 0), Fℓ = ℙ¹: the basic stratum is Drinfeld's upper half plane ℙ¹ ∖ ℙ¹(ℚ_p), which is open, and the ordinary stratum is ℙ¹(ℚ_p), which is closed of dimension zero.
- For a torus T every point has the same class, the unique element of B(T, μ⁻¹), so there is a single stratum.
- A class outside B(G, μ⁻¹), for example the GL_2 class with slopes 2 and −1 against μ = (1, 0), has empty stratum.
- The basic stratum is dense: for GL_2 its closure is ℙ¹, while the ordinary stratum is its own closure.

### IG.3.5 Dimensions of flag Newton strata

<a id="ig-3-flag-newton-strata-dimension"></a>

Let Fℓ = ⊔_{b ∈ B(G_{ℚ_p}, μ^{−1})} Fℓ^b be the Newton stratification (x ∈ Fℓ^b(C) iff b(x) = b), with the strata of the preceding target. Then the Krull dimension of |Fℓ^b| is ⟨2ρ, μ⟩ − ⟨2ρ, ν_b⟩ = d − d_b, where d = [F⁺:ℚ]n² and d_b = ⟨2ρ, ν_b⟩ = dim Ig^b. Since the reflex field is ℚ, the ordinary element is the largest in B(G_{ℚ_p}, μ^{−1}) and Fℓ^{ord} = Fℓ(ℚ_p) is 0-dimensional; d_{b′} ≥ d_b whenever b′ ≥ b.

Work in the valued-field fibre setting. The further hypotheses are: Unramified PEL data of type (A) or (C) (for the local argument).

([CS17](#ref-cs17), §4.2, Proposition 4.2.23, p. 713; [CSnc](#ref-csnc), §2.7, Theorem 2.7.3, p. 33; [CSnc](#ref-csnc), §2.7, p. 33.)

*Needs:* earlier targets of Layer IG.3; Layer IG.0; DiamondEtaleCohomology C8; PerfectoidShimuraVarieties S1.

### IG.3.6 The local Hodge–Tate period map

<a id="ig-3-local-hodge-tate-period-map"></a>

For an unramified local PEL datum D^int, let M_{D^int} = (𝔐_{D^int})^ad_η and, for n ≥ 0, M_{D^int,n} the finite étale covers parametrizing O_B-linear Λ/p^n → G[p^n]^ad_η matching the pairings (with ζ_{p^n} fixed). M_{D^int,∞} sends a complete affinoid (Ĕ(ζ_{p^∞}), O)-algebra (R, R⁺) to triples (G, ρ, α) with (G, ρ) ∈ M_{D^int}(R, R⁺) and α : Λ → T_pG^ad_η(R, R⁺) an O_B-linear map matching the pairing and an isomorphism at all geometric points. (1) M_{D^int,∞} is representable by an adic space, preperfectoid, with M_{D^int,∞} ∼ lim_n M_{D^int,n}; it depends only on D (write M_{D,∞}) and is the sheafification of B-linear maps V → (X̃_b)^ad_η(R, R⁺) matching the polarization, with totally isotropic image in D(X_b)[1/p] ⊗ R, locally free quotient W locally ≅ V₁ ⊗ R, and exact 0 → V → X̃_b(C, C⁺) → W ⊗ C → 0 at geometric points. (2) There is a G(ℚ_p)-equivariant local Hodge–Tate period map π_HT : M_{D,∞} → Fℓ_{G,μ} (Fℓ_{G,μ} parametrizing B-equivariant quotients V ⊗ R → W′ with totally isotropic kernel, W′ locally ≅ V₀ ⊗ R), sending a point to the kernel of V ⊗ R → D(X_b)[1/p] ⊗ R. (3) π_HT factors through the b-stratum: π^b_HT : M_{D,∞} → Fℓ^b_{G,μ}.

The G(ℚ_p)-action on α commutes with the J_b(ℚ_p)-action on ρ. The period map is invariant under the second action.

The hypotheses are: Unramified local PEL datum of type (A) or (C).

([CS17](#ref-cs17), §4.2, Theorem 4.2.4, p. 699; [CS17](#ref-cs17), §4.2, Proposition 4.2.5, p. 702; [CS17](#ref-cs17), §4.2, Proposition 4.2.6, p. 702.)

The API: `RZSpaceInfinite`, `RZSpaceInfinite.tilde_lim`, `RZSpaceInfinite.rational_description`, `localHodgeTate`, `localHodgeTate_mem_stratum`, `RZSpaceInfinite.groupActions`.

*Needs:* Layer IG.0; earlier targets of Layer IG.3; PerfectoidShimuraVarieties S3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

**Checks.**

- J_b acts within a period fibre, while G(ℚ_p) acts equivariantly on the flag variety.
- For the basic GL₂ Lubin–Tate datum the period image is the Drinfeld upper half-plane.
- Thus that map is not onto ℙ¹: it omits the rational flags.

### IG.3.7 Local period fibres as automorphism orbits

<a id="ig-3-local-period-fibres"></a>

Fix K_∞ = the completion of Ĕ(ζ_{p^∞}), and take the infinite-level PEL space M_{D,∞}, the flag variety Fl_{K_∞}, and Aut_G(X̃_b)^ad_η after the indicated base changes to K_∞. The automorphism action changes the quasi-isogeny and preserves both the Hodge–Tate period and the map to K_∞. Its action map M̂_{D,∞} ×_{Spa K_∞} Aut_G(X̃_b)^ad_{η,K_∞} → (M_{D,∞} ×_{Fl_{K_∞}} M_{D,∞})^∧ is an isomorphism of perfectoid spaces. Here hats denote strong completions of the preperfectoid adic spaces. If the flag variety is kept over the smaller base Ĕ, the target also has pairs with different cyclotomic structure maps; the action identifies only the part over the cyclotomic diagonal.

The hypotheses are: Unramified local PEL datum of type(A) or(C); choose the completed cyclotomic base K_∞ and take the flag fibre product over Fl_{K_∞}.

([CS17](#ref-cs17), §4.2, Proposition 4.2.14, p. 709.)

*Needs:* earlier targets of Layer IG.3; Layer IG.0; HodgeTateAndCanonicalSubgroups T2; PerfectoidSpaces P2; PerfectoidSpaces P7.

### IG.3.8 Extension from rank-one points

<a id="ig-3-integral-extension-lemma"></a>

Let R⁺ be a ℤ_p-algebra integrally closed in R = R⁺[1/p], and G, H p-divisible groups over R⁺ whose Newton polygons at points of Spec(R⁺/p) are constant. A morphism f_R : G_R → H_R over R extends (necessarily uniquely) to f : G → H over R⁺ if and only if for every geometric rank-one point Spa(C, O_C) of Spa(R, R⁺) the base change f_C extends to O_C.

The hypotheses are: R⁺ integrally closed in R⁺[1/p]; constant Newton polygons.

([CS17](#ref-cs17), §4.2, Lemma 4.2.15, p. 709.)

*Needs:* Layer IG.0; Mathlib `ValuationRing`.

### IG.3.9 Period surjectivity on the b-stratum

<a id="ig-3-local-period-surjective-on-stratum"></a>

For C/Ĕ(ζ_{p^∞}) complete algebraically closed, π^b_HT : M_{D,∞}(C, O_C) → Fℓ^b_{G,μ}(C, O_C) is surjective.

The hypotheses are: Unramified local PEL datum of type (A) or (C).

([CS17](#ref-cs17), §4.2, Lemma 4.2.18, p. 711.)

*Needs:* earlier targets of Layer IG.3; VectorBundlesAndIsocrystals VB2.

### IG.3.10 Dimension of the adic automorphism group

<a id="ig-3-automorphism-group-dimension"></a>

For every complete nonarchimedean field K over O_Ĕ, Aut_G(X̃_b)^ad ×_{Spa(O_Ĕ)} Spa(K, O_K) is partially proper over Spa(K, O_K), of dimension ⟨2ρ, ν_b⟩; each connected component is Spa(O_Ĕ[[x₁^{1/p^∞}, …, x_d^{1/p^∞}]]) ×_{Spa O_Ĕ} Spa(K, O_K), after extending K to a perfectoid field and tilting, the same dimension is computed on a d-dimensional open unit disc.

The hypotheses are: Unramified local PEL data of type (A) or (C); K of characteristic 0.

([CS17](#ref-cs17), §4.2, Proposition 4.2.22, p. 712.)

*Needs:* Layer IG.0; earlier targets of Layer IG.3; DiamondEtaleCohomology C8.

### IG.3.11 The canonical Witt lift

<a id="ig-3-canonical-lift-of-igusa"></a>

Being perfect, Ig^b (and Ig^{X,tor}, Ig^{X,*}) lifts uniquely to a flat p-adic formal scheme W(Ig^b) over W(k) = O_Ĕ (apply Witt vectors to an affine cover and glue); for K/Ĕ complete, Ig^b_{O_K} := W(Ig^b) ⊗_{W(k)} O_K, and similarly Ig^{X,tor}_{O_C} := W(Ig^{X,tor}) ×_{W(k)} O_C, the unique flat formal lift of Ig^{X,tor}_{O_C/p^ε}. On Nilp_{O_Ĕ}, Ig^b_{O_Ĕ} parametrizes abelian varieties with G-structure up to p-power isogeny with an isomorphism of the universal cover of A[p^∞] with that of the canonical lift of X_b. Fixing a lift (X_b)_{O_K} ∈ 𝔐^b(O_K) of X_b (exists with K = Ĕ by formal smoothness), Ig^b_{O_K}(R) = {(A, ρ) : ρ : A[p^∞] ≅ (X_b)_{O_K} ⊗ R} for R ∈ Nilp_{O_K}. The functor 𝔛^b on Nilp_{O_Ĕ} of pairs (A, ρ) with A ∈ S_{K_pK^p}(R) and ρ : A[p^∞] ⊗ R/p → X_b ⊗ R/p a quasi-isogeny with extra structures satisfies 𝔛^b_{O_K} ≅ Ig^b_{O_K} ×_{O_Ĕ} 𝔐^b (Lemma 4.3.12), over Nilp_{O_Ĕ}, with the displayed direction of ρ.

The hypotheses are: PEL data of type (A) or (C) unramified at p with hyperspecial level; X_b completely slope divisible.

([CS17](#ref-cs17), §4.3, Lemma 4.3.10, p. 719; [CS17](#ref-cs17), §4.3, Lemma 4.3.12, p. 720; [CSnc](#ref-csnc), §4.3, p. 54.)

The API: `canonicalLift`, `canonicalLift_unique`, `canonicalLift_genericFibre_perfectoid`, `canonicalLift_moduli`, `XbSpace_decomp`.

*Needs:* Layer IG.1; Layer IG.0; AbelianSchemesAndArithmeticModuli A4; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; Mathlib `WittVector`; SchemeAndStackFoundations SF.4.

**Checks.**

- W(Spec k)=Spf W(k).
- W(Spec 𝔽_p[t^{1/p^∞}])=Spf ℤ_p⟨t^{1/p^∞}⟩, with p-adic completion.
- The nonperfect affine line admits the lift automorphism t↦t+p reducing to the identity, unlike the unique perfect Witt lift.

### IG.3.12 The infinite-level local Newton space

<a id="ig-3-infinite-level-newton-space"></a>

Let X^b = (𝔛^b)^ad_η. X^b_∞ sends a complete affinoid (Ĕ(ζ_{p^∞}), O)-algebra (R, R⁺) to triples (𝒜, ρ, α) with (𝒜, ρ) ∈ X^b(R, R⁺) and α : Λ → T_p𝒜 an O_B-linear map matching the pairings (with the fixed p-power roots of unity) and an isomorphism at every geometric point. Sending an abelian variety to its p-divisible group gives X^b → M^b and X^b_∞ = X^b ×_{M^b} M^b_∞, representable by an adic space; and (Ig^b_{O_K})^ad_η ×_{Spa Ĕ} M^b_∞ ≅ X^b_{∞,K}, so X^b_∞ is preperfectoid.

The hypotheses are: PEL data of type (A) or (C) unramified at p with hyperspecial level.

([CS17](#ref-cs17), §4.3, Definition 4.3.17, p. 724; [CS17](#ref-cs17), §4.3, Corollary 4.3.19, p. 724.)

The API: `XbInfinite`, `XbInfinite.eq_fibreProduct`, `XbInfinite.product`, `XbInfinite.preperfectoid`.

*Needs:* earlier targets of Layer IG.3.

**Checks.**

- For ordinary GL₂ the flag stratum is ℙ¹(ℚ_p), of dimension zero; after fixing the cyclotomic base a period fibre has dimension one and its automorphism orbit is not profinite.
- Forgetting the integral trivialization gives a pro-étale G(ℤ_p)-torsor.
- The local space X^b_∞ is distinct from the Shimura Newton stratum; the product formula has the stated product fibres.

### IG.3.13 The infinite-level product formula

<a id="ig-3-product-formula"></a>

Let X̂^b_∞ be the perfectoid space attached to X^b_∞ and 𝒮^b_{K^p} ⊂ 𝒮_{K^p} the locus of the perfectoid Shimura variety (infinite level at p) of points Spa(K, K⁺) over which the universal abelian variety extends to K⁺ with reduction in the Newton stratum S^b (a locally closed subset, the preimage of S^b under specialization). Then X̂^b_∞ maps to 𝒮^b_{K^p} by forgetting ρ and to M^b_∞ by (𝒜, ρ, α) ↦ (𝒜[p^∞], ρ, α), compatibly with π_HT and π^b_HT, and the induced map X̂^b_∞ → (M^b_∞ ×_{Fℓ_{G,μ}} 𝒮^b_{K^p})^∧ is an isomorphism of perfectoid spaces. All objects in this square are taken over the same chosen completed cyclotomic base; the flag fibre product uses its base-changed flag variety, so the two cyclotomic structure maps agree.

The hypotheses are: PEL data of type (A) or (C) unramified at p with hyperspecial level; no compactness needed.

([CS17](#ref-cs17), §4.3, Lemma 4.3.20, p. 725.)

*Needs:* earlier targets of Layer IG.3; HodgeTateAndCanonicalSubgroups T2; HodgeTateAndCanonicalSubgroups T1; PerfectoidShimuraVarieties S3.

### IG.3.14 Cohomology from rank-one points

<a id="ig-3-rank-one-cohomology-lemma"></a>

(1) Let f : Y → X be a qcqs map of analytic adic spaces, X locally strongly noetherian or perfectoid and Y perfectoid; for a geometric point x̄ of X the stalk (R^if_*𝒢)_x̄ is the cohomology of the fibre f^{−1}(x̄) (an adic space over Spa(C(x̄), C(x̄)⁺)). (2) Let X be a qcqs analytic adic space (perfectoid, or strongly noetherian) and U ⊂ X a quasicompact open containing all rank-one points. Then H^i(X, 𝒢) → H^i(U, 𝒢) is an isomorphism for every locally constant 𝒢 and every i.

The hypotheses are: X qcqs, U quasicompact open containing all rank-one points; 𝒢 locally constant.

([CS17](#ref-cs17), §4.4, Lemma 4.4.2, p. 727; [CS17](#ref-cs17), §4.4, Lemma 4.4.1, p. 726.)

*Needs:* ClassicalAdicEtaleCohomology H0; DiamondEtaleCohomology C0; DiamondSixOperations S1; PerfectoidSpaces P2; PerfectoidSpaces P7.

### IG.3.15 Étale comparison for perfect Witt lifts

<a id="ig-3-perfect-scheme-lift-cohomology"></a>

Let ℓ ≠ p, X a perfect scheme over 𝔽̄_p, C complete algebraically closed with residue field containing 𝔽̄_p, 𝔛_{O_C} the unique flat formal lift of X ⊗ O_C/p over Spf O_C and 𝒳_C its (perfectoid) generic fibre. Then H^i(X, ℤ/ℓ^n) → H^i(𝔛_{O_C}, ℤ/ℓ^n) → H^i(𝒳_C, ℤ/ℓ^n) are isomorphisms for all i (with the canonical pullback maps). The first map is pullback along X×_{𝔽̄_p}k→X followed by the formal/special-fibre étale-site identification; its inverse may be used when displaying the comparison in the opposite direction.

The hypotheses are: X perfect over 𝔽̄_p (in the application: qcqs, a perfection of a finite type scheme); ℓ ≠ p.

([CS17](#ref-cs17), §4.4, Lemma 4.4.3, p. 728.)

*Needs:* earlier targets of Layer IG.3; ClassicalAdicEtaleCohomology H1:formal-adic-comparison; LefschetzPencilsAndVanishingCycles LPV.0; PerfectoidSpaces P1; SchemeAndStackFoundations SF.4.

### IG.3.16 Corresponding Newton strata on rank-one points

<a id="ig-3-newton-strata-correspond"></a>

Assume S_{K^pK_p} proper over O_{E,𝔭} (or replace 𝒮_{K^p} by the good-reduction locus). (1) A rank-one point y of 𝒮_{K^p} lies in 𝒮^b_{K^p} if and only if π_HT(y) ∈ Fℓ^b_{G,μ}. (2) For a rank-one point x ∈ Fℓ^b(C, O_C), every geometric rank-one point of the fibre 𝒮_{K^p,x} lies in 𝒮^b_{K^p}; hence 𝒮^b_{K^p,x} is a quasicompact open subset of 𝒮_{K^p,x} with the same rank-one points, and (R^iπ_HT* ℤ/ℓ^n)_x = H^i(𝒮^b_{K^p,x}, ℤ/ℓ^n).

The hypotheses are: PEL data of type (A) or (C) unramified at p with hyperspecial level; properness (or restriction to the good-reduction locus).

([CS17](#ref-cs17), §4.2, Proposition 4.2.6, p. 702 (with Remark 4.2.8, p. 703); [CS17](#ref-cs17), §4.2, Remark 4.2.8, p. 703.)

*Needs:* earlier targets of Layer IG.3; Layer IG.0; HodgeTateAndCanonicalSubgroups T1; PerfectoidShimuraVarieties S3.

### IG.3.17 Compact PEL period fibres and stalks

<a id="ig-3-compact-fibre-theorem"></a>

Assume a PEL datum of type (A) or (C), unramified at p, with K_p hyperspecial, and S_{K^pK_p} proper over O_{E,𝔭} (equivalently G^ad anisotropic over ℚ). Let ℓ ≠ p, K^p sufficiently small, π_HT : 𝒮_{K^p} → Fℓ_{G,μ} and b ∈ B(G, μ^{−1}). For every geometric point x̄ of Fℓ_{G,μ} lying in Fℓ^b_{G,μ} and all i there are isomorphisms (R^iπ_HT* ℤ/ℓ^n)_x̄ ≅ H^i(Ig^b, ℤ/ℓ^n) ≅ colim_m H^i(Ig^b_{Mant,m}, ℤ/ℓ^n), depending only on a lift of x̄ to M^b_∞ and compatible with the Hecke action of G(𝔸_f^p).

The hypotheses are: Proper integral model (compact Shimura variety); K^p small; ℓ ≠ p.

([CS17](#ref-cs17), §4.4, Theorem 4.4.4, p. 729.)

*Needs:* earlier targets of Layer IG.3; Layer IG.1.

### IG.3.18 Open period fibres

<a id="ig-3-open-fibre-theorem"></a>

For x ∈ Fℓ(C) with p-divisible group 𝒳_{O_C} with G-structure and special fibre X_k, there is a canonical open immersion Ig^{X_k}_C ↪ (π°_HT)^{−1}(x) whose image contains all rank-one points, where Ig^{X_k}_C is the generic fibre of the canonical lift of the perfect Igusa variety (prime-to-p level the part of N prime to p). Consequently, for ℓ ≠ p, (R(π°_HT)_*𝔽_ℓ)_x ≅ RΓ(Ig^{X_k}, 𝔽_ℓ) canonically and Hecke-equivariantly.

Work in the valued-field fibre setting. The further hypotheses are: The quasi-split unitary datum (non-compact); only the good-reduction locus is used, so no properness is needed.

([CSnc](#ref-csnc), §2.7, Theorem 2.7.2, p. 33.)

*Needs:* earlier targets of Layer IG.3.

### IG.3.19 Period maps on the boundary

<a id="ig-3-period-map-on-boundary"></a>

(1) Let Ŝ^tor_{K(p^∞N),Z,ℤ_p} be the completion of the infinite-level naive integral model along the Z-boundary, with π₁ to (G/P_r)(ℚ_p) (symplectic O_F-filtrations Z_{p^∞,−2} ⊂ Z_{p^∞,−1} ⊂ L ⊗ ℤ_p with rk Z_{−2} = r) and the local system L_Z = Gr_{−1} with its perfect form. The Hodge–Tate filtration Lie B(1) ⊂ L_Z ⊗ O of the abelian part B of the Raynaud extension, pulled back to Z_{p^∞,−1} ⊗ O, is a totally isotropic subspace of L ⊗ O; the resulting π_{HT,Z} agrees with π^tor_HT restricted to the generic fibre of Ŝ^tor_Z. (2) On a boundary stratum S_{K(p^∞N),Ẑ} of the infinite-level minimal compactification, π^*_HT is the Hodge–Tate period map of the smaller Shimura variety followed by the embedding Fℓ_Ẑ ↪ Fℓ (preimage of a totally isotropic subspace of L_Z ⊗ ℚ_p in Z_{p^∞,−1} ⊗ ℚ_p).

Work in the valued-field fibre setting.

([CSnc](#ref-csnc), §4.2, Theorem 4.2.1, p. 53; [CSnc](#ref-csnc), §4.2, Corollary 4.2.2, p. 53.)

*Needs:* PerfectoidShimuraVarieties S3; PerfectoidShimuraVarieties S6; ShimuraCompactifications C4; NeronModelsAndSemistableAbelianVarieties R11.3; ShimuraCompactifications C5; earlier targets of Layer IG.3.

### IG.3.20 Constancy modulo p^ε

<a id="ig-3-pdiv-constant-mod-p-epsilon"></a>

For x ∈ Fℓ(C) with (𝒳_{O_C}, α), splitting δ_{𝒳} and special fibre X = 𝒳 ⊗ k with induced δ_X, there is ε ∈ ℚ ∩ (0, 1] and an isomorphism ρ : X ⊗_k O_C/p^ε ≅ 𝒳_{O_C} ⊗ O_C/p^ε of p-divisible groups with G-structure lifting the identity, which can be chosen with δ_{𝒳} ⊗ O_C/p^ε = δ_X ⊗ O_C/p^ε.

Work in the valued-field fibre setting.

([CSnc](#ref-csnc), §4.3, Proposition 4.3.1, p. 54.)

*Needs:* earlier targets of Layer IG.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2; VectorBundlesAndIsocrystals VB2.

### IG.3.21 The compactified Igusa-to-Shimura map

<a id="ig-3-compactified-igusa-to-shimura"></a>

Let Ig^{X,tor}_{O_C} = W(Ig^{X,tor}) ×_{W(k)} O_C. The map g : Ig^X_{O_C} → S_{K(p^∞N),O_C} — Serre–Tate lift of the universal abelian scheme over Ig^X_{O_C/p^ε} along A[p^∞] ≅ 𝒳_{O_C} ([IG.3.20](#ig-3-pdiv-constant-mod-p-epsilon)), with level structure at p from α — extends to a morphism of p-adic formal schemes g^tor : Ig^{X,tor}_{O_C} → S^tor_{K(p^∞N),O_C}, and composing with the projection gives f^tor : Ig^{X,tor}_{O_C} → S^*_{K(p^∞N),O_C}. On boundary charts, Igusa cusp labels map to cusp labels and g^tor is given by deforming G[p^∞] ↪ X (Serre–Tate for Raynaud extensions) and the torus torsor of symmetric lifts.

Work in the valued-field fibre setting.

([CSnc](#ref-csnc), §4.3, Theorem 4.3.2, p. 55; [CSnc](#ref-csnc), §4.3, proof of Theorem 4.3.2, p. 57.)

The API: `igusaToShimura`, `igusaToShimura_open`, `igusaToShimura_cusp`, `igusaToShimura_hecke`, `igusaToShimura_piHT`.

*Needs:* earlier targets of Layer IG.3; Layer IG.2; Layer IG.0; ShimuraCompactifications C4; NeronModelsAndSemistableAbelianVarieties R11.3; ShimuraCompactifications C5.

**Checks.**

- π^{tor}_{HT}∘g^{tor} is the constant map with value x.
- At a modular rational flag the image includes ordinary canonical-line points and cusps.
- Even at a modular rational flag, the map misses higher-rank adic points supplied by canonical compactification; in the basic proper case it is onto.

### IG.3.22 The canonical compactification criterion

<a id="ig-3-canonical-compactification-criterion"></a>

Suppose X/Spd C is a quasicompact separated perfectoid space and Y/Spd C is a proper diamond. A morphism f : X → Y identifies Y with the canonical compactification X̄ of X over Spd C whenever it gives a bijection X(C′, O_{C′}) → Y(C′, O_{C′}) for every complete algebraically closed extension C′/C. If X/Spd C is compactifiable, this same f is an open immersion.

The hypotheses are: Y proper over Spd C.

([CSnc](#ref-csnc), §4.4, Lemma 4.4.2, p. 59.)

*Needs:* DiamondEtaleCohomology C4; DiamondsAndVStacks D5.

### IG.3.23 Toroidal period fibres

<a id="ig-3-toroidal-fibre-theorem"></a>

The morphism g^tor induces a map of diamonds Ig^{b,tor}_C → (π^tor_HT)^{−1}(x) which is an open immersion with the same rank-one points; since the fibre (π^tor_HT)^{−1}(x) is proper over Spd C (a closed fibre of a proper map), it is the canonical compactification of Ig^{b,tor}_C.

Work in the valued-field fibre setting. The further hypotheses are: x ∈ Fℓ^b(C).

([CSnc](#ref-csnc), §4.4, Theorem 4.4.1, p. 57.)

*Needs:* earlier targets of Layer IG.3; Layer IG.2; DiamondEtaleCohomology C4; DiamondsAndVStacks D5.

### IG.3.24 Minimal period fibres

<a id="ig-3-minimal-fibre-theorem"></a>

f^tor induces an open immersion f^* : Ig^{b,*}_C → (π^*_HT)^{−1}(x) of affinoid perfectoid spaces with the same rank-one points. Moreover (1) Ig^{b,tor}_C → Ig^{b,*}_C induces an isomorphism on global sections, and (2) F^tor := (π^tor_HT)^{−1}(x) → F^* := (π^*_HT)^{−1}(x) induces an isomorphism on global sections, via the almost isomorphism O⁺ᵃ_{F^*}/p^n ≅ π_*O⁺ᵃ_{F^tor}/p^n.

Work in the valued-field fibre setting.

([CSnc](#ref-csnc), §4.5, Theorem 4.5.1, p. 59; [CSnc](#ref-csnc), §4.5, proof of Lemma 4.5.2, p. 60.)

*Needs:* earlier targets of Layer IG.3; Layer IG.2; PadicHodgeTheory P8; DiamondEtaleCohomology C0; AdicEtaleGeometry A1; PerfectoidSpaces P0; PerfectoidShimuraVarieties S0; PerfectoidShimuraVarieties S2; PerfectoidShimuraVarieties S4; PerfectoidShimuraVarieties S1; PerfectoidSpaces P2; PerfectoidSpaces P7.

### IG.3.25 Compactified fibres and their cohomology

<a id="ig-3-compactified-fibre-theorem"></a>

For x ∈ Fℓ(C) with (𝒳_{O_C}, α) and special fibre X, there are natural maps Ig^{X,*}_C → (π^*_HT)^{−1}(x) and Ig^{X,tor}_C → (π^tor_HT)^{−1}(x), open immersions of perfectoid spaces with the same rank-one points, whose targets are the canonical compactifications of the sources. Consequently there are natural Hecke-equivariant isomorphisms RΓ(Ig^{X,*}, 𝔽_ℓ) ≅ (Rπ^*_HT*𝔽_ℓ)_x and RΓ(Ig^{X,tor}, 𝔽_ℓ) ≅ (Rπ^tor_HT*𝔽_ℓ)_x, and the stalks at higher-rank points agree with those at the corresponding rank-one points. These maps are compatible with the prime-to-p Hecke action, with passage between p-levels (the transition maps of the towers), with the flag Newton strata (x ∈ Fℓ^b iff X is in the class b) and with the good-reduction open part ([IG.3.18](#ig-3-open-fibre-theorem)).

Work in the valued-field fibre setting.

([CSnc](#ref-csnc), §4.1, Theorem 4.1.1, p. 51; [CSnc](#ref-csnc), §4.1, Corollary 4.1.2, p. 51.)

*Needs:* earlier targets of Layer IG.3; DiamondEtaleCohomology C4; ClassicalAdicEtaleCohomology H0.

### IG.3.26 Scholze–Weinstein’s infinite-level RZ space

<a id="ig-3-sw-infinite-level-rz-space"></a>

Let H be a p-divisible group of height h and dimension d over a perfect field k of characteristic p, M the Rapoport–Zink space of deformations of H up to quasi-isogeny (no extra structure) and M_n its level-p^n covers. M_∞ sends a complete affinoid (W(k)[1/p], W(k))-algebra (R, R⁺) to triples (G, ρ, α) with (G, ρ) ∈ M(R, R⁺) and α : ℤ_p^h → T_pG^ad_η(R, R⁺) an isomorphism at all geometric points. M_∞ is representable by an adic space, is preperfectoid over Spa(W(k)[1/p], W(k)), and satisfies M_∞ ∼ lim_n M_n in the sense of Scholze–Weinstein Definition 2.4.1 (Theorem 6.3.4). Preperfectoidness means that, after any perfectoid characteristic-zero base-field extension, strong completion is perfectoid; it does not assert that M_∞ itself is perfectoid over W(k)[1/p]. Already over W(k)[1/p], M_∞ ≅ M′_∞, the functor of h-tuples (s₁, …, s_h) ∈ H̃^ad_η(R, R⁺) whose quasi-logarithms span a rank-(h − d) submodule with finite projective quotient W of rank d of M(H) ⊗ R, and such that 0 → ℚ_p^h → H̃^ad_η(C, O_C) → W ⊗_R C → 0 is exact at every geometric point Spa(C, O_C) → Spa(R, R⁺) (Definition 6.3.5, Lemma 6.3.6). The first arrow sends the standard basis to the s_i. For an unramified local PEL datum, M_{D^int,∞} ([IG.3.6](#ig-3-local-hodge-tate-period-map)) is a closed subspace of M_∞ for H = X_b.

The hypotheses are: H a p-divisible group over a perfect field k; "∼ lim" in the sense of Scholze–Weinstein Definition 2.4.1.

([sw13](#ref-sw13), Theorem 6.3.4, p. 59 (§6.3; Definition 6.3.3 of M_∞); proof pp. 59–62; [sw13](#ref-sw13), Definition 6.3.5 and Lemma 6.3.6, p. 60; proof pp. 60–62; [CS17](#ref-cs17), §4.2, proof of Theorem 4.2.4, p. 701; [sw13](#ref-sw13), Definition 2.3.9, p. 18; Proposition 2.3.11, p. 19; §6.3, p. 60.)

The API: `SWInfiniteLevel`, `SWInfiniteLevel.preperfectoid`, `SWInfiniteLevel.eq_tuples`, `SWInfiniteLevel.actions`, `SWInfiniteLevel.pel`.

*Needs:* Layer IG.0; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; HodgeTateAndCanonicalSubgroups T2; PerfectoidSpaces P2; PerfectoidSpaces P7; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2.

**Checks.**

- Over a chosen geometric C, H=μ_{p^∞} has a constant ℚ_p^× tower and no deformations.
- For étale H of height h the geometric tower is constant GL_h(ℚ_p); its original unramified descent need not be split.
- For h≥1 and n≥1, M_{n+1}→M_n is not an isomorphism. The h=1,p=2,n=0 transition is exceptional.

### IG.3.27 Mantovan’s cohomology filtration

<a id="ig-3-mantovan-formula"></a>

For an integral PEL datum of type (A) or (C) unramified at p with hyperspecial level and ℓ ≠ p, there is a filtration of RΓ(S_{K^p,ℚ̄_p}, 𝔽_ℓ) by complexes of smooth G(ℚ_p) × W_{E_p}-representations whose graded pieces are indexed by b ∈ B(G_{ℚ_p}, μ^{−1}) (ordered compatibly with the closure relations) and equal to RΓ(Ig^b, 𝔽_ℓ)^{op} ⊗^L_{C_c(J_b(ℚ_p))} RΓ_c(M_{(G,b,μ),∞}, 𝔽_ℓ(d_b))[2d_b], with Ig^b the perfect Igusa variety (dimension d_b = ⟨2ρ, ν_b⟩) and M_{(G,b,μ),∞} the local Shimura variety at infinite level. Here 𝔽_ℓ(d_b) on M_{(G,b,μ),∞} carries the J_b(ℚ_p)-equivariant structure induced by the relative dualizing equivalence Rπ_unip^!𝔽_ℓ ≅ 𝔽_ℓ(d_b)[2d_b], where π_unip : M_{(G,b,μ),∞} → M_{(G,b,μ),∞}/J̃_b^0 is the connected-automorphism-group torsor. This equivariant structure is part of the formula; its smooth character κ agrees with the character on the Igusa dualizing twist (Koshikawa Lemmas 7.4 and 7.6).

The hypotheses are: PEL type (A) or (C) unramified at p, hyperspecial K_p; for non-proper Shimura varieties, use the good-reduction locus and [IG.3.2](#ig-3-good-reduction-locus-cohomology).

([kos21](#ref-kos21), §7, Theorem 7.1 and Remark 7.2, p. 10; Lemmas 7.3–7.6 and their proofs, pp. 10–12 (arXiv:2106.10602v1).)

*Needs:* earlier targets of Layer IG.3; Layer IG.1; HeckeStacksAndLocalShtukas HS2; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.2; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0d; BunGAndNewtonStrata BG3; VStackSheavesAndLisseCategories VS4; DiamondSixOperations S3; DiamondSixOperations S4; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.1; DiamondSixOperations S2.

### Examples

For GL_2 and μ = (1, 0) the flag variety is ℙ¹, the ordinary stratum ℙ¹(ℚ_p) is closed of dimension 0 = d − d_b, and the basic stratum is the Drinfeld upper half plane of dimension 1. At a rational flag of the modular curve the open period fibre is the generic fibre of the canonical lift of the ordinary perfect Igusa variety, and its canonical compactification adds the cusps and the higher-rank points; in the basic proper case the fibre is a profinite set.

### Dependencies

Layers IG.0–IG.2; PerfectoidShimuraVarieties S0–S4, S6; PerfectoidSpaces P0–P2, P7; DiamondsAndVStacks D5; AdicSpacesPartII F0, R2; AdicEtaleGeometry A1; ClassicalAdicEtaleCohomology H0, H1; DiamondEtaleCohomology C0, C4, C8; DiamondSixOperations S1–S4; HodgeTateAndCanonicalSubgroups T1, T2; PadicHodgeTheory P8; LefschetzPencilsAndVanishingCycles LPV.0; ShimuraCompactifications C4, C5; NeronModelsAndSemistableAbelianVarieties R11.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2, R07.6; AbelianSchemesAndArithmeticModuli A4; SchemeAndStackFoundations SF.4; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0, SR.0d, SR.1, SR.2; and, for the flag Newton stratification and Mantovan's filtration, VectorBundlesAndIsocrystals VB2, BunGAndNewtonStrata BG3, VStackSheavesAndLisseCategories VS4 and HeckeStacksAndLocalShtukas HS2.

## Layer IG.4: Nearby cycles, semiperversity and degree bounds

Use finite-type residue-field models to state perverse bounds. Raw reductions over O_C/p and finite-type k-reductions are different objects, and a finite-presentation assertion over O_C/p is not a finite-type assertion over k. The compact argument uses both halves of torsion nearby-cycle exactness; the noncompact argument uses its lower half, integral pushforward and the vanishing of boundary contributions after auxiliary ℓ-level passage.

### IG.4.1 Equivariant sites and nearby cycles

<a id="ig-4-equivariant-sites-and-nearby-cycles"></a>

For a locally profinite group acting continuously, Scholze's equivariant étale sites give (Fℓ_{G,μ}/G(ℚ_p))_ét and (𝒮_{K^p}/G(ℚ_p))_ét with π_HT/G(ℚ_p) between them; R(π_HT/G(ℚ_p))_*𝔽_ℓ pulls back to Rπ_HT*𝔽_ℓ along (Fℓ_{G,μ})_ét → (Fℓ_{G,μ}/G(ℚ_p))_ét (pass to slice categories to replace G(ℚ_p) by a compact open K_p, then to the limit). For an étale U = Spa(A, A°) → Fℓ_{G,μ}, every sufficiently small K_p ⊂ G(ℚ_p) acts continuously on U and trivially on U_s = Spec(A°/p) (finite generation of A°/p), so étale maps to U_s̄ lift K_p-equivariantly to 𝔘_{O_C}, 𝔘 = Spf A°, giving the nearby-cycle morphism of sites λ_{U/K_p} : (U_η̄/K_p)_ét → U_{s̄,ét}.

The hypotheses are: Continuous action of a locally profinite group on an analytic adic space (Scholze, Lubin–Tate paper §2).

([CS17](#ref-cs17), §6.1, p. 751.)

The API: `equivariantEtaleSite`, `equivariantSite.pullback`, `equivariantSite.slice`, `nearbyCyclesEquivariant`.

*Needs:* DiamondEtaleCohomology C0; ClassicalAdicEtaleCohomology H1:formal-adic-comparison; SchemeAndStackFoundations SF.4; AdicSpacesPartII F0; AdicSpacesPartII R2; PerfectoidShimuraVarieties S3.

**Checks.**

- For the trivial group this is the ordinary site.
- A finite free action gives the quotient site.
- For the trivial C_ℓ-action on a point, equivariant H¹ is 𝔽_ℓ whereas ordinary H¹ is zero.

### IG.4.2 Finiteness from the rank-one valuative criterion

<a id="ig-4-finiteness-from-rank-one-valuative-criterion"></a>

Let f : X → Y be a morphism of affine schemes of finite type over 𝔽_p such that, for every algebraically closed field K with a rank-one valuation ring V ⊂ K, every V-point of Y together with a K-point of X lifting its generic point extends to a V-point of X. Then f is proper, hence finite.

The hypotheses are: X, Y affine of finite type over 𝔽_p.

([CS17](#ref-cs17), §6.1, proof of Proposition 6.1.3, p. 753.)

*Needs:* Mathlib `AlgebraicGeometry.IsProper.of_valuativeCriterion`; Mathlib `AlgebraicGeometry.ValuativeCriterion`; Mathlib `AlgebraicGeometry.IsFinite`.

### IG.4.3 Cofinal finite-level formal models

<a id="ig-4-finite-level-formal-models"></a>

Every geometric point x of Fℓ_C has a cofinal system of affinoid étale neighbourhoods U = Spa(A) → Fℓ_C such that: (1) S^*_{K(p^∞N),U} := S^*_{K(p^∞N),C} ×_{Fℓ_C} U is affinoid perfectoid, = Spa(R_{K(p^∞N),U}), and is the preimage of an affinoid U′ = S^*_{K(p^mN),U} étale over S^*_{K(p^mN),C} for m large; (2) with 𝔘 = Spf(A°), the reduction modulo p of Spf(R°_{K(p^∞N),U}) → 𝔘 factors over Spec(R°_{K(p^mN),U}/p) → Spec(A°/p) for m large, and this map of affine schemes is integral (integrality is the asserted property; no finite-type claim over 𝔽_p is made here); (3) the minimal charts and finite-level factorizations admit compatible changes in auxiliary ℓ-power tame level; the toroidal compactifications map properly to these minimal charts, with compatible boundary maps. Affinoid perfectoidness is asserted only for the minimal preimages. These formal models, with the transition maps in p-level and ℓ-level and the boundary maps, are the finite-level geometry from which the semiperverse bound is deduced. Distinguish the raw model Spec(A°/p) over O_C/p from its residue-field reduction 𝔘_k. On the cofinal basis A°/p is finitely presented over O_C/p, so 𝔘_k is affine of finite type over k. The source of the integral map need not be of finite type. The perverse pushforward and nearby-cycle comparison interfaces using these models belong to [IG.4.7](#ig-4-semiperversity).

Work in the nearby-cycle setting.

([CSnc](#ref-csnc), §4.6, proof of Theorem 4.6.1, p. 62; [CSnc](#ref-csnc), §4.6, proof of Theorem 4.6.1, p. 61.)

The API: `FormalNeighbourhood`, `FormalNeighbourhood.cofinal`, `FormalNeighbourhood.integral`, `FormalNeighbourhood.transition`, `FormalNeighbourhood.factor_modP`.

*Needs:* earlier targets of Layer IG.4; Layer IG.3; PerfectoidShimuraVarieties S3; SchemeAndStackFoundations SF.2.

**Checks.**

- The cofinal system is closed under finite étale and rational refinements.
- For m≥m₀ both the raw mod-p map and its residue-field reduction are integral; finite presentation alone does not make them finite.
- For d_b>0 the generic fibre has positive dimension even though the special-fibre map is integral; the basic case has dimension zero.

### IG.4.4 Compact Hodge-type perversity

<a id="ig-4-compact-perversity"></a>

Let π_HT : 𝒮_{K^p} → Fℓ_{G,μ} be the Hodge–Tate period map of a compact Shimura variety of Hodge type, K^p ⊂ G(𝔸_f^p) sufficiently small, and x̄ a geometric point of Fℓ_{G,μ}. Then x̄ has a neighbourhood basis of affinoid étale neighbourhoods U = Spa(A, A°) such that, with 𝔘 = Spf(A°), Rλ_{U/K_p*}(R(π_HT/G(ℚ_p))_*𝔽_ℓ)|_{U_η̄/K_p}[⟨2ρ, μ⟩] is a perverse sheaf on 𝔘_s̄ for every sufficiently small pro-p compact open K_p ⊂ G(ℚ_p). This is the compact-case strengthening (full perversity), not merged with the non-compact one-sided bound of [IG.4.7](#ig-4-semiperversity).

The hypotheses are: Compact Shimura variety of Hodge type (Prop. 6.1.3 is stated for Hodge type; CS17 §6.1).

([CS17](#ref-cs17), §6.1, Proposition 6.1.3, p. 751.)

*Needs:* earlier targets of Layer IG.4; LefschetzPencilsAndVanishingCycles LPV.6; LefschetzPencilsAndVanishingCycles LPV.0; ClassicalAdicEtaleCohomology H1:formal-adic-comparison; EtaleDualityAndPerverseSheaves EDC.5; PerfectoidShimuraVarieties S3.

### IG.4.5 Compact minimal-stratum concentration

<a id="ig-4-compact-minimal-stratum-concentration"></a>

Suppose the Shimura variety is compact, of PEL type (A) or (C) with good reduction at p (as in [IG.3.17](#ig-3-compact-fibre-theorem)), ℓ ≠ p. Let S be a finite set of primes containing p with K^p = K^p_S K^S, K^S hyperspecial, 𝕋^S = ℤ[G(𝔸_f^S)//K^S] (or any subalgebra of it acting on Rπ_HT*𝔽_ℓ), and 𝔪 ⊂ 𝕋^S maximal. Among the b ∈ B(G, μ^{−1}) with H^i(Ig^b, 𝔽_ℓ)[𝔪] ≠ 0 for some i, choose b with d_b = ⟨2ρ, ν_b⟩ minimal. Then H^i(Ig^b, 𝔽_ℓ)[𝔪] is nonzero only for i = d_b. For ℚ̄_ℓ-coefficients use the corresponding eigenideal of the characteristic-zero Hecke algebra; the analogous concentration holds, and (Li–Liu, footnote 16) the argument is asserted to apply when only one factor of the level at p is hyperspecial in their Harris–Taylor type setting.

The hypotheses are: Compact PEL type (A) or (C) Shimura variety with good reduction at p; S ∋ p.

([CS17](#ref-cs17), §6.1, Corollary 6.1.4, p. 753; [lil21](#ref-lil21), Proof of Lemma 7.3 and footnote 16, p. 35.)

*Needs:* earlier targets of Layer IG.4; Layer IG.3; Layer IG.1; EtaleDualityAndPerverseSheaves EDC.5.

### IG.4.6 Boundary vanishing at ℓ^∞ tame level

<a id="ig-4-ell-power-boundary-killing"></a>

(1) For j_{Nℓ^∞} : S_{K(Nℓ^∞),ℚ̄} ↪ S^tor_{K(Nℓ^∞),ℚ̄} (inverse limits over the levels Nℓ^m taken in schemes), the natural map 𝔽_ℓ → Rj_{Nℓ^∞,*}𝔽_ℓ is an isomorphism. (2) For any Igusa variety Ig^X, the restriction H^i(Ig^{X,tor}_{K(Nℓ^∞)}, 𝔽_ℓ) → H^i(Ig^X_{K(Nℓ^∞)}, 𝔽_ℓ) is an isomorphism. Consequently Rπ^tor_{HT,ℓ^∞,*}𝔽_ℓ → Rπ°_{HT,ℓ^∞,*}𝔽_ℓ is an isomorphism.

Work in the nearby-cycle setting.

([CSnc](#ref-csnc), §4.6, Lemma 4.6.2, p. 61; [CSnc](#ref-csnc), §4.6, Lemma 4.6.3, p. 61.)

*Needs:* Layer IG.2; Layer IG.3; AdicCoefficientsAndComparisons L5; ShimuraCompactifications C5.

### IG.4.7 Semiperversity of nearby cycles

<a id="ig-4-semiperversity"></a>

Consider Rπ°_HT*𝔽_ℓ ∈ D(Fℓ_C, 𝔽_ℓ) for π°_HT : S°_{K(p^∞N),C} → Fℓ_C. Every geometric point x of Fℓ_C has a cofinal system of affinoid étale neighbourhoods U = Spa(A) → Fℓ_C such that, with 𝔘 = Spf(A°), the nearby cycles satisfy Rψ(Rπ°_HT*𝔽_ℓ)|_𝔘 ∈ ^pD^{≥d}(𝔘_k, 𝔽_ℓ), d = [F⁺:ℚ]n². The statement is local (for such cofinal U), in the scheme-theoretic perverse t-structure on the special fibres 𝔘_k; it is not a statement about a perverse t-structure on Fℓ itself. Here ^pD^{≥d} denotes the geometric costalk lower-bound criterion on the finite-type k-target and its continuous enlargement for the level complexes; no perverse t-structure on all nonnoetherian schemes is assumed.

Work in the nearby-cycle setting.

([CSnc](#ref-csnc), §4.6, Theorem 4.6.1, p. 60; [CSnc](#ref-csnc), §4.6, end of proof of Theorem 4.6.1, p. 63.)

The API: `FormalNeighbourhood.pushforward_ge`, `FormalNeighbourhood.nearbyComparisonCompatibility`.

*Needs:* earlier targets of Layer IG.4; Layer IG.3; LefschetzPencilsAndVanishingCycles LPV.6; LefschetzPencilsAndVanishingCycles LPV.0; ClassicalAdicEtaleCohomology H1:formal-adic-comparison; EtaleDualityAndPerverseSheaves EDC.5; SchemeAndStackFoundations SF.2; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0d.

### IG.4.8 Partially compactly supported cohomology

<a id="ig-4-partial-support-cohomology"></a>

For b ∈ B(G_{ℚ_p}, μ^{−1}) with completely slope divisible X_b and j : Ig^b ↪ Ig^{b,*} the open immersion into the partial minimal compactification ([IG.2.18](#ig-2-minimal-igusa-compactification)), define RΓ_{c−∂}(Ig^b, 𝔽_ℓ) := RΓ(Ig^{b,*}, j_!𝔽_ℓ) and H^i_{c−∂}(Ig^b, 𝔽_ℓ) := H^i(Ig^{b,*}, j_!𝔽_ℓ), at each finite level and in the colimit over levels. It carries the action of 𝕋^S and the natural map H^i_{c−∂}(Ig^b, 𝔽_ℓ) → H^i(Ig^b, 𝔽_ℓ) induced by j_!𝔽_ℓ → Rj_*𝔽_ℓ. This is not the ordinary compactly supported cohomology RΓ_c(Ig^b) (Ig^{b,*} is not proper), and not RΓ(Ig^b) unless the boundary is empty.

Work in the nearby-cycle setting. The further hypotheses are: X_b completely slope divisible.

([CSnc](#ref-csnc), §2.8, p. 33.)

The API:

- `partialSupportCohomology`: RΓ(Ig^{b,*},j_!𝔽_ℓ).
- `partialSupportCohomology.toCohomology`: The equivariant forget-support map.
- `partialSupportCohomology.triangle`: The displayed boundary distinguished triangle.
- `partialSupportCohomology.fromCompact`: The map from ordinary compact support.
- `partialSupportCohomology.hecke`: Hecke equivariance.

*Needs:* Layer IG.2; Layer IG.1; EtaleDualityAndPerverseSheaves EDC.0; Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`.

**Checks.**

- If X_b^{ét} = 0 then RΓ_{c−∂}(Ig^b) = RΓ(Ig^b).
- For the modular curve and b ordinary at finite level m, H⁰_{c−∂}(Ig^b_m, 𝔽_ℓ) = 0 (j_! kills global sections on the affine curve with cusps added) while H⁰(Ig^b_m, 𝔽_ℓ) ≠ 0.
- RΓ_{c−∂}(Ig^b) ≠ RΓ_c(Ig^b) in general: Ig^{b,*} is affine, not proper, when the leaf is non-proper.

### IG.4.9 The Artin vanishing upper bound

<a id="ig-4-artin-vanishing-upper-bound"></a>

The partial minimal compactification Ig^{b,*} is affine (Theorem 2.8.1); consequently, for every ℓ ≠ p, H^i_{c−∂}(Ig^b, 𝔽_ℓ) = H^i(Ig^{b,*}, j_!𝔽_ℓ) is nonzero only for i ≤ d_b = dim Ig^b.

Work in the nearby-cycle setting.

([CSnc](#ref-csnc), §2.8, Proposition 2.8.2, p. 34.)

*Needs:* earlier targets of Layer IG.4; Layer IG.2; EtaleDualityAndPerverseSheaves EDC.4.

### IG.4.10 The minimal-stratum lower bound

<a id="ig-4-minimal-stratum-lower-bound"></a>

Let S be a finite set of places containing ∞ and all primes dividing pℓNΔ_F, 𝔪 a maximal ideal containing ℓ of the operator algebra 𝕋^S (or of 𝕋^S_full), and choose b ∈ B(G_{ℚ_p}, μ^{−1}) with d_b minimal among those with H^*(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0. Then H^i(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0 implies i ≥ d_b. (No constructibility of the perverse sheaves is needed; Remark 2.8.5: the dual variant for Rπ^*_HT*(j_!𝔽_ℓ) would only reprove the upper bound.)

Work in the nearby-cycle setting.

([CSnc](#ref-csnc), §2.8, Lemma 2.8.4, p. 34; [CSnc](#ref-csnc), §2.8, proof of Lemma 2.8.4, p. 34.)

*Needs:* earlier targets of Layer IG.4; Layer IG.3; Layer IG.1; ClassicalAdicEtaleCohomology H0; EtaleDualityAndPerverseSheaves EDC.5.

### Examples

For the modular curve and the ordinary class at finite level, H^0_{c−∂} of the Igusa curve vanishes while H^0 does not, so the partially compactly supported and ordinary cohomology differ in the lowest degree; the Artin bound places H_{c−∂} in degrees at most d_b = 1 and the minimal-stratum bound places the localized H in degrees at least d_b. When the two bounds meet, the localized cohomology of the minimal stratum is concentrated in degree d_b.

### Dependencies

Layers IG.1–IG.3; LefschetzPencilsAndVanishingCycles LPV.0, LPV.6; EtaleDualityAndPerverseSheaves EDC.0, EDC.4, EDC.5; ClassicalAdicEtaleCohomology H0, H1; DiamondEtaleCohomology C0; AdicCoefficientsAndComparisons L5; ShimuraCompactifications C5; PerfectoidShimuraVarieties S3; SchemeAndStackFoundations SF.2, SF.4; AdicSpacesPartII F0, R2; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0, SR.0d.

## Layer IG.5: Dual Hecke systems and ordinary genericity

Hecke inversion exchanges the residual ideal with its dual. Finite-level Poincaré duality and one-degree concentration lift a mod-ℓ class to a rational constituent with the dual system. The rational trace theorem and local Langlands then force the ordinary Newton class under the weak Frobenius-ratio hypothesis. The dual and modulus normalizations are part of the theorem.

### IG.5.1 Dual Hecke ideals and their Galois systems

<a id="ig-5-dual-hecke-ideal"></a>

Let ι be the involution [K_qgK_q] ↦ [K_qg^{−1}K_q] of the full algebra 𝕋^S_full of IG.0.4; it preserves the operator algebra 𝕋^S and ι(T_{i,v}) = T_{2n,v}^{−1}T_{2n−i,v}. For a maximal ideal 𝔪 of 𝕋^S_full or of 𝕋^S with finite residue field set 𝔪^∨ := ι(𝔪), a maximal ideal with the same residue field; for 𝔐 ⊂ 𝕋^S_full over 𝔪 ⊂ 𝕋^S, 𝔐^∨ lies over 𝔪^∨ (IG.0.5). if 𝔪 is of Galois type with ρ_𝔪 (Frobenius polynomial X^{2n} − T_{1,v}X^{2n−1} + … + q_v^{n(2n−1)}T_{2n,v}, geometric Frobenius), then 𝔪^∨ is of Galois type with ρ_{𝔪^∨} ≅ ρ_𝔪^∨ ⊗ |Art_F^{−1}|^{1−2n}, Art_F sending uniformizers to geometric Frobenius; the Frobenius eigenvalues of ρ_{𝔪^∨} at v are q_v^{2n−1}α_{i,v}^{−1}. Hence ρ_𝔪 = ρ_{𝔪^∨}^∨ ⊗ |Art_F^{−1}|^{1−2n}, and unramifiedness at v, the length of ρ_𝔪 and the condition α_i ≠ q_vα_j (i ≠ j) are preserved by 𝔪 ↦ 𝔪^∨.

Work in the trace-comparison setting.

([CSnc](#ref-csnc), §5.1, proof of Corollary 5.1.3, p. 66; [acc23](#ref-acc23), §2.2.19 'Duality and twisting', pp. 35–37: anti-involutions ι, ι̃ (p. 35), m^∨ := ι(m) (p. 36), Proposition 2.2.20 and Corollary 2.2.21 (pp. 36–37).)

The API:

- `dualIdeal`: The maximal ideal ι(𝔪) with unchanged residue field, for 𝕋^S_full and for 𝕋^S, with `dualIdeal_dualIdeal` and `dualIdeal_comap` (compatibility with the inclusion 𝕋^S ⊂ 𝕋^S_full).
- `dualIdeal_galois`: The contragredient Tate twist and eigenvalues stated above.
- `dualIdeal_preserves`: Invariance of length, unramifiedness away from ℓ and weak genericity; no unramifiedness assertion above ℓ.
- `dualEigenvalues` and `weaklyGeneric_dualEigenvalues`: the eigenvalues q_v^{2n−1}α_i⁻¹ of the dual system, and preservation of weak genericity.

*Needs:* Layer IG.0 (IG.0.4 and IG.0.5); AutomorphicGaloisRepresentationsPartII AG2.7; TauCetiRoadmap IntegralHeckeAndGaloisDeterminants Layer 3a; TauCetiRoadmap ClassFieldTheory Layer 11.

**Checks.**

- (𝔪^∨)^∨ = 𝔪.
- For 2n = 2 and eigenvalues {α, β} of ρ_𝔪(Frob_v), the eigenvalues for 𝔪^∨ are {q_v/α, q_v/β}.
- 𝔪^∨ ≠ 𝔪 in general: for ρ_𝔪 with eigenvalues {1, 2} at q_v = 7 over 𝔽_ℓ, ℓ = 11, the dual has eigenvalues {7, 7/2}.
- For 𝔐 ⊂ 𝕋^S_full over 𝔪 ⊂ 𝕋^S, 𝔐^∨ ∩ 𝕋^S = 𝔪^∨; if U_q ≡ u modulo 𝔐 then U_q ≡ u⁻¹ modulo 𝔐^∨, so dualizing also inverts the similitude eigenvalues.

### IG.5.2 Hecke-equivariant Poincaré duality

<a id="ig-5-igusa-poincare-duality"></a>

Let Ig = Ig^b_{Mant,m,K(N)} be a finite-level Igusa variety (smooth of dimension d_b over k) and Λ = ℤ/ℓ^n or ℤ_ℓ. Then RΓ_c(Ig, Λ) ≅ RHom_Λ(RΓ(Ig, Λ), Λ)[−2d_b](−d_b), and under this isomorphism T ∈ 𝕋^S_full acts on the left through ι(T) on the right. Consequently, for a maximal ideal 𝔪 of 𝕋^S_full or of 𝕋^S, RΓ_c(Ig, Λ)_{𝔪^∨} ≅ RHom_Λ(RΓ(Ig, Λ)_𝔪, Λ)[−2d_b](−d_b), compatibly with the transition maps: pullback on RΓ along a finite étale transition Ig_{m′} → Ig_m is dual to the trace on RΓ_c. (Since a dual turns colimits into limits, this is not a duality between colim_m RΓ_c and colim_m RΓ.)

Work in the trace-comparison setting. The further hypotheses are: ℓ ≠ p.

([CSnc](#ref-csnc), §5.1, proof of Corollary 5.1.3, p. 66.)

*Needs:* earlier targets of Layer IG.5; Layer IG.1; EtaleDualityAndPerverseSheaves EDC.2:pairings.

### IG.5.3 Galois representations of Igusa constituents

<a id="ig-5-galois-representations-for-igusa-constituents"></a>

Under the standing assumptions of §5 (listed in the hypotheses), write [H_c(Ig^b_{K(N)}, ℚ̄_ℓ)] := Σ_i (−1)^i [colim_m H^i_c(Ig^b_{m,K(N)}, ℚ̄_ℓ)] = Σ_{j∈J} n_j π_j ⊗ ψ_j as a virtual representation of J_b(ℚ_p) × 𝕋^S_full (π_j irreducible smooth, ψ_j : 𝕋^S_full → ℚ̄_ℓ characters, n_j ≠ 0, pairwise distinct). For each j there is a continuous semisimple ρ_j : Gal(F̄/F) → GL_{2n}(ℚ̄_ℓ), almost everywhere unramified, unramified at every v | q ∉ S with q split in F₀, with characteristic polynomial of ρ_j(Frob_v) equal to X^{2n} − ψ_j(T_{1,v})X^{2n−1} + … + (−1)^i q_v^{i(i−1)/2}ψ_j(T_{i,v})X^{2n−i} + … + q_v^{n(2n−1)}ψ_j(T_{2n,v}); and for v | p the semisimple Langlands parameter of π_{j,v}|·|^{1/2−n} (via Badulescu's Jacquet–Langlands for the inner form J_{b_v} of a Levi of GL_{2n}(F_v)) equals the semisimple parameter of ρ_j|_{Gal(F̄_v/F_v)}.

Work in the trace-comparison setting. The further hypotheses are: Semisimple Langlands parameters as in CSnc Remark 5.1.1: restriction of a Frobenius-semisimple WD representation along w ↦ (w, diag(|w|^{1/2}, |w|^{−1/2})).

([CSnc](#ref-csnc), §5.1, Theorem 5.1.2, p. 65; [CSnc](#ref-csnc), §5.1, p. 64.)

*Needs:* Layer IG.1; EndoscopicTransferAndUnitaryTraceComparison ET.5; EndoscopicTransferAndUnitaryTraceComparison ET.4; EndoscopicTransferAndUnitaryTraceComparison ET.7b; AutomorphicGaloisRepresentationsPartII AG2.1a; AutomorphicGaloisRepresentationsPartII AG2.0; AutomorphicGaloisRepresentationsPartII AG2.5; EndoscopicTransferAndUnitaryTraceComparison ET.6.

### IG.5.4 A rational constituent from mod-ℓ concentration

<a id="ig-5-concentrated-cohomology-gives-constituent"></a>

Under the standing assumptions, let 𝔪 ⊂ 𝕋^S_full be a maximal ideal and suppose H^i(Ig^b_{K(N)}, 𝔽_ℓ)_𝔪 is nonzero for exactly one i. Then H^*_c(Ig^b_{K(N)}, ℤ_ℓ)_{𝔪^∨} is concentrated in one degree and torsion-free, the corresponding ℚ̄_ℓ-cohomology is a nonzero lattice-bearing 𝕋^S_full-module whose eigencharacters lift 𝔪^∨, and in the decomposition of [H_c(Ig^b_{K(N)}, ℚ̄_ℓ)] there is j ∈ J with ψ_j ≡ 𝔪^∨ (mod the maximal ideal of ℤ̄_ℓ) and n_j ≠ 0 (no cancellation, since only one degree contributes). The semisimplified reduction ρ̄_{𝔪^∨} of ρ_j ([IG.5.3](#ig-5-galois-representations-for-igusa-constituents)) is independent of the choice of j and of the lattice.

Work in the trace-comparison setting.

([CSnc](#ref-csnc), §5.1, proof of Corollary 5.1.3, p. 66.)

*Needs:* earlier targets of Layer IG.5; Layer IG.1; AutomorphicGaloisRepresentationsPartII AG2.7; SchemeAndStackFoundations SF.2; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0d.

### IG.5.5 Splitting generic local lifts

<a id="ig-5-generic-lift-splits"></a>

Let L/ℚ_p be finite with residue cardinality q, ℓ ≠ p, and ρ : Gal(L̄/L) → GL_m(ℚ̄_ℓ) continuous whose semisimplified reduction ρ̄ is unramified with Frobenius eigenvalues α₁, …, α_m satisfying α_i ≠ qα_j for i ≠ j. (1) If ρ̄ is moreover decomposed generic at L (α_i/α_j ∉ {1, q} for i ≠ j), then ρ ≅ ⊕χ_i is a sum of characters with χ_a/χ_b not the cyclotomic character for a ≠ b, so the corresponding representation of GL_m(L) is a generic principal series. (2) Without assuming the α_i distinct: if q ≢ 1 mod ℓ then ρ is unramified; if q ≡ 1 mod ℓ then ρ is a direct sum of characters whose pairwise ratios are not the cyclotomic character (when q≡1 mod ℓ the ratio condition itself forces distinct residual eigenvalues; repetitions are allowed in the q≠1 branch).

The hypotheses are: ℓ ≠ p; α_i ≠ qα_j for i ≠ j.

([CS17](#ref-cs17), §6.2, Lemma 6.2.2, p. 756; [CSnc](#ref-csnc), §5.1, proof of Corollary 5.1.3 and footnote 17, pp.66–67 (arXiv v2).)

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.7; ArithmeticGaloisDuality D7.

### IG.5.6 Genericity forces ordinarity

<a id="ig-5-genericity-forces-ordinary"></a>

Assume the standing assumptions and let 𝔪 ⊂ 𝕋^S_full be a maximal ideal such that H^i(Ig^b_{K(N)}, 𝔽_ℓ)_𝔪 ≠ 0 in exactly one degree. Then there is a continuous semisimple ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ), unramified at every v | q ∉ S with q split in F₀, with ρ̄_𝔪(Frob_v) of characteristic polynomial the reduction modulo 𝔪 of X^{2n} − T_{1,v}X^{2n−1} + … + (−1)^i q_v^{i(i−1)/2}T_{i,v}X^{2n−i} + … + q_v^{n(2n−1)}T_{2n,v}; namely ρ̄_𝔪 := (ρ̄_{𝔪^∨})^∨ ⊗ |Art_F^{−1}|^{1−2n}. If moreover p splits completely in F and for all v | p, ρ̄_𝔪 is unramified at v with Frobenius eigenvalues α_{1,v}, …, α_{2n,v} satisfying α_{i,v} ≠ pα_{j,v} for i ≠ j (the residual ratio predicate of AutomorphicGaloisRepresentationsPartII AG2.7; repeated eigenvalues allowed), then b is ordinary. By IG.0.5 the same two conclusions hold for a maximal ideal 𝔪 of the operator algebra 𝕋^S such that H^i(Ig^b_{K(N)}, 𝔽_ℓ)_𝔪 ≠ 0 in exactly one degree: apply the theorem to a maximal ideal of 𝕋^S_full over 𝔪 that occurs in that degree; the Galois representation depends only on 𝔪.

Work in the trace-comparison setting. The further hypotheses are: p splits completely in F for the last assertion.

([CSnc](#ref-csnc), §5.1, Corollary 5.1.3, p. 66; [CSnc](#ref-csnc), §2.8, Theorem 2.8.6, p. 35.)

*Needs:* earlier targets of Layer IG.5; EndoscopicTransferAndUnitaryTraceComparison ET.6; AutomorphicGaloisRepresentationsPartII AG2.7.

### Examples

For 2n = 2 and a residual representation with Frobenius eigenvalues {1, 2} at a place with q_v = 7 over 𝔽_11, the dual ideal has eigenvalues {7, 7/2}; the ratio condition α_i ≠ q_vα_j holds for both systems, as it must. If the Igusa cohomology of a non-ordinary class were concentrated in one degree for such a generic system, the lifted constituent would give a generic principal series of J_b(ℚ_p), which does not exist for a nontrivial inner form of a Levi subgroup.

### Dependencies

Layers IG.0 and IG.1; EndoscopicTransferAndUnitaryTraceComparison ET.4–ET.7b; AutomorphicGaloisRepresentationsPartII AG2.0–AG2.7; EtaleDualityAndPerverseSheaves EDC.2; ArithmeticGaloisDuality D7; SchemeAndStackFoundations SF.2; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0, SR.0d; IntegralHeckeAndGaloisDeterminants Layer 3a; ClassFieldTheory Layers 5 and 11.

## Layer IG.6: Boundary cohomology and Pink’s formula

The maximal-parabolic boundary strata have lower-rank Igusa and GL_r locally symmetric factors. The local chart comparison gives an equivariant Pink formula. Derived invariants and unnormalized Hecke restriction make it compatible with global localization. Induction on rank uses both degree bounds and torsion Galois determinants; it establishes a boundary length obstruction before the final length-at-most-two hypothesis is imposed.

### IG.6.1 Parabolic boundary strata and the lower-rank datum

<a id="ig-6-boundary-strata-by-parabolics"></a>

The boundary ∂Ig^{b,*} ⊂ Ig^{b,*} is stratified by the conjugacy classes [P] of maximal rational parabolics of G_ℚ, represented by P_r = Stab(0 ⊂ F^r ⊂ F^{2n−r} ⊂ F^{2n}), r = 1, …, n: Ig^{b,*}_{[P_r]} is the preimage of the strata S_Z ⊂ S^* whose cusp label Z = (Z_N, X) has rk_{O_F} X = r; the strata are Hecke-equivariant and pass to the limit Ig^{b,*}_{∞,[P]}. The Levi of the standard P = P_r is M = Res_{F/ℚ}GL_r × G_{2(n−r)} (replace n by n−r; for r=n, G_0=𝔾_m). Let X_r = (∏_{τ:F⁺↪ℝ} M^{herm,>0}_r(ℂ))/ℝ_{>0} be the symmetric space of GL_r(F ⊗ ℝ). Fix an O_F-stable symplectic filtration Z_b : 0 ⊂ Z_{b,−2} ⊂ Z_{b,−1} ⊂ X_b with Z_{b,−2} ≅ Hom(O_F^r, μ_{p^∞}); it defines the parabolic P_b(ℚ_p) ⊂ J_b(ℚ_p) of self-quasi-isogenies preserving it and the p-divisible group X_P = Z_{b,−1}/Z_{b,−2} with G_{2(n−r)}-structure, with isocrystal class b_P ∈ B(G_{2(n−r),ℚ_p}, μ^{−1}). With j : Ig^b_∞ ↪ Ig^{b,*}_∞ and i_{[P]} the inclusion of the stratum, RΓ_c(Ig^{b,*}_{∞,[P]}, i^*_{[P]}Rj_*𝔽_ℓ) is a complex of smooth J_b(ℚ_p) × G(𝔸_f^p)-representations.

The rank-r stratum closure is contained in the union of rank≥r strata; do not require equality when some strata are empty.

Work in the boundary tower setting.

([CSnc](#ref-csnc), §6.1, p. 79; [CSnc](#ref-csnc), §6.1, p. 80.)

The API: `boundaryStratum`, `boundaryStratum_union`, `levelSubgroup`, `lowerRankDatum`, `levi`, `boundaryStratum_hecke`.

*Needs:* Layer IG.2; Layer IG.0; ArithmeticLocallySymmetricSpaces ALS.2; EtaleDualityAndPerverseSheaves EDC.0; Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`.

**Checks.**

- For n=1 only r=1 occurs, and the lower-rank datum is trivial.
- If X has no étale part all boundary strata are empty.
- X_P=Z_{−1}/Z_{−2}, with this order of the graded pieces.

### IG.6.2 Parabolic induction of boundary strata

<a id="ig-6-boundary-parabolic-induction"></a>

There is a natural J_b(ℚ_p) × G(𝔸_f^p)-equivariant map Ig^{b,*}_{∞,[P]} → J_b(ℚ_p)/P_b(ℚ_p) × G(𝔸_f^p)/P(𝔸_f^p) induced by the cusp labels (the target parametrizes pairs (Z_b, Z^p) of rank r). With Ig^{b,*}_{∞,P} its fibre over the identity, RΓ_c(Ig^{b,*}_{∞,[P]}, i^*_{[P]}Rj_*𝔽_ℓ) ≅ Ind^{J_b(ℚ_p)×G(𝔸_f^p)}_{P_b(ℚ_p)×P(𝔸_f^p)} RΓ_c(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ) (unnormalized smooth induction).

Work in the boundary tower setting.

([CSnc](#ref-csnc), §6.2.1, p. 80.)

*Needs:* earlier targets of Layer IG.6; Layer IG.2; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.2; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0d.

### IG.6.3 The boundary cup-product comparison

<a id="ig-6-boundary-comparison-map"></a>

There is a natural P_b(ℚ_p) × P(𝔸_f^p)-equivariant map RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) ⊗ RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ) → RΓ_c(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ), the cup product of (1) RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ) → RΓ_c(Ig^{b,*}_{∞,P}, 𝔽_ℓ), pullback along the profinite map Ig^{b,*}_{∞,P} → Ig^{b_P}_∞ (limit of [IG.2.21](#ig-2-minimal-igusa-boundary-strata)), and (2) RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) → RΓ(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ), constructed from a continuous P_b(ℚ_p) × P(𝔸_f^p)-equivariant map f  : |Ig^b_{∞,P}| → GL_r(F)\(X_r × GL_r(𝔸_{F,f})) on the punctured perfectoid formal neighbourhood (the logarithms of the norms of the sections of the Poincaré bundle of the Raynaud extension give the point of X_r, well defined up to ℝ_{>0}; the level structures give the adelic component), together with RΓ(Ig^{b,*}_{∞,P}, i^*_P Rj_*𝔽_ℓ) ≅ colim_{m,N} RΓ(Ig^b_{m,K(N),P}, 𝔽_ℓ) (Huber, Cor. 3.5.14, at each finite level) and RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) ≅ colim_K RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})/K), 𝔽_ℓ) (Borel–Serre). Both maps are equivariant for P_b(ℚ_p) × P(𝔸_f^p) acting through J_{b_P}(ℚ_p) × G_{2(n−r)}(𝔸_f^p), respectively GL_r(𝔸_{F,f}).

The unipotent radicals of P_b(ℚ_p) and P(𝔸_f^p) act trivially on the source; equivariance factors through the stated Levi projections.

Work in the boundary tower setting.

([CSnc](#ref-csnc), §6.2.2, p. 81; [CSnc](#ref-csnc), §6.2.3, p. 83.)

The API: `boundaryComparison`, `igusaFactor`, `lsFactor`, `lsFactor_equivariant`, `boundaryComparison_levi`.

*Needs:* earlier targets of Layer IG.6; Layer IG.2; Layer IG.1; ClassicalAdicEtaleCohomology H1:formal-adic-comparison; ArithmeticLocallySymmetricSpaces ALS.2; ArithmeticLocallySymmetricSpaces ALS.1; ArithmeticLocallySymmetricSpaces ALS.0; ShimuraCompactifications C4; NeronModelsAndSemistableAbelianVarieties R11.3.

**Checks.**

- For imaginary quadratic F and n=1 the cusp factor is functions on GL₁(F)\GL₁(𝔸_{F,f}), tensored with degree-zero lower-rank Igusa cohomology.
- For [F⁺:ℚ]>1 use finite-level unit-group cohomology before taking the colimit.
- If X has no étale part both sides vanish.
- The GL_r factor map is a continuous map of real manifolds; it is not a morphism of schemes.

### IG.6.4 Local computation on cusp labels

<a id="ig-6-local-boundary-computation"></a>

Decompose Ig^{b,*}_{∞,P} by Igusa cusp labels above P: finite projective O_F-modules X of rank r with X ⊗ ℤ̂^p ≅ O_F^r ⊗ ℤ̂^p and X ⊗ ℤ_p ≅ O_F^r ⊗ ℤ_p, giving ⊔_{X/≅} GL_{O_F}(X)\GL_{O_F}(X ⊗ ℤ̂) ≅ GL_r(F)\GL_r(𝔸_{F,f}), compatibly with f. For the closed subset Ig^{b,*}_{∞,Z̃} of a fixed label, the map RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ) ⊗ colim_{Γ ⊂ GL_{O_F}(X)} RΓ(Γ, 𝔽_ℓ) → RΓ_c(Ig^{b,*}_{∞,Z̃}, i^*_{Z̃}Rj_*𝔽_ℓ) (Γ running over congruence subgroups) is an isomorphism. The same method proves Pink's original formula Hecke-equivariantly (alternative to Pink §4.8).

Work in the boundary tower setting.

([CSnc](#ref-csnc), §6.3, Proposition 6.3.1, p. 84; [CSnc](#ref-csnc), §6.3, proof of Proposition 6.3.1, p. 84; [ls18a-author](#ref-ls18a-author), §4.3, Assumption 4.3.1 and Lemma 4.3.2, author-copy p.61; Definition 4.3.8 and Theorem 4.3.10, pp.63–64.)

*Needs:* earlier targets of Layer IG.6; Layer IG.2; AdicCoefficientsAndComparisons L5; ShimuraCompactifications C4; NeronModelsAndSemistableAbelianVarieties R11.3.

### IG.6.5 Pink's formula for Igusa varieties

<a id="ig-6-igusa-pink-formula"></a>

There is a natural J_b(ℚ_p) × G(𝔸_f^p)-equivariant isomorphism RΓ_c(Ig^{b,*}_{∞,[P]}, i^*_{[P]}Rj_*𝔽_ℓ) ≅ Ind^{J_b(ℚ_p)×G(𝔸_f^p)}_{P_b(ℚ_p)×P(𝔸_f^p)} (RΓ(GL_r(F)\(X_r × GL_r(𝔸_{F,f})), 𝔽_ℓ) ⊗ RΓ_c(Ig^{b_P}_∞, 𝔽_ℓ)), with unnormalized smooth induction and P_b(ℚ_p) × P(𝔸_f^p) acting on the tensor product through its Levi quotient (J_{b_P}(ℚ_p) × G_{2(n−r)}(𝔸_f^p) on the Igusa factor, GL_r(𝔸_{F,f}) on the locally symmetric factor). No Tate twist or cohomological shift enters (𝔽_ℓ coefficients, degrees as written). The isomorphism is an equivariant isomorphism of complexes, not only an equality of Euler characteristics.

Work in the boundary tower setting.

([CSnc](#ref-csnc), §6.1, Theorem 6.1.1, p. 80.)

*Needs:* earlier targets of Layer IG.6.

### IG.6.6 Derived invariants of induced representations

<a id="ig-6-parabolic-induction-derived-invariants"></a>

Let P = MN be a standard rational parabolic of G, K^S = ∏_{v∉S} hyperspecial, K^S_P = K^S ∩ P(𝔸^S), K^S_M its image in M(𝔸^S), r_P : 𝕋^S → 𝕋^S_P restriction of functions and r_M : 𝕋^S_P → 𝕋^S_M integration along unipotent fibres (so r_M ∘ r_P is the unnormalized Satake transform; ArithmeticLocallySymmetricSpaces ALS.4). Then (1) RΓ_cont(K^S, Ind^{G(𝔸^S)}_{P(𝔸^S)}(−)) ≅ r_P^* RΓ_cont(K^S_P, −) as functors D^+_sm(P(𝔸^S), 𝔽_ℓ) → D^+(𝕋^S); (2) r_M^* RΓ_cont(K^S_M, −) ≅ RΓ_cont(K^S_P, Inf^{P(𝔸^S)}_{M(𝔸^S)}(−)) as functors D^+_sm(M(𝔸^S), 𝔽_ℓ) → D^+(𝕋^S_P).

The hypotheses are: K^S hyperspecial at every place outside S (Iwasawa decomposition G(𝔸^S) = K^S P(𝔸^S)); K^S_N pro-prime-to-ℓ.

([CSnc](#ref-csnc), §6.4, Lemma 6.4.2, p. 85; [CSnc](#ref-csnc), §6.4, Lemma 6.4.3, p. 86.)

*Needs:* ArithmeticLocallySymmetricSpaces ALS.4; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.2; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0d.

### IG.6.7 The boundary length obstruction

<a id="ig-6-boundary-length-obstruction"></a>

Assume p unramified in F, F contains properly an imaginary quadratic F₀ in which p splits, F⁺ ≠ ℚ, S and N ≥ 3 as in §5 (N prime to p, divisible only by primes of S^p_f and by N₀), and 𝔪 ⊂ 𝕋^S_full a maximal ideal containing ℓ (by IG.0.5 the statement then also holds for maximal ideals of the operator algebra 𝕋^S); Igusa varieties at tame level K^p(N). (1) If for some b ∈ B(G_{ℚ_p}, μ^{−1}) one of H^i_{c−∂}(Ig^b, 𝔽_ℓ)_𝔪, H^i(Ig^b, 𝔽_ℓ)_𝔪 is nonzero, then there is a continuous semisimple ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ) with ρ̄_𝔪(Frob_v) of characteristic polynomial X^{2n} − T_{1,v}X^{2n−1} + … + (−1)^i q_v^{i(i−1)/2}T_{i,v}X^{2n−i} + … + q_v^{n(2n−1)}T_{2n,v} mod 𝔪 for all v | q ∉ S split in F₀. (2) If moreover H^i_{c−∂}(Ig^b, 𝔽_ℓ)_𝔪 → H^i(Ig^b, 𝔽_ℓ)_𝔪 is not an isomorphism for some i and b is not ordinary, then ρ̄_𝔪 has at least 3 Jordan–Hölder constituents. Both parts are proved together, by induction on n, uniformly for all the unitary groups G_{2m}, m ≤ n. The hypothesis that ρ̄_𝔪 has length at most two is not assumed here; it is the hypothesis under which (2) is applied in IG.7.

The hypotheses are those stated; the induction uses the theorem for G_{2(n−r)}, 1 ≤ r ≤ n, and the torsion Galois determinants for GL_r over F.

([CSnc](#ref-csnc), §6.4, Theorem 6.4.1, p. 84; [CSnc](#ref-csnc), §6.4, proof of Theorem 6.4.1, p. 86; [CSnc](#ref-csnc), §2.8, Theorem 2.8.7, p. 35.)

*Needs:* earlier targets of Layer IG.6; Layer IG.5; Layer IG.4; TorsionCohomologyInfrastructure TC.4; TauCetiRoadmap IntegralHeckeAndGaloisDeterminants Layer 0; TauCetiRoadmap IntegralHeckeAndGaloisDeterminants Layer 1; TauCetiRoadmap IntegralHeckeAndGaloisDeterminants Layer 4; ArithmeticLocallySymmetricSpaces ALS.4.

### Examples

For F imaginary quadratic and n = 1 only the rank-one boundary stratum occurs; its lower-rank Igusa factor is zero-dimensional and the locally symmetric factor is the finite set GL_1(F)\GL_1(𝔸_{F,f})/K, so Pink's formula expresses the boundary cohomology as functions on this set tensored with degree-zero Igusa cohomology, induced from the parabolic.

### Dependencies

Layers IG.0–IG.2, IG.4 and IG.5; ArithmeticLocallySymmetricSpaces ALS.0–ALS.2, ALS.4; TorsionCohomologyInfrastructure TC.4; ClassicalAdicEtaleCohomology H1; AdicCoefficientsAndComparisons L5; ShimuraCompactifications C4; NeronModelsAndSemistableAbelianVarieties R11.3; EtaleDualityAndPerverseSheaves EDC.0; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0, SR.0d, SR.2; TauCetiRoadmap IntegralHeckeAndGaloisDeterminants Layers 0, 1, 4.

## Layer IG.7: Generic vanishing and its arithmetic forms

Assemble the global argument by eliminating nonordinary strata and descending the infinite-level bound. Integral coefficients and boundary excision give the middle-degree maps used in potential automorphy. Then assemble the separate local spectral argument: non-quasi-split local terms vanish, and the localized ordinary costalk equals the stalk. This removes the real-degree and residual-length restrictions under the local hyperspecial hypotheses, without changing the distinction between ordinary and compact support.

### IG.7.1 Caraiani–Scholze genericity

<a id="ig-7-cs-generic-maximal-ideal"></a>

A maximal ideal 𝔪 of the operator algebra 𝕋^S, or equivalently 𝔪⁰ = heckeRestrict(𝔪) of 𝕋^{0,S}, of Galois type (with semisimple ρ̄_𝔪 : Gal(F̄/F) → GL_{2n}(𝔽̄_ℓ) whose Frobenius polynomials are those of [IG.5.6](#ig-5-genericity-forces-ordinary)) is CS-generic if (i) F⁺ ≠ ℚ; (ii) ρ̄_𝔪 has at most two Jordan–Hölder constituents; (iii) some prime p ≠ ℓ splits completely in F and ρ̄_𝔪 is unramified at every v | p with Frobenius eigenvalues satisfying α_{i,v} ≠ pα_{j,v} for i ≠ j (a decomposed-generic prime in the sense of AutomorphicGaloisRepresentationsPartII AG2.7; repeated eigenvalues are allowed, so the distinctness α_i ≠ α_j of CS17 is not required). This is distinct from (a) non-Eisenstein (ρ̄_𝔪 absolutely irreducible), which is neither implied by nor implies (iii), and (b) the stronger CS17 decomposed genericity α_i/α_j ∉ {1, q}. The renaming dictionary for ACC+: the coefficient prime called ℓ here is called p in ACC+, and the auxiliary split prime called p here is called l there.

Work in the global residual-system setting.

([CSnc](#ref-csnc), §2.8, proof of Theorem 1.1, p. 36; [acc23](#ref-acc23), Definition 4.3.1, pp. 76–77 (recalled from [CS17, Defn. 1.9] with p and l swapped).)

The API:

- `IsCSGeneric`: Conditions (i)–(iii) stated above.
- `IsCSGeneric.dual`: Invariance under dual ideals.
- `IsCSGeneric.of_strong`: CS17 strong genericity with length≤2 implies CS-genericity.
- `IsCSGeneric.infinitely_many_primes`: Infinitely many witnesses avoiding any finite set (AG2.7).
- `IsCSGeneric.acc_dictionary`: The ACC+ dictionary, exchanging the two primes.
- `WeaklyGeneric` and `DecomposedGeneric`: the eigenvalue conditions α_i ≠ qα_j (i ≠ j) and α_i/α_j ∉ {1, q} (i ≠ j) at one place.

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.7; Layer IG.0.

**Checks.**

- For 2n = 2, ρ̄ = χ₁ ⊕ χ₂ with χ₁, χ₂ unramified at all v | p (p completely split) and χ₁(Frob_v)/χ₂(Frob_v) ∉ {p, p^{−1}} is CS-generic of length two; ρ̄ = 1 ⊕ ε̄^{−1} is not (its eigenvalue ratio at every such v is p).
- A ρ̄_𝔪 with three or more Jordan–Hölder constituents (for instance a sum of three nonzero subrepresentations of GL_{2n}) is never CS-generic (condition (ii) fails), whatever its eigenvalues.
- CS-generic does not imply non-Eisenstein: the reducible χ₁ ⊕ χ₂ of IsCSGeneric.reducible_ok is CS-generic and Eisenstein.
- Repeated eigenvalues α_i = α_j are allowed when α_i ≠ pα_j (CSnc Remark 1.4).

### IG.7.2 Cohomologically generic Hecke homomorphisms

<a id="ig-7-cohomologically-generic"></a>

Let N ≥ 1, Σ⁺ a finite set of nonarchimedean places of F⁺ containing Σ⁺_bad, and 𝕋_N^{Σ⁺} the abstract spherical Hecke algebra of the unitary groups U(V) of N-dimensional hermitian spaces over F. A homomorphism φ : 𝕋_N^{Σ⁺} → κ to a field is cohomologically generic if H^i_ét(Sh(V, K)_{F̄}, κ)_{𝕋_N^{Σ⁺′} ∩ ker φ} = 0 for every finite Σ⁺′ ⊇ Σ⁺, every i ≠ N − 1, every standard indefinite hermitian space V of dimension N and every K = K_{Σ⁺′} × ∏_{v∉Σ⁺_∞∪Σ⁺′} U(Λ)(O_{F⁺_v}) with Λ self-dual. It is the cohomological conclusion of the compact-case concentration theorem, used as a hypothesis by Liu–Tian–Xiao–Zhang–Zhu.

The hypotheses are: Notation of LTXZZ §3: standard indefinite hermitian spaces have signature (N − 1, 1) at one archimedean place and (N, 0) at the others.

([ltxzz](#ref-ltxzz), Appendix D, §D.1 'Vanishing of cohomology off middle degree', Definition D.1.1, p. 365; [ltxzz](#ref-ltxzz), Published Appendix D, Proposition D.1.3 p.365 and Corollary D.1.4 p.368.)

The API:

- `IsCohomologicallyGeneric`: The stated vanishing predicate on φ.
- `IsCohomologicallyGeneric.mono`: Stability under enlarging Σ⁺.
- `IsCohomologicallyGeneric.field_ext`: Invariance under coefficient-field extension.
- `IsCohomologicallyGeneric.of_decomposedGeneric`: For φ with values in 𝔽̄_ℓ and F⁺≠ℚ, an auxiliary split decomposed-generic witness away from ℓ and from every prescribed finite enlargement of Σ⁺ implies cohomological genericity, by repeated application of LTXZZ PropositionD.1.3 as in CorollaryD.1.4. A single witness is insufficient for an arbitrary abstract Hecke character.

*Needs:* earlier targets of Layer IG.7; AutomorphicGaloisRepresentationsPartII AG2.7.

**Checks.**

- For N = 1 every φ is cohomologically generic.
- The Eisenstein homomorphism attached to the trivial representation (degree of H^0) is not cohomologically generic for N ≥ 2, since H^0 ≠ 0 and 0 ≠ N − 1.
- For N = 2 (Shimura curves), φ is cohomologically generic iff, for every V and K as in the definition, the localized H⁰ and H² vanish.

### IG.7.3 The ordinary contribution and its lower bound

<a id="ig-7-only-ordinary-contributes"></a>

Assume p unramified in F, N ≥ 3 prime to p, divisible only by primes in S^p_f and by N₀, S ⊇ {∞} ∪ {primes dividing pℓNΔ_F} ∪ {ramification of ϖ}, and 𝔪 ⊂ 𝕋^S a CS-generic maximal ideal of the operator algebra with witness prime p (completely split in F). Then H^i(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0 only if b is ordinary, and then only for i ≥ d. The trace-formula and boundary inputs (IG.5, IG.6) are statements about maximal ideals of 𝕋^S_full; they are applied to 𝔪 through IG.0.5. Consequently (Rπ°_HT*𝔽_ℓ)_𝔪 is concentrated on the ordinary locus Fℓ(ℚ_p) and in degrees ≥ d, and H^i(S°_{K(p^∞N),C}, 𝔽_ℓ)_𝔪 ≅ H^i(Fℓ, (Rπ°_HT*𝔽_ℓ)_𝔪) vanishes for i < d.

Work in the global residual-system setting. The further hypotheses are: Witness prime p ≠ ℓ completely split in F.

([CSnc](#ref-csnc), §2.8, proof of Theorem 1.1, p. 36.)

*Needs:* Layer IG.4; Layer IG.6; Layer IG.5; Layer IG.3; earlier targets of Layer IG.7.

### IG.7.4 Level descent

<a id="ig-7-level-descent"></a>

(1) If H^i(S°_{K(p^∞N),C}, 𝔽_ℓ)_𝔪 = 0 for i < d, then H^i(X_{K(N)}, 𝔽_ℓ)_𝔪 = 0 for i < d. (2) For the unitary group: let 𝔪⁰ ⊂ 𝕋^{0,S} be maximal and 𝔪 = heckeRestrict⁻¹(𝔪⁰) ⊂ 𝕋^S. If H^i(X_{K(N)}, 𝔽_ℓ)_𝔪 = 0 for i < d, then H^i(X⁰_{K⁰}, 𝔽_ℓ)_{𝔪⁰} = 0 for i < d at K⁰ = K(N) ∩ G⁰(𝔸_f), because the latter is a quotient of the former (IG.0.6). (3) For arbitrary neat K⁰, rechoose a good generic auxiliary prime away from its bad level primes, then descend from a normal principal-level cover using continuous étale Cartan–Leray, compatibly with the Hecke localization. The arbitrary-neat-level step uses the Hecke-compatible geometric Cartan–Leray isomorphism for normal covers (SchemeAndStackFoundations SF.2) and derived invariants (SR.0d).

Work in the global residual-system setting.

([CSnc](#ref-csnc), §2.8, proof of Theorem 1.1, p. 36.)

*Needs:* earlier targets of Layer IG.7; Layer IG.3; Layer IG.0; SchemeAndStackFoundations SF.2; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0d.

### IG.7.5 Caraiani–Scholze vanishing

<a id="ig-7-caraiani-scholze-vanishing"></a>

Let F be a CM field containing an imaginary quadratic field with F⁺ ≠ ℚ, G⁰ the quasi-split unitary group of signature (n, n) at each archimedean place, K ⊂ G⁰(𝔸_f) neat, d = [F⁺:ℚ]n², and 𝔪 ⊂ 𝕋^{0,S} a maximal ideal of the unitary algebra in the support of H^*(X_K, 𝔽_ℓ) such that (ii) ρ̄_𝔪 has length at most 2 and (iii) there is a prime p ≠ ℓ splitting completely in F with ρ̄_𝔪 unramified at all v | p and α_{i,v} ≠ pα_{j,v} for i ≠ j. Then (1) H^i(X_K, 𝔽_ℓ)_𝔪 ≠ 0 implies i ≥ d, and (2) H^i_c(X_K, 𝔽_ℓ)_𝔪 ≠ 0 implies i ≤ d. It is not asserted that ordinary and compactly supported cohomology are both concentrated in degree d (false in the reducible boundary case).

Work in the global residual-system setting. The further hypotheses are: 𝔪 CS-generic ([IG.7.1](#ig-7-cs-generic-maximal-ideal)).

([CSnc](#ref-csnc), §1, Theorem 1.1, p. 5.)

*Needs:* earlier targets of Layer IG.7; Layer IG.5; ArithmeticLocallySymmetricSpaces ALS.5:finite-level-duality.

### IG.7.6 Integral coefficients and local systems

<a id="ig-7-integral-and-local-system-versions"></a>

Under the hypotheses of [IG.7.5](#ig-7-caraiani-scholze-vanishing): (1) H^i(X_K, ℤ_ℓ)_𝔪 = 0 for i < d and H^i_c(X_K, ℤ_ℓ)_𝔪 = 0 for i > d; (2) H^d(X_K, ℤ_ℓ)_𝔪 is torsion-free; (3) the sequence 0 → H^{d−1}(∂X_K, ℤ_ℓ)_𝔪 → H^d_c(X_K, ℤ_ℓ)_𝔪 → H^d(X_K, ℤ_ℓ)_𝔪 → H^d(∂X_K, ℤ_ℓ)_𝔪 → 0 is exact (∂X_K the Borel–Serre boundary); (4) the same hold for the local systems V_λ attached to algebraic representations with ℤ_ℓ-lattices (via Hochschild–Serre from a deeper ℓ-power level where V_λ/ℓ^m is trivial).

Work in the global residual-system setting. The further hypotheses are: 𝔪 CS-generic.

([CSnc](#ref-csnc), §1, Remark 1.5, pp. 5–6.)

*Needs:* earlier targets of Layer IG.7; ArithmeticLocallySymmetricSpaces ALS.4; ArithmeticGaloisDuality R02.2; ArithmeticLocallySymmetricSpaces ALS.6.

### IG.7.7 Irreducible middle-degree concentration

<a id="ig-7-irreducible-specialization"></a>

If moreover ρ̄_𝔪 is absolutely irreducible (so 𝔪 is non-Eisenstein), then H^i(∂X_K, 𝔽_ℓ)_𝔪 = 0 for all i, hence H^i_c(X_K, 𝔽_ℓ)_𝔪 ≅ H^i(X_K, 𝔽_ℓ)_𝔪 vanish outside i = d; integrally, H^i(X_K, ℤ_ℓ)_𝔪 is concentrated in degree d and torsion-free. This is a separate specialization: the boundary vanishing comes from TorsionCohomologyInfrastructure TC.3 (Borel–Serre boundary strata and their Hecke eigenvalues), and the deduction of concentration is the content of this target.

Work in the global residual-system setting. The further hypotheses are: 𝔪 CS-generic and ρ̄_𝔪 absolutely irreducible.

([CSnc](#ref-csnc), §1, Remark 1.6, p. 6; [acc23](#ref-acc23), Theorem 2.4.2, p. 46 (§2.4); proof pp. 46–49.)

*Needs:* earlier targets of Layer IG.7; ArithmeticLocallySymmetricSpaces ALS.4; TorsionCohomologyInfrastructure TC.3.

### IG.7.8 The ACC+ middle-degree export

<a id="ig-7-acc-middle-degree-export"></a>

Assume [F⁺:ℚ] > 1, F contains an imaginary quadratic field, and the set S satisfies: for every finite place v ∉ S of residue characteristic l, either S contains no l-adic place and l is unramified in F, or l splits in an imaginary quadratic subfield of F. Let 𝔪̃ ⊂ 𝕋̃^S(K̃, λ̃) be a maximal ideal of the Hecke algebra of the quasi-split unitary group G̃ in 2n variables acting on cohomology with coefficients V_λ̃ (an O-lattice in an algebraic representation, O the ring of integers of a finite extension of ℚ_p, p the coefficient prime in ACC+ notation) such that ρ̄_𝔪̃ has length at most 2 and is decomposed generic (ACC+ Definition 4.3.1). Then, with d = n²[F⁺:ℚ], H^d(X̃_K̃, V_λ̃)_𝔪̃ → H^d(X̃_K̃, V_λ̃[1/p])_𝔪̃ is injective and H^d(X̃_K̃, V_λ̃)_𝔪̃ → H^d(∂X̃_K̃, V_λ̃)_𝔪̃ is surjective. Renaming dictionary: ACC+'s coefficient prime p is ℓ here and its auxiliary prime l is p here.

The hypotheses are those stated (ACC+ §4.3); the level and ramification conditions on S are those of ACC+.

([acc23](#ref-acc23), Theorem 4.3.3, p. 77 (§4.3 'Cohomology in the middle degree'); proof pp. 77–78.)

*Needs:* earlier targets of Layer IG.7; ArithmeticLocallySymmetricSpaces ALS.4.

### IG.7.9 Supercuspidal support and lifting for inner forms of GL_n

<a id="ig-7-minguez-secherre-lifting"></a>

Let F/ℚ_p be finite, D a central division algebra over F, m ≥ 1, G = GL_m(D) and ℓ ≠ p. Prove: (1) every irreducible smooth 𝔽̄_ℓ-representation of G has a supercuspidal support, a pair (M, σ) of a Levi subgroup and an irreducible supercuspidal representation σ of M(F) such that π is a subquotient of the normalized parabolic induction of σ, and this pair is unique up to G-conjugacy; (2) every irreducible supercuspidal smooth 𝔽̄_ℓ-representation ρ of G lifts: there is an integral irreducible cuspidal ℚ̄_ℓ-representation ρ̃ of G whose reduction modulo ℓ is ρ (its semisimplified reduction is [ρ]). Statement (2) is about supercuspidal representations only: an irreducible cuspidal representation that is not supercuspidal need not have a lift with irreducible reduction, and no lifting of arbitrary irreducible representations is asserted.

The hypotheses are ℓ ≠ p and D a central division algebra over a finite extension F of ℚ_p; products of such groups are treated factor by factor.

([ms14a](#ref-ms14a), Théorème A, p. 3, for (1); [ms14b](#ref-ms14b), Théorème 3.27, p. 35, with Remarque 3.28, p. 36, which removes the hypothesis on the maximal simple type, for (2); both as used in [kos21](#ref-kos21), §2, Theorem 2.1, p. 4.)

The API: `supercuspidalSupport`, `supercuspidalSupport_unique`, `exists_supercuspidal_lift`.

*Needs:* TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0 (smooth representations over 𝔽̄_ℓ and ℚ̄_ℓ) and SR.2 (normalized parabolic induction and Jacquet functors); TauCetiRoadmap ReductiveGroupsPartII (Levi subgroups of inner forms of GL_n).

**Checks.**

- For D = F and m = 1, every irreducible representation of F^× is a character, is supercuspidal, and lifts by Teichmüller lifting of its values.
- For GL_2(F) with q ≡ −1 modulo ℓ, the cuspidal non-supercuspidal subquotient of the reduction of a principal series is cuspidal but not supercuspidal, so statement (2) does not apply to it; its supercuspidal support is a pair of characters of the diagonal torus.
- In the same case q ≡ −1 modulo ℓ, the cuspidal subquotient has cuspidal support (GL_2, itself) while its supercuspidal support lies on the torus and agrees with that of the other subquotients of the same principal series: cuspidal and supercuspidal supports differ, and only the latter is the invariant used here.

### IG.7.10 Parameter irrelevance for nonsplit inner forms

<a id="ig-7-koshikawa-parameter-irrelevance"></a>

Let G=∏GL_{n_i} over a finite extension F/ℚ_p with residue cardinal q, b∈B(G), and associated J_b not quasi-split (an inner form of the Newton centralizer Levi). For every irreducible smooth 𝔽̄_ℓ-representation π of J_b(F), ℓ≠p, its Fargues–Scholze semisimple parameter is not a generic unramified parameter of G: if it is unramified, the eigenvalues in some factor have α_{j′}/α_j=q for j≠j′. Apply the twisted Levi inclusion appropriate to J_b when viewing its parameter in G. The proof reduces to one factor GL_n, takes the supercuspidal support (M, σ) of π, lifts σ by the preceding target, and uses that the parameter of the lift factors through GL_n(ℤ̄_ℓ) and reduces to the parameter of π; a generic unramified parameter is a sum of characters with no ratio equal to the cyclotomic character, which cannot come from M when M has a factor GL_m(D) with D ≠ F.

The hypotheses are G = ∏ GL_{n_i} over F, ℓ ≠ p, and J_b not quasi-split.

([kos21](#ref-kos21), §§2–3, Theorem 2.1 and Lemma 3.1, pp.4–5; [kos21](#ref-kos21), §3, Lemma 3.1, p.5.)

The API: `koshikawaParameterIrrelevance`.

*Needs:* earlier targets of Layer IG.7 (supercuspidal support and lifting); Layer IG.0 (J_b as an inner form of M_b); ExcursionOperatorsAndSpectralAction ES5, ES6, ES7.

### IG.7.11 Koshikawa local vanishing

<a id="ig-7-koshikawa-local-vanishing"></a>

Let F/ℚ_p be finite with residue field 𝔽_q, (G, b, μ) a local Shimura datum with G = ∏_{i∈I} GL_{n_i}, K = ∏GL_{n_i}(O_F) and M_{(G,b,μ),K} the local Shimura variety, ℓ ≠ p. Let 𝔪 ⊂ ℤ_ℓ[K\G(F)/K] be a maximal ideal whose unramified L-parameter ρ̄_𝔪 is generic (the eigenvalues of ρ̄_𝔪(Frob_F) in each GL_{n_i} satisfy α_{j′}/α_j ≠ q for j ≠ j′). If J_b is not quasi-split, then H^i_c(M_{(G,b,μ),K}, 𝔽̄_ℓ)_𝔪 = 0 for every i (cohomology over the completed algebraic closure), and Koshikawa's integral form H^i_c(M_{(G,b,μ),K}, ℤ_ℓ)_𝔪 = 0 holds as well.

*Proof sketch.* After adjoining q^{1/2}, the compactly supported cohomology is identified, up to shift and twist, with i^{b*}T_μ(i_{1!} c-Ind_K^{G(F)} Λ), Hecke-equivariantly, and each H^i_c is a finitely generated smooth J_b(F)-representation (FS IX.3.1); localization at 𝔪 commutes with these functors. The spectral Bernstein centre acts on c-Ind_K^{G(F)} Λ through End(c-Ind) = H_K^op, and after composing with the inversion [KhK] ↦ [Kh⁻¹K] of H_K this action is the one compatible with unramified parameters; on the 𝔪-localization it factors through the localization of the spectral centre at the parameter of 𝔪, and it commutes with excursion operators. Hence every irreducible subquotient π of the mod-ℓ localized cohomology has Fargues–Scholze parameter ρ̄_𝔪, which is generic, contradicting the parameter-irrelevance target; a nonzero finitely generated smooth representation has an irreducible subquotient, so the mod-ℓ localized cohomology vanishes. Only the 𝔽̄_ℓ form is used later in this roadmap (ordinary costalk–stalk comparison). Deducing the ℤ_ℓ form from the 𝔽̄_ℓ form needs a finiteness property of the 𝔪-localized integral cohomology that makes ℓ topologically nilpotent on it; finite generation as a smooth J_b(F)-representation alone does not give it (the cyclic smooth representation ℤ_ℓ[t^{±1}]/(t − ℓ) of ℚ_p^×, with t the class of p, is nonzero and ℓ-divisible). This step is open; no later target depends on it.

The hypotheses are G a product of GL_{n_i}, hyperspecial K, ℓ ≠ p and ρ̄_𝔪 generic in Koshikawa's sense.

([kos21](#ref-kos21), Theorem 1.1, p. 1 (§1.1 'Local vanishing'); proof §4; [kos21](#ref-kos21), §1.1, p. 1 (definition of 'generic' for the unramified L-parameter ρ_m); used globally in Conjecture 1.2, p. 2; [kos21](#ref-kos21), §4, pp.5–6.)

The API: `koshikawaSpectralSatake`, `koshikawaSpectralSatakeReduction`.

*Needs:* earlier targets of Layer IG.7 (parameter irrelevance); HeckeStacksAndLocalShtukas HS2; ExcursionOperatorsAndSpectralAction ES3, ES5; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.1 (the inversion of H_K).

### IG.7.12 The ordinary costalk lower bound

<a id="ig-7-koshikawa-ordinary-costalk-bound"></a>

For the quasi-split unitary datum, p completely split, ℓ≠p, put F=Rπ°_{HT,*}𝔽_ℓ and let i₀:Fℓ(ℚ_p)→Fℓ_C be the closed ordinary locus. Then RΓ_{Fℓ(ℚ_p)}(Fℓ_C,F)=RΓ_c(Fℓ(ℚ_p),Ri₀!F) lies in D^{≥d}(𝔽_ℓ). The same bound holds for RΓ_c([Fℓ(ℚ_p)/K_p],Ri₀!F) for the sufficiently small compact opens used at finite level. This is an unlocalized costalk bound, not a stalk bound.

([kos21](#ref-kos21), Corollary 8.2 and Lemma 8.3, pp.13–14.)

The API: `koshikawaOrdinaryCostalkBound`.

*Needs:* Layer IG.4; SchemeAndStackFoundations SF.2; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0; EtaleDualityAndPerverseSheaves EDC.5; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0d; LefschetzPencilsAndVanishingCycles LPV.6; DiamondSixOperations S3.

### IG.7.13 Ordinary costalk–stalk comparison

<a id="ig-7-koshikawa-ordinary-costalk-stalk"></a>

With F=Rπ°_{HT,*}𝔽_ℓ and i₀ the closed ordinary locus, let 𝔪_p be a maximal ideal of the local spherical ℤ_ℓ Hecke algebra at p with generic unramified parameter. The natural map RΓ_c([Fℓ(ℚ_p)/K_p],Ri₀!F)_{𝔪_p}→RΓ_c([Fℓ(ℚ_p)/K_p],i₀^*F)_{𝔪_p} is an isomorphism. Localization is at p only. No away-p minimal-stratum theorem or Pink formula is used.

([kos21](#ref-kos21), Proposition 1.7, p.3; proof §9, pp.14–16; Lemma 9.1, p.15.)

The API: `koshikawaOrdinaryCostalkStalk`.

*Needs:* earlier targets of Layer IG.7; Layer IG.3; BunGAndNewtonStrata BG3; ExcursionOperatorsAndSpectralAction ES3; ExcursionOperatorsAndSpectralAction ES4; ExcursionOperatorsAndSpectralAction ES6:duality; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0d; VStackSheavesAndLisseCategories VS4; DiamondSixOperations S3; DiamondSixOperations S4.

### IG.7.14 Koshikawa global vanishing

<a id="ig-7-koshikawa-generic-vanishing"></a>

Let F be a CM field, B = F, V = F^{2n} with the quasi-split unitary similitude group G (the datum of IG.0), p a prime splitting completely in F, K_p hyperspecial, K = K_pK^p sufficiently small, d = dim S_K and ℓ ≠ p. Let 𝔪_p ⊂ ℤ_ℓ[K_p\G(ℚ_p)/K_p] be a maximal ideal of the local Hecke algebra at p whose unramified parameter ρ̄_{𝔪_p} is generic. Then H^i(S_K, 𝔽_ℓ)_{𝔪_p} ≠ 0 only for i ≥ d and H^i_c(S_K, 𝔽_ℓ)_{𝔪_p} ≠ 0 only for i ≤ d. In particular the conclusion of [IG.7.5](#ig-7-caraiani-scholze-vanishing) and of [IG.7.8](#ig-7-acc-middle-degree-export) holds without the hypotheses [F⁺:ℚ] > 1 and "ρ̄_𝔪 of length at most two" (Koshikawa Theorem 1.3; Caraiani–Newton Theorem 2.1.28).

The hypotheses are: p completely split in F; K_p hyperspecial; ρ̄_{𝔪_p} generic (α_{j′}/α_j ≠ q).

([kos21](#ref-kos21), Theorem 1.3, p. 2; proof §9, pp. 14–16; [cn23](#ref-cn23), Proof of Theorem 2.1.28, p. 25.)

*Needs:* earlier targets of Layer IG.7; Layer IG.3; Layer IG.0.

### IG.7.15 The Caraiani–Newton middle-degree export

<a id="ig-7-middle-degree-without-length-hypothesis"></a>

Let F be an imaginary CM field containing an imaginary quadratic field, T ⊇ S_p a finite set of finite places with T = T^c such that every finite v ∉ T of residue characteristic l either has T free of l-adic places and l unramified in F, or l split in an imaginary quadratic subfield of F. Let 𝔪̃ ⊂ 𝕋̃^T(K̃, λ̃) be a maximal ideal with ρ̄_𝔪̃ decomposed generic (Caraiani–Newton Definition 2.1.27: some ℓ ≠ p splits completely in F with ρ̄|_{G_{F_v}} unramified and α_i/α_j ≠ ℓ for all v | ℓ), and d = dim_ℂ X̃_K̃. Then there are 𝕋̃^T-equivariant maps H^d(X̃_K̃, V_λ̃[1/p])_𝔪̃ ↩ H^d(X̃_K̃, V_λ̃)_𝔪̃ ↠ H^d(∂X̃_K̃, V_λ̃)_𝔪̃, the first injective and the second surjective.

The hypotheses are those stated; this is the form needed for F⁺ = ℚ.

([cn23](#ref-cn23), Theorem 2.1.28 and its proof, p. 25 (§2.1); [cn23](#ref-cn23), Theorem 2.1.26, p. 24 (same hypotheses on F as Theorem 2.1.20, p. 22); setup §2.1.11, p. 15.)

*Needs:* earlier targets of Layer IG.7; ArithmeticLocallySymmetricSpaces ALS.4.

### Examples

A two-dimensional residual representation χ₁ ⊕ χ₂ with χ₁(Frob_v)/χ₂(Frob_v) ∉ {p, p⁻¹} at the places above a completely split p is Caraiani–Scholze generic and Eisenstein, so the vanishing theorem applies while the irreducible specialization does not, and ordinary and compactly supported cohomology need not both be concentrated in degree d. For imaginary quadratic F (F⁺ = ℚ) only Koshikawa's route applies; there, a generic unramified parameter at p kills the nonordinary local terms because their J_b is not quasi-split.

### Dependencies

Layers IG.0 and IG.3–IG.6; ArithmeticLocallySymmetricSpaces ALS.4–ALS.6; ArithmeticGaloisDuality R02.2; TorsionCohomologyInfrastructure TC.3; AutomorphicGaloisRepresentationsPartII AG2.7; SchemeAndStackFoundations SF.2; EtaleDualityAndPerverseSheaves EDC.5; LefschetzPencilsAndVanishingCycles LPV.6; DiamondSixOperations S3, S4; TauCetiRoadmap SmoothRepresentationsOfLocalGroups SR.0, SR.0d, SR.1, SR.2; TauCetiRoadmap ReductiveGroupsPartII; and, for Koshikawa's route, ExcursionOperatorsAndSpectralAction ES3–ES7, HeckeStacksAndLocalShtukas HS2, BunGAndNewtonStrata BG3 and VStackSheavesAndLisseCategories VS4.

## Downstream consumers

EllipticCurveModularityImaginaryQuadratic uses the Caraiani–Newton middle-degree export of Layer IG.7 for imaginary quadratic F, where F⁺ = ℚ and the global route is unavailable. CrystallineLocalGlobalCompatibilityCM uses the same export for its middle-degree eigensystems. PotentialAutomorphyInfrastructure uses Caraiani–Scholze vanishing, its integral and irreducible forms, and the ACC+ middle-degree export. AutomorphicGaloisRepresentationsPartII and EndoscopicTransferAndUnitaryTraceComparison take the Igusa varieties of Layers IG.1 and IG.3 as the geometric objects whose trace formulas they compare.

## References

Locators refer to the editions below. For CS17 the printed Annals page is the PDF page plus 648. For the other preprints, page numbers are the displayed preprint pages. Lan–Stroh's published and author copies have different pagination; each locator identifies the edition. The erratum to the compactification paper governs the componentwise lattice exponents. Results used only through the supplier contracts are stated in the generality of the roadmap that supplies them. Kottwitz (Isocrystals with additional structure, Compositio Math. 56, 1985), Rapoport–Richartz (Compositio Math. 103, 1996) and Rapoport–Zink (Period spaces for p-divisible groups, 1996) are cited through the recollections in CS17 §3.1 and §5.4.

<a id="ref-csnc"></a>

**csnc** — Ana Caraiani, Peter Scholze, [On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2). arXiv:1909.01898v2, 22 November 2023, 90 pages. CSnc denotes this edition, not the differently paginated Annals 199 (2024) typesetting.

<a id="ref-cs17"></a>

**cs17** — Ana Caraiani, Peter Scholze, [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Annals of Mathematics 186 (2017), 649–766. CS17 denotes the published edition.

<a id="ref-oz02"></a>

**oz02** — Frans Oort, Thomas Zink, [Families of p-divisible groups with constant Newton polygon](https://emis.muni.cz/journals/DMJDMV/vol-07/09.pdf). Documenta Mathematica 7 (2002), 183–201.

<a id="ref-ham15"></a>

**ham15** — Paul Hamacher, [The geometry of Newton strata in the reduction modulo p of Shimura varieties of PEL type](https://arxiv.org/pdf/1312.0490v2). arXiv:1312.0490v2, 12 November 2014.

<a id="ref-lil21"></a>

**lil21** — Chao Li, Yifeng Liu, [Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf). Author version AIPF.pdf, 67 pages, 16 January 2022; the separately indicated published Lemma 7.3 is in Annals 194 (2021), pp. 859–860.

<a id="ref-man05"></a>

**man05** — Elena Mantovan, [On the cohomology of certain PEL type Shimura varieties](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf). Caltech author preprint, 30 pages; the publication is Duke Mathematical Journal 129 (2005), 573–610.

<a id="ref-lil22"></a>

**lil22** — Chao Li, Yifeng Liu, [Chow groups and L-derivatives of automorphic motives for unitary groups, II.](https://par.nsf.gov/servlets/purl/10338691). Forum of Mathematics, Pi 10 (2022), e5, pp. 1–71.

<a id="ref-shi09"></a>

**shi09** — Sug Woo Shin, [Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf). Berkeley author preprint, 44 pages, 4 October 2008; publication in Duke Mathematical Journal 146 (2009), 509–568.

<a id="ref-ls18a"></a>

**ls18a** — Kai-Wen Lan, Benoît Stroh, [Compactifications of subschemes of integral models of Shimura varieties](https://resolve.cambridge.org/core/services/aop-cambridge-core/content/view/E26A33D14B2E77C4962AE761F6403A1C/S2050509418000208a.pdf/compactifications-of-subschemes-of-integral-models-of-shimura-varieties.pdf). Forum of Mathematics, Sigma 6 (2018), e18, 105 pages. Corresponding author-copy locators are distinguished below.

<a id="ref-box15"></a>

**box15** — George Boxer, [Torsion in the coherent cohomology of Shimura varieties and Galois representations](https://arxiv.org/pdf/1507.05922v1). arXiv:1507.05922v1, 21 July 2015, doctoral dissertation.

<a id="ref-nie15"></a>

**nie15** — Sian Nie, [Fundamental elements of an affine Weyl group](https://arxiv.org/pdf/1310.2229v2). arXiv:1310.2229v2, 3 June 2014.

<a id="ref-ls18b"></a>

**ls18b** — Kai-Wen Lan, Benoît Stroh, [Nearby cycles of automorphic étale sheaves](https://web.archive.org/web/2024id_/https://www-users.cse.umn.edu/~kwlan/articles/nearby-aut.pdf). Author compilation incorporating errata, 4 April 2022, 42 pages; publication in Compositio Mathematica 154 (2018), 80–119.

<a id="ref-sw13"></a>

**sw13** — Peter Scholze, Jared Weinstein, [Moduli of p-divisible groups](https://arxiv.org/pdf/1211.6357v2). arXiv:1211.6357v2, 13 April 2013.

<a id="ref-kos21"></a>

**kos21** — Teruhisa Koshikawa, [On the generic part of the cohomology of local and global Shimura varieties](https://arxiv.org/pdf/2106.10602v1). arXiv:2106.10602v1, 20 June 2021. The quasi-split global vanishing theorem is Theorem 1.3; Theorem 1.4 is the anisotropic case.

<a id="ref-acc23"></a>

**acc23** — Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack A. Thorne, [Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999v2). arXiv:1812.09999v2, 16 June 2022. ACC+ denotes this edition.

<a id="ref-ltxzz"></a>

**ltxzz** — Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568). Inventiones Mathematicae 228 (2022), 107–375.

<a id="ref-cn23"></a>

**cn23** — Ana Caraiani, James Newton, [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3). arXiv:2301.10509v3, 27 March 2025.

<a id="ref-ls18a-author"></a>

**ls18a-author** — Kai-Wen Lan, Benoît Stroh, [Compactifications of subschemes of integral models of Shimura varieties (current author copy)](https://www.kwlan.org/articles/cpt-sub.pdf). 84-page author copy, with the separately linked one-page erratum.

<a id="ref-ls18a-erratum"></a>

**ls18a-erratum** — Kai-Wen Lan, Benoît Stroh, [Errata for Compactifications of subschemes of integral models of Shimura varieties](https://www.kwlan.org/articles/cpt-sub-err.pdf). One-page author erratum; correction to §3.6.

<a id="ref-man08"></a>

**man08** — Elena Mantovan, [A compactification of Igusa varieties](https://www.its.caltech.edu/~mantovan/papers/Igusa.pdf). Caltech author copy, 24 pages; publication in Mathematische Annalen 340 (2008).

<a id="ref-ms14a"></a>

**ms14a** — Alberto Mínguez, Vincent Sécherre, [Représentations lisses modulo ℓ de GL_m(D)](https://arxiv.org/abs/1110.1467v2). arXiv:1110.1467v2; published in Duke Mathematical Journal 163 (2014), 795–887. Locators refer to the arXiv edition.

<a id="ref-ms14b"></a>

**ms14b** — Alberto Mínguez, Vincent Sécherre, [Types modulo ℓ pour les formes intérieures de GL_n sur un corps local non archimédien](https://arxiv.org/abs/1404.0804v1). arXiv:1404.0804v1, with an appendix by Vincent Sécherre and Shaun Stevens; published in Proceedings of the London Mathematical Society 109 (2014), 823–891. Locators refer to the arXiv edition.
