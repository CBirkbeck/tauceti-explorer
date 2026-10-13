# Roadmap: modular curves, following Katz–Mazur, Part II: uniformization, integral boundary and Hecke cohomology

This part builds from the integral compactified modular curves to their generic-fibre comparisons, explicit bad fibres, Jacobians and geometric Hecke actions. It constructs the parabolic cohomological interfaces, proves the precisely delimited Ihara statements, forms modular abelian quotients and supplies finite Taylor–Wiles cover control. The end geometric relation in weight two is the special-fibre Eichler–Shimura identity; the patching and automorphic Galois representation theorems consume these interfaces in their own roadmaps.

## Scope and ownership

The scope is exactly R13.4b, R13.5, R13.6 and R14.1–R14.6. The base is TauCetiRoadmap’s ModularCurves. Its affine level schemes and prime-level compactified diamond quotients over ℤ[1/N] are existing work. The earlier part supplies generalized elliptic curves, contraction, Drinfeld level structures, formal cusp charts and algebraic integral coarse curves. In particular, R13.4a constructs the coarse curves before the analytic comparison; R13.4 is a process aggregate with no mathematical ownership.

All 75 targets in this scope already have canonical nodes in the independently accepted [R13.3 packet](../packets/ModularCurvesPartII--R13.3.json) and [R14.3 packet](../packets/ModularCurvesPartII--R14.3.json). The [packet for this part](../packets/ModularCurvesPartII--R13.4b.json) references those nodes through its imports and target inventory, rather than assigning new IDs to the same mathematics. The reader incorporates the corrections in both independent reviews. It also specifies 35 exact substitutions for broad references to stages of this roadmap: those in this part, and R12.3, R12.5, R12.6 and R13.2, whose nodes are in the accepted [R12.1 packet](../packets/ModularCurvesPartII--R12.1.json). One further contract imports the existing tree, local amalgam and strong-approximation suppliers into the R14.4 amalgam target. Those are contracts for the assembly of the accepted parts, with the original canonical packets left intact. Every target remains unchecked as an implementation. Each of the nine stages is planned; the nine gaps and 38 supplier contracts at the end give the remaining proof obligations. Complete planning does not mean that these obligations have been discharged.

StableReduction owns general blowups, normalization, dual multigraphs, semistable existence and stabilization. NeronModelsAndSemistableAbelianVarieties owns the general graph-character and monodromy sequences. Lower-tier LefschetzPencilsAndVanishingCycles LPV.7 owns the semistable curve specialization/nearby-cycle theory. This roadmap instantiates them on the explicit modular models. AlgebraicTopology supplies finite covers, relative and twisted cohomology and manifold duality; EtaleDualityAndPerverseSheaves supplies support maps, traces and duality. JacobianChallenge supplies field Jacobians and the generic Abel–Jacobi universal property. The required curve-specific relative polarization and norm theorem over ℤ[1/N] is a separate supplier obligation.

ModularForms owns the abstract Hecke algebra, analytic newforms, strong multiplicity one and its existing full modular-symbol module. The geometric actions and image quotients are compared with them here. ComplexMultiplicationAndExplicitReciprocity owns the CM and Kronecker congruences for the cyclic modular polynomial. NonAbelianChabauty NC.5 uses the split-Cartan level-13 model; its height conclusions are owned there. R20 uses these component and character maps for level lowering. R19 imports the weight-two special-fibre identity and retains the higher-weight Deligne congruence; R22 owns patching and R=T.

Current TauCetiRoadmap main and the current Tau Ceti library have been checked in addition to the atlas snapshot. JacobianChallenge and UniversalCovers were read in full; the relevant ModularCurves and ModularForms layers and the nine post-snapshot roadmaps were screened, including the nested OperatorTheory files. AlgebraicVectorBundles already owns general symmetric-power bundles and DifferentialGeometry owns real de Rham/singular comparison; neither is replanned. Current Tau Ceti already implements generic local group-ring locality and augmentation. The modular application below records the integration needed at the older pin. Current equation-level Tate data and twisted singular cohomology are likewise existing work.

## Conventions

Write X₁(N) for the point-of-exact-order model and X₀(N) for the cyclic-subgroup model. For the smooth relative Jacobian use N≥5 and S=Spec ℤ[1/N]; different coarse quotients use their legal smooth geometrically connected base. Honest full level retains its determinant/cyclotomic constant algebra. Fixed Weil pairing is over its cyclotomic base. The scalar-framed quotient retains two determinant square classes over ℂ. The refined Γ₀ compactification and the naive one have the same coarse curve, but their stacks are not identified. A finite-flat stack map descends with its degree only when the full finite algebra has the required trivial stabilizer action.

An order-m subgroup correspondence A_m includes every finite subgroup; C_m includes only cyclic ones. Their characteristic-zero degrees are σ₁(m) and ψ(m). HNF data satisfy ad=m and 0≤b<d, with the cyclic filter gcd(a,b,d)=1. For m=4 the degrees are 7 and 6. The proper Tate branch power map has generic degree m and node fibre length 2m−1; its smooth-locus restriction is finite locally free, while the proper morphism is not flat for m>1.

For the Hecke span use π₁ as the forgetful leg and π₂ as the quotient leg, with the indicated contractions. On Jacobians the upper Picard action is π₁*π₂^* and the lower action is π₂*π₁^*. The lower cotangent action is classical T_p; the upper is its adjoint. Norms and cohomological traces count lengths and are not divided by degrees. On coherent weight-k forms the isogeny trace is pT_p, and integral division by p requires the local theorem. Atkin–Lehner on X₁ uses w_ζ over the specified cyclotomic field, not an assumed rational automorphism; on X₀ exact divisors give rational involutions. A bad-prime U_p formula never uses a nonexistent diamond p.

For weight k≥2 put r=k−2 and use Sym^r of the relative first cohomology of the actual universal elliptic family. Finite étale coefficients require ℓ invertible; integral and adic statements retain all inverse-limit and torsion hypotheses. Parabolic cohomology is the image of compact-support forgetting. For nontrivial coefficients truncate cusps to boundary circles: do not collapse their monodromy into a falsely extended local system on the compact curve. Integral symmetric-power self-duality requires r! invertible or a separately compared dual/divided-power lattice. Kummer gives T_ℓPic⁰≅H¹_et(X,ℤ_ℓ(1)); comparisons retain the twist and upper/lower transpose conventions. Rational rank two over a Hecke factor never means integral rank two without additional hypotheses.

Graphs retain oriented branches, loops, multiple edges, cusp fields, component genera, node thicknesses and Galois actions. Their character lattice is H₁, rather than H¹. Thicknesses weight the monodromy pairing and its finite component-group cokernel. The rational nearby-cycle filtration carries the Tate twists and scales monodromy by the ramification index. Taylor–Wiles uses odd ℓ, the actual finite abelian ℓ-group Δ_Q, an auxiliary fine level R≥5 and the minus action of ξ=diag(−1,1); the auxiliary level and finite errors are retained.

## Exact supplier contracts

The pinned baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The following actual declaration statements were read at those commits. They supply the indicated algebraic or cohomological core; the modular geometry is supplied by the named layers and requests.

- `tauceti:HeckeRing.GL2.heckeT_mul_of_coprime` (TauCeti/NumberTheory/HeckeRing/GL2/Basic.lean): For m,n:ℕ+ and Nat.Coprime(m:ℕ)(n:ℕ), HeckeRing.GL2.heckeT m * HeckeRing.GL2.heckeT n = HeckeRing.GL2.heckeT (m*n). This is the abstract full-subgroup integral GL₂ Hecke product, not the cyclic repeated-prime law.
- `mathlib:AlgebraicGeometry.Scheme.EllAdicCohomology` (Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean): Untwisted pro-étale ℤ_ℓ sheaf cohomology carrier with additive group; does not supply twisted finite coefficients, comparison or a ℤ_ℓ-module instance.
- `mathlib:AlgebraicGeometry.Scheme.ellAdicSheaf` (Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean): Continuous ℤ_ℓ-valued pro-étale sheaf, for ℓ prime.
- `tauceti:TauCeti.LocalCoefficientSystem` (TauCeti/AlgebraicTopology/LocalCoefficient.lean): Module-valued functors on the fundamental groupoid; the abstract local-system carrier is imported.
- `tauceti:TauCeti.LocalCoefficientSystem.pullback` (TauCeti/AlgebraicTopology/LocalCoefficient.lean): Pullback functor along a continuous map, with identity and composition isomorphisms in that file.
- `tauceti:Representation.symmetricPower` (TauCeti/RepresentationTheory/SymmetricPower.lean): Action on Sym^r of a representation; includes pure-tensor evaluation and functorial intertwining maps. The abstract symmetric-power representation is not a new target.
- `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety` (TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean): Actual proper geometrically integral group-scheme carrier over a field; not a Jacobian or a quotient construction.
- `mathlib:RingHom.ker` (Mathlib/RingTheory/Ideal/Maps.lean): Kernel ideal of a ring homomorphism.
- `mathlib:LinearMap.coprod` (Mathlib/LinearAlgebra/Prod.lean): Sum map from a product of two modules, used only after geometric pullbacks have been constructed.
- `mathlib:LinearMap.range` (Mathlib/Algebra/Module/Submodule/Range.lean): Image submodule, used to define parabolic cohomology from the actual compact-support map.
- `mathlib:groupCohomology.H1` (Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean): Group-cohomology carrier for an actual representation. With trivial action, degree one is additive characters, not compact curve cohomology.
- `tauceti:HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq` (TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean): Same-level newforms, with equal characters and good eigenvalues outside a finite set, are equal. This does not prove cross-level multiplicity one or integral saturation.
- `mathlib:groupCohomology.coindIso` (Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean): Shapiro isomorphism for coinduction from a subgroup, in every degree; use this existing theorem rather than plan another Shapiro theorem.
- `mathlib:CongruenceSubgroup.Gamma` (Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean): Existing principal subgroup, kernel of reduction of SL₂(Z) modulo N; no second principal-congruence carrier is planned.
- `mathlib:groupCohomology.H1IsoOfIsTrivial` (Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean): Existing trivial-action H¹/character isomorphism; congruenceClasses_H1 specializes this result rather than reproving it.
- `tauceti:CongruenceSubgroup.Gamma_le_Gamma_of_dvd` (TauCeti/NumberTheory/ModularForms/CongruenceSubgroups/Basic.lean): Existing antitonicity of principal congruence subgroups under divisibility of levels; use it in refinement and restriction tests.
- `mathlib:Module.free_of_flat_of_isLocalRing` (Mathlib/RingTheory/LocalRing/Module.lean): A finite flat module over a commutative local ring is free. Finite projective modules supply flatness; this is not an unrestricted infinitely generated freeness assertion.
- `tauceti:SymmetricPower.finrank_eq` (TauCeti/LinearAlgebra/SymmetricPower/Basis.lean): For a finite free module over a commutative semiring with strong rank condition, the nth symmetric power has finrank multichoose(finrank M,n); supplies the rank checks for relative rank-two coefficients.
- `mathlib:RingHom.quotientKerEquivRange` (Mathlib/RingTheory/Ideal/Quotient/Operations.lean): For a commutative ring R and a ring S, R/ker f is canonically ring-isomorphic to the image subring f.range. This is an integral image theorem, not a rational coefficient-field identification.

The exact external stage requests are listed after the layers, with their consuming nodes. Direct node inputs include A3/polarized-weil-pairing, A4/etale-tate-module, A6/hom-is-free-of-finite-rank and relative-hom-and-normal-extension; A0-extension’s Picard representability, neutral-component and lifting nodes; R09.5’s finite-correspondence and tame descent nodes; R01.6/good-reduction-specialization; EDC.2’s flat trace, curve trace and cup-trace pairing; the four LPV.7 semistable-curve nodes; and R11.4’s normalization and character-homology nodes. The substitutions add the R12.1 packet’s nodes for R12.3 (compact uniformization, cusp parameters, cusp fields), R12.5 (regular differentials, Hodge line, the first-coefficient pairing and its perfection), R12.6 (generic descent, component fields, level compatibility) and R13.2 (level structures, proper flat stacks, small-level range, Katz–Mazur agreement, contraction maps), ReductiveGroupsPartII RG2.2/sl2-tree and RG2.2/ihara-amalgam, and AdelicAlgebraicGroups AA.4/strong-approximation-sufficiency and AA.4/strong-approximation-finite-places. Their exact statements were checked. A partially refined supplier is a planning contract, not an implemented theorem. SF.2 is requested for the specific finite/local-coefficient étale–Betti comparison corresponding to RS-06’s unresolved upstream owner label; a real de Rham comparison cannot replace it.

## How to read the build

R13.4b compares the already algebraically constructed curves and maps with the analytic models. R13.5 computes bad fibres; R13.6 exports their graphs and functorial actions. The algebraic correspondence definitions in R14.1 can be constructed directly from R13.2/R13.4a and then used in the comparison, so printed layer order is not an additional dependency. R14.2 first supplies Jacobian, norm, polarization and Tate carriers without a rank-two claim. R14.3 proves the Hodge, comparison and rational rank-two results from that prefix. R14.4 applies the group/tree inputs to precisely specified level-change maps; R14.5 forms quotients; R14.6 exports the special-fibre and finite cover interfaces. The exact substitutions in the packet resolve broad cross-part references without a R14.2↔R14.3 cycle.

The [suggested file](../suggested/ModularCurvesPartII--R13.4b.lean) contains representative statements available at the pins: the split-Cartan ramification index and semistable-fibre genus count, finite HNF and degree arithmetic, the analytic Fricke formula, existing symmetric powers, ranges and coproducts of actual linear maps, eigencharacter kernels, degree-zero divisors and minus kernels. Its real-bodied definitions expose these choices. Missing modular curve, trace, Jacobian and cohomology carriers remain exact targets in this reader. The reader is definitive and the suggested file is not exhaustive.

## Layer R13.4b: generic-fibre and correspondence compatibility

The algebraic input is independent of analytic uniformization. Compare components, completed cusp parameters and actual maps before comparing their actions. The full and cyclic normalization choices survive every comparison.

### R13.4b.1 Generic components and cusp fields

Prove `TauCeti.ModularCurves.generic_component_comparison` with the following mathematical specification. After the algebraic construction, use R12.3/R12.6 to identify each generic-fibre component of X_H with the compactified analytic quotient for its determinant orbit. For honest full level n over ℚ the constant algebra is the cyclotomic determinant algebra; fixed pairing over ℚ(ζ_n) selects a component. A subgroup H descends these components by its determinant image. Identify the cusp residue fields and smoothing parameters from R13.3’s cyclotomic charts with the rational boundary points and widths in the analytic quotient. On the scalar-framed prime-p quotient, determinant classes modulo squares give exactly two complex components. No analytic comparison is used to construct X_H.

(bt16, §2.1, pp.713–714: The scalar quotient has two determinant-square-class components.) (conrad07, §4.3, Theorems 4.3.4 and 4.3.6–4.3.7, pp.38–42: Cyclotomic formal cusp fields and parameters fix the integral-to-generic comparison.)

Construct and prove this as follows. Apply the earlier component and uniformization theorem to the independently constructed normal curves. Identify generic formal parameters and residue fields using the Tate charts, including conjugation in d≤2 charts. Descend using the specified determinant action, rather than imposing geometric connectedness on full level.

**Checks.**

- Full level 5: four complex components before scalars, two after scalars, one after fixing an honest primitive pairing.

*Needs:* `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.4a/coarse-normalization-comparisons`; `ModularCurvesPartII:R13.3/gamma-one-twisted-tate-chart`; `ModularCurvesPartII:R13.4a/projective-scalar-coarse-quotient`; `ModularCurvesPartII:R12.3/compact-modular-uniformization`; `ModularCurvesPartII:R12.3/tate-and-cusp-parameter-agreement`; `ModularCurvesPartII:R12.3/cusp-fields-and-component-labels`; `ModularCurvesPartII:R12.6/canonical-generic-fibre-descent`; `ModularCurvesPartII:R12.6/component-fields-and-twisted-descent`; `ModularCurvesPartII:R12.6/generic-base-change-and-level-compatibility`.

### R13.4b.2 Compactified map comparison

Prove `TauCeti.ModularCurves.compactified_map_comparison` with the following mathematical specification. The compactified forgetful and quotient isogeny maps constructed algebraically agree under the generic-fibre comparison with their classical analytic degeneracy maps. On a Γ₁(N;p) chart, π₁ forgets the p-subgroup and π₂ quotients by it then contracts to the allowed level polygon. The generic analytic conventions are π₁(z)=z and π₂(z)=pz on the chosen standard branch. At every cusp compare the induced homomorphism of completed rings and the pullback of du/u. A map to a coarse curve factors by categorical universality, but finite flat stack legs do not automatically become finite flat coarse legs; descent uses the actual stabilizer action or a schematic locus where it is trivial.

(conrad07, Theorem 4.4.3, pp.43–46: The stack degeneracy maps are finite flat, including the boundary quotient construction.) (ribetstein, Chapter 5 §§5.1–5.2, pp.65–66,71–72: Analytic and algebraic moduli descriptions fix the two maps and their normalization.)

Construct and prove this as follows. Identify both maps on the elliptic dense open through the moduli quotient. Use generalized Tate charts and contraction for the boundary maps; retain the power factor on invariant differentials. Separate categorical existence of coarse maps from the finite-flat descent claim; use the finite-correspondence supplier and schematic locus when needed.

**Checks.**

- The two legs have different j coordinates. Extension is not obtained by pretending that π₂ is a map over the same j-line.

*Needs:* Generic components and cusp fields (`ModularCurvesPartII:R13.4b/generic-component-comparison`); Compactified Hecke degeneracy maps (`ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`); `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence-coarse`; `AlgebraicModuliForArithmeticGeometry:R09.5/tame-finite-flat-descent`.

### R13.4b.3 Hecke normalization and descent

Prove `TauCeti.ModularCurves.hecke_normalization_comparison` with the following mathematical specification. On characteristic-zero fibres the geometric pull–trace correspondences agree with the earlier classical Hecke action, with the differential factor of the universal isogeny included. For weight k, the finite-flat coherent trace is pT_p, not T_p; integrality of its division by p is a separate local theorem. For Picard and étale cohomology the action is the integral push–pull of the correspondence without division by its degree. The full-subgroup A_m and cyclic C_m have their separate degrees and repeated-prime relations. These identifications descend to the field of definition with the diamond and cyclotomic Atkin–Lehner conventions fixed.

(conrad07, §4.5, Theorem 4.5.1 and Example 4.5.3, pp.46–48: The geometric trace gives pT_p and the integral normalized operator is derived locally.) (ribetstein, Chapter 5 §5.1, pp.65–68; §5.2, pp.71–72: The geometric cohomological upper/lower conventions and comparison are explicit.)

Construct and prove this as follows. Compare the classical formula on the Tate cusp and use the imported analytic q-expansion determination. Use finite-flat trace, rather than a sum over distinct points, on ramified/inseparable charts. Descend the maps with their actual cyclotomic data and distinguish the two correspondence conventions.

**Checks.**

- For weight 2 at p∤N, the normalized coefficient formula is a_n(T_pf)=a_(np)(f)+p a_(n/p)(⟨p⟩f); the unnormalized coherent trace has an extra factor p.

*Needs:* Compactified map comparison (`ModularCurvesPartII:R13.4b/compactified-map-comparison`); Classical and geometric Hecke actions (`ModularCurvesPartII:R14.1/analytic-comparison-of-correspondences`); Full and cyclic isogeny correspondences (`ModularCurvesPartII:R14.1/full-and-cyclic-correspondences`); Integral coherent Hecke trace (`ModularCurvesPartII:R14.1/coherent-hecke-trace`).

### Examples

At full level 5 there are four determinant components over ℂ. Scalar change of frame multiplies determinants by squares, giving two components; fixing a primitive pairing selects one honest component. A comparison that declares all three models connected fails this example. For a cusp with parameter t=q^(1/d), check the actual homomorphism on t and the factor in du/u; equal generic degrees do not identify the two degeneracy legs.

### Dependencies

`ModularCurvesPartII:R13.4a`; `ModularCurvesPartII:R13.3`; `ModularCurvesPartII:R12.3`; `ModularCurvesPartII:R12.6`; `ModularCurvesPartII:R14.1`; `AlgebraicModuliForArithmeticGeometry:R09.5`. Individual target dependencies above give the finer contracts.

## Layer R13.5: bad fibres and regular/semistable models

Compute the local modular equations and their finite stabilizer actions, then apply the imported regular-resolution and semistable algorithms. Fine rigidified one-p-factor geometry is separated from wild coarse descent at 2 and 3. The prime-square calculation gives its stated nodal extension; it supplies no unproved formula for arbitrary higher powers.

### R13.5.1 Igusa components of modular fibres

Define `TauCeti.ModularCurves.igusaCover` with the following mathematical specification. Over a perfect field k of characteristic p, an Igusa pʳ structure on an ordinary elliptic curve E with prescribed prime-to-p level is a Drinfeld generator of ker(Vʳ:E^(pʳ)→E). On the ordinary locus ker Vʳ is étale cyclic of rank pʳ, so its generator cover has degree φ(pʳ) before the effective residual automorphism quotient. Compactify by normalizing the corresponding level curve in this generator cover. Keep the auxiliary rigidifying level when discussing ±1 and other automorphisms; Ig(p)/±1 and Ig(p)/C₄ in Edixhoven/BDMTV denote effective quotient level problems, not two arbitrary additional quotients of an already coarse curve. Γ₀ p-power mixed components, and the middle components after the p² extension, are identified with the relevant descended Igusa problems. Smoothness, ramification at supersingular points and small-p behavior are assertions proved by the local models, not part of a definition of an ordinary cover.

(edix90, §1.1.3, pp.34–35; §2.1, pp.55–56: The cyclic-component and p² semistable descriptions use auxiliary-level Igusa moduli.) (bdmtv19, §6.2, p.928; Theorems 6.5–6.6, pp.928–929: Igusa is defined through Verschiebung and the middle-component quotients are specified.)

The interface serves R20.3: Provides the geometric Igusa/Frobenius inputs for local weight calculations, not the residual Galois theorem; BDMTV Theorem 6.6: Identifies the two vertical Igusa/C₄ components.

Provide the following named interface results.

- `TauCeti.ModularCurves.igusaCover`: The ordinary Verschiebung-generator cover with auxiliary prime-to-p level.
- `TauCeti.ModularCurves.igusaCover_degree`: Its degree before stabilizer quotient is φ(pʳ).
- `TauCeti.ModularCurves.igusaCurve`: The normal compactification in the Igusa generic function field.
- `TauCeti.ModularCurves.igusaCurve_effectiveQuotient`: The quotient preserves the specified moduli problem and its residual effective action.
- `TauCeti.ModularCurves.igusaCurve_localModel`: The local generator ring identifies with the component chart from the universal cyclic deformation calculation.

Construct and prove this as follows. Define the ordinary generator cover using imported relative V and Drinfeld cyclicity. Normalize its compactification and descend along the actual auxiliary level and effective automorphism action. Use the p² local model below to compare the descended middle components.

**Checks.**

- `TauCeti.ModularCurves.igusaCover_firstLevel`: For p=5,r=1 a rigidified ordinary generator cover has degree 4, and the M=1 sign-class cover has degree 2.
- `TauCeti.ModularCurves.igusaCover_heightZero`: r=0 gives the trivial generator problem, not a φ(1)=0 cover.
- `TauCeti.ModularCurves.igusaCover_supersingular`: The étale-generator description on ordinary curves is not an étale cover at a supersingular point.
- For M=1 and p>3, the ordinary generator classes up to sign have generic degree (p−1)/2; an auxiliary rigidifier changes how this quotient is presented.

*Needs:* `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity`; `tauceti:TauCetiRoadmap/ModularCurves#7f-serretate-theory-with-level-structure`; `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`.

### R13.5.2 Γ₀ prime-power local models

Prove `TauCeti.ModularCurves.gamma_zero_prime_power_local_model` with the following mathematical specification. Let p>3, n≥1 and M≥1 with p∤M. The Γ₀(pⁿM) coarse special fibre has n+1 components indexed (a,b), a+b=n, each abstractly X₀(M)_𝔽p, of multiplicity φ(p^min(a,b)). All meet at every supersingular Γ₀(M) point and nowhere else; this intersection is not claimed to be transverse for n>1. Under an étale auxiliary rigidifier the completed surface ring at a relevant noncuspidal point is W[[x,y]]/(f₀+p u), u a unit, where W=W(k̄). At a supersingular point f₀=(x^(pⁿ)−y)(x−y^(pⁿ))∏_(a+b=n,a,b>0)(x^(p^(a−1))−y^(p^(b−1)))^(p−1); on the ordinary mixed (a,b) component f₀=(x^(p^(a−1))−y^(p^(b−1)))^(p−1). These x,y are local moduli of source and target; the component-to-j maps may involve Frobenius. The all-N component/multiplicity statement extends to p=2,3 as the Katz–Mazur/Edixhoven cyclic-deformation target, but its wild invariant-ring/resolution calculation is the separate recorded gap.

(edix90, §1.1.3–1.1.5, pp.34–36: The component multiplicities and explicit f₀ deformation rings are stated before the tame invariant-ring resolution.) (grosszagier, Chapter III §1, pp.254–255: The arbitrary-level component/multiplicity input is used for intersection theory; its regularity locus needs the correction below.)

Construct and prove this as follows. Express cyclic pⁿ-subgroups in the imported Drinfeld deformation of the elliptic curve and its isogeny; split by connected/étale type a,b. Use the source/target deformation coordinates to obtain the displayed f₀ and unit p-term. Descend the auxiliary rigidifier with its stabilizer action. Read multiplicities from f₀, retaining possible inseparable component maps. At 2 or 3 keep the component target but do not apply the tame quotient criterion; the wild calculation is recorded as an unresolved input.

**Checks.**

- n=1 gives two reduced components, local f₀=(xᵖ−y)(x−yᵖ).
- n=2 has multiplicities 1,p−1,1; for p=5 these are 1,4,1, so the coarse fibre is not reduced.

*Needs:* `ModularCurvesPartII:R13.4a/integral-coarse-curves`; Igusa components of modular fibres (`ModularCurvesPartII:R13.5/igusa-components`); `tauceti:TauCetiRoadmap/ModularCurves#7g-the-three-characteristic-p-calculations`; `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity`.

### R13.5.3 The corrected coarse singular locus

Prove `TauCeti.ModularCurves.corrected_coarse_singular_locus` with the following mathematical specification. For p>3, p∤M and n≥1, a noncuspidal point of the integral Γ₀(pⁿM) coarse surface is singular exactly when its elliptic pair has automorphisms beyond ±1 and it is either supersingular or lies on a mixed (a,b) component with a,b>0. Cusps are regular. The extra automorphism condition concerns the pair (E,C_M), not just the value j=0 or 1728. Ordinary points with a=0 or b=0 are smooth over ℤ_p. This corrects the supersingular-only exception in Gross–Zagier III Proposition (1.4); no identical criterion is claimed at p=2 or 3.

(edix90, §1.1.3–1.1.5 and Theorem 1.1.4.1, pp.34–36; §§1.3.2–1.3.6, pp.39–46: The candidates are extra-automorphism supersingular or ordinary mixed points, and the explicit actions give the exact locus.) (grosszagier, Chapter III Proposition (1.4), p.255: The printed exception omits ordinary mixed points; its statement is used only in the corrected form.)

Construct and prove this as follows. Outside this locus an auxiliary quotient is étale or acts by pseudo-reflections on the regular deformation ring. At the stated isolated extra-automorphism points compute the effective order-2 or order-3 action on the two local moduli; it is not generated by pseudo-reflections. Apply the supplied tame invariant-ring criterion and the independent cusp regularity theorem.

**Checks.**

- At p=5,M=1,n=2 the ordinary j=1728 point on (1,1) is singular although it is not supersingular.

*Needs:* Γ₀ prime-power local models (`ModularCurvesPartII:R13.5/gamma-zero-prime-power-local-model`); `ModularCurvesPartII:R13.4a/coarse-cusp-regularity`; `AlgebraicModuliForArithmeticGeometry:R09.5`.

### R13.5.4 Regular resolutions of modular fibres

Define `TauCeti.ModularCurves.modularRegularResolution` with the following mathematical specification. For p>3 and p∤M construct the minimal regular resolution of the Γ₀(pⁿM) coarse surface at p from the preceding local rings. Resolve the effective order-2/3 stabilizer action by equivariant blowups until each fixed point has pseudo-reflection cotangent action; take the tame quotient and contract the resulting exceptional −1 curves. For j=1728 the order-2 action on source/target parameters is (x,y)↦(−x,−y); one blowup yields a regular quotient with one exceptional rational curve of self-intersection −2. For j=0 supersingular and n even, the effective order-3 action has equal eigencharacters and one blowup gives one exceptional −3 curve. For j=0 supersingular and n odd, the eigencharacters are inverse; blow up the two remaining fixed points and contract the resulting −1 curve, leaving two exceptional −2 curves. Ordinary mixed points use the corresponding a>b,a=b,a<b variants. Export every component’s multiplicity and intersections by total-transform valuations and F·C=0, not just the reduced incidence graph. General blowups, intersection theory and minimal-model contractions are StableReduction’s.

(edix90, §§1.3.1–1.3.6 and algorithm §1.4, pp.38–48: The local actions, blowup charts and exceptional configurations give the all-prime-power tame modular resolution algorithm.)

The interface serves Gross–Zagier Chapter III: Provides the regular model and fibre intersection data; R13.6: Exports the labelled modular graph and component maps.

Provide the following named interface results.

- `TauCeti.ModularCurves.modularRegularResolution`: The proper birational regular model with its identified generic fibre.
- `TauCeti.ModularCurves.modularRegularResolution_exceptional`: Its exceptional divisors have recorded genus, multiplicity, self-intersection and attachment maps.
- `TauCeti.ModularCurves.modularRegularResolution_fibre`: The total special fibre equals the pullback of the coarse fibre with computed valuations.
- `TauCeti.ModularCurves.modularRegularResolution_minimal`: No exceptional −1 curve over the resolved surface remains.
- `TauCeti.ModularCurves.modularRegularResolution_baseChange`: Flat unramified base change transports charts and the resolution; a ramified change requires normalization and a fresh regularity check.

Construct and prove this as follows. Start with the explicit regular rigidified deformation ring and the effective stabilizer representation. Substitute y=xv or x=yu in f₀+p u and compute valuations; repeat at the fixed points specified in §§1.3.2–1.3.6. Take invariants only after pseudo-reflection regularity is verified; contract the indicated −1 curve in the order-3 inverse-character case. Determine multiplicities and intersection matrix from the total transform and F·C=0; glue with the unchanged regular cusp and ordinary outer charts.

**Checks.**

- `TauCeti.ModularCurves.modularRegularResolution_noExtra`: A regular point with trivial effective stabilizer is unchanged.
- `TauCeti.ModularCurves.modularRegularResolution_orderTwo`: The effective −1 action on both parameters contributes one −2 exceptional component.
- `TauCeti.ModularCurves.modularRegularResolution_notSemistable`: For n=2,p=5 the regular model still has a component of multiplicity 4; regularity does not imply reduced semistability.
- The resolution of the p=5 ordinary mixed j=1728 point contains a −2 rational exceptional curve; ignoring ordinary singularities misses it.

*Needs:* Γ₀ prime-power local models (`ModularCurvesPartII:R13.5/gamma-zero-prime-power-local-model`); The corrected coarse singular locus (`ModularCurvesPartII:R13.5/corrected-coarse-singular-locus`); `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

### R13.5.5 One-factor mixed-level models

Prove `TauCeti.ModularCurves.one_factor_mixed_level_model` with the following mathematical specification. For p∤M and M≥5, the compactified Γ₁(M)∩Γ₀(p) model over ℤ[1/M] has geometric fibre at p consisting of two copies of X₁(M)_𝔽p meeting at the supersingular Γ₁(M) points. On the fine rigidified locus the complete node equation is uv=p up to a unit, hence this is a regular semistable model. The components classify the Frobenius and Verschiebung choices and their maps to X₁(M) include the corresponding Frobenius/diamond transports. For Γ₀(Mp) remove the auxiliary rigidifier and use the tame or wild stabilizer quotient, resolving before using a semistable graph; a coarse extra-automorphism intersection can have higher thickness. For M<5 retain the stack/rigidified statement and descend with the explicit stabilizer analysis, rather than asserting a fine scheme. The cases needed by R20 are listed in the reader, including p=2,3 with p∤M.

(ribetstein, §3.9, pp.44–46, Figure 3 and sequence (3.1): The mixed-level fibre consists of two lower-level copies meeting at supersingular points and supplies the Jacobian degeneration.) (conrad07, Theorem 4.4.3, pp.43–46: Compactified mixed Γ₁-level maps and generalized quotient moduli are finite flat.)

Construct and prove this as follows. Use the cyclic p-subgroup deformation on the fine prime-to-p curve to split the special fibre into Frobenius and Verschiebung components. At a supersingular point the two local branches give the smoothing uv=p; retain the lower-level marking in the component maps. Apply the coarse quotient/resolution separately when an effective stabilizer survives; small-level/wild descent belongs to the recorded gap.

**Checks.**

- At p=2 with M=5 the fine Γ₁(M) marking removes elliptic automorphisms; this is not the same claim as tame coarse Γ₀(10) descent.

*Needs:* Γ₀ prime-power local models (`ModularCurvesPartII:R13.5/gamma-zero-prime-power-local-model`); `ModularCurvesPartII:R13.4a/integral-coarse-curves`; Compactified Hecke degeneracy maps (`ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`); `tauceti:TauCetiRoadmap/ModularCurves#8c-the-axiomatic-isomorphism-theorem-and-the-rings-of-63`.

