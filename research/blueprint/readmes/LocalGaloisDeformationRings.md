# Local Galois deformation rings and their components

This document is the reader's version of the blueprint packet `research/blueprint/packets/LocalGaloisDeformationRings.json`; the two agree, and the packet is the reference for every statement, prerequisite and source locator. It covers all eight layers of the roadmap — R08.1–R08.6, L7 and L8 — within the boundaries of the accepted restructuring RS-08. The plan is at target level (PROTOCOL.md §2): one item for each target a layer states and for each definition or key theorem a target needs, each with its exact statement, a proof outline citing the source, and its direct prerequisites; every definition and construction carries its API and at least three unit tests. Nothing here claims to be formalised.

## Purpose, scope and boundaries

The roadmap constructs the local Galois deformation rings used by modularity lifting — Khare–Wintenberger and Kisin for GL₂ over totally real fields, and the rank-n, G-valued and GSp₄ arguments of Clozel–Harris–Taylor, Thorne, Geraghty, Calegari–Geraghty, Allen et al., Boxer–Calegari–Gee–Pilloni, Newton–Thorne and Caraiani–Newton — with genuine moduli meaning and the geometric properties patching needs: dimension, flatness, reducedness, normality and the Cohen–Macaulay property, smoothness of the generic fibre, irreducible components and which components a given point lies on. Rings with the same characteristic-zero points are not interchangeable unless their integral structures are compared.

**Boundaries.**
- *Imported, never rebuilt:* the generic framed and unframed deformation functors and their determinant variants (GlobalGaloisDeformations R04.1–R04.2); coefficient categories, Schlessinger representability and the relation–obstruction algebra (DeformationAndDerivedPatchingAlgebra R03.1–R03.3); period rings, D_cris, D_st, D_pst, Weil–Deligne representations and the ordinarity and Fontaine–Laffaille criteria (PadicHodgeTheory R06.2–R06.4, P7); Fontaine–Laffaille, Raynaud and Breuil–Kisin integral theory: the Fontaine–Laffaille category and its realisation, Kisin modules with and without coefficients, their E-height and lattice uniqueness, connectedness and the dyadic classification (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.3, R07.4; Kisin modules with tame descent data are requested there); Grassmannians (AlgebraicModuliForArithmeticGeometry R09.1); local Tate duality, the Euler characteristic and the local Artin map (Tau Ceti ClassFieldTheory Layers 5 and 7); Kummer theory (Tau Ceti ProfiniteCohomology Layer 9); the integral general symplectic matrix group and its multiplier (ArithmeticStatistics ST.5, with a requested smooth group-scheme and Lie-algebra extension; Tau Ceti's ClassicalGroups Layer 0 works over ℂ); block theory for GL₂(ℚ_p) (PadicLocalLanglandsForGL2Qp R30.5).
- *Owned here (RS-08 owners):* actual local G_K rings with their tangent and obstruction calculations (R08.1); away-from-p types retaining monodromy (R08.2); potentially semistable rings in every rank (R08.3, per finding /18); rank-general height-lattice moduli and proper images, built on R07.4's lattices as the functor of a deformation family (L7), and the local deformation conditions and GL₃ charts that wrap R07.3's and R07.4's categories (L7, R08.5); the determinant-versus-flag comparison (L8); rank-two Barsotti–Tate component geometry (R08.4); dyadic and endpoint exceptions (R08.5); tangent spaces of the actual local conditions as subspaces of local H¹ (R08.6).
- *Not here:* global deformation rings and their presentations (GlobalGaloisDeformations R04.3–R04.6, G7, G8); patching (DeformationAndDerivedPatchingAlgebra, PotentialAutomorphyInfrastructure); the trianguline variety (the Breuil–Hellmann–Schraen roadmap); general de Rham lifting (GL2ModularityLifting R32); polarized automorphy lifting (its Part II).

## Standing conventions

- p is the coefficient prime; E/ℚ_p is a finite coefficient field, large enough, with ring of integers 𝒪, uniformiser ϖ (also λ) and residue field k (also 𝔽). C_𝒪 is the category of complete Noetherian local 𝒪-algebras with residue field k; for residue fields that are p-adic or local of characteristic p, Λ and 𝔄_Λ are as in `R08.1/coefficient-rings-lambda`.
- K, F_v denote finite extensions of ℚ_ℓ; ℓ = p is allowed unless the layer says otherwise. G_K is the absolute Galois group, I_K inertia, P_K the kernel of I_K ↠ ℤ_p when ℓ ≠ p, and φ, Frob a Frobenius lift. The local Artin map sends uniformisers to geometric Frobenius (Tau Ceti ClassFieldTheory Layer 7).
- R^□_ρ̄ is the framed lifting ring; R^{□,ψ}_ρ̄ fixes the determinant ψ; R^□_{ρ̄,G} is G-valued. A local deformation problem is a closed, strictly-equivalence-stable subfunctor (GlobalGaloisDeformations R04.3), determined by its ring.
- Hodge–Tate weights: HT(χ_p) = +1 (PadicHodgeTheory R06.2). Sources that use HT(χ_p) = −1 (Caraiani–Newton, Boxer–Calegari–Gee–Pilloni, Liu et al.) are translated in the nodes that cite them. 'Weight k' for GL₂ means Hodge–Tate weights {0, k − 1}.
- 'Smooth point' of a generic fibre means a closed point at which the completed local ring is regular; 'pure' is in the sense of Taylor–Yoshida.

## Dependencies on other roadmaps

- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality** — Local Tate duality H²(G_K, M) ≅ H⁰(G_K, M^∨(1))^∨ and the local Euler characteristic formula h⁰ − h¹ + h² = −[K:ℚ_p]·dim M (ℓ = p), 0 (ℓ ≠ p), for finite discrete G_K-modules M of p-power order. The layer's planned declarations tateDualityPairing_perfect_mixed and eulerCharacteristic_finrank_fp are the statements used (red-team finding RT-AREA-langlands-2/16): every dimension and smoothness node of R08.1–R08.6, L7 and L8 that counts tangent or obstruction dimensions lists this layer as a prerequisite, and the atlas link ClassFieldTheory Layer 5 → LocalGaloisDeformationRings R08.1 is requested. (needed by `L7/discrete-series-smoothness`, `L7/fontaine-laffaille-tangent-space-and-smoothness`, `L7/g-valued-ordinary-components`, `L7/gl2-borel-ordinary-ring`, `L7/gsp4-ordinary-generic-fibres`, `L7/gsp4-ordinary-regularity`, …).
- **DeformationAndDerivedPatchingAlgebra:R03.2** — The presentation algebra relating relations to obstructions: for a lifting ring with tangent dimension d, a minimal presentation 𝒪[[x₁..x_d]]/J has H²(G, ad ρ̄)^∨ ↠ J/𝔪J (equivalently (J/𝔪J)^∨ ↪ H²(G, ad ρ̄)). (needed by `R08.1/local-tangent-obstruction`, `R08.1/local-lifting-ring`).
- **DeformationAndDerivedPatchingAlgebra:R03.1** — Completed tensor products over 𝒪 and residue-field extension of coefficient rings. (needed by `R08.1/local-residue-field-change`).
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4** — Breuil–Kisin theory over 𝔖 = W⟦u⟧ with E(u): étale φ-modules M(V) over 𝒪_ℰ with coefficients, lattices of E-height ≤ h and their uniqueness (Kisin 2006, 2.1.12 with the repaired proof of Kisin 2008, Errata (E.4)), and 'semistable with Hodge–Tate weights in [0, h] ⇒ E-height ≤ h' with the identification of filtrations (Kisin 2006, 1.2.2, 1.2.8, 2.1.5). (needed by `L7/finite-height-lattices`, `R08.3/semistable-height-quotient`).
- **AlgebraicModuliForArithmeticGeometry:R09.1** — Grassmannians of finite projective modules over Artinian rings, very ample line bundles, and the closedness of the conditions defining φ-stable lattices, for the bounded affine Grassmannian in which lattices of E-height ≤ h live. (needed by `L7/height-lattice-moduli`).
- **DeformationAndDerivedPatchingAlgebra:R03.3** — dim R = dim R[1/p] + 1 for a nonzero p-torsion-free complete local Noetherian 𝒪-algebra, and equidimensionality passing between R and R[1/p]. (needed by `R08.3/pst-generic-fibre`, `R08.6/export-completed-tensor-product`, `R08.6/local-nonemptiness`, `R08.6/smooth-resolution-criterion`).
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1** — Raynaud's results on finite flat group schemes over 𝒪_K: stability of finite flat representations under subobjects, quotients and direct sums ([Ra, 2.2]); for e < p − 1, uniqueness of finite flat prolongations and splitting of extensions with split generic fibre ([Ra, 3.3.3, 3.3.6]); the inertial weights ω^i, 0 ≤ i ≤ e, of finite flat characters ([Ra, 3.4.3]); and compatible systems of finite flat models form a p-divisible group ([Ra, 2.3.1]). (needed by `R08.4/flat-deformation-condition`, `R08.4/small-ramification-flat`, `R08.4/rank-two-ordinary-locus`, `L7/gsp4-flat-ordinary-smoothness`).
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4** — For p > 2: the equivalence between Kisin modules of E-height ≤ 1 over 𝔖 and finite flat group schemes (objects killed by p) and p-divisible groups (Kisin's (2.2.22)); Breuil's full faithfulness of restriction from G_K to G_{K_∞} on finite flat representations; the multiplicative/étale dictionary (Kisin (1.1.15), (1.2.11)); and crystalline representations with Hodge–Tate weights {0, 1} are Barsotti–Tate. (needed by `R08.4/finite-flat-model-moduli`, `R08.4/flat-generic-fibre`, `R08.4/ordinary-type-of-components`).
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4** — Breuil–Mézard strongly divisible modules in Hodge–Tate weights (0, 1) with tame descent data, their Galois lattices and reductions (Savitt §§2–5). (needed by `R08.4/savitt-weight-two-rings`).
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors** — The local Artin map Art_{F_v} : F_v^× → G_{F_v}^{ab} with its normalisation, restricted to 𝒪_{F_v}^× ≅ I^{ab}_{F_v} and completed to 𝒪_{F_v}^×(p) ≅ I^{ab}_{F_v}(p). (needed by `L8/ordinary-coefficient-ring`).
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4** — Kisin's classification at p = 2 (Modularity of 2-adic Barsotti–Tate representations §1): connected finite flat 𝒪_K-group schemes ↔ connected Kisin modules (Mod/𝔖)^c (1.3.9) with the G_{K∞}-realisation (1.3.10), full faithfulness of G_K-representations on G_{K∞} for connected objects (1.3.13), connected p-divisible groups ↔ (Mod/𝔖)^c over 𝒪_E (1.2.8), and (1.3.2) (successive extensions of connected objects are connected). (needed by `R08.5/connected-kisin-modules-with-coefficients`, `R08.5/flat-connected-deformation-ring`, `R08.5/etale-multiplicative-parts`).
- **ArithmeticStatistics:ST.5** — Extend the integral matrix carrier and multiplier of ST.5/symplectic-similitude-group to the smooth affine GSp group scheme over any coefficient DVR, with derived group Sp and integral Lie algebras of dimensions 11 and 10 in rank four, compatible with both transpose conventions. ClassicalGroups Layer 0 over ℂ does not supply this generality. (needed by `R08.1/g-valued-framed-ring`).
- **PadicHodgeTheory:P7** — (φ, Γ_K)-modules over the Robba ring ℛ_{K,E} with E-coefficients, the equivalence D_rig with étale objects, Ext groups Ext^i_{(φ,Γ)} with their Euler characteristic and duality, triangulations and trianguline parameters, and de Rham (φ, Γ)-modules. (needed by `R08.1/phi-gamma-module-deformation-rings`).
- **tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory** — The Kummer isomorphism H¹(G_L, μ_{p^n}) ≅ L^×/L^{×p^n} for L = F^nr (so G_L = I_v), D_v/I_v-equivariant, as used in KW II Lemma 3.7. (needed by `R08.4/finite-cocycles-kummer`, `L7/gsp4-flat-ordinary-smoothness`).
- **PadicHodgeTheory:R06.4** — KW II Lemma 3.5 as one statement, including the Berger–Li–Zhu case: for F/ℚ_p unramified and ρ a crystalline lift of weight k of ρ̄ (2 ≤ k ≤ p), ρ is ordinary if ρ̄ is; for F = ℚ_p the same holds for k = p + 1 (Berger–Li–Zhu); semistable non-crystalline weight-2 lifts are ordinary; weight-2 lifts crystalline over ℚ_p^nr(μ_p) are ordinary if ρ̄ is. R06.4 is the single owner (red-team finding RT-AREA-langlands-2/17, with /31); OrdinaryAutomorphicFormsAndModularityLifting R21.5 imports it too, keeping only Skinner–Wiles' global p = 3 branch. (needed by `R08.5/weight-p-plus-one-ordinary-ring`, `R08.5/weight-p-crystalline-ordinarity`).
- **DeformationAndDerivedPatchingAlgebra:R03.3** — Graded Cohen–Macaulay rings and Hilbert series: for a Cohen–Macaulay standard graded k-algebra (or its completion) of dimension d, a sequence of d degree-one elements is regular iff the Hilbert series of the quotient is (1 − t)^d·H; the canonical module ω of a complete local Cohen–Macaulay ring, its type dim_k ω/𝔪ω, invariance of the type modulo a regular sequence, and Gorenstein ⟺ type 1. (needed by `L7/eigenvalue-ring-normal-cm-type-three`).
- **PadicLocalLanglandsForGL2Qp:R30.5** — For a block B of mod p representations of GL₂(ℚ_p) and a character δ, the pseudo-character (pseudodeformation) ring R^{ps,δ}_B of the block with its universal pseudo-character T^δ_B, and CDN's Théorème 5.11 ([CDN, Théorème 0.1] of their earlier paper): for M supercuspidal, R_{B,M} is the ring of bounded analytic functions on an open of ℙ¹, a finite product of PIDs, carrying ρ_{B,M} with trace T^{δ_M}_B. (needed by `R08.3/weil-deligne-type-ring`).
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality** — Extend local continuous-cohomology duality, finiteness and Euler characteristic to finite-dimensional modules over κ that is a characteristic-zero local field or a possibly infinite characteristic-p local field, with the natural topology, as in PQ26 Lemma 3.1. Also supply the κ-linear H² structure and scalar-extension comparison; the pinned TauCeti H2 is only an additive group. (needed by `R08.1/lambda-presentation`, `R08.1/g-valued-presentations`).
- **PadicHodgeTheory:R06.3** — Prove the descent-data ColmezFontainePst proposition defined by R06.2/colmez-fontaine-theorem, with finite coefficient fields and the scalar-extension comparison needed for completed local filtered (φ,N)-module deformations. The supplier packet proposes R06.3/colmez-fontaine-proof but contains no such theorem node yet. Supply the explicit projection from its full WD pair (r,N) to the p-adic inertia type that forgets N. (needed by `R08.3/filtered-phi-N-deformations`, `R08.3/hodge-and-galois-types`).
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4** — Kisin modules with tame descent data: for K/ℚ_p unramified, a tame extension L′/K of degree e′ = p^{f′} − 1 with Δ = Gal(L′/K), and a coefficient ring R, finite projective 𝔖_{L′,R} = (W(k′) ⊗ R)⟦v⟧-modules 𝔐 of E(v)-height in [0, h] with a semilinear Δ-action commuting with φ (LLHLM 2020 Definition 3.1.3, after Caruso–Liu and LLHLM 2018 §2), their étale φ-modules (𝔐 ⊗ 𝒪_{ℰ,L′})^{Δ=1} and the functor T*_dd to Rep_R(G_{K∞}), with base change in R. R07.4 plans Kisin modules with and without coefficients but not with descent data on 𝔖_{L′}. (needed by `L7/kisin-modules-tame-descent`, `L7/semisimple-kisin-modules-and-shapes`, `L7/gl3-explicit-rings`).
- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory** — Over a field: Borel subgroups and maximal tori of a split connected reductive group, their conjugacy, N_G(B) = B and the canonical torus B/R_u(B) independent of the Borel (Layer 7), with the split Chevalley–Demazure group over ℤ base-changed to 𝒪 (Layer 9). Used for the G-valued ordinary condition of FKP Appendix B. The relative version over coefficient rings (SGA3 XXII 5.8.3) is recorded as a gap. (needed by `L7/g-valued-ordinary-condition`).
- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ** — The pinned split Chevalley–Demazure group scheme over ℤ with its split maximal torus and Borel, base-changed to the coefficient ring 𝒪, as the G of FKP Appendix B's G-valued ordinary condition in the split case. (needed by `L7/g-valued-ordinary-condition`).

Nodes of other packets cited directly: `AdicSpacesPartII:F0/grothendieck-algebraization`, `AdicSpacesPartII:F0/theorem-on-formal-functions`, `ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor`, `ArithmeticGaloisRepresentations:R01.2/tame-inertia-and-fundamental-characters`, `ArithmeticStatistics:ST.5/symplectic-similitude-group`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-essential-image-subquotients`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-filtered-modules`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-full-faithfulness`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-functor-torsion`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/dyadic-classification`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-with-coefficients`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/finite-height-lattices`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules-with-coefficients`, `GlobalGaloisDeformations:G7/polarized-deformation-problem`, `GlobalGaloisDeformations:R04.1/change-of-coefficients`, `GlobalGaloisDeformations:R04.1/fixed-determinant-functors`, `GlobalGaloisDeformations:R04.1/lifting-functor`, `GlobalGaloisDeformations:R04.1/strict-deformation-functor`, `GlobalGaloisDeformations:R04.1/strict-vs-full-conjugacy`, `GlobalGaloisDeformations:R04.1/tangent-spaces`, `GlobalGaloisDeformations:R04.2/change-of-residue-field`, `GlobalGaloisDeformations:R04.2/fixed-determinant-rings`, `GlobalGaloisDeformations:R04.2/framed-unframed-comparison`, `GlobalGaloisDeformations:R04.2/phi-p-condition`, `GlobalGaloisDeformations:R04.2/phi-p-global`, `GlobalGaloisDeformations:R04.2/universal-continuous-lift`, `GlobalGaloisDeformations:R04.2/universal-deformation-ring`, `GlobalGaloisDeformations:R04.2/universal-lifting-ring`, `GlobalGaloisDeformations:R04.3/deformation-problem-ideal`, `GlobalGaloisDeformations:R04.3/local-deformation-problem`, `GlobalGaloisDeformations:R04.4/inertia-rigid-deformations`, `PadicHodgeTheory:R06.1/semistable-period-ring`, `PadicHodgeTheory:R06.2/coefficient-field-base-change`, `PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful`, `PadicHodgeTheory:R06.2/filtered-phi-n-modules-with-descent-data`, `PadicHodgeTheory:R06.2/filtered-vector-spaces`, `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`, `PadicHodgeTheory:R06.2/weak-admissibility`, `PadicHodgeTheory:R06.3/potentially-semistable-dieudonne-module`, `PadicHodgeTheory:R06.3/weil-deligne-parameter`, `PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion`, `PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison`, `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences`, `PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary`, `PadicHodgeTheory:R06.4/ordinary-implies-semistable`, `PadicHodgeTheory:R06.4/ordinary-representation`, `PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion`, `PadicHodgeTheory:R06.4/weight-p-endpoint-branch`, `PadicHodgeTheory:R06.4/weight-p-plus-one-branch`, `PadicMeasuresIwasawaAlgebras:L1/convolution-algebra`.

Library declarations cited (read at the pinned commits Mathlib 082e2d3 and Tau Ceti f790474): `mathlib:MvPowerSeries`, `mathlib:ProfiniteGrp`, `tauceti:TauCeti.ContCohomology.H2`, `mathlib:Module.Finite`, `mathlib:Matrix.symplecticGroup`, `mathlib:IsAdicComplete`, `mathlib:IsLocalRing.ResidueField`, `mathlib:PowerSeries.exists_isWeierstrassFactorization`, `mathlib:PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod`.

## The build, in layers

### Layer R08.1: Unrestricted local rings

R08.1 specialises GlobalGaloisDeformations R04.1's generic lifting functors to G_K for K/ℚ_ℓ finite (ℓ = p allowed) and proves what is specific to local fields. Representability and the presentation 𝒪⟦x₁, …, x_d⟧/J with d = dim Z¹(G_K, ad ρ̄) and at most h²(G_K, ad ρ̄) relations come from DeformationAndDerivedPatchingAlgebra R03.2; the dimension bound 1 + n² + n²[K:ℚ_p] (resp. 1 + n²) comes from local Tate duality and the local Euler characteristic of Tau Ceti ClassFieldTheory Layer 5 (`tateDualityPairing_perfect_mixed`, `eulerCharacteristic_finrank_fp`), which every dimension and smoothness node of this roadmap cites. The layer also fixes the coefficient rings Λ attached to residue fields that are finite, p-adic or local of characteristic p (Böckle–Iyengar–Paškūnas), proves that the completed local ring of the generic fibre at a closed point is the characteristic-zero framed ring of the specialisation (Kisin's comparison, as used by Calegari–Geraghty and Boxer–Calegari–Gee–Pilloni), characterises its smooth points by H² and purity, computes the universal ring of a character, twists the fixed-determinant ring through the power map φ_d (so p | d is allowed), and sets up G-valued framed rings for smooth affine G (Paškūnas–Quast), used for GSp₄ with fixed similitude. Deformation rings of (φ, Γ)-modules (Ding) are recorded with their trianguline and de Rham quotients; the trianguline variety itself is not planned here.

*Planets:* Local framed deformation ring; Local dimension bound; Odd archimedean ring at 2; Completions at generic-fibre points; Determinant twisting; G-valued framed deformation rings.

#### `R08.1/local-lifting-ring` — The local framed deformation ring (theorem)

K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. The lifting functor Lift_ρ̄ of GlobalGaloisDeformations R04.1 is pro-represented by a complete local Noetherian 𝒪-algebra R^□_ρ̄ ∈ C_𝒪 with universal lift ρ^□ : G_K → GL_n(R^□_ρ̄).

*Hypotheses and conventions.*
- G_K satisfies Φ_p (K^×/K^{×p} is finite for every finite K′/K, by local class field theory).

*Proof outline.* G_K satisfies Φ_p: open subgroups are G_{K′} for finite K′/K and Hom(G_{K′}, 𝔽_p) = Hom(K′^×/K′^{×p}, 𝔽_p) is finite. Apply the generic representability theorem for the lifting functor of a group satisfying Φ_p (GlobalGaloisDeformations R04.2/universal-lifting-ring, via DeformationAndDerivedPatchingAlgebra R03.2). The universal lift is the continuous limit of the Artinian universal lifts (GlobalGaloisDeformations R04.2/universal-continuous-lift).

*Acceptance.* n = 1, ρ̄ = 1: R^□ = 𝒪[[G_K^{ab,(p)}]], with G_K^{ab,(p)} ≅ ℤ_p^{[K:ℚ_p]+1} × (finite p-group) for ℓ = p and ℤ_p × (finite) for ℓ ≠ p (local class field theory). If H²(G_K, ad ρ̄) = 0 then R^□ is formally smooth over 𝒪 (local-tangent-obstruction). The comparison with restrictions of the global universal representation is not proved here: it belongs to GlobalGaloisDeformations R04.3 (RS-08).

*Prerequisites.* `GlobalGaloisDeformations:R04.1/lifting-functor`, `GlobalGaloisDeformations:R04.2/phi-p-condition`, `GlobalGaloisDeformations:R04.2/phi-p-global`, `GlobalGaloisDeformations:R04.2/universal-lifting-ring`, `GlobalGaloisDeformations:R04.2/universal-continuous-lift`, `DeformationAndDerivedPatchingAlgebra:R03.2`.

*Sources.* Toby Gee (GEE-MLT-2022), §3.1 and Lemma 3.2, p. 12; Mark Kisin (KISIN-LECTURES), Lecture 1, (1.2) and Proposition (1.2.1)(1), p. 2.

#### `R08.1/local-tangent-obstruction` — Tangent and obstruction description of local lifting rings (theorem)

K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. (1) m_{R^□}/(m², λ) is dual to Z¹(G_K, ad ρ̄), of dimension h¹ + n² − h⁰ where h^i = dim_𝔽 H^i(G_K, ad ρ̄). (2) R^□_ρ̄ ≅ 𝒪[[x₁, …, x_d]]/J with d = dim Z¹(G_K, ad ρ̄), and the canonical obstruction map H²(G_K, ad ρ̄)^∨ ↠ J/𝔪J is surjective (equivalently (J/𝔪J)^∨ ↪ H²(G_K, ad ρ̄)), so J is generated by at most h² elements. (3) By local Tate duality h² = dim H⁰(G_K, ad ρ̄^∨(1)), and by the local Euler characteristic formula h⁰ − h¹ + h² = −n²[K:ℚ_p] if ℓ = p and 0 if ℓ ≠ p; hence dim R^□_ρ̄ ≥ 1 + n² + n²[K:ℚ_p] if ℓ = p and ≥ 1 + n² if ℓ ≠ p, and R^□_ρ̄ is formally smooth of relative dimension n²(1 + [K:ℚ_p]) if ℓ = p and n² if ℓ ≠ p when H⁰(G_K, ad ρ̄^∨(1)) = 0.

*Hypotheses and conventions.*
- Local Tate duality and the local Euler characteristic formula are imported from Tau Ceti ClassFieldTheory Layer 5.
- The relation count (obstructions in H²) is the general presentation algebra of DeformationAndDerivedPatchingAlgebra R03.2.

*Proof outline.* (1) is GlobalGaloisDeformations R04.1/tangent-spaces for G = G_K. (2): choose a surjection 𝒪[[x₁, …, x_d]] ↠ R^□ inducing an isomorphism on tangent spaces; the obstruction to lifting ρ^□ mod 𝔪J across 0 → J/𝔪J → 𝒪[[x]]/𝔪J → R^□ → 0 is a class in H²(G_K, ad ρ̄) ⊗ J/𝔪J whose map H²(G_K, ad ρ̄)^∨ → J/𝔪J is surjective by minimality (its transpose is injective) (Mazur's argument, R03.2). (3): Krull dimension ≥ 1 + d − (number of generators of J) ≥ 1 + (h¹ + n² − h⁰) − h² = 1 + n² − χ(G_K, ad ρ̄), and −χ = n²[K:ℚ_p] for ℓ = p, 0 for ℓ ≠ p. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* n = 1, ℓ = p, K = ℚ_p, ρ̄ = 1: h⁰ = 1, h¹ = 2, h² = 0 (p odd) and dim R^□ = 3 = 1 + 1 + 1. ℓ ≠ p with ρ̄ unramified and ad ρ̄(1)^{G_K} = 0: R^□ is formally smooth of relative dimension n². K = ℚ_ℓ, ℓ ≠ p, ℓ ≡ 1 mod p, n = 1, ρ̄ = 1: h² = h⁰(𝔽(1)) = 1 and R^□ = 𝒪[[x, y]]/((1 + y)^{p^m} − 1), m = v_p(ℓ − 1), of dimension 2 = 1 + n² but not formally smooth.

*Prerequisites.* `R08.1/local-lifting-ring`, `GlobalGaloisDeformations:R04.1/tangent-spaces`, `DeformationAndDerivedPatchingAlgebra:R03.2`, `tauceti:TauCeti.ContCohomology.H2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Toby Gee (GEE-MLT-2022), Corollary 3.12, Lemma 3.13 and Corollary 3.14, pp. 13–14; Mark Kisin (KISIN-LECTURES), Lecture 1, Lemma (1.3.1)(2), p. 3.

#### `R08.1/local-fixed-determinant` — Fixing the determinant of local lifts (theorem)

K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. Let χ : G_K → 𝒪^× lift det ρ̄. The fixed-determinant lifting ring R^□_{ρ̄,χ} (GlobalGaloisDeformations R04.2) has tangent space Z¹(G_K, ad⁰ρ̄) and obstructions in H²(G_K, ad⁰ρ̄) when p ∤ n; its dimension is ≥ 1 + (n² − 1)(1 + [K:ℚ_p]) for ℓ = p and ≥ n² for ℓ ≠ p; and R^□_ρ̄ ≅ R^□_{ρ̄,χ} ⊗̂_𝒪 𝒪[[G_K^{ab,(p)}]] (p ∤ n).

*Hypotheses and conventions.*
- p ∤ n, so ad ρ̄ = ad⁰ρ̄ ⊕ 𝔽 as G_K-modules and n-th roots of characters ≡ 1 exist.

*Proof outline.* Specialise GlobalGaloisDeformations R04.2/fixed-determinant-rings to G = G_K. Tangent/obstruction: as in local-tangent-obstruction with ad⁰ in place of ad; the Euler characteristic of ad⁰ is −(n² − 1)[K:ℚ_p] for ℓ = p and 0 for ℓ ≠ p. The decomposition identifies the determinant directions with the lifting ring of the trivial character, 𝒪[[G_K^{ab,(p)}]]. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* n = 1: R^□_{ρ̄,χ} = 𝒪. For p | n the splitting ad = ad⁰ ⊕ 𝔽 fails and the decomposition must not be used. Dimensions add: dim R^□ = dim R^□_χ + dim 𝒪[[G_K^{ab,(p)}]] − 1.

*Prerequisites.* `R08.1/local-lifting-ring`, `R08.1/local-tangent-obstruction`, `GlobalGaloisDeformations:R04.1/fixed-determinant-functors`, `GlobalGaloisDeformations:R04.2/fixed-determinant-rings`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Toby Gee (GEE-MLT-2022), §3.18 and Exercise 3.19, p. 15.

#### `R08.1/local-forget-framing` — Forgetting the framing of local lifts (theorem)

K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. If ρ̄ is Schur as a G_K-representation, the local universal deformation ring R_ρ̄ exists and R^□_ρ̄ ≅ R_ρ̄[[X_{ij}]]/(X_{11}) (n² − 1 variables), also with fixed determinant. If ρ̄ is not Schur (the usual case locally), R_ρ̄ need not exist and only the framed ring, with the conjugation action of the formal group Γ̂_n, is used.

*Hypotheses and conventions.*
- Schur for ρ̄|_{G_K} is a strong condition: it fails for every reducible semisimple ρ̄ and for ρ̄ unramified with repeated Frobenius eigenvalues.

*Proof outline.* Specialise GlobalGaloisDeformations R04.2/universal-deformation-ring and framed-unframed-comparison to G = G_K. Non-Schur case: centralisers of lifts can be larger than scalars, so Schlessinger's H4 fails and the unframed functor has only a hull (R03.2).

*Acceptance.* For ρ̄ absolutely irreducible as a G_K-representation, dim R^□ = dim R + n² − 1. For ρ̄ = 1 ⊕ 1 the framed ring exists but no universal deformation ring does. Counting: dim H¹ − dim Z¹ = −(n² − 1) for Schur ρ̄.

*Prerequisites.* `R08.1/local-lifting-ring`, `GlobalGaloisDeformations:R04.2/universal-deformation-ring`, `GlobalGaloisDeformations:R04.2/framed-unframed-comparison`, `GlobalGaloisDeformations:R04.1/strict-vs-full-conjugacy`.

*Sources.* Mark Kisin (KISIN-LECTURES), Lecture 1, Remark (1.2.2)(3), p. 2; Toby Gee (GEE-MLT-2022), Exercise 3.9, p. 13.

#### `R08.1/archimedean-rings-p-odd` — Archimedean deformation rings for odd p (lemma)

Let K = ℝ, G_ℝ = {1, c}, p odd, and ρ̄ : G_ℝ → GL_n(𝔽). Then H^i(G_ℝ, ad ρ̄) = 0 for i ≥ 1, R^□_ρ̄ is formally smooth over 𝒪 of relative dimension n² − dim (ad ρ̄)^{c}, and every lift is Γ̂_n-conjugate to the Teichmüller lift of ρ̄ (with ρ̄(c) diagonalised). For n = 2 and ρ̄ odd (det ρ̄(c) = −1), the relative dimension is 2, and with fixed determinant χ (χ(c) = −1) it is also 2.

*Hypotheses and conventions.*
- |G_ℝ| = 2 is invertible in 𝔽 when p is odd.

*Proof outline.* H^i of a finite group of order invertible on the coefficients vanishes in positive degrees. By local-tangent-obstruction (with the same argument over G_ℝ) R^□ is formally smooth of relative dimension dim Z¹ = n² − h⁰. For n = 2, ρ̄(c) ~ diag(1, −1): (ad ρ̄)^c is the diagonal matrices, of dimension 2, so the relative dimension is 4 − 2 = 2; lifts of c are the involutions with trace 0, a smooth surface. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* n = 1: R^□ = 𝒪. n = 2, ρ̄(c) = diag(1, −1): R^□ = 𝒪[[b, c′]] via M = (a b; c′ −a) with a = (1 − bc′)^{1/2}. For ρ̄(c) = ±1 (even), (ad ρ̄)^c is everything and R^□ = 𝒪.

*Prerequisites.* `R08.1/local-tangent-obstruction`, `GlobalGaloisDeformations:R04.1/lifting-functor`, `GlobalGaloisDeformations:R04.1/tangent-spaces`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Shen-Ning Tung (TUNG-2021), §3.2.5, Proposition 3.2.7, p. 15.

#### `R08.1/archimedean-odd-ring-p2` — The odd archimedean deformation ring at p = 2 (theorem)

Let p = 2, n = 2, K = ℝ, ψ : G_ℝ → 𝒪^× with ψ(c) = −1, and ρ̄ : G_ℝ → GL₂(𝔽) with det ρ̄ = ψ mod 2 (so ρ̄(c) is 1 or conjugate to (1 1; 0 1)). The fixed-determinant lifts send c to M = (a b; c′ −a) with a² + bc′ = 1, so R^{□,ψ} = 𝒪[[a − a₀, b − b₀, c′ − c′₀]]/(a² + bc′ − 1) centred at a lift (a₀, b₀, c′₀) of ρ̄(c). It is a complete intersection domain of relative dimension 2 over 𝒪; every 𝒪-point is odd, so R^odd = R^{□,ψ}; R^odd[1/2] is formally smooth; R^odd ⊗ 𝔽 is a domain.

*Hypotheses and conventions.*
- p = 2 and n = 2; the determinant is fixed with ψ(c) = −1 (oddness).

*Proof outline.* A lift is determined by M = ρ(c) with M² = 1 and det M = ψ(c) = −1; by Cayley–Hamilton M² − (tr M)M + det M = 0 gives (tr M)M = 0, hence tr M = 0 since M is invertible. So M = (a b; c′ −a) with −a² − bc′ = −1, and conversely any such M has M² = (a² + bc′)·1 = 1. f = a² + bc′ − 1 is a nonzero non-unit in the regular ring 𝒪[[a − a₀, b − b₀, c′ − c′₀]] (dimension 4), so the quotient is a complete intersection of dimension 3 (relative dimension 2). Domain: R ⊗ 𝔽 = 𝔽[[a′, b′, c″]]/(q) with q a nondegenerate quadric in three variables (a′² + bc′ at ρ̄(c) = 1), which is a domain; f is not divisible by 2, so 2 is a non-zero-divisor of R, and a local ring whose quotient by a non-zero-divisor of its maximal ideal is a domain is a domain. Generic smoothness: the partial derivatives (2a, c′, b) do not vanish simultaneously on the generic fibre where a² + bc′ = 1.

*Acceptance.* ρ̄(c) = 1 (a₀ = 1, b₀ = c′₀ = 0): the special fibre 𝔽[[a′, b, c′]]/(a′² + bc′) is a domain but singular at the closed point. Every characteristic-zero point is odd: det M = −1. This agrees with Khare–Wintenberger II Proposition 3.3, as quoted in Tung's Proposition 3.2.7.

*Prerequisites.* `R08.1/archimedean-rings-p-odd`, `GlobalGaloisDeformations:R04.1/fixed-determinant-functors`, `GlobalGaloisDeformations:R04.2/fixed-determinant-rings`, `mathlib:MvPowerSeries`.

*Sources.* Shen-Ning Tung (TUNG-2021), §3.2.5, Proposition 3.2.7, p. 15.

#### `R08.1/local-residue-field-change` — Local deformation rings under change of coefficients (lemma)

K/ℚ_ℓ is a finite extension (ℓ = p allowed), G_K its absolute Galois group, 𝒪 the ring of integers of a finite extension of ℚ_p with residue field 𝔽, and ρ̄ : G_K → GL_n(𝔽) continuous. For a finite local 𝒪 → 𝒪′ with residue extension 𝔽 ⊆ 𝔽′: R^□_{ρ̄⊗𝔽′,𝒪′} ≅ R^□_{ρ̄,𝒪} ⊗̂_𝒪 𝒪′, likewise with fixed determinant and (Schur) unframed; the tangent, obstruction and Euler-characteristic invariants of local-tangent-obstruction are unchanged (h^i(G_K, ad ρ̄ ⊗ 𝔽′) = h^i(G_K, ad ρ̄)), so the dimension bounds and formal smoothness are preserved.

*Hypotheses and conventions.*
- The comparison of local rings under residue-field extension is kept in R08.1 by RS-08; the generic statement is GlobalGaloisDeformations R04.2/change-of-residue-field.

*Proof outline.* Specialise change-of-residue-field to G = G_K. Cohomology commutes with the field extension: H^i(G_K, M ⊗_𝔽 𝔽′) = H^i(G_K, M) ⊗_𝔽 𝔽′ for finite M. Formal smoothness is preserved by completed base change along 𝒪 → 𝒪′.

*Acceptance.* For the archimedean ring at p = 2 the equation a² + bc′ − 1 is unchanged by base change. Schur is preserved (GlobalGaloisDeformations R04.1/change-of-coefficients). Irreducibility of Spec R^□[1/p] need not be preserved by enlarging the coefficient field.

*Prerequisites.* `R08.1/local-lifting-ring`, `R08.1/local-tangent-obstruction`, `GlobalGaloisDeformations:R04.2/change-of-residue-field`, `GlobalGaloisDeformations:R04.1/change-of-coefficients`, `DeformationAndDerivedPatchingAlgebra:R03.1`.

*Sources.* Toby Gee (GEE-MLT-2022), §3.1, p. 12.

#### `R08.1/coefficient-rings-lambda` — Coefficient rings Λ for finite, p-adic and local residue fields (construction)

Let 𝒪 be the ring of integers of a finite extension L/ℚ_p with residue field k and uniformiser ϖ, F/ℚ_p finite, and κ an 𝒪-field of one of three kinds: (1) a finite extension of k; (2) a finite extension of L; (3) a local field of characteristic p containing k, so 𝒪_κ ≅ k′⟦t⟧. Put Λ = 𝒪_{L′} with L′/L unramified of residue field κ in case (1); Λ = κ (with Λ⁰ = 𝒪_κ) in case (2); and in case (3) Λ = the p-adic completion of 𝒪_{L′}⟦t⟧[1/t], a complete discrete valuation ring with uniformiser ϖ and residue field κ (an 𝒪-Cohen ring of κ, unique up to non-canonical isomorphism). 𝔄_Λ is the category of local Artinian Λ-algebras with residue field κ, topologised discretely in case (1), p-adically in case (2), and as finite-length Λ⁰[1/t]/ϖⁿ-modules in case (3). For a continuous ρ : G_F → GL_d(κ), D^□_ρ(A) is the set of continuous lifts ρ_A : G_F → GL_d(A) of ρ. In case (1) this is the functor of R08.1/local-lifting-ring.

*Hypotheses and conventions.*
- Continuity in cases (2) and (3) is for the natural (non-discrete) topology on A; this is what makes D^□_ρ the right functor at characteristic-zero and characteristic-p points of Spec R^□_ρ̄.
- For G-valued representations the same Λ and 𝔄_Λ are used (R08.1/g-valued-framed-ring).

*Construction.* Case (1) is R08.1/local-lifting-ring with residue field κ (R08.1/local-residue-field-change). Case (3): The ϖ-adic completion of 𝒪_{L′}⟦t⟧[1/t] is a DVR with uniformiser ϖ and residue field k′((t)) = κ; uniqueness of 𝒪-Cohen rings is Bourbaki, Algèbre commutative IX §2.3, Proposition 4 (BIP Remark 3.32). Topologies on objects of 𝔄_Λ: each A is a finite Λ-module, given its natural topology as such.

*API.*
- `TauCeti.GaloisDeformation.Local.CoeffRing` (data): The ring Λ attached to an 𝒪-field κ of the three kinds, with its residue isomorphism Λ/ϖ ≅ κ in cases (1), (3) and Λ = κ in case (2).
- `TauCeti.GaloisDeformation.Local.CoeffRing.isCohen` (characterisation): In case (3), any 𝒪-algebra that is a complete DVR with uniformiser ϖ and residue field κ is isomorphic to Λ.
- `TauCeti.GaloisDeformation.Local.ArtinCat` (data): The category 𝔄_Λ with the topology on each object.
- `TauCeti.GaloisDeformation.Local.liftFunctorΛ` (constructor): D^□_ρ : 𝔄_Λ → Set, continuous lifts of ρ : G_F → GL_d(κ).
- `TauCeti.GaloisDeformation.Local.liftFunctorΛ_finite` (compatibility): For κ finite, D^□_ρ restricted to Artinian objects is the lifting functor of GlobalGaloisDeformations R04.1.

*Unit tests.*
- `coeffRing_finite` (degenerate): For κ = k, CoeffRing κ = 𝒪.
- `coeffRing_padic` (computation): For κ = L, CoeffRing κ = L and 𝔄_Λ consists of finite local L-algebras with residue field L.
- `coeffRing_char_p_dvr` (non-example): For κ = k((t)), Λ is not 𝒪⟦t⟧ (not a DVR, residue field k) but the ϖ-adic completion of 𝒪⟦t⟧[1/t], a DVR with residue field k((t)).
- `liftFunctorΛ_compat` (compatibility): For κ finite, liftFunctorΛ ρ agrees with the lifting functor of R08.1/local-lifting-ring on Artinian objects.

*Used by.* BIP23, Proposition 3.41 — completions of R^□_ρ̄ at points of P_1 are the framed rings D^□_{ρ_x} over Λ; PQ26, §3 — the same Λ for G-valued functors; LocalGaloisDeformationRings:R08.1/completion-at-points — the target of the completion isomorphism; GlobalGaloisDeformations:R04.3 — restriction of global universal representations to decomposition groups lands in these local rings

*Acceptance.* For κ = k the construction returns Λ = 𝒪 and 𝔄_Λ = Artinian objects of C_𝒪. For κ = k((t)), Λ is a complete DVR, not 𝒪⟦t⟧.

*Prerequisites.* `R08.1/local-lifting-ring`, `R08.1/local-residue-field-change`, `DeformationAndDerivedPatchingAlgebra:R03.1`, `mathlib:IsAdicComplete`, `mathlib:IsLocalRing.ResidueField`.

*Sources.* Gebhard Böckle (BIP-2023), §3.5, the coefficient rings Λ and Remark 3.32, arXiv v2 pp. 25–26; Gebhard Böckle (BIP-2023), Proposition 3.33, arXiv v2 p. 26.

#### `R08.1/lambda-presentation` — Presentation of framed rings over Λ and the cocycle count (theorem)

Let κ, Λ and ρ : G_F → GL_d(κ) be as in R08.1/coefficient-rings-lambda. (1) dim_κ Z¹(G_F, V) = h¹(G_F, V) + dim V − h⁰(G_F, V) for any finite continuous κ[G_F]-module V, and dim_κ Z¹(G_F, V) = dim V·([F:ℚ_p] + 1) + h²(G_F, V). (2) D^□_ρ is pro-represented by a complete local Noetherian Λ-algebra R^□_ρ with a presentation R^□_ρ ≅ Λ⟦x₁, …, x_r⟧/(f₁, …, f_s), r = dim_κ Z¹(G_F, ad ρ), s = dim_κ H²(G_F, ad ρ); hence r − s = d² + d²[F:ℚ_p]. (3) The analogous presentation over the universal deformation ring R_{det ρ} of det ρ holds with ad⁰ in place of ad when p ∤ d.

*Hypotheses and conventions.*
- In cases (2) and (3) of R08.1/coefficient-rings-lambda the obstruction 2-cocycle must be shown continuous; this uses a continuous set-theoretic section of GL_d(A′) → GL_d(A) for small extensions A′ → A in 𝔄_Λ.
- The equality r − s = d²(1 + [F:ℚ_p]) uses the local Euler characteristic formula for κ-coefficients in all three cases.
- The possibly infinite residue field κ and its natural topology require continuous-cohomology finiteness, duality and Euler characteristic beyond finite discrete coefficients. This is requested separately; ClassFieldTheory Layer 5 alone does not supply that generality.

*Proof outline.* (1): Z¹ → H¹ is surjective with kernel the coboundaries B¹ ≅ V/V^{G_F}; then apply the local Euler characteristic formula and local duality, h⁰ − h¹ + h² = −[F:ℚ_p]·dim V (Tau Ceti ClassFieldTheory Layer 5: eulerCharacteristic_finrank_fp, tateDualityPairing_perfect_mixed; for κ a local field, by passing to an 𝒪_κ-lattice and inverting ϖ). (2): Mazur's obstruction theory over Λ (DeformationAndDerivedPatchingAlgebra R03.2): the tangent space of D^□_ρ is Z¹(G_F, ad ρ) and obstructions to lifting along small extensions lie in H²(G_F, ad ρ); for κ local the continuous section of R08.1/g-valued-framed-ring (PQ26 Lemmas 3.3–3.5) makes the obstruction cocycle continuous. (3): repeat with the relative obstruction theory over R_{det ρ}.

*Acceptance.* d = 1, F = ℚ_p, ρ trivial: r = 2 = 1·(1 + 1), s = 0 when μ_p ⊄ F (here F = ℚ_p, p odd), so R^□_ρ ≅ Λ⟦x₁, x₂⟧. For κ = k this recovers R08.1/local-tangent-obstruction (2)–(3).

*Prerequisites.* `R08.1/coefficient-rings-lambda`, `R08.1/local-tangent-obstruction`, `DeformationAndDerivedPatchingAlgebra:R03.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Gebhard Böckle (BIP-2023), Proposition 3.33 and (21)–(22), arXiv v2 p. 26; Vytautas Paškūnas (PQ-2026), Lemma 3.1, arXiv v2 p. 22.

#### `R08.1/completion-at-points` — Completed local rings at points of the generic fibre are framed rings (theorem)

Let ρ̄ : G_F → GL_d(k′) (k′/k finite, F/ℚ_ℓ finite, ℓ = p allowed) with framed ring R^□_ρ̄. Let x ∈ Spec R^□_ρ̄ be a point with κ(x) finite over k′, a finite extension of L, or a local field of characteristic p (x ∈ P₁R^□_ρ̄), ρ_x : G_F → GL_d(κ(x)) the specialisation of the universal lift, Λ the coefficient ring of κ(x) (R08.1/coefficient-rings-lambda) and 𝔮 the kernel of Λ ⊗_𝒪 R^□_ρ̄ → κ(x), λ ⊗ a ↦ λ̄ā. Then the completion of (Λ ⊗_𝒪 R^□_ρ̄)_𝔮 is naturally isomorphic to R^□_{ρ_x}. In particular, for a closed point x of Spec R^□_ρ̄[1/p] with residue field E′, the completed local ring (R^□_ρ̄[1/p])^∧_x pro-represents the framed deformations of ρ_x : G_F → GL_d(E′) to Artinian local E′-algebras with residue field E′, and is a power series ring over E′ in dim Z¹(G_F, ad ρ_x) variables when H²(G_F, ad ρ_x) = 0. The same holds with fixed determinant (ad⁰ in place of ad) and for G-valued lifts (R08.1/g-valued-framed-ring).

*Hypotheses and conventions.*
- Closed points of R^□_ρ̄[1/p] have residue fields finite over E (Taylor II, Lemma 1.6).
- The comparison is of complete local rings; it does not assert that R^□_ρ̄[1/p] is excellent or regular anywhere.

*Proof outline.* Kisin, Moduli of finite flat group schemes and modularity, Proposition 2.3.5 (Kisin's argument, as used in CG18 Lemma 4.11 and BCGP21 §7.1, with Allen's Theorem 1.2.1 for GL_n): for an Artinian E′-algebra A, a lift of ρ_x to A extends to a lift over an 𝒪_{E′}-order A° ⊂ A by compactness, giving a map R^□_ρ̄ → A° whose kernel localises at x. BIP Proposition 3.41 is the version for all points of P₁: both sides pro-represent D^□_{ρ_x} on 𝔄_Λ, using R08.1/lambda-presentation. Power series: if H²(G_F, ad ρ_x) = 0, R08.1/lambda-presentation for κ = E′ gives s = 0.

*Acceptance.* CG18 Lemma 4.11 case (3): at each closed point of R_v[1/p] (v ≠ p, fixed determinant) H²(G_v, ad⁰ρ) = 0 and the completion is a power series ring in dim Z¹(G_v, ad⁰ρ) = 3 variables. BIP Corollary 3.42: X^gen is regular at all closed points iff R^□_{ρ_z} is regular for all closed z above 𝔪_{R^ps}.

*Prerequisites.* `R08.1/coefficient-rings-lambda`, `R08.1/lambda-presentation`, `R08.1/local-lifting-ring`, `R08.1/local-fixed-determinant`.

*Sources.* Gebhard Böckle (BIP-2023), Proposition 3.41, arXiv v2 p. 29; Frank Calegari (CG-2018), §4.1, proof of Lemma 4.11 (published p. 365); George Boxer (BCGP-2021), §7.1, the paragraph after Definition 7.1.2, arXiv v3 pp. 169–170; Christophe Breuil (BHS-2019), §3.6 and Remark 3.6.1, printed pp. 362–363.

#### `R08.1/smooth-points-generic-fibre` — Smooth points of the generic fibre and purity (theorem)

Let v be a finite place of a number field, F_v its completion, ρ̄ : G_{F_v} → G(k) with G = GL_n (or a group of R08.1/g-valued-framed-ring with fixed multiplier, e.g. GSp₄), and x a closed point of Spec R^□_v[1/p] with ρ_x : G_{F_v} → G(E′). Call x smooth if (R^□_v[1/p])^∧_x is regular. (1) If v ∤ p, x is smooth iff (ad⁰ρ_x)(1)^{G_{F_v}} = 0, equivalently H²(G_{F_v}, ad⁰ρ_x) = 0. (2) If v ∤ p and ρ_x is pure (its Weil–Deligne representation is pure), then x is smooth. (3) If v ∤ p, Spec R^□_v[1/p] is equidimensional of dimension n² (dim G^der for fixed multiplier), and smooth at pure points.

*Hypotheses and conventions.*
- Purity is in the sense of Taylor–Yoshida: WD(ρ_x) arises by base change from a pure Weil–Deligne representation over a number field.
- (1) uses only the generic fibre; it says nothing about R^□_v itself, which can be non-smooth at the closed point.

*Proof outline.* (1): by R08.1/completion-at-points, (R^□_v[1/p])^∧_x is a quotient of a power series ring in dim Z¹ variables by at most h² relations, of dimension at least dim Z¹ − h² = n² (local Euler characteristic, v ∤ p); regularity holds iff h² = 0 (Bellovin–Gee Cor. 3.3.4, Rem. 3.3.6), and h² = h⁰((ad⁰ρ_x)(1)) by local Tate duality (Tau Ceti ClassFieldTheory Layer 5). (2): purity forces Hom_{G_{F_v}}(ρ_x, ρ_x(1)) = 0 since the Frobenius weights of ρ_x and ρ_x(1) differ by 2. (3): BLGGT Lemma 1.3.2 (GL_n): the dimension count of (1) holds at every closed point, and the generic fibre is equidimensional of dimension n² (the special case for n = 2 with fixed determinant is R08.2/unrestricted-away-from-p, which builds on this layer).

*Acceptance.* n = 2, ρ_x = Steinberg twist (1 ∗; 0 ε^{-1}) with N ≠ 0: pure, hence smooth. n = 2, ρ_x = 1 ⊕ ε: (ad⁰ρ_x)(1) contains the line Hom(ε, 1)(1) = trivial, so x is not smooth.

*Prerequisites.* `R08.1/completion-at-points`, `R08.1/local-tangent-obstruction`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* George Boxer (BCGP-2021), Lemma 7.1.3, arXiv v3 p. 170.

#### `R08.1/rank-one-ring` — The universal deformation ring of a character (theorem)

Let F/ℚ_p be finite, ψ̄ : G_F → k^× continuous, R_ψ̄ its universal deformation ring and μ = μ_{p^∞}(F), a finite cyclic p-group. Local class field theory gives μ → F^× → G_F^{ab} → GL₁(R_ψ̄), hence 𝒪[μ] → R_ψ̄, and R_ψ̄ ≅ 𝒪[μ]⟦y₁, …, y_{[F:ℚ_p]+1}⟧. The irreducible components of Spec R_ψ̄ are indexed by the characters χ : μ → 𝒪^× (after enlarging 𝒪), and each R_ψ̄ ⊗_{𝒪[μ],χ} 𝒪 is formally smooth over 𝒪.

*Hypotheses and conventions.*
- The Artin map is normalised as in Tau Ceti ClassFieldTheory Layer 7; the statement does not depend on the normalisation.

*Proof outline.* The pro-p completion of G_F^{ab} is μ × ℤ_p^{[F:ℚ_p]+1} (local class field theory and the structure of F^× = ϖ^ℤ × μ_{q−1} × U¹ with U¹ ≅ μ × ℤ_p^{[F:ℚ_p]}). Deformations of ψ̄ are ψ̃·θ with ψ̃ the Teichmüller lift and θ a character of this pro-p group (Gouvêa, Proposition 3.13), so R_ψ̄ = 𝒪⟦μ × ℤ_p^{[F:ℚ_p]+1}⟧ = 𝒪[μ]⟦y_i⟧.

*Acceptance.* F = ℚ_p, p odd: μ = 1 and R_ψ̄ ≅ 𝒪⟦y₁, y₂⟧, matching r − s = 1·2 of R08.1/lambda-presentation. F = ℚ_p(ζ_p): μ = μ_p and R_ψ̄ ≅ 𝒪[ℤ/p]⟦y₁, …, y_p⟧ has p components after enlarging 𝒪.

*Prerequisites.* `R08.1/lambda-presentation`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

*Sources.* Gebhard Böckle (BIP-2023), Lemma 4.1 and its proof, arXiv v2 p. 36.

#### `R08.1/determinant-twisting` — Fixed-determinant rings by twisting: the functor 𝒳 and the power map φ_d (theorem)

Let ρ̄ : G_F → GL_d(k), ψ : G_F → 𝒪^× a lift of det ρ̄, and χ = ψ∘Art_F on μ. (1) R^{□,ψ}_ρ̄ := R^□_ρ̄ ⊗_{R_{det ρ̄},ψ} 𝒪 represents framed lifts with determinant ψ, and is a quotient of R^{□,χ}_ρ̄ (lifts whose determinant restricted to Art_F(μ) is χ). (2) Let 𝒳 : C_𝒪 → Set send A to the group of continuous θ : G_F → 1 + 𝔪_A trivial on Art_F(μ); it is pro-represented by 𝒪(𝒳) ≅ 𝒪⟦y₁, …, y_{[F:ℚ_p]+1}⟧, and φ_e : θ ↦ θ^e. ρ ↦ (det ρ)ψ^{-1} makes R^{□,χ}_ρ̄ an 𝒪(𝒳)-algebra. (3) (ρ, θ) ↦ (ρ ⊗ θ^{-1}, θ) is a natural isomorphism D^{□,χ}_ρ̄ ×_{𝒳,φ_d} 𝒳 ≅ D^{□,ψ}_ρ̄ × 𝒳, hence R^{□,χ}_ρ̄ ⊗_{𝒪(𝒳),φ_d} 𝒪(𝒳) ≅ R^{□,ψ}_ρ̄ ⊗̂_𝒪 𝒪(𝒳). (4) φ_d : 𝒪(𝒳) → 𝒪(𝒳) is finite and flat, étale after inverting p, and a universal homeomorphism on special fibres.

*Hypotheses and conventions.*
- No hypothesis p ∤ d: the twisting goes through φ_d, which is not an isomorphism when p | d; R08.1/local-fixed-determinant covers the case p ∤ d where R^□ ≅ R^{□,ψ} ⊗̂ 𝒪⟦G_F^{ab,(p)}⟧.

*Proof outline.* (2) from R08.1/rank-one-ring: 𝒳 is the deformation functor of the trivial character with the μ-part removed. (3): det(ρ ⊗ θ^{-1}) = det ρ·θ^{-d} = ψ exactly when (det ρ)ψ^{-1} = φ_d(θ); the inverse is (ρ′, θ) ↦ (ρ′ ⊗ θ, θ). (4): write d = e·p^m with p ∤ e; φ_e is an automorphism of 𝒪(𝒳) and φ_{p^m} is finite flat of degree p^{m([F:ℚ_p]+1)}, étale after inverting p, and on special fibres a power of Frobenius on the group, a universal homeomorphism.

*Acceptance.* p ∤ d: φ_d is an isomorphism and (3) recovers R08.1/local-fixed-determinant. d = p = 2, F = ℚ₂: φ₂ on 𝒪⟦y₁, y₂⟧ is finite flat of degree 4 and not étale on the special fibre.

*Prerequisites.* `R08.1/rank-one-ring`, `R08.1/local-fixed-determinant`, `R08.1/local-lifting-ring`.

*Sources.* Gebhard Böckle (BIP-2023), §5, (30) and Proposition 5.1, arXiv v2 pp. 47–48; Gebhard Böckle (BIP-2023), Lemma 5.3, arXiv v2 p. 48.

#### `R08.1/g-valued-framed-ring` — G-valued framed deformation rings (construction)

Let G be a smooth affine group scheme over 𝒪 (for example GL_n, GSp_{2n} with its multiplier ν : GSp_{2n} → 𝔾_m, or a generalised reductive group), Γ a profinite group with Mazur's p-finiteness condition (for example G_F), κ and Λ as in R08.1/coefficient-rings-lambda, and ρ : Γ → G(κ) continuous. D^□_{ρ,G} : 𝔄_Λ → Set sends A to the continuous ρ_A : Γ → G(A) lifting ρ. (1) dim_κ Z¹(Γ, ad ρ) is finite, where ad ρ = Lie G_κ with the adjoint action. (2) D^□_{ρ,G} is pro-represented by a complete local Noetherian Λ-algebra R^□_{ρ,G} with residue field κ and tangent space Z¹(Γ, ad ρ). (3) For a closed normal subgroup scheme (e.g. fixed multiplier ν∘ρ_A = μ), the corresponding fixed-multiplier functor is a closed subfunctor, pro-represented by a quotient R^{□,μ}_{ρ,G}. (4) Surjections G(A′) → G(A) in 𝔄_Λ have continuous set-theoretic sections, and G(A) is locally profinite.

*Hypotheses and conventions.*
- For GSp₄ with fixed multiplier ε^{-1} (BCGP25 §6.1.1), ad = Lie GSp₄ has dimension 11 and ad⁰ = Lie Sp₄ dimension 10; strict equivalence uses the congruence kernel of GSp₄.
- The group GSp_{2n} over 𝒪 is the matrix group {g : gᵀJg = ν(g)J}; Mathlib has the symplectic group Sp (Matrix.symplecticGroup) but not GSp, which this node takes from ArithmeticStatistics ST.5’s integral matrix carrier and its requested group-scheme extension (request).
- For GSp the integral matrix carrier and multiplier come from ArithmeticStatistics ST.5/symplectic-similitude-group, not ClassicalGroups Layer 0 over ℂ. The smooth group-scheme, derived-group and integral Lie-algebra API remains a supplier extension. For compatibility with Matrix.symplecticGroup, prove equivalence of gJgᵀ=νJ and gᵀJg=νJ for invertible g.

*Construction.* (1)–(2): PQ26 Lemmas 3.1–3.2: Schlessinger's criteria for D^□_{ρ,G} using smoothness of G (lifting along small extensions is unobstructed on G itself) and Z¹ finiteness from p-finiteness of Γ. (3): fixing the multiplier is the fibre of D^□_{ρ,G} → D^□_{ν∘ρ,𝔾_m} over a point, a closed condition. (4): PQ26 Lemmas 3.3–3.5: an open continuous surjection of locally profinite groups has a continuous section; G(A) is locally profinite because A is.

*API.*
- `TauCeti.GaloisDeformation.Local.GLift` (data): D^□_{ρ,G}(A): continuous lifts Γ → G(A) of ρ.
- `TauCeti.GaloisDeformation.Local.GFramedRing` (constructor): R^□_{ρ,G}, the pro-representing complete local Noetherian Λ-algebra, with the universal lift ρ^□_G : Γ → G(R^□_{ρ,G}).
- `TauCeti.GaloisDeformation.Local.GFramedRing.tangent` (characterisation): Hom_Λ(R^□_{ρ,G}, κ[ε]) ≅ Z¹(Γ, ad ρ).
- `TauCeti.GaloisDeformation.Local.GFramedRing.map` (functoriality): A morphism φ : G → H induces R^□_{φ∘ρ,H} → R^□_{ρ,G}, with map_id and map_comp.
- `TauCeti.GaloisDeformation.Local.GFramedRing.fixedMultiplier` (constructor): For a character μ lifting ν∘ρ, the quotient R^{□,μ}_{ρ,G} of lifts with ν∘ρ_A = μ.
- `TauCeti.GaloisDeformation.Local.GFramedRing.gl` (compatibility): For G = GL_d, R^□_{ρ,GL_d} = R^□_ρ of R08.1/local-lifting-ring.
- `TauCeti.GaloisDeformation.Local.GFramedRing.hom_ext` (extensionality): Two continuous Λ-algebra maps R^□_{ρ,G}→A are equal iff the induced G(A)-valued framed lifts are equal. The pro-representing bijection is natural in A; this uses framed equality rather than conjugacy.

*Unit tests.*
- `gFramed_GL1_trivial` (computation): G = 𝔾_m, F = ℚ_p (p odd), ρ trivial: R^□_{ρ,G} ≅ 𝒪⟦y₁, y₂⟧ (R08.1/rank-one-ring).
- `gFramed_trivial_group` (degenerate): G trivial: R^□_{ρ,G} = Λ.
- `gFramed_GSp4_unobstructed` (computation): G = GSp₄ with fixed multiplier, v ∤ p, H⁰(F_v, ad⁰ρ̄(1)) = 0: R^{□,μ} is a power series ring over 𝒪 in 10 variables (BCGP21 Proposition 7.4.2).
- `gFramed_GL_compat` (compatibility): GFramedRing for GL_d agrees with R^□_ρ of R08.1/local-lifting-ring.

*Used by.* BCGP21 §7, BCGP25 §6.1 — fixed-similitude GSp₄ local rings at all places; FKP22 §§2, 5, Appendix B — G-valued lifting rings, their potentially semistable quotients and ordinary components; LocalGaloisDeformationRings:L7/g-valued-ordinary-quotient — the ambient ring; LocalGaloisDeformationRings:R08.3/g-valued-pst-rings — the ambient ring

*Acceptance.* G = GL_d recovers R08.1/local-lifting-ring and, over Λ, R08.1/lambda-presentation.

*Prerequisites.* `R08.1/coefficient-rings-lambda`, `R08.1/local-lifting-ring`, `DeformationAndDerivedPatchingAlgebra:R03.2`, `mathlib:Matrix.symplecticGroup`, `ArithmeticStatistics:ST.5/symplectic-similitude-group`.

*Sources.* Vytautas Paškūnas (PQ-2026), §3, Lemma 3.2, arXiv v2 p. 23; George Boxer (BCGP-2021), §7.1, arXiv v3 p. 169.

#### `R08.1/g-valued-presentations` — Presentations of G-valued framed rings and central quotients (theorem)

Let φ : G → H be a morphism of smooth affine 𝒪-group schemes with G⁰ → H⁰ smooth and surjective, ρ : Γ → G(κ) continuous and ad^{0,φ}ρ = ker(ad ρ → ad(φ∘ρ)). (1) R^□_{ρ,G} ≅ R^□_{φ∘ρ,H}⟦x₁, …, x_r⟧/(f₁, …, f_t) with r = dim Z¹(Γ, ad^{0,φ}ρ), t = h²(Γ, ad^{0,φ}ρ); for Γ = G_F, r − t = (dim G_κ − dim H_κ)([F:ℚ_p] + 1). (2) With H trivial: R^□_{ρ,G} ≅ Λ⟦x₁, …, x_r⟧/(f₁, …, f_s), r − s = dim G_κ·([F:ℚ_p] + 1). (3) For H = G/Z with Z ⊂ Z(G⁰) flat closed and normal in G: if Z is finite étale then R^□_H = R^□_G; if Z is a torus with Z ∩ G′ étale then R^□_{G/G′} ⊗̂_{R^□_{H/H′}} R^□_H ≅ R^□_G. (4) For v ∤ p and G = GSp₄ with fixed multiplier, H⁰(F_v, ad⁰ρ̄(1)) = 0 implies R^{□,μ}_v is a power series ring over 𝒪 in 10 variables, and all lifts of an unramified ρ̄ are unramified.

*Hypotheses and conventions.*
- (1) generalises BIP Proposition 4.3 (G = GL_d, H = GL₁, φ = det).
- For κ a local field the obstruction is realised by a continuous 2-cocycle via R08.1/g-valued-framed-ring (4).

*Proof outline.* (1): relative obstruction theory for R^□_{ρ,G} over R^□_{φ∘ρ,H}: the relative tangent space is Z¹(Γ, ad^{0,φ}ρ) and relative obstructions lie in H²(Γ, ad^{0,φ}ρ); the count uses R08.1/lambda-presentation (1). (3): Lie Z = 0 for Z finite étale, so ad^{0,φ}ρ = 0 and (1) gives an isomorphism; the torus case compares the multiplier and the derived parts. (4): H²(F_v, ad⁰ρ̄) = 0 by local Tate duality, and dim ad⁰ = 10 with the local Euler characteristic 0 for v ∤ p gives 10 variables (BCGP21 Proposition 7.4.2).

*Acceptance.* G = GL_d, H = GL₁: r − t = (d² − 1)([F:ℚ_p] + 1), the fixed-determinant count of R08.1/local-fixed-determinant. p odd, G = SL₂, Z = μ₂ (finite étale over 𝒪), H = PGL₂: R^□_{ρ,SL₂} ≅ R^□_{π∘ρ,PGL₂} for π : SL₂ → PGL₂.

*Prerequisites.* `R08.1/g-valued-framed-ring`, `R08.1/lambda-presentation`, `R08.1/local-fixed-determinant`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Vytautas Paškūnas (PQ-2026), Proposition 3.6, arXiv v2 p. 24; Vytautas Paškūnas (PQ-2026), Corollary 3.12 and Proposition 3.13, arXiv v2 p. 26; George Boxer (BCGP-2021), Proposition 7.4.2, arXiv v3 p. 189.

#### `R08.1/phi-gamma-module-deformation-rings` — Deformation rings of (φ, Γ)-modules and their trianguline and de Rham quotients (construction)

Let K/ℚ_p be finite, E/ℚ_p finite and large, and D a (φ, Γ_K)-module over the Robba ring ℛ_{K,E} with End(D) = E, trianguline with a generic parameter δ : T(K) → E^× (T the diagonal torus of GL_n) and refinement w. R_D is the universal deformation ring of D on local Artinian E-algebras with residue field E; R_{D,w} that of T_w-deformations (trianguline deformations with respect to the refinement w(φ)); R_{D,g} that of de Rham, equivalently crystabelline, deformations; R_δ (resp. R_{δ,g}) that of the character δ of T(K) (resp. of its locally algebraic deformations). All are formally smooth complete local Noetherian E-algebras, with tangent spaces Ext¹_{(φ,Γ)}(D, D), its trianguline and de Rham subspaces, Hom(T(K), E) and Hom_sm(T(K), E); there are surjections R_D ↠ R_{D,w} ↠ R_{D,g} and R_δ ↠ R_{δ,g}, and for each w the parameter map induces a Cartesian square of local Artinian E-algebras with corners R_{w(φ)z^h}/𝔪², R_{w(φ)z^h,g}/𝔪², R_{D,w}/𝔪² and R_{D,g}/𝔪² (Ding (3.55)): a first-order trianguline deformation is de Rham exactly when its parameter is locally algebraic.

*Hypotheses and conventions.*
- Genericity of δ (δ_iδ_j^{-1} ∉ {x^{±k}, εx^{k}}) is needed for formal smoothness; without it R_{D,w} can be singular.
- For D = D_rig(V) of a Galois representation V with End(V) = E, R_D is the unframed deformation ring of V, i.e. the quotient of the completed local ring of R08.1/completion-at-points by the framing (n² − 1 variables).
- The trianguline variety X_tri itself is not constructed here; it belongs to the trianguline-variety roadmap that the Breuil–Hellmann–Schraen extraction proposes.
- D is a noncritical crystabelline object of Ding’s ΦΓ_nc(φ,h), with φ generic, h regular and all refinements noncritical. These are the standing assumptions of §3.2.2; arbitrary generic trianguline objects are not covered.

*Construction.* Bellaïche–Chenevier §2.3.5, §2.5.3 and Nakamura §2 (as cited by Ding §3.2.2): Schlessinger's criteria for deformations of (φ, Γ)-modules, with tangent spaces Ext¹ and obstructions in Ext², which vanish under genericity. Compare with Galois deformations by D ↦ D_rig(V) (an equivalence on étale objects, PadicHodgeTheory P7).

*API.*
- `TauCeti.GaloisDeformation.PhiGamma.defRing` (data): R_D for a (φ, Γ_K)-module D with End(D) = E.
- `TauCeti.GaloisDeformation.PhiGamma.triangulineDefRing` (constructor): R_{D,w}, deformations with a deformation of the triangulation attached to w.
- `TauCeti.GaloisDeformation.PhiGamma.deRhamDefRing` (constructor): R_{D,g}, de Rham deformations.
- `TauCeti.GaloisDeformation.PhiGamma.tangent_defRing` (characterisation): Tangent space of R_D is Ext¹(D, D); of R_{D,w} the classes preserving the triangulation.
- `TauCeti.GaloisDeformation.PhiGamma.formallySmooth` (other): Under genericity of δ, R_D, R_{D,w}, R_{D,g} are formally smooth over E.
- `TauCeti.GaloisDeformation.PhiGamma.galois_compat` (compatibility): For D = D_rig(V), R_D is the unframed deformation ring of V (R08.1/completion-at-points modulo framing).
- `TauCeti.GaloisDeformation.Local.triangulineDefRing.forget` (functoriality): Forgetting the chosen deformation of the triangulation gives a natural transformation to the deformation functor of D, hence a continuous E-algebra map R_D→R_{D,w}. Composition with this map sends a trianguline point to its underlying module deformation.

*Unit tests.*
- `phiGamma_rank_one` (computation): n = 1: R_D ≅ R_δ ≅ E⟦x₁, …, x_{[K:ℚ_p]+1}⟧.
- `phiGamma_trianguline_sub` (characterisation): The tangent map of R_D → R_{D,w} identifies Hom(R_{D,w}, E[ε]) with the subspace of Ext¹(D, D) of extensions that are trianguline for the deformed refinement.
- `phiGamma_nongeneric` (non-example): D=ℛ⊕ℛ(ε) lies outside the End(D)=E and genericity hypotheses. Its cyclotomic off-diagonal summand has H²≠0 by local duality; it cannot be used as an instance of the stated smoothness theorem.
- `phiGamma_galois` (compatibility): For D = D_rig(V) with End V = E, R_D is the unframed deformation ring of V.

*Used by.* Ding 2025, §3.2.2 and §4.2 — Hodge parameters as tangent directions of R_{D,g} in R_{D,w}; Breuil–Hellmann–Schraen 2019, §3.6 — framed groupoid X_r and trianguline groupoids; LocalGaloisDeformationRings:R08.1/completion-at-points — comparison for étale D

*Acceptance.* n = 1: R_D = R_δ is formally smooth of dimension [K:ℚ_p] + 1 over E. For V crystalline with distinct Frobenius eigenvalues, R_{D,g} has dimension n(n−1)/2·[K:ℚ_p] + n.

*Prerequisites.* `R08.1/completion-at-points`, `PadicHodgeTheory:P7`.

*Sources.* Yiwen Ding (DING-2025), §3.2.2, arXiv p. 61; Yiwen Ding (DING-2025), §3.2.2, arXiv p. 61.

*Coverage of R08.1:* planned. Remaining: Lemma-level refinement: PQ26 Lemmas 3.3–3.5 (continuous sections for G(A), A ∈ 𝔄_Λ) and BIP23 Corollary 3.42 (regularity of X^gen read on completions) as separate lemma nodes. Gaps recorded: natural-topology continuous cohomology over κ (requested from Tau Ceti ClassFieldTheory Layer 5) and the integral reductive group-scheme API (requested from ArithmeticStatistics ST.5).

### Layer R08.2: Places away from p

R08.2 constructs the local conditions at places v ∤ p. The tame quotient G_K/P_K is the q-tame group T_q, and every lift is read on pairs (Φ, Σ) with ΦΣΦ^{-1} = Σ^q. The unrestricted ring is a reduced 𝒪-flat complete intersection of relative dimension n² (Shotton), whose components are cut out by inertial types; types here retain the monodromy operator, so the Steinberg type and the trivial type are different, as R08.2's text demands. On top of this come the named conditions — unramified, minimally ramified (with the regular-unipotent coincidence), Steinberg (a domain, equal to the fixed-type ring of the special type), Ihara avoidance in rank n, at p = 2 and for GSp₄ (with the local models 𝒩(q) and ℳ(x, y; q)), Taylor–Wiles conditions in rank two, rank n and the block form, level-raising problems 𝒟^mix, 𝒟^unr, 𝒟^ram — and the fixed-determinant rank-two rings of Calegari–Geraghty Lemma 4.11 with the case v ≡ −1 mod p that the paper omits. G-valued generic fibres (Bellovin–Gee, Booher) and the equal-characteristic case (FKP) close the layer. Each residual hypothesis is stated in the node that uses it.

*Planets:* Unramified lifting ring; Minimally ramified ring; Ihara avoidance components; Level-raising local deformation problems; Unrestricted rings as complete intersections; Inertial types with monodromy.

#### `R08.2/tame-splitting` — The tame quotient and the reduction to tame pieces (lemma)

K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. Let P_K ⊆ I_K be the kernel of a surjection I_K ↠ ℤ_p (pro-order prime to p). Then G_K = P_K ⋊ T_K with T_K = G_K/P_K ≅ ℤ_p ⋊ ℤ̂ (Frobenius acting by q). For an irreducible 𝔽[P_K]-module τ with stabiliser G_τ, deformations of ρ̄ are equivalent to tuples of deformations of the multiplicity spaces ρ̄_τ = Hom_{P_K}(τ, ρ̄) as T_τ-representations.

*Hypotheses and conventions.*
- P_K has pro-order prime to p, so every lift is determined on P_K by ρ̄ (no deformations of P_K-representations).
- Enlarge 𝔽 so that every irreducible constituent of ρ̄|P_K is absolutely irreducible; the multiplicity-space tensor description uses this splitting-field hypothesis. P_K is not the usual wild inertia subgroup.

*Proof outline.* Splitting: choose a Sylow pro-p subgroup S of I_K and a Frobenius lift φ normalising it (CHT08 Lemma 2.4.10). Clifford theory: τ lifts uniquely to 𝒪 and extends to G_τ with determinant of order prime to p (Lemma 2.4.11). M ≅ ⊕_[τ] Ind_{G_τ}^{G_K}(τ ⊗ M_τ) and Hom_{G_K}(M, M′) ≅ ⊕ Hom_{T_τ}(M_τ, M′_τ) (Lemma 2.4.12), giving the equivalence on deformations (Corollary 2.4.13).

*Acceptance.* ρ̄ unramified: only τ = 1 occurs and ρ̄_1 = ρ̄ as a T_K-representation factoring through ℤ̂. If the residual inertia image is a p-group, P_K acts trivially. A tame character of nontrivial prime-to-p order instead acts nontrivially on P_K; tame ramification alone does not imply trivial P_K-action. Without the prime-to-p pro-order of P_K the reduction fails (wild ramification at ℓ = p is R08.3's subject).

*Prerequisites.* `GlobalGaloisDeformations:R04.1/lifting-functor`, `GlobalGaloisDeformations:R04.1/strict-deformation-functor`, `mathlib:ProfiniteGrp`.

*Sources.* Laurent Clozel (CHT08), §2.4.4, Lemma 2.4.10 and Corollary 2.4.13, pp. 41–43.

#### `R08.2/unramified-lifting-ring` — Unramified lifts (theorem)

K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. If ρ̄ is unramified, the unramified lifts form a deformation problem, and its ring is formally smooth over 𝒪 in n² variables (n² − 1 with fixed unramified determinant): an unramified lift is determined by ρ(φ) ∈ GL_n(A) lifting ρ̄(φ), for a Frobenius lift φ.

*Hypotheses and conventions.*
- ρ̄ unramified; for the fixed-determinant version, χ unramified.

*Proof outline.* G_K/I_K ≅ ℤ̂ and lifts of ρ̄(φ) to A form the formal neighbourhood of ρ̄(φ) in GL_n, of dimension n²; continuity is automatic since the lift of a topological generator of ℤ̂ into a pro-p neighbourhood extends uniquely. The deformation-problem axioms hold (unramifiedness is detected on points and stable under conjugation). With fixed determinant, det ρ(φ) = χ(φ) removes one variable. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* n = 2, ρ̄ trivial, χ trivial: the unramified quotient R^□_{χ,ur} is formally smooth of relative dimension 3 (Gee Theorem 3.38(2)). Unramified lifts are exactly the minimally ramified lifts when ρ̄ is unramified (CHT08 after Definition 2.4.14). Tangent space: H¹(G_K/I_K, ad ρ̄) = coker(ρ̄(φ) − 1 on ad ρ̄), plus the n² − h⁰ framing directions.

*Prerequisites.* `R08.2/tame-splitting`, `R08.1/local-lifting-ring`, `GlobalGaloisDeformations:R04.3/local-deformation-problem`, `GlobalGaloisDeformations:R04.3/deformation-problem-ideal`, `mathlib:MvPowerSeries`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Toby Gee (GEE-MLT-2022), Definition 3.36(1) and Theorem 3.38(2), p. 21; Laurent Clozel (CHT08), §2.4.4, remark after Definition 2.4.14, p. 43.

#### `R08.2/minimally-ramified-condition` — Minimally ramified lifts (definition)

K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. A lift ρ of an m-dimensional representation ρ̄ of T_q = ℤ_p ⋊ ℤ is minimally ramified if ker(ρ(σ_q) − 1)^i ⊗_R 𝔽 → ker(ρ̄(σ_q) − 1)^i is an isomorphism for all i; a lift of ρ̄ : G_K → GL_n(𝔽) is minimally ramified if each tame piece ρ_τ (tame-splitting) is. Equivalently, the filtration Fil^i = ker(ρ(σ_q) − 1)^i is by direct summands lifting the residual one, with σ_q acting trivially on the graded pieces.

*Hypotheses and conventions.*
- The definition is independent of the generator σ_q of ℤ_p and invariant under Γ̂_n-conjugation (CHT08 remarks after Definition 2.4.14).

*Construction.* Γ̂_n-stability and independence of σ_q: ker(ρ(σ′) − 1)^i = ker(ρ(σ) − 1)^i for σ′ = σ^a, a prime to p. The kernel conditions are stable under pushforward and detected along injections (CHT08 Lemma 2.4.15, Corollaries 2.4.16–2.4.17), so minimally ramified lifts form a deformation problem (Corollary 2.4.18).

*API.*
- `TauCeti.GaloisDeformation.Local.IsMinimallyRamified` (constructor): The minimally ramified condition on lifts of ρ̄|_{T_q} and of ρ̄.
- `TauCeti.GaloisDeformation.Local.isMinimallyRamified_iff_filtration` (characterisation): Equivalent to a σ_q-unipotent filtration by direct summands lifting the residual kernel filtration.
- `TauCeti.GaloisDeformation.Local.IsMinimallyRamified.conj` (compatibility): Stable under Γ̂_n-conjugation.
- `TauCeti.GaloisDeformation.Local.minimallyRamified_deformationProblem` (instance): Minimally ramified lifts form a deformation problem.
- `TauCeti.GaloisDeformation.Local.minimal_baseChange` (functoriality): A map of coefficient algebras carries a minimal lift and its split kernel flag to the corresponding minimal lift; each kernel commutes with base change.
- `TauCeti.GaloisDeformation.Local.minimal_generator_independent` (relation): Replacing a topological generator of the pro-p tame inertia factor by its unit power gives the same minimal condition and kernel filtration.

*Unit tests.*
- `minRam_unramified` (compatibility): For unramified ρ̄, minimally ramified = unramified.
- `minRam_conj` (characterisation): Conjugating by Γ̂_n preserves the condition.
- `minRam_non_example` (non-example): ρ(σ_q) = (1 x; 0 1), x ∈ m_A∖0, lifting ρ̄(σ_q) = 1, is not minimally ramified.

*Used by.* LocalGaloisDeformationRings:R08.2/minimally-ramified-ring — its representing quotient.; GlobalGaloisDeformations:R04.3 — local conditions at places v ∤ p in minimal global problems.; LocalGaloisDeformationRings:L7 — L7's rank-n minimally ramified conditions build on this (RS-08 link).

*Acceptance.* ρ̄ unramified: minimally ramified = unramified. ρ̄ = (1 1; 0 1) on σ_q: a minimally ramified lift keeps ρ(σ_q) unipotent with a rank-one kernel filtration lifting the residual one. Non-example: for ρ̄(σ_q) = 1, the lift ρ(σ_q) = (1 x; 0 1) with x ∈ m_A∖0 is not minimally ramified (the kernel drops rank).

*Prerequisites.* `R08.2/tame-splitting`, `GlobalGaloisDeformations:R04.3/local-deformation-problem`.

*Sources.* Laurent Clozel (CHT08), §2.4.4, Definition 2.4.14 and Corollary 2.4.18, pp. 43–44.

#### `R08.2/minimally-ramified-ring` — The minimally ramified deformation ring (theorem)

K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. The minimally ramified problem D_v is liftable, its tangent space L_v has dimension h⁰(G_K, ad ρ̄), and R^loc/I(D_v) is a power series ring in n² variables over 𝒪. If p ∤ #ρ̄(I_K), a lift is minimally ramified iff it vanishes on ker ρ̄|_{I_K}, and L_v = H¹(G_K/I_K, (ad ρ̄)^{I_K}).

*Hypotheses and conventions.*
- No hypothesis on ρ̄ beyond continuity; the p ∤ #ρ̄(I_K) description is a special case.

*Proof outline.* For T_q: the flag of residual kernels defines a point of a flag variety; minimally ramified lifts are lifts preserving a lifting flag with unipotent action of σ_q, and the functor is formally smooth of relative dimension m² (CHT08 Lemma 2.4.19). dim L_v(D_T) = dim H⁰(T_q, ad ρ̄) (Corollary 2.4.20); summing over tame pieces with H⁰(G_K, ad ρ̄) = ⊕ H⁰(T_τ, ad ρ̄_τ) gives the G_K statement (Corollary 2.4.21). If p ∤ #ρ̄(I_K): H¹(ρ̄(I_K), ad ρ̄) = 0, so minimal lifts factor through G_K/ker ρ̄|_{I_K} (Lemma 2.4.22). Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* ρ̄ unramified: recovers unramified-lifting-ring (n² variables). n = 2, ρ̄(I_K) of order prime to p (e.g. a tamely ramified principal series with distinct characters): the minimal ring is 𝒪[[4 variables]]. dim L_v − h⁰ = 0, the local contribution used in the global count of GlobalGaloisDeformations R04.3.

*Prerequisites.* `R08.2/minimally-ramified-condition`, `R08.2/tame-splitting`, `R08.1/local-lifting-ring`, `GlobalGaloisDeformations:R04.3/deformation-problem-ideal`, `mathlib:MvPowerSeries`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Laurent Clozel (CHT08), §2.4.4, Corollary 2.4.21, p. 46; Laurent Clozel (CHT08), §2.4.4, Lemma 2.4.22, p. 47.

#### `R08.2/unrestricted-away-from-p` — Structure of unrestricted lifting rings away from p (theorem)

K/ℚ_ℓ is finite with ℓ ≠ p, residue field k of order q, ρ̄ : G_K → GL_n(𝔽) continuous; lifts are to C_𝒪. (1) If H⁰(G_K, (ad ρ̄)(1)) = 0 then H²(G_K, ad ρ̄) = 0 and R^□_ρ̄ is a power series ring in n² variables over 𝒪. (2) For n = 2 and fixed determinant χ: R^□_{ρ̄,χ} is equidimensional of Krull dimension 4, R^□_{ρ̄,χ}[1/p] has dimension 3, its irreducible components are regular and finitely many, and the restriction to inertia of the Weil–Deligne type (forgetting N) is constant on each component.

*Hypotheses and conventions.*
- (2) is stated for n = 2 as in Gee (who cites Böckle's survey Theorem 3.3.1); the general-n component statement is recorded through BLGGT Lemma 1.3.4 as quoted by Tung.

*Proof outline.* (1): local Tate duality gives H² ≅ H⁰(ad(1))^∨ = 0, so the local ring is unobstructed of tangent dimension h¹ + n² − h⁰ = n² (local Euler characteristic 0 for ℓ ≠ p) (CHT08 Lemma 2.4.9; local-tangent-obstruction). (2): by tame-splitting the lifts are determined by ρ(σ) and ρ(φ) with φσφ^{-1} = σ^q; the resulting explicit rings have the stated structure (Gee Theorem 3.31, Shotton for complete equations). Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* For ρ̄ with H⁰(ad(1)) = 0 (e.g. q ≢ 1 mod p and ρ̄(φ) with eigenvalue ratios ≠ q^{±1}), R^□ is smooth. Points on the same component of R^□[1/p] have isomorphic semisimplified restriction to inertia (Tung Lemma 3.2.8, quoting BLGGT Lemma 1.3.4). ρ̄ trivial with q ≡ 1 mod p: R^□ is not smooth; its components are described in ihara-avoidance-components.

*Prerequisites.* `R08.1/local-lifting-ring`, `R08.1/local-tangent-obstruction`, `R08.2/tame-splitting`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Laurent Clozel (CHT08), §2.4.3, Lemma 2.4.9, p. 40; Toby Gee (GEE-MLT-2022), Theorem 3.31, p. 19; Shen-Ning Tung (TUNG-2021), §3.2.6, Lemma 3.2.8, p. 15.

#### `R08.2/inertial-type-quotient` — Fixed inertial type quotients (definition)

For n = 2, ℓ ≠ p and a full inertial Weil–Deligne type τ = (r|I_K,N), let R^□_{ρ̄,χ,τ} be the reduced 𝒪-flat quotient defined by the Zariski closure in Spec R^□_{ρ̄,χ} of its characteristic-zero points of exact type τ. A nonzero such quotient is a union of irreducible components of absolute Krull dimension 4. Exact-type points lie in its generic fibre and are Zariski dense there; boundary points may have smaller monodromy. The pointwise iff in Gee §3.31 requires correction (E3). Only finitely many types give nonzero quotients.

*Hypotheses and conventions.*
- The type retains N, as in Gee §3.30. The closure construction is Shotton Definition 3.5 and Proposition 3.6; constancy of full monodromy is only claimed for points on unique irreducible components (BLGGT Lemma 1.3.4(2)).

*Construction.* Take the Zariski closure of the exact-type E-points and its reduced scheme structure. Shotton Proposition 3.6 identifies it with a union of irreducible components, hence it is 𝒪-flat. A closed quotient cannot exclude specializations where N drops in rank.

*API.*
- `TauCeti.GaloisDeformation.Local.typeQuotient` (constructor): R^□_{ρ̄,χ,τ} as a quotient of R^□_{ρ̄,χ}.
- `TauCeti.GaloisDeformation.Local.typeQuotient_points` (characterisation): Every exact-type point factors through the type quotient; its exact-type points are Zariski dense. The converse can fail on component intersections.
- `TauCeti.GaloisDeformation.Local.typeQuotient_krullDim` (characterisation): Nonzero ⇒ Krull dimension 4 (n = 2).
- `TauCeti.GaloisDeformation.Local.typeQuotient_finite` (relation): Only finitely many full inertial types have a nonzero closure quotient.
- `TauCeti.GaloisDeformation.Local.typeQuotient_unique` (universal-property): The defining ideal is the intersection of the kernels of all characteristic-zero exact-type points. Any reduced 𝒪-flat quotient defined by that same closure has the same kernel, hence a unique compatible quotient-ring isomorphism.

*Unit tests.*
- `typeQuotient_unramified` (computation): For ρ̄ unramified, trivial r|I_K and N = 0 give the unramified quotient. The closure of a Steinberg type with N ≠ 0 can meet it at an N = 0 point.
- `typeQuotient_finite` (characterisation): Only finitely many types occur.
- `typeQuotient_not_torsion` (non-example): The naive quotient by the equations of the type need not be p-torsion free; the definition takes the flat closure.

*Used by.* LocalGaloisDeformationRings:R08.6 — fixed-type local conditions in global arguments.; GlobalGaloisDeformations:R04.3 — local rings R^□_v/I(D_v) of fixed type.

*Acceptance.* τ trivial on inertia with N = 0: the unramified component. For ρ̄ trivial, τ = (ζ, ζ^{-1}) with ζ ≠ 1 gives the components P_ζ of ihara-avoidance-components. Only finitely many τ give nonzero quotients.

*Prerequisites.* `R08.2/unrestricted-away-from-p`, `GlobalGaloisDeformations:R04.3/deformation-problem-ideal`.

*Sources.* Toby Gee (GEE-MLT-2022), §3.31, after Theorem 3.31, pp. 19–20; Jack Shotton (SHOTTON-2018), Definition 3.5 and Proposition 3.6.

#### `R08.2/taylor-wiles-local-ring` — Local rings at Taylor–Wiles primes (theorem)

Let n = 2, ℓ ≠ p, ρ̄ unramified with ρ̄(Frob_K) having distinct eigenvalues, q ≡ 1 mod p with p^m ∥ q − 1, and χ unramified. Then R^□_{ρ̄,χ} ≅ 𝒪[[x, y, B, u]]/((1 + u)^{p^m} − 1), with ρ^□(φ) = (1 y; x 1)^{-1} diag(α + B, χ(φ)/(α + B)) (1 y; x 1) and ρ^□(σ) = (1 y; x 1)^{-1} diag(1 + u, (1 + u)^{-1}) (1 y; x 1).

*Hypotheses and conventions.*
- Distinct Frobenius eigenvalues α ≠ β in 𝔽 and q ≡ 1 mod p.

*Proof outline.* ρ^□(P_K) = 1 (pro-ℓ into pro-p); lifts are determined by ρ(φ), ρ(σ) with φ^{-1}σφ = σ^q. By Hensel's lemma diagonalise ρ(φ) by (1 y; x 1) with eigenvalues α + a, β + b. The relation with σ forces ρ(σ) diagonal in the same basis; χ unramified gives the second entry (1 + u)^{-1}; (1 + u)^q = 1 + u gives (1 + u)^{q−1} = 1, hence (1 + u)^{p^m} = 1. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* Outside the q ≡ 1 hypothesis, if q ≢ 1 mod p and the residual Frobenius eigenvalue ratio is neither q nor q⁻¹, local duality gives H²(ad⁰ρ̄) = 0 and the fixed-determinant ring is formally smooth of relative dimension 3. The displayed Taylor–Wiles presentation is not asserted without these extra conditions. The ring is flat over 𝒪[u]/((1 + u)^{p^m} − 1), the group ring of the p-part of k^×; this is the diamond operator action used in patching (R04.5). Distinct eigenvalues are necessary: for ρ̄(Frob) scalar the ring is the Ihara-avoidance ring instead.

*Prerequisites.* `R08.2/unrestricted-away-from-p`, `R08.2/tame-splitting`, `R08.1/local-lifting-ring`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Toby Gee (GEE-MLT-2022), §3.32, Lemma 3.33 and Exercise 3.34, p. 20.

#### `R08.2/steinberg-condition` — Steinberg (unipotent-monodromy) lifts (definition)

Let ℓ ≠ p, ρ̄ trivial of dimension n, q ≡ 1 mod p. D^Stein,1 consists of the lifts ρ with char ρ(σ)(X) = (X − 1)^n for σ ∈ I_K and char ρ(φ)(X) ∈ Pol_n({n}, q), i.e. Frobenius eigenvalues of the form α, qα, …, q^{n−1}α; D^Stein is its flat closure (the quotient by λ-power torsion). For n = 2 this is Gee's P_m: char ρ(σ) = (X − 1)² and q(tr ρ(φ))² = (1 + q)² det ρ(φ). The condition records the monodromy relation; it is not the same as scalar (unipotent) inertial semisimplification, which is D^{(1,…,1)}.

*Hypotheses and conventions.*
- RS-08/stage text: a special/Steinberg condition includes monodromy and is not synonymous with a scalar inertial semisimplification.

*Construction.* The conditions are closed, Γ̂_n-stable and detected on points, so they form deformation problems; taking the λ-torsion-free quotient keeps this (Taylor II §3).

*API.*
- `TauCeti.GaloisDeformation.Local.SteinbergLifts` (constructor): D^Stein,1 and its flat closure D^Stein.
- `TauCeti.GaloisDeformation.Local.steinberg_charpoly_frob` (characterisation): Frobenius eigenvalues in ratio q.
- `TauCeti.GaloisDeformation.Local.steinberg_le_unipotentInertia` (relation): D^Stein ⊆ D^{(1,…,1)}.
- `TauCeti.GaloisDeformation.Local.steinberg_n_two` (characterisation): For n = 2, the relation q(tr ρ(φ))² = (1 + q)² det ρ(φ).
- `TauCeti.GaloisDeformation.Local.SteinbergLifts.baseChange` (functoriality): A coefficient map carries a lift with unipotent inertia and a chosen q-chain Frobenius polynomial to one satisfying the same equations. A lift represented by the 𝒪-flat closure stays represented by that quotient after composition.

*Unit tests.*
- `stein_n_two_relation` (computation): For n = 2 the Steinberg relation is q(tr ρ(φ))² = (1 + q)² det ρ(φ).
- `stein_subset_unipotent` (characterisation): Every Steinberg lift has unipotent inertia.
- `stein_not_unipotent_only` (non-example): An unramified lift with Frobenius eigenvalue ratio ≠ q has unipotent inertia but is not Steinberg.

*Used by.* LocalGaloisDeformationRings:R08.2/ihara-avoidance-components — the Steinberg component.; LocalGaloisDeformationRings:L7 — L7's rank-n Steinberg conditions build on this (RS-08 link).

*Acceptance.* For n = 2 and ρ(σ) = (1 1; 0 1), the relation on ρ(φ) is forced: φσφ^{-1} = σ^q makes the eigenvalue ratio q. D^Stein ⊊ D^{(1,1)}: the unramified lifts satisfy the inertia condition but not the Frobenius relation in general. Characteristic-zero points of D^Stein have monodromy N ≠ 0 generically.

*Prerequisites.* `R08.2/tame-splitting`, `GlobalGaloisDeformations:R04.3/local-deformation-problem`, `GlobalGaloisDeformations:R04.3/deformation-problem-ideal`.

*Sources.* Richard Taylor (TAYLOR-II-2008), §3, definition of D^{Stein,1} and D^{Stein} before Proposition 3.1, p. 196; Toby Gee (GEE-MLT-2022), Definition 3.36(3), p. 21.

#### `R08.2/ihara-avoidance-components` — Components for Ihara avoidance (theorem)

Let ℓ ≠ p, ρ̄ trivial, q ≡ 1 mod p, characters χ_i : I_K → 1 + λ trivial mod λ. (1) If the χ_i are distinct, Spec R^□/I^{(χ_i)} is irreducible with characteristic-zero generic point and Krull dimension n² + 1. (2) R^□/(λ, I^{(χ_i)}) = R^□/(λ, I^{(1,…,1)}). (3) All components of Spec R^□/I^{(1,…,1)} have dimension n² + 1 with characteristic-zero generic points, and each prime minimal over λ contains a unique minimal prime. (4) Spec R^□/I^Stein is irreducible of dimension n² + 1. For n = 2 with χ trivial: the minimal primes of R^□_{ρ̄,χ} are √P_ur, √P_m and √P_ζ (ζ ≠ 1), with √P₁ = √P_ur ∩ √P_m, and R^□_{χ,1}/λ = R^□_{χ,ζ}/λ.

*Hypotheses and conventions.*
- These are Taylor's 'Ihara avoidance' rings; they compare Galois representations with different ramification at v ∤ p.
- The geometric irreducibility statements use sufficiently large coefficient integers 𝒪. Thorne 2015 Proposition 3.15 supplies the general-rank extension beyond Taylor’s standing p>n; in the separate n=2 fixed-determinant clauses assume p>2 and χ=1 on G_K.

*Proof outline.* Taylor II §3 analyses the rings through characteristic polynomials of ρ(σ) and ρ(φ) and the subschemes Pol_n(σ, q) (Proposition 3.1). For n = 2 the rings can be written down explicitly (Shotton) and give Gee's Proposition 3.37 and Theorem 3.38. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* n = 2: R^□_{χ,ur} is formally smooth of relative dimension 3 and R^□_{χ,m}[1/p], R^□_{χ,ζ}[1/p] are geometrically irreducible of dimension 3. The equality of special fibres (2) is the key input to Taylor's avoidance of Ihara's lemma. Spec R^□_{χ,1} = Spec R^□_{χ,ur} ∪ Spec R^□_{χ,m} has exactly two components. Newton–Thorne, proof of Theorem 5.9: at v₁ with q_{v₁} ≡ 1 mod p the unipotently ramified and the tamely-ramified-type lifting rings are congruent mod ϖ (part (2)), so the tame-type ring is non-zero.

*Prerequisites.* `R08.2/steinberg-condition`, `R08.2/unrestricted-away-from-p`, `R08.2/inertial-type-quotient`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Richard Taylor (TAYLOR-II-2008), §3, Proposition 3.1, p. 196; Toby Gee (GEE-MLT-2022), Proposition 3.37 and Theorem 3.38, p. 21; James Newton (NT-2026), proof of Theorem 5.9, arXiv v2 p. 45; Jack Thorne (THORNE-2015), Proposition 3.15 and its proof.

#### `R08.2/q-tame-group` — The q-tame group (definition)

For a positive integer q prime to p, the q-tame group T_q is the semidirect product t^{ℤ_p} ⋊ φ_q^{ℤ̂} of profinite groups with φ_q t φ_q^{-1} = t^q. For b ≥ 1, T_{q^b} is identified with the closed subgroup topologically generated by t and φ_q^b. For K/ℚ_ℓ finite (ℓ ≠ p) with residue field of order q, G_K/P_K ≅ T_q, where P_K is the kernel of a surjection I_K ↠ ℤ_p (R08.2/tame-splitting).

*Hypotheses and conventions.*
- The isomorphism G_K/P_K ≅ T_q depends on a choice of Frobenius lift and of a generator t of the p-part of tame inertia.
- The pair criterion is for R∈C_𝒪 with its maximal-ideal topology and continuous representations; it is not a claim for arbitrary discrete rings.

*Construction.* T_q is the quotient T_K of R08.2/tame-splitting with the generators named; the identification of T_{q^b} with ⟨t, φ_q^b⟩ is the inclusion G_{K_b} ⊂ G_K for the unramified extension of degree b.

*API.*
- `TauCeti.GaloisDeformation.Local.TameGroup` (data): T_q as a profinite group with generators t, φ_q.
- `TauCeti.GaloisDeformation.Local.TameGroup.conj_t` (relation): φ_q t φ_q^{-1} = t^q.
- `TauCeti.GaloisDeformation.Local.TameGroup.lift` (universal-property): A pair (A, B) in GL_n(R) with B A B^{-1} = A^q and A ≡ 1 mod 𝔪 (pro-p) defines a unique continuous representation of T_q.
- `TauCeti.GaloisDeformation.Local.TameGroup.ofLocalField` (equivalence): G_K/P_K ≅ T_q for K/ℚ_ℓ with residue field 𝔽_q, given the choices.
- `TauCeti.GaloisDeformation.Local.TameGroup.lift_ext` (extensionality): Two continuous representations of T_q into GL_n(R) that agree on the chosen dense topological generators t and φ_q are equal. The unique lift of a tame pair commutes with continuous coefficient maps.

*Unit tests.*
- `tameGroup_abelianisation` (computation): T_q^{ab} ≅ ℤ_p/(q − 1) × ℤ̂.
- `tameGroup_q_one` (degenerate): q = 1: T_1 = ℤ_p × ℤ̂ is abelian (the relation φtφ^{-1} = t is trivial).
- `tameGroup_not_direct` (non-example): For q ≢ 1 mod p, T_q is not abelian: φ_q t φ_q^{-1} = t^q ≠ t.
- `tameGroup_sub` (characterisation): ⟨t, φ_q^b⟩ ≅ T_{q^b}.

*Used by.* LTXZZ 2022, §6.4 — the local model at 𝔭 uses Γ_{F⁺_𝔭}/P ≅ T_p; LocalGaloisDeformationRings:R08.2/level-raising-local-problems — the group on which the local lifts are written

*Acceptance.* Every continuous representation of T_q on a finite free 𝒪-module is determined by the pair (ρ(t), ρ(φ_q)) with ρ(φ_q)ρ(t)ρ(φ_q)^{-1} = ρ(t)^q.

*Prerequisites.* `R08.2/tame-splitting`, `mathlib:ProfiniteGrp`.

*Sources.* Yifeng Liu (LTXZZ-RIGID-2021), Definition 3.3.1, arXiv v1 p. 15.

#### `R08.2/level-raising-local-problems` — Level-raising local deformation problems 𝒟^mix, 𝒟^unr, 𝒟^ram (construction)

Let F/F⁺ be a quadratic CM extension, v an inert finite place with residue cardinality q=Nv prime to p, w the place above v, N≥2, p≥N, and p∤(q²−1). Let (r̄,χ) be the polarized 𝒢_N-valued local problem of LTXZZ Definition 3.5.1, with r̄♮ on G_{F_w} unramified, χ=η_v^μ ε_p^{1−N}, and the generalized eigenvalues of r̄♮(φ_w) containing {q^{−N},q^{−N+2}} exactly once. In its canonical rank-two block M₀, define 𝒟^mix by inertia preserving M₀ and acting trivially on M₁, 𝒟^unr by trivial inertia on M₀ too, and 𝒟^ram by characteristic polynomial (T−q^{−N})(T−q^{−N+2}) on M₀. For these polarized lifts, 𝒟^mix is formally smooth over Spf 𝒪[[x₀,x₁]]/(x₀x₁) of pure relative dimension N²−1; its two components 𝒟^unr and 𝒟^ram have relative dimension N². With r♮(t)v=v+xv′, and Frobenius eigenvalues s,s′, the relation is x(s−q^{−N})=0. Here φ_w t φ_w⁻¹=t^{q²}, since #k(w)=q². This is not asserted for arbitrary GL_N lifts over a local field of residue size q.

*Hypotheses and conventions.*
- Retain the polarized group 𝒢_N=(GL_N×GL₁)⋊{1,j}, its fixed similitude and the inert quadratic local extension. The source’s μ is the sign parameter of this polarized problem. The monodromy direction is from the q^{−N} eigenline toward q^{−N+2}; with arithmetic φ_w the relation uses q².

*Construction.* Use the source’s block decomposition with the polarization to reduce to N=2. Then pairs (B,X) satisfy BᵗXB⁻¹=−qX (LTXZZ Proposition 3.5.2, equation (3.21)). This extra polarized relation gives the nodal equation. The other block and conjugation coordinates are formally smooth of total relative dimension N²−1 over the nodal base.

*API.*
- `TauCeti.GaloisDeformation.Local.LevelRaising.mix` (data): The polarized local problem 𝒟^mix with its canonical rank-two block at an inert place; the GL_N restriction is r♮ on G_{F_w}.
- `TauCeti.GaloisDeformation.Local.LevelRaising.unr` (constructor): 𝒟^unr ⊂ 𝒟^mix.
- `TauCeti.GaloisDeformation.Local.LevelRaising.ram` (constructor): 𝒟^ram ⊂ 𝒟^mix.
- `TauCeti.GaloisDeformation.Local.LevelRaising.localModel` (equivalence): 𝒟^mix is formally smooth over Spf 𝒪⟦x₀, x₁⟧/(x₀x₁), with 𝒟^unr = {x₀ = 0} and 𝒟^ram = {x₁ = 0}.
- `TauCeti.GaloisDeformation.Local.LevelRaising.relation` (relation): x(s − q^{−N}) = 0 in R^mix.
- `TauCeti.GaloisDeformation.Local.LevelRaising.unr_eq_minimal` (compatibility): For the unramified polarized residual problem 𝒟^unr is the polarized unramified lifting condition; after restriction to G_{F_w} it is unramified GL_N inertia.

*Unit tests.*
- `levelRaising_dims` (computation): Relative dimensions: 𝒟^mix and 𝒟^unr have N² − 1 + 1 = N² as framed rings over 𝒪 on each component; 𝒟^ram is formally smooth of relative dimension N².
- `levelRaising_N2_components` (characterisation): For N = 2, Spec R^mix has exactly two irreducible components, R^unr and R^ram, meeting in R^mix/(x, s − q^{−2}).
- `levelRaising_wrong_direction` (non-example): For φ_w t φ_w⁻¹=t^{q²}, the direction r♮(t)v=v+xv′ gives x(s′−q²s)=0; the reversed direction gives x(s−q²s′)=0. These are different relations. Both vanish when x=0, so the reversed relation does not fail on the unramified component.
- `levelRaising_degenerate_eigenvalues` (degenerate): When p divides q²−1 the two residual eigenvalues coincide and separate eigenlines are not supplied by Hensel. The polarized nodal model requires p∤(q²−1).

*Used by.* LTXZZ 2022, §6.4 — the rings R^mix, R^unr, R^ram, R^cong of the level-raising argument; LTXZZ 2022, Definition 6.3.3 — rigidity condition (2) at Σ⁺_lr is the residual hypothesis of this construction; GlobalGaloisDeformations:G7 — local conditions of polarized rank-N problems

*Acceptance.* N=2 at an inert v: the polarized mixed ring has two components, with GL₂ Frobenius on G_{F_w} of residue size q² and the special pair in ratio q². 𝒟^unr ∩ 𝒟^ram = Spf of R^mix/(x₀, x₁), the congruence locus used for level raising.

*Prerequisites.* `R08.2/q-tame-group`, `R08.2/unramified-lifting-ring`, `R08.2/steinberg-condition`, `R08.1/local-lifting-ring`, `GlobalGaloisDeformations:R04.3/local-deformation-problem`, `GlobalGaloisDeformations:G7/polarized-deformation-problem`.

*Sources.* Yifeng Liu (LTXZZ-RIGID-2021), Definition 3.5.1, arXiv v1 p. 27; Yifeng Liu (LTXZZ-RIGID-2021), Proposition 3.5.2, arXiv v1 p. 27; Yifeng Liu (LTXZZ-2022), §6.4, published p. 281.

#### `R08.2/unrestricted-ring-complete-intersection` — Unrestricted lifting rings away from p are complete intersections (theorem)

Let K/ℚ_ℓ be finite, ℓ ≠ p, and r̄ : G_K → GL_N(k). (1) The lifting ring R^□_r̄ is a reduced local complete intersection, flat over 𝒪 and of pure relative dimension N²; R^□_r̄/ϖ is equidimensional of dimension N². (2) Every irreducible component of Spf R^□_r̄ is a local deformation problem. (3) When p ≥ N, the minimally ramified problem 𝒟^min (R08.2/minimally-ramified-condition) is an irreducible component of Spf R^□_r̄, formally smooth over 𝒪 of relative dimension N².

*Hypotheses and conventions.*
- (3) needs p ≥ N; for smaller p the minimally ramified condition is still liftable and formally smooth (R08.2/minimally-ramified-ring) but the comparison with a component uses Shotton's description of components through inertial types.

*Proof outline.* Shotton, Generic local deformation rings when ℓ ≠ p, Theorem 2.5 (as cited by NT26 Lemma 3.6 and BCGP25 Lemma 5.6.2): R^□_r̄ is 𝒪-flat, reduced, a complete intersection of relative dimension N², via the presentation of lifts of the tame quotient (R08.2/tame-splitting) as pairs (Φ, Σ) with ΦΣΦ^{-1} = Σ^q, a complete intersection of dimension N² + 1 in GL_N × GL_N. (2): a component is cut out by a minimal prime, and stability under strict equivalence follows from irreducibility of the conjugating group (LTXZZ companion Proposition 3.4.12(2)). (3): 𝒟^min is formally smooth of relative dimension N² (R08.2/minimally-ramified-ring) and closed, so it is a union of components; it is irreducible.

*Acceptance.* N = 1: R^□ = 𝒪[Δ]⟦y⟧ with Δ the p-part of the local residue field k_K^×, a complete intersection with #Δ components. N = 2, r̄ trivial, q ≡ 1 mod p: R^□ has dimension 5 = N² + 1 (R08.2/ihara-avoidance-components).

*Prerequisites.* `R08.2/tame-splitting`, `R08.2/minimally-ramified-ring`, `R08.2/unrestricted-away-from-p`, `R08.1/local-tangent-obstruction`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Yifeng Liu (LTXZZ-RIGID-2021), Proposition 3.4.12, arXiv v1 p. 25; James Newton (NT-2026), proof of Lemma 3.6, arXiv v2 p. 18.

#### `R08.2/inertial-type-with-monodromy` — Inertial types with monodromy and fixed-type rings (definition)

Let K/ℚ_ℓ be finite, ℓ ≠ p. An inertial type (in Shotton's sense) is an isomorphism class of continuous representations τ : I_K → GL_n(ℚ̄_p) that extend to the Weil group W_K, together with the monodromy: equivalently, an I_K-isomorphism class of Weil–Deligne representations (r, N) restricted to inertia with N retained. For r̄ : G_K → GL_n(k) and τ, R^□_r̄(τ) is the reduced 𝒪-flat quotient of R^□_r̄ defined by the Zariski closure of exact-type characteristic-zero points; N is retained in τ but may drop at boundary points.

*Hypotheses and conventions.*
- This is the rank-general form of R08.2/inertial-type-quotient, which already retains N. The full type is the isomorphism class of the inertial representation including its unipotent part, equivalently (r|I_K,N).

*Construction.* Use Shotton Definition 3.5 and Proposition 3.6: the reduced closure of exact-type points is a union of irreducible components. Full monodromy type need not be constant at intersections. BLGGT Lemma 1.3.4(1) keeps the semisimple inertia representation fixed, while (2) requires unique irreducible components for N as well.

*API.*
- `TauCeti.GaloisDeformation.Local.InertialType` (data): An inertial type: an I_K-isomorphism class of Weil–Deligne representations restricted to I_K, N retained.
- `TauCeti.GaloisDeformation.Local.fixedTypeRing` (constructor): R^□_r̄(τ), the reduced 𝒪-flat closure quotient of exact-type points.
- `TauCeti.GaloisDeformation.Local.fixedTypeRing_points` (characterisation): Every exact-type point lies on R^□_r̄(τ), and such points are dense in its generic fibre. Boundary points need not have exact type τ.
- `TauCeti.GaloisDeformation.Local.fixedTypeRing_union` (other): The generic fibre is covered by finitely many closed type-ring loci, which can intersect; this is not a disjoint union.
- `TauCeti.GaloisDeformation.Local.fixedTypeRing_n2` (compatibility): For n=2, after imposing the same compatible determinant, this closure definition agrees with R08.2/inertial-type-quotient.
- `TauCeti.GaloisDeformation.Local.fixedTypeRing.unique` (universal-property): The reduced flat closure quotient is uniquely characterized by the intersection of kernels of exact-type characteristic-zero points. Its ring maps agree if they agree after precomposing the quotient map from R^□_r̄.

*Unit tests.*
- `inertialType_steinberg_vs_trivial` (non-example): The trivial type and Steinberg type Sp₂ differ by N. Their closure rings can meet at an N=0 specialization, for instance the family ρ_c(φ)=diag(q,1), ρ_c(t)=(1 c;0 1) with c=pt and q≡1 mod p.
- `inertialType_unramified` (computation): For r̄ unramified and τ trivial with N = 0 the ring is the unramified-after-twist ring, formally smooth of relative dimension n² (R08.2/unramified-lifting-ring).
- `inertialType_dimension` (characterisation): Each nonzero R^□_r̄(τ) is equidimensional of dimension 1 + n².
- `inertialType_empty` (degenerate): If the reductions of τ|P_K and ρ̄|P_K are incompatible after coefficient extension, the exact-type locus and its closure ring are empty. Compare characteristic-zero and characteristic-p representations through reduction, not literal equality.

*Used by.* NT26, proof of Lemma 3.6 — R_v and R_v′ for the types τ_s and τ_{Sp_n}; Dotto 2018, Theorem 6.1 — Breuil–Mézard cycles for D^× types (R08.2/dotto-division-algebra-cycles); LocalGaloisDeformationRings:R08.2/fixed-type-rings-rank-n — dimension and components

*Acceptance.* τ trivial with N = 0 gives the unramified-after-twist component; τ = τ_{Sp_n} gives the Steinberg component of R08.2/steinberg-condition.

*Prerequisites.* `R08.2/unrestricted-ring-complete-intersection`, `R08.2/inertial-type-quotient`, `R08.2/steinberg-condition`, `ArithmeticGaloisRepresentations:R01.2/grothendieck-monodromy-and-the-weil-deligne-functor`.

*Sources.* James Newton (NT-2026), proof of Lemma 3.6, arXiv v2 p. 18; Jack Shotton (SHOTTON-2018), Definition 3.5 and Proposition 3.6.

#### `R08.2/fixed-type-rings-rank-n` — Fixed-type rings away from p in rank n and constancy of types on components (theorem)

Let K/ℚ_ℓ be finite, ℓ ≠ p, r̄ : G_K → GL_n(k). (1) For each inertial type τ, R^□_r̄(τ) is reduced, 𝒪-flat and equidimensional of dimension 1 + n², and R^□_r̄/ϖ is equidimensional of dimension n². (2) If two ℚ̄_p-points lie on the same irreducible component of Spec R^□_r̄[1/p] and neither lies on any other irreducible component, their Weil–Deligne representations restricted to I_K are conjugate; hence the conductor is constant on pure points of a component. (3) Spec R^□_r̄[1/p] has finitely many connected components, and there is a finite extension K′/K such that every lift of r̄ becomes unipotently ramified on G_{K′}.

*Hypotheses and conventions.*
- (2) is BLGGT Lemma 1.3.4(2) as used by LTXZZ 2022 (proof of Lemma 6.4.2) and BCGP25 §7.5.2; it is a statement about points of the generic fibre that each lie on a unique irreducible component.
- (3) is BCGP25 Lemma 5.6.2, stated there at p = 2 but valid for every p.

*Proof outline.* (1) Shotton Theorem 2.5 (R08.2/unrestricted-ring-complete-intersection) together with R08.2/inertial-type-with-monodromy. BLGGT Lemma 1.3.4(1) gives constancy of semisimple inertia on a connected component. Lemma 1.3.4(2) also gives constancy of N for two points on the same irreducible component when neither lies on another component. Pure points are smooth by R08.1/smooth-points-generic-fibre, so the conductor conclusion applies to them. There are finitely many connected components. Semisimple inertial type is constant on each by BLGGT Lemma 1.3.4(1); choose one point per connected component and an extension killing these finite inertia actions. The remaining inertia acts unipotently, irrespective of monodromy-rank drops.

*Acceptance.* For n=2, K=ℚ_ℓ with ℓ≡1 mod p, trivial residual representation and the compatible fixed determinant, the trivial, Steinberg and nontrivial tame type closures have absolute dimension 4. The unrestricted determinant-varying framed dimension is 5.

*Prerequisites.* `R08.2/inertial-type-with-monodromy`, `R08.2/unrestricted-ring-complete-intersection`, `R08.1/smooth-points-generic-fibre`.

*Sources.* George Boxer (BCGP-2025), Lemma 5.6.2 and its proof, arXiv v1 p. 128; James Newton (NT-2026), proof of Lemma 3.6, arXiv v2 p. 18.

#### `R08.2/rank-two-unrestricted-rings-cg` — Fixed-determinant rank-two rings away from p: complete intersection with smooth generic fibre (theorem)

In the CG18 §4.2 setting at v|N, assume ρ̄ is ramified and its conductor is minimal among twists, p≥3, and use the compatible fixed determinant χ_φ of that section. Let p be odd, v ≠ p a prime, ρ̄ : G_v → GL₂(k) and φ a fixed determinant; R_v = R_{v,φ} is the framed fixed-determinant ring. (1) R_v is a complete intersection, and R_v[1/p] is formally smooth over K. (2) After twisting ρ̄|G_v to be minimal among its twists (and extending k), H²(G_v, ad⁰ρ̄) ≠ 0 — i.e. R_v is not formally smooth — exactly in four cases: (a) v ≡ 1 mod p, ρ̄|G_v ≅ unr ⊗ (χ ⊕ 1) with χ ramified; (b) v ≡ −1 mod p, ρ̄|G_v absolutely irreducible and induced from ℚ_{v²}; (c) v ≡ 1 mod p, ρ̄|G_v ≅ unr ⊗ (1 ∗; 0 1) with ∗ ramified; (d) v ≡ −1 mod p, ρ̄|G_v ≅ unr ⊗ (ω̄ ∗; 0 1) with ∗ ramified. (3) In cases (a), (b), R_v is a power series ring over 𝒪[Δ], Δ the maximal p-quotient of F_v^× resp. F_{v²}^×. (4) In cases (c), (d), R_v ≅ 𝒪⟦x₁, …, x₄⟧/(r) for one r ≠ 0; in case (c) one may take r = C(T) − T with C(t + t^{-1}) = t^v + t^{-v} and T the trace of a generator of tame inertia, and R_v[1/p] has (q + 1)/2 geometric components (q the largest power of p dividing v − 1): one where inertia acts unipotently (T = 2) and (q − 1)/2 where it acts through ζ ≠ 1, ζ^q = 1, with T = ζ + ζ^{-1}.

*Hypotheses and conventions.*
- The paper lists only (a)–(c); case (d) is omitted though the same argument applies (source issue recorded by the reviewed extraction PAPER-CALEGARI-GERAGHTY-18, E89): for ρ̄ ≅ (ω̄ ∗; 0 1) the line ω̄² ⊂ ad⁰ρ̄(1) is trivial exactly when v ≡ ±1 mod p.
- Footnote 5 prints 'nilpotent' for unipotent and 'primitive q-th root of unity' for ζ ≠ 1 with ζ^q = 1 (extraction E92, E93); the corrected wording is used.
- This is the ramified, conductor-minimal-among-twists setting v|N of CG18 §4.2, with p≥3 and the determinant character prescribed there. It excludes arbitrary unramified residual representations such as 1⊕1, whose unrestricted ring has nonsmooth points 1⊕ε.

*Proof outline.* (2): H²(G_v, ad⁰ρ̄) ≅ H⁰(G_v, ad⁰ρ̄(1))^∨ by local Tate duality (Tau Ceti ClassFieldTheory Layer 5); run through the possible ρ̄|G_v. (3): every lift in case (a) is (⟨χ⟩ψ ⊕ ψ^{-1}) ⊗ (χ_φ⟨χ^{-1}⟩)^{1/2} with ψ ≡ 1, so tamely ramified; in case (b) induced from ⟨ξ⟩ψ; write down the universal framed lift over 𝒪[Δ]⟦…⟧. (4): R_v is a quotient of 𝒪⟦x₁, …, x₄⟧ (dim Z¹ = 4) by at most h² = 1 relation, nonzero since R_v[1/p] has dimension 3; at every closed point of R_v[1/p] (Steinberg twists, or χ_φψ ⊕ ψ^{-1} with ψ|I_v of p-power order, or induced) H²(G_v, ad⁰ρ) = 0, so R_v[1/p] is formally smooth by R08.1/completion-at-points.

*Acceptance.* v ≡ 1 mod p, ρ̄ = (1 ∗; 0 1), q = p: R_v[1/p] has (p + 1)/2 components. 𝒪[Δ] for Δ cyclic of order p is a complete intersection 𝒪[X]/(X^p − 1) with smooth generic fibre.

*Prerequisites.* `R08.2/unrestricted-away-from-p`, `R08.2/unrestricted-ring-complete-intersection`, `R08.1/completion-at-points`, `R08.1/local-fixed-determinant`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Frank Calegari (CG-2018), Lemma 4.11, published p. 364; Frank Calegari (CG-2018), proof of Lemma 4.11, published p. 364; Frank Calegari (CG-2018), footnote 5, published p. 365.

#### `R08.2/taylor-wiles-local-tangent` — Taylor–Wiles local conditions in rank n: the tangent dimension (theorem)

Let F_v/ℚ_ℓ be finite (ℓ ≠ p) with N(v) ≡ 1 mod p, and r̄|G_v ≅ s̄_v ⊕ ψ̄_v with ψ̄_v a one-dimensional generalised Frobenius eigenspace (unramified), ξ a fixed determinant. 𝒟_v consists of lifts of determinant ξ of the form s_v ⊕ ψ_v lifting s̄_v, ψ̄_v, with I_v acting by (possibly different) scalars on s_v and ψ_v, and L_v ⊂ H¹(G_v, ad⁰r̄) its tangent space. Then dim_k L_v − h⁰(G_v, ad⁰r̄) = 1.

*Hypotheses and conventions.*
- The congruence N(v) ≡ 1 mod p is needed and is omitted in CG18 §8.5.1 (it holds for the Taylor–Wiles primes used): without it the ramified direction does not exist (extraction issue E172).
- Retain CG18’s standing p>n and sufficiently large coefficient field for the cited tangent-space theorem.

*Proof outline.* Unramified block-diagonal classes contribute h⁰(G_v, ad⁰r̄), since Hom(s̄_v, ψ̄_v) has no G_v-invariants (ψ̄_v is a generalised eigenspace of multiplicity one). One ramified direction: inertia by scalars a on s_v and b on ψ_v with (n − 1)a + b = 0, a character of I_v of p-power order, which exists iff N(v) ≡ 1 mod p (tame inertia acts through k(v)^×). Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* n = 2 recovers R08.2/taylor-wiles-local-ring: dim L_v = h⁰ + 1 with h⁰ = 1 for distinct Frobenius eigenvalues.

*Prerequisites.* `R08.2/taylor-wiles-local-ring`, `R08.2/tame-splitting`, `GlobalGaloisDeformations:R04.3/local-deformation-problem`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Frank Calegari (CG-2018), §8.5.1, published p. 408.

#### `R08.2/steinberg-ring-domain` — The Steinberg lifting ring is a domain and equals the fixed-type ring (theorem)

Let K/ℚ_ℓ be finite with residue cardinality q_v ≡ 1 mod p, p^N ∥ q_v − 1 with p^N > n, and r̄ : G_K → GL_n(k) trivial. Then the Steinberg lifting ring R^St (Thorne 2015 §3.3.4: lifts with unipotent inertia and Frobenius eigenvalues α, q_vα, …, q_v^{n−1}α, flat-closed; R08.2/steinberg-condition) is a domain, and the natural surjection R^St → R^□_r̄(τ_{Sp_n}) onto the fixed-type ring of the special inertial type is an isomorphism.

*Hypotheses and conventions.*
- Thorne Proposition 3.17 was read in the publicly accessible accepted author manuscript. Its proof explicitly removes Taylor’s standing p>n restriction. Retain the trivial residual representation and q_v≡1 hypotheses; the p^N>n restriction is the NT application’s specialization.

*Proof outline.* Thorne Proposition 3.17: R^St is a domain under p^N > n. Both rings have Krull dimension 1 + n² (R08.2/fixed-type-rings-rank-n), and a surjection from a domain onto a ring of the same dimension with minimal primes of that dimension is an isomorphism (NT26, proof of Lemma 3.8).

*Acceptance.* For n=2 and p>2, the unrestricted Steinberg ring has absolute dimension 5. After imposing the compatible determinant it is the Gee P_m component of the fixed-determinant ring, with absolute dimension 4.

*Prerequisites.* `R08.2/steinberg-condition`, `R08.2/inertial-type-with-monodromy`, `R08.2/fixed-type-rings-rank-n`.

*Sources.* James Newton (NT-2026), proof of Lemma 3.8, arXiv v2 p. 20; Jack Thorne (THORNE-2015), Proposition 3.17.

#### `R08.2/dotto-division-algebra-cycles` — Breuil–Mézard cycles for central division algebras away from p (theorem)

Let K/ℚ_ℓ be finite (ℓ ≠ p), D a central division algebra of rank n over K, 𝒪_D^× its maximal compact subgroup, r̄ : G_K → GL_n(k), and E/ℚ_p large enough that every type τ of a lift of r̄, and all K-types for GL_n(K) and D^× attached to it, are defined over E, and that the irreducible components of Spec R^□_r̄[1/p] and of Spec R^□_r̄/ϖ are geometrically irreducible. For an inertial type with monodromy (τ, N) (R08.2/inertial-type-with-monodromy) let R^□_r̄(τ, N) be Shotton's fixed-type quotient (R08.2/fixed-type-rings-rank-n). (1) (Dotto §6, case ℓ ≠ p) The cycle maps cyc : R_E(GL_n(𝒪_K)) → Z^{n²}(R^□_r̄), σ ↦ Σ_{(τ,N)} dim Hom_{GL_n(𝒪_K)}(σ^∨ ⊗ ℚ̄_p, π_{τ,N})·[R^□_r̄(τ, N)], and cyc_{D^×} : R_E(𝒪_D^×) → Z^{n²}(R^□_r̄), σ ↦ Σ_{(τ,N)} dim Hom_{𝒪_D^×}(σ^∨ ⊗ ℚ̄_p, JL^{−1}(π_{τ,N}))·[R^□_r̄(τ, N)], where π_{τ,N} is any irreducible generic representation with rec(π_{τ,N}) of inertial type (τ, N) and JL^{−1}(π) = 0 unless π is essentially square-integrable, satisfy cyc_{D^×}(σ) = cyc(JL_K(σ)) for the Jacquet–Langlands transfer of types JL_K : R(𝒪_D^×) → R(GL_n(𝒪_K)) of Dotto's Definition 5.2. (2) (Theorem 6.3, with p ≠ 2) There is a unique map cyc‾_{D^×} : R_k(𝒪_D^×) → Z^{n²−1}(R^□_r̄/ϖ) with red ∘ cyc_{D^×} = cyc‾_{D^×} ∘ r_p; so representations σ, σ′ of 𝒪_D^× with the same reduction mod p give equal special-fibre cycles. (3) Consequently (Newton–Thorne, proof of Lemma 3.6), for a level-zero character σ_v of 𝒪_D^× of order p (inflated from χ_v ∘ N_{k_D/k′} with χ_v of order p) and the trivial character, cyc_{D^×}(σ_v^{−1}) = [R^□_r̄(τ_s)] and cyc_{D^×}(1) = [R^□_r̄(τ_{Sp_n})]; equal reductions give equal cycles, and since both rings are 𝒪-flat and equidimensional of dimension 1 + n², (R^□_r̄(τ_s)/ϖ)_red ≅ (R^□_r̄(τ_{Sp_n})/ϖ)_red.

*Hypotheses and conventions.*
- The types retain monodromy, following Shotton (R08.2/inertial-type-with-monodromy); Dotto's types are smooth, and the cycle maps sum over pairs (τ, N).
- Coefficient characteristic: the uniqueness in (2) rests on Shotton's Theorem 4.6, which assumes that the coefficient characteristic is odd (p ≠ 2 in this packet's notation). Dotto's Theorem 6.3 prints 'Assume p ≠ 2' in his notation, where p is the residue characteristic of the local field and ℓ that of the coefficients (source issue E5).
- Newton–Thorne cite the 2018 preprint ([Dot18, Theorem 6.1]); the statement used is Theorem 6.3 of the published version, the case ℓ ≠ p.
- The Jacquet–Langlands correspondence for D^×, its transfer of inertial classes, and the type theory behind JL_K (Bushnell–Kutzko types, Schneider–Zink's σ_𝔓, Bushnell–Henniart's description of level-zero transfers) are representation-theoretic inputs recorded as a gap; they are not rebuilt here.

*Proof outline.* (1): dim Hom_{𝒪_D^×}(σ, JL^{−1}(π_{τ,N})) = dim Hom_{GL_n(𝒪_K)}(JL_K(σ), π_{τ,N}) on K-types of D^× (Dotto, proof of Theorem 6.3, using Example 3.8: σ^+_{𝔓_min}(𝔰) detects exactly the essentially square-integrable members of 𝔰, with multiplicity one), and the K-types span R(𝒪_D^×) (Lemma 5.1). (2): Shotton's Theorem 4.6 gives cyc‾ with red ∘ cyc = cyc‾ ∘ r_p for GL_n; Dotto's Theorem 5.5 gives JL_p with r_p ∘ JL_K = JL_p ∘ r_p; put cyc‾_{D^×} = cyc‾ ∘ JL_p, unique because r_p is surjective on R(𝒪_D^×) (Lemma 5.4). (3): the trivial representation of D^× transfers to the Steinberg representation, and σ_v of order p transfers to the type τ_s (Bushnell–Henniart, level zero); σ_v and 1 have equal reductions, so the cycles of R^□_r̄(τ_s)/ϖ and R^□_r̄(τ_{Sp_n})/ϖ agree; both are equidimensional of dimension n² inside the equidimensional R^□_r̄/ϖ (R08.2/fixed-type-rings-rank-n), so their reduced subschemes coincide.

*Acceptance.* n = 1: D = K and the statement is the congruence of the fixed-type rings of characters congruent mod p (R08.2/ihara-avoidance-components (2) in rank one).

*Prerequisites.* `R08.2/inertial-type-with-monodromy`, `R08.2/fixed-type-rings-rank-n`, `R08.2/ihara-avoidance-components`.

*Sources.* James Newton (NT-2026), proof of Lemma 3.6, arXiv v2 pp. 18–19; Andrea Dotto (DOTTO-2025), §6, case ℓ ≠ p and Theorem 6.3, pp. 243–245 (journal pages); Jack Shotton (SHOTTON-2018), Theorem 4.6, arXiv v2 p. 16 (with the abstract).

#### `R08.2/regular-unipotent-minimally-ramified` — Unipotent lifts of a regular unipotent residual monodromy are minimally ramified (theorem)

Let K/ℚ_ℓ be finite (ℓ ≠ p), σ a topological generator of tame inertia, r̄ : G_K → GL_n(k) with r̄(σ) unipotent with a single Jordan block, and r a lift to A ∈ C_𝒪 with characteristic polynomial of r(σ) equal to (X − 1)^n. Then for every j ≤ n the natural map ker((r(σ) − 1)^j) ⊗_A k → ker((r̄(σ) − 1)^j) is an isomorphism. Hence the unipotent problem R^1 (char r(σ) = (X − 1)^n) equals the minimally ramified problem of R08.2/minimally-ramified-condition under this hypothesis on r̄.

*Hypotheses and conventions.*
- The appendix prints ⊗_R k for ⊗_A k (extraction issue E148).

*Proof outline.* Write T=r(σ)−1, so Tⁿ=0 by Cayley–Hamilton and its reduction is regular nilpotent. Choose a lift v of a residual cyclic vector. The Krylov matrix [v,Tv,…,T^{n−1}v] has unit determinant by reduction, hence is a basis over the local coefficient algebra. In this basis T is a single nilpotent Jordan block. Its kernels are free direct summands of the prescribed ranks and commute with base change. This proves minimality without applying simple-root Hensel to a multiple root.

*Acceptance.* n = 2: r̄(σ) = (1 1; 0 1); every lift with char (X − 1)² is conjugate to (1 a; 0 1) with a a unit, and ker(r(σ) − 1) is a free direct summand of rank 1.

*Prerequisites.* `R08.2/minimally-ramified-condition`, `R08.2/ihara-avoidance-components`.

*Sources.* Frank Calegari (CG-2020), Appendix §A.4(2)(a), published p. 888.

#### `R08.2/gsp4-ramification-types` — Ramification types U1–U3, P, H of GSp₄-valued residual representations (definition)

Let x ≠ p be a prime and r̄ : G_x → GSp₄(k) with similitude a power of the cyclotomic character. r̄ is of type: (U3) if r̄(I_x) is unipotent, conjugate to the group generated by exp(N₃), N₃ = E₁₂ + E₂₃ − E₃₄ (rank 3); (U2) if conjugate to ⟨exp(N₂)⟩, N₂ = E₁₂ − E₃₄ (rank 2); (U1) if conjugate to ⟨exp(N₁)⟩, N₁ = E₂₃ (rank 1); (P) if r̄|G_x is a sum of characters with r̄|I_x = diag(1, 1, χ_x, χ_x) for a nontrivial χ_x, with isotropic invariant and χ_x-planes, and x − 1 prime to p; (H) if r̄|I_x is absolutely irreducible and x⁴ − 1 is prime to p. A cyclotomic-power similitude excludes type P, the types U, P, H are mutually exclusive, and r̄ is of type U2 (resp. U3) iff r̄(I_x) is generated by exp(N) with N nilpotent of rank 2 (resp. 3).

*Hypotheses and conventions.*
- exp(N₃) requires p ≥ 5 (N₃³ ≠ 0, so exp needs N³/3! to be integral); the source issue E17 of the reviewed extraction records this.
- Matrices are in the basis where J is antidiagonal (1, 1, −1, −1).
- State rank-to-orbit identifications over a splitting coefficient field (or after algebraic closure). Over a finite field a square-zero rank-two symplectic nilpotent can have more than one rational orbit; rank alone does not select the displayed representative.

*Construction.* The types are read off from r̄|I_x: unipotent image gives U1–U3 by the rank of log of a generator (the nilpotent orbits of sp₄ of ranks 1, 2, 3); semisimple image gives P or H.

*API.*
- `TauCeti.GaloisDeformation.Local.GSp4RamType` (data): The types U1, U2, U3, P, H as a predicate on r̄ : G_x → GSp₄(k).
- `TauCeti.GaloisDeformation.Local.GSp4RamType.unipotent_rank` (characterisation): r̄ is of type U_i iff r̄(I_x) is generated by exp(N) with N ∈ sp₄ nilpotent of rank i.
- `TauCeti.GaloisDeformation.Local.GSp4RamType.exclusive` (other): The types U, P, H are mutually exclusive.
- `TauCeti.GaloisDeformation.Local.GSp4RamType.not_P` (other): A cyclotomic-power similitude excludes type P.
- `TauCeti.GaloisDeformation.Local.GSp4RamType.conjugate` (compatibility): Each ramification type is invariant under GSp₄(k)-conjugation of the residual representation. Its geometric orbit description is preserved by splitting coefficient-field extension, with the rational-orbit qualification already stated.

*Unit tests.*
- `gsp4Type_U1` (computation): r̄(σ) = exp(E₂₃) = 1 + E₂₃ has rank-one logarithm, so r̄ is U1.
- `gsp4Type_U3_needs_p5` (non-example): For p = 3, exp(N₃) = 1 + N₃ + N₃²/2 + N₃³/6 is not defined over k; type U3 is stated for p ≥ 5.
- `gsp4Type_unramified` (degenerate): Unramified r̄ is of no type.
- `gsp4Type_H` (computation): r̄|I_x absolutely irreducible with x ≡ 2 mod 5, p = 5: x⁴ − 1 ≡ 0 mod 5 is excluded from type H.

*Used by.* CG20 §4 — the local conditions at x ∈ S(r̄) in the minimal deformation problem; LocalGaloisDeformationRings:R08.2/regular-unipotent-minimally-ramified — type U3 is the regular unipotent case for GSp₄

*Acceptance.* r̄ unramified at x is of none of these types. r̄|I_x = ⟨exp(N₂)⟩ is U2, not U1, since rank N₂ = 2.

*Prerequisites.* `R08.1/g-valued-framed-ring`, `R08.2/tame-splitting`.

*Sources.* Frank Calegari (CG-2020), Assumption 4.3, published pp. 813–814; Frank Calegari (CG-2020), Remark 4.4, published p. 814.

#### `R08.2/gsp4-taylor-wiles-lifts` — GSp₄ lifts at Taylor–Wiles places (theorem)

Let v be a place with q_v ≡ 1 mod p, ρ̄ : G_{F_v} → GSp₄(k) unramified with multiplier ψ unramified, and ρ̄(Frob_v) with four distinct eigenvalues ᾱ₁, ᾱ₂, ᾱ₃ = ψ(Frob_v)/ᾱ₂, ᾱ₄ = ψ(Frob_v)/ᾱ₁. (1) Every lift ρ : G_{F_v} → GSp₄(A) with multiplier ψ is GSp₄(A)-conjugate to γ₁ ⊕ γ₂ ⊕ ψγ₂^{-1} ⊕ ψγ₁^{-1} for unique characters γ_i lifting the unramified γ̄_i with γ̄_i(Frob_v) = ᾱ_i. (2) With Δ_v = k(v)^×(p)², the characters γ_i∘Art_{F_v}|_{𝒪^×} give a local map 𝒪[Δ_v] → R^□_v, formally smooth of relative dimension 10, depending on the ordering of the eigenvalues.

*Hypotheses and conventions.*
- The conjugation in (1) is by GSp₄(A), not just by the congruence kernel: the root-coordinate argument removes only the off-torus part (BCGP25 Lemma 6.1.6).
- The integral inertia matrix is diagonal in the lifted Frobenius eigenspaces because the relevant eigenvalue ratios minus q are units; q≡1 mod p does not mean q=1 in 𝒪.

*Proof outline.* (1): as in Genestier–Tilouine Lemma 5.1.1: the four distinct eigenvalues of ρ(Frob_v) give an eigenbasis by Hensel; inertia commutes with Frobenius up to q_v ≡ 1, so acts diagonally; the symplectic form pairs the eigenlines 1 ↔ 4, 2 ↔ 3. (2): the γ_i restricted to inertia factor through k(v)^×(p) by local class field theory (Tau Ceti ClassFieldTheory Layer 7); the remaining 10 coordinates are the conjugation by GSp₄ modulo the torus and the unramified parts.

*Acceptance.* Relative dimension: dim ad⁰ = 10 = dim Sp₄ matches R08.1/g-valued-presentations (4) with the 𝒪[Δ_v]-structure.

*Prerequisites.* `R08.1/g-valued-framed-ring`, `R08.1/g-valued-presentations`, `R08.2/taylor-wiles-local-ring`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

*Sources.* George Boxer (BCGP-2021), Lemma 7.4.4, arXiv v3 p. 189.

#### `R08.2/gsp4-unipotent-local-models` — Local models for GSp₄ Ihara avoidance: nilpotent strata, 𝒩(q) and ℳ(x, y; q) (construction)

Let p ≥ 3 and q a positive integer prime to p. 𝒰 ⊂ GSp₄/𝒪 is the closed subscheme of matrices with characteristic polynomial (X − 1)⁴ and 𝒩 ⊂ Lie GSp₄ that of matrices with characteristic polynomial X⁴. The truncated maps exp₂(N) = I + N + N²/2 + N³/2 and log₂(U) = (U − I) − (U − I)²/2 are mutually inverse GSp₄-equivariant isomorphisms 𝒩 ≅ 𝒰, with exp₂(mN + m*N³) = exp₂(N)^m and log₂(U^m) = m log₂(U) + m* log₂(U)³, m* = (m − m³)/3. 𝒩_i ⊂ 𝒩 is the reduced locally closed stratum of nilpotents of rank i, with representatives N₀ = 0, N₁ = E₁₄, N₂ = E₁₃ + E₂₄, N₃ = E₁₂ + E₂₃ − E₃₄; the centraliser Z_{GSp₄}(N_i) is smooth over 𝒪 with fibres of dimensions 11, 7, 5, 3. 𝒩(q) is the scheme of pairs (Φ, N) with Φ ∈ GSp₄, N ∈ 𝒩 and ΦNΦ^{-1} = qN + q*N³, q*=(q−q³)/3∈ℤ, and ℳ(x, y; q) (x, y ∈ 𝒪^×) the scheme of pairs (Φ, Σ) ∈ GSp₄² with char Σ = (X − x)(X − y)(X − y^{-1})(X − x^{-1}) and ΦΣΦ^{-1} = Σ^q; (Φ, Σ) ↦ (Φ, log₂ Σ) is an isomorphism ℳ(1, 1; q) ≅ 𝒩(q).

*Hypotheses and conventions.*
- p ≥ 3 is needed for the denominators 1/2 in exp₂ and log₂ (they replace exp and log, which would need p ≥ 5).
- In Proposition 7.4.10 the sign of xδ is wrong and part (2) for i = 2 needs √−1; 𝒫 of §7.4.12 is the polynomial space, not 𝒫̃/W; Σ₀ = diag(x, y, y^{-1}, x^{-1}) in Proposition 7.4.18 (source issues recorded by the reviewed extraction PAPER-BOXER-CALEGARI-GEE-PILLONI-21).
- The nilpotent representatives describe geometric or split orbits; the source’s rank-two rational conjugacy statement needs the indicated coefficient enlargement.

*Construction.* exp₂ and log₂ are the truncations of exp and log valid on 4 × 4 symplectic nilpotents (N⁴ = 0) with the cubic correction making them inverse; equivariance is clear. Strata: nilpotent orbits of sp₄ are indexed by rank 0–3; centraliser dimensions from Proposition 7.4.10. ℳ(1, 1; q) ≅ 𝒩(q): (Φ, Σ) ↦ (Φ, log₂ Σ). If ΦΣΦ^{-1} = Σ^q then Φ(log₂ Σ)Φ^{-1} = log₂(Σ^q) = q log₂ Σ + q*(log₂ Σ)³ by the relation for log₂ of powers; conversely exp₂ inverts this on 𝒩(q) (BCGP21 §7.4.13, the analogue of Taylor II Lemma 3.2).

*API.*
- `TauCeti.GaloisDeformation.Local.GSp4.exp₂` (constructor): exp₂ : 𝒩 → 𝒰, N ↦ I + N + N²/2 + N³/2.
- `TauCeti.GaloisDeformation.Local.GSp4.log₂` (constructor): log₂ : 𝒰 → 𝒩, U ↦ (U − I) − (U − I)²/2.
- `TauCeti.GaloisDeformation.Local.GSp4.exp₂_log₂` (equivalence): exp₂ ∘ log₂ = id and log₂ ∘ exp₂ = id.
- `TauCeti.GaloisDeformation.Local.GSp4.exp₂_pow` (relation): exp₂(mN + m*N³) = exp₂(N)^m, m* = (m − m³)/3.
- `TauCeti.GaloisDeformation.Local.GSp4.nilpotentStratum` (data): 𝒩_i, the rank-i nilpotent stratum, with representative N_i.
- `TauCeti.GaloisDeformation.Local.GSp4.MSpace` (constructor): ℳ(x, y; q) ⊂ GSp₄², with ℳ(1, 1; q) ≅ 𝒩(q).
- `TauCeti.GaloisDeformation.Local.GSp4.exp₂_conjugate` (functoriality): For invertible g in GSp₄, exp₂(gNg⁻¹)=g exp₂(N)g⁻¹ and log₂(gUg⁻¹)=g log₂(U)g⁻¹. Both polynomial maps commute with coefficient maps in which 2 is invertible.

*Unit tests.*
- `exp2_N1` (computation): exp₂(E₁₄) = I + E₁₄ (E₁₄² = 0).
- `exp2_zero` (degenerate): exp₂(0) = I and log₂(I) = 0.
- `exp2_not_exp` (non-example): For p≥5 and N₃ with N₃³≠0, exp₂(N₃)≠exp(N₃)=I+N₃+N₃²/2+N₃³/6. At p=3 the usual exponential formula is undefined, whereas exp₂ is still a bijection 𝒩→𝒰.
- `mstar_integral` (computation): m* = (m − m³)/3 ∈ ℤ for all m ∈ ℤ, e.g. m = 2 gives m* = −2.
- `nilpotentModel_cubic_correction` (non-example): For q=2 one has q*=−2. In characteristic 3 the cubic coefficient is 1 and N₃³≠0, so the defining equation is ΦN₃Φ⁻¹=2N₃+N₃³, not merely 2N₃.

*Used by.* BCGP21 §§7.4.13–7.4.21 — completed local rings of ℳ(x, y; q_v) at (1, 1) are the Ihara-avoidance rings; LocalGaloisDeformationRings:R08.2/gsp4-ihara-avoidance-rings — the local models

*Acceptance.* The irreducible components of 𝒩(q) are indexed by the nilpotent strata closures meeting the q-eigencondition (Propositions 7.4.14–7.4.16).

*Prerequisites.* `R08.1/g-valued-framed-ring`, `R08.2/steinberg-condition`.

*Sources.* George Boxer (BCGP-2021), §7.4.9, arXiv v3 p. 190; George Boxer (BCGP-2021), Proposition 7.4.10, arXiv v3 p. 191; George Boxer (BCGP-2021), §7.4.13, Spaces of matrices.

#### `R08.2/gsp4-ihara-avoidance-rings` — GSp₄ Ihara-avoidance deformation rings (theorem)

Let v be finite with q_v ≡ 1 mod p, ρ̄ : G_{F_v} → GSp₄(k) trivial, ψ unramified with trivial reduction, and χ = (χ₁, χ₂) continuous characters 𝒪_{F_v}^× → 𝒪^× trivial mod λ. 𝒟_v^χ is the problem of lifts with multiplier ψ such that for σ ∈ I_{F_v}, char ρ(σ) = (X − χ₁(Art^{-1}σ))(X − χ₂(Art^{-1}σ))(X − χ₂(Art^{-1}σ)^{-1})(X − χ₁(Art^{-1}σ)^{-1}), represented by R_v^χ. (1) If χ₁, χ₂ ≠ 1 and χ₁ ≠ χ₂^{±1}, every closed point of Spec R_v^χ[1/p] is smooth and Spec R_v^χ is irreducible of dimension 11. (2) For χ₁ = χ₂ = 1, Spec R_v^1 is equidimensional of dimension 11 with characteristic-zero generic points, and every generic point of Spec R_v^1/λ specialises from a unique generic point of Spec R_v^1. (3) R̃_v^χ ≅ R_v^χ⟦T⟧ is the completed local ring of ℳ(x, y; q_v) at (1, 1), x = χ₁(Art^{-1}σ), y = χ₂(Art^{-1}σ), and R_v^χ/λ = R_v^1/λ.

*Hypotheses and conventions.*
- v∤p and p>2, as in BCGP §7.4; this is an away-from-p local problem.

*Proof outline.* (3): BCGP21 Propositions 7.4.20–7.4.21: twisting by unramified characters gives 𝒟_v^χ × 𝒟^1 ≅ 𝒟̃_v^χ, and a lift of the tame quotient is a pair (Φ, Σ) = (ρ(φ), ρ(σ)) in ℳ(x, y; q_v). (1)–(2): from the geometry of ℳ(x, y; q) and 𝒩(q) (R08.2/gsp4-unipotent-local-models; analogues of Taylor II Lemmas 3.2, 3.4) and the smoothness criterion of R08.1/smooth-points-generic-fibre (Hom(ρ_x, ρ_x(1)) = 0 since it respects the distinct σ-eigenspaces).

*Acceptance.* The GL_n analogue is R08.2/ihara-avoidance-components (Taylor II Proposition 3.1).

*Prerequisites.* `R08.2/gsp4-unipotent-local-models`, `R08.2/ihara-avoidance-components`, `R08.1/smooth-points-generic-fibre`, `R08.1/g-valued-framed-ring`.

*Sources.* George Boxer (BCGP-2021), Proposition 7.4.7, arXiv v3 p. 189; George Boxer (BCGP-2021), Proposition 7.4.21, arXiv v3 p. 197.

#### `R08.2/g-valued-generic-fibre-away-from-p` — Generic fibres of G-valued lifting rings away from p and minimally ramified lifts (theorem)

Let ℓ ≠ p, K/ℚ_ℓ finite (or a local field of characteristic ℓ), G a smooth affine group over 𝒪 with reductive G⁰, ρ̄ : G_K → G(k) and μ a fixed multiplier. (1) (Bellovin–Gee, Theorem 3.3.3) Spec R^{□,μ}_ρ̄[1/p] is equidimensional of dimension dim G^der, its components are covered by the closures of inertial-type loci, with possibly multiple components for one type up to G⁰-conjugacy, and it has an open dense regular subscheme; the Zariski closure of a component is a reduced 𝒪-flat quotient. (2) (Booher, Theorem 1.1, Corollary 6.16, Proposition 5.6) For G = GSp_{2n} with p > 2n (p ≠ 2), after enlarging 𝒪 so that the standing assumptions (A3)–(A4) hold (q a square, √−1 and √2 in 𝒪, a pure nilpotent lift with smooth centraliser) and the irreducible constituents of ρ̄ restricted to the prime-to-p inertia are absolutely irreducible: the minimally ramified lifts with fixed similitude character κ^{1−2n} form a liftable deformation condition with tangent space of dimension h⁰(G_K, ad⁰ρ̄); its framed ring is formally smooth over 𝒪 of relative dimension dim Lie G^der, so ρ̄ has a minimally ramified lift lying on an irreducible component of R^{□,κ^{1−2n}}_ρ̄ isomorphic to 𝒪′⟦X₁, …, X_{dim G^der}⟧. (3) At a trivial prime v₀, a lift whose Weil–Deligne representation is a twist of the Steinberg parameter is a formally smooth point of R^{□,κ^{1−2n}}_{ρ̄|G_{v₀}}.

*Hypotheses and conventions.*
- (1) in equal characteristic holds by the same argument, Grothendieck's monodromy theorem being available there (FKP §2).
- A dimension involving Lie(G_der) requires fixing the full quotient G/G_der; for GSp_{2n} this is the similitude character. Do not infer a bijection between types and components.
- Booher's paper treats G = GL_m, GSp_m and GO_m with p > m and p very good (p ≠ 2 for symplectic and orthogonal groups); its Remark 3.14 extends the definition, but not the smoothness, to other almost-reductive groups. The sources in scope use (2) only for GSp_{2n} (FKP §9), so no general reductive G is planned here. The dimension of the framed fixed-similitude ring is derived from Corollary 6.16 and Remark 2.2 (dim Z¹ − dim H¹ = dim 𝔤 − h⁰); Booher states it explicitly only in the tame case (Corollary 5.8).

*Proof outline.* (1): the Weil–Deligne dictionary over the generic fibre identifies Spec R^{□,μ}[1/p] with a moduli of (r, N), whose components are fixed by the inertial type (as in R08.2/fixed-type-rings-rank-n). (2): Booher's construction of minimally ramified G-valued deformation conditions (smooth of the expected dimension). (3): H² vanishes at Steinberg points (R08.1/smooth-points-generic-fibre, purity).

*Acceptance.* G = GL_n: (1) is R08.2/fixed-type-rings-rank-n (1) on the generic fibre.

*Prerequisites.* `R08.1/g-valued-framed-ring`, `R08.1/smooth-points-generic-fibre`, `R08.2/fixed-type-rings-rank-n`.

*Sources.* Najmuddin Fakhruddin (FKP-2022), §9, proof of Proposition 9.1, arXiv v5 p. 41; Najmuddin Fakhruddin (FKP-2022), §2, arXiv v5 p. 9; Jeremy Booher (BOOHER-2019), Theorem 1.1, p. 2; Corollary 6.16, p. 30 (arXiv v1).

#### `R08.2/equal-characteristic-local-lifts` — Local lifts at places of global function fields (theorem)

Let F be a global function field of characteristic ℓ ≠ p and v a place. For p ≫_n 0 every ρ̄ : G_{F_v} → GL_n(k) has a p-adic lift; any character G_{F_v} → 1 + ϖ𝒪 has an n-th root when p ∤ n, so the determinant (or multiplier) of the lift can be matched to a prescribed global character μ. The generic-fibre analysis of R08.2/g-valued-generic-fibre-away-from-p (1) holds for R^{□,μ}_ρ̄.

*Proof outline.* CHT §2.4.4 (R08.2/minimally-ramified-ring, R08.2/tame-splitting) uses only that the kernel of any surjection I_{F_v} → ℤ_p has pro-order prime to p and the structure of the maximal tame extension with p-power ramification index; both hold for F_v of characteristic ℓ ≠ p. So minimally ramified lifts exist (CHT Corollary 2.4.21). n-th roots of 1 + ϖ𝒪-valued characters exist for p ∤ n (the logarithm), which adjusts the determinant.

*Acceptance.* n = 1: a character with values in k^× lifts by Teichmüller.

*Prerequisites.* `R08.2/minimally-ramified-ring`, `R08.2/tame-splitting`, `R08.2/g-valued-generic-fibre-away-from-p`.

*Sources.* Najmuddin Fakhruddin (FKP-2022), §8, proof of Theorem 8.1, arXiv v5 p. 38.

#### `R08.2/reducible-lifts-prescribed-determinant` — Lifts away from p of reducible residual representations with prescribed determinant (theorem)

Let p ≥ 3, ρ̄ ∼ (χ̄ ∗; 0 1) a two-dimensional residual representation of G_{F,S} and μ = κ^{r−1}χ₀ a geometric lift of det ρ̄ (r ≥ 2, χ₀ of finite order). For v ∈ S not above p there is, after enlarging 𝒪, a lift ρ_v : G_{F_v} → GL₂(𝒪′) of ρ̄|G_{F_v} with determinant μ, lying on a formally smooth irreducible component of R^{□,μ}_{ρ̄|G_{F_v}}.

*Proof outline.* If #ρ̄(I_{F_v}) is prime to p, the lifts whose projectivisation factors through ker(ρ̄|I_{F_v}) form a formally smooth component (R08.2/minimally-ramified-ring). Otherwise ρ̄|G_{F_v} is a non-split extension of 1 by κ̄ (Diamond 1997 §2); Taylor 2003 §1 E3 gives a formally smooth component of R^{□,κψ²} for every lift ψ of the trivial character, and ψ is chosen with κψ² = μ (square roots exist for p ≠ 2).

*Acceptance.* ρ̄|G_{F_v} = (κ̄ ∗; 0 1) non-split: the lift (κψ ∗; 0 ψ) of Steinberg type exists for every ψ ≡ 1.

*Prerequisites.* `R08.2/minimally-ramified-ring`, `R08.2/steinberg-condition`, `R08.1/local-fixed-determinant`.

*Sources.* Najmuddin Fakhruddin (FKP-2022), Lemma 7.2, first bullet, arXiv v5 pp. 33–34.

#### `R08.2/ihara-avoidance-rings-p2` — Unipotent ramification and Ihara-avoidance rings at p = 2 (theorem)

Let p = 2, v ∤ 2 a finite place, ρ̄ : G_{F_v} → GL_n(k). (1) There is a finite extension F′_v/F_v such that every lift of ρ̄ becomes unipotently ramified on G_{F′_v}. (2) If ρ̄ is unramified with ρ̄(Frob_v) regular semisimple (q_v odd), every lift is strictly equivalent to a direct sum of characters, and becomes unramified over a uniform finite extension. (3) For ρ̄ trivial and finite-order characters χ_{v,j} : 𝒪_{F_v}^× → 𝒪^× trivial mod ϖ, let R_v^χ classify lifts with char ρ(σ)(X) = Π_j (X − χ_{v,j}(Art^{-1}σ)^{-1}) for σ ∈ I_{F_v}. If all χ_{v,j} = 1, every component of R_v^1 has dimension n² + 1, every prime minimal over ϖ contains a unique minimal prime, and generic points have characteristic zero; if the χ_{v,j} are pairwise distinct, Spec R_v^χ is irreducible of dimension n² + 1 with characteristic-zero generic point.

*Hypotheses and conventions.*
- (3) is Thorne 2012, Proposition 3.16, which extends Taylor's Proposition 3.1 (R08.2/ihara-avoidance-components) to p = 2.
- First choose a residual eigenbasis for the regular semisimple Frobenius matrix. Diagonalization by strict equivalence is relative to this basis; strict conjugation alone cannot change a nondiagonal residual matrix.

*Proof outline.* (1): R08.2/fixed-type-rings-rank-n (3). (2): Frobenius eigenvalues are distinct and q_v ≡ 1 mod 2, so inertia (pro-2 part) commutes with Frobenius; as in R08.2/gsp4-taylor-wiles-lifts (1). (3): Taylor's argument with the local models (Φ, Σ), valid for p = 2 by Thorne.

*Acceptance.* n = 1: R_v^1 = 𝒪⟦y⟧ and R_v^χ for χ ≠ 1 is 𝒪⟦y⟧ too; both irreducible of dimension 2 = n² + 1.

*Prerequisites.* `R08.2/fixed-type-rings-rank-n`, `R08.2/ihara-avoidance-components`, `R08.2/gsp4-taylor-wiles-lifts`.

*Sources.* George Boxer (BCGP-2025), Lemma 5.6.2, arXiv v1 p. 128; George Boxer (BCGP-2025), Proposition 5.6.4, arXiv v1 p. 129.

#### `R08.2/taylor-wiles-block-condition` — The Taylor–Wiles block condition in rank n (including p = 2) (construction)

Let v be a finite place (v ∤ p) with r̄|G_{F_v} unramified and r̄(Frob_v) semisimple; choose an eigenvalue α_v ∈ k of multiplicity n₁ and the decomposition r̄|G_{F_v} = Ā_v ⊕ B̄_v with Ā_v(Frob_v) = α_v·1_{n₁}. 𝒟^TW_v(R) consists of lifts r with a decomposition r = A_v ⊕ B_v lifting it, B_v unramified and A_v|I_{F_v} = ψ_v·1_{n₁} for a character ψ_v : I_{F_v} → R^×. With Δ_v the p-part of k(v)^× (the 2-part when p = 2), ψ_v∘Art_{F_v} gives a canonical homomorphism Δ_v → R^×, making the lifting ring an 𝒪[Δ_v]-algebra. 𝒟^TW_v depends on α_v.

*Hypotheses and conventions.*
- The condition is a local deformation problem (Thorne 2012, Lemma 4.2); for n₁ = 1 and n = 2 it recovers R08.2/taylor-wiles-local-ring, and for r̄ = s̄_v ⊕ ψ̄_v with ψ̄_v one-dimensional its tangent space is that of R08.2/taylor-wiles-local-tangent.
- The block condition has variable determinant. For comparison with R08.2/taylor-wiles-local-ring, impose the same compatible unramified determinant and assume q_v≡1 mod p and distinct residual eigenvalues. Scalar inertia on A_v is part of the condition, not a consequence of the tame relation.

*Construction.* Hensel separates the selected Frobenius eigenblock from the other eigenvalues, giving its canonical decomposition. Impose scalar inertia on the A_v-block and trivial inertia on B_v. The tame relation then forces ψ_v to factor through the p-part Δ_v of the local residue units, identified by the normalized Artin map. The relation alone does not force a general repeated-eigenvalue block to have scalar inertia.

*API.*
- `TauCeti.GaloisDeformation.Local.TaylorWilesBlock` (data): 𝒟^TW_v for a chosen eigenvalue α_v of multiplicity n₁.
- `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.decomposition` (constructor): The lifted decomposition r = A_v ⊕ B_v.
- `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.deltaAlgebra` (constructor): The canonical map 𝒪[Δ_v] → R^TW_v from ψ_v∘Art_{F_v}.
- `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.isLocalDeformationProblem` (instance): 𝒟^TW_v is a local deformation problem.
- `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.rank2` (compatibility): For n=2,n₁=1, distinct eigenvalues and q_v≡1 mod p, impose the compatible unramified determinant to recover R08.2/taylor-wiles-local-ring.
- `TauCeti.GaloisDeformation.Local.TaylorWilesBlock.decomposition_unique` (characterisation): The selected Frobenius block is the image of the idempotent obtained by Hensel separation of its residual eigenvalue from the complementary eigenvalues. This projector, its A_v⊕B_v decomposition and the imposed scalar inertia character commute with allowed coefficient maps.

*Unit tests.*
- `twBlock_rank2` (compatibility): For n=2,n₁=1 and distinct eigenvalues, the variable-determinant block ring is 𝒪[Δ_v][[x,y,B,C]]. After imposing the compatible unramified determinant it is 𝒪[Δ_v][[x,y,B]], as in R08.2/taylor-wiles-local-ring.
- `twBlock_full_block` (degenerate): n₁ = n: lifts are ψ_v·(unramified) on inertia, the ring is formally smooth over 𝒪[Δ_v].
- `twBlock_p2_delta` (computation): p = 2: Δ_v = k(v)^×(2), the 2-part, e.g. q_v = 17 gives Δ_v ≅ ℤ/16.
- `twBlock_needs_semisimple` (non-example): A nonscalar residual Jordan block does not satisfy the semisimple-block hypothesis. The source condition does not impose A_v(Frob_v)=α_v I on lifts, so it does not force emptiness merely because a generalized eigenblock is nonsemisimple.

*Used by.* BCGP25 §5.5 — Taylor–Wiles data for the 2-adic patching; Thorne 2017 §§2.3.2, 2.4 — the general definition; GlobalGaloisDeformations:G7 — augmented deformation problems

*Acceptance.* n₁ = n: every lift is unramified up to a scalar character on inertia.

*Prerequisites.* `R08.2/tame-splitting`, `R08.2/taylor-wiles-local-ring`, `R08.2/taylor-wiles-local-tangent`, `GlobalGaloisDeformations:R04.3/local-deformation-problem`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

*Sources.* George Boxer (BCGP-2025), §5.5, arXiv v1 p. 124.

#### `R08.2/gsp4-minimal-conditions` — Minimal GSp₄ conditions at the ramified primes of types U, P, H (construction)

Let r̄ : G_ℚ → GSp₄(k) with similitude ε̄^{−(a−1)} and x ∈ S(r̄) of one of the types of R08.2/gsp4-ramification-types. A lift r of r̄|G_x with similitude ε^{−(a−1)} is minimal at x if: (U1–U3) r|I_x has unipotent image, topologically generated by exp(N) with N conjugate over the coefficient algebra (after the specified splitting extension) to the chosen residual orbit representative N₁, N₂ or N₃ respectively, up to the compatible unit rescaling; (P) r(I_x) ≅ r̄(I_x) (reduction is injective on the image of inertia); (H) likewise r(I_x) ≅ r̄(I_x). Minimal lifts at x form a local deformation problem; at a prime x of type U3 it coincides with the unipotent problem R^1 and with the minimally ramified condition (R08.2/regular-unipotent-minimally-ramified).

*Hypotheses and conventions.*
- exp(N) for N of rank 3 needs p ≥ 5 (extraction issue E17); for types U1, U2 the truncated exponential suffices for p ≥ 3.

*Construction.* Types P, H: #r̄(I_x) is prime to p (x − 1 resp. x⁴ − 1 prime to p), so the condition is the inertia-rigid condition of a lift of r̄|I_x of the same image (R08.2/minimally-ramified-ring in GSp₄ form). For types U impose the nilpotent orbit lifting condition with all kernel/image ranks fixed. Conjugation and exp/log preserve it; the smooth centralizer controls liftability. Generic rank of N alone is not a coefficient-ring definition.

*API.*
- `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt` (data): The minimal condition at x ∈ S(r̄) according to its type.
- `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.unipotent_rank` (characterisation): At U_i the logarithm lifts the specified nilpotent orbit over the Artinian coefficient ring; require conjugacy to the chosen representative or equivalent free kernel/image conditions for every power, not just generic matrix rank.
- `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.rigid` (characterisation): At types P, H the reduction map is injective on r(I_x).
- `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.isLocalDeformationProblem` (instance): Each condition is a local deformation problem.
- `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.U3_eq_unipotent` (compatibility): At type U3 the condition equals the unipotent problem R^1 and the minimally ramified condition.
- `TauCeti.GaloisDeformation.Local.GSp4.MinimalAt.baseChange` (functoriality): The split nilpotent-orbit lifting condition at U_i is preserved under Artinian coefficient maps by applying the map to its conjugating element and unit parameter. The P/H condition uses the fixed prime-to-p inertia lift and is preserved under the same maps.

*Unit tests.*
- `gsp4Minimal_U3` (compatibility): Type U3: the minimal condition equals R^1 (single Jordan block, R08.2/regular-unipotent-minimally-ramified).
- `gsp4Minimal_H_rigid` (computation): Type H with x⁴ − 1 prime to p: r(I_x) ≅ r̄(I_x), a finite group of order prime to p, so the condition is formally smooth.
- `gsp4Minimal_rank_jump` (non-example): Over an Artinian coefficient algebra, a nilpotent lifting N₁ whose square is a nonzero nilpotent matrix cannot be conjugate to N₁ (which squares to zero). It fails the U1 orbit condition even if its reduction has rank 1; a generic-rank label alone would miss this.
- `gsp4Minimal_unramified` (degenerate): At primes outside S(r̄) ∪ {p} the minimal condition is 'unramified'.

*Used by.* CG20 §4, Definition 4.6 — the minimal deformation problem R_Q of the non-regular GSp₄ modularity lifting theorem; GSp4NonregularModularityLifting — consumer of the minimal local conditions

*Acceptance.* Type U1: up to conjugation r(σ) = exp(tN₁) with t ∈ R^× lifting the residual parameter, and r(Frob_x) satisfies r(Frob_x)N₁r(Frob_x)^{-1} = xN₁ (the monodromy relation).

*Prerequisites.* `R08.2/gsp4-ramification-types`, `R08.2/gsp4-unipotent-local-models`, `R08.2/regular-unipotent-minimally-ramified`, `R08.2/minimally-ramified-ring`, `R08.1/g-valued-framed-ring`.

*Sources.* Frank Calegari (CG-2020), Definition 4.6 (3)–(4), published p. 815.

#### `R08.2/rigid-residual-conditions` — Rigidity of a residual representation for (Σ_min, Σ_lr) (definition)

Let F/F⁺ be a CM extension, N ≥ 2, ℓ = p ≥ N, and r̄ : Γ_{F⁺} → 𝒢_N(k) with similitude η^N_{F/F⁺}ε^{1−N}, r̄^♮ its restriction to Γ_F composed with the projection to GL_N. For disjoint finite sets Σ_min, Σ_lr of places of F⁺ not above p, r̄ is rigid for (Σ_min, Σ_lr) if: (1) for v ∈ Σ_min every lift of r̄_v is minimally ramified (R08.2/minimally-ramified-condition); (2) for v ∈ Σ_lr (inert in F, w the place above v) the generalised eigenvalues of r̄^♮_v(φ_w) contain the pair {‖v‖^{−N}, ‖v‖^{−N+2}} exactly once (the residual hypothesis of R08.2/level-raising-local-problems); (3) for v | p, r̄^♮_v is regular Fontaine–Laffaille crystalline (L7/fontaine-laffaille-deformation-condition); (4) r̄_v is unramified at every other finite place. All liftings are taken with the fixed similitude character.

*Hypotheses and conventions.*
- Condition (2) is purely residual; rigidity does not fix a component of the local rings (the extraction's earlier paraphrase 'rigidity fixes the specified local lifting components' was inexact).
- The global object r̄ and the global problems 𝒮^mix, 𝒮^unr, 𝒮^ram belong to the polarized automorphy lifting Part II; this node records only the local conditions.
- The polarized rigid datum has mutually disjoint Σ_min⁺, Σ_lr⁺ and Σ_p⁺; every level-raising place is inert in F/F⁺ and p∤((Nv)²−1), as in the standing assumptions immediately before Definition 3.6.1.

*Construction.* Each clause is a local condition at one place, stated with the local nodes cited; (1) holds, for instance, when every lift lies on the smooth minimally ramified component (R08.2/unrestricted-ring-complete-intersection (3)).

*API.*
- `TauCeti.GaloisDeformation.Local.IsRigidFor` (data): The predicate on r̄ given by the local conditions (1)–(4) at Σ_min, Σ_lr, the places above p and the rest.
- `TauCeti.GaloisDeformation.Local.IsRigidFor.minimal` (projection): For v ∈ Σ_min every lift of r̄_v is minimally ramified.
- `TauCeti.GaloisDeformation.Local.IsRigidFor.levelRaising` (projection): For v ∈ Σ_lr the residual hypothesis of R08.2/level-raising-local-problems holds.
- `TauCeti.GaloisDeformation.Local.IsRigidFor.mono` (other): Rigid for (Σ_min, Σ_lr) and 𝔭 satisfying (2) ⟹ rigid for (Σ_min, Σ_lr ∪ {𝔭}). Require every added place to be outside the previous minimal, level-raising and p-adic sets and to satisfy the inert-place and q²−1 side conditions.

*Unit tests.*
- `rigid_empty` (degenerate): Σ_min = Σ_lr = ∅: rigidity says r̄ is unramified away from p and regular Fontaine–Laffaille at p.
- `rigid_eigenvalue_pair_twice` (non-example): If r̄^♮_v(φ_w) has the pair {‖v‖^{−N}, ‖v‖^{−N+2}} twice, condition (2) fails and 𝒟^mix is not defined at v.
- `rigid_add_place` (characterisation): Adding to Σ_lr a place satisfying (2) preserves rigidity (used with 𝔭 in LTXZZ §6.4).
- `rigid_minimal_unramified` (computation): An unramified r̄_v with every lift unramified satisfies (1).

*Used by.* LTXZZ 2022, §§6.3–6.4 — the rigidity hypothesis of the level-raising R = T argument; LocalGaloisDeformationRings:R08.2/level-raising-local-problems — the local problems at Σ_lr

*Acceptance.* If r̄_v is unramified with #r̄(I_v) = 1 and p ∤ ‖v‖^i − 1 for small i, every lift is unramified hence minimally ramified, so v may be put in Σ_min.

*Prerequisites.* `R08.2/minimally-ramified-condition`, `R08.2/level-raising-local-problems`, `R08.2/unrestricted-ring-complete-intersection`, `L7/fontaine-laffaille-deformation-condition`.

*Sources.* Yifeng Liu (LTXZZ-2022), the rigidity definition (published Definition 6.3.3, p. 277; arXiv v3 Definition 6.3.4).

*Coverage of R08.2:* planned. Remaining: Lemma-level refinement: BCGP21 Propositions 7.4.14–7.4.18 (components of 𝒩(q) and ℳ(x, y; q)) as separate nodes. Gap recorded: the Jacquet–Langlands transfer of types for D^× behind R08.2/dotto-division-algebra-cycles; no roadmap owns local Jacquet–Langlands for GL_n.

### Layer R08.3: Potentially semistable deformation spaces

R08.3 owns Kisin's potentially semistable deformation rings in every rank n and for every finite K/ℚ_p (red-team finding RT-AREA-langlands-2/18). Hodge types and Galois types are fixed first; Kisin's theorems (2.5.5), (2.7.6) and (2.7.7) are stated in families over an arbitrary complete local Noetherian base A° (exported to AutomorphicGaloisRepresentations R19.5, finding /14), then specialised to the framed ring, where the integral ring is the reduced p-torsion-free closure; the generic fibre has Kisin's dimension n² + [K:ℚ_p]·dim of the Hodge flag variety, is smooth on a dense open, and is smooth everywhere for potentially crystalline rings. Nonemptiness is never assumed: the ω example shows a ring can be zero. The layer adds the G-valued rings of Balaji and Bellovin–Gee, the fixed-determinant power-series decomposition (Emerton–Gee, Caraiani–Newton), Breuil–Conrad–Diamond–Taylor's type rings (whose Conjecture 1.1.1 follows), and the rings R_{B,M} of fixed Weil–Deligne type cut out of pseudo-character rings (Colmez–Dospinescu–Nizioł), whose structure theorem is requested from PadicLocalLanglandsForGL2Qp R30.5.

*Planets:* Hodge and Galois types; Potentially semistable deformation rings; Kisin's dimension formula; Potentially crystalline rings; Potentially semistable loci in families.

#### `R08.3/hodge-and-galois-types` — p-adic Hodge types and Galois types (definition)

Let E/ℚ_p be finite. A p-adic Hodge type v = (D_E, Fil^i D_{E,K}, 0 ≤ i ≤ h) is a finite-dimensional E-vector space D_E with a filtration of D_{E,K} = D_E ⊗_{ℚ_p} K by E ⊗ K-submodules whose graded pieces lie in degrees [0, h]. For a finite E-algebra B, a de Rham B-representation V_B of G_K is of p-adic Hodge type v if its Hodge–Tate weights lie in [0, h] and gr^i Hom_{B[G_K]}(V_B, B_dR ⊗ B) ≅ gr^i D_{E,K} ⊗_E B for all i. A Galois type is τ : I_K → GL_r(E) with open kernel; a potentially semistable V_B is of type τ if tr(γ | D*_pst(V_B)) = tr τ(γ) for all γ ∈ I_K. The number that enters dimension formulas is dim_E ad D_{E,K}/Fil⁰ad D_{E,K} = Σ_{σ : K → Ē} (d² − Σ_j m_{σ,j}²)/2, with m_{σ,j} the multiplicities of the jumps of the σ-component.

*Hypotheses and conventions.*
- Kisin's functors are contravariant (Hom(V_B, B_•)). With PadicHodgeTheory R06.2's convention HT(χ_p) = +1, 'Hodge–Tate weights in [0, h]' reads the same, and Barsotti–Tate means weights {0, 1}.
- D*_pst and its inertia action are PadicHodgeTheory R06.3/potentially-semistable-dieudonne-module; the Galois type is the inertial part of WD(V) (R06.3/weil-deligne-parameter).

*Construction.* The formula for dim ad D/Fil⁰ad D: after ⊗_{ℚ_p}Ē, each embedding σ gives a filtered d-dimensional space with jump multiplicities m_{σ,j}, and ad/Fil⁰ad is the tangent space of the partial flag variety, of dimension (d² − Σ_j m_{σ,j}²)/2.

*API.*
- `TauCeti.GaloisDeformation.Local.HodgeType` (structure): (D_E, Fil^• D_{E,K}) with jumps in [0, h].
- `TauCeti.GaloisDeformation.Local.GaloisType` (structure): τ : I_K → GL_r(E) with open kernel.
- `TauCeti.GaloisDeformation.Local.IsOfType` (constructor): V_B is potentially semistable of type (τ, v).
- `TauCeti.GaloisDeformation.Local.HodgeType.adQuotDim` (characterisation): dim_E ad D_{E,K}/Fil⁰ = Σ_σ (d² − Σ_j m_{σ,j}²)/2.
- `TauCeti.GaloisDeformation.Local.HodgeType.filteredIsom_iff` (characterisation): Over a splitting coefficient field, two filtered K⊗E-modules of the given rank are filtered-isomorphic iff their graded multiplicities agree at every embedding and jump. This concerns filtered isomorphism classes, not equality of raw filtration subspaces.
- `TauCeti.GaloisDeformation.Local.GaloisType.conjugacy` (compatibility): A change of basis conjugates the finite inertia representation and gives an isomorphic Galois type; isomorphism classes and the type condition are independent of the chosen matrix representative.

*Unit tests.*
- `adQuotDim_regular` (computation): Regular weights give [K : ℚ_p]·d(d − 1)/2 (for d = 2, K = ℚ_p: 1).
- `adQuotDim_formula` (characterisation): (d² − Σ m_j²)/2 counts pairs of weights in different jumps; checked for d = 3 with multiplicities (2, 1): (9 − 5)/2 = 2.
- `galoisType_open_kernel` (non-example): The restriction to I_K of the cyclotomic character has infinite image, so it is not a Galois type.

*Used by.* LocalGaloisDeformationRings:R08.3/pst-deformation-ring — the conditions cut out.; LocalGaloisDeformationRings:R08.3/pst-generic-fibre — the dimension formula.; LocalGaloisDeformationRings:R08.6 — the types of KW I Theorem 5.1 and of R24's lifts.

*Acceptance.* Regular weights (all multiplicities 1): dim ad D/Fil⁰ = [K : ℚ_p]·d(d − 1)/2. d = 2, K = ℚ_p, weights {0, 1}: dim ad D/Fil⁰ = 1. Parallel weights (one jump of multiplicity d): dim ad D/Fil⁰ = 0.

*Prerequisites.* `PadicHodgeTheory:R06.2/hodge-tate-weight-convention`, `PadicHodgeTheory:R06.3/potentially-semistable-dieudonne-module`, `PadicHodgeTheory:R06.3/weil-deligne-parameter`, `PadicHodgeTheory:R06.2/filtered-vector-spaces`.

*Sources.* Mark Kisin (KISIN-PST-2008), (2.6), p. 531; Mark Kisin (KISIN-PST-2008), (2.7), pp. 532–533.

#### `R08.3/semistable-height-quotient` — The semistable quotient with Hodge–Tate weights in [0, h] (theorem)

Let A° be a complete local Noetherian W(𝔽)-algebra, A = A°[1/p], V_{A°} finite free of rank r with continuous G_K-action, and h ≥ 0. There is a quotient A_{st,h} of A such that a map ζ : A → B to a finite ℚ_p-algebra factors through A_{st,h} if and only if V_B = V_A ⊗ B is semistable with Hodge–Tate weights in [0, h]. It carries a projective W_{A_{st,h}}-module D of rank r with semilinear φ and linear N, and for such ζ, D ⊗ B ≅ Hom_{B[G_K]}(V_B, B⁺_st ⊗ B) compatibly with φ and N.

*Hypotheses and conventions.*
- Semistable with weights in [0, h] implies E-height ≤ h (Kisin 2006, 1.2.2 and 2.1.5; requested from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4), so one may first pass to A°^{≤h} (L7/height-lattice-moduli).
- B_st with coefficients and D_st are PadicHodgeTheory R06.1–R06.2 (semistable-period-ring, dst-exact-tensor-fully-faithful).

*Proof outline.* Replace A° by A°^{≤h} and take D_A = 𝔐/u𝔐 from L7/height-lattice-moduli (4). Proposition 2.4.7: the maps N : D_B → D_B with pφN = Nφ for which D_B ⊗ B⁺_cris → Hom(V_B, B⁺_st) is G_K-compatible are represented by a quotient A_st; Spec A_st → Spec A is a proper monomorphism, hence closed. Proposition 2.5.4: ζ factors through A_st exactly when V_B is semistable; the Hodge–Tate bound follows from the uniqueness of lattices of height ≤ h (Theorem 2.5.5).

*Acceptance.* h = 0: all Hodge–Tate weights 0 forces slope 0 and N = 0 by weak admissibility, so A_{st,0} is the unramified locus. The quotient is of A = A°[1/p]; nothing is claimed about an integral model at this step. Rank one, K = ℚ_p: A_{st,h} cuts out the characters χ_p^i·(unramified) with 0 ≤ i ≤ h, since semistable characters of G_{ℚ_p} are crystalline.

*Prerequisites.* `L7/height-lattice-moduli`, `L7/finite-height-lattices`, `PadicHodgeTheory:R06.1/semistable-period-ring`, `PadicHodgeTheory:R06.2/dst-exact-tensor-fully-faithful`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

*Sources.* Mark Kisin (KISIN-PST-2008), Theorem (2.5.5) and its proof, pp. 530–531; Propositions (2.4.7), (2.5.4).

#### `R08.3/hodge-type-components` — Fixing the p-adic Hodge type selects components (lemma)

Fix a p-adic Hodge type v over E and suppose A is an E-algebra. There is a quotient A_{st,v} of A_{st,h}, corresponding to a union of connected components of Spec A_{st,h}, such that ζ : A → B (B a finite E-algebra) factors through A_{st,v} exactly when V_B is semistable of p-adic Hodge type v.

*Hypotheses and conventions.*
- The filtration on D_B ⊗_{K_0} K is read off from 𝔐: Fil^i φ*(𝔐) = (1 ⊗ φ)^{−1}(E(u)^i𝔐), whose graded pieces are finite projective over K_A = W_A ⊗_{K_0} K (Lemma 2.6.1).

*Proof outline.* Projective graded pieces have locally constant rank, so the locus where gr^i ≅ gr^i D_{E,K} ⊗ A_𝔭 for all i is open and closed. At a point, the filtration from 𝔐 agrees with the one from the weakly admissible module of V_B (Kisin 2006, 1.2.8, and uniqueness of lattices), so the locus is the Hodge-type-v locus.

*Acceptance.* Different v with the same Hodge–Tate weights give disjoint unions of components. d = 1: v fixes the single Hodge–Tate weight, and A_{st,v} is the locus of χ_p^i·(unramified) for that i.

*Prerequisites.* `R08.3/semistable-height-quotient`, `R08.3/hodge-and-galois-types`.

*Sources.* Mark Kisin (KISIN-PST-2008), Corollary (2.6.2) and Lemma (2.6.1), pp. 531–532.

#### `R08.3/pst-deformation-ring` — Potentially semistable deformation rings of fixed type (theorem)

Let V_𝔽 be a d-dimensional 𝔽-representation of G_K (K/ℚ_p finite, any d ≥ 1), R^□ = R^□_{V_𝔽} its framed deformation ring over 𝒪_E (R08.1/local-lifting-ring), and (τ, v) a Galois type and a p-adic Hodge type (R08.3/hodge-and-galois-types). (1) There is a quotient (R^□[1/p])^{τ,v} of R^□[1/p] such that a map to a finite E-algebra B factors through it exactly when V_B is potentially semistable of Galois type τ and p-adic Hodge type v (Kisin, Theorem 2.7.6). (2) The locus (R^□[1/p])^{τ,v}_cr where V_B is potentially crystalline is its closed subscheme N = 0 (Corollary 2.7.7). (3) R^{□,τ,v} denotes the reduced, p-torsion-free quotient of R^□ with R^{□,τ,v}[1/p] = ((R^□[1/p])^{τ,v})_red; its ℚ̄_p-points are exactly the lifts that are potentially semistable of type (τ, v), and it is 0 when there are none. (4) Fix a finite Galois L/K with I_L ⊆ ker τ and h with the weights of v in [0, h]. In the quotient of R^□[1/p] classifying lifts semistable over L with Hodge–Tate weights in [0, h] (R08.3/semistable-height-quotient applied over L), the Hodge type and the inertial type are locally constant, so (R^□[1/p])^{τ,v} is a union of connected components of that bounded semistable quotient. It is not asserted to be a union of components of the unrestricted R^□[1/p]. The same holds for the unframed ring R_{V_𝔽} when End_{𝔽[G_K]}V_𝔽 = 𝔽, and with fixed determinant (R08.3/fixed-determinant-pst-rings).

*Hypotheses and conventions.*
- The characterisation in (1) is on points with values in all finite E-algebras B, not only fields, so it determines the closed subscheme.
- (3) is the reduced closure used by Gee (Theorem 3.28 in the crystalline case) and by subsequent work. Reducedness of (R^□[1/p])^{τ,v} itself is not asserted by Kisin, so the integral ring is defined through the reduced subscheme.
- Nonemptiness is not automatic: R^{□,τ,v} can be 0.

*Proof outline.* Choose L/K finite Galois with I_L ⊆ ker τ. R08.3/hodge-type-components over L gives A_{st,v} inside the bounded semistable quotient A_{st,h}, and Kisin Proposition 2.7.2 gives D_A ≅ Hom_{A[G_L]}(V_A, B⁺_{st,A}), a finite free W_{L,A}-module with a semilinear Gal(L/K)-action. For σ ∈ I_{L/K}, tr(σ | D_A) lies in (W_{L,A})^{φ=1} = A and is locally constant on Spec A, since in characteristic zero the finite inertia action splits into isotypic summands; take the components where tr(σ) = tr τ(σ) for all σ (Theorem 2.7.6). This gives (1) and (4). Potentially crystalline: impose N = 0 on D (Corollary 2.7.7), giving (2). (3): take the scheme-theoretic closure in Spec R^□ of the reduced subscheme ((R^□[1/p])^{τ,v})_red; the ℚ̄_p-points of a p-torsion-free reduced quotient are determined by its generic fibre.

*Acceptance.* Empty for p > 2: d = 1, K = ℚ_p, V_𝔽 = ω (the mod p cyclotomic character), τ trivial and Hodge–Tate weight 0. Such lifts would be crystalline characters of weight 0, hence unramified, and cannot reduce to the ramified ω; so R^{□,τ,v} = 0. d = 1, V_𝔽 trivial, τ trivial, weight 0: R^{□,τ,v} is the unramified quotient 𝒪_E⟦x⟧ (Frob ↦ 1 + x), of generic dimension 1 = d² + 0. Check the component statement (4) in a common semistable-over-L quotient: changing τ or v does not assert a component decomposition of the unrestricted generic fibre R^□[1/p], which also contains points that are not potentially semistable.

*Prerequisites.* `R08.3/hodge-type-components`, `R08.3/hodge-and-galois-types`, `R08.1/local-lifting-ring`, `R08.1/local-forget-framing`, `R08.1/local-fixed-determinant`, `PadicHodgeTheory:R06.3/potentially-semistable-dieudonne-module`.

*Sources.* Mark Kisin (KISIN-PST-2008), Theorem (2.7.6) and its proof, p. 534; Mark Kisin (KISIN-PST-2008), Corollary (2.7.7), p. 534; Toby Gee (GEE-MLT-2022), Theorem 3.28, pp. 18–19.

#### `R08.3/filtered-phi-N-deformations` — Deformation theory of filtered (φ, N)-modules with descent data (lemma)

For L/K finite Galois and d ≥ 1, let Mod_{φ,N}(A) (A a ℚ_p-algebra) be the groupoid of finite projective L_0 ⊗ A-modules D_A of rank d, locally free, with semilinear Gal(L/K)-action, nilpotent N and semilinear bijective φ with pφN = Nφ; Mod_{F,φ,N} adds a Gal(L/K)-stable filtration of D_{A,L} by projective submodules. Let C•(D) be the total complex of (ad D)^{G_{L/K}} with the maps 1 − φ, N and pφ − 1, and H•(D) its cohomology. For a small extension A → A/I of local ℚ_p-algebras: if H²(D_{A/𝔪}) = 0 a lift exists; lifts form a torsor under H¹ ⊗ I (with H¹_F, involving ad D_L/Fil⁰ad D_L, in the filtered case); forgetting the filtration is formally smooth. For D_A over Noetherian A with A → Mod_{φ,N} formally smooth, the complement of the support of H²(D_A) is dense and formally smooth over ℚ_p. For the potentially semistable quotients, the completion at each maximal ideal maps formally smoothly to Mod_{F,φ,N} (Proposition 3.3.1).

*Hypotheses and conventions.*
- Filtered (φ, N, Gal(L/K))-modules and weak admissibility are PadicHodgeTheory R06.2 (filtered-phi-n-modules-with-descent-data, weak-admissibility); weakly admissible modules over Artinian thickenings are admissible as successive extensions (Colmez–Fontaine, R06.2/colmez-fontaine-theorem).
- R06.2/colmez-fontaine-theorem defines ColmezFontainePst; it does not prove it. The R06.3 proof is requested, as proposed in the supplier packet. This is an open prerequisite, not an existing theorem node.

*Proof outline.* Obstruction and torsor: lift the underlying module, compare two lifts of φ and N by an element of (ad D)^{G_{L/K}} ⊗ I; the class in H² is the obstruction, and lifts differ by H¹ (Proposition 3.1.2, after Fontaine–Perrin-Riou and Emerton–Kisin). Filtrations lift freely because Grassmannians are smooth; the extra term in H¹_F is ad D_L/Fil⁰ad D_L (Lemma 3.2.1). Density of the H² = 0 locus is checked on the versal family B_{φ,N} over X_{φ,N} (Lemma 3.1.5, Proposition 3.1.6). Proposition 3.3.1: lift points of Â^{τ,v}_𝔪 step by step, using that weakly admissible = admissible along Artinian thickenings and the formal smoothness of the framed lifting ring (Kisin's Moduli paper, 2.3.2–2.3.3). Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* Rank one, L = K, N = 0: ad D = E with φ = 1 and N = 0, so C• is E → E ⊕ E → E with maps 0 and (a, b) ↦ ±(p − 1)b; H⁰ = E, H¹ = E (deforming the Frobenius eigenvalue) and H² = 0. H² can be nonzero: for rank 2, L = K = ℚ_p, φ = diag(1, p) and N = 0, pφ − 1 vanishes on E·E_{12}, so H² ⊇ E·E_{12}. Turning on N with Ne₂ = e₁ kills it, since [N, E_{22}] = E_{12}. Kisin proves smoothness only where H² = 0. Crystalline case N = 0: the complex is ad D → ad D (1 − φ), with no degree-2 term, so Mod_φ is formally smooth (proof of Theorem 3.3.8).

*Prerequisites.* `PadicHodgeTheory:R06.2/filtered-phi-n-modules-with-descent-data`, `PadicHodgeTheory:R06.2/weak-admissibility`, `PadicHodgeTheory:R06.3`, `R08.3/pst-deformation-ring`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Mark Kisin (KISIN-PST-2008), (3.1.1), Proposition (3.1.2), Corollary (3.1.3), Lemma (3.1.5), Proposition (3.1.6), pp. 535–538; Mark Kisin (KISIN-PST-2008), Lemma (3.2.1), Proposition (3.3.1), pp. 538–540.

#### `R08.3/pst-generic-fibre` — Dimension and generic smoothness of potentially semistable rings (theorem)

Spec (R^□_{V_𝔽}[1/p])^{τ,v} is equidimensional of dimension d² + dim_E ad D_{E,K}/Fil⁰ad D_{E,K} and has a formally smooth dense open subscheme. If End_{𝔽[G_K]}V_𝔽 = 𝔽, the same holds for (R_{V_𝔽}[1/p])^{τ,v} with dimension 1 + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}. Consequently a nonzero R^{□,τ,v} has Krull dimension 1 + d² + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}, and imposing a compatible determinant with nonzero fixed-determinant quotient lowers these dimensions by one.

*Hypotheses and conventions.*
- The passage from the generic fibre to the Krull dimension of the p-torsion-free ring R^{□,τ,v} (dim R = dim R[1/p] + 1 for p-torsion-free complete local Noetherian 𝒪-algebras) is requested from DeformationAndDerivedPatchingAlgebra R03.3.
- Fixing the determinant removes the one-dimensional deformation space of the determinant (LocalGaloisDeformationRings R08.1/local-fixed-determinant).
- The determinant must have the Hodge and inertia type forced by (τ,v). Dimension lowering uses characteristic-zero determinant twisting; it does not require p∤d.

*Proof outline.* filtered-phi-N-deformations gives a formally smooth dense open U where H²_F(D_A) = 0. At a closed point x ∈ U, dim of the tangent space = dim Ext¹_pst(V_x, V_x) + d² − dim (ad V_x)^{G_K} (Kisin's Moduli paper, 2.3.5). Ext¹_pst(V_x, V_x) ≅ Ext¹(D_x, D_x) in Mod_{F,φ,N} (Fontaine), = dim H¹_F(D_x) = dim (ad D_{x,L}/Fil⁰)^{G_{L/K}} + dim H⁰_F(D_x), and the first term is dim_E ad D_{E,K}/Fil⁰ by Hilbert 90; H⁰_F(D_x) = (ad V_x)^{G_K} cancels. Unframed: R^□ → R is formally smooth of relative dimension d² − 1. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* d = 2, K = ℚ_p, crystalline with weights {0, 1} (Barsotti–Tate), τ trivial: dimension 4 + 1 = 5; with fixed determinant 4 = 3 + [K : ℚ_p], the relative dimension KW II §4.1.3 records for places above p. Regular weights: d² + [K : ℚ_p]·d(d − 1)/2, and with fixed determinant the Krull dimension of the integral ring is d² + [K : ℚ_p]·d(d − 1)/2 (Gee Theorem 3.28). Generic smoothness is only on a dense open. Ordinary semistable representations with weights {0, 1} give two components meeting in codimension one (Kisin, p. 514, footnote 1), so Breuil–Mézard's Conjecture 2.2.2.4(ii) (formal smoothness) fails.

*Prerequisites.* `R08.3/pst-deformation-ring`, `R08.3/filtered-phi-N-deformations`, `R08.3/hodge-and-galois-types`, `R08.1/local-forget-framing`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `R08.1/determinant-twisting`.

*Sources.* Mark Kisin (KISIN-PST-2008), Theorem (3.3.4) and its proof, pp. 540–541; Mark Kisin (KISIN-PST-2008), Introduction, p. 514, footnote 1.

#### `R08.3/pcris-generic-smooth` — Potentially crystalline rings are generically smooth (theorem)

Spec (R^□_{V_𝔽}[1/p])^{τ,v}_cr is formally smooth and equidimensional of dimension d² + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}; for End_{𝔽[G_K]}V_𝔽 = 𝔽 the unframed version has dimension 1 + dim_E ad D_{E,K}/Fil⁰ad D_{E,K}. In particular (R^□[1/p])^{τ,v}_cr is reduced, and R^{□,τ,v}_cr[1/p] = (R^□[1/p])^{τ,v}_cr. In the Fontaine–Laffaille range (K/ℚ_p unramified, τ trivial, distinct weights whose maximum minus minimum is ≤ p − 2) the fixed-determinant ring is formally smooth over 𝒪, a power series ring in d² − 1 + [K : ℚ_p]·d(d − 1)/2 variables.

*Hypotheses and conventions.*
- The Fontaine–Laffaille statement is Gee Theorem 3.28 (after Ramakrishna and CHT08 §2.4); Fontaine–Laffaille theory itself is PadicHodgeTheory R06.4 and FiniteFlatGroupsAndIntegralPadicHodgeTheory. Here it is quoted as a special case; its integral smoothness is not a consequence of Kisin's generic-fibre theorem.
- For the integral Fontaine–Laffaille assertion, assume the residual representation belongs to the FL essential image with the specified regular labelled weights, and fix a compatible determinant for which the quotient is nonzero. The FL liftability/tangent calculation is imported from L7/fontaine-laffaille-deformation-condition and L7/fontaine-laffaille-tangent-space-and-smoothness.

*Proof outline.* With N = 0 the complex loses its N-terms and Mod_φ, Mod_{F,φ} are formally smooth, so every completion maps formally smoothly to Mod_{F,φ} (Proposition 3.3.1) and is formally smooth. Ext¹ in Mod_{F,φ} is the cokernel of (ad D)^{G_{L/K}} → (ad D)^{G_{L/K}} ⊕ (ad D_L/Fil⁰)^{G_{L/K}}, and the dimension count is as in pst-generic-fibre. Formally smooth ⇒ regular ⇒ reduced, so the reduced closure changes nothing on the generic fibre. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* d = 2, K = ℚ_p, weights {0, 1}, τ trivial (crystalline Barsotti–Tate): the generic fibre is smooth of dimension 5. d = 1, K = ℚ_p: crystalline characters of weight i are χ_p^i·(unramified), so the ring, when nonzero, is 𝒪⟦x⟧: formally smooth, of generic dimension 1 = d² + 0. The semistable analogue fails (pst-generic-fibre, the ordinary weight-{0, 1} example): smoothness is special to N = 0.

*Prerequisites.* `R08.3/pst-deformation-ring`, `R08.3/filtered-phi-N-deformations`, `R08.3/pst-generic-fibre`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `L7/fontaine-laffaille-deformation-condition`, `L7/fontaine-laffaille-tangent-space-and-smoothness`.

*Sources.* Mark Kisin (KISIN-PST-2008), Theorem (3.3.8) and its proof, p. 541; Toby Gee (GEE-MLT-2022), Theorem 3.28, pp. 18–19.

#### `R08.3/pst-coefficient-change` — Potentially semistable rings under change of coefficients (lemma)

For a finite extension 𝒪_E → 𝒪_{E′} (possibly with a residue field extension 𝔽 ⊆ 𝔽′), R^{□,τ,v}_{V_𝔽 ⊗ 𝔽′, 𝒪_{E′}} ≅ R^{□,τ,v}_{V_𝔽, 𝒪_E} ⊗_{𝒪_E} 𝒪_{E′}, compatibly with R^□_{V_𝔽⊗𝔽′,𝒪_{E′}} ≅ R^□_{V_𝔽,𝒪_E} ⊗̂_{𝒪_E} 𝒪_{E′} (R08.1/local-residue-field-change); likewise for the crystalline and unframed variants.

*Hypotheses and conventions.*
- Types (τ, v) over E are viewed over E′ by extension of scalars.

*Proof outline.* R^{□,τ,v}_{𝒪_E} ⊗ 𝒪_{E′} is p-torsion-free, because 𝒪_{E′} is flat over 𝒪_E. It is reduced: its generic fibre is R^{□,τ,v}[1/p] ⊗_E E′, reduced because E′/E is separable, and it embeds into its generic fibre. Its ℚ̄_p-points are the same lifts as those of R^{□,τ,v}_{𝒪_{E′}}, and a reduced p-torsion-free quotient of R^□_{𝒪_{E′}} is determined by its ℚ̄_p-points.

*Acceptance.* E′ = E gives the identity. Nonemptiness is insensitive to the coefficients, since ℚ̄_p-points do not change. The same argument fails for a non-reduced quotient: nilpotent structure on the generic fibre need not be controlled by points, which is why R^{□,τ,v} is defined reduced.

*Prerequisites.* `R08.3/pst-deformation-ring`, `R08.1/local-residue-field-change`, `PadicHodgeTheory:R06.2/coefficient-field-base-change`.

*Sources.* Mark Kisin (KISIN-PST-2008), (2.7.5), p. 534.

#### `R08.3/pst-quotient-in-families` — Potentially semistable loci in families over a complete local base (theorem)

Let E/ℚ_p be finite, A° a Noetherian complete local 𝒪_E-algebra with finite residue field, A = A°[1/p], and V_{A°} a finite free A°-module of rank r with a continuous G_K-action (K/ℚ_p finite). (1) (Kisin 2.5.5) For h ≥ 0 there is a quotient A^{st,h} of A such that a map of ℚ_p-algebras ζ : A → B to a finite ℚ_p-algebra B factors through it iff V_B = V_A ⊗_A B is semistable with Hodge–Tate weights in [0, h]; over A^{st,h} there is a projective (φ, N)-module D of rank r specialising to D_st(V_B). (2) (Kisin 2.7.6) For a p-adic Hodge type v (an E-vector space D_E of dimension r with E ⊗ K-submodules) and τ : I_K → GL_r(E) with open kernel, there is a quotient A^{τ,v} of A such that ζ : A → B (B a finite E-algebra) factors through it iff V_B is potentially semistable of type τ and p-adic Hodge type v. (3) (Kisin 2.7.7) Likewise A^{τ,v}_cr for potentially crystalline. These quotients are compatible with base change along maps A° → A′° of complete local 𝒪_E-algebras: (A′)^{τ,v} = A′ ⊗_A A^{τ,v}.

*Hypotheses and conventions.*
- The base A° is arbitrary (not only a universal framed ring); this is the form used for families of automorphic Galois representations (Kisin's Corollary on Hilbert modular forms) and exported to AutomorphicGaloisRepresentations R19.5 (red-team finding RT-AREA-langlands-2/14).
- The quotients are of A = A°[1/p]; no integral statement is made here (R08.3/pst-deformation-ring takes the reduced p-torsion-free closure).

*Proof outline.* (1): Kisin §§1–2: the finite height lattice moduli L_{≤h} of L7/height-lattice-moduli over A°, the map to Spec A an isomorphism after inverting p on the semistable locus, and D_st via Proposition (2.7.2). (2): choose L/K Galois with I_L ⊂ ker τ; Corollary (2.6.2) gives A^{pst,v} for V|G_L; trace of I_{L/K} on D is locally constant (it lies in (W_{L,A})^{φ=1} = A) and the type locus is open and closed. (3): impose N = 0. Base change: the defining property is tested on finite algebras, which is stable under A → A′.

*Acceptance.* A° = 𝒪_E, V a single lattice: A^{τ,v} = E if V ⊗ E is potentially semistable of type (τ, v) and 0 otherwise. A° = R^□_ρ̄ recovers R08.3/pst-deformation-ring (1)–(2).

*Prerequisites.* `L7/height-lattice-moduli`, `R08.3/hodge-and-galois-types`, `R08.3/hodge-type-components`, `PadicHodgeTheory:R06.3/potentially-semistable-dieudonne-module`.

*Sources.* Mark Kisin (KISIN-PST-2008-AMS), (2.7.5), p. 534; Mark Kisin (KISIN-PST-2008-AMS), Theorem (2.5.5), p. 530.

#### `R08.3/g-valued-pst-rings` — G-valued potentially semistable lifting rings (Balaji, Bellovin–Gee) (theorem)

Let K/ℚ_p be finite, G a smooth affine 𝒪-group with reductive G⁰, ρ̄ : G_K → G(k), τ : I_K → G(Ē) an inertial type up to G⁰(Ē)-conjugacy and v a p-adic Hodge type (a conjugacy class of cocharacters). (1) (Balaji) There is a unique reduced 𝒪-flat quotient R^{□,τ,v}_ρ̄ of R^□_{ρ̄,G} (R08.1/g-valued-framed-ring) whose E′-points (E′/E finite) are exactly the lifts that are potentially semistable of type (τ, v). (2) (Bellovin–Gee, Theorem A) For v = v_λ with λ regular, R^{□,τ,v}_ρ̄ is equidimensional, every irreducible component of R^{□,τ,v}_ρ̄[1/p] has dimension dim G + [K:ℚ_p]·dim Fl_G, and R^{□,τ,v}_ρ̄[1/p] has an open dense regular subscheme. (3) With fixed multiplier μ the same holds with dim G^der in place of dim G. For G = GL_n this is R08.3/pst-deformation-ring with R08.3/pst-generic-fibre (dim Fl = n(n−1)/2).

*Hypotheses and conventions.*
- The type τ is G(Ē)-valued up to G⁰(Ē)-conjugacy (FKP p. 6).
- For non-regular v the dimension is dim G + [K:ℚ_p] dim(G/P_v).
- Fix the full abelianization G/G_der, with Hodge and inertial data compatible with that fixed character, and assume the quotient is nonzero.

*Proof outline.* (1): apply R08.3/pst-quotient-in-families to V = (a faithful representation of G) ∘ ρ^□_G and cut out the G-valued Hodge and inertial type (Balaji Proposition 3.0.12). (2): Bellovin–Gee: the generic fibre is smooth at points where H²(G_K, ad ρ_x) restricted to the filtered part vanishes, and has the dimension of the tangent space of the corresponding Kisin-type resolution; dim Fl_G counts the Hodge filtrations.

*Acceptance.* G = GL₂, K = ℚ_p, v = {0, 1}: dimension 4 + 1·1 = 5 for R^□[1/p]; with fixed determinant 3 + 1 = 4.

*Prerequisites.* `R08.1/g-valued-framed-ring`, `R08.3/pst-quotient-in-families`, `R08.3/pst-deformation-ring`, `R08.3/pst-generic-fibre`.

*Sources.* Najmuddin Fakhruddin (FKP-2022), Appendix B, arXiv v5 pp. 52–53.

#### `R08.3/weil-deligne-type-ring` — Rings of fixed Weil–Deligne type cut out of pseudo-character deformation rings (R_{B,M}) (construction)

Let p be such that the block theory of GL₂(ℚ_p) applies, B a block of mod p representations of GL₂(ℚ_p) with pseudo-character deformation ring R^{ps,δ}_B, and M a supercuspidal Weil–Deligne representation (a filtered (φ, N, G_{ℚ_p})-module type of weights 0 and 1) with δ_M its determinant. I_{B,M} is the intersection of the maximal ideals 𝔭 of R^{ps,δ_M}_B[1/p] at which the universal pseudo-character specialises to the trace of a de Rham representation of weights {0, 1} and type M (whole Weil–Deligne representation fixed, not only its restriction to inertia). R_{B,M} := R^{ps,δ_M}_B[1/p]/I_{B,M} is reduced and Jacobson, R^+_{B,M} is the image of R^{ps,δ_M}_B, and R_{B,M} = R^+_{B,M}[1/p]. (Théorème 5.11) R_{B,M} is the ring of bounded analytic functions on an open subset of ℙ¹, a finite product of principal ideal domains, and there is a unique up to isomorphism representation ρ_{B,M} : G_{ℚ_p} → GL₂(R_{B,M}) with trace the universal pseudo-character.

*Hypotheses and conventions.*
- This differs from R08.3/pst-deformation-ring in two ways: the type is the whole Weil–Deligne representation M (not a Galois type τ), and the ring is a quotient of a pseudo-character deformation ring rather than of a framed ring.
- For M special (Sp ⊗ η) CDN set R_{M,B} = L and use the Steinberg block separately.

*Construction.* The points of Spec R^{ps}[1/p] of trace a de Rham representation of type M form a Zariski-closed reduced subset (R08.3/pst-quotient-in-families applied to the universal representation over the absolutely irreducible locus). Théorème 5.11 is proved in CDN's earlier paper [19, Théorème 0.1] via the p-adic local Langlands correspondence; uniqueness up to isomorphism of ρ_{B,M} from irreducibility of V_{M,L} (Lemme 5.12).

*API.*
- `TauCeti.GaloisDeformation.Local.WDTypeRing` (data): R_{B,M} = R^{ps,δ_M}_B[1/p]/I_{B,M} and its integral model R^+_{B,M}.
- `TauCeti.GaloisDeformation.Local.WDTypeRing.points` (characterisation): A maximal ideal of R^{ps,δ_M}_B[1/p] contains I_{B,M} iff the specialised pseudo-character is the trace of a de Rham representation of weights {0, 1} and Weil–Deligne type M.
- `TauCeti.GaloisDeformation.Local.WDTypeRing.reduced` (other): R_{B,M} is reduced and Jacobson.
- `TauCeti.GaloisDeformation.Local.WDTypeRing.pid` (structure): R_{B,M} is a finite product of principal ideal domains (bounded analytic functions on an open of ℙ¹).
- `TauCeti.GaloisDeformation.Local.WDTypeRing.universalRep` (constructor): The representation ρ_{B,M} with Tr ρ_{B,M} = the universal pseudo-character.
- `TauCeti.GaloisDeformation.Local.WDTypeRing.integralImage` (characterisation): R^+_{B,M} is the image of R^{ps,δ_M}_B→R_{B,M}; its kernel is the inverse image of I_{B,M} under localization, and localizing R^+_{B,M} at p gives R_{B,M}. This makes integral image and generic ring distinct constructions.

*Unit tests.*
- `wdTypeRing_points_typeM` (characterisation): Every maximal ideal x of R_{B,M} gives ρ_x de Rham of weights {0, 1} with WD(ρ_x) ≅ M (Frobenius included).
- `wdTypeRing_vs_galois_type` (non-example): Choose a supercuspidal WD representation M that is not isomorphic to its unramified quadratic twist. The two have the same inertial restriction and determinant but differ as full WD types. Forgetting Frobenius does not by itself imply an increase of one in dimension when determinant is fixed.
- `wdTypeRing_empty_block` (degenerate): If no de Rham representation of type M has reduction in B, I_{B,M} is the unit ideal and R_{B,M} = 0.
- `wdTypeRing_trace` (compatibility): Tr ∘ ρ_{B,M} equals the image of the universal pseudo-character of R^{ps,δ_M}_B.

*Used by.* CDN 2023, Théorème 5.15 — factorisation of the p-adic étale cohomology of the Drinfeld tower over R_{B,M}; LocalGaloisDeformationRings:R08.3 — the Weil–Deligne-type refinement of Kisin's rings

*Acceptance.* At each maximal ideal x, ρ_{B,M} specialises to the unique up to isomorphism de Rham ρ_x of type M with trace the specialised pseudo-character.

*Prerequisites.* `R08.3/pst-quotient-in-families`, `R08.3/hodge-and-galois-types`, `GlobalGaloisDeformations:R04.1/lifting-functor`, `PadicLocalLanglandsForGL2Qp:R30.5`.

*Sources.* Pierre Colmez (CDN-2023), §5.2, arXiv p. 66; Pierre Colmez (CDN-2023), Théorème 5.11, arXiv p. 66.

#### `R08.3/bcdt-type-rings` — Breuil–Conrad–Diamond–Taylor type rings as Kisin rings (comparison)

Let ℓ be a prime, ρ̄ : G_ℓ → GL(V) two-dimensional over k with End_{k[G_ℓ]} V = k, and R_{V,𝒪} its universal deformation ring. An ℓ-type τ is a class of two-dimensional τ : I_ℓ → GL(D) over ℚ̄_ℓ with open kernel extending to W_{ℚ_ℓ}; an extended ℓ-type τ′ a class of τ′ : W_{ℚ_ℓ} → GL(D′) with open kernel. ρ over K is of type τ (resp. τ′) if it is Barsotti–Tate over every finite F/ℚ_ℓ with τ|_{I_F} trivial, WD(ρ)|_{I_ℓ} ∈ τ (resp. WD(ρ) ∼ τ′), and ε^{-1} det ρ has finite order prime to ℓ. R^D_{V,𝒪} = R^τ_{V,𝒪} is the quotient of R_{V,𝒪} by the intersection of the primes of type τ (0 if none); 'weakly of type τ' means factoring through R^D; τ is weakly acceptable if R^D = 0 or there is a surjection 𝒪⟦X⟧ ↠ R^D. Then: (1) R^D_{V,𝒪} is the unframed potentially crystalline quotient R^{τ,v_{BT},cris} obtained from R08.3/pst-deformation-ring and R08.3/pcris-generic-smooth with v_{BT} the Hodge type of weights {0, 1} and the determinant condition. (2) BCDT Conjecture 1.1.1 (a deformation to 𝒪′ is weakly of type τ iff it is of type τ) holds, by the point characterisation of Kisin's rings.

*Hypotheses and conventions.*
- For ℓ odd, Barsotti–Tate over F may be weakened to potentially Barsotti–Tate (Breuil, Theorem 1.4).
- 'Acceptable' is a tangent-space bound specific to BCDT's approach and is not part of Kisin's theory.
- The finite-order prime-to-ℓ determinant factor is uniquely its Teichmüller lift. For an extended type, additionally impose the full Frobenius datum; the inertial type alone does not fix it.

*Proof outline.* Both quotients are reduced and ℓ-torsion-free with the same characteristic-zero points: crystalline of weights {0,1} over an extension killing τ, the specified inertial type, and determinant ε times the Teichmüller lift of ε̄⁻¹det ρ̄. The Barsotti–Tate comparison is imported from R06.4. Use the potentially crystalline quotient, not merely the potentially semistable quotient. Kisin’s potentially crystalline point criterion identifies the quotient with the intersection of all primes of type τ. Thus weakly of type τ is equivalent to type τ for a lift to coefficient integers. The absolutely irreducible extended-type form also fixes Frobenius in the associated crystalline WD representation.

*Acceptance.* ℓ = 3, τ = ω₂^{i} ⊕ ω₂^{3i} (level 2): R^D is Savitt's ring of R08.4/savitt-weight-two-rings. For trivial inertia type, a Tate-curve representation is semistable of weights {0,1} with N≠0 but is not potentially Barsotti–Tate. It must not be a point of the BCDT type ring.

*Prerequisites.* `R08.3/pst-deformation-ring`, `R08.1/local-forget-framing`, `PadicHodgeTheory:R06.4/barsotti-tate-crystalline-criterion`, `R08.3/pcris-generic-smooth`.

*Sources.* Christophe Breuil (BCDT-2001), §1.1, p. 851; author manuscript pp.7–8 (§1.1); Christophe Breuil (BCDT-2001), Conjecture 1.1.1, p. 851; author manuscript pp.7–8 (§1.1); Mark Kisin (KISIN-PST-2008-AMS), Introduction, p. 513.

#### `R08.3/fixed-determinant-pst-rings` — Fixed-determinant crystalline and ordinary rings as power-series quotients (theorem)

Let p ∤ n, λ a dominant weight, ρ̄ : G_K → GL_n(k), and ψ : G_K → 𝒪^× a crystalline character lifting det ρ̄ with τ-labelled Hodge–Tate weight Σ_i (λ_{τ,i} + n − i). For R = R^{cris,λ}_ρ̄ (resp. R^{△,λ}_ρ̄, L7/semistable-ordinary-quotient) put R^ψ = R ⊗_{R^□_ρ̄} R^{□,ψ}_ρ̄. Then the quotient map R → R^ψ has a section extending to an isomorphism R^ψ⟦X⟧ ≅ R; in particular R^ψ is 𝒪-flat and reduced, and a map R^{□,ψ}_ρ̄ → B (B a finite E-algebra) factors through R^ψ iff the corresponding lift is crystalline of Hodge type v_λ (resp. semistable-ordinary of weight λ).

*Hypotheses and conventions.*
- Caraiani–Newton print R^{△,λ,ψ} with R^{cris,λ} in place of R^{△,λ} (their source issue E2); the ordinary ring is meant.

*Proof outline.* ψ^{-1} det ρ^univ is unramified and residually trivial (both are crystalline of the same weight), so it has an unramified n-th root α by Hensel (p ∤ n); twisting by α^{-1} defines the section and the isomorphism (Emerton–Gee, Lemma 4.3.1).

*Acceptance.* n = 2, K = ℚ_p, λ = (0, 0): R^{cris,λ} ≅ R^{cris,λ,ψ}⟦X⟧ with X the unramified twist parameter.

*Prerequisites.* `R08.3/pst-deformation-ring`, `R08.1/local-fixed-determinant`, `L7/semistable-ordinary-quotient`.

*Sources.* Ana Caraiani (CN-2023), Lemma 3.3.6, arXiv v3 pp. 52–53.

*Coverage of R08.3:* planned. Remaining: CDN Théorème 5.11 is requested from PadicLocalLanglandsForGL2Qp R30.5 and its proof is not decomposed here. Ding's trianguline variety and its smoothness at noncritical points belong to the trianguline-variety roadmap proposed by the Breuil–Hellmann–Schraen extraction; R08.3 uses only the (φ, Γ)-module deformation rings of R08.1. Gap recorded: the Colmez–Fontaine proof requested from PadicHodgeTheory R06.3.

### Layer L7: Local models and arbitrary dimension

L7 holds the rank-general constructions that are not Kisin's potentially semistable rings. Its first part, the bounded-height lattice moduli (Kisin 2008 §1), is used by R08.3 and R08.4. Kisin modules, E-height and the uniqueness of lattices are FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4's: L7 defines only the functor B ↦ {lattices of E-height ≤ h in M(V_A) ⊗_A B} of a deformation family and represents it; the packet's restructure record proposes that it become a sub-layer before R08.3, which removes the only cycle with the atlas edges. The second part is the Fontaine–Laffaille and discrete-series conditions of Clozel–Harris–Taylor (the Fontaine–Laffaille condition is a deformation condition on lifts, defined through the category and realisation functor of R07.3, which are not rebuilt here), torsion crystalline representations (Liu et al.), the rank-n conditions away from p imported from R08.2, and Clozel–Thorne's rings R^m_v with monodromy bounded by a partition. The third part is ordinary theory: ordinary representations of weight λ (with the finite-order factor of Newton–Thorne's Definition 2.5(2)), Geraghty's flag scheme and its image ring, semistable-ordinary quotients (Caraiani–Newton), the G-valued ordinary condition, flag scheme and components of Fakhruddin–Khare–Patrikis Appendix B (with the central generators the printed ideal lacks), Snowden's two-component ordinary ring, Calegari–Geraghty's ring R̃† with a Frobenius eigenvalue (a normal Cohen–Macaulay domain of type three), and the GSp₄ ordinary conditions of Calegari–Geraghty and Boxer–Calegari–Gee–Pilloni. The last part is component geometry: the relation 'connects' of Barnet-Lamb–Gee–Geraghty–Taylor, the local models ρ_{n,m,0} and Le–Le Hung–Levin–Morra's GL₃ rings with their Serre-weight labelling, read in eigenbasis charts of R07.4's Kisin modules with tame descent data. Geraghty's flag scheme is planned with its local structure at characteristic-zero points (tangent space and obstructions, Lemma 3.7) and his fixed-weight ordinary rings (components, connected fibres and irreducibility for trivial ρ̄), on which Thorne's flag ring for trivial ρ̄ rests; for GSp₄ the finite-flat ordinary smoothness behind BCGP25 Lemma 6.2.5 is a node of its own. The GL₃ explicit rings are given by their equations: the identity and α charts in full, and the length-two to length-four rows of LLHLM's Tables 3–4 with their minimal primes and Serre-weight labels, with the table misprints corrected. The local comparisons of ACC+ §6.2 are exported to PotentialAutomorphyInfrastructure PA.3 (finding /22).

*Planets:* Height-lattice moduli; Ordinary flag scheme and its image ring; Ordinary representations of weight λ; G-valued ordinary components; GSp₄ ordinary rings; The relation "connects".

#### `L7/finite-height-lattices` — The functor of bounded-height lattices of a deformation family (definition)

Let K/ℚ_p be finite, 𝔖 = W(k)⟦u⟧, E(u), 𝒪_ℰ and K_∞ as in FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4/bk-coefficient-rings, and h ≥ 0. Let A be a complete local Noetherian 𝒪-algebra with finite residue field (in practice A = R^□_ρ̄ or an Artinian quotient), V_A a finite free A-module of rank d with continuous G_K-action (a deformation of V_𝔽), and M_A = M(V_A) its étale φ-module over 𝒪_{ℰ,A} (R07.4/etale-phi-modules-with-coefficients). The bounded-height lattice functor L^{≤h}_{V_A} sends an A-algebra B to the set of 𝔖_B-lattices of E-height ≤ h in M_B = M_A ⊗_A B in the sense of R07.4/finite-height-lattices (with coefficients): finite projective 𝔖_B-submodules of rank d spanning M_B, φ-stable, with coker(φ*𝔐_B → 𝔐_B) killed by E(u)^h. A morphism B → B′ sends 𝔐_B to 𝔐_B ⊗_B B′. The notions of Kisin module, E-height, étale φ-module and the uniqueness of finite-height lattices are R07.4's; this node defines only the functor on A-algebras attached to a deformation family, which L7/height-lattice-moduli represents.

*Hypotheses and conventions.*
- The general theory (𝔖, 𝒪_ℰ, M(V), Kisin modules of E-height ≤ h, uniqueness over finite flat ℤ_p-algebras by Kisin 2006, 2.1.12 with the repaired proof of Kisin 2008, Errata (E.4)) is imported from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4; nothing of it is rebuilt here.
- Lattices are functorial in B: 𝒪_ℰ ⊗_𝔖 𝔐_B ⊗_B B′ is projective of rank d and surjects onto M_{B′}, so it is isomorphic to it (R07.4/finite-height-lattices, coefficient clause).

*Construction.* Functoriality: base change B → B′ preserves the lattice conditions (R07.4/finite-height-lattices, coefficient clause; a surjection of projective 𝒪_{ℰ,B′}-modules of the same rank is an isomorphism); identities and composites are respected because ⊗ is. Points over finite flat ℤ_p-algebras: by R07.4/finite-height-lattices (1) M_B contains at most one lattice of finite E-height, so L^{≤h}_{V_A}(B) has at most one element; it is nonempty iff V_B has E-height ≤ h in R07.4's sense.

*API.*
- `TauCeti.GaloisDeformation.Local.heightLatticeFunctor` (constructor): L^{≤h}_{V_A}: the functor from A-algebras to sets, B ↦ {𝔖_B-lattices of E-height ≤ h in M_B} (lattices in the sense of R07.4/finite-height-lattices).
- `TauCeti.GaloisDeformation.Local.heightLatticeFunctor.map` (functoriality): For B → B′, 𝔐_B ↦ 𝔐_B ⊗_B B′, with map_id and map_comp.
- `TauCeti.GaloisDeformation.Local.heightLatticeFunctor.ext` (extensionality): Two points of L^{≤h}_{V_A}(B) are equal iff their underlying 𝔖_B-submodules of M_B are equal; the projectivity, spanning and height conditions are properties.
- `TauCeti.GaloisDeformation.Local.heightLatticeFunctor_subsingleton` (characterisation): For B finite flat over ℤ_p, L^{≤h}_{V_A}(B) has at most one element (R07.4/finite-height-lattices (1)).
- `TauCeti.GaloisDeformation.Local.heightLatticeFunctor_nonempty_iff` (compatibility): For B finite flat over ℤ_p, L^{≤h}_{V_A}(B) is nonempty iff V_A ⊗_A B has E-height ≤ h in the sense of R07.4/kisin-modules.
- `TauCeti.GaloisDeformation.Local.heightLatticeFunctor.mono` (relation): For h ≤ h′, L^{≤h}_{V_A}(B) ⊆ L^{≤h′}_{V_A}(B), compatibly with base change.

*Unit tests.*
- `height_rank_one_E` (computation): Rank one, M = 𝒪_ℰ·e with φ(e) = E(u)e: in the basis e the Frobenius matrix is E(u), which divides E(u)^1 but not E(u)^0, so L^{≤1}(ℤ_p) = {𝔖e} and L^{≤0}(ℤ_p) = ∅.
- `height_zero_iff_etale` (characterisation): A lattice with Frobenius matrix X in a basis lies in L^{≤0}(B) iff X is invertible over 𝔖_B, i.e. iff φ*𝔐_B → 𝔐_B is an isomorphism.
- `height_u_not_finite` (non-example): For φ(e) = u·e (étale over 𝒪_ℰ, since u is a unit there) no power E(u)^h is divisible by u in 𝔖 (E(0) = p·unit), so L^{≤h}(ℤ_p) = ∅ for every h.

*Used by.* LocalGaloisDeformationRings:L7/height-lattice-moduli — the moduli functor of these lattices.; LocalGaloisDeformationRings:R08.3/semistable-height-quotient — semistable with Hodge–Tate weights in [0, h] implies E-height ≤ h.; LocalGaloisDeformationRings:R08.4 — h = 1, the finite-flat and Barsotti–Tate case in rank two.

*Acceptance.* Rank one with M = 𝒪_ℰ·e and φ(e) = E(u)e: L^{≤1}(ℤ_p) = {𝔖e} and L^{≤0}(ℤ_p) = ∅ (cokernel 𝔖/E(u)). L^{≤0}(B) consists of the lattices on which φ*𝔐_B → 𝔐_B is an isomorphism. φ(e) = u·e: L^{≤h}(ℤ_p) = ∅ for every h, since 𝔖/u𝔖 is killed by no E(u)^h (E(0) = p·unit).

*Prerequisites.* `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/bk-coefficient-rings`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/finite-height-lattices`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-with-coefficients`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

*Sources.* Mark Kisin (KISIN-PST-2008), (1.2), pp. 516–517; Mark Kisin (KISIN-PST-2008), (1.2), p. 517; Mark Kisin (KISIN-PST-2008), Errata for [Ki 2], (E.4), p. 545.

#### `L7/height-lattice-moduli` — Moduli of lattices of bounded E-height and their image (theorem)

Let A be a complete local Noetherian ring with finite residue field 𝔽 and V_A finite free of rank d with continuous G_{K_∞}-action. (1) On A-algebras B with 𝔪_A^i B = 0 for some i, B ↦ {𝔖_B-lattices of E-height ≤ h in M_B} is represented by a projective A-scheme Θ_A : 𝓛^{≤h}_{V_A} → Spec A, compatible with base change and carrying a canonical very ample line bundle. (2) Θ_A becomes a closed immersion after inverting p. (3) If A^{≤h} is the quotient of A cut out by the scheme-theoretic image of Θ_A, then for every finite W(𝔽)[1/p]-algebra B, A → B factors through A^{≤h} exactly when V_B has E-height ≤ h. (4) There is a finite 𝔖_{A^{≤h}}-module 𝔐 with φ*𝔐 → 𝔐 of cokernel killed by E(u)^h, locally free after inverting p, which specialises at each such B to the unique lattice.

*Hypotheses and conventions.*
- Artinian case (Proposition 1.3): Beauville–Laszlo realise the functor as a closed sub-ind-scheme of the affine Grassmannian of Res_{W(k)/ℤ_p}GL_d, and the height bound confines 𝔐 to u^iN ⊆ 𝔐 ⊆ u^{−i}N with i ≤ (esh + r)/(p − 1), so it lies in a finite Grassmannian of u^{−i}N/u^iN. Grassmannians and the closedness of Frobenius-stable lattice conditions are requested from AlgebraicModuliForArithmeticGeometry R09.1.
- From Artinian to complete A: formal GAGA (AdicSpacesPartII F0/grothendieck-algebraization) with the canonical very ample bundle.
- RS-08 makes L7 the owner of this rank-general construction; R08.4 instantiates it in rank two with h = 1.

*Proof outline.* (1) The Artinian case is the bounded affine Grassmannian, whose canonical line bundle is very ample on closed subschemes of finite type (Faltings). For complete A, the compatible projective schemes over A/𝔪^i form a formal scheme with an ample bundle, which formal GAGA algebraises (Corollary 1.5.1). (2) Over a finite flat W(𝔽)-algebra C the map on C-points is injective, by uniqueness of lattices. Every B-point (B finite local over W(𝔽)[1/p]) comes from some C ∈ Int_B, and for 𝓛 by the valuative criterion, so the map is injective on B-points. B = E gives a quasi-finite, hence finite, map injective on closed points; B = E[ε] gives surjectivity on tangent spaces. So it is a closed immersion after inverting p. (3) A B-point of the image lifts to a C-point of 𝓛, which is a lattice. Conversely, build a lattice over some C′ ⊇ C by lifting an 𝔖-basis of the unique lattice of M_{𝒪_E}; E(u)^h kills the cokernel because it is a successive extension of p-torsion-free pieces (Proposition 1.6.4). (4) Push forward the universal module on 𝓛 × Spf 𝔖_A, algebraised by formal GAGA; the scheme-theoretic image is Spec 𝔖_{A^{≤h}} (Corollary 1.7).

*Acceptance.* Θ_A need not be a closed immersion before inverting p. Take K = ℚ₂, h = 1 and V_𝔽 = 𝔽₂ with trivial action: M = 𝔽₂((u))e with φ(e) = e, and u^a·𝔖_{𝔽₂}e is φ-stable of E-height ≤ 1 (E(u) ≡ u mod 2) exactly for a ∈ {0, 1}. So 𝓛^{≤1} has two 𝔽₂-points over Spec 𝔽₂. For V_𝔽 = 𝔽_p trivial, u^a𝔖e qualifies exactly when 0 ≤ (p − 1)a ≤ eh, since E(u) ≡ u^e mod p. For h ≥ 2, A^{≤h} is larger than the semistable locus. Finite E-height is a condition on G_{K_∞}, and it gives semistable representations only for E-height ≤ 1 (Kisin, Introduction, p. 515). Base change: 𝓛^{≤h}_{V_A} ⊗_A A′ ≅ 𝓛^{≤h}_{V_{A′}} for local Artinian A → A′.

*Prerequisites.* `L7/finite-height-lattices`, `AdicSpacesPartII:F0/grothendieck-algebraization`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

*Sources.* Mark Kisin (KISIN-PST-2008), Proposition (1.3), p. 517; Mark Kisin (KISIN-PST-2008), Corollary (1.5.1), p. 518; Mark Kisin (KISIN-PST-2008), Proposition (1.6.4) and its proof, pp. 520–521; Mark Kisin (KISIN-PST-2008), Corollary (1.7), pp. 521–522.

#### `L7/ordinary-flag-scheme` — The ordinary flag scheme and its image ring R^△_v (construction)

With Λ_v as in L8/ordinary-coefficient-ring and R^□_v ∈ CNL_{Λ_v} the universal lifting ring of ρ̄ (R08.1), let 𝓕 be the flag variety over 𝒪 of complete flags in 𝒪ⁿ and 𝒢_v ⊂ 𝓕 ×_𝒪 Spec R^□_v the closed subscheme whose A-points (A an R^□_v-algebra) are flags preserved by the universal lifting over A on which I_{F_v} acts on Fil_i/Fil_{i−1} through χ_i^univ. The map 𝒢_v → Spec R^□_v is proper, and R^△_v is the image of R^□_v → H⁰(𝒢_v, 𝒪_{𝒢_v}). For a domain R ∈ CNL_{Λ_v} with K an algebraic closure of Frac R, an R-point of Spec R^□_v factors through R^△_v iff ρ ⊗_R K has a G_{F_v}-stable full flag with I_{F_v} acting on the graded pieces by the push-forwards of the χ_j^univ.

*Hypotheses and conventions.*
- v | p; ρ̄ has a full invariant flag.

*Construction.* 𝒢_v is cut out in the projective 𝓕 × Spec R^□_v by closed conditions (stability of each Fil_i and the inertial action on the graded pieces); properness comes from projectivity of 𝓕 (AlgebraicModuliForArithmeticGeometry R09.1). The point criterion: a flag over K gives a K-point of 𝒢_v over the given point; conversely the image of a proper map contains every point lifting to a field-valued point (valuative criterion for the closed image).

*API.*
- `TauCeti.GaloisDeformation.Local.ordinaryFlagScheme` (constructor): 𝒢_v ⊂ 𝓕 × Spec R^□_v.
- `TauCeti.GaloisDeformation.Local.ordinaryFlagScheme_proper` (characterisation): 𝒢_v → Spec R^□_v is proper.
- `TauCeti.GaloisDeformation.Local.ordinaryFlagImage` (constructor): R^△_v = im(R^□_v → H⁰(𝒢_v, 𝒪)).
- `TauCeti.GaloisDeformation.Local.ordinaryFlagImage_points` (characterisation): The domain point criterion.
- `TauCeti.GaloisDeformation.Local.ordinaryFlagScheme.points` (universal-property): A coefficient point is a framed lift together with a full flag of locally direct summands, stable under G_{F_v}, with the prescribed ordered inertia characters on its graded lines. Pullback of the universal flag realizes this bijection.
- `TauCeti.GaloisDeformation.Local.ordinaryFlagScheme.baseChange` (functoriality): Tensoring a flag of direct summands along a coefficient map gives the new point of the incidence scheme; identity and composition agree with ordinaryFlagScheme pullback.

*Unit tests.*
- `ordinaryFlagImage_n_one` (degenerate): n = 1: every line is a flag, and R^△_v = R^□_v/(ρ|_{I_{F_v}} − χ_1^univ).
- `ordinaryFlagScheme_permuted` (characterisation): Requiring I_{F_v} to act on the i-th piece by χ^univ_{σ(i)} for σ ∈ S_n gives the variant R^{△,σ}_v used in the proof of L8/determinant-flag-comparison.
- `ordinaryFlagImage_not_flag` (non-example): A point of R^△_v need not carry a flag over R itself, only over the algebraic closure of its fraction field.

*Used by.* LocalGaloisDeformationRings:L8/ordinary-point-criteria — Spec R^△_v ⊂ Spec R^{det,ord}_v.; GlobalGaloisDeformations:G7 — ordinary local conditions in ACC+ §6.; PotentialAutomorphyInfrastructure:PA.3 — the local comparisons and component-support input of ACC+ §6.2 for comparing patched complexes under change of local deformation condition (red-team finding RT-AREA-langlands-2/22)

*Acceptance.* The flag-bearing object is 𝒢_v; R^△_v is its image after forgetting the flag. They are different objects.

*Prerequisites.* `R08.1/local-lifting-ring`, `L8/ordinary-coefficient-ring`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

*Sources.* Patrick B. Allen (ACC-POTENTIAL-AUTOMORPHY-CM-2023), §6.2.6, p. 138 (arXiv v2; printed page = PDF page); Patrick B. Allen (ACC-POTENTIAL-AUTOMORPHY-CM-2023), §6.2.6, p. 139 (arXiv v2; printed page = PDF page).

#### `L7/ordinary-flag-scheme-local-structure` — Local structure of the ordinary flag scheme at characteristic-zero points (theorem)

Keep L7/ordinary-flag-scheme (F_w/ℚ_l finite, ρ̄ upper triangular with ordered diagonal χ̄, G = G_{Λ_w} ⊂ 𝓕 ×_𝒪 Spec R^□_{Λ_w} the scheme of pairs (ρ, Fil) with I_{F_w} acting on gr_j by χ_j^univ). Let x be a closed point of G[1/l] with residue field E, (ρ_x, Fil_x) the corresponding pair, g ∈ GL_n(𝒪_E) with Fil_x = g·Fil_std, V_x = E^n with G_{F_w} acting through ρ_x, and Fil^i ad V_x = {A : A Fil_{x,j} ⊆ Fil_{x,j−i}} (so Fil⁰ ad V_x ≅ 𝔟 as a G_{F_w}-module). (1) (Geraghty Lemma 3.5) The completed local ring 𝒪^∧_{G,x} pro-represents the functor of pairs (ρ, Fil) on Artinian local E-algebras lifting (ρ_x, Fil_x), with the prescribed inertial characters. (2) (Corollary 3.6) Let R^g_x pro-represent the continuous lifts G_{F_w} → B_n(B) of g^{−1}ρ_x g with the prescribed inertial diagonal; then 𝒪^∧_{G,x} ≅ R^g_x⟦Z_{ij} : 1 ≤ j < i ≤ n⟧, the variables Z_{ij} moving the flag through a lower unipotent matrix. (3) (Lemma 3.7) The tangent space of G[1/l] at x has dimension z_x = [F_w:ℚ_l]·n(n+1)/2 + n² + dim_E H²(G_{F_w}, Fil⁰ ad V_x), and 𝒪^∧_{G,x} ≅ E⟦y_1, …, y_{z_x}⟧/(f_1, …, f_r) with r ≤ dim_E H²(G_{F_w}, Fil⁰ ad V_x); so every irreducible component of G[1/l] through x has dimension ≥ [F_w:ℚ_l]·n(n+1)/2 + n². (4) H²(G_{F_w}, Fil⁰ ad V_x) = 0 if χ̃_{x,s} ≠ εχ̃_{x,r} for all r > s, or if Fil_{x,j} is the unique j-dimensional G_{F_w}-stable subspace of V_x for every j; then 𝒪^∧_{G,x} is formally smooth over E of dimension [F_w:ℚ_l]·n(n+1)/2 + n².

*Hypotheses and conventions.*
- Published numbering by the concordance recorded in the source GERAGHTY-2019: Lemma 3.5 = preprint Lemma 3.2.1, Corollary 3.6 = Corollary 3.2.2, Lemma 3.7 = Lemma 3.2.3. The published statements were not read; the preprint statements are the ones planned.
- The weight convention of the characters is that of L7/ordinary-of-weight-lambda (HT(ε) = +1 in this packet; Geraghty uses HT(ε) = −1).

*Proof outline.* (1): deformations of the pair are deformations of ρ together with a flag preserved by it, which is the functor of points of G near x (Geraghty Lemma 3.5). (2): (ρ, g M(z) Fil_std) ↦ (M(z)^{−1} g^{−1} ρ g M(z), Fil_std) with M(z) lower unipotent identifies the functor with Borel-valued lifts times the big cell of the flag variety. (3): dim Z¹(G_{F_w}, 𝔟) = [F_w:ℚ_l]·n(n+1)/2 + n(n+1)/2 + h², by the local Euler characteristic formula for 𝔟 (Tau Ceti ClassFieldTheory Layer 5: eulerCharacteristic_finrank_fp); the inertial characters are fixed only through Λ_w, and the n(n−1)/2 flag variables are added; obstructions lie in H²(G_{F_w}, 𝔟). (4): by local Tate duality (tateDualityPairing_perfect_mixed), H²(Fil⁰ ad V_x) ≅ H⁰((ad V_x/Fil¹ ad V_x)(ε))^∨, whose graded pieces are χ̃_{x,s}χ̃_{x,r}^{−1}ε for r > s.

*Acceptance.* n = 1: G = Spec R^□_{Λ_w}, there is no flag, and z_x = [F_w:ℚ_l] + 1 + h², with h² = dim H⁰(E(ε)) = 0. n = 2, F_w = ℚ_l, χ̃_{x,1} ≠ εχ̃_{x,2}: 𝒪^∧_{G,x} is formally smooth of dimension 3 + 4 = 7 over E. BCGP25 Lemma 6.2.2 is the GSp₄ analogue ('exactly as in the proof of [Ger19, Lemma 3.7]'), with 16 in place of the GL_n count.

*Prerequisites.* `L7/ordinary-flag-scheme`, `R08.1/local-lifting-ring`, `R08.1/completion-at-points`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* David Geraghty (GERAGHTY-2019), Lemma 3.7 (preprint Lemma 3.2.3, p. 35), with Lemma 3.5 and Corollary 3.6 (preprint Lemma 3.2.1, p. 33; Corollary 3.2.2, p. 35); Jack Thorne (THORNE-2015), proof of Proposition 3.14, p. 17 (accepted manuscript).

#### `L7/geraghty-fixed-weight-ordinary-rings` — Geraghty's fixed-weight ordinary rings: components, connected fibres and irreducibility (theorem)

Let F_w/ℚ_l be finite, K ⊃ all embeddings of F_w, λ_w ∈ (ℤ^n_+)^{Hom(F_w,K)}, and χ_j^{λ_w} : I_{F_w} → 𝒪^×, σ ↦ ε(σ)^{−(j−1)}·Π_τ τ(Art^{−1}_{F_w}(σ))^{−λ_{τ,n−j+1}} (Geraghty's normalisation). Let ρ̄ : G_{F_w} → GL_n(𝔽) be arbitrary, R^{v_{λ_w},st} and R^{v_{λ_w},cr} Kisin's semistable and crystalline quotients of Hodge type v_{λ_w} (R08.3/pst-deformation-ring), G^{λ_w} ⊂ 𝓕 ×_𝒪 Spec R^{v_{λ_w},st} the closed subscheme of G_{F_w}-stable full flags on whose graded pieces I_{F_w} acts by χ_j^{λ_w}, and R^{△λ_w,st}, R^{△λ_w,cr} the quotients cut out by the scheme-theoretic images of G^{λ_w}[1/l] and of its crystalline part. (1) (Lemma 3.10) A map ζ : R^{v_{λ_w},st} → B to a finite local K-algebra factors through R^{△λ_w,st} (resp. R^{△λ_w,cr}) iff ζ∘ρ^□ is ordinary of weight λ_w (resp. and crystalline), and Spec R^{△λ_w,st}, Spec R^{△λ_w,cr} are unions of irreducible components of Spec R^{v_{λ_w},st}, Spec R^{v_{λ_w},cr}. (2) (Lemma 3.13) If ρ̄ is trivial, then for every closed point z of Spec Λ_w[1/l] the fibre G_z = G ×_{Spec Λ_w} Spec k(z) of the ordinary flag scheme of L7/ordinary-flag-scheme is connected. (3) (Lemma 3.14) If ρ̄ is trivial, then R^{△λ_w,cr} is irreducible when non-zero.

*Hypotheses and conventions.*
- Published numbering by the concordance recorded in the source GERAGHTY-2019: Lemma 3.10 = preprint Lemma 3.3.3, Lemma 3.13 = Lemma 3.4.2, Lemma 3.14 = Lemma 3.4.3; preprint statements are the ones planned.
- Ordinary of weight λ_w is L7/ordinary-of-weight-lambda (each χ_j agrees with χ_j^{λ_w} on an open subgroup of I_{F_w}); Geraghty's convention HT(ε) = −1 is translated there.
- Whether the arithmetic components G^{ar}_j exhaust the components of G[1/l] is not asserted (Geraghty Remark 3.4.4 proves it only if F_w contains no l-th roots of unity or n − 1 ≤ [F_w:ℚ_l]).

*Proof outline.* (1): the points of the image are the ordinary lifts by the valuative criterion and Lemma 3.9 (ordinary of weight λ_w implies potentially semistable of type v_{λ_w}, crystalline when the finite-order part is trivial and λ_w is regular). For the components, Kisin's ring is equidimensional of dimension [F_w:ℚ_l]·n(n−1)/2 + n² at points of the generic fibre (R08.3/pst-generic-fibre), and the argument of L7/ordinary-flag-scheme-local-structure with the inertial characters fixed bounds every component of 𝒪^∧_{G^{λ_w},x} below by the same number ('the difference of [F_w : ℚ_l]n is due to the fact that here we are fixing the inertial characters'); distinctness of the χ_j^{λ_w} gives each point a unique lift. (2): for trivial ρ̄, R^□ represents lifts of the maximal pro-l quotient G_{F_w}(l) (Lemma 3.12). Conjugating a point by a·d_t·(−)·d_t^{−1}·a^{−1} over 𝒪_E⟨a_{ij}, b, t⟩/(b·det(a_{ij}) − 1), d_t = diag(t^n, …, t), joins it (a = g, t = 1) to the diagonal point (a = 1, t = 0); the diagonal locus with fixed inertial characters is connected. (3): the argument of (2) shows that Spec R^{△λ_w,cr}[1/l] is connected; it is formally smooth, being a union of components of Kisin's formally smooth crystalline ring (R08.3/pcris-generic-smooth), hence irreducible; and R^{△λ_w,cr} is l-torsion free.

*Acceptance.* n = 1, ρ̄ trivial: R^{△λ_w,cr} is the crystalline character ring of weight λ_w, a power series ring over 𝒪, irreducible. BCGNT Lemma 5.1.4 is (3) at weight 0: two ordinary crystalline weight-0 lifts of the trivial representation connect.

*Prerequisites.* `L7/ordinary-flag-scheme`, `L7/ordinary-flag-scheme-local-structure`, `L7/ordinary-of-weight-lambda`, `R08.3/pst-deformation-ring`, `R08.3/pst-generic-fibre`, `R08.3/pcris-generic-smooth`.

*Sources.* David Geraghty (GERAGHTY-2019), Lemma 3.10 (preprint Lemma 3.3.3, p. 37); David Geraghty (GERAGHTY-2019), Lemmas 3.13–3.14 (preprint Lemmas 3.4.2–3.4.3, pp. 38–39).

#### `L7/trivial-residual-flag-ring` — The flag image ring for trivial residual representation (theorem)

(ACC+ Proposition 6.2.10, from Thorne 2015, Lemma 3.11 and Proposition 3.14.) Let ρ̄|_{G_{F_v}} be trivial and [F_v : ℚ_p] > n(n − 1)/2 + 1, and let Λ_v be a quotient of 𝒪⟦𝒪_{F_v}^×(p)ⁿ⟧ by an intersection of minimal primes (L8/ordinary-coefficient-ring). (1) (Lemma 3.11) The ordinary flag scheme 𝒢_v of L7/ordinary-flag-scheme is 𝒪-flat and reduced; for each minimal prime Q_v of Λ_v, 𝒢_v ⊗_{Λ_v} Λ_v/Q_v is 𝒪-flat and integral of dimension 1 + [F_v:ℚ_p]·n(n+1)/2 + n², and 𝒢_v ⊗_{Λ_v} Λ_v/(Q_v, λ) is integral. Hence the scheme-theoretic image R^△_v of 𝒢_v is already 𝒪-flat and reduced, and the definitions 'image of R^□_v in H⁰(𝒢_v, 𝒪)' (ACC+) and 'maximal reduced 𝒪-flat quotient of the image' (Thorne, Geraghty) agree. (2) (Corollary 3.12) For an integral R ∈ C_𝒪 with algebraically closed fraction field Ē, R^□_v → R factors through R^△_v iff ρ ⊗_R Ē has a G_{F_v}-stable full flag on whose graded pieces I_{F_v} acts by the specialisations of the universal characters. (3) (Lemma 3.13) Over the open U ⊂ Spec Λ_v where the universal characters ψ_i are pairwise distinct, 𝒢_{v,U} → Spec R^△_{v,U} is an isomorphism. (4) (Proposition 3.14) At a closed point x of Spec R^△_v[1/p] over y ∈ Spec Λ_v[1/p]: if the ψ_i mod y are pairwise distinct, the fibre over κ(y) is geometrically connected of dimension ≤ [F_v:ℚ_p]·n(n−1)/2 + n² + n(n−1)/2; if moreover ψ_i ≠ εψ_j mod y for i < j, it is regular of dimension [F_v:ℚ_p]·n(n−1)/2 + n² and Spec R^△_v[1/p] is regular at x of dimension [F_v:ℚ_p]·n(n+1)/2 + n². (5) For each minimal prime Q_v of Λ_v, R^△_v/Q_v is geometrically irreducible of dimension 1 + n² + [F_v:ℚ_p]·n(n+1)/2 and R^△_v/(Q_v, λ) is generically reduced; so R^△_v is 𝒪-flat, reduced and equidimensional, and Spec R^△_v → Spec Λ_v is bijective on generic points, hence on irreducible components.

*Hypotheses and conventions.*
- ρ̄ trivial; [F_v : ℚ_p] > n(n − 1)/2 + 1. The statement holds for p = 2 as well (BCGP25 Proposition 5.6.6(3), from Thorne Proposition 3.14(3)); under the degree hypothesis no flat closure is needed (BCGP25 Remark 5.6.7).
- Thorne's manuscript prints R_{v,U} without △ in Lemma 3.13; its integrality clause uses Lemma 3.11 and so the degree hypothesis.
- Thorne works with Λ_v = 𝒪⟦𝒪_{F_v}^×(p)ⁿ⟧; minimal primes of Λ_v generate minimal primes of R^△_v, so the case of a quotient by an intersection of minimal primes follows.

*Proof outline.* (1): G_{F_v}(p) is presented on d_v + 2 generators with one relation (Neukirch–Schmidt–Wingberg 7.5.8); the closed subscheme 𝒩 ⊂ B_n^{d_v+2} cut out by that relation, with the diagonal of the first generator fixed, is an 𝒪-flat normal complete intersection by a dimension count that needs d_v > n(n − 1)/2 + 1, and the completed local rings of 𝒢_v at closed points are formally smooth over those of 𝒩 (as in L7/ordinary-flag-scheme-local-structure (1)–(2)). (2): the image of 𝒢_v is 𝒪-flat and reduced by (1), so a map from an integral R factors through it iff the generic point lifts, which is the flag condition (valuative criterion, 𝓕 proper). (3): 𝒢_{v,U} → Spec R^△_{v,U} is projective with singleton fibres, hence finite, and surjective on completed local rings (Clozel–Harris–Taylor Lemma 2.4.6). (4): connected fibres from L7/geraghty-fixed-weight-ordinary-rings (2); the dimension and regularity from the tangent computation of L7/ordinary-flag-scheme-local-structure (3)–(4). (5): combine (1), (3) and (4): over U the components are the 𝒢_v ⊗ Λ_v/Q_v, and the complement of U has smaller dimension.

*Used by.* LocalGaloisDeformationRings:L8/determinant-flag-comparison — components of R^△_v over U.; PotentialAutomorphyInfrastructure:PA.3 — the local comparisons and component-support input of ACC+ §6.2 for comparing patched complexes under change of local deformation condition (red-team finding RT-AREA-langlands-2/22)

*Acceptance.* The dimension counts the framing n², the torus n[F_v:ℚ_p] and the Borel directions n(n − 1)/2·[F_v:ℚ_p].

*Prerequisites.* `L7/ordinary-flag-scheme`, `R08.1/local-tangent-obstruction`, `L7/ordinary-flag-scheme-local-structure`, `L7/geraghty-fixed-weight-ordinary-rings`, `L8/ordinary-coefficient-ring`.

*Sources.* Patrick B. Allen (ACC-POTENTIAL-AUTOMORPHY-CM-2023), §6.2.6, Proposition 6.2.10, p. 139 (arXiv v2; printed page = PDF page); George Boxer (BCGP-2025), Proposition 5.6.6 (3) and Remark 5.6.7, arXiv v1 p. 129; Jack Thorne (THORNE-2015), Lemma 3.11, Corollary 3.12, Lemma 3.13, Proposition 3.14, pp. 16–17 (accepted manuscript, 16 April 2014).

#### `L7/residually-split-nearly-ordinary-ring` — Nearly ordinary rings of a p-distinguished split residual representation (theorem)

(Skinner–Wiles Lemma 2.2 and Corollary 2.3.) Let n = 2, ρ_0 = χ ⊕ 1 on D = G_{F_v} with χ ≠ 1, d = [F_v : ℚ_p] and ω the mod-p cyclotomic character of D. There are a versal local 𝒪-deformation ρ : D → GL₂(R) of ρ_0 with det = χ̃ and a versal nearly ordinary deformation ρ_ord = (χ̃Ψ *; 0 Ψ^{−1}), Ψ ≡ 1, over R_ord, with R_ord ≅ 𝒪[[x_1, …, x_{2d+2}]]/(f) if χ = ω or ω = 1, and R_ord ≅ 𝒪[[x_1, …, x_{2d+1}]] otherwise. R_ord is a quotient of R by an ideal generated by d + ε elements, ε = 2 if χ = ω = χ^{−1}, ε = 1 if ω = 1, or χ = ω ≠ χ^{−1}, or χ ≠ ω = χ^{−1}, and ε = 0 otherwise.

*Hypotheses and conventions.*
- χ ≠ 1 (p-distinguished); p odd.

*Proof outline.* Schlessinger's criteria give versal (not universal: χ ⊕ 1 has automorphisms) rings. Tangent space of R_ord: r = dim ker(H¹(D, ad⁰ρ_0) → H¹(D, Hom(k(χ), k))) = 2d + 2 if χ = ω or ω = 1, 2d + 1 otherwise, by local duality and the local Euler characteristic. Relations: the obstruction map (I/𝔪I)^* → H²(D, k(χ)) ⊗ … is injective (the Mazur argument with the trivial-character ring 𝒪[[y_1, …, y_s]]/(h)), so I needs at most one generator, and none unless H²(D, k(χ)) ≠ 0, i.e. χ = ω. Corollary 2.3: R is a quotient of 𝒪[[y_1, …, y_{r′}]] with r′ = h¹(D, ad⁰ρ_0) = 3d + 1 + [ω = 1] + [χ = ω] + [χ^{−1} = ω]; compare with r.

*Used by.* OrdinaryAutomorphicFormsAndModularityLifting:R21.3/global-presentation-bound — the d + 2t local relations of Skinner–Wiles Proposition 2.4.

*Acceptance.* These are versal rings with fixed determinant χ̃; the global rings of Skinner–Wiles free the determinant afterwards. The formula for ε uses χ|_D, not χ globally.

*Prerequisites.* `R08.1/local-lifting-ring`, `R08.1/local-tangent-obstruction`, `DeformationAndDerivedPatchingAlgebra:R03.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* C. M. Skinner (SKINNER-WILES-1999), §2.1, Lemma 2.2, p. 11 (Numdam PDF page 8; printed page = PDF page + 3); C. M. Skinner (SKINNER-WILES-1999), §2.1, Corollary 2.3, p. 13 (Numdam PDF page 10; printed page = PDF page + 3).

#### `L7/fontaine-laffaille-deformation-condition` — The Fontaine–Laffaille deformation condition (construction)

Let l = p, F_ṽ/ℚ_l unramified, and K (integers 𝒪, residue field k) a coefficient field containing the images of all embeddings F_ṽ ↪ K̄. Use the Fontaine–Laffaille category 𝓜𝓕_{𝒪,ṽ} of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3/fl-filtered-modules (filtration in [0, l − 2], with 𝒪_{F_ṽ} ⊗_{ℤ_l} 𝒪-coefficients) and its covariant realisation 𝐆_ṽ(M) = U_S(Hom(M, F_ṽ/𝒪_{F,ṽ}{l − 2}))(2 − l) built from R07.3/fl-functor-torsion, which is exact, fully faithful and 𝒪-linear with essential image closed under subobjects and quotients (R07.3/fl-full-faithfulness, R07.3/fl-essential-image-subquotients; the covariant normalisation is PadicHodgeTheory R06.4/fontaine-laffaille-sign-dictionary). Assume r̄|_{G_{F_ṽ}} lies in the essential image of 𝐆_ṽ with dim_k(gr^i 𝐆_ṽ^{−1}(r̄) ⊗_{𝒪_{F_ṽ},τ̃} 𝒪) ≤ 1 for every i and τ̃. The Fontaine–Laffaille deformation problem 𝒟_ṽ consists of the lifts r of r̄ to R ∈ C_𝒪 such that r ⊗_R R′ lies in the essential image of 𝐆_ṽ for every Artinian quotient R′ of R. It is a local deformation problem in the sense of GlobalGaloisDeformations R04.3, its tangent space L_ṽ is the image of Ext¹_{𝓜𝓕_{k,ṽ}}(𝐆_ṽ^{−1}(r̄), 𝐆_ṽ^{−1}(r̄)) ↪ H¹(G_{F_ṽ}, ad r̄), and it is liftable (CHT Lemma 2.4.1). Only the deformation condition is constructed here; the filtered category, the functor and its full faithfulness are R07.3's.

*Hypotheses and conventions.*
- l = p, F_ṽ/ℚ_l unramified; Hodge–Tate weights in the Fontaine–Laffaille range [0, l − 2] and multiplicity-free for each embedding
- CHT use a covariant normalisation of Fontaine–Laffaille's contravariant U_S; the sign conventions are PadicHodgeTheory R06.4/fontaine-laffaille-sign-dictionary

*Construction.* 𝒟_ṽ is a local deformation problem because the essential image of 𝐆_ṽ is closed under subobjects, quotients and the fibre products of the Schlessinger conditions (CHT, first observed by Ramakrishna). Lemma 2.4.1: given r over R/I (𝔪_R I = 0), write M = 𝐆_ṽ^{−1}(r), M_τ̃ its τ̃-parts with jumps m_{τ̃,0} < ⋯ < m_{τ̃,n−1}; N_τ̃ = Rⁿ with Fil^j N_τ̃ = R^i for m_{τ̃,n−i} ≥ j > m_{τ̃,n−1−i}; lift the Φ^{m_{τ̃,i}} by reverse recursion on i so that Φ^{m_{τ̃,i}}|_{Fil^{m_{τ̃,i+1}}} = l^{m_{τ̃,i+1}−m_{τ̃,i}}Φ^{m_{τ̃,i+1}}; Nakayama gives an object N of 𝓜𝓕_{𝒪,ṽ}, and 𝐆_ṽ(N) lifts r.

*API.*
- `TauCeti.GaloisDeformation.Local.FLDeformation` (data): The condition 𝒟_ṽ on lifts of r̄|_{G_{F_ṽ}}: every Artinian quotient lies in the essential image of R07.3's realisation 𝐆_ṽ.
- `TauCeti.GaloisDeformation.Local.FLDeformation.isLocalDeformationProblem` (instance): 𝒟_ṽ is a local deformation problem (GlobalGaloisDeformations R04.3): stable under strict conjugation and closed (Schlessinger fibre products, inverse limits), because the essential image of 𝐆_ṽ is closed under subobjects, quotients and direct sums (R07.3/fl-essential-image-subquotients).
- `TauCeti.GaloisDeformation.Local.FLDeformation.mem_iff` (compatibility): For R Artinian, r ∈ 𝒟_ṽ(R) iff r ≅ 𝐆_ṽ(M) for some object M of R07.3's 𝓜𝓕_{𝒪,ṽ} with R-action; for general R ∈ C_𝒪, iff this holds for every Artinian quotient.
- `TauCeti.GaloisDeformation.Local.FLDeformation.tangentSpace` (characterisation): The tangent space of 𝒟_ṽ is L_ṽ = image of Ext¹_{𝓜𝓕_{k,ṽ}}(𝐆_ṽ^{−1}(r̄), 𝐆_ṽ^{−1}(r̄)) in H¹(G_{F_ṽ}, ad r̄), using the Ext comparison of R07.3.
- `TauCeti.GaloisDeformation.Local.FLDeformation.liftable` (characterisation): CHT Lemma 2.4.1: under the multiplicity-one hypothesis, every point over R/I (𝔪_R I = 0) lifts to R.
- `TauCeti.GaloisDeformation.Local.FLDeformation.baseChange` (functoriality): A map of Artinian coefficient algebras carries a lift in 𝒟_ṽ to a lift in 𝒟_ṽ, via the coefficient-compatible realisation of R07.3.

*Unit tests.*
- `fl_rank_one` (degenerate): For n = 1 the tangent space L_ṽ is the unramified classes H¹(G_{F_ṽ}/I_{F_ṽ}, ad r̄), of dimension 1 (CHT Corollary 2.4.4 with n = 1).
- `fl_elliptic_curve` (computation): E[l] for E/ℚ_l with good reduction, l ≥ 3: Hodge–Tate weights {0, 1} lie in [0, l − 2] and are multiplicity-free, so r̄ = E[l] satisfies the hypotheses and T_l E is a point of 𝒟_ṽ.
- `fl_weight_out_of_range` (non-example): A crystalline character with Hodge–Tate weight l − 1 is not in 𝒟_ṽ: R07.3's objects satisfy Fil^{l−1}M = 0.
- `fl_repeated_weight` (non-example): r̄ = ε ⊕ ε violates the multiplicity-one hypothesis for n = 2, so Lemma 2.4.1 does not apply.

*Used by.* LocalGaloisDeformationRings:L7/fontaine-laffaille-tangent-space-and-smoothness — the tangent-space count and smoothness.; GlobalGaloisDeformations:G7 — local conditions at v | l in the CHT/Taylor-II patching arguments.; PotentialAutomorphyInfrastructure:PA.3 — smooth local rings of known dimension for the patching count. (the arithmetic consumer is PA.3, which compares patched complexes under changes of local deformation condition; P9 keeps abstract hypotheses: red-team finding RT-AREA-langlands-2/22)

*Acceptance.* The multiplicity-one hypothesis on the graded pieces is what makes the filtration jumps m_{τ̃,i} strictly increasing; do not drop it.

*Prerequisites.* `R08.1/local-lifting-ring`, `GlobalGaloisDeformations:R04.3/local-deformation-problem`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-filtered-modules`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-functor-torsion`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-full-faithfulness`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-essential-image-subquotients`, `PadicHodgeTheory:R06.4/fontaine-laffaille-crystalline-comparison`, `PadicHodgeTheory:R06.4/fontaine-laffaille-sign-dictionary`.

*Sources.* Laurent Clozel (CHT08), §2.4.1, p. 33; Laurent Clozel (CHT08), §2.4.1, 𝒟_ṽ and Lemma 2.4.1, p. 35.

#### `L7/fontaine-laffaille-tangent-space-and-smoothness` — Fontaine–Laffaille deformations: tangent space and smoothness (CHT Lemma 2.4.2, Corollaries 2.4.3–2.4.4, Lemma 2.4.5) (theorem)

(Lemma 2.4.2.) For M, N in 𝓜𝓕_{k,ṽ} there is an exact sequence 0 → Hom_{𝓜𝓕}(M, N) → Fil⁰Hom(M, N) → Hom_{Fr⊗1}(gr M, N) → Ext¹_{𝓜𝓕}(M, N) → 0, the middle map sending β to (βΦ^i_M − Φ^i_Nβ). (Corollary 2.4.3.) dim_k L_ṽ − dim_k H⁰(G_{F_ṽ}, ad r̄) = [F_ṽ : ℚ_l]·n(n − 1)/2, and R_ṽ^{loc}/𝓘_ṽ is a power series ring over 𝒪 in n² + [F_ṽ : ℚ_l]·n(n − 1)/2 variables. (Corollary 2.4.4.) If n = 1 then L_ṽ = H¹(G_{F_ṽ}/I_{F_ṽ}, ad r̄). (Lemma 2.4.5.) If r̄|_{G_{F_ṽ}} = ⊕ s̄_i then H¹(G, ad r̄) = ⊕_{i,j} H¹(G, Hom(s̄_i, s̄_j)) and L_ṽ = ⊕_{i,j}(L_ṽ)_{i,j}, the images of Ext¹_{𝓜𝓕}(𝐆^{−1}(s̄_i), 𝐆^{−1}(s̄_j)).

*Hypotheses and conventions.*
- the hypotheses of L7/fontaine-laffaille-deformation-condition

*Proof outline.* Lemma 2.4.2: an extension E of M by N in 𝓜𝓕 splits as filtered modules, E = N ⊕ M, with Φ^i_E = (Φ^i_N α_i; 0 Φ^i_M); two such α are equivalent exactly when they differ by βΦ_M − Φ_Nβ for a filtration-preserving β. Corollary 2.4.3: decompose by τ̃; dim Fil⁰Hom(𝐆^{−1}(r̄)_τ̃, 𝐆^{−1}(r̄)_τ̃) = n(n + 1)/2 by the multiplicity-one hypothesis and dim Hom(gr 𝐆^{−1}(r̄)_τ̃, 𝐆^{−1}(r̄)_{τ̃∘Fr^{−1}}) = n²; the second part from the first, Lemma 2.4.1 and the dimension formula for liftable problems (GlobalGaloisDeformations, CHT Definition 2.2.2). Corollary 2.4.4: L_ṽ ⊇ H¹(G/I, ad r̄), and the dimensions agree. Lemma 2.4.5: 'clear' from additivity of Ext. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* Check the count at n = 2, F_ṽ = ℚ_l: L_ṽ has dimension dim H⁰(ad r̄) + 1, and R^{loc}/𝓘 has 5 variables (checked in the Lean file).

*Prerequisites.* `L7/fontaine-laffaille-deformation-condition`, `R08.1/local-lifting-ring`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Laurent Clozel (CHT08), §2.4.1, Lemma 2.4.2, p. 35; Laurent Clozel (CHT08), §2.4.1, proof of Lemma 2.4.2 and Corollary 2.4.3, p. 36; Laurent Clozel (CHT08), §2.4.1, Corollary 2.4.4 and Lemma 2.4.5, p. 37.

#### `L7/ordinary-condition-fixed-inertial-characters` — Ordinary deformations with fixed inertial characters on a full flag (CHT §2.4.2) (construction)

Let l = p and choose characters χ_{v,i} : G_{F_ṽ} → 𝒪^× (i = 0, …, n − 1) such that (1) r̄ has a decreasing filtration {Fil̄^i} by k[G_{F_ṽ}]-submodules with gr̄^i r̄ ≅ k(χ_{v,i}), and (2′) for i < j, χ̄_{v,j}/χ̄_{v,i} is neither trivial nor the mod-l cyclotomic character ε̄ (the condition the proofs use; CHT print the inverse ratio, source issue LocalGaloisDeformationRings/E2). Then {Fil̄^i} is unique. 𝒟_v consists of the lifts r of r̄ to R such that Rⁿ has a decreasing filtration {Fil^i} by R[G_{F_ṽ}]-submodules with Fil^i ⊗_R k ≅ Fil̄^i and I_{F_ṽ} acting on gr^iRⁿ by χ_{v,i}; the Fil^i are then free direct summands and gr^iRⁿ ≅ R(χ′_i) with χ′_i an unramified twist of χ_{v,i} reducing to χ_{v,i} mod λ. (Lemma 2.4.6.) (1) Such a filtration is unique; (2) for R ↪ S injective in 𝒞_𝒪 and r over R with (S, r) ∈ 𝒟_v, (Fil^i_S ∩ Rⁿ) ⊗_R S ≅ Fil^i_S; (3) 𝒟_v is a local deformation problem.

*Hypotheses and conventions.*
- condition (2′) is CHT's 'easiest possible case' with the ratio the proofs need; they note it can be weakened but not how far, and that the section is not needed for their modularity applications
- CHT print (2) as 'χ̄_{v,i}/χ̄_{v,j} is neither trivial nor the cyclotomic character' (i < j), which allows χ̄_{v,j}/χ̄_{v,i} = ε̄; then Lemma 2.4.8 fails (E2)
- this fixes the characters on inertia; L7/ordinary-flag-scheme (ACC+ §6.2.6) lets the characters vary over Λ_v, and CHT's 𝒟_v is its fibre over the point of Λ_v given by the χ_{v,i}|_{I}

*Construction.* Lemma 2.4.6 (1)–(2): by induction reduce to Fil^{n−1}; choose σ_i with χ̄_{v,i}(σ_i) ≠ χ̄_{v,n−1}(σ_i), factor the characteristic polynomial P_i of r(σ_i) by Hensel as R_i(X)Q_i(X) with R_i lifting (X − χ̄_{v,n−1}(σ_i))^{a_i}, and set e = Π_i Q_i(r(σ_i)); e kills gr^i for i ≤ n − 2 and is an isomorphism on Fil^{n−1}, so Fil^{n−1} = eRⁿ. (3) from (1) and (2) with the conditions of CHT Definition 2.2.2.

*API.*
- `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia` (data): The condition 𝒟_v with its characters χ_{v,i}.
- `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.filtration` (constructor): The filtration Fil^i of a lift in 𝒟_v.
- `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.filtration_unique` (characterisation): Lemma 2.4.6(1).
- `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.filtration_baseChange` (compatibility): Lemma 2.4.6(2).
- `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.isLocalDeformationProblem` (instance): Lemma 2.4.6(3).
- `TauCeti.GaloisDeformation.Local.OrdinaryFixedInertia.graded_character` (simp): For a lift satisfying the fixed-inertia ordinary condition, the action of σ∈I_v on gr^i of its unique filtration is multiplication by χ_{v,i}(σ); this statement is compatible with the source’s one-based ordering.

*Unit tests.*
- `ord_n1` (degenerate): For n = 1, 𝒟_v is the lifts with inertial character χ_{v,0}.
- `ord_n2_distinct` (computation): For n=2 write ρ̄=(χ̄₁ *;0 χ̄₀) with χ̄₁/χ̄₀ ≠ 1,ω. The decreasing filtration has Fil¹ equal to the unique line carrying the prescribed χ̄₁; its quotient carries χ̄₀.
- `ord_cyclotomic_ratio_excluded` (non-example): r̄ = ω ⊕ 1 on G_{ℚ_l} with ω on the sub (χ̄_1 = ω, χ̄_0 = 1, l > 3) satisfies CHT's printed (2) but not (2′); there H²(G, k(ω)) ≠ 0 and the ring is not formally smooth (E2).
- `ord_vs_flag_scheme` (compatibility): The lifts in 𝒟_v are the points of L7/ordinary-flag-scheme's image over the fixed characters.

*Used by.* LocalGaloisDeformationRings:L7/ordinary-fixed-inertial-characters-smoothness — liftability and the power series ring.; GlobalGaloisDeformations:G7 — ordinary local conditions in rank n with fixed Hodge–Tate data.; OrdinaryAutomorphicFormsAndModularityLifting:R21.3 — comparison with Skinner–Wiles' nearly ordinary rings (characters varying).

*Acceptance.* Check that the filtration is determined by the characters: condition (2) forbids equal residual characters, so e separates the pieces.

*Prerequisites.* `R08.1/local-lifting-ring`, `L7/ordinary-flag-scheme`.

*Sources.* Laurent Clozel (CHT08), §2.4.2, the characters χ_{v,i}, p. 37; Laurent Clozel (CHT08), §2.4.2, 𝒟_v and Lemma 2.4.6, p. 38.

#### `L7/ordinary-fixed-inertial-characters-smoothness` — Ordinary deformations with fixed inertial characters are formally smooth (CHT Lemmas 2.4.7–2.4.8) (theorem)

Under (2′): (Lemma 2.4.7.) 𝒟_v is liftable. (Lemma 2.4.8.) R_v^{loc}/𝓘_v is a power series ring over 𝒪 in n² + [F_ṽ : ℚ_l]·n(n − 1)/2 variables, and dim_k L_v − dim_k H⁰(G_{F_ṽ}, ad r̄) = [F_ṽ : ℚ_l]·n(n − 1)/2.

*Hypotheses and conventions.*
- conditions (1) and (2′) of L7/ordinary-condition-fixed-inertial-characters; with CHT's printed (2) both lemmas can fail (E2)

*Proof outline.* Lemma 2.4.7: lift the filtration by reverse induction on i, each step an extension of gr̃^i by Fil̃^{i+1}; the obstruction lies in H²(G, Hom(gr^ir̄, Fil^{i+1}r̄)) ⊗ I, dual by local duality to H⁰(G, Hom(Fil^{i+1}r̄, gr^ir̄)(1)), which vanishes because χ̄_{v,i}ε/χ̄_{v,j} ≠ 1 for j > i. Lemma 2.4.8: count lifts to k[ε]/(ε²): after putting r̄ in the Borel B_n, the lifts map onto the flags lifting Fil̄ with kernel the 'suitable' lifts to B_n(k[ε]/(ε²)), of dimension n(n + 1)/2 + [F_ṽ : ℚ_l]n(n − 1)/2 by induction on n: the new column is a fibre of Z¹(G, χ̄_{v,0}^{−1}r̄′ ⊗ k[ε]/(ε²)) ↠ Z¹(G, χ̄_{v,0}^{−1}r̄′) of dimension (1 + [F_ṽ : ℚ_l])(n − 1), by the local Euler characteristic and H²(G, χ̄_{v,0}^{−1}r̄′) = 0. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* The dimension equals that of the Fontaine–Laffaille condition (Corollary 2.4.3); check both counts at n = 2 in the Lean file.

*Prerequisites.* `L7/ordinary-condition-fixed-inertial-characters`, `R08.1/local-lifting-ring`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Laurent Clozel (CHT08), §2.4.2, proof of Lemma 2.4.7, p. 39; Laurent Clozel (CHT08), §2.4.2, proof of Lemma 2.4.8, p. 40.

#### `L7/discrete-series-deformation-condition` — Discrete series deformations away from l (CHT §2.4.5) (construction)

Let l ≠ p, n = md and r̃_v : G_{F_ṽ} → GL_d(𝒪) continuous with (1) r̃_v ⊗ k absolutely irreducible, (2) every irreducible subquotient of (r̃_v ⊗ k)|_{I_{F_ṽ}} absolutely irreducible, and (3) r̃_v ⊗ k ≇ r̃_v ⊗ k(i) for i = 1, …, m. (Lemma 2.4.23.) r̃_v ≅ Ind_{G_{F′_ṽ}}^{G_{F_ṽ}} s_v for the unramified F′_ṽ of degree d₁ and s_v with s_v|_I ⊗ k absolutely irreducible and not conjugate-isomorphic; a lift ρ with ρ|_I ≅ r̃_v|_I ⊗ R is Ind(s_v ⊗ R(χ)) for a unique unramified χ; and Z_{GL_d(R)}(r̃_v(I)) ↠ Z_{GL_d(R/I)}(r̃_v(I)). (Definition 2.4.24.) ρ : G_{F_ṽ} → GL_n(R) is r̃_v-discrete series if it has a decreasing filtration {Fil^i} by R-direct summands with gr^iρ ≅ (gr⁰ρ)(i) for i = 1, …, m − 1 and (gr⁰ρ)|_I ≅ r̃_v|_I ⊗ R. (Lemma 2.4.25.) The filtration is unique. (Lemma 2.4.26.) If r̄ is r̃_v-discrete series, its r̃_v-discrete series lifts form a local deformation problem 𝒟_v.

*Hypotheses and conventions.*
- l ≠ p; condition (2) 'is probably unnecessary' (CHT) but simplifies the section
- for d = 1, m = n and r̃_v trivial this is a Steinberg-type condition; compare R08.2/steinberg-condition (Taylor II's D^{Stein}), which instead fixes characteristic polynomials and takes the flat closure

*Construction.* Lemma 2.4.23: an irreducible r̄₁ ⊂ r̃_v|_I ⊗ k extends to its stabiliser H (H/I pro-cyclic), r̃_v ⊗ k ≅ Ind_H r̄₁, and the decomposition r̃_v|_I = r₁ ⊕ ⋯ ⊕ r_{d₁} lifts modulo λ^t by induction since H¹(I, Hom(r̄_i, r̄_j)) = 0 for i ≠ j. Lemma 2.4.25: the residual twists ε^i are distinct for i = 1, …, m, so the gr⁰ of two filtrations agree and Fil^i is recovered by reverse induction as the maximal submodule with the prescribed subquotients. Lemma 2.4.26: the conditions of CHT Definition 2.2.2, using Lemmas 2.1.8, 2.1.9, 2.4.23(3) and 2.4.25.

*API.*
- `TauCeti.GaloisDeformation.Local.DiscreteSeriesType` (structure): (m, d, r̃_v) with conditions (1)–(3).
- `TauCeti.GaloisDeformation.Local.IsDiscreteSeriesLift` (data): Definition 2.4.24: the filtration with gr^i ≅ gr⁰(i) and gr⁰|_I ≅ r̃_v|_I ⊗ R.
- `TauCeti.GaloisDeformation.Local.IsDiscreteSeriesLift.filtration_unique` (characterisation): Lemma 2.4.25.
- `TauCeti.GaloisDeformation.Local.discreteSeriesDeformation` (instance): Lemma 2.4.26: a local deformation problem.
- `TauCeti.GaloisDeformation.Local.DiscreteSeriesType.induced` (characterisation): Lemma 2.4.23: r̃_v ≅ Ind s_v.
- `TauCeti.GaloisDeformation.Local.DiscreteSeriesType.filtration_baseChange` (functoriality): The unique direct-summand filtration of a discrete-series lift pulls back along every allowed coefficient map; its graded identifications and the fixed prime-to-p inertia representation pull back with it.

*Unit tests.*
- `ds_steinberg` (compatibility): d = 1, m = n, r̃_v trivial: the unipotent-monodromy (Steinberg) lifts with Frobenius eigenvalues α, qα, …, q^{n−1}α.
- `ds_m1` (degenerate): m = 1: lifts with ρ|_I ≅ r̃_v|_I ⊗ R, i.e. minimally ramified type r̃_v.
- `ds_condition3_fails` (non-example): If q ≡ 1 mod p then k(1) ≅ k and condition (3) fails for i = 1.
- `ds_induced_type` (computation): d = 2 with r̃_v induced from the unramified quadratic extension (a supercuspidal type).

*Used by.* LocalGaloisDeformationRings:L7/discrete-series-smoothness — liftability and smoothness.; GlobalGaloisDeformations:G7 — local conditions at places where π_v is discrete series (CHT, Taylor II).; LocalGaloisDeformationRings:R08.2/ihara-avoidance-components — comparison with the Steinberg components of Taylor II.

*Acceptance.* For d=1,m=n=2 the discrete-series hypothesis requires the residual cyclotomic twists to be distinct. Compare its Frobenius chain α,qα with the Steinberg characteristic-polynomial relation; do not apply the functor at q≡1 mod p, where hypothesis (3) fails.

*Prerequisites.* `R08.1/local-lifting-ring`, `R08.2/steinberg-condition`.

*Sources.* Laurent Clozel (CHT08), §2.4.5, the set-up, p. 47; Laurent Clozel (CHT08), §2.4.5, Definition 2.4.24, p. 49.

#### `L7/discrete-series-smoothness` — Discrete series deformations are formally smooth of relative dimension n² (CHT Lemmas 2.4.27–2.4.30) (theorem)

(Lemma 2.4.27.) 𝒟_v is liftable. (Lemma 2.4.28.) R_v^{loc}/𝓘_v is a power series ring in n² variables over 𝒪. (Corollary 2.4.29.) dim_k L_v = dim_k H⁰(G_{F_ṽ}, ad r̄). (Lemma 2.4.30.) If d = 1 and m = n, with Fil¹ ad r̄ the endomorphisms x with x Fil^i r̄ ⊂ Fil^{i+1} r̄, then L_v = H¹(G/I, k1_n) ⊕ ker(H¹(G, ad⁰r̄) → H¹(G, ad r̄/Fil¹ ad r̄)).

*Hypotheses and conventions.*
- r̄ is r̃_v-discrete series (L7/discrete-series-deformation-condition)

*Proof outline.* Lemma 2.4.27: induction on m; the obstruction to extending a lift of r/Fil^{m−1}r lies in H², which by local duality is controlled by H⁰(G, Hom(gr⁰r′, r′/Fil^{m−1}r′)(2 − m)), and H⁰(G, Hom(gr⁰, gr^i)(2 − m)) = 0 for i = 0, …, m − 3. Lemma 2.4.28: the space of r̃_v-discrete series liftings to k[ε]/(ε²) has dimension d(n − d) + (n − d)² + (d² − 1) + (d(n − d) + 1) = n², by induction on m and the local Euler characteristic. Corollary 2.4.29 from Lemma 2.4.28; Lemma 2.4.30 'self-explanatory'. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* Check the dimension identity d(n − d) + (n − d)² + (d² − 1) + (d(n − d) + 1) = n² in the Lean file.

*Prerequisites.* `L7/discrete-series-deformation-condition`, `R08.1/local-lifting-ring`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Laurent Clozel (CHT08), §2.4.5, Lemma 2.4.27, p. 51; Laurent Clozel (CHT08), §2.4.5, proof of Lemma 2.4.28, p. 52; Laurent Clozel (CHT08), §2.4.5, Lemma 2.4.30, p. 53.

#### `L7/ordinary-of-weight-lambda` — Ordinary representations of weight λ (definition)

Let K/ℚ_p be finite, E ⊃ K-Galois closure large, and λ = (λ_{τ,1} ≥ ⋯ ≥ λ_{τ,n})_{τ : K ↪ E} a dominant weight. A continuous ρ : G_K → GL_n(B) (B a finite E-algebra, or 𝒪_{E′}) is ordinary of weight λ if it is conjugate to an upper-triangular representation with diagonal characters χ₁, …, χ_n (in that order) such that, for every i, the character x ↦ χ_i(Art_K(x))·Π_τ τ(x)^{λ_{τ,n−i+1}+i−1} of 𝒪_K^× has finite order (equivalently, χ_i(Art_K(α)) = Π_τ τ(α)^{−(λ_{τ,n−i+1}+i−1)} for α ∈ 𝒪_K^× close to 1). It is semistable-ordinary of weight λ if the χ_i satisfy the identity on all of I_K: χ_j(σ) = Π_τ τ(Art_K^{-1}(σ))^{−λ_{τ,n+1−j}−(j−1)}. The flag is part of the condition; a condition on characteristic polynomials alone is not equivalent (L8).

*Hypotheses and conventions.*
- Conventions: Art_K is the local Artin map sending uniformisers to geometric Frobenius (Tau Ceti ClassFieldTheory Layer 7), so ε∘Art_K(x) = Π_τ τ(x) for x ∈ 𝒪_K^×. For K = ℚ_p the condition says χ_i|_{I} = ε^{−(λ_{n−i+1}+i−1)} up to a finite-order character (exactly, for semistable-ordinary).
- Hodge–Tate weights. In the convention of PadicHodgeTheory R06.2, HT(ε) = +1, χ_i has τ-labelled Hodge–Tate weight −(λ_{τ,n−i+1} + i − 1). These weights strictly decrease along the flag ⟨e₁⟩ ⊂ ⟨e₁, e₂⟩ ⊂ ⋯, so the sub-objects carry the larger weights, as in PadicHodgeTheory R06.4/ordinary-representation. A semistable-ordinary representation of weight λ is therefore ordinary in R06.4's sense, with no dualisation. An ordinary representation of weight λ is ordinary in that sense after restriction to G_{K′} for a finite extension K′/K killing the finite-order factors. In the convention HT(ε) = −1 of Caraiani–Newton, Boxer–Calegari–Gee–Pilloni and Newton–Thorne, the same weights read λ_{τ,n−i+1} + i − 1 ≥ 0.
- The finite-order factor in the first definition is part of the condition (Newton–Thorne Definition 2.5(2)); it makes ordinary representations potentially semistable, while semistable-ordinary ones are semistable.
- Comparison with Khare–Wintenberger and BLGGT. Those papers normalise the Galois representation of a weight-k eigenform as ρ_f with Hodge–Tate weights {0, k − 1} (HT(ε) = +1), and ordinary means ρ_f|_{G_{ℚ_p}} ≅ (ε^{k−1}ψ₁ ∗; 0 ψ₂) with ψ_i unramified. The representation of weight λ = (k − 2, 0) in this node's normalisation is ρ_f^∨ ≅ (ψ₂^{−1} ∗; 0 ε^{1−k}ψ₁^{−1}) after reordering the basis. Translate between the two by dualising and reversing the flag, never by identifying the upper-triangular forms.

*Construction.* Ordinary of weight λ ⟹ potentially semistable of p-adic Hodge type v_λ (PadicHodgeTheory:R06.4/ordinary-implies-semistable); semistable-ordinary ⟹ semistable of type v_λ (Geraghty Lemma 3.9).

*API.*
- `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight` (data): The predicate: ρ has a G_K-stable full flag whose graded characters χ_i satisfy χ_i∘Art_K ≡ Π_τ τ^{−(λ_{τ,n−i+1}+i−1)} up to finite order on 𝒪_K^×.
- `TauCeti.GaloisDeformation.Local.IsSemistableOrdinaryOfWeight` (data): The same with equality on I_K.
- `TauCeti.GaloisDeformation.Local.IsSemistableOrdinaryOfWeight.isOrdinary` (other): Semistable-ordinary of weight λ implies ordinary of weight λ.
- `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight.potentiallySemistable` (compatibility): Ordinary of weight λ implies potentially semistable of Hodge type v_λ; semistable-ordinary implies semistable of type v_λ.
- `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight.flag_unique` (characterisation): If the χ_i are pairwise distinct on I_K, the flag is unique.
- `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight.restrict` (functoriality): Ordinary of weight λ is preserved by restriction to G_{K′} (with the restricted weight).
- `TauCeti.GaloisDeformation.Local.IsOrdinaryOfWeight.baseChange` (functoriality): A coefficient map between the allowed finite E-algebras carries the stable full flag of direct summands and its ordered inertia characters to an ordinary flag of the same weight. Exact semistable-ordinary characters are preserved as well.

*Unit tests.*
- `ordinaryWeight_n1` (computation): n = 1, λ = (λ_τ): χ_p^{-1}-normalised, ρ = χ_λ·(unramified) is ordinary of weight λ; ρ = χ_λ·ω (ω ramified of order p) is ordinary but not semistable-ordinary.
- `ordinaryWeight_weight_zero` (degenerate): For n=2 and λ=(0,0), the ordered inertia characters are 1 and ε_p⁻¹. Weight zero is not the condition that both diagonal characters are unramified.
- `ordinaryWeight_charpoly_not_enough` (non-example): For n=2, λ=(0,0), a nonsplit extension with subcharacter ε_p⁻¹ and quotient 1 has the same characteristic polynomials as 1⊕ε_p⁻¹ but lacks a stable subline carrying 1. It fails CN’s prescribed ordering despite the determinant equations.
- `ordinaryWeight_KW` (compatibility): For n=2, λ=(k−2,0), CN’s ordered inertia characters are 1 and ε_p^{−(k−1)}. Dualizing and reversing the flag gives KW’s higher-weight subline χ_p^{k−1} and weight-zero quotient. This is a duality comparison, not equality of the original ordered representations.

*Used by.* Newton–Thorne 2026, Theorem 1.1 and §2 — the automorphic ordinarity predicate and its Galois counterpart; BCGP25 §5.6 — ordinary of weight λ at places above 2; CN23 §3.3 — the semistable-ordinary quotient R^{△,λ}; LocalGaloisDeformationRings:L7/semistable-ordinary-quotient — its points; LocalGaloisDeformationRings:L7/ordinary-flag-scheme — the flag scheme specialises at weight λ to this condition

*Acceptance.* n = 1: ρ is ordinary of weight λ iff ρ|I_K is χ_λ times a finite-order character. K = ℚ_p, n = 2, λ = (0, 0): ordinary of weight λ means ρ ≅ (χ₁ ∗; 0 χ₂) with χ₁ unramified and χ₂|_I = ε^{−1} up to finite order; it has Hodge–Tate weights {0, −1} (HT(ε) = +1), the sub-line having weight 0; its dual is (ε ∗; 0 1)-shaped, the ordinary weight-2 shape of Khare–Wintenberger.

*Prerequisites.* `R08.1/local-lifting-ring`, `PadicHodgeTheory:R06.4/ordinary-representation`, `PadicHodgeTheory:R06.4/ordinary-implies-semistable`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

*Sources.* James Newton (NT-2026), Definition 2.5(2), arXiv v2 p. 12; George Boxer (BCGP-2025), Definition 5.6.8, arXiv v1 pp. 129–130; Ana Caraiani (CN-2023), Definition 3.3.1, arXiv v3 pp. 50–51.

#### `L7/semistable-ordinary-quotient` — Semistable-ordinary quotients of semistable lifting rings (theorem)

Let λ be dominant for (Res_{K/ℚ_p} GL_n)_E and ρ̄ : G_K → GL_n(k). (1) (Kisin) There are unique 𝒪-flat quotients R^{st,λ}_ρ̄ and R^{cris,λ}_ρ̄ of R^□_ρ̄ whose maps to finite E-algebras B are exactly the lifts that are semistable (resp. crystalline) of p-adic Hodge type v_λ; R^{st,λ}_ρ̄ is reduced (Bellovin–Gee) and R^{cris,λ}_ρ̄[1/p] is regular. (2) If B is a finite local E-algebra, ρ_B semistable of Hodge type v_λ and ρ_B ⊗ B/𝔪_B semistable-ordinary of weight λ, then ρ_B is semistable-ordinary of weight λ. (3) There is a unique 𝒪-flat quotient R^{△,λ}_ρ̄ whose B-points are the semistable-ordinary lifts of weight λ; Spec R^{△,λ}_ρ̄[1/p] is open and closed in Spec R^{st,λ}_ρ̄[1/p], so R^{△,λ}_ρ̄ is reduced.

*Hypotheses and conventions.*
- Caraiani–Newton print the tensor products in Theorem 3.3.3 over R^{st,λ} rather than over R^□ (their source issue E1); the universal lift over R^□ is meant.
- (3) is the union of components of the semistable ring on which the lift is ordinary; it is not the flat closure of an arbitrary ordinary locus.

*Proof outline.* (1): R08.3/pst-deformation-ring and R08.3/pcris-generic-smooth (Kisin 2.7.6, 2.7.7, 3.3.8), reducedness of R^{st,λ} from R08.3/g-valued-pst-rings (Bellovin–Gee Theorem 3.3.3). (2): the Hodge–Tate weights of the characteristic-zero lift ρ are strictly increasing, v_i = (1/e)Σ_τ(λ_{τ,n+1−i} + i − 1); the generalised φ^f-eigenspace filtration of D_st(ρ_B) is weakly admissible with rank-one graded pieces, giving the flag over B. (3): Geraghty Lemma 3.10 gives the ordinary quotient; by (2) its generic fibre is open (stable under infinitesimal deformation within the semistable ring) and closed (properness of the flag variety).

*Acceptance.* n = 2, K = ℚ_p, λ = (0, 0): Spec R^{st,λ}[1/p] is the union of the crystalline and the semistable non-crystalline loci; the latter is entirely ordinary (PadicHodgeTheory R06.4/two-dimensional-ordinarity-criterion (b)).

*Prerequisites.* `L7/ordinary-of-weight-lambda`, `R08.3/pst-deformation-ring`, `R08.3/pcris-generic-smooth`, `R08.3/g-valued-pst-rings`, `L7/ordinary-flag-scheme`.

*Sources.* Ana Caraiani (CN-2023), Lemma 3.3.2, arXiv v3 p. 51; Ana Caraiani (CN-2023), Theorem 3.3.3, arXiv v3 p. 52.

#### `L7/g-valued-ordinary-condition` — G-valued ordinary representations of weight λ (definition)

Let G be a split connected reductive group over 𝒪 (more generally smooth affine with split reductive G⁰) and T_G its canonical torus: T_G = B/R_u(B) for any Borel B ⊂ G, canonically independent of B (G(𝒪)-conjugacy of Borels and N_G(B) = B); fix B₀ ⊃ T₀ and identify T_G ×_𝒪 A with B₀/R_u(B₀) ×_𝒪 A. For v | p and cocharacters λ_τ : 𝔾_m → T_G (τ ∈ Hom_{ℚ_p}(F_v, E)), χ_λ : I_{F_v} → T_G(𝒪) is χ_λ(σ) = Π_τ λ_τ(τ(rec_v^{-1}(σ))), rec_v taking uniformisers to geometric Frobenius. For a finite local E-algebra A and finite F′_v/F_v, ρ : G_{F_v} → G(A) is F′_v-ordinary of weight λ if there is a Borel B ⊂ G_A with ρ(G_{F_v}) ⊂ B(A) such that, for g ∈ G(A) with gBg^{-1} = B₀, the composite G_{F_v} → B(A) → B₀(A) → T_G(A) equals χ_λ on I_{F′_v} (independent of g). For dominant regular λ this has p-adic Hodge type v_λ.

*Hypotheses and conventions.*
- For G = GL_n, F′_v = F_v up to the finite-order ambiguity, this is L7/ordinary-of-weight-lambda (the canonical torus is the diagonal torus and χ_λ the product of the τ-components).
- Definition B.2 applies to lifts, not to the residual representation (extraction issue E29).
- Borel subgroups, maximal tori, their conjugacy and N_G(B) = B over fields are Tau Ceti ReductiveGroups Layer 7, and split groups over ℤ (base-changed to 𝒪) are its Layer 9. The relative statement used here is SGA3 Exp. XXII 5.8.3 and Exp. XXVI 3.3. It says that for a split reductive G over 𝒪 with Borel B₀ ⊃ T₀, the Borel subgroups of G_A over a local 𝒪-algebra A are G(A)-conjugate to B₀, and the functor of Borels is represented by G/B₀. That statement is relative theory, which Tau Ceti's Layer 8 places on its long horizon; it is recorded as a gap. For G = GL_n (full flags) and G = GSp₄ (isotropic flags) the Borels and T_G are explicit, and the gap does not apply.

*Construction.* Independence of g: two choices differ by N_G(B₀) = B₀, which acts trivially on B₀/R_u(B₀).

*API.*
- `TauCeti.GaloisDeformation.Local.canonicalTorus` (data): T_G = B/R_u(B), canonically independent of B.
- `TauCeti.GaloisDeformation.Local.chiLambda` (constructor): χ_λ : I_{F_v} → T_G(𝒪) attached to cocharacters λ_τ.
- `TauCeti.GaloisDeformation.Local.IsGOrdinary` (data): ρ : G_{F_v} → G(A) is F′_v-ordinary of weight λ.
- `TauCeti.GaloisDeformation.Local.IsGOrdinary.gl` (compatibility): For G = GL_n, IsGOrdinary is IsOrdinaryOfWeight of L7/ordinary-of-weight-lambda (with finite-order ambiguity absorbed by F′_v).
- `TauCeti.GaloisDeformation.Local.IsGOrdinary.map` (functoriality): Ordinarity is preserved by central isogenies G → G′ with the induced weight.

*Unit tests.*
- `gOrdinary_torus` (degenerate): G = T a torus: B = T, T_G = T and ρ is F′_v-ordinary of weight λ iff ρ|I_{F′_v} = χ_λ.
- `gOrdinary_GL2` (compatibility): G = GL₂: agrees with L7/ordinary-of-weight-lambda for n = 2.
- `gOrdinary_GSp4` (computation): G = GSp₄, λ regular: ordinary means a stable symplectic full flag with graded characters (χ₁, χ₂, ε^{-1}χ₂^{-1}, ε^{-1}χ₁^{-1}) of the prescribed inertial weights (BCGP25 §1.8.10).
- `gOrdinary_not_residual` (non-example): The definition is for lifts to finite E-algebras; a residual ρ̄ with a stable Borel is not 'ordinary of weight λ' (χ_λ mod 𝔪 loses the weight).

*Used by.* FKP 2022, Appendix B — ordinary components of G-valued crystalline rings for global lifting; BCG 2025, proof of Theorem 2.1 — ordinary components in the GL_n weight-zero argument; LocalGaloisDeformationRings:L7/g-valued-ordinary-quotient — the points of the ordinary quotient

*Acceptance.* G = GL₂, λ_τ = (1, 0) for all τ: χ_λ = (Π_τ τ∘rec^{-1}, 1) and F_v-ordinary of weight λ means a stable line with inertia acting by Π_τ τ∘rec^{-1} on it and trivially on the quotient.

*Prerequisites.* `R08.1/g-valued-framed-ring`, `L7/ordinary-of-weight-lambda`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

*Sources.* Najmuddin Fakhruddin (FKP-2022), Appendix B, arXiv v5 p. 52; Najmuddin Fakhruddin (FKP-2022), Definition B.2, arXiv v5 p. 52.

#### `L7/g-valued-ordinary-quotient` — The G-valued ordinary flag scheme and the ordinary quotient R^{△λ} (construction)

Keep L7/g-valued-ordinary-condition and let R^{□,v_λ}_ρ̄ be the potentially semistable G-valued lifting ring of Hodge type v_λ (R08.3/g-valued-pst-rings) with universal lift ρ^λ. Let 𝒢 ⊂ Fl_G be the closed subscheme of Borels fixed by ρ^λ_A(G_{F_v}), and 𝒢_λ ⊂ 𝒢 the subfunctor of B such that, Zariski-locally with gBg^{-1} = B₀, the projection of gρ^λ(σ)g^{-1} to T_G equals χ_λ(σ) for σ ∈ I_{F′_v}. (1) 𝒢_λ is representable by a closed subscheme of 𝒢, cut out by the ideal generated by the c_{β,σ} (β positive roots, defined by c_{β,σ}X_β = p_β(Ad(gρ^λ(σ)g^{-1})X_β) − β(χ_λ(σ))X_β) together with ψ(t) − ψ(χ_λ(σ)) for ψ in a basis of X*(T₀) (the central generators). (2) R^{△λ}_ρ̄ is the scheme-theoretic image of 𝒢_λ[1/p] → Spec R^{□,v_λ}_ρ̄; Λ : 𝒢_λ → Spec R^{□,v_λ}_ρ̄ is proper, so Spec R^{△λ}_ρ̄[1/p] is its image. (3) A map f : R^{□,v_λ}_ρ̄ → A to a finite local E-algebra factors through R^{△λ}_ρ̄ iff f∘ρ^λ is F′_v-ordinary of weight λ. (4) A Borel-valued representation r : G_{F_v} → B₀(A) whose torus part equals χ_λ on I_{F′_v} is semistable over F′_v of p-adic Hodge type v_λ (Nekovář for GL_n, Patrikis for G).

*Hypotheses and conventions.*
- The ideal of FKP Lemma B.3 generated by the c_{β,σ} alone imposes the torus condition only modulo Z(G) (for G = GL₁ there are no roots); the central generators must be added (extraction issue E43). Lemma B.4 is unaffected.
- For G = GL_n this is Geraghty's construction (L7/ordinary-flag-scheme specialised at the weight λ).
- λ is dominant regular, F′_v/F_v is fixed, and the ambient p-adic Hodge quotient is the one semistable over that fixed extension with compatible Hodge data. The unique-flag proof uses regularity.

*Construction.* (1): the c_{β,σ} are independent of g and descend; with the central generators they cut out exactly the condition on the full torus. (2): Fl_G is proper, so Λ is proper and its image is closed. (3): closed points of the generic fibre lift uniquely to 𝒢_λ for λ regular, and on completed local rings (R^{□,v_λ}[1/p])^∧_y ↠ (R^{△λ}[1/p])^∧_y ↪ 𝒪^∧_{𝒢_λ[1/p],ỹ}, the last pro-representing pairs (ρ, B) (Geraghty Lemma 3.10). (4): extensions of de Rham characters with the right Hodge–Tate weights are semistable (Nekovář Proposition 1.28, Patrikis Lemma 4.8; PadicHodgeTheory:R06.4/ordinary-implies-semistable).

*API.*
- `TauCeti.GaloisDeformation.Local.gOrdinaryFlagScheme` (data): 𝒢_λ ⊂ Fl_G ×_𝒪 Spec R^{□,v_λ}_ρ̄.
- `TauCeti.GaloisDeformation.Local.gOrdinaryFlagScheme.isClosed` (characterisation): 𝒢_λ is a closed subscheme, with the ideal of (1) including the central generators.
- `TauCeti.GaloisDeformation.Local.gOrdinaryFlagScheme.proper` (other): 𝒢_λ → Spec R^{□,v_λ}_ρ̄ is proper.
- `TauCeti.GaloisDeformation.Local.gOrdinaryRing` (constructor): R^{△λ}_ρ̄, the scheme-theoretic image of 𝒢_λ[1/p].
- `TauCeti.GaloisDeformation.Local.gOrdinaryRing_points` (characterisation): Point criterion (3).
- `TauCeti.GaloisDeformation.Local.gOrdinaryRing.gl` (compatibility): For G = GL_n, R^{△λ}_ρ̄ is the weight-λ specialisation of L7/ordinary-flag-scheme's image ring, intersected with the Hodge type v_λ.
- `TauCeti.GaloisDeformation.Local.gOrdinaryFlagScheme.points` (universal-property): Over a finite E-algebra in the specified semistable-over-F′_v Hodge family, a point is a framed lift and a Borel reduction satisfying the root and canonical-torus equations. Base change pulls back the Borel reduction and these equations; the torus equations are retained also when G has no roots.

*Unit tests.*
- `gOrdinaryRing_GL1` (degenerate): G = GL₁: R^{△λ}_ρ̄ = R_ρ̄/(ρ(σ) − χ_λ(σ) : σ ∈ I_{F′_v}) up to the p-torsion-free generic fibre (R08.1/rank-one-ring).
- `gOrdinaryRing_central_generators` (non-example): In the ambient unrestricted framed GL₁ ring there are no root generators. The torus equations ρ(σ)=χ_λ(σ) on I_{F′_v} must be imposed explicitly. Whether they are redundant after a particular fixed Hodge/semistable quotient is a separate assertion.
- `gOrdinaryRing_points_GL2` (computation): For G=GL₂, F_v=ℚ_p and λ=(1,0), the stated ordinary point has the form (ψ₁χ_p *;0 ψ₂) in the FKP convention and is semistable over F′_v. A nonzero Tate-curve extension can have N≠0 and need not be crystalline.
- `gOrdinaryRing_compat` (compatibility): For G = GL_n and F′_v = F_v the points agree with those of L7/semistable-ordinary-quotient.

*Used by.* FKP 2022, Appendix B and §5 — the ordinary components used to produce global lifts; BCG 2025, Theorem 2.1 — ordinary components of crystalline weight-zero rings; LocalGaloisDeformationRings:L7/g-valued-ordinary-components — its components

*Acceptance.* G = GL₁: 𝒢_λ = Spec of R^{□,v_λ}/(ψ(ρ(σ)) − ψ(χ_λ(σ))), the locus where ρ|I_{F′_v} = χ_λ — which the c_{β,σ} alone would not impose.

*Prerequisites.* `L7/g-valued-ordinary-condition`, `R08.3/g-valued-pst-rings`, `R08.1/g-valued-framed-ring`, `PadicHodgeTheory:R06.4/ordinary-implies-semistable`, `L7/ordinary-flag-scheme`.

*Sources.* Najmuddin Fakhruddin (FKP-2022), Lemma B.3, arXiv v5 p. 53; Najmuddin Fakhruddin (FKP-2022), Lemma B.4 (1), arXiv v5 p. 54.

#### `L7/g-valued-ordinary-components` — The G-valued ordinary locus is a union of components (theorem)

Keep L7/g-valued-ordinary-quotient with λ dominant regular. R^{△λ}_ρ̄ is a union of irreducible components of R^{□,v_λ}_ρ̄; hence R^{△λ}_ρ̄[1/p] has an open dense regular subscheme and all its components have dimension dim G + [F_v:ℚ_p]·dim Fl_G. With a fixed multiplier μ : G_{F_v} → (G/G^der)(𝒪), the same holds with dim G^der in place of dim G.

*Hypotheses and conventions.*
- Misprints on FKP p. 55 (extraction issues E6, E7) do not affect the statement.

*Proof outline.* At a closed point y with lift ỹ, 𝒪^∧_{𝒢_λ[1/p],ỹ} ≅ E⟦X₁, …, X_h⟧/(f₁, …, f_{h′}) with h ≥ dim G + [F_v:ℚ_p]dim Fl_G + h²(G_{F_v}, r(𝔟₀)) and h′ = h²(G_{F_v}, r(𝔟₀)): the tangent space is ker(Z¹(G_{F_v}, r(𝔟₀)) → Z¹(I_{F′_v}, r(𝔟₀/𝔫₀))), computed by the local Euler characteristic (Tau Ceti ClassFieldTheory Layer 5) and H²(G_{F_v}, r(𝔟₀/𝔫₀)) = 0 (λ regular). So every component of 𝒢_λ[1/p] has dimension ≥ dim G + [F_v:ℚ_p]dim Fl_G, which is the dimension of R^{□,v_λ}[1/p] (R08.3/g-valued-pst-rings); a closed subset of an equidimensional space of full dimension is a union of components.

*Acceptance.* G = GL₂, F_v = ℚ_p, λ regular: the ordinary locus has dimension 4 + 1 = 5, the full dimension of R^{□,v_λ}[1/p].

*Prerequisites.* `L7/g-valued-ordinary-quotient`, `R08.3/g-valued-pst-rings`, `R08.1/completion-at-points`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Najmuddin Fakhruddin (FKP-2022), Lemma B.4 (2)–(3), arXiv v5 pp. 54–55; George Boxer (BCG-2025), proof of Theorem 2.1, arXiv v3 p. 6.

#### `L7/snowden-ordinary-ring-trivial-residual` — The two-dimensional ordinary ring of the trivial representation (Snowden) (theorem)

Let p be odd, F_v/ℚ_p finite, ρ̄ : G_{F_v} → GL₂(k) trivial, ε_p trivial on G_{F_v} mod p, and R^△_v = R^{△,(0,0),ψ}_v the fixed-determinant (ψ = ε_p^{-1}) semistable-ordinary ring of weight 0 (L7/semistable-ordinary-quotient, R08.3/fixed-determinant-pst-rings). (1) Spec R^△_v is equidimensional of dimension [F_v:ℚ_p] + 4 with two irreducible components X^cr = Spec R^{△,cr}_v and X^st = Spec R^{△,st}_v: an E′-point factors through R^{△,cr}_v iff ρ_x is crystalline, and through R^{△,st}_v iff ρ_x is conjugate to (1 ∗; 0 ε_p^{-1}). (2) Each generic point of Spec(R^△_v/ϖ) is the specialisation of a unique generic point of Spec R^△_v.

*Hypotheses and conventions.*
- Twisting by the cyclotomic character identifies R^△_v with Snowden's ring R of Proposition 4.3.2.
- µ_p⊂F_v (equivalently ε̄_p|G_{F_v}=1) is required. For odd p this excludes F_v=ℚ_p.

*Proof outline.* (1): Snowden Proposition 4.3.2: R^△_v is cut out by explicit equations (cf. L7/ordinary-ring-with-frobenius-eigenvalue for the ring with an eigenvalue); the two components are the crystalline and the semistable non-crystalline loci (PadicHodgeTheory R06.4/two-dimensional-ordinarity-criterion (b)). (2): via Snowden's resolution R̃^△_v (Propositions 4.4.3, Theorem 4.6.1, Lemma 4.6.4): its two special-fibre components meet in dimension [F_v:ℚ_p] + 2, so no special-fibre component lies in both.

*Acceptance.* F_v = ℚ_p(ζ_p): dimension p+3 = [F_v:ℚ_p] + 4.

*Prerequisites.* `L7/semistable-ordinary-quotient`, `R08.3/fixed-determinant-pst-rings`, `PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion`.

*Sources.* Ana Caraiani (CN-2023), Proposition 5.3.2, arXiv v3 pp. 75–76.

#### `L7/ordinary-ring-with-frobenius-eigenvalue` — The ordinary ring with a Frobenius eigenvalue for trivial ρ̄|G_p (Calegari–Geraghty R̃†) (construction)

Let p ≥ 3, n ≥ 2 and ρ̄|G_{ℚ_p} trivial (two-dimensional), with determinant χ^{n−1}. R̃† represents framed deformations ρ of ρ̄|G_p with determinant χ^{n−1} together with α ∈ A such that, writing φ := ρ(φ_p) and g := ρ(g): (1) det φ = 1; (2) α is a root of the characteristic polynomial of φ; (3) tr g = χ^{n−1}(g) + 1 for g ∈ I_p; (4) (g − 1)(g′ − 1) = (χ^{n−1}(g) − 1)(g′ − 1); (5) (g − 1)(φ − α) = (χ^{n−1}(g) − 1)(φ − α); (6) (φ − α)(g − 1) = (α^{-1} − α)(g − 1), for g, g′ ∈ I_p — the reduced 𝒪-flat ring of Kisin's ordinary lifts with an eigenvalue of Frobenius on the unramified quotient (Snowden's equations). R† is its image after forgetting α (the ordinary ring without the eigenvalue). R̃† is topologically generated over 𝒪 by φ₁, …, φ₄ (entries of ρ(φ_p) − 1), x_{ij} (entries of ρ(g_j) − 1) and β = α − 1, with β² − (φ₁ + φ₄)β − (φ₁ + φ₄) = 0. R^unr is the largest quotient of R† on which the deformation is unramified (R† modulo the entries of ρ(g) − 1, g ∈ I_p), R̃^unr = R̃† ⊗_{R†} R^unr, the unramified ideal is I = ker(R^univ → R^unr) and the doubling ideal is J = Ann_{R^univ}(R̃†/R†).

*Hypotheses and conventions.*
- Here R^univ is the global universal ring of CG18 §3.7 acting through R†; the local statements use only the R†-module structure.
- Equations (4)–(6) are rank-two instances of L8's ordered products (ρ(g₁) − χ₁(g₁))(ρ(g₂) − χ₂(g₂)) = 0.
- With trivial residual representation and determinant χ^{n−1}, require n≡1 mod p−1. The eigenvalue α is a unit reducing to 1. Choose φ_p with χ(φ_p)=1.

*Construction.* Snowden, Singularities of ordinary deformation rings, as recalled in CG18 proof of Lemma 3.22: the moduli of pairs (ρ, line) with the ordinary condition, pushed to the space of (ρ, α), is cut out by (1)–(6) and is reduced and 𝒪-flat. Generators: α + α^{-1} = tr φ = 2 + φ₁ + φ₄ gives the quadratic relation for β.

*API.*
- `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue` (data): R̃† with the universal pair (ρ, α) satisfying (1)–(6).
- `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.forget` (projection): R† → R̃†, forgetting α; R† is the image.
- `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.beta_relation` (relation): β² − (φ₁ + φ₄)β − (φ₁ + φ₄) = 0, α = 1 + β.
- `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.unr` (constructor): R^unr and R̃^unr = R̃† ⊗_{R†} R^unr.
- `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.unramifiedIdeal` (constructor): I = ker(R^univ → R^unr).
- `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.doublingIdeal` (constructor): J = Ann_{R^univ}(R̃†/R†).
- `TauCeti.GaloisDeformation.Local.OrdinaryWithEigenvalue.hom_ext` (extensionality): Two continuous maps R̃†→A are equal iff they induce the same framed lift ρ and the same eigenvalue α. Equality of ρ alone characterizes maps from the image ring R†, not maps from R̃†.

*Unit tests.*
- `eigenvalueRing_unr_presentation` (computation): R^unr ≅ 𝒪/ϖ^m⟦φ₁, …, φ₄⟧/(φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃) and R̃^unr ≅ R^unr[β]/(β² − (φ₁ + φ₄)β − (φ₁ + φ₄)) ≅ R^unr ⊕ R^unr, with ϖ^m the largest power dividing all χ^{n−1}(g) − 1, g ∈ D_p. The direct sum is an isomorphism of R^unr-modules, not a product of rings.
- `eigenvalueRing_rank_two` (characterisation): The unramified quotient has a rank-two eigenvalue algebra as a module, while its support is killed by a power of ϖ. After inverting p, I=J becomes the unit ideal and R̃†[1/p]=R†[1/p]; the ordinary eigenvalue map is generically degree one.
- `eigenvalueRing_not_flag_free` (non-example): R† ≠ R̃†: the ring with an eigenvalue is not the image ring; their difference is measured by J.
- `eigenvalueRing_trace_relation` (computation): α + α^{-1} = 2 + φ₁ + φ₄ in R̃†.

*Used by.* CG18 §3.7, Lemma 3.22 and §4.1 — the weight-one and multiplicity-two arguments; LocalGaloisDeformationRings:L8/doubling-equals-unramified — J = I; LocalGaloisDeformationRings:L7/eigenvalue-ring-normal-cm-type-three — structure of R̃†

*Acceptance.* R̃† is finite over R† and is an isomorphism after inverting p. Its rank-two unramified eigenvalue algebra is supported on the ϖ-power-torsion unramified quotient; it does not give generic degree two.

*Prerequisites.* `L7/ordinary-flag-scheme`, `L7/semistable-ordinary-quotient`, `R08.1/local-fixed-determinant`.

*Sources.* Frank Calegari (CG-2018), proof of Lemma 3.22, published pp. 336–337; Frank Calegari (CG-2018), Definition 3.20, published p. 335; Frank Calegari (CG-2018), Definition 3.21, published p. 335.

#### `L7/eigenvalue-ring-normal-cm-type-three` — R̃† is a normal Cohen–Macaulay domain of relative dimension 4 and type 3 (theorem)

Keep L7/ordinary-ring-with-frobenius-eigenvalue. (1) R̃† is an integral domain, normal and Cohen–Macaulay of relative dimension 4 over 𝒪; R̃† ⊗ k is a normal Cohen–Macaulay domain of dimension 4, not Gorenstein, isomorphic to the completion of Snowden's variety B₁ at b = (1, 1; 0): A := k⟦a, b, c, φ₁, φ₂, φ₃, φ₄, β⟧/(φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃, β² − (φ₁ + φ₄)β − (φ₁ + φ₄), aφ₁ + bφ₃ − aβ, aφ₂ + bφ₄ − bβ, −aφ₃ + cφ₁ − cβ, aφ₄ − cφ₂ − aβ, a² + bc). (2) B := A/βA ≅ k⟦a, b, c, φ₁, φ₂, φ₃⟧/(−φ₁² − φ₂φ₃, aφ₁ + bφ₃, aφ₂ − bφ₁, −aφ₃ + cφ₁, −aφ₁ − cφ₂, a² + bc) is Cohen–Macaulay of dimension 3, isomorphic to the completion of its associated graded ring, with Hilbert series H_B(t) = 1 + 6t + 15t² + ⋯. (3) For an ideal I ⊂ B generated by three elements of degree one, the generators form a regular sequence iff H_{B/I}(t) = 1 + 3t. (4) {β, a, φ₂ + φ₃, b + c + φ₁} is a regular sequence in A with quotient C ≅ k[x, y, z]/(x, y, z)², H_C = 1 + 3t. (5) dim_k ω_{R̃†}/𝔪ω_{R̃†} = 3: R̃† is Cohen–Macaulay of type 3, in particular not Gorenstein.

*Hypotheses and conventions.*
- The domain property is Geraghty's (proof of Lemma 3.4.3); normality and the Cohen–Macaulay property of A are Snowden's (Theorem 3.4.1).

*Proof outline.* (1): Snowden's method gives the presentation of R̃† ⊗ k; the seven generators are the entries of mn = βm with m = (a b; c −a), n = φ − 1, together with m² = (a² + bc)·1, det(1 + n) = 1 and P_φ(1 + β) = 0. (2): β is nonzero in 𝔪/𝔪² of the domain A, hence regular; setting β = 0 gives φ₄ = −φ₁ and six quadratic relations; H_B from dim 𝔪/𝔪² = 6 and six independent relations among 21 quadratic monomials (a 6 × 6 minor of determinant 1). (3)–(4): graded Cohen–Macaulay theory (DeformationAndDerivedPatchingAlgebra R03.3): for a CM graded ring of dimension 3 with H = 1 + 6t + 15t² + ⋯, a degree-one regular sequence of length 3 gives H = (1 − t)³H_B = 1 + 3t; with a = 0, φ₃ = −φ₂, φ₁ = −(b + c) the relations become those of (x, y, z)². (5): the type of a CM ring is preserved modulo a regular sequence, and C = k[x, y, z]/(x, y, z)² has a three-dimensional socle.

*Acceptance.* The socle of C is spanned by x, y, z, so the type is 3 ≠ 1: R̃† is not Gorenstein, so the patched modules of CG18 are not free over it.

*Prerequisites.* `L7/ordinary-ring-with-frobenius-eigenvalue`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

*Sources.* Frank Calegari (CG-2018), Theorem 4.3, published p. 356; Frank Calegari (CG-2018), Lemma 4.7, published p. 360; Frank Calegari (CG-2018), Lemma 4.5, published p. 358.

#### `L7/gsp4-siegel-ordinary-condition` — The Siegel-ordinary GSp₄ condition at p with fixed multiplier (Calegari–Geraghty) (construction)

Let p > 2, a ≥ 2 and r̄ : G_{ℚ_p} → GSp₄(k) with multiplier ε̄^{−(a−1)} of the shape below with α, β ∈ k^× and (α² − 1)(β² − 1)(α²β² − 1)(α − β) ≠ 0. A lift r to R ∈ C_𝒪 satisfies the condition at p if r is GSp₄(R)-conjugate to the matrix with rows (χ_αψ^{-1}, 0, ∗, ∗), (0, χ_βψ^{-1}, ∗, ∗), (0, 0, ε^{−(a−1)}χ_β^{-1}ψ, 0), (0, 0, 0, ε^{−(a−1)}χ_α^{-1}ψ), with χ_α, χ_β unramified characters lifting λ(α), λ(β) and ψ unramified, trivial mod 𝔪_R. Equivalently, r stabilises an isotropic (Lagrangian) plane on which G_p acts through the sum of two unramified characters lifting λ(α), λ(β), and acts on the quotient through ε^{−(a−1)} times the dual characters. Its tangent space: with b⁰ ⊂ g⁰ = ad⁰r̄ the Borel of Sp₄ and u ⊂ b⁰ the 3-dimensional unipotent radical of the Siegel parabolic (upper-right 2 × 2 block), L′_p = ker(H¹(G_p, b⁰) → H¹(I_p, b⁰/u)) and L_p = image of L′_p in H¹(G_p, g⁰).

*Hypotheses and conventions.*
- Stronger than the full-flag ordinary condition: the (1, 2) and (3, 4) entries vanish (an unramified Lagrangian plane), as needed for the non-regular weight [0, 0, j − 1, j − 1].
- This is 'ordinary with Hodge–Tate weights [0, 0, j − 1, j − 1]' of CG20 Theorem 1.1 with a = j (extraction item def-ordinary-at-p-weight-j-2).

*Construction.* The condition is closed under strict equivalence and defines a local deformation problem: the plane is unique (distinct residual characters on the plane and the quotient by the genericity condition), so it lifts uniquely (as in L7/ordinary-condition-fixed-inertial-characters). Tangent space: first-order deformations in the condition are cocycles valued in b⁰ whose image in b⁰/u is unramified.

*API.*
- `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary` (data): The local deformation problem of Siegel-ordinary lifts with multiplier ε^{−(a−1)}.
- `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary.plane` (constructor): The stable unramified Lagrangian plane of a lift in the condition.
- `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary.plane_unique` (characterisation): Under the genericity condition the plane is unique and lifts the residual one.
- `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary.tangent` (characterisation): The tangent space of the condition is L_p ⊂ H¹(G_p, ad⁰r̄).
- `TauCeti.GaloisDeformation.Local.GSp4.SiegelOrdinary.isOrdinary` (compatibility): Every lift in the condition is G-ordinary of the corresponding (non-regular) weight in the sense of L7/g-valued-ordinary-condition with the Siegel parabolic.
- `TauCeti.GaloisDeformation.Local.SiegelOrdinary.baseChange` (functoriality): Along a coefficient map, the Galois-stable unramified Lagrangian direct summand pulls back to the corresponding plane; isotropy, its rank and the fixed multiplier are preserved. Under the stated uniqueness hypothesis this is the plane assigned to the pulled-back lift.

*Unit tests.*
- `siegelOrdinary_u_dim` (computation): dim u = 3 (root spaces (1,4), (2,3) and (1,3) ~ (2,4) in sp₄).
- `siegelOrdinary_not_borel_ordinary` (non-example): A ramified nonsplit extension of the two prescribed unramified characters on the Lagrangian quotient plane is not Siegel ordinary: the quotient-plane inertia action is nontrivial. A nonzero upper matrix entry alone is insufficient, since an unramified extension may be split by conjugation.
- `siegelOrdinary_residual` (degenerate): For R = k the condition is the residual shape itself.
- `siegelOrdinary_multiplier` (computation): Every lift in the condition has multiplier ε^{−(a−1)}: (χ_αψ^{-1})(ε^{−(a−1)}χ_α^{-1}ψ) = ε^{−(a−1)}.

*Used by.* CG20 §4, Definition 4.6 and Lemma 4.8 — the minimal GSp₄ deformation problem for non-regular weight; LocalGaloisDeformationRings:L7/gsp4-siegel-ordinary-tangent — its tangent dimension

*Acceptance.* a = 2: the condition is the finite flat condition for r^∨ (L7/gsp4-siegel-ordinary-tangent (3)).

*Prerequisites.* `R08.1/g-valued-framed-ring`, `L7/ordinary-of-weight-lambda`, `L7/ordinary-condition-fixed-inertial-characters`.

*Sources.* Frank Calegari (CG-2020), Definition 4.6 (6), published p. 815; Frank Calegari (CG-2020), §4, the definition of L′_p, published p. 816.

#### `L7/gsp4-siegel-ordinary-tangent` — Tangent dimension of the Siegel-ordinary condition and its comparison with finite flatness (theorem)

Keep L7/gsp4-siegel-ordinary-condition. (1) b⁰/u ≅ 1 ⊕ 1 ⊕ λ(α)λ(β)^{-1} as k[G_p]-modules, u ≅ λ(α²)ε̄^{a−1} ⊕ λ(β²)ε̄^{a−1} ⊕ λ(αβ)ε̄^{a−1}, and h⁰(G_p, g⁰/b⁰) = 0; hence h⁰(G_p, u) = h²(G_p, u) = 0, h¹(G_p, u) = 3, H¹(G_p, b⁰) ↠ H¹(G_p, b⁰/u) and H¹(G_p, b⁰) ↪ H¹(G_p, g⁰). (2) dim_k L_p − dim_k H⁰(G_p, ad⁰r̄) = 3. (3) The condition at p is equivalent to r|G_p being ordinary of fixed weight; for a = 2 it is equivalent to finite flatness of r^∨ ≅ r ⊗ ε.

*Hypotheses and conventions.*
- CG20 prints λ(β)λ(α)^{-1} for the character on the (1, 2) root space; conjugation by diag(λ(α), λ(β), ε^{1−a}λ(β)^{-1}, ε^{1−a}λ(α)^{-1}) acts on that root space by λ(α)λ(β)^{-1} (extraction issue E23); the dimension count is unaffected.
- Remark 4.7 is printed for r and with Ext¹(εψ₁, ψ₂); it concerns r^∨ and extensions 0 → εψ₁ → E → ψ₂ → 0 (extraction issues E25, E20, E24).

*Proof outline.* (1): read off the adjoint action of the diagonal torus on root spaces; the genericity condition makes all the characters in u and g⁰/b⁰ non-trivial and different from ε̄, so h⁰ and h² vanish (local Tate duality, Tau Ceti ClassFieldTheory Layer 5) and h¹(u) = 3 by the local Euler characteristic. (2): dim L′_p = 2 + h¹(b⁰) − h¹(b⁰/u), so dim L′_p − h⁰(b⁰) = 2 + h¹(u) − h⁰(b⁰/u) − h⁰(u) = 2 + 3 − 2 − 0 = 3, and L′_p ≅ L_p with h⁰(b⁰) = h⁰(g⁰). (3): extensions between unramified characters ψ₁, ψ₂ with ψ₁ψ₂^{-1} ≢ 1 split; Ext¹(ψ₂, εψ₁) = H¹(G_p, εψ₁ψ₂^{-1}) is the same in finite flat group schemes and in G_p-modules (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1) as long as ψ₁ψ₂^{-1} ≢ 1; the relevant ratios α/β, α², β², αβ are ≢ 1.

*Acceptance.* The count 3 = dim u matches the relative dimension of the Siegel-ordinary deformation problem over the unramified Levi part.

*Prerequisites.* `L7/gsp4-siegel-ordinary-condition`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Frank Calegari (CG-2020), Lemma 4.8 and its proof, published pp. 816–817; Frank Calegari (CG-2020), Remark 4.7, published p. 816.

#### `L7/gsp4-borel-ordinary-conditions` — p-distinguished weight-two ordinary GSp₄ conditions (B- and P-ordinary) (construction)

Assume p > 2 and F_v = ℚ_p. For x ∈ k^×, λ_x is the unramified character with λ_x(Frob) = x. ρ̄|G_{F_v} is p-distinguished weight 2 ordinary if it is conjugate to the matrix with rows (λ_{ᾱ}, 0, ∗, ∗), (0, λ_{β̄}, ∗, ∗), (0, 0, ε̄^{-1}λ_{β̄}^{-1}, 0), (0, 0, 0, ε̄^{-1}λ_{ᾱ}^{-1}) with ᾱ ≠ β̄; a lift is p-distinguished weight 2 ordinary if it is conjugate to the same shape with λ_α, λ_β lifting λ_{ᾱ}, λ_{β̄} (such lifts are semistable, not necessarily crystalline). With 𝔠̄ ∈ {ᾱ, β̄} and the weight algebras Λ_{v,2} = 𝒪⟦(1 + pℤ_p)²⟧ and Λ_{v,1} = 𝒪⟦1 + pℤ_p⟧, 𝒟^{B,𝔠̄}_v (over Λ_{v,2}) is the problem of lifts conjugate to a Borel-upper-triangular form with diagonal characters whose inertial restrictions are the universal characters and with the first character lifting λ_{𝔠̄}; 𝒟^P_v (over Λ_{v,1}) the analogous Siegel-parabolic problem. They are represented by R^{B,𝔠̄}_v and R^P_v; their B- and P-framed variants R^{B,◹}, R^{P,◹} (framed for the Borel resp. parabolic) are defined so that R^B and R^P are formally smooth over them.

*Hypotheses and conventions.*
- For p-distinguished residual representations the flag is unique, so the flag-incidence map is a closed immersion (BCGP25 Remark 6.2.1); the problems are the residual-distinguished case of L7/gsp4-ordinary-flag-incidence.

*Construction.* Uniqueness of the flag for p-distinguished ρ̄ (distinct residual characters on the graded pieces), then as in L7/ordinary-condition-fixed-inertial-characters; the weight algebras parametrise the inertial characters via Art_{ℚ_p}^{-1} (Tau Ceti ClassFieldTheory Layer 7).

*API.*
- `TauCeti.GaloisDeformation.Local.GSp4.IsPDistinguishedOrdinary` (data): The residual and lifted p-distinguished weight-2 ordinary shapes.
- `TauCeti.GaloisDeformation.Local.GSp4.BorelOrdinary` (constructor): 𝒟^{B,𝔠̄}_v over Λ_{v,2}, represented by R^{B,𝔠̄}_v.
- `TauCeti.GaloisDeformation.Local.GSp4.ParabolicOrdinary` (constructor): 𝒟^P_v over Λ_{v,1}, represented by R^P_v.
- `TauCeti.GaloisDeformation.Local.GSp4.partiallyFramed` (other): R^B and R^P are formally smooth over the B- and P-framed rings R^{B,◹}, R^{P,◹} (BCGP21 Lemma 7.3.12).
- `TauCeti.GaloisDeformation.Local.GSp4.BorelOrdinary.semistable` (compatibility): At the specified weight-two arithmetic specialization, the source’s ordinary finite-flat flag criterion gives a semistable lift. Arbitrary variable-weight points are not asserted semistable.
- `TauCeti.GaloisDeformation.Local.BorelOrdinary.toParabolic` (functoriality): Forgetting the appropriate steps of the ordinary full flag and restricting its weight characters to Λ_{v,1} gives a parabolic-ordinary point. The induced map of representing rings follows the opposite direction and commutes with universal representations.

*Unit tests.*
- `gsp4BorelOrdinary_weightAlgebra` (computation): Λ_{v,2} = 𝒪⟦(1 + pℤ_p)²⟧ ≅ 𝒪⟦x₁, x₂⟧ for p > 2.
- `gsp4BorelOrdinary_not_distinguished` (non-example): ᾱ = β̄ is excluded: the residual Lagrangian plane then carries a two-dimensional unramified isotypic piece and the flag is not unique.
- `gsp4BorelOrdinary_semistable_not_crystalline` (characterisation): When α² = 1, the rank-two subquotient on the first and fourth basis vectors may be the non-split extension of ε^{-1}λ_α^{-1} by λ_α given by the Kummer class of p in H¹(ℚ_p, E(ε)) = H¹(ℚ_p, E(ελ_α²)); such a lift is p-distinguished weight-2 ordinary and semistable but not crystalline, so the condition is not the crystalline condition.
- `gsp4BorelOrdinary_closed_immersion` (compatibility): For p-distinguished ρ̄ the flag-incidence map of L7/gsp4-ordinary-flag-incidence is a closed immersion with image R^{B,𝔠̄}_v.

*Used by.* BCGP21 §7.3 and §7.4 — the ordinary local conditions at v | p of the potential modularity argument; LocalGaloisDeformationRings:L7/gsp4-ordinary-generic-fibres — their generic fibres

*Acceptance.* Λ_{v,2} ≅ 𝒪⟦x₁, x₂⟧ and Λ_{v,1} ≅ 𝒪⟦x⟧ for p > 2.

*Prerequisites.* `L7/gsp4-siegel-ordinary-condition`, `R08.1/g-valued-framed-ring`, `L7/ordinary-condition-fixed-inertial-characters`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

*Sources.* George Boxer (BCGP-2021), Definition 7.3.1, arXiv v3 p. 172.

#### `L7/gsp4-ordinary-generic-fibres` — Generic fibres of the GSp₄ ordinary rings: irreducibility, dimension and smooth pure points (theorem)

Keep L7/gsp4-borel-ordinary-conditions (p > 2, F_v = ℚ_p, ρ̄ p-distinguished weight 2 ordinary). (1) R^{B,𝔠̄}_v[1/p] and R^P_v[1/p] are irreducible, of relative dimensions 16 and 14 over ℚ_p. (2) R^{P,univ} and R^P are complete intersections, connected in characteristic zero, with non-smooth locus in characteristic zero of codimension at least two; R^{P,univ}[1/p] and R^P[1/p] are irreducible of dimensions 15 and 14. (3) The P-framed ring R^{P,univ,◹} is a completed tensor product of GL₂ ordinary rings for the three two-dimensional subquotients (Lemma 7.3.15). (4) (Lemma 7.3.14) Write ρ̄ with diagonal (λ_ᾱ, λ_β̄, ε̄⁻¹λ_β̄⁻¹, ε̄⁻¹λ_ᾱ⁻¹), ᾱ ≠ β̄, and extension classes η_δ ∈ H¹(ℚ_p, ε̄λ_δ̄) for δ ∈ {α², β², αβ}. Then H²(ℚ_p, ad⁰_B ρ̄) = 0 unless one of: (i) η_{αβ} = η_{α²} = 0 and ᾱ² = 1; (ii) η_{β²} = 0 and β̄² = 1, in which case either (ii.a) (i) also holds, or (ii.b) h² = 1 and H²(ℚ_p, ad⁰_B ρ̄) ≅ H²(ℚ_p, ad⁰_{B₂} W) for W = λ_β̄ ⊗ (1 ⊕ ε̄⁻¹), through a ℚ_p-equivariant map from ρ̄ to the GL₂ Borel of W; (iii) η_{αβ} = η_{β²} = 0 and ᾱβ̄ = 1. Its dimension is at most 1 except in case (ii.a), where it is 2. The list gives necessary conditions; the converse is not asserted. (5) A pure closed point of R^{B,𝔠̄}_v[1/p] or R^P_v[1/p] is smooth.

*Hypotheses and conventions.*
- Recorded mistakes in BCGP21 (reviewed extraction PAPER-BOXER-CALEGARI-GEE-PILLONI-21): in the proof of Proposition 7.3.4, case (2b) has relative dimension 12 over R^{B₂,◹}, and in case (2a) the complement of U has dimension at most 13; 'codimension 4' in Proposition 7.3.16 reads 3; Lemma 7.3.18's Tate-duality step fails for ad⁰_B and needs a weight argument.
- BCGP21 Remark 7.3.17: in case (ii.a) the argument shows that R^B is a complete intersection, but not that it is 𝒪-flat or that R^B/λ is a complete intersection (only dim R^B/λ ≤ 17). No flatness is asserted in that case.
- In the definition of smooth points before Lemma 7.3.18 the 'resp.' clause should name R^P_v (extraction issue PAPER-BOXER-CALEGARI-GEE-PILLONI-21/E101).

*Proof outline.* (1)–(3): reduce through the partially framed rings (Lemma 7.3.12) to the GL₂ ordinary rings of L7/gl2-borel-ordinary-ring (Lemmas 7.3.6–7.3.9) and a dimension count of the non-smooth loci (Proposition 7.3.16, Remark 7.3.17). (4): explicit computation of ad⁰_B(ρ̄) in the basis {x_{α²}, x_{β²}, x_{αβ}, x_{α/β}, x_α, x_β} and local Tate duality. (5): smoothness iff H² of the Borel (resp. parabolic) adjoint at x vanishes (R08.1/completion-at-points); for pure x the vanishing follows from a weight argument (the duality step as printed fails for ad⁰_B).

*Acceptance.* The relative dimensions agree with BCGP25 Lemma 6.2.2(1): the Borel-ordinary flag scheme over the weight algebra has components of dimension 16 at points where H²(G_{ℚ_p}, Fil⁰ad⁰ρ_x) = 0.

*Prerequisites.* `L7/gsp4-borel-ordinary-conditions`, `L7/gl2-borel-ordinary-ring`, `R08.1/completion-at-points`, `R08.1/smooth-points-generic-fibre`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* George Boxer (BCGP-2021), Proposition 7.3.4, arXiv v3 p. 173; George Boxer (BCGP-2021), Proposition 7.3.16, arXiv v3 p. 183; George Boxer (BCGP-2021), Lemma 7.3.18, arXiv v3 p. 188.

#### `L7/gl2-borel-ordinary-ring` — The GL₂ ordinary ring R^{B₂}: irreducible generic fibre and explicit presentations (theorem)

Let p > 2 and r̄ = (λ_ᾱ ∗; 0 ε̄^{-1}λ_ᾱ^{-1}) : G_{ℚ_p} → GL₂(k), written with extension class η_{α²} ∈ H¹(ℚ_p, ε̄λ_{ᾱ²}); let Λ = 𝒪⟦1 + pℤ_p⟧ with canonical character θ : I_{ℚ_p} → Λ^× (through Art^{-1}). A lift r over A ∈ CNL_Λ is ordinary if it is ker(GL₂(A) → GL₂(k))-conjugate to (χ ∗; 0 ε^{-1}χ^{-1}) with χ̄ = λ_ᾱ and χ|_{I_{ℚ_p}} = θ; this local deformation problem is represented by R^{B₂}. (1) h²(ℚ_p, ad⁰_{B₂}r̄) = 0 unless ᾱ² = 1 and η_{α²} = 0, in which case it equals 1. (2) R^{B₂}[1/p] is irreducible of relative dimension 5 over ℚ_p; when h² = 0, R^{B₂} is formally smooth over 𝒪 of relative dimension 5. (3) (Lemma 7.3.7) The B₂-framed fixed-determinant ring R^{B₂,◹} of r̄ = (λ_γ ε̄⁻¹λ_γ⁻¹η; 0 ε̄⁻¹λ_γ⁻¹), γ ∈ k^×, η ∈ H¹(ℚ_p, ε̄λ_γ²), is a complete intersection, flat over Λ = 𝒪⟦y₂⟧ and irreducible of relative dimension 4 over 𝒪, and as an algebra over R^{GL₁} = 𝒪⟦y₁, y₂⟧ (the universal ring of λ_γ) it is: (a) 𝒪⟦x₁, x₂, y₁, y₂⟧ if γ² ≠ 1 and η ≠ 0; (b) 𝒪⟦x₁, z₁, y₁, y₂⟧ if γ² ≠ 1 and η = 0; (c) if γ² = 1 and η ≠ 0, formally smooth over 𝒪, formally smooth over Λ unless η is peu ramifiée, and ≅ 𝒪⟦x₁, x₂, z₁, y₁, y₂⟧/(g_η) with g_η ≡ c_η y₁ + d_η y₂ mod (λ, 𝔪²) for [c_η : d_η] ∈ ℙ¹(k) depending only on η (c_η = 0 exactly when η is peu ramifiée); (d) if γ² = 1 and η = 0, ≅ 𝒪⟦x₁, z₁, z₂, y₁, y₂⟧/(g) with g ≡ z₁y₁ + z₂y₂ mod (λ, 𝔪³), and R^{B₂,◹}/λ is not formally smooth. Here x_i are framing variables, y_i come from R^{GL₁} and z_i are extension variables. R^{B₂,□} is formally smooth over R^{B₂,◹} of relative dimension dim ad⁰_{GL₂} − dim ad⁰_{B₂} = 1. (4) The points of R^{B₂}[1/p] that are not smooth over Λ are, up to unramified twist, crystalline extensions of ε^{-1} by 1.

*Proof outline.* (1): with respect to the basis {x_{α²}, x_α} of ad⁰_{B₂}, ad⁰_{B₂}r̄ = (ε̄λ_{ᾱ²} −2η_{α²}; 0 1); for M killed by p, H²(ℚ_p, M) ≅ Hom_{G_{ℚ_p}}(M, ε̄)^∨ (local Tate duality, Tau Ceti ClassFieldTheory Layer 5), which is non-zero exactly when ᾱ² = 1 and η_{α²} = 0. (2): Mazur's presentation 𝒪⟦x₁, …, x_r⟧/(y₁, …, y_s) with r = 3 − h⁰ + h¹ and s = h² of ad⁰_{B₂}r̄, and r − s = 3 + dim ad⁰_{B₂} = 5 by the local Euler characteristic; if h² = 1 then ᾱ = ±1, r̄ is split, R^{B₂} is a complete intersection, and irreducibility of the generic fibre follows Geraghty Lemma 3.13 (connectedness via the section χ ⊕ χ^{-1}ε^{-1} over Λ[1/p]) together with the smoothness away from the locus of (4). (3): write the B₂-valued lift as a character χ = Teichmüller(λ_ᾱ)·(universal character over R^{GL₁}) and a cocycle valued in εχ²; variables x_i (framing), y_i (character) and z_i (cocycle) (Remark 7.3.8). (4): in the Tate pairing H¹(ℚ_p, ℚ_p) × H¹(ℚ_p, ℚ_p(1)) → ℚ_p the unramified classes are annihilated exactly by the crystalline extensions, so smoothness over Λ fails exactly at crystalline extensions of ε^{-1} by 1, up to twist (Lemma 7.3.9).

*Acceptance.* γ̄ = 1, η ≠ 0 (très ramifié): h² = 0 and R^{B₂} is formally smooth over Λ.

*Prerequisites.* `L7/ordinary-condition-fixed-inertial-characters`, `R08.1/rank-one-ring`, `R08.1/completion-at-points`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

*Sources.* George Boxer (BCGP-2021), Lemma 7.3.6, arXiv v3 p. 174; George Boxer (BCGP-2021), Lemma 7.3.9, arXiv v3 p. 179.

#### `L7/gsp4-ordinary-flag-incidence` — The GSp₄ ordinary flag-incidence scheme and its scheme-theoretic image R^△_v (construction)

Let v | p with F_v = ℚ_p (any p, including p = 2), ρ̄ : G_{F_v} → GSp₄(k) ordinary with a fixed p-stabilisation (χ̄₁, χ̄₂) and multiplier ε̄^{-1}. Λ_{GSp₄,v} = 𝒪⟦(𝒪_{F_v}^×(p))²⟧ with characters θ_i : I_{F_v} → Λ^× (the i-th copy through Art^{-1}); for p > 2, Λ_{GSp₄,v} ≅ 𝒪⟦x₁, x₂⟧, for p = 2 Spec Λ_{GSp₄,v} has four components with regular generic fibre. Λ̃_{GSp₄,v} = 𝒪⟦Gal(F_v^{ab}/F_v)(p)²⟧ carries universal characters (χ̃₁, χ̃₂) lifting (χ̄₁, χ̄₂). With 𝓕 the flag variety of full symplectic flags (Fil_i^⊥ = Fil_{4−i}) and R_v the fixed-multiplier lifting ring over Λ̃, 𝒢_v ⊂ 𝓕 ×_𝒪 Spec R_v is the closed subscheme of pairs (Fil_•, R_v → A) with Fil_• stable and G_{F_v} acting on the graded pieces by χ̃₁, χ̃₂, ε^{-1}χ̃₂^{-1}, ε^{-1}χ̃₁^{-1}. R^△_v := im(R_v → 𝒪_{𝒢_v}(𝒢_v)), so Spec R^△_v is the scheme-theoretic image of 𝒢_v → Spec R_v (p-torsion is not removed). (1) The 𝒪_{E′}-points of Spf R^△_v are exactly the lifts that are ordinary with p-stabilisation (χ̃₁, χ̃₂). (2) If ρ̄ is residually p-distinguished (the four characters pairwise distinct), the flag is unique and 𝒢_v → Spec R_v is a closed immersion. (3) At a characteristic-zero flagged point x, Fil^i ad⁰ρ_x (symplectic endomorphisms lowering the flag by i) has dimensions 6, 4, 2, 1, 0 for i = 0, …, 4.

*Hypotheses and conventions.*
- Unlike Geraghty's ring (L7/ordinary-flag-scheme, flat closure), R^△_v here is the scheme-theoretic image without passing to the p-torsion-free quotient (BCGP25 §6.2).
- BCGP25 §1.8.10: an ordinary lift is semistable ordinary of weight 2 when the whole upper 2 × 2 subrepresentation (the stable Lagrangian plane) is unramified; residually the multiplier is ε̄^{-1}, and a compatible integral p-stabilisation reduces to the chosen residual ordered pair.

*Construction.* Closedness of 𝒢_v as in Geraghty Lemma 3.2; properness of 𝓕 gives (1) (Geraghty Lemma 3.3); (2) by uniqueness of the flag for distinct graded characters; (3) by the root-space decomposition of sp₄ relative to the flag.

*API.*
- `TauCeti.GaloisDeformation.Local.GSp4.weightAlgebra` (data): Λ_{GSp₄,v} and Λ̃_{GSp₄,v} with their universal characters.
- `TauCeti.GaloisDeformation.Local.GSp4.ordinaryFlagScheme` (constructor): 𝒢_v ⊂ 𝓕 ×_𝒪 Spec R_v.
- `TauCeti.GaloisDeformation.Local.GSp4.ordinaryFlagScheme_proper` (other): 𝒢_v → Spec R_v is proper.
- `TauCeti.GaloisDeformation.Local.GSp4.ordinaryImage` (constructor): R^△_v, the scheme-theoretic image (no flat closure).
- `TauCeti.GaloisDeformation.Local.GSp4.ordinaryImage_points` (characterisation): 𝒪_{E′}-points of Spf R^△_v are the ordinary lifts with the given p-stabilisation.
- `TauCeti.GaloisDeformation.Local.GSp4.ordinaryFlagScheme_closedImmersion` (characterisation): Residually p-distinguished ⟹ 𝒢_v → Spec R_v is a closed immersion.
- `TauCeti.GaloisDeformation.Local.GSp4.ordinaryFlagScheme.points` (universal-property): A coefficient point consists of a fixed-similitude framed lift, an isotropic stable full flag and the ordered universal weight characters of its graded lines. This description and the incidence equations commute with coefficient base change.

*Unit tests.*
- `gsp4Flag_weightAlgebra_p2` (computation): p = 2: Spec Λ_{GSp₄,v} has 4 irreducible components (from (ℤ/2)² ⊂ (ℤ₂^×)²) and regular generic fibre.
- `gsp4Flag_filtration_dims` (computation): dim Fil^i ad⁰ρ_x = 6, 4, 2, 1, 0 for i = 0, …, 4.
- `gsp4Flag_no_flat_closure` (non-example): R^△_v may have p-torsion; replacing it by its flat closure changes the ring when 𝒢_v is not 𝒪-flat.
- `gsp4Flag_distinguished` (compatibility): For residually p-distinguished ρ̄, R^△_v is the ring of L7/gsp4-borel-ordinary-conditions.

*Used by.* BCGP25 §6.2 and §7 — the ordinary local conditions at p for modularity of abelian surfaces; LocalGaloisDeformationRings:L7/gsp4-ordinary-regularity — regularity at flagged points; LocalGaloisDeformationRings:L8 — the GSp₄ flag scheme versus its image

*Acceptance.* p-distinguished ρ̄: R^△_v is the ring R^{B,𝔠̄}_v of L7/gsp4-borel-ordinary-conditions (with Λ̃ in place of Λ_{v,2}).

*Prerequisites.* `R08.1/g-valued-framed-ring`, `L7/ordinary-flag-scheme`, `L7/gsp4-borel-ordinary-conditions`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

*Sources.* George Boxer (BCGP-2025), §6.2, arXiv v1 p. 142; George Boxer (BCGP-2025), §6.2, arXiv v1 p. 143.

#### `L7/gsp4-ordinary-regularity` — Regularity of the GSp₄ ordinary flag scheme at characteristic-zero points (theorem)

Keep L7/gsp4-ordinary-flag-incidence and let x be a closed point of 𝒢_v[1/p] with ρ_x. (1) If H²(G_{F_v}, Fil⁰ad⁰ρ_x) = 0, then x is a regular point of 𝒢_v[1/p], on a unique irreducible component, of dimension 16; and H²(G_{F_v}, Fil⁰ad⁰ρ_x) = 0 iff H⁰(G_{F_v}, (ad⁰ρ_x/Fil¹ad⁰ρ_x)(1)) = 0. (2) The conditions of (1) hold if (a) none of the specialisations at x of χ̃₁²ε, χ̃₂²ε, χ̃₁χ̃₂ε, χ̃₁χ̃₂^{-1} equals ε; or (b) ρ_x is pure and p-distinguished; or (c) ρ_x is pure and potentially crystalline. (3) If ρ_x is p-distinguished and (1) holds, the image of x in Spec R^△_v is a regular point on a unique irreducible component of relative 𝒪-dimension 16.

*Hypotheses and conventions.*
- (2)(c) concerns the flagged point x of 𝒢_v, not its image, when ρ_x is not p-distinguished.

*Proof outline.* (1): the completed local ring of 𝒢_v[1/p] at x is a quotient of a power series ring by at most h²(Fil⁰ad⁰ρ_x) relations, with tangent dimension computed by the local Euler characteristic (dim Fil⁰ = 6, [F_v:ℚ_p] = 1, framing 10); duality via the trace pairing identifies (Fil⁰)^∨ with ad⁰/Fil¹ (Tau Ceti ClassFieldTheory Layer 5). (2): ad⁰ρ_x/Fil¹ad⁰ρ_x has a filtration whose graded pieces are characters built from the ratios of the graded characters χ̃₁, χ̃₂, ε^{-1}χ̃₂^{-1}, ε^{-1}χ̃₁^{-1} of the flag (the root characters χ̃₁²ε, χ̃₂²ε, χ̃₁χ̃₂ε and χ̃₁χ̃₂^{-1} together with the torus part); H⁰ of its Tate twist vanishes when none of these equals ε (case (a)); in cases (b), (c) purity of WD(ρ_x) forces the Frobenius weights of these characters to differ from those of ε. (3): p-distinguished ⟹ 𝒢_v → Spec R_v is a closed immersion near x (L7/gsp4-ordinary-flag-incidence (2)).

*Acceptance.* ρ_x crystalline of weight 2 with distinct Frobenius eigenvalues of absolute value p^{1/2}: pure, so x is regular.

*Prerequisites.* `L7/gsp4-ordinary-flag-incidence`, `R08.1/completion-at-points`, `R08.1/smooth-points-generic-fibre`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `L7/ordinary-flag-scheme-local-structure`.

*Sources.* George Boxer (BCGP-2025), Lemma 6.2.2, arXiv v1 p. 143.

#### `L7/gsp4-flat-ordinary-smoothness` — Formal smoothness of the finite-flat ordinary flag scheme for GSp₄ (theorem)

Let p > 2, v | p with F_v⁺ = ℚ_p, ρ̄|_{G_{F_v⁺}} : G_{ℚ_p} → GSp₄(k) ordinary (L7/gsp4-ordinary-flag-incidence) with (ρ̄ ⊗ ε̄)|_{G_{F_v⁺}} finite flat, and let G_v → Spec R^□_v be the ordinary flag scheme of L7/gsp4-ordinary-flag-incidence. Let G_v^flat ⊆ G_v be the closed subscheme whose A-points are the pairs (Fil•, ρ) with ρ ⊗ ε finite flat (every finite quotient of ρ ⊗ ε is the generic fibre of a finite flat group scheme over ℤ_p) and G_{F_v⁺} acting on Fil₂ through unramified characters. Then the completion of G_v^flat at every k′-point (k′/k finite) is formally smooth over 𝒪; equivalently, the obstruction space H²_flat(Fil⁰ad⁰ρ̄) of the flat flag deformation problem vanishes. Consequently the scheme-theoretic image R^{△,flat}_v of G_v^flat in Spec R^△_v is irreducible, since its fibre over ρ̄ is a point or ℙ¹.

*Hypotheses and conventions.*
- BCGP25 (p. 145, proof of Lemma 6.2.5) asserts the formal smoothness and reduces it to the vanishing of H²_flat(Fil⁰ad⁰ρ̄) 'by a standard tangent-obstruction calculation', citing the GL₂ case of Kisin's 2-adic paper (Proposition 2.4.4, there built on the right exactness of H¹_f in Lemma 2.4.2). The rank-four vanishing itself is not written out in the source (source issue E4). The proof outline below is the planned argument.
- BCGP25's '[Kis09]' is Kisin, Modularity of 2-adic Barsotti–Tate representations (Invent. Math. 178 (2009)); BCGP21's '[Kis09]' is Kisin's Annals paper. The two labels name different papers.

*Proof outline.* Tangent-obstruction theory of pairs (Fil•, ρ) with the flat condition, as for L7/gsp4-ordinary-flag-incidence (BCGP25 Lemma 6.2.2): tangent space Z¹_flat(Fil⁰ad⁰ρ̄) and obstructions in H²_flat(Fil⁰ad⁰ρ̄). Dévissage along the filtration of Fil⁰ad⁰ρ̄, whose graded pieces are 1, 1 and χ̄₁χ̄₂⁻¹ (deformations of the unramified characters on Fil₂ and of the unramified extension inside Fil₂) and χ̄₁²ε̄, χ̄₂²ε̄, χ̄₁χ̄₂ε̄ (the extension classes between Fil₂ ⊗ ε, multiplicative, and the étale quotient). On the unramified pieces the relevant H¹ functor is that of the procyclic group G/I, which is right exact (cohomological dimension 1). On the cyclotomic pieces the finite flat classes are the Kummer classes of units, and M ↦ H¹_f(G, M(χ)) is right exact (Kisin 2-adic Lemma 2.4.2; the Kummer description is Tau Ceti ProfiniteCohomology Layer 9 and the finite flat condition FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1). Right exactness on each graded piece kills the obstruction. Irreducibility of the image: the fibre of G_v^flat over ρ̄ is a point or ℙ¹ (BCGP25 p. 145), hence connected, and a proper map from a formally smooth scheme with connected closed fibre has irreducible scheme-theoretic image (R08.6/smooth-resolution-criterion's mechanism, Kisin Annals (2.4.10)).

*Acceptance.* GL₂ analogue: for ρ̄ = (χ̄ε̄ ∗; 0 1)-shaped and finite flat, the line-plus-extension scheme L^{ord} of Kisin's 2-adic Proposition 2.4.4 is formally smooth over W(𝔽). If ρ̄|_{G_{F_v⁺}} is residually p-distinguished, G_v → Spec R^□_v is a closed immersion (BCGP25 Remark 6.2.1), and the statement says that the flat ordinary weight-two locus of R^△_v is formally smooth.

*Prerequisites.* `L7/gsp4-ordinary-flag-incidence`, `R08.1/local-lifting-ring`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* George Boxer (BCGP-2025), proof of Lemma 6.2.5, arXiv v1 p. 145.

#### `L7/gsp4-ordinary-weight-two-components` — Finite-flat ordinary weight-two lifts lie on one component (theorem)

Keep L7/gsp4-ordinary-flag-incidence with p > 2. (1) If (ρ̄ ⊗ ε̄)|G_{F_v} is finite flat, then all ordinary pure weight-two crystalline lifts lie on a single irreducible component of Spec R^△_v, each on a unique component, of relative 𝒪-dimension 16. (2) If a component R^△_v/Q dominates Spec Λ_{GSp₄,v}, some minimal prime of the special fibre contains Q and no other minimal prime of R^△_v; this component has relative 𝒪-dimension 16. No claim is made that every component dominates Λ.

*Hypotheses and conventions.*
- The rank-four input is the formal smoothness of G_v^flat (L7/gsp4-flat-ordinary-smoothness, the rank-four analogue of Kisin's 2-adic Proposition 2.4.4), not rank-two connectedness and not Geraghty or Thorne.

*Proof outline.* (1), uniqueness: the fibre of G_v over an ordinary pure weight-two crystalline lift ρ is the space of symplectic flags with graded characters χ₁, χ₂, ε⁻¹χ₂⁻¹, ε⁻¹χ₁⁻¹; since χ₁, χ₂ are unramified and ρ has two-dimensional inertia invariants, Fil₂ is forced and the fibre is ℙ¹ or a point, hence connected. Each of its points lies on a unique component of G_v (L7/gsp4-ordinary-regularity, the pure potentially crystalline case), so ρ lies on a unique component of Spec R^△_v. (1), independence: every such ρ is a point of the image R^{△,flat}_v of G_v^flat, which is irreducible (L7/gsp4-flat-ordinary-smoothness); so all of them lie on one component. The dimension 16 is computed at a p-distinguished point (L7/gsp4-ordinary-regularity). (2): a tangent-obstruction computation at an 𝔽_q((t))-point x of Spec R^△_v/Q at which no ratio of χ_{1,x}, χ_{2,x}, χ_{2,x}⁻¹ε⁻¹, χ_{1,x}⁻¹ε⁻¹ is 1 or ε, as in Lemma 6.2.2 (2a), (3): R^△_v is regular at x, so x lies on a unique component of the special fibre.

*Acceptance.* The GL₂ analogue is the ordinary component of R08.4/rank-two-bt-components.

*Prerequisites.* `L7/gsp4-ordinary-regularity`, `L7/height-lattice-moduli`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `L7/weight-zero-crystalline-connectedness`, `L7/gsp4-flat-ordinary-smoothness`.

*Sources.* George Boxer (BCGP-2025), Lemma 6.2.5, arXiv v1 p. 145.

#### `L7/connects-relation` — The relation "connects" between potentially crystalline lifts (definition)

Let K/ℚ_l be finite (l = p) and ρ₁, ρ₂ : G_K → GL_n(𝒪_{ℚ̄_l}) continuous. ρ₁ connects to ρ₂ (ρ₁ ∼ ρ₂) if: the reductions ρ̄₁, ρ̄₂ are equivalent; ρ₁, ρ₂ are potentially crystalline; HT_τ(ρ₁) = HT_τ(ρ₂) for every τ : K ↪ ℚ̄_l; and ρ₁, ρ₂ define points on the same irreducible component of Spec(R^□_{ρ̄₁,{HT_τ},K′-cris} ⊗ ℚ̄_l) for some (hence all) sufficiently large K′. For l ≠ p the analogue uses Spec(R^□_{ρ̄₁} ⊗ ℚ̄_l). ρ₁ strongly connects to ρ₂ if moreover ρ₁ lies on a unique component.

*Hypotheses and conventions.*
- Independent of the equivalence chosen between ρ̄₁ and ρ̄₂ and of the GL_n(𝒪_{ℚ̄_l})-conjugacy classes (BLGGT Lemma 1.2.2).
- 'Connects' is symmetric; it is an equivalence relation on points lying on unique components (in particular on smooth points), since components of the generic fibre of the potentially crystalline ring are then connected components (R08.3/pcris-generic-smooth).
- Representations are defined over the integers of finite extensions of the coefficient field. Component relations are not asserted for an arbitrary infinite-coefficient representation without descent.

*Construction.* Well-definedness and independence of K′: R08.3/pst-coefficient-change and the behaviour of the potentially crystalline rings under restriction to K″ ⊃ K′.

*API.*
- `TauCeti.GaloisDeformation.Local.Connects` (data): ρ₁ ∼ ρ₂: same reduction, potentially crystalline with the same labelled Hodge–Tate weights, same component of the potentially crystalline lifting ring over ℚ̄_l.
- `TauCeti.GaloisDeformation.Local.Connects.symm` (relation): ρ₁ ∼ ρ₂ ⟹ ρ₂ ∼ ρ₁.
- `TauCeti.GaloisDeformation.Local.Connects.restrict` (functoriality): ρ₁ ∼ ρ₂ ⟹ ρ₁|G_{K′} ∼ ρ₂|G_{K′} for K′/K finite.
- `TauCeti.GaloisDeformation.Local.Connects.sum_tensor_dual` (functoriality): ∼ is compatible with direct sums, tensor products, duals, and twists by unramified characters with trivial reduction.
- `TauCeti.GaloisDeformation.Local.Connects.symPow` (functoriality): ∼ is compatible with Sym^{n−1} (components of these generic fibres are connected components and Sym^{n−1} induces a morphism of generic fibres).
- `TauCeti.GaloisDeformation.Local.Connects.trans_of_smooth` (relation): On points lying on unique components, ∼ is transitive.

*Unit tests.*
- `connects_rank_one` (computation): n = 1: ψ₁ ∼ ψ₂ iff ψ̄₁ = ψ̄₂ and HT(ψ₁) = HT(ψ₂) (crystalline characters).
- `connects_ordinary_trivial` (characterisation): Two ordinary crystalline weight-0 lifts of the trivial representation connect (L7/weight-zero-crystalline-connectedness).
- `connects_different_weights` (non-example): Lifts with different labelled Hodge–Tate weights never connect, even if their reductions agree.
- `connects_restrict` (compatibility): ρ₁ ∼ ρ₂ implies ρ₁|G_{K′} ∼ ρ₂|G_{K′}.

*Used by.* BLGGT 2014, Theorem 4.2.1 — potential diagonalisability and change of weight; BCG 2025, Theorem 3.1; BCGNT 2025, Proposition 6.2.3 — connecting lifts to induced or ordinary ones; Newton–Thorne 2021–2026 — symmetric power lifting via ∼

*Acceptance.* n = 1: ρ₁ ∼ ρ₂ iff they have the same reduction and the same Hodge–Tate weights (the crystalline character ring is irreducible after fixing the finite part, R08.1/rank-one-ring).

*Prerequisites.* `R08.3/pst-deformation-ring`, `R08.3/pcris-generic-smooth`, `R08.3/pst-coefficient-change`, `R08.2/fixed-type-rings-rank-n`.

*Sources.* Thomas Barnet-Lamb (BLGGT-2014), §1.4, arXiv v4.

#### `L7/weight-zero-crystalline-connectedness` — Connectedness results for crystalline weight-zero lifts (theorem)

Let K/ℚ_p be finite. (1) Two ordinary crystalline weight-0 representations ρ₁, ρ₂ of G_K with ρ̄₁ = ρ̄₂ trivial connect: ρ₁ ∼ ρ₂ (the ordinary weight-0 crystalline lifting ring of the trivial representation is irreducible). (2) For ρ : G_K → GL_n(ℤ̄_p) crystalline of weight 0 there is c = c(K, ρ, n) such that every crystalline weight-0 t with t ≡ ρ mod p^c satisfies t ∼ ρ. (3) A crystalline representation of G_K with parallel Hodge–Tate weights {0, …, n − 1} is ordinary iff the roots of its Frobenius characteristic polynomial (on D_cris, φ^f with f the residue degree) have valuations 0, f, …, (n − 1)f. (4) Symmetric powers and tensor products of crystalline ordinary representations are crystalline ordinary.

*Hypotheses and conventions.*
- Geraghty's results are read in the 2010 preprint with the concordance of the source GERAGHTY-2019 (Lemma 2.32 = preprint Lemma 2.7.7, Lemma 3.14 = Lemma 3.4.3).

*Proof outline.* (1): L7/geraghty-fixed-weight-ordinary-rings (3) at weight 0 (Geraghty Lemma 3.14): the ordinary weight-0 crystalline lifting ring of the trivial representation is irreducible, so any two of its points connect (L7/connects-relation). (2): the generic fibre of the weight-0 crystalline ring is formally smooth at ρ (Kisin 3.3.8, R08.3/pcris-generic-smooth), so ρ lies on a unique minimal prime; the finitely many other minimal primes contain elements with non-zero constant term, which do not vanish at t for t close to ρ. (3): if the roots of the characteristic polynomial of φ^f have valuations 0, f, …, (n − 1)f, a φ-stable flag with these slopes exists by weak admissibility, and it is a G_K-stable flag with crystalline graded characters (Geraghty Lemma 2.32, which states this direction). Conversely the graded characters of an ordinary crystalline representation with Hodge–Tate weights {0, …, n − 1} are crystalline of those weights, so φ^f has eigenvalues of valuations f·(j − 1). (4): the flag is preserved by Sym and ⊗.

*Acceptance.* n = 2, K = ℚ_p, weights {0, 1}: ordinary iff a_p is a unit (one root of X² − a_pX + p is a unit).

*Prerequisites.* `L7/connects-relation`, `L7/semistable-ordinary-quotient`, `R08.3/pcris-generic-smooth`, `L7/ordinary-of-weight-lambda`, `L7/geraghty-fixed-weight-ordinary-rings`.

*Sources.* George Boxer (BCGNT-2025), Lemma 5.1.4, arXiv p. 50; George Boxer (BCGNT-2025), Lemma 5.1.5, arXiv p. 50.

#### `L7/local-model-rho-nm0` — The induced local models ρ_{n,m,0} (construction)

Let p > nm, ε₂, ε′₂ : G_{ℚ_{p²}} → ℤ̄_p^× the two Lubin–Tate characters trivial on Art_{ℚ_{p²}}(p) (so ε₂ε′₂ = ε^{-1}), and ρ_{n,m,0} = ⊕_{i=1}^n ε₂^{m(n−i)}(ε′₂)^{m(i−1)} : G_{ℚ_{p²}} → GL_n(ℤ̄_p), crystalline with Hodge–Tate weights {0, m, …, (n − 1)m} at each embedding (Fontaine–Laffaille since p > nm); ρ₀ = ρ_{n,1,0} has weight 0. (1) Sym^{n−1}ρ_{2,m,0} ≅ ρ_{n,m,0} and ρ_{n,m,0} ⊗ ρ_{m,1,0} ≅ ρ_{nm,1,0}. (2) If K₀/ℚ_{p²} is unramified and ρ : G_{K₀} → GL_n(ℤ̄_p) is crystalline with Hodge–Tate weights {0, m, …, (n − 1)m} and ρ̄|I_{K₀} = ρ̄_{n,m,0}|I_{K₀}, then ρ̄|G_{K₁} = ρ̄_{n,m,0}|G_{K₁} for some finite unramified K₁/K₀, and ρ|G_K ∼ ρ_{n,m,0}|G_K for every finite K/K₀ with ρ̄|G_K = ρ̄_{n,m,0}|G_K.

*Hypotheses and conventions.*
- BCGNT's proof of Lemma 5.1.3 prints ρ₀ where ρ_{n,m,0} is meant (extraction issue E26).

*Construction.* (1): compare characters: the summand of index k = m(i − 1) + j of the tensor product is ε₂^{nm−k}(ε′₂)^{k−1}. (2): for K₁/K₀ unramified and p > nm, the crystalline lifting ring with these weights is formally smooth (Fontaine–Laffaille, L7/fontaine-laffaille-tangent-space-and-smoothness), so it is irreducible and ρ, ρ_{n,m,0} lie on its unique component; connecting persists after further extension.

*API.*
- `TauCeti.GaloisDeformation.Local.rhoNM0` (constructor): ρ_{n,m,0} = ⊕ ε₂^{m(n−i)}(ε′₂)^{m(i−1)}.
- `TauCeti.GaloisDeformation.Local.rhoNM0.hodgeTate` (simp): HT_τ(ρ_{n,m,0}) = {0, m, …, (n − 1)m} for each τ.
- `TauCeti.GaloisDeformation.Local.rhoNM0.symPow` (relation): Sym^{n−1}ρ_{2,m,0} ≅ ρ_{n,m,0}.
- `TauCeti.GaloisDeformation.Local.rhoNM0.tensor` (relation): ρ_{n,m,0} ⊗ ρ_{m,1,0} ≅ ρ_{nm,1,0}.
- `TauCeti.GaloisDeformation.Local.rhoNM0.connects` (characterisation): Crystalline lifts of ρ̄_{n,m,0} with the same weights connect to ρ_{n,m,0} after an unramified extension.
- `TauCeti.GaloisDeformation.Local.rhoNM0.rank_one` (simp): For n=1 the sole summand has exponents zero, so ρ_{1,m,0} is the trivial character for every allowed m.

*Unit tests.*
- `rhoNM0_n1` (degenerate): n = 1: ρ_{1,m,0} is the trivial character.
- `rhoNM0_det` (computation): det ρ_{2,1,0} = ε₂ε′₂ = ε^{-1}.
- `rhoNM0_weights` (computation): ρ_{3,2,0} has Hodge–Tate weights {0, 2, 4} at each embedding.
- `rhoNM0_needs_p_large` (non-example): The bound p>nm supplies the uniform FL range for the tensor weights. If p≤nm that hypothesis is unavailable; this does not imply that every individual weight multiset is outside the FL interval.

*Used by.* BCGNT 2025, §5–6 — potential diagonalisability of symmetric powers via ρ_{n,m,0}; LocalGaloisDeformationRings:L7/connects-relation — the target of connections

*Acceptance.* n = 2, m = 1: ρ₀ = ε₂ ⊕ ε′₂ = Ind of a Lubin–Tate character restricted to G_{ℚ_{p²}}, crystalline of weights {0, 1}.

*Prerequisites.* `L7/connects-relation`, `L7/fontaine-laffaille-tangent-space-and-smoothness`, `ArithmeticGaloisRepresentations:R01.2/tame-inertia-and-fundamental-characters`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

*Sources.* George Boxer (BCGNT-2025), Definition 5.1.1, arXiv p. 49; George Boxer (BCGNT-2025), Lemma 5.1.3, arXiv p. 49.

#### `L7/kisin-modules-tame-descent` — GL₃ eigenbasis charts and shapes of Kisin modules with tame descent (construction)

Let K/ℚ_p be unramified of degree f, τ a tame inertial type with lowest alcove presentation (s, μ), L′/K the tame extension of degree e′ = p^{f′} − 1 (f′ = f or 3f by the orientation of α_{(s,μ)}), Δ = Gal(L′/K), 𝔖_{L′,R} = (W(k′) ⊗ R)⟦v⟧ with its Δ-action and Frobenius, and h ≥ 0. Kisin modules over 𝔖_{L′,R} of E(v)-height in [0, h] with a semilinear Δ-action are the objects of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 (R07.4/kisin-modules, with tame descent data as requested from R07.4); Y^{[0,h],τ}(R) denotes those of rank 3 whose descent datum has type τ (LLHLM Definition 3.1.3). This node fixes the GL₃ coordinates: an eigenbasis of 𝔐 (Definition 3.1.6) is a basis of each isotypic piece compatible with the descent datum, and in it the partial Frobenii have matrices A^{(j)} ∈ GL₃(R((v))), j ∈ ℤ/f; changing the eigenbasis replaces A^{(j)} by (I^{(j)})^{−1}A^{(j)}φ(I^{(j−1)}) with I^{(j)} in the Iwahori subgroup (LLHLM18 Proposition 2.13). The shape w̃(ρ̄, τ) = (w̃_j) ∈ W̃^∨ (Definitions 3.3.1–3.3.2) is the Iwahori double coset of the A^{(j)} of the Kisin module of type (η, τ) attached to ρ̄, which is unique for 3-generic τ (LLHLM18 Theorem 3.2).

*Hypotheses and conventions.*
- Genericity hypotheses (τ n-generic for the n required) are part of every statement that uses the shape.
- Kisin modules with descent data, their étale φ-modules (𝔐 ⊗ 𝒪_{ℰ,L′})^{Δ=1} and the functor T*_dd are imported from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4; this node adds only the eigenbasis charts, the partial Frobenius matrices and the shape used for GL₃ component labelling.
- The genericity assumption belongs to the shape uniqueness/domain theorems, not to the existence of every Kisin module. A failure of genericity does not imply a zero deformation ring.

*Construction.* Δ-action ⇔ an isomorphism ι_𝔐 with the cocycle condition (Remark 3.1.4); eigenbases exist after base change (LLHLM18 Definition 2.8); the matrices A^{(j)} depend only on j mod f (LLHLM18 Proposition 6.9). Uniqueness of the Kisin module of type (η, τ) for 3-generic τ (LLHLM18 Theorem 3.2, §6.2).

*API.*
- `TauCeti.GaloisDeformation.Local.GL3KisinChart` (structure): A rank-3 Kisin module with tame descent datum of type τ (R07.4) over R together with an eigenbasis: the data from which the partial Frobenius matrices are read.
- `TauCeti.GaloisDeformation.Local.GL3KisinChart.frobMatrix` (projection): A^{(j)} ∈ GL₃(R((v))) for j ∈ ℤ/f, the matrix of the j-th partial Frobenius in the eigenbasis.
- `TauCeti.GaloisDeformation.Local.GL3KisinChart.changeBasis` (extensionality): Two eigenbases differ by (I^{(j)})_j in the Iwahori subgroup, and A^{(j)} ↦ (I^{(j)})^{−1}A^{(j)}φ(I^{(j−1)}); two charts of the same Kisin module are related in this way.
- `TauCeti.GaloisDeformation.Local.GL3KisinChart.shape` (constructor): The shape (w̃_j) ∈ W̃^∨: the Iwahori double coset of A^{(j)} for 𝔐 over a field; independent of the eigenbasis by changeBasis.
- `TauCeti.GaloisDeformation.Local.GL3KisinChart.unique` (characterisation): For 3-generic τ the Kisin module of type (η, τ) of ρ̄ is unique up to isomorphism (LLHLM18 Theorem 3.2), so w̃(ρ̄, τ) is well defined.

*Unit tests.*
- `kisinDescent_trivialType` (degenerate): τ trivial: Δ acts trivially on the eigenbasis, each A^{(j)} is the Frobenius matrix of an R07.4 Kisin module, and the chart is an ordinary basis.
- `kisinDescent_shape_identity` (computation): For ρ̄ = T*_dd of the semisimple Kisin module of shape t_1 (A^{(j)} diagonal), the shape w̃(ρ̄, τ) is the identity at every j.
- `kisinDescent_shape_admissible` (characterisation): w̃(ρ̄, τ) lies in Adm^∨(η) whenever ρ̄ has a potentially crystalline lift of type (η, τ) (LLHLM Theorem 3.3.11).
- `kisinDescent_nongeneric_not_empty` (non-example): Without 1-generic τ, Theorem 3.5.3 does not apply; it does not imply that the ring is zero. The trivial residual representation has a trivial-type, weight-zero crystalline lift, a concrete nonzero nongeneric case.

*Used by.* LLHLM 2020 §3 — computing potentially crystalline deformation rings of GL₃; LocalGaloisDeformationRings:L7/gl3-pcris-deformation-rings — their structure

*Acceptance.* For τ = 1 ⊕ 1 ⊕ 1 trivial the descent datum is trivial and Y^{[0,h],τ} is the moduli of Breuil–Kisin modules of height ≤ h (L7/finite-height-lattices with coefficients).

*Prerequisites.* `L7/finite-height-lattices`, `L7/height-lattice-moduli`, `R08.3/hodge-and-galois-types`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules-with-coefficients`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

*Sources.* Daniel Le (LLHLM-2020), Definition 3.1.3, published p. 27; Daniel Le (LLHLM-2020), Definition 3.3.1, published p. 31.

#### `L7/semisimple-kisin-modules-and-shapes` — Semisimple Kisin modules and the shapes of potentially crystalline lifts (theorem)

Keep L7/kisin-modules-tame-descent (GL₃, K/ℚ_p unramified). (1) A semisimple Kisin module of shape w̃ (Definition 3.3.4) gives a semisimple G_{K_∞}-representation, with the explicit normal form of Proposition 3.3.6 and étale φ-module 𝓜(w̃) (Definition 3.3.7); T*_dd of it and its inertial type are given by Proposition 3.3.8. (2) Semisimple Kisin modules of a fixed shape and inertial restriction are classified (Proposition 3.3.9). (3) If ρ̄ has a potentially crystalline lift of type (η, τ), then so does ρ̄^ss (Lemma 3.3.10). (4) (Theorem 3.3.11) If ρ̄ has a potentially crystalline lift of type (η, τ) with either τ a regular principal-series type and general effective λ, or λ=η and τ 3-generic, as in Theorem 3.3.11, its Kisin module has shape in Adm^∨(η). (5) (Theorem 3.3.12) Sums of characters admit semisimple Kisin modules, and the Kisin module of type (η, τ) of a semisimple ρ̄ is semisimple.

*Proof outline.* (1)–(2): explicit computation of ε₀(𝓜) via Proposition 3.2.2 and Lemma 3.2.3 (the inertial type of a monomial φ^f-module). (3): a lattice with semisimple reduction (Enns, Lemma 5(2)). (4)–(5): the Kisin variety Y^{λ,τ}_{𝓜_dd} with its torus action and gauge bases (LLHLM18 Theorem 4.16): monomial elements of an Iwahori double coset.

*Acceptance.* ρ̄ = ω^a ⊕ ω^b ⊕ ω^c generic: its Kisin module of type (η, τ) is semisimple of a shape determined by (a, b, c) and τ.

*Prerequisites.* `L7/kisin-modules-tame-descent`, `R08.3/pst-deformation-ring`.

*Sources.* Daniel Le (LLHLM-2020), Theorem 3.3.11, published p. 33.

#### `L7/gl3-pcris-deformation-rings` — Potentially crystalline deformation rings of GL₃ in parallel weight (2, 1, 0) (theorem)

Let K/ℚ_p be unramified of degree f, ρ̄ : G_K → GL₃(F) continuous, 10-generic and semisimple, τ a tame inertial type, and R^τ_ρ̄ the framed potentially crystalline deformation ring of type (η, τ) with η = (2, 1, 0) (R08.3/pst-deformation-ring). If τ is not 1-generic, R^τ_ρ̄ = 0. If τ is 1-generic and R^τ_ρ̄≠0: R^τ_ρ̄ is a normal Cohen–Macaulay domain; R̄^τ_ρ̄ := R^τ_ρ̄/ϖ is reduced, its irreducible components are formally smooth of the same dimension, and their number equals #W^?(ρ̄, τ) (the predicted Serre weights in the Jordan–Hölder factors of σ(τ)). For shapes w̃_j of length > 1 at every j (τ 5-generic), the same holds with R^τ_ρ̄ ≠ 0 (Lemma 3.5.4).

*Hypotheses and conventions.*
- The genericity bounds (10-generic ρ̄, 5-generic τ) are part of the statement.
- For the nonemptiness assertion of Lemma 3.5.4, use its residual Deligne–Lusztig presentation V(ρ̄|I_K)=R_{sw*}(µ+η), τ 5-generic and each specified shape in Adm^∨(η) of length>1; generic τ alone does not assert existence.

*Proof outline.* Lemma 3.5.4: by Proposition 3.4.1 there is a Kisin module of shape w̃(ρ̄, τ); LLHLM18 §§5.3, 6 give explicit presentations of R^τ_ρ̄ (formally smooth over the explicit local model rings R_N) for shapes of length ≥ 2; normality from reduced special fibre (proof of LLHLM18 Corollary 8.9). Theorem 3.5.3: induction on the shape using the comparison ring R̃^τ_ρ̄ and LLHLM18 §8 (Propositions 8.5, 8.12, Lemma 8.8) for the shapes of length ≤ 1 (L7/gl3-explicit-rings).

*Acceptance.* For ρ̄ generic and τ with #W^?(ρ̄, τ) = 1, R̄^τ_ρ̄ is irreducible and formally smooth.

*Prerequisites.* `L7/kisin-modules-tame-descent`, `L7/semisimple-kisin-modules-and-shapes`, `L7/gl3-explicit-rings`, `R08.3/pst-deformation-ring`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

*Sources.* Daniel Le (LLHLM-2020), Theorem 3.5.3, published p. 38; Daniel Le (LLHLM-2020), Lemma 3.5.4, published p. 38.

#### `L7/gl3-explicit-ring-rows` — Explicit GL₃ rings for shapes of length two, three and four (LLHLM Tables 3–4) (theorem)

Keep L7/kisin-modules-tame-descent and the conventions of L7/gl3-explicit-rings (row w̃_{f−1−i} t_{−1}, structure constants (a, b, c), units c*). For the shapes of length 2 and 3, R̄^{expl,∇}_{𝔐̄,w̃_{f−1−i}} is the power series ring over F in the coefficients of the listed matrix (units through c* − [c̄*]) modulo the listed relations, with the listed minimal primes 𝔠_{(ω_i,a_i)} and the elements z̃*_i ∈ W̃_a of Proposition 3.6.9: (βαγ) A = (v c11, v c*12, 0; v² c*21, v c22, 0; v(c31 + v d31), v c32, c*33); relations c11 c22 = 0, (−1 − a + c) c*12 c31 − (−1 − b + c) c32 c11 = 0; primes (ε1+ε2, 0): (c11), z̃* = βγ⁺β; (ε2, 1): (c22), z̃* = α. (αβγ) A = (v² c*11, 0, 0; v(c21 + v d21), c22, c*23; v(c21 c33 (c*23)^{−1} + v d31), v c*32, c33); relations c22 c33 = 0, (−1 − a + c) c21 c*32 + (b − c) d31 c22 = 0; primes (ε1+ε2, 0): (c22), αγ⁺α; (ε1, 1): (c33), β. (αβα) A = (c11, c11 c32 (c*31)^{−1}, d33 c11 (c*31)^{−1} + v c*13; 0, v c*22, v c23; v c*31, v c32, v d33); relation c11((a − b) c23 c32 − (a − c) c*22 d33) = 0; primes (0, 0): (c11), γ⁺; (0, 1): ((a − b) c23 c32 − (a − c) c*22 d33), id. (αβ) A = (c31 c12 (c*32)^{−1}, c12, c13 + v c*13; v c*21, c22, c23 + v d23; v c31, v c*32, c31 c23 (c*21)^{−1} + v d33); relations (3.14): c12 c23 − c22 c13 = 0, c22 c31 = 0, c*32 c13 − d33 c12 = 0, c12((b − c) d33 c*21 + (a − b) c31 d23) = 0, (−1 − a + c) c23 c*32 = (−1 − a + b) c22 d33; primes (ε1, 1): (c12, c31), γ⁺β; (ε1 − ε2, 0): (c31, d33), βγ⁺αβ; (0, 0): (c12, c22), αγ⁺; (0, 1): (c22, (b − c) d33 c*21 + (a − b) c31 d23), α. (βα) A = (c11, (c*31)^{−1} c11 c32 + v c*12, c13; 0, v d22, v c*23; v c*31, v c32, c33 + v d33); relations c11 c33 = 0, d22(c13 c*31 − c11 d33) = 0, c11((a − b) c32 c*23 − (a − c) d22 d33) = 0, (1 + a − c) c33 c*23 c*12 = c13((a − b) c32 c*23 − (a − c) d22 d33); primes (ε2, 1): (d22, c11), γ⁺α; (ε2 − ε1, 0): (d22, c32), αγ⁺βα; (0, 0): (c11, c13), βγ⁺; (0, 1): ((a − b) c32 c*23 − (a − c) d22 d33, c13 c*31 − c11 d33), β. The intersections 𝔴_ω = 𝔠_{(ω,0)} ∩ 𝔠_{(ω,1)} of the continuation of Table 3 are (c22) for αβ and (c13 c*31 − c11 d33) for βα. For the shapes w̃′ of the minimal types τ′ (Table 4, structure constants (a′, b′, c′) ≡ z̃_{f−1−i}(a, b, c)): αβαγ, βγβα and αγαβ give power series rings in their entries; βγαγ, γαβα and αβγβ each have one relation, (−1 − b′ + c′) c′32 c′*11 − (−1 − a′ + c′) c′12 c′31 = 0, (a′ − c′) c′13 c′*22 − (a′ − b′) c′23 c′12 = 0 and (−1 − a′ + b′) c′21 c′*33 − (b′ − c′) c′31 c′23 = 0 respectively, solvable for one variable, so the ring is again a power series ring; the length-three shapes αβα, βγβ and γαγ have the relations c′11((a′ − b′) c′23 c′32 − (a′ − c′) c′*22 d′33) = 0, c′22((b′ − c′) c′31 c′13 − (−1 − a′ + b′) c′*33 d′11) = 0 and c′33((−1 − a′ + c′) c′12 c′21 − (−1 − b′ + c′) c′*11 d′22) = 0, each with two minimal primes.

*Hypotheses and conventions.*
- ρ̄ is 10-generic and R^τ_ρ̄ ≠ 0. Only representatives up to the outer automorphisms of W̃_a are listed (Remark 3.6.5); the other shapes follow by w̃ ↦ δ̃w̃δ̃^{−1}.
- Corrected misprints of the source, recorded by the reviewed extraction: the αβ matrix's (1,1) entry is c31 c12 (c*32)^{−1}, as in §3.6.2 (PAPER-LE-LEHUNG-LEVIN-ETAL-20/E06); the fourth αβ relation has the sign of (3.14) (PAPER-LE-LEHUNG-LEVIN-ETAL-20/E07); the αβα relation and prime use c*22, not c*33 (PAPER-LE-LEHUNG-LEVIN-ETAL-20/E05); the first βα relation is c11 c33 = 0 (PAPER-LE-LEHUNG-LEVIN-ETAL-20/E08, p. 54 prints c11 c32); the αβγ (1,1) entry is v² c*11 (PAPER-LE-LEHUNG-LEVIN-ETAL-20/E47); the γαγ coefficient is (−1 − b′ + c′) (PAPER-LE-LEHUNG-LEVIN-ETAL-20/E49).
- The minimal-prime lists are those of Table 3; for the length-three rows of Table 4 the two components are 'the first variable vanishes' and 'the bracket vanishes'.

*Proof outline.* For every ℓ(w̃_i) ≥ 2 the presentations are the mod-ϖ reductions of the characteristic-zero rings of LLHLM18 §5.3 and Table 7 (formally smooth over R_N = ⊗̂_j 𝒪⟦x_j, y_j⟧/(x_j y_j − p), N = Σ_i (4 − ℓ(w̃_i))); the last αβ relation is derived on p. 43 and is implicit in LLHLM18 Table 7. Completeness of the relations for αβ (p. 44): the listed relations define a reduced equidimensional ring of the right dimension with as many minimal primes as R̄^{expl,∇}; Lemma 3.6.11 turns the surjection into an isomorphism. The other rows are treated in the same way ('left to the reader' for βα and αβα on p. 49). The minimal primes are read off: each relation is a product of a coordinate and a bracket, or a binomial, and each listed ideal is prime of the common dimension.

*Acceptance.* Row αβ: four minimal primes, Σ_{(αβ)*} a 4-cycle of the weight graph; row αβα: two minimal primes, an edge; length four: one component, a point (Lemma 3.6.10 with N = Σ_i (4 − ℓ(w̃_i))). Row αβ: c22 = 0 cuts out 𝔴₀ = 𝔠_{(0,0)} ∩ 𝔠_{(0,1)}, and R̄/𝔴₀ is matched with the αβα ring of the minimal type by (a′, b′, c′) = (b, a, c) and d23 = c′23 (LLHLM pp. 45–46, with the correction of PAPER-LE-LEHUNG-LEVIN-ETAL-20/E12).

*Prerequisites.* `L7/kisin-modules-tame-descent`, `R08.1/local-lifting-ring`.

*Sources.* Daniel Le (LLHLM-2020), Table 3, published p. 51 (arXiv v4 p. 53), and its continuation, published p. 52 (arXiv v4 p. 54); Daniel Le (LLHLM-2020), §3.6.2, (3.14), arXiv v4 p. 43; Daniel Le (LLHLM-2020), Table 4, published p. 60 (arXiv v4 p. 55).

#### `L7/gl3-explicit-rings` — Explicit rings R^{expl,∇} and the comparison diagram (3.9) (construction)

Keep L7/kisin-modules-tame-descent (K/ℚ_p unramified of degree f, ρ̄ 10-generic, R^τ_ρ̄ ≠ 0 so τ is 7-generic, 𝔐̄ the unique Kisin module of type (η, τ) with T*_dd(𝔐̄) ≅ ρ̄|_{G_{K∞}}, of shape w̃ = (w̃_i), with a fixed gauge basis β̄). The groupoids Φ-Mod^ét_{ℳ̄}, Φ-Mod^{ét,□}_{ℳ̄}, Ȳ^{η,τ}_{𝔐̄} and D̄^{τ,β̄}_{𝔐̄} (deformations with a gauge basis) fit into the diagram (3.9): Spf R̄^{τ,β̄,□}_{𝔐̄,ρ̄} → Spf R̄^{expl,∇}_{𝔐̄,w̃} ↪ D̄^{τ,β̄}_{𝔐̄} (formally smooth, then closed), Spf R̄^τ_ρ̄ → [Spf R̄^{expl,∇}_{𝔐̄,w̃}/Ĝ_m^{3f}] ↪ Ȳ^{η,τ}_{𝔐̄}, with [Spf R̄^{τ,β̄,□}_{𝔐̄,ρ̄}/GL̂₃] ≅ Spf R̄^{expl,∇}_{𝔐̄,w̃}, where R̄^{expl,∇}_{𝔐̄,w̃} = ⊗̂_i R̄^{expl,∇}_{𝔐̄,w̃_i}. Each factor is the quotient of a power series ring over F in the coefficients of the universal partial Frobenius matrix A^{(i)} (units c*_{jk} entering through c*_{jk} − [c̄*_{jk}]) by explicit relations whose type-dependent terms use (a, b, c) ≡ s_{f−1−i}^{−1}(μ_{f−1−i}) mod p: (a) for ℓ(w̃_i) ≥ 2 the presentations are those of L7/gl3-explicit-ring-rows (from LLHLM18 §5.3 and Table 7); (b) for the length-one shape αt₁ (β and γ follow by the outer automorphism w̃ ↦ δ̃w̃δ̃^{−1}, δ̃ = (123)t_(0,0,−1)), A^{(i)} = (c11, c12 + v c*12, c13; v c*21, c22 + v d22, c23; v c31, v c32, c33 + v c*33), c̃32 := (c32 c*21 − d22 c31)/c*21, and R̄^{expl,∇}_{𝔐̄,αt₁} is F⟦c11, c12, c13, c22, c23, c31, c̃32, c33, d22, c*12 − [c̄*12], c*21 − [c̄*21], c*33 − [c̄*33]⟧ modulo: c11 c23 = 0; c*33 c11 c̃32 = c13 c31 c̃32; (a − b) c11 d22 c*33 = (b − c) c*21 c13 c̃32; c13 c23 c̃32 = 0; c23 c31 c̃32 = 0; (a − b) c13 c31 d22 + (c − b) c13 c̃32 c*21 + (−1 − a + c) c23 c31 c*12 = 0; (a − b) c12 c*33 = (a − c) c13 c̃32; (−1 − a + b) c22 c*33 = (−1 − a + c) c23 c̃32; c*21 c33 = c31 c23 — a power series ring in three variables over the ring R̃ of LLHLM18 Proposition 8.11; (c) for the identity shape t₁, A^{(i)} = (c11 + v c*11, c12, c13; v c21, c22 + v c*22, c23; v c31, v c32, c33 + v c*33), and R̄^{expl,∇}_{𝔐̄,t₁} is F⟦c_{jk} (1 ≤ j, k ≤ 3), c*_{kk} − [c̄*_{kk}]⟧ (twelve variables) modulo: c_{jj} c_{kk} = 0 (j ≠ k); c11 c23 = c31 c22 = c33 c12 = 0; c12 c23 = c22 c13; c11 c32 = c12 c31; c21 c33 = c31 c23; (−1 − a + c) c*22 c33 + (−1 − a + b) c22 c*33 − (−1 − a + c) c23 c32 = 0; (a − b) c*33 c11 + (−1 − b + c) c33 c*11 − (a − b) c13 c31 = 0; (b − c) c*11 c22 + (a − c) c11 c*22 − (b − c) c12 c21 = 0; and the cubic c11 c*22 c*33 + c22 c*11 c*33 + c33 c*11 c*22 − c*11 c23 c32 − c*22 c13 c31 − c*33 c12 c21 + c13 c32 c21 = 0 (the vanishing of the v² coefficient of det A^{(i)}), a power series ring in three variables over the three-dimensional ring R̃ of LLHLM18 Corollary 8.4, so of dimension 6. The map ι′_τ in (3.9) is a monomorphism (Proposition 3.6.3), R̄^τ_ρ̄ is formally smooth over R̄^{expl,∇}_{𝔐̄,w̃}, and there is a bijection Irr(R̄^τ_ρ̄) ↔ Π_i Irr(R̄^{expl,∇}_{𝔐̄,w̃_i}).

*Hypotheses and conventions.*
- ρ̄ is 10-generic; τ is then 7-generic when R^τ_ρ̄ ≠ 0. The structure constants (a, b, c) ∈ F_p³ are those of the indexing convention of the Table 3 caption: the row for w̃_{f−1−i} uses s_i^{−1}(μ_i).
- In (c), the relation c12 c33 = 0 is missing from LLHLM18 Corollary 8.4 and is added by the authors (extraction issue PAPER-LE-LEHUNG-LEVIN-ETAL-20/E118); the comparison with R̃ is the corrected quotient statement of PAPER-LE-LEHUNG-LEVIN-ETAL-20/E119.
- In (b), the first six relations come from LLHLM18 Proposition 8.11 with the units c*12, c*21, c*33 restored, the next two from its proof, and the last from the p-saturation of the 2 × 2 minor condition (LLHLM p. 38). The denominators a − b and −1 − a + b are units by genericity and have been cleared.
- The source does not say which relations are 'the ∇ (monodromy) condition'; the type-dependent relations (those involving a, b, c) are the ones that come from the monodromy condition of LLHLM18.
- The groupoids of Kisin modules with descent data are FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4's (requested); only the explicit coordinates and rings are planned here.

*Construction.* Representability of D̄^{τ,β̄}_{𝔐̄} and the torus quotient: LLHLM18 Theorems 4.17 and 6.12; the identification [Spf R̄^{τ,β̄,□}/GL̂₃] ≅ Spf R̄^{expl,∇} is LLHLM18 Theorems 5.12, 6.14 and Table 7 when every ℓ(w̃_i) > 1, and the arguments of LLHLM18 §8 with Theorem 3.5.2 otherwise. ι′_τ is a monomorphism: full faithfulness on F[ε]-points (LLHL19 Proposition 3.2.18). The bijection on irreducible components follows from the two formally smooth arrows and the Cartesian squares of (3.9). That the listed relations generate the whole ideal is checked as for (3.14) (LLHLM p. 44): a surjection from the ring cut out by the listed relations, both sides reduced and equidimensional of the same dimension with the same number of minimal primes, is an isomorphism (Lemma 3.6.11).

*API.*
- `TauCeti.GaloisDeformation.Local.GL3.explicitRing` (data): R̄^{expl,∇}_{𝔐̄,w̃} for each shape w̃ (three cases by length).
- `TauCeti.GaloisDeformation.Local.GL3.comparisonDiagram` (constructor): The diagram (3.9) relating R̄^τ_ρ̄, explicit rings and étale φ-modules.
- `TauCeti.GaloisDeformation.Local.GL3.iotaPrime_mono` (characterisation): ι′_τ is a monomorphism.
- `TauCeti.GaloisDeformation.Local.GL3.formallySmooth_over_explicit` (other): R̄^τ_ρ̄ is formally smooth over ⊗̂_i R̄^{expl,∇}_{𝔐̄,w̃_i}.
- `TauCeti.GaloisDeformation.Local.GL3.irr_bijection` (equivalence): Irr(R̄^τ_ρ̄) ↔ Π_i Irr(R̄^{expl,∇}_{w̃_i}).

*Unit tests.*
- `gl3Explicit_identity_components` (computation): For the identity shape the explicit ring (twelve variables, the relations of (c)) has exactly 6 minimal primes, each of dimension 6 (Table 3, row id).
- `gl3Explicit_alpha_components` (computation): For shape α the explicit ring (the nine relations of (b)) has exactly 6 minimal primes (Table 3, row α).
- `gl3Explicit_long_shape` (degenerate): For ℓ(w̃_i) = 4 the explicit ring is a power series ring over F (Table 4: the single relation, when present, is solved for one variable), and for ℓ(w̃_i) ≥ 2 the characteristic-zero explicit ring is formally smooth over R_N.
- `gl3Explicit_not_epi` (non-example): ι′_τ is a monomorphism but not an isomorphism onto Φ-Mod^{ét,□}: étale φ-modules not coming from Kisin modules of type (η, τ) are not in the image.

*Used by.* LLHLM 2020, Theorem 3.6.4 — labelling components of R̄^τ_ρ̄ by Serre weights; LocalGaloisDeformationRings:L7/gl3-component-labelling — the labelling

*Acceptance.* Identity shape: the explicit ring has dimension 6 and six minimal primes (L7/gl3-component-labelling); the three ideals 𝔴_ω of the continuation of Table 3 are intersections of two of them each. Length-one shape α: six minimal primes, each of dimension 6, each a power series ring or a hypersurface over its residue field. Every listed relation is satisfied by the universal matrix modulo the ideal in the sense that det A^{(i)} ∈ (unit)·v³.

*Prerequisites.* `L7/kisin-modules-tame-descent`, `R08.1/local-lifting-ring`, `L7/gl3-explicit-ring-rows`.

*Sources.* Daniel Le (LLHLM-2020), §3.6.1, items (1)–(4) and diagram (3.9), published p. 49; arXiv v4 pp. 36–39; Daniel Le (LLHLM-2020), §3.6.1 item (4)(b)–(c), arXiv v4 p. 38 (relations for the shapes α and id; repeated on p. 48).

#### `L7/gl3-component-labelling` — Labelling of components of GL₃ potentially crystalline rings by Serre weights (theorem)

Keep L7/gl3-pcris-deformation-rings with ρ̄ 10-generic and the explicit rings of L7/gl3-explicit-rings and L7/gl3-explicit-ring-rows. (1) (Proposition 3.6.1) There is a unique assignment σ ↦ 𝔭(σ) ⊂ R^□_ρ̄ from W^?(ρ̄) to prime ideals such that, for every tame type τ, Spec R̄^τ_ρ̄ = ⋃_{σ∈W^?(ρ̄,τ)} Spec R^□_ρ̄/𝔭(σ) with the reduced structure, the image of 𝔭(σ) being a minimal prime of R̄^τ_ρ̄. (2) (Theorem 3.6.4) Via the bijections of L7/gl3-explicit-rings and Proposition 3.4.2, ((ω_i, a_i))_i ∈ Π_i Σ_{w̃_i*} corresponds to the component (𝔠_{(ω_{f−1−i}, a_{f−1−i})})_i of Π_i Irr(R̄^{expl,∇}_{𝔐̄,w̃_i}), hence to 𝔭(σ^{(s,μ)}_{(ω,a)}); the primes 𝔠 are those of Table 3. For the shape α they are: (ε1, 1): (c11, c13, c31); (ε2, 0): (c11, c31, c*21 c̃32); (ε2, 1): (c11, c*21 c̃32, (a − b) c13 d22 + (−1 − a + c) c23 c*12); (ε2 − ε1, 0): (c23, d22, c*21 c̃32); (0, 0): (c11, c13, c23); (0, 1): (c11 c*33 − c13 c31, c23, (a − b) c31 d22 + (c − b) c*21 c̃32). For the identity shape: (ε1, 0): (c11, c22, c33, c21, c31, c23); (ε1, 1): (c31, c33, c11, (−1 − a + c) c32 c13 − (−1 − a + b) c12 c*33, c21 c13 − c23 c*11); (ε2, 0): (c11, c22, c33, c12, c31, c32); (ε2, 1): (c12, c22, c11, (a − b) c21 c13 − (−1 − b + c) c23 c*11, c21 c32 − c31 c*22); (0, 0): (c11, c22, c33, c13, c23, c12); (0, 1): (c23, c33, c22, (b − c) c21 c32 − (a − c) c31 c*22, c32 c13 − c12 c*33). (3) (Lemma 3.6.6, Corollary 3.6.7) For types τ, τ′ with z̃* such that s′ = s z* and μ′ = μ + s z̃*(0): if ideals I, I′ (intersections of minimal primes, embedding by embedding) have isomorphic quotients and A^{(f−1−i)} ≡ A′^{(f−1−i)} z̃_{f−1−i} modulo them, they induce the same ideal of R̄^□_ρ̄. Gauge bases are normalised so that the reductions satisfy (Ā^{(i)})_i = (Ā′^{(i)} z̃_i)_i (Remark 3.6.8, (3.12)), which can be arranged by scaling by T(F) (LLHL19 Proposition 3.2.22). (4) (Proposition 3.6.9) The minimal type τ′ of σ = σ^{(s,μ)}_{(ω,a)} is τ(s z*, μ + s z̃*(0)) for the z̃* of Table 3, with w̃(ρ̄, τ′) z̃ = w̃ and W^?(ρ̄, τ′) ⊂ W^?(ρ̄, τ). (5) (Lemma 3.6.10) Let Σ₀ be the graph with vertices (ε1+ε2, 0), (ε1−ε2, 0), (ε2−ε1, 0), (0, 0), (ε1, 0), (ε2, 0), (0, 1), (ε1, 1), (ε2, 1) and the 15 edges (ε1+ε2, 0)–(ε1, 1), (ε1+ε2, 0)–(ε2, 1), (ε1−ε2, 0)–(ε1, 1), (ε1−ε2, 0)–(0, 1), (ε2−ε1, 0)–(ε2, 1), (ε2−ε1, 0)–(0, 1), and each of (0, 0), (ε1, 0), (ε2, 0) joined to each of (0, 1), (ε1, 1), (ε2, 1) (the extension graph of Definition 2.1.6 on Σ₀, Table 1), and give Σ = Σ₀^J the product graph with distance d_gph. If ℓ(w̃_i) ≥ 2 for all i and R_N → R^{expl,∇}_{𝔐̄,w̃} is the fixed formally smooth map, the minimal primes over ϖ are ((z_j)_{j=1}^N + (ϖ)) with z_j ∈ {x_j, y_j}, and for σ₁, σ₂ ∈ W^?(ρ̄, τ): #({z_j(σ₁)} Δ {z_j(σ₂)}) = 2 d_gph(σ₁, σ₂).

*Hypotheses and conventions.*
- ρ̄ 10-generic; R^τ_ρ̄ ≠ 0 for the types considered (extraction issue PAPER-LE-LEHUNG-LEVIN-ETAL-20/E04 for the zero case).
- The identity-shape prime 𝔠_{(0,1)} is stated with the coefficient (b − c), correcting Table 3's (a − b) (PAPER-LE-LEHUNG-LEVIN-ETAL-20/E46, confirmed there by a Singular computation: the printed ideal is not a minimal prime). In the matching of 𝔠_{(0,0)} for the identity shape, z̃_{f−1−i} = t_{(−1,0,1)} (PAPER-LE-LEHUNG-LEVIN-ETAL-20/E09).
- The proof of Lemma 3.6.10 sums the ideals ((z_j) + (ϖ)) + ((z′_j) + (ϖ)) (the source says 'intersection', PAPER-LE-LEHUNG-LEVIN-ETAL-20/E48).
- Σ_{w̃*} is a 4-cycle for ℓ(w̃) = 2, an edge for ℓ = 3 and a point for ℓ = 4, matching N = Σ_i (4 − ℓ(w̃_i)).

*Proof outline.* (1): compare the components for the types τ whose Jordan–Hölder factors contain σ, by induction on the defect, using the minimal type of σ (Lemma 3.5.9, Remark 3.5.10), for which #W^?(ρ̄, τ) = 2^δ. (2): match the components of the explicit rings for τ with those of the minimal types τ′ through (3) and (4), using the matchings of §3.6.2 (αβ: 𝔠_{(0,0)}, 𝔠_{(ε1,1)}, 𝔴₀; α: 𝔠_{(ε1,1)}, 𝔴_{ε2}; id: 𝔠_{(0,0)}, 𝔴₀) and the ideal identities of §3.6.3 (Lemmas 3.6.12–3.6.16), which separate the two primes inside each 𝔴_ω. (3): pull back the comparison to the framed rings and use that Spf R̄^□_ρ̄ → Φ-Mod^{ét,□}_{ℳ̄} is a monomorphism (LLHLM18 Proposition 3.12; ad ρ̄ is cyclotomic-free since ρ̄ is 10-generic), with Proposition 3.2.1 for the change of basis. (4): compute the pairwise intersections of Σ₀, w̃_i*(r(Σ₀)) and z̃_i*(Σ₀). (5): p^{expl}(σ₁) + p^{expl}(σ₂) is prime of height d_gph(σ₁, σ₂) + 1 (rows αβα, αβ, βα of Table 3), while ((z_j) + (ϖ)) + ((z′_j) + (ϖ)) has height ½#({z_j} Δ {z′_j}) + 1.

*Acceptance.* For a type τ with identity shape at one embedding and #W^?(ρ̄, τ) = 6, all six labelled components appear, matching Table 3, row id; the ideals 𝔴_{ε1}, 𝔴_{ε2}, 𝔴₀ of the continuation of Table 3 are the pairwise intersections 𝔠_{(ω,0)} ∩ 𝔠_{(ω,1)}. The weight graph Σ₀ has 9 vertices and 15 edges, is bipartite by the parity of a, and Σ_{(αβ)*} = {(0,1), (0,0), (ε2−ε1,0), (ε2,1)} is a 4-cycle in it.

*Prerequisites.* `L7/gl3-explicit-ring-rows`, `L7/gl3-explicit-rings`, `L7/gl3-pcris-deformation-rings`.

*Sources.* Daniel Le (LLHLM-2020), Proposition 3.6.1, published p. 46; Daniel Le (LLHLM-2020), Theorem 3.6.4, published p. 55; Daniel Le (LLHLM-2020), Lemma 3.6.10, published p. 59 (arXiv v4 p. 43), with Definition 2.1.6 and Table 1 (arXiv v4 pp. 12, 17); Daniel Le (LLHLM-2020), Remark 3.6.8, arXiv v4 pp. 41–42.

#### `L7/partition-monodromy-rings` — Unipotent lifting rings with monodromy bounded by a partition (Clozel–Thorne R^m_v) (construction)

Let v ∤ l (l = p the coefficient prime), q_v ≡ 1 mod l, r̄|G_{L_ṽ} trivial of dimension n, and R^1_v the ring of lifts with char ρ(σ) = (X − 1)^n for σ ∈ I_{L_ṽ}. For a partition m = (m₁ ≥ ⋯ ≥ m_k) of n, R^m_v is the maximal 𝒪-flat reduced quotient of R^1_v classifying lifts for which a lift of Frob_ṽ^{-1} has characteristic polynomial in Taylor's scheme Pol_n(m, q_v) (the polynomials whose roots can be grouped into chains α, q_vα, …, q_v^{m_i−1}α). For m = (n), R^m_v = R^St_v (R08.2/steinberg-condition); for m = (1, …, 1), R^m_v = R^1_v. A local deformation problem is determined by its ring (BLGHT Lemma 3.2).

*Hypotheses and conventions.*
- The Frobenius normalisation: Clozel–Thorne use a lift of Frob_ṽ^{-1}; the chains α, q_vα, … reflect the monodromy relation ΦNΦ^{-1} = q_v N.

*Construction.* Pol_n(m, q) is a closed subscheme of the space of monic degree-n polynomials (Taylor 2008 §2); its preimage in Spec R^1_v is closed, and taking the 𝒪-flat reduced quotient gives R^m_v.

*API.*
- `TauCeti.GaloisDeformation.Local.partitionRing` (data): R^m_v for a partition m of n.
- `TauCeti.GaloisDeformation.Local.partitionRing_points` (characterisation): ℚ̄_l-points of R^m_v are the unipotently ramified lifts whose Frobenius characteristic polynomial lies in Pol_n(m, q_v).
- `TauCeti.GaloisDeformation.Local.partitionRing_steinberg` (compatibility): R^{(n)}_v = R^St_v.
- `TauCeti.GaloisDeformation.Local.partitionRing_trivial` (compatibility): R^{(1,…,1)}_v = R^1_v.
- `TauCeti.GaloisDeformation.Local.partitionRing_mono` (other): If m is obtained by splitting the parts of m′ into shorter consecutive q-chains, Pol_n(m′,q)⊂Pol_n(m,q), giving R^m_v↠R^{m′}_v. Dominance of partitions alone does not imply this inclusion.
- `TauCeti.GaloisDeformation.Local.partitionRing.coefficientMap` (functoriality): Composing a framed lift with a coefficient map preserves unipotent inertia and the defining Frobenius q-chain equations. A point of the reduced flat quotient R^m_v therefore pulls back as a point of that same quotient; no bound on the rank of N is inferred.

*Unit tests.*
- `partitionRing_steinberg` (compatibility): m = (n) gives R^St_v of R08.2/steinberg-condition.
- `partitionRing_trivial` (degenerate): m = (1, …, 1) gives R^1_v.
- `partitionRing_n2` (computation): n = 2, m = (2): the defining equation q_v(tr Φ)² = (1 + q_v)² det Φ.
- `partitionRing_not_scalar` (non-example): R^m_v for m = (2, 1) is not the ring of lifts with scalar inertial semisimplification: it also constrains the Frobenius eigenvalues to contain a chain α, q_vα.
- `partitionRing_dominance_insufficient` (non-example): The roots {1,q,q²,b} for generic b form chains of lengths (3,1), but cannot be grouped into two chains of length 2. Thus dominance (3,1)≥(2,2) does not give the proposed quotient map.

*Used by.* Clozel–Thorne III, §5 — level-raising for symmetric powers via intermediate monodromy; LocalGaloisDeformationRings:L7/partition-ring-smooth-points — smooth points and minimal primes

*Acceptance.* n = 2, m = (2): R^m_v is Gee's P_m (q tr(φ)² = (1 + q)² det φ), the Steinberg ring.

*Prerequisites.* `R08.2/steinberg-condition`, `R08.2/ihara-avoidance-components`, `GlobalGaloisDeformations:R04.3/local-deformation-problem`.

*Sources.* Laurent Clozel (CT-2017), §5.1, item 5, accepted manuscript p. 39.

#### `L7/partition-ring-smooth-points` — Smooth pure points of partition rings and their minimal primes (theorem)

Keep L7/partition-monodromy-rings. Let x ∈ Spec R^m_v[1/l] be a closed point given by ρ : G_{L_ṽ} → GL_n(𝒪) with ρ ⊗ ℚ̄_l pure (Taylor–Yoshida, Lemma 1.4). Then Spec R^1_v[1/l] is formally smooth over K at x, there is a unique minimal prime Q_v of R^1_v in the kernel of R^1_v → 𝒪, and Q_v contains ker(R^1_v → R^m_v).

*Proof outline.* (R^1_v)^red is 𝒪-flat and equidimensional of dimension 1 + n² (Taylor 2008 Proposition 3.1, Thorne 2012 Lemma 3.15; R08.2/ihara-avoidance-components). Spec R_v[1/l] is equidimensional of dimension n² and formally smooth at pure points (BLGGT Lemma 1.3.2; R08.1/smooth-points-generic-fibre), and Spec R^1_v[1/l] is a union of components of it; so x lies on a unique component of Spec R^1_v, whose minimal prime Q_v contains ker(R^1_v → R^m_v) since x ∈ Spec R^m_v.

*Acceptance.* m = (n): pure points of R^St_v (Steinberg twists) are smooth points of R^1_v[1/l].

*Prerequisites.* `L7/partition-monodromy-rings`, `R08.1/smooth-points-generic-fibre`, `R08.2/ihara-avoidance-components`.

*Sources.* Laurent Clozel (CT-2017), Lemma 5.2, accepted manuscript p. 39.

#### `L7/away-from-p-rank-n-interface` — Rank-n conditions away from p: the interface with R08.2 (comparison)

L7's rank-n semistable, Steinberg and minimally ramified conditions away from p are those of R08.2, cited and not rebuilt (RS-08 link R08.2 → L7): (1) minimally ramified lifts in rank n (R08.2/minimally-ramified-condition, R08.2/minimally-ramified-ring), which equal the unipotent lifts when r̄(σ) is a single Jordan block (R08.2/regular-unipotent-minimally-ramified); (2) Steinberg lifts with monodromy (R08.2/steinberg-condition, R08.2/steinberg-ring-domain) and their generalisations with Frobenius characteristic polynomial constrained by q-chains of a partition (L7/partition-monodromy-rings); (3) fixed inertial types with monodromy (R08.2/inertial-type-with-monodromy) with constancy on components (R08.2/fixed-type-rings-rank-n); (4) Ihara-avoidance rings (R08.2/ihara-avoidance-components, R08.2/ihara-avoidance-rings-p2); (5) discrete series lifts (L7/discrete-series-deformation-condition). These, together with the ordinary and Fontaine–Laffaille conditions of L7, are exported to GlobalGaloisDeformations G7 and, for the comparisons of patched complexes under change of local condition, to PotentialAutomorphyInfrastructure PA.3.

*Hypotheses and conventions.*
- Red-team finding RT-AREA-langlands-2/22: the arithmetic consumer of ACC+ §6.2's local comparisons is PotentialAutomorphyInfrastructure PA.3, not DeformationAndDerivedPatchingAlgebra P9 (which keeps abstract hypotheses); the stage text of L7 names P9 and is corrected through the restructure record of this packet.
- Full inertial type including N is constant for two points on a common irreducible component only when each is on a unique irreducible component (R08.2/fixed-type-rings-rank-n).

*Proof outline.* Each item is the cited node; compatibility of the rank-n conditions with polarisation is GlobalGaloisDeformations G7's.

*Acceptance.* n = 2: the conditions specialise to R08.2's rank-two rings.

*Prerequisites.* `R08.2/minimally-ramified-ring`, `R08.2/regular-unipotent-minimally-ramified`, `R08.2/steinberg-ring-domain`, `L7/partition-monodromy-rings`, `R08.2/fixed-type-rings-rank-n`, `R08.2/ihara-avoidance-components`, `R08.2/ihara-avoidance-rings-p2`, `L7/discrete-series-deformation-condition`.

*Sources.* Laurent Clozel (CT-2017), §5.1, accepted manuscript p. 39.

#### `L7/torsion-crystalline-representations` — Torsion crystalline representations with Hodge–Tate weights in [a, b] (definition)

Let w | p with F_w/ℚ_p finite unramified, a ≤ b integers, and Mod(F_w, ℤ_p) the category of finitely generated ℤ_p-modules with continuous Γ_{F_w}-action. (1) A torsion object R is crystalline with Hodge–Tate weights in [a, b] if R ≅ R″/R′ for Γ_{F_w}-stable ℤ_p-lattices R′ ⊆ R″ in a crystalline ℚ_p-representation with Hodge–Tate weights in [a, b]. (2) R ∈ Mod(F_w, ℤ_p) is crystalline with weights in [a, b] if R/p^m R is torsion crystalline with weights in [a, b] for every m ≥ 1. (3) R ∈ Mod(F_w, 𝒪) is crystalline if its underlying ℤ_p-module is. For b − a ≤ p − 2 these are the objects in the essential image of Fontaine–Laffaille's functor (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3), and a lattice R with R_ℚ crystalline is crystalline.

*Hypotheses and conventions.*
- Convention: ℚ_p(1) has Hodge–Tate weight −1 in LTXZZ.
- LTXZZ footnote 5 also claims the converse (R crystalline ⟹ R_ℚ crystalline) by Lemma 2.2.6; only the direction R_ℚ crystalline ⟹ R crystalline is immediate (take R″ = R, R′ = p^m R) and used (extraction issue).

*Construction.* Torsion crystalline objects are closed under subobjects and quotients in every fixed weight interval by pulling back or pushing forward the lattice quotient R″/R′. Direct sums use direct sums of crystalline representations. The short FL range supplies its fully faithful classification, not this closure property.

*API.*
- `TauCeti.GaloisDeformation.Local.IsTorsionCrystalline` (data): R is a subquotient R″/R′ of lattices in a crystalline representation with weights in [a, b].
- `TauCeti.GaloisDeformation.Local.IsCrystallineIntegral` (data): R crystalline iff every R/p^m R is torsion crystalline.
- `TauCeti.GaloisDeformation.Local.IsTorsionCrystalline.closed` (other): For every fixed [a,b], torsion crystalline objects are closed under subobjects, quotients and finite direct sums.
- `TauCeti.GaloisDeformation.Local.IsCrystallineIntegral.of_rational` (compatibility): A lattice in a crystalline representation with weights in [a, b] is crystalline.
- `TauCeti.GaloisDeformation.Local.IsTorsionCrystalline.fontaineLaffaille` (equivalence): For b − a ≤ p − 2 these are the representations of Fontaine–Laffaille modules.
- `TauCeti.GaloisDeformation.Local.IsTorsionCrystalline.twist` (functoriality): Tensoring a torsion crystalline object with a lattice in a crystalline character of constant labelled Hodge weight w shifts its weight interval from [a,b] to [a+w,b+w]. This states the shift in terms of w, independently of the cyclotomic sign convention.

*Unit tests.*
- `torsionCrys_mu_p` (computation): μ_p ≅ ℤ/p(1) is torsion crystalline with weights in [−1, 0] (LTXZZ convention).
- `torsionCrys_trivial` (degenerate): ℤ/p^m with trivial action is torsion crystalline with weights in [0, 0].
- `torsionCrys_wide_range` (non-example): At b−a=p−1, unrestricted integral FL full faithfulness can fail (R06.4/fontaine-laffaille-endpoint-non-example). Torsion crystalline subquotient closure still holds by the lattice-quotient definition.
- `torsionCrys_lattice` (compatibility): A Γ-stable lattice in a crystalline representation is crystalline in the sense of (2).

*Used by.* LTXZZ 2022, §2.2 — the Bloch–Kato finite local conditions at ℓ for Selmer groups and the Fontaine–Laffaille deformation condition 𝒟^FL; SelmerIwasawaCohomology:L4 — finite Bloch–Kato local conditions

*Acceptance.* For p≥3 and e(F_w/ℚ_p)=1<p−1, the relevant two-weight torsion crystalline condition agrees with finite-flat representations after the stated sign/Tate-twist conversion.

*Prerequisites.* `L7/fontaine-laffaille-deformation-condition`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-essential-image-subquotients`, `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences`.

*Sources.* Yifeng Liu (LTXZZ-2022), Definition 2.2.4, published pp. 124–125.

*Coverage of L7:* planned. Remaining: Lemma-level refinement: the matchings of LLHLM §3.6.2 (αβ, α and identity shapes) and the ideal identities of Lemmas 3.6.11–3.6.16 as separate nodes; the rows of L7/gl3-explicit-ring-rows one node per shape. Gap recorded: Borel subgroups of split reductive groups over coefficient rings (relative theory) for the general-G ordinary condition; GL_n and GSp₄ use explicit flags.

### Layer L8: Ordinary flags versus determinant ordinary conditions

L8 keeps the distinction of ACC+ §6.2.6 between the ordinary flag scheme with its image ring and the determinant-ordinary quotient defined by characteristic polynomials and ordered products, with the universal character coefficient rings and their torsion components. The comparison is proved only at the published level (components, trivial ρ̄, [F_v:ℚ_p] > n(n + 1)/2 + 1). Calegari–Geraghty's Lemma 3.22 (the doubling ideal equals the unramified ideal) is the rank-two trivial-residual case in which the ring with a Frobenius eigenvalue is compared with its image.

*Planets:* Universal character coefficient ring Λ_v; Determinant-ordinary deformation ring; Determinant-ordinary versus flag-ordinary components; Doubling ideal equals unramified ideal.

#### `L8/ordinary-coefficient-ring` — The universal character coefficient rings Λ_v and Λ̃_v (construction)

Let F_v/ℚ_p be finite, 𝒪 the ring of integers of a finite extension E/ℚ_p with residue field k, and ρ̄ : G_{F_v} → GL_n(k) with a G_{F_v}-stable full flag 0 = Fil⁰ ⊂ ⋯ ⊂ Filⁿ = kⁿ, graded characters χ̃_i : G_{F_v} → k^× and χ̄_i = χ̃_i|_{I_{F_v}}. Let 𝒪_{F_v}^×(p) be the pro-p completion of 𝒪_{F_v}^×, with Art_{F_v} : 𝒪_{F_v}^×(p) ≅ I^{ab}_{F_v}(p). For a nonempty set of minimal primes of 𝒪[[𝒪_{F_v}^×(p)ⁿ]] with intersection 𝔞, Λ_v = 𝒪[[𝒪_{F_v}^×(p)ⁿ]]/𝔞; 𝔞 corresponds to a fixed collection of ordered n-tuples of characters of the torsion subgroup of I^{ab}_{F_v}(p). For each i the universal character χ_i^univ : I_{F_v} → Λ_v^× is the Teichmüller lift of χ̄_i times the map sending I_{F_v} to the i-th copy of 𝒪_{F_v}^×(p) via Art_{F_v}^{−1}. With Λ̃_v = 𝒪[[F_v^×(p)ⁿ]] ⊗_{𝒪[[𝒪_{F_v}^×(p)ⁿ]]} Λ_v, the χ_i^univ extend to χ̃_i^univ : G_{F_v} → Λ̃_v^× lifting χ̃_i.

*Hypotheses and conventions.*
- v | p; the flag on ρ̄ is part of the data.

*Construction.* 𝒪[[𝒪_{F_v}^×(p)ⁿ]] ≅ 𝒪[Δⁿ][[ℤ_p^{n[F_v:ℚ_p]}]] with Δ the torsion; its minimal primes are indexed by Galois orbits of characters of Δⁿ, which gives the description of 𝔞. F_v^×(p) ≅ 𝒪_{F_v}^×(p) × ϖ^{ℤ_p}, so Λ̃_v adds one free variable per i for Frobenius, and χ̃_i^univ is χ_i^univ on inertia and the Teichmüller lift of χ̃_i(Frob) times the new variable on ϖ.

*API.*
- `TauCeti.GaloisDeformation.Local.ordinaryWeightRing` (constructor): Λ_v = 𝒪[[𝒪_{F_v}^×(p)ⁿ]]/𝔞 for a chosen set of minimal primes.
- `TauCeti.GaloisDeformation.Local.universalInertialCharacter` (constructor): χ_i^univ : I_{F_v} → Λ_v^×.
- `TauCeti.GaloisDeformation.Local.ordinaryWeightRingTilde` (constructor): Λ̃_v and χ̃_i^univ : G_{F_v} → Λ̃_v^×.
- `TauCeti.GaloisDeformation.Local.universalInertialCharacter_residual` (characterisation): χ_i^univ ≡ χ̄_i modulo the maximal ideal.
- `TauCeti.GaloisDeformation.Local.minimalPrimes_torsionCharacters` (equivalence): Minimal primes ↔ Galois orbits of torsion characters.
- `TauCeti.GaloisDeformation.Local.ordinaryWeightRing.universal` (universal-property): Continuous 𝒪-algebra maps Λ_v→A correspond to ordered continuous characters of 𝒪_{F_v}^×(p) with the prescribed reductions whose induced map from the completed group algebra kills 𝔞. The correspondence commutes with maps of complete coefficient algebras.

*Unit tests.*
- `ordinaryWeightRing_Qp` (computation): F_v = ℚ_p, p odd: 𝒪_{ℚ_p}^×(p) ≅ 1 + pℤ_p ≅ ℤ_p is torsion-free, so Λ_v = 𝒪[[X_1, …, X_n]] with 𝔞 = 0.
- `ordinaryWeightRing_torsion` (computation): F_v = ℚ_p(ζ_p): 𝒪_{F_v}^×(p) has torsion μ_p, so 𝒪[[𝒪_{F_v}^×(p)]] has several minimal primes once ζ_p ∈ 𝒪, and 𝔞 selects tuples of characters of μ_pⁿ.
- `ordinaryWeightRing_n_one` (degenerate): n = 1: χ_1^univ is the universal deformation of χ̄_1|_{I_{F_v}} with values in Λ_v, and Λ̃_v adds the Frobenius variable.

*Used by.* LocalGaloisDeformationRings:L7/ordinary-flag-scheme — the inertial characters of the graded pieces.; LocalGaloisDeformationRings:L8/determinant-ordinary-ring — the characters χ̃_i^univ in (6.2.7)–(6.2.8).; OrdinaryAutomorphicFormsAndModularityLifting:R21.3 — local ordinary conditions of the global rings.

*Acceptance.* The chosen torsion components are part of the data: Λ_v is not a domain in general. Λ̃_v, not Λ_v, carries characters of the whole decomposition group.

*Prerequisites.* `PadicMeasuresIwasawaAlgebras:L1/convolution-algebra`, `mathlib:MvPowerSeries`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

*Sources.* Patrick B. Allen (ACC-POTENTIAL-AUTOMORPHY-CM-2023), §6.2.6, p. 138 (arXiv v2; printed page = PDF page).

#### `L8/determinant-ordinary-ring` — The determinant-ordinary rings R̃^{det,ord}_v and R^{det,ord}_v (construction)

Let R̃^□_v = R^□_v ⊗_{Λ_v} Λ̃_v and R̃^{det,ord}_v its maximal quotient on which, for all g, g_1, …, g_n ∈ G_{F_v}, (6.2.7) det(X − ρ^□(g)) = ∏_{i=1}^n (X − χ̃_i^univ(g)) and (6.2.8) (ρ^□(g_1) − χ̃_1^univ(g_1))⋯(ρ^□(g_n) − χ̃_n^univ(g_n)) = 0. R^{det,ord}_v is the image of R^□_v → R̃^{det,ord}_v.

*Hypotheses and conventions.*
- v | p; the flag on ρ̄ gives the residual characters.

*Construction.* The relations are closed conditions on the matrix coefficients (finitely many generators after continuity), so the maximal quotient exists in CNL.

*API.*
- `TauCeti.GaloisDeformation.Local.detOrdTilde` (constructor): R̃^{det,ord}_v, the quotient by (6.2.7)–(6.2.8).
- `TauCeti.GaloisDeformation.Local.detOrd` (constructor): R^{det,ord}_v = im(R^□_v → R̃^{det,ord}_v).
- `TauCeti.GaloisDeformation.Local.detOrdTilde_charpoly` (characterisation): (6.2.7) holds over R̃^{det,ord}_v.
- `TauCeti.GaloisDeformation.Local.detOrdTilde_product` (characterisation): (6.2.8) holds over R̃^{det,ord}_v.
- `TauCeti.GaloisDeformation.Local.detOrd_universal` (universal-property): R^□_v → R factors through R^{det,ord}_v when R ↪ S carries characters ψ_i with the relations.
- `TauCeti.GaloisDeformation.Local.detOrdTilde.factor_iff` (universal-property): A continuous map from R̃^□_v to A factors uniquely through R̃^{det,ord}_v iff every coefficient of (6.2.7) and every ordered matrix entry of (6.2.8) vanishes in A. The ordered products are required for all tuples of group elements, and are preserved by A→A′.

*Unit tests.*
- `detOrd_n_one` (degenerate): n = 1: (6.2.7) says ρ^□ = χ̃_1^univ and (6.2.8) is the same relation.
- `detOrd_diagonal` (computation): A diagonal lift diag(χ̃_1, …, χ̃_n) satisfies (6.2.7) and (6.2.8).
- `detOrd_charpoly_not_enough` (non-example): Over A=ℤ/9 let M=diag(4,7), U=(1 1;0 1), and H the finite subgroup they generate in GL₂(A). Every element of H has characteristic polynomial (X−1)², with both prescribed characters equal to 1, but (M−I)(U−I)=(0 3;0 0)≠0. Thus (6.2.7) does not imply (6.2.8).

*Used by.* LocalGaloisDeformationRings:L8/determinant-flag-comparison — components of R^{det,ord}_v.; GlobalGaloisDeformations:G7 — the ordinary local deformation problem D^{det,ord}_v of ACC+.

*Acceptance.* (6.2.7) alone (equal characteristic polynomials) does not give a full invariant flag over a nonreduced coefficient ring; the ordered product (6.2.8) is part of the definition. R^{det,ord}_v is the image in R̃^{det,ord}_v, not R̃^{det,ord}_v itself: the Frobenius variables of Λ̃_v are eliminated.

*Prerequisites.* `R08.1/local-lifting-ring`, `L8/ordinary-coefficient-ring`.

*Sources.* Patrick B. Allen (ACC-POTENTIAL-AUTOMORPHY-CM-2023), §6.2.6, p. 138 (arXiv v2; printed page = PDF page); Patrick B. Allen (ACC-POTENTIAL-AUTOMORPHY-CM-2023), §6.2.6, p. 139 (arXiv v2; printed page = PDF page).

#### `L8/det-ord-finite` — R̃^{det,ord}_v is finite over R^{det,ord}_v (lemma)

(ACC+ Lemma 6.2.9.) R̃^{det,ord}_v is a finite R^{det,ord}_v-algebra.

*Proof outline.* It suffices that R̃^{det,ord}_v is finite over R^□_v, i.e. (complete Nakayama) that R̃^{det,ord}_v/𝔪_{R^□_v} is Artinian. (6.2.7) at g = Art_{F_v}(ϖ_v) makes each Frobenius variable of Λ̃_v a root of a monic polynomial over R^□_v.

*Acceptance.* Finiteness is over R^{det,ord}_v (equivalently R^□_v), not over Λ_v; it is what lets geometric points of R^{det,ord}_v lift to R̃^{det,ord}_v.

*Prerequisites.* `L8/determinant-ordinary-ring`, `mathlib:Module.Finite`.

*Sources.* Patrick B. Allen (ACC-POTENTIAL-AUTOMORPHY-CM-2023), §6.2.6, Lemma 6.2.9, p. 139 (arXiv v2; printed page = PDF page).

#### `L8/ordinary-point-criteria` — Point criteria and Spec R^△_v ⊂ Spec R^{det,ord}_v (lemma)

If R ↪ S is an injective map of R^□_v-algebras and there are characters ψ_1, …, ψ_n : G_{F_v} → S^× with ψ_i|_{I_{F_v}} the push-forward of χ_i^univ satisfying (6.2.7) and (6.2.8) with the push-forward of the universal lifting, then R^□_v → R factors through R^{det,ord}_v. Consequently Spec R^△_v ⊂ Spec R^{det,ord}_v as topological spaces, and there is a surjection of R^□_v-algebras R^{det,ord}_v ↠ (R^△_v)_red.

*Proof outline.* The ψ_i define Λ̃_v → S compatible with Λ_v, so R̃^□_v → S factors through R̃^{det,ord}_v; injectivity of R ↪ S transfers the factorisation to R. For a minimal prime 𝔭 of R^△_v, take R = R^△_v/𝔭 and S its integral closure in a large finite extension of the fraction field; the flag over K gives the ψ_i, so R^□_v → R^△_v/𝔭 factors through R^{det,ord}_v. (R^△_v)_red is the image of R^□_v → ∏_𝔭 R^△_v/𝔭.

*Acceptance.* Only the reduced quotient of R^△_v is reached: no ring isomorphism between R^△_v and R^{det,ord}_v is asserted.

*Prerequisites.* `L8/determinant-ordinary-ring`, `L7/ordinary-flag-scheme`.

*Sources.* Patrick B. Allen (ACC-POTENTIAL-AUTOMORPHY-CM-2023), §6.2.6, p. 139 (arXiv v2; printed page = PDF page).

#### `L8/distinct-characters-flag` — Characteristic polynomials and ordered products give a flag (lemma)

(ACC+ Lemma 6.2.11.) Let K be a field, G a group and ρ : G → GL_n(K). If χ_1, …, χ_n : G → K^× are pairwise distinct characters with det(X − ρ(g)) = ∏_i(X − χ_i(g)) for all g and (ρ(g_1) − χ_1(g_1))⋯(ρ(g_n) − χ_n(g_n)) = 0 for all g_1, …, g_n, then there is a G-stable flag 0 = Fil⁰ ⊂ ⋯ ⊂ Filⁿ = Kⁿ with Fil^i/Fil^{i−1} ≅ K(χ_i).

*Hypotheses and conventions.*
- K a field; the χ_i pairwise distinct.

*Proof outline.* Define V_i ⊇ V_{i−1} with V_i/V_{i−1} the maximal subspace of V/V_{i−1} on which G acts by χ_i; each V_i is G-stable. The ordered-product identity forces V_n = V. Each V_i/V_{i−1} ≅ K(χ_i)^{m_i}, and the characteristic-polynomial identity with distinct χ_i forces every m_i = 1.

*Used by.* LocalGaloisDeformationRings:L8/determinant-flag-comparison — points over U lie in Spec R^△_v.

*Acceptance.* Distinctness is needed: with χ_1 = χ_2 the multiplicities cannot be separated. The lemma is over a field; over nonreduced rings it gives nothing, which is why only (R^△_v)_red is compared.

*Prerequisites.* `L8/determinant-ordinary-ring`.

*Sources.* Patrick B. Allen (ACC-POTENTIAL-AUTOMORPHY-CM-2023), §6.2.6, Lemma 6.2.11, p. 140 (arXiv v2; printed page = PDF page).

#### `L8/determinant-flag-comparison` — Determinant-ordinary versus flag-ordinary components (theorem)

(ACC+ Proposition 6.2.12.) Let U ⊂ Spec Λ_v be the open locus where χ_1^univ, …, χ_n^univ are pairwise distinct, Z its complement, and f : Spec R^△_v → Spec Λ_v, g : Spec R^{det,ord}_v → Spec Λ_v the structure maps. Suppose ρ̄ is trivial and [F_v : ℚ_p] > n(n + 1)/2 + 1. (1) f^{−1}(U) = g^{−1}(U) in Spec R^□_v; hence every irreducible component C of Spec Λ_v is dominated by a unique irreducible component C′ of Spec R^{det,ord}_v, of dimension n² + 1 + n(n + 1)/2 · [F_v : ℚ_p]. (2) Every irreducible component C′ of R^{det,ord}_v not dominating a component of Spec Λ_v lies in g^{−1}(Z) and has dimension ≤ n² − 1 + n(n + 1)/2 · [F_v : ℚ_p].

*Hypotheses and conventions.*
- ρ̄ trivial; [F_v : ℚ_p] > n(n + 1)/2 + 1 (stronger than the n(n − 1)/2 + 1 of trivial-residual-flag-ring).

*Proof outline.* (1) A geometric point of g^{−1}(U) lifts to R̃^{det,ord}_v (det-ord-finite); there the characters are distinct, so distinct-characters-flag gives a flag and the point lies in Spec R^△_v. Proposition 6.2.10 then gives the components and their dimension. (2) A component not dominating Λ_v maps into Z. Its generic representation has semisimplification ⊕χ_i^univ on inertia, hence a flag in some order σ ∈ S_n, so C′ ⊆ h^{−1}(Z) ⊆ Spec R^{△,σ}_v. dim 𝒢^σ_v ×_{Λ_v} Z ≤ 1 + n² + n(n + 1)/2 + n(n + 1)[F_v:ℚ_p]/2 − [F_v:ℚ_p] by the tangent computation of [Ger19, Lemma 3.7] (over a finite field), which is ≤ n² − 1 + n(n + 1)[F_v:ℚ_p]/2 under the hypothesis.

*Used by.* GlobalGaloisDeformations:G7 — component support for ordinary patching (ACC+ §6.3).; PotentialAutomorphyInfrastructure:PA.3 — dimension bounds of the non-dominating components. (the arithmetic consumer is PA.3, which compares patched complexes under changes of local deformation condition; P9 keeps abstract hypotheses: red-team finding RT-AREA-langlands-2/22)

*Acceptance.* The comparison is of underlying spaces and components (and of R^{det,ord}_v with (R^△_v)_red), not a ring isomorphism; equality of characteristic polynomials alone gives no flag over nonreduced rings.

*Prerequisites.* `L8/ordinary-point-criteria`, `L8/distinct-characters-flag`, `L8/det-ord-finite`, `L7/trivial-residual-flag-ring`, `R08.1/local-tangent-obstruction`, `L7/ordinary-flag-scheme-local-structure`.

*Sources.* Patrick B. Allen (ACC-POTENTIAL-AUTOMORPHY-CM-2023), §6.2.6, Proposition 6.2.12, p. 140 (arXiv v2; printed page = PDF page); Patrick B. Allen (ACC-POTENTIAL-AUTOMORPHY-CM-2023), §6.2.6, proof of Proposition 6.2.12, p. 141 (arXiv v2; printed page = PDF page).

#### `L8/doubling-equals-unramified` — The doubling ideal equals the unramified ideal (Calegari–Geraghty Lemma 3.22) (theorem)

Keep L7/ordinary-ring-with-frobenius-eigenvalue. (1) R^unr ≅ 𝒪/ϖ^m⟦φ₁, φ₂, φ₃, φ₄⟧/(φ₁ + φ₄ + φ₁φ₄ − φ₂φ₃), where ϖ^m is the largest power of ϖ dividing χ^{n−1}(g) − 1 for all g in the decomposition group at p, and R̃^unr ≅ R^unr[β]/(β² − (φ₁ + φ₄)β − (φ₁ + φ₄)) ≅ R^unr ⊕ R^unr as R^unr-modules; so R^unr → R̃^unr is injective and R^unr acts faithfully on R̃^unr/R^unr ≅ R^unr. (2) J = I: the annihilator of R̃†/R† (the ring with a Frobenius eigenvalue modulo the flag-free image ring) is the kernel of the map to the unramified quotient.

*Hypotheses and conventions.*
- This is the rank-two trivial-residual instance of L8's comparison of a flag-bearing ring (here: with an eigenvalue on the unramified quotient) with its image after forgetting the flag; equality of characteristic polynomials alone does not recover R̃† from R†.

*Proof outline.* (1): by determinants R^unr and R̃^unr are killed by ϖ^m; an unramified lift is determined by φ = (1 + φ₁ φ₂; φ₃ 1 + φ₄) with det 1, and an eigenvalue α = 1 + β is a root of its characteristic polynomial. (2) J ⊆ I: J annihilates R̃^unr/R^unr ≅ R^unr, on which R^unr acts faithfully, so J maps to 0 in R^unr. I ⊆ J: Snowden's relation (6), (φ − α)(g − 1) = (α^{-1} − α)(g − 1), shows that the entries of g − 1 (which generate I) kill R̃†/R†.

*Acceptance.* m = 1 when χ^{n−1} ≢ 1 mod ϖ² on D_p: R^unr is a hypersurface over k.

*Prerequisites.* `L7/ordinary-ring-with-frobenius-eigenvalue`, `L8/determinant-ordinary-ring`.

*Sources.* Frank Calegari (CG-2018), Lemma 3.22, published p. 335; Frank Calegari (CG-2018), proof of Lemma 3.22, published pp. 336–337.

*Coverage of L8:* planned.

### Layer R08.4: Finite-flat and Barsotti–Tate components

R08.4 keeps the rank-two finite-flat and Barsotti–Tate component theorems used in Kisin's modularity arguments, instantiating L7's lattice moduli in rank two (RS-08): flat deformation rings, the moduli of finite flat models and Kisin's resolution, components read through the special fibre, the ordinary and non-ordinary loci in rank two, the components a modular point meets, and Savitt's weight-two rings of tame type. It also holds Khare–Wintenberger's finite cocycles (Kummer theory over F^nr with 𝒪-module coefficients, Lemma 3.7) and the algebraisation Lemma 3.8, which both R08.5 and R08.6 use, and the unique-generalisation statement for Barsotti–Tate rings, which rests on a recorded gap (generic reducedness, Caraiani–Emerton–Gee–Savitt).

*Planets:* Moduli of finite flat models; Kisin's resolution of flat deformation rings; Connected components through the special fibre; Connectedness of the non-ordinary locus; Components of rank-two Barsotti–Tate deformation rings; Savitt's weight-two deformation rings.

#### `R08.4/flat-deformation-condition` — Flat deformations and the flat deformation ring (construction)

The deformations of V_𝔽 over Artinian 𝒪-algebras A that are the generic fibre of a finite flat group scheme over 𝒪_K form a deformation condition: D^fl ⊆ D_{V_𝔽} is relatively representable. So the framed lifting ring R^□ (R08.1/local-lifting-ring) has a quotient R^{fl,□} classifying flat lifts, and when End_{𝔽[G_K]} V_𝔽 = 𝔽 the universal deformation ring has a quotient R^fl. An 𝒪_E-point is flat exactly when V_{𝒪_E}/p^n comes from a finite flat group scheme for every n, that is, when V_{𝒪_E} is the Tate module of a p-divisible group.

*Hypotheses and conventions.*
- K/ℚ_p is finite with p > 2 (p = 2 is stage R08.5), e = e(K/ℚ_p), K₀ the maximal unramified subfield, 𝔽 a finite field, and V_𝔽 a d-dimensional 𝔽-representation of G_K that is the generic fibre of a finite flat group scheme; 𝔖 = W(k)⟦u⟧ and E(u) are as in L7/finite-height-lattices.
- Finite flat representations are stable under subobjects, quotients and direct sums (Raynaud), requested from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; Ramakrishna deduces relative representability from this.

*Construction.* Ramakrishna's criterion: a subfunctor of D_{V_𝔽} stable under subobjects, finite products and the relevant fibre products is relatively representable; Raynaud's stability supplies the hypotheses. Framed version: impose the condition on the framed lifting functor; forgetting the frame is formally smooth (R08.1/local-forget-framing). 𝒪_E-points: a compatible system of finite flat models of V/p^n is a p-divisible group (Raynaud [Ra, 2.3.1] in Kisin).

*API.*
- `TauCeti.GaloisDeformation.Local.flatLiftingRing` (constructor): R^{fl,□}, the quotient of R^□ classifying flat lifts.
- `TauCeti.GaloisDeformation.Local.flatLiftingRing_points` (characterisation): An 𝒪_E-point is flat iff it is the Tate module of a p-divisible group.
- `TauCeti.GaloisDeformation.Local.flatDeformationRing` (constructor): R^fl when End V_𝔽 = 𝔽.
- `TauCeti.GaloisDeformation.Local.flatLiftingRing.universal` (universal-property): For an Artinian coefficient algebra A, the natural bijection Hom_cont,𝒪(R^{fl,□},A)≃{framed lifts to A satisfying the finite-flat deformation condition} commutes with coefficient maps. At coefficient integers its point criterion is the p-divisible-group criterion already stated.

*Unit tests.*
- `flat_mu_p_plus_Z_p` (computation): 𝔽(1) ⊕ 𝔽 is finite flat.
- `flat_points_iff_pdivisible` (characterisation): 𝒪_E-points of R^{fl,□} are Tate modules of p-divisible groups.
- `omega_sq_not_flat` (non-example): ω² over ℚ_p (p > 3) has no finite flat model.

*Used by.* LocalGaloisDeformationRings:R08.4/finite-flat-model-moduli — the target of Θ.; LocalGaloisDeformationRings:R08.4/rank-two-bt-components — the ring whose components are compared.

*Acceptance.* V_𝔽 = 𝔽(1) ⊕ 𝔽 (the points of μ_p ⊕ ℤ/p) is finite flat, and its flat lifts include the Tate module of a product of a multiplicative and an étale p-divisible group. For K = ℚ_p and p > 3 the character ω² is not finite flat: finite flat characters restrict to inertia as ω^i with 0 ≤ i ≤ e. The flat condition is not the crystalline condition integrally: R^{fl,□} is a quotient of R^□, while R08.3's crystalline ring is defined by its generic fibre; they agree after inverting p (flat-generic-fibre).

*Prerequisites.* `R08.1/local-lifting-ring`, `R08.1/local-forget-framing`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

*Sources.* Mark Kisin (KISIN-FFLAT-2009), (2.1.1), p. 16.

#### `R08.4/finite-flat-model-moduli` — The moduli of finite flat models (construction)

For a complete local R with residue field 𝔽 and ξ ∈ D^fl(R), the lattices of E-height ≤ 1 in M(V_R) (L7/height-lattice-moduli with h = 1: 𝔖_B-submodules 𝔐_B ⊂ M_B, projective of rank d, φ-stable, spanning, with coker(φ*𝔐_B → 𝔐_B) killed by E(u)) are represented by a projective R-scheme 𝒢ℛ_{V_𝔽,ξ}. For R = R^fl (End V_𝔽 = 𝔽), or R = R^{fl,□}, this gives a projective morphism Θ : 𝒢ℛ_{V_𝔽} → Spec R^fl sending a lattice to the flat deformation it defines. Its closed fibre 𝒢ℛ_{V_𝔽,0} is a projective 𝔽-scheme whose 𝔽′-points are the isomorphism classes of finite flat models of V_𝔽 ⊗ 𝔽′.

*Hypotheses and conventions.*
- K/ℚ_p is finite with p > 2 (p = 2 is stage R08.5), e = e(K/ℚ_p), K₀ the maximal unramified subfield, 𝔽 a finite field, and V_𝔽 a d-dimensional 𝔽-representation of G_K that is the generic fibre of a finite flat group scheme; 𝔖 = W(k)⟦u⟧ and E(u) are as in L7/finite-height-lattices.
- Kisin's modules of E-height ≤ 1 and their equivalence with finite flat group schemes (p > 2), and Breuil's full faithfulness of restriction from G_K to G_{K_∞} on finite flat representations, are requested from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.

*Construction.* L7/height-lattice-moduli with h = 1 represents the lattice functor by a projective scheme; Kisin (2.1.7), (2.1.10) (bounding the lattices between u^iN and u^{−i}N, then formal GAGA). Θ (Kisin (2.1.4)): a lattice gives a finite flat group scheme by R07.4, whose G_{K_∞}-representation extends uniquely to G_K by Breuil's full faithfulness; this is the flat deformation. Closed fibre (2.1.13): an 𝔽′-point is a lattice killed by p, i.e. a finite flat model with 𝔽′-action, and conversely by the equivalence on objects killed by p.

*API.*
- `TauCeti.GaloisDeformation.Local.finiteFlatModels` (constructor): 𝒢ℛ_{V_𝔽,ξ}, the projective R-scheme of E-height ≤ 1 lattices.
- `TauCeti.GaloisDeformation.Local.finiteFlatModels_toFlat` (constructor): Θ : 𝒢ℛ_{V_𝔽} → Spec R^fl, projective.
- `TauCeti.GaloisDeformation.Local.finiteFlatModels_closedFibre` (characterisation): 𝒢ℛ_{V_𝔽,0}(𝔽′) ≃ finite flat models of V_𝔽 ⊗ 𝔽′.
- `TauCeti.GaloisDeformation.Local.finiteFlatModels.points` (universal-property): For an R-algebra B in the source moduli category, morphisms Spec B→𝒢ℛ_{V_𝔽,ξ} correspond to E-height≤1 projective lattices in M(ξ)_B, with the specified generic-fibre identification. Pullback of the universal lattice gives this bijection and commutes with B→B′.

*Unit tests.*
- `finiteFlatModels_irreducible_Qp` (computation): K = ℚ_p, V_𝔽 irreducible: one model.
- `finiteFlatModels_closedFibre_models` (characterisation): Closed-fibre points are finite flat models.
- `finiteFlatModels_two_models_ramified` (non-example): Over ℚ_p(ζ_p), μ_p and ℤ/p are two models of one generic fibre.

*Used by.* LocalGaloisDeformationRings:R08.4/hodge-type-resolution — the resolution is its p-torsion-free Hodge-type part.; LocalGaloisDeformationRings:R08.4/small-ramification-flat — Θ is an isomorphism for e < p − 1.

*Acceptance.* K = ℚ_p and V_𝔽 irreducible: 𝒢ℛ_{V_𝔽,0} is one point (Raynaud, small-ramification-flat). 𝔽′-points of the closed fibre are exactly the finite flat models of V_{𝔽′}, not the flat deformations. K = ℚ_p(ζ_p) (e = p − 1): μ_p and ℤ/p are two non-isomorphic models of the same generic fibre, so the closed fibre has more than one point and Θ is not a monomorphism.

*Prerequisites.* `L7/height-lattice-moduli`, `L7/finite-height-lattices`, `R08.4/flat-deformation-condition`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

*Sources.* Mark Kisin (KISIN-FFLAT-2009), Corollaries (2.1.11) and (2.1.13), p. 21.

#### `R08.4/small-ramification-flat` — Unique models in small ramification (theorem)

If e(K/ℚ_p) < p − 1, then Θ : 𝒢ℛ_{V_𝔽,ξ} → Spec R is an isomorphism for every ξ, and in particular Θ : 𝒢ℛ_{V_𝔽} → Spec R^fl is an isomorphism: a flat deformation has a unique finite flat model.

*Hypotheses and conventions.*
- Raynaud's theorems for e < p − 1 (uniqueness of finite flat prolongations, [Ra, 3.3.3], and splitting of extensions whose generic fibre splits, [Ra, 3.3.6]) are requested from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, whose stage text asks for them.

*Proof outline.* The reduced closed fibre of 𝒢ℛ_{V_𝔽,ξ} is one point by Raynaud's uniqueness, so Θ is finite. The closed fibre is reduced: an 𝔽[ε]-point is an extension of finite flat group schemes whose generic fibre splits, which splits by Raynaud, so the point factors through 𝔽. A finite map with reduced one-point closed fibre that is a bijection on points over Artinian rings is an isomorphism.

*Acceptance.* K = ℚ_p, p ≥ 3 (e = 1 < p − 1): Θ is an isomorphism; flat deformation rings are the Fontaine–Laffaille rings of weight two. e = p − 1 (K = ℚ_p(ζ_p)): the μ_p versus ℤ/p example shows the hypothesis is sharp. For p = 2 the hypothesis e < 1 never holds; the 2-adic case is R08.5.

*Prerequisites.* `R08.4/finite-flat-model-moduli`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.

*Sources.* Mark Kisin (KISIN-FFLAT-2009), Proposition (2.1.14), p. 22.

#### `R08.4/flat-generic-fibre` — The generic fibre of the flat deformation ring (theorem)

On the generic fibre, flat deformations are the crystalline deformations with Hodge–Tate weights in {0, 1}: for an E-point ξ of R^{fl,□}, the completion of R^{fl,□}[1/p] at ξ pro-represents crystalline deformations of V_ξ, it is formally smooth over E, and if ξ has p-adic Hodge type v = (v_ψ)_ψ (v_ψ the multiplicity of the weight 1 at the embedding ψ) its dimension is d² + Σ_ψ (d − v_ψ)v_ψ. For the unframed ring (End V_𝔽 = 𝔽) the dimension is 1 + Σ_ψ (d − v_ψ)v_ψ.

*Hypotheses and conventions.*
- Crystalline with Hodge–Tate weights in {0, 1} implies Barsotti–Tate (Breuil for p > 2, Kisin), requested from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.
- The tangent-space count is R08.3/pcris-generic-smooth specialised to Hodge–Tate weights {0, 1}: dim ad D/Fil⁰ ad D = Σ_ψ (d − v_ψ)v_ψ.

*Proof outline.* A flat 𝒪_E-lattice is the Tate module of a p-divisible group, so its generic fibre is crystalline with weights 0 and 1; conversely a crystalline deformation over an Artinian E-algebra B is a successive extension of V_ξ, has weights in {0, 1}, and contains a G_K-stable lattice that is Barsotti–Tate (Kisin (2.3.5), (2.3.8)). Formal smoothness: the crystalline deformation functor of V_ξ is formally smooth (Kisin (2.3.9)). Dimension: H¹_f(G_K, ad V_ξ) has dimension Σ_ψ (d − v_ψ)v_ψ + dim H⁰(G_K, ad V_ξ); adding the framing gives d² + Σ_ψ (d − v_ψ)v_ψ. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* d = 2, v_ψ = 1 for all ψ (determinant cyclotomic up to finite order): dimension 4 + [K : ℚ_p] framed, 1 + [K : ℚ_p] unframed. d = 1: (d − v_ψ)v_ψ = 0 for every ψ, so the generic fibre has dimension 1: a crystalline character of weight 0 or 1 deforms only by unramified twists. Integrally R^{fl,□} need not be smooth or even normal: only the generic fibre is formally smooth.

*Prerequisites.* `R08.4/flat-deformation-condition`, `R08.3/pcris-generic-smooth`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Mark Kisin (KISIN-FFLAT-2009), Proposition (2.3.8) and Corollary (2.3.11), pp. 32–33.

#### `R08.4/hodge-type-resolution` — Kisin's resolution of the flat deformation ring (construction)

Let R be R^{fl,□} ⊗ 𝒪_F (or R^fl ⊗ 𝒪_F when End V_𝔽 = 𝔽), F large enough to contain the reflex fields, and v a p-adic Hodge type. Let R^v be the quotient of R cut out by the closure of the union of the connected components of Spec R[1/p] on which the Hodge type is v. The lattices whose φ*𝔐/E(u)𝔐 has determinant ∏_ψ ψ(a)^{v_ψ} form a closed subscheme 𝒢ℛ^v ⊂ 𝒢ℛ, and its p-torsion-free part 𝒢ℛ^{v,loc} carries a projective map Θ^v : 𝒢ℛ^{v,loc} → Spec R^v that becomes an isomorphism after inverting p.

*Hypotheses and conventions.*
- K/ℚ_p is finite with p > 2 (p = 2 is stage R08.5), e = e(K/ℚ_p), K₀ the maximal unramified subfield, 𝔽 a finite field, and V_𝔽 a d-dimensional 𝔽-representation of G_K that is the generic fibre of a finite flat group scheme; 𝔖 = W(k)⟦u⟧ and E(u) are as in L7/finite-height-lattices.
- Kisin's condition (2.4.5): ξ → D^fl is formally smooth, which holds for the two rings named.
- That the Hodge type is constant on connected components of Spec R[1/p] is R08.3/hodge-type-components (Kisin uses Sen's theorem on Hodge–Tate weights in families).

*Construction.* Θ lands in Spec R^v: it suffices to check E-points of 𝒢ℛ^{v,loc}[1/p]; for such a point, D_cris(V_E)_K/Fil⁰ is computed from φ*𝔐/E(u)𝔐 (Breuil), so the Hodge type is v. Bijection on E-points: a point of R^v is the Tate module of a p-divisible group, unique by Tate's theorem, whose Kisin module is the unique preimage. Θ^v[1/p] is projective and bijective on closed points, hence finite; its source is normal (resolution-local-structure) and its target regular (flat-generic-fibre), so it is an isomorphism.

*API.*
- `TauCeti.GaloisDeformation.Local.flatHodgeTypeQuotient` (constructor): R^v, the Hodge-type-v part of the flat ring.
- `TauCeti.GaloisDeformation.Local.flatResolution` (constructor): 𝒢ℛ^{v,loc} with Θ^v : 𝒢ℛ^{v,loc} → Spec R^v projective.
- `TauCeti.GaloisDeformation.Local.flatResolution_generic_iso` (characterisation): Θ^v[1/p] is an isomorphism.
- `TauCeti.GaloisDeformation.Local.flatResolution.points` (universal-property): An admissible B-point is a finite-flat model lattice satisfying the labelled Hodge determinant/rank condition defining v. Pullback of the universal lattice and its filtration commutes with coefficient base change.

*Unit tests.*
- `flatResolution_small_ramification` (degenerate): e < p − 1: Θ^v is an isomorphism integrally.
- `flatResolution_generic_iso` (characterisation): Θ^v is an isomorphism after inverting p.
- `flatResolution_not_integral_iso` (non-example): Θ^v has positive-dimensional closed fibre in general.

*Used by.* LocalGaloisDeformationRings:R08.4/components-via-special-fibre — connected components are read off the closed fibre of the resolution.; GL2ModularityLifting:R22.5 — the component geometry behind Kisin's potentially Barsotti–Tate theorem.

*Acceptance.* v_ψ = 1 for all ψ, d = 2: 𝒢ℛ^{v,loc} = 𝒢ℛ^v, and R^v has cyclotomic determinant Hodge type; its determinant is cyclotomic up to an unramified character, and a chosen determinant requires a further quotient. When e < p − 1, 𝒢ℛ ≅ Spec R^fl already, and the resolution is an isomorphism integrally (small-ramification-flat). Θ^v is not an isomorphism integrally in general: its closed fibre is the positive-dimensional 𝒢ℛ^v_0 (for example ℙ¹ in rank-two-ordinary-locus).

*Prerequisites.* `R08.4/finite-flat-model-moduli`, `R08.4/flat-generic-fibre`, `R08.4/resolution-local-structure`, `R08.3/hodge-type-components`.

*Sources.* Mark Kisin (KISIN-FFLAT-2009), (2.4.1)–(2.4.3) and Proposition (2.4.8), pp. 34–37.

#### `R08.4/resolution-local-structure` — Local structure of the resolution (theorem)

𝒢ℛ^{v,loc} is normal and Cohen–Macaulay, and its closed fibre 𝒢ℛ^{v,loc}_0 is reduced and normal with rational singularities. A closed point of 𝒢ℛ^v lies in 𝒢ℛ^{v,loc} exactly when, for each σ ∈ Gal(K₀/ℚ_p), the nilpotent endomorphism π of σ-part of φ*𝔐/E(u)𝔐 has Jordan type dominated by the dual partition of v_σ. If for each σ any two of the v_ψ with ψ|K₀ = σ differ by at most 1, and either every v_ψ ∈ {0, 1} or e ≤ 2, then 𝒢ℛ^{v,loc} = 𝒢ℛ^v.

*Hypotheses and conventions.*
- The input is Pappas–Rapoport's local models for Res_{K/ℚ_p} GL_d (normality and Cohen–Macaulayness of the flat closure, reduced special fibre with rational singularities, and equality with the naive model in the stated cases), recorded as a gap: no stage of the atlas plans these local models.

*Proof outline.* Kisin (2.2.11): the complete local ring of 𝒢ℛ^v at a closed point is formally smooth over the complete local ring of the local model M_v at the corresponding point (the map 𝔐 ↦ (1 ⊗ φ)φ*𝔐/E(u)𝔐). Kisin (2.2.5), (2.2.8): M_v is a product over σ of Pappas–Rapoport models, so it inherits their properties; p-torsion-free parts correspond (completion is flat). The properties are local and pass along formally smooth maps.

*Acceptance.* d = 2, v_ψ = 1 for all ψ: 𝒢ℛ^{v,loc} = 𝒢ℛ^v, the case of rank-two Barsotti–Tate representations. The closed fibre is reduced: this is what forces idempotents on the generic fibre of the resolution to extend integrally (components-via-special-fibre). 𝒢ℛ^v and 𝒢ℛ^{v,loc} can differ, because the naive local model need not be flat (Pappas–Rapoport); that is why only the p-torsion-free part is used.

*Prerequisites.* `R08.4/finite-flat-model-moduli`.

*Sources.* Mark Kisin (KISIN-FFLAT-2009), Proposition (2.2.2), Corollary (2.2.8) and Proposition (2.4.6), pp. 23–35.

#### `R08.4/components-via-special-fibre` — Connected components through the special fibre (theorem)

There is a bijection between the connected components of Spec R^v[1/p] and those of the closed fibre 𝒢ℛ^{v,loc}_0 of the resolution. Because Θ^v[1/p] is an isomorphism, this describes components of the deformation ring itself and not only of the moduli space: connectedness of the source alone would not suffice.

*Hypotheses and conventions.*
- The relevant inputs are the isomorphism on the generic fibre (hodge-type-resolution) and the reducedness of the closed fibre (resolution-local-structure).

*Proof outline.* If e is an idempotent on 𝒢ℛ^{v,loc}[1/p] and π_F^n e extends integrally with n ≥ 1 minimal, then π_F^n e reduces to a nonzero nilpotent on the reduced closed fibre; so n = 0 and H₀(𝒢ℛ^{v,loc}[1/p]) = H₀(𝒢ℛ^{v,loc}). H₀ of 𝒢ℛ^{v,loc} equals H₀ of its completion along 𝔪_R, which has the topology of the closed fibre (Grothendieck's existence theorem [EGA III, 5.5.1, 4.1.5]). Compose with Θ^v[1/p] ≅ Spec R^v[1/p].

*Acceptance.* If the closed fibre is one point, Spec R^v[1/p] is connected. When Spec R^v[1/p] is formally smooth (flat-generic-fibre), its connected components are its irreducible components, so the bijection counts irreducible components. The analogous statement with 𝒢ℛ^v in place of 𝒢ℛ^{v,loc} can fail, since components supported in characteristic p are not seen by the generic fibre.

*Prerequisites.* `R08.4/hodge-type-resolution`, `R08.4/resolution-local-structure`, `AdicSpacesPartII:F0/grothendieck-algebraization`.

*Sources.* Mark Kisin (KISIN-FFLAT-2009), Corollary (2.4.10), pp. 37–38.

#### `R08.4/ordinary-type-of-components` — The ordinary type of a component (lemma)

Every point 𝔐_A of the moduli has a maximal multiplicative subobject 𝔐^m_A and a maximal étale quotient 𝔐^ét_A, compatible with base change and exchanged by duality; their ranks d_m and d_ét are constant on each connected component of 𝒢ℛ^{v,loc}_0. For a pair d = (d_ét, d_m), an E-point x of Spec R^v lies on a connected component of Spec R^v[1/p] corresponding to a component of type d exactly when the maximal unramified subrepresentation of V_x(−1) has dimension d_m and the maximal unramified quotient of V_x has dimension d_ét.

*Hypotheses and conventions.*
- Kisin conjectures (2.4.16) that for End V_𝔽 = 𝔽 each type-d locus is connected; this is proved here only in rank two (rank-two-nonordinary-connected, rank-two-ordinary-locus).

*Proof outline.* Over a finite ring the maximal multiplicative submodule is ∩_r (φ*)^r 𝔐 (Kisin (1.2.11)); its rank is lower semicontinuous (a characteristic-polynomial coefficient of φ on 𝔐/u𝔐). Upper semicontinuity: the locus with a rank-d_m unramified-twisted submodule L ⊂ V_A(−1) is a closed subspace of a Grassmannian, and near a point of rank exactly d_m it maps isomorphically; so the rank is locally constant. On E-points, the multiplicative part corresponds to the multiplicative part of the p-divisible group, i.e. to the unramified subrepresentation of V(−1) (Kisin (1.1.15)).

*Acceptance.* d = 2, both ranks 1: the ordinary points, where V_x is an extension of an unramified character by an unramified twist of the cyclotomic character. d = 2, ranks 0: the non-ordinary points (connected multiplicative-free and étale-free group schemes). The type is not a residual invariant: V_𝔽 can have lifts on components of different types.

*Prerequisites.* `R08.4/hodge-type-resolution`, `R08.4/components-via-special-fibre`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

*Sources.* Mark Kisin (KISIN-FFLAT-2009), Proposition (2.4.14), (2.4.15) and Conjecture (2.4.16), pp. 38–41.

#### `R08.4/rank-two-nonordinary-connected` — Connectedness of the non-ordinary locus in rank two (theorem)

Let d = 2, v_ψ = 1 for all ψ (so 𝒢ℛ^v = 𝒢ℛ^{v,loc}), and K₀ = ℚ_p. Any two non-ordinary 𝔽′-points of 𝒢ℛ^v_0 lie on the same connected component. So the non-ordinary locus of Spec R^v[1/p] is connected.

*Hypotheses and conventions.*
- K₀ = ℚ_p means K/ℚ_p totally ramified; Kisin notes that Gee subsequently removed this restriction, which was not read here, so it is kept.
- The residual input (Kisin (2.5.3)): for V_𝔽 reducible, V_𝔽^ss|I_K ≅ ω^i ⊕ ω^j with i, j ∈ [0, e] and p − 1 | e − i − j; for V_𝔽 irreducible (𝔽 ⊇ 𝔽_{p²}), V_𝔽|I_K ≅ ω₂^i ⊕ ω₂^{pi} with i = i₀ + pi₁, i₀, i₁ ∈ [0, e], p + 1 ∤ i and p − 1 | e − i.

*Proof outline.* Kisin (2.5.1): 𝔽′-points are rank-two 𝔽′⟦u⟧-lattices 𝔐 ⊂ M_{𝔽′}, φ-stable, with det φ = αu^e (α a unit). Kisin (2.5.5): for irreducible V_𝔽, after a quadratic extension M ∼ (0 a; d 0) with v_u(ad) = e and p + 1 ∤ v_u(d) − v_u(a). Given two non-ordinary lattices 𝔐₁, 𝔐₂ = (1 + N)𝔐₁ with N nilpotent, build a chain of lattices 𝔑_j and show successive ones lie on a common ℙ¹ inside 𝒢ℛ^v_0 (Kisin (2.5.7)–(2.5.14)); the valuation inequalities use p + 1 ∤ v_u(d) − v_u(a).

*Acceptance.* K = ℚ_p (e = 1), V_𝔽 irreducible: the closed fibre is one point (small-ramification-flat), trivially connected. K totally ramified of degree e ≥ p − 1: the closed fibre can be positive-dimensional, and the proposition still gives one non-ordinary component. For K₀ ≠ ℚ_p (for example K = ℚ_{p²}) the argument does not apply as stated: the chain of lattices needs K₀ = ℚ_p.

*Prerequisites.* `R08.4/ordinary-type-of-components`, `R08.4/components-via-special-fibre`, `R08.4/finite-flat-model-moduli`.

*Sources.* Mark Kisin (KISIN-FFLAT-2009), Lemmas (2.5.1), (2.5.3), (2.5.5) and Proposition (2.5.6), pp. 41–48.

#### `R08.4/rank-two-ordinary-locus` — The ordinary locus in rank two (theorem)

Let d = 2 and v_ψ = 1 for all ψ (K₀ arbitrary). The ordinary part 𝒢ℛ^{v,ord}_0 of the closed fibre, if non-empty, is a single point, unless V_𝔽 ≅ χ₁ ⊕ χ₂ with χ₁, χ₂ unramified. In that case it is two points (the models D(𝒢_{χ₁^{−1}ω}) ⊕ 𝒢_{χ₂} and D(𝒢_{χ₂^{−1}ω}) ⊕ 𝒢_{χ₁}) if χ₁ ≠ χ₂, and ℙ¹ if χ₁ = χ₂, all its models being isomorphic to D(𝒢_{χ₁^{−1}ω}) ⊕ 𝒢_{χ₁}.

*Hypotheses and conventions.*
- 𝒢_χ is the finite étale extension of an unramified character χ, D is Cartier duality and ω the mod-p cyclotomic character.

*Proof outline.* An ordinary A-point is an extension of an étale rank-one object by a multiplicative one, i.e. an ordinary finite flat group scheme 𝒢_A; its multiplicative part gives a G_K-stable A-line L_A ⊂ V_A with unramified quotient, and 𝒢_A is determined by L_A (as in BCDT 4.1.2). The possible L_A: one line unless V_𝔽 is a sum of two unramified characters; two lines if they differ; every line if they agree. In the last case the functorial isomorphism with ℙ(V_𝔽) makes the ordinary locus smooth with the point count of ℙ¹, hence ℙ¹. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* V_𝔽 = ω ⊕ 1 over ℚ_p: ω is ramified, so V_𝔽 is not a sum of two unramified characters, and the ordinary locus is the single model μ_p ⊕ ℤ/p. K = ℚ_p(ζ_p) (e = p − 1, so ω is trivial on G_K) and V_𝔽 = 1 ⊕ 1: the ordinary locus is ℙ¹, so the ordinary component of Spec R^v[1/p] is connected though its closed fibre is not a point. Over ℚ_p itself 1 ⊕ 1 has no lifts of this Hodge type (the inertial weights must be ω ⊕ 1). V_𝔽 a non-split extension of 1 by ω: the ordinary locus is one point.

*Prerequisites.* `R08.4/ordinary-type-of-components`, `R08.4/finite-flat-model-moduli`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Mark Kisin (KISIN-FFLAT-2009), Proposition (2.5.15), pp. 48–49.

#### `R08.4/rank-two-bt-components` — Components of rank-two Barsotti–Tate deformation rings (theorem)

Let d = 2, v_ψ = 1 for all ψ (Barsotti–Tate with cyclotomic-type determinant), R = R^{fl,□} ⊗ 𝒪_F and R^v its Hodge-type-v quotient. (1) R^v is flat over ℤ_p of pure relative dimension 4 + [K : ℚ_p], and R^v[1/p] is formally smooth; its irreducible components are its connected components. (2) If E-points x₁, x₂ lie on the same irreducible component, then V_{x₁} and V_{x₂} are both ordinary or both non-ordinary. Conversely they lie on the same component if (i) both are non-ordinary and K₀ = ℚ_p, or (ii) both are ordinary and the characters of G_K on the lines L_i ⊂ V_{x_i} where I_K acts cyclotomically have the same reduction mod π_E. The same holds for R^fl ⊗ 𝒪_F when End V_𝔽 = 𝔽, with relative dimension 1 + [K : ℚ_p]. In particular a modular point and a lift meet the same component exactly when they satisfy these matching conditions, which is how Kisin chooses his auxiliary modular forms.

*Hypotheses and conventions.*
- This is the rank-two case of Kisin's conjecture (2.4.16), with K₀ = ℚ_p in the non-ordinary case.
- Potentially Barsotti–Tate representations of a nontrivial type are reduced to this case by a global solvable base change (GL2ModularityLifting R22.5), not by a local component theorem for types.

*Proof outline.* (1) from flat-generic-fibre (dimension d² + Σ(d − v_ψ)v_ψ = 4 + [K : ℚ_p]) and flatness by construction; formal smoothness makes connected and irreducible components agree, and flatness matches them with components of Spec R^v. (2) components-via-special-fibre with ordinary-type-of-components, rank-two-nonordinary-connected and rank-two-ordinary-locus. Unframed: forgetting the frame is formally smooth of relative dimension 3.

*Acceptance.* V_𝔽 irreducible, K = ℚ_p: Spec R^v[1/p] is connected (no ordinary points), so every Barsotti–Tate lift is on the component of any modular Barsotti–Tate point. K = ℚ_p(ζ_p), V_𝔽 = 1 ⊕ 1: the ordinary locus is one component (ℙ¹ closed fibre) and the non-ordinary locus another; an ordinary modular point does not control a non-ordinary lift. Two ordinary lifts whose cyclotomic-line characters have different reductions can lie on different components: over K = ℚ_p(ζ_p), V_𝔽 = χ₁ ⊕ χ₂ with χ₁ ≠ χ₂ unramified has two ordinary components.

*Prerequisites.* `R08.4/flat-generic-fibre`, `R08.4/components-via-special-fibre`, `R08.4/ordinary-type-of-components`, `R08.4/rank-two-nonordinary-connected`, `R08.4/rank-two-ordinary-locus`, `R08.1/local-forget-framing`.

*Sources.* Mark Kisin (KISIN-FFLAT-2009), Corollary (2.5.16), p. 49; Ana Caraiani (CN-2023), Lemma 5.3.4, arXiv v3 p. 77.

#### `R08.4/savitt-weight-two-rings` — Savitt's weight-two deformation rings of tame type (theorem)

Let p be odd, ρ̄ : G_{ℚ_p} → GL_2(k_E) with End ρ̄ = k_E, and R(2, τ, ρ̄) the quotient of the universal deformation ring by the intersection of the primes of type (2, τ) (potentially Barsotti–Tate of inertial type τ, Hodge–Tate weights (0, 1), fixed determinant). (1) If τ = ω̃^i ⊕ ω̃^j with i ≢ j mod p − 1: R(2, τ, ρ̄) = 0 unless ρ̄|I_p is (ω^{1+i} ∗; 0 ω^j), (ω^{1+j} ∗; 0 ω^i) or ω₂^k ⊕ ω₂^{pk} with k = 1 + {j − i} + (p + 1)i; it is 𝒪_E⟦Y⟧ in the two reducible cases, and 𝒪_E⟦X₁, X₂⟧/(X₁X₂ − pw) with w ∈ 𝒪_E^× in the irreducible case (E ⊇ ℚ_{p²}, √det ρ̄(Frob_p) ∈ k_E). (2) If τ = ω̃₂^m ⊕ ω̃₂^{pm} with p + 1 ∤ m: R(2, τ, ρ̄) is 𝒪_E⟦B⟧ for the reducible and irreducible shapes listed by Savitt (Theorem 6.23), and 0 otherwise. So the Breuil–Mézard conjecture holds for k = 2 and τ tame. Explicitly in Theorem 6.23 write m = i + (p+1)j, 1≤i≤p, so p+1∤m. The reducible inertial shapes are (ω^{i+j} *;0 ω^{1+j}) and (ω^{1+j} *;0 ω^{i+j}); the first extension is peu ramifié for i=2 and the second for i=p−1. The irreducible inertial shapes are ω₂^{p+m}⊕ω₂^{1+pm} and ω₂^{1+m}⊕ω₂^{p(1+m)}. These cases give 𝒪_E[[B]], and all other shapes give zero. For Theorem 6.22 the nodal case has τ=ω̃^i⊕ω̃^j, i≢j mod p−1, and ρ̄|I_p=ω₂^a⊕ω₂^{pa}, a=1+{j−i}+(p+1)i, where 0<{j−i}<p−1; assume E contains ℚ_{p²} and k_E contains a square root of det ρ̄(Frob_p).

*Hypotheses and conventions.*
- R(2, τ, ρ̄) is the fixed-determinant, unframed version of R08.3/pst-deformation-ring for Hodge–Tate weights (0, 1) and type τ.
- The construction uses Breuil–Mézard strongly divisible modules with tame descent data (Savitt §§2–5), requested from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.
- This is the weight-two computation that R08.6/export-weight-two-irreducible cites (the case ρ̄ irreducible with a principal-series tame type).

*Proof outline.* Explicit families: strongly divisible modules M over R(M) = 𝒪_E⟦Y⟧, 𝒪_E⟦B⟧ or 𝒪_E⟦X₁, X₂⟧/(X₁X₂ − pw) with descent data (Proposition 6.21) whose reductions are ρ̄ (Theorems 6.11, 6.12 and Corollary 6.15, which also give the vanishing cases). Every lattice of type (2, τ) is found among them, so there is a canonical injection R(2, τ, ρ̄) → R(M); surjectivity is checked on R/(𝔪², 𝔪_E) by showing that the family does not descend to a smaller subalgebra, using the minimal Breuil module of a subcharacter. The Breuil–Mézard multiplicities then follow as in [BM02, §5.3].

*Acceptance.* ρ̄ irreducible with ρ̄|I_p = ω₂^k ⊕ ω₂^{pk} and a principal-series type: R ≅ 𝒪_E⟦X₁, X₂⟧/(X₁X₂ − pw), not formally smooth over 𝒪_E but with regular generic fibre; its special fibre k_E⟦X₁, X₂⟧/(X₁X₂) has two components and Samuel multiplicity 2. A reducible shape from the list: R ≅ 𝒪_E⟦Y⟧, formally smooth. ρ̄|I_p outside the list: R(2, τ, ρ̄) = 0, so no potentially Barsotti–Tate lift of type τ exists.

*Prerequisites.* `R08.3/pst-deformation-ring`, `R08.3/hodge-and-galois-types`, `R08.1/local-fixed-determinant`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

*Sources.* David Savitt (SAVITT-2005), Theorems 6.22–6.24, pp. 41–42.

#### `R08.4/finite-cocycles-kummer` — Finite cocycles via Kummer theory over F^nr (KW II Lemma 3.7) (theorem)

Let F_v/ℚ_p be finite unramified, D_v = G_{F_v}, I_v its inertia, F^nr the maximal unramified extension. Let B be a complete local Noetherian 𝒪-algebra and N a finitely generated B-module, Ξ = χ₁η₁η₂^{-1} a character with Ξ|_{I_v} the cyclotomic character χ_p (the case k(ρ̄) = 2) and M = N(Ξ). Kummer theory gives H¹_cont(I_v, N(χ_p)) ≅ (F^{nr×} ⊗ N)^∧ (𝔪_B-adic completion), D_v/I_v-equivariantly; composing with the valuation (v(p) = 1) gives v_Z : Z¹(D_v, M) → N, and Z¹_f(M) := ker v_Z (finite cocycles; Z¹_f = Z¹ when k(ρ̄) > 2). Then Z¹_f(B(Ξ)) is free of rank 1 + [F_v:ℚ_p] over B and Z¹_f(N(Ξ)) = Z¹_f(B(Ξ)) ⊗_B N.

*Hypotheses and conventions.*
- The μ_{p^n} core of the Kummer isomorphism for F^nr is planned at Tau Ceti ProfiniteCohomology Layer 9; what is specific here is the passage to 𝒪-module coefficients N(χ_p), the 𝔪_B-adic completion, D_v/I_v-equivariance and F^{nr×} ≅ ℤ × U (red-team routing RT-PAPER-KHARE-WINTENBERGER-09-II/10).
- Finite cocycles are the peu ramifié (finite flat) classes, which is why the lemma sits with the finite flat layer.

*Proof outline.* Reduce to B of finite length by passing to the limit; then show |Z¹_f(N(Ξ))| = |N|^{1+[F:ℚ_p]} for finite N, which gives exactness of N ↦ Z¹_f(N(Ξ)) and freeness by Nakayama. |Z¹(D_v, M)| = |M|^{1+[F:ℚ_p]}·|H⁰(D_v, M*)| by the local Euler characteristic and duality (Tau Ceti ClassFieldTheory Layer 5: eulerCharacteristic_finrank_fp, tateDualityPairing_perfect_mixed). For k(ρ̄) = 2, Z¹(D_v, N(Ξ)) → (N(η̃))^{D_v} is surjective (η̃ = η₁η₂^{-1}) because F^{nr×} ≅ ℤ × U as a Galois module; hence |Z¹_f| = |Z¹|/|(N(η̃))^{D_v}| = |N|^{1+[F:ℚ_p]}.

*Acceptance.* B = k, N = k, F_v = ℚ_p, Ξ = χ_p, η̃ = 1: dim Z¹_f = 2 = 1 + 1, the peu ramifié classes plus the coboundaries.

*Prerequisites.* `R08.1/local-tangent-obstruction`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Chandrashekhar Khare (KW2-2009), §3.2.5, Lemma 3.7, author copy pp. 25–26; Chandrashekhar Khare (KW2-2009), §3.2.5, the definition of finite cocycles, p. 25.

#### `R08.4/kw-algebraisation-lemma` — Normalising a vector over 𝒪[T] inside 𝒪⟦T⟧ (KW II Lemma 3.8) (lemma)

Let A₀ = 𝒪[T], A = 𝒪⟦T⟧, M₀ a free A₀-module of finite rank, M = A ⊗_{A₀} M₀ and m ∈ M. Then there exist m₀ ∈ M₀ and an isomorphism A ⊗_{A₀} M₀ ≅ M of A-modules sending m₀ to m.

*Hypotheses and conventions.*
- Used for the smooth algebraisation in the proof of KW II Proposition 3.6 (R08.6/export-ordinary): the resolution over 𝒪⟦T⟧ is defined over 𝒪[T].

*Proof outline.* For a nonzero power series f over the coefficient DVR, factor f=ϖ^a f₀ using the minimum valuation of its nonzero coefficients, so f₀ has nonzero residue series. Handle f=0 separately. Apply the pinned Weierstrass factorization/division to f₀; the pinned theorem does not apply to f with zero residue series. Write m = Σ a_i e_i in a basis of M₀; reduce to some a₁ not divisible by ϖ. By Weierstrass preparation and division over 𝒪⟦T⟧ choose a′_i ∈ A₀ with a′₁a₁^{-1} ∈ A^× and (a′_i − a_i)a₁^{-1} ∈ A; the automorphism B with B(m) = Σ a′_i e_i fixing e_i (i ≥ 2) lies in GL_r(A); take m₀ = Σ a′_i e_i.

*Acceptance.* r = 1, m = (1 + T)·e₁: take m₀ = e₁ and the isomorphism multiplication by 1 + T ∈ A^×.

*Prerequisites.* `mathlib:PowerSeries.exists_isWeierstrassFactorization`, `mathlib:PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod`.

*Sources.* Chandrashekhar Khare (KW2-2009), Lemma 3.8, author copy p. 30; Chandrashekhar Khare (KW2-2009), proof of Lemma 3.8, p. 30.

#### `R08.4/bt-ring-unique-generalisation` — Unique generalisation of generic points for Barsotti–Tate rings (theorem)

Let p be odd, F_v/ℚ_p finite and R = R^{ε_p^{-1},BT}_v the fixed-determinant Barsotti–Tate lifting ring (crystalline of Hodge–Tate weights {0, 1}, determinant ε_p^{-1}) of ρ̄ : G_{F_v} → GL₂(k). Each generic point of Spec(R/ϖ) is the specialisation of a unique generic point of Spec R. Moreover, if ρ̄ is trivial, k_v ≠ 𝔽_p and R ≠ 0, Spec R has exactly two irreducible components, whose points are the ordinary and the non-ordinary lifts.

*Hypotheses and conventions.*
- The first statement rests on generic reducedness of the special fibre (Caraiani–Emerton–Gee–Savitt, Theorem 1.3), stated for the ring without fixed determinant, which is formally smooth over the fixed-determinant ring for p odd.

*Proof outline.* Generic reducedness: if 𝔭 is a height-one prime containing ϖ with R_𝔭/ϖ a field, then R_𝔭 is a DVR, so 𝔭 contains a unique minimal prime. Two components for trivial ρ̄: Kisin's Corollary 2.5.16 (R08.4/rank-two-bt-components) and Gee's Proposition 2.3.

*Acceptance.* The source excludes the stated scalar/residue-field case; no failure or counterexample is asserted outside its hypotheses.

*Prerequisites.* `R08.4/rank-two-bt-components`, `R08.4/flat-generic-fibre`, `R08.3/fixed-determinant-pst-rings`.

*Sources.* Ana Caraiani (CN-2023), Lemma 5.3.3, arXiv v3 p. 76; Ana Caraiani (CN-2023), Lemma 5.3.4, arXiv v3 p. 77.

*Coverage of R08.4:* planned. Remaining: Gaps recorded: Pappas–Rapoport local models (owner proposed: AlgebraicModuliForArithmeticGeometry, Part II) and the generic reducedness of potentially Barsotti–Tate rings (owner proposed: FiniteFlatGroupsAndIntegralPadicHodgeTheory, Part II).

### Layer R08.5: Dyadic and endpoint cases

R08.5 supplies the dyadic and endpoint-weight calculations. At p = 2 it plans Kisin's 2-adic rings (the deformation groupoids of connected Kisin modules with coefficients, whose integral category and connectedness are R07.4's, flat connected deformation rings, rank-two components, ordinary rings), the semistable weight-two resolution in the homothety case (a torsor over the completion of ℙ¹_𝒪 along its special fibre), dyadic minimal lifts (induced from a wildly ramified character twisted by a ramified quadratic character, and the A₄/S₄ case at residue characteristic 2) and twists of semistable deformations. At the endpoints it plans crystalline lifts of weight p (Fontaine–Laffaille at filtration length p − 1, with FL 0.9) and weight p + 1 (ordinary by Berger–Li–Zhu, imported from PadicHodgeTheory R06.4 per finding /17; the ring is formally smooth of relative dimension 3 + [F_v:ℚ_p]). The endpoint rings of KW I Theorem 4.1 are collected in one node. The splitting End = k ⊕ ad⁰ is never used at p = 2.

*Planets:* Flat connected deformation rings at p = 2; Components of 2-adic Barsotti–Tate rings; Weight p + 1 ordinary rings; Endpoint-weight local rings.

#### `R08.5/connected-kisin-modules-with-coefficients` — Deformation groupoids of connected Kisin modules with coefficients (construction)

Let p = 2 be allowed, K/ℚ_p finite with finite residue field, and V_𝔽 a finite-dimensional 𝔽-representation of G_K. For an admissible augmented coefficient algebra (A, I) in Kisin's category 𝔄𝔲𝔤_{W(𝔽)}, use the category (Mod/𝔖)_A of Kisin modules with coefficients and its connected subcategory (Mod/𝔖)^c_A, together with the multiplicative and étale objects, from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 (R07.4/kisin-modules-with-coefficients; connectedness is the condition ψ_n(𝔐_A) ⊆ (p, u)φ^{n*}(𝔐_A) for n large of Kisin (2.1.4), under which R07.4/dyadic-classification classifies connected finite flat group schemes at p = 2). With M_𝔽 = (𝒪_{ℰ^ur} ⊗ V_𝔽(−1))^{G_{K∞}}, let D_{V_𝔽} and D_{M_𝔽} be the groupoids of deformations of V_𝔽 and of the étale φ-module M_𝔽, and D_{𝔖,M_𝔽} ⊇ D^c_{𝔖,M_𝔽} the groupoids of deformations of (connected) Kisin modules with coefficients together with an identification of their 𝒪_ℰ-module with M_𝔽 (Kisin (2.1.1)–(2.1.5)). Then 𝔐_A ↦ 𝒪_ℰ ⊗ 𝔐_A is a morphism D_{𝔖,M_𝔽} → D_{M_𝔽} (Lemma 2.1.7). Only these deformation groupoids and the forgetful morphism are constructed here; the integral categories are R07.4's.

*Hypotheses and conventions.*
- p = 2 is allowed; K/ℚ_p finite with residue field k finite, 𝔖 = W(k)⟦u⟧, E(u) the Eisenstein polynomial of a uniformiser, K_∞ = K(π^{1/p^∞}); V_𝔽 a finite-dimensional 𝔽-representation of G_K; groupoids over Artinian and over "augmented" (A, I) W(𝔽)-algebras as in Kisin's appendix.

*Construction.* These are the definitions of Kisin's Annals paper §2.1 with coefficients, extended to p = 2 by adding the connectedness condition (1.3), under which Kisin modules classify connected finite flat group schemes at p = 2 (requested from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4). Lemma 2.1.7: 𝒪_ℰ ⊗ 𝔐_A descends to a subring A′ ⊆ A in 𝔄ℜ^{A,I}_{W(𝔽)} (Kisin FM 2.1.4).

*API.*
- `TauCeti.GaloisDeformation.Local.kisinGroupoid` (constructor): D_{𝔖,M_𝔽}: over (A, I), pairs (𝔐_A, ι) with 𝔐_A ∈ R07.4's (Mod/𝔖)_A and ι : 𝒪_ℰ ⊗ 𝔐_A ⊗_A 𝔽 ≅ M_𝔽; morphisms are isomorphisms compatible with ι.
- `TauCeti.GaloisDeformation.Local.kisinGroupoid.connected` (constructor): D^c_{𝔖,M_𝔽} ⊆ D_{𝔖,M_𝔽}: the full subgroupoid of objects connected in R07.4's sense.
- `TauCeti.GaloisDeformation.Local.kisinGroupoid_toPhiModule` (functoriality): 𝔐_A ↦ 𝒪_ℰ ⊗ 𝔐_A, a morphism of groupoids D_{𝔖,M_𝔽} → D_{M_𝔽} (Lemma 2.1.7).
- `TauCeti.GaloisDeformation.Local.kisinGroupoid.baseChange` (functoriality): Along an admissible morphism of augmented coefficient algebras, tensor the Kisin module, keep connectedness (R07.4 base change) and transport ι; identity and composition laws hold up to the canonical isomorphisms.
- `TauCeti.GaloisDeformation.Local.kisinGroupoid.connected_iff_etalePart` (characterisation): For p = 2 an object over a finite field is in D^c iff its maximal étale quotient in R07.4's sense is zero; for p > 2 every object of height ≤ 1 is allowed and D^c is not used.

*Unit tests.*
- `rank_one_etale` (computation): Rank one with φ(e) = E(u)e over 𝔽: the object is étale (R07.4) and lies in D_{𝔖,M_𝔽} but not in D^c_{𝔖,M_𝔽}.
- `rank_one_multiplicative` (computation): Rank one with φ(e) = e: multiplicative, hence connected, so it lies in D^c_{𝔖,M_𝔽}.
- `rank_one_cyclotomic` (computation): The rank-one module with φ(e) = pE(u)/E(0)·e is étale because p/E(0) is a unit, so it is not in D^c. Use the source's fixed (1) twist in the Galois realisation when comparing characters.
- `p_odd_vs_two` (non-example): At p = 2 an étale rank-one object is not connected and still has a finite-flat étale model: D^c is the connected part only, and Kisin's connected equivalence does not exclude nonconnected finite-flat groups.

*Used by.* LocalGaloisDeformationRings:R08.5/connected-model-moduli — the groupoids whose moduli are constructed; LocalGaloisDeformationRings:R08.5/rank-two-type-v — Kisin modules of type v

*Acceptance.* Morphisms are isomorphisms, not isomorphisms up to units (2.1.3); no absolute representability is claimed.

*Prerequisites.* `R08.4/finite-flat-model-moduli`, `L7/finite-height-lattices`, `R08.1/local-lifting-ring`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/kisin-modules-with-coefficients`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/etale-phi-modules-with-coefficients`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4/dyadic-classification`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

*Sources.* Mark Kisin (KISIN-2ADIC-2009), §2.1, (2.1.1)–(2.1.7), pp. 19–21 (DVI).

#### `R08.5/etale-multiplicative-parts` — Étale quotients, multiplicative parts and connectedness (lemma)

For (A, I) in 𝔄𝔲𝔤_{W(𝔽)} and 𝔐_A in D_{𝔖,M_𝔽}(A, I), 𝔐_A has a maximal étale quotient 𝔐^{ét}_A and a maximal multiplicative subobject 𝔐^m_A in (Mod/𝔖)_A, 𝔐_A/𝔐^m_A is in (Mod/𝔖)_A, and both constructions commute with base change (Lemma 2.1.8). 𝔐_A is connected iff 𝔐^{ét}_A = 0 (Lemma 2.1.9), and the inclusion D^c_{𝔖,M_𝔽} → D_{𝔖,M_𝔽} is open and closed (Proposition 2.1.10).

*Hypotheses and conventions.*
- p = 2 is allowed; K/ℚ_p finite with residue field k finite, 𝔖 = W(k)⟦u⟧, E(u) the Eisenstein polynomial of a uniformiser, K_∞ = K(π^{1/p^∞}); V_𝔽 a finite-dimensional 𝔽-representation of G_K; groupoids over Artinian and over "augmented" (A, I) W(𝔽)-algebras as in Kisin's appendix.

*Proof outline.* 2.1.8: Kisin FM 2.4.14 with V_A defined as (𝒪_{ℰ^ur} ⊗ M_A)^{φ=1}(1), finite free by Kisin FM 1.2.7(4). 2.1.9: reduce to A finitely generated and reduced with I = 0; at each maximal ideal the object is connected by (1.3.2), so ψ_n vanishes mod u for n ≥ r·rank (q = p^r = #k, standard linear algebra), and reducedness gives ψ_n(𝔐_A) ⊆ uφ^{n*}(𝔐_A). 2.1.10: the open and closed locus where 𝔐^{ét}_A has rank 0.

*Acceptance.* For p>2 the finite-flat equivalence applies to all objects. The connected subcategory still excludes nonzero étale objects. At p=2 Kisin’s connected equivalence alone is insufficient for the full category.

*Prerequisites.* `R08.5/connected-kisin-modules-with-coefficients`.

*Sources.* Mark Kisin (KISIN-2ADIC-2009), §2.1, Lemmas 2.1.8–2.1.9 and Proposition 2.1.10, p. 21 (DVI).

#### `R08.5/connected-model-moduli` — Moduli of connected finite flat models (theorem)

D_{𝔖,M_𝔽} → D_{M_𝔽} is relatively representable and projective: for a complete local R and ξ ∈ D_{M_𝔽}(R) there is a projective R-scheme 𝒢ℛ_{V_𝔽,ξ} with |D_{𝔖,M_𝔽,ξ}|(A, I) ≅ Hom_{Spec R}(Spec A, 𝒢ℛ_{V_𝔽,ξ}), and Θ_{V_𝔽,ξ} : 𝒢ℛ_{V_𝔽,ξ} → Spec R becomes a closed immersion after inverting p; the connected part is a closed and open subscheme 𝒢ℛ^c_{V_𝔽,ξ} (Proposition 2.1.12).

*Hypotheses and conventions.*
- p = 2 is allowed; K/ℚ_p finite with residue field k finite, 𝔖 = W(k)⟦u⟧, E(u) the Eisenstein polynomial of a uniformiser, K_∞ = K(π^{1/p^∞}); V_𝔽 a finite-dimensional 𝔽-representation of G_K; groupoids over Artinian and over "augmented" (A, I) W(𝔽)-algebras as in Kisin's appendix.

*Proof outline.* Relative representability and projectivity: Kisin, Potentially semistable deformation rings (Ki 3) 1.3, as in R08.4/finite-flat-model-moduli. Closed immersion after inverting p: Ki 3, 1.6.4. The connected part: etale-multiplicative-parts (Proposition 2.1.10).

*Acceptance.* The p = 2 analogue of R08.4/finite-flat-model-moduli.

*Prerequisites.* `R08.5/etale-multiplicative-parts`, `L7/height-lattice-moduli`.

*Sources.* Mark Kisin (KISIN-2ADIC-2009), §2.1, Proposition 2.1.12, p. 22 (DVI).

#### `R08.5/flat-connected-deformation-ring` — Flat connected deformation rings at p = 2 (theorem)

Let D^{fl,c}_{V_𝔽} ⊆ D^{fl}_{V_𝔽} ⊆ D_{V_𝔽} be the deformations that arise from finite flat connected (resp. finite flat) 𝒪_K-group schemes; D^{fl,c} → D_{M_𝔽} is fully faithful. Both inclusions are relatively representable and closed, and for the maximal quotient R^c of R over which ξ is flat connected, Spec R^c[1/p] → Spec R[1/p] is an open immersion (Lemma 2.2.2). If ξ → D^{fl,c} is formally smooth then R[1/p] is formally smooth over W(𝔽)[1/p] (Lemma 2.2.3). There is Θ_{V_𝔽} : D^c_{𝔖,M_𝔽} → D^{fl,c}_{V_𝔽} compatible with 𝒪_ℰ ⊗ − (Proposition 2.2.4), and for formally smooth ξ the projective morphism Θ : 𝒢ℛ^c_{V_𝔽,ξ} → Spec R becomes an isomorphism after inverting p (Proposition 2.2.7).

*Hypotheses and conventions.*
- p = 2 is allowed; K/ℚ_p finite with residue field k finite, 𝔖 = W(k)⟦u⟧, E(u) the Eisenstein polynomial of a uniformiser, K_∞ = K(π^{1/p^∞}); V_𝔽 a finite-dimensional 𝔽-representation of G_K; groupoids over Artinian and over "augmented" (A, I) W(𝔽)-algebras as in Kisin's appendix.
- In the open-immersion assertion, ξ is a flat deformation V_R in D^{fl}(R), and R^c is its maximal connected quotient. The assertion is not made for an arbitrary unrestricted family.

*Proof outline.* 2.2.2: closedness from Ramakrishna; openness because a point coming from a connected finite flat group scheme mod p^n comes from a connected p-divisible group (Raynaud 2.3.1), so D_cris has non-unit Frobenius eigenvalues, and so do its infinitesimal thickenings. 2.2.3: reduce to the framed flat connected ring, a quotient of R^{fl,□} whose generic fibre is formally smooth (Kisin FM 2.3.11) and, by 2.2.2, open in it. 2.2.4: as Kisin FM 2.1.4, checking connectedness is preserved (𝔐_{A′} = M_{A′} ∩ 𝔐_A); Θ(𝔐_A) = G(𝒪_{K̄}) for the group scheme attached by (1.3.9), and (1.3.13) upgrades G_{K∞}- to G_K-equivariance. 2.2.7: closed immersion after inverting p (2.1.12), R[1/p] regular (2.2.3), and surjectivity on closed points because points come from connected p-divisible groups, hence (1.2.8) from connected Kisin modules. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* R08.4/flat-deformation-condition is the p > 2 statement; at p = 2 the connected quotient is what the classification controls.

*Prerequisites.* `R08.5/connected-model-moduli`, `R08.4/flat-deformation-condition`, `R08.4/flat-generic-fibre`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Mark Kisin (KISIN-2ADIC-2009), §2.2, (2.2.1)–(2.2.7), pp. 22–24 (DVI).

#### `R08.5/rank-two-type-v` — Rank-two Kisin modules of type v and their determinant (lemma)

A Kisin module 𝔐_A of 𝔖_A-rank 2 is of type v if (1 ⊗ φ)(φ^*𝔐_A)/E(u)𝔐_A is maximal isotropic in 𝔐_A/E(u)𝔐_A (2.3.1). If 𝔐_A is free of type v with φ-matrix H, then det H = pE(u)/E(0)·w with w ∈ 𝔖_A^× (Lemma 2.3.2). If 𝔐_𝔽 is connected of type v, every deformation 𝔐_A is connected with 𝔐^m_A = 0 (Lemma 2.3.3). For V_A = Θ(𝔐_A), det V_A|_{I_K} ≅ χ, and det V_A ≅ χ on G_K iff det H = pE(u)/E(0)·w with w ↦ 1 in (W(k) ⊗ A)^× iff a basis can be chosen with det H = pE(u)/E(0) (Lemma 2.3.4).

*Hypotheses and conventions.*
- p = 2 is allowed; K/ℚ_p finite with residue field k finite, 𝔖 = W(k)⟦u⟧, E(u) the Eisenstein polynomial of a uniformiser, K_∞ = K(π^{1/p^∞}); V_𝔽 a finite-dimensional 𝔽-representation of G_K; groupoids over Artinian and over "augmented" (A, I) W(𝔽)-algebras as in Kisin's appendix.
- dim_𝔽 V_𝔽 = 2.

*Proof outline.* 2.3.2: the symplectic pairing identifies φ^*𝔐 with Hom(φ^*𝔐, E(u)𝔖) via the maximal-isotropic condition, so the image of φ^*(det 𝔐) is E(u) det 𝔐. 2.3.3: a multiplicative part of rank 2 would make det H a unit; of rank 1 would force the quotient to be étale (by 2.3.2), contradicting connectedness. 2.3.4: 𝔐_{χ^{−1}} with φ(e) = pE(u)/E(0)e realises χ^{−1}; rank-one φ-modules change by φ(y)y^{−1}, and units ≡ 1 mod u are of this form; G_{K∞} and I_K generate G_K, and the Cartier-dual argument with (1.3.13) settles the inertial determinant.

*Acceptance.* The determinant condition replaces the p > 2 argument that relates fixed and cyclotomic-on-inertia determinants; at p = 2 this "does not seem to be obvious a priori".

*Prerequisites.* `R08.5/connected-kisin-modules-with-coefficients`, `R08.5/etale-multiplicative-parts`, `R08.4/hodge-type-resolution`.

*Sources.* Mark Kisin (KISIN-2ADIC-2009), §2.3, (2.3.1) and Lemmas 2.3.2–2.3.4, pp. 25–27 (DVI).

#### `R08.5/rank-two-connected-components` — Components of 2-adic Barsotti–Tate deformation rings (theorem)

For ξ ∈ D^{fl,c}_{V_𝔽}(R) with dim V_𝔽 = 2: the type-v locus 𝒢ℛ^{c,v}_{V_𝔽,ξ} ⊆ 𝒢ℛ^{fl,c}_{V_𝔽,ξ} is closed, Θ^v factors through Spec R^v (inertia acting on det by χ) and is an isomorphism after inverting p; and if ξ has determinant χ and ξ → D^{fl,c,χ} is formally smooth, the complete local rings of 𝒢ℛ^{c,v} are those of Hilbert modular varieties (Deligne–Pappas), so 𝒢ℛ^{c,v} is a normal local complete intersection over W(𝔽) with geometrically reduced special fibre and formally smooth generic fibre (Theorem 2.3.9). If det V_𝔽 = χ and V_𝔽 comes from a connected finite flat group scheme, the closed fibre 𝒢ℛ^{c,v}_{V_𝔽,0} is geometrically connected when k = 𝔽_p or G_K acts trivially on V_𝔽, and then Spec R[1/p] is geometrically connected (Theorem 2.3.11). The framed ring R^{fl,c,ψ,□}_{V_𝔽}[1/p] with determinant ψχ (ψ unramified) is formally smooth over E of relative dimension 3 + [K : ℚ_p], and geometrically connected under those conditions (Corollary 2.3.13).

*Hypotheses and conventions.*
- p = 2 is allowed; K/ℚ_p finite with residue field k finite, 𝔖 = W(k)⟦u⟧, E(u) the Eisenstein polynomial of a uniformiser, K_∞ = K(π^{1/p^∞}); V_𝔽 a finite-dimensional 𝔽-representation of G_K; groupoids over Artinian and over "augmented" (A, I) W(𝔽)-algebras as in Kisin's appendix.
- dim_𝔽 V_𝔽 = 2; for 2.3.11, k = 𝔽_p or G_K acting trivially.
- Dimension lowering at p=2 uses the rational determinant-twisting construction, not the p∤rank integral splitting.

*Proof outline.* (2.3.6): D̃^{v,χ} → D^{v,χ} is relatively pro-representable and formally smooth, and D̃^{v,χ} → D̄^v (the maximal isotropic submodules) is formally smooth, by modifying the Frobenius by diag(1, w^{−1}) to force det H = pE(u)/E(0). 2.3.9(1)–(2): Kisin FM 2.4.3 and 2.1.12; the generic fibre by the argument of Kisin FM 2.4.8 with connectedness tracked as in 2.2.7. 2.3.9(3): the diagram (2.3.10) with formally smooth top row and Deligne–Pappas's description of D̄^v as the local model of a Hilbert modular variety. 2.3.11: (1) as Kisin FM §2.5; (2) by Gee's argument; the generic-fibre statement as Kisin FM 2.4.10. 2.3.13: twist to ψ = 1 after a finite extension (ψ has a square root); dimension as Kisin FM 2.3.11, which gives 4 + [K : ℚ_p] without fixing the determinant.

*Acceptance.* This is Kisin's 2-adic Barsotti–Tate input to Khare–Wintenberger (hypothesis (H)); its p > 2 analogue is R08.4/rank-two-bt-components. Deligne–Pappas's local-model theorem is a cited input (the gap on Pappas–Rapoport local models is extended).

*Prerequisites.* `R08.5/rank-two-type-v`, `R08.5/flat-connected-deformation-ring`, `R08.4/resolution-local-structure`, `R08.4/rank-two-bt-components`, `R08.1/local-fixed-determinant`, `R08.1/determinant-twisting`.

*Sources.* Mark Kisin (KISIN-2ADIC-2009), §2.3, (2.3.5)–(2.3.13), pp. 27–30 (DVI).

#### `R08.5/ordinary-deformations-p2` — Ordinary deformation rings of rank two at p = 2 (theorem)

For a discrete ℤ_p[Γ_K]-module M with p nilpotent, H¹_f(G_K, M(χ)) (the classes whose inertial image lies in 𝒪^×_{K^ur} ⊗ M) is right exact in M (Lemma 2.4.2). The groupoid D^{ord,χ}_{V_𝔽} of triples (V_A, L_A, ι_A) with det V_A ≅ χ, L_A a G_K-stable line with I_K acting by χ, and extension class in H¹_f (2.4.3) is relatively representable and projective over D^χ_{V_𝔽}; Θ^{ord} becomes a closed embedding after inverting p, and is formally smooth when ξ is (Proposition 2.4.4). The scheme-theoretic image R^{ord}_ξ has as E-points the crystalline representations (χη ∗; 0 η^{−1}) with η unramified, R^{ord}_ξ[1/p] is formally smooth, and R^{ord}_ξ is a domain unless V_𝔽 ≅ χ₁ ⊕ χ₂ with χ₁ ≠ χ₂ and χ₁|_{I_K} = χ₂|_{I_K} = χ (Corollary 2.4.5); the framed version R^{ord,ψ,□}_{V_𝔽}[1/p] is formally smooth of dimension 3 + [K : ℚ_p] (Corollary 2.4.6).

*Hypotheses and conventions.*
- p = 2 is allowed; K/ℚ_p finite with residue field k finite, 𝔖 = W(k)⟦u⟧, E(u) the Eisenstein polynomial of a uniformiser, K_∞ = K(π^{1/p^∞}); V_𝔽 a finite-dimensional 𝔽-representation of G_K; groupoids over Artinian and over "augmented" (A, I) W(𝔽)-algebras as in Kisin's appendix.
- dim_𝔽 V_𝔽 = 2; K need not be unramified (unlike KW II 3.2.6).
- For the normality/domain conclusions for R^{ord}_ξ assume the source’s formally smooth flat deformation family ξ, as in Kisin (2.3.12), (2.4.4)–(2.4.6).

*Proof outline.* 2.4.2: resolve M by M₁ → M₀ free with lifted Γ_K-action; 0 → M(χ) → 𝒪^×_{K̄} ⊗ M₁ → 𝒪^×_{K̄} ⊗ M₀ → 0, and H¹(Γ_K, 𝒪^×_{K^ur} ⊗ M₁) = 0 by Hilbert 90, so H¹_f ≅ (𝒪^×_{K^ur} ⊗ M₀)^{Γ_K}/(𝒪^×_{K^ur} ⊗ M₁)^{Γ_K}. 2.4.4: D^{ord,χ}_ξ is a closed subscheme of ℙ(V_R); the line is unique when it exists (the χ-part for inertia), giving injectivity on points and a closed immersion after inverting p; formal smoothness from 2.4.2 via the groupoid D_{L_𝔽}. 2.4.5: valuative criterion; the closed fibre of 𝔏^{ord} is ℙ¹, two points or one point, giving the domain statement as Kisin FM 2.4.10. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* R08.6/export-ordinary exports the p > 2 ordinary rings from KW II Proposition 3.6; this node supplies p = 2 with general K.

*Prerequisites.* `R08.1/local-fixed-determinant`, `R08.1/local-lifting-ring`, `R08.4/ordinary-type-of-components`, `R08.4/finite-cocycles-kummer`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Mark Kisin (KISIN-2ADIC-2009), §2.4, (2.4.1)–(2.4.6), pp. 30–33 (DVI).

#### `R08.5/kisin-local-rings-p2-comparison` — Kisin's rings away from 2 and at ∞ against R08.1–R08.2 (comparison)

Kisin's rings for p = 2 away from 2 and at the real place are those already planned: the ring of extensions of γ by γ(1) (Proposition 2.5.2) is R08.2's Steinberg condition (domain of dimension 3 after inverting p, formally smooth); unramified lifts with determinant ψχ (2.5.3) form a formally smooth ring of relative dimension 3 (R08.2/unramified-lifting-ring); the fixed-determinant ring (2.5.4) is 3-dimensional after inverting p and a union of formally smooth components, with tangent dimension 3 + h²(G_L, ad⁰V_x) (R08.2/unrestricted-away-from-p); and the odd archimedean ring at p = 2 is 𝒪⟦x, y, z⟧/(x² + 2x + yz) for trivial V_𝔽 and 𝒪⟦x, y, z⟧/(x² + 2x + yz + z) for V_𝔽 = (1 1; 0 1), with universal lifts c ↦ (1+x y; z −1−x) and (1+x 1+y; z −1−x) (Proposition 2.5.6; R08.1/archimedean-odd-ring-p2).

*Hypotheses and conventions.*
- ℓ ≠ p finite (L/ℚ_ℓ) or the real place; p = 2 allowed.

*Proof outline.* The tangent computation in 2.5.4 uses ad = E′ ⊕ ad⁰ over the characteristic-zero field E′, which is legitimate at p = 2 (the stage forbids the splitting only over 𝔽). For 2.5.6: c² = 1 and det c = −1 give (1 + x)² + yz = 1 (trivial case) and (1 + x)² + (1 + y)z = 1 (unipotent case), i.e. the stated relations; both polynomials are irreducible and the rings are domains of dimension 2 after inverting p, smooth by the Jacobian criterion.

*Acceptance.* No new ring is planned here; the node records that Kisin's p = 2 statements are the existing nodes' statements with p = 2 allowed.

*Prerequisites.* `R08.2/steinberg-condition`, `R08.2/unramified-lifting-ring`, `R08.2/unrestricted-away-from-p`, `R08.1/archimedean-odd-ring-p2`.

*Sources.* Mark Kisin (KISIN-2ADIC-2009), §2.5, Propositions 2.5.2–2.5.6, pp. 33–35 (DVI).

#### `R08.5/weight-p-crystalline-ordinarity` — Crystalline lifts of weight k ≤ p are ordinary when the residual representation is (comparison)

Let p ≥ 3, F/ℚ_p finite unramified and ρ : G_F → GL₂(E) a lift of ρ̄ that is crystalline of weight k (Hodge–Tate weights {0, k − 1}) with 2 ≤ k ≤ p. If ρ̄ is ordinary (has a G_F-stable line with unramified quotient), ρ is ordinary. The endpoint k = p, where Fontaine–Laffaille modules of filtration length p − 1 occur but the torsion functor is not fully faithful, is included.

*Hypotheses and conventions.*
- The weight p + 1 case (F = ℚ_p) is R08.5/weight-p-plus-one-ordinary-ring, which imports the Berger–Li–Zhu criterion from PadicHodgeTheory R06.4 (red-team finding RT-AREA-langlands-2/17).
- The crystalline-to-ordinary criterion is imported from the requested full KW II Lemma 3.5 at PadicHodgeTheory R06.4; the current supplier’s endpoint branch does not yet state that complete criterion. This node is a deformation-ring comparison, not a second owner of the Galois criterion.

*Proof outline.* It suffices to show V has a non-trivial unramified ℚ_p[G_F]-quotient. Take a strongly divisible lattice M in the Fontaine–Laffaille module D(V); for k ≠ p choose M lifting ρ̄ (PadicHodgeTheory:R06.4/weight-p-endpoint-branch). V(M) has a non-trivial unramified 𝔽_p[G_F]-quotient (for k = p, unramified semisimplification), so M has a non-trivial subobject N with Fil¹N = 0; for k = p this uses FL 0.9: otherwise Fil^{p−1}M = M, a contradiction. Then V has a non-trivial unramified quotient (the unit-root summand of φ on M is non-trivial).

*Acceptance.* k = 2, F = ℚ_p: a crystalline weight-2 lift of an ordinary ρ̄ is the Tate module of an ordinary p-divisible group up to isogeny.

*Prerequisites.* `PadicHodgeTheory:R06.4/weight-p-endpoint-branch`, `PadicHodgeTheory:R06.4/two-dimensional-ordinarity-criterion`, `PadicHodgeTheory:R06.4/ordinary-representation`.

*Sources.* Chandrashekhar Khare (KW2-2009), Lemma 3.5 (i) and its proof, author copy p. 22; Chandrashekhar Khare (KW2-2009), proof of Lemma 3.5, p. 22.

#### `R08.5/weight-p-plus-one-ordinary-ring` — Crystalline lifts of weight p + 1: ordinarity and formal smoothness (theorem)

Let p ≠ 2, ρ̄ : G_{F_v} → GL₂(k) with F_v = ℚ_p, k(ρ̄) = p + 1 (so ρ̄|I_v ≅ (χ̄_p ∗; 0 1) très ramifié) and φ a fixed determinant. (1) For F_v = ℚ_p, every crystalline lift of weight p + 1 is ordinary (Berger–Li–Zhu), i.e. an extension of an unramified free rank-one representation by a free rank-one representation on which I_v acts by χ_p^p. (2) The framed fixed-determinant ring R^{□,ψ}_v of ordinary lifts of weight p + 1 (extensions of unramified η₂ by χ_p^pη₁) is formally smooth over 𝒪 of relative dimension 4. (3) The map Spf R^{□,ψ}_v → X to the space of characters giving the action on the stable line is not formally smooth.

*Hypotheses and conventions.*
- (1) is the second part of KW II Lemma 3.5(i), owned by PadicHodgeTheory R06.4 (red-team finding RT-AREA-langlands-2/17: R06.4 is the single owner; this layer imports it through a request).
- (2) does not use the smooth-resolution criterion: the ring is shown to be a power series ring directly.
- F_v=ℚ_p in every clause, as in KW II §3.2.7; the weight-(p+1) statement is not for an arbitrary finite extension.

*Proof outline.* (2) tangent space: over A with ϖA = 0 the ordinary weight-(p + 1) lifts coincide with the semistable weight-two lifts (χ̄_p^p ≡ χ̄_p mod ϖ), and the count of R08.4/finite-cocycles-kummer gives relative dimension 3 + [F_v:ℚ_p]; one checks η₁ = η₂ on such A: v_Z(a) = v_Z(a∘int(F)) = η₁(F)η₂(F)^{-1}v_Z(a) and v_Z(a) is a unit because the reduction is très ramifiée. (2) smoothness: lift the stable line, then find a lift of η₁η₂^{-1} for which the extension cocycle lifts: the obstruction f_γ(a) − f₀(a) is the cup product of γ ∈ H¹(F) with the très ramifiée class a ∈ H¹(𝔽(χ_p)), non-zero for γ ≠ 0 by local class field theory (Tau Ceti ClassFieldTheory Layer 5), so a unique γ₁ kills the obstruction. (3): KW II Remark after §3.2.7.

*Acceptance.* F_v = ℚ_p: relative dimension 4, so R^{□,ψ}_v ≅ 𝒪⟦T₁, …, T₄⟧.

*Prerequisites.* `R08.4/finite-cocycles-kummer`, `PadicHodgeTheory:R06.4/weight-p-plus-one-branch`, `PadicHodgeTheory:R06.4`, `R08.1/local-fixed-determinant`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Chandrashekhar Khare (KW2-2009), §3.2.7, author copy p. 31; Chandrashekhar Khare (KW2-2009), §3.2.7, p. 31; Chandrashekhar Khare (KW2-2009), Remark after §3.2.7, p. 32.

#### `R08.5/semistable-weight-two-resolution` — Semistable weight-two lifts at p: the resolution and the dyadic homothety case (theorem)

Let ρ̄_v = (γ̄_vχ̄_p ∗; 0 γ̄_v) : G_{F_v} → GL₂(k) with F_v/ℚ_p unramified and γ̄_v unramified, φ a fixed determinant, and γ_v a fixed unramified lift of γ̄_v with γ_v²χ_p = φ. Consider lifts (γ_vχ_p ∗; 0 γ_v). For finite A, |Z¹(D_v, A(χ_p))| = |A|^{2+[F_v:ℚ_p]}, and the moduli of such lifts with a stable line is a smooth resolution ℛ → Spf R^{□,ψ}_v: (1) unless p = 2 and D_v acts on ρ̄_v by homotheties, ℛ → Spf R^{□,ψ}_v is an isomorphism and ℛ is a torsor over the completion of ℙ¹_𝒪 at the residual line with its prescribed character of ρ̄_v under the completion of a free module of rank 2 + [F_v:ℚ_p] along the zero section; (2) if p = 2 and D_v acts by homotheties, ℛ is a torsor over the completion of ℙ¹_𝒪 along its special fibre under the completion of a free module of rank 2 + [F_v:ℚ_p].

*Hypotheses and conventions.*
- In case (2) the resolution is not an isomorphism: every line of the residual space is stable, which is the dyadic phenomenon of this layer; the consequences (domain, faithfully flat, regular generic fibre) are drawn in R08.6/export-semistable-weight-two-at-p by the smooth-resolution criterion.
- Uniqueness is for a stable line with the prescribed graded character, not for all invariant lines. A split sum of distinct characters has two invariant lines.

*Proof outline.* The count |Z¹| = |A|^{2+[F_v:ℚ_p]} from the Euler characteristic formula (*) of R08.4/finite-cocycles-kummer with M = A(χ_p), where H⁰(D_v, M*) = H⁰(D_v, A^∨) = A^∨ has |A| elements. The stable lines of ρ̄_v form a point of ℙ¹_k unless D_v acts by homotheties, which for a character γ̄χ̄_p ≡ γ̄ forces χ̄_p trivial on D_v, i.e. p = 2 (χ̄₂ is trivial).

*Acceptance.* p = 2, F_v = ℚ₂, ρ̄_v trivial: ℛ is a torsor over the formal completion of ℙ¹_𝒪 along ℙ¹_k with group of rank 3.

*Prerequisites.* `R08.4/finite-cocycles-kummer`, `R08.1/local-fixed-determinant`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

*Sources.* Chandrashekhar Khare (KW2-2009), §3.2.6, author copy p. 30; Chandrashekhar Khare (KW2-2009), §3.2.6, p. 30.

#### `R08.5/dyadic-minimal-lifts` — Minimal lifts in the dihedral and exceptional cases (p = 2 and residue characteristic 2) (construction)

Let v be a place with residue characteristic q ≠ p and ρ̄_v : D_v → GL₂(k) whose projective image G of I_v has order divisible by p and is non-cyclic. (a) If the centre C of the image of wild inertia in G is cyclic, then p = 2, G is dihedral of order 2d with d odd and q | d, and ρ̄_v ≅ Ind_{G_L}^{D_v}(γ) for a wildly ramified character γ of a ramified quadratic L/F_v; the minimal lift ρ₀ is an unramified twist of Ind(γ̂δ) with γ̂ the Teichmüller lift and δ a ramified quadratic character of G_L, with det ρ₀ = φ. Its restriction to I_v does not depend on δ, det ρ₀|I_v is the Teichmüller lift of det ρ̄|I_v, and the conductor of ρ₀ equals that of ρ̄_v. (b) If C is non-cyclic, then q = 2, p = 3, G ≅ A₄ inside S₄, and ρ₀ is the unique lift with determinant φ whose projectivisation is the lift of S₄ to PGL₂(ℤ₃). A lift ρ of ρ̄_v is minimal if ρ|I_v ≅ ρ₀|I_v; minimal lifts form the inertia-rigid deformation problem of ρ₀.

*Hypotheses and conventions.*
- In the cyclic-of-order-p case (ρ̄|I_v ≅ ξ ⊗ (1 η; 0 1)) minimal lifts are ξ̂ ⊗ (1 η̂; 0 1) on inertia; that case is R08.5/twisted-semistable-away-from-p's family.

*Construction.* (a): C cyclic has two fixed points in ℙ¹, giving two lines permuted by G, so ρ̄_v is induced; det Ind(γ̂δ) = ε_L·(γ̂∘t)·(δ∘t) with t the transfer, and (δ∘t)|I_v = ε_L|I_v, so det|I_v = γ̂∘t|I_v. (b): C ≅ (ℤ/2)², its normaliser in PGL₂(𝔽̄_p) is S₄, which forces q = 2 (wild inertia is a 2-group) and p = 3; S₄ lifts to PGL₂(ℤ₃), and p ≠ 2 gives a unique lift with determinant φ.

*API.*
- `TauCeti.GaloisDeformation.Local.DyadicMinimal.lift` (constructor): The lift ρ₀ = unramified twist of Ind(γ̂δ) in case (a), or the S₄-lift in case (b).
- `TauCeti.GaloisDeformation.Local.DyadicMinimal.restrict_inertia` (characterisation): ρ₀|I_v is independent of δ (case (a)).
- `TauCeti.GaloisDeformation.Local.DyadicMinimal.det_inertia` (simp): det ρ₀|I_v is the Teichmüller lift of det ρ̄_v|I_v.
- `TauCeti.GaloisDeformation.Local.DyadicMinimal.conductor` (compatibility): a(ρ₀) = a(ρ̄_v).
- `TauCeti.GaloisDeformation.Local.DyadicMinimal.problem` (constructor): Minimal lifts: the inertia-rigid problem attached to ρ₀ (GlobalGaloisDeformations R04.4).

*Unit tests.*
- `dyadicMinimal_det` (computation): For ρ̄_v = Ind(γ) with γ of order 3·2^a on a ramified quadratic L, det ρ₀|I_v = Teichmüller(det ρ̄_v|I_v).
- `dyadicMinimal_naive_fails` (non-example): The naive lift Ind(γ̂) without δ has det|I_v = ε_L·(γ̂∘t), which differs from the Teichmüller lift of det ρ̄|I_v by the ramified ε_L; δ corrects it.
- `dyadicMinimal_A4` (computation): q = 2, p = 3, G ≅ A₄: ρ₀ has projective image S₄ ⊂ PGL₂(ℤ₃) or its subgroup A₄.
- `dyadicMinimal_tame` (degenerate): If #G is prime to p, ρ₀ is the unique lift with ρ₀(I_v) ≅ ρ̄_v(I_v) (KW II §3.3.1, first case).

*Used by.* KW I, Theorem 5.1 — minimally ramified at primes ≠ p in the lifts of type (1), (2); LocalGaloisDeformationRings:R08.6/export-away-from-p — the inertia-rigid ring of ρ₀

*Acceptance.* Conductor: γ wild and δ tame gives a(ρ₀) = a(ρ̄_v).

*Prerequisites.* `R08.2/minimally-ramified-condition`, `GlobalGaloisDeformations:R04.4/inertia-rigid-deformations`, `R08.1/local-fixed-determinant`.

*Sources.* Chandrashekhar Khare (KW2-2009), §3.3.1, author copy p. 33; Chandrashekhar Khare (KW1-2009), §5, the definition of minimal lifts, p. 8.

#### `R08.5/twisted-semistable-away-from-p` — Twists of semistable deformations away from p (theorem)

Let v ∤ p and ρ̄|D_v = (γ̄_vχ̄_p ∗; 0 γ̄_v). Fix a character γ_v of D_v lifting γ̄_v whose restriction to I_v is the Teichmüller lift, with γ_v²χ_p = φ, and consider lifts (γ_vχ_p ∗; 0 γ_v). For a finite 𝒪-algebra A, |Z¹(G_{F_v}, A(χ_p))| = |A|·|H⁰(G_{F_v}, A)| = |A|², and the moduli of such lifts with a stable line is a smooth resolution as in R08.5/semistable-weight-two-resolution with cocycle module of rank 2. If ρ̄_v is ramified, the conductor of such a lift equals the conductor of ρ̄_v.

*Hypotheses and conventions.*
- This is the twisting calculation of KW II §3.3.4; at p = 2 it includes the case ρ̄(I_v) projectively cyclic of order 2.

*Proof outline.* Local Euler characteristic for v ∤ p: h⁰ − h¹ + h² = 0, and duality H²(A(χ_p)) ≅ H⁰(A^∨)^∨ (Tau Ceti ClassFieldTheory Layer 5), giving |Z¹(A(χ_p))| = |A|·|H⁰(A)|. Then argue as in R08.5/semistable-weight-two-resolution.

*Acceptance.* A = k, γ̄_v trivial, v ≡ 1 mod p: |Z¹(k(χ_p))| = |k|².

*Prerequisites.* `R08.5/semistable-weight-two-resolution`, `R08.4/finite-cocycles-kummer`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Chandrashekhar Khare (KW2-2009), §3.3.4, author copy pp. 36–37.

#### `R08.5/kw1-endpoint-weight-rings` — Endpoint-weight local rings for KW I Theorem 4.1 (theorem)

KW I Theorem 4.1 (modularity lifting) needs, at p, local deformation rings of the following lifts of ρ̄|G_{ℚ_p}, each with a flat reduced framed fixed-determinant ring of relative dimension 3 + 1 = 4 with regular generic fibre (or formally smooth): (1) p = 2: crystalline of weight 2 (Kisin's 2-adic Barsotti–Tate rings, R08.5/flat-connected-deformation-ring and R08.5/rank-two-connected-components), or semistable of weight 2 when k(ρ̄) = 4 (R08.5/semistable-weight-two-resolution, homothety case included); (2) p > 2: crystalline of weight k with 2 ≤ k ≤ p + 1 — the Fontaine–Laffaille range k ≤ p − 1, the endpoint k = p (R08.5/weight-p-crystalline-ordinarity) and k = p + 1 (R08.5/weight-p-plus-one-ordinary-ring) — or potentially semistable of weight 2 (R08.3/pst-deformation-ring, R08.4/savitt-weight-two-rings).

*Hypotheses and conventions.*
- KW I Theorem 4.1 assumes ρ̄ has non-solvable image when p = 2, and ρ̄|ℚ(μ_p) absolutely irreducible when p > 2; these are global hypotheses, not used by the local rings.

*Proof outline.* Each case is the cited node; the dimension 3 + [F_v:ℚ_p] with F_v = ℚ_p.

*Acceptance.* k(ρ̄) = p + 1, p = 5: crystalline weight-6 lifts are ordinary and their ring is 𝒪⟦T₁, …, T₄⟧.

*Prerequisites.* `R08.5/flat-connected-deformation-ring`, `R08.5/rank-two-connected-components`, `R08.5/semistable-weight-two-resolution`, `R08.5/weight-p-crystalline-ordinarity`, `R08.5/weight-p-plus-one-ordinary-ring`, `R08.3/pst-deformation-ring`, `R08.4/savitt-weight-two-rings`.

*Sources.* Chandrashekhar Khare (KW1-2009), Theorem 4.1, author copy p. 7; Chandrashekhar Khare (KW1-2009), Theorem 4.1 (1), p. 7.

*Coverage of R08.5:* planned. Remaining: Gaps recorded: Pappas–Rapoport local models; the integral endpoint classification and the complete KW II Lemma 3.5, requested from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4 and PadicHodgeTheory R06.4.

### Layer R08.6: Local deformation statements for the global arguments

R08.6 exports each local condition of Khare–Wintenberger with its ring, dimension, nonemptiness, tangent condition and component relation: KW II's conditions X_v and their rings, the smooth-resolution criterion (Proposition 2.12), the completed tensor product, KW I Theorem 5.1's four lift types, the good-dihedral type at q ≡ −1 mod p with Diamond's list, and the dyadic weight-two transition (k(ρ̄) = 2 crystalline versus k(ρ̄) = 4 semistable with N ≠ 0). For the modern lifting arguments it exports the local conditions only — ordinary potentially crystalline lifts of reducible ρ̄ and crystalline lifts in Serre weight (FKP Lemma 7.2), the local quotients of Newton–Thorne §4 and the torsion-semistable condition of Wake–Wang-Erickson, and Breuil–Conrad–Diamond–Taylor's conditions cut out by a category S; general de Rham lifting itself is GL2ModularityLifting R32.

*Planets:* KW II local conditions; Ordinary local rings; Local rings away from p; Completed local ring; KW I Theorem 5.1's local types; Good-dihedral local type.

#### `R08.6/smooth-resolution-criterion` — Smooth resolutions of framed deformation conditions (lemma)

Let R^□_X be a nonzero quotient of the framed ring R^□ by a (GL_d)_1-stable ideal. A smooth resolution of D^□_X is a flat 𝒪-scheme ℛ with an 𝒪-morphism f : ℛ → Spec R^□_X such that: (1) f is proper and 𝒪_{Spec R^□_X} → f_*𝒪_ℛ is injective (so f is surjective and Spec R^□_X is the scheme-theoretic image); (2) ℛ[1/p] → Spec R^□[1/p] is a closed immersion; (3) the fibre Y ⊂ ℛ over the closed point of Spec R^□_X is geometrically connected; (4) ℛ has a smooth algebraization along Y: an 𝒪-scheme ℛ₀, smooth of finite type, with a closed subscheme Y₀ and an 𝒪-morphism ℛ → ℛ₀ carrying Y into Y₀ that induces an isomorphism of formal completions ℛ^∧_Y ≅ (ℛ₀)^∧_{Y₀}. If such a resolution exists, then R^□_X is a domain, R^□_X[1/p] is regular, the relative dimension of R^□_X over 𝒪 equals that of ℛ, and the 𝒪̄-points of D^□_X are the images of the points of ℛ specialising into Y.

*Hypotheses and conventions.*
- KW II use this for the odd archimedean ring at p = 2 (Proposition 3.3), the ordinary rings (Proposition 3.6, in the homothety case, where ℛ₀ is the affine bundle over ℙ¹_{𝒪[T]} built with Lemma 3.8, R08.4/kw-algebraisation-lemma) and the semistable weight-two rings (§3.2.6, §3.3.4).
- Condition (4) is a comparison of formal completions along the whole closed fibre with a scheme of finite type; smoothness of the projective scheme ℛ alone does not give it. Kisin's variant (Annals 2009, (2.4.8) and (2.4.10); 2-adic paper, (2.4.4)–(2.4.5)) replaces (4) by formal smoothness of ℛ at its closed points together with reducedness of the special fibre.
- In the source's proof, 'By (2)' should read 'by (4)' (extraction issue PAPER-KHARE-WINTENBERGER-09-II/E4).
- Stein factorization, the theorem on formal functions and excellence are the commutative algebra and formal geometry inputs: AdicSpacesPartII F0 and DeformationAndDerivedPatchingAlgebra R03.3.

*Proof outline.* Stein-factorize f: Γ(ℛ, 𝒪_ℛ) is finite over R^□_X, semilocal and complete, and local because its maximal ideals come from the connected Y (3). By the theorem on formal functions it is the ring of global sections of ℛ^∧_Y ≅ (ℛ₀)^∧_{Y₀} (4); since ℛ₀ is smooth, it is normal, hence a domain, and so is R^□_X, which injects into it by (1). f induces ℛ[1/p] ≅ Spec R^□_X[1/p] by (1)–(2), which gives 𝒪-flatness of R^□_X and the dimension equality. Regularity of R^□_X[1/p]: every point of ℛ specialises into Y (f is proper and R^□_X local); the completion along Y is regular because ℛ₀ is smooth, and regularity descends by faithful flatness (Matsumura 24.B, 33.B).

*Acceptance.* f = id for a formally smooth R^□_X is a smooth resolution. The odd archimedean ring at p = 2 with ρ̄(c) = 1: ℛ ⊆ M(X² − 1) × ℙ¹ of pairs (M, L) with M|_L = id is a smooth resolution (KW II Proposition 3.3). Without (3) (disconnected Y), R^□_X can have several components.

*Prerequisites.* `AdicSpacesPartII:F0/theorem-on-formal-functions`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

*Sources.* Chandrashekhar Khare (KW2-2009), §2.8, Proposition 2.12 and its proof, pp. 16–18.

#### `R08.6/kw-local-conditions` — The local conditions of KW II (definition)

For a place v of a totally real F and ρ̄_v : D_v → GL_2(𝔽) with fixed determinant φ = ψχ_p, R̄^{□,ψ}_v is the flat, reduced quotient of R^{□,ψ}_v classifying, in the sense of KW II Definition 2.4, the lifts satisfying one of the following conditions X_v:
(∞) odd lifts;
(p) with F_v/ℚ_p unramified, and F_v = ℚ_p when ρ̄_v is irreducible or k(ρ̄_v) = p+1: low-weight crystalline lifts (crystalline of weight k(ρ̄_v) ≤ p, or ordinary of weight p+1 when k = p+1); weight-two lifts (for p odd, potentially semistable of weight 2 with inertial Weil–Deligne parameter (ω^{k−2} ⊕ 1, 0), or (1, N) with N ≠ 0 when k = p+1; for p = 2, crystalline of weight 2 if k = 2 and semistable of weight 2 if k = 4); semistable weight-two lifts (γ_vχ_p ∗; 0 γ_v) with a fixed unramified γ_v;
(v ∤ p) semistable lifts (γ_vχ_p ∗; 0 γ_v) with fixed γ_v (§3.3.4), or inertia-rigid lifts conjugate on inertia to a fixed ρ₀ (§3.3.1–3.3.3; F_v = ℚ_q in §3.3.3).
The choices (an unramified character when ρ̄_v ≅ η̄₁ ⊕ η̄₂ is unramified with k = p; the characters γ_v; the lift ρ₀) are part of the datum.

*Hypotheses and conventions.*
- The choices are what make the rings domains (KW II remarks after Theorem 3.1).
- Weight k and ordinary are KW II Definition 3.4 (weight k: V ⊗ ℂ_p = ℂ_p ⊕ ℂ_p(k − 1); ordinary: an unramified quotient and χ_p^a on inertia on the sub).

*Construction.* Each condition is (GL_2)_1-stable and closed on points, so the flat reduced quotient exists (KW II Corollary 2.3).

*API.*
- `TauCeti.GaloisDeformation.Local.KWCondition` (structure): A KW II local condition at v, with its choices.
- `TauCeti.GaloisDeformation.Local.KWCondition.ring` (constructor): R̄^{□,ψ}_v as the flat reduced quotient classifying X_v-lifts.
- `TauCeti.GaloisDeformation.Local.KWCondition.points` (characterisation): 𝒪′-points of the ring are exactly the X_v-lifts.
- `TauCeti.GaloisDeformation.Local.KWCondition.ring_unique` (characterisation): With all local type, weight, determinant and chosen-character data fixed, two reduced 𝒪-flat quotient rings having the same characteristic-zero X_v-points have the same kernel in R^□_v and a unique isomorphism respecting that quotient map.

*Unit tests.*
- `kwCondition_infinity` (computation): Odd lifts at a real place.
- `kwCondition_points` (characterisation): The ring classifies exactly the X_v-lifts on 𝒪′-points.
- `kwCondition_choice_needed` (non-example): For unramified ρ̄_v = η̄₁ ⊕ η̄₂ with η̄₁ ≠ η̄₂, the union over both choices of the unramified-quotient character has two components, so it is not a domain; KW II fix one choice.

*Used by.* GlobalGaloisDeformations:R04.6 — the local conditions of KW II §9 (kw-deformation-data).; GL2ModularityLifting:R22.1 — identification of the local problem satisfied by Hecke eigensystems.; PotentialModularityAndCompatibleSystems:R24.2 — local nonemptiness for the lifts of the required type.

*Acceptance.* For p = 2, the weight-two type at p is Barsotti–Tate with det|_{I_v} = χ_p when k = 2. The ordinary choice: for ρ̄_v = η̄₁ ⊕ η̄₂ unramified and distinct, one of the two characters is chosen for the unramified quotient. A lift that is crystalline of weight k but not ordinary with ρ̄_v ordinary does not occur for 2 ≤ k ≤ p (KW II Lemma 3.5).

*Prerequisites.* `R08.1/local-lifting-ring`, `R08.1/local-fixed-determinant`, `R08.3/hodge-and-galois-types`.

*Sources.* Chandrashekhar Khare (KW2-2009), §3 opening and §3.2.2, pp. 18 and 22–24.

#### `R08.6/export-archimedean` — Export: odd archimedean rings (theorem)

At a real place v, R̄^{□,ψ}_∞ (odd lifts) is the completion of the quadric of 2 × 2 matrices with characteristic polynomial X² − 1 at ρ̄(c). It is a domain, flat over 𝒪 of relative dimension 2, with regular generic fibre. It is formally smooth when ρ̄(c) ≠ 1, which always holds for p ≠ 2. For p = 2 and ρ̄(c) = 1 it is 𝒪⟦X₁, X₂, X₃⟧/(X₁² + X₂X₃ + 2X₁), a relative complete intersection.

*Hypotheses and conventions.*
- The rings are LocalGaloisDeformationRings R08.1 (archimedean-rings-p-odd, archimedean-odd-ring-p2); this node exports them in KW II's form.

*Proof outline.* p ≠ 2: the eigenlines give GL_2/D* ≅ ℙ¹ × ℙ¹ ∖ Δ, smooth of relative dimension 2. p = 2, ρ̄(c) = 1: the resolution by (M, L) with M|_L = id (smooth-resolution-criterion); substituting a = 1 + X₁ into a² + bc − 1 gives X₁² + bc + 2X₁.

*Acceptance.* Relative dimension 2 for every p. p = 2, ρ̄(c) = (1 1; 0 1): formally smooth. The equation X₁² + X₂X₃ + 2X₁ is R08.1's a² + bc − 1 with a = 1 + X₁.

*Prerequisites.* `R08.1/archimedean-rings-p-odd`, `R08.1/archimedean-odd-ring-p2`, `R08.6/smooth-resolution-criterion`.

*Sources.* Chandrashekhar Khare (KW2-2009), Proposition 3.3 and the Remark after it, pp. 20–21.

#### `R08.6/export-fontaine-laffaille-irreducible` — Export: irreducible residual representation, low-weight crystalline (theorem)

Let F_v = ℚ_p and ρ̄_p be irreducible of weight k ≤ p. The ring of crystalline lifts of weight k with fixed determinant is formally smooth over 𝒪 of relative dimension 1, and the framed ring R̄^{□,ψ}_v is formally smooth of relative dimension 4 = 3 + [ℚ_p : ℚ_p]. The same holds for p = 2 (k = 2).

*Hypotheses and conventions.*
- Fontaine–Laffaille theory (the filtered Dieudonné module has basis v₁, v₂ with v₂ spanning Fil^{k−1} and φ = (λ p^{k−1}; α 0), with α a unit fixed by the determinant and λ ∈ 𝔪) is the Fontaine–Laffaille part of this roadmap's L7; KW II extend Ramakrishna's argument to k = p and p = 2 using irreducibility.

*Proof outline.* The unframed ring is 𝒪⟦λ⟧ by the Fontaine–Laffaille description. End(ρ̄_p) = 𝔽, so the framed ring is a PGL_2-torsor over it: relative dimension 1 + 3 = 4 (R08.1/local-forget-framing).

*Acceptance.* 3 + [F_v : ℚ_p] = 4 for F_v = ℚ_p. The unframed ring has relative dimension 1. For reducible ρ̄_v the ring is not of this form; see export-ordinary.

*Prerequisites.* `R08.1/local-forget-framing`, `L7/fontaine-laffaille-tangent-space-and-smoothness`.

*Sources.* Chandrashekhar Khare (KW2-2009), §3.2.3, p. 24.

#### `R08.6/export-weight-two-irreducible` — Export: irreducible residual representation, weight two (theorem)

Let p ≠ 2, F_v = ℚ_p and ρ̄_p irreducible. After enlarging 𝒪, the fixed-determinant ring of weight-two potentially semistable lifts of this nontrivial tame principal-series inertial type is 𝒪⟦T₁, T₂⟧/(T₁T₂ − p), and every 𝒪′-point is of the required type. The framed ring R̄^{□,ψ}_v ≅ 𝒪⟦T₁, …, T₅⟧/(T₁T₂ − p) is a domain, flat of relative dimension 4, with regular generic fibre, and it is not formally smooth.

*Hypotheses and conventions.*
- Use precisely Savitt Theorem 6.22(3): τ=ω̃^i⊕ω̃^j with i≢j mod p−1, and ρ̄|I_p=ω₂^a⊕ω₂^{pa}, a=1+{j−i}+(p+1)i. Enlarge E to contain ℚ_{p²} and k_E to contain a square root of det ρ̄(Frob_p). The compatible fixed determinant is that of Savitt’s weight-two problem; rescale one variable to absorb the unit w in X₁X₂−pw.

*Proof outline.* Take Savitt's description of the unframed ring and add 3 framing variables (R08.1/local-forget-framing).

*Acceptance.* 𝒪⟦T₁, T₂⟧/(T₁T₂ − p) is a domain whose special fibre 𝔽⟦T₁, T₂⟧/(T₁T₂) has two components. Relative dimension 1 unframed and 4 framed. Not formally smooth over 𝒪: its special fibre 𝔽⟦T₁, T₂⟧/(T₁T₂) is not regular (for unramified 𝒪 the ring itself is still regular, since T₁T₂ − p ∉ 𝔪²).

*Prerequisites.* `R08.4/savitt-weight-two-rings`, `R08.1/local-forget-framing`.

*Sources.* Chandrashekhar Khare (KW2-2009), §3.2.4, p. 24.

#### `R08.6/export-ordinary` — Export: ordinary rings of low weight or weight two (theorem)

Let F_v/ℚ_p be unramified, ρ̄_v ordinary with k(ρ̄_v) ≤ p, and X_v the low-weight crystalline or weight-two potentially Barsotti–Tate condition, with the chosen unramified character. Then R̄^{□,ψ}_v is a domain, flat over 𝒪 of relative dimension 3 + [F_v : ℚ_p], with regular generic fibre. It is formally smooth if ρ̄_v is ramified or ρ̄_v ≅ η₁ ⊕ η₂ with η₁ ≠ η₂ unramified. Every lift of this type is (χ₁η₁ ∗; 0 η₂) with η₁, η₂ unramified, where χ₁ = χ_p^{k−1} (crystalline) or χ_pω^{k−2} (weight two).

*Hypotheses and conventions.*
- Ordinarity of the lifts is KW II Lemma 3.5, which uses Fontaine–Laffaille theory for crystalline weight k ≤ p, Berger–Li–Zhu for k = p+1 over ℚ_p, and Breuil–Diamond–Taylor Lemma 2.1.2 for weight two crystalline over ℚ_p^nr(μ_p).

*Proof outline.* The unramified characters are parametrized by A = 𝒪⟦T⟧ (η₁ = [η̄₁]η_T with η_T(Frob) = 1 + T). Lemma 3.7: the finite cocycles Z¹_f(B(Ξ)), Ξ = χ₁η₁η₂^{−1}, form a free B-module of rank 1 + [F_v : ℚ_p], compatibly with base change. (Finite cocycles are the kernel of the Kummer valuation map v_Z when k = 2.) The lines L stabilized by D_v with the ordinary action form a ℙ¹-type space, over which the lifts form a torsor under Z¹_f. This gives a smooth resolution (smooth-resolution-criterion) of relative dimension 1 + 1 + (1 + [F_v : ℚ_p]) = 3 + [F_v : ℚ_p]. When ρ̄_v is ramified, or split with distinct unramified characters, the stable line is unique and the resolution is an isomorphism, so the ring is formally smooth. The finite cocycles Z¹_f and their freeness of rank 1 + [F_v:ℚ_p] are R08.4/finite-cocycles-kummer (KW II Lemma 3.7); the smooth resolution over 𝒪⟦T⟧ is algebraised over 𝒪[T] by R08.4/kw-algebraisation-lemma (KW II Lemma 3.8); that every low-weight crystalline lift of an ordinary ρ̄_v is ordinary is R08.5/weight-p-crystalline-ordinarity. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* F_v = ℚ_p: relative dimension 4. ρ̄_v = η̄ ⊕ η̄ (scalar on D_v): the line space is all of ℙ¹, and the ring is a domain but not formally smooth. Relative dimension 3 + [F_v : ℚ_p] matches Kisin's formula d² + dim ad D/Fil⁰ − 1 (fixed determinant) with distinct Hodge–Tate weights at each embedding (R08.3/pst-generic-fibre).

*Prerequisites.* `R08.6/kw-local-conditions`, `R08.6/smooth-resolution-criterion`, `R08.3/pst-generic-fibre`, `L7/fontaine-laffaille-tangent-space-and-smoothness`, `R08.4/finite-cocycles-kummer`, `R08.4/kw-algebraisation-lemma`, `R08.5/weight-p-crystalline-ordinarity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Chandrashekhar Khare (KW2-2009), §3.2.5, Proposition 3.6, Lemma 3.7 and their proofs, pp. 24–30; Chandrashekhar Khare (KW2-2009), Lemma 3.5, p. 22.

#### `R08.6/export-semistable-weight-two-at-p` — Export: semistable weight-two rings above p (theorem)

Let ρ̄_v = (γ̄_vχ̄_p ∗; 0 γ̄_v) with γ̄_v unramified, and X_v the semistable weight-two lifts (γ_vχ_p ∗; 0 γ_v) with a fixed unramified γ_v lifting γ̄_v and γ_v²χ_p = φ. R̄^{□,ψ}_v is formally smooth over 𝒪 of relative dimension 3 + [F_v : ℚ_p], unless p = 2 and D_v acts by homotheties. In that case it is a domain, faithfully flat of relative dimension 3 + [F_v : ℚ_p], with regular generic fibre.

*Hypotheses and conventions.*
- The dyadic exception belongs to this roadmap's R08.5 (dyadic and endpoint cases).

*Proof outline.* Z¹(D_v, N(χ_p)) has cardinality |N|^{2+[F_v:ℚ_p]} for finite N, which gives a smooth resolution as in export-ordinary. Unless p = 2 with D_v acting by homotheties, the stable line is unique and the resolution is an isomorphism; otherwise use smooth-resolution-criterion. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* F_v = ℚ_p, p odd: 𝒪⟦T₁, …, T₄⟧. The dyadic homothety case is not formally smooth, but is a domain. γ_v²χ_p equals the fixed determinant φ. Deforming γ_v while retaining φ does not freely add one parameter; the determinant relation still constrains it. Removing both the chosen γ_v and determinant constraint adds the unramified character parameter at p odd.

*Prerequisites.* `R08.6/smooth-resolution-criterion`, `R08.6/export-ordinary`, `R08.5/semistable-weight-two-resolution`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Chandrashekhar Khare (KW2-2009), §3.2.6, pp. 30.

#### `R08.6/export-endpoint-weight` — Export: crystalline lifts of weight p + 1 (theorem)

Let p>2, F_v=ℚ_p and k(ρ̄_v)=p+1 in the KW II §3.2.7 residual Serre-weight case, with its compatible fixed determinant. The framed ring of crystalline (hence ordinary) lifts of weight p+1 is formally smooth over 𝒪 of relative dimension 4. The map to the space of characters of the stable line is not formally smooth.

*Hypotheses and conventions.*
- Crystalline lifts of weight p + 1 are ordinary (Berger–Li–Zhu, KW II Lemma 3.5(i) for F_v = ℚ_p); the endpoint weight belongs to this roadmap's R08.5.
- The weight-(p+1) branch of KW II §3.2.7 is over F_v=ℚ_p. Its printed dimension formula does not extend its local classification to every unramified extension.

*Proof outline.* Tangent space: modulo π the lifts are those of export-semistable-weight-two-at-p; the 'très ramifiée' cocycle forces η₁ = η₂, which gives dimension 3 + [F_v : ℚ_p]. Lifting along small extensions: lift the stable line; the obstruction f_γ is in H²(𝔽(χ_p)), one-dimensional, and it varies with an unramified γ by the cup product with a 'très ramifiée' class, which is nonzero by local class field theory. So some γ kills it. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* F_v = ℚ_p: 𝒪⟦T₁, …, T₄⟧. The Remark: the stable-line character map is not formally smooth. p = 2 is excluded (k(ρ̄) ≤ 4 there, and the endpoint is handled by the semistable case).

*Prerequisites.* `R08.6/export-semistable-weight-two-at-p`, `R08.5/weight-p-plus-one-ordinary-ring`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Chandrashekhar Khare (KW2-2009), §3.2.7 and the Remark, pp. 31–32.

#### `R08.6/export-away-from-p` — Export: rings at finite places away from p (theorem)

Let v ∤ p. (a) Semistable condition (γ_vχ_p ∗; 0 γ_v) with a fixed character γ_v (Teichmüller on inertia, γ_v²χ_p = φ): R̄^{□,ψ}_v is a domain, flat of relative dimension 3, with regular generic fibre (§3.3.4). (b) Inertia-rigid conditions (minimally ramified, abelian with fixed inertial character, non-abelian of level two with F_v = ℚ_q): after enlarging 𝒪 there is a lift ρ₀ with finite ρ₀(I_v) and determinant φ. The ring is flat, each component of relative dimension 3, with regular generic fibre (GlobalGaloisDeformations R04.4/inertia-rigid-deformations with d = 2, fixed determinant).

*Hypotheses and conventions.*
- The Steinberg condition is LocalGaloisDeformationRings R08.2/steinberg-condition; the inertia-rigid rings are GlobalGaloisDeformations R04.4 (KW II §2.7), placed there by RS-08.

*Proof outline.* (a): as export-semistable-weight-two-at-p, with the unramified twist γ_v and |Z¹(G, A(χ_p))| = |A|² (smooth resolution). (b): construct ρ₀. In the minimal case, lift ρ̄_v(I_v) isomorphically when its projective image has order prime to p, and use the dihedral or S₄ constructions otherwise (§3.3.1). In the abelian case with χ′ ≡ χ, use Lemma 3.9 to lift commuting unipotents. In the level-two case, use explicit ρ(F), ρ(σ) with int(ρ(F))ρ(σ) = ρ(σ)^q (§3.3.3). Then apply the inertia-rigid theorem: absolute dimension d² = 4 with fixed determinant gives relative dimension 3. Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* Relative dimension 3 in every case away from p. The minimal lift's conductor equals the conductor of ρ̄_v, and det|_{I_v} is the Teichmüller lift. Inertia-rigid rings need not be domains (several components), unlike the semistable ones.

*Prerequisites.* `R08.2/steinberg-condition`, `R08.2/minimally-ramified-condition`, `GlobalGaloisDeformations:R04.4/inertia-rigid-deformations`, `R08.6/smooth-resolution-criterion`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Chandrashekhar Khare (KW2-2009), Theorem 3.1 and §3.3, pp. 18–19 and 32–37.

#### `R08.6/export-completed-tensor-product` — Export: the completed tensor product of KW II's local rings (theorem)

For S a finite set of places and conditions X_v of kw-local-conditions at each v ∈ S, after enlarging 𝒪, R̄^{□,loc,ψ} = ⊗̂_{v∈S} R̄^{□,ψ}_v is flat over 𝒪, each component has relative dimension 3|S| when F is totally real and S contains the infinite places and the places above p, and R̄^{□,loc,ψ}[1/p] is regular. If the conditions at the finite places of S not above p are semistable, it is a domain. It has points over the integers of a finite extension of E.

*Hypotheses and conventions.*
- KW II Proposition 2.2 (the completed tensor product of flat domains with regular generic fibres and an 𝒪-point is again one) is DeformationAndDerivedPatchingAlgebra R03.1/R03.3 commutative algebra.

*Proof outline.* Relative dimensions: 2 at each infinite place ([F : ℚ] of them), 3 + [F_v : ℚ_p] above p (summing to 3|S_p| + [F : ℚ]), and 3 at the other finite places; the total is 3|S|. Flatness, regularity and the domain property pass to completed tensor products (Proposition 2.2(ii)); points exist by Proposition 2.2(i). Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* F = ℚ, S = {∞, p}: 2 + 4 = 6 = 3|S|. With an inertia-rigid place the tensor product can have several components, each of relative dimension 3|S|. This is the ring B of GlobalGaloisDeformations R04.6.

*Prerequisites.* `R08.6/export-archimedean`, `R08.6/export-ordinary`, `R08.6/export-away-from-p`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `R08.6/kw-local-conditions`, `R08.6/export-fontaine-laffaille-irreducible`, `R08.6/export-weight-two-irreducible`, `R08.6/export-semistable-weight-two-at-p`, `R08.6/export-endpoint-weight`.

*Sources.* Chandrashekhar Khare (KW2-2009), Proposition 3.2, p. 19.

#### `R08.6/local-nonemptiness` — Nonemptiness of KW II's local rings (theorem)

For every condition X_v of kw-local-conditions (with the hypotheses of KW II Theorem 3.1), R̄^{□,ψ}_v ≠ 0, and it has a point over the integers 𝒪′ of a finite extension of E, that is, a lift of ρ̄_v of type X_v. The same holds for their completed tensor product.

*Hypotheses and conventions.*
- This is the local nonemptiness that PotentialModularityAndCompatibleSystems R24.2 combines with global finiteness; it is not assumed for other types (R08.3/pst-deformation-ring gives an empty example).

*Proof outline.* Each ring is flat over 𝒪 and nonzero, because an explicit lift exists. At ∞: ρ̄(c) lifted to a matrix of characteristic polynomial X² − 1. At p: for ordinary ρ̄_v, lift the characters and then the extension class, which is possible because Z¹_f is free and commutes with base change (KW II Lemma 3.7); a Fontaine–Laffaille lift for irreducible ρ̄_v; Savitt's 𝒪⟦T₁, T₂⟧/(T₁T₂ − p) ≠ 0; the formally smooth endpoint ring. Away from p: ρ₀ of export-away-from-p, or a semistable lift with the fixed γ_v. A nonzero flat complete local Noetherian 𝒪-algebra has an 𝒪′-point (KW II Proposition 2.2(i)). Local Tate duality and the local Euler characteristic formula used in the dimension and smoothness count are Tau Ceti ClassFieldTheory Layer 5 (tateDualityPairing_perfect_mixed, eulerCharacteristic_finrank_fp), cited as that layer (red-team finding RT-AREA-langlands-2/16).

*Acceptance.* Contrast: for p > 2, ω with trivial type and Hodge–Tate weight 0 has no lift (R08.3/pst-deformation-ring), so nonemptiness is specific to KW's types. The completed tensor product has an 𝒪′-point by combining points at each v. Flatness alone is not enough (the zero ring is flat): the explicit lift gives nonzeroness.

*Prerequisites.* `R08.6/kw-local-conditions`, `R08.6/export-completed-tensor-product`, `R08.6/export-away-from-p`, `R08.6/export-ordinary`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Chandrashekhar Khare (KW2-2009), Theorem 3.1, p. 19.

#### `R08.6/kw1-lift-types` — The local conditions of KW I Theorem 5.1 (theorem)

KW I Theorem 5.1 lifts ρ̄ (S-type, 2 ≤ k(ρ̄) ≤ p + 1 for p > 2) to an almost strictly compatible system whose p-adic member has one of the following local types; each is exported with its ring, dimension, nonemptiness and tangent condition: (1) minimally ramified at primes ≠ p (R08.2/minimally-ramified-ring, R08.5/dyadic-minimal-lifts; R08.6/export-away-from-p) and crystalline of weight k(ρ̄) at p (R08.6/export-fontaine-laffaille-irreducible, R08.6/export-ordinary, R08.6/export-endpoint-weight); (2) weight 2, minimally ramified at primes ≠ p, with inertial Weil–Deligne parameter (ω_p^{k(ρ̄)−2} ⊕ 1, 0) at p, or (id, N ≠ 0) when k(ρ̄) = p + 1 (p > 2) or k(ρ̄) = 4 (p = 2) (R08.6/export-weight-two-irreducible, R08.6/export-ordinary, R08.6/export-semistable-weight-two-at-p, R08.6/dyadic-weight-two-transition); (3) at q ∥ N(ρ̄) with p | q − 1 and ρ̄|I_q = (χ ∗; 0 1): ρ_p|I_q = (χ′ ∗; 0 1) for a chosen non-trivial 𝒪′-valued lift χ′ of χ factoring through (ℤ/q)^× (i even if p = 2): the abelian condition with fixed inertial character (R08.6/export-away-from-p); (4) at q ≠ p with p | q + 1 and ρ̄|D_q ≅ (χ_p ∗; 0 1) up to unramified twist: the good-dihedral condition (R08.6/good-dihedral-type).

*Hypotheses and conventions.*
- Each local ring is flat over 𝒪 of relative dimension 3 (v ∤ p) or 3 + [F_v:ℚ_p] (v | p), with regular generic fibre, so the global presentation of KW II §4 applies.
- The order-p tame characters take values in enlarged coefficient integers 𝒪′ containing μ_p; they do not in general take values in ℤ_p^×.

*Proof outline.* Collect the exports; nonemptiness is R08.6/local-nonemptiness for the types above p and the explicit lifts ρ₀ of KW II §3.3 away from p.

*Acceptance.* Type (3) with q = 7, p = 3: χ′ = ω_7^{2i}, 0 < 2i ≤ 5, a non-trivial character of order 3 of (ℤ/7)^×.

*Prerequisites.* `R08.6/export-away-from-p`, `R08.6/export-ordinary`, `R08.6/export-fontaine-laffaille-irreducible`, `R08.6/export-weight-two-irreducible`, `R08.6/export-semistable-weight-two-at-p`, `R08.6/export-endpoint-weight`, `R08.6/local-nonemptiness`, `R08.5/dyadic-minimal-lifts`, `R08.2/minimally-ramified-ring`.

*Sources.* Chandrashekhar Khare (KW1-2009), Theorem 5.1, author copy p. 9.

#### `R08.6/good-dihedral-type` — The good-dihedral local condition at q ≡ −1 mod p (theorem)

Let q ≠ p be a prime with p | q + 1, and ρ̄|D_q ≅ (χ_p ∗; 0 1) up to unramified twist. Let {χ′, χ′^q} be a pair of 𝒪′-valued characters of I_q of level 2 (factoring through 𝔽_{q²}^× but not 𝔽_q^×) of p-power order, χ′ = ω_{q,2}^i ω_{q,2}^{qj} with 0 ≤ j < i ≤ q − 1, and i + j even when p = 2. The lifts with ρ|I_q ≅ χ′ ⊕ χ′^q (induced from a character of G_{ℚ_{q²}}) and fixed determinant form the non-abelian level-two inertia-rigid problem: its ring is flat of relative dimension 3 over 𝒪 with regular generic fibre, and it is non-empty after enlarging 𝒪. Such χ′ exist unless p = 2 and v₂(q + 1) = 1; for p odd they are the non-trivial powers of ω_{q,2}^{(q²−1)/p^r} (r = v_p(q + 1)), and (i, j) = (q − 1 − j, m(q + 1)/p^r − 1) with 0 < m < p^r/2, so i = j + 1 does not occur.

*Hypotheses and conventions.*
- The parity condition at p = 2 makes the global lift odd.
- If q is odd and the residual representation at q is irreducible, its Serre weight is q + 1 − (i − j) or i − j up to twist (Savitt, Corollary 6.15).
- The order-p tame characters take values in enlarged coefficient integers 𝒪′ containing μ_p; they do not in general take values in ℤ_p^×.

*Proof outline.* The ring: GlobalGaloisDeformations R04.4 inertia-rigid deformations of ρ₀ = Ind(χ̃′) with fixed determinant (R08.6/export-away-from-p (b), non-abelian level two with F_v = ℚ_q). Existence of χ′: characters of 𝔽_{q²}^× of p-power order not factoring through the norm exist iff the p-part of (q² − 1)/(q − 1) = q + 1 is non-trivial and, for p = 2, of order ≥ 4 to allow level-two characters of 2-power order with the parity (Diamond's list as quoted in KW I).

*Acceptance.* q = 5, p = 3: r = 1, χ′ = ω_{5,2}^{8m}, m = 1, so (i, j) = (3, 1).

*Prerequisites.* `R08.6/export-away-from-p`, `GlobalGaloisDeformations:R04.4/inertia-rigid-deformations`, `R08.1/local-fixed-determinant`.

*Sources.* Chandrashekhar Khare (KW1-2009), Theorem 5.1 (4), author copy pp. 9–10; Chandrashekhar Khare (KW1-2009), Remarks after Theorem 5.1, p. 10.

#### `R08.6/dyadic-weight-two-transition` — The dyadic weight-two transition: k(ρ̄) = 2 versus k(ρ̄) = 4 at p = 2 (theorem)

Let p = 2, F_v = ℚ₂ (or F_v/ℚ₂ unramified for reducible ρ̄_v), and φ = ψχ₂ a fixed determinant. The weight-two lifts used in KW I Theorem 5.1(2) and KW II §3.2.2(i) at p = 2 are: crystalline of weight 2 (equivalently Barsotti–Tate with det|I_v = χ₂) if k(ρ̄_v) = 2, and semistable of weight 2 with inertial Weil–Deligne parameter (id, N ≠ 0) if k(ρ̄_v) = 4. In the first case R̄^{□,ψ}_v is Kisin's 2-adic flat ring (R08.5/flat-connected-deformation-ring, R08.5/rank-two-connected-components), flat of relative dimension 3 + [F_v:ℚ₂] with regular generic fibre; in the second it is the semistable weight-two ring (γ_vχ₂ ∗; 0 γ_v) of R08.6/export-semistable-weight-two-at-p, formally smooth unless D_v acts by homotheties, in which case it is a domain, faithfully flat of relative dimension 3 + [F_v:ℚ₂] with regular generic fibre.

*Hypotheses and conventions.*
- The transition: since ω₂ is trivial, the parameter (ω^{k−2} ⊕ 1, 0) is trivial for every k at p = 2, so the weight-two type is distinguished by N: N = 0 for k = 2 and N ≠ 0 for k = 4.
- KW I Theorem 4.1(1) treats the semistable case only when k(ρ̄) = 4.

*Proof outline.* Combine R08.5/semistable-weight-two-resolution (2) with R08.6/smooth-resolution-criterion through R08.6/export-semistable-weight-two-at-p, and Kisin's 2-adic rings for k = 2.

*Acceptance.* ρ̄_v trivial, F_v = ℚ₂, k(ρ̄_v) = 4 cannot occur (k = 4 needs ρ̄_v très ramifié); for ρ̄_v = (1 ∗; 0 1) peu ramifié k = 2 and the crystalline ring is used.

*Prerequisites.* `R08.5/flat-connected-deformation-ring`, `R08.5/rank-two-connected-components`, `R08.5/semistable-weight-two-resolution`, `R08.6/export-semistable-weight-two-at-p`, `R08.6/smooth-resolution-criterion`.

*Sources.* Chandrashekhar Khare (KW2-2009), §3.2.2 (i), author copy p. 23; Chandrashekhar Khare (KW1-2009), Theorem 5.1 (2), p. 9.

#### `R08.6/ordinary-pcris-lifts-reducible` — Ordinary potentially crystalline local lifts of reducible residual representations (theorem)

Let p ≥ 3, ρ̄ ∼ (χ̄ ∗; 0 1) a two-dimensional residual representation of G_{F,S}, and μ = κ^{r−1}χ₀ (r ≥ 2, χ₀ of finite order) a geometric lift of det ρ̄. After enlarging 𝒪, for v | p there is an ordinary potentially crystalline lift ρ_v of ρ̄|G_{F_v} with Hodge–Tate weights {0, r − 1} and determinant μ; and there is always an ordinary potentially crystalline lift with Hodge–Tate weights {0, r − 1} having a non-trivial unramified quotient, possibly without det ρ_v = μ. Here a lift is ordinary when it is F′_v-ordinary of some weight in the sense of L7/g-valued-ordinary-condition (for GL₂: a stable line with the prescribed inertial characters).

*Hypotheses and conventions.*
- FKP apply 'ordinary' to ρ̄|G_{F_v} itself; Definition B.2 concerns lifts (extraction issue E29).

*Proof outline.* If χ̄|G_{F_v} ≠ κ̄, a duality argument gives an extension (κ^{r−1}χ₀ ∗; 0 1) lifting ρ̄|G_{F_v}: H²(G_{F_v}, 𝒪(κ^{r−1}χ₀)) is controlled by H⁰ of the dual (Tau Ceti ClassFieldTheory Layer 5). If χ̄|G_{F_v} = κ̄, the argument of BLGG Lemma 6.1.6 extended to general r, distinguishing peu and très ramifiée classes, after a potentially unramified twist.

*Acceptance.* r = 2, χ̄|G_{F_v} = κ̄, ∗ peu ramifié: the lift is (κ ∗; 0 1) with ∗ a Kummer class, the Tate module of an ordinary p-divisible group. Use a Kummer unit class for the Barsotti–Tate example; the uniformizer class gives semistable noncrystalline monodromy.

*Prerequisites.* `L7/g-valued-ordinary-condition`, `R08.1/local-fixed-determinant`, `PadicHodgeTheory:R06.4/ordinary-implies-semistable`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`.

*Sources.* Najmuddin Fakhruddin (FKP-2022), Lemma 7.2, second bullet, arXiv v5 p. 34.

#### `R08.6/serre-weight-crystalline-lift` — A crystalline lift in Serre weight (theorem)

Let ρ̄_p : G_{ℚ_p} → GL₂(k) (or G_{F_v} with F_v = ℚ_p at each v | p) and r = k(ρ̄_p) Serre's weight (Serre 1987 §2.3). After enlarging 𝒪 there is a crystalline lift ρ_p of ρ̄_p with Hodge–Tate weights {0, r − 1}; when ρ̄_p is reducible it may be chosen ordinary with an unramified quotient.

*Hypotheses and conventions.*
- The printed statement gives only a crystalline lift; the ordinarity used in the proof of FKP Theorem 7.4 comes from R08.6/ordinary-pcris-lifts-reducible (review note of the extraction).

*Proof outline.* Buzzard–Diamond–Jarvis §3.2: Serre's weight is realised by a crystalline lift of the corresponding Hodge–Tate weights (Fontaine–Laffaille for r ≤ p, PadicHodgeTheory:R06.4/weight-p-endpoint-branch; the weight p + 1 case by the ordinary extension of R08.5/weight-p-plus-one-ordinary-ring).

*Acceptance.* ρ̄_p = ω^{r−1} ⊕ 1 with 2 ≤ r ≤ p − 1: the lift χ_p^{r−1} ⊕ 1 is crystalline of weights {0, r − 1}.

*Prerequisites.* `PadicHodgeTheory:R06.4/weight-p-endpoint-branch`, `R08.5/weight-p-plus-one-ordinary-ring`, `R08.6/ordinary-pcris-lifts-reducible`.

*Sources.* Najmuddin Fakhruddin (FKP-2022), Lemma 7.2, third bullet, arXiv v5 p. 34.

#### `R08.6/newton-thorne-local-quotients` — Local quotients for weight-two symmetric power lifting (Newton–Thorne §4) (application)

Let r : G_F → GL₂(k) with det = ε^{-1} and R_v the fixed-determinant lifting ring at v. The local quotients R̄_v used in Newton–Thorne §4 are: (1) v | p, r_{π,ι}|G_{F_v} non-ordinary: the reduced 𝒪-torsion-free quotient of crystalline non-ordinary lifts of Hodge–Tate weights {0, 1}, a domain of dimension 4 + [F_v:ℚ_p] (Kisin, Corollary 2.3.13); (2) v | p, ordinary crystalline: the ordinary crystalline quotient, a domain of dimension 4 + [F_v:ℚ_p] (Kisin, Proposition 2.4.6); (3) v ∈ Σ_p (ordinary non-crystalline, p > 2): the semistable non-crystalline quotient, a domain of dimension 4 + [F_v:ℚ_p] (Snowden, Proposition 4.3.1); (4) v ∈ Σ^p: the extensions of ε^{-1} by 1, a domain of dimension 4 (Kisin, Proposition 2.5.2); (5) v real: Kisin's R^{V−1,F}, a domain of dimension 3 (Proposition 2.5.6).

*Hypotheses and conventions.*
- Kisin, Moduli of finite flat group schemes and modularity (Annals 2009) is KISIN-FFLAT-2009 of this packet.
- Use Newton–Thorne’s §4 standing local situation after the soluble base change: the residual representation is trivial at every v∈S, and the determinant is ε⁻¹. The five quotients are not a theorem for arbitrary residual r. The noncrystalline p-adic case requires p>2.

*Proof outline.* (1)–(2): R08.4/rank-two-bt-components and R08.4/rank-two-ordinary-locus. (3): L7/snowden-ordinary-ring-trivial-residual (Snowden's semistable component). (4): R08.6/export-away-from-p (a). (5): R08.1/archimedean-rings-p-odd.

*Acceptance.* Each ring has dimension 4 + [F_v:ℚ_p] = 3 + [F_v:ℚ_p] + 1 (relative dimension plus 1).

*Prerequisites.* `R08.4/rank-two-bt-components`, `R08.4/rank-two-ordinary-locus`, `L7/snowden-ordinary-ring-trivial-residual`, `R08.6/export-away-from-p`, `R08.1/archimedean-rings-p-odd`.

*Sources.* James Newton (NT-2026), §4, after Theorem 4.1, arXiv v2 p. 27; James Newton (NT-2026), §4, after Theorem 4.1, p. 27.

#### `R08.6/torsion-semistable-condition` — Torsion semistable lifts with Hodge–Tate weights in {0, 1} form a stable condition (theorem)

Let F_v/ℚ_p be finite and r̄ : G_{F_v} → GL₂(k). The condition on a lift r_B (B ∈ C_𝒪 Artinian) that B² be isomorphic, as ℤ_p[G_{F_v}]-module, to a subquotient of a lattice in a semistable ℚ_p[G_{F_v}]-representation with Hodge–Tate weights in {0, 1} is stable (closed under subobjects, quotients and finite direct sums in the sense of Ramakrishna), so it cuts out a quotient R′_v of the fixed-determinant lifting ring R_v. The semistable non-crystalline quotient of R08.6/newton-thorne-local-quotients (3) factors through R′_v.

*Proof outline.* Wake–Wang-Erickson Theorem 2.3.4 with §5.2: a stable condition on finite-length modules defines a quotient of a deformation ring. Factorisation: R̄_v is reduced with dense characteristic-zero points; each such point is an extension of an unramified character by its ε^{-1}-twist, semistable with weights {0, 1} (Snowden Proposition 4.3.1), so its finite-length quotients are torsion semistable.

*Acceptance.* The crystalline quotients (1)–(2) of R08.6/newton-thorne-local-quotients also factor through R′_v.

*Prerequisites.* `R08.6/newton-thorne-local-quotients`, `R08.4/flat-deformation-condition`, `L7/snowden-ordinary-ring-trivial-residual`.

*Sources.* James Newton (NT-2026), proof of Lemma 4.2, arXiv v2 pp. 28–29.

#### `R08.6/category-deformation-conditions` — Deformation conditions cut out by a category S (BCDT §4.3) (construction)

Let K/ℚ_ℓ be finite with integers 𝒪 and residue field k, ρ̄ : G_ℓ → Aut_k(V) two-dimensional with centraliser k, and ψ a lift of det ρ̄. S(ρ̄) is the abelian category of finite-length 𝒪[G_ℓ]-modules with a filtration whose graded pieces are ≅ V. For a full subcategory S ⊂ S(ρ̄) closed under isomorphism, finite products, subobjects and quotients and containing V, D^S_{V,𝒪}(R) is the set of deformations to R with R/𝔞 ∈ S (as 𝒪[G_ℓ]-modules, R/𝔞)² for all open ideals 𝔞; D^{ψ,S} adds det = ψ. They are represented by R^S_{V,𝒪} and R^{ψ,S}_{V,𝒪}, quotients of R_{V,𝒪} and R^ψ_{V,𝒪}; the tangent space of D^S is Ext¹_S(V, V) and that of D^{ψ,S} is H¹_S(G_ℓ, ad⁰ρ̄).

*Hypotheses and conventions.*
- S = finite flat modules recovers R08.4/flat-deformation-condition (Ramakrishna); BCDT use the S of modules with descent data of given type (S_{±1}) at ℓ = 3.

*Construction.* Ramakrishna's criterion: closure of S under products, subobjects and quotients makes D^S a relatively representable subfunctor; the tangent space is the subgroup of extensions lying in S.

*API.*
- `TauCeti.GaloisDeformation.Local.CategoryCondition` (data): A full subcategory S ⊂ S(ρ̄) closed under isomorphism, finite products, subobjects and quotients, containing V.
- `TauCeti.GaloisDeformation.Local.CategoryCondition.defFunctor` (constructor): D^S_{V,𝒪} and D^{ψ,S}_{V,𝒪}.
- `TauCeti.GaloisDeformation.Local.CategoryCondition.ring` (constructor): R^S_{V,𝒪}, R^{ψ,S}_{V,𝒪}, quotients of R_{V,𝒪}, R^ψ_{V,𝒪}.
- `TauCeti.GaloisDeformation.Local.CategoryCondition.tangent` (characterisation): Tangent space of D^{ψ,S} is H¹_S(G_ℓ, ad⁰ρ̄) ⊂ H¹(G_ℓ, ad⁰ρ̄).
- `TauCeti.GaloisDeformation.Local.CategoryCondition.flat` (compatibility): For S the finite flat modules, D^S is R08.4/flat-deformation-condition.
- `TauCeti.GaloisDeformation.Local.CategoryCondition.mono` (functoriality): For S⊂T satisfying the category-condition hypotheses and the same residual object and determinant, D^S⊂D^T induces a canonical surjection R^T↠R^S commuting with the universal lifts.

*Unit tests.*
- `categoryCondition_all` (degenerate): S = S(ρ̄): R^S_{V,𝒪} = R_{V,𝒪}.
- `categoryCondition_flat` (compatibility): S = finite flat 𝒪[G_ℓ]-modules (ℓ = p): R^S is the flat deformation ring.
- `categoryCondition_not_closed` (non-example): The full subcategory consisting of 0 and a single copy of the residual object V is not closed under finite products: V⊕V is missing. It therefore fails the category-condition hypotheses. A category of semisimple sums is not a counterexample to subobject/quotient closure.
- `categoryCondition_tangent_dim` (computation): For S = finite flat, ρ̄ peu ramifié of weight 2 over ℚ_p: dim H¹_S(G_p, ad⁰ρ̄) = 1 + dim H⁰(G_p, ad⁰ρ̄).

*Used by.* BCDT 2001, §4.3–4.5 — the local deformation problems at 3 for the wild 3-adic exercises; LocalGaloisDeformationRings:R08.6 — local conditions exported with tangent spaces as subspaces of H¹

*Acceptance.* S = S(ρ̄) gives D^S = D_{V,𝒪} with tangent space H¹(G_ℓ, ad ρ̄).

*Prerequisites.* `R08.4/flat-deformation-condition`, `R08.1/local-forget-framing`, `GlobalGaloisDeformations:R04.3/local-deformation-problem`.

*Sources.* Christophe Breuil (BCDT-2001), §4.3, p. 874; author manuscript pp.27–28 (§4.3).

*Coverage of R08.6:* planned. Remaining: Gap recorded: the endpoint crystalline classification behind R08.6/export-fontaine-laffaille-irreducible and R08.6/export-endpoint-weight. The general de Rham lifting theorem is GL2ModularityLifting R32; R08.6 exports only its local conditions.

## Gaps

- **Pappas–Rapoport local models for Res_{K/ℚ_p} GL_d are not planned anywhere.** Kisin (2.2.2) and (2.2.8) use Pappas–Rapoport, Local models in the ramified case I (J. Algebraic Geom. 12 (2003)), 5.3, 5.8, 5.10: the flat closure M^loc_r of the naive local model M_r is normal and Cohen–Macaulay, its special fibre is reduced and normal with rational singularities and equals the closure of the stratum of the dual partition, and M^loc_r = M_r when the r_φ differ by at most 1 and either r ≤ e or e ≤ 2. No stage of AlgebraicModuliForArithmeticGeometry, HilbertModularVarietiesAndShimuraCurves or any other roadmap in the atlas plans these local models. Only the case v_ψ ∈ {0, 1} (where M^loc = M) is needed for the rank-two Barsotti–Tate application, which narrows what a supplier must provide. Kisin's 2-adic Theorem 2.3.9(3) uses the Deligne–Pappas description of the local model of Hilbert modular varieties in the same way. The packet's restructure record proposes 'Algebraic moduli for arithmetic geometry, Part II: local models for Weil restrictions of GL_d' as the owner, shared with HilbertModularVarietiesAndShimuraCurves H2. (needed by `R08.4/resolution-local-structure`, `R08.5/rank-two-connected-components`).
- **Generic reducedness of potentially Barsotti–Tate lifting rings (Caraiani–Emerton–Gee–Savitt) is not planned anywhere.** Caraiani–Emerton–Gee–Savitt, 'Components of moduli stacks of two-dimensional Galois representations', Theorem 1.3: the special fibres of the potentially Barsotti–Tate lifting rings of ρ̄ : G_K → GL₂(k) are generically reduced. Its proof goes through the Emerton–Gee moduli stacks of (φ, Γ)-modules and Breuil–Kisin modules with descent data, which no roadmap of the atlas plans (no Emerton–Gee stack roadmap exists). Caraiani–Newton Lemma 5.3.3 uses it; a new roadmap or a Part II of FiniteFlatGroupsAndIntegralPadicHodgeTheory would own it. (needed by `R08.4/bt-ring-unique-generalisation`).
- **Natural-topology continuous cohomology beyond finite coefficients.** ClassFieldTheory Layer 5 is a finite discrete coefficient theory; PQ’s natural-topology κ-coefficient extension and the coefficient-linear H² comparison are requested explicitly. (needed by `R08.1/lambda-presentation`, `R08.1/g-valued-presentations`).
- **Integral reductive group scheme and Lie API.** ArithmeticStatistics ST.5 owns the integral GSp matrix carrier; its smooth group-scheme, derived-group and integral Lie-algebra extension is requested. Booher's hypotheses are now explicit in R08.2/g-valued-generic-fibre-away-from-p (G = GSp_{2n}, p > 2n, after enlarging 𝒪). For general smooth affine G (Paškūnas–Quast, Balaji, Bellovin–Gee) the group-scheme API over coefficient rings (Lie algebras, smoothness, G/G_der) is the remaining input. (needed by `R08.1/g-valued-framed-ring`, `R08.3/g-valued-pst-rings`).
- **Endpoint crystalline classification and KW ordinarity input.** The strict FL interval stops at p−2. Integral endpoint lattice results at weights p and p=2, plus full KW II Lemma 3.5 including Berger–Li–Zhu, must be imported from R07.4/R06.4. The existing R06.4 branch statements do not supply the complete lemma. (needed by `R08.6/export-fontaine-laffaille-irreducible`, `R08.6/export-endpoint-weight`, `R08.5/weight-p-crystalline-ordinarity`, `R08.5/weight-p-plus-one-ordinary-ring`).
- **Jacquet–Langlands transfer of types for D^× (inputs to Dotto’s cycle comparison).** R08.2/dotto-division-algebra-cycles states Dotto's cycle maps and his Theorem 6.3 exactly. Their representation-theoretic inputs are planned by no roadmap in the atlas: the Jacquet–Langlands correspondence between D^× and essentially square-integrable representations of GL_n(K) and its compatibility with inertial classes; the Bushnell–Kutzko and Schneider–Zink K-types σ_𝔓(𝔰), σ^+_𝔓(𝔰) and their detection property (Dotto Example 3.8); the transfer JL_K of Definition 5.2 and its mod p reduction JL_p (Theorem 5.5); and Bushnell–Henniart's description of level-zero transfers. A local Langlands/Jacquet–Langlands roadmap for GL_n would own them. (needed by `R08.2/dotto-division-algebra-cycles`).
- **Ordinary weight and canonical torus comparison.** For general split reductive G, FKP Appendix B uses Borel subgroups of G_A over finite local E-algebras and over 𝒪-algebras, their Zariski-local conjugacy to a fixed B₀ and the canonical torus T_G = B/R_u(B) independent of B, together with the flag scheme G/B₀ representing Borels (SGA3 Exp. XXII 5.8.3, Exp. XXVI 3.3). Tau Ceti ReductiveGroups supplies these over fields (Layer 7) and the split groups over ℤ (Layer 9); the relative statements over coefficient rings are its long-horizon Layer 8, so no layer supplies them yet. The GL_n and GSp₄ cases use explicit flags and are unaffected. The weight conventions are fixed in L7/ordinary-of-weight-lambda: HT(ε) = +1, the sub-objects carry the larger weights, and Khare–Wintenberger's ρ_f is the dual with the flag reversed. (needed by `L7/g-valued-ordinary-condition`, `L7/g-valued-ordinary-quotient`).
- **Suggested Lean file: items still in the comment inventory.** The suggested file elaborates, at the pinned Mathlib, 73 of the 245 API items, 54 of the 162 unit tests and 54 of the 114 theorem-type nodes, with proof placeholders as its only warnings; every other API name, test name and theorem appears in its final comment inventory with its statement. Most inventory entries need carriers owned by supplier roadmaps (period rings and p-adic Hodge predicates, Kisin and Fontaine–Laffaille modules, continuous Galois cohomology, schemes over Spec R), named per entry. The entries listed here use only local inertia, Weil–Deligne or scheme-theoretic data of this roadmap's own earlier nodes and are still to be given Lean signatures against the carriers of the file (LiftingRing, TameGroup, ideals of R^□). (needed by `R08.2/fixed-type-rings-rank-n`, `R08.2/dotto-division-algebra-cycles`, `R08.2/regular-unipotent-minimally-ramified`, `R08.2/gsp4-ramification-types`, `R08.2/gsp4-unipotent-local-models`, `R08.2/gsp4-ihara-avoidance-rings`, `R08.2/g-valued-generic-fibre-away-from-p`, `R08.2/equal-characteristic-local-lifts`, `R08.2/reducible-lifts-prescribed-determinant`, `R08.2/ihara-avoidance-rings-p2`, `R08.2/gsp4-minimal-conditions`, `R08.2/rigid-residual-conditions`, `R08.3/hodge-type-components`, `L7/geraghty-fixed-weight-ordinary-rings`, `L7/trivial-residual-flag-ring`, `L7/ordinary-condition-fixed-inertial-characters`, `L7/discrete-series-deformation-condition`, `L7/semistable-ordinary-quotient`, `L7/ordinary-ring-with-frobenius-eigenvalue`, `L7/gsp4-siegel-ordinary-condition`, `L7/connects-relation`, `L7/weight-zero-crystalline-connectedness`, `L7/semisimple-kisin-modules-and-shapes`, `L7/gl3-explicit-rings`, `L7/partition-ring-smooth-points`, `L7/away-from-p-rank-n-interface`, `R08.4/hodge-type-resolution`, `R08.4/resolution-local-structure`, `R08.4/rank-two-nonordinary-connected`, `R08.4/rank-two-bt-components`, `R08.4/bt-ring-unique-generalisation`, `R08.5/etale-multiplicative-parts`, `R08.5/connected-model-moduli`, `R08.5/rank-two-type-v`, `R08.5/rank-two-connected-components`, `R08.5/kw1-endpoint-weight-rings`, `R08.6/kw-local-conditions`, `R08.6/export-fontaine-laffaille-irreducible`, `R08.6/export-weight-two-irreducible`, `R08.6/dyadic-weight-two-transition`, `R08.6/newton-thorne-local-quotients`, `R08.6/torsion-semistable-condition`).
- **Colmez–Fontaine proof and inertia-type projection.** PadicHodgeTheory--P7 defines the Colmez–Fontaine proposition in R06.2 and records the R06.3 proof as a restructure proposal/open gap. It cannot yet discharge admissibility in filtered-module deformation comparisons. The exact proof and the projection forgetting N are requested from R06.3. (needed by `R08.3/filtered-phi-N-deformations`, `R08.3/hodge-and-galois-types`).

## Structure: proposals for the atlas

- **rescope** (LocalGaloisDeformationRings). Red-team finding RT-AREA-langlands-2/18: R08.3 and L7 both state Kisin's potentially semistable deformation rings. Kisin's construction is rank-general, and this packet plans it once, in R08.3, in every rank and for every finite K/ℚ_p (R08.3/pst-deformation-ring, R08.3/pst-generic-fibre, R08.3/pcris-generic-smooth, R08.3/pst-quotient-in-families, R08.3/g-valued-pst-rings). *Proposal:* Correct R08.3's text to 'for every rank n and finite K/ℚ_p' and add one owners entry: potentially semistable deformation rings of fixed Hodge and inertial type (with determinant variants) → LocalGaloisDeformationRings:R08.3. Narrow L7 to what R08.3 does not contain: bounded-height lattice and local-model moduli, Fontaine–Laffaille and discrete-series conditions, ordinary conditions and flag functors (GL_n, G-valued, GSp₄), component relations ('connects', GL₃ labelling) and the rank-n interface with R08.2. L7 imports R08.3 through the existing edge R08.3 → L7.
- **split** (LocalGaloisDeformationRings). Two stage-level dependencies run against the atlas edges: (i) R08.3's semistable quotient and its families form (R08.3/semistable-height-quotient, R08.3/pst-quotient-in-families) use L7's bounded-height lattice moduli (L7/finite-height-lattices, L7/height-lattice-moduli), while the atlas has R08.3 → L7 and RS-08 makes L7 the owner of the rank-general lattice moduli; (ii) L7/ordinary-flag-scheme uses L8/ordinary-coefficient-ring, while the atlas has L7 → L8. L7 is also too broad to read as one star (lattice moduli, Fontaine–Laffaille, ordinary theory in three groups, component geometry). *Proposal:* Divide L7 into sub-layers: L7a 'Bounded-height lattice moduli' (L7/finite-height-lattices, L7/height-lattice-moduli), placed before R08.3 (links L7a → R08.3, L7a → R08.4, L7a → R08.5), which keeps RS-08's ownership in L7 and removes the cycle; L7b 'Fontaine–Laffaille, discrete series and rank-n conditions away from p' (L7/fontaine-laffaille-*, L7/discrete-series-*, L7/partition-*, L7/away-from-p-rank-n-interface, L7/regular-unipotent use); L7c 'Ordinary conditions for GL_n and G' (L7/ordinary-of-weight-lambda, L7/ordinary-flag-scheme, L7/trivial-residual-flag-ring, L7/residually-split-nearly-ordinary-ring, L7/ordinary-condition-fixed-inertial-characters, L7/ordinary-fixed-inertial-characters-smoothness, L7/semistable-ordinary-quotient, L7/g-valued-ordinary-*, L7/snowden-ordinary-ring-trivial-residual, L7/ordinary-ring-with-frobenius-eigenvalue, L7/eigenvalue-ring-normal-cm-type-three, L7/gl2-borel-ordinary-ring), with L8/ordinary-coefficient-ring moved into it (it is the coefficient ring of the flag scheme; L8 keeps the determinant-ordinary side); L7d 'GSp₄ ordinary conditions' (L7/gsp4-*); L7e 'Components: connects, local models and GL₃ labelling' (L7/connects-relation, L7/weight-zero-crystalline-connectedness, L7/local-model-rho-nm0, L7/kisin-modules-tame-descent, L7/semisimple-kisin-modules-and-shapes, L7/gl3-*).
- **rescope** (LocalGaloisDeformationRings, PotentialAutomorphyInfrastructure, DeformationAndDerivedPatchingAlgebra). Red-team finding RT-AREA-langlands-2/22: L7's text sends the ACC+ §6.2 local comparisons and component-support input to DeformationAndDerivedPatchingAlgebra P9, which is algebra-only; the arithmetic consumer is PotentialAutomorphyInfrastructure PA.3. *Proposal:* In L7's text replace 'DeformationAndDerivedPatchingAlgebra P9' by 'PotentialAutomorphyInfrastructure PA.3', and add the atlas links LocalGaloisDeformationRings:L7 → PotentialAutomorphyInfrastructure:PA.3, LocalGaloisDeformationRings:L8 → PotentialAutomorphyInfrastructure:PA.3 and GlobalGaloisDeformations:G8 → PotentialAutomorphyInfrastructure:PA.3 (acyclic: PA.3's only descendant is PA.4). The packet's uses already name PA.3.
- **rescope** (LocalGaloisDeformationRings, PadicHodgeTheory, OrdinaryAutomorphicFormsAndModularityLifting). Red-team findings RT-AREA-langlands-2/17 and /31: KW II Lemma 3.5, including the Berger–Li–Zhu weight-(p + 1) case, is needed by R08.5 but owned by OrdinaryAutomorphicFormsAndModularityLifting R21.5, which is downstream of R08.5. *Proposal:* Make PadicHodgeTheory R06.4 the single owner of KW II Lemma 3.5 (requested in this packet), add the atlas link PadicHodgeTheory:R06.4 → LocalGaloisDeformationRings:R08.5, have R21.5 import it and keep only Skinner–Wiles' global p = 3 branch; correct the RS-06 and RS-08 owner records accordingly.
- **rescope** (LocalGaloisDeformationRings, AutomorphicGaloisRepresentations). Red-team finding RT-AREA-langlands-2/14: Kisin's corollary on local–global compatibility at p for all parallel weight ≥ 2 Hilbert eigenforms needs Kisin's Theorems (2.5.5) and (2.7.6) in families, which R08.3 now exports as R08.3/pst-quotient-in-families. *Proposal:* Add the atlas link LocalGaloisDeformationRings:R08.3 → AutomorphicGaloisRepresentations:R19.5 (acyclic) and a node in R19.5 for Kisin's Corollary with prerequisites Taylor's interpolation (R19.2) and R08.3/pst-quotient-in-families. Also add the atlas link ClassFieldTheory Layer 5 → LocalGaloisDeformationRings:R08.1 (finding /16), whose declarations every R08 dimension node now lists.
- **rescope** (AlgebraicModuliForArithmeticGeometry, LocalGaloisDeformationRings, HilbertModularVarietiesAndShimuraCurves). Pappas–Rapoport's local models for Res_{K/ℚ_p} GL_d (Local models in the ramified case I, J. Algebraic Geom. 12 (2003), 5.3, 5.8, 5.10) are planned nowhere. They give the naive local model M_r inside a Grassmannian over 𝒪_K ⊗ 𝒪_E, its flat closure M^loc_r (normal and Cohen–Macaulay, with reduced special fibre equal to the closure of the stratum of the dual partition), and M^loc_r = M_r when the r_φ differ by at most 1 and r ≤ e or e ≤ 2. Kisin's resolution of flat and potentially Barsotti–Tate deformation rings uses them (R08.4/resolution-local-structure, R08.5/rank-two-connected-components, R08.5/rank-two-type-v), and so does the Deligne–Pappas/Pappas–Rapoport integral model of Hilbert modular varieties at ramified p (HilbertModularVarietiesAndShimuraCurves H2). They are general algebraic geometry of Grassmannians and affine Schubert varieties, so neither consumer is the right owner. *Proposal:* Create 'Algebraic moduli for arithmetic geometry, Part II: local models for Weil restrictions of GL_d' after R09.1 (Grassmannians), owning the naive and flat local models of Res_{K/ℚ_p} GL_d with the theorems above and the normality of the relevant affine Schubert varieties in positive characteristic (Faltings, Pappas–Rapoport §5). LocalGaloisDeformationRings R08.4 and R08.5 and HilbertModularVarietiesAndShimuraCurves H2 import it. Until it exists, the packet records the input as a gap.
- **rescope** (FiniteFlatGroupsAndIntegralPadicHodgeTheory, LocalGaloisDeformationRings). Caraiani–Emerton–Gee–Savitt, 'Components of moduli stacks of two-dimensional Galois representations', Theorem 1.3: the special fibres of potentially Barsotti–Tate lifting rings of ρ̄ : G_K → GL₂(k) are generically reduced. Its proof uses the Emerton–Gee stacks of (φ, Γ)-modules and the stacks of Breuil–Kisin modules with tame descent data, which no roadmap plans. Caraiani–Newton Lemma 5.3.3 (R08.4/bt-ring-unique-generalisation) needs it. *Proposal:* Create 'Finite flat groups and integral p-adic Hodge theory, Part II: moduli stacks of Breuil–Kisin modules and (φ, Γ)-modules' after R07.4, owning the Emerton–Gee stacks in rank two with tame descent data, their irreducible components and the generic reducedness of potentially Barsotti–Tate lifting rings (CEGS Theorem 1.3). R08.4/bt-ring-unique-generalisation imports it; until then the packet records it as a gap.

## Red-team findings handled in this plan

- **RT-AREA-langlands-2/14** (Kisin's corollary at p): R08.3 exports Theorems (2.5.5), (2.7.6), (2.7.7) for a representation over an arbitrary complete local base, `R08.3/pst-quotient-in-families`; the link R08.3 → AutomorphicGaloisRepresentations R19.5 and the R19.5 node are proposed in the restructure record.
- **RT-AREA-langlands-2/16** (local duality): every dimension and smoothness node of R08.1–R08.6 and L7 lists Tau Ceti ClassFieldTheory Layer 5 as a prerequisite and names `tateDualityPairing_perfect_mixed` and `eulerCharacteristic_finrank_fp` in its proof outline, including the analogue of KW II Lemma 3.7 (`R08.4/finite-cocycles-kummer`); the request asks for the atlas link Layer 5 → R08.1.
- **RT-AREA-langlands-2/17** (Berger–Li–Zhu): R08.5 imports KW II Lemma 3.5, including the weight-(p + 1) case, from PadicHodgeTheory R06.4 through a request (`R08.5/weight-p-plus-one-ordinary-ring`, `R08.5/weight-p-crystalline-ordinarity`), and the restructure record proposes R06.4 as the single owner with the link R06.4 → R08.5.
- **RT-AREA-langlands-2/18** (duplicate potentially semistable rings): R08.3 owns them in every rank (`R08.3/pst-deformation-ring` states Kisin's Theorem 2.7.6, Corollary 2.7.7 and the reduced flat closure for any d); L7 keeps lattice moduli, the Fontaine–Laffaille condition, ordinary and component theory; the owners entry and the corrected R08.3 text are in the restructure record. L7 and R08.5 no longer declare the integral categories themselves: `L7/finite-height-lattices`, `L7/fontaine-laffaille-deformation-condition`, `L7/kisin-modules-tame-descent` and `R08.5/connected-kisin-modules-with-coefficients` are deformation-theoretic wrappers around FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3 and R07.4.
- **RT-AREA-langlands-2/22** (P9 versus PA.3): the uses of L7's and L8's ACC+ §6.2 nodes name PotentialAutomorphyInfrastructure PA.3, and the restructure record proposes the corrected L7 text and the links L7, L8, G8 → PA.3.

## Sources

- **GEE-MLT-2022**: Toby Gee, *Modularity lifting theorems*, Essential Number Theory 1 (2022), no. 1, 73–126; arXiv:2202.05818v2 (17 October 2022), 45 pages. The arXiv version was read; printed page = PDF page.. <https://arxiv.org/pdf/2202.05818v2> Read: §3.1–3.19, pp. 11–15; §3.27–3.28 (local deformation rings with l = p), pp. 18–19; §3.29–3.38 (ℓ ≠ p, n = 2), pp. 19–21
- **KISIN-LECTURES**: Mark Kisin, *Lectures on deformations of Galois representations (Lecture 1)*, Lecture notes on the author's Harvard page, 4 pages.. <https://people.math.harvard.edu/~kisin/notes/notes.pdf> Read: Lecture 1, pp. 1–4
- **TUNG-2021**: Shen-Ning Tung, *On the modularity of 2-adic potentially semi-stable deformation rings*, Mathematische Zeitschrift 298 (2021), 107–159; arXiv:1908.06174v3, 41 pages. The arXiv version was read.. <https://arxiv.org/pdf/1908.06174v3> Read: §3.2.5 Odd deformations, Proposition 3.2.7, and §3.2.6, Lemma 3.2.8, p. 15
- **CHT08**: Laurent Clozel, Michael Harris and Richard Taylor, *Automorphy for some l-adic lifts of automorphic mod l Galois representations*, Publications mathématiques de l'IHÉS 108 (2008), 1–181; open access on Numdam. Printed page = PDF page.. <https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf> Read: §2.4.3 Unrestricted deformations, Lemma 2.4.9, p. 40; §2.4.4 Minimal deformations, Lemmas 2.4.10–2.4.22, pp. 41–47; §2.4.1 Crystalline (Fontaine–Laffaille) deformations, Lemmas 2.4.1–2.4.5, pp. 33–37 (checkpoint 7, on the page images); §2.4.2 Ordinary deformations, Lemmas 2.4.6–2.4.8, pp. 37–40 (checkpoint 7); §2.4.5 Discrete series deformations, Lemmas 2.4.22–2.4.30, pp. 47–53 (checkpoint 7)
- **TAYLOR-II-2008**: Richard Taylor, *Automorphy for some l-adic lifts of automorphic mod l Galois representations. II*, Publications mathématiques de l'IHÉS 108 (2008), 183–239; open access on Numdam. Printed page = PDF page + 182.. <https://www.numdam.org/item/10.1007/s10240-008-0015-2.pdf> Read: §3, the deformation problems D^{(χ)}, D^{Stein} and Proposition 3.1, p. 196
- **KISIN-PST-2008**: Mark Kisin, *Potentially semi-stable deformation rings*, J. Amer. Math. Soc. 21 (2008), no. 2, 513–546 (electronically published 20 September 2007); the AMS PDF, freely downloadable from ams.org, was read. Printed page = PDF page + 512. It ends with 'Errata for [Ki 2]' (pp. 544–545), corrections to Kisin, Crystalline representations and F-crystals (2006). Independent review 2026-10-07: Author DVI; published locators correspond to author page plus 512. AMS PDF returned HTTP 403; the published PDF was not independently read in this review.. <https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf> Read: Introduction, pp. 513–516; §1 Representations of finite E-height, (1.1)–(1.7), pp. 516–522; §2.5–2.7, pp. 529–534 (§2.1–2.4 skimmed: Proposition 2.4.7 and Lemma 2.4.6 read); §3 The local structure of potentially semi-stable deformation rings, pp. 535–541; Errata for [Ki 2], pp. 544–545
- **KW2-2009**: Chandrashekhar Khare and Jean-Pierre Wintenberger, *Serre's modularity conjecture (II)*, Authors' final version (PDF dated 30 May 2009), 98 pages, on Khare's UCLA page; published as Invent. Math. 178 (2009), 505–586. Printed page = PDF page; the numbering is the published one.. <https://www.math.ucla.edu/~shekhar/papers/proofs.pdf> Read: §2.3 Proposition 2.2 and Corollary 2.3, pp. 8–10; §2.8 smooth resolutions and Proposition 2.12, pp. 16–18; §3 (Theorem 3.1, Propositions 3.2, 3.3, 3.6, Definition 3.4, Lemmas 3.5, 3.7–3.9, §§3.2.2–3.2.7, 3.3.1–3.3.4), pp. 18–37
- **KISIN-FFLAT-2009**: Mark Kisin, *Moduli of finite flat group schemes, and modularity*, Author's preprint as a DVI file on Kisin's Harvard page (TeX output dated 21 October 2008), read through a text extraction of the DVI; printed page = DVI page (the preprint's own numbering). Published as Ann. of Math. 170 (2009), 1085–1180.. <https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi> Read: §2.1, (2.1.1)–(2.1.14) with proofs, pp. 16–22; §2.2, (2.2.1)–(2.2.5) and the statement of (2.2.8), pp. 22–24; §2.3, (2.3.8)–(2.3.11), pp. 32–33; §2.4, (2.4.1)–(2.4.19), pp. 34–41; §2.5, (2.5.1)–(2.5.5), the statement and the end of the proof of (2.5.6), (2.5.15) and (2.5.16), pp. 41–49; References, pp. 78–80
- **SAVITT-2005**: David Savitt, *On a conjecture of Conrad, Diamond, and Taylor*, arXiv:math/0404327v3 (15 September 2010), 45 pages; published in Duke Math. J. 128 (2005). The arXiv v3 fixes an error of the published version (its Remark 1.7) and keeps the published numbering. Printed page = PDF page.. <https://arxiv.org/pdf/math/0404327v3> Read: §1, Conjecture 1.1, Theorems 1.2–1.3 and Remark 1.7, pp. 1–4; §6.6, Theorems 6.22–6.24 and the start of their proof, pp. 41–43
- **ACC-POTENTIAL-AUTOMORPHY-CM-2023**: Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, *Potential automorphy over CM fields*, arXiv:1812.09999v2, 218 pages; published in Ann. of Math. (2) 197 (2023), no. 3, 897–1113. Page numbers are those of the arXiv v2 PDF (printed page = PDF page).. <https://arxiv.org/pdf/1812.09999v2> Read: 2026-09-28 (cc-39fac3, checkpoint 6): §6.2.5–6.2.6 (ordinary deformations: Λ_v, 𝒢_v, R^△_v, R^{det,ord}_v, Lemma 6.2.9, Proposition 6.2.10, Lemma 6.2.11, Proposition 6.2.12 with proof), pp. 137–141; the bibliography entries [Ger19], [Tho15], [CS19a].
- **SKINNER-WILES-1999**: C. M. Skinner and A. J. Wiles, *Residually reducible representations and modular forms*, Publications mathématiques de l'IHÉS 89 (1999), 5–126, DOI 10.1007/BF02698855; Numdam open-access scan (OCR text layer; printed page = PDF page + 3).. <http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf> Read: 2026-09-28 (cc-39fac3, checkpoint 6): §2.1, Lemma 2.2 and Corollary 2.3 with proofs, pp. 11–13, read on the page images.
- **KISIN-2ADIC-2009**: Mark Kisin, *Modularity of 2-adic Barsotti–Tate representations*, Author's preprint as a DVI file on Kisin's Harvard page (TeX output dated 21 October 2008), read through a text extraction of the DVI; printed page = DVI page. Published in Invent. Math. 178 (2009) (the published version was not compared).. <https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi> Read: Introduction (Theorem 0.1), and §2 in full: (2.1.1)–(2.1.13), (2.2.1)–(2.2.7), (2.3.1)–(2.3.13), (2.4.1)–(2.4.6), (2.5.1)–(2.5.6), pp. 1–2 and 19–35.
- **BIP-2023**: Gebhard Böckle, Ashwin Iyengar, Vytautas Paškūnas, *On local Galois deformation rings*, Forum of Mathematics, Pi 11 (2023), e30; Corrigendum, Forum Math. Pi 12 (2024), e5; read in arXiv:2110.01638v2 (22 August 2023), sha256 b48dad0a42d8cacea0a4ae80d5f3a5e89c3a13bf2e03beb8527081422b5853c4, accessed 2026-10-07. <https://arxiv.org/abs/2110.01638> Read: §3.5 (Proposition 3.33); §3.7 (Proposition 3.41, Corollary 3.42, Remark 3.43); §4 (Lemma 4.1, Remark 4.4); §5 (the functor 𝒳, Proposition 5.1, Corollary 5.2, Lemma 5.3)
- **PQ-2026**: Vytautas Paškūnas, Julian Quast, *On local Galois deformation rings: generalised reductive groups*, Forum of Mathematics, Pi 14 (2026), e15; read in arXiv:2404.14622v2 (9 January 2026), sha256 eaa8fba90704e412df15917bfb6496f6b8d36c605af2570413ff55876842ed7c, accessed 2026-10-07. <https://arxiv.org/abs/2404.14622> Read: §3 (Lemmas 3.1–3.5, Proposition 3.6, Corollary 3.8, Lemmas 3.10–3.11); §3.1 (Corollary 3.12, Proposition 3.13)
- **CG-2018**: Frank Calegari, David Geraghty, *Modularity lifting beyond the Taylor–Wiles method*, Inventiones Math. 211 (2018), 297–433; Correction, Invent. Math. 227 (2022), 855–856; read in arXiv:1207.4224v2 (the accepted version), sha256 67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb, accessed 2026-10-07; locators are the published pages as recorded by the reviewed extraction PAPER-CALEGARI-GERAGHTY-18. <https://arxiv.org/abs/1207.4224> Read: §3.7 (Theorem 3.19, Definitions 3.20–3.21, Lemma 3.22 and its proof); §4.1 (Theorem 4.3, Lemmas 4.5–4.7, Lemma 4.11 with its proof and footnote 5); §8.5.1
- **BCGP-2021**: George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, *Abelian surfaces over totally real fields are potentially modular*, Publ. Math. IHÉS 134 (2021), 153–501; read in arXiv:1812.09269v3 (final version, 28 November 2021), sha256 7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed, accessed 2026-10-07; locators are arXiv v3 pages. <https://arxiv.org/abs/1812.09269> Read: §7.1 (Definition 7.1.2, the paragraph after it, Lemma 7.1.3); §7.3 (Definition 7.3.1 to Lemma 7.3.18); §7.4 (Proposition 7.4.2 to Proposition 7.4.21)
- **BHS-2019**: Christophe Breuil, Eugen Hellmann, Benjamin Schraen, *A local model for the trianguline variety and applications*, Publ. Math. IHÉS 130 (2019), 299–412; read in arXiv:1702.02192, sha256 4c967337f4bc84d96043ccb9c90e68b4ed0edc63dbd3b4b68cd36c848dbcf961, accessed 2026-10-07. <https://arxiv.org/abs/1702.02192> Read: §3.6 with (3.27)–(3.28) and Remark 3.6.1
- **DING-2025**: Yiwen Ding, *p-adic Hodge parameters in the crystabelline representations of GL_n*, Publ. Math. IHÉS 142 (2025), 1–74; read in arXiv:2407.21237, sha256 a78c956df48fcc0757d4612d825118723367ee2d64abc30f77c607de7b2c39e8, accessed 2026-10-07. <https://arxiv.org/abs/2407.21237> Read: §3.2.2 (the rings R_D, R_{D,w}, R_{D,g}, R_δ); §4.1 (the trianguline variety, as consumed)
- **LTXZZ-2022**: Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*, Inventiones Math. 228 (2022), 107–375; read in arXiv:1912.11942v3, accessed 2026-10-07; locators are the published numbering recorded by the reviewed extraction PAPER-LIU-ETAL-22 (arXiv v3 numbers the rigidity definition 6.3.4). <https://arxiv.org/abs/1912.11942> Read: §6.3 (the rigidity definition); §6.4 (the rings R^mix, R^unr, R^ram and the local model at 𝔭)
- **LTXZZ-RIGID-2021**: Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang, Xinwen Zhu, *Deformation of rigid conjugate self-dual Galois representations*, arXiv:2108.06998v1 (2021), the companion [51] of LTXZZ 2022; accessed 2026-10-07. <https://arxiv.org/abs/2108.06998> Read: §3.3 (Definition 3.3.1); §3.4 (Definition 3.4.8, Proposition 3.4.12); §3.5 (Definition 3.5.1, Proposition 3.5.2 and its proof)
- **NT-2026**: James Newton, Jack A. Thorne, *Symmetric power functoriality for Hilbert modular forms*, Annals of Math. 203 (2026), no. 1; read in arXiv:2212.03595v2, accessed 2026-10-07. <https://arxiv.org/abs/2212.03595> Read: §2 (Definition 2.5); §3 (Lemma 3.1, Lemma 3.6 with its proof, Lemma 3.8 and its proof); §4 (the local quotients after Theorem 4.1, Lemma 4.2); §5 (proof of Theorem 5.9)
- **CG-2020**: Frank Calegari, David Geraghty; appendix by Frank Calegari, David Geraghty, Michael Harris, *Minimal modularity lifting for nonregular symplectic representations*, Duke Math. J. 169 (2020), no. 5, 801–896; read in arXiv:1907.08691v1 and the appendix arXiv:1907.08694v1, accessed 2026-10-07; locators are published pages as recorded by the reviewed extraction PAPER-CALEGARI-GERAGHTY-20. <https://arxiv.org/abs/1907.08691> Read: §4 (Assumption 4.3, Remark 4.4, Definition 4.6, Remark 4.7, Lemma 4.8 and its proof); Appendix §A.4
- **FKP-2022**: Najmuddin Fakhruddin, Chandrashekhar Khare, Stefan Patrikis, *Lifting and automorphy of reducible mod p Galois representations over global fields*, Inventiones Math. 228 (2022), 415–492; read in arXiv:2008.12593v5 (final version), sha256 6c260021acef4649492892fc266f703aa69401879bf87e1c2492bf2ef24ff1e2 as recorded by the extraction, accessed 2026-10-07. <https://arxiv.org/abs/2008.12593> Read: §2 (local lifting rings in equal characteristic); §5 (Theorem 5.2); §7 (Lemma 7.2); §8 (proof of Theorem 8.1); §9 (proof of Proposition 9.1); Appendix B (Definition B.2, Lemmas B.3–B.4)
- **BCGP-2025**: George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, *Modularity theorems for abelian surfaces*, arXiv:2502.20645v1 (2025), sha256 51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c, accessed 2026-10-07. <https://arxiv.org/abs/2502.20645v1> Read: §1.8.10; §5.4–5.6 (local deformation problems, Lemmas 5.6.2–5.6.3, Propositions 5.6.4, 5.6.6, Remark 5.6.7, Definition 5.6.8); §6.1–6.2 (fixed-similitude lifts, Lemma 6.1.6, ordinary GSp₄ rings, 6.2.1–6.2.6); §7.5.2
- **KISIN-PST-2008-AMS**: Mark Kisin, *Potentially semi-stable deformation rings*, J. Amer. Math. Soc. 21 (2008), 513–546; the AMS open-access PDF, sha256 3e70d1f74f1c396d4c520f8f127c18556221139f02a69babc25cfdd50b885556, re-read 2026-10-07 for (2.5.5), (2.7.5)–(2.7.7) in families Independent review 2026-10-07: Same author DVI as KISIN-PST-2008; families theorems checked there. AMS PDF returned HTTP 403.. <https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/> Read: Introduction (the Corollary on Hilbert modular forms); (2.1), (2.5.5); (2.7.5)–(2.7.7)
- **CDN-2023**: Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, *Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*, Forum of Mathematics, Pi 11 (2023), e16; read in arXiv:2204.11214, sha256 c5711666b845a48f6fc2cd944b22bbde0c45567fe29dacb00a3429619baecbee, accessed 2026-10-07. <https://arxiv.org/abs/2204.11214> Read: §0.1; §5.2 (the ring R_{B,M}, Théorème 5.11, Lemme 5.12)
- **BCDT-2001**: Christophe Breuil, Brian Conrad, Fred Diamond, Richard Taylor, *On the modularity of elliptic curves over Q: wild 3-adic exercises*, J. Amer. Math. Soc. 14 (2001), 843–939; the AMS open-access PDF, sha256 1e34130e55a0ef39d7ef2566cc7d518e2b69048dece36328a0b6530e92044cf2, accessed 2026-10-07 Independent review 2026-10-07: Author manuscript. §1.1 and Conjecture 1.1.1 are on author pp.7–8; §4.3 on author pp.27–28. Published page locators were not independently compared.. <https://www.ams.org/journals/jams/2001-14-04/S0894-0347-01-00370-8/> Read: §1.1 (ℓ-types, R^D, weakly of type, Conjecture 1.1.1); §4.3 (the categories S and the functors D^S)
- **CN-2023**: Ana Caraiani, James Newton, *On the modularity of elliptic curves over imaginary quadratic fields*, arXiv:2301.10509v3, sha256 57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3, accessed 2026-10-07. <https://arxiv.org/abs/2301.10509v3> Read: §3.3 (Definition 3.3.1, Lemma 3.3.2, Theorem 3.3.3, §3.3.5, Lemma 3.3.6); §5.3 (Proposition 5.3.2, Lemmas 5.3.3–5.3.4)
- **KW1-2009**: Chandrashekhar Khare, Jean-Pierre Wintenberger, *Serre's modularity conjecture (I)*, Inventiones Math. 178 (2009), 485–504; the authors' copy results.pdf on Khare's UCLA page, accessed 2026-10-07. <https://www.math.ucla.edu/~shekhar/papers/results.pdf> Read: §4 (Theorem 4.1); §5 (minimal lifts, Theorem 5.1 and the remarks after it)
- **BLGGT-2014**: Thomas Barnet-Lamb, Toby Gee, David Geraghty, Richard Taylor, *Potential automorphy and change of weight*, Annals of Math. 179 (2014), 501–609; read in arXiv:1010.2561v4, sha256 c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24, accessed 2026-10-07. <https://arxiv.org/abs/1010.2561> Read: §1.3 (local theory, l ≠ p: Lemmas 1.3.2, 1.3.4); §1.4 (local theory, l = p: connects and its properties)
- **BCGNT-2025**: George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, Forum of Mathematics, Pi 13 (2025), e10; read in arXiv:2309.15880, sha256 0ad015dfe35d40489a2b8b462ac93d5dd715dbbae7d3fbf18377beaed654579d, accessed 2026-10-07. <https://arxiv.org/abs/2309.15880> Read: §3.2 (Theorem 3.2.1, Remark 3.2.2); §5.1 (Definition 5.1.1, Lemmas 5.1.3–5.1.5); §6.2 (proof of Proposition 6.2.3)
- **BCG-2025**: George Boxer, Frank Calegari, Toby Gee, *Cuspidal cohomology classes for GL_n(Z)*, J. Amer. Math. Soc. 38 (2025), 509–520; read in arXiv:2309.15944v3, sha256 abfa9eac9984aa5d0bd5e1700a08993bc3baa6f8435d18f5f0e37f5a84769684, accessed 2026-10-07. <https://arxiv.org/abs/2309.15944> Read: proof of Theorem 2.1 (FKP Lemma B.4 as used); proof of Theorem 3.1 (connects)
- **LLHLM-2020**: Daniel Le, Bao V. Le Hung, Brandon Levin, Stefano Morra, *Serre weights and Breuil's lattice conjecture in dimension three*, Forum of Mathematics, Pi 8 (2020), e5; read in arXiv:1608.06570v4, sha256 cceae9f59d4c8af0a265726c6a35583959b0e1cb0451043ff79170a1def432bd, accessed 2026-10-07; locators follow the reviewed extraction PAPER-LE-LEHUNG-LEVIN-ETAL-20 (published pages). <https://arxiv.org/abs/1608.06570> Read: §3.1 (Definitions 3.1.3, 3.1.6); §3.2 (Propositions 3.2.1–3.2.2, Lemma 3.2.3); §3.3 (Definitions 3.3.1–3.3.7, Propositions 3.3.5–3.3.9, Lemma 3.3.10, Theorems 3.3.11–3.3.12); §3.5 (Theorem 3.5.3, Lemma 3.5.4); §3.6 (Proposition 3.6.1, diagram (3.9), Proposition 3.6.3, Theorem 3.6.4, Lemma 3.6.6, Corollary 3.6.7, Propositions 3.6.9, Lemma 3.6.10, Tables 3–4)
- **CT-2017**: Laurent Clozel, Jack A. Thorne, *Level-raising and symmetric power functoriality, III*, Duke Math. J. 166 (2017), 325–402; read in the accepted manuscript lrspiii.pdf on Thorne's Cambridge page, sha256 a3fa46fcdebdc1a41a54e8b5a9be22173e9f9f87261c51b1e7a7f29cfada3659, accessed 2026-10-07. <https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf> Read: §5.1 (the local deformation problems, the rings R^m_v, Lemma 5.2 and its proof)
- **SHOTTON-2018**: Jack Shotton, *Jack Shotton, Generic local deformation rings when ℓ≠p, Duke Mathematical Journal 167 (2018), author preprint v2*, Duke Mathematical Journal 167 (2018); author preprint arXiv:1608.01784v2.. <https://arxiv.org/pdf/1608.01784v2> Read: Definition 3.5; Proposition 3.6
- **THORNE-2015**: Jack Thorne, *Jack Thorne, Automorphy lifting for residually reducible l-adic Galois representations, JAMS 28 (2015), accepted author manuscript*, J. Amer. Math. Soc. 28 (2015); publicly available accepted author manuscript, 16 April 2014.. <https://www.repository.cam.ac.uk/bitstreams/5b8962a1-6a0e-4d17-b5ae-b478575e1a0c/download> Read: §3.3.2, Lemmas 3.11–3.13 and Proposition 3.14; §3.3.3–3.3.4, Propositions 3.15–3.17
- **GERAGHTY-2019**: David Geraghty, *Modularity lifting theorems for ordinary Galois representations*, Math. Ann. 373 (2019), 1341–1427. The published text could not be obtained (publisher bot wall; author pages 403/404). Read in the author's preprint of 12 March 2010 (69 pp.), whose three-level numbering is converted to the published two-level numbering by a concordance checked against citations in Thorne 2015, ACC+, Newton–Thorne, BCGNT and Allen–Khare–Thorne: published Lemma 2.32 = preprint 2.7.7, Lemma 3.3 = 3.1.3, Lemma 3.5 = 3.2.1, Corollary 3.6 = 3.2.2, Lemma 3.7 = 3.2.3, Definition 3.8 = 3.3.1, Lemma 3.9 = 3.3.2, Lemma 3.10 = 3.3.3, Lemma 3.13 = 3.4.2, Lemma 3.14 = 3.4.3. Locators give both; excerpts are preprint text.. <https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.167.6526&rep=rep1&type=pdf> Read: §2.7 (preprint Lemma 2.7.7 = published Lemma 2.32); §3.1–3.4 (preprint Lemmas 3.1.2–3.4.3, Corollary 3.2.2, Definition 3.3.1, Remark 3.4.4)
- **BOOHER-2019**: Jeremy Booher, *Minimally ramified deformations when ℓ ≠ p*, Compositio Math. 155 (2019), 1–37; read in arXiv:1807.10743v1 (the only arXiv version, post-refereeing); the published numbering was not compared.. <https://arxiv.org/pdf/1807.10743> Read: §1.2 (standing assumptions (A1)–(A4)); §2 (Example 2.4, Definition 2.5); §3 (Definition 3.9, Lemma 3.11, Remark 3.14); §5.2 (Definition 5.4, Proposition 5.6, Corollary 5.8); §6 (Definition 6.14, Proposition 6.15, Corollary 6.16); Theorem 1.1
- **DOTTO-2025**: Andrea Dotto, *Breuil–Mézard conjectures for central division algebras*, Algebra & Number Theory 19 (2025), no. 2, 213–247 (the published PDF, freely available; journal page = PDF page + 211); arXiv:1808.06851v3 has the same numbering. Newton–Thorne cite the 2018 preprint as [Dot18].. <https://msp.org/ant/2025/19-2/ant-v19-n2-p01-s.pdf> Read: §3 (K-types for D^×, Example 3.8); §4 (inertial types, Lemma 4.2, Remark 4.3); §5 (Lemma 5.1, Definition 5.2, Theorems 5.3, 5.5, Lemma 5.4); §6 (Theorem 6.1, Remark 6.2, the case ℓ ≠ p and Theorem 6.3 with its proof)

## Mistakes found in the sources

- **E1 (error, Theorem 6.12(4), in the published version (Duke Math. J. 128 (2005)); read through Remark 1.7 of arXiv v3, p. 4).** Printed: The mistake is in the statement and proof of Theorem 6.12(4) of the published version. … if m = 1 + (p + 1)j — i.e., if i = 1 — then the two characters ωm+p 2 and ωpm+1 2 are both characters of niveau one, and are equal. Correction: When i = 1 the reduction mod p of the lattice considered in Theorem 6.12(4) is split, not of niveau two; one more family of strongly divisible modules is needed, constructed in arXiv v3. The main theorems (6.22–6.24) are unaffected. Reason: The two fundamental characters of level two named in 6.12(4) coincide and have niveau one when i = 1, so the niveau-two conclusion cannot hold there (the author's Remark 1.7).
- **E2 (error, §2.4.2, condition 2 on the characters χ_{v,i}, p. 37, against the proofs of Lemmas 2.4.7 and 2.4.8, pp. 39–40 (read on the page images)).** Printed: 2. If χ̄_{v,i} denotes the reduction of χ_{v,i} modulo λ then for i < j the ratio χ̄_{v,i}/χ̄_{v,j} is neither trivial nor the cyclotomic character. Correction: For i < j the ratio χ̄_{v,j}/χ̄_{v,i} is neither trivial nor the cyclotomic character (equivalently χ̄_{v,i}/χ̄_{v,j} ≠ 1, ε̄^{−1}). Reason: The proof of Lemma 2.4.7 needs H⁰(G, Hom_k(Fil^{i+1}r̄, gr^i r̄)(1)) = 0 and states it holds 'because, for j > i, χ̄_{v,i}ε/χ̄_{v,j} ≠ 1'; the proof of Lemma 2.4.8 needs H²(G, χ̄_{v,0}^{−1}r̄′) = 0. Both are χ̄_{v,j}/χ̄_{v,i} ≠ ε̄ for i < j, which the printed condition does not give. Counterexample to the printed version: n = 2, F_ṽ = ℚ_l, l > 3, r̄ = ω ⊕ 1 with the ω-line as Fil¹ (χ_{v,1} = ε, χ_{v,0} = 1). Then χ̄_{v,0}/χ̄_{v,1} = ω^{−1} is neither trivial nor cyclotomic, but H²(G_{ℚ_l}, k(ω)) ≅ H⁰(G_{ℚ_l}, k)^∨ ≠ 0; the suitable lifts to B₂(k[ε]/(ε²)) form a space of dimension 1 + 1 + 3 = 5 rather than n(n + 1)/2 + [F_ṽ : ℚ_l]n(n − 1)/2 = 4 (the fibre of Z¹ has dimension (n − 1) + [F_ṽ : ℚ_l](n − 1) + dim H² = 3), so dim_k L_v − dim_k H⁰(ad r̄) = 2 and R^{loc}/𝓘 is not a power series ring in 5 variables. This is the familiar non-smoothness of ordinary weight-two deformations when the sub-character is the cyclotomic character times the quotient; the section is not used by CHT's applications.
- **E3 (error, arXiv:2202.05818v2, §3.30 and paragraph after Theorem 3.31, pp.19–20).** Printed: factors through R□ρ,χ,τ if and only if ... has inertial Weil–Deligne type τ Correction: For the full type retaining N, use the reduced flat closure of exact-type points; the reverse implication is valid only on the appropriate nondegenerate locus, not at all boundary points. Reason: Take p odd and q≡1 mod p, determinant q, ρ_c(φ)=diag(q,1), ρ_c(t)=(1 c;0 1), with c=pt over 𝒪[[t]]. Arithmetic Frobenius satisfies φtφ⁻¹=t^q. For c≠0 the type is Steinberg with N≠0; at c=0 it has N=0. A closed quotient containing the dense nonzero-c locus contains c=0 too. Gee §3.30 retains N, so forgetting N cannot resolve the iff as printed. Shotton Definition 3.5 uses the Zariski closure; BLGGT 1.3.4(2) requires points on unique components.
- **E4 (gap, proof of Lemma 6.2.5, arXiv:2502.20645v1 p. 145).** Printed: We claim that the formal completions of Gvflat at k′-points for k′/k finite are formally smooth. By a standard tangent-obstruction calculation as in Lemma 6.2.2 this amounts to the vanishing of H2flat(Fil0 ad0 ρ) (cf. the proof of [Kis09, Prop. 2.4.4]). Correction: The vanishing of the flat obstruction space H²_flat(Fil⁰ad⁰ρ̄) for the rank-four symplectic flag problem is a separate step: a dévissage along the graded pieces 1, 1, χ̄₁χ̄₂⁻¹, χ̄₁²ε̄, χ̄₂²ε̄, χ̄₁χ̄₂ε̄ of Fil⁰ad⁰ρ̄, using right exactness of the unramified H¹ and of the finite flat H¹_f (Kisin's 2-adic Lemma 2.4.2) on each piece. The packet plans it as L7/gsp4-flat-ordinary-smoothness. Also, the module written ρ should be the residual ρ̄. Reason: Lemma 6.2.2 computes tangent spaces of G_v on the generic fibre, where no flat condition is imposed, and Kisin's Proposition 2.4.4 treats a line in a rank-two representation. Neither covers the rank-four symplectic flag with the finite flat condition. The irreducibility of R^{△,flat}_v and the independence statement of Lemma 6.2.5 rest on this formal smoothness.
- **E5 (misprint, Theorem 6.3, Algebra Number Theory 19 (2025) p. 244; arXiv:1808.06851v3, Theorem 6.3).** Printed: Theorem 6.3 (Breuil–Mézard conjecture for D×, case ℓ ≠ p). Assume p ≠ 2. Correction: Assume ℓ ≠ 2, i.e. that the characteristic of the coefficients is odd (p remains the residue characteristic of F and is unrestricted). Reason: In §6 Dotto takes F/ℚ_p and coefficients E/ℚ_ℓ. The proof's only input with a parity hypothesis is Shotton's Theorem 4.6, which is stated for F/ℚ_p and a coefficient field of characteristic l and assumes l > 2. Shotton's l is Dotto's ℓ, not his p. Theorem 5.5, the other input, has no parity hypothesis. The hypothesis as printed would wrongly exclude 2-adic fields F and would admit coefficients of characteristic 2, where Shotton's theorem is not available.
- **E6 (misprint, §6, definition of cyc_{D^×} before Theorem 6.3, Algebra Number Theory 19 (2025) p. 244).** Printed: cyc_{D×} : R_E(O×_D) → Z^d(R□_ρ), σ ↦ Σ_{τ,N} dim Hom_{Qℓ[GLn(OF)]}(σ∨ ⊗_E Qℓ, JL−1(π_{τ,N}))[R□_ρ(τ, N)] Correction: The Hom is over ℚ̄_ℓ[𝒪_D^×]: σ is a representation of 𝒪_D^× and JL^{−1}(π_{τ,N}) a representation of D^×. Reason: σ is a representation of 𝒪_D^×, and the proof on p. 244 uses dim Hom_{ℚ̄_ℓ[𝒪_D^×]}(σ, JL^{−1}(π_{τ,N})).

The plan also uses corrected statements for mistakes that the reviewed paper extractions recorded in the sources added to this roadmap; each is cited in the hypotheses of the node concerned: Calegari–Geraghty 2018 E89 (the case v ≡ −1 mod p omitted from Lemma 4.11), E92–E93 (footnote 5's wording) and E172 (§8.5.1 needs N(v) ≡ 1 mod p); Calegari–Geraghty 2020 E17, E20, E23–E25 and E148; Fakhruddin–Khare–Patrikis E6, E7, E29 and E43 (the central generators of Lemma B.3); Boxer–Calegari–Gee–Pilloni 2021 (Propositions 7.3.4, 7.3.16, 7.4.10, 7.4.18, Lemma 7.3.18); Caraiani–Newton E1, E2; Boxer–Calegari–Gee–Newton–Thorne E26; Liu et al. (the monodromy direction in §6.4, footnote 5 of Definition 2.2.4).
