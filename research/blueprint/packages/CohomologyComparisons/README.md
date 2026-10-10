# Roadmap: p-adic cohomology comparisons

Build the comparison maps between étale, A_inf, crystalline, de Rham, infinitesimal and Hyodo–Kato cohomology, keeping their coefficient maps, Frobenius, Galois actions, filtrations and integral lattices compatible. The main results are the good-reduction crystalline comparison and lattice recovery of Bhatt–Morrow–Scholze, the semistable comparison of Česnavičius–Koshikawa, the proper rigid C_st comparison of Colmez–Nizioł, and the relative filtered comparison of Guo–Reinecke. Trace and Chern classes, integral torsion bounds, the nearby-cycle square, and Pan's finite-period modular-curve comparisons are applications of the same maps.

## Scope and ownership

This roadmap owns comparison maps, their common normalizations, and proofs that competing constructions agree. The canonical B_dR⁺ cohomology of a smooth proper rigid space over C and its relative infinitesimal realization are also constructed here. It owns neither the coefficient rings nor the general cohomology theories: AInfCohomology supplies AΩ and Breuil–Kisin–Fargues theory; CrystallineCohomology supplies crystalline and log crystalline sites, crystals and Hyodo–Kato complexes; PrismaticCohomology supplies prisms, prismatic crystals and their local specializations; PadicHodgeTheory supplies period rings, local period sheaves and admissible representations.

The geometric suppliers are AdicSpacesPartII and AdicEtaleGeometry. EnhancedDerivedSheaves supplies derived completion, enhanced tensor products, descent and coherent diagrams; an ordinary triangulated category records only their underlying maps. FiniteFlatGroupsAndIntegralPadicHodgeTheory supplies the small-weight integral correspondence and the separate all-weight Kisin functor. EtaleDualityAndPerverseSheaves supplies étale traces, purity, cycles, Gysin maps and the projective-bundle formula. CompletedCohomologyPartII supplies the completed modular-curve tower and locally analytic representation theory. The logarithmic period-site construction and affinoid-perfectoid flag basis needed for this tower are constructed in Layer 6 in the restricted modular-curve setting; no general Shimura-variety or canonical-subgroup theorem is required.

From the existing Tau Ceti roadmaps, AlgebraicVectorBundles L0B and L2B supplies finite locally free sheaves, their tensor/dual operations and geometric vector-bundle total spaces. Its projective/flag-bundle and characteristic-class successors are motivation, rather than constructed targets. The projective/flag geometry and class maps needed below are exact additional contracts of EtaleDualityAndPerverseSheaves EDC.3–EDC.4; their étale Kummer, crystalline PD, prismatic logarithmic and p-adic de Rham compatibility is proved here. DifferentialGeometry owns smooth real de Rham theory and its real geometric comparisons; that roadmap constructs them. The p-adic continuous differentials and period filtrations here use adic geometry. IntegralLattices, LocalGaloisGroups and ProfiniteArithmetic retain their general lattice and Galois-group constructions. No general real, operator, spin or peripheral-action theory is part of this build.

There are four distinct ranges. Integral smooth results concern a proper smooth p-adic formal scheme over O_C or O_K. Integral logarithmic results concern the vertical semistable charts of Česnavičius–Koshikawa. Rational proper rigid results require no chosen semistable formal model. The algebraic Beilinson theorem has its own broader range of algebraic varieties, including singular and nonproper ones, and uses the supplied h-descent cohomology. Integral and proper-rigid statements do not acquire that broader range merely by sharing a comparison diagram. Betts–Stix's trace and cycle statements below are restricted to smooth proper algebraic varieties over K and their analytifications.

## Conventions

Let p be prime, C a complete algebraically closed extension of Q_p, O=O_C and k its perfect residue field. For arithmetic descent let K⊂C be a complete discretely valued field of characteristic zero with perfect residue field k₀, ring of integers O_K, chosen embedding K̄→C and absolute Galois group G_K. Mixed characteristic and these completeness hypotheses are standing assumptions; a DVR of equal characteristic is outside the period-ring statements. Distinguish a formal special fibre over O/p from its further reduction over k. In particular, O/p is not identified with k.

Use cohomological degrees and derived scalar extension. A completed tensor includes its named completion ideal; it is never replaced silently by an ordinary tensor. Frobenius is semilinear, or written as its linearization φ* M→M. A tensor Frobenius acts on both factors. Likewise monodromy on a Hyodo–Kato tensor is N_HK⊗1+1⊗N_Bst. Decreasing filtrations use the convolution of the Hodge and coefficient filtrations, not coefficient powers alone. Cohomological perfection means a bounded finite-projective complex; finite freeness of each cohomology group is a stronger conclusion requiring its own theorem.

Choose a primitive compatible p-power root system ε and put μ=[ε]−1, ξ=μ/φ⁻¹(μ), ξ̃=φ(ξ) and t=log[ε]. The expression for ξ is the geometric-sum element, not division by a possibly zero element of A_inf. Write θ̃=θφ⁻¹. The trivial root system gives μ=0 and cannot define localization maps to the nonzero period field. Q_p(1) has character χ_p and Hodge–Tate weight +1; thus H²_ét(P¹,Q_p)=Q_p(−1) has weight −1. Integral Breuil–Kisin twists remain distinct until a specified scalar-extension isomorphism identifies them with Tate twists.

For logarithmic periods use N_Bst=−d/dT and Nφ=pφN. Our uniformizer transport is the evaluation convention T_{πu}=T_π+log_K(u), with ρ_π obtained by evaluating total-monodromy horizontal sections at T_π=0. It gives ρ_{πu}=ρ_π exp(−log_K(u)N_HK). A supplier's opposite convention is translated before use. For lengths over a ramified DVR normalize v(p)=1: val_{O_K}(O_K/(π))=1/e, where e=v_π(p); ordinary module length is still 1. Length over W(k) agrees with p-adic valuation length.

Write a:B_dR(−1)≃B_dR⟨−1⟩ for the trace-normalized Tate-line isomorphism of Layer 6. Its scalar value uses the generator of Q_p(−1) dual to the chosen generator of Q_p(1). A comparison of a class with twist r uses c_dR⊗a^{−r}. After choosing a generator of Q_p(1) and viewing the class in untwisted groups, this says c_dR(cl_ét)=a^r cl_dR. The two formulations have the same direction. Do not identify a with the canonical Fontaine Tate-line isomorphism without a further normalization theorem. Use quotient-line projective bundles: h=c₁(O(1)) and the relation hⁿ−c₁(E)hⁿ⁻¹+⋯+(−1)ⁿc_n(E)=0.

## Exact supplier contracts

### From Mathlib and the current Tau Ceti library

At Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`, use `WittVector`, `WittVector.fontaineTheta`, and `WittVector.frobeniusEquiv` for the perfect residue ring. `BDeRhamPlus` is the specified adic completion and `BDeRham` its localization. Their definitions alone do not supply the complete-DVR, field, filtration or period-invariant theorems consumed below; those are PadicHodgeTheory R06.1. Use `AdicCompletion`, `AdicCompletion.eval_of`, `AdicCompletion.ext` and the finitely generated-ideal completeness theorem `AdicCompletion.isAdicComplete` for the algebraic envelope. A topological Tate presentation also needs the closedness and completed-differential results supplied by adic geometry.

`DerivedCategory (ModuleCat R)` and its homology functors give the underlying ordinary derived signatures. `TensorProduct` and `ModuleCat.extendScalars` give ordinary scalar extension. They do not provide filtered stable categories, homotopy pullback coherence or derived completion. `Module.length` takes values in ℕ∞ and measures module length; `Module.finrank` measures the free rank and cannot measure torsion. `cyclotomicCharacter` fixes the Tate-action convention. The Tau Ceti baseline is `f790474821cf4256814db967cb154e7af3d0c369`; its current library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` supplies no p-adic geometric comparison used here. The current library already contains `TauCeti.PadicTateTwist`, its Galois action and `TauCeti.PadicTateTwist.finrank` in `TauCeti/RingTheory/RootsOfUnity/PadicTateTwist.lean`; that module supplies the integral root-system twists. Generic Spa rational bases and their finite-intersection API are supplied by `TauCeti/AlgebraicGeometry/AdicSpace/Spa/RationalSubset/Basis.lean`, and the rational-window geometry of the Fargues–Fontaine construction by `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/Window.lean`. The modular-curve basis target here additionally proves the perfectoid inverse-image and finite-level density properties of its particular Hodge–Tate map; it does not construct another generic rational basis or Fargues–Fontaine space. These current modules are not assumed available at the older pin. All geometric and enhanced types in the suggested signatures are proposed interfaces with the mathematical contracts below, rather than completed library implementations.

### From the geometric and derived suppliers

AdicSpacesPartII F0 supplies p-adic formal schemes, proper smooth formal base change and special/generic fibres. R0 supplies very small smooth toric affinoids, normed completed Tate presentations and continuous differential complexes, including `smooth-toric-chart` and `differentials-unramified-smooth-etale`. R2 `raynaud-theorem` and `admissible-blow-up` supply formal models and invariance of rigid generic fibres. R3 supplies proper coherent finiteness, flat base change and relative de Rham complexes with integrable connection, including `proper-affinoid-cohomology-finite`. These are used with the actual descended families, not just abstract cohomology groups.

AdicEtaleGeometry A1 supplies `proetale-projection-nu`, `proetale-field-extension-slice` and `profinite-galois-cover-is-covering`, using the corrected covers in Scholze's erratum. ClassicalAdicEtaleCohomology H0 and H1 `formal-adic-comparison` supply the formal/analytic and algebraic/analytic comparison prefix; H5 supplies proper étale GAGA (`proper-comparison-3-7-2`), finite-dimensional rational cohomology and functorial Galois actions. Only this prefix of H1 is needed before logarithmic comparison; its general log-site results are unnecessary here. PerfectoidSpaces P3 `etale-almost-acyclicity` supplies almost acyclicity on the affinoid-perfectoid basis used in Layer 6.

EnhancedDerivedSheaves E2 supplies bounded-below hypercover and h-descent, and E4 supplies stable symmetric-monoidal derived categories, derived/completed scalar extension, the coherent completion comparison, filtrations, mod-ideal detection, Künneth and global descent of local comparison maps. The E4 completion interface includes the associativity and homotopies needed for the diagrams below. DerivedDeRhamCohomology DD.2 supplies p-completed derived de Rham cohomology and finite Hodge truncations. For the nearby-cycle square it must also supply the Hodge-completed tensor with A_dR and the convolution filtration as in AMMN Construction 7.12 and Theorem 7.13, pp.53–54; a naive tensor with Fil^i A_dR is insufficient.

AlgebraicModuliForArithmeticGeometry R09.6 supplies bounded proper formal-model descent and deformation-theoretic approximation; the spreading-out theorem combining these inputs is proved in Layer 2. R09.3 supplies the characteristic-two Enriques and finite-group degeneration examples, with flat lift, approximation of BG, Bertini and weak Lefschetz in the precise range used in BMS §§2.1–2.2. R09.7 supplies the algebraic h-descent/resolution and de Rham duality inputs for the Beilinson and trace comparisons.

### From A_inf, crystalline and prismatic cohomology

AInfCohomology AI.0 `integral` and `period-comparison` supplies θ, θ̃, μ, ξ, residue reduction and their actual period maps. AI.1 supplies Lη and its multiplicative Bockstein reduction, including `bockstein-reduction`. AI.2 supplies the finite-free Breuil–Kisin–Fargues classification of an étale lattice together with a B_dR⁺ lattice, the torsion dévissage and the base-change injection/equality criterion. AI.3–AI.4 supplies AΩ, its local toric Koszul models and global descent. AI.5 supplies proper perfectness and the cohomology module properties used in BMS Theorems 14.1 and 14.3. Its perfectness proof must use those local constructions, not a comparison target from this roadmap as an input.

For the logarithmic range consume the exact AI.6 maps `etale-comparison`, `global-crystalline`, `log-de-rham`, `degreewise-specializations`, `crystalline-de-rham-square`, `hyodo-kato-interface` and `etale-bdr-agreement`. Its `crystalline-torsion`, `de-rham-torsion`, `rank-equality`, `de-rham-lattice-functor` and `model-independent-lattice` are the precise semistable module/lattice inputs used in Layer 5. Their hypotheses retain the vertical semistable charts and the required freeness in consecutive degrees.

CrystallineCohomology CR.0 supplies the PD envelope `fontaine-envelope`, A_cris and its Frobenius-compatible map to B_dR⁺. CR.1 `crystal` supplies coefficient crystals. CR.2 supplies `embedding-computation` and `smooth-lift-filtration`, including the Poincaré lemma for PD envelopes and evaluation on smooth lifts. CR.3 supplies `proper-perfectness`, `derived-base-change`, `kunneth`, `duality` and `torsion-and-models`. The residue-section argument additionally requires the affine rational `Frobenius-isogeny` and canonical comparison after Frobenius descent, not just proper perfectness; BMS Proposition 13.21, p.116, specifies this input. CR.4 supplies `crystalline-comparison`, `perfectoid-base-change` and `degree-scaled-frobenius` for de Rham–Witt cohomology. CR.6 supplies integral Hyodo–Kato complexes, log-base change, Nφ=pφN, the uniformizer torsor and good-reduction/Tate-curve examples. For the broader rational C_st theorem require its overconvergent h-descent Hyodo–Kato realization over the uncompleted F^{nr}, finite-dimensionality and the Hyodo–Kato/de Rham map in Colmez–Nizioł §§4–6. This range is stronger than the vertical integral log-site comparison.

PrismaticCohomology PR.4 supplies syntomic complexes and their twist/Chern maps. PR.5 supplies animated derived rings and the `relative-site-comparison` needed for the derived/singular boundary. PR.6 supplies `ainf-omega-comparison` and `comparison-uniqueness`, with the category of pairs and normalization in Bhatt–Scholze Notation 18.1, Theorem 18.2 and Lemma 18.3. PR.7 must supply analytic prismatic F-crystals on smooth formal O_K-schemes, their crystalline local systems and the relative étale–crystalline comparison of Guo–Reinecke Theorem 9.15. Its equivalence for the single base Spf O_K does not suffice for Layer 2's relative theorem. PR.8 supplies `semistable-aomega-comparison`, `etale-comparison-over-ainf`, `log-de-rham-comparison`, `log-crystalline-comparison` and `log-hyodo-kato-isomorphism`, in its stated chart range. The exact relative and overconvergent supplier ranges just listed are needed before their consumers can be implemented.

### From local p-adic Hodge theory and integral representation theory

PadicHodgeTheory R06.1 supplies the period-field/DVR theorems, `acris-embedding-into-bdr-plus`, `semistable-period-ring`, invariant fields and continuous Galois actions. Tensor operators must respect the coefficient Frobenius and Galois action; G_K does not fix W(k̄)[1/p] pointwise. R06.2 supplies `admissible-representations` and `admissible-implies-weakly-admissible`. R06.4 supplies the Fontaine–Laffaille sign dictionary and rational consequences, separately from all-weight Kisin theory.

PadicHodgeTheory P8 `local-rational` supplies `period-sheaves-on-affinoid-perfectoids`, `period-sheaves-on-profinite-products`, `local-structure-of-structural-de-rham-sheaf`, `rational-acyclicity-of-de-rham-period-sheaves`, `poincare-lemma-and-faltings-extension` and `relative-poincare-lemma`. Require the early primitive finite-coefficient/almost comparison and its p-adically completed extension for proper spaces, together with the local period-sheaf calculations. Those results must be established from local perfectoid theory before the global B_dR comparison here. The overconvergent syntomic-to-étale stable-range map and Banach–Colmez exactness used in Colmez–Nizioł Theorem 6.4, pp.40–41, are additional exact inputs in this broader range: existence of B_st and its invariants alone does not prove C_st.

FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 supplies the finite flat group schemes used in the torsion examples. R07.3 supplies `fl-lattice-correspondence` and `fl-full-faithfulness` only for the unramified Fontaine–Laffaille interval [0,p−2] with the supplier's endpoint conventions; at p=2 this interval is [0,0]. R07.4 must supply the all-weight crystalline-lattice Kisin functor, its B_cris⁺ realization, A_inf extension and full-faithfulness over the p-power-root tower used in BMS Theorem 4.4 and Proposition 4.34. A theory restricted to finite flat groups or weight one is insufficient for the unrestricted cohomological lattice recovery.

### From duality and completed cohomology

EtaleDualityAndPerverseSheaves EDC.2 `pairings` supplies adic/rational Poincaré duality and the cup-product/trace pairing; EDC.2 `trace-purity` supplies purity and the first étale Chern class. EDC.3 supplies `cycle-class-map`, `gysin-map`, `self-intersection-formula` and `chern-classes`. EDC.4 supplies `projective-bundle-decomposition` and injectivity under the projective/flag-bundle pullbacks. TauCetiRoadmap.AlgebraicVectorBundles L0B/L2B supplies the finite locally free sheaves and geometric bundles to which these constructions apply. EDC.4 must also supply the relative quotient-line projective and complete flag bundles and their finite smooth proper geometry; those constructions are listed only as successor motivation in AlgebraicVectorBundles, and are not assumed to exist there.

CompletedCohomologyPartII CC.2 supplies bounded-torsion inverse-limit arguments, CC.4 the complete finite-coefficient tower complexes, and CC.8 the fixed-tame-level modular curve, its Hodge–Tate map, locally analytic exactness and χ̃_l decompletion (Pan I Corollary 4.4.3). Layer 6 supplies the early logarithmic extension and affinoid-perfectoid basis needed to apply these inputs; no general perfectoid-Shimura comparison is assumed. All modules and sheaves keep the topology and almost coefficient category used by Pan.

## How to read the build