### R13.5.6 Prime-square semistable modular models

Define `TauCeti.ModularCurves.primeSquareModel` with the following mathematical specification. For p>3, p∤M and an étale auxiliary rigidifying prime-to-p level, over W(k̄)[ϖ] with ϖ^((p²−1)/2)=p construct the proper normal nodal model of X₀(p²M) supplied by Edixhoven §2.1. It has two outer vertical lower-level components and two middle descended Igusa p-components, and a horizontal component over each supersingular lower-level point. With effective automorphism order 1,2,3 the horizontal smooth completion has equation y^((p+1)/e)=x(x−1)^(p−1), with e respectively 1,2,3; these are equations for the normal smooth projective completions, not claims that the affine plane equation is nonsingular. Attachments are at the designated points over 0,1,∞. The quotient by auxiliary level and its effective stabilizers gives the stated coarse modular model. Stabilization or minimal regular resolution uses StableReduction under its genus hypotheses; this nodal model need not itself be stable.

(edix90, §2.1, pp.55–56; §§2.2–2.4, pp.56–65: The explicit extension, horizontal equations, vertical Igusa components and quotient gluing give the p² nodal model.)

The interface serves BDMTV Theorem 6.5: Provides the explicit prime-square semistable fibre and Fricke action; R13.6: Computes graphs and Jacobian/nearby-cycle inputs.

Provide the following named interface results.

- `TauCeti.ModularCurves.primeSquareModel`: The nodal model with its generic-fibre identification over W[ϖ].
- `TauCeti.ModularCurves.primeSquareModel_vertical`: Two outer and two middle components, four vertical components in total, on the auxiliary rigidified presentation.
- `TauCeti.ModularCurves.primeSquareModel_horizontal`: The normalized horizontal curve and its attachment points for each effective automorphism type.
- `TauCeti.ModularCurves.primeSquareModel_quotient`: Auxiliary-level descent retains the effective stabilizer quotient and nodal charts.
- `TauCeti.ModularCurves.primeSquareModel_stabilize`: Its stable contraction agrees with the imported stabilization, when the genus/marking hypotheses hold.

Construct and prove this as follows. Base change and normalize the rigidified cyclic p² model over the displayed extension. Compute the supersingular charts as in §2.2; normalize their plane equations and compare the overlap maps. Glue to the ordinary Igusa charts and take the specified effective stabilizer quotient; use §2.4 for nodalness. Use the existing stabilization theorem only where its genus/marking conditions apply.

**Checks.**

- `TauCeti.ModularCurves.primeSquareModel_extensionThirteen`: p=13 gives ϖ⁸⁴=13.
- `TauCeti.ModularCurves.primeSquareModel_extraAutomorphisms`: At a supersingular j=0 with effective order 3, the horizontal exponent is (p+1)/3, not p+1.
- `TauCeti.ModularCurves.primeSquareModel_generic`: The generic fibre remains X₀(p²M), with the original two j-invariant maps.
- `TauCeti.ModularCurves.primeSquareModel_vertical_count`: The auxiliary presentation has two outer and two middle vertical components, total four. A six-component vertical list is rejected.
- A rational component with fewer than three special points can be present in this semistable model; it is contracted in the stable model when stabilization applies.

*Needs:* Regular resolutions of modular fibres (`ModularCurvesPartII:R13.5/tame-regular-resolution`); Igusa components of modular fibres (`ModularCurvesPartII:R13.5/igusa-components`); `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`; `tauceti:TauCetiRoadmap/StableReduction#layer-8-canonical-contraction-and-unpointed-stable-reduction`.

### R13.5.7 Split Cartan semistable fibres

Prove `TauCeti.ModularCurves.split_cartan_semistable_model` with the following mathematical specification. Let ℓ=12k+1 be prime and W=W(𝔽̄_ℓ). Over W[ϖ], ϖ^(12k(6k+1))=ℓ, X₀(ℓ²) has k horizontal curves u²=v^(ℓ+1)+1, and four vertical curves, two rational and two Ig(ℓ)/±1. Each horizontal meets each vertical once, with no other intersections. Fricke fixes each horizontal via (u,v)↦(u,−v), exchanges the rational verticals and preserves the two Igusa verticals. Its tame quotient is a proper nodal model of X_s(ℓ): k horizontals u²=v^(6k+1)+1 of genus 3k, one rational vertical and two Ig(ℓ)/C₄ verticals of genus (k−1)(3k−2)/2. Its dual graph is K_(k,3); hence b₁=2k−2 and g=6k²−3k. The chosen equation ϖ^((ℓ²−1)/2)=ℓ implies ϖ^(ℓ²−1)=ℓ². The squared equation alone also allows ϖ^((ℓ²−1)/2)=−ℓ; recover the chosen extension only with the specified root choice, not by treating the two polynomial equations as equivalent.

(bdmtv19, §6.2, Theorems 6.5–6.6 and their proof, pp.928–929: The explicit fibre, Fricke action, tame quotient, component genera and incidence are all stated with ℓ≡1 modulo 12.)

Construct and prove this as follows. Specialize the prime-square model to ℓ≡1 mod 12, where no supersingular j=0,1728 correction occurs. Use Fricke action from the source, and tame invariant base change to identify the quotient special fibre. The horizontal quotient replaces v² by its coordinate; the Igusa quotient is the effective C₄ level quotient. Compute genera by the double-cover branch count and the imported nodal genus formula.

**Checks.**

- k=1 gives one genus-3 horizontal and three rational vertical leaves; k=3 (ℓ=37) gives total genus 45.

*Needs:* Prime-square semistable modular models (`ModularCurvesPartII:R13.5/prime-square-semistable-model`); `ModularCurvesPartII:R13.4a/split-cartan-quotient`; `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

### R13.5.8 Good reduction of the level-13 curve

Prove `TauCeti.ModularCurves.split_cartan_thirteen_good_reduction` with the following mathematical specification. The split Cartan normalizer curve X_s(13) has good reduction at every prime other than 13 and acquires good reduction over Frac(W(𝔽̄₁₃)[ϖ]), ϖ⁸⁴=13. At 13 the k=1 semistable model above has a genus-3 horizontal u²=v⁷+1 with three rational leaves; contracting those leaves gives a smooth proper model. Away from 13 use the first Baran plane quartic on BDMTV p.930: (−Y−Z)X³+(2Y²+YZ)X²+(−Y³+Y²Z−2YZ²+Z³)X+2Y²Z²−3YZ³=0. It is smooth over ℤ[1/13], including at 2. The second quartic obtained by the determinant-2 substitution in the source is only smooth away from 2 and 13 and cannot prove the claim at 2.

(bdmtv19, Corollary 6.7, p.929 and first Baran model in §6.3, p.930: The semistable fibre proves potential good reduction at 13; the first integral equation provides the away-from-13 assertion.)

Construct and prove this as follows. For ℓ=13 specialize the stated quotient graph; contract the three genus-zero leaves using the existing surface contraction theorem. Verify smoothness of the resulting genus-3 fibre and generic-fibre identification. For primes other than 13 apply the Jacobian criterion to the first homogeneous quartic, with all projective charts, including characteristic 2. Check the first quartic at 2 directly. On Z=1 the three derivative equations force t=Y+1≠0, X=t³+1, g=t⁷+t³+1=0 and F=t¹⁰+1. The Bézout identity (t⁹+t⁸+t⁷+t³+t²+t+1)g+(t⁶+t⁵+t⁴+t²+t)(t¹⁰+1)=1 rules out a singular point over the algebraic closure. On Z=0 the derivatives force X=Y≠0 but F_Z=X³≠0.

**Checks.**

- The Jacobian has toric rank zero after the extension because the graph is a tree; a tree alone would not prove smoothness without contracting the leaves.
- The determinant-2 change of plane coordinates is not an integral isomorphism at 2.

*Needs:* Split Cartan semistable fibres (`ModularCurvesPartII:R13.5/split-cartan-semistable-model`); `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`.

### Examples

For p=5 and N=25, the ordinary mixed (1,1) point with j=1728 has the effective action (x,y)↦(−x,−y). Its invariant ring is singular, even though the point is not supersingular. This detects the omitted ordinary locus. At ℓ=13 the stated extension has ramification (13²−1)/2=84; the split-Cartan graph is K_(1,3), with b₁=0. The genus-3 central component meets three rational leaves, which are contracted to obtain good reduction. For the first Baran quartic F at 2, work on Z=1. The equation F+X∂_XF=Y(X+1)² shows that a singular point has Y=0 or X=1. If Y=0, ∂_XF=X²+1 forces X=1 and ∂_YF=1 contradicts singularity. If X=1, ∂_YF=Y²+1 forces Y=1 and ∂_XF=1 gives the same contradiction. On Z=0, the X and Y partials force X=Y≠0, while ∂_ZF=X³≠0. This proves geometric smoothness at 2, rather than just absence of F₂-rational singular points. The second model’s coordinate change has determinant 2 and cannot prove this claim.

### Dependencies

`ModularCurvesPartII:R13.4a`; `ModularCurvesPartII:R13.1`; `tauceti:TauCetiRoadmap/ModularCurves#7f-serretate-theory-with-level-structure`; `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`; `tauceti:TauCetiRoadmap/ModularCurves#7g-the-three-characteristic-p-calculations`; `AlgebraicModuliForArithmeticGeometry:R09.5`; `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`; `ModularCurvesPartII:R14.1`; `tauceti:TauCetiRoadmap/ModularCurves#8c-the-axiomatic-isomorphism-theorem-and-the-rings-of-63`; `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`; `tauceti:TauCetiRoadmap/StableReduction#layer-8-canonical-contraction-and-unpointed-stable-reduction`; `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`. Individual target dependencies above give the finer contracts.

## Layer R13.6: boundary and degeneration outputs

Export concrete model data for the lower general graph, Néron and nearby-cycle theories. Integral character groups and component groups retain the weighted edge pairing, while the displayed monodromy filtration is rational.

### R13.6.1 Modular dual graphs and thicknesses

Define `TauCeti.ModularCurves.modularGraph` with the following mathematical specification. Attach to each specified semistable modular model its imported labelled dual multigraph, retaining the normalized component, each pair of branches, node thickness, residue-field action, marked cusp section and its R13.3 parameter. For a fine one-factor Γ₁(M)∩Γ₀(p) model the graph has two vertices and one edge per supersingular marked elliptic curve, so for s geometric nodes b₁=s−1. For the ℓ² split Cartan model the graph is K_(k,3), with the component genera above. A nonreduced coarse pⁿ fibre is instead exported as a weighted intersection configuration until a stated reduced nodal model is chosen; it is not a semistable dual graph. An n-gon has n edges, also for n=1 (a loop) and n=2 (two parallel edges).

(ribetstein, §3.9, Figure 3 and sequence (3.1), pp.45–46: The two-component geometry supplies the graph input to the character group.) (bdmtv19, Theorem 6.6 and Figure 1, pp.928–929: The split Cartan incidence has k horizontal and three vertical vertices.) (edix90, §1.4, pp.47–48; §2.1, pp.55–56: Weighted regular configurations and nodal p² models are distinct.)

The interface serves R11.4 and R20: Supplies the actual character lattice geometry; Lower-tier LPV.7: Instantiates the general normalization and nearby-cycle sequences.

Provide the following named interface results.

- `TauCeti.ModularCurves.modularGraph`: The imported graph attached to the supplied modular model and base.
- `TauCeti.ModularCurves.modularGraph_components`: The normalized component curves, genera and residue action.
- `TauCeti.ModularCurves.modularGraph_nodes`: The two branch flags at each node and its positive thickness.
- `TauCeti.ModularCurves.modularGraph_cusps`: The cusp sections with component labels and formal parameter maps.
- `TauCeti.ModularCurves.modularGraph_modelComparison`: A regular semistable resolution subdivides an edge according to its thickness without changing the generic curve.

Construct and prove this as follows. Choose the exact proper model and base from R13.5 and use the imported graph construction. Read branch incidences and thickness from its completed local charts; mark cusp sections via the cyclotomic chart maps. Compute the graph ranks without removing loops or parallel edges; export weighted coarse configurations separately.

**Checks.**

- `TauCeti.ModularCurves.modularGraph_twoParallel`: A 2-gon has two parallel edges and b₁=1, not a single edge and b₁=0.
- `TauCeti.ModularCurves.modularGraph_thirteen`: For X_s(13) the graph is a three-leaf tree and Σ g_v=3.
- `TauCeti.ModularCurves.modularGraph_nonReduced`: The multiplicity-4 middle component of X₀(25) cannot be silently entered as a reduced nodal component.
- `TauCeti.ModularCurves.modularGraph_subdivision`: Resolving a thickness-n edge by a chain increases both edge and vertex counts by n−1, so H₁ rank is unchanged.
- At ℓ=13 the quotient graph is K_(1,3), b₁=0; at ℓ=37 it is K_(3,3), b₁=4.

*Needs:* One-factor mixed-level models (`ModularCurvesPartII:R13.5/one-factor-mixed-level-model`); Regular resolutions of modular fibres (`ModularCurvesPartII:R13.5/tame-regular-resolution`); Split Cartan semistable fibres (`ModularCurvesPartII:R13.5/split-cartan-semistable-model`); `ModularCurvesPartII:R13.3/gamma-zero-prime-power-cusp-rings`; `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`.

### R13.6.2 Character groups of modular bad fibres

Prove `TauCeti.ModularCurves.modular_character_group_interface` with the following mathematical specification. For a proper regular semistable model C/R specified above, apply R11.4 to its nodal special fibre Y. The identity fibre of the Néron model of Jac(C_K) has torus T with character lattice H₁(Γ,ℤ), and abelian quotient ∏_v Jac(Ỹ_v). The monodromy pairing is the thickness-weighted edge pairing on the cycle lattice. Reorienting an edge changes its coordinate sign, not the intrinsic lattice or pairing. For the fine two-component one-factor model, H₁ is the degree-zero subgroup of the free lattice on its s supersingular marked points. The coarse Γ₀ model requires the resolved thicknesses/automorphism weights; it is not obtained by ignoring the stabilizers.

(ribetstein, §3.9, sequence (3.1) and character description, pp.45–46; §3.10.2, pp.47–48: The modular application of the torus/abelian exact sequence is used by level lowering.) (bdmtv19, Theorem 6.6, p.929: The explicit quotient geometry provides its modular genus and toric-rank example.)

Construct and prove this as follows. Use the imported normalized Picard/Néron comparison for the exact semistable model. Identify the cycle lattice with the kernel of its signed incidence map, and apply the imported weighted edge pairing. In the two-vertex graph the incidence map is the degree sum on supersingular edges, giving the augmentation kernel.

**Checks.**

- For X_s(13) after ϖ⁸⁴=13 the torus vanishes and the abelian quotient is the genus-3 horizontal Jacobian.
- For K_(3,3) the character lattice has rank 4, not rank equal to its 9 nodes.

*Needs:* Modular dual graphs and thicknesses (`ModularCurvesPartII:R13.6/modular-dual-graphs`); `NeronModelsAndSemistableAbelianVarieties:R11.4/characters-graph-homology`; `NeronModelsAndSemistableAbelianVarieties:R11.4/normalization-exact-sequence`; `NeronModelsAndSemistableAbelianVarieties:R11.4`.

### R13.6.3 Nearby cycles of modular nodal models

Prove `TauCeti.ModularCurves.modular_nearby_cycle_interface` with the following mathematical specification. For a specified proper nodal semistable modular model over a henselian trait, ℓ distinct from the residue characteristic, import the LPV.7 normalization and specialization sequences. With Γ its geometric graph and Ỹ its normalization, they give 0→H¹(Γ,ℚ_ℓ)→H¹(Y,ℚ_ℓ)→H¹(Ỹ,ℚ_ℓ)→0 and 0→H¹(Y,ℚ_ℓ)→H¹(C_K̄,ℚ_ℓ)→H₁(Γ,ℚ_ℓ)(−1)→0. Retain residue Galois action and the distinction H¹ versus H₁. The monodromy graded pieces are graph cohomology, component H¹, and twisted graph homology; no canonical splitting is asserted. Finite trait extension of ramification e multiplies the twisted monodromy by e and an old edge of thickness n becomes e n unit edges in a regular resolution. This is a modular instantiation of lower-tier LPV, replacing the upward prerequisite on WeightsInEtaleCohomology R34.3.

(ribetstein, §3.9, pp.45–46: The specific nodal modular model supplies the geometric input; the general étale theorem is imported from LPV.) (bdmtv19, Theorems 6.5–6.6, pp.928–929: The explicit proper nodal models supply a second modular instance.)

Construct and prove this as follows. Verify the exact model’s properness, smooth generic fibre and reduced nodal special fibre before using LPV. Apply the lower-tier normalization and specialization statements with their branch coordinates and Galois actions. Use the LPV choice/base-change comparison for subdivision and ramification; do not apply this theorem to an unreduced coarse fibre.

**Checks.**

- For the level-13 good model Γ is a tree, so graph terms vanish and generic H¹ is the horizontal H¹.
- A thickness-2 node after ramification 3 gives six unit edges; replacing it by only three would give the wrong pairing.

*Needs:* Modular dual graphs and thicknesses (`ModularCurvesPartII:R13.6/modular-dual-graphs`); `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-normalization-cohomology`; `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-specialization-sequence`; `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-monodromy-filtration`; `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/curve-choice-basechange-compatibility`.

### R13.6.4 Degeneracy maps on modular components

Prove `TauCeti.ModularCurves.degeneracy_on_components` with the following mathematical specification. For the one-factor fine Γ₁(M)∩Γ₀(p) special fibre, identify the two components by the Frobenius and Verschiebung subgroups, retaining transported level points. With lower-level point x=(E,P), the Frobenius component has (π₁,π₂)=(id,F), where F sends (E,P) to (E^(p),P^(p)); on the Verschiebung component π₂ is the identity and π₁ is F followed by the inverse diamond transport needed to send the quotient marked point back to P. Thus the ordinary quotient sum is (E^(p),P^(p))+p(E^(p⁻¹),pP^(p⁻¹)), with the p multiplicity coming from the inseparable leg. Prime-to-level Hecke correspondences act on supersingular marked edges by quotient isogenies and their actual multiplicities; reversing the legs gives the polarization-dual action on the cycle lattice. After a coarse quotient or resolution use the induced branch and thickness maps, rather than transporting a map of sets alone.

(ribetstein, Chapter 5 §5.3, pp.77–79; §3.9, pp.45–46: The ordinary subgroup closures give Frobenius plus the p-multiple inverse-Frobenius/diamond branch; the degeneration is Hecke invariant.)

Construct and prove this as follows. Label the connected subgroup by ker F and the étale subgroup by ker V, with the correct marked-point quotient. Read the component maps and inseparable degree from the universal isogeny; the ordinary divisor formula fixes the inverse diamond transport. Extend from the ordinary dense locus through the integral component maps and nodal branch data; apply the imported Picard/graph functoriality. The oldspace and transposed character-group matrices are consumers in R20; do not reconstruct their exact-sequence theory here.

**Checks.**

- For Γ₀ level the diamond is trivial and the special correspondence is Frobenius plus transpose Frobenius, with scheme multiplicities.
- Do not give the same matrix [[T_q,q],[−1,0]] to Jacobians and character groups: the latter uses [[T_q,−1],[q,0]] in R20’s conventions.

*Needs:* Modular dual graphs and thicknesses (`ModularCurvesPartII:R13.6/modular-dual-graphs`); Compactified Hecke degeneracy maps (`ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`); Diamond operators (`ModularCurvesPartII:R14.1/diamond-operators`); Full and cyclic isogeny correspondences (`ModularCurvesPartII:R14.1/full-and-cyclic-correspondences`); Character groups of modular bad fibres (`ModularCurvesPartII:R13.6/modular-character-group-interface`).

### Examples

A connected two-vertex graph with s parallel edges has H₁ of rank s−1. For s=1 the torus rank is zero, while s=2 gives rank one. A loop contributes one generator; replacing the multigraph by a simple graph loses it. Multiplying all node thicknesses by a ramification index e multiplies the monodromy pairing by e and can change the integral component-group cokernel even when rational ranks agree.

### Dependencies

`ModularCurvesPartII:R13.5`; `ModularCurvesPartII:R13.3`; `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`; `NeronModelsAndSemistableAbelianVarieties:R11.4`; `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves`; `ModularCurvesPartII:R14.1`. Individual target dependencies above give the finer contracts.

## Layer R14.1: algebraic Hecke correspondences

Define the middle level problem and both legs, rather than their set-theoretic image. Keep contraction, stabilizer action, subgroup multiplicity and universal-isogeny differential factors. The integral coherent trace and the cohomological trace are distinct operations.

### R14.1.1 Compactified Hecke degeneracy maps

Define `TauCeti.ModularCurves.heckeLevelStack` with the following mathematical specification. For N≥1 and a prime p, the disjoint Γ₁(N;p) level stack parametrizes a Γ₁(N) structure and an order-p cyclic subgroup disjoint from its marked divisor in the required generalized-curve sense. Its two maps to Γ₁(N) forget the subgroup or quotient by it and contract the polygon to restore the ample marked divisor. Both stack maps are representable finite flat over ℤ, of degree p+1 if p∤N and p if p∣N. Their universal isogeny induces ξ:π₂*ω→π₁*ω. For squarefree q use the analogous Γ₁(N;q) disjoint level problem and finite-flat legs. In characteristic zero these are the customary curve correspondences. Coarse finite flatness is asserted only after its own descent check; it does not follow just from stack finite flatness.

(conrad07, Theorem 4.4.3, pp.43–46: Both maps and the universal differential extend over the compactification, with the disjoint level condition.) (ces17, Lemma 4.7.1, p.49: The squarefree version is finite flat also when q and N share primes.) (ribetstein, Chapter 5 §5.2, pp.71–72: The degree is p+1 or p according to p∤N or p∣N.)

The interface serves Conrad07 §4.5: Defines the coherent trace whose division by p needs a theorem; R14.2 and R13.6: Supplies Jacobian push–pull and special-fibre maps.

Provide the following named interface results.

- `TauCeti.ModularCurves.heckeLevelStack`: The disjoint compactified level stack with its universal quotient isogeny.
- `TauCeti.ModularCurves.degeneracy1`: Forget the p-subgroup then contract the allowed polygon.
- `TauCeti.ModularCurves.degeneracy2`: Quotient by the subgroup then contract, retaining the transported level point.
- `TauCeti.ModularCurves.degeneracyDegree`: The rank of either finite-flat stack leg is p+1 or p as specified.
- `TauCeti.ModularCurves.degeneracyHodgeMap`: The isogeny differential ξ extends over every cusp and equals the power-map differential on multiplicative charts.

Construct and prove this as follows. Use the R13.2 disjoint Drinfeld level stack, not an arbitrary subgroup pair on a degenerate polygon. Form the quotient generalized curve and contract; use the formal power isogeny at multiplicative cusps. Apply the cited finite-flat moduli theorem over ℤ and compute generic degree. On any coarse model verify the separate descent hypotheses.

**Checks.**

- `TauCeti.ModularCurves.degree_degeneracy_coprime`: N=11,p=2: degree 3, the three lines of E[2].
- `TauCeti.ModularCurves.degree_degeneracy_dvd`: N=10,p=5: degree 5; the level-intersecting subgroup is excluded.
- `TauCeti.ModularCurves.degeneracy_boundary`: On the multiplicative-kernel cusp, ξ sends du/u to p du/u, even when its residue is zero.
- `TauCeti.ModularCurves.degeneracy_point_count`: The purely inseparable ordinary branch has one geometric preimage with rank p, so counting points gives the wrong trace.
- N=11,p=2 gives degree 3; N=10,p=5 gives degree 5.
- In characteristic p a leg can be inseparable on one component. Counting geometric points is not a degree computation.

*Needs:* `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.3/formal-level-cusp-charts`; `ModularCurvesPartII:R13.3/tate-power-isogeny`; `ModularCurvesPartII:R13.2/gamma-level-structures`; `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin`; `ModularCurvesPartII:R13.2/small-level-and-dm-boundaries`; `ModularCurvesPartII:R13.2/contraction-maps-between-levels`; `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`; `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence`; `AlgebraicModuliForArithmeticGeometry:R09.5/finite-correspondence-coarse`.

### R14.1.2 Diamond operators

Define `TauCeti.ModularCurves.diamond` with the following mathematical specification. For a∈(ℤ/N)×, I_a sends (E,P) to (E,aP) on the compactified Γ₁(N) problem, with the necessary contraction on generalized curves. It preserves the coarse curve over ℤ and the Hodge sheaf via the identity on E. The stack action is the whole unit group. On a coarse curve I_−1 is the identity through the isomorphism [−1] of marked curves, but that same isomorphism acts as −1 on ω; weight-k descent therefore requires the appropriate sign/character. I_a I_b=I_ab. On Γ₀(N) every diamond is trivial. Do not identify the Hodge action with a trivial coarse action when k is odd.

(conrad07, §4.4, pp.42–43, Lemma 4.4.1: Diamond-invariant forms and the descent of ω retain stabilizer action.) (ribetstein, Chapter 5 §5.1, pp.65–66; §5.2, p.71: The geometric diamond convention and its cohomological action are fixed.)

The interface serves R14.1 and R14.2: Determines repeated-prime terms, adjoints and Galois conventions.

Provide the following named interface results.

- `TauCeti.ModularCurves.diamond`: Compactified automorphism I_a and its Hodge identification.
- `TauCeti.ModularCurves.diamond_mul`: Composition follows multiplication of units.
- `TauCeti.ModularCurves.diamond_inv`: I_(a⁻¹) is inverse.
- `TauCeti.ModularCurves.diamond_minusOne`: I_−1 is trivial on the coarse curve but has sign −1 on the Hodge fibre.
- `TauCeti.ModularCurves.diamond_baseChange`: Formation commutes with the legal base changes of the moduli problem.

Construct and prove this as follows. Change the Drinfeld marked point by a unit; the ample divisor and contraction are preserved. Use the inverse unit for inverse and the product for composition. Track the differential of [−1] when the underlying coarse map becomes identity.

**Checks.**

- `TauCeti.ModularCurves.diamond_group_order_11`: φ(11)/2=5 for the coarse unit quotient.
- `TauCeti.ModularCurves.diamond_minusOne_hodge`: Weight one with trivial character cannot descend by asserting I_−1 acts trivially on ω.
- `TauCeti.ModularCurves.diamond_gammaZero`: On Γ₀(N) the curve diamond maps are identity.
- `TauCeti.ModularCurves.diamond_product`: I_2 I_3=I_6 for N=11, including the boundary.
- N=11 gives an effective unit quotient of order 5 on X₁(11); N=3 gives a genus-zero coarse curve, whose Jacobian action is trivial.

*Needs:* `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.3/formal-level-cusp-charts`; `ModularCurvesPartII:R13.1/contraction-away-from-a-divisor`.

### R14.1.3 Cyclotomic Fricke involution

Define `TauCeti.ModularCurves.atkinLehner` with the following mathematical specification. For N≥5 over ℤ[1/N,ζ_N], with ζ_N primitive, construct w_ζ on X₁(N) by quotienting E by ⟨P⟩ and choosing the dual-kernel generator determined by e_N(P,Q)=ζ_N. Extend by the generalized quotient/contraction at cusps. On the coarse curve w_ζ²=id and w_(ζ^a) w_ζ=I_a (the point inversion in the double quotient is already trivial on the coarse curve). Thus w_ζ=w_(ζ⁻¹) on this curve, and it descends to the real cyclotomic base ℤ[1/N,ζ_N+ζ_N⁻¹]. Galois acts by g w_ζ g⁻¹=w_(gζ). It is not generally defined over ℚ. The prime Γ₀(N) integral normalization extension over ℤ[1/N] is Layer 10’s existing construction.

(ribetstein, Chapter 5 §5.2, pp.70–73: The moduli construction, real-cyclotomic descent and composition law are explicit.)

The interface serves R14.2: Controls polarization adjoints and the twisted Hecke pairing; R13.5: The Γ₀ version acts on the p² model.

Provide the following named interface results.

- `TauCeti.ModularCurves.atkinLehner`: The cyclotomic pointed quotient map extended to X₁(N).
- `TauCeti.ModularCurves.atkinLehner_sq`: The coarse map is involutive.
- `TauCeti.ModularCurves.atkinLehner_changeRoot`: w_(ζ^a) w_ζ=I_a.
- `TauCeti.ModularCurves.atkinLehner_galois`: Conjugation changes ζ to gζ.
- `TauCeti.ModularCurves.atkinLehner_realDescent`: Descent along ζ↔ζ⁻¹ to the real cyclotomic base.

Construct and prove this as follows. Use the Weil pairing and dual quotient isogeny to select the target marked point. Compare two successive quotient constructions, fixing the diamond convention by the displayed law. Extend on Tate charts, then use normality/full faithfulness for equality and descent.

**Checks.**

- `TauCeti.ModularCurves.atkinLehner_sq_eq_id`: Two cyclic quotients recover the coarse marked curve.
- `TauCeti.ModularCurves.atkinLehner_change_root`: At N=11 two root choices with ratio exponent a differ by the nontrivial diamond I_a when a≠±1.
- `TauCeti.ModularCurves.atkinLehner_rationality`: A full Γ₁ Fricke map is not automatically ℚ-rational just because the Γ₀ Fricke map is.
- `TauCeti.ModularCurves.atkinLehnerAnalytic_involutive`: For N,z≠0, −1/(N(−1/(Nz)))=z.
- Replacing ζ by ζ^a changes the map by a diamond; omitting the field of definition destroys the Galois conjugation law.

*Needs:* `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.3/formal-level-cusp-charts`; Diamond operators (`ModularCurvesPartII:R14.1/diamond-operators`); `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`; `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`; `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`.

### R14.1.4 Exact-divisor Atkin–Lehner operators

Define `TauCeti.ModularCurves.atkinLehnerExact` with the following mathematical specification. For d∣N with gcd(d,N/d)=1, split a cyclic N-subgroup into its d and N/d factors and quotient by the d factor, replacing that factor by the dual kernel. This defines the ℚ-rational involution w_d on X₀(N); compactification is by normalization and the Tate boundary comparison. They commute and w_d w_e=w_(de/gcd(d,e)²), so the group has 2^ω(N) elements. The full Fricke map is d=N. No such involution is asserted from a nonexact divisor. Prime N≥5 over ℤ[1/N] uses the Layer 10 map; at primes dividing N extending to a chosen regular or semistable model is a separate equivariant-model assertion.

(grosszagier, Chapter I §2, p.227: The exact-divisor involutions and their group law fix the Γ₀ convention.) (bdmtv19, Theorem 6.5 and proof of Theorem 6.6, pp.928–929: w_(ℓ²) extends to the explicit semistable model and its tame quotient is computed.)

The interface serves Gross–Zagier Chapter I: Fixes Γ₀ arithmetic correspondences; BDMTV §6.2: Constructs the split-Cartan normalizer quotient.

Provide the following named interface results.

- `TauCeti.ModularCurves.atkinLehnerExact`: w_d with a proof d is an exact divisor.
- `TauCeti.ModularCurves.atkinLehnerExact_mul`: The composition has exact divisor de/gcd(d,e)².
- `TauCeti.ModularCurves.atkinLehnerExact_one`: w₁ is identity.
- `TauCeti.ModularCurves.atkinLehnerExact_field`: The Γ₀ construction is over ℚ, independently of a primitive root.
- `TauCeti.ModularCurves.atkinLehnerExact_model`: On the specified p² semistable model it is the component/branch action of R13.5.

Construct and prove this as follows. Construct the coprime subgroup decomposition and its dual quotient on the elliptic open. Extend the map by normal compactification and invert it by the same construction. Compute the composition from prime-power factor decompositions. Import the prime-level integral overlap rather than redo it.

**Checks.**

- `TauCeti.ModularCurves.atkinLehnerExact_twelve`: N=12: exactly four exact-divisor operators.
- `TauCeti.ModularCurves.atkinLehnerExact_nonexact`: d=2 at N=12 cannot be supplied as an exact divisor.
- `TauCeti.ModularCurves.atkinLehnerExact_one`: d=1 gives identity.
- `TauCeti.ModularCurves.atkinLehnerExact_product`: w₃w₄=w₁₂ and w₄²=id for N=12.
- N=12 has exact divisors 1,3,4,12; 2 is not exact. The product w₃w₄ is w₁₂.
- w₄w₄=w₁, not w₁₆.

*Needs:* `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.3/formal-level-cusp-charts`; `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`; Cyclotomic Fricke involution (`ModularCurvesPartII:R14.1/atkin-lehner-involution`); `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`.

### R14.1.5 Full and cyclic isogeny correspondences

