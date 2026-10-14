# Roadmap: endoscopic transfer and unitary trace comparison

**Assembly checkpoint.** ET.4–ET.6 has an independent `needs_changes` verdict. This combined draft carries its corrected targets, including three additions, while the required revision remains outstanding. ET.0–ET.3 and ET.6a–ET.7 retain their separately accepted planning inputs. The foundational and primary-proof obligations below remain open.

**Summary.** Build stable conjugacy and transfer from reductive groups and Galois cohomology; prove the fundamental lemma through the Hitchin fibration; then compare stable, twisted and Igusa trace formulas for unitary groups. The local branch constructs the full Weil–Deligne correspondence for general linear groups and its inner forms, compares the Lubin–Tate and Drinfeld towers, and isolates their actual supercuspidal cohomology. The global branch supplies cyclic base change, automorphic induction, unitary packet transfer and rational alternating Igusa traces. The final exports keep geometric tower duality, equivariant cohomology, pure automorphic transfer and signed virtual trace identities as distinct theorems with explicit normalization comparisons.

## Scope and ownership

ET.0 owns nonabelian and crossed-module Galois cohomology with discrete coefficients, abelianized reductive cohomology, Tate–Nakayama for tori, Kottwitz duality and signs, stable conjugacy and rational classes, inner twists, ordinary and twisted endoscopic data, z-pairs, norms and the unitary examples. ET.1 owns the endoscopic normalization of orbital integrals, κ and stable orbital integrals, a-data and χ-data, transfer factors, Lie-algebra harmonic analysis, real transfer and packet averages of pseudo-coefficients. Group orbital integrals and the general Euler–Poincaré trace identity are imported from the current AutomorphicSpectralTheory package §§6.9 and 6.18–6.19.

ET.2 and ET.2a are import interfaces: perverse sheaves, duality, purity and nearby cycles come from EtaleDualityAndPerverseSheaves, DeligneWeightsAndPurity and LefschetzPencilsAndVanishingCycles. ET.2b owns the Chevalley quotient, regular centralizer, Hitchin moduli, spectral and cameral geometry, Picard action, affine Springer fibres, support theorem and geometric stabilization. GlobalShtukasAndFunctionFieldLanglands owns Bun_G and the geometric affine Grassmannian. ET.3 turns the geometry into Lie-algebra and group fundamental lemmas, change of characteristic and smooth, inner-form, stable base-change and twisted transfer.

ET.4 owns the p-adic and twisted character results needed here, Kottwitz's Tamagawa formula, stable elliptic distributions, unitary base-change groups and transferred test functions, and the simple stable–twisted trace comparison. Its cyclic base-change and automorphic-induction prefix supplies ET.6; the corresponding ET.7a applications consume those same results. The relevant generic unitary classification and GSp_4 transfer retain their stated classification hypotheses. ET.5 owns acceptable functions, fixed-point classification by effective Kottwitz triples, Shin's counting formula and Igusa stabilization, including the J_b transfer at p.

ET.6 owns the GL_n segment calculus, its full Weil–Deligne correspondence, Scholze's deformation-space characterization, local Jacquet–Langlands and Badulescu's signed Grothendieck-group extension. Smooth representations, induction, Jacquet functors, the general Langlands classification and Satake come from SmoothRepresentationsOfLocalGroups; Weil–Deligne carriers and their arithmetic local factors come from ArithmeticGaloisRepresentations and AutomorphicLFunctionsAndLocalFactors. ET.6a imports the finite-level formal-module deformation construction from ET.6, adds the framed tower, its actions and period maps, proves the geometric and equivariant comparisons, and states the actual Dat-normalized supercuspidal sector theorem. The independent conversion to the two Fargues–Scholze Hecke orientations is a further comparison target.

ET.7a owns the pure automorphic applications: Speh data and residual-spectrum classification, unitary transfer and relevant packet multiplicities, changes of signature and transferable levels. It consumes ET.4's cyclic base change and induction rather than constructing a second correspondence. ET.7b describes the rational Igusa trace object whose geometric prefix must move into the earlier ET-owned supplier; it owns Newton reduction and its trace duality, the signed source identity, finite spectral factorization and separation of aggregate unramified Hecke characters. ET.7 assembles coherent exports and normalization checks. Pure transfer does not require Igusa concentration or a Galois realization theorem. Rational alternating traces do not assert positivity or concentration with integral or torsion coefficients.

Existing Tau Ceti roadmaps supply the foundational interfaces: ReductiveGroups and ReductiveGroupsPartII supply reductive structure, z-extensions, the algebraic fundamental group, Kottwitz homomorphisms, dual groups and L-groups; ClassFieldTheory supplies reciprocity, Weil groups and local/global class formations; ProfiniteCohomology supplies continuous abelian cohomology; AdelicAlgebraicGroups supplies quotient and Tamagawa measures and simply connected torsor theorems. AdicSpaces and CompactGroups supply the existing geometric and compact-averaging interfaces. These subjects are imported at their named layers. The concrete Mathlib carriers used in the Suggested file are group actions and quotients, matrices and their characteristic polynomials and traces, polynomial root algebras, power and Laurent series, integer intervals, multisets and finite sums.

The downstream boundaries are precise. The ClassFieldTheory links consume Tate's class-formation criterion, local reciprocity and global reciprocity in ET.0's torus comparison; they do not already assert that comparison for every reductive group. The Chebotarev link supplies auxiliary split places in the global transfer argument, with no quantitative bound claimed. General shtukas and integral EL/PEL comparison remain with HeckeStacksAndLocalShtukas and its integral continuation; ET.6a owns only the basic minuscule classical tower comparison required by their later layers. General PEL representability remains with PELModuli. The early raw compact-unitary and rational Igusa objects must precede the later Galois and torsion-concentration consumers.

The weighted and twisted weighted fundamental lemmas, full rigid-inner-form refinements and unproved primary classification inputs are not supplied by the unweighted transfer theorem. Equal-characteristic Hitchin geometry and mixed-characteristic formal-module towers have different hypotheses. The remaining supplier and proof obligations are stated at the relevant targets and collected after the build.

## Conventions

In ET.0–ET.1, local fields have characteristic zero and global fields are number fields. ET.2b uses a finite field k=𝔽_q, a smooth projective geometrically connected curve X, and equal-characteristic completions k(v)((ε_v)); assume char(k) does not divide the Weyl-group order. Waldspurger's change of characteristic in ET.3 has an additional sufficiently large residue-characteristic hypothesis, which is not discharged by char(k)∤|W|. In ET.6–ET.6a the local field E is a finite extension of Q_p, n≥1, and D/E is the central division algebra of invariant 1/n. In the global unitary calculation F/F⁺ is CM; the Caraiani–Scholze specialization uses F=F⁺F_0 with p split in F_0. Its global rank 2n is fixed separately from a local tower rank.

Galois cohomology H^i(F,G) uses continuous Γ_F-cochains with discrete coefficients G(F̄). Stable conjugacy uses Labesse's stable centralizer I_δ. For δ′=x⁻¹δx, the invariant inv(δ,δ′) is represented by σ↦xσ(x)⁻¹. Nonabelian H¹ is a pointed set; the abelian group structure used for crossed modules requires the specified braiding, not merely an abelian cokernel.

Every transfer factor records its endoscopic datum, reciprocity convention and absolute normalization. The standard factors Δ and Δ_D use respectively the classical and Deligne normalizations; Δ′ and Δ′_D additionally invert s in the datum. A base point or Whittaker datum fixes the absolute normalization. Twisted factors use the corrected Kottwitz–Shelstad convention, and the same convention must be used at every place for the global product formula (Kottwitz–Shelstad, *On splitting invariants and sign conventions in endoscopic transfer*, §5.1). Haar measures on matching centralizers are transported along the prescribed inner twists. Raw orbital integrals O and discriminant-normalized integrals J=|D|^(1/2)O are distinct. In the Lie-algebra fundamental lemma the integral unit functions and the factor q^(−val(D)/2) are fixed explicitly.

Local reciprocity in ET.6 and the tower branch sends a uniformizer to geometric Frobenius. Write |Frob_geom|=q⁻¹ and |Frob_ar|=q. With Λ=Q̄_ℓ, ℓ≠p, Λ(1) has arithmetic Frobenius eigenvalue q and geometric eigenvalue q⁻¹. Fix q^(1/2) in Λ and an isomorphism Λ≅ℂ for the comparison of smooth complex and ℓ-adic representations. Changing the square root changes an odd half twist by the unramified quadratic character (Dat, §2.2.1–§2.2.5, pp. 12–14). All étale statements here use rational coefficients unless explicitly stated otherwise.

Parabolic induction is normalized and ν=|det|. In the special block Sp_k, r(w)e_i=|w|^i e_i and Ne_i=e_(i+1), so r(w)Nr(w)⁻¹=|w|N. The full Weil–Deligne parameter of St_n is |·|^((1−n)/2)⊗Sp_n. Scholze's semisimple σ(π) is rec_un(π)⊗|·|^((1−n)/2). The symbol rec_F denotes the normalized full Weil–Deligne parameter: its semisimplified restriction is σ(π), and it also retains monodromy. Langlands quotients and Zelevinsky subrepresentations remain distinguished by their involution.

Towers use Dat's stated left GL_n(E)×D× action; cohomology uses inverse pullback. The tensor notation H[ρ]=H⊗_Dρ uses the right action v·d=d⁻¹v and selects the multiplicity of ρ∨. Its literal supercuspidal factor is rec(JL(ρ)∨)|·|^((1−n)/2) (Dat, Theorem 4.1.2, pp. 28–29). The Fargues–Scholze source-torsor and perverse normalization uses Λ[n−1]((n−1)/2) and dual Weil factors on the two legs. Passing from Dat's formula to those factors requires the action comparison in ET.6a; Frobenius inversion alone does not define a conversion of a nonabelian Weil representation.

For the SW20 covariant convention over Q_p, the basic datum is in B(G,μ⁻¹): the multiplicative rank-one test has b=p⁻¹ and μ=1. Its Newton sign is negative, while the bundle in 0→T⊗O→E_b→i_*Lie G→0 has positive degree. The Fargues–Scholze O(−1/n) source orientation is related by the separate Hecke-leg conversion. These are conventions for specified functors, not two interchangeable signs for one bundle.

Igusa transfer at p retains the modulus factor δ̄_(P(ν_b))^(1/2) and the prescribed Jacquet and inner-form signs (Shin, *A stable trace formula for Igusa varieties*, §6, (6.8)–(6.10), pp. 21–22). The signed Caraiani–Scholze identity is first proved for acceptable functions with sufficiently small bad-place level. The finite spectral expansion extends by the central Frobenius-twist argument with virtual coefficients; its unsigned span does not determine the source constants (Caraiani–Scholze, noncompact paper, Theorem 5.6.1 and Lemma 5.6.2, pp. 75–76). Balanced proper unitary endoscopy contributes 1/2, distinct from the twisted Levi determinant 2⁻ʳ. For GL_r(D) of total degree n, the inner-form sign is (−1)^(n−r); GL_1 of a quaternion division algebra contributes −1.

## Exact supplier contracts

### From AlgebraicModuliForArithmeticGeometry:R09.4

For a smooth projective curve X over 𝔽_q, a smooth affine group scheme G over X and a line bundle D: (i) for a G-torsor E on X × S, the stack over Bun_G of sections φ ∈ H^0(X × S, ad(E) ⊗ D) (an abelian cone of a coherent sheaf) is algebraic and locally of finite type; (ii) for a smooth commutative group scheme J over X × S, the Picard stack of J-torsors is algebraic and smooth when H^2 vanishes; (iii) the criterion that an algebraic stack of finite type with finite unramified inertia is Deligne–Mumford. These are the stack inputs of the Hitchin moduli stack, its Picard action and the anisotropic DM statement.

This contract is used by `ET.2b/hitchin-moduli-stack`; `ET.2b/regular-centralizer`; `ET.2b/picard-stack-action`; `ET.2b/anisotropic-locus`.

### From SchemeAndStackFoundations:SF.2

The Grothendieck–Lefschetz trace formula over 𝔽_q with Q̄_ℓ coefficients for separated schemes of finite type and its extension to separated Deligne–Mumford stacks of finite type (counting points weighted by 1/#Aut), with compact supports; used to count points of anisotropic Hitchin fibres.

This contract is used by `ET.2b/hitchin-point-count`.

### From EtaleDualityAndPerverseSheaves:EDC.7

The decomposition theorem (BBD 5.4.5) and relative hard Lefschetz for a proper morphism f : M → S from a smooth separated Deligne–Mumford stack of finite type over 𝔽_q to a scheme (in Ngô's application M^ani → A^ani, with M^ani a global quotient by a finite-stabilizer action), stated so that EDC.7/decomposition-theorem and EDC.7/relative-hard-lefschetz-theorem, now stated for schemes, apply; Ngô (Remarque 7.5.1) records that the argument carries over. Also the Chebotarev-type principle: two mixed perverse sheaves on a scheme X_0 of finite type over 𝔽_q whose Frobenius trace functions agree at all closed points of X_0 (and its finite extensions) have isomorphic semisimplifications.

This contract is used by `ET.2b/kappa-decomposition`; `ET.2b/support-theorem`; `ET.2b/endoscopic-comparison`.

### From GlobalShtukasAndFunctionFieldLanglands:GS.1

Only the geometric prefix of GS.1, without Satake: the fibre of the Beilinson–Drinfeld Grassmannian at a closed point v of X is the affine Grassmannian Gr_v = G(F_v)/G(𝒪_v) as an ind-projective ind-scheme over k(v), with its G(𝒪_v)-action and the closed sub-ind-schemes cut out by integrality conditions; ET.2b builds affine Springer fibres inside it.

This contract is used by `ET.2b/affine-springer-fibre`.

### From AutomorphicSpectralTheory:AS.6

The unweighted invariant orbital integral of a semisimple element of a connected reductive group over a local field of characteristic 0 (or a finite product of such): the quotient measure on G_γ^0\G, convergence, invariance, linearity in the measures and the full-centralizer factor [G_γ : G_γ^0] (target AS.6.9 of the AutomorphicSpectralTheory package); and, for real groups, the Clozel–Delorme pseudo-coefficients of discrete series and the Euler–Poincaré test functions with tr π(f_ξ) = Σ_i (−1)^i dim H^i(𝔤, K; π ⊗ ξ) for every finite-length π (targets AS.6.18–AS.6.19). ET.1 imports them and keeps the Lie-algebra, descent, packet-average, inner-form and twisted statements.

This contract is used by `ET.1/orbital-integral`; `ET.1/pseudocoefficients`.

### From tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation

The Lie algebra 𝔤 of a reductive group scheme with its adjoint representation; used for orbital integrals on 𝔤(F), Shalika germs, the Chevalley quotient and the Kostant section. Centralizers and the regular and regular semisimple loci are not in this layer; they are defined in ET.0/semisimple-conjugacy and ET.2b/chevalley-quotient.

This contract is used by `ET.0/semisimple-conjugacy`; `ET.1/orbital-integral`; `ET.1/shalika-germs`; `ET.2b/chevalley-quotient`; `ET.2b/kostant-section`.

### From tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori

Tori, their character and cocharacter modules with Galois action, the Jordan decomposition and centralizers of semisimple elements; used for stable centralizers, Tate–Nakayama and the regular centralizer.

This contract is used by `ET.0/abelianized-cohomology`; `ET.0/tate-nakayama-tori`; `ET.0/semisimple-conjugacy`; `ET.2b/regular-centralizer`.

### From tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups

Reductive and semisimple groups with the simply connected cover of the derived group and central isogenies; used for the crossed module [G_sc → G] and abelianized cohomology.

This contract is used by `ET.0/abelianized-cohomology`; `ET.0/semisimple-conjugacy`.

### From tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory

Maximal tori, Borel pairs, root data with Galois action, Weyl groups, quasi-split groups and pinnings; used throughout for stable conjugacy, endoscopic data, a-data and χ-data and the Chevalley quotient.

This contract is used by `ET.0/abelianized-cohomology`; `ET.0/abelianization-theorems`; `ET.0/kottwitz-sign`; `ET.0/inner-twist`; `ET.0/semisimple-conjugacy`; `ET.0/endoscopic-datum`; `ET.0/norm-correspondence`; `ET.1/orbital-integral`; `ET.1/a-data-chi-data`; `ET.2b/chevalley-quotient`; `ET.2b/regular-centralizer`.

Maximal tori, Levi subgroups and anisotropic tori of connected reductive groups over ℚ and ℝ, used to define cuspidal groups.

This contract is used by `ET.4/cuspidal-levi-subsets`.

### From tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ

Pinned split reductive groups over ℤ and their automorphisms preserving a pinning; used for quasi-split forms, the Kostant section (regular nilpotent from a pinning) and Out-torsors over a curve.

This contract is used by `ET.0/inner-twist`; `ET.2b/chevalley-quotient`; `ET.2b/kostant-section`.

### From tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences

Long exact sequences of continuous cohomology of profinite groups; used for crossed-module cohomology (abelian coefficients; the nonabelian and crossed-module statements are planned in ET.0/crossed-module-galois-cohomology).

This contract is used by `ET.0/crossed-module-galois-cohomology`.

### From tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory

Hilbert 90 for split tori and Galois cohomology of field extensions; used for Tate–Nakayama, z-pairs and transfer of tori.

This contract is used by `ET.0/tate-nakayama-tori`; `ET.0/inner-twist`; `ET.0/z-pair`.

### From tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees

Continuous cohomology of profinite groups in all degrees with discrete coefficients; used for Galois cohomology of tori and crossed modules (abelian coefficients; the nonabelian and crossed-module statements are planned in ET.0/crossed-module-galois-cohomology).

This contract is used by `ET.0/crossed-module-galois-cohomology`; `ET.0/abelianized-cohomology`.

### From tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-12-the-graded-cup-product-in-all-degrees

Cup products in all degrees and the projection formula; used for the Tate–Nakayama isomorphisms.

This contract is used by `ET.0/tate-nakayama-tori`.

### From tauceti:TauCetiRoadmap/ClassFieldTheory#layer-3-tates-theorem-for-a-class-formation

Tate's theorem (cup product with the fundamental class is an isomorphism Ĥ^r(Γ, ℤ) → Ĥ^{r+2}(Γ, C)) with the scaled inflation formula; ET.0 applies the Nakayama generalization to the cocharacter module of a torus.

This contract is used by `ET.0/tate-nakayama-tori`.

### From tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity

The local class formation and fundamental class; used for local Tate–Nakayama for tori.

This contract is used by `ET.0/tate-nakayama-tori`.

### From tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors

The local Artin map with its pinned normalization (arithmetic versus geometric Frobenius); transfer factors record which normalization is in force (Kottwitz–Shelstad 2012).

This contract is used by `ET.1/a-data-chi-data`; `ET.1/local-transfer-factor`; `ET.1/twisted-transfer-factor`.

Import the existing arithmetic-Frobenius reciprocity isomorphism. Define Art_geo(x)=Art_arith(x⁻¹) in W_F^ab and verify the convention used by rank-one LLC. Do not ask the upstream roadmap to replan an already existing geometric-normalized carrier.

This contract is used by `ET.6/llc-characterizing-properties`.

### From tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group

The local Weil group W_F, used for L-groups, endoscopic data and the cocycle a_ω.

This contract is used by `ET.0/endoscopic-datum`; `ET.1/local-transfer-factor`.

The local Weil group W_F with its topology, inertia, the degree map to ℤ and the norm |·| : W_F → ℝ_{>0}, as the carrier of Weil–Deligne parameters.

This contract is used by `ET.6/segment-wd-parameter`; `ET.6/llc-characterizing-properties`.

### From tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants

Global carriers and the sum-of-local-invariants formula; used for global Tate–Nakayama and ker^1 duality.

This contract is used by `ET.0/tate-nakayama-tori`.

### From tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity

The global class formation, idele class groups and global reciprocity; used for global Tate–Nakayama, global χ-data and the character ϖ of the unitary L-morphisms.

This contract is used by `ET.0/tate-nakayama-tori`; `ET.0/unitary-elliptic-endoscopic-data`; `ET.1/a-data-chi-data`; `ET.1/transfer-factor-properties`.

Global class field theory for cyclic extensions: the character ω of 𝔸_F^×/F^×N(𝔸_E^×) attached to a cyclic extension E/F.

This contract is used by `ET.4/global-cyclic-base-change`.

### From tauceti:TauCetiRoadmap/GlobalNumberFields#layer-0-places-completions-and-the-product-formula

Places, completions and the product formula; used for the global product formula for transfer factors.

This contract is used by `ET.1/transfer-factor-properties`.

### From tauceti:TauCetiRoadmap/GlobalNumberFields#layer-5-full-adeles-and-the-additive-quotient

Adeles of number fields; used for adelic abelianized cohomology.

This contract is used by `ET.0/abelianized-cohomology`.

### From tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch

Riemann–Roch on a smooth projective curve; used for the dimension of the Hitchin base, Schiffmann's boundedness and the δ-codimension estimate.

This contract is used by `ET.2b/hitchin-moduli-stack`; `ET.2b/schiffmann-boundedness`; `ET.2b/delta-stratification`; `ET.3/lie-algebra-fundamental-lemma`.

### From tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts

The dictionary between function fields and smooth projective curves over finite fields; used for the global curve of the Hitchin fibration.

This contract is used by `ET.2b/hitchin-moduli-stack`.

### From tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev

Chebotarev density for number fields (Dirichlet density); used to choose auxiliary split places (Waldspurger's global argument and the global applications of the fundamental lemma) and in ET.0/abelianization-theorems. The layer is stated for number fields only; the comparison of Frobenius traces in the geometric stabilization is a function-field statement, requested from EtaleDualityAndPerverseSheaves:EDC.7.

This contract is used by `ET.0/abelianization-theorems`; `ET.3/local-transfer-existence`; `ET.3/fundamental-lemma-almost-all-places`.

### From FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2

Deformation theory of p-divisible groups with O-action over complete local rings with perfect residue field (Grothendieck–Messing or Dieudonné-theoretic form), in the generality of one-dimensional ϖ-divisible O-modules of height n and of D-groups, as used for R_β and for the D-groups of Scholze 2010 §§2, 4 and 7.

This contract is used by `ET.6/drinfeld-level-deformation-spaces`; `ET.6/norm-maps-and-base-change-identities`.

Add an early local p-divisible/formal-module supplier after Dieudonné theory: deformation representability with full Drinfeld levels for one-dimensional formal O_E modules and special O_D modules; SW13 5.1.4, 5.1.6 and 5.2.1 with Hodge–Tate subspace and vector-bundle exact sequence, including the SW20 covariant conversion and O_E-linear specialization. This is an explicit scope-extension request, not a claim that R07.2 already has those local results. Move the local classification out of T2 and assign its FF bundle prerequisites below this supplier. The supplier must extend the Dieudonné interface with these local moduli and classification results. A Part II or an earlier dedicated interface must own this extension.

This contract is used by `ET.6a/lubin-tate-tower`; `ET.6a/drinfeld-tower`; `ET.6a/infinite-level-moduli`; `ET.6a/basic-modification-functor`; `ET.7b/rational-igusa-object`.

### From ClassicalAdicEtaleCohomology:H1:formal-adic-comparison

Berkovich's nearby cycles for formal schemes locally of finite type over a complete discrete valuation ring and their comparison with algebraic nearby cycles (used for R_β,m and for the Lubin–Tate tower, Scholze 2010 Theorems 2.5 and 11.1).

This contract is used by `ET.6/drinfeld-level-deformation-spaces`; `ET.6/lubin-tate-comparison`.

Comparison of formal-model generic-fibre nearby cycles with analytic cohomology on finite tower/compact-unitary levels, including pullback, proper trace and Weil descent. Do not use the higher Galois compatibility theorem.

This contract is used by `ET.6a/equivariant-cohomology-comparison`; `ET.6a/raw-compact-unitary-cohomology`.

### From LefschetzPencilsAndVanishingCycles:LPV.6

Nearby cycles of schemes over a henselian discrete valuation ring with constructible ℓ-adic coefficients, compatibility with proper pushforward and with completion at closed points (Scholze 2010 Lemmas 9.1–9.2).

This contract is used by `ET.6/drinfeld-level-deformation-spaces`; `ET.6/division-algebra-shimura-varieties`; `ET.5/igusa-fixed-point-formula`.

Nearby-cycle functors and the perverse/spectral-sequence formalism on the actual compact unitary integral model with stratum restriction, coefficient local systems and inertia. No Harris–Taylor stratum calculation is assumed to be contained in this general supplier.

This contract is used by `ET.6a/raw-compact-unitary-cohomology`; `ET.6a/unitary-nearby-cycle-decomposition`.

### From EtaleDualityAndPerverseSheaves:EDC.5

The scheme perverse/recollement interface formerly imported through ET.2a:duality-perversity, as the coefficient framework for the Igusa correspondences.

This contract is used by `ET.5/igusa-fixed-point-formula`.

### From EtaleDualityAndPerverseSheaves:EDC.6

Coefficient realization of the duality operations formerly imported through ET.2a:duality-perversity.

This contract is used by `ET.5/igusa-fixed-point-formula`.

### From SmoothRepresentationsOfLocalGroups:SR.5

A precise multiplicity-one GL_n(O)-newvector/type statement for supercuspidals, used by Scholze Corollary 11.5 p. 30; the current mirabolic-derivative definition alone does not supply it.

This contract is used by `ET.6/lubin-tate-comparison`.

### From AutomorphicLFunctionsAndLocalFactors:AL.3

An essentially-square-integrable segment-pair L/ε formula with monodromy and conductor correction, and its Langlands-block extension to the chosen nongeneric convention; current rs-local-factor is generic only.

This contract is used by `ET.6/full-wd-local-langlands`.

### From PerfectoidSpaces:P5

Finite-level étale-object descent, the tilde-limit topology and completed affinoid colimit, with compatible descent of compact supports through cofinal levels. Supply the topos-level statement required for equivariant tower cohomology; a space limit alone is insufficient.

This contract is used by `ET.6a/perfectoid-limit`; `ET.6a/equivariant-cohomology-comparison`; `ET.6a/stein-mittag-leffler`.

### From DiamondsAndVStacks:D6

The diamond associated to a classical analytic adic space, full faithfulness and compatibility with the marked untilt and group actions for the classical tower-fibre comparison.

This contract is used by `ET.6a/basic-modification-functor`; `ET.6a/stein-mittag-leffler`.

### From DiamondSixOperations:S2

Non-quasicompact compactifiable proper-support pushforward and finite étale pullback/trace in all required dimensions n−1, plus the analytic comparison of support functors. The classical H3 curve theory alone is inadequate for n>2.

This contract is used by `ET.6a/tower-compact-support`; `ET.7b/rational-igusa-object`.

### From AdicCoefficientsAndComparisons:L0

At a fixed finite level, adic coefficient complexes as derived inverse limits over ell^r, derived reduction and scalar extension, followed by the separate smooth level colimit; no unproved interchange of these limits.

This contract is used by `ET.6a/tower-compact-support`; `ET.7b/rational-igusa-object`.

### From SmoothRepresentationsOfLocalGroups:SR.0

Smooth group representations over Λ, equivariant derived complexes with additional abstract W_E action, exact characteristic-zero compact-mod-centre sector extraction, tensor/Hom dual convention, and compatible level colimits.

This contract is used by `ET.6a/tower-compact-support`; `ET.6a/central-quotient-sector`.

### From SmoothRepresentationsOfLocalGroups:SR.2

Normalized opposite-parabolic Jacquet functors, normalized induction and trace duality with constant terms, including additivity on Grothendieck groups.

This contract is used by `ET.7b/newton-reduction`.

### From LocallyAnalyticDistributions:L0

Locally analytic vectors in the rank-two tower affinoid function spaces, their analytic-radius topology and continuous Lie-algebra differentiation. Pan22’s explicit local-series and Higgs compatibility input must be assigned once within this lower analytic direction.

This contract is used by `ET.6a/gross-hopkins-vector-fields`; `ET.6a/analytic-vectors-under-duality`.

### From AutomorphicFormsOnReductiveGroups:AF.2

Cuspidal automorphic representations with unitary central character, normalized restricted tensor products and square integrability modulo the centre.

This contract is used by `ET.7a/speh-representation`.

### From AutomorphicFormsOnReductiveGroups:AF.5

For the standard definite unitary datum: identification of the degree-zero cohomology of the Shimura sets with algebraic automorphic forms on the compact-at-infinity unitary group (functions on finite adelic double cosets), compatibly with Hecke operators and with the decomposition into automorphic representations with trivial infinity component. This is the definite case of the oldform count; it is not integral or Igusa concentration.

This contract is used by `ET.7a/oldform-dimensions`.

### From AutomorphicFormsOnReductiveGroups:AF.4

Cohomological representations of the real unitary group U(N−1,1)×U(N)^(d−1) and the (g,K)-cohomology (Matsushima) description of the Π-eigenspace of the cohomology of the standard indefinite unitary Shimura variety for relevant Π: every contributing π is cuspidal and tempered, contributes only in degree N−1, and each of the N discrete series with Harish-Chandra parameter {(1−N)/2,…,(N−1)/2} contributes one dimension. Characteristic zero only; not integral or Igusa concentration.

This contract is used by `ET.7a/oldform-dimensions`.

### From AutomorphicSpectralTheory:AS.4

The discrete and continuous automorphic spectral decomposition with fixed unitary central character, normalized Langlands quotients, meromorphic normalized Eisenstein intertwiners, their Rankin–Selberg factors and residue calculus. These are inputs to the MW target here; the residual Speh classification in this part supplies the resulting GL discrete data.

This contract is used by `ET.7a/speh-representation`.

## How to read the build

ET.0 supplies the cohomological and conjugacy foundation. ET.1's local analysis and ET.2b's Hitchin geometry are parallel branches that meet in ET.3's fundamental lemma and transfer. ET.4 builds stable and twisted trace formulas and the cyclic transfer prefix needed before ET.6. ET.5's Igusa stabilization and ET.6's local correspondence are then separate branches. ET.6a adds geometric towers, equivariant cohomology and actual supercuspidal realization; ET.7a consumes the earlier pure transfer and spectral inputs; ET.7b combines the early rational Igusa object with stabilization and pure spectral results. ET.7 compares the exports through worked normalization checks.

Each subsection states a mathematical target, the exact assumptions, its source locator and proof route, and the interfaces consumed by later targets. Definitions retain their named API and discriminating Checks. The assembled Suggested file, withheld until the reviewed-input blocker is resolved, will record only the light signatures expressible over existing carriers in the namespace `TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison`; intended future `TauCeti` names in the prose are APIs to implement, not assertions that those declarations already exist. The finite models retain the distinctions between abstract cocycles and continuous cohomology, segment combinatorics and representations, and finite signed sums and automorphic traces.

The ordering of shared interfaces is substantive. The cyclic correspondences described in ET.4 are the suppliers of the ET.7a applications. The finite deformation spaces described in ET.6 are the suppliers of the ET.6a framed tower; the tower adds quasi-isogeny components and actions. The rational Igusa construction described in ET.7b must be available as an early ET.5a interface before ET.5's fixed-point theorem. The local formal-module classification likewise needs an early finite-flat supplier. The independent ET.4 review requires the algebraic and Igusa prefix to be planned in ET at its current tier. These requirements remain explicit ownership obligations until their suppliers provide the stated interfaces; later concentration or Galois realization results cannot be substituted as prerequisites.

## Layer ET.0: Stable conjugacy and endoscopic data

The first group of targets is cohomological: crossed-module cohomology, its abelianization for reductive groups, and the comparisons that make H¹ computable locally (Kneser, Kottwitz) and globally (Hasse principle, abelianization square, ker¹ duality). The second group is the conjugacy theory: stable conjugacy, the torsor of rational classes inside a stable class, inner twists and the global obstruction. The third group is endoscopy proper: endoscopic and twisted endoscopic data, z-pairs, images and norms, and the explicit unitary cases.

<a id="et-0-crossed-module-galois-cohomology"></a>

### ET.0.1 Galois cohomology with coefficients in a crossed module

Let Γ be a profinite group and ∂ : H̃ → H a crossed module of discrete groups (H acting on H̃ by automorphisms, ∂(h·x) = h ∂(x) h⁻¹ and ∂(x)·y = x y x⁻¹) on which Γ acts continuously and compatibly (σ(h·x) = σ(h)·σ(x), ∂∘σ = σ∘∂). Define pointed sets H^{-1}(Γ, H̃→H) = ker(∂)^Γ, H^0(Γ, H̃→H) and H^1(Γ, H̃→H) as the cohomology of the crossed module in the sense of Borovoi (equivalently of the two-term complex with H̃ in degree −1 and H in degree 0): a 0-cocycle is a pair (h, u) with h ∈ H and u : Γ → H̃ continuous with ∂(u_σ) = h⁻¹σ(h) and u_{στ} = u_σ·σ(u_τ) twisted by h; a 1-cocycle is a pair (u, h) with u : Γ×Γ → H̃ and h : Γ → H continuous satisfying the crossed-module cocycle identities; coboundaries are given by the actions of H and of maps Γ → H̃. For a crossed module 𝓗̃ → 𝓗 of smooth affine group schemes over a field F of characteristic 0, H^i(F, 𝓗̃→𝓗) := H^i(Γ_F, 𝓗̃(F̄) → 𝓗(F̄)) for i = −1, 0, 1. The case H̃ = 1 is nonabelian Galois cohomology, planned here: H^0(Γ, H) = H^Γ and H^1(Γ, H) the pointed set of continuous 1-cocycles a (a_{στ} = a_σ σ(a_τ)) modulo a ~ b iff b_σ = c⁻¹ a_σ σ(c), functorial in Γ (inflation, restriction) and in H, with twisting (for a cocycle a, the twisted group _aH and the bijection H^1(Γ, _aH) → H^1(Γ, H), b ↦ ba) and, for a normal subgroup H′ ⊆ H, the exact sequence of pointed sets up to H^1(H/H′) whose fibres over H^1(H/H′) are orbits of (H/H′)^Γ. They satisfy: (1) H^i(Γ, 1→H) = H^i(Γ, H) for i = 0, 1; (2) a morphism of crossed modules inducing isomorphisms on ker ∂ and on coker ∂ induces bijections on H^{-1}, H^0, H^1 (quasi-isomorphism invariance); (3) for H̃ ⊆ H a normal subgroup with ∂ the inclusion, H^i(Γ, H̃→H) = H^i(Γ, H/H̃) for i = 0, 1; (4) there is an exact sequence of pointed sets H^{-1}(H̃→H) → H^0(H̃) → H^0(H) → H^0(H̃→H) → H^1(H̃) → H^1(H) → H^1(H̃→H), with the usual meaning of exactness at the nonabelian terms; (5) if the crossed module is braided, for instance quasi-isomorphic compatibly with Γ to a two-term complex of commutative groups (as [G_sc → G] and [Z(G_sc) → Z(G)] are for G connected reductive, by Borovoi), the pointed sets H^0 and H^1 carry a canonical abelian group structure, functorial for morphisms of such crossed modules. The kernel of a crossed module is always central in H̃, and an abelian cokernel does not suffice: for ∂ = 1 : ℤ/3 → ℤ/2 with ℤ/2 acting by inversion and Γ = ℤ/3 acting trivially, H^0 ≅ ℤ/3 ⋊ ℤ/2 is nonabelian.

The precise hypotheses are: Γ profinite acting continuously on discrete groups; the action is compatible with the crossed-module structure.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §1.1–1.2, Définition 1.1.1, Lemme 1.2.1, Proposition 1.2.2, pp. 9–20). Labesse defines crossed sets and crossed modules with a Γ-action, their 0- and 1-cohomology, and proves that a quasi-isomorphism of crossed sets induces an isomorphism in cohomology (Proposition 1.2.2).

([M. Kisin, Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf), §3.2.7, items (1)–(2) p. 41 and (3)–(4) p. 42). Kisin recalls Borovoi's pointed sets H^i(Δ, H̃→H) for i = −1, 0, 1 with the four listed properties, which this node states.

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5, §3.4 (pp. 15–16): H¹_sc(Γ, G) ≅ H¹(Γ, G_sc → G)). Kaletha identifies the quotient H¹_sc(Γ, G) of H¹(Γ, G), formed with the equivalence coming from G_sc, with the cohomology of the crossed module G_sc → G in degrees −1 and 0.

Define the cocycle and coboundary relations as in Labesse §1.2 (crossed sets) or Borovoi §3 (summarised in Kisin (3.2.7)); the relations are equivalence relations by direct computation (Labesse Lemme 1.2.1).

Item (1) and nonabelian H^1: with H̃ = 1 the definitions collapse to Γ-invariants and to nonabelian H^1 (Labesse §1.3; Serre's twisting argument). AnabelianGeometryAndNonabelianChabauty:NC.3/nonabelian-h1 plans the same object for topological groups, but NC.3 is in a higher upstream tier and lies downstream of this stage in the atlas, so the notion moves down: it is planned here and the restructure proposal has NC.3 import it.

Item (2): a quasi-isomorphism of crossed modules induces a bijection on cohomology (Labesse Proposition 1.2.2), by comparing cocycles through the long exact sequence and the five lemma for pointed sets with group actions.

Item (4): the connecting maps are constructed exactly as for a short exact sequence of groups; exactness is checked on cocycles (Kisin (3.2.7)(3), Borovoi Corollary 3.4.3).

Item (5): the braiding gives a symmetric product on cocycles; for [G_sc → G], Borovoi's group law is transported through the quasi-isomorphism to the two-term complex of tori (ET.0/abelianized-cohomology). Kisin's (3.2.7)(4) asserts an abelian structure whenever the cokernel is abelian; the braiding correction below corrects it to braided crossed modules, and every crossed module this roadmap uses is braided.

The definition exposes the following operations and relations.

- `TauCeti.NonabelianH1` (data): H^1(Γ, H) for a profinite Γ acting continuously on a discrete group H: continuous cocycles modulo twisted conjugation, a pointed set.
- `TauCeti.NonabelianH1.twist` (equivalence): For a cocycle a, the bijection H^1(Γ, _aH) → H^1(Γ, H), b ↦ ba, sending the base point to [a].
- `TauCeti.NonabelianH1.exact_of_normal` (relation): For H′ ⊆ H normal, exactness of H′^Γ → H^Γ → (H/H′)^Γ → H^1(H′) → H^1(H) → H^1(H/H′), with fibres described by the action of (H/H′)^Γ.
- `TauCeti.CrossedModuleCohomology.H` (data): H^i(Γ, H̃ → H) for i ∈ {−1, 0, 1}, a pointed set, with base point the class of the identity.
- `TauCeti.CrossedModuleCohomology.map` (functoriality): A Γ-equivariant morphism of crossed modules induces maps on H^i, compatible with identities and composition.
- `TauCeti.CrossedModuleCohomology.bijective_of_quasiIso` (characterisation): A morphism inducing isomorphisms on ker ∂ and coker ∂ induces bijections on H^{-1}, H^0, H^1.
- `TauCeti.CrossedModuleCohomology.exact_sequence` (relation): The seven-term exact sequence H^{-1}(H̃→H) → H^0(H̃) → H^0(H) → H^0(H̃→H) → H^1(H̃) → H^1(H) → H^1(H̃→H) of pointed sets.
- `TauCeti.CrossedModuleCohomology.ofNormal` (equivalence): For a normal subgroup H̃ ⊆ H, H^i(Γ, H̃ → H) ≅ H^i(Γ, H/H̃), i = 0, 1.
- `TauCeti.CrossedModuleCohomology.instCommGroup` (instance): For a braided crossed module (in particular [G_sc → G] with G connected reductive), H^0 and H^1 are abelian groups and the maps of the exact sequence from H^0(H) onwards are compatible with these structures where both sides are groups.
- `TauCeti.CrossedModuleCohomology.inflation` (functoriality): Inflation and restriction along continuous homomorphisms of profinite groups, compatible with the exact sequence.

**Checks.**

- `CrossedModuleCohomology.h1_trivial_source` (degenerate): For H̃ = 1, H^1(Γ, 1 → H) is the nonabelian H^1(Γ, H), and H^0(Γ, 1 → H) = H^Γ.
- `CrossedModuleCohomology.h0_inclusion` (computation): For H̃ = H with ∂ = id, all three groups H^{-1}, H^0, H^1 are trivial (the crossed module is quasi-isomorphic to 1 → 1).
- `CrossedModuleCohomology.sl2_gl2` (compatibility): For [SL_2 → GL_2] over a field F of characteristic 0, H^0(F, SL_2 → GL_2) ≅ F^× through the determinant, and H^1(F, SL_2 → GL_2) = 0 by Hilbert 90.
- `CrossedModuleCohomology.not_kernel_only` (non-example): For the crossed module [μ_2 → 1] over ℝ (kernel μ_2 in degree −1), H^0 = H^1(ℝ, μ_2) = ℤ/2, so H^0 of a crossed module is not the H^0 of its cokernel when the kernel is nontrivial.
- `CrossedModuleCohomology.not_abelian_without_braiding` (non-example): For ∂ = 1 : ℤ/3 → ℤ/2 with ℤ/2 acting on ℤ/3 by inversion and Γ = ℤ/3 acting trivially, ker ∂ is central and coker ∂ is abelian, yet H^0(Γ, ℤ/3 → ℤ/2) ≅ ℤ/3 ⋊ ℤ/2 ≅ S_3 is nonabelian (the braiding correction): item (5) needs the braiding.

**Acceptance.**

- With H̃ = 1 the construction reproduces the nonabelian H^0 and H^1 of AnabelianGeometryAndNonabelianChabauty:NC.3.
- For [SL_2 → GL_2] over a characteristic-0 field, H^0 ≅ F^× via the determinant and H^1 = 0.
- The seven-term sequence is exact for [G_sc → G] with G = PGL_2 over ℝ.

*Used by:* Kisin, §§3.2.7, 4.4 (the abelianized cohomology and the real-trivial kernels Sha∞ are crossed-module cohomology groups); BunGAndNewtonStrata:BG1/abelianized-kottwitz-set (B_ab(G) is the Weil-group cohomology of [G_sc → G]); ET.0/abelianized-cohomology (abelianized reductive cohomology is the case [G_sc → G]).

*Needs:* `SchemeAndStackFoundations:SF.1/crossed-module-category`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees`; `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`.

<a id="et-0-abelianized-cohomology"></a>

### ET.0.2 Abelianized Galois cohomology of a connected reductive group ★

Let F be a field of characteristic 0 and G a connected reductive group over F, ρ : G_sc → G_der ⊆ G the simply connected cover of its derived group, T ⊆ G a maximal torus, T_sc = ρ⁻¹(T), Z = Z(G) and Z_sc = Z(G_sc). The crossed module [G_sc → G] (G acting on G_sc by conjugation through the isogeny) is quasi-isomorphic to the complexes of tori and groups of multiplicative type [T_sc → T] and [Z_sc → Z] (in degrees −1 and 0). Define H^i_ab(F, G) := H^i(F, G_sc → G) for i = 0, 1, an abelian group by ET.0/crossed-module-galois-cohomology (5), canonically isomorphic to the hypercohomology H^i(F, T_sc → T) and to H^i(F, Z_sc → Z); these identifications are independent of T and functorial in G for normal homomorphisms. The abelianization maps are ab^0 : G(F) = H^0(F, G) → H^0_ab(F, G) and ab^1 : H^1(F, G) → H^1_ab(F, G), induced by [1 → G] → [G_sc → G]; they fit into the exact sequence G_sc(F) → G(F) → H^0_ab(F, G) → H^1(F, G_sc) → H^1(F, G) → H^1_ab(F, G). For an inner form G′ of G, H^i_ab(F, G′) = H^i_ab(F, G) canonically (the centre complex does not change). For a global field F, the adelic groups H^i_ab(𝔸_F, G) are the restricted products of the local ones, and H^1_ab(𝔸_F/F, G) is the global-mod-local abelianized cohomology of Labesse §1.6, defined through the quasi-toric crossed set attached to [G_sc → G] with adelic-modulo-rational coefficients (for a torus T it is Kottwitz's H^1(𝔸_F/F, T) of ET.0/tate-nakayama-tori (b)); the sequence ker^1(F, G) → H^1(F, G) → H^1(𝔸_F, G) → H^1_ab(𝔸_F/F, G) is exact (Labesse Proposition 1.6.12). It receives the cokernel of the localization H^1_ab(F, G) → H^1_ab(𝔸_F, G) but differs from it in general (for a torus T by ker^2(F, T)).

The precise hypotheses are: F of characteristic 0; G connected reductive (Labesse also allows quasi-connected groups: kernels of a surjection from a connected reductive group onto a torus).

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §1.6, Lemmes 1.6.1–1.6.3 and Proposition 1.6.8, pp. 28–33; the definition of H^i_ab(𝔸_F/F, G) after Corollaire 1.6.11 (p. 34) and Proposition 1.6.12 (p. 35)). Labesse defines the abelianized cohomology of a (quasi-)connected reductive group through the crossed module G_sc → G, proves its invariance under inner forms and the quasi-isomorphism with torus complexes, including the adelic version, and the exact sequence ker^1(F, G) → H^1(F, G) → H^1(𝔸_F, G) → H^1_ab(𝔸_F/F, G) (Proposition 1.6.12).

([M. Kisin, Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf), §3.2.7, items (1)–(4), pp. 41–42). Borovoi's cohomology of crossed modules, which Kisin applies to [G̃ → G] for reductive G; the quasi-isomorphisms with [T_sc → T] and [Z_sc → Z] are Borovoi's and Labesse's, not restated in Kisin §3.2.7.

([P. van Hoften, Mod p points on Shimura varieties of parahoric level](https://arxiv.org/abs/2010.10496v4), arXiv v4, §§4.3.12–4.3.15, pp. 56–58). Uses H^0_ab(ℚ, G) = H^0(ℚ, Z(G_sc) → Z(G)) and the map ab^0, with the crossed-module comparison.

Quasi-isomorphism: T_sc → T and Z_sc → Z map to G_sc → G with the same kernel (the finite group Z_sc ∩ ker ρ) and the same cokernel G/ρ(G_sc) = G_ab; apply ET.0/crossed-module-galois-cohomology (2) (Labesse Lemme 1.6.1, which proves that [Z_sc → Z] → [T_sc → T] → [G_sc → G] are quasi-isomorphisms, and Lemmes 1.6.2–1.6.3; Borovoi's comparison,).

Independence of T: two maximal tori are conjugate over F̄ and the induced isomorphisms of hypercohomology are canonical (inner automorphisms act trivially on the centre complex).

Exact sequence: specialise the seven-term sequence of the crossed module (ET.0/crossed-module-galois-cohomology (4)) to [G_sc → G].

Inner forms: an inner twist does not change [Z_sc → Z] with its Galois action (Labesse Lemme 1.6.2).

Adelic and global-mod-local groups: restricted products of the local hypercohomology groups, using that for almost all places the torus complexes are unramified and the local groups are trivial on integral classes (Labesse §1.4, §1.6, Proposition 1.6.8; the global-mod-local group after Corollaire 1.6.11, p. 34, and its exact sequence, Proposition 1.6.12, p. 35).

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

<a id="et-0-abelianization-theorems"></a>

### ET.0.3 Kneser, Hasse principle and the abelianization comparisons

Let G be connected reductive over a field F of characteristic 0. (a) (Kneser; imported from AdelicAlgebraicGroups:AA.4/kneser-local-torsor) If F is nonarchimedean local and G is semisimple simply connected, H^1(F, G) = 1. (b) If F is nonarchimedean local, ab^1 : H^1(F, G) → H^1_ab(F, G) is bijective and ab^0 : G(F) → H^0_ab(F, G) is surjective; if F is archimedean or global, ab^1 is surjective. (c) (Kneser–Harder–Chernousov) If F is a number field and G is semisimple simply connected, H^1(F, G) → ∏_{v real} H^1(F_v, G) is bijective. (d) For F a number field, the square formed by H^1(F, G) → H^1_ab(F, G) and the localization to the archimedean places, H^1(F, G) → H^1(F_∞, G) → H^1_ab(F_∞, G), is cartesian and all four arrows are surjective; consequently ker^1(F, G) := ker(H^1(F, G) → ∏_v H^1(F_v, G)) maps bijectively to its abelianized analogue ker^1_ab(F, G), and for an inner form G′ of G the natural map ker^1_ab(F, G′) → ker^1_ab(F, G) is an isomorphism, so that ker^1(F, G′) and ker^1(F, G) are in canonical bijection. (e) For F a number field and a finite subset of H^1(F, G), there is a maximal F-torus T ⊆ G such that the subset lies in the image of H^1(F, T) → H^1(F, G). (f) For F a number field and G adjoint, H^1(F, G) → ∏_v H^1(F_v, G) is injective; hence an inner form of a connected reductive group over F is determined up to isomorphism by its localizations. (g) (Serre) If F = ℝ and G(ℝ) is compact, H^1(ℝ, G) is in bijection with the G(ℝ)-conjugacy classes of elements of order dividing 2 in G(ℝ), functorially in G; and for a connected reductive subgroup H′ ⊆ H over ℝ with H_ad(ℝ) compact and H′ containing the maximal ℝ-split central torus of H, ker(H^1(ℝ, H′) → H^1(ℝ, H)) is trivial.

The precise hypotheses are: F of characteristic 0; G connected reductive; for (a): F nonarchimedean local and G simply connected; for (c): G simply connected; for (f): G adjoint.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Théorème 1.6.6 (p. 31), Proposition 1.6.7 (pp. 31–32), Théorème 1.6.9 and Théorème 1.6.10 (p. 33), Corollaire 1.6.11 (p. 34)). Kneser's vanishing for p-adic simply connected groups; the properties of ab^0 and ab^1; the Kneser–Harder–Chernousov Hasse principle; the cartesian square for global fields; ker^1 of inner forms.

([M. Kisin, Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf), Theorem (3.4.6), p. 46; the remark after (4.3.1)(iv), p. 75; §§4.4.1–4.4.9 with Lemma (4.4.5) and its proof, p. 81; proof of Proposition (3.4.11), pp. 47–48). The global–real abelianization square (item H06), Borovoi's lifting through a torus (H10), the adjoint Hasse principle (§4.3.1), Serre's description of real H¹ of compact groups and the injectivity lemma (H09), and Kneser's vanishing as used in Kisin's proofs.

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5: Fact 3.4 (p. 13), Corollary 3.7 (p. 14), Lemma 4.9 (p. 25)). Finiteness of the rigid H¹ (Fact 3.4; the ordinary finiteness for linear groups over local fields is Borel–Serre's theorem, Platonov–Rapinchuk Theorem 6.14, not read) and the use of fundamental tori for the surjectivity of abelianization (Corollary 3.7, Lemma 4.9).

(a) Kneser's theorem is imported from AdelicAlgebraicGroups:AA.4/kneser-local-torsor, which states it for torsors (every torsor under a semisimple simply connected group over a nonarchimedean local field of characteristic 0 is trivial); for smooth affine groups over a field of characteristic 0, torsors are classified by Galois H^1. Labesse Théorème 1.6.6 states the same, citing Kneser. ReductiveGroupsPartII supplies the vanishing over the completed maximal unramified extension (RG2.1/steinberg-quasi-split), the starting point of the Bruhat–Tits proof.

(b) Use the exact sequence of ET.0/abelianized-cohomology: by (a) the term H^1(F, G_sc) vanishes, giving injectivity of ab^1 and surjectivity of ab^0; surjectivity of ab^1 uses a fundamental (elliptic) maximal torus T, for which H^1(F, T) → H^1_ab(F, G) is onto (Labesse Lemme 1.6.5, Proposition 1.6.7; Borovoi Proposition 5.1, Theorems 5.4 and 5.7). Over a number field the surjectivity is Borovoi's Theorem 5.7.

(c) The Hasse principle for simply connected groups is imported (AdelicAlgebraicGroups:AA.4/hasse-principle-simply-connected) in the form: an F-torsor under G is trivial iff it is trivial at every place; with (a) at the finite places this gives the bijectivity onto the real places (Labesse Théorème 1.6.9).

(d) Combine (b) and (c) with the density of the image of H^0_ab(F, G) in H^0_ab(F_∞, G), proved by dévissage to a complex of tori [T_2 → T_1] with T_1 induced (Labesse Théorème 1.6.10, which states the cartesian square with H^1(𝔸_F, G) and reduces to F_∞ by (b) at the finite places, and Corollaire 1.6.11; Borovoi's theorem, recalled by Kisin as Theorem (3.4.6), who cites it as [Bo, Thm. 5.12]).

(e) Borovoi Theorem 5.11 as used in Kisin §4.4.7: choose a maximal torus meeting each class at every place of a finite set and use (d).

(f) The Hasse principle for adjoint groups is used by Kisin (§4.3.1, proof of Corollary 4.6.5) as a known result; by Kottwitz's duality (ET.0/kottwitz-duality (b), whose proof does not use (f)) it amounts to ker^1(F, Z(Ĝ)) = 0 for the finite Galois module Z(Ĝ) when Ĝ is simply connected. Its proof (Platonov–Rapinchuk, Chapter 6) was not read for this plan and is recorded as a gap; inner forms of a reductive group are classified by H^1(F, G_ad) (ET.0/inner-twist), which gives the consequence.

(g) Serre, Galois Cohomology III §4.5, Theorem 6 (recalled by Kisin, proof of Lemma 4.4.5) for compact G(ℝ); the injectivity statement is Kisin Lemma 4.4.5.

**Acceptance.**

- For G = SL_2 over a p-adic field, H^1(F, SL_2) = 1, while H^1(F, PGL_2) = H^1_ab(F, PGL_2) = ℤ/2 classifies the split and the quaternion forms.
- For G = SL_1(D) with D a quaternion division algebra over ℚ ramified at ∞ and one prime, (c) identifies H^1(ℚ, G) with H^1(ℝ, G), which has two elements.
- For G = SO(3) over ℝ (compact), (g) gives H^1(ℝ, G) of cardinality 2: the identity and the class of rotations by π.

*Needs:* `ET.0/abelianized-cohomology`; `AdelicAlgebraicGroups:AA.4/kneser-local-torsor`; `AdelicAlgebraicGroups:AA.4/hasse-principle-simply-connected`; `ReductiveGroupsPartII:RG2.1/steinberg-quasi-split`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

<a id="et-0-degree-zero-abelianization"></a>

### ET.0.4 Degree-zero abelianization and positive rational images

Let G be a connected reductive group over ℚ with ρ : G_sc → G. (a) H^0_ab(ℚ, G) = H^0(ℚ, Z(G_sc) → Z(G)) and the sequence G_sc(ℚ) → G(ℚ) → H^0_ab(ℚ, G) → H^1(ℚ, G_sc) is exact, so the kernel of ab^0 on G(ℚ) is ρ(G_sc(ℚ)); the same holds over ℝ and over every ℚ_ℓ. (b) Assume the Hasse principle for G_sc, i.e. ker(H^1(ℚ, G_sc) → H^1(ℝ, G_sc)) = 1 (true by ET.0/abelianization-theorems (c)). Let G(ℝ)_+ be the inverse image in G(ℝ) of the identity component (for the real topology) of G_ad(ℝ), so that G(ℝ)_+ = Z(G)(ℝ)·ρ(G_sc(ℝ)), and G(ℚ)_+ = G(ℚ) ∩ G(ℝ)_+ (van Hoften's convention, §3.4; it is not the identity component of G(ℝ), which Kisin (3.4.7) uses: for G = G_m it is ℝ^×, not ℝ_{>0}). Then G(ℚ)_+/ρ(G_sc(ℚ)) is identified by ab^0 with the inverse image of ab^0(Z(G)(ℝ)) under H^0_ab(ℚ, G) → H^0_ab(ℝ, G). (c) If G and H are inner forms over ℚ, with identifications away from p, G(𝔸_f^p) ≅ H(𝔸_f^p), compatible with a fixed global inner twisting on the centre complex [Z(G_sc) → Z(G)], then their positive rational images agree in G(𝔸_f^p)/ρ(G_sc(𝔸_f^p)) × (π_1(G)_I)^σ, the second factor being the Frobenius-invariant part of the inertia coinvariants of the algebraic fundamental group at p.

The precise hypotheses are: G connected reductive over ℚ; for (b): the Hasse principle for G_sc (a theorem by ET.0/abelianization-theorems (c)); for (c): G and H inner forms with compatible identifications away from p.

([P. van Hoften, Mod p points on Shimura varieties of parahoric level](https://arxiv.org/abs/2010.10496v4), arXiv v4: §4.3.12 (pp. 56–57), Proposition 4.3.13 (p. 57, proof p. 58), Lemma 4.3.14 and Corollary 4.3.15 (p. 57); §3.4 (p. 40) for G(ℝ)_+ and G(ℚ)_+). Degree-zero abelianized cohomology through the centre complex, its exact sequence with kernel ρ(G_sc(ℚ)), the real-positive criterion and the comparison of positive images of inner forms.

(a) Exactness is the degree-zero part of the exact sequence of ET.0/abelianized-cohomology; the centre complex computes H^0_ab by the quasi-isomorphism there (van Hoften §§4.3.12–4.3.13, after Borovoi).

(b) An element g ∈ G(ℚ) with ab^0(g) in ab^0(Z(G)(ℝ)) satisfies g = z·ρ(h) with z ∈ Z(G)(ℝ), h ∈ G_sc(ℝ) in G(ℝ), so g ∈ G(ℝ)_+ (G_sc(ℝ) is connected); conversely, an element of H^0_ab(ℚ, G) with real image in ab^0(Z(G)(ℝ)) maps to a class of H^1(ℚ, G_sc) trivial at ∞, hence trivial by the Hasse principle, so it comes from G(ℚ) (van Hoften Lemma 4.3.14, Corollary 4.3.15).

(c) The inner twisting does not change the centre complex, so H^0_ab(ℚ, G) = H^0_ab(ℚ, H) compatibly with the local maps; apply (b) to both groups and compare images through the away-from-p identifications and the Kottwitz map at p (van Hoften Proposition 4.3.13; the compatibility is made explicit in).

**Acceptance.**

- For G = GL_2 over ℚ: H^0_ab(ℚ, GL_2) = ℚ^× via det, G(ℚ)_+ is the set of rational matrices of positive determinant, and (b) identifies G(ℚ)_+/SL_2(ℚ) with ℚ_{>0}.
- For G = SL_2 (simply connected) both sides of (b) are trivial.
- For G = G_m: G(ℝ)_+ = ℝ^× and G(ℚ)_+ = ℚ^×, and (b) holds since ab^0(Z(G)(ℝ)) = ℝ^×; with the identity component ℝ_{>0} of G(ℝ) in place of G(ℝ)_+ the identification in (b) would fail.

*Needs:* `ET.0/abelianized-cohomology`; `ET.0/abelianization-theorems`; `ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism`; `ReductiveGroupsPartII:RG2.1/algebraic-fundamental-group`.

<a id="et-0-tate-nakayama-tori"></a>

### ET.0.5 Tate–Nakayama isomorphisms for tori

Let S be a torus over a field F of characteristic 0, split by a finite Galois extension E/F with group Γ_{E/F}, and X_*(S) its cocharacter module. (a) (Local) If F is local and u_{E/F} ∈ H^2(Γ_{E/F}, E^×) is the local fundamental class, cup product with u_{E/F} gives isomorphisms Ĥ^i(Γ_{E/F}, X_*(S)) → Ĥ^{i+2}(Γ_{E/F}, S(E)) of Tate cohomology groups for every integer i, using S(E) = X_*(S) ⊗ E^×. In particular H^1(F, S) ≅ Ĥ^{-1}(Γ_{E/F}, X_*(S)) = (X_*(S)_Γ)_tors (the inflation H^1(Γ_{E/F}, S(E)) → H^1(F, S) being an isomorphism by Hilbert 90 for split tori), and H^2(Γ_{E/F}, S(E)) ≅ X_*(S)^Γ/N X_*(S), with inflation H^2(Γ_{E/F}, S(E)) → H^2(F, S) injective; if S is anisotropic then H^2(F, S) = 0. The isomorphisms are compatible with restriction and corestriction, and with inflation in a tower E ⊆ E′ only after multiplying by the degree [E′ : E]. (b) (Global) If F is a number field and C_E the idele class group, cup product with the global fundamental class gives Ĥ^i(Γ_{E/F}, X_*(S)) ≅ Ĥ^{i+2}(Γ_{E/F}, X_*(S) ⊗ C_E); in degree −1 this identifies Kottwitz's global-mod-local group H^1(𝔸_F/F, S) := H^1(Γ_F, S(𝔸_F̄)/S(F̄)) = H^1(Γ_{E/F}, X_*(S) ⊗ C_E) with (X_*(S)_Γ)_tors (it contains the cokernel of H^1(F, S) → H^1(𝔸_F, S), with quotient ker^2(F, S)) and, dually, gives ker^1(F, S) ≅ ker^1(F, Ŝ)^D. (c) The same holds for two-term complexes of tori [S_1 → S_2] with finite kernel (hypercohomology in place of cohomology and the cone of X_*(S_1) → X_*(S_2)), compatibly with the long exact sequences, with norm and restriction maps and with central isogenies. The sign convention: some authors (e.g. Kaletha in the proof of Theorem 4.8) use λ ↦ λ ∪ c^{-1}, the negative of the isomorphism above; each consumer records which one it uses.

The precise hypotheses are: F of characteristic 0 local (finite extension of ℚ_p, or ℝ, or ℂ) for (a), a number field for (b); S a torus split by the finite Galois extension E/F.

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5: §4 introduction; Theorem 4.8 (p. 24) and its proof (p. 25); Corollary 3.7 (p. 14); §5.3 (p. 33)). The ordinary Tate–Nakayama isomorphism (X_*(S)_Γ)_tors → H^1(F, S) and its all-degree form, the scaled inflation, injectivity of inflation in degree 2 and the anisotropic vanishing.

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

<a id="et-0-kottwitz-duality"></a>

### ET.0.6 Kottwitz's map and the duality for reductive groups ★

Let F be a field of characteristic 0 and G connected reductive over F, with dual group Ĝ (complex), its centre Z(Ĝ) with the Galois action of ReductiveGroupsPartII:RG2.5/galois-action-on-dual-group, and A(G) := π_0(Z(Ĝ)^Γ)^D (Pontryagin dual). (a) (Local) If F is local there is a unique extension of the Tate–Nakayama isomorphisms for tori to a morphism of functors α_G : H^1(F, G) → A(G) on the category of connected reductive groups and normal homomorphisms (Kottwitz 1986, Theorem 1.2). It factors through ab^1 and an injective homomorphism H^1_ab(F, G) → A(G). If F is nonarchimedean, α_G is a bijection; the group structure it induces on H^1(F, G) is Kottwitz's. If F = ℝ, the fibre of α_G over 0 is the image of H^1(ℝ, G_sc), and the image of α_G is the annihilator of the image of the norm N_{ℂ/ℝ} on Z(Ĝ); α_G is not bijective in general and H^1(ℝ, G) is not a group. For a maximal torus S ⊆ G, α_G restricted along H^1(F, S) → H^1(F, G) is α_S followed by the restriction A(S) → A(G) dual to π_0(Z(Ĝ)^Γ) → π_0(Ŝ^Γ); a class of H^1(F, S) comes from H^1(F, G_sc) exactly when α_S of it annihilates the image of π_0(Z(Ĝ)^Γ) → π_0(Ŝ^Γ). Equivalently, via ReductiveGroupsPartII:RG2.5/dual-centre-and-fundamental-group, for F nonarchimedean H^1(F, G) ≅ (π_1(G)_Γ)_tors. (b) (Global) If F is a number field, H^1_ab(𝔸_F/F, G) ≅ A(G) canonically; ker^1(F, G) = ker^1_ab(F, G) ≅ ker^1(F, Z(Ĝ))^D. Kottwitz's Tamagawa-number formula τ(G) = #π_0(Z(Ĝ)^Γ)/#ker^1(F, Z(Ĝ)) is not part of this node.

The precise hypotheses are: F of characteristic 0, local for (a), a number field for (b); G connected reductive.

([R. E. Kottwitz, Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), §1.2, Theorem 1.2 (p. 368); §2.2, Theorem 2.2 (p. 374)). Kottwitz's theorem: a unique extension of the Tate–Nakayama map to a morphism of functors H^1(F, G) → π_0(Z(Ĝ)^Γ)^D, bijective for p-adic F; §2 gives the global cohomological results.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Proposition 1.7.3 (pp. 38–39) and Corollaire 1.7.4 (p. 39)). H^1_ab(F, G) injects into A(G), bijectively for nonarchimedean F; H^1_ab(𝔸_F/F, G) ≅ A(G) and ker^1(F, G) = ker^1_ab(F, G) = ker^1(F, Z(Ĝ))^D globally.

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5: Kottwitz's Theorem 1.2 as used in Corollary 3.8 (p. 15), Lemma 4.9 (p. 25), §4.7, Corollary 5.4 and Lemma 5.7). The real-place description of α_G (fibre over 0, image) and the criterion for a torus class to come from G_sc.

(a) For a torus define α_S by Tate–Nakayama (ET.0/tate-nakayama-tori (a), degree −1). For general G use a z-extension (ReductiveGroupsPartII:RG2.1/z-extension-existence) to reduce to G with simply connected derived group, then use the exact sequence H^1(F, G_sc) → H^1(F, G) → H^1(F, D) with D = G/G_der a torus and Kneser's vanishing (ET.0/abelianization-theorems (a)) in the p-adic case; uniqueness follows from the existence of fundamental tori (Kottwitz 1986, Theorem 1.2 and its proof; Labesse Proposition 1.7.3).

Injectivity on H^1_ab and bijectivity for nonarchimedean F: Labesse Proposition 1.7.3 via the quasi-isomorphism [Z(Ĝ) → 1] ≃ [Ĝ → Ĝ_sc]-dual of the centre complex and the Tate–Nakayama isomorphism for complexes of tori; the limit over cofinal splitting fields gives bijectivity.

Real case: describe H^1(ℝ, G) through fundamental tori (Kaletha,; Kottwitz 1986 Theorem 1.2).

(b) Global: Labesse Proposition 1.7.3 (global part), from the global Tate–Nakayama isomorphism for the centre complex (ET.0/tate-nakayama-tori (b), (c)) and the cofinality of splitting fields; ker^1(F, G) = ker^1_ab(F, G) is ET.0/abelianization-theorems (d).

**Acceptance.**

- For G = PGL_2 over a p-adic field: Ĝ = SL_2(ℂ), Z(Ĝ) = μ_2, A(G) = ℤ/2 and H^1(F, PGL_2) has two elements (split and quaternion forms).
- For G = SL_2: Z(Ĝ) = {1} for Ĝ = PGL_2(ℂ), so A(G) = 0, matching Kneser's vanishing.
- For G = U(1) over ℝ attached to ℂ/ℝ: α_G is a bijection H^1(ℝ, U(1)) = ℤ/2 ≅ A(G).
- For G = SU(2) compact over ℝ: H^1(ℝ, G) has two elements (identity and −1 up to conjugacy, ET.0/abelianization-theorems (g)) while A(G) = π_0(Z(Ĝ)^Γ)^D for Ĝ = PGL_2(ℂ) is trivial, so α_G is not injective over ℝ.

*Needs:* `ET.0/tate-nakayama-tori`; `ET.0/abelianized-cohomology`; `ET.0/abelianization-theorems`; `ReductiveGroupsPartII:RG2.1/z-extension-existence`; `ReductiveGroupsPartII:RG2.1/z-extension`; `ReductiveGroupsPartII:RG2.5/langlands-dual-group`; `ReductiveGroupsPartII:RG2.5/galois-action-on-dual-group`; `ReductiveGroupsPartII:RG2.5/dual-centre-and-fundamental-group`.

<a id="et-0-kottwitz-sign"></a>

### ET.0.7 The Kottwitz sign of an inner form

Let F be a local field of characteristic 0, G* a quasi-split connected reductive group over F and G an inner form of G*. The Kottwitz sign is e(G) = (−1)^{q(G*) − q(G)} ∈ {±1}, where q denotes the F-rank of the derived group (Kottwitz's definition); it depends only on the class h ∈ H^1(F, G*_ad) of the inner twist, and is the value at h of a map H^1(F, G*_ad) → {±1}. In dual terms (Hansen–Kaletha–Weinstein): if h corresponds under α_{G*_ad} (ET.0/kottwitz-duality) to ν ∈ X^*(Z(Ĝ_sc)^Γ), the dual group of G*_ad being Ĝ_sc, then e(G) = (−1)^{⟨2ρ, ν⟩}, with 2ρ the sum of the positive coroots of Ĝ_sc and the pairing taken modulo 2 after lifting ν to a character of a maximal torus. Properties: e(G*) = 1; e(G) depends only on the isomorphism class of the inner form; for F global and G a connected reductive group over F, ∏_v e(G_{F_v}) = 1.

The precise hypotheses are: F local of characteristic 0 (product formula: F global); G an inner form of the quasi-split group G*.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Définition 1.7.1 and Lemme 1.7.2 (p. 37)). Definition of the Kottwitz sign of an inner form through H^1(F, G*_ad) → {±1}, and the product formula ∏_v e(G_v) = 1.

([D. Hansen, T. Kaletha and J. Weinstein, On the Kottwitz conjecture for local shtuka spaces](https://arxiv.org/abs/1709.06651v4), arXiv v4, Appendix A.2, Lemma A.2.1 (p. 85)). The Kottwitz sign of an inner twist with class corresponding to ν ∈ X^*(Z(Ĝ_sc)^Γ) is (−1)^{⟨2ρ, ν⟩}.

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

<a id="et-0-inner-twist"></a>

### ET.0.8 Inner twists and the quasi-split inner form

Let F be a field of characteristic 0 and G, G′ connected reductive groups over F. An inner twist is an F̄-isomorphism ψ : G_F̄ → G′_F̄ such that ψ⁻¹∘σ(ψ) is an inner automorphism of G_F̄ for every σ ∈ Γ_F; σ ↦ ψ⁻¹∘σ(ψ) is a 1-cocycle with values in G_ad(F̄), and inner twists up to equivalence (ψ ~ Int(g′)∘ψ∘Int(g) with g ∈ G(F̄), g′ ∈ G′(F̄)) are in bijection with H^1(F, G_ad); every class arises. Every G has a unique quasi-split inner form G* up to isomorphism. An inner twist ψ transports: (i) semisimple and strongly regular semisimple elements, and their stable conjugacy classes, from G′(F) to G*(F̄) — a stable class of G′ that is defined over F gives an F-rational stable class of G*; (ii) maximal F-tori: every maximal F-torus T′ ⊆ G′ transfers to G*, i.e. there is an F-torus T* ⊆ G* and g ∈ G*(F̄) with Int(g)∘ψ|_{T′} defined over F (Steinberg and Kottwitz: quasi-split groups contain a transfer of every maximal torus of every inner form). (iii) Centralizers: for γ′ ∈ G′(F) strongly regular with image γ* (rational, by Kottwitz's rationality theorem when G*_der is simply connected, and after a z-extension in general), ψ induces an inner twist of the centralizers G′_{γ′} → G*_{γ*}, an F-isomorphism of tori in the strongly regular case.

The precise hypotheses are: F of characteristic 0; G, G′ connected reductive over F.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Définition 1.7.1 (p. 37), proof of Théorème 2.4.2 (pp. 55–56)). Inner forms of a quasi-split G* are in bijection with H^1(F, G*_ad); Kottwitz's rationality theorem for quasi-split groups with simply connected derived group, extended to general groups through z-extensions.

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5, §5.1 (p. 28)). An inner twist ψ : G_F̄ → G′_F̄ has ψ⁻¹σ(ψ) inner for all σ.

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

<a id="et-0-semisimple-conjugacy"></a>

### ET.0.9 Rational, geometric and stable conjugacy of semisimple elements

Let F be a field of characteristic 0 and G connected reductive over F. For semisimple δ ∈ G(F) let G_δ be its centralizer and G_δ^0 the identity component; δ is regular if G_δ^0 is a torus and strongly regular if G_δ is abelian (then G_δ = T_δ is a maximal torus). Two semisimple δ, δ′ ∈ G(F) are rationally conjugate if δ′ = g⁻¹δg with g ∈ G(F), geometrically conjugate if this holds with g ∈ G(F̄). Following Labesse, let T_δ be the maximal torus of the centre of the centralizer in G of G_δ^0, and let the stable centralizer I_δ be the subgroup of G_δ generated by G_δ^0 and the δ-invariants (T_δ)^δ; I_δ = G_δ^0 when G_der is simply connected (Steinberg's connectedness theorem) and in the situations of ordinary endoscopy with G_der simply connected and of cyclic base change. Then δ′ is stably conjugate to δ if δ′ = x⁻¹δx with x ∈ G(F̄) and the cocycle a_σ = x σ(x)⁻¹ takes values in I_δ for every σ ∈ Γ_F. For strongly regular δ, stable conjugacy is geometric conjugacy by an element x with x σ(x)⁻¹ ∈ T_δ, i.e. conjugacy over F̄ such that the induced isomorphism T_δ → T_δ′ is defined over F. Stable conjugacy is an equivalence relation on semisimple elements of G(F), coarser than rational and finer than geometric conjugacy. The same definitions apply to the Lie algebra 𝔤(F) (regular semisimple X with centralizer a maximal torus, stable conjugacy by G(F̄) with defined-over-F induced isomorphism) and, with θ-conjugacy x⁻¹δθ(x), to a twisted space L = Gθ (Labesse §2.3, Waldspurger 2008 §3.1).

The precise hypotheses are: F of characteristic 0; G connected reductive (for the twisted version, a connected component L of a reductive G⁺ with identity component G having a rational point).

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §2.3, Définitions 2.3.1 and 2.3.4, Lemmes 2.3.2 and 2.3.3 (pp. 52–54)). Regular and strongly regular semisimple elements, the stable centralizer I_δ generated by the identity component and the invariants of the central torus, and stable conjugacy defined by the condition that x σ(x)⁻¹ lies in I_δ.

([R. E. Kottwitz, Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), Introduction (p. 367) and §4.1 (p. 378)). Stable conjugacy of semisimple elements and the parametrization of the rational classes in a stable class by ker[H^1(F, I) → H^1(F, G)].

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

<a id="et-0-rational-classes-in-stable-class"></a>

### ET.0.10 Rational classes inside a stable class ★

Let F be a field of characteristic 0, G connected reductive over F, δ ∈ G(F) semisimple and I = I_δ its stable centralizer. (a) Sending δ′ = x⁻¹δx (stably conjugate) to the class of σ ↦ x σ(x)⁻¹ gives a bijection between the G(F)-conjugacy classes in the stable class of δ and the image of D(I, G; F) := ker[H^1(F, I) → H^1(F, G)] in ker[H^1(F, G_δ) → H^1(F, G)]; when I = G_δ (e.g. δ strongly regular, or G_der simply connected and G_δ connected) the conjugacy classes are in bijection with D(I, G; F), and the class of (δ, δ′) is denoted inv(δ, δ′). (b) If F is local, D(I, G; F) is finite, and when I = T is a torus it is a finite abelian group; then D(T, G; F) ⊆ E(T, G; F) := ker[H^1(F, T) → H^1_ab(F, G)] = ker[A(T) → A(G)] (Kottwitz's 𝔈(T/F)), with equality if F is nonarchimedean; and via ET.0/tate-nakayama-tori and ET.0/kottwitz-duality, E(T, G; F) is Pontryagin dual to Kottwitz's 𝔎(T/F), the subgroup of π_0((T̂/Z(Ĝ))^Γ) of classes whose image in H^1(F, Z(Ĝ)) is trivial (equivalently the cokernel of π_0(Z(Ĝ)^Γ) → π_0(T̂^Γ)), so that characters κ of E(T, G; F) are given by Γ-invariant elements of T̂/Z(Ĝ) that lift to T̂^Γ, up to the identity component. (c) (Steinberg's relatedness lemma) If F is a p-adic field and δ, δ′ are strongly regular and stably conjugate, they are conjugate over the completed maximal unramified extension F̆, because H^1(F̆, T) = 0. (d) (Rationality) If G is quasi-split and G_der is simply connected, every stable (= geometric) semisimple class of G(F̄) that is stable under Γ_F contains an element of G(F). (e) For a proper Levi subgroup M of G, the rational classes in a stable class of M may differ from those of G: inv is compatible with M ⊆ G through H^1(F, I^M) → H^1(F, I^G).

The precise hypotheses are: F of characteristic 0 (local for (b), p-adic for (c)); G connected reductive; for (d): G quasi-split with simply connected derived group.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §2.3 after Définition 2.3.4 (pp. 53–54); proof of Théorème 2.4.2 (p. 56)). The stable class of δ is the image of H^0(F, I\G); the rational classes inside it are parametrized by the image of D(I, G; F) = ker[H^1(F, I) → H^1(F, G)]; rational points in rational stable classes of quasi-split groups with simply connected derived group (Kottwitz).

([R. E. Kottwitz, Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), Introduction (p. 366); §4.1–4.6, definitions of 𝔇, 𝔈, 𝔎 (pp. 378–379)). The conjugacy classes within a stable class correspond to ker[H^1(F, I) → H^1(F, G)]; 𝔇(I/F) ⊆ 𝔈(I/F) and the dual group 𝔎(I/F) (𝔎(I/F): the classes in π_0([Z(Î)/Z(Ĝ)]^Γ) with trivial, resp. locally trivial, image in H^1(F, Z(Ĝ)), §4.6).

([D. Hansen, T. Kaletha and J. Weinstein, On the Kottwitz conjecture for local shtuka spaces](https://arxiv.org/abs/1709.06651v4), arXiv v4, Lemma 3.2.1 (p. 17)). Strongly regular elements conjugate over an algebraic closure of F̆ are conjugate over F̆, by Steinberg.

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5, Fact 3.4 (p. 13)). Finiteness of the rigid cohomology set; the ordinary finiteness of H^1(Γ, H(F̄)) for linear algebraic groups over ℝ or p-adic fields is Borel–Serre's theorem as used there.

(a) Labesse §2.3 after Définition 2.3.4: the pair (x, a) gives a class in H^0(F, I\G), whose image in H^1(F, I) lies in D(I, G; F); the fibres of H^0(F, I\G) → G(F) are the kernels displayed there, giving the parametrization through the image in ker[H^1(F, G_δ) → H^1(F, G)] (also Kottwitz 1986 Introduction and §4.1).

(b) Finiteness: local H^1 of linear algebraic groups is finite (Kaletha Fact 3.4, citing Platonov–Rapinchuk Theorem 6.14); E(T, G; F) is the abelianized kernel and the comparison with D uses ET.0/abelianization-theorems (b); the duality with K(T, G; F) is ET.0/tate-nakayama-tori (a) and ET.0/kottwitz-duality (a) (Kottwitz 1986 §§4.4–4.6).

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

<a id="et-0-global-kottwitz-obstruction"></a>

### ET.0.11 The global obstruction for adelic stable classes

Let F be a number field and G connected reductive over F with G_der simply connected (the standing assumption of Kottwitz 1986 §6), γ_0 ∈ G(F) semisimple with centralizer I_0 (connected reductive, as G_der is simply connected), and γ = (γ_v)_v ∈ G(𝔸_F) conjugate to γ_0 under G(𝔸_F ⊗_F F̄), so that each γ_v is stably conjugate to γ_0. (Kottwitz allows γ_0 in a quasi-split inner form G_0 of G, transported by an inner twisting ψ : G_0 → G; the case stated here is G_0 = G, the one the product formula (c) uses.) Let inv_v(γ_0, γ_v) ∈ D(I_0, G; F_v) be the local invariants (ET.0/rational-classes-in-stable-class) and α_v their images in A(I_0/F_v) := π_0(Z(Î_0)^{Γ_v})^D. (a) Let 𝔎(I_0/F) be the group of κ ∈ π_0((Z(Î_0)/Z(Ĝ))^Γ) whose image in H^1(F, Z(Ĝ)) is locally trivial; almost all α_v vanish, and obs(γ) ∈ 𝔎(I_0/F)^D is the character κ ↦ ∏_v α_v(κ_v) of the localizations κ_v. (b) If G_sc has no E_8 factor, γ is G(𝔸_F)-conjugate to an element of G(F) stably conjugate to γ_0 if and only if obs(γ) is trivial (Kottwitz 1986, Theorem 6.6; the E_8 restriction comes from the Hasse principle, which is now known for E_8 by Chernousov, so it can be removed). (c) For κ ∈ 𝔎(I_0/F), ⟨obs(γ), κ⟩ = ∏_v ⟨inv_v(γ_0, γ_v), κ_v⟩, the product formula used to stabilize the elliptic terms; the number of G(F)-classes in G(F) ∩ (stable class of γ_0) adelically conjugate to γ is |ker^1(F, I_0)|-weighted as in Kottwitz 1986 §9.

The precise hypotheses are: F a number field; G connected reductive with G_der simply connected; for (b) G_sc without E_8 factors (removable by Chernousov's Hasse principle for E_8).

([R. E. Kottwitz, Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), §6 (standing assumptions) and §§6.1–6.6 (pp. 381–383), Lemma 6.3 and Theorem 6.6 (p. 382); §§6.7–6.10 with (6.10.1) (p. 384); §9 (pp. 391–396)). With G_der simply connected and γ_0 in a quasi-split inner form, the obstructions obs_1(γ) and obs(γ) ∈ 𝔎(I_0/F)^D; γ is G(𝔸)-conjugate to a rational element iff obs(γ) is trivial (assuming no E_8 factors); obs(γ′) = obs(γ)·inv(γ, γ′) (§6.7); the conjectural identity (6.10.1) of the adelic transfer factor with ⟨obs(γ), κ⟩.

([S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §4.2, Definition 4.2 and (4.1)–(4.2) (pp. 13–14)). Shin's Kottwitz triples and the Kottwitz invariant α(γ_0; γ, δ) ∈ 𝔎(I_0/ℚ)^D, which consume this obstruction theory.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Théorème 1.6.9 (p. 33)). The Hasse principle for simply connected groups including type E_8 (Chernousov).

Construct obs_1(γ) first using G_sc(𝔸)-conjugacy and the Hasse principle for G_sc (Kottwitz 1986 §6.1–6.3, Lemma 6.3), then pass to obs(γ) using the global duality ker^1(F, I_0) ≅ ker^1(F, Z(Î_0))^D of ET.0/kottwitz-duality (b) and Tate–Nakayama for the global-mod-local cohomology (ET.0/tate-nakayama-tori (b)).

The criterion (b) is Kottwitz 1986 Theorem 6.6; the Hasse principle input is ET.0/abelianization-theorems (c), which includes E_8 (Labesse Théorème 1.6.9).

The product formula (c): Kottwitz 1986 §6.7 gives obs(γ′) = obs(γ)·inv(γ, γ′) for adelic elements of one geometric class; apply it with γ_0, whose obstruction is trivial, and use the local duality of ET.0/kottwitz-duality (a). Kottwitz's conjecture (6.10.1), which identifies the adelic transfer factor with ⟨obs(γ), κ⟩, is the theorem of Langlands–Shelstad recorded in ET.1/transfer-factor-properties (f).

**Acceptance.**

- For G = GL_n every adelic element stably conjugate everywhere to γ_0 ∈ GL_n(F) is G(𝔸)-conjugate to γ_0 (obs is trivial because 𝔎(I_0/F) = 1 for centralizers that are products of restrictions of scalars of GL's).
- For G = SL_2 and γ_0 regular elliptic with splitting field E: the local invariants lie in ℤ/2 at each place nonsplit in E, and obs(γ) is their sum; an adelic element whose invariants are nontrivial at exactly one place is not conjugate to a rational element.

*Needs:* `ET.0/rational-classes-in-stable-class`; `ET.0/kottwitz-duality`; `ET.0/tate-nakayama-tori`; `ET.0/abelianization-theorems`; `ArithmeticGaloisDuality:R02.3/localisation-maps`.

<a id="et-0-unramified-local-cohomology"></a>

### ET.0.12 Unramified Galois cohomology of reductive models

Let G be a connected reductive group over ℚ_p with a reductive model G_{ℤ_p} (smooth affine with connected reductive special fibre), and L = ℚ_p^ur. (a) (Lang) H^1(Gal(L/ℚ_p), G_{ℤ_p}(ℤ_p^ur)) = 1, i.e. every G_{ℤ_p}-torsor over ℤ_p is trivial; the same holds for every smooth affine ℤ_p-group with connected fibres, and over ℤ_ℓ. (b) (Integral z-extensions) A reductive group G_{ℤ_(p)} over ℤ_(p) admits a z-extension G_{1,ℤ_(p)} → G_{ℤ_(p)}: a surjection of reductive ℤ_(p)-groups whose kernel is a central induced torus and with G_1^der simply connected. (c) (Kernel of the Kottwitz homomorphism on unramified points) Let ρ : G̃ → G be the simply connected cover of the derived group and κ̃_G : G(L) → π_1(G) the Kottwitz homomorphism (ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism, with I acting trivially since G is unramified). Then ρ(G̃(L))·G_{ℤ_p}(ℤ_p^ur) = ker κ̃_G, a normal subgroup; its intersection with G(ℚ_p) is ρ(G̃(ℚ_p))·G_{ℤ_p}(ℤ_p) = ker(κ̃_G|_{G(ℚ_p)}); and a class in G(L)/ρ(G̃(L))G_{ℤ_p}(ℤ_p^ur) whose κ̃_G-image is Frobenius invariant contains an element of G(ℚ_p).

The precise hypotheses are: G_{ℤ_p} a reductive model (connected special fibre); for (b): G_{ℤ_(p)} reductive over ℤ_(p).

([M. Kisin, Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf), footnote 20 (p. 54); Proposition (3.6.7) and its proof (p. 56); Proposition (3.6.10) and its proof (p. 58); Lemma (3.6.2) (p. 53) and the Cartan-decomposition step of its proof (p. 54); (3.6.8) (p. 57) and (3.6.9) (p. 58)). Lang's lemma for smooth connected integral groups; integral z-extensions; the kernel of κ̃_G on unramified and rational points.

([M. Kisin, Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf), Corollary (2.3.5) and its proof (p. 34)). Steinberg's theorem H^1(ℚ_p^ur, H) = 0 for connected linear H, used together with Lang.

(a) Lang's theorem for the connected special fibre (ReductiveGroupsPartII:RG2.3/lang-theorem) gives a section mod p; smoothness and Hensel's lemma lift it (Kisin footnote 20 and proofs of Proposition 3.6.7, Lemma 3.8.2,).

(b) Kottwitz's construction of z-extensions over fields (ReductiveGroupsPartII:RG2.1/z-extension-existence) carried out with an induced torus split over an unramified extension so that it extends to ℤ_(p) (Kisin, proof of Proposition 3.6.10, citing Kottwitz 'Shimura varieties and λ-adic representations' §1).

(c) The Cartan decomposition for the hyperspecial subgroup G_{ℤ_p}(ℤ_p^ur) of G(L) (ReductiveGroupsPartII:RG2.3/hyperspecial-vertices and RG2.4) shows that G(L) = ⊔ over dominant cocharacters of double cosets, and κ̃_G is the image of the cocharacter in π_1(G); its kernel is generated by ρ(G̃(L)) and the hyperspecial subgroup. Intersecting with G(ℚ_p) uses (a) and Kneser's vanishing (ET.0/abelianization-theorems (a)); the last assertion uses Lang's theorem for the Frobenius-twisted action (Kisin, proof of Lemma 3.6.2(2),).

**Acceptance.**

- For G = GL_n: κ̃_G = val ∘ det, its kernel is SL_n(L)·GL_n(ℤ_p^ur) and the rational points of the kernel are SL_n(ℚ_p)·GL_n(ℤ_p) = {g : val det g = 0}.
- For G = G_m: H^1(Gal(L/ℚ_p), ℤ_p^{ur,×}) = 1 (the unit group is cohomologically trivial for unramified extensions).

*Needs:* `ReductiveGroupsPartII:RG2.3/lang-theorem`; `ReductiveGroupsPartII:RG2.1/z-extension-existence`; `ReductiveGroupsPartII:RG2.1/kottwitz-homomorphism`; `ReductiveGroupsPartII:RG2.3/hyperspecial-vertices`; `ReductiveGroupsPartII:RG2.4/cartan-decomposition`; `ET.0/abelianization-theorems`.

<a id="et-0-endoscopic-datum"></a>

### ET.0.13 Endoscopic data, twisted endoscopic data and their isomorphisms ★

Let F be a local or global field of characteristic 0, W_F its Weil group, G connected reductive over F, θ an F-automorphism of G (quasi-semisimple, i.e. preserving a Borel pair over F̄), ω a character of G(F) (local) or of G(𝔸_F)/G(F) (global) with class a_ω ∈ H^1(W_F, Z(Ĝ)) (Langlands' correspondence for characters, recalled by Waldspurger 2008 §1.3), Ĝ the dual group with a Γ-stable pinning (B̂, T̂, {X_α}) and ^LG = Ĝ ⋊ W_F (ReductiveGroupsPartII:RG2.5/l-group), θ̂ the dual automorphism of Ĝ preserving the pinning and ^Lθ = θ̂ × id. An endoscopic datum for (G, θ, ω) is a quadruple (H, ℋ, s, ξ) with: (1) H a quasi-split connected reductive group over F; (2) ℋ a split extension of W_F by Ĥ whose induced outer action of W_F on Ĥ is the one given by H; (3) s ∈ Ĝ such that Int(s)∘θ̂ is semisimple; (4) ξ : ℋ → ^LG a continuous injective homomorphism over W_F such that (a) there is a 1-cocycle a : W_F → Z(Ĝ) of class a_ω with s ^Lθ ξ(h) = a(h) ξ(h) s ^Lθ for all h ∈ ℋ, and (b) ξ restricts to an isomorphism of Ĥ onto the identity component Z_Ĝ(s ^Lθ)^0 of the centralizer of s θ̂. Ordinary endoscopic data are the case θ = 1, ω = 1, written (H, ℋ, s, ξ) with s ∈ Ĝ semisimple (Langlands–Shelstad §1.2; for G_der simply connected one may take ℋ = ^LH). An isomorphism (H, ℋ, s, ξ) → (H′, ℋ′, s′, ξ′) is g ∈ Ĝ with g ξ(ℋ) g⁻¹ = ξ′(ℋ′) and g s ^Lθ g⁻¹ ∈ Z(Ĝ) s′ ^Lθ; Out(H, ℋ, s, ξ) is the group of automorphisms modulo ξ(Ĥ). In the ordinary global or local case the datum is elliptic if ξ(Z(Ĥ)^Γ)^0 ⊆ Z(Ĝ); E(G) and E_ell(G) denote sets of representatives of isomorphism classes (resp. elliptic ones); for F local E_ell(G) is finite. Endoscopic triples (H, s, η) (Kottwitz's convention, used by Shin) are the data with ℋ = ^LH and η = ξ|_Ĥ when G_der is simply connected. For a Levi subgroup M ⊆ G with ^LM ⊆ ^LG (ReductiveGroupsPartII:RG2.5/l-group-levi-embedding), an endoscopic datum (M_H, ℳ, s, ξ_M) for M induces one for G with H ⊇ M_H as a Levi, by taking the centralizer of s in Ĝ.

The precise hypotheses are: F local or global of characteristic 0; G connected reductive, θ quasi-semisimple, ω a character.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.3 (pp. 8–10)). The quadruple (H, ℋ, s, ξ̂) with conditions (1)–(4)(b) for a twisted triple (G, θ, ω), the notion of isomorphism, the associated map from conjugacy classes in H to θ-conjugacy classes in G and the strongly G-regular elements.

([R. P. Langlands and D. Shelstad, On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf), §1.2 (p. 224)). Endoscopic data (H, ℋ, s, ξ) for ordinary endoscopy with conditions (i)–(iv).

([R. Kottwitz and D. Shelstad, On splitting invariants and sign conventions in endoscopic transfer](https://arxiv.org/abs/1201.5658v1), §5.1 (PDF p. 12)). Standard endoscopic data (H, s, ξ) with ξ an L-homomorphism ^LH → ^LG, and the observation that (H, s⁻¹, ξ) is again endoscopic data (p. 13).

([R. E. Kottwitz, Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf), §5.4 (p. 380); §7 (pp. 385–390)). Endoscopic triples (H, s, η) as in Kottwitz's earlier paper, and the local finiteness results.

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

<a id="et-0-z-pair"></a>

### ET.0.14 z-pairs for endoscopic data

Let (H, ℋ, s, ξ) be an endoscopic datum for (G, θ, ω) over a field F of characteristic 0. A z-pair is a triple (H_1, ξ_1, ξ̂_1) with: (1) H_1 a quasi-split connected reductive group over F with simply connected derived group; (2) ξ_1 : H_1 → H a surjective homomorphism whose kernel Z_1 is a central induced torus (so H_1 → H is a z-extension in the sense of ReductiveGroupsPartII:RG2.1/z-extension); (3) ξ̂_1 : ℋ → ^LH_1 an injective homomorphism over W_F whose restriction to Ĥ is the dual of ξ_1. Because Z_1 is induced, H_1(F) → H(F) is surjective. The composite W_F → ℋ → ^LH_1 → ^LZ_1 → Ẑ_1 (for any section W_F → ℋ) is a 1-cocycle whose class is independent of the section; it defines a character λ_1 of Z_1(F) (of Z_1(𝔸_F)/Z_1(F) globally). Transfer to H is replaced by transfer to functions on H_1(F) that transform under Z_1(F) by λ_1^{-1}. z-pairs exist for every endoscopic datum (Kottwitz–Shelstad §2.2).

The precise hypotheses are: (H, ℋ, s, ξ) an endoscopic datum over F of characteristic 0.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.4 (pp. 10–11)). Definition of a z-pair (H_1, ξ_1, ξ̂_1), surjectivity of H_1(F) → H(F), the character λ_1 of Z_1(F) and the existence of z-pairs after Kottwitz–Shelstad §2.2.

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), arXiv v5, §5.3, pp. 33–35). Ordinary endoscopy with z-pairs (H_z, η_z) with induced central torus kernel and the required L-embedding.

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

<a id="et-0-norm-correspondence"></a>

### ET.0.15 Images and norms: matching of strongly regular classes

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

<a id="et-0-unitary-elliptic-endoscopic-data"></a>

### ET.0.16 Elliptic endoscopic data of unitary similitude groups

Let F = F^+F_0 be a CM field with F^+ totally real and F_0 imaginary quadratic, and for a vector n⃗ = (n_1, …, n_s) of positive integers let G_{n⃗} be the quasi-split group over ℚ of [Shin 2011 §3.1]: G_{n⃗}(R) = {(λ, g) ∈ R^× × GL_{n⃗}(F ⊗_ℚ R) : g Φ_{n⃗} ᵗg^c = λ Φ_{n⃗}} with Φ_{n⃗} = diag(Φ_{n_1}, …, Φ_{n_s}) the block-diagonal matrix built from Φ_m = ((−1)^{i+1}δ_{i, m+1−j}). Its dual group is Ĝ_{n⃗} = ℂ^× × ∏_{σ ∈ Φ^+} GL_{n⃗}(ℂ) (Φ^+ the embeddings F → ℂ above a fixed τ_0 : F_0 → ℂ), with W_ℚ acting through W_ℚ/W_{F_0} by (λ, (g_σ)) ↦ (λ ∏_σ det g_σ, (Φ_{n⃗} ᵗg^{-1}_{c w⁻¹σ} Φ^{-1}_{n⃗})_σ) for w ∉ W_{F_0}. For G = G_N (N = n in Shin's notation, N = 2n for Caraiani–Scholze) a set of representatives of E_ell(G_N) is {(G_N, 1, id)} ∪ {(G_{n_1,n_2}, s_{n_1,n_2}, η_{n_1,n_2}) : n_1 + n_2 = N, n_1 ≥ n_2 ≥ 1}, where s_{n_1,n_2} = (1, (I_{n_1}, −I_{n_2})) and η_{n_1,n_2} is induced by GL_{n_1} × GL_{n_2} ⊂ GL_N, where, following Caraiani–Scholze, the pair (n_1, n_2) may be omitted when n_1, n_2 and [F^+ : ℚ] are all odd (Kottwitz 1984, condition 7.4.3). Fixing a character ϖ : 𝔸_{F_0}^×/F_0^× → ℂ^× whose restriction to 𝔸^×/ℚ^× is the quadratic character of F_0 (viewed as a character of W_{F_0} by class field theory), the L-morphism η̃_{n_1,n_2} : ^LG_{n_1,n_2} → ^LG_N is w ↦ (ϖ(w)^{−N(n_1,n_2)}, (diag(ϖ(w)^{ε(N−n_1)} I_{n_1}, ϖ(w)^{ε(N−n_2)} I_{n_2}))_σ) ⋊ w for w ∈ W_{F_0} and w* ↦ (a_{n_1,n_2}, (Φ_{n_1,n_2}Φ_N^{-1})_σ) ⋊ w* for a fixed w* ∈ W_ℚ \ W_{F_0}, where ε(m) ∈ {0, 1} is m mod 2, N(n_1,n_2) = [F^+ : ℚ](n_1 ε(N − n_1) + n_2 ε(N − n_2))/2 and a_{n_1,n_2}² = (−1)^{N(n_1,n_2)} (Shin writes (−1)^{−N(n_1,n_2)} det(Φ_{n_1,n_2}Φ_N), which is the same number since det Φ_m = 1). Each such datum is elliptic, the listed data are pairwise non-isomorphic, and Out(G_{n_1,n_2}, s, η) is trivial unless n_1 = n_2, when it has order 2.

The precise hypotheses are: F = F^+F_0 CM with F^+ ≠ ℚ allowed (Caraiani–Scholze assume [F^+ : ℚ] > 1 for the trace formula, not for this list); the character ϖ fixed as above.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §§3.1–3.2, (3.1)–(3.4) and the displays for η̃_{n_1,n_2} and N(n_1,n_2), Remark 3.2 (pp. 12–14)). The groups G_{n⃗}, their dual groups, the set E_ell(G_n) = {(G_n, s_n, η_n)} ∪ {(G_{n_1,n_2}, s_{n_1,n_2}, η_{n_1,n_2}) : n_1 + n_2 = n, n_1 ≥ n_2 > 0} and the explicit L-morphisms through ϖ.

([A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.2 (pp. 67–68)). The same list for G_{2n} with the exclusion when n_1, n_2 and [F^+ : ℚ] are all odd (Kottwitz 1984, 7.4.3), and the explicit extension η̃_{n_1,n_2} of η_{n_1,n_2} via ϖ and the element a_{n_1,n_2}.

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

<a id="et-0-unitary-hermitian-matching"></a>

### ET.0.17 Centralizers, stable classes and matching for unitary Lie algebras

Let E/F be a quadratic extension of nonarchimedean local fields of characteristic 0 with Galois conjugation c and norm character η_{E/F}, V a nondegenerate Hermitian space of dimension n over E, U(V) its unitary group and Herm(V) the F-space of Hermitian endomorphisms (the Lie algebra of U(V) up to the scalar ε with ε^c = −ε). (a) (Centralizers) For regular semisimple δ ∈ Herm(V) write F[δ] = F[X]/(char_δ) = ∏_{i=1}^m F_i (F_i/F fields), E_i = E ⊗_F F_i, and S_1 = {i : F_i ⊉ E}, S_2 its complement. The centralizer T_δ of δ in U(V) is the torus of norm-one elements of E[δ] = E ⊗_F F[δ], so T_δ(F) ≅ ∏_{i ∈ S_1} E_i^1 × ∏_{i ∈ S_2} F_i^× with E_i^1 the norm-one elements of E_i/F_i; H^1(F, T_δ) ≅ ∏_{S_1} ℤ/2; and E(T_δ, U(V); F) = ker(H^1(F, T_δ) → H^1_ab(F, U(V))) = ker(∏_{S_1} ℤ/2 → ℤ/2), the map being the sum. (b) (Matching) Let V_a, V_b be Hermitian spaces of dimensions a, b with a + b = n and W_{a,b} = V_a ⊕ V_b. Regular semisimple δ ∈ Herm(V) and δ′ ∈ Herm(V′) are Jacquet–Langlands transfers of each other if they are GL_n(E)-conjugate after identifying V ≅ E^n ≅ V′; then δ′ = Ad(g)δ and inv(δ, δ′) := [σ ↦ g^{-1}σ(g)] ∈ H^1(F, T_δ) extends the invariant on D(T_δ, U(V); F). Regular semisimple δ ∈ Herm(V) and (δ_a, δ_b) ∈ Herm(V_a) ⊕ Herm(V_b) match if δ and φ_{a,b}(δ_a, δ_b) are Jacquet–Langlands transfers, where φ_{a,b} : Herm(V_a) ⊕ Herm(V_b) → Herm(W_{a,b}) is the block-diagonal embedding. (c) (The endoscopic character) If y ∈ Herm(V) matches (y_a, y_b), then H^1(F, T_y) = ∏_{S_1(a)} ℤ/2 × ∏_{S_1(b)} ℤ/2 = H^1(F, T_{y_a} × T_{y_b}), and the character κ attached to the elliptic endoscopic datum (U(V_a) × U(V_b), s, ξ) is the restriction to E(T_y, U(V); F) of the character κ̃ that is trivial on the factors indexed by S_1(a) and nontrivial on those indexed by S_1(b).

The precise hypotheses are: E/F quadratic, F nonarchimedean of characteristic 0 (residue characteristic odd where the source uses it); δ regular semisimple.

([S. Leslie, The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3), §1.5.4, Lemma 1.8 (p. 12); §2.2.1, Definition 2.6 (p. 17); §2.2.2, (2.5)–(2.6) and Lemma 2.7 (p. 18)). Centralizers and cohomology of regular semisimple Hermitian elements, Jacquet–Langlands transfer and matching for Herm(W_1) via φ_{a,b}, and the endoscopic character κ on H^1(F, T_y).

(a) Decompose V along the characteristic polynomial; on each factor with F_i ⊉ E the centralizer is the norm-one torus of E_i/F_i, otherwise a split torus; Tate–Nakayama (ET.0/tate-nakayama-tori) gives H^1 = ℤ/2 for each norm-one factor and 0 for the others, and H^1_ab(F, U(V)) = ℤ/2 (the discriminant) with the map the sum (Leslie Lemma 1.8, citing Rogawski 1990 §3.4).

(b) Definition 2.6 of Leslie, an instance of ET.0/norm-correspondence for the Lie algebra with the endoscopic datum of ET.0/unitary-elliptic-endoscopic-data (local version) and transport across the inner forms U(V), U(V′) (ET.0/inner-twist).

(c) Leslie Lemma 2.7 (stated there without proof as standard): compute κ ∈ π_0(T̂^Γ) from s = diag(1_a, −1_b) through the identification of (a) (Rogawski 1990 Chapter 3).

**Acceptance.**

- n = 1: Herm(V) = F, T_δ = U(1) = E^1, H^1 = ℤ/2, and E(T_δ, U(V); F) = ker(ℤ/2 → ℤ/2) = 0, so each stable class is a single class.
- n = 2, δ with F[δ] = F × F and E ⊄ F: S_1 = {1, 2}, H^1(F, T_δ) = (ℤ/2)², E = ℤ/2 (two rational classes) and for (a, b) = (1, 1) κ is the nontrivial character.

*Needs:* `ET.0/tate-nakayama-tori`; `ET.0/abelianized-cohomology`; `ET.0/rational-classes-in-stable-class`; `ET.0/norm-correspondence`; `ET.0/inner-twist`; `ET.0/unitary-elliptic-endoscopic-data`; `mathlib:Matrix.IsHermitian`.

<a id="et-0-acceptance-examples"></a>

### ET.0.18 Worked examples for stable conjugacy and endoscopic data

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

<a id="et-1-orbital-integral"></a>

### ET.1.1 Invariant orbital integrals and their normalizations ★

Let F be a local field of characteristic 0 and G connected reductive over F, with a fixed Haar measure dg on G(F). The orbital integral of a semisimple γ ∈ G(F) is owned by AutomorphicSpectralTheory AS.6 (target AS.6.9 of its package, which owns it) and is imported here: for f ∈ C_c^∞(G(F)) (locally constant compactly supported if F is p-adic, smooth compactly supported if F is archimedean), O_γ(f) = ∫_{G_γ^0(F)\G(F)} f(g⁻¹γg) dg/dt, with dt a Haar measure on the identity component G_γ^0(F) of the centralizer and the quotient measure (AdelicAlgebraicGroups:AA.2/quotient-measure); it converges for every semisimple γ, and J_G(γ, f) = |D^G(γ)|^{1/2} O_γ(f) with D^G(γ) = det(1 − Ad(γ))|_{𝔤/𝔤_γ}. This node fixes the conventions under which ET uses it and plans its extensions: (i) following Waldspurger, O^G_γ(f) = [G_γ(F) : G_γ^0(F)]⁻¹ O_γ(f), which depends only on the G(F)-class of γ; (ii) measures on centralizers of stably conjugate (or matching) elements are transported by the inner twist between their identity components (ET.0/semisimple-conjugacy); (iii) for regular semisimple γ, J_G(γ, f) is a bounded locally constant (p-adic) or smooth (real) function of γ on G_reg(F) for fixed f (Harish-Chandra), and the Weyl integration formula expresses ∫_{G(F)} f through the integrals of |D^G(t)| O_t(f) over maximal tori; (iv) the Lie-algebra version: for f ∈ C_c^∞(𝔤(F)) and X ∈ 𝔤(F) semisimple, O_X(f) = ∫_{G_X^0(F)\G(F)} f(Ad(g)⁻¹X) dg/dt and D(X) = det(ad X)|_{𝔤/𝔤_X}; for F p-adic, the orbital integrals of nilpotent orbits are defined by the invariant measure on the orbit (Deligne–Ranga Rao) and are needed for germ expansions; (v) semisimple descent: near a semisimple γ, O^G is expressed through O^{G_γ} of a descended function on a neighbourhood of 0 in 𝔤_γ(F).

The precise hypotheses are: F local of characteristic 0; G connected reductive with fixed Haar measures on G(F) and on the centralizers.

([R. E. Kottwitz, Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §2 'Basics of integration' (p. 403), §3 'Preliminaries about orbital integrals' (p. 406), §7 'Weyl integration formula' (p. 421)). Quotient measures, the definition and convergence of orbital integrals of semisimple elements, normalization by the Weyl discriminant and the Weyl integration formula for p-adic groups and Lie algebras.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.5 (pp. 11–12)). O^ω_δ(f) with the factor [G_δ(F) : G_δ^0(F)]⁻¹ and the transport of Haar measures between centralizers of matching elements.

([R. P. Langlands and D. Shelstad, On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf), §5.4 'Orbital integrals as fiber integrals' (p. 259)). Orbital integrals near regular unipotent elements realized as fibre integrals.

The group orbital integral, its quotient measure and its convergence are imported from AutomorphicSpectralTheory AS.6 (requested; AS.6.9 of its package, after Arthur's introduction §18). Quotient measure: AdelicAlgebraicGroups:AA.2/quotient-measure applies since reductive groups are unimodular; Weil's integration formula AA.2/quotient-integral-integrable gives the integral as an iterated integral (Kottwitz, Clay notes §2).

Convergence for semisimple γ (the argument behind AS.6.9, used here for the Lie-algebra version): the orbit O_γ is closed, and G_γ^0(F)\G(F) → O_γ(F) is proper with finite fibres over its image (Kottwitz, Clay notes §3).

Boundedness and local constancy of normalized orbital integrals near regular elements: Harish-Chandra; the p-adic statements are in Kottwitz's Clay notes §§3, 15–16 (Harish-Chandra's compactness lemma and semisimple descent).

Nilpotent orbital integrals: the invariant measure on a nilpotent orbit extends to a Radon measure on 𝔤(F) (Deligne–Ranga Rao), recalled in Kottwitz's Clay notes §17; the original papers were not read (see the references).

The definition exposes the following operations and relations.

- `TauCeti.orbitalIntegral` (compatibility): The group orbital integral O_γ(f) for semisimple γ and f ∈ C_c^∞(G(F)) is AutomorphicSpectralTheory's AS.6.9 `orbital_integral`, imported and not redefined; its invariance, linearity and measure-scaling lemmas are AS.6.9's.
- `TauCeti.normalizedOrbitalIntegral` (compatibility): J_G(γ, f) = |D^G(γ)|^{1/2} O_γ(f), as in AS.6.9.
- `TauCeti.orbitalIntegralWaldspurger` (data): O^G_γ(f) = [G_γ(F) : G_γ^0(F)]⁻¹ O_γ(f), a function of the G(F)-class of γ (Waldspurger's normalization).
- `TauCeti.orbitalIntegral_transport` (compatibility): For γ′ stably conjugate to γ, or matching it across an inner twist, the Haar measure on G_γ′^0(F) is the transport of that on G_γ^0(F), and O_γ′ is formed with it.
- `TauCeti.normalizedOrbitalIntegral_bounded` (other): For fixed f, J_G(·, f) is bounded on G_reg(F) and locally constant (p-adic) or smooth (real) there.
- `TauCeti.weylIntegration` (relation): Weyl integration formula: ∫_{G(F)} f = Σ_T |W(G, T)(F)|⁻¹ ∫_{T(F)} |D^G(t)| O_t(f) dt over conjugacy classes of maximal tori.
- `TauCeti.orbitalIntegralLie` (other): The Lie-algebra version on 𝔤(F), including nilpotent orbital integrals for F p-adic.
- `TauCeti.orbitalIntegral_descent` (compatibility): Semisimple descent: near a semisimple γ, O^G is expressed through O^{G_γ} of a descended function on a neighbourhood of 0 in 𝔤_γ(F).
- `TauCeti.orbitalIntegralLie_conj` (simp): O_{Ad(x)X}(f) = O_X(f) and O_X(f ∘ Ad(x)⁻¹) = O_X(f) for x ∈ G(F) on 𝔤(F).

**Checks.**

- `orbitalIntegralLie_central` (degenerate): For X central in 𝔤(F) (for instance X = 0), O_X(f) = f(X) with dt = dg.
- `orbitalIntegralLie_torus` (degenerate): For G = T a torus, O_X(f) = f(X) for every X ∈ 𝔱(F).
- `orbitalIntegral_gl2_split` (computation): For G = GL_2(F), F p-adic with q residue elements, γ = diag(a, b) with a, b ∈ 𝒪^× and |a − b| = 1 and f = 1_{GL_2(𝒪)}, measures giving GL_2(𝒪) and the diagonal units volume 1: O_γ(f) = 1 (Kottwitz, Clay notes §5).
- `orbitalIntegralWaldspurger_invariant` (characterisation): O^G_{xγx⁻¹}(f) = O^G_γ(f) for x ∈ G(F), with the transported centralizer measure, and O^G_γ(f^x) = O^G_γ(f) for f^x(g) = f(xgx⁻¹).
- `orbitalIntegral_not_regular_only` (non-example): The integral over G_γ(F)\G(F) with G_γ disconnected differs from the one over G_γ^0(F)\G(F) by [G_γ(F) : G_γ^0(F)] (e.g. γ = diag(1, −1) in PGL_2), so the two conventions must not be mixed.

**Acceptance.**

- O_X(f) = f(X) for central X ∈ 𝔤(F) and for tori (the group statement is AS.6.9's test).
- For GL_2 over a p-adic field and γ = diag(a, b) with a, b ∈ 𝒪^× and |a − b| = 1, the orbital integral of 1_{GL_2(𝒪)} is 1 with the standard measures.
- Orbital integrals are invariant under conjugation of γ and of f.

*Used by:* AutomorphicSpectralTheory:AS.6/weighted-orbital-integral (AS.6 owns the unweighted group orbital integral (AS.6.9 of its package, with ET.1 retaining the endoscopic normalization) and adds the weight v_M; ET.1 imports it and owns the conventions and extensions listed here); ET.1/kappa-and-stable-orbital-integrals (κ- and stable sums of these integrals); ET.2b/hitchin-point-count (local factors of the Hitchin count are orbital integrals of unit functions); Leslie §2.2.2 (Orb(f, y) on Herm(W_1)).

*Needs:* `AutomorphicSpectralTheory:AS.6`; `AdelicAlgebraicGroups:AA.2/quotient-measure`; `AdelicAlgebraicGroups:AA.2/quotient-integral-integrable`; `AdelicAlgebraicGroups:AA.2/quotient-measure-transitivity`; `ET.0/semisimple-conjugacy`; `SmoothRepresentationsOfLocalGroups:SR.1/convolution-algebra`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`; `mathlib:MeasureTheory.Measure.IsHaarMeasure`.

<a id="et-1-kappa-and-stable-orbital-integrals"></a>

### ET.1.2 κ-orbital integrals and stable orbital integrals ★

Let F be local of characteristic 0, G connected reductive, γ ∈ G(F) strongly regular semisimple with centralizer the maximal torus T, and for each γ′ in the stable class of γ let inv(γ, γ′) ∈ D(T, G; F) be its invariant (ET.0/rational-classes-in-stable-class); measures on the centralizers T_{γ′} are transported from T. For a character κ of E(T, G; F) (equivalently an element of Kottwitz's 𝔎(T/F), ET.0/rational-classes-in-stable-class (b)) and f ∈ C_c^∞(G(F)), the κ-orbital integral is O^κ_γ(f) = Σ_{γ′} κ(inv(γ, γ′)) e(G_{γ′}) O_{γ′}(f), the sum running over representatives of the G(F)-classes in the stable class of γ (a finite set) and e the Kottwitz sign (trivial for tori; it enters for singular γ with non-quasi-split centralizers). The stable orbital integral is SO_γ(f) = O^1_γ(f). For γ semisimple but not strongly regular one sums over the rational classes in the stable class weighted by e(G_{γ′}) and the measure conventions of Kottwitz 1986 §5. Changing γ within its stable class multiplies O^κ_γ by κ(inv(γ, γ′))⁻¹, so O^κ is not a function of the stable class alone unless κ = 1; SO_γ is. A distribution on G(F) is stable if it is a limit of linear combinations of the SO_γ. The same definitions apply on the Lie algebra 𝔤(F).

The precise hypotheses are: F local of characteristic 0; γ strongly regular (singular case with Kottwitz's conventions).

([T. C. Hales, A statement of the fundamental lemma](https://arxiv.org/abs/math/0312227v2), §6.1, (6.0.1) and (6.0.2) (PDF pp. 9–10)). κ-orbital integrals with coefficients κ(a_τ) and stable orbital integrals over all stable conjugates.

([S. Leslie, The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3), §2.2.2, (2.5) and the display after it (p. 18)). Rational classes in a stable class form a D(T_y/F)-torsor trivialized by inv(y, −); Orb^κ(f, y) = Σ_{y′} κ(inv(y, y′)) Orb(f, y′) and SO = Orb^1.

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

<a id="et-1-a-data-chi-data"></a>

### ET.1.3 a-data and χ-data for the roots of a maximal torus

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

<a id="et-1-local-transfer-factor"></a>

### ET.1.4 The Langlands–Shelstad transfer factor ★

Let F be local of characteristic 0, G connected reductive with quasi-split inner form G* and inner twist ψ : G → G*, (H, ℋ, s, ξ) an endoscopic datum with a z-pair (H_1, ξ_1) (ET.0/z-pair). For a strongly G-regular γ_1 ∈ H_1(F) with image γ_H ∈ H(F) and a strongly regular δ ∈ G(F) matching it (ET.0/norm-correspondence), choose an admissible embedding T_H → T* of the centralizer of γ_H into G*, a-data and χ-data for T* (ET.1/a-data-chi-data). Define: Δ_I(γ_1, δ) = ⟨λ(T_sc), s_T⟩ (the splitting invariant λ(T_sc) ∈ H^1(F, T_sc) built from a-data paired by Tate–Nakayama with the image s_T of s); Δ_II(γ_1, δ) = ∏_α χ_α((α(γ) − 1)/a_α) over Γ-orbit representatives of roots of T outside H; Δ_III1(γ_1, δ; γ̄_1, δ̄) = ⟨inv(γ, δ; γ̄, δ̄), κ⟩, the pairing of the relative invariant in H^1(F, U) (U = T × T̄/Z(G)) with the endoscopic character; Δ_III2(γ_1, δ) = ⟨a, γ⟩ for a ∈ H^1(W_F, T̂) measuring the difference of the L-embeddings ^LT → ^LG given by χ-data and by ξ through ℋ (with the z-pair); Δ_IV(γ_1, δ) = |D_G(δ)|^{1/2}|D_H(γ_H)|^{-1/2}. The relative transfer factor Δ(γ_1, δ; γ̄_1, δ̄) = Δ_I Δ_II Δ_III1 Δ_III2 Δ_IV (ratios) is independent of all choices (Langlands–Shelstad Theorem 3.7.A). An absolute transfer factor is a function Δ(γ_1, δ) on matching pairs with Δ(γ_1, δ)Δ(γ̄_1, δ̄)⁻¹ = Δ(γ_1, δ; γ̄_1, δ̄); it is determined up to a nonzero constant. Normalizations: (i) for G quasi-split, the Langlands–Shelstad absolute factor Δ_0 = Δ_I Δ_II Δ_III2 Δ_IV (Δ_III1 trivial with base point δ̄ = δ for G = G*); (ii) Kottwitz–Shelstad 2012 (§5.1) record four variants for (H, s, ξ): the Langlands–Shelstad factor Δ, adapted to the classical local Langlands correspondence (Langlands' normalization of local class field theory, uniformizers ↔ Frobenius); its renormalization Δ_D = Δ_I Δ_II Δ_III1 Δ_III2,D Δ_IV with Δ_III2,D = ⟨γ, a(χ⁻¹)⟩⁻¹, adapted to Deligne's normalization (uniformizers ↔ inverse Frobenius); and Δ′, Δ′_D, the factors Δ, Δ_D of the datum (H, s⁻¹, ξ) regarded as factors for (H, s, ξ). The corrected twisted factors Δ_D = Δ_I^new Δ_II⁻¹ Δ_III Δ_IV and Δ′ = (Δ_I^new Δ_III)⁻¹ Δ_II Δ_IV of ET.1/twisted-transfer-factor reduce to these Δ_D and Δ′ in standard endoscopy (§§5.3–5.4); (iii) the Whittaker normalization Δ_λ fixes the constant by a Whittaker datum λ of G* through the root number ε_L(V, ψ) of the virtual representation V = X^*(T*) ⊗ ℂ − X^*(T_H) ⊗ ℂ: Δ_{λ,D} = ε_L(V, ψ) Δ_I^new Δ_II Δ_III^new Δ_IV = ε_L(V, ψ) Δ_I^new Δ_II⁻¹ Δ_III Δ_IV and Δ′_λ = ε_L(V, ψ)(Δ_I^new Δ_III)⁻¹ Δ_II Δ_IV (Kottwitz–Shelstad (5.5.1)–(5.5.2), for quasi-split G with an F-splitting preserved by θ). Every consumer records which of Δ, Δ′, Δ_D, Δ′_D and which normalization (base point or Whittaker) it uses, and which normalization of local class field theory (CFT Layer 7) is in force; the product formula (ET.1/transfer-factor-properties) does not identify two conventions without this record.

The precise hypotheses are: F local of characteristic 0; (H, ℋ, s, ξ) an endoscopic datum of G with a z-pair; δ strongly regular in G(F), γ_1 strongly G-regular in H_1(F), matching.

([R. P. Langlands and D. Shelstad, On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf), §3.1–3.7 (pp. 240–249): Δ_I (p. 241), Δ_II (p. 243), Δ_III1 (p. 245), Δ_III2 (p. 246), Δ_IV (p. 248), Theorem 3.7.A (p. 248)). The four terms of the transfer factor, the relative factor and its independence of admissible embeddings, a-data and χ-data.

([R. Kottwitz and D. Shelstad, On splitting invariants and sign conventions in endoscopic transfer](https://arxiv.org/abs/1201.5658v1), Introduction (PDF pp. 1–2), (1.0.3)–(1.0.4); §4.1 and §4.3 (PDF pp. 10–11); §§5.1–5.5 (PDF pp. 12–15)). The sign error in the χ-data dependence of Δ_II and Δ_III in the 1999 definition, the corrected factors Δ_D and Δ′ for the two normalizations of local class field theory, their relation through (H, s⁻¹, ξ), and the Whittaker-normalized Δ_{λ,D} and Δ′_λ.

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), §5.3, pp. 33–35 (arXiv v5)). Relative factors and absolute normalizations with explicit conventions; a ratio identity fixes the absolute factor only up to a constant.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.4 (pp. 10–11)). The Kottwitz–Shelstad relative factor Δ(γ_1, δ; γ̄_1, δ̄) on 𝒟_1 × 𝒟_1 and the choice of an absolute factor compatible with it.

Δ_I: Langlands–Shelstad §3.2 (p. 241), λ(T_sc) from the a-data splitting (§2.3) and Tate–Nakayama pairing (ET.0/tate-nakayama-tori).

Δ_II: §3.3 (p. 243); Δ_III1: §3.4 (p. 245), a relative term pairing an invariant with κ; Δ_III2: §3.5 (p. 246), built from χ-data through the L-embedding of §2.6; Δ_IV: §3.6 (p. 248), the quotient of Weyl discriminants.

Independence of the product of choices: Theorem 3.7.A (p. 248), proved by computing how each term changes with the admissible embedding, a-data and χ-data (Lemmas of §§3.2–3.5).

Sign corrections: Kottwitz–Shelstad 2012 show the 1999 twisted factor is not independent of χ-data unless Δ_II or Δ_III enters with exponent −1 (introduction, PDF p. 2), define Δ_D and Δ′ ((1.0.3), (1.0.4); §§5.3–5.4) and their Whittaker-normalized versions ((5.5.1)–(5.5.2), §5.5); for standard endoscopy they list the four variants Δ, Δ_D, Δ′, Δ′_D (§5.1, (5.1.1)–(5.1.2)).

Conventions on local class field theory and Frobenius: KS 2012 §4.1 (Deligne's vs Langlands' reciprocity), with the upstream ClassFieldTheory Layer 7 normalizations recorded as the ones in force.

The definition exposes the following operations and relations.

- `TauCeti.TransferFactor.relative` (data): Δ(γ_1, δ; γ̄_1, δ̄) on pairs of matching pairs.
- `TauCeti.TransferFactor.relative_independent` (characterisation): Independence of admissible embeddings, a-data and χ-data (LS Theorem 3.7.A).
- `TauCeti.TransferFactor` (data): An absolute transfer factor: a function on matching pairs whose ratios are the relative factor.
- `TauCeti.TransferFactor.unique_up_to_const` (extensionality): Two absolute factors differ by a nonzero constant.
- `TauCeti.TransferFactor.whittaker` (constructor): The Whittaker-normalized factors Δ_{λ,D} and Δ′_λ attached to a Whittaker datum of G*.
- `TauCeti.TransferFactor.convention` (other): The tag (Δ, Δ′, Δ_D or Δ′_D; base point or Whittaker; local CFT normalization) carried with every factor.
- `TauCeti.TransferFactor.inv_s` (relation): Δ′ and Δ′_D for (H, s, ξ) are the factors Δ and Δ_D of (H, s⁻¹, ξ).
- `TauCeti.TransferFactor.stablyConj` (relation): Δ(γ_1, δ′) = ⟨inv(δ, δ′), κ⟩⁻¹ Δ(γ_1, δ).
- `TauCeti.TransferFactor.terms` (projection): The terms Δ_I, Δ_II, Δ_III1, Δ_III2, Δ_IV for fixed auxiliary data.

**Checks.**

- `transferFactor_principal_quasiSplit` (degenerate): For H = G = G* quasi-split, s = 1, the relative factor is identically 1, and Δ_0(γ, δ) = 1 for δ stably conjugate to γ.
- `transferFactor_relative_cocycle` (characterisation): Δ(γ_1, δ; γ̄_1, δ̄) Δ(γ̄_1, δ̄; γ̃_1, δ̃) = Δ(γ_1, δ; γ̃_1, δ̃).
- `transferFactor_stable_conj` (characterisation): Replacing δ by a stably conjugate δ′ gives Δ(γ_1, δ′) = ⟨inv(δ, δ′), κ⟩⁻¹ Δ(γ_1, δ) for the endoscopic character κ.
- `transferFactor_sl2_torus` (computation): For G = SL_2, H = R^1_{E/F} G_m and a matching pair (u, δ) with u ∈ E^1 regular, D_H(u) = 1 and D_G(δ) = −(u − ū)²/(uū), so |Δ_IV(u, δ)| = |(u − ū)²|_F^{1/2}; between the two rational classes in the stable class of δ the factor changes by the nontrivial character of D(T, SL_2; F) = ℤ/2.
- `transferFactor_D_vs_prime` (non-example): Δ_D and Δ′ for the same datum are not equal in general: their ratio is (Δ_I^new Δ_III)² Δ_II⁻², nontrivial for the twisted GL_n ⋊ θ case (ET.1/twisted-transfer-factor).

**Acceptance.**

- For H = G = G* and s = 1 the relative factor is 1.
- The relative factor satisfies the cocycle identity for three matching pairs.
- For SL_2 and the elliptic torus datum, |Δ_IV(u, δ)| = |(u − ū)²|_F^{1/2} and the factor changes by the nontrivial character between the two rational classes.

*Used by:* ET.1/matching-functions (the matching identity SO_{γ_1}(f^H) = Σ_δ Δ(γ_1, δ) O_δ(f)); ET.3/local-transfer-existence (transfer of all test functions); ET.4 (the stabilization of the elliptic terms uses the global product formula); GL2AutomorphicRepresentationsAndTransfer:R17.2/cyclic-local-matching (transfer-factor conventions for GL_2 ordinary, inner-form and cyclic twisted transfer); Shin 2011 §3.4 (transfer factors for unitary similitude groups).

*Needs:* `ET.0/endoscopic-datum`; `ET.0/z-pair`; `ET.0/norm-correspondence`; `ET.0/tate-nakayama-tori`; `ET.0/rational-classes-in-stable-class`; `ET.0/inner-twist`; `ET.1/a-data-chi-data`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

<a id="et-1-transfer-factor-properties"></a>

### ET.1.5 Transport, descent, central extensions and the global product formula

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

<a id="et-1-twisted-transfer-factor"></a>

### ET.1.6 Twisted transfer factors and the Kottwitz–Shelstad corrections

Let F be local of characteristic 0, (G, θ, ω) a twisted triple with θ quasi-semisimple, (H, ℋ, s, ξ) a twisted endoscopic datum (ET.0/endoscopic-datum) with z-pair (H_1, ξ_1, ξ̂_1), and 𝒟_1 the set of matching pairs (γ_1, δ) of strongly G-regular γ_1 ∈ H_{1,z}(F) and strongly θ-regular δ ∈ G(F) (ET.0/norm-correspondence). The twisted transfer factor is built from twisted a-data and χ-data for the restricted roots of (T, θ), the twisted splitting invariant (Kottwitz–Shelstad 2012 §2.2, Lemma 2.2.1, Proposition 2.2.3) and the analogues of Δ_II, Δ_III, Δ_IV: (1) the corrected factors Δ_D = Δ_I^new Δ_II⁻¹ Δ_III Δ_IV (compatible with Deligne's normalization of local class field theory) and Δ′ = (Δ_I^new Δ_III)⁻¹ Δ_II Δ_IV (compatible with Langlands' classical normalization), where the 1999 product Δ_I Δ_II Δ_III Δ_IV is not independent of χ-data; (2) the new term Δ_I^new = ⟨λ_{a}(T, θ), s_{T,θ}⟩ uses the twisted splitting invariant; it agrees with Δ_I unless the restricted root system is non-reduced (some power θ^i preserves an irreducible component of type A_{2n} and acts on it by a nontrivial diagram automorphism), for instance θ = transpose-inverse (up to inner automorphisms) on GL(2n + 1), and never differs for cyclic base change; (3) the Whittaker-normalized twisted factors Δ_{λ,D} and Δ′_λ. The relative factor Δ(γ_1, δ; γ̄_1, δ̄) is independent of all auxiliary choices and transforms under Z_1(F) by λ_1; an absolute factor is fixed by a base point or a Whittaker datum. For cyclic base change (G = R_{E/F} G_0, θ a generator of Gal(E/F), ω = 1) with H the quasi-split inner form of G_0 and s = 1, the transfer factor of the norm correspondence is 1 on pairs (γ, δ) with γ a norm of δ (Labesse's normalization of association, §3.2).

The precise hypotheses are: F local of characteristic 0; (G, θ, ω) twisted triple and (H, ℋ, s, ξ) a twisted endoscopic datum with z-pair.

([R. Kottwitz and D. Shelstad, On splitting invariants and sign conventions in endoscopic transfer](https://arxiv.org/abs/1201.5658v1), Introduction (PDF pp. 1–2); §2.2, Lemma 2.2.1 (PDF p. 4), Proposition 2.2.3 (PDF p. 5); §§3.3–3.5, Proposition 3.5.2 (PDF pp. 7–9); §§5.3–5.6, (5.3.1), (5.4.1), (5.5.1)–(5.5.2) (PDF pp. 13–16)). The twisted splitting invariant, the new term Δ_I^new and its comparison with Δ_I, the corrected twisted factors Δ_D and Δ′ and their Whittaker-normalized forms; the GL(2n+1) transpose-inverse case and the equality Δ_I^new = Δ_I for cyclic base change.

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

*Used by:* ET.4 (the twisted unitary trace formula for cyclic base change); ET.3/twisted-fundamental-lemma-and-transfer (the twisted fundamental lemma and transfer are stated with these factors); ModularityAndLanglandsExtensions:ML.4 (the stabilization behind Arthur's classification uses twisted endoscopy of GL_n ⋊ θ).

*Needs:* `ET.1/local-transfer-factor`; `ET.1/a-data-chi-data`; `ET.0/endoscopic-datum`; `ET.0/z-pair`; `ET.0/norm-correspondence`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`.

<a id="et-1-lie-algebra-transfer-factor"></a>

### ET.1.7 Transfer factors for Lie algebras

Let F be local of characteristic 0 (or a local field of characteristic p not dividing |W| in the equal-characteristic setting of Ngô), G quasi-split connected reductive and (H, s, ξ) an endoscopic datum (no z-pair is needed on the Lie algebra). Matching of regular semisimple elements of 𝔥(F) and 𝔤(F) is the Lie-algebra version of ET.0/norm-correspondence (stable classes on both sides, ET.0/semisimple-conjugacy). The Lie-algebra transfer factor Δ(X_H, X) on matching regular semisimple pairs is defined as in Langlands–Shelstad with Δ_II, Δ_III2 replaced by their infinitesimal versions; on the stable class matching a given X_H it has the form Δ(X_H, X) = κ(inv(X_0, X))·Δ_IV(X_H, X)·c(X_H) for a base point X_0 = X_0(X_H) in that stable class, with Δ_IV(X_H, X) = |D_G(X)|^{1/2}|D_H(X_H)|^{-1/2}, inv the invariant of ET.0/rational-classes-in-stable-class and c(X_H) a nonzero number that depends on X_H and on the choice of base point. The relative factor is independent of choices; for quasi-split G the base point can be chosen uniformly in the stable class (the Kostant-section normalization of Kottwitz, used to state Ngô's theorem, is recorded with ET.3/lie-algebra-fundamental-lemma). The relative discriminant r_{G,H}(X_H) = val(D_G(X))/2 − val(D_H(X_H))/2 measures |Δ_IV|. Near the identity the group transfer factor of ET.1/local-transfer-factor descends to this Lie-algebra factor up to a constant (ET.1/transfer-factor-properties (e)). For unitary groups the factor takes the explicit form of ET.1/unitary-transfer-factor.

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

<a id="et-1-matching-functions"></a>

### ET.1.8 Matching test functions and transfer classes ★

Let F be local of characteristic 0, (G, θ, ω) with endoscopic datum (H, ℋ, s, ξ), z-pair (H_1, λ_1) and an absolute transfer factor Δ (ET.1/local-transfer-factor, ET.1/twisted-transfer-factor). For f ∈ C_c^∞(G(F)) define O^{G,ω}_{γ_1}(f) = Σ_δ Δ(γ_1, δ) O^ω_δ(f), the sum over representatives of G(F)-classes (θ-classes) of δ matching γ_1. A function f^{H_1} ∈ C_1^∞(H_1(F)) (locally constant, compactly supported modulo Z_1(F), with f(zx) = λ_1(z)⁻¹ f(x)) is a transfer of f, written f ↔ f^{H_1}, if SO_{γ_1}(f^{H_1}) = O^{G,ω}_{γ_1}(f) for every strongly G-regular γ_1 ∈ H_{1,z}(F), and SO_{γ_1}(f^{H_1}) = 0 when no δ matches γ_1. A transfer, if it exists, is unique only modulo the subspace of functions all of whose strongly regular stable orbital integrals vanish; the canonical object is the class of f^{H_1} in the space SI(H_1) of stable orbital integrals (the quotient of C_1^∞(H_1(F)) by that kernel), and the transfer map f ↦ [f^{H_1}] is linear. The same definition applies to Lie algebras (no z-pair) and, at archimedean places, to K-finite or Schwartz functions. For cyclic base change, f ∈ C_c^∞(G_0(E)) and f^H ∈ C_c^∞(H(F)) are associated if SO_γ(f^H) = SO_δ^θ(f) whenever γ is a norm of δ and SO_γ(f^H) = 0 when γ is not a norm (Labesse §3.2).

The precise hypotheses are: F local of characteristic 0; an endoscopic datum with z-pair and an absolute transfer factor.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §1.5 (pp. 11–12)). The endoscopic orbital integral O^{G,ω}_{γ_1}, the stable orbital integral SO_{γ_1}, the definition of transfer on C_1^∞(H_{1,z}(F)) and the transfer conjecture.

([S. Leslie, The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3), §2.2.3 (p. 19)). Smooth transfer on Herm(W_1): SO(f_{a,b}, (y_a, y_b)) = Δ((y_a, y_b), y) Orb^κ(f, y) for matching pairs and 0 when no y matches.

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
- `transfer_not_function` (non-example): The transfer is not a well-defined function on H_1(F): adding any nonzero function whose strongly regular stable orbital integrals all vanish gives another transfer; for H_1 = SL_2 over a p-adic field, such a function is φ_1 − φ_2 with φ_1, φ_2 supported near the two rational classes of a regular elliptic stable class and having equal orbital integrals there.

**Acceptance.**

- For the principal datum of quasi-split G, f is a transfer of itself.
- Two transfers of f have the same stable orbital integrals.
- In the unramified situation the unit function of H(𝒪) is a transfer of that of G(𝒪) (ET.3/group-fundamental-lemma).

*Used by:* ET.3/local-transfer-existence (existence of a transfer for every f); ET.3/lie-algebra-fundamental-lemma (the unit function of 𝔥(𝒪) is a transfer of that of 𝔤(𝒪)); ET.4 (matching test functions in the stable trace formula); GL2AutomorphicRepresentationsAndTransfer:R17.2/specialized-trace-comparison (matching for GL_2 ordinary, inner-form and cyclic transfer).

*Needs:* `ET.1/local-transfer-factor`; `ET.1/twisted-transfer-factor`; `ET.1/kappa-and-stable-orbital-integrals`; `ET.1/orbital-integral`; `ET.0/norm-correspondence`; `ET.0/z-pair`.

<a id="et-1-shalika-germs"></a>

### ET.1.9 Shalika germs on p-adic Lie algebras

Let F be a p-adic field and G connected reductive over F with Lie algebra 𝔤. (a) The set of nilpotent G(F)-orbits in 𝔤(F) is finite, and each nilpotent orbit 𝒪 carries an invariant Radon measure μ_𝒪 extending to 𝔤(F) (nilpotent orbital integrals). (b) (Germ expansion) There are functions Γ_𝒪 on 𝔤_rs(F) (Shalika germs), one for each nilpotent orbit, such that for every f ∈ C_c^∞(𝔤(F)) there is a neighbourhood U_f of 0 with O_X(f) = Σ_𝒪 Γ_𝒪(X) μ_𝒪(f) for all X ∈ U_f ∩ 𝔤_rs(F); the germs are uniquely determined as germs at 0. (c) (Homogeneity) For t ∈ F^×, Γ_𝒪(t²X) = |t|^{−dim 𝒪} Γ_𝒪(X) (after normalizing measures compatibly); equivalently the normalized germs Γ̄_𝒪 = |D|^{1/2} Γ_𝒪 satisfy Γ̄_𝒪(t²X) = |t|^{dim G^{X_𝒪} − rank G} Γ̄_𝒪(X) for X_𝒪 ∈ 𝒪 (Kottwitz (17.11.2)). In particular the germ Γ_0 of the zero orbit is homogeneous of degree 0, and the normalized regular germ Γ̄_reg is homogeneous of degree 0 and constant on each Cartan subalgebra (Shalika), so the regular germ Γ_reg is a constant multiple of |D|^{−1/2} there. (d) (Descent) Near a semisimple element, orbital integrals have an expansion in terms of the germs of the centralizer (semisimple descent).

The precise hypotheses are: F p-adic of characteristic 0 (the germ expansion also holds in large positive characteristic as used by Waldspurger 2006).

([R. E. Kottwitz, Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §5.9 (pp. 417–418); §6 'Shalika germs' (p. 418); §15 'Harish-Chandra's compactness lemma' (p. 457); §16 'Semisimple descent' (p. 458); §17 'Basic results on Shalika germs on 𝔤' (p. 459); §27 'Deeper results on Shalika germs' (p. 512); (17.11.2) (p. 465)). The germ expansion of orbital integrals near 0 in terms of nilpotent orbital integrals, its uniqueness and homogeneity, and semisimple descent.

([J.-L. Waldspurger, Endoscopie et changement de caractéristique](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopie.pdf), Introduction and §7 (Théorème 7.2, p. 62)). Orbital integrals of functions attached to Moy–Prasad lattices depend on F only through its residue field; their germ behaviour is the input of the change of characteristic.

(a) Finiteness of nilpotent orbits and the Deligne–Ranga Rao measures (Kottwitz, Clay notes §17).

(b) Shalika's germ expansion: Kottwitz, Clay notes §6 (for GL_2 and in general) and §17 'Basic results on Shalika germs on 𝔤', via Harish-Chandra's compactness lemma (§15) and the density of regular orbital integrals.

(c) Homogeneity from the scaling X ↦ t²X and the dimension of 𝒪 (Kottwitz, Clay notes §17); deeper results in §27.

(d) Semisimple descent (Kottwitz, Clay notes §16).

**Acceptance.**

- For 𝔤 = 𝔤𝔩_2, the nilpotent orbits are {0} and the regular one; on an elliptic Cartan subalgebra the germ Γ_0 of {0} is constant and the regular germ is a constant multiple of |D(X)|^{−1/2} (Kottwitz's GL_2 computation, §5.9: for elliptic γ ∈ GL_2(𝒪) the coefficient of the identity orbit is −2/(q − 1), independent of γ, while that of the regular unipotent orbit grows like q^{d_γ}).
- For 𝔤 = 𝔱 a torus there is one nilpotent orbit {0} and Γ_0 = 1.

*Needs:* `ET.1/orbital-integral`; `tauceti:TauCetiRoadmap/ReductiveGroups#layer-2-lie-algebra-and-the-adjoint-representation`.

<a id="et-1-fourier-transform-orbital-integrals"></a>

### ET.1.10 Fourier transforms of orbital integrals and their compatibility with transfer

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

<a id="et-1-unitary-transfer-factor"></a>

### ET.1.11 The transfer factor for unitary Lie algebras

Let E/F be an unramified quadratic extension of p-adic fields (p odd), V, V_a, V_b Hermitian spaces with a + b = n and the elliptic endoscopic datum (U(V_a) × U(V_b), s, ξ) of U(V) (ET.0/unitary-elliptic-endoscopic-data, local version). For matching regular semisimple δ ∈ Herm(V) and (δ_a, δ_b) (ET.0/unitary-hermitian-matching) let D(δ) = ∏_{x_a, x_b}(x_a − x_b), the product over the eigenvalues x_a of δ_a and x_b of δ_b (the quotient of Weyl discriminants of Langlands–Shelstad's Δ_IV). For a nice matching pair (δ = φ_{a,b}(δ_a, δ_b), V ≅ V_a ⊕ V_b) the transfer factor is Δ((δ_a, δ_b), δ) = η_{E/F}(D(δ))|D(δ)|_F, and in general Δ((δ_a, δ_b), δ) = κ(inv(δ, δ′)) η_{E/F}(D(δ))|D(δ)|_F with δ′ = φ_{a,b}(δ_a, δ_b) and κ the endoscopic character (ET.0/unitary-hermitian-matching (c)). Δ vanishes on non-matching pairs and Δ((δ_a, δ_b), δ) Orb^κ(f, δ) depends only on the stable class of δ. This is the specialization of ET.1/lie-algebra-transfer-factor to unitary Lie algebras, in the normalization used by Laumon–Ngô and Leslie.

The precise hypotheses are: E/F unramified quadratic, p odd; the endoscopic datum U(V_a) × U(V_b) of U(V).

([S. Leslie, The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3), §2.2.3, (2.7) and Remark 2.8 (pp. 18–19)). The transfer factor for Herm(W_1): η_{E/F}(D(δ))|D(δ)|_F for nice matching pairs and κ(inv(δ, δ′)) times it in general; D(δ) is the quotient of Weyl discriminants of Δ_IV.

([G. Laumon and B. C. Ngô, Le lemme fondamental pour les groupes unitaires](https://arxiv.org/abs/math/0404454v2), §1.5, Théorème 1.5.1 (PDF p. 10)). The unitary Lie-algebra fundamental lemma O^κ_γ = (−1)^r q^r SO^H_γ uses this normalization.

Specialize the Lie-algebra factor: Δ_IV gives |D(δ)| and the remaining terms combine to the quadratic character η_{E/F}(D(δ)) for the base point given by nice matching pairs (Leslie Remark 2.8 and its Appendix A of a companion paper, cited there).

Behaviour under stable conjugacy: ET.1/lie-algebra-transfer-factor and ET.0/unitary-hermitian-matching (c).

**Acceptance.**

- n = 2, a = b = 1: δ_a = x, δ_b = y with x ≠ y in F, D = x − y, Δ = η_{E/F}(x − y)|x − y|_F on the nice pair.
- a = n, b = 0 (the principal datum): D = 1 and Δ = 1.

*Needs:* `ET.1/lie-algebra-transfer-factor`; `ET.0/unitary-hermitian-matching`; `ET.0/unitary-elliptic-endoscopic-data`.

<a id="et-1-real-character-theory"></a>

### ET.1.12 Harish-Chandra's character theory for real reductive groups

Let G be a connected reductive group over ℝ (more generally a real reductive group in the sense of AutomorphicFormsOnReductiveGroups:AF.1/real-reductive-group), K a maximal compact subgroup and π a finite-length admissible representation of G(ℝ) (an admissible (𝔤, K)-module with its Casselman–Wallach globalization). (a) For f ∈ C_c^∞(G(ℝ)), π(f) is trace class, and Θ_π(f) = tr π(f) is a conjugation-invariant distribution, an eigendistribution of the centre Z(𝔤) of U(𝔤_ℂ) acting through the infinitesimal character of π when π has one. (b) (Harish-Chandra's regularity theorem) Θ_π is a locally integrable function on G(ℝ), real-analytic on the set G_reg(ℝ) of strongly regular elements: Θ_π(f) = ∫_{G_reg(ℝ)} f(x)Θ_π(x) dx. (c) |D(x)|^{1/2}Θ_π(x) is locally bounded, and on each Cartan subgroup Θ_π is a finite combination of exponentials divided by the Weyl denominator; for discrete series π with Harish-Chandra parameter λ, on the compact Cartan T: Θ_π = (−1)^{q(G)} Σ_{w ∈ W_K} ε(w) e^{wλ}/Δ, and Harish-Chandra's algorithm determines Θ_π on the other Cartan subgroups. (d) Characters determine finite-length representations up to semisimplification, and the characters of the tempered irreducible representations are linearly independent.

The precise hypotheses are: G connected reductive over ℝ (all real reductive groups, not only the unitary groups of ET.4–ET.7); π of finite length, admissible.

([J. Arthur, An introduction to the trace formula](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §24 (pp. 157–160)). The character of a real irreducible representation is the distribution f ↦ tr π(f); Harish-Chandra proved it is a locally integrable function analytic on the strongly regular set, with a Weyl-type formula for discrete series on the compact torus and an algorithm for other tori.

([T. Kaletha, Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5), §§5.1, 5.6 (arXiv v5)). Trace distributions of finite-length admissible representations of real reductive groups, their invariance and representability by the regular semisimple character function.

(a) Trace class property and invariance from admissibility (AutomorphicFormsOnReductiveGroups:AF.1/harish-chandra-admissibility) and the Casselman–Wallach globalization (AF.1/casselman-wallach-globalization).

(b)–(c) Harish-Chandra's regularity theorem for invariant eigendistributions (Harish-Chandra, 'Invariant eigendistributions on a semisimple Lie group', Trans. AMS 119 (1965), not read: the AMS copy refused automated access); the statement is the one recalled by Arthur (Clay introduction §24, pp. 158–159) and required by Kaletha. The discrete series character formula on the compact Cartan is part of Harish-Chandra's classification (AF.1/discrete-series).

(d) Linear independence of characters: standard consequence of (b) and the Langlands classification (AF.1/langlands-classification).

**Acceptance.**

- For G = U(1) = SO(2): Θ_{χ_k}(e^{iθ}) = e^{ikθ}.
- For G = SL_2(ℝ) and the discrete series D_k^±: on the compact Cartan, Θ_{D_k^+} + Θ_{D_k^−} = −(e^{i(k−1)θ} − e^{−i(k−1)θ})/(e^{iθ} − e^{−iθ}), the negative of the character of the (k−1)-dimensional representation.

*Needs:* `AutomorphicFormsOnReductiveGroups:AF.1/real-reductive-group`; `AutomorphicFormsOnReductiveGroups:AF.1/admissible-gk-module`; `AutomorphicFormsOnReductiveGroups:AF.1/harish-chandra-admissibility`; `AutomorphicFormsOnReductiveGroups:AF.1/casselman-wallach-globalization`; `AutomorphicFormsOnReductiveGroups:AF.1/discrete-series`; `AutomorphicFormsOnReductiveGroups:AF.1/langlands-classification`; `AutomorphicFormsOnReductiveGroups:AF.1/infinitesimal-character`.

<a id="et-1-real-transfer"></a>

### ET.1.13 Transfer at the real place

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

<a id="et-1-pseudocoefficients"></a>

### ET.1.14 Pseudo-coefficients and Euler–Poincaré functions at the real place

Let G be connected reductive over ℝ with A_G the split component of the centre, ξ an irreducible finite-dimensional algebraic representation of G_ℂ with central character χ on A_G(ℝ)^0, and q(G) = ½ dim(G(ℝ)/K_∞A_G(ℝ)^0). Assume G(ℝ) has discrete series modulo A_G(ℝ)^0 (equivalently a maximal ℝ-torus anisotropic modulo A_G). (a) (Clozel–Delorme; imported from AutomorphicSpectralTheory AS.6, targets AS.6.18–AS.6.19 of its package, which moved them below this roadmap in the upstream order) For each discrete series π (modulo the centre) there is a pseudo-coefficient φ_π ∈ C_c^∞(G(ℝ), χ⁻¹), K-finite, with tr π′(φ_π) = 1 if π′ ≅ π and 0 for every other irreducible tempered π′ with the same central character, and tr π′(φ_π) given by the Euler–Poincaré pairing for non-tempered π′; AS.6 also supplies a test function with tr π′ = Σ_i (−1)^i dim H^i(𝔤, K_∞; π′ ⊗ ξ) for every finite-length π′. (b) For the L-packet Π(ξ^∨) of discrete series with the infinitesimal character of ξ^∨, the Euler–Poincaré function φ_ξ = |Π(ξ^∨)|⁻¹ Σ_{π ∈ Π(ξ^∨)} φ_π satisfies tr π′(φ_ξ) = (−1)^{q(G)} |Π(ξ^∨)|⁻¹ Σ_i (−1)^i dim H^i(𝔤, K_∞; π′ ⊗ ξ) for every irreducible admissible π′ with the given central character. Put f_ξ = (−1)^{q(G)} |Π(ξ^∨)| φ_ξ (Kottwitz's Euler–Poincaré function, tr π′(f_ξ) = Σ_i (−1)^i dim H^i(𝔤, K_∞; π′ ⊗ ξ)). The orbital integrals of f_ξ vanish at regular semisimple elements that are not elliptic, and at an elliptic semisimple γ, O_γ(f_ξ) = (−1)^{q(G_γ)} vol(Ḡ_γ(ℝ)/A_G(ℝ)^0)⁻¹ tr ξ(γ), with Ḡ_γ the inner form of G_γ that is compact modulo A_G, its Haar measure transported from that of G_γ(ℝ), and q(G_γ) defined like q(G); for regular elliptic γ the sign is 1, and SO_γ(f_ξ) is the sum of these values over the rational classes in the stable class of γ, with the signs of ET.1/kappa-and-stable-orbital-integrals. (c) The construction applies to every inner form of a quasi-split group of arbitrary signature at ∞ (needed for the unitary groups of Caraiani–Scholze), and to a twisted space (Labesse's Lefschetz functions for base change).

The precise hypotheses are: G connected reductive over ℝ with discrete series modulo the centre; ξ irreducible algebraic.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.5, (3.11)–(3.12) (pp. 17–18); §3.6, Lemma 3.7, (3.13)–(3.15) and Remark 3.9 (pp. 18–19)). Pseudo-coefficients φ_π of discrete series, the averaged function φ_{φ_H} over an L-packet (an Euler–Poincaré function), q(G), and the credit to Clozel–Delorme for existence and to Labesse for the twisted analogue.

([J. Arthur, An introduction to the trace formula](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §24, (24.2)–(24.4) (pp. 159–160)). Discrete series characters on elliptic tori, the function Φ′_M(μ, γ) built from them and the global term χ(M_γ) with q(M_γ).

([A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1), arXiv v1: §5.2, p. 74; §5.3, pp. 75–76 (published Annals pp. 735, 737–738, not read)). The archimedean test functions as precise linear combinations of Euler–Poincaré functions and pseudo-coefficients, Labesse's Lefschetz functions for base change, and the remark that the inner form at infinity is more general than the Harris–Taylor signature of Shin's paper.

(a) is imported from AutomorphicSpectralTheory AS.6 (requested; AS.6.18–AS.6.19 of its package, after Clozel–Delorme 1990 §5.2). Clozel–Delorme's invariant Paley–Wiener theorem (Invent. Math. 77 (1984); Ann. Sci. ÉNS 1990) gives functions with prescribed tempered traces; not read, recalled by Shin (p. 18–19: credits Clozel–Delorme for existence) and Arthur (§24).

(b) The Euler–Poincaré property follows from Wigner's lemma (AutomorphicFormsOnReductiveGroups:AF.4/wigner-lemma) and Vogan–Zuckerman (AF.4/vogan-zuckerman), with q(G) as in AF.4/l0-q0-invariants. Orbital integrals at elliptic elements: for regular elliptic γ with centralizer T, O_γ(φ_π) = vol(T(ℝ)/A_G(ℝ)^0)⁻¹ Θ_π(γ⁻¹) (Weyl integration formula and the orthogonality of discrete series characters), and Σ_{π ∈ Π(ξ^∨)} Θ_π(γ⁻¹) = (−1)^{q(G)} tr ξ(γ) on the compact Cartan, so O_γ(f_ξ) = vol(T(ℝ)/A_G(ℝ)^0)⁻¹ tr ξ(γ); at a singular elliptic γ the sign (−1)^{q(G_γ)} of Arthur's global term (24.4) appears, which for central γ is (−1)^{q(G)}, the sign of f_ξ(1) = (−1)^{q(G)} Σ_π d(π) with d(π) the formal degrees; the discrete series characters vanish on non-elliptic tori after summing over the packet (Arthur §24 (24.2)–(24.4); Shin (3.12), (3.14)).

(c) The construction does not use quasi-splitness; the arbitrary-signature case is required by Caraiani–Scholze (compact paper, §5.2, p. 735).

The definition exposes the following operations and relations.

- `TauCeti.pseudoCoefficient` (compatibility): A pseudo-coefficient φ_π of a discrete series π, as constructed in AutomorphicSpectralTheory AS.6 (AS.6.18), imported; only its traces and orbital integrals are canonical.
- `TauCeti.eulerPoincareFunction` (constructor): φ_ξ = |Π(ξ^∨)|⁻¹ Σ φ_π.
- `TauCeti.trace_pseudoCoefficient` (characterisation): Trace identities of φ_π on tempered representations (AS.6.18, imported).
- `TauCeti.trace_eulerPoincare` (characterisation): tr π′(φ_ξ) = EP(π′ ⊗ ξ)/|Π(ξ^∨)|.
- `TauCeti.orbitalIntegral_eulerPoincare` (relation): O_γ(f_ξ) = (−1)^{q(G_γ)} vol(Ḡ_γ(ℝ)/A_G(ℝ)^0)⁻¹ tr ξ(γ) for elliptic semisimple γ, and O_γ(f_ξ) = 0 for regular non-elliptic γ.
- `TauCeti.eulerPoincare_innerForm` (compatibility): The construction for every inner form, compatible with transfer to the quasi-split form.

**Checks.**

- `eulerPoincare_trace_trivial` (computation): For G = SL_2(ℝ) and ξ trivial: q(G) = 1, Π(ξ^∨) = {D_2^+, D_2^−}, the trivial representation has (𝔤, K)-cohomology ℂ in degrees 0 and 2, so tr 1(φ_ξ) = (−1)·2/2 = −1, while tr D_2^±(φ_ξ) = (−1)·(−1)/2 = 1/2.
- `pseudocoefficient_trace` (characterisation): tr π(φ_π) = 1 and tr π′(φ_π) = 0 for tempered π′ ≇ π with the same central character (the property of AS.6.18, checked on the imported functions).
- `eulerPoincare_compact` (degenerate): If G(ℝ) is compact (A_G trivial), q(G) = 0, Π(ξ^∨) = {ξ^∨} and f_ξ = vol(G(ℝ))⁻¹ tr ξ, so O_γ(f_ξ) = vol(G_γ(ℝ))⁻¹ tr ξ(γ) by Schur orthogonality.
- `eulerPoincare_sl2_elliptic` (computation): For G = SL_2(ℝ), ξ trivial and γ regular elliptic with centralizer T = SO(2): O_γ(f_ξ) = vol(T(ℝ))⁻¹ > 0, and SO_γ(f_ξ) = 2 vol(T(ℝ))⁻¹ (two rational classes); the sign (−1)^{q(G)} = −1 appears only at central γ, where f_ξ(±1) = −(d(D_2^+) + d(D_2^−)).
- `eulerPoincare_nonelliptic_vanish` (non-example): O_γ(φ_ξ) = 0 for γ regular semisimple non-elliptic (e.g. hyperbolic elements of SL_2(ℝ)), so φ_ξ is not a positive multiple of a function concentrated near the identity.

**Acceptance.**

- For SL_2(ℝ) and ξ trivial, tr 1(φ_ξ) = −1 and tr D_2^±(φ_ξ) = 1/2.
- For compact G(ℝ), f_ξ = vol(G(ℝ))⁻¹ tr ξ and O_γ(f_ξ) = vol(G_γ(ℝ))⁻¹ tr ξ(γ).
- Orbital integrals of f_ξ vanish at regular non-elliptic elements.

*Used by:* ET.1/archimedean-pseudocoefficient-transfer (transfer of φ_ξ to endoscopic groups); AutomorphicSpectralTheory:AS.6/general-euler-poincare (AS.6 owns pseudo-coefficients and the Euler–Poincaré trace identity (AS.6.18–AS.6.19 of its package, moved below this roadmap in the upstream order); this node imports them and adds the packet averages, their orbital integrals and the inner-form and twisted versions that endoscopic transfer uses); ET.4 (the infinity component of the test functions in the simple twisted trace formula).

*Needs:* `AutomorphicSpectralTheory:AS.6`; `ET.1/real-character-theory`; `ET.1/kappa-and-stable-orbital-integrals`; `ET.0/kottwitz-sign`; `AutomorphicFormsOnReductiveGroups:AF.1/discrete-series`; `AutomorphicFormsOnReductiveGroups:AF.4/wigner-lemma`; `AutomorphicFormsOnReductiveGroups:AF.4/vogan-zuckerman`; `AutomorphicFormsOnReductiveGroups:AF.4/l0-q0-invariants`.

**Supplier boundary.** The current AutomorphicSpectralTheory package §6.18 supplies pseudo-coefficients with the specified standard-module and tempered trace property, while §6.19 supplies a separate general Euler–Poincaré test function. Its statements do not themselves prove the asserted Euler–Poincaré pairing for every non-tempered representation of an individual pseudo-coefficient, or identify the packet average with that general test function. Retain the primary-proof and normalization obligation for those extra assertions.

<a id="et-1-archimedean-pseudocoefficient-transfer"></a>

### ET.1.15 Transfer of Euler–Poincaré functions to endoscopic groups

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

<a id="et-2b-chevalley-quotient"></a>

### ET.2b.1 The Chevalley quotient and the characteristic map

Let k be a field and G a connected reductive group over k, split over k̄ with maximal torus T, Lie algebras 𝔤 ⊇ 𝔱 and Weyl group W, and assume char(k) does not divide |W|. (a) (Chevalley restriction) Restriction of functions gives an isomorphism k[𝔤]^G ≅ k[𝔱]^W, and k[𝔱]^W is a polynomial algebra on homogeneous generators a_1, …, a_r of degrees e_1, …, e_r (the exponents plus one); put 𝔠 = Spec k[𝔱]^W ≅ 𝔸^r, with the G_m-action of weights e_i, and χ : 𝔤 → 𝔠 the characteristic map. (b) χ is smooth exactly on the open subset 𝔤^reg of regular elements, and 𝔤^reg → 𝔠 is surjective; the discriminant divisor 𝔇 ⊂ 𝔠 is the image of the root hyperplanes and 𝔠^rs = 𝔠 \ 𝔇 parametrizes regular semisimple stable classes: for any field extension K/k, χ induces a bijection between stable conjugacy classes of regular semisimple elements of 𝔤(K) and 𝔠^rs(K) (for G quasi-split). (c) (Outer twists) If G is the quasi-split form over a scheme X attached to an Out(G_0)-torsor ρ_G (for a split pinned G_0), the quotient 𝔠 and χ descend to X as 𝔠 = ρ_G ∧^{Out} 𝔠_0, and the G_m-action twisted by a line bundle D gives the vector bundle (or cone) 𝔠_D = 𝔠 ∧^{G_m} D^× over X. For G = GL_n, 𝔠 = 𝔸^n with χ the non-leading coefficients of the (monic, degree n) characteristic polynomial, and 𝔇 is the zero locus of the discriminant of the characteristic polynomial.

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

<a id="et-2b-kostant-section"></a>

### ET.2b.2 The Kostant section

In the setting of ET.2b/chevalley-quotient (char(k) ∤ |W|, G split with a pinning, regular nilpotent e = Σ_{α simple} X_α and an 𝔰𝔩_2-triple (e, h, f)), the affine subspace e + 𝔤^f maps isomorphically to 𝔠 under χ, giving a section ε : 𝔠 → 𝔤^reg of χ with image in the regular locus (Kostant). It is equivariant for the G_m-action on 𝔠 with weights e_i and the action of G_m on 𝔤 combining homotheties with the adjoint action of the cocharacter 2ρ^∨ (equivalently of ρ^∨ after passing to the double cover of G_m); this is why, over a curve, ε globalizes only after choosing a square root D′ of D (D′^{⊗2} ≅ D), giving the Kostant–Hitchin section ε_D : 𝔠_D → 𝔤_D^reg. Every regular element X of 𝔤(K) is G(K̄)-conjugate to ε(χ(X)). For K a field, G quasi-split and a ∈ 𝔠^rs(K), sending γ = Ad(g)ε(a) ∈ χ^{-1}(a)(K) to the class of σ ↦ g⁻¹σ(g) is a bijection from the G(K)-conjugacy classes in χ^{-1}(a)(K) onto ker[H^1(K, J_a) → H^1(K, G)], and the isomorphism classes of pairs (E, φ) (E a G-torsor over K, φ ∈ ad(E) with χ(φ) = a) are in bijection with H^1(K, J_a) (Ngô §§1.5.1–1.5.2; ET.2b/regular-centralizer). For G = GL_n, ε(a) is the companion matrix of the polynomial with coefficients a.

The precise hypotheses are: char(k) ∤ |W| (Ngô's standing assumption); G split with a pinning (descends to quasi-split G with the Out-torsor).

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §1.2, Lemme 1.2.1 (p. 10) and (1.2.2) (p. 11); §4.2.4 (p. 63); Lemme 2.2.5 (p. 34); §1.5, 1.5.1–1.5.2 (pp. 14–15)). Kostant's section of χ, its equivariance, and the Kostant–Hitchin section over the curve after choosing a square root D′ of D; the rational classes in a regular semisimple stable class and the classification of pairs (E, φ) by H^1(F, I_{ε(a)}).

Kostant's theorem: χ restricted to e + 𝔤^f is an isomorphism onto 𝔠 (Ngô Lemme 1.2.1, p. 10; section (1.2.2), p. 11).

Equivariance and the square root: Ngô §4.2.4 (p. 63) and Lemme 2.2.5 (p. 34).

Classes in a stable class: Ngô §§1.5.1–1.5.2 (pp. 14–15), using that [𝔤^reg/G] → 𝔠 is a gerbe banded by J and neutralized by ε (ET.2b/regular-centralizer (b)).

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

<a id="et-2b-regular-centralizer"></a>

### ET.2b.3 The regular centralizer group scheme ★

In the setting of ET.2b/chevalley-quotient (char(k) ∤ |W|), let I → 𝔤 be the group scheme of centralizers. (a) There is a unique smooth commutative group scheme J → 𝔠 with a G-equivariant isomorphism χ^*J|_{𝔤^reg} ≅ I|_{𝔤^reg}, and it extends to a homomorphism χ^*J → I over all of 𝔤 (Ngô Lemme 2.1.1). (b) The morphism [𝔤^reg/G] → 𝔠 is a gerbe banded by J, neutralized by the Kostant section (Proposition 2.2.1). (c) If the centre of G is connected the fibres of J are connected. (d) (Galois description, after Donagi–Gaitsgory) With π : 𝔱 → 𝔠 the finite flat W-cover, there is a canonical homomorphism J → J^1 := (π_*(T × 𝔱))^W, an isomorphism over 𝔠^rs and identifying J with an open subgroup scheme J′ of J^1 whose fibres have the same identity component (Propositions 2.4.2, 2.4.7, Corollaire 2.4.8). (e) For an endoscopic datum with map ν : 𝔠_H → 𝔠 there is a homomorphism μ : ν^*J → J_H (Proposition 2.5.1). (f) For a ∈ 𝔠(X) the pullback J_a is a smooth commutative group scheme over X; over the open where a is regular semisimple, J_a = π_a ∧^W T for the cameral W-torsor π_a (Lemme 1.4.3, (1.4.2)), and over all of X, J_a is an open subgroup of (π_{a,*}(T × X̃_a))^W with the same identity component, by (d).

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

<a id="et-2b-hitchin-moduli-stack"></a>

### ET.2b.4 The Hitchin moduli stack, base and fibration ★

Let k = 𝔽_q, X a smooth projective geometrically connected curve over k of genus g, G a quasi-split reductive group scheme over X attached to an Out-torsor ρ_G (ET.2b/chevalley-quotient (c)), with char(k) ∤ |W|, and D a line bundle on X (in Ngô's applications D = D′^{⊗2} with deg D > 2g; the carrier is defined for every D, including the canonical bundle ω_X and D = O_X, which Yu's counting needs). The Hitchin moduli stack M = M_{G,D} assigns to a k-scheme S the groupoid of pairs (E, φ) with E a G-torsor on X × S (an S-point of Bun_G, GlobalShtukasAndFunctionFieldLanglands:GS.0) and φ ∈ H^0(X × S, ad(E) ⊗ D). The Hitchin base A = A_{G,D} = H^0(X, 𝔠_D) is a finite-dimensional affine space over k, and f : M → A sends (E, φ) to χ(φ). Properties: (a) M is an algebraic stack locally of finite type over k: over Bun_G it is the stack of sections of the coherent sheaf ad(E) ⊗ D, and the restriction of f to the anisotropic locus is of finite type (ET.2b/anisotropic-locus); (b) if deg D > 2g − 2 and G is split, A = ⊕_i H^0(X, D^{⊗e_i}) has dimension Σ_i (e_i deg D + 1 − g) = (#Φ^+ + r) deg D + r(1 − g) by Riemann–Roch (Ngô Lemme 4.4.1, which also covers the quasi-split case), and the open A^♥ of a whose image meets 𝔠^rs generically is non-empty when deg D > 2g; (c) M is smooth at every point (E, φ) with χ(φ) ∈ A^♥ when deg D > 2g − 2, and at every point with χ(φ) ∈ A^ani when deg D = 2g − 2 (Ngô Théorème 4.12.1: the obstruction group H^1(X, ad(E, φ)) vanishes there); (d) the Kostant–Hitchin section A → M (after choosing D′ with D′^{⊗2} = D) lands in the regular locus M^reg.

The precise hypotheses are: k = 𝔽_q, X smooth projective geometrically connected of genus g; G quasi-split over X with char(k) ∤ |W|; D a line bundle; the listed properties need the stated degree bounds.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §4.1 (p. 62); Définition 4.2.1 (p. 62); §4.2.3–4.2.4 (p. 63); Lemme 4.4.1 (p. 64); §4.5 (p. 67); Proposition 4.6.1 (p. 69); Théorème 4.12.1 (p. 84)). Bun_G, the Hitchin total space M of pairs (E, φ) with φ ∈ H^0(X × S, ad(E) ⊗ D), the base A of sections of 𝔠_D and f : M → A; the dimension of A for deg D > 2g − 2; non-emptiness of A^♥ for deg D > 2g; smoothness of M.

([H. Yu, Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/abs/1807.04659v5), §3.2.3 (p. 16)). Higgs bundles (E, θ : E → E ⊗ ω_X) with the canonical twist and their stability, distinguishing the algebraic stack, its stable locus and the coarse space; only the carrier is used here.

Algebraicity: M → Bun_G is the stack of sections of the coherent sheaf ad(E) ⊗ D, representable by an abelian cone (AlgebraicModuliForArithmeticGeometry R09.4 linear stacks and the Artin criterion of A0-extension); Bun_G is algebraic and locally of finite type (GS.0/bun-g-of-the-global-curve).

Dimension and non-emptiness: Riemann–Roch on X for the line bundles of weights e_i (upstream AlgebraicCurves Layer 4; Ngô Lemme 4.4.1, p. 64; §4.5, p. 67; Proposition 4.6.1, p. 69).

Smoothness: deformation theory of Higgs pairs and the vanishing of the obstruction H^1 under the degree hypothesis, at points over A^♥ (Ngô Théorème 4.12.1, p. 84).

The Kostant–Hitchin section: ET.2b/kostant-section globalized with D′ (Ngô §4.2.4, p. 63).

The definition exposes the following operations and relations.

- `TauCeti.HitchinStack` (data): M_{G,D} as a stack over k-schemes.
- `TauCeti.HitchinBase` (data): A_{G,D} = H^0(X, 𝔠_D).
- `TauCeti.hitchinMap` (data): f : M → A.
- `TauCeti.HitchinStack.toBunG` (projection): The forgetful map M → Bun_G.
- `TauCeti.HitchinStack.isAlgebraic` (structure): M is algebraic and locally of finite type.
- `TauCeti.HitchinBase.finrank` (other): dim A for deg D > 2g − 2 by Riemann–Roch.
- `TauCeti.HitchinStack.smooth` (other): Smoothness at points over A^♥ when deg D > 2g − 2, and over A^ani when deg D = 2g − 2.
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

<a id="et-2b-schiffmann-boundedness"></a>

### ET.2b.5 Boundedness of Higgs sheaves through a good pair of line bundles

Let X be a smooth projective geometrically connected curve over a field k, Ω_X its canonical bundle, and α = (r, d) a class (rank r ≥ 1, degree d). A Higgs sheaf of class α is a coherent sheaf V of rank r and degree d with θ ∈ Hom(V, V ⊗ Ω_X); a Higgs subsheaf is a subsheaf W with θ(W) ⊆ W ⊗ Ω_X; (V, θ) is semistable if μ(W) ≤ μ(V) for every proper Higgs subsheaf (μ the slope), and a Higgs subsheaf with μ(W) > μ(V) is destabilizing. A coherent sheaf V is strongly generated by a line bundle L if Ext^1(L, V) = 0 and the evaluation L ⊗ Hom(L, V) → V is surjective. Then there is a pair of line bundles (L_1, L_2) ∈ Pic^{−n}(X) × Pic^{−m}(X) (n, m depending on α and the genus) such that: (a) every semistable Higgs bundle of class α is strongly generated by L_1 and by L_2; (b) every indecomposable vector bundle of class α is strongly generated by L_1 and by L_2; (c) for every coherent sheaf V of class α and every epimorphism φ : L_1 ⊗ V′ → V (V′ a vector space), ker(φ) is strongly generated by L_2; (d) every unstable Higgs sheaf of class α has a destabilizing Higgs subsheaf strongly generated by L_1 and L_2. Consequently the stacks of semistable Higgs bundles and of indecomposable bundles of class α, and the Hitchin moduli stack with the canonical twist restricted to semistable objects, admit presentations as quotients of open subschemes of Quot schemes (Álvarez-Cónsul–King construction) and are of finite type.

The precise hypotheses are: X smooth projective geometrically connected over a field k; Higgs fields twisted by the canonical bundle Ω_X; class α of positive rank.

([O. Schiffmann, Indecomposable vector bundles and stable Higgs bundles over smooth projective curves](https://arxiv.org/abs/1406.3839v2), arXiv v2 (4 October 2014, no printed page numbers): §6.2 and the definition of strong generation in §6.3 (PDF p. 22); Lemma 6.1 (PDF p. 23)). The existence of a good pair of line bundles (L_1, L_2) with properties (a)–(d) for semistable Higgs bundles, indecomposable bundles, kernels of epimorphisms from L_1 ⊗ V and destabilizing Higgs subsheaves; Higgs sheaves and their slope semistability.

Bound the slopes of subsheaves of semistable Higgs bundles and of indecomposable bundles of class α (Harder–Narasimhan filtrations and the bound on Hom from destabilizing pieces); choose L_1, L_2 of sufficiently negative degree so that Ext^1(L_i, V) = H^1(X, L_i^{-1} ⊗ V) = 0 by Serre duality and V ⊗ L_i^{-1} is globally generated (Schiffmann, proof of Lemma 6.1).

Finite type: strongly generated sheaves of class α are quotients of L_1^{⊕N} with N = χ(L_1^{-1} ⊗ V), parametrized by an open subscheme of a Quot scheme (AlgebraicModuliForArithmeticGeometry:R09.2/quot-projectivity).

**Acceptance.**

- For r = 1, every Higgs bundle of class (1, d) is semistable, and a line bundle M of degree d is strongly generated by every line bundle L with deg L ≤ d − 2g: then deg(L^{-1}M) ≥ 2g, so Ext^1(L, M) = H^1(X, L^{-1}M) = 0 and L^{-1}M is globally generated.
- On X = ℙ^1 (Ω = O(−2)) every indecomposable vector bundle is a line bundle, so (b) is vacuous for r = 2; for V = O(a) ⊕ O(−a) with a ≥ 1 there is no nonzero component O(a) → O(−a) ⊗ Ω = O(−a − 2), so O(a) is a destabilizing Higgs subsheaf, and the only semistable Higgs bundle of class (2, 0) is (O ⊕ O, 0).

*Needs:* `ET.2b/hitchin-moduli-stack`; `AlgebraicModuliForArithmeticGeometry:R09.2/quot-projectivity`; `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch`.

<a id="et-2b-cameral-cover"></a>

### ET.2b.6 Cameral covers and spectral curves

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

<a id="et-2b-picard-stack-action"></a>

### ET.2b.7 The Picard stack acting on Hitchin fibres

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

<a id="et-2b-anisotropic-locus"></a>

### ET.2b.8 The anisotropic locus: properness and Deligne–Mumford structure

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

<a id="et-2b-affine-springer-fibre"></a>

### ET.2b.9 Affine Springer fibres and their local symmetry groups ★

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

<a id="et-2b-product-formula"></a>

### ET.2b.10 The product formula for Hitchin fibres

In the setting of ET.2b/hitchin-moduli-stack and ET.2b/affine-springer-fibre, let a ∈ A^♥(k̄) and U ⊆ X̄ the open subset where a is regular semisimple, with finite complement. Gluing local data along the Kostant section gives a morphism ζ : (∏_{v ∈ X̄ \ U} M_v(a)) ∧^{∏_v P_v(J_a)} P_a → M_a which is a universal homeomorphism (Ngô Proposition 4.13.1). For counting points over k (a ∈ A^ani(k)), with P′ built from the open subgroup J′, there is an equivalence of groupoids [M_a/P′_a] ≅ ∏_{v ∈ X \ U} [M_v(a)/P_v(J′_a)] (Proposition 8.4.2), and stabilizer volumes are recorded by the Néron model of J_a. Consequently dim M_a = dim P_a, and δ_a := dim P_a − dim P_a^{ab} = Σ_v δ_v(a) (the affine part of P_a has dimension the sum of local δ-invariants).

The precise hypotheses are: a ∈ A^♥ (homeomorphism) or a ∈ A^ani(k) (point-count form).

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), Proposition 4.13.1 (pp. 86–87); §8.4, Propositions 8.4.2 and 8.4.3 (pp. 175–176)). The product formula ζ, a homeomorphism, and its groupoid form for counting points over k in the anisotropic locus.

Ngô Proposition 4.13.1 (pp. 86–87), citing his earlier 'Fibration de Hitchin et endoscopie' Théorème 4.6 for the equivalence on k̄-points; Proposition 8.4.2 (p. 175) for the point-count form.

The δ formula: the affine part of P_a is the product of the local affine parts (ET.2b/affine-springer-fibre (b)).

**Acceptance.**

- If a is regular semisimple everywhere (U = X̄), M_a = P_a-torsor and δ_a = 0.
- For G = GL_2 and a spectral curve with a single node over v, M_a is a compactified Jacobian, homeomorphic to M_v(a) ∧^{P_v} P_a with δ_a = δ_v(a) = 1.

*Needs:* `ET.2b/hitchin-moduli-stack`; `ET.2b/affine-springer-fibre`; `ET.2b/picard-stack-action`; `ET.2b/kostant-section`.

<a id="et-2b-delta-stratification"></a>

### ET.2b.11 The δ-stratification and the codimension estimate

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

<a id="et-2b-weak-abelian-fibration"></a>

### ET.2b.12 Weak abelian fibrations

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

<a id="et-2b-kappa-decomposition"></a>

### ET.2b.13 Purity, decomposition and the κ-isotypic parts of the Hitchin cohomology

In the setting of ET.2b/anisotropic-locus, let f^ani : M^ani → A^ani and K = f^ani_* Q̄_ℓ. (a) K is pure (M^ani smooth, f^ani proper) and, by the decomposition theorem, K ⊗ k̄ is isomorphic to the direct sum of its shifted perverse cohomology sheaves ^pH^n(K), each geometrically semisimple. (b) Over the étale cover Ã^ani of A^ani trivializing the cameral monodromy, the action of π_0(P) on ^pH^n(f̃^ani_* Q̄_ℓ) factors through a finite quotient and gives a decomposition ^pH^n = ⊕_{κ} ^pH^n_κ over the characters κ of that quotient (κ ∈ κ^ani), with ^pH^n_κ supported in Ã_κ ∩ Ã^ani, where Ã_κ is the locus of a whose cameral monodromy fixes κ (Ngô (6.2.5), Proposition 6.2.6). (c) The κ = 1 part is the stable part ^pH^n_st. The decomposition theorem is applied to f^ani with source a smooth separated Deligne–Mumford stack (Ngô Remarque 7.5.1); the atlas's decomposition theorem (EtaleDualityAndPerverseSheaves:EDC.7) is stated for schemes, and its extension to proper maps from such stacks is requested.

The precise hypotheses are: the setting of ET.2b/anisotropic-locus; ℓ ≠ char(k), coefficients Q̄_ℓ.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §6.2, (6.2.5) and Proposition 6.2.6 (pp. 113–114); Remarque 7.5.1 (p. 149); Corollaire 5.7.5 (p. 110)). Purity and the decomposition theorem for f^ani, the action of π_0(P) and the κ-decomposition of the perverse cohomology with supports in Ã_κ; the extension of the purity/decomposition argument to Deligne–Mumford stacks.

(a) Deligne's theorem that proper direct images of pure complexes are pure (DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6) and the decomposition theorem of BBD 5.4.5 (EtaleDualityAndPerverseSheaves:EDC.7/decomposition-theorem), applied as in Ngô §6.2 (p. 113) with Remarque 7.5.1 (p. 149) for Deligne–Mumford stacks.

(b) The homotopy argument: P acts on K, its identity component acts trivially on cohomology sheaves, so π_0(P) acts; over Ã^ani it is a quotient of a constant finitely generated group with finite image (Ngô §6.2, (6.2.5) and Proposition 6.2.6, p. 114; Corollaire 5.7.5, p. 110).

**Acceptance.**

- For G = GL_n, π_0(P_a) = ℤ for all a and its action on each fixed-degree component is trivial, so only κ = 1 occurs.
- For G = SL_2, κ ranges over characters of ℤ/2, and the nontrivial κ-part attached to a connected étale double cover X′ → X is supported on the image of the endoscopic base A_H, where the spectral curves are nodal with normalization X′.

*Needs:* `ET.2b/anisotropic-locus`; `ET.2b/picard-stack-action`; `EtaleDualityAndPerverseSheaves:EDC.7/decomposition-theorem`; `EtaleDualityAndPerverseSheaves:EDC.7/pure-complex-geometric-splitting`; `DeligneWeightsAndPurity:DWP.8/proper-direct-image-preserves-purity-6-2-6`.

<a id="et-2b-support-theorem"></a>

### ET.2b.14 Ngô's support theorem ★

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

<a id="et-2b-endoscopic-comparison"></a>

### ET.2b.15 Geometric stabilization: comparison of κ-parts with stable parts of endoscopic groups ★

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

<a id="et-2b-hitchin-point-count"></a>

### ET.2b.16 Counting points of Hitchin fibres

In the setting of ET.2b/anisotropic-locus, for a ∈ A^ani(k) with U ⊆ X the regular semisimple locus of a: (a) (Grothendieck–Lefschetz) the number of k-points of [M_a/P′_a], counted with the weights 1/#Aut and twisted by a character κ of π_0(P_a) (κ-weighted count), equals the alternating trace of Frobenius on the κ-part of the cohomology of M_a (Ngô Proposition 8.1.13); (b) (Local factors) by the product formula in its point-count form (ET.2b/product-formula), the global κ-weighted count of [M_a/P′_a] is the product over v ∈ X \ U of the κ-weighted counts of the local quotients [M_v(a)/P_v(J′_a)] (Propositions 8.4.2–8.4.3); (c) (Endoscopic local identity on the transverse locus) at a point a_H of the transverse open of the endoscopic base (Lemme 8.5.1), the κ-weighted local count for G at v equals q^{deg(v) r_{G,H,v}(a_H)} times the stable local count for H (Lemme 8.5.7), proved by direct comparison of the local affine Springer fibres where the G-discriminant exceeds the H-discriminant only by the resultant. The translation of local κ-weighted counts into κ-orbital integrals is ET.3/orbital-integrals-as-point-counts.

The precise hypotheses are: a ∈ A^ani(k); Grothendieck–Lefschetz for Deligne–Mumford stacks of finite type over k.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §8.1, Propositions 8.1.6 and 8.1.13 (pp. 157–160); §8.4, Propositions 8.4.2–8.4.3 (pp. 175–176); §8.5, Lemmes 8.5.1 and 8.5.7 (pp. 178–179)). The cohomological point count, the product of local κ-weighted counts over the singular points, and the endoscopic local identity on the transverse locus.

(a) The Grothendieck–Lefschetz trace formula for Deligne–Mumford stacks of finite type over 𝔽_q (requested from SchemeAndStackFoundations:SF.2; the scheme case underlies it), as used by Ngô §8.1 (Proposition 8.1.6 for finiteness, Proposition 8.1.13 for the formula, pp. 157–160).

(b) Ngô §8.4 (pp. 175–176); (c) §8.5 (pp. 177–179).

**Acceptance.**

- If a is regular semisimple and unramified everywhere, the κ-count is the number of k-points of a torsor under P_a weighted by κ, and the product of local counts is 1.
- For G = GL_1 the count of degree-d points is #Pic^d_X(k) = #Pic^0_X(k).

*Needs:* `ET.2b/anisotropic-locus`; `ET.2b/product-formula`; `ET.2b/affine-springer-fibre`; `SchemeAndStackFoundations:SF.2`.

<a id="et-2b-acceptance-examples"></a>

### ET.2b.17 Worked examples for the Hitchin fibration

(1) Torus: for G = T, A = H^0(X, 𝔱 ⊗ D), M = Bun_T × A, P = Bun_T × A, δ = 0, every a is regular semisimple, affine Springer fibres are discrete and the support theorem is trivial. (2) Rank-one degenerating spectral curve: for G = GL_2, a family of spectral curves acquiring one node at v ∈ X has δ_v = 1, M_a is the compactified Jacobian of the nodal curve, P_a is the generalized Jacobian (an extension of the Jacobian of the normalization by G_m), and the product formula expresses M_a through the affine Springer fibre at v (a chain of ℙ^1's modulo ℤ). (3) Nontrivial component character: for G = SL_2 and a = ν(a_H) with H the norm-one torus of a connected étale double cover X′ → X, the spectral curve is nodal with normalization X′ and π_0(P_a) carries the nontrivial character κ attached to X′. (4) Endoscopic Hitchin fibre: for G = SL_2 and H the norm-one torus of a connected étale double cover X′ → X, the endoscopic Hitchin base A_H maps to A by ν, and over its image the nontrivial κ-part of the cohomology is identified (ET.2b/endoscopic-comparison) with the stable cohomology of the H-fibration shifted by 2 deg D.

The precise hypotheses are: X smooth projective over 𝔽_q, char ≠ 2 for (3)–(4).

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §§4–7 as cited in the nodes used). The constructions from which the examples are computed.

Each example is computed from ET.2b/hitchin-moduli-stack, ET.2b/picard-stack-action, ET.2b/affine-springer-fibre, ET.2b/product-formula and ET.2b/endoscopic-comparison.

**Acceptance.**

- Each of the four examples is checked as stated.

*Needs:* `ET.2b/hitchin-moduli-stack`; `ET.2b/picard-stack-action`; `ET.2b/affine-springer-fibre`; `ET.2b/product-formula`; `ET.2b/endoscopic-comparison`.

## Layer ET.3: Fundamental lemma and existence of local transfer

The targets are the fundamental lemma in its forms and the existence of transfer. Point counts become κ-orbital integrals; Ngô's theorem gives the Lie-algebra fundamental lemma in equal characteristic and Waldspurger's change of characteristic carries it to p-adic fields; descent gives the group version and Hales' reduction the spherical Hecke algebra; Waldspurger's theorem gives transfer; and the inner-form, base-change and twisted variants follow.

<a id="et-3-lie-algebra-fundamental-lemma"></a>

### ET.3.1 The Lie-algebra fundamental lemma in equal characteristic (Ngô) ★

Let k be a finite field with q elements, 𝒪 = k[[ε]], F = k((ε)), G a reductive group scheme over 𝒪 (quasi-split, split over an unramified extension) whose Weyl group order is not divisible by char(k), and (H, κ) an unramified endoscopic datum of G with H the corresponding reductive group scheme over 𝒪. For a ∈ 𝔠_H(𝒪) ∩ 𝔠_H^{G-rs}(F) (G-regular semisimple) with image ν(a) ∈ 𝔠(𝒪), and Haar measures giving the centralizer tori compatible volumes, Δ_G(ν(a)) O^κ_{ν(a)}(1_{𝔤(𝒪)}) = Δ_H(a) SO_a(1_{𝔥(𝒪)}), where 1_{𝔤(𝒪)}, 1_{𝔥(𝒪)} are the characteristic functions of the integral points of the Lie algebras, O^κ is the κ-orbital integral and SO the stable orbital integral (ET.1/kappa-and-stable-orbital-integrals), Δ_G(a) = q^{−val(D_G(a))/2} and Δ_H(a) = q^{−val(D_H(a))/2}; equivalently O^κ_{ν(a)}(1_{𝔤(𝒪)}) = q^{r_{G,H}(a)} SO_a(1_{𝔥(𝒪)}) with r_{G,H}(a) the valuation of the relative discriminant divided by 2. This is the Langlands–Shelstad fundamental lemma for Lie algebras with the transfer factor of ET.1/lie-algebra-transfer-factor normalized by taking as base point of each stable class the value of the Kostant section (ET.2b/kostant-section), which Kottwitz showed agrees with the Langlands–Shelstad normalization for quasi-split G (Ngô §1.11, p. 23). The characteristic hypothesis is char(k) ∤ |W| (Ngô, arXiv v3, Théorème 1); the roadmap's earlier description of this layer quoted the stronger condition p > 2h, which is not the hypothesis of the version read.

The precise hypotheses are: k finite, char(k) ∤ |W|; G, H unramified over 𝒪 = k[[ε]] with an unramified endoscopic datum; a G-regular semisimple.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), Introduction, Théorème 1 (p. 1); §1.11, Théorème 1.11.1 and §1.11.3 (pp. 23–24); §8.6, §§8.6.1–8.6.4 (pp. 182–183)). The fundamental lemma for Lie algebras of unramified groups over k((ε)) with char(k) not dividing |W|, in the forms with q^{r_{GH}} and with Δ_G, Δ_H; the globalization of local data and the deduction from the geometric stabilization.

([T. C. Hales, A statement of the fundamental lemma](https://arxiv.org/abs/math/0312227v2), §6.1, Conjecture 6.1 (PDF p. 10); §7.2 (PDF p. 12)). The statement of the fundamental lemma for unit elements and its reduction to an identity in the Lie algebra.

Globalize: choose a smooth projective curve X over k, a point v with completion F, a line bundle D = D′^{⊗2} of large degree, and a global a_H ∈ A_H^ani(k) whose germ at v is the given local element and which is regular semisimple and unramified at the other points where needed (Ngô §8.6.1–8.6.4, pp. 182–183; the choice uses deg D > rN + 2g).

Count points: the κ-weighted count of the G-Hitchin fibre and the stable count of the H-Hitchin fibre are products of local counts (ET.2b/hitchin-point-count), and each local count is a volume times a κ-orbital (resp. stable) integral of the unit function (ET.3/orbital-integrals-as-point-counts).

Compare cohomologies: the geometric stabilization (ET.2b/endoscopic-comparison) identifies the κ-part of the G-cohomology over Ã_H with the stable part of the H-cohomology, shifted and twisted by r_{G,H}(D); taking traces of Frobenius gives a global identity of products of local terms.

Isolate the local factor at v: at the other singular points the local identity holds by induction or by the transverse-locus identity (ET.2b/hitchin-point-count (c)), so the local identity at v follows (Ngô §8.6, proof of Théorème 1.11.1, p. 182 ff.).

**Acceptance.**

- For H = G (κ = 1) both sides are equal by definition (r = 0).
- For G = SL_2 and H the norm-one torus of an unramified quadratic extension: O^κ_{ν(a)}(1_{𝔰𝔩_2(𝒪)}) = q^{val(D_G(a))/2} times the volume of the integral points of the torus, a statement checkable by counting lattices (the case Langlands verified by hand).
- For unitary groups the statement specializes to Laumon–Ngô's theorem (ET.3/unitary-fundamental-lemma).

*Needs:* `ET.2b/endoscopic-comparison`; `ET.2b/hitchin-point-count`; `ET.2b/support-theorem`; `ET.2b/kostant-section`; `ET.3/orbital-integrals-as-point-counts`; `ET.1/lie-algebra-transfer-factor`; `ET.1/kappa-and-stable-orbital-integrals`; `ET.0/endoscopic-datum`; `FunctionFieldArithmetic:FA.2/projective-adeles`; `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-4-repartitions-weil-differentials-and-riemannroch`.

<a id="et-3-orbital-integrals-as-point-counts"></a>

### ET.3.2 Local κ-weighted point counts are κ-orbital integrals

Let k = 𝔽_q, v a closed point of a curve over k with completion F_v = k(v)((ε_v)), G as in ET.2b/affine-springer-fibre and a ∈ 𝔠(𝒪_v) ∩ 𝔠^rs(F_v), with J_a, J′_a ⊆ J_a the open subgroup of ET.2b/regular-centralizer and κ a character of π_0(P_v(J′_a)) induced from a global κ. Then the number of k(v)-points of the quotient groupoid [M_v(a)/P_v(J′_a)], each point weighted by κ of its invariant and divided by the order of its automorphism group, equals vol(J′_a(𝒪_v), dt_v)·O^κ_a(1_{𝔤(𝒪_v)}, dt_v), where O^κ is the κ-orbital integral of ET.1/kappa-and-stable-orbital-integrals of the characteristic function of 𝔤(𝒪_v) over the stable class a with the measure dt_v on the centralizer torus; for κ = 1 the count is the stable orbital integral (Ngô Lemme 8.2.4, Propositions 8.2.5 and 8.2.7). Consequently the global κ-count of ET.2b/hitchin-point-count is a product of local κ-orbital integrals of unit functions times explicit volumes.

The precise hypotheses are: k finite, char(k) ∤ |W|; a integral and regular semisimple over F_v.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), §8.2, Lemme 8.2.4, Propositions 8.2.5 and 8.2.7 (pp. 164–167)). The κ-weighted number of k-points of [M_v(a)/P_v(J′_a)] is vol(J′_a(𝒪_v))·O^κ_a(1_{𝔤_v}), and its variant for P_v(J_a).

Points of M_v(a) over k(v) are lattices g ∈ G(F_v)/G(𝒪_v) with Ad(g)⁻¹γ_a ∈ 𝔤(𝒪_v) (ET.2b/affine-springer-fibre); modulo P_v(J′_a)(k(v)) = J′_a(F_v)/J′_a(𝒪_v) they are the G(F_v)-conjugacy classes of elements of 𝔤(𝒪_v) in the stable class of γ_a with given invariant, weighted by the inverse volumes of their centralizers (Ngô §8.2, Lemme 8.2.4).

The κ-twist: the invariant of a rational class in the stable class is identified with the class in H^1(F_v, J_a) and κ is evaluated on it (ET.0/rational-classes-in-stable-class), giving the κ-weighted sum (Propositions 8.2.5, 8.2.7).

**Acceptance.**

- If a is regular semisimple modulo ε_v (δ_v = 0), M_v(a)/P_v(J′_a) is a point with automorphism group of volume matching vol(J′_a(𝒪_v)), and O^κ_a(1) = 1.
- For G = GL_n (κ = 1 only) the count is the classical lattice count expressing O_a(1_{𝔤𝔩_n(𝒪)}) as a number of 𝒪[γ_a]-stable lattices up to the centralizer.

*Needs:* `ET.2b/affine-springer-fibre`; `ET.2b/regular-centralizer`; `ET.1/kappa-and-stable-orbital-integrals`; `ET.1/orbital-integral`; `ET.0/rational-classes-in-stable-class`.

<a id="et-3-unitary-fundamental-lemma"></a>

### ET.3.3 The fundamental lemma for unitary Lie algebras (Laumon–Ngô)

Let F be a finite extension of 𝔽_p((t)) with residue field k, F′/F an unramified quadratic extension with residue characteristic ≠ 2, G = U(n) the unitary group of a hermitian form over F′/F with a hyperspecial model, and n = n_1 + n_2 a nontrivial partition with H = U(n_1) × U(n_2) the corresponding endoscopic group and κ the associated character. If char(k) > n, then for G-regular semisimple γ in the Lie algebra of H(F) with image in 𝔤(F), O^κ_γ = (−1)^r q^r SO^H_γ for the characteristic functions of the integral Lie algebras, with r = r_{I_1,I_2} the valuation of the resultant of the two characteristic polynomials (Laumon–Ngô Théorème 1.5.1); combined with Waldspurger's reductions this gives the fundamental lemma for unitary groups over p-adic fields when p is large, used by Shin and by Liu–Tian–Xiao–Zhang–Zhu.

The precise hypotheses are: F of equal characteristic p with char(k) > n; F′/F unramified quadratic, residue characteristic ≠ 2.

([G. Laumon and B. C. Ngô, Le lemme fondamental pour les groupes unitaires](https://arxiv.org/abs/math/0404454v2), Abstract and §0.1 (PDF pp. 1–2); §1.1 (PDF pp. 4–5); §1.5, Théorème 1.5.1 (PDF p. 10)). The Langlands fundamental lemma for unitary groups over finite extensions of 𝔽_p((t)) with p > rank, for the unramified quadratic F′/F and H = U(n_1) × U(n_2); the identity O^κ_γ = (−1)^r q^r SO^H_γ.

([Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), §D.2, Lemma D.2.2 and its proof (p. 369)). Uses the fundamental lemma for unramified unitary groups: the characteristic function of a hyperspecial subgroup transfers to that of the endoscopic group.

Laumon–Ngô prove it by a G_m-equivariant localization on the Hitchin fibration for unitary groups (a special case subsumed by ET.3/lie-algebra-fundamental-lemma, whose hypothesis char(k) ∤ |W| = n! is the same as char(k) > n for U(n)).

Transfer to characteristic 0: ET.3/change-of-characteristic and ET.3/group-fundamental-lemma.

**Acceptance.**

- n = 2, n_1 = n_2 = 1: H = U(1) × U(1) is a torus, SO^H_γ is a volume, and the identity is the unitary analogue of the SL_2 computation.
- n_2 = 0 is excluded (nontrivial partition); for it the statement is the tautology O_γ = SO_γ for G.

*Needs:* `ET.3/lie-algebra-fundamental-lemma`; `ET.1/unitary-transfer-factor`; `ET.0/unitary-elliptic-endoscopic-data`.

<a id="et-3-nonstandard-fundamental-lemma"></a>

### ET.3.4 Waldspurger's non-standard fundamental lemma (Ngô)

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

<a id="et-3-change-of-characteristic"></a>

### ET.3.5 Change of characteristic for orbital integrals and the fundamental lemma

Fix a finite field 𝔽_q of characteristic p and let CL_q be the set of nonarchimedean local fields with residue field 𝔽_q (of characteristic 0 or p). Fix the root datum of a connected reductive group with an action of the tame Galois group Θ ⋉ I (independent of F ∈ CL_q) and an endoscopic triple, both tamely ramified. Assume p is large relative to the rank of G (Waldspurger's standing hypothesis; this bound is separate from and in general stronger than p ∤ |W|). Then: (a) orbital integrals of the functions attached to Moy–Prasad lattices (the space S of the source) depend on F only through 𝔽_q: there are linear forms J^D(z, δ, ·) on S, indexed by F-independent replacements z of stable classes and cohomological data δ, with J_{G^D}(X, rea_F(φ)) = J^D(z, δ, φ) for every F ∈ CL_q (Théorème 7.2); (b) if rea_{H,F}(φ_H) is a transfer of rea_F(φ) for one F ∈ CL_q, then rea_{H,F′}(φ_H) is a transfer of rea_{F′}(φ) for every F′ ∈ CL_q (Corollaire 9.2); (c) in the unramified case, the Lie-algebra fundamental lemma holds over F if and only if it holds over F′ (Corollaire 9.3). Combined with ET.3/lie-algebra-fundamental-lemma, the Lie-algebra fundamental lemma holds for unramified data over every p-adic field of characteristic 0 whose residue characteristic p is large relative to G.

The precise hypotheses are: p large relative to the rank of G (Waldspurger's hypothesis); G and the endoscopic datum tamely ramified (unramified for (c)).

([J.-L. Waldspurger, Endoscopie et changement de caractéristique](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopie.pdf), Introduction (pp. 1–5); §7, Théorème 7.2 (p. 62); §9, Corollaire 9.2 (p. 70) and Corollaire 9.3 (p. 71)). Under the hypothesis that the residue characteristic is large relative to the rank, orbital integrals of Moy–Prasad lattice functions are independent of the local field with given residue field; transfer and the Lie-algebra fundamental lemma transfer between fields of characteristic 0 and p with the same residue field.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), Introduction (p. 2)). Ngô proves the equal-characteristic case and notes that the mixed-characteristic case follows from Waldspurger's change of characteristic.

Translate stable classes, Moy–Prasad lattices and the tame Galois group into F-independent data (Waldspurger 2006, Introduction and §§1–6), using DeBacker's parametrization of nilpotent orbits and homogeneity of germs (ET.1/shalika-germs).

(a) Théorème 7.2 (p. 62); (b) Corollaire 9.2 (p. 70); (c) Corollaire 9.3 (p. 71), applying (b) to the unit functions of the hyperspecial lattices.

Close local fields (Deligne, Kazhdan) are the classical form of the same principle; the source's route is the F-independent description above.

**Acceptance.**

- For G = T a torus the forms J^D are evaluations and the statements are trivial.
- For G = SL_2 and its elliptic torus data, the κ-orbital integrals of the unit function computed over 𝔽_q((t)) and over the unramified extension of ℚ_p of residue field 𝔽_q agree for p large.

*Needs:* `ET.1/orbital-integral`; `ET.1/shalika-germs`; `ET.1/lie-algebra-transfer-factor`; `ET.1/matching-functions`; `ReductiveGroupsPartII:RG2.3/moy-prasad-filtration`; `ET.3/lie-algebra-fundamental-lemma`.

<a id="et-3-group-fundamental-lemma"></a>

### ET.3.6 The fundamental lemma for groups and for spherical Hecke algebras ★

Let F be a p-adic field of characteristic 0, G a connected reductive group over F, unramified with hyperspecial subgroup K = G(𝒪), (H, ℋ, s, ξ) an unramified endoscopic datum with z-pair, hyperspecial K_H ⊆ H(F), and Δ_0 the unramified normalization of the transfer factor (ET.1/local-transfer-factor, normalized as in Hales and Waldspurger). If p is large relative to G (Waldspurger's hypotheses of 2008 §4.4), then: (a) (unit elements) the characteristic function 1_{K_H}, suitably normalized for the z-pair and Haar measures giving K and K_H volume 1, is a transfer of 1_K: SO_{γ_H}(1_{K_H}) = Σ_δ Δ_0(γ_H, δ) O_δ(1_K) for every strongly G-regular γ_H; (b) (spherical Hecke algebra) for every f in the spherical Hecke algebra ℋ(G(F), K), the function b(f) ∈ ℋ(H(F), K_H) obtained from the L-embedding ξ through the Satake isomorphisms is a transfer of f. (a) follows from the Lie-algebra fundamental lemmas for the descended data of all semisimple centralizers (ET.3/change-of-characteristic and ET.3/lie-algebra-fundamental-lemma) by semisimple descent (Waldspurger 2008 Théorème 4.11 specialised to θ = 1, where the non-standard triples are trivial); (b) follows from (a) by Hales' reduction to unit elements.

The precise hypotheses are: F p-adic of characteristic 0, residue characteristic p large relative to G; G, H unramified with hyperspecial subgroups; unramified endoscopic datum.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §§4.4–4.11 (pp. 48–52) and §5 (pp. 53–73), Théorème 4.11). Under the unramified hypotheses of §4.4, the Lie-algebra fundamental lemma for the descended data (and the non-standard one, trivial when θ = 1) implies the fundamental lemma for unit elements of the group.

([T. C. Hales, A statement of the fundamental lemma](https://arxiv.org/abs/math/0312227v2), Conjecture 6.1 (PDF p. 10) and Remark 9.3 (PDF p. 16)). The statement for unit elements of hyperspecial Hecke algebras and the known passage from the unit element to the whole spherical Hecke algebra.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.4 and Remark 3.4 (p. 15)). The transfer and the fundamental lemma for unit elements are known in all cases (Waldspurger, Laumon–Ngô, Ngô), with Hales' reduction to unit elements.

(a) Waldspurger 2008 §§4.4–4.11 and §5 with θ = 1 and ω = 1: descent of stable and κ-orbital integrals of the unit function to centralizers of topologically semisimple elements (§§5.2–5.8), equality of unramified transfer factors after descent (§§5.10–5.11), and the Lie-algebra fundamental lemma for each descended datum.

(b) Hales, 'On the fundamental lemma for standard endoscopy: reduction to unit elements', Canad. J. Math. 47 (1995) (not read; recalled by Hales 2003 Remark 9.3 and by Shin §3.4, p. 15).

Satake isomorphism and the map b: SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism (with its unitary normalizations) and ReductiveGroupsPartII:RG2.5 (dual groups).

**Acceptance.**

- For H = G (s = 1), b is the identity and (a)–(b) are tautologies.
- For G = GL_n there is no proper elliptic datum and the statement reduces to (a) for H = G.
- The proof uses Waldspurger's bound on the residue characteristic (2008 §4.4, (H1), and the change of characteristic); the hypothesis p ∤ |W| of the equal-characteristic theorem does not by itself give the statement over p-adic fields.

*Used by:* ET.4 (finite-place test functions in the stable trace formula are spherical functions and their transfers); Shin 2011 §3.4; Liu–Tian–Xiao–Zhang–Zhu §D.2 (hyperspecial transfer at unramified places).

*Needs:* `ET.3/lie-algebra-fundamental-lemma`; `ET.3/change-of-characteristic`; `ET.1/local-transfer-factor`; `ET.1/transfer-factor-properties`; `ET.1/matching-functions`; `ReductiveGroupsPartII:RG2.3/hyperspecial-vertices`; `SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism`; `SmoothRepresentationsOfLocalGroups:SR.1/convolution-algebra`.

<a id="et-3-local-transfer-existence"></a>

### ET.3.7 Existence of smooth transfer (Waldspurger) ★

Let F be a local field of characteristic 0, G connected reductive over F, (H, ℋ, s, ξ) an endoscopic datum with z-pair (H_1, λ_1) and Δ an absolute transfer factor. Then every f ∈ C_c^∞(G(F)) has a transfer f^{H_1} ∈ C_1^∞(H_1(F)) (ET.1/matching-functions). At archimedean F this is Shelstad's theorem (ET.1/real-transfer). For F p-adic, Waldspurger proved that the Lie-algebra fundamental lemma for unramified data over all p-adic fields of sufficiently large residue characteristic implies Lie-algebra transfer for every p-adic F of characteristic 0 (through a global argument with an auxiliary place, the compatibility of transfer with Fourier transform and the germ expansion, which remove any restriction on the residue characteristic of F itself), and the group transfer follows by semisimple descent and the local gluing lemma; with ET.3/group-fundamental-lemma (unconditional by Ngô and Waldspurger) transfer is unconditional. In particular transfer exists between a connected reductive group and its quasi-split inner form (Waldspurger 1997, Corollaire 1.7).

The precise hypotheses are: F local of characteristic 0 (any residue characteristic); an endoscopic datum with z-pair.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §3.3, before Théorème 3.3.1 (p. 78)). Waldspurger's difficult result that transfer between a connected reductive group and its quasi-split inner form is possible (his Corollary 1.7).

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Introduction (p. 2); §3.4 (p. 15)). The transfer conjecture of Langlands–Shelstad is known, via Waldspurger and Ngô, for all endoscopic data.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §2.2 (pp. 19–21); §2.3 (p. 21)). The local gluing lemma for transfer (after Langlands–Shelstad Lemma 2.2.A) and descent to Lie algebras.

([J. Arthur, An introduction to the trace formula](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §27 (pp. 192–204)). Statement of the Langlands–Shelstad transfer conjecture and its reduction to the fundamental lemma by Waldspurger; written in 2005, it records the nonarchimedean conjecture as open and reduces its unramified case to the fundamental lemma (p. 203).

Lie algebra: Waldspurger 1997 (not read; its main theorem and Corollary 1.7 are recalled by Labesse §3.3 and Shin §3.4): the Fourier-transform compatibility (ET.1/fourier-transform-orbital-integrals), homogeneity of germs (ET.1/shalika-germs), and a global argument choosing a number field and an auxiliary place where the fundamental lemma holds for large residue characteristic (ET.3/change-of-characteristic).

Group: descend near each semisimple element to the Lie algebra of its centralizer (ET.1/transfer-factor-properties (e)) and glue local transfers by Waldspurger 2008 §2.2 (lemma after Langlands–Shelstad 2.2.A).

Archimedean: ET.1/real-transfer.

**Acceptance.**

- For the principal datum of quasi-split G the identity function transfer is valid.
- For SL_2 and the elliptic torus data, transfer exists for every f, matching κ-orbital integrals with orbital integrals on the torus times transfer factors.

*Needs:* `ET.3/group-fundamental-lemma`; `ET.3/change-of-characteristic`; `ET.1/fourier-transform-orbital-integrals`; `ET.1/shalika-germs`; `ET.1/transfer-factor-properties`; `ET.1/matching-functions`; `ET.1/real-transfer`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

<a id="et-3-inner-form-transfer"></a>

### ET.3.8 Transfer between inner forms of GL_n and quaternionic matching

Let F be a local field of characteristic 0, D a central division algebra of degree d over F, n = md and G = GL_m(D), an inner form of G* = GL_n(F) with Kottwitz sign e(G) = (−1)^{n−m}. Regular semisimple γ ∈ G(F) and γ* ∈ G*(F) correspond if they have the same characteristic polynomial (then their centralizers are isomorphic tori); measures on the centralizers are transported. (a) (Deligne–Kazhdan–Vignéras) For every f ∈ C_c^∞(G(F)) there is f* ∈ C_c^∞(G*(F)) with O_{γ*}(f*) = e(G) O_γ(f) when γ* corresponds to γ, and O_{γ*}(f*) = 0 when γ* corresponds to no element of G(F); (b) there is a canonical injection π ↦ π* from tempered irreducible representations of G(F) to those of G*(F) with tr π*(f*) = e(G) tr π(f) (the local Jacquet–Langlands correspondence on characters). For GL_2 and the quaternion algebra D: e(D^×) = −1, the regular semisimple elements of D^× correspond to elliptic elements of GL_2(F), and the matching f ↦ f* uses the common elliptic torus measure; for an unramified place where D splits, the unit element of GL_2(𝒪) corresponds to itself. This is the case s = 1 of ET.3/local-transfer-existence for inner forms, with the transfer factor equal to e(G) on corresponding pairs.

The precise hypotheses are: F local of characteristic 0; G = GL_m(D) an inner form of GL_n.

([J. Arthur, An introduction to the trace formula](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §25, Theorem 25.1 (p. 168)). For an inner form G of GL(n) and any test function f_v, the function f*_v defined by matching orbital integrals with the sign e(G_v) is the orbital-integral image of a function on G*(F_v); a canonical injection of tempered representations with f*_v(π*_v) = e(G_v) f_{v,G}(π_v) (Deligne–Kazhdan–Vignéras).

(a)–(b) Deligne–Kazhdan–Vignéras (not read), as stated by Arthur's Clay introduction Theorem 25.1 (p. 168), proved by a simple trace formula argument.

Transfer factor: for the principal datum of GL_n (s = 1) and an inner form, Δ = e(G) on corresponding pairs (stable = rational conjugacy in GL_m(D) by Hilbert 90 for the centralizer tori), compatible with ET.1/local-transfer-factor and ET.0/kottwitz-sign.

**Acceptance.**

- GL_2 and D^×: e = −1, and for f the characteristic function of 𝒪_D^× a matching f* satisfies O_{γ*}(f*) = −O_γ(f) at every elliptic γ* corresponding to γ ∈ D^× and O_{γ*}(f*) = 0 at split regular γ*.
- m = n (D = F): G = G*, e = 1 and f* = f.

*Used by:* GL2AutomorphicRepresentationsAndTransfer:R17.2/quaternionic-orbital-matching (quaternionic matching with the rank-two sign and common torus measures); ET.6 (the local Jacquet–Langlands correspondence on characters).

*Needs:* `ET.3/local-transfer-existence`; `ET.0/kottwitz-sign`; `ET.0/inner-twist`; `ET.1/matching-functions`; `ET.1/real-character-theory`.

<a id="et-3-base-change-fundamental-lemma-and-transfer"></a>

### ET.3.9 Stable base change: fundamental lemma, transfer and identity terms

Let E/F be a cyclic extension of local fields of characteristic 0 of degree ℓ with generator θ of Gal(E/F), G_0 a connected reductive group over F, G = R_{E/F}G_0 with the automorphism θ, and H the quasi-split inner form of G_0 (cyclic stable base change, the twisted datum with s = 1 and ω = 1). (a) (Unit elements; Kottwitz) If E/F is unramified, G_0 is unramified and K_E = G_0(𝒪_E), K = G_0(𝒪_F) are hyperspecial with volume 1, then 1_{K_E} and 1_K have matching (twisted stable / stable) orbital integrals: SO_γ(1_K) = SO^θ_δ(1_{K_E}) when γ is a norm of δ, and SO_γ(1_K) = 0 when γ is not a norm. (b) (Spherical Hecke algebra; Clozel, Labesse) More generally, for every f_E ∈ ℋ(G_0(E), K_E) and its base-change image b_{E/F}(f_E) ∈ ℋ(G_0(F), K), the functions f_E and b_{E/F}(f_E) are associated (Labesse Proposition 3.7.3, with the vanishing at non-norms of Proposition 3.7.2). (c) (Transfer) For F nonarchimedean, every f_E ∈ C_c^∞(G_0(E)) has an associated f ∈ C_c^∞(H(F)) (Labesse Théorème 3.3.1, from Waldspurger's inner-form transfer and descent); for F archimedean, K-finite transfer exists (Labesse §3.5). (d) (Identity terms) If f_E and f are associated then ∫_{G_0(E)} f_E = ∫_{H(F)} f for compatible measures (Labesse Lemme 3.2.2). (e) Only the standard Lie-algebra fundamental lemma enters: in Waldspurger's twisted reduction the non-standard triples arising for base change are tautological (Waldspurger 2008, §§1.9 and 4.12 and the corollary for G_0 = U(n) or SL(n), using Laumon–Ngô). This is the finite-place twisted input of the simple twisted unitary trace formula.

The precise hypotheses are: E/F cyclic, characteristic 0; for (a)–(b): E/F unramified, G_0 unramified with hyperspecial subgroups.

([R. E. Kottwitz, Base change for unit elements of Hecke algebras](https://www.numdam.org/item/CM_1986__60_2_237_0.pdf), Introduction (pp. 237–239); §1, Theorem (p. 243); §4 (p. 249)). For unramified E/F the unit elements of the Hecke algebras of G(E) and G(F) have matching stable twisted and stable orbital integrals.

([J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), §3.2, Lemme 3.2.2 (p. 76); §3.3, Théorème 3.3.1 (p. 78); §3.5 (pp. 82–87); §3.7, Propositions 3.7.2 and 3.7.3 (pp. 91–92)). Equality of total integrals for associated functions; existence of base-change transfer at nonarchimedean places and K-finite transfer at archimedean places; the base-change fundamental lemma for the spherical Hecke algebra with the vanishing at non-norms.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), Introduction (pp. 3–4); §1.9 (p. 16); §4.12 (p. 53)). In the base-change case the non-standard triples are tautological, so twisted transfer and the twisted fundamental lemma follow from the standard Lie-algebra statements; for G_0 = SL(n) or U(n) they hold by Laumon–Ngô.

([Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), §D.1 (p. 367: association in Labesse's sense); §D.2, Lemma D.2.2 and its proof (p. 369)). Uses the base-change fundamental lemma and local transfer of Labesse for unitary groups.

(a) Kottwitz, 'Base change for unit elements of Hecke algebras' (1986): the norm correspondence γ ↔ δ induces a bijection between classes contributing to the two unit-function orbital integrals, with equal integrals (Theorem of §1, p. 243), for G_der simply connected and in general by an unramified z-extension (§4).

(b) Labesse Propositions 3.7.2–3.7.3 (pp. 91–92), citing Clozel and Labesse 1990 for the compatibility of stable orbital integrals with the norm on the whole Hecke algebra, and correcting the vanishing argument at non-norms (Remarque after 3.7.2).

(c) Labesse Théorème 3.3.1 (p. 78) and §3.5; (d) Lemme 3.2.2 (p. 76) via the Weyl integration formula.

(e) Waldspurger 2008 Introduction (base-change corollaries), §1.9 (p. 16) and §4.12 (p. 53).

**Acceptance.**

- G_0 = GL_1: the norm map E^× → F^× and the statement that 1_{𝒪_E^×} and 1_{𝒪_F^×} match for E/F unramified (the norm maps 𝒪_E^× onto 𝒪_F^×).
- G_0 = GL_n, unit elements: Kottwitz's earlier Lemma 8.8 already gives the matching (cited in his 1986 introduction).

*Used by:* ET.4 (finite-place twisted transfer for the simple twisted unitary trace formula); GL2AutomorphicRepresentationsAndTransfer:R17.2/cyclic-local-matching (cyclic base-change matching for GL_2 and the identity-term compatibility).

*Needs:* `ET.0/norm-correspondence`; `ET.1/twisted-transfer-factor`; `ET.1/matching-functions`; `ET.3/group-fundamental-lemma`; `ET.3/local-transfer-existence`; `ET.3/unitary-fundamental-lemma`; `ET.1/real-transfer`; `SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism`.

<a id="et-3-twisted-fundamental-lemma-and-transfer"></a>

### ET.3.10 The twisted fundamental lemma and twisted transfer

Let F be a p-adic field of characteristic 0, (G, θ, ω) a twisted triple with θ quasi-semisimple and (H, ℋ, s, ξ) a twisted endoscopic datum with z-pair (ET.0/endoscopic-datum, ET.0/z-pair), with the corrected twisted transfer factors of ET.1/twisted-transfer-factor. (a) (Waldspurger, Théorème 1.8) If, for all data obtained by descent to semisimple centralizers, Lie-algebra transfer holds for the ordinary data and non-standard transfer holds for the non-standard triples, then twisted transfer exists: every f ∈ C_c^∞(G(F)) has a twisted transfer to H_1. (b) (Waldspurger, Théorème 4.11) Under the unramified hypotheses (§4.4, residue characteristic large), if the Lie-algebra fundamental lemma holds for the descended ordinary data and the non-standard fundamental lemma holds for the non-standard triples, then the twisted fundamental lemma holds for unit elements. (c) The hypotheses of (a) and (b) are theorems: the ordinary Lie-algebra fundamental lemma and transfer (ET.3/lie-algebra-fundamental-lemma, ET.3/change-of-characteristic, ET.3/local-transfer-existence) and the non-standard fundamental lemma (ET.3/nonstandard-fundamental-lemma, with the change of characteristic for it); so twisted transfer and the twisted fundamental lemma for unit elements hold. (d) (Lemaire–Mœglin–Waldspurger) The twisted fundamental lemma for the whole spherical Hecke algebra reduces to the unit elements, hence holds. The twisted weighted fundamental lemma is not claimed here.

The precise hypotheses are: F p-adic of characteristic 0; for (b), (d): unramified data and residue characteristic large; the corrected twisted transfer factors.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), Introduction (pp. 1–4); §1.8 (p. 15); §3.11 (p. 41); §4.11 (p. 52); §5.12 (p. 71)). Théorème 1.8: Lie-algebra transfer and non-standard transfer imply twisted transfer; Théorème 4.11: the Lie-algebra fundamental lemma and the non-standard fundamental lemma imply the twisted fundamental lemma for unit elements.

([Bao Châu Ngô, Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3), Introduction (pp. 1–2) and §8.8 (pp. 186–187)). The non-standard fundamental lemma, which together with the ordinary one gives Waldspurger's twisted fundamental lemma.

(a) Waldspurger 2008 §§2–3, Théorème 1.8 (proof §3.11, p. 41): descent of twisted orbital integrals near θ-semisimple elements to Lie algebras of twisted centralizers, decomposition of stable classes (§3.8) and equality of transfer factors (§3.9).

(b) Waldspurger 2008 §§4–5, Théorème 4.11 (proof §5.12, p. 71).

(c) Combine with Ngô (Théorèmes 1 and 2) and Waldspurger's change of characteristic.

(d) Lemaire–Mœglin–Waldspurger, 'Le lemme fondamental pour l'endoscopie tordue : réduction aux éléments unités', arXiv:1506.03383 (Ann. Sci. ÉNS 51 (2018)); not read; recorded through its abstract.

**Acceptance.**

- For θ = 1 (ordinary endoscopy) the non-standard triples are tautological and (b) is ET.3/group-fundamental-lemma (a).
- For G = GL_{2n+1} with θ the transpose-inverse and H = Sp(2n), descent produces the non-standard triple (Sp(2m), SO(2m+1)), so the non-standard fundamental lemma is genuinely used.

*Used by:* ModularityAndLanglandsExtensions:ML.4/trace-formula-inputs-register (the twisted fundamental lemma and twisted transfer as inputs of the stabilization behind Arthur's classification (the twisted weighted fundamental lemma is not supplied)); ET.5 (the twisted fundamental lemma is proved, so ET.5's description of it as unproved must be corrected).

*Needs:* `ET.3/nonstandard-fundamental-lemma`; `ET.3/lie-algebra-fundamental-lemma`; `ET.3/change-of-characteristic`; `ET.3/local-transfer-existence`; `ET.1/twisted-transfer-factor`; `ET.0/endoscopic-datum`; `ET.0/z-pair`.

<a id="et-3-fundamental-lemma-almost-all-places"></a>

### ET.3.11 The fundamental lemma at almost all places of a global datum

Let F be a number field, G a connected reductive group over F and (H, ℋ, s, ξ) a global endoscopic datum with z-pair, and S a finite set of places containing the archimedean places and the places where G, H or the datum ramify. Then there is a finite set S′ ⊇ S, depending only on G and H (the places of residue characteristic below Waldspurger's bound), such that for every v ∉ S′ the unit element 1_{K_{H,v}} is a transfer of 1_{K_v} with the unramified transfer factors and the spherical Hecke algebras match through b_v (ET.3/group-fundamental-lemma), and similarly for the twisted and base-change data (ET.3/twisted-fundamental-lemma-and-transfer, ET.3/base-change-fundamental-lemma-and-transfer). The global transfer factors are the products of these local ones (ET.1/transfer-factor-properties (f)). In global applications an auxiliary place where G is split may be chosen outside any finite set by Chebotarev's density theorem (upstream Chebotarev roadmap); no statement at the finitely many places of S′ \ S follows from the equal-characteristic theorem by renaming the field.

The precise hypotheses are: F a number field; a global unramified-outside-S endoscopic datum.

([S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.4 (pp. 15–16), the unramified case (3.8)). In the global setting the transfer and the fundamental lemma for unit elements are used at all finite places outside a finite set.

([J.-L. Waldspurger, L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf), §4.4 (p. 48)). The unramified hypotheses, including the bound on the residue characteristic, under which the fundamental lemma is stated.

Apply ET.3/group-fundamental-lemma at each v ∉ S′; the bound on residue characteristics is uniform in v because it depends only on the root data of G and H.

Chebotarev for the auxiliary split place: upstream Chebotarev Layer 10.

**Acceptance.**

- For G = GL_n and H = G, S′ = S and the statement is trivial.
- For unitary similitude groups G_{n⃗} over ℚ attached to a CM field, S′ is finite and contains the primes ramified in the CM field and the primes below Waldspurger's bound.

*Needs:* `ET.3/group-fundamental-lemma`; `ET.3/twisted-fundamental-lemma-and-transfer`; `ET.3/base-change-fundamental-lemma-and-transfer`; `ET.1/transfer-factor-properties`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

## Layer ET.4: Stable and twisted unitary trace comparison

This layer retains the independently corrected statements. Its primary proofs and supplier gaps are listed below; the independent verdict is needs_changes.

<a id="et-4-padic-character-distributions"></a>

### ET.4.1 Harish-Chandra's character theorem and the Weyl integration formula over p-adic fields

Let F be a non-archimedean local field of characteristic 0, G a connected reductive group over F and π an admissible irreducible smooth complex representation of G(F). (a) For f ∈ C_c^∞(G(F)) the operator π(f) has finite rank, and Θ_π(f) = tr π(f) is an invariant distribution. (b) (Harish-Chandra) There is a locally integrable function θ_π on G(F), locally constant on the regular semisimple set G(F)_rs and invariant under conjugation, with Θ_π(f) = ∫_G f(g) θ_π(g) dg for every f; |D^G|^{1/2} θ_π is locally bounded. (c) (Weyl integration formula) For f ∈ C_c^∞(G(F)), ∫_G f(g) dg = Σ_T |N_G(T)(F)/T(F)|^{-1} ∫_{T(F)} |D^G(t)| O_t(f) dt, the sum over representatives T of the G(F)-conjugacy classes of maximal F-tori, with the orbital integrals and measures of ET.1/orbital-integral. (d) Consequently Θ_π(f) = Σ_T |N_G(T)(F)/T(F)|^{-1} ∫_{T(F)} |D^G(t)| θ_π(t) O_t(f) dt, and Θ_π is determined by θ_π on the elliptic regular set together with the characters of proper Levi subgroups through the van Dijk formula for induced representations.

Assume the following conditions.

- F non-archimedean of characteristic 0 (the theorem is used only in characteristic 0 here).
- π admissible and of finite length (irreducible representations are admissible by SmoothRepresentationsOfLocalGroups:SR.3a/admissibility-of-irreducibles).

The proof proceeds through these steps.

1. Finite rank of π(f) is admissibility: f is bi-invariant under some compact open K and π(f) factors through π^K.
2. Local integrability and local constancy on G_rs: Harish-Chandra's theorem, proved by descent to the Lie algebra and the local integrability of Fourier transforms of orbital integrals (ET.1/fourier-transform-orbital-integrals); cited as stated by Kottwitz's Clay notes, Introduction pp. 394–396.
3. For the group formula use the Jacobian of (T(F)\G(F)) × T(F)_rs → G(F)_rs, (x,t) ↦ x⁻¹tx: it is |det(1−Ad(t)|𝔤/𝔱)|. Its fibre has |N_G(T)(F)/T(F)| elements. Kottwitz §7 proves the analogous Lie-algebra formula; it does not itself state the group formula.
4. (d) combines (b) and (c); the formula for parabolically induced characters is van Dijk's, recorded with the induction functor of SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction.

**Acceptance.**

- For G = GL_1, θ_χ = χ for a character χ, and the Weyl integration formula is the identity ∫_{F^×} f = ∫_{F^×} f.
- For the Steinberg representation of GL_2(F), θ_St = −1 on the regular elliptic set (a computation used in ET.6/acceptance-examples).
- Θ_π is nonzero on C_c^∞(G(F)_rs) for every irreducible π (linear independence of characters).

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.1/orbital-integral`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/fourier-transform-orbital-integrals`, `SmoothRepresentationsOfLocalGroups:SR.3a/admissibility-of-irreducibles`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`, `mathlib:MeasureTheory.Measure.IsHaarMeasure`.

The source statements fix the scope of this target.

[R. E. Kottwitz, Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), Introduction, pp. 394–396. states Harish-Chandra's theorem that the distribution character of an admissible representation is given by a locally integrable function, locally constant on the regular set, and outlines the descent to the Lie algebra.

[R. E. Kottwitz, Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf), §7, pp. 421–423 (7.7). derives the Weyl integration formula on the Lie algebra; the group form is the same computation with the Weyl discriminant D^G.

[J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 §2, p. 12 (Proposition 2.2). records the corresponding statement for twisted characters and uses the untwisted theorem as input.

<a id="et-4-twisted-characters"></a>

### ET.4.2 Twisted characters of θ-stable representations

Let E/F be a cyclic extension of non-archimedean local fields of characteristic 0 with Gal(E/F) generated by σ, G_0 connected reductive over F and G = R_{E/F}G_0, so σ acts on G(F) = G_0(E). Let Π be an irreducible admissible representation of G_0(E) with Π ≅ Π∘σ, and fix an intertwiner I_σ : Π → Π∘σ (unique up to scalar; with I_σ^ℓ = 1 where ℓ = [E:F]; cyclic base change additionally uses the canonical extension: for generic Π choose the Whittaker-normalized I_σ preserving the fixed Whittaker functional, and for arbitrary Π use the extension induced on its Langlands standard module and its unique irreducible constituent, as in AC Ch. 1 §2 pp. 10–11). (a) The twisted trace f ↦ tr(Π(f) I_σ) on C_c^∞(G_0(E)) is given by a locally integrable function Θ_{Π,σ}, locally constant near σ-regular elements and invariant under σ-conjugacy g ↦ h g σ(h)^{-1}. (b) (Shintani relation, used to define base change; G_0 = GL_n) If γ ∈ GL_n(E) has σ-regular norm Nγ ∈ GL_n(F) (the norm map of AC Ch. 1 §1), the value Θ_{Π,σ}(γ) depends only on the conjugacy class of Nγ; for general G_0 the norm is defined on stable σ-classes (Labesse 1999 §2.5). (c) The twisted Weyl integration formula expresses ∫_{G_0(E)} f in terms of twisted orbital integrals over σ-conjugacy classes, with stable norms for general G_0; the injectivity on rational σ-conjugacy classes asserted here is restricted to GL_n. (d) The same holds for the coset 𝒢θ of a non-connected group 𝒢^+ = 𝒢 ⋊ ⟨θ⟩ with θ of finite order acting by a quasi-semisimple automorphism, which is the form used for the unitary twisted spaces of ET.4/twisted-trace-formula.

Assume the following conditions.

- F of characteristic 0; Π irreducible admissible and σ-stable.

The proof proceeds through these steps.

1. (a): Clozel's extension of Harish-Chandra's theorem to non-connected groups, recorded as AC Ch. 1 Proposition 2.2 (pp. 11–12); the proof follows ET.4/padic-character-distributions on the coset.
2. For GL_n the norm is injective on σ-conjugacy classes by AC Ch. 1 Lemma 1.1(ii), pp. 3–4. Lemma 1.4, pp. 7–8, gives the elliptic norm criterion; the general reductive-group norm correspondence is on stable classes, with rational classes tracked separately.
3. (d): the same argument applied to the coset of a quasi-semisimple automorphism of finite order.

**Acceptance.**

- For n = 1, Θ_{χ∘N,σ}(γ) = χ(Nγ) for a character χ of F^× (the norm map is the field norm).
- If Π is not σ-stable no twisted character is defined; the statement requires Π ≅ Π∘σ.
- Changing I_σ by an ℓ-th root of unity ζ multiplies Θ_{Π,σ} by ζ.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/padic-character-distributions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/norm-correspondence`, `ReductiveGroupsPartII:RG2.5/dual-of-weil-restriction`.

The source statements fix the scope of this target.

[J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 §1, Lemmas 1.1–1.5, pp. 3–9. defines the norm map for cyclic base change of GL(n), shows that an elliptic regular element is a norm iff its determinant is a norm, and that the norm is injective on σ-conjugacy classes.

[J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 §2, Proposition 2.2, pp. 11–12. states that the twisted character of a σ-stable admissible representation is a locally integrable function, locally constant near σ-regular elements.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §12, pp. 31–32. integrates the twisted character of the base-change lift as a function when proving bijectivity.

<a id="et-4-tamagawa-number-formula"></a>

### ET.4.3 Kottwitz's formula for Tamagawa numbers

Let G be a connected reductive group over a number field F (here F = ℚ), Γ = Gal(F̄/F), Ĝ its dual group with Γ-action, and τ(G) the Tamagawa number of G (AdelicAlgebraicGroups:AA.2/tamagawa-number, for the Tamagawa measure on G(𝔸)/A_{G,∞}). Then τ(G) = |π_0(Z(Ĝ)^Γ)| · |ker^1(F, G)|^{-1}, where ker^1(F,G) = ker(H^1(F,G) → ∏_v H^1(F_v,G)); moreover |ker^1(F,G)| = |ker^1(F, Z(Ĝ))|. The input is Weil's conjecture τ(G_sc) = 1 for simply connected G_sc. For the unitary similitude groups G_n⃗ of ET.0/unitary-elliptic-endoscopic-data with r = number of blocks of n⃗: |π_0(Z(Ĝ_n⃗)^Γ)| = 2^r if [F^+:ℚ] is even or every n_i is even and 2^{r−1} otherwise, so τ(G_n⃗) ∈ {2^r, 2^{r−1}}; τ(G_n⃗) = 2^r when every n_i is even, τ(G_n⃗) = 2^{r−1} when [F^+:ℚ] is odd and some n_i is odd; and the base-change group 𝒢_n⃗ = R_{F_0/ℚ}(G_n⃗ ×_ℚ F_0) has τ(𝒢_n⃗) = 1. The coefficient ι(G,H) = τ(G) τ(H)^{-1} |Out(H,s,η)|^{-1} of ET.4/stable-elliptic-distribution is computed from these values.

Assume the following conditions.

- G connected reductive over a number field; Weil's conjecture τ(G_sc) = 1 for the simply connected groups that occur (the special unitary groups here, for which it is classical; the general case is Kottwitz 1988 with Chernousov's E_8 Hasse principle).

The proof proceeds through these steps.

1. Kottwitz 1988 (Ann. of Math. 127, p. 629): reduce to G_der simply connected by a z-extension (ReductiveGroupsPartII:RG2.1/z-extension-existence), use τ(G_sc) = 1 and Ono's formula for tori; cited here through Shin 2010 display (1.2) and Shin 2011 (3.3).
2. |ker^1(F,G)| = |ker^1(F,Z(Ĝ))| is Kottwitz 1984 (4.2.2), the duality of ET.0/kottwitz-duality.
3. For G_n⃗: Z(Ĝ_n⃗) = ℂ^× × ∏_{σ,i} ℂ^×; its Γ-invariants are the (λ,(g_i)) with g_i = ±1 and λ (∏ g_i^{n_i})^{[F^+:ℚ]} = 1, giving the component count; ker^1 of 𝒢_n⃗ is trivial by Shapiro's lemma and Hilbert 90 (Shin 2011 Lemma 3.1 and Remark 3.2).

**Acceptance.**

- τ(𝔾_m) = 1 and τ(R_{F_0/ℚ}𝔾_m) = 1.
- τ(U(1)) = 2 for the norm-one torus of an imaginary quadratic F_0 (π_0 of (ℂ^×)^Γ = {±1}, ker^1 trivial).
- For n⃗ = (1) and [F^+:ℚ] odd, |π_0(Z(Ĝ_{(1)})^Γ)| = 2^{r−1} = 1 and ker^1 is trivial, so τ(G_{(1)}) = 1 (Shin 2011 Remark 3.2).

*Needs:* `AdelicAlgebraicGroups:AA.2/tamagawa-number`, `AdelicAlgebraicGroups:AA.2/tamagawa-measure`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/kottwitz-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/unitary-elliptic-endoscopic-data`, `ReductiveGroupsPartII:RG2.1/z-extension-existence`, `ReductiveGroupsPartII:RG2.5/langlands-dual-group`.

The source statements fix the scope of this target.

[S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §1.2, display (1.2), p. 4. states Kottwitz's formula τ(G) = |π_0(Z(Ĝ)^Γ)|/|ker^1(ℚ,G)| as the convention behind the Igusa coefficients.

[S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.1, Lemma 3.1 with (3.3) and Remark 3.2, pp. 13–14. computes the component group and ker^1 for G_n⃗, gives τ(G_n⃗) ∈ {2^r, 2^{r−1}} and τ = 1 for the base-change group, citing Kottwitz 1988 p. 629.

<a id="et-4-stable-elliptic-distribution"></a>

### ET.4.4 The stable elliptic distribution ST^H_e and the coefficient ι(G,H)

Let (H,s,η) be an elliptic endoscopic triple of a connected reductive ℚ-group G. Work in the space of smooth functions compactly supported modulo A_{H,∞}^0 (the positive real points of the maximal ℚ-split central torus), transforming under a fixed compatible central character χ; all quotient measures and traces use this same convention. For stable-cuspidal h_∞ define ST^H_e(h) = τ(H) Σ_{[γ_H]_st,ell} |π₀(H_{γ_H})(ℚ)|⁻¹ SO_{γ_H}(h), with the connected-centralizer measures and signs specified by Shin 2010 (7.3), p. 26. The coefficient is ι(G,H)=τ(G)τ(H)⁻¹|Out(H,s,η)|⁻¹. For the unitary similitude endoscopic groups in this packet the centralizers are connected, so the component factor is 1.

Assume the following conditions.

- Only ℚ-elliptic semisimple classes enter; h_∞ must be stable cuspidal so that non-elliptic terms vanish at ∞.

The proof proceeds through these steps.

1. Use the central quotient, support conditions and summation convention of Shin 2010 §1.2 and (7.3). Compactness modulo the entire centre alone does not imply finiteness: a torus would leave all rational central translates. Any finiteness assertion must be made on the specified quotient and support, not inferred from compact support modulo Z(H).
2. ST^H_e is a stable distribution: each SO_{γ_H} is stable (ET.1/kappa-and-stable-orbital-integrals).
3. ι(G,H) depends only on the isomorphism class of the triple.

Expose the following operations and relations.

- `StableEllipticDistribution` (constructor): Let (H,s,η) be an elliptic endoscopic triple of a connected reductive ℚ-group G. Work in the space of smooth functions compactly supported modulo A_{H,∞}^0 (the positive real points of the maximal ℚ-split central torus), transforming under a fixed compatible central character χ; all quotient measures and traces use this same convention. For stable-cuspidal h_∞ define ST^H_e(h) = τ(H) Σ_{[γ_H]_st,ell} |π₀(H_{γ_H})(ℚ)|⁻¹ SO_{γ_H}(h), with the connected-centralizer measures and signs specified by Shin 2010 (7.3), p. 26. The coefficient is ι(G,H)=τ(G)τ(H)⁻¹|Out(H,s,η)|⁻¹. For the unitary similitude endoscopic groups in this packet the centralizers are connected, so the component factor is 1.
- `StableEllipticDistribution.isStable` (characterisation): ST^H_e vanishes on h all of whose stable orbital integrals vanish.
- `StableEllipticDistribution.linear` (simp): ST^H_e is linear in h.
- `endoscopicCoefficient` (constructor): ι(G,H) = τ(G)τ(H)^{-1}|Out(H,s,η)|^{-1}.
- `endoscopicCoefficient_self` (simp): ι(G,G) = 1 for the trivial triple.
- `endoscopicCoefficient_iso` (relation): ι(G,H) depends only on the isomorphism class of (H,s,η).

**Checks.**

- `StableEllipticDistribution.torus`: For a torus the connected-centralizer component factor is 1, and the formula is τ(T) times the rational sum with A_{T,∞}^0 and the central-character convention fixed; no finiteness follows merely from compact support modulo the whole torus.
- `endoscopicCoefficient_equal_blocks`: For G = G_{2n} and H = G_{n,n}, |Out(H,s,η)| = 2, so ι(G,H) = τ(G)/(2τ(H)).
- `StableEllipticDistribution.non_elliptic_zero`: A semisimple class that is not elliptic at infinity has zero orbital integral against h_∞ stable cuspidal. A sum of stable orbital integrals over more classes remains stable; the ellipticity test checks the selected geometric term, not stability.
- `endoscopicCoefficient_self_test`: For the trivial triple (G,1,id), ι(G,G) = 1.

Use this interface as follows.

- `Shin 2010 Theorem 7.2`: the stable Igusa trace formula is a sum of ι(G,H) ST^H_e(h^H) over elliptic triples (ET.5/stable-igusa-trace-formula)
- `Caraiani–Scholze non-compact §5.5, Proposition 5.5.1`: the geometric side of the twisted trace formula equals τ(G_n⃗)^{-1} ST^{G_n⃗}_e (ET.4/twisted-geometric-side)
- `Shin 2011 Corollary 4.7`: same identity in the compact case

**Acceptance.**

- For a torus the connected-centralizer component factor is 1, and the formula is τ(T) times the rational sum with A_{T,∞}^0 and the central-character convention fixed; no finiteness follows merely from compact support modulo the whole torus.
- For G = G_{2n} and H = G_{n,n}, |Out(H,s,η)| = 2, so ι(G,H) = τ(G)/(2τ(H)).
- A semisimple class that is not elliptic at infinity has zero orbital integral against h_∞ stable cuspidal. A sum of stable orbital integrals over more classes remains stable; the ellipticity test checks the selected geometric term, not stability.
- For the trivial triple (G,1,id), ι(G,G) = 1.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.1/kappa-and-stable-orbital-integrals`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/endoscopic-datum`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/tamagawa-number-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/pseudocoefficients`, `AdelicAlgebraicGroups:AA.2/tamagawa-measure`.

The source statements fix the scope of this target.

[S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §1.2 pp. 3–4; §7 (7.3) p. 26 and Theorem 7.2 p. 27. defines ι(G,H) as τ(G)τ(H)^{-1}|Out(H,s,η)|^{-1} and uses ST^H_e as the stable elliptic part of the trace formula of H.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.3, Theorem 5.3.2, p. 68; Proposition 5.5.1, p. 73. uses ST^{G_n⃗}_e as the sum of stable orbital integrals over ℚ-elliptic semisimple stable classes, normalised by τ.

<a id="et-4-elliptic-stabilization"></a>

### ET.4.5 Kottwitz's stabilization of the elliptic terms

Let G be connected reductive over ℚ with G_der simply connected, f = ∏_v f_v ∈ C_c^∞(G(𝔸)) with f_∞ the Euler–Poincaré (Lefschetz) function of an irreducible algebraic representation ξ (ET.1/pseudocoefficients). Let T_e(f) = Σ_{γ_0} τ(I_0) · Σ_{γ ∈ adelic class} e(γ) O_γ(f) be the elliptic part of the trace formula written over pairs (γ_0, γ) with γ_0 elliptic semisimple and γ adelically conjugate to γ_0. Then T_e(f) = Σ_{(H,s,η)} ι(G,H) ST^H_e(f^H), the sum over isomorphism classes of elliptic endoscopic triples of G, where f^H = ∏_v f^H_v with f^H_v a transfer of f_v (ET.1/matching-functions, ET.3/local-transfer-existence), f^H_v the unramified image of f_v at almost all v (ET.3/fundamental-lemma-almost-all-places), and f^H_∞ the explicit combination of averaged pseudo-coefficients of ET.1/archimedean-pseudocoefficient-transfer. The ker^1 factors and the κ-sum are those of ET.0/global-kottwitz-obstruction.

Assume the following conditions.

- G_der simply connected (achieved by a z-extension otherwise)
- f_∞ stable cuspidal (Euler–Poincaré), so only elliptic terms occur
- transfer factors normalised as a global product equal to 1 on rational pairs (ET.1/transfer-factor-properties)
- At infinity use functions compact modulo A_{G,∞}^0 with the central character fixed by ξ, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; C_c^∞ in this node denotes this central-character space, not ordinary compact support on the whole group.

The proof proceeds through these steps.

1. Rewrite each adelic orbital integral as a sum over κ ∈ 𝔎(I_0/ℚ) of κ-orbital integrals using the global obstruction (ET.0/global-kottwitz-obstruction (c)) and Fourier inversion on the finite abelian group.
2. Regroup pairs (γ_0, κ) by the endoscopic triples (H,s,η) with γ_H transferring to γ_0 (Kottwitz 1986 §9; Shin 2010 §5.1, Lemma 5.1).
3. Replace κ-orbital integrals at each place by stable orbital integrals of transfers (ET.3/local-transfer-existence, ET.3/fundamental-lemma-almost-all-places, ET.1/archimedean-pseudocoefficient-transfer); collect the Tamagawa numbers with ET.4/tamagawa-number-formula to obtain ι(G,H).
4. This is Kottwitz 1986 Theorem 9.6, recorded by Shin 2011 p. 36 and used for the Igusa counting formula in Shin 2010 §§5–7; its primary text is cited through those secondary statements.

**Acceptance.**

- For G anisotropic with only the trivial elliptic endoscopic triple, T_e(f) = ST^G_e(f^G) with f^G = f.
- For G = 𝔾_m every class is stable and the identity is tautological.
- For a unitary similitude group G_N the sum runs over (G_N,1,id) and the (G_{n_1,n_2}, s, η) of ET.0/unitary-elliptic-endoscopic-data.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/stable-elliptic-distribution`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/global-kottwitz-obstruction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/matching-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/local-transfer-existence`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/fundamental-lemma-almost-all-places`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/archimedean-pseudocoefficient-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/transfer-factor-properties`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/tamagawa-number-formula`.

The source statements fix the scope of this target.

[S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.4, p. 36. records that the trace formula for compact quotients is stabilised on the geometric side after Langlands and Kottwitz, especially Kottwitz 1986 Theorem 9.6.

[S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §5.1, Lemma 5.1, pp. 15–16; §7, Lemma 7.1, p. 26. performs the same regrouping by κ and endoscopic triples for the Igusa counting formula.

<a id="et-4-base-change-groups"></a>

### ET.4.6 Base-change groups and the L-morphisms BC and ζ̃

Let F = F^+F_0 be a CM field (F_0 imaginary quadratic, [F^+:ℚ] ≥ 2), n⃗ = (n_1,…,n_s) and G_n⃗ the quasi-split unitary similitude group of ET.0/unitary-elliptic-endoscopic-data, with the character ϖ : 𝔸_{F_0}^×/F_0^× → ℂ^× extending the quadratic character of F_0/ℚ fixed there. Put 𝒢_n⃗ = R_{F_0/ℚ}(G_n⃗ ×_ℚ F_0); then 𝒢_n⃗ ≅ R_{F_0/ℚ}𝔾_m × R_{F/ℚ}GL_n⃗ and its dual group is ℂ^× × ℂ^× × ∏_{σ ∈ Φ} GL_n⃗(ℂ) (Φ the embeddings F → ℂ), W_{F_0} permuting the σ-factors and w ∉ W_{F_0} acting by (λ_+, λ_−, (g_σ)) ↦ (λ_− ∏_{σ ∉ Φ^+} det g_σ, λ_+ ∏_{σ ∈ Φ^+} det g_σ, (Φ_n⃗ ᵗg_{c w^{-1}σ}^{-1} Φ_n⃗^{-1})_σ). The construction gives: (a) the base-change L-morphism BC_n⃗ : ^LG_n⃗ → ^L𝒢_n⃗, (λ,(g_σ)_{σ∈Φ^+}) ⋊ w ↦ (λ, λ, (g_σ)_{σ∈Φ^+}, (g_{cσ})_{σ∉Φ^+}) ⋊ w; (b) for n_1 + n_2 = N the L-morphism ζ̃_{n_1,n_2} : ^L𝒢_{n_1,n_2} → ^L𝒢_N extending GL_{n_1} × GL_{n_2} ⊂ GL_N by the ϖ-twist of η̃_{n_1,n_2} on W_{F_0} and the element (a_{n_1,n_2}, a_{n_1,n_2}, (Φ_{n_1,n_2}Φ_N^{-1})_σ) on a fixed w* ∉ W_{F_0}; (c) the commutative square BC_N ∘ η̃_{n_1,n_2} = ζ̃_{n_1,n_2} ∘ BC_{n_1,n_2}; (d) the automorphism θ of 𝒢_n⃗ induced by the non-trivial element of Gal(F_0/ℚ), θ(λ, g) = (λ^c, λ^c g^♯) with g^♯ = Φ_n⃗ ᵗ(g^c)^{-1} Φ_n⃗^{-1} (the inverse is required; the non-compact sequel §5.5 omits it, see sourceIssues), so that 𝒢_n⃗ ⋊ Gal(F_0/ℚ) ≅ 𝒢^+_n⃗ = 𝒢_n⃗ ⋊ {1, θ}.

Assume the following conditions.

- F = F^+F_0 CM with F_0 imaginary quadratic; ϖ fixed as in ET.0/unitary-elliptic-endoscopic-data; a_{n_1,n_2} a fixed square root of (−1)^{N(n_1,n_2)} with N(n_1,n_2) = [F^+:ℚ](n_1ε(n_1) + n_2ε(n_2))/2 and ε(m) ∈ {0,1} the parity of m.

The proof proceeds through these steps.

1. Compute the dual group of R_{F_0/ℚ}(G_n⃗)_{F_0} from the Weil-restriction rule (ReductiveGroupsPartII:RG2.5/dual-of-weil-restriction).
2. Define BC_n⃗ and ζ̃ by the displayed formulas and check they are L-morphisms by comparing with the action of w ∉ W_{F_0} (Caraiani–Scholze non-compact §5.4, p. 69).
3. The square (c) commutes by direct computation on Ĝ and on w* (Caraiani–Scholze non-compact (5.4.1), p. 69; Shin 2011 §3.2 and §4.4).

Expose the following operations and relations.

- `BaseChangeGroup` (constructor): 𝒢_n⃗ = R_{F_0/ℚ}(G_n⃗ ×_ℚ F_0).
- `BaseChangeGroup.equivGL` (equivalence): 𝒢_n⃗ ≅ R_{F_0/ℚ}𝔾_m × R_{F/ℚ}GL_n⃗ over ℚ.
- `BaseChangeGroup.theta` (data): The order-two automorphism θ(λ,g) = (λ^c, λ^c g^♯).
- `BaseChangeGroup.theta_sq` (simp): θ² = id.
- `BCLMorphism` (constructor): The base-change L-morphism BC_n⃗ : ^LG_n⃗ → ^L𝒢_n⃗.
- `zetaLMorphism` (constructor): The L-morphism ζ̃_{n_1,n_2} : ^L𝒢_{n_1,n_2} → ^L𝒢_N.
- `BCLMorphism_comm` (relation): BC_N ∘ η̃_{n_1,n_2} = ζ̃_{n_1,n_2} ∘ BC_{n_1,n_2}.
- `BaseChangeGroup.semidirect` (equivalence): 𝒢_n⃗ ⋊ Gal(F_0/ℚ) ≅ 𝒢_n⃗ ⋊ {1,θ}, with c ↦ θ.

**Checks.**

- `BaseChangeGroup.rank_one`: For n⃗ = (1), 𝒢_{(1)}(ℚ) = F_0^× × F^×.
- `BaseChangeGroup.theta_fixed`: The θ-fixed points of 𝒢_n⃗(ℚ) are G_n⃗(ℚ).
- `BCLMorphism_comm_test`: The square BC_N ∘ η̃ = ζ̃ ∘ BC holds on W_{F_0} and on w*.
- `BaseChangeGroup.not_base_change`: 𝒢_n⃗ is not G_n⃗ ×_ℚ F_0 viewed over F_0: it is its Weil restriction to ℚ, whose ℚ-points are G_n⃗(F_0).

Use this interface as follows.

- `Caraiani–Scholze non-compact §5.4, (5.4.2)–(5.4.3)`: the transfers BC* and ζ̃* of unramified Hecke algebras are dual to these L-morphisms
- `Shin 2011 §4.4`: compatibility of transfers along ζ̃ and BC
- `ET.7a/twisted-spectral-normalization`: the twisted spectral coefficients are computed on 𝒢^+_n⃗

**Acceptance.**

- For n⃗ = (1), 𝒢_{(1)}(ℚ) = F_0^× × F^×.
- The θ-fixed points of 𝒢_n⃗(ℚ) are G_n⃗(ℚ).
- The square BC_N ∘ η̃ = ζ̃ ∘ BC holds on W_{F_0} and on w*.
- 𝒢_n⃗ is not G_n⃗ ×_ℚ F_0 viewed over F_0: it is its Weil restriction to ℚ, whose ℚ-points are G_n⃗(F_0).

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.0/unitary-elliptic-endoscopic-data`, `ReductiveGroupsPartII:RG2.5/l-group`, `ReductiveGroupsPartII:RG2.5/dual-of-weil-restriction`, `ReductiveGroupsPartII:RG2.5/langlands-dual-group`.

The source statements fix the scope of this target.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, (5.4.1) and the definitions of BC_n⃗ and ζ̃_{n_1,n_2}, pp. 69–70. defines the base-change group, its dual group, the L-morphisms BC and ζ̃ and checks the commutative square.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, p. 72. defines the twisted group 𝒢^+_n⃗ = (R_{F_0/ℚ}𝔾_m × R_{F/ℚ}GL_n⃗) ⋊ {1,θ} and identifies 𝒢_n⃗ ⋊ Gal(F_0/ℚ) with it.

[S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.1 and §3.2, pp. 12–14. defines G_n⃗, its dual group and the L-morphisms in the compact case.

<a id="et-4-unramified-transfers"></a>

### ET.4.7 Unramified transfers BC*, ζ̃*, η̃* and their compatibilities

With ET.4/base-change-groups, let v be a place of ℚ outside a finite set S containing ∞, p, ℓ and the primes where F or ϖ ramifies. (a) The L-morphisms BC_n⃗, ζ̃_{n_1,n_2} and η̃_{n_1,n_2} induce, through the Satake isomorphism (SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism), algebra maps BC*_n⃗ : H^ur(𝒢_n⃗(ℚ_v)) → H^ur(G_n⃗(ℚ_v)), ζ̃*_{n_1,n_2} : H^ur(𝒢_N(ℚ_v)) → H^ur(𝒢_{n_1,n_2}(ℚ_v)) and η̃*_{n_1,n_2} : H^ur(G_N(ℚ_v)) → H^ur(G_{n_1,n_2}(ℚ_v)), and dual maps on unramified representations, with tr π(η̃*φ) = tr η̃_*(π)(φ) and the same for BC and ζ̃. (b) The squares BC*_{n_1,n_2} ∘ ζ̃*_{n_1,n_2} = η̃*_{n_1,n_2} ∘ BC*_N on Hecke algebras and the dual square on unramified representations commute. (c) Explicitly, for Q_{n_1,n_2} a parabolic of 𝒢_N with Levi 𝒢_{n_1,n_2}: ζ̃*_{n_1,n_2}(f_v) = f_v^{Q} · χ_{ϖ,v}, the normalised constant term times the character χ_ϖ(λ,g_1,g_2) = ϖ(λ^{−N(n_1,n_2)} ∏_i N_{F/F_0}(det g_i)^{ε(n_i)}), and ζ̃_{n_1,n_2,*}(Π_v) = n-Ind(Π_v ⊗ χ_{ϖ,v}); these formulas extend to all f_v ∈ C_c^∞ and all Π_v ∈ Rep(𝒢_{n_1,n_2}(ℚ_v)), since both groups are products of restrictions of scalars of general linear groups.

Assume the following conditions.

- v ∉ S for the unramified statements (a),(b); (c) holds at every place v.

The proof proceeds through these steps.

1. (a): functoriality of the Satake isomorphism along L-morphisms between unramified groups (SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism, SR.4/spherical-parameter).
2. (b): apply (a) to the commutative square of ET.4/base-change-groups (c) (Caraiani–Scholze non-compact (5.4.2)–(5.4.3), from Shin 2011 (4.18)).
3. (c): the constant-term formula tr π(f^Q) = tr n-Ind(π)(f) and its unramified version (Shin 2011 Lemma 3.3), with the twist by χ_ϖ read off from ζ̃ (Caraiani–Scholze non-compact Remark 5.4.1).

**Acceptance.**

- For v split in F_0, BC*_n⃗ is surjective (Shin 2011 §4.2, Case 2).
- For n_2 = 0, ζ̃* is the identity.
- tr(n-Ind(Π ⊗ χ_ϖ))(f) = tr Π(f^Q · χ_ϖ) for f ∈ C_c^∞(𝒢_N(ℚ_v)) (constant-term adjunction).

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/base-change-groups`, `SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism`, `SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`.

The source statements fix the scope of this target.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, (5.4.2), (5.4.3) and Remark 5.4.1, pp. 69–70. defines the unramified transfers dual to BC and ζ̃, records the two commuting squares and gives the explicit constant-term-and-χ_ϖ formula.

[S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §3.3, Lemma 3.3, p. 15; §4.2, (4.4), p. 22; §4.4, (4.18)–(4.20), pp. 25–26. proves the constant-term trace identity, the unramified base-change character identity and the compatibility of transfers.

<a id="et-4-base-change-transfer-of-functions"></a>

### ET.4.8 Base-change transfer of test functions at every place

With ET.4/base-change-groups: (a) (split places) if v splits in F_0 (in particular v = p in the applications), every f_v ∈ C_c^∞(𝒢_n⃗(ℚ_v)) has a BC-transfer φ_v ∈ C_c^∞(G_n⃗(ℚ_v)) (Shin 2011 §4.2, Case 2), i.e. tr π_v(φ_v) = tr(BC(π_v)(f_v) ∘ A_θ) for the normalised θ-intertwiner, and the map f_v ↦ φ_v is surjective onto C_c^∞(G_n⃗(ℚ_v)); base change of irreducible representations at such v is injective. (b) (all finite places; Labesse 1999 Théorème 3.3.1) every f_v ∈ C_c^∞(𝒢_n⃗(ℚ_v)) has a φ_v with matching orbital integrals, i.e. SO_γ(φ_v) equals the stable twisted orbital integral of f_v at δ when γ is a norm of δ, and SO_γ(φ_v) = 0 when γ is not a norm. (c) (inverse transfer; Labesse 1999 Proposition 3.3.2) a function φ_v ∈ C_c^∞(G_n⃗(ℚ_v)) whose stable orbital integrals vanish at every semisimple element that is not a norm is a BC-transfer of some f_v. (d) (norm criterion) a semisimple γ ∈ G_n⃗(ℚ_v) is a norm iff its image in the cocentre D_n⃗ = G_n⃗/G_n⃗^der is a norm; for v split in F_0 every element is a norm (Caraiani–Scholze non-compact Lemma 5.4.3, via Labesse 1999 Proposition 2.5.3).

Assume the following conditions.

- v finite; in (c),(d) v may be inert or ramified in F_0.

The proof proceeds through these steps.

1. (a): at split v, 𝒢_n⃗(ℚ_v) ≅ G_n⃗(ℚ_v) × G_n⃗(ℚ_v) with θ swapping factors; take φ_v the convolution of the two components (Shin 2011 §4.2, Case 2).
2. (b),(c): Labesse's transfer for stable base change, the twisted analogue of ET.3/local-transfer-existence, recorded at ET.3/base-change-fundamental-lemma-and-transfer (c); Proposition 3.3.2 is its converse for functions supported on norms.
3. (d): Labesse 1999 Proposition 2.5.3 reduces to the cocentre of an elliptic Levi M containing γ; the explicit description of D_n⃗ and D_M as tori with multiplier λ shows that an element of D_M is a norm iff its image in D_n⃗ is (Caraiani–Scholze non-compact proof of Lemma 5.4.3, after Morel 2010 Lemma 8.3.6).

**Acceptance.**

- At split v, with vol(K) = 1, the BC-transfer of 1_K ⊗ 1_K is 1_K.
- For n⃗ = (1) the norm criterion reduces to the classical criterion for the multiplier torus.
- A function supported on non-norms has BC-transfer 0 under (b).

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/base-change-groups`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/base-change-fundamental-lemma-and-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-characters`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/matching-functions`.

The source statements fix the scope of this target.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, Proposition 5.4.2 and Lemma 5.4.3 with proof, pp. 70–71. recalls Labesse's existence and inverse-transfer criteria and proves the cocentre norm criterion for a general imaginary CM field.

[J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Proposition 2.5.3 p. 61; Théorème 3.3.1 pp. 78–79 and Proposition 3.3.2 p. 79 (Numdam edition). proves that an elliptic semisimple element is a norm iff its cocentre image is, the existence of base-change transfer, and the converse for functions with stable orbital integrals supported on norms.

[S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.2, Cases 1–2, pp. 22–23. constructs BC-matching functions at unramified and at split places.

<a id="et-4-small-level-transfer"></a>

### ET.4.9 Small-level functions are base-change transfers (the level N_0)

Let S_pf be a finite set of finite primes at which F_0 need not be split. For every v ∈ S_pf there is an open neighbourhood U_v of 1 in G_N(ℚ_v) such that every φ_v ∈ C_c^∞(G_N(ℚ_v)) supported in U_v has the property that, for each elliptic endoscopic G_n⃗ of G_N and each Langlands–Shelstad transfer φ_v^n⃗ of φ_v to G_n⃗(ℚ_v), φ_v^n⃗ is the BC-transfer of some f_v^n⃗ ∈ C_c^∞(𝒢_n⃗(ℚ_v)). Consequently there is an integer N_0 ≥ 3 divisible only by primes in S_pf such that, for every N divisible by N_0, the characteristic function of the principal congruence subgroup K(N)_v has this property at every v ∈ S_pf, and every sufficiently small compact open subgroup is transferable in the sense of Liu–Tian–Xiao–Zhang–Zhu Definition D.2.1.

Assume the following conditions.

- v ∈ S_pf finite; the elliptic endoscopic groups are those of ET.0/unitary-elliptic-endoscopic-data.

The proof proceeds through these steps.

1. By ET.4/base-change-transfer-of-functions (d), there is a neighbourhood U_n⃗ of 1 in G_n⃗(ℚ_v) all of whose semisimple elements are norms, because norms in a torus contain a neighbourhood of 1.
2. Morel 2010 Lemma 8.4.2 gives a neighbourhood V_n⃗ of 1 in G_N(F_0 ⊗ ℚ_v) such that semisimple elements of G_n⃗(ℚ_v) conjugate into V_n⃗ are conjugate into U_n⃗; intersect over the finitely many n⃗.
3. If SO_γ(φ^n⃗) ≠ 0 then γ matches some δ with O_δ(φ) ≠ 0, so δ ∈ U and γ is conjugate into U_n⃗, hence a norm; conclude by ET.4/base-change-transfer-of-functions (c) (Caraiani–Scholze non-compact proof of Lemma 5.4.4, after Morel 2010 Lemma 8.4.1).

**Acceptance.**

- For v split in F_0, U_v = G_N(ℚ_v) works.
- When every prime of S_pf splits in F_0, every level satisfies the transfer condition.
- The constant function 1_{G_N(ℤ_v)} need not be transferable in this sense at a ramified v; small support is a genuine hypothesis.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/base-change-transfer-of-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/local-transfer-existence`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/unitary-elliptic-endoscopic-data`.

The source statements fix the scope of this target.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, Lemma 5.4.4 and Remark 5.4.5, pp. 71–72. proves that functions supported near the identity at bad places have transfers that are base-change transfers and defines N_0 accordingly.

[Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Appendix D.2 Definition D.2.1 and Lemma D.2.2(3), p. 369. uses that every sufficiently small compact open subgroup at a bad place is transferable.

<a id="et-4-archimedean-lefschetz-functions"></a>

### ET.4.10 Archimedean Euler–Poincaré and twisted Lefschetz functions for unitary similitude groups

Let G be a unitary similitude group over ℚ that is an inner form of G_N at ∞ of arbitrary signature, ξ an irreducible algebraic representation of G_ℂ, and Ξ = ξ ⊗ ξ the corresponding representation of (𝒢_n⃗)_ℂ. Construct: (a) the Euler–Poincaré function φ_{G_n⃗,ξ} (ET.1/pseudocoefficients) and Labesse's twisted Lefschetz function f_{𝒢_n⃗,Ξ} ∈ C_c^∞(𝒢_n⃗(ℝ)), whose twisted traces compute twisted Lefschetz numbers of (𝔤,K)-cohomology; they are BC-matching; (b) for each elliptic endoscopic G_n⃗ of G, the function φ^n⃗_∞ = e_n⃗(Δ_∞)(−1)^{q(G)}⟨μ_h, s⟩ Σ_{φ_H} det(ω_*(φ_H)) φ_{φ_H}, the sum over discrete L-parameters φ_H of G_n⃗ with η̃_n⃗ ∘ φ_H equivalent to the parameter of ξ, φ_{φ_H} the averaged pseudo-coefficient of the packet and q(G) = ½ dim G(ℝ)/K_∞A_{G,∞}^0; (c) the twisted analogue f^n⃗_∞ = e_n⃗(Δ_∞)(−1)^{q(G)}⟨μ_h, s⟩ Σ_{φ_n⃗} det(ω_*(φ_n⃗)) f_{𝒢_n⃗,Ξ(φ_n⃗)}; then f^n⃗_∞ and φ^n⃗_∞ are BC-matching, and φ^n⃗_∞ is a transfer of the Euler–Poincaré function of G (Kottwitz's construction, ET.1/archimedean-pseudocoefficient-transfer).

Assume the following conditions.

- G_ℝ an inner form of G_N of arbitrary signature (not only Harris–Taylor signature); ξ irreducible algebraic; the sign e_n⃗(Δ_∞) and ⟨μ_h,s⟩ fixed by the transfer-factor normalisation of ET.1/transfer-factor-properties.
- At infinity use functions compact modulo A_{G,∞}^0 with the central character fixed by ξ, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; C_c^∞ in this node denotes this central-character space, not ordinary compact support on the whole group.

The proof proceeds through these steps.

1. (a): Labesse 1991 Proposition 12 gives f_{𝒢,Ξ}; BC-matching with φ_{G,ξ} is Shin 2011 §4.3 (pp. 23–24) and Caraiani–Scholze non-compact §5.4 (p. 70).
2. (b): Shin 2011 (5.11), p. 35, with the real endoscopic signs of Shin 2011 §3.6; for arbitrary signature use q(G) and the packets of G_ℝ (Caraiani–Scholze 2017 §5.2 p. 735 and §5.3 pp. 737–738).
3. (c): Shin 2011 (6.7), p. 43; BC-matching of f^n⃗_∞ and φ^n⃗_∞ follows termwise from (a).

Expose the following operations and relations.

- `eulerPoincareFunction` (constructor): φ_{G,ξ}, the averaged pseudo-coefficient of the discrete packet of ξ^∨.
- `twistedLefschetzFunction` (constructor): f_{𝒢,Ξ}, Labesse's twisted Lefschetz function for Ξ = ξ ⊗ ξ.
- `twistedLefschetzFunction_trace` (characterisation): tr(Π(f_{𝒢,Ξ}) A_θ) is the twisted Lefschetz number Σ_i (−1)^i tr(θ | H^i(𝔤,K; Π ⊗ Ξ)).
- `lefschetz_bcMatching` (compatibility): f_{𝒢,Ξ} and φ_{G,ξ} are BC-matching.
- `endoscopicInfinityFunction` (constructor): φ^n⃗_∞ as the signed combination over discrete parameters φ_H with η̃∘φ_H ~ φ_ξ.
- `twistedEndoscopicInfinityFunction` (constructor): f^n⃗_∞ as the matching combination of Lefschetz functions.
- `endoscopicInfinityFunction_isTransfer` (compatibility): φ^n⃗_∞ is a transfer of the Euler–Poincaré function of G (Kottwitz).
- `twistedLefschetzFunction_cuspidal` (other): f_{𝒢,Ξ} is cuspidal: its twisted orbital integrals vanish off θ-elliptic elements.

**Checks.**

- `eulerPoincareFunction.trivial_compact`: If G(ℝ)/A_{G,∞}^0 is compact and ξ=1 with trivial central character, its normalized constant function represents the Euler–Poincaré trace. Compactness merely modulo the full centre does not imply this assertion.
- `lefschetz_bcMatching.signature_check`: For arbitrary signature recompute q(G), the Shimura cocharacter μ_h, the pairing ⟨μ_h,s⟩ and the contributing real packets. Holding μ_h fixed while changing signature need not preserve the endoscopic coefficients.
- `endoscopicInfinityFunction.sign`: For the trivial triple the coefficient is (−1)^{q(G)}.
- `twistedLefschetzFunction.wrong_weight`: On a compact real quotient choose ξ and a coefficient Ξ′ whose restriction along the base-change embedding has a different highest weight and no ξ-constituent. Schur orthogonality distinguishes their traces and prevents matching; mere inequality Ξ′≠ξ⊗ξ is insufficient.

Use this interface as follows.

- `Caraiani–Scholze 2017 Corollary 5.2.5, Theorem 5.3.2`: the archimedean components of the Igusa test functions and of their base-change partners
- `Caraiani–Scholze non-compact Definition 5.3.1(4)`: φ^n⃗_∞ is a combination of Euler–Poincaré functions
- `ET.4/twisted-geometric-side`: cuspidality of f^n⃗_∞ at ∞ kills non-elliptic twisted terms

**Acceptance.**

- If G(ℝ)/A_{G,∞}^0 is compact and ξ=1 with trivial central character, its normalized constant function represents the Euler–Poincaré trace. Compactness merely modulo the full centre does not imply this assertion.
- For arbitrary signature recompute q(G), the Shimura cocharacter μ_h, the pairing ⟨μ_h,s⟩ and the contributing real packets. Holding μ_h fixed while changing signature need not preserve the endoscopic coefficients.
- For the trivial triple the coefficient is (−1)^{q(G)}.
- On a compact real quotient choose ξ and a coefficient Ξ′ whose restriction along the base-change embedding has a different highest weight and no ξ-constituent. Schur orthogonality distinguishes their traces and prevents matching; mere inequality Ξ′≠ξ⊗ξ is insufficient.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.1/pseudocoefficients`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/archimedean-pseudocoefficient-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/real-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/base-change-groups`, `AutomorphicSpectralTheory:AS.6/general-euler-poincare`.

The source statements fix the scope of this target.

[S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.3, pp. 23–24; (5.11), p. 35; (6.7), p. 43. constructs Labesse's twisted Lefschetz functions, shows BC-matching with Euler–Poincaré functions and writes the explicit endoscopic combinations φ^n⃗_{Ig,∞} and f^n⃗_∞.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, p. 735; §5.3, pp. 737–738. uses the same functions for an inner form G_ℝ of arbitrary signature, with q(G) = ½ dim(G(ℝ)/K_∞A_∞^0).

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.4, p. 70; §5.6, pp. 74–75. recalls the matching at ∞ and the choice of f^n⃗_∞.

<a id="et-4-twisted-trace-formula"></a>

### ET.4.11 The invariant twisted trace formula for the unitary base-change spaces

Let 𝒢^+_n⃗ = 𝒢_n⃗ ⋊ {1, θ} be as in ET.4/base-change-groups and 𝒢_n⃗θ its non-identity coset. For f ∈ C_c^∞(𝒢_n⃗(𝔸)) with trivial character on A^0_{𝒢,∞}, let fθ be its translate to 𝒢_n⃗θ(𝔸). Then the invariant twisted trace formula holds: I^{𝒢θ}_geom(fθ) = I^{𝒢θ}_spec(fθ), where the geometric side is a linear combination over Levi subsets M of 𝒢_n⃗θ of invariant twisted weighted orbital integrals I^{𝒢θ}_M(δθ, fθ), and the spectral side a linear combination over Levi subsets of invariant twisted weighted characters; both are defined from the same kernel and truncation as the untwisted invariant trace formula of AutomorphicSpectralTheory:AS.6/invariant-trace-formula. The distributions satisfy the twisted splitting formula and descent formula used in ET.4/twisted-geometric-side.

Assume the following conditions.

- 𝒢^+_n⃗ is a non-connected group whose coset 𝒢θ is defined by an automorphism θ of order 2 preserving a ℚ-splitting; f has the stated central character.
- At infinity use functions compact modulo A_{G,∞}^0 with the central character fixed by ξ, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; C_c^∞ in this node denotes this central-character space, not ordinary compact support on the whole group.

The proof proceeds through these steps.

1. The coarse and fine twisted expansions are obtained from the kernel and truncation of AutomorphicSpectralTheory:AS.6/coarse-trace-identity, AS.6/fine-geometric-expansion and AS.6/fine-spectral-expansion applied to the coset (Arthur 1988, as recalled in Caraiani–Scholze non-compact (5.5.1)).
2. Invariantisation follows AutomorphicSpectralTheory:AS.6/invariant-recursion with the twisted weighted characters; the twisted formula is unconditional by Kottwitz–Rogawski and Delorme–Mezo (Shin 2011 §4.5, p. 26).
3. The splitting formula and the descent formula for I^{𝒢θ}_M are those of Arthur 1988 (Proposition 9.1 and Corollary 8.3 of the second paper), in their twisted form.

**Acceptance.**

- For θ trivial (no twist) the statement reduces to AutomorphicSpectralTheory:AS.6/invariant-trace-formula.
- If 𝒢θ(ℚ)\𝒢(𝔸)^1 were compact the formula would reduce to the twisted Selberg trace formula.
- For f cuspidal at ∞ with [F^+:ℚ] ≥ 2, the geometric side reduces to elliptic terms (ET.4/twisted-geometric-side).

*Needs:* `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`, `AutomorphicSpectralTheory:AS.6/coarse-trace-identity`, `AutomorphicSpectralTheory:AS.6/fine-geometric-expansion`, `AutomorphicSpectralTheory:AS.6/fine-spectral-expansion`, `AutomorphicSpectralTheory:AS.6/invariant-recursion`, `AutomorphicSpectralTheory:AS.6/weighted-orbital-integral`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/base-change-groups`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-characters`.

The source statements fix the scope of this target.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, (5.5.1), p. 72. states the invariant twisted trace formula I_geom = I_spec for the coset 𝒢_n⃗θ, citing Arthur 1988.

[S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.5, p. 26. notes that Arthur's twisted trace formula is unconditional by Kottwitz–Rogawski and Delorme–Mezo, and uses it for unitary base change.

<a id="et-4-cuspidal-levi-subsets"></a>

### ET.4.12 Cuspidal groups, cuspidal Levi subgroups and cuspidal Levi subsets

(1) A connected reductive group M over ℚ is cuspidal if (M/A_M)_ℝ contains a maximal ℝ-torus that is ℝ-anisotropic, where A_M is the maximal ℚ-split torus in the centre of M. (2) A Levi subgroup M of 𝒢_n⃗ is a cuspidal Levi subgroup if M is a cuspidal group. (3) For a Levi subset M of the coset 𝒢_n⃗θ, let M° be the intersection with 𝒢_n⃗ of the subgroup of 𝒢^+_n⃗ generated by M; M is a cuspidal subset if M° is a cuspidal Levi subgroup of 𝒢_n⃗.

Assume the following conditions.

- M connected reductive over ℚ; Levi subsets in the sense of Arthur's non-connected theory.

The proof proceeds through these steps.

1. Cuspidality is equivalent to the existence of discrete series of M(ℝ) modulo A_M(ℝ)^0 (Harish-Chandra), which is why only cuspidal Levis carry non-zero archimedean weighted terms of a cuspidal function.
2. The definition is Caraiani–Scholze non-compact Definition 5.5.2.

Expose the following operations and relations.

- `IsCuspidalGroup` (constructor): M is cuspidal iff (M/A_M)_ℝ has an ℝ-anisotropic maximal torus.
- `IsCuspidalGroup.iff_discreteSeries` (characterisation): M is cuspidal iff M(ℝ) has discrete series modulo A_M(ℝ)^0.
- `IsCuspidalGroup.prod` (structure): A product is cuspidal iff each factor is.
- `IsCuspidalSubset` (constructor): A Levi subset M of 𝒢θ is cuspidal iff M° ∩ 𝒢 is a cuspidal Levi subgroup.
- `IsCuspidalGroup.resGL` (relation): For a CM field F, R_{F/ℚ}GL_h is cuspidal iff h = 1 and [F^+:ℚ] = 1: otherwise (M/A_M)_ℝ has a non-trivial split central torus (when [F^+:ℚ] > 1) or a split part in every maximal torus (when h ≥ 2).

**Checks.**

- `IsCuspidalGroup.gm`: 𝔾_m is cuspidal (A_M = 𝔾_m and M/A_M is trivial).
- `IsCuspidalGroup.resGL_not`: For [F^+:ℚ] = 2, R_{F/ℚ}GL_1 is not cuspidal: its real centre contains a split torus of rank 2 while A_M has rank 1.
- `IsCuspidalGroup.unitary`: A unitary group U(a,b) over ℚ relative to an imaginary quadratic field is cuspidal.
- `IsCuspidalGroup.trivial`: The trivial group is cuspidal; a Levi subgroup is never required to contain a non-trivial torus.

Use this interface as follows.

- `Caraiani–Scholze non-compact proof of Proposition 5.5.1`: the archimedean weighted twisted terms of a Lefschetz function vanish on non-cuspidal Levi subsets (Morel 2010 Proposition 8.2.3)
- `ET.4/no-proper-cuspidal-subsets`: the key lemma that no proper cuspidal subset exists when [F^+:ℚ] ≥ 2

**Acceptance.**

- 𝔾_m is cuspidal (A_M = 𝔾_m and M/A_M is trivial).
- For [F^+:ℚ] = 2, R_{F/ℚ}GL_1 is not cuspidal: its real centre contains a split torus of rank 2 while A_M has rank 1.
- A unitary group U(a,b) over ℚ relative to an imaginary quadratic field is cuspidal.
- The trivial group is cuspidal; a Levi subgroup is never required to contain a non-trivial torus.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/base-change-groups`, `AdelicAlgebraicGroups:AA.2/tamagawa-measure`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

The source statements fix the scope of this target.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, Definition 5.5.2, p. 74. defines cuspidal groups, cuspidal Levi subgroups and cuspidal Levi subsets of the twisted coset.

<a id="et-4-no-proper-cuspidal-subsets"></a>

### ET.4.13 No proper cuspidal subsets when [F^+:ℚ] ≥ 2

If [F^+ : ℚ] ≥ 2 then 𝒢_n⃗θ admits no proper cuspidal Levi subset. If F^+ = ℚ (F imaginary quadratic) the analogue fails: the unitary similitude groups G_N then have proper cuspidal Levi subgroups (R_{F/ℚ}𝔾_m)^s × G_{N−2s}, and the stable trace formula for Igusa varieties can no longer be identified with the geometric side of the twisted trace formula, which acquires additional terms.

Assume the following conditions.

- F = F^+F_0 CM; the statement is about the base-change coset of ET.4/base-change-groups.

The proof proceeds through these steps.

1. It suffices that 𝒢_n⃗ has no proper cuspidal Levi subgroup.
2. A proper Levi contains a direct factor R_{F/ℚ}GL_h, 0 < h ≤ n, which would have to be cuspidal.
3. The centre of (R_{F/ℚ}GL_h)_ℝ contains a split torus of rank [F^+:ℚ] > 1 while the maximal ℚ-split central torus has rank 1, so no maximal ℝ-torus of the quotient is anisotropic (Caraiani–Scholze non-compact Lemma 5.5.3).

**Acceptance.**

- For [F^+:ℚ] = 2 and n⃗ = (2), the Levi R_{F_0/ℚ}𝔾_m × R_{F/ℚ}(GL_1 × GL_1) is not cuspidal.
- For F^+ = ℚ, (R_{F/ℚ}𝔾_m)^s × G_{N−2s} ⊂ G_N is a proper cuspidal Levi subgroup (non-example of the hypothesis).
- The lemma is used only with test functions cuspidal at ∞.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/cuspidal-levi-subsets`.

The source statements fix the scope of this target.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, Lemma 5.5.3 and Remark 5.5.4, p. 74. proves that the coset has no proper cuspidal subsets when [F^+:ℚ] ≥ 2 and gives the counterexample for F^+ = ℚ.

[S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Remark 4.6, p. 27. notes that for F^+ = ℚ more terms appear, citing Morel 2010 Proposition 8.2.3.

<a id="et-4-twisted-geometric-side"></a>

### ET.4.14 The simple twisted geometric side equals a stable elliptic sum

Assume [F^+:ℚ] ≥ 2. Let φ^n⃗ = (φ^n⃗)^S φ^n⃗_{S_f} φ_{G_n⃗,ξ} ∈ C_c^∞(G_n⃗(𝔸)) and f^n⃗ = (f^n⃗)^S f^n⃗_{S_f} f_{𝒢_n⃗,Ξ} ∈ C_c^∞(𝒢_n⃗(𝔸)) with (φ^n⃗)^S and φ^n⃗_{S_f} BC-transfers of (f^n⃗)^S and f^n⃗_{S_f} (ET.4/unramified-transfers, ET.4/base-change-transfer-of-functions) and the archimedean functions of ET.4/archimedean-lefschetz-functions. Then I^{𝒢_n⃗θ}_geom(f^n⃗θ) = Σ_γ SO^{G_n⃗(𝔸)}_γ(φ^n⃗) = τ(G_n⃗)^{-1} ST^{G_n⃗}_e(φ^n⃗), the middle sum over ℚ-elliptic semisimple stable conjugacy classes of G_n⃗(ℚ); equivalently the geometric side is the sum over θ-elliptic θ-conjugacy classes δ of 𝒢_n⃗(ℚ) of vol(I_{δθ}(ℚ)A_{𝒢θ}\I_{δθ}(𝔸)) O_{δθ}(f^n⃗).

Assume the following conditions.

- [F^+ : ℚ] ≥ 2 (used through ET.4/no-proper-cuspidal-subsets)
- f^n⃗ cuspidal at ∞ (the Lefschetz function)
- BC-matching at every finite place
- At infinity use functions compact modulo A_{G,∞}^0 with the central character fixed by ξ, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; C_c^∞ in this node denotes this central-character space, not ordinary compact support on the whole group.

The proof proceeds through these steps.

1. By the twisted splitting formula and descent, each term I^{𝒢θ}_M(δθ, f^n⃗θ) is a multiple of the archimedean term for f_{𝒢,Ξ}; that term vanishes unless M is a cuspidal subset (Morel 2010 Proposition 8.2.3), and by ET.4/no-proper-cuspidal-subsets only M = 𝒢θ remains: the twisted analogue of Arthur 1988 Theorem 7.1(b) holds without a second cuspidal place.
2. Cuspidality at ∞ (Labesse 1999 Théorème A.1.1) kills non-θ-elliptic terms, giving the twisted analogue of Arthur 1988 Corollary 7.4: the geometric side is the θ-elliptic sum.
3. Labesse 1999 Théorème 4.3.4 identifies that θ-elliptic sum with the sum of stable orbital integrals of the BC-transfer, and Shin 2011 Corollary 4.7 (using τ(𝒢_n⃗) = 1 from ET.4/tamagawa-number-formula) rewrites it as τ(G_n⃗)^{-1}ST_e.

**Acceptance.**

- For n⃗ = (1) the identity reduces to a statement about the elliptic part of the twisted trace formula of a torus.
- Dropping [F^+:ℚ] ≥ 2 (F imaginary quadratic) makes the identity false in general: extra cuspidal-Levi terms appear (Caraiani–Scholze non-compact Remark 5.5.4).
- Both sides vanish when f^n⃗_v = 0 at one place.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-trace-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/no-proper-cuspidal-subsets`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/archimedean-lefschetz-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/unramified-transfers`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/base-change-transfer-of-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/stable-elliptic-distribution`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/tamagawa-number-formula`.

The source statements fix the scope of this target.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, Proposition 5.5.1 and proof, pp. 72–74. proves the identity of the twisted geometric side with the stable elliptic sum, explaining the role of cuspidal subsets and replacing the second cuspidal place by [F^+:ℚ] ≥ 2.

[S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.5, Proposition 4.5 and Corollary 4.7, p. 27. proves the same identity in the compact case, citing Labesse's Théorème 4.3.4.

[J.-P. Labesse, Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf), Proposition 4.3.2 and Théorème 4.3.4 (§4.3). rewrites the θ-elliptic part of the twisted trace formula as a sum of stable orbital integrals of matching functions.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.3, Proposition 5.3.1, p. 737. records the same proposition for the compact unitary groups of arbitrary rank.

<a id="et-4-twisted-spectral-side"></a>

### ET.4.15 The spectral side of the simple twisted trace formula

With f^n⃗ as in ET.4/twisted-geometric-side, I^{𝒢_n⃗θ}_spec(f^n⃗θ) = Σ_M |W_M| |W_{𝒢_n⃗}|^{-1} |det(Φ_n⃗^{-1}θ − 1)_{𝔞^{𝒢θ}_M}|^{-1} Σ_{Π_M} tr(n-Ind^{𝒢_n⃗}_Q(Π_M)_ξ(f^n⃗) ∘ A′), where M runs over Levi subgroups of 𝒢_n⃗ containing a fixed minimal Levi M_0, W_M and W_{𝒢_n⃗} are Weyl groups relative to M_0 (the denominator is the Weyl group of 𝒢_n⃗, Caraiani–Scholze 2017 erratum E71), Φ_n⃗^{-1}θ acts as −1 on 𝔞^{𝒢θ}_M so the determinant is non-zero, Q is a parabolic with Levi M, Π_M runs over the irreducible Φ_n⃗^{-1}θ-stable subrepresentations of the relatively discrete spectrum R_{M,disc} (each occurring with multiplicity one by multiplicity one for general linear groups), the subscript ξ is the twist by the character of A^0_{𝒢,∞} determined by ξ, and A′ is the normalised intertwining operator on n-Ind(Π_M)_ξ composed with θ (Shin 2011 §4.5). Each n-Ind(Π_M)_ξ is a θ-stable isobaric irreducible automorphic representation, and its archimedean component is cohomological for Ξ when its trace against f_{𝒢,Ξ} is non-zero.

Assume the following conditions.

- f^n⃗_∞ a twisted Lefschetz function; the discrete spectrum of the general linear Levi M as described by Mœglin–Waldspurger.

The proof proceeds through these steps.

1. Expand the spectral side and use that only the discrete part survives for a Lefschetz function at ∞ (Shin 2011 Proposition 4.8, p. 28).
2. Compute the intertwining-operator term as tr(n-Ind(Π_M)_ξ(f) ∘ A′) (Shin 2011 Corollary 4.14, p. 30), with the sign of the normalised intertwiner at ∞ as in Clozel–Harris–Labesse.
3. Irreducibility and isobaricity of n-Ind(Π_M)_ξ: Π_M is unitary and discrete for a product of general linear groups (Mœglin–Waldspurger 1989, Jacquet–Shalika 1981).

**Acceptance.**

- When M = 𝒢_n⃗ the term is tr(Π(f^n⃗) ∘ A′) for θ-stable relatively discrete Π, including residual Speh representations.
- The coefficient |det(Φ^{-1}θ − 1)|^{-1} equals 1 when 𝔞^{𝒢θ}_M = 0.
- Non-θ-stable discrete Π_M contribute zero.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-trace-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/archimedean-lefschetz-functions`, `AutomorphicSpectralTheory:AS.6/fine-spectral-expansion`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-characters`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`.

The source statements fix the scope of this target.

[S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §4.5, Proposition 4.8 and Corollary 4.14, pp. 28–30. computes the spectral side of the twisted trace formula for a Lefschetz test function as a sum over θ-stable discrete data with normalised intertwiners.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.3, Proposition 5.3.3 and Remark 5.3.4, p. 738. records the same expansion and explains the twist by ξ and the normalised intertwiner.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.6, proof of Lemma 5.6.2, pp. 75–76. uses the expansion and the isobaricity of n-Ind(Π_M)_ξ.

<a id="et-4-stable-twisted-identity"></a>

### ET.4.16 Stable–twisted identity for unitary similitude groups

Assume [F^+:ℚ] ≥ 2. For every vector n⃗ and every pair of BC-matching functions φ^n⃗ ∈ C_c^∞(G_n⃗(𝔸)), f^n⃗ ∈ C_c^∞(𝒢_n⃗(𝔸)) as in ET.4/twisted-geometric-side (unramified outside S, small level at S_pf as in ET.4/small-level-transfer, any function at split primes, Euler–Poincaré and Lefschetz functions at ∞), ST^{G_n⃗}_e(φ^n⃗) = τ(G_n⃗) I^{𝒢_n⃗θ}_spec(f^n⃗θ), with the spectral side expanded as in ET.4/twisted-spectral-side. Combined with ET.4/elliptic-stabilization, for G an inner form of G_N with G(𝔸_f) ≅ G_N(𝔸_f) and any f on G(𝔸) with Euler–Poincaré f_∞, T_e^G(f) = Σ_{G_n⃗ ∈ E^ell(G)} ι(G,G_n⃗) τ(G_n⃗) I^{𝒢_n⃗θ}_spec(f^n⃗θ), where for each n⃗ the function f^n⃗ is chosen BC-matching with the transfer f^{G_n⃗}. This holds for every rank N and both parities (with the pairs excluded by Kottwitz's condition 7.4.3 omitted) and for G_ℝ of arbitrary signature.

Assume the following conditions.

- [F^+:ℚ] ≥ 2
- the transfers f^{G_n⃗} exist as BC-transfers at every place (ET.4/base-change-transfer-of-functions, ET.4/small-level-transfer)
- Euler–Poincaré function at ∞
- At infinity use functions compact modulo A_{G,∞}^0 with the central character fixed by ξ, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; C_c^∞ in this node denotes this central-character space, not ordinary compact support on the whole group.

The proof proceeds through these steps.

1. Combine ET.4/twisted-geometric-side with the twisted trace formula I_geom = I_spec (ET.4/twisted-trace-formula).
2. Insert into the elliptic stabilization ET.4/elliptic-stabilization; the factors ι(G,G_n⃗)τ(G_n⃗) = τ(G)|Out|^{-1} and the factor ½ for n_1 = n_2 come from |Out(G_{n,n})| = 2 (ET.4/stable-elliptic-distribution).
3. The widening to every rank, both parities and arbitrary signature is Caraiani–Scholze 2017 §5.2–5.3; the non-compact case with level N_0 is Caraiani–Scholze non-compact §§5.4–5.6.

**Acceptance.**

- For N = 1 the identity is the base-change identity for the torus G_1.
- For n_1 = n_2 = N/2 the coefficient carries the factor ½ seen as ε_n⃗ in Caraiani–Scholze non-compact Theorem 5.6.1.
- The identity fails for F^+ = ℚ (Remark 5.5.4).

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-geometric-side`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-spectral-side`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/elliptic-stabilization`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/small-level-transfer`.

The source statements fix the scope of this target.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §§5.5–5.6, Proposition 5.5.1 and Theorem 5.6.1, pp. 72–75. combines the twisted simplification with the stable trace formula and the explicit test functions; the coefficient ε_n⃗ = ½ for n⃗ = (n,n).

[A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.3, Theorem 5.3.2 and Proposition 5.3.3, pp. 737–738. states the same combination for compact unitary groups of arbitrary rank and signature.

[S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Corollary 4.7, p. 27. proves the geometric identity used here.

<a id="et-4-simple-division-algebra-trace-identity"></a>

### ET.4.17 The simple trace formula for division-algebra unitary groups

Let F = F_0K be a CM field with F_0 totally real of even degree over ℚ and K imaginary quadratic, D a central division algebra over F of dimension n² with an involution * of the second kind, and G the unitary similitude group of (D, *) chosen as in Scholze's Lemma 8.1: signature (1, n−1) at one infinite place of F_0 and (0, n) at the others, G_{ℚ_p} ≅ GL_n(F_w) × (D′)^× × ℚ_p^× at a prime p split in K. Then G(ℚ)\G(𝔸)/A_G is compact, with the division-place test-function restriction the stabilised elliptic sum reduces to the term of G itself, and for test functions with a component at a place where D is a division algebra (as used by Kottwitz and Scholze), the contributions of the proper elliptic endoscopic groups vanish; for f = f^∞ f_∞ with f_∞ Kottwitz's Euler–Poincaré function of ξ, the elliptic part of the trace formula equals Σ_π m(π) tr(π_f(f^∞)) tr(π_∞(f_∞)), where π runs over automorphic representations of G. Further, π_f contributes to the ξ-cohomology only if π_∞ is cohomological, and the global Jacquet–Langlands correspondence relates such π (with the stated local conditions on D) to cuspidal or residual automorphic representations of GL_n over F.

Assume the following conditions.

- D a division algebra (the ramification hypothesis of Scholze Remark 8.3 needed for the global Jacquet–Langlands step)
- [F_0:ℚ] even (needed for the existence of D, *, and for base change)
- p split in K
- D splits away from the pair x,xᶜ over x₀, with local division-algebra data of Scholze §8 Lemma 8.1; the distinguished place w used for cohomology is different from x,xᶜ. Proper-endoscopy vanishing uses the division-place component, not anisotropy alone.

The proof proceeds through these steps.

1. Existence of (D,*,h_0) with the signatures: Scholze Lemma 8.1 (Kottwitz 1992; Harris–Taylor §I.7).
2. Compactness: D is a division algebra, so G is anisotropic modulo centre and AutomorphicSpectralTheory:AS.6/compact-trace-specialization applies.
3. Vanishing of proper endoscopic contributions and the identity of the elliptic part with the spectral side: Kottwitz's argument for simple Shimura varieties (Kottwitz 1992, Invent. Math. 108), used by Scholze §§9–10 (Corollary 10.1); recorded with ET.4/elliptic-stabilization in the case of the trivial triple.
4. The global Jacquet–Langlands step is cited by Scholze through Harris–Taylor and Clozel's base change, ET.4/unitary-gl-base-change-descent.

**Acceptance.**

- For n = 1 G is a torus and the identity is the Poisson-type formula for the compact torus quotient.
- Replacing D by a split algebra leaves the scope of this construction; no assertion that every split-algebra unitary quotient is noncompact is made.
- For f_∞ the Euler–Poincaré function, non-cohomological π_∞ contribute zero.

*Needs:* `AutomorphicSpectralTheory:AS.6/compact-trace-specialization`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/elliptic-stabilization`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/pseudocoefficients`, `PELModuli:M0/similitude-group`, `PELModuli:M5/unitary-pel-datum`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §8, Lemma 8.1 and Remarks 8.2–8.3, p. 19. constructs the division algebra, involution and h_0 with the stated signatures and explains why a ramification hypothesis on D is needed for the global Jacquet–Langlands correspondence.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §10, Corollary 10.1, p. 26. uses Kottwitz's results that π_f occurring in the ξ-cohomology has cohomological archimedean component, with the trace identity from the simple trace formula.

[S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), §5.4, p. 36. describes the stabilised trace formula for compact quotients after Kottwitz 1986 Theorem 9.6.

<a id="et-4-local-cyclic-base-change"></a>

### ET.4.18 Local cyclic base change for GL_n (Arthur–Clozel)

Let E/F be a cyclic extension of non-archimedean local fields of characteristic 0 of prime degree ℓ with Gal(E/F) = ⟨σ⟩, and G = GL_n. (Definition, Shintani) For tempered representations, a σ-stable irreducible admissible representation Π of GL_n(E) is a base-change lift of an irreducible admissible π of GL_n(F) if Θ_{Π,σ}(g) = Θ_π(Ng) for every g ∈ GL_n(E) with σ-regular norm Ng, the twisted character normalised as in ET.4/twisted-characters. Then: (a) every irreducible tempered π has a unique lift Π, which is tempered; (b) every σ-stable irreducible tempered Π lifts at least one π, and π is tempered; (c) the notion does not depend on the generator σ; (d) if Π lifts π = ind(π_1 ⊗ … ⊗ π_r) with π_i discrete series, the representations lifting to Π are exactly ind((π_1⊗χ_1)⊗…⊗(π_r⊗χ_r)) with χ_i characters of F^×/N(E^×); (e) lifting is compatible with contragredients and with twists: π⊗ω lifts to Π⊗(ω∘N_{E/F}), and ω_Π = ω_π ∘ N_{E/F}; (f) for π supercuspidal: if its lift is discrete then it is supercuspidal, otherwise the lift is a normalized induction of the full σ-orbit of a supercuspidal representation of GL_{n/ℓ}(E), with ℓ dividing n (AC Lemma 6.10); (g) the lift extends to all irreducible representations through the Langlands classification (SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification; no dependence on ET.6) by lifting tempered data and taking Langlands quotients.

Assume the following conditions.

- E/F cyclic of prime degree ℓ, characteristic 0
- twisted characters normalised as in ET.4/twisted-characters
- The Shintani character identity defines tempered lifting with the canonical intertwiner. The extension to all irreducibles is by Langlands standard data, not an assertion of that character identity for every non-tempered representation.

The proof proceeds through these steps.

1. Compare twisted orbital integrals of φ on GL_n(E) with orbital integrals of f on GL_n(F) through the norm map (AC Ch. 1 §§1–3, Proposition 3.1) and the base-change fundamental lemma (ET.3/base-change-fundamental-lemma-and-transfer).
2. Existence for discrete series by a global argument with the simple trace formula comparison of AC Ch. 2 (Theorems A and B) applied to cuspidal representations with prescribed local components; tempered case by parabolic induction (AC Ch. 1 Theorem 6.2, p. 51).
3. Fibres (d), compatibilities (e) and supercuspidality (f): AC Ch. 1 Proposition 6.6, pp. 58–59; Propositions 6.7–6.8, p. 59; Proposition 6.9, pp. 60–61; Lemma 6.10, pp. 62–63, using linear independence of twisted characters (ET.4/twisted-characters).

**Acceptance.**

- For n = 1, the lift of a character χ of F^× is χ ∘ N_{E/F}.
- The Steinberg representation of GL_n(F) lifts to the Steinberg representation of GL_n(E).
- An unramified principal series lifts to the unramified principal series with Satake parameters raised to the ℓ-th power when E/F is unramified.

**Supplier boundary.** The existing SmoothRepresentations Langlands classification is conditional on its Harish–Chandra tempered-support input. Retain that hypothesis when extending the tempered lift to arbitrary irreducibles; ET.6 is not an early supplier.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-characters`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/base-change-fundamental-lemma-and-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/padic-character-distributions`, `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`, `SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification`, `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`.

The source statements fix the scope of this target.

[J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 Theorem 6.2 pp. 51–52; Propositions 6.6 p. 58, 6.7–6.8 p. 59, 6.9 pp. 60–61 and Lemma 6.10 p. 62. defines base-change lifting by the Shintani character identity and proves existence and uniqueness of lifts of tempered representations.

[J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 1 §6, Proposition 6.6, pp. 58–59; Propositions 6.7–6.8, p. 59; Proposition 6.9, pp. 60–61; Lemma 6.10, pp. 62–63. describes the fibres of lifting by twists, compatibility with contragredients and twists, and the behaviour of supercuspidal representations.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §12, pp. 31–32. uses Arthur–Clozel Lemma 6.10, Theorem 6.2 and Proposition 6.7 to prove bijectivity on supercuspidals.

<a id="et-4-global-cyclic-base-change"></a>

### ET.4.19 Global cyclic base change for GL_n (Arthur–Clozel)

Let E/F be a cyclic extension of number fields of prime degree ℓ with Gal(E/F) = ⟨σ⟩ and ω the character of 𝔸_F^×/F^× N(𝔸_E^×) of class field theory. An automorphic representation of GL_n is induced from cuspidal if it is ind(σ_M ⊗ 1) for a cuspidal unitary representation σ_M of a Levi M(𝔸). A σ-stable Π of GL_n(𝔸_E) is a weak lift of π if Π_w is the unramified lift of π_v at almost all places, and a strong lift if Π_w is the local lift of π_v (ET.4/local-cyclic-base-change) at every place. Then (all representations induced from cuspidal): (a) if π is cuspidal and π ≇ π⊗ω, there is a unique σ-stable Π lifting π, and Π is cuspidal; (b) if π is cuspidal and π ≅ π⊗ω, then ℓ divides n and Π is the isobaric sum of the ℓ distinct conjugates of a cuspidal representation of GL_{n/ℓ}(𝔸_E); (c) every σ-stable cuspidal Π is the lift of some cuspidal π, unique up to twisting by powers of ω; (d) a weak lift is a strong lift; (e) ω_Π = ω_π ∘ N_{E/F}, and the lift is independent of the choice of σ; (f) two cuspidal π, π′ with the same lift differ by a power of ω.

Assume the following conditions.

- E/F cyclic of prime degree ℓ, number fields
- representations induced from cuspidal (unitary cuspidal data)
- The phrase every place in strong lifting includes archimedean places. ET.4/local-cyclic-base-change supplies only the nonarchimedean part; the archimedean component dictionary must be supplied separately (recorded as a gap).

The proof proceeds through these steps.

1. Compare the twisted trace formula for GL_n(E) ⋊ ⟨σ⟩ with the trace formula of GL_n(F) through the matching of functions (ET.3/base-change-fundamental-lemma-and-transfer) and the term-by-term comparison of AC Ch. 2 (Theorems A and B).
2. Separate eigencharacters with the strong multiplicity one theorem and the Jacquet–Shalika results (AC Ch. 3 §2) to obtain weak lifting (AC Ch. 3 Theorem 4.2, pp. 202–203) and the fibres (Theorem 3.1, p. 201).
3. Strong lifting from weak lifting and the local theory (AC Ch. 3 Theorem 5.1, pp. 212–213); central characters and independence of σ (Proposition 4.4, pp. 210–211).

**Acceptance.**

- For n = 1, the lift of a Hecke character χ is χ ∘ N_{𝔸_E/𝔸_F}.
- For n = ℓ = 2 and π the automorphic induction of a Hecke character of E, π ≅ π⊗ω and the lift is the isobaric sum χ ⊞ χ^σ.
- A cuspidal π whose base change is cuspidal is not a twist-invariant (non-example to (b)).

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/local-cyclic-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-trace-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/base-change-fundamental-lemma-and-transfer`, `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

The source statements fix the scope of this target.

[J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 3 Definitions 1.1–1.2 p. 199, Theorem 3.1 p. 201, Definition 4.1 and Theorem 4.2 pp. 202–203, Proposition 4.4 pp. 210–211, Theorem 5.1 pp. 212–213. defines weak and strong lifts and induced-from-cuspidal representations, proves weak lifting, its fibres, central characters, and that weak lifts are strong.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §12, p. 31; §13, pp. 32–35. uses cyclic base change to reduce supercuspidal representations to cases that become non-supercuspidal after finitely many prime-degree cyclic base changes.

<a id="et-4-cyclic-automorphic-induction"></a>

### ET.4.20 Cyclic automorphic induction for GL_n (Arthur–Clozel)

Let E/F be a cyclic extension of number fields of degree ℓ (prime or not) and π_E an automorphic representation of GL_m(𝔸_E) induced from cuspidal. Say that an automorphic representation π_F of GL_{mℓ}(𝔸_F) is automorphically induced from π_E if at almost all places v unramified in E, the Satake parameter of π_{F,v} is the induction of those of π_{E,w}: at v split in E it is the direct sum over w | v, and at an arbitrary unramified v it is ⊕_{w|v} Ind_{W_{E_w}}^{W_{F_v}}. Then there exists one and only one such π_F, and π_F is induced from cuspidal. For ℓ prime and π_E cuspidal, π_F is cuspidal iff π_E is not isomorphic to its Galois conjugate π_E^σ; the induction is transitive along towers of cyclic extensions; and its base change to E is the isobaric sum of the Galois conjugates of π_E.

Assume the following conditions.

- E/F cyclic; π_E induced from cuspidal

The proof proceeds through these steps.

1. Use prime-degree cyclic base change and its cuspidal fibres to construct induction as in AC Ch. 3 §6, Theorem 6.2 p. 215; iterate along a cyclic tower. Verify the unramified induced Satake parameter at every splitting type, then apply strong multiplicity one and Rankin–Selberg pole counting. This proof does not introduce an additional unplanned character-twisted trace formula.
2. Uniqueness from strong multiplicity one; cuspidality criterion from the Rankin–Selberg pole count (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles) and ET.4/global-cyclic-base-change (AC Ch. 3 Theorem 6.2, p. 215, and Corollary 6.5, p. 218 (proof continues on p. 219)).

**Acceptance.**

- For m = 1 and ℓ = 2, the induction of a Hecke character χ of E is the classical automorphic induction (theta series) to GL_2(𝔸_F).
- The induction of the trivial character of 𝔸_E^× is the isobaric sum of the characters of 𝔸_F^×/F^×N(𝔸_E^×).
- If π_E ≅ π_E^σ the induction is not cuspidal.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/global-cyclic-base-change`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles`.

The source statements fix the scope of this target.

[J. Arthur and L. Clozel, Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf), Ch. 3 Definition 6.1 and Theorem 6.2 p. 215; Corollary 6.5 p. 218. defines automorphic induction by matching Hecke eigenvalues, proves existence and uniqueness for cyclic extensions and identifies the cuspidal case.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §14, p. 35. uses automorphic induction of Hecke characters along cyclic towers in the globalisation for L- and ε-factors.

<a id="et-4-unitary-gl-base-change-descent"></a>

### ET.4.21 Base change and descent between unitary groups and GL_n over CM fields

For exactly the division-algebra unitary similitude datum of Scholze §8 (totally real F₀ of even degree, F=F₀K, D split away from x,xᶜ and the signatures of Lemma 8.1), let Π be cuspidal, conjugate self-dual, regular algebraic on GL_n(𝔸_F), with Π_x essentially square-integrable. Scholze Theorem 10.5 gives an algebraic Hecke character ψ of K and π_f occurring in ξ-cohomology such that at every rational prime p′ split in K and every w′|p′ different from x,xᶜ the GL_n-factor of π_{p′} is Π_{w′}, while its similitude GL₁-factor is ψ_{u′}. One may arrange ψ unramified at a prescribed such p′. At a split place the entire pair consisting of the GL₁ multiplier character and all GL_n-factors determines the local similitude representation. Broader quasi-split base change and converse descent are not established by this source and remain a separate gap.

Assume the following conditions.

- F_0 totally real of even degree in the division-algebra case; p and the descent place split in K
- Π cuspidal, conjugate self-dual, regular algebraic, with a square-integrable component

The proof proceeds through these steps.

1. Apply Scholze §10 Theorem 10.5 p. 27 with all hypotheses of §8 pp. 19–20. Its proof cites Harris–Taylor VI.2.10; those internal proofs remain a source-access gap.
2. Keep the similitude character ψ: equality of the GL_n-factor alone is not injective on representations of GL₁×GL_n.
3. Shin 2011 Corollaries 6.5 and 6.7 concern cohomology and Hodge data, not the base-change/descent assertions previously attributed to them.

**Acceptance.**

- At a split place distinguish ψ_{u′} on GL₁ from Π_{w′} on GL_n; omitting ψ loses injectivity.
- A Π with no square-integrable component at x is outside Theorem 10.5.
- The rank-one U(1) map z↦z/z̄ is not the whole similitude-group construction.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/stable-twisted-identity`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/simple-division-algebra-trace-identity`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/base-change-transfer-of-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/global-cyclic-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/inner-form-transfer`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §8 Lemma 8.1 and Remark 8.3 pp. 19–20; §10 Theorem 10.5 p. 27. supplies the restricted division-data descent used in the construction, with the GL₁ character and specified split local components.

<a id="et-4-unitary-endoscopic-classification"></a>

### ET.4.22 Endoscopic classification of unitary groups for generic parameters

Let U be a pure inner form of a unitary group for a CM extension F/F⁺, with its inner twist and local normalization fixed. For a generic global parameter ψ=⊞_i Π_i, with distinct cuspidal conjugate self-dual constituents of the prescribed parity and total rank N, KMSW Theorem* 1.7.1 supplies the ψ-part of the discrete spectrum: it is the direct sum of global packet members whose product pairing restricted to S_ψ equals ε_ψ, with multiplicity one, and ε_ψ=1 for generic ψ. This is the unconditional generic pure-inner case of that theorem, not its full nongeneric assertion. Tempered local parameters have the relevant packets and inner-twist pairings of Theorem* 1.6.1; general localizations of a generic global parameter require the extended packet construction and are not asserted tempered. In particular, unitary local base change is defined by the unitary L-embedding and twisted endoscopy, not by cyclic GL_n base change.

Assume the following conditions.

- Generic global parameter and pure inner twist; do not include the nongeneric or arbitrary-inner assertion beyond the unconditional scope of KMSW v1 pp. 88–89.
- Local pairings depend on the chosen extended pure inner twist; at real places the component-character bijection uses the union over the pure inner forms specified in Theorem* 1.6.1(5).

The proof proceeds through these steps.

1. Use KMSW §1.7.1 pp. 88–89 for the generic pure-inner multiplicity statement and ε_ψ=1; the paper explicitly distinguishes its unconditional case from the announced general theorem.
2. For tempered local parameters use KMSW §1.6.1 pp. 79–80; use unitary twisted endoscopy and the chosen L-embedding. The non-tempered extended-packet construction and full stabilization inputs must be matched in the remaining proof gap.
3. Liu–Tian–Xiao–Zhang–Zhu Proposition C.3.1 p. 363 gives only the relevant cuspidal cohomological specialization, and cannot replace that broader packet construction.

**Acceptance.**

- For N = 1 the classification is the description of automorphic characters of U(1) through base change.
- At a place split in F, U(F^+_v) ≅ GL_N(F_v) and the packet is a singleton given by ψ_v.
- For a simple generic global parameter, the allowed packet members satisfy the global pairing condition; each such occurring member has multiplicity one. The formula does not assert every local packet choice occurs.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/stable-twisted-identity`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/elliptic-stabilization`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/twisted-fundamental-lemma-and-transfer`.

The source statements fix the scope of this target.

[Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu, On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568), Appendix C.3, Proposition C.3.1. uses the generic case of the endoscopic classification of Mok and Kaletha–Mínguez–Shin–White for multiplicity one and the definite–indefinite switches.

[G. Boxer, F. Calegari, T. Gee and V. Pilloni, Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1), §1.6, p. 8. records that Arthur's missing references are now supplied by Atobe–Gan–Ichino–Kaletha–Mínguez–Shin, leaving the twisted weighted fundamental lemma as the only unproved input.

[T. Kaletha, A. Mínguez, S. W. Shin and P.-J. White, Endoscopic classification of representations: inner forms of unitary groups](https://arxiv.org/abs/1409.3731v1), §1.6.1 Theorem* 1.6.1 pp. 79–80; §1.7.1 Theorem* 1.7.1 and Remark 1.7.2 pp. 88–89. states the local packet pairing, generic pure-inner global multiplicity formula and its unconditional scope.

<a id="et-4-gsp4-gl4-transfer"></a>

### ET.4.23 Transfer between GSp_4 and GL_4 for general-type representations

Let F be a number field, Π a cuspidal automorphic representation of GL_4(𝔸_F) and χ : 𝔸_F^×/F^× → ℂ^× unitary with Π ≅ Π^∨ ⊗ (χ∘det). Exactly one of L^S(s, Π, ∧² ⊗ χ^{-1}) and L^S(s, Π, Sym² ⊗ χ^{-1}) has a pole at s = 1; in the first (symplectic) case Π descends to a discrete automorphic representation π of GSp_4(𝔸_F) with central character χ, and in the second to a discrete representation of an inner form of GSpin_4. A discrete π of GSp_4 arising this way is of general type; it is cuspidal and stable, every π′ with π′_v in the L-packet of π_v for all v is automorphic and occurs with multiplicity one, the L-parameter of π_v composed with GSp_4 ⊂ GL_4 is rec(Π_v), and if π is algebraic then Π is algebraic (the forward implication stated in BCGP §1.8.22).

Assume the following conditions.

- general type (the descent of a cuspidal Π of GL_4); the statement depends on Arthur's classification for GSp_4 (Gee–Taïbi), whose only remaining unproved input is the twisted weighted fundamental lemma (gap 'Arthur's classification inputs')

The proof proceeds through these steps.

1. Gee–Taïbi Proposition 6.1.7, as recalled in Boxer–Calegari–Gee–Pilloni §1.8.22 (p. 15), deduces the transfer and multiplicity statements from Arthur's endoscopic classification for GSp_4.
2. The pole dichotomy is the Rankin–Selberg and exterior/symmetric square theory of AutomorphicLFunctionsAndLocalFactors (AL.3 for the poles).

**Acceptance.**

- For a non-CM holomorphic cuspidal GL₂ form of weight at least two whose symmetric cube is cuspidal, Sym³ of its two-dimensional parameter preserves an alternating form up to det³, giving the symplectic case.
- If Π is an isobaric sum the representation is not of general type.
- The orthogonal alternative is not a GSp_4 representation: it goes through GSpin_4.

*Needs:* `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/unitary-endoscopic-classification`.

The source statements fix the scope of this target.

[G. Boxer, F. Calegari, T. Gee and V. Pilloni, Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1), §1.8.22, p. 15. recalls the transfer between GL_4 and GSp_4 for general-type representations, multiplicity one and compatibility of local parameters, citing Gee–Taïbi Proposition 6.1.7.

[G. Boxer, F. Calegari, T. Gee and V. Pilloni, Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1), §1.6, p. 8. records the dependency of Arthur's classification on the twisted weighted fundamental lemma.

<a id="et-4-acceptance-examples"></a>

### ET.4.24 Worked checks for the simple stable and twisted formulas

(1) Torus check: for N = 1, G_1 is the similitude torus of a CM field; E^ell(G_1) = {G_1}, τ(G_1) = 1 when [F^+:ℚ] is odd (Shin 2011 Remark 3.2), and the stable–twisted identity reduces to the base-change character matching for the similitude torus including its multiplier; z↦z/z̄ alone applies to U(1), not G₁. (2) Non-example: for F imaginary quadratic (F^+ = ℚ), the coset 𝒢_2θ has the proper cuspidal subset coming from (R_{F/ℚ}𝔾_m) × G_0, so ET.4/twisted-geometric-side fails without extra terms. (3) Unramified GL_2 check: for N = 2 and v split in F_0, BC* sends the Hecke operator T_v to the Hecke operator of GL_2(F_w) and the trace identity of ET.4/unramified-transfers is the Satake identity. (4) Local base change of the Steinberg representation of GL_2 is the Steinberg representation, and the twisted character at a σ-regular element equals −1 on elliptic norms, matching θ_St = −1 (ET.4/padic-character-distributions). (5) Coefficient check: for G = G_4 and H = G_{2,2}, ι(G,H) carries the factor ½ of |Out| = 2, matching ε_{(2,2)} = ½ in Caraiani–Scholze non-compact Theorem 5.6.1.

Assume the following conditions.

- the data of the individual nodes

The proof proceeds through these steps.

1. Each item is a direct specialisation of the named node.

**Acceptance.**

- Each of (1)–(5) is a numerical or structural identity that a wrong normalisation (missing ½, wrong sign of the Steinberg character, wrong Tamagawa number) would violate.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/stable-twisted-identity`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/no-proper-cuspidal-subsets`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/unramified-transfers`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/local-cyclic-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/tamagawa-number-formula`.

The source statements fix the scope of this target.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.5, Remark 5.5.4, p. 74; §5.6, Theorem 5.6.1, p. 75. gives the F^+ = ℚ counterexample and the coefficient ε_n⃗.

[S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Lemma 3.1, p. 13. computes the Tamagawa numbers used in the torus check.

## Layer ET.5: Rational Igusa counting and stabilization

This layer retains the independently corrected statements. Its primary proofs and supplier gaps are listed below; the independent verdict is needs_changes.

<a id="et-5-acceptable-test-functions"></a>

### ET.5.1 Acceptable elements of J_b(ℚ_p) and acceptable test functions

Let (B, O_B, *, V, Λ_0, ⟨,⟩, h) be an unramified integral PEL datum of type (A) or (C) with group G, p a good prime, b ∈ B(G_{ℚ_p}, −μ) and Σ_b a completely slope-divisible p-divisible group with G-structure of type b, with slope decomposition Σ_b = ⊕_{i=1}^r Σ_i of slopes λ_1 > … > λ_r, so J_b(ℚ_p) ⊂ ∏_i End^0(Σ_i)^× (IgusaVarietiesAndTorsionConcentration:IG.0/automorphism-group-of-universal-cover). (a) An element δ = (δ_i) ∈ J_b(ℚ_p) is acceptable if for all i < j every eigenvalue e_i of δ_i and e_j of δ_j satisfy v_p(e_i) < v_p(e_j). More generally, for a Levi M_0 ⊂ G_0 with central cocharacter ν, a semisimple γ ∈ M_0(ℚ_p) is ν-acceptable if for every root α of G_0 not in M_0, ⟨α,ν⟩ > 0 iff α(γ) has positive p-adic valuation (Shin 2010 Definition 3.1); with the sign convention for the cocharacter attached to b in Shin 2010 §3.2, this agrees with (a) (Remark 3.3). (b) A function φ ∈ C_c^∞(G(𝔸_f^p) × J_b(ℚ_p)) is acceptable if (i) every (g,δ) in its support has δ acceptable and in the monoid S_b of elements acting on the Igusa tower by finite correspondences, and φ = Σ_{g ∈ I} α_g 1_{U^p(m) g U^p(m)} for a finite I and a sufficiently small level U^p(m); (ii) each correspondence [U^p(m) g U^p(m)] has finitely many fixed points on Ig_{b,U^p,m}(𝔽̄_p); (iii) for each g ∈ I the Lefschetz trace on H_c(Ig_{b,U^p,m}, L_ξ) equals the sum over those fixed points of the traces on stalks of L_ξ (ET.5/igusa-fixed-point-formula).

Assume the following conditions.

- unramified integral PEL datum of type (A) or (C) at a good prime p
- Σ_b completely slope divisible
- levels U^p(m) small enough to be torsion free
- Write ν_i=−λ_i explicitly when comparing the 2009 slope convention with the 2010 root convention. Large negative powers fr^(−sN) separate valuations; positive powers fr^(sN) have the opposite sign.

The proof proceeds through these steps.

1. The definitions are Shin 2009 Definitions 6.1–6.2 and Shin 2010 Definition 3.1 with Remark 3.3; Caraiani–Scholze 2017 §5.2 (Remark 5.2.1) records that acceptability separates the slope components by valuation, which makes transfer from J_b to G possible (ET.5/transfer-at-p).
2. The local algebraic σ-conjugacy and Igusa-geometry inputs formerly cited upward are missing from this tier. They must be planned in this roadmap before this proof is closed; see the review gap and handoff. Removing the illegal imports is not a proof of those inputs.

Expose the following operations and relations.

- `IsAcceptableElement` (constructor): δ = (δ_i) ∈ J_b(ℚ_p) is acceptable iff v_p(e_i) < v_p(e_j) for all eigenvalues e_i of δ_i, e_j of δ_j, i < j.
- `IsNuAcceptable` (constructor): γ ∈ M_0(ℚ_p) is ν-acceptable iff, for all roots α outside M_0, ⟨α,ν⟩ > 0 ⇔ v_p(α(γ)) > 0.
- `IsNuAcceptable.iff_acceptable` (equivalence): For ν the cocharacter attached to b with ν_i=−λ_i, Shin's sign convention and γ ∈ M_b ≅ J_b over ℚ̄_p, ν-acceptable equals acceptable (Shin 2010 Remark 3.3).
- `IsAcceptableElement.mul_central` (relation): If δ is acceptable and z is central with v_p of z constant on slopes, δz is acceptable.
- `IsAcceptableFunction` (constructor): The three conditions (support, finite fixed points, fixed-point formula) of Shin 2009 Definition 6.2.
- `IsAcceptableFunction.add` (structure): Acceptable functions on a fixed finite family of double cosets form a vector space.

**Checks.**

- `IsAcceptableElement.gl2`: For GL_2-type data with slopes λ_1 > λ_2: δ = (1, p) on the slope components is acceptable and δ = (p, 1) is not.
- `IsAcceptableElement.basic`: If b is basic (r = 1) every element of J_b(ℚ_p) is acceptable.
- `IsNuAcceptable.compat`: For G_0 = GL_n and M_0 a standard Levi, ν-acceptability compares eigenvalue valuations across blocks i < j with ⟨e_i − e_j, ν⟩ > 0 (those on block i are larger); with ν_i=−λ_i, Shin's sign convention this is the 2009 condition that larger slopes carry smaller valuations.
- `IsAcceptableFunction.not_all`: 1_{U^p} ⊗ 1_{J_b(ℤ_p)} is not acceptable when r > 1, because 1 ∈ J_b is not acceptable.

Use this interface as follows.

- `Shin 2009 Theorem 13.1`: the counting formula is proved for acceptable test functions
- `Shin 2010 Theorem 7.2`: the stable Igusa trace formula is stated for acceptable functions
- `Caraiani–Scholze non-compact §5.3`: the test function φ = φ_p φ_{S_pf} φ^S is assumed acceptable in the first instance

**Acceptance.**

- For GL_2-type data with slopes λ_1 > λ_2: δ = (1, p) on the slope components is acceptable and δ = (p, 1) is not.
- If b is basic (r = 1) every element of J_b(ℚ_p) is acceptable.
- For decreasing slopes λ_i, the cocharacter ν_i=−λ_i yields the large negative Frobenius shift fr^(−sN), which is acceptable; the positive shift reverses the inequality.
- 1_{U^p} ⊗ 1_{J_b(ℤ_p)} is not acceptable when r > 1, because 1 ∈ J_b is not acceptable.

*Needs:* .

The source statements fix the scope of this target.

[S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6 Definitions 6.1–6.2 p. 19. defines acceptable elements of J_b(ℚ_p) by separation of eigenvalue valuations across slopes, and acceptable functions by support, finiteness of fixed points and validity of the fixed-point formula (16).

[S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §3.3, Definition 3.1 and Remark 3.3, p. 11. defines ν-acceptable elements of a Levi and notes agreement with the 2009 definition.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, Remark 5.2.1 and Definition 5.2.2, pp. 732–733. uses acceptable functions for the Igusa trace and explains why acceptability allows transfer from J_b(ℚ_p) to G(ℚ_p).

<a id="et-5-igusa-fixed-point-formula"></a>

### ET.5.2 The fixed-point formula for Frobenius-twisted Igusa correspondences

Let φ = 1_{U^p(m) g U^p(m)} with g ∈ G(𝔸_f^p) × S_b, U^p(m) small, and Ig_{b,U^p,m} the finite-level Igusa variety over 𝔽̄_p with a model over a finite field 𝔽_{p^s} on which the absolute Frobenius acts as fr^{-s} ∈ J_b(ℚ_p). (a) The double coset defines an algebraic correspondence [U^p(m) g U^p(m)] on Ig_{b,U^p,m} through a smaller level V^p(m′), and a cohomological correspondence on L_ξ. (b) There is M′ > 0, independent of the coefficient sheaf, such that for every N > M′ the correspondence (Fr^s × 1)^N ∘ [U^p(m) g U^p(m)] = [U^p(m) g (fr^{-s})^N U^p(m)] has finitely many fixed points and its Lefschetz trace on H_c(Ig_{b,U^p,m}, L_ξ) equals the sum over its fixed points of the traces on the stalks of L_ξ. (c) Consequently φ^{(N)}(x) = φ(x·(fr^s)^N) is acceptable for N ≫ 0 (Shin 2009 Lemma 6.3). For a normalized double-coset function e_g=1_{UgU}/vol(U), the trace is the correspondence trace; for the unnormalized characteristic function 1_{UgU}, multiply the correspondence fixed-point sum by vol(U), as in Shin 2009 (11), p. 17.

Assume the following conditions.

- Ig_{b,U^p,m} is separated of finite type but not proper; the theorem uses the Frobenius-twist form of Fujiwara's theorem, not a proper Lefschetz formula
- U^p(m) small enough
- ξ an irreducible algebraic representation giving the ℓ-adic sheaf L_ξ
- To invoke EDC.8, verify a finite-type compactification with locally invariant boundary, proper first leg over the interior and quasi-finite second leg, using the Igusa Hecke correspondence. The sheaf-independent bound is taken after that geometric correspondence is fixed.

The proof proceeds through these steps.

1. Build the correspondence (13) of Shin 2009 §6 from the Hecke and J_b-actions of IgusaVarietiesAndTorsionConcentration:IG.1/igusa-group-actions, with the level V^p(m′) of Mantovan 2005 Lemma 6.
2. Choose a model over 𝔽_{p^s} on which Frobenius acts through fr^{-s} (Shin 2007 §2.3), so that twisting by (fr^{-s})^N is composition with the N-th Frobenius power.
3. Apply the Fujiwara–Varshavsky theorem (EtaleDualityAndPerverseSheaves:EDC.8/fujiwara-varshavsky-trace-formula, with EDC.8/frobenius-twist-contracting): for N above a bound independent of the sheaf, the twisted correspondence has isolated fixed points and naive local terms. Isolation, finiteness and the large-Frobenius-power bound are checked here, on the Igusa variety; the general trace theorem is EDC.8's.
4. This is the contracting-boundary trace theorem of the layer: the Igusa application of Fujiwara–Varshavsky, not the point count of an ordinary endomorphism.
5. The local algebraic σ-conjugacy and Igusa-geometry inputs formerly cited upward are missing from this tier. They must be planned in this roadmap before this proof is closed; see the review gap and handoff. Removing the illegal imports is not a proof of those inputs.

**Acceptance.**

- For g = 1 and N large, the fixed points of (Fr^s)^N are the 𝔽_{p^{sN}}-points of the model, and the formula is the Grothendieck–Lefschetz trace formula for the open variety with compact supports.
- Small powers are outside the theorem’s guaranteed range. The source does not prove a failure example for every small N.
- The bound M′ does not depend on ξ.

*Needs:* `EtaleDualityAndPerverseSheaves:EDC.8/fujiwara-varshavsky-trace-formula`, `EtaleDualityAndPerverseSheaves:EDC.8/frobenius-twist-contracting`, `EtaleDualityAndPerverseSheaves:EDC.8/contracting-correspondence`, `EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence-lifting`, `EtaleDualityAndPerverseSheaves:EDC.5`, `EtaleDualityAndPerverseSheaves:EDC.6`, `LefschetzPencilsAndVanishingCycles:LPV.6`.

The source statements fix the scope of this target.

[S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, diagrams (13)–(14), (15), formula (16) and Lemma 6.3 with proof, pp. 17–18. realises Hecke and J_b-actions as correspondences on Igusa varieties, states the desired fixed-point formula (16) and proves it after a large Frobenius twist by Fujiwara's formula (Fujiwara 1997 Cor. 5.4.5; Varshavsky Thm 2.3.2).

[A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.5, proof of Lemma 5.5.1, p. 743. records that the proof of Shin's Lemma 6.4 rests on Lemma 6.3, i.e. on Fujiwara's formula for the datum at hand.

<a id="et-5-igusa-kottwitz-triples"></a>

### ET.5.3 Kottwitz triples for Igusa varieties and their invariant

With the PEL datum and b as in ET.5/acceptable-test-functions: a Kottwitz triple of type b is (γ_0; γ, δ) with γ_0 ∈ G(ℚ) semisimple and elliptic in G(ℝ), γ ∈ G(𝔸_f^p) conjugate to γ_0 over 𝔸_f^p, and δ ∈ J_b(ℚ_p) acceptable and conjugate to γ_0 in G(ℚ̄_p) (after transport over ℚ̄_p through the inner twist; J_b need not be ℚ_p-isomorphic to M_b), up to the equivalence generated by conjugating γ_0 stably, γ in G(𝔸_f^p) and δ in J_b(ℚ_p). KT_b is the set of equivalence classes. For each triple with stable centralizer I_0 the Kottwitz invariant α(γ_0; γ, δ) ∈ 𝔎(I_0/ℚ)^D is defined from local invariants inv_v(γ_0, γ_v) for v ≠ p, ∞ (ET.0/rational-classes-in-stable-class), the invariant α_p(γ_0; δ) obtained from the class of δ in B(I_0) through the Kottwitz map, and the archimedean invariant; the triple is effective if α(γ_0; γ, δ) is trivial, and KT_b^eff ⊂ KT_b is the set of effective classes. The group I_δ (the ordinary connected centralizer of δ in J_b) is an inner form of I_0 over ℚ_p, and α_p changes by inv_p when δ or γ_0 is replaced by a stably conjugate element.

Assume the following conditions.

- unramified PEL datum of type (A) or (C)
- δ acceptable

The proof proceeds through these steps.

1. The definition is Shin 2009 Definitions 10.1, 10.3 and 10.7, with α defined in §10 from the cocycles c_v and the Kottwitz map (displays (27)–(28)); Shin 2010 Definition 4.2 and §§4.2–4.3 give the same notion with α̃_p.
2. Lemma 10.8 (I_δ is an inner form of I_0) and Lemma 10.9 (change of invariants) follow from the inner-twist theory of ET.0/inner-twist and the Kottwitz map of BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps.
3. The local algebraic σ-conjugacy and Igusa-geometry inputs formerly cited upward are missing from this tier. They must be planned in this roadmap before this proof is closed; see the review gap and handoff. Removing the illegal imports is not a proof of those inputs.

Expose the following operations and relations.

- `KottwitzTriple` (constructor): Triples (γ_0;γ,δ) with γ_0 elliptic semisimple, γ ~ γ_0 away from p, δ acceptable with δ ~ γ_0 at p.
- `KottwitzTriple.equiv` (extensionality): Equivalence generated by stable conjugation of γ_0 and conjugation of γ and δ.
- `KottwitzTriple.invariant` (data): α(γ_0;γ,δ) ∈ 𝔎(I_0/ℚ)^D from local invariants and the Kottwitz map at p.
- `KottwitzTriple.IsEffective` (constructor): Effective iff α is trivial.
- `KottwitzTriple.innerForm` (projection): I_δ is an inner form of I_0 over ℚ_p.
- `KottwitzTriple.invariant_change` (relation): α_p(γ_0;δ′) = α_p(γ_0;δ) + inv_p(δ,δ′) and α_p(γ′_0;δ) = α_p(γ_0;δ) + inv_p(γ_0,γ′_0).

**Checks.**

- `KottwitzTriple.gm`: For G = 𝔾_m-type data every triple is (z;z,z) with z central and all triples are effective.
- `KottwitzTriple.not_acceptable`: (γ_0;γ,δ) with δ not acceptable is excluded; including it would break the transfer at p (ET.5/transfer-at-p).
- `KottwitzTriple.trivial_kernel`: If 𝔎(I_0/ℚ) = 1 then KT_b^eff = KT_b over γ_0.
- `KottwitzTriple.compat_shimura`: Even for basic b these are ordinary conjugacy triples with δ∈J_b(ℚ_p). Kottwitz 1992 uses a σ-conjugacy variable over an unramified extension; Shin 2009 Remark 13.3 p. 42 warns that no explicit identification of the two indexing sets is supplied.

Use this interface as follows.

- `Shin 2009 Theorem 13.1`: the counting formula is a sum over KT_b^eff
- `Shin 2010 §§5–6`: the stabilisation regroups effective triples by κ ∈ 𝔎(I_0/ℚ) and endoscopic triples
- `Kottwitz 1992 (19.5)`: the analogous formula for Shimura varieties, to which Shin's is modelled (Remark 13.3)

**Acceptance.**

- For G = 𝔾_m-type data every triple is (z;z,z) with z central and all triples are effective.
- (γ_0;γ,δ) with δ not acceptable is excluded; including it would break the transfer at p (ET.5/transfer-at-p).
- If 𝔎(I_0/ℚ) = 1 then KT_b^eff = KT_b over γ_0.
- Even for basic b these are ordinary conjugacy triples with δ∈J_b(ℚ_p). Kottwitz 1992 uses a σ-conjugacy variable over an unramified extension; Shin 2009 Remark 13.3 p. 42 warns that no explicit identification of the two indexing sets is supplied.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.0/rational-classes-in-stable-class`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/global-kottwitz-obstruction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/inner-twist`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/acceptable-test-functions`.

The source statements fix the scope of this target.

[S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §10, Definitions 10.1, 10.3, 10.7 and Lemmas 10.8–10.9, pp. 28–32. defines Kottwitz triples of type b, their equivalence, the Kottwitz invariant and effective triples, and proves that I_δ is an inner form of I_0 and how the invariants change.

[S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §4.2, Definition 4.2 and Lemma 4.3, pp. 13–14; §4.3, p. 14. restates Kottwitz triples with ν_b-acceptable δ and defines α̃_p(γ_0, δ).

<a id="et-5-p-adic-type"></a>

### ET.5.4 p-adic types with field action

For a number field F₀ define a p-adic type as (M,(η_t),(n_t),κ), where M=∏_{t∈I} M_t is a nonempty finite product of CM or totally real fields, κ:F₀→M is a ℚ-algebra homomorphism, n_t is a positive integer, and η_t=Σ_{x|p}η_{t,x}[x] is an effective rational divisor supported above p with η_t+c*η_t=[p]. Here [p] has coefficient e(x/p), and pullback under a field embedding uses the ramification indices. It is simple when I is a singleton and n_t=1. Equivalence is common refinement by F₀-algebra embeddings, preserving the pulled-back η and summing multiplicities in each target factor as in Shin §8 p. 24; isomorphism and equivalence are distinct. Each equivalence class has a unique minimal representative up to isomorphism.

Assume the following conditions.

- M_t CM or totally real; κ is an algebra map, not a polarization or positivity datum.

The proof proceeds through these steps.

1. Use divisor pullback with ramification multiplicities; common refinements give the equivalence relation.
2. For simple types descend η in a common Galois extension to its stabilizer field; then collect distinct minimal simple types and multiplicities (Shin §8 pp. 24–25).

Expose the following operations and relations.

- `PadicType.mk` (constructor): Constructor from effective η with η+c*η=[p], positive n and κ.
- `PadicType.ext` (extensionality): For fixed labeled factors, equality follows from equality of η, n and κ. Relabeling factors gives isomorphism, not literal equality.
- `PadicType.pullback` (relation): Pullback uses e(y/x); c* and [p] commute with it.
- `PadicType.equiv` (relation): Equivalence by common refinements is reflexive, symmetric and transitive.
- `PadicType.minimal` (relation): Minimal representatives are unique up to F₀-algebra isomorphism.

**Checks.**

- `PadicType.ordinary`: For an imaginary quadratic M in which p splits as x·xᶜ, η=[x] and n=1 satisfy η+c*η=[p], with slopes 1 and 0.
- `PadicType.real`: For M=ℚ, c=1 forces η=(1/2)[p]; η=0 fails the balancing equation.
- `PadicType.product`: The product of two inequivalent simple types with multiplicities 2 and 3 is a type; it is not simple and its factors cannot be dropped.
- `PadicType.ramified_pullback`: For a ramified quadratic extension of local factors, coefficient 1 pulls back to coefficient 2, not 1; this preserves [p].

Use this interface as follows.

- `EndoscopicTransferAndUnitaryTraceComparison:ET.5`: Normalization and constructors used by the dependent targets identified in the review.

**Acceptance.**

- For an imaginary quadratic M in which p splits as x·xᶜ, η=[x] and n=1 satisfy η+c*η=[p], with slopes 1 and 0.
- For M=ℚ, c=1 forces η=(1/2)[p]; η=0 fails the balancing equation.
- The product of two inequivalent simple types with multiplicities 2 and 3 is a type; it is not simple and its factors cannot be dropped.
- For a ramified quadratic extension of local factors, coefficient 1 pulls back to coefficient 2, not 1; this preserves [p].

*Needs:* `AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate`.

The source statements fix the scope of this target.

[S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §8 Definitions 8.1–8.2 and equivalence p. 24; minimal representatives p. 25. defines the rational divisors, multiplicities, algebra action and refinement equivalence.

<a id="et-5-p-adic-types"></a>

### ET.5.5 p-adic types and Honda–Tate theory with endomorphism structure

For the semisimple category AV_B^0 of pairs (A,i) over 𝔽̄_p, with i:B→End⁰(A) a ℚ-algebra map and rational B-linear morphisms, where B is the PEL semisimple algebra with centre F and splits at p, isomorphism classes correspond to equivalence classes of p-adic types over F (ET.5/p-adic-type). For a minimal simple type (M_t,η_t), the centralizer division algebra C_t has the local invariants of Shin (23), p. 26; its slope at x|p is η_x/e(x/p) and the height is [M_{t,x}:ℚ_p]√[B:F]√[C_t:M_t]. For multiplicity n_t multiply that height by n_t. Corollary 8.5 restricts this classification to objects B_p-linearly quasi-isogenous to Σ_b by equality of each slope and each F_v-height. This classification is unpolarized. Kottwitz triples determine such types by Lemma 10.4 and Corollary 10.6; the polarization obstruction and effective-triple bijection are separate targets of §§11–12.

Assume the following conditions.

- The PEL algebra B and its centre F as in Shin §8; B splits at p.
- Objects and morphisms are considered up to isogeny; neither a polarization nor its obstruction is part of Proposition 8.4 or Corollary 8.5.

The proof proceeds through these steps.

1. Use Tate Hom and Honda–Tate for simple abelian varieties, then semisimplicity of AV_B^0 to record distinct simple factors and multiplicities.
2. Compute the B-centralizer algebras and the slopes and heights as in Shin Proposition 8.4 (23), p. 26; compare them with Σ_b for Corollary 8.5.
3. Attach the type to a Kottwitz triple using Shin Lemma 10.4 and Corollary 10.6, pp. 30–31. Add polarization only in ET.5/fixed-points-and-effective-triples.

**Acceptance.**

- A supersingular elliptic curve over 𝔽_{p²} with Frobenius p has a real Weil number and End^0 the quaternion algebra ramified exactly at p and ∞.
- An ordinary elliptic curve has a type with M imaginary quadratic split at p.
- A Weil number that is not a q-Weil number gives no type.

*Needs:* `AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate`, `AbelianSchemesAndArithmeticModuliPartII:F0/tate-hom`, `PELModuli:M1/pel-abelian-scheme`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/igusa-kottwitz-triples`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/p-adic-type`.

The source statements fix the scope of this target.

[S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §8, Definitions 8.1–8.2, Remark 8.3, Proposition 8.4, Corollary 8.5 and Lemma 8.6, pp. 23–26. introduces p-adic types, relates simple types to Harris–Taylor's, and classifies isogeny classes with endomorphism structure through Honda–Tate theory.

[S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §10, Lemma 10.4 and Corollary 10.6, pp. 29–30. attaches a p-adic type to each Kottwitz triple.

<a id="et-5-fixed-points-and-effective-triples"></a>

### ET.5.6 Fixed points of Igusa correspondences are counted by effective triples

Let PIC_b be the near-equivalence classes of polarized PEL objects over 𝔽̄_p with the specified p-divisible-group structure. For z∈PIC_b, H_z is its algebraic group of PEL self-quasi-isogenies. Define FPAV_b by pairs (z,[a]) with a∈H_z(ℚ) acceptable, up to H_z(ℚ)-conjugacy (Shin Definition 9.7 p. 29). Lemmas 12.1 and 12.3 give a bijection FPAV_b→KT_b^eff: the auxiliary polarization invariants imply α=0 and vanishing α permits the converse construction. The centralizer Z_{H_z}(a), not the stabilizer of a neat-level point, is an inner form of I₀ compact modulo centre at infinity. The fixed-point description at a level is a quotient of the corresponding adelic level sets; Lemma 7.4 produces orbital integrals and centralizer-volume weights. The aggregate coefficient is then computed in the counting formula; it is not a pointwise |ker¹(ℚ,G)| multiplicity assertion.

Assume the following conditions.

- unramified PEL datum; polarizations up to near equivalence (Shin 2009 §9)

The proof proceeds through these steps.

1. Describe Ig_b(𝔽̄_p) through polarized abelian varieties with an isomorphism of p-divisible groups to Σ_b (Shin 2009 §7, Lemma 7.1, Definition 7.2, Lemmas 7.3–7.4).
2. Classify isogeny classes by p-adic types (ET.5/p-adic-types) and polarizations by Shin 2009 §9 (Lemmas 9.2–9.6), then attach a Kottwitz triple (Lemma 12.1) and prove effectivity from the vanishing of the auxiliary invariants (§11).
3. Surjectivity onto effective triples uses Honda–Tate existence and the Hasse principle for the PEL group (PELModuli:M3/ker1-classification, M3/hasse-principle-cases), with ker^1 multiplicities as in Kottwitz 1992 §§14–19.
4. This node is the Igusa-variety form of the Langlands–Kottwitz parametrisation; the Shimura-variety form for compact unitary data is AutomorphicGaloisRepresentationsPartII:AG2.1a/raw-fixed-point-trace-identity and is not replanned here.
5. The local algebraic σ-conjugacy and Igusa-geometry inputs formerly cited upward are missing from this tier. They must be planned in this roadmap before this proof is closed; see the review gap and handoff. Removing the illegal imports is not a proof of those inputs.

**Acceptance.**

- For a CM point (b basic, I_0 a torus) the fibre over a triple is a single I_φ(ℚ)-orbit.
- If α(γ_0;γ,δ) ≠ 0 the triple has no abelian variety over it.
- The count is independent of the choice of Σ_b in its isogeny class.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.5/p-adic-types`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/igusa-kottwitz-triples`, `PELModuli:M3/ker1-classification`, `PELModuli:M3/hasse-principle-cases`.

The source statements fix the scope of this target.

[S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §7, Lemmas 7.1, 7.3, 7.4, pp. 20–22; §9, Definition 9.7, p. 28. describes 𝔽̄_p-points of Igusa varieties and the fixed points of correspondences in terms of polarized abelian varieties.

[S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §§11–12, Lemma 11.1, Corollary 11.3, Lemmas 12.1 and 12.3, pp. 35–38. proves that triples from abelian varieties are effective and that FPAV_b → KT_b^eff is a bijection.

<a id="et-5-igusa-counting-formula"></a>

### ET.5.7 Shin's point-counting formula for Igusa varieties

If φ ∈ C_c^∞(G(𝔸_f^p) × J_b(ℚ_p)) is acceptable, then tr(φ | H_c(Ig_b, L_ξ)) = Σ_{(γ_0;γ,δ) ∈ KT_b^eff} vol(I_∞(ℝ)^1)^{-1} |A(I_0)| tr ξ(γ_0) · O^{G(𝔸_f^p) × J_b(ℚ_p)}_{(γ,δ)}(φ), the orbital integral taken over I_{(γ,δ)}(𝔸_f^p × ℚ_p) with the transported Haar measures, I_∞ the inner form of I_0 compact modulo centre at ∞ and A_ℚ(I_0) = π_0(Z(Î_0)^Γ)^D (Kottwitz 1986 §§1–2; Shin 2010 §2.2), a finite group for elliptic γ_0, which sits in the exact sequence 1 → 𝔎(I_0/ℚ)^D → A_ℚ(I_0) → A_ℚ(G) → 1 (the analogue of the ker^1 and Tamagawa factors of Kottwitz 1992 (19.5)). The only implicit hypothesis is that Ig_b comes from an unramified integral PEL datum.

Assume the following conditions.

- unramified integral PEL datum of type (A) or (C) at p
- φ acceptable

The proof proceeds through these steps.

1. Start from the fixed-point formula (ET.5/igusa-fixed-point-formula) and the parametrisation of fixed points by effective triples (ET.5/fixed-points-and-effective-triples).
2. Regroup the fixed points over each triple as an orbital integral of φ with the volume of I_φ and the ker^1 multiplicity (Shin 2009 §13).
3. Use Shin Theorem 13.1 p. 42 for the Igusa coefficient. Remark 13.3 compares the shape with Kottwitz (19.5) while explicitly leaving the relation between their indexing sets implicit; no direct identification is used.

**Acceptance.**

- For b basic and g = 1, φ = 1_{U^p} ⊗ 1_{δ K_p}, the formula counts fixed points of δ on the zero-dimensional basic Igusa variety.
- For φ supported on non-acceptable δ the formula is not asserted.
- Both sides are linear in φ.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.5/igusa-fixed-point-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/fixed-points-and-effective-triples`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/orbital-integral`, `AdelicAlgebraicGroups:AA.2/tamagawa-measure`.

The source statements fix the scope of this target.

[S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §13, Theorem 13.1 and Remarks 13.2–13.3, p. 41. proves the counting formula for acceptable functions as a sum over effective Kottwitz triples, with the only implicit hypothesis an unramified integral PEL datum.

[S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §4.4, Theorem 4.4 and display (4.3), p. 15. restates the formula as the input to stabilisation.

<a id="et-5-stabilization-away-from-p"></a>

### ET.5.8 Stabilization of the Igusa counting formula away from p and ∞

In the formula of ET.5/igusa-counting-formula, write the sum over effective triples as a sum over (γ_0, κ) with κ ∈ 𝔎(I_0/ℚ) by Fourier inversion of the Kottwitz invariant. Then: (a) e_v(I_v) = 1 for almost all v ≠ p, ∞, and for effective triples the product of the local signs is controlled (Shin 2010 Lemma 5.1); (b) for each (H, s, η) elliptic and each γ_H transferring to γ_0, there is h^{H,p} ∈ C_c^∞(H(𝔸_f^p)) (a Langlands–Shelstad transfer of φ^p, unramified-matching at almost all places) whose stable orbital integrals equal the κ-orbital integrals of φ^p (Lemma 5.2), and h_{H,∞} a combination of averaged pseudo-coefficients whose stable orbital integrals reproduce the archimedean factor vol(I_∞(ℝ)^1)^{-1} tr ξ(γ_0) with the sign ⟨μ, s⟩ convention of Kottwitz (Lemma 5.4 and Remark 5.5). The twisted fundamental lemma is not needed on this route: away from p only ordinary transfer and the ordinary fundamental lemma enter, and at p the transfer of ET.5/transfer-at-p is used.

Assume the following conditions.

- the ordinary transfer factors of ET.1/local-transfer-factor with Kottwitz's sign convention (Shin 2010 Remark 5.5: s versus s^{-1})
- At infinity use functions compact modulo A_{G,∞}^0 with the central character fixed by ξ, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; C_c^∞ in this node denotes this central-character space, not ordinary compact support on the whole group.

The proof proceeds through these steps.

1. Rewrite α(γ_0;γ,δ) through 𝔎(I_0/ℚ)^D and its local components (ET.0/global-kottwitz-obstruction).
2. Away from p and ∞ use Langlands–Shelstad transfer (ET.3/local-transfer-existence) and the fundamental lemma at almost all places (ET.3/fundamental-lemma-almost-all-places).
3. At ∞ use the pseudo-coefficient transfer of ET.1/archimedean-pseudocoefficient-transfer (Kottwitz 1990 §7).
4. The wording 'unproved twisted fundamental lemma' of the older stage text is replaced: the twisted fundamental lemma is proved for unit elements (Waldspurger with Ngô) and for spherical functions (Lemaire–Mœglin–Waldspurger 2018), see ET.3/twisted-fundamental-lemma-and-transfer; this route simply does not invoke it.

**Acceptance.**

- For H = G and κ = 1 the transfer is the identity and the sign is 1.
- For G with 𝔎(I_0/ℚ) trivial for all γ_0 (no endoscopy), the stabilisation away from p is the identity.
- If φ^p is unramified at v, h^{H,p}_v is the unramified image.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.5/igusa-counting-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/global-kottwitz-obstruction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/local-transfer-existence`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/fundamental-lemma-almost-all-places`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/archimedean-pseudocoefficient-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/local-transfer-factor`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/twisted-fundamental-lemma-and-transfer`.

The source statements fix the scope of this target.

[S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §5, Lemmas 5.1, 5.2, 5.4 and Remarks 5.3, 5.5, 5.6, pp. 15–17. performs the first stabilisation step and constructs the functions h_{H,p} away from p and h_{H,∞} at infinity.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, Definition 5.2.2, pp. 732–733. defines φ^H away from p by Langlands–Shelstad transfer and at ∞ by Kottwitz's construction.

<a id="et-5-jb-endoscopic-levi-data"></a>

### ET.5.9 Endoscopy of J_b through the Levi M_b

Let b ∈ B(G_{ℚ_p}) be decent with slope cocharacter ν_b, M_b the centralizer of ν_b (a Levi subgroup of G_{ℚ_p}) and J_b the inner form of M_b given by b (BunGAndNewtonStrata:BG0/sigma-centralizer-J-b). For an endoscopic triple (H, s, η) of G over ℚ_p define: E_p(M_b, G) and E_p(J_b, G), the sets of G-endoscopic triples (M_H, s_H, η_H) for M_b and for J_b; the subsets E^ef_p(M_b, G; H) of classes for which some γ_{M_H} ∈ M_H(ℚ_p) and γ_H ∈ H(ℚ_p) correspond, with γ_{M_H} ν_b-acceptable, and E^eff_p(J_b, G; H) ⊂ E^ef_p(M_b, G; H) similarly for J_b (Shin 2010 §6.1–6.2). For a triple (T_H, T, j) of maximal tori T_H ⊂ H, T ⊂ M_b and j : T_H ≅ T construct the cocharacter ν : 𝔻 → H (ν_b followed by j^{-1}), the centralizer H_ν = Z_H(ν), and complete it to a G-endoscopic triple (H_ν, s_ν, η_ν) for M_b with embeddings l_{M_b}, l_{M_H}, i_{M_H}, ν_{M_H} fixed as in Shin 2010 §6.2; this gives the representatives used for the transfer at p.

Assume the following conditions.

- b decent; the endoscopic triples are ordinary (no twist) over ℚ_p
- Each M_H is quasi-split. The torus map j is the admissible map determined by the endoscopic datum, not an arbitrary isomorphism of ℚ_p-tori.

The proof proceeds through these steps.

1. Compare root systems: R(H_ν, T_H) ⊂ R(M_b, T) and the coroots satisfying α^∨(s) = 1 (Shin 2010 (6.4)).
2. Construct the L-embedding of ^LH_ν into ^LM_b compatible with η via the Levi L-embedding of ReductiveGroupsPartII:RG2.5/l-group-levi-embedding.
3. Show the injection E^eff_p(J_b,G;H) ↪ E^ef_p(M_b,G;H) and the bijection between related pairs (Shin 2010 (6.1)–(6.2), Lemmas 6.1–6.2).
4. The local algebraic σ-conjugacy and Igusa-geometry inputs formerly cited upward are missing from this tier. They must be planned in this roadmap before this proof is closed; see the review gap and handoff. Removing the illegal imports is not a proof of those inputs.

Expose the following operations and relations.

- `JbEndoscopicTriples` (constructor): E_p(J_b,G) and E_p(M_b,G), sets of G-endoscopic triples for J_b and M_b.
- `JbEndoscopicTriples.effective` (constructor): E^eff_p(J_b,G;H) ⊂ E^ef_p(M_b,G;H), defined by the existence of related ν_b-acceptable elements.
- `JbEndoscopicTriples.ofTori` (constructor): (H_ν, s_ν, η_ν) built from (T_H, T, j).
- `JbEndoscopicTriples.effective_injective` (relation): E^eff_p(J_b,G;H) ↪ E^ef_p(M_b,G;H).
- `JbEndoscopicTriples.basic` (simp): For b basic, E_p(J_b,G) is the set of endoscopic triples of the inner form J_b of G.
- `JbEndoscopicTriples.trivial` (simp): For H = G, the only triple is (M_b, 1, id).

**Checks.**

- `JbEndoscopicTriples.gl_basic`: For G=GL₂ and basic slope 1/2, J_b=D×, while the effective trivial datum has quasi-split endoscopic group M_H=GL₂ and s=1; it is not the triple (D×,1,id).
- `JbEndoscopicTriples.ordinary`: Under the explicit hypothesis J_b≅M_b, the effective inner-form and quasi-split sets agree. Do not infer this solely from an undefined μ-ordinary label in general PEL data.
- `JbEndoscopicTriples.empty`: For an endoscopic H whose tori do not transfer to J_b (e.g. a split torus and J_b anisotropic modulo centre), E^eff_p(J_b,G;H) is empty.
- `JbEndoscopicTriples.trivial_test`: For H = G the set has one element.

Use this interface as follows.

- `Shin 2010 Lemma 6.5`: h^H_p is defined by matching κ-orbital integrals indexed by these triples
- `Caraiani–Scholze 2017 Remark 5.4.1`: Red^b_n⃗ is a sum over E^eff_p of Jacquet functors, transfer and the Langlands–Jacquet map
- `ET.7b/newton-reduction`: the representation-theoretic dual of the transfer at p

**Acceptance.**

- For G=GL₂ and basic slope 1/2, J_b=D×, while the effective trivial datum has quasi-split endoscopic group M_H=GL₂ and s=1; it is not the triple (D×,1,id).
- Under the explicit hypothesis J_b≅M_b, the effective inner-form and quasi-split sets agree. Do not infer this solely from an undefined μ-ordinary label in general PEL data.
- For an endoscopic H whose tori do not transfer to J_b (e.g. a split torus and J_b anisotropic modulo centre), E^eff_p(J_b,G;H) is empty.
- For H = G the set has one element.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.0/endoscopic-datum`, `ReductiveGroupsPartII:RG2.5/l-group-levi-embedding`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/inner-twist`.

The source statements fix the scope of this target.

[S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §3.2, p. 10. defines M_b and J_b and the inner twist between them.

[S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §6.1–6.2, (6.1)–(6.4) and Lemmas 6.1–6.2, pp. 17–20. defines the sets of (effective) endoscopic triples for M_b and J_b and constructs the representatives (M_H, s_H, η_H) from tori.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.4, Remark 5.4.1, pp. 739–740. uses E^eff_p(J_b, G, G_n⃗) (attributed there to Shin's §6.2) to define the map Red^b_n⃗.

<a id="et-5-transfer-at-p"></a>

### ET.5.10 Transfer at p from J_b to endoscopic groups of G

Let (H,s,η) be an elliptic endoscopic triple of G and φ_p ∈ C_c^∞(J_b(ℚ_p)) acceptable. (a) (Nonstandard transfer, Shin 2010 Lemma 3.9) If φ ∈ C_c^∞(M_0(ℚ_p)) is supported on ν-acceptable elements and has vanishing orbital integrals at semisimple m with disconnected centralizer, there is φ̃ ∈ C_c^∞(G_0(ℚ_p)) with O^{G_0}_g(φ̃) = δ_P(ν)(m)^{-1} O^{M_0}_m(φ) when g is conjugate to an acceptable m and 0 otherwise. (b) (Transfer-factor identity, Lemma 6.3) For each (M_H, s_H, η_H) ∈ E^eff_p(J_b,G;H) there is a non-zero constant c_{M_H}, depending only on the normalisation of the transfer factor Δ_p(·,·)_{J_b M_H}, with c_{M_H} Δ_p(γ_H, δ)_{J_b M_H} = ⟨α̃_p(γ_0, δ), κ̃⟩^{-1} Δ_p(γ_H, γ_0)_{M_b M_H} for related γ_H, γ_0, δ; in the GL case c_{M_H}=e_p(J_b) μ₁(s₂)⟨ν̂_b^{M_H},s₁⟩⁻¹ (Shin (8.7), p. 28), and when J_b≅M_b the formula is c_{M_H}=μ₁(s₂)⟨κ_{Z(M_b)}(z),s₁⟩⁻¹ ((8.11), p. 29). Neither hypothesis forces c_{M_H}=1; for H=G the trivial datum gives c=e_p(J_b) (Remark 6.4 p. 21). (c) (Lemma 6.5) There is h^H_p ∈ C_c^∞(H(ℚ_p)) such that for every (G,H)-regular semisimple γ_H, SO(h^H_p) at γ_H equals the κ̃-weighted orbital integral O_p(γ_0, κ̃, φ_p) if (H,s,η,γ_H) is effectively related to some δ, and 0 otherwise; h^H_p is obtained by transfer from J_b(ℚ_p) to M_H(ℚ_p) (through the quasi-split M_b) followed by the nonstandard transfer (a) from M_H to H. Dually, on representations, tr π_H(h^H_p) = tr(Red^b_H(π_H))(φ_p) where Red^b_H = n-Red^b_H ⊗ δ̄^{1/2}_{P(ν_b)} includes the modulus twist δ̄_{P(ν_b)}(δ) = δ_{P(ν_b)}(γ_0) (Shin 2010 §6; the corrected form of Caraiani–Scholze 2017 Lemma 5.4.2, the modulus correction below); the representation-theoretic map itself is planned in ET.7b/newton-reduction.

Assume the following conditions.

- φ_p acceptable (essential for (a))
- transfer factors normalised as in Shin 2010 §6.3

The proof proceeds through these steps.

1. (a): Shin 2010 Lemma 3.9 (cf. Harris–Taylor Lemma V.5.2), descending orbital integrals along the parabolic with Levi M_0 defined by ν, using that acceptable elements are regular for the unipotent radical.
2. (b): compare Kottwitz invariants with the Langlands–Shelstad factors of ET.1/local-transfer-factor through the inner twist J_b → M_b (Shin 2010 §6.4, proof of Lemma 6.3).
3. First put φ₀=φ_p·δ_{bar P(ν_b)}^(1/2). Transfer φ₀ from J_b to each quasi-split M_H using the chosen L-embedding, then multiply by δ_{P(iν)}^(−1/2) and apply Lemma 3.9. Sum over the embedding classes I(M_H,H), modulo the indicated outer action, with c_{M_H} and the coefficients of Shin §6.3 pp. 21–22. Lemma 6.5 proves the resulting stable-orbital identity. Omitting either modulus or the constants changes the trace formula.

**Acceptance.**

- For H = G and b basic, h^G_p is the transfer of φ_p from the inner form J_b to G, multiplied by the Kottwitz sign e(J_b).
- When J_b≅M_b, c=μ₁(s₂)⟨κ_{Z(M_b)}(z),s₁⟩⁻¹, not an unconditional 1.
- A nonacceptable φ_p is outside the hypotheses of the transfer construction; no universal impossibility of transfer is asserted.

**Supplier boundary.** The geometric transfer is an early supplier for ET.7b. The representation-theoretic trace formula in (c) needs an independently available normalized Jacquet/JL composite. ET.7b/newton-reduction cannot simultaneously be its prerequisite and its later consumer; that early construction or a separation of the two assertions remains an ownership and proof-order obligation.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.5/jb-endoscopic-levi-data`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/acceptable-test-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/local-transfer-factor`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/local-transfer-existence`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/inner-form-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/kottwitz-sign`, `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`.

The source statements fix the scope of this target.

[S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §3.4, Lemma 3.9 and Corollary 3.10, p. 12. proves the nonstandard transfer of functions supported on ν-acceptable elements of a Levi to the group.

[S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §6.3–6.4, Lemmas 6.3 and 6.5, pp. 21–25; §8, pp. 27–28. proves the identity between the Kottwitz invariant and transfer factors with constant c_{M_H}, constructs h^H_p, and computes c_{M_H} in the GL and J_b ≅ M_b cases.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.4, Remark 5.4.1, pp. 739–740. describes φ^n⃗_p as transfer from J_b(ℚ_p) to M_{G_n⃗}(ℚ_p) followed by nonstandard transfer to G_n⃗(ℚ_p).

<a id="et-5-igusa-endoscopic-test-function"></a>

### ET.5.11 The endoscopic test functions φ^H attached to an Igusa test function

For φ = φ^p φ_p ∈ C_c^∞(G(𝔸_f^p) × J_b(ℚ_p)) acceptable and (H,s,η) ∈ E^ell(G), define φ^H = h^{H,p} h^H_p h^H_∞ ∈ C_c^∞(H(𝔸)): h^{H,p} a Langlands–Shelstad transfer of φ^p (unramified image at almost all places), h^H_p the function of ET.5/transfer-at-p, and h^H_∞ the general PEL archimedean function of ET.5/stabilization-away-from-p (and ET.4/archimedean-lefschetz-functions for the unitary specialization) (Kottwitz's combination of averaged pseudo-coefficients, φ^n⃗_∞ for the unitary groups). For the unitary similitude datum of Caraiani–Scholze with G ≅ G_N over 𝔸_f and the test function φ = φ_p · 1_{K(N)} · φ^S (φ^S unramified, K(N) principal congruence at S_pf with N_0 | N), φ^n⃗ = φ^n⃗_p · φ^n⃗_{S_pf} · φ^{n⃗,S} · φ^n⃗_∞ with φ^{n⃗,S} = η̃*_n⃗(φ^S) (ET.4/unramified-transfers) and φ^n⃗_{S_pf} the Langlands–Shelstad transfer of 1_{K(N)}.

Assume the following conditions.

- φ acceptable
- the level N divisible by N_0 of ET.4/small-level-transfer in the non-compact datum
- At infinity use functions compact modulo A_{G,∞}^0 with the central character fixed by ξ, as in Shin 2010 §1.2. For transfers transport that character to the endoscopic and base-change split centres; C_c^∞ in this node denotes this central-character space, not ordinary compact support on the whole group.

The proof proceeds through these steps.

1. Assemble the local constructions: Shin 2010 §7; Caraiani–Scholze 2017 Definition 5.2.2; Caraiani–Scholze non-compact Definition 5.3.1.

Expose the following operations and relations.

- `igusaEndoscopicTestFunction` (constructor): φ ↦ φ^H = h^{H,p} h^H_p h^H_∞.
- `igusaEndoscopicTestFunction.stableOrbital` (characterisation): SO_{γ_H}(φ^H) equals the κ-weighted combination of orbital integrals of φ at the related triples, and 0 if no triple is related.
- `igusaEndoscopicTestFunction.unramified` (simp): At an unramified place v ∉ S, (φ^H)_v = η̃*(φ_v).
- `igusaEndoscopicTestFunction.trivial` (simp): For H = G, φ^G away from p is φ^p.
- `igusaEndoscopicTestFunction.linear` (structure): φ ↦ φ^H is linear modulo functions with vanishing stable orbital integrals.

**Checks.**

- `igusaEndoscopicTestFunction.basic_gl`: For G = GL_n-type, b basic and H = G, φ^G_p is the Jacquet–Langlands transfer of φ_p from D^× to GL_n with sign e(D^×) = (−1)^{n−1}.
- `igusaEndoscopicTestFunction.unramified_test`: At v ∉ S, φ^H_v is the Satake transfer η̃*(φ_v) of ET.4/unramified-transfers.
- `igusaEndoscopicTestFunction.no_relation`: If E^eff_p(J_b,G;H) is empty then φ^H_p has vanishing stable orbital integrals and ST^H_e(φ^H) = 0.
- `igusaEndoscopicTestFunction.not_naive`: For nonbasic b, transfer starts with a modulus-twisted function on J_b and passes through M_H with the constants of ET.5/transfer-at-p. Treating it as ordinary transfer directly from G misses these factors. If J_b=G and b is basic, ordinary transfer is the valid degenerate case.

Use this interface as follows.

- `Shin 2010 Theorem 7.2`: the stable Igusa trace formula is Σ ι(G,H) ST^H_e(φ^H)
- `Caraiani–Scholze non-compact Theorem 5.6.1`: φ^n⃗ is BC-matched with f^n⃗ to pass to the twisted trace formula
- `ET.7b/csnc-test-functions`: the explicit test-function package of the non-compact datum

**Acceptance.**

- For G = GL_n-type, b basic and H = G, φ^G_p is the Jacquet–Langlands transfer of φ_p from D^× to GL_n with sign e(D^×) = (−1)^{n−1}.
- At v ∉ S, φ^H_v is the Satake transfer η̃*(φ_v) of ET.4/unramified-transfers.
- If E^eff_p(J_b,G;H) is empty then φ^H_p has vanishing stable orbital integrals and ST^H_e(φ^H) = 0.
- For nonbasic b, transfer starts with a modulus-twisted function on J_b and passes through M_H with the constants of ET.5/transfer-at-p. Treating it as ordinary transfer directly from G misses these factors. If J_b=G and b is basic, ordinary transfer is the valid degenerate case.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.5/transfer-at-p`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/stabilization-away-from-p`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/archimedean-lefschetz-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/unramified-transfers`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/small-level-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/stabilization-away-from-p`.

The source statements fix the scope of this target.

[S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §7, p. 26. assembles h_H from the local functions at p, away from p and at ∞.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, Definition 5.2.2, pp. 732–733. defines φ^H := φ^{H,p} φ^H_p φ^H_∞ for acceptable φ and elliptic (H,s,η).

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.3, Definition 5.3.1, p. 68. defines φ^n⃗ for the non-compact datum with φ^n⃗_{S_pf} the Langlands–Shelstad transfer and φ^{n⃗,S} = η̃*(φ^S).

<a id="et-5-stable-igusa-trace-formula"></a>

### ET.5.12 Shin's stable trace formula for Igusa varieties

Let G come from an unramified integral PEL datum of type (A) or (C), b ∈ B(G_{ℚ_p}, −μ), Ig_b the Igusa variety and L_ξ the sheaf of an irreducible algebraic representation ξ. For every acceptable φ ∈ C_c^∞(G(𝔸_f^p) × J_b(ℚ_p)) written as a finite sum of product functions, with the local transfer extended linearly in the stable cocentre, tr(φ | ι_ℓ H_c(Ig_b, L_ξ)) = |ker^1(ℚ, G)| Σ_{(H,s,η) ∈ E^ell(G)} ι(G,H) ST^H_e(φ^H), with φ^H as in ET.5/igusa-endoscopic-test-function and ST^H_e, ι(G,H) as in ET.4/stable-elliptic-distribution. The formula holds for every PEL datum of type (A) or (C), in particular for the compact unitary data of Caraiani–Scholze 2017 §5.1 (any rank, any signature) and the quasi-split unitary datum of the non-compact sequel.

Assume the following conditions.

- unramified integral PEL datum of type (A) or (C) at p; K_p hyperspecial
- φ acceptable

The proof proceeds through these steps.

1. Start from the counting formula ET.5/igusa-counting-formula.
2. Stabilise away from p and ∞ (ET.5/stabilization-away-from-p) and at p (ET.5/transfer-at-p), then sum over κ and endoscopic triples with the global product formula of ET.0/global-kottwitz-obstruction (c) (Shin 2010 §7, Lemma 7.1).
3. Collect the Tamagawa numbers and |Out| into ι(G,H) with ET.4/tamagawa-number-formula and the ker^1 factor from Kottwitz's formula (Shin 2010 Theorem 7.2).

**Acceptance.**

- If G has no non-trivial elliptic endoscopy and b is basic, the formula reads tr(φ | H_c(Ig_b)) = |ker^1(ℚ,G)| ι(G,G) ST^G_e(φ^G).
- For φ = 0 both sides vanish.
- The numbering coincidence with Kottwitz 1990 Theorem 7.2 is accidental; the Igusa formula is the analogue of Kottwitz's stable formula for Shimura varieties (Remark 7.3).

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.5/igusa-counting-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/stabilization-away-from-p`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/transfer-at-p`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/igusa-endoscopic-test-function`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/stable-elliptic-distribution`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/elliptic-stabilization`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/tamagawa-number-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/global-kottwitz-obstruction`.

The source statements fix the scope of this target.

[S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), Theorem 1.1 (= Theorem 7.2), pp. 2 and 27; Remark 7.3. proves the stable trace formula for Igusa varieties for acceptable test functions.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, Theorem 5.2.3 and Remark 5.2.4, p. 734. restates it and notes that it holds for every PEL datum of type (A) or (C).

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.3, Theorem 5.3.2, p. 68. restates it for the non-compact sequel's quasi-split unitary datum.

<a id="et-5-acceptable-functions-determine"></a>

### ET.5.13 Acceptable functions determine virtual representations

If Π_1, Π_2 ∈ Groth(G(𝔸_f^p) × J_b(ℚ_p)) satisfy tr Π_1(φ) = tr Π_2(φ) for every acceptable φ, then Π_1 = Π_2. Consequently a linear identity between traces proved for acceptable φ_p (such as ET.5/stable-igusa-trace-formula composed with a spectral expansion) extends to every φ_p ∈ C_c^∞(J_b(ℚ_p)) once both sides are expressed as finite combinations of traces of irreducible representations.

Assume the following conditions.

- Π_1, Π_2 in the Grothendieck group of admissible representations

The proof proceeds through these steps.

1. At fixed compact-open level admissibility leaves finitely many eigenvalues of the invertible central action t on the invariant spaces. Group equal eigenvalues; do not claim their individual characters are all distinct.
2. Twist φ by powers t^z of the central element t = fr^s; for z ≫ 0 the twists are acceptable (ET.5/igusa-fixed-point-formula (c)), and tr π_i(φ^{(z)}) = χ_i(t)^(−z) tr π_i(φ).
3. The aggregate traces are a finite linear combination Σ_λ a_λ λ^(−z) with distinct nonzero λ. If it vanishes for all sufficiently large z, a Vandermonde system forces all a_λ=0, hence equality also at z=0 (Shin Lemma 6.4 p. 20).

**Acceptance.**

- If Π_1 and Π_2 differ by a representation on which t acts by a scalar, the twist argument detects it.
- The statement fails if 'acceptable' is replaced by a class not stable under central Frobenius twists.
- Trivial for Π_1 = Π_2.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.5/igusa-fixed-point-formula`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/admissible`.

The source statements fix the scope of this target.

[S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, Lemma 6.4 and proof, p. 19. proves that traces against acceptable functions determine elements of the Grothendieck group, by Frobenius twisting and linear independence.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.5, proof of Lemma 5.5.1, p. 743. uses the lemma to remove acceptability; the Frobenius element twisted is a central element of J_b(ℚ_p) acting on φ_p.

<a id="et-5-unitary-igusa-trace-formula"></a>

### ET.5.14 The stable Igusa formula for unitary similitude groups of every rank and signature

Let G be the unitary similitude group of Caraiani–Scholze 2017 §5.1 (rank N arbitrary, G_ℝ of arbitrary signature, quasi-split at all finite places, F^+ ≠ ℚ) or of the non-compact sequel §5.1 (G ≅ G_{2n} quasi-split, p split in F_0). Then E^ell(G) = E^ell(G_N) is represented by (G_N,1,id) and (G_{n_1,n_2}, s_{n_1,n_2}, η_{n_1,n_2}) with n_1 + n_2 = N, n_1 ≥ n_2 > 0, omitting (n_1,n_2) when n_1, n_2 and [F^+:ℚ] are all odd, and for acceptable φ = φ^S φ_{S_f∖p} φ_p, tr(φ | ι_ℓ [H_c(Ig^b, ℚ̄_ℓ)]) = |ker^1(ℚ,G)| Σ_{n⃗} ι(G, G_n⃗) ST^{G_n⃗}_e(φ^n⃗) with φ^n⃗ as in ET.5/igusa-endoscopic-test-function. Combined with ET.4/stable-twisted-identity this gives the twisted spectral expression of the Igusa trace used by ET.7b.

Assume the following conditions.

- the unitary data stated; [F^+:ℚ] ≥ 2 for the twisted step

The proof proceeds through these steps.

1. Specialise ET.5/stable-igusa-trace-formula with the endoscopic data of ET.0/unitary-elliptic-endoscopic-data (Caraiani–Scholze 2017 Corollary 5.2.5 and Remark 5.2.6; non-compact Theorem 5.3.2).
2. For the spectral expression, BC-match φ^n⃗ with f^n⃗ and apply ET.4/stable-twisted-identity (Caraiani–Scholze 2017 Theorem 5.3.2; non-compact Theorem 5.6.1).
3. The local algebraic σ-conjugacy and Igusa-geometry inputs formerly cited upward are missing from this tier. They must be planned in this roadmap before this proof is closed; see the review gap and handoff. Removing the illegal imports is not a proof of those inputs.

**Acceptance.**

- For N = 1 the formula is a statement about a zero-dimensional Igusa variety for a torus.
- For n_1 = n_2 the coefficient carries |Out| = 2.
- The excluded odd–odd–odd pairs contribute nothing.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.5/stable-igusa-trace-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/unitary-elliptic-endoscopic-data`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/stable-twisted-identity`.

The source statements fix the scope of this target.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, Corollary 5.2.5 and Remark 5.2.6, pp. 734–735; §5.3, Theorem 5.3.2, pp. 737–738. specialises Shin's formula to unitary groups of arbitrary signature and expresses it through twisted spectral sides.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.2, p. 67; §5.3, Theorem 5.3.2, p. 68; §5.6, Theorem 5.6.1, p. 75. gives the endoscopic data with Kottwitz's exclusion and the twisted spectral expression for the non-compact datum.

<a id="et-5-acceptance-examples"></a>

### ET.5.15 Worked checks for the Igusa counting and stabilisation

(1) For a basic GL₂ local factor J_b=D×, the trivial endoscopic transfer carries c=e_p(D×)=−1; this local example does not assert that every global Igusa variety with such a factor is zero-dimensional. (2) If J_b≅M_b, use c=μ₁(s₂)⟨κ_{Z(M_b)}(z),s₁⟩⁻¹ from Shin (8.11), p. 29; it need not be 1. (3) At two slopes, 1_{J_b(ℤ_p)} fails the support condition because the identity has equal valuations; the large negative Frobenius shift makes the test function acceptable. Failure of acceptability does not by itself prove failure of a particular naive fixed-point equality. (4) For unitary similitude data with all block sizes even, |ker¹(ℚ,G)|=1 (Shin Remark 3.2 p. 14).

Assume the following conditions.

- the data of the cited nodes

The proof proceeds through these steps.

1. Each check is a direct specialisation.

**Acceptance.**

- A wrong sign at p in (1), a missing constant in (2) or a naive Lefschetz formula in (3) would each be detected.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.5/stable-igusa-trace-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/transfer-at-p`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/igusa-fixed-point-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/tamagawa-number-formula`.

The source statements fix the scope of this target.

[S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §8.1–8.2, pp. 27–28. computes the constant c_{M_H} for general linear groups and when J_b ≅ M_b.

[S. W. Shin, Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf), Remark 3.2, p. 14. records when ker^1 is trivial for G_n⃗.

## Layer ET.6: Classical local Langlands and Jacquet–Langlands

This layer retains the independently corrected statements. Its primary proofs and supplier gaps are listed below; the independent verdict is needs_changes.

<a id="et-6-cuspidal-segment"></a>

### ET.6.1 Segments of cuspidal representations and their linking

Let F be a non-archimedean local field of characteristic 0 and ν = |det| the unramified character of every GL_d(F). Let C be the set of isomorphism classes of irreducible supercuspidal representations of the groups GL_d(F), d ≥ 1. A segment is a finite set Δ = [ρ, ν^{k−1}ρ] = {ρ, νρ, …, ν^{k−1}ρ} ⊂ C with ρ ∈ C and k ≥ 1; its length is k, its degree kd, its beginning ρ and its end ν^{k−1}ρ. In the real-endpoint convention of Atobe–Kondo–Yasuda, [a,b]_ρ with b − a ∈ ℤ_{≥0} denotes {ν^a ρ, …, ν^b ρ}, presentations differing by an unramified twist that fixes ρ being identified. Two segments Δ_1, Δ_2 are linked if Δ_1 ∪ Δ_2 is a segment and neither contains the other; if they are linked, Δ_1 precedes Δ_2 if the beginning of Δ_2 is ν^j times the beginning of Δ_1 with j > 0; they are juxtaposed if Δ_1 ∩ Δ_2 = ∅ and Δ_1 ∪ Δ_2 is a segment. A multisegment is a finite multiset of segments; its degree is the sum of the degrees.

Assume the following conditions.

- F of characteristic 0 (the definitions make sense in general; the layer uses characteristic 0)
- ρ supercuspidal (SmoothRepresentationsOfLocalGroups:SR.3a/cuspidal-representations)

The proof proceeds through these steps.

1. The definitions are Zelevinsky 1980 §3 (segments) and §4.1 (linked, precedes); the real-endpoint presentation is that of Atobe–Kondo–Yasuda §2.1, whose type-χ lines use integral endpoints.

Expose the following operations and relations.

- `Segment` (constructor): Segment.mk ρ k : the segment [ρ, ν^{k−1}ρ] for ρ supercuspidal and k ≥ 1.
- `Segment.length` (projection): The number k of cuspidals in the segment.
- `Segment.beginning` (projection): The cuspidal ρ at the start; Segment.ending is ν^{k−1}ρ.
- `Segment.Linked` (relation): Δ_1 ∪ Δ_2 is a segment and neither contains the other.
- `Segment.Precedes` (relation): Linked and beginning(Δ_2) = ν^j beginning(Δ_1) with j > 0.
- `Segment.twist` (functoriality): (χ ⊗ Δ) = {χρ, …} for a character χ; twisting preserves linking.
- `Multisegment` (constructor): Finite multisets of segments, with degree the sum of degrees.

**Checks.**

- `Segment.linked_example`: [1, ν] and [ν, ν²] on GL_1 are linked and [1,ν] precedes [ν,ν²].
- `Segment.length_one`: A segment of length 1 is linked to {νρ} and {ν^{-1}ρ} and to no other segment of length 1.
- `Segment.containment_not_linked`: [1, ν²] and [ν] are not linked although their union is a segment.
- `Segment.precedes_irrefl`: No segment precedes itself and precedence is asymmetric.

Use this interface as follows.

- `Zelevinsky 1980 Theorems 4.2, 6.1, 9.7`: classification and irreducibility criteria are phrased by linkedness
- `Scholze 2010 §3 (Lemma 3.1)`: the Langlands quotient ⊞π_0[(t+1)/2 − i] uses Bernstein–Zelevinsky precedence
- `ET.6/segment-wd-parameter`: each segment determines a Weil–Deligne block σ ⊗ Sp_k

**Acceptance.**

- [1, ν] and [ν, ν²] on GL_1 are linked and [1,ν] precedes [ν,ν²].
- A segment of length 1 is linked to {νρ} and {ν^{-1}ρ} and to no other segment of length 1.
- [1, ν²] and [ν] are not linked although their union is a segment.
- No segment precedes itself and precedence is asymmetric.

*Needs:* `SmoothRepresentationsOfLocalGroups:SR.3a/cuspidal-representations`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-character`, `SmoothRepresentationsOfLocalGroups:SR.3/unramified-characters`.

The source statements fix the scope of this target.

[A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), §3 (pp. 180–183) and §4.1 (p. 184). defines segments of cuspidal representations and the relations linked and precedes.

[H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33DB9D89FADFD4DA27852DE3C9C61DCD/S2050508622000178a.pdf/local-newforms-for-the-general-linear-groups-over-a-non-archimedean-local-field.pdf), §2.1 pp. 6–7. uses segments [a,b]_ρ with real endpoints and integral endpoints on type-χ lines, and the same linkedness and precedence.

<a id="et-6-segment-representations"></a>

### ET.6.2 Representations attached to segments: Zelevinsky, Steinberg and Speh representations

For a segment Δ = [ρ, ν^{k−1}ρ] with ρ a supercuspidal representation of GL_d(F), the normalised parabolic induction ρ × νρ × … × ν^{k−1}ρ of GL_{kd}(F) has a unique irreducible subrepresentation Z(Δ) = ⟨Δ⟩ and a unique irreducible quotient L(Δ). L(Δ) is essentially square-integrable, and every essentially square-integrable irreducible representation of GL_n(F) is L(Δ) for a unique segment (Bernstein). For ρ = χ a character of GL_1, Z([χ, ν^{k−1}χ]) is the character χν^{(k−1)/2}∘det and L([χ, ν^{k−1}χ]) is the twisted Steinberg representation St_k(χν^{(k−1)/2}). For an irreducible tempered π of GL_n(F) and m ≥ 1, the Speh representation Sp(π, m) is the unique irreducible subrepresentation of π ν^{−(m−1)/2} × … × π ν^{(m−1)/2}; for π = L(Δ) square-integrable and unitary it is Tadić's u(π, m), the unique irreducible quotient of ν^{(m−1)/2}π × … × ν^{−(m−1)/2}π.

Assume the following conditions.

- ρ supercuspidal; normalised parabolic induction of SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction

The proof proceeds through these steps.

1. Uniqueness of sub and quotient: Zelevinsky 1980 §3 and Proposition 2.10 (multiplicity-free support); the exactly-one-derivative property ⟨Δ⟩^{(d)} = ⟨Δ^−⟩ is Theorem 3.5.
2. Essential square-integrability of L(Δ) and the converse: Zelevinsky 1980 Theorem 9.3 (Bernstein), proved by Casselman's criterion on exponents (SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion).
3. Steinberg case: SmoothRepresentationsOfLocalGroups:SR.3/steinberg; Speh representations: Tadić 1986 Definition 7.4 and Atobe–Kondo–Yasuda Example 2.5(4).

Expose the following operations and relations.

- `Segment.zelevinskyRep` (constructor): Z(Δ), the unique irreducible subrepresentation of ρ × νρ × … × ν^{k−1}ρ.
- `Segment.langlandsRep` (constructor): L(Δ), the unique irreducible quotient of the same induced representation.
- `Segment.langlandsRep_essSqInt` (characterisation): L(Δ) is essentially square-integrable.
- `Segment.langlandsRep_surj` (characterisation): Every essentially square-integrable irreducible representation of GL_n(F) is L(Δ) for a unique Δ.
- `Segment.zelevinskyRep_derivative` (simp): For ρ on GL_d, the only positive nonzero derivative of Z(Δ) has order d, and equals Z(Δ^−). If k=1 this is the trivial representation of GL₀. The order is d, not the segment length k.
- `Segment.langlandsRep_twist` (functoriality): L(χ ⊗ Δ) ≅ (χ∘det) ⊗ L(Δ).
- `speh` (constructor): Sp(π, m) for π irreducible tempered.
- `speh_one` (simp): Sp(π, 1) = π.

**Checks.**

- `Segment.langlandsRep_steinberg`: L([ν^{-1/2}, ν^{1/2}]) is the Steinberg representation of SmoothRepresentationsOfLocalGroups:SR.3/steinberg.
- `Segment.zelevinskyRep_trivial`: Z([ν^{-1/2}, ν^{1/2}]) is the trivial representation of GL_2(F).
- `Segment.length_one_reps`: For k = 1 both representations are ρ.
- `Segment.zelevinsky_not_square_integrable`: Z(Δ) is not square-integrable for k ≥ 2 and d = 1: the trivial character of GL_2(F) has no square-integrable twist.

Use this interface as follows.

- `Scholze 2010 Theorem 10.2`: existence of rec for essentially square-integrable and generalized Speh representations is proved globally first
- `ET.6/segment-wd-parameter`: L(Δ) corresponds to the Weil–Deligne block rec(ρ) ⊗ Sp_k
- `ET.7a/speh-representation`: the global Speh datum is built from local Speh representations

**Acceptance.**

- L([ν^{-1/2}, ν^{1/2}]) is the Steinberg representation of SmoothRepresentationsOfLocalGroups:SR.3/steinberg.
- Z([ν^{-1/2}, ν^{1/2}]) is the trivial representation of GL_2(F).
- For k = 1 both representations are ρ.
- Z(Δ) is not square-integrable for k ≥ 2 and d = 1: the trivial character of GL_2(F) has no square-integrable twist.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/cuspidal-segment`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`, `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`, `SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion`, `SmoothRepresentationsOfLocalGroups:SR.3/steinberg`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`, `SmoothRepresentationsOfLocalGroups:SR.5/mirabolic-derivatives`.

The source statements fix the scope of this target.

[A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), §3, Theorem 3.5 (p. 182); §9, Theorem 9.3 (p. 198). constructs ⟨Δ⟩ as the unique irreducible submodule, computes its derivatives, and identifies the quasi-square-integrable representations with segment representations (Bernstein's theorem).

[M. Tadić, Classification of unitary representations in irreducible representations of general linear group (non-Archimedean case)](https://www.numdam.org/item/ASENS_1986_4_19_3_335_0.pdf), §7, Definition 7.4, p. 370. defines u(δ, n) as the unique irreducible quotient of the twisted product of n copies of δ.

[H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33DB9D89FADFD4DA27852DE3C9C61DCD/S2050508622000178a.pdf/local-newforms-for-the-general-linear-groups-over-a-non-archimedean-local-field.pdf), Example 2.5(4) and §8.2. defines the tempered Speh representation Sp(π, m) as a unique irreducible subrepresentation.

<a id="et-6-zelevinsky-classification"></a>

### ET.6.3 Zelevinsky and Langlands classifications of irreducible representations of GL_n

(a) If Δ_1, …, Δ_r are segments ordered so that Δ_i does not precede Δ_j for i < j, then Z(Δ_1) × … × Z(Δ_r) has a unique irreducible subrepresentation Z(m), depending only on the multisegment m = {Δ_1, …, Δ_r}, and L(Δ_1) × … × L(Δ_r) has a unique irreducible quotient L(m); m ↦ Z(m) and m ↦ L(m) are bijections from multisegments of degree n to irreducible representations of GL_n(F). (b) Z(Δ_1) × … × Z(Δ_r) is irreducible iff no two Δ_i are linked; the same for the L(Δ_i). (c) Every irreducible generic representation is L(Δ_1) × … × L(Δ_r) with pairwise unlinked segments, the multiset being unique; such products are generic. (d) Z(m)^∨ = Z(m^∨) with m^∨ the multisegment of contragredient segments; the highest derivative of Z(m) is Z(m^−), m^− obtained by truncating each segment at its end; Z(m_1 + … + m_p) occurs with multiplicity one in Z(m_1) × … × Z(m_p). (e) There is an involution m ↦ m^# (Zelevinsky's involution, computed by the Mœglin–Waldspurger algorithm) with L(m) = Z(m^#). (f) The cuspidal support of Z(m) and of L(m) is the multiset union of the segments; L(m) is the Langlands quotient of SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification with essentially square-integrable data L(Δ_i).

Assume the following conditions.

- F non-archimedean of characteristic 0
- representations irreducible and smooth (hence admissible)

The proof proceeds through these steps.

1. Zelevinsky Theorem 6.1 pp. 188–189 for (a), Theorem 4.2 p. 184 for (b), Theorem 9.7 p. 200 for (c), Theorem 7.10 p. 194 and Theorem 8.1 and Proposition 8.4 pp. 195–196 for (d). For (e), AKY §2.3 pp. 7–8 records the dual and references a later proof. Zelevinsky §9 pp. 199–203 does not prove the Mœglin–Waldspurger algorithm: a primary proof and explicit algorithm remain a gap.
2. Derivatives are the mirabolic functors of SmoothRepresentationsOfLocalGroups:SR.5/mirabolic-derivatives; Jacquet modules and the geometric lemma (SR.2/geometric-lemma) compute the composition factors.
3. Compatibility with the general Langlands classification: identify the tempered data with products of unitary L(Δ) and the exponents with the segment centres.

**Acceptance.**

- For n = 2 and ρ = 1: the multisegments of degree 2 supported on {ν^{-1/2}, ν^{1/2}} are {[ν^{-1/2},ν^{1/2}]} and {[ν^{-1/2}],[ν^{1/2}]}; Z gives the trivial and the Steinberg representation respectively (for the second, order the segments as [ν^{1/2}], [ν^{-1/2}] so that no segment precedes one listed after it), while L gives Steinberg and the trivial representation.
- (b) for two characters χ_1, χ_2 of GL_1: χ_1 × χ_2 is irreducible iff χ_1χ_2^{-1} ≠ ν^{±1}.
- The involution # exchanges trivial and Steinberg for GL_2.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/segment-representations`, `SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification`, `SmoothRepresentationsOfLocalGroups:SR.5/mirabolic-derivatives`, `SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma`, `SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-support`, `SmoothRepresentationsOfLocalGroups:SR.2/whittaker-functionals`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`.

The source statements fix the scope of this target.

[A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), Theorem 6.1 (pp. 188–189), Theorem 4.2 (p. 184), Theorem 7.10 (p. 194), Theorem 8.1 and Proposition 8.4 (pp. 195–196), Theorem 9.7 and §9 (pp. 199–203). Classifies irreducibles, gives linkedness, genericity, derivatives and multiplicity one; the later Mœglin–Waldspurger algorithm is not proved in this article..

[H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33DB9D89FADFD4DA27852DE3C9C61DCD/S2050508622000178a.pdf/local-newforms-for-the-general-linear-groups-over-a-non-archimedean-local-field.pdf), §2.1 pp. 6–7, §2.3 pp. 7–8 and Remark 2.6 p. 9. records the Zelevinsky and Langlands conventions Z(m), L(m) and L(m) = Z(m^#) used for newforms.

<a id="et-6-multisegment-operations"></a>

### ET.6.4 Truncation, the ram operation and ladder multisegments

For a segment Δ = [a, b]_ρ let Δ^− = [a, b − 1]_ρ (empty if a = b), and for a multisegment m let m^− = Σ_{Δ ∈ m} Δ^− (empty segments removed). On unipotent multisegments (ρ unramified characters of GL_1) define m^ram = ((m^#)^−)^#. A type-χ line is the set of unramified twists χν^j, j ∈ ℤ, of an unramified character χ, and a type-χ multisegment [x_1, y_1]_χ + … + [x_t, y_t]_χ is a ladder if x_1 > … > x_t and y_1 > … > y_t.

Assume the following conditions.

- χ unramified for ladders and for the ram operation

The proof proceeds through these steps.

1. The definitions are Atobe–Kondo–Yasuda §§2.3–2.4 and Example 2.5(2), §6.1; Zelevinsky's m^− is the multisegment of the highest derivative (Zelevinsky 1980 Theorem 8.1).

Expose the following operations and relations.

- `Segment.truncate` (constructor): Δ^− = [a, b−1]_ρ.
- `Multisegment.truncate` (constructor): m^− = Σ Δ^−.
- `Multisegment.ram` (constructor): m^ram = ((m^#)^−)^# on unipotent multisegments.
- `Multisegment.IsLadder` (constructor): Strictly decreasing beginnings and ends on a type-χ line.
- `Multisegment.truncate_degree` (simp): deg(m^−) = deg(m) − Σ_{Δ ∈ m} deg ρ_Δ.
- `Multisegment.highestDerivative` (compatibility): Z(m)^{(max)} = Z(m^−).

**Checks.**

- `Multisegment.truncate_singleton`: {[a,a]_ρ}^− is the empty multisegment.
- `Multisegment.IsLadder_example`: {[1,2]_χ, [0,1]_χ} is a ladder.
- `Multisegment.IsLadder_non`: {[0,2]_χ, [1,1]_χ} is not a ladder.
- `Multisegment.ram_steinberg`: If m^#={[0,1]_χ}, then Z(m)=L([0,1]_χ) is a twisted Steinberg representation and m^ram=({[0,0]_χ})^#. The Steinberg assertion concerns Z(m), not L(m).

Use this interface as follows.

- `Atobe–Kondo–Yasuda Lemma 2.9`: π^ram corresponds to the Weil–Deligne quotient V/(V^I ∩ ker N)
- `Atobe–Kondo–Yasuda §6`: ladder determinantal formulas and constituent criteria compute newform dimensions

**Acceptance.**

- {[a,a]_ρ}^− is the empty multisegment.
- {[1,2]_χ, [0,1]_χ} is a ladder.
- {[0,2]_χ, [1,1]_χ} is not a ladder.
- If m^#={[0,1]_χ}, then Z(m)=L([0,1]_χ) is a twisted Steinberg representation and m^ram=({[0,0]_χ})^#. The Steinberg assertion concerns Z(m), not L(m).

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/zelevinsky-classification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/cuspidal-segment`.

The source statements fix the scope of this target.

[H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33DB9D89FADFD4DA27852DE3C9C61DCD/S2050508622000178a.pdf/local-newforms-for-the-general-linear-groups-over-a-non-archimedean-local-field.pdf), §2.3 pp. 7–8, §2.4 pp. 9–11 and Example 2.5(2) pp. 8–9. defines right truncation, the ram operation on unipotent multisegments and ladder multisegments on a type-χ line.

[A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), Theorem 8.1, p. 195. identifies the highest derivative of Z(m) with Z(m^−).

<a id="et-6-ladder-and-constituent-theorems"></a>

### ET.6.5 Ladder determinantal formula and constituent criteria

(a) (Ladder formula, Lapid–Mínguez as used by Atobe–Kondo–Yasuda) For a type-χ ladder [x_1,y_1] + … + [x_t,y_t], in the Grothendieck group Z(m) = Σ_{w ∈ S_t} sgn(w) Z([x_{w(1)}, y_1]_χ) × … × Z([x_{w(t)}, y_t]_χ), empty segments giving the trivial representation of GL_0 and segments of negative length giving 0. (b) (Multiplicity one) Z(m_1 + m_2) occurs with multiplicity one in Z(m_1) × Z(m_2). (c) (Truncated constituent criterion, degree-one form) For type-χ multisegments, if Z(m) occurs in Z(m_1) × Z(m_2) then Z(m^−) occurs in Z(m_1^−) × Z(m_2^−) iff |m| = |m_1| + |m_2| (cardinalities). (d) (Weil–Deligne interpretation of ram) For π unipotent irreducible with Weil–Deligne parameter (V, N) under ET.6/full-wd-local-langlands (geometric Frobenius), π^ram = Z(m^ram) corresponds to the quotient V/(V^I ∩ ker N).

Assume the following conditions.

- type-χ (unramified, degree-one) multisegments in (a), (c), (d); general multisegments in (b)

The proof proceeds through these steps.

1. (a): Atobe–Kondo–Yasuda §6.1, proof of Proposition 6.1, citing Lapid–Mínguez.
2. (b): Zelevinsky 1980 Proposition 8.4 (and Atobe–Kondo–Yasuda Lemma 6.5).
3. (c): Atobe–Kondo–Yasuda Lemma 6.6 via highest derivatives (ET.6/zelevinsky-classification (d)); only the degree-one form is used, because the printed proof for general cuspidal degree needs degree-weighted cardinalities (recorded in gap 'Truncated constituent criterion beyond degree one').
4. For unipotent π use AKY Lemma 2.9 p. 12 and the full parameter including N. On an unramified special block, quotient by ker N shortens the segment at its end; transfer this operation through the Zelevinsky dual. The semisimple parameter alone cannot compute this quotient.

**Acceptance.**

- For t = 1 (a) is the identity Z([x,y]) = Z([x,y]).
- For m_1 = m_2 = {[0,0]_χ}, Z({[0,0],[0,0]}) occurs once in χ × χ.
- For the Steinberg representation V = Sp_2, V^I ∩ ker N is the line of the highest-weight vector and the quotient is one-dimensional.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/multisegment-operations`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/zelevinsky-classification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/segment-wd-parameter`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/full-wd-local-langlands`.

The source statements fix the scope of this target.

[H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33DB9D89FADFD4DA27852DE3C9C61DCD/S2050508622000178a.pdf/local-newforms-for-the-general-linear-groups-over-a-non-archimedean-local-field.pdf), Proposition 6.1 and determinant identity p. 28; Lemmas 6.5–6.6 pp. 33–34; §2.6 Lemma 2.9 p. 12. states the ladder determinantal formula, the multiplicity-one and truncated constituent lemmas, and the Weil–Deligne meaning of ram.

[A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), Proposition 8.4, p. 196. proves multiplicity one of Z(m_1 + … + m_p) in the product.

<a id="et-6-tadic-unitary-dual"></a>

### ET.6.6 Tadić's classification of the unitary dual and the generic unitary representations

Let D^u be the set of unitary square-integrable irreducible representations of the GL_m(F), m ≥ 1, and B = {u(δ, n), ν^α u(δ, n) × ν^{−α} u(δ, n) : δ ∈ D^u, n ≥ 1, 0 < α < ½}. (a) Every product of elements of B is irreducible and unitary. (b) Every irreducible unitary representation of GL_n(F) is such a product, uniquely up to order. (c) In particular every irreducible generic unitary representation is irreducibly induced from τ_1 ν^{α_1} ⊗ … ⊗ τ_d ν^{α_d} ⊗ τ_0 ⊗ τ_d ν^{−α_d} ⊗ … ⊗ τ_1 ν^{−α_1} with τ_i unitary generic tempered and ½ > α_1 > … > α_d > 0 (the complementary-series exponents lie in (0, ½)), and a conjugate self-dual generic unitary representation of GL_a over a quadratic extension has this form with τ_i^* in the second half.

Assume the following conditions.

- F non-archimedean of characteristic 0 (Tadić's Theorem A.10 is stated for characteristic 0)
- All complementary-series exponents α and α_i are real; products use normalized induction.

The proof proceeds through these steps.

1. Tadić 1986 Theorems 7.1, 7.3 and 7.5 (pp. 368–370) and Theorem A.10 (p. 378), using Bernstein's irreducibility of unitary parabolic induction and the Zelevinsky classification (ET.6/zelevinsky-classification).
2. (c): restrict to generic members, where by ET.6/zelevinsky-classification (c) only n = 1 occurs in u(δ, n); this is the form used in Jiang–Zhang 2020 Appendix B, (B.5)–(B.6).

**Acceptance.**

- For GL_1 the unitary dual is the unitary characters (n = 1, no complementary series).
- For GL_2, ν^α × ν^{−α} is unitary for 0 < α < ½ and not for α > ½ (except the endpoints giving one-dimensional and Steinberg constituents).
- The trivial representation of GL_2 is u(1, 2).

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/zelevinsky-classification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/segment-representations`, `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`.

The source statements fix the scope of this target.

[M. Tadić, Classification of unitary representations in irreducible representations of general linear group (non-Archimedean case)](https://www.numdam.org/item/ASENS_1986_4_19_3_335_0.pdf), Introduction Theorems A–D (p. 339); §7, Theorems 7.1, 7.3, 7.5 and Definition 7.4 (pp. 368–370); Theorem A.10 (p. 378). classifies the irreducible unitary representations of GL(n) over a non-archimedean field as products of Speh representations and complementary series with exponents in (0, ½).

<a id="et-6-segment-wd-parameter"></a>

### ET.6.7 Weil–Deligne parameters of segments and multisegments

Use the Weil–Deligne representations of ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation over ℂ (or ℚ̄_ℓ via a fixed isomorphism), with |·| : W_F → ℝ_{>0} sending geometric Frobenius to q^{−1}. Import the unnormalised special object ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object: for k ≥ 1, Sp_k = ⊕_{i=0}^{k−1} ℂ e_i with r(w)e_i = |w|^i e_i and N e_i = e_{i+1} (N e_{k−1} = 0); then r(w) N r(w)^{-1} = |w| N, N is a single Jordan block, and Sp_k is indecomposable and Frobenius-semisimple. For an irreducible representation σ of W_F, σ ⊗ Sp_k is indecomposable; every Frobenius-semisimple Weil–Deligne representation is uniquely a direct sum of such blocks (ArithmeticGaloisRepresentations:R01.2/frobenius-semisimple-special-block-classification). Given the normalized bijection σ_0=σ of ET.6/supercuspidal-bijection (not Scholze’s rec_un), which respects twists by ET.6/l-epsilon-of-pairs, from supercuspidals of GL_d(F) to irreducible d-dimensional representations of W_F, attach to a segment Δ = [ρ, ν^{k−1}ρ] the block WD(Δ) = σ_0(ρ) ⊗ Sp_k, and to a multisegment m the sum WD(m) = ⊕_{Δ∈m} WD(Δ). Then m ↦ WD(m) is a bijection from multisegments of degree n to n-dimensional Frobenius-semisimple Weil–Deligne representations, WD(m)^{ss} restricted to W_F is ⊕_{ρ ∈ supp(m)} σ_0(ρ) (with σ_0(ν^j ρ) = σ_0(ρ)|·|^j), and the monodromy operator of WD(m) is nilpotent with Jordan type consisting of d copies of a block of length k for each segment based on GL_d.

Assume the following conditions.

- The normalized supercuspidal bijection σ of ET.6/supercuspidal-bijection, with twisting compatibility proved in ET.6/l-epsilon-of-pairs; |Frob_geo|=q⁻¹. The unnormalised special object is imported from R01.2.

The proof proceeds through these steps.

1. Compute r(w)Ne_i = |w|^{i+1}e_{i+1} = |w| N r(w) e_i to get the covariance.
2. Indecomposability and the block decomposition are R01.2/frobenius-semisimple-special-block-classification and R01.2/unnormalised-special-object.
3. Bijectivity: blocks σ ⊗ Sp_k with σ irreducible correspond to segments [σ_0^{-1}(σ), …] of length k, and multisets of blocks to multisegments.

Expose the following operations and relations.

- `specialWD` (constructor): Imported API of ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object. Sp_k with r(w)e_i = |w|^i e_i and Ne_i = e_{i+1}.
- `specialWD_comm` (relation): Imported API of ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object. r(w) N r(w)^{-1} = |w| N on Sp_k.
- `specialWD_indecomposable` (characterisation): Imported API of ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object. σ ⊗ Sp_k is indecomposable for σ irreducible.
- `segmentWD` (constructor): WD(Δ) = σ_0(ρ) ⊗ Sp_k.
- `multisegmentWD` (constructor): WD(m) = ⊕_{Δ∈m} WD(Δ).
- `multisegmentWD_bijective` (equivalence): m ↦ WD(m) is a bijection onto n-dimensional Frobenius-semisimple Weil–Deligne representations.
- `multisegmentWD_ss` (simp): The Weil-group semisimplification of WD(m) is ⊕_{ρ∈supp m} σ_0(ρ).
- `multisegmentWD_twist` (functoriality): WD(χ ⊗ m) = WD(m) ⊗ rec_1(χ).

**Checks.**

- `specialWD_two`: Sp_2 has N of rank 1 and r(Frob) = diag(1, q^{-1}) for geometric Frobenius.
- `segmentWD_length_one`: WD({ρ}) = σ_0(ρ) with N = 0.
- `multisegmentWD_same_support`: {[1,ν]} and {[1],[ν]} have equal semisimplifications but WD differ (N ≠ 0 versus N = 0): a definition through semisimplified parameters alone is not injective.
- `specialWD_compat`: Sp_k is the special object of ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object.

Use this interface as follows.

- `ET.6/full-wd-local-langlands`: assembles rec_F from the supercuspidal bijection and the Langlands classification
- `Atobe–Kondo–Yasuda Lemma 2.9`: π^ram corresponds to V/(V^I ∩ ker N)
- `ET.6a/fs-normalization-contract`: the action dictionary needs the Weil–Deligne normalisation fixed here

**Acceptance.**

- Sp_2 has N of rank 1 and r(Frob) = diag(1, q^{-1}) for geometric Frobenius.
- WD({ρ}) = σ_0(ρ) with N = 0.
- {[1,ν]} and {[1],[ν]} have equal semisimplifications but WD differ (N ≠ 0 versus N = 0): a definition through semisimplified parameters alone is not injective.
- Sp_k is the special object of ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/cuspidal-segment`, `ArithmeticGaloisRepresentations:R01.2/weil-deligne-representation`, `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimple-special-block-classification`, `ArithmeticGaloisRepresentations:R01.2/unnormalised-special-object`, `ArithmeticGaloisRepresentations:R01.2/frobenius-semisimplification`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/supercuspidal-bijection`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/l-epsilon-of-pairs`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, footnotes 1–2, p. 2; Theorem 1.2(b), p. 3. works with the Weil-group (semisimple) part of the parameter, ignores the monodromy operator, and proves compatibility with parabolic induction, which determines the semisimplification of WD(m).

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.1, Remark 5.1.1, p. 65. defines the semisimple parameter of a Frobenius-semisimple Weil–Deligne representation by restriction along w ↦ (w, diag(|w|^{1/2}, |w|^{−1/2})).

[A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), §10, pp. 204–206. describes the conjectural reciprocity law as a bijection between irreducible representations and pairs (σ, N), with segments corresponding to indecomposable objects T(Δ).

<a id="et-6-llc-characterizing-properties"></a>

### ET.6.8 Functorial extensions of local class field theory and Henniart's characterization

A family π↦σ_F(π) of n-dimensional semisimple W_F-representations, for all finite F/ℚ_p and all n≥1, is a functorial extension of class field theory if it is natural under field isomorphisms and satisfies Scholze Theorem 12.1: (i) rank one is local reciprocity with geometric Frobenius; (ii) a subquotient of normalized induction has the direct sum of the inducing parameters; (iii) twisting by χ∘det tensors the parameter with σ_F(χ); (iv) prime-degree cyclic base change of a supercuspidal π restricts its parameter to W_E; (v) if σ_F(π) is unramified, π has an Iwahori-fixed vector. The existing ClassFieldTheory roadmap uses arithmetic reciprocity; define Art_geo(x)=Art_arith(x⁻¹) in W_F^ab, so (i) means σ_F(χ)=χ∘Art_geo⁻¹. Determinants and duals are later conclusions, not substitute axioms for (v). Henniart’s uniqueness characterization by factors of pairs is a separate target, requiring the factor comparison of ET.6/l-epsilon-of-pairs.

Assume the following conditions.

- F a finite extension of ℚ_p; Art_F normalised by geometric Frobenius

The proof proceeds through these steps.

1. Use exactly Theorem 12.1 and Definition 12.2, Scholze pp. 30–31. Condition (v) drives the finite base-change induction in Theorem 12.3. Transport the existing arithmetic reciprocity normalization by inversion in the abelian target; no inversion map on the nonabelian Weil group is asserted.
2. The additional uniqueness theorem uses equality of L and ε of supercuspidal pairs, as recalled in Scholze §1 p. 2; its primary proof remains to be supplied.

Expose the following operations and relations.

- `IsFunctorialExtensionCFT` (constructor): The conjunction of naturality under field isomorphisms and conditions (i)–(v) of Scholze Theorem 12.1, as stated above.
- `IsFunctorialExtensionCFT.degree_one` (simp): σ_F(χ) = χ ∘ Art_F^{-1} for n = 1.
- `IsFunctorialExtensionCFT.twist` (relation): σ_F(π ⊗ χ) = σ_F(π) ⊗ σ_F(χ).
- `IsFunctorialExtensionCFT.induction` (relation): σ_F is additive along parabolic induction.
- `IsFunctorialExtensionCFT.baseChange` (relation): For supercuspidal π and E/F cyclic of prime degree, σ_E(BC(π))=σ_F(π)|W_E.
- `henniart_uniqueness` (characterisation): At most one family of bijections on supercuspidals with (i)–(iv) and equality of L and ε of pairs.
- `IsFunctorialExtensionCFT.unramified_implies_iwahori` (relation): If σ_F(π) is unramified, π has a nonzero Iwahori-fixed vector.
- `IsFunctorialExtensionCFT.natural` (relation): Transport of π and σ along F≅F′ commutes with the family.

**Checks.**

- `IsFunctorialExtensionCFT.gl1`: For n = 1 the unique family is local class field theory with geometric Frobenius normalisation.
- `IsFunctorialExtensionCFT.arithmetic_frobenius`: Normalising Art_F by arithmetic Frobenius gives a family violating (i) as stated (it is the contragredient family).
- `IsFunctorialExtensionCFT.unramified`: On unramified principal series the family gives the sum of the unramified characters with the Satake parameters of SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter.
- `IsFunctorialExtensionCFT.steinberg_ss`: With the fixed normalized σ and geometric Frobenius, σ_F(St₂)=|·|^(−1/2)⊕|·|^(1/2), not 1⊕|·|. It is unramified and St₂ has Iwahori-fixed vectors.

Use this interface as follows.

- `Scholze 2010 Theorem 12.3`: any functorial extension of class field theory is bijective on supercuspidals
- `ET.6/full-wd-local-langlands`: the uniqueness of the correspondence
- `Atobe–Kondo–Yasuda Lemma 2.9; Caraiani–Scholze non-compact §5.1`: consumers rely on these normalisations

**Acceptance.**

- For n = 1 the unique family is local class field theory with geometric Frobenius normalisation.
- Normalising Art_F by arithmetic Frobenius gives a family violating (i) as stated (it is the contragredient family).
- On unramified principal series the family gives the sum of the unramified characters with the Satake parameters of SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter.
- With the fixed normalized σ and geometric Frobenius, σ_F(St₂)=|·|^(−1/2)⊕|·|^(1/2), not 1⊕|·|. It is unramified and St₂ has Iwahori-fixed vectors.

*Needs:* `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor`, `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/local-cyclic-base-change`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §12, Theorem 12.1 and Definition 12.2, pp. 30–31. lists the functorial properties of π ↦ σ(π) and defines a functorial extension of class field theory.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, p. 2. recalls Henniart's characterization of the correspondence by ε-factors of pairs.

<a id="et-6-drinfeld-level-deformation-spaces"></a>

### ET.6.9 Deformation spaces of one-dimensional ϖ-divisible O-modules with Drinfeld level structure

Let F/ℚ_p be finite with ring of integers O, uniformizer ϖ and residue field 𝔽_q, F_r the unramified extension of degree r with ring O_r, and ŎF the completion of the maximal unramified extension. A ϖ-divisible O-module over a scheme S on which p is locally nilpotent is a p-divisible group H with an O-action whose two induced actions on Lie H agree. For β ∈ GL_n(O_r) diag(ϖ, 1, …, 1) GL_n(O_r), let H_β be the one-dimensional ϖ-divisible O-module of height n over 𝔽_{q^r} determined by β (its Dieudonné module has σ-semilinear Frobenius F=βσ). (a) The formal deformation space R_β of H_β (as ϖ-divisible O-module) is formally smooth, isomorphic to O_r[[T_1, …, T_{n−1}]]. (b) For m ≥ 0 the covering R_{β,m} parametrising Drinfeld level-m structures (sections X_1, …, X_n of the universal deformation forming a full set of sections of its ϖ^m-torsion in Drinfeld's sense) is regular, finite over R_β and Galois with group GL_n(O/ϖ^m), étale in the generic fibre. (c) R_{β,m} algebraises: there is a separated flat scheme of finite type over O_r with smooth generic fibre and GL_n(O/ϖ^m)-action with a finite stable special-fibre subscheme Z such that its completion along Z is R_{β,m}. (d) The nearby-cycle cohomology H^0(R^iψ Spf R_{β,m}, ℚ̄_ℓ) is a finite-dimensional continuous representation of W_{F_r} × GL_n(O/ϖ^m), zero outside 0 ≤ i ≤ n−1.

Assume the following conditions.

- F of characteristic 0 (p-divisible groups do not exist in the equal-characteristic analogue with the same hypotheses)
- ℓ ≠ p
- H_β one-dimensional of height n

The proof proceeds through these steps.

1. (a),(b): Drinfeld's theory of level structures (Drinfeld 1974), as recalled in Scholze 2010 Definition 2.2 and Proposition 2.3; the deformation theory of p-divisible groups is that of FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2.
2. (c): Scholze 2010 Theorem 2.4, constructing ℛ_{β,m} from moduli of Drinfeld level structures.
3. (d): Scholze 2010 Theorem 2.5 (Berkovich's nearby cycles for formal schemes; ClassicalAdicEtaleCohomology:H1:formal-adic-comparison and LefschetzPencilsAndVanishingCycles:LPV.6), independence of ℓ by Mieda.

Expose the following operations and relations.

- `DeformationSpace` (constructor): R_β, the deformation ring of H_β as a ϖ-divisible O-module.
- `DeformationSpace.formallySmooth` (characterisation): R_β ≅ O_r[[T_1, …, T_{n−1}]].
- `DrinfeldLevelCover` (constructor): R_{β,m}, parametrising Drinfeld level-ϖ^m structures.
- `DrinfeldLevelCover.regular` (characterisation): R_{β,m} is a regular semilocal ring (it need not be local when the étale part is nontrivial).
- `DrinfeldLevelCover.galois` (structure): R_{β,m}/R_β is finite with GL_n(O/ϖ^m)-action, whose generic fibre is a Galois cover. This does not assert an étale cover in the special fibre.
- `DrinfeldLevelCover.transition` (functoriality): The transition maps R_{β,m} → R_{β,m+1} are finite flat and GL_n-equivariant.
- `DrinfeldLevelCover.algebraize` (other): An algebraic model of finite type over O_r with smooth generic fibre.
- `nearbyCycles_finite` (other): The nearby-cycle cohomology is finite-dimensional and vanishes outside degrees 0..n−1.

**Checks.**

- `DrinfeldLevelCover.height_one`: For n = 1, R_{β,m} is the ring of integers of the level-m Lubin–Tate extension over F_r.
- `DrinfeldLevelCover.level_zero`: R_{β,0} = R_β.
- `DrinfeldLevelCover.not_etale_special`: For n=1, q>2 and m=1, the Lubin–Tate torsion extension has ramification degree q−1>1; its integral cover is not étale. The blanket claim for all m≥1 would fail when q=2,m=1.
- `DeformationSpace.dimension`: R_β has Krull dimension n, i.e. relative dimension n − 1 over O_r, the dimension of the Lubin–Tate space.

Use this interface as follows.

- `Scholze 2010 Theorem 2.6`: the test function φ_{τ,h} is defined by traces on nearby cycles of R_{β,m}
- `ET.6a/lubin-tate-tower`: the Lubin–Tate tower's generic fibres are the rigid generic fibres of these spaces
- `Scholze 2010 Lemma 9.2`: completed local rings of the Shimura variety at Drinfeld level are these spaces

**Acceptance.**

- For n = 1, R_{β,m} is the ring of integers of the level-m Lubin–Tate extension over F_r.
- R_{β,0} = R_β.
- For n=1, q>2 and m=1, the Lubin–Tate torsion extension has ramification degree q−1>1; its integral cover is not étale. The blanket claim for all m≥1 would fail when q=2,m=1.
- R_β has Krull dimension n, i.e. relative dimension n − 1 over O_r, the dimension of the Lubin–Tate space.

*Needs:* `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.6`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §2, Definitions 2.1–2.2, Proposition 2.3, Theorems 2.4–2.5, pp. 6–8. defines ϖ-divisible O-modules, the deformation space R_β and its Drinfeld-level covers, proves their structure, algebraisation and the finiteness and vanishing range of nearby cycles.

<a id="et-6-scholze-test-functions"></a>

### ET.6.10 Scholze's test functions φ_{τ,h} and f_{τ,h}

Fix ℓ ≠ p, τ ∈ Frob^r I_F ⊂ W_F with r ≥ 1 (Frob geometric) and h ∈ C_c^∞(GL_n(O)) with values in ℚ, and set h^∨(g) = h(ᵗg^{-1}). Define φ_{τ,h} on GL_n(F_r) by φ_{τ,h}(β) = tr(τ × h^∨ | [Rψ_β]) for β ∈ GL_n(O_r) diag(ϖ,1,…,1) GL_n(O_r), where [Rψ_β] is the alternating sum of the nearby-cycle cohomology of R_{β,m} for m large enough that h is bi-invariant under 1 + ϖ^m M_n(O) (ET.6/drinfeld-level-deformation-spaces (d)), and φ_{τ,h}(β) = 0 for other β. Then φ_{τ,h} ∈ C_c^∞(GL_n(F_r)) takes values in ℚ and is independent of ℓ. Let f_{τ,h} ∈ C_c^∞(GL_n(F)) be a function with matching (twisted) orbital integrals: the orbital integrals of f_{τ,h} at regular elements equal the σ-twisted orbital integrals of φ_{τ,h} at elements with that norm, and vanish at non-norms (ET.4/local-cyclic-base-change; ET.6/norm-maps-and-base-change-identities). f_{τ,h} is not unique, but its orbital integrals and its traces on representations are well defined.

Assume the following conditions.

- F finite over ℚ_p; r ≥ 1 so that τ lies over a positive power of geometric Frobenius
- h ℚ-valued and conjugation-invariant enough that h^∨ acts

The proof proceeds through these steps.

1. Local constancy in β follows from the algebraisation and the finite group action (Scholze 2010 Theorem 2.4, Theorem 2.6 proof); compact support from the double-coset condition.
2. Rationality and independence of ℓ: Mieda's theorem (Scholze 2010 Theorem 2.6).
3. Existence of f_{τ,h}: the base change of functions for GL_n along the unramified extension F_r/F (Arthur–Clozel Ch. 1 §3, Proposition 3.1; ET.3/base-change-fundamental-lemma-and-transfer (c)).

Expose the following operations and relations.

- `scholzePhi` (constructor): φ_{τ,h}(β) = tr(τ × h^∨ | [Rψ_β]) on the double coset, 0 elsewhere.
- `scholzePhi_locallyConstant` (characterisation): φ_{τ,h} ∈ C_c^∞(GL_n(F_r)).
- `scholzePhi_rational` (other): φ_{τ,h} is ℚ-valued and independent of ℓ.
- `scholzeF` (constructor): f_{τ,h}, any function on GL_n(F) whose orbital integrals match the twisted orbital integrals of φ_{τ,h}.
- `scholzeF_trace_wellDefined` (characterisation): tr(f_{τ,h} | π) is independent of the choice of f_{τ,h}.
- `scholzePhi_linear_h` (simp): φ_{τ,h} is linear in h.
- `scholzePhi_support` (simp): φ_{τ,h} vanishes off GL_n(O_r) diag(ϖ,1,…,1) GL_n(O_r).

**Checks.**

- `scholzePhi_gl1`: For n = 1, tr(f_{τ,h} | χ) = χ(Art_F^{-1}(τ)) tr(h | χ): Theorem 1.2(a) for n = 1 is local class field theory.
- `scholzePhi_unramified`: At any fixed β and τ, φ_{τ,h₁+h₂}(β)=φ_{τ,h₁}(β)+φ_{τ,h₂}(β), and φ_{τ,0}=0. This tests the linear trace construction without importing an unread comparison with Kottwitz’s spherical function.
- `scholzePhi_off_coset`: φ_{τ,h}(1) = 0, since 1 is not in the double coset of diag(ϖ,1,…,1).
- `scholzeF_not_unique`: Two choices of f_{τ,h} may differ as functions; only their orbital integrals and traces are determined.

Use this interface as follows.

- `Scholze 2010 Theorem 1.2`: rec(π) is characterised by tr(f_{τ,h} | π) = tr(τ | rec(π)) tr(h | π)
- `Scholze 2010 Theorem 9.3`: φ_{τ,h} is the test function at p in the Langlands–Kottwitz point count at Drinfeld level
- `Scholze–Shin, Conjecture 7.1 and Theorem 8.1`: endoscopic transfers f^H_{τ,h} of φ_{τ,h} for general Shimura varieties (not planned here)

**Acceptance.**

- For n = 1, tr(f_{τ,h} | χ) = χ(Art_F^{-1}(τ)) tr(h | χ): Theorem 1.2(a) for n = 1 is local class field theory.
- At any fixed β and τ, φ_{τ,h₁+h₂}(β)=φ_{τ,h₁}(β)+φ_{τ,h₂}(β), and φ_{τ,0}=0. This tests the linear trace construction without importing an unread comparison with Kottwitz’s spherical function.
- φ_{τ,h}(1) = 0, since 1 is not in the double coset of diag(ϖ,1,…,1).
- Two choices of f_{τ,h} may differ as functions; only their orbital integrals and traces are determined.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/drinfeld-level-deformation-spaces`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-characters`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/base-change-fundamental-lemma-and-transfer`, `SmoothRepresentationsOfLocalGroups:SR.1/convolution-algebra`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1 Theorem 1.1 p. 3; §2 Theorems 2.6–2.7 pp. 8–9. defines φ_{τ,h} by the trace of τ × h^∨ on nearby cycles, proves it is locally constant, compactly supported, ℚ-valued and independent of ℓ, and defines f_{τ,h} by matching twisted orbital integrals.

<a id="et-6-norm-maps-and-base-change-identities"></a>

### ET.6.11 Norm maps for D-groups and base-change identities for the test functions

Let D be a semisimple algebra over ℚ_p with maximal order O_D. (a) There is a bijection β ↦ Nβ between (O_D ⊗ ℤ_{p^r})^×-σ_0-conjugacy classes in (O_D ⊗ ℤ_{p^r})^× and O_D^×-conjugacy classes in O_D^×, under which the characteristic polynomial of Nβ equals that of β β^{σ_0} ⋯ β^{σ_0^{r−1}}; for h on O_D^× conjugation-invariant, the function φ_h(β) = h(Nβ) on (O_D ⊗ ℤ_{p^r})^× has matching twisted orbital integrals with h, and ∫ φ_h = ∫ h (Scholze 2010 Proposition 4.2, Proposition 4.3, Corollary 4.5). (b) For the height-n infinitesimal one-dimensional ϖ-divisible O-module, let B_r be the basic elements in GL_n(O_r)diag(ϖ,1,…,1)GL_n(O_r), and let D_r be the elements of valuation r in the central division algebra of invariant 1/n, with valuation of a division uniformizer 1. There is a norm correspondence between σ-conjugacy classes in B_r and conjugacy classes in D_r, with the associated orbital and integral identities (Proposition 4.6, Proposition 4.7, Corollary 4.8). For D = M_n(ℚ_p) and h = 1_{GL_n(ℤ_p)} this is the usual base-change identity for the unit element.

Assume the following conditions.

- semisimple D over ℚ_p with maximal order; unramified extension of degree r

The proof proceeds through these steps.

1. Interpret σ_0-conjugacy classes as isomorphism classes of D-groups (étale p-divisible groups with O_D^op-action) over 𝔽_{p^r} and Nβ as the Frobenius over 𝔽_p (Scholze 2010 Definition 4.1, §4).
2. Matching of twisted orbital integrals: compare the counting of D-groups over 𝔽_{p^r} and over 𝔽_p (Proposition 4.3, Remark 4.4).
3. The integral identities follow from the Weyl integration formula (ET.4/padic-character-distributions, ET.4/twisted-characters).

**Acceptance.**

- For D = ℚ_p, N is the norm from ℤ_{p^r}^× to ℤ_p^×.
- For D = M_n(ℚ_p) and h = 1_{GL_n(ℤ_p)}, φ_h = 1_{GL_n(ℤ_{p^r})}, the unit base-change identity (ET.3/base-change-fundamental-lemma-and-transfer (a)).
- ∫ φ_h = ∫ h is the case of the identity term.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-characters`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/padic-character-distributions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/base-change-fundamental-lemma-and-transfer`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §4, Definition 4.1, Propositions 4.2–4.3, Remark 4.4, Corollary 4.5, Propositions 4.6–4.7, Corollary 4.8, pp. 11–13. constructs norm maps for D-groups and proves the matching of twisted orbital integrals and the integral identities.

<a id="et-6-test-function-descent"></a>

### ET.6.12 Geometric and harmonic descent for the test functions

(a) (Geometric descent) The connected components of Spf(R_{β,m} ⊗ Ŏ) are parametrised by surjective O-linear maps (O/ϖ^m)^n → H_β^{ét}[ϖ^m](k̄), with GL_n(O/ϖ^m) acting transitively; the nearby cycles of R_{β,m} decompose accordingly along the connected–étale filtration (Scholze 2010 Proposition 5.1). (b) (Harmonic descent) For π the normalised parabolic induction of π_1 ⊗ … ⊗ π_t (t ≥ 2) of a Levi GL_{n_1} × … × GL_{n_t}, the trace tr(f_{τ,h} | π) is computed from the traces of the functions f_{τ,h_i} of the smaller groups on π_i (Scholze 2010 Lemmas 6.1–6.3); hence, if Theorem 1.2 holds for all n′ < n, the character identity of ET.6/scholze-local-langlands (a) holds for π with σ(π) = σ(π_1) ⊕ … ⊕ σ(π_t) (Theorem 6.4). (c) (Reduction by types) If (o) Theorem 1.2(a),(b) hold for all n′ < n, (i) the identity holds for all properly induced π, and (ii) for every essentially square-integrable or generalised Speh π there is a ℚ-linear combination rec(π) of representations with non-negative coefficients, total dimension n, satisfying the trace identity, and (iii) for supercuspidal π this rec_un(π) is a ℤ-linear virtual representation, then Theorem 1.2(a),(b) hold for n; the proof uses the theory of types to find h with prescribed traces on tempered representations and Kazhdan's density theorem (Scholze 2010 Lemmas 3.1–3.2).

Assume the following conditions.

- induction on n
- F finite over ℚ_p

The proof proceeds through these steps.

1. (a): analyse the étale part of the universal deformation and Drinfeld structures (Scholze 2010 §5).
2. (b): compute the twisted trace of φ_{τ,h} on the base change of an induced representation by the Jacquet module along the parabolic, matching the connected–étale decomposition (Scholze 2010 §6; SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module, SR.2/geometric-lemma).
3. (c): Bernstein centre and types (SmoothRepresentationsOfLocalGroups:SR.3/bernstein-centre-blocks) with Kazhdan's density theorem (Scholze 2010 §3).
4. Condition (iii) is essential: positivity with rational coefficients alone does not make a genuine representation. ET.6/lubin-tate-comparison supplies integrality independently of the completed local correspondence.

**Acceptance.**

- For n = 1 there is no proper Levi and (b) is vacuous.
- For π = χ_1 × χ_2 an irreducible principal series of GL_2, (b) gives σ(π) = σ(χ_1) ⊕ σ(χ_2).
- Condition (ii) of (c) only asks for a ℚ-linear combination with non-negative coefficients, not yet a representation.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/scholze-test-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/norm-maps-and-base-change-identities`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/zelevinsky-classification`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`, `SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma`, `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-centre-blocks`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §3, Lemmas 3.1–3.2, pp. 9–10. reduces Theorem 1.2 to properly induced, essentially square-integrable and generalised Speh representations using types and Kazhdan's density theorem.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §5, Proposition 5.1, p. 13; §6, Lemmas 6.1–6.3 and Theorem 6.4, pp. 15–16. proves geometric and harmonic descent and the compatibility of the trace identity with parabolic induction.

<a id="et-6-comparison-of-two-functions"></a>

### ET.6.13 Comparison of the test functions with deformation spaces of (O, D′)-groups

For a semisimple D′ over ℚ_p with maximal order O_{D′}, an (O, D′)-group is a p-divisible group H with O_D^op = M_n(O)^op × O_{D′}^op-action decomposing as H_n × H′ with H_n of the type of ET.6/drinfeld-level-deformation-spaces and H′ étale. (a) The deformation space R_H of such an H is canonically R_β, and its level-m version R_{H,m} ≅ R_{β,m} × (H′[p^m])^× (Scholze 2010 Proposition 7.3); (b) Rψ_H ≅ Rψ_β ⊗ C_c^∞(O_{D′}^×) W_{F_r} × G_D(ℤ_p)-equivariantly (Corollary 7.4); (c) for any τ, h, h′ the function φ_{τ,h,h′} built from Rψ_H is associated with f^∨_{τ,h} ⊗ h′ (Lemma 7.5). This is the local input that lets the test function at p of the Shimura varieties of ET.6/division-algebra-shimura-varieties be expressed through φ_{τ,h}.

Assume the following conditions.

- D = M_n(F) × D′ as in Scholze 2010 §7; δ_0 σ_0-conjugate to ((β^{-1})^t, 1, β′) (Proposition 7.2)
- The displayed product for R_{H,m} is a fibre product over R_β after the étale torsion factor is canonically lifted. The associated function is on GL_n(F)×(D′)×, a tensor product; h×h′ is not an input to the GL_n construction.

The proof proceeds through these steps.

1. Scholze 2010 Definition 7.1, Propositions 7.2–7.3, Corollary 7.4, Lemma 7.5: decompose the Dieudonné module along the O_D-action and identify deformations of H with deformations of H_n.

**Acceptance.**

- For D′ = 0 the statement is ET.6/drinfeld-level-deformation-spaces itself.
- For H′ étale, deforming H′ is trivial, which is why only a factor (H′[p^m])^× appears.
- The comparison involves h^∨ and the transpose-inverse, so a version without ∨ fails.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/scholze-test-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/norm-maps-and-base-change-identities`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §7, Definition 7.1, Propositions 7.2–7.3, Corollary 7.4 and Lemma 7.5, pp. 17–18. compares deformation spaces of (O,D′)-groups with those of one-dimensional ϖ-divisible O-modules and shows the associated functions match.

<a id="et-6-division-algebra-shimura-varieties"></a>

### ET.6.14 Shimura varieties of the division-algebra unitary groups at Drinfeld level

With the data (F = F_0K, D, *, G) of ET.4/simple-division-algebra-trace-identity (Scholze 2010 Lemma 8.1), a prime p split in K and a place w of F above p with F_w ≅ the given p-adic field, G(ℚ_p) ≅ GL_n(F_w) × (D′)^× × ℚ_p^× with D′ the product of the other local factors. For K^p ⊂ G(𝔸_f^p) small and m ≥ 0, the PEL moduli problem of abelian varieties with D-action, polarization, prime-to-p level K^p and Drinfeld level-ϖ^m structure on the one-dimensional part of the p-divisible group is representable by a projective scheme Sh_{K^p,m} over O_{F_w}, flat, with smooth generic fibre equal to the canonical model of the Shimura variety of (G, h^{-1}) at level K^p × K_{p,m}, and its completed local rings at closed points are the spaces R_{β,m} (ET.6/drinfeld-level-deformation-spaces) times the étale part (Scholze 2010 Lemma 9.2); the cohomology H_ξ = Σ_i (−1)^i lim H^i(Sh ⊗ ℚ̄, L_ξ) carries commuting actions of G(𝔸_f) and Gal(F̄_w/F_w), and π_*Rψ F_{K^p,m} ≅ (π_*Rψ ℚ̄_ℓ) ⊗ F_{K^p,0} (Lemma 9.1).

Assume the following conditions.

- D a division algebra; signature (1, n−1) at one infinite place; p split in K; K^p small
- Use exactly the auxiliary field, signature and division-place conditions of ET.4/simple-division-algebra-trace-identity; w differs from x,xᶜ. The level-zero model is smooth. Drinfeld-level local factors and the coefficient comparison require the formal-geometric suppliers recorded as gaps.

The proof proceeds through these steps.

1. Representability and the generic fibre: PEL moduli of PELModuli:M2/representability, M4/canonical-model-identification, extended to Drinfeld level at w by the determinant condition (Scholze 2010 §8, citing Kottwitz and Harris–Taylor Lemma III.1.2).
2. Properness: D division (PELModuli:M2/properness-when-division).
3. Local structure: Serre–Tate and the comparison of ET.6/comparison-of-two-functions identify completed local rings with R_{β,m} (Scholze 2010 Lemmas 9.1–9.2).

Expose the following operations and relations.

- `DivisionAlgebraShimuraVariety` (constructor): Sh_{K^p,m} over O_{F_w}, representing the PEL problem at Drinfeld level ϖ^m.
- `DivisionAlgebraShimuraVariety.proper` (characterisation): Sh_{K^p,m} is projective over O_{F_w}.
- `DivisionAlgebraShimuraVariety.genericFibre` (compatibility): The generic fibre is the canonical model of Sh(G, h^{-1}) at level K^p K_{p,m}.
- `DivisionAlgebraShimuraVariety.completedLocalRing` (characterisation): Completed local rings are R_{β,m} times the étale part.
- `DivisionAlgebraShimuraVariety.cohomology` (data): H_ξ with G(𝔸_f) × Gal(F̄_w/F_w)-action.
- `DivisionAlgebraShimuraVariety.nearbyCycles_level` (relation): π_*Rψ F_{K^p,m} ≅ (π_*Rψ ℚ̄_ℓ) ⊗ F_{K^p,0}.

**Checks.**

- `DivisionAlgebraShimuraVariety.level_zero_smooth`: At m = 0 the integral model is smooth over O_{F_w}.
- `DivisionAlgebraShimuraVariety.dimension`: The relative dimension is n − 1.
- `DivisionAlgebraShimuraVariety.local_ring_n1`: For n = 1 the completed local rings are the Lubin–Tate rings of ET.6/drinfeld-level-deformation-spaces.
- `DivisionAlgebraShimuraVariety.split_not_proper`: Replacing D by a split algebra leaves the hypotheses of this construction. Division proves properness here; splitting alone does not prove every other unitary Shimura datum nonproper.

Use this interface as follows.

- `Scholze 2010 Theorem 9.3`: the Langlands–Kottwitz point count at Drinfeld level
- `Scholze 2010 §§10–11`: Galois representations and the comparison with the Lubin–Tate tower

**Acceptance.**

- At m = 0 the integral model is smooth over O_{F_w}.
- The relative dimension is n − 1.
- For n = 1 the completed local rings are the Lubin–Tate rings of ET.6/drinfeld-level-deformation-spaces.
- Replacing D by a split algebra leaves the hypotheses of this construction. Division proves properness here; splitting alone does not prove every other unitary Shimura datum nonproper.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/simple-division-algebra-trace-identity`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/drinfeld-level-deformation-spaces`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/comparison-of-two-functions`, `PELModuli:M2/representability`, `PELModuli:M2/properness-when-division`, `PELModuli:M4/canonical-model-identification`, `LefschetzPencilsAndVanishingCycles:LPV.6`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §8, Lemma 8.1 and Remarks 8.2–8.3, p. 19; §8, pp. 19–22. constructs the Shimura data and the integral models at Drinfeld level with the determinant condition.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §9, Lemmas 9.1–9.2, pp. 23–24. identifies nearby cycles at level m and completed local rings with the deformation spaces.

<a id="et-6-drinfeld-level-point-count"></a>

### ET.6.15 The Langlands–Kottwitz point count at Drinfeld level

With Sh_{K^p,m} and H_ξ as in ET.6/division-algebra-shimura-varieties, for τ ∈ Frob^j I_{F_w}, h ∈ C_c^∞(GL_n(O_{F_w})), h′ ∈ C_c^∞(O_{D′}^×) and f^p ∈ C_c^∞(G(𝔸_f^p)): tr(τ × h^∨ × h′ × e_{ℤ_p^×} × f^p | [H_ξ]) = Σ_{(γ_0;γ,δ)} c(γ_0;γ,δ) O_γ(f^p) TO_{δσ_0}(φ_{τ,h,h′} × e_{p^{−1}W(κ_r)^×}) tr(γ_0 | ξ), the sum over Kottwitz triples with vanishing Kottwitz invariant, and consequently n·tr(τ × h^∨ × h′ × e × f^p | [H_ξ]) = tr(f^∨_{τ,h} ⊗ h′ × e′ × f^p | [H_ξ]) (Scholze 2010 Theorem 9.3 and Corollary 9.4).

Assume the following conditions.

- τ over a positive power of geometric Frobenius
- the hypotheses of ET.6/division-algebra-shimura-varieties
- Write r′=[κ(F_w):𝔽_p] and r=j r′. Normalize e as the characteristic idempotent of ℤ_p× and e′ as the characteristic idempotent of p^(−j r′)ℤ_p×. The point-count coefficients c(γ₀;γ,δ) use the ordinary Shimura Kottwitz-triple weights, not the Igusa indexing set of Shin 2009. An explicit lower-tier supplier for those weights is still required.

The proof proceeds through these steps.

1. Apply the Fujiwara–Varshavsky trace formula (EtaleDualityAndPerverseSheaves:EDC.8/fujiwara-varshavsky-trace-formula) to the Frobenius-twisted Hecke correspondences on Sh_{K^p,m} ⊗ 𝔽̄ with coefficients π_*Rψ (Scholze 2010 §9; Varshavsky Theorem 2.3.2).
2. Compute local terms at fixed points through the completed local rings (ET.6/division-algebra-shimura-varieties) and ET.6/comparison-of-two-functions, giving twisted orbital integrals of φ_{τ,h,h′}.
3. Parametrise isogeny classes of points by Kottwitz triples using Honda–Tate theory (AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate) and Kottwitz's arguments for PEL varieties (Kottwitz 1992), which Scholze checks apply at Drinfeld level (Scholze 2010 p. 23).
4. Stabilisation is trivial for these groups (ET.4/simple-division-algebra-trace-identity), and the twisted orbital integrals become orbital integrals of f^∨_{τ,h} ⊗ h′ by ET.6/norm-maps-and-base-change-identities (Corollary 9.4).

**Acceptance.**

- For m = 0 and h = 1, φ_{τ,h} is Kottwitz's φ_j and the identity is Kottwitz's point count at good reduction.
- The normalising factor on the left side of Corollary 9.4 is Scholze's; a consumer takes it from there and does not set it to 1.
- Without the vanishing of the Kottwitz invariant, a triple contributes no points.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/division-algebra-shimura-varieties`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/comparison-of-two-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/norm-maps-and-base-change-identities`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/simple-division-algebra-trace-identity`, `EtaleDualityAndPerverseSheaves:EDC.8/fujiwara-varshavsky-trace-formula`, `AbelianSchemesAndArithmeticModuliPartII:F3/honda-tate`, `AbelianSchemesAndArithmeticModuliPartII:F0/tate-hom`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/global-kottwitz-obstruction`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §9 Theorem 9.3 and Corollary 9.4 p. 25; coefficient convention and applicability of Kottwitz’s arguments pp. 23–24. proves the Langlands–Kottwitz formula at Drinfeld level with test function φ_{τ,h,h′} at p, and rewrites it with f^∨_{τ,h} ⊗ h′.

<a id="et-6-global-galois-input"></a>

### ET.6.16 Galois representations in the cohomology of the division-algebra Shimura varieties

(a) For π_f occurring in ξ-cohomology, with multiplicity a(π_f), π_p=π_w⊗π_{w^p}⊗π_{p,0} and π_{p,0} unramified, Scholze Corollary 10.1 gives tr(f^∨_{τ,h}|π_w)=a(π_f)⁻¹ tr(τ|[W_ξ(π_f)]⊗χ_{π_{p,0}}) tr(h^∨|π_w). The unramified character χ evaluates the correctly normalized central p-power. The cohomological multiplicity is not silently replaced by 1. (b) Theorem 10.2 globalizes an unramified twist of every essentially square-integrable or generalized Speh π; its local component need not equal π before twisting. Corollary 10.3 produces rec_un(π), a ℚ-linear combination of W_F-representations with nonnegative coefficients and total dimension n satisfying the character identity. This is the early positive input to Lemma 3.2, before integrality and bijectivity.

Assume the following conditions.

- the hypotheses of ET.6/division-algebra-shimura-varieties
- Π conjugate self-dual, regular algebraic, square-integrable at x

The proof proceeds through these steps.

1. Combine the point-count identity and the simple trace formula; keep the contragredient, similitude twist and multiplicity a(π_f) (Corollary 10.1 p. 26).
2. Use a simple-trace-formula globalization with a pseudocoefficient, which gives the local representation only up to unramified twist (Theorem 10.2 p. 26).
3. Read Corollary 10.3 p. 27 with total dimension n. Theorem 10.6 is a later consequence of the completed character identity and is moved to ET.6/post-correspondence-global-galois.

**Acceptance.**

- For n = 1 the representation R(Π) is the Galois character of the algebraic Hecke character Π.
- For Π_x not square-integrable, (c) is not asserted here.
- The non-negative combination in (b) need not be an honest representation until Theorem 1.2 is proved.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/drinfeld-level-point-count`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/simple-division-algebra-trace-identity`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/pseudocoefficients`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/segment-representations`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §10 Corollary 10.1 and Theorem 10.2 p. 26; Corollary 10.3 p. 27. Corollary 10.1 keeps the multiplicity and duals; Theorem 10.2 globalizes up to an unramified twist, and Corollary 10.3 gives the early positive rational rec_un..

<a id="et-6-scholze-local-langlands"></a>

### ET.6.17 Scholze's characterization of the local Langlands correspondence

For each irreducible smooth π of GL_n(F), there is a unique n-dimensional semisimple W_F-representation rec_un(π) with tr(f_{τ,h}|π)=tr(τ|rec_un(π))tr(h|π), for τ over positive powers of geometric Frobenius and rational-valued h∈C_c^∞(GL_n(O)). Define σ(π)=rec_un(π)⊗|·|^((1−n)/2). For any irreducible subquotient of normalized induction, σ is the direct sum of the inducing σ-parameters. These are Scholze Theorem 1.2(a),(b), equivalently Theorem 2.7(a),(b). Bijectivity and factors are separate later targets ET.6/supercuspidal-bijection and ET.6/l-epsilon-of-pairs. The symbol rec_F in ET.6/full-wd-local-langlands denotes the normalized full Weil–Deligne parameter, not rec_un.

Assume the following conditions.

- F a finite extension of ℚ_p (characteristic 0)
- ℓ ≠ p and a fixed isomorphism ℚ̄_ℓ ≅ ℂ

The proof proceeds through these steps.

1. Induct on n using the complete reduction of Lemma 3.2: harmonic descent for induced representations, ET.6/global-galois-input for positive rational rec_un and ET.6/lubin-tate-comparison for integrality on supercuspidals.
2. Use Lemma 3.1 and density to extend the identity to all irreducibles; positive Frobenius traces determine the semisimple representation. This stage does not use the later bijectivity or pair-factor theorem.

**Acceptance.**

- For n = 1, rec(χ) = χ ∘ Art_F^{-1} (local class field theory).
- For the Steinberg representation of GL_2, σ(St) = 1 ⊕ |·| up to the twist convention, the semisimplification of Sp_2 (monodromy is invisible to (a)).
- rec is not injective on all irreducibles: π and its Zelevinsky dual have the same semisimple parameter (e.g. trivial and Steinberg of GL_2).

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/scholze-test-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/test-function-descent`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/global-galois-input`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/zelevinsky-classification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/lubin-tate-comparison`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, Theorem 1.2 (pp. 3–4) and Theorem 2.7 (p. 9). Character identity and normalized parabolic-induction compatibility only, parts (a),(b); parts (c),(d) are separately planned later..

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, footnotes 1–2, p. 2. notes that rec(π) is the Weil-group part of the Weil–Deligne parameter and that the monodromy operator is ignored.

<a id="et-6-lubin-tate-comparison"></a>

### ET.6.18 Relation to the Lubin–Tate tower

Let [Rψ] be the alternating sum of global sections of nearby cycles of the Lubin–Tate tower, a virtual representation of GL_n(O)×(D××W_F)^0, where the superscript 0 is the valuation-zero kernel; compactly induce in D××W_F to obtain [Rψ̃] on GL_n(O)×D××W_F. (a) Each R^iψ is an admissible smooth representation of GL_n(O), smooth for O_D^×, continuous for I_F, and vanishes outside 0 ≤ i ≤ n−1 (Scholze 2010 Theorem 11.1). (b) φ_{τ,h}(β) = tr(τ × d^{-1} × h^∨ | [Rψ]) for d the element of D^× attached to β (Proposition 11.2). (c) If ρ is an irreducible representation of D^× with π = JL(ρ) supercuspidal (ET.6/local-jacquet-langlands), then as virtual GL_n(O) × W_F-representations [Rψ̃](ρ^∨) = (−1)^{n−1} π^∨|_{GL_n(O)} ⊗ rec_un(π) (Corollary 11.3); consequently rec_un(π) of a supercuspidal π is a ℤ-linear combination of representations (Corollary 11.5, using newvectors). The statement is a virtual identity over GL_n(O); the full GL_n(F) × W_F-equivariant concentration in one degree is the separate two-tower realisation of ET.6a.

Assume the following conditions.

- π supercuspidal for (c); the Jacquet–Langlands correspondence of ET.6/local-jacquet-langlands
- The valuation-zero subgroup is {(d,τ):v_D(d)+v_W(τ)=0}; a division uniformizer and geometric Frobenius both have valuation 1.

The proof proceeds through these steps.

1. (a): Berkovich's comparison for formal schemes and Harris–Taylor Lemma II.2.8 (Scholze 2010 Theorem 11.1).
2. (b): compare the definition of φ_{τ,h} with the Lubin–Tate tower, which does not depend on β after base change to k̄ (Proposition 11.2).
3. Apply the early positive rational identity of ET.6/global-galois-input to supercuspidal π, use tempered cyclic base change and classical Jacquet–Langlands, and compare the division-algebra integral (Proposition 11.2, Corollary 11.3). This proof does not assume ET.6/scholze-local-langlands. Newvectors give a multiplicity-one GL_n(O)-type and hence integral coefficients (Corollary 11.5 p. 30); the required primary newvector supplier is a gap.

**Acceptance.**

- For n = 1, [Rψ] is the Lubin–Tate realisation of local class field theory.
- For n = 2 and ρ trivial on D^×, JL(ρ) is the Steinberg representation (not supercuspidal), so (c) does not apply.
- The sign (−1)^{n−1} is the Kottwitz sign of D^×.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/drinfeld-level-deformation-spaces`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/local-jacquet-langlands`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/global-galois-input`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/norm-maps-and-base-change-identities`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/local-cyclic-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-characters`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §11, Theorem 11.1, Proposition 11.2, Corollaries 11.3 and 11.5 and Remark 11.4, pp. 28–30. relates the test functions to the cohomology of the Lubin–Tate tower and realises rec(π) for supercuspidal π virtually over GL_n(O).

<a id="et-6-post-correspondence-global-galois"></a>

### ET.6.19 Global Galois representations after the character identity

For the division-algebra CM datum of ET.4/simple-division-algebra-trace-identity, let Π be cuspidal conjugate self-dual regular algebraic, with Π_x essentially square-integrable. After ET.6/scholze-local-langlands, Scholze Theorem 10.6 constructs an actual ℓ-adic representation R(Π) of dimension a n for some positive integer a, with [R(Π)|W_{F_v}]=a[rec_un(Π_v)] at every finite v∤ℓ, in the Grothendieck group. The equality is of semisimple Weil representations; no monodromy statement is made. Theorem 10.7 globalizes an unramified twist of each square-integrable π at w and a supercuspidal component at x. For regular L-algebraic Π, the further twist of Corollary 13.2 gives a system matching a·σ(Π_v), with a possibly greater than 1.

Assume the following conditions.

- Use every field, signature and division-place restriction of Scholze §8 and Theorem 10.5; w≠x,xᶜ.
- Theorem 10.6 applies after Theorem 1.2(a),(b), not as its positive-input proof.

The proof proceeds through these steps.

1. Descend Π to the unitary similitude cohomology by Theorem 10.5, retain the multiplier character ψ and use Corollary 10.1 after the local character identity is proved.
2. Apply Chebotarev and varying split auxiliary primes to compare all finite v∤ℓ (Theorem 10.6 pp. 27–28).
3. Theorem 10.7 p. 28 globalizes only up to unramified twist. Corollary 13.2 p. 33 adjusts algebraic normalization by a Hecke character.

**Acceptance.**

- The dimension is a n with a positive integral multiplicity; do not replace a by 1.
- Theorem 10.6 is used only after the local character identity.
- Local equality is semisimple at every finite v∤ℓ and says nothing about N.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/scholze-local-langlands`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/unitary-gl-base-change-descent`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/global-cyclic-base-change`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §10 Theorems 10.6–10.7 pp. 27–28; §13 Corollary 13.2 p. 33. later global Galois identity, with dimension a n and normalization.

<a id="et-6-supercuspidal-bijection"></a>

### ET.6.20 Bijectivity on supercuspidal representations

The normalized σ of ET.6/scholze-local-langlands satisfies naturality and all five conditions of Scholze Theorem 12.1, including unramified parameter ⇒ Iwahori-fixed vectors. Hence it is a functorial extension of class field theory (Definition 12.2). For any such extension, its restriction to supercuspidals is injective with image exactly the irreducible n-dimensional representations of W_F (Theorem 12.3).

Assume the following conditions.

- F finite over ℚ_p

The proof proceeds through these steps.

1. Rank one and induction are available from the construction. Twisting and supercuspidal prime-degree cyclic base change use the later global-Galois identity after the character identity has been proved. For the Iwahori condition reduce to supercuspidals of n≥2 and show σ(π)^I=0 using the basic Lubin–Tate trace and absence of O_D×-invariants (Scholze pp. 30–31).
2. Theorem 12.3 pp. 31–32 proves both directions constructively. Condition (v) supplies a finite chain of cyclic extensions; at the first nonsupercuspidal base change use the full Galois orbit from AC Lemma 6.10 and induction in rank. For existence start with an irreducible Weil representation, lift its first reducible restriction using AC Theorem 6.2, and descend the chain, correcting character twists. AC Proposition 6.7 supplies uniqueness. No numerical equality of bounded-conductor counts is invoked.

**Acceptance.**

- For n = 1 the statement is local class field theory.
- For n = 2 and p odd, dihedral supercuspidals correspond to induced representations Ind_{W_E}^{W_F} χ.
- σ(Steinberg) is reducible, consistent with Steinberg not being supercuspidal.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/scholze-local-langlands`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/lubin-tate-comparison`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/llc-characterizing-properties`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/local-cyclic-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-characters`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/post-correspondence-global-galois`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §12, Theorem 12.1, Definition 12.2 and Theorem 12.3 with proof, pp. 30–32. Five functorial properties, including the unramified-to-Iwahori implication, and constructive cyclic descent proving irreducibility, existence and uniqueness..

<a id="et-6-non-galois-automorphic-induction"></a>

### ET.6.21 Harris's non-Galois automorphic induction

A cuspidal Π on GL_n over a number field is potentially abelian when an n-dimensional representation Σ of the global Weil group is associated to Π at every finite and infinite place (Scholze Definition 13.1 p. 32); agreement at almost all places alone is weaker. Lemmas 13.3–13.4 p. 33 construct ℓ-adic realizations of algebraic Σ. For the CM datum, Π conjugate self-dual, regular L-algebraic and Π_x supercuspidal, Theorem 13.5(i) p. 34 upgrades association at infinity and almost all finite places to all finite places. Part (ii) descends potential abelianity along prime-degree cyclic F′/F when x has exactly one extension x′ and Π′_{x′} is supercuspidal. In Theorem 13.6 p. 34 let F₃⁰⊃F₂⁰⊃F₁⁰ be totally real of even degree over ℚ with F₃⁰/F₁⁰ solvable Galois, F_i=F_i⁰K for an imaginary quadratic K, and n=[F₂⁰:F₁⁰]. Choose x of F₁ split over F₁⁰ and inert in F₃. Require χ⁻¹=χ∘c, χ_τ(z)=z^{p_τ}z̄^{−p_τ} with distinct integral p_τ, and Stab_{Gal(F₃/F₁)}(χ_x∘Norm_{F₃/F₂})=Gal(F₃/F₂). Then there is a potentially abelian cuspidal induction on GL_n/F₁ associated at every place to Ind_{W_{F₂}}^{W_{F₁}}χ. An arbitrary algebraic χ without these hypotheses is not covered.

Assume the following conditions.

- CM fields with totally real subfields of even degree; solvable Galois closure

The proof proceeds through these steps.

1. Use the archimedean dictionary and ℓ-adic realizations of algebraic Hecke characters in Lemmas 13.3–13.4; these require explicit suppliers, recorded as gaps.
2. Theorem 13.5 uses Chebotarev and the post-correspondence Galois system, with the supercuspidal place choosing the extension uniquely.
3. Induct on the solvable tower using cyclic base change and induction. The stabilizer condition controls cuspidality at x, and the distinct archimedean weights ensure regularity (Theorem 13.6 pp. 34–35).

**Acceptance.**

- For n = 1 the induction is the Hecke character itself.
- For F^3_0 = F^2_0 Galois over F^1_0, the result reduces to cyclic or solvable automorphic induction.
- A non-algebraic Hecke character has no ℓ-adic realisation, so (a) needs regular L-algebraicity.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/global-cyclic-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/cyclic-automorphic-induction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/scholze-local-langlands`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/post-correspondence-global-galois`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/supercuspidal-bijection`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §13, Definition 13.1, Corollary 13.2, Lemmas 13.3–13.4, Theorems 13.5–13.6, pp. 32–35. repeats Harris's construction of cuspidal automorphic representations by non-Galois automorphic induction and proves compatibility with the local correspondence.

<a id="et-6-l-epsilon-of-pairs"></a>

### ET.6.22 Compatibility of the correspondence with L- and ε-factors of pairs

The correspondence π ↦ σ(π) on supercuspidal representations (extended additively to the Grothendieck group of W_F) has the following properties: (i) in degree 1 it is local class field theory; (ii) σ(π ⊗ χ) = σ(π) ⊗ σ(χ); (iii) σ(π^∨) = σ(π)^∨; (iv) det σ(π) = σ(ω_π); (v) for supercuspidal π_1, π_2, L(s, π_1 × π_2) = L(s, σ(π_1) ⊗ σ(π_2)) and ε(s, π_1 × π_2, ψ) = ε(s, σ(π_1) ⊗ σ(π_2), ψ), with the Jacquet–Piatetski-Shapiro–Shalika factors on the left (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor) and the Deligne–Langlands factors on the right (ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor). Consequently it is the correspondence characterised by Henniart, and part (iii) follows from (v) by comparing poles.

Assume the following conditions.

- π₁ and π₂ are supercuspidal. This node does not assert the extension to arbitrary irreducibles; ET.6/full-wd-local-langlands records the separate segment-pair and monodromy input.

The proof proceeds through these steps.

1. Globalise π_1, π_2 as local components of potentially abelian cuspidal representations Π_1, Π_2 over a CM field with all other ramified components controlled (Scholze 2010 Lemma 14.2, using ET.6/non-galois-automorphic-induction and automorphic induction of Hecke characters).
2. Compare the global functional equations of L(s, Π_1 × Π_2) (AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation) and of the Artin–Hecke L-function of Σ_1 ⊗ Σ_2, whose local factors agree at all other places by construction; twist by highly ramified characters (Henniart's method) to separate the remaining place (Scholze 2010 Theorem 14.1 and proof).

**Acceptance.**

- For n_1 = n_2 = 1 (v) is Tate's local functional equation (AutomorphicLFunctionsAndLocalFactors:AL.1/local-functional-equation).
- For π_2 the trivial character of GL_1, (v) gives the Godement–Jacquet factors of π_1 (AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-functional-equation).
- L(s, π × π^∨) has a pole at s = 0, matching the trivial constituent of σ(π) ⊗ σ(π)^∨.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/supercuspidal-bijection`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/non-galois-automorphic-induction`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation`, `ArithmeticGaloisRepresentations:R01.2/local-epsilon-factor`, `ArithmeticGaloisRepresentations:R01.2/local-euler-factor`, `AutomorphicLFunctionsAndLocalFactors:AL.1/local-functional-equation`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §14, Theorem 14.1 and Lemma 14.2, pp. 35–36. proves twisting, duality, determinant and L- and ε-factor compatibility by globalising with potentially abelian representations and comparing functional equations.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, p. 5. explains the use of Harris's non-Galois automorphic induction and Henniart's twisting with highly ramified characters.

<a id="et-6-full-wd-local-langlands"></a>

### ET.6.23 The local Langlands correspondence for GL_n with full Weil–Deligne parameters

Let F be a finite extension of ℚ_p. There is a unique family of bijections rec_F : Irr(GL_n(F)) → {n-dimensional Frobenius-semisimple Weil–Deligne representations of W_F}, n ≥ 1, such that: (a) on supercuspidals rec_F = σ (ET.6/supercuspidal-bijection), with N = 0; (b) for a segment Δ = [ρ, ν^{k−1}ρ], rec_F(L(Δ)) = rec_F(ρ) ⊗ Sp_k (ET.6/segment-wd-parameter); (c) for a multisegment m, rec_F(L(m)) = ⊕_{Δ∈m} rec_F(L(Δ)), L(m) the Langlands quotient (ET.6/zelevinsky-classification); then rec_F is bijective, compatible with twists, central characters (det), contragredients, and L- and ε-factors of pairs (defined on the Galois side through Weil–Deligne representations with monodromy), and conductors (ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation). (d) The restriction of rec_F(π) to W_F, semisimplified, is σ(π) of ET.6/scholze-local-langlands; equivalently the semisimple Langlands parameter of rec_F(π) (ET.6/semisimple-langlands-parameter) is the point of the Bernstein centre of π. (e) The Steinberg representation St_n = L([ν^{(1−n)/2}, ν^{(n−1)/2}]) corresponds to |·|^{(1−n)/2} ⊗ Sp_n; an unramified principal series corresponds to the sum of unramified characters with its Satake parameters (SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter); generic π correspond to Weil–Deligne representations with no two blocks linked. Equal-characteristic local fields are not covered.

Assume the following conditions.

- F of characteristic 0 (equal-characteristic F requires a separately checked construction)
- Art_F normalised by geometric Frobenius

The proof proceeds through these steps.

1. Define rec_F by (a)–(c); bijectivity from ET.6/segment-wd-parameter and ET.6/zelevinsky-classification (multisegments ↔ irreducibles ↔ Frobenius-semisimple Weil–Deligne representations).
2. Compatibility of the semisimplification with σ: ET.6/scholze-local-langlands (b) and the cuspidal support of L(m) (ET.6/zelevinsky-classification (f)).
3. The general pair-factor and conductor conclusions require an additional essentially-square-integrable segment-pair formula, with ker N and the monodromy correction, followed by multiplicativity across Langlands blocks. Multiplicativity over individual cuspidal support does not supply it: St₂ and the trivial representation have identical semisimple support but different ker N. ET.6/l-epsilon-of-pairs proves only the supercuspidal case. The missing primary proof and explicit supplier are recorded as a real gap, rather than claimed as a reduction already completed.
4. Uniqueness: Henniart's characterization on supercuspidals and the forced extension by (b)–(c).

**Acceptance.**

- rec_F(trivial of GL_2) = |·|^{-1/2} ⊕ |·|^{1/2} (N = 0) and rec_F(St_2) = |·|^{-1/2} ⊗ Sp_2 with N ≠ 0: the two differ only by N.
- For n = 1, rec_F is local class field theory.
- rec_F(π^∨) = rec_F(π)^∨ on a supercuspidal π of GL_2 with non-trivial central character.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/supercuspidal-bijection`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/segment-wd-parameter`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/zelevinsky-classification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/l-epsilon-of-pairs`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/scholze-local-langlands`, `ArithmeticGaloisRepresentations:R01.3/conductor-of-a-weil-deligne-representation`, `SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter`, `AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §1, Theorem 1.2 and footnotes 1–2, pp. 2–3. establishes the semisimple correspondence and its standard properties; the monodromy operator is left aside and is reconstructed here from segments.

[A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), §10, pp. 204–206. Formulates the reciprocity law with monodromy via segments; §10 is not a proof of the modern full pair-factor theorem..

[H. Atobe, S. Kondo and S. Yasuda, Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33DB9D89FADFD4DA27852DE3C9C61DCD/S2050508622000178a.pdf/local-newforms-for-the-general-linear-groups-over-a-non-archimedean-local-field.pdf), Lemma 2.9, §2.6. uses the full Weil–Deligne correspondence including N with geometric Frobenius.

<a id="et-6-inner-form-langlands-parameter"></a>

### ET.6.24 Inner-form parameter through the Langlands quotient Q

For π′ irreducible on GL_r(D), write it as the unique Langlands quotient of an ordered standard induction of essentially square-integrable δ′_i (Badulescu §2.1 p. 5). Let Q(π′) be the Langlands quotient of the split standard module with factors JL(δ′_i), with exactly the same real exponents (Badulescu §3.3 p. 15). Q is injective on irreducibles (Proposition 3.9 p. 16). Define rec_{G′}(π′)=rec_F(Q(π′)) and its semisimple parameter by restriction. For products of inner forms take direct sums. This is not an inverse of the Grothendieck-group map LJ: in the 2007 source LJ(Q(π′)) can contain lower terms, and equality is Conjecture 3.10. The split case is Q=id.

Assume the following conditions.

- Normalized standard induction; ordered essentially square-integrable Langlands data for GL_r(D).
- Use the same geometric-Frobenius convention as rec_F.

The proof proceeds through these steps.

1. Use uniqueness of inner-form Langlands data and the classical JL bijection on each factor, so the split Langlands quotient is independent of the permitted ordering.
2. Apply rec_F to Q and add parameters for a product Levi. Compatibility of semisimple parameters with standard induction follows from the direct-sum formula on the factors. No inverse of LJ on irreducibles is constructed.

Expose the following operations and relations.

- `innerFormLanglandsLift` (constructor): Q(π′) is the split Langlands quotient of JL-transferred square-integrable standard data.
- `innerFormLanglandsLift_independent` (relation): Permitted reorderings of Langlands data give isomorphic Q(π′).
- `innerFormLanglandsLift_split` (relation): For d=1, Q(π′)=π′.
- `innerFormWDParameter` (constructor): rec_F(Q(π′)); for product Levis use direct sums.
- `innerFormWDParameter_essSqInt` (relation): For square-integrable π′, this is rec_F(JL(π′)).

**Checks.**

- `innerFormLanglandsLift.quaternion`: For quaternion D, Q(1_{D×})=St₂, whereas LJ(1_{GL₂})=−1_{D×}; the negative virtual class is not the parameter construction.
- `innerFormLanglandsLift.split`: For d=1, each standard factor and its quotient are unchanged, so Q=id.
- `innerFormWDParameter.block_size`: For square-integrable δ′ on GL_s(D), rec_F(JL(δ′)) has dimension sd, not s; direct sums preserve the total dimension rd.

Use this interface as follows.

- `EndoscopicTransferAndUnitaryTraceComparison:ET.6`: Normalization and constructors used by the dependent targets identified in the review.

**Acceptance.**

- For quaternion D, Q(1_{D×})=St₂, whereas LJ(1_{GL₂})=−1_{D×}; the negative virtual class is not the parameter construction.
- For d=1, each standard factor and its quotient are unchanged, so Q=id.
- For square-integrable δ′ on GL_s(D), rec_F(JL(δ′)) has dimension sd, not s; direct sums preserve the total dimension rd.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/local-jacquet-langlands`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/full-wd-local-langlands`, `SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification`.

The source statements fix the scope of this target.

[A. I. Badulescu, Jacquet–Langlands et unitarisabilité](https://imag.umontpellier.fr/~ioan-badulescu/Files/jimj.pdf), §2.1 p. 5; §3.3 definition of Q p. 15 and Proposition 3.9 p. 16; Conjecture 3.10 p. 17. inner-form standard data and the irreducible split Langlands quotient Q.

<a id="et-6-semisimple-langlands-parameter"></a>

### ET.6.25 Semisimple Langlands parameters, also for inner forms of Levi subgroups

(a) The semisimple Langlands parameter of a Frobenius-semisimple Weil–Deligne representation, viewed as W_F × SL_2(ℂ) → GL_m(ℂ), is its restriction along w ↦ (w, diag(|w|^{1/2}, |w|^{−1/2})); for π irreducible of GL_m(F) set σ_π^{ss} = this restriction of rec_F(π). It is compatible with normalised parabolic induction and depends only on the cuspidal support: it is exactly a point of the Bernstein centre, and non-trivial extensions exist only between irreducibles with the same semisimple parameter. (b) For J an inner form of a Levi subgroup M of GL_m(F) (for instance J_{b_v}(F_v) of ET.5/jb-endoscopic-levi-data) and π an irreducible smooth representation of J, the semisimple L-parameter σ_π : W_F → GL_m(ℚ̄_ℓ) is defined through the irreducible Langlands-quotient map Q of ET.6/inner-form-langlands-parameter followed by (a).

Assume the following conditions.

- Frobenius-semisimple Weil–Deligne representations; inner forms of products of general linear groups

The proof proceeds through these steps.

1. (a): Caraiani–Scholze non-compact Remark 5.1.1, using ET.6/full-wd-local-langlands (d).
2. Use inner-form Langlands standard data, transfer its square-integrable factors by JL and take the split Langlands quotient Q (ET.6/inner-form-langlands-parameter). Apply rec_F and then restrict to the semisimple Weil representation. Badulescu’s additive LJ is not inverted.

Expose the following operations and relations.

- `semisimpleParameter` (constructor): σ^{ss} of a Frobenius-semisimple Weil–Deligne representation by restriction along w ↦ (w, diag(|w|^{1/2}, |w|^{−1/2})).
- `semisimpleParameter_induction` (relation): σ^{ss}(n-Ind(π_1 ⊗ π_2)) = σ^{ss}(π_1) ⊕ σ^{ss}(π_2).
- `semisimpleParameter_bernstein` (characterisation): σ^{ss}(π) depends only on the cuspidal support of π.
- `semisimpleParameter_ext` (relation): If Ext^1(π, π′) ≠ 0 then σ^{ss}(π) = σ^{ss}(π′).
- `innerFormSemisimpleParameter` (constructor): The semisimple Weil parameter of rec_F(Q(π′)), with Q constructed from JL-transferred square-integrable Langlands data. It is not obtained by inverting LJ.
- `innerFormSemisimpleParameter_split` (compatibility): For the split inner form it agrees with semisimpleParameter.

**Checks.**

- `semisimpleParameter_unramified`: For an unramified principal series with Satake parameters (α_i), σ^{ss} = ⊕ unramified characters with Frobenius eigenvalues α_i.
- `semisimpleParameter_steinberg_trivial`: σ^{ss}(St_2) = σ^{ss}(1_{GL_2}).
- `semisimpleParameter_not_injective`: σ^{ss} is not injective on irreducibles (trivial and Steinberg of GL_2 share it), so it cannot replace rec_F.
- `innerFormSemisimpleParameter_quaternion`: For D^× the quaternion units, σ_{1_{D^×}} = σ^{ss}(St_2).

Use this interface as follows.

- `Caraiani–Scholze non-compact Theorem 5.1.2`: the semisimple parameter of π_{j,v}|·|^{1/2−n} matches the Galois representation at p
- `Scholze–Shin §6 (stable Bernstein centre)`: semisimple parameters index the stable Bernstein centre
- `ET.7b/local-factorization`: virtual coefficients are separated by semisimple parameters

**Acceptance.**

- For an unramified principal series with Satake parameters (α_i), σ^{ss} = ⊕ unramified characters with Frobenius eigenvalues α_i.
- σ^{ss}(St_2) = σ^{ss}(1_{GL_2}).
- σ^{ss} is not injective on irreducibles (trivial and Steinberg of GL_2 share it), so it cannot replace rec_F.
- For D^× the quaternion units, σ_{1_{D^×}} = σ^{ss}(St_2).

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/full-wd-local-langlands`, `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-centre-blocks`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/inner-form-langlands-parameter`.

The source statements fix the scope of this target.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.1, Remark 5.1.1, p. 65. defines the semisimple Langlands parameter by restriction along w ↦ (w, diag(|w|^{1/2}, |w|^{−1/2})), notes its compatibility with parabolic induction and that it is a point of the Bernstein centre, and attaches it to representations of J_{b_v}(F_v) via Badulescu.

<a id="et-6-local-jacquet-langlands"></a>

### ET.6.26 The local Jacquet–Langlands correspondence for inner forms of GL_n

Let D be a central division algebra of dimension d² over F, n = rd and G′ = GL_r(D), an inner form of GL_n(F) with Kottwitz sign e(G′) = (−1)^{n−r} (ET.0/kottwitz-sign). Regular semisimple g′ ∈ G′ and g ∈ GL_n(F) correspond if they have the same characteristic polynomial. There is a unique bijection JL from essentially square-integrable irreducible representations of GL_r(D) to essentially square-integrable irreducible representations of GL_n(F) such that Θ_{JL(π′)}(g) = (−1)^{n−r} Θ_{π′}(g′) for all corresponding regular elliptic g, g′ (characters as functions, ET.4/padic-character-distributions). JL preserves central characters, commutes with twists by characters (det or reduced norm), and is compatible with contragredients. For r = 1, JL is a bijection from all irreducible representations of D^× to the essentially square-integrable representations of GL_n(F), and sends the trivial representation of D^× to the Steinberg representation; for n = 2 the sign is −1.

Assume the following conditions.

- F of characteristic 0 (Deligne–Kazhdan–Vignéras; Badulescu in positive characteristic, not used)

The proof proceeds through these steps.

1. Deligne–Kazhdan–Vignéras, via the simple trace formula comparison for GL_n and D^× and the transfer of functions of ET.3/inner-form-transfer; recorded at ET.3/inner-form-transfer (b) for tempered representations.
2. Extension to essentially square-integrable representations by twisting; characters as functions by ET.4/padic-character-distributions.
3. Badulescu §2 Theorem 2.1 pp. 3–4 records the general GL_r(D) correspondence; Scholze’s D× case alone does not supply all r. A complete primary proof of classical JL is still an imported-theory requirement.

**Acceptance.**

- For n = 2 and D quaternion, JL(1_{D^×}) = St_2 with Θ_{St}(g) = −1 = −Θ_1(g′) on elliptic regular elements.
- For d = 1 (D = F) JL is the identity.
- A principal series of GL_2 is not in the image of JL.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.3/inner-form-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/padic-character-distributions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/kottwitz-sign`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/segment-representations`.

The source statements fix the scope of this target.

[P. Scholze, The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1), §11, p. 29; §12, p. 31. uses the Jacquet–Langlands correspondence between D^× and essentially square-integrable representations of GL_n(F), characterised by the character equality with sign.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.4, Lemma 5.4.3 with proof, p. 741. uses the Jacquet–Langlands and Langlands–Jacquet maps of Badulescu for all inner forms.

[A. I. Badulescu, Jacquet–Langlands et unitarisabilité](https://imag.umontpellier.fr/~ioan-badulescu/Files/jimj.pdf), §2 Theorem 2.1 pp. 3–4. records classical Jacquet–Langlands on essentially square-integrable representations, with character sign.

<a id="et-6-badulescu-langlands-jacquet-map"></a>

### ET.6.27 Badulescu's Langlands–Jacquet map on Grothendieck groups

For G′=GL_r(D), n=rd, Badulescu defines a surjective additive map LJ_r:Groth(GL_n(F))→Groth(G′) by the standard-module basis. Every essentially square-integrable representation of GL_n(F) transfers uniquely by classical JL, and LJ_r(JL(δ′))=δ′. Characters satisfy Θ_{LJ_r(V)}(g′)=(−1)^(n−r)Θ_V(g) on all corresponding regular semisimple elements. The kernel is spanned by standard representations induced from Levis that do not transfer to G′. The family over all r commutes with normalized induction and Jacquet functors for corresponding Levis, as the Hopf-algebra quotient of Theorem 3.6. For a generic irreducible product of square-integrable factors, LJ is zero if the inducing Levi does not transfer; otherwise it is the irreducible product of their JL inverses (Proposition 3.3). In particular generic principal series vanish for d>1. LJ is an additive Grothendieck-group map, not a bijection of irreducibles or the map used to attach inner-form parameters. This 2007 source states the general signed-irreducibility assertion only as Conjecture 3.11; it is not imported as a theorem here.

Assume the following conditions.

- F of characteristic 0
- D a central division algebra; inner forms of products of general linear groups

The proof proceeds through these steps.

1. Use the Langlands standard-module bases of Badulescu §2.1–2.2 pp. 5–6. His additive injection JL_r of Theorem 3.1 pp. 9–10 extends classical JL; Proposition 3.2 p. 11 gives the quotient LJ_r and its all-regular-semisimple character identity.
2. The kernel description makes the map surjective. Across all ranks the quotient is compatible with product and coproduct (Theorem 3.6 pp. 13–15); each displayed Jacquet or induction identity must use corresponding Levis.
3. Apply Proposition 3.3 p. 11 for generic irreducibles. Generic principal series use a diagonal split Levi, which does not transfer when d>1. This is not a proof by elliptic characters alone.

Expose the following operations and relations.

- `langlandsJacquet` (constructor): LJ : Groth(GL_n(F)) → Groth(GL_r(D)).
- `langlandsJacquet_character` (characterisation): Θ_{LJ(π)}(g′) = (−1)^{n−r} Θ_π(g) on corresponding regular elements.
- `langlandsJacquet_essSqInt` (simp): LJ(JL(π′)) = π′ for π′ essentially square-integrable on GL_r(D).
- `langlandsJacquet_induction` (functoriality): LJ ∘ n-Ind = n-Ind ∘ LJ_M.
- `langlandsJacquet_jacquet` (functoriality): LJ_M ∘ r_P = r_{P′} ∘ LJ for corresponding parabolics.
- `langlandsJacquet_generic_ps` (relation): LJ kills irreducible generic principal series when D ≠ F.
- `langlandsJacquet_split` (simp): For D = F, LJ = id.
- `langlandsJacquet_surjective` (relation): Every virtual representation of GL_r(D) is LJ_r(V) for some virtual V.
- `langlandsJacquet_kernel` (relation): The kernel is spanned by standard modules with nontransferring inducing Levi.

**Checks.**

- `langlandsJacquet.gl2_steinberg`: For n = 2, LJ(St_2) = 1_{D^×}.
- `langlandsJacquet.gl2_trivial`: For n = 2, LJ(1_{GL_2}) = −1_{D^×}.
- `langlandsJacquet.principal_series`: LJ(χ_1 × χ_2) = 0 for an irreducible principal series; a map sending irreducibles to non-zero irreducibles would be wrong.
- `langlandsJacquet.split_test`: For d = 1 the map is the identity of Groth(GL_n(F)).

Use this interface as follows.

- `Caraiani–Scholze 2017 Remark 5.4.1`: step (3) of Red^b_n⃗ is LJ from M_b to J_b
- `ET.7b/newton-reduction`: the signed normalised Newton reduction uses LJ
- `IgusaVarietiesAndTorsionConcentration:IG.5`: the rational Igusa trace comparison and the genericity obstruction

**Acceptance.**

- For n = 2, LJ(St_2) = 1_{D^×}.
- For n = 2, LJ(1_{GL_2}) = −1_{D^×}.
- LJ(χ_1 × χ_2) = 0 for an irreducible principal series; a map sending irreducibles to non-zero irreducibles would be wrong.
- For d = 1 the map is the identity of Groth(GL_n(F)).

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/local-jacquet-langlands`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/zelevinsky-classification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/padic-character-distributions`, `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`, `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`.

The source statements fix the scope of this target.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.4, Remark 5.4.1 and Lemma 5.4.3 with proof, pp. 739–741. uses Badulescu's Langlands–Jacquet map in the definition of Red^b and proves that generic principal series map to 0 for non-quasi-split inner forms (citing Badulescu 2007 Theorem 3.1 and Proposition 3.3).

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.1, p. 65. uses Badulescu's results on the Jacquet–Langlands correspondence for all inner forms of general linear groups to attach semisimple parameters.

[A. I. Badulescu, Jacquet–Langlands et unitarisabilité](https://imag.umontpellier.fr/~ioan-badulescu/Files/jimj.pdf), §2.1–2.2 pp. 5–6; Theorem 3.1 pp. 9–10; Propositions 3.2–3.3 p. 11; Theorem 3.6 pp. 13–15; Conjecture 3.11 p. 17. standard bases, quotient and generic transfer; distinguishes the additive map from Q and from a conjecture.

<a id="et-6-inner-form-nontransfer"></a>

### ET.6.28 Generic principal series parameters do not transfer to non-split inner forms

Let J be a non-quasi-split inner form of a Levi M of GL_m(F) (for example J_{b_v}(F_v) when b_v has a non-integral slope), and λ = χ_1 ⊕ … ⊕ χ_m a semisimple parameter that is a sum of characters with χ_i χ_j^{-1} ≠ |·|^{±1} for i ≠ j (a generic principal series parameter). Then no irreducible smooth representation π of J has σ_π = λ (ET.6/semisimple-langlands-parameter), and LJ_M(π_M) = 0 for every irreducible π_M of M whose parameter is λ. Consequently, if a representation π_p^n⃗ of an endoscopic group of a unitary group transfers at a place p_i to a generic principal series of GL_n(F_{p_i}) while J_{b_i} is a non-quasi-split inner form of M_{b_i}, then Red^b_n⃗(π^n⃗_p) = 0 (Caraiani–Scholze 2017 Lemma 5.4.3).

Assume the following conditions.

- J not quasi-split
- λ generic in the stated sense

The proof proceeds through these steps.

1. Use Q and the inner-form Langlands data. If λ is a sum of characters with no distinct ratio |·| or |·|⁻¹, no monodromy chain of length at least 2 can join its characters. Thus every split square-integrable standard factor would have degree 1. A nonsplit GL_s(D) factor transfers square-integrable data of dimension sd with d>1, and such degree-one data cannot occur. This proves absence of λ for the nonsplit inner factor. Separately, Proposition 3.3 kills the generic principal series induced from the nontransferring split diagonal Levi. Vanishing under LJ alone does not prove parameter absence.
2. For Red^b: the L-morphism ^LM_{G_n⃗} → ^LM_b restricts η̃, so the image of π^n⃗_p in Groth(M_b(ℚ_p)) has only generic principal series components at p_i, which lie in the kernel of LJ (Caraiani–Scholze 2017 proof of Lemma 5.4.3).

**Acceptance.**

- For M = GL_2 and J = D^×: an irreducible principal series χ_1 × χ_2 with χ_1χ_2^{-1} ≠ |·|^{±1} has no Jacquet–Langlands partner.
- If J is quasi-split (J = M) the statement is false: the principal series itself has parameter λ.
- If χ_1χ_2^{-1} = |·|, the parameter is that of Steinberg/trivial and does transfer to D^×.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/badulescu-langlands-jacquet-map`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/semisimple-langlands-parameter`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/full-wd-local-langlands`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/inner-form-langlands-parameter`.

The source statements fix the scope of this target.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.4, Lemma 5.4.3 and proof, p. 741. proves that Red^b kills representations transferring to generic principal series when J_{b_i} is a non-quasi-split inner form.

[A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2), §5.1, proof of Corollary 5.1.3, p. 66. uses that generic principal series parameters (no ratio equal to the cyclotomic character) do not occur for non-trivial inner forms of Levi subgroups.

<a id="et-6-level-zero-explicit"></a>

### ET.6.29 Explicit local Langlands and Jacquet–Langlands in level zero

Use the specific setting of Newton–Thorne Lemma 3.6: n=2m, q≡−1 (mod p) for an odd auxiliary prime p distinct from the residue characteristic, D/F of degree n, and a character χ of order p of 𝔽_{q²}×. Inflate χ∘Norm_{𝔽_{qⁿ}/𝔽_{q²}} to a character σ of O_D×. If σ occurs in ρ|O_D× for an irreducible ρ of D×, the composite of classical JL and full LLC places JL(ρ) in the Bernstein component specified by the type τ_s (Newton–Thorne proof of Lemma 3.6 p. 18). This node does not give a general degree-n induced parameter for every depth-zero ρ: for example 1_{D×} transfers to St_n and has nonzero monodromy. The explicit Bushnell–Henniart rectifier formulas needed for a general level-zero theorem were not independently read and remain a gap.

Assume the following conditions.

- Exactly Newton–Thorne §3 Lemma 3.6 pp. 17–18, including its τ_s and congruence hypotheses. This is a specific Bernstein-component assertion, not the full depth-zero classification.

The proof proceeds through these steps.

1. Apply the explicitly cited composite LLC/JL calculation to this residue-field norm character, as in Newton–Thorne Lemma 3.6 p. 18. The underlying Bushnell–Henniart formula and its generalization must be checked from its primary source before closing the gap.

**Acceptance.**

- For n = 1 the statement is the tame part of local class field theory.
- The trivial representation of D^× corresponds to Steinberg, which is not of level-zero supercuspidal type: the formula is about supercuspidal level-zero representations of GL_n(F) and the non-trivial-character part of D^×.
- A character of D^× trivial on O_D^× corresponds to an unramified twist of Steinberg.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/full-wd-local-langlands`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/local-jacquet-langlands`.

The source statements fix the scope of this target.

[J. Newton and J. A. Thorne, Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/abs/2212.03595v2), §3 Lemma 3.6 and proof pp. 17–18, arXiv:2212.03595v2. uses that the composite of local Langlands and Jacquet–Langlands is explicit on level-zero representations of D^× and identifies the Bernstein component of π_{τ_s}.

<a id="et-6-acceptance-examples"></a>

### ET.6.30 Worked checks for the local correspondence and inner forms

(1) GL_1: rec_F = local class field theory with Art_F sending uniformizers to geometric Frobenius. (2) GL_2 unramified principal series χ_1 × χ_2 (χ_1χ_2^{-1} ≠ |·|^{±1}): rec_F = χ_1 ⊕ χ_2 with N = 0, and the Satake parameters match (SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter). (3) GL_2 Steinberg and trivial: rec_F(St_2) = |·|^{-1/2} ⊗ Sp_2 (N of rank 1) and rec_F(1) = |·|^{-1/2} ⊕ |·|^{1/2} (N = 0); Scholze's semisimple σ does not distinguish them. (4) Quaternion inner form: JL(1_{D^×}) = St_2 with character sign −1; LJ(1_{GL_2}) = −1_{D^×}; LJ kills irreducible principal series (ET.6/inner-form-nontransfer). (5) Tadić: for real α with α≠±1/2, the irreducible ν^α×ν^{−α} on GL₂ is unitary exactly when |α|<1/2; α=0 is the tempered endpoint and ±1/2 are reducibility points. (6) Segment linking: [1, ν] × [ν, ν²]-type products are reducible exactly when the segments are linked (Zelevinsky Theorem 4.2).

Assume the following conditions.

- the data of the cited nodes

The proof proceeds through these steps.

1. Each check specialises the named node.

**Acceptance.**

- A wrong Frobenius normalisation (1), a missing monodromy operator (3), a missing sign (4), or a wrong complementary-series range (5) is detected.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/full-wd-local-langlands`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/local-jacquet-langlands`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/inner-form-nontransfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/tadic-unitary-dual`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/zelevinsky-classification`.

The source statements fix the scope of this target.

[A. V. Zelevinsky, Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf), Theorem 4.2, p. 184. gives the irreducibility criterion used in check (6).

[M. Tadić, Classification of unitary representations in irreducible representations of general linear group (non-Archimedean case)](https://www.numdam.org/item/ASENS_1986_4_19_3_335_0.pdf), Theorem 7.5, p. 370. gives the complementary-series range used in check (5).

## Layer ET.6a: Classical towers and actual cohomological realization

<a id="et-6a-tower-conventions"></a>

### ET.6a.1 Tower datum and action conventions

Fix a finite extension E/Q_p, residue cardinality q, n≥1, the central division algebra D/E with
   invariant 1/n, and an algebraic closure Λ of Q_ell with ell≠p. Fix q^(1/2) in Λ. Write
   |w|=q^(−v(w)) for v(geometric Frobenius)=1, so Λ(1) has character |w|. Towers carry the Dat left
   GL_n(E)×D× action; cohomology uses inverse pullback to turn this into a left action. Regard the
   Weil group as an abstract acting group, with ell-adic continuity checked on inertia separately. A
   change to right moduli actions is a named conversion, not an identification of formulas.

The following assumptions are required.

- E has characteristic zero; Λ has characteristic zero; n≥1.

Construct the objects and prove the result through the following steps.

1. Import the local field, division algebra and reciprocity convention from ET.6.
2. Record the chosen frame and quasi-isogeny actions before applying inverse pullback.
3. Extend Tate twists to half-integers using the fixed square root of q; changing that root changes the
   unramified quadratic twist.

The definition exposes the following operations and relations.

- `TowerDatum.qHalf` (data): The specified square root of q and the characters |·|^a on W_E.
- `TowerDatum.leftCohomologyAction` (functoriality): A left moduli action induces a left cohomology action by inverse pullback.
- `TowerDatum.frobeniusConversion` (compatibility): Arithmetic and geometric Frobenius elements are mutual inverses; the corresponding unramified eigenvalues are reciprocal.
- `TowerDatum.ext` (extensionality): Equality requires equality of field, frame, reciprocity, coefficient and square-root choices.

**Checks.**

- `TowerDatum.tateFrob` (computation): Λ(1)(Frob_ar)=q and Λ(1)(Frob_geom)=q^(−1).
- `TowerDatum.rankOne` (degenerate): At n=1 the middle degree and half-Tate exponent are both zero.
- `TowerDatum.rootChange` (compatibility): Replacing q^(1/2) by −q^(1/2) multiplies an odd half-twist by the unramified quadratic character.

This interface is used as follows.

- Dat, Theorem 4.1.2: The exponent and the contragredient in a sector formula refer to these choices.
- FS, proof of IX.7.4: The unit/counit computation requires the two Weil factors to be dual.

**Acceptance.**

- Arithmetic Frobenius acts on Λ(1) by q; geometric Frobenius acts by q^(−1).
- Changing left/right actions also changes which contragredient an isotypic notation selects.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/llc-characterizing-properties`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/full-wd-local-langlands`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/local-jacquet-langlands`.

The source statements fix the scope of these targets.

- [Dat] §2.2.1, p. 12; §3.1.5 with footnote 6, p. 16; Fait 3.3.2, p. 22; §3.5, pp. 24–27: Dat
   normalizes |·| so that arithmetic Frobenius has value q and uniformizers correspond to geometric
   Frobenius; the linear group acts through transposed quasi-isogenies so that the final theorem
   carries no contragredient; on the Lubin–Tate side the linear group first acts on the right and is
   turned into a left action by inversion, and the diagonal centre acts trivially.
- [FS] IX.7.3–IX.7.4, p. 338: The target Hecke normalization includes a shift and a half Tate twist.

<a id="et-6a-lubin-tate-tower"></a>

### ET.6a.2 The formal O_E-module tower

Choose a one-dimensional formal O_E-module H of O_E-height n over the algebraic closure of the
   residue field. Use the formal O_E-module deformation construction with full Drinfeld levels of ET.6/drinfeld-level-deformation-spaces. The additional framed deformation functor at level m classifies (G,ρ,α_m), where G deforms H, ρ is
   an O_E-linear quasi-isogeny on the special fibre and α_m is a full Drinfeld level structure on
   G[varpi_E^m]. Its rigid generic fibres form the Lubin–Tate tower M_LT,m over brevé E. At level
   zero each quasi-isogeny-height component is an (n−1)-dimensional open ball. Higher generic-fibre
   levels are finite étale with the specified congruence deck group.

The following assumptions are required.

- Full Drinfeld level structure is imposed integrally, not an arbitrary basis over a nonreduced base.
- Fix H and a uniformizer varpi_E.

Construct the objects and prove the result through the following steps.

1. Request formal O_E-module deformation representability and Drinfeld full-level divisibility
   conditions from the lower finite-flat owner.
2. Represent each height component and pass to its rigid generic fibre.
3. Use the étaleness of varpi-power torsion in characteristic zero to construct the finite étale level
   maps.
4. Glue the components using quasi-isogenies; do not replace the infinite height union by the
   height-zero component.

The definition exposes the following operations and relations.

- `LubinTate.level` (constructor): Construct the space representing framed deformations with full level m.
- `LubinTate.forgetLevel` (functoriality): For m≥r, forget the extra level structure; compositions agree.
- `LubinTate.height` (projection): The quasi-isogeny height is a locally constant integer function.
- `LubinTate.levelTorsor` (characterisation): Over a fixed lower generic level, full lifts form the expected congruence torsor.
- `LubinTate.ext` (extensionality): An isomorphism respects the formal module, framing quasi-isogeny and every level vector.

**Checks.**

- `LubinTate.heightOne` (degenerate): For n=1 each level-zero component is zero-dimensional; the components still range over Z.
- `LubinTate.deckDegree` (computation): The degree from full level m to level zero is |GL_n(O_E/varpi_E^m)| on the generic fibre.
- `LubinTate.integralLevel` (non-example): On the generic fibre a linearly dependent O_E/varpi_E^m frame is not full. On the connected special fibre zero sections can be full when the Drinfeld Cartier-divisor condition holds; integral fullness cannot be defined by pointwise linear independence.

This interface is used as follows.

- SW13, §7.2: The universal-cover functor produces its dual Drinfeld moduli.
- Dat, §3.3: Finite levels supply the equivariant compact-support complex.

**Acceptance.**

- The level-zero ball has dimension n−1.
- The GL_n(E) action is on the tower of correspondences; a general element need not preserve an
   individual integral level.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/drinfeld-level-deformation-spaces`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/tower-conventions`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

The source statements fix the scope of these targets.

- [Dat] §3.2, pp. 18–21: The moduli, height components and group actions of the Lubin–Tate tower.
- [SW13] §6.5, Definitions 6.5.1 and 6.5.3; Theorems 6.5.2 and 6.5.4, pp. 66–68: The EL moduli and
   rational infinite-level functor apply to O_E-linear formal groups.

<a id="et-6a-drinfeld-tower"></a>

### ET.6a.3 The special O_D-module tower

The Drinfeld formal moduli functor classifies special formal O_D-modules of dimension n and
   O_E-height n², with a framing quasi-isogeny. Here special means the prescribed rank-one
   eigenspace condition for the maximal unramified subfield of D on Lie G. Its generic fibres with
   full O_D level form M_Dr,m. At the bottom level the period domain is Ω_E^(n−1)=P_E^(n−1) minus
   all E-rational hyperplanes, with the height components retained.

The following assumptions are required.

- Use the maximal order O_D and its uniformizer Π_D; distinguish Π_D-level from varpi_E-level.
- Specialness and the determinant condition are imposed on the formal moduli.

Construct the objects and prove the result through the following steps.

1. Use the lower formal-group deformation machinery with the specialness condition.
2. Represent the framing functor by the formal Drinfeld model, recording the source proof as a supplier
   requirement.
3. Construct level maps by forgetting O_D-torsion frames.
4. Identify the generic period domain and its rational hyperplane complement; this identification is
   not the definition of the moduli functor.

The definition exposes the following operations and relations.

- `Drinfeld.level` (constructor): Represent the special-module deformation functor with O_D-level m.
- `Drinfeld.forgetLevel` (functoriality): The integral and generic level maps compose.
- `Drinfeld.specialLie` (characterisation): Lie eigenspaces for the unramified subfield have the prescribed ranks.
- `Drinfeld.period` (projection): The period map lands in Ω_E^(n−1).
- `Drinfeld.ext` (extensionality): An isomorphism preserves the O_D action, framing and level structure.

**Checks.**

- `Drinfeld.rankTwo` (computation): At n=2 the formal module has dimension 2 and height 4, while the rigid moduli has dimension 1.
- `Drinfeld.rationalHyperplane` (non-example): An E-rational hyperplane point is excluded from Ω_E^(n−1).
- `Drinfeld.rankOne` (degenerate): For n=1 the period domain is a point and D=E.

This interface is used as follows.

- Dat, Corollary 3.4.2: The Drinfeld complex is compared with the LT complex.
- FS, IX.7.4: The return Hecke correspondence uses the Drinfeld tower.

**Acceptance.**

- For n=2 the period domain is P¹ minus P¹(E).
- GL_n(E) acts through the framing algebra and D× through level changes, exchanging the roles of the
   two groups in LT.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/tower-conventions`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

The source statements fix the scope of these targets.

- [Dat] §3.1, pp. 15–18: Special O_D-modules, period domain and level actions.
- [SW13] §7.3, pp. 71–73: The EL duality specializes to the two classical towers, with a convention
   warning on the linear group.

<a id="et-6a-period-morphisms"></a>

### ET.6a.4 Period maps and their equivariance

Construct the Grothendieck–Messing period map from the Dieudonné Lie quotient and the infinite-level
   Hodge–Tate period map from the framed Tate module. On LT the GM target is the flag variety for
   the frame and the HT target is the flag variety for E^n; the group acting trivially on each
   target is specified. On the dual Drinfeld datum these targets exchange. Period maps are maps of
   adic spaces or diamonds on their stated levels, and the GM map is étale on the classical generic
   fibre.

The following assumptions are required.

- Use the determinant condition, the chosen covariant/contravariant Dieudonné convention and fixed
   frames.
- For general E retain the O_E action rather than silently using the Q_p height as n.

Construct the objects and prove the result through the following steps.

1. Form the Lie quotient of the crystalline deformation and the Tate Hodge–Tate filtration.
2. Check functoriality under quasi-isogeny and level changes.
3. Use the universal-cover description to identify the exchanged quotients under duality.
4. Prove étaleness using Grothendieck–Messing deformation theory; local coordinates then have an
   invertible derivative.

The definition exposes the following operations and relations.

- `TowerPeriod.gm` (projection): Send a deformation to its Dieudonné Lie quotient.
- `TowerPeriod.ht` (projection): Send the infinite Tate frame to its Hodge–Tate filtration.
- `TowerPeriod.baseChange` (functoriality): Both maps commute with extension of the complete coefficient field.
- `TowerPeriod.dual` (compatibility): Duality exchanges the two period morphisms with the specified flag identifications.

**Checks.**

- `TowerPeriod.rankOne` (degenerate): Both targets are points at n=1.
- `TowerPeriod.level` (compatibility): Forgetting finite level leaves GM unchanged; a change of full Tate frame transforms HT by the linear-group action.
- `TowerPeriod.rankTwoEtale` (computation): On an LT one-dimensional GM chart, the derivative of the period coordinate is invertible.

This interface is used as follows.

- SW13, Proposition 7.2.2: They identify the two flags under EL duality.
- CDN20, Proposition 4.8; Pan, §5.3: Their differentials control infinitesimal operators and analytic
   vectors.

**Acceptance.**

- GM factors through level zero; HT requires the full infinite frame.
- The rational hyperplane complement in the Drinfeld case is tested separately from the LT GM image.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/lubin-tate-tower`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/drinfeld-tower`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`.

The source statements fix the scope of these targets.

- [SW13] §6.1, pp. 54–56 (Proposition 6.1.3, p. 55); §7.1, Proposition 7.1.1, p. 68; Proposition
   7.2.2, p. 70: The crystalline (Grothendieck–Messing) period map at level zero and its étaleness,
   the infinite-level Hodge–Tate period map with its equivariance (linear group acting,
   self-quasi-isogeny group trivial), and the exchange of the two flag varieties under duality.
- [Pan] §§5.2.2–5.2.4, pp. 55–57 (v1): Rank-two GM étaleness and the Hodge–Tate map.

<a id="et-6a-actions-and-weil-descent"></a>

### ET.6a.5 Commuting actions and effective Weil descent

The finite-level correspondences and the infinite-level towers carry commuting GL_n(E), D× and W_E
   actions compatible with level maps, period maps and base change. A Weil element moves the
   quasi-isogeny height by its valuation contribution. In Dat conventions the height-zero stabilizer
   is {(g,d,w): |det(g)Nrd(d)^(−1)|_E=|w|}; the full-height representation is induced from this
   stabilizer. The diagonal E× in GL_n(E)×D× acts trivially.

The following assumptions are required.

- Use the datum and action choices above.
- Weil descent includes the height translation, not just an action on coefficients.

Construct the objects and prove the result through the following steps.

1. Define the two algebraic-group actions on frames and framing quasi-isogenies.
2. Construct the Frobenius descent isomorphism from the special-fibre frame and check its cocycle.
3. Compute determinants and reduced norms on heights to obtain the stabilizer equation.
4. Verify the cocycles commute with level changes and induce the announced cohomology actions.

**Acceptance.**

- A uniformizer in only one group factor translates height; the diagonal central element does not.
- The height-zero component alone is not invariant under the full product group.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/lubin-tate-tower`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/drinfeld-tower`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/period-morphisms`.

The source statements fix the scope of these targets.

- [Dat] §3.5, especially (3.5.1), pp. 24–26: The central kernel and height stabilizer.
- [SW13] Proposition 6.5.5, p. 68: Continuity of the EL linear-group actions.

<a id="et-6a-infinite-level-moduli"></a>

### ET.6a.6 The universal-cover moduli at infinite level

For an EL datum (B,V,H,μ), define M_∞ on complete Huber pairs over brevé E by triples (G,ρ,α), with
   α an integral full Tate frame on geometric points, equivalently the rational frame after allowing
   quasi-isogenies. In the universal-cover description an element is a B-linear map s:V→H̃_η whose
   quasi-logarithm has a locally free quotient W of the prescribed rank and such that 0→V→H̃_η→W→0
   is exact on every geometric point. The determinant condition fixes the μ-type of W.

The following assumptions are required.

- Use a basic EL datum for tower duality; the moduli description itself has the hypotheses of SW13
   6.5.4.
- Integral and rational functors are distinguished.

Construct the objects and prove the result through the following steps.

1. Import universal covers and Tate modules from the finite-flat supplier.
2. Translate a frame to the B-linear universal-cover map and its Lie quotient.
3. Use local p-divisible classification to reconstruct G from the map and prove full faithfulness.
4. Prove the geometric-point exactness condition is preserved under base change; it cannot be omitted
   in favor of the rank condition alone.

The definition exposes the following operations and relations.

- `TowerInfinity.ofTriple` (constructor): A deformation, quasi-isogeny and full Tate frame give a point.
- `TowerInfinity.toCoverMap` (projection): Project to the B-linear universal-cover map s.
- `TowerInfinity.pointCriterion` (characterisation): Rank, determinant type and the geometric exact sequence characterize the rational points.
- `TowerInfinity.changeLattice` (equivalence): Rational-frame moduli do not depend on the integral lattice.
- `TowerInfinity.baseChange` (functoriality): The triple and universal-cover descriptions commute with Huber-pair base change.

**Checks.**

- `TowerInfinity.missingExactness` (non-example): A map whose quasi-logarithm has the right rank but whose geometric kernel is larger than V fails the moduli criterion.
- `TowerInfinity.levelRecovery` (compatibility): Reduction of the integral frame modulo varpi_E^m gives the full finite level m.
- `TowerInfinity.lattice` (compatibility): Replacing the lattice by varpi_E times it changes integral framing but leaves the rational functor isomorphic.

This interface is used as follows.

- SW13, Theorem 7.2.3: The pairing formula defines the dual infinite-level point.
- SW20, Theorem 24.2.5: It identifies the tower with a minuscule modification functor.

**Acceptance.**

- The construction is independent of the lattice for the rational-frame functor.
- The integral frame recovers the specified finite congruence levels.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/lubin-tate-tower`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/drinfeld-tower`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/universal-cover`.

The source statements fix the scope of these targets.

- [SW13] Theorem 6.3.4 and the description following it, pp. 59–61; Theorem 6.5.4, pp. 67–68: The
   infinite-level moduli description with exactness and quotient conditions.

<a id="et-6a-perfectoid-limit"></a>

### ET.6a.7 Preperfectoidness and completed tower limits

The infinite-level EL moduli is preperfectoid and is a tilde-limit of the finite generic levels.
   After base change to an algebraically closed complete extension C and the specified strong
   completion, the resulting infinite-level space is perfectoid. The tilde-limit assertion gives the
   topological inverse limit and dense colimit of affinoid rings, not an equality of uncompleted
   rings.

The following assumptions are required.

- Use the precise completion and Huber-pair topology of SW13.
- Tilde-limit is the imported perfectoid-tower notion.

Construct the objects and prove the result through the following steps.

1. Use the universal-cover embedding into a perfectoid ambient space.
2. Impose the rank and exactness conditions by the local chart analysis of SW13 6.3.
3. Identify finite-level frame quotients and the completed affinoid colimit.
4. Base change and complete before applying the perfectoid conclusion.

**Acceptance.**

- A level-zero open ball is not itself asserted perfectoid.
- A rank-one determinant tower agrees with the height-one cyclotomic model after completion.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/infinite-level-moduli`, `PerfectoidSpaces:P5`.

The source statements fix the scope of these targets.

- [SW13] Theorem 6.3.4, pp. 59–61; Theorems 6.5.4 and 6.4.1, pp. 64–68: The general preperfectoid
   limit and the determinant calculation.

<a id="et-6a-el-duality"></a>

### ET.6a.8 Infinite-level EL duality

For a basic EL datum set B̌=End_B^0(H), take the dual datum described by SW13 §7.2, and identify the
   two linear groups in the exchanged order. There is a G(E)×J(E)-equivariant isomorphism M_∞≅M̌_∞.
   Its universal-cover formula is š(f)(v)=f(s(v)). Under the identified flag varieties the GM
   period of one side is the HT period of the other. For the LT datum its dual is the Drinfeld
   datum. Standard Drinfeld linear-group conventions may require inverse transpose; this
   automorphism is recorded explicitly.

The following assumptions are required.

- The EL datum is basic, so the full endomorphism algebra has the needed centralizer property.
- The statement is at infinite level; equal numbered finite levels are not asserted isomorphic.

Construct the objects and prove the result through the following steps.

1. Compute the dual EL weights using Hom(V_0,V) and Hom(V_1,V).
2. Apply the pairing formula to the universal-cover map.
3. Use the exactness condition to identify the dual quotient and construct the inverse.
4. Check both period maps and group actions on the universal-cover formula.

**Acceptance.**

- Applying duality twice gives the canonical original datum.
- GM and HT exchange rather than each being individually fixed.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/infinite-level-moduli`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/period-morphisms`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/perfectoid-limit`.

The source statements fix the scope of these targets.

- [SW13] Proposition 7.2.2 and Theorem 7.2.3, pp. 70–71; §7.3, pp. 71–73 (the inverse-transpose remark
   on the linear-group action is in the proof of Theorem 7.3.1, p. 71): The basic EL duality and the
   classical specialization.

<a id="et-6a-tower-compact-support"></a>

### ET.6a.9 The equivariant compact-support complex

For T=LT or Dr, define C_T,Λ by the derived smooth level colimit of RΓ_c(M_T,K×brevé E C,Λ).
   Integral coefficients mean first taking the derived inverse limit over Λ/ell^r at a fixed finite
   level and then the smooth level colimit. Trace maps, pullback maps and the action conventions are
   retained in the derived category of smooth GL_n(E)×D× representations with commuting W_E action.
   Compact supports are the finite-level proper-support construction, not ordinary global sections
   of the infinite union.

The following assumptions are required.

- Use finite levels locally of finite type and the smooth representation category.
- Do not commute the coefficient inverse limit and level colimit without a separate theorem.

Construct the objects and prove the result through the following steps.

1. Import analytic compact-support cohomology and coefficient inverse systems from the lower étale
   owners.
2. Build the finite-level complexes with pullback for level refinement and trace in the opposite
   direction.
3. Take the derived smooth colimit and define the commuting Weil action by descent.
4. Check coefficient reduction and extension of the algebraically closed base field.

The definition exposes the following operations and relations.

- `TowerCohomology.atLevel` (constructor): Construct RΓ_c at one finite level and coefficient exponent.
- `TowerCohomology.refine` (functoriality): Pull back along a finite étale level map.
- `TowerCohomology.trace` (functoriality): Trace in the reverse direction; trace∘pullback is multiplication by the degree.
- `TowerCohomology.coefficientReduction` (compatibility): Derived reduction modulo ell^r agrees with the finite coefficient tower.
- `TowerCohomology.ext` (extensionality): Maps are identified through their compatible finite-level representatives, not just equality of virtual characters.

**Checks.**

- `TowerCohomology.coverDegree` (computation): For a degree d level covering, trace∘pullback is d times the identity.
- `TowerCohomology.rankOneDegree` (degenerate): The n=1 tower has its compact-support cohomology in degree zero.
- `TowerCohomology.nonproper` (non-example): On a nonproper positive-dimensional tower, replacing RΓ_c by RΓ changes the functor and is rejected.

This interface is used as follows.

- Dat, Corollary 3.4.2 and Theorem 4.1.2: The comparison and representation sectors are statements
   about this complex.
- FS, IX.7.4: The cohomological input must retain Weil actions, not only an Euler characteristic.

**Acceptance.**

- Cohomology agrees with the usual smooth tower H_c^i.
- The trace composed with pullback equals the covering degree.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/actions-and-weil-descent`, `SmoothRepresentationsOfLocalGroups:SR.0`, `DiamondSixOperations:S2`, `AdicCoefficientsAndComparisons:L0`.

The source statements fix the scope of these targets.

- [Dat] §3.3, Faits 3.3.2–3.3.5 and the definition of RΓ_c, pp. 21–24: The equivariant compact-support
   derived complex and coefficient limits.

<a id="et-6a-equivariant-cohomology-comparison"></a>

### ET.6a.10 Equivariant tower cohomology comparison

There is an isomorphism C_LT,Z_ell≅C_Dr,Z_ell in the equivariant derived category, compatible with
   the smooth GL_n(E)×D× structure (hence with the Hecke operators of both level systems), with W_E
   and with coefficient reduction. It induces all degree-wise cohomology comparisons after extending
   to Λ. The proof passes through the equivalence of the appropriate equivariant tower topoi and
   proper-support functors; a bare perfectoid-space isomorphism does not suffice.

The following assumptions are required.

- Use the same action convention on both complexes.
- The finite-level descent theorem compares cofinal level presentations, not equal m.

Construct the objects and prove the result through the following steps.

1. Use EL duality to identify the common infinite-level presentation.
2. Descend equivariant finite étale objects and compact supports through cofinal finite levels.
3. Construct the equivalence of tower topoi and show it intertwines the derived support functors.
4. Pass through integral coefficient inverse systems and then rationalize; compare inertia continuity
   as well as abstract Weil equivariance.

**Acceptance.**

- The comparison is an isomorphism of smooth GL_n(E)×D× complexes, so it intertwines the Hecke
   operators of both towers; it commutes with coefficient reduction.
- A degree-wise comparison only after forgetting W_E fails this target.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/el-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/tower-compact-support`, `PerfectoidSpaces:P5`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`.

The source statements fix the scope of these targets.

- [Dat] Theorem 3.4.1 and Corollary 3.4.2, p. 24: Dat states the equivalence of the equivariant
   period-space topoi exchanging the two compact-support functors, credits it to Faltings and
   Fargues and refers to Fargues’s work on the isomorphism between the two towers for its proof;
   Corollary 3.4.2 is the resulting integral derived isomorphism over the central quotient group
   with the discrete Weil group. Dat is a consumer of this theorem; the proof route here goes
   through the Scholze–Weinstein duality instead.

<a id="et-6a-central-quotient-sector"></a>

### ET.6a.11 Central quotient and tensor sectors

Quotient a tower by the action of varpi_E^Z in its linear group, using Dat §3.5; the remaining
   height classes are indexed by Z/nZ. First define the full-tower sector at central character ω:
   the left GL_n(E) character is ω and the left D× character is ω^(−1), while ρ has central
   character ω. To use the quotient model, arrange ω(varpi_E)=1 by an explicitly recorded unramified
   twist, and retain that twist when returning to the full tower. For an irreducible
   D×-representation ρ in that sector define H_c^i[ρ]=H_c^i⊗_{Λ[D×]}ρ, turning the cohomology left
   D× action into a right action by v·d=d^(−1)v. In this characteristic-zero,
   fixed-central-character quotient D×/varpi_E^Z is compact, so sector extraction is exact and
   agrees with Hom_D(ρ∨,H_c^i).

The following assumptions are required.

- The left D× character of the relevant cohomology summand is the inverse of the central character of
   ρ; the diagonal centre acts trivially.
- The Λ representation is smooth; exactness uses characteristic zero and compactness modulo the fixed
   centre.

Construct the objects and prove the result through the following steps.

1. Form the discrete central quotient with its cohomology action.
2. Untwist the central character, retaining the induced Weil twist.
3. Apply averaging on the compact quotient to establish exact sector extraction.
4. Identify tensor coinvariants with the multiplicity of ρ∨ by the evaluation pairing.

The definition exposes the following operations and relations.

- `TowerSector.centralQuotient` (constructor): Form the quotient tower and its fixed-character component.
- `TowerSector.tensor` (constructor): Tensor the right D× cohomology module with ρ.
- `TowerSector.homDual` (equivalence): Tensor extraction corresponds to Hom_D(ρ∨,−).
- `TowerSector.exact` (instance): Sector extraction is exact over Λ in the fixed compact-mod-centre setting.
- `TowerSector.unramifiedTwist` (compatibility): Untwisting ω(varpi_E) transports both the smooth and Weil factors.

**Checks.**

- `TowerSector.dualSelector` (computation): For a constituent ρ∨⊗V, extraction by tensoring with ρ gives V.
- `TowerSector.heightClasses` (computation): Quotienting the height translation by varpi_E leaves n height residue classes.
- `TowerSector.integralFailure` (non-example): Exact averaging is not asserted over integral or mod-ell coefficients when the compact quotient has ell-torsion.

This interface is used as follows.

- Dat, Theorem 4.1.2: This notation fixes the literal supercuspidal formula.
- FS, IX.7.4: The action dictionary must translate this convention before presenting an FS isotypic
   formula.

**Acceptance.**

- The selector is ρ∨ in Hom notation, not ρ.
- Changing the uniformizer is accompanied by the corresponding central-character identification.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/tower-compact-support`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/actions-and-weil-descent`, `SmoothRepresentationsOfLocalGroups:SR.0`.

The source statements fix the scope of these targets.

- [Dat] §3.5 and the notation before Theorem 4.1.2, pp. 24–28: The quotient and tensor coinvariant
   convention.

<a id="et-6a-basic-modification-functor"></a>

### ET.6a.12 The basic minuscule modification functor

For the basic isocrystal of a one-dimensional height-n formal O_E-module, define the v-functor of
   modifications of its Fargues–Fontaine vector bundle at a marked untilt with minuscule Lie
   quotient and a Tate lattice/frame. For E=Q_p, the SW20 covariant convention has μ=(1,0,…,0) and
   b∈B(GL_n,μ^(−1)); the Newton slope of b is −1/n, while E_b in the exact sequence has degree +1
   and slope +1/n in the curve convention. The modification is O^n→E_b with the Lie cokernel after
   the stated covariant conversion. For E≠Q_p use the O_E-linear EL datum in Res_{E/Q_p}GL_n, with
   its determinant condition. This is only the tower-specific fibre; general local shtukas remain
   HS2.

The following assumptions are required.

- Use the finite-flat local classification and distinguish the covariant Newton convention from the
   degree of its curve bundle.
- Include the untilt divisor and full O_E-compatible Tate framing.

Construct the objects and prove the result through the following steps.

1. Import the marked Cartier untilt divisor from FarguesFontaineDiamonds F4.
2. Form the minuscule modification using the p-divisible-group exact sequence; its positive-degree
   bundle is not replaced by its dual.
3. Impose O_E linearity and the EL determinant condition to pass from Q_p to E.
4. Define lattice level quotients and their universal Q_p/O_E local systems.

The definition exposes the following operations and relations.

- `BasicTowerFibre.ofModification` (constructor): A minuscule modification with its marked untilt and Tate frame gives a point.
- `BasicTowerFibre.forgetFrame` (projection): Forget the full frame to a lattice-level point.
- `BasicTowerFibre.elCondition` (characterisation): O_E linearity and the determinant condition cut out the formal-module EL fibre.
- `BasicTowerFibre.pullback` (functoriality): Pull back bundles, divisors and frames along a perfectoid base map.

**Checks.**

- `BasicTowerFibre.rankOneSign` (computation): The SW20 multiplicative datum is b=p^(−1), μ=1; swapping b for p violates this convention.
- `BasicTowerFibre.generalEHeight` (compatibility): For E/Q_p of degree e, restriction of scalars has Q_p rank en while the O_E rank remains n.
- `BasicTowerFibre.levelFrame` (compatibility): Reducing the universal Tate frame gives the specified congruence-level local system.

This interface is used as follows.

- SW20, Theorem 24.2.5: The classical tower is identified with this fibre.
- ES7:GLn-comparison: Only the classical basic fibre is exported; excursion operators are constructed
   by the consumer.

**Acceptance.**

- For n=1, b=p^(−1) and μ=1 give the nonempty multiplicative modification.
- The Newton sign of b and the degree sign of E_b are distinguished by the exact sequence; they cannot
   be copied from the FS O(−1/n) orientation.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/infinite-level-moduli`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `FarguesFontaineDiamonds:F4/curve_untilt_divisor`, `DiamondsAndVStacks:D6`.

The source statements fix the scope of these targets.

- [SW20] Theorem 24.2.5, pp. 227–229; Corollary 24.3.5, pp. 230–231: The GL_n and EL modification
   descriptions and their level compatibility.

<a id="et-6a-classical-tower-fibre-comparison"></a>

### ET.6a.13 Classical tower versus the basic Hecke fibre

The diamonds of the classical LT/Dr EL tower levels are isomorphic to the corresponding basic
   minuscule modification functor at those levels. The isomorphism respects the universal Tate local
   system, the two period maps, the framing/level actions and Weil descent. The infinite-level
   comparison and its cohomological realization are exported from ET.6a. No general EL/PEL
   Rapoport–Zink representability or full Hecke/Satake construction is claimed here.

The following assumptions are required.

- At hyperspecial/parahoric level impose SW20 connectedness and local-model hypotheses; in the PEL
   extension p≠2.
- For the required formal O_E-module case use the EL restriction-of-scalars specialization.

Construct the objects and prove the result through the following steps.

1. Map a p-divisible deformation to its vector-bundle modification via the local classification
   theorem.
2. Show the Tate kernel is the trivial bundle and reconstruct the p-divisible group on geometric
   points.
3. Use the GM étale map and the universal lattice local system to promote the geometric-point
   comparison to a diamond isomorphism.
4. Match all levels by the same local system and transport actions; combine with the independent
   tower-cohomology comparison.

**Acceptance.**

- A pointwise bijection alone fails the diamond-isomorphism target.
- The HS3 classical-comparison clauses for these towers should redirect to this node rather than
   create a reverse edge to ET.6a.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/basic-modification-functor`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/el-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/equivariant-cohomology-comparison`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/period-morphisms`.

The source statements fix the scope of these targets.

- [SW20] Theorem 24.2.5 and Corollary 24.3.5, pp. 227–231: The diamond comparison and the all-level
   local-system argument.

<a id="et-6a-raw-compact-unitary-cohomology"></a>

### ET.6a.14 Raw compact-unitary PEL cohomology

For a Harris–Taylor compact unitary PEL datum with the required split place E and local division
   invariant, construct the neat finite-level canonical models and their integral PEL models at p,
   the universal p-divisible group, and RΓ_c of the geometric generic fibre with its algebraic
   coefficient local system. Retain prime-to-p Hecke correspondences, local p-level correspondences
   and W_E descent. This raw object and its nearby cycles precede any associated global Galois
   representation or local–global compatibility theorem.

The following assumptions are required.

- The division algebra, involution, signatures, neatness and local level are required to satisfy the
   Harris–Taylor moduli hypotheses.
- Compactness is a theorem of this datum, not a consequence of neatness.

Construct the objects and prove the result through the following steps.

1. Import the general PEL moduli problem and universal family from PELModuli.
2. Specialize to the compact unitary datum and construct its p-level integral models.
3. Construct the algebraic local system and the Hecke/Weil actions on geometric cohomology.
4. Prove the exact compactness and level properties from Harris–Taylor; this proof step is blocked by
   the uncleared book, and is recorded as a source gap.

The definition exposes the following operations and relations.

- `CompactUnitaryRaw.atLevel` (constructor): Construct the raw compact unitary PEL model at a neat level.
- `CompactUnitaryRaw.localSystem` (constructor): Associate the specified algebraic coefficient representation.
- `CompactUnitaryRaw.hecke` (functoriality): Level correspondences act on raw cohomology with pullback and proper trace.
- `CompactUnitaryRaw.nearbyCycles` (compatibility): The geometric generic-fibre complex compares with the integral-model nearby-cycle complex.

**Checks.**

- `CompactUnitaryRaw.properSupport` (compatibility): On the compact datum, the proper-support comparison is the canonical map RΓ_c→RΓ.
- `CompactUnitaryRaw.levelTrace` (computation): Trace after pullback for a finite neat covering multiplies by its degree.
- `CompactUnitaryRaw.boundary` (non-example): A noncompact unitary datum requires boundary terms and cannot be substituted into the compact calculation.

This interface is used as follows.

- Harris–Taylor and Boyer input as used in Dat, §4.1: The local supercuspidal realization is extracted
   from this raw global object.
- AutomorphicGaloisRepresentationsPartII:AG2.1a: Its raw compact-unitary clauses move down here; later
   Galois compatibility consumes them.

**Acceptance.**

- For a compact generic fibre RΓ_c≅RΓ, by properness rather than by changing notation.
- The construction cannot invoke the Galois representation later extracted from it.

*Needs:* `PELModuli:M2/representability`, `PELModuli:M2/universal-family`, `PELModuli:M4/canonical-model-identification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/simple-division-algebra-trace-identity`, `ClassicalAdicEtaleCohomology:H1:formal-adic-comparison`, `LefschetzPencilsAndVanishingCycles:LPV.6`.

The source statements fix the scope of these targets.

- [Dat] §4.1, Theorem 4.1.2 and its proof, pp. 28–29: Dat credits Theorem 4.1.2 to Boyer; its proof
   translates between Harris–Taylor’s and Boyer’s nearby-cycle notation and applies Boyer’s theorem,
   whose global input is the compact unitary (Harris–Taylor) Shimura variety planned here.
- [Shin] §5.1, pp. 30–31 (author copy): Compact unitary PEL data and the distinction between moduli
   and canonical-model components.


**Supplier boundary.** The simple division-algebra trace identity is a trace supplier. It does not construct the Harris–Taylor compact-unitary model or prove its nearby-cycle theorem; those geometric and primary-proof inputs remain open.

<a id="et-6a-unitary-nearby-cycle-decomposition"></a>

### ET.6a.15 Independent nearby-cycle decomposition

For the compact unitary model above, decompose the relevant Newton-stratum nearby-cycle terms into
   Igusa factors and local formal-module deformation cohomology, with the stratum shifts,
   coefficient duals, W_E descent and Hecke actions retained. Extracting the supercuspidal local
   sector has only the contribution yielding degree n−1. The precise Harris–Taylor and Boyer
   stratification and local-system statements must be read and matched before this theorem is
   certified; Dat’s citation is an interface witness, not its proof.

The following assumptions are required.

- Use the actual compact unitary integral model and the supercuspidal sector.
- This target does not assert all non-supercuspidal monodromy or elliptic derived decompositions.

Construct the objects and prove the result through the following steps.

1. Construct the Newton strata and their local product charts from the moduli.
2. Calculate the nearby-cycle restrictions and intermediate extensions with their shifts.
3. Compare stratum cohomology with the local LT deformation complexes.
4. Use the independently proved boundary/stratum vanishings for the supercuspidal sector; the book
   proof and exact internal locators are an open source-access task.

**Acceptance.**

- The spectral sequence must prove actual sector concentration, not just cancellation of Euler
   characteristics.
- All W_E actions must be the descent actions of the same model.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/raw-compact-unitary-cohomology`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/lubin-tate-tower`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/tower-compact-support`, `LefschetzPencilsAndVanishingCycles:LPV.6`.

The source statements fix the scope of these targets.

- [Dat] Theorem 4.1.2 and its proof, pp. 28–29 (with Lemma 3.5.13, p. 27): Dat identifies the sector
   cohomology with the dual of the nearby-cycle cohomology of the Lubin–Tate formal scheme
   (Berkovich’s comparison and the duality Lemma 3.5.13) and then applies Boyer’s computation; the
   nearby-cycle realization is imported, not proved by duality.

<a id="et-6a-global-extraction"></a>

### ET.6a.16 Automorphic trace comparison and local extraction

Apply the independent compact-unitary trace comparison to the raw cohomology and isolate the global
   automorphic constituents with prescribed supercuspidal local factor. The nearby-cycle
   decomposition then extracts the local LT Weil representation and identifies it with the ET.6
   normalized parameter of the contragredient in Dat’s tensor convention, fixing the scalar and the
   central character. The proof must be independent of any AG2 local–global compatibility or FS
   agreement result.

The following assumptions are required.

- Use independent ET.4 trace identities and ET.6 classical parameter conventions.
- Any cyclic base-change input used by ET.6 must first be reassigned to the proposed earlier ET.4b;
   ET.7a is not an input here.

Construct the objects and prove the result through the following steps.

1. Use independently available global test functions to isolate the chosen finite local supercuspidal
   factor.
2. Compare geometric raw cohomological traces and automorphic spectral traces including component and
   volume factors.
3. Use the nearby-cycle decomposition to identify the surviving local factor.
4. Prove concentration and scalar normalization by the Harris–Taylor argument as extended by Boyer;
   exact theorem matching in the uncleared Harris–Taylor book and in Boyer’s freely available paper
   (arXiv:math/0511531) is still required.

**Acceptance.**

- No edge from AG2 compatibility or ES7 agreement enters this proof.
- A character identity must be upgraded to a degree-wise sector isomorphism using the independent
   concentration theorem.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/raw-compact-unitary-cohomology`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/unitary-nearby-cycle-decomposition`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/simple-division-algebra-trace-identity`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/archimedean-lefschetz-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/full-wd-local-langlands`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/local-jacquet-langlands`.

The source statements fix the scope of these targets.

- [Dat] §4.1, pp. 28–29: The proof of Theorem 4.1.2 applies Boyer’s theorem, which rests on the
   Harris–Taylor global calculation, after translating conventions.

<a id="et-6a-supercuspidal-dat-sector"></a>

### ET.6a.17 Actual supercuspidal cohomology in Dat conventions

Let ρ be an irreducible smooth D× representation such that π_ρ=JL(ρ) is supercuspidal, with central
   character treated as above. For the full tower, or its correctly untwisted quotient model,
   H_c^i(M_LT)[ρ]=0 for i≠n−1 and H_c^(n−1)(M_LT)[ρ]≅π_ρ⊗rec_E(π_ρ∨)|·|^((1−n)/2) as GL_n(E)×W_E
   representations. The same identity holds for the Dr tower in the common Dat action convention.
   These are actual cohomology groups, not virtual representations. Here [ρ] is the tensor
   convention already defined.

The following assumptions are required.

- ell≠p and characteristic-zero coefficients.
- The independent global realization (Harris–Taylor, extended by Boyer) and its concentration proof
   must be supplied.
- Only the d_ρ=1 (supercuspidal) specialization of Dat is used.

Construct the objects and prove the result through the following steps.

1. Specialize Dat 4.1.2 to d_ρ=1. Only i=0 is defined in its degree n−1+i indexing; the vanishing for
   1≤i≤n−1 is the intended reading recorded as EndoscopicTransferAndUnitaryTraceComparison/E3 and
   follows from the range of Boyer’s computation.
2. Identify the unique smooth factor with JL(ρ) and retain rec of its contragredient.
3. Read the independent global realization through the preceding raw/nearby-cycle/extraction chain; it
   remains blocked by source access.
4. Use the integral equivariant tower comparison to transfer the degree-wise result to Dr.

**Acceptance.**

- The degree is exactly n−1 and the exponent is (1−n)/2.
- The Weil factor is rec(π_ρ∨); replacing it by rec(π_ρ) without changing conventions fails.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/central-quotient-sector`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/global-extraction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/equivariant-cohomology-comparison`.

The source statements fix the scope of these targets.

- [Dat] Theorem 4.1.2 (credited to Boyer), p. 28: The supercuspidal (d_ρ=1) specialization of the
   displayed degree-wise formula; the vanishing outside degree n−1 is the intended reading of the
   theorem’s range (EndoscopicTransferAndUnitaryTraceComparison/E3).

<a id="et-6a-fs-normalization-contract"></a>

### ET.6a.18 Normalization contract for the two Hecke orientations

Export to ES7 the two geometric Hecke orientations of the basic tower, with standard perverse
   normalization Λ[n−1]((n−1)/2), and explicit action-conversion isomorphisms from the Dat complex.
   In the FS orientation the σ=JL^(−1)(π) input yields π⊗ρ_π on the LT leg, and the π input on the
   return Dr leg yields σ⊗ρ_π∨, concentrated after normalization in degree zero. Here the input is
   the associated smooth representation sheaf on the source stratum, and isotypic extraction is
   derived tensor over that source group using the right action defined by its torsor; it is not
   silently identified with Dat’s [ρ]. The promised conversion must specify the duals,
   inverse-transpose linear action, central quotient and Weil/Tate twists.

The following assumptions are required.

- π is irreducible supercuspidal and ρ_π is the ET.6 parameter.
- The explicit independent action dictionary remains a gap until matched with the Harris–Taylor
   source; the FS proof is only evidence of the consumer signature.

Construct the objects and prove the result through the following steps.

1. Use the classical tower–modification comparison to identify the two geometric orientations and their
   source torsor actions.
2. Compare their right-action derived tensor functors with the literal Dat sector.
3. Track inverse transpose, dual local systems and the shift/half-Tate twist separately; prove the
   resulting action-conversion maps.
4. Check the scalar on the two-leg unit/counit composite at (1,1), leaving that composite calculation
   to ES7.

**Acceptance.**

- At n=1 the shift and half twist vanish and the two factors are dual rank-one Weil characters.
- The two-leg output is σ⊗ρ_π⊗ρ_π∨, with independently specified W_E actions.
- A formula obtained by just replacing rec(π∨) in the Dat formula is rejected.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/classical-tower-fibre-comparison`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/supercuspidal-dat-sector`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/tower-conventions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/full-wd-local-langlands`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/local-jacquet-langlands`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/semisimple-langlands-parameter`.

The source statements fix the scope of these targets.

- [FS] IX.7.4, p. 338: The two normalized cohomology outputs needed by the consumer (FS writes JL(π)
   for the D× representation σ and ρ_π^* for the dual parameter); not an independent proof.
- [Dat] §§3.3–3.5 and Theorem 4.1.2, pp. 21–28: The literal input complex and sector convention that
   the independent dictionary must translate.

<a id="et-6a-rank-two-arithmetic-descent"></a>

### ET.6a.19 Arithmetic descent of the rank-two central quotient

For the rank-two Drinfeld tower in CDN23’s conventions, the quotient M_n^varpi by the chosen central
   uniformizer action descends from brevé E to E with its G′ action. Its base change to a finite
   extension K/E is therefore the arithmetic space M_n,K^varpi, with the specified continuous Galois
   action on étale cohomology. Descent is obtained from the Weil cocycle including the height
   translation, not by discarding the descent datum after geometric base change.

The following assumptions are required.

- Restrict this additional endpoint to the rank-two setting and fields covered by CDN23.
- Use the precise central quotient and quotient group G′ of that source.

Construct the objects and prove the result through the following steps.

1. Compute the Frobenius height translation on the tower.
2. Pass to the central uniformizer quotient so that the translation is killed in the required descent
   cocycle.
3. Apply effective descent to its finite-level formal/rigid models.
4. Match G′ and the coefficient Galois action after finite extension.

**Acceptance.**

- Arithmetic H_et(M_n,K^varpi,−) is not confused with geometric H_et(M_n,C^varpi,−).
- The central action and descent survive the group-action comparison.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/actions-and-weil-descent`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/central-quotient-sector`.

The source statements fix the scope of these targets.

- [CDN23] §0.2.1, p. 4 (published copy): The tower, its central quotient, arithmetic descent and
   action conventions.

<a id="et-6a-stein-mittag-leffler"></a>

### ET.6a.20 Perfectoid Stein covers and Mittag–Leffler

In the setting of CDN23 §3 — the Lubin–Tate tower of GL_n(F) at infinite level over C_p, for every
   n≥1 (the paper applies it with n=2), and hence the Drinfeld tower through the duality isomorphism
   — choose an increasing Stein affinoid perfectoid cover {U_s}. For every i and k≥1 the restriction
   inverse system {H_et^i(U_s,Z/p^k)} is Mittag–Leffler. Thus its derived inverse-limit obstruction
   R¹lim vanishes. This p-primary statement is separate from the ell≠p compact-support realization
   and does not assert that arbitrary perfectoid covers are Mittag–Leffler.

The following assumptions are required.

- The cover is a Stein affinoid perfectoid cover as in CDN23 3.10.
- The source’s compact p-adic Lie level group acts on its standard exhaustion.

Construct the objects and prove the result through the following steps.

1. Reduce by dévissage to k=1.
2. Tilt each U_s and use Artin–Schreier plus affinoid perfectoid acyclicity; for i≥2 the groups vanish.
3. For i=1 use density of the Stein restriction maps and the Artin–Schreier quotient.
4. For i=0 use the compact Lie-group description of components and stabilization of the ascending
   closed-subgroup chain.

**Acceptance.**

- The i=0 argument is included; higher acyclicity alone does not settle it.
- The exact published locator is Lemma 3.10, pp. 35–36, correcting the issue’s Lemma 3.3.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/perfectoid-limit`, `PerfectoidSpaces:P5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/rank-two-arithmetic-descent`.

The source statements fix the scope of these targets.

- [CDN23] Lemma 3.10 and Corollary 3.11, pp. 35–36: The Stein-cover Mittag–Leffler proof, including
   the component argument; §3 works with the Lubin–Tate tower of GL_n(F) for arbitrary n (§3.1, p.
   32).

<a id="et-6a-gross-hopkins-vector-fields"></a>

### ET.6a.21 Gross–Hopkins coordinates and infinitesimal operators

In the rank-two LT chart of CDN20, write the Gross–Hopkins period coordinate as A/B and put
   g=AB′−A′B. Étaleness makes g invertible. The vector fields f_i d/dz with f_1=A²/g, f_2=B²/g and
   f_3=AB/g give the infinitesimal action of the Lie algebra of D×/F× (D the quaternion division
   algebra) on functions on the tower, in the source’s chosen basis. In particular f_1 f_2′−f_2
   f_1′=2f_3, so the first two vector fields have the required bracket. The formulas are
   coordinate-dependent and glue through the period-map transformation rule.

The following assumptions are required.

- Rank two, the coefficient field and Lie-algebra basis of CDN20 §4.2.
- Derivatives are in the selected LT deformation coordinate z.

Construct the objects and prove the result through the following steps.

1. Use GM étaleness to establish g≠0 on the chart.
2. Differentiate the projective linear action on the period coordinate.
3. Pull the induced vector fields back through the étale period map.
4. Compute the bracket using the quotient rule, then verify compatibility on chart overlaps.

**Acceptance.**

- The denominator is g, not g², in each f_i.
- The bracket coefficient is 2f_3 in the chosen basis.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/period-morphisms`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/lubin-tate-tower`, `LocallyAnalyticDistributions:L0`.

The source statements fix the scope of these targets.

- [CDN20] Proposition 4.8, pp. 38–39 (arXiv copy): Proof of Proposition 4.8, Lubin–Tate side: the
   Gross–Hopkins period coordinate A/B, the invertibility of g and the three vector fields giving
   the infinitesimal action of Ǧ/Z(Ǧ), which the source attributes to Gross–Hopkins, and the
   identity f_1f_2′−f_2f_1′=2f_3 (checked by the quotient rule).

<a id="et-6a-analytic-vectors-under-duality"></a>

### ET.6a.22 Duality and locally analytic vectors

For E=Q_p and n=2, on an affinoid perfectoid tower chart Spa(B,B+) covered as in Pan §5.3.5, the
   GL_2(Q_p)-locally analytic vectors in B equal the D×-locally analytic vectors. Duality exchanges
   the two periods and the invariant differential constructions: for the weight convention
   χ=(n_1,n_2), k=n_2−n_1≥0, Pan’s two order-(k+1) operators are equal up to the nonzero rational
   normalization constant c′ after the prescribed line-bundle identifications. The constant is not
   declared equal to one without normalizing coordinates.

The following assumptions are required.

- Use Pan v1’s chart topology, analytic-vector definition, polarization and weight convention.
- The analytic input from Pan22 and its Higgs compatibility must be independently supplied.

Construct the objects and prove the result through the following steps.

1. Use the explicit local series description of Pan 5.2.8 to prove the GL_2-analytic inclusion in the
   D×-analytic vectors.
2. Use duality and the exchanged period map to apply the analogous description 5.3.8 for the reverse
   inclusion.
3. Transport the Kodaira–Spencer line-bundle identifications under duality.
4. Apply the uniqueness characterization of the differential operator in 5.2.15 to obtain 5.3.20,
   retaining c′.

**Acceptance.**

- The result applies to locally analytic vectors, not to all continuous B.
- The transported operator has order k+1 and a nonzero scalar; it is not a tautological renaming.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/el-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/period-morphisms`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/gross-hopkins-vector-fields`, `LocallyAnalyticDistributions:L0`.

The source statements fix the scope of these targets.

- [Pan] Theorems 5.2.8, 5.3.4, 5.3.8; Corollary 5.3.9; Theorem 5.3.20, pp. 59, 63–65, 67 (v1): Local
   series, period exchange, analytic-vector equality and operator comparison.

## Layer ET.7a: Pure automorphic transfer

<a id="et-7a-cyclic-base-change"></a>

### ET.7a.1 Cyclic base change before classical LLC

Import ET.4/local-cyclic-base-change and ET.4/global-cyclic-base-change. Their local and global statements give the following interface for the pure-transfer applications. For a cyclic extension L/K of number fields of prime degree r and its class-field character η, a
   cuspidal unitary representation π of GL_m(A_K) has a unique cyclic base change Π in the class
   induced from cuspidal representations. It is cuspidal if π is not isomorphic to π⊗η; in the
   self-twist case r divides m and Π is the isobaric sum of the r distinct conjugates of a cuspidal
   representation of GL_(m/r)(A_L). A Galois-stable cuspidal Π descends, and its descents differ by
   powers of η. Local tempered base change satisfies the Shintani character identity and sends the
   central character ω_π to ω_π∘N_L/K; the other tempered representations with the same lift are the
   inductions of the same discrete-series data twisted factorwise by powers of the local class-field
   character, and the lift of a supercuspidal representation is supercuspidal when it is discrete
   and otherwise is induced from the distinct Galois conjugates of a supercuspidal representation.

The following assumptions are required.

- Use the induced-from-unitary-cuspidal class and prime degree for the stated global cuspidality
   alternative.
- The local statement is for cyclic nonarchimedean extensions and tempered representations.

Construct the objects and prove the result through the following steps.

1. Use associated test functions and the cyclic twisted trace identity, independent of the later tower
   realization.
2. Apply strong multiplicity one to prove uniqueness of the almost-everywhere lift.
3. Separate the self-twist and no-self-twist cases in the discrete spectral comparison.
4. Prove the local tempered character identity and central-character relation by the AC local transfer
   argument.
5. Relocate this current-scope node to proposed ET.4b before ET.6; do not create an ET.7a→ET.6 edge.

**Acceptance.**

- A self-twist example has noncuspidal base change; cuspidality is not automatic.
- For an unramified local degree-r extension the Satake eigenvalues become α_i^r.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/local-cyclic-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/global-cyclic-base-change`, `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/base-change-fundamental-lemma-and-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/twisted-fundamental-lemma-and-transfer`.

The source statements fix the scope of these targets.

- [AC] Chapter I, Definition 6.1 and Theorem 6.2, p. 51; Proposition 6.7, p. 59; Lemma 6.10, p. 62;
   Chapter III, Theorem 4.2, pp. 202–203: The local Shintani lift with its uniqueness and
   central-character relation, the fibres of tempered lifting, the lifts of supercuspidal
   representations, and the global cyclic cuspidality alternatives.

<a id="et-7a-cyclic-automorphic-induction"></a>

### ET.7a.2 Cyclic automorphic induction

Import ET.4/cyclic-automorphic-induction. Use its unique induction in the induced-from-unitary-cuspidal class as follows. For a cyclic extension L/K of degree r and an automorphic representation Π of GL_a(A_L) induced from
   unitary cuspidal data, there is a unique automorphic induction AI_L/K(Π) on GL_(ar)(A_K) in that
   class, characterized by induction of unramified Weil parameters almost everywhere. At split
   places its parameter is the direct sum over the places above; at inert places it is
   Ind_(W_Lw)^(W_Kv). For prime degree and cuspidal Π, induction is cuspidal precisely when the
   Galois orbit has size r. Transitivity handles the stated cyclic towers.

The following assumptions are required.

- Use the induced-from-cuspidal class of AC III §6.
- The prime-degree cuspidality criterion is distinguished from the general transitivity statement.

Construct the objects and prove the result through the following steps.

1. Construct the induced Satake parameters at split and inert places.
2. Use the cyclic base-change descent alternatives to produce the global representation.
3. Use strong multiplicity one for uniqueness and induction by stages for transitivity.
4. Compute the central character by the determinant of the induced local parameter, including the
   permutation determinant character.

**Acceptance.**

- For rank-one input and quadratic L/K, det Ind χ equals the transfer of χ times the quadratic
   extension character.
- A Galois-invariant cuspidal input induces a noncuspidal isobaric sum.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/cyclic-automorphic-induction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cyclic-base-change`.

The source statements fix the scope of these targets.

- [AC] Chapter III, Definition 6.1 and Theorem 6.2, p. 215; proof, pp. 215–217; Lemma 6.4, pp. 217–218; Corollary 6.5, p. 218: Automorphic induction, its
   split/inert parameters and construction by cyclic descent.

<a id="et-7a-speh-representation"></a>

### ET.7a.3 The global Speh datum

For a unitary cuspidal representation ρ of GL_a(A_F) and an integer b≥1, put m=ab. Define Speh(ρ,b)
   as the unique irreducible Langlands quotient of normalized induction of ρ|det|^((b−1)/2),
   ρ|det|^((b−3)/2), …, ρ|det|^((1−b)/2) from the Levi GL_a^b. Its central character is ω_ρ^b
   because the exponents sum to zero. This global residual Speh quotient is distinguished from a
   local generalized Steinberg subrepresentation.

The following assumptions are required.

- F is a number field and ρ is unitary cuspidal.
- Normalized upper-parabolic induction and decreasing exponents are fixed.

Construct the objects and prove the result through the following steps.

1. Form the normalized standard module.
2. Use the local Langlands-quotient theorem at all places and restricted tensor product compatibility.
3. Compute the exponent sum and central character.
4. Retain the quotient realization when discussing global residues.

The definition exposes the following operations and relations.

- `Speh.ofCuspidal` (constructor): Construct the quotient from (ρ,b) with a≥1, b≥1.
- `Speh.standardModule` (projection): Expose the normalized induction and its quotient map.
- `Speh.centralCharacter` (compatibility): The central character is ω_ρ^b.
- `Speh.one` (simp): Speh(ρ,1)=ρ.
- `Speh.ext` (extensionality): The cuspidal datum and segment length determine the global quotient up to isomorphism.

**Checks.**

- `Speh.lengthOne` (degenerate): b=1 gives the original cuspidal representation.
- `Speh.lengthTwo` (computation): For b=2 the exponents are +1/2 and −1/2 and the central character is ω_ρ².
- `Speh.quotientVsSub` (non-example): Replacing the quotient by the local essentially square-integrable segment subrepresentation is not the global Speh definition.

This interface is used as follows.

- MW, introductory theorem, p. 606: Every discrete GL_m constituent is classified by this datum.
- Shin, Proposition 4.8: The relatively discrete Levi spectrum includes residual constituents, not
   only cusp forms.

**Acceptance.**

- At b=1 it is ρ.
- For b>1 it lies in the residual discrete spectrum, not the cuspidal spectrum.

*Needs:* `AutomorphicFormsOnReductiveGroups:AF.2`, `AutomorphicSpectralTheory:AS.4`.

The source statements fix the scope of these targets.

- [MW] Introduction and §I.1, pp. 605–607; §I.11, pp. 640–643: The quotient convention,
   central-character class and residual representation.

<a id="et-7a-residual-spectrum-classification"></a>

### ET.7a.4 The full GL_m discrete spectrum

With a fixed unitary central character over a number field, every irreducible constituent of
   L²_disc(GL_m(F) modulo its centre in GL_m(A_F)) is a unique Speh(ρ,b), m=ab, and occurs with
   multiplicity one. The cuspidal spectrum is the b=1 part and the residual spectrum is b>1. The
   statement uses square integrability modulo the centre; it does not replace the continuous
   spectrum by discrete Speh representations.

The following assumptions are required.

- Use the normalized induction and central-character convention of the Speh datum.

Construct the objects and prove the result through the following steps.

1. Decompose by cuspidal support classes.
2. Normalize intertwining operators by the Rankin–Selberg factors.
3. Analyze the residue hyperplanes and the cancellation of poles at the zero differences.
4. Show that only equal-rank repeated-cuspidal segments survive and each gives its unique quotient
   once.

**Acceptance.**

- A b=2 residual constituent must appear in a discrete spectral calculation.
- Continuous Eisenstein contributions remain in the full trace formula where required.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/speh-representation`, `AutomorphicSpectralTheory:AS.6/fine-spectral-expansion`.

The source statements fix the scope of these targets.

- [MW] Introduction, theorem (i)–(ii), pp. 605–606; §II.3 and its corollary, pp. 647–649: The residual
   classification by repeated cuspidal support and the residue proof route.

<a id="et-7a-twisted-spectral-normalization"></a>

### ET.7a.5 Twisted unitary spectral coefficients

For the unitary twisted GL group and test functions of Shin §4, the invariant twisted spectral
   distribution is the sum over Levi M of |W_M|/|W_G| times |det(Φ^(−1)θ−1) on a_M^(Gθ)|^(−1), times
   traces on the relatively discrete Levi spectrum of the normalized intertwining composite. After
   the stated central character twist, Shin Corollary 4.14 identifies this composite with the
   normalized θ-intertwiner A′ on the induced representation. At the full Levi the determinant is
   2^r for r nonzero components of the endoscopic datum vecn, so its reciprocal spectral coefficient
   is 2^(−r); at a maximal proper Levi it is 2^(r+1).

The following assumptions are required.

- Use Shin’s real Lefschetz function and central-character normalization.
- Convergence and the invariant trace formula come from AS.6, independently of Igusa cohomology.

Construct the objects and prove the result through the following steps.

1. Import the invariant spectral expansion and group the regular Weyl terms.
2. Use the Φ^(−1)θ involution to identify the single surviving regular element.
3. Insert the residual spectrum classification into each Levi discrete summand.
4. Transport the intertwining operator through the explicit central twist and retain its determinant
   coefficient.

**Acceptance.**

- For a full Levi with two nonzero endoscopic blocks the determinant is 4 and its reciprocal
   coefficient is 1/4.
- Absorbing the normalization operator into an unnamed scalar fails the target.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/residual-spectrum-classification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-spectral-side`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/archimedean-lefschetz-functions`, `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`.

The source statements fix the scope of these targets.

- [Shin] Proposition 4.8 and Remark 4.10, p. 28; Lemma 4.11, p. 29; Corollary 4.14, p. 30 (author
   copy): The Levi/Weyl coefficient, determinant and normalized intertwiner.

<a id="et-7a-weak-unitary-base-change"></a>

### ET.7a.6 Weak unitary base change and standard pairs

Let F/F+ be CM, V a standard definite or standard one-place-indefinite hermitian space, and π an
   automorphic U(V) representation. A weak automorphic base change is an automorphic representation
   Π of GL_N(A_F) that is a finite isobaric sum of discrete automorphic representations and whose
   unramified local parameters match local base change at all but finitely many places of F+. A
   standard pair requires π_f to occur in the stated raw Shimura cohomology (degree zero in the
   definite case, some degree in the indefinite case). Strong multiplicity one gives uniqueness of Π
   when it exists; weak base change alone specifies neither every bad local factor nor every packet
   member.

The following assumptions are required.

- Standard means the signatures and finite-local conditions of LTXZZ Definition 3.2.7.
- Use finite isobaric sums, not only cuspidal GL_N representations.

Construct the objects and prove the result through the following steps.

1. Import the canonical models of the abelian-type unitary Shimura varieties Sh(V,K) attached to
   Res_{F+/Q}U(V) (these are not PEL moduli of similitude groups) and, for definite V, the finite
   Shimura sets; take their raw cohomology.
2. Define the unramified parameter-matching predicate.
3. Use strong multiplicity one for uniqueness in the isobaric class.
4. Record that LTXZZ attributes existence to Shin’s cohomological base change for unitary similitude
   groups (their reference [72], Theorem 1.1, adapted as in their Proposition D.1.3) and, for
   definite V, also to Labesse (their reference [42], Corollaire 5.3); both run through independent
   stable trace identities.

The definition exposes the following operations and relations.

- `UnitaryWeakBC.matches` (characterisation): The good-place unramified parameters match the fixed L-embedding.
- `UnitaryWeakBC.isobaric` (data): Record the GL_N isobaric datum and its central character.
- `UnitaryWeakBC.unique` (extensionality): Two isobaric transfers with the same almost-everywhere parameters are isomorphic.
- `StandardPair.cohomologyWitness` (projection): Expose the raw finite-part cohomological occurrence and the standard signatures.

**Checks.**

- `UnitaryWeakBC.split` (computation): At a split place U(V)(F+_v)≅GL_N(F_w), the selected component is the corresponding GL_N representation.
- `UnitaryWeakBC.badPlace` (non-example): Almost-everywhere equality does not certify an arbitrary chosen ramified packet member.
- `StandardPair.definite` (degenerate): For a definite space the occurrence witness is degree-zero Shimura-set cohomology.

This interface is used as follows.

- LTXZZ, Proposition C.3.1: Weak transfer is upgraded to all-place matching only under the relevant
   generic packet theorem.
- AutomorphicGaloisRepresentationsPartII:AG2.2: The pure automorphic transfer is available before
   Igusa concentration.

**Acceptance.**

- Changing a ramified unitary local factor cannot be ruled out by the weak definition alone.
- Residual Speh possibilities remain until cuspidality is separately established.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/unitary-gl-base-change-descent`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/stable-twisted-identity`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cyclic-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/residual-spectrum-classification`, `ShimuraVarieties:V6/abelian-canonical`.

The source statements fix the scope of these targets.

- [LTXZZ] Definitions 3.2.3 and 3.2.7; Proposition 3.2.8, pp. 144–146: Weak matching, standard pairs
   and base-change existence.


**Supplier boundary.** ET.4/unitary-gl-base-change-descent has been narrowed by independent review to Scholze Theorem 10.5 for the division-algebra similitude datum. It does not supply the stated general U(V) weak base change. This target requires a separate exact unitary-datum contract.

<a id="et-7a-cohomological-base-change"></a>

### ET.7a.7 Pure cohomological unitary transfer

For a standard pair (V,π), the independent unitary stable trace comparison and complex spectral
   decomposition produce the weak isobaric base change Π. At split and good unramified places the
   character/Satake identities use the chosen L-embedding, and at infinity Π has the corresponding
   cohomological infinitesimal character. The identities include the central character and
   normalized intertwiner coefficients. They are exported to AG2.2 without using Igusa concentration
   or any constructed global Galois representation.

The following assumptions are required.

- Use the independent ET.4 stable/twisted identities and their admissible test functions.
- Existence is LTXZZ Proposition 3.2.8, which cites Shin’s cohomological base change (their reference
   [72], Theorem 1.1) and, for definite V, Labesse (their reference [42], Corollaire 5.3); these
   primary proofs remain a source-reading gap.

Construct the objects and prove the result through the following steps.

1. Use the complex spectral decomposition of raw cohomology and real Lefschetz test functions.
2. Transfer finite test functions using ET.3/4 and compare twisted discrete spectra.
3. Use the residual classification and cyclic base-change steps to identify the isobaric GL_N
   constituents.
4. Apply strong multiplicity one to identify the good-place character and infinity type.
5. Read Shin’s (and, in the definite case, Labesse’s) primary existence argument before treating the
   theorem as independently certified.

**Acceptance.**

- The proof has no prerequisite in ET.7b or IG.5.
- The theorem makes good-place and infinity assertions, not all-place packet matching.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/weak-unitary-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/twisted-spectral-normalization`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cyclic-automorphic-induction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/archimedean-lefschetz-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/stable-twisted-identity`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/unitary-gl-base-change-descent`.

The source statements fix the scope of these targets.

- [LTXZZ] Proposition 3.2.8, p. 146: The existence theorem is not proved in LTXZZ: it is attributed to
   Shin’s cohomological base change, with Labesse’s result as a second reference in the definite
   case.
- [Shin] §4, Proposition 4.8, p. 28, and Corollary 4.14, p. 30: The pure twisted spectral comparison
   machinery.


**Supplier boundary.** The cited ET.4 division-algebra descent theorem does not supply cohomological base change for this general U(V) datum. The exact signatures, L-embedding and coefficient-system transfer remain a supplier obligation.

<a id="et-7a-local-unitary-base-change"></a>

### ET.7a.8 Local unitary Langlands quotient compatibility

For an unramified quadratic nonarchimedean extension and a unitary group U(V), write an irreducible
   local representation as a Langlands quotient with tempered data τ_0 on a smaller unitary group
   and τ_i on GL_(r_i), and strictly positive ordered unramified characters α_i. Its GL_N base
   change is the Langlands quotient of the symmetric list τ_t^(∨c)α_t^(−1), …, τ_1^(∨c)α_1^(−1),
   BC(τ_0), τ_1α_1, …, τ_tα_t. Spherical base change matches Satake via the fixed L-embedding. These
   are classification outputs imported from ET.4; defining weak global transfer does not prove them.

The following assumptions are required.

- The tempered local unitary base-change/classification theorem is an independent ET.4 supplier.
- Retain the strictly positive ordering and normalized induction convention.

Construct the objects and prove the result through the following steps.

1. Use the Langlands classification to identify the unique standard module.
2. Apply local base change to tempered unitary data and the conjugate-dual paired GL blocks.
3. Match the dominant exponents and pass to the unique irreducible quotient.
4. Verify the spherical case using Satake, not a global a.e. argument.

**Acceptance.**

- The GL list has total rank N_0+2Σr_i.
- Replacing conjugate dual by ordinary dual gives a different list over a CM extension.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/unitary-endoscopic-classification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/unramified-transfers`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/base-change-groups`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/zelevinsky-classification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/full-wd-local-langlands`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/weak-unitary-base-change`.

The source statements fix the scope of these targets.

- [LTXZZ] Appendix C.1, pp. 351–352: The local Langlands-quotient and tempered/spherical base-change
   rules.


**Supplier boundary.** ET.4/unitary-endoscopic-classification records generic pure-inner global scope and tempered local packets. It does not supply this entire non-tempered local unitary quotient rule. The strict ordering of exponents and the standard unitary L-embedding must be supplied separately.

<a id="et-7a-relevant-packet-multiplicity"></a>

### ET.7a.9 Relevant generic packet multiplicity one

For a relevant GL_N(A_F) representation Π in the sense of LTXZZ 1.1.3 (cuspidal, conjugate self-dual
   with its specified infinity type), and a standard definite or standard indefinite V, every
   irreducible admissible π on U(V) whose local base change equals Π_v at every place occurs in the
   discrete automorphic spectrum with multiplicity one. Conversely, an automorphic π with weak base
   change Π matches Π at every place. At nondistinguished infinity π_v is trivial; at the
   distinguished indefinite infinity its allowed components are the N discrete series with
   Harish–Chandra set {(1−N)/2,(3−N)/2,…,(N−1)/2}.

The following assumptions are required.

- Relevant generic cuspidal Π and the standard hermitian spaces are essential.
- Import the independent generic packet classification and global multiplicity formula from ET.4; it
   is not claimed for arbitrary non-generic Arthur parameters.

Construct the objects and prove the result through the following steps.

1. Apply the generic global unitary packet theorem with the appropriate inner-form relevance
   conditions.
2. Use the global multiplicity formula to prove occurrence and multiplicity one for the specified
   standard forms.
3. Upgrade weak transfer to all-place matching using that same classification theorem.
4. Compute the infinity components from the fixed cohomological parameter.

**Acceptance.**

- There are N allowed distinguished indefinite infinity components, not an arbitrary multiplicity N
   for a single automorphic π.
- An arbitrary weak transfer does not prove this theorem without the relevant generic hypotheses.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cohomological-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/local-unitary-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/unitary-endoscopic-classification`.

The source statements fix the scope of these targets.

- [LTXZZ] Proposition C.3.1, p. 363: All-place matching, multiplicity one and the allowed infinity
   components.

<a id="et-7a-definite-indefinite-switches"></a>

### ET.7a.10 Definite and indefinite packet switches

For even N=2r, standard definite V and indefinite V′ agree outside one inert finite place p and the
   distinguished infinity. If π has trivial infinity, cuspidal base change and its p-component lies
   in the special set S of LTXZZ C.2.5, replace it by the matched S′ component and any distinguished
   discrete series with Harish–Chandra set {1/2−r,…,r−1/2}; the resulting π′ has discrete
   multiplicity one. For odd N=2r+1, the reverse switch from a cuspidal-base-change indefinite π′
   with unramified p-component and infinity set {−r,…,r} to the definite unramified matching
   component has multiplicity one.

The following assumptions are required.

- Use the exact even S/S′ local packet comparison or the odd unramified comparison.
- The spaces are fixed isomorphic at every unchanged place.

Construct the objects and prove the result through the following steps.

1. Preserve local base change at unchanged places by the fixed identifications.
2. Apply the local packet comparison at p, including the lattice and parity hypotheses.
3. Use the classified infinity components to preserve the global parameter.
4. Invoke relevant packet multiplicity one for the resulting all-place matching representation.

**Acceptance.**

- Even and odd switches have different directions and finite-place assumptions.
- Without membership in S, the even p-component cannot be freely replaced.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/relevant-packet-multiplicity`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/local-unitary-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/unitary-endoscopic-classification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/unramified-transfers`.

The source statements fix the scope of these targets.

- [LTXZZ] Corollaries C.3.2 and C.3.3, p. 364; Proposition C.2.5, p. 362: The two parity-specific
   switches.


**Supplier boundary.** The named generic packet theorem and unramified transfer do not contain the lattice-specific S/S′ calculations. The special stabilizer representation and its Satake condition require their own precise local contract.

<a id="et-7a-transferable-level"></a>

### ET.7a.11 Transferable compact levels

A compact open K_v in U(V)(F+_v) is transferable if for each endoscopic H the characteristic
   function 1_Kv has an endoscopic transfer f_Kv^H associated to a compactly supported GL-side
   function φ_Kv^H under base change, and for the full-rank quasi-split H the GL-side function may
   be supported on a maximal compact. An inertial transfer is the selected full-rank φ_Kv. The
   characteristic function is unnormalized: conversion to the idempotent divides by vol(K_v).

The following assumptions are required.

- Fix transfer factors, associated-function convention and Haar measures from ET.3/4.
- A transfer is a selected witness, not a unique test function.

Construct the objects and prove the result through the following steps.

1. Form the associated-test-function predicate for each elliptic endoscopic datum.
2. Specify a witness for the full-rank transfer and its maximal-compact support.
3. Use split identity transfer, hyperspecial fundamental lemmas, or the small-level theorem as
   appropriate.
4. Keep the selected witnesses and prove trace independence at the packet-sum level.

The definition exposes the following operations and relations.

- `TransferableLevel.witness` (constructor): Supply associated transfer functions for every relevant H.
- `TransferableLevel.inertial` (projection): Project to the selected full-rank GL transfer.
- `TransferableLevel.spherical` (example): Good hyperspecial levels use the unit function under both fundamental lemmas.
- `TransferableLevel.idempotent` (compatibility): Replace 1_K by vol(K)e_K; traces scale accordingly.
- `TransferableLevel.traceIndependence` (characterisation): Matching packet traces depend on the transfer class, not the chosen representative.

**Checks.**

- `TransferableLevel.split` (compatibility): Under the split GL_N identification, a chosen 1_K transfers to itself with the same Haar measure.
- `TransferableLevel.volume` (computation): tr π(1_K)=vol(K) dim π^K, while tr π(e_K)=dim π^K.
- `TransferableLevel.badLevel` (non-example): An arbitrary ramified nonsplit K is not declared transferable without the required witnesses.

This interface is used as follows.

- LTXZZ, Proposition D.2.3: The selected inertial transfers compute packet oldform dimensions.
- ET.7 normalization acceptance: The trace-to-dimension conversion depends on whether the source uses
   characteristic functions or idempotents.

**Acceptance.**

- At split places any compact open is transferable.
- At good inert places the hyperspecial transfer is the GL_N hyperspecial characteristic function.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/small-level-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/base-change-transfer-of-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/archimedean-lefschetz-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/group-fundamental-lemma`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/base-change-fundamental-lemma-and-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/twisted-fundamental-lemma-and-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/local-unitary-base-change`.

The source statements fix the scope of these targets.

- [LTXZZ] Definition D.2.1 and Lemma D.2.2, p. 369: The two transfer conditions and the split, good
   and sufficiently small cases.

<a id="et-7a-oldform-dimensions"></a>

### ET.7a.12 Packet oldform dimension identities

Use all the data of LTXZZ D.2: even N=2r, relevant Π, disjoint Σ_min and Σ_lr, Σ_min containing the
   bad places, both together containing the ramified places of Π, inert nonsplit places in Σ_lr with
   special maximal K_v, hyperspecial levels elsewhere, and transferable K_v at Σ_min. Put c_v=1 at
   v∈Σ_lr exactly when Π_v is normalized induction of α_r^(−1),…,α_2^(−1),St_2,α_2,…,α_r with
   |α_i|=1, otherwise c_v=0. Then the definite Π-eigenspace dimension is
   |∏_(v∈Σ_min)tr(Π_v(φ_Kv)A_Πv) ∏_(v∈Σ_lr)c_v|; the indefinite middle-degree dimension is N times
   this value.

The following assumptions are required.

- Use the specified normalized local intertwiners, inertial transfers and source measures.
- Middle-degree concentration is the characteristic-zero relevant-tempered Matsushima calculation for
   this standard datum, not integral Igusa concentration.

Construct the objects and prove the result through the following steps.

1. Use relevant packet classification and temperedness to restrict raw cohomology to the specified
   infinity components.
2. Use the local special-maximal calculation to obtain each zero/one c_v.
3. Sum dim π_v^K over local packet members at the remaining bad places.
4. Prove the identity between packet sums of invariants and normalized traces by passing to an
   auxiliary totally real quadratic extension in which every place of Σ_min splits, every place of
   Σ_lr is inert and the base change of Π stays cuspidal, and by using Shin’s definite-case
   dimension formula there (LTXZZ pp. 370–371, citing their references [71] and [72]).
5. Apply the transferred trace identity with normalized intertwiners; the standard infinity packet
   contributes 1 in the definite case and N in the indefinite case.

**Acceptance.**

- If some c_v=0 both specified eigenspaces vanish.
- For N=2 and all local factors one, the indefinite dimension is twice the definite dimension.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/transferable-level`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/relevant-packet-multiplicity`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/definite-indefinite-switches`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/unitary-endoscopic-classification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/archimedean-lefschetz-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/small-level-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/base-change-transfer-of-functions`, `AutomorphicFormsOnReductiveGroups:AF.5`, `AutomorphicFormsOnReductiveGroups:AF.4`.

The source statements fix the scope of these targets.

- [LTXZZ] Proposition D.2.3 and its setup, pp. 368–371: The full hypotheses, local indicators and the
   two oldform dimensions.

<a id="et-7a-gsp4-solvable-descent-interface"></a>

### ET.7a.13 Automorphic inputs to GSp₄ solvable descent

Export cyclic GL_4 descent and the general-type GL_4↔GSp_4 transfer contract required in BCGP 1.8.22
   and Proposition 7.5.3. For a χ-self-dual cuspidal GL_4 representation, symplectic type is
   detected by a pole at 1 of the twisted exterior-square L-function, and general-type descents have
   all-place standard-parameter matching and multiplicity one. The BCGP solvable-descent
   applications take as input a given irreducible Galois representation over Q with multiplier
   ε^(−1), its given automorphic realization over a solvable CM or totally real extension, and the
   stated Tate twist; the construction of those Galois realizations is external to this part.

The following assumptions are required.

- The packet classification/transfer is an independent ET.4 supplier, including the similitude central
   character.
- Keep the twists and |·|² central character in BCGP 7.5.3; no descent is asserted without
   irreducibility over the extension.

Construct the objects and prove the result through the following steps.

1. Use cyclic descent iteratively over the solvable chain, retaining the class-field twists.
2. Use the supplied symplectic-type/general-type transfer classification to identify the descended
   automorphic parameter.
3. Check the oddness obstruction excluding orthogonal type in the regular |·|²-self-dual Q case.
4. Leave comparison with the given Galois realization and its construction to the BCGP/AG2 consumer.

**Acceptance.**

- The similitude character is part of the exported parameter.
- No edge from AG2 Galois construction is introduced into the pure automorphic branch.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cyclic-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cyclic-automorphic-induction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/gsp4-gl4-transfer`.

The source statements fix the scope of these targets.

- [BCGP] §1.8.22, p. 15; Proposition 7.5.3 and proof, p. 175 (arXiv copy): General-type transfer and
   the precise solvable-descent clients of cyclic descent.

<a id="et-7a-induced-character-client"></a>

### ET.7a.14 Automorphic induction of a quadratic Hecke character

Export the quadratic rank-one automorphic induction theorem used by BCGP Lemma 10.2.4: if a given
   irreducible two-dimensional potentially abelian de Rham Galois representation is not finite up to
   twist, the consumer identifies it as Ind_(G_K)^(G_F)ψ_p for a quadratic K/F and an algebraic
   Hecke character ψ with distinct conjugates. The automorphic output required here is the cuspidal
   AI_K/F(ψ), with the induced unramified parameters and determinant including the quadratic
   extension character. The classification of the given Galois representation is the consumer’s
   input, not a new construction here.

The following assumptions are required.

- The Hecke character and the quadratic induction identification are supplied as input.
- Distinct conjugates are essential to cuspidality.

Construct the objects and prove the result through the following steps.

1. Apply the rank-one prime-degree automorphic induction theorem.
2. Use the nontrivial Galois orbit to prove cuspidality.
3. Compute the induced unramified parameters and central character.
4. Expose the finite-up-to-twist alternative as a separate consumer case.

**Acceptance.**

- If ψ is Galois-invariant, the induced automorphic representation is an isobaric sum, not cuspidal.
- The determinant includes the quadratic permutation character.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cyclic-automorphic-induction`.

The source statements fix the scope of these targets.

- [BCGP] Lemma 10.2.4, p. 213 (arXiv copy): The quadratic Hecke-character induction client.

## Layer ET.7b: Rational Igusa comparison

<a id="et-7b-rational-igusa-object"></a>

### ET.7b.1 The early rational Igusa trace object

For the CSnc split-prime quasi-split unitary PEL datum and a completely slope-divisible
   representative X_b, form the finite-level Mantovan Igusa varieties over its central leaf by
   trivializations of the slope-graded truncated p-divisible group, with the liftable-automorphism
   condition. The perfection of their inverse limit identifies with the perfect isomorphism torsor.
   The frames respect the O_F action and the paired polarizations up to one common scalar
   multiplier, and fppf locally lift to every larger truncation level. Define the rational
   alternating smooth cohomology class [H_c(Ig^b,Λ)]=Σ_i(−1)^i[H_c^i] over the finite-level tower,
   with J_b(Q_p)×G(A_f^p) actions. The object is not assumed positive, concentrated or integral.

The following assumptions are required.

- Use CSnc’s unramified PEL datum, neat prime-to-p levels and completely slope-divisible X_b.
- Only the early central-leaf/torsor/cohomology construction moves down; compactified fibres and
   integral concentration stay IG.
- Preserve the common polarization multiplier across all paired slope factors and the
   seminormal/perfect-base hypotheses in the torsor construction.

Construct the objects and prove the result through the following steps.

1. Specialize the lower PEL universal family and define the Newton class and central leaf by its
   p-divisible isomorphism type.
2. Use the liftable-automorphism finite-level torsors and slope decomposition to construct the Igusa
   level system.
3. Compare the perfected finite-level tower with the isomorphism torsor and construct the quasi-isogeny
   group correspondences.
4. Take rational compact-support cohomology and its alternating class with all group actions.

The definition exposes the following operations and relations.

- `IgusaRational.atLevel` (constructor): Construct finite Igusa torsors with liftable truncated automorphisms.
- `IgusaRational.perfection` (equivalence): Identify their perfection with the full perfect torsor.
- `IgusaRational.actions` (functoriality): Prime-to-p and J_b correspondences act compatibly with finite level.
- `IgusaRational.eulerClass` (projection): Project rational cohomology to its alternating Grothendieck class.
- `IgusaRational.coefficientExtension` (compatibility): Scalar extension transports the trace object without imposing positivity.

**Checks.**

- `IgusaRational.alternating` (computation): A complex with the same one-dimensional trivial representation in degrees 0 and 1 has zero Euler class but nonzero cohomology.
- `IgusaRational.perfect` (compatibility): The perfection map induces an ell≠p étale cohomology isomorphism.
- `IgusaRational.truncation` (non-example): An arbitrary automorphism of X_b[p^m] not liftable to the required slope structure is not a finite Igusa level frame.

This interface is used as follows.

- CSnc, Theorem 5.6.1: Its alternating character is the geometric side of the explicit trace formula.
- IgusaVarietiesAndTorsionConcentration:IG.1 and IG.5: These early rational clauses move down here;
   the higher stages import them and add geometric/integral consequences.

**Acceptance.**

- The scalar kernel in the group action is retained.
- Perfection does not add or remove étale cohomology with ell≠p coefficients.

*Needs:* `PELModuli:M2/representability`, `PELModuli:M2/universal-family`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `DiamondSixOperations:S2`, `AdicCoefficientsAndComparisons:L0`.

The source statements fix the scope of these targets.

- [CSnc] §§2.2–2.3, Proposition 2.2.3, Theorem 2.2.4, Definition 2.3.5 and Remark 2.3.7, pp. 14–20:
   The finite Igusa torsors and perfection comparison.
- [CS17] Definitions 4.3.6 and §5.2, pp. 716–718, 732–733: The Mantovan tower and its alternating
   cohomology class.

<a id="et-7b-csnc-test-functions"></a>

### ET.7b.2 The CSnc test-function package

Use G=G_(2n) for F=F+F_0 and p split in F_0 as in CSnc §5.6. For auxiliary sets S_pf(N_0)⊂S_pf(N),
   write φ=φ_p φ_Spf φ^S. Initially φ_p on J_b(Q_p) is acceptable in the Newton-slope sense of ET.5;
   φ^S is the base-change image of an unramified GL_(2n) test function; at S_pf use the
   characteristic functions of the sufficiently small principal congruence levels specified in CSnc.
   For each elliptic endoscopic G_vecn choose the transferred finite functions and the real
   Lefschetz function f_vecn,∞. Retain the Haar measures, transfer-factor L-map and normalized
   θ-intertwiner.

The following assumptions are required.

- Use all field, split-prime, small-level and set inclusions in CSnc §5.6.
- Acceptability restricts φ_p at first; the extension to arbitrary φ_p is a separate theorem.

Construct the objects and prove the result through the following steps.

1. Use ET.5 acceptability to construct the Newton/Levi transfer at p.
2. Use the split auxiliary-place transfer and the unramified base-change map elsewhere.
3. Use the real Lefschetz function with the source infinity type.
4. Record characteristic-function volumes and the endoscopic coefficient without replacing them by
   normalized unit functions.

The definition exposes the following operations and relations.

- `IgusaTests.ofAcceptable` (constructor): Assemble the test package from acceptable φ_p and the specified finite levels.
- `IgusaTests.endoscopic` (projection): Give the selected transfer for each elliptic endoscopic datum.
- `IgusaTests.infinity` (projection): Give the normalized Lefschetz test function.
- `IgusaTests.volume` (compatibility): Track each unnormalized characteristic function under a change to a Hecke idempotent.

**Checks.**

- `IgusaTests.zeroLocal` (degenerate): φ_p=0 makes every endoscopic and geometric trace zero.
- `IgusaTests.badAuxiliary` (non-example): A principal-congruence level not satisfying the stated smallness and auxiliary-place conditions is not admitted by the source theorem.
- `IgusaTests.characteristic` (computation): At an auxiliary compact level K, 1_K=vol(K)e_K; its trace includes that volume.

This interface is used as follows.

- CSnc, Theorem 5.6.1: The geometric trace is expanded against this exact package.
- CSnc, Lemma 5.6.2: Its tensor factors separate the p, auxiliary and unramified contributions.

**Acceptance.**

- All three finite parts and the infinity test function are present.
- The case φ_p=0 is admissible and every trace vanishes.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/rational-igusa-object`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/base-change-groups`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/unramified-transfers`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/base-change-transfer-of-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/small-level-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/archimedean-lefschetz-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/acceptable-test-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/igusa-endoscopic-test-function`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/twisted-spectral-normalization`.

The source statements fix the scope of these targets.

- [CSnc] §5.6 setup and Theorem 5.6.1, pp. 74–75: The exact finite test functions, auxiliary sets and
   infinity input.
- [CSnc] Definition 5.3.1, p. 68: The transferred functions: the p-component is the function of Shin
   2010 §6 (the same as in CS17), auxiliary places use Langlands–Shelstad transfer, the unramified
   part uses the L-morphism and infinity uses Euler–Poincaré functions.

<a id="et-7b-newton-reduction"></a>

### ET.7b.3 Normalized Newton reduction to the inner form

Define Red_b,vecn:Groth(G_vecn(Q_p))→Groth(J_b(Q_p)) by summing over the effective endoscopic Levi
   triples and allowed Levi embeddings, applying their signed normalized opposite-parabolic Jacquet
   functors, the specified L-map transfer (normalized induction among products of GL groups), and
   the Langlands–Jacquet map to the inner form. Include the transfer character and modulus factor
   belonging to the selected ET.5 test-function normalization. In Shin’s conventions
   Red=(n-Red)⊗barδ_(P(ν_b))^(1/2). CS17 §5.4 prints Red as the untwisted composite of the three
   steps (Shin’s n-Red); the modulus correction below requires the twist
   for CS17 Lemma 5.4.2, so the twisted Red is the one defined here, and CSnc’s use of CS17’s Red is
   read the same way (EndoscopicTransferAndUnitaryTraceComparison/E4). A naive unsigned
   Jacquet-then-JL composition is insufficient.

The following assumptions are required.

- Fix b, its Levi M_b, inner form J_b, effective endoscopic triples and transfer factors.
- The exact CSnc/CS17 character/modulus conversion is an ET.5 supplier requirement.

Construct the objects and prove the result through the following steps.

1. Enumerate effective Levi triples and admissible embeddings.
2. Apply the normalized Jacquet functor for the prescribed opposite parabolic with its transfer sign.
3. Apply the endoscopic GL-product map and signed Langlands–Jacquet transfer.
4. Insert the prescribed modulus/character twist and prove additivity on Grothendieck groups.

The definition exposes the following operations and relations.

- `NewtonRed.apply` (constructor): Apply the signed sum of Jacquet, GL transfer and inner-form maps.
- `NewtonRed.add` (structure): Red is additive on virtual representations.
- `NewtonRed.factor` (characterisation): Expose its effective Levi terms, signs and normalization character.
- `NewtonRed.trace` (compatibility): The character pairs with the ET.5 transferred test function.
- `NewtonRed.localProduct` (functoriality): At split p, independent field factors factor with the specified central factor.

**Checks.**

- `NewtonRed.fullGroup` (degenerate): For vecn=(2n), the effective endoscopy reduces to the single Levi M_b term, with its transfer sign.
- `NewtonRed.virtualNegative` (computation): Red(−[π])=−Red([π]); no positivity follows.
- `NewtonRed.innerFormSign` (non-example): Omitting e_p(J_b) for a nonsplit inner form breaks the transferred trace equality.

This interface is used as follows.

- CS17, Lemma 5.4.2; CSnc, Lemma 5.6.2: It gives the explicit p-local character in the spectral
   expansion.
- IgusaVarietiesAndTorsionConcentration:IG.5: The rational spectral support is fed to a separate
   residual application.

**Acceptance.**

- For the full endoscopic group the effective set is a singleton, but the inner-form sign remains.
- For a proper endoscopic group all allowed Levi contributions are retained.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.5/jb-endoscopic-levi-data`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/transfer-at-p`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/base-change-groups`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/unramified-transfers`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/local-unitary-base-change`, `SmoothRepresentationsOfLocalGroups:SR.2`.

The source statements fix the scope of these targets.

- [CS17] §5.4, Remark 5.4.1 and Lemma 5.4.2, pp. 739–740: The three-step construction (printed without
   the modulus twist, corrected by the modulus correction) and the trace compatibility of
   Lemma 5.4.2.
- [Shin] §5.5, (5.14)–(5.16), pp. 36–37 (author copy): The signed opposite Jacquet functor and modulus
   twist.

<a id="et-7b-red-trace-duality"></a>

### ET.7b.4 Test transfer is dual to Newton reduction

For acceptable φ_p and the fixed transfer φ_vecn,p, every virtual π_p on G_vecn(Q_p) satisfies tr
   π_p(φ_vecn,p)=tr Red_b,vecn(π_p)(φ_p). This identity is exact in the chosen measures and
   normalization; each transfer step is dual to the corresponding representation step. The local
   identity is for acceptable φ_p, where φ_vecn,p is defined; the global trace expansion that uses
   it is extended to arbitrary compactly supported smooth φ_p by the Frobenius-twist argument of
   Shin 2009, Lemma 6.4, as in the proofs of CS17 Lemma 5.5.1 and CSnc Lemma 5.6.2.

The following assumptions are required.

- Use the signed and normalized reduction above.
- For the extension, use the ET.5 acceptable-function extension theorem.

Construct the objects and prove the result through the following steps.

1. Pair normalized opposite Jacquet modules with the constant-term transfer.
2. Factor transfer through M_b and use the signed inner-form character identity.
3. Apply the GL-product induction transfer and the modulus twist.
4. Multiply the test by sufficiently large Frobenius powers so it is acceptable, use the finite
   Weil-character exponential identity, then recover power zero with the same finite-level trace
   distribution.

**Acceptance.**

- The equality is tested on a nontrivial inner form and a proper endoscopic datum.
- An extension by simply declaring all φ_p acceptable fails.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/newton-reduction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/csnc-test-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/transfer-at-p`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/igusa-endoscopic-test-function`.

The source statements fix the scope of these targets.

- [CS17] Lemma 5.4.2, p. 740: The local trace identity, valid for the twisted Red of
   the modulus correction; with the printed untwisted composite it fails for non-basic b.
- [CSnc] Proof of Lemma 5.6.2, pp. 75–76: The local reduction and acceptable-function extension input.

<a id="et-7b-signed-igusa-trace"></a>

### ET.7b.5 The signed source Igusa trace identity

For the CSnc test package, tr(φ|[H_c(Ig^b,Λ)])=τ(G)Σ_vecn ε_vecn I_spec^(G_vecn θ)(f_vecn θ), where
   the sum is over the source elliptic endoscopic groups and ε_vecn=1/2 for the balanced proper
   datum vecn=(n,n), and 1 for the other listed data. All global signs and normalization constants
   inside the invariant distributions are retained. This exact identity is not replaced by the
   unsigned linear-span statement in Lemma 5.6.2.

The following assumptions are required.

- φ_p is acceptable: CSnc §5.6 assumes this in the first instance and Theorem 5.6.1 is proved under
   it; only the factorized expansion is extended to arbitrary φ_p.
- Use the source datum, τ(G), transferred functions and real Lefschetz normalization.
- The alternating class and its finite-level smooth traces are well defined.

Construct the objects and prove the result through the following steps.

1. Apply the ET.5 geometric Igusa trace expression and its stabilization.
2. Use ET.4 to compare the stable distribution with the twisted GL distribution.
3. Insert the explicit endoscopic automorphism coefficient for each vecn.
4. Use the independent invariant geometric/spectral trace identity to replace the geometric
   distribution by I_spec.

**Acceptance.**

- For the balanced proper datum the coefficient is 1/2, not 1.
- The zero φ_p boundary case gives zero on both sides.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/rational-igusa-object`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/csnc-test-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/red-trace-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/stable-twisted-identity`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-spectral-side`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/stable-elliptic-distribution`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/unitary-igusa-trace-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.5/acceptable-functions-determine`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/twisted-spectral-normalization`.

The source statements fix the scope of these targets.

- [CSnc] Theorem 5.6.1, pp. 74–75: The exact τ(G) and ε_vecn source identity.


**Supplier boundary.** The finite unsigned spectral span does not recover the signed source coefficients. ET.5/acceptable-functions-determine extends a fixed identity only after both sides carry the same exact coefficients. The missing early algebraic/Igusa geometry and this signed extension remain proof obligations.

<a id="et-7b-local-factorization"></a>

### ET.7b.6 Finite spectral factorization with virtual coefficients

After fixing the CSnc test package, the rational alternating Igusa trace lies in the finite span of
   terms tr(Red_b,vecn(π_vecn,p)(φ_p)) · tr(Π_vecn,Spf(f_vecn,Spf)A_Spf) ·
   tr(ζ_vecn,*Π_vecn^S(f_2n^S)). Here Π_vecn is a θ-stable irreducible isobaric automorphic
   representation whose infinity component is cohomological for one of the coefficient systems
   Ξ(φ_vecn) entering f_vecn,∞ (none of them is trivial when vecn is proper:
   the infinity coefficient correction below), π_vecn,p is
   its split-p base-change preimage, and Red is the twisted reduction above
   (the modulus correction below). The coefficients
   are virtual spectral coefficients; no sign, multiplicity or positivity is supplied merely by the
   span assertion.

The following assumptions are required.

- Finiteness is for fixed infinity type and fixed finite test functions/levels, not a uniform finite
   list over all levels.
- Use split-p injectivity to define the required preimage.

Construct the objects and prove the result through the following steps.

1. Insert the independent twisted spectral decomposition and residual Levi classification.
2. Factor the test-function tensor product and normalized intertwiner into the three finite parts.
3. Use local trace duality to replace the p component by Red.
4. Retain the exact signed identity separately; CSnc’s span proof explicitly suppresses some constants
   and signs.

**Acceptance.**

- A noncuspidal isobaric constituent is not discarded.
- Terms with the same unramified eigencharacter are grouped with their summed virtual coefficient.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/signed-igusa-trace`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/red-trace-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/twisted-spectral-normalization`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/residual-spectrum-classification`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cohomological-base-change`.

The source statements fix the scope of these targets.

- [CSnc] Lemma 5.6.2 and Remark 5.6.3, pp. 75–76: The finite factorization and possible repeated
   eigencharacters; its “trivial algebraic representation” clause and its untwisted Red are
   corrected as recorded in EndoscopicTransferAndUnitaryTraceComparison/E4–E5.
- [CS17] Lemma 5.5.1, pp. 741–743: The analogous isobaric spectral factorization, as corrected by
   the modulus and infinity coefficient corrections below.

<a id="et-7b-hecke-character-separation"></a>

### ET.7b.7 Separation of unramified Hecke characters

At fixed finite level and infinity type, the distinct unramified GL_(2n) eigencharacters appearing
   in the finite spectral expansion are linearly independent as functions on the spherical Hecke
   algebra. Thus varying f_2n^S isolates the total virtual coefficient of each eigencharacter.
   Distinct endoscopic or Levi contributions with the same image character need not be separated:
   their contributions sum in the same coefficient.

The following assumptions are required.

- Use the finite list of characters in the fixed-level expansion and characteristic-zero coefficients.
- The unramified parameter map is the specified ζ_vecn,* map.

Construct the objects and prove the result through the following steps.

1. Identify distinct isobaric GL representations by strong multiplicity one.
2. Apply linear independence of distinct algebra characters on a finite list, choosing a separating
   finite product of local Hecke operators.
3. Use this separation to isolate the coefficient distribution in φ_p.
4. Retain coincidences under the endoscopic parameter map as one virtual coefficient rather than
   assigning positivity to each term.

**Acceptance.**

- Two different characters can be separated by some finite Hecke operator combination.
- Repeated copies of the same character cannot be independently separated.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/local-factorization`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/residual-spectrum-classification`.

The source statements fix the scope of these targets.

- [CS17] Corollary 5.5.2 and Remark 5.5.3, p. 743: Linear independence of unramified Hecke characters
   and the nonuniqueness of endoscopic contributions; the first assertion of Corollary 5.5.2 holds
   only for the total contribution of a Hecke eigensystem (the aggregate-character correction), which is
   the form used here.
- [CSnc] Remark 5.6.3, p. 76: The same Hecke eigensystem may have multiple endoscopic origins.

<a id="et-7b-rational-trace-export"></a>

### ET.7b.8 Rational Igusa export without concentration

Export to IG.5 and AG2.1b the fixed-level rational trace expansion, its unramified eigencharacter
   support, and the exact local Red factorization with virtual coefficients. A client may infer a
   rational support constraint or a localized virtual trace equality. Inferring an actual cohomology
   constituent, integral nonvanishing, torsion control or middle-degree concentration requires its
   own additional theorem; these claims are not consequences of an alternating trace identity.

The following assumptions are required.

- Use the signed identity for exact coefficients and the span theorem for support.
- Higher consumers import the early rational object defined in this part.

Construct the objects and prove the result through the following steps.

1. Package the three-part factorization and character-separation maps.
2. State the exact coefficient data needed for each rational client.
3. List separately the integral and concentration hypotheses a stronger client must prove.
4. Check that there is no return dependency from IG.5 or AG2 compatibility.

**Acceptance.**

- An acyclic two-term complex with cancellation is not declared zero in cohomology.
- The export is independent of integral concentration.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/signed-igusa-trace`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/local-factorization`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/hecke-character-separation`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/rational-igusa-object`.

The source statements fix the scope of these targets.

- [CSnc] §5.6, pp. 74–76: The rational virtual trace supplier.
- [LTXZZ] Lemma 6.1.11, pp. 267–268: The later non-Eisenstein boundary/concentration application needs
   independent residual Galois input.

## Layer ET.7: Coherent exports and worked normalization checks

<a id="et-7-finite-coefficient-ledger"></a>

### ET.7.1 A finite signed coefficient ledger

For a finite set s of spectral terms and rational numbers mult_i, sign_i, local_i, bad_i, unram_i,
   define comparisonTrace(s)=Σ_(i∈s) mult_i sign_i local_i bad_i unram_i. The fields stand
   respectively for virtual spectral multiplicity, the endoscopic/inner-form coefficient, local Red
   trace, auxiliary twisted trace and spherical eigenvalue. This finite calculation is a
   normalization check on a fixed test package; it is not a definition of the infinite automorphic
   trace formula.

The following assumptions are required.

- Every analytic/spectral finiteness and trace identity has already been proved before instantiating
   the ledger.

Construct the objects and prove the result through the following steps.

1. Use the factorization theorem to enumerate the finite terms.
2. Store the virtual multiplicity separately from the sign/endoscopic constant.
3. Form the finite sum on the existing rational carrier.
4. Check additivity and invariance under merging terms with identical remaining trace factors.

The definition exposes the following operations and relations.

- `comparisonTrace` (constructor): Evaluate the finite signed coefficient sum on the existing rational carrier.
- `comparisonTrace_addMultiplicity` (structure): Adding multiplicity functions adds the trace.
- `comparisonTrace_zeroLocal` (simp): If every local factor is zero, the trace is zero.
- `comparisonTrace_merge` (compatibility): Terms with the same sign and three trace factors combine by adding virtual multiplicities.
- `comparisonTrace_eq_trace_diagonal` (compatibility): Over all of a finite index type, the ledger equals the Mathlib trace of the diagonal matrix whose entries are the five-fold products.

**Checks.**

- `comparisonTrace.balanced` (computation): One term with mult=signless traces=1 and endoscopic coefficient 1/2 evaluates to 1/2.
- `comparisonTrace.cancellation` (computation): Two terms with identical trace factors and multiplicities 1 and −1 have sum zero.
- `comparisonTrace.innerForm` (computation): A term with multiplicity 2, sign −1 and trace factors 3,5,7 evaluates to −210.
- `comparisonTrace.matrixTrace` (compatibility): For two terms with products 2 and 3 the ledger equals Matrix.trace of the diagonal matrix diag(2,3), namely 5.

This interface is used as follows.

- ET.7 normalization checks: Concrete coefficients catch erased signs, volumes and multiplicities.
- Suggested.lean: Only this finite existing-carrier calculation is suggested in Lean; the heavy
   representation objects remain reader targets.

**Acceptance.**

- A negative coefficient is legal and must remain negative.
- A balanced proper endoscopic contribution includes its factor 1/2.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/local-factorization`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/signed-igusa-trace`, `mathlib:Matrix.trace`, `mathlib:Matrix.trace_diagonal`.

The source statements fix the scope of these targets.

- [CSnc] Theorem 5.6.1 and Lemma 5.6.2, pp. 74–76: The exact signed and factorized trace expressions
   motivate separate coefficients.

<a id="et-7-torus-measure-check"></a>

### ET.7.2 Torus transfer and measure conversion

For identity transfer on a local torus T with matching Haar measures, orbital integral at t is
   evaluation f(t), stable and ordinary conjugacy coincide, and the transfer factor is one. For a
   compact open K⊂T, e_K=1_K/vol(K), so for a smooth character χ trivial on K, tr χ(1_K)=vol(K) and
   tr χ(e_K)=1; if χ is nontrivial on K the corresponding traces are zero. Rescaling Haar measure by
   c rescales the characteristic-function trace by c and rescales e_K by c^(−1).

The following assumptions are required.

- Use identity endoscopy and the same quotient measure on the trivial conjugacy orbit.

Construct the objects and prove the result through the following steps.

1. Compute the torus conjugacy orbit, which is a point.
2. Integrate the character over K and use its trivial/nontrivial alternatives.
3. Track the measure in the idempotent normalization.
4. Insert this calculation into the pure and Igusa transfer conventions.

**Acceptance.**

- At vol(K)=3 the trivial character trace of 1_K is 3, not 1.
- A nontrivial character on K integrates to zero.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/transferable-level`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/csnc-test-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/base-change-transfer-of-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/stable-elliptic-distribution`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/tamagawa-number-formula`.

The source statements fix the scope of these targets.

- [AC] Chapter I, §4–§5, pp. 40–50: Associated test functions and the unramified base-change
   homomorphism.
- [LTXZZ] Definition D.2.1, p. 369: Characteristic functions, not automatically normalized
   idempotents, are transferred.

<a id="et-7-unramified-gl2-check"></a>

### ET.7.3 Unramified GL₂ Satake check

For normalized unramified GL_2(E) principal series with Satake eigenvalues α,β, vol(GL_2(O_E))=1,
   the characteristic function of K diag(varpi_E,1) K has eigenvalue q^(1/2)(α+β); the central
   double coset of varpi_E I has eigenvalue αβ. The normalized Hecke polynomial is X²−q^(−1/2)T_1
   X+T_2. Under unramified cyclic degree-r base change the eigenvalues become α^r,β^r.
   Geometric-Frobenius parameters invert the corresponding arithmetic-Frobenius eigenvalues; the
   q-half factors stay attached to the stated normalized Satake map.

The following assumptions are required.

- Normalized induction, fixed q^(1/2), the standard L-embedding and the stated Haar measure.
- T_2 is the central double coset, not the second elementary Hecke operator under a different scaling.

Construct the objects and prove the result through the following steps.

1. Use the normalized Satake transform and its modular-character factor.
2. Compute the two elementary symmetric functions of α,β.
3. Apply the local cyclic norm/Satake base-change map.
4. Invert the Weil Frobenius convention explicitly instead of changing only one coefficient.

**Acceptance.**

- For α=2, β=3 the normalized polynomial is X²−5X+6.
- For r=2 it becomes X²−13X+36 at the parameter level.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cyclic-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/local-unitary-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/tower-conventions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/unramified-transfers`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/base-change-groups`.

The source statements fix the scope of these targets.

- [AC] Chapter I, §4 and the end of §5, pp. 40–50; Theorem 6.2, pp. 51–52: The Satake base-change map
   raises unramified parameters to the extension degree.

<a id="et-7-proper-endoscopy-check"></a>

### ET.7.4 Proper unitary endoscopy and coefficient check

For the CSnc balanced elliptic endoscopic datum G_(n,n) of G_(2n), the standard parameter map is the
   block direct sum with the specified endoscopic character twists, and the source exact Igusa trace
   has coefficient ε_(n,n)=1/2. The twisted spectral normalization has its own Levi determinant
   factor; it is not an additional replacement for ε. The corresponding Red sum uses the effective
   Levi embeddings and transfer signs of this proper datum.

The following assumptions are required.

- Use the source’s fixed L-embedding and character choices from ET.4/5.
- The check tests the proper datum, not only the full-rank identity endoscopy.

Construct the objects and prove the result through the following steps.

1. Construct the two-block L-parameter with the source character twists.
2. Compute the automorphism coefficient ε for the balanced endoscopic datum.
3. Compare the signed Igusa identity with the normalized twisted spectral coefficient ledger.
4. Use local Red trace duality for the same proper datum.

**Acceptance.**

- A single normalized spectral term contributes half its unit coefficient before the other specified
   factors.
- Dropping one effective Levi term can change the virtual local coefficient.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/signed-igusa-trace`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/newton-reduction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/twisted-spectral-normalization`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7/finite-coefficient-ledger`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/stable-elliptic-distribution`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/twisted-spectral-side`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/tamagawa-number-formula`.

The source statements fix the scope of these targets.

- [CSnc] Theorem 5.6.1, p. 75: The balanced proper endoscopic coefficient.
- [Shin] Remark 4.10 and §5.5, pp. 28, 36–37: Distinct spectral determinant and local reduction
   factors.

<a id="et-7-division-inner-form-check"></a>

### ET.7.5 Division-algebra transfer and sign check

For GL_2(E) and its quaternion division inner form D×, the Jacquet–Langlands character relation on
   matching regular elliptic elements has sign (−1)^(2−1)=−1. The trivial D× representation
   transfers to the Steinberg GL_2 representation, whose elliptic character is the negative of the
   trivial inner-form character. In a Red trace the inner-form/Kottwitz sign must agree with the
   transferred test-function normalization; equality without that sign is rejected.

The following assumptions are required.

- Matching elliptic elements and transfer measures/factors come from ET.4/5/6.
- This is the nontrivial inner-form acceptance example.

Construct the objects and prove the result through the following steps.

1. Use the independent local Jacquet–Langlands character theorem from ET.6.
2. Specialize to the trivial D× representation and identify its Steinberg transfer.
3. Evaluate the elliptic character relation.
4. Trace the same sign through the local Red/test transfer and the finite coefficient ledger.

**Acceptance.**

- At rank two the elliptic sign is −1.
- At rank one D=E and the corresponding sign is +1.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6/local-jacquet-langlands`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/badulescu-langlands-jacquet-map`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6/inner-form-nontransfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/newton-reduction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/red-trace-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7/finite-coefficient-ledger`.

The source statements fix the scope of these targets.

- [Dat] §2.1, pp. 6–12, in particular Remark 2.1.14, p. 10; Theorem 4.1.2, p. 28: The
   Jacquet–Langlands conventions (in the Grothendieck group the elliptic representations of a type
   differ from the discrete series by the sign (−1)^|I|) and their relation to tower factors.
- [Shin] §5.5–§5.6, pp. 36–42: The sign enters the inner-form trace transfer.

<a id="et-7-coherent-exports"></a>

### ET.7.6 Coherent automorphic and Igusa exports

Provide separate imports for ET.7a pure automorphic transfer and ET.7b rational Igusa trace
   comparison, plus their joint export. Coherence consists of conversion theorems for
   arithmetic/geometric Frobenius, half Tate twists, inverse-pullback/dual Hecke action, normalized
   versus unnormalized induction, Haar idempotents, Kottwitz signs and virtual stable
   multiplicities. The five acceptance examples are the torus measure calculation, unramified GL_2
   parameters, balanced proper unitary endoscopy, quaternion inner form, and CSnc’s exact trace with
   φ_p=0. These tests do not remove the recorded primary-source and action-dictionary gaps.

The following assumptions are required.

- Each branch satisfies its own hypotheses; clients need only the branch they consume.
- Exact coefficients require the signed identity, while the factorization alone supplies virtual
   support.

Construct the objects and prove the result through the following steps.

1. List the shared convention choices and compare their effects on each branch.
2. Run the torus, GL_2, proper-endoscopic and division-inner-form calculations with the selected
   functions.
3. Use the zero local-function boundary case to test the signed Igusa identity.
4. Export the pure branch independently to AG2.2 and the rational branch to AG2.1b/IG.5 without reverse
   edges.

**Acceptance.**

- A pure-branch client has no IG.5 prerequisite.
- A rational Igusa client receives no integral concentration assertion.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/cohomological-base-change`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a/oldform-dimensions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/rational-trace-export`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7/torus-measure-check`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7/unramified-gl2-check`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7/proper-endoscopy-check`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7/division-inner-form-check`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7/finite-coefficient-ledger`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a/fs-normalization-contract`.

The source statements fix the scope of these targets.

- [CSnc] §5.6, pp. 74–76: The signed rational trace export.
- [LTXZZ] Appendices C.3 and D.2, pp. 363–364, 368–371: The pure relevant packet and oldform
   comparison exports.
- [FS] IX.7.4, p. 338: The independent two-tower consumer normalization target.

## Downstream consumers

HeckeStacksAndLocalShtukas and ExcursionOperatorsAndLocalLanglands consume the classical tower comparison and its explicitly converted parameter factors. AutomorphicGaloisRepresentationsPartII consumes the pure cohomological unitary transfer. IgusaVarietiesAndTorsionConcentration consumes the early rational trace construction and virtual spectral identity, then adds its integral and torsion results. The GSp_4 solvable-descent and quadratic-Hecke-character applications consume cyclic base change and automorphic induction. Every export preserves its coefficient ring, support conditions, representation class and normalization.

## Remaining supplier and proof obligations

The contracts above specify required mathematics. A target becomes usable under precisely its listed hypotheses; a stage name alone does not supply a more general comparison. The following obligations remain part of the build.

### Exact unitary comparisons

ET.7a/weak-unitary-base-change and ET.7a/cohomological-base-change concern U(V), with the standard definite or one-place-indefinite datum of Liu–Tian–Xiao–Zhang–Zhu, Definitions 3.2.3 and 3.2.7 and Proposition 3.2.8, pp. 144–146. ET.4/unitary-gl-base-change-descent concerns specified unitary similitude groups. Its result must be connected to the U(V) canonical models and their raw cohomology through the restriction and extension of central characters and the stated standard signatures. The cohomological existence theorem for the exact U(V) datum remains a required contract. Good-place matching and uniqueness in the isobaric class do not establish existence or all-place matching.

ET.7a/local-unitary-base-change requires the tempered local U(V) correspondence and its compatibility with standard modules, not just GL_n LLC. Its required non-tempered rule is the conjugate-dual symmetric list in Liu–Tian–Xiao–Zhang–Zhu, Appendix C.1, pp. 351–352, using normalized induction and ordered positive unramified characters. ET.4/unitary-endoscopic-classification supplies the generic packet framework and ET.4/unramified-transfers supplies spherical matching; neither stated node spells out this entire local quotient comparison. The general Langlands-classification interface from SmoothRepresentationsOfLocalGroups SR.3.3 retains its Harish–Chandra tempered-support hypothesis. The local U(V) standard-module conversion remains an explicit additional supplier obligation.

The even switch of ET.7a/definite-indefinite-switches needs the precise local bijection of Liu–Tian–Xiao–Zhang–Zhu, Proposition C.2.5, p. 362, proof p. 363. On the self-dual-lattice form, S consists of irreducibles whose restriction to the hyperspecial stabilizer contains the inflated Tate–Thompson representation and whose GL_{2r} base-change Satake parameter contains {q,q⁻¹}. On the other form, a lattice Λ′ satisfies Λ′ ⊆ (Λ′)∨ with one-dimensional residue quotient, and S′ consists of irreducibles with nonzero invariants under its special stabilizer. The correspondence is characterized by equality of GL_{2r} base change. Its proof uses the two explicit local calculations of Lemmas C.2.2 and C.2.4, not only the global generic multiplicity formula. ET.4's generic packet and spherical nodes do not supply these lattice calculations. The even switch retains this contract; the odd switch instead retains its unramified hypotheses (Corollaries C.3.2–C.3.3, p. 364).

### Cohomological and harmonic-analysis proofs

The discrete crossed-module targets use the braided product needed for abelian cohomology. The adjoint Hasse-principle clause of ET.0/abelianization-theorems still needs the primary proof beyond Kisin's use in §4.3.1 and the proof of Corollary 4.6.5. Primary proof obligations also remain for the cited Borovoi, Kottwitz, Borel–Serre and Serre comparisons. The read secondary statements and their theorem, section and page locators remain attached to the targets; their use does not certify a primary proof.

The transfer-factor and local-transfer branch retains primary proof obligations for the Lie-algebra transfer factors, Fourier transform compatibility, real character regularity, Shelstad transfer, Clozel–Delorme functions, descent, inner-form transfer and general twisted transfer. The exact secondary locators identify each used statement. The distinction between ordinary, twisted and twisted weighted fundamental lemmas remains: the first two transfer inputs do not discharge the weighted classification dependency.

ET.4/tamagawa-number-formula is the mathematical owner of the formula using ET.0/kottwitz-duality. Thus the formula is a target here; its primary proof remains an obligation. The elliptic stabilization, invariant twisted trace, twisted Lefschetz functions, classical inner-form JL and its Grothendieck-group extension likewise retain their primary proof obligations. The unitary and GSp_4 classification nodes keep their generic/general-type restrictions and the explicit twisted weighted fundamental-lemma dependency. The full Harris–Taylor unitary base-change and simple-Shimura-variety proofs must be matched with authorized primary theorem and page locators; the secondary Scholze and Shin statements do not erase this requirement.

### Stack and geometric inputs

ET.2b/kappa-decomposition, ET.2b/support-theorem and ET.2b/hitchin-point-count use smooth Deligne–Mumford stacks, rather than only schemes. Their suppliers must include the stack decomposition theorem and relative hard Lefschetz, purity of proper direct images and the compact-support Grothendieck–Lefschetz trace formula with automorphism weights. The exact geometric affine-Grassmannian prefix and function-field Frobenius-trace comparison are also required. Ngô's arXiv:0801.0446v3 Lie-algebra statement uses p ∤ |W| (Théorème 1, p. 1; §1.1, p. 9); a claim about a different published characteristic bound must be checked in that edition. Waldspurger's separate large-characteristic comparison keeps its own bound.

ET.6/drinfeld-level-deformation-spaces and ET.6a's framed towers need the early O_E-linear and special O_D formal-module deformation/classification interface. Dieudonné theory alone does not prove representability with full Drinfeld levels or the Scholze–Weinstein classification (SW13, Theorems 5.1.4, 5.1.6 and 5.2.1). The covariant conversion and independent vector-bundle inputs must precede the towers and relative integral Fargues–Fontaine consumers. The finite-level construction is imported once; framing components and actions remain part of the tower construction.

The raw compact-unitary model, stratum nearby cycles, global extraction and actual supercuspidal realization in ET.6a retain the Harris–Taylor/Boyer proof obligation. Dat's Theorem 4.1.2 and its proof, pp. 28–29, determine the literal sector statement, but citing Boyer's theorem in that proof does not independently check the global realization. The separate Dat-to-Fargues–Scholze dictionary must compare source-torsor actions, contragredients, inverse transpose, the central quotient and the [n−1]((n−1)/2) normalization on both Hecke legs. It cannot be replaced by a formal change of Frobenius generator.

The equivariant compact-support complex requires all-dimensional analytic/tower support comparison, finite étale pullback and trace, and cofinal descent. Classical curve support theory alone does not supply the n>2 case. At each finite level, take the derived inverse limit of the ℓ-power coefficient systems before the smooth level colimit; interchange of those limits needs a separate theorem. The locally analytic branch additionally needs Pan's local-series and toric-chart Higgs compatibility input (arXiv:2209.06366v1, Theorem 5.2.8). Its coordinate-dependent operator constant remains nonzero and unspecified until the coordinate normalization is fixed; publication numbering must be checked independently.

### Representation and trace scope

The cyclic correspondences have one early owner in ET.4. ET.7a applies them. Their early route uses the general SmoothRepresentations Langlands classification with tempered support, rather than a backwards dependency on ET.6's GL_n classification. The non-Galois automorphic-induction and highly ramified twist steps needed by classical LLC remain separate ET.6 targets.

The level-zero LLC/JL formula retains its explicit Bushnell–Henniart twisting-character obligation beyond Newton–Thorne's use in the proof of Lemma 3.6. The truncated constituent criterion is restricted to the degree-one cuspidal line; a general cuspidal-degree version needs the degree-weighted derivative count and a proof. Neither scope restriction can be removed by a source locator alone.

The early rational Igusa object must precede ET.5's fixed-point theorem. Removing the prohibited BG/IG prerequisites exposes a gap; it does not construct these objects. The required algebraic and early Igusa prefix must be planned in ET at its current tier, as the independent ET.4 review requires. Only the central-leaf, liftable-torsor, perfect-tower and rational Euler-class interfaces belong to that prefix; compactified fibres, integral cohomology and concentration retain their higher owners. The algebraic σ-conjugacy and J_b prefix must also be supplied below the fixed-point construction. The signed trace theorem remains a later consumer of those early objects and ET.5's transfers.

ET.7b/newton-reduction and ET.7b/red-trace-duality retain the effective Levi embeddings, the opposite normalized Jacquet functor, signed inner-form JL and the modulus twist. ET.5/acceptable-functions-determine extends a fixed finite signed character identity once both sides have precisely those coefficients. An unsigned spectral span does not reconstruct that signed identity. The central Frobenius-shift extension must therefore be matched for the exact distribution whenever exact constants are exported. The possible effect of the modulus correction on the final local parameter assertion in Caraiani–Scholze, proof of Theorem 5.1.2, p. 77, remains unresolved.

The unramified Hecke separation determines the total contribution of one Hecke character. Different automorphic summands sharing that character are not individually separated by this argument. The alternating rational trace and its virtual coefficients remain compatible with cancellations; they do not assert positive multiplicity, a cohomological degree bound, or integral/torsion concentration.

## Corrections used by the targets

The source formulas are used with the following conventions and corrections. The discussion gives the resulting mathematics in our own words.

<a id="correction-braiding"></a>

An abelian cokernel alone does not give crossed-module cohomology its required abelian structure. The zero boundary from ℤ/3 to ℤ/2, with inversion action and trivial Γ=ℤ/3 action, gives H⁰≅ℤ/3⋊ℤ/2≅S₃. A braiding is the additional input used here (Kisin, *Mod p points on Shimura varieties of abelian type*, §3.2.7(4); Borovoi’s reductive abelianization transports the group law through the two-term torus complex). ET.0/crossed-module-galois-cohomology retains this discriminating check.

<a id="correction-endoscopic-index"></a>

The proper unitary endoscopic index has n₂≥1. A term with n₂=0 repeats the principal datum and must be excluded when that datum is listed separately (Caraiani–Scholze, noncompact paper, §5.2, p. 67). The target ET.0/unitary-elliptic-endoscopic-data uses the disjoint index.

<a id="correction-involution"></a>

The base-change involution is g ↦ Φ {}ᵗ(gᶜ)⁻¹ Φ⁻¹. Transpose together with inverse preserves multiplication; omitting inverse produces an order-reversing map and invalidates the twisted-group construction (Caraiani–Scholze, noncompact paper, §5.5, p. 72). ET.4/base-change-groups uses the automorphism.

<a id="correction-heights"></a>

The quasi-isogeny framing height ranges over ℤ. Uniformizer powers move components in both directions, and the D× action must preserve the resulting union (Dat, §3.2.2, p. 18; §3.2.3, p. 19; §3.2.4, pp. 19–20). Restricting to nonnegative heights would not define the required action.

<a id="correction-dat-degrees"></a>

Dat's sector formula uses 0≤i≤d_ρ−1, with zero cohomology for the remaining indices up to d−1. For d_ρ=1 it gives actual concentration in degree d−1. This range follows from the subset defining π_ρ^{≤i} and the Boyer substitution in the proof (Dat, Convention 2.1.13, Theorem 4.1.2 and proof, pp. 28–29). The theorem is about the specified sector, with its literal contragredient and twist.

<a id="correction-modulus"></a>

Use Red=n-Red⊗δ̄_(P(ν_b))^(1/2), or evaluate the untwisted representation at the test function multiplied by that half modulus. The non-basic case changes central characters. This is the normalization compatible with Shin's transferred function (Shin 2010, §6, (6.8)–(6.10), pp. 21–22) and the trace duality used by Caraiani–Scholze, compact paper, Lemma 5.4.2, and noncompact paper, Lemma 5.6.2 and proof, pp. 75–76. The final parameter question on noncompact p. 77 remains an obligation as stated above.

<a id="correction-infinity"></a>

A proper endoscopic summand at infinity is cohomological for Ξ(φ_n⃗), with its specified discrete parameter, rather than automatically for the trivial algebraic coefficient system. The principal datum specializes to the trivial coefficient system. The proper summands remain regular and C-algebraic, which is the property needed by the subsequent spectral argument (Caraiani–Scholze, noncompact paper, §5.6, Lemma 5.6.2, pp. 74–75; compact paper, the corresponding Lefschetz-function construction). ET.7b/local-factorization retains this distinction.

## References

The theorem and page locators at each use refer to the editions below. Different versions of the same work remain separate when their page numbering differs. Short labels in the tower and application branch refer to Arthur–Clozel (AC), Dat, the noncompact and compact Caraiani–Scholze papers (CSnc and CS17), Scholze–Weinstein (SW13 and SW20), Fargues–Scholze (FS), Liu–Tian–Xiao–Zhang–Zhu (LTXZZ), Mœglin–Waldspurger (MW), Colmez–Dospinescu–Nizioł (CDN20 and CDN23), Pan, Boxer–Calegari–Gee–Pilloni (BCGP), and Shin’s *Galois representations arising from some compact Shimura varieties* (Shin). The Igusa counting and stable trace papers are separately identified by their titles and years.

- Bao Châu Ngô [Le lemme fondamental pour les algèbres de Lie](https://arxiv.org/abs/0801.0446v3). arXiv:0801.0446v3 (2 May 2008), 197 pp., printed page = PDF page from p. 2; published in Publ. Math. IHÉS 111 (2010), 1–169 (locators use v3)
- R. P. Langlands and D. Shelstad [On the definition of transfer factors](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0278/LOG_0030.pdf). Math. Ann. 278 (1987), 219–271; GDZ scan (no text layer), printed page = PDF page + 217
- R. E. Kottwitz [Stable trace formula: elliptic singular terms](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0275/LOG_0056.pdf). Math. Ann. 275 (1986), 365–399; GDZ scan (no text layer), printed page = PDF page + 363
- R. E. Kottwitz [Base change for unit elements of Hecke algebras](https://www.numdam.org/item/CM_1986__60_2_237_0.pdf). Compositio Math. 60 (1986), 237–250; Numdam copy
- R. Kottwitz and D. Shelstad [On splitting invariants and sign conventions in endoscopic transfer](https://arxiv.org/abs/1201.5658v1). arXiv:1201.5658v1 (26 January 2012), 19 pp.
- T. C. Hales [A statement of the fundamental lemma](https://arxiv.org/abs/math/0312227v2). arXiv:math/0312227v2 (30 December 2003), 18 pp.; also Clay Math. Proc. 4 (2005), 643–658; PDF page numbers are cited
- G. Laumon and B. C. Ngô [Le lemme fondamental pour les groupes unitaires](https://arxiv.org/abs/math/0404454v2). arXiv:math/0404454v2 (8 October 2004), 99 pp.; published Ann. of Math. 168 (2008); arXiv page numbers
- J.-P. Labesse [Cohomologie, stabilisation et changement de base](https://www.numdam.org/item/AST_1999__257__R1_0.pdf). Astérisque 257 (1999), vi + 116 pp.; Numdam copy with text layer; printed page = PDF page − 7
- J.-L. Waldspurger [Endoscopie et changement de caractéristique](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopie.pdf). Author's preprint (71 pp.) of J. Inst. Math. Jussieu 5 (2006), 423–525; preprint page numbers
- J.-L. Waldspurger [L'endoscopie tordue n'est pas si tordue : intégrales orbitales](https://webusers.imj-prg.fr/~jean-loup.waldspurger/endoscopietordue.pdf). Author's preprint dated 15 May 2006 (83 pp.) of Mem. Amer. Math. Soc. 194 (2008), no. 908; preprint page numbers
- R. E. Kottwitz [Harmonic analysis on reductive p-adic groups and Lie algebras](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf). In Harmonic Analysis, the Trace Formula, and Shimura Varieties, Clay Math. Proc. 4 (2005), 393–522; Clay Institute copy of the volume; printed page = PDF page − 13
- J. Arthur [An introduction to the trace formula](https://www.claymath.org/wp-content/uploads/2022/03/cmip04c.pdf). In Harmonic Analysis, the Trace Formula, and Shimura Varieties, Clay Math. Proc. 4 (2005), 1–263; same file as kottwitz-clay
- S. W. Shin [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf). Author's copy (62 pp.) of Ann. of Math. 173 (2011), 1645–1741; author-copy page numbers
- S. W. Shin [A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf). Author's copy (30 pp.) of J. Inst. Math. Jussieu 9 (2010), 847–895; author-copy page numbers
- A. Caraiani and P. Scholze [On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/abs/1909.01898v2). arXiv:1909.01898v2 (22 November 2023), 90 pp.
- S. Leslie [The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/abs/1911.07907v3). arXiv:1911.07907v3 (13 March 2025), 89 pp.; published Ann. of Math. 201 (2025)
- T. Kaletha [Rigid inner forms of real and p-adic groups](https://arxiv.org/abs/1304.3292v5). arXiv:1304.3292v5 (9 February 2015); published Ann. of Math. 184 (2016), 559–632; arXiv page numbers
- M. Kisin [Mod p points on Shimura varieties of abelian type](https://people.math.harvard.edu/~kisin/dvifiles/lr.pdf). Author's typeset preprint (99 pp., PDF dated 27 August 2016) of J. Amer. Math. Soc. 30 (2017), 819–914; page numbers of that copy
- P. van Hoften [Mod p points on Shimura varieties of parahoric level](https://arxiv.org/abs/2010.10496v4). arXiv:2010.10496v4 (3 September 2024); published Forum Math. Pi 12 (2024) (not read); arXiv page numbers
- D. Hansen, T. Kaletha and J. Weinstein [On the Kottwitz conjecture for local shtuka spaces](https://arxiv.org/abs/1709.06651v4). arXiv:1709.06651v4 (17 March 2022); published Forum Math. Pi 10 (2022), e13 (not read); arXiv page numbers
- A. Caraiani and P. Scholze [On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1). arXiv:1511.02418v1 (8 November 2015); published Ann. of Math. 186 (2017) (not read; Annals pages 735, 737–738 correspond to arXiv pp. 74–76)
- O. Schiffmann [Indecomposable vector bundles and stable Higgs bundles over smooth projective curves](https://arxiv.org/abs/1406.3839v2). arXiv:1406.3839v2 (4 October 2014), no printed page numbers (PDF pages cited); published Ann. of Math. 183 (2016) (not read)
- H. Yu [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/abs/1807.04659v5). arXiv:1807.04659v5 (18 July 2022); published Ann. of Math. 197 (2023) (not read)
- Y. Liu, Y. Tian, L. Xiao, W. Zhang and X. Zhu [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568). Invent. Math. 228 (2022), 107–375, the NSF Public Access Repository copy (printed page = PDF page + 106)
- A. Caraiani and P. Scholze [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Ann. of Math. 186 (2017), 649–766, published PDF; printed page = PDF page + 648.
- S. W. Shin [Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf). Author's copy (IgusaVar.pdf, 44 pp.) of Duke Math. J. 146 (2009), 509–568; locators give the author copy's section numbers and its printed pages (printed page = PDF page).
- P. Scholze [The local Langlands correspondence for GL_n over p-adic fields](https://arxiv.org/abs/1010.1540v1). arXiv:1010.1540v1, 37 pp.; printed page = PDF page; published Invent. Math. 192 (2013), 663–715.
- J. Arthur and L. Clozel [Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf). Annals of Mathematics Studies 120, Princeton University Press, 1989; scan hosted in the Arthur archive of the Clay Mathematics Institute; locators give printed pages (printed = PDF − 16).
- A. V. Zelevinsky [Induced representations of reductive p-adic groups II. On irreducible representations of GL(n)](https://www.numdam.org/item/ASENS_1980_4_13_2_165_0.pdf). Ann. Sci. École Norm. Sup. (4) 13 (1980), 165–210; Numdam copy, printed page = PDF page + 163.
- M. Tadić [Classification of unitary representations in irreducible representations of general linear group (non-Archimedean case)](https://www.numdam.org/item/ASENS_1986_4_19_3_335_0.pdf). Ann. Sci. École Norm. Sup. (4) 19 (1986), 335–382; Numdam copy, printed page = PDF page + 334.
- G. Boxer, F. Calegari, T. Gee and V. Pilloni [Modularity theorems for abelian surfaces](https://arxiv.org/abs/2502.20645v1). arXiv:2502.20645v1 (28 February 2025), 230 pp.; printed page = PDF page.
- H. Atobe, S. Kondo and S. Yasuda [Local newforms for the general linear groups over a non-archimedean local field](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33DB9D89FADFD4DA27852DE3C9C61DCD/S2050508622000178a.pdf/local-newforms-for-the-general-linear-groups-over-a-non-archimedean-local-field.pdf). Forum of Mathematics, Pi 10 (2022), e22, published open-access PDF, 55 pp.; printed page = PDF page.
- J. Newton and J. A. Thorne [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/abs/2212.03595v2). Accepted preprint arXiv:2212.03595v2 (19 February 2025), published Ann. of Math. 203 (2026), 283–347. Review locators refer to this preprint; published PDF was not served.
- A. I. Badulescu [Jacquet–Langlands et unitarisabilité](https://imag.umontpellier.fr/~ioan-badulescu/Files/jimj.pdf). Author copy of J. Inst. Math. Jussieu 6 (2007), 349–379; author-copy printed pages = PDF pages.
- T. Kaletha, A. Mínguez, S. W. Shin and P.-J. White [Endoscopic classification of representations: inner forms of unitary groups](https://arxiv.org/abs/1409.3731v1). arXiv:1409.3731v1 (2014); printed page = PDF page. Scope of unconditional statements is explicitly restricted in §§1.6–1.7.
- Peter Scholze and Jared Weinstein [Moduli of p-divisible groups](https://arxiv.org/abs/1211.6357). arXiv:1211.6357, cleared author PDF; printed page numbering of that file
- Peter Scholze and Jared Weinstein [Berkeley lectures on p-adic geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf). Authors’ March 27, 2020 version of Annals of Mathematics Studies 207
- Jean-François Dat [Théorie de Lubin–Tate non-abélienne et représentations elliptiques](https://webusers.imj-prg.fr/~jean-francois.dat/recherche/publis/LT.pdf). Author PDF of Invent. Math. 169 (2007), 75–152; internal printed pages
- Ana Caraiani and Peter Scholze [On the generic part of the cohomology of non-compact unitary Shimura varieties](https://www.ma.imperial.ac.uk/~acaraian/papers/noncompact.pdf). Author copy noncompact.pdf (90 pages; its text and page numbers agree with arXiv:1909.01898v2 at every place cited here); published in Annals of Mathematics 199 (2024), 483–590
- Colette Mœglin and Jean-Loup Waldspurger [Le spectre résiduel de GL(n)](https://www.numdam.org/article/ASENS_1989_4_22_4_605_0.pdf). Ann. Sci. École Norm. Sup. (4) 22 (1989), 605–674, published Numdam scan
- Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://doi.org/10.1007/s00222-021-01088-4). Invent. Math. 228 (2022), 107–375, cleared published NSF copy
- Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł [Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1](https://arxiv.org/pdf/1704.08928). arXiv:1704.08928 author copy; JAMS 33 (2020), 311–362 is the publication, whose numbering is not substituted
- Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł [Factorisation de la cohomologie étale p-adique de la tour de Drinfeld](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/79733067FC7CB7574B408744E4387F91/S205050862300015Xa.pdf/factorisation-de-la-cohomologie-etale-p-adique-de-la-tour-de-drinfeld.pdf). Forum of Mathematics, Pi 11 (2023), e16, published Cambridge PDF, 62 pages
- Lue Pan [On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366). arXiv:2209.06366v1, 14 September 2022; preprint theorem/page numbering, not Annals 203 (2026)
- George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645). arXiv:2502.20645 author copy; internal printed pages
- Laurent Fargues and Peter Scholze [Geometrization of the local Langlands correspondence](https://arxiv.org/pdf/2102.13459v4). arXiv:2102.13459v4; IX.7.4 used solely as an output-signature witness