Layer 0 fixes coefficient maps and transport conventions. Layer 1 assembles integral smooth specializations. Layer 2 constructs canonical and relative B_dR⁺ infinitesimal cohomology, including the lattice needed by the rational comparison. Layer 3 then descends the crystalline comparison and builds the nearby-cycle pullback square. Layer 4 treats vertical semistable and broader rational C_st comparisons in their separate ranges. Layer 5 derives torsion inequalities and integral lattice recovery, with counterexamples guarding their hypotheses. Layer 6 proves trace, cycle and Chern compatibility and the modular-curve finite-period comparisons. A source-labelled isomorphism always means the constructed comparison map, with its specified scalar extensions and choices.

## Layer 0: Coefficient maps and normalization

### 0.1 Normalized specialization diagram

Define `SpecializationDictionary` to bundle the coefficient maps used by the cohomological comparisons, together with their normalization equations. For the ring of integers O=O_C of a complete algebraically closed extension C/Q_p and its residue field k, the entries are θ:A_inf→O, θ̃=θφ⁻¹, w:A_inf→W(k), A_inf→A_cris→B_dR⁺, and the rational factorization A_inf[1/μ]→B_cris→B_dR. Choose ε=(1,ζ_p,ζ_p²,…) with primitive compatible p-power roots and put μ=[ε]−1, ξ=μ/φ⁻¹(μ), ξ̃=φ(ξ). The quotient expression is implemented by the geometric sum in [ε^{1/p}], so it makes sense inside A_inf without division.

Record ker θ=(ξ), ker θ̃=(ξ̃), θ(μ)=θ(ξ)=0, w(μ)=0 and w(ξ)=p. The B_dR⁺ arrow must be the canonical map into the completion, including its equality with the composite through A_cris. This is a dictionary of existing coefficient objects: the new work is their commuting diagram. In particular w and θ have different values on ξ. For localization at μ, carry the primitive-system hypothesis through every map; ε=1 gives μ=0 and cannot define the indicated map to a nonzero period field.

The API consists of `SpecializationDictionary.thetaTilde_apply` (θ̃ as θφ⁻¹), `period_composite` (the two B_dR⁺ arrows agree), `theta_xi` (value zero), `witt_xi` (value p), `witt_mu` (value zero), `ker_theta` (the two principal kernels), and `witt_frobenius` (residue reduction intertwines the two Frobenii). All names in this paragraph belong to `SpecializationDictionary`.

**Checks.**

- Compute θ(ξ)=0 for the standard dictionary.
- If p≠0 in W(k), compute w(ξ)=p≠0. A dictionary that replaces Witt reduction by θ fails.
- On an arbitrary a∈A_inf compute the same image in B_dR⁺ by the direct arrow and by A_cris.
- Identify the standard θ with `WittVector.fontaineTheta` and its completion target with `BDeRhamPlus`, rather than an unrelated quotient ring.
- For the trivial compatible root system ε=1, compute μ=0; the required localization-to-period-field denominator is not a unit. This is a negative control on the primitive-root hypothesis.

(Bhatt–Morrow–Scholze, Example 3.16, p.25; Definition 3.22, p.27; §4.3, p.40.)

*Needs:* AInfCohomology `AI.0:integral`; CrystallineCohomology `CR.0`; PadicHodgeTheory `R06.1`; Mathlib `WittVector.fontaineTheta`; Mathlib `BDeRhamPlus`; Mathlib `WittVector.frobeniusEquiv`; AInfCohomology `AI.0:period-comparison`; CrystallineCohomology `CR.0/fontaine-envelope`; PadicHodgeTheory `R06.1/acris-embedding-into-bdr-plus`.

### 0.2 Formal and analytic cohomology dictionary

For a proper smooth scheme X₀/O_K, form its p-adic completion 𝔛₀, the completed base change 𝔛/ O_C, the geometric analytic generic fibre X_C and the residue scheme X_k. Introduce the comparison dictionary identifying algebraic and analytic étale cohomology of the proper generic fibre, algebraic de Rham cohomology and the continuous formal de Rham complex, and the crystalline complexes of the common residue scheme. These identifications must be the maps produced by completion and proper GAGA, natural in X₀, rather than merely isomorphisms of abstract groups.

There are two different special-fibre bases in the integral diagram: Y=𝔛×Spec(O_C/p) is the base for the A_cris comparison, whereas 𝔛_k is the base for the W(k) comparison. Retain both named fibre maps. The ring O_C/p is not a field, and replacing Y by 𝔛_k loses the actual crystalline input. The common geometric point K̄→C also fixes which Galois representation the generic cohomology means.

(Bhatt–Morrow–Scholze, Theorem 1.1 and Remarks 1.2–1.3, pp.2–4; §13.4, p.116.)

*Needs:* ClassicalAdicEtaleCohomology `H1:formal-adic-comparison`; CrystallineCohomology `CR.3`; ClassicalAdicEtaleCohomology `H5/proper-comparison-3-7-2`.

### 0.3 Compatible geometric fibres and sites

Construct the derived comparison maps associated to ν:X_proét→X_ét and to formal specialization, and prove their compatibility with pullback, pushforward and the fibre identifications above. For a space descending to K, use the same embedding K̄→C on both sites. In these conventions the G_K action on the two cohomology complexes is transported by the comparison map, not recreated from a different choice of geometric fibre.

The pro-étale covers and field-extension slices are those of the corrected site theory. Prove compatibility using those covers and their descent maps; do not use the point-description statements removed by Scholze's erratum. Analytic logarithmic projections needed for modular curves belong to the separate logarithmic construction in Layer 6. The logarithmic crystalline PD site has different objects and cannot supply these projections.

(Scholze, official erratum, Erratum (1)–(3), pp.1–2.)

*Needs:* AdicEtaleGeometry `A1`; AdicEtaleGeometry `A1/proetale-projection-nu`; AdicEtaleGeometry `A1/proetale-field-extension-slice`; AdicEtaleGeometry `A1/profinite-galois-cover-is-covering`; ClassicalAdicEtaleCohomology `H1:formal-adic-comparison`; ClassicalAdicEtaleCohomology `H0`.

### 0.4 Twists, Frobenius and filtration conventions

Fix the twist dictionary before comparing modules. Q_p(1) has G_K action χ_p and Hodge–Tate weight +1. Put t=log[ε], so φ(t)=pt and Fil^r B_dR=t^r B_dR⁺ for every integer r. The integral Hodge–Tate sheaves use Ω^j{−j} with the Breuil–Kisin twist; the identification with a Tate twist after a period extension must be an explicit map. Display a semilinear Frobenius as its linearization φ* M→M.

For the chosen uniformizer π of O_K and compatible roots π^{1/p^n}, write 𝔖=W(k)[[u]]. In the convention used for BMS lattice recovery, 𝔖→A_inf sends u to [π♭]^p and restricts to Frobenius on W(k); the specialization 𝔖→W(k) sends u to zero and has the same Frobenius on coefficients. Keeping that twist visible is essential for identifying the lattice with its φ-action. As a normalization witness, φ(t)=pt gives weight +1 to Q_p(1), while the degree-two cohomology of P¹ is Q_p(−1), of weight −1.

(Bhatt–Morrow–Scholze, Example 4.24, p.41; §4.4, pp.43–44; introduction p.4.)

*Needs:* Layer 0.1 (Normalized specialization diagram); AInfCohomology `AI.2`; Mathlib `cyclotomicCharacter`; PadicHodgeTheory `R06.1`.

### 0.5 Coefficient choices and transport

Separate canonical scalar maps from proof choices. If K⊂C is complete discretely valued with perfect residue field, construct its unique continuous lift K→B_dR⁺. This is the scalar structure used in descended de Rham comparisons. No section of θ on all of C is part of the construction. Over an imperfect residue field, first-order lifts are governed by the nonzero torsor Hom(Ω̂¹_{O_K},C(1)); uniqueness cannot be transferred from the perfect-residue case.

For a smooth affinoid spreading algebra A/K, choose a lift A→B_dR⁺ only to calculate the completed envelope. Compare two such choices through a common enlargement of the embedding coordinates. The resulting cohomological identification must satisfy the refinement cocycle. A choice k→O_C/p in rational crystalline base change is another, separate choice: retain it in the map and assert independence only within the exact cases of BMS Remark 13.22.

(Bhatt–Morrow–Scholze, Lemmas 13.11–13.13, pp.109–112; Remark 13.20, p.114; Remark 13.22, p.116.)

*Needs:* Layer 0.1 (Normalized specialization diagram); PadicHodgeTheory `R06.1`.

### Examples

At the primitive cyclotomic system, θ(ξ)=0 and w(ξ)=p separate the two scalar maps. At ε=1, μ=0; localization at that μ is the zero ring and cannot map unitally to the nonzero period field. For Q_p(1) the Frobenius equation φ(t)=pt fixes the positive Tate weight, while P¹ has degree-two weight −1. The coefficient lift K→B_dR⁺ is canonical only in the complete perfect-residue range stated above.

### Dependencies

Mathlib Witt vectors, Fontaine θ, BDeRhamPlus, BDeRham and cyclotomicCharacter; AInfCohomology AI.0; CrystallineCohomology CR.0; PadicHodgeTheory R06.1; AdicSpacesPartII F0/R2/R3; AdicEtaleGeometry A1; ClassicalAdicEtaleCohomology H0/H1/H5. The perfect-residue coefficient lift is an arithmetic period input.

## Layer 1: Integral specialization squares

### 1.1 Proper smooth A_inf input package

For a proper smooth p-adic formal scheme 𝔛/O_C, take K_A=RΓ(𝔛,AΩ_𝔛), with its geometric functoriality and Frobenius, from the A_inf cohomology construction. Use the perfectness theorem for this very complex. Its cohomology is finitely presented over A_inf and becomes finite free after inverting p; the associated Breuil–Kisin–Fargues data come with the actual generic and special fibres.

Organize the comparison input as named maps from K_A to the de Rham, Witt-crystalline, A_cris-crystalline and μ-inverted étale specializations. Each scalar map is fixed by Layer 0. The purpose is to make later assertions statements about these particular maps. A collection of perfect complexes with matching ranks does not specify the geometric comparison, its Galois action or the lattice recovered in Layer 5. Perfectness must be supplied without assuming any comparison proved from it here.

(Bhatt–Morrow–Scholze, Theorems 14.1 and 14.3, pp.118–120.)

*Needs:* AInfCohomology `AI.4`; AInfCohomology `AI.5`; Layer 0.1 (Normalized specialization diagram).

### 1.2 Integral de Rham specialization

For the same proper smooth 𝔛, prove that the θ-specialization of K_A is the continuous de Rham complex:

```text
K_A ⊗^L_{A_inf,θ} O_C  ≃  RΓ(𝔛, Ω^{•,cont}_{𝔛/O_C}).
```

Identify this arrow with the local AΩ comparison after descent. It preserves the multiplication in the smooth BMS setting. Use completed continuous differential forms appropriate to the formal model, including the restriction maps used to calculate global sections. The assertion is a derived equivalence, even if a cohomology group has p-torsion. Extracting an ordinary tensor formula for H^i requires the separate base-change argument and its Tor hypotheses.

(Bhatt–Morrow–Scholze, Theorem 14.1(ii), p.118; Theorem 14.3(ii), p.120.)

*Needs:* Layer 1.1 (Proper smooth A_inf input package); Layer 0.1 (Normalized specialization diagram); AInfCohomology `AI.4`.

### 1.3 Hodge–Tate specialization and Bockstein

Use θ̃ rather than θ to obtain the Hodge–Tate object. On the formal scheme its degree-j cohomology sheaf is Ω^j_{𝔛/O_C}{−j}; the Bockstein connecting differential identifies with the de Rham differential after applying the specified Breuil–Kisin twists. Prove compatibility of this identification with products, including the graded Leibniz rule for the Bockstein.

The output is an identification of cohomology sheaves and their differential, not a canonical splitting into untwisted differential forms. In degree one a wrong convention loses the invertible twist line. The comparison with the preceding θ-complex is made by the coefficient dictionary and the Bockstein construction; it is not an equality between θ and θ̃. Keep the local sheaf statement until the derived global comparison has been applied.

(Bhatt–Morrow–Scholze, Theorem 8.3, p.61; Theorem 9.2(i), p.69; Proposition 6.12, p.52; Theorem 14.1 proof, p.118.)

*Needs:* AInfCohomology `AI.4`; Layer 0.1 (Normalized specialization diagram); AInfCohomology `AI.1/bockstein-reduction`.

### 1.4 Derived Witt crystalline specialization

Prove the W(k) specialization using the derived p-completed tensor:

```text
K_A ⊗̂^L_{A_inf,w} W(k)  ≃  RΓ_crys(𝔛_k/W(k)).
```

Locally this comparison is the de Rham–Witt complex. Match its Frobenius with crystalline Frobenius by the explicit degree-scaled operators of that complex and by wφ=Fw. This compatibility is an additional comparison target: the statements of BMS Theorems 14.1(i) and 14.3(i) supply the equivalence but do not separately state its Frobenius law.

The coefficient computation w(ξ)=p explains the completion ideal on this specialization. Treat integral cohomology after derived base change; the term involving Tor of H^{i+1}(K_A) may contribute. The free crystalline lattice in Layer 5 follows only after the torsion hypotheses remove that contribution.

(Bhatt–Morrow–Scholze, Theorem 14.1(i), p.118; Theorem 14.3(i), p.120.)

*Needs:* Layer 1.1 (Proper smooth A_inf input package); Layer 0.1 (Normalized specialization diagram); CrystallineCohomology `CR.4/crystalline-comparison`; CrystallineCohomology `CR.4/degree-scaled-frobenius`; CrystallineCohomology `CR.4/perfectoid-base-change`.

### 1.5 Integral A_cris specialization

For Y=𝔛_{O_C/p}, construct the actual comparison K_A⊗̂^L_{A_inf}A_cris≃RΓ_crys(Y/A_cris). Use the PD embedding complex of Y and the explicit AΩ maps to identify the morphism. In the proper smooth case, justify any replacement of a completed tensor by an ordinary derived tensor from perfectness and the source's coefficient argument; no such replacement is asserted for arbitrary complexes.

Prove the Frobenius commutation equation on the local maps before passing to global sections. BMS Theorem 12.1 and Theorem 14.3(iii) do not include that equation in their stated conclusions. Their smooth multiplicative assertion is about commutative algebra objects in the derived category. A coherent E∞ enhancement further needs the monoidal décalage and completed-tensor construction specified below.

(Bhatt–Morrow–Scholze, Theorem 12.1, p.96; Theorem 14.3(iii), p.120.)

*Needs:* Layer 1.1 (Proper smooth A_inf input package); AInfCohomology `AI.4`; CrystallineCohomology `CR.2`; CrystallineCohomology `CR.0/fontaine-envelope`; CrystallineCohomology `CR.2/embedding-computation`.

### 1.6 Étale specialization after μ inversion

For a proper smooth formal model with geometric generic fibre X_C, use the primitive comparison to obtain

```text
K_A[1/μ] ≃ RΓ_ét(X_C,Z_p) ⊗^L_{Z_p} A_inf[1/μ].
```

The map is the μ-localized local comparison to Rν_*A_inf,X, descended through the common covering. Check its Frobenius law using the trivial Frobenius on the étale factor and the Witt Frobenius on coefficients, and check its products on the same local morphism. These structure laws are targets beyond the bare global equivalence of BMS Theorem 14.3(iv).

Keep properness in this theorem; the assertion is not a blanket comparison for all qcqs nonproper formal schemes. For extension to W(C♭), use flatness of that extension and invertibility of μ there to pass to degreewise cohomology. Neither operation implies integral flatness of the Witt reduction A_inf→W(k).

(Bhatt–Morrow–Scholze, Theorem 14.3(iv), p.120; Lemma 4.26, p.41.)

*Needs:* Layer 1.1 (Proper smooth A_inf input package); AInfCohomology `AI.0:integral`.

### 1.7 Prismatic Frobenius pullback

For the perfect bounded prism (A_inf,ker θ), identify φ*RΓ_Δ(𝔛/(A_inf,ker θ)) with K_A. State the comparison as a Frobenius-pullback map and prove its crystalline, de Rham and étale specializations coincide with the maps already chosen. A formulation with ker θ̃ is transported by φ together with its scalar structure.

For map agreement use the precise uniqueness result over a perfect prism (A,I): put R=A/I, work on p-completely smooth R-algebras, and keep the symmetric monoidal functor G into derived (p,I)-complete A-complexes together with its symmetric monoidal structural transformation η:id→G⊗^L_A R. In this category the prismatic object has only the identity endomorphism. This controls natural transformations with η, rather than arbitrary isomorphisms of cohomology groups. Frobenius compatibility is not an extra premise of that uniqueness theorem. Verify that the compared constructions inhabit this category before using uniqueness.

(Bhatt–Scholze, Theorem 17.2, p.117 (proof pp.117–121); Notation 18.1, Theorem 18.2 and Lemma 18.3, pp.122–123.)

*Needs:* Layer 1.1 (Proper smooth A_inf input package); Layer 0.1 (Normalized specialization diagram); PrismaticCohomology `PR.6/ainf-omega-comparison`; PrismaticCohomology `PR.6/comparison-uniqueness`.

### 1.8 Crystalline–de Rham overlap square

Compare the two paths from the A_inf complex to continuous de Rham cohomology: direct θ-base change, and A_cris base change followed by θ:A_cris→O_C and crystalline-to-de Rham reduction. Prove the paths agree as natural morphisms of complexes using the common PD embedding calculation. Include the associativity isomorphism for successive scalar extensions in the written square.

On the W(k) side, crystalline reduction to k uses its Frobenius-normalized scalar structure and the corresponding de Rham complex. It does not give the θ̃ Hodge–Tate complex. The square must carry the multiplication and the scalar normalization of the maps in the preceding subsections. Comparing only the resulting dimensions would lose the filtration and class compatibilities needed later.