Define `TauCeti.ModularCurves.allSubgroupCorrespondence` with the following mathematical specification. For m≥1 prime to N on the smooth characteristic-zero Γ₁(N) curve, let A_m parametrize every subgroup scheme of order m, and let C_m parametrize only cyclic subgroups of order m, transporting the marked point by the quotient. Compactify each elliptic-open correspondence by its normal finite closure, retaining cycle multiplicity. The degrees of both legs are σ₁(m)=Σ_(d∣m)d for A_m and ψ(m)=m∏_(p∣m)(1+1/p) for C_m. On a split Tate cover the subgroups are indexed by a d=m and 0≤b<d; the quotient parameter is q′=ζ_d^b q^(a/d), and the isogeny is u↦u^a. The subgroup is cyclic exactly when gcd(a,b,d)=1. Every noncyclic subgroup has a unique scalar elementary-divisor factor r, and A_m=Σ_(r²∣m)⟨r⟩ C_(m/r²) as operators/cycles in this transported-level convention. The equality is on completed correspondences with their maps, not an assertion that raw cusp fibre products are normal.

(grosszagier, Chapter I §2, p.227: The full order-m subgroup correspondence has σ₁(m) degree.) (bt16, §2.5, pp.716–717: The cyclic definition and Tate boundary specialization are used with corrected degree and polygon domains.) (mz20, §3.1(ii),(v), pp.645–646: The modular polynomial parametrizes the cyclic correspondence and has ψ(m) degree.)

The interface serves Bakker–Tsimerman §2.5 and §6: Fixes cyclic degrees and boundary geometry; R14.2 and ModularityLifting: Fixes repeated-prime algebra relations.

Provide the following named interface results.

- `TauCeti.ModularCurves.allSubgroupCorrespondence`: A_m, its two finite generic legs and normalized compactification.
- `TauCeti.ModularCurves.cyclicSubgroupCorrespondence`: C_m with the cyclic condition and its finite normalized closure.
- `TauCeti.ModularCurves.allSubgroupCorrespondence_degree`: Its degree is σ₁(m).
- `TauCeti.ModularCurves.cyclicSubgroupCorrespondence_degree`: Its degree is ψ(m).
- `TauCeti.ModularCurves.correspondenceTateBranch`: The branch (a,d,b) has q′=ζ_d^b q^(a/d) and differential multiplier a.
- `TauCeti.ModularCurves.allSubgroupCorrespondence_scalarDecomposition`: The decomposition has the diamond ⟨r⟩ attached to E[r].

Construct and prove this as follows. Classify finite-index rank-two lattices by Hermite normal form; their elementary divisors give the cyclicity criterion and both counts. Read the corresponding Tate quotient on the split cover and keep the root of unity and differential multiplier a. Use the unique scalar subgroup E[r] factor to derive the diamond-weighted decomposition; normalize the compactified finite closures.

**Checks.**

- `TauCeti.ModularCurves.fullCyclic_four`: σ₁(4)=7 and ψ(4)=6; the pair (a,d,b)=(2,2,0) is the noncyclic one.
- `TauCeti.ModularCurves.fullCyclic_one`: A₁=C₁ is the identity correspondence.
- `TauCeti.ModularCurves.fullCyclic_squarefree`: For m=6 all twelve branches satisfy the cyclic criterion.
- `TauCeti.ModularCurves.fullCyclic_tate`: For m=p the multiplicative branch has q′=q^p and p other branches have q′=ζ_p^b q^(1/p).
- `TauCeti.ModularCurves.fullCyclic_diamond`: At N=11,m=4 the scalar E[2] term transports P to 2P; replacing it by an identity-level correspondence loses the diamond.
- m=4 gives seven full subgroups and six cyclic ones. The omitted subgroup is E[2], whose quotient transports P to 2P.
- m=6 gives both degrees 12 because squarefree subgroups are cyclic.

*Needs:* Compactified Hecke degeneracy maps (`ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`); Diamond operators (`ModularCurvesPartII:R14.1/diamond-operators`); `ModularCurvesPartII:R13.3/formal-level-cusp-charts`; `ModularCurvesPartII:R13.3/tate-power-isogeny`; `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`; `AlgebraicModuliForArithmeticGeometry:R09.5/finite-closure`; `AlgebraicModuliForArithmeticGeometry:R09.5/normalized-correspondence`.

### R14.1.6 Hecke composition relations

Prove `TauCeti.ModularCurves.composition_relations_of_correspondences` with the following mathematical specification. For m,n prime to N and gcd(m,n)=1, composition of full correspondences A_m A_n=A_(mn); cyclic correspondences also satisfy C_m C_n=C_(mn). The correspondence equality is a normalized cycle equality, not a raw fibre-product isomorphism at the boundary. For p∤N the repeated-prime relations in the transported-level convention are A_p²=A_(p²)+p⟨p⟩, A_(p²)=C_(p²)+⟨p⟩, and C_p²=C_(p²)+(p+1)⟨p⟩. At p∣N the disjoint U_p correspondences instead compose as U_p U_(p^r)=U_(p^(r+1)), on their specified level problem; no unit diamond ⟨p⟩ exists there. Abstract double-coset algebra is imported from ModularForms layers 2–3 and the pinned Tau Ceti Hecke ring; this theorem realizes it on these modular cycles.

(grosszagier, Chapter I §2, p.227: The full subgroup correspondence convention determines the classical repeated-prime identity.) (ribetstein, Chapter 5 §5.2, pp.71–72: The disjoint level correspondence agrees with the classical Hecke/U operators.)

Construct and prove this as follows. For coprime indices split each subgroup into its unique primary factors; compare the transported marked point. For p² count chains above a cyclic subgroup (one) and above E[p] (p+1); the latter transports P to pP. Use normal finite closures for cycle equality and the disjoint bad-prime subgroup condition for U.

**Checks.**

- At p=2 the cyclic relation has coefficient 3, whereas the full relation has coefficient 2.
- At N=11,m=2,n=3 both sides have degree 12.

*Needs:* Full and cyclic isogeny correspondences (`ModularCurvesPartII:R14.1/full-and-cyclic-correspondences`); Compactified Hecke degeneracy maps (`ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`); Diamond operators (`ModularCurvesPartII:R14.1/diamond-operators`); `tauceti:HeckeRing.GL2.heckeT_mul_of_coprime`; `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`; `tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`.

### R14.1.7 Classical and geometric Hecke actions

Prove `TauCeti.ModularCurves.analytic_comparison_of_correspondences` with the following mathematical specification. Over ℂ on a chosen honest component, identify the modular curves with the earlier compactified congruence quotients. Under Shimura’s weight-two identification, π₁*π₂^* on H¹ is the classical upper Hecke operator and its conjugate on the antiholomorphic summand. On holomorphic weight-k forms include the universal isogeny differential ξ^k; the unnormalized coherent trace is p times classical T_p. Full versus cyclic operators, transported diamonds, and the Γ₁ cyclotomic Fricke map retain the R14.1 conventions. The analytic map w_N(z)=−1/(Nz) is the component-fixed shadow of the chosen root, not proof of rational descent.

(ribetstein, Chapter 5 §5.1, Theorems 5.1–5.2, pp.65–67: Shimura comparison and cup/Petersson compatibility fix the upper convention.) (conrad07, §4.5, pp.46–48: The weight-k trace includes the isogeny differential and the factor p.)

Construct and prove this as follows. Compare the maps on the elliptic analytic open with the fixed quotient lattice and point conventions. At cusps use the Tate quotient and differential, then use q-expansion determination from the earlier modular-form supplier. Apply the cited cohomological comparison and record upper/lower adjoint conventions separately.

**Checks.**

- For p∤N weight two has a_n(T_pf)=a_(np)+p a_(n/p)(⟨p⟩f); a pointwise average would give a different operator.

*Needs:* Generic components and cusp fields (`ModularCurvesPartII:R13.4b/generic-component-comparison`); Compactified Hecke degeneracy maps (`ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`); Diamond operators (`ModularCurvesPartII:R14.1/diamond-operators`); Cyclotomic Fricke involution (`ModularCurvesPartII:R14.1/atkin-lehner-involution`); Full and cyclic isogeny correspondences (`ModularCurvesPartII:R14.1/full-and-cyclic-correspondences`); `ModularCurvesPartII:R12.6/canonical-generic-fibre-descent`; `ModularCurvesPartII:R12.6/generic-base-change-and-level-compatibility`; `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`.

### R14.1.8 Integral coherent Hecke trace

Define `TauCeti.ModularCurves.coherentHecke` with the following mathematical specification. For k≥1, over Γ₁(N)/ℤ define F=Tr_(π₁)∘ξ^k∘π₂^* on ω^k. The local finite-flat theorem shows F(ω^k)⊂pω^k, hence T_p=F/p exists integrally over ℤ and is compatible with base change as a normalized integral operator. On a characteristic-p base its construction uses lifts modulo p² and the proved divisibility/independence of the lift; it is not division by zero in the residue field. On multiplicative ordinary/kernel and cusp charts ξ vanishes modulo p; on the étale-kernel ordinary chart the purely inseparable leg has trace zero modulo p. The local operators glue by the coherent-extension lemma. On q expansions, for p∤N, a_n(T_pf)=a_(np)(f)+p^(k−1)a_(n/p)(⟨p⟩f), with a_(n/p)=0 unless p∣n; for p∣N it is a_(np). Nothing here defines a normalized étale/Picard trace by dividing by p.

(conrad07, Theorem 4.5.1, Lemma 4.5.2 and Example 4.5.3, pp.46–48: The p-divisibility calculation, glueing, lifting in characteristic p and both q-expansion formulas are the targets.)

The interface serves R13.4b and ModularForms: Fixes integral geometric/classical normalization; R14.2: Distinguishes differential trace from Picard norm.

Provide the following named interface results.

- `TauCeti.ModularCurves.coherentHecke`: The integral normalized T_p on ω^k for k≥1.
- `TauCeti.ModularCurves.coherentHecke_rawTrace`: p T_p=Tr_(π₁) ξ^k π₂^* over the integral model.
- `TauCeti.ModularCurves.coherentHecke_baseChange`: Base change of the proved normalized operator, including residue characteristic p.
- `TauCeti.ModularCurves.coherentHecke_qExpansion`: The good and bad coefficient formulas with the displayed diamond.
- `TauCeti.ModularCurves.coherentHecke_liftIndependence`: Modulo-p² lifts define the same characteristic-p operator.

Construct and prove this as follows. Construct the honest finite-flat trace and ξ^k on the integral stack. Prove p-divisibility on the two ordinary charts and Tate boundary charts; extend by the cited local CM/coherent lemma. Divide over ℤ, prove independence of lifts modulo p² and glue; use the Tate branches to verify the coefficient formula.

**Checks.**

- `TauCeti.ModularCurves.coherentHecke_weight_one`: Modulo p at k=1 retain both a_(np) and a_(n/p)(⟨p⟩f).
- `TauCeti.ModularCurves.coherentHecke_weight_two`: Modulo p at k=2 the p-multiple term vanishes.
- `TauCeti.ModularCurves.coherentHecke_bad`: For p∣N only a_(np) occurs, without an undefined ⟨p⟩.
- `TauCeti.ModularCurves.coherentHecke_division`: An operator on a characteristic-p ring cannot be defined by inverting p; it is the reduction of the normalized integral trace.
- For k=1 in characteristic p the second q-term has coefficient 1; for k≥2 it vanishes modulo p.
- The construction needs k≥1: ξ^0 does not give the multiplicative-kernel divisibility argument.

*Needs:* Compactified Hecke degeneracy maps (`ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`); `ModularCurvesPartII:R13.3/boundary-carriers-and-hodge-evaluation`; `ModularCurvesPartII:R13.3/tate-power-isogeny`; `SchemeAndStackFoundations:SF.2`.

### R14.1.9 Integral étale correspondence trace

Prove `TauCeti.ModularCurves.integral_etale_trace` with the following mathematical specification. For the actual finite maps f:D→C between smooth proper geometric generic-fibre modular curves and ℓ invertible in their base, use duality to define the integral H¹_et trace f_* dual to f^*. It satisfies f_*f^*=[deg f] and is compatible with Picard norm through T_ℓ Pic⁰≃H¹_et(−,ℤ_ℓ(1)). Thus π₁*π₂^* and its leg reversal give integral Hecke endomorphisms, even when ℓ divides deg π₁; no averaging is imposed. In special characteristic p≠ℓ an inseparable finite map still has its degree-weighted Gysin trace, not the sum of its distinct geometric fibres. At a bad nodal fibre use the R13.6 nearby-cycle/interface comparison; smooth-curve duality is not asserted on that singular carrier.

(ribetstein, Chapter 5 §5.1, Theorem 5.1 and Lemmas 5.4,5.7, pp.65–69: The integral geometric pull–push and Picard/cup comparison fix the trace convention.)

Construct and prove this as follows. Import the finite-curve duality trace and prove the degree formula using the actual fundamental class. Compare with Kummer and Picard norm, then compose the two correspondence legs. For special nodal models use the supplied specialization exact sequence, retaining multiplicities.

**Checks.**

- A degree-2 map with ℓ=2 has f_*f^*=[2], not identity.
- Absolute Frobenius in characteristic p has degree p and its duality trace retains that factor although it is a bijection on geometric points.

*Needs:* Compactified Hecke degeneracy maps (`ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`); `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/quasi-finite-flat-trace`; `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`; `EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`; `EtaleDualityAndPerverseSheaves:EDC.6`.

### R14.1.10 Hecke cycles on projective level curves

Prove `TauCeti.ModularCurves.projective_boundary_hecke_and_degree` with the following mathematical specification. For prime level p>3 and m prime to p, compactify the cyclic degree-m correspondence on the scalar-framed coarse X(p) with its transported framing. For a d=m use C_(pd) as a splitting polygon: the auxiliary map φ_d:C_(pd)→C_p has smooth formula (x,c)↦(x^d,c mod p), degree d² and an isomorphism on p-torsion. For a transverse cyclic subgroup G of order d, its quotient ψ_G:C_(pd)→C_p has degree d, and ξ_a:C_p→C_p is power a on Gₘ and identity on ℤ/p. The boundary framing is ξ_a[p] ψ_G[p] φ_d[p]⁻¹ f. Retain only choices whose composite kernel is cyclic (the Tate criterion gcd(a,b,d)=1); taking every divisor a,d and every transverse G without this condition gives the full-subgroup boundary union. The source of φ_d is Gₘ×ℤ/(pd), and that of ξ_a is Gₘ×ℤ/p. Keep the μ_p-equivariance, smoothing parameter and raw/effective stabilizer distinction. For μ=id×α and ν=id×β on X(p)×T_m, the image cycle ν_*μ^*C has canonical degree ψ(m) times that of C, by projection formula and numerical equality of α^*K and β^*K. For the full-subgroup convention the multiplier is σ₁(m). This is numerical intersection equality, not a canonical line-bundle isomorphism.

(bt16, §2.5, pp.716–717; §6, p.736: The polygon formula needs domain ℤ/(pm), and the degree multiplier depends on whether the correspondence is cyclic or full.)

Construct and prove this as follows. Use the split (a,d,b) Tate branch; φ_d has degree d² and is only an auxiliary p-torsion identification. The actual ξ_a ψ_G map has degree ad=m. Its kernel is cyclic exactly under the stated filter. Transport the projective frame, retaining scalar-equivalence and stabilizers rather than introducing a nonexistent universal family. Apply the cycle projection formula; use numerical degree on the curve, then the two equal correspondence degrees.

**Checks.**

- m=4 gives cyclic multiplier 6, full multiplier 7.
- For m=1 the cycle and canonical degree are unchanged; Γ₁ fine-level geometry is not inferred from this coarse projective statement.

*Needs:* `ModularCurvesPartII:R13.4a/projective-scalar-coarse-quotient`; Full and cyclic isogeny correspondences (`ModularCurvesPartII:R14.1/full-and-cyclic-correspondences`); `ModularCurvesPartII:R13.3/tate-power-isogeny`; `ModularCurvesPartII:R13.1/contraction-away-from-a-divisor`; `SchemeAndStackFoundations:SF.5`.

### Examples

For m=4 the HNF data are (1,4,b), 0≤b<4; (2,2,b), 0≤b<2; and (4,1,0): seven branches. The cyclic filter removes (2,2,0), leaving six. Thus A_p²=A_(p²)+p⟨p⟩ while C_p²=C_(p²)+(p+1)⟨p⟩ in the weight-two convention. For N=12 the exact divisors are 1,3,4,12; neither 2 nor 6 defines an exact-divisor Atkin–Lehner involution. At N=11,p=2 a degeneracy leg has degree 3; at N=10,p=5 it has degree 5.

### Dependencies

`ModularCurvesPartII:R13.4a`; `ModularCurvesPartII:R13.3`; `ModularCurvesPartII:R13.2`; `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`; `AlgebraicModuliForArithmeticGeometry:R09.5`; `ModularCurvesPartII:R13.1`; `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`; `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`; `tauceti:HeckeRing.GL2.heckeT_mul_of_coprime`; `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`; `tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`; `ModularCurvesPartII:R13.4b`; `ModularCurvesPartII:R12.6`; `SchemeAndStackFoundations:SF.2`; `EtaleDualityAndPerverseSheaves:EDC.2:trace-purity`; `EtaleDualityAndPerverseSheaves:EDC.2:pairings`; `EtaleDualityAndPerverseSheaves:EDC.6`; `SchemeAndStackFoundations:SF.5`. Individual target dependencies above give the finer contracts.

## Layer R14.2: Jacobians and integral Hecke actions

First construct the actual relative Jacobian on the smooth base and its pullback/norm action. Define the finite image Hecke algebra and the rank-2g Tate carrier. Rational rank two is proved in R14.3; it is never an input to this layer.

### R14.2.1 Modular Jacobians and norms

Define `TauCeti.ModularCurves.modularJacobian` with the following mathematical specification. For N≥5 put S=Spec ℤ[1/N] and let C=X₁(N)/S, the smooth proper geometrically connected coarse curve. Construct J₁(N)=Pic⁰_(C/S), an abelian scheme of relative dimension g(C), with its canonical principal polarization. For X₀(N) or another smooth proper geometrically connected coarse quotient use the same construction on its legal smooth base; disconnected honest full level requires componentwise Picard and field descent. For a finite flat map f:D→C of such curves, define Picard pullback f^*:J_C→J_D and divisor norm f_*:J_D→J_C, with f_*f^*=[deg f]; the polarization dual of f^* is f_*. Norm counts the ramification/inseparable lengths, not just distinct geometric images. Under the polarization this agrees with the Albanese functor. A bad-level singular coarse fibre is not an abelian scheme: use its smooth generic Jacobian and the lower Néron model.

(ribetstein, Chapter 5 §5.1, Lemma 5.4 and Definitions 5.5–5.6, pp.67–68; §5.2, pp.70–72: Picard pullback and Albanese/norm are transpose under the canonical polarization; J₁ extends over ℤ[1/N].)

The interface serves R14.2: Carries the geometric Hecke algebra and its faithful realizations; R13.6/R20: Supplies the generic Jacobian whose special degeneration is computed.

Provide the following named interface results.

- `TauCeti.ModularCurves.modularJacobian`: The relative neutral Picard abelian scheme on the specified smooth base.
- `TauCeti.ModularCurves.modularJacobian_dimension`: Its relative dimension is the fibre genus.
- `TauCeti.ModularCurves.jacobianPull`: Contravariant pullback of degree-zero line bundles.
- `TauCeti.ModularCurves.jacobianNorm`: Covariant norm with scheme multiplicities.
- `TauCeti.ModularCurves.jacobianNorm_pull`: f_*f^*=[deg f].
- `TauCeti.ModularCurves.jacobianNorm_dual`: f_* is the polarization transpose of f^*.
- `TauCeti.ModularCurves.modularJacobian_baseChange`: Relative Pic⁰ and its canonical polarization commute with the supplied base changes.

Construct and prove this as follows. Use the imported relative Picard representability; H² of a curve vanishes, giving smoothness via the requested lifting criterion. Use the proper neutral-component and polarization supplier to identify the abelian scheme and its dual. Construct norm on line bundles/divisors, checking ramification multiplicities and relative base change; prove degree and duality identities.

**Checks.**

- `TauCeti.ModularCurves.jacobian_genus_zero`: J₀(1)=0; its endomorphism ring and all Hecke operators are zero.
- `TauCeti.ModularCurves.albanese_comp_picZero_degeneracy`: N=11,p=2: π₁*π₁^*=[3].
- `TauCeti.ModularCurves.jacobianNorm_ramification`: A totally ramified degree-2 map contributes multiplicity 2 to the norm identity.
- `TauCeti.ModularCurves.jacobianNorm_composition`: Norm of g∘f is g_*f_*, while pullback reverses order.
- For genus zero J=0, so multiplication by any degree is the unique zero endomorphism.
- For a degree-2 map, norm after pullback is [2], not an identity retraction.

*Needs:* `ModularCurvesPartII:R13.4a/integral-coarse-curves`; `ModularCurvesPartII:R13.4a/legal-coarse-base-change`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`; `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-space-representability`; `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-zero-criterion`; `AlgebraicModuliForArithmeticGeometry:A0-extension/picard-infinitesimal-lifting`; `AlgebraicModuliForArithmeticGeometry:A0-extension`; `AbelianSchemesAndArithmeticModuli:A2`; `NeronModelsAndSemistableAbelianVarieties:R11.1`.

### R14.2.2 Upper and lower Jacobian Hecke operators

Define `TauCeti.ModularCurves.heckeUpper` with the following mathematical specification. On the generic fibre define upper T_p^J=π₁*π₂^* and lower (T_p^J)_*=π₂*π₁^*, with the same disjoint correspondence for p∣N. Define upper diamond by Picard pullback I_a^* and lower diamond by Albanese norm I_a*. Extend these endomorphisms uniquely over J₁(N)/ℤ[1/N] by normal-base Hom extension; for p∤N the degeneracy maps themselves exist on the smaller smooth base ℤ[1/Np] before this extension. The endomorphisms commute and satisfy the full-subgroup Hecke algebra relations. Their polarization transposes exchange upper/lower. On the cotangent space the lower operator is classical T_p, whereas the upper operator is its Petersson adjoint. On a bad-level Néron model extend the generic endomorphism by the Néron mapping property, without declaring its identity fibre abelian.

(ribetstein, Chapter 5 Definitions 5.5–5.6, p.68; §5.2, pp.71–72: Upper and lower operators, their cotangent conventions and integral extension are specified.)

The interface serves R14.2/R14.3: Gives the actual integral endomorphisms before extracting eigenspaces or representations; R13.6: Restricts the endomorphisms to the modular torus and abelian component factors.

Provide the following named interface results.

- `TauCeti.ModularCurves.heckeUpper`: π₁*π₂^* on the generic Jacobian and its unique good-base extension.
- `TauCeti.ModularCurves.heckeLower`: π₂*π₁^* with the transpose convention.
- `TauCeti.ModularCurves.heckeJacobian_dual`: Canonical polarization exchanges the two leg orders.
- `TauCeti.ModularCurves.heckeJacobian_cotangent`: Lower is classical and upper is its adjoint on weight-two cotangent forms.
- `TauCeti.ModularCurves.heckeJacobian_extend`: Unique extension across the normal good-base dense open.
- `TauCeti.ModularCurves.heckeJacobian_relations`: The full-subgroup Hecke/diamond and bad U relations hold in End(J).

Construct and prove this as follows. Compose the actual Picard and norm maps, then apply polarization duality to reverse the legs. Compare cotangent action under Shimura and use its faithfulness in characteristic zero to transport the classical relations. Extend over the normal good-level base using the imported relative Hom theorem; use Néron extension separately at bad-level DVRs.

**Checks.**

- `TauCeti.ModularCurves.heckeJacobian_good_norm`: N=11,p=2: each same-leg norm–pull is [3], without a factor 1/3.
- `TauCeti.ModularCurves.heckeJacobian_bad`: At p∣N do not define diamond p, and do not apply good-prime adjoint formulas using its inverse.
- `TauCeti.ModularCurves.heckeJacobian_upperLower`: Polarization transpose of π₁*π₂^* is π₂*π₁^*.
- `TauCeti.ModularCurves.heckeJacobian_zero`: On J₀(1)=0 both operators are zero.
- For p∣N the geometric operator is U_p; there is no ⟨p⟩ unit to insert.
- For Γ₀(N) good p the diamond is trivial and upper/lower agree, but this equality is not imposed on general Γ₁ level.

*Needs:* Modular Jacobians and norms (`ModularCurvesPartII:R14.2/jacobian-and-functoriality`); Compactified Hecke degeneracy maps (`ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`); Diamond operators (`ModularCurvesPartII:R14.1/diamond-operators`); Hecke composition relations (`ModularCurvesPartII:R14.1/composition-relations-of-correspondences`); Classical and geometric Hecke actions (`ModularCurvesPartII:R14.1/analytic-comparison-of-correspondences`); `AbelianSchemesAndArithmeticModuli:A6/relative-hom-and-normal-extension`; Integral étale correspondence trace (`ModularCurvesPartII:R14.1/integral-etale-trace`).

### R14.2.3 The geometric integral Hecke algebra

Define `TauCeti.ModularCurves.heckeAlgebraUpper` with the following mathematical specification. Define T_J as the unital image of the abstract integral full-subgroup Hecke/diamond algebra in End(J₁(N)), using the upper convention and all good/bad operators; lower gives its polarization-transpose isomorphic image. It is a commutative finite free ℤ-algebra as a ℤ-module because End(J) is finite free and T_J is a submodule. Faithful action means injectivity of this image algebra into End(J), integral Betti H¹ and End(T_ℓJ), not faithfulness of the entire abstract double-coset algebra before quotienting its kernel. Its rational rank is computed by the modular-form comparison below; on Γ₀ it equals dim_ℚ S₂(Γ₀(N),ℚ). If g=0 the image is the zero ring, of rank 0. No R14.3 eigenspace freeness or rank-two Galois theorem is used here.

(ribetstein, Chapter 5 §5.1, pp.66–69; §5.2, pp.71–72: The integral Hecke ring is a finite free image algebra and agrees with the Jacobian action.) (grosszagier, Chapter V §1, p.306: For Γ₀ the characteristic-zero coefficient pairing computes the rational rank.)

The interface serves R14.3: Supplies the finite faithful integral coefficient ring; R14.3 owns eigenquotients and rank-two assertions; ModularForms Layer 8: The geometric realization comparison identifies its existing algebra.

Provide the following named interface results.

- `TauCeti.ModularCurves.heckeAlgebraUpper`: The image subring of End(J) with its upper action.
- `TauCeti.ModularCurves.heckeAlgebraUpper_finiteFree`: Its underlying ℤ-module is finite free, including the zero case.
- `TauCeti.ModularCurves.heckeAlgebraLower_equiv`: Polarization transpose identifies upper and lower commutative image algebras.
- `TauCeti.ModularCurves.heckeAlgebraUpper_faithful`: The image acts faithfully on J and the supplied integral realizations.
- `TauCeti.ModularCurves.heckeAlgebraUpper_rank`: Its rational rank agrees with the appropriately descended weight-two form space.

Construct and prove this as follows. Take the image ring of the specified realization, inheriting the commutative relations. Use the imported finite-freeness of the abelian Hom group to deduce finite-freeness of its ℤ-submodule. Identify the faithful realized integral action and postpone any rank-two eigenspace claim to R14.3.

**Checks.**

- `TauCeti.ModularCurves.heckeAlgebra_genus_zero`: Γ₀(1) gives the zero image ring of rank 0.
- `TauCeti.ModularCurves.heckeAlgebra_gammaZero_eleven`: The Γ₀(11) image ring has ℤ-rank 1.
- `TauCeti.ModularCurves.heckeAlgebra_image_kernel`: An abstract Hecke operator annihilating all level-N forms is zero in T_J.
- `TauCeti.ModularCurves.heckeAlgebra_transpose`: Duality reverses products, but on this commutative image it is a ring isomorphism between conventions.
- For genus zero T_J=0, not ℤ. For Γ₀(11), g=1 so T_J has rank 1.
- Replacing the image algebra by the abstract Hecke algebra loses finite rank and faithfulness.

*Needs:* Upper and lower Jacobian Hecke operators (`ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`); `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`; `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`; `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`.

### R14.2.4 Polarization and Hecke adjoints

Prove `TauCeti.ModularCurves.weil_pairing_adjointness` with the following mathematical specification. The canonical polarization gives a perfect alternating Weil pairing T_ℓJ×T_ℓJ→ℤ_ℓ(1). Upper and lower Hecke operators are mutually adjoint. For p∤N and upper diamond convention, T_p^†=⟨p⟩⁻¹T_p and ⟨a⟩^†=⟨a⟩⁻¹. At bad p use leg reversal, or conjugation by the chosen cyclotomic Fricke map w_ζ; do not substitute an undefined diamond p. Fricke conjugation exchanges upper/lower for all Hecke operators, so the w-twisted bilinear pairing makes the image algebra self-adjoint; this twisted pairing is not claimed alternating. After choosing ℚ̄→ℂ and roots ζ_(ℓ^r)=exp(2πi/ℓ^r), the Weil form on T_ℓPic⁰ corresponds to the negative of the integral cup form on H¹, as in Conrad’s sign convention. With Galois action retain the Tate-twist multiplier and g w_ζ g⁻¹=w_(gζ).

(ribetstein, Chapter 5 Theorem 5.2 and Corollary 5.3, p.66; Lemma 5.7, pp.68–69; Theorem 5.8, p.69: Petersson adjoints, the negative cup/Weil sign and twisted self-adjointness fix all conventions.)

Construct and prove this as follows. Use norm/pullback polarization transposes to compute the adjoint of each correspondence. Compare with Petersson and the Fricke conjugation law to obtain the stated diamond factors. Fix the roots-of-unity identification before comparing Weil and cup signs; retain the Galois twist instead of treating the pairing as ℤ_ℓ-valued intrinsically.

**Checks.**

- For Γ₀ good p the diamond is trivial and T_p is self-adjoint.
- Negating the cup form changes the comparison sign but not the norm–pullback transpose; a convention-free equality would fail.

*Needs:* Upper and lower Jacobian Hecke operators (`ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`); Cyclotomic Fricke involution (`ModularCurvesPartII:R14.1/atkin-lehner-involution`); Diamond operators (`ModularCurvesPartII:R14.1/diamond-operators`); `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`; Integral étale correspondence trace (`ModularCurvesPartII:R14.1/integral-etale-trace`).

### R14.2.5 The modular Jacobian Tate module

Define `TauCeti.ModularCurves.jacobianTateModule` with the following mathematical specification. For ℓ prime, over ℚ define T_ℓJ=lim_r J[ℓ^r](ℚ̄), a finite free ℤ_ℓ-module of rank 2g with its continuous G_ℚ action and commuting rational Hecke/diamond action. Intrinsically Kummer identifies it with H¹_et(C_ℚ̄,ℤ_ℓ(1)); choosing a complex embedding and compatible roots removes the twist in the comparison with integral Betti H¹⊗ℤ_ℓ. It is not identified with H₁ without duality/polarization. The map End(J)⊗ℤ_ℓ→End_(ℤ_ℓ)(T_ℓJ) is injective with torsion-free cokernel in the supplied Hom theorem; equality with the Galois centralizer is not asserted. Good reduction over ℤ[1/N] makes this representation unramified outside Nℓ by the lower arithmetic good-reduction criterion. w_ζ is defined over its cyclotomic field and obeys semilinear Galois conjugation, rather than commuting with all G_ℚ. The module is rank 2g over ℤ_ℓ; rank 2 over a Hecke factor belongs to R14.3.

(ribetstein, Chapter 5 §5.1, pp.67–69; §5.2, pp.72–73: The integral H¹/Tate comparison, commuting rational endomorphisms and unramified good-base action are the modular instance.)

The interface serves R14.3: Starting carrier for Hecke eigenspaces and automorphic Galois representations; R13.6 and R20: Specializes into the modular torus/component sequence without rebuilding general monodromy.

Provide the following named interface results.

- `TauCeti.ModularCurves.jacobianTateModule`: The inverse-limit ℤ_ℓ lattice with topology and continuous Galois action.
- `TauCeti.ModularCurves.jacobianTateModule_rank`: Its ℤ_ℓ-rank is 2g.
- `TauCeti.ModularCurves.jacobianTateModule_kummer`: T_ℓ Pic⁰≃H¹_et(C,ℤ_ℓ(1)), retaining the twist.
- `TauCeti.ModularCurves.jacobianTateModule_hecke`: The rational geometric Hecke image acts continuously and commutes with G_ℚ.
- `TauCeti.ModularCurves.jacobianTateModule_faithful`: The imported Hom injection makes the integral image algebra faithful.
- `TauCeti.ModularCurves.jacobianTateModule_unramified`: Unramifiedness away from Nℓ follows from the specified good abelian model.

Construct and prove this as follows. Import the A4 inverse-limit carrier, its freeness and continuous action. Apply Kummer to Pic⁰ and the supplied integral comparison, tracking the twist and sign. Use the A6 Hom injection for faithfulness and the arithmetic good-reduction criterion for unramifiedness; handle Fricke through its field of definition.

**Checks.**

- `TauCeti.ModularCurves.jacobianTateModule_zero`: Genus zero gives a rank-zero lattice.
- `TauCeti.ModularCurves.jacobianTateModule_eleven`: Γ₀(11) gives rank 2 over ℤ_ℓ, rather than rank 1.
- `TauCeti.ModularCurves.jacobianTateModule_twist`: Removing ℤ_ℓ(1) without a roots-of-unity choice loses the cyclotomic Galois multiplier.
- `TauCeti.ModularCurves.jacobianTateModule_fricke`: g w_ζ g⁻¹=w_(gζ), while rational Hecke endomorphisms commute with g.
- At genus zero the Tate module is zero. For Γ₀(11) it has ℤ_ℓ-rank 2, and the Hecke algebra has rank 1.
- At ℓ=2 the degree-2 trace remains multiplication by 2 rather than an invertible normalization.

*Needs:* Modular Jacobians and norms (`ModularCurvesPartII:R14.2/jacobian-and-functoriality`); Upper and lower Jacobian Hecke operators (`ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`); The geometric integral Hecke algebra (`ModularCurvesPartII:R14.2/integral-hecke-algebra`); Polarization and Hecke adjoints (`ModularCurvesPartII:R14.2/weil-pairing-adjointness`); `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`; `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`; Integral étale correspondence trace (`ModularCurvesPartII:R14.1/integral-etale-trace`); `ArithmeticGaloisRepresentations:R01.6/good-reduction-specialization`.

### R14.2.6 The rational coefficient pairing

Prove `TauCeti.ModularCurves.rational_coefficient_pairing` with the following mathematical specification. For Γ₀(N) over ℚ identify cotangent forms with S₂(Γ₀(N),ℚ), the rational q-expansion space, using the earlier descent supplier. With the lower Jacobian Hecke image T and β(T,f)=a₁(Tf), the pairing (T⊗ℚ)×S₂(Γ₀(N),ℚ)→ℚ is perfect. The identities a_m(f)=a₁(T_m f), determination by q expansion, commutativity, and faithful cotangent action prove its two nondegeneracy statements. Consequently dim_ℚ(T⊗ℚ)=g(X₀(N)). For Γ₁ or character components, use the actual descended coefficient field and diamond action; this statement does not replace the field by ℚ without proof. Rational perfection alone does not imply an integral unimodular pairing on a chosen q-lattice.

(grosszagier, Chapter V §1, p.306: Faithful cotangent Hecke action and the rational a₁-pairing prove the Γ₀ rank formula.)

Construct and prove this as follows. If β(T,f)=0 for all T, each Fourier coefficient of f is zero, so f=0. If β(T,f)=0 for every f, then β(T_m,Tf)=β(T_mT,f)=0 for all m,f; hence Tf=0 for every f. Use cotangent faithfulness in characteristic zero to conclude T=0, then use finite dimension for perfection.

**Checks.**

- Γ₀(1): both sides have dimension 0. Γ₀(11): both have dimension 1.
- A determinant of an integral pairing need not be ±1 merely because its rationalization is perfect.

*Needs:* The geometric integral Hecke algebra (`ModularCurvesPartII:R14.2/integral-hecke-algebra`); Upper and lower Jacobian Hecke operators (`ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`); Classical and geometric Hecke actions (`ModularCurvesPartII:R14.1/analytic-comparison-of-correspondences`); `ModularCurvesPartII:R12.5/weight-two-regular-differentials`; `ModularCurvesPartII:R12.5/first-coefficient-hecke-pairing`; `ModularCurvesPartII:R12.5/perfect-hecke-pairing`; `ModularCurvesPartII:R12.6/canonical-generic-fibre-descent`.

### R14.2.7 Integral Hecke realization comparison

Prove `TauCeti.ModularCurves.integral_hecke_realization_comparison` with the following mathematical specification. With upper/lower transpose conventions fixed, identify the same integral image of the abstract Hecke algebra on J, Betti H¹(C(ℂ),ℤ), and T_ℓJ for every ℓ. Equality of integral kernels uses the faithful Hom/Betti comparison and the supplied End⊗ℤ_ℓ injection; equality after tensoring with ℚ alone does not identify integral lattices. The additional modular-symbol comparison requires a weight-two cuspidal carrier: the kernel of the boundary map in ModularForms Layer 8’s integral symbol module, with its torsion removed, and its actual integral comparison with compact-curve H₁ (or the correctly transposed dual H¹). This missing contract is recorded as a gap; the full symbol module with boundary/Eisenstein classes is not asserted to have the same Hecke kernel. The cotangent/classical-form comparison is the lower action, and the upper action is its adjoint. Normalized coherent weight-two T_p comes from the separate local p-divisibility theorem; Jacobian/étale push–pull has no inverse-degree normalization. These compare existing Hecke actions and their image quotients, not a new abstract algebra or a rank-two eigenspace theorem.

For the modular-symbol realization, supply the recorded integral cuspidal-symbol comparison contract, preserving diamonds and bad-prime operators; no comparison with the entire uncut symbol module is assumed.

(ribetstein, Chapter 5 §5.1, pp.65–69; §5.2, pp.71–72: The appendix supplies the compact-curve integral Betti/Jacobian Hecke action and its dual conventions. It does not supply the claimed integral identification with the full modular-symbol module.) (conrad07, §4.5, pp.46–48: The coherent normalization is separate from integral Picard push–pull.)

Construct and prove this as follows. Use complex comparison to identify integral Betti and Tate lattices after the required choices, compatibly with both correspondence legs. An endomorphism acting as zero on the lattice is zero by the imported Hom injection, so all integral image kernels coincide. Construct the weight-two cuspidal symbol boundary kernel and remove its torsion. Supply the integral Hecke-equivariant comparison with compact-curve H₁, or its correctly transposed dual H¹, with diamonds and bad-prime operators. This is the recorded missing integral comparison, not a consequence of Layer 8’s form-side quotient. Then equality of integral kernels follows from the comparison; boundary/Eisenstein symbols never enter this equality.

**Checks.**

- For degree p+1 with ℓ∣p+1 the same-leg norm–pull still acts as [p+1] in every realization.
- A rationally isomorphic but index-2 different Hecke lattice is not accepted as this integral comparison.
- At Γ₁(5), the compact curve has genus zero but the full weight-two symbol module has nonzero boundary classes (four cusps). The unit acts nontrivially on these symbols and trivially on the zero Jacobian; their integral image kernels differ. Cut to the cuspidal carrier before comparing.

*Needs:* The geometric integral Hecke algebra (`ModularCurvesPartII:R14.2/integral-hecke-algebra`); The modular Jacobian Tate module (`ModularCurvesPartII:R14.2/tate-module-with-galois-and-hecke-actions`); The rational coefficient pairing (`ModularCurvesPartII:R14.2/rational-coefficient-pairing`); Integral coherent Hecke trace (`ModularCurvesPartII:R14.1/coherent-hecke-trace`); Classical and geometric Hecke actions (`ModularCurvesPartII:R14.1/analytic-comparison-of-correspondences`); `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`; Integral étale correspondence trace (`ModularCurvesPartII:R14.1/integral-etale-trace`).

### Examples

X₁(5) has genus zero and four cusps. Its compact Jacobian is zero and its image Hecke algebra has rank zero, while its full symbol module has nonzero boundary classes. This prevents identifying the entire symbol Hecke kernel with the compact Jacobian kernel. On a ramified finite map, pushforward after pullback multiplies by the total degree, not by the number of distinct points of a special fibre. The negative cup/Weil sign is checked with a chosen complex embedding and compatible roots of unity.

### Dependencies

`ModularCurvesPartII:R13.4a`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`; `AlgebraicModuliForArithmeticGeometry:A0-extension`; `AbelianSchemesAndArithmeticModuli:A2`; `NeronModelsAndSemistableAbelianVarieties:R11.1`; `ModularCurvesPartII:R14.1`; `AbelianSchemesAndArithmeticModuli:A6`; `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`; `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`; `AbelianSchemesAndArithmeticModuli:A3`; `AbelianSchemesAndArithmeticModuli:A4`; `ArithmeticGaloisRepresentations:R01.6`; `ModularCurvesPartII:R12.5`; `ModularCurvesPartII:R12.6`. Individual target dependencies above give the finer contracts.

