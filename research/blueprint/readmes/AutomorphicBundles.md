# Automorphic bundles and classical automorphic forms

*Roadmap `AutomorphicBundles`: the complete blueprint, assembled from its two reviewed parts.*

This document is definitive. Its machine form is two part packets, and its node text is generated from them as their independent reviews left them, so that the two agree node for node:

- `research/blueprint/packets/AutomorphicBundles--B0.json`: layers B0, B1, B1.general, B2, B2.general, B3, B3.general and B4, 68 nodes. Associated coefficients and their descent, canonical principal bundles, automorphic bundles and their realizations, canonical and subcanonical extensions, and classical forms with their explicit weights. Written by BP-AutomorphicBundles--B0, corrected in place and accepted by REV-AutomorphicBundles--B0 on 6 October 2026.
- `research/blueprint/packets/AutomorphicBundles--B5.json`: layer B5, 28 nodes. Fourier–Jacobi coefficients and the expansion principle over Lan’s good-prime PEL models, geometric Hecke operators, the modular and Hilbert q-expansions, and the classical Siegel Hodge–Tate decompositions. Written by BP-AutomorphicBundles--B5, corrected in place and accepted by REV-AutomorphicBundles--B5 on 6 October 2026.

The B5 packet imports the B0 packet’s mathematics and never restates it; no node id occurs in both packets. Both reviews corrected their packets and asked that the reader be brought in line at assembly (sources and locators, API items, tests, dependency imports and the degree of the modular Hecke correspondence), so the node text here is generated from the corrected packets and none of the part documents’ node text is reused. The explanatory notes kept from the B5 part document (the cone counterexample, the common-completion contract, the component-detection argument and the finite-thickening comparison) were checked against the corrected packet. This document replaces the two part documents.

Where the parts meet, the document adds what a single packet could not say: the B0-packet nodes that answer each stage the B5 packet cites (section *Cross-part prerequisites*), one statement planned twice, one request answered by the other part, and one target of the roadmap that neither part plans (the integral section functor of B4). These are recorded as **Assembly notes** beside the nodes they concern, and none of them changes a packet.

The suggested Lean file `research/blueprint/suggested/AutomorphicBundles.lean` joins the two parts’ files. It is a naming proposal, not an implementation, and `implementationStatus` is `unchecked` for every node. Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Purpose and scope

For a Shimura datum (G, X) this roadmap builds the coherent sheaves in which classical automorphic forms live, and the operations a reader of the arithmetic literature uses on them. An algebraic representation of the Hodge parabolic (or of its Levi quotient) gives an automorphic vector bundle on the Shimura variety; the bundle has a canonical model over a number field, canonical and subcanonical extensions to every smooth toroidal compactification, and a coherent pushforward to the minimal compactification. Classical forms and cusp forms are the global sections of the two extensions. A representation of the whole group gives, in addition, the Betti, étale and filtered de Rham realizations of an automorphic local system. On these section modules the roadmap builds the geometric Hecke operators, the q- and Fourier–Jacobi expansions at the cusps with the expansion principle, and the classical comparisons that the p-adic theory uses as normalization tests.

The references are Milne’s *Canonical models of (mixed) Shimura varieties and automorphic vector bundles* and *Automorphic vector bundles on connected Shimura varieties*, Deligne’s *Hodge cycles on abelian varieties*, Harris’s work on canonical extensions, Lan’s *Arithmetic compactifications of PEL-type Shimura varieties*, *Higher Koecher’s principle* and *An example-based introduction to Shimura varieties*, Harris–Lan–Taylor–Thorne, Caraiani–Scholze, Andreatta–Goren–Howard–Madapusi Pera, Diamond’s two Hilbert papers, and Boxer–Calegari–Gee–Pilloni. The Tannakian torsor formulation is chosen so that the same coefficient formalism serves the classical and the p-adic constructions, scalar and vector-valued weights alike.

- **B0, associated bundles and coefficient descent.** The coefficient group Gᶜ = G/Z_s, with Z_s the excess real-split central torus (not the whole centre); descent through the ineffective arithmetic centre and finite stabilizers; the Hodge parabolic P_H = P(μ_h⁻¹) and the opposite Hodge–Tate parabolic, related by a named comparison; equivariant coefficients on the compact dual and their descent to the coefficient field; the homogeneous Hodge torsor on the Hermitian domain; analytic coefficients on arithmetic quotients; sections as equivariant functions; and the comparison of algebraic and analytic coefficients.
- **B1, canonical principal bundles over number fields.** Reductive groups as stabilizers of finitely many tensors; absolute Hodge tensors in abelian families; the Betti, étale and de Rham realizations of Hodge tensors and the tensor-preserving de Rham frame torsor with its filtration reduction; the canonical principal bundle of Hodge type, its independence of the symplectic embedding, its special-point normalization, the abelian-type extension and the Hecke pullbacks.
- **B1.general.** The general-data canonical principal bundle by conjugation of connected principal bundles, the adjoint second-jet realization and the rank-one reduction, with the rational compact-dual map and the normalized conjugation cocycle.
- **B2, automorphic bundles and realizations.** The automorphic coefficient functor J ↦ V(J) on the canonical model; its comparison with the analytic bundle; the highest-weight conventions; the Betti, étale and filtered de Rham coefficients of a full-group representation and their comparison; tensor and Hecke coherence; the Siegel tautological sequence.
- **B2.general.** The same functor and realizations for general data, with their behaviour under conjugation.
- **B3, canonical and subcanonical extensions.** Coefficients on degeneration charts; the canonical extension V^can_Σ and its gluing; the subcanonical extension V^can_Σ(−D) for the reduced boundary D; behaviour under refinement and fan independence of section spaces; the logarithmic connection of a full-group coefficient; the coherent minimal pushforward and the minimal Hodge line; rationality of the canonical extension.
- **B3.general.** The general-data canonical extension, its logarithmic comparison and its compatibility with refinements, Hecke maps and conjugation.
- **B4, classical forms and explicit weights.** Classical and cusp forms as H⁰ of the canonical and subcanonical extensions; the automorphy factor, its adapter to Mathlib’s `SlashAction` and the transformation law; the comparison with analytic forms; the GL₂ Hodge line; arithmetic Hilbert weights and the split and unsplit Hilbert coefficients with their central check; Siegel Schur coefficients; a split unitary GU(1,1) example; field base change of form spaces; the normalization of classical coefficients inside the Hodge–Tate VB functor.
- **B5, Hecke action and Fourier expansions.** Fourier–Jacobi coefficient modules and expansions on Lan’s good-prime PEL toroidal models, the expansion principle and coefficient recognition for an arbitrary coefficient module, boundary constant terms and cuspidality; geometric Hecke operators, their convolution law and the non-neat descent; the Tate and analytic q-expansion comparison; vector-valued expansions; Diamond’s Hilbert q-expansions over ramified primes with their expansion principle and cusp constants; the Hecke action on coefficients; and the classical GSp₄ Hodge–Tate decompositions of Boxer–Calegari–Gee–Pilloni, ordinary and with compact support.

The roadmap is complete when classical forms are usable over number fields and over the specified integral PEL and Hilbert models with every coefficient-field restriction visible; when the bundles carry functorial tensor, dual, pullback, Hecke and boundary operations; and when the elliptic and Hilbert comparisons identify the differential bundles used in the moduli problems. The integral half of the first condition is the one target that no node plans; it is recorded under *Gaps*.

## Boundaries

This roadmap owns the automorphic coefficient formalism: the coefficient group and its descent conditions, the canonical principal bundles and their associated bundles, the realizations of full-group coefficients, the canonical and subcanonical extensions and their minimal pushforward, the section spaces of classical and cusp forms, the geometric Hecke action on them, their q- and Fourier–Jacobi expansions, and the classical comparisons listed under B5. The accepted restructuring RS-14 confirms three of these ownerships against AutomorphicPadicLFunctions: B2 owns the canonical automorphic bundles of Levi/parabolic representations and their coefficient realizations, B3 the canonical and subcanonical extensions and coherent pushforwards, and B5 the canonical q- and Fourier–Jacobi expansions and boundary-vanishing principles. Everything else it imports, at the following owners, and it plans none of their objects.

**What this roadmap imports.**

- **Shimura data and varieties.** ShimuraData D3 supplies the compact dual and its reflex-field form, the filtration parabolic, the Borel embedding and the homogeneous variation (`ShimuraData:D3/compact-dual`, `/filtration-parabolic`, `/reflex-flag-descent`, `/borel-embedding`, `/homogeneous-variation`). ShimuraVarieties supplies the analytic level tower and Hecke translations (V1), the Baily–Borel minimal compactification (V2), CM reciprocity at special points (V4), the canonical Siegel/PEL model with its universal family (V5), connected/abelian-type descent (V6), the general conjugation data with the rank-one subdata and algebraic-group generation (V7), and the canonical finite étale arithmetic tower (V8, and V8.general for general data). The atlas also records the abelian-type export of AbelianSchemesAndArithmeticModuli A5 and the elliptic uniformization of ModularCurvesPartII R12.1 as inputs to B1 (RS-02).
- **Families and moduli.** AbelianSchemesAndArithmeticModuli A4 supplies relative H¹_dR with its Hodge sequence and Gauss–Manin connection and the degree-one comparisons; PELModuli M0, M3 and M5 supply the symplectic and GU(1,1) data, the fine-level universal families and the explicit Siegel and unitary Hodge modules; HilbertModularVarietiesAndShimuraCurves H0–H4 supply the Hilbert data, the O_F-linear family, the Rapoport-locus and ramified splitting models, the unit and polarization quotients and the central level kernels.
- **Compactifications.** ShimuraCompactifications supplies the fans and character-graded toric charts (C0, including `C0/relative-face-open`), cusp labels with their full stabilizers and finite covers (C1), the smooth toroidal gluing with its reduced Cartier normal-crossings boundary and the proper map to the minimal model (C2, C2.general), refinements and compactified Hecke maps (C3, C3.general), the semi-abelian degenerations and Mumford families (C4), Lan’s good-prime integral PEL toroidal models with their formal charts and, at neat level, the component-detection theorem `C5/neat-strata-detect-geometric-components` (C5), and the Hilbert and modular specializations (C6). Through RS-32 the local toric boundary, finite regular charts, finite-fan gluing and toric maps come from Tau Ceti’s AnalyticToricGeometry layers 0, 2, 3, 4 and 5, and the local Raynaud extension from NeronModelsAndSemistableAbelianVarieties R11.3.
- **Foundations.** AlgebraicModuliForArithmeticGeometry supplies fpqc descent of quasi-coherent modules (`R09.3/fpqc-quasicoherent-descent`) and tame finite coarse quotients (R09.5); ComplexComparisonPartII supplies analytification (C0) and projective GAGA on the proper toroidal model (C2); SchemeAndStackFoundations supplies quasi-coherent tensor operations and finite-projective trace (SF.0), flat-atlas descent and the qcqs section/colimit comparison (SF.1), and coherent cohomology (SF.2); AdicSpacesPartII F0 supplies formal completion of locally Noetherian schemes, completion of morphisms and coherent-section detection near a closed subset.
- **Modular forms and Hecke algebras.** AlgebraicModularFormsAndSerreWeights R15.1–R15.2 own the modular curve forms: the Hodge bundle with its Tate-curve normalization, the all-weight analytic comparison, the integral q-expansion principle, the integral Hecke operators and the cusp exact sequence. AdelicAlgebraicGroups AA.4 owns the Hecke correspondences, their degrees and the qualified Cartesian square. Mathlib owns the analytic scalar forms (`ModularForm`, `CuspForm`, `SlashAction`, `UpperHalfPlane.qExpansion`, `ModularForm.trace`); Tau Ceti owns the abstract Hecke ring and its action on analytic forms (`HeckeCosetModule.instRingHeckeRing`, `HeckeRing.GL2.heckeRingHomCharSpace`). Tau Ceti’s ModularForms roadmap, Layer 10C, builds the analytic automorphy sheaf on the coarse curve X(Γ) and the dimension formulas; this roadmap neither replans nor uses that construction, and its GL₂ comparison goes through R15.1.
- **Representations.** Tau Ceti’s ClassicalGroups layers 2 and 3 supply the complex Schur and highest-weight classification; the rational, nonsplit and integral extensions are a recorded gap in the reductive-group direction.
- **p-adic comparisons.** HodgeTateAndCanonicalSubgroups `T6:comparison` supplies the logarithmic de Rham and Hodge–Tate comparison for finite-dimensional local systems, with compact support. The derived and analytic VB coefficient functor of Boxer–Calegari–Gee–Pilloni belongs to the proposed HigherHidaAndColemanTheory, and the dual BGG/Kostant input to the proposed LieHighestWeightPartIICompletedCategoryO; B5 consumes only their finite-dimensional interfaces.

**What this roadmap does not own.**

- Generic principal torsors and contracted products, the central quotient torus, tensor-stabilizer representability and the general highest-weight classification belong to the reductive-group direction (ReductiveGroupsPartII and its extensions); the B0 packet records that no current stage there plans them.
- Shimura varieties, their canonical models and their compactifications are imported, never rebuilt; in particular the boundary charts, Mumford families and the good-prime integral models are ShimuraCompactifications’.
- Higher coherent cohomology over O/ϖⁿ, perfect complexes and Hecke operators in every cohomological degree belong to *Automorphic bundles and classical automorphic forms, Part II: integral coherent cohomology and Hecke-equivariant perfect complexes* (`AutomorphicBundlesPartII`), which starts where B3–B5 stop. This roadmap’s section modules are H⁰ (B4, and B5 with arbitrary coefficient modules); its only use of higher coherent cohomology is the characteristic-zero comparison of B5.v, through SF.2.
- Locally analytic and overconvergent weights belong to OverconvergentAutomorphicForms; they are not defined by pretending that they are algebraic representations.
- The integral CM étale extension of Andreatta–Goren–Howard–Madapusi Pera is outside the generic B2 owner (B0 packet gap).

**Who uses it.** In the atlas, OverconvergentAutomorphicForms O1 consumes B0, O8 consumes B4 and O6 consumes B5; HodgeTateAndCanonicalSubgroups T1, T2 and `T6:comparison` consume B1, B2 and B3.general respectively; AutomorphicGaloisRepresentationsPartII AG2.1a and AG2.4 consume B2 and B3; TorsionCohomologyInfrastructure TC.1 consumes B3; PerfectoidShimuraVarieties S6 consumes B3.general; HilbertModularVarietiesAndShimuraCurves H5 consumes B4. After RS-14, AutomorphicPadicLFunctions L3, L3h, L4, L4e, L5 and KU-hilberteisenstein, AutomorphicCongruences L1, L5 and L5w, IntegralIwasawaTheory I.3 and PadicFamilies L5 import B2, B3 and B5 directly. The node-level imports and requests that other packets already make are listed in *Requests filed with this roadmap*.

**A recorded overlap.** The link map of Tau Ceti’s LieGroups roadmap flags Layer 8 (Borel–Weil, full flags G_ℂ/B and line bundles of Borel characters), ShimuraData D3 and B0 as overlapping and recommends a rescope: Borel-character line bundles on full flag varieties do not supply the parabolic compact-dual coefficients and their arithmetic and analytic descent, which B0 owns.

## Conventions

These conventions are fixed for the whole roadmap; the two parts used them with the notational differences listed at the end, and the node text keeps each packet’s notation.

**Hodge filtration and parabolics.** Cohomological Hodge filtrations are used unless a homology coefficient is named; the standard homology coefficient is the dual of relative H¹, and Tate and similitude lines stay visible. Fix μ_h(z) = h_ℂ(z,1), acting by z^(−p) on H^{p,q} (the sign of Milne’s erratum, E9 below). Then P_H = P(μ_h⁻¹) stabilizes the descending Hodge filtration, with Levi M = Z_G(μ_h); the Hodge–Tate flag of Boxer–Calegari–Gee–Pilloni uses the opposite parabolic P_HT = P(μ_h) and left cosets. The two are related by the named comparison `B0/hodge-parabolic-convention`, never by reusing the letter P. BCGP’s Example 3.2.18 labels the fibre of L_λ by its highest weight λ while realizing sections with the Borel character −w_{0,M}λ; `B2/levi-highest-weight-convention` keeps the two apart.

**Torsors and cocycles.** For a principal right P-torsor T, (t,v) is identified with (tp, ρ(p)⁻¹v), and a section is a function f with f(tp) = ρ(p)⁻¹f(t). For a left action of Γ on a domain the automorphy factor satisfies J(gh,x) = J(g,hx)J(h,x); its inverse gives Mathlib’s indexed right `SlashAction` (in Lean, `e.trans f` is f ∘ e, so the hypothesis lists the factors in reverse `trans` order). A zero section does not force a cocycle. The determinant-negative GL₂(ℝ) action is semilinear over ℂ and is not the linear adapter’s SL₂ case.

**Coefficient group and descent.** The coefficient group is Gᶜ = G/Z_s, with Z_s the excess real-split central torus of Milne III §1 and Lan §5.3, not the whole centre and not G^der or G^ad. A coefficient descends to an arithmetic quotient only after the ineffective centre Γ ∩ Z(G)(ℚ) and every surviving finite stabilizer are checked to act trivially on it. Neatness removes torsion, not non-torsion central units (Hilbert units in particular). Coefficients are defined over their actual field of definition, which can be larger than the reflex field; finite descent with torsion coefficients never averages over a group whose order is not invertible.

**Extensions and sections.** Canonical extensions are locally free on the specified smooth toroidal model; they are characterized by their canonical boundary frames, not by their restriction to the open variety, since boundary twists have the same restriction. *Subcanonical* means tensoring with the ideal of the **reduced** boundary D. The minimal pushforward is coherent and not in general locally free; an invertible minimal Hodge-line power needs its own positivity and divisibility theorem. Fan independence is a statement about section spaces on different compactifications, not equality of sheaves; subcanonical pullback need not be an isomorphism after a boundary blow-up. Classical forms of weight zero are regular functions on the proper model, not all functions on the open variety.

**General data.** General Shimura data are reached by normalized conjugation, the adjoint second-jet realization and the rank-one reduction of Milne’s connected paper, without positing a universal family of motives; B1.general, B2.general and B3.general carry this. Their outputs are characteristic-zero statements.

**The settings of B5.** Its four strands have distinct hypotheses:

| Strand | Setting and coefficients |
|---|---|
| Scalar Fourier–Jacobi | Lan’s good-prime PEL toroidal model, the determinant Hodge line ω_tor and its powers k ≥ 0, arbitrary modules M over the base R |
| Vector Fourier–Jacobi | Lan’s neat good-prime PEL model and a finite projective Levi representation W (Higher Koecher’s principle §2); general characteristic-zero data need the mixed-boundary comparison of C3.general |
| Hilbert q-expansions | Diamond’s prime-to-p level, p possibly ramified, Noetherian O-algebras R and embedding-indexed weights (k,m) satisfying the unit condition; the general Iwahori-level principle fails |
| Classical Siegel comparison | BCGP’s finite-level GSp₄ logarithmic coefficient theory in characteristic zero, integral dominant weights with parity, all Tate twists and degree shifts kept |

In the scalar strand R is the localization of the reflex integers given by the good-prime PEL setting, or the characteristic-zero field version of that setting, and X is the smooth proper toroidal stack (its actual quasi-coherent sheaves, not those of a coarse space). For k ≥ 0 and an R-module M,

AF(k,M) = Γ(X, ω_tor^k ⊗_R M).

A cusp label Φ supplies its character lattice X_Φ, positivity cone, a finite cover of a lower-dimensional moduli **stack**, an abelian torsor C_Φ and character-indexed invertible sheaves Ψ_Φ(ℓ) on C_Φ; the cover is not identified with its quotient, and the full cusp stabilizer, its action on degrees and its transport of coefficient sheaves are kept. The boundary Hodge line is L_Φ = det_ℤ(X_Φ) ⊗ ω_A, identified with the pullback of ω_tor through the Raynaud extension and the determinant of its invariant-differential sequence. On a Tate chart the invariant relative differential is du/u on the multiplicative fibre; dq/q is a differential on the base and is never a substitute.

**Hecke normalization.** The geometric operator is H_g = tr_{p₁} ∘ θ_g ∘ p₂* on the actual section module, with the finite locally free trace (not the duality counit of SF.2), and T_g = ν(g)H_g for a multiplicative K-bi-invariant character ν of the admissible monoid. The BCGP correspondence convention is transposed relative to Faltings–Chai and is compared explicitly. For GL₂, ν(g) = det(g)⁻¹ turns det(g)^k j(g,z)^{−k} into the analytic det(g)^{k−1}; a good modular correspondence at ℓ has degree ℓ + 1, so with ν = ℓ⁻¹ the weight-zero constant 1 goes to (ℓ+1)/ℓ.

**Hodge–Tate conventions.** ℚ_p(1) has Hodge–Tate weight −1 and Sen eigenvalue +1. BCGP §4.5 compares VB⁰(L_κ) with the classical smooth bundle **with** the twist κ(μ); §4.8 uses the untwisted coherent bundles and applies its Tate twists separately. The twist is never counted twice.

**Notation across the parts.** The node text keeps each packet’s notation; the dictionary is:

- *Automorphic bundles.* B0 writes V(J) for the automorphic bundle of a Gᶜ-equivariant coefficient J and V(J)^can_Σ, V(J)^sub_Σ = V(J)^can_Σ(−D_Σ) for its extensions; B5 writes E(V), Ecan(W) and Esub(W) for the same objects attached to a representation V or W, and ω_tor^k for the canonical extension of the k-th power of the determinant Hodge line.
- *Section spaces.* B0’s M(J,K;L) = H⁰(S_Σ, V(J)^can) and S(J,K;L) = H⁰(S_Σ, V(J)^sub) are over a coefficient field L. B5’s AF(k,M) is the integral analogue with coefficients in a module M, and Diamond’s M_{(k,m)}(U;R) = Γ(Y, A_{(k,m)} ⊗ R) is the Hilbert one; the integral analogues are not planned by any B4 node (see *Gaps*).
- *Hilbert weights.* B4 uses Diamond’s 2021 *arithmetic* weights (k,w) with k_τ ≡ w mod 2 and m_τ = (w − k_τ)/2, so k + 2m = w is parallel; the coefficient is ⊗_τ ω_τ^{k_τ} ⊗ δ_τ^{m_τ} with δ_τ = det H_τ. B5 uses Diamond’s 2022 pairs (k,m) ∈ ℤ^Θ × ℤ^Θ subject only to triviality of χ_{k+2m} on O_F^× ∩ U; at a cusp ω_θ and δ_θ become (I⁻¹)_θ and (𝔡_F(IJ)⁻¹)_θ. The arithmetic weights of B4 are the pairs with k + 2m parallel.
- *GSp₄ weights.* B0’s request to B5 writes κ_j for the four coherent weights of BCGP Theorem 4.8.2; the B5 nodes write λ_j for the same weights, and both write a_j for the Tate shifts.
- *Sources.* Each source has one key in this document (see *Sources*); the packets’ own source ids are listed beside it.

**Library layout.** The two packets propose different homes: the B0 packet puts its declarations in modules `TauCeti/NumberTheory/AutomorphicBundles/B0` … `/B4` under the namespace `AutomorphicBundles`, and the B5 packet in `TauCeti/Geometry/Shimura/AutomorphicBundles/FourierJacobi`, `/Boundary`, `/ExpansionPrinciple` and `/B5` under the namespaces `FJCoefficient`, `FourierJacobi` and `AutomorphicBundles`. One root serves the roadmap better: `TauCeti/Geometry/Shimura/AutomorphicBundles/`, beside the ShimuraVarieties and ShimuraCompactifications modules that it builds on, with the single root namespace `AutomorphicBundles`, inside which the B5 names `FJCoefficient.*`, `FourierJacobi.*`, `ClassicalHecke.*`, `VectorFourierJacobi.*` and `HilbertQExpansion.*` keep their relative form. The node entries show each packet’s proposal as it stands; the suggested Lean file uses the single root namespace.

**Reading the node entries.** Node ids of this roadmap are written without the prefix `AutomorphicBundles:` except in each entry’s header line. Every node of the B0 packet carries a standing hypothesis that is not repeated in the entries: the nodes of B0–B3.general carry “exactly the datum, coefficient-field, level, convention and geometric hypotheses in this node’s statement; no implicit all-prime, flatness or motive hypothesis is added”, and the eighteen nodes of B4 carry “exactly the action/module or geometric coefficient hypotheses in this node’s statement”. The B5 nodes state their hypotheses individually. Entries list the statement, the hypotheses, the construction or proof, the planning API and unit tests of every definition and construction, the acceptance checks, the recorded uses, the dependencies, the proposed library location and the sources, each with its locator, excerpt and match.

## Sources

Each source is cited in the node entries by the key in brackets. The packets give some sources two ids; both are listed. Every version below is public, and the SHA-256 is that of the file the reviews read. Three reconciliations were made in assembling the list:

- `milne` (B0) and `MILNE-2018` (B5) are the same file, with the same SHA-256: Milne’s author revision of 11 March 2018 of *Canonical models of (mixed) Shimura varieties and automorphic vector bundles* (1990). The B5 packet gives it the title *Automorphic vector bundles on connected Shimura varieties*, which is the title of the different 1988 paper `milne-connected` ([Milne88]); the title page of the file read confirms the first title, and its Chapter VII (Fourier–Jacobi series) begins on p. 100, as the B5 locators say.
- `lan` (B0) and `LAN-INTRO` (B5) are the same file, and so are `bcgp` (B0, served as arXiv:2502.20645, which resolved to v1) and `BCGP-2025` (B5, arXiv:2502.20645v1).
- `diamond` (B0) and `DIAMOND-2022` (B5) are two different papers of Diamond: [Diamond21], arXiv:2011.14128v2, used only in its characteristic-zero specialization for the Hilbert coefficient formula, and [Diamond22], arXiv:2211.06922v1, used for the q-expansions, the expansion principle, the cusp constants and the Hecke formula over ramified primes.

The underlying proofs that the B5 sources quote and that no packet has read are listed as gaps: Rapoport 1978, Theorem 6.7 (behind Diamond 2022, Proposition 6.2.1) and Faltings–Chai 1990, Theorem 6.2 (behind BCGP Theorem 4.8.2).

- **[Milne90]** J. S. Milne, *Canonical models of (mixed) Shimura varieties and automorphic vector bundles*. Author TeX revision, 11 March 2018, of the 1990 article; corrected version, not the original scan; Author notes, corrected 11 March 2018. <https://www.jmilne.org/math/xnotes/AA.pdf>, SHA-256 `f4a36ecc28ae2439c6270c4e0075ce4ab8a839f56bcaa3026cb6eaeb6d46805e`. Packet ids: `milne` (B0), `MILNE-2018` (B5).
  - read: III §§1–8, pp.52–64 (B0)
  - read: V §6, pp.90–91 (B0)
  - read: p.9, Hodge-filtration sign, checked against the author erratum (B0)
  - read: Chapter VII §§1–5, pp.100–102: Fourier–Jacobi description; §4.1 is explicitly a conjecture, not a general integral theorem (B5)
- **[Milne88]** J. S. Milne, *Automorphic vector bundles on connected Shimura varieties*. Author TeX copy of Invent. Math. 92 (1988), pp.91–128. <https://jmilne.org/math/articles/1988aT.pdf>, SHA-256 `4b461a2eee2e18e6094dbba4bf7969ea27d18172933c04486301d01f9174b3f3`. Packet ids: `milne-connected` (B0).
  - read: §3 Proposition 3.9, Theorem 3.10 and Corollary 3.11, pp.18–20 (B0)
  - read: §7, pp.29–31 (B0)
  - read: §9, pp.33–34 (B0)
- **[Deligne82]** P. Deligne (notes by J. S. Milne), *Hodge cycles on abelian varieties*. Revised author TeX copy, 1 October 2018, of LNM 900 (1982), pp.9–100. <https://jmilne.org/math/Documents/Deligne82.pdf>, SHA-256 `827e3571c8049fc5d3aed8dfad912fee39a2f5dbf7341726c38235f035d32139`. Packet ids: `deligne` (B0).
  - read: §2 Main Theorem 2.11 and Principles B 2.12/2.15, pp.19–21 (B0)
  - read: §3 Proposition 3.1 and Remark 3.2, pp.22–23 (B0)
  - read: §6 proof completion, Proposition 6.1, pp.41–42; intermediate CM proof not decomposed (B0)
  - read: p.24, Mumford–Tate/Tate-coordinate definition, checked against the author erratum (B0)
- **[LanIntro]** Kai-Wen Lan, *An Example-Based Introduction to Shimura Varieties*. Public author PDF served 6 October 2026; Author-hosted version inspected 26 September 2026 in the preceding checkpoint. <https://www.kwlan.org/articles/intro-sh-ex.pdf>, SHA-256 `d9a3e75544a0a168db70d552a80696c4ef2f84d8184654cd0ca45eae81b32dad`. Packet ids: `lan` (B0), `LAN-INTRO` (B5).
  - read: §4.2.7, pp.49–50 (including visual check of p.49) (B0)
  - read: §5.3, pp.63–64 (B0)
  - read: 4.2.7, canonical and subcanonical extensions, printed pp. 49-50; rendered p. 50 inspected in the preceding checkpoint (B5)
  - read: Independent review re-read §4.2.7, printed pp.49–50, for the canonical/subcanonical section interpretation. (B5)
- **[LanPEL]** Kai-Wen Lan, *Arithmetic compactifications of PEL-type Shimura varieties*. Author-hosted thesis revision dated 14 March 2021; book numbering, not the original deposited thesis or an inspected publisher edition. <https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf>, SHA-256 `a7a454f5d0735f4bf11f00a8afc14c361c5fc2cefd691d7466f7620ab4c3a079`. Packet ids: `LAN-2021` (B5).
  - read: 7.1.1, definitions and proofs, printed pp. 532-533 (B5)
  - read: 7.1.2, definitions and proofs, printed pp. 534-540 (B5)
  - read: 6.4.3.4 and its proof, printed pp. 529-530 (preceding checkpoint) (B5)
  - read: 7.2.3, use of 7.1.2.13 in the boundary factorization, printed p. 547 (preceding checkpoint) (B5)
  - read: 6.2.5, stratum ideals and the common completion preceding (6.2.5.22), printed pp. 478-483; Remarks 6.2.5.30-6.2.5.31, printed p. 485 (preceding checkpoint) (B5)
  - read: 6.4.1.1(5), the individual-stratum formal-completion interface (B5)
  - read: Notation, printed p. xxv: the set of retained rational primes may be infinite; 1.4.1.1, choice of good primes (B5)
  - read: 6.4.1.1(2)-(5), smooth strata, relative normal crossings and the neat no-self-intersection clause, printed p. 520; 6.4.1.2 and its proof, printed p. 523; 7.1.2.14, printed p. 539, re-read in the fiber-detection continuation (B5)
  - read: 5.4.3.1–5.4.3.2, pp.431–432; 5.4.3.8–5.4.3.10, pp.438–439: right translation and cusp transport (B5)
  - read: 6.4.3.1–6.4.3.4, pp.527–530: toroidal Hecke maps and compatible refinements; 7.1.1–7.1.2, pp.532–540, freshly re-read (B5)
- **[LanErrata]** Kai-Wen Lan, *Arithmetic compactifications of PEL-type Shimura varieties - Errata*. 14 March 2021. <https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf>, SHA-256 `14343693efbc34ef8e9fa63e65ac9586c663d1c731409c0db64ec39a7e84eb88`. Packet ids: `LAN-ERRATA` (B5).
  - read: Items 71-77: formal charts, etale descent, lower-dimensional moduli stack and stabilizer invariance (B5)
  - read: Search of the full parsed errata for 7.1.1 and free; no correction of the p. 533 free-submodule reduction located (B5)
- **[LanKoecher]** Kai-Wen Lan, *Higher Koecher’s principle*. Author-hosted preprint; cover directs readers to Mathematical Research Letters 23 (2016), 163–199, DOI 10.4310/MRL.2016.v23.n1.a9 for the official version. Locators below use the preprint pagination, not journal pagination.. <https://www.kwlan.org/articles/Koecher.pdf>, SHA-256 `5916b37f2e350a55947cf97ac0c6640086088e7d9617267655081a3369f58f0a`. Packet ids: `LAN-HIGHER` (B5).
  - read: §2, printed pp.2–3: neat good-prime PEL setup and locally free finite-presentation representation coefficients (B5)
  - read: Proposition 5.6 and its proof, printed pp.11–13; Remark 5.7, printed p.13: boundary coefficient bundle and filtration descent warning (B5)
  - read: Corollaries 5.8–5.9 and Definition 5.10, printed p.13: completed coefficient cohomology; B5 uses only degree zero (B5)
- **[HLTT]** M. Harris, K.-W. Lan, R. Taylor, J. Thorne, *On the rigid cohomology of certain Shimura varieties*. Public author manuscript rigcoh.pdf; not collated against the journal. <https://www.kwlan.org/articles/rigcoh.pdf>, SHA-256 `abecfd049d617654dd0bb60e4945bf6967d3953ed20f2126de0624f2bd0bdbc7`. Packet ids: `hltt` (B0).
  - read: Introduction, pp.2–4 (B0)
  - read: §3.4.1, pp.109–110 (B0)
  - read: Appendix B.8, pp.270–271 (B0)
- **[CS17]** A. Caraiani, P. Scholze, *On the generic part of the cohomology of compact unitary Shimura varieties*. Version of record, Annals of Mathematics 186 (2017), 649–766. <https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf>, SHA-256 `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a`. Packet ids: `cs` (B0).
  - read: §2.2, pp.666–667 (B0)
  - read: §2.3, pp.667–671 (B0)
- **[AGHMP]** F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera, *Faltings heights of abelian varieties with complex multiplication*. Version of record, Annals of Mathematics 187 (2018), 391–531. <https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf>, SHA-256 `e1274468312566b3b062e9612cd89818349e9c98cf9e58a728f85704b740c6bb`. Packet ids: `ag` (B0).
  - read: §3.3, pp.418–419 (B0)
  - read: §3.4, pp.419–421 (B0)
  - read: §3.5 Proposition 3.5.1, pp.421–422 (B0)
- **[BCGP]** G. Boxer, F. Calegari, T. Gee, V. Pilloni, *Modularity theorems for abelian surfaces*. arXiv:2502.20645v1, 28 February 2025; downloaded response identifies v1; arXiv:2502.20645v1, 28 February 2025. <https://arxiv.org/pdf/2502.20645>, SHA-256 `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`. Packet ids: `bcgp` (B0), `BCGP-2025` (B5).
  - read: §3.2.13–3.2.19, pp.44–45 (B0)
  - read: §4.5 classical bundle comparison, pp.72–74 and 77–78 (B0)
  - read: §4.8.1–4.8.2, pp.101–102 (B0)
  - read: §1.8, pp.17–18: transposed Hecke-correspondence convention (B5)
  - read: §4.5.1, pp.72–74 and §§4.5.17–4.5.22, pp.78–80: coefficient functors, refinements and finite-dimensional comparison context (B5)
  - read: §§4.6.1–4.6.2, pp.81–82: classical smooth bundles and Tate normalization (B5)
  - read: §4.8.1–Theorem 4.8.2, pp.101–102: ordinary and compact-support classical Siegel comparisons (B5)
- **[Diamond21]** Fred Diamond, *Geometric weight-shifting operators on Hilbert modular forms in characteristic p*. arXiv:2011.14128v2, 18 September 2021; read only the characteristic-zero specialization of §§3.1–3.2 and its moduli hypotheses. <https://arxiv.org/pdf/2011.14128v2>, SHA-256 `2d8f8fd3d1e1e468d57183bcd0eef454e1e8fff4a7e143c8a0e48e490692e3c2`. Packet ids: `diamond` (B0).
  - read: §3.1, pp.9–11 (B0)
  - read: §3.2, pp.11–13; formula before Definition 3.2.1 and paritious-weight paragraph, p.12 (B0)
- **[Diamond22]** Fred Diamond, *Compactifications of Iwahori-level Hilbert modular varieties*. arXiv:2211.06922v1, 13 November 2022 (PDF cover date). <https://arxiv.org/pdf/2211.06922v1>, SHA-256 `672b6b4bc3bedb9081dbad088829cba95754e2461dcbb22a1a0453cf0585b24c`. Packet ids: `DIAMOND-2022` (B5).
  - read: Notation and §§2.1–2.3, pp.2–4: coefficient field, ramified splitting model and cusp data (B5)
  - read: §§6.1–6.3, pp.24–26: weights, determinant normalization, q-expansions, coefficient recognition and cusp constants (B5)
  - read: §6.5, pp.28–29: prime-to-p Hecke coefficient formula and its normalized adelic coefficients (B5)
- **[HarrisBB]** M. Harris, *Beilinson–Bernstein localization over Q and periods of automorphic forms*. Public author manuscript; publication collation not claimed. <https://webusers.imj-prg.fr/~michael.harris/BBlocalization_web.pdf>, SHA-256 `5dcb07389baab2b94f44d7a97dde98382bec3a246070f478c1ca0589bb601925`. Packet ids: `harris-localization` (B0).
  - read: Introduction, pp.1–2 (B0)
  - read: §1.4, Theorem 1.4.2 and (1.4.3), pp.10–11 (B0)
- **[HarrisCours4]** M. Harris, *Vector bundles (Cours 2013, 4fibres)*. Public author course notes, not a version of record. <https://webusers.imj-prg.fr/~michael.harris/Cours_2013/4fibres.pdf>, SHA-256 `dd083d8c060bfd22f5d0001d4603806198bb05505bff4a729d97ce9b407d689b`. Packet ids: `harris-bundles` (B0).
  - read: Entire short note (B0)
- **[HarrisCours7]** M. Harris, *Torus embeddings (Cours 2013, 7torique)*. Public author course notes; findings scoped to this copy. <https://webusers.imj-prg.fr/~michael.harris/Cours_2013/7torique.pdf>, SHA-256 `348d5a58f79e1400b756e7fecf971a36ce3b1502d2dcc125c0d96e29339c8e08`. Packet ids: `harris-toric` (B0).
  - read: pp.1–4; beginning of p.5 (B0)
- **[HarrisCours8]** M. Harris, *Logarithmic growth (Cours 2013, 8logarithmique)*. Public author course notes; findings scoped to this copy. <https://webusers.imj-prg.fr/~michael.harris/Cours_2013/8logarithmique.pdf>, SHA-256 `f8c7680fae1ec044df362113a4339b67c7615407886a5eb9a58577d7b5ad0286`. Packet ids: `harris-log` (B0).
  - read: Entire short note, pp.1–3 (B0)
- **[EGA-I]** A. Grothendieck, with J. Dieudonné, *Éléments de géométrie algébrique I: Le langage des schémas*. Publications Mathématiques de l’IHÉS 4 (1960), journal scan served by Numdam. <https://www.numdam.org/article/PMIHES_1960__4__5_0.pdf>, SHA-256 `9aba23020217535977e279bdd06a0413f48da703086865ba4c00766c85df4ae6`. Packet ids: `EGA-I-1960-COMPLETION` (B5).
  - read: Printed pp. 195–199, physical PDF pages 194–198: completion of coherent sheaves, 10.8.5–10.8.14; extension of morphisms, 10.9.1–10.9.5, and the opening of 10.9.6. The two imported contracts use 10.8.11 and 10.9.1–10.9.3. (B5)
- **[Stacks00L0]** The Stacks Project Authors, *Lemma 10.62.1: prime filtrations of finite modules*. Tag 00L0, online statement and both proofs read 26 September 2026. <https://stacks.math.columbia.edu/tag/00L0>. Packet ids: `STACKS-PRIME-FILTRATION` (B5).
  - read: Finite filtration with factors R/p over a Noetherian ring; cyclic reduction and maximal-counterexample proof (B5)
- **[Stacks00IP]** The Stacks Project Authors, *Krull's intersection theorem*. Tag 00IP, statement and proof read 26 September 2026. <https://stacks.math.columbia.edu/tag/00IP>. Packet ids: `STACKS-KRULL` (B5).
  - read: Lemma 10.51.4: a finite module over a Noetherian local ring is separated for powers of a proper ideal; Artin-Rees and Nakayama proof (B5)
- **[Stacks00NX]** The Stacks Project Authors, *Finite projective modules*. Tag 00NX, statement and proof read 26 September 2026. <https://stacks.math.columbia.edu/tag/00NX>. Packet ids: `STACKS-PROJECTIVE` (B5).
  - read: Lemma 10.78.2: finite projective modules are direct summands of finite free modules; splitting a finite free surjection (B5)
- **[Stacks0GQZ]** The Stacks Project Authors, *Filtered colimits and finitely presented modules on algebraic stacks*. Tag 0GQZ, statement and proof read 26 September 2026. <https://stacks.math.columbia.edu/tag/0GQZ>. Packet ids: `STACKS-STACK-COLIMIT` (B5).
  - read: Lemma 103.13.5, applied with G = O_X; finite affine coverings and quasi-separatedness check in its proof (B5)
  - read: Section 103.13 (tag 0GQU), Lemma 103.13.1 and its site hypotheses, also read (B5)
- **[Stacks0A18]** The Stacks Project Authors, *Stein factorization for algebraic spaces*. Section 76.36, tag 0A18, read 26 September 2026. <https://stacks.math.columbia.edu/tag/0A18>. Packet ids: `STACKS-STEIN-SPACES` (B5).
  - read: Lemma 76.36.1, including surjectivity (B5)
  - read: Theorem 76.36.4, proper Noetherian case and formal-functions/idempotent proof (B5)
  - read: Lemma 76.36.9, finite etale factor under flat finite-presentation geometrically reduced fibers, and its proof; also opened separately at tag 0E0D (B5)
- **[MathlibPrimeFiltration]** Jinzhao Pan and the Mathlib contributors, *Prime filtrations and exact-sequence induction for finite modules*. Mathlib commit 082e2d37e8b0463410cdb532e111cd43d5a66174. <https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/AssociatedPrime/Finiteness.lean>. Packet ids: `MATHLIB-PRIME-FILTRATION` (B5).
  - read: Submodule.IsQuotientEquivQuotientPrime and its characterization; exists_relSeries_isQuotientEquivQuotientPrime; induction_on_isQuotientEquivQuotientPrime and its proof; associatedPrimes.finite as an existing application (B5)

### Versions read

The packets record the versions read (PROTOCOL §18). Author copies and preprints are named as such; a finding that quotes one of them is scoped to that text.

| Packet | Kind | Version read | Read | SHA-256 |
|---|---|---|---|---|
| B0 | author copy | https://www.jmilne.org/math/xnotes/AA.pdf | 2026-10-06 | `f4a36ecc28ae2439…` |
| B0 | author copy | https://jmilne.org/math/articles/1988aT.pdf | 2026-10-06 | `4b461a2eee2e18e6…` |
| B0 | author copy | https://www.kwlan.org/articles/intro-sh-ex.pdf | 2026-10-06 | `d9a3e75544a0a168…` |
| B0 | published | https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf | 2026-10-06 | `e1274468312566b3…` |
| B0 | published | https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf | 2026-10-06 | `4f9449e5ecfd8fb8…` |
| B0 | preprint | https://arxiv.org/pdf/2502.20645 | 2026-10-06 | `51d7eacca6eae394…` |
| B0 | author copy | https://www.kwlan.org/articles/rigcoh.pdf | 2026-10-06 | `abecfd049d617654…` |
| B0 | author copy | https://webusers.imj-prg.fr/~michael.harris/BBlocalization_web.pdf | 2026-10-06 | `5dcb07389baab2b9…` |
| B0 | author copy | https://webusers.imj-prg.fr/~michael.harris/Cours_2013/4fibres.pdf | 2026-10-06 | `dd083d8c060bfd22…` |
| B0 | author copy | https://webusers.imj-prg.fr/~michael.harris/Cours_2013/8logarithmique.pdf | 2026-10-06 | `f8c7680fae1ec044…` |
| B0 | author copy | https://webusers.imj-prg.fr/~michael.harris/Cours_2013/7torique.pdf | 2026-10-06 | `348d5a58f79e1400…` |
| B0 | author copy | https://jmilne.org/math/Documents/Deligne82.pdf | 2026-10-06 | `827e3571c8049fc5…` |
| B0 | preprint | https://arxiv.org/pdf/2011.14128v2 | 2026-10-06 | `2d8f8fd3d1e1e468…` |
| B5 | author copy | https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf | 2026-10-06 |  |
| B5 | author copy | https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf | 2026-10-06 |  |
| B5 | published | https://www.numdam.org/article/PMIHES_1960__4__5_0.pdf | 2026-10-06 | `9aba230202175359…` |
| B5 | author copy | https://www.kwlan.org/articles/Koecher.pdf | 2026-10-06 | `5916b37f2e350a55…` |
| B5 | public version | https://arxiv.org/pdf/2211.06922v1 | 2026-10-06 | `672b6b4bc3bedb90…` |
| B5 | public version | https://arxiv.org/pdf/2502.20645v1 | 2026-10-06 | `51d7eacca6eae394…` |
| B5 | author copy | https://www.jmilne.org/math/xnotes/AA.pdf | 2026-10-06 | `f4a36ecc28ae2439…` |

## What the pinned libraries have

The reviewed library audit (AUDIT-13, in `data/library-coverage.json`) finds every layer of this roadmap *not built* except B4, which is *partly built*: Mathlib proves the automorphy cocycle `UpperHalfPlane.denom_cocycle` (and its determinant-sign form `denom_cocycle'`) and the right-action law `SlashAction.slash_mul`, and its `ModularForm` carries the analytic transformation law and boundedness at every cusp. Nothing in either library is a Hodge line bundle, a canonical model, a toroidal extension, a Hilbert or Siegel modular form or a geometric Hecke operator. What the roadmap reuses is therefore infrastructure: the slash-action class and linear-equivalence algebra for the automorphy factor; scheme modules, pushforward and global sections; the analytic q-expansion, trace and Hecke ring for the modular comparisons; and Mathlib’s commutative algebra (prime filtrations, Krull separation, adic completion, short-complex diagram lemmas) for the B5 dévissage. The audit lists four layers that also touch B4’s targets; each is resolved by import: AlgebraicModularFormsAndSerreWeights R15.1 owns the geometric GL₂ forms, which `B4/gl2-hodge-line-comparison` imports and compares; HilbertModularVarietiesAndShimuraCurves H5 and OverconvergentAutomorphicForms O8 consume B4; and ModularCurvesPartII R12.5 identifies weight-two cusp forms with differentials on its own curves, which B4 does not replan.

The table lists every declaration the two packets cite, each read in its source file at the pins (Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`) by the part and again by its review. The “provides” column is the packet’s own record of what the declaration gives and, where it matters, what it does not.

| Declaration | Kind | Module | What it provides here | Cited in |
|---|---|---|---|---|
| `mathlib:SlashAction` | class | `Mathlib/NumberTheory/ModularForms/SlashActions.lean` | Indexed additive right slash-action class, including its actual slash_mul field: map k (g*h) f = map k h (map k g f). The static declaration index omits this generated field; source reading and Lean #check confirm it. | B0 |
| `mathlib:ModularForm.SL_slash_apply` | theorem | `Mathlib/NumberTheory/ModularForms/SlashActions.lean` | Explicit integral SL2 slash formula | B0 |
| `mathlib:ModularForm.slash_action_eq'_iff` | theorem | `Mathlib/NumberTheory/ModularForms/SlashActions.lean` | Scalar invariance/transformation equivalence | B0 |
| `mathlib:ModularForm.smul_slash` | theorem | `Mathlib/NumberTheory/ModularForms/SlashActions.lean` | Full GL2 semilinear scalar law | B0 |
| `mathlib:LinearEquiv.trans` | def | `Mathlib/Algebra/Module/Equiv/Defs.lean` | Composition applies the first equivalence then the second | B0 |
| `mathlib:LinearEquiv.trans_symm` | theorem | `Mathlib/Algebra/Module/Equiv/Defs.lean` | Inverse of a composite reverses order | B0 |
| `mathlib:LinearEquiv.symm_apply_eq` | theorem | `Mathlib/Algebra/Module/Equiv/Defs.lean` | Inverse evaluation equality | B0 |
| `mathlib:LinearEquiv.automorphismGroup` | instance | `Mathlib/Algebra/Module/Equiv/Basic.lean` | Multiplication is composition on linear automorphisms | B0 |
| `mathlib:LinearEquiv.applyDistribMulAction` | instance | `Mathlib/Algebra/Module/Equiv/Basic.lean` | Linear automorphisms act on the module | B0 |
| `mathlib:UpperHalfPlane.denom_ne_zero` | theorem | `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean` | The Mobius denominator does not vanish on the upper half-plane | B0 |
| `mathlib:UpperHalfPlane.denom_cocycle` | theorem | `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean` | Raw complex Möbius denominator identity with im(z)≠0. On H it matches the shifted action cocycle for positive determinant; full GL2 requires the separate σ-twisted denom_cocycle′. | B0 |
| `mathlib:UpperHalfPlane.denom_cocycle'` | theorem | `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean` | The full determinant-sign twisted cocycle | B0 |
| `mathlib:ModularForm` | structure | `Mathlib/NumberTheory/ModularForms/Basic.lean` | Integer-weight scalar slash-invariant holomorphic functions bounded at every cusp | B0 |
| `mathlib:CuspForm` | structure | `Mathlib/NumberTheory/ModularForms/Basic.lean` | Integer-weight scalar slash-invariant holomorphic functions zero at every cusp | B0 |
| `mathlib:AlgebraicGeometry.Scheme.Modules` | def | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | The existing sheaf-of-modules category on a scheme | B0/B5 |
| `mathlib:AlgebraicGeometry.Scheme.Modules.presheaf` | def | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | The abelian presheaf of an O-module | B0 |
| `mathlib:AlgebraicGeometry.Scheme.Modules.pushforward` | def | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | Scheme module pushforward | B0 |
| `mathlib:AlgebraicGeometry.Scheme.Modules.pushforward_obj_obj` | theorem | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | Pushforward section evaluation | B0 |
| `mathlib:AlgebraicGeometry.Scheme.Modules.Hom.app` | def | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean` | A module-sheaf morphism evaluated on an open set | B0 |
| `mathlib:SheafOfModules.sections` | abbrev | `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean` | Existing type of compatible global sections | B0 |
| `mathlib:SheafOfModules.sectionsMap` | abbrev | `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean` | Map on compatible sections | B0 |
| `mathlib:SheafOfModules.sectionsMap_comp` | theorem | `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean` | Section-map composition | B0 |
| `mathlib:SheafOfModules.sectionsMap_id` | theorem | `Mathlib/Algebra/Category/ModuleCat/Sheaf.lean` | Section-map identity | B0 |
| `mathlib:ModularForm.trace` | def | `Mathlib/NumberTheory/ModularForms/NormTrace.lean` | Unnormalized analytic trace for modular forms from a finite-relative-index subgroup; the cosets are those of the intersection, and subgroup containment is not required by this definition. | B5 |
| `mathlib:CuspForm.trace` | def | `Mathlib/NumberTheory/ModularForms/NormTrace.lean` | The same unnormalized trace on cusp forms, preserving vanishing at every cusp. | B5 |
| `tauceti:HeckeRing.GL2.twistedHeckeSlashSum_diagCosetGamma0_of_prime` | theorem | `TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Prime/Basic.lean` | For positive level, a prime coprime to the level and a function in the actual nebentypus space, identifies the twisted prime double-coset sum with its upper-triangular part plus the character-weighted scaling term. This is an analytic normalization input, not an algebraic correspondence theorem. | B5 |
| `mathlib:PowerSeries.isUnit_iff_constantCoeff` | theorem | `Mathlib/RingTheory/PowerSeries/Inverse.lean` | Over a ring, a formal power series is a unit exactly when its constant coefficient is a unit. In particular 1-X is a unit. This supplies the algebraic regression against an unrestricted map of face-stratum completions, not a toroidal comparison theorem. | B5 |
| `mathlib:CategoryTheory.ShortComplex.mono_τ₂_of_exact_of_mono` | theorem | `Mathlib/Algebra/Homology/ShortComplex/Exact.lean` | For a morphism of short complexes in a preadditive balanced category, exactness of the source row, monicity of both first row maps, and monicity of the two outer vertical maps imply monicity of the middle vertical map. No epimorphism of the last row map is required. B5 must construct its actual section/expansion diagram before applying this existing theorem. | B5 |
| `mathlib:IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime` | theorem | `Mathlib/RingTheory/Ideal/AssociatedPrime/Finiteness.lean` | For any commutative Noetherian ring R and finite R-module M, a RelSeries of actual submodules from bottom to top whose successive quotients are R-linearly equivalent to R/p for prime ideals p. No localness, completeness, finite length or freeness is assumed. | B5 |
| `mathlib:IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime` | theorem | `Mathlib/RingTheory/Ideal/AssociatedPrime/Finiteness.lean` | Induction for properties of finite modules over any commutative Noetherian ring: subsingleton modules, modules linearly equivalent to R/p, and short exact coefficient sequences with injective first map, surjective second map and Function.Exact. The motive and equivalence form preserve the module-universe distinction. | B5 |
| `mathlib:Ideal.iInf_pow_smul_eq_bot_of_isLocalRing` | theorem | `Mathlib/RingTheory/Filtration.lean` | For a finite module over a commutative Noetherian local ring and a proper ideal I, the intersection of I-power multiples is zero. | B5 |
| `mathlib:IsHausdorff.of_isLocalRing` | theorem | `Mathlib/RingTheory/AdicCompletion/Noetherian.lean` | A finite module over a Noetherian local ring is I-adically separated for any proper ideal I. | B5 |
| `mathlib:AdicCompletion.of_injective` | theorem | `Mathlib/RingTheory/AdicCompletion/Basic.lean` | The canonical linear map from an I-adically separated module to its actual AdicCompletion is injective. | B5 |
| `tauceti:HeckeCosetModule.instRingHeckeRing` | instance | `TauCeti/NumberTheory/HeckeRing/Associativity.lean` | The existing convolution ring on HeckeCosetModule for an IsHeckeTriple; B5 constructs its geometric representation, never another Hecke ring. | B5 |
| `tauceti:HeckeRing.GL2.heckeRingHomCharSpace` | def | `TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Action.lean` | Existing analytic ring action on the actual weight-k nebentypus space over C, with integral double-coset coefficients. The geometric compatibility is new, not this action. | B5 |
| `mathlib:UpperHalfPlane.qExpansion` | def | `Mathlib/NumberTheory/ModularForms/QExpansion.lean` | Taylor coefficients of the cusp function for q=exp(2πiτ/h); a function-to-PowerSeries C definition, with positive strict-period hypotheses needed by its analytic lemmas. | B5 |
| `mathlib:ModularForm.qExpansion_injective` | theorem | `Mathlib/NumberTheory/ModularForms/QExpansion.lean` | Injectivity for analytic modular forms of fixed integer weight, positive real h in the subgroup strict periods. It does not supply an integral or all-cusp geometric principle. | B5 |
| `mathlib:ModularForm.isCuspForm_iff_coeffZero_eq_zero` | theorem | `Mathlib/NumberTheory/ModularForms/CuspFormSubmodule.lean` | Zero constant coefficient at infinity characterizes cusp forms for the full modular group SL2(Z); not a theorem for one cusp at arbitrary level. | B5 |
| `mathlib:Algebra.trace_algebraMap_of_basis` | theorem | `Mathlib/RingTheory/Trace/Defs.lean` | With an actual basis b indexed by a finite type, algebra trace of a base scalar is card(index) times it. This local finite-free trace calculation is not a global finite-projective sheaf trace. | B5 |
| `tauceti:AlgebraicGeometry.Scheme.Modules.tensorProduct` | abbrev | `TauCeti/AlgebraicGeometry/Modules/TensorProduct.lean` | Actual sheafified tensor product of O_X modules, specialized from the site-level TauCeti tensor product. No tensor/global-sections interchange is included. | B5 |
| `mathlib:AlgebraicGeometry.tilde.isoTop` | def | `Mathlib/AlgebraicGeometry/Modules/Tilde.lean` | The actual ModuleCat isomorphism between a module and global sections of its affine tilde sheaf. Used for the supplied Tate coefficient trivialization, not a construction of the Shimura/Tate chart. | B5 |

## Layer overview

Ninety-six nodes in nine layers: 68 in the B0 packet and 28 in the B5 packet. Every layer is *planned* (each target is a node whose prerequisite chains end in the libraries, in another roadmap’s node or requested stage, or in a recorded gap); none is *closed*. There are 33 planets, at most six per layer.

| Layer | Title | Packet | Nodes | Coverage | Planets |
|---|---|---|---:|---|---|
| B0 | Associated bundles and coefficient descent | B0 | 9 | planned | Automorphic coefficient quotient; Compact-dual coefficient |
| B1 | Canonical principal bundles over number fields | B0 | 10 | planned | Tensor stabilizer theorem; Absolute Hodge tensor theorem; Tensor-preserving frame torsor; Hodge-type canonical principal bundle; Abelian-type canonical principal bundle |
| B1.general | General-data canonical principal bundles | B0 | 6 | planned | Connected principal bundle conjugation; Adjoint second-jet realization; General canonical principal bundle |
| B2 | Automorphic bundles and realizations | B0 | 9 | planned | Automorphic vector bundle; Betti automorphic local system; Étale automorphic local system; Filtered de Rham automorphic coefficient |
| B2.general | General-data coefficients and realizations | B0 | 3 | planned | General automorphic coefficient model; General full-group realizations |
| B3 | Canonical and subcanonical extensions | B0 | 10 | planned | Canonical automorphic extension; Subcanonical automorphic extension; Fan-independent automorphic sections; Logarithmic automorphic connection |
| B3.general | General-data boundary extensions | B0 | 3 | planned | General canonical automorphic extension; General boundary compatibility |
| B4 | Classical forms and explicit weights | B0 | 18 | planned | Classical automorphic forms; Cuspidal automorphic forms; Automorphy factor; Geometric–analytic forms comparison; Arithmetic Hilbert weight |
| B5 | Hecke action and Fourier expansions | B5 | 28 | planned | Fourier-Jacobi expansion; Boundary constant term; Expansion principle; Hecke operators; Hilbert q-expansion principle; Siegel Hodge–Tate decomposition |

The layers are printed in dependency order, which differs from the atlas’s listing (B0–B5, then the three general-data layers): B1.general, B2.general and B3.general come before B4, because `B4/classical-forms` defines the form spaces for general data too, through `B3.general/general-canonical-extension` and `B3.general/general-boundary-functoriality`, and B5’s vector expansions cite B3.general. Within B5 the nodes are grouped into the five sub-layers below, in packet order; the B5 packet’s structural proposal groups them into four presentation sub-layers (Fourier–Jacobi theory, Hecke action, modular and Hilbert comparisons, classical cohomological comparisons), and the grouping here refines that proposal without changing a node id or the single stage id `AutomorphicBundles:B5`.

## B0 — Associated bundles and coefficient descent

B0 sets up the coefficients before any canonical model exists. The coefficient group is the quotient Gᶜ = G/Z_s (`B0/central-split-quotient`), whose representations are the ones that can give automorphic local systems; a coefficient descends to an arithmetic quotient exactly when the ineffective centre and the finite stabilizers act trivially on its fibres (`B0/ineffective-fibre-descent`). The Hodge parabolic and its opposite are fixed once (`B0/hodge-parabolic-convention`). A representation of the parabolic Pᶜ, over a characteristic-zero field containing the reflex field and a field of definition of the representation, gives a Gᶜ-equivariant bundle on the compact dual (`B0/compact-dual-coefficient`), which descends to its field of definition by a semilinear descent datum (`B0/coefficient-galois-descent`). On the analytic side the Borel embedding pulls the compact-dual torsor back to the homogeneous Hodge torsor of filtered frames (`B0/homogeneous-hodge-torsor`), and associated coefficients descend to arithmetic quotients (`B0/analytic-coefficient`), where sections are equivariant functions with the shifted left cocycle (`B0/sections-equivariant`). Once the canonical principal bundle of B1 exists, the algebraic and analytic associated coefficients agree after analytification (`B0/geometric-analytic-coefficients`); GAGA is used only on a proper toroidal model.

The generic machinery underneath (principal algebraic torsors, contracted products, the central quotient torus) is not planned here: the campaign names ReductiveGroupsPartII as its owner, and none of that roadmap’s current stages plans it, which is the first gap of the B0 packet.

**Coverage: planned.** What remains in this layer:

- Generic algebraic associated-bundle interface has no nominated stage: The campaign nominates ReductiveGroupsPartII for principal algebraic G torsors, contracted products, G-equivariant bundle descent, pullback and exact tensor/dual functoriality. Its current RG2.0–RG2.5 stages cover different targets and contain no such stage. Add an explicitly assigned extension stage rather than duplicating that construction here. QCoh fpqc descent alone does not construct representable principal/associated bundles. Analytic torsor pullback and analytification compatibility must be matched to this interface.
- Reductive algebraic group interfaces beyond the current supplier scope: Needed are the precise central Z_s torus and quotient universal property, algebraic frame/stabilizer representability, characteristic-zero Chevalley tensor realization and semisimplicity, and general algebraic Levi highest-weight/dual classification over splitting fields. Upstream ClassicalGroups supplies the complex classical Schur/highest-weight cases, not all Q-groups, nonsplit descent or integral Schur sheaves. These extensions belong in the reductive/representation direction, not as private automorphic replacements.
- The ineffective arithmetic centre beyond finite tame quotients: R09.5’s finite/tame coarse-space statements do not alone prove descent through an infinite arithmetic central kernel. Give the analytic effective quotient and algebraic coefficient-group compatibility, proving that the fibre action is trivial on that kernel. Use H0/H3/H4 for the Hilbert groups; do not infer this from neatness.
- Resolve this stage’s listed supplier requests and replace prose-only geometric contracts by typed signatures on the actual supplied carriers; then independently verify proof refinements. All implementation status remains unchecked.
- Typed geometric signature gap: see the exact named contract inventory in the suggested file and the packet gap. Its comments are not elaborated declarations.

### The coefficient quotient Gᶜ

`AutomorphicBundles:B0/central-split-quotient` · construction · proposed declaration `AutomorphicBundles.centralSplitQuotient` · planet “Automorphic coefficient quotient” · packet B0

For a reductive Q-group G occurring in a Shimura datum, let Z_s be the largest central Q-subtorus which is R-split and has no nonzero Q-split subtorus (equivalently the character-lattice conditions in Milne III, p.52). Construct Gᶜ=G/Z_s, its quotient homomorphism, and the universal factorization of algebraic representations trivial on Z_s. Use this coefficient quotient, not Gᵈᵉʳ or Gᵃᵈ. Lan §5.3 describes Z_s equivalently as the minimal central subtorus removing the excess real split rank.

**Construction.**

1. Use the central-torus character lattice to construct Z_s; its existence/uniqueness is the recorded reductive-group interface gap.
2. Form the algebraic quotient G/Z_s via the recorded quotient interface.
3. Apply the quotient universal property to representations with trivial Z_s action; the construction does not assert every G-representation factors.

**API.**

- `AutomorphicBundles.centralSplitQuotient_quotient` (projection): The algebraic epimorphism q:G→Gᶜ has kernel Z_s.
- `AutomorphicBundles.centralSplitQuotient_factor` (universal-property): If ρ|Z_s=1 there is a unique ρᶜ with ρ=ρᶜ∘q.
- `AutomorphicBundles.centralSplitQuotient_factor_iff` (characterisation): An algebraic representation factors through q iff Z_s acts trivially.

**Unit tests.**

- `AutomorphicBundles.centralSplitQuotient_test_gl2` (computation): For G=GL2/Q, ranks of its centre over Q and R agree, so Z_s=1 and Gᶜ=G.
- `AutomorphicBundles.centralSplitQuotient_test_hilbert` (non-example): For G=Res(F/Q)GL2 with [F:Q]>1 totally real, Z_s has dimension [F:Q]−1; replacing Gᶜ by G without a central condition admits forbidden coefficients.
- `AutomorphicBundles.centralSplitQuotient_test_trivial` (degenerate): The trivial representation factors through Gᶜ and stays trivial.

**Acceptance.**

- For GL2/Q the quotient retains the central weight character; for a totally real restriction of scalars the excess real split centre must be removed.

**Used by.**

- Milne III §§3,5: Chooses the actual structure group of the standard principal bundle.
- Lan §5.3: Distinguishes group-valued local systems from arbitrary Levi coefficients.

**Depends on.** nothing beyond its statement.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B0`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III §1, p.52; III §3, p.58: “G c” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.
- [LanIntro], §5.3 Theorem 5.3.1, p.63: “the same split ranks over Q and R” — Equivalent coefficient-group description; this stage does not prove Liu–Zhu’s p-adic geometricity theorem.

### Ineffective stabilizers and coefficient descent

`AutomorphicBundles:B0/ineffective-fibre-descent` · theorem · proposed declaration `AutomorphicBundles.ineffectiveFibreDescent` · packet B0

In characteristic zero, for a finite stabilizer quotient admitting a tame coarse space, an equivariant vector bundle descends locally freely precisely when every geometric stabilizer acts trivially on its fibre. For Γ\X, distinguish the ineffective arithmetic centre Γ∩Z(G)(Q) from finite orbifold stabilizers; divide by the former only for coefficients on which it acts trivially. Neatness removes torsion, not non-torsion central units.

**Proof.**

1. Import the tame coarse-quotient descent criterion from R09.5; the application to infinite arithmetic ineffective kernels is a separately recorded interface gap.
2. Compute the action of the ineffective kernel on each fibre before taking the effective quotient.
3. A nontrivial stabilizer character gives a stack coefficient but not the asserted coarse vector bundle.

**Acceptance.**

- For a Hilbert datum a neat arithmetic subgroup can still contain infinitely many central units; no implication neat⇒trivial coefficient centre is used.

**Depends on.** this roadmap: `B0/central-split-quotient`; stages of other roadmaps: `AlgebraicModuliForArithmeticGeometry:R09.5`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B0`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III §8, pp.63–64: “the kernel” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

### Hodge and opposite parabolic conventions

`AutomorphicBundles:B0/hodge-parabolic-convention` · comparison · proposed declaration `AutomorphicBundles.hodgeParabolicConvention` · packet B0

Fix μ_h(z)=h_C(z,1), acting by z^(−p) on H^{p,q}, and F^a=⊕_{p≥a}H^{p,q}. Its filtration stabilizer is P_H=P(μ_h⁻¹) in the dynamic-parabolic convention, with Levi M=Z_G(μ_h). The Hodge–Tate flag convention uses the opposite P_HT=P(μ_h). Right cosets G/P_H and left cosets P_H\G are compared by inversion; their associated-bundle conventions must transform ρ to the corresponding inverse/dual convention, not replace P_H by P_HT under the same name.

**Proof.**

1. Import the exact filtration-parabolic and compact-dual nodes of ShimuraData D3.
2. Calculate the limit condition on each block of a filtered representation to identify P_H and its opposite.
3. Apply inversion to the principal right-coset description; compare fibre relations before translating highest weights.

**Acceptance.**

- For GL2 homology type (−1,0),(0,−1), the stabilizer preserves F⁰, whereas the opposite stabilizes the complementary line.

**Depends on.** other roadmaps: `ShimuraData:D3/filtration-parabolic`, `ShimuraData:D3/compact-dual`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B0`, namespace `AutomorphicBundles`.

**Sources.**

- [CS17], §2.3, pp.669–671: “the descending” — The tensor-frame/filtration construction in the version of record.
- [BCGP], §3.2.13–3.2.16, p.44; §4.8 before Remark 4.8.1, p.101: “Pµ” — The left-coset flag convention is on p.44; the chosen Hodge–Tate parabolic and rational cocharacter are on p.101. CS pp.669–670 supplies the descending Hodge filtration. These are different conventions to compare, not interchangeable labels.

### Equivariant coefficients on the compact dual

`AutomorphicBundles:B0/compact-dual-coefficient` · construction · proposed declaration `AutomorphicBundles.compactDualCoefficient` · planet “Compact-dual coefficient” · packet B0

Over a characteristic-zero coefficient field L containing the reflex field and a field of definition of the representation, on the compact-dual form X̌_L construct the Gᶜ-equivariant bundle attached to an algebraic representation ρ of the Hodge parabolic Pᶜ. After a splitting extension it is Gᶜ_L×^{Pᶜ}V with (g,v)~(gp,ρ(p)⁻¹v). A Levi representation is inflated along Pᶜ→Mᶜ; P representations with nontrivial unipotent action are not silently declared Levi representations.

**Construction.**

1. Import the compact-dual descent from ShimuraData D3.
2. Apply the missing generic algebraic associated-bundle interface to the principal Pᶜ torsor Gᶜ→X̌.
3. Descend the equivariant coefficient over its actual field of definition by R09.3, retaining the P action.

**API.**

- `AutomorphicBundles.compactDualCoefficient_fibre` (projection): At the base flag the P-equivariant fibre is V with action ρ.
- `AutomorphicBundles.compactDualCoefficient_inflate` (compatibility): The coefficient for an M representation equals that for its inflation to P.
- `AutomorphicBundles.compactDualCoefficient_tensor` (functoriality): Associated coefficients preserve tensor products, duals and the tensor unit.
- `AutomorphicBundles.compactDualCoefficient_map` (functoriality): For a Pᶜ-equivariant linear map u:V→W over the fixed coefficient field, the induced map sends [g,v] to [g,u(v)] on the associated compact-dual bundles.
- `AutomorphicBundles.compactDualCoefficient_map_id` (simp): For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `AutomorphicBundles.compactDualCoefficient_map_comp` (functoriality): For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Unit tests.**

- `AutomorphicBundles.compactDualCoefficient_test_unit` (degenerate): The trivial one-dimensional representation yields O_X̌.
- `AutomorphicBundles.compactDualCoefficient_test_gl2` (compatibility): For G=GL2/L and P the stabilizer of Le₁, the contracted-product bundle for χ(p)=a when pe₁=ae₁ is O_(P¹)(−1), via [g,v]↦vge₁; the inverse character χ⁻¹ gives O_(P¹)(1). The cohomological Hodge convention must declare which of these characters is used.
- `AutomorphicBundles.compactDualCoefficient_test_unipotent` (non-example): The standard P representation with a nontrivial upper-triangular unipotent action is not isomorphic as P-module to its associated graded inflation.

**Acceptance.**

- Evaluation at the base flag recovers the given P representation.

**Used by.**

- Milne III §5: Input J for automorphic bundle descent.
- BCGP §3.2.19: Compares the tautological filtered standard representation with its two graded coefficients.

**Depends on.** this roadmap: `B0/central-split-quotient`, `B0/hodge-parabolic-convention`; other roadmaps: `ShimuraData:D3/reflex-flag-descent`, `AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B0`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III §2, Remark 2.3(a), pp.54–56: “vector bundles” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

### The analytic filtration torsor

`AutomorphicBundles:B0/homogeneous-hodge-torsor` · construction · proposed declaration `AutomorphicBundles.homogeneousHodgeTorsor` · packet B0

Pull the complex principal Pᶜ torsor Gᶜ_C→X̌_C back along the Borel embedding X→X̌(C). Its sections are frames identifying the varying Hodge filtration with the reference filtration. The quotient by U(Pᶜ) is the Levi torsor of graded frames; no flat connection on this Levi torsor is asserted.

**Construction.**

1. Import the holomorphic Borel embedding and homogeneous variation from D3.
2. Use pullback of the existing principal P torsor, supplied by the associated-bundle gap.
3. Pass to the U quotient; identify graded frames rather than full filtered frames.

**API.**

- `AutomorphicBundles.homogeneousHodgeTorsor_filtered_frames` (characterisation): A point is a tensor-compatible frame identifying the reference and varying filtrations.
- `AutomorphicBundles.homogeneousHodgeTorsor_graded` (projection): The U quotient parametrizes individual frames of the graded pieces.
- `AutomorphicBundles.homogeneousHodgeTorsor_pullback_coefficient` (compatibility): Associating a P coefficient to this torsor is the Borel pullback of its compact-dual bundle.

**Unit tests.**

- `AutomorphicBundles.homogeneousHodgeTorsor_test_point` (computation): At the reference point the torsor has its reference frame.
- `AutomorphicBundles.homogeneousHodgeTorsor_test_standard` (compatibility): For the symplectic standard representation the associated filtration is the Hodge exact sequence.
- `AutomorphicBundles.homogeneousHodgeTorsor_test_graded` (non-example): Two filtered frames differing by a nonidentity unipotent element have the same graded frame, but remain distinct filtered frames.

**Acceptance.**

- In a Siegel example the Levi frame torsor is the frame torsor of the Hodge bundle together with the similitude line.

**Used by.**

- Caraiani–Scholze Lemmas 2.3.4–2.3.5: Defines the graded de Rham torsor and its coefficient functor.

**Depends on.** this roadmap: `B0/compact-dual-coefficient`; other roadmaps: `ShimuraData:D3/borel-embedding`, `ShimuraData:D3/homogeneous-variation`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B0`, namespace `AutomorphicBundles`.

**Sources.**

- [CS17], §2.3, p.670: “trivializing the graded pieces” — The tensor-frame/filtration construction in the version of record.

### Analytic arithmetic-quotient coefficients

`AutomorphicBundles:B0/analytic-coefficient` · construction · proposed declaration `AutomorphicBundles.analyticCoefficient` · packet B0

For a torsion-free effective arithmetic action Γ_eff on X, and a homogeneous coefficient on which the ineffective kernel of Γ acts trivially, descend the Borel-pullback coefficient to Γ_eff\X. On an adelic component the description is Γ\(G(R)×V)/K_∞ with (g,v)·k=(gk,ρ(k)⁻¹v), equipped with the holomorphic structure supplied by the compact-dual coefficient.

**Construction.**

1. Use ineffectiveFibreDescent to pass to Γ_eff before asserting local freeness.
2. Use homogeneousHodgeTorsor for the holomorphic structure; a smooth homogeneous quotient alone does not provide it.
3. Apply analytic local triviality and quotient gluing, whose generic torsor interface remains a gap.

**API.**

- `AutomorphicBundles.analyticCoefficient_local_trivial` (structure): A small quotient chart identifies the coefficient with its holomorphic product bundle.
- `AutomorphicBundles.analyticCoefficient_section_equiv` (equivalence): Sections correspond to equivariant functions under the diagonal fibre relation.
- `AutomorphicBundles.analyticCoefficient_change_frame` (compatibility): Changing the frame conjugates the transition cocycle and preserves the descended bundle.
- `AutomorphicBundles.analyticCoefficient_map` (functoriality): An equivariant morphism u between the supplied compact-dual coefficients descends on each effective analytic quotient; in a compatible frame it sends the class of (x,v) to (x,u(v)).
- `AutomorphicBundles.analyticCoefficient_map_id` (simp): For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `AutomorphicBundles.analyticCoefficient_map_comp` (functoriality): For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Unit tests.**

- `AutomorphicBundles.analyticCoefficient_test_trivial` (degenerate): The trivial representation gives the holomorphic structure sheaf on Γ_eff\X.
- `AutomorphicBundles.analyticCoefficient_test_odd` (non-example): The −1 stabilizer acts by −1 on an odd-weight GL2 coefficient, so that coefficient does not descend to the coarse quotient unless that stabilizer is removed.
- `AutomorphicBundles.analyticCoefficient_test_rank` (characterisation): The local rank equals dim V, independent of the arithmetic component.

**Acceptance.**

- Recover f(γgk)=ρ(k)⁻¹f(g) on a homogeneous frame.

**Used by.**

- Harris 4fibres: Connects geometric sections to functions on an adelic quotient.
- B4 analytic comparison: Supplies the holomorphic bundle behind transformation laws.

**Depends on.** this roadmap: `B0/ineffective-fibre-descent`, `B0/homogeneous-hodge-torsor`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B0`, namespace `AutomorphicBundles`.

**Sources.**

- [HarrisCours4], Entire note, pp.1–2: “τ (k)−1” — The right quotient relation and equivariant section convention, with holomorphy treated separately.

### Sections as equivariant functions

`AutomorphicBundles:B0/sections-equivariant` · comparison · proposed declaration `AutomorphicBundles.sectionsEquivariant` · packet B0

For a principal right P torsor T→S and the associated coefficient with (t,v)~(tp,ρ(p)⁻¹v), a section is equivalent to a function f:T→V with f(tp)=ρ(p)⁻¹f(t), in the algebraic or analytic category of that torsor. With a left arithmetic action the corresponding frame factor satisfies J(gh,x)=J(g,hx)J(h,x).

**Proof.**

1. Apply the supplier’s associated-bundle descent equivalence.
2. Evaluate a section in a torsor frame; equality of representatives forces the inverse in the right equivariance formula.
3. Compose two left frame changes and retain the shifted base point.

**Acceptance.**

- Noncommuting fibre maps distinguish this relation from the wrong product order.

**Depends on.** this roadmap: `B0/compact-dual-coefficient`, `B0/analytic-coefficient`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B0`, namespace `AutomorphicBundles`.

**Sources.**

- [HarrisCours4], p.1, equation (1) and its consistency check: “f (γgk) = τ (k)−1 f (g).” — Equivariant sections of the diagonal quotient; the left cocycle follows by composing frames.

### Descent over the coefficient field

`AutomorphicBundles:B0/coefficient-galois-descent` · construction · proposed declaration `AutomorphicBundles.coefficientGaloisDescent` · packet B0

For a finite Galois extension L/E, a coefficient on the compact-dual form and its semilinear isomorphisms d_σ:σ*J→J satisfying d_στ=d_σ∘σ*d_τ descend the coefficient to E. The same applies to the compatible associated coefficient on the canonical torsor. If only the highest weight is given, first compute its Galois stabilizer; do not assume a splitting-field representation is defined over the reflex field.

**Construction.**

1. Use fpqc quasi-coherent descent at R09.3 on the finite Galois cover.
2. Use finite locally free descent (requested separately at that stage) to preserve rank and duals.
3. Descend the equivariant structure and compare association after scalar extension.

**API.**

- `AutomorphicBundles.coefficientGaloisDescent_base_change` (compatibility): The descended coefficient tensored with L is the original J with its given descent maps.
- `AutomorphicBundles.coefficientGaloisDescent_unique` (extensionality): Morphisms over E are exactly L-morphisms compatible with all d_σ.
- `AutomorphicBundles.coefficientGaloisDescent_associate` (functoriality): Descent commutes with association to a descended principal torsor.
- `AutomorphicBundles.coefficientGaloisDescent_map` (functoriality): A coefficient morphism commuting with the actual semilinear Galois descent isomorphisms descends uniquely; its base change is the supplied split-coefficient morphism.
- `AutomorphicBundles.coefficientGaloisDescent_map_id` (simp): For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `AutomorphicBundles.coefficientGaloisDescent_map_comp` (functoriality): For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Unit tests.**

- `AutomorphicBundles.coefficientGaloisDescent_test_identity` (degenerate): For L=E and the identity datum descent returns J.
- `AutomorphicBundles.coefficientGaloisDescent_test_parallel` (computation): For a real quadratic F split by L/E, the split tensor of the two embedding-labelled Hodge lines with equal exponent r admits the factor-swap descent isomorphism; applying the nontrivial permutation twice is identity. Retain the actual descent datum of the underlying HB family.
- `AutomorphicBundles.coefficientGaloisDescent_test_nonparallel` (non-example): For a real quadratic F and weight (k1,k2) with k1≠k2, the nontrivial embedding permutation does not fix the label; it cannot be descended by declaring all d_σ identities.

**Acceptance.**

- A nonparallel Hilbert weight can require a coefficient field strictly larger than Q.

**Used by.**

- Milne III Theorem 5.1: Keeps reflex and coefficient fields distinct.
- B4 unsplit Hilbert coefficients: Descends embedding-labelled weights.

**Depends on.** this roadmap: `B0/compact-dual-coefficient`; other roadmaps: `AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B0`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III §5, Theorem 5.1, p.61: “a number field” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

### Algebraic and analytic coefficient descent

`AutomorphicBundles:B0/geometric-analytic-coefficients` · comparison · proposed declaration `AutomorphicBundles.geometricAnalyticCoefficients` · packet B0

For an algebraic canonical principal bundle Π→S and its compact-dual map γ, analytification of the algebraically associated J coefficient equals the descended analytic coefficient of J. This follows by analytifying the actual descent maps. It is not an assertion that every analytic bundle on nonproper S is algebraic; GAGA is used only on a proper toroidal model.

**Proof.**

1. Apply the missing analytification/associated-descent compatibility interface locally on Π.
2. Check that γ restricts to the Borel embedding on analytic uniformization charts.
3. Glue the local coefficient comparison; projective GAGA is unnecessary for this open-space comparison.

**Acceptance.**

- The comparison transports the same frame factor, not merely an isomorphic unfiltered smooth bundle.

**Depends on.** this roadmap: `B0/coefficient-galois-descent`, `B0/analytic-coefficient`; stages of other roadmaps: `ComplexComparisonPartII:C0`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B0`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III §3, Lemma 3.1 and Propositions 3.2–3.5, pp.58–59: “principal bundle” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

## B1 — Canonical principal bundles over number fields

B1 constructs the canonical principal bundle over the reflex field E for Hodge-type and abelian-type data, following Milne III §§3–4 and the tensor construction of Caraiani–Scholze. A reductive group is the stabilizer of finitely many tensors in a faithful representation (`B1/finite-tensor-stabilizer`, Deligne Proposition 3.1). For a Hodge-type datum with a symplectic embedding, the defining Hodge tensors have Betti, étale and horizontal de Rham realizations on the universal abelian scheme over E (`B1/hodge-tensor-realizations`); their descent to E uses Deligne’s theorem that Hodge tensors on abelian varieties are absolute Hodge (`B1/absolute-hodge-propagation`), not an identification of Hodge classes with algebraic cycles. The tensor-preserving de Rham frames form a principal G_E-torsor (`B1/tensor-frame-torsor`), whose Hodge filtration gives the compact-dual map γ and the reduction to the Hodge parabolic (`B1/filtration-reduction`). This is the canonical principal bundle of Hodge type (`B1/hodge-canonical-principal-bundle`); it does not depend on the symplectic embedding (`B1/embedding-independence`), it is normalized at special points by the CM reciprocity law of ShimuraVarieties V4 (`B1/cm-principal-normalization`), it extends to abelian type through connected components, central isogenies and finite quotients (`B1/abelian-canonical-principal-bundle`), and it is compatible with level and Hecke pullbacks (`B1/principal-hecke-pullback`). The Hodge- and abelian-type instances are proved before the general one, and they suffice for the Hilbert and Siegel constructions of B4 and B5.

**Coverage: planned.** What remains in this layer:

- Generic algebraic associated-bundle interface has no nominated stage: The campaign nominates ReductiveGroupsPartII for principal algebraic G torsors, contracted products, G-equivariant bundle descent, pullback and exact tensor/dual functoriality. Its current RG2.0–RG2.5 stages cover different targets and contain no such stage. Add an explicitly assigned extension stage rather than duplicating that construction here. QCoh fpqc descent alone does not construct representable principal/associated bundles. Analytic torsor pullback and analytification compatibility must be matched to this interface.
- Reductive algebraic group interfaces beyond the current supplier scope: Needed are the precise central Z_s torus and quotient universal property, algebraic frame/stabilizer representability, characteristic-zero Chevalley tensor realization and semisimplicity, and general algebraic Levi highest-weight/dual classification over splitting fields. Upstream ClassicalGroups supplies the complex classical Schur/highest-weight cases, not all Q-groups, nonsplit descent or integral Schur sheaves. These extensions belong in the reductive/representation direction, not as private automorphic replacements.
- Absolute-Hodge foundation and CM proof refinement: Deligne 2018 author copy Main Theorem 2.11, Principles B and Proposition 6.1 were read. The CM proof through Principles A, split Weil classes and the character computation of §§3–5 was not decomposed in this target pass. A4 supplies degree-one comparisons, not the absolute-cycle theorem. Refine the absoluteHodgePropagation node with the absolute-cycle carrier, CM-case theorem and the deformation/generation proof before calling B1 closed.
- Period torsor and continuous principal-bundle descent: V4/V7 provide CM reciprocity and canonical variety descent, not a complete typed Taniyama/period torsor or effective descent of a principal scheme with connection. Specify the period torsor and normalized CM restriction, full-tower induction, continuity and effectivity of the bundle descent datum. Harris’s annotated errata acknowledges continuity in the historical Aut(C) argument; a cocycle alone is insufficient.
- Resolve this stage’s listed supplier requests and replace prose-only geometric contracts by typed signatures on the actual supplied carriers; then independently verify proof refinements. All implementation status remains unchecked.
- Typed geometric signature gap: see the exact named contract inventory in the suggested file and the packet gap. Its comments are not elaborated declarations.

### Reductive groups as tensor stabilizers

`AutomorphicBundles:B1/finite-tensor-stabilizer` · theorem · proposed declaration `AutomorphicBundles.finiteTensorStabilizer` · planet “Tensor stabilizer theorem” · packet B0

Over a characteristic-zero field k, let G↪GL(V) be a faithful finite-dimensional algebraic representation of a reductive algebraic group. There is a finite family of tensors in finite direct sums of V^{⊗m}⊗(V∨)^{⊗n} whose simultaneous scheme-theoretic stabilizer in GL(V) is G. Tensor spaces, duals and scalar action are part of the statement; preserving a line instead of its tensor generator is insufficient.

**Proof.**

1. Deligne Proposition 3.1(a,b) places a stabilizer line in mixed tensor constructions; generic Chevalley/semisimplicity are the recorded group-interface gap.
2. Reductivity supplies an invariant complement, so the projector tensor fixes the line and complement and has stabilizer G (3.1(c)).
3. Noetherianity of the defining ideal reduces the family to finitely many tensors and identifies the scheme-theoretic stabilizer in characteristic zero.

**Acceptance.**

- For GSp(V,ψ) include the similitude/Tate line; requiring ψ to be fixed in V∨⊗V∨ alone cuts out Sp, not GSp.

**Depends on.** nothing beyond its statement.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B1`, namespace `AutomorphicBundles`.

**Sources.**

- [Deligne82], §3 Proposition 3.1(a–c), pp.22–23: “If H is reductive” — The fixed-tensor criterion; finiteness is its noetherian consequence.
- [CS17], §2.3, p.667: “a finite collection of tensors” — The tensor-frame/filtration construction in the version of record.

### Absolute Hodge tensors in abelian families

`AutomorphicBundles:B1/absolute-hodge-propagation` · theorem · proposed declaration `AutomorphicBundles.absoluteHodgePropagation` · planet “Absolute Hodge tensor theorem” · packet B0

For an abelian variety over an algebraically closed characteristic-zero field admitting an embedding into C, every rational Hodge tensor formed from H¹, its dual and Tate twists is absolute Hodge. In a connected smooth proper abelian family, a horizontal tensor remaining of type (0,0) and absolute at one fibre is absolute at every fibre. The theorem does not assert such tensors are algebraic cycles, nor does it apply to arbitrary general-data motives.

**Proof.**

1. Deligne Main Theorem 2.11 reduces by the CM-family construction (Proposition 6.1) and Principle B (2.12/2.15).
2. Principle B uses the degree-one relative Betti–de Rham/étale comparisons from A4 and horizontal rational local sections.
3. The CM absolute-cycle argument, Principle A, Weil classes and its group-theoretic reduction remain the explicit absolute-Hodge foundation gap; no completion of that chain is claimed.

**Acceptance.**

- Algebraic endomorphisms and polarization tensors of a CM elliptic curve satisfy the statement; no integral Hodge conjecture is used.

**Depends on.** stages of other roadmaps: `AbelianSchemesAndArithmeticModuli:A4`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B1`, namespace `AutomorphicBundles`.

**Sources.**

- [Deligne82], Main Theorem 2.11, pp.19–21; Proposition 6.1, pp.41–42: “it is an absolute Hodge cycle” — States the endpoint and family propagation; the intermediate CM proof is an open foundation.
- [CS17], §2.3 Lemma 2.3.2, pp.668–669: “absolute Hodge” — The tensor-frame/filtration construction in the version of record.

### Descended Hodge-tensor realizations

`AutomorphicBundles:B1/hodge-tensor-realizations` · construction · proposed declaration `AutomorphicBundles.hodgeTensorRealizations` · packet B0

For a Hodge-type datum, a chosen symplectic embedding, and sufficiently small level with universal abelian scheme A/S over its canonical reflex field E, construct the Betti, étale and de Rham realizations of a finite defining family of rational Hodge tensors in H=H₁(A)=(R¹π_* )∨, including Tate twists. De Rham tensors are horizontal, in the required filtration, and defined over E; their descent uses Galois invariance from the level tower and absolute-Hodge compatibility, not merely their being of type (0,0) over C.

**Construction.**

1. Import the universal family and complex uniformization from M3/V5 and degree-one comparisons from A4.
2. Use finiteTensorStabilizer and absoluteHodgePropagation to transport the defining family into each realization.
3. Follow CS Lemma 2.3.2 and AG §3.5: establish the tower’s Galois invariance, then descend the tensor sections and their filtration conditions over E.

**API.**

- `AutomorphicBundles.hodgeTensorRealizations_horizontal` (structure): The de Rham defining tensors satisfy ∇sα,dR=0.
- `AutomorphicBundles.hodgeTensorRealizations_compare` (compatibility): The Betti–de Rham and Betti–étale comparisons send each sα to its named realization, with the same Tate normalization.
- `AutomorphicBundles.hodgeTensorRealizations_galois` (functoriality): After base change to Ebar the named tensor sections are fixed by Gal(Ebar/E), hence descend to E.

**Unit tests.**

- `AutomorphicBundles.hodgeTensorRealizations_test_endomorphism` (compatibility): An algebraic endomorphism of A acts compatibly in all three degree-one realizations.
- `AutomorphicBundles.hodgeTensorRealizations_test_polarization` (characterisation): The polarization tensor is valued in the specified Tate line; ignoring that line changes GSp to Sp.
- `AutomorphicBundles.hodgeTensorRealizations_test_zero` (degenerate): Adding a zero tensor does not change the simultaneous stabilizer or the descended frame torsor.

**Acceptance.**

- For the standard symplectic coefficient the same tensors recover the polarization, endomorphisms and Tate line.

**Used by.**

- AG Proposition 3.5.1: Defines the tensor-preserving de Rham frame torsor.
- CS Lemma 2.3.2: Ensures the tensor frames are defined over the reflex field.

**Depends on.** this roadmap: `B1/finite-tensor-stabilizer`, `B1/absolute-hodge-propagation`; stages of other roadmaps: `AbelianSchemesAndArithmeticModuli:A4`, `PELModuli:M3`, `ShimuraVarieties:V5`, `ShimuraVarieties:V8`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B1`, namespace `AutomorphicBundles`.

**Sources.**

- [CS17], Lemmas 2.3.1–2.3.2, pp.668–669: “defined over E” — The tensor-frame/filtration construction in the version of record.
- [AGHMP], §3.3; §3.5, pp.418–422: “Hodge tensors” — Representation-valued realization and absolute-Hodge descent in the version of record.

### The tensor-preserving de Rham frame torsor

`AutomorphicBundles:B1/tensor-frame-torsor` · construction · proposed declaration `AutomorphicBundles.tensorFrameTorsor` · planet “Tensor-preserving frame torsor” · packet B0

For the Hodge-type H and defining tensors above, the functor T(U)={η:V⊗O_U≃H_dR|U : η(sα)=sα,dR} is represented by a principal G_E torsor on S. The right action is η·g=η∘g. Comparison supplies local nonemptiness; being a closed tensor-preserving subfunctor of Isom alone does not prove it is a torsor. When required, push out to the coefficient group Gᶜ.

**Construction.**

1. Use finiteTensorStabilizer to identify the frame automorphism group.
2. Use hodgeTensorRealizations and the relative comparison to establish fpqc-local existence of a tensor-compatible frame; representability/local freeness uses the recorded generic frame interface.
3. Check the right composition action is simply transitive and descend the frame scheme.

**API.**

- `AutomorphicBundles.tensorFrameTorsor_frame` (projection): A T point is an invertible frame of H carrying every reference tensor to its de Rham realization.
- `AutomorphicBundles.tensorFrameTorsor_right_action` (structure): η·g=η∘g, and T×G→T×_S T is an isomorphism.
- `AutomorphicBundles.tensorFrameTorsor_coefficient` (compatibility): T×^G V identifies with H_dR for the chosen faithful coefficient.

**Unit tests.**

- `AutomorphicBundles.tensorFrameTorsor_test_identity` (computation): For a constant tensor-equipped bundle V⊗O_S, identity is a global frame and T≃G×S.
- `AutomorphicBundles.tensorFrameTorsor_test_sp` (non-example): For a polarization with a separately varying similitude line, the correct tensor frame group is GSp; fixing the alternating form with no Tate line incorrectly yields Sp.
- `AutomorphicBundles.tensorFrameTorsor_test_rank` (characterisation): An isomorphism frame exists only between equal-rank modules and must preserve all tensors, not just the polarization.

**Acceptance.**

- On a trivializing fpqc cover, T is G×U with its standard right action.

**Used by.**

- AG §3.5: Constructs dR realizations of every representation.
- CS §2.3: Supplies the principal torsor from which the filtered and Levi torsors are obtained.

**Depends on.** this roadmap: `B1/finite-tensor-stabilizer`, `B1/hodge-tensor-realizations`, `B0/central-split-quotient`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B1`, namespace `AutomorphicBundles`.

**Sources.**

- [AGHMP], Proposition 3.5.1, pp.421–422: “T -torsor” — The tensor-frame construction for the CM torus instance; the general G construction is supplied by the CS passage in the same node.
- [CS17], §2.3, p.670: “the standard principal bundle” — The tensor-frame/filtration construction in the version of record.

### The filtered frame reduction

`AutomorphicBundles:B1/filtration-reduction` · construction · proposed declaration `AutomorphicBundles.filtrationReduction` · packet B0

The Hodge filtration on the tensor-equipped dR realization determines a Gᶜ-equivariant algebraic map γ:Tᶜ→X̌_E. Over an extension L/E where a reference parabolic P_H is defined, γ⁻¹(reference flag) is a principal P_H torsor. Its pushout along P_H→M is the torsor of graded frames. Over E, retain the descended flag variety rather than inventing an E-rational cocharacter.

**Construction.**

1. Use tensorFrameTorsor and the filtered relative comparison to identify the filtration type locally.
2. Use D3 reflex-flag-descent to construct γ on the E-form of the compact dual.
3. Over a field with a reference flag form the fibre and Levi quotient, then compare back with homogeneousHodgeTorsor analytically.

**API.**

- `AutomorphicBundles.filtrationReduction_flag_map` (projection): γ(ηg)=g⁻¹γ(η) in the chosen right-torsor convention.
- `AutomorphicBundles.filtrationReduction_parabolic_fibre` (characterisation): After choosing the reference flag over L, its inverse image is exactly the tensor-preserving filtered frames.
- `AutomorphicBundles.filtrationReduction_levi` (compatibility): Quotienting the filtered-frame torsor by U identifies frames of gr_F H individually.

**Unit tests.**

- `AutomorphicBundles.filtrationReduction_test_siegel` (compatibility): For the standard Siegel family γ records the Hodge subbundle, with its actual Lagrangian condition.
- `AutomorphicBundles.filtrationReduction_test_zero` (degenerate): For a rank-zero coefficient the induced filtration is zero, even though the principal datum remains the same.
- `AutomorphicBundles.filtrationReduction_test_no_point` (non-example): For the quaternionic Shimura curve of the division algebra B=(−1,3)/Q, the compact dual is the Severi–Brauer conic of B and has no Q-point; the rational γ:Π→X̌_Q does not furnish a section Spec Q→X̌_Q. B is split over R, while 3 is not a norm from Q(i), so this tests an actual nonsplit flag form.

**Acceptance.**

- A reflex flag variety without E-points still receives γ; no global reference frame is asserted.

**Used by.**

- CS Lemmas 2.3.4–2.3.5: Turns the canonical dR torsor into the automorphic coefficient functor.

**Depends on.** this roadmap: `B1/tensor-frame-torsor`, `B0/homogeneous-hodge-torsor`; other roadmaps: `ShimuraData:D3/reflex-flag-descent`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B1`, namespace `AutomorphicBundles`.

**Sources.**

- [CS17], §2.3, pp.669–671: “Mµ -torsor” — The tensor-frame/filtration construction in the version of record.

### Canonical principal bundles of Hodge type

`AutomorphicBundles:B1/hodge-canonical-principal-bundle` · theorem · proposed declaration `AutomorphicBundles.hodgeCanonicalPrincipalBundle` · planet “Hodge-type canonical principal bundle” · packet B0

For a Hodge-type Shimura datum and a sufficiently small effective level, Tᶜ with γ, its flat Gᶜ connection and its Hecke-tower action is the canonical standard principal bundle over E. Its analytification agrees with the homogeneous standard bundle, and its CM restriction satisfies the reciprocity normalization. The result is on characteristic-zero canonical models; it does not produce arbitrary-prime integral models.

**Proof.**

1. Identify the analytic torsor and γ through the actual family uniformization and relative comparison.
2. Use the CM restriction/reciprocity supplier V4 to characterize its E-structure, and the hodge tensors for its algebraic construction.
3. Check the tower action and connection arise from the same tensor-preserving realization; generic connection descent is an explicit interface gap.

**Acceptance.**

- In the Siegel case the associated standard homology coefficient is the dual relative H¹dR with Gauss–Manin connection.

**Depends on.** this roadmap: `B1/tensor-frame-torsor`, `B1/filtration-reduction`; stages of other roadmaps: `ShimuraVarieties:V4`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B1`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III §3, p.58; Theorem 4.3, pp.59–60; Example 4.4(a), p.60: “canonical model” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.
- [AGHMP], §3.5, Proposition 3.5.1 and proof, pp.421–422: “does not depend” — The CM-torus example proves functorial E-linear coefficient descent and independence of the faithful frame representation; the general Hodge-type assertion uses Milne and CS, not a claim that AG treats every Hodge-type datum.

### Independence of symplectic embedding

`AutomorphicBundles:B1/embedding-independence` · theorem · proposed declaration `AutomorphicBundles.embeddingIndependence` · packet B0

Two faithful symplectic embeddings of the same Hodge-type datum give canonically isomorphic Gᶜ torsors, compact-dual maps and associated realizations over E, compatibly with composition. The canonical identification is induced by tensor constructions/projectors or by a common direct-sum embedding; it preserves tensors and filtration, not merely underlying ranks.

**Proof.**

1. Place both representations inside mixed tensor constructions using finiteTensorStabilizer and the generic tensor-representation gap.
2. Transport the defining idempotents by absolute Hodge comparison; CS Remark 2.3.3 ensures they commute with dR descent and filtrations.
3. Compare the two tensor frame functors via these projectors, or via the common embedding; check the canonical maps on a trivializing cover.

**Acceptance.**

- Adding a second faithful representation gives the same principal torsor, with the expected second associated module.

**Depends on.** this roadmap: `B1/hodge-canonical-principal-bundle`, `B1/hodge-tensor-realizations`, `B1/finite-tensor-stabilizer`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B1`, namespace `AutomorphicBundles`.

**Sources.**

- [CS17], Remark 2.3.3; Lemma 2.3.4, pp.669–670: “independent of the choice” — The tensor-frame/filtration construction in the version of record.
- [AGHMP], §3.5, proof of Proposition 3.5.1, p.422: “direct sum” — The torus frame torsors are compared through H ⊕ H′; CS supplies the general Hodge-type symplectic-embedding comparison.

### The special-point normalization

`AutomorphicBundles:B1/cm-principal-normalization` · comparison · proposed declaration `AutomorphicBundles.cmPrincipalNormalization` · packet B0

On a CM subdatum (T,{h}) the canonical principal bundle and its Gᶜ pushout agree with the tensor/period torsor specified by the CM reciprocity law. For σ∈Aut(C), the conjugation isomorphism is normalized by that period torsor and the same Artin reciprocity convention as V4. This is an isomorphism of torsors, not a choice of a canonical rational frame or canonical complex period.

**Proof.**

1. Import the CM reciprocity and reflex norm from V4.
2. Restrict the analytic standard principal bundle to the CM zero-dimensional datum and identify its tensor fibre.
3. Compare the rational and conjugate structures through the period torsor; generic period/Taniyama torsor descent is recorded as a missing supplier interface.

**Acceptance.**

- Changing an Artin convention must invert the reciprocity map in both the variety and the fibre normalization.

**Depends on.** this roadmap: `B1/hodge-canonical-principal-bundle`; stages of other roadmaps: `ShimuraVarieties:V4`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B1`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III Theorem 4.1, p.59; Example 4.2(b), p.59; Remark 4.5, p.60: “special point” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

### Canonical principal bundles of abelian type

`AutomorphicBundles:B1/abelian-canonical-principal-bundle` · theorem · proposed declaration `AutomorphicBundles.abelianCanonicalPrincipalBundle` · planet “Abelian-type canonical principal bundle” · packet B0

The canonical principal bundle construction extends from Hodge-type to abelian-type data by connected components, central isogenies and finite quotients with trivial fibre-kernel action, then induction to the full Shimura tower. It is independent of the chosen Hodge-type cover and agrees with the CM normalization. The centre of the coefficient group and the actual arithmetic kernel remain visible.

**Proof.**

1. Use the Hodge-type construction, embeddingIndependence and cmPrincipalNormalization.
2. Apply the central-isogeny/connected-quotient interfaces from V6, checking the coefficient-kernel action by ineffectiveFibreDescent.
3. Induce compatible connected torsors to the full tower and descend over E; their finite locally free association follows from B0.

**Acceptance.**

- A connected abelian-type cover with a finite central kernel does not descend a coefficient on which that kernel acts nontrivially.

**Depends on.** this roadmap: `B1/hodge-canonical-principal-bundle`, `B1/embedding-independence`, `B1/cm-principal-normalization`, `B0/ineffective-fibre-descent`; stages of other roadmaps: `ShimuraVarieties:V6`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B1`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne88], §7, Lemmas 7.1–7.3 and Proposition 7.4, pp.29–31: “abelian type” — The product, embedding and isogeny reductions with special-point normalization.
- [Milne90], III §4, Theorems 4.1/4.3 and Remark 4.5(ii), pp.59–60: “canonical models” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

### Hecke pullback of the canonical torsor

`AutomorphicBundles:B1/principal-hecke-pullback` · comparison · proposed declaration `AutomorphicBundles.principalHeckePullback` · packet B0

At finite levels K′⊂K and along a Hecke translation a, the canonical principal bundles identify under the actual finite étale tower maps, preserving γ, the flat connection and CM normalization. Associated coefficients carry induced pullback isomorphisms with identity/composition laws. This is not the pull–trace action on cohomology owned by B5.

**Proof.**

1. Use the tower maps and algebraic uniformization supplied by V3/V5/V6.
2. Define the isomorphism on the standard analytic bundle and identify its canonical E-structure by the CM condition.
3. Check composition on a common smaller level, so the coefficient action is coherent.

**Acceptance.**

- A pair of Hecke pullbacks composes to their product after passing to a level where both are defined.

**Depends on.** this roadmap: `B1/abelian-canonical-principal-bundle`; stages of other roadmaps: `ShimuraVarieties:V1`, `ShimuraVarieties:V8`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B1`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III Proposition 2.1(a), p.55; Proposition 3.2, p.58; Remark 4.5(i–ii), p.60: “equivariant” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

## B1.general — General-data canonical principal bundles

For general data the canonical principal bundle is a theorem beyond the canonical model of the base variety: a variety defined over the reflex field does not by itself descend an analytic vector bundle. B1.general follows Milne’s *Automorphic vector bundles on connected Shimura varieties*. For a connected datum with G semisimple and simply connected, the σ-conjugate connected principal bundle is constructed with a normalized isomorphism (`B1.general/connected-principal-conjugation`); the adjoint coefficient embeds into the second-jet bundle of the compact dual (`B1.general/adjoint-jet-realization`), using the corrected jet argument rather than Harris’s withdrawn proof; and the rank-one subdata of ShimuraVarieties V7 complete the reduction (`B1.general/general-connected-reduction`), with §9.5’s algebraic-group generation kept separate from §9.2’s rational-point reduction and without the stronger generation statement that Milne flags as conjectural. The result is the canonical principal model over E (`B1.general/general-principal-model`), its rational compact-dual map (`B1.general/general-compact-dual-map`, whose target need not have an E-point) and the normalized conjugation cocycle (`B1.general/general-conjugation-cocycle`).

**Coverage: planned.** What remains in this layer:

- Period torsor and continuous principal-bundle descent: V4/V7 provide CM reciprocity and canonical variety descent, not a complete typed Taniyama/period torsor or effective descent of a principal scheme with connection. Specify the period torsor and normalized CM restriction, full-tower induction, continuity and effectivity of the bundle descent datum. Harris’s annotated errata acknowledges continuity in the historical Aut(C) argument; a cocycle alone is insufficient.
- The second-jet injection and general principal reduction: Milne connected §§3,7,9 were read. Generic second-jet bundles and their equivariant functoriality are not assigned to a current supplier stage, and Lemma 9.4 refers to the corrected Harris 1985 jet injection. Supply that faithful order-two realization and the principal-automorphism argument of Lemmas 9.1–9.3; V7 is requested for the actual generating rank-one subdata, not assumed to prove the bundle step. In addition to §9.5 algebraic-group generation, §9.2 needs generation of G(Q) by the specified special tori and the auxiliary extension/local-isotropy/simplicity argument for the rank-one rational quotients. Footnote 14 does not establish the stronger §8.1 rational-point generation statement; no proof here may rely on it.
- Resolve this stage’s listed supplier requests and replace prose-only geometric contracts by typed signatures on the actual supplied carriers; then independently verify proof refinements. All implementation status remains unchecked.
- Typed geometric signature gap: see the exact named contract inventory in the suggested file and the packet gap. Its comments are not elaborated declarations.

### Conjugation of connected principal bundles

`AutomorphicBundles:B1.general/connected-principal-conjugation` · theorem · proposed declaration `AutomorphicBundles.connectedPrincipalConjugation` · planet “Connected principal bundle conjugation” · packet B0

For a connected Shimura datum (G,X) with G semisimple simply connected, σ∈Aut(C) and a special point x, construct the σ-conjugate connected standard principal bundle with an algebraic normalized isomorphism compatible with its flat connection, compact-dual map, connected Hecke group and the period torsor at x. Under the V7 identification of conjugate data, the isomorphism is independent of auxiliary choices.

**Proof.**

1. Use V7 for the actual conjugate connected variety and its normalized special-point map.
2. For abelian-type subdata use abelianCanonicalPrincipalBundle.
3. Complete the general principal-bundle step by adjoint jets and the rank-one reduction below, not by assuming a universal abelian family.

**Acceptance.**

- The normalized isomorphism is unique with all the stated equivariance/connection conditions.

**Depends on.** this roadmap: `B1/abelian-canonical-principal-bundle`, `B1.general/general-connected-reduction`; stages of other roadmaps: `ShimuraVarieties:V7`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B1/general`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne88], Theorem 3.10 and Corollary 3.11, pp.18–20: “connection” — The connected bundle conjugation target, whose general proof is decomposed in §9.

### The adjoint bundle and second jets

`AutomorphicBundles:B1.general/adjoint-jet-realization` · theorem · proposed declaration `AutomorphicBundles.adjointJetRealization` · planet “Adjoint second-jet realization” · packet B0

In the connected semisimple simply connected setting, the adjoint compact-dual coefficient embeds equivariantly into the second-jet bundle of the compact-dual tangent bundle. The induced algebraic automorphic jet comparison controls the adjoint representation and reduces continuity/normalization of principal conjugation to algebraic geometric data. This uses the corrected jet argument, not Harris’s withdrawn 1984 §3.5 proof.

**Proof.**

1. Import generic second jets and natural group actions through the recorded missing jet interface.
2. Use the homogeneous infinitesimal action on the compact dual and its order-two isotropy separation; the precise faithful jet injection in Milne Lemma 9.4 is the recorded proof-refinement leaf.
3. Transport jets along the V7 algebraic conjugation map and identify the adjoint coefficient.

**Acceptance.**

- First-order tangent data alone are not asserted to give this injection.

**Depends on.** other roadmaps: `ShimuraData:D3/compact-dual`; stages of other roadmaps: `ShimuraVarieties:V7`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B1/general`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne88], §9 Lemmas 9.3–9.4, pp.33–34: “equivariant embedding” — The second-jet route to the adjoint case, citing the corrected Harris 1985 construction.

### The general connected bundle reduction

`AutomorphicBundles:B1.general/general-connected-reduction` · theorem · proposed declaration `AutomorphicBundles.generalConnectedReduction` · packet B0

In Milne’s connected semisimple simply connected principal-bundle conjugation problem, the corrected §9 completion combines adjoint second-jet control with the specified type-A1 subdata to obtain the normalized principal comparison. After the prescribed auxiliary totally real extension, those A1 subgroups generate G as an algebraic group by the root/Lie-algebra argument of Lemma 9.5. The rational-point step uses §9.2’s special-torus generation and auxiliary local-isotropy/simplicity argument; it does not assume Proposition 8.1’s stronger rational-point generation assertion, flagged as conjectural in footnote 14. Lemma 9.3 supplies continuity; the normalized compact-dual map and connection are preserved.

**Proof.**

1. Use adjointJetRealization for the adjoint comparison and abelianCanonicalPrincipalBundle for type-A1 data.
2. Import from V7 the actual auxiliary extension, type-A1 subdata and algebraic-group/root bracket generation of §9.5. For rational points retain the special-torus generation and locally isotropic A1 simplicity reduction of §9.2 as exact requested inputs; do not substitute the unproved stronger §8.1 assertion.
3. Use Lemmas 9.1–9.2 to establish adjoint control and the necessary normalized restrictions, then Lemma 9.3 for continuity. The missing jet/automorphism and rational-point arguments remain explicitly recorded in the gap.

**Acceptance.**

- The proof never invokes a non-abelian-type family of motives.

**Depends on.** this roadmap: `B1.general/adjoint-jet-realization`, `B1/abelian-canonical-principal-bundle`; stages of other roadmaps: `ShimuraVarieties:V7`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B1/general`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne88], §9 Lemmas 9.1–9.5, pp.33–34: “we instead must argue” — The second completion, with type-A1 generation imported from the general-data owner.

### General canonical principal models

`AutomorphicBundles:B1.general/general-principal-model` · theorem · proposed declaration `AutomorphicBundles.generalPrincipalModel` · planet “General canonical principal bundle” · packet B0

For a general pure Shimura datum satisfying Milne II (2.1), the standard Gᶜ principal bundle on the neat effective canonical tower has a canonical algebraic model over its reflex field E. Its analytification is the homogeneous standard bundle, with the canonical flat connection. Continuous effective Weil descent is proved before inferring a model from the conjugation cocycle.

**Proof.**

1. Apply generalConnectedReduction to obtain connected normalized bundle conjugation.
2. Combine the connected bundles with central-torus CM theory and full-tower induction from V7/V8.general.
3. Verify the cocycle and continuity, then use effective descent on the principal scheme and its structure maps; the generic torsor-descent/effectivity interface is an explicit gap.

**Acceptance.**

- General models are characteristic-zero models over number fields; no integral or motivic upgrade follows.

**Depends on.** this roadmap: `B1.general/general-connected-reduction`, `B0/central-split-quotient`; stages of other roadmaps: `ShimuraVarieties:V7`, `ShimuraVarieties:V8.general`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B1/general`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III Theorem 4.3 and Example 4.4, pp.59–60: “canonical model” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

### The rational compact-dual map

`AutomorphicBundles:B1.general/general-compact-dual-map` · theorem · proposed declaration `AutomorphicBundles.generalCompactDualMap` · packet B0

For the general standard principal model Π_E, its complex compact-dual map γ descends as a Gᶜ-equivariant algebraic map Π_E→X̌_E over the reflex field. The target is the descended parabolic-type variety and need not have an E-point. The selected μ and P may require a larger field.

**Proof.**

1. Use generalPrincipalModel and the normalized conjugation comparisons.
2. Use D3 reflex-flag-descent for the correct target form.
3. Check γ commutes with the descent isomorphisms at special points and hence globally by the source’s uniqueness argument.

**Acceptance.**

- The construction descends the conjugacy class of flags, not a chosen E-rational filtration.

**Depends on.** this roadmap: `B1.general/general-principal-model`; other roadmaps: `ShimuraData:D3/reflex-flag-descent`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B1/general`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III Theorem 4.6, pp.60–61: “rational over” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

### Normalized conjugation and its cocycle

`AutomorphicBundles:B1.general/general-conjugation-cocycle` · theorem · proposed declaration `AutomorphicBundles.generalConjugationCocycle` · packet B0

The general canonical principal model and γ admit normalized conjugation isomorphisms for automorphisms of C, compatible with the full Hecke action and flat connection; the two-step conjugation equals the one-step comparison through the canonically twisted datum. Their independence of the normalizing special point supplies the cocycle. The CM uniqueness characterization which also specifies rational Betti structure requires the weight in Gᶜ to be Q-defined as in Milne III Remark 4.5, final paragraph, and Theorem 6.2.

**Proof.**

1. Use generalConnectedReduction and V7 to compare normalizations at different special points.
2. Extend by the full-tower and central-torus constructions of generalPrincipalModel.
3. Apply uniqueness to the two composites; verify continuity separately, rather than declaring every Aut(C) cocycle effective.

**Acceptance.**

- σ=id gives identity; successive conjugation uses the transported datum and CM period torsor, not a fixed unchanged group.

**Depends on.** this roadmap: `B1.general/general-principal-model`, `B1.general/general-compact-dual-map`, `B1.general/general-connected-reduction`; stages of other roadmaps: `ShimuraVarieties:V7`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B1/general`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III Theorem 4.1, p.59; Remark 4.5, p.60; Theorem 6.2, p.62: “weight” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

## B2 — Automorphic bundles and realizations

B2 turns coefficients into bundles on the canonical model. Pulling a Gᶜ-equivariant compact-dual coefficient J back along γ and descending along the canonical torsor gives the automorphic vector bundle V(J) over the coefficient field (`B2/automorphic-vector-bundles-from-representations-of-the-centralizer`); a Levi representation is inflated to the parabolic, and a parabolic representation with nontrivial unipotent action stays one. Its analytification is the arithmetic quotient of the Borel pullback (`B2/automorphic-analytic-comparison`). The highest-weight conventions of Boxer–Calegari–Gee–Pilloni are pinned with their dual and opposite-flag conversions (`B2/levi-highest-weight-convention`). A representation of the whole group Gᶜ gives more: a Betti local system with its arithmetic monodromy (`B2/betti-coefficient-local-system`), an étale local system over E from the canonical ℓ-adic tower (`B2/etale-coefficient-local-system`) and a filtered de Rham bundle with integrable connection and Griffiths transversality (`B2/filtered-de-rham-coefficient`), compared with one another (`B2/realization-comparison`). A Levi representation carries no such flat structure in general, and none is assigned to it. The coefficient functor and the realizations are monoidal and Hecke-compatible (`B2/coefficient-tensor-hecke`), and the Siegel tautological sequence fixes the GSp_{2g} conventions that B4 and B5 use (`B2/siegel-tautological-sequence`).

**Coverage: planned.** What remains in this layer:

- Generic algebraic associated-bundle interface has no nominated stage: The campaign nominates ReductiveGroupsPartII for principal algebraic G torsors, contracted products, G-equivariant bundle descent, pullback and exact tensor/dual functoriality. Its current RG2.0–RG2.5 stages cover different targets and contain no such stage. Add an explicitly assigned extension stage rather than duplicating that construction here. QCoh fpqc descent alone does not construct representable principal/associated bundles. Analytic torsor pullback and analytification compatibility must be matched to this interface.
- Reductive algebraic group interfaces beyond the current supplier scope: Needed are the precise central Z_s torus and quotient universal property, algebraic frame/stabilizer representability, characteristic-zero Chevalley tensor realization and semisimplicity, and general algebraic Levi highest-weight/dual classification over splitting fields. Upstream ClassicalGroups supplies the complex classical Schur/highest-weight cases, not all Q-groups, nonsplit descent or integral Schur sheaves. These extensions belong in the reductive/representation direction, not as private automorphic replacements.
- Full-group local-system and filtered-connection descent interfaces: Construct or import the actual arithmetic quotient local system, continuous ℓ-adic lattice descent on the canonical coefficient tower, filtered algebraic connection descent and the tensor-compatible analytic horizontal-section comparison. Degree-one abelian A4 comparisons handle the family case but do not by themselves state these general associated-representation interfaces. Keep rational Betti weight and coefficient-group hypotheses explicit.
- BCGP analytic/solid and rational Hodge–Tate coefficient comparison: BCGP v1 §§3.2.19,4.5 and 4.8 were read. The finite-dimensional algebraic tautological sequence is planned here. Its embedding into the solid analytic category and the rational Hodge–Tate M-torsor/VB functor are separately supplied inputs to classicalVBTateNormalization. T2/T6 consume B1–B3; reversing those dependencies would make a cycle. Refine the downstream comparison interface and rationality/Tate normalization (BCGP p.78 cites RC22 Theorem 4.2.1) before claiming the complete p-adic comparison. No infinite-dimensional category is rebuilt here.
- Added AG source: integral CM étale extension is outside the generic owner: AG §3.3 constructs lisse coefficients on the specific CM integral stack Y_K[1/ℓ] using its finite étale integral ℓ-level tower; its extension is stronger than the generic-fibre coefficient in B2. The reviewed paper extraction marks this extension missing. Assign/import the CM torus integral tower and finite étale model before adding the integral extension theorem; do not silently attribute it to generic Shimura B2 or to all-prime models.
- Resolve this stage’s listed supplier requests and replace prose-only geometric contracts by typed signatures on the actual supplied carriers; then independently verify proof refinements. All implementation status remains unchecked.
- Typed geometric signature gap: see the exact named contract inventory in the suggested file and the packet gap. Its comments are not elaborated declarations.

### The automorphic coefficient functor

`AutomorphicBundles:B2/automorphic-vector-bundles-from-representations-of-the-centralizer` · construction · proposed declaration `AutomorphicBundles.automorphicVectorBundle` · planet “Automorphic vector bundle” · packet B0

For the canonical Gᶜ torsor Π→S over E with γ:Π→X̌_E, and a Gᶜ-equivariant coefficient J on X̌ over its actual field L/E, descend γ*J along Π_L→S_L to a locally free bundle V(J). Over a field with a reference P_H, this is the associated bundle of the filtered P_H torsor. For a Levi M coefficient inflate along P_H→M. This construction includes general P coefficients without identifying them with Levi coefficients.

**Construction.**

1. Use abelianCanonicalPrincipalBundle (or the separate B2.general supplier below for general data), γ and compactDualCoefficient.
2. Pull back J along γ; its Gᶜ-equivariance supplies fpqc descent data on Π.
3. Apply generic associated-bundle and finite locally free descent interfaces from B0; comparison on filtered frames identifies the Levi description.

**API.**

- `AutomorphicBundles.automorphicVectorBundle_pullback` (characterisation): Π*V(J)≃γ*J with the specified Gᶜ descent action.
- `AutomorphicBundles.automorphicVectorBundle_levi` (compatibility): For ρ:M→GL(V), V(Jρ)≃P_dR×^{P_H}V after inflation.
- `AutomorphicBundles.automorphicVectorBundle_tensor` (functoriality): V preserves tensor products, duals and the unit through canonical descent isomorphisms.
- `AutomorphicBundles.automorphicVectorBundle_scalar_extension` (compatibility): V(J)⊗_L L′≃V(J⊗_L L′) for every field extension L′/L.
- `AutomorphicBundles.automorphicVectorBundle_map` (functoriality): A Pᶜ-equivariant linear map u:V→W induces the associated coefficient map V(u) on the fixed canonical model; after pulling back to the principal torsor it is the constant map u.
- `AutomorphicBundles.automorphicVectorBundle_map_id` (simp): For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `AutomorphicBundles.automorphicVectorBundle_map_comp` (functoriality): For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Unit tests.**

- `AutomorphicBundles.automorphicVectorBundle_test_unit` (degenerate): For J=O_X̌ with trivial fibre action, V(J)=O_S.
- `AutomorphicBundles.automorphicVectorBundle_test_hodge` (compatibility): In the Siegel cohomology convention, the Hodge-line/standard Levi coefficient gives e*Ω¹_A/S, not its inverse.
- `AutomorphicBundles.automorphicVectorBundle_test_nonflat` (non-example): For the upper-triangular P in GL2, χ(diag(a,d))=a defines a rank-one associated automorphic coefficient. It is not the restriction of a one-dimensional GL2 representation: det^n restricts to a^n d^n and cannot equal a for any n. The full-group flat-connection functor therefore cannot be applied to this coefficient by declaring χ to extend.

**Acceptance.**

- The rank is dim ρ. The trivial coefficient is O_S; Levi and full-group coefficients remain distinct.

**Used by.**

- Milne III §7: Defines rational holomorphic forms as sections.
- BCGP §4.5: Supplies the finite-dimensional algebraic coefficient underlying the classical comparison.
- AutomorphicBundles B5: Supplies coherent coefficients; trace/cohomology are separate.

**Depends on.** this roadmap: `B1/abelian-canonical-principal-bundle`, `B1/filtration-reduction`, `B0/compact-dual-coefficient`, `B0/coefficient-galois-descent`; other roadmaps: `AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B2`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III §5, Theorem 5.1, p.61: “automorphic vector bundle” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.
- [CS17], Lemma 2.3.5, pp.670–671: “inflation map” — The tensor-frame/filtration construction in the version of record.

### The algebraic automorphic bundle comparison

`AutomorphicBundles:B2/automorphic-analytic-comparison` · comparison · proposed declaration `AutomorphicBundles.automorphicAnalyticComparison` · packet B0

Over an embedding L↪C, the analytification of V(J) is canonically the arithmetic quotient of the Borel pullback of J. Its sections in a homogeneous frame obey the same transformation law. The comparison preserves the filtered P coefficient and the M graded coefficient separately.

**Proof.**

1. Apply geometricAnalyticCoefficients to the actual canonical principal model.
2. Use the uniformization comparison for γ and the filtered frame torsor.
3. Identify the associated analytic quotient by sectionsEquivariant.

**Acceptance.**

- For GL2 the chosen Hodge line is the holomorphic invariant-differential coefficient.

**Depends on.** this roadmap: `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B0/geometric-analytic-coefficients`, `B0/sections-equivariant`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B2`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III §3, Proposition 3.5, pp.58–59; III §5, Theorem 5.1, p.61: “follows directly from (3.3)” — Proposition 3.5 obtains the geometric/analytic equivalence from the descent construction (3.3); Theorem 5.1 supplies its canonical number-field model. Neither asserts ordinary proper GAGA for the open variety.

### Highest weights and coefficient conventions

`AutomorphicBundles:B2/levi-highest-weight-convention` · comparison · proposed declaration `AutomorphicBundles.leviHighestWeightConvention` · packet B0

Over a characteristic-zero splitting field of M with a chosen Borel and torus, an M-dominant integral highest weight λ determines the irreducible algebraic representation V_λ. In BCGP Example 3.2.18 the associated sheaf L_λ has fibre V_λ, of highest weight λ. Its left-coset/right-translation realization is (π_*O_(U_P\G))[B_M=−w₀^Mλ]; this function-equivariance character does not relabel the fibre as V_(−w₀^Mλ). The dual representation separately has highest weight −w₀^Mλ. Retain the central/similitude character and the Hodge/opposite-Hodge–Tate switch. Over a nonsplit field use the actual Galois descent datum; a label alone does not define a rational coefficient.

**Proof.**

1. Import highest-weight representations and duality from the reductive representation owner through the recorded supplier gap, rather than constructing them here.
2. Apply hodgeParabolicConvention and compactDualCoefficient to compute the fibre action at a reference flag.
3. Compute the B_M character of the equivariant-function realization using BCGP Example 3.2.18 while retaining fibre highest weight λ; compute the dual label separately.
4. Use coefficientGaloisDescent to distinguish a rational coefficient from a split highest-weight label.

**Acceptance.**

- BCGP’s tautological Siegel exact sequence is compared with the full standard P representation; it is not split into a flat sum by naming the two Levi weights.

**Depends on.** this roadmap: `B0/hodge-parabolic-convention`, `B0/compact-dual-coefficient`, `B0/coefficient-galois-descent`; libraries: `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-3-maximal-torus-weights-and-the-highest-weight-classification`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B2`, namespace `AutomorphicBundles`.

**Sources.**

- [BCGP], §3.2.13–3.2.16, p.44; Example 3.2.18, p.45: “highest weight” — Example 3.2.18 labels L_λ by the associated highest-weight-λ representation, then uses character −w₀,Mλ to realize its sections. The dual-weight formula is a separate representation-theoretic comparison.

### Betti coefficients of a full-group representation

`AutomorphicBundles:B2/betti-coefficient-local-system` · construction · proposed declaration `AutomorphicBundles.bettiCoefficientLocalSystem` · planet “Betti automorphic local system” · packet B0

For a finite-dimensional rational representation W of Gᶜ and a neat effective arithmetic component Γ\X, form the Betti local system Γ\(X×W) with its arithmetic monodromy. Its associated holomorphic flat bundle is the full-group automorphic bundle. If the projected weight is Q-defined and W is pure of one weight, it has the rational variation of Hodge structure from D3; mixed-weight representations are treated weightwise.

**Construction.**

1. Use the effective-centre criterion and the arithmetic action on W.
2. Apply the local-system construction at the generic topological owner, recorded as an interface gap at this pin.
3. Compare the complex flat bundle through homogeneous-variation and automorphicAnalyticComparison.

**API.**

- `AutomorphicBundles.bettiCoefficientLocalSystem_monodromy` (characterisation): On Γ\X the local monodromy is the representation of Γ on W.
- `AutomorphicBundles.bettiCoefficientLocalSystem_tensor` (functoriality): Betti coefficients preserve tensor products and duals.
- `AutomorphicBundles.bettiCoefficientLocalSystem_complex_flat` (compatibility): W_B⊗_Q O_an is the full-group coefficient with its flat connection.
- `AutomorphicBundles.bettiCoefficientLocalSystem_map` (functoriality): A full-Gᶜ representation intertwiner u:V→W induces a map of the descended Betti local systems with fibre u and preserves monodromy.
- `AutomorphicBundles.bettiCoefficientLocalSystem_map_id` (simp): For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `AutomorphicBundles.bettiCoefficientLocalSystem_map_comp` (functoriality): For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Unit tests.**

- `AutomorphicBundles.bettiCoefficientLocalSystem_test_unit` (degenerate): For W=Q with trivial action, W_B is the constant rational local system.
- `AutomorphicBundles.bettiCoefficientLocalSystem_test_standard` (compatibility): For the Siegel homology representation, W_B=H₁ of the actual universal abelian family, not R¹π_*Q without a dual.
- `AutomorphicBundles.bettiCoefficientLocalSystem_test_levi` (non-example): The GL2 upper-triangular Levi character (a,d)↦a is not the restriction of any one-dimensional GL2 representation (whose character is det^n). It cannot be supplied as a full-group rank-one Betti input without an extension.

**Acceptance.**

- The tensor unit is the constant Q local system; no Betti local system is assigned to a general Levi coefficient.

**Used by.**

- AG §3.3: Realizes representation-valued Betti coefficients.
- BCGP §4.8.2: Input to classical local-system cohomology, whose higher comparison is outside B0.

**Depends on.** this roadmap: `B0/central-split-quotient`, `B0/ineffective-fibre-descent`, `B2/automorphic-analytic-comparison`; other roadmaps: `ShimuraData:D3/homogeneous-variation`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B2`, namespace `AutomorphicBundles`.

**Sources.**

- [AGHMP], §3.3, p.418: “local system” — Representation-valued realization and absolute-Hodge descent in the version of record.
- [Milne90], III §6, pp.61–62, including Remark 6.1 and Theorem 6.2: “rational” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

### Étale coefficients from the canonical tower

`AutomorphicBundles:B2/etale-coefficient-local-system` · construction · proposed declaration `AutomorphicBundles.etaleCoefficientLocalSystem` · planet “Étale automorphic local system” · packet B0

For a rational Gᶜ representation W, a prime ℓ and a level with compact ℓ-component preserving a Z_ℓ lattice in W⊗Q_ℓ, descend that lattice along the actual canonical ℓ-level étale tower to a lisse Z_ℓ sheaf, and invert ℓ to obtain W_ℓ on S_E. Changing stable lattices gives canonically the same Q_ℓ sheaf. This is a construction over E with Galois action, not just a local system on S(C).

**Construction.**

1. Use V3/V8 for the finite étale level tower and its canonical E-structure.
2. Apply the representation to the coefficient-group tower, checking the ineffective central quotient.
3. Descend the finite lattice sheaves and pass to the ℓ-adic limit; generic lisse-sheaf/tower descent is a recorded missing interface.

**API.**

- `AutomorphicBundles.etaleCoefficientLocalSystem_finite_level` (projection): The lattice modulo ℓⁿ is the finite étale sheaf associated to the chosen level quotient action.
- `AutomorphicBundles.etaleCoefficientLocalSystem_lattice_independence` (equivalence): After tensoring with Q_ℓ the result is independent of a stable lattice through the common rational representation.
- `AutomorphicBundles.etaleCoefficientLocalSystem_hecke` (functoriality): Level and Hecke pullbacks preserve the descended sheaf and its canonical arithmetic Galois structure.
- `AutomorphicBundles.etaleCoefficientLocalSystem_map` (functoriality): A continuous full-Gᶜ Q_ℓ-representation intertwiner u:V→W induces the map of the descended arithmetic ℓ-adic local systems; it respects the actual finite-level tower and arithmetic Galois action.
- `AutomorphicBundles.etaleCoefficientLocalSystem_map_id` (simp): For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `AutomorphicBundles.etaleCoefficientLocalSystem_map_comp` (functoriality): For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Unit tests.**

- `AutomorphicBundles.etaleCoefficientLocalSystem_test_unit` (degenerate): The trivial representation gives the constant Q_ℓ sheaf over E.
- `AutomorphicBundles.etaleCoefficientLocalSystem_test_abelian` (compatibility): The symplectic homology coefficient gives (R¹π_*Q_ℓ)∨ with its arithmetic action.
- `AutomorphicBundles.etaleCoefficientLocalSystem_test_arithmetic` (non-example): Over Spec Q the étale coefficients Q_ℓ and Q_ℓ(1) have the same one-dimensional geometric/complex realization but different arithmetic Galois actions (trivial versus cyclotomic). Forgetting the arithmetic tower/action cannot characterize the descended coefficient.

**Acceptance.**

- The sheaf at a closed number-field point carries its actual arithmetic Galois representation; no de Rham-at-p theorem is inferred here.

**Used by.**

- AG §3.3 Proposition 3.3.1: Provides the Betti–étale comparison.
- Lan §5.3.1: Supplies the input local system; the p-adic geometricity theorem remains with the comparison owner.

**Depends on.** this roadmap: `B0/central-split-quotient`, `B1/principal-hecke-pullback`; stages of other roadmaps: `ShimuraVarieties:V8`, `ShimuraVarieties:V1`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B2`, namespace `AutomorphicBundles`.

**Sources.**

- [AGHMP], §3.3 Proposition 3.3.1, pp.418–419: “canonical isomorphism” — Representation-valued realization and absolute-Hodge descent in the version of record.
- [Milne90], III §6, Remark 6.1, p.62: “local system” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

### Filtered de Rham full-group coefficients

`AutomorphicBundles:B2/filtered-de-rham-coefficient` · construction · proposed declaration `AutomorphicBundles.filteredDeRhamCoefficient` · planet “Filtered de Rham automorphic coefficient” · packet B0

For an algebraic full Gᶜ representation W over a number field L containing E, the canonical principal bundle gives a locally free filtered coefficient W_dR with integrable connection ∇ and Griffiths transversality. Its filtration is induced by γ. In Hodge type it agrees with the matching tensor construction in the universal family’s relative H₁,dR; regular-singular boundary extension is a separate B3 theorem.

**Construction.**

1. Associate W to the canonical full-group torsor; descend the flat connection by its equivariance.
2. Pull the filtration from the compact-dual type through γ.
3. Use D3 homogeneous-variation and relative A4 comparisons for transversality and the abelian realization; generic filtered-connection descent remains an interface gap.

**API.**

- `AutomorphicBundles.filteredDeRhamCoefficient_connection` (structure): ∇²=0 and the connection descends from Π.
- `AutomorphicBundles.filteredDeRhamCoefficient_filtration` (projection): F^aW_dR is the locally direct-summand filtration encoded by γ.
- `AutomorphicBundles.filteredDeRhamCoefficient_transversality` (compatibility): ∇F^a⊂F^{a−1}⊗Ω¹_S; tensors and duals carry the induced filtered connections.
- `AutomorphicBundles.filteredDeRhamCoefficient_map` (functoriality): A full-Gᶜ representation intertwiner induces a horizontal filtration-preserving map between the associated de Rham coefficients; its principal-frame map is u.
- `AutomorphicBundles.filteredDeRhamCoefficient_map_id` (simp): For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `AutomorphicBundles.filteredDeRhamCoefficient_map_comp` (functoriality): For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Unit tests.**

- `AutomorphicBundles.filteredDeRhamCoefficient_test_unit` (degenerate): The tensor unit is (O_S,d) with its weight-zero filtration.
- `AutomorphicBundles.filteredDeRhamCoefficient_test_hodge` (compatibility): For H¹dR of an abelian family F¹=e*Ω¹_A/S and the connection is Gauss–Manin.
- `AutomorphicBundles.filteredDeRhamCoefficient_test_levi` (non-example): For the GL2 upper-triangular Levi, (a,d)↦a does not extend to a one-dimensional GL2 representation, since no a^n d^n equals a. Its associated line cannot be treated as a rank-one input to the full-group filtered connection functor.

**Acceptance.**

- The standard cohomology coefficient is H¹dR and the homology coefficient is its dual; Tate normalization is never dropped.

**Used by.**

- Milne III §6: The rational dR realization in the coefficient comparison.
- B3 logarithmic extension: Only these coefficients carry the canonical extended flat connection.

**Depends on.** this roadmap: `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B1/hodge-canonical-principal-bundle`; other roadmaps: `ShimuraData:D3/homogeneous-variation`; stages of other roadmaps: `AbelianSchemesAndArithmeticModuli:A4`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B2`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III §5, Theorem 5.1, p.61; III §6, pp.61–62: “connection” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.
- [AGHMP], §3.5, Proposition 3.5.1, p.421: “filtered vector bundle” — AG distinguishes arbitrary E-linear coefficient descent from the filtered functor on Q-linear torus representations; general flat/filtered descent is the separate recorded interface.

### Betti, étale and de Rham comparison

`AutomorphicBundles:B2/realization-comparison` · comparison · proposed declaration `AutomorphicBundles.realizationComparison` · packet B0

After an embedding L↪C, for a rational Gᶜ representation W, W_B⊗Q_ℓ≃W_ℓ|S_C under the algebraic/analytic étale comparison, and W_B⊗O_an≃W_dR^an as flat holomorphic bundles. Under the Q-defined pure weight condition these respect Hodge filtrations and the rational variation. They preserve defining tensors, Tate twists, Hecke pullback and duals. No B_dR, crystalline or p-adic Hodge theorem is included.

**Proof.**

1. Identify all three realizations on the uniformizing component or on the Hodge-type family using A4.
2. Use the canonical torsor and lattice tower definitions to glue the Betti–étale isomorphism of AG Proposition 3.3.1.
3. For the dR comparison use the same tensor frames and horizontal sections; avoid invoking proper relative GAGA on the nonproper base.

**Acceptance.**

- The standard representation comparison is the actual degree-one family comparison, and tensor projectors agree on both sides.

**Depends on.** this roadmap: `B2/betti-coefficient-local-system`, `B2/etale-coefficient-local-system`, `B2/filtered-de-rham-coefficient`; stages of other roadmaps: `AbelianSchemesAndArithmeticModuli:A4`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B2`, namespace `AutomorphicBundles`.

**Sources.**

- [AGHMP], Proposition 3.3.1; Proposition 3.5.1, pp.418–422: “canonical” — Representation-valued realization and absolute-Hodge descent in the version of record.
- [Milne90], III §6, pp.61–62: “comparison” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

### Tensor and Hecke coherence of coefficients

`AutomorphicBundles:B2/coefficient-tensor-hecke` · theorem · proposed declaration `AutomorphicBundles.coefficientTensorHecke` · packet B0

The automorphic coefficient functor and the full-group realization functors preserve tensor unit, tensor products, duals and morphisms, with coherent associativity/symmetry isomorphisms; realization comparisons commute with them. Their level and Hecke pullback identifications preserve this structure. Exactness is asserted in characteristic zero for the finite-dimensional algebraic representation categories; no all-prime semisimplicity is used.

**Proof.**

1. Use the generic associated functor’s monoidal/local trivialization interface.
2. Check duals, tensors and maps in a canonical torsor frame, then descend.
3. Apply principalHeckePullback and realizationComparison to verify every comparison square in the same frame.

**Acceptance.**

- The dual of a Hodge-line coefficient is the inverse line; retaining it as the same line would fail this theorem.

**Depends on.** this roadmap: `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B1/principal-hecke-pullback`, `B2/realization-comparison`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B2`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III §3, Lemma 3.1, p.58; III §5, p.61; III §6, p.62: “All these objects” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

### The Siegel tautological coefficient sequence

`AutomorphicBundles:B2/siegel-tautological-sequence` · theorem · proposed declaration `AutomorphicBundles.siegelTautologicalSequence` · packet B0

On the split Siegel flag variety FL=P_HT\G over a characteristic-zero coefficient field E, with G=GSp_(2g) and St its standard representation, BCGP’s conventions give the G-equivariant exact sequence 0→L_(0,…,0,−1;1)→O_FL⊗St→L_(1,0,…,0;1)→0. Both end coefficients have rank g. Its algebraic analytification agrees with the same finite locally free sequence in the analytic/solid category once that comparison functor is supplied; no infinite-dimensional equivariant category is constructed here.

**Proof.**

1. Use the universal Lagrangian subspace/quotient on the Siegel compact dual and its standard symplectic representation from the PEL/flag suppliers.
2. Compute the two Levi fibre actions in BCGP’s left-coset/opposite convention using hodgeParabolicConvention and leviHighestWeightConvention.
3. Apply exact associated descent. The extension need not split P-equivariantly; analytic/solid compatibility is a recorded external interface gap.

**Acceptance.**

- For g=2 this is precisely L_(0,−1;1)→St→L_(1,0;1); pulling it to the Hodge–Tate tower requires its separately constructed torsor.

**Depends on.** this roadmap: `B0/compact-dual-coefficient`, `B0/hodge-parabolic-convention`, `B2/levi-highest-weight-convention`; stages of other roadmaps: `PELModuli:M0`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B2`, namespace `AutomorphicBundles`.

**Sources.**

- [BCGP], Remark 3.2.19, p.45; Remark 4.8.1, p.101: “tautological exact sequence” — Fixes coefficient/dual/twist conventions for the added source; higher cohomology is outside this part.

## B2.general — General-data coefficients and realizations

B2.general repeats B2 on the general canonical principal model of B1.general: the general automorphic coefficient V(J) with the same analytic quotient, tensor and Hecke functoriality and field base change (`B2.general/general-associated-model`); the Betti, ℓ-adic and filtered de Rham realizations of a full-group representation, whose existence is distinct from the unproved existence of a parameterized family of motives (`B2.general/general-flat-realizations`); and their conjugation, which preserves the rational Betti structure only under Milne’s condition that the weight projected to Gᶜ is defined over ℚ (`B2.general/general-realization-conjugation`).

**Coverage: planned.** What remains in this layer:

- Generic algebraic associated-bundle interface has no nominated stage: The campaign nominates ReductiveGroupsPartII for principal algebraic G torsors, contracted products, G-equivariant bundle descent, pullback and exact tensor/dual functoriality. Its current RG2.0–RG2.5 stages cover different targets and contain no such stage. Add an explicitly assigned extension stage rather than duplicating that construction here. QCoh fpqc descent alone does not construct representable principal/associated bundles. Analytic torsor pullback and analytification compatibility must be matched to this interface.
- Period torsor and continuous principal-bundle descent: V4/V7 provide CM reciprocity and canonical variety descent, not a complete typed Taniyama/period torsor or effective descent of a principal scheme with connection. Specify the period torsor and normalized CM restriction, full-tower induction, continuity and effectivity of the bundle descent datum. Harris’s annotated errata acknowledges continuity in the historical Aut(C) argument; a cocycle alone is insufficient.
- Full-group local-system and filtered-connection descent interfaces: Construct or import the actual arithmetic quotient local system, continuous ℓ-adic lattice descent on the canonical coefficient tower, filtered algebraic connection descent and the tensor-compatible analytic horizontal-section comparison. Degree-one abelian A4 comparisons handle the family case but do not by themselves state these general associated-representation interfaces. Keep rational Betti weight and coefficient-group hypotheses explicit.
- Resolve this stage’s listed supplier requests and replace prose-only geometric contracts by typed signatures on the actual supplied carriers; then independently verify proof refinements. All implementation status remains unchecked.
- Typed geometric signature gap: see the exact named contract inventory in the suggested file and the packet gap. Its comments are not elaborated declarations.

### General automorphic coefficient models

`AutomorphicBundles:B2.general/general-associated-model` · theorem · proposed declaration `AutomorphicBundles.generalAssociatedModel` · planet “General automorphic coefficient model” · packet B0

For a general Shimura datum and a Gᶜ-equivariant compact-dual coefficient J defined over L/E, descent along the general canonical principal model constructs V(J) over L. It has the same analytic quotient, tensor/dual functoriality, Hecke pullback and coefficient-field base change as the abelian-type construction; σ-conjugation transports both the datum and J.

**Proof.**

1. Replace the abelian-type Π and γ in automorphicVectorBundle by generalPrincipalModel and generalCompactDualMap.
2. Apply precisely the same generic associated/descent interface; it is not replanned for general data.
3. Use generalConjugationCocycle and coefficientGaloisDescent to obtain the conjugate coefficient model.

**Acceptance.**

- This is valid for non-abelian-type data without assigning an abelian motive to J.

**Depends on.** this roadmap: `B1.general/general-principal-model`, `B1.general/general-compact-dual-map`, `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B0/coefficient-galois-descent`, `B1.general/general-conjugation-cocycle`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B2/general`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III Theorem 5.1, p.61: “canonical model” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

### General full-group realizations

`AutomorphicBundles:B2.general/general-flat-realizations` · theorem · proposed declaration `AutomorphicBundles.generalFlatRealizations` · planet “General full-group realizations” · packet B0

For a rational representation W of the general coefficient group Gᶜ, the canonical principal model supplies W_dR with its integrable connection and flag filtration, and the canonical coefficient tower supplies W_ℓ. The analytic full-group coefficient supplies W_B and its comparison to both. Existence of these realizations is distinct from the unproved existence of a parameterized family of motives.

**Proof.**

1. Use generalPrincipalModel for the filtered connection and generalAssociatedModel for its underlying coefficient.
2. Use the full canonical level tower from V8.general and the étale lattice construction.
3. Repeat realizationComparison on analytic components; its generic lisse/connection comparison interfaces remain the same recorded gaps.

**Acceptance.**

- The tensor unit remains constant; a Levi coefficient is not automatically a full-group local system.

**Depends on.** this roadmap: `B2.general/general-associated-model`, `B1.general/general-principal-model`, `B2/etale-coefficient-local-system`, `B2/realization-comparison`; stages of other roadmaps: `ShimuraVarieties:V8.general`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B2/general`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III §6, pp.61–62: “local systems” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.
- [LanIntro], §5.3, pp.63–64: “we do not know any families of motives” — Warns explicitly that general-data étale coefficients do not supply a family of motives.

### Conjugation of rational realizations

`AutomorphicBundles:B2.general/general-realization-conjugation` · comparison · proposed declaration `AutomorphicBundles.generalRealizationConjugation` · packet B0

Under Milne’s additional condition that the weight homomorphism projected to Gᶜ is Q-defined, general canonical conjugation preserves the rational Betti structure and its ℓ-adic comparison as well as the algebraic filtered dR coefficient. State the transported datum/representation and coefficient field on both sides. Without this weight condition retain the algebraic coefficient conjugation, but do not assert Theorem 6.2’s rational Betti conclusion.

**Proof.**

1. Use generalConjugationCocycle for Π and γ.
2. Use the CM/period normalization and the Q-defined weight to identify the rational Betti fibres as in Milne III Theorem 6.2.
3. Transport tensor and lattice comparisons via generalFlatRealizations.

**Acceptance.**

- The dR conjugation does not alone determine a rational Betti lattice; the extra hypothesis is retained.

**Depends on.** this roadmap: `B2.general/general-flat-realizations`, `B1.general/general-conjugation-cocycle`, `B1/cm-principal-normalization`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B2/general`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III Theorem 6.2, p.62: “defined over Q” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

## B3 — Canonical and subcanonical extensions

B3 extends the bundles across the boundary of a smooth toroidal compactification S_Σ. On each degeneration chart the filtered and graded coefficient frames extend through the semi-abelian family of ShimuraCompactifications C4, and the Hodge coefficient is the invariant-differential module of that family, du/u and not dq/q at a Tate cusp (`B3/boundary-coefficient-chart`). The chart extensions glue (`B3/canonical-extension-gluing`) to the canonical extension V(J)^can_Σ, characterized by its boundary frames rather than by its restriction to the open variety (`B3/canonical-and-subcanonical-extensions`); twisting by the ideal of the reduced boundary gives the subcanonical extension V(J)^can_Σ(−D_Σ), whose sections are those vanishing on every boundary component (`B3/subcanonical-extension`). Under refinement the canonical extension pulls back to the canonical extension, while the subcanonical one does not in general (`B3/refinement-canonical-extension`); the toric ideal-pushforward condition gives fan independence of both section spaces (`B3/fan-independent-sections`). A full-group coefficient has a Deligne logarithmic extension of its connection whose underlying bundle is the canonical extension (`B3/logarithmic-connection-extension`). Pushing forward to the minimal compactification gives a coherent sheaf, not a vector bundle (`B3/minimal-coherent-pushforward`); a sufficiently divisible power of the scalar Hodge line descends to an ample line under the compactification owner’s positivity hypotheses (`B3/minimal-hodge-line-comparison`). Everything is defined over the coefficient field of J (`B3/canonical-rational-descent`).

The nodes are stated over characteristic-zero fields; for the good-prime integral PEL models three of them carry a clause that uses ShimuraCompactifications C5’s integral degenerations. The coefficient-sensitive integral statements that B5 needs (refinement and boundary transport with an arbitrary coefficient module) are recorded in the gap *Integral coefficient interfaces that B5 needs from B2–B4*.

**Coverage: planned.** What remains in this layer:

- Canonical extension proof and logarithmic boundary dictionary: Milne V §6 states the exact canonical extension functor and rationality; HLTT B.8 gives the semi-abelian frame model. The complete Deligne–Harris local analytic construction, chart transition/gluing, general-data extension without abelian degenerations, regular singularity/unipotence and zero-exponent logarithmic comparison still need declaration-sized refinements. No current generic regular-singular connection supplier stage was found. Integral PEL extensions remain conditional on C5’s specific good-base coefficients.
- Coherent geometric section foundations and local analytic growth: The pin contains Scheme.Modules and its presheaf/pushforward/global-section operations, freshly read, but the exact proper coherent finiteness/base-change, locally free tensor/ideal dictionary and holomorphic logarithmic-growth removable-singularity/coordinatewise vanishing interfaces need suppliers/refinement. A section comparison does not follow from ordinary GAGA on the open Shimura variety. The course-note full Dolbeault resolutions were not used to close this chain.
- Resolve this stage’s listed supplier requests and replace prose-only geometric contracts by typed signatures on the actual supplied carriers; then independently verify proof refinements. All implementation status remains unchecked.
- Typed geometric signature gap: see the exact named contract inventory in the suggested file and the packet gap. Its comments are not elaborated declarations.

### Coefficients on degeneration charts

`AutomorphicBundles:B3/boundary-coefficient-chart` · construction · proposed declaration `AutomorphicBundles.boundaryCoefficientChart` · packet B0

For a neat characteristic-zero Hodge/PEL model with a smooth admissible fan, extend the filtered and graded coefficient frames across each toroidal cusp chart using the actual semi-abelian/1-motive degeneration supplied by C4. For an integral PEL specialization retain C5’s good-base hypotheses and finite locally free representations. Identify the extended Hodge coefficient with invariant differentials of the semi-abelian family, not with logarithmic differentials on the base.

**Construction.**

1. Import the degeneration chart, semi-abelian extension and endomorphism structures from C4/C5.
2. Extend the relevant Lie/graded modules and their tensor-compatible frames; local freeness and chart transition compatibility are requested at the geometric interface.
3. Apply the associated coefficient functor locally and compare its restriction with automorphicVectorBundle.

**API.**

- `AutomorphicBundles.boundaryCoefficientChart_restrict` (compatibility): Restriction to the open family is the given filtered/graded automorphic coefficient.
- `AutomorphicBundles.boundaryCoefficientChart_hodge` (characterisation): The Hodge coefficient is e*Ω¹_G/SΣ of the supplied semi-abelian extension.
- `AutomorphicBundles.boundaryCoefficientChart_transition` (functoriality): Degeneration-chart transition maps induce tensor-compatible frame/coefficient isomorphisms.
- `AutomorphicBundles.boundaryCoefficientChart_map` (functoriality): A morphism of the prescribed boundary representations induces a chart-coefficient morphism compatible with the canonical frame and with every chart transition.
- `AutomorphicBundles.boundaryCoefficientChart_map_id` (simp): For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `AutomorphicBundles.boundaryCoefficientChart_map_comp` (functoriality): For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Unit tests.**

- `AutomorphicBundles.boundaryCoefficientChart_test_tate` (compatibility): The dimension-one Hodge frame at a multiplicative fibre is generated by du/u.
- `AutomorphicBundles.boundaryCoefficientChart_test_unit` (degenerate): The trivial coefficient extends to O of each cusp chart.
- `AutomorphicBundles.boundaryCoefficientChart_test_base` (non-example): The base logarithmic differential dq/q is not identified with the relative invariant differential du/u.

**Acceptance.**

- At a Tate elliptic cusp the Hodge differential is du/u on the multiplicative fibre, not dq/q on the base.

**Used by.**

- HLTT Appendix B.8: Defines canonical coefficients using semi-abelian Lie frames.
- Canonical extension below: Supplies local frames and their transition maps.

**Depends on.** this roadmap: `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`; stages of other roadmaps: `ShimuraCompactifications:C4`, `ShimuraCompactifications:C5`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B3`, namespace `AutomorphicBundles`.

**Sources.**

- [HLTT], Appendix B.8, pp.270–271: “semi-abelian” — The finite locally free coefficient and its semi-abelian boundary model.
- [LanIntro], §4.2.7, pp.49–50: “canonical extensions” — Separates toroidal vector coefficients from scalar minimal-compactification forms.

### The canonical automorphic extension

`AutomorphicBundles:B3/canonical-and-subcanonical-extensions` · construction · proposed declaration `AutomorphicBundles.canonicalExtension` · planet “Canonical automorphic extension” · packet B0

For a neat effective characteristic-zero Shimura model S of Hodge/abelian type, a smooth projective admissible toroidal compactification j:S↪SΣ and an automorphic P/Levi coefficient V(J), construct the specified canonical locally free extension V(J)^can_Σ. It is the tensor-compatible cusp-chart extension characterized by its canonical boundary frames/growth model. Merely requiring j*V^can≃V does not characterize it: twists by boundary divisors share that open restriction. For good-base PEL integral coefficients use the separate C5 degeneration input.

**Construction.**

1. Use boundaryCoefficientChart for Hodge/PEL chart coefficients; the abelian-type descent and general analytic extension argument are the recorded Harris-extension proof interface.
2. Identify overlap maps from the canonical degeneration frames, using the actual toroidal gluing supplied by C2.
3. Descend locally free chart coefficients, with the specified canonical normalization; canonicalExtensionGluing isolates the nonroutine gluing theorem.

**API.**

- `AutomorphicBundles.canonicalExtension_restrict` (compatibility): j*V(J)^can_Σ≃V(J) with the given canonical open comparison.
- `AutomorphicBundles.canonicalExtension_boundary_frame` (characterisation): On a canonical cusp chart V(J)^can is the locally free coefficient of the specified extended frame torsor.
- `AutomorphicBundles.canonicalExtension_tensor` (functoriality): The canonical extension functor preserves tensor products, duals and the unit.
- `AutomorphicBundles.canonicalExtension_unique` (extensionality): A chart-normalized extension with these transition maps has a unique isomorphism preserving its normalization.
- `AutomorphicBundles.canonicalExtension_map` (functoriality): For a coefficient map induced by an algebraic Pᶜ-representation intertwiner, the prescribed canonical chart maps glue to its canonical extension; it restricts to the original coefficient map and respects canonical chart normalization. An arbitrary morphism on the open without this chart condition is not an admitted input.
- `AutomorphicBundles.canonicalExtension_map_id` (simp): For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `AutomorphicBundles.canonicalExtension_map_comp` (functoriality): For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Unit tests.**

- `AutomorphicBundles.canonicalExtension_test_unit` (degenerate): The canonical extension of the unit coefficient is O_SΣ.
- `AutomorphicBundles.canonicalExtension_test_hodge` (compatibility): For an elliptic/PEL Hodge coefficient it is the semi-abelian invariant-differential bundle.
- `AutomorphicBundles.canonicalExtension_test_twist` (non-example): For nonempty boundary D, V^can(D) has the same open restriction but fails the specified canonical boundary-frame normalization.

**Acceptance.**

- The unit extends as O_SΣ, not O_SΣ(D); the family of extension functors preserves duals/tensors.

**Used by.**

- Lan §4.2.7: Defines algebraic vector-valued forms on toroidal compactifications.
- Milne V §6: Supplies the exact tensor extension functor and rational descent.
- BCGP §4.5: Provides finite-dimensional canonical coefficient in the classical comparison.

**Depends on.** this roadmap: `B3/boundary-coefficient-chart`, `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B3/canonical-extension-gluing`; stages of other roadmaps: `ShimuraCompactifications:C2`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B3`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], V §6, pp.90–91: “exact faithful functor” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.
- [HLTT], Appendix B.8, p.271: “canonical extension” — The explicit PEL M₀-torsor and finite locally free representation construct the canonical extension. This specializes Milne’s general characteristic-zero functor; it is not a general-data universal semi-abelian scheme.

### Gluing the canonical extension

`AutomorphicBundles:B3/canonical-extension-gluing` · theorem · proposed declaration `AutomorphicBundles.canonicalExtensionGluing` · packet B0

The canonical boundary-chart coefficient identifications agree on toroidal overlaps, satisfy their cocycle law, and glue to a locally free extension functor whose restriction and chart normalization agree with the construction above. The resulting functor is independent of auxiliary frames, while its base space still depends on the fan.

**Proof.**

1. Use C2’s actual overlap and arithmetic quotient maps, and C4’s compatible degeneration maps.
2. Check extended tensor frames and coefficient descent commute with those maps; this is the recorded canonical-extension interface, not normality alone.
3. Use effective finite locally free descent to glue, then compare any two chart-normalized choices locally.

**Acceptance.**

- A boundary twist cannot be glued in as an alternative normalization merely because it is trivial on the open part.

**Depends on.** this roadmap: `B3/boundary-coefficient-chart`; other roadmaps: `AlgebraicModuliForArithmeticGeometry:R09.3/fpqc-quasicoherent-descent`; stages of other roadmaps: `ShimuraCompactifications:C2`, `ShimuraCompactifications:C4`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B3`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], V §6 Theorem 6.1, p.90: “functor” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

### The subcanonical automorphic extension

`AutomorphicBundles:B3/subcanonical-extension` · construction · proposed declaration `AutomorphicBundles.subcanonicalExtension` · planet “Subcanonical automorphic extension” · packet B0

For the smooth toroidal model and reduced normal-crossings boundary divisor DΣ=SΣ\S, define V(J)^sub_Σ=V(J)^can_Σ⊗I_DΣ=V(J)^can_Σ(−DΣ). This is locally free because the reduced boundary is Cartier in this setting. The exact sequence 0→V^sub→V^can→i_*i*V^can→0 identifies subcanonical sections as sections vanishing on every reduced boundary component.

**Construction.**

1. Import the reduced Cartier normal-crossings boundary from C2 (or the stated C5 integral model).
2. Tensor its ideal exact sequence with the locally free canonical coefficient.
3. Use flatness of that coefficient for exactness; define cusp vanishing through this ideal, not a multiplicity-weighted full cusp fibre.

**API.**

- `AutomorphicBundles.subcanonicalExtension_ideal` (characterisation): V^sub≃V^can⊗I_D with D reduced.
- `AutomorphicBundles.subcanonicalExtension_inclusion` (projection): V^sub→V^can is the kernel of restriction to D.
- `AutomorphicBundles.subcanonicalExtension_restrict` (compatibility): j*V^sub≃V, while boundary restriction of its included sections is zero.
- `AutomorphicBundles.subcanonicalExtension_map` (functoriality): A coefficient morphism u^can induces u^sub=u^can⊗id_(I_D); the boundary inclusions commute with u^sub and u^can.
- `AutomorphicBundles.subcanonicalExtension_map_id` (simp): For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `AutomorphicBundles.subcanonicalExtension_map_comp` (functoriality): For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Unit tests.**

- `AutomorphicBundles.subcanonicalExtension_test_empty` (degenerate): For an empty boundary, V^sub=V^can.
- `AutomorphicBundles.subcanonicalExtension_test_crossing` (computation): On Spec k[q1,q2] with reduced D=V(q1q2), the unit subcanonical ideal is (q1q2), so sections vanish on both components.
- `AutomorphicBundles.subcanonicalExtension_test_multiplicity` (non-example): For a full divisor 2D, V^can(−2D) is not the reduced-boundary subcanonical extension.

**Acceptance.**

- The boundary ideal is reduced; multiplicities introduced by blowups are not built into its definition.

**Used by.**

- HLTT Appendix B.8: Supplies cuspidal coherent coefficients.
- BCGP §4.8.2 cusp: Uses the negative boundary twist of the usual coefficient.

**Depends on.** this roadmap: `B3/canonical-and-subcanonical-extensions`; stages of other roadmaps: `ShimuraCompactifications:C2`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B3`, namespace `AutomorphicBundles`.

**Sources.**

- [LanIntro], §4.2.7, p.50: “with its reduced structure” — Separates toroidal vector coefficients from scalar minimal-compactification forms.
- [HLTT], Appendix B.8, p.271: “subcanonical” — The finite locally free coefficient and its semi-abelian boundary model.

### Canonical coefficients under fan refinement

`AutomorphicBundles:B3/refinement-canonical-extension` · comparison · proposed declaration `AutomorphicBundles.refinementCanonicalExtension` · packet B0

For a refinement f:SΣ′→SΣ between smooth admissible toroidal models, f*V^can_Σ≃V^can_Σ′. There is a natural map f*V^sub_Σ→V^sub_Σ′ since f*DΣ≥DΣ′, but these subcanonical sheaves are not generally equal under pullback. Under the toric refinement ideal-pushforward condition f_*I_DΣ′=I_DΣ and f_*O=O, the projection formula gives f_*V^sub_Σ′≃V^sub_Σ and f_*V^can_Σ′≃V^can_Σ.

**Proof.**

1. Use C3’s refinement morphism, structure-sheaf pushforward and common refinements.
2. Pull the canonical normalized chart coefficient through the refinement; the equality is the canonical extension functor’s compatibility.
3. Request the reduced toric boundary ideal pushforward separately at C3; apply the projection formula. The subcanonical pullback equality is explicitly rejected.

**Acceptance.**

- Blowing up the crossing of two boundary components gives exceptional multiplicity two in f*D, but multiplicity one in the reduced new boundary.

**Depends on.** this roadmap: `B3/canonical-and-subcanonical-extensions`, `B3/subcanonical-extension`; stages of other roadmaps: `ShimuraCompactifications:C3`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B3`, namespace `AutomorphicBundles`.

**Sources.**

- [HarrisBB], §1.4, Theorem 1.4.2 and (1.4.3), p.10: “canonical isomorphism” — The text states canonical-extension and fan-independent cohomology. The sheaf pullback comparison and reduced-boundary ideal pushforward need the packet’s C3 toric interface; (1.4.3) alone does not prove those stronger inputs.

> **Assembly note: what B5 needs in addition.** `B5/fj-refinement` and `B5/hecke-section-operator` need this comparison with an arbitrary coefficient module M over Lan’s good-prime base, torsion included, and for finite projective summands through splittings of finite free modules (Stacks 00NX, source issue E6813). This node and `B3/fan-independent-sections` are coefficient-free statements over a field; the coefficient-sensitive version is residual R2 of the assembly gap.

### Fan independence of canonical and cusp sections

`AutomorphicBundles:B3/fan-independent-sections` · theorem · proposed declaration `AutomorphicBundles.fanIndependentSections` · planet “Fan-independent automorphic sections” · packet B0

For any two smooth projective admissible fans with a common refinement, pullback and the pushforward comparisons identify H⁰(SΣ,V^can_Σ) and H⁰(SΣ,V^sub_Σ) canonically across the fans. These identifications are transitive and compatible with morphisms defined on common compatible refinements. This is independence of section spaces, not equality of sheaves on different compactifications, and it does not assert all higher direct images vanish.

**Proof.**

1. Use refinementCanonicalExtension for the degree-zero pushforward statements.
2. Apply Γ(SΣ,f_*F)=Γ(SΣ′,F) to each coefficient.
3. Compare two fans through a common refinement supplied by C3; prove transitivity by composition.

**Acceptance.**

- The identity refinement yields identity on sections; no fixed fan is declared Hecke-stable.

**Depends on.** this roadmap: `B3/refinement-canonical-extension`; stages of other roadmaps: `ShimuraCompactifications:C3`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B3`, namespace `AutomorphicBundles`.

**Sources.**

- [LanIntro], §4.2.7, p.49: “whose sections are independent of Σ” — Separates toroidal vector coefficients from scalar minimal-compactification forms.
- [HarrisBB], §1.4, (1.4.3), pp.10–11: “cohomology” — The present node uses only degree zero; higher cohomology has its own coefficient hypotheses in B5.

### The logarithmic full-group extension

`AutomorphicBundles:B3/logarithmic-connection-extension` · construction · proposed declaration `AutomorphicBundles.logarithmicConnectionExtension` · planet “Logarithmic automorphic connection” · packet B0

For a full Gᶜ coefficient with its regular-singular flat connection, on a neat level with unipotent local monodromy around the smooth reduced boundary, extend to the Deligne logarithmic bundle with nilpotent residues (the zero-exponent normalization). Its underlying bundle agrees with the canonical automorphic extension. Retain the Hodge filtration extension with Griffiths transversality. For non-unipotent levels one must choose a residue interval and prove the corresponding comparison separately.

**Construction.**

1. Use filteredDeRhamCoefficient and degeneration charts to establish regular singularity and unipotent monodromy; this is an explicit missing Deligne/automorphic boundary interface.
2. Apply the generic logarithmic connection extension theorem, recorded as a new supplier-direction gap.
3. Compare the normalized local horizontal frame lattices with canonicalExtension and extend the filtration through those frames.

**API.**

- `AutomorphicBundles.logarithmicConnectionExtension_restrict` (compatibility): Restriction gives the original integrable flat connection.
- `AutomorphicBundles.logarithmicConnectionExtension_residue` (structure): Each boundary residue is nilpotent in the unipotent zero-exponent normalization.
- `AutomorphicBundles.logarithmicConnectionExtension_tensor` (functoriality): In that normalization the logarithmic extension preserves tensor products and duals, with induced residue actions.
- `AutomorphicBundles.logarithmicConnectionExtension_map` (functoriality): A horizontal map between the admitted regular-singular full-group coefficients extends to a horizontal map between their normalized logarithmic extensions and commutes with the residues.
- `AutomorphicBundles.logarithmicConnectionExtension_map_id` (simp): For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `AutomorphicBundles.logarithmicConnectionExtension_map_comp` (functoriality): For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Unit tests.**

- `AutomorphicBundles.logarithmicConnectionExtension_test_unit` (degenerate): The unit coefficient extends to (O_SΣ,d) with zero residues.
- `AutomorphicBundles.logarithmicConnectionExtension_test_tate` (computation): For a nodal elliptic degeneration the rank-two coefficient has nonzero nilpotent monodromy residue, while its determinant has zero residue.
- `AutomorphicBundles.logarithmicConnectionExtension_test_nonunipotent` (non-example): A rank-one local system with monodromy −1 cannot be put in a nilpotent-residue normalization without a cover or a different exponent choice.

**Acceptance.**

- Only full-group coefficients receive this connection functor; arbitrary Levi coefficients need not admit its prescribed flat structure.

**Used by.**

- Lan §4.2.7: Identifies canonical full-group extension with Deligne’s logarithmic extension.
- Downstream de Rham cohomology: Supplies the coefficient with logarithmic connection; de Rham cohomology is outside this node.

**Depends on.** this roadmap: `B2/filtered-de-rham-coefficient`, `B3/canonical-and-subcanonical-extensions`, `B3/boundary-coefficient-chart`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B3`, namespace `AutomorphicBundles`.

**Sources.**

- [LanIntro], §4.2.7, p.50: “log poles along the boundary” — Separates toroidal vector coefficients from scalar minimal-compactification forms.
- [Milne90], V §6, proof of Theorem 6.1, p.91: “Deligne’s existence theorem” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

> **Assembly note: answers an incoming request.** AlgebraicModularFormsAndSerreWeights requests from B3 the canonical logarithmic extension of the elliptic de Rham bundle and connection at modular cusps for its node `R15.1/logarithmic-kodaira-spencer`. The elliptic H¹_dR is the standard representation of GL₂, a full-group coefficient, so this node (with `B3/canonical-and-subcanonical-extensions`) supplies it in characteristic zero; see *Requests filed with this roadmap*.

### Coherent coefficients on the minimal model

`AutomorphicBundles:B3/minimal-coherent-pushforward` · construction · proposed declaration `AutomorphicBundles.minimalCoherentPushforward` · packet B0

For the proper toroidal-to-minimal map π:SΣ→Smin between noetherian characteristic-zero models, define the minimal coefficient π_*V^can. It is coherent, with the same global sections as V^can. No local freeness on the minimal boundary is claimed. Fan independence follows through the degree-zero refinement comparison.

**Construction.**

1. Import the complex Baily–Borel minimal compactification from V2, its canonical model over the indicated number field from V8, and the proper noetherian toroidal-to-minimal map from C2. The statement is conditional on these actual models; the general-data class uses V8.general when supplied.
2. Use proper coherent pushforward from the recorded coherent-sheaf interface.
3. Use refinementCanonicalExtension and functoriality of pushforward to compare fans and global sections.

**API.**

- `AutomorphicBundles.minimalCoherentPushforward_sections` (compatibility): H⁰(Smin,π_*V^can)=H⁰(SΣ,V^can).
- `AutomorphicBundles.minimalCoherentPushforward_coherent` (structure): Proper pushforward of the coherent canonical coefficient is coherent.
- `AutomorphicBundles.minimalCoherentPushforward_refinement` (functoriality): Compatible fan refinements induce a canonical isomorphism of these degree-zero pushforwards.
- `AutomorphicBundles.minimalCoherentPushforward_map` (functoriality): For a morphism u:F→G of the admitted canonical or subcanonical coefficients, π_*u is its coherent sheaf pushforward on the specified minimal model.
- `AutomorphicBundles.minimalCoherentPushforward_map_id` (simp): For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `AutomorphicBundles.minimalCoherentPushforward_map_comp` (functoriality): For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Unit tests.**

- `AutomorphicBundles.minimalCoherentPushforward_test_proper_open` (degenerate): When the Shimura variety is proper and π is identity, the minimal coefficient is V.
- `AutomorphicBundles.minimalCoherentPushforward_test_rank` (compatibility): On the open S the pushforward restricts to V.
- `AutomorphicBundles.minimalCoherentPushforward_test_singular` (non-example): On the noetherian nodal affine scheme Spec L[x,y]/(xy), the ideal (x,y) is coherent but is not locally free at the origin: its generic rank is one and its fibre modulo (x,y) has dimension two. This non-example tests the inference from coherent pushforward to local freeness; it does not identify that ideal with every automorphic coefficient.

**Acceptance.**

- The definition allows non-locally-free coherent sheaves at a singular minimal boundary.

**Used by.**

- Lan §4.2.7: Separates vector coefficients on toroidal from minimal line bundles.
- B4 classical forms: Provides a minimal coherent description of the same sections.

**Depends on.** this roadmap: `B3/canonical-and-subcanonical-extensions`, `B3/refinement-canonical-extension`; stages of other roadmaps: `ShimuraCompactifications:C2`, `ShimuraVarieties:V2`, `ShimuraVarieties:V8`; libraries: `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:AlgebraicGeometry.Scheme.Modules.presheaf`, `mathlib:SheafOfModules.sections`, `mathlib:AlgebraicGeometry.Scheme.Modules.pushforward`, `mathlib:AlgebraicGeometry.Scheme.Modules.pushforward_obj_obj`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B3`, namespace `AutomorphicBundles`.

**Sources.**

- [LanIntro], §4.2.7, pp.49–50: “does not extend to a vector bundle” — Separates toroidal vector coefficients from scalar minimal-compactification forms.

### Minimal Hodge-line descent with positivity

`AutomorphicBundles:B3/minimal-hodge-line-comparison` · comparison · proposed declaration `AutomorphicBundles.minimalHodgeLineComparison` · packet B0

For the PEL/Hilbert scalar Hodge line under the compactification owner’s positivity and graded-section finite-generation hypotheses, a sufficiently divisible positive power of the toroidal Hodge line is pulled back from an ample invertible sheaf on the minimal compactification. Compare its scalar boundedness/section description with that line. This is an additional scalar theorem; it is not asserted for an arbitrary Levi vector coefficient or every undivided Hodge-line power.

**Proof.**

1. Import the actual positive Hodge line and minimal Proj construction from C5 (Hilbert ramified specializations from C6/H2).
2. Use the chosen sufficiently divisible graded degree to construct the minimal invertible sheaf and pullback comparison.
3. Compare scalar sections in its canonical boundary frame; do not infer locally free minimal coefficients from minimalCoherentPushforward.

**Acceptance.**

- Vector-valued coefficients remain toroidal locally free; the separate scalar minimal-line claim has explicit positivity/divisibility hypotheses.

**Depends on.** this roadmap: `B3/minimal-coherent-pushforward`; stages of other roadmaps: `ShimuraCompactifications:C5`, `ShimuraCompactifications:C6`, `HilbertModularVarietiesAndShimuraCurves:H2`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B3`, namespace `AutomorphicBundles`.

**Sources.**

- [LanIntro], §4.2.7, p.49: “powers of the canonical bundle” — Separates toroidal vector coefficients from scalar minimal-compactification forms.
- [HLTT], §3.4.1, pp.109–110: “locally free sheaf” — These pages define the Hodge determinant ω and its Hecke action. Positivity and descent of a sufficiently divisible power to the minimal model are separate C5/C6 inputs, not consequences proved on these pages.

### Rationality of the canonical extension

`AutomorphicBundles:B3/canonical-rational-descent` · theorem · proposed declaration `AutomorphicBundles.canonicalRationalDescent` · packet B0

For a coefficient J defined over its number field L and a compatible smooth projective toroidal model over L, the canonical extension and reduced-boundary subcanonical extension are defined over L. Their field base-change identifications preserve the canonical chart normalization and reduced boundary. No all-prime integral extension is inferred from characteristic-zero descent.

**Proof.**

1. Use canonicalExtensionGluing and canonicalExtension to construct the chart-normalized functor.
2. Use the canonical coefficient descent from automorphicVectorBundle and the actual rational toroidal model and boundary charts from C2. Extend its descent isomorphisms using the canonical chart normalization; arbitrary twists with the same open restriction do not qualify. No C3 refinement theorem or general-data conjugation theorem is used in this restricted assertion.
3. Use effective coefficient descent; the uniqueness is the specified extension-functor normalization, not its open restriction alone.

**Acceptance.**

- A coefficient over L⊃E has its extension over L; the statement does not force its descent to E.

**Depends on.** this roadmap: `B3/canonical-and-subcanonical-extensions`, `B3/canonical-extension-gluing`, `B3/subcanonical-extension`, `B0/coefficient-galois-descent`, `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`; stages of other roadmaps: `ShimuraCompactifications:C2`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B3`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], V §6 Theorem 6.2, p.91: “defined over” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

## B3.general — General-data boundary extensions

B3.general constructs the canonical and subcanonical extensions of the general-data bundle on the toroidal models of ShimuraCompactifications C2.general, by the Deligne–Harris analytic construction and rational descent, without a universal semi-abelian family (`B3.general/general-canonical-extension`); identifies the canonical extension of a full-group coefficient with the zero-exponent logarithmic extension (`B3.general/general-logarithmic-comparison`); and proves that the section-space comparisons commute with refinements, extended Hecke maps and conjugation to the transported fan (`B3.general/general-boundary-functoriality`). B4’s form spaces for general data and B5’s vector expansions use these nodes.

**Coverage: planned.** What remains in this layer:

- Canonical extension proof and logarithmic boundary dictionary: Milne V §6 states the exact canonical extension functor and rationality; HLTT B.8 gives the semi-abelian frame model. The complete Deligne–Harris local analytic construction, chart transition/gluing, general-data extension without abelian degenerations, regular singularity/unipotence and zero-exponent logarithmic comparison still need declaration-sized refinements. No current generic regular-singular connection supplier stage was found. Integral PEL extensions remain conditional on C5’s specific good-base coefficients.
- Resolve this stage’s listed supplier requests and replace prose-only geometric contracts by typed signatures on the actual supplied carriers; then independently verify proof refinements. All implementation status remains unchecked.
- Typed geometric signature gap: see the exact named contract inventory in the suggested file and the packet gap. Its comments are not elaborated declarations.

### General canonical automorphic extensions

`AutomorphicBundles:B3.general/general-canonical-extension` · theorem · proposed declaration `AutomorphicBundles.generalCanonicalExtension` · planet “General canonical automorphic extension” · packet B0

On the characteristic-zero general-data toroidal models supplied by C2.general, the general automorphic coefficient V(J) admits the canonical locally free extension functor, with its specified analytic boundary normalization, rational descent and tensor/dual compatibility. Define the subcanonical extension using the reduced boundary ideal. This does not require an unspecified general-data semi-abelian family and does not assert an integral extension at all primes.

**Proof.**

1. Use generalAssociatedModel and the actual general rational boundary/toroidal charts from C2.general.
2. Use the Deligne–Harris analytic automorphic extension construction, whose complete local proof interface remains recorded as a gap; replace no step by a universal abelian family.
3. Descend the normalized extension as in canonicalRationalDescent, and form the reduced ideal twist.

**Acceptance.**

- The unit and full-group coefficients have the same normalization as on Hodge-type subdata.

**Depends on.** this roadmap: `B2.general/general-associated-model`, `B3/canonical-and-subcanonical-extensions`, `B3/subcanonical-extension`, `B3/canonical-rational-descent`; stages of other roadmaps: `ShimuraCompactifications:C2.general`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B3/general`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], V §6 Theorems 6.1–6.2, pp.90–91: “Deligne” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.
- [LanIntro], §4.2.7, pp.49–50: “canonical extensions” — Separates toroidal vector coefficients from scalar minimal-compactification forms.

### General logarithmic realization comparison

`AutomorphicBundles:B3.general/general-logarithmic-comparison` · comparison · proposed declaration `AutomorphicBundles.generalLogarithmicComparison` · packet B0

For a full Gᶜ representation on a general-data neat toroidal model, establish regular singularity/unipotent boundary monodromy and identify its canonical extension with the zero-exponent logarithmic flat extension; compare tensor, dual and conjugation structures. Keep the regular-singular proof interface explicit and do not attach a flat connection to every Levi coefficient.

**Proof.**

1. Use generalFlatRealizations for the open connection and C2.general for the rational boundary charts.
2. Apply the same missing automorphic regular-singularity/Deligne extension theorem as logarithmicConnectionExtension.
3. Compare normalized local lattices with generalCanonicalExtension and transport them under generalConjugationCocycle.

**Acceptance.**

- No assertion that all general-data full-group coefficients arise from a motivic family is needed.

**Depends on.** this roadmap: `B2.general/general-flat-realizations`, `B3.general/general-canonical-extension`, `B3/logarithmic-connection-extension`, `B1.general/general-conjugation-cocycle`; stages of other roadmaps: `ShimuraCompactifications:C2.general`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B3/general`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], V §6, Theorem 6.1(c) and proof, p.91: “equivariant differential operators” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.
- [LanIntro], §4.2.7, p.50: “integrable connection” — Separates toroidal vector coefficients from scalar minimal-compactification forms.

### General boundary and conjugation compatibility

`AutomorphicBundles:B3.general/general-boundary-functoriality` · theorem · proposed declaration `AutomorphicBundles.generalBoundaryFunctoriality` · planet “General boundary compatibility” · packet B0

The general canonical and subcanonical section-space comparisons commute with fan refinements, compatible extensions of datum/Hecke maps and conjugation to the transported fan and coefficient. The subcanonical comparison uses reduced-boundary ideal pushforward, not equality under every pullback. A single fixed fan is not declared invariant under all Hecke translations.

**Proof.**

1. Import C3.general’s general-data refinement and compatible Hecke/boundary maps.
2. Use generalCanonicalExtension and the canonical pullback/degree-zero ideal comparison from refinementCanonicalExtension.
3. Compare all choices on common refinements, including conjugated fans; use normalized conjugation and uniqueness.

**Acceptance.**

- Conjugation acts on the coefficient field and the fan; it is not an endomorphism of one fixed compactification.

**Depends on.** this roadmap: `B3.general/general-canonical-extension`, `B3/refinement-canonical-extension`, `B3/fan-independent-sections`, `B1.general/general-conjugation-cocycle`; stages of other roadmaps: `ShimuraCompactifications:C3.general`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B3/general`, namespace `AutomorphicBundles`.

**Sources.**

- [HarrisBB], Theorem 1.4.2 and (1.4.3), pp.10–11: “Gal” — Conjugates the fan as well as the canonical coefficient.
- [Milne90], V §6, p.91: “canonical model” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

## B4 — Classical forms and explicit weights

B4 defines the forms and makes the weights explicit. Classical forms of coefficient J at level K over L are M(J,K;L) = H⁰(S_Σ, V(J)^can) on a smooth projective toroidal model, independent of the fan (`B4/classical-forms`), and cusp forms are S(J,K;L) = H⁰(S_Σ, V(J)^sub), the kernel of restriction to every component of the reduced boundary (`B4/cusp-forms`); finite-dimensionality uses properness, never H⁰ of the open variety. The analytic side is organized around the normalized automorphy factor (`B4/automorphy-factor-cocycle-and-growth-conditions`), its adapter to Mathlib’s existing `SlashAction` (`B4/slash-action-of-automorphy-factor`, with the lemmas `B4/slash-evaluation`, `B4/slash-invariance`, `B4/inverse-base-action-cocycle` and `B4/nonzero-section-cocycle`), and the comparison of geometric forms with holomorphic equivariant functions satisfying the growth condition (`B4/analytic-classical-comparison`). The explicit cases are the GL₂ Hodge line compared with Mathlib’s `ModularForm` through AlgebraicModularFormsAndSerreWeights R15.1 (`B4/gl2-hodge-line-comparison`); arithmetic Hilbert weights (`B4/hilbert-arithmetic-weight`), the split Hilbert coefficient with its central character Norm^w (`B4/hilbert-coefficient`), its central descent check (`B4/hilbert-central-descent`) and its unsplit form (`B4/unsplit-hilbert-descent`); Siegel Schur and determinant coefficients (`B4/siegel-coefficient`); and the split unitary GU(1,1) example with its separate similitude line (`B4/unitary-coefficient`). Form spaces satisfy field base change (`B4/number-field-forms-base-change`), and the classical coefficients sit inside the Hodge–Tate VB functor with the twist κ(μ) (`B4/classical-vb-tate-normalization`).

The section modules here are over coefficient fields. The roadmap’s completion condition asks also for forms over the specified integral PEL and Hilbert models, and B5 works with them throughout (AF(k,M), Diamond’s M_{(k,m)}(U;R)); no B4 node plans them, which is recorded as an assembly gap.

**Coverage: planned.** What remains in this layer:

- Reductive algebraic group interfaces beyond the current supplier scope: Needed are the precise central Z_s torus and quotient universal property, algebraic frame/stabilizer representability, characteristic-zero Chevalley tensor realization and semisimplicity, and general algebraic Levi highest-weight/dual classification over splitting fields. Upstream ClassicalGroups supplies the complex classical Schur/highest-weight cases, not all Q-groups, nonsplit descent or integral Schur sheaves. These extensions belong in the reductive/representation direction, not as private automorphic replacements.
- The ineffective arithmetic centre beyond finite tame quotients: R09.5’s finite/tame coarse-space statements do not alone prove descent through an infinite arithmetic central kernel. Give the analytic effective quotient and algebraic coefficient-group compatibility, proving that the fibre action is trivial on that kernel. Use H0/H3/H4 for the Hilbert groups; do not infer this from neatness.
- Coherent geometric section foundations and local analytic growth: The pin contains Scheme.Modules and its presheaf/pushforward/global-section operations, freshly read, but the exact proper coherent finiteness/base-change, locally free tensor/ideal dictionary and holomorphic logarithmic-growth removable-singularity/coordinatewise vanishing interfaces need suppliers/refinement. A section comparison does not follow from ordinary GAGA on the open Shimura variety. The course-note full Dolbeault resolutions were not used to close this chain.
- BCGP analytic/solid and rational Hodge–Tate coefficient comparison: BCGP v1 §§3.2.19,4.5 and 4.8 were read. The finite-dimensional algebraic tautological sequence is planned here. Its embedding into the solid analytic category and the rational Hodge–Tate M-torsor/VB functor are separately supplied inputs to classicalVBTateNormalization. T2/T6 consume B1–B3; reversing those dependencies would make a cycle. Refine the downstream comparison interface and rationality/Tate normalization (BCGP p.78 cites RC22 Theorem 4.2.1) before claiming the complete p-adic comparison. No infinite-dimensional category is rebuilt here.
- Resolve this stage’s listed supplier requests and replace prose-only geometric contracts by typed signatures on the actual supplied carriers; then independently verify proof refinements. All implementation status remains unchecked.
- Typed geometric signature gap: see the exact named contract inventory in the suggested file and the packet gap. Its comments are not elaborated declarations.

### Classical automorphic forms

`AutomorphicBundles:B4/classical-forms` · definition · proposed declaration `AutomorphicBundles.classicalForms` · planet “Classical automorphic forms” · packet B0

For an automorphic coefficient over L and a smooth projective toroidal model SΣ/L, define M(J,K;L)=H⁰(SΣ,V(J)^can). Use the fan-independent identification to regard this as the classical finite-level form space. The finite-dimensionality assertion uses properness/coherence, not H⁰ of the open variety alone. This definition applies to the general-data coefficient via B2.general/B3.general as well.

**Construction.**

1. Use canonicalExtension (or generalCanonicalExtension) on the supplied proper model.
2. Take global sections; the generic coherent-section interface is recorded as an open typed foundation.
3. Use fanIndependentSections/generalBoundaryFunctoriality to remove dependence of the space on the chosen fan.

**API.**

- `AutomorphicBundles.classicalForms_section` (projection): A classical form is a global section of the canonical coefficient.
- `AutomorphicBundles.classicalForms_fan` (equivalence): Common refinements induce a canonical identification of M for different smooth projective fans.
- `AutomorphicBundles.classicalForms_multiply` (functoriality): Tensoring sections gives M(J1)×M(J2)→M(J1⊗J2).
- `AutomorphicBundles.classicalForms_map` (functoriality): A map u:V^can→W^can on the supplied model induces H⁰(u):M(V)→M(W). In the available Scheme.Modules forgetting this is exactly SheafOfModules.sectionsMap u.
- `AutomorphicBundles.classicalForms_map_id` (simp): For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `AutomorphicBundles.classicalForms_map_comp` (functoriality): For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Unit tests.**

- `AutomorphicBundles.classicalForms_test_unit` (degenerate): For a proper geometrically connected model and trivial coefficient, M=L.
- `AutomorphicBundles.classicalForms_test_curve` (compatibility): For the modular Hodge coefficient ω^k the space agrees with the geometric modular-form owner’s proper-curve sections.
- `AutomorphicBundles.classicalForms_test_open` (non-example): For Spec L[t] with coefficient O, H⁰=L[t] has the infinite independent family 1,t,t²,…; it cannot replace the proper geometrically connected model, whose unit coefficient has H⁰=L.
- `AutomorphicBundles.classicalForms_test_map_id` (compatibility): For any supplied Scheme.Modules coefficient V and section s, the supplied-section forgetting sends the identity coefficient map to s.
- `AutomorphicBundles.classicalForms_test_map_comp` (compatibility): For supplied Scheme.Modules maps u:V→W and v:W→U, mapping a section by v∘u equals mapping first by u then by v.
- `AutomorphicBundles.classicalForms_test_map_zero` (degenerate): For any supplied Scheme.Modules map u:V→W, its global-section map sends the compatible section whose value on every open is zero to the zero compatible section.

**Acceptance.**

- Weight zero means regular functions on the proper canonical model; it need not mean all functions on the open variety.

**Used by.**

- Milne III §7: Defines forms rational over number fields.
- BCGP §4.5 classical comparison: Uses the finite-dimensional algebraic coefficient; higher coherent cohomology belongs to B5.

**Depends on.** this roadmap: `B3/canonical-and-subcanonical-extensions`, `B3/fan-independent-sections`, `B3.general/general-canonical-extension`, `B3.general/general-boundary-functoriality`; libraries: `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:AlgebraicGeometry.Scheme.Modules.presheaf`, `mathlib:SheafOfModules.sections`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III §2, p.55 (including the holomorphy-at-infinity caveat); III §7, Definition 7.1, p.62: “holomorphic” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.
- [LanIntro], §4.2.7, p.50: “global sections” — Separates toroidal vector coefficients from scalar minimal-compactification forms.

> **Assembly note: integral forms.** The roadmap’s completion condition asks for classical forms over the specified integral PEL and Hilbert models as well as over number fields, and B5 uses the integral section modules throughout: AF(k,M) = Γ(X, ω_tor^k ⊗_R M) for an arbitrary module M over Lan’s good-prime base, Γ(X, Ecan(W) ⊗_R M) for a finite projective W, and Diamond’s M_{(k,m)}(U;R). This node and `B4/cusp-forms` define the section spaces over a coefficient field only. The B5 packet asks B4 for the integral functor in its request to `AutomorphicBundles:B4`; no node plans it yet. See the gap *Integral coefficient interfaces that B5 needs from B2–B4*.

### Cuspidal automorphic forms

`AutomorphicBundles:B4/cusp-forms` · definition · proposed declaration `AutomorphicBundles.cuspForms` · planet “Cuspidal automorphic forms” · packet B0

Define S(J,K;L)=H⁰(SΣ,V(J)^sub)=ker[M(J,K;L)→H⁰(DΣ,i*V(J)^can)]. Thus a cusp form vanishes along every component of the reduced boundary in the canonical frame. Its fan-independent definition uses the ideal-pushforward comparison; no Koecher extension theorem makes this vanishing automatic.

**Construction.**

1. Take global sections of the reduced-boundary exact sequence from subcanonicalExtension.
2. Use left exactness to identify the kernel; no H¹ vanishing is needed.
3. Apply fanIndependentSections for independence and preserve the inclusion into classicalForms.

**API.**

- `AutomorphicBundles.cuspForms_include` (projection): S(J)↪M(J) is induced by the boundary-ideal inclusion.
- `AutomorphicBundles.cuspForms_kernel` (characterisation): A form is cuspidal iff its restriction to every reduced boundary component is zero.
- `AutomorphicBundles.cuspForms_tensor` (functoriality): The product of a cusp form with a classical form is cuspidal in the tensor coefficient.
- `AutomorphicBundles.cuspForms_map` (functoriality): A map between canonical coefficients induces the boundary-compatible map on their I_D twists and hence S(u):S(V)→S(W); the inclusions into classical forms commute with this map.
- `AutomorphicBundles.cuspForms_map_id` (simp): For a fixed admitted input V, the induced map of the identity morphism of V is the identity on its output.
- `AutomorphicBundles.cuspForms_map_comp` (functoriality): For admitted composable morphisms u:V→W and v:W→U, the induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field and model hypotheses remain fixed.

**Unit tests.**

- `AutomorphicBundles.cuspForms_test_empty` (degenerate): If D=∅, S(J)=M(J).
- `AutomorphicBundles.cuspForms_test_constant` (computation): For nonempty boundary and trivial coefficient on a proper geometrically connected model, a nonzero constant is not cuspidal.
- `AutomorphicBundles.cuspForms_test_crossing` (characterisation): At a two-component crossing a holomorphic coefficient is cuspidal iff it lies in the product ideal (q1q2), not merely (q1,q2).

**Acceptance.**

- On a compact Shimura variety the empty-boundary cusp and classical spaces agree.

**Used by.**

- Lan §4.2.7: Subcanonical sections define cuspidal vector-valued forms.
- BCGP §4.8.2 cusp: Supplies the classical negative-boundary coefficient; the cohomological comparison is a separate consumer.

**Depends on.** this roadmap: `B3/subcanonical-extension`, `B4/classical-forms`, `B3/fan-independent-sections`; libraries: `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:AlgebraicGeometry.Scheme.Modules.presheaf`, `mathlib:SheafOfModules.sections`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [LanIntro], §4.2.7, p.50: “cusp forms” — Separates toroidal vector coefficients from scalar minimal-compactification forms.
- [BCGP], §4.8.2, Theorem 4.8.2, p.101: “(−DKp )” — The compact-support decomposition uses the classical coherent coefficient with the reduced boundary twist; no untwisted open coefficient is substituted.

### The normalized automorphy factor

`AutomorphicBundles:B4/automorphy-factor-cocycle-and-growth-conditions` · definition · proposed declaration `AutomorphicBundles.AutomorphyFactor` · planet “Automorphy factor” · packet B0

For a left action of Γ on a complex domain X and a finite-dimensional complex vector space V, a linear holomorphic automorphy factor is J:Γ×X→GL_C(V), holomorphic in x for each γ, with J(1,x)=1 and J(gh,x)=J(g,hx)J(h,x). It defines f(gx)=J(g,x)f(x). Classical/cusp growth is a separate condition on such a holomorphic equivariant section in the specified canonical boundary frame: local holomorphic extension, respectively membership in its reduced boundary ideal. The algebraic adapter below forgets topology and retains only the normalized linear cocycle.

**Construction.**

1. Specify invertible coefficient maps and the normalized shifted cocycle; they are data, not deductions from a zero section.
2. Obtain transition factors from analyticCoefficient/sectionsEquivariant; reversing the base-action convention requires inverseBaseActionCocycle.
3. Attach geometric growth only through canonicalExtension/subcanonicalExtension. The missing holomorphic bundle carrier is omitted honestly in the functional Lean signature.

**API.**

- `AutomorphicBundles.AutomorphyFactor_one` (simp): J(1,x)=id.
- `AutomorphicBundles.AutomorphyFactor_mul` (structure): J(gh,x)=J(g,hx)∘J(h,x), with the indicated shifted base point.
- `AutomorphicBundles.AutomorphyFactor_change_frame` (equivalence): A holomorphic frame change u gives J′(g,x)=u(gx)J(g,x)u(x)⁻¹ and an isomorphic coefficient.
- `AutomorphicBundles.AutomorphyFactor_forget` (projection): Forgetting holomorphy yields the normalized linear cocycle input for the existing SlashAction adapter.
- `AutomorphicBundles.AutomorphyFactor_ext` (extensionality): Two normalized functional factors with identical coefficient maps at every (k,g,x) are equal; the law proofs carry no extra data. The holomorphic refinement additionally retains its declared analytic hypotheses.
- `AutomorphicBundles.AutomorphyFactor_change_frame_id` (simp): Gauge change by the constant identity frame returns the original normalized functional factor.
- `AutomorphicBundles.AutomorphyFactor_change_frame_comp` (relation): Changing first by u and then by v equals changing by x↦v(x)∘u(x). This is the displayed order of frame composition, not its reverse.

**Unit tests.**

- `AutomorphicBundles.AutomorphyFactor_test_unit` (degenerate): The constant identity coefficient is normalized and satisfies the shifted cocycle.
- `AutomorphicBundles.AutomorphyFactor_test_frame` (computation): For any invertible frame function u, J(g,x)=u(gx)u(x)⁻¹ satisfies the shifted cocycle.
- `AutomorphicBundles.AutomorphyFactor_test_order` (non-example): For Q² let Sx(a,b)=(a+b,b), Sy(a,b)=(a,a+b). The constant functional factor J(g,x)=g for the evaluation action of GL(Q²) has J(SxSy,x)(1,0)=(2,1) and J(SySx,x)(1,0)=(1,1). Reversing coefficient composition fails this test.
- `AutomorphicBundles.AutomorphyFactor_test_shift` (non-example): On C₂ acting on itself by left multiplication, choose frames u(1)=id and u(t)=Sx on Q². Gauge-changing the identity factor gives J(t²,1)(0,1)=(0,1), whereas the unshifted square J(t,1)²(0,1)=(2,1). Thus the base-point shift is necessary.

**Acceptance.**

- The zero function transforms for every J and therefore cannot force the cocycle.

**Used by.**

- Lan §4.2.7: States the transformation law of analytic forms.
- Mathlib SlashAction adapter: Encodes the right slash action derived from the left action.

**Depends on.** this roadmap: `B0/analytic-coefficient`, `B0/sections-equivariant`, `B3/canonical-and-subcanonical-extensions`, `B3/subcanonical-extension`; libraries: `mathlib:LinearEquiv.trans`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [LanIntro], §4.2.7, pp.49–50: “Automorphy condition” — Uses the corrected shifted cocycle; the printed unshifted formula is recorded in sourceIssues.

### The convention adapter to SlashAction

`AutomorphicBundles:B4/slash-action-of-automorphy-factor` · construction · proposed declaration `AutomorphicBundles.slashActionOfAutomorphyFactor` · packet B0

For any index β, monoid G acting on X on the left, semiring R and R-module V, normalized coefficients J(k,g,x):V≃_R V with J(k,gh,x)=J(k,g,hx)∘J(k,h,x) define Mathlib’s existing SlashAction β G (X→V) by (f|_k g)(x)=J(k,g,x)⁻¹ f(gx). No new slash-action carrier is introduced. The action is additive and R-linear, and |gh equals first |g then |h.

**Construction.**

1. Define map by inverse coefficient followed by base evaluation using LinearEquiv.symm.
2. Use the inverse composite identity LinearEquiv.trans_symm, retaining trans’s opposite argument order, to prove slash_mul.
3. Use hone and linearity for slash_one, zero_slash and add_slash; the explicit constructor is prototyped with proof placeholders.

**API.**

- `AutomorphicBundles.slashActionOfAutomorphyFactor_map_apply` (simp): The map evaluates to J(k,g,x)⁻¹(f(gx)).
- `AutomorphicBundles.slashActionOfAutomorphyFactor_invariant_iff` (characterisation): ∀g,f|_k g=f iff ∀g,x,f(gx)=J(k,g,x)f(x).
- `AutomorphicBundles.slashActionOfAutomorphyFactor_map_smul` (structure): Slash is R-linear on functions.
- `AutomorphicBundles.slashActionOfAutomorphyFactor_congr` (extensionality): Pointwise equal coefficient families give equal SlashAction values, independent of proof terms.
- `AutomorphicBundles.slashActionOfAutomorphyFactor_map_of_trivial` (compatibility): If J is identity, map is precomposition by the left base action.

**Unit tests.**

- `AutomorphicBundles.slashActionOfAutomorphyFactor_test_trivial` (degenerate): For identity J, f|g is x↦f(gx).
- `AutomorphicBundles.slashActionOfAutomorphyFactor_test_zero` (computation): The zero function is fixed for every normalized coefficient.
- `AutomorphicBundles.slashActionOfAutomorphyFactor_test_frame` (characterisation): The point-dependent frame cocycle u(gx)u(x)⁻¹ yields exactly u(x)u(gx)⁻¹f(gx).
- `AutomorphicBundles.slashActionOfAutomorphyFactor_test_noncommuting` (non-example): For the two rational shears, applying the inverse composite in the wrong order changes the value on (1,0).
- `AutomorphicBundles.slashActionOfAutomorphyFactor_test_inverse` (non-example): The rational shearX applied to the constant (0,1) has slash value (−1,1), detecting an operator that forgets the inverse.
- `AutomorphicBundles.slashActionOfAutomorphyFactor_test_sl2` (compatibility): For SL2(Z), V=C and J(k,g,z)=denom(g,z)^k as a scalar linear automorphism, the adapter equals Mathlib’s scalar slash action.
- `AutomorphicBundles.slashActionOfAutomorphyFactor_test_zero_noncocycle` (non-example): The normalized nonzero factor on C2 with nonidentity value 2 transforms the zero section but fails J(gh)=J(g)J(h); this is not accepted as an adapter input.
- `AutomorphicBundles.slashActionOfAutomorphyFactor_test_semilinear` (non-example): The determinant-negative GL2(R) slash law has conjugated scalar multiplication and cannot be represented by this C-linear adapter.

**Acceptance.**

- The existing prototype tests noncommuting coefficients, scalar SL2 compatibility and the determinant-negative semilinear boundary.

**Used by.**

- B4 analytic comparison: Translates transformation invariance into the existing right-action vocabulary.
- Pinned Mathlib SlashActions: Tests agreement with the already implemented scalar convention.

**Depends on.** libraries: `mathlib:SlashAction`, `mathlib:LinearEquiv.trans`, `mathlib:LinearEquiv.trans_symm`, `mathlib:LinearEquiv.symm_apply_eq`, `mathlib:LinearEquiv.automorphismGroup`, `mathlib:LinearEquiv.applyDistribMulAction`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [LanIntro], §4.2.7, p.49: “f (γZ)” — The vector-valued inverse convention is a deduction from the corrected transformation law and the pinned right-action class.

### Evaluation of the slash adapter

`AutomorphicBundles:B4/slash-evaluation` · lemma · proposed declaration `AutomorphicBundles.slashActionOfAutomorphyFactor_map_apply` · packet B0

For the exact parameters and normalized cocycle of slashActionOfAutomorphyFactor, its map evaluates as J(k,g,x)⁻¹(f(gx)).

**Proof.**

1. Unfold the explicit map field of slashActionOfAutomorphyFactor.

**Acceptance.**

- No nowhere-zero assumption on f is used.

**Depends on.** this roadmap: `B4/slash-action-of-automorphy-factor`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [LanIntro], §4.2.7, p.49: “Automorphy condition” — The evaluation formula is the algebraic convention derived from this transformation law.

### Invariance and the transformation law

`AutomorphicBundles:B4/slash-invariance` · lemma · proposed declaration `AutomorphicBundles.slashActionOfAutomorphyFactor_invariant_iff` · packet B0

For the exact adapter parameters, ∀g,f|_k g=f iff ∀g,x,f(gx)=J(k,g,x)f(x). This equivalence needs no nonzero-section hypothesis.

**Proof.**

1. Use pointwise function equality and slashEvaluation.
2. Apply LinearEquiv.symm_apply_eq at each point.

**Acceptance.**

- The zero function satisfies both sides.

**Depends on.** this roadmap: `B4/slash-evaluation`; libraries: `mathlib:LinearEquiv.symm_apply_eq`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [LanIntro], §4.2.7, p.49: “f (γZ)” — Restates the transformation law as invariance for an independently specified cocycle.

### The inverse-base right cocycle

`AutomorphicBundles:B4/inverse-base-action-cocycle` · lemma · proposed declaration `AutomorphicBundles.inverse_base_action_cocycle` · packet B0

For groups G,H, a left G-action on X and J:G×X→H satisfying the left shifted cocycle, define x·g=g⁻¹x and J_right(x,g)=J(g⁻¹,x). Then J((gh)⁻¹,x)=J(h⁻¹,g⁻¹x)J(g⁻¹,x). This right base action is distinct from the right slash action on functions.

**Proof.**

1. Expand (gh)⁻¹=h⁻¹g⁻¹.
2. Apply the specified left cocycle to h⁻¹,g⁻¹ and x.

**Acceptance.**

- Noncommuting coefficient maps distinguish the product order.

**Depends on.** this roadmap: `B4/automorphy-factor-cocycle-and-growth-conditions`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [LanIntro], §4.2.7, p.49: “cocycle condition” — The right-base formula follows from the corrected left cocycle, including its shifted argument.

### When a section detects a scalar cocycle

`AutomorphicBundles:B4/nonzero-section-cocycle` · lemma · proposed declaration `AutomorphicBundles.cocycle_at_of_automorphy_of_ne_zero` · packet B0

For a monoid G acting on X, a field K, J:G×X→K and f:X→K with f(gx)=J(g,x)f(x), at any point x with f(x)≠0 one has J(gh,x)=J(g,hx)J(h,x). No conclusion is inferred at a zero of f or from the zero function.

**Proof.**

1. Evaluate f((gh)x) using the action law and twice using its transformation law.
2. Cancel the scalar f(x) using the field assumption and f(x)≠0.

**Acceptance.**

- For C2 acting trivially on a point, J(nonidentity)=2 and J(identity)=1 transforms zero but violates the cocycle because 4≠1.

**Depends on.** nothing beyond its statement.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [LanIntro], §4.2.7, p.49: “cocycle condition” — The section-cancellation guard is a deduction; the source cocycle is imposed independently.

### Geometric and analytic classical forms

`AutomorphicBundles:B4/analytic-classical-comparison` · theorem · proposed declaration `AutomorphicBundles.analyticClassicalComparison` · planet “Geometric–analytic forms comparison” · packet B0

Over L↪C, identify classicalForms with holomorphic equivariant functions for the analytic coefficient whose components in the canonical boundary frame extend holomorphically across each cusp chart. Identify cuspForms with those components in the reduced boundary ideal. Locally, holomorphic logarithmic-growth components have removable singularities; cuspidal components are divisible by each reduced boundary parameter. Global algebraization uses proper projective GAGA on SΣ. The scalar Baily–Borel boundedness statement is limited to the separately descended scalar line coefficients.

**Proof.**

1. Use automorphicAnalyticComparison and sectionsEquivariant on the open space.
2. Use the canonical chart normalization and the local removable-singularity/vanishing lemma; its analytic foundation is recorded separately, and the faulty course-note Dolbeault proof is not imported.
3. Use projective coherent GAGA at C2 of ComplexComparisonPartII on the proper SΣ, and subcanonicalExtension’s ideal sequence.

**Acceptance.**

- Changing a frame arbitrarily can change apparent boundedness; the theorem names the canonical frame. Negative-determinant full GL2 uses its semilinear extension.

**Depends on.** this roadmap: `B4/classical-forms`, `B4/cusp-forms`, `B2/automorphic-analytic-comparison`, `B0/sections-equivariant`, `B3/canonical-and-subcanonical-extensions`, `B3/subcanonical-extension`, `B3/minimal-hodge-line-comparison`; stages of other roadmaps: `ComplexComparisonPartII:C2`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [LanIntro], §4.2.7, pp.49–50: “Growth condition” — Separates toroidal vector coefficients from scalar minimal-compactification forms.
- [HarrisCours8], p.3, degree-zero kernels only: “removable singularities” — Only the holomorphic local kernel criterion is used; the course-note higher-resolution errors are recorded and not treated as a proof.

### The GL₂ Hodge-line specialization

`AutomorphicBundles:B4/gl2-hodge-line-comparison` · comparison · proposed declaration `AutomorphicBundles.gl2HodgeLineComparison` · packet B0

For an actual modular-curve model with a fine level removing stabilizers, the cohomological Hodge line is ω=e*Ω¹_E/S, its canonical extension is the generalized-elliptic invariant-differential line, and the integer weight-k coefficient is ω^{⊗k} (dual powers for k<0). Compare the proper-curve geometric forms supplied by R15.1 to Mathlib’s existing scalar ModularForm Γ k / CuspForm Γ k after the actual complex uniformization and all-cusp comparison. For determinant-negative full GL2 the scalar law is semilinear; the C-linear prototype comparison is restricted to SL2.

**Proof.**

1. Import the modular Hodge line, generalized family, q-cusp model and geometric–analytic form comparison from R12/R13/R15.1; do not reconstruct that owner’s forms.
2. Apply automorphicAnalyticComparison with the explicitly chosen cohomology/dual convention and compare canonical boundary frames.
3. Use the pinned scalar SlashActions and ModularForm/CuspForm definitions; match holomorphy and boundedness/zero at every cusp, not one selected cusp.

**Acceptance.**

- For k=0 the coefficient is O; an odd weight does not descend through a surviving −1 stabilizer.

**Depends on.** this roadmap: `B2/automorphic-analytic-comparison`, `B4/analytic-classical-comparison`; stages of other roadmaps: `AlgebraicModularFormsAndSerreWeights:R15.1`; libraries: `mathlib:ModularForm`, `mathlib:CuspForm`, `mathlib:ModularForm.SL_slash_apply`, `mathlib:ModularForm.slash_action_eq'_iff`, `mathlib:ModularForm.smul_slash`, `mathlib:UpperHalfPlane.denom_ne_zero`, `mathlib:UpperHalfPlane.denom_cocycle`, `mathlib:UpperHalfPlane.denom_cocycle'`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [LanIntro], §4.2.7, pp.49–50: “modular forms” — Separates toroidal vector coefficients from scalar minimal-compactification forms.
- [HarrisCours4], pp.1–2: “vector bundle” — The Hodge-line coefficient must be compared with the fixed scalar slash convention.

### Arithmetic Hilbert weights

`AutomorphicBundles:B4/hilbert-arithmetic-weight` · definition · proposed declaration `AutomorphicBundles.HilbertArithmeticWeight` · planet “Arithmetic Hilbert weight” · packet B0

For a finite set I of real embeddings of a totally real field F, an arithmetic weight is k:I→Z together with w:Z and the parity condition k_τ≡w mod 2 for every τ. Put m_τ=(w−k_τ)/2. This is a coefficient label, not the theorem that its representation descends to Q or through every arithmetic central stabilizer. Negative k and determinant powers are allowed over the characteristic-zero coefficient field.

**Construction.**

1. Specify the integer data and actual pointwise parity laws.
2. Define m using exact integer division; parity proves 2m_τ=w−k_τ.
3. Keep the Galois orbit and central compatibility for the separate coefficient/descent nodes.

**API.**

- `AutomorphicBundles.HilbertArithmeticWeight_k` (projection): The embedding-indexed integer k_τ.
- `AutomorphicBundles.HilbertArithmeticWeight_w` (projection): The common integer central weight w.
- `AutomorphicBundles.HilbertArithmeticWeight_detExponent` (data): m_τ=(w−k_τ)/2.
- `AutomorphicBundles.HilbertArithmeticWeight_two_mul_detExponent` (characterisation): 2m_τ=w−k_τ for every τ.
- `AutomorphicBundles.HilbertArithmeticWeight_add` (constructor): Pointwise k addition and w addition preserve arithmetic parity.
- `AutomorphicBundles.HilbertArithmeticWeight_ext` (extensionality): Arithmetic weights with the same embedding-indexed k and the same w are equal; parity proofs carry no extra data.

**Unit tests.**

- `AutomorphicBundles.HilbertArithmeticWeight_test_zero` (degenerate): k=0,w=0 is an arithmetic weight and every m_τ=0.
- `AutomorphicBundles.HilbertArithmeticWeight_test_negative` (computation): For one embedding, k=4,w=2 gives m=−1, so forbidding negative determinant twists would lose an allowed weight.
- `AutomorphicBundles.HilbertArithmeticWeight_test_parity` (non-example): k=3,w=2 violates parity and is not an arithmetic weight.

**Acceptance.**

- An odd k_τ cannot be paired with an even w.

**Used by.**

- Hilbert coefficient below: Produces integral determinant exponents and a common central character.
- Unsplit Hilbert descent: Galois permutes the embedding labels.

**Depends on.** nothing beyond its statement.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III §8, pp.63–64: “Hilbert” — Milne identifies the ineffective Hilbert unit kernel and why a coefficient must satisfy a central condition. The actual (k,w) determinant formula is supplied by Diamond §3.2, not by this passage.
- [LanIntro], §4.2.7, pp.49–50: “weights” — Lan supplies the general algebraic coefficient/automorphy framework. The embedding-indexed parity and determinant exponent are the Diamond §3.2 specialization, not a formula stated on these pages.
- [Diamond21], §3.2, tensor coefficient formula, Definition 3.2.1 and paritious-weight paragraph, p.12: “w = kθ + 2lθ” — Set lθ=(w−kθ)/2 in the displayed Lθ^kθ ⊗ Nθ^lθ formula. The central/unit action is χ_(k+2l), hence Norm^w in the paritious case; retain the norm −1 condition when w is odd. Only the supplied characteristic-zero HB family is used here, not an all-prime extension.

### The split Hilbert coefficient

`AutomorphicBundles:B4/hilbert-coefficient` · construction · proposed declaration `AutomorphicBundles.hilbertCoefficient` · packet B0

Over a characteristic-zero field L splitting F and the supplied HB family, decompose H¹dR=⊕_τH_τ and ω=⊕_τω_τ, with H_τ rank two and ω_τ rank one. For an arithmetic weight define ω^{(k,w)}=⊗_τ(ω_τ^{k_τ}⊗δ_τ^{m_τ}), δ_τ=det H_τ and m_τ=(w−k_τ)/2. In the cohomological frame convention scalar t_τ acts as t_τ on ω_τ and t_τ² on δ_τ, so the central character is ∏t_τ^w=Norm(t)^w. Passing to the homology representation convention inverts that character.

**Construction.**

1. Import the actual HB Hodge modules and the rank-one/Rapoport hypotheses from H1/H2.
2. Use HilbertArithmeticWeight to form tensor and inverse line powers and determinants.
3. Apply automorphicVectorBundle and hodgeParabolicConvention to identify this cohomological coefficient with the correct split Levi representation, retaining its centre.

**API.**

- `AutomorphicBundles.hilbertCoefficient_formula` (characterisation): The line equals the displayed tensor of ω_τ powers and determinant powers.
- `AutomorphicBundles.hilbertCoefficient_central` (compatibility): Its cohomological-frame central action is Norm(t)^w.
- `AutomorphicBundles.hilbertCoefficient_add` (functoriality): Coefficient tensor products correspond to addition of arithmetic weights.

**Unit tests.**

- `AutomorphicBundles.hilbertCoefficient_test_rational` (compatibility): For F=Q, (k,w=k) has m=0 and gives ω^k.
- `AutomorphicBundles.hilbertCoefficient_test_determinant` (computation): For every embedding k_τ=0,w=2, the coefficient is ⊗_τdet H_τ.
- `AutomorphicBundles.hilbertCoefficient_test_negative` (non-example): At k_τ=4,w=2 the determinant factor is δ_τ⁻¹; replacing m by its absolute value changes the central character.

**Acceptance.**

- The ranks and splitting field are explicit; integral ramified bases outside H2’s Rapoport locus do not inherit the split formula automatically.

**Used by.**

- B4 Hilbert central descent: Checks the action of actual unit stabilizers.
- Hilbert p-adic consumers: Fixes the finite-dimensional coefficient before varying weights p-adically.

**Depends on.** this roadmap: `B4/hilbert-arithmetic-weight`, `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B0/hodge-parabolic-convention`; stages of other roadmaps: `HilbertModularVarietiesAndShimuraCurves:H1`, `HilbertModularVarietiesAndShimuraCurves:H2`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III §8, pp.63–64: “units” — Milne identifies the ineffective Hilbert unit kernel and why a coefficient must satisfy a central condition. The actual (k,w) determinant formula is supplied by Diamond §3.2, not by this passage.
- [LanIntro], §4.2.7, pp.49–50: “representations” — Lan supplies the general algebraic coefficient/automorphy framework. The embedding-indexed parity and determinant exponent are the Diamond §3.2 specialization, not a formula stated on these pages.
- [Diamond21], §3.2, tensor coefficient formula, Definition 3.2.1 and paritious-weight paragraph, p.12: “w = kθ + 2lθ” — Set lθ=(w−kθ)/2 in the displayed Lθ^kθ ⊗ Nθ^lθ formula. The central/unit action is χ_(k+2l), hence Norm^w in the paritious case; retain the norm −1 condition when w is odd. Only the supplied characteristic-zero HB family is used here, not an all-prime extension.

### The Hilbert central-action check

`AutomorphicBundles:B4/hilbert-central-descent` · theorem · proposed declaration `AutomorphicBundles.hilbertCentralDescent` · packet B0

For the actual G=Res(F/Q)GL2 or G* arithmetic quotient, the split Hilbert coefficient descends through an ineffective central subgroup C iff its character Norm(t)^w (or its homology inverse) is trivial on C. Totally positive norm-one units act trivially for arithmetic (k,w), but any remaining signs and finite stabilizers must be checked separately. The G* polarization quotient uses H3/H4’s actual finite unit quotient, not a guessed quotient of the full centre.

**Proof.**

1. Use hilbertCoefficient to compute the central character.
2. Import the full G/G* quotient and level-kernel descriptions from H0/H3/H4.
3. Apply ineffectiveFibreDescent; explicitly test every remaining finite stabilizer and retain the stack formulation otherwise.

**Acceptance.**

- Neatness alone never discharges the infinite-unit condition; norm −1 and a parity-odd w can obstruct a quotient that includes such units.

**Depends on.** this roadmap: `B4/hilbert-coefficient`, `B0/ineffective-fibre-descent`; stages of other roadmaps: `HilbertModularVarietiesAndShimuraCurves:H0`, `HilbertModularVarietiesAndShimuraCurves:H3`, `HilbertModularVarietiesAndShimuraCurves:H4`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III §8, pp.63–64: “units” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.
- [Diamond21], §3.2, tensor coefficient formula, Definition 3.2.1 and paritious-weight paragraph, p.12: “w = kθ + 2lθ” — Set lθ=(w−kθ)/2 in the displayed Lθ^kθ ⊗ Nθ^lθ formula. The central/unit action is χ_(k+2l), hence Norm^w in the paritious case; retain the norm −1 condition when w is odd. Only the supplied characteristic-zero HB family is used here, not an all-prime extension.

### Hilbert coefficients without a global splitting

`AutomorphicBundles:B4/unsplit-hilbert-descent` · comparison · proposed declaration `AutomorphicBundles.unsplitHilbertDescent` · packet B0

Descend the split Hilbert coefficient along the Galois action permuting F embeddings and the representation’s actual descent datum. Before splitting, use the O_F⊗O-linear Hodge/de Rham modules and determinant/norm constructions; do not choose global idempotent summands over a nonsplitting base. The coefficient field is the field of definition of the embedding-indexed weight and representation, enlarged if necessary beyond the Shimura reflex field.

**Proof.**

1. Import H1/H2’s unsplit HB modules and local rank assumptions.
2. Compare the tensor coefficient after a splitting extension, where the Galois group permutes labels and factors.
3. Apply coefficientGaloisDescent and hilbertCentralDescent to descend over the actual weight field; for integral bases require the finite locally free module hypotheses.

**Acceptance.**

- A nonparallel real-quadratic weight is exchanged by the two embeddings, so it is not automatically Q-defined.

**Depends on.** this roadmap: `B4/hilbert-coefficient`, `B0/coefficient-galois-descent`, `B4/hilbert-central-descent`; stages of other roadmaps: `HilbertModularVarietiesAndShimuraCurves:H1`, `HilbertModularVarietiesAndShimuraCurves:H2`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III §5, Theorem 5.1, p.61; III §8, pp.63–64: “number field” — States the canonical-model or associated-coefficient interface with the hypotheses retained below.

### Siegel Schur and determinant coefficients

`AutomorphicBundles:B4/siegel-coefficient` · construction · proposed declaration `AutomorphicBundles.siegelCoefficient` · packet B0

For the rank-g cohomological Hodge bundle ω of a principally polarized abelian family and a dominant integer weight λ₁≥⋯≥λ_g, set a_i=λ_i−λ_g and define the characteristic-zero coefficient S_a(ω)⊗(det ω)^{λ_g}, with the chosen similitude/Tate character separately specified. Use the actual Schur functor form over a good integral base when requested. In the BCGP opposite-flag convention compare the tautological exact sequence and its two Levi coefficients, with the dual and central-character conversion from B2.

**Construction.**

1. Import the actual Siegel/PEL family and Hodge module from M3/M5 and A4.
2. Import the generic Schur/determinant representation and associated functor through the recorded missing representation interface.
3. Apply leviHighestWeightConvention; compare BCGP’s tautological filtered sequence after the specified opposite/dual switch, without splitting it by assertion.

**API.**

- `AutomorphicBundles.siegelCoefficient_schur` (characterisation): The coefficient is S_(λ−λ_g)(ω)⊗det(ω)^{λ_g} with its separately declared central twist.
- `AutomorphicBundles.siegelCoefficient_scalar` (compatibility): For λ=(r,…,r) the coefficient is det(ω)^r.
- `AutomorphicBundles.siegelCoefficient_standard` (compatibility): For λ=(1,0,…,0) it is ω.

**Unit tests.**

- `AutomorphicBundles.siegelCoefficient_test_g1` (compatibility): For g=1 the coefficient is the modular Hodge-line power ω^{λ₁}.
- `AutomorphicBundles.siegelCoefficient_test_det` (computation): For λ=(−1,…,−1) it is det(ω)⁻¹, not a polynomial-only Schur coefficient.
- `AutomorphicBundles.siegelCoefficient_test_standard` (non-example): For g>1, λ=(1,0,…,0) yields rank g, so replacing every Siegel coefficient by a scalar determinant power fails.

**Acceptance.**

- For g=1 the formula is ω^{λ₁}; any Hodge–Tate graded-sequence comparison is conditional on T2, not a new p-adic comparison theorem here.

**Used by.**

- BCGP §3.2.19: Fixes the standard filtered coefficient and its graded conventions.
- BCGP §4.8.2: Supplies ordinary/cuspidal finite-dimensional coefficients; the cohomology statement belongs to B5.

**Depends on.** this roadmap: `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B2/levi-highest-weight-convention`; stages of other roadmaps: `PELModuli:M3`, `PELModuli:M5`, `AbelianSchemesAndArithmeticModuli:A4`; libraries: `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-2-the-weyl-construction-via-young-symmetrizers`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [BCGP], §3.2.19, p.45; §4.8.1–4.8.2, pp.101–102: “tautological” — Fixes coefficient/dual/twist conventions for the added source; higher cohomology is outside this part.
- [HLTT], Appendix B.8, pp.270–271: “locally free of finite rank” — The PEL example supplies associated locally free coefficients and the explicit formal Tate/similitude dictionary, not the general Schur classification.

### A split unitary coefficient test

`AutomorphicBundles:B4/unitary-coefficient` · construction · proposed declaration `AutomorphicBundles.unitaryCoefficient` · packet B0

For the imaginary-quadratic GU(1,1) PEL datum over a coefficient field L containing both labelled embeddings τ,barτ of F, use the actual decomposition H¹dR=H_τ⊕H_barτ with each rank two and Hodge lines ω_τ,ω_barτ of rank one. In the chosen cohomological graded-frame convention the split Levi GL1×GL1×Gm weight (k,l;n) gives ω_τ^k⊗ω_barτ^l⊗ν^n, where ν is the declared similitude/Tate line. Negative exponents use duals. The formula is a labelled example, not an unproved identification of ν with a determinant on every model.

**Construction.**

1. Import the GU(1,1) PEL datum and decomposition from M0/M3/M5.
2. Use the graded-frame associated functor, retaining the source’s formal Tate twist and cohomology/dual convention.
3. Apply coefficientGaloisDescent when swapping τ and barτ; import any extra central stabilizer condition from ineffectiveFibreDescent.

**API.**

- `AutomorphicBundles.unitaryCoefficient_formula` (characterisation): The labelled weight coefficient is ω_τ^k⊗ω_barτ^l⊗ν^n.
- `AutomorphicBundles.unitaryCoefficient_dual` (functoriality): The dual weight is (−k,−l;−n), with dualized similitude line.
- `AutomorphicBundles.unitaryCoefficient_conjugate` (compatibility): The embedding permutation transports (k,l;n) to (l,k;n) and the transported PEL coefficient.

**Unit tests.**

- `AutomorphicBundles.unitaryCoefficient_test_unit` (degenerate): Weight (0,0;0) gives O.
- `AutomorphicBundles.unitaryCoefficient_test_line` (computation): Weight (1,0;0) gives ω_τ, while (0,1;0) gives the differently labelled ω_barτ.
- `AutomorphicBundles.unitaryCoefficient_test_twist` (non-example): Weight (0,0;1) is ν, so erasing the formal similitude/Tate line loses a coefficient even when k=l=0.

**Acceptance.**

- Complex conjugation swaps the two labelled Hodge-line factors; a nonparallel pair (k,l) is not fixed merely because the underlying Shimura datum is.

**Used by.**

- HLTT Appendix B.8: Checks the explicit unitary Levi coefficient, canonical frame and formal Tate twist.
- B4 rational coefficient field: Tests Galois permutation of labelled factors.

**Depends on.** this roadmap: `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B0/coefficient-galois-descent`, `B0/ineffective-fibre-descent`; stages of other roadmaps: `PELModuli:M0`, `PELModuli:M3`, `PELModuli:M5`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [HLTT], Appendix B.8, pp.270–271: “ν” — The finite locally free coefficient and its semi-abelian boundary model.
- [CS17], §2.3, pp.669–670: “graded pieces” — The tensor-frame/filtration construction in the version of record.

### Rational forms and field base change

`AutomorphicBundles:B4/number-field-forms-base-change` · theorem · proposed declaration `AutomorphicBundles.numberFieldFormsBaseChange` · packet B0

For proper SΣ/L and coherent canonical or subcanonical coefficients, the form space is finite-dimensional over L and, for any field extension L′/L, H⁰(SΣ,F)⊗_L L′≃H⁰(SΣ,L′,F_L′). Under L↪C it identifies the L-rational subspace of the analytic classical/cusp space. Products and compatible coefficient maps commute with this base change. The theorem does not assert analogous flat base change for every integral special fibre.

**Proof.**

1. Use proper coherent finiteness and flat field base change for degree-zero cohomology from the recorded coherent-sheaf foundation.
2. Use canonicalRationalDescent to identify the coefficient after base change.
3. Apply analyticClassicalComparison and the tensor maps from classicalForms/cuspForms.

**Acceptance.**

- A characteristic-zero field extension is flat; reduction modulo p may have extra forms and is not covered.

**Depends on.** this roadmap: `B4/classical-forms`, `B4/cusp-forms`, `B3/canonical-rational-descent`, `B4/analytic-classical-comparison`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [Milne90], III §7, Definition 7.1 and Proposition 7.2, p.62; Corollary 7.3, p.63: “finite-dimensional” — The present finiteness proof uses the proper extension model, retaining the source’s open-space caveat.

### The classical VB coefficient normalization

`AutomorphicBundles:B4/classical-vb-tate-normalization` · comparison · proposed declaration `AutomorphicBundles.classicalVBTateNormalization` · packet B0

In the Hodge-type setting of BCGP §4.5, fix a neat tame level K^p, a p-adic coefficient field E large enough for the split group/reflex embeddings, compatible toroidal fans, and the separately constructed rational Hodge–Tate map/universal M torsor and VB functor. For a finite-dimensional algebraic Levi coefficient L_κ, identify VB⁰_Σ(L_κ)=ω^{κ,sm}(κ(μ)), where ω^{κ,sm}=colim_Kp ω^κ_Kp is the classical smooth canonical coefficient with rational structure. The μ-weight Tate twist is part of this comparison; it is absent from the untwisted coherent convention of §4.8. The action moves fans and is compared on compatible refinements.

**Proof.**

1. Use automorphicVectorBundle and canonicalExtension to supply the finite-dimensional rational coherent coefficient on every level.
2. Compare the separately supplied rational Hodge–Tate M torsor with the canonical dR/graded frame torsor, using its actual rationality theorem; this is the recorded downstream comparison gap, not a new early-stage dependency on T2/T6.
3. Compute μ’s action on L_κ and its Tate normalization. Pass to the smooth colimit and compare Hecke maps on refinements.

**Acceptance.**

- For the tensor unit κ=0 the twist is zero. In §4.8 the underlying coherent ω^κ is used without retaining the §4.5 twist twice.

**Depends on.** this roadmap: `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B1/filtration-reduction`, `B3/canonical-and-subcanonical-extensions`, `B2/levi-highest-weight-convention`, `B1/principal-hecke-pullback`, `B3/fan-independent-sections`.

**Library target.** module `TauCeti/NumberTheory/AutomorphicBundles/B4`, namespace `AutomorphicBundles`.

**Sources.**

- [BCGP], §4.5, proof end p.78: “where κ(µ) is the Tate twist” — Fixes coefficient/dual/twist conventions for the added source; higher cohomology is outside this part.

> **Assembly note: planned twice.** Boxer–Calegari–Gee–Pilloni’s item 4.5-classical (VB⁰(L_κ) is the classical smooth automorphic bundle with the twist κ(μ)) is the statement of this node and also the first assertion of `B5/classical-bcgp-equivariance`, which cites §§4.6.1–4.6.2 for it where this node cites §4.5. This node is the owner of the sheaf identification: it sits in the layer of the classical coefficients, and the B0 packet’s routed-item record assigns 4.5-classical to it. The B5 node should import it and keep only what it adds (the level-colimit coherent cohomology as smooth admissible G(ℚ_p)-representations, the (−D) version, compatibility with level, prime-to-p Hecke and refinement maps, and the GSp₄ check ω^{((1,0;−1),sm)} = ω_A(−1) ⊗ O^sm). Neither statement changes.

## B5 — Hecke action and Fourier expansions

B5 equips the section modules with Hecke operators and expansions at the cusps, and proves the comparisons that identify their coefficients and normalizations; the p-adic theory uses these expansions as normalization tests, not as a definition unrelated to the sheaves. Its scalar strand works on Lan’s good-prime PEL toroidal model with an arbitrary coefficient module M (the settings table under *Conventions*). The B5 packet does not create a second Hecke algebra, and it does not replan modular curves, canonical principal bundles, the higher Coleman coefficient functor or logarithmic period theory: Mathlib’s analytic q-expansion, trace and Tau Ceti’s abstract Hecke ring are imported, the modular theory comes from AlgebraicModularFormsAndSerreWeights R15.1–R15.2, and the correspondences from AdelicAlgebraicGroups AA.4.

**Ownership at the boundary.** ShimuraCompactifications C0 supplies the fan and the graded character algebra, C1 the cusp labels, full stabilizers and quotients, C4 the abelian and torus torsors and the degeneration data, and C5 (its early part) the good-prime toroidal model and charts. AdicSpacesPartII F0 supplies completion on scheme charts, SchemeAndStackFoundations SF.1 transports arguments through a stack atlas, and SF.0 owns coefficient tensors and the finite-projective sheaf trace with its laws; the duality counit of SF.2 is a different operation and is not used as a trace. B1–B4 own principal bundles, representation realization, extensions and section modules; B5 consumes these carriers. Hilbert H2/H3 and ShimuraCompactifications C6 own the ramified models, unit quotients and compactification charts; C6’s Koecher extension does not replace the cusp ideal. `T6:comparison` owns the logarithmic comparison underneath the classical coefficients, and B5 does not make T6 depend on its downstream decomposition. ShimuraCompactifications C5 combines the early toroidal geometry B5 consumes with a late minimal-compactification endpoint whose proof (Lan 7.2.3) consumes `B5/constant-term-restriction`; the B5 packet proposes splitting it (see *Structural proposals*).

Every B5 node that cites a stage of B1–B4 is matched with the B0-packet nodes that answer it in an Assembly note, and the full list is in *Cross-part prerequisites*.

**Coverage: planned.** What remains in this layer:

- Supply the actual common-completion coefficient comparison and stack descent, and instantiate residue-fibre detection and coefficient-sensitive boundary/refinement exactness.
- Complete finite-projective sheaf trace, refined correspondence composition, normalization and non-neat descent on the actual toroidal coefficient modules.
- Provide the general-data formal boundary identity and the ramified Hilbert chart, unit-line and component interfaces; read the underlying Rapoport proof.
- Assign the existing pending VB and BGG suppliers, read FC90 Theorem 6.2’s ordinary/compact-support proof, and provide the logarithmic cohomology carriers and functoriality.
- State the omitted full geometric Lean signatures and tests against those imported carriers, and validate the C5 early/late split in the atlas DAG.

### B5.i. Fourier–Jacobi coefficients and the expansion principle

The scalar strand follows Lan, *Arithmetic compactifications of PEL-type Shimura varieties*, §§7.1.1–7.1.2, with two repairs: the comparison of cone expansions goes through a common completion, and the reduction to arbitrary coefficients goes through a prime filtration instead of a filtered union of free submodules (source issues E6812 and E6813). Coefficient modules live on the abelian torsor C_Φ (`B5/fj-coefficient-module`); a section expands by formal restriction along a stratum, the Mumford chart and graded extraction (`B5/local-fj-expansion`); the expansions of one section along a face and along a larger cone agree through the common boundary completion (`B5/cone-compatibility`), giving the cusp-label morphism FJ_Φ into full-stabilizer invariants (`B5/global-fj-expansion`), which is refinement-invariant (`B5/fj-refinement`) and whose constant term is restriction to the boundary (`B5/constant-term-restriction`). The expansion principle (`B5/fj-injectivity`) follows by dévissage on the coefficient module: naturality (`B5/coefficient-naturality`), left exactness of both rows (`B5/coefficient-sequence-exact`, `B5/fj-target-left-exact`), the prime-quotient case (`B5/fj-injectivity-cyclic`), extensions (`B5/fj-injectivity-extension`), finite modules (`B5/fj-injectivity-finite`), and a single finite-generation lift. Coefficient recognition (`B5/coefficient-recognition`) and the cusp criterion (`B5/cuspidal-boundary-criterion`) complete the strand.

#### Fourier-Jacobi coefficient modules on the abelian torsor

`AutomorphicBundles:B5/fj-coefficient-module` · definition · packet B5

Use the good-prime PEL setting of Lan 6.4 and 7.1: R is the indicated localization of the reflex integers (or its characteristic-zero field version), X is the smooth proper toroidal stack, k is a nonnegative integer, and M is an R-module. For an actual cusp label Phi, let C_Phi be its abelian torsor, Psi_Phi(ell) the character-indexed invertible sheaf from the relative torus embedding, and L_Phi = det_Z(X_Phi) tensor omega_A the boundary Hodge line. Define C_Phi(ell;k,M) = Gamma(C_Phi, Psi_Phi(ell) tensor L_Phi^k tensor_R M). This definition uses the torsor, not an arbitrary scalar coefficient ring. For an index set Lambda in the character lattice, the coefficient-family target is the product over ell in Lambda of these modules, with transport under the actual cusp stabilizer.

**Hypotheses.**

- The PEL datum, base, cusp label, character lattice, torsor and sheaves are those of the supplied toroidal chart.
- Do not assume that the lower-dimensional moduli object is a scheme or that its finite cover is trivial.
- No arbitrary-base or arbitrary-Levi-weight extension is included.

**Construction.**

1. Import the character-graded invertible sheaves and their multiplication and transport maps from C0/C4/C5, before the minimal-compactification endpoint of C5.
2. Import the boundary identification of the actual Hodge line from B3/B4 and Lan 7.1.2.1; retain the determinant of the character lattice.
3. Take sections on C_Phi and use existing module and product constructions. The expression using p_*Psi on the lower-dimensional moduli stack needs its projection/base-change proof and is not asserted here.

**API.**

- `FJCoefficient.map` (functoriality): An R-linear map M to N induces coefficient maps in every degree, respecting identity and composition.
- `FJCoefficient.transport` (functoriality): A supplied cusp-label or stabilizer isomorphism transports the lattice degree, invertible sheaf and coefficient section together, with composition law.
- `FJCoefficient.family_ext` (extensionality): Two coefficient families are equal exactly when their components agree in every degree after the specified transports.

**Unit tests.**

- `FJCoefficient.zeroCoefficients` (degenerate): With coefficient module M = 0, every C_Phi(ell;k,M) is zero.
- `FJCoefficient.tateTrivialization` (compatibility): For C_Phi = Spec R, Psi_Phi(n) and L_Phi trivialized by the Tate-chart data, C_Phi(n;k,M) identifies with M by evaluation in those trivializations.
- `FJCoefficient.notFiniteSupport` (non-example): For the rank-one formal chart R[[q]] over nonzero R, the coefficient family of (1-q)^(-1) has coefficient 1 in every nonnegative degree; the expansion target must not impose finite support.

**Acceptance.**

- For the rank-one Tate chart with the supplied differential trivialization, degree n coefficients identify with M.
- For a higher-dimensional boundary, a coefficient is a section on the abelian torsor, not generally an element of M.

**Used by.**

- B5/local-fj-expansion: Provides the actual modules into which completed boundary sections expand.
- OverconvergentAutomorphicForms:O6: Fixes the classical coefficient target to which a p-adic expansion must be compared.

**Depends on.** stages of this roadmap: `AutomorphicBundles:B3`, `AutomorphicBundles:B4` (answered below); stages of other roadmaps: `ShimuraCompactifications:C0`, `ShimuraCompactifications:C4`, `ShimuraCompactifications:C5`; libraries: `mathlib:AlgebraicGeometry.Scheme.Modules`, `tauceti:AlgebraicGeometry.Scheme.Modules.tensorProduct`, `mathlib:AlgebraicGeometry.tilde.isoTop`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/FourierJacobi`, namespace `FJCoefficient`.

**Sources.**

- [LanPEL], 7.1.2.1-7.1.2.4, first coefficient expression in (7.1.2.3): “Fourier–Jacobi coefficients” — Uses the coefficient expression on the abelian torsor; does not silently assert arbitrary base change for its pushforward expression.

> **Assembly note: cross-part references.**
> - `AutomorphicBundles:B3` is answered exactly by `B3/boundary-coefficient-chart`: its API item `boundaryCoefficientChart_hodge` identifies the chart Hodge coefficient with e*Ω¹ of the semi-abelian extension; its C5 clause is the good-prime PEL case. L_Φ is its determinant through the Raynaud extension (Lan 7.1.2.1).
> - `AutomorphicBundles:B4`: No B4 result enters this definition, which uses only tensor powers of L_Φ; the section functor AF(k,M) is first used by local-fj-expansion. The reference can be dropped.

#### Expansion by restriction to a formal cusp chart

`AutomorphicBundles:B5/local-fj-expansion` · construction · planet “Fourier-Jacobi expansion” · packet B5

For a nonempty stratum represented by (Phi,delta,sigma), construct the R-linear map from AF(k,M) = Gamma(X,omega_tor^k tensor_R M) to the product of C_Phi(ell;k,M) over ell in sigma-dual. It restricts a section to the formal completion along the stratum, pulls it to the supplied Mumford chart, identifies the Hodge line, and extracts graded coefficients. Its image satisfies the actual stabilizer equivariance. The coefficient product is a target, not an assertion that every family is the expansion of a section or of a completed graded-algebra element.

**Hypotheses.**

- The standing good-prime PEL, weight and coefficient conditions of fj-coefficient-module.
- The formal-chart isomorphism identifies the universal degenerating family and the boundary ideal, not just the underlying point set.

**Construction.**

1. Use C5's early toroidal formal-completion theorem (Lan 6.4.1.1(5)) and F0's completion/restriction operations.
2. Identify the pulled-back Hodge line with L_Phi using the Raynaud-extension invariant-differential sequence and its determinant; use etale descent, not merely formal etaleness.
3. Use the completed character-graded algebra from C0/C4 and extract coefficients in the preceding node. Keep the completion topology; do not replace a completed sum by an unqualified product isomorphism.
4. Transport invariance of the original section through the chart. Descent gives invariant families without averaging over the stabilizer.

**API.**

- `FourierJacobi.localExpansion` (constructor): Given the actual formal restriction, Mumford chart and Hodge comparison from the suppliers, return the R-linear local expansion with its degree-indexed coefficient target and stabilizer equivariance.
- `FourierJacobi.local_coeff` (projection): Evaluation in degree ell equals the coefficient obtained from the actual completed section on the Mumford chart.
- `FourierJacobi.local_add` (simp): The local expansion sends f+g to the sum of the two coefficient families.
- `FourierJacobi.local_smul` (simp): The local expansion commutes with multiplication by every scalar in R.

**Unit tests.**

- `FourierJacobi.local_zero` (degenerate): The expansion of the zero section has every coefficient zero.
- `FourierJacobi.local_tate_monomial` (computation): On the rank-one formal Tate chart, the local section q^n(du/u)^k has coefficient 1 in degree n and 0 in every other degree. This is a local-chart test, not a claim that the monomial extends to a global modular form.
- `FourierJacobi.local_coefficient_map` (compatibility): Applying M to N to a section and then expanding gives the degreewise coefficient map applied to its expansion.

**Acceptance.**

- On the Tate chart a section written f(q)(du/u)^k maps to the coefficients of f(q), not of f(q)dq/q.
- A section whose completion is zero has every coefficient zero; the converse needs the chart's separatedness theorem.

**Used by.**

- B5/cone-compatibility: Compares the same section on overlapping torus embeddings.
- B5/fj-injectivity: Turns coefficient vanishing into vanishing of completed sections.

**Depends on.** this roadmap: `B5/fj-coefficient-module`; stages of this roadmap: `AutomorphicBundles:B3` (answered below); stages of other roadmaps: `ShimuraCompactifications:C0`, `ShimuraCompactifications:C4`, `ShimuraCompactifications:C5`, `AdicSpacesPartII:F0`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/FourierJacobi`, namespace `FourierJacobi`.

**Sources.**

- [LanPEL], 7.1.2.1 and 7.1.2.3-7.1.2.4: “composition” — The map is the displayed geometric composition, not a new definition on unrelated formal coefficient sequences.
- [LanErrata], Items 75-76: “not necessarily a scheme” — Retains the stack and the actual etale descent condition.

> **Assembly note: cross-part references.**
> - `AutomorphicBundles:B3` is answered exactly by `B3/canonical-and-subcanonical-extensions`, `B3/boundary-coefficient-chart`: the canonical extension of the Hodge line (its C5 clause is the good-prime PEL case) and its identification on the degeneration chart.

#### Comparison of cone expansions through a common completion

`AutomorphicBundles:B5/cone-compatibility` · lemma · packet B5

For a face inclusion sigma1 contained in the closure of sigma2, with both cones in the positive part of the same cusp fan, sigma2-dual is contained in sigma1-dual. For a global Hodge section whose two local expansions are obtained from the common formal boundary chart specified in the supplier contract, its sigma1 coefficients agree with its sigma2 coefficients on sigma2-dual and vanish on sigma1-dual minus sigma2-dual. Thus the sigma1 family is the extension by zero of the sigma2 family. Incidence chains of positive cones and the support theorem then put the global expansion in the dual of the fan support. This compares the common-image sections, not arbitrary elements of the two separately completed rings.

**Hypotheses.**

- Both local expansions are the pullbacks of the SAME section on the common boundary completion, compatibly with the universal Mumford family and the Hodge identification. The construction of that common section and chart is a C4/early-C5 obligation, not an assumption that the comparison theorem already holds.
- C0/F0 supply degreewise coefficient extraction on the relevant boundary-adic completion and its compatibility with the two continuous maps to stratum completions.
- Use the admissible fan's incidence and support theorems; arbitrary cones need not be comparable. The zero cone need not belong to the positive part.

**Proof.**

1. Nonnegativity of the character pairing gives the reversed inclusion sigma2-dual contained in sigma1-dual. This step concerns uncompleted character algebras.
2. Use the common formal completion of the relative fan embedding along the union W of its positive-cone strata (the object preceding Lan (6.2.5.22)). Locally put J = I(W). Each individual stratum completion maps TO this common completion: on rings, J maps into the corresponding stratum ideal. An ordinary open immersion does not instead give a map between the two different stratum completions. For locally Noetherian scheme charts, the exact existing supplier is AdicSpacesPartII:F0/completion-of-morphism: apply it to the chart map and the closed stratum contained in the common boundary. Its affine direction sends the common J-adic completion to the individual I_sigma-adic completion when J maps into I_sigma. This imports only the completion-map construction, not its missing homogeneous coefficient comparison or stack descent.
3. Pull the global section to this common chart using the early-C5 morphism and C4's compatible Mumford family. On the sigma2 ordinary chart the graded algebra has degrees in sigma2-dual. The C0/F0 theorem for its J-adic quotients and separated degree projections gives zero outside those degrees, including after passage to the common completion.
4. Apply the two continuous maps from that common completed algebra and their degreewise compatibility. The same coefficients are read on the common degrees; the newly allowed sigma1 degrees remain zero. For relative invertible sheaves do this on trivializing charts and use their actual transports and descent. No isomorphism between a completion and an unrestricted product is used.
5. Apply the supplier's incidence-chain theorem to positive cones and intersect the resulting support conditions. Duality exchanges the union of cones with the intersection of their duals. The common-chart and completed coefficient contracts remain explicit open proof leaves until verified in their owners.

**Acceptance.**

- Uncompleted test only: the zero face of a positive ray reverses dual inclusions, and a polynomial has zero negative coefficients as a Laurent polynomial. This is NOT a map between the associated stratum completions.
- For nonzero k, the face chart D(y) in Spec k[x,y] has x-adic completion k[y,y^-1][[x]], whereas the origin chart has completion k[[x,y]]. No coordinate-preserving ring map from the latter to the former exists: 1-y is a unit in the source but not in the target, as seen by constant-x coefficient followed by y=1. This rejects the former proof step even without a continuity assumption.
- Positive common-source test: completion of k[x,y] along (xy) maps to both of those stratum completions because (xy) maps into their defining ideals. Compare only images of one common element; do not enlarge the common source to k[[x,y]].
- Relative-chart descent must preserve the character line and Hodge trivialization as well as the integer degree.

**Depends on.** this roadmap: `B5/local-fj-expansion`; other roadmaps: `AdicSpacesPartII:F0/completion-of-morphism`, `ShimuraCompactifications:C0/relative-face-open`; stages of other roadmaps: `ShimuraCompactifications:C0`, `ShimuraCompactifications:C4`, `ShimuraCompactifications:C5`, `AdicSpacesPartII:F0`; libraries: `mathlib:PowerSeries.isUnit_iff_constantCoeff`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/FourierJacobi`, namespace `FourierJacobi`.

**Sources.**

- [LanPEL], Argument after 7.1.2.5, printed p. 536, read as a rendered page; common completion preceding (6.2.5.22), p. 482, and Remark 6.2.5.30, p. 485: “supported on” — The source motivates cone-independent support. Its displayed index issues and unsupported direct-completion step are recorded below. The common-completion route is this packet's proposed repair, not a claim that the printed proof already establishes the requested continuity and coefficient contracts.
- [EGA-I], Chapter I, 10.9.1–10.9.3, printed pp. 198–199 (physical PDF 197–198): “prolongement de f aux complétés” — The existing F0 supplier constructs the formal map with its ideal containment and direction. This does not supply character grading, a Mumford family or stack descent.

**Why the cone comparison needs a common completion.** For a face σ₁ of the closure of σ₂ in the positive part of one cusp fan, nonnegativity of the character pairing gives σ₂^∨ ⊆ σ₁^∨, and the *ordinary* smaller-cone chart is an open subchart of the larger-cone chart (`ShimuraCompactifications:C0/relative-face-open`). That gives the inclusion of the uncompleted character algebras. It does **not** give a map between their completions along their two different strata. Let k be a nonzero commutative ring, take the quadrant cone and its x-ray face. The ordinary charts are Spec k[x,y] and D(y) = Spec k[x,y,y⁻¹]; the first completes along its closed stratum to k[[x,y]], the second along its face stratum to k[y,y⁻¹][[x]] with the x-adic topology. There is no coordinate-preserving ring homomorphism k[[x,y]] → k[y,y⁻¹][[x]]: 1 − y is a unit in the source (its inverse has every nonnegative y-coefficient equal to one), while in the target the constant coefficient in x followed by evaluation at y = 1 is a ring homomorphism to k sending 1 − y to 0, and a unit cannot go to zero in a nonzero ring. No continuity is assumed. The example refutes the generic toric inference, not Lan’s support theorem, and it is not a complete PEL datum. The pinned `PowerSeries.isUnit_iff_constantCoeff` supplies the unit criterion, and the suggested file keeps three algebraic regression statements for it.

**The common-completion contract.** Use the relative fan embedding completed along the union W of the positive-cone strata, the common formal object defined just before Lan’s (6.2.5.22). On an ordinary chart write J = I(W) and I_σ for the ideal of one stratum. The required arrows of formal spaces are *individual stratum completion → common boundary completion → X*; on rings they reverse, and they exist because J maps into I_σ on the appropriate chart. No arrow from one stratum completion to another is used. For locally Noetherian scheme charts the arrow is the existing node `AdicSpacesPartII:F0/completion-of-morphism` (EGA I, 10.9.1–10.9.3), applied to the chart map with the selected closed stratum mapping into the common boundary. The division of the remaining work is:

- **C0 and F0:** describe J as a character-homogeneous ideal on the shared toric chart; construct the completed coefficient projections through its finite quotients, their separatedness and their compatibility with the continuous maps to the individual stratum completions. The inverse limit is not replaced by an unrestricted product.
- **C4 and early C5:** construct the Mumford family on the common completion and its morphism to the toroidal model, and prove that restriction gives the individual chart maps and the same Hodge identification.
- **B5:** pull a global Hodge section back to that common object, compare its two pullbacks degree by degree, and descend the calculation with the actual coefficient-sheaf transports.

On the σ₂ ordinary chart the character algebra has degrees only in σ₂^∨, and the completed coefficient theorem preserves that support; the two comparison maps therefore give agreement on the common degrees and zero coefficients in σ₁^∨ ∖ σ₂^∨, so the σ₁ expansion is the extension by zero of the σ₂ expansion. The statement concerns sections in the common image, not every element of either completed ring. A positive affine test: the (xy)-adic completion of k[x,y] maps to both k[[x,y]] and k[y,y⁻¹][[x]], since (xy) maps into (x,y) and, after localization, into (x); one compares images of a single element of this common completion, and enlarging the common source to all of k[[x,y]] reintroduces the counterexample. Finally the admissible fan’s incidence chains among positive cones and its support theorem put the global expansion in the dual of the fan support; arbitrary cones need not be comparable.

#### The cusp-label Fourier-Jacobi morphism

`AutomorphicBundles:B5/global-fj-expansion` · construction · packet B5

Restrict the compatible cone expansions to P_Phi-dual to obtain an R-linear cusp-label expansion FJ_Phi. Its codomain is the submodule of the product of C_Phi(ell;k,M) fixed by the actual action of the full cusp stabilizer, including its action on degrees and coefficient sheaves. Composing with a cone inclusion recovers the local expansion. Neither finite support nor division by the order of a stabilizer enters the definition.

**Hypotheses.**

- The preceding local-expansion and cone-comparison hypotheses.
- The full stabilizer action is supplied by the cusp data; invariance under one cone stabilizer alone is insufficient.

**Construction.**

1. Apply cone-compatibility to obtain a coefficient family on P_Phi-dual independent of the cone used to compute it.
2. Use the full stabilizer's transport of Mumford families to prove invariance of the family. Do not infer this merely from invariance under a single cone stabilizer.
3. Use the existing fixed-submodule construction and the degreewise module structure; the operation remains restriction of a geometric section.

**API.**

- `FourierJacobi.expansion` (constructor): Given compatible local expansions and the support theorem, return the R-linear map to the actual full-stabilizer invariant coefficient family, characterized by its local coefficient evaluations.
- `FourierJacobi.coeff` (projection): The ell-th coefficient is evaluation of the family in C_Phi(ell;k,M).
- `FourierJacobi.constantTerm` (projection): The constant term is evaluation at degree zero, with its coefficient sheaf and stabilizer invariance retained.
- `FourierJacobi.coefficient_naturality` (functoriality): An R-linear coefficient map M to N commutes with the global expansion and with each coefficient evaluation. Its proof obligation is the separate coefficient-naturality node below.

**Unit tests.**

- `FourierJacobi.global_zero` (degenerate): The zero section maps to the zero invariant family.
- `FourierJacobi.global_local` (compatibility): Extending the global family to sigma-dual by zero gives the local expansion for that cone.
- `FourierJacobi.no_averaging` (non-example): For a trivial action of the cyclic group of order p on F_p, the invariant submodule is all of F_p. A construction that multiplies a section by the group sum, or divides by p, does not give this invariant-section identification.

**Acceptance.**

- The same global section gives the same cusp-label family through either of two cones.
- Over coefficients of characteristic p, a stabilizer of order divisible by p causes no undefined averaging factor.

**Used by.**

- B5/constant-term-restriction: Its degree-zero coefficient determines the boundary restriction.
- B5/coefficient-recognition: Provides a natural map on the coefficient-module exact sequence.

**Depends on.** this roadmap: `B5/cone-compatibility`, `B5/fj-coefficient-module`; stages of other roadmaps: `ShimuraCompactifications:C1`, `ShimuraCompactifications:C4`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/FourierJacobi`, namespace `FourierJacobi`.

**Sources.**

- [LanPEL], 7.1.2.6-7.1.2.8 and preceding argument: “full group” — The full-group invariance is a separate argument from the cone-support comparison.

#### Refinement invariance of the expansion

`AutomorphicBundles:B5/fj-refinement` · theorem · packet B5

For a compatible smooth fan refinement pi:X_SigmaPrime to X_Sigma, pullback of sections of omega_tor^k tensor_R M commutes with FJ_Phi under the canonical cusp-label identifications. Using B3's section comparison and a common refinement gives a canonical identification independent of the chosen fan, not literal equality of compactifications.

**Hypotheses.**

- Only the specified good-prime PEL setting is included.
- The section-comparison input must apply to M, including its torsion; degree-zero structure-sheaf pushforward without coefficient compatibility is not sufficient.

**Proof.**

1. Import the same-family pullback and common-refinement morphisms from C3 and the Hodge-section comparison from B3.
2. Pullback to each formal chart commutes with the restriction and Hodge identification used by local-fj-expansion; therefore every coefficient is preserved.
3. Apply global-fj-expansion and common refinements to obtain the cocycle-compatible identification. For B3's coefficient reduction, use the finite-projective direct-summand argument, not an unsupported filtered union of free submodules; see E6813.

**Acceptance.**

- Identity refinement induces the identity on every coefficient.
- Two successive refinements give the same comparison as their composite.
- Check M = R/p^2 rather than establishing only the characteristic-zero case.

**Depends on.** this roadmap: `B5/global-fj-expansion`; stages of this roadmap: `AutomorphicBundles:B3` (answered below); stages of other roadmaps: `ShimuraCompactifications:C3`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/FourierJacobi`, namespace `FourierJacobi`.

**Sources.**

- [LanPEL], 7.1.2.9 and proof, using 7.1.1.4-7.1.1.5: “independent” — Keeps the coefficient-sensitive section comparison as an explicit supplier, not a consequence of the coefficient-free statement.
- [Stacks00NX], 00NX, equivalence of finite projective and direct summand of finite free: “direct summand of a finite free” — Repairs only the projective-module reduction, not the toric higher-direct-image theorem.

> **Assembly note: cross-part references.**
> - `AutomorphicBundles:B3` is answered by `B3/refinement-canonical-extension`, `B3/fan-independent-sections` on the characteristic-zero overlap: these give f*V^can_Σ ≃ V^can_Σ′ and the fan-independence of H⁰ over a field; the comparison for an arbitrary coefficient module M, torsion included, is not planned there. Residual: R2 (coefficient-sensitive refinement and boundary transport (B3)); see the gap “Integral coefficient interfaces that B5 needs from B2–B4”.

#### Boundary restriction from the constant term

`AutomorphicBundles:B5/constant-term-restriction` · theorem · planet “Boundary constant term” · packet B5

For a stratum represented by a cone in the positive part P_Phi-plus, restriction of f to that stratum is obtained from the degree-zero coefficient of FJ_Phi(f). Nonzero degrees in P_Phi-dual lie in the stratum ideal. Descent of this constant term to the lower-dimensional moduli object also uses full Gamma_Phi invariance and the quotient M_Phi/Gamma_Phi = M_Z; the finite cover M_Phi is not identified with M_Z before descent.

**Hypotheses.**

- The positive-cone and stratum-ideal hypotheses of Lan 7.1.2.11-7.1.2.13.
- Retain the determinant-Hodge coefficient and all indicated pullbacks; the claim is not asserted for every Levi representation.

**Proof.**

1. Import the character-graded description of the stratum ideal from C0/C4.
2. Use the positivity duality argument of 7.1.2.11-7.1.2.12: a nonzero degree in the global dual cone pairs strictly positively with the positive cone, so its graded piece lies in that ideal.
3. Reduce the completed section modulo the stratum ideal; only degree zero survives.
4. Apply full stabilizer invariance from global-fj-expansion and the actual quotient of the finite cover to descend the constant term. This is the extra condition highlighted by the published erratum.

**Acceptance.**

- On a Tate chart, restriction to q=0 is the constant coefficient.
- At a higher-dimensional boundary the constant coefficient can itself be a section varying on a lower-dimensional moduli object.
- Do not equate vanishing of one constant term with global cuspidality.

**Depends on.** this roadmap: `B5/global-fj-expansion`; stages of other roadmaps: `ShimuraCompactifications:C0`, `ShimuraCompactifications:C1`, `ShimuraCompactifications:C4`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/Boundary`, namespace `FourierJacobi`.

**Sources.**

- [LanPEL], 7.1.2.10-7.1.2.13 and proofs: “constant term” — Separates positivity, reduction modulo the stratum ideal, and descent along the cusp-label quotient.
- [LanErrata], Item 77: “also invariant” — This is a known published correction, not a new source error discovered by this worker.

**The two coefficient rows.** Fix the finite collection I of cusp labels and abbreviate F(M) = AF(k,M) and G(M) = ∏_{i∈I} FJE_{Φ_i}(k,M), each factor being the full-stabilizer fixed submodule of a product over character degrees. These abbreviations name the geometric constructions above; they are not replacement carriers whose fields assume the expansion principle. The next three nodes make F and G left exact functors of M and FJ a natural transformation between them; nothing in them asserts right exactness, a base-change isomorphism AF(k,R) ⊗_R M ≅ AF(k,M), or a commutation of the infinite coefficient products with filtered colimits. The two flatness tests are complementary: the coefficient sequence ℤ →² ℤ → ℤ/2 stays left exact on a flat rank-one chart over ℤ, while on Spec 𝔽_p over ℤ the invertible sheaf turns ℤ →^p ℤ into zero, so local freeness over O_X without flatness over R does not suffice. For invariants, a generator of C_p acting on 𝔽_p² by (a,b) ↦ (a+b,b) makes the second-coordinate quotient zero on invariants, so only left exactness of invariants, proved by unique lifts and without averaging, is used.

#### Naturality in the coefficient module

`AutomorphicBundles:B5/coefficient-naturality` · lemma · packet B5

Fix the actual toroidal model, weight and finite collection I of cusp labels. Write F(M) = AF(k,M) and G(M) = product over i in I of FJE_Phi_i(k,M). For every R-linear map a:M to N, the constructed coefficient maps satisfy G(a) composed with FJ_I,M = FJ_I,N composed with F(a). Thus the Fourier-Jacobi maps form a natural transformation between the actual coefficient functors. This is the coefficient_naturality API of global-fj-expansion, now a separate proof node because it is used in the exact-row arguments.

**Hypotheses.**

- Use the geometric maps constructed in local-fj-expansion and global-fj-expansion, not unrelated maps chosen to make a square commute.
- The cusp stabilizers act R-linearly and the coefficient maps intertwine the actions.

**Proof.**

1. Tensor the actual sheaf with a and restrict to each formal cusp chart. Functoriality of completion and restriction gives a commutative square of completed sections; no exactness of completion on arbitrary modules is needed for this functoriality statement.
2. The Hodge identification and each homogeneous coefficient projection commute with the induced map. Check this on the trivializing charts, then descend using the actual character-line transports.
3. Pass to full-stabilizer fixed submodules and take the product over I. Degreewise extensionality gives the asserted equality of R-linear maps.

**Acceptance.**

- Identity and composite coefficient maps give the same square as the corresponding functor laws.
- For the quotient R to R/p the square concerns actual coefficients, not an asserted isomorphism AF(k,R) tensor R/p = AF(k,R/p).
- An R-linear isomorphism of coefficient modules transports injectivity of FJ_I through this square.

**Depends on.** this roadmap: `B5/global-fj-expansion`, `B5/local-fj-expansion`, `B5/fj-coefficient-module`; stages of other roadmaps: `AdicSpacesPartII:F0`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/FourierJacobi`, namespace `FourierJacobi`.

**Sources.**

- [LanPEL], The geometric composition in 7.1.2.3 and the diagram in 7.1.2.14: “with exact rows.” — Makes the naturality used by the source diagram a named construction-dependent lemma. The excerpt is literal; the stated coefficient hypotheses and corrected reduction are a source-faithful derived argument, not quoted as a verbatim theorem.

#### Left exactness of Hodge-section coefficient change

`AutomorphicBundles:B5/coefficient-sequence-exact` · lemma · packet B5

For a short exact sequence 0 to N to M to Q to 0 of R-modules, the actual coefficient maps give an exact sequence 0 to AF(k,N) to AF(k,M) to AF(k,Q). No surjectivity of the last map is asserted. In particular, coefficient inclusions induce injections of Hodge sections.

**Hypotheses.**

- The toroidal model X is flat over R and omega_tor^k is locally free over O_X, as supplied by early C5 and B3/B4.
- Sections and tensor products are taken on the actual algebraic stack or an equivalent descent presentation, not its coarse space.

**Proof.**

1. On a flat atlas for X, O_X is flat over R, and a locally free O_X-module is flat over R. Apply the generic flat-tensor theorem from SF.0 to omega_tor^k and the coefficient sequence.
2. Descend this exact sequence of quasi-coherent sheaves using SF.1; exactness is checked on the flat atlas.
3. Apply left exactness of global sections. This proves both injectivity of the first map and equality of its image with the kernel of the second. H^1 need not vanish and the final section map need not be onto.

**Acceptance.**

- N=M and Q=0 recovers the identity inclusion.
- For the flat affine rank-one chart over Z, the coefficient sequence Z --2--> Z to Z/2 remains left exact.
- Dropping R-flatness is invalid: on Spec F_p over Z the locally free O_X-module O_X turns Z --p--> Z into the zero map. Local freeness over O_X alone is insufficient.

**Depends on.** stages of this roadmap: `AutomorphicBundles:B3`, `AutomorphicBundles:B4` (answered below); stages of other roadmaps: `ShimuraCompactifications:C5`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/ExpansionPrinciple`, namespace `FourierJacobi`.

**Sources.**

- [LanPEL], First paragraph of the proof of 7.1.2.14, printed p. 539: “left exact because they are defined by taking global sections of sheaves.” — Supplies the missing explicit flat-tensor justification before invoking left exactness of sections; it does not replace AF by a scalar tensor product of global sections. The excerpt is literal; the stated coefficient hypotheses and corrected reduction are a source-faithful derived argument, not quoted as a verbatim theorem.

> **Assembly note: cross-part references.**
> - `AutomorphicBundles:B3` is answered exactly by `B3/canonical-and-subcanonical-extensions`: local freeness of ω_tor^k over O_X (C5 clause for the good-prime PEL model).
> - `AutomorphicBundles:B4` is answered by `B4/classical-forms` on the characteristic-zero overlap: B4 defines the section spaces over a field; AF(k,M) for an R-module M is not planned there. Residual: R1 (the integral section functor (B4)); see the gap “Integral coefficient interfaces that B5 needs from B2–B4”.

#### Left exactness of invariant coefficient families

`AutomorphicBundles:B5/fj-target-left-exact` · lemma · packet B5

For the fixed finite collection I and G(M) = product over i in I of FJE_Phi_i(k,M), every short exact coefficient sequence 0 to N to M to Q to 0 induces a left exact sequence 0 to G(N) to G(M) to G(Q). This includes infinite products over character degrees and full cusp-stabilizer invariants. It asserts no surjectivity at G(Q) and no commutation with filtered colimits.

**Hypotheses.**

- Each C_Phi is flat over R and each character-Hodge coefficient sheaf Psi_Phi(ell) tensor L_Phi^k is invertible on C_Phi. Obtain these geometric facts from C4/early C5.
- The full stabilizer actions are R-linear, preserve the transported coefficient sequence, and are the same actions as in global-fj-expansion. The stabilizer need not be finite or have invertible order.

**Proof.**

1. Apply SF.0's flat-tensor and section left-exactness results, with SF.1 descent, to every actual coefficient sheaf on C_Phi. Thus each first coefficient map is injective and each coefficient kernel has the required preimage.
2. Take products over degrees. A family in the kernel lifts componentwise; the lift is unique because the first product map is injective.
3. If the original family is invariant, every translate of this lift has the same image by equivariance. Uniqueness makes the lift invariant. This proves exactness after full stabilizer invariants without a group average.
4. Take the product over I. In particular an inclusion N into M induces an injection G(N) into G(M), which is the only property of G required for passage to arbitrary coefficients.

**Acceptance.**

- A trivial C_p-action on F_p has its entire module as invariants, even though averaging by p is undefined.
- For the unipotent C_p-action on F_p^2 with generator (a,b) sent to (a+b,b), the equivariant sequence 0 to F_p to F_p^2 to F_p to 0 is exact, but the map on invariants to the final F_p is zero. This rejects a false right-exactness claim.
- Infinite degree products are allowed here, but their interchange with a filtered union is not inferred.

**Depends on.** this roadmap: `B5/fj-coefficient-module`, `B5/global-fj-expansion`; stages of other roadmaps: `ShimuraCompactifications:C1`, `ShimuraCompactifications:C4`, `ShimuraCompactifications:C5`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/ExpansionPrinciple`, namespace `FourierJacobi`.

**Sources.**

- [LanPEL], 7.1.2.14, first paragraph and exact-row diagram on printed p. 539: “left exact because they are defined by taking global sections of sheaves.” — Expands the coefficient-family left-exactness input into flatness, products and unique invariant lifts; the proof does not assume exact invariants. The excerpt is literal; the stated coefficient hypotheses and corrected reduction are a source-faithful derived argument, not quoted as a verbatim theorem.

#### The prime-quotient coefficient case

`AutomorphicBundles:B5/fj-injectivity-cyclic` · lemma · packet B5

Let p be a prime ideal of the indicated field or Dedekind base R, including p=0, and put S=R/p. Suppose the base-changed chosen strata jointly meet every irreducible component of X_S and the actual completed-chart coefficient comparisons are compatible with this base change. Then the joint Fourier-Jacobi map on AF(k,S) is injective. For p=0 this uses the reduced total model; for p nonzero it uses the reduced residue-field model. Fiberwise detection is supplied by the precise geometric request below; the neat-level route is not silently asserted at non-neat level.

**Hypotheses.**

- The early-C5 good-prime model is smooth over the regular base R; hence X and each residue-field model used here are reduced and locally Noetherian, with locally free pulled-back Hodge line.
- F0 still supplies separated homogeneous coefficient extraction and identification with completion of the actual Hodge sheaf; SF.1 supplies the passage through a flat atlas. Local adic separation of a finite stalk at a proper ideal is already a pinned Mathlib theorem, and ordinary coherent-section detection near a closed subset is already a precise F0 node.
- Use AF(k,R/p) = Gamma(X_S,omega_S^k) through the closed-base-change sheaf identification. Do not replace this by AF(k,R) tensor_R S without a base-change theorem.

**Proof.**

1. For the source’s total-component hypothesis at neat level, import ShimuraCompactifications:C5/neat-strata-detect-geometric-components and its exact good-prime, regular-base, neat-level and fan/no-self-intersection hypotheses. Its prerequisite chain identifies the selected stratum components Z_a as fiberwise-dense opens of smooth proper relative boundary intersections W_a, then uses the finite etale Stein factor to obtain detection on every geometric fiber. This is an existing planned supplier node, not a second B5 theorem or an implemented result. Total-space density alone does not suffice. At non-neat level the actual branch or level-change construction and its fiberwise coverage/descent remain a recorded gap.
2. Before comparing completions, compare every finite thickening of the actual chart. For its R-algebra A, boundary ideal I, and Hodge module P, right exactness gives (P/I^(n+1)P) tensor_R S = P_S/I_S^(n+1)P_S. Construct this as a natural isomorphism compatible with the transition maps and chart transports. Then take the inverse limit of these identified systems. This does not commute tensoring with an arbitrary inverse limit. F0/C5 still have to identify the actual completed coefficient-sheaf maps with this system.
3. Zero Fourier-Jacobi family gives zero completed Hodge section along each chosen base-changed stratum by local-fj-expansion and separatedness of its coefficient map.
4. At a chosen stratum point use Ideal.iInf_pow_smul_eq_bot_of_isLocalRing for the finite Hodge stalk over the Noetherian local ring and its proper stratum ideal. Equivalently IsHausdorff.of_isLocalRing makes the canonical completion map injective by AdicCompletion.of_injective. This is a direct baseline leaf; no new local Krull-intersection theorem is requested. The proper-ideal hypothesis cannot be omitted: completion at the unit ideal kills a nonzero module.
5. On a locally Noetherian scheme chart, apply the already planned AdicSpacesPartII:F0/completion-detects-near-closed, part (i), to the actual coherent Hodge sheaf: zero formal restriction means vanishing on an open neighborhood of the selected closed subset. For a locally closed stratum first pass to the chart open in which it is closed. Since the chosen strata meet every irreducible component of the reduced model, the resulting zero open is dense in each component. On trivializing affine charts a regular function zero at all generic points is zero by reducedness. The scheme input does not assert a stack theorem or identify the Mumford coefficient projections.
6. For the algebraic stack, carry this zero-section and density argument through the actual flat atlas and descend. Do not assume an arbitrary affine atlas chart itself meets every selected stratum; use the open zero locus and its componentwise density. The scheme/algebraic-space Stein theorem is not automatically a stack theorem.

**Acceptance.**

- A nonempty stratum on a smooth connected component over a field detects a line-bundle section.
- Two disjoint smooth curves with all selected strata on only one component violate the detection hypothesis and admit an undetected section.
- For a general smooth R-scheme, total-space detection alone need not imply residue-fiber detection: Spec R and its open subscheme Spec R[1/p] provide the elementary warning. This example is not asserted to be a PEL boundary stratum or a counterexample to Lan's theorem.
- For X=P1_R with its two disjoint relative boundary sections, each whole boundary section meets the unique component of every geometric fiber. Removing the closed fiber from one section destroys fiberwise density although that open still meets the total component. This distinguishes the needed relative-stratum hypothesis from mere total-space density.
- At a Tate chart with A=R[q], I=(q), P=A and S=R/p, every finite-thickening comparison sends the class of q^j to the same class for 0<=j<=n. It makes no assertion that tensor commutes with all inverse limits.
- For a nonzero module over F₂, completion at the unit ideal is zero and its canonical map is not injective. This rejects omitting the proper-ideal condition from the local finite-stalk argument.

**Depends on.** this roadmap: `B5/local-fj-expansion`, `B5/global-fj-expansion`; other roadmaps: `AdicSpacesPartII:F0/completion-detects-near-closed`, `ShimuraCompactifications:C5/neat-strata-detect-geometric-components`; stages of other roadmaps: `ShimuraCompactifications:C5`, `AdicSpacesPartII:F0`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`; libraries: `mathlib:Ideal.iInf_pow_smul_eq_bot_of_isLocalRing`, `mathlib:IsHausdorff.of_isLocalRing`, `mathlib:AdicCompletion.of_injective`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/ExpansionPrinciple`, namespace `FourierJacobi`.

**Sources.**

- [LanPEL], 7.1.2.14(1), p. 539; 6.4.1.1(2)-(5), p. 520; 6.4.1.2, p. 523, all in the inspected author revision: “no self-intersections” — The neat-level relative boundary description motivates the requested smooth-closure route. Constant fiber component counts alone do not prove that the chosen strata meet them. Neither the full non-neat implication nor arbitrary tensor/completion compatibility is claimed to follow from this excerpt.
- [Stacks00IP], 00IP, Lemma 10.51.4: “Krull's intersection theorem” — Only local separatedness for a finite stalk over a Noetherian local ring is imported. This does not supply the Shimura chart or fiber-detection statement.
- [Stacks0A18], 0A18, Theorem 76.36.4 and Lemma 76.36.9 (also tag 0E0D): “connected geometric fibres” — Provides the generic algebraic-space Stein factor. The clopen-image argument and its application to proper smooth stratum closures are the proposed owner proof, spelled out in the reader; the factor is over the arithmetic base, not a Shimura minimal compactification.
- [EGA-I], Chapter I, Proposition 10.8.11 and proof, printed p. 197 (physical PDF 196): “sections nulles dans un voisinage” — For a coherent sheaf on a locally Noetherian scheme, the kernel of formal restriction consists of sections vanishing on a neighborhood of the closed subset. The existing F0 node is used in this scheme scope only.

**Residue-fibre component detection.** Lan’s total-component hypothesis (the chosen strata meet every irreducible component of X) and the fibrewise hypothesis that the prime-quotient case uses (they meet every irreducible component of X_{R/𝔭}) are different. At neat level the passage from the first to the second is the imported node `ShimuraCompactifications:C5/neat-strata-detect-geometric-components` (planned in the ShimuraCompactifications C0 packet), with its prerequisite chain `C5/neat-boundary-intersection-smooth`, `C5/neat-boundary-open-fiberwise-dense`, `C5/neat-stratum-closure-component`, `C5/neat-stratum-closure-proper` and `SchemeAndStackFoundations:SF.2`; its regular-base, good-prime, neat and fan/no-self-intersection hypotheses are kept. Its proof route, which the owners implement once, is the following.

*Smooth closures (owner SF.1, with SF.0 and SF.2).* Let B = Spec R with R regular Noetherian, X → B smooth and proper, finitely many closed immersions W_a → X with each W_a → B smooth and proper, and Z_a ⊆ W_a open and dense in every geometric fibre of W_a → B. If the Z_a meet every irreducible component of X, their base changes meet every irreducible component of every geometric fibre. Take the Stein factorization X →^h E → B: h is proper and surjective with geometrically connected fibres and, X being smooth, E → B is finite étale (Stacks, Theorem 76.36.4 and Lemmas 76.36.1, 76.36.9). X and E are regular, so their connected components are their irreducible components, open and closed, and h identifies the two sets of components. Each W_a → E is proper and also smooth (the graph W_a → W_a ×_B E is an open immersion, being a section of an étale separated morphism), so its image is open and closed; these images meet every component of E, hence cover E. For a geometric point b, the components of X_b are the nonempty fibres X_e, e ∈ E_b; some W_{a,e} is nonempty and open and closed in W_{a,b}, and fibrewise density gives a point of Z_{a,b} on X_e. The factor E is over the arithmetic base; it is not the minimal compactification, and the argument uses only the existing morphism h and its geometric fibres.

*Relative coordinates and the labelled strata (owner early C5).* Let X → B be smooth Noetherian with a finite relative strict-normal-crossings boundary (étale locally the components through a point are distinct relative coordinates of a smooth chart). For a set J of components let D_J be their intersection and W a connected component of D_J; then W → B is smooth (and proper when X is), and W° = W ∖ ⋃_{i∉J} D_i is dense in every geometric fibre, since on a chart each further D_i adds an independent relative equation and cuts a proper divisor of the fibre. For a component Z_a of a neat labelled stratum with cone σ of dimension d, its closure W_a is the corresponding component of a d-fold intersection, and Z_a = W_a°: a point of W_a° lies in the closure of the σ-stratum with exactly d boundary branches, its label τ has σ as a face with dim τ = dim σ, hence τ = σ in the common labelled chart; and W_a° is connected and lies in the stratum, whose components are open and closed. This uses Lan’s Theorem 6.4.1.1(2), (3), (5) and Proposition 6.3.1.6(1) in the author revision. Stacks 0CBP is an absolute normal-crossings lemma and does not replace the relative hypothesis.

*Tests.* Over a DVR with uniformizer π, the sections t = 0 and t = π of ℙ¹_R are each smooth and proper and disjoint on the generic fibre, but (t, t − π) = (t, π): removing one from the other leaves Spec R[1/π], dense in the total section with empty closed fibre, so individually smooth boundary components without the relative-coordinate condition do not suffice. Replacing a boundary section of ℙ¹_R by its open over R[1/π] still meets the total component and misses the closed fibre; a choice confined to one component of a disjoint union of two curves fails the total hypothesis; and over a connected finite étale cover with several geometric points in a fibre, all those points must be covered through clopen images. None of these is a counterexample to Lan’s theorem.

*Non-neat level.* A neat cover does not automatically make the inverse images of a detecting collection meet every component of the cover, and a toroidal level map need not be étale everywhere; the branch normalization or stack/level-change construction with its fibrewise coverage remains open (gap *Residue-fiber detection after coefficient reduction*).

**Finite thickenings before completions.** On an affine chart with R-algebra A, stratum ideal I (after removing the other closure strata, as in Lan 6.4.1.1(5)) and finite locally free Hodge module P, put S = R/𝔭, A_S = A ⊗_R S, P_S = P ⊗_R S and I_S the image ideal. For every n ≥ 0 right exactness of ⊗_R S applied to I^{n+1}P → P → P/I^{n+1}P → 0 gives (P/I^{n+1}P) ⊗_R S ≅ P_S/I_S^{n+1}P_S, since the image of I^{n+1}P is I_S^{n+1}P_S; no flatness of S is needed. These isomorphisms commute with the transitions in n, chart localization and the Hodge and coefficient transports, and the comparison of completions is defined from the identified inverse systems. It neither proves nor uses (lim_n P/I^{n+1}P) ⊗_R S ≅ lim_n((P/I^{n+1}P) ⊗_R S). On the Tate chart A = R[q], I = (q), P = A, each class q^j, 0 ≤ j ≤ n, goes to the same class over R/𝔭.

#### Propagation through a coefficient extension

`AutomorphicBundles:B5/fj-injectivity-extension` · lemma · packet B5

For a short exact coefficient sequence 0 to N to M to Q to 0 on the fixed actual PEL model, injectivity of the joint Fourier-Jacobi maps on AF(k,N) and AF(k,Q) implies injectivity on AF(k,M). The statement applies to nonsplit extensions, with no flatness assumption on N, M or Q beyond the geometric flatness already established for the coefficient functors.

**Hypotheses.**

- Use the exact section row, the monic first coefficient-family map, and the naturality squares supplied by the preceding nodes.
- Do not add a surjectivity assumption on AF(k,M) to AF(k,Q), or invert a coefficient characteristic or a stabilizer order.

**Proof.**

1. Construct the two ShortComplex (ModuleCat R) objects from the AF and G rows of the actual coefficient sequence. The zero composites follow from functoriality and the original coefficient sequence.
2. Use coefficient-naturality to construct their morphism with vertical maps FJ_N, FJ_M and FJ_Q.
3. Apply the existing CategoryTheory.ShortComplex.mono_τ₂_of_exact_of_mono theorem. Its source exactness and both first-row monomorphisms are coefficient-sequence-exact and fj-target-left-exact; its outer monomorphisms are the two inductive injectivity hypotheses.
4. In element form: a section with zero middle expansion maps to zero in AF(k,Q), lifts uniquely to AF(k,N), and the injective first G map forces that lift to have zero expansion. This explains the imported theorem's exact hypotheses rather than defining a new generic diagram chase.

**Acceptance.**

- The nonsplit sequence 0 to Z/2 to Z/4 to Z/2 to 0 tests the nilpotent-torsion step.
- The argument still applies when the last section-row map is not surjective.
- With N=0 or Q=0 it agrees with naturality under the induced coefficient isomorphism.

**Depends on.** this roadmap: `B5/coefficient-naturality`, `B5/coefficient-sequence-exact`, `B5/fj-target-left-exact`; libraries: `mathlib:CategoryTheory.ShortComplex.mono_τ₂_of_exact_of_mono`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/ExpansionPrinciple`, namespace `FourierJacobi`.

**Sources.**

- [LanPEL], The left-exact coefficient functors in the proof of 7.1.2.14: “left exact because they are defined by taking global sections of sheaves.” — This is a devissage refinement of the source proof, using an existing library diagram lemma; it is not attributed to a separately numbered theorem in Lan. The excerpt is literal; the stated coefficient hypotheses and corrected reduction are a source-faithful derived argument, not quoted as a verbatim theorem.

#### Finite coefficients by a prime filtration

`AutomorphicBundles:B5/fj-injectivity-finite` · lemma · packet B5

Assume the geometric hypotheses of fj-injectivity-cyclic for every prime quotient R/p. Then the joint Fourier-Jacobi map is injective on AF(k,M) for every finitely generated R-module M. A finite prime filtration and the coefficient-extension lemma, rather than a free-module decomposition or completion faithfulness on each nonreduced thickening, give the reduction.

**Hypotheses.**

- R is the indicated field or Dedekind domain, hence Noetherian. No principal-ideal-domain or semilocal assumption is made.
- Use the existing Mathlib induction for any commutative Noetherian R and Module.Finite R M. Its prime case is a finite module N together with a linear equivalence to R/p, so preserve that form across module universes. No complete-local coefficient category or additional R03.3 scope theorem is required.

**Proof.**

1. Apply the pinned IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime to the property that the constructed joint Fourier-Jacobi map on AF(k,M) is injective. Its proof uses exists_relSeries_isQuotientEquivQuotientPrime, whose steps contain actual submodule inclusions and linear equivalences of successive quotients with R/p. Do not redeclare a generic prime filtration or route this step through all of R03.3.
2. Subsingleton case: tensoring the actual Hodge coefficient sheaf with a zero module gives a zero sheaf, hence a zero section module and an injective expansion map. Transport to a subsingleton coefficient carrier through its zero-module identification.
3. Prime case: for an R-linear equivalence e:N to R/p, use fj-injectivity-cyclic for R/p with all its geometric component and formal-chart hypotheses. Functoriality sends e and its inverse to inverse coefficient maps on AF and the expansion target; coefficient-naturality therefore transports injectivity to N. No global-section tensor/base-change isomorphism is asserted.
4. Extension case: the library supplies finite coefficient modules, linear maps f and g, injectivity of f, surjectivity of g and exactness of the original coefficient sequence. Apply fj-injectivity-extension using the two outer induction hypotheses. Surjectivity of the original coefficient quotient g is not surjectivity of AF(g); no splitting or averaging enters.
5. The induction gives finite-coefficient injectivity. Over a Dedekind domain nonzero primes are maximal and use residue-field models; the prime zero uses R itself. Repeated prime factors, R/p^n and finite nonfree projective modules are included. The existing filtration is not a composition series and does not imply finite length.

**Acceptance.**

- The filtration of Z/4 by 0, 2(Z/4), Z/4 has two Z/2 factors and must be accepted although Z/4 is nonreduced as a ring.
- A nonprincipal invertible ideal over a Dedekind ring is covered as a finite module without asserting that it is free.
- The zero module has the empty filtration and an injective expansion map.

**Depends on.** this roadmap: `B5/fj-injectivity-cyclic`, `B5/fj-injectivity-extension`, `B5/coefficient-naturality`; libraries: `mathlib:IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime`, `mathlib:IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/ExpansionPrinciple`, namespace `FourierJacobi`.

**Sources.**

- [Stacks00L0], 00L0, Lemma 10.62.1: “filtration by” — Supplies only the generic finite-module filtration; the Fourier-Jacobi induction is this packet's application.
- [LanPEL], 7.1.1.4 and the reduction in 7.1.2.14(1): “the same reduction steps” — Alternative coefficient reduction that keeps the original theorem's geometric component obligation explicit. The excerpt is literal; the stated coefficient hypotheses and corrected reduction are a source-faithful derived argument, not quoted as a verbatim theorem.
- [MathlibPrimeFiltration], IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime, with its preceding RelSeries existence theorem, at the recorded pinned commit: “it is stable by short exact sequences” — The already implemented generic induction principle. Only its instantiation with the constructed geometric coefficient functors is a B5 proof obligation; the prime case retains an explicit linear equivalence and the extension case retains exact coefficient maps.

#### Joint injectivity at a component-detecting collection of cusps

`AutomorphicBundles:B5/fj-injectivity` · theorem · planet “Expansion principle” · packet B5

In the setting of Lan 7.1.2.14, choose a finite collection of nonempty strata whose union meets every irreducible component of the toroidal model. The product of their Fourier-Jacobi morphisms on AF(k,M) is injective for every R-module M. The source hypothesis is preserved: early C5 must establish its compatibility with the prime-quotient component-detection hypotheses used below. The specified neat-level route does not by itself establish the full non-neat source theorem, which remains an open target.

**Hypotheses.**

- The source's smooth proper good-prime PEL model, k nonnegative, and M an arbitrary R-module.
- The finite collection is component-detecting in the source's sense. No claim is made that any chosen single cusp detects all components.
- Use the actual qcqs stack section/filtered-colimit comparison. No colimit theorem for the infinite Fourier-Jacobi coefficient product is assumed.

**Proof.**

1. Obtain from early C5 the residue-fiber component-detection input of fj-injectivity-cyclic, using the smooth-closure/Stein route where its precise neat-level hypotheses hold, and hence the finite-module theorem fj-injectivity-finite. The non-neat transport and actual base-changed formal charts remain separate geometric leaves. The Stein factor over Spec R is not the late integral minimal compactification.
2. Write M as the directed union of its finitely generated R-submodules N. Tensoring the fixed Hodge sheaf commutes with this colimit; global sections commute by the actual qcqs stack theorem (Stacks 0GQZ with G=O_X, supplied by SF.1/B4). Thus a given f in AF(k,M) comes from some f_N in AF(k,N).
3. If FJ_M(f)=0, coefficient-naturality gives G(N to M)(FJ_N(f_N))=0. The map G(N) to G(M) is injective by fj-target-left-exact applied to 0 to N to M to M/N to 0. Therefore FJ_N(f_N)=0.
4. Apply the finite-module theorem to conclude f_N=0 and hence f=0. No equality colim_N G(N)=G(M) and no reduction of M to a union of free submodules occurs.

**Acceptance.**

- On the disjoint union of two proper connected curves, expansion at a cusp on only one component does not detect a section supported on the other.
- The nonsplit prime-filtration step covers R/p^2; geometric pointwise vanishing alone does not.
- For M=R[1/p]/R, each finite set of elements lies in a finitely generated torsion submodule, so the same argument applies.
- Product/colimit warning: over a field, for M the direct sum of countably many copies of the field, the sequence of distinct basis vectors in the product M^N does not lie in N^N for any finite-dimensional submodule N. This rules out the unused interchange of these two operations.

**Depends on.** this roadmap: `B5/fj-injectivity-finite`, `B5/coefficient-naturality`, `B5/fj-target-left-exact`; stages of this roadmap: `AutomorphicBundles:B4` (answered below); stages of other roadmaps: `ShimuraCompactifications:C5`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/ExpansionPrinciple`, namespace `FourierJacobi`.

**Sources.**

- [LanPEL], 7.1.2.14(1), proof, and the module reduction in 7.1.1.4: “injective” — Retains the source endpoint but replaces the unexpanded arbitrary-coefficient step by prime filtration and a single finite-generation lift. Geometric component transport is not counted as closed.
- [Stacks0GQZ], 0GQZ, Lemma 103.13.5, G=O_X: “finite presentation” — Supplies the section/filtered-colimit comparison on a qcqs stack, not an infinite coefficient-product colimit theorem.

> **Assembly note: cross-part references.**
> - `AutomorphicBundles:B4` is answered by `B4/classical-forms` on the characteristic-zero overlap: as for coefficient-sequence-exact; the qcqs section/filtered-colimit step is part of the residual. Residual: R1 (the integral section functor (B4)); see the gap “Integral coefficient interfaces that B5 needs from B2–B4”.

#### Recognition of a coefficient submodule from expansions

`AutomorphicBundles:B5/coefficient-recognition` · theorem · packet B5

Let M1 be an R-submodule of M and keep the detecting strata of fj-injectivity. If the expansion of f in AF(k,M) at every chosen cusp lies in the image of the corresponding coefficient-family module with coefficients in M1, then f lies in the image of AF(k,M1). This is an image-membership theorem for actual sections, not an unconditional assertion that global sections commute with every base change.

**Hypotheses.**

- The standing good-prime PEL and component-detection hypotheses.
- Use the geometric coefficient functors and the inclusion M1 into M; membership is in their images, not an informal statement about scalar entries.

**Proof.**

1. Apply coefficient-naturality to the short exact sequence 0 to M1 to M to M/M1 to 0.
2. Use the separately named coefficient-sequence-exact and fj-target-left-exact nodes for the two rows. They check flatness before sections, products and invariants; neither row is claimed right exact.
3. The image of f in AF(k,M/M1) has zero expansion. Apply fj-injectivity for the quotient M/M1, not merely for M. The arbitrary-coefficient devissage is essential when this quotient is not finite or flat.
4. Exactness at AF(k,M) places f in the image of AF(k,M1). The linear-map prototype records only this last diagram chase, not a proof of its geometric premises.

**Acceptance.**

- For M1=M the conclusion is automatic.
- For M1=0 it reduces to joint injectivity.
- For M=R[1/p] and M1=R, the quotient is torsion: injectivity only for torsion-free coefficients is inadequate for this application.

**Depends on.** this roadmap: `B5/fj-injectivity`, `B5/coefficient-naturality`, `B5/coefficient-sequence-exact`, `B5/fj-target-left-exact`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/ExpansionPrinciple`, namespace `FourierJacobi`.

**Sources.**

- [LanPEL], 7.1.2.14(2) and its exact-row diagram: “exact rows” — The decisive injectivity is at the quotient coefficient module; no surjectivity of sections after base change is used.

#### Cuspidality from boundary restrictions

`AutomorphicBundles:B5/cuspidal-boundary-criterion` · theorem · packet B5

On a neat smooth toroidal model with its reduced relative normal-crossings divisor D, for the determinant-Hodge coefficient in this packet, a section belongs to the image of Gamma(X,omega_tor^k(-D) tensor_R M) precisely when its restriction to D is zero. Where the boundary-chart restrictions jointly detect this restriction, the condition is equivalently vanishing of the appropriate constant terms at all proper boundary labels. The exactness and detection assertions must be proved for the chosen M; a single maximal-cusp constant term is not substituted for all boundary restrictions.

**Hypotheses.**

- Neatness, smoothness and the stated relative normal-crossings boundary; use B3's actual subcanonical extension.
- For nonflat M, retain the relative flatness/exactness checks of the boundary sequence.
- No general-coarse-space vector-bundle claim is included.

**Proof.**

1. Use B3's definition of the subcanonical extension and the boundary-ideal exact sequence, checking exactness after tensoring with M.
2. Left exactness of global sections identifies its image with the kernel of restriction to D.
3. Use the C4/C5 chart cover and the constant-term-restriction theorem at every required boundary label to detect zero restriction. Do not infer scheme-theoretic vanishing from checking only geometric points over a nonreduced base.

**Acceptance.**

- On a one-variable formal chart, divisibility by q is equivalent to zero constant coefficient.
- A higher-dimensional boundary coefficient may be a nonzero form on a lower-dimensional boundary even when a scalar constant at a deeper cusp is zero.
- Koecher extension of sections does not force their boundary restriction to vanish.

**Depends on.** this roadmap: `B5/constant-term-restriction`; stages of this roadmap: `AutomorphicBundles:B3`, `AutomorphicBundles:B4` (answered below); stages of other roadmaps: `ShimuraCompactifications:C4`, `ShimuraCompactifications:C5`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/Boundary`, namespace `FourierJacobi`.

**Sources.**

- [LanIntro], 4.2.7, printed p. 50: “cusp forms” — Motivates the canonical/subcanonical section comparison; the boundary exact-sequence proof and coefficient checks are explicit construction obligations, not claimed proved by the overview.

> **Assembly note: cross-part references.**
> - `AutomorphicBundles:B3` is answered exactly by `B3/subcanonical-extension`: the reduced-boundary twist V^can(−D) and its ideal exact sequence (C5 clause for the integral model).
> - `AutomorphicBundles:B4` is answered by `B4/cusp-forms` on the characteristic-zero overlap: cusp forms as the kernel of boundary restriction, over a field; with coefficients in M this is the residual, together with the B5 gap “Coefficient pushforward and boundary exactness”. Residual: R1 (the integral section functor (B4)); see the gap “Integral coefficient interfaces that B5 needs from B2–B4”.

### B5.ii. The geometric Hecke action

The geometric Hecke operator is pull back, identify, trace and normalize: H_g = tr_{p₁} ∘ θ_g ∘ p₂* on Γ(X_K, E(V) ⊗_R M) and T_g = ν(g)H_g (`B5/hecke-section-operator`). The assignment [KgK] ↦ T_g is a ring homomorphism from Tau Ceti’s existing integral Hecke ring, by the double-coset (Mackey) decomposition of composed correspondences (`B5/hecke-convolution`), and at non-neat level the operators are defined on the descent equalizer of a normal neat cover, with no division by the order of the finite quotient (`B5/non-neat-hecke-descent`).

#### Geometric Hecke operators on classical sections

`AutomorphicBundles:B5/hecke-section-operator` · construction · planet “Hecke operators” · packet B5

For the B1–B4 automorphic bundle E(V) on a fixed toroidal model X_K over R, take an admissible prime-to-characteristic element g with K_g=K∩gKg⁻¹ and the correspondence X_K ←p1 X_Kg →p2 X_K. After compatible cone refinement, the B2/B3 equivariant realization supplies θ_g:p2*E(V)→p1*E(V). For every R-module M define H_g=tr_p1 ∘ θ_g ∘ p2* on Γ(X_K,E(V)⊗_R M). Here the trace is the extension of the finite locally free trace through the supplied toric-refinement comparison, not a trace inferred for an arbitrary proper map. Fix a K-bi-invariant multiplicative character ν of the admissible monoid with values in R×, and set T_g=ν(g)H_g. The construction is independent of common refinement and representatives and preserves the subcanonical section module when the boundary ideal transport is supplied.

**Hypotheses.**

- Use actual bundle sections, including coefficients inside the sheaf; Γ(E)⊗M is not substituted.
- p1 is finite locally free on a compatible intermediate model; a further fan refinement can be proper rather than finite. Its coefficient-sensitive pushforward comparison is required.
- θ_g uses the right-translation and isogeny convention; ν is part of the level/weight normalization, not division by every correspondence degree.

**Construction.**

1. Import the correspondence and degree convention from AA.4 and its actual compactified extension from C3.
2. Pull back the canonical bundle and M; use B2/B3 equivariance to identify it with the p1-pullback, retaining its cocycle.
3. On finite-free charts use algebra trace and the projection formula; descend the finite-projective trace from SF.0 and remove refinements using B3/C3. These trace/base-change inputs remain explicit requests.
4. Compose and multiply by ν(g); the boundary ideal comparison proves the same construction for cusp sections.

**API.**

- `ClassicalHecke.operator` (constructor): The R-linear composite ν(g)tr_p1 θ_g p2* on the actual section module.
- `ClassicalHecke.operator_one` (simp): The identity correspondence with ν(1)=1 acts as identity.
- `ClassicalHecke.coefficient_map` (functoriality): An R-linear coefficient map M→N commutes with T_g, by coefficient-compatible pullback, trace and θ_g.
- `ClassicalHecke.refinement` (compatibility): Transport across the B3 section comparison along a common fan refinement intertwines T_g, with identity and composition laws.

**Unit tests.**

- `ClassicalHecke.identity` (degenerate): The identity correspondence acts as identity on canonical and subcanonical sections.
- `ClassicalHecke.weightZeroTrace` (computation): For a finite-free degree-d chart and the trivial bundle, the raw operator on 1 is d, not 1; the normalized value is ν(g)d.
- `ClassicalHecke.modularNormalization` (compatibility): Over C, after the imported modular comparison and correct coset orientation, GL2 det⁻¹-scaled isogeny pull-identify-trace agrees with the existing HeckeRing.GL2.heckeRingHomCharSpace action; at an unramified prime its coefficients have the character-weighted ℓ^(k−1) term.

**Acceptance.**

- H_1 is identity and H_g sends the weight-zero constant 1 to deg(p1); T_g(1)=ν(g)deg(p1).
- For GL2 geometric isogeny pullback on ω^k, ν(g)=det(g)⁻¹ changes det(g)^k j(g,z)⁻k to the analytic det(g)^(k−1) factor. The chosen double-coset orientation must first be compared to the supplier, which may use inverse representatives.
- For a degree-(ℓ+1) good modular correspondence and ν=ℓ⁻¹, the weight-zero value is (ℓ+1)/ℓ. ℓ must be a unit; no extension of this formula to ℓ=p is inferred.

**Used by.**

- B5/hecke-convolution: Produces the basis operators of the existing integral Hecke ring.
- OverconvergentAutomorphicForms:O6: Provides the normalization and cusp-preserving classical operator used to compare the p-adic action.

**Depends on.** stages of this roadmap: `AutomorphicBundles:B2`, `AutomorphicBundles:B3`, `AutomorphicBundles:B4` (answered below); other roadmaps: `AdelicAlgebraicGroups:AA.4/hecke-correspondence`, `AdelicAlgebraicGroups:AA.4/hecke-degree-double-coset`; stages of other roadmaps: `ShimuraCompactifications:C3`, `SchemeAndStackFoundations:SF.0`; libraries: `mathlib:Algebra.trace_algebraMap_of_basis`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/B5`, namespace `AutomorphicBundles`.

**Sources.**

- [LanPEL], 6.4.3.1–6.4.3.4, pp.527–530: “This surjection is proper” — Supplies toroidal translation after refinement, not the missing global coefficient trace.
- [Diamond22], §6.1, weight/level pullback convention, p.24: “These satisfy the usual compatibilities” — Fixes the norm-scaled pullback convention in the Hilbert specialization; finite correspondence trace is a derived extension requiring the listed suppliers.
- [BCGP], §1.8, pp.17–18: “transpose” — The isogeny correspondence convention is transposed relative to Faltings–Chai; comparison must transport it explicitly.

> **Assembly note: cross-part references.**
> - `AutomorphicBundles:B2` is answered by `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B2/coefficient-tensor-hecke`, `B1/principal-hecke-pullback` on the characteristic-zero overlap: E(V) and the Hecke pullback identification θ_g with its cocycle on the open variety, in characteristic zero; finite projective integral W is the residual. Residual: R5 (finite projective integral coefficients and the boundary bundle E0(W) (B2/B3)); see the gap “Integral coefficient interfaces that B5 needs from B2–B4”.
> - `AutomorphicBundles:B3` is answered by `B3/canonical-and-subcanonical-extensions`, `B3/subcanonical-extension`, `B3/fan-independent-sections`, `B3.general/general-boundary-functoriality` on the characteristic-zero overlap: the extensions and the compatibility of section comparisons with refinements and Hecke maps, over a field. Residual: R2 (coefficient-sensitive refinement and boundary transport (B3)); see the gap “Integral coefficient interfaces that B5 needs from B2–B4”.
> - `AutomorphicBundles:B4` is answered by `B4/classical-forms`, `B4/cusp-forms` on the characteristic-zero overlap: the section modules over a field. Residual: R1 (the integral section functor (B4)); see the gap “Integral coefficient interfaces that B5 needs from B2–B4”.

#### Convolution law for the geometric Hecke action

`AutomorphicBundles:B5/hecke-convolution` · theorem · packet B5

With the correspondences, trace/base-change comparisons, θ cocycle and multiplicative normalization of hecke-section-operator, the assignment [KgK]↦T_g extends to a unital ring homomorphism from the existing integral Hecke ring to End_R Γ(X_K,E(V)⊗_R M), and restricts to the subcanonical section module. The multiplication convention is the existing HeckeCosetModule convolution, after an explicit right-coset/inverse-orientation comparison; its integer multiplicities are unchanged.

**Hypotheses.**

- Require the full double-coset fibre-product/Mackey decomposition, not a false Cartesian square for an arbitrary normal finer level.
- Coefficient traces satisfy composition and finite-flat base change; normalization ν is multiplicative and bi-K-invariant.

**Proof.**

1. Import the actual double-coset correspondence calculus from AA.4, rather than constructing another Hecke algebra.
2. Decompose the composed correspondence into the finite double-coset pieces with their multiplicities; apply trace transitivity and base change to each.
3. Use the θ cocycle and multiplicativity of ν to identify the composite with the convolution sum. Compare inverses and order with the pinned analytic action.

**Acceptance.**

- The identity coset maps to identity and a sum maps to the sum of operators.
- In the good GL2 prime case the transported formula recovers the existing analytic convolution action, including its character term.
- A normalization chosen by dividing each coset by its degree need not be a multiplicative character; the construction does not silently permit it.

**Depends on.** this roadmap: `B5/hecke-section-operator`; other roadmaps: `AdelicAlgebraicGroups:AA.4/hecke-cartesian`; stages of other roadmaps: `SchemeAndStackFoundations:SF.0`; libraries: `tauceti:HeckeCosetModule.instRingHeckeRing`, `tauceti:HeckeRing.GL2.heckeRingHomCharSpace`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/B5`, namespace `AutomorphicBundles`.

**Sources.**

- [BCGP], §1.8, Hecke conventions, pp.17–18: “transpose” — Geometric action follows correspondence composition after the stated convention comparison.
- [Diamond22], §6.1, p.24: “These satisfy the usual compatibilities” — A source specialization of the normalized action; the general geometric convolution proof is a derived target with explicit Mackey/trace requests.

#### Hecke action at non-neat level

`AutomorphicBundles:B5/non-neat-hecke-descent` · theorem · packet B5

Let K′◁K be neat and normal with finite Γ=K/K′, and use the actual equivariant canonical or subcanonical bundle on the stack quotient [X_K′/Γ]. Descent identifies its section module with Γ(X_K′,E⊗_R M)^Γ for every allowed R-module M. Define the K-Hecke operators through the refined K_g correspondences and their common neat covers. The resulting operators preserve this descent equalizer, are independent of the chosen neat cover, and agree under the descent identification with the stack pull-identify-trace action.

**Hypotheses.**

- The quotient means the stack with its bundle action; no coarse-space vector bundle descent is assumed.
- No inversion of |Γ| is required for the equalizer. Hecke compatibility uses the refined correspondence and Mackey sum, not restriction of a single K′-double-coset operator.

**Proof.**

1. Use SF.1 effective equivariant descent for the actual sheaves and sections.
2. Construct common neat covers of both correspondence legs with C3; compare operators using trace base change and the double-coset decomposition.
3. Prove the equalizer is stable and changes of neat cover commute; uniqueness of descent gives independence.

**Acceptance.**

- For the trivial action of C_p on F_p, invariants are F_p, while the group sum is zero.
- For the unipotent C_p action on F_p², taking invariants does not preserve the surjection to the second-coordinate quotient. The proof uses only the equalizer, not exactness of invariants.
- Do not assume K′∩K_g=K′∩gK′g⁻¹; AA.4’s Cartesian theorem requires its additional product condition.

**Depends on.** this roadmap: `B5/hecke-section-operator`, `B5/hecke-convolution`; other roadmaps: `AdelicAlgebraicGroups:AA.4/hecke-cartesian`; stages of other roadmaps: `SchemeAndStackFoundations:SF.1`, `ShimuraCompactifications:C3`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/B5`, namespace `AutomorphicBundles`.

**Sources.**

- [Diamond22], §6.1, non-small U and normal fine U′, p.24; §6.2, normal-level invariants argument immediately before Proposition 6.2.1, p.25: “taking invariants” — Descent uses invariants without averaging; the general Hecke comparison is the corresponding stack argument.
- [LanPEL], 7.1.2.6–7.1.2.8, pp.536–537: “full group” — Retains the full stabilizer in Fourier coefficients and compatibility with non-neat descent.

### B5.iii. The modular comparison and vector coefficients

In rank one the Fourier–Jacobi expansion is the Tate q-expansion of AlgebraicModularFormsAndSerreWeights R15.1–R15.2, and over ℂ it is Mathlib’s `UpperHalfPlane.qExpansion` at the same cusp parameter (`B5/modular-expansion-comparison`). For a finite projective Levi representation W the expansion takes values in sections of Ψ(ℓ) ⊗ E0(W) ⊗ M on the abelian torsor, where E0(W) is the boundary bundle of Lan’s *Higher Koecher’s principle*, Proposition 5.6 (`B5/vector-fj-expansion`), and the expansion principle and coefficient recognition extend to it under a fibrewise component hypothesis (`B5/vector-expansion-principle`). For general characteristic-zero data the needed mixed-boundary identity is a conjecture in Milne’s notes (VII, Conjecture 4.1) and is requested from ShimuraCompactifications C3.general as a proved interface.

#### Tate and analytic q-expansion comparison

`AutomorphicBundles:B5/modular-expansion-comparison` · comparison · packet B5

Under B3/B4’s modular specialization and the R15.1 all-weight analytic comparison, the rank-one Fourier–Jacobi expansion is the imported Tate q-expansion, and over C it equals UpperHalfPlane.qExpansion h at the same cusp parameter q=exp(2πiτ/h) and invariant-differential trivialization. At full level n≥3 use Tate(q^n) over Z[1/n,ζ_n][[q]] as in the owner: the Kodaira–Spencer image of the square of the canonical differential is n dq/q. Import the R15.2 all-component integral q-expansion principle and cusp exact sequence rather than asserting new modular theorems. Transport Hecke normalization to the existing analytic action and the owned geometric R15.2 operators.

**Hypotheses.**

- Match the selected cusp, width h>0 in the actual subgroup strict periods, roots of unity and descent data.
- Levels 1 and 2 use the owner’s stack/rigidifying-cover descent. One infinity constant detects cuspidality only in the full modular group case already proved in Mathlib.

**Proof.**

1. Identify the rank-one toric coefficient sheaf and Hodge trivialization with the exact R15.1 Tate interface.
2. Apply the owner’s analytification comparison; Taylor uniqueness with the same q-parameter identifies the formal and analytic coefficients.
3. Compare isogeny/differential pullback and the ν scalar with R15.2’s geometric operators and the pinned analytic ring action.

**Acceptance.**

- Retain n dq/q at Tate(q^n); replacing du/u with a base differential loses the convention.
- The local monomial q^r(du/u)^k has coefficient 1 in degree r and 0 elsewhere; this is a local chart test, not a global existence claim.
- Import the modular principle for one cusp per component and all-cusp cuspidality; analytic injection alone supplies neither statement over torsion coefficients.

**Depends on.** this roadmap: `B5/local-fj-expansion`, `B5/hecke-section-operator`; other roadmaps: `AlgebraicModularFormsAndSerreWeights:R15.1/hodge-bundle-with-tate-curve-normalization`, `AlgebraicModularFormsAndSerreWeights:R15.1/all-weight-analytic-comparison`, `AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem`, `AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions`, `AlgebraicModularFormsAndSerreWeights:R15.2/cuspidal-exact-sequence-equivariance`; libraries: `mathlib:UpperHalfPlane.qExpansion`, `mathlib:ModularForm.qExpansion_injective`, `mathlib:ModularForm.isCuspForm_iff_coeffZero_eq_zero`, `tauceti:HeckeRing.GL2.heckeRingHomCharSpace`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/B5`, namespace `AutomorphicBundles`.

**Sources.**

- [LanPEL], 7.1.2.1–7.1.2.4, pp.534–535: “Fourier–Jacobi expansion” — Rank-one specialization is compared to the exact imported Tate/analytic interfaces; it does not rebuild them.
- [LanIntro], §4.2.7, pp.49–50: “canonical extensions” — Explains the section interpretation whose specialized comparison is owned by R15.1.

#### Fourier–Jacobi expansion with vector coefficients

`AutomorphicBundles:B5/vector-fj-expansion` · construction · packet B5

In Lan’s neat good-prime PEL setup, let R be a Noetherian coefficient algebra over the allowed reflex/representation base and W a finite projective R-representation of the actual Levi group. Import Ecan(W) from B2/B3. For each cusp chart the Raynaud/parabolic identification supplies a locally free bundle E0(W) on its abelian torsor C whose pullback is Ecan(W) on the completed Mumford family. For every R-module M define degree-ell coefficients as Γ(C,Ψ(ell)⊗E0(W)⊗_R M), and define the expansion by actual formal restriction, the bundle identification and graded extraction. Impose the completed support condition and full-stabilizer transports before passing to invariants. For general characteristic-zero Shimura data use this construction only after C3.general supplies the actual mixed-boundary formal isomorphism and coefficient-bundle comparison; Milne VII.4.1 is a conjectural description in the inspected notes, not that supplier’s proof.

**Hypotheses.**

- The PEL bundle W is finite projective and the fan smooth/projective as in Lan Higher §2; arbitrary infinite-dimensional or p-adic analytic representations are not included.
- The degree-zero coefficient module is Γ(C,Ψ(ell)⊗E0⊗M). Definition 5.10 also treats higher cohomology, which is not replaced here by a degree-zero product.
- E0’s filtration is on C. Its graded pieces descend locally over the lower base, but the whole filtration need not descend through the stabilizer quotient.

**Construction.**

1. Import the actual canonical bundle and parabolic reduction; Proposition 5.6 identifies its formal pullback with E0 on C. This representation realization is B2/B3’s work.
2. Use the completed graded algebra of Corollary 5.9 to extract coefficients on the actual torsor and retain its support topology.
3. Repeat the common-completion comparison and full-stabilizer descent with E0 in place of the determinant power; character sheaf transports include the coefficient-bundle action.
4. For general characteristic zero request the mixed-boundary comparison from C3.general. Its absence is a recorded gap rather than an unconditional theorem extracted from Milne’s conjecture.

**API.**

- `VectorFourierJacobi.expansion` (constructor): Given the actual finite-projective representation bundle and its completed boundary identification, return the R-linear vector expansion into the full-stabilizer invariant family of sections of Ψ(ell) tensor E0(W) tensor_R M.
- `VectorFourierJacobi.coefficient` (projection): Extract the degree-ell section of Ψ(ell)⊗E0(W)⊗M from the completed boundary restriction.
- `VectorFourierJacobi.coefficient_map` (functoriality): An equivariant R-linear representation map W→W′ and a coefficient map M→M′ induce commuting degreewise maps, respecting identities and composition.
- `VectorFourierJacobi.transport` (functoriality): A cusp transport moves the lattice degree, Ψ and E0 together and intertwines extraction.
- `VectorFourierJacobi.determinant` (compatibility): The determinant-Hodge representation specializes to the scalar FJ map, under B3’s supplied boundary bundle isomorphism.
- `VectorFourierJacobi.refinement` (compatibility): The canonical section comparison for a common fan refinement intertwines vector expansions and has its cocycle law.

**Unit tests.**

- `VectorFourierJacobi.zeroRepresentation` (degenerate): For W=0 or M=0 every coefficient and expansion is zero.
- `VectorFourierJacobi.rankTwoMonomial` (computation): On a trivial rank-two local coefficient bundle and rank-one chart, q^n(v1,v2) has vector coefficient (v1,v2) at n and zero at other degrees.
- `VectorFourierJacobi.scalarSpecialization` (compatibility): For the determinant-Hodge representation giving ω^k the expansion equals the scalar map after the actual boundary-line identification.

**Acceptance.**

- For the determinant representation giving ω^k, this agrees with the scalar FJ construction including det_Z(X)⊗ω_A.
- On a trivialized rank-two local coefficient bundle, a monomial q^n(v1,v2) has precisely the vector (v1,v2) in degree n; one scalar coefficient loses data.
- Do not descend E0’s filtration to the stabilizer quotient merely because its graded pieces descend locally.

**Used by.**

- B5/vector-expansion-principle: Supplies the formal restriction whose coefficients detect vector-valued sections.
- OverconvergentAutomorphicForms:O6: Provides the finite-dimensional coefficient reference for p-adic q/FJ normalization.
- BCGP-2025 §4.6.1: Keeps classical finite-dimensional bundles distinct from the higher Coleman coefficient functor.

**Depends on.** this roadmap: `B5/fj-coefficient-module`, `B5/local-fj-expansion`, `B5/cone-compatibility`, `B5/global-fj-expansion`; stages of this roadmap: `AutomorphicBundles:B2`, `AutomorphicBundles:B3`, `AutomorphicBundles:B3.general`, `AutomorphicBundles:B4` (answered below); stages of other roadmaps: `ShimuraCompactifications:C3.general`, `ShimuraCompactifications:C4`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/B5`, namespace `AutomorphicBundles`.

**Sources.**

- [LanKoecher], Author-hosted preprint, Proposition 5.6 and proof, pp.11–13; Remark 5.7, p.13: “canonically determined locally free coherent sheaf” — Identifies the boundary coefficient bundle; the remark distinguishes the characteristic-zero general construction.
- [LanKoecher], Author-hosted preprint, Corollaries 5.8–5.9 and Definition 5.10, p.13: “locally free coherent sheaf” — Degree-zero specialization gives sections with E0, retaining the completed chart rather than asserting all products are global expansions.
- [Milne90], VII.4, Conjecture 4.1, p.102: “For Siegel modular varieties, it is proved” — The general formal isomorphism is a conjecture in these notes. The node explicitly requires a proven owner interface, with the Siegel case identified separately.

> **Assembly note: cross-part references.**
> - `AutomorphicBundles:B2` is answered by `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B2/levi-highest-weight-convention` on the characteristic-zero overlap: Ecan(W) for a Levi representation over a field. Residual: R5 (finite projective integral coefficients and the boundary bundle E0(W) (B2/B3)); see the gap “Integral coefficient interfaces that B5 needs from B2–B4”.
> - `AutomorphicBundles:B3` is answered by `B3/canonical-and-subcanonical-extensions`, `B3/boundary-coefficient-chart` on the characteristic-zero overlap: the canonical extension and its chart coefficient; E0(W) on the abelian torsor itself (Lan, Higher Koecher, Proposition 5.6) is not planned there. Residual: R5 (finite projective integral coefficients and the boundary bundle E0(W) (B2/B3)); see the gap “Integral coefficient interfaces that B5 needs from B2–B4”.
> - `AutomorphicBundles:B3.general` is answered exactly by `B3.general/general-canonical-extension`: the general-data canonical extension in characteristic zero.
> - `AutomorphicBundles:B4` is answered by `B4/classical-forms` on the characteristic-zero overlap: sections over a field; Γ(X,Ecan(W)⊗_R M) is the residual. Residual: R1 (the integral section functor (B4)); see the gap “Integral coefficient interfaces that B5 needs from B2–B4”.

#### Expansion principle for locally free automorphic coefficients

`AutomorphicBundles:B5/vector-expansion-principle` · theorem · packet B5

Let R be Noetherian, X a qcqs toroidal model smooth over R in the supplied PEL or characteristic-zero setup, Ecan a finite-rank locally free canonical automorphic bundle, and C_i its R-flat abelian-torsor charts with locally free E0,i. Require the actual formal restriction/graded coefficient identification, descent, and a finite collection of strata whose restrictions meet every irreducible component of X_(R/p) for every prime p⊂R. Then the joint vector Fourier–Jacobi map Γ(X,Ecan⊗_R M)→∏_i FJE_i(Ecan,M) is injective for every R-module M. For M1⊂M, membership of every expansion in the image from M1 is equivalent to membership of the global section in Γ(X,Ecan⊗M1). Boundary-zero coefficients at all required boundary strata characterize the image of Esub=Ecan(−D), when its relative boundary tensor sequence is exact.

**Hypotheses.**

- The component condition is fibrewise after every prime reduction, including the zero prime when present; total-model density alone is not used as this hypothesis.
- Use the sheaf colimit theorem on qcqs stacks via SF.1, or schemes at neat level. Products of coefficient modules are not asserted to commute with filtered colimits.
- This is a derived vector-bundle extension of Lan’s scalar argument, with the formal identification from Higher Koecher’s principle; it is not claimed as a verbatim statement of either paper.

**Proof.**

1. For R/p the bundle is coherent on the actual reduced model. Zero graded coefficients give zero formal restrictions; apply finite-stalk Krull separation and F0’s coherent-section detection on an atlas. The specified fibrewise component hypothesis gives global zero.
2. R-flatness of X and C_i plus local freeness give the two left-exact coefficient rows; products and invariants preserve left exactness by unique lifts.
3. Use the existing Mathlib prime-filtration induction and short-complex monicity theorem for finite M. Lift an arbitrary section from a finite coefficient submodule using qcqs section/colimit compatibility, without interchanging colimits with products.
4. For recognition apply injection to M/M1 and the two exact rows. For cusp sections use the separately exact boundary sequence and the degree-zero restriction theorem.

**Acceptance.**

- W=det^k recovers the scalar principle with the same component and coefficient hypotheses.
- A rank-two direct sum is detected component by component; the theorem does not collapse coefficients to a scalar.
- The nonsplit Z/4 extension is included. The Iwahori Hilbert special fibre with a component disjoint from all cusps fails the required hypothesis.

**Depends on.** this roadmap: `B5/vector-fj-expansion`, `B5/coefficient-naturality`, `B5/coefficient-sequence-exact`, `B5/fj-target-left-exact`, `B5/fj-injectivity-finite`, `B5/coefficient-recognition`, `B5/constant-term-restriction`, `B5/cuspidal-boundary-criterion`; stages of this roadmap: `AutomorphicBundles:B3`, `AutomorphicBundles:B4` (answered below); other roadmaps: `AdicSpacesPartII:F0/completion-detects-near-closed`; stages of other roadmaps: `SchemeAndStackFoundations:SF.1`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/B5`, namespace `AutomorphicBundles`.

**Sources.**

- [LanPEL], Proposition 7.1.2.14, pp.539–540: “with exact rows.” — The scalar proof supplies the devissage pattern; the vector result additionally uses the explicit formal bundle and flatness hypotheses.
- [LanKoecher], Author-hosted preprint, Proposition 5.6, p.11: “locally free coherent sheaf” — Provides the local coefficient bundle needed to carry the scalar detection argument over to vectors.

> **Assembly note: cross-part references.**
> - `AutomorphicBundles:B3` is answered by `B3/canonical-and-subcanonical-extensions`, `B3/subcanonical-extension` on the characteristic-zero overlap: Ecan and Esub over a field. Residual: R5 (finite projective integral coefficients and the boundary bundle E0(W) (B2/B3)); see the gap “Integral coefficient interfaces that B5 needs from B2–B4”.
> - `AutomorphicBundles:B4` is answered by `B4/classical-forms`, `B4/cusp-forms` on the characteristic-zero overlap: section modules over a field. Residual: R1 (the integral section functor (B4)); see the gap “Integral coefficient interfaces that B5 needs from B2–B4”.

### B5.iv. Hilbert q-expansions and the Hecke action on coefficients

Hilbert expansions follow Diamond, *Compactifications of Iwahori-level Hilbert modular varieties*, §6: at prime-to-p level, with p possibly ramified (p = 2 included), the q-expansion at a cusp takes values in the coefficient line D_c ⊗_O R indexed by the fractional lattice N⁻¹Λ₊ ∪ {0}, with Λ = 𝔡_F⁻¹I⁻¹J (`B5/hilbert-cusp-expansion`); a set of cusps meeting every connected component of the minimal compactification detects forms and recognizes coefficient subrings (`B5/hilbert-expansion-principle`, Diamond’s Proposition 6.2.1, which fails at general Iwahori level); and cusp forms are cut out by the constant terms at all cusps (`B5/hilbert-cuspidal-boundary`). The Hecke action on expansion coefficients specializes to b_n = a_{ℓn} + χ(ℓ)ℓ^{k−1}a_{n/ℓ} at a good modular prime and to Diamond’s Proposition 6.5.1 for Hilbert forms (`B5/hecke-expansion-compatibility`).

#### Hilbert cusp q-expansions and coefficient lines

`AutomorphicBundles:B5/hilbert-cusp-expansion` · construction · packet B5

Use Diamond’s Hilbert setting: F≠Q totally real, a rational prime p possibly ramified in F, a sufficiently large p-adic field with valuation ring O and embeddings Θ, and U=U^p GL2(O_F,p). Let R be a Noetherian O-algebra and (k,m)∈Z^Θ×Z^Θ with χ_(k+2m),R trivial on O_F×∩U. For the imported automorphic line A_(k,m), M_(k,m)(U;R)=Γ(Y,A)=Γ(Ymin,j_*A). At a cusp c represented by 0→I→H→J→0, polarization λ and level η, set Λ=d_F⁻¹I⁻¹J. Choose a prime-to-p full level N≥3 contained in U, ζ_N∈O, and a splitting H≅J⊕I. Let D_(k,m),c=⊗_θ (I⁻¹)_θ^⊗kθ ⊗ (d_F(IJ)⁻¹)_θ^⊗mθ. Define q_c by formal restriction into the series with coefficient line D_c⊗_O R and indices N⁻¹Λ_+∪{0}, using the actual unit action and completion. Changes of splitting, cusp representative and fine level use the canonical transports of these data; the expansion at general U is independent of a chosen cusp above c. The minimal pushforward j_*A is not assumed locally free.

**Hypotheses.**

- All the weight, level and trivial-unit-character conditions are part of the definition; p=2 and ramified p are not discarded.
- The ramified Pappas–Rapoport splitting model and its automorphic line are imported from H2/B2/B3 and the Hilbert cusp geometry from C6.
- The series includes zero and totally positive degrees in the stated fractional lattice; the coefficient line and unit action cannot be replaced by a naked scalar monoid algebra.

**Construction.**

1. Import the cusp lattice, compactifications and completed chart from C6, including the ramified splitting-model comparison from H2.
2. Identify the boundary automorphic line with the stated D_c using B2/B3’s embedding-indexed weight realization.
3. Restrict j_*A to the completion and use the source’s inclusion into formal q-series. Prove its transport laws using the actual cusp unit action.
4. At general prime-to-p level pull to fine U(N); the fine-cusp independence is descended by invariants, without averaging.

**API.**

- `HilbertQExpansion.map` (constructor): The R-linear formal restriction q_c into the coefficient-line series in the specified fractional positive lattice.
- `HilbertQExpansion.coeff` (projection): Extract the D_c⊗R coefficient of t∈N⁻¹Λ_+∪{0}, including zero.
- `HilbertQExpansion.transport` (functoriality): The canonical lattice/line isomorphism for a cusp representative or splitting change intertwines the transformed series; transports compose.
- `HilbertQExpansion.coefficient_map` (functoriality): A Noetherian O-algebra map R→R′ commutes with each coefficient after base change of the actual form.
- `HilbertQExpansion.fineLevel` (compatibility): Restriction to a fine U(N) and any cusp above c gives the same expansion after the canonical line/lattice identifications.

**Unit tests.**

- `HilbertQExpansion.zero` (degenerate): The zero form has zero coefficient in every degree; over the zero coefficient ring all forms and coefficients vanish.
- `HilbertQExpansion.localMonomial` (computation): On a chosen formal cusp chart and coefficient-line trivialization, q^t d has coefficient d at t and zero elsewhere; no global form or unit invariance of this local monomial is asserted.
- `HilbertQExpansion.unitTransport` (non-example): A family supported at a positive t moved to a different degree by a cusp unit, with nonzero coefficient only at t, is not invariant unless its full transported orbit satisfies the unit relation. It cannot be declared the expansion of a descended form.

**Acceptance.**

- The full weight vector and D_c survive; χ_(k+2m)=1 is not replaced by parallel k alone.
- The source permits ramified p but does not give an all-component principle for general U0(P).
- F=Q comparison is imported through the modular specialization; Diamond’s source itself assumes F≠Q.

**Used by.**

- B5/hilbert-expansion-principle: Supplies the all-component expansion map and coefficient recognition target.
- B5/hecke-expansion-compatibility: Supplies the normalized Hilbert coefficients used by the prime-to-p Hecke formula.
- OverconvergentAutomorphicForms:O6: Fixes the cusp lattice, coefficient line and p-adic/classical comparison conventions.

**Depends on.** this roadmap: `B5/vector-fj-expansion`; stages of this roadmap: `AutomorphicBundles:B2`, `AutomorphicBundles:B3`, `AutomorphicBundles:B4` (answered below); stages of other roadmaps: `HilbertModularVarietiesAndShimuraCurves:H2`, `HilbertModularVarietiesAndShimuraCurves:H3`, `ShimuraCompactifications:C6`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/B5`, namespace `AutomorphicBundles`.

**Sources.**

- [Diamond22], §6.1 and §6.2, pp.24–25: “q-expansion map” — Defines q_c, its coefficient line, splitting, full-level denominator and independence at general level.

> **Assembly note: cross-part references.**
> - `AutomorphicBundles:B2` is answered by `B2/automorphic-vector-bundles-from-representations-of-the-centralizer` on the characteristic-zero overlap: the automorphic line of a Levi character over a field. Residual: R6 (Diamond’s ramified (k,m) Hilbert line (B2/B4)); see the gap “Integral coefficient interfaces that B5 needs from B2–B4”.
> - `AutomorphicBundles:B3` is answered by `B3/canonical-and-subcanonical-extensions`, `B3/minimal-coherent-pushforward` on the characteristic-zero overlap: the canonical extension and the coherent (not locally free) minimal pushforward j_*, in characteristic zero. Residual: R6 (Diamond’s ramified (k,m) Hilbert line (B2/B4)); see the gap “Integral coefficient interfaces that B5 needs from B2–B4”.
> - `AutomorphicBundles:B4` is answered by `B4/hilbert-arithmetic-weight`, `B4/hilbert-coefficient`, `B4/unsplit-hilbert-descent`, `B4/hilbert-central-descent` on the characteristic-zero overlap: the split and unsplit Hilbert coefficients for arithmetic weights (k,w) over a characteristic-zero field. Residual: R6 (Diamond’s ramified (k,m) Hilbert line (B2/B4)); see the gap “Integral coefficient interfaces that B5 needs from B2–B4”.

#### Hilbert q-expansion principle

`AutomorphicBundles:B5/hilbert-expansion-principle` · theorem · planet “Hilbert q-expansion principle” · packet B5

In hilbert-cusp-expansion’s prime-to-p-level setup, let S be a collection of cusps meeting every connected component of Ymin, equivalently with surjective determinant map S→F_+×\A_F,f×/det(U). Then q_S is injective. If R′⊂R is a Noetherian O-subalgebra and every coefficient lies in D_c⊗_O R′ at all c∈S, then the form comes from M_(k,m)(U;R′). This is Diamond Proposition 6.2.1; its geometric supplier must verify the component-to-fibre-detection comparison used by the vector principle. No analogous assertion is made for general Iwahori special fibres Y0(P)min_R, whose irreducible components need not contain cusps.

**Hypotheses.**

- Retain the weight/unit condition over both rings and the exact prime-to-p level U.
- The determinant surjectivity is the source’s component condition, not merely the choice of one representative in a polarization class.
- Before importing the vector proof at torsion R, C6 must supply the actual fibrewise detection argument; it remains an explicit input rather than an inferred smoothness claim for every ramified integral model.

**Proof.**

1. Use the source’s fine-level formal chart and component argument; request the precise ramified/fibrewise geometric detection interface from C6 and H2.
2. At neat fine level specialize the vector detection and quotient-recognition argument with D_c’s O-flat coefficient line.
3. At general U pass to a normal fine cover and its equalizer; no division by the finite level group order is needed.

**Acceptance.**

- A set of infinity cusps covering the determinant classes gives an injective map.
- Coefficients in R′=O inside its fraction field detect the corresponding integral form in the stated setup.
- For U0(P) the source explicitly warns that components may contain no cusp, so the same criterion is not available.

**Depends on.** this roadmap: `B5/hilbert-cusp-expansion`, `B5/vector-expansion-principle`, `B5/coefficient-recognition`; stages of other roadmaps: `ShimuraCompactifications:C6`, `HilbertModularVarietiesAndShimuraCurves:H2`, `HilbertModularVarietiesAndShimuraCurves:H3`, `SchemeAndStackFoundations:SF.1`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/B5`, namespace `AutomorphicBundles`.

**Sources.**

- [Diamond22], Proposition 6.2.1 and following Iwahori warning, p.25: “qS is injective” — States both injectivity and coefficient-subalgebra recognition with the determinant/component condition, and excludes the general Iwahori analogue.

#### Hilbert cusp forms and all cusp constants

`AutomorphicBundles:B5/hilbert-cuspidal-boundary` · theorem · packet B5

In the Hilbert prime-to-p setting, let e_c be the constant coefficient of q_c with values in D_c⊗_O R. The source’s cusp space is ker(∏_c e_c), using all cusps. Under B3’s canonical/subcanonical boundary comparison and exact relative boundary tensor sequence, this is the image of Γ(Ytor,A_(k,m)(−D)⊗_O R) in the canonical sections. Each e_c is independent of splitting and lands in the actual cusp-unit invariants. In the characteristic-zero/flat O setting of §6.3, if the pair of weight vectors is not parallel, meaning (kθ,mθ) is not independent of θ, these invariant constants vanish and every such form is cuspidal; the conclusion is not inferred for arbitrary torsion R.

**Hypotheses.**

- Use every required boundary component and its unit/line action. One infinity coefficient at arbitrary level is insufficient.
- B3/C6 supply the precise Hilbert boundary ideal and tensor exactness, including the ramified model; Koecher extension does not replace the cusp ideal.

**Proof.**

1. Extract degree zero using the actual completed restriction; the unit action makes the constant independent of the splitting.
2. Import the boundary ideal comparison and apply the relative boundary sequence, using exactness for the chosen coefficients rather than right exactness of global sections.
3. Use the character ideal calculation in Diamond §6.3 for the flat/characteristic-zero parallelness criterion; keep torsion invariant constants separate.

**Acceptance.**

- At all cusps a local q^t d with t strictly positive has zero constant; a local constant d has its actual D_c value.
- The source’s nonparallel flat-coefficient case makes the cusp and full section spaces equal; torsion coefficients require rechecking the character ideal.
- No automatic cusp assertion follows merely because the Hilbert minimal boundary has codimension greater than one.

**Depends on.** this roadmap: `B5/hilbert-cusp-expansion`, `B5/constant-term-restriction`, `B5/cuspidal-boundary-criterion`; stages of this roadmap: `AutomorphicBundles:B3` (answered below); stages of other roadmaps: `ShimuraCompactifications:C6`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/B5`, namespace `AutomorphicBundles`.

**Sources.**

- [Diamond22], §6.3, p.26: “ker(eC )” — Defines cusp forms by all constant terms, their unit-invariant values and the flat-coefficient parallelness condition.

> **Assembly note: cross-part references.**
> - `AutomorphicBundles:B3` is answered by `B3/subcanonical-extension` on the characteristic-zero overlap: the reduced-boundary twist over a field. Residual: R6 (Diamond’s ramified (k,m) Hilbert line (B2/B4)); see the gap “Integral coefficient interfaces that B5 needs from B2–B4”.

#### Hecke action on Fourier–Jacobi coefficients

`AutomorphicBundles:B5/hecke-expansion-compatibility` · theorem · packet B5

For an admissible geometric Hecke correspondence of hecke-section-operator, the actual completed cusp correspondence and bundle transport induce a coefficient operator H_g^FJ. The square FJ∘T_g = ν(g)H_g^FJ∘FJ commutes, including cusp-label changes, finite trace and full-stabilizer transport; it is independent of compatible refinement and commutes with allowed coefficient changes. No universal scalar formula for higher-dimensional coefficients is asserted: they remain sections on abelian torsors. At a good modular prime ℓ∤N, under modular-expansion-comparison this specializes to b_n=a_(ℓn)+χ(ℓ)ℓ^(k−1)a_(n/ℓ), with a_(n/ℓ)=0 when ℓ∤n and the n=0 term included. In Diamond’s Hilbert normalization r_m^t, for U1(n) or U(n) and v∤np, it specializes to r_m^t(T_v f)=r_m^(ϖ_v t)(f)+Nm(v) r_m^(ϖ_v⁻¹t)(S_v f); for U1(n) and v|n the second term is absent. Here r_m^t includes the coefficient-line/χ_m normalization of (6.1), and S_v is the actual central correspondence.

**Hypotheses.**

- The comparison requires formal trace/base-change and actual degree/cusp maps from C3/C4; these are requests, not consequences of ordinary toric inclusions.
- The modular geometric normalization requires ℓ invertible and the source’s good-prime hypotheses. Diamond’s displayed formulas use primes outside p; no saving trace or U_p at p is inferred.
- Retain the different cusp/component t in the Hilbert formula and its character normalization.

**Proof.**

1. Complete the actual correspondence along each cusp lying over the target and import the resulting sheaf trace compatibility.
2. Use functoriality of graded extraction with the character lattice map and θ_g; trace the transported coefficient sections and descend stabilizer invariance.
3. For rank one compare with the owned R15.2 geometric formula and the pinned analytic good-prime sum.
4. For Hilbert forms compute using Diamond Proposition 6.5.1, retaining r_m^t and the central S_v term rather than treating it as an unnormalized q coefficient.

**Acceptance.**

- For a local modular sequence supported in degree r and n not divisible by ℓ, only the a_(ℓn) term contributes; when ℓ|n the second term has χ(ℓ)ℓ^(k−1).
- At n=0 the good modular operator gives (1+χ(ℓ)ℓ^(k−1))a_0; this also tests the normalization on constant weight-zero forms.
- Over R/p² at ℓ≠p, coefficient change and the normalized operator commute; reduction at p does not erase a missing integral trace construction.
- Higher-rank coefficients move through abelian-torsor sections, rather than being scalar Fourier coefficients.

**Depends on.** this roadmap: `B5/hecke-section-operator`, `B5/non-neat-hecke-descent`, `B5/modular-expansion-comparison`, `B5/hilbert-cusp-expansion`, `B5/vector-fj-expansion`; other roadmaps: `AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions`; stages of other roadmaps: `ShimuraCompactifications:C3`, `ShimuraCompactifications:C4`, `ShimuraCompactifications:C6`; libraries: `tauceti:HeckeRing.GL2.twistedHeckeSlashSum_diagCosetGamma0_of_prime`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/B5`, namespace `AutomorphicBundles`.

**Sources.**

- [Diamond22], Proposition 6.5.1, equation (6.1) and Remark 6.5.2, pp.27–29: “The effect of the operators” — The formula is for normalized adelic coefficients at infinity; the R15 supplier owns its modular integral specialization.
- [LanPEL], 5.4.3.8–5.4.3.10 and 6.4.3, pp.438–439 and 527–530: “map from the set of cusp labels” — Supplies the geometric cusp assignment. Formal trace/graded extraction compatibility is a derived target and remains an explicit supplier request.

### B5.v. Classical cohomological comparisons

Three items of Boxer–Calegari–Gee–Pilloni, *Modularity theorems for abelian surfaces*, are routed here: the comparison of the classical finite-dimensional bundles with the coefficient functor VB⁰ (`B5/classical-bcgp-equivariance`), and the GSp₄ Hodge–Tate decomposition of Theorem 4.8.2, ordinary (`B5/classical-siegel-ht-comparison`) and with compact support (`B5/cuspidal-siegel-ht-comparison`). The four coherent weights and Tate shifts are explicit; the decomposition itself is quoted by BCGP from Faltings–Chai 1990, Theorem 6.2, whose proof is a recorded gap, and the dual BGG/Kostant input and the full VB functor belong to the proposed roadmaps named under *Boundaries*. The two decompositions answer the request that the B0 packet files with B5.

#### Classical algebraic bundles in the Hodge–Tate coefficient functor

`AutomorphicBundles:B5/classical-bcgp-equivariance` · comparison · packet B5

In BCGP’s Hodge-type setting, fix neat tame K^p, a sufficiently large p-adic coefficient field E, the actual Levi M, finite-dimensional algebraic L_κ with κ M-dominant, and compatible smooth toroidal data. The imported coefficient functor VB^0 identifies VB^0(L_κ)=ω^(κ,sm) with the smooth tower of the finite-level classical automorphic bundles of B2/B3, with its μ-weight Tate normalization. Its coherent cohomology is colim_(Kp) RΓ(X_KpK^p,ω_Kp^κ), a complex of smooth admissible G(Q_p)-representations. The same compatibility holds after tensoring by the actual boundary ideal (−D). Level pullbacks, prime-to-p Hecke maps and compatible fan refinements commute with the identification; G(Q_p) may change the fan. For GSp4 the convention check is ω^((1,0;−1),sm)=ω_A(−1)⊗O^sm, with Q_p(1) of Hodge–Tate weight −1 and Sen eigenvalue +1. The full derived/analytic VB machinery belongs to the already proposed HigherHidaAndColemanTheory, not to B5.

**Hypotheses.**

- The bundle is finite-dimensional and algebraic, not a locally analytic Coleman coefficient.
- Retain the μ normalization; §4.8 uses untwisted coherent bundles and applies its Tate twists separately.
- The supplier for the complete VB functor is pending design, so its actual carrier is a recorded gap and its existing proposal is retained rather than invented as a new stage.

**Proof.**

1. Import B1/B2/B3’s finite-dimensional representation realization and T6’s logarithmic coefficient comparison.
2. Use BCGP §4.6.1’s descent of VB^0(L_κ) and compare transition maps; the pending HigherHida supplier must provide its actual VB carrier and the finite-dimensional acyclicity/descent interface.
3. Transport the actual boundary ideal under refinement; apply coherent level-colimit compatibility from SF.2 and the existing Hecke correspondences.
4. Check the tautological differential sequence and the (1,0;−1) Tate shift as in §4.6.2.

**Acceptance.**

- The (1,0;−1) coefficient is ω_A(−1), not untwisted ω_A.
- At κ=0 the actual constant coefficient matches the classical structure sheaf with its supplied normalization.
- The cusp comparison uses ω_Kp^κ(−D_Kp) on every finite model and compatible boundary pullback, not ordinary Γ on the open Shimura variety.

**Depends on.** this roadmap: `B5/hecke-section-operator`; stages of this roadmap: `AutomorphicBundles:B1`, `AutomorphicBundles:B2`, `AutomorphicBundles:B3`, `AutomorphicBundles:B3.general`, `AutomorphicBundles:B4` (answered below); stages of other roadmaps: `HodgeTateAndCanonicalSubgroups:T6:comparison`, `SchemeAndStackFoundations:SF.2`, `ShimuraCompactifications:C3.general`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/B5`, namespace `AutomorphicBundles`.

**Sources.**

- [BCGP], §§4.6.1–4.6.2, pp.81–82; §§4.5.17–4.5.22 for refinement context: “the usual sheaf of modular forms” — The finite-dimensional bundle descends to the classical finite-level sheaf with its stated Tate normalization. The source’s general VB construction is imported.

> **Assembly note: cross-part references.**
> - `AutomorphicBundles:B1` is answered exactly by `B1/hodge-canonical-principal-bundle`, `B1/principal-hecke-pullback`: the Hodge-type canonical principal bundle and its Hecke and level pullbacks.
> - `AutomorphicBundles:B2` is answered exactly by `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B2/levi-highest-weight-convention`: the finite-dimensional Levi coefficient L_κ and its highest-weight convention.
> - `AutomorphicBundles:B3` is answered exactly by `B3/canonical-and-subcanonical-extensions`, `B3/subcanonical-extension`, `B3/fan-independent-sections`: ω_Kp^κ, ω_Kp^κ(−D) and their comparison along compatible refinements.
> - `AutomorphicBundles:B3.general` is answered exactly by `B3.general/general-boundary-functoriality`: compatibility of the section comparisons with Hecke maps that move the fan.
> - `AutomorphicBundles:B4` is answered exactly by `B4/classical-vb-tate-normalization`: the identification VB⁰(L_κ) = ω^{κ,sm} with its κ(μ) twist, which that node already states (see the Assembly note on duplication).

> **Assembly note: planned twice.** Its first assertion, VB⁰(L_κ) = ω^{κ,sm} with the μ-weight Tate normalization, is the statement of `B4/classical-vb-tate-normalization` (see the note there). Read this node as importing that identification and adding the cohomological, cuspidal, Hecke and refinement compatibilities and the GSp₄ convention check.

#### Classical Siegel Hodge–Tate decomposition

`AutomorphicBundles:B5/classical-siegel-ht-comparison` · theorem · planet “Siegel Hodge–Tate decomposition” · packet B5

For the finite-level GSp4 toroidal model X=X_KpK^p in BCGP’s setting, let κ=(k1,k2;w) be an integral G-dominant weight with 0≥k1≥k2 and k1+k2+w even, and let V_κ∨ be its canonical pro-Kummer-étale coefficient local system. Use the untwisted canonical coherent bundles ω^λ of §4.8. Define λ0=(k1,k2;−w), λ1=(2−k1,k2;−w), λ2=(3−k2,k1+1;−w), λ3=(3−k2,3−k1;−w); 2a0=k1+k2+w, 2a1=2−k1+k2+w, 2a2=4−k2+k1+w, 2a3=6−k1−k2+w. For every i≥0 there is a G_Qp×T_KpK^p-equivariant isomorphism H^i(X,V_κ∨)⊗_Qp C_p ≅ ⊕_(j=0..3) H^(i−j)(X,ω^λj)(−a_j), with negative coherent degrees interpreted as zero. The étale group is the logarithmic/pro-Kummer cohomology in the source notation; it is not reinterpreted as ordinary étale cohomology of the proper underlying toroidal space with an arbitrary lisse extension. The Tate convention is Q_p(1) of Hodge–Tate weight −1, Sen eigenvalue +1.

**Hypotheses.**

- Keep all four weights, central weight −w, shifts i−j and separate Tate twists −a_j. Parity makes every a_j integral.
- The logarithmic comparison and canonical local system are T6/B1 inputs. The dual BGG/Kostant identification and degeneration/Hecke comparison underlying FC90 Theorem 6.2 are not proved in the inspected BCGP passage and remain explicit gaps.

**Proof.**

1. Import the actual logarithmic local system/de Rham comparison from T6 and the canonical coefficient realization from B1/B2/B3.
2. Identify the four coherent weights by the GSp4 dual BGG/Kostant calculation. This lies beyond upstream LieHighestWeight, which expressly excludes BGG, and needs its already proposed Part II input.
3. Apply the source-qualified classical Hodge–Tate decomposition quoted as FC90 Theorem 6.2; acquire and check the underlying proof and its degeneration and functoriality inputs. No deduction from a spectral sequence alone is claimed.
4. Compare Hecke and Galois actions using the actual coefficient maps and the pinned convention; the explicit μ pairing gives the four Tate shifts.

**Acceptance.**

- At κ=(0,0;0), λj=(0,0;0),(2,0;0),(3,1;0),(3,3;0) and a_j=0,1,2,3.
- At i=0 only the j=0 summand can survive; negative coherent degree is zero.
- For κ=(0,0;1), parity fails and the integral GSp4 representation in this convention is unavailable; a formula using integer truncation of half-weights is rejected.

**Depends on.** this roadmap: `B5/classical-bcgp-equivariance`, `B5/hecke-convolution`; stages of this roadmap: `AutomorphicBundles:B1`, `AutomorphicBundles:B2`, `AutomorphicBundles:B3`, `AutomorphicBundles:B4` (answered below); stages of other roadmaps: `HodgeTateAndCanonicalSubgroups:T6:comparison`, `SchemeAndStackFoundations:SF.2`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/B5`, namespace `AutomorphicBundles`.

**Sources.**

- [BCGP], §4.8.1 and Theorem 4.8.2, pp.101–102: “equivariant isomorphisms” — States the four-term classical decomposition and attributes the proof to FC90 Theorem 6.2; the uninspected proof is explicitly recorded as a gap.

> **Assembly note: cross-part references.**
> - `AutomorphicBundles:B1` is answered exactly by `B1/hodge-canonical-principal-bundle`: the GSp₄ canonical principal bundle; the pro-Kummer-étale extension of the local system is the T6 input the node already lists.
> - `AutomorphicBundles:B2` is answered exactly by `B2/etale-coefficient-local-system`, `B2/levi-highest-weight-convention`: the étale local system of V_κ on the open variety and the weight conventions.
> - `AutomorphicBundles:B3` is answered exactly by `B3/canonical-and-subcanonical-extensions`: the untwisted canonical coherent bundles ω^λ.
> - `AutomorphicBundles:B4` is answered exactly by `B4/siegel-coefficient`: the Siegel Schur/determinant coefficients.

> **Assembly note: answers a request of the other part.** The B0 packet files a request with `AutomorphicBundles:B5` for BCGP Theorem 4.8.2 (ordinary display), with weights κ_j and Tate shifts a_j. This node states exactly that decomposition, with the same four weights written λ_j, the same a_j, the untwisted §4.8 coherent convention and the pro-Kummer-étale cohomology of the toroidal model; together with `B5/cuspidal-siegel-ht-comparison` it answers the request, which can be closed.

#### Compact-support Siegel Hodge–Tate decomposition

`AutomorphicBundles:B5/cuspidal-siegel-ht-comparison` · comparison · packet B5

With exactly the weight, coefficient local system, finite-level model and Tate convention of classical-siegel-ht-comparison, there is a G_Qp×T_KpK^p-equivariant isomorphism H_c^i(X,V_κ∨)⊗_Qp C_p ≅ ⊕_(j=0..3) H^(i−j)(X,ω^λj(−D))(−a_j), where D is the actual reduced toroidal boundary divisor and H_c is the compact-support logarithmic/étale theory used by BCGP. Keep this as a separate comparison from the ordinary canonical-bundle statement. The cusp twist is the subcanonical coefficient sheaf, not replacement by a selected set of zero constant terms in cohomological degree i.

**Hypotheses.**

- Use the same four λ_j and a_j, all component boundary ideals and compact-support functoriality.
- The boundary/logarithmic compact-support comparison and duality are supplier inputs. It is not a formal consequence of degree-zero cuspidality or of the ordinary decomposition.

**Proof.**

1. Import the subcanonical extensions and boundary ideal from B3 and the compact-support logarithmic comparison from T6/SF.2.
2. Use the compact-support version quoted in Theorem 4.8.2, whose FC90 proof and boundary functoriality must be read and supplied.
3. Apply the same four-weight calculation and compare the Hecke/Galois actions with the boundary ideal maps; verify all coherent summands carry (−D).

**Acceptance.**

- At κ=0 the four coherent terms have twists −D and Tate shifts 0,−1,−2,−3, with their degree shifts retained.
- When D is empty the boundary twist is identity and the proper compact-support theory agrees with the ordinary one under the supplier comparison.
- When D is nonempty, silently using ω^λ in place of ω^λ(−D) fails the cusp-coefficient convention.

**Depends on.** this roadmap: `B5/classical-bcgp-equivariance`, `B5/hecke-convolution`, `B5/classical-siegel-ht-comparison`, `B5/cuspidal-boundary-criterion`; stages of this roadmap: `AutomorphicBundles:B1`, `AutomorphicBundles:B2`, `AutomorphicBundles:B3`, `AutomorphicBundles:B4` (answered below); stages of other roadmaps: `HodgeTateAndCanonicalSubgroups:T6:comparison`, `SchemeAndStackFoundations:SF.2`.

**Library target.** module `TauCeti/Geometry/Shimura/AutomorphicBundles/B5`, namespace `AutomorphicBundles`.

**Sources.**

- [BCGP], Theorem 4.8.2, compact-support display, pp.101–102: “Theorem 4.8.2 ([FC90], Thm. 6.2).” — The second display uses compact support and the boundary twist in every coherent summand. Proof and actual cohomology carriers remain supplied inputs.

> **Assembly note: cross-part references.**
> - `AutomorphicBundles:B1` is answered exactly by `B1/hodge-canonical-principal-bundle`: the GSp₄ canonical principal bundle; the pro-Kummer-étale extension of the local system is the T6 input the node already lists.
> - `AutomorphicBundles:B2` is answered exactly by `B2/etale-coefficient-local-system`, `B2/levi-highest-weight-convention`: the étale local system of V_κ on the open variety and the weight conventions.
> - `AutomorphicBundles:B3` is answered exactly by `B3/canonical-and-subcanonical-extensions`, `B3/subcanonical-extension`: the untwisted canonical coherent bundles ω^λ and their (−D) twists.
> - `AutomorphicBundles:B4` is answered exactly by `B4/siegel-coefficient`, `B4/cusp-forms`: the Siegel Schur/determinant coefficients and the cusp-form convention.

> **Assembly note: answers a request of the other part.** This is the compact-support half of the B0 packet’s request to `AutomorphicBundles:B5` (every coherent summand twisted by the reduced boundary, ω^{κ_j}(−D_red)).

## Cross-part prerequisites

The B0 packet never cites the B5 packet. The B5 packet cites the stages B1, B2, B3, B3.general and B4 of this roadmap 35 times, as stage prerequisites backed by requests to its own roadmap. Each citation is answered below by the B0-packet nodes that supply it. *replace* means those nodes supply everything the B5 node uses, so the stage id can be replaced by them; *partial* means they supply the characteristic-zero or field part, and the stage id stays for a residual named in the assembly gap; *redundant* means no result of the stage is used. Adding these node ids keeps the graph acyclic: no B0-packet node reaches a B5-packet node, through this roadmap or any other packet.

| B5 node | Stage cited | B0-packet nodes that answer it | Fit | Residual |
|---|---|---|---|---|
| `B5/fj-coefficient-module` | `B3` | `B3/boundary-coefficient-chart` | replace | — |
| `B5/fj-coefficient-module` | `B4` | — | redundant | — |
| `B5/local-fj-expansion` | `B3` | `B3/canonical-and-subcanonical-extensions`, `B3/boundary-coefficient-chart` | replace | — |
| `B5/fj-refinement` | `B3` | `B3/refinement-canonical-extension`, `B3/fan-independent-sections` | partial | R2 |
| `B5/coefficient-sequence-exact` | `B3` | `B3/canonical-and-subcanonical-extensions` | replace | — |
| `B5/coefficient-sequence-exact` | `B4` | `B4/classical-forms` | partial | R1 |
| `B5/fj-injectivity` | `B4` | `B4/classical-forms` | partial | R1 |
| `B5/cuspidal-boundary-criterion` | `B3` | `B3/subcanonical-extension` | replace | — |
| `B5/cuspidal-boundary-criterion` | `B4` | `B4/cusp-forms` | partial | R1 |
| `B5/hecke-section-operator` | `B2` | `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B2/coefficient-tensor-hecke`, `B1/principal-hecke-pullback` | partial | R5 |
| `B5/hecke-section-operator` | `B3` | `B3/canonical-and-subcanonical-extensions`, `B3/subcanonical-extension`, `B3/fan-independent-sections`, `B3.general/general-boundary-functoriality` | partial | R2 |
| `B5/hecke-section-operator` | `B4` | `B4/classical-forms`, `B4/cusp-forms` | partial | R1 |
| `B5/vector-fj-expansion` | `B2` | `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B2/levi-highest-weight-convention` | partial | R5 |
| `B5/vector-fj-expansion` | `B3` | `B3/canonical-and-subcanonical-extensions`, `B3/boundary-coefficient-chart` | partial | R5 |
| `B5/vector-fj-expansion` | `B3.general` | `B3.general/general-canonical-extension` | replace | — |
| `B5/vector-fj-expansion` | `B4` | `B4/classical-forms` | partial | R1 |
| `B5/vector-expansion-principle` | `B3` | `B3/canonical-and-subcanonical-extensions`, `B3/subcanonical-extension` | partial | R5 |
| `B5/vector-expansion-principle` | `B4` | `B4/classical-forms`, `B4/cusp-forms` | partial | R1 |
| `B5/hilbert-cusp-expansion` | `B2` | `B2/automorphic-vector-bundles-from-representations-of-the-centralizer` | partial | R6 |
| `B5/hilbert-cusp-expansion` | `B3` | `B3/canonical-and-subcanonical-extensions`, `B3/minimal-coherent-pushforward` | partial | R6 |
| `B5/hilbert-cusp-expansion` | `B4` | `B4/hilbert-arithmetic-weight`, `B4/hilbert-coefficient`, `B4/unsplit-hilbert-descent`, `B4/hilbert-central-descent` | partial | R6 |
| `B5/hilbert-cuspidal-boundary` | `B3` | `B3/subcanonical-extension` | partial | R6 |
| `B5/classical-bcgp-equivariance` | `B1` | `B1/hodge-canonical-principal-bundle`, `B1/principal-hecke-pullback` | replace | — |
| `B5/classical-bcgp-equivariance` | `B2` | `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B2/levi-highest-weight-convention` | replace | — |
| `B5/classical-bcgp-equivariance` | `B3` | `B3/canonical-and-subcanonical-extensions`, `B3/subcanonical-extension`, `B3/fan-independent-sections` | replace | — |
| `B5/classical-bcgp-equivariance` | `B3.general` | `B3.general/general-boundary-functoriality` | replace | — |
| `B5/classical-bcgp-equivariance` | `B4` | `B4/classical-vb-tate-normalization` | replace | — |
| `B5/classical-siegel-ht-comparison` | `B1` | `B1/hodge-canonical-principal-bundle` | replace | — |
| `B5/classical-siegel-ht-comparison` | `B2` | `B2/etale-coefficient-local-system`, `B2/levi-highest-weight-convention` | replace | — |
| `B5/classical-siegel-ht-comparison` | `B3` | `B3/canonical-and-subcanonical-extensions` | replace | — |
| `B5/classical-siegel-ht-comparison` | `B4` | `B4/siegel-coefficient` | replace | — |
| `B5/cuspidal-siegel-ht-comparison` | `B1` | `B1/hodge-canonical-principal-bundle` | replace | — |
| `B5/cuspidal-siegel-ht-comparison` | `B2` | `B2/etale-coefficient-local-system`, `B2/levi-highest-weight-convention` | replace | — |
| `B5/cuspidal-siegel-ht-comparison` | `B3` | `B3/canonical-and-subcanonical-extensions`, `B3/subcanonical-extension` | replace | — |
| `B5/cuspidal-siegel-ht-comparison` | `B4` | `B4/siegel-coefficient`, `B4/cusp-forms` | replace | — |

In total 19 of the 35 citations are fully answered (one of them needs no node at all), and 16 are answered on the characteristic-zero overlap with a residual. Of the five requests that the B5 packet files with its own roadmap, two are therefore answered: `AutomorphicBundles:B1`, by `B1/hodge-canonical-principal-bundle` and `B1/principal-hecke-pullback` (the pro-Kummer-étale extension of the local system is the separate request to `HodgeTateAndCanonicalSubgroups:T6:comparison`), and `AutomorphicBundles:B3.general`, by `B3.general/general-canonical-extension` (the mixed-boundary identification is the separate request to `ShimuraCompactifications:C3.general`). The other three narrow to the residuals: the request to B2 to R5 and R6, to B3 to R2 and R5, and to B4 to R1 and R6. In the other direction the B0 packet’s request to `AutomorphicBundles:B5` is answered by `B5/classical-siegel-ht-comparison` and `B5/cuspidal-siegel-ht-comparison`.

## Requests filed with this roadmap

Other packets cite this roadmap’s nodes directly (OverconvergentAutomorphicForms O0/O8 cite `B0/hodge-parabolic-convention`, `B0/ineffective-fibre-descent`, `B0/sections-equivariant`, `B2/levi-highest-weight-convention`, `B3.general/general-canonical-extension`, `B4/siegel-coefficient`, `B5/hecke-section-operator`, `B5/hilbert-cusp-expansion`, `B5/hilbert-expansion-principle`, `B5/hilbert-cuspidal-boundary` and `B5/hecke-expansion-compatibility`; all exist). They also file requests with its stages; the nodes that answer them are:

| From | Stage | What is requested | Answered by | What stays open |
|---|---|---|---|---|
| AlgebraicModularFormsAndSerreWeights (`R15.1/logarithmic-kodaira-spencer`) | B3 | Canonical logarithmic extension of the elliptic de Rham bundle and connection at modular cusps | `B3/logarithmic-connection-extension`, `B3/canonical-and-subcanonical-extensions` | The integral modular-curve version over ℤ[1/N] is outside these characteristic-zero nodes |
| AbelianVarietiesIsogenousToNoJacobian (seven T0/A0/I0 nodes) | B4 | Siegel forms, the analytic transformation law and the left-action automorphy-factor cocycle | `B4/siegel-coefficient`, `B4/classical-forms`, `B4/analytic-classical-comparison`, `B4/automorphy-factor-cocycle-and-growth-conditions`, `B4/inverse-base-action-cocycle` | — |
| AbelianVarietiesIsogenousToNoJacobian (five T0/I0 nodes) | B5 | Fourier expansion, coefficient uniqueness, multiplication and boundary/cusp conventions for Siegel forms | `B5/global-fj-expansion`, `B5/fj-injectivity`, `B5/constant-term-restriction`, `B5/cuspidal-boundary-criterion` | Multiplicativity of the expansion and the comparison of the Siegel Fourier–Jacobi expansion with the analytic Fourier expansion over ℂ are not planned (B5 plans the analytic comparison in rank one only) |
| OverconvergentAutomorphicForms O0 (`O0/algebraic-induced-comparison`, `O2/hilbert-algebraic-specialisation`) | B4 | Hilbert differential eigensummands and determinant conventions; algebraic induced Levi associated bundles and their conversion to O1’s convention | `B4/hilbert-coefficient`, `B4/hilbert-arithmetic-weight`, `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B2/levi-highest-weight-convention`, `B0/sections-equivariant` | The comparison with O1’s p-adic torsor, which O0 records as unsupplied |
| OverconvergentAutomorphicForms O0 (`O6/hilbert-q-expansion-comparison`) | B5 | Extension of the Hilbert cusp-expansion, principle and boundary nodes to compactified p-level bounded analytic families | — | Not planned: B5 stops at classical prime-to-p level; the p-level analytic families are the consumer’s objects |
| OverconvergentAutomorphicForms O8 (`O8/supplied-domain-instance`, `O8/bruhat-reduced-family`) | B4 | Analytification of the Siegel Hodge-frame associated bundles; the unitary and other datum-specific canonical coefficients | `B2/automorphic-analytic-comparison`, `B0/geometric-analytic-coefficients`, `B4/siegel-coefficient`, `B4/unitary-coefficient` | Datum-specific coefficients beyond the Siegel and GU(1,1) examples |

## Mistakes found in the sources

The two packets record fourteen mistakes, each confirmed by the part’s independent review. Eleven are in the sources of B0–B4: one misprint in Lan’s introduction, six mistakes in Harris’s 2013 course notes (four errors, one gap and one misprint, scoped to those informal notes and none used as a premise), the incorrect cross-reference and the known Hodge-filtration sign in Milne’s *Canonical models* notes, and two known misprints in the author copy of Deligne’s *Hodge cycles on abelian varieties*. Three are in Lan’s *Arithmetic compactifications* (author revision of 2021), in the Fourier–Jacobi argument B5 follows: a transcription slip in the cone comparison (E6811), the unjustified map between completions along different strata that the common-completion route replaces (E6812), and the reduction from flat modules to filtered unions of free submodules that the prime-filtration route replaces (E6813). The nodes use the corrected statements.

### AutomorphicBundles/E1 — misprint in [LanIntro] (packet B0)

- **Where:** §4.2.7(1), printed p.49, author PDF downloaded 2026-10-06; visually checked at that page
- **Printed:** j(γ′γ,Z)=j(γ′,Z)j(γ,Z)
- **Correction:** j(γ′γ,Z)=j(γ′,γZ)j(γ,Z) for the displayed left action.
- **Reason:** Compose the two frame changes. A point-dependent frame factor u(gx)u(x)⁻¹ obeys the shifted law and generally violates the printed unshifted law. The page image confirms the omitted argument; some web-extracted summaries silently insert it.
- **Affects:** nothing
- **Known:** Existing independently reviewed AutomorphicBundles convention finding (REV-EXT-10/REV-EXT-07, integrated decomposition, September 2026); reverified here, not claimed new
- **Searched:** Reviewed integrated AutomorphicBundles decomposition and its independent-review notes; Lan author PDF p.49, downloaded and visually checked 2026-10-06; Lan author site/search for intro-sh-ex errata, 2026-10-06
- **Verdict:** confirmed (REV-AutomorphicBundles--B0): Confirmed independently on the page image: the second factor is evaluated at the original point and the first at γZ. A nonconstant frame change gives the shifted identity and disproves the printed identity.

### AutomorphicBundles/E2 — error in [HarrisCours8] (packet B0)

- **Where:** p.1, first Lemma, 8logarithmique.pdf course-note author copy accessed 2026-10-06
- **Printed:** Let N ∈ Z, N ≠ 1
- **Correction:** Exclude N=−1 in the power-bound lemma; at N=−1 the primitive can have log|log r| growth. For the applications to growth by some power, use a nonnegative exponent; for rapid decay use a separate corrected estimate.
- **Reason:** Take g(z)=1/(bar(z) log|z|). It satisfies the displayed N=−1 bound, but the circular mean of a solution grows as 2 log(−log r), so no bounded solution (the stated N+1=0 bound) exists. The p.2 estimate also divides by N+1.
- **Affects:** a stated result
- **Known:** new (scoped only to this author course-note copy, not the published Harris–Phong theorem)
- **Searched:** Harris public Cours_2013 copies (4fibres,7torique,8logarithmique), accessed 2026-10-06; Harris annotated errata PDF linked from the Columbia author errata page, accessed 2026-10-06; it corrects the historical higher-dimensional Dolbeault argument but does not list these course-note formulas; Web search for Harris Cours 2013 logarithmique errata, 2026-10-06; no separate course-note correction found
- **Verdict:** confirmed (REV-AutomorphicBundles--B0): Confirmed independently by the punctured-disk circular-mean calculation at N=−1. The primitive has log-log growth, contradicting the asserted exponent-zero bound; the denominator N+1 in the next-page proof identifies the exceptional exponent.

### AutomorphicBundles/E3 — misprint in [HarrisCours8] (packet B0)

- **Where:** p.3, second fine-resolution display, course-note author copy accessed 2026-10-06
- **Printed:** 0 B(−Z)→A_rd^(0,0)(B)→A_si^(0,1)(B)→…→A_si^(0,n)(B)→0
- **Correction:** Use A_rd in every degree in the rapid-decay resolution. The mixed rd/si display is not the claimed resolution.
- **Reason:** On a punctured disk dbar(z)/bar(z) lies in the slowly increasing degree-one term and is closed, but has no rapidly decreasing primitive at zero (its circular-mean primitive is proportional to log r). Hence the displayed degree-one cohomology is nonzero.
- **Affects:** a stated result
- **Known:** new (course-note display only; intended uniform rd notation is clear from the surrounding definition)
- **Searched:** Harris public Cours_2013 copies (4fibres,7torique,8logarithmique), accessed 2026-10-06; Harris annotated errata PDF linked from the Columbia author errata page, accessed 2026-10-06; it corrects the historical higher-dimensional Dolbeault argument but does not list these course-note formulas; Web search for Harris Cours 2013 logarithmique errata, 2026-10-06; no separate course-note correction found
- **Verdict:** confirmed (REV-AutomorphicBundles--B0): Confirmed independently: dbar(z)/bar(z) is a closed slowly increasing one-form with no rapidly decreasing primitive. Using rd in every degree removes this specific mixed-complex counterexample.

### AutomorphicBundles/E4 — error in [HarrisCours8] (packet B0)

- **Where:** p.3, proof of the Corollary immediately before the globalization paragraph, course-note author copy accessed 2026-10-06
- **Printed:** ∂I(g)/∂z = I(∂g/∂z)
- **Correction:** Differentiation of the disk Cauchy–Green operator requires a boundary term or a compact-support/cutoff formulation; include that term before deriving the logarithmic derivative estimates.
- **Reason:** On a disk of radius R, for g(w)=w² the normalized ∂bar solution defined by this disk integral is I(g)=z²bar(z)−R²z. Its z derivative is 2zbar(z)−R², whereas I(2w)=2zbar(z)−2R². Their difference is R². The omitted boundary term is holomorphic but nonzero.
- **Affects:** the proof
- **Known:** new (scoped to the integral identity in this course-note copy; no claim that the intended growth theorem is false)
- **Searched:** Harris public Cours_2013 copies (4fibres,7torique,8logarithmique), accessed 2026-10-06; Harris annotated errata PDF linked from the Columbia author errata page, accessed 2026-10-06; it corrects the historical higher-dimensional Dolbeault argument but does not list these course-note formulas; Web search for Harris Cours 2013 logarithmique errata, 2026-10-06; no separate course-note correction found
- **Verdict:** confirmed (REV-AutomorphicBundles--B0): Confirmed independently by evaluating the disk operator on w² and 2w: differentiating the first differs from the second by R². The boundary contribution must be retained; this does not refute the intended growth theorem.

### AutomorphicBundles/E5 — error in [HarrisCours7] (packet B0)

- **Where:** p.3, paragraph after the affine orthant example, 7torique.pdf course-note author copy accessed 2026-10-06
- **Printed:** By a change of basis, every polyhedral cone can be identified with a face of this σ.
- **Correction:** This holds for the appropriately simplicial cones over a real basis; lattice-basis identification with an orthant face additionally requires regularity. Arbitrary rational polyhedral cones need not be simplicial.
- **Reason:** The three-dimensional rational cone with four extreme rays (1,0,1),(−1,0,1),(0,1,1),(0,−1,1) cannot be carried to a three-dimensional orthant face, which has three extreme rays. Even simplicial integral cones can fail to be unimodular.
- **Affects:** a stated result
- **Known:** new (scoped only to the author course notes; the packet imports actual smooth/refined toric charts from C2/C3 instead)
- **Searched:** Harris public Cours_2013 copies (4fibres,7torique,8logarithmique), accessed 2026-10-06; Harris annotated errata PDF linked from the Columbia author errata page, accessed 2026-10-06; it corrects the historical higher-dimensional Dolbeault argument but does not list these course-note formulas; Web search for Harris Cours 2013 logarithmique errata, 2026-10-06; no separate course-note correction found
- **Verdict:** confirmed (REV-AutomorphicBundles--B0): Confirmed independently: an invertible linear change preserves the four extreme rays of the displayed three-dimensional cone, whereas a three-dimensional orthant face has three. Integral regularity is an additional requirement even for simplicial cones.

### AutomorphicBundles/E6 — error in [HarrisCours4] (packet B0)

- **Where:** p.2, paragraph asserting L² harmonic forms compute ordinary holomorphic cohomology on a complete, possibly noncompact Kähler manifold; 4fibres.pdf author course-note copy
- **Printed:** The paragraph identifies ordinary H^q(M,E) with the L² harmonic space without a compactness or growth hypothesis.
- **Correction:** For this ordinary-cohomology identification restrict to the compact setting, or specify a separate cohomology theory and the exact analytic growth hypotheses. Completeness alone does not imply the displayed identification.
- **Reason:** For the complete finite-area modular curve Γ(N)\H with trivial coefficient, the holomorphic modular function j and its powers give ordinary H⁰ sections. At infinity j grows as q⁻¹, so its squared norm has a divergent integral against y⁻² dx dy. Thus ordinary holomorphic H⁰ contains sections absent from L² H⁰.
- **Affects:** a stated result
- **Known:** new, scoped to this informal course-note statement, not a claim about a correctly stated published L² theorem
- **Searched:** Harris public course-note PDFs and https://www.math.columbia.edu/~harris/MathG6245.htm (which calls its linked notes informal and uncorrected), accessed 2026-10-06; Harris author annotated errata https://www.math.columbia.edu/~harris/website/content/12-errata-publications-list-links-here/errata.pdf, §§13,15,69, accessed 2026-10-06; these course-note statements are not corrected there; Web search for the exact course-note claim and author errata, 2026-10-06; no correction of these particular statements found
- **Verdict:** confirmed (REV-AutomorphicBundles--B0): For the complete finite-area modular curve Γ(N)\H with trivial coefficient, the holomorphic modular function j and its powers give ordinary H⁰ sections. At infinity j grows as q⁻¹, so its squared norm has a divergent integral against y⁻² dx dy. Thus ordinary holomorphic H⁰ contains sections absent from L² H⁰.

### AutomorphicBundles/E7 — gap in [HarrisCours7] (packet B0)

- **Where:** p.4, proof of the smooth toric resolution lemma, paragraph selecting one interior lattice point for all maximal faces; 7torique.pdf author copy
- **Printed:** The proof asks for one interior lattice vector that completes the basis of every maximal face to a lattice basis.
- **Correction:** Use an actual iterative regular subdivision argument. Such a simultaneous interior vector need not exist, even when all proper faces are regular; the resolution theorem itself is not refuted.
- **Reason:** For the cone with primitive rays (1,0),(1,3), all proper faces are regular. An interior integer w=(a,b) completing both rays to positively oriented unimodular pairs would require b=1 and 3a−b=1, hence a=2/3. This is impossible in the lattice.
- **Affects:** the proof
- **Known:** new, scoped to this proof step in the course-note copy
- **Searched:** Harris public course-note PDFs and https://www.math.columbia.edu/~harris/MathG6245.htm (which calls its linked notes informal and uncorrected), accessed 2026-10-06; Harris author annotated errata https://www.math.columbia.edu/~harris/website/content/12-errata-publications-list-links-here/errata.pdf, §§13,15,69, accessed 2026-10-06; these course-note statements are not corrected there; Web search for the exact course-note claim and author errata, 2026-10-06; no correction of these particular statements found
- **Verdict:** confirmed (REV-AutomorphicBundles--B0): For the cone with primitive rays (1,0),(1,3), all proper faces are regular. An interior integer w=(a,b) completing both rays to positively oriented unimodular pairs would require b=1 and 3a−b=1, hence a=2/3. This is impossible in the lattice.

### AutomorphicBundles/E8 — misprint in [Milne90] (packet B0)

- **Where:** III p.62, proof of Theorem 6.2 in the 11 March 2018 author TeX copy
- **Printed:** Theorem 4.4
- **Correction:** The independence-of-normalizing-point reference is Theorem 4.1(b), as also reflected in Remark 4.5. Item 4.4 is an Example, not that theorem.
- **Reason:** The cited item 4.4 lists special classes of Shimura data and does not establish independence of the comparison from the special point. Theorem 4.1(b) explicitly gives that independence.
- **Affects:** nothing
- **Known:** new pointer correction scoped to the 2018 author copy; no assertion about the original typeset article
- **Searched:** Milne author copy, III pp.59–62, read 2026-10-06; https://www.jmilne.org/math/xnotes/AA.html and https://www.jmilne.org/math/xnotes/errata.html, accessed 2026-10-06; no correction of this pointer found; Web search for the Theorem 6.2/4.4 pointer, 2026-10-06
- **Verdict:** confirmed (REV-AutomorphicBundles--B0): The cited item 4.4 lists special classes of Shimura data and does not establish independence of the comparison from the special point. Theorem 4.1(b) explicitly gives that independence.

### AutomorphicBundles/E9 — misprint in [Milne90] (packet B0)

- **Where:** p.9, Hodge-filtration sign in the 2018 Automorphic vector bundles author copy
- **Printed:** The filtration is attributed to μ without reversing the cocharacter.
- **Correction:** Use −μ in the filtration convention identified by the author erratum. The packet fixes μ_h(z)=h_C(z,1), with action z^(−p), and uses P(μ_h⁻¹) for the descending Hodge filtration.
- **Reason:** The author explicitly records this sign correction; the descending filtration stabilizer with the packet’s cohomological exponent is P(μ_h⁻¹). It is not the opposite Hodge–Tate parabolic.
- **Affects:** nothing
- **Known:** known author erratum, not a new discovery
- **Searched:** https://www.jmilne.org/math/xnotes/errata.html, Automorphic vector bundles entry, read 2026-10-06; 2018 author copy p.9, independently read 2026-10-06
- **Verdict:** confirmed (REV-AutomorphicBundles--B0): The author explicitly records this sign correction; the descending filtration stabilizer with the packet’s cohomological exponent is P(μ_h⁻¹). It is not the opposite Hodge–Tate parabolic.

### AutomorphicBundles/E10 — misprint in [Deligne82] (packet B0)

- **Where:** 2018 author TeX copy p.23, Remark 3.2(a), second paragraph; original typeset article p.23
- **Printed:** The second paragraph mistakenly uses G-fixed tensors and arbitrary G representations to describe H′.
- **Correction:** H′ fixes the H-fixed tensors in subquotients of the specified tensor spaces T^(m,n), and the relevant conclusion is H=H′. Use the corrected paragraph; merely replacing one letter while retaining the arbitrary-G-representation claim is insufficient.
- **Reason:** The author’s erratum supplies exactly this replacement and states that the original typeset article was correct. The reductive tensor-stabilizer claim used by the packet is Proposition 3.1, with its reductivity hypotheses, not the misprinted stronger paragraph.
- **Affects:** nothing
- **Known:** known author-TeX-copy misprint; original typeset article correct according to the author
- **Searched:** https://www.jmilne.org/math/articles/1982a.html, author corrections, read 2026-10-06; 2018 PDF pp.22–23, independently read 2026-10-06
- **Verdict:** confirmed (REV-AutomorphicBundles--B0): The author’s erratum supplies exactly this replacement and states that the original typeset article was correct. The reductive tensor-stabilizer claim used by the packet is Proposition 3.1, with its reductivity hypotheses, not the misprinted stronger paragraph.

### AutomorphicBundles/E11 — misprint in [Deligne82] (packet B0)

- **Where:** 2018 author TeX copy p.24, Tate object in the Mumford–Tate definition; author erratum identifies the original article p.26, bottom of first paragraph
- **Printed:** The G_m coordinate ν acts on Q(1) by its inverse.
- **Correction:** Replace the inverse by the standard ν action, as the author directs. Keep cohomological Tate weights distinct from the separate similitude-coordinate convention.
- **Reason:** The author explicitly corrects ν⁻¹ to ν at this definition. Already the scalar ν=2 distinguishes the two one-dimensional actions. The packet uses the corrected Tate normalization and never derives it from the erroneous sentence.
- **Affects:** nothing
- **Known:** known author erratum; printed-page and current-copy-page locations differ
- **Searched:** https://www.jmilne.org/math/articles/1982a.html, author corrections, read 2026-10-06; 2018 author PDF p.24, independently read 2026-10-06
- **Verdict:** confirmed (REV-AutomorphicBundles--B0): The author explicitly corrects ν⁻¹ to ν at this definition. Already the scalar ν=2 distinguishes the two one-dimensional actions. The packet uses the corrected Tate normalization and never derives it from the erroneous sentence.

### AutomorphicBundles/E6811 — misprint in [LanPEL] (packet B5)

- **Where:** Author revision of 14 March 2021, printed p. 536, displayed section morphism and subsequent vanishing sentence after Remark 7.1.2.5; rendered PDF page index 563
- **Printed:** σ₂^∨ − σ₁^∨
- **Correction:** The new degrees requiring zero coefficients are sigma1-dual minus sigma2-dual, and it is the sigma1 expansion whose coefficients there vanish. In the displayed section morphism, each quotient stabilizer subscript must match its own cone, rather than interchanging sigma1 and sigma2.
- **Reason:** The preceding line correctly states sigma2-dual contained in sigma1-dual, so the printed difference is empty and cannot impose the asserted support restriction. Matching a chart with its own stabilizer also follows directly from the preceding morphism's labels. These are transcription corrections only: they do not repair the separate completion issue E6812. The publisher edition was not inspected, so no finding against that edition is made.
- **Affects:** the proof
- **Known:** No correction located in the author-hosted 14 March 2021 errata, items 71-77; novelty and the publisher edition remain unverified.
- **Searched:** Author-hosted errata https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf, especially all listed corrections for 7.1.2; The currently served author revision and its cover date, https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf; Web searches for Lan arithmetic compactifications errata returned no additional relevant primary correction; the attempted publications.html page was unavailable
- **Verdict:** confirmed (REV-AutomorphicBundles--B5): Confirmed in the inspected 14 March 2021 author revision at printed p.536, including the displayed stabilizer labels. Dual inclusion makes the printed difference empty; the extra sigma1 degrees must instead vanish. This confirms a transcription error in that version, without certifying the publisher edition or novelty.

### AutomorphicBundles/E6812 — gap in [LanPEL] (packet B5)

- **Where:** Author revision of 14 March 2021, printed p. 536, passage from the toric open embedding to the morphism of formal stratum charts after Remark 7.1.2.5
- **Printed:** canonical morphism
- **Correction:** Supply an actual continuous formal-chart comparison or compare the images of a common boundary-completed section. The open embedding of ordinary charts alone does not construct a morphism between their completions along different strata. The revised cone node requests the common-completion construction rather than assuming the displayed direct morphism.
- **Reason:** For a smooth quadrant cone and a ray face, the relevant completions are k[[x,y]] and k[y,y^-1][[x]]. A coordinate-preserving ring homomorphism from the first to the second would carry the unit 1-y to a nonunit: constant-x coefficient followed by y=1 proves noninvertibility in the target. Thus the generic toric inference used in the passage is invalid. This is a gap in that inference, not a counterexample to the global Fourier-Jacobi support theorem or an assertion that this affine example alone realizes every PEL hypothesis. The common completion defined on p. 482 is a candidate repair whose required geometric maps remain to be proved.
- **Affects:** the proof
- **Known:** No correction located in the author-hosted errata inspected; no claim of novelty or of an error in an uninspected publisher edition.
- **Searched:** Author-hosted revised thesis, common completion before (6.2.5.22), Remarks 6.2.5.30-6.2.5.31 and 7.1.2 cone comparison; Author-hosted 14 March 2021 errata, items 71-77; Web searches for an additional primary correction were inconclusive
- **Verdict:** confirmed (REV-AutomorphicBundles--B5): Confirmed as a gap in the generic inference at the stated locator. Ordinary face localization does not preserve the unit 1-y between the two different stratum completions; the coordinate-preserving direct map is therefore unavailable in the example. This tests the inference, not all PEL hypotheses or the final support theorem. The common-boundary-completion repair remains an explicit owner obligation.

### AutomorphicBundles/E6813 — gap in [LanPEL] (packet B5)

- **Where:** Author revision of 14 March 2021, proof of Lemma 7.1.1.4, printed p. 533, PDF page index 560
- **Printed:** its free submodules
- **Correction:** For the finitely generated projective summand already obtained in the proof, split a finite free surjection and pass the natural cohomology comparison to that direct summand. Alternatively use a filtered colimit of finite free modules with general transition maps, not a filtered union of free submodules. The prime-filtration argument in this packet is a separate repair for injectivity, not a replacement proof of all refinement cohomology.
- **Reason:** Flatness alone does not express a module as a filtered union of free submodules. A finitely generated module equal to such a directed union would be one of those submodules: put its finite generating set in a common member. It would therefore be free. A nonprincipal invertible ideal in a Dedekind domain is finite projective but not free. The source notation allows an infinite set of retained primes, so semilocality cannot simply be read into the standing notation. This tests the generic algebra inference, not a constructed PEL counterexample: no claim is made here that a particular nonprincipal ideal has been realized for a chosen PEL datum, or that Lemma 7.1.1.4 or the final expansion principle is false. A separately proved freeness hypothesis for a particular base would also repair that case.
- **Affects:** the proof
- **Known:** No correction located in the author-hosted 14 March 2021 errata. This is an independently confirmed, version-scoped proof-wording finding; novelty and the publisher edition are unverified.
- **Searched:** Rendered author-revision p. 533 and its coefficient-reduction context; parsed notation p. xxv and good-prime convention 1.4.1.1; Full author-hosted errata searched for 7.1.1 and free; no relevant correction found; Web queries for Lan, 7.1.1.4, free submodules and errata found no additional relevant primary correction; Stacks tag 00NX, finite-projective direct-summand statement and proof, read as the proposed repair
- **Verdict:** confirmed (REV-AutomorphicBundles--B5): Confirmed as an unsupported generic algebra reduction at printed p.533. A finite module that is a directed union of free submodules would itself be free, whereas a nonprincipal invertible Dedekind ideal is finite projective. The source’s retained-prime notation does not impose a finite semilocal localization. The finite-projective direct-summand repair is valid; this verdict does not assert a realized PEL counterexample or falsity of the final lemma.

## Gaps

The packets record 24 gaps; the assembly adds one. Each names the missing input and the nodes that need it. They are the remaining work of the roadmap; no gap is papered over by a stage citation.

### Gaps recorded in packet B0

#### Generic algebraic associated-bundle interface has no nominated stage

The campaign nominates ReductiveGroupsPartII for principal algebraic G torsors, contracted products, G-equivariant bundle descent, pullback and exact tensor/dual functoriality. Its current RG2.0–RG2.5 stages cover different targets and contain no such stage. Add an explicitly assigned extension stage rather than duplicating that construction here. QCoh fpqc descent alone does not construct representable principal/associated bundles. Analytic torsor pullback and analytification compatibility must be matched to this interface.

Needed by: `B0/compact-dual-coefficient`, `B0/homogeneous-hodge-torsor`, `B0/analytic-coefficient`, `B0/sections-equivariant`, `B0/geometric-analytic-coefficients`, `B1/tensor-frame-torsor`, `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B2/coefficient-tensor-hecke`, `B2.general/general-associated-model`.

#### Reductive algebraic group interfaces beyond the current supplier scope

Needed are the precise central Z_s torus and quotient universal property, algebraic frame/stabilizer representability, characteristic-zero Chevalley tensor realization and semisimplicity, and general algebraic Levi highest-weight/dual classification over splitting fields. Upstream ClassicalGroups supplies the complex classical Schur/highest-weight cases, not all Q-groups, nonsplit descent or integral Schur sheaves. These extensions belong in the reductive/representation direction, not as private automorphic replacements.

Needed by: `B0/central-split-quotient`, `B1/finite-tensor-stabilizer`, `B1/tensor-frame-torsor`, `B1/embedding-independence`, `B2/levi-highest-weight-convention`, `B4/siegel-coefficient`, `B2/siegel-tautological-sequence`.

#### Absolute-Hodge foundation and CM proof refinement

Deligne 2018 author copy Main Theorem 2.11, Principles B and Proposition 6.1 were read. The CM proof through Principles A, split Weil classes and the character computation of §§3–5 was not decomposed in this target pass. A4 supplies degree-one comparisons, not the absolute-cycle theorem. Refine the absoluteHodgePropagation node with the absolute-cycle carrier, CM-case theorem and the deformation/generation proof before calling B1 closed.

Needed by: `B1/absolute-hodge-propagation`, `B1/hodge-tensor-realizations`, `B1/tensor-frame-torsor`.

#### Period torsor and continuous principal-bundle descent

V4/V7 provide CM reciprocity and canonical variety descent, not a complete typed Taniyama/period torsor or effective descent of a principal scheme with connection. Specify the period torsor and normalized CM restriction, full-tower induction, continuity and effectivity of the bundle descent datum. Harris’s annotated errata acknowledges continuity in the historical Aut(C) argument; a cocycle alone is insufficient.

Needed by: `B1/cm-principal-normalization`, `B1/hodge-canonical-principal-bundle`, `B1/abelian-canonical-principal-bundle`, `B1.general/connected-principal-conjugation`, `B1.general/general-principal-model`, `B1.general/general-conjugation-cocycle`, `B2.general/general-realization-conjugation`.

#### The second-jet injection and general principal reduction

Milne connected §§3,7,9 were read. Generic second-jet bundles and their equivariant functoriality are not assigned to a current supplier stage, and Lemma 9.4 refers to the corrected Harris 1985 jet injection. Supply that faithful order-two realization and the principal-automorphism argument of Lemmas 9.1–9.3; V7 is requested for the actual generating rank-one subdata, not assumed to prove the bundle step. In addition to §9.5 algebraic-group generation, §9.2 needs generation of G(Q) by the specified special tori and the auxiliary extension/local-isotropy/simplicity argument for the rank-one rational quotients. Footnote 14 does not establish the stronger §8.1 rational-point generation statement; no proof here may rely on it.

Needed by: `B1.general/adjoint-jet-realization`, `B1.general/general-connected-reduction`, `B1.general/connected-principal-conjugation`.

#### Full-group local-system and filtered-connection descent interfaces

Construct or import the actual arithmetic quotient local system, continuous ℓ-adic lattice descent on the canonical coefficient tower, filtered algebraic connection descent and the tensor-compatible analytic horizontal-section comparison. Degree-one abelian A4 comparisons handle the family case but do not by themselves state these general associated-representation interfaces. Keep rational Betti weight and coefficient-group hypotheses explicit.

Needed by: `B2/betti-coefficient-local-system`, `B2/etale-coefficient-local-system`, `B2/filtered-de-rham-coefficient`, `B2/realization-comparison`, `B2.general/general-flat-realizations`, `B2.general/general-realization-conjugation`.

#### The ineffective arithmetic centre beyond finite tame quotients

R09.5’s finite/tame coarse-space statements do not alone prove descent through an infinite arithmetic central kernel. Give the analytic effective quotient and algebraic coefficient-group compatibility, proving that the fibre action is trivial on that kernel. Use H0/H3/H4 for the Hilbert groups; do not infer this from neatness.

Needed by: `B0/ineffective-fibre-descent`, `B0/analytic-coefficient`, `B4/hilbert-central-descent`.

#### Canonical extension proof and logarithmic boundary dictionary

Milne V §6 states the exact canonical extension functor and rationality; HLTT B.8 gives the semi-abelian frame model. The complete Deligne–Harris local analytic construction, chart transition/gluing, general-data extension without abelian degenerations, regular singularity/unipotence and zero-exponent logarithmic comparison still need declaration-sized refinements. No current generic regular-singular connection supplier stage was found. Integral PEL extensions remain conditional on C5’s specific good-base coefficients.

Needed by: `B3/boundary-coefficient-chart`, `B3/canonical-and-subcanonical-extensions`, `B3/canonical-extension-gluing`, `B3/logarithmic-connection-extension`, `B3/canonical-rational-descent`, `B3.general/general-canonical-extension`, `B3.general/general-logarithmic-comparison`.

#### Coherent geometric section foundations and local analytic growth

The pin contains Scheme.Modules and its presheaf/pushforward/global-section operations, freshly read, but the exact proper coherent finiteness/base-change, locally free tensor/ideal dictionary and holomorphic logarithmic-growth removable-singularity/coordinatewise vanishing interfaces need suppliers/refinement. A section comparison does not follow from ordinary GAGA on the open Shimura variety. The course-note full Dolbeault resolutions were not used to close this chain.

Needed by: `B3/subcanonical-extension`, `B3/minimal-coherent-pushforward`, `B4/classical-forms`, `B4/cusp-forms`, `B4/analytic-classical-comparison`, `B4/number-field-forms-base-change`.

#### BCGP analytic/solid and rational Hodge–Tate coefficient comparison

BCGP v1 §§3.2.19,4.5 and 4.8 were read. The finite-dimensional algebraic tautological sequence is planned here. Its embedding into the solid analytic category and the rational Hodge–Tate M-torsor/VB functor are separately supplied inputs to classicalVBTateNormalization. T2/T6 consume B1–B3; reversing those dependencies would make a cycle. Refine the downstream comparison interface and rationality/Tate normalization (BCGP p.78 cites RC22 Theorem 4.2.1) before claiming the complete p-adic comparison. No infinite-dimensional category is rebuilt here.

Needed by: `B2/siegel-tautological-sequence`, `B4/classical-vb-tate-normalization`, `B4/siegel-coefficient`.

#### Added AG source: integral CM étale extension is outside the generic owner

AG §3.3 constructs lisse coefficients on the specific CM integral stack Y_K[1/ℓ] using its finite étale integral ℓ-level tower; its extension is stronger than the generic-fibre coefficient in B2. The reviewed paper extraction marks this extension missing. Assign/import the CM torus integral tower and finite étale model before adding the integral extension theorem; do not silently attribute it to generic Shimura B2 or to all-prime models.

Needed by: `B2/etale-coefficient-local-system`.

#### Typed geometric signatures need the actual supplier carriers

At the pins no canonical Shimura torsor/compact-dual automorphic coefficient/toroidal canonical extension carrier was found. The suggested file therefore contains the precise named mathematical contracts for these declarations, APIs and tests in comments, not fabricated Prop axioms or arbitrary scheme surrogates. Functional normalized factors, the SlashAction adapter, arithmetic Hilbert weights and global sections of a supplied Scheme.Modules coefficient are typed. The geometric contracts and their test signatures must be elaborated once the named supplier interfaces exist. This is explicitly open, not evidence that the geometric suggested signatures compiled.

Needed by: `B0/central-split-quotient`, `B0/ineffective-fibre-descent`, `B0/hodge-parabolic-convention`, `B0/compact-dual-coefficient`, `B0/homogeneous-hodge-torsor`, `B0/analytic-coefficient`, `B0/sections-equivariant`, `B0/coefficient-galois-descent`, `B0/geometric-analytic-coefficients`, `B1/finite-tensor-stabilizer`, `B1/absolute-hodge-propagation`, `B1/hodge-tensor-realizations`, `B1/tensor-frame-torsor`, `B1/filtration-reduction`, `B1/hodge-canonical-principal-bundle`, `B1/embedding-independence`, `B1/cm-principal-normalization`, `B1/abelian-canonical-principal-bundle`, `B1/principal-hecke-pullback`, `B1.general/connected-principal-conjugation`, `B1.general/adjoint-jet-realization`, `B1.general/general-connected-reduction`, `B1.general/general-principal-model`, `B1.general/general-compact-dual-map`, `B1.general/general-conjugation-cocycle`, `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B2/automorphic-analytic-comparison`, `B2/levi-highest-weight-convention`, `B2/betti-coefficient-local-system`, `B2/etale-coefficient-local-system`, `B2/filtered-de-rham-coefficient`, `B2/realization-comparison`, `B2/coefficient-tensor-hecke`, `B2.general/general-associated-model`, `B2.general/general-flat-realizations`, `B2.general/general-realization-conjugation`, `B3/boundary-coefficient-chart`, `B3/canonical-and-subcanonical-extensions`, `B3/canonical-extension-gluing`, `B3/subcanonical-extension`, `B3/refinement-canonical-extension`, `B3/fan-independent-sections`, `B3/logarithmic-connection-extension`, `B3/minimal-coherent-pushforward`, `B3/minimal-hodge-line-comparison`, `B3/canonical-rational-descent`, `B3.general/general-canonical-extension`, `B3.general/general-logarithmic-comparison`, `B3.general/general-boundary-functoriality`, `B4/cusp-forms`, `B4/analytic-classical-comparison`, `B4/gl2-hodge-line-comparison`, `B4/hilbert-coefficient`, `B4/hilbert-central-descent`, `B4/unsplit-hilbert-descent`, `B4/siegel-coefficient`, `B4/unitary-coefficient`, `B4/number-field-forms-base-change`, `B2/siegel-tautological-sequence`, `B4/classical-vb-tate-normalization`.

### Gaps recorded in packet B5

#### Residue-fiber detection after coefficient reduction

The existing ShimuraCompactifications:C5/neat-strata-detect-geometric-components node, with its four boundary-intersection/closure prerequisites in the C0 packet, supplies the precise planned neat-level geometric detection contract. Retain its regular Noetherian base, good-prime, neat and fan/no-self-intersection hypotheses; the supplier is partial and unchecked. The generic smooth-closure/finite-etale-Stein argument remains owned by SF.1. At non-neat level the proper branch or stack/level-change construction and its component coverage remain open. The finite-thickening algebra comparison is explicit, but the actual formal-chart coefficient maps and descent still must be identified with it. These are concrete remaining leaves, not a claim that the source theorem is implemented.

Needed by: `B5/fj-injectivity-cyclic`, `B5/fj-injectivity`, `B5/coefficient-recognition`.

#### C5 has an early toroidal and a late minimal endpoint

The current C5 README combines toroidal construction with minimal compactification. B5 consumes only the early chart theorem, while Lan 7.2.3 uses B5's constant-term theorem for the minimal boundary factorization. An accepted module/stage split is needed; no full cross-roadmap acyclicity claim is made. The arithmetic-base Stein factor in the residue-component proof is not the Shimura minimal compactification and does not use the late positivity theorem.

Needed by: `B5/local-fj-expansion`, `B5/cone-compatibility`, `B5/constant-term-restriction`.

#### Coefficient pushforward and boundary exactness

Prove the coefficient expression on the lower-dimensional base using the precise projection/base-change theorem, and prove exactness of the relative boundary sequence with the chosen M. The torsor-section definition avoids assuming the former; the AF left-exactness lemma does not prove the separate boundary tensor sequence.

Needed by: `B5/fj-coefficient-module`, `B5/cuspidal-boundary-criterion`.

#### Common formal chart and coefficient comparison

The preceding checkpoint resolved rendering and rejected the generic direct map between different stratum completions by the k[x,y] unit obstruction. Still needed are C4/early-C5's common Mumford-family chart mapping to the toroidal model, and C0/F0's homogeneous boundary ideal, continuous maps to the individual completions, separated degree projections and coefficient-compatible descent. Corrected indices alone do not close this node. The ordinary scheme completion-map construction is now imported through the exact F0/completion-of-morphism node; its application to the actual charts, homogeneous coefficients and stack descent remain open.

Needed by: `B5/cone-compatibility`.

#### Actual geometric suggested-file carriers

The suggested file retains the compiled algebraic regression layer and adds actual Scheme.Modules/affine tilde section-map prototypes and explicit weight calculations where the pinned carriers suffice. It does not fabricate Shimura stacks, completed Mumford families, fractional Hilbert positive-index series or logarithmic cohomology. Full geometric definitions, their API and geometric tests require the specified B1–B4, C0–C6, F0 and T6 carrier imports. Each omitted signature is named in the file. Algebraic compilation is not closure of these targets.

Needed by: `B5/fj-coefficient-module`, `B5/local-fj-expansion`, `B5/cone-compatibility`, `B5/global-fj-expansion`, `B5/fj-refinement`, `B5/constant-term-restriction`, `B5/coefficient-naturality`, `B5/coefficient-sequence-exact`, `B5/fj-target-left-exact`, `B5/fj-injectivity-cyclic`, `B5/fj-injectivity-extension`, `B5/fj-injectivity-finite`, `B5/fj-injectivity`, `B5/coefficient-recognition`, `B5/cuspidal-boundary-criterion`, `B5/hecke-section-operator`, `B5/hecke-convolution`, `B5/non-neat-hecke-descent`, `B5/modular-expansion-comparison`, `B5/vector-fj-expansion`, `B5/vector-expansion-principle`, `B5/hilbert-cusp-expansion`, `B5/hilbert-expansion-principle`, `B5/hilbert-cuspidal-boundary`, `B5/hecke-expansion-compatibility`, `B5/classical-bcgp-equivariance`, `B5/classical-siegel-ht-comparison`, `B5/cuspidal-siegel-ht-comparison`.

#### Finite-projective trace and toroidal Hecke refinement

Establish SF.0’s local-to-global coefficient trace and its base-change/transitivity laws, then B3/C3’s extension through proper toric refinements and boundary ideals. Read and compare actual coefficient/isogeny cocycles and ν against the inverse/right-coset convention. A geometric action is not supplied by analytic ModularForm.trace or SF.2’s duality counit.

Needed by: `B5/hecke-section-operator`, `B5/hecke-convolution`, `B5/non-neat-hecke-descent`, `B5/hecke-expansion-compatibility`.

#### Refined correspondences and non-neat action

AA.4/hecke-cartesian has the additional product hypothesis U′L=U. An arbitrary normal neat cover does not make the needed square Cartesian, nor identify its g-double-coset with the original one. Supply the actual common refinement/Mackey decomposition and stack descent; never average or assert exactness of invariants.

Needed by: `B5/hecke-convolution`, `B5/non-neat-hecke-descent`.

#### General-data Fourier–Jacobi source interface

The inspected Milne VII.4.1 explicitly states the general mixed-boundary formal identity as a conjecture and singles out the proven Siegel case. C3.general/B3.general must supply a proven formal boundary/coefficient comparison in the exact characteristic-zero generality used. Lan Higher Proposition 5.6 supplies the good-prime PEL vector case; it does not prove an all-prime general integral version.

Needed by: `B5/vector-fj-expansion`, `B5/vector-expansion-principle`.

#### Ramified Hilbert charts and component detection

C6/H2/H3 must identify the actual ramified splitting-model cusp completion and weight line, unit action and determinant components, and verify the coefficient/fibre-detection argument in Proposition 6.2.1. Diamond’s prime-to-p statement is retained, while general Iwahori component coverage is explicitly false. The printed §6.2 proof cites Rapoport 1978 Theorem 6.7; that underlying proof has not been read in this pass.

Needed by: `B5/hilbert-cusp-expansion`, `B5/hilbert-expansion-principle`, `B5/hilbert-cuspidal-boundary`, `B5/hecke-expansion-compatibility`.

#### Pending higher Coleman coefficient supplier

BCGP’s VB and VB^0 carriers and finite-dimensional descent are routed to the existing pending HigherHidaAndColemanTheory design from Pilloni20/BCGP25. It has no assigned atlas stage here. Do not invent an id or rebuild the derived/analytic coefficient functor in B5; request its finite-dimensional interface once design assigns stages. T6 supplies the foundational logarithmic comparison. The Part II proposal is recorded in restructure.

Needed by: `B5/classical-bcgp-equivariance`.

#### Classical BGG and FC90 comparison proof

BCGP Theorem 4.8.2 states the full ordinary and compact-support decompositions and quotes Faltings–Chai 1990 Theorem 6.2. That underlying proof, the exact logarithmic/compact-support definitions and degeneration/Hecke functoriality inputs have not been independently read here. The four-weight calculation is explicit, but it is not the decomposition proof. Upstream LieHighestWeight expressly excludes full BGG; its already proposed LieHighestWeightPartIICompletedCategoryO is the candidate supplier for the dual BGG/Kostant input, pending a designed exact stage. No such stage is invented.

Needed by: `B5/classical-siegel-ht-comparison`, `B5/cuspidal-siegel-ht-comparison`.

#### Cross-roadmap early/late stage validation

The local packet node graph is acyclic. The existing C5 stage combines toroidal inputs with the minimal endpoint consuming B5, so the requested early/late split must be approved before whole-atlas stage-DAG closure can be certified. General-data, Hilbert and T6 comparisons retain their exact supplier directions; no claim is made that the pending coefficient/BGG designs already have validated stages.

Needed by: `B5/hecke-section-operator`, `B5/vector-fj-expansion`, `B5/hilbert-cusp-expansion`, `B5/classical-bcgp-equivariance`.

### Gap found at assembly

#### Integral coefficient interfaces that B5 needs from B2–B4

The roadmap’s completion condition asks for classical forms over the specified integral PEL and Hilbert models, and the B5 packet works with them throughout, through its requests to `AutomorphicBundles:B2`, `AutomorphicBundles:B3` and `AutomorphicBundles:B4`. The B0 packet plans B2–B4 over characteristic-zero coefficient fields; only `B3/boundary-coefficient-chart`, `B3/canonical-and-subcanonical-extensions` and `B3/subcanonical-extension` carry a good-prime PEL clause through ShimuraCompactifications C5. Four interfaces are therefore planned by no node:

- **R1 (B4).** The integral section functor: AF(k,M) = Γ(X, ω_tor^k ⊗_R M) on Lan’s good-prime PEL toroidal model and Γ(X, Ecan(W) ⊗_R M) for a finite projective Levi representation W, for every R-module M, with its cuspidal version Γ(X, ω_tor^k(−D) ⊗_R M), its module-map functoriality and the qcqs section/filtered-colimit compatibility (Stacks 0GQZ); and the identification of these modules with geometric forms of determinant weight. `B4/classical-forms` and `B4/cusp-forms` are the field case.
- **R2 (B3).** The coefficient-sensitive comparison of section modules along fan refinements and compactified Hecke maps for an arbitrary coefficient module, torsion included, with finite projective summands handled through splittings of finite free modules (Stacks 00NX) and the toric direct-image theorem, and the transport of the reduced-boundary ideal under θ_g. `B3/refinement-canonical-extension`, `B3/fan-independent-sections` and `B3.general/general-boundary-functoriality` are the coefficient-free field case.
- **R5 (B2/B3).** Finite projective integral Levi representations W over the good-prime base, their bundles Ecan(W) and Esub(W), the Hecke isomorphism θ_g with its cocycle, and the boundary bundle E0(W) on the abelian torsor of a cusp chart whose pullback to the Mumford family is Ecan(W) (Lan, Higher Koecher’s principle, Proposition 5.6); no filtration on the torsor is assumed to descend to its quotient. `B2/automorphic-vector-bundles-from-representations-of-the-centralizer`, `B3/canonical-and-subcanonical-extensions` and `B3/boundary-coefficient-chart` are the field case.
- **R6 (B2/B4, with H2/C6).** Diamond’s automorphic line A_{(k,m)} on the ramified splitting model over Noetherian O-algebras, for pairs (k,m) with χ_{k+2m} trivial on O_F^× ∩ U and with dual powers, its minimal pushforward j_*A (coherent, not locally free) and its boundary identification with D_{(k,m),c}. `B4/hilbert-arithmetic-weight`, `B4/hilbert-coefficient`, `B4/unsplit-hilbert-descent` and `B3/minimal-coherent-pushforward` are the characteristic-zero arithmetic-weight case.

Needed by: `B5/fj-refinement` (R2), `B5/coefficient-sequence-exact` (R1), `B5/fj-injectivity` (R1), `B5/cuspidal-boundary-criterion` (R1), `B5/hecke-section-operator` (R1, R2, R5), `B5/vector-fj-expansion` (R1, R5), `B5/vector-expansion-principle` (R1, R5), `B5/hilbert-cusp-expansion` (R6), `B5/hilbert-cuspidal-boundary` (R6). The owner is this roadmap: R1 and R6 are B4 targets by the completion condition, R2 is B3’s refinement target with coefficients, and R5 is B2/B3’s representation realization over the integral model. The integral Hodge line and degenerations themselves stay with ShimuraCompactifications C5 and C6, and higher integral coherent cohomology with the Part II roadmap.

## Requests

The packets file 50 requests: 31 from the B0 packet and 19 from the B5 packet. Six of them are addressed to this roadmap’s own stages (one from B0 to B5, five from B5 to B1–B4); *Cross-part prerequisites* shows which are answered. The rest name the supplier stage of another roadmap, the precise statement needed and the consuming nodes.

### Requests in packet B0

| Supplier | What is needed | Needed by |
|---|---|---|
| `AlgebraicModuliForArithmeticGeometry:R09.5` | In characteristic zero, vector bundles on tame finite quotient/coarse moduli charts descend iff all geometric stabilizers act trivially on fibres; give the effective quotient and pullback equivalence, with the finite/tame hypotheses. | `B0/ineffective-fibre-descent` |
| `ComplexComparisonPartII:C0` | Analytification of algebraic module/torsor descent maps and compatibility of finite locally free associated coefficients with analytification on the open base. This request does not assert essential surjectivity/GAGA for arbitrary nonproper spaces. | `B0/geometric-analytic-coefficients` |
| `AbelianSchemesAndArithmeticModuli:A4` | For the actual universal abelian schemes, locally free relative H¹dR with Hodge exact sequence and Gauss–Manin connection, Betti/Tate homology duals and tensor/Tate-compatible relative degree-one comparisons, with base-change hypotheses. | `B1/absolute-hodge-propagation`, `B1/hodge-tensor-realizations`, `B2/filtered-de-rham-coefficient`, `B2/realization-comparison`, `B4/siegel-coefficient` |
| `PELModuli:M0` | The actual symplectic and GU(1,1) PEL data, their standard representations and compact-dual filtration types, including similitude/Tate line and labelled imaginary-quadratic embeddings. | `B4/unitary-coefficient`, `B2/siegel-tautological-sequence` |
| `PELModuli:M3` | Fine-level universal abelian families and their analytic uniformization over the canonical generic field; moduli realizations for the chosen Siegel/unitary/Hodge embedding, not arbitrary-prime integral models. | `B1/hodge-tensor-realizations`, `B4/siegel-coefficient`, `B4/unitary-coefficient` |
| `PELModuli:M5` | The explicit Siegel and split GU(1,1) example: rank-g Hodge bundle for Siegel; rank-two H_τ and rank-one ω_τ for signature (1,1), with the specified polarizations and labelled dual/twist conventions. | `B4/siegel-coefficient`, `B4/unitary-coefficient` |
| `ShimuraVarieties:V1` | The analytic double-quotient tower, level changes and Hecke translations, with actual subgroup/effective-deck-action hypotheses and composition laws. Canonical algebraic finite étale maps over the number field are requested separately from V8; V3 is Borel algebraicity/uniqueness, not the tower owner. | `B1/principal-hecke-pullback`, `B2/etale-coefficient-local-system` |
| `ShimuraVarieties:V4` | CM special-point/reflex-norm reciprocity with an explicit Artin convention and the canonical special-point normalization; do not replace the period torsor by a chosen rational frame. | `B1/hodge-canonical-principal-bundle`, `B1/cm-principal-normalization` |
| `ShimuraVarieties:V5` | Canonical Siegel/PEL model and its actual universal family, comparison of the analytic family with the fine-level moduli model. | `B1/hodge-tensor-realizations` |
| `ShimuraVarieties:V6` | Connected/nonconnected equivalence and central-isogeny/finite-component quotient descent for Hodge/abelian-type canonical varieties; the torsor and absolute-Hodge moduli theorem are owned here. | `B1/abelian-canonical-principal-bundle` |
| `ShimuraVarieties:V7` | Actual general conjugate connected data/varieties, auxiliary totally real and CM extensions, type-A1 subdata and algebraic-group generation (Milne connected §9.5). For the §9.2 rational-point reduction supply generation by special tori together with the prescribed auxiliary local-isotropy and simplicity input; do not assume the stronger unproved §8.1 rational-point generation. Supply normalized variety comparisons, independence of special point and continuous effective variety descent, not a principal-bundle axiom. | `B1.general/connected-principal-conjugation`, `B1.general/adjoint-jet-realization`, `B1.general/general-connected-reduction`, `B1.general/general-principal-model`, `B1.general/general-conjugation-cocycle` |
| `ShimuraVarieties:V8` | The canonical finite étale arithmetic level tower over the reflex field for the indicated Hodge/abelian-type class, with actual deck action, Hecke maps and compatibility with V1; also the canonical model of the V2 minimal compactification used by the restricted B3 pushforward. Hodge tensor descent uses this tower to check arithmetic Galois invariance. General-data claims require the separate V8.general supplier. | `B1/hodge-tensor-realizations`, `B1/principal-hecke-pullback`, `B2/etale-coefficient-local-system`, `B3/minimal-coherent-pushforward` |
| `ShimuraVarieties:V8.general` | The general-data canonical full tower over E, compatible with the connected reduction, CM normalization, component induction and finite étale level maps. | `B1.general/general-principal-model`, `B2.general/general-flat-realizations` |
| `ShimuraVarieties:V2` | The Baily–Borel complex algebraic open and normal projective minimal compactification with actual datum/level hypotheses. V8 supplies its number-field canonical model and C2 the proper toroidal-to-minimal map. C1 owns rational boundary mixed data, not this minimal object. | `B3/minimal-coherent-pushforward` |
| `ShimuraCompactifications:C2` | The actual smooth characteristic-zero toroidal gluing for neat effective level/smooth fan; properness and projectivity for a projective admissible fan; reduced Cartier SNC boundary, arithmetic overlap maps and the proper map to the minimal model over the reflex field. | `B3/canonical-and-subcanonical-extensions`, `B3/canonical-extension-gluing`, `B3/subcanonical-extension`, `B3/minimal-coherent-pushforward`, `B3/canonical-rational-descent` |
| `ShimuraCompactifications:C3` | Refinement maps, composition/common refinements, f_*O=O, compatible extended datum/Hecke maps; additionally f_*I_(D′red)=I_(Dred) for the smooth toric boundary refinement charts and descended toroidal maps. No arbitrary subcanonical pullback equality or higher-direct-image vanishing is requested. | `B3/refinement-canonical-extension`, `B3/fan-independent-sections` |
| `ShimuraCompactifications:C4` | Actual semi-abelian/1-motive degeneration families and filtered/graded tensor-compatible Lie/Hodge modules on cusp charts, with transition/effectivity, polarization/endomorphism compatibility and relative du/u distinct from base dq/q. | `B3/boundary-coefficient-chart`, `B3/canonical-extension-gluing` |
| `ShimuraCompactifications:C5` | Good-base integral PEL degeneration/compactification charts and locally free Hodge modules; positive Hodge line, graded-section finite generation, sufficiently divisible minimal invertible line and proper toroidal-to-minimal map. Preserve the source good-prime hypotheses. | `B3/boundary-coefficient-chart`, `B3/minimal-hodge-line-comparison` |
| `ShimuraCompactifications:C6` | The Hilbert and modular degeneration specialization, its actual unit quotient and semi-abelian Hodge module, including the separately stated ramified/Rapoport hypotheses; scalar Koecher extension does not imply cuspidality. | `B3/minimal-hodge-line-comparison` |
| `ShimuraCompactifications:C2.general` | Actual general-data characteristic-zero toroidal gluing/descent, rational cusp charts and reduced boundary. No missing general-data universal abelian family or all-prime integral model is assumed. | `B3.general/general-canonical-extension`, `B3.general/general-logarithmic-comparison` |
| `ShimuraCompactifications:C3.general` | General-data refinement/common-refinement and compatible boundary/Hecke maps, including transported fans under conjugation; import the C3 degree-zero boundary-ideal comparison with its hypotheses. | `B3.general/general-boundary-functoriality` |
| `ComplexComparisonPartII:C2` | Projective coherent GAGA on the actual proper smooth projective complex toroidal model, comparing global sections of canonical and reduced-boundary coefficients. It is not applied to the nonproper Shimura open. | `B4/analytic-classical-comparison` |
| `AlgebraicModularFormsAndSerreWeights:R15.1` | The actual modular Hodge line/cusp ideal, proper generalized-elliptic model, geometric form spaces and analytic comparison at all cusps, including stabilizer descent at small levels. Only the GL2 specialization comparison is owned here. | `B4/gl2-hodge-line-comparison` |
| `HilbertModularVarietiesAndShimuraCurves:H0` | The actual Res(F/Q)GL2 versus G* datum, centre/effective quotient, reflex field and embedding permutation conventions. | `B4/hilbert-central-descent` |
| `HilbertModularVarietiesAndShimuraCurves:H1` | The actual O_F-linear HB family and unsplit O_F⊗O Hodge/de Rham modules, polarization structures and rank conditions. | `B4/hilbert-coefficient`, `B4/unsplit-hilbert-descent` |
| `HilbertModularVarietiesAndShimuraCurves:H2` | Rapoport-locus local freeness (rank one over O_F⊗O) and precise ramified integral hypotheses; no split decomposition or smoothness of the whole ramified model is assumed. | `B3/minimal-hodge-line-comparison`, `B4/hilbert-coefficient`, `B4/unsplit-hilbert-descent` |
| `HilbertModularVarietiesAndShimuraCurves:H3` | The precise finite polarization/unit quotient Δ(N) preserving the moduli problem, with its actual action on the HB family. | `B4/hilbert-central-descent` |
| `HilbertModularVarietiesAndShimuraCurves:H4` | Full G/G* central level kernels, ineffective unit action, and the stabilizers at the selected effective level. | `B4/hilbert-central-descent` |
| `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-2-the-weyl-construction-via-young-symmetrizers` | The GL_n(C)-equivariant Schur image, extreme symmetric/exterior cases and natural tensor/coefficient action. Its general-number-field and integral locally free sheaf extension is an explicit separate gap, not silently included in this complex theorem. | `B4/siegel-coefficient` |
| `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-3-maximal-torus-weights-and-the-highest-weight-classification` | Highest-weight and determinant-twist classification for the classical complex matrix groups, including the central character and dual highest weight; general nonsplit Levi representations require the separate descent interface. | `B2/levi-highest-weight-convention` |
| `AutomorphicBundles:B5` | For BCGP v1 §4.8.2 (p.101), GSp4, d=3, dominant κ=(k1,k2;w) with 0≥k1≥k2 and the stated parity, prove H^i_proKummer-et(Shtor_KpK^p,Vκ∨,Kp)⊗C_p=⊕_{j=0}^3 H^{i−j}(Shtor_KpK^p,ω^{κ_j})(−a_j), κ_j=(k1,k2;−w),(2−k1,k2;−w),(3−k2,k1+1;−w),(3−k2,3−k1;−w), and 2a_j=k1+k2+w,2−k1+k2+w,4−k2+k1+w,6−k1−k2+w. Prove the parallel compact-support/cuspidal statement with ω^{κ_j}(−D_red). Preserve the untwisted §4.8 coherent convention; do not count the §4.5 κ(μ) twist twice. This is a downstream consumer request; it is outside the prerequisites of the supplied coefficients. The local system and the proper toroidal/logarithmic space are exactly those in §4.8; any conversion to étale cohomology of the open must be a separately justified comparison, not a change of notation. | — |

### Requests in packet B5

| Supplier | What is needed | Needed by |
|---|---|---|
| `ShimuraCompactifications:C0` | The same character lattice and admissible fan carrier, dual-cone inclusions, relative character-graded torus-embedding algebra and stratum ideal, incidence chains in the positive cone, and common refinements. For cone comparison: identify the ideal J of the union of positive-cone strata on each ordinary toric chart, show it is character-homogeneous, and export its quotient degree projections and their separated inverse-limit coefficient map. Show that the maps from this common boundary completion to each completed section ring preserve existing degrees and introduce no new ones. This is NOT an assertion that a completed algebra equals an unrestricted product. No competing fan type. Reuse the existing C0/relative-face-open node for the ordinary face immersion, under its torsor, lattice and face-localization hypotheses; its statement explicitly does not give a map between different stratum completions. | `B5/fj-coefficient-module`, `B5/local-fj-expansion`, `B5/cone-compatibility`, `B5/constant-term-restriction` |
| `ShimuraCompactifications:C1` | Actual cusp labels, full stabilizers, R-linear actions on degrees and coefficient sheaves, finite cover M_Phi and its quotient M_Z. The coefficient maps must intertwine these actions. Do not identify the cover with the quotient or assume the latter is a scheme. | `B5/global-fj-expansion`, `B5/constant-term-restriction`, `B5/fj-target-left-exact` |
| `ShimuraCompactifications:C3` | Compatible refinement maps, universal-family pullback and common-refinement comparison, with the coefficient-sensitive section comparison supplied separately by B3. A fixed fan is not assumed stable under every Hecke map. Include compactified Hecke maps factored through compatible finite-flat level maps and proper toric refinements, the refined/Mackey fibre-product decomposition, boundary ideal transport and completed coefficient trace compatibility. An arbitrary toroidal Hecke map is not assumed finite flat. | `B5/fj-refinement`, `B5/hecke-section-operator`, `B5/non-neat-hecke-descent`, `B5/hecke-expansion-compatibility` |
| `ShimuraCompactifications:C4` | The actual abelian and torus torsors, graded invertible sheaves, Raynaud extension and invariant-differential determinant comparison, equivariant Mumford-family charts and their boundary ideals. Prove R-flatness of the abelian torsor and invertibility of each character-Hodge coefficient line on a flat atlas. Construct the family on the common boundary completion of Lan (6.2.5.22), with pullback to each individual stratum completion and compatible Hodge identifications. Prove the compatibility by the degeneration construction and descent; do not manufacture a map between differently completed face charts. The elliptic comparison distinguishes du/u from dq/q. | `B5/fj-coefficient-module`, `B5/local-fj-expansion`, `B5/cone-compatibility`, `B5/global-fj-expansion`, `B5/constant-term-restriction`, `B5/fj-target-left-exact`, `B5/cuspidal-boundary-criterion`, `B5/vector-fj-expansion`, `B5/hecke-expansion-compatibility` |
| `ShimuraCompactifications:C5` | Only the EARLY good-prime toroidal model and formal completion theorem of Lan 6.4.1.1, with smoothness, R-flatness and actual residue-base-change chart comparisons. For neat-level residue-component detection, reuse the existing exact node ShimuraCompactifications:C5/neat-strata-detect-geometric-components in the C0 packet and its neat-boundary-intersection-smooth, neat-boundary-open-fiberwise-dense, neat-stratum-closure-component and neat-stratum-closure-proper prerequisites. Preserve their good-prime, regular-base, neat and fan/no-self-intersection hypotheses. This contract is planned, with the supplier still partial; do not re-plan the theorem in B5. For non-neat level, supply the actual branch normalization/stack or level-change construction, its properness and fiberwise coverage, and descent; do not assume inverse images of chosen strata detect all components of a neat cover. Also identify the finite-thickening coefficient comparisons with the actual Mumford chart maps. Construct the common formal Mumford chart's morphism to the toroidal model, with restrictions giving the individual formal-chart maps and the same Hodge section. Separate all this from C5's LATE integral minimal compactification, which consumes B5 constant terms in Lan 7.2.3. The Stein factor used for component detection is over the arithmetic base, not that minimal compactification. | `B5/fj-coefficient-module`, `B5/local-fj-expansion`, `B5/cone-compatibility`, `B5/coefficient-sequence-exact`, `B5/fj-target-left-exact`, `B5/fj-injectivity-cyclic`, `B5/fj-injectivity`, `B5/cuspidal-boundary-criterion` |
| `AdicSpacesPartII:F0` | Formal completion of the actual coherent coefficient sheaves, separated graded coefficient extraction and functoriality under coefficient maps. For R to S=R/p, first construct natural isomorphisms (P/I^(n+1)P) tensor_R S = P_S/I_S^(n+1)P_S on each actual affine chart, compatible with n, localization, Hodge trivialization and descent. Define the comparison of completed coefficient sheaves from the inverse systems; do not justify it by an unproved tensor/inverse-limit interchange. Coordinate SF.0 for the generic quotient-tensor statement and C5 for the actual family, ideals and degree maps. Local separatedness for a finite stalk at a proper ideal is supplied directly by pinned Mathlib. The exact existing node completion-detects-near-closed supplies the ordinary locally Noetherian scheme/coherent-sheaf detection step. What remains is the identification of the actual chart sheaf and the SF.1 flat-atlas/stack transport of this conclusion. The prime-filtration route does not require a separate completion-faithfulness theorem on every R/p^n model. For locally Noetherian scheme charts, reuse the exact existing completion-of-morphism node for maps with the actual ideal-containment data. For the common-chart comparison, still identify those maps on the real charts, commute homogeneous degree projections with them and prove coefficient-compatible descent; the scheme construction alone does not provide stack descent. An ordinary open immersion does not by itself give a map between different stratum completions. | `B5/local-fj-expansion`, `B5/cone-compatibility`, `B5/coefficient-naturality`, `B5/fj-injectivity-cyclic` |
| `SchemeAndStackFoundations:SF.0` | Generic quasi-coherent tensor operations, preservation of coefficient injections by an R-flat sheaf, left exactness of sections, and sheaf identification under closed base change R to R/p. Tensor products commute with filtered colimits. Supply the quotient-tensor isomorphism at each finite ideal thickening used by F0, with transition compatibility, not a blanket inverse-limit assertion. For the SF.1 component-detection proof, supply regularity under a smooth morphism to a regular base, openness of smooth morphisms, closedness of proper morphisms, and the relative normal-crossing coordinate intersection and fiberwise-density facts. These are generic inputs, not newly defined B5 carriers; no assertion that global sections commute with arbitrary base change is included. Also supply the finite locally free algebra/sheaf trace by finite-free localization and descent, its projection formula, transitivity and base change, compatible with arbitrary allowed coefficient M. The pinned basis trace is a local input, not this sheaf theorem. | `B5/coefficient-sequence-exact`, `B5/fj-target-left-exact`, `B5/fj-injectivity-cyclic`, `B5/fj-injectivity`, `B5/hecke-section-operator`, `B5/hecke-convolution` |
| `SchemeAndStackFoundations:SF.1` | Effective flat-atlas descent for quasi-coherent coefficient sheaves, exactness and vanishing checks, and the qcqs-stack section/filtered-colimit comparison (Stacks 0GQZ with G=O_X), coordinating SF.2 for the generic site theorem. Add the precise algebraic-space component interface: a smooth proper X over a regular Noetherian base has a finite etale Stein factor E and X to E is proper surjective with connected geometric fibers (Stacks 76.36.1, 76.36.4, 76.36.9). Coordinate SF.2 for proper coherent cohomology/formal functions used by its proof. For finitely many smooth proper closed W_a in X and opens Z_a fiberwise dense in W_a, prove that meeting every total irreducible component by the Z_a implies meeting every geometric-fiber component: W_a to E is smooth and proper, its clopen image covers components of E, and fiberwise density reaches the corresponding fibers. The reader gives the complete generic argument. This is an owner theorem to implement once, not a private Shimura construction; do not extend this algebraic-space statement to non-neat stacks without an actual descent theorem. Carry the open zero locus and componentwise density argument through the actual atlas. Include equivariant canonical/subcanonical stack sections as the descent equalizer on normal neat covers, with no averaging even when the group order is zero in R. Transport the actual refined Hecke correspondence, not a naive restriction of one fine-level operator. | `B5/coefficient-sequence-exact`, `B5/fj-target-left-exact`, `B5/fj-injectivity-cyclic`, `B5/fj-injectivity`, `B5/non-neat-hecke-descent`, `B5/vector-expansion-principle`, `B5/hilbert-expansion-principle` |
| `AutomorphicBundles:B3` | The actual locally free Hodge extension, subcanonical boundary ideal sequence with its coefficient exactness conditions, and the coefficient-sensitive section comparison under fan refinements. The latter must handle finite projective summands by splitting from finite free modules (Stacks 00NX) and torsion reductions with the correct toric direct-image theorem, not by an unsupported filtered union of free submodules. Include finite-dimensional Ecan(W) and Esub(W), their coefficient-sensitive fan comparison, θ_g and boundary ideal transports, and the actual vector-bundle/torsor instance of Lan Higher Proposition 5.6. No filtration on C is assumed to descend to C/Γ. | `B5/coefficient-sequence-exact`, `B5/fj-refinement`, `B5/cuspidal-boundary-criterion`, `B5/fj-coefficient-module`, `B5/local-fj-expansion`, `B5/hecke-section-operator`, `B5/vector-fj-expansion`, `B5/vector-expansion-principle`, `B5/hilbert-cusp-expansion`, `B5/hilbert-cuspidal-boundary`, `B5/classical-bcgp-equivariance`, `B5/classical-siegel-ht-comparison`, `B5/cuspidal-siegel-ht-comparison` |
| `AutomorphicBundles:B4` | The actual coefficient functor AF(k,M)=Gamma(X,omega_tor^k tensor_R M), its module-map functoriality and identification with geometric determinant-weight forms. Specialize the SF.0/SF.1 section theorem to directed unions of finite coefficient submodules. This does not identify AF(k,R) tensor M with AF(k,M) for arbitrary M. Include all finite-dimensional classical section modules and their coefficient functoriality, the Hilbert (k,m) weight conventions and the smooth finite-level cohomology comparison interface; no unconditional Γ(E)⊗M base-change assertion. | `B5/coefficient-sequence-exact`, `B5/fj-injectivity`, `B5/fj-coefficient-module`, `B5/cuspidal-boundary-criterion`, `B5/hecke-section-operator`, `B5/vector-fj-expansion`, `B5/vector-expansion-principle`, `B5/hilbert-cusp-expansion`, `B5/classical-bcgp-equivariance`, `B5/classical-siegel-ht-comparison`, `B5/cuspidal-siegel-ht-comparison` |
| `AutomorphicBundles:B1` | The actual canonical principal bundle and canonical pro-Kummer-étale local system for the finite-dimensional algebraic representation, with Hecke/Galois conventions. B5 consumes the routed BCGP comparison, not the AGHMP or Caraiani–Scholze B0–B2 realizations themselves. | `B5/classical-bcgp-equivariance`, `B5/classical-siegel-ht-comparison`, `B5/cuspidal-siegel-ht-comparison` |
| `AutomorphicBundles:B2` | Finite-projective algebraic Levi representation realization, the equivariant θ_g isomorphism and its cocycle; the boundary parabolic/Raynaud E0(W) bundle of Lan Higher Proposition 5.6; embedding-indexed Hilbert weight lines including dual powers. General representation theory and bundle formation stay here. | `B5/hecke-section-operator`, `B5/vector-fj-expansion`, `B5/hilbert-cusp-expansion`, `B5/classical-bcgp-equivariance`, `B5/classical-siegel-ht-comparison`, `B5/cuspidal-siegel-ht-comparison` |
| `AutomorphicBundles:B3.general` | The actual general-data canonical vector-bundle extension and boundary coefficient identification in characteristic zero. No all-prime non-PEL integral statement is required. | `B5/vector-fj-expansion`, `B5/classical-bcgp-equivariance` |
| `ShimuraCompactifications:C3.general` | The actual mixed-boundary formal isomorphism and finite-dimensional coefficient transport for general characteristic-zero toroidal models, compatible with refinements and Hecke maps. Milne VII.4.1 describes this as a conjecture in the inspected notes; supply a proven precise interface and its source. | `B5/vector-fj-expansion`, `B5/classical-bcgp-equivariance` |
| `ShimuraCompactifications:C6` | Diamond’s prime-to-p Hilbert toroidal/minimal cusp charts over the ramified splitting model, fractional lattice d^-1 I^-1 J and unit action; the exact component/fibre detection used in Proposition 6.2.1, canonical/subcanonical boundary ideal and completed prime-to-p Hecke maps. Preserve the Iwahori failure warning. The existing C6/hilbert-q-expansion-comparison, C6/hilbert-q-expansion-module-injective, C6/hilbert-q-expansion-injective, C6/hilbert-q-expansion-coefficient-descent and C6/hilbert-boundary-constant-term nodes in the C0 packet cover the Dimitrov tame, discriminant-inverted overlap. Reuse them there. Their tame smooth-model hypotheses do not supply Diamond’s full ramified/p=2 weight-(k,m) statement; the request here is precisely that extension and its transports. | `B5/hilbert-cusp-expansion`, `B5/hilbert-expansion-principle`, `B5/hilbert-cuspidal-boundary`, `B5/hecke-expansion-compatibility` |
| `HilbertModularVarietiesAndShimuraCurves:H2` | The actual ramified Pappas–Rapoport splitting model and coefficient-base-change comparison needed by Diamond §§2 and 6. Do not infer smoothness of the whole Deligne–Pappas model or cusp coverage of arbitrary Iwahori special fibres. | `B5/hilbert-cusp-expansion`, `B5/hilbert-expansion-principle` |
| `HilbertModularVarietiesAndShimuraCurves:H3` | Arithmetic Hilbert cusp representative, embedding-weight character and polarization/unit transports, plus the determinant-component identification. Use Diamond’s level convention instead of silently substituting the BHW unit quotient formula. | `B5/hilbert-cusp-expansion`, `B5/hilbert-expansion-principle` |
| `HodgeTateAndCanonicalSubgroups:T6:comparison` | Finite-dimensional canonical local-system/logarithmic de Rham and Hodge–Tate comparison, including its compact-support/subcanonical boundary version, tensor/Tate normalization and Hecke/Galois functoriality. Supply actual cohomology carriers and the degeneration/comparison hypotheses required by the classical FC90 theorem, without importing downstream B5 into the foundational comparison. | `B5/classical-bcgp-equivariance`, `B5/classical-siegel-ht-comparison`, `B5/cuspidal-siegel-ht-comparison` |
| `SchemeAndStackFoundations:SF.2` | Actual coherent cohomology and level-colimit comparisons for finite-dimensional classical coefficients, including boundary twists; coordinate the compact-support/duality input with T6. Its existing proper-duality counit trace is not ordinary finite-projective algebra trace. | `B5/classical-bcgp-equivariance`, `B5/classical-siegel-ht-comparison`, `B5/cuspidal-siegel-ht-comparison` |

Requests to the same supplier stage from the two packets are compatible and do not overlap in substance: ShimuraCompactifications C3 is asked by B0 for refinement maps with f_*O = O and the reduced-ideal pushforward, and by B5 for compactified Hecke maps, the refined Mackey decomposition and completed trace compatibility; C4 by B0 for the degeneration families and filtered Lie/Hodge modules, and by B5 for the abelian and torus torsors, the Mumford family on the common boundary completion and the Raynaud determinant comparison; C5 by B0 for the good-base integral charts, positive Hodge line and minimal map, and by B5 for the early toroidal model and formal completion only; C6 by B0 for the Hilbert and modular degeneration specialization and its unit quotient, and by B5 for Diamond’s ramified prime-to-p charts, lattice and component detection; Hilbert H2 and H3 by both for the ramified splitting model and the cusp/unit data; and C3.general by both for the general-data boundary maps (B0) and mixed-boundary formal isomorphism (B5).

## Structural proposals

The packets make four proposals, recorded here as they stand:

- **rescope** (`ReductiveGroupsPartII`, `AutomorphicBundles`; packet B0). AutomorphicBundles B0 names a generic associated algebraic bundle supplier, but none of ReductiveGroupsPartII RG2.0–RG2.5 contains principal torsors/contracted products. Current torus quotient and algebraic tensor-frame interfaces also need explicit assignment. *Proposal:* Add an explicitly scoped extension stage in the reductive-group direction for representable principal algebraic torsors, associated finite locally free bundles and their exact tensor/dual/pullback/analytification descent API. Keep compact-dual coefficients, canonical Shimura principal models, realization comparison and boundary extensions in AutomorphicBundles. Assign central quotient and generic representation refinements before accepting the B0 structural closure. No new stage ID is invented in this packet.
- **split** (`ShimuraCompactifications`; packet B5). C5 contains early good-prime toroidal charts consumed by B5 and the late minimal endpoint whose proof consumes B5 constant terms. *Proposal:* Keep the current scope and references during this pass. Split C5 into an early toroidal/model/formal-chart interface and a late arithmetic minimal-compactification endpoint; early C5 precedes B3/B5, while late C5 consumes B5/constant-term-restriction. Do not confuse the arithmetic-base Stein factor with the minimal compactification.
- **rescope** (`AutomorphicBundles`, `PadicFamilies`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight`; packet B5). B5 owns the classical finite-dimensional comparison targets routed from BCGP; it consumes the full VB and BGG machinery, which existing pending proposals already own. *Proposal:* Coalesce the existing HigherHidaAndColemanTheory proposal as the higher Coleman/Hida Part II direction, importing finite-dimensional bundles from B1–B5. Reuse the existing proposed LieHighestWeightPartIICompletedCategoryO, extending upstream LieHighestWeight beyond its explicit BGG exclusion, for the dual BGG/Kostant input. Assign exact supplier stages in those design jobs; B5 retains only the classical comparisons and records carrier/proof gaps until then. No new roadmap is defined by this packet.
- **split** (`AutomorphicBundles`; packet B5). B5 now contains scalar/vector Fourier–Jacobi theory, geometric Hecke action, modular/Hilbert specialization and routed classical Siegel comparison. *Proposal:* For atlas presentation subdivide B5 into Fourier–Jacobi coefficients and expansion principle (the fifteen preserved nodes plus vector-fj-expansion/vector-expansion-principle), Geometric Hecke action (hecke-section-operator/hecke-convolution/non-neat-hecke-descent/hecke-expansion-compatibility), Modular and Hilbert comparisons (modular-expansion-comparison and the three hilbert nodes), and Classical cohomological comparisons (classical-bcgp-equivariance and the two siegel-ht nodes). The current packet keeps exactly AutomorphicBundles:B5 in scope and six planets; no stage id is changed here.

The assembly adds two observations, neither of which changes a stage:

- **One statement owned twice.** BCGP’s 4.5-classical comparison is stated by both `B4/classical-vb-tate-normalization` and `B5/classical-bcgp-equivariance`. B4 owns it; the B5 node should import it and keep its cohomological, cuspidal, Hecke and refinement additions (see the Assembly notes on both nodes).
- **B5 display.** The document shows B5 in five groups that refine the packet’s four proposed sub-layers: the vector Fourier–Jacobi nodes are shown with the modular comparison, between the Hecke action and the Hilbert expansions, because that is their packet order and `B5/hilbert-cusp-expansion` imports `B5/vector-fj-expansion`; the Hecke action on coefficients is shown with the Hilbert nodes it specializes to. For the atlas, the packet’s four sub-layers stand.

## Notes on other roadmaps

The B0 packet records three notes for the maintainer; the B5 packet records none.

- `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups` (packet B0): The read complex Schur/highest-weight stages are genuine suppliers for complex classical coefficients. They do not yet state arbitrary coefficient-field, nonsplit Levi or integral locally free sheaf generalizations; those are explicit extension gaps, not edits to upstream.
- `ReductiveGroupsPartII` (packet B0): The current six-stage text was read; the associated-bundle supplier named by the AutomorphicBundles campaign has no covering stage. See the rescope proposal.
- `ShimuraVarieties` (packet B0): V6 explicitly assigns the absolute-Hodge moduli interpretation to the automorphic-bundle owner. B1 follows that ownership; V7 supplies the variety-level rank-one reduction, while the principal-bundle jet proof is owned here.

## Paper items routed to this roadmap

The accepted extraction of Boxer–Calegari–Gee–Pilloni, *Modularity theorems for abelian surfaces* (PAPER-BOXER-CALEGARI-GEE-PILLONI-25), routes four items to B1–B5: the Siegel tautological sequence (3.2.19), the classical bundles under VB (4.5-classical), and the two displays of Theorem 4.8.2. The first two are planned in the B0 packet; the Theorem 4.8.2 displays are the B5 nodes `B5/classical-siegel-ht-comparison` and `B5/cuspidal-siegel-ht-comparison`, and 4.5-classical is also restated in `B5/classical-bcgp-equivariance`. Andreatta–Goren–Howard–Madapusi Pera and Caraiani–Scholze items are planned in B1 and B2. The B0 packet’s record of where each routed item is planned:

- `PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/betti-system` → `B2/betti-coefficient-local-system`, `B2/realization-comparison`. Generic representation-valued construction applies to the torus; the generic Betti construction is rational; the ℓ-adic input retains its specified integral lattice.
- `PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/ell-system` → `B2/etale-coefficient-local-system`, `B2/realization-comparison`. Generic-fibre comparison is covered; integral Y_K[1/ℓ] tower extension remains the explicit CM supplier gap.
- `PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/dr-descent` → `B1/tensor-frame-torsor`, `B1/embedding-independence`, `B2/filtered-de-rham-coefficient`. Includes E-linear full-group coefficient descent; filtered Q-representation conclusion is separate. No integral dR extension is inferred.
- `PAPER-CARAIANI-SCHOLZE-17/128` → `B1/finite-tensor-stabilizer`, `B1/hodge-tensor-realizations`, `B1/tensor-frame-torsor`, `B1/filtration-reduction`. The finite tensor stabilizer theorem is explicitly owned by B1, as the routing requires.
- `PAPER-BOXER-CALEGARI-GEE-PILLONI-25/3.2.19-tautological` → `B2/siegel-tautological-sequence`, `B4/siegel-coefficient`. Finite-dimensional algebraic coefficient and exact sequence here; analytic/solid comparison remains an explicit interface gap.
- `PAPER-BOXER-CALEGARI-GEE-PILLONI-25/4.5-classical` → `B4/classical-vb-tate-normalization`. The exact κ(μ) Tate normalization is planned conditional on the separately constructed rational Hodge–Tate torsor and VB functor.
- `PAPER-BOXER-CALEGARI-GEE-PILLONI-25/4.8.2-usual` → `B4/siegel-coefficient`, `B4/classical-vb-tate-normalization`. The untwisted classical coefficients are supplied here. Higher étale/coherent Hodge–Tate decomposition is a precise B5 request, outside this part.
- `PAPER-BOXER-CALEGARI-GEE-PILLONI-25/4.8.2-cusp` → `B3/subcanonical-extension`, `B4/cusp-forms`. The reduced-boundary coefficient is supplied here. Compact-support/coherent comparison is requested from B5, not claimed as an H0 theorem.

## Dependencies between the layers

Inside the roadmap the layers form the chain B0 → B1 → B2 → B3 → B4 → B5, with the general-data branch B1 → B1.general → B2.general → B3.general beside it, joined by B2 → B2.general and B3 → B3.general and feeding B4 (`B4/classical-forms` uses `B3.general/general-canonical-extension` and `B3.general/general-boundary-functoriality`) and B5 (`B5/vector-fj-expansion`, `B5/classical-bcgp-equivariance`). At node level every edge points from a layer to one at or after it in this order, and the B0 packet never points into B5. Every node’s prerequisite chain ends in a pinned Mathlib or Tau Ceti declaration, a node of another blueprint, a requested stage of another roadmap or a recorded gap.

Across roadmaps the graph is acyclic at node level. At stage level one cycle is latent and recorded: ShimuraCompactifications C5 combines the early good-prime toroidal model that B3 and B5 consume with the late minimal-compactification endpoint whose proof (Lan 7.2.3) consumes `B5/constant-term-restriction`. The B5 packet proposes splitting C5 into an early and a late stage; until that split, B5 cites only the early theorem and its exact neat-level node, and the B0 packet cites C5 for the good-base charts, positive Hodge line and minimal map.

## What this blueprint does not claim

- Nothing here is formalized. Every node has `implementationStatus` `unchecked`, and the suggested Lean file is a naming proposal whose geometric declarations are named contracts in comments, not elaborated signatures (the gap *Typed geometric signatures need the actual supplier carriers* in the B0 packet and *Actual geometric suggested-file carriers* in the B5 packet).
- No layer is closed. All nine are planned at target level, with the remaining work listed under each layer and in *Gaps*.
- The integral PEL and Hilbert section modules are not yet planned by a node (assembly gap).
- Characteristic-zero statements are not extended to integral models or to all primes, and integral statements are not extended beyond Lan’s good-prime PEL setting or Diamond’s prime-to-p level.
- Arbitrary Hodge classes are not identified with algebraic cycles, and no universal family of motives is posited for general data.
- The underlying proofs that the B5 sources quote (Rapoport 1978, Theorem 6.7; Faltings–Chai 1990, Theorem 6.2) are not read, and the general mixed-boundary Fourier–Jacobi identity is a conjecture in Milne’s notes, not a theorem used here.
- The source findings are scoped to the versions read; their novelty against publisher editions not inspected is not asserted.