(Bhatt–Morrow–Scholze, Theorem 14.1 proof, pp.118–119; §12.2.)

*Needs:* Layer 1.5 (Integral A_cris specialization); Layer 1.2 (Integral de Rham specialization); Layer 1.4 (Derived Witt crystalline specialization); CrystallineCohomology `CR.2`; PrismaticCohomology `PR.6`; CrystallineCohomology `CR.2/smooth-lift-filtration`; PrismaticCohomology `PR.6/ainf-omega-comparison`; PrismaticCohomology `PR.6/comparison-uniqueness`.

### 1.9 Multiplication and Bockstein coherence

Enhance the smooth integral comparison diagram with products, linearized Frobenius and Bockstein operators. Prove the associativity squares for iterated derived scalar extensions and identify their coherent homotopies in the enhanced category. The constructions must use the same morphisms as the preceding diagram, so changing parenthesization of the tensor does not change the comparison map.

Supply the décalage multiplication and the lax symmetric monoidal refinement needed to lift the ordinary derived-category statement. BMS's global smooth assertion alone does not furnish all of these coherent data. The Bockstein obeys the signed Leibniz formula in cohomological degree, so two classes of degree one provide a check on the sign. The log-semistable diagram has its own product scope; none of these enhancements is transferred to it without the corresponding logarithmic comparison theorem.

(Bhatt–Morrow–Scholze, Theorem 14.1 opening and proof, pp.118–119.)

*Needs:* AInfCohomology `AI.1`; EnhancedDerivedSheaves `E4`; Layer 1.8 (Crystalline–de Rham overlap square); AInfCohomology `AI.1/bockstein-reduction`.

### 1.10 Derived tensor and completion boundary

Record the extension interface for singular, semiperfectoid and nonproper inputs with the actual derived-complete or animated construction supplied by its owner. Each comparison specifies its completion ideal, boundedness or finiteness assumptions and local descent category. The proper smooth theorem above is already complete in its own range; its proof is not permission to discard these hypotheses elsewhere.

The elementary warning is the base-change exact sequence over a principal quotient: H^i(K)/a injects into H^i(K⊗^L R/a), with a possible contribution H^{i+1}(K)[a]. Construct the natural map and connecting term explicitly in the enhanced tensor theory. This example explains why a cohomology-level ordinary tensor cannot substitute for a derived comparison, and why ordinary `DerivedCategory` alone does not encode animated prisms or filtered E∞ cohomology.

(Bhatt–Morrow–Scholze, Lemma 4.16, p.38; Theorems 14.1–14.3.)

*Needs:* EnhancedDerivedSheaves `E4`; PrismaticCohomology `PR.5`; AInfCohomology `AI.5`; EnhancedDerivedSheaves `E4/the-imported-completion-interface`; PrismaticCohomology `PR.5/relative-site-comparison`.

### Examples

For the proper smooth point, each specialization is its coefficient ring in degree zero and all positive cohomology vanishes. Derived base change of the perfect two-term complex [Z_p —p→ Z_p] retains a nonzero Tor contribution after reduction modulo p; computing only the ordinary tensor of one cohomology group misses it. Thus consecutive-degree torsion assumptions are necessary for degreewise integral identities.

### Dependencies

Layer 0; AInfCohomology AI.1–AI.5; CrystallineCohomology CR.0–CR.4; PrismaticCohomology PR.5–PR.6; PadicHodgeTheory P8 local-rational; ClassicalAdicEtaleCohomology H5; EnhancedDerivedSheaves E2/E4 and DerivedDeRhamCohomology DD.2. No global comparison from Layer 2 is an input to the early primitive theorem.

## Layer 2: Canonical and relative infinitesimal B_dR⁺ cohomology

### 2.1 Very small affinoid embeddings

For a smooth Tate C-algebra R of dimension d, choose a finite collection Σ of power-bounded units generating a surjection from the Laurent Tate algebra, with d of them giving a torus chart through rational embeddings and finite étale maps. Prove such very small affinoids form a basis for smooth rigid spaces. The chosen set contains the coordinates required by the chart as well as any redundant units needed to make the presentation surjective.

Enlarging Σ provides the comparison maps. Given a morphism of affinoids or two sets of coordinates, pass to a common enlargement rather than selecting a preferred chart functorially. This basis and refinement system are the input for the canonical presheaf; local computations depending on one chart must descend through them.

(Bhatt–Morrow–Scholze, Definition 13.5 and Construction 13.6, p.106.)

*Needs:* AdicSpacesPartII `R0`; AdicEtaleGeometry `A1`; AdicSpacesPartII `R0/smooth-toric-chart`.

### 2.2 Presented infinitesimal envelope

For a very small presentation define P_Σ=lim_n (B_dR⁺/ξ^n)⟨X_u^{±1}:u∈Σ⟩ and let e:P_Σ→R send X_u to u. Define `InfinitesimalEnvelope e` as lim_m P_Σ/(ker e)^m. Use `AdicCompletion (RingHom.ker e) P_Σ` for its underlying algebra, with the B_dR⁺ structure inherited from P_Σ. Its defining ideal is the whole presentation kernel, including the coordinate relations, and not just (ξ).

Extend the logarithmic derivations continuously and form the completed de Rham complex. A derivation may lower the ideal order by one, which is still continuous for the kernel-adic topology. The analytic presentation and the inverse limit retain their topologies; the algebraic completion API does not by itself supply the completed Tate algebra. For the universal extension property impose finite generation of ker e, J-adic completeness of the target P_Σ-algebra S and containment of the image of ker e in J.

Use `InfinitesimalEnvelope.of` for the compatible quotient images of a presentation element, `level` for projection to P/(ker e)^m and `level_of` for that quotient computation. Prove `ext` by equality at every level, and `complete` for finitely generated ker e. `map` sends a commuting presentation map to a map of envelopes; prove `map_of`, `map_id` and `map_comp`. `lift` extends the P-algebra map to a J-complete algebra S when ker e is finitely generated and its image lies in J; `lift_of` and `lift_unique` specify its values and uniqueness. The algebraic completeness theorem is not asserted for arbitrary infinitely generated ideals.

**Checks.**

- With e=id_B, the envelope is B and sends b to b under the canonical identification, including B=0.
- With e:Q[X]→Q sending X to zero, the second projection of the completed coordinate is its nonzero class in Q[X]/(X²).
- For that same presentation the completed X is nonzero although its first projection is zero. Defining the envelope as the first quotient would fail.

(Bhatt–Morrow–Scholze, Construction 13.6, p.106; Lemma 13.4, pp.105–106.)

*Needs:* Layer 2.1 (Very small affinoid embeddings); AdicSpacesPartII `R0`; Mathlib `AdicCompletion`; Mathlib `AdicCompletion.isAdicComplete`; Mathlib `AdicCompletion.eval_of`; Mathlib `AdicCompletion.ext`.

### 2.3 Noetherian approximation for embeddings

After enlarging Σ, descend a very small smooth affinoid R/C and its torus chart to a smooth affinoid R_A over a smooth affinoid algebra A of a complete discretely valued subfield K⊂C. Obtain R_A⊗̂_A C≃R and compatible Laurent generators Σ_A. This is a target of this roadmap, including the approximation lemmas needed to retain the chosen chart and surjection.

Prove that a sufficiently small perturbation of finitely many generators keeps the presentation surjective. Shrink around the rank-one point representing the C-valued fibre so the resulting rational neighbourhood retains fibrewise surjectivity. Use the p-power containment criterion for monic integral generators to control the integral subrings. Higher-rank points need not satisfy this neighbourhood conclusion. The output is a family with an explicit fibre map, so subsequent completed lifts can be compared with R.

(Bhatt–Morrow–Scholze, Lemmas 13.7–13.10, pp.106–109.)

*Needs:* AdicSpacesPartII `R0`; Layer 2.1 (Very small affinoid embeddings); AdicSpacesPartII `R0/smooth-toric-chart`.

### 2.4 Completed smooth lift over B_dR⁺

Given that noetherian approximation and a chosen lift A→B_dR⁺ of its C-valued point, form R_A⊗̂_A B_dR⁺. Construct the tensor through the integral p-adic completions and then invert p in the order used by the source. Prove ξ-adic completeness, flatness, reduction to R and topological freeness of the reductions modulo ξ^n.

The lift of A is part of this local calculation; it is not a canonical map C→B_dR⁺. Keep its scalar maps and the reduction isomorphism in the construction. The topologically free reductions permit the envelope calculation and the mod-ξ detection argument in the next subsections. Ordinary algebraic tensor without these completions would not describe the same rigid-analytic deformation.

(Bhatt–Morrow–Scholze, Lemma 13.11, pp.109–110.)

*Needs:* AdicSpacesPartII `R0`; AdicSpacesPartII `R3`; Layer 2.3 (Noetherian approximation for embeddings); EnhancedDerivedSheaves `E4`; AdicSpacesPartII `R0/differentials-unramified-smooth-etale`.

### 2.5 Embedding envelope normal form

For a sufficiently enlarged Σ, choose lifts ũ of the redundant units in the completed smooth lift. The d torus coordinates lift by formal étaleness. Prove an isomorphism of completed B_dR⁺-algebras

```text
D_Σ(R) ≃ (R_A ⊗̂_A B_dR⁺)[[X_u−ũ : u∈Σ\{T₁,…,T_d}]].
```

Use completion in all the displayed formal directions as well as ξ. The variables are the extra equations of the embedding, so a presentation containing only the d chart coordinates has no redundant-variable factor. Changing the chosen ũ changes this normal-form description, while the envelope and the ensuing refinement maps are defined from e itself. These choices will disappear by comparing the actual de Rham complexes.

(Bhatt–Morrow–Scholze, Lemma 13.12, pp.110–111.)

*Needs:* Layer 2.2 (Presented infinitesimal envelope); Layer 2.4 (Completed smooth lift over B_dR⁺); AdicSpacesPartII `R0`.

### 2.6 Embedding independence and de Rham reduction

For Σ⊂Σ′, prove the natural refinement on completed envelope de Rham complexes is a quasi-isomorphism. Reduction modulo ξ is the de Rham complex of R/C; after a spreading choice, identify it with the completed base extension of Ω^•_{R_A/A}. The continuous Poincaré calculation in each redundant formal variable controls the refinement, and derived-complete mod-ξ detection lifts the result.

Compare two spreading lifts by embedding both in a common enlarged presentation and compose the resulting quasi-isomorphisms. Prove the identity, transitivity and refinement cocycle laws at the complex level. The comparison of two lifts is part of the construction here; the source's comparison with one chosen lift does not alone make it canonical. Taking the filtered colimit of strict refinement maps then defines the coordinate-independent local presheaf.

(Bhatt–Morrow–Scholze, Lemma 13.13 and Definition 13.14, pp.111–112.)

*Needs:* EnhancedDerivedSheaves `E4`; Layer 2.5 (Embedding envelope normal form); AdicSpacesPartII `R0`; EnhancedDerivedSheaves `E4/mod-ideal-detection`.

### 2.7 Spreading out proper smooth rigid spaces

For proper smooth X/C, construct a proper smooth family over a smooth rigid base S defined over a complete discretely valued subfield K, with X its C-valued fibre. Start from a proper flat formal model and descend it over a complete noetherian local ring. Prove the artinian-thickening deformation and effectivity steps needed in the induction, and retain the chosen fibre identification.

Pass from the proper flat descent to a smooth neighbourhood only after checking smoothness around the fibre. Algebraization or effectivity by itself does not provide this spreading theorem. The target includes the deformation compatibility and the descent of coherent cohomology needed to apply a relative integrable connection in the finite-freeness proof. Properness is used throughout, whereas projectivity is not an assumption on X.

(Bhatt–Morrow–Scholze, Proposition 13.15 and Corollary 13.16, pp.112–113.)

*Needs:* AlgebraicModuliForArithmeticGeometry `R09.6`; AdicSpacesPartII `R2/raynaud-theorem`; AdicSpacesPartII `R2/admissible-blow-up`.

### 2.8 Canonical B_dR⁺ cohomology

Define `CanonicalBdrCohomology`, written K_dR⁺(X), for a proper smooth rigid space X/C by derived global sections of the envelope de Rham presheaf on the very-small basis. Its value on an affinoid is the filtered colimit of the completed D_Σ(R) complexes. Use the strict refinement maps just constructed, rather than a chosen global lift of X to B_dR⁺.

Prove the canonical θ-reduction K_dR⁺(X)⊗^L_{B_dR⁺}C≃RΓ_dR(X/C), derived ξ-completeness and perfectness in the proper smooth range. Package the pullback maps contravariantly. The independence theorem identifies two sufficiently large embedding systems by a specified quasi-isomorphism with the refinement cocycle, not only by equality of ranks. Finite freeness of individual H^i is a separate theorem below; a perfect complex over a DVR need not have free cohomology.

The API `CanonicalBdrCohomology.affinoid` identifies the very-small-affinoid complex with the filtered colimit of completed envelope de Rham complexes. `map` is contravariant, with identity and composition proved through common refinements. `theta` identifies its derived C-specialization with rigid de Rham cohomology. `complete` gives derived ξ-completeness and proper perfectness. `independent` provides canonical quasi-isomorphisms between sufficiently large embedding systems and their cocycle compatibility. Each of these API names belongs to `CanonicalBdrCohomology`.

**Checks.**

- For Spa C compute B_dR⁺ in degree zero and zero in every other degree.
- For P¹_C compute H⁰=B_dR⁺, H¹=0 and H²=B_dR⁺; θ-reduction gives the corresponding C de Rham groups.
- On a very small torus, adding a redundant unit to the embedding system gives the refinement quasi-isomorphism in every degree. No finite-dimensionality is claimed for the affinoid de Rham groups.

(Bhatt–Morrow–Scholze, Definition 13.18, p.114.)

*Needs:* Layer 2.6 (Embedding independence and de Rham reduction); AdicEtaleGeometry `A1`; EnhancedDerivedSheaves `E4`; AdicSpacesPartII `R3`; AdicSpacesPartII `R3/proper-affinoid-cohomology-finite`.

### 2.9 Finite freeness of B_dR⁺ cohomology

For proper smooth X/C, prove H^i(K_dR⁺(X)) is finite free over B_dR⁺ in every degree. Show that tensoring this group with C gives H_dR^i(X/C), and that its rank is the latter's dimension. Use proper smooth spreading and relative de Rham cohomology with integrable connection to establish local constancy of the ranks.

Perfectness of K_dR⁺ alone is insufficient: a two-term perfect complex can have ξ-torsion cohomology. The freeness proof must therefore invoke the family and its connection, not merely a general statement about perfect complexes. Once established, freeness removes the adjacent-degree Tor term for θ-reduction and supplies the genuine deformation lattice inside the rational étale realization.

(Bhatt–Morrow–Scholze, Theorem 13.19, p.114.)

*Needs:* Layer 2.8 (Canonical B_dR⁺ cohomology); Layer 2.7 (Spreading out proper smooth rigid spaces); Layer 2.4 (Completed smooth lift over B_dR⁺); AdicSpacesPartII `R3`.

### 2.10 Local B_dR period comparison map

For a very small U=Spa(R,R◦), adjoin compatible p-power roots of every u∈Σ. The all-coordinate perfectoid tower carries Γ=∏_Σ Z_p(1). Construct D_Σ(R)→B_dR⁺(R_∞,Σ) by X_u↦[u♭], preserving the coefficient map and the presentation relations. Compare the completed logarithmic de Rham complex with η_ξ of the tower's Γ-Koszul complex.

Normalize the logarithmic operators and the degree-one maps so that the refinement to a larger Σ commutes with the comparison. After inverting ξ, the local morphism is a quasi-isomorphism with pro-étale B_dR cohomology. Use the all-coordinate tower also for map agreement with the A_inf comparison; a torus chart with some redundant units omitted may compute an isomorphic object but does not automatically produce the same morphism.

(Bhatt–Morrow–Scholze, Theorem 13.1 proof, p.115; Proposition 12.9.)

*Needs:* AInfCohomology `AI.4`; Layer 2.2 (Presented infinitesimal envelope); AInfCohomology `AI.1`; PadicHodgeTheory `P8:local-rational`; AdicEtaleGeometry `A1`; PadicHodgeTheory `P8:local-rational/local-structure-of-structural-de-rham-sheaf`; PadicHodgeTheory `P8:local-rational/period-sheaves-on-profinite-products`; PadicHodgeTheory `P8:local-rational/rational-acyclicity-of-de-rham-period-sheaves`.

### 2.11 Canonical de Rham period comparison

For proper smooth X/C, globalize the local arrow to K_dR⁺(X)→RΓ(X_proét,B_dR⁺). Show it becomes a quasi-isomorphism after ξ inversion. The proper primitive comparison identifies the resulting target with RΓ_ét(X,Z_p)⊗^L_{Z_p}B_dR. Thus its degree-i map identifies H^i(K_dR⁺(X))⊗B_dR with H_ét^i(X,Z_p)⊗B_dR.

Use the early primitive finite-local-system and almost O⁺/p theorems with their corrected pro-étale covers, independently of this global de Rham result. This ordering prevents a primitive comparison proof from assuming the comparison it is meant to justify. The result here is the underlying rational comparison over C. The filtered over-C extension is a separate statement in Layer 4, with its cohomological filtration explicitly retained.

(Bhatt–Morrow–Scholze, Theorem 13.1 and proof, pp.104,115.)

*Needs:* Layer 2.8 (Canonical B_dR⁺ cohomology); Layer 2.10 (Local B_dR period comparison map); PadicHodgeTheory `P8:local-rational`.

### 2.12 Descended de Rham lattice