## Layer R14.3: cohomological realizations and pairings

Use the actual smooth universal elliptic family, finite support maps and boundary cohomology. Rational Hodge and rank-two statements are separated from integral saturation and reduction. The higher-weight boundary and dual-lattice hypotheses stay visible.

### R14.3.1 The weight-two Shimura isomorphism is Hecke-equivariant

Prove `TauCeti.ModularCurves.weight_two_shimura_isomorphism` with the following mathematical specification. For N ≥ 5, the Hodge decomposition gives S₂(Γ₁(N), ℂ) ⊕ S̄₂(Γ₁(N), ℂ) ≅ H¹(X₁(N)^an, ℤ) ⊗ ℂ, and it identifies ⟨n⟩ ⊕ ⟨n⟩̄ with ⟨n⟩^*, T_p ⊕ T̄_p with T_p^* = (π₁^{(p)})_* ∘ (π₂^{(p)})^* and w_N ⊕ w̄_N with w^*_{e^{2πi/N}}, where π₁^{(p)}, π₂^{(p)} : X₁(N, p) → X₁(N) are the degeneracy maps and (π₁^{(p)})_* is the trace.

N ≥ 5; at N < 5 both sides vanish. The integral Betti carrier is H¹ of the compact analytic curve. ModularForms Layer 8 supplies a homological symbol module with boundary and possible torsion; only the separately proved cuspidal/dual comparison identifies the relevant lattice.

(ribetstein, Appendix by B. Conrad, p. 64 (printed page; PDF page 68): The isomorphism.) (ribetstein, Appendix by B. Conrad, p. 65 (printed page; PDF page 69): Theorem 5.1.)

Construct and prove this as follows. Hodge decomposition of the compact Riemann surface X₁(N)^an with H⁰(Ω¹) = S₂(Γ₁(N), ℂ). Compute T_p^* on H¹ through the trace along π₁^{(p)} (stalkwise sum with ramification multiplicities) and pullback along π₂^{(p)}; compare with the double-coset action on cusp forms. Diamond operators and w_ζ are induced by automorphisms, so pullback commutes with the Hodge decomposition.

**Checks.**

- Conrad omits the proof of the compatibility; a complete proof must check the trace formula against the classical double coset (ModularCurvesPartII R12.5 normalises the differentials and Hecke operators).

*Needs:* `ModularCurvesPartII:R12.5/weight-two-regular-differentials`; `ModularCurvesPartII:R12.5/hodge-line-automorphy`; Classical and geometric Hecke actions (`ModularCurvesPartII:R14.1/analytic-comparison-of-correspondences`); Integral coherent Hecke trace (`ModularCurvesPartII:R14.1/coherent-hecke-trace`); Modular Jacobians and norms (`ModularCurvesPartII:R14.2/jacobian-and-functoriality`); Upper and lower Jacobian Hecke operators (`ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`); `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; Integral comparison and change of level (`ModularCurvesPartII:R14.3/integral-comparison`).

### R14.3.2 Cup product and the Petersson product

Prove `TauCeti.ModularCurves.cup_product_petersson` with the following mathematical specification. With H²(X₁(N)^an, ℤ) ≅ ℤ by the i-orientation, the cup product pairing on H¹(X₁(N)^an, ℤ) and the non-normalised Petersson product satisfy (Sh(f₁ + ḡ₁), Sh(f₂ + ḡ₂)) = 4π(⟨f₁, g₂⟩ − ⟨f₂, g₁⟩).

The cup-product pairing is perfect; the Petersson integral converges by exponential decay at the cusps.

(ribetstein, Appendix by B. Conrad, p. 66 (printed page; PDF page 70): Theorem 5.2 and its use.)

Construct and prove this as follows. Use the normalization of Sh in Conrad §5.1, pp. 63–65, rather than unscaled f dz. Compute the wedge of the resulting harmonic representatives and evaluate using the specified i-orientation; with the non-normalized Petersson measure the factor is 4π as in Theorem 5.2, p. 66.

**Checks.**

- Only adjoints matter downstream; the factor 4π is harmless.

*Needs:* The weight-two Shimura isomorphism is Hecke-equivariant (`ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism`); `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `ModularCurvesPartII:R12.5/weight-two-regular-differentials`.

### R14.3.3 Hecke operators are self-adjoint for the w_ζ-twisted pairing

Prove `TauCeti.ModularCurves.hecke_twisted_self_adjoint` with the following mathematical specification. With [x, y] = (x, w^*_ζ y) for ζ = e^{2πi/N}, every T ∈ T₁(N) is self-adjoint on H¹(X₁(N)^an, ℤ); for (·,·) the adjoint of T_p^* (p ∤ N) is ⟨p⁻¹⟩^* T_p^* and that of ⟨n⟩^* is ⟨n⁻¹⟩^*. The same holds for any primitive N-th root ζ.

T₁(N) ⊂ End_ℤ H¹(X₁(N)^an, ℤ) generated by the T_p^* and ⟨n⟩^*; commutative and finite flat over ℤ (Tau Ceti ModularForms Layer 8 owns the integral Hecke algebra).

(ribetstein, Appendix by B. Conrad, p. 66 (printed page; PDF page 70): Corollary 5.3.)

Construct and prove this as follows. Transport the classical Petersson adjoints (T_p for p | N via w_N) through cup-product-petersson. w^*_{ζ^j} ∘ w^*_ζ = ⟨j⟩^*, a unit commuting with T₁(N), reduces general ζ to e^{2πi/N}.

**Checks.**

- The case T = T_p^* with p | N is the subtle one; keep it.

*Needs:* Cup product and the Petersson product (`ModularCurvesPartII:R14.3/cup-product-petersson`); Cyclotomic Fricke involution (`ModularCurvesPartII:R14.1/atkin-lehner-involution`); Diamond operators (`ModularCurvesPartII:R14.1/diamond-operators`); Classical and geometric Hecke actions (`ModularCurvesPartII:R14.1/analytic-comparison-of-correspondences`); Upper and lower Jacobian Hecke operators (`ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`); Polarization and Hecke adjoints (`ModularCurvesPartII:R14.2/weil-pairing-adjointness`).

### R14.3.4 H¹ is free of rank two over the Hecke algebra

Prove `TauCeti.ModularCurves.betti_free_rank_two` with the following mathematical specification. H¹(X₁(N)^an, ℚ) is free of rank 2 over ℚ ⊗ T₁(N), and Hom_ℚ(ℚ ⊗ T₁(N), ℚ) is free of rank 1 (ℚ ⊗ T₁(N) is Gorenstein). Consequently V_ℓ(N) = ℚ_ℓ ⊗ T_ℓ(J₁(N)) is free of rank 2 over ℚ_ℓ ⊗ T₁(N) for either Hecke action.

Characteristic zero coefficients; integral freeness is not claimed (it can fail at Eisenstein maximal ideals).

(ribetstein, Appendix by B. Conrad, p. 69 (printed page; PDF page 73): Corollary 5.9.) (ribetstein, Appendix by B. Conrad, p. 70 (printed page; PDF page 74): The key reduction in the proof.)

Construct and prove this as follows. Use the twisted perfect pairing to identify rational H¹ with its Q-dual as Hecke modules. Over C, the coefficient pairing (f,T)↦a₁(Tf) identifies the dual of S₂, rather than S₂ itself at this point of the proof, with C⊗T. The q-expansion principle and faithful Hecke action prove nondegeneracy on both sides. Apply Hodge decomposition to conclude that the dual of H¹ over C is free of rank two; transfer through self-duality and faithfully flat descent over the semilocal rational Hecke algebra. Once H¹ is free rank two and self-dual, its two Hecke-dual summands show Hom_Q(Q⊗T,Q) is projective of full support. Q-dimension comparison gives rank one, hence freeness over the semilocal ring. Transport to V_ℓJ via the initial Tate comparison, preserving the two adjoint Hecke conventions.

**Checks.**

- Integral freeness after localising at a non-Eisenstein maximal ideal is a separate statement (remaining work).
- This is rational rank-two freeness for the full Hecke algebra of Conrad §5.1, including old blocks; it asserts neither integral Gorensteinness nor integral rank-two freeness at every maximal ideal.

*Needs:* The weight-two Shimura isomorphism is Hecke-equivariant (`ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism`); Hecke operators are self-adjoint for the w_ζ-twisted pairing (`ModularCurvesPartII:R14.3/hecke-twisted-self-adjoint`); `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`; `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`; `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`; The actual Jacobian Tate realization (`ModularCurvesPartII:R14.3/weight-two-tate-comparison`).

### R14.3.5 Geometric weight coefficient systems

Define `TauCeti.ModularCurves.relativeBettiH1` with the following mathematical specification. For the universal elliptic curve f:E→Y₁(N), N≥5, construct L_B=R¹f_an,*ℤ and L_{ℓ,n}=R¹f_et,*ℤ/ℓⁿ, with ℓ invertible on the base. Their geometric fibres are H¹ of the elliptic fibre, locally free of rank two. For r=k−2≥0 set L_r=Sym^r L, of rank r+1. The coefficient maps along an isogeny are induced by its pullback on relative H¹; integral lattices and duals are retained before any inversion of ℓ.

A universal elliptic curve from R13.2; k≥2, n≥1, ℓ prime; finite étale statements require ℓ invertible. For coarse levels lacking a fine universal family, use a supplied fine cover with its descent data; descent invariants are not exact if the deck-group order is not invertible.

(DELIGNE-355, §§3.9–3.11, pp. 154–156; §3.16, pp. 157–158: Relative H¹ of the universal elliptic curve gives the weight-r coefficient system and its isogeny maps; Deligne works rationally, so finite coefficient base change is imported explicitly.)

The interface serves ModularCurvesPartII:R14.3/parabolic-cohomology: Actual coefficients for parabolic cohomology; AutomorphicGaloisRepresentations:R19.1: Higher-weight geometric eigenspace input with its lattice.

Provide the following named interface results.

- `TauCeti.ModularCurves.relativeBettiH1`: The rank-two Betti local system of the supplied universal elliptic family.
- `TauCeti.ModularCurves.relativeEtaleH1`: The finite ℤ/ℓⁿ relative degree-one étale local system.
- `TauCeti.ModularCurves.weightCoefficients`: Sym^{k−2} of the relative H¹ local system, using the existing representation symmetric-power functor.
- `TauCeti.ModularCurves.weightCoefficients_fibre`: Its fibre at y is Sym^{k−2} H¹(E_y,A), naturally in y and the coefficient ring A.
- `TauCeti.ModularCurves.weightCoefficients_isogeny`: The coefficient morphism is Sym^{k−2} of the isogeny pullback; identity and composite isogenies give identity and composite maps.
- `TauCeti.ModularCurves.weightCoefficients_compare`: Artin comparison identifies the finite Betti and étale systems and their isogeny maps.

Construct and prove this as follows. Import the universal family and proper smooth base change to construct relative degree-one sheaves; on the analytic side transport fibre cohomology through local trivializations. Apply the existing symmetric-power functor to each transport map; its identity/composition laws give a local system. Use the elliptic cup product and isogeny pullback to fix the covariant/contravariant and Tate-twist conventions.

**Checks.**

- `weightCoefficients_two`: At k=2, Sym⁰ L is the constant rank-one system.
- `weightCoefficients_three`: At k=3, a fibre is L_y and has rank two.
- `weightCoefficients_compat`: On every monodromy representation ρ, the action is exactly Representation.symmetricPower ρ (k−2).
- `weightCoefficients_unipotent`: At k=3 a cusp loop with fibre matrix [[1,w],[0,1]], w nonzero, acts nontrivially over ℤ; the coefficient system is not constant.
- For r=0 the coefficient system is constant; for r=1 its fibre has rank two.
- No universal elliptic family is silently put on a coarse level-one curve.

*Needs:* `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin`; `ModularCurvesPartII:R13.2/small-level-and-dm-boundaries`; `ModularCurvesPartII:R13.2/agreement-with-katz-mazur-schemes`; `AbelianSchemesAndArithmeticModuli:A4`; `tauceti:TauCeti.LocalCoefficientSystem`; `tauceti:TauCeti.LocalCoefficientSystem.pullback`; `tauceti:Representation.symmetricPower`; `EtaleDualityAndPerverseSheaves:EDC.0`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`; `tauceti:SymmetricPower.finrank_eq`.

### R14.3.6 Finite and adic parabolic cohomology

Define `TauCeti.ModularCurves.parabolicH1` with the following mathematical specification. For j:Y→X the supplied compactification and the geometric L_r with A=O, O/πⁿ or K=Frac(O), define H¹_par(Y,L_r)=im(H¹_c(Y,L_r)→H¹(Y,L_r)). Define finite étale analogues first and take compatible inverse limits for the O-adic realization, with O a finite extension of ℤ_ℓ. For constant weight-two coefficients, H¹_par(Y,A)=im(H¹(X,A)→H¹(Y,A)); for these smooth curves the latter map is injective. Twisted coefficients use j_*L_r and the local boundary sequence, not extension by zero identified with direct image.

N≥5 or a supplied torsion-free fine cover; j and its finite cusp set D=X\Y are fixed. Adic notation denotes the inverse-limit lattice, not merely tensoring rational Deligne cohomology.

(DELIGNE-355, Definition 3.9, pp. 154–155; (3.20), pp. 159–160: Parabolic cohomology is the compact-support image. Its integral/finite realization needs the imported cochain and étale infrastructure.)

The interface serves ModularCurvesPartII:R14.3/boundary-exact-sequence: Specify the support map whose image is parabolic; ModularCurvesPartII:R14.4/degeneracy-cohomology: Source and target of integral pullbacks.

Provide the following named interface results.

- `TauCeti.ModularCurves.parabolicH1`: The image submodule of the actual support-forgetting map u:H¹_c→H¹.
- `TauCeti.ModularCurves.mem_parabolicH1`: x lies in parabolicH1 u exactly when x=u(y) for a compact-support class y.
- `TauCeti.ModularCurves.parabolicH1_inclusion`: The canonical injection into ordinary H¹.
- `TauCeti.ModularCurves.parabolicH1_map`: For a commuting square b∘u=v∘a, b induces a map of the images; identity and composition are respected.
- `TauCeti.ModularCurves.parabolicH1_compact`: For proper Y=X, the support map is an isomorphism and parabolic H¹ is ordinary H¹.
- `TauCeti.ModularCurves.parabolicH1_inverseLimit`: Under the finite generation and transition hypotheses of integral-comparison, the finite-level parabolic system recovers the specified O-lattice.
- `TauCeti.ModularCurves.parabolicH1_map_id`: The induced image map for identity maps on the support square is the identity.
- `TauCeti.ModularCurves.parabolicH1_map_comp`: The image map of a composite of two commuting support squares is the composite of their image maps.

Construct and prove this as follows. Import absolute and relative twisted cochains and compact supports from AlgebraicTopology, and finite étale cohomology from EDC.0. Construct the map forgetting support; use its image submodule as the parabolic group. Use the boundary exact sequence to compare with compactification cohomology; establish finite coefficient transition maps before taking limits.

**Checks.**

- `parabolicH1_id`: The image of the identity support map is the entire module.
- `parabolicH1_zero`: A zero support map has zero parabolic image.
- `parabolicH1_Gm`: For Y=G_m(C), constant ℤ coefficients, ordinary H¹≅ℤ but parabolic H¹=0.
- `parabolicH1_compact_test`: For the compact curve X₀(11), parabolic constant ℤ H¹ has rank two.
- On an open genus-zero curve, ordinary boundary classes need not be parabolic.
- The degree-one pro-étale ℤ_ℓ carrier in Mathlib is an untwisted comparison target, not the whole coefficient API.

*Needs:* Geometric weight coefficient systems (`ModularCurvesPartII:R14.3/relative-coefficient-system`); `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `EtaleDualityAndPerverseSheaves:EDC.0`; `mathlib:LinearMap.range`; `mathlib:AlgebraicGeometry.Scheme.EllAdicCohomology`.

### R14.3.7 Boundary and interior cohomology

Prove `TauCeti.ModularCurves.boundary_exact_sequence` with the following mathematical specification. For a smooth open complex or étale curve with finite puncture set D, the support-forgetting map fits into the cohomology sequence of j_!L→Rj_*L→i_*i^*Rj_*L. In degree one, H¹_par is ker(H¹(Y,L)→⊕_{c∈D}H¹(I_c,L_c)); the neighboring H⁰ and H²_c terms are retained. For trivial A coefficients on a connected curve with s cusps, 0→H¹(X,A)→H¹(Y,A)→A^D→A→0 is exact, where the last map sums residues (and the étale terms carry the residue Tate twist).

ℓ is invertible for étale coefficients; local punctured-disc/tame inertia comparison is part of the supplier request. The displayed constant-coefficient residue sequence ending A→0 assumes D is nonempty. If D is empty, retain H²(X,A) and use the identity support map; there is no final residue-surjection claim. The étale statement is geometric, over an algebraically closed field of characteristic different from ℓ; the curve is connected. Over other bases the corresponding cohomology of the cusp scheme must be retained, rather than replaced by A^D.

(DELIGNE-355, Definition 3.9 and (3.20), pp. 154–155, 159–160: The image formulation and duality require keeping the support and boundary terms distinct.)

Construct and prove this as follows. Apply the localization triangle for j_! and Rj_*; compute each boundary stalk by local inertia cohomology. For constant coefficients the local invariant and residue groups are rank one; global orientation/trace identifies the final sum map. Pullbacks and traces of finite correspondences induce morphisms of this sequence.

**Checks.**

- Y=X\{one cusp} has no additional ordinary degree-one rank; with two cusps it has one boundary generator.
- Do not replace H¹_par by all of H¹ before a localization argument.

*Needs:* Finite and adic parabolic cohomology (`ModularCurvesPartII:R14.3/parabolic-cohomology`); `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `EtaleDualityAndPerverseSheaves:EDC.0`; `EtaleDualityAndPerverseSheaves:EDC.1`.

### R14.3.8 Integral comparison and change of level

Prove `TauCeti.ModularCurves.integral_comparison` with the following mathematical specification. For the supplied smooth finite-type modular curves over Q̄, a chosen embedding Q̄↪C, and finite locally constant ℤ/ℓⁿ coefficients from the universal family, Artin comparison gives H^i_et(Y,L_{r,ℓ,n})≅H^i_B(Y_an,L_{r,B}/ℓⁿ), with compact-support analogues and their support maps. These identify finite parabolic images. After proving the required inverse-limit exactness and finite generation, they give the adic comparison; for r=0 this also identifies the actual compact-curve lattice with Mathlib’s pro-étale EllAdicCohomology in degree one. Pullback, trace, cup product and level maps commute with comparison.

The comparison includes local-system coefficients and compact support, not merely constant rational cohomology. Derived-limit obstructions must be eliminated by finite coefficient Mittag–Leffler systems; reduction modulo π commutes only under the torsion hypotheses of localized-freeness.

(DELIGNE-355, Definition 3.9 and discussion of W_ℓ, pp. 154–156; corollary following Theorem 4.1, printed as Corollaire 3.2, p. 161: The same geometric space has Betti and algebraic adic descriptions; the general comparison and integral passage are imported rather than re-proved here. This corollary is a lisse-sheaf/unramifiedness consequence, not the general Artin comparison theorem; the latter is explicitly requested from SF.2.)

Construct and prove this as follows. Import the general étale–Betti comparison required by RS-06. Use naturality with j_!→Rj_* and finite correspondences; apply the coefficient comparison from relative-coefficient-system. Apply finite generation and Mittag–Leffler exactness to the finite systems; separately request the comparison with Mathlib’s pro-étale carrier.

**Checks.**

- Trace composed with pullback is degree times identity in each realization.
- Changing the complex embedding changes the comparison choice; Galois invariance is not asserted for that choice.

*Needs:* Geometric weight coefficient systems (`ModularCurvesPartII:R14.3/relative-coefficient-system`); Finite and adic parabolic cohomology (`ModularCurvesPartII:R14.3/parabolic-cohomology`); `SchemeAndStackFoundations:SF.2`; `EtaleDualityAndPerverseSheaves:EDC.0`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `mathlib:AlgebraicGeometry.Scheme.ellAdicSheaf`.

### R14.3.9 Hecke operators with relative coefficients

Prove `TauCeti.ModularCurves.geometric_hecke_coefficients` with the following mathematical specification. For a good prime q∤Nℓ and the actual isogeny correspondence Y₁(N,q) with maps q₁,q₂ and its universal isogeny, T_q on H¹_par(Y,L_r) is trace along q₁ after pullback along q₂ and the induced coefficient map. Its comparison with the classical weight k=r+2 operator uses Deligne’s normalization, including the q^{r+1} term in the good-prime Hecke polynomial. Diamond and prime-to-level degeneracy maps preserve the parabolic image; functorial traces satisfy the projection formula and trace∘pullback=degree.

Both direction and scalar normalization are fixed by the universal isogeny, not by an arbitrary action on an unnamed cohomology module.

(DELIGNE-355, Propositions 3.18–3.19 and (3.20), pp. 158–160: The isogeny pull-push construction matches the classical Hecke operator with its weight factor.)

Construct and prove this as follows. Import the geometric correspondence and finite-map traces; apply Sym^r of the isogeny map. Make the compact-support and ordinary squares commute, obtaining the map on their images. Apply comparison and the analytic normalization of ModularForms; distinguish T_q from a rescaled double-coset operator.

**Checks.**

- At r=0 this recovers the weight-two Shimura convention.
- Changing the isogeny pullback to its dual without changing Tate twists must fail the pairing adjoint test.

*Needs:* Integral comparison and change of level (`ModularCurvesPartII:R14.3/integral-comparison`); Finite and adic parabolic cohomology (`ModularCurvesPartII:R14.3/parabolic-cohomology`); Compactified Hecke degeneracy maps (`ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`); Integral étale correspondence trace (`ModularCurvesPartII:R14.1/integral-etale-trace`); Hecke composition relations (`ModularCurvesPartII:R14.1/composition-relations-of-correspondences`); Diamond operators (`ModularCurvesPartII:R14.1/diamond-operators`); `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`; `EtaleDualityAndPerverseSheaves:EDC.0`; `EtaleDualityAndPerverseSheaves:EDC.2`.

### R14.3.10 Parabolic Poincaré pairing

Prove `TauCeti.ModularCurves.parabolic_duality` with the following mathematical specification. The elliptic cup product L⊗L→A(−1) induces Sym^r L⊗Sym^r L→A(−r). For A=K it is perfect. For finite or integral coefficients assume r! is a unit (in particular ℓ>r); then the symmetrized tensor pairing is perfect with the chosen normalization. On parabolic H¹ it induces a pairing into A(−r−1), alternating for even r and symmetric for odd r. The rational pairing is nondegenerate; integral/finite perfection is exported only in the localized setting of localized-freeness, where boundary and coefficient-reduction obstructions vanish. Pullback and trace are adjoint.

A complete DVR O of residue characteristic ℓ; finite coefficients O/πⁿ; integral conclusion additionally needs finite freeness and boundary conditions. At ℓ≤r no integral perfectness is inferred from Deligne’s rational statement; a different divided-power lattice would require its own comparison.

(DELIGNE-355, (3.20), pp. 159–160: Coefficient pairing, rational nondegeneracy, parity and the degree formula are stated there; integral perfection requires the extra lattice hypotheses.)

Construct and prove this as follows. Form the coefficient pairing by symmetrizing products of the alternating rank-two elliptic pairing; invert r! when necessary. Apply EDC.2 curve duality to j_*L and its dual, or Betti Poincaré–Lefschetz duality. Restrict the compact-support/ordinary pairing to their common image, using the vanishing and exactness hypotheses to prove integral perfection. The sign is the coefficient sign (−1)^r times the degree-one cup sign.

**Checks.**

- r=0 gives an alternating curve pairing; r=1 gives a symmetric pairing.
- A rationally perfect pairing whose determinant is divisible by ℓ is not an integral acceptance case.

*Needs:* Geometric weight coefficient systems (`ModularCurvesPartII:R14.3/relative-coefficient-system`); Hecke operators with relative coefficients (`ModularCurvesPartII:R14.3/geometric-hecke-coefficients`); Finite generation and localized integral freeness (`ModularCurvesPartII:R14.3/localized-freeness`); `EtaleDualityAndPerverseSheaves:EDC.2`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

### R14.3.11 Non-Eisenstein removal of the boundary

Prove `TauCeti.ModularCurves.boundary_non_eisenstein` with the following mathematical specification. For weight-two constant coefficients at a torsion-free congruence level and an anemic Hecke maximal ideal m of residue characteristic ℓ≥3, call m non-Eisenstein if its good-prime eigenvalues are not ψ₁(q)+qψ₂(q) with ψ₁,ψ₂ finite congruence characters and diamond product ψ₁ψ₂. The cusp boundary modules and H⁰(Y,O/π) have only those Eisenstein eigensystems. Thus they vanish after localization at m, and H¹_c→H¹ identifies its localized image with ordinary localized H¹. For Sym^r coefficients the same implication is a separate requested calculation, not an assertion from the weight-two source.

Anemic operators exclude level and residue-characteristic primes; fine level removes stabilizer torsion. In weight two this definition is an algebraic Hecke condition; the identification with residual Galois irreducibility is a consequence in R19, not a prerequisite here.

(TAYLOR-WILES, Proof of Proposition 1 and preceding localization setup, author pp. 6–8: Localized irreducible weight-two cohomology replaces open-curve cohomology by the cuspidal module; the boundary calculation must precede that replacement.)

Construct and prove this as follows. Compute the two parts of the good-prime correspondence on cusps from R14.1: one permutes with multiplicity q and the other with multiplicity one. Diagonalize the finite cusp action after extending residue coefficients; obtain the displayed sums of congruence characters. Apply exact localization to the boundary sequence; compute H⁰ by constants.

**Checks.**

- An Eisenstein maximal ideal may retain cusp classes.
- The statement does not demand a Galois representation theorem to define non-Eisenstein localization.

*Needs:* Boundary and interior cohomology (`ModularCurvesPartII:R14.3/boundary-exact-sequence`); Hecke operators with relative coefficients (`ModularCurvesPartII:R14.3/geometric-hecke-coefficients`); Full and cyclic isogeny correspondences (`ModularCurvesPartII:R14.1/full-and-cyclic-correspondences`); Diamond operators (`ModularCurvesPartII:R14.1/diamond-operators`); Classical and geometric Hecke actions (`ModularCurvesPartII:R14.1/analytic-comparison-of-correspondences`).

### R14.3.12 Finite generation and localized integral freeness

Prove `TauCeti.ModularCurves.localized_freeness` with the following mathematical specification. For a torsion-free congruence modular curve Y and a finite free O-local system L, H¹(Y,L) is O-finite. If H⁰(Y,L/π)_m=0, the localized group H¹(Y,L)_m is O-torsion-free, hence O-free; if in addition the boundary sequence localizes to zero, it equals H¹_par(Y,L)_m, and reduction gives H¹_par(Y,L)_m/πⁿ≅H¹_par(Y,L/πⁿ)_m. Constant weight-two coefficients satisfy these conditions at the non-Eisenstein ideals of boundary-non-eisenstein. Higher-weight claims retain the displayed vanishing conditions until the separate boundary gap is resolved.

O is a complete DVR finite over ℤ_ℓ; anemic localization is a direct summand of the completed O-finite Hecke module. Use a finite graph deformation retract of the noncompact torsion-free quotient; its two-term cochain complex has finite free terms.

(TAYLOR-WILES, Proof of Proposition 1, author pp. 7–8: Free congruence groups give finite cochains; compact localized cohomology is recovered only after boundary removal.) (DELIGNE-355, Definition 3.9 and (3.20), pp. 154–155, 159–160: The integral statement refines the rational parabolic realization with explicit torsion hypotheses.)

Construct and prove this as follows. Import the Fuchsian finite-type/free-group model and twisted cochains. The coefficient sequence 0→L→L→L/π→0 shows π-torsion in H¹ is the image of H⁰(L/π); the localized vanishing kills it. A finite torsion-free module over a DVR is free; graph cohomological dimension one removes H² obstructions to reduction. Use the boundary sequence at O and finite levels to identify ordinary and parabolic groups under the stated vanishings.

**Checks.**

- No freeness over the integral Hecke algebra is asserted.
- At level divisible by ℓ, or with coarse stabilizers, the displayed geometric and vanishing hypotheses must be checked afresh.

*Needs:* Boundary and interior cohomology (`ModularCurvesPartII:R14.3/boundary-exact-sequence`); Non-Eisenstein removal of the boundary (`ModularCurvesPartII:R14.3/boundary-non-eisenstein`); `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`.

### R14.3.13 Modular symbols and the geometric lattice

Prove `TauCeti.ModularCurves.symbols_geometric_comparison` with the following mathematical specification. For the torsion-free congruence quotient Y_an, use a compact oriented surface B with boundary circles obtained by truncating its cusp ends; its interior is Y_an and B≃Y_an. Extend the local system L_r and its coefficient dual to B via this homotopy equivalence. Compare the imported homological Manin-symbol module with H₁(B,∂B;L_r^∨), after fixing the standard-versus-relative-H¹ representation convention. Its boundary lands in H₀(∂B;L_r^∨), whose cusp terms are monodromy coinvariants. The cuspidal kernel modulo torsion gives the dual parabolic cohomological lattice rationally, and integrally only with the stated comparison, saturation and perfectness hypotheses. For r=0 the constant-coefficient comparison recovers H₁(X_an,D;A). Integration is a functional on symbols and Hecke acts on the dual by transpose.

The symbol lattice is the existing coinvariants of Div⁰(P¹(Q))⊗Sym^r(ℤ²), not a second definition of that object. Integral conclusions use the local coefficient dual and saturation; the whole symbol module contains boundary and may contain torsion. For r>0 cusp monodromy can be nontrivial, so L_r need not extend as a local system across the collapsed cusps of X_an. The pair (X_an,D;L_r) is not used in that case.

(DELIGNE-355, §3.11, p. 156 and (3.20), pp. 159–160: Geometric cohomology is the realization underlying the period comparison; the integral symbol presentation is imported from its existing owner.) (ribetstein, Theorems 5.1–5.2, pp. 65–66: Weight-two Hodge classes and integration determine the normalization of the comparison.) (FUNKE-MILLSON, §2, p. 8; Lemma 3.8 and Remark 3.9, p. 12; Proposition 3.11, p. 13: The surface compactification adds cusp circles; geodesics with coefficients define relative classes, and the boundary calculation uses monodromy coinvariants. Their rational even symmetric-power setting illustrates this model, not the unrestricted integral Manin comparison.)

Construct and prove this as follows. Use cusp collars to construct B and the coefficient extension; import relative chains and manifold duality from AlgebraicTopology Stages 2/6. Fix the explicit equivariant identification of the standard symbol coefficient representation with the appropriate dual of the geometric relative H¹ lattice, including determinant twists. Send each symbol to its geodesic relative chain, and compare Manin relations and cusp coinvariants. The precise integral presentation comparison remains the recorded lattice gap. Use the boundary long exact sequence and duality on B to pass from the cuspidal homological kernel to the parabolic image. Retain torsion, saturation and the coefficient dual. Match integration and Hecke pull-push with the existing period functional. Deligne supplies the rational cohomological realization, not an integral Manin-presentation theorem.

**Checks.**

- The period map lands in the dual of symbols, as the current ModularForms roadmap requires.
- The boundary quotient is not erroneously retained as part of compact H¹.

*Needs:* `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; Parabolic Poincaré pairing (`ModularCurvesPartII:R14.3/parabolic-duality`).

