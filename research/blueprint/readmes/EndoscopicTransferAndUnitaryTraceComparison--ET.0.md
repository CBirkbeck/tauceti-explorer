# Endoscopic transfer and unitary trace comparison — layers ET.0–ET.3

**Summary.** These layers build the local and global theory of endoscopy that the stable trace formula of layers ET.4–ET.7 consumes: stable conjugacy and its Galois cohomology, endoscopic data, transfer factors, the harmonic analysis of orbital integrals, the geometry of the Hitchin fibration, and the fundamental lemma with the existence of transfer. The end results are Ngô's fundamental lemma for Lie algebras over local fields of equal characteristic, its transfer to p-adic fields of characteristic zero by Waldspurger's change of characteristic, the fundamental lemma for groups and their spherical Hecke algebras, Waldspurger's theorem that the fundamental lemma implies the existence of smooth transfer, the stable base-change fundamental lemma and transfer, and the twisted fundamental lemma and transfer.

## Scope and ownership

ET.0 owns Galois cohomology with coefficients in a crossed module (including nonabelian H¹ with discrete coefficients), the abelianized cohomology H^i_ab of a connected reductive group, the Kneser, Hasse and abelianization comparisons, the Tate–Nakayama isomorphisms for tori and complexes of tori, Kottwitz's map H¹(F, G) → π_0(Z(Ĝ)^Γ)^D and the global ker¹ duality, the Kottwitz sign, stable conjugacy and the parametrization of rational classes inside a stable class, inner twists, the global obstruction for adelic stable classes, endoscopic and twisted endoscopic data, z-pairs, images and norms, the elliptic endoscopic data of the unitary similitude groups used by Shin and Caraiani–Scholze, and the centralizer and matching computations for unitary Lie algebras. z-extensions, the algebraic fundamental group, the Kottwitz homomorphism and Steinberg's theorem over the completed maximal unramified extension come from ReductiveGroupsPartII (RG2.1); dual groups and L-groups from RG2.5.

ET.1 owns invariant orbital integrals and their normalizations (it is the single owner: AutomorphicSpectralTheory AS.6 imports them and adds the weights), κ-orbital and stable orbital integrals, a-data and χ-data, the Langlands–Shelstad transfer factor with the conventions corrected by Kottwitz–Shelstad, twisted transfer factors, Lie-algebra transfer factors, matching test functions and transfer classes, Shalika germs, Fourier transforms of orbital integrals, the explicit transfer factor for unitary Lie algebras, Harish-Chandra's character theory for all real reductive groups, transfer at the real place, pseudo-coefficients and Euler–Poincaré functions (for inner forms of arbitrary signature) and their transfer. Quotient measures come from AdelicAlgebraicGroups AA.2; real representation theory from AutomorphicFormsOnReductiveGroups AF.1 and AF.4.

ET.2 and its sub-layers ET.2a, ET.2a:duality-perversity and ET.2a:pure-decomposition contain no constructions of their own: the perverse-sheaf foundations they used to re-export are EtaleDualityAndPerverseSheaves EDC.0–EDC.7 and LefschetzPencilsAndVanishingCycles LPV.6, imported directly where they are used.

ET.2b owns the Hitchin-fibration geometry of Ngô's proof: the Chevalley quotient, the Kostant section, the regular centralizer, the Hitchin moduli stack with an arbitrary twisting line bundle, the boundedness of Higgs sheaves through a good pair of line bundles, cameral covers and spectral curves, the Picard stack and its action, the anisotropic locus, affine Springer fibres in the equal-characteristic affine Grassmannian, the product formula, the δ-stratification, weak abelian fibrations, the κ-decomposition of the cohomology, the support theorem, the geometric stabilization and the counting of points of Hitchin fibres. The stack Bun_G of the global curve is GlobalShtukasAndFunctionFieldLanglands GS.0's and the affine Grassmannian is the fibre of GS.1's Beilinson–Drinfeld Grassmannian; ET.2b imports both.

ET.3 owns the reading of local point counts as κ-orbital integrals, the Lie-algebra fundamental lemma (Ngô), its unitary case (Laumon–Ngô), the non-standard fundamental lemma, the change of characteristic (Waldspurger), the fundamental lemma for groups and spherical Hecke algebras, the existence of smooth transfer (Waldspurger), transfer between inner forms of GL_n, stable base change, the twisted fundamental lemma and transfer, and the global statement at almost all places. Function-field adeles come from FunctionFieldArithmetic FA.2.

Not in these layers: the weighted fundamental lemma; local Langlands packets of unitary and classical groups and the rigid-inner-form refinement of transfer factors (Kaletha), which belong to a Part II; the isocrystal invariant of related elements, which belongs with the Kottwitz set B(G) in BunGAndNewtonStrata BG1.

## Conventions

Local fields in ET.0 and ET.1 have characteristic zero; global fields are number fields. ET.2b works over a finite field k = 𝔽_q with a smooth projective geometrically connected curve X and local fields k(v)((ε_v)) of equal characteristic, always with char(k) not dividing the order of the Weyl group. ET.3 passes between the two through Waldspurger's change of characteristic, which needs the residue characteristic large relative to the group; this bound is separate from, and in general stronger than, char(k) ∤ |W|.

Galois cohomology H^i(F, G) means continuous cohomology of Γ_F = Gal(F̄/F) in G(F̄) with the discrete topology. Stable conjugacy uses Labesse's stable centralizer I_δ. The invariant inv(δ, δ′) of two stably conjugate elements is the class of σ ↦ x σ(x)⁻¹ for δ′ = x⁻¹δx.

Every transfer factor carries a convention tag: the classical normalization Δ′ (compatible with Langlands' normalization of local class field theory, uniformizers to Frobenius) or the renormalized Δ_D (Deligne's normalization, uniformizers to inverse Frobenius), and an absolute normalization by a base point or by a Whittaker datum. The local class field theory normalization in force is that of the upstream ClassFieldTheory Layer 7. The global product formula holds only when the same convention is used at every place.

Haar measures on centralizers of stably conjugate or matching elements are transported along the inner twists between them; orbital integrals are normalized by the Weyl discriminant when written J_G(γ, f) = |D^G(γ)|^{1/2} O_γ(f). In the Lie-algebra fundamental lemma the unit functions are the characteristic functions of the integral Lie algebras and Δ_G(a) = q^{−val(D_G(a))/2}.

Coefficients of étale cohomology in ET.2b are Q̄_ℓ with ℓ ≠ char(k); the cohomological results are statements over Q̄_ℓ and are not claimed for integral or torsion coefficients.

## Exact supplier contracts


### From AlgebraicModuliForArithmeticGeometry:R09.4

For a smooth projective curve X over 𝔽_q, a smooth affine group scheme G over X and a line bundle D: (i) for a G-torsor E on X × S, the stack over Bun_G of sections φ ∈ H^0(X × S, ad(E) ⊗ D) (an abelian cone of a coherent sheaf) is algebraic and locally of finite type; (ii) for a smooth commutative group scheme J over X × S, the Picard stack of J-torsors is algebraic and smooth when H^2 vanishes; (iii) the criterion that an algebraic stack of finite type with finite unramified inertia is Deligne–Mumford. These are the stack inputs of the Hitchin moduli stack, its Picard action and the anisotropic DM statement.

This supplies `ET.2b/hitchin-moduli-stack`; `ET.2b/regular-centralizer`; `ET.2b/picard-stack-action`; `ET.2b/anisotropic-locus`.

### From SchemeAndStackFoundations:SF.2

The Grothendieck–Lefschetz trace formula over 𝔽_q with Q̄_ℓ coefficients for separated schemes of finite type and its extension to separated Deligne–Mumford stacks of finite type (counting points weighted by 1/#Aut), with compact supports; used to count points of anisotropic Hitchin fibres.

This supplies `ET.2b/hitchin-point-count`.

### From EtaleDualityAndPerverseSheaves:EDC.7

The decomposition theorem (BBD 5.4.5) and relative hard Lefschetz for a proper morphism f : M → S from a smooth separated Deligne–Mumford stack of finite type over 𝔽_q to a scheme (in Ngô's application M^ani → A^ani, with M^ani a global quotient by a finite-stabilizer action), stated so that EDC.7/decomposition-theorem and EDC.7/relative-hard-lefschetz-theorem, now stated for schemes, apply; Ngô (Remarque 7.5.1) records that the argument carries over. Also the Chebotarev-type principle: two mixed perverse sheaves on a scheme X_0 of finite type over 𝔽_q whose Frobenius trace functions agree at all closed points of X_0 (and its finite extensions) have isomorphic semisimplifications.

This supplies `ET.2b/kappa-decomposition`; `ET.2b/support-theorem`; `ET.2b/endoscopic-comparison`.

### From GlobalShtukasAndFunctionFieldLanglands:GS.1

Only the geometric prefix of GS.1, without Satake: the fibre of the Beilinson–Drinfeld Grassmannian at a closed point v of X is the affine Grassmannian Gr_v = G(F_v)/G(𝒪_v) as an ind-projective ind-scheme over k(v), with its G(𝒪_v)-action and the closed sub-ind-schemes cut out by integrality conditions; ET.2b builds affine Springer fibres inside it (red-team finding RT-AREA-langlands-1/12).

This supplies `ET.2b/affine-springer-fibre`.

### From tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation

The Lie algebra 𝔤 of a reductive group scheme with its adjoint action, centralizers of elements, and the regular locus; used for orbital integrals on 𝔤(F), Shalika germs, the Chevalley quotient and the Kostant section.

This supplies `ET.0/semisimple-conjugacy`; `ET.1/orbital-integral`; `ET.1/shalika-germs`; `ET.2b/chevalley-quotient`; `ET.2b/kostant-section`.

### From tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori

Tori, their character and cocharacter modules with Galois action, the Jordan decomposition and centralizers of semisimple elements; used for stable centralizers, Tate–Nakayama and the regular centralizer.

This supplies `ET.0/abelianized-cohomology`; `ET.0/tate-nakayama-tori`; `ET.0/semisimple-conjugacy`; `ET.2b/regular-centralizer`.

### From tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups

Reductive and semisimple groups with the simply connected cover of the derived group and central isogenies; used for the crossed module [G_sc → G] and abelianized cohomology.

This supplies `ET.0/abelianized-cohomology`; `ET.0/semisimple-conjugacy`.

### From tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Maximal tori, Borel pairs, root data with Galois action, Weyl groups, quasi-split groups and pinnings; used throughout for stable conjugacy, endoscopic data, a-data and χ-data and the Chevalley quotient.

This supplies `ET.0/abelianized-cohomology`; `ET.0/abelianization-theorems`; `ET.0/kottwitz-sign`; `ET.0/inner-twist`; `ET.0/semisimple-conjugacy`; `ET.0/endoscopic-datum`; `ET.0/norm-correspondence`; `ET.1/orbital-integral`; `ET.1/a-data-chi-data`; `ET.2b/chevalley-quotient`; `ET.2b/regular-centralizer`.

### From tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ

Pinned split reductive groups over ℤ and their automorphisms preserving a pinning; used for quasi-split forms, the Kostant section (regular nilpotent from a pinning) and Out-torsors over a curve.

This supplies `ET.0/inner-twist`; `ET.2b/chevalley-quotient`; `ET.2b/kostant-section`.

### From tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences

Long exact sequences of continuous cohomology of profinite groups; used for crossed-module cohomology.

This supplies `ET.0/crossed-module-galois-cohomology`.

### From tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory

Hilbert 90 for split tori and Galois cohomology of field extensions; used for Tate–Nakayama, z-pairs and transfer of tori.

This supplies `ET.0/tate-nakayama-tori`; `ET.0/inner-twist`; `ET.0/z-pair`.

### From tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees

Continuous cohomology of profinite groups in all degrees with discrete coefficients; used for Galois cohomology of tori and crossed modules.

This supplies `ET.0/crossed-module-galois-cohomology`; `ET.0/abelianized-cohomology`.

### From tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees

Cup products in all degrees and the projection formula; used for the Tate–Nakayama isomorphisms.

This supplies `ET.0/tate-nakayama-tori`.

### From tauceti:TauCetiRoadmap/ClassFieldTheory#layer-3-tates-theorem-for-a-class-formation

Tate's theorem (cup product with the fundamental class is an isomorphism Ĥ^r(Γ, ℤ) → Ĥ^{r+2}(Γ, C)) with the scaled inflation formula; ET.0 applies the Nakayama generalization to the cocharacter module of a torus.

This supplies `ET.0/tate-nakayama-tori`.

### From tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity

The local class formation and fundamental class; used for local Tate–Nakayama for tori.

This supplies `ET.0/tate-nakayama-tori`.

### From tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors

The local Artin map with its pinned normalization (arithmetic versus geometric Frobenius); transfer factors record which normalization is in force (Kottwitz–Shelstad 2012).

This supplies `ET.1/a-data-chi-data`; `ET.1/local-transfer-factor`; `ET.1/twisted-transfer-factor`.

### From tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group

The local Weil group W_F, used for L-groups, endoscopic data and the cocycle a_ω.

This supplies `ET.0/endoscopic-datum`; `ET.1/local-transfer-factor`.

### From tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants

Global carriers and the sum-of-local-invariants formula; used for global Tate–Nakayama and ker^1 duality.

This supplies `ET.0/tate-nakayama-tori`.

### From tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

The global class formation, idele class groups and global reciprocity; used for global Tate–Nakayama, global χ-data and the character ϖ of the unitary L-morphisms.

This supplies `ET.0/tate-nakayama-tori`; `ET.0/unitary-elliptic-endoscopic-data`; `ET.1/a-data-chi-data`; `ET.1/transfer-factor-properties`.

### From tauceti:TauCetiRoadmap/GlobalNumberFields#layer-0-places-completions-and-the-product-formula

Places, completions and the product formula; used for the global product formula for transfer factors.

This supplies `ET.1/transfer-factor-properties`.

### From tauceti:TauCetiRoadmap/GlobalNumberFields#layer-5-full-adeles-and-the-additive-quotient

Adeles of number fields; used for adelic abelianized cohomology.

This supplies `ET.0/abelianized-cohomology`.

### From tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch

Riemann–Roch on a smooth projective curve; used for the dimension of the Hitchin base, Schiffmann's boundedness and the δ-codimension estimate.

This supplies `ET.2b/hitchin-moduli-stack`; `ET.2b/schiffmann-boundedness`; `ET.2b/delta-stratification`; `ET.3/lie-algebra-fundamental-lemma`.

### From tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts

The dictionary between function fields and smooth projective curves over finite fields; used for the global curve of the Hitchin fibration.

This supplies `ET.2b/hitchin-moduli-stack`.

### From tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

Chebotarev density (Dirichlet density); used to choose auxiliary split places and, in its function-field form, to compare Frobenius traces in the geometric stabilization.

This supplies `ET.0/abelianization-theorems`; `ET.3/local-transfer-existence`; `ET.3/fundamental-lemma-almost-all-places`.

Imports of single nodes of other roadmaps are listed under *Needs* at each target; the main ones are ReductiveGroupsPartII RG2.1 (z-extensions, π_1(G), the Kottwitz homomorphism, Steinberg's theorem) and RG2.5 (dual and L-groups), AdelicAlgebraicGroups AA.2 (quotient measures) and AA.4 (Hasse principle for simply connected groups), AutomorphicFormsOnReductiveGroups AF.1 and AF.4 (real representations, Wigner's lemma), SmoothRepresentationsOfLocalGroups SR.1 and SR.4 (Hecke algebras, Satake isomorphism), EtaleDualityAndPerverseSheaves EDC.7 and DeligneWeightsAndPurity DWP.8 (decomposition theorem, purity of proper direct images), AlgebraicModuliForArithmeticGeometry R09.2 (Quot schemes), SchemeAndStackFoundations SF.1 (crossed modules), GlobalShtukasAndFunctionFieldLanglands GS.0 and GS.1 (Bun_G, the Beilinson–Drinfeld Grassmannian) and FunctionFieldArithmetic FA.2 (adeles of function fields).

## How to read the build

ET.0 is the foundation of everything else. ET.1 and ET.2b are independent of each other: ET.1 is harmonic analysis over local fields, ET.2b is geometry over a finite field. They meet in ET.3, where point counts of the Hitchin fibration are read as κ-orbital integrals and the geometric stabilization becomes the fundamental lemma. Within each layer the targets are listed in dependency order.

## Layer ET.0: Stable conjugacy and endoscopic data

The first group of targets is cohomological: crossed-module cohomology, its abelianization for reductive groups, and the comparisons that make H¹ computable locally (Kneser, Kottwitz) and globally (Hasse principle, abelianization square, ker¹ duality). The second group is the conjugacy theory: stable conjugacy, the torsor of rational classes inside a stable class, inner twists and the global obstruction. The third group is endoscopy proper: endoscopic and twisted endoscopic data, z-pairs, images and norms, and the explicit unitary cases.

### ET.0.1 Galois cohomology with coefficients in a crossed module

Node `ET.0/crossed-module-galois-cohomology` (construction).

Let Γ be a profinite group and ∂ : H̃ → H a crossed module of discrete groups (H acting on H̃ by automorphisms, ∂(h·x) = h ∂(x) h⁻¹ and ∂(x)·y = x y x⁻¹) on which Γ acts continuously and compatibly (σ(h·x) = σ(h)·σ(x), ∂∘σ = σ∘∂). Define pointed sets H^{-1}(Γ, H̃→H) = ker(∂)^Γ, H^0(Γ, H̃→H) and H^1(Γ, H̃→H) as the cohomology of the crossed module in the sense of Borovoi (equivalently of the two-term complex with H̃ in degree −1 and H in degree 0): a 0-cocycle is a pair (h, u) with h ∈ H and u : Γ → H̃ continuous with ∂(u_σ) = h⁻¹σ(h) and u_{στ} = u_σ·σ(u_τ) twisted by h; a 1-cocycle is a pair (u, h) with u : Γ×Γ → H̃ and h : Γ → H continuous satisfying the crossed-module cocycle identities; coboundaries are given by the actions of H and of maps Γ → H̃. For a crossed module 𝓗̃ → 𝓗 of smooth affine group schemes over a field F of characteristic 0, H^i(F, 𝓗̃→𝓗) := H^i(Γ_F, 𝓗̃(F̄) → 𝓗(F̄)) for i = −1, 0, 1. The case H̃ = 1 is nonabelian Galois cohomology, planned here: H^0(Γ, H) = H^Γ and H^1(Γ, H) the pointed set of continuous 1-cocycles a (a_{στ} = a_σ σ(a_τ)) modulo a ~ b iff b_σ = c⁻¹ a_σ σ(c), functorial in Γ (inflation, restriction) and in H, with twisting (for a cocycle a, the twisted group _aH and the bijection H^1(Γ, _aH) → H^1(Γ, H), b ↦ ba) and, for a normal subgroup H′ ⊆ H, the exact sequence of pointed sets up to H^1(H/H′) whose fibres over H^1(H/H′) are orbits of (H/H′)^Γ. They satisfy: (1) H^i(Γ, 1→H) = H^i(Γ, H) for i = 0, 1; (2) a morphism of crossed modules inducing isomorphisms on ker ∂ and on coker ∂ induces bijections on H^{-1}, H^0, H^1 (quasi-isomorphism invariance); (3) for H̃ ⊆ H a normal subgroup with ∂ the inclusion, H^i(Γ, H̃→H) = H^i(Γ, H/H̃) for i = 0, 1; (4) there is an exact sequence of pointed sets H^{-1}(H̃→H) → H^0(H̃) → H^0(H) → H^0(H̃→H) → H^1(H̃) → H^1(H) → H^1(H̃→H), with the usual meaning of exactness at the nonabelian terms; (5) if ker ∂ is central and coker ∂ is abelian (as for [G_sc → G] with G connected reductive), the pointed sets H^0 and H^1 carry a canonical abelian group structure, functorial in the crossed module.

The precise hypotheses are: Γ profinite acting continuously on discrete groups; the action is compatible with the crossed-module structure.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §1.1–1.2, Définition 1.1.1, Lemme 1.2.1, Proposition 1.2.2, pp. 9–20). Labesse defines crossed sets and crossed modules with a Γ-action, their 0- and 1-cohomology, and proves that a quasi-isomorphism of crossed sets induces an isomorphism in cohomology (Proposition 1.2.2).

([M. Kisin, Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf), §3.2.7, items (1)–(2) p. 41 and (3)–(4) p. 42). Kisin recalls Borovoi's pointed sets H^i(Δ, H̃→H) for i = −1, 0, 1 with the four listed properties, which this node states.

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5, §3.4 (pp. 12–13): abelianized H¹ as crossed-module cohomology of G_sc → G). Kaletha uses the crossed-module cohomology of G_sc → G as the ordinary abelianized H¹ (extraction item PAPER-KALETHA-16/P13).

Define the cocycle and coboundary relations as in Labesse §1.2 (crossed sets) or Borovoi §3 (summarised in Kisin (3.2.7)); the relations are equivalence relations by direct computation (Labesse Lemme 1.2.1).

Item (1) and nonabelian H^1: with H̃ = 1 the definitions collapse to Γ-invariants and to nonabelian H^1 (Labesse §1.3; Serre's twisting argument). AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1 plans the same object for topological groups, but NC.3 is in a higher upstream tier and lies downstream of this stage in the atlas, so the notion moves down: it is planned here and the restructure proposal has NC.3 import it.

Item (2): a quasi-isomorphism of crossed modules induces a bijection on cohomology (Labesse Proposition 1.2.2), by comparing cocycles through the long exact sequence and the five lemma for pointed sets with group actions.

Item (4): the connecting maps are constructed exactly as for a short exact sequence of groups; exactness is checked on cocycles (Kisin (3.2.7)(3), Borovoi Corollary 3.4.3).

Item (5): when ker ∂ is central and coker ∂ is abelian, the braiding of the crossed module gives a symmetric product on cocycles; Borovoi's construction of the group law is transported through the quasi-isomorphism to the two-term complex of tori (ET.0/abelianized-cohomology). Kisin's (3.2.7)(4) asserts an abelian structure whenever the cokernel is abelian; the centrality of the kernel is also used (recorded in sourceIssues).

The definition exposes the following operations and relations.

- `TauCeti.NonabelianH1` (data): H^1(Γ, H) for a profinite Γ acting continuously on a discrete group H: continuous cocycles modulo twisted conjugation, a pointed set.
- `TauCeti.NonabelianH1.twist` (equivalence): For a cocycle a, the bijection H^1(Γ, _aH) → H^1(Γ, H), b ↦ ba, sending the base point to [a].
- `TauCeti.NonabelianH1.exact_of_normal` (relation): For H′ ⊆ H normal, exactness of H′^Γ → H^Γ → (H/H′)^Γ → H^1(H′) → H^1(H) → H^1(H/H′), with fibres described by the action of (H/H′)^Γ.
- `TauCeti.CrossedModuleCohomology.H` (data): H^i(Γ, H̃ → H) for i ∈ {−1, 0, 1}, a pointed set, with base point the class of the identity.
- `TauCeti.CrossedModuleCohomology.map` (functoriality): A Γ-equivariant morphism of crossed modules induces maps on H^i, compatible with identities and composition.
- `TauCeti.CrossedModuleCohomology.bijective_of_quasiIso` (characterisation): A morphism inducing isomorphisms on ker ∂ and coker ∂ induces bijections on H^{-1}, H^0, H^1.
- `TauCeti.CrossedModuleCohomology.exact_sequence` (relation): The seven-term exact sequence H^{-1}(H̃→H) → H^0(H̃) → H^0(H) → H^0(H̃→H) → H^1(H̃) → H^1(H) → H^1(H̃→H) of pointed sets.
- `TauCeti.CrossedModuleCohomology.ofNormal` (equivalence): For a normal subgroup H̃ ⊆ H, H^i(Γ, H̃ → H) ≅ H^i(Γ, H/H̃), i = 0, 1.
- `TauCeti.CrossedModuleCohomology.instCommGroup` (instance): When ker ∂ is central and coker ∂ abelian, H^0 and H^1 are abelian groups and the maps of the exact sequence from H^0(H) onwards are compatible with these structures where both sides are groups.
- `TauCeti.CrossedModuleCohomology.inflation` (functoriality): Inflation and restriction along continuous homomorphisms of profinite groups, compatible with the exact sequence.

**Checks.**

- `CrossedModuleCohomology.h1_trivial_source` (degenerate): For H̃ = 1, H^1(Γ, 1 → H) is the nonabelian H^1(Γ, H), and H^0(Γ, 1 → H) = H^Γ.
- `CrossedModuleCohomology.h0_inclusion` (computation): For H̃ = H with ∂ = id, all three groups H^{-1}, H^0, H^1 are trivial (the crossed module is quasi-isomorphic to 1 → 1).
- `CrossedModuleCohomology.sl2_gl2` (compatibility): For [SL_2 → GL_2] over a field F of characteristic 0, H^0(F, SL_2 → GL_2) ≅ F^× through the determinant, and H^1(F, SL_2 → GL_2) = 0 by Hilbert 90.
- `CrossedModuleCohomology.not_kernel_only` (non-example): For the crossed module [μ_2 → 1] over ℝ (kernel μ_2 in degree −1), H^0 = H^1(ℝ, μ_2) = ℤ/2, so H^0 of a crossed module is not the H^0 of its cokernel when the kernel is nontrivial.

**Acceptance.**

- With H̃ = 1 the construction reproduces the nonabelian H^0 and H^1 of AnabelianGeometryAndNonabelianChabauty:NC.3.
- For [SL_2 → GL_2] over a characteristic-0 field, H^0 ≅ F^× via the determinant and H^1 = 0.
- The seven-term sequence is exact for [G_sc → G] with G = PGL_2 over ℝ.

*Used by:* Kisin, §§3.2.7, 4.4 (the abelianized cohomology and the real-trivial kernels Sha∞ are crossed-module cohomology groups); BunGAndNewtonStrata:BG1/abelianized-kottwitz-set (B_ab(G) is the Weil-group cohomology of [G_sc → G]); ET.0/abelianized-cohomology (abelianized reductive cohomology is the case [G_sc → G]).

*Needs:* `SchemeAndStackFoundations:SF.1/crossed-module-category`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`.

### ET.0.2 Abelianized Galois cohomology of a connected reductive group ★

Node `ET.0/abelianized-cohomology` (construction).

Let F be a field of characteristic 0 and G a connected reductive group over F, ρ : G_sc → G_der ⊆ G the simply connected cover of its derived group, T ⊆ G a maximal torus, T_sc = ρ⁻¹(T), Z = Z(G) and Z_sc = Z(G_sc). The crossed module [G_sc → G] (G acting on G_sc by conjugation through the isogeny) is quasi-isomorphic to the complexes of tori and groups of multiplicative type [T_sc → T] and [Z_sc → Z] (in degrees −1 and 0). Define H^i_ab(F, G) := H^i(F, G_sc → G) for i = 0, 1, an abelian group by ET.0/crossed-module-galois-cohomology (5), canonically isomorphic to the hypercohomology H^i(F, T_sc → T) and to H^i(F, Z_sc → Z); these identifications are independent of T and functorial in G for normal homomorphisms. The abelianization maps are ab^0 : G(F) = H^0(F, G) → H^0_ab(F, G) and ab^1 : H^1(F, G) → H^1_ab(F, G), induced by [1 → G] → [G_sc → G]; they fit into the exact sequence G_sc(F) → G(F) → H^0_ab(F, G) → H^1(F, G_sc) → H^1(F, G) → H^1_ab(F, G). For an inner form G′ of G, H^i_ab(F, G′) = H^i_ab(F, G) canonically (the centre complex does not change). For a global field F, the adelic groups H^i_ab(𝔸_F, G) are the restricted products of the local ones, and H^1_ab(𝔸_F/F, G) is the cokernel of the localization H^1_ab(F, G) → H^1_ab(𝔸_F, G) in the sense of Labesse §1.6 (the cohomology of the crossed module G_sc(𝔸_K) → G(𝔸_K) modulo the rational one, in the limit over finite Galois K).

The precise hypotheses are: F of characteristic 0; G connected reductive (Labesse also allows quasi-connected groups: kernels of a surjection from a connected reductive group onto a torus).

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §1.6, Lemmes 1.6.1–1.6.3 and Proposition 1.6.8, pp. 28–33). Labesse defines the abelianized cohomology of a (quasi-)connected reductive group through the crossed module G_sc → G, proves its invariance under inner forms and the quasi-isomorphism with torus complexes, including the adelic version.

([M. Kisin, Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf), §3.2.7, pp. 41–42, and Borovoi 3.8.1–3.8.2 as recalled there). Reductive abelianized cohomology through the quasi-isomorphisms of [G_sc → G] with [T_sc → T] and [Z_sc → Z] (extraction item PAPER-KISIN-17/H05).

([P. van Hoften, Mod p points on Shimura varieties of parahoric level](https://arxiv.org/abs/2010.10496v4), arXiv v4, §§4.3.12–4.3.15, pp. 56–58). Uses H^0_ab(ℚ, G) = H^0(ℚ, Z(G_sc) → Z(G)) and the map ab^0, with the crossed-module comparison (extraction item PAPER-VANHOFTEN-24/E01).

Quasi-isomorphism: T_sc → T and Z_sc → Z map to G_sc → G with the same kernel (the finite group Z_sc ∩ ker ρ) and the same cokernel G/ρ(G_sc) = G_ab; apply ET.0/crossed-module-galois-cohomology (2) (Borovoi 3.8.1–3.8.2, recalled as Kisin item H05; Labesse Lemme 1.6.1–1.6.3).

Independence of T: two maximal tori are conjugate over F̄ and the induced isomorphisms of hypercohomology are canonical (inner automorphisms act trivially on the centre complex).

Exact sequence: specialise the seven-term sequence of the crossed module (ET.0/crossed-module-galois-cohomology (4)) to [G_sc → G].

Inner forms: an inner twist does not change [Z_sc → Z] with its Galois action (Labesse Lemme 1.6.2).

Adelic and global-mod-local groups: restricted products of the local hypercohomology groups, using that for almost all places the torus complexes are unramified and the local groups are trivial on integral classes (Labesse §1.4, §1.6, Proposition 1.6.8).

The definition exposes the following operations and relations.

- `TauCeti.AbelianizedCohomology` (data): H^i_ab(F, G) for i = 0, 1, an abelian group.
- `TauCeti.AbelianizedCohomology.ab` (projection): The abelianization maps ab^0 : G(F) → H^0_ab(F, G) and ab^1 : H^1(F, G) → H^1_ab(F, G).
- `TauCeti.AbelianizedCohomology.equivTorusComplex` (equivalence): H^i_ab(F, G) ≅ H^i(F, T_sc → T) for every maximal torus T, compatibly with ab and independently of T.
- `TauCeti.AbelianizedCohomology.equivCentreComplex` (equivalence): H^i_ab(F, G) ≅ H^i(F, Z_sc → Z).
- `TauCeti.AbelianizedCohomology.exact_sc` (relation): Exactness of G_sc(F) → G(F) → H^0_ab(F, G) → H^1(F, G_sc) → H^1(F, G) → H^1_ab(F, G).
- `TauCeti.AbelianizedCohomology.innerTwistEquiv` (equivalence): Canonical isomorphism H^i_ab(F, G′) ≅ H^i_ab(F, G) for an inner form G′, compatible with the identification of centres.
- `TauCeti.AbelianizedCohomology.map` (functoriality): Functoriality for normal homomorphisms G → G′, with map_id and map_comp.
- `TauCeti.AbelianizedCohomology.localize` (functoriality): For F global, localization maps to H^i_ab(F_v, G) and to the restricted product H^i_ab(𝔸_F, G), and the global-mod-local group H^1_ab(𝔸_F/F, G).

**Checks.**

- `abelianizedCohomology_torus` (degenerate): For G = T a torus, G_sc = 1 and H^i_ab(F, T) = H^i(F, T), with ab^i the identity.
- `abelianizedCohomology_simplyConnected` (degenerate): For G semisimple simply connected, [G_sc → G] = [G → G] is quasi-isomorphic to 1 and H^i_ab(F, G) = 0.
- `abelianizedCohomology_gln` (computation): For G = GL_n, H^0_ab(F, GL_n) ≅ F^× with ab^0 = det, and H^1_ab(F, GL_n) ≅ H^1(F, G_m) = 0.
- `abelianizedCohomology_pgl2_real` (computation): For G = PGL_2 over ℝ, H^1_ab(ℝ, PGL_2) = H^1(ℝ, μ_2 → 1) = H^2(ℝ, μ_2) = ℤ/2, matching the two real forms PGL_2 and SO(3).
- `abelianizedCohomology_not_H1_of_G_ab` (non-example): H^1_ab(F, G) is not H^1(F, G/G_der): for G = PGL_2 over ℝ, G/G_der = 1 but H^1_ab(ℝ, PGL_2) = ℤ/2.

**Acceptance.**

- For a torus T, H^i_ab(F, T) = H^i(F, T); for simply connected semisimple G, H^i_ab(F, G) = 0.
- For GL_n, ab^0 = det : GL_n(F) → F^× and H^1_ab = 0.
- For PGL_2 over ℝ, H^1_ab = ℤ/2, matching the two real forms.

*Used by:* ET.0/rational-classes-in-stable-class (the abelianized kernel 𝔈(I, G; F) = ker(H^1(F, I) → H^1_ab(F, G))); ET.0/kottwitz-duality (H^1_ab(F, G) is identified with π_0(Z(Ĝ)^Γ)^D); Leslie, Lemma 1.8 (C(T_δ/F) = ker(H^1(F, T_δ) → H^1_ab(F, U(V)))); BunGAndNewtonStrata:BG1/abelianized-kottwitz-set (the abelianized Kottwitz set uses the same coefficient complexes).

*Needs:* `ET.0/crossed-module-galois-cohomology`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-5-full-adeles-and-the-additive-quotient`.

### ET.0.3 Kneser, Hasse principle and the abelianization comparisons

Node `ET.0/abelianization-theorems` (theorem).

Let G be connected reductive over a field F of characteristic 0. (a) (Kneser) If F is nonarchimedean local and G is semisimple simply connected, H^1(F, G) = 1. (b) If F is nonarchimedean local, ab^1 : H^1(F, G) → H^1_ab(F, G) is bijective and ab^0 : G(F) → H^0_ab(F, G) is surjective; if F is archimedean or global, ab^1 is surjective. (c) (Kneser–Harder–Chernousov) If F is a number field and G is semisimple simply connected, H^1(F, G) → ∏_{v real} H^1(F_v, G) is bijective. (d) For F a number field, the square formed by H^1(F, G) → H^1_ab(F, G) and the localization to the archimedean places, H^1(F, G) → H^1(F_∞, G) → H^1_ab(F_∞, G), is cartesian and all four arrows are surjective; consequently ker^1(F, G) := ker(H^1(F, G) → ∏_v H^1(F_v, G)) maps bijectively to its abelianized analogue ker^1_ab(F, G), and for an inner form G′ of G the natural map ker^1(F, G′) → ker^1(F, G) is a bijection. (e) For F a number field and a finite subset of H^1(F, G), there is a maximal F-torus T ⊆ G such that the subset lies in the image of H^1(F, T) → H^1(F, G). (f) For F a number field and G adjoint, H^1(F, G) → ∏_v H^1(F_v, G) is injective; hence an inner form of a connected reductive group over F is determined up to isomorphism by its localizations. (g) (Serre) If F = ℝ and G(ℝ) is compact, H^1(ℝ, G) is in bijection with the G(ℝ)-conjugacy classes of elements of order dividing 2 in G(ℝ), functorially in G; and for a connected reductive subgroup H′ ⊆ H over ℝ with H_ad(ℝ) compact and H′ containing the maximal ℝ-split central torus of H, ker(H^1(ℝ, H′) → H^1(ℝ, H)) is trivial.

The precise hypotheses are: F of characteristic 0; G connected reductive; for (a): F nonarchimedean local and G simply connected; for (c): G simply connected; for (f): G adjoint.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Théorème 1.6.6 (p. 31), Proposition 1.6.7 (pp. 31–32), Théorème 1.6.9 and Théorème 1.6.10 (p. 33), Corollaire 1.6.11 (p. 34)). Kneser's vanishing for p-adic simply connected groups; the properties of ab^0 and ab^1; the Kneser–Harder–Chernousov Hasse principle; the cartesian square for global fields; ker^1 of inner forms.

([M. Kisin, Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf), Theorem (3.4.6), p. 46; the remark after (4.3.1)(iv), p. 75; §§4.4.1–4.4.9 with Lemma (4.4.5) and its proof, p. 81; proof of Proposition (3.4.11), p. 48). The global–real abelianization square (item H06), Borovoi's lifting through a torus (H10), the adjoint Hasse principle (§4.3.1), Serre's description of real H¹ of compact groups and the injectivity lemma (H09), and Kneser's vanishing as used in Kisin's proofs.

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5: Fact 3.4 (p. 13), Corollary 3.7 (p. 14), Lemma 4.9 (p. 25) (extraction items P10, P11)). Finiteness of the rigid H¹ (Fact 3.4; the ordinary finiteness for linear groups over local fields is Borel–Serre's theorem, Platonov–Rapinchuk Theorem 6.14, not read) and the use of fundamental tori for the surjectivity of abelianization (Corollary 3.7, Lemma 4.9).

(a) Kneser's theorem (Labesse Théorème 1.6.6, citing Kneser); it is also a consequence of Bruhat–Tits theory. ReductiveGroupsPartII supplies only the vanishing over the completed maximal unramified extension (RG2.1/steinberg-quasi-split); Kneser's theorem over F itself is planned here.

(b) Use the exact sequence of ET.0/abelianized-cohomology: by (a) the term H^1(F, G_sc) vanishes, giving injectivity of ab^1 and surjectivity of ab^0; surjectivity of ab^1 uses a fundamental (elliptic) maximal torus T, for which H^1(F, T) → H^1_ab(F, G) is onto (Labesse Lemme 1.6.5, Proposition 1.6.7; Borovoi Proposition 5.1, Theorems 5.4 and 5.7). Over a number field the surjectivity is Borovoi's Theorem 5.7.

(c) The Hasse principle for simply connected groups is imported (AdelicAlgebraicGroups:AA.4/hasse-principle-simply-connected) in the form: an F-torsor under G is trivial iff it is trivial at every place; with (a) at the finite places this gives the bijectivity onto the real places (Labesse Théorème 1.6.9).

(d) Combine (b) and (c) with the density of the image of H^0_ab(F, G) in H^0_ab(F_∞, G), proved by dévissage to a complex of tori [T_2 → T_1] with T_1 induced (Labesse Théorème 1.6.10 and Corollaire 1.6.11; Borovoi Theorem 5.11, recalled by Kisin, Theorem 3.4.6).

(e) Borovoi Theorem 5.11 as used in Kisin §4.4.7 (item PAPER-KISIN-17/H10): choose a maximal torus meeting each class at every place of a finite set and use (d).

(f) The Hasse principle for adjoint groups is used by Kisin (§4.3.1, proof of Corollary 4.6.5) as a known result; through ET.0/kottwitz-duality (b) it is equivalent to ker^1(F, Z(Ĝ)) = 0 for the finite Galois module Z(Ĝ) when Ĝ is simply connected. Its proof (Platonov–Rapinchuk, Chapter 6) was not read for this plan and is recorded as a gap; inner forms of a reductive group are classified by H^1(F, G_ad) (ET.0/inner-twist), which gives the consequence.

(g) Serre, Galois Cohomology III §4.5, Theorem 6 (recalled by Kisin, proof of Lemma 4.4.5) for compact G(ℝ); the injectivity statement is Kisin Lemma 4.4.5 (item PAPER-KISIN-17/H09).

**Acceptance.**

- For G = SL_2 over a p-adic field, H^1(F, SL_2) = 1, while H^1(F, PGL_2) = H^1_ab(F, PGL_2) = ℤ/2 classifies the split and the quaternion forms.
- For G = SL_1(D) with D a quaternion division algebra over ℚ ramified at ∞ and one prime, (c) identifies H^1(ℚ, G) with H^1(ℝ, G), which has two elements.
- For G = SO(3) over ℝ (compact), (g) gives H^1(ℝ, G) of cardinality 2: the identity and the class of rotations by π.

*Needs:* `ET.0/abelianized-cohomology`; `AdelicAlgebraicGroups:AA.4/hasse-principle-simply-connected`; `ReductiveGroupsPartII:RG2.1/steinberg-quasi-split`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`; `ET.0/kottwitz-duality`.

### ET.0.4 Degree-zero abelianization and positive rational images

Node `ET.0/degree-zero-abelianization` (theorem).

Let G be a connected reductive group over ℚ with ρ : G_sc → G. (a) H^0_ab(ℚ, G) = H^0(ℚ, Z(G_sc) → Z(G)) and the sequence G_sc(ℚ) → G(ℚ) → H^0_ab(ℚ, G) → H^1(ℚ, G_sc) is exact, so the kernel of ab^0 on G(ℚ) is ρ(G_sc(ℚ)); the same holds over ℝ and over every ℚ_ℓ. (b) Assume the Hasse principle for G_sc, i.e. ker(H^1(ℚ, G_sc) → H^1(ℝ, G_sc)) = 1 (true by ET.0/abelianization-theorems (c)). Let G(ℚ)_+ be the inverse image in G(ℚ) of the identity component G(ℝ)_+ (for the real topology) — equivalently of the image of G_sc(ℝ)·Z(G)(ℝ) — then G(ℚ)_+/ρ(G_sc(ℚ)) is identified by ab^0 with the inverse image of ab^0(Z(G)(ℝ)) under H^0_ab(ℚ, G) → H^0_ab(ℝ, G). (c) If G and H are inner forms over ℚ, with identifications away from p, G(𝔸_f^p) ≅ H(𝔸_f^p), compatible with a fixed global inner twisting on the centre complex [Z(G_sc) → Z(G)], then their positive rational images agree in G(𝔸_f^p)/ρ(G_sc(𝔸_f^p)) × (π_1(G)_I)^σ, the second factor being the Frobenius-invariant part of the inertia coinvariants of the algebraic fundamental group at p.

The precise hypotheses are: G connected reductive over ℚ; for (b): the Hasse principle for G_sc (a theorem by ET.0/abelianization-theorems (c)); for (c): G and H inner forms with compatible identifications away from p.

([P. van Hoften, Mod p points on Shimura varieties of parahoric level](https://arxiv.org/abs/2010.10496v4), arXiv v4: §4.3.12 (pp. 56–57), Proposition 4.3.13 (p. 57, proof p. 58), Lemma 4.3.14 and Corollary 4.3.15 (p. 57)). Degree-zero abelianized cohomology through the centre complex, its exact sequence with kernel ρ(G_sc(ℚ)), the real-positive criterion and the comparison of positive images of inner forms (extraction items E01–E04).

(a) Exactness is the degree-zero part of the exact sequence of ET.0/abelianized-cohomology; the centre complex computes H^0_ab by the quasi-isomorphism there (van Hoften §§4.3.12–4.3.13, after Borovoi).

(b) An element g ∈ G(ℚ) with ab^0(g) in ab^0(Z(G)(ℝ)) satisfies g = z·ρ(h) with z ∈ Z(G)(ℝ), h ∈ G_sc(ℝ) in G(ℝ), so g ∈ G(ℝ)_+ (G_sc(ℝ) is connected); conversely, an element of H^0_ab(ℚ, G) with real image in ab^0(Z(G)(ℝ)) maps to a class of H^1(ℚ, G_sc) trivial at ∞, hence trivial by the Hasse principle, so it comes from G(ℚ) (van Hoften Lemma 4.3.14, Corollary 4.3.15).

(c) The inner twisting does not change the centre complex, so H^0_ab(ℚ, G) = H^0_ab(ℚ, H) compatibly with the local maps; apply (b) to both groups and compare images through the away-from-p identifications and the Kottwitz map at p (van Hoften Proposition 4.3.13; the compatibility is made explicit in extraction item E04).

**Acceptance.**

- For G = GL_2 over ℚ: H^0_ab(ℚ, GL_2) = ℚ^× via det, G(ℚ)_+ is the set of rational matrices of positive determinant, and (b) identifies G(ℚ)_+/SL_2(ℚ) with ℚ_{>0}.
- For G = SL_2 (simply connected) both sides of (b) are trivial.

*Needs:* `ET.0/abelianized-cohomology`; `ET.0/abelianization-theorems`; `ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism`; `ReductiveGroupsPartII:RG2.1/algebraic-fundamental-group`.

### ET.0.5 Tate–Nakayama isomorphisms for tori

Node `ET.0/tate-nakayama-tori` (theorem).

Let S be a torus over a field F of characteristic 0, split by a finite Galois extension E/F with group Γ_{E/F}, and X_*(S) its cocharacter module. (a) (Local) If F is local and u_{E/F} ∈ H^2(Γ_{E/F}, E^×) is the local fundamental class, cup product with u_{E/F} gives isomorphisms Ĥ^i(Γ_{E/F}, X_*(S)) → Ĥ^{i+2}(Γ_{E/F}, S(E)) of Tate cohomology groups for every integer i, using S(E) = X_*(S) ⊗ E^×. In particular H^1(F, S) ≅ Ĥ^{-1}(Γ_{E/F}, X_*(S)) = (X_*(S)_Γ)_tors (the inflation H^1(Γ_{E/F}, S(E)) → H^1(F, S) being an isomorphism by Hilbert 90 for split tori), and H^2(Γ_{E/F}, S(E)) ≅ X_*(S)^Γ/N X_*(S), with inflation H^2(Γ_{E/F}, S(E)) → H^2(F, S) injective; if S is anisotropic then H^2(F, S) = 0. The isomorphisms are compatible with restriction and corestriction, and with inflation in a tower E ⊆ E′ only after multiplying by the degree [E′ : E]. (b) (Global) If F is a number field and C_E the idele class group, cup product with the global fundamental class gives Ĥ^i(Γ_{E/F}, X_*(S)) ≅ Ĥ^{i+2}(Γ_{E/F}, X_*(S) ⊗ C_E); in degree −1 this identifies H^1(𝔸_F/F, S) := coker(H^1(F, S) → H^1(𝔸_F, S)) with (X_*(S)_Γ)_tors and, dually, gives ker^1(F, S) ≅ ker^1(F, Ŝ)^D. (c) The same holds for two-term complexes of tori [S_1 → S_2] with finite kernel (hypercohomology in place of cohomology and the cone of X_*(S_1) → X_*(S_2)), compatibly with the long exact sequences, with norm and restriction maps and with central isogenies. The sign convention: some authors (e.g. Kaletha in the proof of Theorem 4.8) use λ ↦ λ ∪ c^{-1}, the negative of the isomorphism above; each consumer records which one it uses.

The precise hypotheses are: F of characteristic 0 local (finite extension of ℚ_p, or ℝ, or ℂ) for (a), a number field for (b); S a torus split by the finite Galois extension E/F.

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5: §4 introduction; Theorem 4.8 (p. 24) and its proof (p. 25); Corollary 3.7 (p. 14); §5.3 (p. 33)). The ordinary Tate–Nakayama isomorphism (X_*(S)_Γ)_tors → H^1(F, S) and its all-degree form, the scaled inflation, injectivity of inflation in degree 2 and the anisotropic vanishing (extraction items P12, P29).

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §1.7, proof of Proposition 1.7.3 (pp. 38–39); Lemme 1.5.1 (p. 27)). Labesse applies the Tate–Nakayama isomorphism for complexes of tori to the centre complex, and proves H^2(F, T) = 0 for an anisotropic torus over a local field (Lemme 1.5.1).

([R. E. Kottwitz, Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), §1.1–1.2 (p. 368)). Kottwitz's construction of α_G starts from the Tate–Nakayama isomorphism for tori, recorded as the case G = T of Theorem 1.2.

Nakayama's generalization of Tate's theorem: for a finite group Γ, a class formation module C with fundamental class u and a ℤ-free (hence Tor-free) Γ-module M, cup product with u is an isomorphism Ĥ^i(Γ, M) → Ĥ^{i+2}(Γ, M ⊗ C). The case M = ℤ is the upstream ClassFieldTheory Layer 3 theorem (tateTheorem); the general case follows from it by the cup-product criterion applied to M ⊗ C with M ℤ-free (the generalization the upstream §2.4 asks for in the generic Tate-cohomology supplier). Apply it with M = X_*(S) and C = E^× (local, upstream ClassFieldTheory Layer 6) or C = C_E (global, Layer 11).

Identify S(E) = X_*(S) ⊗ E^× as Γ-modules, so Ĥ^{i+2}(Γ_{E/F}, S(E)) is Galois cohomology of the torus; Hilbert 90 for split tori (upstream ProfiniteCohomology Layer 9) gives the inflation statements in degree 1, and the injectivity in degree 2.

Anisotropic vanishing: X_*(S)^Γ = 0 gives Ĥ^0 = 0, so H^2(Γ_{E/F}, S(E)) = 0 for every splitting E, and H^2(F, S) is the colimit (Kaletha, Corollary 3.7(1)).

Compatibilities: restriction and corestriction commute with cup products by the projection formula; inflation multiplies the fundamental class by the degree (upstream ClassFieldTheory Layer 3, scaled inflation).

Global duality: Poitou–Tate for tori in the form ker^1(F, S) ≅ ker^1(F, Ŝ)^D follows from (b) by comparing with the local statements (Kottwitz 1984 §4; recalled in Labesse Proposition 1.7.3 for the centre complex).

Complexes: use the long exact sequences of hypercohomology and the five lemma (Labesse §1.7, 'Tate–Nakayama pour les complexes de tores').

**Acceptance.**

- For S = G_m: (X_*(S)_Γ)_tors = 0 and H^1(F, G_m) = 0 (Hilbert 90).
- For S = R^1_{E/F} G_m the norm-one torus of a quadratic E/F: X_*(S) = ℤ with the nontrivial element acting by −1, (X_*(S)_Γ)_tors = ℤ/2 and H^1(F, S) = F^×/N E^× ≅ ℤ/2 for F local nonarchimedean.
- For S = R_{E/F} G_m: X_*(S) is induced, Ĥ^i vanishes and H^1(F, S) = 0 (Shapiro and Hilbert 90).

*Needs:* `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-3-tates-theorem-for-a-class-formation`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`; `ReductiveGroupsPartII:RG2.5/torus-and-gl-dual-groups`; `ArithmeticGaloisDuality:R02.4/poitou-tate`.

### ET.0.6 Kottwitz's map and the duality for reductive groups ★

Node `ET.0/kottwitz-duality` (theorem).

Let F be a field of characteristic 0 and G connected reductive over F, with dual group Ĝ (complex), its centre Z(Ĝ) with the Galois action of ReductiveGroupsPartII:RG2.5/galois-action-on-dual-group, and A(G) := π_0(Z(Ĝ)^Γ)^D (Pontryagin dual). (a) (Local) If F is local there is a unique extension of the Tate–Nakayama isomorphisms for tori to a morphism of functors α_G : H^1(F, G) → A(G) on the category of connected reductive groups and normal homomorphisms (Kottwitz 1986, Theorem 1.2). It factors through ab^1 and an injective homomorphism H^1_ab(F, G) → A(G). If F is nonarchimedean, α_G is a bijection; the group structure it induces on H^1(F, G) is Kottwitz's. If F = ℝ, the fibre of α_G over 0 is the image of H^1(ℝ, G_sc), and the image of α_G is the annihilator of the image of the norm N_{ℂ/ℝ} on Z(Ĝ); α_G is not bijective in general and H^1(ℝ, G) is not a group. For a maximal torus S ⊆ G, α_G restricted along H^1(F, S) → H^1(F, G) is α_S followed by the restriction A(S) → A(G) dual to π_0(Z(Ĝ)^Γ) → π_0(Ŝ^Γ); a class of H^1(F, S) comes from H^1(F, G_sc) exactly when α_S of it annihilates the image of π_0(Z(Ĝ)^Γ) → π_0(Ŝ^Γ). Equivalently, via ReductiveGroupsPartII:RG2.5/dual-centre-and-fundamental-group, for F nonarchimedean H^1(F, G) ≅ (π_1(G)_Γ)_tors. (b) (Global) If F is a number field, H^1_ab(𝔸_F/F, G) ≅ A(G) canonically; ker^1(F, G) = ker^1_ab(F, G) ≅ ker^1(F, Z(Ĝ))^D;. Kottwitz's Tamagawa-number formula τ(G) = #π_0(Z(Ĝ)^Γ)/#ker^1(F, Z(Ĝ)) is not part of this node.

The precise hypotheses are: F of characteristic 0, local for (a), a number field for (b); G connected reductive.

([R. E. Kottwitz, Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), §1.2, Theorem 1.2 (p. 368); §2.2, Theorem 2.2 (p. 374)). Kottwitz's theorem: a unique extension of the Tate–Nakayama map to a morphism of functors H^1(F, G) → π_0(Z(Ĝ)^Γ)^D, bijective for p-adic F; §2 gives the global cohomological results.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Proposition 1.7.3 (pp. 38–39) and Corollaire 1.7.4 (p. 39)). H^1_ab(F, G) injects into A(G), bijectively for nonarchimedean F; H^1_ab(𝔸_F/F, G) ≅ A(G) and ker^1(F, G) = ker^1_ab(F, G) = ker^1(F, Z(Ĝ))^D globally.

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5: Kottwitz's Theorem 1.2 as used in Corollary 3.8 (p. 15), Lemma 4.9 (p. 25), §4.7, Corollary 5.4 and Lemma 5.7 (extraction item P28)). The real-place description of α_G (fibre over 0, image) and the criterion for a torus class to come from G_sc.

(a) For a torus define α_S by Tate–Nakayama (ET.0/tate-nakayama-tori (a), degree −1). For general G use a z-extension (ReductiveGroupsPartII:RG2.1/z-extension-existence) to reduce to G with simply connected derived group, then use the exact sequence H^1(F, G_sc) → H^1(F, G) → H^1(F, D) with D = G/G_der a torus and Kneser's vanishing (ET.0/abelianization-theorems (a)) in the p-adic case; uniqueness follows from the existence of fundamental tori (Kottwitz 1986, Theorem 1.2 and its proof; Labesse Proposition 1.7.3).

Injectivity on H^1_ab and bijectivity for nonarchimedean F: Labesse Proposition 1.7.3 via the quasi-isomorphism [Z(Ĝ) → 1] ≃ [Ĝ → Ĝ_sc]-dual of the centre complex and the Tate–Nakayama isomorphism for complexes of tori; the limit over cofinal splitting fields gives bijectivity.

Real case: describe H^1(ℝ, G) through fundamental tori (Kaletha, extraction item P28; Kottwitz 1986 Theorem 1.2).

(b) Global: Labesse Proposition 1.7.3 (global part), from the global Tate–Nakayama isomorphism for the centre complex (ET.0/tate-nakayama-tori (b), (c)) and the cofinality of splitting fields; ker^1(F, G) = ker^1_ab(F, G) is ET.0/abelianization-theorems (d).

**Acceptance.**

- For G = PGL_2 over a p-adic field: Ĝ = SL_2(ℂ), Z(Ĝ) = μ_2, A(G) = ℤ/2 and H^1(F, PGL_2) has two elements (split and quaternion forms).
- For G = SL_2: Z(Ĝ) = {1} for Ĝ = PGL_2(ℂ), so A(G) = 0, matching Kneser's vanishing.
- For G = U(1) over ℝ attached to ℂ/ℝ: α_G is a bijection H^1(ℝ, U(1)) = ℤ/2 ≅ A(G).
- For G = SU(2) compact over ℝ: H^1(ℝ, G) has two elements (identity and −1 up to conjugacy, ET.0/abelianization-theorems (g)) while A(G) = π_0(Z(Ĝ)^Γ)^D for Ĝ = PGL_2(ℂ) is trivial, so α_G is not injective over ℝ.

*Needs:* `ET.0/tate-nakayama-tori`; `ET.0/abelianized-cohomology`; `ReductiveGroupsPartII:RG2.1/z-extension-existence`; `ReductiveGroupsPartII:RG2.1/z-extension`; `ReductiveGroupsPartII:RG2.5/langlands-dual-group`; `ReductiveGroupsPartII:RG2.5/galois-action-on-dual-group`; `ReductiveGroupsPartII:RG2.5/dual-centre-and-fundamental-group`.

### ET.0.7 The Kottwitz sign of an inner form

Node `ET.0/kottwitz-sign` (definition).

Let F be a local field of characteristic 0, G* a quasi-split connected reductive group over F and G an inner form of G*. The Kottwitz sign is e(G) = (−1)^{q(G*) − q(G)} ∈ {±1}, where q denotes the F-rank of the derived group (Kottwitz's definition); it depends only on the class h ∈ H^1(F, G*_ad) of the inner twist, and is the value at h of a map H^1(F, G*_ad) → {±1}. In dual terms (Hansen–Kaletha–Weinstein): if h corresponds under α_{G*_ad} (ET.0/kottwitz-duality) to ν ∈ X^*(Z(Ĝ_sc)^Γ), the dual group of G*_ad being Ĝ_sc, then e(G) = (−1)^{⟨2ρ, ν⟩}, with 2ρ the sum of the positive coroots of Ĝ_sc and the pairing taken modulo 2 after lifting ν to a character of a maximal torus. Properties: e(G*) = 1; e(G) depends only on the isomorphism class of the inner form; for F global and G a connected reductive group over F, ∏_v e(G_{F_v}) = 1.

The precise hypotheses are: F local of characteristic 0 (product formula: F global); G an inner form of the quasi-split group G*.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Définition 1.7.1 and Lemme 1.7.2 (p. 37)). Definition of the Kottwitz sign of an inner form through H^1(F, G*_ad) → {±1}, and the product formula ∏_v e(G_v) = 1.

([D. Hansen, T. Kaletha and J. Weinstein, On the Kottwitz conjecture for local shtuka spaces](https://arxiv.org/abs/1709.06651v4), arXiv v4, Appendix A.2, Lemma A.2.1 (p. 85)). The Kottwitz sign of an inner twist with class corresponding to ν ∈ X^*(Z(Ĝ_sc)^Γ) is (−1)^{⟨2ρ, ν⟩} (extraction item PAPER-HANSEN-KALETHA-WEINSTEIN-22/119).

([R. E. Kottwitz, Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), §5.1 (p. 379)). Kottwitz attaches a sign e(I) = ±1 to every connected reductive group over a local field, referring to his paper on sign changes for the definition, and uses it in the local conjectures on orbital integrals.

Well definedness: α_{G*_ad} is defined on H^1(F, G*_ad) (ET.0/kottwitz-duality), and ⟨2ρ, ν⟩ mod 2 does not depend on the choice of positive system because two choices differ by the Weyl group, which fixes Z(Ĝ_sc).

Comparison with the F-rank definition: Kottwitz, 'Sign changes in harmonic analysis on reductive groups' (cited by Kottwitz 1986 §5.1 and by Labesse Définition 1.7.1); the dual-group formula is Hansen–Kaletha–Weinstein Lemma A.2.1.

Product formula: the sum over all places of the local invariants of a global class in H^1(F, G_ad) is trivial, which follows from the global duality of ET.0/kottwitz-duality (b) (Labesse Lemme 1.7.2, from Proposition 1.6.12).

The definition exposes the following operations and relations.

- `TauCeti.kottwitzSign` (data): e(G) ∈ ℤˣ for an inner form G of a quasi-split group over a local field of characteristic 0.
- `TauCeti.kottwitzSign_eq_neg_one_pow_rank` (characterisation): e(G) = (−1)^{q(G*) − q(G)} with q the F-rank of the derived group.
- `TauCeti.kottwitzSign_eq_dual` (characterisation): e(G) = (−1)^{⟨2ρ, ν⟩} for ν the character of Z(Ĝ_sc)^Γ attached to the inner twist.
- `TauCeti.kottwitzSign_quasiSplit` (simp): e(G*) = 1.
- `TauCeti.prod_kottwitzSign` (relation): ∏_v e(G_v) = 1 for a connected reductive group over a number field.
- `TauCeti.kottwitzSign_product` (relation): e(G_1 × G_2) = e(G_1) e(G_2) and e(Res_{E/F} G) = e(G).

**Checks.**

- `kottwitzSign_quasiSplit` (degenerate): e(G*) = 1 for every quasi-split G*.
- `kottwitzSign_quaternion` (computation): For D^× with D a quaternion division algebra over a p-adic F, an inner form of GL_2, e(D^×) = −1; more generally e(GL_m(D)) = (−1)^{n − m} for D central division of degree d over F and n = md.
- `kottwitzSign_compact_real` (computation): For the compact form U(n) of the quasi-split unitary group over ℝ, e(U(n)) = (−1)^{q(U*(n)) − q(U(n))} = (−1)^{⌊n/2⌋}.
- `kottwitzSign_product` (characterisation): For a quaternion algebra B over ℚ, ∏_v e(B_v^×) = (−1)^{#ramified places} = 1, recovering that a quaternion algebra over ℚ ramifies at an even number of places.
- `kottwitzSign_not_rank_parity` (non-example): e(G) is not (−1)^{rank G}: for GL_2 and its inner form D^× both have absolute rank 2 but e differs.

**Acceptance.**

- e(G*) = 1; e(D^×) = −1 for a quaternion division algebra D; e(GL_m(D)) = (−1)^{n−m}.
- For the compact unitary group U(n) over ℝ, e = (−1)^{⌊n/2⌋}.
- For a quaternion algebra over ℚ, the product of local signs is 1.

*Used by:* ET.1/kappa-and-stable-orbital-integrals (stable orbital integrals carry the factor e(G_γ) on each rational class); ET.3/inner-form-transfer (transfer from an inner form to its quasi-split form carries e(G)); GL2AutomorphicRepresentationsAndTransfer:R17.2/quaternionic-orbital-matching (the rank-two sign of quaternionic matching).

*Needs:* `ET.0/kottwitz-duality`; `ET.0/inner-twist`; `ReductiveGroupsPartII:RG2.5/langlands-dual-group`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

### ET.0.8 Inner twists and the quasi-split inner form

Node `ET.0/inner-twist` (definition).

Let F be a field of characteristic 0 and G, G′ connected reductive groups over F. An inner twist is an F̄-isomorphism ψ : G_F̄ → G′_F̄ such that ψ⁻¹∘σ(ψ) is an inner automorphism of G_F̄ for every σ ∈ Γ_F; σ ↦ ψ⁻¹∘σ(ψ) is a 1-cocycle with values in G_ad(F̄), and inner twists up to equivalence (ψ ~ Int(g′)∘ψ∘Int(g) with g ∈ G(F̄), g′ ∈ G′(F̄)) are in bijection with H^1(F, G_ad); every class arises. Every G has a unique quasi-split inner form G* up to isomorphism. An inner twist ψ transports: (i) semisimple and strongly regular semisimple elements, and their stable conjugacy classes, from G′(F) to G*(F̄) — a stable class of G′ that is defined over F gives an F-rational stable class of G*; (ii) maximal F-tori: every maximal F-torus T′ ⊆ G′ transfers to G*, i.e. there is an F-torus T* ⊆ G* and g ∈ G*(F̄) with Int(g)∘ψ|_{T′} defined over F (Steinberg and Kottwitz: quasi-split groups contain a transfer of every maximal torus of every inner form). (iii) Centralizers: for γ′ ∈ G′(F) strongly regular with image γ* (rational, by Kottwitz's rationality theorem when G*_der is simply connected, and after a z-extension in general), ψ induces an inner twist of the centralizers G′_{γ′} → G*_{γ*}, an F-isomorphism of tori in the strongly regular case.

The precise hypotheses are: F of characteristic 0; G, G′ connected reductive over F.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Définition 1.7.1 (p. 37), proof of Théorème 2.4.2 (pp. 55–56)). Inner forms of a quasi-split G* are in bijection with H^1(F, G*_ad); Kottwitz's rationality theorem for quasi-split groups with simply connected derived group, extended to general groups through z-extensions.

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5, §§2, 3.4 (extraction item P13)). An inner twist ψ : G_F̄ → G′_F̄ has ψ⁻¹σ(ψ) inner for all σ.

([S. Leslie, The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3), §2.2.1, Definition 2.6 (p. 17)). Jacquet–Langlands transfers of regular semisimple Hermitian elements between two unitary groups are an instance of transport of stable classes under an inner twist.

Classification by H^1(F, G_ad): standard twisting (ET.0/crossed-module-galois-cohomology, nonabelian H^1 with twisted coefficients) applied to the automorphism group of G and its inner part G_ad (Labesse Définition 1.7.1 uses this bijection).

Quasi-split inner form: existence and uniqueness via a pinning and the splitting of Aut(G) → Out(G) (upstream ReductiveGroups Layer 7/9 pinnings).

Transfer of tori and of rational stable classes: Steinberg's theorem that a quasi-split group with simply connected derived group has a rational point in every F-rational stable (geometric) semisimple class (cited as Kottwitz 1982, Theorem 4.4 in Labesse's proof of Théorème 2.4.2), reduced to that case by a z-extension (ReductiveGroupsPartII:RG2.1/z-extension-existence) and Hilbert 90 for the induced central torus.

Centralizers: ψ restricted to the centralizer is defined over F up to an inner automorphism of an abelian group, hence defined over F in the strongly regular case.

The definition exposes the following operations and relations.

- `TauCeti.InnerTwist` (data): An inner twist (G′, ψ) of G.
- `TauCeti.InnerTwist.cohomologyClass` (projection): The class of ψ in H^1(F, G_ad).
- `TauCeti.InnerTwist.equiv_of_class_eq` (extensionality): Inner twists with the same class are equivalent.
- `TauCeti.InnerTwist.quasiSplitForm` (constructor): The quasi-split inner form G* with an inner twist G* → G.
- `TauCeti.InnerTwist.transferTorus` (constructor): For a maximal F-torus T′ of G′, an F-torus T* ⊆ G* and an admissible isomorphism T′ ≅ T* induced by ψ.
- `TauCeti.InnerTwist.mapStableClass` (functoriality): The induced injection from F-rational stable strongly regular classes of G′ to those of G*.
- `TauCeti.InnerTwist.comp` (functoriality): Composition of inner twists, with the class of the composite the product class.

**Checks.**

- `innerTwist_gl2_quaternion` (computation): Over a p-adic field the inner forms of GL_2 are GL_2 and D^× for the quaternion division algebra D; H^1(F, PGL_2) = ℤ/2.
- `innerTwist_quasiSplit_unique` (characterisation): Two quasi-split inner forms of G are isomorphic over F.
- `innerTwist_torus` (degenerate): A torus has no nontrivial inner twists (T_ad = 1).
- `innerTwist_not_all_forms` (non-example): The outer form U(n) of GL_n attached to a quadratic extension is not an inner twist of GL_n for n ≥ 2: ψ⁻¹σ(ψ) involves transpose-inverse.

**Acceptance.**

- The inner forms of GL_2 over a p-adic field are GL_2 and D^×, classified by H^1(F, PGL_2) = ℤ/2.
- Every maximal torus of D^× transfers to an elliptic maximal torus of GL_2.
- Tori have no nontrivial inner twists.

*Used by:* ET.0/rational-classes-in-stable-class (rational classes in a stable class are compared across inner forms); ET.0/kottwitz-sign (the sign is a function of the inner twist class); ET.3/inner-form-transfer (transfer between an inner form and its quasi-split form); Waldspurger 2006, Introduction (the family of inner forms G_d indexed by H^1(Gal(F^mod/F), G^mod)).

*Needs:* `ET.0/crossed-module-galois-cohomology`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`; `ReductiveGroupsPartII:RG2.1/z-extension-existence`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`.

### ET.0.9 Rational, geometric and stable conjugacy of semisimple elements

Node `ET.0/semisimple-conjugacy` (definition).

Let F be a field of characteristic 0 and G connected reductive over F. For semisimple δ ∈ G(F) let G_δ be its centralizer and G_δ^0 the identity component; δ is regular if G_δ^0 is a torus and strongly regular if G_δ is abelian (then G_δ = T_δ is a maximal torus). Two semisimple δ, δ′ ∈ G(F) are rationally conjugate if δ′ = g⁻¹δg with g ∈ G(F), geometrically conjugate if this holds with g ∈ G(F̄). Following Labesse, let T_δ be the maximal torus of the centre of the centralizer in G of G_δ^0, and let the stable centralizer I_δ be the subgroup of G_δ generated by G_δ^0 and the δ-invariants (T_δ)^δ; I_δ = G_δ^0 when G_der is simply connected (Steinberg's connectedness theorem) and in the situations of ordinary endoscopy with G_der simply connected and of cyclic base change. Then δ′ is stably conjugate to δ if δ′ = x⁻¹δx with x ∈ G(F̄) and the cocycle a_σ = x σ(x)⁻¹ takes values in I_δ for every σ ∈ Γ_F. For strongly regular δ, stable conjugacy is geometric conjugacy by an element x with x σ(x)⁻¹ ∈ T_δ, i.e. conjugacy over F̄ such that the induced isomorphism T_δ → T_δ′ is defined over F. Stable conjugacy is an equivalence relation on semisimple elements of G(F), coarser than rational and finer than geometric conjugacy. The same definitions apply to the Lie algebra 𝔤(F) (regular semisimple X with centralizer a maximal torus, stable conjugacy by G(F̄) with defined-over-F induced isomorphism) and, with θ-conjugacy x⁻¹δθ(x), to a twisted space L = Gθ (Labesse §2.3, Waldspurger 2008 §3.1).

The precise hypotheses are: F of characteristic 0; G connected reductive (for the twisted version, a connected component L of a reductive G⁺ with identity component G having a rational point).

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §2.3, Définitions 2.3.1 and 2.3.4, Lemmes 2.3.2 and 2.3.3 (pp. 52–54)). Regular and strongly regular semisimple elements, the stable centralizer I_δ generated by the identity component and the invariants of the central torus, and stable conjugacy defined by the condition that x σ(x)⁻¹ lies in I_δ.

([R. E. Kottwitz, Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), Introduction (p. 366) and §3 (pp. 377–378)). Stable conjugacy of semisimple elements and the parametrization of the rational classes in a stable class by ker[H^1(F, I) → H^1(F, G)].

([T. C. Hales, A statement of the fundamental lemma](https://arxiv.org/abs/math/0312227v2), §5, Definition 5.1 (PDF p. 7)). Two strongly regular elements are stably conjugate if they are conjugate by an element of G(F̄).

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.3 (pp. 8–9) and §3.1 (p. 24)). Strongly regular elements of a twisted space and stable conjugacy as conjugacy by G (for strongly regular elements), with the twisted action on H_z.

Connectedness: Steinberg's theorem that the fixed points of a semisimple automorphism of a simply connected group are connected gives I_δ = G_δ^0 when G_der is simply connected (Labesse Définition 2.3.1 and the remark following it; Lemme 2.3.3 for base change).

Equivalence relation: the cocycle of a composite is the twisted product of the cocycles, and inverses give inverse cocycles; values stay in I_δ because conjugation by x identifies I_δ with I_δ′ (Labesse Définition 2.3.4).

The Lie algebra version is identical with Ad in place of conjugation (Ngô §1.7 uses stable classes in 𝔤 parametrized by 𝔠(F)).

The definition exposes the following operations and relations.

- `TauCeti.IsStronglyRegular` (data): δ semisimple with abelian centralizer.
- `TauCeti.stableCentralizer` (constructor): The stable centralizer I_δ ⊆ G_δ.
- `TauCeti.StablyConj` (data): The stable conjugacy relation on semisimple elements of G(F).
- `TauCeti.StablyConj.equivalence` (structure): Stable conjugacy is an equivalence relation.
- `TauCeti.StablyConj.of_conj` (relation): Rational conjugacy implies stable conjugacy.
- `TauCeti.StablyConj.geomConj` (relation): Stable conjugacy implies geometric conjugacy.
- `TauCeti.stableCentralizer_eq_of_simplyConnected` (simp): If G_der is simply connected, I_δ = G_δ^0.
- `TauCeti.StablyConj.map` (functoriality): Normal homomorphisms and inner twists map stable classes to stable classes.
- `TauCeti.StablyConj.lie` (other): The Lie-algebra version on regular semisimple elements of 𝔤(F), compatible with the exponential near 0.

**Checks.**

- `stableConj_gln` (compatibility): For G = GL_n, two semisimple elements of GL_n(F) are stably conjugate iff they have the same characteristic polynomial iff they are GL_n(F)-conjugate.
- `stableConj_sl2_elliptic` (computation): For G = SL_2 over a p-adic F and E/F quadratic, the element of SL_2(F) acting on E = F² by multiplication by u ∈ E^1 \ {±1} and its conjugate by diag(a, 1) with a ∉ N E^× are stably conjugate but not SL_2(F)-conjugate.
- `stableConj_torus` (degenerate): For G = T a torus, stable conjugacy is equality.
- `stableConj_not_geometric` (non-example): In PGL_2(F), the images of diag(1, −1) and of the matrix with rows (0, 1) and (a, 0), a ∉ F^{×2}, are geometrically conjugate (both are involutions), but the identity components of their centralizers are a split and a nonsplit torus, so they are not stably conjugate.

**Acceptance.**

- In GL_n stable conjugacy, rational conjugacy and equality of characteristic polynomials agree for semisimple elements.
- In SL_2 over a p-adic field a regular elliptic stable class contains two rational classes.
- In PGL_2 geometric conjugacy of involutions does not imply stable conjugacy.

*Used by:* ET.0/rational-classes-in-stable-class (the parametrization of rational classes in a stable class); ET.1/kappa-and-stable-orbital-integrals (stable orbital integrals sum over the rational classes of a stable class); ET.2b/chevalley-quotient (stable classes of regular semisimple elements of 𝔤 are the F-points of 𝔠^rs); Leslie, §2.2.2 (stable classes of regular semisimple Hermitian elements form a torsor under D(T_y/F)).

*Needs:* `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

### ET.0.10 Rational classes inside a stable class ★

Node `ET.0/rational-classes-in-stable-class` (theorem).

Let F be a field of characteristic 0, G connected reductive over F, δ ∈ G(F) semisimple and I = I_δ its stable centralizer. (a) Sending δ′ = x⁻¹δx (stably conjugate) to the class of σ ↦ x σ(x)⁻¹ gives a bijection between the G(F)-conjugacy classes in the stable class of δ and the image of D(I, G; F) := ker[H^1(F, I) → H^1(F, G)] in ker[H^1(F, G_δ) → H^1(F, G)]; when I = G_δ (e.g. δ strongly regular, or G_der simply connected and G_δ connected) the conjugacy classes are in bijection with D(I, G; F), and the class of (δ, δ′) is denoted inv(δ, δ′). (b) If F is local, D(I, G; F) is finite, and when I = T is a torus it is a finite abelian group; then D(T, G; F) ⊆ E(T, G; F) := ker[H^1(F, T) → H^1_ab(F, G)], with equality if F is nonarchimedean; and for nonarchimedean F, via ET.0/tate-nakayama-tori and ET.0/kottwitz-duality, E(T, G; F) is Pontryagin dual to Kottwitz's 𝔎(T/F) = π_0((T̂/Z(Ĝ))^Γ), so that characters κ of E(T, G; F) are given by Γ-invariant elements of T̂/Z(Ĝ) up to the identity component. (c) (Steinberg's relatedness lemma) If F is a p-adic field and δ, δ′ are strongly regular and stably conjugate, they are conjugate over the completed maximal unramified extension F̆, because H^1(F̆, T) = 0. (d) (Rationality) If G is quasi-split and G_der is simply connected, every stable (= geometric) semisimple class of G(F̄) that is stable under Γ_F contains an element of G(F). (e) For a proper Levi subgroup M of G, the rational classes in a stable class of M may differ from those of G: inv is compatible with M ⊆ G through H^1(F, I^M) → H^1(F, I^G).

The precise hypotheses are: F of characteristic 0 (local for (b), p-adic for (c)); G connected reductive; for (d): G quasi-split with simply connected derived group.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §2.3 after Définition 2.3.4 (pp. 53–54); proof of Théorème 2.4.2 (p. 56)). The stable class of δ is the image of H^0(F, I\G); the rational classes inside it are parametrized by the image of D(I, G; F) = ker[H^1(F, I) → H^1(F, G)]; rational points in rational stable classes of quasi-split groups with simply connected derived group (Kottwitz).

([R. E. Kottwitz, Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), Introduction (p. 366); §4.1–4.6, definitions of 𝔇, 𝔈, 𝔎 (pp. 378–379)). The conjugacy classes within a stable class correspond to ker[H^1(F, I) → H^1(F, G)]; 𝔇(I/F) ⊆ 𝔈(I/F) and the dual group 𝔎(I/F).

([D. Hansen, T. Kaletha and J. Weinstein, On the Kottwitz conjecture for local shtuka spaces](https://arxiv.org/abs/1709.06651v4), arXiv v4, Lemma 3.2.1 (p. 17)). Strongly regular elements conjugate over an algebraic closure of F̆ are conjugate over F̆, by Steinberg (extraction item PAPER-HANSEN-KALETHA-WEINSTEIN-22/021).

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5, Fact 3.4 (p. 13) (extraction item P10)). Finiteness of the rigid cohomology set; the ordinary finiteness of H^1(Γ, H(F̄)) for linear algebraic groups over ℝ or p-adic fields is Borel–Serre's theorem as used there.

(a) Labesse §2.3 after Définition 2.3.4: the pair (x, a) gives a class in H^0(F, I\G), whose image in H^1(F, I) lies in D(I, G; F); the fibres of H^0(F, I\G) → G(F) are the kernels displayed there, giving the parametrization through the image in ker[H^1(F, G_δ) → H^1(F, G)] (also Kottwitz 1986 Introduction and §4.1).

(b) Finiteness: local H^1 of linear algebraic groups is finite (Kaletha Lemma 3.4, extraction item P10); E(T, G; F) is the abelianized kernel and the comparison with D uses ET.0/abelianization-theorems (b); the duality with K(T, G; F) is ET.0/tate-nakayama-tori (a) and ET.0/kottwitz-duality (a) (Kottwitz 1986 §4).

(c) Steinberg: H^1(F̆, T) = 0 for every torus over F̆ (ReductiveGroupsPartII:RG2.1/steinberg-quasi-split, which states that H^1(L, H) = 1 for connected reductive H over the completed maximal unramified extension); conjugacy over F̄ by x with xσ(x)⁻¹ ∈ T and vanishing of the class over F̆ give conjugacy over F̆ (Hansen–Kaletha–Weinstein Lemma 3.2.1).

(d) Kottwitz 1982 Theorem 4.4 as cited by Labesse in the proof of Théorème 2.4.2; the transfer of tori in ET.0/inner-twist (ii) is the same argument.

(e) Functoriality of H^1 for M ⊆ G; example in the acceptance tests.

**Acceptance.**

- G = GL_n: D(T, GL_n; F) = 0 for every maximal torus T (Hilbert 90 and Shapiro), so stable = rational conjugacy.
- G = SL_2 over p-adic F, T elliptic attached to quadratic E/F: D(T, SL_2; F) = H^1(F, T) = F^×/N E^× ≅ ℤ/2, two rational classes in each regular stable class of T; for T split, D = 0.
- Split torus T = G: D(T, T; F) = 0.
- Nonsplit unitary group G = U(1, 1) attached to E/F with T ≅ U(1) × U(1) elliptic: H^1(F, T) = (ℤ/2)², H^1_ab(F, G) = ℤ/2 and D(T, G; F) = E(T, G; F) = ker of the sum map, of order 2 (Leslie Lemma 1.8 pattern with S_1 = {1, 2}).
- Proper Levi with different rational classes in one stable class: in G = Sp_4 over p-adic F, the Levi M ≅ GL_1 × SL_2 contains elliptic elements of its SL_2 factor whose stable class splits into two M(F)-classes, as for SL_2 above.

*Needs:* `ET.0/semisimple-conjugacy`; `ET.0/abelianized-cohomology`; `ET.0/abelianization-theorems`; `ET.0/tate-nakayama-tori`; `ET.0/kottwitz-duality`; `ET.0/inner-twist`; `ET.0/crossed-module-galois-cohomology`; `ReductiveGroupsPartII:RG2.1/steinberg-quasi-split`.

### ET.0.11 The global obstruction for adelic stable classes

Node `ET.0/global-kottwitz-obstruction` (theorem).

Let F be a number field, G connected reductive over F, γ_0 ∈ G(F) semisimple with stable centralizer I_0 (a connected reductive group when G_der is simply connected), and γ = (γ_v)_v ∈ G(𝔸_F) an adelic element with γ_v stably conjugate to γ_0 in G(F_v) for every v and conjugate to γ_0 in G(𝒪_v) for almost all v. Let inv_v(γ_0, γ_v) ∈ D(I_0, G; F_v) be the local invariants (ET.0/rational-classes-in-stable-class) and α_v their images in A(I_0/F_v) := π_0(Ẑ(Î_0)^{Γ_v})^D. (a) Let 𝔎(I_0/F) be the group of κ ∈ π_0((Z(Î_0)/Z(Ĝ))^Γ) whose image in H^1(F, Z(Ĝ)) is locally trivial; almost all α_v vanish, and obs(γ) ∈ 𝔎(I_0/F)^D is the character κ ↦ ∏_v α_v(κ_v) of the localizations κ_v. (b) If G_sc has no E_8 factor, γ is G(𝔸_F)-conjugate to an element of G(F) stably conjugate to γ_0 if and only if obs(γ) is trivial (Kottwitz 1986, Theorem 6.6; the E_8 restriction comes from the Hasse principle, which is now known for E_8 by Chernousov, so it can be removed). (c) For κ ∈ 𝔎(I_0/F), ⟨obs(γ), κ⟩ = ∏_v ⟨inv_v(γ_0, γ_v), κ_v⟩, the product formula used to stabilize the elliptic terms; the number of G(F)-classes in G(F) ∩ (stable class of γ_0) adelically conjugate to γ is |ker^1(F, I_0)|-weighted as in Kottwitz 1986 §9.

The precise hypotheses are: F a number field; G connected reductive; for (b) G_sc without E_8 factors (removable by Chernousov's Hasse principle for E_8).

([R. E. Kottwitz, Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), §6.1–6.6 (pp. 381–382), Lemma 6.3 and Theorem 6.6 (p. 382); §6.10.1 (p. 384); §9 (pp. 391–396)). The obstructions obs_1(γ) and obs(γ) ∈ 𝔎(I_0/F)^D; γ is G(𝔸)-conjugate to a rational element iff obs(γ) is trivial (assuming no E_8 factors); the pairing ⟨obs(γ), κ⟩ used in the stabilization of the elliptic terms.

([S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §4.2, Definition 4.2 and (4.1)–(4.2) (pp. 13–14)). Shin's Kottwitz triples and the Kottwitz invariant α(γ_0; γ, δ) ∈ 𝔎(I_0/ℚ)^D, which consume this obstruction theory.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Théorème 1.6.9 (p. 33)). The Hasse principle for simply connected groups including type E_8 (Chernousov).

Construct obs_1(γ) first using G_sc(𝔸)-conjugacy and the Hasse principle for G_sc (Kottwitz 1986 §6.1–6.3, Lemma 6.3), then pass to obs(γ) using the global duality ker^1(F, I_0) ≅ ker^1(F, Z(Î_0))^D of ET.0/kottwitz-duality (b) and Tate–Nakayama for the global-mod-local cohomology (ET.0/tate-nakayama-tori (b)).

The criterion (b) is Kottwitz 1986 Theorem 6.6; the Hasse principle input is ET.0/abelianization-theorems (c), which includes E_8 (Labesse Théorème 1.6.9).

The product formula (c) is the definition of the pairing in §6.10.1 of Kottwitz 1986 combined with the local duality of ET.0/kottwitz-duality (a).

**Acceptance.**

- For G = GL_n every adelic element stably conjugate everywhere to γ_0 ∈ GL_n(F) is G(𝔸)-conjugate to γ_0 (obs is trivial because 𝔎(I_0/F) = 1 for centralizers that are products of restrictions of scalars of GL's).
- For G = SL_2 and γ_0 regular elliptic with splitting field E: the local invariants lie in ℤ/2 at each place nonsplit in E, and obs(γ) is their sum; an adelic element whose invariants are nontrivial at exactly one place is not conjugate to a rational element.

*Needs:* `ET.0/rational-classes-in-stable-class`; `ET.0/kottwitz-duality`; `ET.0/tate-nakayama-tori`; `ET.0/abelianization-theorems`; `ArithmeticGaloisDuality:R02.3/localisation-maps`.

### ET.0.12 Unramified Galois cohomology of reductive models

Node `ET.0/unramified-local-cohomology` (theorem).

Let G be a connected reductive group over ℚ_p with a reductive model G_{ℤ_p} (smooth affine with connected reductive special fibre), and L = ℚ_p^ur. (a) (Lang) H^1(Gal(L/ℚ_p), G_{ℤ_p}(ℤ_p^ur)) = 1, i.e. every G_{ℤ_p}-torsor over ℤ_p is trivial; the same holds for every smooth affine ℤ_p-group with connected fibres, and over ℤ_ℓ. (b) (Integral z-extensions) A reductive group G_{ℤ_(p)} over ℤ_(p) admits a z-extension G_{1,ℤ_(p)} → G_{ℤ_(p)}: a surjection of reductive ℤ_(p)-groups whose kernel is a central induced torus and with G_1^der simply connected. (c) (Kernel of the Kottwitz homomorphism on unramified points) Let ρ : G̃ → G be the simply connected cover of the derived group and κ̃_G : G(L) → π_1(G) the Kottwitz homomorphism (ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism, with I acting trivially since G is unramified). Then ρ(G̃(L))·G_{ℤ_p}(ℤ_p^ur) = ker κ̃_G, a normal subgroup; its intersection with G(ℚ_p) is ρ(G̃(ℚ_p))·G_{ℤ_p}(ℤ_p) = ker(κ̃_G|_{G(ℚ_p)}); and a class in G(L)/ρ(G̃(L))G_{ℤ_p}(ℤ_p^ur) whose κ̃_G-image is Frobenius invariant contains an element of G(ℚ_p).

The precise hypotheses are: G_{ℤ_p} a reductive model (connected special fibre); for (b): G_{ℤ_(p)} reductive over ℤ_(p).

([M. Kisin, Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf), footnote 20 (p. 54); Proposition (3.6.7) (p. 56) and its proof (p. 57); Proposition (3.6.10) and its proof (p. 58); Lemma (3.6.2) (p. 53) and the Cartan-decomposition step of its proof (p. 54); (3.6.8)–(3.6.9) (p. 58)). Lang's lemma for smooth connected integral groups; integral z-extensions; the kernel of κ̃_G on unramified and rational points (extraction items lang-lemma-integral, z-extension-integral, kappa-kernel-unramified-points).

([M. Kisin, Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf), Corollary (2.3.5) and its proof (p. 34)). Steinberg's theorem H^1(ℚ_p^ur, H) = 0 for connected linear H, used together with Lang (extraction item steinberg-theorem; supplied by ReductiveGroupsPartII:RG2.1/steinberg-quasi-split).

(a) Lang's theorem for the connected special fibre (ReductiveGroupsPartII:RG2.3/lang-theorem) gives a section mod p; smoothness and Hensel's lemma lift it (Kisin footnote 20 and proofs of Proposition 3.6.7, Lemma 3.8.2, extraction item lang-lemma-integral).

(b) Kottwitz's construction of z-extensions over fields (ReductiveGroupsPartII:RG2.1/z-extension-existence) carried out with an induced torus split over an unramified extension so that it extends to ℤ_(p) (Kisin, proof of Proposition 3.6.10, citing Kottwitz 'Shimura varieties and λ-adic representations' §1; extraction item z-extension-integral).

(c) The Cartan decomposition for the hyperspecial subgroup G_{ℤ_p}(ℤ_p^ur) of G(L) (ReductiveGroupsPartII:RG2.3/hyperspecial-vertices and RG2.4) shows that G(L) = ⊔ over dominant cocharacters of double cosets, and κ̃_G is the image of the cocharacter in π_1(G); its kernel is generated by ρ(G̃(L)) and the hyperspecial subgroup. Intersecting with G(ℚ_p) uses (a) and Kneser's vanishing (ET.0/abelianization-theorems (a)); the last assertion uses Lang's theorem for the Frobenius-twisted action (Kisin, proof of Lemma 3.6.2(2), extraction item kappa-kernel-unramified-points).

**Acceptance.**

- For G = GL_n: κ̃_G = val ∘ det, its kernel is SL_n(L)·GL_n(ℤ_p^ur) and the rational points of the kernel are SL_n(ℚ_p)·GL_n(ℤ_p) = {g : val det g = 0}.
- For G = G_m: H^1(Gal(L/ℚ_p), ℤ_p^{ur,×}) = 1 (the unit group is cohomologically trivial for unramified extensions).

*Needs:* `ReductiveGroupsPartII:RG2.3/lang-theorem`; `ReductiveGroupsPartII:RG2.1/z-extension-existence`; `ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism`; `ReductiveGroupsPartII:RG2.3/hyperspecial-vertices`; `ReductiveGroupsPartII:RG2.4/cartan-decomposition`; `ET.0/abelianization-theorems`.

### ET.0.13 Endoscopic data, twisted endoscopic data and their isomorphisms ★

Node `ET.0/endoscopic-datum` (definition).

Let F be a local or global field of characteristic 0, W_F its Weil group, G connected reductive over F, θ an F-automorphism of G (quasi-semisimple, i.e. preserving a Borel pair over F̄), ω a character of G(F) (local) or of G(𝔸_F)/G(F) (global) with class a_ω ∈ H^1(W_F, Z(Ĝ)) (Langlands' correspondence for characters, recalled by Waldspurger 2008 §1.3), Ĝ the dual group with a Γ-stable pinning (B̂, T̂, {X_α}) and ^LG = Ĝ ⋊ W_F (ReductiveGroupsPartII:RG2.5/l-group), θ̂ the dual automorphism of Ĝ preserving the pinning and ^Lθ = θ̂ × id. An endoscopic datum for (G, θ, ω) is a quadruple (H, ℋ, s, ξ) with: (1) H a quasi-split connected reductive group over F; (2) ℋ a split extension of W_F by Ĥ whose induced outer action of W_F on Ĥ is the one given by H; (3) s ∈ Ĝ such that Int(s)∘θ̂ is semisimple; (4) ξ : ℋ → ^LG a continuous injective homomorphism over W_F such that (a) there is a 1-cocycle a : W_F → Z(Ĝ) of class a_ω with s ^Lθ ξ(h) = a(h) ξ(h) s ^Lθ for all h ∈ ℋ, and (b) ξ restricts to an isomorphism of Ĥ onto the identity component Z_Ĝ(s ^Lθ)^0 of the centralizer of s θ̂. Ordinary endoscopic data are the case θ = 1, ω = 1, written (H, ℋ, s, ξ) with s ∈ Ĝ semisimple (Langlands–Shelstad §1.2; for G_der simply connected one may take ℋ = ^LH). An isomorphism (H, ℋ, s, ξ) → (H′, ℋ′, s′, ξ′) is g ∈ Ĝ with g ξ(ℋ) g⁻¹ = ξ′(ℋ′) and g s ^Lθ g⁻¹ ∈ Z(Ĝ) s′ ^Lθ; Out(H, ℋ, s, ξ) is the group of automorphisms modulo ξ(Ĥ). In the ordinary global or local case the datum is elliptic if ξ(Z(Ĥ)^Γ)^0 ⊆ Z(Ĝ); E(G) and E_ell(G) denote sets of representatives of isomorphism classes (resp. elliptic ones); for F local E_ell(G) is finite. Endoscopic triples (H, s, η) (Kottwitz's convention, used by Shin) are the data with ℋ = ^LH and η = ξ|_Ĥ when G_der is simply connected. For a Levi subgroup M ⊆ G with ^LM ⊆ ^LG (ReductiveGroupsPartII:RG2.5/l-group-levi-embedding), an endoscopic datum (M_H, ℳ, s, ξ_M) for M induces one for G with H ⊇ M_H as a Levi, by taking the centralizer of s in Ĝ.

The precise hypotheses are: F local or global of characteristic 0; G connected reductive, θ quasi-semisimple, ω a character.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.3 (pp. 8–10)). The quadruple (H, ℋ, s, ξ̂) with conditions (1)–(4)(b) for a twisted triple (G, θ, ω), the notion of isomorphism, the associated map from conjugacy classes in H to θ-conjugacy classes in G and the strongly G-regular elements.

([R. P. Langlands and D. Shelstad, On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf), §1.2 (p. 224)). Endoscopic data (H, ℋ, s, ξ) for ordinary endoscopy with conditions (i)–(iv).

([R. Kottwitz and D. Shelstad, On splitting invariants and sign conventions in endoscopic transfer](https://arxiv.org/abs/1201.5658v1), §5.1 (PDF p. 12)). Standard endoscopic data (H, s, ξ) with ξ an L-homomorphism ^LH → ^LG, and the observation that (H, s⁻¹, ξ) is again endoscopic data (p. 13).

([R. E. Kottwitz, Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), §3 (p. 377); §7 (pp. 385–390)). Endoscopic triples (H, s, η) as in Kottwitz's earlier paper, and the local finiteness results.

The definition is Waldspurger 2008 §1.3 (twisted, after Kottwitz–Shelstad Chapter 2) specialising to Langlands–Shelstad §1.2 for θ = 1, ω = 1.

Finiteness of E_ell(G) for local F: an elliptic s is determined up to Z(Ĝ) and Ĝ-conjugacy by finitely many choices because Z_Ĝ(s)^0 has semisimple rank at most that of Ĝ and the elliptic condition bounds s modulo Z(Ĝ) to a finite set of torsion classes (Kottwitz 1986 §7, Proposition 7.1–7.5 for the local finiteness results).

Induction from Levi subgroups: Z_Ĝ(s)^0 ⊇ Z_M̂(s)^0 and the Levi embedding of L-groups transports ξ_M (Kottwitz 1986 §7; Waldspurger 2008 §1.3 for the twisted case).

The definition exposes the following operations and relations.

- `TauCeti.EndoscopicDatum` (data): The structure (H, ℋ, s, ξ) for (G, θ, ω).
- `TauCeti.EndoscopicDatum.Iso` (data): Isomorphisms of endoscopic data, a groupoid.
- `TauCeti.EndoscopicDatum.out` (data): Out(e) = Aut(e)/ξ(Ĥ).
- `TauCeti.EndoscopicDatum.IsElliptic` (data): ξ(Z(Ĥ)^Γ)^0 ⊆ Z(Ĝ).
- `TauCeti.EndoscopicDatum.finite_elliptic` (other): For F local the set of isomorphism classes of elliptic data is finite.
- `TauCeti.EndoscopicDatum.ofLevi` (constructor): Induction of a datum of a Levi M to G.
- `TauCeti.EndoscopicDatum.principal` (constructor): The principal datum (G*, ^LG, 1, id) for ordinary endoscopy.
- `TauCeti.EndoscopicDatum.inv_s` (relation): (H, ℋ, s⁻¹, ξ) is again a datum, isomorphic in the ordinary case.
- `TauCeti.EndoscopicDatum.map_innerTwist` (functoriality): Data of G and of an inner form G′ coincide (they depend on ^LG only).
- `TauCeti.EndoscopicDatum.triple` (equivalence): When G_der is simply connected, data with ℋ = ^LH correspond to endoscopic triples (H, s, η).

**Checks.**

- `EndoscopicDatum.gln_elliptic` (computation): For G = GL_n (ordinary endoscopy), E_ell(G) = {(GL_n, ^LGL_n, 1, id)}: an elliptic s must be central because Z_Ĝ(s)^0 is a Levi subgroup of GL_n(ℂ) whose centre is too big otherwise.
- `EndoscopicDatum.sl2` (computation): For G = SL_2 over a p-adic F, the elliptic endoscopic data are G itself and, for each quadratic extension E/F, the torus H = R^1_{E/F} G_m with s = diag(1, −1) ∈ PGL_2(ℂ).
- `EndoscopicDatum.torus` (degenerate): For G = T a torus the only datum up to isomorphism is (T, ^LT, 1, id), and Out is trivial.
- `EndoscopicDatum.unitary` (compatibility): For G = U(n) quasi-split attached to E/F and n = n_1 + n_2, (U(n_1) × U(n_2), s = diag(1_{n_1}, −1_{n_2}), ξ) is an elliptic datum, ξ depending on a character of E^× extending the quadratic character of E/F raised to a power determined by the parities of n_1, n_2 (Rogawski; Shin §3.2).
- `EndoscopicDatum.not_any_centralizer` (non-example): For G = SL_2, s = diag(1, −1) with ℋ = Ĥ × W_F (split torus action) gives a datum that is not elliptic (Z(Ĥ)^Γ = Ĥ is not in Z(Ĝ)), so it does not contribute to the elliptic part of the stable trace formula.

**Acceptance.**

- E_ell(GL_n) consists of GL_n alone.
- E_ell(SL_2) over a p-adic field with p odd consists of SL_2 and the three norm-one tori.
- For quasi-split U(n), the data U(n_1) × U(n_2) with s = diag(1, −1) are elliptic.

*Used by:* ET.0/norm-correspondence (the datum defines the map from stable classes of H to (θ-)stable classes of G); ET.1/local-transfer-factor (transfer factors are attached to an endoscopic datum and a z-pair); Shin 2011, §3.2; Caraiani–Scholze non-compact §5.2 (E_ell(G_n) for unitary similitude groups); ET.4 (twisted unitary trace formula) (twisted endoscopic data of the base-change twisted space); AutomorphicSpectralTheory:AS.2 (packet carriers are indexed by parameters, not by these data; the request for classical-group packet carriers is a Part II matter).

*Needs:* `ReductiveGroupsPartII:RG2.5/langlands-dual-group`; `ReductiveGroupsPartII:RG2.5/galois-action-on-dual-group`; `ReductiveGroupsPartII:RG2.5/l-group`; `ReductiveGroupsPartII:RG2.5/l-group-levi-embedding`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

### ET.0.14 z-pairs for endoscopic data

Node `ET.0/z-pair` (definition).

Let (H, ℋ, s, ξ) be an endoscopic datum for (G, θ, ω) over a field F of characteristic 0. A z-pair is a triple (H_1, ξ_1, ξ̂_1) with: (1) H_1 a quasi-split connected reductive group over F with simply connected derived group; (2) ξ_1 : H_1 → H a surjective homomorphism whose kernel Z_1 is a central induced torus (so H_1 → H is a z-extension in the sense of ReductiveGroupsPartII:RG2.1/z-extension); (3) ξ̂_1 : ℋ → ^LH_1 an injective homomorphism over W_F whose restriction to Ĥ is the dual of ξ_1. Because Z_1 is induced, H_1(F) → H(F) is surjective. The composite W_F → ℋ → ^LH_1 → ^LZ_1 → Ẑ_1 (for any section W_F → ℋ) is a 1-cocycle whose class is independent of the section; it defines a character λ_1 of Z_1(F) (of Z_1(𝔸_F)/Z_1(F) globally). Transfer to H is replaced by transfer to functions on H_1(F) that transform under Z_1(F) by λ_1^{-1}. z-pairs exist for every endoscopic datum (Kottwitz–Shelstad §2.2).

The precise hypotheses are: (H, ℋ, s, ξ) an endoscopic datum over F of characteristic 0.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.4 (pp. 10–11)). Definition of a z-pair (H_1, ξ_1, ξ̂_1), surjectivity of H_1(F) → H(F), the character λ_1 of Z_1(F) and the existence of z-pairs after Kottwitz–Shelstad §2.2.

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5, §5.3, pp. 33–35 (extraction item D30)). Ordinary endoscopy with z-pairs (H_z, η_z) with induced central torus kernel and the required L-embedding.

Existence: take a z-extension H_1 → H (ReductiveGroupsPartII:RG2.1/z-extension-existence); since H_1 has simply connected derived group, ℋ embeds into ^LH_1 extending the dual inclusion Ĥ → Ĥ_1 (Langlands' lemma on L-embeddings for groups with simply connected derived group, as used by Kottwitz–Shelstad §2.2; recalled in Waldspurger 2008 §1.4).

Independence of the cocycle class from the section: two sections differ by a cocycle valued in Ĥ, which maps trivially to Ẑ_1 after composing with ^LH_1 → ^LZ_1 because ξ̂_1 is dual to ξ_1 on Ĥ (Waldspurger 2008 §1.4).

Surjectivity H_1(F) → H(F): H^1(F, Z_1) = 0 for an induced torus (Shapiro and Hilbert 90).

The definition exposes the following operations and relations.

- `TauCeti.EndoscopicDatum.ZPair` (data): The structure (H_1, ξ_1, ξ̂_1).
- `TauCeti.EndoscopicDatum.ZPair.exists` (constructor): Every endoscopic datum admits a z-pair.
- `TauCeti.EndoscopicDatum.ZPair.character` (projection): The character λ_1 of Z_1(F) (or of Z_1(𝔸)/Z_1(F)).
- `TauCeti.EndoscopicDatum.ZPair.surjective_points` (other): H_1(F) → H(F) is surjective.
- `TauCeti.EndoscopicDatum.ZPair.trivial` (constructor): The trivial z-pair when H_der is simply connected and ℋ = ^LH.

**Checks.**

- `ZPair.simplyConnectedDerived` (degenerate): If H_der is simply connected and ℋ = ^LH, the trivial z-pair (H, id, id) exists and λ_1 = 1.
- `ZPair.unitary` (computation): For H = U(n_1) × U(n_2) (simply connected derived group), the trivial z-pair applies and the transfer factor is a function on H(F) × G(F).
- `ZPair.sl2_torus` (computation): For G = SL_2 and H = R^1_{E/F} G_m, H_der = 1 is simply connected and the trivial z-pair suffices.
- `ZPair.not_arbitrary_extension` (non-example): A central extension H_1 → H with non-induced torus kernel (e.g. kernel R^1_{E/F} G_m) need not give surjective H_1(F) → H(F) and is not a z-pair.

**Acceptance.**

- When H_der is simply connected and ℋ = ^LH, the trivial z-pair exists and λ_1 = 1.
- For U(n_1) × U(n_2) and for the tori of SL_2, the trivial z-pair applies.
- A central extension with non-induced torus kernel need not give H_1(F) → H(F) surjective.

*Used by:* ET.1/local-transfer-factor (transfer factors are functions on H_1 × G attached to the z-pair); ET.1/matching-functions (transfer lands in λ_1^{-1}-equivariant functions on H_1(F)).

*Needs:* `ET.0/endoscopic-datum`; `ReductiveGroupsPartII:RG2.1/z-extension`; `ReductiveGroupsPartII:RG2.1/z-extension-existence`; `ReductiveGroupsPartII:RG2.5/dual-isogenies-and-products`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`.

### ET.0.15 Images and norms: matching of strongly regular classes

Node `ET.0/norm-correspondence` (construction).

Let (H, ℋ, s, ξ) be an endoscopic datum for (G, θ, ω) over F of characteristic 0, with G* the quasi-split inner form of G (in the ordinary case) or the quasi-split form of the twisted space. Fix Γ-stable Borel pairs (B_H, T_H) of H and (B*, T*) of G*; ξ gives an isomorphism T_H ≅ (T*)_{θ*} (coinvariants) and, through the Weyl groups Ω_H ⊆ Ω^{θ*}, a Γ-equivariant map T_H/Ω_H → (T*)_{θ*}/Ω^{θ*} from semisimple conjugacy classes of H to semisimple θ-conjugacy classes of G (Waldspurger 2008 §1.3 (5)); in the ordinary case it is the map of Chevalley quotients induced by an admissible embedding T_H → T ⊆ G*. A semisimple γ_H ∈ H(F) is (strongly) G-regular if its image consists of (strongly) regular elements; then it is strongly regular in H. An element δ ∈ G(F) (strongly regular, or θ-strongly regular) is an image (ordinary case) or a norm (twisted case) of γ_H if its class corresponds to that of γ_H; D denotes the set of such pairs (γ_H, δ). In the ordinary case with G = G* quasi-split, every strongly G-regular γ_H ∈ H(F) has an image in G(F) (rationality, ET.0/rational-classes-in-stable-class (d), after a z-extension); for G not quasi-split, γ_H need not have an image in G(F) (e.g. split γ_H for G = D^×). For cyclic base change (G = R_{E/F} G_0, θ a generator of Gal(E/F), H the quasi-split inner form of G_0), every semisimple δ ∈ G(F) has a norm in H(F) (Kottwitz), and the norm induces an injection from stable θ-classes of G(F) to stable classes of H(F); the set of norms is described locally and globally by Labesse's image-of-norm theorems. Matching is defined analogously on the Lie algebras (𝔥, 𝔤) through the map of Chevalley quotients 𝔠_H → 𝔠.

The precise hypotheses are: F of characteristic 0; (H, ℋ, s, ξ) an endoscopic datum (ordinary or twisted).

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.3, display (5) and the definition of the set 𝒟 (pp. 9–10)). The map T_H/Ω_H → T*_{θ*}/Ω^{θ*} from conjugacy classes of H to θ-conjugacy classes of G, strongly G-regular elements, and the set 𝒟 of matching pairs.

([R. P. Langlands and D. Shelstad, On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf), §1.3 (p. 225) and §1.4 (p. 226)). G-regular and strongly G-regular elements of H, images of stable classes, and the remark that the twisted analogue of the image is the norm.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §2.4, Définition 2.4.1, Théorème 2.4.2, Lemme 2.4.3 (pp. 54–56); §§2.5–2.6, Propositions 2.5.2, 2.5.3, Théorème 2.6.3 (pp. 58–65)). Norms for cyclic base change: definition, existence for every semisimple element, injectivity on stable classes, and the local and global description of the image of the norm.

Construct the map T_H/Ω_H → (T*)_{θ*}/Ω^{θ*} from the dual isomorphism given by ξ on maximal tori (Waldspurger 2008 §1.3; Langlands–Shelstad §1.3 for the ordinary case, where admissible embeddings T_H → T are those induced by ξ up to Ĝ-conjugacy).

Strong G-regularity implies strong regularity in H (Waldspurger 2008 §1.3, citing Kottwitz–Shelstad Lemma 3.3.C).

Existence of images in quasi-split G: Kottwitz's rationality theorem for quasi-split groups with simply connected derived group and reduction through z-extensions (ET.0/rational-classes-in-stable-class (d)).

Base change norms: Labesse Définition 2.4.1 and Théorème 2.4.2 (every semisimple δ has a norm), Lemme 2.4.3 (injectivity on stable classes, after Kottwitz), and the descriptions of the image of the norm locally (Propositions 2.5.2–2.5.3) and globally (Théorème 2.6.3).

The definition exposes the following operations and relations.

- `TauCeti.EndoscopicDatum.classMap` (data): The Γ-equivariant map from semisimple classes of H to (θ-)semisimple classes of G.
- `TauCeti.EndoscopicDatum.IsGRegular` (data): Strong G-regularity of γ_H ∈ H(F).
- `TauCeti.EndoscopicDatum.Matches` (data): The relation (γ_H, δ) ∈ 𝒟.
- `TauCeti.EndoscopicDatum.Matches.stable` (relation): Matching depends only on the stable classes of γ_H and of δ.
- `TauCeti.EndoscopicDatum.exists_image_of_quasiSplit` (other): For quasi-split G every strongly G-regular γ_H ∈ H(F) has an image in G(F).
- `TauCeti.BaseChange.norm` (constructor): The base-change norm map on stable classes, injective.
- `TauCeti.BaseChange.exists_norm` (other): Every semisimple element of G(F) = G_0(E) has a norm in H(F).
- `TauCeti.EndoscopicDatum.classMapLie` (other): The Lie-algebra version 𝔠_H → 𝔠 of the class map.

**Checks.**

- `normCorrespondence.gln_identity` (degenerate): For the principal datum of quasi-split G (H = G, s = 1) the image of γ_H is its own stable class.
- `normCorrespondence.sl2_torus` (computation): For G = SL_2 and H = R^1_{E/F} G_m, γ_H = u ∈ E^1 \ {±1} corresponds to the stable class of elements with eigenvalues u, ū; two G(F)-classes lie in it.
- `normCorrespondence.basechange_gl1` (computation): For G = R_{E/F} G_m and θ the Galois automorphism, the norm of x ∈ E^× is N_{E/F}(x) ∈ F^× and the set of norms is N E^×.
- `normCorrespondence.innerForm_missing` (non-example): For G = D^× (D a quaternion division algebra) and the principal datum H = GL_2, a split regular γ_H ∈ GL_2(F) has no image in D^×, since D^× has no split maximal torus.

**Acceptance.**

- For the principal datum of quasi-split G the image of γ_H is its own stable class.
- For R_{E/F}G_m with the Galois automorphism, norms are N_{E/F}(x) and the set of norms is N E^×.
- A split regular element of GL_2(F) has no image in D^×.

*Used by:* ET.1/local-transfer-factor (transfer factors are defined on matching pairs (γ_H, δ) ∈ 𝒟); ET.1/matching-functions (matching identities run over images or norms); ET.2b/hitchin-moduli-stack (the map 𝔠_H → 𝔠 of Chevalley quotients defines the endoscopic Hitchin base A_H → A); Leslie Definition 2.6 (matching for the twisted Lie algebra Herm(W_1)).

*Needs:* `ET.0/endoscopic-datum`; `ET.0/semisimple-conjugacy`; `ET.0/rational-classes-in-stable-class`; `ET.0/inner-twist`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `ReductiveGroupsPartII:RG2.1/z-extension-existence`.

### ET.0.16 Elliptic endoscopic data of unitary similitude groups

Node `ET.0/unitary-elliptic-endoscopic-data` (theorem).

Let F = F^+F_0 be a CM field with F^+ totally real and F_0 imaginary quadratic, and for a vector n⃗ = (n_1, …, n_s) of positive integers let G_{n⃗} be the quasi-split group over ℚ of [Shin 2011 §3.1]: G_{n⃗}(R) = {(λ, g) ∈ R^× × GL_{n⃗}(F ⊗_ℚ R) : g Φ_{n⃗} ᵗg^c = λ Φ_{n⃗}} with Φ_{n⃗} the block antidiagonal matrix built from Φ_m = ((−1)^{i+1}δ_{i, m+1−j}). Its dual group is Ĝ_{n⃗} = ℂ^× × ∏_{σ ∈ Φ^+} GL_{n⃗}(ℂ) (Φ^+ the embeddings F → ℂ above a fixed τ_0 : F_0 → ℂ), with W_ℚ acting through W_ℚ/W_{F_0} by (λ, (g_σ)) ↦ (λ ∏_σ det g_σ, (Φ_{n⃗} ᵗg^{-1}_{c w⁻¹σ} Φ^{-1}_{n⃗})_σ) for w ∉ W_{F_0}. For G = G_N (N = n in Shin's notation, N = 2n for Caraiani–Scholze) a set of representatives of E_ell(G_N) is {(G_N, 1, id)} ∪ {(G_{n_1,n_2}, s_{n_1,n_2}, η_{n_1,n_2}) : n_1 + n_2 = N, n_1 ≥ n_2 ≥ 1}, where s_{n_1,n_2} = (1, (I_{n_1}, −I_{n_2})) and η_{n_1,n_2} is induced by GL_{n_1} × GL_{n_2} ⊂ GL_N, where, following Caraiani–Scholze, the pair (n_1, n_2) may be omitted when n_1, n_2 and [F^+ : ℚ] are all odd (Kottwitz 1984, condition 7.4.3). Fixing a character ϖ : 𝔸_{F_0}^×/F_0^× → ℂ^× whose restriction to 𝔸^×/ℚ^× is the quadratic character of F_0 (viewed as a character of W_{F_0} by class field theory), the L-morphism η̃_{n_1,n_2} : ^LG_{n_1,n_2} → ^LG_N is w ↦ (ϖ(w)^{−N(n_1,n_2)}, (diag(ϖ(w)^{ε(N−n_1)} I_{n_1}, ϖ(w)^{ε(N−n_2)} I_{n_2}))_σ) ⋊ w for w ∈ W_{F_0} and w* ↦ (a_{n_1,n_2}, (Φ_{n_1,n_2}Φ_N^{-1})_σ) ⋊ w* for a fixed w* ∈ W_ℚ \ W_{F_0}, where ε(m) ∈ {0, 1} is m mod 2, N(n_1,n_2) = [F^+ : ℚ](n_1 ε(N − n_1) + n_2 ε(N − n_2))/2 and a_{n_1,n_2}² = (−1)^{N(n_1,n_2)}. Each such datum is elliptic, the listed data are pairwise non-isomorphic, and Out(G_{n_1,n_2}, s, η) is trivial unless n_1 = n_2, when it has order 2.

The precise hypotheses are: F = F^+F_0 CM with F^+ ≠ ℚ allowed (Caraiani–Scholze assume [F^+ : ℚ] > 1 for the trace formula, not for this list); the character ϖ fixed as above.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §§3.1–3.2, (3.1)–(3.4) and the displays for η̃_{n_1,n_2} and N(n_1,n_2), Remark 3.2 (pp. 12–14)). The groups G_{n⃗}, their dual groups, the set E_ell(G_n) = {(G_n, s_n, η_n)} ∪ {(G_{n_1,n_2}, s_{n_1,n_2}, η_{n_1,n_2}) : n_1 + n_2 = n, n_1 ≥ n_2 > 0} and the explicit L-morphisms through ϖ.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of local and global Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.2 (pp. 67–68)). The same list for G_{2n} with the exclusion when n_1, n_2 and [F^+ : ℚ] are all odd (Kottwitz 1984, 7.4.3), and the explicit extension η̃_{n_1,n_2} of η_{n_1,n_2} via ϖ and the element a_{n_1,n_2}.

([G. Laumon and B. C. Ngô, Le lemme fondamental pour les groupes unitaires](https://arxiv.org/abs/math/0404454v2), §0.1 (PDF pp. 1–2)). For a unitary group G attached to an unramified quadratic F′/F and a nontrivial partition n = n_1 + n_2, H = U(n_1) × U(n_2) is the corresponding endoscopic group, with κ : Λ → {±1}.

Compute Ĝ_N and its Galois action from the definition of G_N (ReductiveGroupsPartII:RG2.5/dual-of-weil-restriction for the restriction of scalars, RG2.5/galois-action-on-dual-group).

An elliptic s ∈ Ĝ_N modulo the centre has, in each GL_N(ℂ)-factor compatible with the Galois action, eigenvalues ±1 up to the centre; the Galois-fixed connected centralizers are of the form GL_{n_1} × GL_{n_2} (Rogawski's classification for unitary groups, adapted to similitudes in Shin §3.2).

The L-morphism condition for η̃ is checked directly from the semidirect product rule (Caraiani–Scholze non-compact §5.2, p. 68, after Rogawski 1992 §1.2); Kottwitz's condition 7.4.3 removes data that do not extend to L-embeddings or are not relevant when all three integers are odd.

The index condition n_2 ≥ 1 (Shin) avoids repeating the principal datum; Caraiani–Scholze print n_2 ≥ 0 (recorded in sourceIssues).

**Acceptance.**

- N = 2, [F^+ : ℚ] even: E_ell(G_2) = {G_2, G_{1,1}}, and G_{1,1} has Out of order 2 (the swap of the two factors).
- N = 3 and [F^+ : ℚ] odd: the pair (n_1, n_2) = (2, 1) is kept and there are two elliptic data.
- N = 2 with [F^+ : ℚ] odd: n_1 = n_2 = 1 and [F^+ : ℚ] are all odd, so the datum G_{1,1} may be omitted under condition 7.4.3; for [F^+ : ℚ] even it is present.

*Needs:* `ET.0/endoscopic-datum`; `ReductiveGroupsPartII:RG2.5/dual-of-weil-restriction`; `ReductiveGroupsPartII:RG2.5/galois-action-on-dual-group`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

### ET.0.17 Centralizers, stable classes and matching for unitary Lie algebras

Node `ET.0/unitary-hermitian-matching` (theorem).

Let E/F be a quadratic extension of nonarchimedean local fields of characteristic 0 with Galois conjugation c and norm character η_{E/F}, V a nondegenerate Hermitian space of dimension n over E, U(V) its unitary group and Herm(V) the F-space of Hermitian endomorphisms (the Lie algebra of U(V) up to the scalar ε with ε^c = −ε). (a) (Centralizers) For regular semisimple δ ∈ Herm(V) write F[δ] = F[X]/(char_δ) = ∏_{i=1}^m F_i (F_i/F fields), E_i = E ⊗_F F_i, and S_1 = {i : F_i ⊉ E}, S_2 its complement. The centralizer T_δ of δ in U(V) is the torus of norm-one elements of E[δ] = E ⊗_F F[δ], so T_δ(F) ≅ ∏_{i ∈ S_1} E_i^1 × ∏_{i ∈ S_2} F_i^× with E_i^1 the norm-one elements of E_i/F_i; H^1(F, T_δ) ≅ ∏_{S_1} ℤ/2; and E(T_δ, U(V); F) = ker(H^1(F, T_δ) → H^1_ab(F, U(V))) = ker(∏_{S_1} ℤ/2 → ℤ/2), the map being the sum. (b) (Matching) Let V_a, V_b be Hermitian spaces of dimensions a, b with a + b = n and W_{a,b} = V_a ⊕ V_b. Regular semisimple δ ∈ Herm(V) and δ′ ∈ Herm(V′) are Jacquet–Langlands transfers of each other if they are GL_n(E)-conjugate after identifying V ≅ E^n ≅ V′; then δ′ = Ad(g)δ and inv(δ, δ′) := [σ ↦ g^{-1}σ(g)] ∈ H^1(F, T_δ) extends the invariant on D(T_δ, U(V); F). Regular semisimple δ ∈ Herm(V) and (δ_a, δ_b) ∈ Herm(V_a) ⊕ Herm(V_b) match if δ and φ_{a,b}(δ_a, δ_b) are Jacquet–Langlands transfers, where φ_{a,b} : Herm(V_a) ⊕ Herm(V_b) → Herm(W_{a,b}) is the block-diagonal embedding. (c) (The endoscopic character) If y ∈ Herm(V) matches (y_a, y_b), then H^1(F, T_y) = ∏_{S_1(a)} ℤ/2 × ∏_{S_1(b)} ℤ/2 = H^1(F, T_{y_a} × T_{y_b}), and the character κ attached to the elliptic endoscopic datum (U(V_a) × U(V_b), s, ξ) is the restriction to E(T_y, U(V); F) of the character κ̃ that is trivial on the factors indexed by S_1(a) and nontrivial on those indexed by S_1(b).

The precise hypotheses are: E/F quadratic, F nonarchimedean of characteristic 0 (residue characteristic odd where the source uses it); δ regular semisimple.

([S. Leslie, The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3), §1.5.4, Lemma 1.8 (p. 12); §2.2.1, Definition 2.6 (p. 17); §2.2.2, (2.5)–(2.6) and Lemma 2.7 (p. 18)). Centralizers and cohomology of regular semisimple Hermitian elements, Jacquet–Langlands transfer and matching for Herm(W_1) via φ_{a,b}, and the endoscopic character κ on H^1(F, T_y) (extraction items PAPER-LESLIE-25/2, /12, /14).

(a) Decompose V along the characteristic polynomial; on each factor with F_i ⊉ E the centralizer is the norm-one torus of E_i/F_i, otherwise a split torus; Tate–Nakayama (ET.0/tate-nakayama-tori) gives H^1 = ℤ/2 for each norm-one factor and 0 for the others, and H^1_ab(F, U(V)) = ℤ/2 (the discriminant) with the map the sum (Leslie Lemma 1.8, citing Rogawski 1990 §3.4).

(b) Definition 2.6 of Leslie, an instance of ET.0/norm-correspondence for the Lie algebra with the endoscopic datum of ET.0/unitary-elliptic-endoscopic-data (local version) and transport across the inner forms U(V), U(V′) (ET.0/inner-twist).

(c) Leslie Lemma 2.7 (stated there without proof as standard): compute κ ∈ π_0(T̂^Γ) from s = diag(1_a, −1_b) through the identification of (a) (Rogawski 1990 Chapter 3).

**Acceptance.**

- n = 1: Herm(V) = F, T_δ = U(1) = E^1, H^1 = ℤ/2, and E(T_δ, U(V); F) = ker(ℤ/2 → ℤ/2) = 0, so each stable class is a single class.
- n = 2, δ with F[δ] = F × F and E ⊄ F: S_1 = {1, 2}, H^1(F, T_δ) = (ℤ/2)², E = ℤ/2 (two rational classes) and for (a, b) = (1, 1) κ is the nontrivial character.

*Needs:* `ET.0/tate-nakayama-tori`; `ET.0/abelianized-cohomology`; `ET.0/rational-classes-in-stable-class`; `ET.0/norm-correspondence`; `ET.0/inner-twist`; `ET.0/unitary-elliptic-endoscopic-data`; `mathlib:Matrix.IsHermitian`.

### ET.0.18 Worked examples for stable conjugacy and endoscopic data

Node `ET.0/acceptance-examples` (application).

The following are verified from the definitions of ET.0. (1) Split torus T = G_m^r: E(T) = {(T, 1, id)}, D(T, T; F) = 0, stable = rational conjugacy. (2) GL_n over F: H^1(F, T) = 0 for every maximal torus (a product of R_{F_i/F} G_m), so D = 0 and stable = rational conjugacy; E_ell(GL_n) = {GL_n}; H^1_ab(F, GL_n) = 0 and A(GL_n) = π_0(ℂ^×)^D = 0. (3) A nonsplit unitary group U(1,1) or U(2) attached to quadratic E/F: elliptic maximal tori T ≅ U(1)×U(1) have D(T) of order 2 (ET.0/unitary-hermitian-matching (a)), E_ell(U(2)) = {U(2), U(1)×U(1)} and the character κ of the second datum is the nontrivial character of D(T). (4) A proper Levi with different rational classes in one stable class: in Sp_4 over p-adic F the Levi M = GL_1 × SL_2 contains regular elliptic elements of its SL_2 factor whose M-stable class consists of two M(F)-classes (ET.0/rational-classes-in-stable-class acceptance), while the corresponding G-stable class may contain further classes. (5) SL_2: H^1(F, SL_2) = 1, H^1(F, PGL_2) = ℤ/2, E_ell(SL_2) consists of SL_2 and the norm-one tori of the three quadratic extensions (for p odd).

The precise hypotheses are: F a p-adic field (p odd for (5)).

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §§1.6–1.7, 2.3 (pp. 28–39, 52–54)). The cohomological statements from which the examples are computed.

([S. Leslie, The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3), Lemma 1.8 (p. 12)). The unitary centralizer cohomology used in example (3).

Each item is a direct computation with ET.0/tate-nakayama-tori, ET.0/kottwitz-duality, ET.0/rational-classes-in-stable-class and ET.0/endoscopic-datum.

**Acceptance.**

- Each of the five examples is checked as stated.

*Needs:* `ET.0/tate-nakayama-tori`; `ET.0/kottwitz-duality`; `ET.0/rational-classes-in-stable-class`; `ET.0/endoscopic-datum`; `ET.0/unitary-hermitian-matching`.

## Layer ET.1: Transfer factors and orbital-integral analysis

The targets are the distributions that the stable trace formula compares and the factors that make the comparison canonical. Orbital integrals and their κ- and stable sums come first; then the transfer factor in all its normalizations, its twisted and Lie-algebra versions and the definition of transfer; then the harmonic analysis Waldspurger's transfer theorem needs (germs, Fourier transforms); finally the real place, where Harish-Chandra's characters, Shelstad's transfer and the pseudo-coefficients of discrete series supply the archimedean test functions.

### ET.1.1 Invariant orbital integrals and their normalizations ★

Node `ET.1/orbital-integral` (definition).

Let F be a local field of characteristic 0 and G connected reductive over F, with a fixed Haar measure dg on G(F). For a semisimple γ ∈ G(F) let G_γ be its centralizer and G_γ^0 the identity component, with a Haar measure dt on G_γ^0(F); G_γ^0(F) is unimodular, so G_γ^0(F)\G(F) carries the quotient measure dg/dt (AdelicAlgebraicGroups:AA.2/quotient-measure). For f ∈ C_c^∞(G(F)) (locally constant compactly supported if F is p-adic, smooth compactly supported if F is archimedean) the orbital integral is O_γ(f) = ∫_{G_γ^0(F)\G(F)} f(g⁻¹γg) dg/dt; following Waldspurger one also uses O_γ^{G}(f) = [G_γ(F) : G_γ^0(F)]⁻¹ O_γ(f), which depends only on the G(F)-class of γ. The integral converges absolutely for every semisimple γ (the orbit of γ is closed and the orbit map identifies G_γ^0(F)\G(F) with a finite cover of a closed subset of G(F)). The normalized orbital integral is J_G(γ, f) = |D^G(γ)|^{1/2} O_γ(f) with D^G(γ) = det(1 − Ad(γ))|_{𝔤/𝔤_γ} the Weyl discriminant. The same definitions apply to the Lie algebra 𝔤(F), f ∈ C_c^∞(𝔤(F)), X ∈ 𝔤(F) semisimple, D(X) = det(ad X)|_{𝔤/𝔤_X}. For F p-adic, orbital integrals of nilpotent (unipotent) orbits are defined by the invariant measure on the orbit (Deligne–Ranga Rao) and are needed for germ expansions; for regular semisimple γ, J_G(γ, f) is a bounded locally constant (p-adic) or smooth (real) function of γ on G_reg(F) for fixed f (Harish-Chandra). Measures on centralizers of stably conjugate (or matching) elements are transported by the inner twist between their identity components (ET.0/semisimple-conjugacy).

The precise hypotheses are: F local of characteristic 0; G connected reductive with fixed Haar measures on G(F) and on the centralizers.

([R. E. Kottwitz, Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §2 'Basics of integration' (p. 403), §3 'Preliminaries about orbital integrals' (p. 406), §7 'Weyl integration formula' (p. 421)). Quotient measures, the definition and convergence of orbital integrals of semisimple elements, normalization by the Weyl discriminant and the Weyl integration formula for p-adic groups and Lie algebras.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.5 (pp. 11–12)). O^ω_δ(f) with the factor [G_δ(F) : G_δ^0(F)]⁻¹ and the transport of Haar measures between centralizers of matching elements.

([R. P. Langlands and D. Shelstad, On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf), §5.4 'Orbital integrals as fiber integrals' (p. 259)). Orbital integrals near regular unipotent elements realized as fibre integrals.

Quotient measure: AdelicAlgebraicGroups:AA.2/quotient-measure applies since reductive groups are unimodular; Weil's integration formula AA.2/quotient-integral-integrable gives the integral as an iterated integral (Kottwitz, Clay notes §2).

Convergence for semisimple γ: the orbit O_γ is closed, and G_γ^0(F)\G(F) → O_γ(F) is proper with finite fibres over its image (Kottwitz, Clay notes §3).

Boundedness and local constancy of normalized orbital integrals near regular elements: Harish-Chandra; the p-adic statements are in Kottwitz's Clay notes §§3, 15–16 (Harish-Chandra's compactness lemma and semisimple descent).

Nilpotent orbital integrals: the invariant measure on a nilpotent orbit extends to a Radon measure on 𝔤(F) (Deligne–Ranga Rao), recalled in Kottwitz's Clay notes §17; the original papers were not read (sourceVersions).

The definition exposes the following operations and relations.

- `TauCeti.orbitalIntegral` (data): O_γ(f) for semisimple γ and f ∈ C_c^∞(G(F)).
- `TauCeti.normalizedOrbitalIntegral` (data): J_G(γ, f) = |D^G(γ)|^{1/2} O_γ(f).
- `TauCeti.orbitalIntegral_conj` (simp): Invariance under conjugation of γ and of f.
- `TauCeti.orbitalIntegral_linear` (structure): f ↦ O_γ(f) is a linear functional, an invariant distribution on G(F).
- `TauCeti.orbitalIntegral_measure_scale` (relation): Scaling dg or dt by c scales O_γ by c or c⁻¹.
- `TauCeti.normalizedOrbitalIntegral_bounded` (other): For fixed f, J_G(·, f) is bounded on G_reg(F) and locally constant (p-adic) or smooth (real) there.
- `TauCeti.weylIntegration` (relation): Weyl integration formula: ∫_{G(F)} f = Σ_T |W(G, T)(F)|⁻¹ ∫_{T(F)} |D^G(t)| O_t(f) dt over conjugacy classes of maximal tori.
- `TauCeti.orbitalIntegralLie` (other): The Lie-algebra version on 𝔤(F), including nilpotent orbital integrals for F p-adic.
- `TauCeti.orbitalIntegral_descent` (compatibility): Semisimple descent: near a semisimple γ, O^G is expressed through O^{G_γ} of a descended function on a neighbourhood of 0 in 𝔤_γ(F).

**Checks.**

- `orbitalIntegral_central` (degenerate): For γ central, O_γ(f) = f(γ) (with dt = dg).
- `orbitalIntegral_torus` (degenerate): For G = T a torus, O_γ(f) = f(γ).
- `orbitalIntegral_gl2_split` (computation): For G = GL_2(F), F p-adic with q residue elements, γ = diag(a, b) with |a − b| = 1 and f = 1_{GL_2(𝒪)}, measures giving GL_2(𝒪) and the diagonal units volume 1: O_γ(f) = 1 (Kottwitz, Clay notes §5).
- `orbitalIntegral_invariant` (characterisation): O_{xγx⁻¹}(f) = O_γ(f) for x ∈ G(F), and O_γ(f^x) = O_γ(f) for f^x(g) = f(xgx⁻¹).
- `orbitalIntegral_not_regular_only` (non-example): The integral over G_γ(F)\G(F) with G_γ disconnected differs from the one over G_γ^0(F)\G(F) by [G_γ(F) : G_γ^0(F)] (e.g. γ = diag(1, −1) in PGL_2), so the two conventions must not be mixed.

**Acceptance.**

- O_γ(f) = f(γ) for central γ and for tori.
- For GL_2 over a p-adic field and a split regular γ with |a − b| = 1, the orbital integral of 1_{GL_2(𝒪)} is 1 with the standard measures.
- Orbital integrals are invariant under conjugation of γ and of f.

*Used by:* AutomorphicSpectralTheory:AS.6/weighted-orbital-integral (the weighted orbital integral is the unweighted one with the weight v_M; AS.6 imports the convergence and conventions here (owner fixed by RT-AREA-automorphic-1/24)); ET.1/kappa-and-stable-orbital-integrals (κ- and stable sums of these integrals); ET.2b/hitchin-point-count (local factors of the Hitchin count are orbital integrals of unit functions); Leslie §2.2.2 (Orb(f, y) on Herm(W_1)).

*Needs:* `AdelicAlgebraicGroups:AA.2/quotient-measure`; `AdelicAlgebraicGroups:AA.2/quotient-integral-integrable`; `AdelicAlgebraicGroups:AA.2/quotient-measure-transitivity`; `ET.0/semisimple-conjugacy`; `SmoothRepresentationsOfLocalGroups:SR.1/convolution-algebra`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`; `mathlib:MeasureTheory.Measure.IsHaarMeasure`.

### ET.1.2 κ-orbital integrals and stable orbital integrals ★

Node `ET.1/kappa-and-stable-orbital-integrals` (definition).

Let F be local of characteristic 0, G connected reductive, γ ∈ G(F) strongly regular semisimple with centralizer the maximal torus T, and for each γ′ in the stable class of γ let inv(γ, γ′) ∈ D(T, G; F) be its invariant (ET.0/rational-classes-in-stable-class); measures on the centralizers T_{γ′} are transported from T. For a character κ of E(T, G; F) (equivalently an element of Kottwitz's 𝔎(T/F), ET.0/rational-classes-in-stable-class (b)) and f ∈ C_c^∞(G(F)), the κ-orbital integral is O^κ_γ(f) = Σ_{γ′} κ(inv(γ, γ′)) e(G_{γ′}) O_{γ′}(f), the sum running over representatives of the G(F)-classes in the stable class of γ (a finite set) and e the Kottwitz sign (trivial for tori; it enters for singular γ with non-quasi-split centralizers). The stable orbital integral is SO_γ(f) = O^1_γ(f). For γ semisimple but not strongly regular one sums over the rational classes in the stable class weighted by e(G_{γ′}) and the measure conventions of Kottwitz 1986 §5. Changing γ within its stable class multiplies O^κ_γ by κ(inv(γ, γ′))⁻¹, so O^κ is not a function of the stable class alone unless κ = 1; SO_γ is. A distribution on G(F) is stable if it is a limit of linear combinations of the SO_γ. The same definitions apply on the Lie algebra 𝔤(F).

The precise hypotheses are: F local of characteristic 0; γ strongly regular (singular case with Kottwitz's conventions).

([T. C. Hales, A statement of the fundamental lemma](https://arxiv.org/abs/math/0312227v2), §6.1, (6.0.1) and (6.0.2) (PDF pp. 9–10)). κ-orbital integrals with coefficients κ(a_τ) and stable orbital integrals over all stable conjugates.

([S. Leslie, The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3), §2.2.2, (2.5) and the display after it (p. 18)). Rational classes in a stable class form a D(T_y/F)-torsor trivialized by inv(y, −); Orb^κ(f, y) = Σ_{y′} κ(inv(y, y′)) Orb(f, y′) and SO = Orb^1 (extraction item PAPER-LESLIE-25/13).

([R. E. Kottwitz, Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), §5.1–5.6 (pp. 379–380)). Kottwitz's local conjectures on orbital integrals: κ-orbital integrals with the signs e(G_γ) for singular semisimple γ.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §1.7, Définition 1.7.1 (pp. 17–18)). κ-orbital integral of a function on the Lie algebra over a stable class a ∈ 𝔠(F_v).

Finiteness of the sum: D(T, G; F) is finite (ET.0/rational-classes-in-stable-class (b)).

Dependence on γ within its stable class: inv(γ″, γ′) = inv(γ, γ′) − inv(γ, γ″) in the abelian group E(T, G; F) (Leslie (2.5); Hales §6.1).

Singular case: Kottwitz 1986 §5.1–5.2 with the signs e(I).

The definition exposes the following operations and relations.

- `TauCeti.kappaOrbitalIntegral` (data): O^κ_γ(f).
- `TauCeti.stableOrbitalIntegral` (data): SO_γ(f) = O^1_γ(f).
- `TauCeti.stableOrbitalIntegral_stablyConj` (simp): SO_γ = SO_{γ′} for γ′ stably conjugate to γ.
- `TauCeti.kappaOrbitalIntegral_stablyConj` (relation): O^κ_{γ′} = κ(inv(γ, γ′))⁻¹ O^κ_γ.
- `TauCeti.IsStableDistribution` (data): A distribution is stable if it lies in the closed span of the SO_γ.
- `TauCeti.kappaOrbitalIntegral_lie` (other): The Lie-algebra version, compatible with descent near the identity.

**Checks.**

- `stableOrbitalIntegral_gln` (compatibility): For G = GL_n, SO_γ = O_γ and O^κ_γ = O_γ for the only character κ = 1 (D(T) = 0).
- `kappaOrbitalIntegral_sl2` (computation): For G = SL_2, T elliptic with D(T) = ℤ/2 and κ nontrivial: O^κ_γ(f) = O_γ(f) − O_{γ′}(f) for γ′ the other rational class.
- `kappaOrbitalIntegral_change_base` (characterisation): O^κ_{γ″}(f) = κ(inv(γ, γ″))⁻¹ O^κ_γ(f) for γ″ stably conjugate to γ.
- `stableOrbitalIntegral_not_orbital` (non-example): For G = SL_2 and γ regular elliptic, SO_γ ≠ O_γ in general: f supported on the rational class of γ′ ≠ γ gives O_γ(f) = 0 but SO_γ(f) = O_{γ′}(f) ≠ 0.

**Acceptance.**

- For GL_n, SO_γ = O_γ.
- For SL_2 and an elliptic torus, O^κ_γ = O_γ − O_{γ′} for the nontrivial κ.
- O^κ changes by κ(inv(γ, γ″))⁻¹ when γ is replaced by a stably conjugate γ″.

*Used by:* ET.1/matching-functions (transfer identities equate stable orbital integrals on H with κ-orbital integrals on G times transfer factors); ET.2b/hitchin-point-count (κ-weighted point counts of affine Springer fibres are κ-orbital integrals of unit functions); ET.3/lie-algebra-fundamental-lemma (the fundamental lemma is an identity between O^κ and SO).

*Needs:* `ET.1/orbital-integral`; `ET.0/rational-classes-in-stable-class`; `ET.0/kottwitz-sign`; `ET.0/tate-nakayama-tori`.

### ET.1.3 a-data and χ-data for the roots of a maximal torus

Node `ET.1/a-data-chi-data` (definition).

Let F be a field of characteristic 0, T a maximal torus of a connected reductive G over F (or of G* quasi-split), R = R(G, T) its roots with the action of Γ_F, and for α ∈ R let F_α ⊇ F_{±α} be the fixed fields of the stabilizers of α and of {±α} in Γ_F; α is symmetric if F_α ≠ F_{±α} (then [F_α : F_{±α}] = 2) and asymmetric otherwise. (a) a-data is a family {a_α ∈ F_α^× : α ∈ R} with a_{σα} = σ(a_α) for σ ∈ Γ_F and a_{−α} = −a_α. (b) χ-data is a family of characters {χ_α : F_α^× → ℂ^×} with χ_{σα} = χ_α ∘ σ⁻¹, χ_{−α} = χ_α⁻¹, and, for α symmetric, χ_α restricted to F_{±α}^× equal to the quadratic character of F_α/F_{±α} (local case; for F global, characters of the idele class groups with the same properties). a-data is used to define the splitting invariant λ(T_sc) of Δ_I and the term Δ_III2 uses χ-data to build an L-embedding ^LT → ^LG; the absolute transfer factor (ET.1/local-transfer-factor) does not depend on these choices (Langlands–Shelstad Theorem 3.7.A), but each of Δ_I, Δ_II, Δ_III2 separately does. In the twisted setting, a-data and χ-data are taken for the restricted root system of (T, θ) (Kottwitz–Shelstad 2012 §2.2, (2.2.2)).

The precise hypotheses are: F of characteristic 0 (local or global); T a maximal torus of G over F.

([R. P. Langlands and D. Shelstad, On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf), §2.2 'a-Data' (p. 229) and §2.5 'χ-Data' (p. 235)). A collection {a_λ} is a set of a-data for the action of Γ on the roots, and {χ_λ} is a set of χ-data, with the equivariance and symmetry conditions stated here.

([R. Kottwitz and D. Shelstad, On splitting invariants and sign conventions in endoscopic transfer](https://arxiv.org/abs/1201.5658v1), §2.1 (PDF p. 3), §2.2 with (2.2.2) (PDF p. 4), §5.1 (PDF p. 12)). a-data for the roots of T and the twisted a-data; the class a ∈ H^1(W_F, T̂) depends on the χ-data.

Existence: choose a_α on representatives of Γ-orbits of roots and extend by the equivariance rules; for symmetric α choose a_α with σ(a_α) = −a_α for the nontrivial σ ∈ Gal(F_α/F_{±α}). For χ-data, extend characters of the idele class or multiplicative groups of F_{±α} by class field theory (Langlands–Shelstad §2.2 and §2.5).

The defining properties are exactly those used to make λ(T_sc) and the L-embedding ^LT → ^LG well defined (Langlands–Shelstad §2.3, §2.6).

The definition exposes the following operations and relations.

- `TauCeti.AData` (data): a-data for (G, T).
- `TauCeti.ChiData` (data): χ-data for (G, T).
- `TauCeti.AData.exists` (constructor): a-data exists.
- `TauCeti.ChiData.exists` (constructor): χ-data exists (local and global).
- `TauCeti.AData.smul` (relation): Two sets of a-data differ by b_α ∈ F_α^× with the same equivariance, b_α ∈ F_{±α}^× for symmetric α.
- `TauCeti.ChiData.lEmbedding` (constructor): The L-embedding ^LT → ^LG attached to χ-data (Langlands–Shelstad §2.6).

**Checks.**

- `aData_sl2_split` (computation): For G = SL_2 with T split, R = {±α}, F_α = F, a-data is any a ∈ F^× with a_{−α} = −a.
- `chiData_symmetric_quadratic` (characterisation): For a symmetric root with F_α = E quadratic over F_{±α}, χ_α|_{F_{±α}^×} is the quadratic character η_{E/F_{±α}}.
- `aData_torus` (degenerate): For G = T a torus, R = ∅ and a-data and χ-data are empty.
- `chiData_not_trivial` (non-example): The family χ_α = 1 for all α is not χ-data when some root is symmetric, since the restriction to F_{±α}^× must be nontrivial.

**Acceptance.**

- For a split torus of SL_2, a-data is a single a ∈ F^× with a_{−α} = −a.
- For a symmetric root, χ_α restricted to F_{±α}^× is the quadratic character of F_α/F_{±α}.
- The transfer factor does not depend on the choice of a-data and χ-data (ET.1/local-transfer-factor).

*Used by:* ET.1/local-transfer-factor (Δ_I uses a-data; Δ_II and Δ_III2 use χ-data); ET.1/twisted-transfer-factor (twisted a-data and χ-data on restricted roots).

*Needs:* `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

### ET.1.4 The Langlands–Shelstad transfer factor ★

Node `ET.1/local-transfer-factor` (construction).

Let F be local of characteristic 0, G connected reductive with quasi-split inner form G* and inner twist ψ : G → G*, (H, ℋ, s, ξ) an endoscopic datum with a z-pair (H_1, ξ_1) (ET.0/z-pair). For a strongly G-regular γ_1 ∈ H_1(F) with image γ_H ∈ H(F) and a strongly regular δ ∈ G(F) matching it (ET.0/norm-correspondence), choose an admissible embedding T_H → T* of the centralizer of γ_H into G*, a-data and χ-data for T* (ET.1/a-data-chi-data). Define: Δ_I(γ_1, δ) = ⟨λ(T_sc), s_T⟩ (the splitting invariant λ(T_sc) ∈ H^1(F, T_sc) built from a-data paired by Tate–Nakayama with the image s_T of s); Δ_II(γ_1, δ) = ∏_α χ_α((α(γ) − 1)/a_α) over Γ-orbit representatives of roots of T outside H; Δ_III1(γ_1, δ; γ̄_1, δ̄) = ⟨inv(γ, δ; γ̄, δ̄), κ⟩, the pairing of the relative invariant in H^1(F, U) (U = T × T̄/Z(G)) with the endoscopic character; Δ_III2(γ_1, δ) = ⟨a, γ⟩ for a ∈ H^1(W_F, T̂) measuring the difference of the L-embeddings ^LT → ^LG given by χ-data and by ξ through ℋ (with the z-pair); Δ_IV(γ_1, δ) = |D_G(δ)|^{1/2}|D_H(γ_H)|^{-1/2}. The relative transfer factor Δ(γ_1, δ; γ̄_1, δ̄) = Δ_I Δ_II Δ_III1 Δ_III2 Δ_IV (ratios) is independent of all choices (Langlands–Shelstad Theorem 3.7.A). An absolute transfer factor is a function Δ(γ_1, δ) on matching pairs with Δ(γ_1, δ)Δ(γ̄_1, δ̄)⁻¹ = Δ(γ_1, δ; γ̄_1, δ̄); it is determined up to a nonzero constant. Normalizations: (i) for G quasi-split, the Langlands–Shelstad absolute factor Δ_0 = Δ_I Δ_II Δ_III2 Δ_IV (Δ_III1 trivial with base point δ̄ = δ for G = G*); (ii) Kottwitz–Shelstad 2012 correct the sign conventions: with Langlands' normalization of local class field theory (uniformizers ↔ Frobenius) the factor compatible with the classical correspondence is Δ′ = (Δ_I^new Δ_III)⁻¹ Δ_II Δ_IV, and with Deligne's normalization (uniformizers ↔ inverse Frobenius) it is Δ_D = Δ_I^new Δ_II⁻¹ Δ_III Δ_IV; Δ′ and Δ_D for (H, s, ξ) are the factors of the datum (H, s⁻¹, ξ) in the other convention; (iii) the Whittaker normalization Δ_λ fixes the constant by a Whittaker datum λ of G* through the root number ε_L(V, ψ) of the virtual representation V = X^*(T*) ⊗ ℂ − X^*(T_H) ⊗ ℂ: Δ_{λ,D} = ε_L(V, ψ) Δ_I^new Δ_II Δ_III^new Δ_IV and similarly for Δ′_λ. Every consumer records which of Δ′, Δ_D and which normalization (base point or Whittaker) it uses, and which normalization of local class field theory (CFT Layer 7) is in force; the product formula (ET.1/transfer-factor-properties) does not identify two conventions without this record.

The precise hypotheses are: F local of characteristic 0; (H, ℋ, s, ξ) an endoscopic datum of G with a z-pair; δ strongly regular in G(F), γ_1 strongly G-regular in H_1(F), matching.

([R. P. Langlands and D. Shelstad, On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf), §3.1–3.7 (pp. 240–249): Δ_I (p. 241), Δ_II (p. 243), Δ_III1 (p. 245), Δ_III2 (p. 246), Δ_IV (p. 248), Theorem 3.7.A (p. 248)). The four terms of the transfer factor, the relative factor and its independence of admissible embeddings, a-data and χ-data.

([R. Kottwitz and D. Shelstad, On splitting invariants and sign conventions in endoscopic transfer](https://arxiv.org/abs/1201.5658v1), Introduction (PDF pp. 1–2), (1.0.3)–(1.0.4); §4.1 and §4.3 (PDF pp. 10–11); §§5.1–5.5 (PDF pp. 12–15)). The sign error in the χ-data dependence of Δ_II and Δ_III in the 1999 definition, the corrected factors Δ_D and Δ′ for the two normalizations of local class field theory, their relation through (H, s⁻¹, ξ), and the Whittaker-normalized Δ_{λ,D} and Δ′_λ.

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), §5.3, pp. 33–35 (arXiv v5; extraction item D32)). Relative factors and absolute normalizations with explicit conventions; a ratio identity fixes the absolute factor only up to a constant.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.4 (pp. 10–11)). The Kottwitz–Shelstad relative factor Δ(γ_1, δ; γ̄_1, δ̄) on 𝒟_1 × 𝒟_1 and the choice of an absolute factor compatible with it.

Δ_I: Langlands–Shelstad §3.2 (p. 241), λ(T_sc) from the a-data splitting (§2.3) and Tate–Nakayama pairing (ET.0/tate-nakayama-tori).

Δ_II: §3.3 (p. 243); Δ_III1: §3.4 (p. 245), a relative term pairing an invariant with κ; Δ_III2: §3.5 (p. 246), built from χ-data through the L-embedding of §2.6; Δ_IV: §3.6 (p. 248), the quotient of Weyl discriminants.

Independence of the product of choices: Theorem 3.7.A (p. 248), proved by computing how each term changes with the admissible embedding, a-data and χ-data (Lemmas of §§3.2–3.5).

Sign corrections: Kottwitz–Shelstad 2012 show the 1999 twisted factor is not independent of χ-data unless Δ_II or Δ_III enters with exponent −1 (introduction, PDF p. 2), define Δ_D and Δ′ ((1.0.3), (1.0.4); §§5.3–5.4) and their Whittaker-normalized versions ((5.5.1)–(5.5.2), §5.5).

Conventions on local class field theory and Frobenius: KS 2012 §4.1 (Deligne's vs Langlands' reciprocity), with the upstream ClassFieldTheory Layer 7 normalizations recorded as the ones in force.

The definition exposes the following operations and relations.

- `TauCeti.TransferFactor.relative` (data): Δ(γ_1, δ; γ̄_1, δ̄) on pairs of matching pairs.
- `TauCeti.TransferFactor.relative_independent` (characterisation): Independence of admissible embeddings, a-data and χ-data (LS Theorem 3.7.A).
- `TauCeti.TransferFactor` (data): An absolute transfer factor: a function on matching pairs whose ratios are the relative factor.
- `TauCeti.TransferFactor.unique_up_to_const` (extensionality): Two absolute factors differ by a nonzero constant.
- `TauCeti.TransferFactor.whittaker` (constructor): The Whittaker-normalized factors Δ_{λ,D} and Δ′_λ attached to a Whittaker datum of G*.
- `TauCeti.TransferFactor.convention` (other): The tag (Δ′ or Δ_D, base point or Whittaker, local CFT normalization) carried with every factor.
- `TauCeti.TransferFactor.inv_s` (relation): Δ′ for (H, s, ξ) equals Δ_D for (H, s⁻¹, ξ).
- `TauCeti.TransferFactor.stablyConj` (relation): Δ(γ_1, δ′) = ⟨inv(δ, δ′), κ⟩⁻¹ Δ(γ_1, δ).
- `TauCeti.TransferFactor.terms` (projection): The terms Δ_I, Δ_II, Δ_III1, Δ_III2, Δ_IV for fixed auxiliary data.

**Checks.**

- `transferFactor_principal_quasiSplit` (degenerate): For H = G = G* quasi-split, s = 1, the relative factor is identically 1, and Δ_0(γ, δ) = 1 for δ stably conjugate to γ.
- `transferFactor_relative_cocycle` (characterisation): Δ(γ_1, δ; γ̄_1, δ̄) Δ(γ̄_1, δ̄; γ̃_1, δ̃) = Δ(γ_1, δ; γ̃_1, δ̃).
- `transferFactor_stable_conj` (characterisation): Replacing δ by a stably conjugate δ′ gives Δ(γ_1, δ′) = ⟨inv(δ, δ′), κ⟩⁻¹ Δ(γ_1, δ) for the endoscopic character κ.
- `transferFactor_sl2_torus` (computation): For G = SL_2, H = R^1_{E/F} G_m and a matching pair (u, δ) with u ∈ E^1 regular, D_H(u) = 1 and D_G(δ) = −(u − ū)²/(uū), so |Δ_IV(u, δ)| = |u − ū|_F; between the two rational classes in the stable class of δ the factor changes by the nontrivial character of D(T, SL_2; F) = ℤ/2.
- `transferFactor_D_vs_prime` (non-example): Δ_D and Δ′ for the same datum are not equal in general: their ratio is (Δ_I^new Δ_III)² Δ_II⁻², nontrivial for the twisted GL_n ⋊ θ case (ET.1/twisted-transfer-factor).

**Acceptance.**

- For H = G = G* and s = 1 the relative factor is 1.
- The relative factor satisfies the cocycle identity for three matching pairs.
- For SL_2 and the elliptic torus datum, |Δ_IV(u, δ)| = |u − ū|_F and the factor changes by the nontrivial character between the two rational classes.

*Used by:* ET.1/matching-functions (the matching identity SO_{γ_1}(f^H) = Σ_δ Δ(γ_1, δ) O_δ(f)); ET.3/local-transfer-existence (transfer of all test functions); ET.4 (part 2) (the stabilization of the elliptic terms uses the global product formula); GL2AutomorphicRepresentationsAndTransfer:R17.2/cyclic-local-matching (transfer-factor conventions for GL_2 ordinary, inner-form and cyclic twisted transfer); Shin 2011 §3.4 (transfer factors for unitary similitude groups).

*Needs:* `ET.0/endoscopic-datum`; `ET.0/z-pair`; `ET.0/norm-correspondence`; `ET.0/tate-nakayama-tori`; `ET.0/rational-classes-in-stable-class`; `ET.0/inner-twist`; `ET.1/a-data-chi-data`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

### ET.1.5 Transport, descent, central extensions and the global product formula

Node `ET.1/transfer-factor-properties` (theorem).

In the setting of ET.1/local-transfer-factor: (a) (Invariance) Δ(γ_1, δ) is invariant under H_1(F)-conjugation of γ_1 and G(F)-conjugation of δ, and transforms under Z_1(F) by λ_1: Δ(zγ_1, δ) = λ_1(z)⁻¹ Δ(γ_1, δ). (b) (Change of z-pair and of datum) An isomorphism of endoscopic data and a change of z-pair transport the factor, with the transported factor a multiple of the original by a constant determined by the change of λ_1. (c) (Central extensions) For a z-extension G̃ → G with induced kernel, the transfer factor of G is obtained by restriction from that of G̃ for the corresponding datum (Langlands–Shelstad §4.4). (d) (Extension to G-regular elements) The factor extends to all G-regular, not only strongly G-regular, pairs (§4.3). (e) (Descent) Near a semisimple element ε_1 of H_1(F) whose image matches a semisimple η ∈ G(F), the factor on nearby pairs is, up to a constant, the Lie-algebra transfer factor of the descended endoscopic datum for G_η at the corresponding elements of 𝔥_ε and 𝔤_η (Langlands–Shelstad 'Descent for transfer factors', used by Waldspurger 2008 §§2.3, 3.9, 5.10–5.11). (f) (Global product formula) Let F be a number field, (H, s, ξ) a global endoscopic datum with z-pair, and (γ_1, δ) a pair of rational elements that match at every place (γ_1 ∈ H_1(F) strongly G-regular, δ ∈ G(F)). Then the canonical adelic transfer factor Δ_𝔸 = ∏_v Δ_v (defined using global a-data and χ-data and well defined because almost all local factors equal 1) satisfies Δ_𝔸(γ_1, δ) = 1 (Langlands–Shelstad Theorem 6.4.A; Corollary 6.4.B); consequently local absolute factors Δ_v can be normalized so that ∏_v Δ_v(γ_1, δ_v) = ⟨obs-invariant, κ⟩ for adelic δ = (δ_v), the pairing of ET.0/global-kottwitz-obstruction. The formula is stated for one fixed convention of ET.1/local-transfer-factor at every place; mixing Δ′ and Δ_D, or two normalizations of class field theory, invalidates it.

The precise hypotheses are: F local (a)–(e) or a number field (f), characteristic 0; the conventions of ET.1/local-transfer-factor fixed uniformly.

([R. P. Langlands and D. Shelstad, On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf), §4.1–4.4 (pp. 249–254); §6.1–6.4, Theorem 6.4.A and Corollary 6.4.B (pp. 264–269)). Invariance, the local hypothesis, extension to G-regular elements and passage to central extensions; the global product formula for the canonical adelic transfer factor.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §2.2 (p. 19), §2.3 (p. 21), §3.9 (p. 38), §§5.10–5.11 (pp. 70–71)). Behaviour of transfer factors under Z_1(F) (via Kottwitz–Shelstad Lemma 5.1.C), descent to Lie algebras and equality of transfer factors after descent, including the unramified normalization.

([R. E. Kottwitz, Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §16 'Semisimple descent' (p. 458)). Semisimple descent of orbital integrals to centralizers, the harmonic-analysis counterpart of descent for transfer factors.

(a) Langlands–Shelstad §4.1 'Invariance' and Waldspurger 2008 §2.2 (Kottwitz–Shelstad Lemma 5.1.C for the Z_1-behaviour).

(b)–(d) Langlands–Shelstad §§4.2–4.4 (the local hypothesis, extension to G-regular elements, passage to central extensions).

(e) Langlands–Shelstad 'Descent for transfer factors' (1990, not read); the statements used are those recalled by Waldspurger 2008 §2.3 and §3.9 and by Kottwitz's Clay notes §16 (semisimple descent for orbital integrals).

(f) Langlands–Shelstad §6.4, Theorem 6.4.A and Corollary 6.4.B (p. 269): the global a-data and χ-data give a product of local terms each of which is trivial globally by the product formula for characters and the global Tate–Nakayama duality (ET.0/tate-nakayama-tori (b)); the comparison with the obstruction pairing uses ET.0/global-kottwitz-obstruction.

**Acceptance.**

- For ordinary endoscopy of GL_n only H = GL_n occurs and the product formula is trivial; for SL_2 over a number field and H = R^1_{E/F} G_m with γ ∈ E^1 rational and regular, the product over all places of the local factors built from global a-data and χ-data equals 1.

*Needs:* `ET.1/local-transfer-factor`; `ET.0/global-kottwitz-obstruction`; `ET.0/tate-nakayama-tori`; `ET.0/z-pair`; `ReductiveGroupsPartII:RG2.1/z-extension`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-0-places-completions-and-the-product-formula`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

### ET.1.6 Twisted transfer factors and the Kottwitz–Shelstad corrections

Node `ET.1/twisted-transfer-factor` (construction).

Let F be local of characteristic 0, (G, θ, ω) a twisted triple with θ quasi-semisimple, (H, ℋ, s, ξ) a twisted endoscopic datum (ET.0/endoscopic-datum) with z-pair (H_1, ξ_1, ξ̂_1), and 𝒟_1 the set of matching pairs (γ_1, δ) of strongly G-regular γ_1 ∈ H_{1,z}(F) and strongly θ-regular δ ∈ G(F) (ET.0/norm-correspondence). The twisted transfer factor is built from twisted a-data and χ-data for the restricted roots of (T, θ), the twisted splitting invariant (Kottwitz–Shelstad 2012 §2.2, Lemma 2.2.1, Proposition 2.2.3) and the analogues of Δ_II, Δ_III, Δ_IV: (1) the corrected factors Δ_D = Δ_I^new Δ_II⁻¹ Δ_III Δ_IV (compatible with Deligne's normalization of local class field theory) and Δ′ = (Δ_I^new Δ_III)⁻¹ Δ_II Δ_IV (compatible with Langlands' classical normalization), where the 1999 product Δ_I Δ_II Δ_III Δ_IV is not independent of χ-data; (2) the new term Δ_I^new = ⟨λ_{a}(T, θ), s_{T,θ}⟩ uses the twisted splitting invariant; it agrees with Δ_I for cyclic base change but not in general, the first case where it differs being θ = transpose-inverse (up to inner automorphisms) on GL(2n + 1); (3) the Whittaker-normalized twisted factors Δ_{λ,D} and Δ′_λ. The relative factor Δ(γ_1, δ; γ̄_1, δ̄) is independent of all auxiliary choices and transforms under Z_1(F) by λ_1; an absolute factor is fixed by a base point or a Whittaker datum. For cyclic base change (G = R_{E/F} G_0, θ a generator of Gal(E/F), ω = 1) with H the quasi-split inner form of G_0 and s = 1, the transfer factor of the norm correspondence is 1 on pairs (γ, δ) with γ a norm of δ (Labesse's normalization of association, §3.2).

The precise hypotheses are: F local of characteristic 0; (G, θ, ω) twisted triple and (H, ℋ, s, ξ) a twisted endoscopic datum with z-pair.

([R. Kottwitz and D. Shelstad, On splitting invariants and sign conventions in endoscopic transfer](https://arxiv.org/abs/1201.5658v1), Introduction (PDF pp. 1–2); §2.2, Lemma 2.2.1, Proposition 2.2.3 (PDF p. 4); §§3.3–3.5, Proposition 3.5.2 (PDF pp. 7–9); §§5.3–5.6, (5.3.1), (5.4.1), (5.5.1)–(5.5.2) (PDF pp. 13–16)). The twisted splitting invariant, the new term Δ_I^new and its comparison with Δ_I, the corrected twisted factors Δ_D and Δ′ and their Whittaker-normalized forms; the GL(2n+1) transpose-inverse case and the equality Δ_I^new = Δ_I for cyclic base change.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.4 (pp. 10–11)). The twisted relative transfer factor of Kottwitz–Shelstad on 𝒟_1 × 𝒟_1 and an absolute factor compatible with it.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §3.2, Définition 3.2.1 (p. 76)). Association of functions for base change via stable orbital integrals compatible with the norm, with factor 1 on norms.

Use the twisted splitting invariant of Kottwitz–Shelstad 2012 §2.2 and its comparison with the untwisted one (§3.5, Proposition 3.5.2) to define Δ_I^new (§3.4).

Check independence of χ-data for Δ_D and Δ′ by the computation of Kottwitz–Shelstad 2012 §§5.3–5.4: the χ-data dependence of Δ_II and Δ_III cancels only with one of them inverted.

Whittaker normalization: §5.5, formulas (5.5.1)–(5.5.2).

Base change: Labesse §3.2 defines association with factor 1 on norms; Kottwitz–Shelstad 2012 §5.6 note Δ_I^new = Δ_I for cyclic base change, so Labesse's normalization is the specialization of either corrected factor up to sign conventions recorded in the consumer.

The definition exposes the following operations and relations.

- `TauCeti.TwistedTransferFactor` (data): Δ′ or Δ_D for a twisted endoscopic datum with z-pair.
- `TauCeti.TwistedTransferFactor.relative_independent` (characterisation): Independence of the relative factor of auxiliary data.
- `TauCeti.TwistedTransferFactor.newTermI` (projection): The term Δ_I^new from the twisted splitting invariant.
- `TauCeti.TwistedTransferFactor.newTermI_eq_baseChange` (simp): Δ_I^new = Δ_I for cyclic base change.
- `TauCeti.TwistedTransferFactor.whittaker` (constructor): Whittaker-normalized twisted factors.
- `TauCeti.TwistedTransferFactor.untwisted` (compatibility): For θ = 1 the twisted factor is the ordinary one with the same convention.

**Checks.**

- `twistedTransferFactor_basechange_norm` (computation): For G = R_{E/F} G_m, θ the Galois automorphism, H = G_m and s = 1, Δ(γ, δ) = 1 when γ = N_{E/F}(δ) and 0 otherwise.
- `twistedTransferFactor_untwisted` (degenerate): For θ = 1 and ω = 1, Δ′ and Δ_D reduce to the ordinary factors of ET.1/local-transfer-factor in the two conventions.
- `twistedTransferFactor_gl_odd_sign` (computation): For G = GL(2n + 1) with θ the transpose-inverse composed with an inner automorphism, Δ_I^new ≠ Δ_I, and the classical and renormalized factors Δ′ and Δ_D differ on suitable matching pairs by the sign recorded in Kottwitz–Shelstad 2012 §3.5.
- `twistedTransferFactor_1999_dependence` (non-example): The 1999 product Δ_I Δ_II Δ_III Δ_IV depends on the χ-data (Kottwitz–Shelstad 2012, introduction), so it is not a transfer factor.

**Acceptance.**

- For base change of G_m the factor is 1 on norms and 0 elsewhere.
- For θ = 1 the twisted factors reduce to the ordinary Δ′ and Δ_D.
- For GL_{2n+1} with transpose-inverse, Δ_I^new differs from Δ_I.

*Used by:* ET.4 (part 2) (the twisted unitary trace formula for cyclic base change); ET.3/twisted-fundamental-lemma-and-transfer (the twisted fundamental lemma and transfer are stated with these factors); ModularityAndLanglandsExtensions:ML.4 (the stabilization behind Arthur's classification uses twisted endoscopy of GL_n ⋊ θ).

*Needs:* `ET.1/local-transfer-factor`; `ET.1/a-data-chi-data`; `ET.0/endoscopic-datum`; `ET.0/z-pair`; `ET.0/norm-correspondence`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

### ET.1.7 Transfer factors for Lie algebras

Node `ET.1/lie-algebra-transfer-factor` (construction).

Let F be local of characteristic 0 (or a local field of characteristic p not dividing |W| in the equal-characteristic setting of Ngô), G quasi-split connected reductive and (H, s, ξ) an endoscopic datum (no z-pair is needed on the Lie algebra). Matching of regular semisimple elements of 𝔥(F) and 𝔤(F) is the Lie-algebra version of ET.0/norm-correspondence (stable classes on both sides, ET.0/semisimple-conjugacy). The Lie-algebra transfer factor Δ(X_H, X) on matching regular semisimple pairs is defined as in Langlands–Shelstad with Δ_II, Δ_III2 replaced by their infinitesimal versions; it is a function of the form Δ(X_H, X) = κ(inv(X_0, X))·Δ_IV(X_H, X)·c for a base point X_0 in the stable class of X, with Δ_IV(X_H, X) = |D_G(X)|^{1/2}|D_H(X_H)|^{-1/2}, inv the invariant of ET.0/rational-classes-in-stable-class and c a constant fixed by the choice of base point. The relative factor is independent of choices; for quasi-split G the base point can be chosen uniformly in the stable class (the Kostant-section normalization of Kottwitz, used to state Ngô's theorem, is recorded with ET.3/lie-algebra-fundamental-lemma). The relative discriminant r_{G,H}(X_H) = val(D_G(X))/2 − val(D_H(X_H))/2 measures |Δ_IV|. Near the identity the group transfer factor of ET.1/local-transfer-factor descends to this Lie-algebra factor up to a constant (ET.1/transfer-factor-properties (e)). For unitary groups the factor takes the explicit form of ET.1/unitary-transfer-factor.

The precise hypotheses are: F local; G quasi-split for the Kostant normalization; in equal characteristic, p ∤ |W|.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §1.9, Lemmes 1.9.1–1.9.2 (pp. 19–21); §1.10, Lemmes 1.10.1–1.10.2 and (1.10.3) (pp. 21–22); §1.11, Théorème 1.11.1 and §1.11.3 (pp. 23–24)). The transfer map ν : 𝔠_H → 𝔠, the discriminant and resultant, Kottwitz's identification of the transfer factor with the Kostant-section normalization, and the fundamental lemma in the forms with q^{r_{GH}} and with Δ_G, Δ_H.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.6 (p. 12); §4.7 (p. 51)). Stable classes, correspondence, transfer factor and transfer for Lie algebras of quasi-split groups, without z-pairs; the unramified normalization of Lie-algebra transfer factors.

([G. Laumon and B. C. Ngô, Le lemme fondamental pour les groupes unitaires](https://arxiv.org/abs/math/0404454v2), §1.5, Théorème 1.5.1 (PDF p. 10)). For unitary groups the fundamental lemma in the form O^κ_γ = (−1)^r q^r SO^H_γ, with r = r_{I_1,I_2}.

Langlands–Shelstad's construction carries over to Lie algebras with the exponential replaced by the identity (Waldspurger 2008 §1.6; Kottwitz 'Transfer factors for Lie algebras', Represent. Theory 3 (1999), which was not read: its AMS copy refused automated access).

Base points: for quasi-split G every regular semisimple stable class over F contains a rational element whose centralizer data are uniform in the class (Kottwitz; the Kostant-section version is stated in ET.3/lie-algebra-fundamental-lemma, after Ngô §1.11, p. 23).

The relative discriminant and r_{G,H}: Ngô §1.10, Lemmes 1.10.1–1.10.2 and (1.10.3), p. 22; the restatement with Δ_G, Δ_H: §1.11.3, p. 24.

Unramified normalization and its agreement with the group factor after descent: Waldspurger 2008 §§4.6–4.7, 5.10–5.11.

The definition exposes the following operations and relations.

- `TauCeti.LieTransferFactor` (data): Δ(X_H, X) on matching regular semisimple pairs.
- `TauCeti.LieTransferFactor.ofBasePoint` (constructor): The absolute factor attached to a base point in each stable class.
- `TauCeti.LieTransferFactor.relDiscriminant` (data): r_{G,H}(a_H) = val of the relative discriminant / 2.
- `TauCeti.LieTransferFactor.stablyConj` (relation): Behaviour under stable conjugacy through κ(inv).
- `TauCeti.LieTransferFactor.descent` (compatibility): Agreement with the group factor after descent, up to a constant.

**Checks.**

- `lieTransferFactor_principal` (degenerate): For H = G and s = 1, Δ(X, X′) = 1 on stably conjugate X, X′.
- `lieTransferFactor_torus_datum` (computation): For an elliptic datum whose group H is a torus (e.g. 𝔤 = 𝔰𝔩_2 and H = R^1_{E/F} G_m), D_H = 1, so r_{G,H}(a_H) = val(D_G(a))/2 and |Δ_IV| = |D_G(a)|^{1/2} = q^{−r_{G,H}(a_H)}.
- `lieTransferFactor_conj` (characterisation): Δ(X_H, Ad(g)X) = Δ(X_H, X) for g ∈ G(F) and Δ(X_H, X′) = κ(inv(X, X′))⁻¹ Δ(X_H, X) for X′ stably conjugate to X.
- `lieTransferFactor_not_group_globally` (non-example): The Lie-algebra factor agrees with the group factor only after descent near a semisimple element and up to a constant; away from the identity the exponential is not defined on all of 𝔤(F).

**Acceptance.**

- For the principal datum the Lie-algebra factor is 1 on stably conjugate pairs.
- For an elliptic datum whose H is a torus, r_{G,H}(a_H) = val(D_G(a))/2.
- The factor is invariant under G(F)-conjugation and changes by κ(inv)⁻¹ under stable conjugacy.

*Used by:* ET.3/lie-algebra-fundamental-lemma (the factor whose Kostant-section normalization appears in Ngô's statement); ET.3/local-transfer-existence (Waldspurger's transfer is first proved on Lie algebras); ET.2b/endoscopic-comparison (the shift r_{G,H}(D) is the global version of r_{G,H}(a_H)).

*Needs:* `ET.1/local-transfer-factor`; `ET.0/endoscopic-datum`; `ET.0/rational-classes-in-stable-class`; `ET.0/norm-correspondence`; `ET.0/semisimple-conjugacy`.

### ET.1.8 Matching test functions and transfer classes ★

Node `ET.1/matching-functions` (definition).

Let F be local of characteristic 0, (G, θ, ω) with endoscopic datum (H, ℋ, s, ξ), z-pair (H_1, λ_1) and an absolute transfer factor Δ (ET.1/local-transfer-factor, ET.1/twisted-transfer-factor). For f ∈ C_c^∞(G(F)) define O^{G,ω}_{γ_1}(f) = Σ_δ Δ(γ_1, δ) O^ω_δ(f), the sum over representatives of G(F)-classes (θ-classes) of δ matching γ_1. A function f^{H_1} ∈ C_1^∞(H_1(F)) (locally constant, compactly supported modulo Z_1(F), with f(zx) = λ_1(z)⁻¹ f(x)) is a transfer of f, written f ↔ f^{H_1}, if SO_{γ_1}(f^{H_1}) = O^{G,ω}_{γ_1}(f) for every strongly G-regular γ_1 ∈ H_{1,z}(F), and SO_{γ_1}(f^{H_1}) = 0 when no δ matches γ_1. A transfer, if it exists, is unique only modulo the subspace of functions all of whose strongly regular stable orbital integrals vanish; the canonical object is the class of f^{H_1} in the space SI(H_1) of stable orbital integrals (the quotient of C_1^∞(H_1(F)) by that kernel), and the transfer map f ↦ [f^{H_1}] is linear. The same definition applies to Lie algebras (no z-pair) and, at archimedean places, to K-finite or Schwartz functions. For cyclic base change, f ∈ C_c^∞(G_0(E)) and f^H ∈ C_c^∞(H(F)) are associated if SO_γ(f^H) = SO_δ^θ(f) whenever γ is a norm of δ and SO_γ(f^H) = 0 when γ is not a norm (Labesse §3.2).

The precise hypotheses are: F local of characteristic 0; an endoscopic datum with z-pair and an absolute transfer factor.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.5 (pp. 11–12)). The endoscopic orbital integral O^{G,ω}_{γ_1}, the stable orbital integral SO_{γ_1}, the definition of transfer on C_1^∞(H_{1,z}(F)) and the transfer conjecture.

([S. Leslie, The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3), §2.2.3 (p. 19)). Smooth transfer on Herm(W_1): SO(f_{a,b}, (y_a, y_b)) = Δ((y_a, y_b), y) Orb^κ(f, y) for matching pairs and 0 when no y matches (extraction item PAPER-LESLIE-25/16).

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §3.2, Définition 3.2.1 (p. 76)). Association of functions for base change and the definition of possible (stable) transfer.

Well definedness of O^{G,ω}_{γ_1}: finitely many classes match γ_1 (ET.0/rational-classes-in-stable-class (b)), and the sum does not depend on the representatives because Δ(γ_1, δ)O^ω_δ(f) is a class function of δ (Waldspurger 2008 §1.5).

Ambiguity: two transfers differ by a function in the kernel of all SO_{γ_1}; stable orbital integrals of strongly regular elements determine the class in SI (by definition of SI).

Base change association: Labesse §3.2; Clozel (Proposition 7.2 there) shows that it suffices to test regular elements.

The definition exposes the following operations and relations.

- `TauCeti.IsTransfer` (data): The relation f ↔ f^{H_1}.
- `TauCeti.stableOrbitalIntegralSpace` (data): SI(H_1): C_1^∞(H_1(F)) modulo the kernel of all strongly regular stable orbital integrals.
- `TauCeti.transferMap` (data): The linear map C_c^∞(G(F)) → SI(H_1), defined where transfer exists.
- `TauCeti.IsTransfer.add` (structure): Linearity: transfers of f and f′ add to a transfer of f + f′.
- `TauCeti.IsTransfer.unique` (extensionality): Two transfers of f have the same image in SI(H_1).
- `TauCeti.IsTransfer.lie` (other): The Lie-algebra version.
- `TauCeti.IsAssociated` (other): Base-change association of Labesse.

**Checks.**

- `transfer_principal_quasiSplit` (degenerate): For H = G quasi-split, s = 1 and Δ the base-point factor, f is a transfer of itself.
- `transfer_class_unique` (characterisation): If f^H and f′^H are both transfers of f then SO_γ(f^H − f′^H) = 0 for all strongly G-regular γ, and conversely any such difference preserves transfer.
- `transfer_unramified_unit` (computation): In the unramified situation, the characteristic function of H(𝒪) (suitably normalized) is a transfer of the characteristic function of G(𝒪) (the fundamental lemma, ET.3/group-fundamental-lemma).
- `transfer_not_function` (non-example): The transfer is not a well-defined function on H(F): adding any function with vanishing regular stable orbital integrals (e.g. f − f^w for a Weyl-twisted torus function with κ-sign) gives another transfer.

**Acceptance.**

- For the principal datum of quasi-split G, f is a transfer of itself.
- Two transfers of f have the same stable orbital integrals.
- In the unramified situation the unit function of H(𝒪) is a transfer of that of G(𝒪) (ET.3/group-fundamental-lemma).

*Used by:* ET.3/local-transfer-existence (existence of a transfer for every f); ET.3/lie-algebra-fundamental-lemma (the unit function of 𝔥(𝒪) is a transfer of that of 𝔤(𝒪)); ET.4 (part 2) (matching test functions in the stable trace formula); GL2AutomorphicRepresentationsAndTransfer:R17.2/specialized-trace-comparison (matching for GL_2 ordinary, inner-form and cyclic transfer).

*Needs:* `ET.1/local-transfer-factor`; `ET.1/twisted-transfer-factor`; `ET.1/kappa-and-stable-orbital-integrals`; `ET.1/orbital-integral`; `ET.0/norm-correspondence`; `ET.0/z-pair`.

### ET.1.9 Shalika germs on p-adic Lie algebras

Node `ET.1/shalika-germs` (theorem).

Let F be a p-adic field and G connected reductive over F with Lie algebra 𝔤. (a) The set of nilpotent G(F)-orbits in 𝔤(F) is finite, and each nilpotent orbit 𝒪 carries an invariant Radon measure μ_𝒪 extending to 𝔤(F) (nilpotent orbital integrals). (b) (Germ expansion) There are functions Γ_𝒪 on 𝔤_rs(F) (Shalika germs), one for each nilpotent orbit, such that for every f ∈ C_c^∞(𝔤(F)) there is a neighbourhood U_f of 0 with O_X(f) = Σ_𝒪 Γ_𝒪(X) μ_𝒪(f) for all X ∈ U_f ∩ 𝔤_rs(F); the germs are uniquely determined as germs at 0. (c) (Homogeneity) For t ∈ F^×, Γ_𝒪(t²X) = |t|^{−dim 𝒪} Γ_𝒪(X) (after normalizing measures compatibly), and the germ Γ_{0} of the zero orbit and the regular germ are explicitly known (the regular germ is constant on each Cartan subalgebra up to the measure normalization). (d) (Descent) Near a semisimple element, orbital integrals have an expansion in terms of the germs of the centralizer (semisimple descent).

The precise hypotheses are: F p-adic of characteristic 0 (the germ expansion also holds in large positive characteristic as used by Waldspurger 2006).

([R. E. Kottwitz, Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §6 'Shalika germs' (p. 418); §15 'Harish-Chandra's compactness lemma' (p. 457); §16 'Semisimple descent' (p. 458); §17 'Basic results on Shalika germs on 𝔤' (p. 459); §27 'Deeper results on Shalika germs' (p. 512)). The germ expansion of orbital integrals near 0 in terms of nilpotent orbital integrals, its uniqueness and homogeneity, and semisimple descent.

([J.-L. Waldspurger, Endoscopie et changement de caractéristique](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopie.pdf), Introduction and §7 (Théorème 7.2, p. 67)). Orbital integrals of functions attached to Moy–Prasad lattices depend on F only through its residue field; their germ behaviour is the input of the change of characteristic.

(a) Finiteness of nilpotent orbits and the Deligne–Ranga Rao measures (Kottwitz, Clay notes §17).

(b) Shalika's germ expansion: Kottwitz, Clay notes §6 (for GL_2 and in general) and §17 'Basic results on Shalika germs on 𝔤', via Harish-Chandra's compactness lemma (§15) and the density of regular orbital integrals.

(c) Homogeneity from the scaling X ↦ t²X and the dimension of 𝒪 (Kottwitz, Clay notes §17); deeper results in §27.

(d) Semisimple descent (Kottwitz, Clay notes §16).

**Acceptance.**

- For 𝔤 = 𝔤𝔩_2, the nilpotent orbits are {0} and the regular one; the germ of {0} on an elliptic Cartan is a constant multiple of |D(X)|^{−1/2}, and the regular germ is constant.
- For 𝔤 = 𝔱 a torus there is one nilpotent orbit {0} and Γ_0 = 1.

*Needs:* `ET.1/orbital-integral`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`.

### ET.1.10 Fourier transforms of orbital integrals and their compatibility with transfer

Node `ET.1/fourier-transform-orbital-integrals` (theorem).

Let F be a p-adic field, G connected reductive, ψ a nontrivial additive character and ⟨·,·⟩ a nondegenerate G-invariant symmetric bilinear form on 𝔤 (existing when p is large relative to G), with self-dual Haar measure. For f ∈ C_c^∞(𝔤(F)) let f̂(Y) = ∫ f(X)ψ(⟨X, Y⟩) dX. (a) (Harish-Chandra) For X ∈ 𝔤_rs(F) the distribution f ↦ O_X(f̂) is represented by a locally integrable function Ô_X on 𝔤(F), locally constant on 𝔤_rs(F), and |D(Y)|^{1/2} Ô_X(Y) is locally bounded. (b) (Waldspurger) For an endoscopic datum (H, s, ξ) of quasi-split G and the Lie-algebra transfer factors (ET.1/lie-algebra-transfer-factor), if f^H is a transfer of f then γ_ψ(𝔤) γ_ψ(𝔥)⁻¹ \widehat{f^H} is a transfer of f̂, where γ_ψ are the Weil constants of the quadratic forms; equivalently, the transfer commutes with the Fourier transform up to this explicit constant. (c) Consequently, if the transfer exists for all functions supported near 0 whose Fourier transforms are supported on topologically nilpotent elements, it exists for all of C_c^∞(𝔤(F)) (the reduction in Waldspurger's proof that the fundamental lemma implies transfer).

The precise hypotheses are: F p-adic of characteristic 0; p large enough for the invariant form and exponential to behave (Waldspurger's standing hypothesis).

([R. E. Kottwitz, Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §26 'Niceness of Ô_X for X ∈ 𝔤_rs' (p. 509); §25 (p. 507)). Harish-Chandra's theorem that the Fourier transform of a regular semisimple orbital integral is a locally integrable function, locally constant on the regular set, with a bound after multiplying by |D|^{1/2}.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §3.3, before Théorème 3.3.1 (p. 78)). Waldspurger's difficult result that transfer between a connected reductive G_0(F) and its quasi-split inner form is possible (Corollaire 1.7 of his 1997 paper).

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.4 and Remark 3.4 (p. 15)). The transfer and the fundamental lemma for unit elements are known in all cases, due to Waldspurger, Laumon–Ngô and Ngô, with Hales' reduction to unit elements.

(a) Harish-Chandra's local integrability theorem on the Lie algebra (Kottwitz, Clay notes §26 'Niceness of Ô_X for X ∈ 𝔤_rs', p. 509).

(b) Waldspurger, 'Le lemme fondamental implique le transfert', Compositio Math. 105 (1997), main theorem on Fourier transform and transfer; the paper itself was not freely available and was not read; the statement is the one recalled by Labesse (§3.3, citing its Corollaire 1.7 for inner forms) and by Ngô (introduction, p. 2) and Shin (§3.4, p. 15). Recorded as a gap on source access.

(c) Combine (b) with homogeneity of germs (ET.1/shalika-germs) and the local gluing lemma for transfer (Waldspurger 2008 §2.2).

**Acceptance.**

- For 𝔤 = 𝔱 a torus, Ô_X(Y) = ψ(⟨X, Y⟩) and transfer is the identity.
- For 𝔤𝔩_n (no proper elliptic endoscopy) (b) is the trivial statement that the Fourier transform preserves orbital integral identities up to γ_ψ(𝔤)γ_ψ(𝔤)⁻¹ = 1.

*Needs:* `ET.1/orbital-integral`; `ET.1/shalika-germs`; `ET.1/lie-algebra-transfer-factor`; `ET.1/matching-functions`.

### ET.1.11 The transfer factor for unitary Lie algebras

Node `ET.1/unitary-transfer-factor` (application).

Let E/F be an unramified quadratic extension of p-adic fields (p odd), V, V_a, V_b Hermitian spaces with a + b = n and the elliptic endoscopic datum (U(V_a) × U(V_b), s, ξ) of U(V) (ET.0/unitary-elliptic-endoscopic-data, local version). For matching regular semisimple δ ∈ Herm(V) and (δ_a, δ_b) (ET.0/unitary-hermitian-matching) let D(δ) = ∏_{x_a, x_b}(x_a − x_b), the product over the eigenvalues x_a of δ_a and x_b of δ_b (the quotient of Weyl discriminants of Langlands–Shelstad's Δ_IV). For a nice matching pair (δ = φ_{a,b}(δ_a, δ_b), V ≅ V_a ⊕ V_b) the transfer factor is Δ((δ_a, δ_b), δ) = η_{E/F}(D(δ))|D(δ)|_F, and in general Δ((δ_a, δ_b), δ) = κ(inv(δ, δ′)) η_{E/F}(D(δ))|D(δ)|_F with δ′ = φ_{a,b}(δ_a, δ_b) and κ the endoscopic character (ET.0/unitary-hermitian-matching (c)). Δ vanishes on non-matching pairs and Δ((δ_a, δ_b), δ) Orb^κ(f, δ) depends only on the stable class of δ. This is the specialization of ET.1/lie-algebra-transfer-factor to unitary Lie algebras, in the normalization used by Laumon–Ngô and Leslie.

The precise hypotheses are: E/F unramified quadratic, p odd; the endoscopic datum U(V_a) × U(V_b) of U(V).

([S. Leslie, The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3), §2.2.3, (2.7) and Remark 2.8 (pp. 18–19)). The transfer factor for Herm(W_1): η_{E/F}(D(δ))|D(δ)|_F for nice matching pairs and κ(inv(δ, δ′)) times it in general; D(δ) is the quotient of Weyl discriminants of Δ_IV (extraction item PAPER-LESLIE-25/15).

([G. Laumon and B. C. Ngô, Le lemme fondamental pour les groupes unitaires](https://arxiv.org/abs/math/0404454v2), §1.5, Théorème 1.5.1 (PDF p. 10)). The unitary Lie-algebra fundamental lemma O^κ_γ = (−1)^r q^r SO^H_γ uses this normalization.

Specialize the Lie-algebra factor: Δ_IV gives |D(δ)| and the remaining terms combine to the quadratic character η_{E/F}(D(δ)) for the base point given by nice matching pairs (Leslie Remark 2.8 and its Appendix A of a companion paper, cited there).

Behaviour under stable conjugacy: ET.1/lie-algebra-transfer-factor and ET.0/unitary-hermitian-matching (c).

**Acceptance.**

- n = 2, a = b = 1: δ_a = x, δ_b = y with x ≠ y in F, D = x − y, Δ = η_{E/F}(x − y)|x − y|_F on the nice pair.
- a = n, b = 0 (the principal datum): D = 1 and Δ = 1.

*Needs:* `ET.1/lie-algebra-transfer-factor`; `ET.0/unitary-hermitian-matching`; `ET.0/unitary-elliptic-endoscopic-data`.

### ET.1.12 Harish-Chandra's character theory for real reductive groups

Node `ET.1/real-character-theory` (theorem).

Let G be a connected reductive group over ℝ (more generally a real reductive group in the sense of AutomorphicFormsOnReductiveGroups:AF.1/real-reductive-group), K a maximal compact subgroup and π a finite-length admissible representation of G(ℝ) (an admissible (𝔤, K)-module with its Casselman–Wallach globalization). (a) For f ∈ C_c^∞(G(ℝ)), π(f) is trace class, and Θ_π(f) = tr π(f) is a conjugation-invariant distribution, an eigendistribution of the centre Z(𝔤) of U(𝔤_ℂ) acting through the infinitesimal character of π when π has one. (b) (Harish-Chandra's regularity theorem) Θ_π is a locally integrable function on G(ℝ), real-analytic on the set G_reg(ℝ) of strongly regular elements: Θ_π(f) = ∫_{G_reg(ℝ)} f(x)Θ_π(x) dx. (c) |D(x)|^{1/2}Θ_π(x) is locally bounded, and on each Cartan subgroup Θ_π is a finite combination of exponentials divided by the Weyl denominator; for discrete series π with Harish-Chandra parameter λ, on the compact Cartan T: Θ_π = (−1)^{q(G)} Σ_{w ∈ W_K} ε(w) e^{wλ}/Δ, and Harish-Chandra's algorithm determines Θ_π on the other Cartan subgroups. (d) Characters determine finite-length representations up to semisimplification, and the characters of the tempered irreducible representations are linearly independent.

The precise hypotheses are: G connected reductive over ℝ (all real reductive groups, not only the unitary groups of ET.4–ET.7); π of finite length, admissible.

([J. Arthur, An introduction to the trace formula](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §24 (pp. 157–160)). The character of a real irreducible representation is the distribution f ↦ tr π(f); Harish-Chandra proved it is a locally integrable function analytic on the strongly regular set, with a Weyl-type formula for discrete series on the compact torus and an algorithm for other tori.

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), §§5.1, 5.6 (arXiv v5; extraction item P18)). Trace distributions of finite-length admissible representations of real reductive groups, their invariance and representability by the regular semisimple character function.

(a) Trace class property and invariance from admissibility (AutomorphicFormsOnReductiveGroups:AF.1/harish-chandra-admissibility) and the Casselman–Wallach globalization (AF.1/casselman-wallach-globalization).

(b)–(c) Harish-Chandra's regularity theorem for invariant eigendistributions (Harish-Chandra, 'Invariant eigendistributions on a semisimple Lie group', Trans. AMS 119 (1965), not read: the AMS copy refused automated access); the statement is the one recalled by Arthur (Clay introduction §24, pp. 158–159) and required by Kaletha (extraction item P18). The discrete series character formula on the compact Cartan is part of Harish-Chandra's classification (AF.1/discrete-series).

(d) Linear independence of characters: standard consequence of (b) and the Langlands classification (AF.1/langlands-classification).

**Acceptance.**

- For G = U(1) = SO(2): Θ_{χ_k}(e^{iθ}) = e^{ikθ}.
- For G = SL_2(ℝ) and the discrete series D_k^±: on the compact Cartan, Θ_{D_k^+} + Θ_{D_k^−} = −(e^{i(k−1)θ} − e^{−i(k−1)θ})/(e^{iθ} − e^{−iθ}), the negative of the character of the (k−1)-dimensional representation.

*Needs:* `AutomorphicFormsOnReductiveGroups:AF.1/real-reductive-group`; `AutomorphicFormsOnReductiveGroups:AF.1/admissible-gk-module`; `AutomorphicFormsOnReductiveGroups:AF.1/harish-chandra-admissibility`; `AutomorphicFormsOnReductiveGroups:AF.1/casselman-wallach-globalization`; `AutomorphicFormsOnReductiveGroups:AF.1/discrete-series`; `AutomorphicFormsOnReductiveGroups:AF.1/langlands-classification`; `AutomorphicFormsOnReductiveGroups:AF.1/infinitesimal-character`.

### ET.1.13 Transfer at the real place

Node `ET.1/real-transfer` (theorem).

Let G be connected reductive over ℝ with an endoscopic datum (H, ℋ, s, ξ), z-pair and Langlands–Shelstad transfer factor (ET.1/local-transfer-factor). (a) (Shelstad) For every f ∈ C_c^∞(G(ℝ)) (indeed every Schwartz or K-finite f) there is f^{H_1} ∈ C_1^∞(H_1(ℝ)) whose strongly regular stable orbital integrals are the endoscopic orbital integrals of f: transfer exists at the real place. (b) Spectral form: for tempered L-packets the transfer is dual to the endoscopic character identities expressing the stable character of an H-packet, transported by ξ, as a combination Σ_π Δ(φ_H, π)Θ_π of characters of the corresponding G-packet. (c) For cyclic base change of unitary groups at ℝ (or ℂ/ℝ), K-finite transfer exists and is compatible with the twisted Paley–Wiener theorem (Labesse §3.5, Propositions 3.5.2–3.5.4).

The precise hypotheses are: F = ℝ; an endoscopic datum with z-pair (and, for (c), cyclic base change).

([J. Arthur, An introduction to the trace formula](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §27 (pp. 192–204, in particular p. 203)). For archimedean places the Langlands–Shelstad transfer conjecture was established by Shelstad, whose results for real groups motivated the general transfer factors.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §3.5, Lemme 3.5.1, Propositions 3.5.2–3.5.4 and 3.5.6 (pp. 82–87)). K-finite transfer for base change at archimedean places through the twisted Paley–Wiener theorem.

(a)–(b) Shelstad's theory of real endoscopy (Shelstad, 'L-indistinguishability for real groups', Math. Ann. 259 (1982), and subsequent papers; not read for this plan). Arthur's Clay introduction §27 (p. 192 ff.) states that the transfer conjecture at archimedean places was established by Shelstad and motivated the general transfer factors; recorded as a source-access gap.

(c) Labesse §3.5: Propositions 3.5.2–3.5.4 establish K-finite base-change transfer at archimedean places using the twisted trace Paley–Wiener theorem of Clozel–Delorme, and Proposition 3.5.6 for complex groups.

**Acceptance.**

- For the principal datum the transfer is the identity on stable orbital integrals.
- For G = SL_2(ℝ) and H = U(1): the κ-character Θ_{D_k^+} − Θ_{D_k^−} is, up to the sign fixed by the transfer factor normalization, the transfer of a character of U(1) (Shelstad's character identity).

*Needs:* `ET.1/local-transfer-factor`; `ET.1/matching-functions`; `ET.1/real-character-theory`; `AutomorphicFormsOnReductiveGroups:AF.1/tempered-square-integrable`.

### ET.1.14 Pseudo-coefficients and Euler–Poincaré functions at the real place

Node `ET.1/pseudocoefficients` (construction).

Let G be connected reductive over ℝ with A_G the split component of the centre, ξ an irreducible finite-dimensional algebraic representation of G_ℂ with central character χ on A_G(ℝ)^0, and q(G) = ½ dim(G(ℝ)/K_∞A_G(ℝ)^0). Assume G(ℝ) has discrete series modulo A_G(ℝ)^0 (equivalently a maximal ℝ-torus anisotropic modulo A_G). (a) (Clozel–Delorme) For each discrete series π (modulo the centre) there is a pseudo-coefficient φ_π ∈ C_c^∞(G(ℝ), χ⁻¹), K-finite, with tr π′(φ_π) = 1 if π′ ≅ π and 0 for every other irreducible tempered π′ with the same central character, and tr π′(φ_π) given by the Euler–Poincaré pairing for non-tempered π′. (b) For the L-packet Π(ξ^∨) of discrete series with the infinitesimal character of ξ^∨, the Euler–Poincaré function φ_ξ = |Π(ξ^∨)|⁻¹ Σ_{π ∈ Π(ξ^∨)} φ_π satisfies tr π′(φ_ξ) = (−1)^{q(G)} |Π(ξ^∨)|⁻¹ Σ_i (−1)^i dim H^i(𝔤, K_∞; π′ ⊗ ξ) for every irreducible admissible π′ with the given central character. Put f_ξ = (−1)^{q(G)} |Π(ξ^∨)| φ_ξ (Kottwitz's Euler–Poincaré function, tr π′(f_ξ) = Σ_i (−1)^i dim H^i(𝔤, K_∞; π′ ⊗ ξ)). The orbital integrals of f_ξ vanish at regular semisimple elements that are not elliptic, and at an elliptic semisimple γ, SO_γ(f_ξ) = (−1)^{q(G)} vol(Ḡ_γ(ℝ)/A_G(ℝ)^0)⁻¹ tr ξ(γ), with Ḡ_γ the inner form of G_γ that is compact modulo A_G. (c) The construction applies to every inner form of a quasi-split group of arbitrary signature at ∞ (needed for the unitary groups of Caraiani–Scholze), and to a twisted space (Labesse's Lefschetz functions for base change).

The precise hypotheses are: G connected reductive over ℝ with discrete series modulo the centre; ξ irreducible algebraic.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.5, (3.11)–(3.12) (pp. 17–18); §3.6, Lemma 3.7, (3.13)–(3.15) and Remark 3.9 (pp. 18–19)). Pseudo-coefficients φ_π of discrete series, the averaged function φ_{φ_H} over an L-packet (an Euler–Poincaré function), q(G), and the credit to Clozel–Delorme for existence and to Labesse for the twisted analogue.

([J. Arthur, An introduction to the trace formula](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §24, (24.2)–(24.4) (pp. 159–160)). Discrete series characters on elliptic tori, the function Φ′_M(μ, γ) built from them and the global term χ(M_γ) with q(M_γ).

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1), arXiv v1: §5.2, p. 74; §5.3, pp. 75–76 (published Annals pp. 735, 737–738, not read)). The archimedean test functions as precise linear combinations of Euler–Poincaré functions and pseudo-coefficients, Labesse's Lefschetz functions for base change, and the remark that the inner form at infinity is more general than the Harris–Taylor signature of Shin's paper (extraction item PAPER-CARAIANI-SCHOLZE-17/149).

(a) Clozel–Delorme's invariant Paley–Wiener theorem (Invent. Math. 77 (1984); Ann. Sci. ÉNS 1990) gives functions with prescribed tempered traces; not read, recalled by Shin (p. 18–19: credits Clozel–Delorme for existence) and Arthur (§24).

(b) The Euler–Poincaré property follows from Wigner's lemma (AutomorphicFormsOnReductiveGroups:AF.4/wigner-lemma) and Vogan–Zuckerman (AF.4/vogan-zuckerman), with q(G) as in AF.4/l0-q0-invariants. The formula for stable orbital integrals at elliptic elements uses Harish-Chandra's character formula on the compact Cartan and the vanishing of the discrete series characters on non-elliptic tori after summing over the packet (Arthur §24 (24.2)–(24.4); Shin (3.12), (3.14)).

(c) The construction does not use quasi-splitness; the arbitrary-signature case is required by Caraiani–Scholze (compact paper, §5.2, p. 735; extraction item PAPER-CARAIANI-SCHOLZE-17/149).

The definition exposes the following operations and relations.

- `TauCeti.pseudoCoefficient` (constructor): A pseudo-coefficient φ_π of a discrete series π (chosen; only its traces and orbital integrals are canonical).
- `TauCeti.eulerPoincareFunction` (constructor): φ_ξ = |Π(ξ^∨)|⁻¹ Σ φ_π.
- `TauCeti.trace_pseudoCoefficient` (characterisation): Trace identities of φ_π on tempered representations.
- `TauCeti.trace_eulerPoincare` (characterisation): tr π′(φ_ξ) = EP(π′ ⊗ ξ)/|Π(ξ^∨)|.
- `TauCeti.stableOrbitalIntegral_eulerPoincare` (relation): SO_γ(f_ξ) = (−1)^{q(G)} vol(Ḡ_γ(ℝ)/A_G(ℝ)^0)⁻¹ tr ξ(γ) for elliptic semisimple γ, and O_γ(f_ξ) = 0 for regular non-elliptic γ.
- `TauCeti.eulerPoincare_innerForm` (compatibility): The construction for every inner form, compatible with transfer to the quasi-split form.

**Checks.**

- `eulerPoincare_trace_trivial` (computation): For G = SL_2(ℝ) and ξ trivial: q(G) = 1, Π(ξ^∨) = {D_2^+, D_2^−}, the trivial representation has (𝔤, K)-cohomology ℂ in degrees 0 and 2, so tr 1(φ_ξ) = (−1)·2/2 = −1, while tr D_2^±(φ_ξ) = (−1)·(−1)/2 = 1/2.
- `pseudocoefficient_trace` (characterisation): tr π(φ_π) = 1 and tr π′(φ_π) = 0 for tempered π′ ≇ π with the same central character.
- `eulerPoincare_compact` (degenerate): If G(ℝ) is compact (A_G trivial), q(G) = 0, Π(ξ^∨) = {ξ^∨} and f_ξ = vol(G(ℝ))⁻¹ tr ξ, so SO_γ(f_ξ) = vol(G_γ(ℝ))⁻¹ tr ξ(γ) by Schur orthogonality.
- `eulerPoincare_nonelliptic_vanish` (non-example): O_γ(φ_ξ) = 0 for γ regular semisimple non-elliptic (e.g. hyperbolic elements of SL_2(ℝ)), so φ_ξ is not a positive multiple of a function concentrated near the identity.

**Acceptance.**

- For SL_2(ℝ) and ξ trivial, tr 1(φ_ξ) = −1 and tr D_2^±(φ_ξ) = 1/2.
- For compact G(ℝ), f_ξ = vol(G(ℝ))⁻¹ tr ξ and SO_γ(f_ξ) = vol(G_γ(ℝ))⁻¹ tr ξ(γ).
- Orbital integrals of f_ξ vanish at regular non-elliptic elements.

*Used by:* ET.1/archimedean-pseudocoefficient-transfer (transfer of φ_ξ to endoscopic groups); AutomorphicSpectralTheory:AS.6/general-euler-poincare (AS.6 imports these carriers and adds the full finite-length Euler–Poincaré trace identity); ET.4 (part 2) (the infinity component of the test functions in the simple twisted trace formula).

*Needs:* `ET.1/real-character-theory`; `ET.1/kappa-and-stable-orbital-integrals`; `ET.0/kottwitz-sign`; `AutomorphicFormsOnReductiveGroups:AF.1/discrete-series`; `AutomorphicFormsOnReductiveGroups:AF.4/wigner-lemma`; `AutomorphicFormsOnReductiveGroups:AF.4/vogan-zuckerman`; `AutomorphicFormsOnReductiveGroups:AF.4/l0-q0-invariants`.

### ET.1.15 Transfer of Euler–Poincaré functions to endoscopic groups

Node `ET.1/archimedean-pseudocoefficient-transfer` (theorem).

Let G be a connected reductive group over ℝ with discrete series modulo the centre, (H, s, η) an elliptic endoscopic datum (so H(ℝ) also has discrete series), ξ irreducible algebraic and φ_ξ the Euler–Poincaré function (ET.1/pseudocoefficients). Then a transfer of φ_ξ to H is an explicit linear combination Σ_{φ_H} c(φ_H) φ_{φ_H} of the averaged pseudo-coefficients φ_{φ_H} of the discrete L-packets of H(ℝ), over the discrete parameters φ_H with η∘φ_H equivalent to the parameter of Π(ξ^∨); each coefficient c(φ_H) is a sign times a pairing ⟨a, s⟩ determined by Shelstad's character identities and the normalization of the transfer factor (Kottwitz's construction). For G a unitary similitude group of Harris–Taylor or arbitrary signature at ∞ the coefficients are those of Shin's Lemma 3.7 with (3.13)–(3.15), and the resulting functions are Caraiani–Scholze's φ^{n⃗}_∞.

The precise hypotheses are: G over ℝ with discrete series; (H, s, η) elliptic; the transfer factor normalization of ET.1/local-transfer-factor.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.6, Lemma 3.7 (i)–(ii), (3.13)–(3.15), Remark 3.9 (pp. 18–19)). The transfer φ^H_π of pseudo-coefficients, the trace identity and the Δ-transfer statement for unitary similitude groups.

([S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §5.2 (pp. 16–17)). Kottwitz's function h_{H∞} as a sum of pseudo-coefficients for the endoscopic groups in the Igusa stable trace formula.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1), arXiv v1: §5.2, p. 74; §5.3, p. 76). The functions φ^{n⃗}_∞ and f^{n⃗}_∞ for inner forms of arbitrary signature; they are base-change matching.

Kottwitz's construction (Kottwitz, 'Shimura varieties and λ-adic representations', 1990, §7; not read) via Shelstad's character identities for discrete series (ET.1/real-transfer (b)); the explicit form used here is Shin's Lemma 3.7 and its proof (pp. 18–19) and Caraiani–Scholze §5.2.

Twisted analogue for base change: Labesse's Lefschetz functions (Shin p. 19; Caraiani–Scholze compact §5.3).

**Acceptance.**

- For the principal datum the transfer of φ_ξ is e(G)·φ_ξ^{G*}, the Euler–Poincaré function of the quasi-split inner form (Kottwitz sign).
- For U(1,1) and H = U(1)×U(1), the transfer is a signed sum over the two discrete parameters of H lifting the parameter of ξ.

*Needs:* `ET.1/pseudocoefficients`; `ET.1/real-transfer`; `ET.1/local-transfer-factor`; `ET.0/kottwitz-sign`; `ET.0/unitary-elliptic-endoscopic-data`.

## Layer ET.2: Perverse sheaves, Hitchin geometry and support

This layer has no targets of its own. Its content is supplied by EtaleDualityAndPerverseSheaves EDC.0–EDC.7, LefschetzPencilsAndVanishingCycles LPV.6 and ET.2b.

## Layer ET.2a: The perverse-sheaf foundation

This layer has no targets of its own. It was the aggregate of two re-exports; EtaleDualityAndPerverseSheaves EDC.0–EDC.7 and LefschetzPencilsAndVanishingCycles LPV.6 supply them.

## Layer ET.2a:duality-perversity: Duality and perversity

Supplied by EtaleDualityAndPerverseSheaves EDC.0–EDC.6 (exceptional pullback, dualizing complexes, purity, perverse truncations, intermediate extension) and LefschetzPencilsAndVanishingCycles LPV.6 (nearby cycles), imported directly by ET.5.

## Layer ET.2a:pure-decomposition: Pure decomposition

Supplied by EtaleDualityAndPerverseSheaves EDC.7 (pure intersection complexes, geometric semisimplicity, the decomposition theorem and relative hard Lefschetz), imported directly by ET.2b, which checks its hypotheses in each Hitchin use.

## Layer ET.2b: The geometric fundamental-lemma machinery

The targets are the objects of Ngô's geometric proof and the theorems relating them. The Chevalley quotient, the Kostant section and the regular centralizer are local; the Hitchin stack, its base, the cameral cover and the Picard stack are global over the curve; affine Springer fibres are their local counterparts, linked by the product formula. The δ-stratification feeds the support theorem, which together with the κ-decomposition gives the geometric stabilization. The point count is the bridge to ET.3.

### ET.2b.1 The Chevalley quotient and the characteristic map

Node `ET.2b/chevalley-quotient` (construction).

Let k be a field and G a connected reductive group over k, split over k̄ with maximal torus T, Lie algebras 𝔤 ⊇ 𝔱 and Weyl group W, and assume char(k) does not divide |W|. (a) (Chevalley restriction) Restriction of functions gives an isomorphism k[𝔤]^G ≅ k[𝔱]^W, and k[𝔱]^W is a polynomial algebra on homogeneous generators a_1, …, a_r of degrees e_1, …, e_r (the exponents plus one); put 𝔠 = Spec k[𝔱]^W ≅ 𝔸^r, with the G_m-action of weights e_i, and χ : 𝔤 → 𝔠 the characteristic map. (b) χ is smooth exactly on the open subset 𝔤^reg of regular elements, and 𝔤^reg → 𝔠 is surjective; the discriminant divisor 𝔇 ⊂ 𝔠 is the image of the root hyperplanes and 𝔠^rs = 𝔠 \ 𝔇 parametrizes regular semisimple stable classes: for any field extension K/k, χ induces a bijection between stable conjugacy classes of regular semisimple elements of 𝔤(K) and 𝔠^rs(K) (for G quasi-split). (c) (Outer twists) If G is the quasi-split form over a scheme X attached to an Out(G_0)-torsor ρ_G (for a split pinned G_0), the quotient 𝔠 and χ descend to X as 𝔠 = ρ_G ∧^{Out} 𝔠_0, and the G_m-action twisted by a line bundle D gives the vector bundle (or cone) 𝔠_D = 𝔠 ∧^{G_m} D^× over X. For G = GL_n, 𝔠 = 𝔸^n with χ the coefficients of the characteristic polynomial.

The precise hypotheses are: k a field with char(k) ∤ |W| (Ngô's standing hypothesis); G connected reductive over k, quasi-split over X for (c).

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §1.1, Théorème 1.1.1 (p. 9) and Lemme 1.1.2 (p. 10); §1.3, Définition 1.3.1 and §§1.3.2–1.3.3 (p. 11)). Chevalley's isomorphism k[V]^G = k[D]^W with homogeneous generators, the characteristic polynomial map χ : V → 𝔠 smooth on the regular locus, and quasi-split forms over X attached to Out(G)-torsors.

(a) Chevalley's restriction theorem and the polynomiality of invariants of the reflection group W when char(k) ∤ |W| (Ngô Théorème 1.1.1, p. 9).

(b) Kostant's smoothness criterion for χ on 𝔤^reg (Ngô Lemme 1.1.2, p. 10); the stable-class parametrization uses ET.0/semisimple-conjugacy and the Kostant section (ET.2b/kostant-section) for existence of rational points in each fibre.

(c) Descent along the Out-torsor (Ngô Définition 1.3.1 and §§1.3.2–1.3.3, p. 11).

The definition exposes the following operations and relations.

- `TauCeti.ChevalleyQuotient` (data): 𝔠 = Spec k[𝔤]^G with χ : 𝔤 → 𝔠.
- `TauCeti.ChevalleyQuotient.equivTorusQuotient` (equivalence): 𝔠 ≅ 𝔱/W (Chevalley restriction).
- `TauCeti.ChevalleyQuotient.isAffineSpace` (structure): 𝔠 is an affine space with a G_m-action of weights e_i.
- `TauCeti.ChevalleyQuotient.smooth_regular` (other): χ is smooth on 𝔤^reg and surjective there.
- `TauCeti.ChevalleyQuotient.discriminant` (data): The discriminant divisor and 𝔠^rs.
- `TauCeti.ChevalleyQuotient.stableClassEquiv` (characterisation): Stable classes of regular semisimple elements of 𝔤(K) ↔ 𝔠^rs(K) for quasi-split G.
- `TauCeti.ChevalleyQuotient.twist` (constructor): The twisted quotient 𝔠_D over X for an Out-torsor and a line bundle D.

**Checks.**

- `chevalleyQuotient_gln` (compatibility): For G = GL_n, 𝔠 = 𝔸^n and χ(X) is the coefficient vector of the characteristic polynomial of X (Mathlib's Matrix.charpoly).
- `chevalleyQuotient_sl2` (computation): For G = SL_2, 𝔠 = 𝔸^1 with χ(X) = −det X = (tr X²)/2 of weight 2, and 𝔇 = {0}.
- `chevalleyQuotient_torus` (degenerate): For G = T a torus, W = 1, 𝔠 = 𝔱 and χ is the identity.
- `chevalleyQuotient_not_smooth_off_regular` (non-example): χ is not smooth away from 𝔤^reg: for G = SL_2, χ = −det has vanishing differential at X = 0, which is not regular.

**Acceptance.**

- For GL_n, 𝔠 = 𝔸^n and χ is the characteristic polynomial.
- For SL_2, 𝔠 = 𝔸^1 with χ of weight 2 and discriminant {0}.
- χ is smooth on 𝔤^reg and not at 0.

*Used by:* ET.2b/hitchin-moduli-stack (the Hitchin base is the space of sections of 𝔠_D); ET.1/lie-algebra-transfer-factor (stable classes in 𝔤(F) are points of 𝔠^rs(F)); ET.0/norm-correspondence (the endoscopic map 𝔠_H → 𝔠).

*Needs:* `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`; `ET.0/semisimple-conjugacy`; `mathlib:Matrix.charpoly`; `mathlib:Matrix.charpoly_monic`; `mathlib:Polynomial.discr`.

### ET.2b.2 The Kostant section

Node `ET.2b/kostant-section` (construction).

In the setting of ET.2b/chevalley-quotient (char(k) ∤ |W|, G split with a pinning, regular nilpotent e = Σ_{α simple} X_α and an 𝔰𝔩_2-triple (e, h, f)), the affine subspace e + 𝔤^f maps isomorphically to 𝔠 under χ, giving a section ε : 𝔠 → 𝔤^reg of χ with image in the regular locus (Kostant). It is equivariant for the G_m-action on 𝔠 with weights e_i and the action of G_m on 𝔤 combining homotheties with the adjoint action of the cocharacter 2ρ^∨ (equivalently of ρ^∨ after passing to the double cover of G_m); this is why, over a curve, ε globalizes only after choosing a square root D′ of D (D′^{⊗2} ≅ D), giving the Kostant–Hitchin section ε_D : 𝔠_D → 𝔤_D^reg. Every regular element of 𝔤(K) is G(K̄)-conjugate to ε(χ(X)); for K a field and G quasi-split, the regular elements of 𝔤(K) with given characteristic value a form a single stable class whose rational classes are a torsor under H^1(K, J_a) (ET.2b/regular-centralizer). For G = GL_n, ε(a) is the companion matrix of the polynomial with coefficients a.

The precise hypotheses are: char(k) ∤ |W| (Ngô's standing assumption); G split with a pinning (descends to quasi-split G with the Out-torsor).

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §1.2, Lemme 1.2.1 (p. 10) and (1.2.2) (p. 11); §4.2.4 (p. 63); Lemme 2.2.5 (p. 34)). Kostant's section of χ, its equivariance, and the Kostant–Hitchin section over the curve after choosing a square root D′ of D.

Kostant's theorem: χ restricted to e + 𝔤^f is an isomorphism onto 𝔠 (Ngô Lemme 1.2.1, p. 10; section (1.2.2), p. 11).

Equivariance and the square root: Ngô §4.2.4 (p. 63) and Lemme 2.2.5 (p. 34).

Torsor statement: the regular centralizer J acts simply transitively on the fibres of [𝔤^reg/G] → 𝔠 (ET.2b/regular-centralizer).

The definition exposes the following operations and relations.

- `TauCeti.kostantSection` (data): ε : 𝔠 → 𝔤^reg.
- `TauCeti.chi_kostantSection` (simp): χ ∘ ε = id.
- `TauCeti.kostantSection_regular` (other): ε(a) is regular.
- `TauCeti.kostantSection_equivariant` (functoriality): G_m-equivariance for the twisted action.
- `TauCeti.kostantSection_conj` (characterisation): Every regular X is conjugate over the algebraic closure to ε(χ(X)).
- `TauCeti.kostantHitchinSection` (constructor): The global section ε_D : 𝔠_D → 𝔤_D^reg attached to a square root D′ of D.

**Checks.**

- `kostantSection_gln` (compatibility): For G = GL_n, ε(a) is the companion matrix of t^n + a_1t^{n−1} + … + a_n, whose characteristic polynomial is that polynomial (Mathlib: Matrix.charpoly of a companion matrix).
- `kostantSection_regular` (characterisation): ε(a) is regular for every a, including a = 0 where ε(0) = e is regular nilpotent.
- `kostantSection_torus` (degenerate): For G = T, ε = id.
- `kostantSection_not_semisimple` (non-example): ε(0) = e ≠ 0, so ε is not the zero section on the discriminant: a section through semisimple elements does not exist over 𝔇.

**Acceptance.**

- For GL_n, ε(a) is the companion matrix, with characteristic polynomial a.
- ε(0) is a regular nilpotent element.
- Over a curve, ε globalizes after choosing a square root of D.

*Used by:* ET.1/lie-algebra-transfer-factor (base point of the Kostant-section normalization of transfer factors); ET.2b/hitchin-moduli-stack (the Kostant–Hitchin section A → M^reg).

*Needs:* `ET.2b/chevalley-quotient`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`; `mathlib:Matrix.charpoly`.

### ET.2b.3 The regular centralizer group scheme ★

Node `ET.2b/regular-centralizer` (construction).

In the setting of ET.2b/chevalley-quotient (char(k) ∤ |W|), let I → 𝔤 be the group scheme of centralizers. (a) There is a unique smooth commutative group scheme J → 𝔠 with a G-equivariant isomorphism χ^*J|_{𝔤^reg} ≅ I|_{𝔤^reg}, and it extends to a homomorphism χ^*J → I over all of 𝔤 (Ngô Lemme 2.1.1). (b) The morphism [𝔤^reg/G] → 𝔠 is a gerbe banded by J, neutralized by the Kostant section (Proposition 2.2.1). (c) If the centre of G is connected the fibres of J are connected. (d) (Galois description, after Donagi–Gaitsgory) With π : 𝔱 → 𝔠 the finite flat W-cover, there is a canonical homomorphism J → J^1 := (π_*(T × 𝔱))^W, an isomorphism over 𝔠^rs and identifying J with an open subgroup scheme J′ of J^1 whose fibres have the same identity component (Propositions 2.4.2, 2.4.7, Corollaire 2.4.8). (e) For an endoscopic datum with map ν : 𝔠_H → 𝔠 there is a homomorphism μ : ν^*J → J_H (Proposition 2.5.1). (f) For a ∈ 𝔠(X) the pullback J_a is a smooth commutative group scheme over X, and J_a = (π_{a,*}(T × X̃_a))^W-description via the cameral cover (Lemme 1.4.3, (1.4.2)).

The precise hypotheses are: char(k) ∤ |W|.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §2.1, Lemme 2.1.1 (p. 32); §2.2, Proposition 2.2.1 (p. 33); §2.3, Proposition 2.3.1 and Corollaire 2.3.2 (pp. 34–35); §2.4, Lemme 2.4.1, Propositions 2.4.2 and 2.4.7, Corollaire 2.4.8 (pp. 35–40); §2.5, Proposition 2.5.1 (p. 40); §1.4, Lemme 1.4.3 and (1.4.2) (p. 14)). The regular centralizer J with χ^*J ≅ I over the regular locus, the gerbe [𝔤^reg/G] → 𝔠, connectedness of fibres, the Galois description through the cameral cover, and the map ν^*J → J_H for endoscopic data.

(a) Descend I|_{𝔤^reg}, which is commutative and smooth over 𝔤^reg, along the smooth surjection χ|_{𝔤^reg} using the transitivity of the G-action on fibres (Ngô Lemme 2.1.1, p. 32).

(b) Ngô Proposition 2.2.1 (p. 33); (c) Proposition 2.3.1 (p. 34) and Corollaire 2.3.2 (p. 35).

(d) Ngô §2.4: Lemme 2.4.1 (smoothness of J^1, using |W| invertible), Proposition 2.4.2 (p. 36), Proposition 2.4.7 (p. 39), Corollaire 2.4.8 (p. 40).

(e) Ngô Proposition 2.5.1 (p. 40); (f) Lemme 1.4.3 and (1.4.2), p. 14.

The definition exposes the following operations and relations.

- `TauCeti.RegularCentralizer` (data): J → 𝔠.
- `TauCeti.RegularCentralizer.equivCentralizer` (equivalence): χ^*J|_{𝔤^reg} ≅ I|_{𝔤^reg}, G-equivariantly.
- `TauCeti.RegularCentralizer.toCentralizer` (constructor): The homomorphism χ^*J → I over 𝔤.
- `TauCeti.RegularCentralizer.smooth` (structure): J is smooth and commutative over 𝔠.
- `TauCeti.RegularCentralizer.galoisDescription` (characterisation): J → (π_*(T × 𝔱))^W, iso over 𝔠^rs.
- `TauCeti.RegularCentralizer.endoscopic` (functoriality): μ : ν^*J → J_H for an endoscopic datum.

**Checks.**

- `regularCentralizer_gln` (computation): For G = GL_n and a ∈ 𝔠(K), J_a = (K[t]/(P_a(t)))^×, the unit group of the algebra of the characteristic polynomial.
- `regularCentralizer_torus` (degenerate): For G = T, J = T × 𝔱 is constant.
- `regularCentralizer_rs` (characterisation): Over 𝔠^rs, J is a torus: the fibre at a is the centralizer of any regular semisimple X with χ(X) = a.
- `regularCentralizer_not_centralizer` (non-example): J is not χ^*I over all of 𝔤: at X = 0 the centralizer is G, while J_0 is commutative of dimension r.

**Acceptance.**

- For GL_n, J_a is the unit group of k[t]/(P_a(t)).
- Over 𝔠^rs, J is a torus.
- J is not the full centralizer at non-regular elements (at X = 0 the centralizer is G).

*Used by:* ET.2b/picard-stack-action (P_a is the stack of J_a-torsors); ET.2b/affine-springer-fibre (the local symmetry group P_v(J_a)); ET.2b/endoscopic-comparison (μ : ν^*J → J_H relates the Picard stacks of G and H).

*Needs:* `ET.2b/chevalley-quotient`; `ET.2b/kostant-section`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `AlgebraicModuliForArithmeticGeometry:R09.4`.

### ET.2b.4 The Hitchin moduli stack, base and fibration ★

Node `ET.2b/hitchin-moduli-stack` (construction).

Let k = 𝔽_q, X a smooth projective geometrically connected curve over k of genus g, G a quasi-split reductive group scheme over X attached to an Out-torsor ρ_G (ET.2b/chevalley-quotient (c)), with char(k) ∤ |W|, and D a line bundle on X (in Ngô's applications D = D′^{⊗2} with deg D > 2g; the carrier is defined for every D, including the canonical bundle ω_X and D = O_X, which Yu's counting needs). The Hitchin moduli stack M = M_{G,D} assigns to a k-scheme S the groupoid of pairs (E, φ) with E a G-torsor on X × S (an S-point of Bun_G, GlobalShtukasAndFunctionFieldLanglands:GS.0) and φ ∈ H^0(X × S, ad(E) ⊗ D). The Hitchin base A = A_{G,D} = H^0(X, 𝔠_D) is a finite-dimensional affine space over k, and f : M → A sends (E, φ) to χ(φ). Properties: (a) M is an algebraic stack locally of finite type over k: over Bun_G it is the stack of sections of the coherent sheaf ad(E) ⊗ D, and the restriction of f to the anisotropic locus is of finite type (ET.2b/anisotropic-locus); (b) if deg D > 2g − 2 and G is split, A = ⊕_i H^0(X, D^{⊗e_i}) has dimension Σ_i (e_i deg D + 1 − g) = (#Φ^+ + r) deg D + r(1 − g) by Riemann–Roch (Ngô Lemme 4.4.1, which also covers the quasi-split case), and the open A^♥ of a whose image meets 𝔠^rs generically is non-empty when deg D > 2g; (c) M is smooth at (E, φ) whenever deg D > 2g − 2, or deg D = 2g − 2 and χ(φ) ∈ A^ani (Ngô Théorème 4.12.1); (d) the Kostant–Hitchin section A → M (after choosing D′ with D′^{⊗2} = D) lands in the regular locus M^reg.

The precise hypotheses are: k = 𝔽_q, X smooth projective geometrically connected of genus g; G quasi-split over X with char(k) ∤ |W|; D a line bundle; the listed properties need the stated degree bounds.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §4.1 (p. 62); Définition 4.2.1 (p. 62); §4.2.3–4.2.4 (p. 63); Lemme 4.4.1 (p. 64); §4.5 (p. 67); Proposition 4.6.1 (p. 69); Théorème 4.12.1 (p. 84)). Bun_G, the Hitchin total space M of pairs (E, φ) with φ ∈ H^0(X × S, ad(E) ⊗ D), the base A of sections of 𝔠_D and f : M → A; the dimension of A for deg D > 2g − 2; non-emptiness of A^♥ for deg D > 2g; smoothness of M.

([H. Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/abs/1807.04659v5), §3.2.3 (p. 16)). Higgs bundles (E, θ : E → E ⊗ ω_X) with the canonical twist and their stability, distinguishing the algebraic stack, its stable locus and the coarse space (extraction item PAPER-YU-23/035); only the carrier is used here.

Algebraicity: M → Bun_G is the stack of sections of the coherent sheaf ad(E) ⊗ D, representable by an abelian cone (AlgebraicModuliForArithmeticGeometry R09.4 linear stacks and the Artin criterion of A0-extension); Bun_G is algebraic and locally of finite type (GS.0/bun-g-of-the-global-curve).

Dimension and non-emptiness: Riemann–Roch on X for the line bundles of weights e_i (upstream AlgebraicCurves Layer 4; Ngô Lemme 4.4.1, p. 64; §4.5, p. 67; Proposition 4.6.1, p. 69).

Smoothness: deformation theory of Higgs pairs and the vanishing of the obstruction H^1 under the degree hypothesis (Ngô Théorème 4.12.1, p. 84).

The Kostant–Hitchin section: ET.2b/kostant-section globalized with D′ (Ngô §4.2.4, p. 63).

The definition exposes the following operations and relations.

- `TauCeti.HitchinStack` (data): M_{G,D} as a stack over k-schemes.
- `TauCeti.HitchinBase` (data): A_{G,D} = H^0(X, 𝔠_D).
- `TauCeti.hitchinMap` (data): f : M → A.
- `TauCeti.HitchinStack.toBunG` (projection): The forgetful map M → Bun_G.
- `TauCeti.HitchinStack.isAlgebraic` (structure): M is algebraic and locally of finite type.
- `TauCeti.HitchinBase.finrank` (other): dim A for deg D > 2g − 2 by Riemann–Roch.
- `TauCeti.HitchinStack.smooth` (other): Smoothness under the stated degree hypotheses.
- `TauCeti.kostantHitchinSection_hitchin` (constructor): The section A → M^reg.
- `TauCeti.HitchinStack.baseChange` (functoriality): Compatibility with finite extensions of k.

**Checks.**

- `hitchinStack_gl1` (computation): For G = GL_1, M = Pic_X × H^0(X, D), A = H^0(X, D) and f is the projection.
- `hitchinStack_base_dim_gl2` (computation): For G = GL_2 and deg D = d > 2g − 2: A = H^0(X, D) ⊕ H^0(X, D²) has dimension (d + 1 − g) + (2d + 1 − g) = 3d + 2 − 2g.
- `hitchinStack_zero_twist` (degenerate): For D = O_X, A = ⊕_i H^0(X, O_X) = 𝔠(k) and the Hitchin map records constant characteristic values (the case of Yu's Appendix B).
- `hitchinStack_not_finite_type` (non-example): M itself is not of finite type: its fibre over 0 ∈ A (the global nilpotent cone) contains all of Bun_G (φ = 0), which is not quasi-compact.

**Acceptance.**

- For GL_1, M = Pic_X × H^0(X, D).
- For GL_2 and deg D = d > 2g − 2, dim A = 3d + 2 − 2g.
- The fibre over 0 contains Bun_G (φ = 0), so M is not of finite type.

*Used by:* ET.2b/picard-stack-action (P acts on M over A); ET.2b/hitchin-point-count (counting points of M_a); CountingBundlesAndHallAlgebrasOfCurves (Schiffmann, Yu) (the Higgs carrier with the canonical twist; stability and the coarse moduli are planned there); ET.3/lie-algebra-fundamental-lemma (global geometric input of Ngô's proof).

*Needs:* `ET.2b/chevalley-quotient`; `ET.2b/kostant-section`; `GlobalShtukasAndFunctionFieldLanglands:GS.0/bun-g-of-the-global-curve`; `AlgebraicModuliForArithmeticGeometry:R09.4`; `AlgebraicModuliForArithmeticGeometry:A0-extension/artin-stack-criterion`; `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch`; `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`.

### ET.2b.5 Boundedness of Higgs sheaves through a good pair of line bundles

Node `ET.2b/schiffmann-boundedness` (theorem).

Let X be a smooth projective geometrically connected curve over a field k, Ω_X its canonical bundle, and α = (r, d) a class (rank r ≥ 1, degree d). A Higgs sheaf of class α is a coherent sheaf V of rank r and degree d with θ ∈ Hom(V, V ⊗ Ω_X); a Higgs subsheaf is a subsheaf W with θ(W) ⊆ W ⊗ Ω_X; (V, θ) is semistable if μ(W) ≤ μ(V) for every proper Higgs subsheaf (μ the slope), and a Higgs subsheaf with μ(W) > μ(V) is destabilizing. A coherent sheaf V is strongly generated by a line bundle L if Ext^1(L, V) = 0 and the evaluation L ⊗ Hom(L, V) → V is surjective. Then there is a pair of line bundles (L_1, L_2) ∈ Pic^{−n}(X) × Pic^{−m}(X) (n, m depending on α and the genus) such that: (a) every semistable Higgs bundle of class α is strongly generated by L_1 and by L_2; (b) every indecomposable vector bundle of class α is strongly generated by L_1 and by L_2; (c) for every coherent sheaf V of class α and every epimorphism φ : L_1 ⊗ V′ → V (V′ a vector space), ker(φ) is strongly generated by L_2; (d) every unstable Higgs sheaf of class α has a destabilizing Higgs subsheaf strongly generated by L_1 and L_2. Consequently the stacks of semistable Higgs bundles and of indecomposable bundles of class α, and the Hitchin moduli stack with the canonical twist restricted to semistable objects, admit presentations as quotients of open subschemes of Quot schemes (Álvarez-Cónsul–King construction) and are of finite type.

The precise hypotheses are: X smooth projective geometrically connected over a field k; Higgs fields twisted by the canonical bundle Ω_X; class α of positive rank.

([O. Schiffmann, Indecomposable vector bundles and stable Higgs bundles over smooth projective curves](https://arxiv.org/abs/1406.3839v2), arXiv v2 (4 October 2014, no printed page numbers): §6.2 and the definition of strong generation in §6.3 (PDF p. 22); Lemma 6.1 (PDF p. 23)). The existence of a good pair of line bundles (L_1, L_2) with properties (a)–(d) for semistable Higgs bundles, indecomposable bundles, kernels of epimorphisms from L_1 ⊗ V and destabilizing Higgs subsheaves; Higgs sheaves and their slope semistability (extraction items PAPER-SCHIFFMANN-16/44 and /9).

Bound the slopes of subsheaves of semistable Higgs bundles and of indecomposable bundles of class α (Harder–Narasimhan filtrations and the bound on Hom from destabilizing pieces); choose L_1, L_2 of sufficiently negative degree so that Ext^1(L_i, V) = H^1(X, L_i^{-1} ⊗ V) = 0 by Serre duality and V ⊗ L_i^{-1} is globally generated (Schiffmann, proof of Lemma 6.1).

Finite type: strongly generated sheaves of class α are quotients of L_1^{⊕N} with N = χ(L_1^{-1} ⊗ V), parametrized by an open subscheme of a Quot scheme (AlgebraicModuliForArithmeticGeometry:R09.2/quot-projectivity).

**Acceptance.**

- For r = 1, every Higgs bundle of class (1, d) is semistable, and a line bundle M of degree d is strongly generated by every line bundle L with deg L ≤ d − 2g: then deg(L^{-1}M) ≥ 2g, so Ext^1(L, M) = H^1(X, L^{-1}M) = 0 and L^{-1}M is globally generated.
- On X = ℙ^1 (Ω = O(−2)) every indecomposable vector bundle is a line bundle, so (b) is vacuous for r = 2; for V = O(a) ⊕ O(−a) with a ≥ 1 there is no nonzero component O(a) → O(−a) ⊗ Ω = O(−a − 2), so O(a) is a destabilizing Higgs subsheaf, and the only semistable Higgs bundle of class (2, 0) is (O ⊕ O, 0).

*Needs:* `ET.2b/hitchin-moduli-stack`; `AlgebraicModuliForArithmeticGeometry:R09.2/quot-projectivity`; `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch`.

### ET.2b.6 Cameral covers and spectral curves

Node `ET.2b/cameral-cover` (construction).

In the setting of ET.2b/hitchin-moduli-stack, for a ∈ A(k̄) viewed as a map a : X̄ → 𝔠_D, the cameral cover is the finite flat W-equivariant cover π_a : X̃_a = X̄ ×_{𝔠_D} 𝔱_D → X̄. Let A^♥ ⊆ A be the open subset of a with a(X̄) ⊄ 𝔇_D (generically regular semisimple). For a ∈ A^♥, X̃_a is reduced and is a W-torsor over the open U_a = a^{-1}(𝔠_D^rs); Ngô Proposition 4.5.4 gives its connectedness under the hypotheses stated there. The regular centralizer J_a = a^*J is described by the cameral cover: J_a ⊆ (π_{a,*}(T × X̃_a))^W with equality of identity components (ET.2b/regular-centralizer (d)). For G = GL_n the cameral cover is the Galois closure of the spectral curve Y_a ⊂ V(D) (the total space of D), Y_a = {t : t^n + a_1 t^{n−1} + … + a_n = 0}, a finite cover of X̄ of degree n; J_a = R_{Y_a/X̄} G_m and M_a is the stack of torsion-free rank-one sheaves on Y_a (Beauville–Narasimhan–Ramanan) when Y_a is integral.

The precise hypotheses are: the setting of ET.2b/hitchin-moduli-stack; a ∈ A^♥ for the torsor and reducedness statements.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §1.4, Lemme 1.4.3 and (1.4.2) (p. 14); §4.5, Lemme 4.5.1 and Proposition 4.5.4 (pp. 67–68)). The cameral cover, the description of J_a through it, reducedness and the generic W-torsor property for a ∈ A^♥, and connectedness.

Base change of the finite flat W-cover 𝔱 → 𝔠 (Ngô §1.4 and §4.5).

Reducedness and the generic W-torsor structure: Ngô Lemme 4.5.1 (p. 67); connectedness: Proposition 4.5.4 (p. 68).

The spectral description for GL_n: J_a is the Weil restriction of G_m from the spectral curve, and M_a is identified with rank-one torsion-free sheaves via pushforward (Ngô §4 recalls this as the motivating example).

The definition exposes the following operations and relations.

- `TauCeti.cameralCover` (data): X̃_a → X̄.
- `TauCeti.HitchinBase.heartLocus` (data): The open A^♥.
- `TauCeti.cameralCover_isTorsor` (characterisation): W-torsor over U_a for a ∈ A^♥.
- `TauCeti.cameralCover_reduced` (other): Reducedness for a ∈ A^♥.
- `TauCeti.spectralCurve` (constructor): The spectral curve Y_a for GL_n.
- `TauCeti.regularCentralizer_eq_cameral` (compatibility): J_a through the cameral cover.

**Checks.**

- `cameralCover_gl1` (degenerate): For G = GL_1, W = 1 and X̃_a = X̄.
- `spectralCurve_gl2_smooth` (computation): For G = GL_2 and a = (0, a_2) with a_2 ∈ H^0(X, D^{⊗2}) having simple zeros, Y_a is the curve t² + a_2 = 0 in the total space of D, a double cover of X branched at the 2 deg D zeros of a_2, smooth of genus 2g − 1 + deg D by Riemann–Hurwitz.
- `cameralCover_wtorsor_generic` (characterisation): Over U_a = a^{-1}(𝔠^rs_D), X̃_a → U_a is a W-torsor.
- `cameralCover_nilpotent_nonreduced` (non-example): For a = 0 ∉ A^♥, X̃_0 is the W-fold nonreduced thickening along the zero section and is not a W-torsor anywhere.

**Acceptance.**

- For GL_1 the cameral cover is X̄ itself.
- For GL_2 and a = (0, a_2) with simple zeros, the spectral curve has genus 2g − 1 + deg D.
- Over the regular semisimple locus the cameral cover is a W-torsor.

*Used by:* ET.2b/picard-stack-action (π_0(P_a) is computed from the cameral cover); ET.2b/delta-stratification (δ_a is the defect of normality of the cameral (spectral) curve).

*Needs:* `ET.2b/hitchin-moduli-stack`; `ET.2b/regular-centralizer`; `ET.2b/chevalley-quotient`.

### ET.2b.7 The Picard stack acting on Hitchin fibres

Node `ET.2b/picard-stack-action` (construction).

In the setting of ET.2b/hitchin-moduli-stack, for a ∈ A(S) let P_a be the Picard groupoid of J_a-torsors on X × S; as a varies these form a Picard stack P → A. Via the homomorphism χ^*J → I (ET.2b/regular-centralizer (a)), J_a acts on every (E, φ) ∈ M_a by automorphisms, so P acts on M over A by twisting (E, φ) by a J_a-torsor. (a) The regular open M^reg (φ regular everywhere) is a P-torsor over A, trivialized by the Kostant–Hitchin section (Ngô Proposition 4.3.3). (b) P is smooth over A^♥ (Proposition 4.4.2). (c) For a ∈ A^♥(k̄), the group of connected components π_0(P_a) is a finitely generated abelian group described through the cameral cover: with P′_a the stack of J′_a-torsors, P′_a → P_a is surjective with finite kernel, and the Cartier duals of π_0(P′_a) and π_0(P_a) are the diagonalizable groups Ĉ^{W̃_a} and Ĉ(I_a, W_a) attached to the monodromy of the cameral cover (Ngô Lemme 4.10.1, Proposition 4.10.2). (d) The irreducible components of the fibre M_a (a ∈ A^ani) are indexed by π_0(P_a) (Corollaire 4.14.3).

The precise hypotheses are: the setting of ET.2b/hitchin-moduli-stack; (b)–(d) for a ∈ A^♥ (resp. A^ani).

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §4.3.1 and Proposition 4.3.3 (pp. 63–64); Proposition 4.4.2 (p. 65); §4.10, Lemme 4.10.1 and Proposition 4.10.2 (pp. 77–78); Corollaire 4.14.3 (p. 88)). The Picard stack P of J_a-torsors acting on M, M^reg a P-torsor, smoothness of P over A^♥, the description of π_0(P_a) and the indexing of irreducible components of M_a by π_0(P_a).

Define P_a and the action using χ^*J → I (Ngô §4.3.1, p. 63); the torsor statement (a) uses that J ≅ I on the regular locus (Proposition 4.3.3, p. 64).

Smoothness (b): the deformation theory of J_a-torsors is governed by H^1(X, Lie J_a), which has constant dimension over A^♥ (Proposition 4.4.2, p. 65).

(c) Ngô §4.10, Lemme 4.10.1 and Proposition 4.10.2 (p. 78): compute π_0 through the Néron model and the cameral monodromy.

(d) Corollaire 4.14.3 (p. 88), from the product formula and the local statement on components of affine Springer fibres.

The definition exposes the following operations and relations.

- `TauCeti.HitchinPicard` (data): P → A, the Picard stack of J_a-torsors.
- `TauCeti.HitchinPicard.action` (structure): The action P ×_A M → M.
- `TauCeti.HitchinPicard.regularTorsor` (characterisation): M^reg is a P-torsor trivialized by the Kostant–Hitchin section.
- `TauCeti.HitchinPicard.smooth` (other): P is smooth over A^♥.
- `TauCeti.HitchinPicard.componentGroup` (data): π_0(P_a) with its description through the cameral cover.
- `TauCeti.HitchinPicard.componentsOfFibre` (relation): Irreducible components of M_a ↔ π_0(P_a) for a ∈ A^ani.

**Checks.**

- `picardStack_gl1` (computation): For G = GL_1, P_a = Pic_X for every a and π_0(P_a) = ℤ (the degree).
- `picardStack_gln_spectral` (compatibility): For G = GL_n and a with integral spectral curve Y_a, P_a = Pic_{Y_a} (line bundles on Y_a) and π_0(P_a) = ℤ.
- `picardStack_sl2_component` (computation): For G = SL_2 and a = ν(a_H) in the image of the endoscopic base of the norm-one torus H of a connected étale double cover X′ → X̄, the spectral curve is nodal with normalization X′, and π_0(P_a) contains ℤ/2, on which the character κ attached to X′ is nontrivial; for a with smooth (ramified) spectral curve π_0(P_a) is trivial (the Prym of a ramified double cover is connected).
- `picardStack_not_torsor_on_singular` (non-example): On M \ M^reg the action of P_a need not be free: at a point where φ is not regular, the stabilizer in P_a is a nontrivial affine group (as required by the weak-abelian-fibration axioms), so M_a is not a P_a-torsor.

**Acceptance.**

- For GL_1, P_a = Pic_X and π_0(P_a) = ℤ.
- For GL_n with integral spectral curve, P_a = Pic_{Y_a}.
- For SL_2 and a in the image of the endoscopic base of a connected étale double cover X′ → X, π_0(P_a) carries the nontrivial character attached to X′.

*Used by:* ET.2b/kappa-decomposition (π_0(P) acts on the perverse cohomology of f^ani, giving the κ-decomposition); ET.2b/weak-abelian-fibration ((M^ani, P^ani) is a weak abelian fibration).

*Needs:* `ET.2b/hitchin-moduli-stack`; `ET.2b/regular-centralizer`; `ET.2b/cameral-cover`; `AlgebraicModuliForArithmeticGeometry:R09.4`.

### ET.2b.8 The anisotropic locus: properness and Deligne–Mumford structure

Node `ET.2b/anisotropic-locus` (theorem).

In the setting of ET.2b/hitchin-moduli-stack with deg D > 2g and D = D′^{⊗2}: (a) the anisotropic locus A^ani ⊆ A^♥, the set of a ∈ A^♥ for which π_0(P_a) is finite (equivalently the cameral cover has no monodromy-invariant cocharacters modulo the centre), is open (Ngô Lemme 6.1.1, §6.1); (b) P^ani = P|_{A^ani} is a separated smooth Deligne–Mumford stack of finite type over A^ani; M^ani = f^{-1}(A^ani) is a separated smooth Deligne–Mumford stack and f^ani : M^ani → A^ani is proper (Proposition 6.1.5); (c) for a ∈ A^ani(k̄) the fibre M_a is a proper Deligne–Mumford stack and the quotient of the product of local affine Springer fibres by the local symmetry groups is proper (Proposition 4.13.1); (d) if the centre of G is not finite one restricts to a fixed degree component (or quotients by a lattice of the centre) to obtain finite type.

The precise hypotheses are: deg D > 2g, D = D′^{⊗2}; char(k) ∤ |W|; G semisimple, or a fixed central degree component.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §6.1, Lemme 6.1.1 and Proposition 6.1.5 (pp. 111–113); Proposition 4.13.1 (pp. 86–87)). The anisotropic open A^ani, P^ani and M^ani separated smooth Deligne–Mumford stacks, f^ani proper, and properness of the fibres M_a.

(a) Ngô §6.1 (pp. 111–112): A^ani is a union of strata A_ψ with ψ in an anisotropic set; openness from the semicontinuity of π_0 (Lemme 6.1.1, p. 112).

(b) Ngô Proposition 6.1.5 (p. 113): finiteness of π_0 and of stabilizers gives the DM property; properness by the valuative criterion using the product formula and the properness of the local quotients (Kazhdan–Lusztig).

(c) Ngô Proposition 4.13.1 (pp. 86–87); smoothness of M at anisotropic points with deg D = 2g − 2 is Théorème 4.12.1 (ET.2b/hitchin-moduli-stack (c)).

**Acceptance.**

- For G = GL_1 nothing is anisotropic because π_0(P_a) = ℤ is infinite; restricting to a fixed degree component (d) gives the proper fibre Pic^d.
- For G = SL_2 and a with irreducible spectral curve, a ∈ A^ani and M_a is a compactified Prym, proper.

*Needs:* `ET.2b/hitchin-moduli-stack`; `ET.2b/picard-stack-action`; `ET.2b/product-formula`; `ET.2b/affine-springer-fibre`; `AlgebraicModuliForArithmeticGeometry:R09.4`.

### ET.2b.9 Affine Springer fibres and their local symmetry groups ★

Node `ET.2b/affine-springer-fibre` (construction).

Let k be a finite field (or k̄), F_v = k((ε_v)) with ring 𝒪_v, G a reductive group over 𝒪_v (quasi-split, split over an unramified extension; char(k) ∤ |W|), Gr_v = G(F_v)/G(𝒪_v) the affine Grassmannian, an ind-scheme over k (the fibre at v of the Beilinson–Drinfeld Grassmannian of GlobalShtukasAndFunctionFieldLanglands:GS.1), and a ∈ 𝔠(𝒪_v) ∩ 𝔠^rs(F_v) with γ_a = ε(a) the Kostant section value. The affine Springer fibre M_v(a) is the functor of pairs (E, φ) on Spec 𝒪_v × S with χ(φ) = a, together with an isomorphism with (E_0, γ_a) over F_v; it is represented by the closed sub-ind-scheme {g ∈ Gr_v : Ad(g)^{-1}γ_a ∈ 𝔤(𝒪_v)} (Ngô Proposition 3.2.1). (a) (Kazhdan–Lusztig) M_v(a)^red is locally of finite type, and the local symmetry group P_v(J_a) (the group ind-scheme of J_a-torsors on Spec 𝒪_v trivialized over F_v) acts on it; a free abelian group Λ of finite rank in P_v(J_a) acts freely with projective quotient M_v(a)^red/Λ (Proposition 3.4.1). (b) (Dimension; Bezrukavnikov) The regular open M_v^reg(a) is a P_v(J_a)-torsor, dense in M_v(a), and dim M_v(a) = dim P_v(J_a) = δ_v(a) = (d_v(a) − c_v(a))/2 with d_v(a) = val(Δ(a)) the valuation of the discriminant and c_v(a) the drop of split rank (Propositions 3.7.1, 3.7.5). (c) The irreducible components of M_v(a) are in bijection with π_0(P_v(J_a)) (Corollaire 3.10.2). These are algebraic loop objects over k((ε)), not Witt-vector or diamond Grassmannians.

The precise hypotheses are: F_v = k((ε_v)) of equal characteristic; char(k) ∤ |W|; a regular semisimple over F_v and integral.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §3.2, Proposition 3.2.1 (p. 43); §3.3 (p. 45); Proposition 3.4.1 (p. 47); §3.7, Propositions 3.7.1, 3.7.5 and Corollaire 3.7.2 (pp. 50–52); §3.8 (pp. 52–54); Corollaires 3.9.6 and 3.10.2 (pp. 57–58)). Affine Springer fibres as closed sub-ind-schemes of the affine Grassmannian, their local symmetry group, the projective quotient by a lattice (Kazhdan–Lusztig), the dimension formula δ_v = (d_v − c_v)/2 (Bezrukavnikov), and components indexed by π_0 of the local symmetry group.

Representability as a closed sub-ind-scheme of Gr_v and local finiteness (Kazhdan–Lusztig), recalled in Ngô Proposition 3.2.1 (p. 43); the affine Grassmannian itself is requested from GlobalShtukasAndFunctionFieldLanglands:GS.1.

Symmetries and the projective quotient: Ngô §3.3 (p. 45) and Proposition 3.4.1 (p. 47).

Dimension: Ngô Proposition 3.7.1 (p. 50), Corollaire 3.7.2 (p. 51), Proposition 3.7.5 (p. 52), via the Néron model of J_a (§3.8, Lemme 3.8.1, Corollaire 3.8.3).

Components: Ngô §§3.9–3.10, Corollaire 3.9.6 and Corollaire 3.10.2 (pp. 57–58).

The definition exposes the following operations and relations.

- `TauCeti.AffineSpringerFibre` (data): M_v(a) as a closed sub-ind-scheme of Gr_v.
- `TauCeti.AffineSpringerFibre.localSymmetry` (data): P_v(J_a) and its action.
- `TauCeti.AffineSpringerFibre.quotient_projective` (other): M_v(a)^red/Λ is projective.
- `TauCeti.AffineSpringerFibre.dim_eq_delta` (characterisation): dim M_v(a) = δ_v(a) = (d_v(a) − c_v(a))/2.
- `TauCeti.AffineSpringerFibre.components` (relation): Irreducible components ↔ π_0(P_v(J_a)).
- `TauCeti.AffineSpringerFibre.regularTorsor` (characterisation): M_v^reg(a) is a P_v(J_a)-torsor, dense.

**Checks.**

- `affineSpringer_regular_unramified` (computation): If a ∈ 𝔠^rs(𝒪_v) (unramified and regular semisimple modulo ε_v), then d_v(a) = 0, δ_v(a) = 0 and M_v(a) is a discrete set Λ = X_*(T).
- `affineSpringer_gl2_delta` (computation): For G = GL_2 and γ with characteristic polynomial t² − ε^n: d_v = val(4ε^n) = n (p odd); if n is even the centralizer is split, c_v = 0 and δ_v = n/2; if n is odd it is the ramified torus R_{E/F}G_m, c_v = 1 and δ_v = (n − 1)/2.
- `affineSpringer_torus` (degenerate): For G = T a torus, M_v(a) = Gr_T = X_*(T) and P_v = Gr_T.
- `affineSpringer_not_finite_type` (non-example): For γ = diag(ε, −ε) in 𝔤𝔩_2 (split, d_v = 2, c_v = 0, δ_v = 1), M_v(a) has infinitely many irreducible components, permuted by Λ = X_*(T) = ℤ², so it is not of finite type; only M_v(a)^red/Λ is (and it is projective).

**Acceptance.**

- If a is regular semisimple modulo ε, δ_v = 0 and M_v(a) is the discrete set X_*(T).
- For GL_2 and characteristic polynomial t² − ε^n, δ_v = ⌊n/2⌋.
- For γ = diag(ε, −ε), M_v(a) has infinitely many components and its quotient by Λ is projective.

*Used by:* ET.2b/product-formula (Hitchin fibres are products of affine Springer fibres up to the global Picard action); ET.2b/hitchin-point-count (κ-weighted point counts of M_v(a)/P_v(J_a) are κ-orbital integrals).

*Needs:* `ET.2b/regular-centralizer`; `ET.2b/kostant-section`; `ET.2b/chevalley-quotient`; `GlobalShtukasAndFunctionFieldLanglands:GS.1/beilinson-drinfeld-grassmannian`; `mathlib:LaurentSeries`; `mathlib:PowerSeries`.

### ET.2b.10 The product formula for Hitchin fibres

Node `ET.2b/product-formula` (theorem).

In the setting of ET.2b/hitchin-moduli-stack and ET.2b/affine-springer-fibre, let a ∈ A^♥(k̄) and U ⊆ X̄ the open subset where a is regular semisimple, with finite complement. Gluing local data along the Kostant section gives a morphism ζ : (∏_{v ∈ X̄ \ U} M_v(a)) ∧^{∏_v P_v(J_a)} P_a → M_a which is a universal homeomorphism (Ngô Proposition 4.13.1). For counting points over k (a ∈ A^ani(k)), with P′ built from the open subgroup J′, there is an equivalence of groupoids [M_a/P′_a] ≅ ∏_{v ∈ X \ U} [M_v(a)/P_v(J′_a)] (Proposition 8.4.2), and stabilizer volumes are recorded by the Néron model of J_a. Consequently dim M_a = dim P_a, and δ_a := dim P_a − dim P_a^{ab} = Σ_v δ_v(a) (the affine part of P_a has dimension the sum of local δ-invariants).

The precise hypotheses are: a ∈ A^♥ (homeomorphism) or a ∈ A^ani(k) (point-count form).

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), Proposition 4.13.1 (pp. 86–87); §8.4, Propositions 8.4.2 and 8.4.3 (pp. 175–176)). The product formula ζ, a homeomorphism, and its groupoid form for counting points over k in the anisotropic locus.

Ngô Proposition 4.13.1 (pp. 86–87), citing his earlier 'Fibration de Hitchin et endoscopie' Théorème 4.6 for the equivalence on k̄-points; Proposition 8.4.2 (p. 175) for the point-count form.

The δ formula: the affine part of P_a is the product of the local affine parts (ET.2b/affine-springer-fibre (b)).

**Acceptance.**

- If a is regular semisimple everywhere (U = X̄), M_a = P_a-torsor and δ_a = 0.
- For G = GL_2 and a spectral curve with a single node over v, M_a is a compactified Jacobian, homeomorphic to M_v(a) ∧^{P_v} P_a with δ_a = δ_v(a) = 1.

*Needs:* `ET.2b/hitchin-moduli-stack`; `ET.2b/affine-springer-fibre`; `ET.2b/picard-stack-action`; `ET.2b/kostant-section`.

### ET.2b.11 The δ-stratification and the codimension estimate

Node `ET.2b/delta-stratification` (theorem).

In the setting of ET.2b/hitchin-moduli-stack, for a ∈ A^♥ let δ_a = Σ_v δ_v(a) (ET.2b/product-formula). (a) A^♥ ⊗ k̄ has a unique stratification by locally closed strata A_ψ indexed by the cameral monodromy and local data ψ, on which δ_a is constant; δ is upper semicontinuous: ψ ≥ ψ′ implies δ(ψ) ≤ δ(ψ′) (Ngô Proposition 5.2.4, Lemme 5.3.1). (b) (Local codimension) At a point of a δ-stratum with δ > 0, the local codimension of the stratum in the space of local data is at least δ + 1 (Proposition 5.4.1). (c) (δ-regularity) If deg D is large relative to δ, the stratum A_δ = {a : δ_a = δ} ∩ A^ani has codimension ≥ δ in A^ani (Proposition 5.4.2); hence, for each δ_0, if deg D is large enough, the open A^{≤δ_0} on which the inequality codim A_δ ≥ δ holds for all δ ≤ δ_0 can be used in the support theorem. In characteristic p the estimate is only proved under this degree hypothesis (Ngô notes the issue in §5.4 and §8.6); it is the source of the restriction to an open U ⊂ A^ani in the global argument, with globalization choosing deg D large relative to the δ of the prescribed local data.

The precise hypotheses are: deg D large relative to δ (stated for each δ); char(k) ∤ |W|.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §5.1, Proposition 5.1.3 (p. 94); §5.2, Proposition 5.2.4 (p. 97); §5.3, Lemme 5.3.1 (p. 98); §5.4, Propositions 5.4.1 and 5.4.2 (p. 101)). The stratification of A^♥ by ψ with δ constant on strata, the local codimension bound δ + 1 and the global estimate codim A_δ ≥ δ when deg D is very large relative to δ.

(a) Ngô Proposition 5.2.4 (p. 97), §5.3 and Lemme 5.3.1 (p. 98).

(b) Proposition 5.4.1 (p. 101): deformation of local data at points with δ_v > 0.

(c) Proposition 5.4.2 (p. 101), with Proposition 5.1.3 (p. 94) for the degree hypothesis: the evaluation of global sections of 𝔠_D at finitely many points is surjective onto the jets when deg D is large, so local codimensions add up.

**Acceptance.**

- δ = 0 stratum: a regular semisimple everywhere; codimension 0.
- For G = GL_2 the locus of spectral curves with one node has codimension 1 = δ in A when deg D ≥ 2g + 2 (one condition on the discriminant).

*Needs:* `ET.2b/hitchin-moduli-stack`; `ET.2b/product-formula`; `ET.2b/affine-springer-fibre`; `ET.2b/cameral-cover`; `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch`.

### ET.2b.12 Weak abelian fibrations

Node `ET.2b/weak-abelian-fibration` (definition).

Let k be a finite field (or its algebraic closure) and S a scheme of finite type over k. A weak abelian fibration of relative dimension d is a pair (f : M → S, g : P → S) with: (1) f proper with geometrically reduced fibres of pure dimension d, M smooth over k (Ngô uses M and S smooth, or M a smooth Deligne–Mumford stack); (2) P a smooth commutative group scheme over S with connected fibres of dimension d acting on M over S; (3) the stabilizers of points of M in P are affine (§7.1.2); (4) the Tate module T_{ℚ_ℓ}(P^ab) of the abelian part of the Chevalley decomposition 1 → P^aff_s → P_s → P^ab_s → 1 is polarizable (§7.1.4); (5) (δ-regularity) writing δ_s = dim P^aff_s and S_δ the δ-strata, codim S_δ ≥ δ for all δ (§7.1.3) — P is then called δ-regular. The fibration is used with Q̄_ℓ-coefficients and the perverse cohomology sheaves of f_*Q̄_ℓ, with π_0(P) acting on them through a finite quotient.

The precise hypotheses are: k finite (or algebraically closed); S of finite type.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §7.1, 7.1.1–7.1.4 (pp. 122–124)). The hypotheses of the support theorem: f proper flat with geometrically reduced fibres, M and S smooth, P acting with affine stabilizers, δ-regularity of P and polarizability of its Tate module.

Ngô §7.1 (pp. 122–124): hypotheses 7.1.1–7.1.4 listed as the axioms used in the support theorem; Ngô does not use the name 'weak abelian fibration' in this paper (the term is from his subsequent expositions), and the data here are exactly those hypotheses.

The definition exposes the following operations and relations.

- `TauCeti.WeakAbelianFibration` (data): The structure (f, g) with axioms (1)–(5).
- `TauCeti.WeakAbelianFibration.deltaStratum` (data): The strata S_δ.
- `TauCeti.WeakAbelianFibration.IsDeltaRegular` (data): codim S_δ ≥ δ.
- `TauCeti.WeakAbelianFibration.componentAction` (structure): π_0(P) acts on ^pH^n(f_*Q̄_ℓ) through a finite quotient over the anisotropic locus.
- `TauCeti.WeakAbelianFibration.restrict` (functoriality): Restriction to an open of S preserves the axioms.

**Checks.**

- `weakAbelian_abelianScheme` (degenerate): An abelian scheme P = M → S acting on itself by translation is a weak abelian fibration with δ = 0.
- `weakAbelian_hitchin` (compatibility): (M^ani|_U, P^ani|_U) over the δ-regular open U ⊆ A^ani is a weak abelian fibration (Ngô §7.6).
- `weakAbelian_compactifiedJacobian` (computation): The family of compactified Jacobians of a versal family of integral plane curves over a smooth base, with the generalized Jacobians acting, is a weak abelian fibration (δ = number of nodes along nodal strata).
- `weakAbelian_not_without_affine_stabilizers` (non-example): An abelian scheme acting trivially on a projective family violates the affine-stabilizer axiom (the stabilizers are the whole abelian variety).

**Acceptance.**

- An abelian scheme acting on itself is a weak abelian fibration with δ = 0.
- The anisotropic Hitchin fibration over its δ-regular open is a weak abelian fibration.
- A trivial action of an abelian scheme violates the affine-stabilizer axiom.

*Used by:* ET.2b/support-theorem (the support theorem is stated for weak abelian fibrations); Ngô §7.6 ((M^ani, P^ani) over A^ani (restricted to the δ-regular open) is a weak abelian fibration).

*Needs:* `ET.2b/picard-stack-action`; `ET.2b/delta-stratification`; `EtaleDualityAndPerverseSheaves:EDC.7/decomposition-theorem`.

### ET.2b.13 Purity, decomposition and the κ-isotypic parts of the Hitchin cohomology

Node `ET.2b/kappa-decomposition` (theorem).

In the setting of ET.2b/anisotropic-locus, let f^ani : M^ani → A^ani and K = f^ani_* Q̄_ℓ. (a) K is pure (M^ani smooth, f^ani proper) and, by the decomposition theorem, K ⊗ k̄ is isomorphic to the direct sum of its shifted perverse cohomology sheaves ^pH^n(K), each geometrically semisimple. (b) Over the étale cover Ã^ani of A^ani trivializing the cameral monodromy, the action of π_0(P) on ^pH^n(f̃^ani_* Q̄_ℓ) factors through a finite quotient and gives a decomposition ^pH^n = ⊕_{κ} ^pH^n_κ over the characters κ of that quotient (κ ∈ κ^ani), with ^pH^n_κ supported in Ã_κ ∩ Ã^ani, where Ã_κ is the locus of a whose cameral monodromy fixes κ (Ngô (6.2.5), Proposition 6.2.6). (c) The κ = 1 part is the stable part ^pH^n_st. The decomposition theorem is applied to f^ani with source a smooth separated Deligne–Mumford stack (Ngô Remarque 7.5.1); the atlas's decomposition theorem (EtaleDualityAndPerverseSheaves:EDC.7) is stated for schemes, and its extension to proper maps from such stacks is requested.

The precise hypotheses are: the setting of ET.2b/anisotropic-locus; ℓ ≠ char(k), coefficients Q̄_ℓ.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §6.2, (6.2.5) and Proposition 6.2.6 (pp. 113–114); Remarque 7.5.1 (p. 149); Corollaire 5.7.5 (p. 110)). Purity and the decomposition theorem for f^ani, the action of π_0(P) and the κ-decomposition of the perverse cohomology with supports in Ã_κ; the extension of the purity/decomposition argument to Deligne–Mumford stacks.

(a) Deligne's theorem that proper direct images of pure complexes are pure (DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6) and the decomposition theorem of BBD 5.4.5 (EtaleDualityAndPerverseSheaves:EDC.7/decomposition-theorem), applied as in Ngô §6.2 (p. 113) with Remarque 7.5.1 (p. 149) for Deligne–Mumford stacks.

(b) The homotopy argument: P acts on K, its identity component acts trivially on cohomology sheaves, so π_0(P) acts; over Ã^ani it is a quotient of a constant finitely generated group with finite image (Ngô §6.2, (6.2.5) and Proposition 6.2.6, p. 114; Corollaire 5.7.5, p. 110).

**Acceptance.**

- For G = GL_n, π_0(P_a) = ℤ for all a and its action on each fixed-degree component is trivial, so only κ = 1 occurs.
- For G = SL_2, κ ranges over characters of ℤ/2, and the nontrivial κ-part attached to a connected étale double cover X′ → X is supported on the image of the endoscopic base A_H, where the spectral curves are nodal with normalization X′.

*Needs:* `ET.2b/anisotropic-locus`; `ET.2b/picard-stack-action`; `EtaleDualityAndPerverseSheaves:EDC.7/decomposition-theorem`; `EtaleDualityAndPerverseSheaves:EDC.7/pure-complex-geometric-splitting`; `DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6`.

### ET.2b.14 Ngô's support theorem ★

Node `ET.2b/support-theorem` (theorem).

Let (f : M → S, P) be a weak abelian fibration of relative dimension d over S of finite type over a finite field (ET.2b/weak-abelian-fibration), with M and S smooth and P δ-regular. (a) (Support inequality) For every geometrically simple perverse constituent K of some ^pH^n(f_*Q̄_ℓ) with support Z, and δ_Z the minimal δ on Z, the amplitude of the cohomology of K at a generic point satisfies amp ≥ 2(d − δ_Z) (Ngô Proposition 7.2.3, after the cohomological amplitude argument of 7.2.2); combined with δ-regularity and relative hard Lefschetz this forces codim Z ≤ δ_Z. (b) (Support theorem) Z is the closure of one of the strata S_σ of the stratification by the monodromy of the Tate module (Théorème 7.1.5), and, with the action of π_0(P), the κ-part has its supports among the strata where κ is fixed (Théorème 7.1.13). (c) (Hitchin case) For the anisotropic Hitchin fibration restricted to the δ-regular open, every support of ^pH^n(f̃^ani_* Q̄_ℓ)_κ is the image Ã_H of the endoscopic Hitchin base of the endoscopic group H attached to κ (Théorème 7.6.6); in particular for κ = 1 the support of the stable part is all of Ã^ani.

The precise hypotheses are: (f, P) a weak abelian fibration with M, S smooth and P δ-regular; for (c): the δ-regular open of A^ani (deg D large).

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §7.1, Théorème 7.1.5 and Corollaire 7.1.6 (pp. 124–125), Théorème 7.1.13 (pp. 127–128); §7.2, 7.2.2 and Proposition 7.2.3 (pp. 130–131); §7.6, Lemme 7.6.5 and Théorème 7.6.6 (p. 153)). The support theorem for weak abelian fibrations, its κ-version, the support inequality amp(α) ≥ 2(d − δ_α), and its application identifying the supports of the κ-parts of the anisotropic Hitchin cohomology with Ã_H.

(a) Ngô §7.2 (pp. 130–131): freeness of the cohomology of the fibres over the cohomology of the Tate module of P^ab gives the amplitude bound.

(b) Ngô §7.3 (p. 131 ff.) deduces Théorème 7.1.5 (pp. 124–125) and its κ-version Théorème 7.1.13 (pp. 127–128) from (a), δ-regularity and relative hard Lefschetz (EtaleDualityAndPerverseSheaves:EDC.7/relative-hard-lefschetz-theorem for the projective case, as in BBD).

(c) Ngô §7.6 (pp. 149–153), Lemme 7.6.5 and Théorème 7.6.6, identifying the strata where κ is fixed with the images of endoscopic Hitchin bases.

**Acceptance.**

- For an abelian scheme (δ = 0 everywhere), the only support is S itself.
- For the compactified Jacobian family of a versal family of integral plane curves, the support theorem recovers that the perverse cohomology has full support (Ngô's argument, cf. Migliorini–Shende for the comparison).

*Needs:* `ET.2b/weak-abelian-fibration`; `ET.2b/kappa-decomposition`; `ET.2b/delta-stratification`; `ET.2b/anisotropic-locus`; `EtaleDualityAndPerverseSheaves:EDC.7/decomposition-theorem`; `EtaleDualityAndPerverseSheaves:EDC.7/relative-hard-lefschetz-theorem`.

### ET.2b.15 Geometric stabilization: comparison of κ-parts with stable parts of endoscopic groups ★

Node `ET.2b/endoscopic-comparison` (theorem).

In the setting of ET.2b/support-theorem, let κ be a character as in ET.2b/kappa-decomposition, (H, κ) the corresponding endoscopic datum over X (determined by κ and the cameral monodromy, Ngô §1.8 and §6.3), ν : Ã_H → Ã the endoscopic map of Hitchin bases (finite and unramified on the anisotropic part over the transverse locus), and r_{G,H}(D) = (#Φ − #Φ_H) deg(D)/2. Then over Ã_H^ani (restricted to the δ-regular open) there is an isomorphism between the semisimplifications of the graded perverse sheaves ν^*(⊕_n ^pH^n(f̃^ani_* Q̄_ℓ)_κ)[2r_{G,H}(D)](r_{G,H}(D)) and ⊕_n ^pH^n(f̃^ani_{H,*} Q̄_ℓ)_st (Ngô Théorème 6.4.3). The proof first establishes the comparison over the transverse (good) locus by point counting — the local identities of ET.2b/hitchin-point-count at the points of Ã_H where the δ of G equals the δ of H plus the explicit contribution — and then extends it to all of Ã_H^ani by the support theorem (both sides have supports exactly Ã_H, so an isomorphism over a dense open of each support extends).

The precise hypotheses are: the setting of ET.2b/support-theorem; deg D large (δ-regular open), D = D′^{⊗2}.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §6.3–6.4, §6.4.2 and Théorème 6.4.3 (p. 120); §8.5, Lemmes 8.5.1 and 8.5.7 (pp. 178–179); §8.7 (p. 185)). The geometric stabilization: isomorphism between the semisimplifications of the shifted κ-part for G and the stable part for H over Ã_H^ani, its proof over the transverse locus by counting and its extension by the support theorem.

Transverse locus: Ngô §8.5, Lemme 8.5.1 (p. 178) gives the open set of transversal a_H, and Lemme 8.5.7 (p. 179) the local count identity with q^{deg v · r_{GH,v}(a_H)}; the Chebotarev-type principle that semisimple mixed perverse sheaves on a scheme over 𝔽_q are determined up to semisimplification by their Frobenius traces at closed points (requested from EtaleDualityAndPerverseSheaves:EDC.7) gives equality of the semisimplified perverse sheaves on that open.

Extension: ET.2b/support-theorem (c) — every support of either side is Ã_H — so the isomorphism of semisimplifications over a dense open of Ã_H extends (Ngô §§6.4, 7.6–7.7).

Shift r_{G,H}(D): the difference of dimensions of the Hitchin fibres of G and H over Ã_H (Ngô §6.4.2, p. 120).

**Acceptance.**

- For κ = 1 and H = G the statement is a tautology with r_{G,G} = 0.
- For G = SL_2 and H the norm-one torus of a connected étale double cover X′ → X: #Φ − #Φ_H = 2, so r_{G,H}(D) = deg D, and the comparison identifies the nontrivial κ-part over Ã_H with the stable cohomology of the Hitchin fibration of the torus H (whose fibres are torsors under the Picard stack of H-torsors), shifted by 2 deg D and Tate-twisted by deg D.

*Needs:* `ET.2b/support-theorem`; `ET.2b/kappa-decomposition`; `ET.2b/hitchin-point-count`; `ET.2b/regular-centralizer`; `ET.0/endoscopic-datum`; `EtaleDualityAndPerverseSheaves:EDC.7/decomposition-theorem`.

### ET.2b.16 Counting points of Hitchin fibres

Node `ET.2b/hitchin-point-count` (theorem).

In the setting of ET.2b/anisotropic-locus, for a ∈ A^ani(k) with U ⊆ X the regular semisimple locus of a: (a) (Grothendieck–Lefschetz) the number of k-points of [M_a/P′_a], counted with the weights 1/#Aut and twisted by a character κ of π_0(P_a) (κ-weighted count), equals the alternating trace of Frobenius on the κ-part of the cohomology of M_a (Ngô Proposition 8.1.13); (b) (Local factors) by the product formula in its point-count form (ET.2b/product-formula), the global κ-weighted count of [M_a/P′_a] is the product over v ∈ X \ U of the κ-weighted counts of the local quotients [M_v(a)/P_v(J′_a)] (Propositions 8.4.2–8.4.3); (c) (Endoscopic local identity on the transverse locus) at a point a_H of the transverse open of the endoscopic base (Lemme 8.5.1), the κ-weighted local count for G at v equals q^{deg(v) r_{G,H,v}(a_H)} times the stable local count for H (Lemme 8.5.7), proved by direct comparison of the local affine Springer fibres where the G-discriminant exceeds the H-discriminant only by the resultant. The translation of local κ-weighted counts into κ-orbital integrals is ET.3/orbital-integrals-as-point-counts.

The precise hypotheses are: a ∈ A^ani(k); Grothendieck–Lefschetz for Deligne–Mumford stacks of finite type over k.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §8.1, Propositions 8.1.6 and 8.1.13 (pp. 157–160); §8.4, Propositions 8.4.2–8.4.3 (pp. 175–176); §8.5, Lemmes 8.5.1 and 8.5.7 (pp. 178–179)). The cohomological point count, the product of local κ-weighted counts over the singular points, and the endoscopic local identity on the transverse locus.

(a) The Grothendieck–Lefschetz trace formula for Deligne–Mumford stacks of finite type over 𝔽_q (requested from SchemeAndStackFoundations:SF.2; the scheme case underlies it), as used by Ngô §8.1 (Proposition 8.1.6 for finiteness, Proposition 8.1.13 for the formula, pp. 157–160).

(b) Ngô §8.4 (pp. 175–176); (c) §8.5 (pp. 177–179).

**Acceptance.**

- If a is regular semisimple and unramified everywhere, the κ-count is the number of k-points of a torsor under P_a weighted by κ, and the product of local counts is 1.
- For G = GL_1 the count of degree-d points is #Pic^d_X(k) = #Pic^0_X(k).

*Needs:* `ET.2b/anisotropic-locus`; `ET.2b/product-formula`; `ET.2b/affine-springer-fibre`; `SchemeAndStackFoundations:SF.2`.

### ET.2b.17 Worked examples for the Hitchin fibration

Node `ET.2b/acceptance-examples` (application).

(1) Torus: for G = T, A = H^0(X, 𝔱 ⊗ D), M = Bun_T × A, P = Bun_T × A, δ = 0, every a is regular semisimple, affine Springer fibres are discrete and the support theorem is trivial. (2) Rank-one degenerating spectral curve: for G = GL_2, a family of spectral curves acquiring one node at v ∈ X has δ_v = 1, M_a is the compactified Jacobian of the nodal curve, P_a is the generalized Jacobian (an extension of the Jacobian of the normalization by G_m), and the product formula expresses M_a through the affine Springer fibre at v (a chain of ℙ^1's modulo ℤ). (3) Nontrivial component character: for G = SL_2 and a = ν(a_H) with H the norm-one torus of a connected étale double cover X′ → X, the spectral curve is nodal with normalization X′ and π_0(P_a) carries the nontrivial character κ attached to X′. (4) Endoscopic Hitchin fibre: for G = SL_2 and H the norm-one torus of a connected étale double cover X′ → X, the endoscopic Hitchin base A_H maps to A by ν, and over its image the nontrivial κ-part of the cohomology is identified (ET.2b/endoscopic-comparison) with the stable cohomology of the H-fibration shifted by 2 deg D.

The precise hypotheses are: X smooth projective over 𝔽_q, char ≠ 2 for (3)–(4).

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §§4–7 as cited in the nodes used). The constructions from which the examples are computed.

Each example is computed from ET.2b/hitchin-moduli-stack, ET.2b/picard-stack-action, ET.2b/affine-springer-fibre, ET.2b/product-formula and ET.2b/endoscopic-comparison.

**Acceptance.**

- Each of the four examples is checked as stated.

*Needs:* `ET.2b/hitchin-moduli-stack`; `ET.2b/picard-stack-action`; `ET.2b/affine-springer-fibre`; `ET.2b/product-formula`; `ET.2b/endoscopic-comparison`.

## Layer ET.3: Fundamental lemma and existence of local transfer

The targets are the fundamental lemma in its forms and the existence of transfer. Point counts become κ-orbital integrals; Ngô's theorem gives the Lie-algebra fundamental lemma in equal characteristic and Waldspurger's change of characteristic carries it to p-adic fields; descent gives the group version and Hales' reduction the spherical Hecke algebra; Waldspurger's theorem gives transfer; and the inner-form, base-change and twisted variants follow.

### ET.3.1 The Lie-algebra fundamental lemma in equal characteristic (Ngô) ★

Node `ET.3/lie-algebra-fundamental-lemma` (theorem).

Let k be a finite field with q elements, 𝒪 = k[[ε]], F = k((ε)), G a reductive group scheme over 𝒪 (quasi-split, split over an unramified extension) whose Weyl group order is not divisible by char(k), and (H, κ) an unramified endoscopic datum of G with H the corresponding reductive group scheme over 𝒪. For a ∈ 𝔠_H(𝒪) ∩ 𝔠_H^{G-rs}(F) (G-regular semisimple) with image ν(a) ∈ 𝔠(𝒪), and Haar measures giving the centralizer tori compatible volumes, Δ_G(ν(a)) O^κ_{ν(a)}(1_{𝔤(𝒪)}) = Δ_H(a) SO_a(1_{𝔥(𝒪)}), where 1_{𝔤(𝒪)}, 1_{𝔥(𝒪)} are the characteristic functions of the integral points of the Lie algebras, O^κ is the κ-orbital integral and SO the stable orbital integral (ET.1/kappa-and-stable-orbital-integrals), Δ_G(a) = q^{−val(D_G(a))/2} and Δ_H(a) = q^{−val(D_H(a))/2}; equivalently O^κ_{ν(a)}(1_{𝔤(𝒪)}) = q^{r_{G,H}(a)} SO_a(1_{𝔥(𝒪)}) with r_{G,H}(a) the valuation of the relative discriminant divided by 2. This is the Langlands–Shelstad fundamental lemma for Lie algebras with the transfer factor of ET.1/lie-algebra-transfer-factor normalized by taking as base point of each stable class the value of the Kostant section (ET.2b/kostant-section), which Kottwitz showed agrees with the Langlands–Shelstad normalization for quasi-split G (Ngô §1.11, p. 23). The characteristic hypothesis is char(k) ∤ |W| (Ngô, arXiv v3, Théorème 1); the roadmap's earlier description of this layer quoted the stronger condition p > 2h, which is not the hypothesis of the version read.

The precise hypotheses are: k finite, char(k) ∤ |W|; G, H unramified over 𝒪 = k[[ε]] with an unramified endoscopic datum; a G-regular semisimple.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), Introduction, Théorème 1 (p. 1); §1.11, Théorème 1.11.1 and §1.11.3 (pp. 23–24); §8.6, §§8.6.1–8.6.4 (pp. 182–183)). The fundamental lemma for Lie algebras of unramified groups over k((ε)) with char(k) not dividing |W|, in the forms with q^{r_{GH}} and with Δ_G, Δ_H; the globalization of local data and the deduction from the geometric stabilization.

([T. C. Hales, A statement of the fundamental lemma](https://arxiv.org/abs/math/0312227v2), §6.1, Conjecture 6.1 (PDF p. 10); §7.2 (PDF p. 12)). The statement of the fundamental lemma for unit elements and its reduction to an identity in the Lie algebra.

Globalize: choose a smooth projective curve X over k, a point v with completion F, a line bundle D = D′^{⊗2} of large degree, and a global a_H ∈ A_H^ani(k) whose germ at v is the given local element and which is regular semisimple and unramified at the other points where needed (Ngô §8.6.1–8.6.4, pp. 182–183; the choice uses deg D > rN + 2g).

Count points: the κ-weighted count of the G-Hitchin fibre and the stable count of the H-Hitchin fibre are products of local counts (ET.2b/hitchin-point-count), and each local count is a volume times a κ-orbital (resp. stable) integral of the unit function (ET.3/orbital-integrals-as-point-counts).

Compare cohomologies: the geometric stabilization (ET.2b/endoscopic-comparison) identifies the κ-part of the G-cohomology over Ã_H with the stable part of the H-cohomology, shifted and twisted by r_{G,H}(D); taking traces of Frobenius gives a global identity of products of local terms.

Isolate the local factor at v: at the other singular points the local identity holds by induction or by the transverse-locus identity (ET.2b/hitchin-point-count (d)), so the local identity at v follows (Ngô §8.6, proof of Théorème 1.11.1, p. 182 ff.).

**Acceptance.**

- For H = G (κ = 1) both sides are equal by definition (r = 0).
- For G = SL_2 and H the norm-one torus of an unramified quadratic extension: O^κ_{ν(a)}(1_{𝔰𝔩_2(𝒪)}) = q^{val(D_G(a))/2} times the volume of the integral points of the torus, a statement checkable by counting lattices (the case Langlands verified by hand).
- For unitary groups the statement specializes to Laumon–Ngô's theorem (ET.3/unitary-fundamental-lemma).

*Needs:* `ET.2b/endoscopic-comparison`; `ET.2b/hitchin-point-count`; `ET.2b/support-theorem`; `ET.2b/kostant-section`; `ET.3/orbital-integrals-as-point-counts`; `ET.1/lie-algebra-transfer-factor`; `ET.1/kappa-and-stable-orbital-integrals`; `ET.0/endoscopic-datum`; `FunctionFieldArithmetic:FA.2/projective-adeles`; `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch`.

### ET.3.2 Local κ-weighted point counts are κ-orbital integrals

Node `ET.3/orbital-integrals-as-point-counts` (theorem).

Let k = 𝔽_q, v a closed point of a curve over k with completion F_v = k(v)((ε_v)), G as in ET.2b/affine-springer-fibre and a ∈ 𝔠(𝒪_v) ∩ 𝔠^rs(F_v), with J_a, J′_a ⊆ J_a the open subgroup of ET.2b/regular-centralizer and κ a character of π_0(P_v(J′_a)) induced from a global κ. Then the number of k(v)-points of the quotient groupoid [M_v(a)/P_v(J′_a)], each point weighted by κ of its invariant and divided by the order of its automorphism group, equals vol(J′_a(𝒪_v), dt_v)·O^κ_a(1_{𝔤(𝒪_v)}, dt_v), where O^κ is the κ-orbital integral of ET.1/kappa-and-stable-orbital-integrals of the characteristic function of 𝔤(𝒪_v) over the stable class a with the measure dt_v on the centralizer torus; for κ = 1 the count is the stable orbital integral (Ngô Lemme 8.2.4, Propositions 8.2.5 and 8.2.7). Consequently the global κ-count of ET.2b/hitchin-point-count is a product of local κ-orbital integrals of unit functions times explicit volumes.

The precise hypotheses are: k finite, char(k) ∤ |W|; a integral and regular semisimple over F_v.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §8.2, Lemme 8.2.4, Propositions 8.2.5 and 8.2.7 (pp. 164–167)). The κ-weighted number of k-points of [M_v(a)/P_v(J′_a)] is vol(J′_a(𝒪_v))·O^κ_a(1_{𝔤_v}), and its variant for P_v(J_a).

Points of M_v(a) over k(v) are lattices g ∈ G(F_v)/G(𝒪_v) with Ad(g)⁻¹γ_a ∈ 𝔤(𝒪_v) (ET.2b/affine-springer-fibre); modulo P_v(J′_a)(k(v)) = J′_a(F_v)/J′_a(𝒪_v) they are the G(F_v)-conjugacy classes of elements of 𝔤(𝒪_v) in the stable class of γ_a with given invariant, weighted by the inverse volumes of their centralizers (Ngô §8.2, Lemme 8.2.4).

The κ-twist: the invariant of a rational class in the stable class is identified with the class in H^1(F_v, J_a) and κ is evaluated on it (ET.0/rational-classes-in-stable-class), giving the κ-weighted sum (Propositions 8.2.5, 8.2.7).

**Acceptance.**

- If a is regular semisimple modulo ε_v (δ_v = 0), M_v(a)/P_v(J′_a) is a point with automorphism group of volume matching vol(J′_a(𝒪_v)), and O^κ_a(1) = 1.
- For G = GL_n (κ = 1 only) the count is the classical lattice count expressing O_a(1_{𝔤𝔩_n(𝒪)}) as a number of 𝒪[γ_a]-stable lattices up to the centralizer.

*Needs:* `ET.2b/affine-springer-fibre`; `ET.2b/regular-centralizer`; `ET.1/kappa-and-stable-orbital-integrals`; `ET.1/orbital-integral`; `ET.0/rational-classes-in-stable-class`.

### ET.3.3 The fundamental lemma for unitary Lie algebras (Laumon–Ngô)

Node `ET.3/unitary-fundamental-lemma` (theorem).

Let F be a finite extension of 𝔽_p((t)) with residue field k, F′/F an unramified quadratic extension with residue characteristic ≠ 2, G = U(n) the unitary group of a hermitian form over F′/F with a hyperspecial model, and n = n_1 + n_2 a nontrivial partition with H = U(n_1) × U(n_2) the corresponding endoscopic group and κ the associated character. If char(k) > n, then for G-regular semisimple γ in the Lie algebra of H(F) with image in 𝔤(F), O^κ_γ = (−1)^r q^r SO^H_γ for the characteristic functions of the integral Lie algebras, with r = r_{I_1,I_2} the valuation of the resultant of the two characteristic polynomials (Laumon–Ngô Théorème 1.5.1); combined with Waldspurger's reductions this gives the fundamental lemma for unitary groups over p-adic fields when p is large, used by Shin and by Liu–Tian–Xiao–Zhang–Zhu.

The precise hypotheses are: F of equal characteristic p with char(k) > n; F′/F unramified quadratic, residue characteristic ≠ 2.

([G. Laumon and B. C. Ngô, Le lemme fondamental pour les groupes unitaires](https://arxiv.org/abs/math/0404454v2), Abstract and §0.1 (PDF pp. 1–2); §1.1 (PDF pp. 4–5); §1.5, Théorème 1.5.1 (PDF p. 10)). The Langlands fundamental lemma for unitary groups over finite extensions of 𝔽_p((t)) with p > rank, for the unramified quadratic F′/F and H = U(n_1) × U(n_2); the identity O^κ_γ = (−1)^r q^r SO^H_γ.

([Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), §D.2, Lemma D.2.2 and its proof (p. 369)). Uses the fundamental lemma for unramified unitary groups: the characteristic function of a hyperspecial subgroup transfers to that of the endoscopic group (extraction item PAPER-LIU-ETAL-22/endoscopic-fundamental-lemma).

Laumon–Ngô prove it by a G_m-equivariant localization on the Hitchin fibration for unitary groups (a special case subsumed by ET.3/lie-algebra-fundamental-lemma, whose hypothesis char(k) ∤ |W| = n! is the same as char(k) > n for U(n)).

Transfer to characteristic 0: ET.3/change-of-characteristic and ET.3/group-fundamental-lemma.

**Acceptance.**

- n = 2, n_1 = n_2 = 1: H = U(1) × U(1) is a torus, SO^H_γ is a volume, and the identity is the unitary analogue of the SL_2 computation.
- n_2 = 0 is excluded (nontrivial partition); for it the statement is the tautology O_γ = SO_γ for G.

*Needs:* `ET.3/lie-algebra-fundamental-lemma`; `ET.1/unitary-transfer-factor`; `ET.0/unitary-elliptic-endoscopic-data`.

### ET.3.4 Waldspurger's non-standard fundamental lemma (Ngô)

Node `ET.3/nonstandard-fundamental-lemma` (theorem).

Let k be a finite field, 𝒪 = k[[ε]], F = k((ε)), and G_1, G_2 two semisimple simply connected quasi-split groups over 𝒪 with isogenous root data, i.e. a non-standard endoscopic triple (G_1, G_2, j_*) in Waldspurger's sense: an isomorphism j_* : X_{1,*} ⊗ ℚ → X_{2,*} ⊗ ℚ of rational cocharacter spaces, Galois-equivariant, sending each coroot of G_1 to a positive rational multiple of a coroot of G_2 and dually (the basic case G_1 = Sp(2n), G_2 = SO(2n + 1) or Spin(2n+1)), with the Weyl group order prime to char(k). Then for regular semisimple a_1 ∈ 𝔠_1(𝒪) and a_2 = j(a_1) ∈ 𝔠_2(𝒪) corresponding under the induced isomorphism of Chevalley quotients 𝔠_1 ≅ 𝔠_2 (over 𝒪 after the identification of 𝔱_1 and 𝔱_2 given by j_*), SO_{a_1}(1_{𝔤_1(𝒪)}) = SO_{a_2}(1_{𝔤_2(𝒪)}) (Ngô Théorème 2; Théorème 1.12.7 in equal characteristic). Its consumer in this roadmap is the twisted fundamental lemma (ET.3/twisted-fundamental-lemma-and-transfer), where non-standard triples arise from the descent of twisted endoscopy to centralizers; it is not needed for ordinary endoscopy or for cyclic base change.

The precise hypotheses are: equal characteristic, char(k) ∤ |W|; a non-standard endoscopic triple (G_1, G_2, j_*).

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), Introduction, Théorème 2 (p. 2); §1.12, Théorème 1.12.7 (p. 27); §8.8, Théorème 8.8.2 (p. 186) and §8.8.7 (p. 187)). The non-standard fundamental lemma for groups with isogenous root data, proved in equal characteristic by the same geometric method.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.7 (pp. 13–15); §§3.6–3.7 (pp. 32–35); §4.10 (p. 52)). Non-standard endoscopic triples, the constraints on those arising by descent from twisted endoscopy, and the statement of the non-standard fundamental lemma.

Ngô §8.8 (Théorème 8.8.2, p. 186): the anisotropic Hitchin fibrations of G_1 and G_2 have isomorphic bases and their stable perverse cohomologies have isomorphic semisimplifications (same support argument as ET.2b/endoscopic-comparison with κ = 1), and the point count gives the equality of stable orbital integrals (§8.8.7, p. 187).

Waldspurger's definition and reduction of the non-standard triples: Waldspurger 2008 §1.7 (pp. 13–15) and §3.6–3.7.

**Acceptance.**

- For G_1 = G_2 and j_* the identity the statement is a tautology.
- G_1 = Sp(2), G_2 = Spin(3) ≅ SL_2: the coroots are scaled by 2 and 1/2 and the identity is between stable orbital integrals of 𝔰𝔭_2 = 𝔰𝔩_2 and 𝔰𝔬_3 ≅ 𝔰𝔩_2 at matching elements.

*Needs:* `ET.2b/support-theorem`; `ET.2b/kappa-decomposition`; `ET.2b/hitchin-point-count`; `ET.2b/chevalley-quotient`; `ET.1/kappa-and-stable-orbital-integrals`.

### ET.3.5 Change of characteristic for orbital integrals and the fundamental lemma

Node `ET.3/change-of-characteristic` (theorem).

Fix a finite field 𝔽_q of characteristic p and let CL_q be the set of nonarchimedean local fields with residue field 𝔽_q (of characteristic 0 or p). Fix the root datum of a connected reductive group with an action of the tame Galois group Θ ⋉ I (independent of F ∈ CL_q) and an endoscopic triple, both tamely ramified. Assume p is large relative to the rank of G (Waldspurger's standing hypothesis; this bound is separate from and in general stronger than p ∤ |W|). Then: (a) orbital integrals of the functions attached to Moy–Prasad lattices (the space S of the source) depend on F only through 𝔽_q: there are linear forms J^D(z, δ, ·) on S, indexed by F-independent replacements z of stable classes and cohomological data δ, with J_{G^D}(X, rea_F(φ)) = J^D(z, δ, φ) for every F ∈ CL_q (Théorème 7.2); (b) if rea_{H,F}(φ_H) is a transfer of rea_F(φ) for one F ∈ CL_q, then rea_{H,F′}(φ_H) is a transfer of rea_{F′}(φ) for every F′ ∈ CL_q (Corollaire 9.2); (c) in the unramified case, the Lie-algebra fundamental lemma holds over F if and only if it holds over F′ (Corollaire 9.3). Combined with ET.3/lie-algebra-fundamental-lemma, the Lie-algebra fundamental lemma holds for unramified data over every p-adic field of characteristic 0 whose residue characteristic p is large relative to G.

The precise hypotheses are: p large relative to the rank of G (Waldspurger's hypothesis); G and the endoscopic datum tamely ramified (unramified for (c)).

([J.-L. Waldspurger, Endoscopie et changement de caractéristique](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopie.pdf), Introduction (pp. 1–5); §7, Théorème 7.2 (p. 67); §9, Corollaires 9.2 and 9.3 (p. 70)). Under the hypothesis that the residue characteristic is large relative to the rank, orbital integrals of Moy–Prasad lattice functions are independent of the local field with given residue field; transfer and the Lie-algebra fundamental lemma transfer between fields of characteristic 0 and p with the same residue field.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), Introduction (p. 2)). Ngô proves the equal-characteristic case and notes that the mixed-characteristic case follows from Waldspurger's change of characteristic.

Translate stable classes, Moy–Prasad lattices and the tame Galois group into F-independent data (Waldspurger 2006, Introduction and §§1–6), using DeBacker's parametrization of nilpotent orbits and homogeneity of germs (ET.1/shalika-germs).

(a) Théorème 7.2 (p. 67); (b) Corollaire 9.2 (p. 70); (c) Corollaire 9.3 (p. 70), applying (b) to the unit functions of the hyperspecial lattices.

Close local fields (Deligne, Kazhdan) are the classical form of the same principle; the source's route is the F-independent description above.

**Acceptance.**

- For G = T a torus the forms J^D are evaluations and the statements are trivial.
- For G = SL_2 and its elliptic torus data, the κ-orbital integrals of the unit function computed over 𝔽_q((t)) and over the unramified extension of ℚ_p of residue field 𝔽_q agree for p large.

*Needs:* `ET.1/orbital-integral`; `ET.1/shalika-germs`; `ET.1/lie-algebra-transfer-factor`; `ET.1/matching-functions`; `ReductiveGroupsPartII:RG2.3/moy-prasad-filtration`; `ET.3/lie-algebra-fundamental-lemma`.

### ET.3.6 The fundamental lemma for groups and for spherical Hecke algebras ★

Node `ET.3/group-fundamental-lemma` (theorem).

Let F be a p-adic field of characteristic 0, G a connected reductive group over F, unramified with hyperspecial subgroup K = G(𝒪), (H, ℋ, s, ξ) an unramified endoscopic datum with z-pair, hyperspecial K_H ⊆ H(F), and Δ_0 the unramified normalization of the transfer factor (ET.1/local-transfer-factor, normalized as in Hales and Waldspurger). If p is large relative to G (Waldspurger's hypotheses of 2008 §4.4), then: (a) (unit elements) the characteristic function 1_{K_H}, suitably normalized for the z-pair and Haar measures giving K and K_H volume 1, is a transfer of 1_K: SO_{γ_H}(1_{K_H}) = Σ_δ Δ_0(γ_H, δ) O_δ(1_K) for every strongly G-regular γ_H; (b) (spherical Hecke algebra) for every f in the spherical Hecke algebra ℋ(G(F), K), the function b(f) ∈ ℋ(H(F), K_H) obtained from the L-embedding ξ through the Satake isomorphisms is a transfer of f. (a) follows from the Lie-algebra fundamental lemmas for the descended data of all semisimple centralizers (ET.3/change-of-characteristic and ET.3/lie-algebra-fundamental-lemma) by semisimple descent (Waldspurger 2008 Théorème 4.11 specialised to θ = 1, where the non-standard triples are trivial); (b) follows from (a) by Hales' reduction to unit elements.

The precise hypotheses are: F p-adic of characteristic 0, residue characteristic p large relative to G; G, H unramified with hyperspecial subgroups; unramified endoscopic datum.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §§4.4–4.11 (pp. 48–52) and §5 (pp. 53–73), Théorème 4.11). Under the unramified hypotheses of §4.4, the Lie-algebra fundamental lemma for the descended data (and the non-standard one, trivial when θ = 1) implies the fundamental lemma for unit elements of the group.

([T. C. Hales, A statement of the fundamental lemma](https://arxiv.org/abs/math/0312227v2), Conjecture 6.1 (PDF p. 10) and Remark 9.3 (PDF p. 17)). The statement for unit elements of hyperspecial Hecke algebras and the known passage from the unit element to the whole spherical Hecke algebra.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.4 and Remark 3.4 (p. 15)). The transfer and the fundamental lemma for unit elements are known in all cases (Waldspurger, Laumon–Ngô, Ngô), with Hales' reduction to unit elements.

(a) Waldspurger 2008 §§4.4–4.11 and §5 with θ = 1 and ω = 1: descent of stable and κ-orbital integrals of the unit function to centralizers of topologically semisimple elements (§§5.2–5.8), equality of unramified transfer factors after descent (§§5.10–5.11), and the Lie-algebra fundamental lemma for each descended datum.

(b) Hales, 'On the fundamental lemma for standard endoscopy: reduction to unit elements', Canad. J. Math. 47 (1995) (not read; recalled by Hales 2003 Remark 9.3 and by Shin §3.4, p. 15).

Satake isomorphism and the map b: SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism (with its unitary normalizations) and ReductiveGroupsPartII:RG2.5 (dual groups).

**Acceptance.**

- For H = G (s = 1), b is the identity and (a)–(b) are tautologies.
- For G = GL_n there is no proper elliptic datum and the statement reduces to (a) for H = G.
- The residue-characteristic bound cannot be replaced by p ∤ |W| alone: Waldspurger's descent and change of characteristic need p large relative to G.

*Used by:* ET.4 (part 2) (finite-place test functions in the stable trace formula are spherical functions and their transfers); Shin 2011 §3.4; Liu–Tian–Xiao–Zhang–Zhu §D.2 (hyperspecial transfer at unramified places).

*Needs:* `ET.3/lie-algebra-fundamental-lemma`; `ET.3/change-of-characteristic`; `ET.1/local-transfer-factor`; `ET.1/transfer-factor-properties`; `ET.1/matching-functions`; `ReductiveGroupsPartII:RG2.3/hyperspecial-vertices`; `SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism`; `SmoothRepresentationsOfLocalGroups:SR.1/convolution-algebra`.

### ET.3.7 Existence of smooth transfer (Waldspurger) ★

Node `ET.3/local-transfer-existence` (theorem).

Let F be a local field of characteristic 0, G connected reductive over F, (H, ℋ, s, ξ) an endoscopic datum with z-pair (H_1, λ_1) and Δ an absolute transfer factor. Then every f ∈ C_c^∞(G(F)) has a transfer f^{H_1} ∈ C_1^∞(H_1(F)) (ET.1/matching-functions). At archimedean F this is Shelstad's theorem (ET.1/real-transfer). For F p-adic, Waldspurger proved that the Lie-algebra fundamental lemma for unramified data over all p-adic fields of sufficiently large residue characteristic implies Lie-algebra transfer for every p-adic F of characteristic 0 (through a global argument with an auxiliary place, the compatibility of transfer with Fourier transform and the germ expansion, which remove any restriction on the residue characteristic of F itself), and the group transfer follows by semisimple descent and the local gluing lemma; with ET.3/group-fundamental-lemma (unconditional by Ngô and Waldspurger) transfer is unconditional. In particular transfer exists between a connected reductive group and its quasi-split inner form (Waldspurger 1997, Corollaire 1.7).

The precise hypotheses are: F local of characteristic 0 (any residue characteristic); an endoscopic datum with z-pair.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §3.3, before Théorème 3.3.1 (p. 78)). Waldspurger's difficult result that transfer between a connected reductive group and its quasi-split inner form is possible (his Corollary 1.7).

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Introduction (p. 2); §3.4 (p. 15)). The transfer conjecture of Langlands–Shelstad is known, via Waldspurger and Ngô, for all endoscopic data.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §2.2 (pp. 19–21); §2.3 (p. 21)). The local gluing lemma for transfer (after Langlands–Shelstad Lemma 2.2.A) and descent to Lie algebras.

([J. Arthur, An introduction to the trace formula](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §27 (pp. 192–204)). Statement of the Langlands–Shelstad transfer conjecture and its reduction to the fundamental lemma by Waldspurger.

Lie algebra: Waldspurger 1997 (not read; its main theorem and Corollary 1.7 are recalled by Labesse §3.3 and Shin §3.4): the Fourier-transform compatibility (ET.1/fourier-transform-orbital-integrals), homogeneity of germs (ET.1/shalika-germs), and a global argument choosing a number field and an auxiliary place where the fundamental lemma holds for large residue characteristic (ET.3/change-of-characteristic).

Group: descend near each semisimple element to the Lie algebra of its centralizer (ET.1/transfer-factor-properties (e)) and glue local transfers by Waldspurger 2008 §2.2 (lemma after Langlands–Shelstad 2.2.A).

Archimedean: ET.1/real-transfer.

**Acceptance.**

- For the principal datum of quasi-split G the identity function transfer is valid.
- For SL_2 and the elliptic torus data, transfer exists for every f, matching κ-orbital integrals with orbital integrals on the torus times transfer factors.

*Needs:* `ET.3/group-fundamental-lemma`; `ET.3/change-of-characteristic`; `ET.1/fourier-transform-orbital-integrals`; `ET.1/shalika-germs`; `ET.1/transfer-factor-properties`; `ET.1/matching-functions`; `ET.1/real-transfer`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

### ET.3.8 Transfer between inner forms of GL_n and quaternionic matching

Node `ET.3/inner-form-transfer` (theorem).

Let F be a local field of characteristic 0, D a central division algebra of degree d over F, n = md and G = GL_m(D), an inner form of G* = GL_n(F) with Kottwitz sign e(G) = (−1)^{n−m}. Regular semisimple γ ∈ G(F) and γ* ∈ G*(F) correspond if they have the same characteristic polynomial (then their centralizers are isomorphic tori); measures on the centralizers are transported. (a) (Deligne–Kazhdan–Vignéras) For every f ∈ C_c^∞(G(F)) there is f* ∈ C_c^∞(G*(F)) with O_{γ*}(f*) = e(G) O_γ(f) when γ* corresponds to γ, and O_{γ*}(f*) = 0 when γ* corresponds to no element of G(F); (b) there is a canonical injection π ↦ π* from tempered irreducible representations of G(F) to those of G*(F) with tr π*(f*) = e(G) tr π(f) (the local Jacquet–Langlands correspondence on characters). For GL_2 and the quaternion algebra D: e(D^×) = −1, the regular semisimple elements of D^× correspond to elliptic elements of GL_2(F), and the matching f ↦ f* uses the common elliptic torus measure; for an unramified place where D splits, the unit element of GL_2(𝒪) corresponds to itself. This is the case s = 1 of ET.3/local-transfer-existence for inner forms, with the transfer factor equal to e(G) on corresponding pairs.

The precise hypotheses are: F local of characteristic 0; G = GL_m(D) an inner form of GL_n.

([J. Arthur, An introduction to the trace formula](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §25, Theorem 25.1 (p. 168)). For an inner form G of GL(n) and any test function f_v, the function f*_v defined by matching orbital integrals with the sign e(G_v) is the orbital-integral image of a function on G*(F_v); a canonical injection of tempered representations with f*_v(π*_v) = e(G_v) f_{v,G}(π_v) (Deligne–Kazhdan–Vignéras).

(a)–(b) Deligne–Kazhdan–Vignéras (not read), as stated by Arthur's Clay introduction Theorem 25.1 (p. 168), proved by a simple trace formula argument.

Transfer factor: for the principal datum of GL_n (s = 1) and an inner form, Δ = e(G) on corresponding pairs (stable = rational conjugacy in GL_m(D) by Hilbert 90 for the centralizer tori), compatible with ET.1/local-transfer-factor and ET.0/kottwitz-sign.

**Acceptance.**

- GL_2 and D^×: e = −1, and for f the characteristic function of 𝒪_D^× a matching f* satisfies O_{γ*}(f*) = −O_γ(f) at every elliptic γ* corresponding to γ ∈ D^× and O_{γ*}(f*) = 0 at split regular γ*.
- m = n (D = F): G = G*, e = 1 and f* = f.

*Used by:* GL2AutomorphicRepresentationsAndTransfer:R17.2/quaternionic-orbital-matching (quaternionic matching with the rank-two sign and common torus measures); ET.6 (part 2) (the local Jacquet–Langlands correspondence on characters).

*Needs:* `ET.3/local-transfer-existence`; `ET.0/kottwitz-sign`; `ET.0/inner-twist`; `ET.1/matching-functions`; `ET.1/real-character-theory`.

### ET.3.9 Stable base change: fundamental lemma, transfer and identity terms

Node `ET.3/base-change-fundamental-lemma-and-transfer` (theorem).

Let E/F be a cyclic extension of local fields of characteristic 0 of degree ℓ with generator θ of Gal(E/F), G_0 a connected reductive group over F, G = R_{E/F}G_0 with the automorphism θ, and H the quasi-split inner form of G_0 (cyclic stable base change, the twisted datum with s = 1 and ω = 1). (a) (Unit elements; Kottwitz) If E/F is unramified, G_0 is unramified and K_E = G_0(𝒪_E), K = G_0(𝒪_F) are hyperspecial with volume 1, then 1_{K_E} and 1_K have matching (twisted stable / stable) orbital integrals: SO_γ(1_K) = SO^θ_δ(1_{K_E}) when γ is a norm of δ, and SO_γ(1_K) = 0 when γ is not a norm. (b) (Spherical Hecke algebra; Clozel, Labesse) More generally, for every f_E ∈ ℋ(G_0(E), K_E) and its base-change image b_{E/F}(f_E) ∈ ℋ(G_0(F), K), the functions f_E and b_{E/F}(f_E) are associated (Labesse Proposition 3.7.3, with the vanishing at non-norms of Proposition 3.7.2). (c) (Transfer) For F nonarchimedean, every f_E ∈ C_c^∞(G_0(E)) has an associated f ∈ C_c^∞(H(F)) (Labesse Théorème 3.3.1, from Waldspurger's inner-form transfer and descent); for F archimedean, K-finite transfer exists (Labesse §3.5). (d) (Identity terms) If f_E and f are associated then ∫_{G_0(E)} f_E = ∫_{H(F)} f for compatible measures (Labesse Lemme 3.2.2). (e) Only the standard Lie-algebra fundamental lemma enters: in Waldspurger's twisted reduction the non-standard triples arising for base change are tautological (Waldspurger 2008, §§1.9 and 4.12 and the corollary for G_0 = U(n) or SL(n), using Laumon–Ngô). This is the finite-place twisted input of the simple twisted unitary trace formula.

The precise hypotheses are: E/F cyclic, characteristic 0; for (a)–(b): E/F unramified, G_0 unramified with hyperspecial subgroups.

([R. E. Kottwitz, Base change for unit elements of Hecke algebras](https://www.numdam.org/item/CM_1986__60_2_237_0.pdf), Introduction (pp. 237–239); §1, Theorem (p. 243); §4 (p. 249)). For unramified E/F the unit elements of the Hecke algebras of G(E) and G(F) have matching stable twisted and stable orbital integrals.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §3.2, Lemme 3.2.2 (p. 76); §3.3, Théorème 3.3.1 (p. 78); §3.5 (pp. 82–87); §3.7, Propositions 3.7.2 and 3.7.3 (pp. 91–92)). Equality of total integrals for associated functions; existence of base-change transfer at nonarchimedean places and K-finite transfer at archimedean places; the base-change fundamental lemma for the spherical Hecke algebra with the vanishing at non-norms.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), Introduction (pp. 3–4); §1.9 (p. 16); §4.12 (p. 53)). In the base-change case the non-standard triples are tautological, so twisted transfer and the twisted fundamental lemma follow from the standard Lie-algebra statements; for G_0 = SL(n) or U(n) they hold by Laumon–Ngô.

([Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), §D.1 (p. 367: association in Labesse's sense); §D.2, Lemma D.2.2 and its proof (p. 369)). Uses the base-change fundamental lemma and local transfer of Labesse for unitary groups (extraction item PAPER-LIU-ETAL-22/base-change-fundamental-lemma).

(a) Kottwitz, 'Base change for unit elements of Hecke algebras' (1986): the norm correspondence γ ↔ δ induces a bijection between classes contributing to the two unit-function orbital integrals, with equal integrals (Theorem of §1, p. 243), for G_der simply connected and in general by an unramified z-extension (§4).

(b) Labesse Propositions 3.7.2–3.7.3 (pp. 91–92), citing Clozel and Labesse 1990 for the compatibility of stable orbital integrals with the norm on the whole Hecke algebra, and correcting the vanishing argument at non-norms (Remarque after 3.7.2).

(c) Labesse Théorème 3.3.1 (p. 78) and §3.5; (d) Lemme 3.2.2 (p. 76) via the Weyl integration formula.

(e) Waldspurger 2008 Introduction (base-change corollaries), §1.9 (p. 16) and §4.12 (p. 53).

**Acceptance.**

- G_0 = GL_1: the norm map E^× → F^× and the statement that 1_{𝒪_E^×} and 1_{𝒪_F^×} match for E/F unramified (the norm maps 𝒪_E^× onto 𝒪_F^×).
- G_0 = GL_n, unit elements: Kottwitz's earlier Lemma 8.8 already gives the matching (cited in his 1986 introduction).

*Used by:* ET.4 (part 2) (finite-place twisted transfer for the simple twisted unitary trace formula); GL2AutomorphicRepresentationsAndTransfer:R17.2/cyclic-local-matching (cyclic base-change matching for GL_2 and the identity-term compatibility).

*Needs:* `ET.0/norm-correspondence`; `ET.1/twisted-transfer-factor`; `ET.1/matching-functions`; `ET.3/group-fundamental-lemma`; `ET.3/local-transfer-existence`; `ET.3/unitary-fundamental-lemma`; `ET.1/real-transfer`; `SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism`.

### ET.3.10 The twisted fundamental lemma and twisted transfer

Node `ET.3/twisted-fundamental-lemma-and-transfer` (theorem).

Let F be a p-adic field of characteristic 0, (G, θ, ω) a twisted triple with θ quasi-semisimple and (H, ℋ, s, ξ) a twisted endoscopic datum with z-pair (ET.0/endoscopic-datum, ET.0/z-pair), with the corrected twisted transfer factors of ET.1/twisted-transfer-factor. (a) (Waldspurger, Théorème 1.8) If, for all data obtained by descent to semisimple centralizers, Lie-algebra transfer holds for the ordinary data and non-standard transfer holds for the non-standard triples, then twisted transfer exists: every f ∈ C_c^∞(G(F)) has a twisted transfer to H_1. (b) (Waldspurger, Théorème 4.11) Under the unramified hypotheses (§4.4, residue characteristic large), if the Lie-algebra fundamental lemma holds for the descended ordinary data and the non-standard fundamental lemma holds for the non-standard triples, then the twisted fundamental lemma holds for unit elements. (c) The hypotheses of (a) and (b) are theorems: the ordinary Lie-algebra fundamental lemma and transfer (ET.3/lie-algebra-fundamental-lemma, ET.3/change-of-characteristic, ET.3/local-transfer-existence) and the non-standard fundamental lemma (ET.3/nonstandard-fundamental-lemma, with the change of characteristic for it); so twisted transfer and the twisted fundamental lemma for unit elements hold. (d) (Lemaire–Mœglin–Waldspurger) The twisted fundamental lemma for the whole spherical Hecke algebra reduces to the unit elements, hence holds. The twisted weighted fundamental lemma is not claimed here.

The precise hypotheses are: F p-adic of characteristic 0; for (b), (d): unramified data and residue characteristic large; the corrected twisted transfer factors.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), Introduction (pp. 1–4); §1.8 (p. 15); §3.11 (p. 41); §4.11 (p. 52); §5.12 (p. 71)). Théorème 1.8: Lie-algebra transfer and non-standard transfer imply twisted transfer; Théorème 4.11: the Lie-algebra fundamental lemma and the non-standard fundamental lemma imply the twisted fundamental lemma for unit elements.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), Introduction (pp. 1–2) and §8.8 (pp. 186–187)). The non-standard fundamental lemma, which together with the ordinary one gives Waldspurger's twisted fundamental lemma.

(a) Waldspurger 2008 §§2–3, Théorème 1.8 (proof §3.11, p. 41): descent of twisted orbital integrals near θ-semisimple elements to Lie algebras of twisted centralizers, decomposition of stable classes (§3.8) and equality of transfer factors (§3.9).

(b) Waldspurger 2008 §§4–5, Théorème 4.11 (proof §5.12, p. 71).

(c) Combine with Ngô (Théorèmes 1 and 2) and Waldspurger's change of characteristic.

(d) Lemaire–Mœglin–Waldspurger, 'Le lemme fondamental pour l'endoscopie tordue : réduction aux éléments unités', arXiv:1506.03383 (Ann. Sci. ÉNS 51 (2018)); not read; recorded through its abstract and the red-team finding RT-AREA-langlands-1/13.

**Acceptance.**

- For θ = 1 (ordinary endoscopy) the non-standard triples are tautological and (b) is ET.3/group-fundamental-lemma (a).
- For G = GL_{2n+1} with θ the transpose-inverse and H = Sp(2n), descent produces the non-standard triple (Sp(2m), SO(2m+1)), so the non-standard fundamental lemma is genuinely used.

*Used by:* ModularityAndLanglandsExtensions:ML.4/trace-formula-inputs-register (the twisted fundamental lemma and twisted transfer as inputs of the stabilization behind Arthur's classification (the twisted weighted fundamental lemma is not supplied)); ET.5 (part 2) (the twisted fundamental lemma is proved, so ET.5's description of it as unproved must be corrected).

*Needs:* `ET.3/nonstandard-fundamental-lemma`; `ET.3/lie-algebra-fundamental-lemma`; `ET.3/change-of-characteristic`; `ET.3/local-transfer-existence`; `ET.1/twisted-transfer-factor`; `ET.0/endoscopic-datum`; `ET.0/z-pair`.

### ET.3.11 The fundamental lemma at almost all places of a global datum

Node `ET.3/fundamental-lemma-almost-all-places` (theorem).

Let F be a number field, G a connected reductive group over F and (H, ℋ, s, ξ) a global endoscopic datum with z-pair, and S a finite set of places containing the archimedean places and the places where G, H or the datum ramify. Then there is a finite set S′ ⊇ S, depending only on G and H (the places of residue characteristic below Waldspurger's bound), such that for every v ∉ S′ the unit element 1_{K_{H,v}} is a transfer of 1_{K_v} with the unramified transfer factors and the spherical Hecke algebras match through b_v (ET.3/group-fundamental-lemma), and similarly for the twisted and base-change data (ET.3/twisted-fundamental-lemma-and-transfer, ET.3/base-change-fundamental-lemma-and-transfer). The global transfer factors are the products of these local ones (ET.1/transfer-factor-properties (f)). In global applications an auxiliary place where G is split may be chosen outside any finite set by Chebotarev's density theorem (upstream Chebotarev roadmap); no statement at the finitely many places of S′ \ S follows from the equal-characteristic theorem by renaming the field.

The precise hypotheses are: F a number field; a global unramified-outside-S endoscopic datum.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.4 (p. 15)). In the global setting the transfer and the fundamental lemma for unit elements are used at all finite places outside a finite set.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §4.4 (p. 48)). The unramified hypotheses, including the bound on the residue characteristic, under which the fundamental lemma is stated.

Apply ET.3/group-fundamental-lemma at each v ∉ S′; the bound on residue characteristics is uniform in v because it depends only on the root data of G and H.

Chebotarev for the auxiliary split place: upstream Chebotarev Layer 10.

**Acceptance.**

- For G = GL_n and H = G, S′ = S and the statement is trivial.
- For unitary similitude groups G_{n⃗} over ℚ attached to a CM field, S′ is finite and contains the primes ramified in the CM field and the primes below Waldspurger's bound.

*Needs:* `ET.3/group-fundamental-lemma`; `ET.3/twisted-fundamental-lemma-and-transfer`; `ET.3/base-change-fundamental-lemma-and-transfer`; `ET.1/transfer-factor-properties`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

## Open inputs

**Primary sources cited through secondary statements.** The following were not read; the nodes use the statements recalled by sources that were read (named in each node): R. Kottwitz, 'Transfer factors for Lie algebras', Represent. Theory 3 (1999) (the AMS copy refused automated access); J.-L. Waldspurger, 'Le lemme fondamental implique le transfert', Compositio Math. 105 (1997); D. Shelstad's papers on real endoscopy (1982 onwards); Harish-Chandra, 'Invariant eigendistributions on a semisimple Lie group', Trans. AMS 119 (1965); Clozel–Delorme (Invent. Math. 1984; Ann. ÉNS 1990); T. Hales, 'On the fundamental lemma for standard endoscopy: reduction to unit elements' (1995); Deligne–Kazhdan–Vignéras (1984); Lemaire–Mœglin–Waldspurger (2018); Langlands–Shelstad, 'Descent for transfer factors' (1990); Kottwitz 1982, 1984, 1990; Kottwitz–Shelstad, Astérisque 255 (1999); Borovoi, Memoirs AMS 626 (1998); Serre, Galois cohomology; Borel–Serre finiteness of local H¹ (Platonov–Rapinchuk Theorem 6.14). A lemma-level pass should read each and replace the secondary locators. (Affects `ET.1/lie-algebra-transfer-factor`; `ET.1/fourier-transform-orbital-integrals`; `ET.1/real-character-theory`; `ET.1/real-transfer`; `ET.1/pseudocoefficients`; `ET.1/archimedean-pseudocoefficient-transfer`; `ET.1/transfer-factor-properties`; `ET.3/local-transfer-existence`; `ET.3/group-fundamental-lemma`; `ET.3/inner-form-transfer`; `ET.3/twisted-fundamental-lemma-and-transfer`; `ET.0/endoscopic-datum`; `ET.0/abelianization-theorems`.)

**Hasse principle for adjoint groups: proof not read.** Item (f) of ET.0/abelianization-theorems (injectivity of H^1(F, G) → ∏_v H^1(F_v, G) for adjoint G over a number field) is used as a known result by Kisin §4.3.1; its proof (Platonov–Rapinchuk, Chapter 6, not among the cleared chapters 1–5) was not read. (Affects `ET.0/abelianization-theorems`.)

**Deligne–Mumford versions of the trace formula and the decomposition theorem.** Ngô applies the Grothendieck–Lefschetz trace formula and the decomposition theorem to the smooth Deligne–Mumford stack M^ani (Proposition 8.1.13, §6.2, Remarque 7.5.1). The atlas suppliers state them for schemes; requests to SchemeAndStackFoundations SF.2 and EtaleDualityAndPerverseSheaves EDC.7 are recorded. Until they are planned, these two inputs are open. (Affects `ET.2b/kappa-decomposition`; `ET.2b/support-theorem`; `ET.2b/hitchin-point-count`.)

**Kottwitz's Tamagawa number formula is planned nowhere.** The stable trace formula of part 2 (ET.4–ET.5) uses Tamagawa numbers through ι(G, H) = τ(G)τ(H)^{-1}|Out(H, s, η)|^{-1} (Shin 2010 §7), and Kottwitz's formula τ(G) = #π_0(Z(Ĝ)^Γ)/#ker^1(F, Z(Ĝ)). AdelicAlgebraicGroups AA.2 defines τ(G) but no layer proves the formula; ET.0 supplies its cohomological ingredients (ET.0/kottwitz-duality). Part 2 or AdelicAlgebraicGroups must plan it. (Affects `ET.4`; `ET.5`.)

**Characteristic hypothesis of the Lie-algebra fundamental lemma.** The roadmap text of ET.3 says Ngô's published Lie statement requires p > 2h. The version read (arXiv:0801.0446v3, Théorème 1, p. 1, and the standing assumption of §1.1, p. 9) assumes only that p does not divide |W|. The published version (Publ. IHÉS 111) was not read; the node states the hypothesis of the version read and keeps Waldspurger's separate large-p bound for the change of characteristic. (Affects `ET.3/lie-algebra-fundamental-lemma`.)

## Corrections to the sources

**A. Caraiani and P. Scholze, On the generic part of the cohomology of local and global Shimura varieties, §5.2, list of representatives of E_ell(G), p. 67 (arXiv:1909.01898v2).** The representatives are given as {(G_{2n}, s_{2n}, η_{2n})} together with (G_{n_1,n_2}, s_{n_1,n_2}, η_{n_1,n_2}) for n_1 + n_2 = 2n with n_1 ≥ n_2 ≥ 0. Correction: The index range should be n_1 ≥ n_2 ≥ 1 (Shin 2011 §3.2 has n_2 > 0). Reason: G_{n⃗} is defined only for vectors n⃗ of positive integers, and n_2 = 0 would repeat the principal datum (G_{2n}, s_{2n}, η_{2n}) already listed. Effect: nothing. Status: new for this paper; the same slip in the compact companion paper is recorded as PAPER-CARAIANI-SCHOLZE-17/E66.

Corrections already recorded by the paper extractions and used here: Kisin (3.2.7)(4) needs the kernel of the crossed module to be central for the abelian group structure (PAPER-KISIN-17/E41); Leslie's Lemma 1.8 means the centralizer in U(V), not U(W) (PAPER-LESLIE-25/E1), and his endoscopic datum is written with η for ξ (PAPER-LESLIE-25/E2).

## Downstream consumers

AutomorphicSpectralTheory AS.6 (unweighted orbital integrals; Euler–Poincaré carriers); BunGAndNewtonStrata BG1 and BG2 (abelianized cohomology, local H¹, crossed modules); GL2AutomorphicRepresentationsAndTransfer R17.2 (transfer-factor conventions, quaternionic and cyclic matching); ModularityAndLanglandsExtensions ML.4 (fundamental lemma, twisted fundamental lemma and transfer as trace-formula inputs); and the layers ET.4–ET.7 of this roadmap (the simple stable and twisted unitary trace formulas and the Igusa stabilization).

## References

- [ngo-2010] Bao Châu Ngô, *Le lemme fondamental pour les algèbres de Lie*. arXiv:0801.0446v3 (2 May 2008), 197 pp., printed page = PDF page from p. 2; published in Publ. Math. IHÉS 111 (2010), 1–169 (the published version was not read; locators are those of v3); read 2026-10-14. <https://arxiv.org/abs/0801.0446v3>
- [ls-1987] R. P. Langlands and D. Shelstad, *On the definition of transfer factors*. Math. Ann. 278 (1987), 219–271; GDZ scan (no text layer), printed page = PDF page + 217; read 2026-10-14. <https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf>
- [kottwitz-1986] R. E. Kottwitz, *Stable trace formula: elliptic singular terms*. Math. Ann. 275 (1986), 365–399; GDZ scan (no text layer), printed page = PDF page + 363; read 2026-10-14. <https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf>
- [kottwitz-1986-bc] R. E. Kottwitz, *Base change for unit elements of Hecke algebras*. Compositio Math. 60 (1986), 237–250; Numdam copy; read 2026-10-14. <https://www.numdam.org/item/CM_1986__60_2_237_0.pdf>
- [ks-2012] R. Kottwitz and D. Shelstad, *On splitting invariants and sign conventions in endoscopic transfer*. arXiv:1201.5658v1 (26 January 2012), 19 pp.; read 2026-10-14. <https://arxiv.org/abs/1201.5658v1>
- [hales-2003] T. C. Hales, *A statement of the fundamental lemma*. arXiv:math/0312227v2 (30 December 2003), 18 pp.; also Clay Math. Proc. 4 (2005), 643–658; PDF page numbers are cited; read 2026-10-14. <https://arxiv.org/abs/math/0312227v2>
- [laumon-ngo] G. Laumon and B. C. Ngô, *Le lemme fondamental pour les groupes unitaires*. arXiv:math/0404454v2 (8 October 2004), 99 pp.; published Ann. of Math. 168 (2008); arXiv page numbers; read 2026-10-14. <https://arxiv.org/abs/math/0404454v2>
- [labesse-1999] J.-P. Labesse, *Cohomologie, stabilisation et changement de base*. Astérisque 257 (1999), vi + 116 pp.; Numdam copy with text layer; printed page = PDF page − 7; read 2026-10-14. <https://www.numdam.org/item/AST_1999__257__R1_0.pdf>
- [waldspurger-2006] J.-L. Waldspurger, *Endoscopie et changement de caractéristique*. Author's preprint (71 pp.) of J. Inst. Math. Jussieu 5 (2006), 423–525; preprint page numbers; read 2026-10-14. <https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopie.pdf>
- [waldspurger-2008] J.-L. Waldspurger, *L'endoscopie tordue n'est pas si tordue : intégrales orbitales*. Author's preprint dated 15 May 2006 (83 pp.) of Mem. Amer. Math. Soc. 194 (2008), no. 908; preprint page numbers; read 2026-10-14. <https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf>
- [kottwitz-clay] R. E. Kottwitz, *Harmonic analysis on reductive p-adic groups and Lie algebras*. In Harmonic Analysis, the Trace Formula, and Shimura Varieties, Clay Math. Proc. 4 (2005), 393–522; Clay Institute copy of the volume; printed page = PDF page − 13; read 2026-10-14. <https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf>
- [arthur-clay] J. Arthur, *An introduction to the trace formula*. In Harmonic Analysis, the Trace Formula, and Shimura Varieties, Clay Math. Proc. 4 (2005), 1–263; same file as kottwitz-clay; read 2026-10-14. <https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf>
- [shin-2011] S. W. Shin, *Galois representations arising from some compact Shimura varieties*. Author's copy (62 pp.) of Ann. of Math. 173 (2011), 1645–1741; author-copy page numbers; read 2026-10-14. <https://math.berkeley.edu/~swshin/StableGal.pdf>
- [shin-2010] S. W. Shin, *A stable trace formula for Igusa varieties*. Author's copy (30 pp.) of J. Inst. Math. Jussieu 9 (2010), 847–895; author-copy page numbers; read 2026-10-14. <https://math.berkeley.edu/~swshin/StableIgusa.pdf>
- [cs-noncompact] A. Caraiani and P. Scholze, *On the generic part of the cohomology of local and global Shimura varieties*. arXiv:1909.01898v2 (22 November 2023), 90 pp.; read 2026-10-14. <https://arxiv.org/abs/1909.01898v2>
- [leslie-2025] S. Leslie, *The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods*. arXiv:1911.07907v3 (13 March 2025), 89 pp.; published Ann. of Math. 201 (2025); read 2026-10-14. <https://arxiv.org/abs/1911.07907v3>
- [kaletha-2016] T. Kaletha, *Rigid inner forms of real and p-adic groups*. arXiv:1304.3292v5 (9 February 2015); published Ann. of Math. 184 (2016), 559–632; arXiv page numbers; read 2026-10-14. <https://arxiv.org/abs/1304.3292v5>
- [kisin-2017] M. Kisin, *Mod p points on Shimura varieties of abelian type*. Author's typeset preprint (99 pp., PDF dated 27 August 2016) of J. Amer. Math. Soc. 30 (2017), 819–914; page numbers of that copy; read 2026-10-14. <https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf>
- [vanhoften-2024] P. van Hoften, *Mod p points on Shimura varieties of parahoric level*. arXiv:2010.10496v4 (3 September 2024); published Forum Math. Pi 12 (2024) (not read); arXiv page numbers; read 2026-10-14. <https://arxiv.org/abs/2010.10496v4>
- [hkw-2022] D. Hansen, T. Kaletha and J. Weinstein, *On the Kottwitz conjecture for local shtuka spaces*. arXiv:1709.06651v4 (17 March 2022); published Forum Math. Pi 10 (2022), e13 (not read); arXiv page numbers; read 2026-10-14. <https://arxiv.org/abs/1709.06651v4>
- [cs-2017] A. Caraiani and P. Scholze, *On the generic part of the cohomology of compact unitary Shimura varieties*. arXiv:1511.02418v1 (8 November 2015); published Ann. of Math. 186 (2017) (not read; the extraction's Annals pages 735, 737–738 correspond to arXiv pp. 74–76); read 2026-10-14. <https://arxiv.org/abs/1511.02418v1>
- [schiffmann-2016] O. Schiffmann, *Indecomposable vector bundles and stable Higgs bundles over smooth projective curves*. arXiv:1406.3839v2 (4 October 2014), no printed page numbers (PDF pages cited); published Ann. of Math. 183 (2016) (not read); read 2026-10-14. <https://arxiv.org/abs/1406.3839v2>
- [yu-2023] H. Yu, *Comptage des systèmes locaux ℓ-adiques sur une courbe*. arXiv:1807.04659v5 (18 July 2022); published Ann. of Math. 197 (2023) (not read); read 2026-10-14. <https://arxiv.org/abs/1807.04659v5>
- [ltxzz-2022] Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu, *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*. Invent. Math. 228 (2022), 107–375, the NSF Public Access Repository copy (printed page = PDF page − 106); read 2026-10-14. <https://par.nsf.gov/servlets/purl/10323568>