Suppose X=X₀⊗̂_K C with X₀ proper smooth rigid over a complete discretely valued K having perfect residue field. The canonical continuous lift K→B_dR⁺ gives an isomorphism H^i(K_dR⁺(X))≃H_dR^i(X₀/K)⊗_K B_dR⁺. Prove it using the common envelope comparison, including its functoriality in the descended space.

After inverting ξ, the étale comparison from this lattice equals the local-period-sheaf de Rham comparison. This is equality of maps through the common local complexes. Any two finite free modules of the same rank admit many isomorphisms, so a rank computation cannot replace this equality. The canonical K-lift and the choice-free envelope construction together distinguish the specified lattice from an arbitrary B_dR⁺ lattice in the same vector space.

(Bhatt–Morrow–Scholze, Remark 13.20, p.114; Theorem 13.1 proof diagram, p.115.)

*Needs:* Layer 2.8 (Canonical B_dR⁺ cohomology); Layer 2.6 (Embedding independence and de Rham reduction); Layer 2.11 (Canonical de Rham period comparison); PadicHodgeTheory `P8:local-rational`.

### 2.13 Filtered de Rham comparison over K

For that proper smooth X₀/K, prove the comparison c_dR:H_ét^i(X_C,Q_p)⊗B_dR≃H_dR^i(X₀/K)⊗_K B_dR is G_K-equivariant and strict for the filtrations. On the étale side use only the period filtration. On the de Rham side use the convolution

```text
Fil^r(H_dR ⊗ B_dR) = Σ_a Fil^a H_dR ⊗ Fil^{r−a} B_dR.
```

Transport the filtration by the descended lattice's actual comparison with the structural period-sheaf Poincaré map. Prove equality of filtration subspaces, not just containment of one image. The de Rham space is K-linear with its Hodge filtration, while the coefficient action on B_dR is semilinear. Both features matter for taking Galois invariants and for identifying Hodge–Tate weights.

(Scholze, p-adic Hodge theory, Theorem 8.4, p.48, and its proof, pp.47–48; BMS1 Theorem 5.1 and Theorem 13.1 proof.)

*Needs:* Layer 2.12 (Descended de Rham lattice); PadicHodgeTheory `P8:local-rational`; PadicHodgeTheory `P8:local-rational/poincare-lemma-and-faltings-extension`.

### 2.14 Hodge–de Rham degeneration

For every proper smooth rigid X/C in characteristic zero, prove E₁^{a,b}=H^b(X,Ω_X^a)⇒H_dR^{a+b}(X/C) degenerates at E₁. If X descends to K, apply the strict filtered comparison and the finite-dimensional cohomology inputs. In general use the proper smooth family and constancy of relative cohomology ranks to pass from descended fibres to X.

In degree n, obtain dim_C H_dR^n(X)=Σ_{a+b=n}dim_C H^b(X,Ω_X^a). This is the characteristic-zero rigid theorem; it does not assert degeneration for integral formal cohomology or the positive-characteristic special fibre. The sums are finite and the coherent cohomology groups are finite-dimensional by properness. Keep that finiteness before expressing the conclusion using natural-number dimensions.

(Bhatt–Morrow–Scholze, Theorem 13.3(i) and proof, pp.104,116.)

*Needs:* Layer 2.7 (Spreading out proper smooth rigid spaces); Layer 2.13 (Filtered de Rham comparison over K); AdicSpacesPartII `R3`.

### 2.15 Hodge–Tate degeneration

For proper smooth X/C, prove degeneration at E₂ of E₂^{a,b}=H^a(X,Ω_X^b)(−b)⇒H_ét^{a+b}(X,Q_p)⊗C. The sign of the Tate twist is −b in the Hodge–Tate convention fixed above. Derive the dimension equality from the canonical finite-free B_dR⁺ lattice and Hodge–de Rham degeneration, using the proper primitive finiteness theorem to identify the étale rank.

A degree-two class on P¹ has b=1 and twist (−1); this is the basic sign check. Degeneration supplies a filtration with these associated graded pieces. It does not supply a canonical splitting in every descended family. Preserve the spectral-sequence indexing independently of the E₁ indexing of the preceding de Rham sequence.

(Bhatt–Morrow–Scholze, Theorem 13.3(ii) and proof, pp.105,116.)

*Needs:* Layer 2.14 (Hodge–de Rham degeneration); Layer 2.9 (Finite freeness of B_dR⁺ cohomology); Layer 2.11 (Canonical de Rham period comparison); PadicHodgeTheory `P8:local-rational`.

### 2.16 The canonical B_dR⁺ lattice in good reduction

For proper smooth formal 𝔛/O_C, with generic fibre X_C and Y=𝔛_{O_C/p}, construct the comparison

```text
RΓ_crys(Y/A_cris) ⊗^L_{A_cris} B_dR⁺ ≃ K_dR⁺(X_C).
```

Build it from the PD and infinitesimal envelopes on common local embeddings. Its cohomology-level map gives H_crys^i(Y/A_cris)⊗B_dR⁺≃H^i(K_dR⁺(X_C)); justify this passage by the rational crystalline freeness and coefficient base-change theorem. The target is the canonical deformation lattice, not only the rationalized vector space. Agreement with the étale map is the next target and cannot be inferred from this lattice identification alone.

(Bhatt–Morrow–Scholze, Proposition 13.23, p.117.)

*Needs:* Layer 2.8 (Canonical B_dR⁺ cohomology); Layer 2.2 (Presented infinitesimal envelope); AInfCohomology `AI.4`; CrystallineCohomology `CR.2`; CrystallineCohomology `CR.3`.

### 2.17 Agreement of integral and rational period maps

Extend the A_inf/A_cris comparison and its μ-inverted étale map to B_dR, and prove their resulting map equals the canonical envelope de Rham/étale comparison under the preceding lattice identification. On a common all-coordinate tower, both degree-zero maps send X_u to [u♭]. Compare the normalized logarithmic Koszul operators, then the degree-one morphisms and the homotopies needed for their products and refinements.

Carry the equality through derived scalar associativity and global descent. This supplies a full natural-transformation identity where the source gives only a short explicit-complex verification. For X descending to K, also compare with the early structural period-sheaf map. The target is map agreement; no argument based only on equal ranks or equal source and target modules establishes it.

(Bhatt–Morrow–Scholze, Theorem 14.5(i) proof, p.121; Theorem 13.1 proof, p.115.)

*Needs:* Layer 2.16 (The canonical B_dR⁺ lattice in good reduction); Layer 2.10 (Local B_dR period comparison map); AInfCohomology `AI.4`.

### 2.18 Relative B_dR⁺ infinitesimal site

For a smooth morphism f:X→Y of smooth formal O_K-schemes and the specified O_K→B_dR⁺, define `RelativeInfinitesimalSite` X/Y_{B_dR⁺,inf}. Its objects are pairs (U,T): U is open in X_C, T is topologically finite type over Y_{B_dR⁺/I^e} for a positive finite level e, and U→T is a nilpotent Zariski closed immersion compatible with the base maps. Morphisms commute with those immersions and are open immersions on U; covers simultaneously cover U and T in their analytic topologies.

Set O_inf(U,T)=Γ(T,O_T) with its restriction maps. Use the cartesian crystal condition of the sheaf/crystal theory to define coefficients. The ind-system of infinitesimal neighbourhoods in a smooth ambient Z is weakly final: existence of a local lift, not uniqueness of an ambient map, is the property used by Čech descent. Include its self-products, which give the diagonal embedding envelopes.

Use `RelativeInfinitesimalSite.object` for the finite-level base-compatible nilpotent thickenings and `morphism` for their commuting adic maps and open immersions; prove identity and composition. `structureSheaf` evaluates Γ(T,O_T) with its restriction maps. `baseChange` pulls back relative thickenings and cartesian crystals along a compatible base change. `envelope` identifies the ind-system of infinitesimal neighbourhoods in a smooth ambient lift as weakly final, with its diagonal self-products as in GR Lemma 10.3, p.94.

**Checks.**

- Over the point, the structure-sheaf cohomology of Spa C is B_dR⁺ in degree zero.
- For an identity relative smooth morphism the relative de Rham complex has only degree zero and agrees with its Čech-envelope calculation.
- A nilpotent thickening without a map to the specified finite-level Y base is not a relative object, even when it is an absolute B_dR⁺ thickening.

(Guo–Reinecke, Definition 10.1, p.94.)

*Needs:* AdicSpacesPartII `R0`; AdicEtaleGeometry `A1`; CrystallineCohomology `CR.1`; CrystallineCohomology `CR.1/crystal`.

### 2.19 Relative Čech–de Rham comparison

For a vector-bundle crystal F on the relative site and a smooth ambient embedding, prove the Čech–Alexander complex of the weakly final envelope computes RΓ_inf(X/Y_{B_dR⁺},F). Compare it with the completed relative de Rham complex of F evaluated on that envelope. The coefficient connection is the one supplied by the crystal's cartesian descent, and the morphisms are natural in F and the embedding.

In the formal affine smooth setup, use the canonical lift and an enlarged Laurent framing to construct the particular equivalences in GR Corollary 10.8. The ambient envelope has an ind-system of nilpotent neighbourhoods; treating it as a single final object would give an incorrect proof. Retain the completion topology on the relative differentials when identifying the two complexes.

(Guo–Reinecke, Construction 10.6 and Theorem 10.7, pp.95–96; Corollary 10.8, p.97.)

*Needs:* Layer 2.18 (Relative B_dR⁺ infinitesimal site); Layer 2.2 (Presented infinitesimal envelope); CrystallineCohomology `CR.2`; EnhancedDerivedSheaves `E4`; CrystallineCohomology `CR.2/embedding-computation`; CrystallineCohomology `CR.2/smooth-lift-filtration`.

### 2.20 Relative infinitesimal perfectness

If f:X→Y is proper smooth between smooth formal O_K-schemes, Y=Spf R and F is a vector-bundle crystal on the relative infinitesimal site, prove RΓ_inf(X/Y_{B_dR⁺},F) is perfect over R_{B_dR⁺}. Identify its derived I-reduction with relative de Rham cohomology of the associated vector bundle with flat connection on X_C/Y_C.

The theorem supplies perfectness and derived base change. It does not imply that all higher direct images are free over an arbitrary base. For a proper smooth connected genus-g curve over a point and the trivial rank-one crystal, the fibre ranks are 1,2g,1 in degrees 0,1,2. An arbitrary vector-bundle crystal need not have those ranks. That distinction separates the general perfectness statement from the worked curve calculation.

(Guo–Reinecke, Corollaries 10.8–10.9, p.97.)

*Needs:* Layer 2.19 (Relative Čech–de Rham comparison); EnhancedDerivedSheaves `E4`; AdicSpacesPartII `R3`.

### 2.21 Crystalline-to-infinitesimal coefficient functor

Construct the coefficient functor D_perf(X_{p=0,crys})→D_perf(X/Y_{B_dR⁺,inf}) and show it sends vector-bundle crystals to vector-bundle crystals. On a chosen enlarged framing, its value is E′(D_pd,Σ^n)⊗^L_{D_pd,Σ^n}D_Σ^n. Define the ring map by first inverting p and then completing along the full embedding ideal.

Prove compatibility of these local extensions with the crystal transition isomorphisms and with self-products of the embedding. They are the descent data needed to globalize the functor. The PD envelope and the infinitesimal envelope are different rings with different completions; one cannot replace the coefficient functor by an unnamed identification of their module categories.

(Guo–Reinecke, Proposition 10.10 and proof, pp.97–98.)

*Needs:* CrystallineCohomology `CR.0`; Layer 2.19 (Relative Čech–de Rham comparison); CrystallineCohomology `CR.1/crystal`; CrystallineCohomology `CR.0/fontaine-envelope`.

### 2.22 Relative crystalline–infinitesimal base change

For the smooth relative affine setup of GR Convention 10.4 and a vector-bundle crystalline crystal E′, compare its crystalline cohomology over R, its crystalline cohomology over R_Acrys, and the infinitesimal cohomology of the resulting F over R_B_dR⁺. Each identification uses the specified completed B_dR⁺ scalar extension. Construct the comparison from the preceding coefficient functor on the same Čech envelopes.

Check the induced connections agree: the infinitesimal connection is the ker θ̃_K-completion of ∇_crys[1/p]. State the three arrows and the scalar maps of equation (36), rather than an uncompleted base-change equality. Compatibility with the connection is required for the later section-independent structural OB_dR comparison and its Hodge filtration.

(Guo–Reinecke, Proposition 10.11, pp.98–99, equation (36).)

*Needs:* Layer 2.21 (Crystalline-to-infinitesimal coefficient functor); Layer 2.19 (Relative Čech–de Rham comparison); CrystallineCohomology `CR.3`; EnhancedDerivedSheaves `E4`; CrystallineCohomology `CR.3/derived-base-change`; CrystallineCohomology `CR.3/proper-perfectness`.

### 2.23 Absolute and relative infinitesimal agreement

For smooth X/C over the point, prove the infinitesimal cohomology defined by completed thickenings agrees with the canonical BMS envelope cohomology. The relative construction specializes to the absolute one on the same embedding ideals. Compare the Čech–de Rham computations and their refinement maps to obtain a natural equivalence, not only a comparison after ξ inversion.

The smooth statement is the input here. Guo's proper singular comparison additionally uses éh descent and the derived de Rham construction; those are required in the separate singular coefficient interface of the suppliers. A smooth-envelope calculation alone proves no singular extension. In the point case both constructions give B_dR⁺ in degree zero, providing the normalization of the equivalence.

(Guo, Theorem 1.2.7 and Corollary 1.2.11, pp.5–6; Guo, Definition 2.2.1, Remarks 2.2.2–2.2.4, pp.12–13; Lemma 4.1.10, p.31.)

*Needs:* Layer 2.8 (Canonical B_dR⁺ cohomology); Layer 2.19 (Relative Čech–de Rham comparison).

### Examples

For e:Q[X]→Q, X↦0, the envelope is the (X)-adic completion: X mod X² is nonzero but X mod X is zero. This detects the full embedding ideal. On P¹_C the canonical B_dR⁺ groups are rank one in degrees zero and two and zero in degree one. Adding a redundant unit to a torus presentation changes its envelope model but not its de Rham cohomology. In a relative thickening the map to the specified base is indispensable.

### Dependencies

Layer 0 and the integral maps of Layer 1 for good-reduction agreement; AdicSpacesPartII R0/R2/R3 and AlgebraicModuliForArithmeticGeometry R09.6 for the local and proper approximation; PadicHodgeTheory P8 local-rational and R06.1 for periods; EnhancedDerivedSheaves E2/E4 for completion, descent and filtrations; CrystallineCohomology CR.1–CR.3 for coefficients; PrismaticCohomology PR.7 for the full relative analytic F-crystal comparison. The latter must have the GR Theorem 9.15 range specified in its contract.

## Layer 3: Rational crystalline comparison and nearby cycles

### 3.1 Residue-section descent adapter

Apply the rational crystalline base-change theorem to relate the O_C/p object to the W(k) object. Given the appropriate section of the residue map, construct H_crys^i(Y/A_cris)[1/p]≃H_crys^i(𝔛_k/W(k))⊗A_cris[1/p] and compose it with the rational period comparison. For a descended O_K-model, normalize the section through the Witt lift W(k)→O_K and a sufficiently small nilpotent reduction.

Show exactly where W(k) is extended to W(k̄) and where Frobenius acts on its coefficients. The original section must remain visible for a general O_C-model. Any section-independence statement is restricted to the source's hypotheses, and all these maps are rational; no integral invariance under arbitrary sections is claimed. The affine Frobenius-isogeny/base-change proof is part of the required crystalline supplier contract.

(Bhatt–Morrow–Scholze, Proposition 13.21 and Remark 13.22, p.116; Theorem 14.6 proof, p.122.)

*Needs:* CrystallineCohomology `CR.3`; CrystallineCohomology `CR.3:Frobenius-isogeny`; Layer 0.1 (Normalized specialization diagram).

### 3.2 From derived to rational cohomology

Prove the cohomology-level passage used above for the proper perfect K_A whose H^j[1/p] are free. Localization A_cris→B_cris at μ is flat, and B_cris is Z_p-flat. Identify the natural maps from the ordinary scalar extensions of H^i to H^i of the corresponding derived scalar extensions, using the rational A_inf finiteness in the remaining passage.

Track these maps in the comparison diagram rather than replacing them by chosen inverses of unrelated group isomorphisms. The argument concerns rational period coefficients. It proves no integral formula H^i(K_A⊗^L W(k))=H^i(K_A)⊗W(k). In the latter calculation the next-degree Tor term is the precise obstruction addressed by the adjacent-degree freeness hypotheses of Layer 5.

(Bhatt–Morrow–Scholze, Theorems 14.3–14.5, pp.119–121; §1.2, p.6.)

*Needs:* AInfCohomology `AI.5`; Layer 1.1 (Proper smooth A_inf input package); Layer 1.5 (Integral A_cris specialization); Mathlib `DerivedCategory`; Mathlib `TensorProduct`.

### 3.3 Rational crystalline comparison over O_C

For proper smooth formal 𝔛/O_C, compare H_crys^i(𝔛_{O_C/p}/A_cris)⊗_{A_cris}B_cris with H_ét^i(X_C,Z_p)⊗_{Z_p}B_cris, for every i≥0. Construct the isomorphism by extending the A_cris and μ-inverted A_inf maps, using B_cris=A_cris[1/μ]. The rational freeness theorem for the geometric A_inf complex justifies passage from the derived maps to these degreewise tensors.

After extending to B_dR, prove the comparison agrees with the canonical K_dR⁺ lattice comparison under the good-reduction identification. The compatibility includes the actual local morphisms of Layer 2. Over O_C alone this theorem is not a statement about a G_K representation until descent data are supplied. It retains the O_C/p crystalline object rather than substituting residue-field cohomology by an unrecorded section.