### R14.3.14 The actual Jacobian Tate realization

Prove `TauCeti.ModularCurves.weight_two_tate_comparison` with the following mathematical specification. For J=Pic⁰(X₁(N)/Q), the canonical comparison identifies T_ℓJ with H¹_et(X₁(N)_Q̄,ℤ_ℓ(1)) and with the dual of untwisted H¹, using the principal polarization; equivalently T_ℓJ is integral first homology after Betti comparison. The comparison is functorial for Picard and Albanese actions, which are adjoint rather than identical. After tensoring Q_ℓ it intertwines the two Hecke conventions. The rank-two consequence is proved in betti-free-rank-two using this comparison; it is not an input to the comparison itself.

This comparison precedes rank-two freeness. The initial Tate carrier and functoriality from R14.2 must not depend on betti-free-rank-two.

(ribetstein, §5.1, (5.4) and Theorem 5.8, pp. 68–69; Corollary 5.9, pp. 69–70: The Tate/homology comparison and the two Hecke actions transport the rational freeness theorem.)

Construct and prove this as follows. Apply the Kummer sequence for the Jacobian/Picard functor to identify ℓⁿ torsion with finite curve H¹(1). Pass to limits using the supplied Tate module construction; compare cup and Weil pairings. Use polarization to relate Picard pullback to Albanese norm; apply the integral comparison on the Betti side.

**Checks.**

- A Tate twist or a dual cannot be omitted when comparing T_ℓJ with untwisted H¹.
- The comparison supplies the actual Jacobian module, not an abstract module declared free by definition.
- With Conrad’s Weil-pairing convention, the diagram comparing cup and Weil pairings anticommutes (§5.1, p. 69). Preserve that sign; it does not change the resulting adjoints.

*Needs:* The modular Jacobian Tate module (`ModularCurvesPartII:R14.2/tate-module-with-galois-and-hecke-actions`); Polarization and Hecke adjoints (`ModularCurvesPartII:R14.2/weil-pairing-adjointness`); `AbelianSchemesAndArithmeticModuli:A4`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`; Integral comparison and change of level (`ModularCurvesPartII:R14.3/integral-comparison`); `EtaleDualityAndPerverseSheaves:EDC.2`.

### Examples

For constant coefficients on G_m(ℂ), ordinary H¹ is ℤ but the parabolic image is zero. For the compact genus-one X₀(11), constant integral H¹ has rank two. Weight 2 gives Sym⁰ of rank one and weight 3 gives Sym¹ of rank two with nontrivial elliptic monodromy. At ℓ≤r the denominators in symmetrization cannot be dismissed; the rational perfect pairing does not establish an integral unimodular one.

### Dependencies

`ModularCurvesPartII:R12.5`; `ModularCurvesPartII:R14.1`; `ModularCurvesPartII:R14.2`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`; `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`; `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`; `ModularCurvesPartII:R13.2`; `AbelianSchemesAndArithmeticModuli:A4`; `tauceti:TauCeti.LocalCoefficientSystem`; `tauceti:TauCeti.LocalCoefficientSystem.pullback`; `tauceti:Representation.symmetricPower`; `EtaleDualityAndPerverseSheaves:EDC.0`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`; `tauceti:SymmetricPower.finrank_eq`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; `mathlib:LinearMap.range`; `mathlib:AlgebraicGeometry.Scheme.EllAdicCohomology`; `EtaleDualityAndPerverseSheaves:EDC.1`; `SchemeAndStackFoundations:SF.2`; `mathlib:AlgebraicGeometry.Scheme.ellAdicSheaf`; `EtaleDualityAndPerverseSheaves:EDC.2`; `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`. Individual target dependencies above give the finer contracts.

## Layer R14.4: Ihara and level-change statements

The tree/amalgam and congruence kernel are genuine group-theoretic inputs. Principal-level ordinary H¹ has a congruence-class obstruction; compact weight-two Γ₁ cohomology has a different injectivity theorem. The selected-root theorem localizes both sides and preserves component and normalization choices.

### R14.4.1 The two geometric degeneracy pullbacks

Define `TauCeti.ModularCurves.degeneracyH1` with the following mathematical specification. For Γ=Γ₁(N) and p prime with p∤N, put Γ′=Γ₁(N)∩Γ₀(p); both maps δ₁,δ_p:X_Γ′→X_Γ come from the moduli correspondence. With the specified isogeny coefficient maps, define d_p(x,y)=δ₁^*x+δ_p^*y on the compact, ordinary, compact-support or parabolic cohomology groups where those maps are defined. On ordinary group characters the kernel equation is equally expressed by D_p(ψ,φ)=ψ|_{Γ′}−φ∘(g↦AgA⁻¹), A=diag(p,1), after negating the second summand. This sign change is recorded, not treated as a change of level.

Mixed Γ₁(N)∩Γ₀(p) is not Γ₁(Np). Coefficients O or O/πⁿ; constant coefficients for the integral compact Ihara result, Sym^r only with explicitly checked coefficient maps.

(RIBET-1984, §3, pp. 507–508; §4, pp. 510–513: The mixed-level degeneracy map on Jacobians and compact cohomology.) (CDT-2025, §4.6, Lemma 4.6.2, p. 33: Ordinary degree-one restriction uses the difference of the two character maps.)

The interface serves ModularCurvesPartII:R14.4/compact-ihara: The compact weight-two map whose mod-ℓ injection gives saturation; ModularCurvesPartII:R14.4/principal-ihara: The ordinary restriction difference used in the congruence-kernel theorem.

Provide the following named interface results.

- `TauCeti.ModularCurves.degeneracyH1`: For the actual pullbacks a,b:H→H′, degeneracyH1 a b sends (x,y) to a(x)+b(y).
- `TauCeti.ModularCurves.degeneracyH1_apply`: Evaluation on a pair is the sum of its two geometric images.
- `TauCeti.ModularCurves.degeneracyH1_fst`: The first source inclusion composes to a.
- `TauCeti.ModularCurves.degeneracyH1_snd`: The second source inclusion composes to b.
- `TauCeti.ModularCurves.degeneracyH1_hecke`: If a and b intertwine the same anemic operators, their coprod intertwines the product action.
- `TauCeti.ModularCurves.degeneracyH1_sign`: Negating the second source converts the sum convention into the ordinary restriction-difference convention.

Construct and prove this as follows. Import δ₁,δ_p from R14.1 and their coefficient maps from R14.3. Form the coprod of the actual two pullbacks; prove the support squares and common anemic Hecke equivariance. Identify conjugation by A with the second analytic level map; negation of one source copy relates sum and difference conventions.

**Checks.**

- `degeneracyH1_first`: With a=id and b=0 on O, (3,5) maps to 3.
- `degeneracyH1_diagonal`: With a=b=id on O, (1,−1) is in the kernel; injection is a geometric theorem, not a generic property of coprods.
- `degeneracyH1_zero`: Two zero maps give the zero map.
- `degeneracyH1_comp`: Postcomposing by c gives degeneracyH1 (c∘a) (c∘b).
- Away from Np the map commutes with T_q and diamonds.
- Do not substitute a map to Γ₁(Np) unless the extra covering and its torsion are explicitly handled.

*Needs:* Compactified Hecke degeneracy maps (`ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`); Integral étale correspondence trace (`ModularCurvesPartII:R14.1/integral-etale-trace`); Hecke operators with relative coefficients (`ModularCurvesPartII:R14.3/geometric-hecke-coefficients`); `mathlib:LinearMap.coprod`.

### R14.4.2 The principal-level SL₂ amalgam

Prove `TauCeti.ModularCurves.modular_amalgam` with the following mathematical specification. For N≥3 and prime p∤N, let Γ_N(R)=ker(SL₂(R)→SL₂(ℤ/N)) for R=ℤ[1/p], and Γ(N)=Γ_N(ℤ). The natural inclusions and conjugation by A=diag(p,1) identify Γ_N(ℤ[1/p]) with Γ(N)*_{Γ(N)∩Γ₀(p)}A⁻¹Γ(N)A. The associated SL₂(Q_p) lattice tree has a fundamental edge with these vertex and edge stabilizers; the action preserves vertex type. The central quotient or signed Γ(N) variant must be changed consistently throughout the presentation.

p and N are coprime; A is invertible over ℤ[1/p] and conjugates preserve reduction level because p is a unit modulo N. The tree vertices are homothety classes of rank-two ℤ_p lattices; adjacent representatives have quotient of order p.

(SERRE-TREES, II §1.4, Theorem 3 and Corollary 2, p. 110: Fundamental-edge criterion and SL₂(ℤ[1/p]) presentation.) (CDT-2025, §4.4, pp. 27–28; proof of Lemma 4.6.2, pp. 33–34: The principal-level subgroup has the corresponding amalgam.)

Construct and prove this as follows. Construct the lattice tree and verify connectivity and unique geodesics by elementary divisors over ℤ_p. Identify the standard adjacent-lattice stabilizers in SL₂ and their arithmetic intersections. Use strong approximation/density, together with surjectivity of reductions prime to p, to show the principal congruence arithmetic group has that edge as fundamental domain. Apply the tree presentation, retaining the two distinct embeddings of the edge subgroup.

Existing suppliers replace the first two steps and the density input. The tree of SL₂(ℚ_p), its type-preserving action without inversion and the local amalgam SL₂(ℚ_p)=SL₂(ℤ_p)*_I gSL₂(ℤ_p)g⁻¹ are ReductiveGroupsPartII RG2.2/sl2-tree and RG2.2/ihara-amalgam, a TauCetiRoadmap roadmap; strong approximation for SL₂ with S={∞} and S={∞,p} is AdelicAlgebraicGroups AA.4. This target proves only the arithmetic step: Γ_N(ℤ[1/p]) is dense in SL₂(ℚ_p) and surjects onto SL₂(ℤ/N), so it has the standard edge as fundamental domain, and the segment-amalgam theorem gives the presentation.

**Checks.**

- At p|N the statement is not asserted.
- An unrestricted PGL₂ action that exchanges vertex types does not have this same amalgam.

*Needs:* `mathlib:groupCohomology.H1`; `ReductiveGroupsPartII:RG2.2/sl2-tree`; `ReductiveGroupsPartII:RG2.2/ihara-amalgam`; `AdelicAlgebraicGroups:AA.4/strong-approximation-sufficiency`; `AdelicAlgebraicGroups:AA.4/strong-approximation-finite-places`.

### R14.4.3 Congruence subgroup property of SL₂(ℤ[1/p])

Prove `TauCeti.ModularCurves.congruence_subgroup_property` with the following mathematical specification. For a prime p every finite-index subgroup H of SL₂(ℤ[1/p]) contains ker(SL₂(ℤ[1/p])→SL₂(ℤ/m)) for some positive m coprime to p. The same conclusion, intersected with Γ_N(ℤ[1/p]), holds for every finite-index subgroup of that principal-level group. This is the split real S-arithmetic specialization of Serre’s congruence kernel theorem, with S={∞,p}; it is not a statement about all finite-index subgroups of SL₂(ℤ).

Serre’s condition |S|≥2 and the real-place alternative both hold. The proof uses the specific S-arithmetic congruence kernel theorem; its deeper central-extension input is recorded as a gap rather than imported from an unrelated profinite-power roadmap.

(SERRE-CSP, §2.6, Theorem 2 and Corollary 3, pp. 498–500: The real-place S-arithmetic congruence kernel is trivial when S contains at least two places.) (CDT-2025, Proof of Lemma 4.6.2, p. 34: A finite character of the amalgam factors through a congruence quotient by this theorem.)

Construct and prove this as follows. Apply Serre §2.6 Theorem 2 and Corollary 3 with Q and S={∞,p}. Translate the trivial congruence kernel into the stated finite-index containment. A finite-index subgroup of Γ_N is also finite index in SL₂(ℤ[1/p]); intersect the congruence kernel with Γ_N.

**Checks.**

- Finite characters of Γ_N(ℤ[1/p]) factor through a finite congruence quotient.
- The conclusion is not derived from mere density of the group in SL₂(Q_p).

*Needs:* The principal-level SL₂ amalgam (`ModularCurvesPartII:R14.4/modular-amalgam`).

### R14.4.4 Lyndon sequence for the modular amalgam

Prove `TauCeti.ModularCurves.lyndon_exact_sequence` with the following mathematical specification. For the actual amalgam G=G₁*_{H}G₂ of modular-amalgam and a G-module M, there is a natural exact sequence …→H^i(G,M)→H^i(G₁,M)⊕H^i(G₂,M)→H^i(H,M)→H^{i+1}(G,M)→…, with the middle map the difference of restrictions along the two embeddings. At i=0 it begins with invariants. The same sequence is equivariant for double-coset maps that preserve the diagram, using restriction and transfer with the displayed coefficient actions.

M is an actual representation of the amalgam; the two restricted modules on H are identified through that representation. The degree of the first displayed group is i, not i−1.

(SERRE-TREES, II §2.8, Proposition 13 and example, pp. 168–170: Tree homology gives the exact cohomological sequence, with the correct degree.) (CALEGARI-GERAGHTY, Lemma 9.6, pp. 89–90 (author preprint); Springer-layout author copy PDF pp. 122–123: The modular double-coset application uses this sequence; its displayed degree is corrected here.)

Construct and prove this as follows. Use the cellular chain sequence of the contractible tree: 0→ℤ[G/H]→ℤ[G/G₁]⊕ℤ[G/G₂]→ℤ→0. Apply a group-cohomology resolution, Shapiro and the connecting morphisms, or equivalent classifying-space Mayer–Vietoris. Construct correspondence maps on this chain sequence to obtain the equivariance required for the normalized U_p² argument. Apply Mathlib groupCohomology.coindIso for Shapiro; the new work is its compatibility with the tree cochain sequence or finite diamond cover.

**Checks.**

- H⁰(G,M) is the kernel of the difference on vertex invariants.
- For trivial M=F_q, an agreeing pair of characters descends to a character of G.

*Needs:* The principal-level SL₂ amalgam (`ModularCurvesPartII:R14.4/modular-amalgam`); `mathlib:groupCohomology.H1`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `mathlib:groupCohomology.coindIso`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

### R14.4.5 Congruence classes in ordinary H¹

Define `TauCeti.ModularCurves.congruenceClasses` with the following mathematical specification. For Γ(N)⊂SL₂(ℤ), N≥3, and a prime q, identify ordinary H¹(Γ(N),F_q) with Hom(Γ(N),F_q) for the trivial additive action. Define H¹_cong as the subspace of characters ψ for which Γ(M)⊂ker ψ for some positive M divisible by N. Equivalently it is the directed union of the pullbacks of characters of finite congruence quotients Γ(N)/Γ(M). It is not defined as all ordinary cohomology or as the parabolic subspace.

All principal kernels are taken in SL₂(ℤ), consistently with the chosen signed/central quotient convention.

(CDT-2025, §4.5, definition of H¹_cong, pp. 29–30; Lemma 4.6.2, p. 33: The ordinary characters trivial at a deeper principal level are exactly the congruence classes.)

The interface serves ModularCurvesPartII:R14.4/principal-ihara: Precise kernel bound; ModularCurvesPartII:R14.4/enhanced-ihara: The residual congruence-class conclusion at Γ₁(p) level.

Provide the following named interface results.

- `TauCeti.ModularCurves.congruenceClasses`: For the directed family Γ(M) inside Γ(N), the submodule of additive characters killing one of these kernels.
- `TauCeti.ModularCurves.mem_congruenceClasses`: Membership is equivalent to vanishing on some Γ(M), N|M.
- `TauCeti.ModularCurves.congruenceClasses_refine`: A character killing Γ(M) also kills Γ(M′) whenever M|M′.
- `TauCeti.ModularCurves.congruenceClasses_quotient`: A character killing Γ(M) descends uniquely to Γ(N)/Γ(M).
- `TauCeti.ModularCurves.congruenceClasses_restrict`: Restriction to a deeper principal subgroup preserves congruence classes.
- `TauCeti.ModularCurves.congruenceClasses_H1`: The classifying map is the actual trivial-action H¹/character isomorphism.

Construct and prove this as follows. Use the trivial-action H¹-to-character comparison. The common refinement lcm(M₁,M₂) proves closure under addition and scalar multiplication, giving a submodule. Use quotient descent to prove the finite-congruence-quotient characterization.

**Checks.**

- `congruenceClasses_zero`: The zero character kills every deeper principal subgroup.
- `congruenceClasses_finiteQuotient`: Pulling back a character of Γ(N)/Γ(M) gives a member.
- `congruenceClasses_joint`: If ψ kills Γ(M₁) and φ kills Γ(M₂), ψ+φ kills Γ(lcm(M₁,M₂)).
- `congruenceClasses_noncongruence`: At Γ(3) with F₅ coefficients the congruence subspace is zero, whereas ordinary H¹ has dimension three. A nonzero ordinary character is therefore not a congruence class. Use the pro-3 level factor and the perfectness/abelianization of the other SL₂(Z_p) factors, as in CDT §4.5, to check the finite congruence quotients.
- The zero character is congruence; every character pulled from Γ(N)/Γ(M) is congruence.
- A character known only to have finite image is not thereby proved congruence.

*Needs:* `mathlib:groupCohomology.H1`; `mathlib:CongruenceSubgroup.Gamma`; `mathlib:groupCohomology.H1IsoOfIsTrivial`; `tauceti:CongruenceSubgroup.Gamma_le_Gamma_of_dvd`.

### R14.4.6 Principal-level Ihara modulo congruence classes

Prove `TauCeti.ModularCurves.principal_ihara` with the following mathematical specification. For N≥3 and primes p,q with p∤N, the kernel of D_p:H¹(Γ(N),F_q)²→H¹(Γ(N)∩Γ₀(p),F_q), D_p(ψ,φ)(g)=ψ(g)−φ(AgA⁻¹), is contained in H¹_cong(Γ(N),F_q)². There is no requirement q≠p in this ordinary character theorem, and no unconditional injectivity assertion.

Trivial F_q coefficients; ordinary group cohomology, not compact cohomology or an arbitrary Sym^r system.

(CDT-2025, Lemma 4.6.2 with proof, pp. 33–34: Kernel classes extend to the S-arithmetic group and are therefore congruence characters.)

Construct and prove this as follows. An element of the kernel is an agreeing pair of additive characters for the amalgam, so it extends to a character of Γ_N(ℤ[1/p]). Its image is finite. Apply congruence-subgroup-property to its kernel. Restrict the resulting congruence factorization back to each integral vertex subgroup; both original characters lie in H¹_cong.

**Checks.**

- Kernel zero follows only after independently killing the congruence subspaces in the chosen quotient/localization.
- The q=p case is covered by this character argument, not by ℓ-adic geometric smoothness.

*Needs:* The two geometric degeneracy pullbacks (`ModularCurvesPartII:R14.4/degeneracy-cohomology`); Congruence classes in ordinary H¹ (`ModularCurvesPartII:R14.4/congruence-classes`); Lyndon sequence for the modular amalgam (`ModularCurvesPartII:R14.4/lyndon-exact-sequence`); Congruence subgroup property of SL₂(ℤ[1/p]) (`ModularCurvesPartII:R14.4/congruence-subgroup-property`).

### R14.4.7 The enhanced principal-level kernel bound

Prove `TauCeti.ModularCurves.enhanced_ihara` with the following mathematical specification. With N,p,q as in principal-ihara, the kernel of the same restriction difference into H¹(Γ(N)∩Γ₁(p),F_q) is also contained in H¹_cong(Γ(N),F_q)². The congruence-invariance criterion used here says that if every conjugation difference for a character of a principal subgroup is congruence, then the character itself is congruence, as in CDT Corollary 4.5.3 with the SL₂(Z/N)-action induced by ambient SL₂(ℤ) conjugations.

This is still trivial-coefficient ordinary H¹ and still a kernel bound, not automatic injectivity.

(CDT-2025, Corollary 4.5.3, p. 29; Lemma 4.6.3, p. 34: Congruence invariance strengthens the Γ₀(p) kernel bound to Γ₁(p); the ambient conjugations must be retained.)

Construct and prove this as follows. Restriction to Γ(N)∩Γ₁(p) implies that the disagreement on Γ(N)∩Γ₀(p) is a congruence class because the quotient of these two groups is congruence. Follow the ambient conjugations in CDT Lemma 4.6.3 and apply Corollary 4.5.3 to the two source characters. Use the principal-level kernel bound after the congruence error is removed.

**Checks.**

- The enhancement is not proved by treating restriction across a finite quotient as injective when q divides its order.

*Needs:* Principal-level Ihara modulo congruence classes (`ModularCurvesPartII:R14.4/principal-ihara`); Congruence classes in ordinary H¹ (`ModularCurvesPartII:R14.4/congruence-classes`); Congruence invariance of ordinary characters (`ModularCurvesPartII:R14.4/congruence-invariance`).

### R14.4.8 Compact weight-two Ihara and saturation

Prove `TauCeti.ModularCurves.compact_ihara` with the following mathematical specification. For N≥5 and prime p∤N, let X′ be the compact curve of Γ₁(N)∩Γ₀(p). The map δ₁^*+δ_p^*:H¹(X₁(N),F_ℓ)²→H¹(X′,F_ℓ) is injective for every prime ℓ. Equivalently the sum of the two Jacobian pullbacks J₁(N)²→Jac(X′) has trivial kernel (Ribet Corollary 4.2). The corresponding integral H¹ map has torsion-free cokernel; after O-extension it is saturated and remains injective modulo πⁿ. For Γ₀(N), Ribet Theorem 4.3 gives kernel the anti-diagonal Shimura subgroup, not unconditional injectivity; localization away from its Eisenstein support removes that kernel.

Weight two means constant coefficients. The compact curves are smooth in characteristic zero, so no ℓ∤N hypothesis is added to this Betti statement. The Γ₀ version needs a supplied Shimura subgroup and its Eisenstein Hecke action; small levels and stabilizers use their actual compact curves.

(RIBET-1984, Theorem 4.1, Corollary 4.2 and Theorem 4.3, pp. 510–513: The compact Jacobian result and its parabolic homology proof yield integral saturation, including the distinct Γ₀ kernel.)

Construct and prove this as follows. Ribet’s compact homology proof quotients ordinary abelianizations by the subgroups generated by parabolics; the amalgam and CSP show the two-map integral homology map is surjective. Dualize the compact free homology lattices to obtain integral cohomology injection with saturated image. Alternatively use the zero Jacobian kernel of Corollary 4.2 and the Tate comparison; reduce the saturated integral map at every ℓ. For Γ₀ retain the anti-diagonal Shimura kernel of Theorem 4.3 and remove it only under the explicit support hypothesis.

**Checks.**

- This supplies the mixed-level, weight-two cohomological Ihara input of R20.2 even when ℓ|N.
- It does not supply the exceptional-image or multiplicity-one steps of mod-two level lowering.
- For N=11,p=2, the source compact rank is 2·2=4, and its image in the mixed level has saturated rank four.

*Needs:* The two geometric degeneracy pullbacks (`ModularCurvesPartII:R14.4/degeneracy-cohomology`); The principal-level SL₂ amalgam (`ModularCurvesPartII:R14.4/modular-amalgam`); Congruence subgroup property of SL₂(ℤ[1/p]) (`ModularCurvesPartII:R14.4/congruence-subgroup-property`); The actual Jacobian Tate realization (`ModularCurvesPartII:R14.3/weight-two-tate-comparison`); Modular Jacobians and norms (`ModularCurvesPartII:R14.2/jacobian-and-functoriality`); The modular Jacobian Tate module (`ModularCurvesPartII:R14.2/tate-module-with-galois-and-hecke-actions`).

### R14.4.9 Taylor–Wiles degeneracy control

Prove `TauCeti.ModularCurves.taylor_wiles_root_control` with the following mathematical specification. For constant coefficients O/πⁿ, odd residue characteristic ℓ, torsion-free modular level Γ with p∤Nℓ, and a localized cyclotomic-determinant residual eigensystem at which p≡1 mod ℓ and T_p has residual roots α,β with αβ=1 and α≠β, the two degeneracy images identify H^i(Y,O/πⁿ)_m² with the sum of the two selected old-root factors in H^i(Y₀(p),O/πⁿ). Localization additionally at U_p−α identifies its factor with one copy of H^i(Y,O/πⁿ)_m. The operator normalization is the one in CG Lemma 9.6; in the general character setting the off-diagonal diamonds must be restored and checked, not suppressed.

α,β∉{1,−1} follows from odd ℓ and αβ=1, α≠β. The full anemic localized target is not asserted to have no additional U_p=±1 factors; those are killed in the selected U_p²−1 localization.

(CALEGARI-GERAGHTY, Lemma 9.6 and Remarks 9.7–9.8, pp. 88–90; author Springer-layout copy PDF pp. 120–123: The all-degree finite-coefficient root-control argument; the degree and determinant misprints are corrected, and localization at the root is made explicit.)

Construct and prove this as follows. Compute trace∘pullback matrix [[p+1,T_p],[T_p,p+1]] and its determinant (p+1)²−T_p²; it is a unit at the selected residual roots. Use the correctly graded Lyndon sequence: the normalized double-coset operator for diag(p,p⁻¹) acts as identity on the amalgam terms. Localize at U_p²−1 to remove both adjacent amalgam terms and identify the two-copy old factors. Apply the idempotent for the distinct roots and descend across any elementary two-group component quotient, whose order is invertible.

**Checks.**

- The repeated-root case α=β is excluded.
- The proof cannot use exact invariants for a quotient whose order is divisible by ℓ.

*Needs:* Lyndon sequence for the modular amalgam (`ModularCurvesPartII:R14.4/lyndon-exact-sequence`); The two geometric degeneracy pullbacks (`ModularCurvesPartII:R14.4/degeneracy-cohomology`); Finite generation and localized integral freeness (`ModularCurvesPartII:R14.3/localized-freeness`).

### R14.4.10 Congruence invariance of ordinary characters

Prove `TauCeti.ModularCurves.congruence_invariance` with the following mathematical specification. For N≥3, prime q and η∈H¹(Γ(N),F_q), let SL₂(Z/N) act by the conjugations of ambient SL₂(Z). If gη−η belongs to H¹_cong(Γ(N),F_q) for every g∈SL₂(Z/N), then η itself belongs to H¹_cong. Equivalently, the direct limit of ordinary H¹ over principal levels, with restriction transition maps, has no SL₂(Ẑ)-invariants. This direct-limit character input is the specific prerequisite of enhanced-ihara, rather than a completion of the completed-cohomology roadmap.

The action factors through the finite quotient because inner conjugation acts trivially on trivial-coefficient H¹. The coefficient prime may be 2 or 3; the proof retains the exceptional small-prime calculations.

(CDT-2025, Theorem 4.5.2 and Corollary 4.5.3, p. 29; Lemmas 4.5.4–4.5.11 and proof, pp. 30–32; published §§4.5–4.6, pp. 661–666: The no-invariants theorem gives the finite-level criterion; retain the small-prime proof and corrected coefficient in the level-5 computation.)

Construct and prove this as follows. Pass to the restriction direct limit; its kernel from a finite level consists exactly of the congruence classes, and the hypothesis makes the image invariant. Follow CDT §§4.5.4–4.5.9: finite SL₂ homology, continuous cohomology of SL₂(Z_p), Künneth and Hochschild–Serre isolate coefficient primes 2,3,5 and show the relevant H² restriction vanishes at deeper levels. Use the genus-zero cusp representation at levels 3 and 5 with coefficients F₃ and F₅ respectively; at coefficient prime 2 use the level-8 to level-16 calculation. Lemma 4.5.11’s printed F₃ at level 5 is replaced by F₅, as required in its application. Apply the two five-term sequences of (4.5.10) and the corrected finite-level invariant computations to kill the invariant limit class. The source’s computer calculation at levels 8/16 and Lazard/adjoint-cohomology inputs remain proof-chain refinements in the recorded gap.

**Checks.**

- The condition must hold for every ambient finite-quotient conjugation, not just one level-changing element.
- An arbitrary noncongruence character cannot be declared congruence just because its codomain is finite.

*Needs:* Congruence classes in ordinary H¹ (`ModularCurvesPartII:R14.4/congruence-classes`); `mathlib:groupCohomology.H1`.

### Examples

For Γ(3), ordinary mod-5 H¹ has dimension three whereas its congruence-class subspace is zero; the ordinary principal kernel statement still names that subspace at every coefficient prime. At level 5 over F₃ the 12-cusp permutation module has an invariant constant vector in the augmentation kernel because 12=0 in F₃. This detects the printed F₃ coefficient in CDT Lemma 4.5.11; the intended level-5 calculation is over F₅. The matrix [[p+1,T_p],[T_p,p+1]] has determinant (p+1)²−T_p². Reversing its sign preserves invertibility, whereas shifting the Lyndon connecting degree does not preserve exactness.

### Dependencies

`ModularCurvesPartII:R14.1`; `ModularCurvesPartII:R14.3`; `mathlib:LinearMap.coprod`; `mathlib:groupCohomology.H1`; `ReductiveGroupsPartII:RG2.2`; `AdelicAlgebraicGroups:AA.4`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `mathlib:groupCohomology.coindIso`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`; `mathlib:CongruenceSubgroup.Gamma`; `mathlib:groupCohomology.H1IsoOfIsTrivial`; `tauceti:CongruenceSubgroup.Gamma_le_Gamma_of_dvd`; `ModularCurvesPartII:R14.2`. Individual target dependencies above give the finer contracts.

