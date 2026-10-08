# Arithmetic locally symmetric spaces and their cohomology

This is the definitive reader for the roadmap `ArithmeticLocallySymmetricSpaces`, covering ALS.0–ALS.6 and the early prefix ALS.5:finite-level-duality. The [packet](../packets/ArithmeticLocallySymmetricSpaces.json) specifies its 66 targets, prerequisite chains, sources, APIs, tests and planets. The [suggested file](../suggested/ArithmeticLocallySymmetricSpaces.lean) supplies available generic signatures and a named inventory of the signatures whose earlier interfaces are missing. All targets have implementation status unchecked.

## Purpose and ownership

For a connected reductive group G over a number field F, this roadmap constructs the real symmetric space, the arithmetic quotients X_K and their coefficient systems, the Borel–Serre compactification, and ordinary, compactly supported and boundary cohomology complexes. It equips the complexes with finite-level Hecke correspondences and traces, computes boundary strata, proves finite-level duality and descent, and compares characteristic-zero cohomology with automorphic forms. These constructions supply IntegralHeckeAndGaloisDeterminants, TorsionCohomologyInfrastructure, PotentialAutomorphyInfrastructure, CompletedCohomologyPartII, IgusaVarietiesAndTorsionConcentration, BorelRegulators and ShimuraVarieties.

Accepted RS-09~2 governs the boundary between these roadmaps. ALS.6 exports finite-level descent, refinement maps and finite-cover Hochschild–Serre. CC.0/CC.1 assemble level systems; CC.2 owns completed and derived limits, CC.4 completed chain models and CC.7 completed boundary triangles. The present plan has no CompletedCohomologyPartII prerequisite. Caraiani–Newton Proposition 2.1.3 and Lemmas 2.1.4–2.1.5 supply finite-level comparisons here; completed cohomology at a set of p-adic places and Lemmas 2.1.7–2.1.9 belong to their completed owners. The legacy node identifier ALS.6/tower-acceptance-tests is retained for its finite-cover acceptance examples.

AdelicAlgebraicGroups supplies adelic arithmetic, rational parabolics, reduction theory, level quotients and neat refinements. Tau Ceti's LieGroups roadmap supplies the general Lie geometry. AdditiveCombinatorics AC.3 owns nilmanifold carriers, rational Mal'cev data and filtered nilmanifolds; ALS.2 applies that carrier to Borel–Serre fibres. SmoothRepresentationsOfLocalGroups owns Haar convolution, parabolic induction, modulus and Satake transforms. AF.1a owns the requested absolute Lie-cochain/Kostant prefix alongside its relative-cochain and invariant-form interface; AF.1 imports that prefix, and AS.4/AS.5 the spectral and automorphic comparisons. Galois attachment is imported with its exact hypotheses, including the torsion-Galois hypothesis in Newton–Thorne; it is not proved by an Eisenstein-boundary argument.

## Conventions that determine the constructions

Write 𝐆=Res_{F/ℚ}G, F_∞=F⊗ℚℝ and A_∞=A_𝐆(ℝ)°, where A_𝐆 is the maximal ℚ-split central torus. A Cartan involution determines K_∞, and

X^G=G(F_∞)/(K_∞A_∞),  X_K=G(F)\(X^G×G(𝔸_F^∞)/K).

The split centre is removed once. The connected-compact variant G(F_∞)/(K_∞°A_∞) retains the real-component covering used by Scholze. Quotients use all real components: GL₂(ℝ) acts on the upper half-plane by a holomorphic fractional linear transformation for positive determinant and an antiholomorphic one for negative determinant. A full GL₂ quotient must retain its real-component invariants in automorphic comparisons.

Right translation is r_g:X_{gKg⁻¹}→X_K, [x,h]↦[x,hg]. Thus r_g after r_h is r_{hg}, with its indicated source level. Level maps use K′⊂K. The arithmetic group on the g-component is Γ_{g,K}=G(F)∩gKg⁻¹. Arithmetic properness comes directly from Borel–Serre Theorem 9.3 and reduction theory, before the neat refinement. Discreteness in the full archimedean group does not by itself prove projected discreteness after the split-centre quotient.

The torsion-free criterion for proper arithmetic actions supplies free quotients at neat level. The rational-intersection notion supplied by AA.4 suffices for that consequence. Pink's stronger all-adelic-element convention requires its own comparison; the two conventions are not identified merely by the word neat. Neatness also does not imply orientability for every reductive group: the explicit PGL₂ example below has negative orientation character.

For a coefficient ring R, V has commuting G(F) and K_S actions. On a g-component the coefficient representation is

ρ_Γ(γ)=ρ_{G(F)}(γ)ρ_{K_S}((g⁻¹γg)_S).

There is no inverse on just its K_S factor. Fix a lifted loop from x₀ to δ(ℓ)x₀. Tau Ceti multiplies loops by g*h=h followed by g, so δ maps to Γᵐᵒᵖ and monodromy is ρ_Γ(δ(ℓ)⁻¹), the inverse of the entire slice representation. Noncommuting upper and lower unipotent matrices detect the order error. The Type-valued covering classification and R-linear fundamental-groupoid functors already exist; identifying them with the arithmetic sheaf descent is a separate comparison.

At arbitrary level choose a neat normal K₀⊂K, put Q=K/K₀ and Y=X_{K₀}. Form equivariant ordinary, extension-by-zero and boundary sections on its compactification Ȳ as objects of D(R[Q]) before taking invariants. Their derived Q-invariants define the groupoid complexes at K. Refinement through intersections and composition of derived invariants establishes independence of K₀. Modular stabilizers can make these complexes unbounded, and underlying R-perfectness does not imply R[Q]-perfectness. Full-level freeness gives the latter; averaging or an explicit comparison is required for arbitrary-level coefficient base change.

Hecke rings use the pinned Mathlib double-coset type and Tau Ceti convolution ring. For UgU=⊔g_iU, the invariant action is the sum Σg_i·v over distinct right cosets. The degree is [U:U∩gUg⁻¹]. A homomorphism H⊗R→End_D(R)(C), its relative form in D(R[Q]), and a strict D(H⊗R[Q]) lift have distinct data. Discrete derived Hecke invariants provide the specified lift and comparison; a general relative strict lift is an enhancement obligation.

Parabolic restriction and N-integration use vol(U_N)=1. In the hyperspecial GL₂ case with the upper Borel,

S(T_p)=p[diag(p,1)]+[diag(1,p)],

and δ_B^{1/2}S(T_p)=p^{1/2}([diag(p,1)]+[diag(1,p)]). The single-term formula |δ_P(m)|⁻¹[U_MmU_M] belongs to the positive Iwahori monoid with both product decompositions. Global boundary strata contain every transported P-level; the distinguished g=1 P-space is the whole stratum only under the stated Iwasawa equality.

Cohomological triangles end in [1]. If d=dim X^G and o_K is the orientation system, duality reads

RHom_R(RΓ_c(X_K,V),R)≅RΓ(X_K,V^∨⊗o_K)[d].

The boundary has dimension d−1. Dualizing C_c→C→B reverses its order to DB→DC→DC_c→DB[1]; after comparison it is the inverse rotation of the shifted dual-coefficient boundary triangle, with the negative rotated connecting arrow. The Hecke adjoint inverts double cosets and transports the maximal ideal to 𝔪^∨.

## Proof order and closure

The planning pass is complete. All eight stages are planned, and none is closed: the precise supplier and signature obligations are recorded below. The node graph is acyclic. Stage labels group targets; implementation follows their individual prerequisite graph. Geometry precedes the supported complexes, their conditional cell model precedes triangulation, and triangulation precedes coefficient change. The proposed sublayers make that interleaving and the early-duality/later-boundary split visible. The automorphic-application split separates the ALS.5 comparison consumed by AF.4 from the applications that consume AF.4.

Borel–Serre's original construction now supplies the analytic corners, generated-parabolic intersections, arithmetic properness and compactness. Douady–Hérault supplies a collar and rounding on the same topological pair, so pair-cohomology and transfer naturality do not depend on a functorial smoothing choice. The two boundary spectral sequences are specified separately: the compact-support exact couple has differential degree (−r,r+1), whereas the ordinary GL_N flag resolution has degree (r,1−r), with alternating restriction signs on its first page. Early duality converts ordinary dual-coefficient vanishing at 𝔪^∨ to the compact-support vanishing used in the boundary induction.

The named specification following each target is mathematical. The suggested file has 18 generic API signatures and 8 full executable examples, together with additional explicitly labelled adapters. Its remaining 114 API signatures, 80 full examples and 44 named theorem signatures are listed as exact omissions, each with its earlier missing interface. The file has not been compiled. The review attempted lean-check, which stopped at the missing TauCeti.NumberTheory.HeckeRing.Associativity prebuilt object before elaboration; no build or cache download was started. These counts describe proposed forms, not formalised mathematics.

## Sources and pinned library reuse

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The source-level audit reads actual declaration statements at those commits. Existing derived categories, representations, group cohomology, quotient actions, covering maps, orientation/manifold infrastructure, local coefficient systems, relative singular chains and the convolution ring are reused. A sheaf/cochain comparison, arithmetic carrier, or enhanced supported model is not inferred from the existence of those separate types.

- **[acc23]** P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne, *Potential automorphy over CM fields*. Annals of Mathematics 197 (2023), no. 3, 897–1113; author copy of the published version (Annals pagination), read 2026-10-07; arXiv:1812.09999v2 also consulted. [Public source](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf). Read: §2.1 (2.1.1–2.1.14), pp. 909–916; §2.2.20 (Propositions 2.2.21, 2.2.23, Corollaries 2.2.22, 2.2.24), pp. 931–935; §2.4 opening and Theorem 2.4.2, pp. 941–942; §2.4.9, Theorems 2.4.10 and 2.4.11 with proofs, pp. 948–953; §6.5.1, Lemma 6.5.2, p. 1062.
- **[nt16]** J. Newton, J. A. Thorne, *Torsion Galois representations over CM fields and Hecke algebras in the derived category*. Forum of Mathematics, Sigma 4 (2016), e21 (published open-access version, read 2026-10-07); arXiv:1511.04913v1 compared. [Public source](https://doi.org/10.1017/fms.2016.16). Read: §2.2 Hecke algebras (Lemmas 2.3, 2.4, 2.7, Corollaries 2.5, 2.6, 2.8); §2.3 equivariant sheaves (Definitions 2.12, 2.16, Lemma 2.17, Proposition 2.18, Lemma 2.19); §3.1 (Definition 3.1, neatness, Lemma 3.2, Corollary 3.3, Propositions 3.4–3.8, Corollary 3.9, Lemma 3.10), pp. 40–51; §3.2 derived Hecke algebras and idempotents, Lemmas 3.11–3.13, pp. 51–53; §4 up to Lemma 4.5 (Theorem 4.2, Lemmas 4.1, 4.3, 4.4), pp. 53–58.
- **[jm02]** L. Ji, R. MacPherson, *Geometry of compactifications of locally symmetric spaces*. Annales de l'Institut Fourier 52 (2002), no. 2, 457–559 (Numdam copy, read 2026-10-07). [Public source](http://www.numdam.org/item/AIF_2002__52_2_457_0.pdf). Read: §7.1–7.4 Borel–Serre compactification (boundary components e(P) = N_P × X_P, Proposition 7.4).
- **[cg18]** F. Calegari, D. Geraghty, *Modularity lifting beyond the Taylor–Wiles method*. Inventiones Mathematicae 211 (2018), 297–433; arXiv:1207.4224v2 read 2026-10-07 (section numbers of v2 cited; the published §9.1 is v2's §9.0.1). [Public source](https://arxiv.org/abs/1207.4224). Read: §5.2.1 arithmetic quotients; §5.3 Definition 5.5; Lemma 5.9 with proof; §9.0.1 arithmetic quotients K_Q, L_Q; Lemma 9.6 with proof.
- **[cg20]** F. Calegari, D. Geraghty, M. Harris, *Bloch–Kato conjectures for automorphic motives (appendix to Calegari–Geraghty, Minimal modularity lifting for nonregular symplectic representations)*. Duke Mathematical Journal 169 (2020), appendix; arXiv:1907.08694 read 2026-10-07 (its §3.1, Lemma 3.1 and Theorem 3.2 are the appendix's §A.3.1 and Theorem A.4). [Public source](https://arxiv.org/abs/1907.08694). Read: §3.1 Betti cohomology: Lemma 3.1, Theorem 3.2 and proof.
- **[cn23]** A. Caraiani, J. Newton, *On the modularity of elliptic curves over imaginary quadratic fields*. arXiv:2301.10509v3, read 2026-10-07. [Public source](https://arxiv.org/abs/2301.10509v3). Read: §2.1.1–2.1.2: Proposition 2.1.3, Lemmas 2.1.4, 2.1.5.
- **[sch15]** P. Scholze, *On torsion in the cohomology of locally symmetric varieties*. Annals of Mathematics 182 (2015), 945–1066; arXiv:1306.2070 read 2026-10-07 (its Corollary V.4.2 is Corollary 5.4.2 of the Annals version). [Public source](https://arxiv.org/abs/1306.2070). Read: §V.4, Corollary V.4.2 and its proof.
- **[milne]** J. S. Milne, *Introduction to Shimura varieties*. notes, version of 16 September 2017, read 2026-10-07. [Public source](https://www.jmilne.org/math/xnotes/svi.pdf). Read: §1, Cartan involutions: definition (9), Example 1.15, Theorem 1.16, Example 1.17, Propositions 1.18 and 1.20.
- **[sella]** Y. Sella, *Comparison of sheaf cohomology and singular cohomology*. arXiv:1602.06674v3, read 2026-10-07. [Public source](https://arxiv.org/abs/1602.06674). Read: Introduction and main Theorem.
- **[hr]** G. Harder, A. Raghuram, *Eisenstein cohomology for GL_N and ratios of critical values of Rankin–Selberg L-functions*. arXiv:1405.6513, read 2026-10-07 (Annals of Mathematics Studies 203, 2020). [Public source](https://arxiv.org/abs/1405.6513). Read: §4.1, pp.23–24 (the ordinary GL_N boundary resolution); §4.2.1, pp.25–26 (nilmanifold fibration, (4.2), Proposition 4.3); §4.2.3, pp.27–28 (Kostant decomposition (4.5) over a splitting field with dominant integral weight). The general reductive-group target is a boundary-stratum spectral sequence; the displayed splitting is the totally real GL_N source application under those coefficient hypotheses.
- **[franke]** J. Franke, *Harmonic analysis in weighted L2-spaces*. Annales scientifiques de l'École Normale Supérieure (4) 31 (1998), 181–279 (Numdam copy, read 2026-10-07). [Public source](https://www.numdam.org/item/10.1016/s0012-9593%2898%2980015-3.pdf). Read: Abstract and introduction; §7.4 Borel's conjecture, Theorem 18 and the spectral sequence (1) that follows.
- **[bs73]** A. Borel, J.-P. Serre, *Corners and arithmetic groups*. Commentarii Mathematici Helvetici 48 (1973), 436–483; public E-Periodica IIIF scan and volume OCR read 2026-10-07; inherited PDF checksum not independently rehashed. [Public source](https://www.e-periodica.ch/iiif/com-001:1973:48::32/manifest). Read: §§1.4–1.9, 2.3–2.4: Cartan involutions and type S–Q spaces; §§3.2–3.9: geodesic action and horospherical decomposition; §§5.1–5.3, 7.1–7.6: corners, analytic embeddings and intersections; §§8.3, 8.6.4: interior homotopy and contractibility; §§9.1–9.5: arithmetic properness, compactness and torsion-free quotients; §11.1: rounding, finite triangulation and local-coefficient group cohomology.
- **[dh73]** A. Douady, L. Hérault, *Arrondissement des variétés à coins — Appendice à Corners and arithmetic groups*. Commentarii Mathematici Helvetici 48 (1973), 484–489; public E-Periodica IIIF scan and volume OCR read 2026-10-07; inherited PDF checksum not independently rehashed. [Public source](https://www.e-periodica.ch/iiif/com-001:1973:48::33/manifest). Read: §§2–3: sectors, inward vector fields and ambient embeddings; §4, Propositions 4.1–4.3: collar and smooth boundary model; §§5–6, Proposition 6.1, Theorem and Definition 6.2: rounding on the same underlying topological space.

The independent review read the two original 1973 articles through the public IIIF scans and volume OCR. The robot download endpoint returned a verification form; the PDF checksums in sourceVersions are inherited from BP revision 2, not independently rehashed by this review. The remaining source metadata and version hashes are retained from the source-audited input.

### Existing declarations

- `mathlib:ProperlyDiscontinuousSMul`: Properly discontinuous actions: for compact K, L only finitely many γ with γK ∩ L nonempty. Source module: `Mathlib/Topology/Algebra/ConstMulAction.lean`.
- `mathlib:ContractibleSpace`: Contractible topological spaces (homotopy equivalent to a point). Source module: `Mathlib/Topology/Homotopy/Contractible.lean`.
- `mathlib:Subgroup.Commensurable.commensurator`: The commensurator of a subgroup. Source module: `Mathlib/GroupTheory/Commensurable.lean`.
- `mathlib:IsHeckeTriple`: Hecke triples (H1, Δ, H2): commensurable subgroups inside a submonoid commensurating them. Source module: `Mathlib/NumberTheory/HeckeRing/Defs.lean`.
- `mathlib:HeckeCoset`: Double cosets H1\Δ/H2 as a quotient type. Source module: `Mathlib/NumberTheory/HeckeRing/Defs.lean`.
- `mathlib:HeckeRing`: The Hecke ring 𝕋 Δ H Z of finitely supported functions on double cosets H\Δ/H. Source module: `Mathlib/NumberTheory/HeckeRing/Defs.lean`.
- `tauceti:HeckeCosetModule.instRingHeckeRing`: The convolution product makes 𝕋 Δ H R a ring (associativity and unit proved). Source module: `TauCeti/NumberTheory/HeckeRing/Associativity.lean`.
- `tauceti:HeckeCoset.degree_eq_relIndex`: The degree of a double coset H1 g H2 (number of left cosets) is a relative index. Source module: `TauCeti/NumberTheory/HeckeRing/Basic.lean`.
- `mathlib:DerivedCategory`: The derived category of an abelian category, as complexes up to quasi-isomorphism, with its triangulated structure. Source module: `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`.
- `mathlib:HomotopyCategory`: The homotopy category of complexes. Source module: `Mathlib/Algebra/Homology/HomotopyCategory.lean`.
- `mathlib:CochainComplex`: Cochain complexes. Source module: `Mathlib/Algebra/Homology/HomologicalComplex.lean`.
- `mathlib:ModelWithCorners`: Models with corners for manifolds with boundary and corners. Source module: `Mathlib/Geometry/Manifold/IsManifold/Basic.lean`.
- `mathlib:CategoryTheory.ActionCategory`: The action groupoid of a group action. Source module: `Mathlib/CategoryTheory/Action.lean`.
- `mathlib:IsCoveringMap`: Covering maps. Source module: `Mathlib/Topology/Covering/Basic.lean`.
- `mathlib:groupCohomology`: Group cohomology of a representation, defined as homology of the inhomogeneous cochain complex; an Ext comparison is an additional theorem, not this definition.. Source module: `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean`.
- `mathlib:AlgebraicTopology.singularChainComplexFunctor`: The singular chain complex functor on TopCat with coefficients in an object of a preadditive category. Source module: `Mathlib/AlgebraicTopology/SingularHomology/Basic.lean`.
- `mathlib:CategoryTheory.Sheaf.H`: Sheaf cohomology H^n of an abelian sheaf on a site, as Ext from the constant sheaf. Source module: `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean`.
- `mathlib:CongruenceSubgroup.Gamma0`: The congruence subgroup Γ0(N) of SL(2, ℤ). Source module: `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean`.
- `mathlib:CongruenceSubgroup.Gamma1`: The congruence subgroup Γ1(N) of SL(2, ℤ). Source module: `Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean`.
- `mathlib:UpperHalfPlane`: The complex upper half-plane. Source module: `Mathlib/Analysis/Complex/UpperHalfPlane/Basic.lean`.
- `mathlib:Module.Flat`: Flat modules. Source module: `Mathlib/RingTheory/Flat/Basic.lean`.
- `mathlib:Module.Projective`: Projective modules. Source module: `Mathlib/Algebra/Module/Projective.lean`.
- `mathlib:Matrix.GeneralLinearGroup`: GL_n(R) as the units of the matrix ring. Source module: `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`.
- `mathlib:Subgroup.relIndex`: The relative index of subgroups. Source module: `Mathlib/GroupTheory/Index.lean`.
- `mathlib:TopPair`: The category of pairs of topological spaces. Source module: `Mathlib/Topology/Category/TopPair.lean`.
- `mathlib:Rep`: The category of k-linear representations of a group. Source module: `Mathlib/RepresentationTheory/Rep/Basic.lean`.
- `mathlib:CategoryTheory.IsIdempotentComplete`: Idempotent complete categories (every idempotent splits). Source module: `Mathlib/CategoryTheory/Idempotents/Basic.lean`.
- `tauceti:TauCeti.LocalCoefficientSystem`: Local coefficient systems: functors from the fundamental groupoid of X to ModuleCat R. Source module: `TauCeti/AlgebraicTopology/LocalCoefficient.lean`.
- `tauceti:TauCeti.LocalCoefficientSystem.pullback`: Pullback of local coefficient systems along continuous maps. Source module: `TauCeti/AlgebraicTopology/LocalCoefficient.lean`.
- `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`: The monodromy representation of π1(X, x) on the fibre of a local system. Source module: `TauCeti/AlgebraicTopology/LocalCoefficient.lean`.
- `tauceti:TauCeti.LocalCoefficientSystem.constantFunctor`: Constant local coefficient systems. Source module: `TauCeti/AlgebraicTopology/LocalCoefficient.lean`.
- `tauceti:TauCeti.CoveringSpace.monodromyEquivalence`: For a path-connected, locally path-connected, semilocally simply connected space X, an equivalence CoveringSpace X ≌ (FundamentalGroupoid X ⥤ Type u); passage to fundamental-group actions is a separate comparison.. Source module: `TauCeti/AlgebraicTopology/UniversalCover/Classification/MonodromyEquivalence.lean`.
- `tauceti:TopPair.singularChainComplexFunctor`: The relative singular chain complex of a pair of spaces. Source module: `TauCeti/AlgebraicTopology/Singular/Relative.lean`.
- `tauceti:TauCeti.card_fiber_orbitOfCosetTranslate_mul_cardStabilizerOnOrbit`: Weighted cardinality identity: the cardinality of a fibre of the coset-translate orbit map times the stabilizer-on-orbit cardinality equals Nat.card of the original stabilizer (not a stabilizer index).. Source module: `TauCeti/GroupTheory/DoubleCoset/Orbits.lean`.
- `tauceti:TauCeti.Cocharacter.parabolic`: The dynamic parabolic subgroup attached to a cocharacter. Source module: `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean`.
- `tauceti:TauCeti.Cocharacter.leviDecompositionMulEquiv`: The Levi decomposition of a dynamic parabolic as a semidirect product. Source module: `TauCeti/Algebra/AlgebraicGroup/Dynamic/LeviDecomposition/Basic.lean`.

## ALS.0. Symmetric spaces, arithmetic quotients and levels

Start with Cartan involutions of real reductive groups and the fixed maximal compact. Form the split-centre-corrected symmetric space and adelic double quotient, prove finite component decomposition using AA reduction theory, and obtain properness from the original arithmetic theorem. Torsion-free proper actions give manifolds and K(Γ,1) components. Standard Iwahori and projective congruence levels carry their exact quotient tests; the orientation character is retained in the coefficient data.

**Planets:** Cartan involution; Symmetric space of G(F_∞); Arithmetic locally symmetric space X_K; Neat-level manifold structure; Taylor–Wiles and Iwahori level subgroups; Orientation local system of X_K.

**Coverage:** planned. Remaining closure: Resolve the exact inputs recorded in Typed arithmetic and analytic corner interfaces. Resolve the exact inputs recorded in Linear local-system descent and derived sheaf/cochain comparison. Resolve the exact inputs recorded in Suggested signatures: ALS.0.

### Definition: Cartan involutions of real reductive groups

**Identifier:** `ALS.0/cartan-involution`.

Let H be a connected linear algebraic group over ℝ, with complex conjugation g ↦ ḡ on H(ℂ). An involution θ of H, as an algebraic group over ℝ, is a Cartan involution if the twisted real form H^(θ)(ℝ) = {g ∈ H(ℂ) : g = θ(ḡ)} is compact. For a connected reductive group G over a number field F we apply this to H = (Res_{F/ℚ} G)_ℝ, so that H(ℝ) = G(F_∞) = ∏_{v|∞} G(F_v); a Cartan involution of G(F_∞) is a product of Cartan involutions of the factors G_{F_v}. Its fixed group K_θ = G(F_∞)^θ is the associated maximal compact subgroup (see maximal-compact-subgroup).

**Hypotheses.** H connected linear algebraic group over ℝ (reductive for existence) G connected reductive over a number field F

**Construction or proof.**

1. Define the property on involutions of an algebraic group over ℝ by compactness of the twisted real form; for Res_{F/ℚ}G take products over the archimedean places.
2. Existence and G(ℝ)-conjugacy are Satake's theorem as quoted by Milne (Theorem 1.16); for a faithful representation stable under transpose, θ(g) = (gᵗ)⁻¹ is Cartan (Milne, Example 1.17(c)).
3. For GL_n the involution g ↦ (gᵗ)⁻¹ has twisted form U(n), compact (Milne, Example 1.17(b)).

**API.**

- `LocallySymmetric.IsCartanInvolution` (data): The predicate on an involution θ of G_ℝ: the twisted real form G^(θ)(ℝ) is compact.
- `LocallySymmetric.IsCartanInvolution.exists` (constructor): Every connected reductive group over ℝ has a Cartan involution (Satake; Milne Theorem 1.16).
- `LocallySymmetric.IsCartanInvolution.conj` (characterisation): Any two Cartan involutions θ, θ′ of G differ by ad(g) for some g ∈ G(ℝ): θ′ = ad(g) ∘ θ ∘ ad(g)⁻¹.
- `LocallySymmetric.IsCartanInvolution.transposeInverse` (example): If G ⊂ GL_n is stable under g ↦ gᵗ, then g ↦ (gᵗ)⁻¹ restricts to a Cartan involution of G; for G = GL_n it is Cartan with fixed group O(n).
- `LocallySymmetric.IsCartanInvolution.prod` (functoriality): For G = G₁ × G₂, θ₁ × θ₂ is Cartan if and only if θ₁ and θ₂ are; for Res_{F/ℚ}G Cartan involutions are products over v | ∞.
- `LocallySymmetric.IsCartanInvolution.killing` (characterisation): For a semisimple real group, the induced involution is Cartan iff (X, Y) ↦ −B(X, dθ(Y)) is positive definite. For a reductive group this criterion tests only the derived subgroup; compactness of the twisted central torus is a separate condition.

**Unit tests.**

- `cartanInvolution_GL_transposeInverse` (computation): For G = GL_n over ℝ, θ(g) = (gᵗ)⁻¹ is a Cartan involution and G(ℝ)^θ = O(n).
- `cartanInvolution_SL2_adjoint` (computation): For G = SL_2 and θ = ad((0, 1; −1, 0)), the twisted form is SU(2), compact (Milne Example 1.15), so θ is Cartan.
- `cartanInvolution_compact_id` (degenerate): If G(ℝ) is compact (e.g. G = SO(n) or a norm-one torus), the identity is a Cartan involution and the only one.
- `not_cartanInvolution_id_GL2` (non-example): The identity of GL_2 is not a Cartan involution: its twisted form is GL_2(ℝ), which is not compact.

**Consumers.**

- AutomorphicFormsOnReductiveGroups:AF.1/real-reductive-group: imports θ and K_∞ = G^θ to define the real reductive datum (G, K, θ) and the Cartan decomposition 𝔤 = 𝔨 ⊕ 𝔭
- ShimuraData:D2/cartan-adjoint-criterion: uses the compact-real-form characterisation and the Killing-form criterion on the adjoint group
- ACC+ §2.1.1, p. 910: the symmetric space X^G = GL_n(F_∞)/K_∞ℝ^× is built from a maximal compact K_∞, i.e. from a Cartan involution
- NT16 §3.1, p. 41: the Levi subgroup L′_x of P_ℝ stable under the Cartan involution associated to K_x defines the geodesic action

**Acceptance properties.**

- θ(g) = (gᵗ)⁻¹ on GL_n(ℝ) is Cartan with fixed group O(n).
- The identity of a compact group is its only Cartan involution.

**Direct prerequisites.** `mathlib:Matrix.GeneralLinearGroup`; `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`.

**Source passages.** [milne], §1, Cartan involutions, definition (9), p. 15: The definition, verbatim up to notation; we apply it to (Res_{F/ℚ}G)_ℝ. [milne], §1, Theorem 1.16, p. 15: Existence and conjugacy, recorded as API items.

### Theorem: Maximal compact subgroups from Cartan involutions

**Identifier:** `ALS.0/maximal-compact-subgroup`.

Let G be connected reductive over a number field F and θ a Cartan involution of G(F_∞). Then K_∞ = G(F_∞)^θ is a maximal compact subgroup of G(F_∞), it meets every connected component of G(F_∞), every compact subgroup of G(F_∞) is contained in a G(F_∞)-conjugate of K_∞, and with 𝔭 the (−1)-eigenspace of dθ on 𝔤 = Lie G(F_∞), the map K_∞ × 𝔭 → G(F_∞), (k, X) ↦ k·exp X, is a diffeomorphism.

**Hypotheses.** G connected reductive over F θ a Cartan involution of G(F_∞)

**Construction or proof.**

1. K_∞ = G(ℝ) ∩ G^(θ)(ℝ) is closed in the compact group G^(θ)(ℝ), hence compact.
2. The Cartan decomposition K × 𝔭 ≅ G is Tau Ceti's LieGroups layer 9 for the real reductive group with maximal compact K and Cartan involution θ; it gives maximality and that K meets every component (G/K ≅ 𝔭 is connected).
3. Conjugacy of compact subgroups into K: a compact subgroup fixes a point of the nonpositively curved space G/K (Cartan fixed point theorem), so lies in a stabilizer g K g⁻¹.

**Acceptance properties.**

- GL_n(ℝ): K_∞ = O(n) meets both components; polar decomposition GL_n(ℝ) = O(n)·exp(Sym_n).
- GL_n(ℂ): K_∞ = U(n), connected.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.0/cartan-involution`; `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`.

**Source passages.** [milne], §1, Example 1.17(d), p. 15: The compact real form attached to θ; K_∞ is its intersection with G(ℝ). [nt16], §3.1, after Definition 3.1, p. 40: The component statement used for connectedness of X^G. [bs73], §§1.4, 1.6–1.7: Cartan involution attached to a maximal compact, the K × p diffeomorphism, component and conjugacy statements. Milne Propositions 1.18/1.20 concern polarizations, not this decomposition.

### Construction: The symmetric space of G with the split-centre correction

**Identifier:** `ALS.0/symmetric-space`.

Let G be connected reductive over a number field F, 𝐆 = Res_{F/ℚ} G, A_𝐆 the maximal ℚ-split torus in the centre of 𝐆 and A_∞ = A_𝐆(ℝ)°. Fix a Cartan involution θ with maximal compact K_∞ = G(F_∞)^θ. The symmetric space of G is X^G = G(F_∞)/K_∞A_∞, a homogeneous space for the left action of G(F_∞) whose point stabilizers are the conjugates g K_∞ A_∞ g⁻¹. Equivalently X^G is the space of type S−Q for 𝐆 in the sense of Borel–Serre: the isotropy groups are K·S(ℝ) with S a maximal ℚ-split torus of the radical normalized by K. It is independent of θ up to G(F_∞)-equivariant isomorphism, and d_G = dim X^G = dim G(F_∞) − dim K_∞ − dim A_∞. The split-centre correction is part of the definition: for GL_n, X = GL_n(F_∞)/K_∞ℝ^×_{>0} (ACC+ writes K_∞ℝ^×, which agrees since −1 ∈ K_∞).

**Hypotheses.** G connected reductive over a number field F A_𝐆 the maximal ℚ-split central torus of Res_{F/ℚ} G

**Construction or proof.**

1. Take the coset space G(F_∞)/K_∞A_∞ with the quotient smooth structure (closed subgroup).
2. By Borel–Serre Lemma 2.1 (quoted in NT16 §3.1) the isotropy subgroups of a space of type S−Q form one G(ℝ)-conjugacy class, so the space is unique up to isomorphism; K_∞A_∞ is such an isotropy group since A_𝐆 is the ℚ-split part of the radical.
3. Independence of θ: conjugate Cartan involutions (Theorem 1.16) give G(F_∞)-isomorphic quotients via g ↦ g h⁻¹.

**API.**

- `LocallySymmetric.symmetricSpace` (data): X^G = G(F_∞)/K_∞A_∞ as a topological space (smooth manifold) with its left G(F_∞)-action.
- `LocallySymmetric.symmetricSpace.basepoint` (data): The base point x₀ = [1] with stabilizer K_∞A_∞.
- `LocallySymmetric.symmetricSpace.stabilizer_eq` (characterisation): Stab(g·x₀) = g K_∞A_∞ g⁻¹ for all g ∈ G(F_∞).
- `LocallySymmetric.symmetricSpace.isoOfCartan` (equivalence): For Cartan involutions θ, θ′ = ad(h)θad(h)⁻¹ the map gK_θA_∞ ↦ g h⁻¹K_θ′A_∞ is a G(F_∞)-equivariant diffeomorphism.
- `LocallySymmetric.symmetricSpace.dim_eq` (other): dim X^G = dim G(F_∞) − dim K_∞ − dim A_∞; e.g. 2 for GL_2/ℚ, 3 for GL_2 over an imaginary quadratic field, n(n+1)/2 − 1 for GL_n/ℚ.
- `LocallySymmetric.symmetricSpace.prod` (functoriality): X^{G₁×G₂} ≅ X^{G₁} × X^{G₂} equivariantly when A_{G₁×G₂} = A_{G₁} × A_{G₂}.
- `LocallySymmetric.symmetricSpace.connectedVariant` (other): X̃^G = G(F_∞)/K_∞°A_∞ with the covering X̃^G → X^G whose deck group is π_0(K_∞) = π_0(G(F_∞)); for GL_{2,ℚ}, X̃ = ℍ^± (Scholze's X̃_K uses this variant).

**Unit tests.**

- `symmetricSpace_GL2_Q` (computation): For G = GL_{2,ℚ}, X^G ≅ ℍ (upper half-plane) G(ℝ)-equivariantly, with g acting by z ↦ (az+b)/(cz+d) if det g > 0 and z ↦ (az̄+b)/(cz̄+d) if det g < 0; dim X = 2.
- `symmetricSpace_GL1` (degenerate): For G = GL_{1,F}, X^G = (F⊗ℝ)^×/(K_∞ℝ_{>0}) ≅ ℝ^{r₁+r₂−1}; it is a point exactly when F is ℚ or imaginary quadratic.
- `symmetricSpace_SL2_compat` (compatibility): For G = SL_{2,ℚ}, X^G = SL_2(ℝ)/SO(2) is identified with Mathlib's UpperHalfPlane through g ↦ g·i, equivariantly for the Möbius action.
- `symmetricSpace_not_without_centre` (non-example): Without the split-centre factor, GL_2(ℝ)/O(2) ≅ ℍ × ℝ_{>0} has dimension 3 and every γ ∈ GL_2(ℤ) acts trivially on the ℝ_{>0} factor (|det γ| = 1), so Γ\(GL_2(ℝ)/O(2)) ≅ (Γ\ℍ) × ℝ_{>0} has infinite volume; for the anisotropic unit group of a definite quaternion algebra the quotient would be noncompact.

**Consumers.**

- ACC+ §2.1.1, p. 910: X^G_{K_G} := G(F)\(X^G × G(A^∞_F)/K_G) is built from X^G
- NT16 §3.1, pp. 40–41: the geodesic action of A_P on X^G and the quotient X_P = A_P\X^G define the Borel–Serre boundary
- Scholze, Corollary V.4.2: X̃_K = GL_n(F)\[(GL_n(F⊗ℝ)/ℝ_{>0}K_∞°) × GL_n(A_{F,f})/K]: a variant with K_∞° in place of K_∞
- AutomorphicFormsOnReductiveGroups:AF.1a/cartan-iwasawa-malcev: G/K ≅ 𝔭 is the van Est and invariant-forms model

**Acceptance properties.**

- GL_2 over ℚ: X = GL_2(ℝ)/O(2)ℝ_{>0} is diffeomorphic to the upper half-plane, with det < 0 acting antiholomorphically.
- A torus T with T(ℝ) compact modulo A_T(ℝ)°: X^T is a point.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.0/cartan-involution`; `ArithmeticLocallySymmetricSpaces:ALS.0/maximal-compact-subgroup`; `AdelicAlgebraicGroups:AA.2/split-centre`.

**Source passages.** [nt16], §3.1, Definition 3.1, p. 40: The S−Q condition; the homogeneous space is determined up to isomorphism. Here Rd denotes the ℚ-split part of the radical, as defined immediately before Definition 3.1; the excerpt uses that convention. [acc23], §2.1.1, pp. 909–910: The GL_n instance with the split-centre factor.

### Theorem: The symmetric space is contractible with proper action

**Identifier:** `ALS.0/symmetric-space-contractible`.

X^G is diffeomorphic to Euclidean space of dimension d_G: with 𝔞_G = Lie A_∞ ⊂ 𝔭, the map 𝔭/𝔞_G → X^G, X ↦ exp(X)·x₀, is a diffeomorphism. In particular X^G is contractible and orientable. The induced action of G(F_∞)/A_∞ is proper, with compact point stabilizers K_∞A_∞/A_∞ and their conjugates. A subgroup Γ acts properly discontinuously with finite stabilizers if its image in G(F_∞)/A_∞ is discrete and its kernel Γ ∩ A_∞ is finite. Discreteness of Γ in G(F_∞) and Γ ∩ A_∞ = 1 alone do not imply this projected discreteness.

**Hypotheses.** For the subgroup consequence: the image of Γ in G(F_∞)/A_∞ is discrete and Γ ∩ A_∞ is finite.

**Construction or proof.**

1. The Cartan decomposition K_∞ × 𝔭 ≅ G(F_∞) (maximal-compact-subgroup) gives G(F_∞)/K_∞ ≅ 𝔭, and A_∞ = exp(𝔞_G) with 𝔞_G ⊂ 𝔭 central, so X^G ≅ 𝔭/𝔞_G.
2. Properness is asserted for the quotient group G(F_∞)/A_∞: its homogeneous-space stabilizer is compact. Restriction to a discrete subgroup gives proper discontinuity; lifting through a finite kernel preserves finite stabilizers. The unquotiented group action need not be proper when A_∞ is noncompact.

**Acceptance properties.**

- dim X^G = d_G and X^G is homeomorphic to ℝ^{d_G}; GL_2/ℚ gives ℍ ≅ ℝ².
- SL_2(ℤ) acts properly discontinuously on ℍ with stabilizer of i of order 4 (order 2 modulo ±1).

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space`; `ArithmeticLocallySymmetricSpaces:ALS.0/maximal-compact-subgroup`; `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`; `mathlib:ContractibleSpace`; `mathlib:ProperlyDiscontinuousSMul`.

**Source passages.** [nt16], §3.1, after Definition 3.1, p. 40: The statement, attributed to Borel–Serre Remark 2.4. [acc23], §2.1.1, p. 910: Same statement in ACC+. [bs73], §2.4: Type S spaces, including the split-radical quotient, are Euclidean; restriction to the reductive type S–Q space gives the stated contractibility.

### Construction: The arithmetic locally symmetric space X_K

**Identifier:** `ALS.0/locally-symmetric-space`.

For a compact open subgroup K ⊂ G(A_F^∞) put X_K = X^G_K = G(F)\(X^G × G(A_F^∞)/K), with G(F) acting diagonally (through G(F) → G(F_∞) on X^G) and the quotient topology. Write 𝔛_G = G(F)\(X^G × G(A_F^∞)^δ), with G(A_F^∞) discrete, a right G(A_F^∞)-space with X_K = 𝔛_G/K. Right translation by g ∈ G(A_F^∞) induces homeomorphisms r_g : X_{gKg⁻¹} → X_K, [x, h] ↦ [x, hg], and for K′ ⊂ K the projection π_{K′,K} : X_{K′} → X_K. Under X^G × G(A_F^∞)/K = G(A_F)/K_∞A_∞K, X_K is the level quotient of AdelicAlgebraicGroups AA.4 for the archimedean subgroup K_∞A_∞.

**Hypotheses.** K ⊂ G(A_F^∞) compact open

**Construction or proof.**

1. Form the quotients; G(F) acts on X^G × G(A_F^∞)/K through its diagonal embedding.
2. Identify X^G × G(A^∞)/K with G(A_F)/K_∞A_∞K via (g_∞K_∞A_∞, g_fK) ↦ (g_∞, g_f)K_∞A_∞K, so X_K is AA.4's level quotient for the closed subgroup K_∞A_∞ of G(F_∞).
3. Right translations commute with the left G(F)-action, giving r_g and π_{K′,K} with r_g ∘ r_h = r_{hg}.

**API.**

- `LocallySymmetric.X` (data): X_K = G(F)\(X^G × G(A^∞)/K) as a topological space.
- `LocallySymmetric.X.mk` (constructor): The class [x, g] ∈ X_K of (x, g) ∈ X^G × G(A^∞).
- `LocallySymmetric.X.mk_eq_mk_iff` (extensionality): [x, g] = [x′, g′] iff there are γ ∈ G(F), k ∈ K with x′ = γx and g′ = γ g k.
- `LocallySymmetric.X.translate` (functoriality): r_g : X_{gKg⁻¹} → X_K, [x, h] ↦ [x, hg], a homeomorphism with r_1 = id and r_g ∘ r_h = r_{hg}.
- `LocallySymmetric.X.levelMap` (functoriality): π_{K′,K} : X_{K′} → X_K for K′ ⊂ K, with π_{K,K} = id, π_{K′,K} ∘ π_{K″,K′} = π_{K″,K}, and r_g ∘ π = π ∘ r_g.
- `LocallySymmetric.X.equivLevelQuotient` (compatibility): X_K ≃ AA.4's level quotient G(F)\G(A_F)/K_∞A_∞K, compatibly with right translations.

**Unit tests.**

- `X_GL1_Q` (computation): For G = GL_{1,ℚ} and K = Ẑ^×, X_K is a single point: ℚ^×\(pt × A_f^×/Ẑ^×) = ℚ^×\(ℚ^×_{>0}·Ẑ^×)/Ẑ^× is one class.
- `X_trivialGroup` (degenerate): For G trivial, X_K is a point for the unique K.
- `X_GL2_levelOne` (compatibility): For G = GL_{2,ℚ} and K = GL_2(Ẑ), X_K ≅ GL_2(ℤ)\ℍ = (SL_2(ℤ)\ℍ)/(z ↦ −z̄) as topological spaces (one component since det GL_2(Ẑ) = Ẑ^× and A_f^× = ℚ^×_{>0}Ẑ^×), where ℍ is identified with GL_2(ℝ)/O(2)ℝ_{>0} as in symmetricSpace_GL2_Q.
- `X_not_coarse_of_discrete` (non-example): X_K is not G(F)\G(A_F^∞)/K (a finite set): forgetting X^G loses all positive-dimensional topology; for GL_{2,ℚ} and K = GL_2(Ẑ) that set is a point while X_K is the modular curve.

**Consumers.**

- NT16 §2.3–§3.1: X_K = 𝔛_G/K is the quotient of a free K-space when K is neat, so K-equivariant sheaves on 𝔛_G descend
- ACC+ (2.1.3): RΓ(X_K, V) receives the Hecke action
- CompletedCohomologyPartII:CC.0: assembles the tower K ↦ X_K with its level maps and conjugations
- AnalyticNumberTheory:AN.9: uses the compact hyperbolic surfaces Γ\ℍ as components of X_K

**Acceptance properties.**

- For GL_{2,ℚ} and neat K(N), N ≥ 3, X_K is a disjoint union of φ(N)/2 copies of Γ(N)\ℍ; with K_∞ = O(2) the space X_K is the quotient of the modular curve Sh_{K(N)}(ℂ) by complex conjugation, which permutes its φ(N) components freely.
- For G a torus T with T(ℝ)/A_∞ compact, X_K is the finite set T(F)\T(A^∞)/K.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space`; `AdelicAlgebraicGroups:AA.4/level-quotient`; `AdelicAlgebraicGroups:AA.3/arithmetic-subgroup-of-level`.

**Source passages.** [acc23], §2.1.1, p. 910: The definition of X_K and of the discrete-set-up space 𝔛_G. [nt16], §3.1, p. 41: The same space in NT16's notation.

### Theorem: Finite decomposition of X_K into arithmetic quotients

**Identifier:** `ALS.0/component-decomposition`.

Let K ⊂ G(A_F^∞) be compact open and g_1, …, g_s representatives of the finite set G(F)\G(A_F^∞)/K. Put Γ_i = G(F) ∩ g_iKg_i⁻¹, viewed in G(F_∞). Then [x] ↦ [x, g_i] on the i-th summand is a homeomorphism ⊔_{i=1}^s Γ_i\X^G ≅ X_K. The stabilizer of [x, g_i] in the G(F)-action on X^G × G(A^∞)/K is identified with Stab_{Γ_i}(x) = Γ_i ∩ Stab_{G(F_∞)}(x); changing g_i to γ g_i k replaces Γ_i by γΓ_iγ⁻¹. The connected components of X_K are the images Γ_i\X^G.

**Hypotheses.** K compact open in G(A_F^∞)

**Construction or proof.**

1. Finiteness of G(F)\G(A^∞)/K is AdelicAlgebraicGroups AA.3/class-number-finite.
2. Each fibre of X_K → G(F)\G(A^∞)/K over [g_i] is G(F)\(X^G × G(F)g_iK/K) ≅ Γ_i\X^G, as in AA.3/component-decomposition for the archimedean subgroup K_∞A_∞.
3. X^G is connected (symmetric-space-contractible), so the summands are the connected components.

**Acceptance properties.**

- GL_{2,ℚ}, K = K(N) principal level N ≥ 3: the components are indexed by GL_2(ℚ)\GL_2(A_f)/K(N) ≅ Ẑ^×/(±1·det K(N)) = (ℤ/N)^×/±1, so there are φ(N)/2 of them, each Γ(N)\ℍ.
- Anisotropic G: every Γ_i\X^G is compact (AdelicAlgebraicGroups:AA.3/arithmetic-quotient-compact).

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space`; `ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space-contractible`; `AdelicAlgebraicGroups:AA.3/component-decomposition`; `AdelicAlgebraicGroups:AA.3/class-number-finite`.

**Source passages.** [nt16], §3.1, Lemma 3.2(1), p. 42: The statement (NT16's further claim of orientability is corrected in sourceIssues E1). [acc23], §2.1.1, p. 910: The neat-level form.

### Theorem: Proper discontinuity and finite stabilizers at arbitrary level

**Identifier:** `ALS.0/proper-action-stabilizers`.

For every compact open K and g ∈ G(A^∞), Γ_{g,K} = G(F) ∩ gKg⁻¹ is a discrete subgroup of G(F_∞) acting properly discontinuously on X^G. Precisely: the G(F)-action on X^G × G(A^∞)/K is properly discontinuous; the stabilizer of (x, hK) is Γ_{h,K} ∩ Stab_{G(F_∞)}(x), a finite group; and the finite central subgroup Z_K = Z(F) ∩ K_∞A_∞K lies in every stabilizer and acts trivially. Hence X_K is the coarse quotient of the action groupoid 𝒳_K (AdelicAlgebraicGroups AA.4/level-quotient-groupoid for K_∞A_∞), whose automorphism groups are these finite stabilizers; at points with trivial stabilizer X_K is locally homeomorphic to X^G.

**Hypotheses.** K compact open

**Construction or proof.**

1. Apply Borel–Serre Theorem 9.3 directly to the arithmetic subgroup Γ_{g,K} of the restriction-of-scalars group and its type S–Q bordification. This proves properness before taking a neat subgroup, and restricts to X^G; it does not infer projected discreteness from archimedean discreteness.
2. In the proof of 9.3, first reduce by finite index to connected G and use 9.2 to remove the unipotent radical: its arithmetic subgroup is a cocompact lattice and its image in the reductive quotient is arithmetic. For the reductive group use the compact closures of Siegel sets (7.9), the corner-neighborhood basis (6.2), and 9.1 to reduce compact overlap to finitely many interior translates. AA.3/real-siegel-finite-overlap and real-siegel-finite-cover supply precisely Borel reduction theory used here.
3. Properness for a discrete arithmetic group means finitely many elements move one compact set to meet another. Taking a point gives finite stabilizers and hence a finite action kernel, including the stated central subgroup. On the disjoint discrete adelic slices only the appropriate Γ_{g,K} can meet a sufficiently small neighborhood.
4. Identify these stabilizers with automorphism groups of AA.4/level-quotient-groupoid. Trivial stabilizer points have disjoint translated neighborhoods, so their quotient is locally X^G.

**Acceptance properties.**

- For G = SL_{2,ℚ} and K = SL_2(Ẑ), Γ = SL_2(ℤ) and the stabilizer of i has order 4, with central kernel {±1}. For G = GL_{2,ℚ} at GL_2(Ẑ), the full stabilizer has order 8, including orientation-reversing elements.
- At neat level all stabilizers are trivial (neat-level-manifold).

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition`; `ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space-contractible`; `AdelicAlgebraicGroups:AA.4/level-quotient-groupoid`; `AdelicAlgebraicGroups:AA.1/rational-points-discrete`; `mathlib:ProperlyDiscontinuousSMul`; `mathlib:CategoryTheory.ActionCategory`; `AdelicAlgebraicGroups:AA.3/real-siegel-finite-overlap`; `AdelicAlgebraicGroups:AA.3/real-siegel-finite-cover`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification`.

**Source passages.** [nt16], §3.1, p. 41: Proper discontinuity and freeness at neat level; the arbitrary-level statement keeps finite stabilizers. [cg18], §9, before §9.0.1 (arXiv v2): Non-neat levels are treated as orbifolds/groupoids. [bs73], §§9.1–9.3, Theorem 9.3: The theorem supplies both properness and compactness for arithmetic groups; 9.1 and the reduction-theoretic proof avoid the split-centre discreteness inference.

### Theorem: At neat level X_K is a manifold and each component is a K(Γ, 1)

**Identifier:** `ALS.0/neat-level-manifold`.

Let K be neat (AdelicAlgebraicGroups AA.4/neat-level). Then every Γ_{g,K} is torsion-free, meets A_∞ trivially and acts freely and properly discontinuously on X^G; G(F) × K^δ acts freely and properly discontinuously on X^G × G(A^∞)^δ: every point has a neighbourhood U with γU·k ∩ U = ∅ for (γ,k) ≠ (1,1); X^G × G(A^∞)/K → X_K is a covering map; X_K is a smooth manifold of dimension d_G, each component Γ_i\X^G is an Eilenberg–MacLane space K(Γ_i, 1); and for K′ ⊂ K normal, π_{K′,K} : X_{K′} → X_K is a finite covering with free K/K′-action (a Galois covering on each component when X_{K′} is connected over it).

**Hypotheses.** K neat

**Construction or proof.**

1. Neat implies torsion-free (AA.4/neat-torsion-free); finite stabilizers (proper-action-stabilizers) are torsion, hence trivial.
2. A free properly discontinuous action on the manifold X^G has a manifold quotient and the quotient map is a covering (Mathlib's quotient covering for properly discontinuous actions).
3. Contractibility of X^G makes Γ_i\X^G a K(Γ_i, 1).
4. Level covers: AA.4/level-covering-map and AA.4/level-action-free-at-neat.
5. Use Borel–Serre 9.5: proper arithmetic actions on the bordification are free exactly when torsion-free. Neatness gives torsion-freeness of rational intersections, which suffices here; no equivalence with the stronger all-adelic-element Pink convention is asserted.

**Acceptance properties.**

- For N ≥ 3, the principal level K(N) ⊂ GL_2(Ẑ) is neat and X_{K(N)} is a disjoint union of φ(N)/2 copies of Γ(N)\ℍ, each a punctured surface with free fundamental group.
- K_0(N) ⊂ GL_2(Ẑ) is never neat: −I ∈ GL_2(ℚ) ∩ K_0(N) has eigenvalue −1; it lies in Z_K and acts trivially, which is why stabilizers are computed with Z_K.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.0/proper-action-stabilizers`; `AdelicAlgebraicGroups:AA.4/neat-level`; `AdelicAlgebraicGroups:AA.4/neat-torsion-free`; `AdelicAlgebraicGroups:AA.4/level-covering-map`; `AdelicAlgebraicGroups:AA.4/level-action-free-at-neat`; `mathlib:IsCoveringMap`.

**Source passages.** [nt16], §3.1, p. 41: Freeness at neat level in the discrete set-up. [acc23], §2.1.1, p. 910: Manifold structure at good (neat) level.

### Theorem: Two pro-v Iwahori factors of distinct residue characteristic force neatness

**Identifier:** `ALS.0/neatness-iwahori-criterion`.

Let K = ∏_v K_v ⊂ GL_n(Ô_F) be compact open and suppose there are finite places v, v′ of F with distinct residue characteristics q ≠ q′ such that K_v = Iw_{v,1} and K_{v′} = Iw_{v′,1} (pro-v Iwahori subgroups, standard-level-subgroups). Then K is neat. More generally the conclusion holds whenever K_v and K_{v′} are pro-q and pro-q′ groups with q ≠ q′ whose elements have all eigenvalues ≡ 1 modulo the maximal ideal.

**Hypotheses.** v, v′ finite places with distinct residue characteristics

**Construction or proof.**

1. For g ∈ K, every eigenvalue α of g_v satisfies α ≡ 1 modulo the maximal ideal, so any root of unity in the group generated by eigenvalues of g_v has q-power order; similarly at v′ with q′-power order.
2. A root of unity ζ of prime order in Γ_v ∩ Γ_{v′} would have order q and q′, impossible; so ∩_w Γ_w is trivial and g is neat (Pink's definition, AA.4/neat-element).

**Acceptance properties.**

- K with K_2 = Iw_{2,1}, K_3 = Iw_{3,1} and K_v = GL_n(O_v) elsewhere is neat.
- One pro-v factor does not suffice: for F = ℚ, n = 2 and K = Iw_{3,1}·∏_{p≠3}GL_2(Z_p), K ∩ GL_2(ℚ) contains elements of order 3 such as (1, 1; −3, −2) (trace −1, determinant 1, ≡ unipotent upper triangular mod 3), so K is not neat.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups`; `AdelicAlgebraicGroups:AA.4/neat-level`; `AdelicAlgebraicGroups:AA.4/neat-element`.

**Source passages.** [acc23], §6.5.1, Lemma 6.5.2, p. 1062: The statement. [acc23], §6.5.1, proof of Lemma 6.5.2, p. 1062: The proof step.

### Definition: Standard level subgroups: Iwahori, Γ0, Γ1, Γp and Taylor–Wiles levels

**Identifier:** `ALS.0/standard-level-subgroups`.

Let v be a finite place of F with ring of integers O_v, uniformizer ϖ_v, residue field k_v. (i) Iw_v ⊂ GL_n(O_v) is the subgroup of matrices upper triangular mod ϖ_v and Iw_{v,1} ⊂ Iw_v the pro-v Iwahori, unipotent upper triangular mod ϖ_v; Iw_v/Iw_{v,1} ≅ (k_v^×)^n. (ii) For n = 2 and c ≥ 1, inside PGL_2(O_v): Γ_0(v^c) = {g ≡ (1 ∗; 0 ∗) mod ϖ_v^c}, Γ_1(v^c) = {g ≡ (1 ∗; 0 1) mod ϖ_v^c}, Γ_p(v^c) = {g ≡ (1 ∗; 0 d) mod ϖ_v^c with d of p-power order}. (iii) For PGL_n with n ≥ 2, the (1, n−1)-parahoric K_0(v) = image of {g ∈ GL_n(O_v) : g stabilizes a fixed line ℓ ⊂ k_v^n mod ϖ_v}, i.e. g ≡ (1 ∗; 0 GL_{n−1}) mod ϖ_v, and its normal subgroup K_1(v) = {g ≡ (1 ∗; 0 SL_{n−1})} with K_0(v)/K_1(v) ≅ k_v^×. (iv) For a finite set Q of places and a level K with K_v maximal at v ∈ Q, K_0(Q) and K_1(Q) replace K_v by K_0(v), K_1(v) for v ∈ Q; K_1(Q) ⊂ K_0(Q) is normal with quotient Δ_Q = ∏_{v∈Q} k_v^×; Y_0(Q) = X_{K_0(Q)}, Y_1(Q) = X_{K_1(Q)}. For Δ a quotient of Δ_Q, K_Δ(Q) is the preimage of ker(Δ_Q → Δ) and Y_Δ(Q) = X_{K_Δ(Q)}.

**Hypotheses.** v a finite place of F Q a finite set of finite places at which K is maximal n ≥ 2 for the PGL_n Taylor–Wiles quotient formula; PGL_1 is treated separately.

**Construction or proof.**

1. Each subgroup is the preimage of a subgroup of GL_n(O_v/ϖ_v^c) (or PGL_n) under reduction, hence compact open.
2. Normality of K_1(v) in K_0(v) and K_0(v)/K_1(v) ≅ k_v^× come from the determinant of the lower-right GL_{n−1} block; for Iw_{v,1} ⊂ Iw_v from the diagonal mod ϖ_v.
3. Compatibility with parahoric group schemes: Iw_v and K_0(v) are the O_v-points of the parahorics of ReductiveGroupsPartII RG2.3 for the standard alcove and the facet of type (1, n−1); Iw_{v,1} is the pro-unipotent radical's points.

**API.**

- `LocallySymmetric.iwahori` (data): Iw_v as a compact open subgroup of GL_n(O_v), with Iw_v ⊃ Iw_{v,1} = iwahoriOne.
- `LocallySymmetric.gamma0` (data): Γ_0(v^c) as a compact open subgroup of PGL_2(O_v), equivalently upper-triangular reduction modulo ϖ_v^c; the normalized projective representative has top-left entry 1.
- `LocallySymmetric.taylorWilesLevel` (data): K_0(Q) ⊃ K_1(Q) for a finite set Q of places where K is maximal, and the subgroup K_Δ(Q) for a quotient Δ of Δ_Q.
- `LocallySymmetric.taylorWilesLevel.quotientEquiv` (characterisation): K_1(Q) is normal in K_0(Q) and K_0(Q)/K_1(Q) ≅ Δ_Q = ∏_{v∈Q} k_v^×.
- `LocallySymmetric.iwahori.index` (example): [GL_n(O_v) : Iw_v] = #(GL_n/B)(k_v) and [Iw_v : Iw_{v,1}] = (q_v − 1)^n.
- `LocallySymmetric.iwahori.eq_parahoric` (compatibility): Iw_v and K_0(v) are the O_v-points of the parahoric group schemes of ReductiveGroupsPartII RG2.3 for the standard alcove and the (1, n−1) facet.
- `LocallySymmetric.iwahoriOne` (data): Iw_{v,1} is the inverse image of the upper unipotent subgroup under reduction GL_n(O_v) → GL_n(k_v); it is normal in Iw_v, and the diagonal reduction identifies Iw_v/Iw_{v,1} with (k_v^×)^n.
- `LocallySymmetric.gamma1` (data): Γ_1(v^c) ⊂ PGL_2(O_v) is the image of matrices whose lower-left entry is 0 and whose diagonal entries agree modulo ϖ_v^c; equivalently normalize the top-left entry to 1 and require lower-right entry 1.
- `LocallySymmetric.gammaP` (data): Γ_p(v^c) ⊂ Γ_0(v^c) is the inverse image of the p-primary subgroup of (O_v/ϖ_v^c)^× under the ratio of diagonal entries; Γ_1 is the kernel of that ratio. For c=1, Γ_p/Γ_1 is the p-primary subgroup of k_v^×.

**Unit tests.**

- `iwahori_index_GL2` (computation): [GL_2(Z_p) : Iw_p] = p + 1 (Iw_p is the stabilizer of a line in F_p²).
- `gamma0_eq_congruenceSubgroup` (compatibility): For F = ℚ and v = p, intersecting the GL_2-preimage of the projective Γ_0(p^c) with SL_2(ℤ) gives Mathlib CongruenceSubgroup.Gamma0 (p^c). For projective Γ_1 the diagonal entries are a common unit a with a² ≡ 1 mod p^c. For odd p this gives ±Gamma1; for p = 2 and c ≥ 3 extra solutions occur (e.g. a = 3 mod 8), so the unqualified ±Gamma1 assertion fails.
- `taylorWiles_quotient_trivial_n1` (degenerate): For Q = ∅, Δ_Q is trivial and K_0(Q) = K_1(Q) = K. For PGL_1 the ambient group is trivial and so is its level quotient; the formula Δ_Q = ∏ k_v^× applies only to n ≥ 2.
- `gammaP_ne_gamma1` (non-example): For c = 1, [Γ_p(v) : Γ_1(v)] is the p-primary part of q_v − 1; the inclusion is strict iff p divides q_v − 1. For example p = 3, q_v = 7 gives index 3; p = 3, q_v = 5 gives equality. It is not the prime-to-p part.

**Consumers.**

- CG18 §5.2.1 and §9.0.1: define Y_0(Q), Y_1(Q) and the Taylor–Wiles covers
- CG20 §3.1, Theorem 3.2 (appendix Theorem A.4): Y_1(Q) → Y_0(Q) Galois with group Δ_Q; Y(K) with Iwahori level at ramified primes
- ACC+ Lemma 6.5.2: two pro-v Iwahori factors give neatness
- PotentialAutomorphyInfrastructure:PA.4: auxiliary Taylor–Wiles primes and their levels

**Acceptance properties.**

- [GL_2(Z_p) : Iw_p] = p + 1 and [Iw_p : Iw_{p,1}] = (p − 1)².
- Δ_Q = ∏ k_v^× is the covering group of Y_1(Q) → Y_0(Q) at neat level.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space`; `ReductiveGroupsPartII:RG2.3`; `mathlib:Matrix.GeneralLinearGroup`.

**Source passages.** [cg18], §5.2.1 (arXiv v2): The Γ_0, Γ_1, Γ_p levels for PGL_2. [cg18], §9.0.1 (published §9.1): The (1, n−1)-parahoric and its normal subgroup; CG18 calls them K_{Q,v} ⊃ L_{Q,v}. [cg20], §3.1 (appendix §A.3.1): The levels used for Y(K) in the appendix.

### Construction: The orientation local system of X_K and its character

**Identifier:** `ALS.0/orientation-local-system`.

For compact open K, the orientation local system o_K on X_K is the descent of the G(F_∞)-equivariant orientation sheaf of X^G: the orientation character ε : G(F_∞) → {±1} sends g to the sign of det(dg_{x₀} composed with the parallel transport back), equivalently ε(g) = sign det(Ad(g) | 𝔭/𝔞_G) computed after moving g into K_∞A_∞ by the Cartan decomposition (ε is trivial on the identity component and ε(k) = sign det(Ad(k)|𝔭) for k ∈ K_∞). Then o_K = (X^G × G(A^∞)/K × ℤ(ε))/G(F) with G(F) acting on ℤ(ε) through ε, a rank-one local system of ℤ-modules on the orbifold X_K; at neat level it is the orientation local system of the manifold X_K of Tau Ceti's AlgebraicTopology stage 6. For G = Res_{F/ℚ}GL_m, ε(γ) = sign(N_{F/ℚ} det γ)^{m−1} for γ ∈ GL_m(F).

**Hypotheses.** K compact open (orbifold local system); neat K for the manifold statement

**Construction or proof.**

1. X^G ≅ ℝ^d is orientable, so its orientation sheaf is trivialised by a choice of orientation and G(F_∞) acts on it through a character ε.
2. ε(g) is the sign of the Jacobian at x₀ of x ↦ g·x after transport; on K_∞ (fixing x₀) it is sign det(Ad(k)|𝔭/𝔞_G), and ε is trivial on the identity component (connectedness).
3. Descend the G(F)×K-equivariant rank-one sheaf ℤ(ε) along X^G × G(A^∞) → X_K (equivariant descent, NT16 Lemma 2.17) to obtain o_K; at neat level identify it with AT stage 6's orientation system using local orientation classes.
4. For GL_m(ℝ)/O(m)ℝ_{>0} ≅ {positive definite, det 1}, diag(−1, 1, …, 1) flips the m − 1 entries (1, j), j ≥ 2, so ε = sign(det)^{m−1}; GL_m(ℂ) is connected; multiply over places.

**API.**

- `LocallySymmetric.orientationCharacter` (data): ε : G(F_∞) → {±1}, the action of G(F_∞) on the orientations of X^G.
- `LocallySymmetric.orientationSystem` (data): o_K, the rank-one local system on X_K descended from ℤ(ε).
- `LocallySymmetric.orientationSystem.monodromy` (characterisation): On Γ_i\X^G, the coefficient action is ε|Γ_i. Fix the endpoint convention of localSystem.monodromy: a lifted loop ends at δ(ℓ)x₀, and its Tau Ceti monodromy is ε(δ(ℓ)⁻¹)=ε(δ(ℓ)).
- `LocallySymmetric.orientationSystem.pullback` (functoriality): π_{K′,K}^* o_K ≅ o_{K′} and r_g^* o_K ≅ o_{gKg⁻¹}.
- `LocallySymmetric.orientationSystem.eq_manifold` (compatibility): At neat level o_K is isomorphic to the orientation local system of the manifold X_K from Tau Ceti's AlgebraicTopology stage 6.
- `LocallySymmetric.orientationCharacter_GL` (example): For G = Res_{F/ℚ}GL_m, ε(γ) = sign(N_{F/ℚ}(det γ))^{m−1}.

**Unit tests.**

- `orientationCharacter_GL2_Q` (computation): For G = GL_{2,ℚ}, ε(g) = sign det g: diag(−1, 1) acts on ℍ by z ↦ −z̄, reversing orientation.
- `orientationCharacter_connected` (degenerate): If G(F_∞) is connected (e.g. GL_n or PGL_n over an imaginary CM field), ε is trivial and o_K ≅ ℤ for every K.
- `orientationSystem_GL_formula` (characterisation): For γ ∈ GL_m(O_F), ε(γ) = sign(N_{F/ℚ} det γ)^{m−1}; for m odd ε is trivial. Distinguish neatness over F from neatness of the restriction of scalars over ℚ: take F=ℚ(√5), u=682+305√5 with N(u)=−1, and γ=diag(u,1). At v=(11,√5−7) and w=(31,√5−6), u reduces to 1. Principal congruence at v and w, maximal integral level elsewhere, is F-neat by the two-distinct-residue-characteristics criterion, contains γ, and has ε(γ)=−1. The same γ is not neat in Res_{F/ℚ}GL_2: its eigenvalues over ℚ include u and its conjugate u′, whose product is −1.
- `orientation_not_trivial_at_neat_PGL2` (non-example): Neat level does not force orientability: for G = PGL_{2,ℚ} and K = K(5)K(13)∏_{p≠5,13}PGL_2(Z_p), the class of (57, 455; 455, 3632) (det −1) lies in Γ_{1,K} and ε of it is −1 (see nonorientable-neat-example).

**Consumers.**

- ALS.5:finite-level-duality: Poincaré–Verdier duality twists by o_K
- ArithmeticKTheory:N.3:finite-generation/rank-filtration-homology-finite-type: uses the orientation character (N_{F/ℚ}∘det)^{m−1} of GL_m(O_F)
- ALS README, completion contracts: a nonorientable quotient must be detected by the orientation local system

**Acceptance properties.**

- o_K is trivial (X_K orientable) iff ε is trivial on every Γ_i.
- For GL_m over an imaginary CM field, o_K is trivial.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold`; `ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space-contractible`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `tauceti:TauCeti.LocalCoefficientSystem`; `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`.

**Source passages.** [nt16], §3.1, after Definition 3.1, p. 40: Orientability of X^G; the orientation character of the quotient is what this node adds. [nt16], §3.1, p. 41: The claim that neat groups preserve orientation, which fails for PGL_2 over ℚ (sourceIssues E1); this node keeps the character.

### Theorem: A nonorientable neat arithmetic quotient for PGL_2 over ℚ

**Identifier:** `ALS.0/nonorientable-neat-example`.

Let G = PGL_{2,ℚ}, so X^G ≅ ℍ with PGL_2(ℝ) acting holomorphically for det > 0 and antiholomorphically for det < 0. Let K = K(5)·K(13)·∏_{p≠5,13} PGL_2(Z_p) with K(p) = ker(PGL_2(Z_p) → PGL_2(F_p)). Then K is neat, and γ = [(57, 455; 455, 3632)] ∈ PGL_2(ℚ) (det = −1, the matrix ≡ 57·I mod 65 with 57² ≡ −1 mod 65) lies in Γ_{1,K} = PGL_2(ℚ) ∩ K and reverses orientation. Hence the component Γ_{1,K}\ℍ of X_K is a nonorientable surface and o_K is nontrivial. In contrast, at the non-neat level GL_2(Ẑ) for GL_{2,ℚ}, the orbifold X_K has nontrivial orientation character det on GL_2(ℤ), while every neat level of GL_{2,ℚ} gives an orientable X_K. For GL_m over F the same norm argument applies when each arithmetic subgroup is neat for Res_{F/ℚ}GL_m as an algebraic group over ℚ: then N_{F/ℚ} det γ = 1. Neatness defined using faithful F-representations of GL_m alone does not imply this stronger hypothesis; the real-quadratic regression in orientationSystem_GL_formula is F-neat and orientation-reversing.

**Construction or proof.**

1. det(57, 455; 455, 3632) = 57·3632 − 455² = 207024 − 207025 = −1, and the matrix is 57·I + 65·(0, 7; 7, 55), so its image lies in K(5) and K(13) (scalar mod 5 and mod 13) and in PGL_2(Z_p) for all p.
2. Neatness of K: for u ∈ K, the eigenvalues of Ad(u_5) are ≡ 1 mod the maximal ideal, so the torsion in the group they generate is 5-primary; at 13 it is 13-primary; the intersection is trivial (the argument of neatness-iwahori-criterion).
3. An element of PGL_2(ℝ) with det < 0 acts on ℍ antiholomorphically, so ε(γ) = −1; Γ_{1,K} acts freely, so the quotient surface is nonorientable.
4. For GL_m over F, compactness of the finite level implies det γ ∈ O_F^×. Under the additional hypothesis of neatness for Res_{F/ℚ}GL_m as a ℚ-group, N(det γ)=±1 is the determinant of its faithful ℚ-representation on the underlying ℚ-vector space of F^m, hence belongs to the torsion-free eigenvalue group. It must equal 1, giving ε=1. This applies to ordinary neatness when F=ℚ, but it must not be inferred from the supplier’s F-neatness predicate when F≠ℚ.

**Acceptance properties.**

- The adjoint eigenvalues of γ are −λ², 1, −λ⁻² with λ > 1 the positive eigenvalue of the matrix; they generate the torsion-free group ⟨−λ²⟩, so γ is neat although det γ < 0.
- The index-two subgroup Γ_{1,K} ∩ ker ε gives the orientation double cover of the component, which is orientable.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.0/orientation-local-system`; `ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold`; `AdelicAlgebraicGroups:AA.4/neat-element`; `ArithmeticLocallySymmetricSpaces:ALS.0/neatness-iwahori-criterion`.

**Source passages.** [nt16], §3.1, p. 41: The general claim that this example refutes (sourceIssues E1). [milne], §1, Example 1.17(b), p. 15: The Cartan involution used to identify X^{PGL_2} with ℍ.

## ALS.1. Arithmetic local systems and Betti complexes

Construct the associated arithmetic local sheaf with the whole-slice monodromy convention. Identify its ordinary sheaf, singular and group-cohomology models with their actual comparison maps. Supported and relative objects use the compactified equivariant neat-refinement construction. Finite models and coefficient change retain their full-level freeness and Tor hypotheses; this prevents finite underlying complexes from being confused with projective group-ring complexes.

**Planets:** Arithmetic local system V_K; Betti complexes RΓ(X_K, V) and RΓ_c(X_K, V); Orbifold cohomology as group cohomology.

**Coverage:** planned. Remaining closure: Resolve the exact inputs recorded in Linear local-system descent and derived sheaf/cochain comparison. Resolve the exact inputs recorded in Coherent equivariant supports, refinements and trace. Resolve the exact inputs recorded in Stage order for geometry, supports, duality and automorphic applications. Resolve the exact inputs recorded in Suggested signatures: ALS.1.

### Construction: Arithmetic local systems from coefficient modules

**Identifier:** `ALS.1/arithmetic-local-system`.

Let R be a commutative ring, S a finite set of finite places, K = K_S K^S a compact open subgroup and V an R-module with commuting actions of G(F) and of K_S (an R[G(F) × K_S]-module), finite free (or finite projective) over R. Pull V back from a point to a G(F) × G^S × K_S-equivariant sheaf on X^G × G(A^∞)^δ (G(F) acting through its action on V, G^S trivially, K_S through its action on V), descend along the free G(F)-action to a G^S × K_S-equivariant sheaf V on 𝔛_G, and, for K neat, along the free K-action to a sheaf V_K on X_K. Concretely V_K is the sheaf of locally constant sections of G(F)\(X^G × G(A^∞) × V)/K → X_K with commuting left G(F)-action and right K-action (x,g,v) ↦ (γx,γgk,γ·k_S⁻¹·v); this is not written as a left action of G(F) × K with its ordinary product law. On the component Γ_i\X^G it is the local system with Γ_i-equivariant coefficient representation Γ_i → Aut_R(V), γ ↦ ρ_{G(F)}(γ)ρ_{K_S}((g_i⁻¹γg_i)_S). Fix x₀ and lift a loop ℓ at its image in Γ_i\X^G from x₀ to δ(ℓ)x₀. Tau Ceti multiplies loops by g*h=h followed by g, so δ is an antihomomorphism to Γ_i (a homomorphism to Γ_iᵐᵒᵖ). In the diagonal associated bundle (γx,ρ_Γ(γ)v)∼(x,v), parallel transport sends v to ρ_Γ(δ(ℓ)⁻¹)v. This inverts the entire slice representation, not only the K_S factor, and is a homomorphism for Tau Ceti’s multiplication. Two cases are used: V an R[K_S]-module with trivial G(F)-action (p-adic weights, NT16's M_G), and V an R[G(F)]-module with trivial K_S-action (rational representations); for an algebraic representation the two agree after inverting p.

**Hypotheses.** R commutative V finite projective over R K neat for the sheaf on X_K; arbitrary K for the equivariant sheaf on 𝔛_G

**Construction or proof.**

1. Pull back from a point; G(F) acts freely on X^G × G(A^∞)^δ (it acts freely on G(A^∞) by left translation), so descend to 𝔛_G (NT16 Lemma 2.17(2)).
2. At neat level K acts freely on 𝔛_G (neat-level-manifold), so descend again to X_K; at non-neat level keep the K-equivariant sheaf on 𝔛_G (the groupoid model).
3. On the slice g_i, preservation by γ requires k = g_i⁻¹γ⁻¹g_i, so the fibre action γ·k_S⁻¹ is ρ_{G(F)}(γ)ρ_{K_S}((g_i⁻¹γg_i)_S), a homomorphism because the two actions commute. Specify the identification of Γ_i (or its opposite, for the other path-composition convention) with the fundamental group before asserting the monodromy formula.
4. For lifted endpoints, δ(g*h)=δ(h)δ(g). Transport a constant lift v to [δ(ℓ)x₀,v]=[x₀,ρ_Γ(δ(ℓ)⁻¹)v]; the two reversals make the resulting Tau Ceti representation multiplicative. CoveringSpace.monodromyEquivalence concerns Type-valued covers; the additive/R-linear extension must be constructed, rather than claimed as its existing statement.

**API.**

- `LocallySymmetric.localSystem` (data): V ↦ V_K, the sheaf on X_K (neat K), and V ↦ V_𝔛, the G^S × K_S-equivariant sheaf on 𝔛_G (any K).
- `LocallySymmetric.localSystem.stalk` (projection): The stalk of V_K at [x, g] is identified with V; changing the representative by (γ, k) acts by γ·k_S⁻¹.
- `LocallySymmetric.localSystem.monodromy` (characterisation): Fix x₀ and lift a loop ℓ at its image in Γ_i\X^G from x₀ to δ(ℓ)x₀. Tau Ceti multiplies loops by g*h=h followed by g, so δ is an antihomomorphism to Γ_i (a homomorphism to Γ_iᵐᵒᵖ). In the diagonal associated bundle (γx,ρ_Γ(γ)v)∼(x,v), parallel transport sends v to ρ_Γ(δ(ℓ)⁻¹)v. This inverts the entire slice representation, not only the K_S factor, and is a homomorphism for Tau Ceti’s multiplication.
- `LocallySymmetric.localSystem.map` (functoriality): An R[G(F) × K_S]-linear map V → W induces V_K → W_K, functorially (identity and composition), exact in V.
- `LocallySymmetric.localSystem.tensor` (structure): (V ⊗_R W)_K ≅ V_K ⊗_R W_K and Hom_R(V, W)_K ≅ ℋom(V_K, W_K); in particular (V^∨)_K ≅ ℋom(V_K, R).
- `LocallySymmetric.localSystem.pullback` (functoriality): π_{K′,K}^* V_K ≅ V_{K′} for K′ ⊂ K and r_g^* V_K ≅ V_{gKg⁻¹} with the action of g_S on V when g ∈ G_S.
- `LocallySymmetric.localSystem.constant` (example): For V = R with trivial actions, V_K is the constant sheaf R (Tau Ceti's constantFunctor on each component).

**Unit tests.**

- `localSystem_trivial` (degenerate): For V = R with trivial G(F)- and K_S-actions, V_K ≅ the constant sheaf R_{X_K}.
- `localSystem_monodromy_GL1` (computation): For G = GL_{1,F} with F real quadratic and V = R(χ), χ the sign of the first real embedding on F^×, the monodromy on the circle O_F^{×}∩K\ℝ is χ of a generator; it is −1 exactly when the generator is negative at that embedding.
- `localSystem_eq_LocalCoefficientSystem` (compatibility): At neat level the construction gives TauCeti.LocalCoefficientSystem via the above whole-inverse endpoint convention. For K-factor matrices A=(1,1;0,1), B=(1,0;1,1), AB≠BA and (AB)⁻¹=B⁻¹A⁻¹≠A⁻¹B⁻¹; the convention still gives a homomorphism, whereas inverting only one factor in the ordinary slice product fails.
- `localSystem_not_constant_of_trivial_stalk` (non-example): A rank-one system may have trivial stalks and nontrivial monodromy. At non-neat GL_2(Ẑ), R(sign det) is an orbifold coefficient system; it is not asserted to descend to a local system on the coarse quotient. A manifold example is the real-quadratic GL_1 sign character in localSystem_monodromy_GL1.

**Consumers.**

- ACC+ §2.1.2: local systems 𝒱_λ on X_K attached to O[K_p]-lattices V_λ carry the Hecke action
- NT16 §3.1 (M_G, M^U_G): a Z[U_S]-module M gives the equivariant sheaf M_G and the sheaf M^U_G on X^U_G
- HilbertModularVarietiesAndShimuraCurves:R18.4/quaternion-local-systems: requests the associated coefficient local system and its sheaf realisation
- AutomorphicFormsOnReductiveGroups:AF.4/torsion-hecke-eigenclasses: Betti cohomology with coefficients in lattices of algebraic representations

**Acceptance properties.**

- For V = R trivial, V_K is the constant sheaf R.
- For GL₂/ℚ, K=K(N) and V=Sym^k(R²), the coefficient representation on a Γ(N) component is the standard Γ(N) action. A loop lifted to endpoint δ(ℓ)x₀ has Tau Ceti monodromy Sym^k(δ(ℓ)⁻¹), as fixed above.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold`; `ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space`; `SchemeAndStackFoundations:key/equivariant-sheaf-cohomology`; `tauceti:TauCeti.LocalCoefficientSystem`; `tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation`; `tauceti:TauCeti.CoveringSpace.monodromyEquivalence`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`.

**Source passages.** [acc23], §2.1.2, p. 910: The construction, following NT16. [acc23], §2.1.2, pp. 910–911: The descent steps. [nt16], §2.3, Lemma 2.17(2), p. 22: Equivariant descent along free actions (page of the published version approximate).

### Construction: Betti complexes RΓ(X_K, V), RΓ_c(X_K, V) and their equivariant models

**Identifier:** `ALS.1/betti-complexes`.

For compact open K choose a normal finite-index neat K₀⊂K, put Q=K/K₀, Y=X_{K₀} and let Ȳ=X̄_{K₀} be its compact Borel–Serre closure with the Q-action and equivariant coefficient extension V̄. The objects C=RΓ(Ȳ,V̄), C_c=RΓ(Ȳ,j_!V), C_∂=RΓ(∂Ȳ,i^*V̄) live in D(R[Q]), obtained from equivariant sheaves before forgetting Q. Define RΓ(X_K,V)=RΓ(Q,C), RΓ_c(X_K,V)=RΓ(Q,C_c), RΓ(∂X̄_K,V)=RΓ(Q,C_∂). At neat K these agree with ordinary sheaf cohomology and compact support by free descent and the interior homotopy equivalence. At arbitrary K they compute groupoid cohomology, not coarse cohomology; group invariants are derived and can be unbounded. For K′⊲K choose K₀⊂K′ and define RΓ_{K/K′}(X_{K′},V)=RΓ(K′/K₀,C) in D(R[K/K′]) using the equivariant derived functor, with analogous support and boundary objects. Intersecting two choices of K₀ and composing derived invariants gives canonical choice-independence and refinement compatibilities. For ordinary cohomology this agrees with NT16’s discrete equivariant model RΓ(K,RΓ(𝔛_G,V_𝔛)).

**Hypotheses.** R commutative V finite projective over R

**Construction or proof.**

1. Extend each local system on Y along the homotopy-equivalent interior inclusion Y→Ȳ, functorially and Q-equivariantly, using the covering/universal-cover presentation. Descend in the equivariant abelian sheaf category and use equivariant injective resolutions, not an action on isomorphism classes in D(R).
2. Use SchemeAndStackFoundations:SF.2/linearized-sheaf, enough-injectives and invariants-acyclic for derived invariant sections. On compact Ȳ, j_! defines compact support; the open/closed exact sequence gives C_c→C→C_∂→C_c[1] before applying the triangulated functor RΓ(Q,−).
3. For another neat normal subgroup refine to the intersection. Free finite-cover descent and the derived invariants composite identify all three objects. The enhanced natural isomorphisms and support/trace coherences are the exact remaining supplier request, not consequences of an action on cohomology alone.
4. At neat K apply free descent (NT16 Proposition 2.18 and Corollary 3.3) and j homotopy invariance; compare ordinary cohomology with the slice group complexes. For non-neat K retain the quotient-stack interpretation and all higher finite-group cohomology.

**API.**

- `LocallySymmetric.RΓ` (data): RΓ(X_K,V)=RΓ(Q,RΓ(Ȳ,V̄)) in D(R), Q=K/K₀ for a neat normal refinement; naturally identified with the ordinary NT16 equivariant invariant-sections model.
- `LocallySymmetric.RΓc` (data): RΓ_c(X_K,V)=RΓ(Q,RΓ(Ȳ,j_!V)) in D(R), independent of the chosen neat normal refinement by equivariant finite-cover descent; at neat K this is ordinary compact support.
- `LocallySymmetric.RΓrel` (data): For K₀⊂K′⊲K, RΓ_{K/K′}(X_{K′},V)=RΓ(K′/K₀,RΓ(Ȳ,V̄)) in D(R[K/K′]); the residual action is retained in the equivariant derived construction.
- `LocallySymmetric.RΓ.isoSheafCohomology` (compatibility): For neat K, RΓ(X_K, V) ≅ RΓ(X_K, V_K) (sheaf cohomology, Mathlib's Sheaf.H in degree i).
- `LocallySymmetric.RΓrel.forget` (projection): The image of RΓ_{K/K′}(X_{K′}, V) under D(R[K/K′]) → D(R) is RΓ(X_{K′}, V).
- `LocallySymmetric.RΓc.forgetSupports` (data): The natural map RΓ_c(X_K, V) → RΓ(X_K, V).
- `LocallySymmetric.RΓ.map` (functoriality): V ↦ RΓ(X_K, V) and V ↦ RΓ_c(X_K, V) are triangulated functors of V (short exact sequences of coefficient modules give triangles).

**Unit tests.**

- `RΓ_point` (degenerate): If X_K is a finite set of points (G a torus with T(ℝ)/A_∞ compact), RΓ(X_K, V) = ⊕_{x} V^{Stab(x)} concentrated in degree 0 for |Stab(x)| invertible in R.
- `H1_modularCurve_levelGamma1_5` (computation): For G = SL_{2,ℚ} (A_G trivial) at the neat level giving Γ_1(5)\ℍ (a sphere minus four cusps), H^0 = R, H^1 ≅ R^3, H^i = 0 for i ≥ 2, and H^1_c ≅ R^3, H^2_c ≅ R.
- `RΓ_eq_groupCohomology_levelOne` (compatibility): For G = SL_{2,ℚ} and K = SL_2(Ẑ), H^i(X_K, ℤ) is group cohomology H^i(SL_2(ℤ), ℤ): ℤ, 0, ℤ/12, 0, ℤ/12, … (2-periodic from degree 2), not the cohomology of the coarse space SL_2(ℤ)\ℍ ≅ ℂ.
- `RΓ_ne_coarse` (non-example): At non-neat level H^*(X_K, ℤ) differs from the singular cohomology of the coarse quotient: for SL_2(ℤ), H^2(X_K, ℤ) = ℤ/12 while H^2(SL_2(ℤ)\ℍ, ℤ) = 0.

**Consumers.**

- ACC+ (2.1.3): the Hecke algebra acts on RΓ(X_K, V) by endomorphisms in D(R)
- ACC+ Lemma 2.1.7: RΓ_{K/K′}(X_{K′}, V) is perfect over R[K/K′]
- CompletedCohomologyPartII:CC.1, CC.4: colimits and limits of these complexes along the tower
- PotentialAutomorphyInfrastructure:PA.0: the common integral cohomology interface

**Acceptance properties.**

- H^0(X_K, R) = R^{π_0(X_K)}.
- For K neat and X_K compact (G anisotropic), RΓ_c(X_K, V) = RΓ(X_K, V).

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system`; `SchemeAndStackFoundations:key/equivariant-sheaf-cohomology`; `mathlib:DerivedCategory`; `mathlib:CategoryTheory.Sheaf.H`; `ArithmeticLocallySymmetricSpaces:ALS.0/proper-action-stabilizers`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact`; `SchemeAndStackFoundations:SF.2/linearized-sheaf`; `SchemeAndStackFoundations:SF.2/enough-injectives`; `SchemeAndStackFoundations:SF.2/invariants-acyclic`; `SchemeAndStackFoundations:SF.2/support`; `SchemeAndStackFoundations:SF.2/localization`.

**Source passages.** [acc23], §2.1.2, p. 911: The equivariant model. [nt16], §3.1, Corollary 3.3, p. 42: Agreement with sheaf cohomology at neat level. [acc23], §2.1.2, p. 911: The relative complex over R[K/K′]. [cn23], §2.1.2, after Proposition 2.1.3, p. 11: The topological neat-level model computes compact supports using j_! on the compactification. The general-level finite-group adapter and enhancement are explicitly requested, not attributed to this neat statement.

### Theorem: Sheaf cohomology of arithmetic local systems agrees with singular cochains

**Identifier:** `ALS.1/sheaf-singular-comparison`.

For neat K and V finite projective, there are natural isomorphisms in D(R) RΓ(X_K, V_K) ≅ C^•(X_K; V_K) and RΓ_c(X_K, V_K) ≅ C^•_c(X_K; V_K) := colim_C C^•(X_K, X_K ∖ C; V_K) (C compact), where C^• are the singular cochains with local coefficients of Tau Ceti's AlgebraicTopology stages 2 and 6; they are compatible with pullback along level maps and translations, with the forget-supports map, and, on X̄_K (ALS.2), with the relative cochains of the pair (X̄_K, ∂X̄_K). Equivalently, writing X̃ = X^G × G(A^∞)/K′ for the universal-cover side, RΓ(X_K, V_K) ≅ Hom_{ℤ[Γ_i]}(C_•(X^G), V) on each component.

**Hypotheses.** K neat V finite projective over R

**Construction or proof.**

1. X_K is a manifold (neat-level-manifold), hence locally contractible; apply Sella's natural comparison to the constant sheaf on the contractible-component cover X^G × G(A^∞)/K and take Γ_i-invariant cochains: both sides compute RΓ(Γ_i, −) of the same Γ_i-module complex, naturally.
2. Compact supports: excision of the complement of compact subsets on both sides, then the colimit over compacts.
3. Compatibility with level maps and translations is naturality in the space.

**Acceptance properties.**

- For X_K compact the compactly supported comparison reduces to the absolute one.
- For a connected orientable noncompact surface Γ\ℍ and constant coefficients R, H^2_c(Γ\ℍ,R)=R and H^2(Γ\ℍ,R)=0 on both sides. Without orientability, the first formula requires the orientation coefficient system o_R instead of constant R. For the nonorientable neat PGL_2 example and R=ℚ, H^2_c(Γ\ℍ,ℚ)=0, not ℚ.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`; `ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `mathlib:AlgebraicTopology.singularChainComplexFunctor`; `tauceti:TopPair.singularChainComplexFunctor`.

**Source passages.** [sella], Introduction, main Theorem: The constant-coefficient comparison; the local-coefficient case follows Γ-equivariantly on the universal cover. [acc23], §2.1.2, proof of Lemma 2.1.7, p. 912: The cochain model through an invariant triangulation.

### Theorem: Betti cohomology as group cohomology of the arithmetic groups

**Identifier:** `ALS.1/group-cohomology-comparison`.

For every compact open K (neat or not) and V finite projective over R there is a natural isomorphism RΓ(X_K, V) ≅ ⊕_{i=1}^s RΓ(Γ_i, V), with Γ_i = G(F) ∩ g_iKg_i⁻¹ acting on V by γ ↦ ρ_{G(F)}(γ)ρ_{K_S}((g_i⁻¹γg_i)_S), as the slice representation of arithmetic-local-system and RΓ(Γ_i, −) group cohomology (Mathlib's groupCohomology in each degree). At neat level each Γ_i\X^G is a K(Γ_i, 1) and this is the comparison of the sheaf cohomology of the local system with group cohomology. In particular H^*(X_K, V) is the orbifold cohomology of X_K, and differs from the cohomology of the coarse quotient by terms killed by the orders of the stabilizers: if every stabilizer order is invertible in R, H^*(X_K, V) ≅ H^*(Γ\X^G, (π_*V)^stabilizer). When stabilizer orders are invertible, the invariant pushforward to the coarse quotient is generally a constructible sheaf; it is a local system only under an additional descent condition such as trivial stabilizer action on the fibres.

**Hypotheses.** V finite projective over R

**Construction or proof.**

1. RΓ(K, RΓ(𝔛_G, V)) splits over the K-orbits of components; on the orbit of X^G × g_iK it is RΓ(Γ_i, RΓ(X^G, V)).
2. X^G is contractible (symmetric-space-contractible), so RΓ(X^G, V) = V in degree 0, giving RΓ(Γ_i, V).
3. When all stabilizers have invertible order, the Leray spectral sequence of the coarse quotient map has trivial higher direct images (finite group cohomology vanishes), giving the coarse comparison.

**Acceptance properties.**

- H^*(SL_2(ℤ), ℤ) = ℤ, 0, ℤ/12, 0, ℤ/12, … (2-periodic from degree 2), unbounded although SL_2(ℤ)\ℍ is a surface.
- With R = ℤ[1/6] the same orbifold has H^0 = R and H^i = 0 for i > 0, the cohomology of the coarse space ℂ.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`; `ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition`; `ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space-contractible`; `mathlib:groupCohomology`; `mathlib:Rep`.

**Source passages.** [acc23], §2.1.2, proof of Lemma 2.1.7, p. 912: The free resolution through which RΓ becomes Hom over the group ring. [cg18], §5.2, arithmetic quotients (arXiv v2): Non-neat levels are orbifolds; their cohomology is orbifold cohomology.

### Theorem: Bounded finite projective models from a finite equivariant cell structure

**Identifier:** `ALS.1/finite-complex-model`.

Suppose the Borel–Serre closure of X^G × G(A^∞)^δ has a G(F) × K-invariant cell structure with finitely many cell orbits and trivial cell stabilizers for the full group G(F) × K, as at good neat K. For K′ open normal in K, its cellular chains C_• are bounded finite free ℤ[G(F) × K]-modules. For finite projective R-coefficients V, RΓ_{K/K′}(X_{K′}, V) is computed by Hom_{ℤ[G(F)×K′]}(C_•, V), a bounded finite projective R[K/K′]-complex. Hence it is perfect over R[K/K′]; for K′ = K, RΓ(X_K, V) is perfect over R with amplitude in [0,d_G]. The analogous relative cell model computes RΓ_c. Freeness only for G(F) × K′ does not imply perfectness over R[K/K′] when K has stabilizers.

**Hypotheses.** Finite G(F) × K-invariant cell structure, free for the full group G(F) × K; good neat K supplies the arithmetic case. K′ open normal in K (so K/K′ is finite). V finite projective over R.

**Construction or proof.**

1. Use a free full G(F) × K-cell structure, with finitely many orbits. Its bounded cellular chains are finite free over ℤ[G(F) × K]; restriction to the finite-index subgroup G(F) × K′ is then finite free over that subgroup as well.
2. Hom_{ℤ[G(F)×K′]}(C_•, V) computes RΓ(K′, RΓ(𝔛_G, V)) by sheaf-singular-comparison applied equivariantly, with its residual K/K′-action.
3. Each term Hom_{ℤ[G(F)×K′]}(ℤ[G(F)×K]^{⊕r}, V) ≅ (R[K/K′] ⊗_R V)^{⊕r}-type modules is finite projective over R[K/K′] when V is finite projective over R; hence perfectness (DeformationAndDerivedPatchingAlgebra P7 perfect objects).

**Acceptance properties.**

- For K′ = K neat, RΓ(X_K, V) is a perfect complex of R-modules with amplitude [0, d_G].
- For R = ℤ and V = ℤ, H^*(X_K, ℤ) is finitely generated in each degree.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`; `ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`; `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`; `mathlib:Module.Projective`.

**Source passages.** [acc23], §2.1.2, Lemma 2.1.7, p. 912: The perfectness statement (the finite triangulation is supplied by ALS.2). [acc23], §2.1.2, proof of Lemma 2.1.7, p. 912: The proof.

### Theorem: Derived coefficient change and the universal-coefficient spectral sequence

**Identifier:** `ALS.1/coefficient-change`.

Let R be noetherian, R → R′ a ring map, K neat and V a finite projective R-module with R[G(F)×K_S]-action (or, more generally, a bounded complex of such of uniform Tor-amplitude in [a, b]). Then (i) RΓ(X_K, V) ⊗^L_R R′ ≅ RΓ(X_K, V ⊗_R R′) and RΓ_c(X_K, V) ⊗^L_R R′ ≅ RΓ_c(X_K, V ⊗_R R′) naturally in D(R′), compatibly with level maps; (ii) there is a convergent spectral sequence E_2^{i,j} = Tor^R_{−i}(H^j(X_K, V), R′) ⇒ H^{i+j}(X_K, V ⊗_R R′), with every Tor term present; for R′ = R/ϖ^m and R a discrete valuation ring it degenerates to the short exact sequences 0 → H^j(X_K, V)/ϖ^m → H^j(X_K, V/ϖ^m) → H^{j+1}(X_K, V)[ϖ^m] → 0. Torsion-free cochains do not imply torsion-free cohomology: H^{j+1}(X_K, V)[ϖ^m] can be nonzero.

**Hypotheses.** R noetherian K neat V finite projective over R, or a bounded complex of such with Tor-amplitude in [a, b]

**Construction or proof.**

1. By finite-complex-model (with the finite cell structure from ALS.2) RΓ(X_K, V) = Hom_{ℤ[Γ]}(C_•, V) with C_• finite free, and Hom_{ℤ[Γ]}(C_•, V) ⊗_R R′ = Hom_{ℤ[Γ]}(C_•, V ⊗ R′) termwise since V is finite projective; this is the derived tensor because the terms are projective.
2. For a bounded complex V of finite projectives the same termwise argument applies to the total complex, with amplitude shifted by [a, b].
3. The spectral sequence is the Künneth (Tor) spectral sequence of the bounded complex of projectives Hom(C_•, V) tensored with R′.

**Acceptance properties.**

- V = ℤ, R′ = F_p: 0 → H^j(X_K, ℤ)/p → H^j(X_K, F_p) → H^{j+1}(X_K, ℤ)[p] → 0.
- If H^*(X_K, V) is R-free, coefficient change commutes with cohomology.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`; `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`; `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`; `mathlib:Module.Flat`; `mathlib:DerivedCategory`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`.

**Source passages.** [nt16], §3.1, Proposition 3.7(2), p. 48: Base change for compactly supported and ordinary cohomology (A finite free over R). [nt16], §3.1, proof of Proposition 3.7, p. 49: The proof route.

### Construction: Pullback and translation on Betti complexes

**Identifier:** `ALS.1/level-pullback`.

For K′ ⊂ K compact open and g ∈ G(A^∞) define in D(R): the pullback π^*_{K′,K} : RΓ(X_K, V) → RΓ(X_{K′}, V) (restriction of derived invariants from K to K′, equal to sheaf pullback along π_{K′,K} at neat level), and the translation r_g^* : RΓ(X_K, V) → RΓ(X_{gKg⁻¹}, V) induced by the isomorphism of equivariant sheaves V_𝔛 ≅ g^*V_𝔛 (for g ∈ G^S; for g_S ≠ 1 one needs V to carry a compatible action of a monoid containing g_S). They satisfy π^*_{K″,K′} ∘ π^*_{K′,K} = π^*_{K″,K}, r_h^* ∘ r_g^* = r_{hg}^*, r_k^* = id for k ∈ K, and r_g^* ∘ π^* = π^* ∘ r_g^*; the same maps exist on RΓ_c (proper level maps at neat level) and on RΓ_{K/K′}.

**Hypotheses.** K′ ⊂ K compact open g ∈ G^S, or V with a compatible monoid action at S

**Construction or proof.**

1. π^*: the restriction of derived invariants RΓ(K, −) → RΓ(K′, −) applied to RΓ(𝔛_G, V_𝔛).
2. r_g^*: the equivariant structure isomorphism [g] : V_𝔛 → g^*V_𝔛 (NT16 Definition 2.12) carries K-invariant sections to gKg⁻¹-invariant sections (right action of G(A^∞) on 𝔛_G); derive.
3. At neat level these are sheaf pullbacks along π_{K′,K} and r_g, by naturality of descent.
4. Right translations satisfy r_g ∘ r_h = r_{hg}; contravariance gives r_h^* ∘ r_g^* = r_{hg}^*, with the transported levels understood.

**API.**

- `LocallySymmetric.RΓ.pullback` (functoriality): π^*_{K′,K} : RΓ(X_K, V) → RΓ(X_{K′}, V), with pullback_id and pullback_comp.
- `LocallySymmetric.RΓ.translate` (functoriality): r_g^* : RΓ(X_K, V) → RΓ(X_{gKg⁻¹}, V) with translate_one, translate_mul and translate_of_mem (r_k^* = id for k ∈ K).
- `LocallySymmetric.RΓ.translate_pullback` (relation): r_g^* ∘ π^*_{K′,K} = π^*_{gK′g⁻¹, gKg⁻¹} ∘ r_g^*.
- `LocallySymmetric.RΓ.pullback_eq_sheafPullback` (compatibility): At neat level π^* is the sheaf pullback along π_{K′,K} and r_g^* the pullback along r_g.
- `LocallySymmetric.RΓc.pullback` (functoriality): The same maps on RΓ_c (level maps are proper at neat level), commuting with forget-supports.

**Unit tests.**

- `pullback_H0` (computation): In degree 0, π^*_{K′,K} : R^{π_0(X_K)} → R^{π_0(X_{K′})} is the map induced by π_0(π_{K′,K}) (each component pulled back to the union of the components over it).
- `translate_of_mem` (degenerate): For k ∈ K, r_k^* = id on RΓ(X_K, V).
- `pullback_injective_rational` (characterisation): If K is neat and [K : K′] is invertible in R then π^* is split injective on H^*, with left inverse [K : K′]⁻¹·(trace) (see ALS.3/level-trace).
- `pullback_not_iso` (non-example): π^* is not an isomorphism in general: for GL_{2,ℚ}, π^* : H^1(X_{K(3)}, ℚ) → H^1(X_{K(9)}, ℚ) has a nonzero cokernel (the genus grows).

**Consumers.**

- NT16 §2.3, the endomorphism θ(α): θ(α) = trace ∘ (isomorphism) ∘ p_2^* is built from these pullbacks
- ALS.3/hecke-operator-formula: Hecke operators are composites of translation, pullback and trace
- CompletedCohomologyPartII:CC.1: colimits over K of H^i(X_K, V) along π^*

**Acceptance properties.**

- π^* in degree 0 is the map R^{π_0(X_K)} → R^{π_0(X_{K′})} induced by π_0(π_{K′,K}).
- r_k^* = id for k ∈ K.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`; `ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; `tauceti:TauCeti.LocalCoefficientSystem.pullback`.

**Source passages.** [nt16], §2.3, after Proposition 2.18, p. 27: The two maps whose pullbacks are π^* and r_α^* ∘ π^* (page approximate). [acc23], §2.1.2, p. 911: Descent used to identify the equivariant and sheaf pullbacks.

## ALS.2. Borel–Serre corners, strata and filtrations

Use the geodesic A_P action to construct each face and associated analytic corner, then glue by nested-parabolic open embeddings. Arithmetic properness gives compact quotients. Round and triangulate the original pair to obtain finite cell models. Every stratum is a sum of transported P-spaces with its own nilmanifold fibration and arithmetic extension. Localized support induction uses the compact-support exact couple; the ordinary GL_N flag sequence has its own pages and signs.

**Planets:** Boundary face e(P) and geodesic action; Borel–Serre partial compactification; Compactness of Γ\X̄ (Borel–Serre); Borel–Serre boundary stratification; Nilmanifold fibration of boundary strata.

**Coverage:** planned. Remaining closure: Resolve the exact inputs recorded in Typed arithmetic and analytic corner interfaces. Resolve the exact inputs recorded in Nondecomposed levels and reductive characteristic-zero splitting. Resolve the exact inputs recorded in Stage order for geometry, supports, duality and automorphic applications. Resolve the exact inputs recorded in Suggested signatures: ALS.2.

### Construction: Geodesic action and the boundary face e(P)

**Identifier:** `ALS.2/geodesic-action-boundary-face`.

Let 𝐆 = Res_{F/ℚ}G and P a rational parabolic subgroup of 𝐆 (equivalently an F-parabolic of G) with unipotent radical N_P and Levi quotient L_P = P/N_P. Let S_P be the maximal ℚ-split central torus of the Levi quotient L_P, modulo the image of the maximal ℚ-split central torus of 𝐆 (equivalently the split-radical quotient Rd(P)/(R_u(P)·Rd(𝐆)) in NT16's convention), and A_P = S_P(ℝ)°. For x ∈ X^G let L′_x ⊂ P_ℝ be the unique Levi subgroup stable under the Cartan involution attached to the maximal compact subgroup of Stab(x). The geodesic action of A_P on X^G is a • x = a_x·x with a_x ∈ L′_x(ℝ) the lift of a; it is free, commutes with P(ℝ) and with the action of P(ℚ). The boundary face is e(P) = A_P\X^G, a space of type S−Q for P, with e(P) ≅ N_P(ℝ) × X_{L_P} (X_{L_P} the symmetric space of L_P with its own split centre already removed) via a choice of horospherical trivialization; transport the P(ℝ)-action to this product (the Levi action includes the conjugation action on N_P); dim e(P) = d_G − dim A_P. For P = 𝐆, e(𝐆) = X^G.

**Hypotheses.** P a rational parabolic subgroup of Res_{F/ℚ}G, including G for the whole-group face; proper P for a boundary face.

**Construction or proof.**

1. Borel–Serre 3.2 constructs the x-dependent lift in the unique Cartan-stable Levi, proves independence of lifting modulo the already-removed radical, and shows the geodesic action commutes with P(ℝ). Proposition 3.4 proves freeness and properness.
2. Sections 3.6–3.9 give the analytic principal A_P-bundle and identify its quotient as a type S–Q space for P; use Rd(P)/(R_u(P)Rd(G)) for relative A_P, so the centre is removed exactly once.
3. Apply a horospherical trivialization to obtain N_P(ℝ)×X_{L_P}, transporting the parabolic action. AA.3 owns the general decomposition; the precise reductive/disconnected extension is requested there. The dimension follows by subtracting dim A_P.

**API.**

- `LocallySymmetric.BorelSerre.geodesicAction` (data): The action A_P × X^G → X^G, (a, x) ↦ a • x.
- `LocallySymmetric.BorelSerre.geodesicAction_free` (characterisation): The geodesic action is free and proper, and commutes with the left action of P(ℝ).
- `LocallySymmetric.BorelSerre.face` (data): e(P) = A_P\X^G with its P(ℝ)-action (a space of type S−Q for P).
- `LocallySymmetric.BorelSerre.faceEquiv` (equivalence): A horospherical trivialization identifies e(P) with N_P(ℝ) × X_{L_P}; transport the P(ℝ)-action to this product, including the Levi conjugation action on N_P.
- `LocallySymmetric.BorelSerre.face_conj` (functoriality): For γ ∈ 𝐆(ℚ)=G(F), x ↦ γx induces e(P) ≅ e(γPγ⁻¹) compatibly with the geodesic actions.
- `LocallySymmetric.BorelSerre.face_dim` (other): dim e(P) = d_G − dim A_P.

**Unit tests.**

- `face_SL2_borel` (computation): For SL_{2,ℚ} and the upper triangular Borel B, e(B) ≅ N_B(ℝ) ≅ ℝ (X_{L_B} is a point) and dim e(B) = 2 − 1 = 1.
- `face_whole_group` (degenerate): For P = 𝐆, A_P = 1 (in this convention A_𝐆 is already divided out) and e(𝐆) = X^G.
- `face_GL3_minimal` (computation): For GL_{3,ℚ} and the Borel B, A_B ≅ ℝ_{>0}², X^G has dimension 5 and e(B) ≅ N_B(ℝ) (a Heisenberg group, dimension 3) has dimension 5 − 2 = 3.
- `geodesicAction_ne_leftAction` (non-example): The geodesic action is not the left action of A_P ⊂ P(ℝ) through a fixed Levi: for SL_{2,ℚ} the left action of diag(a, a⁻¹) on ℍ, z ↦ a²z, moves horizontally displaced points along rays through 0, whereas the geodesic action moves every point vertically.

**Consumers.**

- NT16 §3.1: e(P) are the boundary faces of the Borel–Serre compactification; X_P = A_P\X^G is the S−Q space of P
- ACC+ §2.4.1: the stratum X̃^Q_K = Q(F⁺)\(X^Q × G̃(A^∞)/K̃) of the Siegel parabolic
- BorelRegulators:R.1/steinberg-duality-finiteness: boundary coordinates for the Borel–Serre model

**Acceptance properties.**

- SL_{2,ℚ}, P = B upper triangular: A_P ≅ ℝ_{>0} acts on ℍ by the geodesic flow z ↦ x + i a y-type rescaling along vertical geodesics towards ∞, and e(B) ≅ N(ℝ) ≅ ℝ.
- dim e(P) = d_G − rank_ℚ S_P.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space`; `ArithmeticLocallySymmetricSpaces:ALS.0/cartan-involution`; `AdelicAlgebraicGroups:AA.3/horospherical-decomposition`; `AdelicAlgebraicGroups:AA.3/minimal-parabolic-data`; `tauceti:TauCeti.Cocharacter.parabolic`; `tauceti:TauCeti.Cocharacter.leviDecompositionMulEquiv`.

**Source passages.** [nt16], §3.1, p. 41: The geodesic action. [nt16], §3.1, p. 41: The quotient e(P) = X_P. [jm02], §7.3, p. 483: The horospherical description of e(P). [bs73], §§3.2–3.9: The original construction supplies the analytic principal bundle for a type S–k space, including relative split radicals; no fixed-Levi left action is substituted.

### Construction: The Borel–Serre partial compactification X̄^G

**Identifier:** `ALS.2/borel-serre-bordification`.

As a set X̄^G=⊔_{P rational parabolic, including G} e(P), with e(G)=X^G. For Δ_P the simple relative roots, let Ā_P=(0,∞]^{Δ_P}; reciprocals of the root coordinates identify it analytically with [0,∞)^{Δ_P}. The associated corner X^G(P)=X^G×^{A_P}Ā_P is an analytic manifold with corners and equals ⊔_{Q⊇P}e(Q). If P⊂Q, the root-factorization A_P=A_{P,Q}×A_Q gives the analytic open embedding X^G(Q)→X^G(P) of Borel–Serre 5.3. Glue these embeddings: X^G(P)∩X^G(Q)=X^G(R), where R is the smallest rational parabolic containing P and Q (R may be G). This is an atlas of open corners, with cocycle identities from the root-factorizations. The interior is X^G; closure(e(P))=⊔_{Q⊂P}e(Q), and e(P) meets closure(e(Q)) exactly when P⊂Q. The rational action extends analytically by γe(P)=e(γPγ⁻¹). The inclusion of the interior is a homotopy equivalence, so X̄^G is contractible. Set 𝔛̄_G=G(F)\(X̄^G×G(A^∞)^δ), X̄_K=G(F)\(X̄^G×G(A^∞)/K), with boundary the union of proper-parabolic faces.

**Hypotheses.** G connected reductive over F

**Construction or proof.**

1. Use Borel–Serre 5.1 to form the associated bundle for the free proper geodesic action and identify each face with e(Q), P⊂Q. Reciprocal root coordinates give quadrant charts.
2. For P⊂Q, apply 5.3: factor A_P as A_{P,Q}×A_Q and keep the A_{P,Q} coordinates finite in the open subcorner. The induced maps are analytic and their compositions agree for P⊂Q⊂R.
3. Section 7.1 proves Hausdorff gluing and the exact intersection X(P)∩X(Q)=X(R) for the generated parabolic R. Sections 7.3–7.5 identify closures and incidence; two closures meet in ē(P∩Q) if P∩Q is parabolic and otherwise are disjoint.
4. Use 7.6 for the rational analytic action. The collar argument of 8.3.1 makes the interior inclusion a homotopy equivalence; 8.6.4 gives contractibility from X^G. Form the adelic quotients with the discrete finite factor.

**API.**

- `LocallySymmetric.BorelSerre.bordification` (data): X̄^G as a topological space (manifold with corners) containing X^G as an open dense subset.
- `LocallySymmetric.BorelSerre.corner` (data): X^G(P)=⊔_{Q⊇P}e(Q)≅X^G×^{A_P}Ā_P is open; X(P)∩X(Q)=X(R) for the smallest rational parabolic R containing P,Q. Nested embeddings are analytic and satisfy the cocycle identity.
- `LocallySymmetric.BorelSerre.boundary` (data): ∂X̄^G = ⊔_{P proper} e(P), closed in X̄^G.
- `LocallySymmetric.BorelSerre.closure_face` (characterisation): The closure of e(P) in X̄^G is ⊔_{Q ⊂ P} e(Q).
- `LocallySymmetric.BorelSerre.smul` (instance): 𝐆(ℚ)=G(F) acts analytically on X̄^G extending its action on X^G, with γ·e(P) = e(γPγ⁻¹).
- `LocallySymmetric.BorelSerre.contractible` (other): X̄^G is contractible and the inclusion X^G → X̄^G is a homotopy equivalence.
- `LocallySymmetric.BorelSerre.adelic` (data): X̄_K = G(F)\(X̄^G × G(A^∞)/K) and ∂X̄_K, with the open immersion j_K : X_K → X̄_K.

**Unit tests.**

- `bordification_SL2` (computation): For SL_{2,ℚ}, ∂X̄ = ⊔_{c∈ℙ¹(ℚ)} e(P_c) with each e(P_c) ≅ ℝ, and SL_2(ℤ)\∂X̄ is a single circle (one cusp, the circle N(ℤ)\N(ℝ)).
- `bordification_anisotropic` (degenerate): If G is anisotropic over F (no proper F-parabolics), X̄^G = X^G and ∂X̄^G = ∅.
- `bordification_interior` (characterisation): The interior is X^G and e(P) has codimension |Δ_P| in X^G(P). For two distinct minimal parabolics of SL₂, their open corners intersect in X^G=X^G(G), although their boundary faces are disjoint.
- `bordification_ne_onePoint` (non-example): X̄_K is not the one-point (or Baily–Borel) compactification: for a modular curve each cusp is replaced by a circle, so the boundary has Euler characteristic 0 and H^1(∂X̄_K, ℤ) has rank equal to the number of cusps.

**Consumers.**

- ACC+ §2.1.1–2.1.2: X̄_K, ∂X_K and the Hecke action on RΓ(X̄_K, j_!V) = RΓ_c(X_K, V)
- NT16 §3.1: the Borel–Serre compactification defines the Hecke action on compactly supported cohomology
- CompletedCohomologyPartII:CC.0, CC.4, CC.7: Borel–Serre models along the tower
- BorelRegulators:R.1: finite models and boundary coordinates

**Acceptance properties.**

- SL_{2,ℚ}: X̄ = ℍ ∪ ⊔_{c ∈ ℙ¹(ℚ)} ℝ, a real line attached at each cusp; locally (0, ∞] × ℝ near the cusp.
- For G anisotropic over ℚ there are no proper rational parabolics and X̄^G = X^G.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.2/geodesic-action-boundary-face`; `mathlib:ModelWithCorners`; `mathlib:ContractibleSpace`; `AdelicAlgebraicGroups:AA.3/positive-root-coordinates`.

**Source passages.** [acc23], §2.1.1, p. 910: The object, attributed to Borel–Serre §7.1. [jm02], §7.3, p. 483: Corners from the geodesic action. [jm02], §7.4, Proposition 7.4, p. 484: G(ℚ)-action and proper discontinuity (quoting Borel–Serre Prop. 7.6, Thm. 9.3). [bs73], §§5.1–5.3, 7.1–7.6: Associated analytic corners, nested-parabolic open embeddings, generated-parabolic intersections, closure order and rational action are read directly in the original construction.

### Theorem: Compactness of the Borel–Serre quotient and the interior homotopy equivalence

**Identifier:** `ALS.2/borel-serre-quotient-compact`.

Every arithmetic subgroup Γ ⊂ 𝐆(ℚ) acts properly discontinuously on X̄^G with compact Hausdorff quotient Γ\X̄^G. Consequently, for every compact open K, X̄_K is compact Hausdorff; if K is neat, X̄_K is a compact smooth manifold with corners with interior X_K and boundary ∂X̄_K, and the inclusion j_K : X_K → X̄_K is a homotopy equivalence. At neat K, ∂X̄_K = X̄_K ∖ X_K is a compact topological manifold of dimension d_G − 1; its original corner strata give a finite stratification, rather than a smooth boundary obtained by treating intersecting faces as disjoint (empty iff G is F-anisotropic modulo centre).

**Hypotheses.** Γ arithmetic K compact open; neat for the manifold-with-corners statement

**Construction or proof.**

1. Reduction theory: finitely many Siegel sets 𝔖_i cover X^G modulo Γ and have the Siegel finiteness property (AdelicAlgebraicGroups AA.3/real-siegel-finite-cover, real-siegel-finite-overlap, finitely-many-cusps).
2. The closure of a Siegel set in the corner X^G(P) is compact (the A_P-coordinates range over a translate of (t, ∞]^{Δ_P}); hence Γ\X̄^G is a finite union of compact images, and Hausdorffness follows from the finiteness property (Borel–Serre Theorem 9.3).
3. At neat level Γ acts freely on X̄^G, so the quotient is a manifold with corners; a collar of the boundary gives the homotopy equivalence X_K ≃ X̄_K.
4. Adelic statement: X̄_K = ⊔ Γ_i\X̄^G by the component decomposition.

**Acceptance properties.**

- For a modular curve Γ(N)\ℍ, the Borel–Serre compactification is a compact surface with one boundary circle per cusp.
- For G F-anisotropic modulo centre, X_K is already compact.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification`; `ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition`; `ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold`; `AdelicAlgebraicGroups:AA.3/real-siegel-finite-cover`; `AdelicAlgebraicGroups:AA.3/finitely-many-cusps`; `AdelicAlgebraicGroups:AA.3/real-siegel-finite-overlap`.

**Source passages.** [acc23], §2.1.1, p. 910: The statement at good level. [jm02], §7.4, Proposition 7.4, p. 484: Compact Hausdorff quotient. [bs73], Theorem 9.3 and §9.5: Proper compact quotient and the torsion-free criterion. Compactness is also explained by finite closed Siegel-set covers in the proof.

### Theorem: Finite triangulations and finiteness of Betti cohomology

**Identifier:** `ALS.2/borel-serre-finite-triangulation`.

For neat K, X̄_K admits a finite triangulation, and it pulls back to a G(F) × K-invariant triangulation of X̄^G × G(A^∞) with finitely many orbits of simplices and free action of G(F) × K′ for every neat K′ ⊂ K. Consequently: (i) X_K has the homotopy type of a finite CW complex; (ii) for K′ ⊂ K normal and both neat and V finite projective over a noetherian ring R, RΓ_{K/K′}(X_{K′}, V) and RΓ_{c,K/K′}(X_{K′}, V) are perfect in D(R[K/K′]) and RΓ(X_K, V), RΓ_c(X_K, V), RΓ(∂X̄_K, V) are perfect in D(R); (iii) H^*(X_K, V) and H^*_c(X_K, V) are finitely generated R-modules, zero outside [0, d_G].

**Hypotheses.** K neat (K′ ⊂ K normal and neat) R noetherian V finite projective over R

**Construction or proof.**

1. A compact real-analytic manifold with corners admits a triangulation (Borel–Serre §11), finite by compactness (borel-serre-quotient-compact).
2. Pull back along the covering X̄^G × G(A^∞) → X̄_K (free at neat level) to an invariant triangulation with finitely many orbits.
3. Apply ALS.1/finite-complex-model to the cellular chains (and to the relative chains of (X̄, ∂X̄) for compact supports), using RΓ(X_K, V) ≅ RΓ(X̄_K, V) from the homotopy equivalence.

**Acceptance properties.**

- H^*(X_K, ℤ) is finitely generated for every neat K.
- For SL_2(ℤ)-level the orbifold cohomology is not bounded (group-cohomology-comparison), so neatness is needed for (ii).

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact`; `ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations`; `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`; `tauceti:TauCetiRoadmap/GeometricTopology#layer-11-triangulations-pl-structures-and-collapse`.

**Source passages.** [acc23], §2.1.2, proof of Lemma 2.1.7, p. 912: The triangulation. [acc23], §2.1.2, Lemma 2.1.4, p. 911: Finite generation. [bs73], §11.1: Round the compact smooth corner quotient and triangulate it; pull back its finite triangulation. Both full and refined levels must be neat for group-ring perfectness.

### Construction: The stratification of the Borel–Serre boundary by parabolic classes

**Identifier:** `ALS.2/boundary-stratification`.

Let P_1, …, P_s represent the G(F)-conjugacy classes of proper F-parabolic subgroups of G. For a rational parabolic P put 𝔛_P = P(F)\(e(P) × P(A^∞)^δ) and, for compact open K, X^P_K = P(F)\(e(P) × G(A^∞)/K). The maps j_{P_i} : Ind_{P_i^∞}^{G^∞} 𝔛_{P_i} = P_i(F)\(G(A^∞) × e(P_i)) → ∂𝔛̄_G are G(A^∞)-equivariant locally closed immersions and ⊔_i Ind 𝔛_{P_i} → ∂𝔛̄_G is a continuous bijection; at level K, ⊔_i X^{P_i}_K → ∂X̄_K is a continuous bijection onto a finite stratification by locally closed strata, the stratum of P lying in the closure of that of Q iff P is conjugate into Q. For P maximal, X^P_K is open in ∂X̄_K. X^P_K decomposes further over P(F)\G(A^∞)/K into quotients Γ_P\e(P) with Γ_P = P(F) ∩ gKg⁻¹.

**Hypotheses.** K compact open

**Construction or proof.**

1. ∂X̄^G = ⊔_P e(P); G(F) permutes the faces by conjugation; group the faces by conjugacy class and use that a parabolic is its own normalizer, so ⊔_{P′∼P_i} e(P′) = G(F) ×^{P_i(F)} e(P_i) (NT16 Lemma 3.10 proof).
2. Local closedness: e(P) is open in its closure ⊔_{Q⊂P} e(Q) (borel-serre-bordification); finiteness of strata at level K is finiteness of P(F)\G(A^∞)/K and of conjugacy classes of parabolics (AdelicAlgebraicGroups AA.3).
3. For P maximal there is no proper parabolic properly containing P, so e(P) is open in ∂X̄^G.

**API.**

- `LocallySymmetric.BorelSerre.stratum` (data): X^P_K = P(F)\(e(P) × G(A^∞)/K) with its locally closed immersion j_P : X^P_K → ∂X̄_K (depending only on the G(F)-class of P up to isomorphism).
- `LocallySymmetric.BorelSerre.stratum_bijective` (characterisation): ⊔_{i} X^{P_i}_K → ∂X̄_K is a continuous bijection, P_i running over representatives of G(F)-classes of proper parabolics.
- `LocallySymmetric.BorelSerre.stratum_closure` (characterisation): The closure of the stratum of P is the union of the strata of the parabolics conjugate into P.
- `LocallySymmetric.BorelSerre.stratum_isOpen_of_maximal` (other): For P maximal, j_P is an open immersion.
- `LocallySymmetric.BorelSerre.stratum_components` (characterisation): X^P_K ≅ ⊔_{g ∈ P(F)\G(A^∞)/K} Γ_{P,g}\e(P) with Γ_{P,g} = P(F) ∩ gKg⁻¹.

**Unit tests.**

- `stratum_SL2_cusps` (computation): For SL_{2,ℚ} at neat level K, the strata are the cusps of X_K, each a circle Γ_N\N(ℝ) ≅ ℝ/ℤ·h (h the cusp width).
- `stratum_anisotropic_empty` (degenerate): If G has no proper F-parabolic, there are no strata and ∂X̄_K = ∅.
- `stratum_GL3_poset` (characterisation): For GL_{3,F} there are three classes of proper parabolics (two maximal, one Borel); the Borel stratum lies in the closure of both maximal strata, which are open in ∂X̄_K.
- `stratum_not_disjoint_union_topologically` (non-example): ∂X̄_K is not the topological disjoint union of the strata: for GL_3 the closure of a maximal stratum meets the Borel stratum, so the bijection ⊔ X^{P_i}_K → ∂X̄_K is not a homeomorphism.

**Consumers.**

- NT16 Lemma 4.4: induction over strata with the compact-support long exact sequence reduces boundary statements to strata
- ACC+ Theorem 2.4.2: the Siegel stratum X̃^P is open in ∂X̃ and carries the localized boundary cohomology
- IgusaVarietiesAndTorsionConcentration:IG.6: boundary strata in the equivariant boundary formula

**Acceptance properties.**

- For GL_2 over F, the strata are indexed by B(F)\GL_2(A^∞)/K, the cusps; each stratum is a torus bundle (a circle for F = ℚ, a 2-torus for F imaginary quadratic).
- For G F-anisotropic there are no strata.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact`; `AdelicAlgebraicGroups:AA.3/finitely-many-cusps`; `AdelicAlgebraicGroups:AA.3/parabolic-double-cosets-finite`; `AdelicAlgebraicGroups:AA.3/minimal-parabolic-data`.

**Source passages.** [nt16], §3.1, before Lemma 3.10, p. 50: The stratification. [nt16], §3.1, Lemma 3.10(2), p. 51: The level-K statement. [acc23], §2.4.1, p. 941: The stratum formula.

### Theorem: Boundary strata fibre over Levi quotients with nilmanifold fibres

**Declaration:** theorem; node `ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration`.

Let P = M ⋉ N be a rational parabolic. Distinguish the P-space Y^P_L = P(F)\(e(P) × P(A^∞)/L) from the induced G-stratum X^P_K of boundary-stratification. The latter decomposes over representatives g of P(A^∞)\G(A^∞)/K as a disjoint union of Y^P_{L_g}, where L_g = P(A^∞) ∩ gKg⁻¹. For each good neat L_g decomposed as L_{M,g} ⋉ L_{N,g}, the projection e(P) ≅ N(ℝ) × X_M → X_M induces a proper submersion Y^P_{L_g} → X^M_{L_{M,g}}. Here X_M already has its own split centre removed. On an arithmetic component the fibre is the compact nilmanifold Γ_{N,g}\N(ℝ); its monodromy is induced by the extension 1 → Γ_{N,g} → Γ_{P,g} → Γ_{M,g} → 1. The local system R^qπ_*V has stalk H^q(Γ_{N,g}, V). A global stratum with multiple g is not assigned one untransported Levi base. Nondecomposed levels require a separate comparison after refinement.

**Hypotheses.**

- Each transported P-level L_g used in the fibration is good, neat and decomposed with respect to P = M ⋉ N.

**Construction or proof.**

1. First decompose the induced G-stratum over P(A^∞)\G(A^∞)/K. On each transported P-level use the P-equivariant horospherical decomposition and the arithmetic extension Γ_N → Γ_P → Γ_M; do not assume that an arbitrary arithmetic extension splits.
2. N(ℝ) is a simply connected nilpotent Lie group and Γ_N is a cocompact lattice (unipotent groups have compact arithmetic quotients; AA.3/unipotent-class-number-one), so the fibre is a compact nilmanifold (AdditiveCombinatorics AC.3 owns nilmanifolds, Mal'cev bases and rationality).
3. Local triviality: the projection is a smooth proper submersion (Ehresmann), monodromy by conjugation of Γ_M on Γ_N; R^qπ_*V has stalk H^q(Γ_N\N(ℝ), V) = H^q(Γ_N, V) since the nilmanifold is a K(Γ_N, 1).

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification`, `ArithmeticLocallySymmetricSpaces:ALS.2/geodesic-action-boundary-face`, `AdditiveCombinatorics:AC.3`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`, `AdelicAlgebraicGroups:AA.3/unipotent-class-number-one`.

**Acceptance checks.**

- For SL_{2,ℚ} and P = B, M = T is a torus with X_M a point and the stratum is the circle Γ_N\N(ℝ).
- For GL_3 and the Borel, fibres are Heisenberg nilmanifolds of dimension 3 over a point.

**Sources.**

- [J. Newton, J. A. Thorne, Torsion Galois representations over CM fields and Hecke algebras in the derived category](https://doi.org/10.1017/fms.2016.16), §3.1, p. 43. The fibration for the projection to the Levi quotient (NT16's H = G/N).
- [G. Harder, A. Raghuram, Eisenstein cohomology for GL_N and ratios of critical values of Rankin–Selberg L-functions](https://arxiv.org/abs/1405.6513v2), §4.2.1, p.25, before (4.2) (arXiv:1405.6513v2). The fibration over the Levi locally symmetric space and its Leray–Serre spectral sequence (characteristic zero).

**Atlas planet:** Nilmanifold fibration of boundary strata.

**Implementation status:** `unchecked`.

### Construction: The stratification filtration of ∂X̄_K and its spectral sequence

**Identifier:** `ALS.2/stratification-spectral-sequence`.

Let B=∂X̄_K at neat K. For p≥0 set Z_p=union of strata of relative parabolic rank ≥p+1, with Z_0=B and Z_{r+1}=∅, and U_p=Z_p\Z_{p+1}. Put O_p=B\Z_{p+1}, O_{−1}=∅, F_p=RΓ_c(O_p,V), A_p=RΓ_c(U_p,V). Open/closed localization gives F_{p−1}→F_p→A_p→F_{p−1}[1]. Its exact couple has D_1^{p,q}=H^{p+q}_c(O_p,V), E_1^{p,q}=⊕_{rk P=p+1}H^{p+q}_c(X^P_K,V), i of bidegree (1,−1), j of bidegree (0,0), k of bidegree (−1,2). Thus d_r has bidegree (−r,r+1), and finite convergence gives H^{p+q}(B,V) with the filtration induced by the O_p. Reindexing (s,t)=(−p,q+2p) preserves s+t=p+q and gives the usual differential bidegree (r,1−r). Separately, for G=Res_{F/ℚ}GL_N with F totally real, the ordinary closed-cover/flag resolution of Harder–Raghuram §4.1 gives E_1^{p,q}=⊕_{[P],rk P=p+1}H^q(X^P_K,V)⇒H^{p+q}(B,V), d_1:(p,q)→(p+1,q). Order maximal standard parabolics; its d_1 is the alternating restriction to intersections, with sign (−1)^j when the j-th vertex is deleted. Compactified strata and all arithmetic translates/transported levels are included in this resolution; a single untransported Γ_P is not the global stratum. The two sequences have different indexing and maps and are not identified by relabelling their E_1 pages. Both constructions are finite, natural in coefficients and compatible with level maps and translations.

**Hypotheses.** K neat V a sheaf (local system) on ∂X̄_K

**Construction or proof.**

1. Closure order in boundary-stratification makes Z_p closed and O_p open. Decompose U_p into the finitely many global strata of rank p+1, keeping each transported-level component. Open/closed localization gives the displayed distinguished triangle.
2. Apply cohomology to F_{p−1}→F_p→A_p. The inclusions F_p→F_{p+1}, quotient F_p→A_p and connecting A_p→F_{p−1}[1] have exactly the displayed three bidegrees. Form the derived exact couples to obtain d_r of degree (−r,r+1).
3. The finite range of p gives exhaustive finite convergence to H_c(B,V)=H(B,V), because B is compact; no infinite convergence condition is used.
4. For the separate totally real GL_N sequence use Harder–Raghuram §4.1, pp. 23–24: the boundary cover and flag resolution, with the explicitly ordered simplex signs σ(P,Q). Ordinary compactified-stratum cohomology equals open-stratum cohomology by the interior homotopy equivalence. The extension beyond that totally real GL_N setting remains an exact gap.

**API.**

- `LocallySymmetric.BorelSerre.stratFiltration` (data): The closed filtration Z_k of ∂X̄_K by unions of strata of parabolic rank ≥ k + 1.
- `LocallySymmetric.BorelSerre.stratSpectralSequence` (data): The spectral sequence E_1^{p,q} = ⊕_{rk P = p+1} H^{p+q}_c(X^P_K, V) ⇒ H^{p+q}(∂X̄_K, V).
- `LocallySymmetric.BorelSerre.stratSpectralSequence_d1` (characterisation): For the compact-support exact couple, d₁:E₁^{p,q}→E₁^{p−1,q+2} is j∘k, the connecting map of F_{p−1}→F_p→A_p followed by its quotient to A_{p−1}; it goes from higher-rank to lower-rank strata with total degree +1.
- `LocallySymmetric.BorelSerre.stratSpectralSequence_map` (functoriality): Natural in V and compatible with π_{K′,K} and r_g.
- `LocallySymmetric.BorelSerre.mayerVietorisSpectralSequence` (data): For Res_{F/ℚ}GL_N with F totally real the ordinary flag/closed-cover sequence has E₁^{p,q}=⊕_{rk P=p+1}H^q(X^P_K,V), d₁ of bidegree (1,0), with alternating restriction signs (−1)^j from deletion in the ordered maximal-parabolic simplex. Its global strata include all transported levels.

**Unit tests.**

- `stratSS_SL2` (computation): For SL_{2,ℚ} at neat level with c cusps, E_1 = E_∞ = ⊕_{c} H^*(S^1, V), so H^0(∂X̄_K, ℤ) = ℤ^c and H^1(∂X̄_K, ℤ) = ℤ^c for trivial V.
- `stratSS_empty` (degenerate): For G F-anisotropic the filtration is empty and the spectral sequence is zero.
- `stratSS_rank_one_collapse` (characterisation): If the F-rank of G modulo centre is 1, all proper parabolics are minimal and maximal, the strata are closed and open, and H^*(∂X̄_K, V) = ⊕_P H^*(X^P_K, V).
- `stratSS_E1_not_complex` (non-example): For rank ≥2 the compact-support d₁ is a localization connecting map of degree (−1,2), while the ordinary GL_N flag d₁ is an alternating restriction of degree (1,0). The ordinary degree-zero restriction from a connected maximal stratum to a nonempty incident Borel stratum sends 1 to 1. Neither E₁ page alone is asserted to be the boundary cohomology.

**Consumers.**

- NT16 Lemma 4.4: vanishing after localization on each stratum implies vanishing on ∂X̄_K
- ALS.4/boundary-gluing-convergence: Hecke-equivariant convergence and gluing
- ALS README, completion contracts: the incidence maps between parabolics must be part of the boundary spectral sequence

**Acceptance properties.**

- For SL_{2,ℚ} the filtration has one step and E_1 = ⊕_{cusps} H^*(circle).
- For GL_3 the spectral sequence has two columns: the maximal strata (p = 0) and the Borel strata (p = 1).

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact`; `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Source passages.** [nt16], §4, proof of Lemma 4.4, p. 56: The filtration by unions of strata and the compact-support long exact sequences. [nt16], §3.1, Lemma 3.10(1), p. 51: The strata used in the filtration. [hr], §4.1, pp. 23–24, sign σ(P,Q) and d₁ formula: The ordinary GL_N sequence uses alternating restrictions on compactified strata; this source is not the compact-support exact couple.

## ALS.3. Hecke correspondences, traces and derived images

Apply the abstract pinned convolution ring to invariant sections and discrete derived invariants. Pullback, coefficient transport and trace define the geometric operators; disjoint coset representatives give the action and Mackey composition. The compactified support model supplies supported and boundary compatibility. IHG.2 owns the finite derived-image and spectral-idempotent theory. Twists multiply the basis coefficients by inverse characters and twist general coefficient modules.

**Planets:** Hecke action on invariants and derived invariants; Hecke action on RΓ(X_K, V); Derived Hecke algebra T^S(K, V).

**Coverage:** planned. Remaining closure: Resolve the exact inputs recorded in Coherent equivariant supports, refinements and trace. Resolve the exact inputs recorded in Suggested signatures: ALS.3.

### Construction: Hecke rings acting on invariants and on derived invariants

**Identifier:** `ALS.3/hecke-action-on-invariants`.

Let Δ be a group, or a submonoid of an ambient group G, and U ⊂ Δ a subgroup of G with (Δ, U) a Hecke pair (IsHeckeTriple Δ U U), and 𝕋(Δ, U) = 𝕋 Δ U ℤ the Hecke ring (Mathlib's HeckeRing with Tau Ceti's convolution ring structure). For a ℤ[Δ]-module M define the 𝕋(Δ, U)-module structure on M^U by [UαU]·m = Σ_i α_i m where UαU = ⊔_i α_iU; equivalently [UαU] acts as M^U → M^{U∩αUα⁻¹} → M^U, m ↦ α·m followed by the trace tr_{U/U∩αUα⁻¹}. This defines a left exact functor Γ_U : Mod(ℤ[Δ]) → Mod(𝕋(Δ, U)) whose composite with the forgetful functor is U-invariants, and its right derived functor RΓ_U : D⁺(ℤ[Δ]) → D⁺(𝕋(Δ, U)) lifts RΓ(U, −). For a locally profinite G and compact open U, 𝕋(G, U) is the ring H(G, U) of compactly supported U-biinvariant ℤ-valued functions under convolution for the Haar measure with vol(U) = 1; over R, H(G, U) ⊗ R.

**Hypotheses.** (Δ, U) a Hecke pair: U and αUα⁻¹ commensurable for α ∈ Δ; in the monoid case Δ is a submonoid of an ambient group G and U is contained in Δ (as required by the pinned IsHeckeTriple)

**Construction or proof.**

1. Well-definedness and independence of the coset representatives α_i: a different choice changes α_i by right multiplication with U, which fixes m ∈ M^U.
2. Compatibility with the product: [UαU]·([UβU]·m) = ([UαU]·[UβU])·m reduces to #(UαU ∩ γUβ⁻¹U/U) = #{(i, j) : γ ∈ α_iβ_jU} (NT16 Lemma 2.3), which is the structure-constant formula of Tau Ceti's Hecke ring.
3. Γ_U is left exact and Mod(ℤ[Δ]) has enough injectives; derive. Since Δ is a submonoid of a group and contains U, its left U-orbits are free, so ℤ[Δ] is free as a right ℤ[U]-module. Exact induction implies restriction preserves injectives, and the forgetful composite is RΓ(U, −). This argument does not apply to arbitrary abstract monoids.
4. Identification with H(G, U) for locally profinite G: a double coset UαU ↦ its characteristic function, with the convolution normalised by vol(U) = 1 (SmoothRepresentationsOfLocalGroups SR.1).

**API.**

- `LocallySymmetric.Hecke.invariantsModule` (instance): M^U is a module over 𝕋(Δ, U) via [UαU]·m = Σ α_i m.
- `LocallySymmetric.Hecke.smul_eq_trace` (characterisation): [UαU]·m = tr_{U/U∩αUα⁻¹}(α·m) for m ∈ M^U.
- `LocallySymmetric.Hecke.invariantsFunctor` (functoriality): Γ_U : Mod(ℤ[Δ]) ⥤ Mod(𝕋(Δ, U)), left exact, with Γ_U ⋙ forget = U-invariants.
- `LocallySymmetric.Hecke.derivedInvariants` (data): RΓ_U : D⁺(ℤ[Δ]) → D⁺(𝕋(Δ, U)) with forget ∘ RΓ_U ≅ RΓ(U, −).
- `LocallySymmetric.Hecke.one_smul` (simp): [U1U]·m = m.
- `LocallySymmetric.Hecke.eq_heckeAlgebra` (compatibility): For G locally profinite and U compact open, 𝕋(G, U) ≅ H(G, U) (compactly supported U-biinvariant functions, vol(U) = 1), [UαU] ↦ 1_{UαU}.

**Unit tests.**

- `hecke_one_smul` (degenerate): [U1U] acts as the identity on M^U, and for Δ = U the functor Γ_U is ordinary invariants.
- `hecke_Tp_permutation` (computation): For Δ = GL_2(ℚ_p), U = GL_2(Z_p) and M = ℤ[Δ/U] (formal sums of lattices in ℚ_p²), T_p = [U diag(p, 1) U] sends the U-fixed element [Z_p²] to Σ [L′] over the p + 1 lattices L′ ⊂ Z_p² with Z_p²/L′ ≅ F_p (the cosets α_iU of U diag(p,1) U).
- `hecke_degree_eq_index` (compatibility): On the trivial module M = ℤ, [UαU] acts by the degree #(UαU/U) = [U : U ∩ αUα⁻¹] (Tau Ceti's HeckeCoset.degree_eq_relIndex).
- `hecke_not_pointwise` (non-example): The action is not α·m for a single representative: on M = ℤ[Δ/U] with Δ = GL_2(ℚ_p), applying only diag(p, 1) gives one lattice, not the sum of p + 1.

**Consumers.**

- NT16 Proposition 2.18: the homomorphism T_G : H(G, U) → End_{D(ℤ)}(RΓ_{X/U} f^U_* F) comes from RΓ_U
- ACC+ (2.1.3), (2.1.5): the Hecke action on RΓ(X_K, V) and on RΓ_{K/K′}(X_{K′}, V)
- ACC+ §2.1.9: the monoid version H(Δ, U) acting on RΓ(U, M) for an R[Δ]-module M

**Acceptance properties.**

- [U1U] acts as the identity.
- For Δ = U, 𝕋(U, U) = ℤ and Γ_U is U-invariants.

**Direct prerequisites.** `mathlib:IsHeckeTriple`; `mathlib:HeckeCoset`; `mathlib:HeckeRing`; `tauceti:HeckeCosetModule.instRingHeckeRing`; `tauceti:HeckeCoset.degree_eq_relIndex`; `SmoothRepresentationsOfLocalGroups:SR.1`; `mathlib:DerivedCategory`.

**Source passages.** [nt16], §2.2.1, Lemma 2.3, p. 8 (arXiv v1 numbering of pages): The functor Γ_U (published version §2.2.1). [nt16], §2.2.1, (2.5): The trace description.

### Construction: The Hecke action on RΓ(X_K, V) in the derived category

**Identifier:** `ALS.3/derived-hecke-action`.

Let S be finite, K=K_SK^S compact open, R commutative and V finite projective with commuting G(F) and K_S actions. Derived equivariant invariant sections give a ring homomorphism T_K:H(G^S,K^S)⊗R→End_{D(R)}(RΓ(X_K,V)), and analogous homomorphisms for compact support, compactification and boundary. All coefficient/support maps intertwine these endomorphisms in D(R). In the discrete NT16 setup the derived left-exact Hecke-invariants functor of hecke-action-on-invariants also provides a lift to D⁺(H⊗R); its comparison with a chosen geometric equivariant model must use the derived-composite acyclicity, not just equality on cohomology. For K′⊲K with K′^S=K^S the relative object lives in D(R[K/K′]), and H⊗R acts through End_{D(R[K/K′])}; applying derived K/K′ invariants recovers T_K. This relative endomorphism action is the ACC+ (2.1.5)–(2.1.6) conclusion. A strict lift to D(H⊗R[K/K′]) requires the additional compatible enhancement requested below. The same distinction holds for monoid Hecke actions with compatible coefficient actions.

**Hypotheses.** K = K_SK^S compact open V finite projective over R with R[G(F) × K_S]-action

**Construction or proof.**

1. Apply derived equivariant sections and then the derived Hecke-invariants functor (NT16 Proposition 2.18, Corollary 3.3). Its forgetful image is ordinary invariant-sections cohomology; underived commutation and injective acyclicity give the comparison, not a comparison of H^i alone.
2. For supports apply the functor to j_!V on the compactification and for boundary to i^*V̄. These natural transformations commute with correspondences. At arbitrary level use betti-complexes and its equivariant enhancement gap.
3. Keep the residual quotient action before deriving K′ invariants. ACC+ (2.1.5)–(2.1.6) supplies the commuting Hecke action in End_D(R[K/K′]) and the descent homomorphism. Do not infer a strict Hecke cochain action from that homomorphism.
4. Compare the topological smooth setup with the discrete setup via Caraiani–Newton Proposition 2.1.3 and Lemma 2.1.5. Their footnote 5 explicitly needs only the endomorphism action; stronger relative lifts are an exact enhancement request.

**API.**

- `LocallySymmetric.heckeObject` (data): The object RΓ(X_K,V) with its ring homomorphism H⊗R→End_D(R); the discrete derived Hecke-invariants construction supplies a D(H⊗R) lift whose forgetful object is identified by the injective-resolution comparison.
- `LocallySymmetric.heckeAction` (data): T_K : H(G^S, K^S) ⊗ R →+* End_{D(R)}(RΓ(X_K, V)).
- `LocallySymmetric.heckeAction_c` (data): The same for RΓ_c(X_K, V), RΓ(X̄_K, V) and RΓ(∂X̄_K, V).
- `LocallySymmetric.heckeActionRel` (data): H⊗R→End_{D(R[K/K′])}(RΓ_{K/K′}(X_{K′},V)), recovering heckeAction after RΓ(K/K′,−). A compatible strict D(H⊗R[K/K′]) lift is an enhancement obligation, not a consequence of this homomorphism alone.
- `LocallySymmetric.heckeAction_one` (simp): T_K([K]) = id.
- `LocallySymmetric.heckeAction_natural` (functoriality): For a coefficient-linear V→W, the induced morphism in D(R) intertwines T_K(t) for every t; it is a morphism of D(H⊗R) objects when the specified compatible lift is used.

**Unit tests.**

- `heckeAction_one` (degenerate): T_K([K]) is the identity of RΓ(X_K, V).
- `heckeAction_H0` (computation): For V = R, on H^0(X_K, R) = Fun(G(F)\G(A^∞)/K, R) the operator [KgK] is f ↦ (x ↦ Σ_i f(x g_i)) with KgK = ⊔ g_iK.
- `heckeAction_modularCurve_Tp` (compatibility): For GL_{2,ℚ}, K = K_1(N), p ∤ N and V = ℂ, T_K([K diag(p,1) K]) on H^1(X_K, ℂ) agrees, under the Eichler–Shimura isomorphism, with the classical T_p on weight-two forms (normalised by the right coset decomposition).
- `heckeAction_not_on_cochains` (non-example): The geometric formulas give operators up to chain homotopy on a chosen singular cochain complex. A ring homomorphism to End_D(R) does not by itself specify a strict D(H⊗R) lift; the latter needs the equivariant-derived-invariants construction and its comparison.

**Consumers.**

- ACC+ §2.1.2: the Hecke action on RΓ(X_K, V), RΓ_c and RΓ_{K/K′}
- NT16 §3.2: derived Hecke algebras T^S(RΓ(X^U_G, A^U_G))
- PotentialAutomorphyInfrastructure:PA.0: the integral Hecke action on a common cohomology interface
- CompletedCohomologyPartII:CC.1, CC.2: transport of the finite-level Hecke action to colimits and completions
- AutomorphicFormsOnReductiveGroups:AF.4/torsion-hecke-eigenclasses: the Hecke action on H^•(X_K, L) and its reductions

**Acceptance properties.**

- T_K([K]) = id.
- On H^0(X_K, R) = R^{π_0(X_K)}, [KgK] acts through the action of g on π_0(X_K) = G(F)\G(A^∞)/K (a permutation with multiplicities).

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-action-on-invariants`; `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification`; `SchemeAndStackFoundations:key/equivariant-sheaf-cohomology`; `EnhancedDerivedSheaves:E1`.

**Source passages.** [acc23], §2.1.2, (2.1.3), p. 911: The Hecke homomorphism. [acc23], §2.1.2, p. 911: The general form, including compact support via j_!. [nt16], §2.3, Proposition 2.18: The forgetful image is the cohomology of the quotient. [cn23], §2.1.2, Proposition 2.1.3, Lemma 2.1.5 and footnote 5, pp. 10–11: The topological source uses an endomorphism action; the strict lift is not inferred from it.

### Theorem: Hecke operators as correspondences: representative independence

**Identifier:** `ALS.3/hecke-operator-formula`.

For g ∈ G^S put K_g = K ∩ gKg⁻¹ and let p_1 = π_{K_g,K} : X_{K_g} → X_K and p_2 = π_{g⁻¹K_gg,K} ∘ r_g : X_{K_g} → X_{g⁻¹K_gg} → X_K (AdelicAlgebraicGroups AA.4/hecke-correspondence). For neat K, the image of [KgK] under T_K equals θ(g) = p_{1*} ∘ (p_1^*V ≅ p_2^*V) ∘ p_2^*, the composite RΓ(X_K, V) → RΓ(X_{K_g}, p_2^*V) ≅ RΓ(X_{K_g}, p_1^*V) → RΓ(X_K, V) with p_{1*} the trace of the finite covering p_1 (level-trace). It depends only on the double coset KgK. On singular cochains (sheaf-singular-comparison) and for KgK = ⊔_i g_iK it is given by summing the translates by the g_i of the pulled-back cochain.

**Hypotheses.** K neat g ∈ G^S

**Construction or proof.**

1. Reduce to underived sections by applying both sides to an injective resolution (NT16 Lemma 2.19).
2. On sections the Hecke action is m ↦ tr(α·m) (hecke-action-on-invariants), and the trace of p_1 on global sections is the sum over the fibres, i.e. over U/U ∩ αUα⁻¹; compare.
3. Independence of the representative: if g′ = k₁gk₂ with k_i ∈ K, the correspondences differ by the automorphisms r_{k_i} of the X_{K}, which act trivially (level-pullback, translate_of_mem).

**Acceptance properties.**

- deg p_1 = [K : K_g] = #(KgK/K) at neat level (AA.4/hecke-degree-double-coset).
- For g ∈ K, θ(g) = id.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`; `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`; `ArithmeticLocallySymmetricSpaces:ALS.1/level-pullback`; `ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison`; `AdelicAlgebraicGroups:AA.4/hecke-correspondence`; `AdelicAlgebraicGroups:AA.4/hecke-degree-double-coset`.

**Source passages.** [nt16], §2.3, after Proposition 2.18: The correspondence operator. [nt16], §2.3, Lemma 2.19: The comparison.

### Construction: Trace along level maps and the groupoid correction

**Identifier:** `ALS.3/level-trace`.

For K′ ⊂ K compact open define the trace π_{K′,K*} : RΓ(X_{K′}, V) → RΓ(X_K, V) as the corestriction (transfer) RΓ(K′, M) → RΓ(K, M) applied to M = RΓ(𝔛_G, V_𝔛), the derived version of m ↦ Σ_{k ∈ K/K′} k·m. At neat level it is the trace of the finite covering π_{K′,K} (Tau Ceti AlgebraicTopology stage 5 transfer; adjunction π_! = π_*, π^! = π^*), and the same construction gives traces on RΓ_c and RΓ(∂X̄). Then π_* ∘ π^* = [K : K′] on RΓ(X_K, V) for every K′ ⊂ K, and π^* ∘ π_* = Σ_{k ∈ K/K′} r_k^* for K′ normal in K. At non-neat level the trace is the corestriction of group cohomology of the Γ_i (ALS.1/group-cohomology-comparison), and on cohomology of the coarse quotients the degrees acquire the stabilizer weights of AdelicAlgebraicGroups AA.4/level-map-fibre-mass: the fibre of π over x has Σ_{y↦x} 1/|Γ_y| = [K : K′]/|Γ_x| (up to the central correction).

**Hypotheses.** K′ ⊂ K compact open

**Construction or proof.**

1. Corestriction cor : RΓ(K′, M) → RΓ(K, M) is the derived functor of the norm M^{K′} → M^K, m ↦ Σ_{K/K′} k·m; cor ∘ res = [K : K′].
2. At neat level, the transfer of the finite covering π_{K′,K} on chains (sum over lifts; AT stage 5) dualises to the trace on cochains, and agrees with cor under descent; π_!π^! → id is the counit.
3. For K′ normal, res ∘ cor = Σ_{k ∈ K/K′} k (double coset formula).
4. Stabilizer weights: the double coset combinatorics of Tau Ceti's card_fiber_orbitOfCosetTranslate_mul_cardStabilizerOnOrbit and AA.4/level-map-fibre-mass.

**API.**

- `LocallySymmetric.RΓ.trace` (data): π_{K′,K*} : RΓ(X_{K′}, V) → RΓ(X_K, V), the corestriction / covering trace.
- `LocallySymmetric.RΓ.trace_pullback` (relation): π_* ∘ π^* = [K : K′]·id.
- `LocallySymmetric.RΓ.pullback_trace` (relation): For K′ ⊲ K, π^* ∘ π_* = Σ_{k ∈ K/K′} r_k^*.
- `LocallySymmetric.RΓ.trace_comp` (functoriality): π_{K′,K*} ∘ π_{K″,K′*} = π_{K″,K*}.
- `LocallySymmetric.RΓ.trace_eq_coveringTransfer` (compatibility): At neat level the trace is the transfer of the finite covering X_{K′} → X_K (Tau Ceti AlgebraicTopology stage 5).
- `LocallySymmetric.RΓ.trace_c` (functoriality): Traces on RΓ_c and RΓ(∂X̄), compatible with forget-supports and restriction to the boundary.

**Unit tests.**

- `trace_pullback_H0` (computation): On H^0(X_K, R) = Fun(π_0(X_K), R), π_*π^* is multiplication by [K : K′].
- `trace_self` (degenerate): For K′ = K, π_* = id.
- `trace_eq_transfer` (compatibility): At neat level and in degree 0, π_* sends f to x ↦ Σ_{y ∈ π⁻¹(x)} f(y), the covering transfer of AT stage 5.
- `trace_coarse_fails` (non-example): On coarse quotients the naive degree is wrong: for SL_2(ℤ) ⊃ Γ(2)·{±1} with quotient S_3, the fibre of ℍ/Γ(2) → ℍ/SL_2(ℤ) over the image of i has 3 points, not [PSL_2(ℤ) : Γ̄(2)] = 6; the weighted count Σ 1/|Γ_y| = 6/|Γ̄_i| = 3 is the correct one.

**Consumers.**

- NT16 Lemma 2.19: θ(α) uses the trace of p_1
- CG18 Lemma 9.6: the push-forwards φ^∨ along the degeneracy maps
- ALS.6/finite-cover-hochschild-serre: corestriction and restriction for K′ ⊲ K
- CompletedCohomologyPartII:CC.1: restriction/corestriction identities for descent

**Acceptance properties.**

- π_*π^* = [K : K′] on H^0.
- For [K : K′] invertible in R, π^* is split injective.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.1/level-pullback`; `ArithmeticLocallySymmetricSpaces:ALS.1/group-cohomology-comparison`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`; `AdelicAlgebraicGroups:AA.4/level-map-fibre-mass`; `tauceti:TauCeti.card_fiber_orbitOfCosetTranslate_mul_cardStabilizerOnOrbit`; `mathlib:Subgroup.relIndex`; `EnhancedDerivedSheaves:E1`; `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`.

**Source passages.** [nt16], §2.3, after Proposition 2.18: The trace as the counit of the adjunction for a finite covering. [acc23], §2.1.2, (2.1.6), p. 912: Descent along K/K′, whose composite with corestriction gives the trace.

### Theorem: Composition of Hecke correspondences, coherence and change of level

**Identifier:** `ALS.3/hecke-composition`.

The endomorphism action T_K:H(G^S,K^S)⊗R→End_{D(R)}(RΓ(X_K,V)) preserves Tau Ceti convolution: if [KgK][KhK]=Σ_jc_j[Kγ_jK], then θ(g)∘θ(h)=Σ_jc_jθ(γ_j). The equality is in End_{D(R)} even when the complex has a compatible D(H⊗R) lift: multiplication by a general noncentral Hecke element is not H-linear. For a commutative acting Hecke algebra (or central elements), the individual operators are H-linear and the equality also holds in D(H⊗R). For K′⊂K with K′^S=K^S, pullback and trace intertwine all these operators; the coherent enhancement lifts those maps simultaneously, with their Mackey/composition identities. The same statements for compact support and boundary use the compactified equivariant support model and trace. At non-neat level the endomorphism identities hold on groupoid complexes; a stronger strict lift is the specified enhancement obligation, not a consequence of an action on each H^i.

**Hypotheses.** K compact open; neat for the correspondence description

**Construction or proof.**

1. The algebra homomorphism T_K into End_{D(R)} respects convolution by the derived-invariants construction and hecke-operator-formula. A D(H⊗R) lift supplies an H-module object, but does not make multiplication by a noncentral element an H-linear morphism; change-of-level maps that intertwine the action are H-linear.
2. Change of level: restriction RΓ(K, −) → RΓ(K′, −) is a natural transformation of functors on D⁺(R[G^S × K_S]) commuting with the action of double cosets away from S (they are computed by the same coset representatives in G^S).
3. Non-neat levels: all constructions were made for the equivariant complexes, so no freeness is used.

**Acceptance properties.**

- [KgK]·[Kg⁻¹K] contains [K] with coefficient [K : K ∩ gKg⁻¹]. For G=S₃ and K={1}, H=R[S₃] acts on its left regular module: left multiplication by (12) fails to commute with left multiplication by (23), so is not an H-linear endomorphism.
- For GL_2 and p ∤ level, T_p² = T_{p²} + (p + 1)S_p with S_p = [K diag(p, p) K] (classical relation).

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`; `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula`; `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`; `tauceti:HeckeCosetModule.instRingHeckeRing`; `AdelicAlgebraicGroups:AA.4/hecke-cartesian`.

**Source passages.** [nt16], §2.2.1, Lemma 2.3(1): The algebra structure that T_K respects. [acc23], §2.1.2, (2.1.5)–(2.1.6), pp. 911–912: Compatibility of the Hecke actions under change of level.

### Theorem: Hecke compatibility with supports, boundary, coefficients and cup products

**Identifier:** `ALS.3/hecke-support-boundary-compatibility`.

The maps RΓ_c(X_K, V) → RΓ(X_K, V) → RΓ(∂X̄_K, V) and the restriction RΓ(X̄_K, V) → RΓ(∂X̄_K, V) are morphisms in D(R) intertwining every Hecke endomorphism, and lift to D(H(G^S,K^S)⊗R) when the compatible discrete enhancement is used; so are the coefficient maps of ALS.1 (induced by R[G(F)×K_S]-linear V → W, and the base change isomorphisms of ALS.1/coefficient-change). For cup products: π^* is multiplicative, the trace satisfies the projection formula π_*(π^*a ∪ b) = a ∪ π_*b, and for a class c ∈ H^0(X_K, W) represented by a G^S-equivariant map R → H^0(𝔛_G, W)(χ) with character χ of G^S, cup product with c satisfies c ∪ T(t)(x) = T(f_χ(t))(c ∪ x) (character-twist). In general T(t) is not a ring endomorphism of H^*(X_K, R). Coefficient base-change isomorphisms here have exactly ALS.1/coefficient-change’s neatness/perfectness hypotheses; arbitrary-level derived invariants require the extra averaging or base-change comparison recorded at boundary-triangle.

**Hypotheses.** K neat for the cup-product statements

**Construction or proof.**

1. j_!V → V and V → i_*i^*V on X̄^G × G(A^∞) are maps of G^S × K_S-equivariant sheaves; applying RΓ_K gives morphisms in D(H ⊗ R).
2. Coefficient maps are maps of equivariant sheaves; base change commutes with RΓ_K by the projection formula for perfect coefficients.
3. Projection formula for finite coverings (AT stage 6 cup/cap interface) at neat level; for H^0-twists see twisting-isomorphism.

**Acceptance properties.**

- T_p is not multiplicative on H^*(X_K, ℚ) for modular curves: T_p(1) = (p + 1)·1 in H^0, while T_p(1·1) = T_p(1).
- The forget-supports map H^1_c → H^1 for modular curves is Hecke-equivariant with image the interior cohomology.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`; `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`; `ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `EnhancedDerivedSheaves:E1`.

**Source passages.** [nt16], §3.1, before Proposition 3.7, p. 48: Compatibility with forget-supports. [nt16], §4, after Theorem 4.2, p. 55: Compatibility of the boundary triangle with Hecke operators.

### Theorem: Topological and discrete set-ups give the same Hecke actions

**Identifier:** `ALS.3/discrete-topological-comparison`.

Let 𝔛^top_G be 𝔛_G with G(A^∞) carrying its locally profinite topology (the limit lim_K X_K), and 𝔛^dis_G = G(F)\(X^G × G(A^∞)^δ), with π_dis : 𝔛^dis_G → 𝔛^top_G. (i) The square of derived functors D⁺Sh_{G^S×K_S}(𝔛^top) → D⁺_sm(G^S × K_S, R) → D⁺(H(G^S, K^S) ⊗ R) and D⁺Sh_{G^S×K_S}(𝔛^top) → D⁺Sh_{K}(𝔛^top) ≃ D⁺Sh(X_K) → D⁺(R) commutes compatibly with the forgetful functor (CN23 Proposition 2.1.3). (ii) RΓ(𝔛^top, −) has bounded cohomological dimension: R^iΓ(𝔛^top, 𝔉) = 0 for i > dim X_K (CN23 Lemma 2.1.4). (iii) RΓ(K, −) ∘ RΓ(𝔛^top, −) ≅ RΓ(K^dis, −) ∘ RΓ(𝔛^dis, −) ∘ π_dis^* as functors to D⁺(H(G^S, K^S) ⊗ R); in particular both set-ups give the same Hecke actions on RΓ_{(c)}(X_K, V) (CN23 Lemma 2.1.5).

**Hypotheses.** K neat (good) R commutative The finite levels used in the CN23 sheaf/descent comparisons are good in the sense of §2.1.1; compact-open or normality alone is not asserted to suffice.

**Construction or proof.**

1. (i): the underived square commutes; the forgetful functor to K-equivariant sheaves is exact and preserves injectives (Schneider), descent is an equivalence, and Γ(𝔛^top, −) preserves injectives (NT16 Lemma 2.28); compose derived functors.
2. (ii): after forgetting to K-equivariant sheaves this is the vanishing of sheaf cohomology above the dimension of the manifold X_K (NT16 Lemma 2.35).
3. (iii): identify the underived functors via NT16 Lemma 2.19 and check the induced natural transformation is an isomorphism after forgetting to D⁺(R), where both sides are RΓ(X_K, −) (Proposition 2.1.3 and NT16 Proposition 2.18).

**Acceptance properties.**

- For V = R both set-ups give the same T_p on H^1 of a modular curve.
- Smoothness: in the topological set-up, H^i(𝔛^top, V) is a smooth G^S × K_S-representation.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`; `ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold`; `SmoothRepresentationsOfLocalGroups:SR.0`; `SchemeAndStackFoundations:key/equivariant-sheaf-cohomology`.

**Source passages.** [cn23], §2.1.2, Proposition 2.1.3: Part (i). [cn23], §2.1.2, Lemma 2.1.4: Part (ii). [cn23], §2.1.2, Lemma 2.1.5: Part (iii).

### Construction: The derived Hecke algebra T^S(K, V) of an arithmetic complex

**Identifier:** `ALS.3/derived-hecke-algebra`.

Let O be the ring of integers of a finite extension E/ℚ_p, S ⊃ S_p finite with K_v hyperspecial for v ∉ S, and T^S = H(G^S, K^S) ⊗_ℤ O, a commutative O-algebra. For neat K and V a finite O-module with O[K_S]-action, write T^S(K, V) for the image of T^S in End_{D(O)}(RΓ(X_K, V)) (ACC+'s T^S(K, λ) for V = V_λ; NT16's T^S(C^•)); similarly T^S_c(K, V) for RΓ_c and T^S_∂(K, V) for RΓ(∂X̄_K, V). It is a commutative finite O-algebra with surjections T^S(K, V) → T^S(H^*(X_K, V)) with nilpotent kernel, and for V finite free over O, T^S(K, V) ≅ lim_N T^S(K, V/ϖ^N). It is the instance of IntegralHeckeAndGaloisDeterminants IHG.2/derived-hecke-image for the complex RΓ(X_K, V).

**Hypotheses.** K neat with K_v hyperspecial for v ∉ S V finite over O

**Construction or proof.**

1. Commutativity of T^S: Satake/Gelfand trick at hyperspecial level (SmoothRepresentationsOfLocalGroups SR.4 for the unramified Hecke algebras).
2. RΓ(X_K, V) is perfect (borel-serre-finite-triangulation), so End_{D(O)}(RΓ) is a finite O-module and T^S(K, V) is finite.
3. Nilpotent kernel: an endomorphism of a perfect complex of amplitude [0, d] acting by zero on cohomology is nilpotent of order ≤ d + 1.
4. Inverse limit: NT16 Lemmas 3.11–3.12 (Hom between perfect complexes is the limit of the mod ϖ^r Homs).

**API.**

- `LocallySymmetric.derivedHeckeAlgebra` (data): T^S(K, V) := image of T^S → End_{D(O)}(RΓ(X_K, V)), with variants for RΓ_c and RΓ(∂X̄_K, V).
- `LocallySymmetric.derivedHeckeAlgebra.commRing` (instance): T^S(K, V) is a commutative O-algebra, finite as an O-module.
- `LocallySymmetric.derivedHeckeAlgebra.toCohomology` (projection): The surjection T^S(K, V) → T^S(H^*(X_K, V)), with nilpotent kernel (index of nilpotence ≤ d_G + 1).
- `LocallySymmetric.derivedHeckeAlgebra.limit` (characterisation): T^S(K, V) ≅ lim_N T^S(K, V/ϖ^N) for V O-flat.
- `LocallySymmetric.derivedHeckeAlgebra.eq_derivedHeckeImage` (compatibility): T^S(K, V) is IHG.2's derived Hecke image of the complex RΓ(X_K, V) with its T^S-action.
- `LocallySymmetric.derivedHeckeAlgebra.maximalIdeals_finite` (other): T^S(K, V) has finitely many maximal ideals, all with residue field finite over k.

**Unit tests.**

- `derivedHeckeAlgebra_zeroComplex` (degenerate): If RΓ(X_K, V) = 0 then T^S(K, V) = 0.
- `derivedHeckeAlgebra_GL1` (computation): For G=GL₁/ℚ, principal level K(3)={u∈Ẑ×:u≡1 mod 3}, and constant O-coefficients, X_K is one point with trivial arithmetic stabilizer and the derived Hecke image is O. At the non-neat level Ẑ× the same assertion requires 2 invertible in O; otherwise the C₂ stabilizer gives higher groupoid cohomology. More generally a finite component group C acting regularly on functions has image O[C], not a product of copies of O. General number fields can have positive-dimensional unit tori, so degree-zero finite-set cohomology is not asserted for GL₁/F.
- `derivedHeckeAlgebra_surj_cohomology` (characterisation): The map T^S(K, V) → T^S(H^*(X_K, V)) is surjective with nilpotent kernel; it can fail to be injective (an endomorphism of a complex can act by zero on cohomology without being zero).
- `derivedHeckeAlgebra_ne_cohomologyAlgebra` (non-example): Generic derived-image test: over a DVR O with residue field k, the perfect complex C = k[0] ⊕ k[1] has a nonzero off-diagonal ghost in Hom_D(O)(k,k[1]) = Ext^1_O(k,k). Its square is zero and it acts as zero on cohomology. Let T = O[ε]/(ε²) send ε to this ghost; the derived image has nonzero nilpotent kernel over its cohomological image. This tests the generic IHG.2 input, not an asserted arithmetic realization. A lone complex [O →(ϖ) O] is quasi-isomorphic to one k and does not provide that ghost.

**Consumers.**

- NT16 §3.2: the idempotents e_𝔪 ∈ T^S(C^•) split C^•
- ACC+ Corollary 2.2.24: f_ψ descends to an isomorphism T^S(K, λ) ≅ T^S(K, λ + μ)
- ACC+ Theorem 2.4.10: maximal ideals 𝔪 ⊂ T^S(K, V_λ) and the localized cohomology
- IntegralHeckeAndGaloisDeterminants:IHG.2: determinants valued in T^S(K, V)/I

**Acceptance properties.**

- For G = GL_{1,ℚ} and K neat, X_K is finite and T^S(K, O) is a quotient of O[A_f^×/ℚ^×_{>0}K]-type group algebra acting on functions.
- T^S(K, V) ⊗ E ≅ T^S(H^*(X_K, V ⊗ E)) (reduced after inverting p when the action is semisimple).

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`; `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image`; `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`; `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-hecke-image-finite`; `IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-nilpotence`; `IntegralHeckeAndGaloisDeterminants:IHG.2/ghost-maximal-ideals`.

**Source passages.** [nt16], §3.2, p. 51: Commutativity. [nt16], §3.2, p. 52: Definition and finiteness. [nt16], §3.2, Lemma 3.12, p. 53: Compatibility with reduction mod ϖ^N.

### Construction: Twisting Hecke algebras and coefficients by a character of det

**Identifier:** `ALS.3/character-twist`.

Let G = GL_{n,F}, K ⊂ GL_n(A_F^∞) good and ψ : G_F → O^× a continuous character with ψ∘Art_{F_v} trivial on det(K_v) for all v ∉ S. Define f_ψ : H(G^S, K^S) ⊗_ℤ O → H(G^S, K^S) ⊗_ℤ O by f_ψ(f)(g) = ψ(Art_F(det g))⁻¹ f(g); it is an O-algebra isomorphism with inverse f_{ψ⁻¹}. If K_v = GL_n(O_{F_v}) for v ∉ S, then f_ψ(T_{v,i}) = ψ(Frob_v)^{−i} T_{v,i}, and for a maximal ideal 𝔪 ⊂ T^S, 𝔪(ψ) := f_ψ(𝔪). For an O[K_S]-module V, V(ψ^{−1,S}) is V with g ∈ G^S additionally acting by ψ(det g)⁻¹ (on the equivariant sheaf on 𝔛_G). More generally, for any G and a character χ : G(A^∞) → O^× trivial on G(F) and K^S, f_χ(f)(g) = χ(g)⁻¹f(g).

**Hypotheses.** ψ continuous, ψ∘Art_{F_v} trivial on det(K_v) for v ∉ S

**Construction or proof.**

1. f_ψ is multiplicative because g ↦ ψ(Art_F(det g)) is a character of G^S trivial on K^S, so convolution commutes with multiplication by it; it is invertible with inverse f_{ψ⁻¹}.
2. T_{v,i} is the characteristic function of K_v diag(ϖ_v, …, ϖ_v, 1, …, 1) K_v (i entries ϖ_v), on which det has valuation i, so ψ(Art(det)) = ψ(Frob_v)^i (arithmetic Frobenius convention of Art).

**API.**

- `LocallySymmetric.twistHecke` (data): f_ψ : H(G^S, K^S) ⊗ O ≃ₐ H(G^S, K^S) ⊗ O, f ↦ (g ↦ ψ(Art_F(det g))⁻¹ f(g)).
- `LocallySymmetric.twistHecke_T` (simp): f_ψ(T_{v,i}) = ψ(Frob_v)^{−i} T_{v,i} for v ∉ S with K_v hyperspecial.
- `LocallySymmetric.twistHecke_mul` (relation): f_ψ ∘ f_{ψ′} = f_{ψψ′} and f_1 = id.
- `LocallySymmetric.twistMaximalIdeal` (data): 𝔪(ψ) = f_ψ(𝔪) for maximal ideals of T^S.
- `LocallySymmetric.twistCoefficients` (data): V ↦ V(ψ^{−1,S}), the coefficient module with G^S acting through ψ(det)⁻¹.

**Unit tests.**

- `twistHecke_trivial` (degenerate): f_1 = id.
- `twistHecke_T_GL1` (computation): For n = 1, T_{v,1} = [ϖ_v K_v] and f_ψ(T_{v,1}) = ψ(Frob_v)⁻¹ T_{v,1}.
- `twistHecke_mul` (characterisation): f_ψ is an O-algebra automorphism with f_ψ ∘ f_{ψ⁻¹} = id.
- `twistHecke_not_identity_on_maximalIdeals` (non-example): For a fixed O-valued eigensystem φ with residue eigenvalues in k = O/ϖ, if ψ(Frob_v) ≠ 1 in k and φ(T_{v,1}) ≠ 0, twisting changes that eigenvalue and its k-valued eigensystem. For residue fields larger than k, two changed eigensystems can be Frobenius-conjugate and define the same maximal ideal; nontrivial ψ alone does not prove that every such ideal moves.

**Consumers.**

- ACC+ Proposition 2.2.23: RΓ(X_K, V_λ) ≅ RΓ(X_K, V_{λ+μ}) intertwining the actions via f_ψ
- ACC+ §4.5, §6.5: twisting maximal ideals 𝔪 ↦ 𝔪(ψ) to normalise weights in the degree-shifting arguments
- PotentialAutomorphyInfrastructure:PA.0: twisting of integral Hecke algebras

**Acceptance properties.**

- f_1 = id.
- f_ψ∘f_ψ′ = f_{ψψ′}.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`; `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra`; `tauceti:HeckeCosetModule.instRingHeckeRing`.

**Source passages.** [acc23], §2.2.20, p. 933: The definition. [acc23], §2.2.20, p. 933: The effect on T_{v,i}.

### Theorem: Twisting RΓ(X_K, V) by a character, and its Hecke algebras

**Identifier:** `ALS.3/twisting-isomorphism`.

Let G = GL_{n,F}, K ⊂ GL_n(A_F^∞) good, S ⊃ S_p, and ψ : G_F → O^× continuous with (1) ψ∘Art_{F_v} trivial on det(K_v) for every finite v ∤ p, and (2) some m = (m_τ) ∈ ℤ^{Hom(F,E)} with ψ(Art_{F_v}(k)) = ∏_{τ ∈ Hom_{ℚ_p}(F_v, E)} τ(k)^{−m_τ} for all v | p and k ∈ det(K_v). Let O(m) be the rank-one O[K_p]-module on which k acts by ∏_τ τ(det k)^{m_τ}. Then for every finite free O[K_S]-module V there is an isomorphism RΓ(X_K, V) ≅ RΓ(X_K, V ⊗ O(m)) in D(O), equivariant for H(G^S, K^S) ⊗ O acting in the usual way on the source and through f_ψ on the target. If K_v = GL_n(O_{F_v}) for v ∉ S, f_ψ descends to an isomorphism T^S(K, V) ≅ T^S(K, V ⊗ O(m)), and 𝔪 is in the support of H^*(X_K, V) iff 𝔪(ψ) is in the support of H^*(X_K, V ⊗ O(m)). (ACC+ states this for V = V_λ, where V_λ ⊗ O(m) = V_{λ+μ} with μ_τ = (m_τ, …, m_τ).)

**Hypotheses.** G = GL_{n,F} K good ψ satisfying (1) and (2)

**Construction or proof.**

1. Under hypotheses (1)–(2), ψ∘Art_F∘det defines a nowhere-zero global section of the rank-one local system O(m). The section for ψ⁻¹ supplies its inverse (ACC+ Proposition 2.2.23).
2. Tensoring this section with V gives a sheaf isomorphism V_K → (V ⊗ O(m))_K. Its G^S-equivariance is twisted by ψ⁻¹, giving precisely f_ψ on Hecke operators.
3. Apply derived global sections and compare kernels of the two Hecke actions. Do not replace RΓ(𝔛_G,V) by H^0(𝔛_G,V); the universal space has higher arithmetic cohomology.

**Acceptance properties.**

- ψ = 1, m = 0 gives the identity.
- For n = 1, twisting permutes the Hecke eigensystems in cohomology by ψ∘Art_F; the space need not be a finite set for general F.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.3/character-twist`; `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-support-boundary-compatibility`; `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra`.

**Source passages.** [acc23], §2.2.20, Proposition 2.2.23, p. 933: The statement for V_λ. [acc23], §2.2.20, proof of Proposition 2.2.23, p. 934: The proof. [acc23], §2.2.20, Corollary 2.2.24, pp. 934–935: The Hecke algebra statement.

### Theorem: Degeneracy maps at Γ0(x)-level and the old-space splitting

**Identifier:** `ALS.3/degeneracy-old-forms`.

Let G = PGL_{2,F}, K a level and x ∉ S a place with K_x = PGL_2(O_x); let K_0(x) ⊂ K be the Γ_0(x)-level at x (standard-level-subgroups), Y = X_K, Y_0(x) = X_{K_0(x)}. The two degeneracy maps Y_0(x) → Y (π and π ∘ r_{diag(ϖ_x, 1)}) induce φ : H^*(Y, A)^2 → H^*(Y_0(x), A) (sum of the two pullbacks) and φ^∨ : H^*(Y_0(x), A) → H^*(Y, A)^2 (the two traces), for A = O/ϖ^n, and φ^∨ ∘ φ = (N(x)+1, T_x; T_x, N(x)+1), with determinant (N(x)+1)² − T_x². If 𝔪 is a maximal ideal with T_x² − (1 + N(x))² ∉ 𝔪 (e.g. x a Taylor–Wiles prime: N(x) ≡ 1 mod p and the Frobenius eigenvalues α_x ≠ β_x, α_xβ_x ≡ 1), then φ^∨ ∘ φ is invertible after localization at 𝔪 and H^*(Y_0(x), A)_𝔪 ≅ H^*(Y, A)^2_𝔪 ⊕ W for a T-stable W, and H^*(Y_0(x), A)_{𝔪̃} ≅ H^*(Y, A)_{𝔪̃} ⊕ W_{𝔪̃} for 𝔪̃ = (𝔪, U_x − α_x).

**Hypotheses.** G = PGL_{2,F} K_x maximal T_x² − (1+N(x))² ∉ 𝔪 for the splitting

**Construction or proof.**

1. The four entries: π_*π^* = [K : K_0(x)] = N(x) + 1 (level-trace); the off-diagonal composites π_* ∘ r^* ∘ π^* are the correspondence through K ∩ gKg⁻¹ for g = diag(ϖ_x, 1), i.e. T_x (hecke-operator-formula).
2. det = (N(x)+1)² − T_x², the negative of the printed T_x² − (1+N(x))² (PAPER-CALEGARI-GERAGHTY-18/E188); invertibility is unaffected.
3. If α_x ≠ ±1 mod p then T_x ≡ α_x + β_x ≢ ±2 ≡ ±(1+N(x)), so the determinant is a unit at 𝔪; localize and split (φ^∨φ)_𝔪 invertible.
4. For 𝔪̃ use the projectors onto the α_x- and β_x-parts (PAPER-CALEGARI-GERAGHTY-18/E191, E229 for the corrected final step).

**Acceptance properties.**

- For F = ℚ and A = ℂ this is the classical decomposition of H^1(Γ_0(Nx)) into the two copies of old forms plus new forms.
- If x is not Taylor–Wiles (α_x = β_x), φ^∨φ need not be invertible at 𝔪.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`; `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula`; `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-composition`; `ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups`.

**Source passages.** [cg18], §9, Lemma 9.6, proof (arXiv v2): The maps and the matrix (N(x)+1, T_x; T_x, N(x)+1). [cg18], §9, Lemma 9.6, proof (arXiv v2): The splitting after localization.

## ALS.4. Boundary cohomology, Satake and localization

The support triangle connects ordinary and boundary cohomology. Parabolic Hecke restriction and the unnormalized Satake transform describe eligible transported Levi contributions. Nomizu–van Est is characteristic zero; Kostant supplies actual Levi representations. General reductive groups get the Leray/Kostant second page, while the GL_N source supplies the stated natural decomposition. The integral arithmetic extension remains discrete. Early duality supplies the support vanishing needed to prove Eisenstein boundary and Siegel localization.

**Planets:** Boundary exact triangle; Unnormalized Satake map S = r_M ∘ r_P; Kostant–van Est boundary formula; Localization at a Hecke maximal ideal; Boundary vanishing at non-Eisenstein ideals.

**Coverage:** planned. Remaining closure: Resolve the exact inputs recorded in Coherent equivariant supports, refinements and trace. Resolve the exact inputs recorded in Nondecomposed levels and reductive characteristic-zero splitting. Resolve the exact inputs recorded in Integral Kostant and continuous comparison limits. Resolve the exact inputs recorded in Typed automorphic and Galois comparison interfaces. Resolve the exact inputs recorded in Stage order for geometry, supports, duality and automorphic applications. Resolve the exact inputs recorded in Suggested signatures: ALS.4.

### Theorem: The boundary exact triangle RΓ_c → RΓ → RΓ_∂

**Identifier:** `ALS.4/boundary-triangle`.

For every compact open K and V finite projective with R[G(F) × K_S]-action there is an exact triangle RΓ_c(X_K, V) → RΓ(X_K, V) → RΓ(∂X̄_K, V) → RΓ_c(X_K, V)[1] in D(R) with Hecke-equivariant arrows and connecting map; the compatible enhanced model lifts the whole triangle, not three independent Hecke actions, functorial in V (R[G(F)×K_S]-linear maps) and in the level (pullbacks and traces of ALS.1/level-pullback and ALS.3/level-trace), and compatible with coefficient change at neat K under ALS.1/coefficient-change; for general K this compatibility requires |K/K₀| invertible in both coefficient rings or the derived-invariants base-change hypothesis, and is not automatic. It is obtained from j_!j^*V → V → i_*i^*V on X̄^G × G(A^∞) and the identification RΓ(X̄_K, V) ≅ RΓ(X_K, V) given by the homotopy equivalence j_K.

**Hypotheses.** K compact open (neat for the sheaf-theoretic description)

**Construction or proof.**

1. On X̄^G × G(A^∞) the short exact sequence 0 → j_!j^*V → V → i_*i^*V → 0 of G^S × K_S-equivariant sheaves gives a triangle in D⁺(Sh_{G^S×K_S}); apply RΓ_K (ALS.3/derived-hecke-action) to get a triangle in D(H ⊗ R).
2. Identify RΓ_K(j_!V) = RΓ_c(X_K, V) (compact quotient X̄_K) and RΓ_K(V on X̄) = RΓ(X̄_K, V) ≅ RΓ(X_K, V) (borel-serre-quotient-compact).
3. Functoriality in the level: pullback and trace along X̄_{K′} → X̄_K preserve the boundary (strata map to strata), and at neat level are the covering pullback/transfer of AT stage 5.

**Acceptance properties.**

- For a modular curve (GL_{2,ℚ}, neat K) with c cusps: 0 → H^0 → H^0(∂) = ℤ^c → H^1_c → H^1 → H^1(∂) = ℤ^c → H^2_c → 0 on each component.
- For G anisotropic, RΓ(∂X̄_K, V) = 0 and RΓ_c = RΓ.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact`; `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-support-boundary-compatibility`; `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`; `ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`; `EnhancedDerivedSheaves:E1`.

**Source passages.** [nt16], §4, after Theorem 4.2, p. 55: The triangle; the printed shift [−1] should be [1] (sourceIssues E2). [nt16], §4, after Theorem 4.2, p. 55: Why the middle term is RΓ(X_K, V).

### Construction: Restriction to P, integration along N and the unnormalized Satake map

**Identifier:** `ALS.4/parabolic-hecke-maps`.

For a local reductive G, P=M⋉N and compact open U with G=PU, U_P=U∩P=U_N⋊U_M, restriction r_P:H(G,U)→H(P,U_P) and integration r_M(f)(m)=∫_N f(mn)dn (vol(U_N)=1) are algebra homomorphisms, and their composite S is the integral unnormalized Satake map (NT16 Lemmas 2.4 and 2.7). A separate monoid form uses both Iwahori decomposition product bijections U_N×U_M×U_Nbar→U and the reversed order. Define Δ_M by mU_Nm⁻¹⊂U_N and U_Nbar⊂mU_Nbar m⁻¹, Δ=U_NΔ_MU_Nbar and Δ_P=Δ∩P. ACC+ Lemmas 2.1.10–2.1.11 give r_P:H(Δ,U)→H(Δ_P,U_P), r_M:H(Δ_P,U_P)→H(Δ_M,U_M) and S([UmU])=[U_N:mU_Nm⁻¹][U_MmU_M]=|δ_P(m)|⁻¹[U_MmU_M] for m∈Δ_M. This single-term formula is confined to the positive Iwahori-monoid branch. At hyperspecial U the transform has the full usual sum; its relation to normalized Satake is δ_P^{1/2}S, with q-half coefficients adjoined separately. Parabolic induction and its derived invariants compare through r_P under the NT16 hypotheses.

**Hypotheses.** For the full Hecke algebra: G(F_v)=P(F_v)U and U_P=U_N⋊U_M. For the single-term monoid basis formula: both Iwahori product decompositions and m in Δ_M with the stated N and opposite-N positivity.

**Construction or proof.**

1. r_P is multiplicative by the integration formula ∫_G f = ∫_U∫_{P} f(pu) (G = P U, unimodularity of reductive G; NT16 (2.6)).
2. r_M is multiplicative for decomposed U_P (NT16 Lemma 2.7, via ∫_P = ∫_M∫_N).
3. Basis formulas: for m U-positive, UmU ∩ P(F_v) = U_PmU_P and the N-integral counts U_N/mU_Nm⁻¹, of cardinality |δ_P(m)|⁻¹ (ACC+ Lemma 2.1.11 and the remark after it).
4. Comparison with SR.4's normalized Satake transform: S_norm = δ_P^{1/2}·S on M(F_v)-functions; the integral unnormalized S is the one acting on integral cohomology (RT-AREA-automorphic-1/27).
5. Keep the NT16 Iwasawa/hyperspecial branch distinct from ACC+ 2.1.10–2.1.11: the monoid basis formula uses the two Iwahori decompositions and Δ_M positivity. The GL₂ hyperspecial test has two terms even for diag(p,1).

**API.**

- `LocallySymmetric.Hecke.restrictParabolic` (data): r_P : H(G, U) →ₐ H(P, U_P), restriction of functions.
- `LocallySymmetric.Hecke.integrateUnipotent` (data): r_M : H(P, U_P) →ₐ H(M, U_M), integration along N with vol(U_N) = 1.
- `LocallySymmetric.Hecke.satakeUnnormalized` (data): S = r_M ∘ r_P : H(G, U) →ₐ H(M, U_M).
- `LocallySymmetric.Hecke.satakeUnnormalized_basis` (simp): In the ACC+ positive Iwahori-monoid setting (both Iwahori product decompositions, Δ_M positivity and Δ=U_NΔ_MU_Nbar), S([UmU])=|δ_P(m)|⁻¹[U_MmU_M]. This is not a single-term formula for the hyperspecial spherical transform.
- `LocallySymmetric.Hecke.satake_compat_normalized` (compatibility): For hyperspecial U, S agrees with SmoothRepresentationsOfLocalGroups SR.4's Satake transform composed with the δ_P^{−1/2} twist (the q-half normalization recorded separately).
- `LocallySymmetric.Hecke.parabolicInduction_invariants` (relation): For V = Ind_{P}^{G} W, V^U ≅ r_P^*(W^{U_P}) as H(G, U)-modules (NT16 Lemma 2.4(3)), and RΓ_U Ind ≅ r_P^* RΓ_{U_P} (NT16 Corollary 2.6).

**Unit tests.**

- `satake_GL2_Tp` (computation): For GL_2, upper Borel B, U = GL_2(Z_p) and S(f)(t) = ∫_N f(tn)dn with vol(N(Z_p)) = 1: S(T_p) = p·[diag(p,1)] + [diag(1,p)] in H(T(ℚ_p),T(Z_p)).
- `satake_one` (degenerate): S([U]) = [U_M], and for P = G, S = id.
- `satake_compat_SR4` (compatibility): δ_B^{1/2}·S(T_p) = p^{1/2}([diag(p,1)] + [diag(1,p)]), the normalized Satake transform of SR.4 (after inverting p^{1/2}).
- `satake_unnormalized_not_W_invariant` (non-example): For p > 1, p[diag(p,1)] + [diag(1,p)] is not invariant under swapping diagonal entries; δ_B^{1/2}·S(T_p) is Weyl-invariant.

**Consumers.**

- NT16 Proposition 3.8, Corollary 3.9: the Hecke action on boundary strata factors through r_P and r_M
- ACC+ (2.1.8), Theorem 2.4.2: S = r_M ∘ r_P relates Hecke algebras of G̃ and of the Levi G
- IntegralHeckeAndGaloisDeterminants:IHG.3: integral Hecke polynomials of Levi factors
- TorsionCohomologyInfrastructure:TC.3: the Levi Satake map in the boundary induction

**Acceptance properties.**

- GL_2, upper Borel B, U = GL_2(Z_p), and S(f)(t) = ∫_N f(tn)dn: S(T_p) = p[diag(p,1)] + [diag(1,p)]. Since δ_B(diag(p,1)) = p⁻¹, δ_B^{1/2}·S(T_p) = p^{1/2}([diag(p,1)] + [diag(1,p)]).
- S([U]) = [U_M].

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-action-on-invariants`; `SmoothRepresentationsOfLocalGroups:SR.2`; `SmoothRepresentationsOfLocalGroups:SR.4`; `ReductiveGroupsPartII:RG2.4`.

**Source passages.** [nt16], §2.2.3, Lemma 2.4(1): r_P. [nt16], §2.2.4, Lemma 2.7(1): r_M. [acc23], §2.1.9, after Lemma 2.1.11, p. 914: The formulas on basis elements.

### Theorem: Hecke action on boundary strata through parabolic restriction

**Identifier:** `ALS.4/boundary-stratum-hecke-comparison`.

Let P=M⋉N be a proper rational parabolic and K a good neat level. Write the induced G-stratum X^P_K=⊔_g Y^P_{L_g}, g∈P(A^∞)\G(A^∞)/K, L_g=P(A^∞)∩gKg⁻¹; for decomposed L_g=L_{M,g}⋉L_{N,g} use its own Levi base X^M_{L_{M,g}}. Restriction RΓ(∂X̄_K,B)→RΓ(X^P_K,B) is Hecke-equivariant for the induced parabolic action. For P maximal extension by zero RΓ_c(X^P_K,B)→RΓ(∂X̄_K,B) followed by restriction is the forget-supports map. At the distinguished component g=1 with G^S=P^SK^S and K_P decomposed, evaluation on that component identifies the induced-invariants action with pullback through r_P. For a coefficient direct summand A⊂B^{K_{N,S}}, the projection to the Levi and this inclusion give i:r_M^*RΓ(X^M_{K_M},A)→RΓ(Y^P_{K_P},B), with a splitting s after forgetting the Hecke action, s∘i=1 (NT16 Proposition 3.4). If G^S≠P^SK^S, evaluation is only the split morphism of ACC+ Lemma 2.1.14; it is not an identification of the entire induced stratum with Y^P_{K_P}. Other components use the transported levels and corresponding coefficient actions. Consequently all global stratum formulas must be summed/induced across g, and the split Levi summand has Hecke action through S=r_M∘r_P.

**Hypotheses.** K neat and decomposed with respect to P = M ⋉ N P maximal for p

**Construction or proof.**

1. Use boundary-stratification and stratum-nilmanifold-fibration to separate the induced G-stratum from each P-space. Apply restriction and extension by zero in the equivariant category; their composite is the support-forgetting map.
2. Apply NT16 Proposition 3.8(2) and its induction-invariants comparison. Under the Iwasawa equality G^S=P^SK^S evaluation gives the isomorphism; otherwise ACC+ Lemma 2.1.14 gives the projection to the g=1 component with a functorial splitting after forgetting Hecke structure.
3. Apply Proposition 3.4 to P→M and the coefficient summand A⊂B^{K_N}; the coefficient retraction and fibre H⁰ comparison construct s. Keep it as an underlying D(R) splitting unless extra equivariance is proved.
4. Transport each construction to L_g and sum over the finite double quotient. The global Hecke action is the induced action; each eligible Levi summand is described through r_M and then r_P, not by a ring homomorphism to a Hom-set.

**Acceptance properties.**

- For GL₂/ℚ, upper Borel B and hyperspecial U, the Hecke action on cusp-circle H⁰ uses S(T_ℓ)=ℓ[diag(ℓ,1)]+[diag(1,ℓ)], giving 1+ℓ on constant functions.
- If B has trivial K_{N,S}-invariants complement, (ii) applies with A = B.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`; `ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification`; `ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration`; `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`; `SmoothRepresentationsOfLocalGroups:SR.2`.

**Source passages.** [nt16], §3.1, Proposition 3.8(2), p. 49: Part (i). [nt16], §3.1, Proposition 3.4: Part (ii) for the projection to the Levi quotient. [acc23], §2.1.14, p. 916: Part (iv).

### Theorem: Nomizu–van Est: cohomology of unipotent arithmetic groups is Lie algebra cohomology

**Declaration:** theorem; node `ArithmeticLocallySymmetricSpaces:ALS.4/nomizu-van-est`.

Let N be a unipotent group over ℚ, 𝔫_E=Lie(N)⊗ℚE, Γ_N⊂N(ℚ) an arithmetic lattice, E a number field, and V a finite-dimensional algebraic representation of N_E. Rational Nomizu comparison, extended to E, gives H*(𝔫_E,V)≅H*(Γ_N,V), equivalently the local-system cohomology of Γ_N\N(ℝ). After an embedding E→ℂ this is the comparison by the invariant V-valued differential-form complex with its coefficient action. If N is the unipotent radical of a rational parabolic P=M⋉N and V extends to an algebraic P_E-representation, its Lie cohomology carries the algebraic M_E-action. The fixed nilmanifold comparison is equivariant for the normalizer of Γ_N in M(ℚ); other commensurator elements require transported lattices and their pullback/trace maps. No integral or mod-p Nomizu–Kostant comparison is asserted.

**Hypotheses.**

- E a number field of characteristic zero; the E-linear rational comparison is meant before any optional complex embedding
- V a finite-dimensional algebraic N_E-representation
- Γ_N arithmetic in N(ℚ), hence a lattice in N(ℝ)
- For the Levi-equivariance statement, N is the unipotent radical of the rational parabolic P=M⋉N and V extends to an algebraic P_E-representation.

**Construction or proof.**

1. Apply rational Nomizu comparison for the algebraic unipotent group and its arithmetic lattice, with the induced E-structure; after E→ℂ this is the invariant-form de Rham comparison. The coefficient representation is unipotent and has a finite N-stable filtration with trivial graded pieces, so the central-series argument extends to V. An E-linear isomorphism is not obtained merely by forgetting the choice of a complex embedding: retain the rational comparison/descent input.
2. Γ_N\N(ℝ) is a K(Γ_N, 1) (nilmanifold fibre of stratum-nilmanifold-fibration), so its cohomology with local system V is H^*(Γ_N, V).
3. When the coefficient extends to P, M acts on 𝔫_E and V and therefore on their Lie cochains. Only the normalizer of Γ_N acts on the fixed nilmanifold; a general rational Levi commensurator compares transported lattices through refinement and transfer.
4. Use the requested AF.1a absolute Lie algebra cochain complex over E to define H^*(𝔫,V); the existing relative complex over C does not supply this exact output. The lattice comparison itself stays in ALS.4.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration`, `AdditiveCombinatorics:AC.3`, `AutomorphicFormsOnReductiveGroups:AF.1a`, `mathlib:groupCohomology`.

**Acceptance checks.**

- N = 𝔾_a, Γ_N = ℤ, V = E with trivial action: H^0 = H^1 = E, matching H^*(𝔫, E) for the one-dimensional abelian 𝔫.
- N = 𝔾_a and V = Sym^k(E²) restricted to the upper unipotent: H^0(𝔫, V) and H^1(𝔫, V) are one-dimensional (highest and lowest weight lines).

**Sources.**

- [G. Harder, A. Raghuram, Eisenstein cohomology for GL_N and ratios of critical values of Rankin–Selberg L-functions](https://arxiv.org/abs/1405.6513v2), §4.2.1, pp.25–26 (arXiv:1405.6513v2). The GL_n boundary application of the rational unipotent comparison. Its algebraic Levi action is on the coefficient module H*(𝔲_P,M_λ,E); geometry at a fixed lattice requires its normalizer. This passage invokes the comparison and is not a full proof of rational Nomizu.

**Implementation status:** `unchecked`.

### Theorem: Cohomology of a boundary stratum via van Est and Kostant

**Declaration:** theorem; node `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-cohomology-formula`.

Let G be connected reductive over F, P=M⋉N proper, K good neat, E a number field that splits 𝐆=Res_{F/ℚ}G and contains all embeddings of F, and V_λ the irreducible algebraic 𝐆_E-representation of dominant integral highest weight λ for a fixed split Borel and torus. For each transported decomposed level L_g from stratum-nilmanifold-fibration, Leray/Hochschild–Serre gives E₂^{a,b}=H^a(X^M_{L_{M,g}},H^b(𝔫,V_λ)~)⇒H^{a+b}(Y^P_{L_g},V_λ), by Nomizu–van Est. Kostant identifies H^b(𝔫,V_λ)=⊕_{w∈W^P,ℓ(w)=b}V^M_{w(λ+ρ)−ρ}; this describes the E₂ page for general reductive G and does not assert degeneration. For 𝐆=Res_{F/ℚ}GL_N with F totally real and E/ℚ Galois containing F, Harder–Raghuram §4.2, (4.2) and Proposition 4.3 supply the degeneration and the natural cohomological decomposition H^q(X^P_K,V_λ)=⊕_g⊕_{w∈W^P}H^{q−ℓ(w)}(X^M_{L_{M,g}},V^M_{w·λ}), with the transported-component and real-component invariants of that source. Over all levels this is its algebraic unnormalized induction from π₀(P(ℝ))×P(A^∞) to π₀(G(ℝ))×G(A^∞). At eligible hyperspecial components the Hecke action is through the integral unnormalized S=r_M∘r_P; conversion to normalized induction multiplies by the explicit modulus half-character. A general reductive direct-sum/derived splitting requires a separate Levi-equivariant nilpotent-cochain formality theorem; E₂ degeneration alone would give only an associated graded, not a canonical splitting. No integral Kostant decomposition is asserted.

**Hypotheses.**

- F a number field; E/ℚ a finite characteristic-zero splitting field for 𝐆=Res_{F/ℚ}G containing all embeddings of F
- Fix the split torus and Borel over E and a dominant integral highest weight λ; P and its Levi are compatible with these choices
- K neat and decomposed at the transported levels
- The cited natural direct-sum decomposition and real-component induction of Harder–Raghuram are used for 𝐆=Res_{F/ℚ}GL_N with F totally real and E/ℚ Galois containing F. General reductive G uses the E₂ spectral sequence unless a separate splitting theorem is supplied.

**Construction or proof.**

1. Apply the transported-level nilmanifold fibration to each g. Nomizu–van Est identifies the stalk cohomology with Lie-algebra cohomology; the discrete extension gives Leray/Hochschild–Serre before any degeneration claim.
2. Use the requested AF.1a absolute-cochain/Kostant theorem over the specified splitting field E and dominant integral λ, with its actual Levi modules V^M_{w·λ}. For nonsplit input without this extension one must first supply the scalar-extension/descent data; the displayed highest-weight sum is not asserted over an arbitrary characteristic-zero field.
3. For Res_{F/ℚ}GL_N with F totally real, use Harder–Raghuram v2 §4.2.1, (4.2), Proposition 4.3, §4.2.2 and §4.2.3 exactly. Keep E Galois containing F, transported levels and the real-component invariants. The proof’s referenced degeneration/splitting input remains explicit; no such natural direct sum is inferred for every reductive group.
4. Apply boundary-stratum-hecke-comparison and parabolic-hecke-maps on eligible components. The generic reductive splitting and extension beyond decomposed levels are recorded gaps with exact earlier inputs.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.4/nomizu-van-est`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison`, `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`, `ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration`, `AutomorphicFormsOnReductiveGroups:AF.1a`, `SmoothRepresentationsOfLocalGroups:SR.2`.

**Acceptance checks.**

- GL_{2,ℚ}, P = B, λ = (k, 0): W^B = {1, s}, H^0(𝔫, V_λ) = E(k, 0), H^1(𝔫, V_λ) = E(−1, k + 1), so each cusp contributes the characters (k,0) in degree 0 and (−1, k+1) in degree 1.
- λ = 0: H^*(𝔫,E) = ⊕_{w∈W^P} V^M_{w·0}[−ℓ(w)]. These are irreducible Levi representations, not generally one-dimensional characters; for a Borel M is a torus and the character notation E(w·0) is valid.

**Sources.**

- [G. Harder, A. Raghuram, Eisenstein cohomology for GL_N and ratios of critical values of Rankin–Selberg L-functions](https://arxiv.org/abs/1405.6513v2), §4.2.1, (4.2), p.26 (arXiv:1405.6513v2). Part (i), summed over the strata components.
- [G. Harder, A. Raghuram, Eisenstein cohomology for GL_N and ratios of critical values of Rankin–Selberg L-functions](https://arxiv.org/abs/1405.6513v2), §4.2.3, (4.5), p.27 (arXiv:1405.6513v2). Part (ii).
- [G. Harder, A. Raghuram, Eisenstein cohomology for GL_N and ratios of critical values of Rankin–Selberg L-functions](https://arxiv.org/abs/1405.6513v2), §4.2.1, Proposition 4.3, p.26 (arXiv:1405.6513v2). Part (iii), algebraic induction.

**Atlas planet:** Kostant–van Est boundary formula.

**Implementation status:** `unchecked`.

### Theorem: The integral Leray–Hochschild–Serre spectral sequence of a stratum

**Declaration:** theorem; node `ArithmeticLocallySymmetricSpaces:ALS.4/levi-hochschild-serre`.

For neat decomposed K and P=M⋉N, write X^P_K=⊔_gY^P_{L_g}, with all levels and arithmetic groups transported as in stratum-nilmanifold-fibration. For each component the discrete extension 1→Γ_{N,g}→Γ_{P,g}→Γ_{M,g}→1 gives E₂^{a,b}=H^a(Γ_{M,g},H^b(Γ_{N,g},V))⇒H^{a+b}(Γ_{P,g},V), equivalently the Leray sequence on the Levi base with the indicated local coefficient sheaf. Sum these sequences across g. They are Hecke-compatible through the induced parabolic action and the r_M comparison where its hypotheses hold. Coefficient base change is a derived map of spectral sequences, retaining Tor terms; it is not an isomorphism of E₂ pages without flatness. In the special NT16 Lemma 4.5 setting, N is an F-unipotent group, Γ_N is a congruence subgroup N(F)∩U_N, and k has the stated p-residue coefficients with trivial N-action. The comparison with U_{N,S} uses the discrete groups and the arithmetic acyclicity argument in that lemma. The pro-p topology of U_{N,S} does not by itself identify its continuous cohomology with this discrete cohomology; no general discrete/profinite comparison is claimed here.

**Hypotheses.**

- K neat and decomposed
- V finite projective

**Construction or proof.**

1. For each g use the exact arithmetic Γ extension from the nilmanifold fibre, and the discrete Cartan–Leray/Leray construction requested from AlgebraicTopology stage 5. Its local monodromy is induced by Γ_M conjugation and the coefficient action.
2. Keep the transported levels in the sum and use the induced-invariants parabolic comparison for the Hecke action; no untransported Levi base represents the entire G-stratum.
3. For the specialized p-coefficient assertion read NT16 Lemma 4.5 as a statement about discrete groups and its hypotheses. Its arithmetic filtration and acyclicity are proof inputs; density in a compact p-adic group is not a proof of cohomological comparison.
4. Derived coefficient change gives maps retaining all Tor contributions. Finite quotient groups in ALS.6 have the discrete topology, so their continuous cochains, if used, coincide with ordinary group cochains by a direct finite-domain identification.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison`, `mathlib:groupCohomology`, `ArithmeticLocallySymmetricSpaces:ALS.1/group-cohomology-comparison`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

**Acceptance checks.**

- For GL_{2,ℚ}, P = B: Γ_N ≅ ℤ, E_2^{a,b} = H^a(pt, H^b(ℤ, V)), giving H^0 and H^1 of the cusp circle as invariants and coinvariants of the unipotent monodromy on V.
- In characteristic 0, over a number field E splitting the group and for V=V_λ irreducible of dominant integral highest weight, the E_2 page is the Kostant–van Est formula.

**Sources.**

- [J. Newton, J. A. Thorne, Torsion Galois representations over CM fields and Hecke algebras in the derived category](https://doi.org/10.1017/fms.2016.16), §4, Lemma 4.5, p. 56. The integral (mod p) comparison for the unipotent part.
- [G. Harder, A. Raghuram, Eisenstein cohomology for GL_N and ratios of critical values of Rankin–Selberg L-functions](https://arxiv.org/abs/1405.6513v2), §4.2.1, p.25, before (4.2) (arXiv:1405.6513v2). The characteristic-zero GL_n/ totally-real-field boundary fibration in the source. Its degeneration is not used to identify the integral sequence, and alone does not produce a canonical general reductive splitting.

**Implementation status:** `unchecked`.

### Theorem: Gluing over strata: convergence and Hecke compatibility of the boundary spectral sequence

**Identifier:** `ALS.4/boundary-gluing-convergence`.

The compact-support exact couple of stratification-spectral-sequence is Hecke-equivariant, finite and convergent, with d_r:(p,q)→(p−r,q+r+1). Each global term is the sum/induction over its transported P-spaces. Exact localization of this finite filtration shows: if H^*_c(X^P_K,V)_𝔪=0 for every proper P, then H^*(∂X̄_K,V)_𝔪=0. If only open maximal-parabolic strata survive, extension by zero identifies their direct sum of compact-support complexes with the localized boundary complex. To deduce the compact-support hypothesis from ordinary-stratum vanishing at neat level over a field, use the individual early Verdier duality and Hecke-adjoint nodes: H^*(X^P_K,V^∨⊗o_P)_{𝔪^∨}=0 implies H^*_c(X^P_K,V)_𝔪=0, where 𝔪^∨ is transported through the inverse-double-coset involution. Over O first reduce coefficients modulo ϖ, use this field duality and finite-perfectness, then derived Nakayama. Ordinary vanishing for V at 𝔪 is sufficient only when an additional argument supplies the required dual-coefficient/inverse-ideal vanishing (as in NT16 Lemmas 4.1 and 4.4). For Res_{F/ℚ}GL_N with F totally real the separate ordinary flag sequence also converges, with alternating-restriction d₁:(p,q)→(p+1,q); it is not substituted for the support argument in NT16’s proof.

**Hypotheses.** K neat 𝔪 a maximal ideal of T^S

**Construction or proof.**

1. Form the localized exact couple of stratification-spectral-sequence; localization is exact on the finite Hecke-module filtration and commutes with its maps. Vanishing of all compact-support terms forces the abutment to vanish.
2. When the complement of the surviving open maximal strata has zero localized cohomology, the open/closed triangle proves the extension-by-zero isomorphism from their compact-support sum.
3. Use verdier-poincare-duality and hecke-adjoint-duality individually on each neat P-space of dimension d_P: dual ordinary coefficients live at the inverse ideal. These nodes depend only on ALS.0–ALS.3 and introduce no stage cycle through ALS.4.
4. NT16 Lemma 4.1 carries S-Galois type between ordinary and compact supports by inverse polynomials and the dual/cyclotomic twist; Lemma 4.4 then uses compact-support localization and induction on the number of strata. Over integral coefficients use reduction and Nakayama with finite perfect complexes.

**Acceptance properties.**

- If no stratum has 𝔪 in its support, the boundary vanishes at 𝔪.
- For F-rank one the spectral sequence is a direct sum (ALS.2 test stratSS_rank_one_collapse).

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.2/stratification-spectral-sequence`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality`.

**Source passages.** [nt16], §4, proof of Lemma 4.4, p. 56: Duality on the strata, then gluing. [acc23], §2.4, Theorem 2.4.2 proof, p. 942: The open-stratum map used when only one stratum survives.

### Construction: Localizing perfect Hecke complexes at a maximal ideal

**Identifier:** `ALS.4/localization-at-maximal-ideal`.

Let C be a perfect complex of O-modules with a homomorphism T^S → End_{D(O)}(C) and T^S(C) its (commutative, finite) image. For a maximal ideal 𝔪 ⊂ T^S(C) let e_𝔪 ∈ T^S(C) be the idempotent of the factor T^S(C)_𝔪 in T^S(C) = ∏_𝔪 T^S(C)_𝔪. Since idempotents split in D(O), C ≅ C_𝔪 ⊕ C′ with e_𝔪 acting as the projector onto C_𝔪, unique up to unique isomorphism; T^S(C)_𝔪 ≅ T^S(C_𝔪) and H^*(C)_𝔪 ≅ H^*(C_𝔪). For a maximal ideal 𝔪 of T^S, C_𝔪 := C_{𝔪T^S(C)} (zero if 𝔪 is not in the support). Localization is functorial for T^S-equivariant maps between such complexes, exact (carries exact triangles of T^S-complexes to exact triangles), and commutes with coefficient change O → O/ϖ^m.

**Hypotheses.** O a complete discrete valuation ring C perfect

**Construction or proof.**

1. T^S(C) is finite over the complete local ring O, hence a finite product of local rings T^S(C)_𝔪 with idempotents e_𝔪.
2. Idempotents split in D(O) (IntegralHeckeAndGaloisDeterminants IHG.2/derived-idempotent-splitting), giving C_𝔪.
3. T^S(C)_𝔪 = e_𝔪T^S(C) acts faithfully on C_𝔪; H^*(e_𝔪C) = e_𝔪H^*(C) = H^*(C)_𝔪.
4. Exactness: for a triangle of T^S-equivariant complexes the e_𝔪 (for the image of T^S in the endomorphisms of all three) cut out a direct summand triangle (NT16 Lemma 3.13-type argument).

**API.**

- `LocallySymmetric.heckeLocalize` (data): C ↦ C_𝔪, the e_𝔪-summand of a perfect T^S-complex, with inclusion and projection maps.
- `LocallySymmetric.heckeLocalize.cohomology` (characterisation): H^*(C_𝔪) ≅ H^*(C)_𝔪 as T^S-modules.
- `LocallySymmetric.heckeLocalize.heckeAlgebra` (characterisation): T^S(C_𝔪) ≅ T^S(C)_𝔪.
- `LocallySymmetric.heckeLocalize.triangle` (functoriality): Localization carries T^S-equivariant exact triangles to exact triangles (e.g. the boundary triangle).
- `LocallySymmetric.heckeLocalize.eq_zero_iff` (characterisation): C_𝔪 = 0 iff 𝔪 is not in the support of H^*(C).
- `LocallySymmetric.heckeLocalize.reduction` (compatibility): (C ⊗^L O/ϖ^m)_𝔪 ≅ C_𝔪 ⊗^L O/ϖ^m.

**Unit tests.**

- `heckeLocalize_unsupported` (degenerate): If 𝔪 ∉ Supp H^*(C), then C_𝔪 ≅ 0.
- `heckeLocalize_module` (compatibility): If C = M[0] for a finite T^S-module M, C_𝔪 = M_𝔪[0], the localization of commutative algebra.
- `heckeLocalize_sum` (characterisation): C ≅ ⊕_𝔪 C_𝔪 over the finitely many maximal ideals of T^S(C).
- `heckeLocalize_not_tensor` (non-example): A ring homomorphism T^S→End_D(O)(C) does not itself specify a strict cochain T^S-action. With a specified compatible lift to D(T^S), derived tensor with T^S_𝔪 computes localization. The geometric relative ring action alone does not provide this lift.

**Consumers.**

- NT16 Theorem 4.2: (RΓ_c)_𝔪 → (RΓ)_𝔪 is a quasi-isomorphism at non-Eisenstein 𝔪
- ACC+ Theorem 2.4.2, Theorem 2.4.10: localized boundary and interior cohomology
- CG20 Theorem 3.2 (appendix A.4): localization of H^i(Y_1(Q), O/ϖ^n) at 𝔪_α
- CompletedCohomologyPartII:CC.8: localisation at a residual Hecke ideal along the tower

**Acceptance properties.**

- If 𝔪 is not in the support of H^*(C), C_𝔪 = 0.
- For C concentrated in one degree, C_𝔪 is the usual localization of the T^S-module H^*(C).

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra`; `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-idempotent-splitting`; `mathlib:CategoryTheory.IsIdempotentComplete`; `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`; `IntegralHeckeAndGaloisDeterminants:IHG.2/finite-hecke-local-factors`; `IntegralHeckeAndGaloisDeterminants:IHG.2/hecke-localized-complex`; `IntegralHeckeAndGaloisDeterminants:IHG.2/hecke-support`.

**Source passages.** [nt16], §3.2, p. 52: The construction. [nt16], §3.2, p. 52: The properties.

### Definition: Galois type, Eisenstein and non-Eisenstein maximal ideals

**Identifier:** `ALS.4/eisenstein-maximal-ideal`.

Let G = GL_{m,F}, S ⊃ S_p, T^S = T^S_{GL_m} generated by T_v^i (i = 1, …, m) and (T_v^m)⁻¹, v ∉ S. A perfect T^S-complex C of O-modules is of S-Galois type if for each maximal ideal 𝔪 ⊂ T^S(C) there is a continuous semisimple ρ̄_𝔪 : G_{F,S} → GL_m(T^S(C)/𝔪) with det(X − ρ̄_𝔪(Frob_v)) = X^m − T_v^1X^{m−1} + … + (−1)^j q_v^{j(j−1)/2}T_v^jX^{m−j} + … + (−1)^m q_v^{m(m−1)/2}T_v^m for all v ∉ S. Then 𝔪 is Eisenstein if ρ̄_𝔪 is absolutely reducible and non-Eisenstein otherwise; C is Eisenstein if all its maximal ideals are. For PGL_2 over an imaginary quadratic F (CG18), a maximal ideal 𝔪 of the Hecke algebra T_Q is Eisenstein if T_λ − 2 ∈ 𝔪 for all but finitely many primes λ splitting completely in some fixed abelian extension of F; both definitions agree when ρ̄_𝔪 exists (reducible semisimple ρ̄ with determinant conditions forces T_λ ≡ 2 on a density-one set of split λ).

**Hypotheses.** G = GL_m (Galois definition) G = PGL_2 over imaginary quadratic F (CG18 definition)

**Construction or proof.**

1. S-Galois type is a property of (C, T^S → End(C)); it depends only on H^*(C) (NT16 §4).
2. Agreement of the two notions for PGL_2: if ρ̄_𝔪 ≅ χ₁ ⊕ χ₂ with χ₁χ₂ = ε (cyclotomic, PGL_2-normalisation), then at λ split in the abelian extension cut out by χ₁, χ₂ and ε, T_λ ≡ χ₁ + χ₂ = 2; conversely Chebotarev and Brauer–Nesbitt.

**API.**

- `LocallySymmetric.IsGaloisType` (data): A perfect T^S-complex C is of S-Galois type: residual representations ρ̄_𝔪 with the displayed Frobenius characteristic polynomials exist for all 𝔪.
- `LocallySymmetric.IsEisenstein` (data): 𝔪 is Eisenstein: ρ̄_𝔪 is absolutely reducible (for C of S-Galois type).
- `LocallySymmetric.IsEisenstein.of_cohomology` (characterisation): S-Galois type and the Eisenstein property of C depend only on H^*(C) with its T^S-action.
- `LocallySymmetric.IsEisensteinCG` (data): CG18's notion for PGL_2/F: T_λ − 2 ∈ 𝔪 for almost all λ split in a fixed abelian extension.
- `LocallySymmetric.IsEisenstein.iff_CG` (compatibility): For PGL_2 over imaginary quadratic F with ρ̄_𝔪 existing, the two notions agree.

**Unit tests.**

- `eisenstein_H0` (computation): For GL_2, the constant-functions eigensystem on H^0 has T_v^1 = 1 + q_v and T_v^2 = 1. Its Hecke polynomial is X² − (1+q_v)X + q_v = (X−1)(X−q_v), so the associated residual representation is reducible. The cyclotomic character or its inverse is fixed by the Frobenius convention; T_v^2 = q_v would give the wrong determinant q_v².
- `eisenstein_GL1` (degenerate): For m = 1 every maximal ideal of S-Galois type is non-Eisenstein (one-dimensional representations are irreducible).
- `eisenstein_iff_CG_PGL2` (compatibility): For PGL_2 over imaginary quadratic F, ρ̄_𝔪 reducible ⇔ T_λ − 2 ∈ 𝔪 for almost all λ split in a fixed abelian extension (CG18 Definition 5.5).
- `nonEisenstein_not_vanishing` (non-example): Non-Eisenstein in the Hecke sense of a single group does not by itself kill boundary cohomology: for groups whose Levi subgroups carry cuspidal cohomology (e.g. the Siegel parabolic of U(n,n) with Levi Res_{F/F⁺}GL_n), boundary cohomology localized at a non-Eisenstein 𝔪̃ can be nonzero (ACC+ Theorem 2.4.2).

**Consumers.**

- NT16 Theorem 4.2: boundary cohomology of GL_n is Eisenstein
- CG18 Lemma 5.9(3): localized boundary vanishing for PGL_2 at non-Eisenstein 𝔪
- ACC+ Theorem 2.4.2: non-Eisenstein maximal ideals 𝔪 ⊂ T^S(K, λ)
- ALS README: the phrase non-Eisenstein alone is not a proof of vanishing: an actual eigenvalue argument is required

**Acceptance properties.**

- For GL₂, the constant-function Hecke eigensystem on H⁰ has polynomial (X−1)(X−q_v), so its associated semisimple residual representation is Eisenstein. The one-dimensional GL₁ case is excluded.
- For GL_1 every 𝔪 is non-Eisenstein in the Galois sense (1-dimensional ρ̄ is irreducible).

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal`; `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra`; `mathlib:Matrix.GeneralLinearGroup`.

**Source passages.** [nt16], §4, p. 54: The Galois-theoretic definition. [cg18], §5.3, Definition 5.5 (arXiv v2): The Hecke-theoretic definition for PGL_2.

### Theorem: Boundary vanishing by an eigenvalue argument

**Identifier:** `ALS.4/boundary-eigenvalue-criterion`.

Let K be neat and decomposed with respect to the standard parabolics, V finite projective over O and 𝔪 ⊂ T^S_G a maximal ideal. For every proper P=M⋉N and every transported component g of the global P-stratum, use its actual level L_g, Levi level L_{M,g}, and lattice Γ_{N,g}. For W=V⊗k at 𝔪 and also W=(V⊗k)^∨⊗o_{P,g} at the inverse-double-coset ideal 𝔪^∨, impose the following eigenvalue exclusion: no maximal ideal 𝔪_M in the support of any Levi complex RΓ(X^M_{L_{M,g}},A), with A a finite local-coefficient subquotient arising from H^b(Γ_{N,g},W), pulls back through the unnormalized Satake map to the corresponding G-ideal. Then RΓ(∂X̄_K,V)_𝔪=0 and RΓ_c(X_K,V)_𝔪→RΓ(X_K,V)_𝔪 is an isomorphism. The dual exclusion can equivalently be replaced by direct vanishing of every compact-support stratum complex at 𝔪. It is not inferred from the ordinary exclusion alone. These are actual conditions on all transported Levi eigensystems; the label non-Eisenstein alone proves nothing.

**Hypotheses.** K neat and decomposed the stated ordinary and dual/inverse-ideal exclusions for every proper parabolic and every transported component, or the stated direct compact-support alternative

**Construction or proof.**

1. Reduce to residue-field coefficients using finite-perfectness and derived Nakayama, keeping the transported levels and the local coefficient systems; shrinking K_S is allowed only with the coefficient-descent comparison.
2. Levi Hochschild–Serre and boundary-stratum Hecke comparison place the support of each ordinary stratum, for both coefficient systems, inside the union of Satake pullbacks of the corresponding Levi supports. Apply the two exclusions component by component.
3. Early Verdier duality and Hecke adjointness convert the dual-coefficient vanishing at 𝔪^∨ into compact-support stratum vanishing at 𝔪. Apply the compact-support exact couple of boundary-gluing-convergence and then the boundary triangle. Lift back to O by derived Nakayama.

**Acceptance properties.**

- In the PGL₂/ℚ trivial-coefficient case where every cusp component has the trivial torus eigensystem, T_ℓ acts on cusp H⁰ by 1+ℓ in the stated normalization. Exclusion of this eigensystem and its dual/inverse counterpart kills the cusps. At levels with nontrivial torus characters, exclude all occurring character eigensystems; a test against 1+ℓ alone is insufficient.
- For GL_n this is the mechanism of NT16 Theorem 4.2.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-gluing-convergence`; `ArithmeticLocallySymmetricSpaces:ALS.4/levi-hochschild-serre`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`; `ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal`; `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality`.

**Source passages.** [nt16], §4, Lemma 4.4, p. 55: The reduction to strata. [acc23], §2.4, p. 941: The method.

### Theorem: Boundary cohomology of GL_n is Eisenstein

**Identifier:** `ALS.4/gln-boundary-eisenstein`.

Let F be a number field, G = GL_{n,F}, S ⊃ S_p, U ∈ J_{G,U^S} (neat, U_v = GL_n(O_{F_v}) for v ∉ S). Assume ♠: for every 1 ≤ m ≤ n and every such level for GL_m, RΓ(X^U_{GL_m}, k) is of S-Galois type (the ordinary-coefficient Galois attachment is supplied outside this roadmap). In addition assume the orientation-compatible form of this input: for every such GL_m level and finite smooth k[U_S]-module B, RΓ(X^U_{GL_m}, B^∨⊗o_U) is of S-Galois type with the same rank-m unnormalized Hecke-polynomial convention. At orientable levels this extra condition follows from the ordinary finite-coefficient input; at general real-place levels it is an explicit additional hypothesis, not a consequence of neatness. Then for every smooth O[U_S]-module A, finite over O, RΓ(∂X̄^U_G, A) is Eisenstein; hence for every non-Eisenstein maximal ideal 𝔪 ⊂ T^S(RΓ(X^U_G, A)), (RΓ_c(X^U_G, A))_𝔪 → (RΓ(X^U_G, A))_𝔪 is a quasi-isomorphism. Variants: (a) for G = PGL_{n,F}, F imaginary CM, at the levels Y(K), Y_0(Q), Y_1(Q) of CG18 §9 and O/ϖ^n coefficients, if r̄_𝔪 is absolutely irreducible then H^*(∂Y_?, O/ϖ^n)_𝔪 = 0 (the hypothesis omitted from the statement of CG20 Theorem 3.2/A.4, PAPER-CALEGARI-GERAGHTY-20/E140); (b) for PGL_2 over imaginary quadratic F and non-Eisenstein 𝔪 in the sense of CG18 Definition 5.5, H_i(Y_0(Q), μ)_𝔪 ≅ H_i^{BM}(Y_0(Q), μ)_𝔪 (CG18 Lemma 5.9(3)).

**Hypotheses.** ♠ (Galois type for GL_m, m ≤ n) U neat, hyperspecial outside S Orientation-compatible Galois type for the dual coefficient system B^∨⊗o_U at every GL_m level used in the induction

**Construction or proof.**

1. Use early duality on B and the explicit orientation-compatible Galois-type hypothesis for B^∨⊗o_U to transfer S-Galois type to compact supports. The Hecke anti-involution gives the inverse representation ρ̄^∨⊗ε^{1−m}, with the stated Frobenius/cyclotomic convention. NT16 Lemma 4.1 omits o_U; its printed ordinary ♠ input alone is not used to discard this twist at a nonorientable real-place level.
2. Apply Lemma 4.5 in its discrete arithmetic setting and induct on the proper Levi factors. Through the unnormalized Satake map, a proper Levi eigensystem has a residual representation with multiple smaller blocks, hence is absolutely reducible.
3. Apply Lemma 4.4 and boundary-gluing-convergence: ordinary and dual/inverse-ideal Eisenstein criteria give the compact-support stratum vanishing needed for the open-support induction. Do not bypass the early duality used by the source with an unsupported generic closed-cover formula.
4. Use the Hecke-equivariant boundary triangle for the quasi-isomorphism at non-Eisenstein ideals. For finite O/ϖ^a coefficients reduce to k and use the finite cell model and derived Nakayama. Retain ♠ as an external torsion-Galois hypothesis, rather than derive it from this roadmap.

**Acceptance properties.**

- For GL_{2,ℚ} and modular curves, H^*(∂X̄_K)_𝔪 = 0 for every 𝔪 with ρ̄_𝔪 irreducible, so interior and compactly supported cohomology agree at 𝔪.
- For n = 1 the boundary is empty.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-eigenvalue-criterion`; `ArithmeticLocallySymmetricSpaces:ALS.4/eisenstein-maximal-ideal`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality`.

**Source passages.** [nt16], §4, Theorem 4.2, p. 55: The boundary-vanishing target, with the explicit orientation-compatible input required by the corrected duality argument (source issue E1). The general real-place ♠-only formulation is not claimed here. [cg20], §3.1, proof of Theorem 3.2 (appendix A.4): Variant (a), with the absolute irreducibility hypothesis made explicit. [cg18], Lemma 5.9(3) (arXiv v2): Variant (b).

### Theorem: Localized boundary cohomology of U(n, n) is the Siegel stratum

**Identifier:** `ALS.4/siegel-stratum-localization`.

Let F be CM with maximal totally real subfield F⁺, G̃ the quasi-split unitary group U(n, n) over F⁺ with Siegel parabolic P = G ⋉ U, G = Res_{F/F⁺}GL_n, K̃ good and decomposed with respect to P, K = K̃ ∩ G(A^∞_{F⁺}), S = S^c. Let 𝔪 ⊂ T^S(K, λ) be non-Eisenstein and 𝔪̃ = S^*(𝔪) ⊂ T̃^S. Then for every λ̃ ∈ (ℤ^{2n}_+)^{Hom(F⁺,E)} there is a natural T̃^S-equivariant isomorphism RΓ(X̃^P_{K̃}, Ṽ_λ̃)_𝔪̃ ≅ RΓ(∂X̃_{K̃}, Ṽ_λ̃)_𝔪̃ in D(O): after localization only the Siegel stratum contributes. The proof uses the Galois representations attached to Hecke eigensystems in the cohomology of the Levi subgroups (S-Galois type for Res_{F/F⁺}GL_m, m ≤ n), as in gln-boundary-eisenstein.

**Hypotheses.** F CM K̃ good and decomposed 𝔪 non-Eisenstein Galois type for the Levi factors

**Construction or proof.**

1. Use ACC+ Theorem 2.4.2, pp. 941–943. For a non-Siegel parabolic Q, its proper Levi has at least three nonzero residual blocks under the stated Satake twists, whereas the induced Siegel residual parameter has the two prescribed n-dimensional irreducible blocks. The GL_m S-Galois-type inputs and residual matching rule out these strata.
2. Include all transported P-level components in X̃^P_{K̃}. Open/closed localization gives RΓ_c(X̃^P_{K̃},Ṽ)_𝔪̃→RΓ(∂X̃_{K̃},Ṽ)_𝔪̃ as an isomorphism once the other compact-support strata vanish.
3. The source’s excision on the closure of the Siegel stratum removes its lower boundary strata, whose Levi cohomology is Eisenstein at 𝔪. This identifies compactly supported and ordinary Siegel cohomology, rather than assume a generic identification of the two at the same ideal.
4. Compose the two maps. This is the canonical isomorphism in D(O) intertwining the unitary Hecke action through S; no chosen single untransported P-space is substituted for the global stratum.

**Acceptance properties.**

- n = 1: G̃ = U(1,1), the Siegel parabolic is the Borel and the boundary is its stratum.
- The hypothesis on 𝔪 cannot be dropped: an Eisenstein 𝔪 receives contributions from the Borel stratum.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-gluing-convergence`; `ArithmeticLocallySymmetricSpaces:ALS.4/gln-boundary-eisenstein`; `ArithmeticLocallySymmetricSpaces:ALS.4/eisenstein-maximal-ideal`; `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`; `ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality`.

**Source passages.** [acc23], §2.4.1, Theorem 2.4.2, pp. 941–942: The theorem. [acc23], §2.4.1, proof of Theorem 2.4.2, p. 942: The method.

## ALS.5:finite-level-duality. Early finite-level duality

Round the corner quotient while preserving its topological pair. Apply the generic AT manifold-with-boundary duality with orientation coefficients to obtain the interior, relative and boundary comparisons, evaluation pairings and inverse-coset adjoints. Fix rotation signs on the dual support triangle. At non-neat level averaging gives the stated extension; modular stabilizers provide the counterexample when that hypothesis is absent.

**Planets:** Poincaré–Verdier duality for X_K; Poincaré duality pairings; Hecke adjoint formula.

**Coverage:** planned. Remaining closure: Resolve the exact inputs recorded in Typed arithmetic and analytic corner interfaces. Resolve the exact inputs recorded in Coherent equivariant supports, refinements and trace. Resolve the exact inputs recorded in Stage order for geometry, supports, duality and automorphic applications. Resolve the exact inputs recorded in Suggested signatures: ALS.5:finite-level-duality.

### Theorem: X̄_K as a compact topological manifold with boundary

**Identifier:** `ALS.5:finite-level-duality/corner-boundary-bridge`.

For neat K, round X̄_K by Douady–Hérault Theorem and Definition 6.2: a positive boundary-defining product function and a strictly outward vector field give a smooth manifold with boundary on the same underlying topological space, whose smooth structure agrees away from corners of depth ≥2. Proposition 4.2 supplies the topological collar of the full boundary; choices alter the smoothing, not the underlying pair (X̄_K,∂X̄_K). Its interior is X_K and its boundary is a closed topological (d_G−1)-manifold. The orientation system extends from the interior and restricts to the boundary orientation system via the outward-normal convention, with a fixed sign if the inward normal is used instead. Thus AlgebraicTopology stage 6 Poincaré–Lefschetz duality applies. Naturality of pair cohomology, orientation sheaves and finite-cover transfers uses the original topological pair; it does not require a functorial smoothing choice.

**Hypotheses.** K neat

**Construction or proof.**

1. Choose a boundary-defining product function using Douady–Hérault §5 and a strictly outward field using partitions of unity (§§2–3). Propositions 4.2–4.3 identify a neighborhood of the full boundary with a product using the flow.
2. Apply Theorem 6.2 to give the same underlying space a smooth boundary structure; use identity on the underlying topological pair. The smooth boundary structure agrees with the old one off depth-two corners.
3. Transport the local orientation sheaf through the collar and use the outward normal to fix the boundary orientation convention. Apply the topological-pair duality supplied by AlgebraicTopology stage 6.
4. Level maps and correspondences act on the original topological pairs and their local orientation sheaves, so induced cohomology maps are independent of rounding choices. No natural smoothing functor is needed.

**Acceptance properties.**

- For a modular curve, X̄_K is a compact surface with boundary circles.
- For G anisotropic, X̄_K = X_K is closed and the bridge is the identity.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact`; `ArithmeticLocallySymmetricSpaces:ALS.0/orientation-local-system`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `mathlib:ModelWithCorners`.

**Source passages.** [acc23], §2.1.1, p. 910: The manifold-with-corners structure to which the bridge applies. [nt16], §3.1, Proposition 3.7(1): The duality the bridge makes available (stated by NT16 without the orientation twist; see sourceIssues E1). [dh73], Propositions 4.2–4.3, Proposition 6.1, Theorem and Definition 6.2, pp. 487–489: Rounding leaves the topological pair unchanged and supplies a smooth full boundary; the collar establishes the orientation comparison.

### Theorem: Poincaré–Verdier duality for X_K with perfect coefficients and orientation twist

**Identifier:** `ALS.5:finite-level-duality/verdier-poincare-duality`.

Let K be neat, R noetherian, d = d_G, and V a bounded complex of finite projective R-modules with R[G(F) × K_S]-action (a perfect coefficient complex); V^∨ = Hom_R(V, R). Then there is a natural isomorphism in D(R) RHom_R(RΓ_c(X_K, V), R) ≅ RΓ(X_K, V^∨ ⊗ o_K)[d], and likewise RHom_R(RΓ(X_K, V), R) ≅ RΓ_c(X_K, V^∨ ⊗ o_K)[d] and, for the closed (d−1)-manifold ∂X̄_K, RHom_R(RΓ(∂X̄_K, V), R) ≅ RΓ(∂X̄_K, V^∨ ⊗ o_K)[d − 1]. These are natural in V, compatible with coefficient change R → R′ (ALS.1/coefficient-change) and with pullback along level maps (π^* dual to the trace π_*). In each degree they give the universal-coefficient sequences 0 → Ext^1_R(H^{d−i+1}_c(X_K, V), R) → H^i(X_K, V^∨ ⊗ o_K) → Hom_R(H^{d−i}_c(X_K, V), R) → 0 when R is a Dedekind domain. When X_K is orientable (e.g. G(F_∞) connected) o_K may be omitted, as in NT16 Proposition 3.7 and ACC+ Proposition 2.2.21. The same oriented-manifold argument gives RHom_R(RΓ_c(Y^P_{L_g},V),R)≅RΓ(Y^P_{L_g},V^∨⊗o_{P,g})[d_P] for each good neat transported P-space of boundary-stratification, with d_P=dim e(P) and its own orientation system. Apply the generic E1 manifold Verdier comparison on that open stratum; do not treat a nonreductive parabolic as a reductive G.

**Hypotheses.** K neat R noetherian V a bounded complex of finite projective R-modules

**Construction or proof.**

1. X_K is a d-manifold (neat-level-manifold) and V_K a locally constant complex of finite projective R-modules; Verdier duality on X_K gives RHom(RΓ_c(X_K, V_K), R) ≅ RΓ(X_K, ℋom(V_K, ω_{X_K})) with dualizing complex ω_{X_K} ≅ o_K[d] (EnhancedDerivedSheaves E1 for the derived sheaf categories).
2. Alternatively, by corner-boundary-bridge, Tau Ceti's stage-6 Poincaré–Lefschetz duality for the compact manifold with boundary (X̄_K, ∂X̄_K) with local coefficients gives the same isomorphism on finite cochain models (borel-serre-finite-triangulation), and perfectness lets one pass from modules to perfect complexes and take RHom.
3. The shift is [d]: the trace H^d_c(X_K, o_K) → R.
4. The orientation twist cannot be dropped: for the nonorientable example of ALS.0, H^2_c(X_K, R) ≇ Hom(H^0(X_K, R), R) on the nonorientable component when 2 ≠ 0 in R.
5. For a transported P-space, proper torsion-free arithmetic action on e(P) gives a d_P-manifold. Apply the same local orientation-dualizing-complex argument directly there. This supplies the ordinary/compact comparison used in the compact-support boundary induction, independently of ALS.4.

**Acceptance properties.**

- For a modular curve (orientable surface, d = 2) H^2_c(X_K, R) ≅ R per component and H^1_c is dual to H^1.
- For a nonorientable closed surface Σ, H^2(Σ, ℤ) = ℤ/2 but H^2(Σ, o) = ℤ.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/corner-boundary-bridge`; `ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`; `ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`; `EnhancedDerivedSheaves:E1`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `DeformationAndDerivedPatchingAlgebra:P7/perfect-object`; `ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification`; `ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration`.

**Source passages.** [nt16], §3.1, Proposition 3.7(1), p. 48: Published Proposition 3.7(1) omits both the orientation twist (E1) and dimension shift (E3). The corrected formula here uses the usual cohomological convention, also explicit in ACC+ Proposition 2.2.21. [acc23], §2.2.20, Proposition 2.2.21, p. 932: The GL_n-over-CM form with the shift D = dim X.

### Construction: Evaluation, cup-product and relative duality pairings

**Identifier:** `ALS.5:finite-level-duality/duality-pairings`.

For neat K, R noetherian and V as in verdier-poincare-duality, define the cup-product pairings ⟨·,·⟩ : H^i_c(X_K, V) × H^{d−i}(X_K, V^∨ ⊗ o_K) → H^d_c(X_K, o_K) → R (cup product with the evaluation V ⊗ V^∨ → R, then the trace given by the fundamental class of the orientation local system) and the relative pairing H^i(X̄_K, ∂X̄_K; V) × H^{d−i}(X̄_K; V^∨ ⊗ o_K) → R, identified with the first through RΓ_c(X_K) ≅ RΓ(X̄_K, ∂X̄_K) and RΓ(X_K) ≅ RΓ(X̄_K); and the boundary pairing H^i(∂X̄_K, V) × H^{d−1−i}(∂X̄_K, V^∨ ⊗ o_K) → R. These pairings are the evaluations of the isomorphisms of verdier-poincare-duality; over a field they are perfect.

**Hypotheses.** K neat R noetherian

**Construction or proof.**

1. Cup product of cochains with local coefficients and the cap/trace of AT stage 6; the trace H^d_c(X_K, o_K) → R is the fundamental class of the (twisted) orientation.
2. Relative version: excision and RΓ_c(X_K) ≅ RΓ(X̄_K, ∂X̄_K) (homotopy equivalence of the pair with a collar).
3. Perfectness over a field: evaluate the isomorphism of verdier-poincare-duality on cohomology.

**API.**

- `LocallySymmetric.dualityPairing` (data): ⟨·,·⟩ : H^i_c(X_K, V) × H^{d−i}(X_K, V^∨ ⊗ o_K) → R.
- `LocallySymmetric.dualityPairing_relative` (data): The relative pairing on (X̄_K, ∂X̄_K) and the boundary pairing on ∂X̄_K.
- `LocallySymmetric.dualityPairing_perfect` (characterisation): Over a field the pairings are perfect.
- `LocallySymmetric.dualityPairing_pullback_trace` (relation): ⟨π^*x, y⟩_{K′} = ⟨x, π_*y⟩_K for K′ ⊂ K (pullback adjoint to trace).
- `LocallySymmetric.dualityPairing_eq_evaluation` (compatibility): The pairing is the evaluation of RHom(RΓ_c(X_K, V), R) ≅ RΓ(X_K, V^∨ ⊗ o_K)[d] on cohomology.

**Unit tests.**

- `pairing_surface_H0H2` (computation): For a connected modular curve X_K and a field k, H^0(X_K, k) × H^2_c(X_K, k) → k is (a, b) ↦ a·∫b, perfect with both sides k.
- `pairing_compact_case` (degenerate): If X_K is compact (G anisotropic), H^i_c = H^i and the pairing is classical Poincaré duality on a closed manifold.
- `pairing_pullback_trace` (characterisation): ⟨π^*x, y⟩_{K′} = ⟨x, π_*y⟩_K for K′ ⊂ K neat.
- `pairing_needs_orientation` (non-example): Without the twist by o_K the pairing H^2_c(X_K, F_3) × H^0(X_K, F_3) → F_3 vanishes identically on the nonorientable component of ALS.0's PGL_2 example, since H^2_c of a nonorientable surface with F_3 coefficients is 0.

**Consumers.**

- NT16 Lemma 4.1: the duality pairing transfers S-Galois type from H^* to H^*_c
- ACC+ §4.5, §6.5: Poincaré duality pairs 𝔪 with 𝔪^∨
- HilbertModularVarietiesAndShimuraCurves:R18.4/cohomology-pairing: requests early finite-level derived duality and pairings
- CompletedCohomologyPartII:CC.7: imports these finite-level pairings before passing to limits

**Acceptance properties.**

- For a modular curve over a field k: H^1_c × H^1 → k is perfect, and H^0 × H^2_c → k.
- On ∂X̄_K for a cusp circle, H^0 × H^1 → k is perfect.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/corner-boundary-bridge`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Source passages.** [nt16], §4, proof of Lemma 4.1, p. 54: The pairing and its Hecke property.

### Theorem: Hecke adjoints: inverse double cosets and restriction/corestriction

**Identifier:** `ALS.5:finite-level-duality/hecke-adjoint-duality`.

Under verdier-poincare-duality the transpose of the operator [Kg⁻¹K] on RHom_R(RΓ_c(X_K, V), R) corresponds to [KgK] on RΓ(X_K, V^∨ ⊗ o_K) for g ∈ G^S, i.e. ⟨x, [KgK]y⟩ = ⟨[Kg⁻¹K]x, y⟩ (the orientation character contributes nothing because g ∈ G^S acts on 𝔛_G through G(A^∞) and the orientation of X^G is untouched); equivalently, the duality is equivariant when H(G^S, K^S) acts on the left through the anti-involution ι([KgK]) = [Kg⁻¹K]. Restriction and corestriction are adjoint: ⟨π^*x, y⟩ = ⟨x, π_*y⟩. For GL_n with K_v = GL_n(O_{F_v}), T_v^i acting on H^* corresponds to T_v^{n−i}(T_v^n)⁻¹ on H^*_c, and ι descends to an isomorphism T^S(RΓ_c(X_K, V)) ≅ T^S(RΓ(X_K, V^∨ ⊗ o_K)) with 𝔪 ↦ 𝔪^∨ = ι(𝔪). On transported P-spaces the same adjoint argument pairs compact and ordinary dual-coefficient cohomology with o_{P,g}; rational component maps pull back the local orientation sheaf, and the finite adelic correspondence preserves its archimedean factor.

**Hypotheses.** K neat g ∈ G^S

**Construction or proof.**

1. The correspondence for [KgK] is (p_1, p_2) through K ∩ gKg⁻¹ (ALS.3/hecke-operator-formula); its transpose under duality is the correspondence with p_1 and p_2 interchanged, i.e. [Kg⁻¹K], because pullback and trace are adjoint for finite coverings (duality-pairings).
2. Orientation: right translation by g ∈ G(A^∞) does not act on the X^G factor, so the orientation system pulls back identically.
3. GL_n: K diag(ϖ, …, ϖ, 1, …, 1) K inverted is K diag(1, …, 1, ϖ⁻¹, …, ϖ⁻¹) K = (T_v^n)⁻¹T_v^{n−i}.
4. Descent to Hecke algebras: the kernels correspond under ι (ACC+ Corollary 2.2.22).

**Acceptance properties.**

- For GL_2: T_v on H^* is dual to T_v S_v⁻¹ on H^*_c, S_v = T_v^2.
- For g ∈ K, both sides are the identity.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/duality-pairings`; `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula`; `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`; `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra`.

**Source passages.** [nt16], §3.1, Proposition 3.7(3), p. 48: The adjoint formula. [acc23], §2.2.20, Corollary 2.2.22, p. 932: The descended isomorphism of Hecke algebras. [nt16], §4, proof of Lemma 4.1, p. 54: The GL_n formula.

### Theorem: Duality, the boundary triangle and coefficient change

**Identifier:** `ALS.5:finite-level-duality/duality-triangle-compatibility`.

For neat K write C_c(V)→C(V)→B(V)→C_c(V)[1] for the boundary triangle and D=RHom_R(−,R). Contravariant duality gives D B(V)→D C(V)→D C_c(V)→D B(V)[1]. Early duality identifies these terms with B(V^∨⊗o)[d−1]→C_c(V^∨⊗o)[d]→C(V^∨⊗o)[d]→B(V^∨⊗o)[d]. This is the inverse rotation of the shifted boundary triangle, with the negative rotated connecting arrow prescribed by the triangulated-category sign convention. It is Hecke-equivariant after applying the inverse-double-coset anti-involution ι on the dual side. For perfect complexes it commutes with derived coefficient change and with localization, exchanging 𝔪 and 𝔪^∨; in particular D(C_c(V)_𝔪)≅C(V^∨⊗o)_{𝔪^∨}[d].

**Hypotheses.** K neat R noetherian

**Construction or proof.**

1. Apply Verdier duality to j_!j^*→id→i_*i^*. Contravariance reverses the triangle. Insert the d-dimensional interior and (d−1)-dimensional boundary identifications, then inverse-rotate the shifted boundary triangle; its first arrow is the negative shifted connecting arrow. Do not identify the reversed dual triangle termwise with the unrotated original ordering.
2. Coefficient change: both sides commute with ⊗^L R′ (perfectness, ALS.1/coefficient-change) and RHom_R(C, R) ⊗^L R′ ≅ RHom_{R′}(C ⊗^L R′, R′) for perfect C.
3. Localization: the duality is T^S-equivariant through ι, so e_𝔪 corresponds to e_{𝔪^∨}.

**Acceptance properties.**

- For a modular curve the dual of the boundary sequence H^0 → H^0(∂) → H^1_c is H^1 → H^1(∂) → H^2_c.
- For G anisotropic the triangle degenerates and the statement is ordinary Poincaré duality.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`; `ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal`; `ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change`.

**Source passages.** [nt16], §3.1, Proposition 3.7(2), p. 48: Coefficient change on both sides of the duality. [acc23], §2.2.20, p. 932: Duality interchanges 𝔪 and 𝔪^∨.

### Theorem: Duality at non-neat level: stabilizer hypotheses

**Identifier:** `ALS.5:finite-level-duality/non-neat-duality`.

Let K be arbitrary and K′ ⊂ K normal, neat and of finite index, with K′^S = K^S. The equivariant complex RΓ_{K/K′}(X_{K′},V) is perfect over R after forgetting the finite-group action; it is not generally perfect over R[K/K′] unless the full K-action is free (e.g. K neat). Derived finite-group invariants compute orbifold RΓ(X_K,V). If |K/K′| is invertible in R, averaging makes this a direct summand of the finite projective R-complex at K′, and yields finite-level duality RHom_R(RΓ_c(X_K,V),R) ≅ RΓ(X_K,V^∨ ⊗ o_K)[d], Hecke-equivariantly, for the corresponding groupoid support model. Invertibility of |K/K′| is sufficient and is not equivalent to invertibility of all stabilizer orders. Without such a hypothesis orbifold cohomology can be unbounded. Use the compactified equivariant support model of betti-complexes. A point with stabilizer C_p over F_p gives H^*(C_p,F_p) in arbitrarily high degrees, testing the omitted modular averaging hypothesis.

**Hypotheses.** K′ ⊂ K normal and neat |K/K′| invertible in R for the duality

**Construction or proof.**

1. With |K/K′| invertible, RΓ(K/K′, −) = (−)^{K/K′} is exact and splits off by the idempotent |K/K′|⁻¹Σ_k k; it preserves perfect complexes.
2. Duality at K′ (verdier-poincare-duality) is K/K′-equivariant (the K/K′-action is by deck transformations, which act on o_{K′} through ε); take invariants on both sides, using that invariants and coinvariants agree.
3. Counterexample without invertibility: SL_2(ℤ) has H^{2j}(SL_2(ℤ), ℤ) = ℤ/12 for all j ≥ 1 (ALS.1/group-cohomology-comparison), unbounded, so RΓ(X_K, ℤ) is not perfect and no finite-dimensional duality holds.

**Acceptance properties.**

- For SL_2(ℤ) and R = ℤ[1/6]: RΓ(X_K, R) = R[0] and RΓ_c(X_K, R) = R[−2], dual with d = 2.
- For R = F_2 or F_3 at level SL_2(Ẑ) the cohomology is unbounded.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`; `ArithmeticLocallySymmetricSpaces:ALS.1/group-cohomology-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`; `EnhancedDerivedSheaves:E1`.

**Source passages.** [acc23], §2.1.2, Lemma 2.1.7, p. 912: ACC+ requires good full K and good K′ for group-ring perfectness. Only underlying R-perfectness is claimed when full K is not neat; averaging after inverting the quotient order yields duality. [cg20], §3.1, proof of Lemma 3.1 (appendix): Passing to non-neat level after inverting the index.

## ALS.5. Characteristic-zero and automorphic comparison

Use m_G=g_C/a_G and the function central character inverse to the coefficient central character. The arithmetic de Rham comparison turns forms into relative Lie cochains; AS.5 supplies Franke and AS.4 the cuspidal spectral summand. The injection and interior map are actual geometric comparisons. AF.4 and the appropriate GL/unitary Galois systems supply the characteristic-zero applications, with the CM, imaginary-quadratic, weight and residual-block hypotheses stated in full.

**Planets:** Betti–de Rham–relative Lie algebra comparison; Franke's automorphic comparison; Cuspidal cohomology; Cuspidal degree range at non-Eisenstein ideals.

**Coverage:** planned. Remaining closure: Resolve the exact inputs recorded in Linear local-system descent and derived sheaf/cochain comparison. Resolve the exact inputs recorded in Typed automorphic and Galois comparison interfaces. Resolve the exact inputs recorded in Stage order for geometry, supports, duality and automorphic applications. Resolve the exact inputs recorded in Suggested signatures: ALS.5.

### Theorem: The early finite-level duality as an input to the characteristic-zero comparison

**Identifier:** `ALS.5/early-duality-reexport`.

The characteristic-zero comparisons of ALS.5 are compatible with the early structures: for neat K and a finite-dimensional complex algebraic representation V of 𝐆, (i) the de Rham isomorphism of de-rham-comparison carries the cup-product pairing of ALS.5:finite-level-duality/duality-pairings on H^*_c × H^{d−*} to the pairing (α, β) ↦ ∫_{X_K} α ∧ β of compactly supported and arbitrary closed forms (with the evaluation V ⊗ V^∨ → ℂ and the orientation twist), (ii) pullbacks and traces along level maps correspond to pullback and fibre-integration of forms, and (iii) Hecke operators correspond to the correspondence action on forms. No new duality is constructed here: the duality, pairings and adjoints are those of ALS.5:finite-level-duality.

**Hypotheses.** K neat V a finite-dimensional complex representation of 𝐆

**Construction or proof.**

1. The de Rham isomorphism is multiplicative (wedge product ↔ cup product) and the fundamental class of o_K corresponds to integration of top forms twisted by o_K.
2. Level maps: pullback of forms and fibre integration along finite coverings correspond to π^* and π_*; Hecke correspondences are composites of these (ALS.3/hecke-operator-formula).

**Acceptance properties.**

- For a modular curve, ⟨α, β⟩ = ∫ α ∧ β on H^1_c × H^1 of weight-two forms.
- For compact X_K this is classical Poincaré duality of de Rham cohomology.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/duality-pairings`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality`; `ArithmeticLocallySymmetricSpaces:ALS.5/de-rham-comparison`.

**Source passages.** [acc23], §2.2.20, Proposition 2.2.21, p. 932: The integral duality which the characteristic-zero comparison must respect. [franke], Abstract: The comparisons to which the early structures are transported.

### Theorem: Betti, de Rham and relative Lie algebra cohomology in characteristic zero

**Identifier:** `ALS.5/de-rham-comparison`.

Let 𝔞_G = Lie(A_∞)⊗ℝℂ and 𝔪_G = Lie(G(F_∞))⊗ℝℂ / 𝔞_G. Use the central-character-twisted function space whose diagonal A_∞ action with V is trivial, so the coefficient module descends to 𝔪_G. Let K be neat and V a finite-dimensional complex (or real) algebraic representation of 𝐆 = Res_{F/ℚ}G, with associated flat bundle 𝒱 on X_K. Then there are natural isomorphisms H^*(X_K, V) ≅ H^*_{dR}(X_K, 𝒱) ≅ H^*(Ω^•(X^G × G(A^∞)/K, V)^{G(F)}) ≅ H^*(𝔪_G, K_∞; C^∞(G(F)\G(A_F)/K) ⊗ V) (with A_∞ acting on C^∞ through the central character twist making the A_∞-action compatible), Hecke-equivariant for H(G^S, K^S), compatible with level maps, and similarly H^*_c(X_K, V) with compactly supported forms. The last isomorphism identifies G(F)-invariant V-valued forms on X^G × G(A^∞)/K with (𝔪_G, K_∞)-cochains Hom_{K_∞}(∧^•(𝔤/(𝔨 + 𝔞_G)), C^∞ ⊗ V) (AutomorphicFormsOnReductiveGroups AF.1a/invariant-forms-complex and relative-lie-cochain-complex). This is the topological-to-smooth comparison that AutomorphicSpectralTheory AS.5 assigns to this roadmap.

**Hypotheses.** K neat V finite-dimensional complex algebraic representation

**Construction or proof.**

1. de Rham theorem with local coefficients on the manifold X_K: the complex of 𝒱-valued forms is a fine resolution of the locally constant sheaf V_K (Poincaré lemma), compared with singular cochains by ALS.1/sheaf-singular-comparison.
2. Forms on X_K = G(F)-invariant forms on X^G × G(A^∞)/K; trivialise the bundle over X^G using the G(F_∞)-action on V and identify invariant forms on G(F_∞)/K_∞A_∞ with Hom_{K_∞}(∧^•𝔭/𝔞, −) (AF.1a/invariant-forms-complex).
3. Hecke equivariance: correspondences act on forms by pullback and fibre integration, matching ALS.3/hecke-operator-formula.

**Acceptance properties.**

- On a connected SL₂ modular component and V=Sym^k ℂ², the comparison computes H¹ by V-valued differential forms; its cuspidal subspace is the holomorphic/antiholomorphic Eichler–Shimura pair and ordinary cohomology also has its Eisenstein part. For the full GL₂ quotient keep the real-component and central-character invariants.
- For G anisotropic and V = ℂ, H^*(X_K, ℂ) = H^*(𝔪_G, K_∞; C^∞(G(F)\G(A)/K)).

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system`; `ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold`; `AutomorphicFormsOnReductiveGroups:AF.1a/invariant-forms-complex`; `AutomorphicFormsOnReductiveGroups:AF.1a/relative-lie-cochain-complex`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

**Source passages.** [franke], Introduction and §7.4: Franke's result presupposes the comparison H^*(X_K, V) = H^*(𝔤, K; C^∞ ⊗ V), which is this node. [cg20], §3.1, proof of Lemma 3.1 (appendix): The use of the comparison in the applications.

### Theorem: Franke's comparison with automorphic forms

**Identifier:** `ALS.5/automorphic-comparison`.

Use 𝔪_G and the central-character convention of de-rham-comparison, with the split-centre directions removed. For K neat and V a finite-dimensional complex algebraic representation, the inclusion of the space 𝒜(G)^K of K-invariant automorphic forms (with the central twist fixed by V) into C^∞(G(F)\G(A_F)/K) induces an isomorphism H^*(𝔪_G, K_∞; 𝒜(G)^K ⊗ V) ≅ H^*(𝔪_G, K_∞; C^∞ ⊗ V), hence H^*(X_K, V) ≅ H^*(𝔪_G, K_∞; 𝒜(G)^K ⊗ V), Hecke-equivariantly. Franke's filtration of 𝒜(G) by cuspidal support gives a decomposition H^*(X_K, V) = ⊕_{{P}} H^*_{{P}}(X_K, V) over associate classes of parabolics, with the summand of {G} the cuspidal cohomology. The comparison of ordinary cohomology with automorphic forms is supplied by AutomorphicSpectralTheory AS.5; this node records its consequence for X_K.

**Hypotheses.** K neat V finite-dimensional complex algebraic representation

**Construction or proof.**

1. de-rham-comparison reduces H^*(X_K, V) to (𝔪_G, K_∞)-cohomology of smooth functions.
2. Franke's Theorem 18 (supplied by AutomorphicSpectralTheory AS.5) replaces smooth functions by automorphic forms; his spectral sequence and the cuspidal-support decomposition give the summands.

**Acceptance properties.**

- For G anisotropic modulo centre there are no proper rational parabolics, so all automorphic forms with the prescribed central character are cuspidal and the cohomological comparison yields the Matsushima decomposition. Automorphic forms are also Z(𝔤)-finite; they are not identified with all K_∞-finite smooth functions.
- For GL_{2,ℚ}, the {B}-summand of H^1(X_K, ℂ) is the Eisenstein cohomology spanned by Eisenstein series classes.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.5/de-rham-comparison`; `AutomorphicSpectralTheory:AS.5/franke-comparison`; `AutomorphicSpectralTheory:AS.5/franke-schwermer-support`.

**Source passages.** [franke], §7.4, Theorem 18: Franke's Theorem 18; the elided display is the chain of inclusions of automorphic forms into functions of uniform moderate growth into smooth functions. [acc23], §2.4.9, proof of Theorem 2.4.10, p. 949: The use of the comparison after localization.

### Definition: Cuspidal cohomology

**Identifier:** `ALS.5/cuspidal-cohomology`.

Use 𝔪_G and the central-character convention of de-rham-comparison, with the split-centre directions removed. For K neat and V a finite-dimensional complex algebraic representation of 𝐆, H^*_cusp(X_K, V) := ⊕_π m(π) H^*(𝔪_G, K_∞; π_∞ ⊗ V) ⊗ (π^∞)^K, the sum over cuspidal automorphic representations π of G(A_F) with central character on A_∞ inverse to that of V, m(π) the cuspidal multiplicity. The inclusion of cusp forms into automorphic forms induces an injective, Hecke-equivariant map H^*_cusp(X_K, V) → H^*(X_K, V) (Borel), whose image lies in the interior cohomology H^*_! = im(H^*_c → H^*); it is the {G}-summand of Franke's decomposition (automorphic-comparison).

**Hypotheses.** K neat

**Construction or proof.**

1. Cusp forms are rapidly decreasing, so cuspidal classes have compactly supported representatives up to exact forms: the map factors through H^*_c, giving image in H^*_!.
2. Injectivity: Borel's theorem that cuspidal cohomology injects (harmonic representatives; supplied with AS.5's spectral input).
3. Decomposition of the cuspidal spectrum into irreducibles with finite multiplicities (AutomorphicFormsOnReductiveGroups AF.3/cuspidal-spectrum-discrete) gives the direct sum.

**API.**

- `LocallySymmetric.cuspidalCohomology` (data): H^*_cusp(X_K, V) as a Hecke-module with its map to H^*(X_K, V).
- `LocallySymmetric.cuspidalCohomology_injective` (characterisation): The map H^*_cusp(X_K, V) → H^*(X_K, V) is injective and Hecke-equivariant.
- `LocallySymmetric.cuspidalCohomology_le_interior` (relation): Its image lies in the interior cohomology im(H^*_c(X_K, V) → H^*(X_K, V)).
- `LocallySymmetric.cuspidalCohomology_decomp` (characterisation): H^*_cusp(X_K, V) = ⊕_π m(π)H^*(𝔪_G, K_∞; π_∞ ⊗ V) ⊗ (π^∞)^K.
- `LocallySymmetric.cuspidalCohomology_eq_franke` (compatibility): H^*_cusp is the {G}-summand of Franke's decomposition (automorphic-comparison).

**Unit tests.**

- `cuspidal_GL2_weight2` (computation): For the connected SL₂ component Γ₁(N)\ℍ with N≥5, constant ℂ coefficients and genus g, dim H¹_cusp=2 dim S₂(Γ₁(N))=2g. For a full GL₂ adelic quotient the real-component/central-character invariants must also be included; no unconditional componentwise GL₂ two-dimensional formula is asserted.
- `cuspidal_torus` (degenerate): For G a torus, H^*_cusp(X_K, V) = H^*(X_K, V).
- `cuspidal_le_interior` (characterisation): Cuspidal cohomology maps into interior cohomology; for the connected modular curve Γ₁(N)\ℍ with constant ℂ coefficients, both degree-one images have dimension 2g.
- `cuspidal_ne_ordinary` (non-example): For Γ₁(5)\ℍ (genus zero, four cusps), H¹_cusp=H¹_!=0 but H¹(X,ℂ)=ℂ³. This disproves a definition of cuspidal cohomology as all ordinary cohomology. No strict interior-inclusion claim is made using Saito–Kurokawa lifts, which are cuspidal CAP forms.

**Consumers.**

- ACC+ Theorem 2.4.10(2): after localization at a non-Eisenstein 𝔪 only cuspidal cohomology survives
- Scholze Corollary V.4.2: a regular L-algebraic cuspidal π contributes to H^*(X̃_K, M_ξ)
- AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality: rationality of cuspidal cohomology

**Acceptance properties.**

- For the connected SL₂ component Γ₁(N)\ℍ, N≥5, and V=Sym^k ℂ², cuspidal H¹ is the weight-(k+2) holomorphic/antiholomorphic Eichler–Shimura pair. A full GL₂ quotient also imposes the real-component and central-character invariants.
- For a torus, every automorphic representation is cuspidal and H^*_cusp = H^*.
- On the genus-zero four-cusp connected modular curve, cuspidal/interior degree one is zero but ordinary degree one has rank three; CAP does not mean noncuspidal.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.5/automorphic-comparison`; `AutomorphicSpectralTheory:AS.5/franke-comparison`; `AutomorphicSpectralTheory:AS.5/franke-schwermer-support`; `AutomorphicFormsOnReductiveGroups:AF.1a/relative-lie-cochain-complex`; `AutomorphicFormsOnReductiveGroups:AF.3/cuspidal-spectrum-discrete`.

**Source passages.** [acc23], §2.4.9, proof of Theorem 2.4.10, p. 949: Cuspidal cohomology as the {G}-summand of Franke's decomposition, with its formula as a sum over cuspidal π. [franke], §7.4, after Theorem 18: The decomposition by Levi components.

### Theorem: Regular algebraic cuspidal representations of GL_n contribute to cohomology

**Identifier:** `ALS.5/clozel-cohomological-gln`.

Let F be totally real or CM and π a cuspidal automorphic representation of GL_n(A_F) with π_∞ regular L-algebraic, unramified outside S. Then π′ = π|·|^{(n+1)/2} is regular C-algebraic, i.e. cohomological: there is an algebraic representation ξ of Res_{F/ℚ}GL_n over ℂ ≅ Q̄_p (extending to Res_{O_F/ℤ}GL_n over Z̄_p) such that π′ occurs (its Hecke eigensystem away from S appears) in H^i(X̃_K, M_{ξ,K}) ⊗_{Z̄_p} ℂ for some sufficiently small K = K_SK^S and some i, where X̃_K = GL_n(F)\[(GL_n(F⊗ℝ)/ℝ_{>0}K_∞°) × GL_n(A_{F,f})/K] (equal to X_K for F CM, a (ℤ/2)^{[F:ℚ]}-cover for F totally real); after choosing a quadratic character η : A_F^×/F^× → {±1} with prescribed archimedean components, π′ ⊗ (η∘det) occurs in H^i(X_K, M_{ξ,K}) ⊗ ℂ.

**Hypotheses.** F totally real or CM π cuspidal with π_∞ regular L-algebraic

**Construction or proof.**

1. Regular C-algebraic cuspidal π′ has π′_∞ with the infinitesimal character of ξ^∨ for an algebraic ξ (AutomorphicFormsOnReductiveGroups AF.4); Clozel (Lemme 3.14) shows H^*(𝔤, K_∞°; π′_∞ ⊗ ξ) ≠ 0 for tempered such π′_∞ (cuspidal generic representations of GL_n are tempered at ∞ up to twist in the needed sense).
2. By cuspidal-cohomology the eigensystem of π′ occurs in H^*_cusp(X̃_K, ξ) ⊂ H^*(X̃_K, ξ) for K small enough that (π′^∞)^K ≠ 0.
3. Passing from X̃_K to X_K: K_∞/K_∞° ≅ (ℤ/2)^{r_1}-isotypic decomposition; twisting by a quadratic character with prescribed signs moves the eigensystem into the trivial isotypic part.

**Acceptance properties.**

- n = 1: an algebraic Hecke character contributes to H^0(X_K, ξ).
- n = 2, F = ℚ: a weight-k eigenform contributes to H^1(X_K, Sym^{k−2}) (Eichler–Shimura).

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.5/cuspidal-cohomology`; `ArithmeticLocallySymmetricSpaces:ALS.5/automorphic-comparison`; `AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight`; `AutomorphicFormsOnReductiveGroups:AF.4/c-l-algebraic`; `AutomorphicFormsOnReductiveGroups:AF.4/cohomological-representation`; `ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space`.

**Source passages.** [sch15], §V.4, proof of Corollary V.4.2 (Annals Corollary 5.4.2): Clozel's result as used by Scholze. [sch15], §V.4, proof of Corollary V.4.2: The comparison of X̃_K and X_K.

### Theorem: Rational cohomology localized at a non-Eisenstein ideal is cuspidal and lives in [q₀, q₀ + l₀]

**Identifier:** `ALS.5/non-eisenstein-degree-range`.

Let F be an imaginary CM field with maximal totally real subfield F⁺, fix ι : Q̄_p ≅ ℂ, let q₀ = [F⁺ : ℚ]n(n−1)/2 and l₀ = [F⁺ : ℚ]n − 1, K ⊂ GL_n(A_F^∞) good and V_λ the O-lattice of highest weight λ. (1) If π is cuspidal regular algebraic of weight ιλ with (π^∞)^K ≠ 0, the Hecke eigensystem of (ι⁻¹π^∞)^K factors through T^S → T^S(K, λ). (2) If 𝔪 ⊂ T^S(K, V_λ) is a maximal ideal with ρ̄_𝔪 (assumed to exist, i.e. RΓ(X_K, V_λ) of S-Galois type) absolutely irreducible, then H^j(X_K, V_λ)_𝔪[1/p] ≠ 0 only for j ∈ [q₀, q₀ + l₀], and if one of these groups is nonzero all are; and every homomorphism f : T^S(K, V_λ)_𝔪 → Q̄_p is the eigensystem of (ι⁻¹π^∞)^K for a cuspidal regular algebraic π of weight ιλ, with r_ι(π) residually ≅ ρ̄_𝔪.

**Hypotheses.** F imaginary CM K good RΓ(X_K, V_λ) of S-Galois type with ρ̄_𝔪 absolutely irreducible

**Construction or proof.**

1. By automorphic-comparison H^*(X_K, V_ιλ) decomposes over cuspidal supports; for a proper {P} the summand is built from cuspidal representations of Levi factors ∏GL_{n_i}, whose Galois representations (AutomorphicGaloisRepresentationsPartII AG2.4) give a reducible r_ι, so the summand vanishes at 𝔪 with ρ̄_𝔪 irreducible.
2. For the cuspidal summand, H^*(𝔪_G, K_∞; π_∞ ⊗ V_ιλ) = 0 unless π is regular algebraic of weight ιλ (Borel–Wallach II Prop. 3.1), and it is nonzero exactly in degrees [q₀, q₀ + l₀] (Clozel Lemme 3.14; Künneth over the [F⁺:ℚ] complex places, with an abelian factor of dimension [F⁺:ℚ] − 1 from the centre), giving l₀ = (n−1)[F⁺:ℚ] + [F⁺:ℚ] − 1.
3. Part (1): the eigenvector in H^*_cusp(X_K, V_ιλ) (cuspidal-cohomology).

**Acceptance properties.**

- n = 1: q₀ = 0, l₀ = [F⁺:ℚ] − 1, the dimension of the unit-rank torus X_K components.
- n = 2, F imaginary quadratic: [q₀, q₀ + l₀] = [1, 2], the cuspidal range of Bianchi threefolds.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.5/automorphic-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.5/cuspidal-cohomology`; `ArithmeticLocallySymmetricSpaces:ALS.4/eisenstein-maximal-ideal`; `ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal`; `AutomorphicGaloisRepresentationsPartII:AG2.4`; `AutomorphicFormsOnReductiveGroups:AF.4/algebraic-weight`; `AutomorphicFormsOnReductiveGroups:AF.4/c-l-algebraic`; `AutomorphicFormsOnReductiveGroups:AF.4/cohomological-representation`; `AutomorphicFormsOnReductiveGroups:AF.4/borel-wallach-tempered-range`.

**Source passages.** [acc23], §2.4.9, Theorem 2.4.10(2), p. 948: Part (2), first half. [acc23], §2.4.9, Theorem 2.4.10(2), p. 948: Part (2), second half.

### Theorem: Middle-degree rational cohomology of U(n, n) at 𝔪̃ is semisimple and cuspidal

**Identifier:** `ALS.5/unitary-middle-degree`.

Let F be CM containing an imaginary quadratic field, G̃ = U(n, n) over F⁺, ρ half the sum of the positive roots of Res_{F⁺/ℚ}G̃ (an element of X^*(Res_{F⁺/ℚ}T) ⊗ ℚ, T ⊂ G̃ the diagonal torus; ρ is generally half-integral, while w(λ̃+ρ)−ρ is integral), ι : Q̄_p ≅ ℂ, and λ̃ ∈ (ℤ^{2n}_+)^{Hom(F⁺,E)} such that for every w ∈ W^P (Kostant representatives for the Siegel parabolic) there is no cuspidal automorphic representation of GL_n(A_F) of weight ιλ_w, λ_w = w(λ̃ + ρ) − ρ viewed as a GL_n/F weight through the Siegel-Levi identification Res_{F/ℚ}GL_n ⊂ Res_{F⁺/ℚ}G̃ (the corresponding torus character lattices identify (ℤ^{2n})^{Hom(F⁺,E)} with (ℤ^n)^{Hom(F,E)}). Let 𝔪̃ ⊂ T̃^S be a maximal ideal in the support of H^*(X̃_{K̃}, Ṽ_λ̃) such that ρ̄_𝔪̃ is a direct sum of two n-dimensional absolutely irreducible representations of G_F, S satisfying the conditions of ACC+ Theorem 2.3.8, and d = ½ dim_ℝ X̃ = n²[F⁺ : ℚ]. Then H^d(X̃_{K̃}, Ṽ_λ̃)_𝔪̃[1/p] is a semisimple T̃^S[1/p]-module, and every homomorphism T̃^S(H^d(X̃_{K̃}, Ṽ_λ̃)_𝔪̃) → Q̄_p is the eigensystem of (ι⁻¹π̃^∞)^{K̃} for a cuspidal regular algebraic π̃ of G̃(A_{F⁺}) of weight ιλ̃.

**Hypotheses.** F CM containing an imaginary quadratic field the weight condition on λ_w ρ̄_𝔪̃ a sum of two n-dimensional absolutely irreducibles

**Construction or proof.**

1. Franke decomposition for Res_{F⁺/ℚ}G̃ (no central twist since it has no rational characters); the Siegel class {P} contributes through the Kostant Lie-cohomology constituents in boundary-stratum-cohomology-formula (not the GL_N/totally-real split-cohomology specialization) cuspidal representations of GL_n of weight ιλ_w, excluded by hypothesis.
2. Other proper P̃ have Levi ∏Res_{F/F⁺}GL_{n_i} × U(n − s, n − s) with s = n_1 + … + n_r (PAPER-ALLEN-ETAL-23/E22 corrects the printed partition), whose Galois representations have at least three constituents unless (r, s) ∈ {(1, n), (0, 0)}, contradicting ρ̄_𝔪̃ = two n-dimensional irreducibles; Galois representations for U(m, m) need F to contain an imaginary quadratic field (PAPER-ALLEN-ETAL-23/E23). Import the degree-2m unitary discrete-parameter Galois system at good primes from AG2.2 and its removal of parity/Shin-regularity auxiliary restrictions from AG2.3, with the exact ACC+ Theorem 2.3.3 hypotheses and twists. The requested residual-polynomial comparison must force the displayed constituent contradiction; AG2.4’s nonselfdual GL_m construction alone does not supply it.
3. The cuspidal summand is semisimple (unitarity) and in degree d consists of cuspidal regular algebraic π̃.

**Acceptance properties.**

- n = 1: G̃ = U(1,1), d = [F⁺:ℚ], middle degree of a product of hyperbolic planes-type quotients.
- If ρ̄_𝔪̃ has three constituents the conclusion can fail (Eisenstein contributions).

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.5/automorphic-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.5/cuspidal-cohomology`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-cohomology-formula`; `ArithmeticLocallySymmetricSpaces:ALS.4/siegel-stratum-localization`; `AutomorphicGaloisRepresentationsPartII:AG2.2`; `AutomorphicGaloisRepresentationsPartII:AG2.3`.

**Source passages.** [acc23], §2.4.9, Theorem 2.4.11, p. 951: The statement begins (ρ printed in X^*(Res T_n); read X^*(Res T), PAPER-ALLEN-ETAL-23/E21). The printed integral-lattice membership of ρ is corrected by PAPER-ALLEN-ETAL-23/E21 and RT-PAPER-ALLEN-ETAL-23/52: ρ belongs to X^*⊗ℚ. [acc23], §2.4.9, proof of Theorem 2.4.11, p. 951: Method.

## ALS.6. Finite-level descent and finite-cover tests

For a normal finite-index inclusion of levels retain the residual finite quotient action before deriving invariants. Common neat refinements give associative ordinary, supported and boundary descent. The finite-cover Hochschild–Serre sequence includes its edge and transfer maps; its lowest-degree p-group argument does not apply to an unrestricted Taylor–Wiles quotient. The acceptance examples distinguish whole adelic GL₂ covers from their determinant-one components and compactified from open modular curves.

**Planets:** Finite-level descent; Finite-cover Hochschild–Serre spectral sequence.

**Coverage:** planned. Remaining closure: Resolve the exact inputs recorded in Coherent equivariant supports, refinements and trace. Resolve the exact inputs recorded in Suggested signatures: ALS.6. Refine the finite-group descent/coherence lemmas when this target-level plan moves to lemma level. Level-system assembly and completed constructions are supplied by CC.0/CC.1/CC.2/CC.4/CC.7 to their own consumers under RS-09; they are outside ALS.6.

### Theorem: Finite-level descent along a normal inclusion of levels

**Identifier:** `ALS.6/finite-level-descent`.

Let K′⊲K compact open, differing only at places in S′, and V finite projective with the needed commuting coefficient actions. The relative compactified equivariant construction gives C_{K′/K}=RΓ_{K/K′}(X_{K′},V) in D(R[K/K′]), with a ring homomorphism H(G^{S∪S′},K^{S∪S′})⊗R→End_{D(R[K/K′])}(C_{K′/K}). There is a natural isomorphism RΓ(K/K′,C_{K′/K})≅RΓ(X_K,V) in D(R), intertwining all these Hecke operators; its forgetful image is RΓ(X_{K′},V). The same statements hold for compact support and boundary using betti-complexes, compatibly with their exact triangle. For K″⊂K′ with both K″ and K′ normal in K choose a common neat normal refinement inside K″: the two iterated derived-invariants identifications agree with direct K/K″ descent, including the relative residual actions. If full K is good neat, the free full-level finite cell model proves perfectness over R[K/K′] (R noetherian). If only K′ is neat, only underlying R-perfectness is asserted. The stronger strict D(H⊗R[K/K′]) lift is an explicit enhancement request. This node exports finite-level descent and refinement maps; assembly into level systems is CC.0/CC.1, not a target of ALS.6.

**Hypotheses.** K′ ⊲ K, equal away from a finite set S′ K neat for group-ring perfectness; K′ neat suffices for perfectness over R after forgetting the action

**Construction or proof.**

1. Choose a common neat normal K₀ and derive the invariants functors on equivariant injective resolutions. For K₀⊂K′⊂K, the composition of K′/K₀ and K/K′ derived invariants equals K/K₀ derived invariants because equivariant injectives are acyclic for the composite. This is a derived comparison, not an assertion that a derived functor preserves injective objects.
2. Hecke operators outside S∪S′ commute with the residual quotient action; apply the ACC+ (2.1.5)–(2.1.6) homomorphisms in End_D(R[K/K′]). Coherent strictification is a separate requested enhancement.
3. Apply the same comparison to the equivariant j_! and boundary objects; RΓ of finite-group invariants is triangulated even when unbounded. A common refinement proves the associativity/cocycle of the descent comparisons.
4. Group-ring perfectness uses freeness of the full level K on cells (ACC+ Lemma 2.1.7 with both levels good). A neat K′ over a non-neat K gives only a finite perfect underlying R-complex; the modular stabilizer example excludes the stronger conclusion.

**Acceptance properties.**

- K′ = K: RΓ_{K/K} = RΓ(X_K, V).
- For K/K′ of order invertible in R, RΓ(X_K, V) = RΓ(X_{K′}, V)^{K/K′}.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`; `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`; `EnhancedDerivedSheaves:E1`.

**Source passages.** [acc23], §2.1.2, (2.1.5)–(2.1.6), pp. 911–912: The descent statement with Hecke action. [acc23], §2.1.2, Lemma 2.1.7, p. 912: Both full K and refined K′ are good in the source; full-level freeness is needed for group-ring perfectness.

### Theorem: The finite-cover Hochschild–Serre spectral sequence with Hecke action

**Identifier:** `ALS.6/finite-cover-hochschild-serre`.

In the situation of finite-level-descent there is a convergent first-quadrant spectral sequence E_2^{i,j} = H^i(K/K′, H^j(X_{K′}, V)) ⇒ H^{i+j}(X_K, V), natural in V, functorial for inclusions of such pairs, and equivariant for H(G^{S∪S′}, K^{S∪S′}) ⊗ R acting on both sides (Hecke operators at places where K and K′ agree); likewise for H^*_c and H^*(∂X̄), compatibly with the maps of the boundary triangle, and the edge maps are π^* (E_2^{0,j} ← H^j) and restriction/corestriction identities hold (res ∘ cor = Σ_{k∈K/K′} k, cor ∘ res = [K : K′]). At neat level it is the Cartan–Leray spectral sequence of the regular covering X_{K′} → X_K; at non-neat level K it computes the groupoid cohomology of X_K. If |K/K′| is invertible in R it degenerates: H^*(X_K, V) = H^*(X_{K′}, V)^{K/K′}.

**Hypotheses.** as in finite-level-descent

**Construction or proof.**

1. Apply the discrete finite-group derived-invariants/Cartan–Leray construction owned by AlgebraicTopology stage 5 to finite-level-descent. Its bounded-below cohomological filtration gives E₂^{i,j}=H^i(K/K′,H^j); the composite identifies with the target complex.
2. Hecke operators away from the changed level act by endomorphisms in D(R[K/K′]) and commute with finite-group descent. Naturality of the cohomological filtration gives their action on the spectral sequence. A simultaneous strict D(H⊗R[K/K′]) lift is the separately requested enhancement, not a consequence of these endomorphisms.
3. When |K/K′| is invertible in R, averaging makes finite-group invariants exact, so H^i(K/K′,M)=0 for i>0 and the edge comparison is an isomorphism.
4. The quotient K/K′ is finite and is treated as a discrete group. Every finite-domain cochain is continuous for this topology, so a continuous formulation requires only this direct identification. The discrete Γ_N extension of ALS.4 remains separate; no density comparison is invoked.

**Acceptance properties.**

- Y_1(Q) → Y_0(Q) with group Δ_Q: E_2^{i,j} = H^i(Δ_Q, H^j(Y_1(Q), V)).
- For K/K′ of order prime to p and V = O/ϖ^n, H^*(X_K) = H^*(X_{K′})^{K/K′}.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent`; `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`; `mathlib:groupCohomology`.

**Source passages.** [cg20], §3.1, proof of Theorem 3.2 (appendix A.4): The application to Y_1(Q) → Y_0(Q). [cg18], §9, Lemma 9.6, proof (arXiv v2): Degeneration for a quotient of order invertible in the coefficients (Φ an elementary 2-group, p odd).

### Theorem: The lowest nonvanishing localized degree descends along a p-group cover

**Identifier:** `ALS.6/lowest-degree-descent`.

Let K′ ⊂ K be as in finite-level-descent, k a field of characteristic p, V a k[G(F)×K_{S∪S′}]-module finite over k, and 𝔪 a maximal ideal of the Hecke algebra away from S ∪ S′ (and from the places where K′ ≠ K), possibly enlarged by operators U_x commuting with the K/K′-action. Let i be the least degree with H^i(X_{K′}, V)_𝔪 ≠ 0. If K/K′ is a p-group, or more generally K/K′ acts on H^i(X_{K′}, V)_𝔪 through a p-group quotient, then H^i(X_K, V)_𝔪 ≠ 0 and H^j(X_K, V)_𝔪 = 0 for j < i. In particular, for the Taylor–Wiles covers of standard-level-subgroups the statement applies to Y_Δ(Q) → Y_0(Q) for Δ the maximal p-power quotient of Δ_Q (not to Y_1(Q) → Y_0(Q) itself unless Δ_Q is a p-group or its prime-to-p part acts trivially after localization), as in the corrected form of CG20's argument (PAPER-CALEGARI-GERAGHTY-20/E142).

**Hypotheses.** k of characteristic p K/K′ acting on H^i(X_{K′}, V)_𝔪 through a p-group

**Construction or proof.**

1. Localize the Hochschild–Serre spectral sequence (finite-cover-hochschild-serre) at 𝔪 (localization is exact and Hecke-equivariant): E_2^{a,b} = H^a(K/K′, H^b(X_{K′}, V)_𝔪) vanishes for b < i.
2. Hence E_2^{0,i} = H^i(X_{K′}, V)_𝔪^{K/K′} survives to E_∞ (no differentials into or out of it land on nonzero terms) and H^j(X_K, V)_𝔪 = 0 for j < i.
3. A p-group acting on a nonzero finite-dimensional k-vector space in characteristic p has nonzero invariants; so E_2^{0,i} ≠ 0.

**Acceptance properties.**

- K/K′ = ℤ/p, V = F_p: the lowest localized degree is the same at both levels.
- Counterexample to the unrestricted statement: for K/K′ of order prime to p acting on H^i(X_{K′})_𝔪 through a nontrivial character, the invariants vanish and H^i(X_K)_𝔪 can be 0.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre`; `ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal`; `ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups`.

**Source passages.** [cg20], §3.1, proof of Theorem 3.2 (appendix A.4): The argument this node abstracts. [cg20], §3.1, Theorem 3.2 (appendix A.4): The application, whose proof needs the p-group subcover (E142).

### Theorem: Finite-cover acceptance tests for modular and compact quotients

**Identifier:** `ALS.6/tower-acceptance-tests`.

(i) Modular curves: for G = SL_{2,ℚ} (or GL_{2,ℚ}), N ≥ 3 and a prime p ∤ N, K′ = K(Np) ⊂ K = K(N) is normal with K/K′ ≅ SL_2(F_p) (resp. GL_2(F_p) on the whole adelic cover; determinant-one subgroups stabilize individual components); the finite-cover Hochschild–Serre spectral sequence for X_{K′} → X_K with ℚ-coefficients degenerates, H^1(X_K, ℚ) = H^1(X_{K′}, ℚ)^{K/K′}, compatibly with T_ℓ (ℓ ∤ Np), with H^1_c and with the boundary circles (cusps of X_{K′} over a cusp of X_K form a K/K′-set with stabilizers the upper unipotent subgroup); dim H^1 = 2g + c − 1 per component. (ii) Compact quotients: for G = D^×/ℚ^× with D an indefinite quaternion algebra over ℚ, ramified at a nonempty set of primes, every X_K is compact (no proper ℚ-parabolics), ∂X̄_K = ∅, RΓ_c = RΓ, and for neat K′ ⊲ K the spectral sequence of finite-cover-hochschild-serre with F_ℓ-coefficients, ℓ ∤ |K/K′|, degenerates to H^*(X_K, F_ℓ) = H^*(X_{K′}, F_ℓ)^{K/K′}, while for ℓ | |K/K′| nontrivial differentials and higher group cohomology can occur.

**Construction or proof.**

1. (i): K(N) is neat for N ≥ 3, K(Np) ⊲ K(N) with quotient the image of K(N) in GL_2(F_p) (SL_2(F_p) for SL_2); ℚ-coefficients make group cohomology of the finite quotient vanish in positive degrees, so the spectral sequence degenerates (finite-cover-hochschild-serre).
2. Hecke compatibility for ℓ ∤ Np and the boundary: finite-level-descent applied to RΓ_c and RΓ(∂X̄).
3. (ii): D^× has no proper ℚ-parabolics (D a division algebra), so the quotients are compact (AdelicAlgebraicGroups AA.3/arithmetic-quotient-compact) and the boundary is empty; degeneration for ℓ ∤ |K/K′|.

**Acceptance properties.**

- The compactified modular curve X(7) has genus 3 and 24 cusps; its open component Y(7) has dim H^1(Y(7),ℚ) = 2·3+24−1 = 29. For p∤7, H^1(Y(7),ℚ) ≅ H^1(Y(7p),ℚ)^{SL_2(F_p)} for the SL_2 tower.
- For D of discriminant 6, the Shimura curve X_K at maximal level has genus 0 and H^1(X_K, ℚ) = 0.

**Direct prerequisites.** `ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`; `ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification`; `ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition`; `AdelicAlgebraicGroups:AA.3/arithmetic-quotient-compact`; `mathlib:CongruenceSubgroup.Gamma0`; `mathlib:CongruenceSubgroup.Gamma1`; `mathlib:UpperHalfPlane`.

**Source passages.** [acc23], §2.1.2, (2.1.6), p. 912: Descent used in the tests. [nt16], §1, p. 1 (Introduction): The modular-curve test case.

## Supplier requests

Each request names the owning stage and the exact output consumed here. The generic construction is built in its owner; its arithmetic specialization is a target of this roadmap.

### tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology

Singular chains and relative singular chains with local coefficient systems (functors from the fundamental groupoid to modules), natural in the space and in the coefficient system, as stage 2 item 6 states; ALS uses them on X_K, X̄_K, ∂X̄_K and their strata.

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system`; `ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.1/level-pullback`; `ArithmeticLocallySymmetricSpaces:ALS.2/stratification-spectral-sequence`.

### tauceti:TauCetiRoadmap/AlgebraicTopology#stage-4-cw-pairs-cellular-homology-and-cofibrations

The natural cellular-to-singular comparison for finite (relative) CW complexes in the derived category, used for finite cochain models of X̄_K from an invariant triangulation (stage 4 item 3).

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`.

### tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent

Transfer on chains for finite coverings with p_* ∘ transfer = d and the regular-cover formula transfer ∘ p_* = Σ_{g} g_*, and the Cartan–Leray spectral sequence H_p(G; H_q(E)) ⇒ H_{p+q}(B) (stage 5 item 3), in the cohomological form with local coefficients.

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration`; `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`; `ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent`; `ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre`; `ArithmeticLocallySymmetricSpaces:ALS.4/levi-hochschild-serre`.

### tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality

Singular cochains with local coefficients, cup and cap products, the orientation local system with local orientation classes, and Poincaré–Lefschetz duality with local coefficients and orientation local system for compact topological manifolds with boundary (stage 6 items 1–4), for arbitrary noetherian coefficient rings.

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.0/orientation-local-system`; `ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.2/stratification-spectral-sequence`; `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-support-boundary-compatibility`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/corner-boundary-bridge`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/duality-pairings`; `ArithmeticLocallySymmetricSpaces:ALS.5/de-rham-comparison`.

### tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions

The Cartan decomposition K × 𝔭 ≅ G (diffeomorphism) for a real reductive group with maximal compact K and Cartan involution θ, applied to G(F_∞) with K_∞ = G(F_∞)^θ.

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.0/cartan-involution`; `ArithmeticLocallySymmetricSpaces:ALS.0/maximal-compact-subgroup`; `ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space-contractible`.

### tauceti:TauCetiRoadmap/GeometricTopology#layer-11-triangulations-pl-structures-and-collapse

Finite relative triangulation of a compact smooth manifold with boundary, including its boundary as a subcomplex, applied after Douady–Hérault rounding on the same underlying Borel–Serre pair. Pull back the base triangulation along the free finite/full-level action; an independently chosen equivariant triangulation of every level is not needed.

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`.

### SmoothRepresentationsOfLocalGroups:SR.0

Smooth G^S × K_S-representations over R and their derived category D⁺_sm, with U-invariants and its derived functor, as used in the topological set-up of Caraiani–Newton §2.1.

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.3/discrete-topological-comparison`.

### SmoothRepresentationsOfLocalGroups:SR.1

The identification of the ℤ-valued Hecke algebra H(G, U) of compactly supported U-biinvariant functions (convolution, Haar measure with vol(U) = 1) with the double-coset Hecke ring 𝕋(G, U, ℤ), compatibly with base change to R.

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-action-on-invariants`.

### SmoothRepresentationsOfLocalGroups:SR.2

Unnormalized parabolic induction Ind_P^G and the modulus character δ_P, with V = Ind_P^G W ⇒ V^U ≅ r_P^*(W^{U_P}) for G = P U, used to identify boundary strata Hecke-equivariantly (RT-AREA-automorphic-1/27).

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-cohomology-formula`.

### SmoothRepresentationsOfLocalGroups:SR.4

The integral unnormalized Satake transform at hyperspecial level and its relation S_norm = δ_P^{1/2}·S to the normalized transform, with the q-half twist recorded separately (RT-AREA-automorphic-1/27).

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`.

### ReductiveGroupsPartII:RG2.3

Iwahori and (1, n−1)-parahoric subgroups of GL_n(O_v) and PGL_n(O_v) as O_v-points of parahoric group schemes, and their pro-p radicals (pro-v Iwahori).

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups`.

### ReductiveGroupsPartII:RG2.4

The Iwahori decomposition U = U_N̄ U_M U_N of compact opens with respect to a parabolic and the positive elements Δ_M, used for r_P, r_M and the monoid Hecke algebras.

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`.

### AdditiveCombinatorics:AC.3

Compact nilmanifolds Γ\N for a lattice Γ in a simply connected nilpotent Lie group N (rational structure from Mal'cev bases), as the fibres of Borel–Serre boundary strata (RT-AREA-combinatorics/13: AC.3 owns nilmanifolds, ALS.2 imports the carrier).

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration`; `ArithmeticLocallySymmetricSpaces:ALS.4/nomizu-van-est`.

### AutomorphicFormsOnReductiveGroups:AF.1a

The full absolute algebraic Chevalley–Eilenberg complex C*(𝔫_E,V), differential and functorial coefficient/Levi action, in all degrees over a characteristic-zero field E; and Kostant’s theorem for a split reductive group over E, a compatible parabolic with Levi M and nilpotent radical 𝔫, and an irreducible algebraic coefficient V_λ of dominant integral highest weight: H^q(𝔫_E,V_λ)≅⊕_{w∈W^P,ℓ(w)=q}V^M_{w(λ+ρ)−ρ} as algebraic M-representations. For nonsplit input require a specified splitting extension and descent compatibility, not the same formula over an arbitrary field. AF.1a is the unique owner; AF.1 imports it. The existing relative complex over ℂ and Mathlib’s low-degree absolute maps do not yet supply this exact output, so this is a stage request, not an exact fulfilled theorem citation. ALS.4 owns the rational arithmetic-lattice Nomizu comparison and its transported-lattice Hecke application (RT-AREA-automorphic-1/6).

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.4/nomizu-van-est`, `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-cohomology-formula`.

### AutomorphicGaloisRepresentationsPartII:AG2.4

Galois representations r_ι(π) attached to cuspidal regular algebraic π of GL_m(A_F), m ≤ n, F CM (Harris–Lan–Taylor–Thorne), with local–global compatibility at unramified places, used to show Eisenstein summands are reducible.

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.5/non-eisenstein-degree-range`.

### EnhancedDerivedSheaves:E1

Unbounded enhanced derived categories of sheaves of R-modules on locally compact spaces, K-injective replacements, equivariant finite-group derived invariant sections, and natural open/closed j_!→id→i_* triangles. For a d-manifold and a locally constant perfect coefficient complex supply the Verdier comparison with dualizing complex o[d], including geometric evaluation and the adjoint relation for finite-cover pullback/trace; this applies also to each transported parabolic stratum. Supply residual quotient actions before forgetting them, refinement/coherent composition of derived invariants, support-preserving finite-cover restriction/corestriction and the resulting endomorphism Hecke actions. The strong D(H⊗R[Q]) lift requires an explicitly compatible derived Hecke-invariants enhancement; an action on isomorphism classes or on each H^i does not suffice.

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`; `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`; `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`; `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`; `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-support-boundary-compatibility`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/non-neat-duality`; `ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent`.

### AdelicAlgebraicGroups:AA.3/horospherical-decomposition

Extend the connected semisimple horospherical statement to the reductive restriction-of-scalars quotient G(F_∞)/K_∞A_∞, including disconnected real points and the relative split centres. The current supplier statement is narrower.

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.2/geodesic-action-boundary-face`; `ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration`.

### AutomorphicGaloisRepresentationsPartII:AG2.2

The characteristic-zero unitary discrete-parameter system of ACC+ Theorem 2.3.3: F CM containing an imaginary quadratic field, a cohomological cuspidal U(m,m) representation, degree-2m Galois system at good primes, constituent dimensions and the exact unnormalized Hecke-polynomial/algebraic twists. Include sums of discrete GL constituents and their semisimple reductions; the comparison must exclude at least three positive-dimensional blocks when the residual system is exactly two n-dimensional absolutely irreducible blocks.

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.5/unitary-middle-degree`.

### AutomorphicGaloisRepresentationsPartII:AG2.3

Remove parity/Shin-regularity auxiliary restrictions of the initial geometric unitary construction so that the AG2.2 good-prime system applies to all weights used in ACC+ Theorem 2.3.3 and the proper U(m,m) Levi factors in Theorem 2.4.11. Use the common determinant and specialization interface with the exact characteristic-zero and residual-polynomial comparison, not the later torsion Galois theorem.

Consumed by: `ArithmeticLocallySymmetricSpaces:ALS.5/unitary-middle-degree`.

## Closure obligations

These obligations are the precise remaining lists of the planned stages. Mathematical statements above retain the indicated hypotheses. An unavailable signature is represented by its named specification in the suggested-file catalogue; it is not counted as a declaration.

### Typed arithmetic and analytic corner interfaces

The mathematical properness/corner/rounding proofs are now sourced in Borel–Serre §§1–9 and Douady–Hérault §§4–6. A Lean form still needs AA’s typed number-field restriction-of-scalars datum, rational parabolic/split-centre objects, relative root coordinates and analytic associated-bundle/gluing interface. Arbitrary abstract groups and an arbitrary action space cannot state these hypotheses. The exact reductive/disconnected horospherical extension remains requested from AA.3. Pink all-adelic-element neatness is stronger than AA’s rational-intersection convention; the torsion-free/proper arithmetic argument uses only the latter. Prove a comparison if the stronger convention is adopted, rather than identify the two by terminology.

Needed by: `ArithmeticLocallySymmetricSpaces:ALS.0/cartan-involution`; `ArithmeticLocallySymmetricSpaces:ALS.0/maximal-compact-subgroup`; `ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space`; `ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space-contractible`; `ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space`; `ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition`; `ArithmeticLocallySymmetricSpaces:ALS.0/proper-action-stabilizers`; `ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold`; `ArithmeticLocallySymmetricSpaces:ALS.0/neatness-iwahori-criterion`; `ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups`; `ArithmeticLocallySymmetricSpaces:ALS.0/orientation-local-system`; `ArithmeticLocallySymmetricSpaces:ALS.0/nonorientable-neat-example`; `ArithmeticLocallySymmetricSpaces:ALS.2/geodesic-action-boundary-face`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`; `ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification`; `ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration`; `ArithmeticLocallySymmetricSpaces:ALS.2/stratification-spectral-sequence`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/corner-boundary-bridge`.

### Linear local-system descent and derived sheaf/cochain comparison

The deck-endpoint convention is fixed and its noncommuting-matrix test is specified. Tau Ceti supplies Type-valued covering monodromy equivalence and R-linear fundamental-groupoid functors, but not their arithmetic associated-bundle/sheaf descent comparison. Extend the flasque singular-cochain sheaf resolution locally on coefficient-trivializing contractible charts, glue by parallel transport, and prove the map is a quasi-isomorphism with naturality, relative pairs and compact supports. Borel–Serre §11.1 supplies ordinary local-coefficient group comparison and Sella supplies the constant-coefficient resolution model; neither alone supplies this entire enhanced interface. Record the absent map, rather than assert an existential arbitrary local system.

Needed by: `ArithmeticLocallySymmetricSpaces:ALS.0/orientation-local-system`; `ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system`; `ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.1/group-cohomology-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`; `ArithmeticLocallySymmetricSpaces:ALS.1/level-pullback`; `ArithmeticLocallySymmetricSpaces:ALS.5/de-rham-comparison`.

### Coherent equivariant supports, refinements and trace

The chosen-neat-refinement model RΓ(Q,RΓ(Ȳ,j_!V)) now specifies arbitrary-level compact support and its boundary object. Finish the requested E1 enhancement: equivariant coefficient extension, comparison under intersections of normal neat refinements, derived-invariants composition with residual quotient actions, supported restriction/corestriction and Mackey coherences. A bounded underlying R-complex need not be R[Q]-perfect when K has stabilizers. General coefficient base change through RΓ(Q,−) requires an explicit hypothesis; only neat or averaging cases are automatic. A ring action in End_D(R[Q]) does not itself give a strict D(H⊗R[Q]) lift.

Needed by: `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`; `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`; `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`; `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-support-boundary-compatibility`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/non-neat-duality`; `ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent`; `ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre`.

### Nondecomposed levels and reductive characteristic-zero splitting

Each global stratum now uses its transported L_g and Levi base. For nondecomposed compact opens construct the comparison via a decomposed neat normal refinement and quotient-group descent, retaining the actual arithmetic Γ_N extension and fibre action. For general reductive G the characteristic-zero statement supplies Leray/Kostant E₂, not unconditional degeneration or splitting. A Levi-equivariant quasi-isomorphism from nilpotent Lie cochains to their cohomology (or a theorem giving the required degeneration with compatible splittings) is the exact missing input for the formerly overgeneralized direct-sum formula. Harder–Raghuram supplies the stated GL_N specialization for F totally real only. An ordinary flag-resolution extension beyond that setting requires its own exact sheaf resolution and differential comparison.

Needed by: `ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-cohomology-formula`; `ArithmeticLocallySymmetricSpaces:ALS.4/levi-hochschild-serre`.

### Integral Kostant and continuous comparison limits

No integral Kostant–van Est decomposition is asserted: a large-p integral comparison and its lattice/Hecke compatibility would need a separate source and AF.1a input. The arithmetic Γ_N Hochschild–Serre construction is discrete. NT16 Lemma 4.5’s discrete arithmetic comparison is not a general continuous-cohomology theorem; a continuous version needs an exact comparison map and hypotheses. The finite quotient in ALS.6 needs only the direct finite-domain cochain identification, so R02.2 is no longer used as a mismatched supplier.

Needed by: `ArithmeticLocallySymmetricSpaces:ALS.4/nomizu-van-est`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-cohomology-formula`; `ArithmeticLocallySymmetricSpaces:ALS.4/levi-hochschild-serre`.

### Typed automorphic and Galois comparison interfaces

The arithmetic characteristic-zero comparison uses m_G=g_C/a_G and function central character inverse to V; test GL₁/ℚ to exclude a spurious degree-one direction. Import the AF.1a relative-cochain and AS.4/AS.5 automorphic carriers once typed, with the specified injection/interior map. Unitary applications request the exact AG2.2/AG2.3 ACC+ 2.3.3 system, not AG2.4 alone; check good-prime normalizations and residual constituent compatibility against the owner’s blueprint when it exists. The source’s two-block/imaginary-quadratic hypotheses and half-integral rho correction remain explicit.

Needed by: `ArithmeticLocallySymmetricSpaces:ALS.4/eisenstein-maximal-ideal`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-eigenvalue-criterion`; `ArithmeticLocallySymmetricSpaces:ALS.4/gln-boundary-eisenstein`; `ArithmeticLocallySymmetricSpaces:ALS.4/siegel-stratum-localization`; `ArithmeticLocallySymmetricSpaces:ALS.5/de-rham-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.5/automorphic-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.5/cuspidal-cohomology`; `ArithmeticLocallySymmetricSpaces:ALS.5/clozel-cohomological-gln`; `ArithmeticLocallySymmetricSpaces:ALS.5/non-eisenstein-degree-range`; `ArithmeticLocallySymmetricSpaces:ALS.5/unitary-middle-degree`.

### Stage order for geometry, supports, duality and automorphic applications

The local node graph is acyclic, but collapsing its nodes to the assigned broad layers hides necessary interleaving. Geometry nodes 19–21 and 23–24 precede supported betti-complexes and the conditional cochain model 13–16/18; finite triangulation 22 and the supported exact couple 25 then precede coefficient-change 17. The proposed cohomological-tools and coefficient-change sublayers record this order. Early verdier-poincare-duality and hecke-adjoint-duality precede boundary gluing; duality-triangle-compatibility is a later boundary application, rather than an input to them. The maintainer must also apply the existing ALS.5 automorphic-application split: comparison precedes AF.4, while its consumer applications follow AF.4. This packet preserves the assigned scope and accepted identifiers and does not edit the accepted restructuring result or foreign stage files.

Needed by: `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`; `ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.1/group-cohomology-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`; `ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change`; `ArithmeticLocallySymmetricSpaces:ALS.1/level-pullback`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`; `ArithmeticLocallySymmetricSpaces:ALS.2/stratification-spectral-sequence`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-gluing-convergence`; `ArithmeticLocallySymmetricSpaces:ALS.4/gln-boundary-eisenstein`; `ArithmeticLocallySymmetricSpaces:ALS.4/siegel-stratum-localization`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/duality-triangle-compatibility`; `ArithmeticLocallySymmetricSpaces:ALS.5/clozel-cohomological-gln`; `ArithmeticLocallySymmetricSpaces:ALS.5/non-eisenstein-degree-range`; `ArithmeticLocallySymmetricSpaces:ALS.5/unitary-middle-degree`.

### Suggested signatures: ALS.0

AA.1–AA.4 typed number-field/restriction-of-scalars datum, actual reductive real points and Cartan involutions, split centre, projective/local integral levels, arithmetic properness, smooth quotient and orientation carriers; LieGroups layer 9 real Cartan decomposition. The generic quotient and congruence-preimage forms do not supply those hypotheses. Missing Lean declaration signatures: LocallySymmetric.IsCartanInvolution, LocallySymmetric.IsCartanInvolution.exists, LocallySymmetric.IsCartanInvolution.conj, LocallySymmetric.IsCartanInvolution.transposeInverse, LocallySymmetric.IsCartanInvolution.prod, LocallySymmetric.IsCartanInvolution.killing, LocallySymmetric.maximalCompact, LocallySymmetric.symmetricSpace, LocallySymmetric.symmetricSpace.basepoint, LocallySymmetric.symmetricSpace.stabilizer_eq, LocallySymmetric.symmetricSpace.isoOfCartan, LocallySymmetric.symmetricSpace.dim_eq, LocallySymmetric.symmetricSpace.prod, LocallySymmetric.symmetricSpace.connectedVariant, LocallySymmetric.symmetricSpace_contractible, LocallySymmetric.X.equivLevelQuotient, LocallySymmetric.component_decomposition, LocallySymmetric.properlyDiscontinuous_arithmeticSubgroup, LocallySymmetric.neatLevel_manifold, LocallySymmetric.neat_of_two_iwahori, LocallySymmetric.gamma0, LocallySymmetric.taylorWilesLevel, LocallySymmetric.taylorWilesLevel.quotientEquiv, LocallySymmetric.iwahori.eq_parahoric, LocallySymmetric.gamma1, LocallySymmetric.gammaP, LocallySymmetric.orientationCharacter, LocallySymmetric.orientationSystem, LocallySymmetric.orientationSystem.monodromy, LocallySymmetric.orientationSystem.pullback, LocallySymmetric.orientationSystem.eq_manifold, LocallySymmetric.orientationCharacter_GL, LocallySymmetric.nonorientable_neat_example. Missing executable examples: cartanInvolution_GL_transposeInverse, cartanInvolution_SL2_adjoint, cartanInvolution_compact_id, not_cartanInvolution_id_GL2, symmetricSpace_GL2_Q, symmetricSpace_GL1, symmetricSpace_SL2_compat, symmetricSpace_not_without_centre, X_GL1_Q, X_GL2_levelOne, X_not_coarse_of_discrete, gamma0_eq_congruenceSubgroup, taylorWiles_quotient_trivial_n1, gammaP_ne_gamma1, orientationCharacter_GL2_Q, orientationCharacter_connected, orientationSystem_GL_formula, orientation_not_trivial_at_neat_PGL2. The suggested file retains the exact mathematical specification and these names as explicit section-13 omissions; comments are not counted as Lean signatures.

Needed by: `ArithmeticLocallySymmetricSpaces:ALS.0/cartan-involution`; `ArithmeticLocallySymmetricSpaces:ALS.0/maximal-compact-subgroup`; `ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space`; `ArithmeticLocallySymmetricSpaces:ALS.0/symmetric-space-contractible`; `ArithmeticLocallySymmetricSpaces:ALS.0/locally-symmetric-space`; `ArithmeticLocallySymmetricSpaces:ALS.0/component-decomposition`; `ArithmeticLocallySymmetricSpaces:ALS.0/proper-action-stabilizers`; `ArithmeticLocallySymmetricSpaces:ALS.0/neat-level-manifold`; `ArithmeticLocallySymmetricSpaces:ALS.0/neatness-iwahori-criterion`; `ArithmeticLocallySymmetricSpaces:ALS.0/standard-level-subgroups`; `ArithmeticLocallySymmetricSpaces:ALS.0/orientation-local-system`; `ArithmeticLocallySymmetricSpaces:ALS.0/nonorientable-neat-example`.

### Suggested signatures: ALS.1

Typed arithmetic associated-bundle sheaves and the local-system/singular comparison; SSF linear equivariant sheaves, cohomology functors and enough injectives; E1 compactified equivariant supports with residual quotient actions and coherent refinement; AT relative/coefficient-chain comparison. These are needed before geometric RΓ, supported RΓ, and finite models can be named. Missing Lean declaration signatures: LocallySymmetric.localSystem, LocallySymmetric.localSystem.stalk, LocallySymmetric.localSystem.monodromy, LocallySymmetric.localSystem.map, LocallySymmetric.localSystem.tensor, LocallySymmetric.localSystem.pullback, LocallySymmetric.localSystem.constant, LocallySymmetric.RΓ, LocallySymmetric.RΓc, LocallySymmetric.RΓrel, LocallySymmetric.RΓ.isoSheafCohomology, LocallySymmetric.RΓrel.forget, LocallySymmetric.RΓc.forgetSupports, LocallySymmetric.RΓ.map, LocallySymmetric.sheaf_singular_comparison, LocallySymmetric.group_cohomology_comparison, LocallySymmetric.finite_complex_model, LocallySymmetric.coefficient_change, LocallySymmetric.RΓ.pullback, LocallySymmetric.RΓ.translate, LocallySymmetric.RΓ.translate_pullback, LocallySymmetric.RΓ.pullback_eq_sheafPullback, LocallySymmetric.RΓc.pullback. Missing executable examples: localSystem_trivial, localSystem_monodromy_GL1, localSystem_eq_LocalCoefficientSystem, localSystem_not_constant_of_trivial_stalk, RΓ_point, H1_modularCurve_levelGamma1_5, RΓ_eq_groupCohomology_levelOne, RΓ_ne_coarse, pullback_H0, translate_of_mem, pullback_injective_rational, pullback_not_iso. The suggested file retains the exact mathematical specification and these names as explicit section-13 omissions; comments are not counted as Lean signatures.

Needed by: `ArithmeticLocallySymmetricSpaces:ALS.1/arithmetic-local-system`; `ArithmeticLocallySymmetricSpaces:ALS.1/betti-complexes`; `ArithmeticLocallySymmetricSpaces:ALS.1/sheaf-singular-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.1/group-cohomology-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.1/finite-complex-model`; `ArithmeticLocallySymmetricSpaces:ALS.1/coefficient-change`; `ArithmeticLocallySymmetricSpaces:ALS.1/level-pullback`.

### Suggested signatures: ALS.2

AA rational parabolics, relative split tori, root-coordinate associated corners and analytic gluing; AC.3 nilmanifold carrier; E1 supported localization and a typed exact-couple/spectral-sequence interface. Arbitrary subgroups of a Lie group are not rational parabolic data. Missing Lean declaration signatures: LocallySymmetric.BorelSerre.geodesicAction, LocallySymmetric.BorelSerre.geodesicAction_free, LocallySymmetric.BorelSerre.face, LocallySymmetric.BorelSerre.faceEquiv, LocallySymmetric.BorelSerre.face_conj, LocallySymmetric.BorelSerre.face_dim, LocallySymmetric.BorelSerre.bordification, LocallySymmetric.BorelSerre.corner, LocallySymmetric.BorelSerre.boundary, LocallySymmetric.BorelSerre.closure_face, LocallySymmetric.BorelSerre.smul, LocallySymmetric.BorelSerre.contractible, LocallySymmetric.BorelSerre.adelic, LocallySymmetric.BorelSerre.compactSpace_adelic, LocallySymmetric.BorelSerre.finite_relative_triangulation, LocallySymmetric.BorelSerre.stratum, LocallySymmetric.BorelSerre.stratum_bijective, LocallySymmetric.BorelSerre.stratum_closure, LocallySymmetric.BorelSerre.stratum_isOpen_of_maximal, LocallySymmetric.BorelSerre.stratum_components, LocallySymmetric.BorelSerre.stratum_nilmanifold_fibration, LocallySymmetric.BorelSerre.stratFiltration, LocallySymmetric.BorelSerre.stratSpectralSequence, LocallySymmetric.BorelSerre.stratSpectralSequence_d1, LocallySymmetric.BorelSerre.stratSpectralSequence_map, LocallySymmetric.BorelSerre.mayerVietorisSpectralSequence. Missing executable examples: face_SL2_borel, face_whole_group, face_GL3_minimal, geodesicAction_ne_leftAction, bordification_SL2, bordification_anisotropic, bordification_interior, bordification_ne_onePoint, stratum_SL2_cusps, stratum_anisotropic_empty, stratum_GL3_poset, stratum_not_disjoint_union_topologically, stratSS_SL2, stratSS_empty, stratSS_rank_one_collapse, stratSS_E1_not_complex. The suggested file retains the exact mathematical specification and these names as explicit section-13 omissions; comments are not counted as Lean signatures.

Needed by: `ArithmeticLocallySymmetricSpaces:ALS.2/geodesic-action-boundary-face`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-bordification`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-quotient-compact`; `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`; `ArithmeticLocallySymmetricSpaces:ALS.2/boundary-stratification`; `ArithmeticLocallySymmetricSpaces:ALS.2/stratum-nilmanifold-fibration`; `ArithmeticLocallySymmetricSpaces:ALS.2/stratification-spectral-sequence`.

### Suggested signatures: ALS.3

SR.1 locally profinite Haar convolution/function carrier for the Hecke-ring comparison; bounded-below right-derived invariants with forgetful comparison, E1 coherent supported arithmetic RΓ and trace; IHG.2 typed finite derived Hecke image and inverse-limit theorem. An End_D ring action alone is not a strict D(H⊗R[Q]) object. Missing Lean declaration signatures: LocallySymmetric.Hecke.derivedInvariants, LocallySymmetric.Hecke.eq_heckeAlgebra, LocallySymmetric.heckeObject, LocallySymmetric.heckeAction, LocallySymmetric.heckeAction_c, LocallySymmetric.heckeActionRel, LocallySymmetric.heckeAction_one, LocallySymmetric.heckeAction_natural, LocallySymmetric.hecke_operator_formula, LocallySymmetric.RΓ.trace, LocallySymmetric.RΓ.trace_pullback, LocallySymmetric.RΓ.pullback_trace, LocallySymmetric.RΓ.trace_comp, LocallySymmetric.RΓ.trace_eq_coveringTransfer, LocallySymmetric.RΓ.trace_c, LocallySymmetric.hecke_composition, LocallySymmetric.hecke_support_boundary_compatibility, LocallySymmetric.discrete_topological_comparison, LocallySymmetric.derivedHeckeAlgebra.commRing, LocallySymmetric.derivedHeckeAlgebra.toCohomology, LocallySymmetric.derivedHeckeAlgebra.limit, LocallySymmetric.derivedHeckeAlgebra.eq_derivedHeckeImage, LocallySymmetric.derivedHeckeAlgebra.maximalIdeals_finite, LocallySymmetric.twisting_isomorphism, LocallySymmetric.degeneracy_old_forms. Missing executable examples: hecke_one_smul, hecke_Tp_permutation, hecke_not_pointwise, heckeAction_one, heckeAction_H0, heckeAction_modularCurve_Tp, heckeAction_not_on_cochains, trace_pullback_H0, trace_self, trace_eq_transfer, trace_coarse_fails, derivedHeckeAlgebra_GL1, derivedHeckeAlgebra_surj_cohomology, derivedHeckeAlgebra_ne_cohomologyAlgebra. The suggested file retains the exact mathematical specification and these names as explicit section-13 omissions; comments are not counted as Lean signatures.

Needed by: `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-action-on-invariants`; `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-action`; `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-operator-formula`; `ArithmeticLocallySymmetricSpaces:ALS.3/level-trace`; `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-composition`; `ArithmeticLocallySymmetricSpaces:ALS.3/hecke-support-boundary-compatibility`; `ArithmeticLocallySymmetricSpaces:ALS.3/discrete-topological-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.3/derived-hecke-algebra`; `ArithmeticLocallySymmetricSpaces:ALS.3/twisting-isomorphism`; `ArithmeticLocallySymmetricSpaces:ALS.3/degeneracy-old-forms`.

### Suggested signatures: ALS.4

SR.2/SR.4 and RG2.4 exact parabolic/Iwasawa and monoid Satake carriers; AF.1a absolute Lie algebra cochains/Kostant modules; transported boundary RΓ/localization from earlier ALS nodes; IHG.2 spectral idempotents; AG residual Galois systems indexed by finite Hecke-image maximal ideals. Reducibility of an arbitrary representation is only an adapter for the arithmetic predicate. Missing Lean declaration signatures: LocallySymmetric.boundary_triangle, LocallySymmetric.Hecke.restrictParabolic, LocallySymmetric.Hecke.integrateUnipotent, LocallySymmetric.Hecke.satakeUnnormalized, LocallySymmetric.Hecke.satakeUnnormalized_basis, LocallySymmetric.Hecke.satake_compat_normalized, LocallySymmetric.Hecke.parabolicInduction_invariants, LocallySymmetric.boundary_stratum_hecke_comparison, LocallySymmetric.nomizu_van_est, LocallySymmetric.boundary_stratum_cohomology_formula, LocallySymmetric.levi_hochschild_serre, LocallySymmetric.boundary_gluing_convergence, LocallySymmetric.heckeLocalize, LocallySymmetric.heckeLocalize.cohomology, LocallySymmetric.heckeLocalize.heckeAlgebra, LocallySymmetric.heckeLocalize.triangle, LocallySymmetric.heckeLocalize.eq_zero_iff, LocallySymmetric.heckeLocalize.reduction, LocallySymmetric.IsGaloisType, LocallySymmetric.IsEisenstein, LocallySymmetric.IsEisenstein.of_cohomology, LocallySymmetric.IsEisensteinCG, LocallySymmetric.IsEisenstein.iff_CG, LocallySymmetric.boundary_eigenvalue_criterion, LocallySymmetric.gln_boundary_eisenstein, LocallySymmetric.siegel_stratum_localization. Missing executable examples: satake_GL2_Tp, satake_one, satake_compat_SR4, satake_unnormalized_not_W_invariant, heckeLocalize_unsupported, heckeLocalize_module, heckeLocalize_sum, heckeLocalize_not_tensor, eisenstein_H0, eisenstein_GL1, eisenstein_iff_CG_PGL2, nonEisenstein_not_vanishing. The suggested file retains the exact mathematical specification and these names as explicit section-13 omissions; comments are not counted as Lean signatures. The ♠-only general real-place GL_n boundary theorem remains outside this plan: identify the orientation character arithmetically and prove its Galois-type compatibility, or supply the explicit dual-orientation Galois-type input now stated in gln-boundary-eisenstein. Ordinary Galois type plus neatness does not establish that input.

Needed by: `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-triangle`; `ArithmeticLocallySymmetricSpaces:ALS.4/parabolic-hecke-maps`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-hecke-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.4/nomizu-van-est`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-cohomology-formula`; `ArithmeticLocallySymmetricSpaces:ALS.4/levi-hochschild-serre`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-gluing-convergence`; `ArithmeticLocallySymmetricSpaces:ALS.4/localization-at-maximal-ideal`; `ArithmeticLocallySymmetricSpaces:ALS.4/eisenstein-maximal-ideal`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-eigenvalue-criterion`; `ArithmeticLocallySymmetricSpaces:ALS.4/gln-boundary-eisenstein`; `ArithmeticLocallySymmetricSpaces:ALS.4/siegel-stratum-localization`.

### Suggested signatures: ALS.5:finite-level-duality

The actual rounded topological Borel–Serre pair, orientation sheaf and supported arithmetic complexes; AT stage 6 enhanced Poincaré–Lefschetz/Verdier comparison, integer-degree cohomology and geometric evaluation trace; E1 supported equivariant descent for non-neat levels. Arbitrary unrelated graded modules cannot state the pairing. Missing Lean declaration signatures: LocallySymmetric.corner_boundary_bridge, LocallySymmetric.verdier_poincare_duality, LocallySymmetric.dualityPairing, LocallySymmetric.dualityPairing_relative, LocallySymmetric.dualityPairing_perfect, LocallySymmetric.dualityPairing_pullback_trace, LocallySymmetric.dualityPairing_eq_evaluation, LocallySymmetric.hecke_adjoint_duality, LocallySymmetric.duality_triangle_compatibility, LocallySymmetric.non_neat_duality. Missing executable examples: pairing_surface_H0H2, pairing_compact_case, pairing_pullback_trace, pairing_needs_orientation. The suggested file retains the exact mathematical specification and these names as explicit section-13 omissions; comments are not counted as Lean signatures.

Needed by: `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/corner-boundary-bridge`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/verdier-poincare-duality`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/duality-pairings`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/hecke-adjoint-duality`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/duality-triangle-compatibility`; `ArithmeticLocallySymmetricSpaces:ALS.5:finite-level-duality/non-neat-duality`.

### Suggested signatures: ALS.5

AF.1a relative Lie cochains for m_G=g_C/a_G and the cancelling central character; AS.4/AS.5 discrete/cuspidal and automorphic form carriers and their comparison maps; AF.4 cohomological modules; AG2.2/AG2.3 unitary parameter systems and AG2.4 GL systems. An arbitrary submodule of H* cannot define cuspidal cohomology. Missing Lean declaration signatures: LocallySymmetric.early_duality_reexport, LocallySymmetric.de_rham_comparison, LocallySymmetric.automorphic_comparison, LocallySymmetric.cuspidalCohomology, LocallySymmetric.cuspidalCohomology_injective, LocallySymmetric.cuspidalCohomology_le_interior, LocallySymmetric.cuspidalCohomology_decomp, LocallySymmetric.cuspidalCohomology_eq_franke, LocallySymmetric.clozel_cohomological_gln, LocallySymmetric.non_eisenstein_degree_range, LocallySymmetric.unitary_middle_degree. Missing executable examples: cuspidal_GL2_weight2, cuspidal_torus, cuspidal_le_interior, cuspidal_ne_ordinary. The suggested file retains the exact mathematical specification and these names as explicit section-13 omissions; comments are not counted as Lean signatures.

Needed by: `ArithmeticLocallySymmetricSpaces:ALS.5/early-duality-reexport`; `ArithmeticLocallySymmetricSpaces:ALS.5/de-rham-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.5/automorphic-comparison`; `ArithmeticLocallySymmetricSpaces:ALS.5/cuspidal-cohomology`; `ArithmeticLocallySymmetricSpaces:ALS.5/clozel-cohomological-gln`; `ArithmeticLocallySymmetricSpaces:ALS.5/non-eisenstein-degree-range`; `ArithmeticLocallySymmetricSpaces:ALS.5/unitary-middle-degree`.

### Suggested signatures: ALS.6

The coherent finite-level supported equivariant complexes from ALS.1/ALS.3 and E1, with finite residual quotient actions, plus the AT stage 5 finite-cover Hochschild–Serre/edge maps. No completed tower or continuous profinite comparison is assumed or imported. Missing Lean declaration signatures: LocallySymmetric.finite_level_descent, LocallySymmetric.finite_cover_hochschild_serre, LocallySymmetric.lowest_degree_descent, LocallySymmetric.finite_cover_acceptance_tests. Missing executable examples: . The suggested file retains the exact mathematical specification and these names as explicit section-13 omissions; comments are not counted as Lean signatures.

Needed by: `ArithmeticLocallySymmetricSpaces:ALS.6/finite-level-descent`; `ArithmeticLocallySymmetricSpaces:ALS.6/finite-cover-hochschild-serre`; `ArithmeticLocallySymmetricSpaces:ALS.6/lowest-degree-descent`; `ArithmeticLocallySymmetricSpaces:ALS.6/tower-acceptance-tests`.

## Structure and upstream notes

ALS.5's automorphic applications (Clozel's theorem for GL_n, ACC+ Theorems 2.4.10 and 2.4.11) need AutomorphicFormsOnReductiveGroups AF.4 (regular algebraic and cohomological representations), while AF.4/clozel-rationality itself needs ALS.5's comparison of Betti cohomology with automorphic forms. With both in ALS.5 the stage graph acquires the cycle ALS.5 → AF.4 → ALS.5.

Divide ALS.5 into the comparison layer ALS.5 (nodes early-duality-reexport, de-rham-comparison, automorphic-comparison, cuspidal-cohomology), which AF.4 consumes, and a sub-layer ALS.5:automorphic-applications (nodes clozel-cohomological-gln, non-eisenstein-degree-range, unitary-middle-degree) with requirements ALS.5, ALS.4, AutomorphicFormsOnReductiveGroups:AF.4 and AutomorphicGaloisRepresentationsPartII:AG2.2/AG2.3/AG2.4. No node changes; only the layer assignment. Preserve all accepted node ids. The boundary applications ALS.4/boundary-gluing-convergence, gln-boundary-eisenstein and siegel-stratum-localization consume only the early verdier-poincare-duality and hecke-adjoint-duality nodes, which have no ALS.4 prerequisites; duality-triangle-compatibility stays after the boundary triangle. Accepted RS-09~2 keeps ALS.6 finite-level-only and removes all CompletedCohomology→ALS.6 imports; tower assembly remains CC.0/CC.1 and completed limits/models/boundary exports CC.2/CC.4/CC.7.

Supported finite-level complexes require the compact Borel–Serre pair; finite triangulation and the boundary exact couple then consume those complexes, and coefficient change consumes the triangulation. Collapsing these node dependencies creates ALS.1 ↔ ALS.2, although the node graph has no cycle. Early duality and its later boundary-triangle compatibility must likewise be distinguished.

Keep ALS.2 geometry nodes geodesic-action-boundary-face, borel-serre-bordification, borel-serre-quotient-compact, boundary-stratification and stratum-nilmanifold-fibration before ALS.1. Keep arithmetic-local-system, betti-complexes, sheaf-singular-comparison, group-cohomology-comparison, finite-complex-model (the conditional finite-cell lemma) and level-pullback in ALS.1. Put borel-serre-finite-triangulation and stratification-spectral-sequence in ALS.2:cohomological-tools after ALS.1, then coefficient-change in ALS.1:coefficient-change after those tools. Keep corner-boundary-bridge, verdier-poincare-duality, duality-pairings, hecke-adjoint-duality and non-neat-duality in the early finite-level-duality layer. Put duality-triangle-compatibility in ALS.5:finite-level-duality:boundary-compatibility after ALS.4. Preserve every node id; these are proposals for the maintainer, not changes to the assigned scope or accepted RS-09 result.

For `tauceti:TauCetiRoadmap/AlgebraicTopology`: Stage 6 constructs singular cochains with local coefficients but no stage compares them with sheaf cohomology of the associated locally constant sheaf, nor proves the de Rham theorem with local coefficients. ArithmeticLocallySymmetricSpaces plans both for the spaces X_K (ALS.1/sheaf-singular-comparison, ALS.5/de-rham-comparison) because RS-09 assigns the arithmetic sheaf comparison there; a general version in AlgebraicTopology stage 6 would let ALS import it.

For `tauceti:TauCetiRoadmap/AlgebraicTopology`: Stage 6 item 4 proves Poincaré–Lefschetz duality for compact manifolds with boundary; Borel–Serre compactifications are manifolds with corners. ALS bridges this (ALS.5:finite-level-duality/corner-boundary-bridge); stating the duality for manifolds with corners (or the corner-straightening homeomorphism) in stage 6 would remove the bridge.

## Source corrections

The independent revision-2 review rechecked and confirmed the three Newton–Thorne corrections below against the published text and the relevant arXiv v1 passages. Their recorded version comparison and bounded correction search remain in the packet. They are source issues, separate from errors in the earlier suggested file.

### ArithmeticLocallySymmetricSpaces/E1

§3.1, paragraph on neatness, p. 41, and Lemma 3.2(1), p. 42, of the published version (Forum Math. Sigma 4 (2016) e21); also Proposition 3.7(1), p. 48, which omits the orientation sheaf. arXiv:1511.04913v1 has the same text.

Neat arithmetic groups act freely and properly discontinuously but need not preserve the orientation of X^G; X^U_G need not be orientable, and Verdier duality (Proposition 3.7(1)) must be twisted by the orientation local system o_U. The claim holds when G(F ⊗ ℝ) is connected, which covers the paper's applications (Res_{F/ℚ}GL_n with F CM, and U(n, n)).

G = PGL_{2,ℚ}, X^G = ℍ with det < 0 acting antiholomorphically. U = K(5)K(13)∏_{p≠5,13}PGL_2(Z_p) is neat (adjoint eigenvalues ≡ 1 at 5 and at 13, so torsion is 5-primary and 13-primary, hence trivial). The matrix (57, 455; 455, 3632) = 57·I + 65·(0, 7; 7, 55) has determinant −1 and lies in U, and its class reverses orientation, so the corresponding component of X^U_G is a nonorientable surface.

### ArithmeticLocallySymmetricSpaces/E2

§4, display after Theorem 4.2, p. 55 of the published version; arXiv v1 the same

The third map of the boundary triangle lands in RΓ_c(X^U_G, A^U_G)[1].

An exact triangle A → B → C → A[1]; the long exact sequence H^i(∂) → H^{i+1}_c requires the shift [1].

### ArithmeticLocallySymmetricSpaces/E3

Published Proposition 3.7(1), equation (3.1), p.48, and proof p.49, Forum Math. Sigma 4 (2016) e21; arXiv:1511.04913v1 has the same unshifted formula.

With ordinary cohomological RΓ and d = dim X^G, insert the dimension shift: RHom_R(RΓ_c(X^U_G,A),R) ≅ RΓ(X^U_G,B ⊗ o_U)[d]. The orientation twist is the separate finding E1.

For G = GL_1 over a real-quadratic field, a neat component is an oriented circle. With constant field coefficients, the dual of RΓ_c has nonzero cohomology in degrees −1 and 0; unshifted RΓ has nonzero cohomology in degrees 0 and 1. They cannot be isomorphic. ACC+ Proposition 2.2.21 explicitly includes [D]. NT16 uses ordinary sheaf cohomology and B=Hom_R(A,R), so this is not an alternate convention.

Known corrections from the paper extractions are applied with their original identifiers: CG18 E188/E191/E229 (the old-space matrix, factorial-power projectors and extra localization); CG20 E140/E142 (absolute irreducibility and the p-group subcover); ACC+ E21–E23 (unitary weight indexing and the imaginary-quadratic hypothesis).

The [independent revision-2 review](../reviews/REV-ArithmeticLocallySymmetricSpaces~2.md) accepts this complete planning pass after checking all 66 nodes and correcting 21. The packet records its fresh per-node review. All 16 explicit gaps remain owner/interface/extension obligations, all stages are planned rather than closed, and no implementation is claimed.

The general real-place GL_n boundary argument explicitly requires Galois type for the dual orientation coefficient system. Proving that compatibility from the printed ordinary ♠ hypothesis remains an owner obligation; neatness alone does not remove the orientation character.

### AF.1a absolute cochains and Kostant supplier

The exact request is to AF.1a, the unique cochain owner. Its existing complex supplies the complex relative theory; extension to the absolute algebraic complex over E of characteristic zero, the parabolic Kostant decomposition and compatible Levi action remain requested outputs. No integral or mod-p Kostant theorem is inferred. Nomizu’s lattice comparison remains an ALS.4 theorem.

Needed by: `ArithmeticLocallySymmetricSpaces:ALS.4/nomizu-van-est`; `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-cohomology-formula`.