(Bhatt–Morrow–Scholze, Theorem 14.5(i), pp.120–121.)

*Needs:* Layer 1.5 (Integral A_cris specialization); Layer 1.6 (Étale specialization after μ inversion); Layer 2.16 (The canonical B_dR⁺ lattice in good reduction); CrystallineCohomology `CR.3`; Mathlib `TensorProduct`.

### 3.4 Crystalline comparison over a discretely valued base

For proper smooth formal 𝔛₀/O_K with K complete discretely valued over Q_p and perfect residue k, obtain

```text
H_ét^i(X_C,Z_p) ⊗ B_cris ≃ H_crys^i(𝔛₀,k/W(k)) ⊗ B_cris.
```

Prove G_K equivariance and Frobenius compatibility, and prove the induced B_dR map preserves the convolution Hodge filtration. Use the preceding O_C theorem, the canonical residue-section descent, and the equality of de Rham comparison maps from Layer 2. These ingredients yield that H_ét^i(X_C,Q_p) is crystalline. Proper smooth formal is the full geometric hypothesis; no algebraic projective model is required. The filtration is read only after the specified embedding into B_dR.

(Bhatt–Morrow–Scholze, Theorem 14.6(i), pp.121–122.)

*Needs:* Layer 3.3 (Rational crystalline comparison over O_C); Layer 3.1 (Residue-section descent adapter); Layer 2.12 (Descended de Rham lattice); Layer 2.13 (Filtered de Rham comparison over K); PadicHodgeTheory `R06.2`.

### 3.5 Crystalline representation export

For the proper smooth good-reduction representation V=H_ét^i(X_C,Q_p), take G_K invariants of the B_cris comparison to identify D_cris(V) with H_crys^i(𝔛₀,k/W(k))[1/p] as a φ-module. The dimension criterion follows from B_cris^{G_K}=K₀ and the period functor's admissibility theory. After K₀→K, the filtered realization is H_dR^i(X_K/K).

Use the rational period functors and their fully specified coefficient embeddings supplied by p-adic Hodge theory. This target connects geometric cohomology with those functors; it does not rebuild them. In particular the perfect residue-field hypothesis controls K₀ and the canonical K-lift. A representation merely known to be de Rham is not covered by the good-reduction crystalline conclusion.

(Bhatt–Morrow–Scholze, Theorem 14.6(i), p.121.)

*Needs:* Layer 3.4 (Crystalline comparison over a discretely valued base); PadicHodgeTheory `R06.1`; PadicHodgeTheory `R06.2`; PadicHodgeTheory `R06.2/admissible-representations`; PadicHodgeTheory `R06.2/admissible-implies-weakly-admissible`.

### 3.6 Good reduction examples

Transport the supplied crystalline calculation for an ordinary good-reduction elliptic curve: its degree-one Newton slopes are 0 and 1. For a supersingular curve the two slopes are 1/2. In both cases the Hodge numbers in degree one are 1,1. Identify these φ-modules with D_cris of the actual étale representation via the comparison, retaining the Hodge filtration on the K-realization.

These examples distinguish the crystalline slope data from the Hodge filtration. The proper smooth formal theorem also covers a model whose generic fibre is nonprojective whenever such a model is given. No existence theorem for a particular nonprojective example is inferred from the comparison itself. This application records the absence of projectivity from its hypotheses while keeping the supplied geometric computation separate.

(Bhatt–Morrow–Scholze, Theorem 14.6, p.121.)

*Needs:* Layer 3.5 (Crystalline representation export); CrystallineCohomology `CR.3`.

### 3.7 Graded Beilinson square

For a quasisyntomic Z_p-algebra R and i≥0, construct the natural map χ_i:Q_p(i)(R/p)→(LΩ_R)_Qp and prove that the square

```text
Q_p(i)(R)   ─────────→  Q_p(i)(R/p)
   │                        │ χ_i
   ▼                        ▼
(LΩ_R^{≥i})_Qp ───────→ (LΩ_R)_Qp
```

is homotopy cartesian in the enhanced derived category. Here Q_p(i) is the supplied p-adic syntomic complex, LΩ is the p-completed derived de Rham complex, and the lower arrow is the Hodge-filtration inclusion. Construct χ_i and its homotopy locally on quasiregular semiperfectoid rings, then descend on the quasisyntomic site. The local proof builds the finite-weight cyclotomic calculation used in AMMN, rather than importing a trace-comparison theorem: form the cyclic derived bar construction for HH(R/Z), its circle homotopy fixed points HC⁻ and Tate object HP, and the spectral cyclic bar construction THH(R), with its p-typical cyclotomic Frobenius. Compute p-complete TC as the enhanced fibre of can−φ:THH(R)^{hS¹}→THH(R)^{tS¹}. Construct the natural rational square TC(R)→TC(R/p) over HC⁻(R)→HP(R), including its right vertical map. The proof uses the norm triangle ΣX_{hS¹}→X^{hS¹}→X^{tS¹}, the p-typical Tate-orbit calculation and the Bökstedt computation for F_p; these local intermediate results are part of this construction (AMMN Definition 2.1, Construction 2.6, Theorem 2.12 and Corollary 3.9, pp.7–11,18).

On quasiregular semiperfectoid rings the cyclic objects in the lower row are even, so extract the two-degree window [2i−1,2i] and apply the degree-normalizing shift. Identify its upper terms with the supplied syntomic complexes and its lower terms with Hodge-completed derived de Rham. To remove Hodge completion from χ_i, prove the uniform denominator bound in the fixed weight i, restrict to finitely generated p-complete polynomial algebras and left Kan extend. This gives a map Z_p(i)(R/p)→p^{−N(i)}LΩ_R; after rationalization it gives χ_i to the uncompleted Hodge object, and quasisyntomic descent gives the displayed square (AMMN proof of Theorem 6.17, pp.44–45). No bound uniform in all i is asserted. Construct the reduction homotopy on these maps before descent. The assertion belongs to the comparison theory here; neither the full algebraic K-theory fiber square nor a general trace roadmap is a prerequisite. The proof must include the filtered identification and rational homotopy, rather than assuming this cartesian square as part of its data. (Antieau–Mathew–Morrow–Nikolaus, Theorem 6.17 and proof, pp.44–45.)

Prove naturality `gradedBeilinsonSquare_map`, weight-zero compatibility `gradedBeilinsonSquare_zero` and the defining pullback equivalence `gradedBeilinsonSquare_cartesian`. Use the syntomic complexes of PrismaticCohomology PR.4, the derived de Rham filtration of DerivedDeRhamCohomology DD.2, and enhanced filtered completion and rationalization from EnhancedDerivedSheaves E4. The maps are the natural ones determined by these constructions.

**Checks.**

- At i=0 the lower filtration inclusion is the identity; the pullback therefore makes the upper reduction map an equivalence.
- At the crystalline point Spec F_p, Frobenius on Q_p is the identity. The degree-one operator 1−φ/p is multiplication by 1−1/p≠0, so its derived fibre is zero.
- At weight zero for that point the operator is zero. Its derived fibre retains the degree-shifted term, and cannot be replaced by its ordinary kernel alone.

*Needs:* PrismaticCohomology PR.4 syntomic complexes; DerivedDeRhamCohomology DD.2 p-completed derived de Rham complexes; EnhancedDerivedSheaves E4 stable enhancements, rationalization and enhanced fibres, and DD.1 derived completion. Circle actions, the norm/Tate constructions, the local cyclotomic calculation and its two-degree filtered identification are intermediate constructions here; generic filtered derived-category machinery does not supply them as an axiom. The filtered comparison map χ_i and its cartesian property are targets of this subsection.

### 3.8 Nearby-cycle crystalline–de Rham pullback

Let 𝔛₀/O_K be smooth proper, with the standing perfect-residue mixed-characteristic DVR assumptions. Write 𝔛 for its completed O_C base change, X₀ for the rigid generic fibre and 𝔛̄₀ for reduction modulo the uniformizer π. For every i≥0, construct the homotopy-cartesian square in D(Q_p) with corners

```text
RΓ(𝔛_proét, τ≤i Rψ_*Q_p(i)) → (A_cris ⊗^L_{W(k)} RΓ_crys(𝔛̄₀/W(k)))^{φ=p^i}[1/p]
                ↓                                      ↓
Fil≥i(RΓ_dR(X₀/K) ⊗^L_K B_dR⁺) → RΓ_dR(X₀/K) ⊗^L_K B_dR⁺.
```

The bottom arrow is the filtration inclusion. Define the upper-right eigenspace as the derived fibre of φ−p^i on the underlying integral complex, followed by p-inversion. The upper-left truncation is taken on the nearby-cycle sheaf before derived global sections. Use the finite Hodge filtration convolved with the ξ-adic period filtration on the lower row.

Build the required graded Beilinson-square specialization here from the syntomic and derived de Rham inputs. Transport its commutativity homotopy along the explicit corner identifications. In the triangulated shadow, the maps are TL→TR⊕BL with components (top,left), and TR⊕BL→BR with components (right,−bottom); their composite is zero and they extend to a distinguished triangle. Establishing equality with an independently normalized classical Fontaine map is a further map-agreement assertion, not a consequence of the homotopy pullback theorem. At i=0 the statement still uses derived fixed points and sheaf truncation, with no positive-twist shortcut.

(Antieau–Mathew–Morrow–Nikolaus, Definition 7.10 and Theorem 7.11, p.52; Construction 7.12, Theorem 7.13 and proof, pp.53–54; Theorem 6.17, pp.44–45.)

*Needs:* Layer 0.1 (Normalized specialization diagram); Layer 3.7 (Graded Beilinson square); PrismaticCohomology `PR.4/syntomic-complex`; DerivedDeRhamCohomology `DD.2/p-completed-derham`; CrystallineCohomology `CR.3/kunneth`; CrystallineCohomology `CR.3/proper-perfectness`; EnhancedDerivedSheaves `E4`; PrismaticCohomology `PR.4`; DerivedDeRhamCohomology `DD.2`.

### Examples

For proper good reduction the rational comparison recovers the expected unramified/crystalline representation; projective space supplies each Tate degree. In the graded square the point Spec F_p at weight one has operator 1−1/p, hence zero derived fibre after rationalization. At weight zero the operator is zero and its shifted fibre term survives. The homotopy-pullback triangle uses the arrow (right,−bottom): if both corner maps are the identity, the diagonal followed by this arrow is x−x=0, rather than x+x.

### Dependencies

Layers 0–2; CrystallineCohomology CR.3 Frobenius-isogeny and residue-section descent; AInfCohomology AI.2/AI.5; PadicHodgeTheory R06.1–R06.2; PrismaticCohomology PR.4 syntomic cohomology; DerivedDeRhamCohomology DD.1–DD.2 completion and Hodge-completed tensors; EnhancedDerivedSheaves E4 enhanced fibres. The local cyclic calculation and graded Beilinson square are constructed in this layer.

## Layer 4: Semistable and logarithmic comparison

### 4.1 Logarithmic integral comparison adapter

Let 𝔛₀ be proper flat p-adic formal over O_K, with its divisorial log structure and an étale cover by semistable charts t₀⋯t_r=π′, where π′ is a nonzero nonunit and may vary with the chart. Keep the pure-dimensional special-fibre assumption of CK §7.1. After O_C base change, place the supplied semistable A_inf complex and its θ-log de Rham, Witt-log crystalline, A_cris-log crystalline and μ-inverted étale maps in the coefficient diagram.

Record the logarithmic bases explicitly: W(k̄) with the Q_{≥0} log base occurs in the geometric integral construction, while W(k₀) with N→W(k₀), 1↦0 occurs in arithmetic Hyodo–Kato theory. Properness remains part of the étale comparison. Products are retained only in the source-proved range; the full all-coordinate semistable A_cris morphism is not asserted to be multiplicative from the smooth theorem.

(Česnavičius–Koshikawa, §7.1–7.2, pp.68–69; Corollary 5.43, pp.58–59; Theorem 2.3, p.9.)

*Needs:* AInfCohomology `AI.6/log-de-rham`; AInfCohomology `AI.6/global-crystalline`; AInfCohomology `AI.6/etale-comparison`; AInfCohomology `AI.6/crystalline-de-rham-square`; Layer 0.1 (Normalized specialization diagram).

### 4.2 Hyodo–Kato log-base adapter

Construct the B_st⁺ base-change adapter between geometric log crystalline cohomology and arithmetic Hyodo–Kato cohomology, keeping the two log bases above distinct. The CK Proposition 9.2 map preserves φ and N. On the Hyodo–Kato tensor, N is N_HK⊗1+1⊗N_Bst; on the A_cris tensor it acts on the period coefficient only.

Supply descent from k̄ to k₀ using the exact arithmetic log-base comparison. The period map does not by itself identify the integral log objects or their coefficient fields. G_K acts semilinearly on the unramified extension F^{nr}; an element acting nontrivially on k̄ does not fix that coefficient field pointwise. Carry this action into the balanced tensor and into subsequent period invariants.

(Česnavičius–Koshikawa, Proposition 9.2 and Remark 9.3, pp.75–76.)

*Needs:* AInfCohomology `AI.6/hyodo-kato-interface`; CrystallineCohomology `CR.6`; PadicHodgeTheory `R06.1`; Layer 4.1 (Logarithmic integral comparison adapter); CrystallineCohomology `CR.6/integral-hk`; CrystallineCohomology `CR.6/n-phi-relation`.

### 4.3 Semistable period comparison

Under the proper semistable formal hypotheses above, with perfect residue k₀, prove a natural G_K-equivariant derived equivalence

```text
RΓ_ét(X_C,Z_p) ⊗^L B_st ≃ RΓ_logcrys(𝔛₀,k₀/W(k₀)) ⊗^L B_st.
```

The arithmetic log base is N→W(k₀), 1↦0. The comparison respects φ and total N, with Nφ=pφN. Its degreewise consequence identifies the semistable period module and proves H_ét^i(X_C,Q_p) semistable over K. Use the log-base adapter and the actual semistable A_inf maps in constructing this equivalence. Potential semistability of a general proper rigid space, proved below, is a different theorem and has a different descent object.

(Česnavičius–Koshikawa, Theorem 9.5, p.76.)

*Needs:* Layer 4.1 (Logarithmic integral comparison adapter); Layer 4.2 (Hyodo–Kato log-base adapter); CrystallineCohomology `CR.6`; PadicHodgeTheory `R06.1`; PadicHodgeTheory `R06.2`; PadicHodgeTheory `R06.2/admissible-representations`; PadicHodgeTheory `R06.1/semistable-period-ring`.

### 4.4 Semistable de Rham agreement

Choose an A_cris-algebra embedding B_st→B_dR of the Fontaine/CK kind. Extend the semistable period comparison along it and prove equality with the canonical de Rham comparison in the intersection of their hypotheses. Use CK Proposition 6.8 on the actual integral-to-de Rham morphisms before passing to cohomology.

Transport the Hodge filtration through the corresponding Hyodo–Kato-to-de Rham identification; the resulting B_dR isomorphism is strict. The embedding is a choice, so B_st does not acquire a choice-free filtration simply from this statement. Changing the choice is governed by the signed monodromy transport next. Include the scalar and logarithm conventions in both sides of the agreement, rather than saying only that some filtered period isomorphism exists.

(Česnavičius–Koshikawa, Remark 9.6, p.77; Proposition 6.8, pp.66–68.)

*Needs:* Layer 4.3 (Semistable period comparison); Layer 2.12 (Descended de Rham lattice); Layer 2.13 (Filtered de Rham comparison over K); AInfCohomology `AI.6/etale-bdr-agreement`.

### 4.5 Uniformizer change and monodromy transport

Normalize the torsor coordinate by T_{πu}=T_π+log_K(u), for a uniformizer π and u∈O_Kˣ, and take period monodromy N_Bst=−d/dT. Define ρ_π by evaluating sections killed by total monodromy at T_π=0. Such a section associated to x is exp(T_π N_HK)x. In the new coordinate it is exp((T_{πu}−log_K(u))N_HK)x; consequently the signed target is

```text
ρ_{πu} = ρ_π ∘ exp(−log_K(u) N_HK).
```

Prove nilpotence of the cohomological N_HK and the unit cocycle, using additivity of log_K and the finite exponential. Translate the arithmetic supplier's convention to this evaluation convention explicitly; a supplier using the opposite N has the opposite sign. CK §9.1 establishes the torsor-coordinate translation and N_Bst, not by itself the arithmetic uniformizer formula.

The two-term witness is N(e₁)=e₀ and N(e₀)=0. Then exp(−cN)e₁=e₁−ce₀ and exp(−cN)e₀=e₀. This pins both the sign and the direction of coordinate transport. At u=1 the map is the identity; at N=0 the uniformizer choice disappears.

(Česnavičius–Koshikawa, §9.1, p.75.)

*Needs:* CrystallineCohomology `CR.6`; PadicHodgeTheory `R06.1`; Layer 4.4 (Semistable de Rham agreement); CrystallineCohomology `CR.6/uniformizer-change`.

### 4.6 Log prismatic comparison boundary

For the precise bounded logarithmic prisms and log-smooth Cartier-type objects with exact charts furnished by logarithmic prismatic theory, compare its log-crystalline, log-de Rham and étale maps with the semistable A_inf maps. Prove the comparison of source complexes, completion ideals and Frobenius pullbacks first, and then the map identities in the integral diagram and after rational period extension.

Use the actual semistable chart class and the log Hyodo–Kato isomorphism of the supplier. This includes its boundedness and its exactness conditions. Nothing in the target extends automatically to all fs log schemes, nonvertical log structures or arbitrary nonexact charts. Multiplicative refinements remain tied to the explicitly supplied log comparison, rather than being deduced by replacing a smooth prism with a logarithmic one.