## Layer R14.5: modular quotients

Use the image Hecke algebra and the eigencharacter to form the connected Albanese quotient. Rational Tate exactness gives the dimension; the transported Picard construction has its own cotangent convention. Raised-level oldspaces keep all divisor degeneracies.

### R14.5.1 The Hecke prime and coefficient field of a newform

Define `TauCeti.ModularCurves.heckePrime` with the following mathematical specification. For a normalized cuspidal newform f of weight exactly two and primitive level N, import its coefficient field K_f from ModularForms Layers 8/8G. The geometric Hecke action gives the eigenvalue character λ_f:T₁(N)→K_f. Set p_f=ker λ_f; it is a minimal prime and (T₁(N)/p_f)⊗Q≅K_f. Coefficient fields, integrality of eigenvalues and the notion of newform are imports, not definitions of this layer.

f a normalised newform of weight 2 and level exactly N (Tau Ceti ModularForms Layer 4).

(ribetstein, Appendix by B. Conrad, p. 73 (printed page; PDF page 77): K_f.) (ribetstein, Appendix by B. Conrad, p. 73 (printed page; PDF page 77): p_f.)

The interface serves ModularCurvesPartII:R14.5/modular-quotient: The actual ideal cutting out the modular quotient; ModularCurvesPartII:R14.5/quotient-tate-exact: The ideal acting on the rational Tate module.

Provide the following named interface results.

- `TauCeti.ModularCurves.heckePrime`: Kernel ideal of the imported geometric eigenvalue character λ_f.
- `TauCeti.ModularCurves.mem_heckePrime`: t∈p_f iff λ_f(t)=0.
- `TauCeti.ModularCurves.heckePrime_isPrime`: The character lands in a field, so p_f is prime.
- `TauCeti.ModularCurves.heckePrime_quotient`: The integral quotient is canonically the image eigenvalue order by RingHom.quotientKerEquivRange; after rationalization it is K_f. The integral image need not be the maximal order.
- `TauCeti.ModularCurves.heckePrime_conjugate`: Postcomposing λ_f with a field embedding does not change its kernel.

Construct and prove this as follows. The eigenvalue map T₁(N) → ℂ has image the order ℤ[a_n(f)] ⊂ K_f; its kernel is prime. The integral Hecke algebra is finite and torsion-free over ℤ. Localizing at ℤ\{0} makes it a finite-dimensional commutative ℚ-algebra, hence Artinian; every prime there is minimal. Since λ_f has characteristic-zero image, p_f is disjoint from ℤ\{0}, and contraction of that minimal prime is minimal. This does not assume the full old-level Hecke algebra is reduced.

**Checks.**

- `heckePrime_int`: The kernel of ℤ→ℚ is zero.
- `heckePrime_projection`: For the first projection ℚ×ℚ→ℚ, the kernel is {0}×ℚ.
- `heckePrime_embedding`: An injective field embedding on the target preserves the kernel.
- Weak multiplicity one gives a_n(f) ∈ K_f for all n.

*Needs:* The geometric integral Hecke algebra (`ModularCurvesPartII:R14.2/integral-hecke-algebra`); `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`; `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`; `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`; `mathlib:RingHom.ker`; `mathlib:RingHom.quotientKerEquivRange`.

### R14.5.2 The modular abelian variety A_f

Define `TauCeti.ModularCurves.modularQuotient` with the following mathematical specification. With the Albanese Hecke action on J₁(N), let B_f be the connected abelian subvariety generated by all images t(J₁(N)), t∈p_f. Define A_f=J₁(N)/B_f over Q with its surjective quotient map q_f. It has good reduction outside N and an action of the order T₁(N)/p_f; the K_f action is in End⁰(A_f). This is a quotient by an actual abelian subvariety, not a pointwise module quotient or an assumed Galois representation.

N ≥ 5 (for N < 5, S₂(Γ₁(N)) = 0). Conrad Definition 5.13 uses the Albanese action ( )_* on J₁(N) of the (E,P) model. A Picard-action quotient must be separately constructed and transported by w_ζ over a field containing ζ. Neither the action nor the moduli model is silently changed on the same quotient.