(Česnavičius–Koshikawa, §9 introduction and Theorem 9.5, pp.75–76.)

*Needs:* Layer 4.1 (Logarithmic integral comparison adapter); Layer 4.2 (Hyodo–Kato log-base adapter); PrismaticCohomology `PR.8/log-crystalline-comparison`; PrismaticCohomology `PR.8/log-de-rham-comparison`; PrismaticCohomology `PR.8/etale-comparison-over-ainf`; PrismaticCohomology `PR.8/semistable-aomega-comparison`; PrismaticCohomology `PR.8/log-hyodo-kato-isomorphism`.

### 4.7 Good reduction and Tate-curve monodromy

For a proper smooth good-reduction model, the supplied Hyodo–Kato calculation has N=0. Prove the semistable comparison specializes to the crystalline comparison through the common period embedding. For a split Tate elliptic curve E_q with q nonzero and of positive valuation, use its two-dimensional Hyodo–Kato module with nonzero rank-one N.

In a compatible basis take N(e₁)=e₀, N(e₀)=0, φ(e₀)=e₀ and φ(e₁)=pe₁, giving Nφ(e₁)=pe₀=pφN(e₁). The de Rham filtration records the chosen logarithm of q after the period embedding. This shows why the Tate-curve representation is semistable but not crystalline, and supplies a concrete test that a comparison preserving only φ would miss. Keep the logarithm branch and uniformizer normalization tied to the preceding transport theorem.

(Česnavičius–Koshikawa, §9 introduction, p.75; Theorem 9.5, p.76; §9.1, p.75.)

*Needs:* Layer 4.3 (Semistable period comparison); Layer 4.4 (Semistable de Rham agreement); Layer 3.4 (Crystalline comparison over a discretely valued base); CrystallineCohomology `CR.6`; PadicHodgeTheory `R06.2`; CrystallineCohomology `CR.6/hk-good-reduction`; CrystallineCohomology `CR.6/hk-tate-curve`.

### 4.8 Algebraic period comparison without smoothness

For any algebraic variety X_K/K and every r≥0, construct Beilinson's B_st-linear, G_K-equivariant comparison H_ét^r(X_K̄,Q_p)⊗B_st≃H_HK^r(X_K̄)⊗_{F^{nr}}B_st. It preserves φ and N and induces the filtered comparison with H_dR^r(X_K). Smoothness and properness are not hypotheses here.

Use the h-descent Hyodo–Kato and de Rham realizations for arbitrary varieties, including the original algebraic comparison and the compatible descent maps. Those constructions are required supplier inputs; the cohomology of a smooth proper semistable model does not define them for a singular or open variety. The Galois action on the right includes its semilinear action on F^{nr}. This theorem follows the source's algebraic scope, while the rigid statements below use overconvergent analytic constructions.

(Colmez–Nizioł, Theorem 6.2 and footnote 17, p.40.)

*Needs:* CrystallineCohomology `CR.6`; AlgebraicModuliForArithmeticGeometry `R09.7`; PadicHodgeTheory `R06.2`; EnhancedDerivedSheaves `E2/bounded-below-hypercover-descent`; EnhancedDerivedSheaves `E2`.

### 4.9 Period recovery and Hom descriptions

For the preceding algebraic variety, recover its rational étale group as the intersection of (H_HK^r⊗B_st)^{φ=1,N=0} with Fil⁰(H_dR^r⊗B_dR) through the comparison maps. The Frobenius and monodromy fixed conditions refer to the total operators on the tensor. The filtration uses the same chosen period embedding as the de Rham comparison.

Prove the two dual descriptions in the source's scope: Hom^sm_{G_K}(H_ét^r,B_st)≃(H_HK^r)^* as (φ,N,G_K)-modules, and Hom_{G_K}(H_ét^r,B_dR)≃(H_dR^r)^* as filtered K-spaces. Retain the smooth-vector condition for B_st and the duals on the right. Replacing smooth Hom by unrestricted Hom or erasing the dual changes the theorem. Use the uncompleted F^{nr} realization for this formulation; a scalar-extended completed carrier needs a separately proved descent statement.

(Colmez–Nizioł, Theorem 6.2, equation (6.3), p.40; Remark 6.7, p.41.)

*Needs:* Layer 4.8 (Algebraic period comparison without smoothness); PadicHodgeTheory `R06.2`.

### 4.10 Proper rigid C_st comparison over K

For proper smooth rigid X_K/K and r≥0, prove the natural G_K-equivariant B_st comparison with H_HK^r(X_C)⊗_{F^{nr}}B_st, compatible with φ and N. It induces the strict filtered B_dR comparison. Conclude that H_ét^r(X_C,Q_p) is potentially semistable.

Use the overconvergent syntomic comparison in the high-twist range, the proper Hyodo–Kato/de Rham finiteness theorems, and the Banach–Colmez dimension calculation named in the analytic supplier contract. These are early analytic inputs to the proof, not consequences of this comparison. The F^{nr} object with G_K action is the potential period realization. Without a semistable model over O_K, the theorem does not say the representation is semistable over K itself.

(Colmez–Nizioł, Theorem 6.4 and proof, pp.40–41.)

*Needs:* CrystallineCohomology `CR.6`; Layer 2.13 (Filtered de Rham comparison over K).

### 4.11 Proper rigid period comparison over C

For proper smooth rigid X/C, prove the φ,N-compatible B_st comparison with H_HK^r(X)⊗_{F^{nr}}B_st. Its B_dR extension is filtered for the intrinsic canonical de Rham deformation cohomology. Define Fil^i H^r(K_dR⁺) as the image of H^r(Fil^i K_dR⁺)→H^r(K_dR⁺), and then form the indicated rational period filtration.

This is the filtered over-C theorem, extending the underlying comparison and finite-free lattice of Layer 2. A B_dR⁺ lattice alone does not recover this filtration on cohomology. No G_K action is part of the statement unless X is equipped with descent to K. The overconvergent analytic proof retains its derived filtered complexes when extracting the cohomological comparison.

(Colmez–Nizioł, Theorem 6.8 and Remark 6.10, p.42.)

*Needs:* CrystallineCohomology `CR.6`; Layer 2.8 (Canonical B_dR⁺ cohomology); Layer 2.11 (Canonical de Rham period comparison).

### 4.12 Proper-curve potential period interface

For a proper smooth curve X_K over a finite extension K/Q_p and X=X_K⊗C, put V=H_ét¹(X,Q_p). Identify D_pst(V) with H_HK¹(X), give its Hodge–Tate weights as 0 and −1, and identify Fil¹D_dR(V) with H⁰(X_K,Ω¹). This is the potential-period and differential input used for the proper-curve calculation in CDN Proposition 3.12.

Use the rigid potential comparison and degeneration, with their common filtered map. The theorem need not assume semistable reduction over the original K. The modified Hyodo–Kato object and its further identity involving pro-étale H¹(Ô) require the fundamental period exact sequence supplied elsewhere; this interface returns only the comparison and filtration data just listed.

(Colmez–Dospinescu–Nizioł, §3.3, Proposition 3.12 and first proof paragraph, p.36.)

*Needs:* Layer 4.10 (Proper rigid C_st comparison over K); Layer 2.14 (Hodge–de Rham degeneration); PadicHodgeTheory `R06.2`.

### Examples

For N(e₁)=e₀ and N(e₀)=0, the horizontal section e₁+T e₀ becomes e₁+(T′−c)e₀ under T′=T+c. Evaluating at T′=0 gives e₁−ce₀, fixing the negative exponential. At c=0 transport is the identity, and if N=0 every uniformizer gives the same map. The relation Nφ=pφN holds with N=−d/dT and φ(T)=pT on the period factor. Good reduction has N=0, whereas a Tate curve supplies a nonzero rank-one N. Over C alone no G_K equivariance is asserted without descent data.

### Dependencies

Layers 0–3; AInfCohomology AI.6 exact log comparison maps; CrystallineCohomology CR.6 vertical integral and overconvergent Hyodo–Kato theory with N; PrismaticCohomology PR.8 in its stated charts; PadicHodgeTheory R06.1–R06.2, the local/syntomic stable-range period maps and Banach–Colmez exactness of the supplier contract; EnhancedDerivedSheaves E2/E4 h-descent and filtered tensors; AlgebraicModuliForArithmeticGeometry R09.7 for the algebraic range.

## Layer 5: Integral torsion inequalities and lattice recovery

### 5.1 Crystalline and de Rham torsion-freeness

For proper smooth formal 𝔛/O_C and each degree i, prove H_crys^i(𝔛_k/W(k)) is p-torsion-free exactly when H_dR^i(𝔛/O_C) is p-torsion-free. In this case H_Ainf^i(𝔛) is finite free and H_ét^i(X_C,Z_p) is torsion-free. Apply the generic A_inf complex criterion to the actual geometric K_A and its two specified specializations.

This is a degreewise equivalence between crystalline and de Rham torsion-freeness, followed by an implication to étale freeness. The implication has no converse from étale cohomology, as the Enriques example below shows. The generic module theorem belongs to the A_inf supplier; here the comparison identifies which geometric groups meet its hypotheses. Adjacent-degree assumptions are reserved for the stronger lattice equality.

(Bhatt–Morrow–Scholze, Remarks 14.4 and 14.7, pp.120,122; supplier Lemma 4.18.)

*Needs:* AInfCohomology `AI.5`; Layer 1.2 (Integral de Rham specialization); Layer 1.4 (Derived Witt crystalline specialization).

### 5.2 Integral torsion-length inequality over O_C

For proper smooth formal 𝔛/O_C and i≥0, prove for every n≥0

```text
length_Zp(H_ét^i(X_C,Z_p)_tor/p^n)
    ≤ length_W(k)(H_crys^i(𝔛_k/W(k))_tor/p^n).
```

Also identify the ranks of the two cohomology groups. In particular vanishing crystalline torsion forces étale torsion-freeness. Use the generic A_inf torsion comparison on K_A and the geometric specializations; the length is the finite length of the torsion quotient, not a dimension of the whole group.

At n=0 both quotients are zero. The inequality for each truncation is stronger information than an inequality of total lengths but does not yield an embedding or subquotient relation of the torsion modules. The later degeneration example separates these assertions. Finiteness of the groups is established before treating the extended-natural `Module.length` as an integer.

(Bhatt–Morrow–Scholze, Theorem 14.5(ii), pp.120–121.)

*Needs:* AInfCohomology `AI.5`; Layer 1.1 (Proper smooth A_inf input package); Layer 1.4 (Derived Witt crystalline specialization); Layer 1.6 (Étale specialization after μ inversion); Mathlib `Module.length`.

### 5.3 Lattice recovery over O_C

Assume H_crys^i(𝔛_k/W(k)) is p-torsion-free for proper smooth 𝔛/O_C. Then T=H_ét^i(X_C,Z_p) is finite free. Attach its finite-free BKF module to the pair (T,H^i(K_dR⁺(X_C))⊂T⊗B_dR) through the Fargues equivalence. Prove H_Ainf^i(𝔛) identifies with that module and that its W(k)-specialization injects φ-compatibly into H_crys^i.

If additionally H_crys^{i+1} is p-torsion-free, prove this inclusion is equality. The second hypothesis removes the next-degree base-change obstruction, so in this stronger range crystalline cohomology with φ is recovered from T together with its canonical B_dR⁺ lattice. Keep the two levels of conclusion distinct: degree-i freeness gives the BKF identification and inclusion, whereas equality requires the adjacent degree too.

(Bhatt–Morrow–Scholze, Theorem 14.5(iii), pp.120–121.)

*Needs:* AInfCohomology `AI.5`; AInfCohomology `AI.2`; Layer 1.1 (Proper smooth A_inf input package); Layer 2.16 (The canonical B_dR⁺ lattice in good reduction); Layer 2.17 (Agreement of integral and rational period maps).

### 5.4 Crystalline lattice recovery from the G_K-lattice

For proper smooth 𝔛₀/O_K, assume H_crys^i and H_crys^{i+1} are p-torsion-free. Fix π and its compatible roots, and apply the all-weight crystalline-lattice Kisin functor to the G_K-lattice T=H_ét^i(X_C,Z_p). Its finite-free module BK(T) over 𝔖=W(k)[[u]] has the B_cris⁺ identification with crystalline cohomology supplied by BMS Proposition 4.34 and the crystalline period comparison.

Use the convention u↦[π♭]^p with Witt Frobenius on coefficients for 𝔖→A_inf, and u↦0 with Witt Frobenius for 𝔖→W(k). After identifying the common rational W(k)[1/p] module, prove BK(T)⊗_𝔖 W(k)=H_crys^i(𝔛₀,k/W(k)) as lattices with φ. This is recovery from the G_K action, not merely from the rank of T. The supplied Kisin theorem is the all-weight crystalline-lattice theorem; finite-flat or p-divisible-group classification alone is weaker than this input.

(Bhatt–Morrow–Scholze, Theorem 14.6(iii) and proof, pp.121–122.)

*Needs:* AInfCohomology `AI.2`; FiniteFlatGroupsAndIntegralPadicHodgeTheory `R07.4`; Layer 3.4 (Crystalline comparison over a discretely valued base); Layer 5.3 (Lattice recovery over O_C); Layer 0.4 (Twists, Frobenius and filtration conventions); CrystallineCohomology `CR.3`; CrystallineCohomology `CR.3/derived-base-change`.

### 5.5 Torsion lengths over a discretely valued base

For proper smooth formal 𝔛₀/O_K with the perfect-residue mixed-characteristic DVR assumptions, prove the all-n torsion inequality between H_ét^i(X_C,Z_p) and H_crys^i(𝔛₀,k/W(k)). The ranks agree, and crystalline p-torsion-freeness implies étale p-torsion-freeness. The result uses completed geometric base change to O_C and the rationally normalized crystalline descent.

Record the lengths over Z_p and W(k), each with p as the truncation parameter. No ordinary length over ramified O_K replaces either coefficient ring in this statement. Include n=0 and the vanishing-rank case in the checks. The opposite torsion-freeness implication fails, and no integral étale realization is determined only by the residue scheme.

(Bhatt–Morrow–Scholze, Theorem 14.6(ii), pp.121–122.)

*Needs:* Layer 5.2 (Integral torsion-length inequality over O_C); CrystallineCohomology `CR.3`; Mathlib `Module.length`; CrystallineCohomology `CR.3/derived-base-change`; CrystallineCohomology `CR.3/torsion-and-models`.

### 5.6 Mod-p de Rham dimension bound

For proper smooth 𝔛₀/O_K, prove dim_k H_dR^i(𝔛₀,k)≥dim_Fp H_ét^i(X_C,F_p). Use derived base change for crystalline and étale complexes, together with finite generation of integral cohomology. Reduction modulo p in degree i has contributions from torsion in both degree i and degree i+1; include both before applying the two all-n inequalities at n=1.

The result concerns the mod-p cohomology groups themselves, not only reduction of integral H^i. This explains why the next-degree torsion must appear in the proof even though the bound is stated in one degree. Finiteness lets the result use natural-number dimensions; no comparison of infinities or infinite-dimensional affine de Rham groups is intended.

(Bhatt–Morrow–Scholze, Theorem 1.1 and inequality (1), pp.2–3.)

*Needs:* Layer 5.5 (Torsion lengths over a discretely valued base); CrystallineCohomology `CR.3`; AInfCohomology `AI.5`; Mathlib `Module.finrank`; CrystallineCohomology `CR.3/derived-base-change`.

### 5.7 Semistable log crystalline torsion export

For the proper semistable A_inf complex and its logarithmic specializations, transport CK Theorem 7.9 into the same diagram. For every integer i and n≥0, the étale torsion quotient has Z_p-length at most the W(k)-length of H_logcrys^i(𝔛_k/W(k))_tor/p^n. Also retain the finite-coefficient inequality comparing H_ét^i(X_C,Z/p^n) with H_logcrys^i(𝔛_k/W_n(k)).

Use the supplied rank equality when moving between full finite-coefficient groups and torsion quotients. The log bases and the properness assumptions are those of Layer 4. This is a geometric diagram/export of the logarithmic generic torsion theorem, with the two scalar maps kept visible. At n=0 the coefficient ring W₀ and Z/p⁰ are zero, so both finite-coefficient groups vanish.

(Česnavičius–Koshikawa, Theorem 7.9 and proof, p.70.)

*Needs:* AInfCohomology `AI.6/crystalline-torsion`; AInfCohomology `AI.6/rank-equality`; AInfCohomology `AI.6/degreewise-specializations`; Layer 4.1 (Logarithmic integral comparison adapter).

### 5.8 Normalized log de Rham torsion export

Transport the corresponding logarithmic de Rham torsion and finite-coefficient inequalities with valuation normalized by v(p)=1. For the torsion quotient, use v_OC(H_logdR^i(𝔛/O_C)_tor/p^n) on the right and the usual Z_p-length on the left. For a finitely presented cyclic O_C-module O_C/(a), the normalized quantity is v(a), defined through the zeroth Fitting ideal; keep its real-valued codomain and its scalar-extension invariance.

If the model is defined over a discrete O_K of absolute ramification e, its normalized torsion length is length_OK/e. Thus O_K/(π) has value 1/e and O_K/(p) has value 1. These are the tests that distinguish normalized valuation length from unscaled module length. The source's finite-coefficient log de Rham inequality is retained with the same normalization.

(Česnavičius–Koshikawa, §7.10, Lemma 7.11 and Theorem 7.12, p.71.)

*Needs:* AInfCohomology `AI.6/de-rham-torsion`; AInfCohomology `AI.6/degreewise-specializations`; AInfCohomology `AI.5`; Layer 4.1 (Logarithmic integral comparison adapter).

### 5.9 Functorial log de Rham lattice export

For the geometric étale lattice T in the proper semistable range, use the supplied BKF module M(T) attached to (T,D_dR(T)⊗B_dR⁺) and define L_dR(T)=(M(T)⊗_{A_inf,θ}O_C)^{G_K}. For a proper flat semistable model whose H_logdR^i and H_logdR^{i+1} are both free over O_K, identify L_dR(H_ét^i) with H_logdR^i inside H_dR^i(X_K).

Use the actual filtered comparison and its lattice inclusion to identify this image. The result makes the logarithmic de Rham lattice functorial and independent of models satisfying those adjacent-degree conditions. Neither condition can be dropped merely because the generic rational representation is semistable. Keep the θ-specialization here; Witt reduction yields a different integral realization.

(Česnavičius–Koshikawa, §8.5–8.6, p.73; Theorem 8.7 and Remark 8.8, p.74.)

*Needs:* AInfCohomology `AI.6/de-rham-lattice-functor`; AInfCohomology `AI.6/model-independent-lattice`; Layer 2.12 (Descended de Rham lattice); Layer 4.4 (Semistable de Rham agreement).

### 5.10 Small-weight integral arithmetic interface

For an absolutely unramified K, compare the geometric lattice with the supplied Fontaine–Laffaille realization after a common Tate shift puts all filtration indices in [0,p−2]. This is the unrestricted safe interval for torsion full faithfulness. For indices in [0,p−1], impose the exact restricted subcategories excluding the endpoint subobjects or quotients of the Fontaine–Laffaille theorem. At p=2 the unrestricted interval is [0,0].

In the Breuil–Kisin branch, retain the supplier's height, ramification and dyadic restrictions and compare with the lattice recovered using the Kummer tower and Frobenius-twisted 𝔖 specialization. The comparison identifies geometric outputs of these classification theories; it constructs no new classification. Equality of a crystalline lattice still uses the freeness assumptions from lattice recovery, independent of the weight interval.

(Bhatt–Morrow–Scholze, §4.4, pp.43–44; Theorem 14.6(iii), pp.121–122.)

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory `R07.3`; FiniteFlatGroupsAndIntegralPadicHodgeTheory `R07.4`; PadicHodgeTheory `R06.4`; Layer 5.4 (Crystalline lattice recovery from the G_K-lattice); FiniteFlatGroupsAndIntegralPadicHodgeTheory `R07.3/fl-full-faithfulness`; FiniteFlatGroupsAndIntegralPadicHodgeTheory `R07.3/fl-lattice-correspondence`; PadicHodgeTheory `R06.4/fontaine-laffaille-rational-consequences`; PadicHodgeTheory `R06.4/fontaine-laffaille-sign-dictionary`.

### 5.11 Enriques torsion counterexample

Construct the smooth projective geometrically connected surface over Z₂ of BMS Theorem 2.1: all its geometric generic integral étale cohomology groups are free, while degree-two crystalline cohomology of the special fibre has torsion F₂. Use the singular Enriques lift with Pic^τ=μ₂, its K3 cover and an ordinary elliptic curve. The composite Z/2→μ₂→E is nonzero generically and vanishes on the special fibre, giving an E-torsor threefold D.

Take a sufficiently ample smooth hypersurface and use weak Lefschetz and the crystalline calculation to obtain the surface and its asserted groups. The required Enriques existence, crystalline computation, positive-characteristic Bertini and Lefschetz range are named supplier contracts, not consequences of period comparison. The example proves that étale torsion-freeness does not force crystalline torsion-freeness, even with projectivity and geometric connectedness.

(Bhatt–Morrow–Scholze, Theorem 2.1 and Proposition 2.2 with proofs, pp.13–15.)

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory `R07.1`; AlgebraicModuliForArithmeticGeometry `R09.3`; CrystallineCohomology `CR.3`; EtaleDualityAndPerverseSheaves `EDC.2:pairings`.

### 5.12 Degenerating torsion counterexample

Construct the smooth projective surface H/O_C whose degree-two generic étale torsion is Z/p² and whose special crystalline torsion is k⊕k. Begin with the flat closure G of a p²-torsion point in a supersingular elliptic curve. Its generic fibre is the constant group Z/p², while its special fibre is E_k[p]. Approximate BG by a projective quotient, keeping the bad-stabilizer locus of codimension greater than two.

Use the smooth hyperplane and cohomological range from the construction to compute the two torsion groups. Their truncation lengths are 0,0 at n=0; 1,2 at n=1; and 2,2 for n≥2. Yet k⊕k is killed by p and Z/p² is not, so the latter cannot be a subquotient of the former. This is a non-example for every attempted strengthening of the length inequality to a module inclusion.

(Bhatt–Morrow–Scholze, Lemmas 2.5,2.7,2.9 and Theorem 2.10 proof, pp.15–17.)

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory `R07.1`; AlgebraicModuliForArithmeticGeometry `R09.3`; CrystallineCohomology `CR.3`.

### 5.13 Special-fibre non-determination

Use the two smooth projective Z₂ lifts D and D′=S×E from the Enriques construction, with the same special fibre S_k×E_k. Compute their different degree-two generic integral étale torsion. The isomorphism of special fibres therefore does not determine integral generic étale cohomology.

Through the A_inf specializations, the same example prevents RΓ_Ainf, even modulo p, from being a functor only of the residue scheme. Retain the full formal model as input to the integral comparison. This application does not contradict rational crystalline invariance or the residue-section theorem, which concern different coefficients and do not reconstruct generic integral torsion from the special fibre.

(Bhatt–Morrow–Scholze, Remark 2.4, p.15.)

*Needs:* Layer 5.11 (Enriques torsion counterexample); CrystallineCohomology `CR.3`.

### Examples

For every torsion-length formula, n=0 gives the quotient by 1 and both sides are zero. A free module contributes zero torsion length. Over a DVR with e=v_π(p), O_K/(π) has ordinary length 1 and normalized valuation length 1/e; O_K/(p^n) has ordinary length en and normalized length n. At p=2 the Fontaine–Laffaille interval [0,p−2] contains only weight zero. The Enriques example prevents reversal of the torsion-free implication, and the degenerating-group example separates equal length from equal exponent or isomorphic torsion.

### Dependencies

Layers 0–4; AInfCohomology AI.2, AI.5 and the named AI.6 torsion/lattice maps; CrystallineCohomology CR.3/CR.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/R07.3 and the all-weight R07.4 scope; PadicHodgeTheory R06.4 for small-weight rational consequences; AlgebraicModuliForArithmeticGeometry R09.3 for the exact torsion examples; Mathlib Module.length and ordinary module base change.

## Layer 6: Relative, product and arithmetic comparisons

### 6.1 Logarithmic period construction on modular curves

For the fixed-tame-level compactified modular-curve tower of CompletedCohomologyPartII CC.8, choose a sufficiently small finite level V₀ defined over a finite K/Q_p and enlarge K so its cusps D are rational. Equip V₀ with the divisorial fine saturated log structure of D. Construct its Kummer étale and pro-Kummer étale sites from cusp charts N→O_{V₀}, 1↦q, and ordinary smooth charts away from D. A tower object is a compatible inverse system of Kummer étale finite-level maps, with the corrected inverse-limit cover condition; the étale and pro-Kummer projections and restrictions preserve this log structure. The inverse system of level and field extensions giving V∞ is an object on this site. This is an analytic log construction and does not use the log crystalline PD site.

Construct OB_dR,log⁺ there by the completed monoid-algebra presentation: match finite-level chart elements with their tilted Teichmüller lifts, complete in the full kernel of θ_log, pass through the finite period levels and sheafify. Prove independence of the chart and of the finite-level presentation. The filtration is the power filtration of that full kernel. At a one-dimensional chart identify the sheaf locally with B_dR⁺[[X]], with X of filtration degree one. Construct its logarithmic connection and prove the strict Poincaré sequence and its first graded sequence

```text
0 → B_dR⁺ → OB_dR,log⁺ → OB_dR,log⁺ ⊗ Ω¹_{V₀}(D) → 0,
0 → O_{V∞}(1) → gr¹ OB_dR,log⁺ → O_{V∞} ⊗ Ω¹_{V₀}(D) → 0.
```

The differential module in the first sequence has degree one. Symmetric powers of the second sequence produce the finite filtration on every gr^i with successive terms O_{V∞}(j)⊗Ω¹_{V₀}(D)^{⊗(i−j)}. Prove that the construction is independent of V₀ and respects G_K and the small level subgroup. (Diao–Lan–Liu–Zhu, Definition 2.2.10, p.13, Proposition 2.3.15, pp.18–19, Corollary 2.4.2, pp.20–21, and Corollary 2.4.5, p.21; Pan II §§6.3.5–6.3.8, pp.99–101.)

Use `panLogPeriod_restrict` for chart and level restriction, `panLogPeriod_theta` for the structure quotient, `panLogPeriod_connection` for ∇log and `panLogPeriod_faltings` for the first graded extension. Prove the chart-refinement cocycle and the symmetric-power filtration statement. Ordinary period sheaves come from PadicHodgeTheory P8; the cusp monoid relation, analytic log-site projections and this logarithmic extension are constructed here.

**Checks.**

- On the local formal-coordinate presentation B_dR⁺[[X]], reduction sends X to zero but X is nonzero modulo the square of the full kernel. Keeping only the structure quotient loses the extension.
- Normalize the local lift so ∇log(X) is the chosen generator of Ω¹(D); then ∇log(1)=0 and ∇log(X²)=2X∇log(X). These equations fix the direction of the connection.
- On a cusp chart dlog(q) has residue 1, whereas dlog of the constant unit 1 has residue 0. Replacing Ω¹(D) by regular differentials at the cusp fails the residue test.

*Needs:* AdicSpacesPartII F0/R0 cusp charts, completed monoid algebras and continuous logarithmic differentials; AdicEtaleGeometry A1 corrected inverse-limit covers; PadicHodgeTheory P8 local-rational period sheaves and completed local Poincaré calculations; CompletedCohomologyPartII CC.8 modular-curve level/field tower; EnhancedDerivedSheaves E2/E4 sheafification and filtered descent. The divisorial analytic log sites and the logarithmic extension are constructed in this subsection, with their stated chart range.

### 6.2 Affinoid-perfectoid flag basis for the modular-curve tower

For tame level K^p contained in a full level N≥3 prime to p, construct a finite-intersection-stable affinoid basis B of Fl=P¹_C for the compactified infinite-p-level modular curve and its Hodge–Tate map. Start with the two standard closed unit charts, take rational subsets and their finite intersections, and prove that every inverse image π_HT⁻¹(U), U∈B, is affinoid perfectoid. It descends to an affinoid at sufficiently small finite p-level, and the direct limit of the finite-level function rings has dense image in its perfectoid function ring. These are hypotheses on this particular tower, not a claim about inverse images under arbitrary maps to a flag variety.

Prove the rational-localization and finite-intersection assertions with their finite-level descent, and identify the resulting period sheaf pushforward with the sheaf on the étale flag site used below. This is the genus-one construction and basis theorem; it does not require a perfectoid Shimura theorem in arbitrary genus. (Scholze, On torsion in the cohomology of locally symmetric varieties, Theorem 3.1.2(i)–(iii), pp.971–972, genus g=1; Pan II §3.2.1, p.19, and Lemma 7.2.6, p.120.)

The API `panBasis_perfectoid` gives the inverse-image property, `panBasis_inter` the finite-intersection refinement and `panBasis_finiteLevel` its finite-level descent and density map. Prove compatibility with the GL₂(Q_p) translates used in the basis and with the chosen tame level. Only the restricted tower geometry enters the almost acyclicity argument.

**Checks.**

- The two standard flag charts cover P¹_C; neither alone contains both coordinate lines.
- Their intersection is the annulus |x|=1. Its inverse image is an affinoid-perfectoid rational localization, and the basis is closed under this intersection.
- For a finite-level coordinate function, its image in the inverse-limit function ring is the pullback along the corresponding level projection; changing the projection violates the descent/density map.

*Needs:* CompletedCohomologyPartII CC.8 infinite-level modular curve and Hodge–Tate map; AdicSpacesPartII R0 rational localization and finite-level affinoid charts; PerfectoidSpaces P3 rational localization and almost acyclicity; AdicEtaleGeometry A1 inverse systems. The affinoid-perfectoid basis theorem and its period-sheaf descent are constructed here.

### 6.3 Relative filtered comparison adapter

Let f:X→Y be proper smooth between smooth formal O_K-schemes, and let T be a crystalline Z_p-lisse sheaf with its associated analytic prismatic F-crystal. For Y=Spf R, take a perfect prism (A,I) p-completely flat over (A_inf,[p]_q), q=[ε], and a section R→A⊗_{W(k)}O_K compatible with R→A. Prove that specializing the étale–crystalline comparison to B_dR(A) agrees with the relative Hodge-filtered de Rham comparison.

On the étale side the filtration is I-adic; on the de Rham side it is the tensor filtration of relative Hodge and period filtrations. Use the crystalline-to-infinitesimal base-change map of Layer 2, together with the analytic F-crystal equivalence and GR Theorem 9.15 comparison required from the prismatic supplier. The absolute equivalence for Spf O_K alone is insufficient for these relative inputs.

To remove the choice of section, pass to the structural OB_dR sheaf and use the crystal condition and Griffiths transversality to identify the filtered scalar extensions. This is the canonical relative formulation of Remark 10.14. Keep the relative connection in the comparison and the section as part of the functorial data in the version before OB_dR extension.

(Guo–Reinecke, Theorem 10.13 and Remark 10.14, pp.99–100.)

*Needs:* PrismaticCohomology `PR.7`; Layer 2.22 (Relative crystalline–infinitesimal base change); PadicHodgeTheory `P8:local-rational`; PadicHodgeTheory `P8:local-rational/relative-poincare-lemma`.

### 6.4 Naturality, scalar extension and cup products

For smooth proper algebraic varieties over K, show the total de Rham comparison c_dR is a graded B_dR-algebra isomorphism. Prove its naturality for morphisms, compatibility with every finite extension K′/K inside C, and compatibility with the Künneth external product for X×_K Y. All maps refer to the comparison already identified with the canonical deformation construction.

On integral, crystalline and prismatic objects, require the corresponding enhanced product and completed Künneth theorems in the common source range before asserting the analogous diagram. Cup products in cohomological degrees i,j carry the usual (−1)^{ij} interchange sign. The result does not enlarge the product scope of the semistable A_cris map. Extend the smooth coherent comparison through the actual scalar functors, so naturality is a commutative square of morphisms, not an equality of ranks.

(Betts–Stix, Proposition 3.19, p.27.)

*Needs:* Layer 2.13 (Filtered de Rham comparison over K); Layer 2.17 (Agreement of integral and rational period maps); Layer 1.9 (Multiplication and Bockstein coherence); EnhancedDerivedSheaves `E4`; ClassicalAdicEtaleCohomology `H5`.

### 6.5 Trace-normalized Tate period

For the Betts–Stix comparison c_dR, construct the unique G_K-equivariant filtered B_dR-linear isomorphism a:B_dR(−1)≃B_dR⟨−1⟩ that makes the trace square on P¹ commute. Define a filtration shift by Fil^i(V⟨n⟩)=Fil^{i+n}V. The degree-two trace generator on P¹ determines a; this normalization is retained in all subsequent class comparisons.

For smooth proper geometrically connected X/K of dimension d, prove compatibility of the étale trace to Q_p(−d), the de Rham trace to K⟨−d⟩ and a^{⊗d}. The d=0 point case has no twist, and d=1 recovers the defining P¹ square. Equality of a with the canonical Fontaine period is not supplied by the source, whose Remark 3.21 leaves it unproved. None of the following conclusions needs that extra identification.

The scalar API `tracePeriod_spec` is the defining P¹ trace equality, `tracePeriod_unique` identifies any unit satisfying that equality with the selected unit, and `tracePeriod_pow_zero` fixes the untwisted exponent. These scalar statements use the chosen generator; the filtered equivariant line statement remains the invariant formulation above.

**Checks.**

- For a zero-dimensional geometrically connected point the factor is a⁰=1, so no Tate-period correction appears.
- On P¹, for its degree-two generator with étale trace 1, the de Rham trace after comparison is the scalar a, by `tracePeriod_spec`.
- With scalar factor a=2, multiplying an untwisted degree-two class by a gives 2, whereas multiplication by a⁻¹ gives 1/2. Their inequality detects reversal of the twisted-to-untwisted conversion; this is a normalization computation, not a claim that the actual period equals 2.

(Betts–Stix, Proposition 3.20(5) and proof; Remark 3.21, pp.27–28.)

*Needs:* Layer 6.4 (Naturality, scalar extension and cup products); EtaleDualityAndPerverseSheaves `EDC.2:trace-purity`; CrystallineCohomology `CR.3:duality`; AlgebraicModuliForArithmeticGeometry `R09.7`.

### 6.6 Duality, cycles and Gysin compatibility

For smooth proper geometrically connected X/K of dimension d, compare the perfect Poincaré pairings in degrees i and 2d−i using c_dR and a^{⊗d}. For a codimension-r algebraic cycle Z, prove (c_dR⊗a^{⊗−r})cl_ét(Z)=cl_dR(Z) in H_dR^{2r}(X)⟨r⟩⊗B_dR. The inverse power of a changes the cycle twist in the direction fixed by the trace normalization.

Also prove compatibility with proper pushforward and regular-immersion Gysin in the supplied duality and purity range. This extension uses the named trace, purity and Gysin maps in the two theories; the source's pairing and cycle assertions alone do not state every pushforward square. No trace theorem for arbitrary nonproper spaces is introduced. In codimension zero the fundamental class tests the trace convention, and in codimension one the comparison feeds the first Chern class calculation.

(Betts–Stix, Proposition 3.20(6)–(7) and proof, pp.27–28.)