(ribetstein, Appendix by B. Conrad, p. 73 (printed page; PDF page 77): Definition 5.13.) (ribetstein, Appendix by B. Conrad, p. 73 (printed page; PDF page 77): Good reduction.) (ribetstein, Chapter 2, §2.3.1.2, p. 29 (printed; PDF page 33): Ribet–Stein's formulation.)

The interface serves ModularCurvesPartII:R14.5/modular-quotient-dimension: Compute the dimension from the actual quotient Tate module; EllipticCurveModularity:R29.5: The surjective quotient and nonconstant curve map, before any isogeny to a specified elliptic curve.

Provide the following named interface results.

- `TauCeti.ModularCurves.modularQuotient`: The actual abelian variety J₁(N)/B_f, using the Albanese action.
- `TauCeti.ModularCurves.modularQuotient_map`: The surjective Q-homomorphism q_f:J₁(N)→A_f with connected kernel B_f.
- `TauCeti.ModularCurves.modularQuotient_kills`: q_f∘t=0 for every t∈p_f.
- `TauCeti.ModularCurves.modularQuotient_lift`: A homomorphism h:J₁(N)→B killing all p_f images descends uniquely through q_f.
- `TauCeti.ModularCurves.modularQuotient_baseChange`: Formation and the quotient map commute with field extension.
- `TauCeti.ModularCurves.modularQuotient_hecke`: The quotient order acts faithfully in characteristic zero; the induced rational action is K_f in End⁰(A_f).
- `TauCeti.ModularCurves.modularQuotientForIdeal`: For any ideal I of the supplied acting modular Hecke algebra, form the connected subvariety generated by its Albanese images and invoke the A6 quotient. modularQuotient f is this modular specialization at I=p_f; the generic abelian-subvariety quotient is imported, not redefined here.
- `TauCeti.ModularCurves.modularQuotient_lift_map`: The descended homomorphism composed with q_f equals the original h.
- `TauCeti.ModularCurves.modularQuotient_hom_ext`: Two homomorphisms out of A_f agree when their compositions with the surjective q_f agree.

Construct and prove this as follows. Use the actual Albanese action to form the connected abelian subvariety generated by t(J₁(N)), t∈p_f; finite ideal generators suffice. Import the quotient and its universal property from AbelianSchemesAndArithmeticModuli A6, whose positive-dimensional quotient input is requested explicitly. Apply the requested A6 good-reduction quotient theorem to J₁(N) over ℤ[1/N]; the resulting connected-subvariety quotient extends as an abelian scheme. This needs the positive-dimensional quotient theorem, not only the finite-flat-kernel quotient API.

**Checks.**

- `modularQuotient_zeroIdeal`: The modularQuotientForIdeal quotient attached to the zero ideal of an acting algebra is the supplied Jacobian itself.
- `modularQuotient_unitIdeal`: The modularQuotientForIdeal quotient for the unit ideal is the zero abelian variety; this tests the image-generated-kernel convention.
- `modularQuotient_level11`: For the rational weight-two newform of level 11 and trivial character, the J₀(11) quotient has dimension one.
- `modularQuotient_weight`: No Jacobian quotient is defined for a weight-12 level-one newform by this constructor.
- A_f is nonzero when f exists (modular-quotient-dimension).
- Do not assert a quotient of a modular-curve Jacobian for weight > 2.

*Needs:* The Hecke prime and coefficient field of a newform (`ModularCurvesPartII:R14.5/newform-hecke-prime`); Modular Jacobians and norms (`ModularCurvesPartII:R14.2/jacobian-and-functoriality`); Upper and lower Jacobian Hecke operators (`ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`); The geometric integral Hecke algebra (`ModularCurvesPartII:R14.2/integral-hecke-algebra`); `AbelianSchemesAndArithmeticModuli:A6`; `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`.

### R14.5.3 Tate module of the actual modular quotient

Prove `TauCeti.ModularCurves.quotient_tate_exact` with the following mathematical specification. For the actual quotient q_f:J₁(N)→A_f, the induced map identifies V_ℓ(A_f) with V_ℓ(J₁(N))/p_fV_ℓ(J₁(N)) as a module over Q_ℓ⊗T₁(N), with the chosen Albanese convention. Generic exactness of rational Tate modules for abelian-subvariety quotients is imported; integral exactness is not inferred by tensoring this rational statement.

ℓ prime; base characteristic zero. B_f is the actual connected image-generated kernel from modular-quotient.

(ribetstein, Appendix by B. Conrad, p. 73 (printed page; PDF page 77): The claim in the proof of Theorem 5.14.) (ribetstein, Appendix by B. Conrad, p. 73 (printed page; PDF page 77): Its proof.)

Construct and prove this as follows. Import rational Tate exactness for a connected abelian-subvariety quotient. Choose finitely many generators of p_f; the sum of their abelian images is B_f and gives a surjection J^a→B_f. Apply rational Tate exactness again to identify its image with p_fV_ℓJ.

**Checks.**

- Test: an isogeny B → A with kernel of order ℓ is surjective on V_ℓ but not on T_ℓ.

*Needs:* The modular abelian variety A_f (`ModularCurvesPartII:R14.5/modular-quotient`); `AbelianSchemesAndArithmeticModuli:A4`; `AbelianSchemesAndArithmeticModuli:A6`.

### R14.5.4 Shimura's theorem: dim A_f = [K_f : ℚ]

Prove `TauCeti.ModularCurves.modular_quotient_dimension` with the following mathematical specification. dim A_f = [K_f : ℚ], and V_ℓ(A_f) = V_ℓ(J₁(N))/p_f V_ℓ(J₁(N)) is free of rank 2 over ℚ_ℓ ⊗_ℚ K_f. In particular A_f ≠ 0 and dim V_ℓ(A_f) = 2[K_f : ℚ].

The Frobenius characteristic polynomial on V_ℓ(A_f) is AutomorphicGaloisRepresentations R19.1/R19.6's statement, not a defining property of A_f.

(ribetstein, Appendix by B. Conrad, p. 73 (printed page; PDF page 77): Theorem 5.14.) (ribetstein, Chapter 2, §2.3.1, p. 28 (printed; PDF page 32): Ribet–Stein's statement.)

Construct and prove this as follows. V_ℓ(J₁(N)) is free of rank 2 over ℚ_ℓ ⊗ T₁(N) (betti-free-rank-two). quotient-tate-exact applied to p_f J₁(N) → J₁(N) → A_f → 0 identifies V_ℓ(A_f) with V_ℓ(J₁(N))/p_f. Hence V_ℓ(A_f) is free of rank 2 over ℚ_ℓ ⊗ T₁(N)/p_f = ℚ_ℓ ⊗ K_f, of ℚ_ℓ-dimension 2[K_f : ℚ] = 2 dim A_f.

**Checks.**

- Check on N = 11 (dimension 1) and N = 23 (dimension 2).

*Needs:* Tate module of the actual modular quotient (`ModularCurvesPartII:R14.5/quotient-tate-exact`); H¹ is free of rank two over the Hecke algebra (`ModularCurvesPartII:R14.3/betti-free-rank-two`); The Hecke prime and coefficient field of a newform (`ModularCurvesPartII:R14.5/newform-hecke-prime`); `AbelianSchemesAndArithmeticModuli:A4`.

### R14.5.5 Differentials on A_f

Prove `TauCeti.ModularCurves.modular_quotient_differentials` with the following mathematical specification. For the Albanese-action quotient q_f:J₁(N)→A_f defined here, cotangent pullback identifies H⁰(A_f,Ω¹)⊗ℂ with the span of f^σ, σ:K_f↪ℂ, inside S₂(Γ₁(N),ℂ)=Cot₀(J₁(N)_ℂ). If A_f^Pic is instead constructed with the Picard action on the same model, its separately defined quotient map has cotangent image w_ζ of this span over a field containing ζ. The two quotient maps are not identified without this transport.

Conrad's warning: the Picard action on Cot₀ is the Petersson adjoint of the classical action; w_ζ conjugates one action into the other.

(ribetstein, Appendix by B. Conrad, p. 68 (printed page; PDF page 72): The cotangent identification and the adjoint warning.)

Construct and prove this as follows. Cot₀(A_f) ↪ Cot₀(J₁(N)) is the subspace killed by p_f for the induced action on cotangent spaces. For the Albanese action this is the classical action; the p_f-eigenspace of S₂(Γ₁(N), ℂ) is ⊕_σ ℂ f^σ (multiplicity one for newforms), of dimension [K_f : ℚ] = dim A_f.

**Checks.**

- Fix the Hecke-action convention before identifying differentials; the two choices differ by w_ζ.
- For a separately constructed Picard quotient retain the w_ζ transport; never change the action on the already defined Albanese quotient.

*Needs:* The modular abelian variety A_f (`ModularCurvesPartII:R14.5/modular-quotient`); Shimura's theorem: dim A_f = [K_f : ℚ] (`ModularCurvesPartII:R14.5/modular-quotient-dimension`); Hecke operators are self-adjoint for the w_ζ-twisted pairing (`ModularCurvesPartII:R14.3/hecke-twisted-self-adjoint`); The weight-two Shimura isomorphism is Hecke-equivariant (`ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism`); `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`; Upper and lower Jacobian Hecke operators (`ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`); Polarization and Hecke adjoints (`ModularCurvesPartII:R14.2/weil-pairing-adjointness`).

### R14.5.6 Trivial character: the quotient of J₀(N)

Prove `TauCeti.ModularCurves.trivial_character_J0` with the following mathematical specification. If χ_f is trivial, let p_f⁰ ⊂ T₀(N) be the kernel of the eigenvalue map on the Hecke algebra of J₀(N). Then A_f⁰ := J₀(N)/p_f⁰J₀(N) is an abelian variety over ℚ of dimension [K_f : ℚ], and the map J₀(N) → J₁(N) (pullback along X₁(N) → X₀(N)) induces an isogeny A_f⁰ → A_f compatible with the K_f-actions.

The pullback J₀(N) → J₁(N) is Hecke-equivariant with finite kernel.

(ribetstein, Chapter 2, §2.3.1.2, p. 29 (printed; PDF page 33): The construction applied to J₀(N).)

Construct and prove this as follows. Apply the J₁ argument to J₀(N) with H¹(X₀(N)) free of rank 2 over ℚ ⊗ T₀(N) (same proof as betti-free-rank-two). The composite J₀(N) → J₁(N) → A_f kills p_f⁰J₀(N) and is nonzero on V_ℓ; compare dimensions.

**Checks.**

- Consumers (EllipticCurveModularity R29.5) use the J₀(N) quotient; keep the isogeny explicit.
- Diamond eigenvalues must all equal one; a nontrivial-character form is not assigned a J₀ quotient.

*Needs:* Shimura's theorem: dim A_f = [K_f : ℚ] (`ModularCurvesPartII:R14.5/modular-quotient-dimension`); Diamond operators (`ModularCurvesPartII:R14.1/diamond-operators`); Compactified Hecke degeneracy maps (`ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`); Modular Jacobians and norms (`ModularCurvesPartII:R14.2/jacobian-and-functoriality`); Upper and lower Jacobian Hecke operators (`ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`).

### R14.5.7 Oldforms: A_f inside J₁(M) for N | M

Prove `TauCeti.ModularCurves.oldform_comparison` with the following mathematical specification. Let f have primitive level N and weight two, and let N|M. For the anemic Hecke algebra at level M, the rational abelian factor attached to the Galois orbit of f is isogenous over Q to A_f^{τ(M/N)}, where τ counts positive divisors. The degeneracy images for d|M/N give that factor up to isogeny. This uses the complete fixed-character oldspace and cross-level multiplicity-one theorem imported from ModularForms Layers 4/5; an eigenvector at raised level can be a linear combination of these images. The simple isogeny factor A_f is attached to the primitive eigensystem, whereas the full raised-level anemic quotient has the stated larger dimension.

The anemic operators exclude primes dividing M. Character transport is the fixed character of f pulled to modulus M; do not count a different character’s oldspace.

(ribetstein, §3.6, p. 40; Corollary 5.9, pp. 69–70; Theorem 5.14, p. 73: The two old images at a prime and the rational Tate/dimension theorem motivate the geometric transfer. The complete all-divisor analytic theorem is imported from its existing owner, not attributed to that discussion.)

Construct and prove this as follows. Import the fixed-character oldspace basis {V_d f:d|M/N} and the completeness/unique primitive-pair statement. For each Galois conjugate the basis has τ(M/N) independent images; the leading q exponent proves independence, and imported completeness excludes other forms with that primitive eigensystem. Use weight-two Shimura comparison to identify the rational Hecke block, then Poincaré complete reducibility and the degeneracy homomorphisms to obtain the Q-isogeny.

**Checks.**

- M=N gives one copy; M=Np with p∤N gives two; M=Np² gives three, not four.
- No mod-ℓ saturation follows from this rational isogeny statement.

*Needs:* `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`; `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`; `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`; The weight-two Shimura isomorphism is Hecke-equivariant (`ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism`); Shimura's theorem: dim A_f = [K_f : ℚ] (`ModularCurvesPartII:R14.5/modular-quotient-dimension`); Compactified Hecke degeneracy maps (`ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`); Classical and geometric Hecke actions (`ModularCurvesPartII:R14.1/analytic-comparison-of-correspondences`); `AbelianSchemesAndArithmeticModuli:A6`.

### R14.5.8 The Abel–Jacobi composite to A_f is nonconstant

Prove `TauCeti.ModularCurves.abel_jacobi_composite_nonzero` with the following mathematical specification. For any supplied rational base point c∈X₁(N)(Q), the composite q_f∘AJ_c:X₁(N)→A_f is nonconstant and sends c to zero. The same assertion holds for a supplied point of X₀(N) and its trivial-character quotient. The argument uses A_f≠0 and the generation of the Jacobian by AJ_c; it does not require the rational-cusp construction of R14.6.

A_f ≠ 0; the Abel–Jacobi map and its universal property are Tau Ceti JacobianChallenge Layer F.

(ribetstein, Appendix by B. Conrad, p. 74 (printed page; PDF page 78): Conrad's use of a rational cusp as base point.)

Construct and prove this as follows. Import AJ_c and its universal property for the supplied rational point. If the composite is constant, its value is zero because AJ_c(c)=0. Since the image of AJ_c generates J, the quotient homomorphism is zero, contradicting surjectivity onto A_f≠0.

**Checks.**

- No isogeny to a target curve is asserted here (that is EllipticCurveModularity R29.5).

*Needs:* The modular abelian variety A_f (`ModularCurvesPartII:R14.5/modular-quotient`); Shimura's theorem: dim A_f = [K_f : ℚ] (`ModularCurvesPartII:R14.5/modular-quotient-dimension`); `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`.

### Examples

A rational-eigenvalue newform gives [K_f:ℚ]=1 and a dimension-one A_f. For a coefficient field of degree d, V_ℓA_f has ℚ_ℓ-dimension 2d, not d. At raised level M the anemic factor has τ(M/N) degeneracy copies: all divisors of M/N appear. The kernel of a character ℚ×ℚ→ℚ selecting the first factor is the second factor; conjugating through an injective field homomorphism leaves the kernel unchanged.

### Dependencies

`ModularCurvesPartII:R14.2`; `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`; `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`; `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`; `mathlib:RingHom.ker`; `mathlib:RingHom.quotientKerEquivRange`; `AbelianSchemesAndArithmeticModuli:A6`; `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`; `AbelianSchemesAndArithmeticModuli:A4`; `ModularCurvesPartII:R14.3`; `ModularCurvesPartII:R14.1`; `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`. Individual target dependencies above give the finer contracts.

## Layer R14.6: bad-prime and finite cover interfaces

Extend actual generic endomorphisms to the appropriate Néron models, prove the special-fibre weight-two identity and export the modular semistable and finite-cover data. The quaternionic character pivot is a concrete missing geometric input. Taylor–Wiles freeness is over the diamond group ring and does not assert Hecke multiplicity one.

### R14.6.1 Reduction of the supplied modular Hecke action

Prove `TauCeti.ModularCurves.neron_hecke_extension` with the following mathematical specification. Apply R14.2’s existing Néron extension of the actual modular Hecke endomorphisms. At p∤N, reduce them on the good abelian fibre J_p; at semistable primes use the induced torus, character and component-group maps of R11.6. The degeneracy morphisms of curves need not extend across their correspondence prime in the same form; the Jacobian endomorphism is what is reduced.

Pic⁰_{X₁(N)/ℤ[1/N]} is an abelian scheme, hence the Néron model of its generic fibre.

(ribetstein, Appendix by B. Conrad, p. 72 (printed page; PDF page 76): The extension.)

Construct and prove this as follows. Import the endomorphisms and their already-owned generic Néron extension. Take the appropriate special fibre; apply the generic functoriality on tori, characters and components. Match the reduced operator to the specific modular correspondence on the special fibre.

**Checks.**

- The degeneracy maps π_i^{(p)} themselves do not exist over ℤ[1/N] near p; only the induced endomorphisms extend.

*Needs:* Modular Jacobians and norms (`ModularCurvesPartII:R14.2/jacobian-and-functoriality`); Upper and lower Jacobian Hecke operators (`ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`); `NeronModelsAndSemistableAbelianVarieties:R11.6`.

### R14.6.2 The Eichler–Shimura relation

Prove `TauCeti.ModularCurves.special_fibre_eichler_shimura` with the following mathematical specification. For p∤N and J_p=Pic⁰(X₁(N)_Fp), let F be the p-power Frobenius endomorphism and V its Verschiebung, so FV=VF=[p]. In End_Fp(J_p), the Albanese Hecke operator satisfies (T_p)_*=F+⟨p⟩_*V. Over F̄_p, for a chosen primitive Nth root ζ, w_ζ⁻¹Fw_ζ=⟨p⟩_*⁻¹F. This is the weight-two special-fibre relation exported to R19.1; identification of a selected eigencomponent’s Galois characteristic polynomial is the consumer’s theorem.

p prime, p∤N; the supplied proper curve and its Jacobian have good reduction. V is the actual Verschiebung, identified with the polarization dual of F; w_ζ is only required over the field containing ζ.

(ribetstein, Theorem 5.16 and proof, pp. 74–79: The actual Jacobian endomorphism identity, its w_ζ conjugation and the Frobenius/Verschiebung convention.)

Construct and prove this as follows. On the ordinary dense locus, the good-prime isogeny correspondence consists of the Frobenius graph and its transpose with the diamond twist; import this special-fibre correspondence statement from R14.1/R13.2. Equality of correspondence actions on degree-zero divisors yields equality of Jacobian endomorphisms by Albanese functoriality; extend by density. For w_ζ use Frobenius on level roots of unity and the dual isogeny relation, exactly as in Conrad’s proof.

**Checks.**

- The extra w_ζ relation is part of the statement; it is used to identify the characteristic polynomial of Frobenius (AutomorphicGaloisRepresentations R19.1).

*Needs:* Reduction of the supplied modular Hecke action (`ModularCurvesPartII:R14.6/neron-hecke-extension`); `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin`; `ModularCurvesPartII:R13.2/small-level-and-dm-boundaries`; `ModularCurvesPartII:R13.2/agreement-with-katz-mazur-schemes`; `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`; Compactified Hecke degeneracy maps (`ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`); Diamond operators (`ModularCurvesPartII:R14.1/diamond-operators`); Integral étale correspondence trace (`ModularCurvesPartII:R14.1/integral-etale-trace`); Upper and lower Jacobian Hecke operators (`ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`); Polarization and Hecke adjoints (`ModularCurvesPartII:R14.2/weil-pairing-adjointness`); `AbelianSchemesAndArithmeticModuli:A4`.

### R14.6.3 Cusp-normalised Abel–Jacobi maps

Define `TauCeti.ModularCurves.abelJacobiInfty` with the following mathematical specification. Use the supplied rational cusp ∞ of X₀(N), and a specified rational cusp c of the chosen X₁(N) point-of-exact-order moduli model (Conrad uses 0), to specialize the imported AJ construction: AJ_c(x)=[x−c]. It is over Q, sends c to zero and is a closed immersion when the genus is positive. For a degeneracy morphism α:X′→X and rational cusp c′, α_*AJ_{c′}(x)=AJ_c(α(x))+[α(c′)−c]. Hecke compatibility is on degree-zero divisors; without a base-point correction this is not an equality of point maps.

Rationality is proved for the chosen cusp and moduli model; the cusp named ∞ on X₁(N) is not assumed rational in every model.

(ribetstein, Appendix by B. Conrad, p. 74 (printed page; PDF page 78): The base-point choice.)

The interface serves EllipticCurveModularity:R29.5: A rational normalized curve map once the modular quotient is identified; ModularCurvesPartII:R14.6/special-fibre-eichler-shimura: The Albanese description with a rational point on the good fibre.

Provide the following named interface results.

- `TauCeti.ModularCurves.abelJacobiInfty`: The imported AJ for X₀(N), based at its supplied rational cusp ∞.
- `TauCeti.ModularCurves.abelJacobiInfty_cusp`: AJ_∞(∞)=0.
- `TauCeti.ModularCurves.abelJacobiInfty_injective`: AJ_∞ is a closed immersion for genus at least one; no immersion conclusion for genus zero.
- `TauCeti.ModularCurves.abelJacobi_changeBase`: AJ_b(x)=AJ_c(x)−AJ_c(b).
- `TauCeti.ModularCurves.abelJacobi_degeneracy`: α_*AJ_{c′}(x)=AJ_c(αx)+[αc′−c].
- `TauCeti.ModularCurves.abelJacobi_hecke`: On degree-zero divisors D, the induced endomorphism sends [D] to [T(D)] using the chosen Picard/Albanese convention.

Construct and prove this as follows. Import cusp fields and the precise moduli model from R12.3; select the rational cusp there. Instantiate JacobianChallenge Layer F’s actual morphism and immersion theorem. Compute pushforward of [x−c′] to obtain the base-point correction; compute the Hecke action on degree-zero divisors.

**Checks.**

- `abelJacobi_X011`: For the genus-one curve X₀(11), AJ_∞ is an isomorphism with its Jacobian.
- `abelJacobi_genus0`: For X₀(1), the Jacobian and AJ image are zero; the curve map is not injective.
- `abelJacobi_baseChange_test`: For any supplied rational cusp b, AJ_b(b)=0 and AJ_b(x)=AJ_∞(x)−AJ_∞(b).
- `abelJacobi_degeneracy_offset`: If [αc′−c]≠0, the uncorrected identity α_*AJ_{c′}=AJ_c∘α fails already at c′.
- No modular parametrisation of an elliptic curve is asserted here.

*Needs:* `ModularCurvesPartII:R12.3/cusp-fields-and-component-labels`; `ModularCurvesPartII:R12.6/canonical-generic-fibre-descent`; `ModularCurvesPartII:R13.2/gamma-level-structures`; `ModularCurvesPartII:R13.2/agreement-with-katz-mazur-schemes`; Compactified Hecke degeneracy maps (`ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`); Diamond operators (`ModularCurvesPartII:R14.1/diamond-operators`); Cyclotomic Fricke involution (`ModularCurvesPartII:R14.1/atkin-lehner-involution`); Modular Jacobians and norms (`ModularCurvesPartII:R14.2/jacobian-and-functoriality`); `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`.

### R14.6.4 The modular supersingular character lattice

Define `TauCeti.ModularCurves.supersingularDegreeZero` with the following mathematical specification. For the mixed level Γ₁(M)∩Γ₀(p), M≥5 and p∤M, use R13.5’s split geometric semistable fibre: its two smooth components are the two copies of X₁(M)_F̄p and they meet at the finite supersingular level-point set S. Orient every edge from the first component to the second. The toric character group is canonically Z[S]⁰=ker(Σ:Z[S]→Z), compatibly with good-prime Hecke correspondences, diamonds and geometric Frobenius (including the action on orientations). Thickness is retained in the monodromy pairing rather than in this unweighted boundary map.

The two-component description is a supplied theorem for the mixed Γ₀(p) model, not a claim about X₁(Mp). If a regular model introduces subdivisions, compare graph homology by contraction; the stable thickness data must be preserved.

(ribetstein, §3.9, pp. 44–46; §3.10.2, p. 48: The semistable mixed-level Jacobian has a toric part and two good-reduction Jacobian factors; character groups carry the level-change action.)

The interface serves ModularCurvesPartII:R14.6/modular-monodromy: The concrete integral lattice carrying the monodromy form; SerreWeightAndLevelOptimisation:R20.2: The actual toric lattice, with degeneracy and Hecke maps.

Provide the following named interface results.

- `TauCeti.ModularCurves.supersingularDegreeZero`: The kernel of total sum on the free abelian module on the supplied finite set S.
- `TauCeti.ModularCurves.mem_supersingularDegreeZero`: A combination belongs exactly when its coefficients sum to zero.
- `TauCeti.ModularCurves.supersingularDifference`: For s,t∈S, the generator [s]−[t].
- `TauCeti.ModularCurves.supersingularDifference_diagonal`: The difference with equal endpoints is zero.
- `TauCeti.ModularCurves.supersingularDegreeZero_graph`: For the supplied two-component fibre, this kernel is the actual integral H₁ graph lattice and torus character group.
- `TauCeti.ModularCurves.supersingularDegreeZero_correspondence`: A supplied geometric graph correspondence induces its character map via incidence chains; no division by an edge multiplicity is used.
- `TauCeti.ModularCurves.supersingularDegreeZero_ext`: Two elements of the degree-zero lattice are equal when every supersingular coefficient agrees.

Construct and prove this as follows. Import the actual fibre normalization, nodes and their correspondences from R13.5. Its dual graph has two vertices and edges S; the boundary of each edge is v₂−v₁, so the cycle lattice is ker Σ. Import R11.4’s X*(torus)=H₁(dual graph,Z), and transport the actual operators through the incidence-chain description.

**Checks.**

- `supersingularDegreeZero_singleton`: With one supersingular edge the kernel is zero.
- `supersingularDegreeZero_two`: With two edges the kernel is generated by (1,−1) and is free of rank one.
- `supersingularDegreeZero_difference`: For distinct s,t, [s]−[t] is a nonzero degree-zero element.
- `supersingularDegreeZero_notComponent`: The one-loop lattice with edge thickness h has character rank one for every h, although its component cokernel has order h.
- If |S|=s≥1, rank X*=s−1.
- Character group means integral graph homology, not its dual or the component group.

*Needs:* One-factor mixed-level models (`ModularCurvesPartII:R13.5/one-factor-mixed-level-model`); Modular dual graphs and thicknesses (`ModularCurvesPartII:R13.6/modular-dual-graphs`); `NeronModelsAndSemistableAbelianVarieties:R11.4`; Reduction of the supplied modular Hecke action (`ModularCurvesPartII:R14.6/neron-hecke-extension`).

### R14.6.5 Modular monodromy and component sequence

Prove `TauCeti.ModularCurves.modular_monodromy` with the following mathematical specification. For the actual semistable modular Jacobian at p and its supplied regular or weighted stable dual graph, transport R11.4’s integral monodromy map μ:X*(J^∨)→Hom(X*(J),Z). The sequence 0→X*(J^∨)→Hom(X*(J),Z)→Φ_J(F̄p)→0 is exact. Under the principal polarization and graph identification, μ is the edge pairing Σ_e h_e a_e b_e, with positive thickness h_e; a regular semistable model uses h_e=1. It is perfect over Q but need not be unimodular over Z. The ℓ-primary component group is its tensor cokernel, including ℓ dividing the determinant.

Use the actual model; the component sequence is geometric over F̄p with descent action retained.

(ribetstein, §3.9, pp. 44–46; §3.10.2, p. 48: The modular character and component groups enter level lowering; the generic integral monodromy theorem is imported from R11.4.)

Construct and prove this as follows. Import the dual character lattice and monodromy sequence from R11.4. Identify it with the graph intersection pairing via R13.5’s supplied node thicknesses. Use Néron functoriality to compare endomorphisms and their adjoints; derive the Hecke action on Φ from the cokernel.

**Checks.**

- For two vertices joined by two edges of thickness one, the generator (1,−1) has monodromy value 2 and component cokernel Z/2.
- No ℓ-primary information is recovered by inverting ℓ first.

*Needs:* The modular supersingular character lattice (`ModularCurvesPartII:R14.6/supersingular-character-lattice`); `NeronModelsAndSemistableAbelianVarieties:R11.4`; One-factor mixed-level models (`ModularCurvesPartII:R13.5/one-factor-mixed-level-model`); Modular dual graphs and thicknesses (`ModularCurvesPartII:R13.6/modular-dual-graphs`).

### R14.6.6 Integral modular character maps and exactness

Prove `TauCeti.ModularCurves.character_degeneracy_sequences` with the following mathematical specification. Every supplied degeneracy homomorphism of semistable modular Jacobians induces the contravariant character map and the compatible monodromy/component diagram of R11.6. For a supplied exact sequence of special-fibre tori 0→T₁→T→T₂→0, the resulting character sequence 0→X*(T₂)→X*(T)→X*(T₁)→0 is integral and Hecke-equivariant. An old/new abelian isogeny decomposition alone does not provide this exact torus sequence: the concrete modular integral kernel, cokernel and saturation must be computed from the graph maps. The pivot character sequence 0→X_p(J_pq(K))→X_q(J(K,pq))→X_q(J(K,q))²→0 of Ribet–Stein (3.2) requires its quaternionic/Cerednik–Drinfeld input and remains an explicitly recorded ownership/source gap in this part.

All tori and maps in an exactness assertion are specified geometric objects; if only an isogeny is known, retain its finite lattice error. J_pq(K) in the pivot sequence is a Shimura-curve Jacobian, not a modular-curve Jacobian of level pq.

(ribetstein, §3.10.2, equation (3.2), p. 48: The pivot sequence includes a different Shimura-curve Jacobian; the Cerednik–Drinfeld proof is cited but not supplied by that reference.)

Construct and prove this as follows. Import generic character functoriality, then identify the specific maps on the normalization graph supplied by R13.5. Dualize a proved exact torus sequence; compute any finite lattice error instead of erasing it by rationalization. For the pivot sequence retain the explicit quaternionic term and request the missing model-to-graph comparison with its correct owner; do not re-prove level lowering here.

**Checks.**

- A finite isogeny kernel can give a nonzero finite character cokernel.
- The character maps reverse the direction of torus maps.

*Needs:* Modular monodromy and component sequence (`ModularCurvesPartII:R14.6/modular-monodromy`); The modular supersingular character lattice (`ModularCurvesPartII:R14.6/supersingular-character-lattice`); `NeronModelsAndSemistableAbelianVarieties:R11.6`; One-factor mixed-level models (`ModularCurvesPartII:R13.5/one-factor-mixed-level-model`); Modular dual graphs and thicknesses (`ModularCurvesPartII:R13.6/modular-dual-graphs`); Degeneracy maps on modular components (`ModularCurvesPartII:R13.6/degeneracy-on-components`).

### R14.6.7 The semistable modular Tate filtration

Prove `TauCeti.ModularCurves.semistable_tate_interface` with the following mathematical specification. For an actual semistable modular Jacobian J over Q_p and ℓ≠p, import the saturated filtration T_ℓ(J)_t⊂T_ℓ(J)_f⊂T_ℓ(J), with T_t≅Hom(X*(J),Z_ℓ(1)), T_f=T_ℓ(J)^{I_p}, and T_f/T_t the Tate module of the abelian part of the special fibre. The ranks are t,t+2a,2(t+a), respectively. Identify the inertia/monodromy map with the modular monodromy pairing and the induced Hecke maps. This is the actual integral input for R20’s ramification arguments; the p-adic semistable representation case belongs to p-adic comparison owners.

ℓ≠p and actual semistable reduction; no claim T_f=T^{I_p} at ℓ=p.

(ribetstein, §3.9, pp. 45–46; §3.10.3, pp. 48–49: Toric torsion embeds into inertia-fixed modular Jacobian torsion; the semistable comparison is imported from its general owner.)

Construct and prove this as follows. Apply R11.3 and the actual toric character computation. Use modular-monodromy and its imported R11.4 graph comparison to match the monodromy operator and Weil pairing. Transport the supplied degeneracy and Hecke maps through the filtration. Use the lower-tier R11.3 Tate filtration and R11.4 graph comparison for this modular application. No completion of the higher-tier weights roadmap is needed; its nearby-cycle interpretation belongs to the weights owner.

**Checks.**

- The toric torsion is Hom(X*,μ_ℓ), with the cyclotomic twist.
- Inertia invariants of residual torsion need not be the reduction of integral invariants; the finite monodromy cokernel matters.

*Needs:* Modular monodromy and component sequence (`ModularCurvesPartII:R14.6/modular-monodromy`); `NeronModelsAndSemistableAbelianVarieties:R11.3`.

### R14.6.8 The finite Taylor–Wiles modular cover

Define `TauCeti.ModularCurves.taylorWilesLevel` with the following mathematical specification. Fix odd residue characteristic ℓ and a finite set Q of primes q∤Nℓ with q≡1 mod ℓ. Let H_q be the prime-to-ℓ subgroup of (Z/q)× and Δ_q=(Z/q)×/H_q, Δ_Q=∏Δ_q. At q, Γ̄_Q has Γ₀(q) level and Γ_Q is the inverse image of H_q under the diamond quotient. Retain the fixed base level at N, and intersect both groups with the same auxiliary Γ₁(R), with R≥5 a prime coprime to Nℓ∏Q, to remove stabilizers. Then Γ_Q⊲Γ̄_Q with quotient Δ_Q, and Y_Q→Ȳ_Q is an actual finite étale analytic cover with that deck group. Complex conjugation ξ=diag(−1,1) normalizes both groups and acts trivially on Δ_Q. For the actual H¹(Y_Q,O), define M_Q^- as the kernel of ξ+1, and then take the specified anemic and selected U_q-root localization.

O complete DVR finite over Z_ℓ; all auxiliary cover data and level maps are fixed. The open cover is unramified; its compactification can ramify at cusps and is not assumed étale there. Selected residual roots are distinct, and the cyclotomic-determinant specialization uses q≡1 and α_qβ_q=1.

(TAYLOR-WILES, Definition of Δ_Q, Γ_Q, Γ̄_Q and auxiliary R, author pp. 4–7; Proposition 1, pp. 7–8: The actual finite diamond cover and minus cohomology module used in the freeness proof.)

The interface serves ModularCurvesPartII:R14.6/taylor-wiles-freeness: Actual geometric O[Δ_Q]-module for the freeness theorem; ModularCurvesPartII:R14.6/augmentation-control: The level quotient whose augmentation specialization returns the base module.

Provide the following named interface results.

- `TauCeti.ModularCurves.taylorWilesLevel`: The congruence subgroup Γ_Q and its cover of the specified Γ̄_Q quotient.
- `TauCeti.ModularCurves.taylorWilesLevel_quotient`: Γ̄_Q/Γ_Q≅Δ_Q, with the actual diamond action.
- `TauCeti.ModularCurves.taylorWilesLevel_conjugation`: ξ fixes Δ_Q and commutes with its action on H¹.
- `TauCeti.ModularCurves.taylorWilesMinus`: The ξ=−1 submodule of the actual cover H¹, before the specified commuting Hecke localization.
- `TauCeti.ModularCurves.mem_taylorWilesMinus`: x lies in M^- iff ξx=−x.
- `TauCeti.ModularCurves.taylorWilesMinus_projector`: Since 2 is a unit, (1−ξ)/2 projects to the minus submodule.
- `TauCeti.ModularCurves.taylorWilesMinus_coefficients`: Coefficient change and deck/Hecke-equivariant morphisms commute with minus projection under the proved base-change hypotheses.
- `TauCeti.ModularCurves.taylorWilesMinus_ext`: Two minus classes are equal if their images in the actual cover H¹ agree.

Construct and prove this as follows. Build the subgroup from the actual congruence conditions and identify its finite diamond quotient using the Chinese remainder map. Import the torsion-free analytic quotients and their cover action; verify ξ conjugation on the congruence subgroup and quotient. Use the actual group/Betti H¹ module with deck action, form its minus eigenspace and complete/localize the commuting Hecke action.

**Checks.**

- `taylorWilesMinus_id`: If ξ=id and 2 is invertible, the minus module is zero.
- `taylorWilesMinus_neg`: If ξ=−id, the minus module is the whole module.
- `taylorWilesMinus_swap`: For ξ(x,y)=(y,x) on O², the minus submodule is {(a,−a):a∈O}.
- `taylorWilesLevel_empty`: For Q empty the diamond quotient is trivial and the selected cover is the base cover.
- `taylorWilesMinus_two`: In characteristic two the kernel of ξ+1 need not be a complementary direct summand; the projector statement requires 2 invertible.
- Q=empty gives Δ_Q=1 and the fixed auxiliary base-level module.
- The choice of root is part of the Hecke localization, not a new definition of an abstract free module.

*Needs:* Finite and adic parabolic cohomology (`ModularCurvesPartII:R14.3/parabolic-cohomology`); Hecke operators with relative coefficients (`ModularCurvesPartII:R14.3/geometric-hecke-coefficients`); Diamond operators (`ModularCurvesPartII:R14.1/diamond-operators`); Compactified Hecke degeneracy maps (`ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`); `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

### R14.6.9 Finite-level Taylor–Wiles freeness

Prove `TauCeti.ModularCurves.taylor_wiles_freeness` with the following mathematical specification. For the actual cover and O of taylor-wiles-cover, H¹(Y_Q,O)^− is finite free over O[Δ_Q], with rank equal to rank_O H¹(Ȳ_Q,O)^−. Each commuting completed anemic/selected-root Hecke localization is an O[Δ_Q]-direct summand and is therefore also finite free. At the non-Eisenstein ideals of R14.3, boundary removal identifies this with the compact cuspidal module. Reduction modulo πⁿ yields a finite free (O/πⁿ)[Δ_Q]-module of the same rank. The plus eigenspace and Hecke-rank-one multiplicity claims are not conclusions of Proposition 1.

Odd ℓ; Δ_Q is an abelian ℓ-group; the congruence group Γ̄_Q is torsion-free and free of finite rank. The finite-level identification with cohomology modulo πⁿ uses localized-freeness or the minus-cochain computation, not merely a claim that rational invariants commute with integral reduction.

(TAYLOR-WILES, Proposition 1 and proof, author pp. 7–8: The minus cocycle/direct-summand argument proves finite group-ring freeness and its base rank.)

Construct and prove this as follows. Apply Shapiro: H¹(Γ_Q,O)=H¹(Γ̄_Q,O[Δ_Q]). Since Γ̄_Q is free, its cocycle module is finite free over O[Δ_Q]. ξ acts trivially on Δ_Q, so all coboundaries are in the plus eigenspace; minus H¹ equals minus cocycles, a projective summand. O[Δ_Q] is local for a finite ℓ-group over the complete DVR, so that finite projective module is free. Over Frac(O), finite cover descent identifies Δ_Q invariants with base cohomology, giving the stated rank; prove coefficient reduction by the same finite free minus complex. Completed commuting Hecke localization is an idempotent summand; use boundary removal only for the stated non-Eisenstein modules. Apply Mathlib groupCohomology.coindIso for Shapiro; the new work is its compatibility with the tree cochain sequence or finite diamond cover.

**Checks.**

- This is freeness over O[Δ_Q], not over the localized Hecke algebra.
- For Δ_Q of order ℓ, the O-rank is ℓ times the O[Δ_Q]-rank.
- Nothing is asserted about weight-one coherent cohomology by this weight-two argument.

*Needs:* The finite Taylor–Wiles modular cover (`ModularCurvesPartII:R14.6/taylor-wiles-cover`); Finite generation and localized integral freeness (`ModularCurvesPartII:R14.3/localized-freeness`); Non-Eisenstein removal of the boundary (`ModularCurvesPartII:R14.3/boundary-non-eisenstein`); `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `mathlib:groupCohomology.coindIso`; Apply the existing local group-ring algebra to diamond groups (`ModularCurvesPartII:R14.6/diamond-group-ring-local`); `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

### R14.6.10 Augmentation and selected-root specialization

Prove `TauCeti.ModularCurves.augmentation_control` with the following mathematical specification. Let I_Q be the augmentation ideal of O[Δ_Q]. For the minus modules of the actual covers, M_Q^-/I_QM_Q^- identifies with H¹(Ȳ_Q,O)^−, via Shapiro’s induced-coefficient complex and its augmentation. At the cyclotomic-determinant Taylor–Wiles roots of taylor-wiles-root-control, successive root selection at q∈Q identifies the localized base-side module with the fixed-level localized module. All maps commute with anemic Hecke operators and reduction modulo πⁿ. A finite free O[Δ_Q] module M satisfies rank_O(M/I_QM)=rank_{O[Δ_Q]}M; this numerical fact is used only after the actual geometric specialization map has been proved.

The same auxiliary R-level is retained at both ends. Removing R requires a separate checked level-control argument and its source hypotheses. Distinct residual roots, q∤Nℓ and odd ℓ; no repeated-root specialization.

(TAYLOR-WILES, Proof of Proposition 1, author pp. 7–8: The free-group/Shapiro computation supplies the module used for augmentation control.) (CALEGARI-GERAGHTY, Lemma 9.6, pp. 88–90: Distinct-root finite-level control identifies the auxiliary Γ₀(q) level with the selected fixed-level module.)

Construct and prove this as follows. On the Shapiro free-group complex, augmentation is coefficient change O[Δ_Q]→O. The degree-zero coboundaries are plus, so minus projection and its H¹ commute with this change. Use finite group-ring freeness and the exact minus complex to prove augmentation and coefficient compatibility. Apply the finite-level degeneracy root-control theorem successively; retain the actual root idempotents. Export the geometric module and specialization data to generic patching owners, which own inverse systems and the ring theorem.

**Checks.**

- A rank equality without the specialization morphism is insufficient.
- This does not remove an auxiliary R-level on its own.

*Needs:* Finite-level Taylor–Wiles freeness (`ModularCurvesPartII:R14.6/taylor-wiles-freeness`); Taylor–Wiles degeneracy control (`ModularCurvesPartII:R14.4/taylor-wiles-root-control`); `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`.

### R14.6.11 Apply the existing local group-ring algebra to diamond groups

Prove `TauCeti.ModularCurves.diamond_group_ring_local` with the following mathematical specification. For the actual finite abelian ℓ-group Δ_Q and DVR O of taylor-wiles-cover, specialize the current Tau Ceti local-group-ring and local-augmentation theorems to obtain IsLocalRing O[Δ_Q]. The maximal ideal is the inverse image of the maximal ideal of O under augmentation, generated by that ideal and [δ]−1. Apply the pinned finite-flat-over-local-ring freeness theorem to the finite projective minus module. This node imports these algebra facts and records their modular hypotheses; it plans no second generic local-group-ring theorem.

Δ is the finite diamond group of taylor-wiles-cover; the assertion is not made for a finite group of order prime to ℓ.

(TAYLOR-WILES, Proof of Proposition 1, author pp. 7–8: The minus cohomology is projective over the local diamond group ring, hence free.)

Construct and prove this as follows. Read the current declarations TauCeti.MonoidAlgebra.isLocalRing_of_isPGroup and isLocalHom_lift_one_of_isPGroup: the inputs are a commutative local ring, a prime ℓ with ¬IsUnit(ℓ:O), and a finite commutative ℓ-group. The actual diamond group and residue characteristic supply precisely these inputs. Use the existing augmentation and its kernel-span description to identify the maximal ideal; the local augmentation is surjective. Apply Module.free_of_flat_of_isLocalRing to the finite projective module (projective implies flat); finite generation is essential. Integration of the post-pin group-ring module is explicitly recorded as a gap, rather than claimed at f790474.

**Checks.**

- Δ=1 recovers O.
- For Δ=C₂ and ℓ odd the group ring has distinct trivial and sign factors, so this local-ring conclusion is false.

*Needs:* The finite Taylor–Wiles modular cover (`ModularCurvesPartII:R14.6/taylor-wiles-cover`); `mathlib:Module.free_of_flat_of_isLocalRing`.

### Examples

For a supersingular set with one element the degree-zero character lattice is zero; for two elements it is ℤ generated by [s]−[t]. Positive thicknesses change its monodromy index. For the swap involution on O² the minus vectors are (a,−a); for ξ=−id the minus module is all of M, and for ξ=id it is zero when 2 is invertible. In characteristic 2 plus and minus cease to split. With Q empty the cover and augmentation are identity maps. For Q nonempty, rank agreement is checked only after the geometric augmentation and selected-root maps have been proved.

### Dependencies

`ModularCurvesPartII:R14.2`; `NeronModelsAndSemistableAbelianVarieties:R11.6`; `ModularCurvesPartII:R13.2`; `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`; `ModularCurvesPartII:R14.1`; `AbelianSchemesAndArithmeticModuli:A4`; `ModularCurvesPartII:R12.3`; `ModularCurvesPartII:R12.6`; `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`; `ModularCurvesPartII:R13.5`; `ModularCurvesPartII:R13.6`; `NeronModelsAndSemistableAbelianVarieties:R11.4`; `NeronModelsAndSemistableAbelianVarieties:R11.3`; `ModularCurvesPartII:R14.3`; `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`; `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`; `mathlib:groupCohomology.coindIso`; `ModularCurvesPartII:R14.4`; `mathlib:Module.free_of_flat_of_isLocalRing`. Individual target dependencies above give the finer contracts.

## Downstream consumers

AutomorphicGaloisRepresentations R19.1 imports R14.6/special-fibre-eichler-shimura in weight two. From T_p=F+⟨p⟩V and FV=p it deduces the good-prime characteristic polynomial; it does not independently reprove the special-fibre geometry. Higher Sym^(k−2) congruence remains R19’s result. This is the scoped transfer required by RT-AREA-langlands-2/9. R20 consumes the one-factor mixed-level fibre, its graph, component maps and weighted character pairing. The quaternionic J′_(pq) pivot is retained as the exact missing input to the integral two-prime character sequence, rather than inferred from a rational old/new isogeny. R22 consumes the finite cover minus-module freeness, augmentation and distinct-root control, with no claim of a patching theorem here. NC.5 consumes level-13 split-Cartan good reduction for its local-height result.

## Remaining exact proof obligations

These are the nine recorded gaps. The conditional statements above retain them; no theorem is exported beyond its stated coefficient, level or geometric range.

### Wild coarse bad-level interior models at 2 and 3

The required arbitrary-N Γ₀(pⁿM) component/multiplicity target and R20 cases include p=2,3. Edixhoven’s exact interior invariant-ring/minimal-resolution formulas are proved for p>3. Česnavičius gives all-prime coarse cusp regularity and regularity away from exceptional interior j-values, not the missing wild local equations. Required calculation: use imported cyclic deformation rings, compute the actual finite stabilizer action at level-dividing 2 or 3 (including infinitesimal inertia), identify normal invariant completions and their multiplicities, resolve and export branch/thickness maps. A tame order-2/3 eigencharacter argument is insufficient. The fine rigidified one-p-factor uv=p model is separated from this coarse descent gap.

The affected targets are `ModularCurvesPartII:R13.5/gamma-zero-prime-power-local-model`, `ModularCurvesPartII:R13.5/tame-regular-resolution`, `ModularCurvesPartII:R13.5/one-factor-mixed-level-model`, `ModularCurvesPartII:R13.6/modular-dual-graphs`, `ModularCurvesPartII:R13.6/degeneracy-on-components`.

### Relative curve norm and principal polarization contract

JacobianChallenge D proves the field curve Jacobian. A0-extension supplies relative Picard space, lifting and a neutral-component criterion; it does not by itself supply the curve-specific relative canonical principal polarization/norm theorem over ℤ[1/N]. The request to A0-extension and AbelianSchemes A2 names this exact additional comparison. No fictional relative Jacobian carrier or field-only-to-relative inference is made.

The affected targets are `ModularCurvesPartII:R14.2/jacobian-and-functoriality`, `ModularCurvesPartII:R14.2/hecke-operators-on-the-jacobian`, `ModularCurvesPartII:R14.2/integral-hecke-algebra`, `ModularCurvesPartII:R14.2/tate-module-with-galois-and-hecke-actions`.

### Integral cuspidal-symbol realization contract

Current ModularForms Layer 8 constructs the full Γ₁-coinvariant module Div⁰(P¹(ℚ))⊗Sym and a Hecke-equivariant period quotient onto the form-side image. It explicitly does not require an isomorphism of its whole module with S_k⊕conj(S_k); boundary/Eisenstein classes and integral torsion must be handled. The local R14.2 comparison target must construct the weight-two cuspidal boundary kernel modulo torsion and identify its integral Hecke action with compact-curve H₁, or the appropriately transposed dual H¹, retaining all diamond and bad-prime conventions. Determine exact kernels at the integral level, rather than inferring them from rational dimensions or period injectivity on forms. The J/Betti/Tate comparison remains separate and justified.

The affected targets are `ModularCurvesPartII:R14.2/integral-hecke-realization-comparison`.

### Integral higher-weight boundary and lattice range

Deligne supplies rational Sym^r cohomology. Prove the exact good-prime Hecke eigensystems on H⁰ and cusp inertia cohomology for Sym^r integral coefficients; specify residual ideals where they vanish and where reduction and saturated parabolic comparison hold. For ℓ≤r symmetrization need not be perfect: choose a divided-power/dual lattice with a sourced comparison or retain a weaker pairing. The present conditional theorem does not claim unconditional integral freeness or perfectness in that range. The symbol comparison must identify the standard representation with the dual geometric relative-H¹ coefficient system, including determinant twists, and prove the Manin/geodesic relative-chain presentation on B. Deligne and the rational even-weight boundary model do not by themselves establish this integral identification.

The affected targets are `ModularCurvesPartII:R14.3/parabolic-duality`, `ModularCurvesPartII:R14.3/boundary-non-eisenstein`, `ModularCurvesPartII:R14.3/localized-freeness`, `ModularCurvesPartII:R14.3/symbols-geometric-comparison`.

### Deep input to the S-arithmetic congruence kernel theorem

Serre 1970 §2.6 gives the correct real-place specialization, but its proof depends on central Mennicke-symbol/congruence-kernel calculations and the Moore/class-field-theory input. Those intermediate theorems have not been decomposed against the baseline. A follow-up must supply that exact proof chain; an unrelated profinite arithmetic action theorem cannot replace it.

The affected targets are `ModularCurvesPartII:R14.4/congruence-subgroup-property`.

### Tree fundamental edge and enhanced congruence-character proof

The lattice tree of SL₂(ℚ_p), its type-preserving action without inversion and the local amalgam are imported from ReductiveGroupsPartII RG2.2/sl2-tree and RG2.2/ihara-amalgam, and strong approximation with reduction surjectivity prime to p from AdelicAlgebraicGroups AA.4/strong-approximation-sufficiency and AA.4/strong-approximation-finite-places (dependencyAdditions). Still missing for modular-amalgam: Serre’s theorem that a group acting on a tree without inversion with a segment as fundamental domain is the amalgam of the two vertex stabilizers over the edge stabilizer (Trees I §4.1 Theorem 6, p. 48), which ReductiveGroupsPartII uses inside the proof of ihara-amalgam but does not state as a target, and the finite congruence-quotient sublemmas of the principal-level argument. Refine the CDT Corollary 4.5.3 conjugation-invariance criterion against existing finite-group APIs. This is a proof-chain gap, not permission to erase the congruence subspace from ordinary Ihara. For congruence-invariance, supply the exact continuous-cohomology, Künneth and Hochschild–Serre proof interfaces, Lazard’s uniform-group calculation, adjoint-cohomology vanishing, and a reproducible proof of the level-8/16 computations used in CDT §4.5.11. These source inputs are not declarations established by the pinned ordinary H¹ carrier.

The affected targets are `ModularCurvesPartII:R14.4/modular-amalgam`, `ModularCurvesPartII:R14.4/enhanced-ihara`, `ModularCurvesPartII:R14.4/congruence-invariance`.

### Integral modular old/new and quaternionic pivot exactness

Ribet–Stein §3.10.2 equation (3.2), p. 48 involves a quaternionic Shimura-curve Jacobian J′_{pq}(K). The exact sequence 0→X_p(J′_{pq}(K))→X_q(J(K,pq))→X_q(J(K,q))²→0 needs the specific Cerednik–Drinfeld identification and integral Hecke-compatible maps. Generic Néron functoriality and a rational old/new isogeny do not establish this integral sequence. Keep the conditional torus theorem here; arrange a lower-tier geometric interface before the higher Hilbert/Shimura-curve roadmap consumes it, or explicitly narrow the requested consumer. Retain finite cokernels and component groups until that proof is supplied.

The affected targets are `ModularCurvesPartII:R14.6/character-degeneracy-sequences`.

### Extensions of the exact Ihara consumer range

The compact constant-coefficient Γ₁(N) result includes ℓ|N on characteristic-zero curves and has no exceptional residual-image hypothesis. It does not by itself prove level lowering, nor a uniform Sym^r/coarse Γ₀(N) or characteristic-ℓ fibre result. R20/R22 must use the stated fine/mixed-level weight-two prefix, or specify a sourced further injectivity theorem with its stabilizer, coefficient and exceptional-image hypotheses; Γ₀(N) has a Shimura-subgroup kernel.

The affected targets are `ModularCurvesPartII:R14.4/compact-ihara`, `ModularCurvesPartII:R14.4/taylor-wiles-root-control`.

### Integrate existing post-pin diamond group-ring algebra

The current Tau Ceti commit a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 implements TauCeti.MonoidAlgebra.isLocalRing_of_isPGroup and isLocalHom_lift_one_of_isPGroup in TauCeti/Algebra/MonoidAlgebra/LocalRing.lean, with augmentation and ker_augmentation_eq_span in Exactness.lean. They are absent at f790474. Import the existing implementation when updating the baseline; do not plan or prove a duplicate. The pinned prototype does not import that post-pin module.

The affected targets are `ModularCurvesPartII:R14.6/diamond-group-ring-local`.

## Supplier obligations for the assembly

These contracts supplement the exact direct node references. They name missing interfaces with their consumers. The broad references to R13.5, R14.1 and R14.2 inside this part, and to R12.3, R12.5, R12.6 and R13.2 of the earlier part, have instead been resolved to existing nodes; a request is not repeated where the consumer already cites the supplier’s exact node.

### From `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`

Import the prime N≥5 diamond quotient cusp package over ℤ[1/N]: Tate torsion/level covers, integral closures, cusp labels, widths, characteristic-2/3 ramification and stabilizers; establish identity-compatible agreement rather than rebuilding it.

Consumed by `ModularCurvesPartII:R14.1/atkin-lehner-involution`, `ModularCurvesPartII:R14.1/exact-divisor-atkin-lehner`.

### From `SchemeAndStackFoundations:SF.2`

Coherent restriction, flat base change and dualizing sheaves for proper flat nodal curves; torsion-free sections are determined on a schematically dense locus, including the formal-completion restriction when each component meets the boundary. Additional consuming contract: Integrate the general finite-coefficient étale–Betti comparison with locally constant coefficients, compact support, traces and cup products required by accepted RS-06 as UPSTREAM:CohomologicalPointCounting:ComplexComparison:etale-Betti. Also supply finite-generation/Mittag–Leffler inverse-limit exactness and comparison to the pinned pro-étale EllAdicCohomology carrier. The checkout has no resolvable roadmap anchor for that RS-06 upstream label; do not substitute de Rham comparison.

Consumed by `ModularCurvesPartII:R14.1/coherent-hecke-trace`, `ModularCurvesPartII:R14.3/integral-comparison`.

### From `tauceti:TauCetiRoadmap/ModularCurves#2b-isogenies-and-quotients`

Elliptic quotients by finite locally free subgroup schemes, the universal quotient isogeny and its degree; no new elliptic-curve or quotient carrier is defined here.

Consumed by `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`, `ModularCurvesPartII:R14.1/atkin-lehner-involution`, `ModularCurvesPartII:R14.1/exact-divisor-atkin-lehner`, `ModularCurvesPartII:R14.1/full-and-cyclic-correspondences`.

### From `tauceti:TauCetiRoadmap/ModularCurves#2e-cartiernishi-duality-and-the-weil-pairing`

Relative Weil pairing on elliptic torsion, alternating perfection and compatibility with an isogeny, including the multiplier equal to its degree.

Consumed by `ModularCurvesPartII:R14.1/atkin-lehner-involution`.

### From `tauceti:TauCetiRoadmap/ModularCurves#7f-serretate-theory-with-level-structure`

The universal ordinary elliptic deformation with Serre–Tate parameter and the supersingular one-dimensional deformation, including Frobenius/Verschiebung torsion and Drinfeld-generator conditions. The exact current ModularCurves Layer 7F–7H and Layer 8C outputs are imported, not re-planned.

Consumed by `ModularCurvesPartII:R13.5/igusa-components`.

### From `tauceti:TauCetiRoadmap/ModularCurves#7e-p-divisible-groups`

Import the existing elliptic PD-3 target: relative Frobenius and Verschiebung in characteristic p with V∘F=[p]=F∘V, together with the PD-1 finite locally free torsion levels and Cartier duality from Layer 2E. Quotients remain the existing Layer 2B interface; these elliptic notions are not new A3 definitions. Additional consuming contract: for the ordinary-locus proof of the special-fibre Eichler–Shimura relation (Conrad, Theorem 5.16), use PD-2 (connected–étale sequence over a henselian local base, giving the connected and étale order-p subgroups of an ordinary curve and of its lifts) and PD-5 (the ordinary/supersingular dichotomy).

Consumed by `ModularCurvesPartII:R13.5/igusa-components`, `ModularCurvesPartII:R14.6/special-fibre-eichler-shimura`.

### From `tauceti:TauCetiRoadmap/ModularCurves#7g-the-three-characteristic-p-calculations`

Deformations of elliptic isogenies and their finite-flat kernels on the universal deformation ring; preserve inseparable cases and the chosen source/target local moduli.

Consumed by `ModularCurvesPartII:R13.5/gamma-zero-prime-power-local-model`.

### From `AlgebraicModuliForArithmeticGeometry:R09.5`

For a regular local ring finite over its invariant subring, a finite residue-trivial group of order invertible in the residue field has regular invariants exactly when its cotangent image is generated by pseudo-reflections. Use this tame quotient criterion only in the stated scope. This is an additional supplier contract requested from the quotient owner, not an assertion that its current R09.5 packet already has a pseudo-reflection node. Current ModularCurves 9C supplies only its more restricted Katz–Mazur quotient criteria.

Consumed by `ModularCurvesPartII:R13.5/corrected-coarse-singular-locus`.

### From `tauceti:TauCetiRoadmap/StableReduction#layer-4-blowups-and-intersection-theory-on-arithmetic-surfaces`

Existing arithmetic-surface blowups, total transforms, exceptional self-intersection, contractions of admissible −1 curves, regular resolutions and compatibility with flat base change. This part adds only the modular input rings and stabilizer actions.

Consumed by `ModularCurvesPartII:R13.5/tame-regular-resolution`, `ModularCurvesPartII:R13.5/split-cartan-thirteen-good-reduction`.

### From `tauceti:TauCetiRoadmap/ModularCurves#8c-the-axiomatic-isomorphism-theorem-and-the-rings-of-63`

Import the actual cyclic-generator comparison and its supersingular deformation rings; combine with Layer 7F–7H and the existing rigidifier/representability package. The mixed-level node supplies only the modular one-factor component calculation.

Consumed by `ModularCurvesPartII:R13.5/one-factor-mixed-level-model`.

### From `tauceti:TauCetiRoadmap/StableReduction#layer-7-semistable-reduction`

Import the existing semistable-reduction existence theorem with identified generic fibre. Canonical contraction to the unpointed stable model is a separate Layer 8 input, for genus at least two.

Consumed by `ModularCurvesPartII:R13.5/prime-square-semistable-model`.

### From `tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs`

Existing dual multigraph of a proper nodal curve with loops, multiple edges, arithmetic genus Σ g_v+b₁ and the branch data; import rather than define a second graph carrier.

Consumed by `ModularCurvesPartII:R13.5/split-cartan-semistable-model`, `ModularCurvesPartII:R13.6/modular-dual-graphs`.

### From `NeronModelsAndSemistableAbelianVarieties:R11.4`

Comparison of the Néron identity fibre with Pic⁰ of a proper regular semistable curve, the thickness-weighted graph monodromy pairing and its component-group discriminant. Import the general theorem; this part supplies the modular component/branch data. Additional consuming contract: Generic graph identification X*(T)=H₁(dual graph,Z), weighted monodromy into its Z-dual and component-group cokernel, retaining all node thicknesses and primary torsion.

Consumed by `ModularCurvesPartII:R13.6/modular-character-group-interface`, `ModularCurvesPartII:R14.6/supersingular-character-lattice`, `ModularCurvesPartII:R14.6/modular-monodromy`.

### From `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`

Existing double-coset Hecke algebra/action and its full-subgroup multiplication convention; this part realizes those relations on the actual integral modular correspondence.

Consumed by `ModularCurvesPartII:R14.1/composition-relations-of-correspondences`, `ModularCurvesPartII:R14.1/analytic-comparison-of-correspondences`, `ModularCurvesPartII:R14.2/integral-hecke-algebra`.

### From `tauceti:TauCetiRoadmap/ModularForms#layer-3-the-petersson-inner-product-adjoints-oldforms-and-newforms`

Existing abstract Hecke/diamond relations and bad-prime U convention; import, never build another abstract Hecke algebra.

Consumed by `ModularCurvesPartII:R14.1/composition-relations-of-correspondences`.

### From `EtaleDualityAndPerverseSheaves:EDC.6`

Integral comparison with complex H¹ and compatibility of its trace/cup product with finite curve maps; Tate twist in the Jacobian comparison.

Consumed by `ModularCurvesPartII:R14.1/integral-etale-trace`.

### From `SchemeAndStackFoundations:SF.5`

Projection formula for proper pushforward and flat pullback of curve cycles on a product of proper curves; numerical degree of pullback along a finite curve map is its degree times the original degree.

Consumed by `ModularCurvesPartII:R14.1/projective-boundary-hecke-and-degree`.

### From `AlgebraicModuliForArithmeticGeometry:A0-extension`

For a proper smooth geometrically connected curve over ℤ[1/N], relative Picard representability, smooth/proper neutral component and base change, using the existing A0-extension nodes picard-space-representability, picard-zero-criterion and picard-infinitesimal-lifting. Supply the curve-specific relative norm and canonical principal polarization with pullback/norm duality; JacobianChallenge D alone is only a field theorem.

Consumed by `ModularCurvesPartII:R14.2/jacobian-and-functoriality`.

### From `AbelianSchemesAndArithmeticModuli:A2`

Dual abelian schemes, canonical principal polarization of a relative curve Jacobian, and the norm/pullback transpose identity; use the curve-specific relative construction requested in A0-extension.

Consumed by `ModularCurvesPartII:R14.2/jacobian-and-functoriality`.

### From `NeronModelsAndSemistableAbelianVarieties:R11.1`

Néron extension of generic Jacobian homomorphisms over a DVR when the modular coarse fibre is singular; do not claim abelian good reduction at level-dividing primes.

Consumed by `ModularCurvesPartII:R14.2/jacobian-and-functoriality`.

### From `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`

Import the existing integral symbol module 𝕄_N,k, its boundary map, diamond/bad-prime action, and the period-induced quotient onto the form-side Hecke image. Layer 8 proves ker(eval_𝕄)⊆ker(eval_S), not equality. The compact-curve/Jacobian image is compared only after the separate local R14.2 integral cuspidal-symbol contract recorded as a gap; no existing integral Betti isomorphism is attributed to Layer 8. Additional consuming contract: Import the integral homological symbol lattice, Manin presentation, cuspidal boundary map, period functional into the dual of symbols, integral finite Hecke algebra and eigenvalue field; comparison to actual geometric cohomology is new here.

Consumed by `ModularCurvesPartII:R14.2/integral-hecke-algebra`, `ModularCurvesPartII:R14.2/integral-hecke-realization-comparison`, `ModularCurvesPartII:R14.3/betti-free-rank-two`, `ModularCurvesPartII:R14.3/geometric-hecke-coefficients`, `ModularCurvesPartII:R14.3/symbols-geometric-comparison`, `ModularCurvesPartII:R14.5/newform-hecke-prime`.

### From `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`

Existing field-curve Picard/Jacobian scheme theorem with dimension, principal polarization and field-base change. Use it for each geometric fibre; the relative norm/polarization extension is requested separately from A0-extension/A2.

Consumed by `ModularCurvesPartII:R14.2/jacobian-and-functoriality`.

### From `tauceti:TauCetiRoadmap/StableReduction#layer-8-canonical-contraction-and-unpointed-stable-reduction`

Import the canonical contraction of a proper prestable family of genus g≥2, its uniqueness and coherent arbitrary base change. For marked stability use Layer 9 with 2g−2+r>0 instead; do not attribute stabilization to Layer 7.

Consumed by `ModularCurvesPartII:R13.5/prime-square-semistable-model`.

### From `AbelianSchemesAndArithmeticModuli:A4`

Actual ℓ-power torsion and inverse-limit Tate module, its 2g rank and Weil pairing; the curve-Picard Kummer comparison needed in weight-two-tate-comparison. For the weight-two special-fibre calculation include Frobenius/Verschiebung and finite-flat p-torsion connected–étale structure in characteristic p, distinct from the ℓ-invertible Tate comparison.

Consumed by `ModularCurvesPartII:R14.3/relative-coefficient-system`, `ModularCurvesPartII:R14.3/weight-two-tate-comparison`, `ModularCurvesPartII:R14.5/quotient-tate-exact`, `ModularCurvesPartII:R14.5/modular-quotient-dimension`, `ModularCurvesPartII:R14.6/special-fibre-eichler-shimura`.

### From `AbelianSchemesAndArithmeticModuli:A6`

General quotient by a connected abelian subvariety over Q, field of definition, extension across a good-reduction abelian scheme and rational Tate exactness, using Poincaré reducibility. A3 finite-flat-kernel quotients do not alone supply this positive-dimensional quotient.

Consumed by `ModularCurvesPartII:R14.5/modular-quotient`, `ModularCurvesPartII:R14.5/quotient-tate-exact`, `ModularCurvesPartII:R14.5/oldform-comparison`.

### From `EtaleDualityAndPerverseSheaves:EDC.0`

Finite locally constant coefficient cohomology and compact supports on smooth curves, constructibility, finite generation and proper smooth base change for R¹ of the universal elliptic family. Supply j_!, Rj_* and the enhanced coefficient/support categories used for the boundary complex.

Consumed by `ModularCurvesPartII:R14.3/relative-coefficient-system`, `ModularCurvesPartII:R14.3/parabolic-cohomology`, `ModularCurvesPartII:R14.3/integral-comparison`, `ModularCurvesPartII:R14.3/boundary-exact-sequence`, `ModularCurvesPartII:R14.3/geometric-hecke-coefficients`.

### From `EtaleDualityAndPerverseSheaves:EDC.2`

Curve Poincaré–Lefschetz/étale duality with coefficient duals and twists; restrict to the parabolic image and prove integral perfection only under the displayed torsion and boundary vanishings. Use the trace-purity target for finite étale pullback/trace, trace∘pullback=degree and the projection formula; use its pairing target for duality. These are not supplied by the EDC.3 cycle-class target.

Consumed by `ModularCurvesPartII:R14.3/parabolic-duality`, `ModularCurvesPartII:R14.3/weight-two-tate-comparison`, `ModularCurvesPartII:R14.3/geometric-hecke-coefficients`.

### From `NeronModelsAndSemistableAbelianVarieties:R11.3`

Semistable integral Tate filtration at ℓ≠p: T_tor⊂T_f=T^{I_p}⊂T, toric term Hom(X*(T),Z_ℓ(1)), finite quotient T_ℓ of the abelian reduction; keep saturation hypotheses.

Consumed by `ModularCurvesPartII:R14.6/semistable-tate-interface`.

### From `NeronModelsAndSemistableAbelianVarieties:R11.6`

Generic Néron extension and contravariant maps on characters; exact character sequences only when an exact sequence of reduction tori is given. This does not prove exactness for an arbitrary old/new modular isogeny.

Consumed by `ModularCurvesPartII:R14.6/neron-hecke-extension`, `ModularCurvesPartII:R14.6/character-degeneracy-sequences`.

### From `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`

Use the current all-degeneracy-map oldspace span and primitive conductor/newform input; for f of conductor N at level M count the copies indexed by d|M/N, retaining arbitrary linear combinations.

Consumed by `ModularCurvesPartII:R14.3/betti-free-rank-two`, `ModularCurvesPartII:R14.5/newform-hecke-prime`, `ModularCurvesPartII:R14.5/oldform-comparison`.

### From `tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`

Use the current strong multiplicity-one/eigenform characterization to identify the primitive simple factor independently of the ambient old level; no new analytic multiplicity-one proof is planned.

Consumed by `ModularCurvesPartII:R14.3/betti-free-rank-two`, `ModularCurvesPartII:R14.5/oldform-comparison`.

### From `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`

Use the current coefficient-field and Galois-conjugate rationality statements to descend the weight-two differential block and its Hecke ideal.

Consumed by `ModularCurvesPartII:R14.5/newform-hecke-prime`, `ModularCurvesPartII:R14.5/modular-quotient-differentials`, `ModularCurvesPartII:R14.5/oldform-comparison`.

### From `tauceti:TauCetiRoadmap/JacobianChallenge#layer-f-abeljacobi-and-the-universal-property`

Use the supplied generic Abel–Jacobi morphism x↦[x−c], its cotangent/universal property and change-of-base-point formula; this part only specializes the modular rational cusp and quotient composite.

Consumed by `ModularCurvesPartII:R14.3/weight-two-tate-comparison`, `ModularCurvesPartII:R14.5/abel-jacobi-composite-nonzero`, `ModularCurvesPartII:R14.6/rational-cusp-abel-jacobi`.

### From `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-2-relative-singular-chains-and-homology`

Use current relative/twisted singular chains, functoriality and compactification-pair homology; the specific modular-symbol comparison and tree stabilizers remain here.

Consumed by `ModularCurvesPartII:R14.3/parabolic-cohomology`, `ModularCurvesPartII:R14.3/symbols-geometric-comparison`, `ModularCurvesPartII:R14.4/lyndon-exact-sequence`.

### From `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`

Use current cochains with local coefficients, relative/compact-support cohomology, cup product and Poincaré–Lefschetz duality with the chosen orientation; no new generic twisted cochain definition is planned.

Consumed by `ModularCurvesPartII:R14.3/weight-two-shimura-isomorphism`, `ModularCurvesPartII:R14.3/cup-product-petersson`, `ModularCurvesPartII:R14.3/parabolic-cohomology`, `ModularCurvesPartII:R14.3/boundary-exact-sequence`, `ModularCurvesPartII:R14.3/integral-comparison`, `ModularCurvesPartII:R14.3/parabolic-duality`, `ModularCurvesPartII:R14.3/localized-freeness`, `ModularCurvesPartII:R14.3/symbols-geometric-comparison`, `ModularCurvesPartII:R14.4/lyndon-exact-sequence`, `ModularCurvesPartII:R14.6/taylor-wiles-cover`, `ModularCurvesPartII:R14.6/taylor-wiles-freeness`.

### From `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-2-hyperbolic-polygons-and-cofinite-groups`

Supply finite type of the torsion-free congruence quotient, its finite graph deformation retract and finitely generated free fundamental group, with the exact fine/auxiliary-level hypotheses.

Consumed by `ModularCurvesPartII:R14.3/localized-freeness`, `ModularCurvesPartII:R14.6/taylor-wiles-cover`.

### From `EtaleDualityAndPerverseSheaves:EDC.1`

Supply the localization triangle j_!L→Rj_*L→i_*i^*Rj_*L through the open/closed adjunction and localization API. Its local inertia stalk calculation is a specific required input, not a cycle-class theorem in EDC.3.

Consumed by `ModularCurvesPartII:R14.3/boundary-exact-sequence`.

### From `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-5-bundles-covers-products-and-finite-cover-descent`

Use finite-cover/local-coefficient descent, transfer, Cartan–Leray and permutation coefficient systems; Shapiro itself is already pinned. Keep noninvertible deck orders and derived invariants explicit.

Consumed by `ModularCurvesPartII:R14.3/relative-coefficient-system`, `ModularCurvesPartII:R14.4/lyndon-exact-sequence`, `ModularCurvesPartII:R14.6/taylor-wiles-cover`, `ModularCurvesPartII:R14.6/taylor-wiles-freeness`, `ModularCurvesPartII:R14.6/augmentation-control`.

## Source corrections used in the targets

Each record below is registered, with its independent verdict, in the canonical packet named in its heading; this part lists them for the reader and does not register them again. The R13.3 and R14.3 packets both use the numbers E1–E3, for different findings, so a record is identified by its packet and number. The descriptions are paraphrases. For editions or correction texts that were inaccessible, the scope of the earlier review’s finding is retained explicitly.

### ModularCurvesPartII/E1 (R13.3 packet)

Gross–Zagier (1986), Chapter III Proposition (1.4), p.255, published scan sha256 8afee839cdc0e2056c6dcbe348e39c0a6aa27344125d8c3b80dd735f2e6d9521. In our words: The singular exception is restricted to supersingular extra-automorphism points. For p>3 also include ordinary mixed (a,b), a,b>0, extra-automorphism points of the elliptic level pair; use Edixhoven’s resolution. At p=2,3 keep the wild calculation separate. At p=5,N=25, the ordinary j=1728 point on (1,1) has effective order-2 cotangent action (−x,−y), hence singular invariants. It is not supersingular.

Known: Edixhoven 1990 §1.1.4–1.1.5, pp.35–36, identifies the omission and gives the corrected locus and resolution.

Provenance: research/blueprint/packets/ModularCurvesPartII--R13.3.json; ModularCurvesPartII/E1; REV-ModularCurvesPartII--R13.3.

### ModularCurvesPartII/E2 (R13.3 packet)

Bakker–Tsimerman (2016), §2.1–2.2, pp.713–715 (fine-moduli assertion on p.715), published PDF sha256 814976eeb93367cf0810bb0f9c514709a6474bfb7202ddb2834d33dd6a25f40a. In our words: The scalar-equivalence framing problem is described as fine. Use its coarse moduli curve or rigidify the ubiquitous central inversion; do not claim a universal elliptic family descends to the scalar quotient. [−1] acts as scalar −1 on E[p], fixes a projective framing and is a nonidentity automorphism of its unrigidified object.

new; the linked metric erratum does not correct this moduli convention.

Provenance: research/blueprint/packets/ModularCurvesPartII--R13.3.json; ModularCurvesPartII/E2; REV-ModularCurvesPartII--R13.3.

### ModularCurvesPartII/E3 (R13.3 packet)

Bakker–Tsimerman (2016), §2.5, p.717, published PDF sha256 814976eeb93367cf0810bb0f9c514709a6474bfb7202ddb2834d33dd6a25f40a. In our words: The cyclic isogeny correspondence is assigned degree σ₁(m). Use ψ(m) for the cyclic correspondence; σ₁(m) is the degree of the full order-m subgroup correspondence. The unfiltered divisor boundary union is full-subgroup data, so filter by cyclicity for the cyclic definition. At m=4, subgroup E[2] is noncyclic: seven order-4 subgroups, six cyclic. The three (a,d) families have 4+2+1 branches but only 4+1+1 cyclic branches.

new; neither the author metric erratum nor the checked journal/arXiv listing gives a correction to this convention.

Provenance: research/blueprint/packets/ModularCurvesPartII--R13.3.json; ModularCurvesPartII/E3; REV-ModularCurvesPartII--R13.3.

### ModularCurvesPartII/E4 (R13.3 packet)

Bakker–Tsimerman (2016), §2.5, pp.716–717, two smooth-locus polygon domains, published PDF sha256 814976eeb93367cf0810bb0f9c514709a6474bfb7202ddb2834d33dd6a25f40a. In our words: The auxiliary C_(pm)→C_p map and the C_p power map have component domains written as ℤ/m. The first has component domain ℤ/(pm) and reduction modulo p; the second has domain ℤ/p and identity component index. The auxiliary first map has degree m² and is used only for its p-torsion identification; it is not the degree-m isogeny. C_r smooth locus is Gₘ×ℤ/r. The first map has smooth-locus kernel μ_m times a component subgroup of order m, while p∤m makes its map on p-torsion an isomorphism.

new; the inspected erratum does not address these domains.

Provenance: research/blueprint/packets/ModularCurvesPartII--R13.3.json; ModularCurvesPartII/E4; REV-ModularCurvesPartII--R13.3.

### ModularCurvesPartII/E5 (R13.3 packet)

Bakker–Tsimerman (2016), §2.2, p.715, published PDF sha256 814976eeb93367cf0810bb0f9c514709a6474bfb7202ddb2834d33dd6a25f40a. In our words: The unrigidified stack of generalized p-gons is assigned cusp stabilizer order p. Its raw pointed generalized-elliptic automorphism group is μ_p×{±1}, of order 2p in characteristic zero. Order p is the effective stabilizer after central inversion is rigidified; use that effective stack for the (2,3,p) orbifold. The source itself gives the two factors of the p-gon automorphism group; inversion persists on the unframed object. Correspondingly the raw interior orders 4,6 become effective 2,3. On Gₘ×ℤ/p, α_ζ(u,c)=(ζ^c u,c) and inversion ι(u,c)=(u⁻¹,−c) commute, so the pointed automorphism group may be written as a direct product. The order distinction is the finding.

new; the inspected metric erratum does not address this stack convention.

Provenance: research/blueprint/packets/ModularCurvesPartII--R13.3.json; ModularCurvesPartII/E5; REV-ModularCurvesPartII--R13.3.

### ModularCurvesPartII/E6 (R13.3 packet)

Conrad, author PDF dated 18 July 2006, Theorem 4.3.4 p.38 and the final component clause of Theorem 4.3.6 p.40, sha256 f53e4ff819d534926e6ee59874cbce4e7bad4a315cbd6d05984b8405b11f15d8. In our words: For d>2 the component labels use both a unit b modulo d and a positive divisor r of d; the subsequent chart clause asserts a unique positive-divisor lift. Use φ(d)/2 cyclotomic components indexed by b modulo sign. A unit r modulo N/d selects an embedding of the cyclotomic field. Keep the marked twist exponent −r(b′)⁻¹, and allow arbitrary residue lifts rather than a unique positive divisor. Automorphisms identify r modulo N/d and inversion identifies (r,b) with (−r,−b). N=d=5 consequently has two 5-gon cusps, whereas the printed indexing gives eight; N=d=4 similarly has one rather than six. For N=d=5 the unique residue class modulo 1 has at least the positive-divisor lifts 1 and 5.

Known component overcount: Frederick Vu, 2023 UCLA dissertation A map in Sharifi’s conjecture for general non-exceptional characters and tame level, §3.2.2, discussion explicitly pointing out the error in Conrad Theorem 4.3.4 (eScholarship item 4th7g01n, indexed text inspected; PDF pagination unavailable through the access challenge). The related positive-lift uniqueness failure is checked here directly. Journal text was not accessible; this finding asserts the inspected author version only.

Provenance: research/blueprint/packets/ModularCurvesPartII--R13.3.json; ModularCurvesPartII/E6; REV-ModularCurvesPartII--R13.3.

### ModularCurvesPartII/E7 (R13.3 packet)

Conrad, author PDF dated 18 July 2006, Example 2.5.1, p.18, sha256 f53e4ff819d534926e6ee59874cbce4e7bad4a315cbd6d05984b8405b11f15d8. In our words: The branchwise mth-power map between the proper formal Tate n-gon curves is asserted finite flat of degree m. Keep a finite pointed morphism of generic degree m and finite locally free rank-m restriction on the smooth loci. For m>1 the proper map is not flat at the nodes. After base change to a field the target node XY=tᵐ maps to xy=t via X=xᵐ,Y=yᵐ. Its closed-node fibre is k[x,y]/(xy,xᵐ,yᵐ), with basis 1,x,…,x^(m−1),y,…,y^(m−1) and length 2m−1. For m=2 this is 3, unlike generic rank 2. This obstruction is independent of the characteristic. The distinct moduli maps of Theorem 4.4.3 and the formal Gₘ power map used in §4.5 are unaffected.

Identified by REV-ModularCurvesPartII--R13.3, whose source/correction search found no correction. The journal article was inaccessible, so the finding is scoped to the inspected author version; this consolidation makes no separate novelty claim.

Provenance: research/blueprint/packets/ModularCurvesPartII--R13.3.json; ModularCurvesPartII/E7; REV-ModularCurvesPartII--R13.3.

### ModularCurvesPartII/E1 (R14.3 packet)

Lemma 9.6 proof, arXiv author preprint p. 88; author-hosted Springer-layout PDF p. 120. For the matrix with diagonal entries q+1 and off-diagonal entries T_q, the displayed determinant is T_q²−(q+1)². The determinant is (q+1)²−T_q². The two expressions differ by −1, a unit, so their invertibility tests agree. The 2×2 determinant formula gives a²−b²; at T_q=0 the determinant equals (q+1)².

Present in both author copies read. The publisher lists a 2021 correction but its text was unavailable; confirmation against that correction is requested, and no novelty claim is made.

Provenance: research/blueprint/packets/ModularCurvesPartII--R14.3.json; ModularCurvesPartII/E1; REV-ModularCurvesPartII--R14.3.

### ModularCurvesPartII/E2 (R14.3 packet)

Lemma 9.6 proof, arXiv author preprint p. 89; author-hosted Springer-layout PDF p. 122. The displayed Lyndon segment places H^{i−1}(G) directly before H^i(Γ)²→H^i(H). The segment is H^i(G)→H^i(Γ)²→H^i(H)→H^{i+1}(G), with the two subgroup restrictions and their difference. Serre Trees II §2.8 Proposition 13, pp. 168–170, or the long exact sequence of the tree cochain short exact sequence, fixes the degrees. Degree-zero invariants already require H⁰(G) before H⁰(Γ)².

Present in both author copies read. The publisher lists a 2021 correction but its text was unavailable; confirmation against that correction is requested, and no novelty claim is made.

Provenance: research/blueprint/packets/ModularCurvesPartII--R14.3.json; ModularCurvesPartII/E2; REV-ModularCurvesPartII--R14.3.

### ModularCurvesPartII/E3 (R14.3 packet)

Lemma 4.5.11, second displayed invariant dimension and ensuing semisimplification claim: author preprint p. 31; published JAMS offprint p. 663, proof p. 664 and application pp. 664–665. The level-5 term uses F₃ coefficients and claims zero SL₂(F₅)-invariants, also after semisimplification. Use F₅ in the level-5 term, as the proof of Theorem 4.5.2 requires when ℓ=5. Keep F₃ at level 3 and F₂ at levels 4/8/16. The printed level-5/F₃ invariant-vanishing assertion cannot be exported. X(5) has genus zero and 12 cusps. Its ordinary H¹ with F₃ coefficients identifies through residues with the kernel of the total-sum map F₃^{12}→F₃. The constant vector is a nonzero SL₂(F₅)-invariant vector in that kernel because 12=0 in F₃. Thus the printed zero dimension is false. With F₅, this counterexample disappears and the stated level-5 Brauer-character calculation supplies the case used in Theorem 4.5.2.

Present in the author preprint and published offprint read. No correction was found in the publisher or author listings searched; novelty remains unconfirmed. The intended coefficient is determined by the proof’s ℓ=5 application.

Provenance: research/blueprint/packets/ModularCurvesPartII--R14.3.json; ModularCurvesPartII/E3; REV-ModularCurvesPartII--R14.3.

## References

Locators in the target statements use these exact editions. Bibliographic date and printed pagination are separated from author revisions and PDF page numbers.

### conrad07

Brian Conrad. [Arithmetic moduli of generalized elliptic curves](https://math.stanford.edu/~conrad/papers/kmpaper.pdf). Author PDF dated 18 July 2006; published J. Inst. Math. Jussieu 6 (2007), 209–278; locators use the author PDF’s printed pages.

Read: §2.5 pp.16–18; §§4.3–4.5 pp.37–49, especially Theorems 4.3.4/4.3.6/4.3.7, 4.4.3 and 4.5.1. Accessed 2026-10-13.

SHA-256: `f53e4ff819d534926e6ee59874cbce4e7bad4a315cbd6d05984b8405b11f15d8`.

### ces17

Kęstutis Česnavičius. [A modular description of X₀(n)](https://arxiv.org/pdf/1511.07475). arXiv:1511.07475v2, header 5 October 2017, text dated 6 October 2017; printed pp.1–67.

Read: Lemma 4.7.1 p.49; Theorem 5.13 pp.60–61; §6 pp.62–65 Accessed 2026-10-13.

SHA-256: `94d0532f68812cd97a2fc119377c2adff529d5a2fa03fbda4fe8c2623ba4d0bd`.

### edix90

Bas Edixhoven. [Minimal resolution and stable reduction of X₀(N)](https://www.numdam.org/article/AIF_1990__40_1_31_0.pdf). Published Ann. Inst. Fourier 40 (1990), 31–67, Numdam scan; first PDF page is a repository cover, so use printed page numbers.

Read: §§1.1–1.4 pp.33–47, including mixed ordinary extra-automorphism points; §§2.1–2.4 pp.54–65, including the horizontal components, Igusa conormal calculation and quotient model. Accessed 2026-10-13.

SHA-256: `cff6a257adcae5ca95a9859ec7a0319a363718bac3a40fe8afe146e59da5926a`.

### ribetstein

Kenneth A. Ribet and William A. Stein; appendix Brian Conrad. [Lectures on Serre’s conjectures, including Conrad’s The Shimura construction in weight 2](https://wstein.org/papers/serre/ribet-stein.pdf). Author revision dated 23 November 2010, not identified with the pagination of the 2001 published chapter. Printed page = PDF page minus 4.

Read: §2.3.1 pp.28–29; §§3.5–3.6 pp.39–40; §§3.9–3.11 pp.43–50; Conrad appendix §§5.1–5.3 pp.64–79, including the complete ordinary-locus proof of Theorem 5.16. Accessed 2026-10-13. The R14.3 packet cites the same file as RIBET-STEIN-SERRE-LECTURES.

SHA-256: `e1bf2b5cd14de064bcb48c4ca843251198db74dd8bcfaad63c26f6773f63f604`.

### grosszagier

Benedict H. Gross and Don B. Zagier. [Heegner points and derivatives of L-series](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01388809/fulltext.pdf). Published Invent. Math. 84 (1986), 225–320, MPIM author-hosted scan; locators use journal pages.

Read: Chapter I §§1–2 pp.226–227; Chapter III §1 pp.254–255; Chapter V §1 p.306 Accessed 2026-10-13.

SHA-256: `8afee839cdc0e2056c6dcbe348e39c0a6aa27344125d8c3b80dd735f2e6d9521`.

### bt16

Benjamin Bakker and Jacob Tsimerman. [p-torsion monodromy representations of elliptic curves over geometric function fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf). Published Ann. Math. 184 (2016), 709–744; journal PDF, printed pages.

Read: §§2.1–2.5 pp.713–717; §6 degree setup p.736. Metric, CM incidence and volume estimates have separate owners. Accessed 2026-10-13.

SHA-256: `814976eeb93367cf0810bb0f9c514709a6474bfb7202ddb2834d33dd6a25f40a`.

### bt-erratum

Benjamin Bakker and Jacob Tsimerman. [Errata to p-torsion monodromy representations of elliptic curves over geometric function fields](https://benjamin-bakker.github.io/P.torsion.erratum.pdf). Author-hosted erratum; no date printed on the inspected first pages.

Read: pp.1–2, Proposition 14 and Proposition 26 corrections; metric/CM and bicusp estimates are outside these targets Accessed 2026-10-13.

SHA-256: `db8effa1d3ef6a96c843e8ffad085a0ad03cd86a486f5e6cc3956bd14352acc1`.

### bdmtv19

Jennifer S. Balakrishnan, Netan Dogra, J. Steffen Müller, Jan Tuitman and Jan Vonk. [Explicit Chabauty–Kim for the split Cartan modular curve of level 13](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n3-p06-s.pdf). Published Ann. Math. 189 (2019), 885–944; journal PDF, printed pages.

Read: §6.2–6.3 pp.927–930, Theorems 6.5–6.6, Corollary 6.7, first Baran quartic Accessed 2026-10-13.

SHA-256: `e1aa5f9662b4875404e25e45dd808e2b73223d562191018242ef357a13dff1f8`.

### mz20

David Masser and Umberto Zannier. [Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf). Published Ann. Math. 191 (2020), 635–674; journal PDF, printed pages.

Read: §3.1(ii),(v) pp.645–646, the cyclic modular-polynomial input only Accessed 2026-10-13.

SHA-256: `8b76bfac88374180701992e242d88f5d38fbe0b0cdb39c6c40c3c3fbbb874b60`.

### DELIGNE-355

Pierre Deligne. [Formes modulaires et représentations ℓ-adiques](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf). Séminaire Bourbaki, exposé 355 (1968–1969), pp. 139–172; Numdam scan

Read: §§3.9–3.20 pp.154–159, beginning of §4.1 p.160 and its Corollaire 3.2 p.161; Definitions 3.9/3.10 and Propositions 3.18/3.19/(3.20) checked visually where extraction loses formulas. Accessed 2026-10-13.

SHA-256: `19509c19b0cb056f4a5eba83a48a99f54bb6df0c7a96ab7f4018b0765e1ed98c`.

### RIBET-1984

Kenneth A. Ribet. [Congruence relations between modular forms](https://math.berkeley.edu/~ribet/Articles/icm.pdf). Proceedings ICM Warsaw 1983, published 1984, pp. 503–514; author scan

Read: §§2–4, pp. 506–513: degeneracy maps, Theorem 4.1, Corollary 4.2, Theorem 4.3 and the compact homology argument. Accessed 2026-10-13.

SHA-256: `44f74c2a9e33cfe01b7c890da07bedd97bc9b81cf4883b9b3f3cdfb87826c97c`.

### CDT-2025

Frank Calegari, Vesselin Dimitrov and Yunqing Tang. [The unbounded denominators conjecture](https://arxiv.org/pdf/2109.09040). arXiv:2109.09040 author preprint dated 18 September 2024, fetched 11 October 2026; compared with the author-hosted published JAMS 38 (2025), 627–702 offprint in §§4.4–4.6, pp. 659–666. Node locators distinguish preprint and journal pages.

Read: Author preprint §§4.4–4.6, printed pp. 27–34, including Corollary 4.5.3 and Lemmas 4.6.2–4.6.3. Rechecked the PDF itself; printed pages equal PDF pages. Published offprint §§4.4–4.6, pp. 659–666, including the level-5 coefficient and the proof of Theorem 4.5.2. Accessed 2026-10-13.

SHA-256: `9bffb12953db37d237e75451ed659219d955bf57d55da8dbc09ad888f62956ad`.

### CALEGARI-GERAGHTY

Frank Calegari and David Geraghty. [Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224). arXiv:1207.4224 author preprint, fetched 11 October 2026; comparison with author-hosted Springer-layout copy, PDF pp. 120–123

Read: §9.1, Lemma 9.6 and Remarks 9.7–9.8, pp. 88–90; only the Q, constant-coefficient, finite-level specialization is exported here. Accessed 2026-10-13.

SHA-256: `67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb`.

### SERRE-TREES

Jean-Pierre Serre. [Arbres, amalgames, SL₂](https://www.numdam.org/item/AST_1983__46__1_0.pdf). Astérisque 46, third edition 1983 (original 1977), Numdam scan

Read: II §1.4, Theorem 3 and Corollary 2, p. 110; II §2.8, Proposition 13 and Lyndon example, pp. 168–170. Accessed 2026-10-13.

SHA-256: `7f048d9e38961ee8a082d6c5fc994e61112f809d9b1ade5d6c33d3c79cc8e947`.

### SERRE-CSP

Jean-Pierre Serre. [Le problème des groupes de congruence pour SL₂](https://www.college-de-france.fr/media/jean-pierre-serre/UPL8543926451197744553_Serre_Pb._Congruence_SL2.pdf). Annals of Mathematics 92 (1970), pp. 489–527; author-hosted scan

Read: Introduction pp.489–492 and §§2.4–2.6 pp.496–500, especially Theorem 2 and Corollary 3 for Q with S={infinity,p}. Accessed 2026-10-13.

Primary PDF read through the web PDF renderer; direct byte download returned an access page. No new byte hash is claimed. The earlier independent review records its own verified copy.

### TAYLOR-WILES

Richard Taylor and Andrew Wiles. [Ring-theoretic properties of certain Hecke algebras](https://virtualmath1.stanford.edu/~rltaylor/hecke.pdf). Author manuscript dated 7 October 1994, pp. 1–22; Proposition 1 on pp. 7–8 (published Annals 141 (1995), pp. 553–572 has different pagination)

Read: Author pp.1–8: residual/setup hypotheses, auxiliary fine level and selected-root conventions, Proposition 1 and its full cohomological proof. No patching theorem is planned. Accessed 2026-10-13.

SHA-256: `3a58acd02155b8849871bbc716e30a05072a5fc80bc0e26122a453400b3731b9`.

### FUNKE-MILLSON

Jens Funke and John Millson. [Spectacle cycles with coefficients and modular forms of half-integral weight](https://arxiv.org/pdf/1108.5309). arXiv:1108.5309v1 identifier (26 August 2011); the retrieved author PDF carries the date 27 August 2021.

Read: §2, pp. 7–8; §3.4, pp. 12–13, including Lemma 3.8 and the boundary-coinvariant calculation. Only the modular surface/coefficient model is used. Accessed 2026-10-13.

SHA-256: `225af406ef9020f51e47cd5f4de13434f961a30b19310ecf4c3fd3f45e0ac494`.

Calegari–Geraghty was also compared with the [author-hosted Springer-layout copy](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), SHA-256 `c0ba8de04d5ee92fe1a967f9487df6cb49295590dfd03762a9150a92838225c5`, PDF pp.120–123. CDT was compared with the [published offprint](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), SHA-256 `867026fbcc5592728173e5c4d6a87f58d57a55b0d0d8b0109b9774e84290ee1e`, printed pp.659–666, including Lemma 4.5.11 and its proof on pp.663–664; the coefficient slip persists there. The Calegari–Geraghty publisher correction listing was recorded by the independent input review, but its full text was unavailable; no assertion that it fixes these slips is made.