*Needs:* Layer 6.5 (Trace-normalized Tate period); Layer 6.4 (Naturality, scalar extension and cup products); EtaleDualityAndPerverseSheaves `EDC.2:pairings`; EtaleDualityAndPerverseSheaves `EDC.3`; CrystallineCohomology `CR.3:duality`; AlgebraicModuliForArithmeticGeometry `R09.7`; EtaleDualityAndPerverseSheaves `EDC.2:pairings/adic-and-rational-poincare-duality`; EtaleDualityAndPerverseSheaves `EDC.2:pairings/cup-product-trace-pairing`; EtaleDualityAndPerverseSheaves `EDC.3/cycle-class-map`; EtaleDualityAndPerverseSheaves `EDC.3/gysin-map`.

### 6.7 First Chern class comparison

For a line bundle L on smooth proper X/K, compare its étale Kummer class c₁(L)∈H²_ét(X_C,Q_p(1)) with its de Rham dlog class in Fil¹H²_dR(X). The rational de Rham map uses c_dR⊗a⁻¹. In the common smooth proper formal/prismatic range, include the crystalline PD and prismatic logarithmic classes with their exact supplied twist lines and Frobenius-linearized maps.

Give a proper proof of the line-bundle comparison by compactifying its total space to P(O⊕L) and using the section Gysin class, self-intersection and projective-bundle formula. This avoids applying a proper cycle theorem directly to a nonproper total space. Establish the comparison on the section and descend its difference through the bundle formula to c₁(L) on X. Canonical-t normalization and unrestricted integral log-semistable products are separate assertions and are not used here.

(Betts–Stix, Proposition 3.20(8), final proof paragraph, p.28.)

*Needs:* Layer 6.6 (Duality, cycles and Gysin compatibility); Layer 1.7 (Prismatic Frobenius pullback); Layer 1.8 (Crystalline–de Rham overlap square); EtaleDualityAndPerverseSheaves `EDC.3`; EtaleDualityAndPerverseSheaves `EDC.4`; PrismaticCohomology `PR.4`; PadicHodgeTheory `P8:local-rational`; EtaleDualityAndPerverseSheaves `EDC.2:trace-purity/first-chern-class`; EtaleDualityAndPerverseSheaves `EDC.3/self-intersection-formula`; EtaleDualityAndPerverseSheaves `EDC.4/projective-bundle-decomposition`; EtaleDualityAndPerverseSheaves `EDC.4/pullback-injective-blowup-bundle`.

### 6.8 Higher Chern and projective bundle comparison

For a rank-n vector bundle E on smooth proper X in the common comparison range, prove compatibility of every supplied c_r(E), with twist r. Pull back to the complete flag bundle, write the Chern classes as elementary symmetric polynomials in the first classes of the line quotients, and use the iterated projective-bundle formula to prove pullback injective. The first-class comparison and multiplicativity then descend the higher-class identity to X.

Use the quotient-line convention: for h=c₁(O(1)) the projective-bundle relation is h^n−c₁(E)h^{n−1}+⋯+(−1)^n c_n(E)=0. Transport a supplier using the sub-line convention explicitly before comparing its classes. In rank one this reads h=c₁(E), and for the trivial rank-two bundle h²=0 on its P¹ fibre. These two cases fix the direction and signs independently of the splitting argument.

(Betts–Stix, Proposition 3.20(8) and proof, p.28.)

*Needs:* Layer 6.7 (First Chern class comparison); Layer 6.4 (Naturality, scalar extension and cup products); EtaleDualityAndPerverseSheaves `EDC.4`; PrismaticCohomology `PR.4`; CrystallineCohomology `CR.3`; CrystallineCohomology `CR.3/kunneth`; EtaleDualityAndPerverseSheaves `EDC.3/chern-classes`; EtaleDualityAndPerverseSheaves `EDC.4/projective-bundle-decomposition`.

### 6.9 Geometric arithmetic export

Return the specified comparison maps, rather than only admissibility labels, to arithmetic consumers. A proper smooth good-reduction model supplies the crystalline realization with φ and filtered de Rham comparison. A proper semistable model supplies the semistable realization with N. A proper smooth rigid space descending to K supplies the potential realization with its F^{nr} and G_K data.

The returned interface includes scalar maps, filtration, duality, Tate/Breuil–Kisin twists and the map identities that identify cohomological classes. Small-weight integral applications retain the unramified base and interval restrictions, or the height/ramification assumptions of the Breuil–Kisin branch. A generic de Rham representation does not acquire a crystalline model from this export. Automorphic applications consume the appropriate realization only after verifying the geometric hypotheses.

(Colmez–Nizioł, Theorems 6.4, 6.8 and proof, pp.40–42.)

*Needs:* Layer 3.5 (Crystalline representation export); Layer 4.3 (Semistable period comparison); Layer 4.10 (Proper rigid C_st comparison over K); Layer 5.10 (Small-weight integral arithmetic interface); Layer 6.6 (Duality, cycles and Gysin compatibility).

### 6.10 Habiro and trace specialization export

Supply the coefficient dictionary and the commuting integral/class comparison maps to Habiro specialization and trace consumers. A specialization records the base prism or perfectoid ring, completion ideal, inversions, filtration and BK/Tate twist. Compare the q=1, p-adic and cyclotomic diagrams only after making the necessary scalar extensions and in the intersection of the source hypotheses.

The Habiro consumer proves its q-gluing and any analytic/algebraic comparison. The trace consumer constructs its own cyclotomic Chern character and trace-to-prismatic morphism; this roadmap provides the class-comparison diagram into which that morphism maps. No unconditional identification of cohomology theories before base change is part of the export. The graded Beilinson specialization used for nearby cycles is built locally in Layer 3, without requiring a character construction from the consumer.

(Bhatt–Morrow–Scholze, Theorem 14.1, p.118; specialization picture §1.2, p.6.)

*Needs:* Layer 0.1 (Normalized specialization diagram); Layer 1.7 (Prismatic Frobenius pullback); Layer 6.7 (First Chern class comparison); Layer 6.8 (Higher Chern and projective bundle comparison).

### 6.11 Graded analytic vectors and decompletion

In Pan's fixed-tame-level modular-curve tower, take U in the basis B and a finite K/Q_p over which G_K acts on O B_dR,k⁺(U). For i≥0, k>i and l>0, prove gr^i commutes with GL₂(Q_p)-locally analytic vectors, with the χ̃_l-isotypic subspace, and with the decompleted subspace imposing both G_{K∞}-fixedness and G_K analyticity. The stabilized graded piece does not depend on the chosen truncation k>i.

Use the i-th symmetric power of the logarithmic Faltings extension to filter the decompleted piece. Its j-th graded term, for j=0,…,i, is O_{K^p}^{la,χ̃_l}(U)_K(j)⊗_{O_{V₀}}Ω¹_{V₀}(C)^{⊗(i−j)}. The locally analytic exactness and the χ̃_l decompletion theorem are exact inputs from completed cohomology. Ordinary fixed vectors alone do not define this subspace. The logarithmic period-sheaf, site projections and extension construction used here are the early modular-curve constructions in this layer.

(Pan II, Proposition 6.3.9 and preceding paragraphs (§6.3.8), pp.100–101.)

*Needs:* Layer 6.1 (Logarithmic period construction on modular curves); CompletedCohomologyPartII `CC.8`.

### 6.12 Bounded torsion in truncated coefficients

For every fixed degree i and k≥1, prove H^i(X_{K^p},A_inf,X^a/(ker θ)^k) has p-primary torsion killed by a power p^n, and identify it with lim_m H^i(X_{K^p},A_inf,X^a/((ker θ)^k,p^m)). Keep the almost coefficient category and the p-adic completion in the statement.

The exponent n may depend on i and k. A bound uniform in all truncations or all degrees is not asserted. Prove the inverse-limit passage with the tower's torsion control, rather than an unjustified interchange of cohomology and an inverse limit. Work with the almost comparison before rationalization; an integral ordinary-module isomorphism is not obtained merely by omitting the superscript a.

(Pan II, Lemma 7.2.5 and proof, p.119.)

*Needs:* CompletedCohomologyPartII `CC.2`; CompletedCohomologyPartII `CC.8`; AInfCohomology `AI.3`; PerfectoidSpaces `P3`; PerfectoidSpaces `P3/etale-almost-acyclicity`.

### 6.13 Completed coefficient and flag descent

At fixed tame level and k≥1, identify the completed A_inf/(ker θ)^k coefficient group with lim_m H̃^i(K^p,Z/p^m)⊗_{Z_p}A_inf/((ker θ)^k,p^m). Prove the more general coefficient interchange for a p-adically complete p-torsion-free Z_p-module M in the specified complete tower complex. The limit is over the finite coefficient quotients and retains the topology of the completed representation.

For the perfectoid modular curve and its Hodge–Tate map π_HT to the flag variety, prove R^jπ_HT,*A_inf,X^a/(ker θ)^k=0 for j>0. This gives the resulting cohomology identification with H^i(Fl,π_HT,*A_inf,X^a/(ker θ)^k). Use the affinoid-perfectoid inverse-image basis constructed for this tower, and the étale almost acyclicity theorem. Neither an arbitrary Shimura tower nor unrestricted ordinary integral pushforward is included.

(Pan II, Lemma 7.2.6 and proof, p.120.)

*Needs:* Layer 6.12 (Bounded torsion in truncated coefficients); CompletedCohomologyPartII `CC.4`; CompletedCohomologyPartII `CC.8`; PerfectoidSpaces `P3`; PerfectoidSpaces `P3/etale-almost-acyclicity`; Layer 6.2 (Affinoid-perfectoid flag basis for the modular-curve tower); AInfCohomology `AI.3`.

### 6.14 Étale-site truncated period map

For k≥1 construct the G_Qp-equivariant B_dR,k⁺-linear map H̃^i(K^p,B_dR,k⁺)→H^i(Fl,B_dR,k⁺) on the étale site. For each k,m choose a sufficiently long truncated Witt projection φ_l:A_inf→W_l(O_C/p) through which the quotient A_inf→A_inf/((ker θ)^k,p^m) factors. Use finite-level truncated Witt sheaves and the almost descent maps to construct compatible g_{k,m}.

Prove compatibility in both k and m before taking inverse p-adic limits and inverting p. The map modulo t is the k=1 completed-C coefficient isomorphism of the tower. The required Witt truncation length l depends on the pair (k,m); a single arbitrary short projection does not suffice. The target period sheaf on Fl is Pan's descended truncated sheaf with its specified Galois action.

(Pan II, Lemma 7.2.4 and proof, pp.118–120.)

*Needs:* Layer 6.12 (Bounded torsion in truncated coefficients); Layer 6.13 (Completed coefficient and flag descent); AInfCohomology `AI.3`; PerfectoidSpaces `P3`; Mathlib `WittVector`; PerfectoidSpaces `P3/etale-almost-acyclicity`; Layer 6.2 (Affinoid-perfectoid flag basis for the modular-curve tower); PadicHodgeTheory `P8:local-rational/period-sheaves-on-affinoid-perfectoids`; PadicHodgeTheory `P8:local-rational`.

### 6.15 Truncated period comparison

For every k≥1 and every degree i in the modular-curve completed-cohomology setup, prove the map just constructed is an isomorphism of B_dR,k⁺-modules H̃^i(K^p,B_dR,k⁺)≃H^i(Fl,B_dR,k⁺), natural and G_Qp-equivariant. Use the k=1 comparison, the flat truncated period-sheaf filtration and the bounded-torsion/coefficient-limit results to propagate the comparison through the successive t-adic quotients.

Keep the truncation parameter k in the result. The theorem is the finite-period comparison of the specified tower and its flag sheaf; it does not by itself justify passage to unrestricted untruncated B_dR⁺ cohomology. Locally analytic/decompleted refinements use the graded theorem above, with k>i when an i-th graded piece is taken. This distinction preserves the separate hypotheses of the two routed modular-curve results.

(Pan II, Proposition 7.2.3 and proof, p.118.)

*Needs:* Layer 6.14 (Étale-site truncated period map); CompletedCohomologyPartII `CC.8`; PadicHodgeTheory `P8:local-rational/period-sheaves-on-affinoid-perfectoids`; PadicHodgeTheory `P8:local-rational`.

### Examples

On P¹ the trace of the hyperplane class is 1. If its untwisted comparison image is a times the de Rham class, tensoring by a⁻¹ gives equality; it does not make the untwisted image a⁻¹ times the class. The scalar model a=2 distinguishes 2 from 1/2. At r=0 the factor a⁰ is 1. The quotient-line projective relation in rank one is h−c₁(E)=0; on the fibre of the trivial rank-two bundle it is h²=0. In a cusp chart the logarithmic coordinate has residue 1 and the constant unit has residue 0. For truncated periods gr^i(B_dR⁺/t^k) is zero at i≥k, so the stabilization assertion must retain k>i.

### Dependencies

Layers 0–5; EtaleDualityAndPerverseSheaves EDC.2–EDC.4 and AlgebraicModuliForArithmeticGeometry R09.7 for traces and cycles; PrismaticCohomology PR.4/PR.6 supplied twist/class maps; EnhancedDerivedSheaves E4 for product and base-change coherence; CompletedCohomologyPartII CC.2/CC.4/CC.8; PerfectoidSpaces P3; AdicEtaleGeometry A1; AdicSpacesPartII R0; PadicHodgeTheory P8 local-rational. The logarithmic modular-curve periods and the flag basis are local targets in this layer.

## Downstream consumers

ArithmeticGaloisRepresentations consumes the crystalline and potentially semistable realizations with their filtrations and Galois actions; its general representation theory remains there. WeightsInEtaleCohomology consumes the proper finite-dimensional period realizations with the weight conventions fixed here. Habiro's comparison/gluing layer HQ.8 consumes the explicit θ, Witt and period maps and their commuting comparison squares; the q-deformed construction and gluing homotopies belong to that consumer. RefinedTraceMethods consumes the graded Beilinson square of Layer 3 and the specialization/Chern compatibility here, and constructs its cyclotomic trace square itself.

HodgeTateAndCanonicalSubgroups may consume the early analytic log-site projections and logarithmic Faltings extension of Layer 6; its canonical-subgroup results do not enter this roadmap. PerfectoidShimuraVarieties may consume the genus-one flag-basis construction as its modular-curve case before constructing the higher-dimensional generalization. CompletedCohomologyPartII consumes the finite-period and graded-decompletion comparisons once its earlier tower and locally analytic inputs are available. Each export carries the source range: good reduction, vertical semistable, arbitrary proper rigid, or smooth proper algebraic, as stated in the relevant layer.

## References

Page locators use the particular public versions below, rather than a different journal pagination.

- Bhargav Bhatt, Matthew Morrow, Peter Scholze, *[Integral p-adic Hodge theory](https://arxiv.org/pdf/1602.03148v3)*. arXiv:1602.03148v3 (2019), printed pagination.

- Kęstutis Česnavičius, Teruhisa Koshikawa, *[The A_inf-cohomology in the semistable case](https://arxiv.org/pdf/1710.06145v3)*. arXiv:1710.06145v3, printed pagination.

- Haoyang Guo, Emanuel Reinecke, *[A prismatic approach to crystalline local systems](https://arxiv.org/pdf/2203.09490v3)*. arXiv:2203.09490v3 (2023); source of published 2024 paper.

- Haoyang Guo, *[Crystalline cohomology of rigid analytic spaces](https://arxiv.org/pdf/2112.14304v1)*. arXiv:2112.14304v1 (2021).

- Pierre Colmez, Wiesława Nizioł, *[On the cohomology of p-adic analytic spaces, II: The C_st-conjecture](https://webusers.imj-prg.fr/~wieslawa.niziol/CN5.pdf)*. Author manuscript CN5, 24 November 2024, published 2025.

- L. Alexander Betts, Jakob Stix, *[Galois sections and p-adic period mappings](https://www.math.uni-frankfurt.de/~stix/research/preprints/BETTS_STIX-GaloisSectionsPadicPeriods20220429.pdf)*. Author manuscript 29 April 2022, source of 2025 paper.

- Lue Pan, *[On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1)*. arXiv:2209.06366v1 (2022), source of published 2026 paper.

- Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł, *[Cohomologie p-adique de la tour de Drinfeld : le cas de la dimension 1](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf)*. Author manuscript GPW5, source of 2020 paper.

- Bhargav Bhatt, Peter Scholze, *[Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4)*. arXiv:1905.08229v4, 12 January 2022, printed pagination.

- Peter Scholze, *[p-adic Hodge theory for rigid-analytic varieties](https://arxiv.org/pdf/1205.3463v2)*. Public arXiv:1205.3463 PDF, read together with official erratum.

- Peter Scholze, *[Erratum to p-adic Hodge theory for rigid-analytic varieties](https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeErratum.pdf)*. Official author PDF, 3 pages.

- Benjamin Antieau, Akhil Mathew, Matthew Morrow, Thomas Nikolaus, *[On the Beilinson fiber square](https://arxiv.org/pdf/2003.12541v2)*. arXiv:2003.12541v2 (29 September 2021), printed preprint pagination.

- Peter Scholze, *[On torsion in the cohomology of locally symmetric varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf)*. Annals of Mathematics 182 (2015), pp.945–1066; Theorem 3.1.2, pp.971–972, used only for genus one.

- Hansheng Diao, Kai-Wen Lan, Ruochuan Liu, Xinwen Zhu, *[Logarithmic Riemann–Hilbert correspondences for rigid varieties](https://www.kwlan.org/articles/log-RH.pdf)*. Author preprint for the 2023 publication, internal pagination: Definition 2.2.10, p.13; Proposition 2.3.15, pp.18–19; Corollary 2.4.2, pp.20–21; Corollary 2.4.5, p.21.
